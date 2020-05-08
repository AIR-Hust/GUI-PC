#!/usr/bin/env python

import rospy
from gotopose_copy import GoToPose
from std_msgs.msg import String

while not rospy.is_shutdown():
    rospy.init_node('receive_goal')

    navigator = GoToPose()

    def callback(data):
        if data.data == 'a': 
            print(0)
            position = [{'x': -1.26, 'y' : -0.757}]
            quaternion = [{'r1' : 0.000, 'r2' : 0.000, 'r3' : 0.000, 'r4' : 1.000}]
            navigator.goto(position,quaternion)
        if data.data == 'b': 
            print(0)
            navigator.goto([{'x': -1.84, 'y': -0.059}],[{'r1':0.000, 'r2':0.000, 'r3':0.000, 'r4':1.000}])

    receive_goal = rospy.Subscriber('/receive_goal', String, callback)

    rospy.spin()
        
