#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_779919a00ececfaa;

// Namespace namespace_779919a00ececfaa / scripts\cp\utility\game_utility_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa3
// Size: 0x18
function game_utility_cp_init() {
    registersharedfunc("game_utility", "getTimeSinceGameStart", &game_utility_cp_gettimesincegamestart);
}

// Namespace namespace_779919a00ececfaa / scripts\cp\utility\game_utility_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc3
// Size: 0x11
function game_utility_cp_gettimesincegamestart() {
    return gettime() - level.starttime;
}

