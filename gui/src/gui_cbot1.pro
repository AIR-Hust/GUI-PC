TEMPLATE = app

QT += qml quick widgets network gui core

SOURCES += main.cpp \
    backend.cpp \
    moving.cpp \
    weather.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    backend.h \
    moving.h \
    weather.h

DISTFILES += \
    ../gui_v2_robot/main.qml

