function counter ()
{
    /*    do {
        if(window.alies.length == 0)
            window.defeate = true;

        if (window.enemies.length == 0)
            window.victory = true;

        for(var i = 0; i < window.alies.length; i++)
        {
            window.alies[i].opacity = 1;

        }

        for(i = 0; i < window.enemies.length; i++)
        {
            window.enemies[i].opacity = 1;
            window.victory = true;
        }

    } while(window.victory == window.defeate) */
}

function generateSpells (source, damage, mp, area, index) {
    var component = Qt.createComponent("Spell.qml");

    var sprite = component.createObject({"sourceicon": source,
                                            "damage": damage, "mp": mp, "area": area});
    window.spells[index] = sprite;
    console.log("generate")

}

function slide_NextImageWin() {
    pageStack.pushAttached(Qt.resolvedUrl("Victory.qml"))
    pageStack.navigateForward()
}

function slide_NextImageLose() {
    pageStack.pushAttached(Qt.resolvedUrl("TheBadEnd.qml"))
    pageStack.navigateForward()
}


function heroAttack (damage, area, mpCost)
{
    var test = false

    console.log(window.counter);

    var hitted = 0;

    for(var i = 0; i < window.enemies.length; i++)
    {


        if (window.enemies[i].hp > 0)
        {
            console.log("test")
            window.enemies[i].hp -= damage;
            hitted++;
        }

        for(var j = 0; j < window.enemies.length; j++)
        if (window.enemies[j].hp <= 0){
            test = true
            //var t=setTimeout(Counter.Slide_NextImage,1000);
        } else {
            test = false
        }

        if(test)
            Counter.slide_NextImageWin();

        if(hitted === area)
            break;
    }

    window.alies[window.counter].mp -= mpCost;




    window.counter++;
    if (window.counter === 1 && window.alies[1].hp <= 0)
        window.counter = 0

    if (window.counter === 0 && window.alies[0].hp > 0){
        imageGG.visible = true; imageGd.visible = false;
    } else if(window.counter === 1 && window.alies[1].hp > 0){
        imageGd.visible = true; imageGG.visible = false;
    }

    //    if (window.alies[1].hp > 0){
    //        imageGG.visible = false; imageGd.visible = true;
    //    }
    //    window.counter++;
    //    if(window.counter > 1 || window.alies[1].hp <= 0)
    //    {
    //        window.alies[0].hp -= damage
    //        window.alies[1].hp = 0
    //        window.counter = 0

    //        if(window.alies[0].hp <= 0 && window.alies[1].hp <= 0){
    //            Counter.slide_NextImageLose();
    //        }
    //    }


}

function enemyAttack (area)
{
    console.log(window.enemies.length)
    if(window.counter > 1 || (window.counter === 0 && window.alies[1].hp <= 0))
    {

        for (var j = 0; j < 2; j++)
            for(var i = 0; i < area; i++)
                if(window.alies[i].hp > 0)
                    window.alies[i].hp -= 10/*window.enemies[j].damage*/
        window.counter = 0
        if (window.counter === 0 && window.alies[0].hp > 0){
            imageGG.visible = true; imageGd.visible = false;
        }
    }
}




//function generateSpells (source ,damage,mp,area) {
//    var component = Qt.createComponent("Spell.qml");

//    var sprite = component.createObject(gameBoard, {"sourceicon": source,
//                                                    "damage": damage, "mp": mp, "area": area, "x": x});
//    spells.push(sprite);


//}
