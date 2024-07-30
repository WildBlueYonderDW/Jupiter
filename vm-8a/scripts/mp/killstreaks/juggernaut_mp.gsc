#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
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

#namespace juggernaut_mp;

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29e
// Size: 0x1b5
function init() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("juggernaut", &scripts\cp_mp\killstreaks\juggernaut::tryusejuggernautfromstruct);
    scripts\engine\utility::registersharedfunc("juggernaut", "initConfig", &jugg_initconfig);
    scripts\engine\utility::registersharedfunc("juggernaut", "levelData", &jugg_leveldata);
    scripts\engine\utility::registersharedfunc("juggernaut", "registerActionSet", &jugg_registeractionset);
    scripts\engine\utility::registersharedfunc("juggernaut", "registerOnPlayerSpawnCallback", &jugg_registeronplayerspawncallback);
    scripts\engine\utility::registersharedfunc("juggernaut", "dropCrateFromScriptedHeli", &jugg_dropcratefromscriptedheli);
    scripts\engine\utility::registersharedfunc("juggernaut", "makeJuggernaut", &jugg_makejuggernautcallback);
    scripts\engine\utility::registersharedfunc("juggernaut", "watchPickup", &jugg_watchpickup);
    scripts\engine\utility::registersharedfunc("juggernaut", "getMoveSpeedScalar", &jugg_getmovespeedscalar);
    scripts\engine\utility::registersharedfunc("juggernaut", "updateMoveSpeedScale", &jugg_updatemovespeedscale);
    scripts\engine\utility::registersharedfunc("juggernaut", "allowActionSet", &jugg_allowactionset);
    scripts\engine\utility::registersharedfunc("juggernaut", "decrementFauxVehicleCount", &jugg_decrementfauxvehiclecount);
    scripts\engine\utility::registersharedfunc("juggernaut", "incrementFauxVehicleCount", &jugg_incrementfauxvehiclecount);
    scripts\engine\utility::registersharedfunc("juggernaut", "canTriggerJuggernaut", &jugg_cantriggerjuggernaut);
    scripts\engine\utility::registersharedfunc("juggernaut", "playOperatorUseLine", &jugg_playoperatoruseline);
    scripts\engine\utility::registersharedfunc("juggernaut", "playOperatorUseLine", &jugg_playoperatoruseline);
    scripts\engine\utility::registersharedfunc("juggernaut", "juggernautWeaponPickedUp", &juggernautweaponpickedup);
    scripts\engine\utility::registersharedfunc("juggernaut", "canReload", &scripts\mp\juggernaut::jugg_canreload);
    scripts\engine\utility::registersharedfunc("juggernaut", "canUseWeaponPickups", &scripts\mp\juggernaut::jugg_canuseweaponpickups);
    scripts\engine\utility::registersharedfunc("juggernaut", "getMinigunWeapon", &scripts\mp\juggernaut::jugg_getminigunweapon);
}

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45b
// Size: 0x21
function jugg_registeractionset() {
    val::group_register("fakeJugg", ["slide", "prone"]);
}

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x484
// Size: 0xb
function jugg_registeronplayerspawncallback(function) {
    
}

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x497
// Size: 0x53
function jugg_dropcratefromscriptedheli(owner, team, cratetype, position, angles, destination, data, streakinfo) {
    return scripts\cp_mp\killstreaks\airdrop::dropcratefromscriptedheli(owner, team, cratetype, position, angles, destination, data, streakinfo);
}

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f3
// Size: 0x1b
function jugg_makejuggernautcallback(config, streakinfo) {
    return scripts\mp\juggernaut::jugg_makejuggernaut(config, streakinfo);
}

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x517
// Size: 0x12
function jugg_initconfig(config) {
    return scripts\mp\juggernaut::jugg_createconfig(config);
}

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x532
// Size: 0x12
function jugg_leveldata(ref) {
    return scripts\cp_mp\killstreaks\airdrop::getleveldata(ref);
}

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54d
// Size: 0x14
function jugg_watchpickup(droppingplayer) {
    thread scripts\mp\weapons::watchpickup(droppingplayer);
}

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x569
// Size: 0x8
function jugg_getmovespeedscalar() {
    return scripts\mp\juggernaut::jugg_getmovespeedscalar();
}

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57a
// Size: 0x9
function jugg_updatemovespeedscale() {
    scripts\mp\weapons::updatemovespeedscale();
}

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58b
// Size: 0x1c
function jugg_allowactionset(name, allow) {
    val::group_set(name, allow);
}

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5af
// Size: 0x9
function jugg_decrementfauxvehiclecount() {
    decrementfauxvehiclecount();
}

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c0
// Size: 0x9
function jugg_incrementfauxvehiclecount() {
    incrementfauxvehiclecount();
}

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d1
// Size: 0x77
function jugg_cantriggerjuggernaut(streakinfo) {
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

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x651
// Size: 0xd8
function juggernautweaponpickedup(juggernautweaponobject, prevweaponobject) {
    if (istrue(self.isjuggernaut)) {
        return;
    }
    if (isdefined(prevweaponobject) && isdefined(prevweaponobject.basename) && prevweaponobject.basename == "iw8_lm_dblmg_mp") {
        maxclipammo = weaponclipsize(prevweaponobject);
        self setweaponammoclip(prevweaponobject, maxclipammo);
        return;
    }
    self.pickedupcoreminigun = 1;
    self.minigunprevweaponobject = prevweaponobject;
    self.playerstreakspeedscale = scripts\mp\juggernaut::jugg_getmovespeedscalar();
    scripts\mp\weapons::updatemovespeedscale();
    val::group_set("fakeJugg", 0);
    if (!istrue(level.disablemount)) {
        val::set("fakeJugg", "mount_top", 0);
        val::set("fakeJugg", "mount_side", 0);
    }
    scripts\cp_mp\killstreaks\juggernaut::watchjuggernautweaponenduse(juggernautweaponobject, prevweaponobject);
}

// Namespace juggernaut_mp / scripts\mp\killstreaks\juggernaut_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x731
// Size: 0x1e
function jugg_playoperatoruseline(player) {
    level thread scripts\mp\battlechatter_mp::trysaylocalsound(player, #"hash_2492241d17cecd6d");
}

