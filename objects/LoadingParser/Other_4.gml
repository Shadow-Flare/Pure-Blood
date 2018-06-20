if room == loading
{
	switch type
	{
		case loadType.newGame:
		case loadType.newGame2:
		case loadType.newGame3:
		case loadType.newGame4:
			instance_create_depth(0,0,0,NewGameLoader);
			break;
		case loadType.arena:
			instance_create_depth(0,0,0,ArenaGameLoader);
			break;
		case loadType.hordeMode:
			instance_create_depth(0,0,0,HordeModeGameLoader);
			break;
	}

	room_goto(roomTo);
}
else
{
	if (!layer_exists("Controllers")) layer_create(-1, "Controllers");
	switch type
	{
		case loadType.ending:
			//do nothing
			break;
		case loadType.newGame:
			instance_create_layer(104,305,"lay_player",objPlayer);
			with Camera phase = cameraState.player;
			instance_destroy(NewGameLoader);
			GameManager.gameState = GameState.inGame;
			type = loadType.ending;
			break;
		case loadType.arena:
			instance_create_layer(48,128,"lay_player",objPlayer);
			with Camera phase = cameraState.player;
			instance_destroy(ArenaGameLoader);
			GameManager.gameState = GameState.arena;
			type = loadType.ending;
			break;
		case loadType.hordeMode:
			instance_create_layer(384,316,"lay_player",objPlayer);
			with Camera phase = cameraState.player;
			instance_destroy(HordeModeGameLoader);
			GameManager.gameState = GameState.hordeMode;
			type = loadType.ending;
			break;
		case loadType.newGame2:
			instance_create_layer(104,289,"lay_player",objPlayer);
			with Camera phase = cameraState.player;

			instance_destroy(NewGameLoader);
			GameManager.gameState = GameState.inGame;
			type = loadType.ending;
			break;
		case loadType.newGame3:
			instance_create_layer(72,145,"lay_player",objPlayer);
			with Camera phase = cameraState.player;

			instance_destroy(NewGameLoader);
			GameManager.gameState = GameState.inGame;
			type = loadType.ending;
			break;
		case loadType.newGame4:
			instance_create_layer(32,321,"lay_player",objPlayer);
			with Camera phase = cameraState.player;

			instance_destroy(NewGameLoader);
			scr_player_giveallabilities();
			scr_player_giveallactiveabilities();
			scr_player_giveallcombos();
			scr_player_givealloffhandsubtypes();
			GameManager.gameState = GameState.inGame;
			type = loadType.ending;
			break;
	}
	Camera.x = objPlayer.x;
	Camera.y = objPlayer.y;
	Camera.xTo = Camera.x;
	Camera.yTo = Camera.y;
	Camera.xPos = Camera.x;
	Camera.yPos = Camera.y;
}