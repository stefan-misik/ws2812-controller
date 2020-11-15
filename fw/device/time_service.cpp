#include "device/time_service.hpp"

#include <avr/io.h>
#include <avr/interrupt.h>

namespace device
{

volatile uint8_t TimeService::current_time_;

void TimeService::initialize()
{
    current_time_ = 0;

    // Enable interrupts
    sei();

    // Disable power reduction
    PRR &= ~((1 << PRTIM1));
}

}  // namespace device

ISR(TIMER1_COMPA_vect)
{
    ++device::TimeService::current_time_;
}
