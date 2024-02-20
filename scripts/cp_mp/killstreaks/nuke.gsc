// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\killstreaks\airstrike.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\cp_mp\gasmask.gsc;

#namespace nuke;

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f2
// Size: 0x99
function init() {
    if (issharedfuncdefined("nuke", "init")) {
        [[ getsharedfunc("nuke", "init") ]]();
    }
    level.nuke_expl_struct = namespace_36f464722d326bbe::getlocalestruct("nuke_expl_pos");
    /#
        setdevdvarifuninitialized(@"hash_9d7c4e6216d74263", 0);
        setdevdvarifuninitialized(@"hash_aff3efc76e4dfeb2", 1);
        setdevdvarifuninitialized(@"hash_35e0e06e57d92306", 0);
        setdevdvarifuninitialized(@"hash_7943c6ec7e44f87c", 0);
    #/
    level function_c406cde778937505();
    level function_ae8a4b0e2c6b7396();
    level function_af7b6584a27af59f();
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa92
// Size: 0x35
function function_c406cde778937505() {
    game["dialog"]["nuke_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["nuke_multi_use"] = "killstreak_remote_operator" + "_request_response";
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xace
// Size: 0x3
function function_ae8a4b0e2c6b7396() {
    
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad8
// Size: 0x11
function function_af7b6584a27af59f() {
    level.nukeinfo = spawnstruct();
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf0
// Size: 0x47
function tryusenuke(var_ea8ab1373211e7e6, var_66cdedd14979a988) {
    var_5bb8bcc61bc76d46 = "nuke";
    if (isdefined(var_ea8ab1373211e7e6)) {
        var_5bb8bcc61bc76d46 = var_ea8ab1373211e7e6;
    }
    streakinfo = createstreakinfo(var_5bb8bcc61bc76d46, self);
    return tryusenukefromstruct(streakinfo, var_66cdedd14979a988);
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3f
// Size: 0x353
function tryusenukefromstruct(streakinfo, var_66cdedd14979a988) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            streakinfo notify("killstreak_finished_with_deploy_weapon");
            return 0;
        }
    }
    var_b87822b980d6e763 = ter_op(isdefined(streakinfo.var_b87822b980d6e763), streakinfo.var_b87822b980d6e763, undefined);
    var_eb9cbd43baeae1c6 = undefined;
    var_3dabfa23bef362b5 = ter_op(isdefined(streakinfo.var_3dabfa23bef362b5), streakinfo.var_3dabfa23bef362b5, undefined);
    if (!isdefined(level.nukeinfo.incoming)) {
        level.nukeinfo.incoming = 1;
        level.nukeinfo.player = self;
    } else {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/NUKE_ALREADY_INBOUND");
        }
        return 0;
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["nuke"];
    var_33e40859dae8ac8d = isdefined(bundle) && isdefined(bundle.deployweaponname);
    if (streakinfo.streakname == "nuke_select_location") {
        if (var_33e40859dae8ac8d) {
            var_dd21567fdd9a3a6a = bundle.deployweaponname;
        } else {
            var_dd21567fdd9a3a6a = "iw9_spotter_scope_mp";
        }
        var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponfireddeploy(streakinfo, function_eeaa22f0cd1ff845(var_dd21567fdd9a3a6a), "weapon_fired", &weapongivennuke, &weaponswitchendednuke, &weaponfirednuke);
        var_eb9cbd43baeae1c6 = namespace_203b58a09d020a50::airstrike_getownerlookatpos(self);
        var_3dabfa23bef362b5 = 25;
        var_d44b7b1a5d0e8f39 = undefined;
        if (issharedfuncdefined("game", "getOtherTeam")) {
            var_d44b7b1a5d0e8f39 = [[ getsharedfunc("game", "getOtherTeam") ]](streakinfo.owner.team);
        }
        if (isdefined(var_d44b7b1a5d0e8f39)) {
            level thread nuke_warnenemiesnukeincoming(var_d44b7b1a5d0e8f39[0]);
        }
    } else if (!istrue(level.mercywintriggered)) {
        if (var_33e40859dae8ac8d) {
            var_dd21567fdd9a3a6a = bundle.deployweaponname;
        } else {
            var_dd21567fdd9a3a6a = "ks_remote_nuke_mp";
        }
        var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweapontabletdeploy(streakinfo, undefined, undefined, undefined, undefined, var_dd21567fdd9a3a6a, 0);
    } else {
        var_9b1deb5e9d32bbe3 = 1;
    }
    if (!istrue(var_9b1deb5e9d32bbe3) || level.gameended) {
        level.nukeinfo.incoming = undefined;
        level.nukeinfo.player = undefined;
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            level.nukeinfo.incoming = undefined;
            level.nukeinfo.player = undefined;
            streakinfo notify("killstreak_finished_with_deploy_weapon");
            return 0;
        }
    }
    thread nuke_start(streakinfo, 0, undefined, var_eb9cbd43baeae1c6, var_b87822b980d6e763, var_3dabfa23bef362b5, var_66cdedd14979a988);
    if (streakinfo.streakname != "nuke_select_location" && !istrue(level.mercywintriggered)) {
        utility::trycall(level.matchdata_logkillstreakevent, "nuke", self.origin);
    }
    return 1;
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9a
// Size: 0xe
function weapongivennuke(streakinfo) {
    return 1;
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb0
// Size: 0x27
function weaponswitchendednuke(streakinfo, var_41bf9bf4918115ac) {
    if (istrue(var_41bf9bf4918115ac)) {
        thread namespace_203b58a09d020a50::airstrike_watchforads(streakinfo, "splash_icon_nuke");
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xede
// Size: 0x6a
function weaponfirednuke(streakinfo, var_a9dd4e8c5e5c7178, var_b663fbbcbb2f5780) {
    var_b21e2e887c161b9 = namespace_203b58a09d020a50::airstrike_getownerlookatpos(self);
    if (!isdefined(var_b21e2e887c161b9)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/INVALID_POINT");
        }
        return "continue";
    }
    return "success";
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf50
// Size: 0x5f
function nuke_delaythread(delay, func, owner, streakinfo) {
    level endon("nuke_cancelled");
    if (isdefined(delay)) {
        if (issharedfuncdefined("nuke", "hostmigration_waitLongDurationWithPause")) {
            [[ getsharedfunc("nuke", "hostmigration_waitLongDurationWithPause") ]](delay);
        }
    }
    level thread [[ func ]](owner, streakinfo);
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb6
// Size: 0x505
function nuke_start(streakinfo, var_3a565847d875f3ec, var_edbe27b2d5f1e060, var_92aaddad0fcb1fa8, var_b87822b980d6e763, var_3dabfa23bef362b5, weaponoverride) {
    level endon("nuke_cancelled");
    level notify("used_nuke");
    self notify("used_nuke");
    streakinfo notify("killstreak_finished_with_deploy_weapon", 1);
    nukeinfo = spawnstruct();
    nukeinfo.team = self.pers["team"];
    nukeinfo.var_3a565847d875f3ec = istrue(var_3a565847d875f3ec);
    nukeinfo.cancelled = undefined;
    nukeinfo.detonated = undefined;
    nukeinfo.gameover = undefined;
    nukeinfo.var_a8fb915f46a518d9 = 0;
    nukeinfo.var_6d77c28b2dbed93d = 0;
    nukeinfo.nuketype = streakinfo.streakname;
    nukeinfo.streakinfo = streakinfo;
    nukeinfo.incoming = 1;
    if (isplayer(self)) {
        nukeinfo.player = self;
    }
    nukegoalpoint = function_b913fa4052092442(nukeinfo.nuketype, var_92aaddad0fcb1fa8);
    var_ffb179778403bed7 = function_5e29f303004c9602(nukeinfo.nuketype, nukegoalpoint, var_edbe27b2d5f1e060);
    var_d7ea0c53e00a2519 = function_4eb440a17165aeee(nukeinfo.nuketype, 6, var_b87822b980d6e763);
    var_fc0ffdf77aeec040 = function_cd3712661b44dfb(nukeinfo.nuketype, 10, var_3dabfa23bef362b5);
    var_c9d3f58c83d60d18 = function_e6e5495e21e67613(nukeinfo.nuketype, weaponoverride);
    if (!isdefined(nukeinfo.clockobject)) {
        nukeinfo.clockobject = spawn("script_origin", var_ffb179778403bed7 + (0, 0, 100));
        nukeinfo.clockobject dontinterpolate();
        nukeinfo.clockobject hide();
    } else {
        nukeinfo.clockobject.origin = var_ffb179778403bed7 + (0, 0, 100);
    }
    nukeinfo.var_b0d1c69e44f250ec = var_ffb179778403bed7;
    nukeinfo.goalpoint = nukegoalpoint;
    nukeinfo.var_51bee2f5b3b4e278 = var_d7ea0c53e00a2519;
    nukeinfo.var_c6773756acf950fd = var_fc0ffdf77aeec040;
    nukeinfo.var_6ea387e8dfa3cccd = var_d7ea0c53e00a2519 + var_fc0ffdf77aeec040;
    nukeinfo.weapon = var_c9d3f58c83d60d18;
    nukeinfo.inflictor = spawn("script_model", nukegoalpoint + (0, 0, 5000));
    nukeinfo.inflictor setmodel("tag_origin");
    nukeinfo.inflictor.team = nukeinfo.team;
    nukeinfo.inflictor.owner = self;
    nukeinfo.inflictor.streakinfo = streakinfo;
    level.nukeinfo = nukeinfo;
    level thread nuke_startlaunchsequence(self, streakinfo);
    if (nukeinfo.nuketype == "nuke_multi") {
        level thread nuke_delaythread(nukeinfo.var_51bee2f5b3b4e278, &function_2f5646d1ef5c8b81, self, streakinfo);
        level thread nuke_delaythread(nukeinfo.var_51bee2f5b3b4e278, &function_e361a03e34d52440, self, streakinfo);
        level thread nuke_delaythread(nukeinfo.var_51bee2f5b3b4e278, &function_36fb604b46a1514a, self, streakinfo);
        level thread nuke_delaythread(nukeinfo.var_51bee2f5b3b4e278, &function_acb30efb36c7f230, self, streakinfo);
    } else {
        if (isdefined(streakinfo.nuketype) && streakinfo.nuketype == "nuke_select_location") {
            level thread nuke_delaythread(nukeinfo.var_6ea387e8dfa3cccd, &nuke_createradiationzone, self, streakinfo);
        }
        level thread nuke_delaythread(nukeinfo.var_6ea387e8dfa3cccd, &nuke_slowmo, self, streakinfo);
        level thread nuke_delaythread(nukeinfo.var_6ea387e8dfa3cccd, &nuke_explosion, self, streakinfo);
        level thread nuke_delaythread(nukeinfo.var_6ea387e8dfa3cccd, &nuke_earthquake, self, streakinfo);
        level thread nuke_delaythread(nukeinfo.var_6ea387e8dfa3cccd + 0.075, &nuke_vision, self, streakinfo);
        level thread nuke_delaythread(nukeinfo.var_6ea387e8dfa3cccd + 5, &nuke_death, self, streakinfo);
    }
    level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
    if (issharedfuncdefined("nuke", "addTeamRankXPMultiplier")) {
        [[ getsharedfunc("nuke", "addTeamRankXPMultiplier") ]](2, level.nukeinfo.team, "nuke");
    }
    if (level.nukeinfo.var_3a565847d875f3ec) {
        level thread nuke_watchownerdisconnect(nukeinfo.player);
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c2
// Size: 0x5a
function nuke_watchownerdisconnect(owner) {
    if (!istrue(level.nukeinfo.var_6d77c28b2dbed93d)) {
        soundsettimescalefactorfromtable("nuke");
        level.nukeinfo.var_6d77c28b2dbed93d = 1;
    }
    level endon("game_ended");
    owner waittill("disconnect");
    nuke_cancel();
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1523
// Size: 0x59
function nuke_cancel() {
    level.nukeinfo.cancelled = 1;
    level.nukeinfo.incoming = undefined;
    level.nukeinfo.player = undefined;
    nuke_cleartimer();
    setslowmotion(1, 1, 0);
    level notify("nuke_cancelled");
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1583
// Size: 0x145
function nuke_starttimer(traveltime) {
    level endon("nuke_cancelled");
    if (traveltime <= 1) {
        return;
    }
    if (istrue(level.mercywintriggered)) {
        setomnvar("ui_nuke_timer_type", 2);
    } else {
        setomnvar("ui_nuke_timer_type", 0);
    }
    setomnvar("ui_nuke_countdown_active", 1);
    if (isdefined(level.nukeinfo.player)) {
        setomnvar("ui_nuke_player_id", level.nukeinfo.player getentitynumber());
    }
    level thread nuke_updateuitimers(traveltime);
    var_4d699cf255438b85 = traveltime;
    var_4301659e40735d70 = 0;
    var_8a02211e4ff9cb79 = 0;
    level.nukeinfo.clockobject playsound("iw9_mgb_splash");
    while (var_4d699cf255438b85 > 0) {
        if (var_4d699cf255438b85 <= 10) {
            if (isdefined(level.nukeinfo.missile) && !istrue(var_4301659e40735d70)) {
                level thread nuke_startmissileflightaudio();
                var_4301659e40735d70 = 1;
            }
        }
        if (var_4d699cf255438b85 <= 4.9) {
            if (isdefined(level.nukeinfo.missile) && !istrue(var_8a02211e4ff9cb79)) {
                var_8a02211e4ff9cb79 = 1;
            }
        }
        wait(1);
        var_4d699cf255438b85--;
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16cf
// Size: 0x29
function nuke_startmissileflightaudio() {
    level.nukeinfo.missile endon("death");
    level endon("game_ended");
    wait(7);
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ff
// Size: 0x10
function nuke_cleartimer() {
    setomnvar("ui_nuke_countdown_active", -1);
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1716
// Size: 0x2f1
function nuke_startlaunchsequence(owner, streakinfo) {
    nuketype = level.nukeinfo.nuketype;
    var_d7ea0c53e00a2519 = level.nukeinfo.var_51bee2f5b3b4e278;
    var_fc0ffdf77aeec040 = level.nukeinfo.var_c6773756acf950fd;
    var_81c12fe9c2d29fa7 = level.nukeinfo.var_6ea387e8dfa3cccd;
    launchpos = level.nukeinfo.var_b0d1c69e44f250ec;
    explodepos = level.nukeinfo.goalpoint;
    var_c9d3f58c83d60d18 = level.nukeinfo.weapon;
    var_22e6bb02f93c20d1 = nuketype == "nuke_multi";
    var_a3c021e65ff921dc = nuketype == "nuke_select_location";
    level thread nuke_startprelaunchalarm(var_d7ea0c53e00a2519, streakinfo, owner);
    if (var_22e6bb02f93c20d1) {
        level thread function_74f04922f32f9f6c(launchpos, explodepos, var_81c12fe9c2d29fa7, streakinfo, owner);
    }
    if (isplayer(owner) && owner ispcplayer()) {
        owner setclientomnvar("nVidiaHighlights_events", 15);
    }
    if (!istrue(var_a3c021e65ff921dc)) {
        gametype = "";
        if (issharedfuncdefined("game", "getGameType")) {
            gametype = [[ getsharedfunc("game", "getGameType") ]]();
        }
        var_aa0023821e2dee76 = undefined;
        if (issharedfuncdefined("nuke", "stopTheClock")) {
            var_aa0023821e2dee76 = [[ getsharedfunc("nuke", "stopTheClock") ]](gametype);
        }
        if (isdefined(var_aa0023821e2dee76)) {
            hashvalue = getdvarfloat(var_aa0023821e2dee76, 0);
            if (issharedfuncdefined("game", "setOverTimeLimitDvar")) {
                [[ getsharedfunc("game", "setOverTimeLimitDvar") ]](hashvalue);
            }
        }
        level.dontendonscore = 1;
        foreach (player in level.players) {
            if (isdefined(player)) {
                player notify("abort_killcam");
                player.cancelkillcam = 1;
            }
        }
        level thread nuke_abortkillcamonspawn();
        level.disablespawncamera = 1;
    }
    if (issharedfuncdefined("nuke", "hostmigration_waitLongDurationWithPause")) {
        [[ getsharedfunc("nuke", "hostmigration_waitLongDurationWithPause") ]](var_d7ea0c53e00a2519);
    }
    level thread nuke_starttimer(var_fc0ffdf77aeec040);
    if (istrue(var_22e6bb02f93c20d1)) {
        level thread function_3eb69e3deebb567(owner, streakinfo, explodepos, var_fc0ffdf77aeec040, var_c9d3f58c83d60d18);
    } else {
        level thread nuke_launchmissile(owner, streakinfo, launchpos, explodepos, var_fc0ffdf77aeec040, var_c9d3f58c83d60d18);
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a0e
// Size: 0xe9
function nuke_startprelaunchalarm(var_b807a7599e6f56dc, streakinfo, owner) {
    level endon("game_ended");
    if (istrue(streakinfo.var_93dbd6174ca50e88)) {
        return;
    }
    var_1d2e95f090749d20 = 0;
    if (isdefined(streakinfo) && isdefined(owner)) {
        owner thread playkillstreakoperatordialog(streakinfo.streakname, streakinfo.streakname + "_use", 1, 1);
    }
    while (var_b807a7599e6f56dc > 0) {
        if (isdefined(level.nukeinfo.clockobject) && !istrue(var_1d2e95f090749d20)) {
            level.nukeinfo.clockobject playsound("iw9_mgb_siren");
            var_1d2e95f090749d20 = 1;
        }
        if (issharedfuncdefined("nuke", "hostmigration_waitLongDurationWithPause")) {
            [[ getsharedfunc("nuke", "hostmigration_waitLongDurationWithPause") ]](2);
        }
        var_b807a7599e6f56dc = var_b807a7599e6f56dc - 2;
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1afe
// Size: 0xc6
function function_74f04922f32f9f6c(var_5f4190c47572964f, var_ef2e38e51568075b, var_81c12fe9c2d29fa7, streakinfo, owner) {
    level endon("game_ended");
    drone = spawn("script_model", var_5f4190c47572964f);
    drone setmodel("veh9_mil_air_large_drone_mp");
    drone setcandamage(0);
    drone.angles = vectortoangles((var_ef2e38e51568075b[0], var_ef2e38e51568075b[1], 0) - (var_5f4190c47572964f[0], var_5f4190c47572964f[1], 0));
    drone setscriptablepartstate("engine", "on", 0);
    drone moveto(var_5f4190c47572964f + anglestoforward(drone.angles) * 5000, var_81c12fe9c2d29fa7);
    level.nukeinfo.drone = drone;
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bcb
// Size: 0x3ba
function function_3eb69e3deebb567(owner, streakinfo, explodepos, traveltime, var_c9d3f58c83d60d18) {
    level endon("game_ended");
    /#
        assertex(isdefined(level.nukeinfo.drone), "nuke_launchBombs: Missing drone to launch the bombs from");
    #/
    if (isdefined(owner) && isplayer(owner)) {
        if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
            level thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_nuke_multi", owner);
        }
    }
    level.nukeinfo.bombs = [];
    drone = level.nukeinfo.drone;
    var_a780020e8099cab2 = (0, 0, -1 * getdvarint(@"hash_b5d7d39d32720e78", 800));
    var_95046b2fb0c1d7a0 = [0:explodepos - anglestoforward(drone.angles) * 2500, 1:explodepos - anglestoforward(drone.angles) * 1000, 2:explodepos + anglestoforward(drone.angles) * 1000, 3:explodepos + anglestoforward(drone.angles) * 2500, 4:explodepos];
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1);
    rightoffset = 500;
    for (i = 0; i < 5; i++) {
        var_2054934da4fd5851 = 0;
        nextindex = i + 1;
        if (nextindex == 5) {
            var_2054934da4fd5851 = 1;
        }
        var_9ea4faf9f08cb80d = drone.origin - (0, 0, 100) + anglestoforward(drone.angles) * 500;
        launchpos = var_9ea4faf9f08cb80d + anglestoright(drone.angles) * rightoffset;
        var_236ee72ff767d96d = var_95046b2fb0c1d7a0[i];
        if (!istrue(var_2054934da4fd5851)) {
            var_a0a41ba05e16ffe6 = randomintrange(1000, 2500);
            randangle = randomint(360);
            x = var_95046b2fb0c1d7a0[i][0] + var_a0a41ba05e16ffe6 * cos(randangle);
            y = var_95046b2fb0c1d7a0[i][1] + var_a0a41ba05e16ffe6 * sin(randangle);
            z = var_95046b2fb0c1d7a0[i][2];
            var_236ee72ff767d96d = (x, y, z);
        }
        var_3b8c153f4d5d7f16 = namespace_2a184fc4902783dc::ray_trace(launchpos, var_236ee72ff767d96d, drone, var_fbcabd62b8f66eb8);
        var_a25beb2b2566b9c4 = var_236ee72ff767d96d;
        if (isdefined(var_3b8c153f4d5d7f16) && isdefined(var_3b8c153f4d5d7f16["hittype"] != "hittype_none")) {
            var_a25beb2b2566b9c4 = var_3b8c153f4d5d7f16["position"];
        }
        var_10afa5659c39462f = (var_a25beb2b2566b9c4 - 0.5 * var_a780020e8099cab2 * squared(traveltime) - launchpos) / traveltime;
        bomb = magicgrenademanual(var_c9d3f58c83d60d18, launchpos, var_10afa5659c39462f, traveltime);
        bomb setscriptablepartstate("launch_bomb_source", "on", 0);
        bomb setscriptablepartstate("launch", "on", 0);
        if (istrue(var_2054934da4fd5851)) {
            level notify("nuke_last_bomb_launch");
        }
        level thread function_610c4d047fafd311(bomb, streakinfo, traveltime, var_2054934da4fd5851);
        level.nukeinfo.bombs[level.nukeinfo.bombs.size] = bomb;
        wait(randomfloatrange(0.5, 1));
        rightoffset = rightoffset - 250;
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f8c
// Size: 0x1ee
function function_610c4d047fafd311(bomb, streakinfo, traveltime, var_2054934da4fd5851) {
    if (istrue(var_2054934da4fd5851)) {
        wait(traveltime - 2.8);
        bomb setscriptablepartstate("last_bomb_sfx", "on", 0);
        wait(2.8);
    } else {
        wait(traveltime);
    }
    position = bomb.origin;
    var_56f0277b0ed98101 = 3;
    var_ff85637831346339 = 0.3;
    var_ff624f78310def85 = 0.15;
    var_ff625578310dfcb7 = 0.1;
    var_31bfd6cefec15dc7 = 1500;
    var_31e2eacefee7d17b = 5000;
    var_31e2e4cefee7c449 = 10000;
    if (issharedfuncdefined("shellshock", "artillery_earthQuake")) {
        [[ getsharedfunc("shellshock", "artillery_earthQuake") ]](position, var_56f0277b0ed98101, var_ff85637831346339, var_ff624f78310def85, var_ff625578310dfcb7, var_31bfd6cefec15dc7, var_31e2eacefee7d17b, var_31e2e4cefee7c449, undefined, 1, 1);
    }
    bombowner = level.nukeinfo.player;
    var_8c517b9f2ddb52b3 = 3000;
    var_d0712dbca713335f = nuke_cankilleverything();
    if (istrue(var_d0712dbca713335f)) {
        function_44b8d70a3d3ca307(bombowner, position, var_8c517b9f2ddb52b3);
    }
    if (istrue(var_2054934da4fd5851)) {
        level notify("nuke_last_bomb_impact");
        nuke_cleartimer();
        level.nukeinfo.detonated = 1;
        level notify("nuke_detonated");
        thread play_loopsound_in_space("iw9_mgb_post_fire", bomb.origin);
        if (!istrue(level.mercywintriggered)) {
            if (isdefined(level.nukeinfo.player) && isdefined(streakinfo)) {
                level.nukeinfo.player namespace_9abe40d2af041eb2::recordkillstreakendstats(streakinfo);
            }
        }
    }
    bomb detonate();
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2181
// Size: 0x5b
function function_9e9a2fdc07dcdd72(bomb, traveltime) {
    bomb endon("death");
    bomb endon("explode");
    var_bf96b95f2df1d8bc = 0;
    var_8a02211e4ff9cb79 = 0;
    while (1) {
        if (var_bf96b95f2df1d8bc >= 8) {
            break;
        }
        var_bf96b95f2df1d8bc = var_bf96b95f2df1d8bc + 0.05;
        wait(0.05);
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21e3
// Size: 0x344
function function_44b8d70a3d3ca307(owner, position, var_8c517b9f2ddb52b3) {
    var_32d90540fa4c9fc3 = var_8c517b9f2ddb52b3 * var_8c517b9f2ddb52b3;
    var_705cc2040029edb7 = owner;
    var_c9d3f58c83d60d18 = makeweapon(level.nukeinfo.weapon);
    var_b8fa26a3f6b83cec = utility::function_2d7fd59d039fa69b(position, var_8c517b9f2ddb52b3);
    foreach (character in var_b8fa26a3f6b83cec) {
        if (!isdefined(character)) {
            continue;
        }
        if (issharedfuncdefined("player", "isReallyAlive")) {
            if ([[ getsharedfunc("player", "isReallyAlive") ]](character)) {
                character.nuked = 1;
                if (level.teambased) {
                    if (isdefined(owner) && character.team == owner.team || !isdefined(owner)) {
                        var_705cc2040029edb7 = character;
                    }
                } else if (!isdefined(owner)) {
                    var_705cc2040029edb7 = character;
                }
                character dodamage(999999, level.nukeinfo.inflictor.origin, var_705cc2040029edb7, level.nukeinfo.inflictor, "MOD_EXPLOSIVE", var_c9d3f58c83d60d18, "none");
            }
        }
    }
    killstreaklist = level.activekillstreaks;
    var_bd572a35f03ced5b = undefined;
    if (isdefined(level.vehicle) && isdefined(level.vehicle.interact) && isdefined(level.vehicle.interact.vehicles)) {
        var_bd572a35f03ced5b = level.vehicle.interact.vehicles;
    }
    var_a1a3722fb9707783 = [[ level.getactiveequipmentarray ]]();
    var_34ca454bbec477f1 = [];
    if (isdefined(killstreaklist)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, killstreaklist);
    }
    if (isdefined(var_bd572a35f03ced5b)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, var_bd572a35f03ced5b);
    }
    if (isdefined(var_a1a3722fb9707783)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, var_a1a3722fb9707783);
    }
    foreach (object in var_34ca454bbec477f1) {
        if (!isdefined(object)) {
            continue;
        }
        if (distancesquared(object.origin, position) > var_32d90540fa4c9fc3) {
            continue;
        }
        if (object namespace_1f188a13f7e79610::isvehicle() && !isdefined(object.streakinfo)) {
            object.var_a8f4bb03b366aa80 = 1;
            object namespace_1f188a13f7e79610::vehicle_explode();
        } else {
            object dodamage(99999, level.nukeinfo.inflictor.origin, var_705cc2040029edb7, level.nukeinfo.inflictor, "MOD_EXPLOSIVE", var_c9d3f58c83d60d18, "none");
        }
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x252e
// Size: 0x1ad
function nuke_launchmissile(owner, streakinfo, launchpos, explodepos, traveltime, var_c9d3f58c83d60d18) {
    level endon("game_ended");
    if (isdefined(owner) && isplayer(owner)) {
        if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
            level thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_nuke", owner);
        }
    }
    var_a780020e8099cab2 = (0, 0, -1 * getdvarint(@"hash_b5d7d39d32720e78", 800));
    var_10afa5659c39462f = (explodepos - 0.5 * var_a780020e8099cab2 * squared(traveltime) - launchpos) / traveltime;
    level.nukeinfo.missile = magicgrenademanual(var_c9d3f58c83d60d18, launchpos, var_10afa5659c39462f, traveltime);
    level.nukeinfo.missile setscriptablepartstate("launch", "on", 0);
    /#
        var_5c563a9f55dea93d = getdvarint(@"hash_35e0e06e57d92306", 0);
        if (istrue(var_5c563a9f55dea93d)) {
            sphere(launchpos, 500, (0, 1, 0), 0, 1000);
            sphere(explodepos, 500, (1, 0, 0), 0, 1000);
            while (isdefined(level.nukeinfo.missile)) {
                sphere(level.nukeinfo.missile.origin, 100, (1, 1, 1), 0, 1);
                wait(0.05);
            }
        }
    #/
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x26e2
// Size: 0x159
function nuke_findunobstructedfiringinfo(var_8dd61e2f04dc2c58, var_c85514760eff92a9, var_cf90f734f1c34521) {
    nukeinfo = spawnstruct();
    var_1bfa180c6fdd09dd = physics_createcontents([0:"physicscontents_vehicleclip", 1:"physicscontents_missileclip", 2:"physicscontents_clipshot"]);
    var_7b669bdcc35fd6fa = -2000;
    var_7b8a85dcc3882150 = 2000;
    var_a780020e8099cab2 = (0, 0, -1 * getdvarint(@"hash_b5d7d39d32720e78", 800));
    while (1) {
        var_be819573448d27bc = var_8dd61e2f04dc2c58;
        var_969bf3922a5aa40b = var_be819573448d27bc + (0, 0, 5000);
        if (namespace_2a184fc4902783dc::ray_trace_passed(var_be819573448d27bc, var_969bf3922a5aa40b, undefined, var_1bfa180c6fdd09dd)) {
            var_10afa5659c39462f = (var_c85514760eff92a9 - 0.5 * var_a780020e8099cab2 * squared(var_cf90f734f1c34521) - var_be819573448d27bc) / var_cf90f734f1c34521;
            nukeinfo.sourcepos = var_be819573448d27bc;
            nukeinfo.goalpos = var_c85514760eff92a9;
            nukeinfo.initvelocity = var_10afa5659c39462f;
            break;
        }
        var_be819573448d27bc = var_be819573448d27bc + anglestoright(self.angles) * randomintrange(var_7b669bdcc35fd6fa, var_7b8a85dcc3882150);
        var_7b669bdcc35fd6fa = int(var_7b669bdcc35fd6fa * 1.3);
        var_7b8a85dcc3882150 = int(var_7b8a85dcc3882150 * 1.3);
        waitframe();
    }
    return nukeinfo;
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2843
// Size: 0x25f
function nuke_explosion(owner, streakinfo) {
    level endon("nuke_cancelled");
    nuke_cleartimer();
    level.nukeinfo.detonated = 1;
    level notify("nuke_detonated");
    if (istrue(streakinfo.var_fc46647c49fa8a11)) {
        return;
    }
    if (isdefined(level.nukeinfo.missile)) {
        level.nukeinfo.missile setscriptablepartstate("launch", "off", 0);
        level.nukeinfo.missile delete();
    }
    var_b19d10a33613ef12 = spawn("script_model", level.nukeinfo.goalpoint);
    var_b19d10a33613ef12 setmodel("ks_nuke_mp");
    var_b19d10a33613ef12 setscriptablepartstate("explode", "on", 0);
    if (issharedfuncdefined("entity", "delayEntDelete")) {
        var_b19d10a33613ef12 thread [[ getsharedfunc("entity", "delayEntDelete") ]](50);
    }
    thread nuke_startexplosionaudio(level.nukeinfo.goalpoint);
    if (level.nukeinfo.nuketype != "nuke_select_location") {
        foreach (character in level.characters) {
            if ([[ getsharedfunc("nuke", "cankill") ]](character, nuke_cankilleverything())) {
                if (isplayer(character)) {
                    if (issharedfuncdefined("player", "isReallyAlive")) {
                        if ([[ getsharedfunc("player", "isReallyAlive") ]](character)) {
                            character thread nuke_startnukedeathfx();
                        }
                    }
                }
            }
        }
    } else {
        foreach (character in level.characters) {
            if (isplayer(character) && [[ getsharedfunc("player", "isReallyAlive") ]](character)) {
                character thread nuke_startnukedeathfx_chooselocationversion();
            }
        }
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aa9
// Size: 0x67
function nuke_startexplosionaudio(explosionpos) {
    foreach (player in level.players) {
        player setsoundsubmix("jup_kls_mgb", 6);
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b17
// Size: 0x9c
function nuke_slowmo(owner, streakinfo) {
    if (level.nukeinfo.nuketype == "nuke_select_location") {
        return;
    }
    level endon("nuke_cancelled");
    if (istrue(streakinfo.var_e723bc4541254543)) {
        return;
    }
    setnuketimescalefactor();
    level waittill("nuke_death");
    setslowmotion(1, 0.25, 0.1);
    /#
        var_3a6f86f8fa6a5421 = getdvarint(@"hash_aff3efc76e4dfeb2", 1);
        if (!var_3a6f86f8fa6a5421) {
            wait(3);
            setslowmotion(0.25, 1, 0);
        }
    #/
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bba
// Size: 0x3b
function setnuketimescalefactor() {
    if (!istrue(level.nukeinfo.var_6d77c28b2dbed93d)) {
        soundsettimescalefactorfromtable("nuke");
        level.nukeinfo.var_6d77c28b2dbed93d = 1;
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2bfc
// Size: 0x71
function nuke_dof(owner, streakinfo) {
    level endon("nuke_cancelled");
    foreach (player in level.players) {
        player thread nuke_adjustexplosiondof();
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c74
// Size: 0x19
function nuke_adjustexplosiondof() {
    self endon("disconnect");
    self setphysicaldepthoffield(2, 1500);
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c94
// Size: 0x15a
function nuke_vision(owner, streakinfo) {
    level endon("nuke_cancelled");
    level.nukeinfo.var_a8fb915f46a518d9 = 1;
    if (istrue(streakinfo.var_9ed60d0d51f90d76)) {
        return;
    }
    visionsetnaked("nuke_global_flash", 0.05);
    setdvar(@"hash_d18838f3e4b65d16", 0);
    if (issharedfuncdefined("nuke", "hostmigration_waitLongDurationWithPause")) {
        [[ getsharedfunc("nuke", "hostmigration_waitLongDurationWithPause") ]](0.5);
    }
    level notify("nuke_aftermath_post_started");
    level thread nuke_fadeflashvision(1, 2);
    level waittill("nuke_death");
    level thread nuke_updatevisiononhostmigration();
    level nuke_setaftermathvision(5);
    wait(1);
    if (!istrue(level.var_587f8a02a3f577)) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            player setclientomnvar("ui_world_fade", 1);
            level thread namespace_36f464722d326bbe::fadetoblackforplayer(player, 0, 0.25);
        }
    }
    level.nukeinfo.var_a8fb915f46a518d9 = 0;
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2df5
// Size: 0x47
function nuke_fadeflashvision(var_a327466df35c5c88, var_9d7a33ca9811c391) {
    if (issharedfuncdefined("nuke", "hostmigration_waitLongDurationWithPause")) {
        [[ getsharedfunc("nuke", "hostmigration_waitLongDurationWithPause") ]](var_a327466df35c5c88);
    }
    visionsetnaked("", var_9d7a33ca9811c391);
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e43
// Size: 0x4ad
function nuke_death(owner, streakinfo) {
    level endon("nuke_cancelled");
    level endon("game_ended");
    level notify("nuke_death");
    winner = level.nukeinfo.player;
    if (level.teambased) {
        winner = level.nukeinfo.inflictor.team;
    }
    if (issharedfuncdefined("nuke", "hostmigration_waitTillHostMigrationDone")) {
        [[ getsharedfunc("nuke", "hostmigration_waitTillHostMigrationDone") ]]();
    }
    var_cfc1a4c269cffb70 = nuke_cankilleverything();
    if (isdefined(level.nukeinfo.player)) {
        if (level.nukeinfo.nuketype != "nuke_select_location") {
            foreach (character in level.characters) {
                if ([[ getsharedfunc("nuke", "cankill") ]](character, var_cfc1a4c269cffb70)) {
                    if (isplayer(character)) {
                        character.nuked = 1;
                        if (issharedfuncdefined("player", "isReallyAlive")) {
                            if ([[ getsharedfunc("player", "isReallyAlive") ]](character)) {
                                if (!istrue(character.safefromnuke)) {
                                    if (issharedfuncdefined("nuke", "killPlayerWithAttacker")) {
                                        [[ getsharedfunc("nuke", "killPlayerWithAttacker") ]](character);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (istrue(var_cfc1a4c269cffb70)) {
                if (issharedfuncdefined("nuke", "destroyActiveObjects")) {
                    [[ getsharedfunc("nuke", "destroyActiveObjects") ]]();
                }
            } else if (!istrue(level.blocknukekills)) {
                var_b0c33d224b825287 = undefined;
                if (issharedfuncdefined("game", "getEnemyTeams")) {
                    var_b0c33d224b825287 = [[ getsharedfunc("game", "getEnemyTeams") ]](level.nukeinfo.inflictor.team);
                }
                foreach (entry in var_b0c33d224b825287) {
                    if (issharedfuncdefined("nuke", "destroyActiveObjects")) {
                        [[ getsharedfunc("nuke", "destroyActiveObjects") ]](entry);
                    }
                }
            }
            if (issharedfuncdefined("player", "printGameAction")) {
                [[ getsharedfunc("player", "printGameAction") ]]("killstreak ended - nuke", level.nukeinfo.player);
            }
        } else {
            foreach (character in level.characters) {
                isPlayerInRadZone = 0;
                if (issharedfuncdefined("nuke", "isPlayerInRadZone")) {
                    isPlayerInRadZone = [[ getsharedfunc("nuke", "isPlayerInRadZone") ]](character, level.nukeinfo.goalpoint, 25000000);
                }
                if (isPlayerInRadZone) {
                    character.nuked = 1;
                    if ([[ getsharedfunc("player", "isReallyAlive") ]](character)) {
                        if (issharedfuncdefined("nuke", "killPlayer")) {
                            [[ getsharedfunc("nuke", "killPlayer") ]](character);
                        }
                    }
                }
            }
        }
        if (!istrue(level.mercywintriggered)) {
            if (isdefined(level.nukeinfo.player) && isdefined(streakinfo)) {
                level.nukeinfo.player namespace_9abe40d2af041eb2::recordkillstreakendstats(streakinfo);
            }
        }
    }
    if (istrue(var_cfc1a4c269cffb70)) {
        /#
            var_f56513277692f024 = getdvarint(@"hash_aff3efc76e4dfeb2", 1);
            if (!istrue(var_f56513277692f024)) {
                level.nukeinfo.incoming = undefined;
                level.nukeinfo.player = undefined;
                return;
            }
        #/
        while (istrue(level.nukeinfo.var_a8fb915f46a518d9)) {
            waitframe();
        }
        level.nukeinfo.gameover = 1;
        level thread nuke_delayendgame(0, winner);
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32f7
// Size: 0xc4
function function_2f5646d1ef5c8b81(owner, streakinfo) {
    level endon("nuke_cancelled");
    level endon("game_ended");
    level waittill("nuke_last_bomb_launch");
    if (!istrue(streakinfo.var_8b07383e09b74fad)) {
        var_5b4471e9efde87c3 = level.nukeinfo.var_c6773756acf950fd;
        visionsetfadetoblack("nuke_global_flash", var_5b4471e9efde87c3 * 1.75);
    }
    foreach (player in level.players) {
        player setsoundsubmix("jup_kls_mgb", 6);
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33c2
// Size: 0xfc
function function_36fb604b46a1514a(owner, streakinfo) {
    level endon("nuke_cancelled");
    level endon("game_ended");
    level waittill("nuke_last_bomb_impact");
    foreach (player in level.players) {
        player _freezecontrols(1);
    }
    function_e6e629829270e1fa();
    wait(0.05);
    if (!istrue(level.var_587f8a02a3f577)) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            level thread namespace_36f464722d326bbe::fadetoblackforplayer(player, 0, 3);
        }
    }
    level notify("nuke_bomb_slam_white_finished");
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34c5
// Size: 0x150
function function_e361a03e34d52440(owner, streakinfo) {
    level endon("nuke_cancelled");
    level endon("game_ended");
    var_5b4471e9efde87c3 = level.nukeinfo.var_c6773756acf950fd;
    var_d15ea961076c2a0f = var_5b4471e9efde87c3 / 3;
    var_895e3bf2db2f84fb = [0:"far", 1:"mid", 2:"near"];
    for (var_535b30b922b731e1 = 0; var_535b30b922b731e1 < var_895e3bf2db2f84fb.size; var_535b30b922b731e1++) {
        var_f4fa9d362463d738 = "player_mgb_shake_" + var_895e3bf2db2f84fb[var_535b30b922b731e1] + "_mp";
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            player notify("nuke_bomb_next_stage");
            if (!player _isalive()) {
                level thread function_f903c3e8aabfc042(player, var_f4fa9d362463d738, "spawned_player");
            } else if (player isusingremote()) {
                level thread function_f903c3e8aabfc042(player, var_f4fa9d362463d738, "stopped_using_remote");
            } else {
                function_f7348e400b4a608d(player, var_f4fa9d362463d738, 0, 1);
            }
        }
        wait(var_d15ea961076c2a0f);
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x361c
// Size: 0x50
function function_f903c3e8aabfc042(player, var_f4fa9d362463d738, var_4063cdc9b79e33f2) {
    player endon("death_or_disconnect");
    player endon("nuke_bomb_next_stage");
    player endon("nuke_bomb_delayed_earthquake");
    level endon("game_ended");
    player waittill(var_4063cdc9b79e33f2);
    function_f7348e400b4a608d(player, var_f4fa9d362463d738, 0, 1);
    player notify("nuke_bomb_delayed_earthquake");
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3673
// Size: 0xfe
function function_acb30efb36c7f230(owner, streakinfo) {
    level endon("nuke_cancelled");
    level endon("game_ended");
    level waittill("nuke_bomb_slam_white_finished");
    if (getdvarint(@"hash_d5fd9067cafb06b9") == 1) {
        return;
    }
    level notify("nuke_end_game");
    winner = level.nukeinfo.player;
    if (level.teambased) {
        winner = level.nukeinfo.inflictor.team;
    }
    /#
        var_f56513277692f024 = getdvarint(@"hash_aff3efc76e4dfeb2", 1);
        if (!istrue(var_f56513277692f024)) {
            level.nukeinfo.incoming = undefined;
            level.nukeinfo.player = undefined;
            return;
        }
    #/
    level.nukeinfo.gameover = 1;
    level thread nuke_delayendgame(10, winner, 1);
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3778
// Size: 0x62
function nuke_delayendgame(delaytime, winner, var_7db0ffa183f91058, var_3a4c75a01773062c) {
    level endon("game_ended");
    if (istrue(var_7db0ffa183f91058)) {
        level thread function_54a492aef8fd981f(var_3a4c75a01773062c);
    }
    if (issharedfuncdefined("nuke", "delayEndGame")) {
        [[ getsharedfunc("nuke", "delayEndGame") ]](delaytime, winner);
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e1
// Size: 0xb1
function function_54a492aef8fd981f(delaytime) {
    level endon("game_ended");
    if (isdefined(delaytime)) {
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    }
    level notify("play_nuke_bnk");
    setomnvarforallclients("post_game_state", 12);
    level flag_set("nuke_bink_done");
    if (!istrue(level.var_587f8a02a3f577)) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            level thread namespace_36f464722d326bbe::function_852712268d005332(player, 0, 1);
        }
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3899
// Size: 0xff
function nuke_earthquake(owner, streakinfo) {
    level endon("nuke_cancelled");
    var_9798c7aa7c0a8a06 = level.nukeinfo.goalpoint;
    earthquake(0.4, 1.5, var_9798c7aa7c0a8a06, 100000);
    level thread nuke_playshockwaveearthquake(streakinfo);
    level waittill("nuke_death");
    if (level.nukeinfo.nuketype == "nuke_select_location") {
        earthquake(0.3, 1, var_9798c7aa7c0a8a06, 100000);
    } else {
        earthquake(0.7, 3, var_9798c7aa7c0a8a06, 100000);
    }
    foreach (player in level.players) {
        player playrumbleonentity("damage_heavy");
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x399f
// Size: 0x82
function nuke_playshockwaveearthquake(streakinfo) {
    level endon("nuke_cancelled");
    level endon("nuke_death");
    var_9b5ba1713b6db4d = 0.01;
    var_9798c7aa7c0a8a06 = level.nukeinfo.goalpoint;
    while (1) {
        earthquake(var_9b5ba1713b6db4d, 0.05, var_9798c7aa7c0a8a06, 100000);
        wait(0.05);
        var_9b5ba1713b6db4d = var_9b5ba1713b6db4d + 0.0015;
        if (var_9b5ba1713b6db4d >= 0.3) {
            var_9b5ba1713b6db4d = 0.3;
        }
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a28
// Size: 0x24
function onplayerspawned() {
    if (isdefined(level.nukeinfo.detonated)) {
        thread nuke_setvisionforplayer(0, 0);
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a53
// Size: 0x52
function nuke_setvisionforplayer(delaytime, transitiontime) {
    if (isdefined(delaytime) && delaytime > 0) {
        wait(delaytime);
    }
    /#
        var_f56513277692f024 = getdvarint(@"hash_aff3efc76e4dfeb2", 1);
        if (!var_f56513277692f024) {
            return;
        }
    #/
    self visionsetnakedforplayer("nuke_global_aftermath", transitiontime);
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aac
// Size: 0x99
function nuke_updateuitimers(traveltime) {
    level endon("game_ended");
    level endon("disconnect");
    level endon("nuke_cancelled");
    level endon("nuke_death");
    var_ef2f4de95e92eec7 = traveltime * 1000 + gettime();
    setomnvar("ui_nuke_end_milliseconds", var_ef2f4de95e92eec7);
    level waittill("host_migration_begin");
    timepassed = 0;
    if (issharedfuncdefined("nuke", "hostmigration_waitTillHostMigrationDone")) {
        timepassed = [[ getsharedfunc("nuke", "hostmigration_waitLongDurationWithPause") ]]();
    }
    if (timepassed > 0) {
        setomnvar("ui_nuke_end_milliseconds", var_ef2f4de95e92eec7 + timepassed);
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b4c
// Size: 0x23
function nuke_updatevisiononhostmigration() {
    level endon("game_ended");
    while (1) {
        level waittill("host_migration_end");
        level nuke_setaftermathvision(0);
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b76
// Size: 0x6f
function nuke_setaftermathvision(transitiontime) {
    /#
        var_f56513277692f024 = getdvarint(@"hash_aff3efc76e4dfeb2", 1);
        if (!var_f56513277692f024) {
            return;
        }
    #/
    shouldNukeEndGame = 1;
    if (issharedfuncdefined("nuke", "shouldNukeEndGame")) {
        shouldNukeEndGame = [[ getsharedfunc("nuke", "shouldNukeEndGame") ]]();
    }
    if (!shouldNukeEndGame) {
        return;
    }
    function_e6e629829270e1fa();
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bec
// Size: 0x96
function function_e6e629829270e1fa() {
    setomnvarforallclients("post_game_state", 11);
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!istrue(level.var_587f8a02a3f577)) {
            level thread namespace_36f464722d326bbe::fadetoblackforplayer(player, 1);
        }
        player setclienttriggeraudiozonepartialwithfade("nuke_killstreak", 2, "ambient", "ambient_events");
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c89
// Size: 0xc8
function nuke_startnukedeathfx() {
    self endon("disconnect");
    if (!istrue(self.safefromnuke)) {
        if (issharedfuncdefined("weapons", "enableBurnFX")) {
            self [[ getsharedfunc("weapons", "enableBurnFX") ]](1, "nuke_active");
        }
    }
    thread nuke_playrollingdeathfx(3.25);
    level waittill("nuke_death");
    if (isdefined(self.burnfxenabled) && self.burnfxenabled > 0) {
        if (issharedfuncdefined("weapons", "disableBurnFX")) {
            self [[ getsharedfunc("weapons", "disableBurnFX") ]](1, "nuke_active");
        }
    }
    var_367958fe652704c6 = 0;
    /#
        var_367958fe652704c6 = getdvarint(@"hash_7943c6ec7e44f87c", 0);
    #/
    if (var_367958fe652704c6) {
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d58
// Size: 0x7b
function nuke_startnukedeathfx_chooselocationversion() {
    self endon("disconnect");
    if (issharedfuncdefined("weapons", "enableBurnFX")) {
        self [[ getsharedfunc("weapons", "enableBurnFX") ]](1, "nuke_active");
    }
    thread nuke_playrollingdeathfx(3.25);
    level waittill("nuke_death");
    if (issharedfuncdefined("weapons", "disableBurnFX")) {
        self [[ getsharedfunc("weapons", "disableBurnFX") ]](1, "nuke_active");
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dda
// Size: 0xb2
function nuke_playrollingdeathfx(delaytime) {
    self endon("disconnect");
    if (issharedfuncdefined("nuke", "hostmigration_waitLongDurationWithPause")) {
        [[ getsharedfunc("nuke", "hostmigration_waitLongDurationWithPause") ]](delaytime);
    }
    if (!isusingremote()) {
        self visionsetnakedforplayer("nuke_deathblur", 4);
    }
    var_65dfd5b2ea1f9b40 = self.origin;
    var_7ceeea837b3cd54a = level.nukeinfo.goalpoint;
    var_74af035d1495d131 = var_65dfd5b2ea1f9b40;
    bodyFX = "nuke_rolling_death";
    playfx(getfx(bodyFX), var_65dfd5b2ea1f9b40, var_7ceeea837b3cd54a - var_74af035d1495d131, undefined, self);
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e93
// Size: 0x2cb
function nuke_atomizebody() {
    self endon("disconnect");
    loc[0][0]["org"] = self gettagorigin("j_spineupper");
    loc[0][0]["angles"] = self gettagangles("j_spineupper");
    loc[0][1]["org"] = self gettagorigin("j_spinelower");
    loc[0][1]["angles"] = self gettagangles("j_spinelower");
    loc[0][2]["org"] = self gettagorigin("j_head");
    loc[0][2]["angles"] = self gettagangles("j_head");
    loc[1][0]["org"] = self gettagorigin("j_knee_ri");
    loc[1][0]["angles"] = self gettagangles("j_knee_ri");
    loc[1][1]["org"] = self gettagorigin("j_knee_le");
    loc[1][1]["angles"] = self gettagangles("j_knee_le");
    loc[1][2]["org"] = self gettagorigin("j_elbow_ri");
    loc[1][2]["angles"] = self gettagangles("j_elbow_ri");
    loc[1][3]["org"] = self gettagorigin("j_elbow_le");
    loc[1][3]["angles"] = self gettagangles("j_elbow_le");
    loc[2][0]["org"] = self gettagorigin("j_ankle_le");
    loc[2][0]["angles"] = self gettagangles("j_ankle_le");
    loc[2][1]["org"] = self gettagorigin("j_ankle_ri");
    loc[2][1]["angles"] = self gettagangles("j_ankle_ri");
    loc[2][2]["org"] = self gettagorigin("j_wrist_le");
    loc[2][2]["angles"] = self gettagangles("j_wrist_le");
    loc[2][3]["org"] = self gettagorigin("j_wrist_ri");
    loc[2][3]["angles"] = self gettagangles("j_wrist_ri");
    self.body hide();
    var_65dfd5b2ea1f9b40 = self.body.origin;
    var_632c8e583fc9aea9 = level.nukeinfo.inflictor.origin * (1, 1, 0);
    var_74af035d1495d131 = var_65dfd5b2ea1f9b40 * (1, 1, 0);
    bodyFX = "nuke_atomize_body";
    playfx(getfx(bodyFX), var_65dfd5b2ea1f9b40, var_632c8e583fc9aea9 - var_74af035d1495d131);
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4165
// Size: 0x27
function nuke_cankilleverything() {
    var_cfc1a4c269cffb70 = 1;
    if (getdvarint(@"hash_d5fd9067cafb06b9") == 1) {
        return 0;
    }
    return var_cfc1a4c269cffb70;
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4194
// Size: 0x254
function nuke_createradiationzone(owner, streakinfo) {
    if (!iscp()) {
        if (0) {
            wait(10);
            playfx(getfx("vfx_nuke_zone_5000_static_s"), (0, 0, 0));
            nuke_registerradzone((0, 0, 0));
            if (!isdefined(level.nukedangerzones)) {
                level.nukedangerzones = [];
            }
            level.nukedangerzones[level.nukedangerzones.size] = [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](level.nukeinfo.goalpoint - (0, 0, 1000), 5000, 15000, "axis", 4000);
            level.nukedangerzones[level.nukedangerzones.size] = [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](level.nukeinfo.goalpoint - (0, 0, 1000), 5000, 15000, "allies", 4000);
        } else {
            streakinfo.sealevelorigin = (level.nukeinfo.goalpoint[0], level.nukeinfo.goalpoint[1], namespace_5078ee98abb32db9::getc130sealevel());
            playfx(getfx("vfx_nuke_zone_5000_static_s"), streakinfo.sealevelorigin);
            nuke_registerradzone(streakinfo.sealevelorigin);
            if (!isdefined(level.nukedangerzones)) {
                level.nukedangerzones = [];
            }
            level.nukedangerzones[level.nukedangerzones.size] = [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](level.nukeinfo.goalpoint - (0, 0, 1000), 5000, 15000, "axis", 4000);
            level.nukedangerzones[level.nukedangerzones.size] = [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](level.nukeinfo.goalpoint - (0, 0, 1000), 5000, 15000, "allies", 4000);
        }
    }
    thread nuke_finalizelocationnuke(owner);
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43ef
// Size: 0x42
function nuke_registerradzone(origin) {
    if (!isdefined(level.radzones)) {
        level.radzones = [];
        level thread nuke_radzones_think();
    }
    level.radzones[level.radzones.size] = origin;
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4438
// Size: 0x25
function nuke_removeradzone(var_b8d14e966ac9d9b8) {
    level.radzones = array_remove(level.radzones, var_b8d14e966ac9d9b8);
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4464
// Size: 0x241
function nuke_radzones_think() {
    level endon("game_ended");
    damagetick = 10;
    while (1) {
        foreach (player in level.players) {
            player.inradzone = 0;
            foreach (var_456b8f0ea933d0e5 in level.radzones) {
                isPlayerInRadZone = 0;
                if (issharedfuncdefined("nuke", "isPlayerInRadZone")) {
                    isPlayerInRadZone = [[ getsharedfunc("nuke", "isPlayerInRadZone") ]](player, var_456b8f0ea933d0e5, 25000000);
                }
                if (isPlayerInRadZone) {
                    if (istrue(player.gasmaskequipped)) {
                        player namespace_9c6cddd872ad75f7::processdamage(damagetick);
                    } else {
                        if (issharedfuncdefined("game", "tutorialPrint")) {
                            player thread [[ getsharedfunc("game", "tutorialPrint") ]]("MP/NUKE_RADIATION_HURT", 2);
                        }
                        player dodamage(damagetick, player.origin, player, undefined, "MOD_TRIGGER_HURT");
                    }
                    player.inradzone = 1;
                    break;
                }
            }
            if (player.inradzone) {
                continue;
            }
            foreach (var_456b8f0ea933d0e5 in level.radzones) {
                isPlayerInRadZone = 0;
                if (issharedfuncdefined("nuke", "isPlayerInRadZone")) {
                    isPlayerInRadZone = [[ getsharedfunc("nuke", "isPlayerInRadZone") ]](player, var_456b8f0ea933d0e5, 36000000);
                }
                if (isPlayerInRadZone) {
                    if (issharedfuncdefined("game", "tutorialPrint")) {
                        player thread [[ getsharedfunc("game", "tutorialPrint") ]]("MP/NUKE_RADIATION_WARNING", 2);
                    }
                    break;
                }
            }
        }
        wait(1);
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46ac
// Size: 0xaa
function nuke_warnenemiesnukeincoming(var_9464d7d05c5ca6b5) {
    level endon("nuke_death");
    while (1) {
        foreach (player in level.players) {
            if (player.team == var_9464d7d05c5ca6b5) {
                if (issharedfuncdefined("game", "tutorialPrint")) {
                    player thread [[ getsharedfunc("game", "tutorialPrint") ]]("MP/NUKE_SELECT_LAUNCH_DETECTED", 2);
                }
            }
        }
        wait(1);
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x475d
// Size: 0x54
function nuke_finalizelocationnuke(owner) {
    wait(20);
    if (istrue(owner.hasnukeselectks)) {
        owner.hasnukeselectks = 0;
    }
    if (isdefined(owner.killcountthislife)) {
        owner.killcountthislife = 0;
    }
    visionsetnaked("", 1);
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47b8
// Size: 0x40
function nuke_abortkillcamonspawn() {
    level endon("game_ended");
    while (1) {
        player = level waittill("player_spawned");
        if (isdefined(player)) {
            player notify("abort_killcam");
            player.cancelkillcam = 1;
        }
    }
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47ff
// Size: 0xd4
function function_b913fa4052092442(nuketype, var_d3af29b5dbd3ac10) {
    goalpoint = self.origin + anglestoforward(self.angles) * 15000;
    if (isdefined(level.nuke_expl_struct)) {
        goalpoint = level.nuke_expl_struct.origin;
    }
    if (nuketype == "nuke_multi") {
        goalpoint = level.mapcenter;
        if (islargemap()) {
            if (level.gametype == "arm" || level.gametype == "conflict" || level.gametype == "gwtdm") {
                if (isdefined(level.hqmidpoint)) {
                    goalpoint = level.hqmidpoint;
                }
            }
        }
    }
    if (isdefined(var_d3af29b5dbd3ac10)) {
        goalpoint = var_d3af29b5dbd3ac10;
    }
    return goalpoint;
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48db
// Size: 0x108
function function_5e29f303004c9602(nuketype, goalpoint, var_edbe27b2d5f1e060) {
    var_b0d1c69e44f250ec = goalpoint + (0, 0, 30000) + anglestoforward(self.angles) * 30000;
    if (nuketype == "nuke_multi") {
        var_b0d1c69e44f250ec = goalpoint + (0, 0, 15000) + anglestoforward(self.angles) * 15000;
    } else if (isdefined(level.nuke_expl_struct)) {
        var_48a3e962b69604ac = vectornormalize((goalpoint[0], goalpoint[1], 0) - (self.origin[0], self.origin[1], 0));
        var_b0d1c69e44f250ec = goalpoint + var_48a3e962b69604ac * 15000;
        var_b0d1c69e44f250ec = var_b0d1c69e44f250ec + (0, 0, 30000) + var_48a3e962b69604ac * 5000;
    } else if (nuketype != "nuke_select_location") {
        /#
            self iprintlnbold("script_origin");
        #/
    }
    if (isdefined(var_edbe27b2d5f1e060)) {
        var_ffb179778403bed7 = var_edbe27b2d5f1e060;
    }
    return var_b0d1c69e44f250ec;
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49eb
// Size: 0x45
function function_4eb440a17165aeee(nuketype, starttime, var_4f5531954a808b12) {
    var_51bee2f5b3b4e278 = starttime;
    if (istrue(level.mercywintriggered)) {
        var_51bee2f5b3b4e278 = 0.7;
    }
    if (isdefined(var_4f5531954a808b12)) {
        var_51bee2f5b3b4e278 = var_4f5531954a808b12;
    }
    return var_51bee2f5b3b4e278;
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a38
// Size: 0x31
function function_cd3712661b44dfb(nuketype, var_5b4471e9efde87c3, var_3dabfa23bef362b5) {
    var_960e367a86646a43 = var_5b4471e9efde87c3;
    if (isdefined(var_3dabfa23bef362b5)) {
        var_960e367a86646a43 = var_3dabfa23bef362b5;
    }
    return var_960e367a86646a43;
}

// Namespace nuke/namespace_670e1516d92a7a2b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a71
// Size: 0x3e
function function_e6e5495e21e67613(nuketype, weaponoverride) {
    baseweapon = "nuke_mp";
    if (nuketype == "nuke_multi") {
        baseweapon = "nuke_multi_mp";
    }
    if (isdefined(weaponoverride)) {
        baseweapon = weaponoverride;
    }
    return baseweapon;
}

