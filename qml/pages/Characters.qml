import QtQuick 2.0

QtObject {
    property var gameBoard: null

    property int hp: 0
    property int hpBoss: 0

    property int mp: 0


    function generateEnemies (count, Enemy) {
        var enemiesJs = [];
        var sprite;
        var component = Qt.createComponent(Enemy);
        for(var i = 0; i < count; i++) {
            sprite = component.createObject(gameBoard, {"x": (i + 1) * gameBoard.width / 4});
            enemiesJs.push(sprite);
        }
        enemies = enemiesJs;

        console.log(window.enemies);
        console.log(window.enemies.length);

    }

    function generateAlies () {
        var aliesJs = [];

        var componentGd = Qt.createComponent("Guard.qml");

        var spriteGd = componentGd.createObject(gameBoard, {"x": 1 * gameBoard.width / 4});

        var componentGG = Qt.createComponent("GG.qml");

        var spriteGG = componentGG.createObject(gameBoard, {"x": 2 * gameBoard.width / 4});

        aliesJs.push(spriteGG);
        aliesJs.push(spriteGd);

        alies = aliesJs;

        console.log(window);
        console.log(window.alies);
        console.log(window.alies.length);
    }

}
