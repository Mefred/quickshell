import Quickshell
import QtQuick
import Quickshell.Hyprland

Rectangle {
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    anchors.topMargin: 5
    width: workspaces.width + 35
    height: 30
    radius: width / 2
    border.width: 3
    border.color: "#1e2030"
    color: "#24273a"
    Row {
        id: workspaces
        anchors.centerIn: parent
        spacing: 8

        Repeater {
            model: Hyprland.workspaces

            Rectangle {
                width: 18
                height: width
                radius: width / 2

                border.width: modelData.active ? 1.5 : 1

                HoverHandler {
                    id: hover
                }

                color: hover.hovered ? (modelData.active ? "#ffbd93" : "#6e738d") : (modelData.active ? "#f5a97f" : "#363a4f")
                border.color: hover.hovered ? "#b7bdf8" : (modelData.active ? "#5b6078" : "#494d64")

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        modelData.activate();
                    }
                }
            }
        }
    }
}
