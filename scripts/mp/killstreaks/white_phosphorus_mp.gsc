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

// Namespace namespace_9cc2abf45f2e8df4 / scripts/mp/killstreaks/white_phosphorus_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156
// Size: 0x40
function init() {
    scripts/mp/killstreaks/killstreaks::registerkillstreak("white_phosphorus", &scripts/cp_mp/killstreaks/white_phosphorus::tryusewpfromstruct);
    scripts/engine/utility::registersharedfunc("white_phosphorus", "startMapSelectSequence", &white_phosphorus_startmapselectsequence);
    scripts/engine/utility::registersharedfunc("white_phosphorus", "getSelectMapPoint", &white_phosphorus_getmapselectpoint);
}

// Namespace namespace_9cc2abf45f2e8df4 / scripts/mp/killstreaks/white_phosphorus_mp
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d
// Size: 0x42
function white_phosphorus_startmapselectsequence(navmesh, directionalselection, directionaltype, selectortype) {
    /#
        assertex(isplayer(self), "This function needs to be called on a Player Entity");
    #/
    scripts/mp/killstreaks/mapselect::function_90f093ca8576232f(navmesh, directionalselection, directionaltype);
}

// Namespace namespace_9cc2abf45f2e8df4 / scripts/mp/killstreaks/white_phosphorus_mp
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e6
// Size: 0x39
function white_phosphorus_getmapselectpoint(streakinfo, selectnum, directionalselection) {
    /#
        assertex(isplayer(self), "This function needs to be called on a Player Entity");
    #/
    return scripts/mp/killstreaks/mapselect::function_a5839924b6723eac(streakinfo, selectnum, directionalselection);
}

