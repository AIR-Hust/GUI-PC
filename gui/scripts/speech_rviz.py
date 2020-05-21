#!/usr/bin/env python

import roslaunch
import rospy

from std_msgs.msg import String

package = ""
executable = ""

launch_flag = False

def callback(data):
    global package
    global executable
    global node
    global launch_flag
    global stop
    global launch

    stop = False

    launch_flag = True
    print(data.data)
    if data.data == "rviz":
        print('345')
        package = 'rviz'
        executable = 'rviz'
    elif data.data == "stop":
        print('34')
        package = 'rviz'
        executable = 'rviz'
        stop = True
        launch_flag = False
        process.stop()
    elif data.data == "weather":
        print('34')
        package = 'gui'
        executable = 'ros_weather.py'
        stop = True
    elif data.data == "b":
        print('34')
        package = 'cmc_robot_daily_work'
        executable = 'gui_daily_work'
        stop = True
        # launch_flag = False
        # launch.stop()
    # else:
    #     package = 'cmc_robot_daily_work'
    #     executable = 'ros_weather.py'
    # node = roslaunch.core.Node(package, executable)
    launch.stop()
    # process.stop()
    print(package)
    print('456')
    

def command():

    global launch_flag, package, node, executable, stop, launch, process
    stop = False

    rospy.init_node('behavior')
    input_text = rospy.Subscriber('/receive_goal', String, callback)
    # rospy.spin()

    # launch = roslaunch.scriptapi.ROSLaunch()
    # print(launch)

    print(launch_flag)
    print(package)

    
    while not rospy.is_shutdown():
        # while(True):
        print('abc')
        print(launch_flag)

        launch = roslaunch.scriptapi.ROSLaunch()

        if launch_flag == True:
            node = roslaunch.core.Node(package, executable)
            
            print('234')
            
            launch.start()
            print('246')

            process = launch.launch(node)
            print process.is_alive()
            # process.stop()
            launch_flag = False

            # try:
            launch.spin_once()
            launch.spin_once()
            # # process.stop()
            # finally:
            #     # After Ctrl+C, stop all nodes from running
            #     launch.stop()
        
        print('789')
        print(stop)
        rospy.sleep(0.1)
        # if stop == True:
        #     launch.stop()
        #     process.stop()
        # rospy.spin()


if __name__ == '__main__':
    try:
        command()
    except rospy.ROSInterruptException:
        pass
