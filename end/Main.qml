import Quickshell
import QtQuick
import QtQuick.Layouts

Rectangle {
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.topMargin: 5

    width: row.implicitWidth + 30
    height: 30
    radius: width / 2

    anchors.rightMargin: 10

    border.width: 3
    border.color: "#1e2030"

    color: "#24273a"

    RowLayout {
        id: row

        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        spacing: 10

        Battery {}

        Network {}

        Audio {}

        Clock {}
    }
}
