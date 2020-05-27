TEMPLATE = app

QT += qml quick widgets gui core network

SOURCES += main.cpp \
    simplemenu.cpp \
    ../src/weather.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    ../src/weather.h \
    simplemenu.h

