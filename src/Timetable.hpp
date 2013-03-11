// Default empty project template
#ifndef Timetable_HPP_
#define Timetable_HPP_

#include <QObject>

namespace bb { namespace cascades { class Application; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class Timetable : public QObject
{
    Q_OBJECT
public:
    Timetable(bb::cascades::Application *app);
    virtual ~Timetable() {}
};


#endif /* Timetable_HPP_ */
