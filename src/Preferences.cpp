#include "Preferences.h"

// C/C++
#include <stdio.h>
#include <filesystem>

#include <libintl.h>

#include <laniakea/ini.h>

Preferences::Preferences(QObject *parent)
    : QObject(parent)
{
    this->_preferences = laniakea_preferences_new();
    int err = laniakea_preferences_load(this->_preferences);
    if (err != LANIAKEA_FILE_ERROR_SUCCESS) {
        fprintf(stderr, "Config file load error. %d\n", err);
    }
}

Preferences::~Preferences()
{
    laniakea_preferences_free(this->_preferences);
}

int Preferences::threshold() const
{
    return 1500;
}

QList<QString> Preferences::wallpapersList() const
{
    namespace fs = std::filesystem;

    QList<QString> list;

    auto path = fs::path("/usr/share/laniakea/wallpapers");
    for (const auto& entry: fs::directory_iterator(path)) {
        // Skip if directory.
        if (entry.is_directory()) {
            continue;
        }
        // Get file extension.
        auto ext = entry.path().extension();
        // Ignore file without extension.
        if (ext.string() == "") {
            continue;
        }
        // Ignore non image file.
        if (ext.string() != ".jpg" && ext.string() != ".jpeg" && ext.string() != ".png") {
            continue;
        }
        QString file_path_string = QString(entry.path().string().c_str());
        list.append(file_path_string);
    }

    return list;
}

bool Preferences::darkMode() const
{
    return laniakea_preferences_dark_mode(this->_preferences);
}

void Preferences::setDarkMode(bool value)
{
    fprintf(stderr, "DarkMode set to %d\n", value);
    emit this->darkModeChanged(value);
}

int Preferences::delayUntilRepeat() const
{
    return laniakea_preferences_keyboard_delay_until_repeat(this->_preferences);
}

void Preferences::setDelayUntilRepeat(int delay)
{
    if (this->delayUntilRepeat() != delay) {
        laniakea_preferences_set_keyboard_delay_until_repeat(this->_preferences, delay);

        emit this->delayUntilRepeatChanged(delay);
    }
}

int Preferences::keyRepeat() const
{
    return laniakea_preferences_keyboard_key_repeat(this->_preferences);
}

void Preferences::setKeyRepeat(int repeat)
{
    if (this->keyRepeat() != repeat) {
        laniakea_preferences_set_keyboard_key_repeat(this->_preferences, repeat);

        emit this->keyRepeatChanged(repeat);
    }
}

//======================
// Q_INVOKABLE methods
//======================
void Preferences::save()
{
    int err = laniakea_preferences_save(this->_preferences);
    if (err != LANIAKEA_FILE_ERROR_SUCCESS) {
        fprintf(stderr, "Failed to save preferences.conf file.");
    }
}

//===================
// Gettext
//===================
QString Preferences::_(const QString &str) const
{
    return gettext(str.toStdString().c_str());
}
