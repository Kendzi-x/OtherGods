import QtQuick 2.0
import "Counter.js" as Spells

Item  {
    property bool dead: false
    property int hp: 50
    property int mp: 30
//    property var spells: []

    opacity: 1

    width: 100; height: 200

    function setDead(){
        if(hp <= 0)
        {
            dead = true;
        }
    }




    Image {
        id: image
        source: "guardpose.png"
    }

    Text
    {
        font.family: "serif"
        color: "white"
        text: qsTr(window.alies[1].hp + "/50");
        font.bold: true
        anchors.top: image.bottom

        anchors.horizontalCenter: image.horizontalCenter
    }


    Component.onCompleted: {
//        Spells.generateSpells (spells, "smash.png", 10, 10, 1)
    }
}

