#ifndef TESTS_PDU_ENUM_CLASS_H_
#define TESTS_PDU_ENUM_CLASS_H_

#include <type_traits>

#define ENUM_CLASS_CASE(enum_value)  \
    case enum_value:  \
        return SimpleString(#enum_value)

#define ENUM_CLASS_TERMINATE(type, value)  \
    return StringFromFormat(#type "::[%i]", static_cast<int>(value))


/*----------------------------------------------------------------------------*/
/* Enum class string converters                                               */
/*----------------------------------------------------------------------------*/

//inline SimpleString StringFrom(const pdu::OutputStatus & status)
//{
//    switch (status)
//    {
//    ENUM_CLASS_CASE(pdu::OutputStatus::DISABLED);
//    }
//
//    ENUM_CLASS_TERMINATE(pdu::OutputStatus, status);
//}

/*----------------------------------------------------------------------------*/
/* Enum class generic copier and comparator                                   */
/*----------------------------------------------------------------------------*/

namespace tac
{
namespace tests
{

template <typename T>
class EnumClassCopycomp:
        public MockNamedValueCopier,
        public MockNamedValueComparator
{
    static_assert(std::is_enum<T>::value, "Type needs to be an enum type.");

public:
    void copy(void* out, const void* in) override  // NOLINT linter is confused
    {
        *reinterpret_cast<T *>(out) = *reinterpret_cast<const T *>(in);
    }

    bool isEqual(const void* object1, const void* object2) override
    {
        return *reinterpret_cast<const T *>(object1) ==
                *reinterpret_cast<const T *>(object2);
    }

    SimpleString valueToString(const void* object) override
    {
        return StringFrom(*reinterpret_cast<const T *>(object));
    }
};

}  // namespace tests
}  // namespace tac


#endif  // TESTS_PDU_ENUM_CLASS_H_
