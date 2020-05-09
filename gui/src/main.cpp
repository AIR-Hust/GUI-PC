#include <QApplication>
#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QtQml>
#include "ros/ros.h"



#include "backend.h"
//#include "moving.h"

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "node_name");

    QApplication app(argc, argv);

    qmlRegisterType<backend>("io.qt.examples.backend", 1, 0, "Backend");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("/home/tungngo/catkin_ws/src/GUI-robot/gui/gui_v2_robot/main.qml")));

    return app.exec();
}

