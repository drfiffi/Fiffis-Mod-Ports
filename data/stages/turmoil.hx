introLength = 0;
function onCountdown(event) event.cancel();
function create(){
    foreground1 = new FlxSprite(-1300, -350).loadGraphic(Paths.image('stages/turmoil/TreeLeaves'));
    foreground1.scrollFactor.set(1.9,1.9);
	add(foreground1);

    foreground2 = new FlxSprite(-1300, -350).loadGraphic(Paths.image('stages/turmoil/TreesForeground'));
    foreground2.scrollFactor.set(1.4,1.4);
	add(foreground2);

    fog = new FlxSprite(0, 0).loadGraphic(Paths.image('stages/turmoil/126'));
    fog.cameras = [camHUD];
    fog.screenCenter();
    add(fog);
    importScript("data/huds/Mario's Madness");
}

function onDadHit(){
    if (health >= 0.4){
		health -= 0.015;
	}
}