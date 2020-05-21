#!/usr/bin/env python

import rospy

from std_msgs.msg import String
from speech_recognition_msgs.msg import SpeechRecognitionCandidates

if __name__ == "__main__":


    

    text = SpeechRecognitionCandidates() 
    text.transcript.append("th\u1EDDi ti\u1EBFt")
    text.confidence.append(1)

    rospy.init_node("fake_speech")
    speech = rospy.Publisher('/speech_to_text', SpeechRecognitionCandidates, queue_size = 2)

    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        speech.publish(text)
        rate.sleep()