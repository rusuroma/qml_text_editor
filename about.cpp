#include "about.h"

About::About(QObject *parent)
    : QObject{parent}
{}

QString About::operatingSystem()
{

    return QSysInfo::prettyProductName();
}

QString About::cpuArchitecture()
{
    return QSysInfo::currentCpuArchitecture();
}
