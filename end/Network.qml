import Quickshell
import Quickshell.Io
import QtQuick

Text {
    id: network

    color: "#cad3f5"

    property string connectionType: ""
    property string networkName: ""

    Process {
        id: nmcli

        command: ["nmcli", "-t", "-f", "TYPE,STATE,CONNECTION", "device"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                const lines = this.text.trim().split("\n")

                for (const line of lines) {
                    const parts = line.split(":")

                    if (parts.length >= 2 && parts[1] === "connected") {
                        network.connectionType = parts[0]
                        network.networkName = parts[2]
                        return
                    }

                    network.connectionType = ""
                }
            }
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true

        onTriggered: nmcli.running = true
    }

    text: {
        if (connectionType === "wifi") return "󰖩   " + networkName
        if (connectionType === "ethernet") return "󰈀  " + networkName

        return "󰖪 "
    }
}
