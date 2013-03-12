/*
 * DataLoader.h
 *
 *  Created on: Mar 12, 2013
 *      Author: km
 */

#ifndef DATALOADER_H_
#define DATALOADER_H_

#include <QObject>
#include <QString>
#include <QtNetwork/QNetworkReply>

class DataLoader: public QObject {
	Q_OBJECT
public:
	DataLoader();
	virtual ~DataLoader();

	void loadConnections(QString from, QString to);

public Q_SLOTS:
	void onConnectionsReply(QNetworkReply* reply);

Q_SIGNALS:

	void connectionsLoaded(const QString &data, bool success);

};

#endif /* DATALOADER_H_ */
