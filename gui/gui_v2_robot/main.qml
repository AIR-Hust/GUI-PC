import QtQuick 2.3
import QtQuick.Controls 1.2
import io.qt.examples.backend 1.0

ApplicationWindow {
    //id:root
    visible: true
    width: 1024
    height: 600

    title: qsTr("Hello World")

     Backend{
    id: backend

    }
    signal send()
    onSend:backend.goal="a"
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

                //backend.goal = "a"
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
        }

        MouseArea {
            id: mouseArea_VN
            x: 527
            y: 0
            width: 69
            height: 65
        }

        TextInput {
            id: textInput1
            x: 0
            y: 69
            width: 69
            height: 26
            color: "#483094"
            text: qsTr("Menu")
            font.bold: true
            font.family: "Times New Roman"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
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
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
    }



}

