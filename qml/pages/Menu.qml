import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    Image {

        source: "menu.png"
        anchors.fill: parent
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + Theme.paddingLarge

        VerticalScrollDecorator {}

        Column {
            id: column
            width: parent.width
            //height: parent.height
            spacing: Theme.paddingLarge*2

            PageHeader { title: qsTr("<html><b><b></html>")  }

            Image {
                id: background1
                source: "IconButton.png"
                width: 320
                height: 60

                anchors {
                    right: parent.right
                    margins: Theme.paddingSmall
                }

                Text {
                    anchors.centerIn: background1
                    font.pixelSize: 25
                    color: "white"
                    font.family: "serif"
                    text: qsTr("<b><i>New Game<b><i>")
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        pageStack.pushAttached(Qt.resolvedUrl("Map.qml"))
                        pageStack.navigateForward()
                    }
                }

            }
            Image {
                id: background2
                source: "IconButton.png"
                //anchors.fill: parent
                width: 320
                height: 60

                anchors {
                    right: parent.right
                    margins: Theme.paddingSmall
                }

                Text {
                    anchors.centerIn: background2
                    font.pixelSize: 25
                    color: "white"
                    font.family: "serif"
                    text: qsTr("<b><i>Load<b><i>")
                }
                MouseArea{
                    anchors.fill: parent
                }

            }
            Image {
                id: background3
                source: "IconButton.png"
                //anchors.fill: parent
                width: 320
                height: 60

                anchors {
                    right: parent.right
                    margins: Theme.paddingSmall
                }

                Text {
                    anchors.centerIn: background3
                    font.pixelSize: 25
                    color: "white"
                    font.family: "serif"
                    text: qsTr("<b><i>Exit<b><i>")
                }
                MouseArea{
                    anchors.fill: parent

                    onClicked: {
                        Qt.quit()
                    }
                }
            }


        }
    }
    Image {
        id: background4
        source: "IconButton.png"
        //anchors.fill: parent
        width: 220
        height: 30

        anchors {
            left: parent.left
            bottom: parent.bottom
            margins: Theme.paddingSmall
        }

        Text {
            anchors.centerIn: background4
            font.pixelSize: 17
            color: "white"
            font.family: "serif"
            text: qsTr("<b><i>Developers<b><i>")
        }
        MouseArea{
            anchors.fill: parent
            //onEntered: parent.color = "#cccccc"
            //onExited: parent.color = "#999999"

            onClicked: {
                pageStack.pushAttached(Qt.resolvedUrl("Developers.qml"))
                pageStack.navigateForward()
            }
        }
    }
}
