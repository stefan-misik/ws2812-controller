#include "system/output.hpp"

#include "device/output.hpp"


namespace system
{

Output::Setter Output::typeToSetterFn(Type type)
{
    switch (type)
    {
    case Type::LED: return device::Output::setLed;
    case Type::BACKLIGHT: return device::Output::setBacklight;
    case Type::OUT1: return device::Output::setOut1;
    case Type::OUT2: return device::Output::setOut2;
    default: return nullptr;
    }
}


}  // namespace system
