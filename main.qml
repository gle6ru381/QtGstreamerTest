import QtQuick 2.11
import QtQuick.Window 2.11
import DrawVideo 1.0
import QtMultimedia 5.10

Window {
    visible: true
    width: 1920
    height: 1080
    property var idArray: [videoOutput, vOut, vOut1, vOut2]
    property int myIdx: 0
//    function proc() {
//        idArray[myIdx].update();
//        //myIdx = (myIdx + 1) % 4;
//    }

    DrawVideo {
        id: camera
        device: "rtsp://193.19.103.188:1935/live/PlLeninaNTK.stream"
        onFrameReady: videoOutput.update()
    }

    DrawVideo {
        id: camera2
        device: "rtsp://193.19.103.188:1935/live/Pervomay_GerRev_NTK.stream"
        onFrameReady: vOut.update()
    }

    DrawVideo {
        id: camera3
        device: "rtsp://193.19.103.188:1935/live/Pl_Lunincev.stream"
        onFrameReady: vOut1.update()
    }

    DrawVideo {
        id: camera4
        device: "rtsp://193.19.103.188:1935/live/Pl_Lunincev.stream"
        onFrameReady: vOut2.update()
    }

//    MediaPlayer {
//        id: video
//        autoPlay: true
//        source: "gst-pipeline: rtspsrc latency=1000 protocols=tcp name=src location=rtsp://193.19.103.188:1935/live/PlLeninaNTK.stream ! rtph264depay ! h264parse ! decodebin ! videoconvert chroma-resampler=0 dither=0 dither-quantization=0 matrix-mode=3 alpha-value=0 ! videorate ! video/x-raw,framerate=20/2 ! qtvideosink"
//    }

//    MediaPlayer {
//        id: video2
//        autoPlay: true
//        source: "gst-pipeline: rtspsrc latency=1000 protocols=tcp name=src location=rtsp://193.19.103.188:1935/live/PlLeninaNTK.stream ! rtph264depay ! h264parse ! decodebin ! videoconvert chroma-resampler=0 dither=0 dither-quantization=0 matrix-mode=3 alpha-value=0 ! videorate ! video/x-raw,width=640,height=480,framerate=20/2 ! qtvideosink"
//    }

//    MediaPlayer {
//        id: video3
//        autoPlay: true
//        source: "gst-pipeline: rtspsrc latency=1000 protocols=tcp name=src location=rtsp://193.19.103.188:1935/live/PlLeninaNTK.stream ! rtph264depay ! h264parse ! decodebin ! videoconvert chroma-resampler=0 dither=0 dither-quantization=0 matrix-mode=3 alpha-value=0 ! videorate ! video/x-raw,width=640,height=480,framerate=20/2 ! qtvideosink"
//    }

//    MediaPlayer {
//        id: video4
//        autoPlay: true
//        source: "gst-pipeline: rtspsrc latency=1000 protocols=tcp name=src location=rtsp://193.19.103.188:1935/live/PlLeninaNTK.stream ! rtph264depay ! h264parse ! decodebin ! videoconvert chroma-resampler=0 dither=0 dither-quantization=0 matrix-mode=3 alpha-value=0 ! videorate ! video/x-raw,width=640,height=480,framerate=20/2 ! qtvideosink"
//    }

    VideoOutput {
        id: videoOutput
        source: camera
        width: 800
        height: 500
    }

    VideoOutput {
        id: vOut
        source: camera2
        x: 800
        width: 800
        height: 500
    }

    VideoOutput {
        id: vOut1
        source: camera3
        y: 500
        width: 800
        height: 500
    }

    VideoOutput {
        source: camera4
        id: vOut2
        y: 500
        x: 800
        width: 800
        height: 500
    }
}
