import QtQuick 2.0

Item {
    Image {
        id: image1
        x: 0
        y: 0
        width: 1024
        height: 600
        source: "picture/IOT_Robot_v2_cuong.png"

        MouseArea {
            id: mouseArea_next
            x: 579
            y: 298
            width: 196
            height: 176
            onClicked: loader.source = "going_v2.qml"
        }

        MouseArea {
            id: mouseArea_pause
            x: 225
            y: 298
            width: 192
            height: 176
        }

        MouseArea {
            id: mouseArea_home
            x: 0
            y: 512
            width: 93
            height: 88
            onClicked: loader.source = "Home_v2.qml"
        }
    }

}

