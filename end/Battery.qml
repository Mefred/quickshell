import Quickshell
import Quickshell.Io
import QtQuick

Text {
    id: battery

    color: "#cad3f5"

    property string precent: ""

    Process {
        id: power

        command: ["bash", "-c", "upower -i $(upower -e) | grep percentage"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                battery.precent = this.text.trim().split(":")[1].trim()
            }
        }
    }

    Timer {
        interval: 30000
        running: true
        repeat: true

        onTriggered: power.running = true
    }

    text: {
        const level = parseInt(precent)

        if (level >= 90)
            return "󰁹  " + precent

        if (level >= 70)
            return "󰂂  " + precent

        if (level >= 50)
            return "󰂀  " + precent

        if (level >= 30)
            return "󰁾  " + precent

        if (level >= 10)
            return "󰁼  " + precent

        return "󰂃  " + precent
    }
}
