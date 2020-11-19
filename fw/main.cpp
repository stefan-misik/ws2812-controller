#include "device/time_service.hpp"
#include "device/output.hpp"
#include "device/lcd.hpp"

#include "system/input.hpp"

#include "tools/timer.hpp"

#include <stdint.h>

int main(void)
{
    device::TimeService::initialize();
    device::Output::initialize();
    device::Lcd::initialize();

    system::Input::initialize();

    device::Output::setBacklight(255);
    device::Output::setLed(0);

    device::Lcd::update();

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
                system::Input::read(0, 1);
                break;

            case 1:
                ++state;
                system::Input::read(1, 2);
                break;

            case 2:
                ++state;
                system::Input::read(2, 0);
                break;

            case 3:
                state = 0;

                for (uint8_t column = 0; column < 3; ++column)
                {
                    for (uint8_t row = 0; row < 4; ++row)
                    {
                        uint8_t state = system::Input::buttons_[(4 * column) + (3 - row)].state() & tools::ButtonFilter::PRESS;

                        uint8_t * buffer_pos = &(device::Lcd::frameBuffer()[(84 * row) + (8 * column)]);
                        for (uint8_t pos = 1; pos < 7; ++pos)
                        {
                            buffer_pos[pos] ^= state ? 0x7e : 0x00;
                        }
                    }
                }

                device::Lcd::update();
                break;
            }
        }
    }
}
