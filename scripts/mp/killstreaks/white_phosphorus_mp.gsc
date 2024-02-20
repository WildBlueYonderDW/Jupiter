// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;
#using scripts\mp\killstreaks\mapselect.gsc;

#namespace namespace_9cc2abf45f2e8df4;

// Namespace namespace_9cc2abf45f2e8df4/namespace_4fdbf468d74d2995
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156
// Size: 0x40
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("white_phosphorus", &namespace_e765f0aad2368473::tryusewpfromstruct);
    namespace_3c37cb17ade254d::registersharedfunc("white_phosphorus", "startMapSelectSequence", &white_phosphorus_startmapselectsequence);
    namespace_3c37cb17ade254d::registersharedfunc("white_phosphorus", "getSelectMapPoint", &white_phosphorus_getmapselectpoint);
}

// Namespace namespace_9cc2abf45f2e8df4/namespace_4fdbf468d74d2995
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d
// Size: 0x42
function white_phosphorus_startmapselectsequence(navmesh, var_edc5bb5a4b3dd2ff, var_7426e996c9eb34d3, var_3922786267ccc2a8) {
    /#
        assertex(isplayer(self), "This function needs to be called on a Player Entity");
    #/
    namespace_bc3bdbac7cebdc14::function_90f093ca8576232f(navmesh, var_edc5bb5a4b3dd2ff, var_7426e996c9eb34d3);
}

// Namespace namespace_9cc2abf45f2e8df4/namespace_4fdbf468d74d2995
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e6
// Size: 0x39
function white_phosphorus_getmapselectpoint(streakinfo, var_cdce0f8be900c487, var_edc5bb5a4b3dd2ff) {
    /#
        assertex(isplayer(self), "This function needs to be called on a Player Entity");
    #/
    return namespace_bc3bdbac7cebdc14::function_a5839924b6723eac(streakinfo, var_cdce0f8be900c487, var_edc5bb5a4b3dd2ff);
}

