#include "backend.h"

Backend::Backend(QObject *parent) : QObject(parent)
{
    m_path = QCoreApplication::applicationDirPath();
    m_path.append("/file.txt");
}

QString Backend::path()
{
    return m_path;
}

QString Backend::data()
{
    //QFile file("C:\\Users\\ror\\OneDrive - RTX\\Skrivebord\\test.txt");
    QString nativePath = QDir::toNativeSeparators(m_path);
    qDebug() << nativePath;
    nativePath.erase(nativePath.begin());
    qDebug() << nativePath;
    QFile file(nativePath);
    if(!file.open(QIODevice::ReadOnly))
    {
        qWarning() << "Error string: " << file.errorString();

        qWarning() << "Could not open file";
        return "";
    }

    QTextStream stream(&file);
    QString value = stream.readAll();


    file.close();
    return value;
}

void Backend::setPath(QString value)
{
    m_path=value;
    m_path.remove("file://");
    emit pathChanged();
}

void Backend::setData(QString value)
{
    QString nativePath = QDir::toNativeSeparators(m_path);
    qDebug() << nativePath;
    nativePath.erase(nativePath.begin());
    qDebug() << nativePath;
    QFile file(nativePath);
    if(!file.open(QIODevice::WriteOnly))
    {
        qWarning() << "Could not open file";
    }
    QTextStream stream(&file);
    stream << value;
    stream.flush();
    file.close();
    emit dataChanged();
}
