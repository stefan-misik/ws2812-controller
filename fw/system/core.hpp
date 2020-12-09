/**
 * @file
 */

#ifndef SYSTEM_CORE_HPP_
#define SYSTEM_CORE_HPP_

#include "system/event_queue.hpp"
#include "system/input.hpp"

namespace system
{

/** @brief Main system event queue */
extern EventQueue event_queue;

/** @brief Main input component */
extern Input input;

}  // namespace system



#endif  // SYSTEM_CORE_HPP_
