#include "status_led.hpp"

#include "hardware/gpio.h"

namespace {

const std::uint8_t GPIOS[] = {
    6, 7, 8, 9
};

}  // namespace

void StatusLed::initialize() {
    for (auto gpio : GPIOS) {
        gpio_init(gpio);
        gpio_set_dir(gpio, true);
        // gpio_set_function(gpio, gpio_function::GPIO_FUNC_PWM);
    }
}

void StatusLed::setIntensity(std::uint8_t intensity) {
    gpio_put(GPIOS[static_cast<unsigned>(id_)], 0 != intensity);
}