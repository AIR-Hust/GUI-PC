import QtQuick 2.0

Item {
    Image {
        id: image1
        x: 0
        y: 0
        width: 1024
        height: 600
        source: "picture/video_v2_cuong.png"

        MouseArea {
            id: mouseArea_next
            x: 587
            y: 328
            width: 189
            height: 174
            onClicked: loader.source = "going_v2.qml"
        }

        MouseArea {
            id: mouseArea_pause
            x: 237
            y: 328
            width: 185
            height: 174
        }

        MouseArea {
            id: mouseArea_home
            x: 0
            y: 519
            width: 89
            height: 81
            onClicked: loader.source = "Home_v2.qml"
        }
    }

}

