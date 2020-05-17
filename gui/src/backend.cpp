#include "backend.h"

#include "ros/ros.h"
#include "std_msgs/String.h"

backend::backend(QObject *parent) : QObject(parent)
{

}

QString backend::userName()
{
    return m_userName;
}
/*void backend::goalChanged (QString &goal)
{

}*/
void backend::setUserName(const QString &userName)
{
    /*if (userName == m_userName)
        return;

    m_userName = userName;*/
    ros::NodeHandle n;
    ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter", 1000);
    ros::Rate loop_rate(10);
    int count = 0;
    while (ros::ok())
    {
        std_msgs::String msg;

        std::stringstream ss;
        ss << "hello world " << count;
        msg.data = ss.str();

        ROS_INFO("%s", msg.data.c_str());

            /**
             * The publish() function is how you send messages. The parameter
             * is the message object. The type of this object must agree with the type
             * given as a template parameter to the advertise<>() call, as was done
             * in the constructor above.
             */
        chatter_pub.publish(msg);

        ros::spinOnce();

        loop_rate.sleep();
        ++count;
    }
    emit userNameChanged();
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
