#include "device/output.hpp"
#include "device/keypad.hpp"
#include "device/lcd.hpp"

int main(void)
{
    device::Output::initialize();
    device::Keypad::initialize();
    device::Lcd::initialize();

    device::Output::setBacklight(255);
    device::Lcd::test();

    while(1)
    {
    }
}
