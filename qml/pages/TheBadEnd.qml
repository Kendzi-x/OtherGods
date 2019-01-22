import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Image {
        source: "thebadend.png"
        anchors.fill: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            pageStack.pop();
        }
    }
}
