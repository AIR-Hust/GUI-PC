import QtQuick 2.0

Item {
    Image {
        id: image1
        x: 0
        y: 0
        width: 1024
        height: 600
        source: "picture/home_v2_fix.png"

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
            onClicked: loader.source = "going_v2.qml"

        }

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

        MouseArea {
            id: mouseArea_EN
            x: 418
            y: 0
            width: 74
            height: 65
        }
    }
}

