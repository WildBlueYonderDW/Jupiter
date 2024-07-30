#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;

#namespace throwback_marker;

// Namespace throwback_marker / scripts\mp\killstreaks\throwback_marker
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f
// Size: 0x21
function init() {
    val::group_register("throwback_marker", ["usability", "gesture"]);
}

// Namespace throwback_marker / scripts\mp\killstreaks\throwback_marker
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x1b8
// Size: 0xec
function throwbackmarker_trythrowbackmarker(streakinfo, weapondetonatefunc, weaponoverride, var_58c629ede719bbe8, var_13f3d557b033435d, var_a85466d943bd012d, var_91f739c2c51347d4, var_86356a6d4923a876) {
    var_bdffc63c4171c131 = &throwbackmarker_weapongiven;
    var_8fd4d93dd619da88 = &throwbackmarker_weaponswitchended;
    weaponfiredcallback = &throwbackmarker_weaponfired;
    var_d55d8445518099b = &throwbackmarker_weapontaken;
    streakinfo.throwbackmarker_weapondetonatefunc = weapondetonatefunc;
    streakinfo.throwbackmarker_weapongivenfunc = var_58c629ede719bbe8;
    streakinfo.throwbackmarker_weaponswitchendedfunc = var_13f3d557b033435d;
    streakinfo.throwbackmarker_weaponfiredfunc = var_a85466d943bd012d;
    streakinfo.throwbackmarker_weapontakenfunc = var_86356a6d4923a876;
    deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_dothrowbackmarkerdeploy(streakinfo, weaponoverride, var_bdffc63c4171c131, var_8fd4d93dd619da88, weaponfiredcallback, var_91f739c2c51347d4, var_d55d8445518099b);
    if (!istrue(deployresult)) {
        return false;
    }
    return true;
}

// Namespace throwback_marker / scripts\mp\killstreaks\throwback_marker
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ad
// Size: 0x39
function throwbackmarker_weapongiven(streakinfo) {
    var_e9053b0829a68d67 = 1;
    if (isdefined(streakinfo.throwbackmarker_weapongivenfunc)) {
        var_e9053b0829a68d67 = level [[ streakinfo.throwbackmarker_weapongivenfunc ]](streakinfo);
    }
    return var_e9053b0829a68d67;
}

// Namespace throwback_marker / scripts\mp\killstreaks\throwback_marker
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef
// Size: 0x42
function throwbackmarker_weaponswitchended(streakinfo, switchresult) {
    if (istrue(switchresult)) {
        thread throwbackmarker_watchplayerweapon(streakinfo);
    }
    if (isdefined(streakinfo.throwbackmarker_weaponswitchendedfunc)) {
        level thread [[ streakinfo.throwbackmarker_weaponswitchendedfunc ]](streakinfo, switchresult);
    }
}

// Namespace throwback_marker / scripts\mp\killstreaks\throwback_marker
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x339
// Size: 0x7f
function throwbackmarker_watchplayerweapon(streakinfo) {
    self endon("disconnect");
    self notifyonplayercommand("cancel_deploy", "+actionslot 3");
    self notifyonplayercommand("cancel_deploy", "+actionslot 4");
    self notifyonplayercommand("cancel_deploy", "+actionslot 5");
    self notifyonplayercommand("cancel_deploy", "+actionslot 6");
    result = waittill_any_return_2("cancel_deploy", "weapon_switch_started");
    if (!isdefined(result)) {
        return;
    }
    streakinfo notify("killstreak_finished_with_deploy_weapon");
}

// Namespace throwback_marker / scripts\mp\killstreaks\throwback_marker
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c0
// Size: 0x64
function throwbackmarker_weaponfired(streakinfo, var_a9dd4e8c5e5c7178, firedprojectile) {
    firedresult = "success";
    level thread throwbackmarker_watchdetonate(streakinfo, firedprojectile, self);
    level thread throwbackmarker_watchthrowback(streakinfo, firedprojectile);
    if (isdefined(streakinfo.throwbackmarker_weaponfiredfunc)) {
        firedresult = [[ streakinfo.throwbackmarker_weaponfiredfunc ]](streakinfo, var_a9dd4e8c5e5c7178, firedprojectile);
    }
    return firedresult;
}

// Namespace throwback_marker / scripts\mp\killstreaks\throwback_marker
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d
// Size: 0x5c
function throwbackmarker_watchdetonate(streakinfo, projectile, owner) {
    level endon("game_ended");
    projectile endon("trigger");
    explodepos = projectile waittill("explode");
    if (isdefined(streakinfo.throwbackmarker_weapondetonatefunc)) {
        [[ streakinfo.throwbackmarker_weapondetonatefunc ]](streakinfo, explodepos, owner);
    }
}

// Namespace throwback_marker / scripts\mp\killstreaks\throwback_marker
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x491
// Size: 0x73
function throwbackmarker_watchthrowback(streakinfo, projectile) {
    projectile endon("fired_off");
    player = projectile waittill("trigger");
    player endon("death_or_disconnect");
    grenade, weapon = player waittill("grenade_fire");
    level thread throwbackmarker_watchdetonate(streakinfo, grenade, player);
    level thread throwbackmarker_watchthrowback(streakinfo, grenade);
    player thread throwbackmarker_takeweapon(weapon);
}

// Namespace throwback_marker / scripts\mp\killstreaks\throwback_marker
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50c
// Size: 0x50
function throwbackmarker_takeweapon(weapon) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    counter = 0;
    while (counter < 5) {
        if (self hasweapon(weapon)) {
            _takeweapon(weapon);
        } else {
            counter += 1;
        }
        wait 0.05;
    }
}

// Namespace throwback_marker / scripts\mp\killstreaks\throwback_marker
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x564
// Size: 0x29
function throwbackmarker_weapontaken(streakinfo) {
    if (isdefined(streakinfo.throwbackmarker_weapontakenfunc)) {
        [[ streakinfo.throwbackmarker_weapontakenfunc ]](streakinfo);
    }
}

