#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDir>
#include <iostream>
//#include <string.h>
//#include <string>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include "ros/ros.h"
#include <QtQml>

#include "weather.h"
//#include "speech_recognition.h"
int main(int argc, char *argv[])
{
    QDir dir;
    string current_dir = dir.homePath().toUtf8().constData();
    cout << current_dir;
    current_dir += "/catkin_ws/src/GUI-PC/gui/gui_v2_robot/check_weather.qml";
    QString cr_dir = QString::fromStdString(current_dir);
    ros::init(argc, argv, "weather");
    QApplication app(argc, argv);
    qmlRegisterType<weather>("GUI.APP.ROBOTICS", 1, 0, "Weather");

    QQmlApplicationEngine engine;
    engine.load(QUrl(cr_dir));

    return app.exec();
}

