// mwiii decomp prototype
#using scripts\mp\killstreaks\jackal.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\airstrike.gsc;
#using scripts\mp\killstreaks\mapselect.gsc;
#using scripts\mp\spawnlogic.gsc;

#namespace airstrike_mp;

// Namespace airstrike_mp / scripts/mp/killstreaks/airstrike_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x203
// Size: 0x8e
function init() {
    scripts/mp/killstreaks/killstreaks::registerkillstreak("precision_airstrike", &scripts/cp_mp/killstreaks/airstrike::tryuseairstrikefromstruct);
    scripts/mp/killstreaks/killstreaks::registerkillstreak("multi_airstrike", &scripts/cp_mp/killstreaks/airstrike::tryuseairstrikefromstruct);
    scripts/mp/killstreaks/killstreaks::registerkillstreak("fuel_airstrike", &scripts/cp_mp/killstreaks/airstrike::tryuseairstrikefromstruct);
    scripts/engine/utility::registersharedfunc("airstrike", "airstrike_params", &init_airstrike_params);
    scripts/engine/utility::registersharedfunc("airstrike", "getSelectMapPoint", &airstrike_getmapselectpoint);
    scripts/engine/utility::registersharedfunc("airstrike", "startMapSelectSequence", &airstrike_startmapselectsequence);
    scripts/engine/utility::registersharedfunc("airstrike", "addSpawnDangerZone", &airstrike_addspawndangerzone);
}

// Namespace airstrike_mp / scripts/mp/killstreaks/airstrike_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x298
// Size: 0x1d2
function init_airstrike_params() {
    level.airstrikesettings = [];
    level.airstrikesettings["precision_airstrike"] = spawnstruct();
    level.airstrikesettings["precision_airstrike"].streakname = "precision_airstrike";
    level.airstrikesettings["precision_airstrike"].modelbase = "veh8_mil_air_alfa10";
    level.airstrikesettings["precision_airstrike"].var_c80e3ea2a37a7182 = "ks_airstrike_mp";
    level.airstrikesettings["precision_airstrike"].deployweaponobj = function_eeaa22f0cd1ff845("iw9_spotter_scope_mp");
    level.airstrikesettings["multi_airstrike"] = spawnstruct();
    level.airstrikesettings["multi_airstrike"].streakname = "multi_airstrike";
    level.airstrikesettings["multi_airstrike"].modelbase = "veh8_mil_air_alfa10";
    level.airstrikesettings["multi_airstrike"].var_c80e3ea2a37a7182 = "ks_airstrike_mp";
    level.airstrikesettings["multi_airstrike"].deployweaponobj = makeweapon(scripts/mp/killstreaks/mapselect::function_5d9830f341fbd83a());
    level.airstrikesettings["fuel_airstrike"] = spawnstruct();
    level.airstrikesettings["fuel_airstrike"].streakname = "fuel_airstrike";
    level.airstrikesettings["fuel_airstrike"].modelbase = "veh9_mil_air_suniform25_mp";
    level.airstrikesettings["fuel_airstrike"].var_c80e3ea2a37a7182 = "ks_fuelstrike_mp";
    level.airstrikesettings["fuel_airstrike"].deployweaponobj = makeweapon(scripts/mp/killstreaks/mapselect::function_5d9830f341fbd83a());
}

// Namespace airstrike_mp / scripts/mp/killstreaks/airstrike_mp
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x471
// Size: 0x31
function airstrike_getmapselectpoint(streakinfo, selectnum, directionalselection) {
    self playlocalsound("iw9_ks_tablet_ui_screen_plr");
    return scripts/mp/killstreaks/mapselect::function_a5839924b6723eac(streakinfo, selectnum, directionalselection);
}

// Namespace airstrike_mp / scripts/mp/killstreaks/airstrike_mp
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4aa
// Size: 0x38
function airstrike_startmapselectsequence(navmesh, directionalselection, directionaltype, selectortype, streakinfo) {
    scripts/mp/killstreaks/mapselect::function_90f093ca8576232f(navmesh, directionalselection, directionaltype, selectortype, streakinfo);
}

// Namespace airstrike_mp / scripts/mp/killstreaks/airstrike_mp
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e9
// Size: 0x5f
function airstrike_addspawndangerzone(pos, radius, height, friendlyteam, lifetime, playerowner, var_d4a6ace0dec22bae, parentent, var_41171640c23ae1c1) {
    scripts/mp/spawnlogic::addspawndangerzone(pos, radius, height, friendlyteam, lifetime, playerowner, var_d4a6ace0dec22bae, parentent, var_41171640c23ae1c1);
}

