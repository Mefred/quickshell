import Quickshell
import QtQuick
import Quickshell.Io

Text {
    id: clock

    color: "#cad3f5"

    Process {
        id: dateProc

        command: ["date", "+%I:%M %p"]

        running: true

        stdout: StdioCollector {
            onStreamFinished: clock.text = this.text.trim()
        }
    }

    Timer {
        interval: 60000
        running: true
        repeat: true

        onTriggered: dateProc.running = true
    }
}
