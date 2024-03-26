function onEvent(_)
    if (_.event.name == 'Set Cam Position') {
        game.camFollow.x = _.event.params[0];
        game.camFollow.y = _.event.params[1];
}