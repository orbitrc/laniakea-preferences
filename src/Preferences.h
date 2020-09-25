#ifndef PREFERENCES_H
#define PREFERENCES_H

#include <QObject>

#include <laniakea/preferences.h>

class Preferences : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int threshold READ threshold CONSTANT)
    Q_PROPERTY(bool darkMode READ darkMode WRITE setDarkMode NOTIFY darkModeChanged)
    Q_PROPERTY(int delayUntilRepeat READ delayUntilRepeat WRITE setDelayUntilRepeat NOTIFY delayUntilRepeatChanged)
public:
    explicit Preferences(QObject *parent = nullptr);
    ~Preferences();

    int threshold() const;

    bool darkMode() const;
    void setDarkMode(bool value);

    int delayUntilRepeat() const;
    void setDelayUntilRepeat(int delay);

    Q_INVOKABLE QString _(const QString& str) const;

signals:
    void darkModeChanged(bool value);
    void delayUntilRepeatChanged(int delay);

private:
    laniakea_preferences *_preferences;
};

#endif // PREFERENCES_H
