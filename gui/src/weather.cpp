#include "weather.h"
//#include <QObject>

#include "ros/ros.h"
#include "std_msgs/String.h"
// Temperature callback function
void weather::temperatureCallBack(const std_msgs::String::ConstPtr &msg)
{
  string temp;
  ROS_INFO("I heard: [%s]", msg->data.c_str());
  temp = msg->data.c_str(); // Read data from topic
  m_temperature = QString::fromStdString(temp); // Save data to temparature private attribute
}

// Description of weather callback function
void weather::descriptionCallBack(const std_msgs::String::ConstPtr &msg)
{
  string des;
  ROS_INFO("I heard: [%s]", msg->data.c_str());
  des = msg->data.c_str();
  m_description = QString::fromStdString(des);
}

// Humidity callback function
void weather::humidityCallBack(const std_msgs::String::ConstPtr &msg)
{
  string humid;
  ROS_INFO("I heard: [%s]", msg->data.c_str());
  humid = msg->data.c_str();
  m_humidity = QString::fromStdString(humid);
}

weather::weather(QObject *parent) : QObject(parent)
{
    // kết nối signal weather_statusChanged với slot updateweather
    connect(this,SIGNAL(weather_statusChanged()),this,SLOT(updateweather()));
}

// Function for qml to read private attributes
QString weather::weather_status()
{
    return m_weather_status;
}
QString weather::temperature()
{
    return m_temperature;
}
QString weather::humidity()
{
    return m_humidity;
}
QString weather::description()
{
    return m_description;
}

// Function to update weather infor every '"time_update" in qml' seconds
void weather::setWeather_status(const QString weather_status)
{
    //Subscribe to ROS topics to get weather information
    ros::NodeHandle m;
    ros::Rate loop_rate(1.5); // loop rate in Hz
    ros::Subscriber des = m.subscribe("/weather", 10, &weather::descriptionCallBack, this);
    ros::Subscriber humid = m.subscribe("/weather/humidity", 10, &weather::humidityCallBack, this);
    ros::Subscriber temp = m.subscribe("/weather/temperature", 10, &weather::temperatureCallBack, this);

    loop_rate.sleep(); // Wait for topic
    ros::spinOnce(); // Call callback function once
    if (m_weather_status == weather_status)
        return;
    m_weather_status = weather_status;

}

void weather::setTemperature(const QString temperature)
{
    if (m_temperature == temperature)
        return;
    m_temperature = temperature;
}

void weather::setHumidity(const QString humidity)
{
    if (m_humidity == humidity)
        return;
    m_humidity = humidity;
}

void weather::setDescription(const QString description)
{
    if (m_description == description)
        return;
    m_description = description;
}

void weather::updateweather()
{
}
