#ifndef DRAWVIDEO_H
#define DRAWVIDEO_H

#include <QQuickPaintedItem>
#include <gst/gst.h>
#include <gst/app/app.h>
#include <gst/video/gstvideometa.h>
#include <QImage>
#include <QPixmap>
#include <mutex>

#include <QAbstractVideoSurface>
#include <QMutex>
#include <QQuickItem>
#include <QQuickWindow>
#include <QThread>
#include <QVideoSurfaceFormat>

#include <gst/app/gstappsink.h>
#include <gst/gst.h>

class V4L2SourceWorker;

class V4L2Source : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QAbstractVideoSurface* videoSurface READ videoSurface WRITE
                   setVideoSurface)
    Q_PROPERTY(QString device MEMBER m_device READ device WRITE setDevice)
    Q_PROPERTY(QString caps MEMBER m_caps)

public:
    V4L2Source(QQuickItem* parent = nullptr);
    virtual ~V4L2Source();

    void setVideoSurface(QAbstractVideoSurface* surface);
    void setDevice(QString device);

public slots:
    void start();
    void stop();

private slots:
    void setWindow(QQuickWindow* win);
    void sync();

signals:
    void frameReady();

protected:
    QAbstractVideoSurface* videoSurface() const
    {
        return m_surface;
    }

    QString device() const
    {
        return m_device;
    }

private:
    void run();
    GstFlowReturn static on_new_sample(GstAppSink* sink, gpointer data);

    static GstAppSinkCallbacks callbacks;

    // properties:
    QAbstractVideoSurface* m_surface;
    QString m_device;
    QString m_caps;

    // state:
    bool EGLImageSupported;
    int fd;
    bool ready;
    QVideoSurfaceFormat m_format;
    QSharedPointer<QAbstractVideoBuffer> videoBuffer;
    QSharedPointer<QVideoFrame> videoFrame;
    QMutex mutex;
    std::future<void> worker_handle;

    GMainContext* context;
    GMainLoop* loop;
    GstElement* pipeline;
    GstElement* v4l2src;
    GstElement* appsink;
};

#endif // DRAWVIDEO_H
