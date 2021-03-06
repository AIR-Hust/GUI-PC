#!/usr/bin/env python

import roslaunch
import rospy
import os

from os.path import expanduser

from std_msgs.msg import String

package = ""
executable = ""
launch_file = ""
launch_flag = False
darknet_flag = False
option_flag = False

def callback(data):
    global package, executable, node, stop, launch, path, launch_file, darknet_flag, option_flag, launch_flag
    stop = False
    
    print(data.data)
    if data.data == "rviz":
        print('Start moving')
        # option_flag = True
        darknet_flag = True
        # package = 'gui'
        # executable = ''
        # launch_file = [home+"/dashgo_ws/src/dashgo/dashgo_nav/launch/gmapping.launch"]
        launch_file = [home+"/dashgo_ws/src/dashgo/dashgo_gazebo/launch/gmapping.launch"]
    elif data.data == "b":
        print('34')
        package = 'gui'
        executable = 'show_video.py'
        stop = True
        option_flag = False
        
        process.stop()
    # elif data.data == "turn on camera":
    #     print('turn on camera')
    #     # option_flag = True
    #     darknet_flag = True
    #     launch_file = [home+"/catkin_ws/src/usb_cam/launch/usb_cam-test.launch",home+"/catkin_ws/src/darknet_ros/darknet_ros/launch/darknet_ros.launch"]
       
        
    elif data.data == "turn on darknet":
        print("Start darknet")
        darknet_flag = True
        launch_file = [home+"/catkin_ws/src/usb_cam/launch/usb_cam-test.launch",home+"/catkin_ws/src/darknet_ros/darknet_ros/launch/darknet_ros.launch"]
    elif data.data == "turn off camera":
        print("turn off camera")
        darknet_flag = False
        launch1.shutdown()
    elif data.data == "stop":
    	darknet_flag = False
        launch1.shutdown()
        process.stop()

        
    # node = roslaunch.core.Node(package, executable)
    launch.stop()
    # process.stop()
    #print(package)
    
    

def command():

    global option_flag, package, node, executable, stop, launch, process ,launch_file, darknet_flag,launch1
    stop = False


    rospy.init_node('launch')
    input_text = rospy.Subscriber('/receive_goal', String, callback)
    # rospy.spin()

    # launch = roslaunch.scriptapi.ROSLaunch()
    # print(launch)

    print(launch_flag)
    print(package)

    
    while not rospy.is_shutdown():
        # while(True):
        launch = roslaunch.scriptapi.ROSLaunch()
            
        if darknet_flag == True:
           uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
           roslaunch.configure_logging(uuid)
           launch1 = roslaunch.parent.ROSLaunchParent(uuid, launch_file)
                
           launch1.start()
           rospy.loginfo("started")
                
           darknet_flag = False
           launch1.spin_once()
           launch1.spin_once()

        if option_flag == True:
           node = roslaunch.core.Node(package, executable)
            
           print('234')
            
           launch.start()
            
            	
           process = launch.launch(node)
           print process.is_alive()
            # process.stop()
           option_flag = False
                
            # try:
           launch.spin_once()
           launch.spin_once()
            # # process.stop()
            # finally:
            #     # After Ctrl+C, stop all nodes from running
            #     launch.stop()
        
            
            
        rospy.sleep(0.1)
        # if stop == True:
        #     launch.stop()
        #     process.stop()
        # rospy.spin()


if __name__ == '__main__':
    home = expanduser("~")
    try:
        command()
    except rospy.ROSInterruptException:
        pass
