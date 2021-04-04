public OnGameModeInit() {
	gMySQL = mysql_connect_file();

	new error=mysql_errno(gMySQL);
	if error *then {
		mysql_error(gString, 128);
		printf("[MySQL ERROR] #%d: %s", error, gString);
	}
	_query(128, "UPDATE `users` SET `status` = '%i'", -1);
	_textdraws();
	UsePlayerPedAnims();
	SetGameModeText("Gamemode #0HPQ");
	AddStaticVehicle(510,411.2122,-1786.7233,5.3504,1.3441,5,5);
	AddStaticVehicle(510,413.0033,-1786.6459,5.3412,5.0647,6,6);
	AddStaticVehicle(510,414.6749,-1786.6201,5.3408,1.6865,16,16); 
	AddStaticVehicle(510,416.1128,-1786.6641,5.3480,3.8347,28,28); 
	AddStaticVehicle(510,417.4547,-1786.5533,5.3460,1.0408,39,39); 
	return true;
}

public OnGameModeExit() {
	mysql_close(gMySQL);
	return true;
}

public OnPlayerRequestSpawn(playerid)
	return !isPlayerLogged(playerid)?false:true;

public OnPlayerRequestClass(playerid, classid)
	return 
		isPlayerLogged(playerid)?(SpawnPlayer(playerid)):_:true;