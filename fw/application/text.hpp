/**
 * @file
 */

#ifndef APPLICATION_TEXT_HPP_
#define APPLICATION_TEXT_HPP_

#include "application/common.hpp"

namespace application
{

class Text
{
public:
    enum class Phrase: size_t
    {
        LANGUAGE_SHORT = 0, LANGUAGE_LONG,
        CONTROL_SCREEN, SETTINGS_SCREEN,

        COUNT_
    };

    static constexpr size_t PHRASE_COUNT = static_cast<size_t>(Phrase::COUNT_);

    Text():
        translation_(0)
    { }

    /**
     * @brief Read the value of given phrase
     *
     * Copy the phrase text into provided buffer. The function ensures the
     * buffer is terminated with null character, even in case the buffer is
     * sufficiently big to fit the entire phrase text.
     *
     * @param phrase_id ID of the phrase to obtain
     * @param[out] buffer Pointer to buffer which will obtain the phrase
     * @param capacity Capacity of the buffer
     *
     * @return Number of actually written bytes in the buffer including the
     *         terminating zero
     */
    size_t getText(Phrase phrase_id, char * buffer, size_t capacity) const;

    /**
     * @brief Get the program memory pointer to given phrase
     *
     * @param phrase_id ID of the phrase to obtain
     *
     * @return Pointer in the program memory
     */
    const char * getProgmemText(Phrase phrase_id) const;

    /**
     * @brief Set the translation to be used
     *
     * @param translation_id Translation ID to be used
     */
    void setTranslationId(uint8_t translation_id)
    {
        translation_ = translation_id;
    }

private:
    uint8_t translation_;
};

}  // namespace application




#endif  // APPLICATION_TEXT_HPP_
