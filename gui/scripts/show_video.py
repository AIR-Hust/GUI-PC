#!/usr/bin/env python

import rospy
import sys
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
ros_path = '/opt/ros/kinetic/lib/python2.7/dist-packages'

if ros_path in sys.path:

    sys.path.remove(ros_path)

import cv2

sys.path.append('/opt/ros/kinetic/lib/python2.7/dist-packages')
class image:
    def __init__(self):
        self.img = None
        self.msg = None   
        self.bridge = CvBridge()
    def image_callback(self,data):
        self.img = data
        
    def message_callback(self,data):
        if data.data == 'a':
            self.show_image()
    
    def show_image(self):
       
        cv_image =self.bridge.imgmsg_to_cv2(self.img, "bgr8")
        cv2.imshow('image',cv_image)
        cv2.waitKey(0)    

if __name__ == '__main__':
    rospy.init_node('listener')
    server = image()

    rospy.Subscriber('/receive_goal', String , server.message_callback)
    rospy.Subscriber('/usb_cam/image_raw', Image , server.image_callback)

    rospy.spin()




    
