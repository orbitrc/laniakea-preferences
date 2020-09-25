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
    }
  }

  View {
    anchors.right: parent.right

    width: root.width / 2
    height: 300

    Label {
      text: _('Key repeat')
    }
  }
}
