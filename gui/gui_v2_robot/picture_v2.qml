import QtQuick 2.0

Item {
    Image {
        id: picture_v2
        x: 0
        y: 0
        width: 1024
        height: 600
        source: "picture/picture_v2_cuong.png"

        MouseArea {
            id: mouseArea_next
            x: 585
            y: 290
            width: 191
            height: 182
            onClicked: loader.source = "going_v2.qml"
        }

        MouseArea {
            id: mouseArea_pause
            x: 228
            y: 290
            width: 190
            height: 182
        }

        MouseArea {
            id: mouseArea_home
            x: 0
            y: 517
            width: 84
            height: 83
            onClicked: loader.source = "Home_v2.qml"
        }
    }

}

