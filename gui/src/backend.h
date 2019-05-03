#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <stdio.h>

#include "moving.h"

class backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString goal READ goal WRITE setGoal NOTIFY goalChanged)

public:
    explicit backend(QObject *parent = NULL);

    QString userName();
    void setUserName(const QString &userName);
    QString goal();
    void setGoal(const QString &goal);
    void go();

signals:
    void userNameChanged();
    void goalChanged();

private:
    QString m_userName;

public slots:
};

#endif // BACKEND_H
