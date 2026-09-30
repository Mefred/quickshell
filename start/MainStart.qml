import Quickshell
import QtQuick
import QtQuick.Layouts

Item {
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.topMargin: 5

    width: row.implicitWidth + 50
    height: 30


    RowLayout {
        id: row

        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        spacing: 5

        Arch {}

        Music {}
    }
}
