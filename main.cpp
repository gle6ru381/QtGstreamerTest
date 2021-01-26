#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "drawvideo.h"
#include <gst/gst.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    gst_init(&argc, &argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<V4L2Source>("DrawVideo", 1, 0, "DrawVideo");
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
