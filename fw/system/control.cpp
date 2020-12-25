#include "system/control.hpp"


namespace system
{

void Control::setFlag(uint8_t flag, bool value)
{
    if (value)
    {
        flags_ |= flag;
    }
    else
    {
        flags_ &= ~flag;
    }
}

}  // namespace system
