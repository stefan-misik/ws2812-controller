#include "application/text.hpp"

#include "application/translation.hpp"

#include <avr/pgmspace.h>

namespace application
{

// First include all the translations
#include "application/translation/en.inc"

// Then create the translation tables in order the translations are to be used
TRANSLATION_TABLE(en);



size_t Text::getText(Phrase phrase_id, char * buffer, size_t capacity) const
{
    const char * prog_mem = getProgmemText(phrase_id);

    if (0 == capacity)
    {
        return 0;
    }

    size_t remaining_capacity = capacity;
    // Save space for terminating zero
    remaining_capacity -= 1;

    while (true)
    {
        const char c = pgm_read_byte(prog_mem);
        if (0 == remaining_capacity || '\0' == c)
        {
            break;
        }

        *buffer = c;
        ++buffer;
        ++prog_mem;
        --remaining_capacity;
    }
    *buffer = '\0';

    return capacity - remaining_capacity;
}

const char * Text::getProgmemText(Phrase phrase_id) const
{
    const char * const * table = reinterpret_cast<const char * const *>(
            reinterpret_cast<uintptr_t>(translation_table_en) +
            (translation_ * sizeof(translation_table_en)));

    return table[static_cast<size_t>(phrase_id)];
}

}  // namespace application

