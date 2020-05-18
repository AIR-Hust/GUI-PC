#include "backend.h"

#include "ros/ros.h"
#include "std_msgs/String.h"

backend::backend(QObject *parent) : QObject(parent)
{

}

QString backend::goal()
{

}

void backend::setGoal(const QString &goal)
{
    ros::NodeHandle m;
    ros::Publisher goal_pub = m.advertise<std_msgs::String>("/receive_goal", 1000);
    ros::Rate loop_rate(1);
    //int count = 0;
    std_msgs::String mg;
    std::string name_point = goal.toStdString();
    //std::stringstream ss;
    //ss << "hello world " << count;
    mg.data = name_point;

    loop_rate.sleep();
    ROS_INFO("%s", mg.data.c_str());

    loop_rate.sleep();
    ROS_INFO("asdf");
    goal_pub.publish(mg);


    ros::spinOnce();
    ros::spinOnce();
    ros::spinOnce();


    loop_rate.sleep();
    loop_rate.sleep();
   // cout << 1;
    //++count;
    emit goalChanged();
}
