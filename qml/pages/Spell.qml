import QtQuick 2.0

Image
{

    property alias sourceicon: spellicon.source
    property real  damage: 0
    property real mp: 0
    property real area: 0


    id: spellicon



    MouseArea {
        anchors.fill: spellicon

        onClicked: {

        }

    }


}





