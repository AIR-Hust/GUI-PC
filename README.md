# GUI_robot

GUI robot

# Installation


```
$ cd ~/catkin_ws/src
$ git clone https://github.com/AIR-Hust/GUI-PC.git
$ cd ..
$ catkin_make
```


# Các bước chạy chương trình:

## B1: Khởi tạo robot 
*Chạy mô phỏng*:

`$ roslaunch turtlebot_gazebo turtlebot_world.launch`

*Chạy trên robot thực tế*:

`$ roslaunch robot full_amcl.launch`

## B2: Chạy GUI

`$ rosrun gui node_name`
