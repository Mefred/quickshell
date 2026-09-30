import Quickshell
import Quickshell.Services.Mpris
import QtQuick

Rectangle {
    id: music

    property var player: Mpris.players.values.length > 0
        ? Mpris.players.values[0]
        : null

    property bool playing: player !== null &&
        player.playbackState === MprisPlaybackState.Playing

    width: musicText.implicitWidth + 55
    height: 30
    radius: width / 2

    border.width: 3
    border.color: "#1e2030"
    color: "#24273a"

    Text {
        id: musicText

        anchors.left: parent.left
        anchors.leftMargin: 40
        anchors.verticalCenter: parent.verticalCenter

        color: "#cad3f5"
        text: music.player
            ? music.player.trackTitle + " - " + music.player.trackArtist
            : "No Music"

        elide: Text.ElideRight
    }

    // Paused / stopped icon
    Text {
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.verticalCenter: parent.verticalCenter

        visible: !music.playing

        color: "#cad3f5"
        text: "󰐊"
        font.pixelSize: 15
    }

    // Animated equalizer
    Row {
        id: equalizer

        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5

        spacing: 3
        visible: music.playing

        Repeater {
            model: 4

            Item {
                width: 3
                height: 20

                Item {
                    id: barContainer

                    anchors.bottom: parent.bottom

                    width: 3
                    height: 20

                    Rectangle {
                        anchors.bottom: parent.bottom

                        width: 3
                        height: parent.height
                        radius: 2
                        color: "#cad3f5"
                    }

                    SequentialAnimation on height {
                        running: playing
                        loops: Animation.Infinite

                        // Offset each bar
                        PauseAnimation {
                            duration: index * 120
                        }

                        NumberAnimation {
                            to: 5
                            duration: 250
                            easing.type: Easing.InOutQuad
                        }

                        NumberAnimation {
                            to: 18
                            duration: 350
                            easing.type: Easing.InOutQuad
                        }
                    }
                }
            }
        }
    }
}
