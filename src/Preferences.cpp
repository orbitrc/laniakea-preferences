#include "Preferences.h"

#include <stdio.h>

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
}

int Preferences::threshold() const
{
    return 1500;
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
