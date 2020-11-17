#include "tools/timer.hpp"


namespace tools
{

bool PeriodicRoutine::shouldRunAt(uint8_t time)
{
    uint8_t time_since_last_run = time - last_routine_run_;
    if (time_since_last_run >= period_length_)
    {
        last_routine_run_ += period_length_;
        return true;
    }
    else
    {
        return false;
    }
}

}  // namespace tools



