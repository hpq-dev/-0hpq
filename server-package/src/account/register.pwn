
new 
	PlayerText:register_PTD[MAX_PLAYERS][7],
	reg_skins[2][10] = {
		{7,18,20,25,26,30,37,44,59,137},
		{55,56,64,85,91,131,150,148,152,190}
	}
;

std::showPlayerRegister(playerid, _x=-1) {
	while(++_x<35) TextDrawShowForPlayer(playerid, register_TD[_x]); _x=-1;
	load_register(playerid);
	p_Var[playerid][_alloc] = 0;
	p_system[playerid] = SYSTEM_REGISTER;
	SelectTextDraw(playerid, 0xF0A02DFF);
	TogglePlayerSpectating(playerid, true);
	return true;
}

redist::click_register(playerid, _id) {
	switch _id do {
		case CLICK_REGISTER: {
			inline const input_password(response, listitem, string:inputtext[]) {
				#pragma unused listitem
				if !response *then
					return true;

				if !strlen(inputtext) *then
					return true;

				if !checker(inputtext)||strlen(inputtext)<7||strlen(inputtext)>32 *then
					return cout::(playerid, COLOR_LGREEN, "Eroare: Parola ta trebuie sa inceapa cu o litera mare sa aibe numere si sa fie intre 7 si 32 caractere!");
				
				strmid(p_Var[playerid][p_Password], inputtext, 0, 32);
				PlayerTextDrawSetString(playerid, register_PTD[playerid][2], hash_string(strlen(inputtext)));
				p_Var[playerid][confirm_pw]=false;
			}
			Dialog_ShowCallback(playerid, using inline input_password, DIALOG_STYLE_PASSWORD, "{00BA8D}Register {FFFFFF}Password", "Input your password in box", "Done", "Close");
		}
		case CLICK_CONFIRM_REGISTER: {
			inline const input_repassword(response, listitem, string:inputtext[]) {
				#pragma unused listitem
				if !response *then
					return true;

				if strlen(inputtext) < 7 *then
					return 
						click_register(playerid, CLICK_CONFIRM_REGISTER),
						cout::(playerid, COLOR_LGREEN, "Eroare: Trebuie sa introduci mai intai o parola.");

				if !compare(p_Var[playerid][p_Password],inputtext) *then
					return
						click_register(playerid, CLICK_CONFIRM_REGISTER),
						cout::(playerid, COLOR_LGREEN, "Eroare: Parola introdusa nu corespunde parola introdusa recent.");
				
				p_Var[playerid][confirm_pw]=true;
				PlayerTextDrawSetString(playerid, register_PTD[playerid][3], hash_string(strlen(p_Var[playerid][p_Password])));
			}
			Dialog_ShowCallback(playerid, using inline input_repassword, DIALOG_STYLE_PASSWORD, "{00BA8D}Register {FFFFFF}Confirm password", "Confirm your password", "Done", "Close");
		}
		case CLICK_EMAIL: {
			inline const input_email(response, listitem, string:inputtext[]) {
				#pragma unused listitem
				if !response *then
					return true;

				if !IsMail(inputtext) *then
					return 
						click_register(playerid, CLICK_EMAIL),
						cout::(playerid, COLOR_LGREEN, "Eroare: Adresa de email nu este valida!");


				strmid(p_Var[playerid][p_Email],inputtext,0,32);
				PlayerTextDrawSetString(playerid, register_PTD[playerid][4], inputtext);
			}
			Dialog_ShowCallback(playerid, using inline input_email, DIALOG_STYLE_INPUT, "{00BA8D}Register {FFFFFF}Email", "Insert your email adress\nEx: server@server.com", "Done", "Close");
		}
		case CLICK_GENDER: {
			inline const input_gender(response, listitem, string:inputtext[]) {
				#pragma unused inputtext
				if !response *then return true;
				p_Var[playerid][p_Gender]=bool:listitem;
				p_Var[playerid][_alloc]=0;
				p_Var[playerid][p_Skin]=reg_skins[(bool:listitem)][0];
				PlayerTextDrawSetPreviewModel(playerid, register_PTD[playerid][0], p_Var[playerid][p_Skin]);
				PlayerTextDrawShow(playerid, register_PTD[playerid][0]);
				PlayerTextDrawSetString(playerid, register_PTD[playerid][5], !(bool:listitem)?"Male":"Female");
			}
			Dialog_ShowCallback(playerid, using inline input_gender, DIALOG_STYLE_LIST, "{00BA8D}Register {FFFFFF}Gender", "Male\nFemale", "Done", "Close");
		}
		case CLICK_AGE: {
			inline const input_age(response, listitem, string:inputtext[]) {
				if !response *then return true;
				if((listitem=strval(inputtext))<7||listitem>70)
					return
						click_register(playerid, CLICK_AGE),
						cout::(playerid, COLOR_LGREEN, "Eroare: Varsta ta trebuie sa fie in 7 si 70 ani!");

				p_Var[playerid][p_Age]=listitem;
				PlayerTextDrawSetString(playerid, register_PTD[playerid][6], inputtext);
			}
			Dialog_ShowCallback(playerid, using inline input_age, DIALOG_STYLE_INPUT, "{00BA8D}Register {FFFFFF}Age", "Input your age", "Done", "Close");
		}
		case CLICK_PREV_SKIN: {
			if p_Var[playerid][_alloc]<=0 *then
				return true;

			p_Var[playerid][_alloc]--;
			p_Var[playerid][p_Skin] = reg_skins[p_Var[playerid][p_Gender]][p_Var[playerid][_alloc]];
			PlayerTextDrawSetPreviewModel(playerid, register_PTD[playerid][0], p_Var[playerid][p_Skin]);
			PlayerTextDrawShow(playerid, register_PTD[playerid][0]);
		}
		case CLICK_NEXT_SKIN: {
			if p_Var[playerid][_alloc]>=9 *then
				return true;

			p_Var[playerid][_alloc]++;
			p_Var[playerid][p_Skin] = reg_skins[p_Var[playerid][p_Gender]][p_Var[playerid][_alloc]];
			PlayerTextDrawSetPreviewModel(playerid, register_PTD[playerid][0], p_Var[playerid][p_Skin]);
			PlayerTextDrawShow(playerid, register_PTD[playerid][0]);
		}
		case CLICK_REIGSTER_ACCOUNT: {
			if strlen(p_Var[playerid][p_Password])<7||!p_Var[playerid][confirm_pw]||strlen(p_Var[playerid][p_Email])<10||!p_Var[playerid][p_Age] *then
				return cout::(playerid, COLOR_LGREEN, "Eroare: Nu ai compleatat toate tabelele!");

			inline const cache_id_account() {
				new x=-1;
				while(++x<35) TextDrawHideForPlayer(playerid, register_TD[x]); x=-1;
				while(++x<7) PlayerTextDrawDestroy(playerid, register_PTD[playerid][x]);
				p_system[playerid]=INVALID_SYSTEM;
				CancelSelectTextDraw(playerid);
				camera(playerid);
				account_login(playerid);
				stop login_time(playerid);
				defer login_time(playerid);
			}
			new hash[65];
			SHA256_PassHash(p_Var[playerid][p_Password], _HASH, hash, 65);
			MySQL_PQueryInline(
				gMySQL, 
				using inline cache_id_account, 
				"INSERT INTO `users` (`name`, `password`, `email`, `gender`, `age`, `skin`) VALUES \
				('%s', '%s', '%s', '%s', '%i', '%i')",
				p_Var[playerid][p_Username], hash, p_Var[playerid][p_Email],
				p_Var[playerid][p_Gender], p_Var[playerid][p_Age], p_Var[playerid][p_Skin]
			);
		}
	}
	return true;
}	

