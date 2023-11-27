#include "ws2812_control.h"

#define RED   0x00FF00
#define GREEN 0x00FF00
#define BLUE  0x0000FF



void app_main(void)
{
  ws2812_control_init();

  struct led_state new_state;
  new_state.leds[0] = RED;
  new_state.leds[1] = RED;
  new_state.leds[2] = RED;
  new_state.leds[3] = RED;
  new_state.leds[4] = RED;
  ws2812_write_leds(new_state);
}