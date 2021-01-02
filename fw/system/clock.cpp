#include "system/clock.hpp"

namespace system
{

void Clock::tick()
{
    ++hundreth_seconds_;
    uint8_t current_time = static_cast<uint8_t>(hundreth_seconds_);
    uint8_t time_diff = current_time - previous_increment_;
    if (100 == time_diff)
    {
        previous_increment_ = current_time;
        ++timestamp_;
    }
}

}  // namespace system
