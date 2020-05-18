import QtQuick 2.3
import QtQuick.Controls 1.2
import io.qt.examples.backend 1.0
import GUI.APP.ROBOTICS 1.0

ApplicationWindow {
    //id:root
    visible: true
    width: 1024
    height: 600

    title: qsTr("Hello World")


    Weather{
    id:weather

    }

     Backend{
    id: backend

    }
    signal send()
    onSend:backend.goal="a"
    //onSend:weather.weather_status="0"


    Image {
        id: image1
        x: 0
        y: 0
        width: 1024
        height: 600
        source: "picture/home_v2_fix.png"

        Timer{
            interval: 500
            repeat: true
            running: true
            onTriggered: {
                time.text=Qt.formatDateTime(new Date(),"dd::mm::ss ")
            }
        }
        Text{
            id:time
            x: 900
            y: 0
            color: "#bf2929"
            //anchors.centerIn: parent
        }


        MouseArea {
            id: mouseArea_home
            x: 180
            y: 72
            width: 144
            height: 130
        }

        MouseArea {
            id: mouseArea_robot
            x: 696
            y: 328
            width: 160
            height: 205
            onClicked: loader.source = "robotics_v2.qml"
        }

        MouseArea {
            id: mouseArea_video
            x: 49
            y: 414
            width: 409
            height: 88
            onClicked: loader.source = "video_v2.qml"
        }

        MouseArea {
            id: mouseArea_picture
            x: 618
            y: 94
            width: 340
            height: 119
            onClicked: loader.source = "picture_v2.qml"
        }

        MouseArea {
            id: mouseArea_start
            x: 439
            y: 234
            width: 146
            height: 129

            //onClicked: loader.source = "going_v2.qml"

            onClicked:
            {

                backend.goal = "a"
                loader.source = "going_v2.qml"

            }}
        Component.onCompleted:
            mouseArea_start.clicked.connect(send)

        MouseArea {
            id: mouseArea_help
            x: 960
            y: 0
            width: 64
            height: 70
        }

        MouseArea {
            id: mouseArea_menu
            x: 0
            y: 0
            width: 69
            height: 70
            onClicked: {

            }
        }

        MouseArea {
            id: mouseArea_VN
            x: 527
            y: 0
            width: 69
            height: 65
        }
//        MouseArea{
//            id:load_menu
//            anchors.fill: root
//            onClicked: loader.source="menu.qml"
        //}

        MouseArea {
            id: mouseArea_EN
            x: 418
            y: 0
            width: 74
            height: 65
        }

    }
    Loader{
        id: loader
        x: 0
        y: 0
        anchors.rightMargin: 0
        anchors.bottomMargin: 7
        anchors.leftMargin: 0
        anchors.topMargin: -7
        anchors.fill: parent

        Button{
            id:openMenu
            text:"Menu"

            onClicked:{
                menu.popup()
            }
        }
        Menu{
            id:menu

            MenuItem{
                text:"check the weather"
                onTriggered: {
                    loader.source = "check_weather.qml"
                }
            }
            MenuItem{
                text:"Map"
            }
            MenuItem{
                text:"About"
            }

    }
    Label{
        anchors.centerIn: parent
        text:'Please click the menu to choose your options'
        font.pixelSize: 30
    }

    Rectangle {
        id: rectangle1
        x: -236
        y: -7
        width: 200
        height: 200
        color: "#ffffff"
    }

    Button {
        id: button1
        x: 46
        y: 202
        text: qsTr("detection")
        onClicked:{

        }
    }



}}

