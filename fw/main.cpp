#include "device/time_service.hpp"
#include "device/output.hpp"
#include "device/lcd.hpp"
#include "device/led_controller.hpp"
#include "device/keypad.hpp"

#include "system/core.hpp"

#include "visual/led_chain.hpp"

#include "tools/timer.hpp"

#include <stdint.h>

uint8_t periodic_state;
tools::PeriodicRoutine periodic_timer;

system::Core system_core;

visual::LedChain led_chain[2];



void updateLedChain(uint8_t id)
{
    uint8_t raw_led_strip[visual::MAX_CHAIN_LENGTH * 3];
    size_t raw_length = led_chain[id].render(raw_led_strip);
    device::LedController::update(id, raw_led_strip, raw_length);
}


int main(void)
{
    // Initialize the devices
    device::TimeService::initialize();
    device::Output::initialize();
    device::Lcd::initialize();
    device::LedController::initialize();
    device::Keypad::initialize();

    // Configure some initial data
    device::Output::setBacklight(255);
    device::Output::setLed(0);

    device::Lcd::update(system_core.frameBuffer().begin());

    device::Output::setOut1(true);
    device::Output::setOut2(true);

    device::Keypad::selectColumn(0);


    // Prepare the main loop
    periodic_timer.setPeriod(1);
    periodic_timer.resetTimerAt(0);

    periodic_state = 0;
    while(1)
    {
        uint8_t loop_time = device::TimeService::getTime();

        if (periodic_timer.shouldRunAt(loop_time))
        {
            // Every main loop is split into 4-sub loops which are executed
            // every 10ms with 2.5 ms relative phase shift
            switch (periodic_state)
            {
            case 0:
                // Handle keypad
                system_core.input().update(0, device::Keypad::readColumn());
                device::Keypad::selectColumn(1);

                // First sub-loop updates LCD
                device::Lcd::update(system_core.frameBuffer().begin());

                ++periodic_state;
                break;

            case 1:
                // Handle keypad
                system_core.input().update(1, device::Keypad::readColumn());
                device::Keypad::selectColumn(2);

                // Second sub-loop updates first LED strip
                updateLedChain(0);

                ++periodic_state;
                break;

            case 2:
                // Handle keypad
                system_core.input().update(2, device::Keypad::readColumn());
                device::Keypad::selectColumn(0);

                // Third sub-loop updates second LED strip
                updateLedChain(1);

                ++periodic_state;
                break;

            case 3:
                // Finally execute the main UI
                system_core.run();
                // no break

            default:
                periodic_state = 0;
                break;

            }
        }
    }
}
