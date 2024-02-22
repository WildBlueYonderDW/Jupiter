// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\gametypes\obj_zonecapture.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\koth.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\flags.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\gametypes\grnd.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\killstreaks\airdrop_multiple.gsc;
#using scripts\mp\spawnfactor.gsc;
#using scripts\mp\utility\lower_message.gsc;

#namespace grnd;

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb23
// Size: 0x25b
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    allowed[1] = "dz_flare";
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 9);
        registertimelimitdvar(getgametype(), 600);
        registerscorelimitdvar(getgametype(), 7500);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    updategametypedvars();
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.modeonspawnplayer = &onspawnplayer;
    level.onplayerkilled = &namespace_f1b0a92156c7301c::onplayerkilled;
    level.onrespawndelay = &namespace_f1b0a92156c7301c::getrespawndelay;
    level.nosuspensemusic = 1;
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "dx_mp_drop_game_uktl_dzt1";
    } else {
        game["dialog"]["gametype"] = "dx_mp_drop_game_uktl_dznm";
    }
    game["dialog"]["offense_obj"] = "dx_mp_drop_game_uktl_dzbo";
    game["dialog"]["defense_obj"] = "dx_mp_drop_game_uktl_dzbo";
    game["dialog"]["hp_new_location"] = "dx_mp_drop_game_uktl_dznl";
    game["dialog"]["hp_captured_enemy"] = "dx_mp_drop_game_uktl_dzcb";
    game["dialog"]["hp_captured_friendly"] = "dx_mp_drop_game_uktl_dzca";
    game["dialog"]["hp_contested"] = "dx_mp_drop_game_uktl_dzcn";
    game["dialog"]["hp_move_soon"] = "dx_mp_drop_game_uktl_dzms";
    game["dialog"]["hp_capturing_enemy"] = "dx_mp_drop_game_uktl_dzcd";
    game["dialog"]["hp_capturing_friendly"] = "dx_mp_drop_game_uktl_dzcc";
    setomnvar("ui_hq_status", -1);
    setomnvar("ui_hq_num_alive", 0);
    setomnvar("ui_hq_ownerteam", -1);
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd85
// Size: 0x145
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_5ba53b16e2b96ecd", getmatchrulesdata("grndData", "dropTime"));
    setdynamicdvar(@"hash_b19899b52321b991", getmatchrulesdata("grndData", "enableVariantDZ"));
    setdynamicdvar(@"hash_e394adcc9f5c4ddc", getmatchrulesdata("kothData", "zoneLifetime"));
    setdynamicdvar(@"hash_8d0b337fd3d7011e", getmatchrulesdata("kothData", "zoneCaptureTime"));
    setdynamicdvar(@"hash_25ad50e5cdfaf602", getmatchrulesdata("kothData", "firstZoneActivationDelay"));
    setdynamicdvar(@"hash_bbf8317503ce49c6", getmatchrulesdata("kothData", "zoneActivationDelay"));
    setdynamicdvar(@"hash_6495e30f8aa00d93", getmatchrulesdata("kothData", "randomLocationOrder"));
    setdynamicdvar(@"hash_518afd934bd7f3ce", getmatchrulesdata("kothData", "additiveScoring"));
    setdynamicdvar(@"hash_c6311ea83485b20c", getmatchrulesdata("kothData", "pauseTime"));
    setdynamicdvar(@"hash_4aab4c2d3976a925", 0);
    registerhalftimedvar("grnd", 0);
    setdynamicdvar(@"hash_796f6d676d387bcb", 0);
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed1
// Size: 0xec
function onstartgametype() {
    setclientnamemode("auto_change");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/GRND");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/GRND");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/GRND_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/DOM_HINT");
    }
    level thread setupzones();
    setmapsizespawnconsts();
    initspawns();
    level thread dzmainloop();
    /#
    #/
    if (level.droptime > 0) {
        level thread randomdrops();
    }
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc4
// Size: 0x120
function updategametypedvars() {
    updatecommongametypedvars();
    level.droptime = dvarfloatvalue("dropTime", 15, 0, 60);
    level.zoneduration = dvarfloatvalue("zoneLifetime", 60, 0, 300);
    level.zonecapturetime = dvarfloatvalue("zoneCaptureTime", 0, 0, 30);
    level.firstzoneactivationdelay = dvarfloatvalue("firstZoneActivationDelay", 30, 0, 120);
    level.zoneactivationdelay = dvarfloatvalue("zoneActivationDelay", 30, 0, 120);
    level.zonerandomlocationorder = dvarintvalue("randomLocationOrder", 0, 0, 1);
    level.zoneadditivescoring = dvarintvalue("additiveScoring", 0, 0, 1);
    level.pausemodetimer = dvarintvalue("pauseTime", 1, 0, 1);
    level.enablevariantdrops = dvarintvalue("enableVariantDZ", 0, 0, 1);
    if (matchmakinggame() && !isanymlgmatch() && getdvarint(@"hash_56937a1bd450393d", 15) != 0) {
        level.zoneactivationdelay = adjustzoneactivationdelayforlargemaps();
    }
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10eb
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

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117a
// Size: 0x37
function setmapsizespawnconsts() {
    level.spawn_deadzone_dist = 1000;
    level.close_spawn_min_dist_sq = 10000;
    level.max_spawn_dist_sq = 25000000;
    level.enemy_spawn_influence_dist_sq = 12250000;
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b8
// Size: 0x695
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Default", 1);
    }
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_tdm_spawn_axis_start");
    attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_allies_start");
    defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
    namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
    namespace_b2d5aa2baf2b5701::registerspawnset("normal", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::registerspawnset("fallback", "mp_tdm_spawn_secondary");
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    enablespawnpointsbyclassname("mp_tdm_spawn");
    level.spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
    if (!level.spawnpoints.size) {
        /#
            assertmsg("^1No mp_tdm_spawn spawnpoints in level!");
        #/
        return;
    }
    foreach (zone in level.objectives) {
        zone.furthestspawndistsq = 0;
        zone.spawnpoints = [];
        zone.fallbackspawnpoints = [];
    }
    foreach (spawnpoint in level.spawnpoints) {
        namespace_10eb9162061dea8d::calculatespawndisttozones(spawnpoint, 6000);
        originstring = namespace_b2d5aa2baf2b5701::getoriginidentifierstring(spawnpoint);
        if (isdefined(level.grndextraprimaryspawnpoints) && isdefined(level.grndextraprimaryspawnpoints[originstring])) {
            foreach (zoneindex in level.grndextraprimaryspawnpoints[originstring]) {
                zone = level.objectives[zoneindex];
                zone.spawnpoints[zone.spawnpoints.size] = spawnpoint;
            }
        }
        var_ba992cb19cb03b0c = 0;
        var_47d8f0fd833ca536 = spawnpoint.classname == "mp_tdm_spawn_allies_start" || spawnpoint.classname == "mp_tdm_spawn_axis_start";
        var_9967fe9b58eefafd = spawnpoint.classname == "mp_tdm_spawn";
        var_a46d96b282d563e7 = spawnpoint.classname == "mp_tdm_spawn_secondary";
        if (var_47d8f0fd833ca536) {
            continue;
        }
        if (var_9967fe9b58eefafd || var_a46d96b282d563e7) {
            if (isdefined(spawnpoint.script_noteworthy) && spawnpoint.script_noteworthy != "") {
                var_ba992cb19cb03b0c = 1;
                var_aa5c00f4cc732317 = strtok(spawnpoint.script_noteworthy, " ");
                foreach (zoneindex in var_aa5c00f4cc732317) {
                    zone = level.objectives[zoneindex];
                    if (var_9967fe9b58eefafd) {
                        zone.spawnpoints[zone.spawnpoints.size] = spawnpoint;
                    } else {
                        /#
                            assertex(var_a46d96b282d563e7, "Drop Zone must have 'mp_tdm_spawn' and 'mp_tdm_spawn_secondary' spawns");
                        #/
                        zone.fallbackspawnpoints[zone.fallbackspawnpoints.size] = spawnpoint;
                    }
                }
            }
        }
        namespace_10eb9162061dea8d::calculatespawndisttozones(spawnpoint, 6000);
        if (!var_ba992cb19cb03b0c) {
            foreach (zone in level.objectives) {
                if (spawnpoint.scriptdata.var_c7e3d9e2f0dd4e7[zone.trigger getentitynumber()] < level.close_spawn_min_dist_sq || spawnpoint.scriptdata.var_c7e3d9e2f0dd4e7[zone.trigger getentitynumber()] > level.max_spawn_dist_sq) {
                    spawnpoint.removespawn = 1;
                }
                if (var_9967fe9b58eefafd) {
                    if (!isdefined(spawnpoint.removespawn)) {
                        zone.spawnpoints[zone.spawnpoints.size] = spawnpoint;
                    }
                } else {
                    /#
                        assert(var_a46d96b282d563e7);
                    #/
                    zone.fallbackspawnpoints[zone.fallbackspawnpoints.size] = spawnpoint;
                }
                spawnpoint.removespawn = undefined;
            }
        }
    }
    foreach (objid, zone in level.objectives) {
        /#
            assertex(zone.spawnpoints.size > 0, "Spawn group dropzone_" + objid + " is empty... bug this to Mickner");
        #/
        zone.spawnset = "dropzone_" + objid;
        namespace_b2d5aa2baf2b5701::registerspawnset(zone.spawnset, zone.spawnpoints);
        zone.fallbackspawnset = "dropzone_fallback_" + objid;
        namespace_b2d5aa2baf2b5701::registerspawnset(zone.fallbackspawnset, zone.fallbackspawnpoints);
    }
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1854
// Size: 0xde
function comparezoneindexes(zone_a, zone_b) {
    script_index_a = int(zone_a.objectivekey);
    script_index_b = int(zone_b.objectivekey);
    if (!isdefined(script_index_a) && !isdefined(script_index_b)) {
        /#
            println("enableVariantDZ" + zone_a.origin + "4" + zone_b.origin);
        #/
        return 0;
    }
    if (!isdefined(script_index_a) && isdefined(script_index_b)) {
        /#
            println("enableVariantDZ" + zone_a.origin);
        #/
        return 1;
    }
    if (isdefined(script_index_a) && !isdefined(script_index_b)) {
        /#
            println("enableVariantDZ" + zone_b.origin);
        #/
        return 0;
    }
    if (script_index_a > script_index_b) {
        return 1;
    }
    return 0;
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193a
// Size: 0x10d
function getzonearray(targetname) {
    zones = getentarray(targetname, "targetname");
    foreach (z in zones) {
        z.objectivekey = z.script_label;
    }
    if (!isdefined(zones) || zones.size == 0) {
        return undefined;
    }
    swapped = 1;
    for (n = zones.size; swapped; n--) {
        swapped = 0;
        for (i = 0; i < n - 1; i++) {
            if (comparezoneindexes(zones[i], zones[i + 1])) {
                temp = zones[i];
                zones[i] = zones[i + 1];
                zones[i + 1] = temp;
                swapped = 1;
            }
        }
    }
    return zones;
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4f
// Size: 0xa31
function setupzones() {
    trigs = getzonearray("grnd");
    if (level.mapname == "mp_piccadilly") {
        foreach (trig in trigs) {
            if (distance(trig.origin, (-1547, -1512, 165)) < 10) {
                trig.origin = trig.origin - (0, 0, 10);
            }
        }
    } else if (level.mapname == "mp_aniyah") {
        foreach (trig in trigs) {
            if (distance(trig.origin, (-1117, 2295, 398)) < 10) {
                trig.origin = trig.origin - (0, 0, 10);
            } else if (distance(trig.origin, (-4501, -2, 322)) < 10) {
                trig.script_label = "9";
            } else if (distance(trig.origin, (-4474, 1159, 388)) < 10) {
                trig.origin = trig.origin - (0, 0, 20);
            }
        }
    }
    /#
        assert(isdefined(trigs.size > 3));
    #/
    maperrors = [];
    flares = getstructarray("dz_flare", "targetname");
    if (level.mapname == "mp_shipment") {
        var_49e04f87f5702f8c = [];
        foreach (trig in trigs) {
            if (trig.script_label == "1" && distance(trig.origin, (-333, 1999, 119)) < 5) {
                var_49e04f87f5702f8c[var_49e04f87f5702f8c.size] = trig;
            } else if (trig.script_label == "2" && distance(trig.origin, (189, 1564, 75)) < 5) {
                var_49e04f87f5702f8c[var_49e04f87f5702f8c.size] = trig;
            } else if (trig.script_label == "3" && distance(trig.origin, (-751, 2416, 81)) < 5) {
                var_49e04f87f5702f8c[var_49e04f87f5702f8c.size] = trig;
            } else if (trig.script_label == "4" && distance(trig.origin, (165, 2420, 79)) < 5) {
                var_49e04f87f5702f8c[var_49e04f87f5702f8c.size] = trig;
            } else if (trig.script_label == "5" && distance(trig.origin, (-823, 1536, 68)) < 5) {
                var_49e04f87f5702f8c[var_49e04f87f5702f8c.size] = trig;
            }
        }
        trigs = array_remove_array(trigs, var_49e04f87f5702f8c);
        var_e3fd9580bc3ada40 = [];
        foreach (flare in flares) {
            if (distance(flare.origin, (192.944, 1583.51, 16.344)) < 5) {
                var_e3fd9580bc3ada40[var_e3fd9580bc3ada40.size] = flare;
            } else if (distance(flare.origin, (-743.056, 2447.51, 17.844)) < 5) {
                var_e3fd9580bc3ada40[var_e3fd9580bc3ada40.size] = flare;
            } else if (distance(flare.origin, (152.944, 2415.51, 16.344)) < 5) {
                var_e3fd9580bc3ada40[var_e3fd9580bc3ada40.size] = flare;
            } else if (distance(flare.origin, (-334.5, 1990.5, 17.25)) < 5) {
                var_e3fd9580bc3ada40[var_e3fd9580bc3ada40.size] = flare;
            } else if (distance(flare.origin, (-751.056, 1479.51, 16.844)) < 5) {
                var_e3fd9580bc3ada40[var_e3fd9580bc3ada40.size] = flare;
            }
        }
        flares = array_remove_array(flares, var_e3fd9580bc3ada40);
    } else if (level.mapname == "mp_catedral") {
        var_50efabb169380f2e = [];
        foreach (trig in trigs) {
            groundpos = drop_to_ground(trig.origin, 100);
            radius = 128;
            var_8d213e19bb3a154a = undefined;
            switch (trig.script_label) {
            case #"hash_31100fbc01bd387c":
                radius = 210;
                break;
            case #"hash_311012bc01bd3d35":
                radius = 295;
                break;
            case #"hash_311011bc01bd3ba2":
                radius = 225;
                break;
            case #"hash_31100cbc01bd33c3":
                radius = 200;
                var_8d213e19bb3a154a = 100;
                break;
            case #"hash_31100bbc01bd3230":
                radius = 345;
                break;
            }
            var_8dc27038d8ffe723 = spawn("trigger_radius", groundpos, 0, radius, 128);
            var_8dc27038d8ffe723.script_label = trig.script_label;
            var_8dc27038d8ffe723.script_gameobjectname = trig.script_gameobjectname;
            var_8dc27038d8ffe723.targetname = trig.targetname;
            var_8dc27038d8ffe723.var_8d213e19bb3a154a = ter_op(isdefined(var_8d213e19bb3a154a), var_8d213e19bb3a154a, radius);
            var_50efabb169380f2e[var_50efabb169380f2e.size] = var_8dc27038d8ffe723;
        }
        trigs = var_50efabb169380f2e;
    } else if (level.mapname == "mp_crossing") {
        var_50efabb169380f2e = [];
        foreach (trig in trigs) {
            groundpos = drop_to_ground(trig.origin, 100);
            radius = 128;
            var_8d213e19bb3a154a = undefined;
            switch (trig.script_label) {
            case #"hash_31100fbc01bd387c":
                radius = 215;
                break;
            case #"hash_311012bc01bd3d35":
                radius = 190;
                break;
            case #"hash_311011bc01bd3ba2":
                radius = 350;
                break;
            case #"hash_31100cbc01bd33c3":
                radius = 350;
                break;
            case #"hash_31100bbc01bd3230":
                radius = 350;
                break;
            }
            var_8dc27038d8ffe723 = spawn("trigger_radius", groundpos, 0, radius, 128);
            var_8dc27038d8ffe723.script_label = trig.script_label;
            var_8dc27038d8ffe723.script_gameobjectname = trig.script_gameobjectname;
            var_8dc27038d8ffe723.targetname = trig.targetname;
            var_8dc27038d8ffe723.var_8d213e19bb3a154a = ter_op(isdefined(var_8d213e19bb3a154a), var_8d213e19bb3a154a, radius);
            var_50efabb169380f2e[var_50efabb169380f2e.size] = var_8dc27038d8ffe723;
        }
        trigs = var_50efabb169380f2e;
    }
    foreach (flare in flares) {
        groundpos = drop_to_ground(flare.origin, 100) + (0, 0, 1.25);
        scriptable = spawn("script_model", groundpos);
        scriptable.angles = flare.angles;
        scriptable setmodel("dz_flare_scriptable");
        flare.scriptable = scriptable;
    }
    visuals = [];
    level.objectives = [];
    for (i = 0; i < flares.size; i++) {
        errored = 0;
        flare = flares[i];
        trig = undefined;
        for (j = 0; j < trigs.size; j++) {
            if (flare.scriptable istouching(trigs[j])) {
                if (isdefined(trig)) {
                    maperrors[maperrors.size] = "flare at " + flare.origin + " is touching more than one "flaretrigger" trigger";
                    errored = 1;
                    break;
                }
                trig = trigs[j];
                break;
            }
        }
        if (!isdefined(trig)) {
            jumpiftrue(errored) LOC_0000096e;
            maperrors[maperrors.size] = "flare at " + flare.origin + " is not inside any "flaretrigger" trigger";
        } else {
        LOC_0000096e:
            /#
                assert(!errored);
            #/
            visuals = [];
            visuals[0] = flare.scriptable;
            zone = namespace_8276d48525f0f398::setupobjective(trig, visuals);
            zone.origin = trig.origin;
            zone.offset3d = (0, 0, 120);
            level.objectives[zone.objectivekey] = zone;
        }
    }
    if (maperrors.size > 0) {
        /#
            println("mp_catedral");
            for (i = 0; i < maperrors.size; i++) {
                println(maperrors[i]);
            }
            println("awardCapturePointsRunning");
        #/
        /#
            assertmsg("Map errors. See above");
        #/
        return;
    }
    return 1;
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2488
// Size: 0x424
function dzmainloop() {
    level endon("game_ended");
    seticonnames();
    initwaypointicons();
    setomnvar("ui_objective_timer_stopped", 1);
    setomnvar("ui_hardpoint_timer", 0);
    level.zone = getfirstzone();
    var_2afaf68657598b47 = 1;
    level.kothhillrotation = 0;
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level waittill_any_2("prematch_done", "start_mode_setup");
    }
    level.zone namespace_8276d48525f0f398::activatezone();
    level.favorclosespawnent = level.zone;
    level.zone.active = 1;
    level.zone namespace_19b4203b51d56488::setvisibleteam("any");
    level.zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icontarget);
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.player = level.zone;
    var_7e2c53b0bcf117d9.eventname = "hill_moved";
    var_7e2c53b0bcf117d9.position = level.zone.trigger.origin;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    setomnvar("ui_objective_timer_stopped", 0);
    var_570ba02607c0425c = 0;
    if (level.firstzoneactivationdelay) {
        var_570ba02607c0425c = 1;
        level.zoneendtime = int(gettime() + level.firstzoneactivationdelay * 1000);
        setomnvar("ui_hardpoint_timer", level.zoneendtime);
        setomnvar("ui_hq_status", 6);
        level.zoneislocked = 1;
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(undefined, "dz_control", "dz_control");
        level.zone thread namespace_19b4203b51d56488::function_d36dcacac1708708(level.firstzoneactivationdelay);
        wait(level.firstzoneactivationdelay);
        level.zoneislocked = 0;
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(undefined, "dz_capture", "dz_capture");
    }
    namespace_a34451ae3d453e::playsoundonplayers("mp_dropzone_obj_new");
    while (1) {
        level.zone.visuals[0] setscriptablepartstate("smoke", "idle", 0);
        level.objectivesetorder = 1;
        waittillframeend();
        level.zone namespace_19b4203b51d56488::enableobject();
        level.zone.capturecount = 0;
        if (level.codcasterenabled) {
            level.zone thread namespace_8276d48525f0f398::trackgametypevips();
        }
        namespace_b2d5aa2baf2b5701::clearlastteamspawns();
        hqactivatenextzone(var_570ba02607c0425c, var_2afaf68657598b47);
        var_2afaf68657598b47 = 0;
        var_570ba02607c0425c = 0;
        setomnvar("ui_hq_status", 8);
        namespace_b2d5aa2baf2b5701::clearlastteamspawns();
        hpcaptureloop();
        ownerteam = level.zone namespace_19b4203b51d56488::getownerteam();
        if (level.pausemodetimer) {
            level namespace_d576b6dc7cef9c62::resumetimer();
        }
        level.lastcaptureteam = undefined;
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
        if (getgametype() == "grnd" && level.kothhillrotation == 4) {
        }
        setomnvar("ui_hq_status", -1);
        wait(1);
    }
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28b3
// Size: 0x5a
function getfirstzone() {
    if (level.mapname == "mp_hardhat") {
        zone = level.objectives["5"];
        level.prevzoneindex = 5;
    } else {
        zone = level.objectives["1"];
        level.prevzoneindex = 1;
    }
    return zone;
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2915
// Size: 0x436
function getnextzone() {
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
    } else {
        level.prevzoneindex++;
        if (level.prevzoneindex > level.objectives.size) {
            level.prevzoneindex = 1;
        }
        zone = level.objectives[string(level.prevzoneindex)];
    }
    return zone;
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d53
// Size: 0x159
function spawn_next_zone() {
    writecurrentrotationteamscore();
    level.zone.visuals[0] setscriptablepartstate("smoke", "off", 0);
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
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.player = level.zone;
    var_7e2c53b0bcf117d9.eventname = "hill_moved";
    var_7e2c53b0bcf117d9.position = level.zone.trigger.origin;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb3
// Size: 0x268
function hqactivatenextzone(var_570ba02607c0425c, var_2afaf68657598b47) {
    if (var_2afaf68657598b47) {
        foreach (entry in level.teamnamelist) {
            namespace_944ddf7b8df1b0e3::statusdialog("obj_generic_capture", entry);
        }
    } else {
        foreach (entry in level.teamnamelist) {
            namespace_944ddf7b8df1b0e3::statusdialog("hp_new_location", entry);
        }
    }
    namespace_a34451ae3d453e::playsoundonplayers("mp_dropzone_obj_new");
    level.zone thread namespace_8276d48525f0f398::hardpoint_setneutral();
    level.zone namespace_19b4203b51d56488::allowuse("none");
    if (istrue(var_570ba02607c0425c)) {
        goto LOC_000001d4;
    }
    if (level.zoneactivationdelay) {
        level.zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icontarget);
        updateservericons("zone_activation_delay", 0);
        level.zoneendtime = int(gettime() + 1000 * level.zoneactivationdelay);
        setomnvar("ui_hardpoint_timer", level.zoneendtime);
        setomnvar("ui_hq_status", 6);
        level.zoneislocked = 1;
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(undefined, "dz_control", "dz_control");
        level.zone thread namespace_19b4203b51d56488::function_d36dcacac1708708(level.zoneactivationdelay);
        wait(level.zoneactivationdelay);
        level.zoneislocked = 0;
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(undefined, "dz_capture", "dz_capture");
    LOC_000001d4:
    }
LOC_000001d4:
    level.zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
    updateservericons("neutral", 0);
    if (level.zoneduration) {
        updateservericons("neutral", 0);
        thread movezoneaftertime(level.zoneduration);
        level.zoneendtime = int(gettime() + 1000 * level.zoneduration);
        setomnvar("ui_hardpoint_timer", level.zoneendtime);
    } else {
        level.zonedestroyedbytimer = 0;
    }
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3122
// Size: 0x48
function locktimeruntilcap() {
    level endon("zone_captured");
    while (1) {
        level.zoneendtime = int(gettime() + 1000 * level.zoneduration);
        setomnvar("ui_hardpoint_timer", level.zoneendtime);
        waitframe();
    }
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3171
// Size: 0x16c
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
        namespace_a34451ae3d453e::playsoundonplayers("mp_dropzone_captured_positive", ownerteam);
        namespace_a34451ae3d453e::playsoundonplayers("mp_dropzone_captured_negative", getotherteam(ownerteam)[0]);
        thread namespace_3bde6869e44a2770::headquarters_newhq_music();
        thread updaterespawntimer();
        destroy_team = level waittill("zone_destroyed");
        level.spawndelay = undefined;
        if (isdefined(destroy_team)) {
            level.zone namespace_19b4203b51d56488::setownerteam(destroy_team);
        } else {
            level.zone namespace_19b4203b51d56488::setownerteam("none");
        }
    }
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32e4
// Size: 0x270
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
        while (waittime < seconds) {
            waitframe();
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
        if (!level.zone.stalemate && !level.gameended) {
            if (level.zoneadditivescoring) {
                score = level.zone.touchlist[team].size;
            }
            namespace_e8a49b70d0769b66::giveteamscoreforobjective(team, score, 0);
            foreach (object in level.zone.touchlist[team]) {
                object.player incpersstat("objTime", 1);
                if (isdefined(object.player.timebyrotation[level.kothhillrotation])) {
                    object.player.timebyrotation[level.kothhillrotation]++;
                } else {
                    object.player.timebyrotation[level.kothhillrotation] = 1;
                }
                object.player namespace_2685ec368e022695::statsetchild("round", "objTime", object.player.pers["objTime"]);
                object.player setextrascore0(object.player.pers["objTime"]);
                object.player namespace_e8a49b70d0769b66::giveplayerscore(#"hash_61e7451e5d97d089", 10);
            }
        }
    }
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x355b
// Size: 0x66
function movezoneaftertime(time) {
    level notify("startMoveTimer");
    level endon("startMoveTimer");
    level endon("game_ended");
    level endon("zone_reset");
    level endon("dev_force_zone");
    level.zonemovetime = time;
    level.zonedestroyedbytimer = 0;
    namespace_8276d48525f0f398::zonetimerwait();
    level.zonedestroyedbytimer = 1;
    level notify("zone_moved");
    level notify("zone_destroyed");
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x35c8
// Size: 0x1f1
function give_capture_credit(touchlist, capturetime, capture_team, lastcaptureteam, var_22282e7d48ca3400) {
    level endon("game_ended");
    level.lastcaptime = gettime();
    first_player = var_22282e7d48ca3400;
    if (isdefined(first_player.owner)) {
        first_player = first_player.owner;
    }
    if (isplayer(first_player)) {
        if (!isscoreboosting(first_player)) {
            var_7e2c53b0bcf117d9 = spawnstruct();
            var_7e2c53b0bcf117d9.player = first_player;
            var_7e2c53b0bcf117d9.eventname = "capture";
            var_7e2c53b0bcf117d9.position = first_player.origin;
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
            first_player thread doscoreevent(#"dz_capture");
            if (isdefined(level.zone.lastactivatetime) && gettime() - level.zone.lastactivatetime <= 2100) {
                first_player thread namespace_48a08c5037514e04::doscoreevent(#"hash_4d98aed9e6ebbf28");
            }
            if (first_player.lastkilltime + 500 > gettime()) {
                goto LOC_00000167;
            }
            first_player namespace_8276d48525f0f398::setcrankedtimerzonecap(first_player);
        LOC_00000167:
        }
    LOC_00000167:
    }
LOC_00000167:
    players = getarraykeys(touchlist);
    for (i = 0; i < players.size; i++) {
        player = touchlist[players[i]].player;
        player updatecapsperminute(lastcaptureteam);
        if (!isscoreboosting(player)) {
            player incpersstat("captures", 1);
            player namespace_2685ec368e022695::statsetchild("round", "captures", player.pers["captures"]);
        } else {
            /#
                player iprintlnbold("icon_waypoint_locked");
            #/
        }
        wait(0.05);
    }
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37c0
// Size: 0x341
function randomdrops() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    level.grnd_previouscratetypes = [];
    while (1) {
        ownerteam = level.zone namespace_19b4203b51d56488::getownerteam();
        var_4440147083abaf0a = 1;
        if (isdefined(ownerteam) && ownerteam != "neutral" && currentactivevehiclecount() < maxvehiclesallowed() && level.fauxvehiclecount + var_4440147083abaf0a < maxvehiclesallowed() && namespace_6c578d6ef48f10ef::getnumdroppedcrates() < 8) {
            cratetype = getdropzonecratetype();
            nodes = [];
            if (isdefined(level.zone.trigger.var_8d213e19bb3a154a)) {
                nodes = getnodesinradius(level.zone.trigger.origin, level.zone.trigger.var_8d213e19bb3a154a, 0);
            } else {
                nodes = getnodesintrigger(level.zone.trigger);
            }
            if (shoulddonodedrop(cratetype) && isdefined(nodes) && nodes.size > 0) {
                var_caac702d63510a96 = randomintrange(0, nodes.size);
                position = nodes[var_caac702d63510a96];
                droporigin = getclosestpointonnavmesh(position.origin);
                tracestart = position.origin;
                traceend = droporigin;
                contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 1, 0);
                ignoreents = [];
                trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
                position = trace["position"];
            } else {
                position = getdropposition() + (randomintrange(-50, 50), randomintrange(-50, 50), 0);
            }
            if (cratetype == "mega") {
                streakinfo = spawnstruct();
                streakinfo.streakname = "airdrop_multiple";
                streakinfo.cratetype = undefined;
                streakinfo.numcrates = undefined;
                streakinfo.usephysics = undefined;
                namespace_f64231d5b7a2c3c4::reservevehicle();
                namespace_80452e5c7b267d14::airdrop_multiple_dropcrates(undefined, ownerteam, position, randomfloat(360), position, 1, streakinfo);
            } else {
                vehicleisreserved = namespace_f64231d5b7a2c3c4::reservevehicle();
                scenenode = namespace_6c578d6ef48f10ef::dropkillstreakcratefromscriptedheli(undefined, ownerteam, cratetype, position, randomfloat(360), position, vehicleisreserved);
                foreach (crate in scenenode.crates) {
                    crate.skipminimapicon = 1;
                }
            }
            waittime = level.droptime;
        } else {
            waittime = 0.5;
        }
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(waittime);
    }
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b08
// Size: 0x2d7
function shoulddonodedrop(cratetype) {
    if (cratetype == "mega") {
        return 0;
    }
    if (level.mapname == "mp_vacant") {
        if (isdefined(level.zone.trigger.script_label) && level.zone.trigger.script_label == "4") {
            return 0;
        }
    } else if (issubstr(level.mapname, "mp_aniyah")) {
        if (isdefined(level.zone.trigger.script_label) && level.zone.trigger.script_label == "1") {
            return 0;
        }
    } else if (level.mapname == "mp_raid") {
        if (isdefined(level.zone.trigger.script_label) && level.zone.trigger.script_label == "6") {
            return 0;
        }
    } else if (level.mapname == "mp_petrograd") {
        if (isdefined(level.zone.trigger.script_label) && level.zone.trigger.script_label == "1") {
            return 0;
        }
    } else if (issubstr(level.mapname, "mp_hackney")) {
        if (isdefined(level.zone.trigger.script_label) && level.zone.trigger.script_label == "4") {
            return 0;
        }
    } else if (issubstr(level.mapname, "mp_shipment")) {
        if (isdefined(level.zone.trigger.script_label) && level.zone.trigger.script_label == "1") {
            return 0;
        }
    } else if (issubstr(level.mapname, "mp_emporium")) {
        return 0;
    } else if (level.mapname == "mp_backlot2") {
        if (isdefined(level.zone.trigger.script_label) && level.zone.trigger.script_label == "5") {
            return 0;
        }
    }
    return 1;
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3de7
// Size: 0x1c9
function getdropposition() {
    if (level.mapname == "mp_vacant" && isdefined(level.zone.trigger.script_label) && level.zone.trigger.script_label == "4") {
        return (1760, 701, 122);
    } else if (level.mapname == "mp_emporium" && isdefined(level.zone.trigger.script_label)) {
        switch (level.zone.trigger.script_label) {
        case #"hash_31100fbc01bd387c":
            return (-732, -136, 608);
        case #"hash_311012bc01bd3d35":
            return (672, -1336, 608);
        case #"hash_311011bc01bd3ba2":
            return (44, 968, 608);
        case #"hash_31100cbc01bd33c3":
            return (-680, -1552, 608);
        case #"hash_31100bbc01bd3230":
            return (832, 4, 608);
            break;
        }
    } else if (level.mapname == "mp_backlot2" && isdefined(level.zone.trigger.script_label) && level.zone.trigger.script_label == "5") {
        return (-346, -2368, 66);
    }
    return level.zone.origin;
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fb8
// Size: 0xcc
function getbestplayer() {
    bestplayer = undefined;
    besttime = 0;
    ownerteam = level.zone namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        return bestplayer;
    }
    foreach (object in level.zone.touchlist[ownerteam]) {
        if (besttime == 0 || besttime > object.starttime) {
            besttime = object.starttime;
            bestplayer = object.player;
        }
    }
    return bestplayer;
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x408c
// Size: 0x1a9
function getspawnpoint() {
    spawnteam = self.pers["team"];
    var_2fa17baefe0fa286 = getobjzonedeadzonedist();
    var_ba0a9fd614a3f6ee = namespace_b41002c7afebd276::function_75c03ed937b75b22(level.zone.visuals[0] getentitynumber(), level.zone.visuals[0].furthestspawndistsq, var_2fa17baefe0fa286 * var_2fa17baefe0fa286, level.enemy_spawn_influence_dist_sq);
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        if (spawnteam == game["attackers"]) {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers", undefined, var_ba0a9fd614a3f6ee);
        } else {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders", undefined, var_ba0a9fd614a3f6ee);
        }
    } else {
        if (!isdefined(level.switchedtohardpointspawnlogic)) {
            level.switchedtohardpointspawnlogic = 1;
            if (function_bff229a11ecd1e34()) {
                namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"objective");
            } else {
                namespace_b2d5aa2baf2b5701::setactivespawnlogic("DZ", "Crit_Default");
            }
        }
        spawnpoints = removespawnsinactivedz(level.zone.spawnpoints);
        fallbackspawnpoints = removespawnsinactivedz(level.zone.fallbackspawnpoints);
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, level.zone.spawnset, level.zone.fallbackspawnset, 2, var_ba0a9fd614a3f6ee);
    }
    return spawnpoint;
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x423d
// Size: 0xc
function getobjzonedeadzonedist() {
    return level.spawn_deadzone_dist;
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4251
// Size: 0x8f
function removespawnsinactivedz(spawnpoints) {
    var_d294628716ab60f9 = [];
    if (isdefined(spawnpoints)) {
        foreach (spawnpoint in spawnpoints) {
            if (!ispointinvolume(spawnpoint.origin, level.zone.trigger)) {
                var_d294628716ab60f9[var_d294628716ab60f9.size] = spawnpoint;
            }
        }
    }
    return var_d294628716ab60f9;
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42e8
// Size: 0xa1
function onplayerconnect(player) {
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
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4390
// Size: 0x1c
function onplayerspawned(player) {
    while (1) {
        player waittill("spawned");
    }
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43b3
// Size: 0x2b
function onspawnplayer(var_9156b53bcf7ce573) {
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
    thread updatematchstatushintonspawn();
    level.personalnukecostoverride = 30;
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43e5
// Size: 0x3b
function gethqownerteamvalue(ownerteam) {
    if (ownerteam == "allies") {
        var_cabc886d846dd979 = 2;
    } else if (ownerteam == "axis") {
        var_cabc886d846dd979 = 1;
    } else {
        var_cabc886d846dd979 = 0;
    }
    return var_cabc886d846dd979;
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4428
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

// Namespace grnd/namespace_36b7108419a0e401
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44cb
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

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x454f
// Size: 0x9b
function updaterespawntimer() {
    level endon("game_ended");
    level endon("zone_moved");
    level endon("zone_destroyed");
    starttime = gettime();
    if (level.zoneduration > 0) {
        endtime = starttime + level.zoneduration * 1000;
    } else {
        endtime = starttime + gettimelimit() * 1000 - gettimepassed();
    }
    currenttime = starttime;
    while (currenttime < endtime) {
        currenttime = gettime();
        level.spawndelay = (endtime - currenttime) / 1000 + 0.1;
        waitframe();
    }
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f1
// Size: 0x73
function seticonnames() {
    level.icontarget = "dz_target";
    level.iconneutral = "dz_neutral";
    level.iconcapture = "dz_enemy";
    level.icondefend = "dz_friendly";
    level.iconcontested = "dz_contested";
    level.icontaking = "dz_taking";
    level.iconlosing = "dz_losing";
    level.icondefending = "dz_defending";
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x466b
// Size: 0xec
function initwaypointicons() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("dz_enemy", 0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dz", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("dz_friendly", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dz", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("dz_defending", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dz", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("dz_neutral", 0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dz", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("dz_contested", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dz", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("dz_losing", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dz", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("dz_target", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("dz_taking", 0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dz", 1);
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x475e
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

// Namespace grnd/namespace_36b7108419a0e401
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4830
// Size: 0x2a
function isscoreboosting(player) {
    return isdefined(player.capsperminute) && player.capsperminute > 3;
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4862
// Size: 0x4e
function writecurrentrotationteamscore() {
    if (level.kothhillrotation < 24) {
        setmatchdata("alliesRoundScore", level.kothhillrotation, getteamscore("allies"));
        setmatchdata("axisRoundScore", level.kothhillrotation, getteamscore("axis"));
    }
}

// Namespace grnd/namespace_36b7108419a0e401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48b7
// Size: 0x32
function updatematchstatushintonspawn() {
    level endon("game_ended");
    if (istrue(level.zoneislocked)) {
        namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("dz_control");
    } else {
        namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("dz_capture");
    }
}

