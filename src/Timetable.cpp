// Default empty project template
#include "Timetable.hpp"
#include "DataLoader.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/GroupDataModel>
#include <bb/cascades/ListView>
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

QString Timetable::testInvoke(){
	return "test okay!";
}

void Timetable::getConnections(QString from, QString to){

    DataLoader* loader = new DataLoader();
    connect(loader, SIGNAL(connectionsLoaded(QString, bool)), this, SLOT(onConnectionsList(QString, bool)));

    loader->loadConnections(from, to);
}

void Timetable::onConnectionsList(QString data, bool success){
    if (!success)
    {
    	qDebug() << "Error retrieving connections: " << data;
    	return;
    }

    ListView* list = m_root->findChild<ListView*>("timetableList");
    if (!list || list->dataModel() != NULL)
    {
        qDebug() << "basic list already populated";
        return; //if basic timeline list not found or already populated do nothing
    }

    // Create a group data model with id as the sorting key
    GroupDataModel* dm = new GroupDataModel();
    dm->setGrouping(ItemGrouping::None);

    // parse the json response with JsonDataAccess
    JsonDataAccess ja;
    QVariant jsonva = ja.loadFromBuffer(data);

    // the qvariant is an array of tweets which is extracted as a list
    QVariantList feed = jsonva.toList();

    // for each object in the array, push the variantmap in its raw form
    // into the ListView
    for (QList<QVariant>::iterator it = feed.begin(); it != feed.end(); it++)
    {
        QVariantMap tweet = it->toMap();
        dm->insert(tweet);
    }

    // set the data model to display
    list->setDataModel(dm);
    list->setVisible(true);
}

