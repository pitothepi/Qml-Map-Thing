#include "MyController.h"


MyController::MyController(QObject *parent)
    : QObject{parent}
{}


void MyController::addId(int id)
{
    m_ids.append(id);
    emit idsChanged();
}


MyController* MyController::getInstance(QObject* parent)
{
    if (!m_instance)
        m_instance = new MyController(parent);

    return m_instance;
}


QList<int> MyController::getIds() const
{
    return m_ids;
}


void MyController::setIds(const QList<int> &newIds)
{
    if (m_ids == newIds)
        return;
    m_ids = newIds;
    emit idsChanged();
}


MyController* MyController::create(QQmlEngine*, QJSEngine* engine)
{
    // The instance has to exist before it is used. We cannot replace it.
    Q_ASSERT(m_instance);

    // The engine has to have the same thread affinity as the singleton.
    Q_ASSERT(engine->thread() == m_instance->m_engine->thread());

    // There can only be one engine accessing the singleton.
    if (m_instance->m_engine)
        Q_ASSERT(engine == m_instance->m_engine);
    else
        m_instance->m_engine = engine;

    // Explicitly specify C++ ownership so that the engine doesn't delete
    // the instance.
    QJSEngine::setObjectOwnership(m_instance,
                                  QJSEngine::CppOwnership);
    return m_instance;
}
