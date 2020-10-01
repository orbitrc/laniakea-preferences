#ifndef PREFERENCES_H
#define PREFERENCES_H

#include <QObject>

#include <laniakea/preferences.h>

class Preferences : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int threshold READ threshold CONSTANT)
    Q_PROPERTY(QList<QString> wallpapersList READ wallpapersList CONSTANT)

    Q_PROPERTY(bool darkMode READ darkMode WRITE setDarkMode NOTIFY darkModeChanged)
    Q_PROPERTY(int delayUntilRepeat READ delayUntilRepeat WRITE setDelayUntilRepeat NOTIFY delayUntilRepeatChanged)
    Q_PROPERTY(int keyRepeat READ keyRepeat WRITE setKeyRepeat NOTIFY keyRepeatChanged)
public:
    explicit Preferences(QObject *parent = nullptr);
    ~Preferences();

    int threshold() const;

    QList<QString> wallpapersList() const;

    bool darkMode() const;
    void setDarkMode(bool value);

    int delayUntilRepeat() const;
    void setDelayUntilRepeat(int delay);

    int keyRepeat() const;
    void setKeyRepeat(int repeat);

    Q_INVOKABLE void save();

    Q_INVOKABLE QString _(const QString& str) const;

signals:
    void darkModeChanged(bool value);
    void delayUntilRepeatChanged(int delay);
    void keyRepeatChanged(int repeat);

private:
    laniakea_preferences *_preferences;
};

#endif // PREFERENCES_H
