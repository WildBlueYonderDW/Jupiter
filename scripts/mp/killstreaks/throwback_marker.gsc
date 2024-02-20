// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;

#namespace throwback_marker;

// Namespace throwback_marker/namespace_c88f22851fb1a000
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f
// Size: 0x22
function init() {
    val::function_2d6e7e0b80767910("throwback_marker", [0:"usability", 1:"gesture"]);
}

// Namespace throwback_marker/namespace_c88f22851fb1a000
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x1b8
// Size: 0xed
function throwbackmarker_trythrowbackmarker(streakinfo, var_77cc3b72e7f0d103, weaponoverride, var_58c629ede719bbe8, var_13f3d557b033435d, var_a85466d943bd012d, var_91f739c2c51347d4, var_86356a6d4923a876) {
    var_bdffc63c4171c131 = &throwbackmarker_weapongiven;
    var_8fd4d93dd619da88 = &throwbackmarker_weaponswitchended;
    var_97ee9768f7229838 = &throwbackmarker_weaponfired;
    var_d55d8445518099b = &throwbackmarker_weapontaken;
    streakinfo.throwbackmarker_weapondetonatefunc = var_77cc3b72e7f0d103;
    streakinfo.throwbackmarker_weapongivenfunc = var_58c629ede719bbe8;
    streakinfo.throwbackmarker_weaponswitchendedfunc = var_13f3d557b033435d;
    streakinfo.throwbackmarker_weaponfiredfunc = var_a85466d943bd012d;
    streakinfo.throwbackmarker_weapontakenfunc = var_86356a6d4923a876;
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_dothrowbackmarkerdeploy(streakinfo, weaponoverride, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_97ee9768f7229838, var_91f739c2c51347d4, var_d55d8445518099b);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        return 0;
    }
    return 1;
}

// Namespace throwback_marker/namespace_c88f22851fb1a000
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ad
// Size: 0x3a
function throwbackmarker_weapongiven(streakinfo) {
    var_e9053b0829a68d67 = 1;
    if (isdefined(streakinfo.throwbackmarker_weapongivenfunc)) {
        var_e9053b0829a68d67 = level [[ streakinfo.throwbackmarker_weapongivenfunc ]](streakinfo);
    }
    return var_e9053b0829a68d67;
}

// Namespace throwback_marker/namespace_c88f22851fb1a000
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef
// Size: 0x43
function throwbackmarker_weaponswitchended(streakinfo, var_41bf9bf4918115ac) {
    if (istrue(var_41bf9bf4918115ac)) {
        thread throwbackmarker_watchplayerweapon(streakinfo);
    }
    if (isdefined(streakinfo.throwbackmarker_weaponswitchendedfunc)) {
        level thread [[ streakinfo.throwbackmarker_weaponswitchendedfunc ]](streakinfo, var_41bf9bf4918115ac);
    }
}

// Namespace throwback_marker/namespace_c88f22851fb1a000
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x339
// Size: 0x80
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

// Namespace throwback_marker/namespace_c88f22851fb1a000
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c0
// Size: 0x65
function throwbackmarker_weaponfired(streakinfo, var_a9dd4e8c5e5c7178, var_b663fbbcbb2f5780) {
    var_9cf1d5b97d062b8a = "success";
    level thread throwbackmarker_watchdetonate(streakinfo, var_b663fbbcbb2f5780, self);
    level thread throwbackmarker_watchthrowback(streakinfo, var_b663fbbcbb2f5780);
    if (isdefined(streakinfo.throwbackmarker_weaponfiredfunc)) {
        var_9cf1d5b97d062b8a = [[ streakinfo.throwbackmarker_weaponfiredfunc ]](streakinfo, var_a9dd4e8c5e5c7178, var_b663fbbcbb2f5780);
    }
    return var_9cf1d5b97d062b8a;
}

// Namespace throwback_marker/namespace_c88f22851fb1a000
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d
// Size: 0x5d
function throwbackmarker_watchdetonate(streakinfo, projectile, owner) {
    level endon("game_ended");
    projectile endon("trigger");
    explodepos = projectile waittill("explode");
    if (isdefined(streakinfo.throwbackmarker_weapondetonatefunc)) {
        [[ streakinfo.throwbackmarker_weapondetonatefunc ]](streakinfo, explodepos, owner);
    }
}

// Namespace throwback_marker/namespace_c88f22851fb1a000
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x491
// Size: 0x74
function throwbackmarker_watchthrowback(streakinfo, projectile) {
    projectile endon("fired_off");
    player = projectile waittill("trigger");
    player endon("death_or_disconnect");
    weapon = grenade = player waittill("grenade_fire");
    level thread throwbackmarker_watchdetonate(streakinfo, grenade, player);
    level thread throwbackmarker_watchthrowback(streakinfo, grenade);
    player thread throwbackmarker_takeweapon(weapon);
}

// Namespace throwback_marker/namespace_c88f22851fb1a000
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50c
// Size: 0x51
function throwbackmarker_takeweapon(weapon) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    counter = 0;
    while (counter < 5) {
        if (self hasweapon(weapon)) {
            _takeweapon(weapon);
        } else {
            counter = counter + 1;
        }
        wait(0.05);
    }
}

// Namespace throwback_marker/namespace_c88f22851fb1a000
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x564
// Size: 0x2a
function throwbackmarker_weapontaken(streakinfo) {
    if (isdefined(streakinfo.throwbackmarker_weapontakenfunc)) {
        [[ streakinfo.throwbackmarker_weapontakenfunc ]](streakinfo);
    }
}

