#include <stdio.h>
#include <stdlib.h>

#include <libintl.h>
#include <locale.h>

#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <blusher/blusher.h>

#include "Preferences.h"

int main(int argc, char *argv[])
{
    // Setup gettext environment.
    setlocale(LC_ALL, "");
    bindtextdomain("laniakea-preferences", "../share/locale");
    textdomain("laniakea-preferences");

    // For using Blusher's per-app scaling.
    QCoreApplication::setAttribute(Qt::AA_DisableHighDpiScaling);

    Preferences preferences;

    bl::Application app(argc, argv);

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(app.engine(), &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    app.engine()->rootContext()->setContextProperty("Preferences", QVariant::fromValue(&preferences));

    app.engine()->load(url);

    return app.exec();
}
