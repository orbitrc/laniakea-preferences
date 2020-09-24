#ifndef PREFERENCES_H
#define PREFERENCES_H

#include <QObject>

#include <laniakea/preferences.h>

class Preferences : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int threshold READ threshold CONSTANT)
    Q_PROPERTY(bool darkMode READ darkMode WRITE setDarkMode NOTIFY darkModeChanged)
public:
    explicit Preferences(QObject *parent = nullptr);
    ~Preferences();

    int threshold() const;

    bool darkMode() const;
    void setDarkMode(bool value);

    Q_INVOKABLE QString _(const QString& str) const;

signals:
    void darkModeChanged(bool value);

private:
    laniakea_preferences *_preferences;
};

#endif // PREFERENCES_H
