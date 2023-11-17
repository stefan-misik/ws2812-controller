#include "status_led.hpp"

#define USE_PWM  0

#include "hardware/gpio.h"

#if USE_PWM == 1
#include "hardware/pwm.h"
#endif



namespace {

const uint GPIOS[] = {
    6, 7, 8, 9
};

}  // namespace

void StatusLed::initialize() {
    for (auto gpio : GPIOS) {
#if USE_PWM == 1
        gpio_set_function(gpio, gpio_function::GPIO_FUNC_PWM);

        // Figure out which slice we just connected to the LED pin
        const uint slice_num = pwm_gpio_to_slice_num(gpio);
        // Get some sensible defaults for the slice configuration
        pwm_config config = pwm_get_default_config();
        // Set divider, reduces counter clock to sysclock/this value
        pwm_config_set_clkdiv(&config, 4.f);
        pwm_init(slice_num, &config, true);
#else
        gpio_init(gpio);
        gpio_set_dir(gpio, true);
#endif
    }
}

void StatusLed::setIntensity(std::uint8_t intensity) {
#if USE_PWM == 1
    pwm_set_gpio_level(
        GPIOS[static_cast<unsigned>(id_)],
        intensity | (intensity << 8)
    );
#else
    gpio_put(GPIOS[static_cast<unsigned>(id_)], 0 != (intensity & 0x80));
#endif
}