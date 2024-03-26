var healthOn:Bool = false;
import flixel.system.scaleModes.StageSizeScaleMode;

function create(){
    boyfriend.alpha = 0.0001;
    dad.alpha = 0.0001;
    FlxTween.tween(camHUD, {alpha: 0}, 0.0001, {ease: FlxEase.linear});

    bfFake = new FlxSprite(600, -250).loadGraphic(Paths.image('stages/eyetoeye/asshole'));
	bfFake.scale.set(0.6, 0.6);
    bfFake.alpha = 0;
    bfFake.frames = Paths.getSparrowAtlas("stages/eyetoeye/asshole");
	bfFake.animation.addByPrefix('idle', "motherfucker instance 1", 12, true);

	bfFake.animation.play('idle');
	add(bfFake);
}

function postUpdate(){
    playerStrums.forEach(function(strums) strums.alpha = 0.5);
    playerStrums.notes.forEach(function(notes) notes.alpha = 0.5);
    Lib.application.window.resizable = false;
}

function onDadHit(e){
    if (healthOn && health >= 0.1)
    health -= 0.03;
}

function beatHit(curBeat:Int){
switch(curBeat){
    case 17:
    FlxTween.tween(camHUD, {alpha: 1}, 5, {ease: FlxEase.linear});

    case 42:
    FlxTween.tween(bfFake.scale, {x: 0.9, y: 0.9}, 5, {ease: FlxEase.quadOut});
    FlxTween.tween(bfFake, {alpha: 1}, 5, {ease: FlxEase.quadOut});

    case 98:
    FlxTween.tween(bfFake.scale, {x: 0.6, y: 0.6}, 3, {ease: FlxEase.quadIn});
    FlxTween.tween(bfFake, {alpha: 0}, 3, {ease: FlxEase.quadIn});

    case 101:
        FlxTween.tween(camHUD, {alpha: 0.0001}, 1, {ease: FlxEase.linear});

    case 110:
        FlxTween.tween(dad, {alpha: 1}, 1, {ease: FlxEase.linear});

    case 112:
        FlxTween.tween(camHUD, {alpha: 1}, 0.0001, {ease: FlxEase.linear});
        camHUD.zoom = 2;

    case 176:
        FlxTween.tween(boyfriend, {alpha: 1}, 0.0001, {ease: FlxEase.linear});
        FlxTween.tween(blackVoid, {alpha: 0.0001}, 0.0001, {ease: FlxEase.linear});
        healthOn = true;
        defaultCamZoom = 0.45;

    case 336:
        FlxTween.tween(boyfriend, {alpha: 0.0001}, 0.0001, {ease: FlxEase.linear});
        FlxTween.tween(blackVoid, {alpha: 1}, 0.0001, {ease: FlxEase.linear});
        defaultCamZoom = 0.9;

    case 440:
        FlxTween.tween(boyfriend, {alpha: 1}, 0.0001, {ease: FlxEase.linear});
        FlxTween.tween(blackVoid, {alpha: 0.0001}, 0.0001, {ease: FlxEase.linear});
        defaultCamZoom = 0.5;

    case 576:
        FlxTween.tween(camHUD, {alpha: 0}, 0.0001, {ease: FlxEase.linear});
}
}

function stepHit(curStep:Int){
switch(curStep){
    case 2304:
    FlxTween.tween(camHUD, {alpha: 0}, 0.0001, {ease: FlxEase.linear});

    case 2305:
    for(a in [dad, boyfriend]) FlxTween.tween(a, {alpha: 0}, 0.0001, {ease: FlxEase.linear});

    case 2306:
    FlxTween.tween(camGame, {alpha: 0}, 0.0001, {ease: FlxEase.linear});
}}