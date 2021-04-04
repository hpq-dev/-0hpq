#pragma compat 1
#pragma dynamic (64*1024)
#define YSI_NO_MODE_CACHE
#define YSI_NO_HEAP_MALLOC
#define YSI_NO_OPTIMISATION_MESSAGE
#define YSI_NO_VERSION_CHECK

#include <a_samp>
#include <a_mysql>

#include <YSI_Data\y_iterate>
#include <YSI_Coding\y_timers>
#include <YSI_Coding\y_inline>
#include <YSI_Visual\y_dialog>
#include <YSI_Extra\y_inline_mysql>

// server data
#include "../src/global_var.pwn"
#include "../src/functions.pwn"
#include "../src/callbacks.pwn"
#include "../src/textdraws.pwn"

// acounts
#include "../src/account/player_data.pwn"

main() {}