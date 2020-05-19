#include "speech_recognition.h"

// Text callback
void speech_recognition::textCallBack(const speech_recognition_msgs::SpeechRecognitionCandidates::ConstPtr &text_s)
{
    ROS_INFO("I heard: [%s]",text_s->transcript[0].c_str());
    m_text = QString::fromStdString((text_s->transcript[0].c_str())).toUtf8();
//    m_text = m_text.toUtf8();
//    ROS_INFO(m_text);
}

speech_recognition::speech_recognition(QObject *parent): QObject(parent)
{
    // kết nối signal weather_statusChanged với slot updateweather
    connect(this,SIGNAL(ReceivedSpeech()),this,SLOT(updatespeech()));
}

QString speech_recognition::speech_recog()
{
    return m_speech_recog;
}

QString speech_recognition::text()
{
    return m_text;
}

// Function to update speech_to_text
void speech_recognition::setSpeech_recog(const QString speech_recog)
{
    //Subscribe to ROS topics to get text information
    ros::NodeHandle m;
    ros::Rate loop_rate(1.5); // loop rate in Hz
    ROS_INFO("A");
    ros::Subscriber speech = m.subscribe("/speech_to_text", 2, &speech_recognition::textCallBack, this);
    ROS_INFO("B");

    loop_rate.sleep(); // Wait for topic
    ros::spinOnce(); // Call callback function once
    ros::spinOnce(); // Call callback function once
    if (m_speech_recog == speech_recog)
        return;
    m_speech_recog = speech_recog;
}

void speech_recognition::setText(const QString text)
{
    if (m_text == text)
        return;
    m_text = text;
}

void speech_recognition::updatespeech()
{

}



