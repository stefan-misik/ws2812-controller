#include "device/time_service.hpp"
#include "device/output.hpp"
#include "device/lcd.hpp"
#include "device/led_controller.hpp"
#include "device/keypad.hpp"

#include "system/core.hpp"
#include "application/core.hpp"


#include "tools/timer.hpp"

#include <stdint.h>

uint8_t periodic_phase;
tools::PeriodicRoutine periodic_timer;

system::Core system_core;
application::Core application_core;



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

    system_core.setRootDisplayObject(&application_core.rootScreen());

    // Prepare the main loop
    periodic_timer.setPeriod(1);
    periodic_timer.resetTimerAt(0);

    periodic_phase = 0;
    while(1)
    {
        uint8_t loop_time = device::TimeService::getTime();

        if (periodic_timer.shouldRunAt(loop_time))
        {
            // Every main loop is split into 4-sub loops which are executed
            // every 10ms with 2.5 ms relative phase shift
            switch (periodic_phase)
            {
            case 0:
                // Handle keypad
                system_core.input().update(0, device::Keypad::readColumn());
                device::Keypad::selectColumn(1);

                // First phase updates LCD
                device::Lcd::update(system_core.frameBuffer().begin());

                ++periodic_phase;
                break;

            case 1:
                // Handle keypad
                system_core.input().update(1, device::Keypad::readColumn());
                device::Keypad::selectColumn(2);

                // Second phase updates first LED strip
                // TODO(stefan.misik) Update LED chain A

                ++periodic_phase;
                break;

            case 2:
                // Handle keypad
                system_core.input().update(2, device::Keypad::readColumn());
                device::Keypad::selectColumn(0);

                // Third phase updates second LED strip
                // TODO(stefan.misik) Update LED chain B

                ++periodic_phase;
                break;

            case 3:
                // Finally, fourth phase executes the main UI
                system_core.run();
                // no break

            default:
                periodic_phase = 0;
                break;
            }
        }
    }
}
