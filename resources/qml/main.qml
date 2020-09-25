import QtQuick 2.12

import Blusher 0.1

Window {
  id: rootWindow

  property string page: 'main'

  property var _: Preferences._

  visible: true
  width: 640
  height: 480
  title: _('System Preferences')

  color: "#eaeaea"

  Toolbar {
    id: toolbar

    ToolbarItem {
      label: _('All')
      Button {
        title: _('All')
        onClicked: {
          rootWindow.page = 'main';
        }
      }
    }
  }

  Loader {
    id: loader

    y: toolbar.height

    source: 'PreferencesMain.qml'

    onLoaded: {
      // Resize window.
      resizeWidthAnimation.to = loader.item.width;
      resizeHeightAnimation.to = loader.item.height;
      // Change window title.
      rootWindow.title = loader.item.title;
      // Start resizing animation.
      resizeWidthAnimation.start();
      resizeHeightAnimation.start();
    }
  }

  NumberAnimation {
    id: resizeWidthAnimation

    target: rootWindow
    property: "width"
    duration: 200
    to: 500
    easing.type: Easing.InOutQuad
  }

  NumberAnimation {
    id: resizeHeightAnimation
    target: rootWindow
    property: "height"
    duration: 200
    to: 500
    easing.type: Easing.InOutQuad
  }

  onPageChanged: {
    loader.sourceComponent = undefined;
    switch (rootWindow.page) {
    case 'main':
      loader.source = 'PreferencesMain.qml';
      break;
    case 'appearance':
      loader.source = 'Appearance.qml';
      break;
    case 'keyboard':
      loader.source = 'Keyboard.qml';
      break;
    default:
      break;
    }
  }
}
