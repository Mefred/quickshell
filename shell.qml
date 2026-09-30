import Quickshell
import QtQuick
import QtQuick.Layouts
import "middle"
import "end"
import "start"

PanelWindow {
    color: 'transparent'

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 35

    Rectangle {
        anchors.fill: parent
        color: 'transparent'
        GridLayout {
            id: grid
            anchors.fill: parent
            columns: 3
            rows: 1
            columnSpacing: 0

            Item {
                id: start
                Layout.fillWidth: true
                Layout.fillHeight: true

                MainStart {}
            }
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Workspaces {}
            }
            Item {
                id: end
                Layout.fillWidth: true
                Layout.fillHeight: true

                Main {}
            }
        }
    }
}
