// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\juggernaut.gsc;
#using scripts\mp\juggernaut.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\battlechatter_mp.gsc;

#namespace namespace_85ed94d84cda8fef;

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29e
// Size: 0x1b6
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("juggernaut", &namespace_3fad206953a935fe::tryusejuggernautfromstruct);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "initConfig", &jugg_initconfig);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "levelData", &jugg_leveldata);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "registerActionSet", &jugg_registeractionset);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "registerOnPlayerSpawnCallback", &jugg_registeronplayerspawncallback);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "dropCrateFromScriptedHeli", &jugg_dropcratefromscriptedheli);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "makeJuggernaut", &jugg_makejuggernautcallback);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "watchPickup", &jugg_watchpickup);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "getMoveSpeedScalar", &jugg_getmovespeedscalar);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "updateMoveSpeedScale", &jugg_updatemovespeedscale);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "allowActionSet", &jugg_allowactionset);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "decrementFauxVehicleCount", &jugg_decrementfauxvehiclecount);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "incrementFauxVehicleCount", &jugg_incrementfauxvehiclecount);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "canTriggerJuggernaut", &jugg_cantriggerjuggernaut);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "playOperatorUseLine", &jugg_playoperatoruseline);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "playOperatorUseLine", &jugg_playoperatoruseline);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "juggernautWeaponPickedUp", &juggernautweaponpickedup);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "canReload", &namespace_68f1873625691c6::jugg_canreload);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "canUseWeaponPickups", &namespace_68f1873625691c6::jugg_canuseweaponpickups);
    namespace_3c37cb17ade254d::registersharedfunc("juggernaut", "getMinigunWeapon", &namespace_68f1873625691c6::jugg_getminigunweapon);
}

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45b
// Size: 0x22
function jugg_registeractionset() {
    val::function_2d6e7e0b80767910("fakeJugg", [0:"slide", 1:"prone"]);
}

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x484
// Size: 0xc
function jugg_registeronplayerspawncallback(function) {
    
}

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x497
// Size: 0x54
function jugg_dropcratefromscriptedheli(owner, team, cratetype, position, angles, destination, data, streakinfo) {
    return namespace_6c578d6ef48f10ef::dropcratefromscriptedheli(owner, team, cratetype, position, angles, destination, data, streakinfo);
}

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f3
// Size: 0x1c
function jugg_makejuggernautcallback(config, streakinfo) {
    return namespace_68f1873625691c6::jugg_makejuggernaut(config, streakinfo);
}

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x517
// Size: 0x13
function jugg_initconfig(config) {
    return namespace_68f1873625691c6::jugg_createconfig(config);
}

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x532
// Size: 0x13
function jugg_leveldata(ref) {
    return namespace_6c578d6ef48f10ef::getleveldata(ref);
}

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54d
// Size: 0x15
function jugg_watchpickup(droppingplayer) {
    thread namespace_3bbb5a98b932c46f::watchpickup(droppingplayer);
}

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x569
// Size: 0x9
function jugg_getmovespeedscalar() {
    return namespace_68f1873625691c6::jugg_getmovespeedscalar();
}

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57a
// Size: 0xa
function jugg_updatemovespeedscale() {
    namespace_3bbb5a98b932c46f::updatemovespeedscale();
}

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58b
// Size: 0x1d
function jugg_allowactionset(name, allow) {
    val::function_3633b947164be4f3(name, allow);
}

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5af
// Size: 0xa
function jugg_decrementfauxvehiclecount() {
    decrementfauxvehiclecount();
}

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c0
// Size: 0xa
function jugg_incrementfauxvehiclecount() {
    incrementfauxvehiclecount();
}

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d1
// Size: 0x78
function jugg_cantriggerjuggernaut(streakinfo) {
    if (getdvarint(@"hash_e33f3513a88f530c", 0)) {
        return 1;
    }
    if (currentactivevehiclecount() >= maxvehiclesallowed() || level.fauxvehiclecount + 1 >= maxvehiclesallowed()) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/TOO_MANY_VEHICLES");
        }
        return 0;
    }
    return 1;
}

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x651
// Size: 0xd9
function juggernautweaponpickedup(var_a2d4837d22e88282, var_6e8abb5cb9bfd417) {
    if (istrue(self.isjuggernaut)) {
        return;
    }
    if (isdefined(var_6e8abb5cb9bfd417) && isdefined(var_6e8abb5cb9bfd417.basename) && var_6e8abb5cb9bfd417.basename == "iw8_lm_dblmg_mp") {
        var_a7be10e54a3a4b99 = weaponclipsize(var_6e8abb5cb9bfd417);
        self setweaponammoclip(var_6e8abb5cb9bfd417, var_a7be10e54a3a4b99);
        return;
    }
    self.pickedupcoreminigun = 1;
    self.minigunprevweaponobject = var_6e8abb5cb9bfd417;
    self.playerstreakspeedscale = namespace_68f1873625691c6::jugg_getmovespeedscalar();
    namespace_3bbb5a98b932c46f::updatemovespeedscale();
    val::function_3633b947164be4f3("fakeJugg", 0);
    if (!istrue(level.disablemount)) {
        val::set("fakeJugg", "mount_top", 0);
        val::set("fakeJugg", "mount_side", 0);
    }
    namespace_3fad206953a935fe::watchjuggernautweaponenduse(var_a2d4837d22e88282, var_6e8abb5cb9bfd417);
}

// Namespace namespace_85ed94d84cda8fef/namespace_2e44b3b70cdb0992
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x731
// Size: 0x1f
function jugg_playoperatoruseline(player) {
    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(player, #"hash_2492241d17cecd6d");
}

