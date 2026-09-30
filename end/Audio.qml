import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Text {
    id: audio
    color: "#cad3f5"

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    property int volume: Math.round(Pipewire.defaultAudioSink?.audio.volume * 100)

    text: Pipewire.defaultAudioSink.audio.muted || volume === 0 ? "󰖁  " + volume + "%" : "󰕾  " + volume + "%"
}
