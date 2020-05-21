#!/usr/bin/env python

# Python program to find current  
# weather details of any city 
# using openweathermap api
  
# import required modules 
import requests, json 

# Embeded in ROS
import rospy
from std_msgs.msg import String
  
def getweather():  
    # Enter your API key here 
    api_key = "13e9486ea2339ac41329ca35baad1938"
      
    # base_url variable to store url 
    base_url = "http://api.openweathermap.org/data/2.5/weather?"
      
    # Give city name 
    #city_name = input("Enter city name : ") 
      
    # complete_url variable to store 
    # complete url address 
    complete_url = base_url + "q=" + 'Hanoi,VN' + "&APPID=" + api_key

    # get method of requests module 
    # return response object 
    response = requests.get(complete_url) 
      
    # json method of response object  
    # convert json format data into 
    # python format data 
    x = response.json() 
    
      
    # Now x contains list of nested dictionaries 
    # Check the value of "cod" key is equal to 
    # "404", means city is found otherwise, 
    # city is not found 
    if x["cod"] != "404": 
      
        # store the value of "main" 
        # key in variable y 
        y = x["main"] 
      
        # store the value corresponding 
        # to the "temp" key of y 
        current_temperature = (y["temp"] - 273)//1
      
        # store the value corresponding 
        # to the "pressure" key of y 
        current_pressure = y["pressure"] 
      
        # store the value corresponding 
        # to the "humidity" key of y 
        current_humidiy = y["humidity"] 
      
        # store the value of "weather" 
        # key in variable z 
        z = x["weather"] 
      
        # store the value corresponding  
        # to the "description" key at  
        # the 0th index of z 
        weather_description = z[0]["id"] 
        
        return(weather_description,current_temperature,current_humidiy)
    else: 
        print(" City Not Found ") 

if __name__ == "__main__":

    # Initialize ROS node and topics
    rospy.init_node("get_weather")
    temp = rospy.Publisher('/weather/temperature',String, queue_size = 2)
    humid = rospy.Publisher('/weather/humidity',String, queue_size = 2)
    weather = rospy.Publisher('/weather',String, queue_size = 2)
    
    # While loop to update data
    # and publish data to topics.
    while not rospy.is_shutdown():
        a = getweather()
        weather.publish(str(a[0]))
        temp.publish(str(int(a[1])))
        humid.publish(str(a[2]))
        rospy.sleep(0.1)
