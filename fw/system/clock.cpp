#include "system/clock.hpp"

namespace system
{

void Clock::tick()
{
    ++hundreth_seconds_;
    uint8_t time_diff = hundreth_seconds_ - previous_increment_;
    if (100 == time_diff)
    {
        previous_increment_ = hundreth_seconds_;
        ++timestamp_;
    }
}

}  // namespace system
