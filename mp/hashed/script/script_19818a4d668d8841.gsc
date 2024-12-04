#using scripts\common\ae_utility;
#using scripts\common\values;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\killstreaks\airdrop;
#using scripts\cp_mp\killstreaks\killstreakdeploy;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\vehicles\vehicle_tracking;
#using scripts\engine\utility;
#using scripts\mp\battlechatter_mp;
#using scripts\mp\utility\entity;
#using scripts\mp\utility\player;
#using scripts\mp\utility\usability;

#namespace loadout_drop;

// Namespace loadout_drop / namespace_ccba935845e72677
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22d
// Size: 0xd
function function_68300cd2b488ba4d() {
    level.var_59aa0529c1cc5a3b = 1;
}

// Namespace loadout_drop / namespace_ccba935845e72677
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x242
// Size: 0xc
function function_40f1163063c26637() {
    thread function_b1674d8c1e11617f();
    return true;
}

// Namespace loadout_drop / namespace_ccba935845e72677
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x257
// Size: 0x161
function function_b1674d8c1e11617f() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    waitframe();
    streakinfo = createstreakinfo("loadout_drop", self);
    streakinfo.deployweaponobj = makeweapon("deploy_loadout_drop_mp");
    if (isdefined(level.var_27f78817b59dfe32)) {
        streakinfo.var_fb58a31c756db4cc = level.var_27f78817b59dfe32;
    }
    val::set("giveDropWeapon", "killstreaks", 0);
    deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweaponfireddeploy(streakinfo, streakinfo.deployweaponobj, "grenade_fire");
    val::reset_all("giveDropWeapon");
    if (istrue(deployresult)) {
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        level thread scripts\mp\battlechatter_mp::trysaylocalsound(self, #"hash_1fd32a2f783fffc4");
        if (issharedfuncdefined("supers", "superUseFinished")) {
            [[ getsharedfunc("supers", "superUseFinished") ]]();
            scripts\cp_mp\challenges::function_d997435895422ecc("super_loadout_drop", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
        }
        return;
    }
    if (issharedfuncdefined("hud", "showErrorMessage")) {
        self [[ getsharedfunc("hud", "showErrorMessage") ]]("MP/CANNOT_USE_GENERIC");
    }
    if (issharedfuncdefined("supers", "superUseFinished")) {
        [[ getsharedfunc("supers", "superUseFinished") ]](1);
    }
}

// Namespace loadout_drop / namespace_ccba935845e72677
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c0
// Size: 0xa3
function function_4ca6b5feba808692(grenade) {
    level endon("game_ended");
    self endon("disconnect");
    streakinfo = createstreakinfo("loadout_drop", self);
    streakinfo.deployweaponobj = makeweapon("deploy_loadout_drop_mp");
    if (!scripts\cp_mp\vehicles\vehicle_tracking::reservevehicle() || !level.var_59aa0529c1cc5a3b) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        }
        return false;
    }
    thread scripts\cp_mp\killstreaks\airdrop::airdropmarkerfired(streakinfo, streakinfo.deployweaponobj, grenade);
    return true;
}

