import Quickshell
import Quickshell.Io
import QtQuick

Rectangle {
    width: archy.width + 20
    height: 30
    radius: width / 2

    border.width: 3
    border.color: "#1e2030"

    color: "#24273a"

    Text {
        id: archy

        anchors.centerIn: parent

        text: "󰣇 "

        color: "#8aadf4"

        font.pixelSize: 15
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            Quickshell.execDetached([
                "/home/fred/.config/hypr/wallpaper"
            ])
        }
    }
}
