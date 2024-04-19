#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDirIterator>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QDirIterator it(":", QDirIterator::Subdirectories);
    while (it.hasNext()) {
        qDebug() << it.next();
    }

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:qt/qml/src/qml/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("mainqml", "Main");

    return app.exec();
}
