#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QCoreApplication>
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QFileInfo>
#include <QDir>
class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString path READ path WRITE setPath NOTIFY pathChanged)
    Q_PROPERTY(QString data READ data WRITE setData NOTIFY dataChanged)
public:
    explicit Backend(QObject *parent = nullptr);

    QString path();
    QString data();
    void setPath(QString value);
    void setData(QString value);

signals:
    void pathChanged();
    void dataChanged();

private:
    QString m_path;
};

#endif // BACKEND_H
