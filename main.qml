import QtQuick 2.11
import QtQuick.Window 2.11
import DrawVideo 1.0
import QtMultimedia 5.10

Window {
    visible: true
    width: 1920
    height: 1080
    DrawVideo {
        id: video
        device: "rtsp://193.19.103.188:1935/live/PlLeninaNTK.stream"
        width: 1920
        height: 1080
        onFrameReady: videoOutput.update()
    }
    VideoOutput {
        id: videoOutput
        source: video
        anchors.fill: parent
    }
}
