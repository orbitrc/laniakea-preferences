#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <blusher/blusher.h>

#include "Preferences.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_DisableHighDpiScaling);

    bl::Application app(argc, argv);

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(app.engine(), &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    Preferences preferences;
    app.engine()->rootContext()->setContextProperty("Preferences", QVariant::fromValue(&preferences));

    app.engine()->load(url);

    return app.exec();
}
