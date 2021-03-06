/**
 * @file
 */

#ifndef DEVICE_LCD_HPP_
#define DEVICE_LCD_HPP_

#include <stdint.h>

namespace device
{

class Lcd
{
private:
    static constexpr uint8_t PARAMETER_COUNT = 3;
public:
    /** @brief LCD extended configuration parameters */
    enum class Parameter: uint8_t
    {
        TEMPERATURE_COEFICIENT,
        BIAS,
        CONTRAST
    };

    /** @brief Invalid value of the extended option */
    static constexpr uint8_t INVALID_PARAMETER_VALUE = 0xff;

    /** @brief Initialize LCD peripherals */
    static void initialize();

    /**
     * @brief Update the parameters and the contents of the display
     *
     * @param[in] frame_buffer Frame buffer to send to the LCD. Frame buffer is
     *            an array of 504 bytes.
     */
    static void update(const uint8_t * frame_buffer);

    /**
     * @brief Set an LCD parameter to be updated during next update phase
     * 
     * @param option Option to be configured
     * @param parameter Value of the option (INVALID_PARAMETER_VALUE to
     *        cancel the pending update)
     */
    static void setParameter(Parameter parameter, uint8_t value);

private:
    static uint8_t update_parameters_;
    static uint8_t parameters_[PARAMETER_COUNT];
};

}  // namespace device



#endif  // DEVICE_LCD_HPP_
