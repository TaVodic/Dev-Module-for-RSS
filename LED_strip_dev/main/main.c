// https://github.com/JSchaenzle/ESP32-NeoPixel-WS2812-RMT

#include <driver/adc.h>
#include <stdio.h>

#include "driver/gpio.h"
#include "driver/i2c.h"
#include "driver/uart.h"
#include "esp_log.h"
#include "freertos/FreeRTOS.h"
#include "freertos/timers.h"
#include "ws2812_control.h"


#define I2C_SLAVE_ADDR	0x68
#define TIMEOUT_MS		1000
#define DELAY_MS		1000

static const char *TAG = "I2C TEST";

void app_main(void) {
  ESP_LOGI(TAG, "Testiik");

	i2c_config_t conf = {
		.mode = I2C_MODE_MASTER,
		.sda_io_num = 12,
		.scl_io_num = 13,
		.sda_pullup_en = GPIO_PULLUP_DISABLE,
		.scl_pullup_en = GPIO_PULLUP_DISABLE,
		.master.clk_speed = 400000,
	};
	i2c_param_config(I2C_NUM_0, &conf);

	ESP_ERROR_CHECK(i2c_driver_install(I2C_NUM_0, I2C_MODE_MASTER, 0, 0, 0));

  uint8_t buf[1] = {0x75};
  uint8_t rx_data[1] = {0};

	while (1) {
		i2c_master_write_read_device(I2C_NUM_0, I2C_SLAVE_ADDR, buf, sizeof(buf), rx_data, sizeof(rx_data), TIMEOUT_MS/portTICK_PERIOD_MS);
		ESP_LOG_BUFFER_HEX(TAG, rx_data, sizeof(rx_data));
		vTaskDelay(DELAY_MS/portTICK_PERIOD_MS);
	}
}

