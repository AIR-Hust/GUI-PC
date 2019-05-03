import QtQuick 2.0

Item {
    Image {
        id: image1
        x: 0
        y: 0
        width: 1024
        height: 600
        source: "picture/hello_v1_cuong.png"

        MouseArea {
            id: mouseArea_start
            x: 462
            y: 482
            width: 100
            height: 100
        }

        MouseArea {
            id: mouseArea_home
            x: 0
            y: 516
            width: 76
            height: 84
            onClicked: loader.source = "Home_v2.qml"
        }
    }

}

