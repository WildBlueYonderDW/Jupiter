#using script_2669878cf5a1b6bc;
#using script_2aabac61f2ae422;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\hostmigration;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\utility;

#namespace killstreakdeploy;

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x98a
// Size: 0x268
function candeploykillstreak(streakinfo, deployweaponobj, var_818a18147626dfbf) {
    if (!isdefined(var_818a18147626dfbf)) {
        var_818a18147626dfbf = 1;
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        if (isdefined(level.killstreakrounddelay) && level.killstreakrounddelay > 0) {
            if (isdefined(level.var_5fbdcf40b68612a5)) {
                timepassed = (gettime() - level.var_5fbdcf40b68612a5) / 1000;
                if (timepassed < level.killstreakrounddelay) {
                    var_7edfff77a919e662 = int(level.killstreakrounddelay - timepassed);
                    function_f3bb4f4911a1beb2("hud", "showErrorMessage", "KILLSTREAKS/UNAVAILABLE_FOR_N", var_7edfff77a919e662);
                    return false;
                }
            }
        }
    } else if (!killstreakcanbeusedatroundstart(streakinfo.streakname)) {
        if (isdefined(level.killstreakrounddelay) && level.killstreakrounddelay > 0) {
            assertex(level.graceperiod >= level.killstreakrounddelay, "level.gracePeriod: " + level.graceperiod + " must be greater or equal to level.killstreakRoundDelay: " + level.killstreakrounddelay);
            if (level.graceperiod - level.ingraceperiod < level.killstreakrounddelay) {
                optionalparam = level.killstreakrounddelay - level.graceperiod - level.ingraceperiod;
                if (issharedfuncdefined("hud", "showErrorMessage")) {
                    self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/UNAVAILABLE_FOR_N", optionalparam);
                }
                return false;
            }
        }
    }
    if (isdefined(deployweaponobj)) {
        errormsg = candeploykillstreakweapon(streakinfo, deployweaponobj);
        if (isdefined(errormsg)) {
            if (streakinfo.streakname == "tacticalCamera" || streakinfo.streakname == "loadout_drop") {
                return false;
            }
            if (iscp() && streakinfo.streakname == "radar_drone_recon") {
                if (issharedfuncdefined("hud", "showErrorMessage") && istrue(var_818a18147626dfbf)) {
                    self [[ getsharedfunc("hud", "showErrorMessage") ]]("MP/CANNOT_USE_GENERIC");
                }
                return false;
            }
            if (issharedfuncdefined("hud", "showErrorMessage") && istrue(var_818a18147626dfbf)) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]](errormsg);
            }
            return false;
        }
    }
    return true;
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbfb
// Size: 0x105
function ondeploystart(streakinfo) {
    assertex(!istrue(streakinfo.isdeploying), "Scripter Error: " + streakinfo.streakname + " trying to deploy while it's already deploying.");
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

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd08
// Size: 0x109
function ondeployfinished(streakinfo) {
    streakinfo.isdeploying = 0;
    streakinfo.owner.isdeploying = 0;
    streakinfo.owner setclientomnvar("ui_mobile_killstreak_is_deploying", 0);
    streakinfo.owner val::reset_all("deploy");
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

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe19
// Size: 0xa
function streakdeploy_cancelalldeployments() {
    self notify("cancel_all_killstreak_deployments");
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe2b
// Size: 0xe9
function streakdeploy_dogesturedeploy(streakinfo, gestureweaponobj) {
    level endon("game_ended");
    self endon("disconnect");
    if (!candeploykillstreak(streakinfo, gestureweaponobj)) {
        return 0;
    }
    assertex(isdefined(gestureweaponobj) && gestureweaponobj.basename != "none", "Killstreak \"" + streakinfo.streakname + "\" trying to do gesture deploy, but has invalid gesture weapon");
    ondeploystart(streakinfo);
    thread watchforcancelduringgesture(streakinfo, gestureweaponobj);
    result = giveandfireoffhandreliable(gestureweaponobj);
    phonegesture = gestureweaponobj.basename == "ks_gesture_phone_mp";
    if (istrue(result) && istrue(phonegesture)) {
        function_36e63b8636445465(streakinfo.streakname);
    }
    streakinfo notify("gesture_deploy_ended");
    ondeployfinished(streakinfo);
    if (istrue(self.inlaststand)) {
        thread watchlaststandend(gestureweaponobj);
    }
    return result;
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf1d
// Size: 0x3f
function watchforcancelduringgesture(streakinfo, gestureweaponobj) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    streakinfo endon("gesture_deploy_ended");
    self waittill("cancel_all_killstreak_deployments");
    self takeweapon(gestureweaponobj);
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf64
// Size: 0x29
function watchlaststandend(gestureweaponobj) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self waittill("last_stand_finished");
    self takeweapon(gestureweaponobj);
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf95
// Size: 0x3a
function function_44d17dbe4db72ea9(streakinfo) {
    self endon("cancel_all_killstreak_deployments");
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    level endon("game_ended");
    self waittill("death_or_disconnect");
    if (isdefined(self)) {
        self setclientomnvar("ui_mobile_killstreak_is_deploying", 0);
    }
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xfd7
// Size: 0xda
function streakdeploy_doweaponswitchdeploy(streakinfo, weaponobj, keepweapon, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b) {
    if (!candeploykillstreak(streakinfo, weaponobj)) {
        return false;
    }
    ondeploystart(streakinfo);
    assertex(isdefined(weaponobj) && weaponobj.basename != "none", "Killstreak \"" + streakinfo.streakname + "\" trying to do a weapon-switch deploy, but has an invalid weapon");
    cleanupwaitfunc = ter_op(istrue(keepweapon), &waituntilfinishedwithdeployweapon, undefined);
    switchresult = switchtodeployweapon(weaponobj, streakinfo, cleanupwaitfunc, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b);
    if (!istrue(switchresult)) {
        ondeployfinished(streakinfo);
        return false;
    }
    ondeployfinished(streakinfo);
    return true;
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x10ba
// Size: 0x165
function streakdeploy_doweaponfireddeploy(streakinfo, weaponobj, firednotify, var_bdffc63c4171c131, var_8fd4d93dd619da88, weaponfiredcallback, var_91f739c2c51347d4, var_d55d8445518099b) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    if (!candeploykillstreak(streakinfo, weaponobj)) {
        return false;
    }
    ondeploystart(streakinfo);
    assertex(isdefined(weaponobj) && weaponobj.basename != "none", "Killstreak \"" + streakinfo.streakname + "\" trying to do a weapon-fired deploy, but has an invalid weapon");
    switchresult = switchtodeployweapon(weaponobj, streakinfo, &waituntilfinishedwithdeployweapon, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b);
    if (!istrue(switchresult)) {
        ondeployfinished(streakinfo);
        return false;
    }
    if (isdefined(streakinfo) && isdefined(streakinfo.var_fb58a31c756db4cc)) {
        val::group_set(streakinfo.var_fb58a31c756db4cc, 0);
        firedresult = watchdeployweaponfired(streakinfo, firednotify, weaponobj, weaponfiredcallback);
        val::group_reset(streakinfo.var_fb58a31c756db4cc);
    } else {
        val::set("firedDeploy", "offhand_weapons", 0);
        firedresult = watchdeployweaponfired(streakinfo, firednotify, weaponobj, weaponfiredcallback);
        val::reset_all("firedDeploy");
    }
    ondeployfinished(streakinfo);
    return istrue(firedresult);
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1228
// Size: 0x247
function streakdeploy_doweapontabletdeploy(streakinfo, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b, var_f6a32dcc4b19aad9, var_67a06b4ea269058e, var_afe464c242489272, var_818a18147626dfbf, var_c2a00d4f077ebd87) {
    level endon("game_ended");
    self endon("disconnect");
    weaponbasename = "ks_remote_device_mp";
    if (isdefined(var_f6a32dcc4b19aad9)) {
        weaponbasename = var_f6a32dcc4b19aad9;
    }
    weaponobj = makeweapon(weaponbasename);
    deployanim = script_model%vm_ks_tablet_tap_raise;
    var_a5e28eeb501a1341 = 1;
    if (weaponbasename == "ks_remote_nuke_mp") {
        deployanim = script_model%vm_ks_tablet_tac_nuke_raise;
        var_a5e28eeb501a1341 = 0;
    } else if (weaponbasename == "ks_rcxd_remote_mp") {
        deployanim = script_model%t10_vm_offhand_2h_rcxd_remote_in;
        var_a5e28eeb501a1341 = 0;
    }
    var_cd5c5ac9105ab0d7 = isremotekillstreaktabletweapon(weaponobj.basename);
    var_2ed8c4e06182fd14 = getanimlength(deployanim);
    if (istrue(var_a5e28eeb501a1341)) {
        var_2ed8c4e06182fd14 -= 1;
    }
    if (isdefined(var_afe464c242489272)) {
        var_2ed8c4e06182fd14 = var_afe464c242489272;
    }
    if (!candeploykillstreak(streakinfo, weaponobj, var_818a18147626dfbf)) {
        return false;
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
    switchresult = switchtodeployweapon(weaponobj, streakinfo, &waituntilfinishedwithdeployweapon, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b);
    if (isdefined(self) && _isalive()) {
        val::reset_all("streakDeploy");
        if (var_cd5c5ac9105ab0d7) {
            _freezelookcontrols(0);
        }
    }
    if (!istrue(switchresult)) {
        ondeployfinished(streakinfo);
        return false;
    }
    animresult = watchdeployweaponanimtransition(streakinfo, var_2ed8c4e06182fd14, var_67a06b4ea269058e);
    ondeployfinished(streakinfo);
    return istrue(animresult);
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1478
// Size: 0x57
function streakdeploy_playtabletdeploydialog(streakinfo) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(0.5);
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
    }
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x14d7
// Size: 0x135
function streakdeploy_dothrowbackmarkerdeploy(streakinfo, weaponoverride, var_bdffc63c4171c131, var_8fd4d93dd619da88, weaponfiredcallback, var_91f739c2c51347d4, var_d55d8445518099b) {
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
        return false;
    }
    ondeploystart(streakinfo);
    assertex(isdefined(weaponobj) && weaponobj.basename != "none", "Killstreak \"" + streakinfo.streakname + "\" trying to do a weapon-fired deploy, but has an invalid weapon");
    switchresult = switchtodeployweapon(weaponobj, streakinfo, &waituntilfinishedwithdeployweapon, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b);
    if (!istrue(switchresult)) {
        ondeployfinished(streakinfo);
        return false;
    }
    firedresult = watchdeployweaponfired(streakinfo, "grenade_fire", weaponobj, weaponfiredcallback);
    ondeployfinished(streakinfo);
    return istrue(firedresult);
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x1615
// Size: 0x176
function switchtodeployweapon(deployweaponobj, streakinfo, cleanupwaitfunc, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b, skipfirstraise) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    if (self hasweapon(deployweaponobj)) {
        return 0;
    }
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
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
    self dlog_recordplayerevent("dlog_event_killstreak_tablet", ["file_line_info", "After switchToDeployWeapon"]);
    thread watchforcancelduringweaponswitch(streakinfo, deployweaponobj);
    thread watchformeleeduringweaponswitch(streakinfo, deployweaponobj);
    switchresult = domonitoredweaponswitch(deployweaponobj, isbot(self, 1), streakinfo.var_9d7c6ee83f507a26);
    streakinfo notify("deploy_weapon_switch_ended");
    if (isdefined(var_8fd4d93dd619da88)) {
        self thread [[ var_8fd4d93dd619da88 ]](streakinfo, switchresult);
    }
    waitframe();
    if (!istrue(switchresult)) {
        cleanupwaitfunc = undefined;
    }
    if (!_isalive()) {
        return 0;
    }
    thread cleanupdeployweapon(switchresult, streakinfo, deployweaponobj, cleanupwaitfunc, var_91f739c2c51347d4, var_d55d8445518099b);
    return switchresult;
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1794
// Size: 0x3c
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

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17d9
// Size: 0x49
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

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x182a
// Size: 0x6b
function watchformeleeduringweaponswitch(streakinfo, deployweaponobj) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    streakinfo endon("deploy_weapon_switch_ended");
    self waittill("melee_swipe_start");
    if (isswitchingtoweaponwithmonitoring(deployweaponobj)) {
        abortmonitoredweaponswitch(deployweaponobj);
        return;
    }
    _takeweapon(deployweaponobj);
    thread domonitoredweaponswitch(self.lastdroppableweaponobj, isbot(self));
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x189d
// Size: 0x156
function watchdeployweaponfired(streakinfo, firednotify, var_4ef1099365450bae, weaponfiredcallback) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    self endon("weapon_change");
    self endon("cancel_all_killstreak_deployments");
    while (true) {
        var_a9dd4e8c5e5c7178 = undefined;
        firedprojectile = undefined;
        switch (firednotify) {
        case #"hash_21a23ad4b32e4f8e":
            self waittill(firednotify, var_a9dd4e8c5e5c7178);
            break;
        case #"hash_77f5cb8818a754f0":
            self waittill(firednotify, var_a9dd4e8c5e5c7178);
            break;
        case #"hash_3989359e2b52d1ba":
            self waittill(firednotify, firedprojectile, var_a9dd4e8c5e5c7178);
            break;
        default:
            self waittill(firednotify);
            break;
        }
        if (var_a9dd4e8c5e5c7178 == var_4ef1099365450bae) {
            if (isdefined(weaponfiredcallback)) {
                firedresult = [[ weaponfiredcallback ]](streakinfo, var_a9dd4e8c5e5c7178, firedprojectile);
                if (!isdefined(firedresult)) {
                    assertex(isdefined(firedresult), "weaponFiredCallback returned undefined, please make sure it returns success || failure || continue");
                    return false;
                } else if (firedresult == "failure") {
                    return false;
                } else if (firedresult == "continue") {
                    if (isdefined(level.killstreakweaponfiredcontinue)) {
                        [[ level.killstreakweaponfiredcontinue ]]();
                    }
                    continue;
                } else if (firedresult == "success") {
                    return true;
                } else {
                    assertmsg("weaponFiredCallback returned an unrecognized string value.  Please make sure it returns success || failure || continue");
                    return false;
                }
            }
            return true;
        }
    }
    return false;
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x19fc
// Size: 0x1e9
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
        return false;
    }
    self notify("deploy_weapon_anim_successful");
    return true;
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bee
// Size: 0x26
function unfreezecontrolsonroundend() {
    self endon("disconnect");
    self endon("ks_freeze_end");
    level waittill("round_switch");
    _freezecontrols(0, undefined, "killstreakDeploy");
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1c1c
// Size: 0xc2
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
        level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(self, 1, 0.3);
        result = waittill_any_timeout_1(0.7, "death");
        if (!isdefined(result) || result == "death") {
            self stoplocalsound("mp_killstreak_transition_whoosh");
        }
        level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(self, 0, 0.3);
    }
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ce6
// Size: 0xa4
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

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d92
// Size: 0xcd
function watchweapontabletcallinpos(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("deploy_weapon_anim_successful");
    self endon("cancel_remote_sequence");
    while (true) {
        if (!self isonground()) {
            var_19b9ba70fb85a568 = 1;
            if (isswimmingunderwater()) {
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
                wait 0.05;
                streakdeploy_cancelalldeployments();
                break;
            }
        }
        waitframe();
    }
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e67
// Size: 0x13
function function_67f13db1409ec06d(streakinfo) {
    waituntilfinishedwithdeployweapon(streakinfo);
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1e82
// Size: 0x85
function private waituntilfinishedwithdeployweapon(streakinfo) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    childthread function_2bff7042844c915b(streakinfo, "killstreak_finished_with_deploy_weapon");
    childthread function_2bff7042844c915b(self, "cancel_all_killstreak_deployments");
    childthread function_2bff7042844c915b(self, "weapon_change");
    while (true) {
        self waittill("potential_killstreak_deployment_finish", result);
        if (isdefined(result) && result == "weapon_change") {
            if (isusingremote()) {
                continue;
            }
        }
        break;
    }
    self notify("killstreak_really_finished_with_deploy_weapon");
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1f0f
// Size: 0x27
function private function_2bff7042844c915b(ent, finishednotify) {
    self endon("killstreak_really_finished_with_deploy_weapon");
    ent waittill(finishednotify);
    self notify("potential_killstreak_deployment_finish", finishednotify);
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x1f3e
// Size: 0x1af
function private cleanupdeployweapon(switchresult, streakinfo, weaponobj, cleanupwaitfunc, var_91f739c2c51347d4, var_d55d8445518099b) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (isdefined(cleanupwaitfunc)) {
        self [[ cleanupwaitfunc ]](streakinfo);
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
            self [[ var_91f739c2c51347d4 ]](streakinfo, switchresult, weaponobj);
        } else {
            getridofkillstreakdeployweapon(weaponobj);
        }
        val::reset_all("deployCleanup");
        if (var_cd5c5ac9105ab0d7) {
            _freezelookcontrols(0);
        }
    }
    if (isdefined(var_d55d8445518099b)) {
        self [[ var_d55d8445518099b ]](streakinfo);
    }
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20f5
// Size: 0x53
function getridofkillstreakdeployweapon(weaponobj) {
    getridofweapon(weaponobj, istrue(self.var_4a2f2f50a9020e2e));
    self.var_4a2f2f50a9020e2e = undefined;
    currentweapon = self getcurrentweapon();
    if (currentweapon.basename == "none") {
        forcevalidweapon();
    }
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2150
// Size: 0x61
function private function_a0cee45d6a20e17f(objweapon) {
    currentweapon = self getcurrentweapon().basename;
    killstreakweapon = objweapon.basename;
    if (isdefined(currentweapon) && currentweapon == "deploy_sentry_mp" && isdefined(killstreakweapon) && killstreakweapon != "deploy_sentry_mp") {
        return true;
    }
    return false;
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x21ba
// Size: 0x2a4
function candeploykillstreakweapon(streakinfo, objweapon) {
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype() && istrue(level.gameended)) {
        return function_9c92daea59d1e8cf();
    }
    if (isdefined(objweapon) && self hasweapon(objweapon)) {
        return function_9c92daea59d1e8cf();
    }
    if (isdefined(objweapon) && function_a0cee45d6a20e17f(objweapon)) {
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
    if (isswimmingunderwater()) {
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
    currentgrenade = namespace_e0ee43ef2dddadaa::getgrenadeinpullback();
    if (isdefined(currentgrenade) && namespace_49492dacb8708592::issuperweapon(currentgrenade)) {
        return function_9c92daea59d1e8cf();
    }
    if (isdefined(level.var_ec09dd198521feea) && level.var_ec09dd198521feea == 1 && isdefined(level.var_55c84262b9114f3c) && array_contains(level.var_55c84262b9114f3c, streakinfo.streakname)) {
        return function_9c92daea59d1e8cf();
    }
    if (isdefined(level.var_ec09dd198521feea) && level.var_ec09dd198521feea == 1 && isdefined(level.var_9fb437a5f1d70130) && array_contains(level.var_9fb437a5f1d70130, streakinfo.streakname)) {
        return "MP/CANNOT_USE_GENERIC";
    }
}

// Namespace killstreakdeploy / scripts\cp_mp\killstreaks\killstreakdeploy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2467
// Size: 0x76
function function_9c92daea59d1e8cf(messagetype) {
    if (isdefined(messagetype) && messagetype == "oob") {
        return ter_op(iscp(), "EQUIPMENT/ARMAMENT_CANNOT_BE_USED_OUTOFBOUNDS", "KILLSTREAKS/CANNOT_BE_USED_OUTOFBOUNDS");
    }
    if (isdefined(messagetype) && messagetype == "water") {
        return ter_op(iscp(), "EQUIPMENT/ARMAMENT_CANNOT_BE_USED_WATER", "KILLSTREAKS/CANNOT_BE_USED_WATER");
    }
    return ter_op(iscp(), "EQUIPMENT/ARMAMENT_CANNOT_BE_USED", "KILLSTREAKS/CANNOT_BE_USED");
}

