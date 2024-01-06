// https://github.com/JSchaenzle/ESP32-NeoPixel-WS2812-RMT



#include <driver/adc.h>
#include <stdio.h>

#include "driver/gpio.h"
#include "freertos/FreeRTOS.h"
#include "freertos/timers.h"
#include "ws2812_control.h"
#include "driver/uart.h"
#include "esp_log.h"

#define RED   0x00FF00
#define GREEN 0xFF0000
#define BLUE  0x0000FF

#define ECHO_TEST_TXD 14
#define ECHO_TEST_RXD 15
#define ECHO_TEST_RTS 13
#define ECHO_TEST_CTS (UART_PIN_NO_CHANGE)

#define ECHO_UART_PORT_NUM      UART_NUM_2
#define ECHO_TASK_STACK_SIZE    2048

static const char *TAG = "UART TEST";

#define BUF_SIZE (1024)

static void echo_task(void *arg)
{
    /* Configure parameters of an UART driver,
     * communication pins and install the driver */
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

void app_main(void)
{
    xTaskCreate(echo_task, "uart_echo_task", ECHO_TASK_STACK_SIZE, NULL, 10, NULL);
}

/*
#### GPIO ####
GPIO 33 12V_DIS - let floating, do not set anything, when the line 12V will need to be disabled, than set to OUTPUT and pull low.
  gpio_reset_pin(BLINK_GPIO);
  gpio_set_direction(BLINK_GPIO, GPIO_MODE_OUTPUT);
  gpio_set_level(BLINK_GPIO, 1);

#### LED RMT ####
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

*/