#include "pico/stdlib.h"
#include "pico/multicore.h"

#include "status_led.hpp"

void second_core() {
    while (true) {
        __wfe();
    }
}

int main() {
    // Initialize PICO SDK stuff
    setup_default_uart();
    multicore_launch_core1(second_core);
    
    // Initialzie application components
    StatusLed::initialize();

    StatusLed leds[] = {
        StatusLed::FromId(StatusLedId::LED_GREEN),
        StatusLed::FromId(StatusLedId::LED_YELLOW),
        StatusLed::FromId(StatusLedId::LED_RED),
        StatusLed::FromId(StatusLedId::LED_BLUE),
    };

    std::uint8_t intensity[4] = {
        0, 63, 127, 191
    };

    while (true) {
        for (unsigned n = 0; n != 4; ++n) {
            leds[n].setIntensity(intensity[n]++);
        }
        sleep_ms(5);
    }

    return 0;
}
