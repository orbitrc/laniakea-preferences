import QtQuick 2.12

import Blusher 0.1

Column {
  property string title: _('System Preferences')

  width: 640
  height: 480

  // General category.
  View {
    id: general

    width: rootWindow.width

    Label {
      id: labelGeneral

      text: 'General'
    }
    View {
      anchors.verticalCenter: labelGeneral.verticalCenter
      anchors.left: labelGeneral.right
      anchors.right: general.right
      anchors.rightMargin: 8
      width: 200
      height: 2
      Rectangle {
        anchors.fill: parent
        color: '#808080'
      }
    }
    Row {
      id: generalButtons

      y: 30

      leftPadding: 16
      spacing: 24

      // Apperance button.
      View {
        width: buttonAppearance.width
        height: buttonAppearance.height
        MainButton {
          id: buttonAppearance

          imageSource: 'qrc:/img/preferences-desktop-icons.png'

          onClicked: {
            rootWindow.page = 'appearance';
          }
        }
        Label {
          anchors.top: buttonAppearance.bottom
          anchors.horizontalCenter: buttonAppearance.horizontalCenter
          text: 'Appearance'
        }
      }

      // Desktop button.
      View {
        width: buttonDesktop.width
        height: buttonDesktop.height
        MainButton {
          id: buttonDesktop

          imageSource: 'qrc:/img/preferences-desktop-wallpaper.svgz'
        }
        Label {
          anchors.top: buttonDesktop.bottom
          anchors.horizontalCenter: buttonDesktop.horizontalCenter
          text: 'Desktop'
        }
      }
    }
  }
  // Hardware category.
  View {
    id: hardware

    y: 150
    width: rootWindow.width

    Label {
      id: labelHardware

      text: 'Hardware'
    }
    View {
      anchors.verticalCenter: labelHardware.verticalCenter
      anchors.left: labelHardware.right
      anchors.right: hardware.right
      anchors.rightMargin: 8
      width: 200
      height: 2
      Rectangle {
        anchors.fill: parent
        color: '#808080'
      }
    }
    Row {
      id: hardwareButtons

      y: 30

      leftPadding: 16
      spacing: 24

      View {
        width: keyboardButton.width
        height: keyboardButton.height
        MainButton {
          id: keyboardButton

          imageSource: 'qrc:/img/preferences-desktop-keyboard.svgz'

          onClicked: {
            rootWindow.page = 'keyboard';
          }
        }
        Label {
          anchors.top: keyboardButton.bottom
          anchors.horizontalCenter: keyboardButton.horizontalCenter
          text: 'Keyboard'
        }
      }

      View {
        width: displayButton.width
        height: displayButton.height
        MainButton {
          id: displayButton

          imageSource: 'qrc:/img/preferences-desktop-display.svgz'
        }
        Label {
          anchors.top: displayButton.bottom
          anchors.horizontalCenter: displayButton.horizontalCenter
          text: 'Display'
        }
      }
    }
  }
}
