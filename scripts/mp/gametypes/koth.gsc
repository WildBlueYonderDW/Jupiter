// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\spawnfactor.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\gametypes\obj_zonecapture.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_26508f2de04c7a52;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\flags.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\hud_message.gsc;
#using script_548072087c9fd504;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\grnd.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\callouts.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\gamescore.gsc;

#namespace koth;

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc9f
// Size: 0x38a
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    if (namespace_36f464722d326bbe::function_2d79a7a3b91c4c3e()) {
        allowed = namespace_afbc0aa1b551667a::function_7b7c572755736c13();
    } else {
        allowed[0] = getgametype();
        allowed[1] = "hardpoint";
        allowed[2] = "tdm";
    }
    if (namespace_36f464722d326bbe::function_21322da268e71c19() || level.var_ec2fb549b15ad827) {
        allowed[0] = namespace_cd0b2d039510b38d::function_60bf8d82001fc22c();
    }
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registertimelimitdvar(getgametype(), 300);
        registerscorelimitdvar(getgametype(), 300);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    updategametypedvars();
    level.hpstarttime = 0;
    level.scoreperplayer = undefined;
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.var_952bd6e10104d8a = &function_952bd6e10104d8a;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.modeonspawnplayer = &onspawnplayer;
    level.onplayerkilled = &onplayerkilled;
    level.onrespawndelay = &getrespawndelay;
    level.lastcaptime = gettime();
    level.usezonecapture = 1;
    level.getkothzonedeadzonedist = &getkothzonedeadzonedist;
    level.onplayerjoinedteam = &namespace_8276d48525f0f398::onplayerjoinedteam;
    level.disablebuddyspawn = 1;
    if (isanymlgmatch()) {
        level.ontimelimit = &function_1134d3068749d68e;
    }
    level.lastcaptureteam = undefined;
    level.previousclosespawnent = undefined;
    setomnvar("ui_hq_num_alive", 0);
    setomnvar("ui_hq_ownerteam", -1);
    if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
        game["dialog"]["gametype"] = "dx_mp_hphc_mode_t141_name";
    } else {
        game["dialog"]["gametype"] = "dx_mp_hard_game_uktl_name";
    }
    game["dialog"]["boost"] = "dx_mp_hard_game_uktl_bost";
    game["dialog"]["offense_obj"] = "dx_mp_hard_game_uktl_bost";
    game["dialog"]["defense_obj"] = "dx_mp_hard_game_uktl_bost";
    game["dialog"]["obj_destroyed"] = "obj_destroyed";
    game["dialog"]["obj_captured"] = "obj_captured";
    game["dialog"]["hp_first"] = "dx_mp_hard_game_uktl_hpo1";
    game["dialog"]["hp_new_location"] = "dx_mp_hard_game_uktl_hpnl";
    game["dialog"]["hp_captured_enemy"] = "dx_mp_hard_game_uktl_hpec";
    game["dialog"]["hp_captured_friendly"] = "dx_mp_hard_game_uktl_hpfc";
    game["dialog"]["hp_contested"] = "dx_mp_hard_game_uktl_hpct";
    game["dialog"]["hp_move_soon"] = "dx_mp_hard_game_uktl_hpmv";
    game["dialog"]["hp_capturing_enemy"] = "dx_mp_hard_game_uktl_ecip";
    game["dialog"]["hp_capturing_friendly"] = "dx_mp_hard_game_uktl_fcip";
    level.nosuspensemusic = 1;
    thread writeplayerrotationscoretomatchdataongameend();
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        namespace_afbc0aa1b551667a::function_29020e26e20049d9();
    }
    /#
        if (getdvarint(@"hash_3288df25c3558e8d", 0)) {
            level thread function_97b50111eebb7239();
        }
    #/
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1030
// Size: 0x169
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(function_3514ae5d09f47ed2("zoneLifetime"), getmatchrulesdata("kothData", "zoneLifetime"));
    setdynamicdvar(function_3514ae5d09f47ed2("zoneCaptureTime"), getmatchrulesdata("kothData", "zoneCaptureTime"));
    setdynamicdvar(function_3514ae5d09f47ed2("firstZoneActivationDelay"), getmatchrulesdata("kothData", "firstZoneActivationDelay"));
    setdynamicdvar(function_3514ae5d09f47ed2("zoneActivationDelay"), getmatchrulesdata("kothData", "zoneActivationDelay"));
    setdynamicdvar(function_3514ae5d09f47ed2("nextZoneRevealTime"), getmatchrulesdata("kothData", "nextZoneRevealTime"));
    setdynamicdvar(function_3514ae5d09f47ed2("zoneMajorityCapture"), getmatchrulesdata("kothData", "zoneMajorityCapture"));
    setdynamicdvar(function_3514ae5d09f47ed2("randomLocationOrder"), getmatchrulesdata("kothData", "randomLocationOrder"));
    setdynamicdvar(function_3514ae5d09f47ed2("additiveScoring"), getmatchrulesdata("kothData", "additiveScoring"));
    setdynamicdvar(function_3514ae5d09f47ed2("pauseTime"), getmatchrulesdata("kothData", "pauseTime"));
    setdynamicdvar(function_3514ae5d09f47ed2("spawnDelay"), getmatchrulesdata("kothData", "spawnDelay"));
    setdynamicdvar(function_3514ae5d09f47ed2("halftime"), 0);
    registerhalftimedvar("koth", 0);
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a0
// Size: 0x14b
function onstartgametype() {
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/KOTH");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/KOTH");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/KOTH_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/KOTH_HINT");
    }
    if (level.scoremod["kill"] > 0) {
        game["dialog"]["offense_obj"] = "boost_groundwar";
        game["dialog"]["defense_obj"] = "boost_groundwar";
    }
    setclientnamemode("auto_change");
    level thread setupzones();
    initspawns();
    setkothwaypoints();
    seticonnames();
    if (!level.zonerandomlocationorder) {
        remaphardpointorder();
    }
    level thread function_fab770bfe4b14e75();
    level thread hardpointmainloop();
    /#
        level thread function_1f98c5616d8b3d67();
        level thread function_bed0f399bee034f8();
        level thread function_ef4f5aa9c42838b2();
        level thread function_be67fb2ebcca86d1();
        level thread function_b4c2563f73b02c80();
    #/
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12f2
// Size: 0x28
function private function_952bd6e10104d8a() {
    if (level.scoremod["kill"] > 0) {
        setdvar(@"hash_cf1c084c7a6622f9", 2);
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1321
// Size: 0x181
function updategametypedvars() {
    updatecommongametypedvars();
    level.zoneduration = dvarfloatvalue("zoneLifetime", 60, 0, 300);
    level.zonecapturetime = dvarfloatvalue("zoneCaptureTime", 0, 0, 30);
    level.firstzoneactivationdelay = dvarfloatvalue("firstZoneActivationDelay", 30, 0, 60);
    level.zoneactivationdelay = dvarfloatvalue("zoneActivationDelay", 0, 0, 60);
    level.nextZoneRevealTime = dvarfloatvalue("nextZoneRevealTime", 12, 0, 300);
    level.zoneMajorityCapture = dvarintvalue("zoneMajorityCapture", 0, 0, 1);
    level.zonerandomlocationorder = dvarintvalue("randomLocationOrder", 0, 0, 1);
    level.zoneadditivescoring = dvarintvalue("additiveScoring", 0, 0, 1);
    level.pausemodetimer = dvarintvalue("pauseTime", 1, 0, 1);
    level.spawndelay = dvarfloatvalue("spawnDelay", 0, 0, 10);
    if (matchmakinggame() && !isanymlgmatch() && getdvarint(@"hash_56937a1bd450393d", 15) != 0) {
        level.zoneactivationdelay = adjustzoneactivationdelayforlargemaps();
    }
    /#
        assertex(level.zoneduration >= level.nextZoneRevealTime, "The reveal time of a zone must not be greater than the lifetime of the zone.");
    #/
    if (level.zoneduration < level.nextZoneRevealTime) {
        level.nextZoneRevealTime = level.zoneduration;
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a9
// Size: 0x88
function adjustzoneactivationdelayforlargemaps() {
    mapname = namespace_36f464722d326bbe::getmapname();
    switch (mapname) {
    case #"hash_62c07791a2eda185":
    case #"hash_f09747c9feb47eb1":
    case #"hash_fcab5810ee4c6dc2":
        return getdvarint(@"hash_56937a1bd450393d", 15);
    case #"hash_a8b272dba33a4aed":
        return (getdvarint(@"hash_56937a1bd450393d", 15) + 15);
    default:
        return level.zoneactivationdelay;
        break;
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1538
// Size: 0x81
function seticonnames() {
    level.icontarget = "koth_target";
    level.iconneutral = "koth_neutral";
    level.iconcapture = "koth_destroy";
    level.icondefend = "koth_defend";
    level.iconcontested = "koth_contested";
    level.icontaking = "koth_taking";
    level.iconlosing = "koth_losing";
    level.icondefending = "koth_defending";
    level.var_7520a0fc17909b95 = "koth_next";
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c0
// Size: 0x526
function hardpointmainloop() {
    level endon("game_ended");
    setomnvar("ui_objective_timer_stopped", 1);
    setomnvar("ui_hardpoint_timer", 0);
    level.zone = getfirstzone();
    var_2afaf68657598b47 = 1;
    level.var_bf918fc5f938cd0c = 1;
    level.kothhillrotation = 0;
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level waittill_any_2("prematch_done", "start_mode_setup");
    }
    level.favorclosespawnent = level.zone;
    logannouncement(undefined, undefined, "New Hardpoint", level.zone.trigger.origin);
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.player = level.zone;
    var_7e2c53b0bcf117d9.eventname = "hill_moved";
    var_7e2c53b0bcf117d9.position = level.zone.trigger.origin;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
    playsoundatpos(level.zone.trigger.origin, "jup_shared_zone_spawned");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (level.pausemodetimer) {
        level namespace_d576b6dc7cef9c62::pausetimer();
    }
    setomnvar("ui_objective_timer_stopped", 0);
    level.zone namespace_8276d48525f0f398::activatezone();
    level.zone namespace_19b4203b51d56488::setvisibleteam("any");
    level.zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icontarget);
    level.zone.active = 1;
    var_570ba02607c0425c = 0;
    if (level.firstzoneactivationdelay) {
        var_570ba02607c0425c = 1;
        level.zoneendtime = int(gettime() + level.firstzoneactivationdelay * 1000);
        if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
            level.var_a18063a06c258143 = int(gettime() + (level.firstzoneactivationdelay + level.zoneduration) * 1000);
        }
        setomnvar("ui_hardpoint_timer", level.zoneendtime);
        setomnvar("ui_hq_status", 12);
        level.zoneislocked = 1;
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(undefined, "koth_control", "koth_control");
        playsoundatpos(level.zone.curorigin, "jup_shared_zone_activate");
        level thread waitthenplaynewobj();
        level.zone thread namespace_19b4203b51d56488::function_d36dcacac1708708(level.firstzoneactivationdelay);
        wait(level.firstzoneactivationdelay);
        level.zoneislocked = 0;
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(undefined, "koth_capture", "koth_capture");
        playsoundatpos(level.zone.curorigin, "jup_shared_zone_activated");
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(5, "free");
    }
    level.zone notify("stop_watching_first_trigger");
    while (1) {
        if (!isdefined(level.mapcalloutsready)) {
            level thread setupzonecallouts(var_2afaf68657598b47);
        }
        level.objectivesetorder = 1;
        if (level.pausemodetimer) {
            level namespace_d576b6dc7cef9c62::resumetimer();
        }
        waittillframeend();
        level.zone namespace_19b4203b51d56488::enableobject();
        level.zone.capturecount = 0;
        if (level.codcasterenabled) {
            level.zone thread namespace_8276d48525f0f398::trackgametypevips();
        }
        spawnlogic::clearlastteamspawns();
        function_79cef04e7bd8c4c7(var_570ba02607c0425c, var_2afaf68657598b47);
        var_2afaf68657598b47 = 0;
        var_570ba02607c0425c = 0;
        level.var_bf918fc5f938cd0c = 0;
        setomnvar("ui_hq_status", 10);
        spawnlogic::clearlastteamspawns();
        hpcaptureloop();
        ownerteam = level.zone namespace_19b4203b51d56488::getownerteam();
        if (level.pausemodetimer) {
            level namespace_d576b6dc7cef9c62::resumetimer();
        }
        level.lastcaptureteam = undefined;
        level.zone killhardpointvfx();
        level.zone.active = 0;
        if (istrue(level.usehpzonebrushes)) {
            foreach (player in level.players) {
                level.zone namespace_8276d48525f0f398::hideplayerspecificbrushes(player);
            }
        }
        level.zone namespace_19b4203b51d56488::disableobject();
        level.zone namespace_19b4203b51d56488::allowuse("none");
        level.zone namespace_19b4203b51d56488::setownerteam("neutral");
        updateservericons("zone_shift", 0);
        level notify("zone_reset");
        setomnvar("ui_hq_status", -1);
        spawn_next_zone();
        if (getgametype() == "grnd" && level.kothhillrotation == 1) {
        }
        wait(1);
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aed
// Size: 0x79
function waitthenplaynewobj() {
    if (istrue(level.infilvotiming)) {
        wait(9.5);
    } else {
        wait(7);
    }
    foreach (entry in level.teamnamelist) {
        namespace_944ddf7b8df1b0e3::statusdialog("hp_first", entry);
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6d
// Size: 0x13b
function killhardpointvfx() {
    foreach (player in level.players) {
        foreach (var_25ac26fac33ac6f3 in player._hardpointeffect) {
            player._hardpointeffect = array_remove(player._hardpointeffect, var_25ac26fac33ac6f3);
            if (isdefined(var_25ac26fac33ac6f3)) {
                var_25ac26fac33ac6f3 delete();
            }
        }
    }
    if (isdefined(self.neutralhardpointfx) && self.neutralhardpointfx.size > 0) {
        foreach (var_25ac26fac33ac6f3 in self.neutralhardpointfx) {
            var_25ac26fac33ac6f3 delete();
        }
    }
    self.neutralhardpointfx = [];
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1caf
// Size: 0x3
function remaphardpointorder() {
    
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb9
// Size: 0xa3
function getfirstzone() {
    if (isdefined(level.remappedhpzoneorder)) {
        zone = level.objectives[level.remappedhpzoneorder[0]];
        level.prevzoneindex = 0;
        level.var_fbb04ff4ffa6d364 = level.objectives[level.remappedhpzoneorder[1]];
    } else {
        zone = level.objectives["1"];
        level.prevzoneindex = 1;
        level.var_fbb04ff4ffa6d364 = level.objectives["2"];
    }
    zone.trigger namespace_3c37cb17ade254d::trigger_on();
    return zone;
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d64
// Size: 0x521
function getnextzone() {
    level notify("stop_watching_trigger");
    if (level.zonerandomlocationorder) {
        var_bcadda10e825a297 = [];
        foreach (entry in level.teamnamelist) {
            var_bcadda10e825a297[entry] = (0, 0, 0);
        }
        var_cfd9fb898b8a8fde = getpotentiallivingplayers();
        foreach (player in var_cfd9fb898b8a8fde) {
            if (player.team == "spectator") {
                continue;
            }
            var_bcadda10e825a297[player.team] = var_bcadda10e825a297[player.team] + player.origin;
        }
        var_f95feb63c772e28f = [];
        foreach (entry in level.teamnamelist) {
            players = getteamdata(entry, "players");
            teamsize = max(players.size, 1);
            var_f95feb63c772e28f[entry] = var_bcadda10e825a297[entry] / teamsize;
        }
        if (!isdefined(level.prevzonelist) || isdefined(level.prevzonelist) && level.prevzonelist.size == level.objectives.size - 1) {
            level.prevzonelist = [];
        }
        level.prevzonelist[level.prevzonelist.size] = level.prevzoneindex;
        var_c5746701a936226c = 0.7;
        var_1062b157c642e6b7 = 0.3;
        var_36710543fbaa2aaf = undefined;
        var_94ccba012b7736a = undefined;
        foreach (objective in level.objectives) {
            skip = 0;
            foreach (zoneindex in level.prevzonelist) {
                if (objective.objectivekey == string(zoneindex)) {
                    skip = 1;
                    break;
                }
            }
            if (skip) {
                continue;
            }
            zone = objective;
            var_4e58252555a3aca1 = 0;
            foreach (entry in level.teamnamelist) {
                var_4e58252555a3aca1 = var_4e58252555a3aca1 + distance2dsquared(zone.curorigin, var_f95feb63c772e28f[entry]);
            }
            var_5a8b9d38b749dae2 = distance2dsquared(zone.curorigin, level.zone.curorigin);
            var_d552c16abf741bf4 = var_4e58252555a3aca1 * var_c5746701a936226c + var_5a8b9d38b749dae2 * var_1062b157c642e6b7;
            if (!isdefined(var_94ccba012b7736a) || var_d552c16abf741bf4 > var_94ccba012b7736a) {
                var_94ccba012b7736a = var_d552c16abf741bf4;
                var_36710543fbaa2aaf = objective.objectivekey;
            }
        }
        zone = level.objectives[var_36710543fbaa2aaf];
        level.prevzoneindex = var_36710543fbaa2aaf;
    } else if (isdefined(level.remappedhpzoneorder)) {
        level.prevzoneindex++;
        if (level.prevzoneindex > level.remappedhpzoneorder.size - 1) {
            level.prevzoneindex = 0;
        }
        zone = level.objectives[level.remappedhpzoneorder[level.prevzoneindex]];
        var_fbb04ff4ffa6d364 = level.prevzoneindex + 1;
        if (var_fbb04ff4ffa6d364 > level.remappedhpzoneorder.size - 1) {
            var_fbb04ff4ffa6d364 = 0;
        }
        level.var_fbb04ff4ffa6d364 = level.objectives[level.remappedhpzoneorder[var_fbb04ff4ffa6d364]];
    } else {
        level.prevzoneindex++;
        if (level.prevzoneindex > level.objectives.size) {
            level.prevzoneindex = 1;
        }
        zone = level.objectives[string(level.prevzoneindex)];
        var_fbb04ff4ffa6d364 = level.prevzoneindex + 1;
        if (var_fbb04ff4ffa6d364 > level.objectives.size) {
            var_fbb04ff4ffa6d364 = 1;
        }
        level.var_fbb04ff4ffa6d364 = level.objectives[string(var_fbb04ff4ffa6d364)];
    }
    return zone;
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228d
// Size: 0x186
function spawn_next_zone() {
    writecurrentrotationteamscore();
    level.zone namespace_8276d48525f0f398::deactivatezone();
    level.zone = getnextzone();
    level.kothhillrotation++;
    level.zone namespace_8276d48525f0f398::activatezone();
    level.favorclosespawnent = level.zone;
    level.zone.active = 1;
    level.zone.lastactivatetime = gettime();
    if (level.zoneactivationdelay > 0) {
        level.zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icontarget);
    } else {
        level.zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
    }
    logannouncement(undefined, undefined, "New Hardpoint", level.zone.trigger.origin);
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.player = level.zone;
    var_7e2c53b0bcf117d9.eventname = "hill_moved";
    var_7e2c53b0bcf117d9.position = level.zone.trigger.origin;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
    playsoundatpos(level.zone.trigger.origin, "jup_shared_zone_spawned");
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x241a
// Size: 0x367
function function_79cef04e7bd8c4c7(var_570ba02607c0425c, var_2afaf68657598b47) {
    if (var_2afaf68657598b47) {
        foreach (entry in level.teamnamelist) {
            namespace_944ddf7b8df1b0e3::statusdialog("obj_generic_capture", entry);
        }
    } else {
        foreach (entry in level.teamnamelist) {
            namespace_944ddf7b8df1b0e3::statusdialog("hp_new_location", entry);
        }
    }
    /#
        if (!isdefined(level.zone)) {
            /#
                assertmsg("hp_capturing_enemy");
            #/
            level waittill("_b");
        }
    #/
    if (isdefined(level.zone.curorigin)) {
        playsoundatpos(level.zone.curorigin, "jup_shared_zone_activated");
    }
    thread namespace_3bde6869e44a2770::headquarters_newhq_music();
    level.zone thread namespace_8276d48525f0f398::hardpoint_setneutral();
    level.zone namespace_19b4203b51d56488::allowuse("none");
    if (istrue(var_570ba02607c0425c)) {
        goto LOC_0000027f;
    }
    if (level.zoneactivationdelay) {
        level.zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icontarget);
        updateservericons("zone_activation_delay", 0);
        level.zoneendtime = int(gettime() + 1000 * level.zoneactivationdelay);
        setomnvar("ui_hardpoint_timer", level.zoneendtime);
        setomnvar("ui_hq_status", 12);
        if (level.pausemodetimer) {
            level namespace_d576b6dc7cef9c62::pausetimer();
        }
        level.zoneislocked = 1;
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(undefined, "koth_control", "koth_control");
        level.zone thread namespace_19b4203b51d56488::function_d36dcacac1708708(level.zoneactivationdelay);
        wait(level.zoneactivationdelay);
        level.zoneislocked = 0;
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(undefined, "koth_capture", "koth_capture");
        playsoundatpos(level.zone.trigger.origin, "jup_shared_zone_activated");
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(5, "free");
    LOC_0000027f:
    }
LOC_0000027f:
    objid = namespace_5a22b6f3a56f7e9b::function_92a696fa5918eca5(1);
    level.var_fbb04ff4ffa6d364 namespace_19b4203b51d56488::setvisibleteam("none", objid);
    level.zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
    updateservericons("neutral", 0);
    if (level.zoneduration) {
        updateservericons("neutral", 0);
        thread movezoneaftertime(level.zoneduration);
        level.zoneendtime = int(gettime() + 1000 * level.zoneduration);
        setomnvar("ui_hardpoint_timer", level.zoneendtime);
        if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
            level.var_a18063a06c258143 = int(gettime() + (level.zoneactivationdelay + level.zoneduration) * 1000);
        }
    } else {
        level.zonedestroyedbytimer = 0;
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2788
// Size: 0x17a
function hpcaptureloop() {
    level endon("game_ended");
    level endon("zone_moved");
    level.hpstarttime = gettime();
    while (1) {
        level.zone namespace_19b4203b51d56488::allowuse("enemy");
        level.zone namespace_19b4203b51d56488::setvisibleteam("any");
        level.zone namespace_19b4203b51d56488::setusetext("MP/SECURING_POSITION");
        level.zone thread namespace_8276d48525f0f398::hardpoint_setneutral();
        level.zone namespace_19b4203b51d56488::cancontestclaim(1);
        if (isdefined(level.matchrules_droptime) && level.matchrules_droptime) {
            level thread namespace_36b7108419a0e401::randomdrops();
        }
        msg = level waittill_any_return_2("zone_captured", "zone_destroyed");
        if (msg == "zone_destroyed") {
            continue;
        }
        ownerteam = level.zone namespace_19b4203b51d56488::getownerteam();
        namespace_a34451ae3d453e::playsoundonplayers("mp_hardpoint_captured_positive", ownerteam);
        namespace_a34451ae3d453e::playsoundonplayers("mp_hardpoint_captured_negative", getotherteam(ownerteam)[0]);
        destroy_team = level waittill("zone_destroyed");
        if (isdefined(destroy_team)) {
            level.zone namespace_19b4203b51d56488::setownerteam(destroy_team);
        } else {
            level.zone namespace_19b4203b51d56488::setownerteam("none");
            playsoundatpos(level.zone.trigger.origin, "jup_shared_zone_neutral_ping");
        }
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2909
// Size: 0x39e
function initspawns() {
    if (!spawnlogic::function_bff229a11ecd1e34()) {
        spawnlogic::setactivespawnlogic("Default", "Crit_Default", 1);
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    var_6170ec00c4bc9b5b = "koth";
    if (spawnlogic::function_b17bf43316b9fb08(var_6170ec00c4bc9b5b)) {
        spawnlogic::function_afe4709b818e7c9e(var_6170ec00c4bc9b5b);
    } else {
        spawnlogic::addstartspawnpoints("mp_koth_spawn_allies_start");
        spawnlogic::addstartspawnpoints("mp_koth_spawn_axis_start");
        spawnlogic::addspawnpoints(game["attackers"], "mp_koth_spawn_allies_start");
        spawnlogic::addspawnpoints(game["defenders"], "mp_koth_spawn_axis_start");
        attackers = spawnlogic::getspawnpointarray("mp_koth_spawn_allies_start");
        defenders = spawnlogic::getspawnpointarray("mp_koth_spawn_axis_start");
        spawnlogic::registerspawnset("start_attackers", attackers);
        spawnlogic::registerspawnset("start_defenders", defenders);
        spawnlogic::addspawnpoints("allies", "mp_koth_spawn", 1);
        spawnlogic::addspawnpoints("axis", "mp_koth_spawn", 1);
        spawnlogic::addspawnpoints("allies", "mp_koth_spawn_secondary", 1, 1);
        spawnlogic::addspawnpoints("axis", "mp_koth_spawn_secondary", 1, 1);
        spawnlogic::registerspawnset("primary", spawnlogic::getspawnpointarray("mp_koth_spawn"));
        spawnlogic::registerspawnset("fallback", spawnlogic::getspawnpointarray("mp_koth_spawn_secondary"));
        if (!isdefined(level.spawnpoints)) {
            spawnlogic::addspawnpoints("allies", "mp_tdm_spawn");
            spawnlogic::addspawnpoints("axis", "mp_tdm_spawn");
            spawnlogic::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
            spawnlogic::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
            var_3c9c79460e7aee38 = spawnlogic::getspawnpointarray("mp_tdm_spawn");
            var_3d83bc62b320d11a = spawnlogic::getspawnpointarray("mp_tdm_spawn_secondary");
            spawnlogic::registerspawnset("primary", var_3c9c79460e7aee38);
            spawnlogic::registerspawnset("fallback", var_3d83bc62b320d11a);
        }
        spawnlogic::function_48ed29b53fd72775();
    }
    level.mapcenter = spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    foreach (zone in level.objectives) {
        zone.furthestspawndistsq = 0;
        zone.spawnpoints = [];
        zone.spawnpoints[0] = [];
        zone.spawnpoints[2] = [];
    }
    namespace_10eb9162061dea8d::function_4265173fd3869f34(0, "primary", var_6170ec00c4bc9b5b);
    namespace_10eb9162061dea8d::function_4265173fd3869f34(2, "fallback", var_6170ec00c4bc9b5b);
    foreach (objid, zone in level.objectives) {
        zone.spawnset = "koth_" + objid;
        spawnlogic::registerspawnset(zone.spawnset, zone.spawnpoints[0]);
        zone.fallbackspawnset = "koth_fallback_" + objid;
        spawnlogic::registerspawnset(zone.fallbackspawnset, zone.spawnpoints[2]);
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cae
// Size: 0xde
function comparezoneindexes(zone_a, zone_b) {
    script_index_a = int(zone_a.objectivekey);
    script_index_b = int(zone_b.objectivekey);
    if (!isdefined(script_index_a) && !isdefined(script_index_b)) {
        /#
            println("defends" + zone_a.origin + "<unknown string>" + zone_b.origin);
        #/
        return 0;
    }
    if (!isdefined(script_index_a) && isdefined(script_index_b)) {
        /#
            println("defends" + zone_a.origin);
        #/
        return 1;
    }
    if (isdefined(script_index_a) && !isdefined(script_index_b)) {
        /#
            println("defends" + zone_b.origin);
        #/
        return 0;
    }
    if (script_index_a > script_index_b) {
        return 1;
    }
    return 0;
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d94
// Size: 0x9a
function getzonearray(targetname) {
    zones = getentarray(targetname, "targetname");
    foreach (z in zones) {
        z.objectivekey = z.script_label;
    }
    if (!isdefined(zones) || zones.size == 0) {
        return undefined;
    }
    return utility::array_sort_with_func(zones, &comparezoneindexes);
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e36
// Size: 0x170
function setupzones() {
    var_b38c97b95e246dec = getzonearray("hardpoint_zone");
    /#
        assertex(isdefined(var_b38c97b95e246dec) && var_b38c97b95e246dec.size >= 3, "Need at least 3 `hardpoint_zone`s in the map.");
    #/
    triggers = [];
    for (index = 0; index < var_b38c97b95e246dec.size; index++) {
        triggers[triggers.size] = var_b38c97b95e246dec[index];
    }
    level.objectives = [];
    foreach (trigger in triggers) {
        zone = namespace_8276d48525f0f398::setupobjective(trigger, undefined, undefined, 1);
        if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
            zone.var_b8cc16dcaf5a0746 = namespace_afbc0aa1b551667a::function_d91924619ae46b1f();
        }
        level.objectives[zone.objectivekey] = zone;
    }
    objid = namespace_5a22b6f3a56f7e9b::requestreservedid(1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(objid, 0);
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "done", (0, 0, 0), undefined, "icon_medium");
    } else {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "done", (0, 0, 0));
    }
    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(objid);
    return 1;
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fae
// Size: 0x10a
function setupzonecallouts(var_2afaf68657598b47) {
    var_49996ebebbbbf375 = undefined;
    zonetrigger = level.zone.visuals[0];
    if (isdefined(zonetrigger.script_noteworthy)) {
        var_49996ebebbbbf375 = level.calloutglobals.areaidmap[zonetrigger.script_noteworthy];
    }
    if (!isdefined(var_49996ebebbbbf375)) {
        var_49996ebebbbbf375 = namespace_8554064ba5e7d07::function_45d5ee5f369ad604(zonetrigger);
    }
    if (isdefined(var_49996ebebbbbf375)) {
        foreach (player in level.players) {
            player setclientomnvar("ui_hp_callout_id", var_49996ebebbbbf375);
        }
    }
    if (!istrue(var_2afaf68657598b47)) {
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(4, "free");
    }
    /#
        assertex(isdefined(var_49996ebebbbbf375), "Hardpoint " + zonetrigger.script_label + " origin needs to be inside a callout area or the callout trigger and zone trigger need a common script_noteworthy");
    #/
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30bf
// Size: 0x5a
function forcespawnplayers() {
    players = level.players;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (!isdefined(player) || isalive(player)) {
            continue;
        }
        player notify("force_spawn");
        waitframe();
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3120
// Size: 0x140
function getspawnpoint() {
    var_2fa17baefe0fa286 = getkothzonedeadzonedist();
    var_629e5fe2f6b337fa = namespace_b41002c7afebd276::function_75c03ed937b75b22(level.zone.trigger getentitynumber(), level.zone.furthestspawndistsq, var_2fa17baefe0fa286 * var_2fa17baefe0fa286, 12250000);
    var_b54c2c899faec51d = spawnlogic::shoulduseteamstartspawn();
    if (!isdefined(level.switchedtohardpointspawnlogic) && !spawnlogic::function_bff229a11ecd1e34() && !var_b54c2c899faec51d) {
        level.switchedtohardpointspawnlogic = 1;
        spawnlogic::setactivespawnlogic("Hardpoint", "Crit_Default");
    }
    if (spawnlogic::function_bff229a11ecd1e34()) {
        var_f6cf8482a6f0b335 = #"default";
        if (var_b54c2c899faec51d) {
            var_f6cf8482a6f0b335 = #"start";
        }
        if (!spawnlogic::function_8ac9620f8251ef84(var_f6cf8482a6f0b335)) {
            spawnlogic::setactivespawnlogic(var_f6cf8482a6f0b335);
        }
    }
    if (var_b54c2c899faec51d) {
        return spawnlogic::function_8be1c339876506b9(self, "start", self.pers["team"], var_629e5fe2f6b337fa);
    }
    return spawnlogic::getspawnpoint(self, self.pers["team"], level.zone.spawnset, level.zone.fallbackspawnset, 2, var_629e5fe2f6b337fa);
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3268
// Size: 0x6
function getkothzonedeadzonedist() {
    return 1000;
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3276
// Size: 0x3b
function onspawnplayer(var_9156b53bcf7ce573) {
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
    self.forcespawnnearteammates = undefined;
    thread updatematchstatushintonspawn();
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        thread namespace_afbc0aa1b551667a::function_f9ae07213a0af3de();
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32b8
// Size: 0xc9
function movezoneaftertime(time) {
    level endon("game_ended");
    level endon("zone_reset");
    level endon("dev_force_zone");
    level.zonemovetime = time;
    level.zonedestroyedbytimer = 0;
    namespace_8276d48525f0f398::zonetimerwait();
    objid = 1;
    level namespace_5a22b6f3a56f7e9b::returnreservedobjectiveid(objid, 0);
    if (function_7f15ad998050dd8c()) {
        objid = namespace_5a22b6f3a56f7e9b::requestreservedid(objid);
    }
    level namespace_5a22b6f3a56f7e9b::update_objective_state(objid, "done");
    level namespace_5a22b6f3a56f7e9b::update_objective_position(objid, level.var_fbb04ff4ffa6d364.visuals[0].origin + level.var_fbb04ff4ffa6d364.offset3d);
    level.zonedestroyedbytimer = 1;
    level notify("zone_moved");
    level notify("zone_destroyed");
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3388
// Size: 0x313
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    if (!isplayer(attacker) || attacker.team == self.team) {
        return;
    }
    if (attacker == self) {
        return;
    }
    if (!isdefined(level.zone)) {
        return;
    }
    ownerteam = level.zone.ownerteam;
    if (!isdefined(ownerteam)) {
        return;
    }
    if (isdefined(objweapon) && iskillstreakweapon(objweapon.basename)) {
        return;
    }
    victim = self;
    var_9ff9376383f4bc58 = 0;
    attackerteam = attacker.team;
    var_229449cfd54fdc5b = attacker istouching(level.zone.trigger);
    var_9d0123af024e86ac = victim istouching(level.zone.trigger);
    if (attackerteam != ownerteam) {
        if (level.zonecapturetime > 0 && var_229449cfd54fdc5b) {
            attacker thread function_e3e3e81453fd788b(#"hash_470103fde6a5e1ae");
            attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(11, 1);
        } else if (var_9d0123af024e86ac) {
            attacker thread namespace_62c556437da28f50::scoreeventpopup(#"assault");
            attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5a3b180273be47b1");
            attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(11, 1);
            thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "defending");
        }
    } else if (var_229449cfd54fdc5b) {
        value = level.zone.objectivekey;
        var_f6ddbb71b889a0be = [0:"_a", 1:"_b", 2:"_c", 3:"_d", 4:"_e", 5:"_f", 6:"_g", 7:"_h", 8:"_i"];
        if (!array_contains(var_f6ddbb71b889a0be, value)) {
            value = var_f6ddbb71b889a0be[int(value)];
        }
        attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend", value);
        attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, {var_715403f4ba13470a:level.zone.objectivekey});
        attacker incpersstat("defends", 1);
        attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(11, 1);
        attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
        attacker setextrascore1(attacker.pers["defends"]);
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a2
// Size: 0x50c
function give_capture_credit(touchlist, capturetime, capture_team, lastcaptureteam, var_22282e7d48ca3400, gameobject) {
    level endon("game_ended");
    level.lastcaptime = gettime();
    logannouncement(var_22282e7d48ca3400, undefined, "Hardpoint Captured", var_22282e7d48ca3400.origin);
    first_player = var_22282e7d48ca3400;
    var_2307a154949bbf43 = var_22282e7d48ca3400;
    if (!isdefined(first_player.lastcaptime)) {
        var_59666e71a5a0a42e = 10000;
    } else {
        var_59666e71a5a0a42e = gettime() - first_player.lastcaptime;
    }
    first_player.lastcaptime = gettime();
    first_player = namespace_19b4203b51d56488::function_15a05ddc354746a2(first_player);
    if (isplayer(first_player)) {
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = first_player;
        var_7e2c53b0bcf117d9.eventname = "capture";
        var_7e2c53b0bcf117d9.position = first_player.origin;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
        if (isexcessivescoreboosting(first_player) && !isanymlgmatch()) {
            goto LOC_000002a1;
        }
        if (var_59666e71a5a0a42e < 2100 && gettime() - first_player.lastkilltime > 2100) {
            if (var_2307a154949bbf43 != first_player) {
                first_player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_527aee59bf6f0079");
            } else {
                first_player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_e53f3d793abcebd3");
                first_player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_cb3820dc7d57584");
            }
        } else if (!isscoreboosting(first_player)) {
            if (var_2307a154949bbf43 != first_player) {
                first_player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_36af03684ac64eb8");
            } else {
                first_player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_e53f3d793abcebd3");
                first_player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_194ad9a7fdb13341");
            }
        } else if (var_2307a154949bbf43 != first_player) {
            first_player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_527aee59bf6f0079");
        } else {
            first_player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_e53f3d793abcebd3");
            first_player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2fe2061528d49f0c");
        LOC_000002a1:
        }
    LOC_000002a1:
        if (isdefined(level.zone.lastactivatetime) && gettime() - level.zone.lastactivatetime <= 2100) {
            if (var_2307a154949bbf43 != first_player) {
                first_player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_14ca5d321828d5c5");
            } else {
                first_player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_2e7df47fe2d0ba3a");
                first_player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_4d98aed9e6ebbf28");
            }
        }
        if (first_player.lastkilltime + 500 > gettime()) {
            goto LOC_00000343;
        }
        first_player namespace_8276d48525f0f398::setcrankedtimerzonecap(first_player);
    LOC_00000343:
    }
LOC_00000343:
    players = getarraykeys(touchlist);
    for (i = 0; i < players.size; i++) {
        player = touchlist[players[i]].player;
        var_64656a8b87eaae16 = touchlist[players[i]].player;
        player = namespace_19b4203b51d56488::function_15a05ddc354746a2(player);
        player updatecapsperminute(lastcaptureteam);
        if (!isscoreboosting(player)) {
            player incpersstat("captures", 1);
            player namespace_2685ec368e022695::statsetchild("round", "captures", player.pers["captures"]);
        } else {
            /#
                player iprintlnbold("<unknown string>");
            #/
        }
        if (first_player != player) {
            if (var_64656a8b87eaae16 != player) {
                player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_70c24ce7e0579e7a");
            } else {
                player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_971a82e17e683215");
                player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_7a10d07e9cc5745b");
            }
            player namespace_8276d48525f0f398::setcrankedtimerzonecap(player);
        }
        wait(0.05);
    }
    if (isdefined(gameobject.assisttouchlist)) {
        if (gameobject.assisttouchlist[capture_team].size > 0) {
            var_9eb80458ef362367 = getarraykeys(gameobject.assisttouchlist[capture_team]);
            foreach (id in players) {
                foreach (var_2c6d54a195121e5f in var_9eb80458ef362367) {
                    if (var_2c6d54a195121e5f == id) {
                        gameobject.assisttouchlist[capture_team][var_2c6d54a195121e5f] = undefined;
                    }
                }
            }
        }
        if (gameobject.assisttouchlist[capture_team].size > 0) {
            gameobject thread function_9c5c0e02b3615275(capture_team);
        }
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bb5
// Size: 0x14f
function function_9c5c0e02b3615275(team) {
    level endon("game_ended");
    var_9eb80458ef362367 = getarraykeys(self.assisttouchlist[team]);
    if (var_9eb80458ef362367.size > 0) {
        for (index = 0; index < var_9eb80458ef362367.size; index++) {
            var_6c7881393d098340 = self.assisttouchlist[team][var_9eb80458ef362367[index]];
            var_8a11b26acefd3594 = var_6c7881393d098340.var_d96989d14549fd76;
            if (var_8a11b26acefd3594) {
                if (isdefined(var_6c7881393d098340.owner)) {
                    player = var_6c7881393d098340.owner;
                } else {
                    player = undefined;
                }
            } else {
                player = var_6c7881393d098340.player;
            }
            if (isdefined(player)) {
                player incpersstat("captures", 1);
                player namespace_2685ec368e022695::statsetchild("round", "captures", player.pers["captures"]);
                if (var_8a11b26acefd3594) {
                    player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_70c24ce7e0579e7a");
                } else {
                    player thread namespace_62c556437da28f50::scoreeventpopup(#"hash_971a82e17e683215");
                    player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_7a10d07e9cc5745b");
                }
                player namespace_8276d48525f0f398::setcrankedtimerzonecap(player);
            }
            self.assisttouchlist[team][var_9eb80458ef362367[index]] = undefined;
            wait(0.05);
        }
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d0b
// Size: 0x3c1
function awardcapturepoints() {
    level endon("game_ended");
    level endon("zone_reset");
    level endon("zone_moved");
    level notify("awardCapturePointsRunning");
    level endon("awardCapturePointsRunning");
    seconds = 1;
    score = 1;
    while (!level.gameended) {
        waittime = 0;
        while (waittime < seconds && !level.gameended) {
            wait(level.framedurationseconds);
            namespace_e323c8674b44c8f4::waittillhostmigrationdone();
            waittime = waittime + level.framedurationseconds;
            if (level.zone.stalemate) {
                waittime = 0;
            }
        }
        team = level.zone namespace_19b4203b51d56488::getownerteam();
        if (team == "neutral") {
            continue;
        }
        if (level.gameended) {
            break;
        }
        if (!level.zone.stalemate && !level.gameended) {
            if (level.zoneadditivescoring) {
                score = level.zone.touchlist[team].size;
            }
            namespace_e8a49b70d0769b66::giveteamscoreforobjective(team, score, 0);
            foreach (object in level.zone.touchlist[team]) {
                var_4245ed6808ee4864 = object.player;
                var_64656a8b87eaae16 = object.player;
                var_4245ed6808ee4864 = namespace_19b4203b51d56488::function_15a05ddc354746a2(var_4245ed6808ee4864);
                var_4245ed6808ee4864 incpersstat("objTime", 1);
                var_4245ed6808ee4864 function_48544e365f4f5648(0, 1);
                var_7c01e84ef860ccbd = "obj" + level.zone.trigger.script_label + "Time";
                if (isdefined(var_4245ed6808ee4864.pers[var_7c01e84ef860ccbd])) {
                    var_4245ed6808ee4864 incpersstat(var_7c01e84ef860ccbd, 1);
                }
                if (isdefined(var_4245ed6808ee4864.timebyrotation[level.kothhillrotation])) {
                    var_4245ed6808ee4864.timebyrotation[level.kothhillrotation]++;
                } else {
                    var_4245ed6808ee4864.timebyrotation[level.kothhillrotation] = 1;
                }
                var_4245ed6808ee4864 namespace_2685ec368e022695::statsetchild("round", "objTime", var_4245ed6808ee4864.pers["objTime"]);
                var_4245ed6808ee4864 setextrascore0(var_4245ed6808ee4864.pers["objTime"]);
                if (isdefined(var_4245ed6808ee4864.var_bd0feb635eed5b60) && var_4245ed6808ee4864.var_bd0feb635eed5b60 > 3) {
                    var_4245ed6808ee4864.var_bd0feb635eed5b60 = 0;
                    if (function_60bf8d82001fc22c() == "koth") {
                        if (var_64656a8b87eaae16 != var_4245ed6808ee4864) {
                            var_4245ed6808ee4864 thread doScoreEvent(#"hash_fa8cc32ce86849b6");
                        } else {
                            var_4245ed6808ee4864 thread doScoreEvent(#"hash_61e7451e5d97d089");
                        }
                    } else if (getgametype() == "grnd") {
                        var_4245ed6808ee4864 thread doScoreEvent(#"hash_7e236756fb6f7c1a", undefined, 15);
                    }
                } else {
                    if (!isdefined(var_4245ed6808ee4864.var_bd0feb635eed5b60)) {
                        var_4245ed6808ee4864.var_bd0feb635eed5b60 = 0;
                    } else {
                        var_4245ed6808ee4864.var_bd0feb635eed5b60++;
                    }
                    if (var_64656a8b87eaae16 != var_4245ed6808ee4864) {
                        var_4245ed6808ee4864 namespace_e8a49b70d0769b66::giveplayerscore(#"hash_fa8cc32ce86849b6", 3);
                    } else {
                        var_4245ed6808ee4864 namespace_e8a49b70d0769b66::giveplayerscore(#"hash_61e7451e5d97d089", 10);
                    }
                }
            }
        }
        if (istrue(level.var_9028202fb295d21)) {
            namespace_d576b6dc7cef9c62::default_ontimelimit();
        }
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40d3
// Size: 0xcb
function updatecapsperminute(lastownerteam) {
    if (!isdefined(self.capsperminute)) {
        self.numcaps = 0;
        self.capsperminute = 0;
    }
    if (!isdefined(lastownerteam) || lastownerteam == "neutral") {
        return;
    }
    self.numcaps++;
    minutespassed = gettimepassed() / 60000;
    if (isplayer(self) && isdefined(self.timeplayed["total"])) {
        minutespassed = self.timeplayed["total"] / 60;
    }
    self.capsperminute = self.numcaps / minutespassed;
    if (self.capsperminute > self.numcaps) {
        self.capsperminute = self.numcaps;
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41a5
// Size: 0x2a
function isscoreboosting(player) {
    return isdefined(player.capsperminute) && player.capsperminute > 3;
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41d7
// Size: 0x2a
function isexcessivescoreboosting(player) {
    return isdefined(player.capsperminute) && player.capsperminute > 5;
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4209
// Size: 0x13b
function onplayerconnect(player) {
    player._hardpointeffect = [];
    player.numcaps = 0;
    player.capsperminute = 0;
    player.timebyrotation = [];
    player setextrascore0(0);
    if (isdefined(player.pers["objTime"])) {
        player setextrascore0(player.pers["objTime"]);
    }
    player setextrascore1(0);
    if (isdefined(player.pers["defends"])) {
        player setextrascore1(player.pers["defends"]);
    }
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        player thread namespace_afbc0aa1b551667a::function_8bb13aa2a5d32576(player, "mp_gametype_koth_mgl_match_introduction");
    }
    thread onplayerspawned(player);
    foreach (zone in level.objectives) {
        if (istrue(level.usehpzonebrushes)) {
            zone namespace_8276d48525f0f398::hideplayerspecificbrushes(player);
        }
    }
    player thread refreshfreecamhardpointfx();
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x434b
// Size: 0xab
function onplayerspawned(player) {
    while (1) {
        player waittill("spawned");
        foreach (zone in level.objectives) {
            if (istrue(zone.active)) {
                if (zone.ownerteam == "neutral") {
                    zone namespace_8276d48525f0f398::playhardpointneutralfx();
                } else {
                    zone namespace_8276d48525f0f398::showcapturedhardpointeffecttoplayer(zone.ownerteam, player);
                }
            }
        }
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43fd
// Size: 0x9c
function updateservericons(state, contested) {
    var_cabc886d846dd979 = -1;
    if (contested) {
        var_cabc886d846dd979 = -2;
    } else if (isgameplayteam(state)) {
        player = thread getownerteamplayer(state);
        if (isdefined(player)) {
            var_cabc886d846dd979 = player getentitynumber();
        }
    } else {
        switch (state) {
        case #"hash_3bf8ec5fe1d42da8":
            var_cabc886d846dd979 = -3;
            break;
        case #"hash_c312107e6bce703c":
        default:
            break;
        }
    }
    setomnvar("ui_hardpoint", var_cabc886d846dd979);
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44a0
// Size: 0x7c
function getownerteamplayer(ownerteam) {
    var_a3010f9814a40c8d = undefined;
    foreach (player in level.players) {
        if (player.team == ownerteam) {
            var_a3010f9814a40c8d = player;
            break;
        }
    }
    return var_a3010f9814a40c8d;
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4524
// Size: 0xb6
function refreshfreecamhardpointfx() {
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        view = channel = self waittill("luinotifyserver");
        if (channel == "mlg_view_change") {
            foreach (zone in level.objectives) {
                if (zone.ownerteam != "neutral") {
                    zone namespace_8276d48525f0f398::showcapturedhardpointeffecttoplayer(zone.ownerteam, self);
                }
            }
        }
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45e1
// Size: 0x77
function getrespawndelay() {
    if (!istrue(level.delayplayer)) {
        return undefined;
    }
    if (isdefined(level.spawndelay) && level.spawndelay > 0) {
        if (isdefined(level.zone.ownerteam) && self.pers["team"] == level.zone.ownerteam) {
            return level.spawndelay;
        }
    }
    return undefined;
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4660
// Size: 0x12
function writeplayerrotationscoretomatchdataongameend() {
    level waittill("game_ended");
    writecurrentrotationteamscore();
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4679
// Size: 0x4e
function writecurrentrotationteamscore() {
    if (level.kothhillrotation < 24) {
        setmatchdata("alliesRoundScore", level.kothhillrotation, getteamscore("allies"));
        setmatchdata("axisRoundScore", level.kothhillrotation, getteamscore("axis"));
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46ce
// Size: 0x11b
function setkothwaypoints() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("koth_destroy", 0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_koth", 0, 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("koth_defend", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_koth", 0, 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("koth_defending", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_koth", 0, 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("koth_neutral", 0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_koth", 0, 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("koth_contested", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_koth", 0, 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("koth_losing", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_koth", 0, 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("koth_target", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, 2);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("koth_next", 0, "neutral", "MP_INGAME_ONLY/OBJ_NEXT_CAPS", "icon_waypoint_locked", 0, 2);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("koth_taking", 0, "friendly", "MP_INGAME_ONLY/OBJ_DESTROYING_CAPS", "icon_waypoint_koth", 1, 1);
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47f0
// Size: 0x32
function updatematchstatushintonspawn() {
    level endon("game_ended");
    if (istrue(level.zoneislocked)) {
        namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("koth_control");
    } else {
        namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("koth_capture");
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4829
// Size: 0x21
function function_fab770bfe4b14e75() {
    level endon("game_ended");
    while (1) {
        level waittill("zone_moved");
        function_94ae9bf19d8942d9();
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4851
// Size: 0x5c
function function_94ae9bf19d8942d9() {
    foreach (player in level.players) {
        player namespace_b919c4be206d3c80::function_1882f80b14421089(3, 1);
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48b4
// Size: 0x125
function function_69c581621849df52() {
    level endon("game_ended");
    level endon("stop_contested_stats_thread");
    level endon("zone_moved");
    level endon("zone_destroyed");
    var_413561a0123aaa35 = level.framedurationseconds;
    zone = self;
    while (1) {
        waitframe();
        foreach (team in level.teamnamelist) {
            foreach (object in zone.touchlist[team]) {
                player = object.player;
                if (isdefined(player.owner)) {
                    player = player.owner;
                }
                player function_1882f80b14421089(5, var_413561a0123aaa35);
            }
        }
    }
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49e0
// Size: 0x4b
function function_1134d3068749d68e() {
    if (istrue(level.var_9028202fb295d21)) {
        return;
    }
    winner = namespace_e8a49b70d0769b66::gethighestscoringteam();
    if (winner != "tie") {
        namespace_d576b6dc7cef9c62::default_ontimelimit();
        return;
    }
    namespace_44abc05161e2e2cb::showerrormessagetoallplayers("MP_INGAME_ONLY/KOTH_OVERTIME_WARNING");
    level.var_9028202fb295d21 = 1;
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4a32
// Size: 0xa8
function function_49d30df50940b9d7(org, size, color) {
    /#
        for (i = 0; i < 10; i++) {
            var_ce0ee878f55f5e93 = i / 10 * 360;
            var_ce0ee978f55f60c6 = (i + 1) / 10 * 360;
            var_b1a981030274aadc = org + (cos(var_ce0ee878f55f5e93), sin(var_ce0ee878f55f5e93), 0) * size;
            var_b1a984030274b175 = org + (cos(var_ce0ee978f55f60c6), sin(var_ce0ee978f55f60c6), 0) * size;
            line(var_b1a981030274aadc, var_b1a984030274b175, color);
        }
    #/
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ae1
// Size: 0x304
function function_dfb50c5482a4d86() {
    /#
        while (1) {
            if (getdvar(@"hash_657c47f657a0023c") != "<unknown string>") {
                wait(2);
                continue;
            }
            while (1) {
                if (getdvar(@"hash_657c47f657a0023c") != "<unknown string>") {
                    break;
                }
                if (!isdefined(level.players) || level.players.size <= 0) {
                    wait(0.05);
                    continue;
                }
                bestdistsq = 999999999;
                var_5f24d6ddb3a012c6 = level.radios[0];
                foreach (radio in level.radios) {
                    distsq = distancesquared(radio.origin, level.players[0].origin);
                    if (distsq < bestdistsq) {
                        bestdistsq = distsq;
                        var_5f24d6ddb3a012c6 = radio;
                    }
                }
                foreach (radio in level.radios) {
                    if (radio != var_5f24d6ddb3a012c6) {
                        function_49d30df50940b9d7(radio.origin, 50, (0.5, 0.5, 0.5));
                    }
                }
                radio = var_5f24d6ddb3a012c6;
                function_49d30df50940b9d7(radio.origin, 100, (1, 1, 1));
                foreach (spawnpoint in radio.var_4945049d500c1dec) {
                    line(radio.origin, spawnpoint.origin, (1, 0.5, 0.5));
                    function_49d30df50940b9d7(spawnpoint.origin, 20, (1, 0.5, 0.5));
                }
                foreach (spawnpoint in radio.var_f195ec37125a4ce7) {
                    line(radio.origin + (0, 0, 10), spawnpoint.origin + (0, 0, 10), (0.5, 1, 0.5));
                    function_49d30df50940b9d7(spawnpoint.origin, 30, (0.5, 1, 0.5));
                }
                wait(0.05);
            }
        }
    #/
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4dec
// Size: 0x76
function function_1f98c5616d8b3d67() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_4806172df45de691") != 0) {
                level notify("<unknown string>");
                level.zoneduration = 10000;
                break;
            }
            wait(1);
        }
        thread movezoneaftertime(level.zoneduration);
        level.var_2db03438253fa6e2 = 1;
        setdevdvar(@"hash_4806172df45de691", 0);
        thread function_1f98c5616d8b3d67();
    #/
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e69
// Size: 0xb2
function function_bed0f399bee034f8() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_796deaab0da995a1") != 0) {
                level notify("<unknown string>");
                level.zoneduration = 1;
                break;
            }
            wait(1);
        }
        thread movezoneaftertime(level.zoneduration);
        setdevdvar(@"hash_796deaab0da995a1", 0);
        if (isdefined(level.var_2db03438253fa6e2) && level.var_2db03438253fa6e2) {
            level.zoneduration = 10000;
        } else {
            level.zoneduration = getdvarint(@"hash_cb81f537c99c9657");
        }
        thread function_bed0f399bee034f8();
        self notify("<unknown string>");
    #/
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f22
// Size: 0x80
function function_ef4f5aa9c42838b2() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_4c260c16d548430f") != 0) {
                level notify("<unknown string>");
                level.zoneduration = getdvarint(@"hash_cb81f537c99c9657");
                break;
            }
            wait(1);
        }
        thread movezoneaftertime(level.zoneduration);
        level.var_2db03438253fa6e2 = 0;
        setdevdvar(@"hash_4c260c16d548430f", 0);
        thread function_ef4f5aa9c42838b2();
    #/
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fa9
// Size: 0x262
function function_be67fb2ebcca86d1() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_c000ec9a5a2f4b6c") != 0) {
                setdevdvar(@"hash_4806172df45de691", 1);
                level.zoneduration = 10000;
                level.var_2db03438253fa6e2 = 1;
                thread movezoneaftertime(level.zoneduration);
                level notify("<unknown string>");
                foreach (zone in level.objectives) {
                    if (isdefined(zone.neutralhardpointfx) && zone.neutralhardpointfx.size > 0) {
                        foreach (var_25ac26fac33ac6f3 in zone.neutralhardpointfx) {
                            zone.neutralhardpointfx = array_remove(zone.neutralhardpointfx, var_25ac26fac33ac6f3);
                            if (isdefined(var_25ac26fac33ac6f3)) {
                                var_25ac26fac33ac6f3 delete();
                            }
                        }
                    }
                    zone.neutralhardpointfx = [];
                    for (i = 1; i < zone.visuals.size; i++) {
                        var_5daa42f92e5e9be8 = anglestoforward(zone.visuals[i].angles);
                        zone.neutralhardpointfx[zone.neutralhardpointfx.size] = spawnfx(level.var_cef90b04e416c915["<unknown string>"], zone.visuals[i].baseorigin, var_5daa42f92e5e9be8);
                        zone.neutralhardpointfx[zone.neutralhardpointfx.size - 1] setfxkilldefondelete();
                        triggerfx(zone.neutralhardpointfx[zone.neutralhardpointfx.size - 1]);
                    }
                    zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
                    zone namespace_19b4203b51d56488::setvisibleteam("<unknown string>");
                }
            }
            setdevdvar(@"hash_c000ec9a5a2f4b6c", 0);
            wait(1);
        }
    #/
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5212
// Size: 0xa5
function function_b4c2563f73b02c80() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", getdvarint(@"hash_46a6b424af6acbc2"), 0);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", getdvarint(@"hash_86e14326e43c0115"), 0);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_b4c2563f73b02c80();
    #/
}

// Namespace koth/namespace_f1b0a92156c7301c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52be
// Size: 0x1f9
function function_97b50111eebb7239() {
    /#
        while (1) {
            if (!isdefined(level.players)) {
                waitframe();
                continue;
            }
            if (isdefined(level.players) && level.players.size == 0) {
                waitframe();
                continue;
            }
            if (!isdefined(level.var_385d55b55c63b8e2)) {
                foreach (player in level.players) {
                    if (!player isplayerheadless()) {
                        level.var_385d55b55c63b8e2 = player;
                        break;
                    }
                }
            }
            if (!isdefined(level.var_8812f1aff8df05d4) && isdefined(level.var_385d55b55c63b8e2)) {
                foreach (player in level.players) {
                    if (player isplayerheadless() && isalive(player) && istrue(player.hasspawned) && !is_equal(player.pers["<unknown string>"], level.var_385d55b55c63b8e2.pers["<unknown string>"])) {
                        wait(1);
                        level.var_8812f1aff8df05d4 = player;
                        break;
                    }
                }
            }
            if (isdefined(level.var_8812f1aff8df05d4) && isalive(level.var_8812f1aff8df05d4)) {
                level.var_8812f1aff8df05d4 setorigin((2556.19, 5259.61, 192));
            }
            wait(0.25);
            if (isdefined(level.var_8812f1aff8df05d4) && isalive(level.var_8812f1aff8df05d4)) {
                level.var_8812f1aff8df05d4 setorigin((2581.96, 5046.65, 192));
            }
            wait(0.25);
        }
    #/
}

