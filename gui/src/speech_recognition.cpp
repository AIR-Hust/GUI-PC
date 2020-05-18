#include "speech_recognition.h"

// Text callback
void speech_recognition::textCallBack(const speech_recognition_msgs::SpeechRecognitionCandidates::ConstPtr &msg)
{
//    SpeechRecognitionCandidates text;
//    string speech_recog;
    ROS_INFO("I heard: [%s]", msg->transcript[0].c_str());
//    text = msg->transcript.c_str(); // Read data from topic
    m_speech_recog = QString::fromStdString(msg->transcript[0].c_str()); //(text); // Save data to speech private attribute
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
    ros::Rate loop_rate(2); // loop rate in Hz
    ROS_INFO("A");
    ros::Subscriber speech = m.subscribe("/speech_to_text", 2, &speech_recognition::textCallBack, this);
    ROS_INFO("B");

    loop_rate.sleep(); // Wait for topic
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



