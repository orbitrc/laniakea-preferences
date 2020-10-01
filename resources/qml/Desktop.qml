import QtQuick 2.12

import Blusher 0.1

View {
  id: root

  property string title: _('Desktop')

  width: 640
  height: 600

  View {
    id: wallpaperSelector

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: rootWindow.bottom
    y: 10
    width: root.width - 20
    height: root.height - toolbar.height - 20

    Rectangle {
      anchors.fill: parent

      radius: 5
      color: 'grey'

      Rectangle {
        id: currentWallpaper

        x: 16
        y: 16
        width: 192
        height: 108

        Image {
          anchors.fill: parent

          source: ''
        }
      }

      View {
        id: wallpapersList

        anchors.top: currentWallpaper.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 16

        Rectangle {
          anchors.fill: parent

          radius: 10

          Flow {
            width: parent.width

            spacing: 8
            padding: 8

            Repeater {
              model: Preferences.wallpapersList.length

              Image {
                width: 133
                height: 100

                asynchronous: true
                sourceSize.width: this.width
                sourceSize.height: this.height
                source: 'file:/' + Preferences.wallpapersList[index]
              }
            }
          }
        }
      }
    }
  }
}
