import QtQuick 2.12

import Blusher 0.1

View {
  id: root

  property string title: 'Appearance'

  width: 640
  height: 300

  Label {
    anchors.verticalCenter: checkboxDarkMode.verticalCenter
    anchors.right: checkboxDarkMode.left
    text: 'Color scheme: '
  }
  Checkbox {
    id: checkboxDarkMode
    x: 200
    title: 'Dark mode'
    checkState: (Preferences.darkMode ? Checkbox.CheckState.Checked : Checkbox.CheckState.Unchecked)

    onCheckStateChanged: {
      if (thresholdTimer.running) {
        thresholdTimer.restart();
      } else {
        thresholdTimer.start();
      }
    }
  }

  Timer {
    id: thresholdTimer

    interval: Preferences.threshold
    repeat: false
    onTriggered: {
      print('Triggered!');
      Preferences.darkMode = (checkboxDarkMode.checkState === Checkbox.CheckState.Checked ? true : false)
    }
  }
}
