import QtQuick 2.12
import QtGraphicalEffects 1.0

import Blusher 0.1

View {
  id: root

  property url imageSource

  signal clicked()

  width: 72
  height: 72

  View {
    id: innerShadowSource

    anchors.fill: parent

    Rectangle {
      id: rect

      anchors.fill: parent
      anchors.margins: 0

      radius: 10
      color: '#eaeaea'

      states: [
        State {
          name: 'active'
          PropertyChanges {
            target: topLeftDropShadow
            visible: false
          }
          PropertyChanges {
            target: bottomRightDropShadow
            visible: false
          }
        }
      ]

      Image {
        id: image

        anchors.centerIn: parent

        width: 48
        height: 48

        source: root.imageSource
      }

      MouseArea {
        anchors.fill: parent

        onPressed: {
          rect.state = 'active';
        }

        onReleased: {
          rect.state = '';
        }

        onClicked: {
          root.clicked();
        }
      }
    }
  }

  InnerShadow {
    id: topLeftInnerShadow

    visible: false
    anchors.fill: innerShadowSource
    horizontalOffset: 4
    verticalOffset: 4
    radius: 12
    samples: 16
    color: 'grey'
    source: innerShadowSource
  }

  InnerShadow {
    id: bottomRightInnerShadow

    visible: false
    anchors.fill: innerShadowSource
    horizontalOffset: -4
    verticalOffset: -4
    radius: 12
    samples: 16
    color: '#ffffff'
    source:innerShadowSource
  }

  Blend {
    id: innerShadow

    anchors.fill: topLeftInnerShadow
    source: topLeftInnerShadow
    foregroundSource: bottomRightInnerShadow
    mode: 'average'
  }

  DropShadow {
    id: topLeftDropShadow

    anchors.fill: innerShadowSource
    horizontalOffset: -6
    verticalOffset: -6
    radius: 12
    samples: 16
    color: '#ffffff'
    source: innerShadowSource
  }

  DropShadow {
    id: bottomRightDropShadow

    anchors.fill: innerShadowSource
    horizontalOffset: 6
    verticalOffset: 6
    radius: 12
    samples: 16
    color: '#9a9a9a'
    source: innerShadowSource
  }
}
