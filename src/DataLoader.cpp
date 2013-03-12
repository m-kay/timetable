/*
 * DataLoader.cpp
 *
 *  Created on: Mar 12, 2013
 *      Author: km
 */

#include "DataLoader.hpp"

#include <QtNetwork/QNetworkAccessManager>
#include <QUrl>
#include <QtNetwork/QNetworkRequest>
#include <QtNetwork/QNetworkReply>
#include <QDebug>

DataLoader::DataLoader() {
	// TODO Auto-generated constructor stub

}

DataLoader::~DataLoader() {
	// TODO Auto-generated destructor stub
}

void DataLoader::loadConnections(QString from, QString to){
	QNetworkAccessManager* netManager = new QNetworkAccessManager();
	if (!netManager)
	{
		qDebug() << "Unable to create QNetworkAccessManager!";
		emit connectionsLoaded("Unable to create QNetworkAccessManager!", false);
		return;
	}

	QString queryUri = "http://transport.opendata.ch/v1/connections?";
	queryUri += "from=" + from;
	queryUri += "&to=" + to;
	queryUri += "&limit=1";
	QUrl url(queryUri);
	QNetworkRequest req(url);

	connect(netManager, SIGNAL(finished(QNetworkReply*)), this, SLOT(onConnectionsReply(QNetworkReply*)));
	QNetworkReply* ipReply = netManager->get(req);
}

void DataLoader::onConnectionsReply(QNetworkReply* reply){

	//QNetworkReply* reply = qobject_cast<QNetworkReply*>(sender());
	QString response;
	bool success = false;
	if (reply)
	{
		if (reply->error() == QNetworkReply::NoError)
		{
			int available = reply->bytesAvailable();
			if (available > 0)
			{
				const QByteArray buffer = reply->readAll();
				response = QString::fromUtf8(buffer);
				success = true;
			}

		}
		else
		{
			response =  QString("Error: ") + reply->errorString() + QString(" status:") + reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toString();
			qDebug() << response;
		}
		reply->deleteLater();
	}
	if (response.trimmed().isEmpty())
	{
		response = "Failed to load connections. Check internet connection";
		qDebug() << response;
	}
	emit connectionsLoaded(response, success);
}

