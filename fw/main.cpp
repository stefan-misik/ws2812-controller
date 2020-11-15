#include "device/time_service.hpp"
#include "device/output.hpp"
#include "device/keypad.hpp"
#include "device/lcd.hpp"

#include <stdint.h>

int main(void)
{
    device::TimeService::initialize();
    device::Output::initialize();
    device::Keypad::initialize();
    device::Lcd::initialize();

    device::Output::setBacklight(255);

    device::Lcd::update();

    uint64_t a = 0;
    while(1)
    {
        uint64_t b = a;
        for (char i = 0; i< 64; ++i)
        {
            for (char j = 0; j < 6; ++j)
            {
                device::Lcd::frameBuffer()[(j * 84) + i] = b & 0x01 ? 0xff : 0x00;
            }
            b >>= 1;
        }
        device::Lcd::update();
        ++a;
    }
}
