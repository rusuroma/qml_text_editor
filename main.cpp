#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "backend.h"
#include "about.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<Backend>("com.company.backend", 1,0,"Backend");
    qmlRegisterType<About>("com.company.about", 1,0,"About");
    const QUrl url(QStringLiteral("qrc:/TextEditor/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
