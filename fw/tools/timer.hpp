/**
 * @file
 */

#ifndef TOOLS_TIMER_HPP_
#define TOOLS_TIMER_HPP_

#include <stdint.h>

namespace tools
{

/** @brief Periodic routine */
class PeriodicRoutine
{
public:
    PeriodicRoutine(uint8_t period_length = 1):
        period_length_(period_length),
        last_routine_run_(0)
    { }

    /**
     * @brief Change the period of the periodic routine
     *
     * @param period_length New length of the periodic routine run
     */
    void setPeriod(uint8_t period_length)
    {
        period_length_ = period_length;
    }

    /**
     * @brief Reset the timer used to time the routine period
     *
     * @param time Current time
     */
    void resetTimerAt(uint8_t time)
    {
        last_routine_run_ = time;
    }

    /**
     * @brief Check whether the periodic routine should be ran at given time
     *
     * @param time Current time
     *
     * @retval false The routine was not called
     * @retval true The routine was called
     */
    bool shouldRunAt(uint8_t time);

private:
    uint8_t period_length_;
    uint8_t last_routine_run_;
};

}  // namespace tools



#endif  // TOOLS_TIMER_HPP_
