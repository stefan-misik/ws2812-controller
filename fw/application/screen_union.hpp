/**
 * @file
 */

#ifndef APPLICATION_ROOT_SCREEN_HPP_
#define APPLICATION_ROOT_SCREEN_HPP_

#include "application/screen/startup.hpp"
#include "application/screen/control.hpp"
#include "application/screen/settings.hpp"

namespace application
{

class ScreenUnion:
        public system::DisplayObject
{
public:
    enum class Screen
    {
        STARTUP = 0, CONTROL, SETTINGS
    };

    ScreenUnion();

    /**
     * @brief Change the display screen
     *
     * @param new_screen Screen to be changed into
     */
    void changeScreen(Screen new_screen);

    /**
     * @brief Get active screen identification
     *
     * @return Screen identification
     */
    Screen activeScreen() const
    {
        return active_screen_;
    }

    /**
     * @brief Get the pointer to the active screen display object
     *
     * @return Pointer to the active screen object
     */
    system::DisplayObject * activeScreenObject()
    {
        // This assumes that system::DisplayObject has the same address as
        // individual screens (i.e. screens should not inherit only from single
        // class - system::DisplayObject).
        return reinterpret_cast<system::DisplayObject *>(screen_data_);
    }

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
};

}  // namespace application




#endif  // APPLICATION_ROOT_SCREEN_HPP_
