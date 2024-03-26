import openfl.display.BlendMode;
var neutral:Bool = true;
var dick:Bool = false;
var watch:Bool = false;

introLength = 0;
function onCountdown(event) event.cancel();

function create(){
    FlxTween.tween(camHUD, {alpha: 0}, 0.0001, {ease: FlxEase.linear});

    strumLines.members[0].characters[0].alpha = 0;
    strumLines.members[0].characters[1].alpha = 0;
    strumLines.members[2].characters[0].alpha = 0;

    strumLines.members[2].characters[0].x = 832;
    strumLines.members[2].characters[0].y = 129;

    strumLines.members[1].characters[0].x = 427;
    strumLines.members[1].characters[0].y = 151;

    strumLines.members[0].characters[1].x = -66;
    strumLines.members[0].characters[1].y = 74;

    strumLines.members[0].characters[0].x = 134;
    strumLines.members[0].characters[0].y = 118;

    spotlight = new FlxSprite(-502, -327).loadGraphic(Paths.image('stages/hallway/spotlight'));
    spotlight.blend = BlendMode.MULTIPLY;
	add(spotlight);
}

function postCreate(){
    healthBar.visible = false;
    iconP1.visible = false;
    iconP2.visible = false;
    remove(PlayState.instance.comboGroup, true); 
}

function postUpdate(){
    camZooming = false;
    if(neutral){
        camFollow.x = 600;
        camFollow.y = 300;
    }
    if(dick){
        camFollow.x = 600;
        camFollow.y = 400;
    }
    if(watch){
        camFollow.x = 500;
        camFollow.y = 300;
    }
    shadow3.x = strumLines.members[0].characters[1].x;
    shadow3.y = strumLines.members[0].characters[1].y + 605;

    shadow4.x = strumLines.members[0].characters[0].x;
    shadow4.y = strumLines.members[0].characters[0].y + 560;
}

function stepHit(curStep:Int){
    switch(curStep){
        case 50:
            neutral = false;
            dick = true;
        case 66:
            dick = false;
            neutral = true;
        case 83:
            neutral = false;
            watch = true;
        case 98:
            watch = false;
            neutral = true;
        case 123:
            FlxTween.tween(camHUD, {alpha: 1}, 0.0001, {ease: FlxEase.linear});
            strumLines.members[0].characters[0].alpha = 1;
            strumLines.members[0].characters[1].alpha = 1;
            strumLines.members[2].characters[0].alpha = 1;
            spotlight.alpha = 0;
            spotlight2.alpha = 0;
        case 126:
            neutral = false;
        case 784:
            spotlight.alpha = 1;
        case 848:
            FlxTween.tween(camHUD, {alpha: 0}, 0.0001, {ease: FlxEase.linear});
            FlxTween.tween(camGame, {alpha: 0}, 0.0001, {ease: FlxEase.linear});
        case 852:
            FlxTween.tween(camGame, {alpha: 1}, 0.0001, {ease: FlxEase.linear});
            FlxTween.tween(camHUD, {alpha: 1}, 0.0001, {ease: FlxEase.linear});
            spotlight.flipX = true;
        case 936:
            FlxTween.tween(spotlight, {alpha: 0}, 0.3, {ease: FlxEase.linear});
        case 944:

            FlxTween.tween(strumLines.members[0].characters[1], {x: 261, y:117}, 3.0, {ease: FlxEase.linear});
            FlxTween.tween(strumLines.members[0].characters[0], {x: 625, y:148}, 3.0, {ease: FlxEase.linear});
    }
}

function onStrumCreation(e) {
    e.sprite = 'game/notes/heathersStrum';
}

function onNoteCreation(e) {
    e.noteSprite = 'game/notes/heathersStrum';
    e.note.splash = 'heathersSplashes';
}

function onPlayerHit(){
        camGame.shake(1, 0.001, null, true);
}