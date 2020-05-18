#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <stdio.h>

class backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString goal READ goal WRITE setGoal NOTIFY goalChanged)

public:
    explicit backend(QObject *parent = NULL);

    QString goal();
    void setGoal(const QString &goal);
    void go();

signals:
    void goalChanged();

private:
    QString m_userName;

};

#endif // BACKEND_H