/*
#### GPIO ####
GPIO 33 12V_DIS - let floating, do not set anything, when the line 12V will need to be disabled, than set to OUTPUT and pull low.
  gpio_reset_pin(BLINK_GPIO);
  gpio_set_direction(BLINK_GPIO, GPIO_MODE_OUTPUT);
  gpio_set_level(BLINK_GPIO, 1);

#### LED RMT ####
#define RED   0x00FF00
#define GREEN 0xFF0000
#define BLUE  0x0000FF
//#define NUM_LEDS      9
//#define LED_STRIP_PIN 4
GPIO 4 -
  ws2812_control_init();

  struct led_state new_state;
  for (uint8_t i = 0; i < NUM_LEDS; i++)
  {
    new_state.leds[i] = RED;
  }
  ws2812_write_leds(new_state);

### ADC ###
  adc1_config_width(ADC_WIDTH_BIT_12);
  adc1_config_channel_atten(ADC1_CHANNEL_0, ADC_ATTEN_DB_11);


  while (1)
  {
    int val = adc1_get_raw(ADC1_CHANNEL_0);
    printf("Val: %d\n", val);
    vTaskDelay(500 / portTICK_PERIOD_MS);
  }

### UART ###

#define ECHO_TEST_TXD 14
#define ECHO_TEST_RXD 15
#define ECHO_TEST_RTS 13
#define ECHO_TEST_CTS (UART_PIN_NO_CHANGE)

#define ECHO_UART_PORT_NUM      UART_NUM_2
#define ECHO_TASK_STACK_SIZE    2048

static const char *TAG = "UART TEST";

#define BUF_SIZE (1024)

xTaskCreate(echo_task, "uart_echo_task", ECHO_TASK_STACK_SIZE, NULL, 10, NULL);

static void echo_task(void *arg)
{
    //Configure parameters of an UART driver,
    //communication pins and install the driver
    uart_config_t uart_config = {
        .baud_rate = 115200,
        .data_bits = UART_DATA_8_BITS,
        .parity    = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_CTS_RTS,
        .source_clk = UART_SCLK_DEFAULT,
    };
    int intr_alloc_flags = 0;

#if CONFIG_UART_ISR_IN_IRAM
    intr_alloc_flags = ESP_INTR_FLAG_IRAM;
#endif

    ESP_ERROR_CHECK(uart_driver_install(ECHO_UART_PORT_NUM, BUF_SIZE * 2, 0, 0, NULL, intr_alloc_flags));
    ESP_ERROR_CHECK(uart_param_config(ECHO_UART_PORT_NUM, &uart_config));
    ESP_ERROR_CHECK(uart_set_pin(ECHO_UART_PORT_NUM, ECHO_TEST_TXD, ECHO_TEST_RXD, ECHO_TEST_RTS, ECHO_TEST_CTS));

    // Configure a temporary buffer for the incoming data
    uint8_t *data = (uint8_t *) malloc(BUF_SIZE);

    while (1) {
        // Read data from the UART
        int len = uart_read_bytes(ECHO_UART_PORT_NUM, data, (BUF_SIZE - 1), 20 / portTICK_PERIOD_MS);
        // Write data back to the UART
        uart_write_bytes(ECHO_UART_PORT_NUM, (const char *) data, len);
        if (len) {
            data[len] = '\0';
            ESP_LOGI(TAG, "Recv str: %s", (char *) data);
        }
    }
}

### ext INT ###
#include "freertos/queue.h"
#include "freertos/task.h"


#define INPUT_PIN 39
#define LED_PIN 2

int state = 0;
QueueHandle_t interputQueue;

static void IRAM_ATTR gpio_interrupt_handler(void *args)
{
    int pinNumber = (int)args;
    xQueueSendFromISR(interputQueue, &pinNumber, NULL);
}

void LED_Control_Task(void *params)
{
    int pinNumber, count = 0;
    while (true)
    {
        if (xQueueReceive(interputQueue, &pinNumber, portMAX_DELAY))
        {
            printf("GPIO %d was pressed %d times. The state is %d\n", pinNumber, count++, gpio_get_level(INPUT_PIN));
            gpio_set_level(LED_PIN, gpio_get_level(INPUT_PIN));
        }
    }
}

void app_main(void)
{
    gpio_reset_pin(LED_PIN);
    gpio_set_direction(LED_PIN, GPIO_MODE_OUTPUT);

    gpio_reset_pin(INPUT_PIN);
    gpio_set_direction(INPUT_PIN, GPIO_MODE_INPUT);
    gpio_pulldown_en(INPUT_PIN);
    gpio_pullup_dis(INPUT_PIN);
    gpio_set_intr_type(INPUT_PIN, GPIO_INTR_POSEDGE);

    interputQueue = xQueueCreate(10, sizeof(int));
    xTaskCreate(LED_Control_Task, "LED_Control_Task", 2048, NULL, 1, NULL);

    gpio_install_isr_service(0);
    gpio_isr_handler_add(INPUT_PIN, gpio_interrupt_handler, (void *)INPUT_PIN);
}


### I2C ###

  int i2c_master_port = 0;
  i2c_config_t conf = {
      .mode = I2C_MODE_MASTER,
      .sda_io_num = I2C_MASTER_SDA_IO,  // select SDA GPIO specific to your project
      .sda_pullup_en = GPIO_PULLUP_DISABLE,
      .scl_io_num = I2C_MASTER_SCL_IO,  // select SCL GPIO specific to your project
      .scl_pullup_en = GPIO_PULLUP_ENABLE,
      .master.clk_speed = I2C_MASTER_FREQ_HZ,  // select frequency specific to your project
      .clk_flags = 0,                          // optional; you can use I2C_SCLK_SRC_FLAG_* flags to choose i2c source clock here
  };

  i2c_master_bus_handle_t bus_handle;
  ESP_ERROR_CHECK(i2c_new_master_bus(&i2c_mst_config, &bus_handle));

  i2c_device_config_t dev_cfg = {
      .dev_addr_length = I2C_ADDR_BIT_LEN_7,
      .device_address = 0x68,
      .scl_speed_hz = 100000,
  };

  i2c_master_dev_handle_t dev_handle;
  ESP_ERROR_CHECK(i2c_master_bus_add_device(bus_handle, &dev_cfg, &dev_handle));

  uint8_t buf[20] = {0x75};
  uint8_t buffer[2];
  ESP_ERROR_CHECK(i2c_master_transmit_receive(i2c_bus_handle, buf, sizeof(buf), buffer, 2, -1));

*/