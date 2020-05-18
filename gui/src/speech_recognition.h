#ifndef SPEECH_RECOGNITION_H
#define SPEECH_RECOGNITION_H

#include <QObject>
#include <QString>
#include <string>
#include <stdio.h>
#include "ros/ros.h"
#include "std_msgs/String.h"
#include "SpeechRecognitionCandidates.h"

#include <string.h>
#include <iostream>

using namespace std;

class speech_recognition : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString speech_recog READ speech_recog WRITE setSpeech_recog NOTIFY ReceivedSpeech)
    Q_PROPERTY(QString text READ text WRITE setText)

public:
    explicit speech_recognition(QObject *parent = NULL);

    QString speech_recog();
    QString text();

    void setSpeech_recog(const QString speech_recog);
    void setText(const QString text);

//    string text_s;
    std_msgs::String msg;
    speech_recognition_msgs::SpeechRecognitionCandidates text_s;

    void textCallBack(const speech_recognition_msgs::SpeechRecognitionCandidates::ConstPtr &text_s);

signals:
    void ReceivedSpeech();

public slots:
    void updatespeech();

private:
    QString m_speech_recog;
    QString m_text;

};

#endif // SPEECH_RECOGNITION_H
