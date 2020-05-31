import QtQuick 2.3
import QtQuick.Window 2.2
import GUI.APP.ROBOTICS 1.0
//import speech.recognition 1.0


Item {
//    visible:
    width: 1024
    height: 600

    property bool state_rate: false
    property bool back_ground: false

    property int very_bad: 0
    property int bad: 0
    property int ok: 0
    property int good: 0
    property int very_good: 0
    property int count: 0

    property real trungbinh: 0
    property real trungbinh1: 0
    property double time_wait: 10000
    property double time_update: 100
    property string link_gif
    property string  temperature
    property string  humidity
    property string description
//    property string text_TTS

    Weather {
        id: weather
    }


    Timer {
        id: time_update_weather
        interval: time_update
        running: true
        repeat: true
        onTriggered: {
            if (count > 8){
                loader.source = "main.qml";
            }

            count = count+1; // Biến đếm số lần lặp
            // cập nhật thời tiết mỗi lần timer reset
            if (weather.weather_status == "1")
            {
                weather.weather_status = "0";
            }
            else{
                weather.weather_status = "1";
            }

            // cập nhật thời tiết vào các biến trong qml
            humidity = weather.humidity;
            temperature = weather.temperature;
            description = weather.description;
            //thay đổi đường dẫn link_gif
            if ((parseInt(description) >= 200) && (parseInt(description) <= 232))
                link_gif = "picture/rainy.png"; // Thunderstorm
                console.log(description);
            if ((parseInt(description) >= 300) && (parseInt(description) <= 321))
                link_gif = "picture/rainy.png"; // Drizzle
                console.log(description);
            if ((parseInt(description) >= 500) && (parseInt(description) <= 504))
                link_gif = "picture/rainy.png"; // Rain
                console.log(description);
            if ((parseInt(description) >= 511) && (parseInt(description) <= 531))
                link_gif = "picture/rainy.png"; // Shower rain
                console.log(description);
            if ((parseInt(description) >= 600) && (parseInt(description) <= 622))
                link_gif = "picture/rainy.png"; // Snow
                console.log(description);
            if ((parseInt(description) >= 700) && (parseInt(description) <= 799))
                link_gif = "picture/cloudy.png"; // Atmosphere
                console.log(description);
            if (description == "800")
                link_gif = "picture/sunny.png"; // Clear sky
                console.log(description);
            if (description == "801")
                link_gif = "picture/sunny.png"; // Few clouds
                console.log(description);
            if (description == "802")
                link_gif = "picture/cloudy.png"; // Scattered clouds
                console.log(description);
            if (description >= "803")
                link_gif = "picture/cloudy.png"; // Broken clouds
                console.log(description);
        }
    }


    Window {
        id: window_rate
        visible: state_rate
        width: 600
        height: 400

        Rectangle {
            id: video
            width: window_rate.width
            height: window_rate.height
            color: "#ffffff"

            Text {
                x: 272
                y: 264
                color: "#09141a"
                text: qsTr("Cảm ơn đánh giá của bạn!")
                anchors.verticalCenterOffset: -95
                anchors.horizontalCenterOffset: 0
                font.bold: true
                font.pointSize: 30
                anchors.centerIn: parent
            }
            Text {
                id: text1
                x: 206
                y: 178
                text: "đánh giá hiện tại: " + trungbinh1
                font.pixelSize: 25
            }
            Rectangle {
                id: button_ok
                x: 200
                y: 300
                width: 200
                height: 50
                color: "#6184de"
                border.color: "#26a3e2"
                border.width: 5
                Text {
                    x: 272
                    y: 264
                    color: "#050708"
                    text: qsTr("OK")
                    font.bold: true
                    font.pointSize: 18
                    anchors.centerIn: parent
                }

                MouseArea {
                    id: mouseArea1
                    x: 0
                    y: 0
                    width: button_ok.width
                    height: button_ok.height
                    onClicked:{
                        state_rate = false;
                        back_ground = false;
                        time_rate.stop();
                    }
                }
            }

        }


    }

    Rectangle {
        id: weather_status
        width: 724
        height: 500
        color: "#86e3de"
        AnimatedImage {
            id: image_weather
            x: 175
            y: 80
            width: 375
            height: 326
            source: link_gif
        }
    }

    Rectangle {
        id: rate
        x: 0
        y: 500
        width: 1024
        height: 100
        color: "#67c9dc"

        Image {
            id: very_bad_icon
            x: 95
            y: 0
            width: bad_icon.x - 180
            height: 100
            source: "picture/very_bad.png"
            MouseArea {
                id: mouseArea2
                x: 0
                y: 0
                width: 100
                height: 100
                onClicked:{
                    state_rate = true;
                    very_bad = very_bad + 1;
                    trungbinh = (very_bad*1 + bad*2 +ok*3 + good*4 + very_good*5)/(very_bad + bad + ok + good + very_good);
                    back_ground = true;
                    trungbinh1 = Math.round(trungbinh*100)/100
                    time_rate.start();
                }
            }
        }

        Image {
            id: bad_icon
            x: ok_icon.x - 180
            y: 0
            width: 100
            height: 100
            source: "picture/bad.png"

            MouseArea {
                id: mouseArea3
                x: 0
                y: 0
                width: 100
                height: 100
                onClicked:{
                    state_rate = true;
                    bad = bad + 1;
                    trungbinh = (very_bad*1 + bad*2 +ok*3 + good*4 + very_good*5)/(very_bad + bad + ok + good + very_good);
                    back_ground = true;
                    trungbinh1 = Math.round(trungbinh*100)/100;
                }
            }
        }

        Image {
            id: ok_icon
            x: 462
            y: 0
            width: 100
            height: 100
            source: "picture/ok.png"

            MouseArea {
                id: mouseArea4
                x: 0
                y: 0
                width: 100
                height: 100
                onClicked:{
                    state_rate = true;
                    ok = ok + 1;
                    trungbinh = (very_bad*1 + bad*2 +ok*3 + good*4 + very_good*5)/(very_bad + bad + ok + good + very_good);
                    back_ground = true;
                    trungbinh1 = Math.round(trungbinh*100)/100;
                    time_rate.start();
                }
            }
        }

        Image {
            id: good_icon
            x: ok_icon.x + 180
            y: 0
            width: 100
            height: 100
            source: "picture/good.png"

            MouseArea {
                id: mouseArea5
                x: 0
                y: 0
                width: 100
                height: 100
                onClicked:{
                    state_rate = true;
                    good = good + 1;
                    trungbinh = (very_bad*1 + bad*2 +ok*3 + good*4 + very_good*5)/(very_bad + bad + ok + good + very_good);
                    back_ground = true;
                    trungbinh1 = Math.round(trungbinh*100)/100;
                    time_rate.start();
                }
            }
        }

        Image {
            id: very_good_icon
            x: good_icon.x+180
            y: 0
            width: 100
            height: 100
            source: "picture/very_good.png"

            MouseArea {
                id: mouseArea6
                x: 0
                y: 0
                width: 100
                height: 100
                onClicked:{
                    state_rate = true;
                    very_good = very_good + 1;
                    trungbinh = (very_bad*1 + bad*2 +ok*3 + good*4 + very_good*5)/(very_bad + bad + ok + good + very_good);
                    back_ground = true;
                    trungbinh1 = Math.round(trungbinh*100)/100;
                    time_rate.start();
                }
            }
        }
    }

    MouseArea {
        id: mouseArea_background
        x: 0
        y: 0
        width: 1024
        height: 600
        enabled: back_ground
        onClicked:{
            state_rate = false;
            back_ground = false;
            time_rate.stop();
        }
    }

    Rectangle {
        id: weather_info
        x: 724
        y: 0
        width: 1024-weather_status.width
        height: weather_status.height
        color: "#86e3de"

        Row {
            id: temperature_box
            x: -30
            y: 69
            width: 500
            height: 150



            Image {
                id: image2
                x: 12
                y: 25
                width: 100
                height: 100
                source: "picture/temperature-weather-thermometer-512.png"
            }

            Text {
                id: text2
                x: 100
                y: 25
                width: 200
                text: qsTr(temperature + "\u00B0" + "C")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 90
            }
        }

        Row {
            id: humidity_box
            x: -30
            y: 245
            width: 300
            height: 150
            Image {
                id: image7
                x: 0
                y: 25
                width: 100
                height: 100
                source: "picture/huminity.png"
            }

            Text {
                id: text3
                x: 500
                y: 25
                width: 200
                text: humidity + "%"
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 90
            }
        }

        MouseArea {
            id: back_button
            x: 210
            y: 500
            width: 90
            height: 100
            onClicked:{
                loader.source = "main.qml"
            }
        }
    }
}