std::load_register(playerid, _x=-1) {
	register_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 177.399902, 204.000000, "");
	PlayerTextDrawLetterSize(playerid, register_PTD[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, register_PTD[playerid][0], 146.000000, 130.000000);
	PlayerTextDrawAlignment(playerid, register_PTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, register_PTD[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, register_PTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, register_PTD[playerid][0], 0);
	PlayerTextDrawFont(playerid, register_PTD[playerid][0], 5);
	PlayerTextDrawSetProportional(playerid, register_PTD[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][0], 0);
	PlayerTextDrawSetPreviewModel(playerid, register_PTD[playerid][0], reg_skins[0][0]);
	PlayerTextDrawSetPreviewRot(playerid, register_PTD[playerid][0], -25.000000, 0.000000, -25.000000, 1.000000);
	PlayerTextDrawShow(playerid, register_PTD[playerid][0]);

	register_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 252.816650, 337.408355, getName(playerid));
	PlayerTextDrawLetterSize(playerid, register_PTD[playerid][1], 0.284000, 1.438122);
	PlayerTextDrawAlignment(playerid, register_PTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, register_PTD[playerid][1], -1061109505);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, register_PTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, register_PTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, register_PTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, register_PTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, register_PTD[playerid][1], 0);
	PlayerTextDrawShow(playerid, register_PTD[playerid][1]);

	while(++_x<5) {
		register_PTD[playerid][_x+2] = CreatePlayerTextDraw(playerid, 348.747497, 192.062850+(_x*27.9), "-");
		PlayerTextDrawLetterSize(playerid, register_PTD[playerid][_x+2], 0.161871, 1.093958);
		PlayerTextDrawAlignment(playerid, register_PTD[playerid][_x+2], 1);
		PlayerTextDrawColor(playerid, register_PTD[playerid][_x+2], 12291839);
		PlayerTextDrawSetShadow(playerid, register_PTD[playerid][_x+2], 0);
		PlayerTextDrawSetOutline(playerid, register_PTD[playerid][_x+2], 0);
		PlayerTextDrawBackgroundColor(playerid, register_PTD[playerid][_x+2], 255);
		PlayerTextDrawFont(playerid, register_PTD[playerid][_x+2], 2);
		PlayerTextDrawSetProportional(playerid, register_PTD[playerid][_x+2], 1);
		PlayerTextDrawSetShadow(playerid, register_PTD[playerid][_x+2], 0);
		PlayerTextDrawShow(playerid, register_PTD[playerid][_x+2]);
	}
	return true;
}