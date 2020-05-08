import QtQuick 2.0
Item {

    width: 1024
    height: 600
    visible: true
    AnimatedImage { id: background; x: 0; y: 0; width: 1024; height: 600; source: "picture/background.gif"

        MouseArea {
            id: mouseArea_home
            x: 0
            y: 500
            width: 100
            height: 100
            onClicked: loader.source = "Home_v2.qml"
        }

    Image {
        id: image2
        x: 402
        y: 466
        width: 221
        height: 100
        source: "picture/pause-08.png"
    }

    MouseArea {
        id: mouseArea_pause
        x: 468
        y: 466
        width: 100
        height: 100
        onClicked: {
            if (giphy.paused == false)
                {
                giphy.paused = true
                background.paused = true
            }

            else
            {
                giphy.paused = false
                background.paused = false
            }

        }
    }

    Image {
        id: image_go_to_point2
        x: 703
        y: 466
        width: 100
        height: 100
        source: "picture/start.png"
        MouseArea{

            anchors.fill: image_go_to_point2
            onClicked: Loader.source="going_v2_point2.qml"
        }

    }}


    AnimatedImage { id: giphy; x: 395; y: 41; width: 239; height: 292; source: "picture/giphy.gif"}

        Text {
            id: text1
            x: 432
            y: 394
            color: "#ffffff"
            text: qsTr("going...")
            font.pixelSize: 50
        }

        Image {
            id: image1
            x: 0
            y: 500
            width: 100
            height: 100
            sourceSize.width: 0
            source: "picture/home_going.PNG"
        }
    }



