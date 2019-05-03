TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp \
    backend.cpp \
    moving.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    backend.h \
    moving.h

DISTFILES += \
    ../gui_v2_robot/main.qml

