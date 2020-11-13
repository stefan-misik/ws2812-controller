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
public:
    /** @brief LCD extended configuration parameters */
    enum class ExtendedOption
    {
        TEMPERATURE_COEFICIENT,
        BIAS,
        CONTRAST
    };

    /** @brief Initialize LCD peripherals */
    static void initialize();

    /** @brief Test the LCD */
    static void test();

private:
    /**
     * \brief Function to set LCD's extended configuration options
     *
     * \param option Extended configuration to change
     * \param value New value of the selected configuration
     */
    static void setExtendedOption(ExtendedOption option, uint8_t value);

    static void setPosition(uint8_t column, uint8_t row);

};

}  // namespace device



#endif  // DEVICE_LCD_HPP_
