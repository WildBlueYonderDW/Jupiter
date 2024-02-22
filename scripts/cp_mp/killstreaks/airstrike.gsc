// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\common\anim.gsc;
#using script_371b4c2ab5861e62;

#namespace airstrike;

// Namespace airstrike/namespace_203b58a09d020a50
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcac
// Size: 0x1c2
function init() {
    if (issharedfuncdefined("airstrike", "init")) {
        [[ getsharedfunc("airstrike", "init") ]]();
    }
    level._effect["airstrike_tracer"] = loadfx("vfx/iw8_mp/killstreak/vfx_a10_tracer_sep.vfx");
    if (issharedfuncdefined("airstrike", "airstrike_params")) {
        [[ getsharedfunc("airstrike", "airstrike_params") ]]();
    }
    init_airstrike_flyby_anims();
    init_airstrike_vo();
    function_bf6596a9c196414c();
    level.activeairstrikes = [];
    level.airstrikecount = 0;
    level.var_4c913e393222c2e1 = getdvarint(@"hash_b17a1f9f7d5c5b0d", 0);
    level.var_53a094cf14067b7d = getdvarint(@"hash_7017001214d170b1", 0);
    level.var_9fc34b4b891723f8 = getdvarint(@"hash_39459995df574c02", 1000);
    level.var_605eaac73a2853d3 = getdvarint(@"hash_77900c1535c539f5", 1);
    level.var_480d0e884a4f8e2a = getdvarint(@"hash_20f5d09c276da17c", 0);
    level.var_b8200908fd2377d3 = getdvarint(@"hash_f6c1cac5da2b9dfb", 0);
    /#
        setdevdvarifuninitialized(@"hash_7daed56d10a79690", 2);
        setdevdvarifuninitialized(@"hash_f6e58fc941b6935d", 0);
        setdevdvarifuninitialized(@"hash_920f0586653a26d4", 0);
        setdevdvarifuninitialized(@"hash_b44b9052042186a2", 0);
    #/
    level.var_15d8e56090c743d = spawnstruct();
    level.var_15d8e56090c743d.var_c3abf3fe46d4ea9b = getmatchrulesdata("commonOption", "showAirstrikeOnMap");
    level.var_15d8e56090c743d.var_3113dc43ef029ff6 = float(getmatchrulesdata("commonOption", "airstrikeZoneVisibleRange"));
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe75
// Size: 0x96
function init_airstrike_flyby_anims() {
    level.scr_animtree["precision_airstrike"] = %script_model;
    level.scr_anim["precision_airstrike"]["airstrike_flyby"] = script_model%mp_alfa10_flyin;
    level.scr_animtree["multi_airstrike"] = %script_model;
    level.scr_anim["multi_airstrike"]["airstrike_flyby"] = script_model%mp_alfa10_flyin;
    level.scr_animtree["fuel_airstrike"] = %script_model;
    level.scr_anim["fuel_airstrike"]["airstrike_flyby"] = script_model%mp_alfa10_flyin;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf12
// Size: 0x99
function init_airstrike_vo() {
    game["dialog"]["precision_airstrike_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["precision_airstrike_hit_target"] = "killstreak_remote_operator" + "_hit_target";
    game["dialog"]["precision_airstrike_miss_target"] = "killstreak_remote_operator" + "_miss_target";
    game["dialog"]["fuel_airstrike_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["fuel_airstrike_hit_target"] = "killstreak_remote_operator" + "_hit_target";
    game["dialog"]["fuel_airstrike_miss_target"] = "killstreak_remote_operator" + "_miss_target";
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb2
// Size: 0x58
function function_bf6596a9c196414c() {
    level.var_2eec46c88075849b = "airstrike_placement";
    val::function_2d6e7e0b80767910(level.var_2eec46c88075849b, [0:"offhand_weapons", 1:"melee", 2:"execution_attack", 3:"weapon_pickup", 4:"supers", 5:"cp_munitions_pickup"]);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1011
// Size: 0x19a
function function_85c69e41428afc7b(var_79710492b71b9e81, var_abd90cc9f0e9501c) {
    if (var_79710492b71b9e81 == "KILLSTREAKS/AIR_SPACE_TOO_CROWDED_TIME") {
        var_aea16e6a3159cbda = undefined;
        foreach (airstrike in level.activeairstrikes) {
            timeleft = int(max(1, airstrike.var_7bf1255a3715a632 + airstrike.timems - gettime()));
            if (!isdefined(var_aea16e6a3159cbda) || timeleft < var_aea16e6a3159cbda) {
                var_aea16e6a3159cbda = timeleft;
            }
        }
        return (int(function_c89ed1840c8d0f0f(var_aea16e6a3159cbda)) + 1);
    } else if (var_79710492b71b9e81 == "KILLSTREAKS/AIR_SPACE_TOO_CROWDED_AREA_TIME") {
        var_aea16e6a3159cbda = undefined;
        foreach (airstrike in level.activeairstrikes) {
            mindistsq = function_35c596ee06dc6da();
            if (distance2dsquared(airstrike.origin, var_abd90cc9f0e9501c) <= mindistsq) {
                timeleft = int(max(1, airstrike.var_7bf1255a3715a632 + airstrike.timems - gettime()));
                if (!isdefined(var_aea16e6a3159cbda) || timeleft < var_aea16e6a3159cbda) {
                    var_aea16e6a3159cbda = timeleft;
                }
            }
        }
        return (int(function_c89ed1840c8d0f0f(var_aea16e6a3159cbda)) + 1);
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b2
// Size: 0x161
function weapongivenairstrike(streakinfo) {
    var_af510588b70f5695 = getdvarint(@"hash_7daed56d10a79690", 2);
    var_79710492b71b9e81 = airstrike_canbeused(self.origin);
    if (var_79710492b71b9e81 != "success") {
        if (istrue(level.var_b8200908fd2377d3)) {
            timesec = function_85c69e41428afc7b(var_79710492b71b9e81, self.origin);
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]](var_79710492b71b9e81, timesec);
            }
        } else if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]](var_79710492b71b9e81);
        }
        return 0;
    }
    if (streakinfo.streakname == "multi_airstrike") {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("airstrike", "startMapSelectSequence")) {
            self [[ namespace_3c37cb17ade254d::getsharedfunc("airstrike", "startMapSelectSequence") ]](0, 1, "long_arrow", undefined, streakinfo);
        }
    } else if (streakinfo.streakname == "fuel_airstrike") {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("airstrike", "startMapSelectSequence")) {
            self [[ namespace_3c37cb17ade254d::getsharedfunc("airstrike", "startMapSelectSequence") ]](undefined, undefined, undefined, undefined, streakinfo);
        }
    }
    self setclientomnvar("ui_using_airstrike", 1);
    return 1;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131b
// Size: 0x7e
function weaponswitchendedairstrike(streakinfo, var_41bf9bf4918115ac) {
    var_af510588b70f5695 = getdvarint(@"hash_7daed56d10a79690", 2);
    if (istrue(var_41bf9bf4918115ac)) {
        if (streakinfo.streakname == "precision_airstrike" || streakinfo.streakname == "bunker_buster") {
            if (var_af510588b70f5695 == 1) {
                self laseron();
            } else if (var_af510588b70f5695 == 2) {
                thread airstrike_watchforads(streakinfo);
            }
        }
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a0
// Size: 0x120
function weaponfiredairstrike(streakinfo, var_a9dd4e8c5e5c7178, var_b663fbbcbb2f5780) {
    self setclientomnvar("ui_using_airstrike", 0);
    if (!isdefined(streakinfo.targetoverride)) {
        var_b21e2e887c161b9 = airstrike_getownerlookatpos(self);
        var_79710492b71b9e81 = airstrike_canbeused(var_b21e2e887c161b9);
        if (var_79710492b71b9e81 != "success") {
            if (istrue(level.var_b8200908fd2377d3)) {
                timesec = function_85c69e41428afc7b(var_79710492b71b9e81, var_b21e2e887c161b9);
                if (issharedfuncdefined("hud", "showErrorMessage")) {
                    self [[ getsharedfunc("hud", "showErrorMessage") ]](var_79710492b71b9e81, timesec);
                }
            } else if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]](var_79710492b71b9e81);
            }
            return "continue";
        }
    }
    if (namespace_5a51aa78ea0b1b9f::is_empd()) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/CANNOT_BE_USED");
        }
        return "continue";
    }
    return "success";
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14c8
// Size: 0x26
function tryuseairstrike(streakname) {
    streakinfo = createstreakinfo(streakname, self);
    return tryuseairstrikefromstruct(streakinfo);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f6
// Size: 0x26b
function tryuseairstrikefromstruct(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    self.var_34119a46e931a5fe = self getcurrentweapon();
    var_9b1deb5e9d32bbe3 = undefined;
    deployweaponobj = level.airstrikesettings[streakinfo.streakname].deployweaponobj;
    var_8b8aae1e320ef000 = "";
    switch (streakinfo.streakname) {
    case #"hash_8c766d6477287bb6":
        if (issharedfuncdefined("game", "getGameType")) {
            gametype = [[ getsharedfunc("game", "getGameType") ]]();
            if (namespace_36f464722d326bbe::isbrstylegametype() && isdefined(self.kstargetlocation)) {
                streakinfo.targetoverride = self.kstargetlocation;
                self.kstargetlocation = undefined;
            }
        }
        if (isdefined(streakinfo.targetoverride)) {
            var_9cf1d5b97d062b8a = weaponfiredairstrike(streakinfo, undefined, undefined);
            var_9b1deb5e9d32bbe3 = var_9cf1d5b97d062b8a == "success";
        } else {
            if (isdefined(level.var_2eec46c88075849b)) {
                streakinfo.var_fb58a31c756db4cc = level.var_2eec46c88075849b;
            }
            var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponfireddeploy(streakinfo, deployweaponobj, "weapon_fired", &weapongivenairstrike, &weaponswitchendedairstrike, &weaponfiredairstrike);
        }
        var_8b8aae1e320ef000 = "precisionAirStrikeUsed";
        break;
    case #"hash_4220be38a5f150b8":
    case #"hash_62810d05099e0103":
        var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponswitchdeploy(streakinfo, deployweaponobj, 1, &weapongivenairstrike, &weaponswitchendedairstrike);
        var_8b8aae1e320ef000 = "fuelAirStrikeUsed";
        break;
    }
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        self setclientomnvar("ui_using_airstrike", 0);
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    var_79710492b71b9e81 = selectairstrikelocation(streakinfo);
    if (!istrue(var_79710492b71b9e81)) {
        return 0;
    }
    if (issharedfuncdefined("airstrike", "munitionUsed")) {
        self [[ getsharedfunc("airstrike", "munitionUsed") ]](streakinfo);
    }
    if (issharedfuncdefined("player", "doOnActionScoreEvent")) {
        self [[ getsharedfunc("player", "doOnActionScoreEvent") ]](2, var_8b8aae1e320ef000);
    }
    return 1;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1769
// Size: 0x495
function selectairstrikelocation(streakinfo) {
    var_b21e2e887c161b9 = (0, 0, 0);
    mappointinfo = undefined;
    var_97195d51c4c2b14e = undefined;
    var_edc5bb5a4b3dd2ff = undefined;
    var_42c1c130fd550100 = spawn("script_origin", self.origin);
    var_f7b6cc6c062a7a43 = "used_" + streakinfo.streakname;
    if (streakinfo.streakname == "precision_airstrike") {
        if (isdefined(streakinfo.targetoverride)) {
            var_b21e2e887c161b9 = streakinfo.targetoverride;
        } else {
            var_b21e2e887c161b9 = airstrike_getownerlookatpos(self, 1);
        }
    } else if (streakinfo.streakname == "multi_airstrike") {
        var_e44616b849d8af48 = 3;
        var_edc5bb5a4b3dd2ff = 1;
        val::set("select_airstrike_location", "weapon_switch", 0);
        self setsoundsubmix("mp_killstreak_overlay");
        mappointinfo = undefined;
        if (namespace_3c37cb17ade254d::issharedfuncdefined("airstrike", "getSelectMapPoint")) {
            mappointinfo = self [[ namespace_3c37cb17ade254d::getsharedfunc("airstrike", "getSelectMapPoint") ]](streakinfo, var_e44616b849d8af48, 1);
        }
        val::function_c9d0b43701bdba00("select_airstrike_location");
    } else if (streakinfo.streakname == "fuel_airstrike") {
        var_e44616b849d8af48 = 3;
        val::set("select_airstrike_location", "weapon_switch", 0);
        self setsoundsubmix("mp_killstreak_overlay");
        mappointinfo = undefined;
        if (namespace_3c37cb17ade254d::issharedfuncdefined("airstrike", "getSelectMapPoint")) {
            mappointinfo = self [[ namespace_3c37cb17ade254d::getsharedfunc("airstrike", "getSelectMapPoint") ]](streakinfo, var_e44616b849d8af48);
        }
        val::function_c9d0b43701bdba00("select_airstrike_location");
    }
    if (isdefined(mappointinfo)) {
        foreach (info in mappointinfo) {
            var_79710492b71b9e81 = airstrike_canbeused(info.location);
            if (var_79710492b71b9e81 != "success") {
                if (istrue(level.var_b8200908fd2377d3)) {
                    timesec = function_85c69e41428afc7b(var_79710492b71b9e81, info.location);
                    if (issharedfuncdefined("hud", "showErrorMessage")) {
                        self [[ getsharedfunc("hud", "showErrorMessage") ]](var_79710492b71b9e81, timesec);
                    }
                } else if (issharedfuncdefined("hud", "showErrorMessage")) {
                    self [[ getsharedfunc("hud", "showErrorMessage") ]](var_79710492b71b9e81);
                }
                return 0;
            }
        }
        thread finishmapselectairstrikeusage(mappointinfo, var_edc5bb5a4b3dd2ff, var_b21e2e887c161b9, var_97195d51c4c2b14e, streakinfo);
        self clearsoundsubmix("mp_killstreak_overlay");
    } else if (!isdefined(mappointinfo) && (streakinfo.streakname == "multi_airstrike" || streakinfo.streakname == "fuel_airstrike")) {
        if (isdefined(var_42c1c130fd550100)) {
            var_42c1c130fd550100 stoploopsound("");
            var_42c1c130fd550100 delete();
        }
        self clearsoundsubmix("mp_killstreak_overlay");
        return 0;
    } else if (streakinfo.streakname == "precision_airstrike") {
        if (!namespace_5a51aa78ea0b1b9f::is_empd()) {
            thread finishstandardairstrikeusage(var_b21e2e887c161b9, var_97195d51c4c2b14e, streakinfo);
        }
    }
    if (isdefined(var_42c1c130fd550100)) {
        var_42c1c130fd550100 stoploopsound("");
        var_42c1c130fd550100 delete();
    }
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    self notify("successful_fire");
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]](var_f7b6cc6c062a7a43, self);
    }
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]](streakinfo.streakname, var_b21e2e887c161b9);
    }
    if (level.var_605eaac73a2853d3 && !istrue(level.var_15d8e56090c743d.var_c3abf3fe46d4ea9b)) {
        killstreak_dangernotifyplayersinrange(self, self.team, level.var_9fc34b4b891723f8, streakinfo.streakname, var_b21e2e887c161b9);
    }
    var_52a5be2e2f91d710 = undefined;
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
        var_52a5be2e2f91d710 = 3;
    }
    thread playkillstreakoperatordialog(streakinfo.streakname, streakinfo.streakname + "_use", 1, var_52a5be2e2f91d710);
    return 1;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c06
