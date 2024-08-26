#ifndef ABOUT_H
#define ABOUT_H

#include <QObject>
#include <QSysInfo>
#include <QDebug>
class About : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString operatingSystem READ operatingSystem)
    Q_PROPERTY(QString cpuArchitecture READ cpuArchitecture)
public:
    explicit About(QObject *parent = nullptr);

private:

    QString operatingSystem();
    QString cpuArchitecture();
};

#endif // ABOUT_H
