import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.0
import speech.recognition 1.0

ApplicationWindow {
    width: 1024
    height: 600

    title: qsTr("Hello World")

    property string text_s

    Speech{
        id: speech
    }

    Timer{
        id: speech_update
        interval: 1
        running: true
        repeat: true
        onTriggered: {
            if (speech.speech_recog == "1")
            {
                speech.speech_recog = "0";
            }
            else
            {
                speech.speech_recog = "1"
            }

            text_s = speech.text;
        }
    }

    Image {
        id: image1
        x: 0
        y: 0
        width: 1024
        height: 600
        source: "picture/robot-04.png"

        Text {
            id: text1
            x: 388
            y: 132
            width: 539
            height: 209
            text: qsTr(text_s)
            font.pixelSize: 100
        }
    }


}
