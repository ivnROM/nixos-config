// Bar.qml
import Quickshell
import Quickshell.Io
import QtQuick
import "../colors.qml" as Theme

Scope {
  id: root
  property string time

  Variants {
    model: Quickshell.screens

    PanelWindow {
      property var modelData
      screen: modelData
      color: "transparent"

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30

      Rectangle {
        anchors.fill: parent
        // color: Qt.rgba(0, 0, 0, 0.2) // negro con 50% opacidad
        color: Theme.base00
        radius: 5

        Text {
          anchors.centerIn: parent
          color: "white"
          text: root.time
        }
      }
    }
  }

  Process {
    id: dateProc
    command: ["date"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: root.time = this.text
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: dateProc.running = true
  }
}