// Size: 0x24
function function_b340bcac3e4dda9b(var_9c3226425ee277da, mappointinfo) {
    return mappointinfo.size > 1 && var_9c3226425ee277da < mappointinfo.size - 1;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c32
// Size: 0xa5
function function_ca2efe3da5d8399d(mappointinfo) {
    var_c4d1ca5117f9e7eb = [];
    var_7ba2c5f32045574 = 0;
    foreach (var_9c3226425ee277da, var_470c049a636db53d in mappointinfo) {
        if (function_b340bcac3e4dda9b(var_9c3226425ee277da, mappointinfo)) {
            var_95582c569df51f7b = randomfloatrange(0.8, 1);
            var_7ba2c5f32045574 = var_7ba2c5f32045574 + var_95582c569df51f7b;
            var_c4d1ca5117f9e7eb[var_9c3226425ee277da] = var_95582c569df51f7b;
        }
    }
    return [0:var_7ba2c5f32045574, 1:var_c4d1ca5117f9e7eb];
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cdf
// Size: 0x21e
function finishmapselectairstrikeusage(mappointinfo, var_edc5bb5a4b3dd2ff, var_b21e2e887c161b9, var_97195d51c4c2b14e, streakinfo) {
    self endon("disconnect");
    level endon("game_ended");
    animname = level.scr_anim[streakinfo.streakname]["airstrike_flyby"];
    var_4c4796c182975686 = getanimlength(animname);
    var_7225662d8217d65a = get_notetrack_time(animname, "attack");
    var_b333ee8fea365230 = var_4c4796c182975686 - 5;
    var_57acfdc40b2fba7 = function_ca2efe3da5d8399d(mappointinfo);
    var_c4d1ca5117f9e7eb = var_57acfdc40b2fba7[1];
    var_7ba2c5f32045574 = var_57acfdc40b2fba7[0];
    airstrikeid = airstrike_addactivestrike(self.origin, self, var_b333ee8fea365230 + var_7ba2c5f32045574);
    thread airstrike_watchkills(streakinfo, var_7225662d8217d65a * 2, airstrikeid);
    thread watchairstrikeowner(airstrikeid);
    thread airstrike_watchgameend(streakinfo, airstrikeid);
    foreach (var_9c3226425ee277da, var_470c049a636db53d in mappointinfo) {
        var_b21e2e887c161b9 = var_470c049a636db53d.location;
        directionyaw = self.angles[1];
        if (istrue(var_edc5bb5a4b3dd2ff)) {
            directionyaw = var_470c049a636db53d.angles;
        }
        finishairstrikeusage(var_b21e2e887c161b9, directionyaw, var_97195d51c4c2b14e, streakinfo, animname, airstrikeid);
        if (function_b340bcac3e4dda9b(var_9c3226425ee277da, mappointinfo)) {
            wait(var_c4d1ca5117f9e7eb[var_9c3226425ee277da]);
        }
    }
    level thread function_7893c28cfbf65865(self, airstrikeid, var_b333ee8fea365230);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_4c4796c182975686);
    level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
    if (issharedfuncdefined("player", "printGameAction")) {
        self [[ getsharedfunc("player", "printGameAction") ]]("killstreak ended - " + streakinfo.streakname, self);
    }
    namespace_9abe40d2af041eb2::recordkillstreakendstats(streakinfo);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f04
// Size: 0x166
function finishstandardairstrikeusage(location, var_97195d51c4c2b14e, streakinfo) {
    self endon("disconnect");
    level endon("game_ended");
    animname = level.scr_anim[streakinfo.streakname]["airstrike_flyby"];
    var_4c4796c182975686 = getanimlength(animname);
    var_7225662d8217d65a = get_notetrack_time(animname, "attack");
    var_b333ee8fea365230 = var_4c4796c182975686 - 5;
    airstrikeid = airstrike_addactivestrike(location, self, var_b333ee8fea365230);
    thread airstrike_watchkills(streakinfo, var_7225662d8217d65a * 2, airstrikeid);
    thread watchairstrikeowner(airstrikeid);
    thread airstrike_watchgameend(streakinfo, airstrikeid);
    directionyaw = undefined;
    if (isdefined(streakinfo.var_dd3792a9fb558419)) {
        directionyaw = streakinfo.var_dd3792a9fb558419;
    }
    finishairstrikeusage(location, directionyaw, var_97195d51c4c2b14e, streakinfo, animname, airstrikeid);
    level thread function_7893c28cfbf65865(self, airstrikeid, var_b333ee8fea365230);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_4c4796c182975686);
    level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
    if (issharedfuncdefined("player", "printGameAction")) {
        self [[ getsharedfunc("player", "printGameAction") ]]("killstreak ended - " + streakinfo.streakname, self);
    }
    namespace_9abe40d2af041eb2::recordkillstreakendstats(streakinfo);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2071
// Size: 0x61
function finishairstrikeusage(location, directionyaw, var_97195d51c4c2b14e, streakinfo, animname, airstrikeid) {
    self notify("used");
    self notify("airstrike_used");
    doairstrike(location, directionyaw, self, self.pers["team"], var_97195d51c4c2b14e, streakinfo, animname, airstrikeid);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d9
// Size: 0x62
function doairstrike(origin, yaw, owner, team, var_97195d51c4c2b14e, streakinfo, animname, airstrikeid) {
    /#
        assert(isdefined(origin));
    #/
    level thread callstrike(owner, origin, yaw, var_97195d51c4c2b14e, streakinfo, animname, airstrikeid);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2142
// Size: 0x3c
function watchairstrikeowner(airstrikeid) {
    self endon("airstrike_finished" + "_" + airstrikeid);
    level endon("game_ended");
    waittill_any_2("disconnect", "joined_team");
    airstrike_removeactivestrike(self, airstrikeid);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2185
// Size: 0x460
function callstrike(owner, var_6e7c70b904418daa, yaw, var_97195d51c4c2b14e, streakinfo, animname, airstrikeid) {
    var_361663d437db22f5 = 0;
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    planehalfdistance = 24000;
    var_23122e7b902f2ea9 = 6500;
    planeflyheight = 2500;
    var_361663d437db22f5 = 1500;
    if (isdefined(var_5fa1e1697a302583)) {
        planeflyheight = var_5fa1e1697a302583.origin[2];
    }
    if (isdefined(streakinfo.var_39fda72889c478f5)) {
        planeflyheight = streakinfo.var_39fda72889c478f5;
    } else {
        localeid = namespace_36f464722d326bbe::getlocaleid();
        if (isdefined(localeid) && localeid == "locale_6") {
            planeflyheight = planeflyheight + 500;
        }
        if (namespace_36f464722d326bbe::islargemap()) {
            planeflyheight = planeflyheight + 2500;
        }
        /#
            var_5ceb15b939485b52 = getdvarint(@"hash_698613e6c8c52243", 0);
            planeflyheight = planeflyheight + var_5ceb15b939485b52;
        #/
    }
    var_361663d437db22f5 = getexplodedistance(planeflyheight);
    direction = undefined;
    var_505331ad630bbc6b = undefined;
    if (isdefined(yaw)) {
        direction = (0, yaw, 0);
    } else {
        direction = callstrike_findoptimaldirection(owner, var_6e7c70b904418daa, planeflyheight, planehalfdistance);
        var_505331ad630bbc6b = 1;
    }
    flightpath = getflightpath(var_6e7c70b904418daa, direction, planehalfdistance, var_5fa1e1697a302583, planeflyheight, var_23122e7b902f2ea9, var_361663d437db22f5, streakinfo.streakname, var_505331ad630bbc6b);
    if (streakinfo.streakname == "precision_airstrike") {
        if (!owner namespace_5a51aa78ea0b1b9f::is_empd()) {
            var_294066ed5981c32 = level.var_15d8e56090c743d.var_c3abf3fe46d4ea9b;
            var_d791eb2bdc95eaa2 = spawnstruct();
            if (var_294066ed5981c32) {
                var_94ba470c66e205d7 = getmatchrulesdata("commonOption", "airstrikeZoneSizeMultiplier");
                if (var_94ba470c66e205d7 <= 1) {
                    var_94ba470c66e205d7 = 1;
                }
                flightdir = vectornormalize(flightpath["endPoint"] - flightpath["startPoint"]);
                var_d791eb2bdc95eaa2.owner = owner;
                var_d791eb2bdc95eaa2.damagepos = var_6e7c70b904418daa;
                var_40db97c5db5e1e3e = function_ef2529f22838b027(var_6e7c70b904418daa, flightdir);
                var_d791eb2bdc95eaa2.var_187df114b0f48137 = function_40748f253c758d0c(var_40db97c5db5e1e3e, flightdir, 0, var_94ba470c66e205d7);
                var_d791eb2bdc95eaa2.var_3ca34d5445aa3f3a = function_40748f253c758d0c(var_40db97c5db5e1e3e, flightdir, 1, var_94ba470c66e205d7);
                var_710159b7f6d7c1ca = level.var_15d8e56090c743d.var_3113dc43ef029ff6 * level.var_15d8e56090c743d.var_3113dc43ef029ff6;
                function_f1723305529704a5(owner, airstrikeid, var_40db97c5db5e1e3e, flightdir, streakinfo.streakname);
                /#
                    var_40db1f3c38a29377 = getdvarint(@"hash_de3bb82d99946baf", 0);
                    if (var_40db1f3c38a29377) {
                        var_d791eb2bdc95eaa2.debugcircle = function_40748f253c758d0c(var_6e7c70b904418daa, flightdir, 0, 1);
                        var_d791eb2bdc95eaa2 function_44f4ade288270b27(var_40db97c5db5e1e3e, flightdir);
                    }
                #/
                var_d791eb2bdc95eaa2 thread function_9557f58b574e2c68();
            }
            if (isdefined(level.var_b67b5f9dfe488c2f)) {
                thread [[ level.var_b67b5f9dfe488c2f ]](streakinfo);
            }
            for (i = 0; i < 2; i++) {
                if (!isdefined(streakinfo.var_39fda72889c478f5)) {
                    planeflyheight = planeflyheight + randomintrange(200, 300);
                }
                if (!owner namespace_5a51aa78ea0b1b9f::is_empd()) {
                    level thread doplanestrike(var_6e7c70b904418daa, flightpath["startPoint"], flightpath["endPoint"], planeflyheight, var_97195d51c4c2b14e, streakinfo, animname, owner, airstrikeid);
                }
                var_f16ca92d39cfbeab = namespace_3c37cb17ade254d::ter_op(isdefined(streakinfo.var_e27e4095040fe813), streakinfo.var_e27e4095040fe813, 3);
                wait(var_f16ca92d39cfbeab);
            }
            thread function_8f8818bc20bd6ffa(streakinfo);
            if (var_294066ed5981c32) {
                wait(4);
                var_d791eb2bdc95eaa2 thread function_a889314c31d34692();
            }
        }
    } else if (streakinfo.streakname == "fuel_airstrike") {
        if (!owner namespace_5a51aa78ea0b1b9f::is_empd()) {
            level thread doplanestrike(var_6e7c70b904418daa, flightpath["startPoint"], flightpath["endPoint"], planeflyheight, var_97195d51c4c2b14e, streakinfo, animname, owner, airstrikeid);
        }
    } else {
        level thread doplanestrike(var_6e7c70b904418daa, flightpath["startPoint"], flightpath["endPoint"], planeflyheight, var_97195d51c4c2b14e, streakinfo, animname, owner, airstrikeid);
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25ec
// Size: 0x2a
function function_8f8818bc20bd6ffa(streakinfo) {
    wait(5);
    if (isdefined(level.var_f56a88761038798b)) {
        thread [[ level.var_f56a88761038798b ]](streakinfo);
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x261d
// Size: 0x4b7
function callstrike_findoptimaldirection(owner, var_6e7c70b904418daa, planeflyheight, planehalfdistance, loopcount) {
    var_d77253c873d2b420 = anglestoforward(owner getplayerangles());
    contents = namespace_2a184fc4902783dc::create_default_contents(1);
    trace = namespace_2a184fc4902783dc::ray_trace(var_6e7c70b904418daa - var_d77253c873d2b420 * 30, var_6e7c70b904418daa + var_d77253c873d2b420 * 1000, undefined, contents);
    var_6e7c70b904418daa = trace["position"] + trace["normal"] * 20;
    targetpos = var_6e7c70b904418daa;
    var_359711dd322783ec = planeflyheight;
    ownerforward = anglestoforward(owner.angles);
    var_3c5a1b26c6973c2a = anglestoright(owner.angles);
    var_3ae184241dc44588 = 0;
    var_f74f18c717b149e2 = [0:targetpos + ownerforward * 100, 1:targetpos - ownerforward * 100, 2:targetpos + var_3c5a1b26c6973c2a * 100, 3:targetpos - var_3c5a1b26c6973c2a * 100, 4:targetpos + (ownerforward + var_3c5a1b26c6973c2a) * 100, 5:targetpos + (ownerforward - var_3c5a1b26c6973c2a) * 100, 6:targetpos + (var_3c5a1b26c6973c2a - ownerforward) * 100, 7:targetpos + (-1 * ownerforward - var_3c5a1b26c6973c2a) * 100];
    if (var_6e7c70b904418daa[2] > planeflyheight) {
        var_359711dd322783ec = var_6e7c70b904418daa[2] + planeflyheight - owner.origin[2];
    }
    if (!isdefined(loopcount)) {
        loopcount = 0;
    }
    if (level.var_4c913e393222c2e1) {
        var_d9323f93b3960e7c = vectornormalize(var_f74f18c717b149e2[2] - targetpos);
    } else {
        var_d9323f93b3960e7c = vectornormalize(var_f74f18c717b149e2[0] - targetpos);
    }
    var_e3b1338d5bd4399f = 0;
    var_601da10886b0da3d = 0;
    var_671b9cb2b0e5d795 = getdvarint(@"hash_b44b9052042186a2", 0);
    var_5b36d1353e9a2b32 = 0;
    foreach (var_f9567f37db523f7a in var_f74f18c717b149e2) {
        var_7a7426e42e674e40 = vectornormalize(var_f9567f37db523f7a - targetpos);
        var_c45bbeb56df09b5d = targetpos * (1, 1, 0) + (0, 0, var_359711dd322783ec);
        var_32a961dac02545b0 = var_c45bbeb56df09b5d - var_7a7426e42e674e40 * planehalfdistance;
        var_19189fd85d8a2c19 = var_c45bbeb56df09b5d + var_7a7426e42e674e40 * planehalfdistance;
        traceresult = namespace_2a184fc4902783dc::ray_trace_passed(var_32a961dac02545b0, var_19189fd85d8a2c19, undefined, contents);
        if (!istrue(traceresult)) {
            continue;
        } else {
            var_5b36d1353e9a2b32 = 1;
        }
        /#
            if (istrue(var_671b9cb2b0e5d795)) {
                level thread namespace_f2ffc0540883e1ad::drawline(var_32a961dac02545b0, var_19189fd85d8a2c19, 30, (1, 1, 0));
            }
        #/
        var_48384e792726b96a = var_c45bbeb56df09b5d - var_7a7426e42e674e40 * int(planehalfdistance / 3);
        var_e313995ecad6abbc = [0:targetpos, 1:targetpos - var_7a7426e42e674e40 * 512, 2:targetpos - var_7a7426e42e674e40 * 256, 3:targetpos + var_7a7426e42e674e40 * 256, 4:targetpos + var_7a7426e42e674e40 * 512];
        var_f0c12707e0cbb8d9 = 0;
        foreach (var_27ac9f99fc2e7a9b in var_e313995ecad6abbc) {
            results = namespace_2a184fc4902783dc::ray_trace(var_48384e792726b96a, var_27ac9f99fc2e7a9b, undefined, contents);
            traceresult = results["fraction"] == 1;
            if (level.var_53a094cf14067b7d) {
                if (results["fraction"] > var_601da10886b0da3d) {
                    var_d9323f93b3960e7c = var_7a7426e42e674e40;
                    var_601da10886b0da3d = results["fraction"];
                }
            }
            if (!istrue(traceresult)) {
                /#
                    if (istrue(var_671b9cb2b0e5d795)) {
                        line(var_48384e792726b96a, results["weapon_pickup"], (1, 1, 0), 1, 0, 500);
                        line(results["weapon_pickup"], var_27ac9f99fc2e7a9b, (1, 0, 0), 1, 0, 500);
                    }
                #/
                wait(0.05);
            } else {
                var_f0c12707e0cbb8d9++;
                /#
                    if (istrue(var_671b9cb2b0e5d795)) {
                        line(var_48384e792726b96a, var_27ac9f99fc2e7a9b, (0, 1, 0), 1, 0, 500);
                    }
                #/
                wait(0.05);
            }
        }
        if (var_f0c12707e0cbb8d9 > var_e3b1338d5bd4399f) {
            var_d9323f93b3960e7c = var_7a7426e42e674e40;
            var_e3b1338d5bd4399f = var_f0c12707e0cbb8d9;
            if (var_f0c12707e0cbb8d9 >= 3) {
                break;
            }
        }
    }
    if (!var_5b36d1353e9a2b32 && loopcount < 3) {
        var_d9323f93b3960e7c = callstrike_findoptimaldirection(owner, var_6e7c70b904418daa, planeflyheight + 500, planehalfdistance, loopcount + 1);
    }
    return var_d9323f93b3960e7c;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2adc
// Size: 0x6ed
function doplanestrike(targetsite, var_6d29e82378e59e76, var_98255165b50d8173, planeflyheight, var_97195d51c4c2b14e, streakinfo, animname, owner, airstrikeid) {
    if (!isdefined(owner)) {
        return;
    }
    owner endon("disconnect");
    level endon("game_ended");
    if (streakinfo.streakname != "precision_airstrike" && isdefined(level.var_b67b5f9dfe488c2f)) {
        thread [[ level.var_b67b5f9dfe488c2f ]](streakinfo, targetsite);
    }
    config = level.airstrikesettings[streakinfo.streakname];
    var_4c4796c182975686 = getanimlength(animname);
    var_7b00721e9d1ef2a0 = get_notetrack_time(animname, "attack");
    var_3a69e5fc82079ce3 = targetsite * (1, 1, 0) + (0, 0, planeflyheight);
    var_7789cda8c1e3128e = vectortoangles(var_98255165b50d8173 - var_6d29e82378e59e76);
    planemodel = config.modelbase;
    if (namespace_f8065cafc523dba5::getplayersuperfaction(owner) && isdefined(config.modelbasealt)) {
        planemodel = config.modelbasealt;
    }
    plane = spawn("script_model", var_3a69e5fc82079ce3);
    plane setmodel(planemodel);
    plane.angles = var_7789cda8c1e3128e;
    plane.flightdir = anglestoforward(var_7789cda8c1e3128e);
    plane.flightheight = planeflyheight;
    plane.owner = owner;
    plane.team = owner.team;
    plane.lifeid = streakinfo.lifeid;
    plane.streakinfo = streakinfo;
    plane.airstrikeid = airstrikeid;
    plane setotherent(owner);
    plane scriptmoveroutline();
    plane scriptmoverthermal();
    plane scriptmoverplane();
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        plane [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](streakinfo.streakname, "Killstreak_Air", owner, 0, 1, 100);
    }
    if (issharedfuncdefined("br", "challengeEvaluator")) {
        var_cd37ce775909957b = spawnstruct();
        var_cd37ce775909957b.plane = plane;
        var_cd37ce775909957b.targetsite = targetsite;
        owner [[ getsharedfunc("br", "challengeEvaluator") ]]("br_mastery_pointBlank_airstrike", var_cd37ce775909957b);
    }
    var_9604a2586b0a302c = "hud_icon_minimap_killstreak_airstrike";
    if (streakinfo.streakname == "fuel_airstrike") {
        var_9604a2586b0a302c = "hud_icon_minimap_killstreak_fuel_airstrike";
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "createObjective")) {
        plane.minimapid = plane [[ namespace_3c37cb17ade254d::getsharedfunc("game", "createObjective") ]](var_9604a2586b0a302c, plane.team, undefined, 1, 1);
    }
    var_fafbda0eba9c0aab = var_7b00721e9d1ef2a0 - 0.75;
    var_3a20f9101e50025f = 0.05;
    var_3a020e101e2ddead = var_fafbda0eba9c0aab;
    var_7c39d972e849c204 = 8.596;
    if (streakinfo.streakname == "fuel_airstrike") {
        var_fafbda0eba9c0aab = var_7b00721e9d1ef2a0 + 1;
    }
    var_e4d26f59db05025a = config.var_c80e3ea2a37a7182;
    if (!isdefined(var_e4d26f59db05025a)) {
        var_e4d26f59db05025a = "ks_airstrike_mp";
    }
    plane thread airstrike_delayplayscriptable(0.05);
    level thread airstrike_playplaneattackfx(plane, var_fafbda0eba9c0aab, streakinfo);
    level airstrike_playflyfx(plane, var_e4d26f59db05025a, var_6d29e82378e59e76, anglestoforward(var_7789cda8c1e3128e), var_3a20f9101e50025f, var_3a020e101e2ddead, var_7c39d972e849c204, var_4c4796c182975686, streakinfo);
    plane.bulletpoint = spawn("script_model", plane.origin);
    plane.bulletpoint setmodel("ks_airstrike_target_mp");
    plane.bulletpoint setentityowner(owner);
    plane.bulletpoint.weapon_name = "artillery_mp";
    plane.bulletpoint.streakinfo = streakinfo;
    plane.bulletpoint.angles = plane.angles;
    plane.bulletpoint dontinterpolate();
    plane.animname = streakinfo.streakname;
    plane namespace_bc4a4b9456315863::setanimtree();
    plane.scenenode = spawn("script_model", var_3a69e5fc82079ce3);
    plane.scenenode.angles = plane.angles;
    plane.scenenode setmodel("tag_origin");
    /#
        var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
        if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
            plane thread function_fc41f67ef33c00b0(var_6d29e82378e59e76, var_98255165b50d8173, (1, 1, 1), 20);
            plane thread function_aca0ec4cab6e6319(planeflyheight - targetsite[2], targetsite);
        }
    #/
    if (streakinfo.streakname == "precision_airstrike" || streakinfo.streakname == "multi_airstrike") {
        level thread callstrike_precisionbulleteffect(plane, var_fafbda0eba9c0aab, var_4c4796c182975686, targetsite, owner, streakinfo);
    } else if (streakinfo.streakname == "fuel_airstrike") {
        level thread function_c592aab59a13cf01(plane, var_fafbda0eba9c0aab, var_4c4796c182975686, targetsite, owner, streakinfo);
    }
    plane.scenenode namespace_bc4a4b9456315863::anim_single_solo(plane, "airstrike_flyby");
    if (isdefined(plane.minimapid)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("game", "returnObjectiveID") ]](plane.minimapid);
        }
    }
    plane notify("delete");
    if (isdefined(plane.turrettarget)) {
        plane.turrettarget delete();
    }
    if (isdefined(plane.bulletpoint)) {
        plane.bulletpoint delete();
        if (isdefined(plane.bulletpoint.killcament)) {
            plane.bulletpoint.killcament delete();
        }
    }
    if (isdefined(plane.scenenode)) {
        plane.scenenode delete();
    }
    if (isdefined(plane)) {
        plane delete();
    }
    if (streakinfo.streakname != "precision_airstrike" && isdefined(level.var_f56a88761038798b)) {
        thread [[ level.var_f56a88761038798b ]](streakinfo);
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31d0
// Size: 0x89
function airstrike_playplaneattackfx(plane, var_fafbda0eba9c0aab, streakinfo) {
    plane endon("death");
    level endon("game_ended");
    if (streakinfo.streakname == "fuel_airstrike") {
        return;
    }
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_fafbda0eba9c0aab);
    playsoundatpos(plane.origin, "ks_a10_fire_dist_crack");
    plane setscriptablepartstate("fire", "on", 0);
    plane waittill("fire_finished");
    plane setscriptablepartstate("fire", "off", 0);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3260
// Size: 0xd9
function airstrike_playflyfx(plane, var_e4d26f59db05025a, var_3a69e5fc82079ce3, var_7789cda8c1e3128e, var_3a20f9101e50025f, var_3a020e101e2ddead, var_7c39d972e849c204, var_a9b4b258c1167b50, streakinfo) {
    var_109329e170318954 = spawn("script_model", var_3a69e5fc82079ce3);
    var_109329e170318954 setmodel(var_e4d26f59db05025a);
    var_109329e170318954 dontinterpolate();
    var_109329e170318954 thread airstrike_playapproachfx(var_3a20f9101e50025f);
    var_109329e170318954 thread airstrike_playflybyfx(var_3a020e101e2ddead);
    var_109329e170318954 thread airstrike_playflyoutfx(var_7c39d972e849c204);
    var_109329e170318954 thread airstrike_handleflyoutfxdeath(var_a9b4b258c1167b50);
    var_109329e170318954 thread airstrike_movewithplane(plane);
    /#
        var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
        if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
            level thread testsoundplacement(var_109329e170318954);
        }
    #/
    return var_109329e170318954;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3341
// Size: 0x34
function airstrike_playapproachfx(var_777fc9701bbd592b) {
    self endon("death");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_777fc9701bbd592b);
    self setscriptablepartstate("approach", "on", 0);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x337c
// Size: 0x34
function airstrike_playflybyfx(var_3a020e101e2ddead) {
    self endon("death");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_3a020e101e2ddead);
    self setscriptablepartstate("flyby", "on", 0);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33b7
// Size: 0x34
function airstrike_playflyoutfx(var_7c39d972e849c204) {
    self endon("death");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_7c39d972e849c204);
    self setscriptablepartstate("flyout", "on", 0);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33f2
// Size: 0x2c
function airstrike_handleflyoutfxdeath(var_b5d8ace604fc4b78) {
    self endon("death");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_b5d8ace604fc4b78 + 10);
    self delete();
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3425
// Size: 0x3c
function airstrike_movewithplane(plane) {
    self endon("death");
    level endon("game_ended");
    while (isdefined(plane)) {
        self.origin = plane.origin;
        wait(0.05);
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3468
// Size: 0x123
function airstrike_watchkills(streakinfo, var_c12c14029cc05aca, airstrikeid) {
    self endon("disconnect");
    self notify("airstrike_watch_kills");
    self endon("airstrike_watch_kills");
    var_48ecd34fc60598fe = "airstrike_finished" + "_" + airstrikeid;
    self.airstrikekillcount = 0;
    self.var_3efdaabc0f66846d = 0;
    childthread airstrike_watchkillscount(var_48ecd34fc60598fe);
    childthread function_9fc9871a8c03a9de(var_48ecd34fc60598fe);
    waittill_any_timeout_no_endon_death_1(var_c12c14029cc05aca, var_48ecd34fc60598fe);
    playerskilled = isdefined(self.airstrikekillcount) && self.airstrikekillcount >= 1;
    playersdowned = isdefined(self.var_3efdaabc0f66846d) && self.var_3efdaabc0f66846d >= 1;
    if (playerskilled || playersdowned) {
        playkillstreakoperatordialog(streakinfo.streakname, streakinfo.streakname + "_hit_target", 1);
    } else {
        playkillstreakoperatordialog(streakinfo.streakname, streakinfo.streakname + "_miss_target", 1);
    }
    self.var_3efdaabc0f66846d = undefined;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3592
// Size: 0x5a
function airstrike_watchkillscount(endonnotify) {
    self endon(endonnotify);
    while (1) {
        var_366b0ecc2f28aead = recentkillcount = self waittill("update_rapid_kill_buffered");
        if (isdefined(var_366b0ecc2f28aead) && (var_366b0ecc2f28aead == "artillery_mp" || var_366b0ecc2f28aead == "fuelstrike_proj_mp")) {
            self.airstrikekillcount++;
        }
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35f3
// Size: 0x5a
function function_9fc9871a8c03a9de(endonnotify) {
    self endon(endonnotify);
    while (1) {
        var_366b0ecc2f28aead = recentkillcount = self waittill("update_rapid_agent_kill_buffered");
        if (isdefined(var_366b0ecc2f28aead) && (var_366b0ecc2f28aead == "artillery_mp" || var_366b0ecc2f28aead == "fuelstrike_proj_mp")) {
            self.airstrikekillcount++;
        }
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3654
// Size: 0x47
function testsoundplacement(var_109329e170318954) {
    /#
        var_109329e170318954 endon("long_arrow");
        while (1) {
            sphere(var_109329e170318954.origin, 100, (0, 1, 0), 0, 1);
            wait(0.05);
        }
    #/
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a2
// Size: 0x806
function callstrike_precisionbulleteffect(plane, launchtime, var_1f57bfcfb8ae4433, damagepos, owner, streakinfo) {
    plane endon("death");
    planedir = plane.flightdir;
    var_205f7a849fbb6b3d = damagepos + (0, 0, plane.flightheight + 750);
    var_7440286a44028fba = var_205f7a849fbb6b3d - planedir * 15000;
    var_29893615de503cf5 = var_205f7a849fbb6b3d - planedir * 500;
    var_315162f2d4f72593 = var_205f7a849fbb6b3d;
    var_fe74bc2cc14dfd90 = 0;
    var_b829b1c5b718adf9 = randomintrange(3, 9);
    var_9cb35d6fde2c8bea = randomintrange(var_b829b1c5b718adf9 + 1, 16);
    strafe = [0:var_fe74bc2cc14dfd90, 1:var_b829b1c5b718adf9, 2:var_9cb35d6fde2c8bea];
    var_19fab534e407a4d2 = 0;
    killcament = spawn("script_model", var_7440286a44028fba);
    killcament thread airstrike_killcammove(launchtime - 3, var_29893615de503cf5, var_315162f2d4f72593);
    plane.bulletpoint.killcament = killcament;
    var_c6cda7219900396f = [0:damagepos - planedir * 512, 1:damagepos - planedir * 256, 2:damagepos, 3:damagepos + planedir * 256, 4:damagepos + planedir * 512];
    if (level.var_480d0e884a4f8e2a && !istrue(level.var_15d8e56090c743d.var_c3abf3fe46d4ea9b)) {
        foreach (targetpos in var_c6cda7219900396f) {
            killstreak_dangernotifyplayersinrange(owner, owner.team, level.var_9fc34b4b891723f8, streakinfo.streakname, targetpos);
        }
    }
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(launchtime);
    if (!isdefined(owner)) {
        return;
    }
    repeat = 5;
    hitpos = (0, 0, 0);
    var_65f0f595c2a4dd40 = hitpos;
    var_5a0e75a355cbdadf = 0;
    var_7a48a62d24267eb = 0;
    var_c6cda7219900396f = [0:damagepos - planedir * 512, 1:damagepos - planedir * 256, 2:damagepos, 3:damagepos + planedir * 256, 4:damagepos + planedir * 512];
    /#
        assert(var_c6cda7219900396f.size == 5);
    #/
    foreach (targetpos in var_c6cda7219900396f) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("airstrike", "addSpawnDangerZone")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("airstrike", "addSpawnDangerZone") ]](targetpos, 512, 512, owner.team, 5, owner, 1);
        }
    }
    /#
        var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
        if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
            foreach (pos in var_c6cda7219900396f) {
                sphere(pos, 100, (1, 1, 1), 0, 500);
            }
        }
    #/
    var_7cce0455543aec8e = damagepos[2] + plane.flightheight * 3;
    for (i = 0; i < repeat; i++) {
        if (!isdefined(owner)) {
            break;
        }
        var_d040415a59f1322a = -50;
        var_d0634b5a5a178fe0 = 150;
        while (var_5a0e75a355cbdadf < var_7a48a62d24267eb + 4) {
            var_22468a5a678250bb = callstrike_getrandomshotoffset(var_d040415a59f1322a, var_d0634b5a5a178fe0, var_c6cda7219900396f[i], plane.angles);
            var_ac2b0d64fd58efd4 = plane gettagorigin("tag_turret_fx") * (1, 1, 0) + (0, 0, var_7cce0455543aec8e) + planedir * 1000;
            /#
                var_561d30c3a2ac374 = getdvarint(@"hash_f6e58fc941b6935d", 0);
                if (isdefined(var_561d30c3a2ac374) && var_561d30c3a2ac374 == 1) {
                    var_ac2b0d64fd58efd4 = var_22468a5a678250bb + (0, 0, 10000);
                }
            #/
            var_6a2843f01a3c04b1 = vectornormalize(var_22468a5a678250bb - var_ac2b0d64fd58efd4);
            var_ab6a541aa9a6450d = var_22468a5a678250bb + var_6a2843f01a3c04b1 * 30000;
            var_9dae63dffc7fd8f9 = namespace_2a184fc4902783dc::ray_trace(var_ac2b0d64fd58efd4, var_ab6a541aa9a6450d, undefined, namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 0, 1, 0));
            var_6d5dcb89f6baa8fe = var_9dae63dffc7fd8f9["position"];
            var_6f511097d430526 = var_9dae63dffc7fd8f9["normal"];
            var_e734e756bb8f91c9 = var_6d5dcb89f6baa8fe + var_6f511097d430526 * 10;
            var_9b9958e5c64d5b3 = vectornormalize(var_6d5dcb89f6baa8fe - plane gettagorigin("tag_turret_fx"));
            var_88f727764adfe9a4 = vectorcross(var_9b9958e5c64d5b3, (0, 0, 1));
            var_6721411b32ec4a63 = vectorcross(var_88f727764adfe9a4, var_9b9958e5c64d5b3);
            plane thread callstrike_playmultitracerfx(getfx("airstrike_tracer"), var_e734e756bb8f91c9, var_9b9958e5c64d5b3, var_6721411b32ec4a63);
            if (getdvarint(@"hash_eb0811ead28c4f53", 0)) {
                if (isdefined(var_9dae63dffc7fd8f9["hittype"]) && var_9dae63dffc7fd8f9["hittype"] == "hittype_world" && var_9dae63dffc7fd8f9["position"][2] > 3000) {
                    var_320408384dd779ea = undefined;
                    if (issharedfuncdefined("redeploy_drone", "get_closest_redeploy_drone")) {
                        var_320408384dd779ea = [[ getsharedfunc("redeploy_drone", "get_closest_redeploy_drone") ]](var_9dae63dffc7fd8f9["position"]);
                    }
                    if (isdefined(var_320408384dd779ea) && distancesquared(var_9dae63dffc7fd8f9["position"], var_320408384dd779ea.origin) < squared(150)) {
                        if (issharedfuncdefined("redeploy_drone", "precision_airstrike_death")) {
                            var_320408384dd779ea thread [[ getsharedfunc("redeploy_drone", "precision_airstrike_death") ]](owner);
                        }
                    }
                }
                if (isdefined(var_9dae63dffc7fd8f9["hittype"]) && var_9dae63dffc7fd8f9["hittype"] == "hittype_entity" && isdefined(var_9dae63dffc7fd8f9["entity"]) && isdefined(var_9dae63dffc7fd8f9["entity"].model) && (var_9dae63dffc7fd8f9["entity"].model == "veh9_mil_air_drone_redeploy_relocate" || var_9dae63dffc7fd8f9["entity"].model == "veh9_mil_air_drone_redeploy_relocate_hack")) {
                    if (issharedfuncdefined("redeploy_drone", "precision_airstrike_death")) {
                        var_9dae63dffc7fd8f9["entity"] thread [[ getsharedfunc("redeploy_drone", "precision_airstrike_death") ]](owner);
                    }
                }
            }
            plane.bulletpoint thread moveanddamagepoint(var_5a0e75a355cbdadf + 1, var_e734e756bb8f91c9);
            if (var_19fab534e407a4d2 < strafe.size && var_5a0e75a355cbdadf == strafe[var_19fab534e407a4d2]) {
                plane.bulletpoint thread function_406248674a952273(var_19fab534e407a4d2 + 1, var_e734e756bb8f91c9);
                var_19fab534e407a4d2++;
            }
            var_65f0f595c2a4dd40 = var_6d5dcb89f6baa8fe;
            var_5a0e75a355cbdadf++;
            plane.bulletpoint.streakinfo.shots_fired++;
            var_d040415a59f1322a = var_d040415a59f1322a + 20;
            var_d0634b5a5a178fe0 = var_d0634b5a5a178fe0 + 40;
            var_7cce0455543aec8e = var_7cce0455543aec8e - 200;
            if (var_7cce0455543aec8e < plane.flightheight) {
                var_7cce0455543aec8e = plane.flightheight;
            }
            wait(0.05);
        }
        var_7a48a62d24267eb = var_5a0e75a355cbdadf;
        if (i == 0 && isdefined(level.var_ca1a76fbc0ba0bef)) {
            thread [[ level.var_ca1a76fbc0ba0bef ]](streakinfo, var_65f0f595c2a4dd40, 0);
        }
    }
    plane notify("fire_finished");
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3eaf
// Size: 0xa4
function callstrike_getrandomshotoffset(var_6c88c3b05e813428, var_84d0c5c148da4a7a, originalpos, var_6f680ee249f67b0d) {
    var_6f680ee249f67b0d = var_6f680ee249f67b0d * (0, 1, 0);
    var_4b52f031a2cbef8e = anglestoforward(var_6f680ee249f67b0d);
    var_d8bb89f41ae3d919 = anglestoright(var_6f680ee249f67b0d);
    var_a0a41ba05e16ffe6 = randomintrange(var_6c88c3b05e813428, var_84d0c5c148da4a7a);
    randangle = randomint(80) - 40;
    var_5b91512983a7dbae = var_4b52f031a2cbef8e * cos(randangle) * var_a0a41ba05e16ffe6;
    return originalpos + var_5b91512983a7dbae + var_d8bb89f41ae3d919 * sin(randangle) * var_a0a41ba05e16ffe6;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f5b
// Size: 0x8f
function callstrike_playmultitracerfx(var_b9d4c98aaf1f4ae, tracehit, var_9b9958e5c64d5b3, var_6721411b32ec4a63) {
    self endon("death");
    var_4648b75503218e34 = 0;
    var_684fc496fbbee4d5 = 3;
    while (var_4648b75503218e34 < var_684fc496fbbee4d5) {
        var_6a77f98dc80d2333 = randomintrange(25, 50);
        var_6a77f88dc80d2100 = randomintrange(25, 50);
        playfx(var_b9d4c98aaf1f4ae, tracehit + (var_6a77f98dc80d2333, var_6a77f88dc80d2100, 0), var_9b9958e5c64d5b3, var_6721411b32ec4a63);
        var_4648b75503218e34++;
        wait(0.05);
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ff1
// Size: 0x62
function moveanddamagepoint(index, hitpos) {
    self endon("death");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.18);
    self.origin = hitpos;
    self setscriptablepartstate("explode" + index, "active", 0);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(5);
    self setscriptablepartstate("explode" + index, "neutral", 0);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x405a
// Size: 0x56
function function_406248674a952273(index, hitpos) {
    self endon("death");
    self.origin = hitpos;
    self setscriptablepartstate("strafe" + index, "on", 0);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(5);
    self setscriptablepartstate("strafe" + index, "off", 0);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40b7
// Size: 0x575
function function_c592aab59a13cf01(plane, launchtime, var_1f57bfcfb8ae4433, damagepos, owner, streakinfo) {
    plane endon("death");
    planedir = plane.flightdir;
    var_205f7a849fbb6b3d = damagepos + (0, 0, plane.flightheight + 750);
    var_7440286a44028fba = var_205f7a849fbb6b3d - planedir * 15000;
    var_29893615de503cf5 = var_205f7a849fbb6b3d - planedir * 1000;
    var_315162f2d4f72593 = var_205f7a849fbb6b3d - planedir * 500;
    killcament = spawn("script_model", var_7440286a44028fba);
    killcament thread airstrike_killcammove(launchtime - 3, var_29893615de503cf5, var_315162f2d4f72593);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(launchtime);
    if (!isdefined(owner)) {
        return;
    }
    if (streakinfo.streakname == "fuel_airstrike") {
        if (owner namespace_5a51aa78ea0b1b9f::is_empd()) {
            return;
        }
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("airstrike", "addSpawnDangerZone")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("airstrike", "addSpawnDangerZone") ]](damagepos, 650, 650, owner.team, var_1f57bfcfb8ae4433, owner, 1);
    }
    /#
        var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
        if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
            sphere(damagepos, 100, (1, 1, 1), 0, 500);
        }
    #/
    var_785f5b52f245a2b6 = damagepos + (0, 0, 2500);
    var_bd794eef2b14c4b3 = damagepos - (0, 0, 10000);
    var_3b8c153f4d5d7f16 = namespace_2a184fc4902783dc::ray_trace(var_785f5b52f245a2b6, var_bd794eef2b14c4b3, undefined, namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 0, 1, 0));
    var_604b31efa39e3f47 = var_3b8c153f4d5d7f16["position"];
    var_2c0b75362bf153c5 = var_3b8c153f4d5d7f16["normal"];
    var_4e79f74d11612f28 = var_604b31efa39e3f47 + var_2c0b75362bf153c5 * 10;
    /#
        var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
        if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
            line(var_785f5b52f245a2b6, var_4e79f74d11612f28, (1, 0, 0), 1, 0, 1000);
            line(var_4e79f74d11612f28, var_4e79f74d11612f28 + var_2c0b75362bf153c5 * 50, (0, 1, 0), 1, 0, 500);
            sphere(var_4e79f74d11612f28, 50, (1, 0, 0), 0, 500);
        }
    #/
    var_c6188da3ad302049 = var_4e79f74d11612f28 + (0, 0, 800);
    var_6033a7638fe1342f = spawn("script_model", var_c6188da3ad302049);
    var_6033a7638fe1342f.angles = plane.angles;
    var_6033a7638fe1342f.streakinfo = plane.streakinfo;
    var_6033a7638fe1342f setmodel("ks_fuelstrike_mp");
    var_6033a7638fe1342f setentityowner(owner);
    var_6033a7638fe1342f.killcament = killcament;
    var_f9f79f4923d00e6e = spawn("script_model", var_4e79f74d11612f28);
    var_f9f79f4923d00e6e.angles = plane.angles;
    var_f9f79f4923d00e6e.streakinfo = plane.streakinfo;
    var_f9f79f4923d00e6e setmodel("ks_fuelstrike_mp");
    var_f9f79f4923d00e6e setentityowner(owner);
    var_f9f79f4923d00e6e.killcament = killcament;
    var_f9f79f4923d00e6e setscriptablepartstate("releaseVFX", "on", 0);
    var_6033a7638fe1342f setscriptablepartstate("releaseSFX", "on", 0);
    wait(1.3);
    var_f9f79f4923d00e6e setscriptablepartstate("explode", "on", 0);
    var_b9d5783a4f34efbc = [0:var_6033a7638fe1342f, 1:var_f9f79f4923d00e6e];
    var_33f031d062a32623 = create_contents(0, 1, 1, 1, 0, 1, 1, 1, 0);
    var_3bd841437dfaa8d7 = function_15d7e8b275b8b57b(var_4e79f74d11612f28, 750, owner, var_c6188da3ad302049, var_b9d5783a4f34efbc, var_33f031d062a32623);
    var_60efaa64227a4b55 = function_2a75473ddd0fb33f(var_4e79f74d11612f28, 750, owner, var_c6188da3ad302049, var_b9d5783a4f34efbc, var_33f031d062a32623);
    var_a7340ccd3ad168f9 = makeweapon("fuelstrike_proj_mp");
    var_f7f7bac8e05e89d1 = 0.8;
    plane thread function_e5a6aaaa22532637(var_6033a7638fe1342f, var_f9f79f4923d00e6e, var_f7f7bac8e05e89d1);
    /#
        owner thread function_9018ff93eb75a769(var_f7f7bac8e05e89d1, var_f9f79f4923d00e6e);
    #/
    foreach (enemy in var_3bd841437dfaa8d7) {
        enemy thread function_3c8dfe97ac9ad7c7(owner, var_f7f7bac8e05e89d1, var_6033a7638fe1342f, var_f9f79f4923d00e6e, var_a7340ccd3ad168f9);
        enemy thread function_94e9b969d9359f43(500, var_f9f79f4923d00e6e.origin, owner, var_f9f79f4923d00e6e, "MOD_EXPLOSIVE", var_a7340ccd3ad168f9, var_f7f7bac8e05e89d1);
    }
    foreach (vehicle in var_60efaa64227a4b55) {
        vehicle thread function_94e9b969d9359f43(1000, var_f9f79f4923d00e6e.origin, owner, var_f9f79f4923d00e6e, "MOD_EXPLOSIVE", var_a7340ccd3ad168f9, var_f7f7bac8e05e89d1);
    }
    level thread delaydeletefxents(var_6033a7638fe1342f, var_f9f79f4923d00e6e);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4633
// Size: 0x82
function delaydeletefxents(var_19e3c5251a5f46fa, var_837d24b1c8e8ef79) {
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1);
    var_19e3c5251a5f46fa setscriptablepartstate("releaseSFX", "off", 0);
    var_837d24b1c8e8ef79 setscriptablepartstate("releaseVFX", "off", 0);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1);
    if (isdefined(var_19e3c5251a5f46fa)) {
        var_19e3c5251a5f46fa delete();
    }
    if (isdefined(var_837d24b1c8e8ef79)) {
        if (isdefined(var_837d24b1c8e8ef79.killcament)) {
            var_837d24b1c8e8ef79.killcament delete();
        }
        var_837d24b1c8e8ef79 delete();
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46bc
// Size: 0x15a
function getflightpath(var_6e7c70b904418daa, direction, planehalfdistance, var_5fa1e1697a302583, planeflyheight, var_23122e7b902f2ea9, var_361663d437db22f5, streakname, var_505331ad630bbc6b) {
    directionangles = undefined;
    if (istrue(var_505331ad630bbc6b)) {
        directionangles = direction;
    } else {
        directionangles = anglestoforward(direction);
    }
    startpoint = var_6e7c70b904418daa + directionangles * -1 * planehalfdistance;
    if (isdefined(var_5fa1e1697a302583)) {
        startpoint = startpoint * (1, 1, 0);
    }
    startpoint = startpoint + (0, 0, planeflyheight);
    endpoint = var_6e7c70b904418daa + directionangles * planehalfdistance;
    if (isdefined(var_5fa1e1697a302583)) {
        endpoint = endpoint * (1, 1, 0);
    }
    endpoint = endpoint + (0, 0, planeflyheight);
    d = length(startpoint - endpoint);
    flytime = d / var_23122e7b902f2ea9;
    d = abs(d / 2 + var_361663d437db22f5);
    bombtime = d / var_23122e7b902f2ea9;
    /#
        assert(flytime > bombtime);
    #/
    flightpath["startPoint"] = startpoint;
    flightpath["endPoint"] = endpoint;
    flightpath["bombTime"] = bombtime;
    flightpath["flyTime"] = flytime;
    flightpath["directionAngles"] = directionangles;
    return flightpath;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x481e
// Size: 0x45
function getexplodedistance(height) {
    var_e5dc9ecdad877027 = 850;
    var_17bca7ab954cc95f = 1500;
    var_3369989e4aab456a = var_e5dc9ecdad877027 / height;
    var_1003b817e555135a = var_3369989e4aab456a * var_17bca7ab954cc95f;
    return var_1003b817e555135a;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x486b
// Size: 0xf7
function function_aca0ec4cab6e6319(planeflyheight, targetsite) {
    /#
        self endon("long_arrow");
        level endon("disconnect");
        while (1) {
            if (getdvarint(@"hash_920f0586653a26d4") == 0) {
                return;
            }
            var_379097055795a272 = anglestoforward(level.players[0].angles);
            scalar = (var_379097055795a272[0] * 300, var_379097055795a272[1] * 300, var_379097055795a272[2]);
            print3d(level.players[0].origin + scalar, "killstreak_finished_with_deploy_weapon" + planeflyheight, (1, 0, 0));
            print3d(level.players[0].origin + scalar - (0, 0, 20), "airstrike_used" + distance2d(targetsite, self.origin));
            waitframe();
        }
    #/
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4969
// Size: 0x5d
function function_fc41f67ef33c00b0(start, end, color, duration) {
    /#
        frames = duration * 20;
        for (i = 0; i < frames; i++) {
            line(start, end, color);
            wait(0.05);
        }
    #/
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49cd
// Size: 0x124
function airstrike_getownerlookatpos(owner, var_bd5b999689421cc7) {
    content = [0:"physicscontents_water", 1:"physicscontents_clipshot", 2:"physicscontents_missileclip", 3:"physicscontents_vehicle", 4:"physicscontents_characterproxy"];
    contentoverride = physics_createcontents(content);
    starttrace = owner getvieworigin();
    endtrace = starttrace + anglestoforward(owner getplayerangles()) * 50000;
    ignoreents = owner playerkillstreakgetownerlookatignoreents();
    trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, ignoreents, contentoverride);
    endpos = trace["position"];
    /#
        if (istrue(var_bd5b999689421cc7)) {
            var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
            if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
                sphere(endpos, 50, (0, 1, 0), 0, 500);
            }
        }
    #/
    if (trace["hittype"] == "hittype_none") {
        endpos = undefined;
    }
    return endpos;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4af9
// Size: 0x350
function airstrike_watchforads(streakinfo, var_a6b4dbdd89bbbb24) {
    self endon("death_or_disconnect");
    self endon("deploy_cancelled");
    self endon("deploy_fired");
    var_e7ca95fe87ccfd0 = spawn("script_model", self.origin);
    var_e7ca95fe87ccfd0 setmodel("ks_airstrike_marker_mp");
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "requestObjectiveID")) {
        var_e7ca95fe87ccfd0.objidnum = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "requestObjectiveID") ]](99);
    }
    var_e7ca95fe87ccfd0 setotherent(self);
    var_e7ca95fe87ccfd0 dontinterpolate();
    var_e7ca95fe87ccfd0 hide();
    var_a465314411ea4812 = "icon_waypoint_airstrike";
    if (isdefined(var_a6b4dbdd89bbbb24)) {
        var_a465314411ea4812 = var_a6b4dbdd89bbbb24;
    }
    var_e7ca95fe87ccfd0 airstrike_setmarkerobjective(var_e7ca95fe87ccfd0.objidnum, var_a465314411ea4812, self, 50);
    var_e7ca95fe87ccfd0 thread airstrike_watchownerdisown(self);
    var_e7ca95fe87ccfd0 thread airstrike_watchdeployended(self);
    var_e7ca95fe87ccfd0 thread airstrike_watchdeployweaponchange(self);
    var_e7ca95fe87ccfd0.updatemarker = 0;
    val::set("ads_watcher", "fire", 0);
    while (1) {
        if (namespace_5a51aa78ea0b1b9f::is_empd()) {
            if (streakinfo.streakname == "precision_airstrike" || streakinfo.streakname == "bunker_buster") {
                previousweapon = self.var_34119a46e931a5fe;
                _switchtoweapon(previousweapon);
                val::set("ads_watcher", "fire", 0);
                var_e7ca95fe87ccfd0 hide();
                var_e7ca95fe87ccfd0 setscriptablepartstate("marker_scope", "off", 0);
                self notify("stop_update_marker");
                var_e7ca95fe87ccfd0.updatemarker = 0;
            }
            if (streakinfo.streakname == "fuel_airstrike") {
                previousweapon = self.var_34119a46e931a5fe;
                _switchtoweapon(previousweapon);
                val::set("ads_watcher", "fire", 0);
                var_e7ca95fe87ccfd0 hide();
                var_e7ca95fe87ccfd0 setscriptablepartstate("marker_scope", "off", 0);
                self notify("stop_update_marker");
                var_e7ca95fe87ccfd0.updatemarker = 0;
            }
        }
        if (namespace_5a51aa78ea0b1b9f::is_empd() && istrue(var_e7ca95fe87ccfd0.updatemarker)) {
            if (streakinfo.streakname != "precision_airstrike" && streakinfo.streakname != "bunker_buster") {
                val::set("ads_watcher", "fire", 0);
                var_e7ca95fe87ccfd0 hide();
                var_e7ca95fe87ccfd0 setscriptablepartstate("marker_scope", "off", 0);
                self notify("stop_update_marker");
                var_e7ca95fe87ccfd0.updatemarker = 0;
            }
        }
        playerads = self playerads();
        if (playerads == 1 && !istrue(var_e7ca95fe87ccfd0.updatemarker)) {
            if (!namespace_5a51aa78ea0b1b9f::is_empd()) {
                val::function_c9d0b43701bdba00("ads_watcher");
                var_e7ca95fe87ccfd0 show();
                var_e7ca95fe87ccfd0 setscriptablepartstate("marker_scope", "on", 0);
                var_e7ca95fe87ccfd0 thread airstrike_updatemarkerpos(self);
                var_e7ca95fe87ccfd0.updatemarker = 1;
            }
        } else if (playerads < 1 && istrue(var_e7ca95fe87ccfd0.updatemarker)) {
            val::set("ads_watcher", "fire", 0);
            var_e7ca95fe87ccfd0 hide();
            var_e7ca95fe87ccfd0 setscriptablepartstate("marker_scope", "off", 0);
            self notify("stop_update_marker");
            var_e7ca95fe87ccfd0.updatemarker = 0;
        }
        waitframe();
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e50
// Size: 0x99
function airstrike_setmarkerobjective(objid, icon, owner, offset) {
    objective_icon(objid, icon);
    objective_showtoplayersinmask(objid);
    objective_addclienttomask(objid, owner);
    objective_onentity(objid, self);
    objective_setzoffset(objid, offset);
    objective_setplayintro(objid, 0);
    objective_setplayoutro(objid, 0);
    objective_setbackground(objid, 1);
    if (level.teambased) {
        objective_setownerteam(objid, owner.team);
    } else {
        objective_setownerclient(objid, owner);
    }
    objective_state(objid, "done");
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ef0
// Size: 0x163
function airstrike_updatemarkerpos(owner) {
    self endon("death");
    owner endon("deploy_cancelled");
    owner endon("deploy_fired");
    owner endon("stop_update_marker");
    owner endon("death_or_disconnect");
    var_aed614516c33f816 = 0;
    owner setclientomnvar("ui_spotter_scope_danger", 0);
    while (1) {
        var_206991a4f6971fd8 = airstrike_getownerlookatpos(owner);
        xpos = -1;
        ypos = -1;
        var_689a1188271a0be5 = -1;
        if (isdefined(var_206991a4f6971fd8)) {
            self.origin = var_206991a4f6971fd8;
            xpos = int(self.origin[0]);
            ypos = int(self.origin[1]);
            var_689a1188271a0be5 = int(self.origin[2]);
        }
        owner setclientomnvar("ui_gunship_coord3_posx", xpos);
        owner setclientomnvar("ui_gunship_coord3_posy", ypos);
        owner setclientomnvar("ui_gunship_coord3_posz", var_689a1188271a0be5);
        if (isdefined(var_206991a4f6971fd8)) {
            if (!istrue(var_aed614516c33f816) && distance2dsquared(owner.origin, var_206991a4f6971fd8) <= 1638400) {
                owner setclientomnvar("ui_spotter_scope_danger", 1);
                var_aed614516c33f816 = 1;
            } else if (istrue(var_aed614516c33f816) && distance2dsquared(owner.origin, var_206991a4f6971fd8) > 1638400) {
                owner setclientomnvar("ui_spotter_scope_danger", 0);
                var_aed614516c33f816 = 0;
            }
        }
        waitframe();
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x505a
// Size: 0x29
function airstrike_watchownerdisown(owner) {
    self endon("death");
    level endon("game_ended");
    owner waittill("death_or_disconnect");
    airstrike_removemarker();
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x508a
// Size: 0x175
function airstrike_watchdeployended(owner) {
    owner endon("death_or_disconnect");
    self endon("death");
    level endon("game_ended");
    var_9b1deb5e9d32bbe3 = owner waittill_any_return_2("cancel_fire", "successful_fire");
    if (isdefined(var_9b1deb5e9d32bbe3) && var_9b1deb5e9d32bbe3 == "successful_fire") {
        owner notify("deploy_fired");
        owner playlocalsound("kls_location_select");
        self setscriptablepartstate("marker_scope", "off", 0);
        var_95da95f2e9954514 = anglestoforward(owner getplayerangles());
        starttrace = self.origin - var_95da95f2e9954514 * 500;
        endtrace = self.origin + var_95da95f2e9954514 * 20;
        trace = ray_trace(starttrace, endtrace, self);
        surfacenormal = trace["normal"];
        self.angles = generateaxisanglesfromupvector(surfacenormal, self.angles);
        self setscriptablepartstate("marker_placed", "on", 0);
        objective_state(self.objidnum, "current");
        thread airstrike_removemarker(7);
    } else {
        owner setclientomnvar("ui_using_airstrike", 0);
        owner notify("deploy_cancelled");
        if (!owner [[ getsharedfunc("player", "isPlayerADS") ]]()) {
            owner val::function_c9d0b43701bdba00("ads_watcher");
        }
        airstrike_removemarker();
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5206
// Size: 0x51
function airstrike_watchdeployweaponchange(owner) {
    owner endon("death_or_disconnect");
    self endon("death");
    level endon("game_ended");
    var_8acef5c729bd9628 = owner getcurrentweapon();
    while (1) {
        if (owner getcurrentweapon() != var_8acef5c729bd9628) {
            break;
        }
        waitframe();
    }
    owner notify("cancel_fire");
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x525e
// Size: 0x6a
function airstrike_removemarker(delaytime) {
    if (isdefined(delaytime)) {
        self endon("death");
        level endon("game_ended");
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    }
    if (isdefined(self.objidnum)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("game", "returnObjectiveID") ]](self.objidnum);
        }
    }
    self delete();
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52cf
// Size: 0x2e
function airstrike_delayplayscriptable(delaytime) {
    self endon("death");
    level endon("game_ended");
    wait(delaytime);
    self setscriptablepartstate("bodyfx", "on", 0);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5304
// Size: 0x4b
function airstrike_killcammove(delaytime, var_29893615de503cf5, var_315162f2d4f72593) {
    self endon("death");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    self moveto(var_29893615de503cf5, 4);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(3.95);
    self moveto(var_315162f2d4f72593, 5);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5356
// Size: 0x3a
function airstrike_watchgameend(streakinfo, airstrikeid) {
    self endon("airstrike_finished" + "_" + airstrikeid);
    self endon("disconnect");
    level waittill("game_ended");
    namespace_9abe40d2af041eb2::recordkillstreakendstats(streakinfo);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5397
// Size: 0xe2
function airstrike_addactivestrike(origin, owner, timesec) {
    level.airstrikecount++;
    var_e2f8f2ae67b84927 = spawnstruct();
    var_e2f8f2ae67b84927.origin = origin;
    var_e2f8f2ae67b84927.owner = owner;
    if (isplayer(owner)) {
        id = owner getxuid();
    } else {
        id = abs(owner.origin[0]);
    }
    var_e2f8f2ae67b84927.id = id + "_" + level.airstrikecount;
    var_e2f8f2ae67b84927.var_7bf1255a3715a632 = gettime();
    var_e2f8f2ae67b84927.timems = timesec * 1000;
    level.activeairstrikes[var_e2f8f2ae67b84927.id] = var_e2f8f2ae67b84927;
    return var_e2f8f2ae67b84927.id;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5481
// Size: 0x44
function airstrike_removeactivestrike(owner, var_4d39391d6ef2bb65) {
    level.activeairstrikes = array_remove_index(level.activeairstrikes, var_4d39391d6ef2bb65, 1);
    if (isdefined(owner)) {
        owner notify("airstrike_finished" + "_" + var_4d39391d6ef2bb65);
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54cc
// Size: 0x2e
function function_7893c28cfbf65865(owner, airstrikeid, delaytime) {
    level endon("game_ended");
    wait(delaytime);
    airstrike_removeactivestrike(owner, airstrikeid);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5501
// Size: 0x30
function function_35c596ee06dc6da() {
    mindistsq = 625000000;
    /#
        if (level.mapname == "fraction") {
            mindistsq = 1000000;
        }
    #/
    return mindistsq;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5539
// Size: 0x126
function airstrike_canbeused(var_abd90cc9f0e9501c) {
    var_79710492b71b9e81 = "success";
    mindistsq = function_35c596ee06dc6da();
    if (isdefined(var_abd90cc9f0e9501c)) {
        if (level.activeairstrikes.size > 0) {
            var_28f0d2ad91ee22dc = 1;
            var_d937d9fbfeed2e24 = namespace_36f464722d326bbe::isbrstylegametype();
            if (var_d937d9fbfeed2e24) {
                var_28f0d2ad91ee22dc = 3;
            }
            if (level.activeairstrikes.size >= var_28f0d2ad91ee22dc) {
                if (istrue(level.var_b8200908fd2377d3)) {
                    var_79710492b71b9e81 = "KILLSTREAKS/AIR_SPACE_TOO_CROWDED_TIME";
                } else {
                    var_79710492b71b9e81 = "KILLSTREAKS/AIR_SPACE_TOO_CROWDED";
                }
            } else {
                foreach (var_d97d35b4adfa29f9 in level.activeairstrikes) {
                    if (distance2dsquared(var_d97d35b4adfa29f9.origin, var_abd90cc9f0e9501c) <= mindistsq) {
                        if (istrue(level.var_b8200908fd2377d3)) {
                            var_79710492b71b9e81 = "KILLSTREAKS/AIR_SPACE_TOO_CROWDED_AREA_TIME";
                        } else {
                            var_79710492b71b9e81 = "KILLSTREAKS/AIR_SPACE_TOO_CROWDED_AREA";
                        }
                    }
                }
            }
        }
    } else {
        var_79710492b71b9e81 = "KILLSTREAKS/INVALID_POINT";
    }
    return var_79710492b71b9e81;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5667
// Size: 0xd0
function callprecisionairstrikeonlocation(location) {
    player = self;
    streakinfo = spawnstruct();
    streakinfo.streakname = "precision_airstrike";
    streakinfo.owner = player;
    streakinfo.score = 0;
    streakinfo.shots_fired = 0;
    streakinfo.hits = 0;
    streakinfo.damage = 0;
    streakinfo.kills = 0;
    yaw = undefined;
    var_97195d51c4c2b14e = undefined;
    animname = script_model%mp_alfa10_flyin;
    airstrikeid = undefined;
    level thread callstrike(player, location, yaw, var_97195d51c4c2b14e, streakinfo, animname, airstrikeid);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x573e
// Size: 0x1cb
function function_15d7e8b275b8b57b(hitpos, var_380fcfdae182fa24, var_78836748d345cd08, tracestart, var_b9d5783a4f34efbc, var_33f031d062a32623) {
    var_f1c102cd6fd079fb = utility::function_2d7fd59d039fa69b(hitpos, var_380fcfdae182fa24);
    var_37d7886608227391 = [];
    foreach (target in var_f1c102cd6fd079fb) {
        if (!isdefined(target)) {
            continue;
        }
        targetteam = undefined;
        if (isplayer(target)) {
            if (!target _isalive()) {
                continue;
            }
            targetteam = target.pers["team"];
            if (namespace_36f464722d326bbe::isbrstylegametype()) {
                if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "brGetOperatorTeam")) {
                    targetteam = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "brGetOperatorTeam") ]](target);
                }
            }
        } else if (isagent(target)) {
            if (!isalive(target)) {
                continue;
            }
            if (isdefined(target.agent_type) && issubstr(target.agent_type, "civilian")) {
                continue;
            }
            targetteam = namespace_14d36171baccf528::agentpers_getagentpersdata(target, "team");
        }
        if (isdefined(var_78836748d345cd08)) {
            jumpiffalse(level.teambased) LOC_00000192;
            jumpiffalse(isdefined(var_78836748d345cd08.team) && isdefined(targetteam) && targetteam == var_78836748d345cd08.team && target != var_78836748d345cd08) LOC_00000192;
        } else {
        LOC_00000192:
            canseetarget = ray_trace_passed(tracestart, target gettagorigin("j_head"), var_b9d5783a4f34efbc, var_33f031d062a32623);
            if (istrue(canseetarget)) {
                var_37d7886608227391[var_37d7886608227391.size] = target;
            }
        }
    }
    return var_37d7886608227391;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5911
// Size: 0x116
function function_2a75473ddd0fb33f(hitpos, var_380fcfdae182fa24, var_78836748d345cd08, tracestart, var_b9d5783a4f34efbc, var_33f031d062a32623) {
    var_f1c102cd6fd079fb = vehicle_getarrayinradius(hitpos, var_380fcfdae182fa24, var_380fcfdae182fa24);
    var_b9d5783a4f34efbc = array_combine(var_b9d5783a4f34efbc, var_f1c102cd6fd079fb);
    var_25f1f048b9011ad4 = [];
    foreach (target in var_f1c102cd6fd079fb) {
        if (!isdefined(target)) {
            continue;
        }
        if (level.teambased && isdefined(target.team) && target.team == var_78836748d345cd08.team) {
            continue;
        }
        canseetarget = ray_trace_passed(tracestart, target.origin, var_b9d5783a4f34efbc, var_33f031d062a32623);
        if (istrue(canseetarget)) {
            var_25f1f048b9011ad4[var_25f1f048b9011ad4.size] = target;
        }
    }
    return var_25f1f048b9011ad4;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a2f
// Size: 0xc9
function function_e5a6aaaa22532637(var_6033a7638fe1342f, var_f9f79f4923d00e6e, var_f7f7bac8e05e89d1) {
    self endon("death");
    var_56f0277b0ed98101 = 0.5;
    var_ff85637831346339 = 0.3;
    var_ff624f78310def85 = 0.15;
    var_ff625578310dfcb7 = 0.08;
    var_31bfd6cefec15dc7 = 350;
    var_31e2eacefee7d17b = 900;
    var_31e2e4cefee7c449 = 3500;
    wait(var_f7f7bac8e05e89d1);
    if (issharedfuncdefined("shellshock", "artillery_earthQuake")) {
        [[ getsharedfunc("shellshock", "artillery_earthQuake") ]](var_f9f79f4923d00e6e.origin, var_56f0277b0ed98101, var_ff85637831346339, var_ff624f78310def85, var_ff625578310dfcb7, var_31bfd6cefec15dc7, var_31e2eacefee7d17b, var_31e2e4cefee7c449);
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5aff
// Size: 0xb1
function function_3c8dfe97ac9ad7c7(owner, var_f7f7bac8e05e89d1, var_6033a7638fe1342f, var_f9f79f4923d00e6e, var_a7340ccd3ad168f9) {
    self endon("disconnect");
    namespace_9e00394bef0f1e98::_shellshock("bomb_stun_mp", "stun", 5, 0);
    thread function_94e9b969d9359f43(1, var_6033a7638fe1342f.origin, owner, var_6033a7638fe1342f, "MOD_EXPLOSIVE", var_a7340ccd3ad168f9);
    if (isbot(self) || isagent(self)) {
        return;
    }
    self setscriptablepartstate("airBombVfx", "embers", 0);
    wait(var_f7f7bac8e05e89d1 - 0.1);
    self setscriptablepartstate("airBombVfx", "explode", 0);
    thread function_57107489d8ba1a87("airBombVfx");
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5bb7
// Size: 0x5f
function private function_94e9b969d9359f43(damageamount, damageorigin, attacker, inflictor, meansofdeath, weapon, var_f7f7bac8e05e89d1) {
    self endon("death_or_disconnect");
    if (isdefined(var_f7f7bac8e05e89d1) && var_f7f7bac8e05e89d1 > 0) {
        wait(var_f7f7bac8e05e89d1);
    }
    self dodamage(damageamount, damageorigin, attacker, inflictor, meansofdeath, weapon);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c1d
// Size: 0x2f
function function_57107489d8ba1a87(partname) {
    self endon("disconnect");
    waittill_any_timeout_1(3, "spawned_player");
    self setscriptablepartstate(partname, "off", 0);
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c53
// Size: 0xd4
function function_40748f253c758d0c(var_40db97c5db5e1e3e, flightdir, isfriendly, var_94ba470c66e205d7) {
    var_b26e5ea712463920 = spawnstruct();
    var_b26e5ea712463920.circle = spawnstruct();
    var_1a84ac08a8b12479 = (256 * 4 + 600) / 300;
    var_e3c7bdfc2ae5dc88 = "Airstrike_Pill_Shape";
    if (isfriendly) {
        var_e3c7bdfc2ae5dc88 = "Airstrike_Pill_Shape_Friendly";
    }
    var_b26e5ea712463920.circle function_6b6b6273f8180522(var_e3c7bdfc2ae5dc88, var_40db97c5db5e1e3e, 300 * var_94ba470c66e205d7);
    var_b26e5ea712463920.circle.mapcircle addyaw(vectortoyaw(flightdir) * -1);
    var_b26e5ea712463920.circle.mapcircle addpitch(var_1a84ac08a8b12479);
    return var_b26e5ea712463920;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d2f
// Size: 0x14b
function function_ef2529f22838b027(damagepos, flightdir) {
    var_98ff5ed8e7d91533 = getmatchrulesdata("commonOption", "airstrikeZoneSizeMultiplier");
    var_3da8b019c5c09e2b = getmatchrulesdata("commonOption", "isAirstrikeZoneRandom");
    if (!isdefined(var_98ff5ed8e7d91533) || var_98ff5ed8e7d91533 <= 1) {
        var_98ff5ed8e7d91533 = 1;
        var_3da8b019c5c09e2b = 0;
    }
    var_40db97c5db5e1e3e = damagepos;
    if (var_3da8b019c5c09e2b) {
        var_84ecc2f4134b6cdf = 300;
        var_d6900268a0be9970 = var_84ecc2f4134b6cdf * var_98ff5ed8e7d91533;
        var_b4885b21fe401ac5 = randomfloatrange((var_d6900268a0be9970 * -1 + 300) * 0.5, (var_d6900268a0be9970 - 300) * 0.5);
        var_1a84ac08a8b12479 = (256 * 4 + 600) / 300;
        var_84ecc1f4134b6aac = 300 * var_1a84ac08a8b12479;
        dangerzoneheight = var_84ecc1f4134b6aac * var_98ff5ed8e7d91533;
        var_a433228cdfb64c3a = randomfloatrange((dangerzoneheight * -1 + var_84ecc1f4134b6aac) * 0.5, (dangerzoneheight - var_84ecc1f4134b6aac) * 0.5);
        var_420b7fe776f6872f = vectorcross(flightdir, (0, 0, 1));
        var_40db97c5db5e1e3e = damagepos + var_b4885b21fe401ac5 * var_420b7fe776f6872f + var_a433228cdfb64c3a * flightdir;
    }
    return var_40db97c5db5e1e3e;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e82
// Size: 0x1b4
function function_f1723305529704a5(owner, airstrikeid, var_d8695b9748c307be, flightdir, streakname) {
    var_fdea64af0ede4e50 = level.activeairstrikes[airstrikeid];
    if (!isdefined(var_fdea64af0ede4e50)) {
        return;
    }
    range = 300;
    var_94ba470c66e205d7 = 1;
    if (getmatchrulesdata("commonOption", "isAirstrikeZoneRandom")) {
        var_94ba470c66e205d7 = getmatchrulesdata("commonOption", "airstrikeZoneSizeMultiplier");
        range = 300 * var_94ba470c66e205d7;
    }
    range = range + getmatchrulesdata("commonOption", "airstrikeNotifyCircleAddedRange");
    var_213fdd3689d4b33e = level.teamdata[owner.team]["players"];
    var_213fdd3689d4b33e = function_da1cac199ebc3dbe(var_213fdd3689d4b33e, owner);
    var_b6cd0d44c9bc37e5 = [];
    var_c86bc952d8cc7c15 = function_2de43934d42594e(var_d8695b9748c307be, flightdir, var_94ba470c66e205d7);
    foreach (circleorigin in var_c86bc952d8cc7c15) {
        var_c0d6a48951eaa35e = function_7fbde10147e5b269(circleorigin, range, var_213fdd3689d4b33e);
        var_b6cd0d44c9bc37e5 = array_combine_unique(var_b6cd0d44c9bc37e5, var_c0d6a48951eaa35e);
    }
    foreach (player in var_b6cd0d44c9bc37e5) {
        function_266521b0b26cc543(owner, player, streakname);
    }
    return var_b6cd0d44c9bc37e5;
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x603e
// Size: 0x115
function function_44f4ade288270b27(var_d8695b9748c307be, flightdir) {
    /#
        self.var_bd0aa6c111497ed3 = [];
        range = 300;
        var_94ba470c66e205d7 = 1;
        if (getmatchrulesdata("death", "addSpawnDangerZone")) {
            var_94ba470c66e205d7 = getmatchrulesdata("death", "physicscontents_water");
            range = 300 * var_94ba470c66e205d7;
        }
        range = range + getmatchrulesdata("death", "KILLSTREAKS/INVALID_POINT");
        var_c86bc952d8cc7c15 = function_2de43934d42594e(var_d8695b9748c307be, flightdir, var_94ba470c66e205d7);
        foreach (circleorigin in var_c86bc952d8cc7c15) {
            currentindex = self.var_bd0aa6c111497ed3.size;
            self.var_bd0aa6c111497ed3[currentindex] = spawnstruct();
            self.var_bd0aa6c111497ed3[currentindex] function_6b6b6273f8180522("<unknown string>", circleorigin, range);
        }
    #/
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x615a
// Size: 0x71
function function_2de43934d42594e(damagepos, planedir, var_94ba470c66e205d7) {
    multiplier = 1;
    if (isdefined(var_94ba470c66e205d7)) {
        multiplier = var_94ba470c66e205d7;
    }
    return [0:damagepos - planedir * 256 * multiplier * 2, 1:damagepos - planedir * 256 * multiplier, 2:damagepos, 3:damagepos + planedir * 256 * multiplier, 4:damagepos + planedir * 256 * multiplier * 2];
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61d3
// Size: 0x28c
function function_9557f58b574e2c68() {
    self endon("map_circles_deleted");
    level endon("game_ended");
    var_710159b7f6d7c1ca = level.var_15d8e56090c743d.var_3113dc43ef029ff6 * level.var_15d8e56090c743d.var_3113dc43ef029ff6;
    /#
        var_40db1f3c38a29377 = getdvarint(@"hash_de3bb82d99946baf", 0);
    #/
    while (1) {
        foreach (player in level.players) {
            isfriendly = namespace_f8065cafc523dba5::isfriendly(self.owner.team, player) && self.owner != player;
            if (distance2dsquared(player.origin, self.damagepos) <= var_710159b7f6d7c1ca) {
                if (isfriendly) {
                    self.var_3ca34d5445aa3f3a.circle function_cfd53c8f6878014f(player);
                } else {
                    self.var_187df114b0f48137.circle function_cfd53c8f6878014f(player);
                }
                /#
                    if (var_40db1f3c38a29377) {
                        self.debugcircle.circle function_cfd53c8f6878014f(player);
                        if (isdefined(self.var_bd0aa6c111497ed3)) {
                            foreach (circle in self.var_bd0aa6c111497ed3) {
                                circle function_cfd53c8f6878014f(player);
                            }
                        }
                    }
                #/
            } else {
                self.var_3ca34d5445aa3f3a.circle function_d7d113d56ef0ef5b(player);
                self.var_187df114b0f48137.circle function_d7d113d56ef0ef5b(player);
                /#
                    if (var_40db1f3c38a29377) {
                        self.debugcircle.circle function_d7d113d56ef0ef5b(player);
                        if (isdefined(self.var_bd0aa6c111497ed3)) {
                            foreach (circle in self.var_bd0aa6c111497ed3) {
                                circle function_d7d113d56ef0ef5b(player);
                            }
                        }
                    }
                #/
            }
        }
        waitframe();
    }
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6466
// Size: 0x10a
function function_a889314c31d34692() {
    self notify("map_circles_deleted");
    if (isdefined(self.var_187df114b0f48137)) {
        self.var_187df114b0f48137.circle function_af5604ce591768e1();
        self.var_187df114b0f48137.circle = undefined;
    }
    if (isdefined(self.var_3ca34d5445aa3f3a)) {
        self.var_3ca34d5445aa3f3a.circle function_af5604ce591768e1();
        self.var_3ca34d5445aa3f3a.circle = undefined;
    }
    /#
        if (isdefined(self.debugcircle)) {
            self.debugcircle.circle function_af5604ce591768e1();
            self.debugcircle.circle = undefined;
        }
        if (isdefined(self.var_bd0aa6c111497ed3)) {
            for (i = self.var_bd0aa6c111497ed3.size - 1; i >= 0; i--) {
                self.var_bd0aa6c111497ed3[i] function_af5604ce591768e1();
                self.var_bd0aa6c111497ed3[i] = undefined;
            }
        }
    #/
}

// Namespace airstrike/namespace_203b58a09d020a50
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6577
// Size: 0xde
function function_9018ff93eb75a769(var_f7f7bac8e05e89d1, var_f9f79f4923d00e6e) {
    /#
        self endon("<unknown string>");
        level endon("<unknown string>");
        self notify("<unknown string>");
        self endon("<unknown string>");
        self notifyonplayercommand("<unknown string>", "<unknown string>");
        self notifyonplayercommand("<unknown string>", "<unknown string>");
        var_a7340ccd3ad168f9 = makeweapon("<unknown string>");
        while (1) {
            var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
            if (!istrue(var_671b9cb2b0e5d795)) {
                waitframe();
                continue;
            }
            self waittill("<unknown string>");
            namespace_9e00394bef0f1e98::_shellshock("<unknown string>", "<unknown string>", 2, 0);
            self setscriptablepartstate("<unknown string>", "<unknown string>", 0);
            wait(var_f7f7bac8e05e89d1 - 0.1);
            self setscriptablepartstate("<unknown string>", "<unknown string>", 0);
        }
    #/
}

