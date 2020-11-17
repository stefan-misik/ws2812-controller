#include "device/time_service.hpp"
#include "device/output.hpp"
#include "device/keypad.hpp"
#include "device/lcd.hpp"

#include "tools/timer.hpp"

#include <stdint.h>

int main(void)
{
    device::TimeService::initialize();
    device::Output::initialize();
    device::Keypad::initialize();
    device::Lcd::initialize();

    device::Output::setBacklight(255);

    device::Lcd::update();

    tools::PeriodicRoutine lcd_update_timer;
    lcd_update_timer.setPeriod(100);
    lcd_update_timer.resetTimerAt(0);

    uint64_t a = 1;
    while(1)
    {
        uint8_t loop_time = device::TimeService::getTime();

        if (lcd_update_timer.shouldRunAt(loop_time))
        {
            uint64_t b = a;
            for (char i = 0; i< 64; ++i)
            {
                for (char j = 0; j < 6; ++j)
                {
                    device::Lcd::frameBuffer()[(j * 84) + i] =
                            b & 0x01 ? 0xff : 0x00;
                }
                b >>= 1;
            }
            device::Lcd::update();
            ++a;
        }
    }
}
