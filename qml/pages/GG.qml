import QtQuick 2.0
import "Counter.js" as Spells

Item {
    property bool dead: false
    property int hp: 100
    property int mp: 50

    opacity: 1


    width: 100; height: 200
    //    property var spells: []

    //    function setDead(){
    //        if(hp <= 0)
    //        {
    //            dead = true;
    //        }
    //    }


    //    Component.onCompleted: {
    ////        console.log("test123")

    //        Spells.generateSpells ("smash.png", 10, 10, 1, 0)

    //        console.log("спеллы" + window.spells.length)
    //    }



    Image {
        id:image
        source: "ggpose.png"
    }

    Text
    {
        font.family: "serif"
        color: "white"
        text: qsTr(window.alies[0].hp + "/100");
        font.bold: true
        anchors.top: image.bottom

        anchors.horizontalCenter: image.horizontalCenter
    }


}

