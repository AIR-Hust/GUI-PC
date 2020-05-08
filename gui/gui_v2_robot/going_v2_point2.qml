import QtQuick 2.0
import io.qt.examples.backend 1.0

Item {
    width: 1024
    height: 600
    visible: true
    Backend{
     id: backend

    }

    signal send()
    onSend: backend.goal="b"
    Image {
        id: destination
        x: 0
        y: 0
        width:1024
        height: 600
        source: "picture/IOT_Robot_v2_cuong.png"

        MouseArea {
            id: mouseArea1_go
            x: 579
            y: 287
            width: 190
            height: 181
            onClicked: {
                Loader.source="going_v2.qml"
            }
        }
        Component.onCompleted:
            mouseArea1_go.clicked.connect(send)
        MouseArea {
            id: mouseArea2_stop
            x: 234
            y: 294
            width: 180
            height: 174
        }
    }

}

