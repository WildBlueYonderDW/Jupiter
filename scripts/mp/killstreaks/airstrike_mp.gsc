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

#namespace namespace_ef9f74bf67cdeb3f;

// Namespace namespace_ef9f74bf67cdeb3f/namespace_863bda310707c7c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x203
// Size: 0x8e
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("precision_airstrike", &namespace_203b58a09d020a50::tryuseairstrikefromstruct);
    namespace_58a74e7d54b56e8d::registerkillstreak("multi_airstrike", &namespace_203b58a09d020a50::tryuseairstrikefromstruct);
    namespace_58a74e7d54b56e8d::registerkillstreak("fuel_airstrike", &namespace_203b58a09d020a50::tryuseairstrikefromstruct);
    namespace_3c37cb17ade254d::registersharedfunc("airstrike", "airstrike_params", &init_airstrike_params);
    namespace_3c37cb17ade254d::registersharedfunc("airstrike", "getSelectMapPoint", &airstrike_getmapselectpoint);
    namespace_3c37cb17ade254d::registersharedfunc("airstrike", "startMapSelectSequence", &airstrike_startmapselectsequence);
    namespace_3c37cb17ade254d::registersharedfunc("airstrike", "addSpawnDangerZone", &airstrike_addspawndangerzone);
}

// Namespace namespace_ef9f74bf67cdeb3f/namespace_863bda310707c7c4
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
    level.airstrikesettings["multi_airstrike"].deployweaponobj = makeweapon(namespace_bc3bdbac7cebdc14::function_5d9830f341fbd83a());
    level.airstrikesettings["fuel_airstrike"] = spawnstruct();
    level.airstrikesettings["fuel_airstrike"].streakname = "fuel_airstrike";
    level.airstrikesettings["fuel_airstrike"].modelbase = "veh9_mil_air_suniform25_mp";
    level.airstrikesettings["fuel_airstrike"].var_c80e3ea2a37a7182 = "ks_fuelstrike_mp";
    level.airstrikesettings["fuel_airstrike"].deployweaponobj = makeweapon(namespace_bc3bdbac7cebdc14::function_5d9830f341fbd83a());
}

// Namespace namespace_ef9f74bf67cdeb3f/namespace_863bda310707c7c4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x471
// Size: 0x31
function airstrike_getmapselectpoint(streakinfo, var_cdce0f8be900c487, var_edc5bb5a4b3dd2ff) {
    self playlocalsound("iw9_ks_tablet_ui_screen_plr");
    return namespace_bc3bdbac7cebdc14::function_a5839924b6723eac(streakinfo, var_cdce0f8be900c487, var_edc5bb5a4b3dd2ff);
}

// Namespace namespace_ef9f74bf67cdeb3f/namespace_863bda310707c7c4
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4aa
// Size: 0x38
function airstrike_startmapselectsequence(navmesh, var_edc5bb5a4b3dd2ff, var_7426e996c9eb34d3, var_3922786267ccc2a8, streakinfo) {
    namespace_bc3bdbac7cebdc14::function_90f093ca8576232f(navmesh, var_edc5bb5a4b3dd2ff, var_7426e996c9eb34d3, var_3922786267ccc2a8, streakinfo);
}

// Namespace namespace_ef9f74bf67cdeb3f/namespace_863bda310707c7c4
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e9
// Size: 0x5f
function airstrike_addspawndangerzone(pos, radius, height, var_ac6ca28a64718193, lifetime, playerowner, var_d4a6ace0dec22bae, parentent, var_41171640c23ae1c1) {
    namespace_b2d5aa2baf2b5701::addspawndangerzone(pos, radius, height, var_ac6ca28a64718193, lifetime, playerowner, var_d4a6ace0dec22bae, parentent, var_41171640c23ae1c1);
}

