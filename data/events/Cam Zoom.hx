function onEvent(_) {
    if (_.event.name == 'Cam Zoom') {
        if (_.event.params[1] == ""){
            defaultCamZoom = _.event.params[0];
        }
        else {
            FlxTween.cancelTweensOf(FlxG.camera, ['zoom']);
            FlxTween.tween(FlxG.camera, {zoom: _.event.params[0]}, _.event.params[1], {ease: FlxEase.sineInOut, onUpdate: function(value) {defaultCamZoom = FlxG.camera.zoom;}});
        }
    }
}