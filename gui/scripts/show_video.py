#!/usr/bin/env python

import rospy
import sys
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import os


ros_path = '/opt/ros/kinetic/lib/python2.7/dist-packages'

if ros_path in sys.path:

    sys.path.remove(ros_path)
import cv2

sys.path.append('/opt/ros/kinetic/lib/python2.7/dist-packages')


def show_image_callback(data):
    bridge = CvBridge()
    cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
    cv2.imshow('image',cv_image)
    cv2.waitKey(1)
    #def bounding_boxes_callback(self,data):

        #while self.msg==1:
        # while self.msg == 1:
        # 	cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        # 	cv2.imshow('image',cv_image)
        # 	cv2.waitKey(1)
        # 	break
        #elif self.msg == 0 
        #self.img = self.bridge.imgmsg_to_cv2(data,"bgr8")


def listener():
    rospy.init_node('listener')


    #rospy.Subscriber('/receive_goal', String ,server.message_callback)
    # rospy.Subscriber('/usb_cam/image_raw', Image , server.image_callback)
    rospy.Subscriber('/darknet_ros/detection_image',Image,show_image_callback)

    rospy.spin()
if __name__ == '__main__':
    listener()