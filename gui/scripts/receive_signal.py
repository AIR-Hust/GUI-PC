#!/usr/bin/env python
import rospy
import sys
from std_msgs.msg import String
import subprocess as sp

extProc = None
def message_callback(data):
    if data.data == 'c':
        extProc = sp.Popen(['python','show_video.py'])
        status = sp.Popen.poll(extProc) # status should be 'None'
    elif data.data == 'b':
        sp.Popen.terminate(extProc)
        extProc = None

def receiver():
    rospy.init_node('receiver_msg')
    rospy.Subscriber('/receive_goal',String,message_callback)

    rospy.spin()

if __name__ == '__main__':
    receiver()