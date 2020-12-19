/**
 * @file
 */

#ifndef SYSTEM_DISPLAY_OBJECT_HPP_
#define SYSTEM_DISPLAY_OBJECT_HPP_

#include "system/common.hpp"
#include "system/draw_context.hpp"

namespace system
{

class DisplayObject
{
public:
    /** @brief Result of event processing */
    enum EventResult: uint8_t
    {
        EVENT_NOT_PROCESSED,  /**< Event was not processed by the object */
        EVENT_PROCESSED,  /**< Event processed by the object */
        /** @brief Event processed and a new response event is generated */
        EVENT_PROCESSED_AND_NEW_RETURNED,

        /**
         * @brief User-defined object-specific results
         *
         * This and higher result codes are reserved as object-specific.
         */
        EVENT_USER_RESULT = 0x10
    };

    /**
     * @brief Process given event and optionally generate a new one
     *
     * @param[in] event Event to be processed
     * @param[out] new_event New generated event
     *
     * @return Event processing result code (see @ref EventResult)
     */
    virtual uint8_t processEvent(const Event & event, Event * new_event);

    /**
     * @brief Draw the contents of the display object on given draw context
     *
     * @param[in] dc Draw context to draw on
     */
    virtual void draw(const DrawContext & dc);

    virtual ~DisplayObject() = default;
};

}  // namespace system




#endif  // SYSTEM_DISPLAY_OBJECT_HPP_
