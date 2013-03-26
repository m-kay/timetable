// Default empty project template
#include "Timetable.hpp"
#include "DataLoader.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/GroupDataModel>
#include <bb/cascades/ListView>
#include <bb/cascades/Label>
#include <bb/data/JsonDataAccess>
#include <QDebug>

using namespace bb::cascades;
using namespace bb::data;

Timetable::Timetable(bb::cascades::Application *app)
: QObject(app)
{
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);
    qml->setContextProperty("tt", this);

    m_root = qml->createRootObject<AbstractPane>();
    app->setScene(m_root);
}

void Timetable::getConnections(QString from, QString to, QDateTime time){

    DataLoader* loader = new DataLoader();
    connect(loader, SIGNAL(connectionsLoaded(QString, bool)), this, SLOT(onConnectionsList(QString, bool)));

    loader->loadConnections(from, to, time);
}

void Timetable::onConnectionsList(QString data, bool success){
    if (!success)
    {
    	Label* error = m_root->findChild<Label*>("error");
    	if(error){
    		error->setText(data);
    		error->setVisible(true);
    	}
    	qDebug() << "Error retrieving connections: " << data;
    	return;
    }

    ListView* list = m_root->findChild<ListView*>("timetableList");
    Label* head = m_root->findChild<Label*>("headInfo");
    if (!list)
    {
        qDebug() << "could not find list";
        return;
    }

    GroupDataModel* dm = new GroupDataModel(QStringList() << "date");
    dm->setGrouping(ItemGrouping::None);

    // parse the json response with JsonDataAccess
    JsonDataAccess ja;
    QVariant jsonva = ja.loadFromBuffer(data);
    QVariantList feed = jsonva.toMap()["connections"].toList();

    if(head){
		head->setText(jsonva.toMap()["from"].toMap().value("name").toString() + " -> " + jsonva.toMap()["to"].toMap().value("name").toString());
		head->setVisible(true);
    }

    for (QList<QVariant>::iterator it = feed.begin(); it != feed.end(); it++)
    {
        QVariantMap conn = it->toMap();
        QVariantMap* map = new QVariantMap();

        QDateTime departure = QDateTime::fromString(conn["from"].toMap().value("departure").toString(), Qt::ISODate);
        QDateTime arrival = QDateTime::fromString(conn["to"].toMap().value("arrival").toString(), Qt::ISODate);

        qint64 msecs = departure.msecsTo(arrival);
        QTime duration = QTime().addMSecs(msecs);

        map->insert("date", departure);
        map->insert("from", conn["from"].toMap().value("station").toMap().value("name"));
        map->insert("to", conn["to"].toMap().value("station").toMap().value("name"));
        map->insert("dep", departure.toString("hh:mm"));
        map->insert("arr", arrival.toString("hh:mm"));
        map->insert("duration", duration.toString("h:mm"));
        map->insert("transfers", conn["transfers"]);
        map->insert("platform", conn["from"].toMap().value("platform"));
        map->insert("sections", conn["sections"].toList());

        dm->insert(*map);
    }

    // set the data model to display
    list->setDataModel(dm);
    list->setVisible(true);
}

