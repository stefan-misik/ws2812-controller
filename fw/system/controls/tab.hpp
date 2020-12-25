/**
 * @file
 */

#ifndef SYSTEM_CONTROLS_TAB_HPP_
#define SYSTEM_CONTROLS_TAB_HPP_

#include "system/control.hpp"

namespace system
{

class TabControl:
        public Control
{
public:
    enum Flags: uint8_t
    {
        TEXT_IN_PROGMEM = (Control::Flags::USER_FLAGS << 0)
    };

    /** @copydoc system::DisplayObject::processEvent() */
    uint8_t processEvent(
            const system::Event & event,
            system::Event * new_event) override;
    /** @copydoc system::DisplayObject::draw() */
    void draw(system::DrawContext & dc, uint8_t time) override;

    uint8_t tabCount() const { return tab_count_; }
    void setTabCount(uint8_t new_count) { tab_count_ = new_count; }

    uint8_t currentTab() const { return current_tab_; }
    void setCurrentTab(uint8_t new_tab) { current_tab_ = new_tab; }

    const char * text() const { return text_; }
    void setText(const char * new_text) { text_ = new_text; }

private:
    uint8_t tab_count_;
    uint8_t current_tab_;
    const char * text_;
};

}  // namespace




#endif  // SYSTEM_CONTROLS_TAB_HPP_
