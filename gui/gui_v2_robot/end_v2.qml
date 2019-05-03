import QtQuick 2.0

Item {
    Image {
        id: image1
        x: 0
        y: 0
        width: 1024
        height: 600
        source: "picture/end_v2_cuong.png"

        MouseArea {
            id: mouseArea_home
            x: 0
            y: 500
            width: 100
            height: 100
            onClicked: loader.source = "Home_v2.qml"
        }
    }

}

