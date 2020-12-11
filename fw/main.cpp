#include "device/time_service.hpp"
#include "device/output.hpp"
#include "device/lcd.hpp"
#include "device/led_controller.hpp"

#include "system/core.hpp"

#include "tools/timer.hpp"

#include <stdint.h>

system::Core system_core;


uint8_t periodic(uint8_t state)
{
    return state;
}


int main(void)
{
    device::TimeService::initialize();
    device::Output::initialize();
    device::Lcd::initialize();
    device::LedController::initialize();

    device::Output::setBacklight(255);
    device::Output::setLed(0);

    device::Lcd::update(system_core.frameBuffer().begin());

    device::Output::setOut1(true);
    device::Output::setOut2(true);

    tools::PeriodicRoutine periodic_timer;
    periodic_timer.setPeriod(1);
    periodic_timer.resetTimerAt(0);

    uint8_t state = 0;
    while(1)
    {
        uint8_t loop_time = device::TimeService::getTime();

        if (periodic_timer.shouldRunAt(loop_time))
        {
        }
    }
}
