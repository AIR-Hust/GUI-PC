import roslaunch
import rospy

rospy.init_node('en_Mapping', anonymous=True)
uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
roslaunch.configure_logging(uuid)
launch = roslaunch.parent.ROSLaunchParent(uuid, ["/home/doanhdz/catkin_ws/src/usb_cam/launch/usb_cam-test.launch","/home/doanhdz/catkin_ws/src/darknet_ros/darknet_ros/launch/darknet_ros.launch"])
launch.start()


rospy.loginfo("started")

rospy.sleep(100)
# 3 seconds later
launch.shutdown()
