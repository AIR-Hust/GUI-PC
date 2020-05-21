#!/usr/bin/env python

import rospy
from gotopose import GoToPose
from std_msgs.msg import String
from playsound import playsound
while not rospy.is_shutdown():
    rospy.init_node('receive_goal')

    navigator = GoToPose()

    def callback(data):
        if data.data == 'a': 
            print(0)
            # Point 1
            position1 = {'x': -0.8, 'y' : -0.5}
            quaternion1 = {'r1' : 0.000, 'r2' : 0.000, 'r3' : 0.000, 'r4' : 1.000}

            rospy.loginfo("Go to (%s, %s) pose", position1['x'], position1['y'])
            success = navigator.goto(position1, quaternion1)
            #playsound('/home/doanhdz/helloworld/turtlebot/demo.mp3')
            if success:
                rospy.loginfo("Reached the desired pose")
            else:
                rospy.loginfo("The base failed to reach the desired pose")

            # Sleep to give the last log messages time to be sent
            rospy.sleep(1)
            # Point 2
            position2 = {'x': -1, 'y' : 0}
            quaternion2 = {'r1' : 0.000, 'r2' : 0.000, 'r3' : 0.000, 'r4' : 1.000}

            rospy.loginfo("Go to (%s, %s) pose", position2['x'], position2['y'])
            success = navigator.goto(position2, quaternion2)
            #playsound('/home/doanhdz/helloworld/turtlebot/demo.mp3')
            if success:
                rospy.loginfo("Reached the desired pose")
            else:
                rospy.loginfo("The base failed to reach the desired pose")

            # Sleep to give the last log messages time to be sent
            rospy.sleep(1)
            # Point 3
            position3 = {'x': 0.5, 'y' : 0.5}
            quaternion3 = {'r1' : 0.000, 'r2' : 0.000, 'r3' : 0.000, 'r4' : 1.000}

            rospy.loginfo("Go to (%s, %s) pose", position2['x'], position2['y'])
            success = navigator.goto(position3, quaternion3)
            #playsound('/home/doanhdz/helloworld/turtlebot/demo.mp3')
            if success:
                rospy.loginfo("Reached the desired pose")
            else:
                rospy.loginfo("The base failed to reach the desired pose")

            # Sleep to give the last log messages time to be sent
            rospy.sleep(1)          
        if data.data == 'b': 
            print(0)
            navigator.goto([{'x': -1.84, 'y': -0.059}],[{'r1':0.000, 'r2':0.000, 'r3':0.000, 'r4':1.000}])

    receive_goal = rospy.Subscriber('/receive_goal', String, callback)

    rospy.spin()
        
