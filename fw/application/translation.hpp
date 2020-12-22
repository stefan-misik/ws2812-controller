/**
 * @file
 */

#ifndef APPLICATION_TRANSLATION_HPP_
#define APPLICATION_TRANSLATION_HPP_

#include "application/common.hpp"
#include "application/text.hpp"

#include <avr/pgmspace.h>

#define TRANSLATION_STR(s) TRANSLATION_XSTR(s)
#define TRANSLATION_XSTR(s) #s

#define TRANSLATION_BEGIN(sname, lname)  \
    namespace translation_ ## sname  \
    {  \
        const char short_name[3] PROGMEM = TRANSLATION_STR(sname);  \
        const char long_name[] PROGMEM = lname;

#define TRANSLATION_PHRASE(phrase_id, translation)  \
        const char phrase_ ## phrase_id [] PROGMEM = translation;

#define TRANSLATION_END()  \
    }


#define TRANSLATION_TABLE(sname)  \
    PGM_P const translation_table_ ## sname [Text::PHRASE_COUNT] PROGMEM =  \
    {  \
        translation_ ## sname :: short_name,  \
        translation_ ## sname :: long_name,  \
        translation_ ## sname :: phrase_CONTROL_SCREEN,  \
        translation_ ## sname :: phrase_SETTINGS_SCREEN,  \
    }


#endif  // APPLICATION_TRANSLATION_HPP_
