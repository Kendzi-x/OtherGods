import QtQuick 2.0
import Sailfish.Silica 1.0
import "Counter.js" as Counter

Page {
    id: pageBattle
    PageHeader { id: header }
    Image {
        id: background
        source: "battle.png"
        anchors.fill: parent

    }

    //Кнопка Способностей

    Image {
        id: spellsButton
        source: "spells.png"
        scale: 0.8

        anchors
        {
            bottom:parent.bottom
            left: parent.left
            bottomMargin: 20
        }

        MouseArea {
            anchors.fill: parent
            //alies[0] - GG, alies[1] - Guarda
            onClicked: {
                if(counter == 0 && (window.alies[0].hp > 0)){
                    // window.alies[1].opacity = 0.8

                    if(spellfieldhero.enabled == false)
                    {
                        spellfieldhero.enabled = true
                        spellfieldhero.visible = true
                    } else
                    {
                        spellfieldhero.enabled = false
                        spellfieldhero.visible = false
                    }
                    if (gameMenu.enabled == true)
                    {
                        spellfieldhero.enabled = false
                        spellfieldhero.visible = false
                    }
                } else {counter = 1;}

                if (counter == 1 && window.alies[1].hp > 0){
                    //window.alies[0].opacity = 0.8
                    //window.alies[1].opacity = 1

                    if(spellfieldguard.enabled == false)
                    {
                        spellfieldguard.enabled = true
                        spellfieldguard.visible = true
                    } else
                    {
                        spellfieldguard.enabled = false
                        spellfieldguard.visible = false
                    }
                    if (gameMenu.enabled == true)
                    {
                        spellfieldguard.enabled = false
                        spellfieldguard.visible = false
                    }

                }
            }
        }
    }

    //Кнопка Инвентарь(disabled)

    Image {
        id: inventoryButton
        source: "inventory.png"
        scale: 0.8

        anchors
        {
            bottom:parent.bottom
            right: parent.right
            bottomMargin: 20
        }

        MouseArea {
            anchors.fill: parent
        }
    }

    //Строка Союзных Персонажей
    Row {

        //property int place: width

        id: aliesField

        spacing: Theme.paddingLarge * 2

        width: background.width / 2 - 10
        anchors.left: background.left
        anchors.verticalCenter: parent.verticalCenter
        Component.onCompleted: {console.debug("Рашн Филд " + aliesField.x)}
    }

    //Строка Вражеских Персонажей
    Row {
        //property alias place: enemiesField.width

        id: enemiesField

        spacing: Theme.paddingLarge * 2

        width: background.width / 2 - 30
        anchors.right: background.right
        anchors.verticalCenter: parent.verticalCenter
        Component.onCompleted: {console.debug("Энемис Филд " + enemiesField.x)}
    }

    //Создание Строки Наших Персонажей
    Characters {
        gameBoard: aliesField

        Component.onCompleted: generateAlies()
    }

    //Создание Строки Вражеских Персонажей
    Characters {
        gameBoard: enemiesField

        Component.onCompleted: generateEnemies(1, "Possessed.qml")
    }

    //Иконки Ходящего

    Image {
        id:imageGG
        visible: true
        width: 110; height: 110
        source: "ggpose.png"
        anchors {
            top:background.top
            left:background.left
            margins: 5
        }
    }
    Image {
        id:imageGd
        visible: false
        width: 110; height: 110
        source: "guardpose.png"
        anchors {
            top:background.top
            left:background.left
            margins: 5
        }
    }

    //Иконка пропуска хода Оки
    Rectangle {
        id: krutkabox
        visible: false
        width: pageBattle.width
        height: pageBattle.height
        color: "black"
        opacity: 0.9
        Image {
            id: krutka
            visible: false
            source: "pturnhod.png"
            anchors.verticalCenter: krutkabox.verticalCenter
            anchors.horizontalCenter: krutkabox.horizontalCenter
        }
    }

    Timer {
        id: krutkatimer
        interval: 100; running: false; repeat: true
        onTriggered: {
            krutka.rotation += 15
            if (krutka.rotation == 300) {
                krutkabox.visible = false
                krutka.visible = false
                krutkatimer.running = false
            }
        }
    }
    //    property string metka: metka1
    //    function checkCounter () {
    //        if (window.counter === 0){
    //            metka = metka1
    //        } else if (window.counter === 1) {
    //            metka = metka2
    //        }
    //    }


    //ALERT ALERT ALERT БЛОК АНИМАЦИИ РУКАМИ НЕ ТРОГАТЬ (пук)
    Rectangle {
        id: box
        visible: false
        width: pageBattle.width
        height: pageBattle.height
        color: "black"
        opacity: 0.95
    }

    Image {
        id: metka1
        visible:false
        //width:150; height:170
        source: "ggattack1.png"
        //anchors.left: box.left
        anchors {
            left: box.left
            verticalCenter: box.verticalCenter
            margins: 15
        }
    }
    Image {
        id: metka2
        visible:false
        //width:150; height:170
        source: "guardattack.png"
        //anchors.left: box.left
        anchors {
            left: box.left
            verticalCenter: box.verticalCenter
            margins: 15
        }
    }

    Image {
        id: metkahurt
        visible:false
        //width:120; height:130
        source: "possessedhurt.png"
        //x: 900
        //anchors.left: box.left
        anchors {
            //verticalCenter: box.verticalCenter
            verticalCenter: background.verticalCenter
            right: box.right
            margins: 15
        }
    }

    Timer {
        id: timer
        interval: 3350; running: false; repeat: false
        onTriggered: {
            console.log(window.counter);
            pageBattle.state = "vzad"
            box.visible = false
            //window.counter === 0 ? metka2.visible = false : metka1.visible = false   //Ето так потому что после ГГ ход Гварда, а после гварда ход ГГ(на зомбака пока похер)
            metka1.visible = false; metka2.visible = false;
            metkahurt.visible = false
        }
    }

    states:  [
        State {
            name: "reanchored"
            AnchorChanges { target: window.counter === 0 ? metka1 : metka2;  anchors {
                    left: undefined
                    right: undefined;
                    verticalCenter: box.verticalCenter
                    horizontalCenter: box.horizontalCenter
                }
            }
            AnchorChanges { target: metkahurt;  anchors {
                    //bottom: finish.bottom
                    right: undefined;
                    verticalCenter: box.verticalCenter;
                    horizontalCenter: box.horizontalCenter;
                }
            }
        },
        State {
            name:"vzad"
            //when: box.visible == false
            AnchorChanges { target: window.counter === 1 ? metka1 : metka2; anchors {
                    left: background.left
                    horizontalCenter: undefined}

            }
        }
    ]

    transitions: [
        Transition {
            ParallelAnimation {
                AnchorAnimation {
                    duration: 4000
                }
                NumberAnimation {
                    target: window.counter === 0 ? metka1 : metka2; properties: "scale"; duration: 4000; from: 0.7; to: 1.2
                }
                NumberAnimation {
                    target: metkahurt; properties: "scale"; duration: 4000; from: 0.6; to: 0.7
                }
            }
        },
        Transition {
            from: "reanchored"
            to: "vzad"
            AnchorAnimation {
                duration: 0
            }
        }
    ]

    //ALERT ALERT ALERT БЛОК АНИМАЦИИ РУКАМИ НЕ ТРОГАТЬ (пук)

    //Способности Главного Героя

    Image {
        id: spellfieldhero
        source: "spellfieldhero.png"
        enabled: false
        visible: false

        anchors {
            centerIn: background
            bottomMargin: Theme.paddingMedium
        }
        Row {
            anchors.fill: parent
            spacing: 3

            MouseArea {
                width: parent.width / 5; height: parent.height

                onClicked: {

                    //checkCounter ();
                    box.visible = true
                    metka1.visible = true
                    metkahurt.visible = true
                    timer.running = true
                    pageBattle.state = "reanchored"


                    Counter.heroAttack(10, 1, 10)
                    Counter.enemyAttack(2)



                    if(window.alies[0].hp <= 0 && window.alies[1].hp <= 0){
                        Counter.slide_NextImageLose();
                    }

                    spellfieldhero.enabled = false
                    spellfieldhero.visible = false

                }
            }

            MouseArea {
                width: parent.width / 5; height: parent.height

                onClicked: {

                    box.visible = true
                    metka1.visible = true
                    metkahurt.visible = true
                    timer.running = true
                    pageBattle.state = "reanchored"

                    Counter.heroAttack(10, 1, 15)
                    Counter.enemyAttack(2)

                    if(window.alies[0].hp <= 0 && window.alies[1].hp <= 0){
                        Counter.slide_NextImageLose();
                    }

                    spellfieldhero.enabled = false
                    spellfieldhero.visible = false

                }
            }

            MouseArea {
                width: parent.width / 5; height: parent.height

                onClicked: {

                    box.visible = true
                    metka1.visible = true
                    metkahurt.visible = true
                    timer.running = true
                    pageBattle.state = "reanchored"

                    Counter.heroAttack(15, 1, 10)
                    Counter.enemyAttack(2)

                    if(window.alies[0].hp <= 0 && window.alies[1].hp <= 0){
                        Counter.slide_NextImageLose();
                    }

                    spellfieldhero.enabled = false
                    spellfieldhero.visible = false
                }
            }

            MouseArea {

                width: parent.width / 5; height: parent.height

                onClicked : {

                    krutkabox.visible = true
                    krutka.visible = true
                    krutka.rotation = 0
                    krutkatimer.running = true

                    Counter.heroAttack(0, 0, 0)
                    Counter.enemyAttack(2)

                    if(window.alies[0].hp <= 0 && window.alies[1].hp <= 0){
                        Counter.slide_NextImageLose();
                    }

                    spellfieldhero.enabled = false
                    spellfieldhero.visible = false

                }
            }
        }
    }

    //Способности Помощника(!) Главного Героя

    Image {
        id: spellfieldguard
        source: "spellfieldguard.png"
        enabled: false
        visible: false

        anchors {
            centerIn: background
            bottomMargin: Theme.paddingMedium
        }

        Row {
            anchors.fill: parent
            spacing: 3

            MouseArea {
                width: parent.width / 5; height: parent.height

                onClicked: {
                    //                    if (window.enemies[0].hpBoss > 0)
                    //                    {
                    //                        window.enemies[0].hpBoss -= 10;
                    //                    }
                    //                    if (window.enemies[0].hpBoss <= 0){
                    //                        Counter.slide_NextImageWin();
                    //                    }

                    //                    window.alies[counter].mp -= 10;

                    //                    if (window.alies[0].hp > 0){
                    //                        imageGG.visible = true; imageGd.visible = false;
                    //                    }
                    //                    counter++;
                    //                    if(counter > 1)
                    //                    {
                    //                        window.alies[0].hp -= 10
                    //                        window.alies[1].hp -= 10
                    //                        counter = 0
                    //                        if(window.alies[0].hp <= 0 && window.alies[1].hp <= 0){
                    //                            Counter.slide_NextImageLose();
                    //                        }
                    //                    }

                    box.visible = true
                    metka2.visible = true
                    metkahurt.visible = true
                    timer.running = true
                    pageBattle.state = "reanchored"

                    Counter.heroAttack(10, 1, 10)
                    Counter.enemyAttack(2)


                    if(window.alies[0].hp <= 0 && window.alies[1].hp <= 0){
                        Counter.slide_NextImageLose();
                    }

                    spellfieldguard.enabled = false
                    spellfieldguard.visible = false

                }
            }

            MouseArea {

                width: parent.width / 5; height: parent.height

                onClicked : {

                    krutkabox.visible = true
                    krutka.visible = true
                    krutka.rotation = 0
                    krutkatimer.running = true

                    Counter.heroAttack(0, 0, 0)
                    Counter.enemyAttack(2)

                    if(window.alies[0].hp <= 0 && window.alies[1].hp <= 0){
                        Counter.slide_NextImageLose();
                    }

                    spellfieldguard.enabled = false
                    spellfieldguard.visible = false

                }
            }
        }

    }

    // Кнопка Игрового Меню
    Image {
        id: menuButton
        source: "menub.png"
        scale: 0.8

        anchors
        {
            top: background.top
            right: background.right
            margins: Theme.paddingLarge
        }
        MouseArea {
            anchors.fill: parent

            onClicked: {
                if(gameMenu.enabled == false)
                {
                    gameMenu.enabled = true
                    gameMenu.visible = true
                    spellfieldguard.enabled = false
                    spellfieldguard.visible = false
                    spellfieldhero.enabled = false
                    spellfieldhero.visible = false
                }
            }
        }
    }


    // Игровое меню
    Image {
        id: gameMenu
        source: "spellfield.png"
        enabled: false
        visible: false
        width:250 ; height: background.height *0.75

        anchors {
            bottom: spellsButton.top
            centerIn: background
        }

        Column {
            id: column
            width: gameMenu.width
            height: gameMenu.height
            spacing: Theme.paddingLarge

            PageHeader { title: qsTr("<b><b>")  }

            Image {
                id: background1
                source: "IconButton.png"
                width: gameMenu.width
                height: 50

                anchors {
                    top: column.top
                    margins: Theme.paddingLarge
                }

                Text {
                    anchors.centerIn: background1
                    font.pixelSize: 25
                    color: "white"
                    font.family: "serif"
                    text: qsTr("<b><i>Continue<b><i>")
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        gameMenu.enabled = false
                        gameMenu.visible = false
                    }
                }

            }
            //
            Image {
                id: background2
                source: "IconButton.png"
                width: gameMenu.width
                height: 50

                anchors {
                    top: background1.bottom
                    margins: Theme.paddingLarge
                }

                Text {
                    anchors.centerIn: background2
                    font.pixelSize: 25
                    color: "white"
                    font.family: "serif"
                    text: qsTr("<b><i>Save<b><i>")
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        var dialog = pageStack.push(Qt.resolvedUrl("Dialog.qml"),
                                                    {"name": header.title})
                        dialog.accepted.connect(function() {
                            header.title = "My name: " + dialog.name
                        })
                    }
                }

            }
            //
            Image {
                id: background3
                source: "IconButton.png"
                width: gameMenu.width
                height: 50

                anchors {
                    bottom: column.bottom
                    margins: Theme.paddingLarge
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
                        pageStack.pop()
                    }
                }

            }
        }

    }
    //Конец Игрового Меню
}

