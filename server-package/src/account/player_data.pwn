#include <YSI_Coding\y_hooks>

enum p_Info {
	// data variable
	p_ID,
	p_Username[24],
	p_Password[32],
	p_Email[32],
	p_Age,
	bool:p_Gender,
	p_Skin,
	p_Retry,

	//temporar variable
	bool:confirm_pw,
	_alloc,
	bool:queu_time,
	bool:waiting_log
}
new 
PlayerText:loadingPTD,
p_Var[MAX_PLAYERS][p_Info],
reset_p_var[p_Info] = {
	// normal variable
	0,EOS,EOS,EOS,29,false,0,3,

	//temporar variable
	false,0,false,false
};

#include "../src/account/register.pwn"

hook OnPlayerConnect(playerid) {
	p_Var[playerid]=reset_p_var;
	GetPlayerName(playerid, p_Var[playerid][p_Username], 24);
	defer queue_login(playerid);
	p_Var[playerid][queu_time] = true;

	loadingPTD = CreatePlayerTextDraw(playerid, 324.500000, 213.187500, "loading info");
	PlayerTextDrawLetterSize(playerid, loadingPTD, 0.340000, 1.783749);
	PlayerTextDrawTextSize(playerid, loadingPTD, 0.000000, 929.000000);
	PlayerTextDrawAlignment(playerid, loadingPTD, 2);
	PlayerTextDrawColor(playerid, loadingPTD, -1);
	PlayerTextDrawUseBox(playerid, loadingPTD, 1);
	PlayerTextDrawBoxColor(playerid, loadingPTD, 66);
	PlayerTextDrawSetShadow(playerid, loadingPTD, 0);
	PlayerTextDrawSetOutline(playerid, loadingPTD, 1);
	PlayerTextDrawBackgroundColor(playerid, loadingPTD, 118);
	PlayerTextDrawFont(playerid, loadingPTD, 2);
	PlayerTextDrawSetProportional(playerid, loadingPTD, 1);
	PlayerTextDrawSetShadow(playerid, loadingPTD, 0);
	PlayerTextDrawShow(playerid, loadingPTD);
	return true;
}

std::camera(playerid) {
	InterpolateCameraPos(playerid, 1153.784301, -873.832763, 102.585563, 1393.273925, -885.912109, 98.404487, 40000);
	InterpolateCameraLookAt(playerid, 1157.728393, -870.922851, 101.597229, 1389.738281, -882.542053, 97.335876, 40100);
	SetPlayerPos(playerid, 1265.2598,-867.4406,42.8828);
	SetPlayerVirtualWorld(playerid, 999);
	SetPlayerInterior(playerid, 0);
	return true;
}

std::account_login(playerid) {
	inline const login(response, listitem, string:inputtext[]) {
		#pragma unused listitem
		if !response *then
			return kickEx::(playerid);

		inline const check_account() {
			if !cache_num_rows() *then {
				p_Var[playerid][p_Retry]--;
				if p_Var[playerid][p_Retry]<=0 *then return kickEx::(playerid);
				account_login(playerid);
				std_cout::(playerid, COLOR_WARNING, "Warning: Mai ai %d incercari pentru a te loga!", p_Var[playerid][p_Retry]);
				return true;
			}
			p_Var[playerid][waiting_log] = false;
			stop login_time(playerid);
			new id=-1;
			cache_get_value_name_int(0, "status", id);
			if id != -1 *then
				return
					kickEx::(playerid),
					cout::(playerid, COLOR_LGREEN, "Eroare: Este deja un player connectat pe server!");

			cache_get_value_name_int(0, "ID", p_Var[playerid][p_ID]);
			cache_get_value_name(0, "name", p_Var[playerid][p_Username], MAX_PLAYER_NAME);
			cache_get_value_name(0, "password", p_Var[playerid][p_Password], 65);
			cache_get_value_name(0, "email", p_Var[playerid][p_Email], 32);
			cache_get_value_name_int(0, "gender", p_Var[playerid][p_Gender]);
			cache_get_value_name_int(0, "age", p_Var[playerid][p_Age]);
			cache_get_value_name_int(0, "skin", p_Var[playerid][p_Skin]);
			SetSpawnInfo(playerid, 0, p_Var[playerid][p_Skin], 398.9584,-1801.6847,7.8281,355.8798,0,0,0,0,0,0);
			clear_chat::(playerid, 30);
			Iter_Add(p_Logged, playerid);
			TogglePlayerSpectating(playerid, false);
			SpawnPlayer(playerid);
			TextDrawShowForPlayer(playerid, logo_TD[0]);
			TextDrawShowForPlayer(playerid, logo_TD[1]);
			_query(128, "UPDATE `users` SET `status` = '%i' WHERE `ID` = '%i'", playerid, p_Var[playerid][p_ID]);
			std_cout::(playerid, -1, "Welcome %s!", getName(playerid));
		}
		new hash[65];
		SHA256_PassHash(inputtext, _HASH, hash, 65);
		MySQL_PQueryInline(gMySQL, using inline check_account, "SELECT * FROM `users` WHERE `name` = '%s' AND `password` = '%s'", getName(playerid), hash);
	}
	format(gString, 128, "Hello %s, welcome back!\nInput your password in box for now login!", getName(playerid));
	Dialog_ShowCallback(playerid, using inline login, DIALOG_STYLE_PASSWORD, "{00BA8D}Login {FFFFFF}Account", gString, "Done", "Exit");
	return true;
}

timer queue_login[5000](playerid) {
	p_Var[playerid][queu_time]=false;
	defer login_time(playerid);
	p_Var[playerid][waiting_log] = true;
	PlayerTextDrawHide(playerid, loadingPTD);
	clear_chat::(playerid, 30);
	inline const check_account() {
		switch cache_num_rows() do {
			case false: 
				cout::(playerid, -1, "{00BA8D}SERVER: {FFFFFF}For create accounting, completed all box."),
				showPlayerRegister(playerid);

			default: 
				cout::(playerid, -1, "{00BA8D}SERVER: {FFFFFF}For login your account input you password in box."),
				account_login(playerid),
				camera(playerid);
		}
	}
	MySQL_PQueryInline(gMySQL, using inline check_account, "SELECT * FROM `users` WHERE `name` = '%s' LIMIT 1", getName(playerid));
	return true;
}

timer login_time[90000](playerid) {
	cout::(playerid, COLOR_WARNING, "Ai primit kick deoarece nu te-ai conectat in 90 secunde!");
	p_Var[playerid][waiting_log] = false;
	return kickEx::(playerid);
}

hook OnPlayerDisconnect(playerid) {
	if !isPlayerLogged(playerid) *then
		return true;

	if p_Var[playerid][queu_time] *then {
		stop queue_login(playerid);
		p_Var[playerid][queu_time]=false;
	}
	if p_Var[playerid][waiting_log] *then {
		stop login_time(playerid);
		p_Var[playerid][waiting_log] = false;
	}
	Iter_Remove(p_Logged, playerid);
	_query(128, "UPDATE `users` SET `status` = '-1' WHERE `ID` = '%i'", p_Var[playerid][p_ID]);
	return true;
}

public OnPlayerSpawn(playerid) {
	if !isPlayerLogged(playerid) *then {
		cout::(playerid, COLOR_WARNING, "Ai primit kick deoarece nu te-ai logat!");
		return kickEx::(playerid);
	}
	SetPlayerSkin(playerid, p_Var[playerid][p_Skin]);
	SetPlayerPos(playerid, 398.9584,-1801.6847,7.8281);
	SetPlayerFacingAngle(playerid, 355.8798);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0);
	return true;
}