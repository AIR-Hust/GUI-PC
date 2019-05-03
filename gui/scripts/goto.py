#!/usr/bin/env python

import rospy
from gotopose import GoToPose
from std_msgs.msg import String

while not rospy.is_shutdown():
    rospy.init_node('receive_goal')

    navigator = GoToPose()

    def callback(data):
        if data.data == 'a': 
            print(0)
            navigator.goto({'x': 3, 'y': 1},{'r1':0, 'r2':0, 'r3':0, 'r4':1})
        if data.data == 'b': 
            print(0)
            navigator.goto({'x': 3, 'y': 1},{'r1':0, 'r2':0, 'r3':0, 'r4':1})

    receive_goal = rospy.Subscriber('/receive_goal', String, callback)

    rospy.spin()
        