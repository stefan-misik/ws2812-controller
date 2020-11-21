/**
 * @file
 */

#ifndef DEVICE_LED_CONTROLLER_HPP_
#define DEVICE_LED_CONTROLLER_HPP_

#include <stdint.h>


namespace device
{

/**
 * @brief Object handling the communication with WS2812B LEDs
 */
class LedController
{
public:
    /**
     * @brief Initialize the LED state storage and hardware necessary to
     *        communicate with LEDs
     *
     */
    static void initialize();

    /**
     * @brief Transfer the values of the LEDs into the strip
     *
     * @param out Number of the LED strip output (either 0 or 1)
     * @param[in] data Led strip to be associated with the LED controller
     * @param length Length of the data to be transmitted
     */
    static void update(uint8_t out, const uint8_t * data, uint8_t length);
};


}  // namespace device



#endif  // DEVICE_LED_CONTROLLER_HPP_
