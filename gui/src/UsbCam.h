#ifndef USB_CAM_H
#define USB_CAM_H

#include <QObject>
#include <QString>
#include <stdio.h>
#include <asm/types.h>          /* for videodev2.h */

extern "C"
{
#include <linux/videodev2.h>
#include <libavcodec/avcodec.h>
#include <libswscale/swscale.h>
#include <libavutil/mem.h>
}

// legacy reasons
#include <libavcodec/version.h>
#if LIBAVCODEC_VERSION_MAJOR < 55
#define AV_CODEC_ID_MJPEG CODEC_ID_MJPEG
#endif

#include <string>
#include <sstream>

#include <sensor_msgs/Image.h>
using namespace usb_cam;

class UsbCam : public QObject
{
    Q_OBJECT
    Q_PROPERTY(typedef name READ name WRITE setName NOTIFY nameChanged)
public:
    usb_cam();
};

#endif // USB_CAM_H
