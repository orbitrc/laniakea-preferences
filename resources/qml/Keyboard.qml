import QtQuick 2.12

import Blusher 0.1

View {
  id: root

  property string title: _('Keyboard')

  width: 640
  height: 300

  View {
    anchors.left: parent.left

    width: root.width / 2
    height: 300

    Label {
      id: delayUntilRepeatLabel

      text: _('Delay Until Repeat')
    }

    Slider {
      id: delayUntilRepeat

      anchors.top: delayUntilRepeatLabel.bottom

      start: 0
      end: 10000
      step: 1
      value: Preferences.delayUntilRepeat

      onValueChanged: {
        if (thresholdTimer.running) {
          thresholdTimer.restart();
        } else {
          thresholdTimer.start();
        }
      }
    }

    Label {
      anchors.left: delayUntilRepeat.right

      text: delayUntilRepeat.value
    }
  }

  View {
    anchors.right: parent.right

    width: root.width / 2
    height: 300

    Label {
      id: keyRepeatLabel

      text: _('Key repeat')
    }

    Slider {
      id: keyRepeat

      anchors.top: keyRepeatLabel.bottom

      start: 1
      end: 255
      step: 1
      value: Preferences.keyRepeat

      onValueChanged: {
        if (thresholdTimer.running) {
          thresholdTimer.restart();
        } else {
          thresholdTimer.start();
        }
      }
    }

    Label {
      anchors.left: keyRepeat.right

      text: keyRepeat.value
    }
  }

  Timer {
    id: thresholdTimer

    interval: Preferences.threshold
    repeat: false
    onTriggered: {
      Preferences.delayUntilRepeat = delayUntilRepeat.value;

      Preferences.save();
    }
  }
}
