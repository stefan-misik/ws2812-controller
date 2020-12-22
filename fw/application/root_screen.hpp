/**
 * @file
 */

#ifndef APPLICATION_ROOT_SCREEN_HPP_
#define APPLICATION_ROOT_SCREEN_HPP_

#include "system/display_object.hpp"
#include "application/screen/startup.hpp"
#include "application/screen/control.hpp"
#include "application/screen/settings.hpp"

namespace application
{

class Core;

class RootScreen:
        public system::DisplayObject
{
public:
    enum class Screen
    {
        STARTUP = 0, CONTROL, SETTINGS
    };

    RootScreen();

    /** @copydoc system::DisplayObject::processEvent() */
    uint8_t processEvent(
            const system::Event & event,
            system::Event * new_event) override;
    /** @copydoc system::DisplayObject::draw() */
    void draw(system::DrawContext & dc, uint8_t time) override;

    /**
     * @brief Change the display screen
     *
     * @param new_screen Screen to be changed into
     */
    void changeScreen(Screen new_screen);

private:
    union Screens
    {
        StartupScreen startup;
        ControlScreen control;
        SettingsScreen settings;
        Screens() = delete;
    };



    char screen_data_[sizeof(Screens)];
    Screen active_screen_;

    system::DisplayObject * activeScreen()
    {
        // This assumes that system::DisplayObject has the same address as
        // individual screens (i.e. screens should not inherit only from single
        // class - system::DisplayObject).
        return reinterpret_cast<system::DisplayObject *>(screen_data_);
    }
};

}  // namespace application




#endif  // APPLICATION_ROOT_SCREEN_HPP_
