// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using script_2669878cf5a1b6bc;
#using script_2aabac61f2ae422;

#namespace killstreakDeploy;

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e3
// Size: 0x269
function candeploykillstreak(streakinfo, deployweaponobj, var_818a18147626dfbf) {
    if (!isdefined(var_818a18147626dfbf)) {
        var_818a18147626dfbf = 1;
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (isdefined(level.killstreakrounddelay) && level.killstreakrounddelay > 0) {
            if (isdefined(level.var_5fbdcf40b68612a5)) {
                timepassed = (gettime() - level.var_5fbdcf40b68612a5) / 1000;
                if (timepassed < level.killstreakrounddelay) {
                    var_7edfff77a919e662 = int(level.killstreakrounddelay - timepassed);
                    function_f3bb4f4911a1beb2("hud", "showErrorMessage", "KILLSTREAKS/UNAVAILABLE_FOR_N", var_7edfff77a919e662);
                    return 0;
                }
            }
        }
    } else if (!killstreakcanbeusedatroundstart(streakinfo.streakname)) {
        if (isdefined(level.killstreakrounddelay) && level.killstreakrounddelay > 0) {
            /#
                assertex(level.graceperiod >= level.killstreakrounddelay, "level.gracePeriod: " + level.graceperiod + " must be greater or equal to level.killstreakRoundDelay: " + level.killstreakrounddelay);
            #/
            if (level.graceperiod - level.ingraceperiod < level.killstreakrounddelay) {
                var_d153265565df63da = level.killstreakrounddelay - level.graceperiod - level.ingraceperiod;
                if (issharedfuncdefined("hud", "showErrorMessage")) {
                    self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/UNAVAILABLE_FOR_N", var_d153265565df63da);
                }
                return 0;
            }
        }
    }
    if (isdefined(deployweaponobj)) {
        errormsg = candeploykillstreakweapon(streakinfo, deployweaponobj);
        if (isdefined(errormsg)) {
            if (streakinfo.streakname == "tacticalCamera" || streakinfo.streakname == "loadout_drop") {
                return 0;
            }
            if (iscp() && streakinfo.streakname == "radar_drone_recon") {
                if (issharedfuncdefined("hud", "showErrorMessage") && istrue(var_818a18147626dfbf)) {
                    self [[ getsharedfunc("hud", "showErrorMessage") ]]("MP/CANNOT_USE_GENERIC");
                }
                return 0;
            }
            if (issharedfuncdefined("hud", "showErrorMessage") && istrue(var_818a18147626dfbf)) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]](errormsg);
            }
            return 0;
        }
    }
    return 1;
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc54
// Size: 0x106
function ondeploystart(streakinfo) {
    /#
        assertex(!istrue(streakinfo.isdeploying), "Scripter Error: " + streakinfo.streakname + " trying to deploy while it's already deploying.");
    #/
    streakinfo.isdeploying = 1;
    streakinfo.owner.isdeploying = 1;
    streakinfo.owner setclientomnvar("ui_mobile_killstreak_is_deploying", 1);
    streakinfo.owner thread function_44d17dbe4db72ea9(streakinfo);
    streakinfo.owner val::set("deploy", "crate_use", 0);
    streakinfo.owner val::set("deploy", "ascender_use", 0);
    if (iscp()) {
        streakinfo.owner val::set("deploy", "cp_munitions_pickup", 0);
    }
    if (isdefined(level.var_88e858e641bc0e8e)) {
        thread [[ level.var_88e858e641bc0e8e ]](streakinfo);
    }
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd61
// Size: 0x10a
function ondeployfinished(streakinfo) {
    streakinfo.isdeploying = 0;
    streakinfo.owner.isdeploying = 0;
    streakinfo.owner setclientomnvar("ui_mobile_killstreak_is_deploying", 0);
    streakinfo.owner val::function_c9d0b43701bdba00("deploy");
    if (isdefined(level.var_bcf8ebbb820ae06d)) {
        thread [[ level.var_bcf8ebbb820ae06d ]](streakinfo);
    }
    switch (streakinfo.streakname) {
    case #"hash_413c38e72fe8b5bf":
        if (ismp()) {
            streakinfo.owner setsoundsubmix("jup_mp_kls_gunship", 1);
        }
        break;
    case #"hash_cf0ef5bef19a311b":
        streakinfo.owner setsoundsubmix("jup_global_kls_wheelson", 1);
        break;
    case #"hash_349713b5ad494dda":
        streakinfo.owner setsoundsubmix("jup_global_kls_chopper_gunner", 1);
        break;
    }
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe72
// Size: 0xb
function streakdeploy_cancelalldeployments() {
    self notify("cancel_all_killstreak_deployments");
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe84
// Size: 0xea
function streakdeploy_dogesturedeploy(streakinfo, var_18f6cdab37de78a9) {
    level endon("game_ended");
    self endon("disconnect");
    if (!candeploykillstreak(streakinfo, var_18f6cdab37de78a9)) {
        return 0;
    }
    /#
        assertex(isdefined(var_18f6cdab37de78a9) && var_18f6cdab37de78a9.basename != "none", "Killstreak "" + streakinfo.streakname + "" trying to do gesture deploy, but has invalid gesture weapon");
    #/
    ondeploystart(streakinfo);
    thread watchforcancelduringgesture(streakinfo, var_18f6cdab37de78a9);
    result = function_f19f8b4cf085ecbd(var_18f6cdab37de78a9);
    var_18b31f57647d27fa = var_18f6cdab37de78a9.basename == "ks_gesture_phone_mp";
    if (istrue(result) && istrue(var_18b31f57647d27fa)) {
        function_36e63b8636445465(streakinfo.streakname);
    }
    streakinfo notify("gesture_deploy_ended");
    ondeployfinished(streakinfo);
    if (istrue(self.inlaststand)) {
        thread function_ccc14a44e1811cb1(var_18f6cdab37de78a9);
    }
    return result;
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf76
// Size: 0x40
function watchforcancelduringgesture(streakinfo, var_18f6cdab37de78a9) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    streakinfo endon("gesture_deploy_ended");
    self waittill("cancel_all_killstreak_deployments");
    self takeweapon(var_18f6cdab37de78a9);
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbd
// Size: 0x2a
function function_ccc14a44e1811cb1(var_18f6cdab37de78a9) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self waittill("last_stand_finished");
    self takeweapon(var_18f6cdab37de78a9);
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfee
// Size: 0x3b
function function_44d17dbe4db72ea9(streakinfo) {
    self endon("cancel_all_killstreak_deployments");
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    level endon("game_ended");
    self waittill("death_or_disconnect");
    if (isdefined(self)) {
        self setclientomnvar("ui_mobile_killstreak_is_deploying", 0);
    }
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1030
// Size: 0xdb
function streakdeploy_doweaponswitchdeploy(streakinfo, weaponobj, keepweapon, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b) {
    if (!candeploykillstreak(streakinfo, weaponobj)) {
        return 0;
    }
    ondeploystart(streakinfo);
    /#
        assertex(isdefined(weaponobj) && weaponobj.basename != "none", "Killstreak "" + streakinfo.streakname + "" trying to do a weapon-switch deploy, but has an invalid weapon");
    #/
    var_819c14e9dc86b8c8 = ter_op(istrue(keepweapon), &waituntilfinishedwithdeployweapon, undefined);
    var_41bf9bf4918115ac = switchtodeployweapon(weaponobj, streakinfo, var_819c14e9dc86b8c8, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b);
    if (!istrue(var_41bf9bf4918115ac)) {
        ondeployfinished(streakinfo);
        return 0;
    }
    ondeployfinished(streakinfo);
    return 1;
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1113
// Size: 0x166
function streakdeploy_doweaponfireddeploy(streakinfo, weaponobj, firednotify, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_97ee9768f7229838, var_91f739c2c51347d4, var_d55d8445518099b) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    if (!candeploykillstreak(streakinfo, weaponobj)) {
        return 0;
    }
    ondeploystart(streakinfo);
    /#
        assertex(isdefined(weaponobj) && weaponobj.basename != "none", "Killstreak "" + streakinfo.streakname + "" trying to do a weapon-fired deploy, but has an invalid weapon");
    #/
    var_41bf9bf4918115ac = switchtodeployweapon(weaponobj, streakinfo, &waituntilfinishedwithdeployweapon, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b);
    if (!istrue(var_41bf9bf4918115ac)) {
        ondeployfinished(streakinfo);
        return 0;
    }
    if (isdefined(streakinfo) && isdefined(streakinfo.var_fb58a31c756db4cc)) {
        val::function_3633b947164be4f3(streakinfo.var_fb58a31c756db4cc, 0);
        var_9cf1d5b97d062b8a = watchdeployweaponfired(streakinfo, firednotify, weaponobj, var_97ee9768f7229838);
        val::function_588f2307a3040610(streakinfo.var_fb58a31c756db4cc);
    } else {
        val::set("firedDeploy", "offhand_weapons", 0);
        var_9cf1d5b97d062b8a = watchdeployweaponfired(streakinfo, firednotify, weaponobj, var_97ee9768f7229838);
        val::function_c9d0b43701bdba00("firedDeploy");
    }
    ondeployfinished(streakinfo);
    return istrue(var_9cf1d5b97d062b8a);
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1281
// Size: 0x248
function streakdeploy_doweapontabletdeploy(streakinfo, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b, var_f6a32dcc4b19aad9, var_67a06b4ea269058e, var_afe464c242489272, var_818a18147626dfbf, var_c2a00d4f077ebd87) {
    level endon("game_ended");
    self endon("disconnect");
    var_5c3f9357f11d2223 = "ks_remote_device_mp";
    if (isdefined(var_f6a32dcc4b19aad9)) {
        var_5c3f9357f11d2223 = var_f6a32dcc4b19aad9;
    }
    weaponobj = makeweapon(var_5c3f9357f11d2223);
    deployanim = script_model%vm_ks_tablet_tap_raise;
    var_a5e28eeb501a1341 = 1;
    if (var_5c3f9357f11d2223 == "ks_remote_nuke_mp") {
        deployanim = script_model%vm_ks_tablet_tac_nuke_raise;
        var_a5e28eeb501a1341 = 0;
    } else if (var_5c3f9357f11d2223 == "ks_rcxd_remote_mp") {
        deployanim = script_model%t10_vm_offhand_2h_rcxd_remote_in;
        var_a5e28eeb501a1341 = 0;
    }
    var_cd5c5ac9105ab0d7 = isremotekillstreaktabletweapon(weaponobj.basename);
    var_2ed8c4e06182fd14 = getanimlength(deployanim);
    if (istrue(var_a5e28eeb501a1341)) {
        var_2ed8c4e06182fd14 = var_2ed8c4e06182fd14 - 1;
    }
    if (isdefined(var_afe464c242489272)) {
        var_2ed8c4e06182fd14 = var_afe464c242489272;
    }
    if (!candeploykillstreak(streakinfo, weaponobj, var_818a18147626dfbf)) {
        return 0;
    }
    ondeploystart(streakinfo);
    if (!istrue(var_c2a00d4f077ebd87)) {
        thread streakdeploy_playtabletdeploydialog(streakinfo);
    }
    val::set("streakDeploy", "allow_movement", 0);
    val::set("streakDeploy", "allow_jump", 0);
    val::set("streakDeploy", "usability", 0);
    val::set("streakDeploy", "melee", 0);
    val::set("streakDeploy", "offhand_weapons", 0);
    val::set("streakDeploy", "supers", 0);
    val::set("streakDeploy", "killstreaks", 0);
    var_41bf9bf4918115ac = switchtodeployweapon(weaponobj, streakinfo, &waituntilfinishedwithdeployweapon, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b);
    if (isdefined(self) && _isalive()) {
        val::function_c9d0b43701bdba00("streakDeploy");
        if (var_cd5c5ac9105ab0d7) {
            _freezelookcontrols(0);
        }
    }
    if (!istrue(var_41bf9bf4918115ac)) {
        ondeployfinished(streakinfo);
        return 0;
    }
    var_eabf81b5be8ddb5 = watchdeployweaponanimtransition(streakinfo, var_2ed8c4e06182fd14, var_67a06b4ea269058e);
    ondeployfinished(streakinfo);
    return istrue(var_eabf81b5be8ddb5);
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d1
// Size: 0x58
function streakdeploy_playtabletdeploydialog(streakinfo) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.5);
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
    }
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1530
// Size: 0x136
function streakdeploy_dothrowbackmarkerdeploy(streakinfo, weaponoverride, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_97ee9768f7229838, var_91f739c2c51347d4, var_d55d8445518099b) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    weapon = "throwback_marker_mp";
    if (isdefined(weaponoverride)) {
        weapon = weaponoverride;
    }
    streakinfo.deployweaponobj = makeweapon(weapon);
    weaponobj = streakinfo.deployweaponobj;
    if (!candeploykillstreak(streakinfo, weaponobj)) {
        return 0;
    }
    ondeploystart(streakinfo);
    /#
        assertex(isdefined(weaponobj) && weaponobj.basename != "none", "Killstreak "" + streakinfo.streakname + "" trying to do a weapon-fired deploy, but has an invalid weapon");
    #/
    var_41bf9bf4918115ac = switchtodeployweapon(weaponobj, streakinfo, &waituntilfinishedwithdeployweapon, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b);
    if (!istrue(var_41bf9bf4918115ac)) {
        ondeployfinished(streakinfo);
        return 0;
    }
    var_9cf1d5b97d062b8a = watchdeployweaponfired(streakinfo, "grenade_fire", weaponobj, var_97ee9768f7229838);
    ondeployfinished(streakinfo);
    return istrue(var_9cf1d5b97d062b8a);
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166e
// Size: 0x177
function switchtodeployweapon(deployweaponobj, streakinfo, var_819c14e9dc86b8c8, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b, skipfirstraise) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    if (self hasweapon(deployweaponobj)) {
        return 0;
    }
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (getcompleteweaponname(self getcurrentweapon()) == "iw8_lm_dblmg_mp") {
            self notify("switched_from_minigun");
            while (getcompleteweaponname(self getcurrentweapon()) == "iw8_lm_dblmg_mp") {
                waitframe();
            }
        }
    }
    if (!isdefined(skipfirstraise)) {
        skipfirstraise = 1;
    }
    _giveweapon(deployweaponobj, 0, 0, skipfirstraise);
    var_137e8ca1e47954dc = callweapongivencallback(streakinfo, var_bdffc63c4171c131);
    if (!istrue(var_137e8ca1e47954dc)) {
        _takeweapon(deployweaponobj);
        return 0;
    }
    self dlog_recordplayerevent("dlog_event_killstreak_tablet", [0:"file_line_info", 1:"After switchToDeployWeapon"]);
    thread watchforcancelduringweaponswitch(streakinfo, deployweaponobj);
    thread function_7605a5b4c0a6e117(streakinfo, deployweaponobj);
    var_41bf9bf4918115ac = domonitoredweaponswitch(deployweaponobj, isbot(self, 1), streakinfo.var_9d7c6ee83f507a26);
    streakinfo notify("deploy_weapon_switch_ended");
    if (isdefined(var_8fd4d93dd619da88)) {
        self thread [[ var_8fd4d93dd619da88 ]](streakinfo, var_41bf9bf4918115ac);
    }
    waitframe();
    if (!istrue(var_41bf9bf4918115ac)) {
        var_819c14e9dc86b8c8 = undefined;
    }
    if (!_isalive()) {
        return 0;
    }
    thread cleanupdeployweapon(var_41bf9bf4918115ac, streakinfo, deployweaponobj, var_819c14e9dc86b8c8, var_91f739c2c51347d4, var_d55d8445518099b);
    return var_41bf9bf4918115ac;
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ed
// Size: 0x3d
function callweapongivencallback(streakinfo, var_bdffc63c4171c131) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    self endon("cancel_all_killstreak_deployments");
    if (isdefined(var_bdffc63c4171c131)) {
        return self [[ var_bdffc63c4171c131 ]](streakinfo);
    }
    return 1;
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1832
// Size: 0x4a
function watchforcancelduringweaponswitch(streakinfo, deployweaponobj) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    streakinfo endon("deploy_weapon_switch_ended");
    self waittill("cancel_all_killstreak_deployments");
    if (isswitchingtoweaponwithmonitoring(deployweaponobj)) {
        abortmonitoredweaponswitch(deployweaponobj);
    }
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1883
// Size: 0x94
function function_7605a5b4c0a6e117(streakinfo, deployweaponobj) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    streakinfo endon("deploy_weapon_switch_ended");
    if (streakinfo.streakname == "") {
        self waittill("melee_swipe_start");
    } else {
        waittill_any_2("melee_swipe_start", "br_pickup_scriptable");
    }
    if (isswitchingtoweaponwithmonitoring(deployweaponobj)) {
        abortmonitoredweaponswitch(deployweaponobj);
    } else {
        _takeweapon(deployweaponobj);
        thread domonitoredweaponswitch(self.lastdroppableweaponobj, isbot(self));
    }
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191e
// Size: 0x157
function watchdeployweaponfired(streakinfo, firednotify, var_4ef1099365450bae, var_97ee9768f7229838) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    self endon("weapon_change");
    self endon("cancel_all_killstreak_deployments");
    while (1) {
        var_a9dd4e8c5e5c7178 = undefined;
        var_b663fbbcbb2f5780 = undefined;
        switch (firednotify) {
        case #"hash_21a23ad4b32e4f8e":
            var_a9dd4e8c5e5c7178 = self waittill(firednotify);
            break;
        case #"hash_77f5cb8818a754f0":
            var_a9dd4e8c5e5c7178 = self waittill(firednotify);
            break;
        case #"hash_3989359e2b52d1ba":
            var_a9dd4e8c5e5c7178 = var_b663fbbcbb2f5780 = self waittill(firednotify);
            break;
        default:
            self waittill(firednotify);
            break;
        }
        if (var_a9dd4e8c5e5c7178 == var_4ef1099365450bae) {
            if (isdefined(var_97ee9768f7229838)) {
                var_9cf1d5b97d062b8a = [[ var_97ee9768f7229838 ]](streakinfo, var_a9dd4e8c5e5c7178, var_b663fbbcbb2f5780);
                if (!isdefined(var_9cf1d5b97d062b8a)) {
                    /#
                        assertex(isdefined(var_9cf1d5b97d062b8a), "weaponFiredCallback returned undefined, please make sure it returns success || failure || continue");
                    #/
                    return 0;
                } else if (var_9cf1d5b97d062b8a == "failure") {
                    return 0;
                } else if (var_9cf1d5b97d062b8a == "continue") {
                    if (isdefined(level.killstreakweaponfiredcontinue)) {
                        [[ level.killstreakweaponfiredcontinue ]]();
                    }
                    continue;
                } else if (var_9cf1d5b97d062b8a == "success") {
                    return 1;
                } else {
                    /#
                        assertmsg("weaponFiredCallback returned an unrecognized string value.  Please make sure it returns success || failure || continue");
                    #/
                    return 0;
                }
            }
            return 1;
        }
    }
    return 0;
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a7d
// Size: 0x1ea
function watchdeployweaponanimtransition(streakinfo, animlength, var_67a06b4ea269058e) {
    level endon("game_ended");
    self endon("disconnect");
    if (!isdefined(var_67a06b4ea269058e)) {
        var_67a06b4ea269058e = 1;
    }
    alias = "iw9_ks_tablet_ui_sequence_plr";
    switch (streakinfo.streakname) {
    case #"hash_195360490caa3220":
    case #"hash_de3d319cd367bcba":
        alias = "mp_killstreak_mgb_tablet";
        break;
    }
    self playlocalsound(alias);
    setusingremote(streakinfo.streakname);
    if (issharedfuncdefined("game", "objectiveUnPinPlayer") && isdefined(self.pinnedobjid)) {
        [[ getsharedfunc("game", "objectiveUnPinPlayer") ]](self.pinnedobjid, self);
        self.remoteunpinned = 1;
    }
    _freezecontrols(1, undefined, "killstreakDeploy");
    thread unfreezecontrolsonroundend();
    if (istrue(var_67a06b4ea269058e)) {
        thread startweapontabletfadetransition(animlength - 0.3, streakinfo);
    }
    thread watchweapontabletstop(streakinfo);
    thread watchweapontabletcallinpos(streakinfo);
    starttabletscreen(streakinfo.streakname, 0.05);
    result = waittill_any_timeout_3(animlength, "death", "weapon_change", "cancel_all_killstreak_deployments");
    self notify("ks_freeze_end");
    _freezecontrols(0, undefined, "killstreakDeploy");
    if (!isdefined(result) || result != "timeout" || !self isonground() && !function_d474b372046544b0() && !issubstr(streakinfo.streakname, "nuke") || self isonladder()) {
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        self stoplocalsound("mp_killstreak_tablet_gear");
        stoptabletscreen(streakinfo.streakname);
        self notify("cancel_remote_sequence");
        return 0;
    }
    self notify("deploy_weapon_anim_successful");
    return 1;
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c6f
// Size: 0x27
function unfreezecontrolsonroundend() {
    self endon("disconnect");
    self endon("ks_freeze_end");
    level waittill("round_switch");
    _freezecontrols(0, undefined, "killstreakDeploy");
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c9d
// Size: 0xc3
function private startweapontabletfadetransition(timedelay, streakinfo) {
    self endon("disconnect");
    result = waittill_any_timeout_1(timedelay, "cancel_remote_sequence");
    if (!isdefined(result) || result == "cancel_remote_sequence") {
        return;
    }
    if (_isalive()) {
        if (isdefined(streakinfo) && streakinfo.streakname != "pac_sentry") {
            self playlocalsound("mp_killstreak_transition_whoosh");
        }
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 1, 0.3);
        result = waittill_any_timeout_1(0.7, "death");
        if (!isdefined(result) || result == "death") {
            self stoplocalsound("mp_killstreak_transition_whoosh");
        }
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 0, 0.3);
    }
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d67
// Size: 0xa5
function watchweapontabletstop(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    streakinfo waittill("killstreak_finished_with_deploy_weapon");
    if (isusingremote()) {
        clearusingremote();
    }
    switch (streakinfo.streakname) {
    case #"hash_413c38e72fe8b5bf":
        if (ismp()) {
            self clearsoundsubmix("jup_mp_kls_gunship", 1);
        }
        break;
    case #"hash_cf0ef5bef19a311b":
        self clearsoundsubmix("jup_global_kls_wheelson", 1);
        break;
    case #"hash_349713b5ad494dda":
        self clearsoundsubmix("jup_global_kls_chopper_gunner", 1);
        break;
    }
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e13
// Size: 0xce
function watchweapontabletcallinpos(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("deploy_weapon_anim_successful");
    self endon("cancel_remote_sequence");
    while (1) {
        if (!self isonground()) {
            var_19b9ba70fb85a568 = 1;
            if (function_988138367c74b1f5()) {
                if (ismapselectkillstreak(streakinfo.streakname)) {
                    var_19b9ba70fb85a568 = 0;
                }
            } else if (function_d474b372046544b0()) {
                if (isridekillstreak(streakinfo.streakname) || ismapselectkillstreak(streakinfo.streakname)) {
                    var_19b9ba70fb85a568 = 0;
                }
            } else if (function_d57fb9abf76f9515(streakinfo.streakname)) {
                var_19b9ba70fb85a568 = 0;
            }
            if (istrue(var_19b9ba70fb85a568)) {
                wait(0.05);
                streakdeploy_cancelalldeployments();
                break;
            }
        }
        waitframe();
    }
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ee8
// Size: 0x14
function function_67f13db1409ec06d(streakinfo) {
    waituntilfinishedwithdeployweapon(streakinfo);
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f03
// Size: 0x86
function private waituntilfinishedwithdeployweapon(streakinfo) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    childthread function_2bff7042844c915b(streakinfo, "killstreak_finished_with_deploy_weapon");
    childthread function_2bff7042844c915b(self, "cancel_all_killstreak_deployments");
    childthread function_2bff7042844c915b(self, "weapon_change");
    while (1) {
        result = self waittill("potential_killstreak_deployment_finish");
        if (isdefined(result) && result == "weapon_change") {
            if (isusingremote()) {
                continue;
            }
        }
        break;
    }
    self notify("killstreak_really_finished_with_deploy_weapon");
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f90
// Size: 0x28
function private function_2bff7042844c915b(ent, var_f36c0162774a45fa) {
    self endon("killstreak_really_finished_with_deploy_weapon");
    ent waittill(var_f36c0162774a45fa);
    self notify("potential_killstreak_deployment_finish", var_f36c0162774a45fa);
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fbf
// Size: 0x1b0
function private cleanupdeployweapon(var_41bf9bf4918115ac, streakinfo, weaponobj, var_819c14e9dc86b8c8, var_91f739c2c51347d4, var_d55d8445518099b) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (isdefined(var_819c14e9dc86b8c8)) {
        self [[ var_819c14e9dc86b8c8 ]](streakinfo);
    }
    if (self hasweapon(weaponobj)) {
        var_cd5c5ac9105ab0d7 = isremotekillstreaktabletweapon(weaponobj.basename);
        var_aebf6650a2151847 = ismapselectkillstreak(streakinfo.streakname);
        var_d110628a2924ac08 = isdefined(streakinfo.streakname) && (streakinfo.streakname == "nuke" || streakinfo.streakname == "nuke_multi");
        val::set("deployCleanup", "melee", 0);
        val::set("deployCleanup", "offhand_weapons", 0);
        if (var_cd5c5ac9105ab0d7) {
            val::set("deployCleanup", "mantle", 0);
            val::set("deployCleanup", "allow_movement", 0);
            stoptabletscreen(streakinfo.streakname, 0.5, 1);
            _freezelookcontrols(1);
        } else if (istrue(var_aebf6650a2151847)) {
            val::set("deployCleanup", "mantle", 0);
            if (var_d110628a2924ac08) {
                stoptabletscreen(streakinfo.streakname);
            }
        }
        if (isdefined(var_91f739c2c51347d4)) {
            self [[ var_91f739c2c51347d4 ]](streakinfo, var_41bf9bf4918115ac, weaponobj);
        } else {
            getridofkillstreakdeployweapon(weaponobj);
        }
        val::function_c9d0b43701bdba00("deployCleanup");
        if (var_cd5c5ac9105ab0d7) {
            _freezelookcontrols(0);
        }
    }
    if (isdefined(var_d55d8445518099b)) {
        self [[ var_d55d8445518099b ]](streakinfo);
    }
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2176
// Size: 0x54
function getridofkillstreakdeployweapon(weaponobj) {
    getridofweapon(weaponobj, istrue(self.var_4a2f2f50a9020e2e));
    self.var_4a2f2f50a9020e2e = undefined;
    currentweapon = self getcurrentweapon();
    if (currentweapon.basename == "none") {
        forcevalidweapon();
    }
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21d1
// Size: 0x62
function private function_1a815b06ac8daec6(objweapon) {
    currentweapon = self getcurrentweapon().basename;
    killstreakweapon = objweapon.basename;
    if (isdefined(currentweapon) && function_b752eaae4d806c4c(currentweapon) && isdefined(killstreakweapon) && !function_b752eaae4d806c4c(killstreakweapon)) {
        return 1;
    }
    return 0;
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x223b
// Size: 0x49
function function_b752eaae4d806c4c(currentweapon) {
    switch (currentweapon) {
    case #"hash_1898ea54a0bc6404":
    case #"hash_5fee2c6097070f10":
    case #"hash_879b8ea58093f02c":
    case #"hash_e03f05f611764899":
        return 1;
        break;
    }
    return 0;
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228c
// Size: 0x2bf
function candeploykillstreakweapon(streakinfo, objweapon) {
    if (self getcurrentweapon().basename == "none") {
        waitframe();
    }
    if (!namespace_36f464722d326bbe::isBRStyleGameType() && istrue(level.gameended)) {
        return function_9c92daea59d1e8cf();
    }
    if (isdefined(objweapon) && self hasweapon(objweapon)) {
        return function_9c92daea59d1e8cf();
    }
    if (isdefined(objweapon) && function_1a815b06ac8daec6(objweapon)) {
        return function_9c92daea59d1e8cf();
    }
    if (!val::get("weapon_switch") || !val::get("weapon")) {
        return function_9c92daea59d1e8cf();
    }
    if (isusingremote()) {
        return function_9c92daea59d1e8cf();
    }
    if (istrue(self.oob)) {
        return function_9c92daea59d1e8cf("oob");
    }
    if (streakinfo.streakname == "assault_drone" || streakinfo.streakname == "radar_drone_recon" || streakinfo.streakname == "pac_sentry") {
        if (istrue(self.var_8e2d666b5b0f2bd3)) {
            return function_9c92daea59d1e8cf();
        }
    }
    if (istrue(self.var_5b3c77e2eafab370)) {
        return function_9c92daea59d1e8cf();
    }
    if (self isonladder()) {
        return function_9c92daea59d1e8cf();
    }
    if (self ismantling()) {
        return function_9c92daea59d1e8cf();
    }
    if (function_988138367c74b1f5()) {
        if (isridekillstreak(streakinfo.streakname) || function_3c5423f8416220de(streakinfo.streakname)) {
            return function_9c92daea59d1e8cf("water");
        }
    } else if (function_d474b372046544b0()) {
        if (function_3c5423f8416220de(streakinfo.streakname)) {
            return function_9c92daea59d1e8cf("water");
        }
    }
    if (!self isonground() && !self isswimming()) {
        if (self isparachuting()) {
            return function_9c92daea59d1e8cf();
        }
        if (!function_d57fb9abf76f9515(streakinfo.streakname)) {
            return function_9c92daea59d1e8cf();
        }
    }
    var_833e442b7e050d94 = namespace_e0ee43ef2dddadaa::getgrenadeinpullback();
    if (isdefined(var_833e442b7e050d94) && namespace_49492dacb8708592::issuperweapon(var_833e442b7e050d94)) {
        return function_9c92daea59d1e8cf();
    }
    if (isdefined(level.var_ec09dd198521feea) && level.var_ec09dd198521feea == 1 && isdefined(level.var_55c84262b9114f3c) && array_contains(level.var_55c84262b9114f3c, streakinfo.streakname)) {
        return function_9c92daea59d1e8cf();
    }
    if (isdefined(level.var_ec09dd198521feea) && level.var_ec09dd198521feea == 1 && isdefined(level.var_9fb437a5f1d70130) && array_contains(level.var_9fb437a5f1d70130, streakinfo.streakname)) {
        return "MP/CANNOT_USE_GENERIC";
    }
}

// Namespace killstreakDeploy/namespace_b3d24e921998a8b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2553
// Size: 0x77
function function_9c92daea59d1e8cf(messagetype) {
    if (isdefined(messagetype) && messagetype == "oob") {
        return ter_op(iscp(), "EQUIPMENT/ARMAMENT_CANNOT_BE_USED_OUTOFBOUNDS", "KILLSTREAKS/CANNOT_BE_USED_OUTOFBOUNDS");
    } else if (isdefined(messagetype) && messagetype == "water") {
        return ter_op(iscp(), "EQUIPMENT/ARMAMENT_CANNOT_BE_USED_WATER", "KILLSTREAKS/CANNOT_BE_USED_WATER");
    } else {
        return ter_op(iscp(), "EQUIPMENT/ARMAMENT_CANNOT_BE_USED", "KILLSTREAKS/CANNOT_BE_USED");
    }
}

