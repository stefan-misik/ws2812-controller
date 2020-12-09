#include "device/time_service.hpp"
#include "device/output.hpp"
#include "device/lcd.hpp"
#include "device/led_controller.hpp"

#include "system/input.hpp"

#include "tools/timer.hpp"

#include <stdint.h>


int main(void)
{
    device::TimeService::initialize();
    device::Output::initialize();
    device::Lcd::initialize();
    device::LedController::initialize();

    device::Output::setBacklight(255);
    device::Output::setLed(0);

    device::Lcd::update();

    device::Output::setOut1(true);
    device::Output::setOut2(true);

    tools::PeriodicRoutine update_timer;
    update_timer.setPeriod(1);
    update_timer.resetTimerAt(0);

    uint8_t state = 0;
    while(1)
    {
        uint8_t loop_time = device::TimeService::getTime();

        if (update_timer.shouldRunAt(loop_time))
        {
            switch (state)
            {
            case 0:
                ++state;
                break;

            case 1:
                ++state;
                break;

            case 2:
                ++state;
                break;

            case 3:
                state = 0;

                device::Lcd::update();
                device::LedController::update(0,
                        (const uint8_t *)"\x77\x00\x00\x00\x77\x00\x00\x00\x77\x55\x55\x55",
                        12);
                device::LedController::update(1,
                        (const uint8_t *)"\x00\x77\x00\x77\x00\x00\x00\x00\x77\x55\x55\x55",
                        12);
                break;
            }
        }
    }
}
