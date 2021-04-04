
new
	// normal variable
	MySQL:gMySQL, gString[1280],

	// Iterators
	Iterator:p_Logged<MAX_PLAYERS>
;

// defines
#define _HASH \
	("*&$**(#@*$")

#define redist::%0(%1) \
	forward %0(%1); public %0(%1)

#define std::%0(%1)	\
	stock %0(%1)

#define cout::			\
	SendClientMessage

#define std_cout::(%0,%1,%2,%3)  \
	format(gString,144,%2,%3) && cout::(%0,%1,gString)

#define _query(%0,%1,%2)	\
	mysql_format(gMySQL,gString,%0,%1,%2)&&mysql_pquery(gMySQL,gString)

#define getName(%0) \
	p_Var[%0][p_Username]

#define isPlayerLogged(%0) \
	Iter_Contains(p_Logged, %0)

#define kickEx::(%0)	\
	SetTimerEx("kick_player",500,false,"i",%0)

redist::kick_player(playerid) return Kick(playerid);

#define clear_chat::(%0,%1) \
	for(new c=0;c<%1;c++) cout::(%0,-1,"")

// colors
enum {
	COLOR_LGREEN = 0xA4F9CDFF,
	COLOR_RED = 0xFF0000FF,
	COLOR_WARNING = 0xC23030FF,
	COLOR_ORANGE = 0xF9A539FF,
	COLOR_SERVER = 0x00BA8DFF
}

enum {
	DIALOG_REGISTER,
	DIALOG_REGISTER_,
	DIALOG_EMAIL,
	DIALOG_GENDER,
	DIALOG_AGE,

	DIALOG_LOGIN
}