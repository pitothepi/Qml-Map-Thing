#ifndef MYCONTROLLER_H
#define MYCONTROLLER_H

#include <QList>
#include <QObject>
#include <QQmlEngine>
#include <QJSEngine>

class MyController : public QObject
{
    Q_OBJECT
    QML_SINGLETON
    QML_ELEMENT

    Q_PROPERTY(QList<int> ids READ getIds WRITE setIds NOTIFY idsChanged)

public:
    static MyController* getInstance(QObject *parent);

public:
    static MyController* create(QQmlEngine*, QJSEngine* engine);

    void addId(int id);


public:
    QList<int> getIds() const;
    void setIds(const QList<int> &newIds);

signals:
    void idsChanged();

private:
    explicit MyController(QObject *parent);


private:
    QList<int> m_ids{};

    static inline MyController* m_instance{nullptr};
    QJSEngine* m_engine{};
};

#endif // MYCONTROLLER_H
