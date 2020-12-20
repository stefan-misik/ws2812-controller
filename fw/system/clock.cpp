#include "system/clock.hpp"

namespace system
{

void Clock::tick()
{
    ++hundreth_seconds_;
    if (100 == hundreth_seconds_)
    {
        hundreth_seconds_ = 0;
        ++timestamp_;
    }
}

}  // namespace system
