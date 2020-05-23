import QtQuick 2.3
import QtQuick.Controls 1.2
import io.qt.examples.backend 1.0
import GUI.APP.ROBOTICS 1.0
import speech.recognition 1.0

ApplicationWindow {
    //id:root
    visible: true
//    visibility: "FullScreen"
    width: 1024
    height: 600

    title: qsTr("AIR-HUST")

    Backend{
        id: backend
    }

    Speech{
        id: speech
    }

    signal send()
//    onSend: backend.goal="a"

    AnimatedImage {
        id: image1
        x: 0
        y: 0
        width: 1024
        height: 600
        source: "picture/emotion_face.gif"

        Timer{
            interval: 1
            repeat: true
            running: true
            onTriggered: {
//                time.text=Qt.formatDateTime(new Date(),"dd::mm::ss ")
                time.text = speech.text
                if (speech.speech_recog == "1")
                {
                    speech.speech_recog = "0";
                }
                else
                {
                    speech.speech_recog = "1"
                }
                if (speech.text == "thời tiết"){
                    loader.source = "check_weather.qml"
                    backend.goal = "weather"
                }
                else if(speech.text == "di chuyển"){
                    backend.goal = "rviz"
                }
                else if(speech.text == "đây là gì"){
                    backend.goal = "darknet_ros"
                }
                else if(speech.text == "thoát"){
                    backend.goal = "stop"
                }
            }
        }
        Text{
            id:time
            x: 800
            y: 0
            color: "#bf2929"
            text: speech.text
            //anchors.centerIn: parent
        }

/*
//        MouseArea {
//            id: mouseArea_home
//            x: 180
//            y: 72
//            width: 144
//            height: 130
//        }

//        MouseArea {
//            id: mouseArea_robot
//            x: 696
//            y: 328
//            width: 160
//            height: 205
//            onClicked: loader.source = "robotics_v2.qml"
//        }

//        MouseArea {
//            id: mouseArea_video
//            x: 49
//            y: 414
//            width: 409
//            height: 88
//            onClicked: loader.source = "video_v2.qml"
//        }

//        MouseArea {
//            id: mouseArea_picture
//            x: 618
//            y: 94
//            width: 340
//            height: 119
//            onClicked: loader.source = "picture_v2.qml"
//        }
*/

//        MouseArea {
//            id: mouseArea_start
//            x: 439
//            y: 234
//            width: 146
//            height: 129

//            //onClicked: loader.source = "going_v2.qml"

//            onClicked:
//            {
//                backend.goal = "a"
////                loader.source = "going_v2.qml"

//            }}
        Component.onCompleted:
            mouseArea_start.clicked.connect(send)

        MouseArea {
            id: mouseArea_help
            x: 960
            y: 0
            width: 64
            height: 70
            hoverEnabled: false
            onClicked: {

            }
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

        Button{
            id: openMenu
            text:"Menu"
            onClicked: {
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

        Button{
            id: button1
            x: 46
            y: 202
            text: qsTr("detection")
            onClicked:{
                 backend.goal = 'c'
            }
        }

        Button {
                id: button2
                x: 46
                y: 274
                text: qsTr("turn_off_detection")
                onClicked: {
                    backend.goal = 'b'
                }
            }

        Button {
                id: button3
                x: 46
                y: 153
                text: qsTr("turn_on_cam")
                onClicked: {
                    backend.goal = 'turn on camera'
                }
            }

        Button {
                id: button4
                x: 46
                y: 104
                text: qsTr("turn_off_cam")
                onClicked: {
                    backend.goal = 'turn off camera'
                }
            }

        Button {
                id: button5
                x: 46
                y: 330
                text: qsTr("turn_on_darknet")
                onClicked: {
                    backend.goal = 'turn on darknet'
                }
            }

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

        Button {
            id: button10
            x: 918
            y: 425
            text: qsTr("rviz")
            onClicked:{
                backend.goal = "rviz"
            }
        }

        Button {
            id: button20
            x: 918
            y: 465
            text: qsTr("about")
        }

        Button {
            id: button30
            x: 918
            y: 558
            text: qsTr("weather")
            onClicked: {
                loader.source = "check_weather.qml"
                backend.goal = "weather"
            }
        }

        Button {
            id: button40
            x: 918
            y: 512
            text: qsTr("stop")
            onClicked: {
                backend.goal = "stop"
                //                loader.source = "speech.qml"
            }
        }

        Image {
            id: image2
            x: 940
            y: 8
            width: 106
            height: 64
            z: 1
            source: "picture/pause-08.png"
        }

    }

    Rectangle {
        id: rectangle1
        x: -236
        y: -7
        width: 200
        height: 200
        color: "#ffffff"
    }

}

