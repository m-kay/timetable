// Default empty project template
#ifndef Timetable_HPP_
#define Timetable_HPP_

#include <QObject>
#include <bb/cascades/AbstractPane>

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

    Q_INVOKABLE void getConnections(QString from, QString to, QDateTime time);

public Q_SLOTS:
	void onConnectionsList(QString data, bool success);

protected:
	bb::cascades::AbstractPane* m_root;
};


#endif /* Timetable_HPP_ */
