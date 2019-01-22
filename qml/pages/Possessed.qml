import QtQuick 2.0

Item {
    property bool dead: false
    property int hp: 50
    property int mp: 100
    property int damage: 10
//    property var spells: []

    width: 100; height: 200

    opacity: 1

//    function setDead(){
//        if(hp <= 0)
//        {
//            dead = true;
//        }
//    }

    Image {
        id: image
        scale: 1.2
        source: "possessedpose.png"
    }

    Text
    {
        id: hpText
        font.family: "serif"
        color: "white"
        text: qsTr(hp + "/50");
        font.bold: true
        anchors.top: image.bottom
        anchors.horizontalCenter: image.horizontalCenter

    }

//    Component.onCompleted: {
//        function generateSpells () {
//            var component = Qt.createComponent("Spell.qml");

//            var sprite = component.createObject(gameBoard, {"damage": 10, "mp": 10, "area": 1});
//            spells.push(sprite);


//        }
//    }


}
