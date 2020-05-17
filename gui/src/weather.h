#ifndef WEATHER_H
#define WEATHER_H

#include <QObject>
#include <QString>
#include <string>
#include <stdio.h>
#include "ros/ros.h"
#include "std_msgs/String.h"

#include <string.h>
#include <iostream>

using namespace std;

class weather : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString weather_status READ weather_status WRITE setWeather_status NOTIFY weather_statusChanged)
    Q_PROPERTY(QString description READ description WRITE setDescription )

    Q_PROPERTY(QString temperature READ temperature WRITE setTemperature )
    Q_PROPERTY(QString humidity READ humidity WRITE setHumidity)

public:
    explicit weather(QObject *parent = NULL);

    QString weather_status();
    QString temperature();
    QString humidity();
    QString description();

    void setWeather_status(const QString weather_status);
    void setHumidity(const QString humidity);
    void setTemperature(const QString temperature);
    void setDescription(const QString description);

    string temp;
    std_msgs::String msg;
    void temperatureCallBack(const std_msgs::String::ConstPtr& msg);
    void descriptionCallBack(const std_msgs::String::ConstPtr &msg);
    void humidityCallBack(const std_msgs::String::ConstPtr &msg);

signals:
    void weather_statusChanged();

public slots:
    void updateweather();

private:
    QString m_weather_status;
    QString m_description;
    QString m_temperature;
    QString m_humidity;
};

#endif // WEATHER_H
