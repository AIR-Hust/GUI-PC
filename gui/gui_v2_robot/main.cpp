#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDir>
#include <iostream>
#include <string.h>
#include <string>
#include <QApplication>
#include "ros/ros.h"
#include <QtQml>

#include "weather.h"
#include "speech_recognition.h"
int main(int argc, char *argv[])
{
    QDir dir;
    string current_dir = dir.homePath().toUtf8().constData();
    current_dir += "/catkin_ws/src/GUI-PC/gui/gui_v2_robot/main.qml";
    QString cr_dir = QString::fromStdString(current_dir);
    QApplication app(argc, argv);
    qmlRegisterType<weather>("GUI.APP.ROBOTICS", 1, 0, "Weather");
    qmlRegisterType<speech_recognition>("speech.recognition", 1, 0, "Speech");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

