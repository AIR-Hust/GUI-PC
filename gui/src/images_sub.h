#ifndef IMAGES_SUB_H
#define IMAGES_SUB_H

#include <QObject>
#include <QString>
#include <string>
#include <stdio.h>
#include "ros/ros.h"
#include "std_msgs/String.h"

#include <string.h>
#include <iostream>

using namespace std;
class images_sub :public OObject
{
    Q_OBJECT

public:
    images_sub();
};

#endif // IMAGES_SUB_H
