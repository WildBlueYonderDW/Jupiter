#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using script_3db04fd1b466bdba;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\juggernaut.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\battlechatter_mp.gsc;

#namespace namespace_445185c8d1d36c6b;

// Namespace namespace_445185c8d1d36c6b / namespace_21adadac5fff4b42
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x234
// Size: 0x18
function autoexec main() {
    registersharedfunc("juggernaut_recon", "init", &init);
}

// Namespace namespace_445185c8d1d36c6b / namespace_21adadac5fff4b42
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x254
// Size: 0x14c
function init() {
    scripts\engine\utility::registersharedfunc("juggernaut_recon", "initConfig", &function_6cbad31a27208d32);
    scripts\engine\utility::registersharedfunc("juggernaut_recon", "levelData", &function_9701a01eee186094);
    scripts\engine\utility::registersharedfunc("juggernaut_recon", "registerActionSet", &function_998577120b21a50b);
    scripts\engine\utility::registersharedfunc("juggernaut_recon", "dropCrateFromScriptedHeli", &function_23b84686f47e78f4);
    scripts\engine\utility::registersharedfunc("juggernaut_recon", "makeJuggernaut", &function_a9e9a04447be5abb);
    scripts\engine\utility::registersharedfunc("juggernaut_recon", "watchPickup", &function_c7dc75a1f2dc340d);
    scripts\engine\utility::registersharedfunc("juggernaut_recon", "getMoveSpeedScalar", &function_beb2f24f2f22abe2);
    scripts\engine\utility::registersharedfunc("juggernaut_recon", "updateMoveSpeedScale", &function_eee408b4aae805c5);
    scripts\engine\utility::registersharedfunc("juggernaut_recon", "allowActionSet", &function_e8acfbf95ff60c47);
    scripts\engine\utility::registersharedfunc("juggernaut_recon", "decrementFauxVehicleCount", &function_46cfff4421ac1b50);
    scripts\engine\utility::registersharedfunc("juggernaut_recon", "incrementFauxVehicleCount", &function_ce88bec69240f560);
    scripts\engine\utility::registersharedfunc("juggernaut_recon", "canTriggerJuggernaut", &function_22256c01d8eb752c);
    scripts\engine\utility::registersharedfunc("juggernaut_recon", "playOperatorUseLine", &function_44d1e060ec177f59);
    scripts\engine\utility::registersharedfunc("juggernaut_recon", "canReload", &scripts\mp\juggernaut::jugg_canreload);
    scripts\engine\utility::registersharedfunc("juggernaut_recon", "canUseWeaponPickups", &scripts\mp\juggernaut::jugg_canuseweaponpickups);
}

// Namespace namespace_445185c8d1d36c6b / namespace_21adadac5fff4b42
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a8
// Size: 0x21
function function_998577120b21a50b() {
    val::group_register("fakeJugg", ["slide", "prone"]);
}

// Namespace namespace_445185c8d1d36c6b / namespace_21adadac5fff4b42
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d1
// Size: 0x53
function function_23b84686f47e78f4(owner, team, cratetype, position, angles, destination, data, streakinfo) {
    return scripts\cp_mp\killstreaks\airdrop::dropcratefromscriptedheli(owner, team, cratetype, position, angles, destination, data, streakinfo);
}

// Namespace namespace_445185c8d1d36c6b / namespace_21adadac5fff4b42
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d
// Size: 0x40
function function_a9e9a04447be5abb(config, streakinfo) {
    bundle = level.streakglobals.streakbundles["juggernaut_recon"];
    return scripts\mp\juggernaut::jugg_makejuggernaut(config, streakinfo, bundle);
}

// Namespace namespace_445185c8d1d36c6b / namespace_21adadac5fff4b42
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x476
// Size: 0x12
function function_6cbad31a27208d32(config) {
    return scripts\mp\juggernaut::jugg_createconfig(config);
}

// Namespace namespace_445185c8d1d36c6b / namespace_21adadac5fff4b42
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x491
// Size: 0x12
function function_9701a01eee186094(ref) {
    return scripts\cp_mp\killstreaks\airdrop::getleveldata(ref);
}

// Namespace namespace_445185c8d1d36c6b / namespace_21adadac5fff4b42
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ac
// Size: 0x14
function function_c7dc75a1f2dc340d(droppingplayer) {
    thread scripts\mp\weapons::watchpickup(droppingplayer);
}

// Namespace namespace_445185c8d1d36c6b / namespace_21adadac5fff4b42
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c8
// Size: 0x31
function function_beb2f24f2f22abe2() {
    bundle = level.streakglobals.streakbundles["juggernaut_recon"];
    return bundle.var_2c9122780ca2e437;
}

// Namespace namespace_445185c8d1d36c6b / namespace_21adadac5fff4b42
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x502
// Size: 0x9
function function_eee408b4aae805c5() {
    scripts\mp\weapons::updatemovespeedscale();
}

// Namespace namespace_445185c8d1d36c6b / namespace_21adadac5fff4b42
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x513
// Size: 0x1c
function function_e8acfbf95ff60c47(name, allow) {
    val::group_set(name, allow);
}

// Namespace namespace_445185c8d1d36c6b / namespace_21adadac5fff4b42
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x537
// Size: 0x9
function function_46cfff4421ac1b50() {
    decrementfauxvehiclecount();
}

// Namespace namespace_445185c8d1d36c6b / namespace_21adadac5fff4b42
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x548
// Size: 0x9
function function_ce88bec69240f560() {
    incrementfauxvehiclecount();
}

// Namespace namespace_445185c8d1d36c6b / namespace_21adadac5fff4b42
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x559
// Size: 0x77
function function_22256c01d8eb752c(streakinfo) {
    if (getdvarint(@"hash_e33f3513a88f530c", 0)) {
        return true;
    }
    if (currentactivevehiclecount() >= maxvehiclesallowed() || level.fauxvehiclecount + 1 >= maxvehiclesallowed()) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/TOO_MANY_VEHICLES");
        }
        return false;
    }
    return true;
}

// Namespace namespace_445185c8d1d36c6b / namespace_21adadac5fff4b42
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d9
// Size: 0x1e
function function_44d1e060ec177f59(player) {
    level thread scripts\mp\battlechatter_mp::trysaylocalsound(player, #"hash_2492241d17cecd6d");
}

