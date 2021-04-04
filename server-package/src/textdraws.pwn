
// variable
new
	g_select[MAX_TEXT_DRAWS] = {_:INVALID_TEXT_DRAW, ...},
	Text:register_TD[35], p_system[MAX_PLAYERS], Text:logo_TD[2]
;

enum {
	INVALID_SYSTEM,
	SYSTEM_REGISTER
}

enum {
	INVALID_CLICK,
	CLICK_REGISTER,
	CLICK_CONFIRM_REGISTER,
	CLICK_EMAIL,
	CLICK_GENDER,
	CLICK_AGE,
	CLICK_PREV_SKIN,
	CLICK_NEXT_SKIN,
	CLICK_REIGSTER_ACCOUNT
}

public OnPlayerClickTextDraw(playerid, Text:clickedid) {
	if clickedid==Text:INVALID_TEXT_DRAW *then {
		switch p_system[playerid] do {
			case SYSTEM_REGISTER: SelectTextDraw(playerid, 0xF0A02DFF);
		}
		return true;
	}
	new _t=g_select[Text:clickedid];
	switch _t do {
		case CLICK_REGISTER..CLICK_REIGSTER_ACCOUNT: CallRemoteFunction("click_register", "ii", playerid, _t);
	}
	return true;
}

redist::_textdraws() {
	new x=-1;
	register_TD[0] = TextDrawCreate(-26.500000, -35.312500, "LD_SPAC:white");
	TextDrawLetterSize(register_TD[0], 0.000000, 0.000000);
	TextDrawTextSize(register_TD[0], 861.000000, 500.000000);
	TextDrawAlignment(register_TD[0], 1);
	TextDrawColor(register_TD[0], -437063425);
	TextDrawSetShadow(register_TD[0], 0);
	TextDrawSetOutline(register_TD[0], 0);
	TextDrawBackgroundColor(register_TD[0], 255);
	TextDrawFont(register_TD[0], 4);
	TextDrawSetProportional(register_TD[0], 0);
	TextDrawSetShadow(register_TD[0], 0);

	register_TD[1] = TextDrawCreate(204.636901, 160.916625, "LD_SPAC:white");
	TextDrawLetterSize(register_TD[1], 0.000000, 0.000000);
	TextDrawTextSize(register_TD[1], 240.000000, 201.000000);
	TextDrawAlignment(register_TD[1], 1);
	TextDrawColor(register_TD[1], 673986559);
	TextDrawSetShadow(register_TD[1], 0);
	TextDrawSetOutline(register_TD[1], 0);
	TextDrawBackgroundColor(register_TD[1], 255);
	TextDrawFont(register_TD[1], 4);
	TextDrawSetProportional(register_TD[1], 0);
	TextDrawSetShadow(register_TD[1], 0);

	register_TD[2] = TextDrawCreate(225.299926, 106.550018, "LD_BEAT:CHIT");
	TextDrawLetterSize(register_TD[2], 0.000000, 0.000000);
	TextDrawTextSize(register_TD[2], 53.390102, 84.000000);
	TextDrawAlignment(register_TD[2], 1);
	TextDrawColor(register_TD[2], -437063425);
	TextDrawSetShadow(register_TD[2], 0);
	TextDrawSetOutline(register_TD[2], 0);
	TextDrawBackgroundColor(register_TD[2], 255);
	TextDrawFont(register_TD[2], 4);
	TextDrawSetProportional(register_TD[2], 0);
	TextDrawSetShadow(register_TD[2], 0);

	register_TD[3] = TextDrawCreate(205.000000, 120.000000, "LD_SPAC:white");
	TextDrawLetterSize(register_TD[3], 0.000000, 0.000000);
	TextDrawTextSize(register_TD[3], 240.000000, 40.000000);
	TextDrawAlignment(register_TD[3], 1);
	TextDrawColor(register_TD[3], 12291839);
	TextDrawSetShadow(register_TD[3], 0);
	TextDrawSetOutline(register_TD[3], 0);
	TextDrawBackgroundColor(register_TD[3], 255);
	TextDrawFont(register_TD[3], 4);
	TextDrawSetProportional(register_TD[3], 0);
	TextDrawSetShadow(register_TD[3], 0);

	register_TD[4] = TextDrawCreate(228.999877, 122.174980, "LD_BEAT:CHIT");
	TextDrawLetterSize(register_TD[4], 0.000000, 0.000000);
	TextDrawTextSize(register_TD[4], 46.099983, 64.000000);
	TextDrawAlignment(register_TD[4], 1);
	TextDrawColor(register_TD[4], 12291839);
	TextDrawSetShadow(register_TD[4], 0);
	TextDrawSetOutline(register_TD[4], 0);
	TextDrawBackgroundColor(register_TD[4], 255);
	TextDrawFont(register_TD[4], 4);
	TextDrawSetProportional(register_TD[4], 0);
	TextDrawSetShadow(register_TD[4], 0);

	register_TD[5] = TextDrawCreate(327.800048, 131.812500, "REGISTER ACCOUNT");
	TextDrawLetterSize(register_TD[5], 0.411998, 1.919373);
	TextDrawAlignment(register_TD[5], 2);
	TextDrawColor(register_TD[5], -1);
	TextDrawSetShadow(register_TD[5], 0);
	TextDrawSetOutline(register_TD[5], 0);
	TextDrawBackgroundColor(register_TD[5], 255);
	TextDrawFont(register_TD[5], 1);
	TextDrawSetProportional(register_TD[5], 1);
	TextDrawSetShadow(register_TD[5], 0);

	register_TD[6] = TextDrawCreate(213.590591, 189.779373, "LD_SPAC:white");
	TextDrawLetterSize(register_TD[6], 0.000000, 0.000000);
	TextDrawTextSize(register_TD[6], 79.000000, 145.000000);
	TextDrawAlignment(register_TD[6], 1);
	TextDrawColor(register_TD[6], 118100223);
	TextDrawSetShadow(register_TD[6], 0);
	TextDrawSetOutline(register_TD[6], 0);
	TextDrawBackgroundColor(register_TD[6], 255);
	TextDrawFont(register_TD[6], 4);
	TextDrawSetProportional(register_TD[6], 0);
	TextDrawSetShadow(register_TD[6], 0);

	register_TD[7] = TextDrawCreate(214.944335, 190.662719, "LD_SPAC:white");
	TextDrawLetterSize(register_TD[7], 0.000000, 0.000000);
	TextDrawTextSize(register_TD[7], 76.680145, 142.789566);
	TextDrawAlignment(register_TD[7], 1);
	TextDrawColor(register_TD[7], 353967359);
	TextDrawSetShadow(register_TD[7], 0);
	TextDrawSetOutline(register_TD[7], 0);
	TextDrawBackgroundColor(register_TD[7], 255);
	TextDrawFont(register_TD[7], 4);
	TextDrawSetProportional(register_TD[7], 0);
	TextDrawSetShadow(register_TD[7], 0);

	register_TD[8] = TextDrawCreate(205.199829, 296.987487, "LD_BEAT:CHIT");
	TextDrawLetterSize(register_TD[8], 0.000000, 0.000000);
	TextDrawTextSize(register_TD[8], 94.000000, 35.000000);
	TextDrawAlignment(register_TD[8], 1);
	TextDrawColor(register_TD[8], 34);
	TextDrawSetShadow(register_TD[8], 0);
	TextDrawSetOutline(register_TD[8], 0);
	TextDrawBackgroundColor(register_TD[8], 255);
	TextDrawFont(register_TD[8], 4);
	TextDrawSetProportional(register_TD[8], 0);
	TextDrawSetShadow(register_TD[8], 0);

	register_TD[9] = TextDrawCreate(217.144226, 245.862884, "LD_SPAC:white");
	TextDrawLetterSize(register_TD[9], 0.000000, 0.000000);
	TextDrawTextSize(register_TD[9], 10.000000, 27.000000);
	TextDrawAlignment(register_TD[9], 1);
	TextDrawColor(register_TD[9], 286397439);
	TextDrawSetShadow(register_TD[9], 0);
	TextDrawSetOutline(register_TD[9], 0);
	TextDrawBackgroundColor(register_TD[9], 255);
	TextDrawFont(register_TD[9], 4);
	TextDrawSetProportional(register_TD[9], 0);
	TextDrawSetShadow(register_TD[9], 0);
	TextDrawSetSelectable(register_TD[9], true);
	g_select[Text:register_TD[9]] = CLICK_PREV_SKIN;

	register_TD[10] = TextDrawCreate(279.244598, 244.700286, "LD_SPAC:white");
	TextDrawLetterSize(register_TD[10], 0.000000, 0.000000);
	TextDrawTextSize(register_TD[10], 10.000000, 27.000000);
	TextDrawAlignment(register_TD[10], 1);
	TextDrawColor(register_TD[10], 286397439);
	TextDrawSetShadow(register_TD[10], 0);
	TextDrawSetOutline(register_TD[10], 0);
	TextDrawBackgroundColor(register_TD[10], 255);
	TextDrawFont(register_TD[10], 4);
	TextDrawSetProportional(register_TD[10], 0);
	TextDrawSetShadow(register_TD[10], 0);
	TextDrawSetSelectable(register_TD[10], true);
	g_select[Text:register_TD[10]] = CLICK_NEXT_SKIN;

	register_TD[11] = TextDrawCreate(220.100463, 242.937500, "<");
	TextDrawLetterSize(register_TD[11], 0.141999, 3.424375);
	TextDrawAlignment(register_TD[11], 1);
	TextDrawColor(register_TD[11], -1061109505);
	TextDrawSetShadow(register_TD[11], 0);
	TextDrawSetOutline(register_TD[11], 0);
	TextDrawBackgroundColor(register_TD[11], 255);
	TextDrawFont(register_TD[11], 2);
	TextDrawSetProportional(register_TD[11], 1);
	TextDrawSetShadow(register_TD[11], 0);

	register_TD[12] = TextDrawCreate(282.699951, 241.499938, ">");
	TextDrawLetterSize(register_TD[12], 0.141999, 3.424375);
	TextDrawAlignment(register_TD[12], 1);
	TextDrawColor(register_TD[12], -1061109505);
	TextDrawSetShadow(register_TD[12], 0);
	TextDrawSetOutline(register_TD[12], 0);
	TextDrawBackgroundColor(register_TD[12], 255);
	TextDrawFont(register_TD[12], 2);
	TextDrawSetProportional(register_TD[12], 1);
	TextDrawSetShadow(register_TD[12], 0);


	static const r_colon[][] = {"password", "re-password", "email", "gender", "age"};
	while(++x<5) {
		register_TD[x+13] = TextDrawCreate(344.316040, 190.446258+(x*27.2), r_colon[x]);
		TextDrawLetterSize(register_TD[x+13], 0.167499, 1.263125);
		TextDrawAlignment(register_TD[x+13], 3);
		TextDrawColor(register_TD[x+13], -1061109505);
		TextDrawSetShadow(register_TD[x+13], 0);
		TextDrawSetOutline(register_TD[x+13], 0);
		TextDrawBackgroundColor(register_TD[x+13], 255);
		TextDrawFont(register_TD[x+13], 2);
		TextDrawSetProportional(register_TD[x+13], 1);
		TextDrawSetShadow(register_TD[x+13], 0);
		
		register_TD[x+18] = TextDrawCreate(346.390960, 188.279281+(x*27.8), "LD_SPAC:white");
		TextDrawLetterSize(register_TD[x+18], 0.000000, 0.000000);
		TextDrawTextSize(register_TD[x+18], 91.000000, 18.670015);
		TextDrawAlignment(register_TD[x+18], 1);
		TextDrawColor(register_TD[x+18], 118100223);
		TextDrawSetShadow(register_TD[x+18], 0);
		TextDrawSetOutline(register_TD[x+18], 0);
		TextDrawBackgroundColor(register_TD[x+18], 255);
		TextDrawFont(register_TD[x+18], 4);
		TextDrawSetProportional(register_TD[x+18], 0);
		TextDrawSetShadow(register_TD[x+18], 0);
		TextDrawSetSelectable(register_TD[x+18], true);
		g_select[Text:register_TD[x+18]] = CLICK_REGISTER+x;

		register_TD[x+23] = TextDrawCreate(346.944335, 189.362854+(x*27.8), "LD_SPAC:white");
		TextDrawLetterSize(register_TD[x+23], 0.000000, 0.000000);
		TextDrawTextSize(register_TD[x+23], 90.000000, 16.400009);
		TextDrawAlignment(register_TD[x+23], 1);
		TextDrawColor(register_TD[x+23], 353967359);
		TextDrawSetShadow(register_TD[x+23], 0);
		TextDrawSetOutline(register_TD[x+23], 0);
		TextDrawBackgroundColor(register_TD[x+23], 255);
		TextDrawFont(register_TD[x+23], 4);
		TextDrawSetProportional(register_TD[x+23], 0);
		TextDrawSetShadow(register_TD[x+23], 0);
	}
	register_TD[28] = TextDrawCreate(323.500000, 329.125000, "LD_SPAC:white");
	TextDrawLetterSize(register_TD[28], 0.000000, 0.000000);
	TextDrawTextSize(register_TD[28], 94.000000, 27.000000);
	TextDrawAlignment(register_TD[28], 1);
	TextDrawColor(register_TD[28], 12291839);
	TextDrawSetShadow(register_TD[28], 0);
	TextDrawSetOutline(register_TD[28], 0);
	TextDrawBackgroundColor(register_TD[28], 255);
	TextDrawFont(register_TD[28], 4);
	TextDrawSetProportional(register_TD[28], 0);
	TextDrawSetShadow(register_TD[28], 0);
	TextDrawSetSelectable(register_TD[28], true);
	g_select[Text:register_TD[28]] = CLICK_REIGSTER_ACCOUNT;

	register_TD[29] = TextDrawCreate(371.400085, 335.550018, "register");
	TextDrawLetterSize(register_TD[29], 0.245498, 1.534373);
	TextDrawAlignment(register_TD[29], 2);
	TextDrawColor(register_TD[29], -1);
	TextDrawSetShadow(register_TD[29], 0);
	TextDrawSetOutline(register_TD[29], 0);
	TextDrawBackgroundColor(register_TD[29], 255);
	TextDrawFont(register_TD[29], 2);
	TextDrawSetProportional(register_TD[29], 1);
	TextDrawSetShadow(register_TD[29], 0);

	logo_TD[0] = TextDrawCreate(552.899658, 12.000001, "particle:bloodpool_64");
	TextDrawLetterSize(logo_TD[0], 0.000000, 0.000000);
	TextDrawTextSize(logo_TD[0], 32.000000, 29.000000);
	TextDrawAlignment(logo_TD[0], 1);
	TextDrawColor(logo_TD[0], 255);
	TextDrawSetShadow(logo_TD[0], 0);
	TextDrawSetOutline(logo_TD[0], 0);
	TextDrawBackgroundColor(logo_TD[0], 255);
	TextDrawFont(logo_TD[0], 4);
	TextDrawSetProportional(logo_TD[0], 0);
	TextDrawSetShadow(logo_TD[0], 0);

	logo_TD[1] = TextDrawCreate(583.000000, 15.437500, "HPQ123~n~~w~#0");
	TextDrawLetterSize(logo_TD[1], 0.327499, 1.534374);
	TextDrawAlignment(logo_TD[1], 2);
	TextDrawColor(logo_TD[1], 16711935);
	TextDrawSetShadow(logo_TD[1], 0);
	TextDrawSetOutline(logo_TD[1], 1);
	TextDrawBackgroundColor(logo_TD[1], 97);
	TextDrawFont(logo_TD[1], 1);
	TextDrawSetProportional(logo_TD[1], 1);
	TextDrawSetShadow(logo_TD[1], 0);
	return true;
}