import QtQuick 2.3
import QtQuick.Controls 1.2
import io.qt.examples.backend 1.0
import GUI.APP.ROBOTICS 1.0
import speech.recognition 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4

Item {
    Backend{
        id: backend
    }

    Speech{
        id: speech
    }

    property string command: ""

    signal send()
    //    onSend: backend.goal="a"

    AnimatedImage {
        id: image1
        x: 0
        y: 0
        width: 1024
        height: 600
        scale: 1.3
        source: "picture/emotion_face.gif"

        Timer{
            id: timer1
            interval: 200
            repeat: true
            running: true
            onTriggered: {
//                speech.text = "";
                command = speech.text;

//                time.text=Qt.formatDateTime(new Date(),"dd::mm::ss ")
                if (speech.speech_recog == "1"){
                    speech.speech_recog = "0";
                }
                else{
                    speech.speech_recog = "1";
                }
//                if (speech.text == "thời tiết"){
//                    loader.source = "check_weather.qml"
//                    backend.goal = "weather"
//                }
//                else if(speech.text == "di chuyển"){
//                    backend.goal = "rviz"
//                }
//                else if(speech.text == "đây là gì"){
//                    backend.goal = "turn on darknet"
//                }
//                else if(speech.text == "thoát"){
//                    backend.goal = "stop"
//                }
                if (command == "thời tiết"){
                    loader.source = "check_weather.qml"
                    backend.goal = "weather"
                }
                else if(command == "di chuyển"){
                    backend.goal = "rviz"
                }
                else if(command == "đây là gì"){
                    backend.goal = "turn on darknet"
                }
                else if(command == "thoát"){
                    backend.goal = "stop"
                }
                command = "";

            }
        }
        Text{
            id:time
            x: 423
            y: 78
            color: "#bf2929"
            text: speech.text
            font.pointSize: 20
            //anchors.centerIn: parent
        }

        Component.onCompleted:
            mouseArea_start.clicked.connect(send)

        Menu{
            id:menu

            MenuItem{
                text:"check the weather"
                onTriggered: {
                    loader.source = "check_weather.qml"
                    backend.goal = "weather"
                }
            }
            MenuItem{
                text:"Stop"
                onTriggered: {
                    backend.goal = "stop"
                }
            }
            MenuItem{
                text:"Rviz"
                onTriggered: {
                    backend.goal = "rviz"
                }
            }
            MenuItem{
                text:"Darknet_ros"
                onTriggered: {
                    backend.goal = 'turn on darknet'
                }
            }
            MenuItem{
                text:"About"
            }
            MenuItem{
                text:"Quit"
                onTriggered: {
//                    main_window.close();
                    Qt.quit();
                }
            }
        }

    }
    Image {
        id: image2
        x: -17
        y: -24
        width: 100
        height: 100
        scale: 0.5
        source: "picture/menu-bar-icon.png"
        MouseArea {
            id: mouseArea1
            x: 8
            y: 0
            width: 50
            height: 58
            onClicked: {
                menu.popup()
            }
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

