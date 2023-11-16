/**
 * @file
 */

#ifndef STATUS_LED_
#define STATUS_LED_

#include <cstdint>


enum class StatusLedId: std::uint8_t
{
    LED_BLUE,
    LED_RED,
    LED_YELLOW,
    LED_GREEN,
};

class StatusLed
{
public:
    static void initialize();

    static StatusLed FromId(StatusLedId id) {
        return StatusLed(id);
    }

    ~StatusLed() {
        setIntensity(0);
    }

    void setIntensity(std::uint8_t value);

private:
    StatusLed(StatusLedId id): id_(id) { }
    
    StatusLedId id_;
};

#endif  // STATUS_LED_