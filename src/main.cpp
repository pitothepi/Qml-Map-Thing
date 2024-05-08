#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDirIterator>

#include "MyController.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // QDirIterator it(".", QDirIterator::Subdirectories);
    // while (it.hasNext()) {
    //     qDebug() << it.next();
    // }


    MyController* controller = MyController::getInstance(&app);





    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/qt/qml/mainqml/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    //engine.loadFromModule("mainqml", "Main");
    engine.load(url);
    return app.exec();
}
