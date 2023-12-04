// https://github.com/JSchaenzle/ESP32-NeoPixel-WS2812-RMT

#define NUM_LEDS      9
#define LED_STRIP_PIN 4

#include <driver/adc.h>
#include <stdio.h>

#include "driver/gpio.h"
#include "freertos/FreeRTOS.h"
#include "freertos/timers.h"
#include "ws2812_control.h"

#define RED   0x00FF00
#define GREEN 0xFF0000
#define BLUE  0x0000FF

void app_main(void) {
  adc1_config_width(ADC_WIDTH_BIT_12);
  adc1_config_channel_atten(ADC1_CHANNEL_0, ADC_ATTEN_DB_11);
  

  while (1)
  {
    int val = adc1_get_raw(ADC1_CHANNEL_0);
    printf("Val: %d\n", val);
    vTaskDelay(500 / portTICK_PERIOD_MS);
  }
  
}

/*
#### GPIO ####
GPIO 33 12V_DIS - let floating, do not set anything, when the line 12V will need to be disabled, than set to OUTPUT and pull low.
  gpio_reset_pin(BLINK_GPIO);
  gpio_set_direction(BLINK_GPIO, GPIO_MODE_OUTPUT);
  gpio_set_level(BLINK_GPIO, 1);

#### LED RMT ####
GPIO 4 -
  ws2812_control_init();

  struct led_state new_state;
  for (uint8_t i = 0; i < NUM_LEDS; i++)
  {
    new_state.leds[i] = RED;
  }
  ws2812_write_leds(new_state);

*/