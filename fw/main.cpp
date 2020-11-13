#include "device/lcd.hpp"

int main(void)
{
    device::Lcd::initialize();
    device::Lcd::test();

    while(1)
    {
    }
}
