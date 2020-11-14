#include "device/lcd.hpp"
#include "device/output.hpp"

int main(void)
{
    device::Output::initialize();
    device::Lcd::initialize();

    device::Output::setBacklight(255);
    device::Lcd::test();

    while(1)
    {
    }
}
