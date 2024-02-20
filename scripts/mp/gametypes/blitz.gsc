// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\equipment\tac_insert.gsc;
#using scripts\mp\playerlogic.gsc;

#namespace blitz;

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9e5
// Size: 0x297
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    flag_default_origins();
    allowed[0] = getgametype();
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registertimelimitdvar(getgametype(), 300);
        registerscorelimitdvar(getgametype(), 3);
        registerroundlimitdvar(getgametype(), 2);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        registerroundswitchdvar(getgametype(), 1, 0, 1);
    }
    updategametypedvars();
    if (level.winrule) {
        level.wingamebytype = "teamScores";
    } else {
        level.wingamebytype = "roundsWon";
    }
    level.teambased = 1;
    level.objectivebased = 1;
    level.overtimescorewinoverride = 1;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerkilled = &onplayerkilled;
    level.modeonspawnplayer = &onspawnplayer;
    level.resetscoreonroundstart = &function_180943832c190cc0;
    level.spawnnodetype = "mp_ctf_spawn";
    game["dialog"]["gametype"] = "gametype_blitz";
    game["dialog"]["offense_obj"] = "boost_blitz";
    game["dialog"]["defense_obj"] = "boost_blitz";
    game["dialog"]["enemyblitzflag_capt"] = "enemyblitzflag_capt";
    game["dialog"]["enemyblitzflag_drop"] = "enemyblitzflag_drop";
    game["dialog"]["enemyblitzflag_return"] = "enemyblitzflag_return";
    game["dialog"]["enemyblitzflag_taken"] = "enemyblitzflag_taken";
    game["dialog"]["ourblitzflag_capt"] = "ourblitzflag_capt";
    game["dialog"]["ourblitzflag_drop"] = "ourblitzflag_drop";
    game["dialog"]["ourblitzflag_getback"] = "ourblitzflag_getback";
    game["dialog"]["ourblitzflag_return"] = "ourblitzflag_return";
    game["dialog"]["ourblitzflag_taken"] = "ourblitzflag_taken";
    setomnvar("ui_ctf_flag_axis", -2);
    setomnvar("ui_ctf_flag_allies", -2);
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc83
// Size: 0xeb
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_2242911bb32fda25", getmatchrulesdata("blitzData", "winRule"));
    setdynamicdvar(@"hash_6900636c8a5e6124", getmatchrulesdata("blitzData", "captureCondition"));
    setdynamicdvar(@"hash_c99307e8c870a9a0", getmatchrulesdata("blitzData", "returnTime"));
    setdynamicdvar(@"hash_95d04eeafa839d02", getmatchrulesdata("carryData", "showEnemyCarrier"));
    setdynamicdvar(@"hash_597d04fab84c445d", getmatchrulesdata("carryData", "idleResetTime"));
    setdynamicdvar(@"hash_d8f0b1e4678a7a1a", getmatchrulesdata("carryData", "pickupTime"));
    setdynamicdvar(@"hash_4ee2c8d42a5bdca7", 0);
    registerhalftimedvar("blitz", 0);
    setdynamicdvar(@"hash_9981b8204c05d5a9", 0);
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd75
// Size: 0xc
function onspawnplayer(var_9156b53bcf7ce573) {
    
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd88
// Size: 0x20a
function onstartgametype() {
    inot = inovertime();
    var_31e2a8f506168626 = game["overtimeRoundsPlayed"] == 0;
    var_c640a385cfd8bb75 = istimetobeatvalid();
    if (inot) {
        if (var_31e2a8f506168626) {
            setomnvar("ui_round_hint_override_attackers", 1);
            setomnvar("ui_round_hint_override_defenders", 1);
        } else if (var_c640a385cfd8bb75) {
            setomnvar("ui_round_hint_override_attackers", ter_op(game["timeToBeatTeam"] == game["attackers"], 2, 3));
            setomnvar("ui_round_hint_override_defenders", ter_op(game["timeToBeatTeam"] == game["defenders"], 2, 3));
        } else {
            setomnvar("ui_round_hint_override_attackers", 4);
            setomnvar("ui_round_hint_override_defenders", 4);
        }
    }
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (inovertime()) {
        setdvar(@"hash_8ecb43b0c41972de", 0);
    } else if (game["switchedsides"]) {
        setdvar(@"hash_8ecb43b0c41972de", 2);
    } else {
        setdvar(@"hash_8ecb43b0c41972de", 1);
    }
    if (!isdefined(game["original_defenders"])) {
        game["original_defenders"] = game["defenders"];
    }
    setclientnamemode("auto_change");
    if (level.splitscreen) {
        setobjectivescoretext(game["attackers"], "OBJECTIVES_ONE_FLAG_ATTACKER");
        setobjectivescoretext(game["defenders"], "OBJECTIVES_ONE_FLAG_DEFENDER");
    } else {
        setobjectivescoretext(game["attackers"], "OBJECTIVES_ONE_FLAG_ATTACKER_SCORE");
        setobjectivescoretext(game["defenders"], "OBJECTIVES_ONE_FLAG_DEFENDER_SCORE");
    }
    setobjectivetext(game["attackers"], "OBJECTIVES/BLITZ");
    setobjectivetext(game["defenders"], "OBJECTIVES/BLITZ");
    setobjectivehinttext(game["attackers"], "OBJECTIVES_ONE_FLAG_ATTACKER_HINT");
    setobjectivehinttext(game["defenders"], "OBJECTIVES_ONE_FLAG_DEFENDER_HINT");
    flag_setupvfx();
    createflagsandhud();
    initspawns();
    /#
    #/
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf99
// Size: 0x9d
function updategametypedvars() {
    updatecommongametypedvars();
    level.winrule = dvarintvalue("winRule", 0, 0, 1);
    level.showenemycarrier = dvarintvalue("showEnemyCarrier", 5, 0, 6);
    level.idleresettime = dvarfloatvalue("idleResetTime", 30, 0, 60);
    level.capturecondition = dvarintvalue("captureCondition", 0, 0, 1);
    level.pickuptime = dvarfloatvalue("pickupTime", 0, 0, 10);
    level.returntime = dvarfloatvalue("returnTime", 0, -1, 25);
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x103d
// Size: 0x1be
function createflagsandhud() {
    level.flagmodel["allies"] = "ctf_game_flag_west";
    level.flagbase["allies"] = "ctf_game_flag_base";
    level.carryflag["allies"] = "prop_ctf_game_flag_west";
    level.flagmodel["axis"] = "ctf_game_flag_east";
    level.flagbase["axis"] = "ctf_game_flag_base";
    level.carryflag["axis"] = "prop_ctf_game_flag_east";
    level.closecapturekiller = [];
    level.closecapturekiller["allies"] = undefined;
    level.closecapturekiller["axis"] = undefined;
    setupwaypointicons();
    level.iconescort = "waypoint_blitz_escort";
    level.iconkill = "waypoint_blitz_kill";
    level.iconpickupflag = "waypoint_blitz_pickup";
    level.icongoalflag = "waypoint_blitz_goal";
    level.iconreturnflag = "waypoint_blitz_reset";
    level.iconresettingflag = "waypoint_blitz_resetting";
    level.iconlosingflag = "waypoint_blitz_pickup_losing";
    level.icondefendflag = "waypoint_blitz_defend";
    level.iconpickupdefendflag = "waypoint_blitz_pickup_defend";
    level.teamflags[game["defenders"]] = createteamflag(game["defenders"], "axis");
    level.teamflags[game["attackers"]] = createteamflag(game["attackers"], "allies");
    level.capzones[game["defenders"]] = createcapzone(game["defenders"], "axis");
    level.capzones[game["attackers"]] = createcapzone(game["attackers"], "allies");
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1202
// Size: 0x3
function flag_setupvfx() {
    
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x120c
// Size: 0x14b
function initspawns() {
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("AwayFromEnemies", "Crit_Default");
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_ctf_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_ctf_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_ctf_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_ctf_spawn");
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    assignteamspawns();
    level.ctfteamspawnsetids["allies"] = "allies";
    level.ctfteamspawnsetids["axis"] = "axis";
    namespace_b2d5aa2baf2b5701::registerspawnset("allies", level.teamspawnpoints["allies"]);
    namespace_b2d5aa2baf2b5701::registerspawnset("axis", level.teamspawnpoints["axis"]);
    namespace_b2d5aa2baf2b5701::registerspawnset("neutral", level.teamspawnpoints["neutral"]);
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x135e
// Size: 0x42e
function assignteamspawns() {
    spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray(level.spawnnodetype);
    ispathdataavailable = namespace_b2d5aa2baf2b5701::ispathdataavailable();
    level.teamspawnpoints["axis"] = [];
    level.teamspawnpoints["allies"] = [];
    level.teamspawnpoints["neutral"] = [];
    if (level.teamflags.size == 2) {
        var_52283a0a1cf75c1e = level.teamflags["allies"];
        var_5228390a1cf759eb = level.teamflags["axis"];
        var_22d30d2db06d47ea = (var_52283a0a1cf75c1e.curorigin[0], var_52283a0a1cf75c1e.curorigin[1], 0);
        var_4f73762dd18a9b93 = (var_5228390a1cf759eb.curorigin[0], var_5228390a1cf759eb.curorigin[1], 0);
        var_556bd2ab7d99178b = var_4f73762dd18a9b93 - var_22d30d2db06d47ea;
        var_7562a3d0685ea6eb = length2d(var_556bd2ab7d99178b);
        foreach (spawnpoint in spawnpoints) {
            var_c982049ea3238d92 = (spawnpoint.origin[0], spawnpoint.origin[1], 0);
            var_9af7b82de70e01d8 = var_c982049ea3238d92 - var_22d30d2db06d47ea;
            var_4d2d882316198c95 = vectordot(var_9af7b82de70e01d8, var_556bd2ab7d99178b);
            var_a40d2cea46f228ca = var_4d2d882316198c95 / var_7562a3d0685ea6eb * var_7562a3d0685ea6eb;
            if (var_a40d2cea46f228ca < 0.33) {
                spawnpoint.teambase = var_52283a0a1cf75c1e.ownerteam;
                level.teamspawnpoints[spawnpoint.teambase][level.teamspawnpoints[spawnpoint.teambase].size] = spawnpoint;
            } else if (var_a40d2cea46f228ca > 0.67) {
                spawnpoint.teambase = var_5228390a1cf759eb.ownerteam;
                level.teamspawnpoints[spawnpoint.teambase][level.teamspawnpoints[spawnpoint.teambase].size] = spawnpoint;
            } else {
                var_5838748bf91be3c2 = undefined;
                var_d11e294724d3abcb = undefined;
                if (ispathdataavailable) {
                    var_5838748bf91be3c2 = getpathdist(spawnpoint.origin, var_52283a0a1cf75c1e.curorigin, 999999);
                }
                if (isdefined(var_5838748bf91be3c2) && var_5838748bf91be3c2 != -1) {
                    var_d11e294724d3abcb = getpathdist(spawnpoint.origin, var_5228390a1cf759eb.curorigin, 999999);
                }
                if (!isdefined(var_d11e294724d3abcb) || var_d11e294724d3abcb == -1) {
                    var_5838748bf91be3c2 = distance2d(var_52283a0a1cf75c1e.curorigin, spawnpoint.origin);
                    var_d11e294724d3abcb = distance2d(var_5228390a1cf759eb.curorigin, spawnpoint.origin);
                }
                var_7c7809cdc3f571e5 = max(var_5838748bf91be3c2, var_d11e294724d3abcb);
                var_126715ed2b04d65f = min(var_5838748bf91be3c2, var_d11e294724d3abcb);
                var_882f07cd483ee4da = var_126715ed2b04d65f / var_7c7809cdc3f571e5;
                if (var_882f07cd483ee4da > 0.5) {
                    level.teamspawnpoints["neutral"][level.teamspawnpoints["neutral"].size] = spawnpoint;
                }
            }
        }
    } else {
        foreach (spawnpoint in spawnpoints) {
            spawnpoint.teambase = getnearestflagteam(spawnpoint);
            if (spawnpoint.teambase == "axis") {
                level.teamspawnpoints["axis"][level.teamspawnpoints["axis"].size] = spawnpoint;
            } else {
                level.teamspawnpoints["allies"][level.teamspawnpoints["allies"].size] = spawnpoint;
            }
        }
    }
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1793
// Size: 0xfe
function getnearestflagteam(spawnpoint) {
    ispathdataavailable = namespace_b2d5aa2baf2b5701::ispathdataavailable();
    nearestflag = undefined;
    nearestdist = undefined;
    foreach (flag in level.teamflags) {
        dist = undefined;
        if (ispathdataavailable) {
            dist = getpathdist(spawnpoint.origin, flag.curorigin, 999999);
        }
        if (!isdefined(dist) || dist == -1) {
            dist = distancesquared(flag.curorigin, spawnpoint.origin);
        }
        if (!isdefined(nearestflag) || dist < nearestdist) {
            nearestflag = flag;
            nearestdist = dist;
        }
    }
    return nearestflag.ownerteam;
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1899
// Size: 0xdb
function getspawnpoint() {
    spawnteam = self.pers["team"];
    enemyteam = getotherteam(spawnteam)[0];
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        if (level.mapname == "mp_runner") {
            spawnteam = getotherteam(spawnteam)[0];
            enemyteam = getotherteam(enemyteam)[0];
        }
        if (game["switchedsides"]) {
            spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_ctf_spawn_" + enemyteam + "_start");
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_startspawn(spawnpoints);
        } else {
            spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_ctf_spawn_" + spawnteam + "_start");
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_startspawn(spawnpoints);
        }
    } else {
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, level.ctfteamspawnsetids[spawnteam], "neutral");
    }
    return spawnpoint;
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x197c
// Size: 0x279
function flag_default_origins() {
    level.default_goal_origins = [];
    level.flags = getentarray("flag_primary", "targetname");
    if (!isdefined(game["attackers"])) {
        game["attackers"] = "allies";
    }
    if (!isdefined(game["defenders"])) {
        game["defenders"] = "axis";
    }
    if (istrue(game["switchedsides"])) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    foreach (flag in level.flags) {
        switch (flag.script_label) {
        case #"hash_fac2c5f6bddd49bd":
            if (istrue(game["switchedsides"])) {
                level.default_flag_origins[game["defenders"]] = flag.origin;
            } else {
                level.default_flag_origins[game["attackers"]] = flag.origin;
            }
            break;
        case #"hash_fac2c3f6bddd4697":
            if (istrue(game["switchedsides"])) {
                level.default_flag_origins[game["attackers"]] = flag.origin;
            } else {
                level.default_flag_origins[game["defenders"]] = flag.origin;
            }
            break;
        }
    }
    trigger = getent("ctf_zone_" + game["defenders"], "targetname");
    if (isdefined(trigger)) {
        if (istrue(game["switchedsides"])) {
            level.default_flag_origins[game["attackers"]] = trigger.origin;
        } else {
            level.default_flag_origins[game["defenders"]] = trigger.origin;
        }
    }
    trigger = getent("ctf_zone_" + game["attackers"], "targetname");
    if (isdefined(trigger)) {
        if (istrue(game["switchedsides"])) {
            level.default_flag_origins[game["defenders"]] = trigger.origin;
        } else {
            level.default_flag_origins[game["attackers"]] = trigger.origin;
        }
    }
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bfc
// Size: 0x97
function flag_create_team_goal(team) {
    goal = spawnstruct();
    if (!isdefined(goal.origin)) {
        goal.origin = level.default_flag_origins[team];
    }
    goal flag_find_ground();
    goal.origin = goal.ground_origin;
    goal.radius = 30;
    goal.team = team;
    goal.ball_in_goal = 0;
    goal.highestspawndistratio = 0;
    return goal;
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c9b
// Size: 0xb6
function flag_find_ground(z_offset) {
    tracestart = self.origin + (0, 0, 32);
    traceend = self.origin + (0, 0, -1000);
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    self.ground_origin = trace["position"];
    return trace["fraction"] != 0 && trace["fraction"] != 1;
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d59
// Size: 0x117
function showflagradiuseffecttoplayers(team, player, position) {
    if (isdefined(player._flagradiuseffect[team])) {
        player._flagradiuseffect[team] delete();
    }
    effect = undefined;
    var_8e879faf3052e0d2 = player.team;
    iscodcaster = player iscodcaster();
    if (iscodcaster) {
        var_8e879faf3052e0d2 = player function_638eebeff841e16a();
    } else if (var_8e879faf3052e0d2 == "spectator") {
        var_8e879faf3052e0d2 = "allies";
    }
    if (var_8e879faf3052e0d2 == team) {
        var_64df8525ae68ebe4 = spawnfxforclient(level.flagradiusfxid["friendly"], position, player, (0, 0, 1));
        var_64df8525ae68ebe4 setfxkilldefondelete();
    } else {
        var_64df8525ae68ebe4 = spawnfxforclient(level.flagradiusfxid["enemy"], position, player, (0, 0, 1));
        var_64df8525ae68ebe4 setfxkilldefondelete();
    }
    player._flagradiuseffect[team] = var_64df8525ae68ebe4;
    triggerfx(var_64df8525ae68ebe4);
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e77
// Size: 0x113
function showbaseeffecttoplayer(team, player) {
    if (isdefined(player._flageffect[team])) {
        player._flageffect[team] delete();
    }
    effect = undefined;
    var_8e879faf3052e0d2 = player.team;
    iscodcaster = player iscodcaster();
    if (iscodcaster) {
        var_8e879faf3052e0d2 = player function_638eebeff841e16a();
    } else if (var_8e879faf3052e0d2 == "spectator") {
        var_8e879faf3052e0d2 = "allies";
    }
    if (var_8e879faf3052e0d2 == team) {
        var_64df8525ae68ebe4 = spawnfxforclient(level.flagbaseglowfxid["friendly"], self.origin, player, self.baseeffectforward);
        var_64df8525ae68ebe4 setfxkilldefondelete();
    } else {
        var_64df8525ae68ebe4 = spawnfxforclient(level.flagbaseglowfxid["enemy"], self.origin, player, self.baseeffectforward);
        var_64df8525ae68ebe4 setfxkilldefondelete();
    }
    player._flageffect[team] = var_64df8525ae68ebe4;
    triggerfx(var_64df8525ae68ebe4);
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f91
// Size: 0x40
function setteaminhuddatafromteamname(teamname) {
    if (teamname == "axis") {
        self setteaminhuddata(1);
    } else if (teamname == "allies") {
        self setteaminhuddata(2);
    } else {
        self setteaminhuddata(0);
    }
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1fd8
// Size: 0x5d9
function createteamflag(team, entityteam) {
    var_da71d292931c16b = 0;
    var_b7ba378ae30bedb4 = flag_create_team_goal(team);
    trigger = spawn("trigger_radius", var_b7ba378ae30bedb4.origin - (0, 0, var_b7ba378ae30bedb4.radius / 2), 0, var_b7ba378ae30bedb4.radius, 80);
    trigger.no_moving_platfrom_unlink = 1;
    trigger.linktoenabledflag = 1;
    trigger.baseorigin = trigger.origin;
    var_da71d292931c16b = 1;
    visuals[0] = spawn("script_model", var_b7ba378ae30bedb4.origin);
    visuals[0] setasgametypeobjective();
    visuals[0] setteaminhuddatafromteamname(entityteam);
    if (!isdefined(visuals[0])) {
    }
    if (!var_da71d292931c16b) {
        radius = 15;
        if (level.pickuptime > 0 || level.returntime > 0) {
            radius = radius * 2;
        }
        var_25d213b4714288ce = spawn("trigger_radius", trigger.origin, 0, radius, trigger.height);
        trigger = var_25d213b4714288ce;
    }
    visuals[0] setmodel(level.flagmodel[team]);
    visuals[0] setasgametypeobjective();
    visuals[0] setteaminhuddatafromteamname(entityteam);
    var_3bc2b88a59b6d062 = namespace_19b4203b51d56488::createcarryobject(team, trigger, visuals, (0, 0, 72));
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::allowcarry("friendly");
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setteamusetime("friendly", level.pickuptime);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setteamusetime("enemy", level.returntime);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setvisibleteam("friendly");
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_3bc2b88a59b6d062.objidnum, 0);
    var_3bc2b88a59b6d062.atbase = 1;
    var_3bc2b88a59b6d062.allowweapons = 1;
    var_3bc2b88a59b6d062.onpickup = &onpickup;
    var_3bc2b88a59b6d062.onpickupfailed = &onpickup;
    var_3bc2b88a59b6d062.ondrop = &ondrop;
    var_3bc2b88a59b6d062.onreset = &onreset;
    var_3bc2b88a59b6d062.onbeginuse = &onresetstart;
    var_3bc2b88a59b6d062.onenduse = &onresetend;
    if (level.pickuptime > 0 || level.returntime > 0) {
        var_3bc2b88a59b6d062.nousebar = 1;
        var_3bc2b88a59b6d062.claimgracetime = max(level.pickuptime * 1000, level.returntime * 1000);
        var_3bc2b88a59b6d062 namespace_19b4203b51d56488::pinobjiconontriggertouch();
    }
    if (isdefined(level.showenemycarrier)) {
        switch (level.showenemycarrier) {
        case 0:
            var_3bc2b88a59b6d062.objidpingfriendly = 0;
            var_3bc2b88a59b6d062.objidpingenemy = 1;
            var_3bc2b88a59b6d062.objpingdelay = 60;
            break;
        case 1:
            var_3bc2b88a59b6d062.objidpingfriendly = 0;
            var_3bc2b88a59b6d062.objidpingenemy = 1;
            var_3bc2b88a59b6d062.objpingdelay = 0.05;
            break;
        case 2:
            var_3bc2b88a59b6d062.objidpingfriendly = 0;
            var_3bc2b88a59b6d062.objidpingenemy = 1;
            var_3bc2b88a59b6d062.objpingdelay = 1;
            break;
        case 3:
            var_3bc2b88a59b6d062.objidpingfriendly = 0;
            var_3bc2b88a59b6d062.objidpingenemy = 1;
            var_3bc2b88a59b6d062.objpingdelay = 1.5;
            break;
        case 4:
            var_3bc2b88a59b6d062.objidpingfriendly = 0;
            var_3bc2b88a59b6d062.objidpingenemy = 1;
            var_3bc2b88a59b6d062.objpingdelay = 2;
            break;
        case 5:
            var_3bc2b88a59b6d062.objidpingfriendly = 0;
            var_3bc2b88a59b6d062.objidpingenemy = 1;
            var_3bc2b88a59b6d062.objpingdelay = 3;
            break;
        case 6:
            var_3bc2b88a59b6d062.objidpingfriendly = 0;
            var_3bc2b88a59b6d062.objidpingenemy = 1;
            var_3bc2b88a59b6d062.objpingdelay = 4;
            break;
        }
    } else {
        var_3bc2b88a59b6d062.objidpingfriendly = 0;
        var_3bc2b88a59b6d062.objidpingenemy = 1;
        var_3bc2b88a59b6d062.objpingdelay = 3;
    }
    var_3bc2b88a59b6d062.oldradius = trigger.radius;
    tracestart = trigger.origin + (0, 0, 32);
    traceend = trigger.origin + (0, 0, -32);
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    var_3bc2b88a59b6d062.baseeffectpos = var_3bc2b88a59b6d062.visuals[0].origin;
    upangles = anglestoup(var_3bc2b88a59b6d062.visuals[0].angles);
    var_3bc2b88a59b6d062.baseeffectforward = anglestoforward(upangles);
    level.teamflagbases[team] = createteamflagbase(team, var_3bc2b88a59b6d062);
    return var_3bc2b88a59b6d062;
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25b9
// Size: 0xc2
function createteamflagbase(team, var_3bc2b88a59b6d062) {
    var_d9ca1813b9de5e20 = var_3bc2b88a59b6d062.visuals[0].origin;
    var_fd8b4c619f5e9ff = spawn("script_model", var_d9ca1813b9de5e20);
    var_fd8b4c619f5e9ff setmodel(level.flagbase[team]);
    var_fd8b4c619f5e9ff.ownerteam = team;
    var_fd8b4c619f5e9ff setasgametypeobjective();
    var_fd8b4c619f5e9ff setteaminhuddatafromteamname(team);
    var_fd8b4c619f5e9ff.baseeffectpos = var_d9ca1813b9de5e20;
    upangles = anglestoup(var_3bc2b88a59b6d062.visuals[0].angles);
    var_fd8b4c619f5e9ff.baseeffectforward = anglestoforward(upangles);
    return var_fd8b4c619f5e9ff;
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2683
// Size: 0x257
function createcapzone(team, entityteam) {
    var_b7ba378ae30bedb4 = flag_create_team_goal(team);
    trigger = getent("ctf_zone_" + entityteam, "targetname");
    if (!isdefined(trigger)) {
        trigger = spawn("trigger_radius", var_b7ba378ae30bedb4.origin - (0, 0, var_b7ba378ae30bedb4.radius / 2), 0, var_b7ba378ae30bedb4.radius, 80);
        trigger.no_moving_platfrom_unlink = 1;
        trigger.linktoenabledflag = 1;
        trigger.baseorigin = trigger.origin;
        trigger.height = 80;
    }
    var_25d213b4714288ce = spawn("trigger_radius", trigger.origin, 0, 15, trigger.height);
    trigger = var_25d213b4714288ce;
    visuals = [];
    var_e1c2bb288fc23e0d = namespace_19b4203b51d56488::createuseobject(team, trigger, visuals, (0, 0, 85));
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::allowuse("enemy");
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setvisibleteam("any");
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setobjectivestatusicons(level.iconpickupdefendflag, level.icongoalflag);
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setusetime(0);
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setkeyobject(level.teamflags[getotherteam(team)[0]]);
    var_e1c2bb288fc23e0d.onuse = &onuse;
    tracestart = trigger.origin + (0, 0, 32);
    traceend = trigger.origin + (0, 0, -32);
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    upangles = vectortoangles(trace["normal"]);
    forward = anglestoforward(upangles);
    right = anglestoright(upangles);
    return var_e1c2bb288fc23e0d;
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28e2
// Size: 0x6a
function onbeginuse(player) {
    team = player.pers["team"];
    if (team == namespace_19b4203b51d56488::getownerteam()) {
        self.trigger.radius = 1024;
    } else {
        self.trigger.radius = self.oldradius;
    }
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2953
// Size: 0x39
function onenduse(player, team, success) {
    self.trigger.radius = self.oldradius;
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2993
// Size: 0x423
function onpickup(player, var_5760e0f038d1baa3, defused) {
    self notify("picked_up");
    player notify("obj_picked_up");
    team = player.pers["team"];
    if (team == "allies") {
        otherteam = "axis";
    } else {
        otherteam = "allies";
    }
    if (team != namespace_19b4203b51d56488::getownerteam()) {
        if (isdefined(level.closecapturekiller[player.team]) && level.closecapturekiller[player.team] == player) {
            player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_fe8ba8ad4e2e427b");
        }
        level.closecapturekiller[player.team] = undefined;
        player thread doScoreEvent(#"flag_return");
        thread returnflag(team);
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = player;
        var_7e2c53b0bcf117d9.eventname = "obj_return";
        var_7e2c53b0bcf117d9.position = player.origin;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
        namespace_a34451ae3d453e::playsoundonplayers("mp_obj_returned", team);
        namespace_a34451ae3d453e::playsoundonplayers("mp_obj_returned", getotherteam(team)[0]);
        namespace_944ddf7b8df1b0e3::leaderdialog("ourblitzflag_return", otherteam, "status");
        namespace_944ddf7b8df1b0e3::leaderdialog("enemyblitzflag_return", team, "status");
        player incpersstat("returns", 1);
        player namespace_2685ec368e022695::statsetchild("round", "returns", player.pers["returns"]);
        if (isplayer(player)) {
            player setextrascore1(player.pers["returns"]);
        }
    } else {
        if (isdefined(level.ctf_loadouts) && isdefined(level.ctf_loadouts[team])) {
            player thread applyflagcarrierclass();
        } else {
            player attachflag();
        }
        self.atbase = 0;
        level.closecapturekiller[otherteam] = undefined;
        if (player.team == "allies") {
            setomnvar("ui_ctf_flag_allies", player getentitynumber());
        } else {
            setomnvar("ui_ctf_flag_axis", player getentitynumber());
        }
        player setclientomnvar("ui_flag_player_hud_icon", 1);
        if (isdefined(level.showenemycarrier)) {
            if (level.showenemycarrier == 0) {
                namespace_19b4203b51d56488::setvisibleteam("any");
            } else {
                namespace_19b4203b51d56488::setvisibleteam("any");
            }
        }
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconescort, level.iconkill);
        if (level.teamflags[otherteam].atbase) {
            level.capzones[otherteam] namespace_19b4203b51d56488::setobjectivestatusicons(level.iconpickupdefendflag, level.icongoalflag);
        } else {
            level.capzones[otherteam] namespace_19b4203b51d56488::setvisibleteam("any");
            level.capzones[otherteam] namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefendflag, level.icongoalflag);
        }
        level.capzones[team] namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefendflag, level.icongoalflag);
        if (level.capturecondition == 0) {
        }
        namespace_a34451ae3d453e::playsoundonplayers("mp_obj_taken", team);
        namespace_944ddf7b8df1b0e3::leaderdialog("ourblitzflag_taken", team);
        thread teamplayercardsplash("callout_flagpickup", player);
        if (!isdefined(self.previouscarrier) || self.previouscarrier != player) {
            player thread doScoreEvent(#"flag_grab");
        }
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = player;
        var_7e2c53b0bcf117d9.eventname = "pickup";
        var_7e2c53b0bcf117d9.position = player.origin;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
        self.previouscarrier = player;
        if (level.codcasterenabled) {
            player setgametypevip(1);
        }
    }
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dbd
// Size: 0x45
function returnflag(team) {
    self.atbase = 1;
    if (team == "allies") {
        setomnvar("ui_ctf_flag_allies", -2);
    } else {
        setomnvar("ui_ctf_flag_axis", -2);
    }
    namespace_19b4203b51d56488::returnhome();
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e09
// Size: 0x19b
function ondrop(player) {
    team = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(team)[0];
    namespace_19b4203b51d56488::allowcarry("any");
    namespace_19b4203b51d56488::setvisibleteam("any");
    objective_setpings(self.objidnum, 0);
    if (level.returntime >= 0) {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconpickupflag, level.iconreturnflag);
    } else {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconpickupflag, level.icongoalflag);
    }
    if (team == "allies") {
        setomnvar("ui_ctf_flag_allies", -1);
    } else {
        setomnvar("ui_ctf_flag_axis", -1);
    }
    if (isdefined(player)) {
        player setclientomnvar("ui_flag_player_hud_icon", 0);
    }
    var_86929bfc3b565860 = self.visuals[0] gettagorigin("tag_origin");
    if (isdefined(player)) {
        if (!isreallyalive(player)) {
            player.carryobject.previouscarrier = undefined;
        }
        if (isdefined(player.carryflag)) {
            player detachflag();
        }
        namespace_a34451ae3d453e::playsoundonplayers("iw9_mp_ui_objective_lost", otherteam);
        if (level.codcasterenabled) {
            player setgametypevip(0);
        }
    } else {
        namespace_a34451ae3d453e::playsoundonplayers("iw9_mp_ui_objective_lost", otherteam);
    }
    namespace_944ddf7b8df1b0e3::leaderdialog("enemyblitzflag_drop", otherteam, "status");
    namespace_944ddf7b8df1b0e3::leaderdialog("ourblitzflag_drop", team, "status");
    if (level.idleresettime > 0) {
        thread returnaftertime();
    }
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fab
// Size: 0x91
function returnaftertime() {
    self endon("picked_up");
    var_8e53d4ca3de8531a = 0;
    while (var_8e53d4ca3de8531a < level.idleresettime) {
        waitframe();
        if (self.claimteam == "none") {
            var_8e53d4ca3de8531a = var_8e53d4ca3de8531a + level.framedurationseconds;
        }
    }
    team = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(team)[0];
    namespace_a34451ae3d453e::playsoundonplayers("iw9_mp_ui_objective_taken", team);
    namespace_a34451ae3d453e::playsoundonplayers("iw9_mp_ui_objective_lost", otherteam);
    namespace_19b4203b51d56488::returnhome();
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3043
// Size: 0x137
function onreset() {
    team = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(team)[0];
    namespace_19b4203b51d56488::allowcarry("friendly");
    namespace_19b4203b51d56488::setvisibleteam("none");
    objective_setpings(self.objidnum, 0);
    if (team == "allies") {
        setomnvar("ui_ctf_flag_allies", -2);
    } else {
        setomnvar("ui_ctf_flag_axis", -2);
    }
    if (level.teamflags[team].atbase) {
        level.capzones[team] namespace_19b4203b51d56488::setobjectivestatusicons(level.iconpickupdefendflag, level.icongoalflag);
    }
    if (level.teamflags[otherteam].atbase) {
        level.capzones[team] namespace_19b4203b51d56488::setobjectivestatusicons(level.iconpickupdefendflag, level.icongoalflag);
    } else {
        level.capzones[team] namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefendflag, level.icongoalflag);
    }
    level.capzones[team] namespace_19b4203b51d56488::allowuse("enemy");
    self.previouscarrier = undefined;
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3181
// Size: 0x25
function onresetstart(player) {
    namespace_19b4203b51d56488::setobjectivestatusicons(level.iconlosingflag, level.iconresettingflag);
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x31ad
// Size: 0x39
function onresetend(player, team, success) {
    if (!success) {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconpickupflag, level.iconreturnflag);
    }
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31ed
// Size: 0x233
function onuse(player) {
    if (!level.gameended) {
        team = player.pers["team"];
        if (team == "allies") {
            otherteam = "axis";
        } else {
            otherteam = "allies";
        }
        player setclientomnvar("ui_flag_player_hud_icon", 0);
        namespace_944ddf7b8df1b0e3::leaderdialog("ourblitzflag_capt", team, "status");
        namespace_944ddf7b8df1b0e3::leaderdialog("enemyblitzflag_capt", otherteam, "status");
        thread teamplayercardsplash("callout_flagcapture", player);
        player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_7b8c8a78ac292c0d");
        player notify("objective", "captured");
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = player;
        var_7e2c53b0bcf117d9.eventname = "capture";
        var_7e2c53b0bcf117d9.position = player.origin;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
        if (level.codcasterenabled) {
            player setgametypevip(0);
        }
        player incpersstat("captures", 1);
        player namespace_2685ec368e022695::statsetchild("round", "captures", player.pers["captures"]);
        if (isplayer(player)) {
            player setextrascore0(player.pers["captures"]);
        }
        namespace_a34451ae3d453e::playsoundonplayers("mp_obj_captured", team);
        namespace_a34451ae3d453e::playsoundonplayers("mp_enemy_obj_captured", getotherteam(team)[0]);
        if (isdefined(player.carryflag)) {
            player detachflag();
        }
        if (isdefined(level.ctf_loadouts) && isdefined(level.ctf_loadouts[team])) {
            player thread removeflagcarrierclass();
        }
        level.closecapturekiller[team] = undefined;
        level.closecapturekiller[otherteam] = undefined;
        if (level.teamflags[getotherteam(team)[0]].atbase) {
            level namespace_e8a49b70d0769b66::giveteamscoreforobjective(team, 2, 0);
        } else {
            level namespace_e8a49b70d0769b66::giveteamscoreforobjective(team, 1, 0);
        }
        level.teamflags[team] returnflag(team);
    }
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3427
// Size: 0x2f
function onplayerconnect(player) {
    player._flageffect = [];
    player._flagradiuseffect = [];
    player thread onplayerspawned();
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x345d
// Size: 0x89
function onplayerspawned() {
    self endon("disconnect");
    while (1) {
        self waittill("spawned");
        self setclientomnvar("ui_flag_player_hud_icon", 0);
        setextrascore0(0);
        if (isdefined(self.pers["captures"])) {
            setextrascore0(self.pers["captures"]);
        }
        setextrascore1(0);
        if (isdefined(self.pers["returns"])) {
            setextrascore1(self.pers["returns"]);
        }
    }
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34ed
// Size: 0x119
function applyflagcarrierclass() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (isdefined(self.iscarrying) && self.iscarrying == 1) {
        self notify("force_cancel_placement");
        waitframe();
    }
    while (self ismantling()) {
        waitframe();
    }
    while (!self isonground()) {
        waitframe();
    }
    self.pers["gamemodeLoadout"] = level.ctf_loadouts[self.team];
    namespace_add8ab90fc53d7f7::spawnpoint_setspawnpoint(self.origin, self.angles);
    self.gamemode_chosenclass = self.class;
    self.pers["class"] = "gamemode";
    self.pers["lastClass"] = "gamemode";
    self.class = "gamemode";
    self.lastclass = "gamemode";
    self notify("faux_spawn");
    self.gameobject_fauxspawn = 1;
    self.faux_spawn_stance = self getstance();
    thread namespace_99ac021a7547cae3::spawnplayer(1);
    thread waitattachflag();
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x360d
// Size: 0x20
function waitattachflag() {
    level endon("game_ende");
    self endon("death_or_disconnect");
    self waittill("spawned_player");
    attachflag();
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3634
// Size: 0x9a
function removeflagcarrierclass() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (isdefined(self.iscarrying) && self.iscarrying == 1) {
        self notify("force_cancel_placement");
        waitframe();
    }
    while (self ismantling()) {
        waitframe();
    }
    while (!self isonground()) {
        waitframe();
    }
    self.pers["gamemodeLoadout"] = undefined;
    namespace_add8ab90fc53d7f7::spawnpoint_setspawnpoint(self.origin, self.angles);
    self notify("faux_spawn");
    self.faux_spawn_stance = self getstance();
    thread namespace_99ac021a7547cae3::spawnplayer(1);
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x36d5
// Size: 0x34a
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    var_aec2e5e01f424119 = 0;
    var_86c1c8628b1d55f8 = attacker.origin;
    attackerisinflictor = 0;
    if (isdefined(einflictor)) {
        var_86c1c8628b1d55f8 = einflictor.origin;
        attackerisinflictor = einflictor == attacker;
    }
    if (isdefined(attacker) && isplayer(attacker) && attacker.pers["team"] != self.pers["team"]) {
        if (isdefined(attacker.carryflag) && attackerisinflictor) {
            attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_f735b92839c5a687");
            var_aec2e5e01f424119 = 1;
        }
        if (isdefined(self.carryflag)) {
            var_33f8ce08c3e0650b = distancesquared(self.origin, level.capzones[self.team].trigger.origin);
            if (var_33f8ce08c3e0650b < 90000) {
                level.closecapturekiller[attacker.team] = attacker;
            } else {
                level.closecapturekiller[attacker.team] = undefined;
            }
            attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5311f153a7fee40c");
            attacker incpersstat("defends", 1);
            attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
            thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "carrying");
            var_aec2e5e01f424119 = 1;
        }
        if (!var_aec2e5e01f424119) {
            var_3cd1af2851f12ab5 = 0;
            var_c3f9fed5999c974e = 0;
            foreach (flag in level.teamflags) {
                var_d4d1706f5bca5abd = distsquaredcheck(var_86c1c8628b1d55f8, self.origin, flag.curorigin);
                if (var_d4d1706f5bca5abd) {
                    if (flag.ownerteam == self.team) {
                        var_3cd1af2851f12ab5 = 1;
                    } else {
                        var_c3f9fed5999c974e = 1;
                    }
                }
            }
            if (var_3cd1af2851f12ab5) {
                attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5a3b180273be47b1");
                thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "defending");
            } else if (var_c3f9fed5999c974e) {
                attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2");
                attacker incpersstat("defends", 1);
                attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
                thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "assaulting");
            }
        }
    }
    if (isdefined(self.carryflag)) {
        detachflag();
    }
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3a26
// Size: 0x5d
function distsquaredcheck(var_86c1c8628b1d55f8, var_f7ded1fdb02a123d, checkpos) {
    var_aae76e7732b9a9da = distancesquared(checkpos, var_86c1c8628b1d55f8);
    var_3d29a24f32f790b1 = distancesquared(checkpos, var_f7ded1fdb02a123d);
    if (var_aae76e7732b9a9da < 90000 || var_3d29a24f32f790b1 < 90000) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a8a
// Size: 0x52
function attachflag() {
    otherteam = getotherteam(self.pers["team"])[0];
    self attach(level.carryflag[otherteam], "tag_stowed_back3", 1);
    self.carryflag = level.carryflag[otherteam];
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ae3
// Size: 0x22
function detachflag() {
    self detach(self.carryflag, "tag_stowed_back3");
    self.carryflag = undefined;
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b0c
// Size: 0x8b
function setspecialloadouts() {
    if (isusingmatchrulesdata() && getmatchrulesdata("defaultClasses", "axis", 5, "class", "inUse")) {
        level.ctf_loadouts["axis"] = getmatchrulesspecialclass("axis", 5);
    }
    if (isusingmatchrulesdata() && getmatchrulesdata("defaultClasses", "allies", 5, "class", "inUse")) {
        level.ctf_loadouts["allies"] = getmatchrulesspecialclass("allies", 5);
    }
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b9e
// Size: 0x1e
function function_180943832c190cc0(var_cc37d8dbd43b23c9) {
    return !var_cc37d8dbd43b23c9 && getwingamebytype() == "roundsWon";
}

// Namespace blitz/namespace_e6070000d5ea702d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bc4
// Size: 0x370
function setupwaypointicons() {
    level.waypointcolors["waypoint_blitz_kill"] = "enemy";
    level.waypointbgtype["waypoint_blitz_kill"] = 1;
    level.waypointstring["waypoint_blitz_kill"] = "MP_INGAME_ONLY/OBJ_KILL_CAPS";
    level.waypointshader["waypoint_blitz_kill"] = "icon_waypoint_kill";
    level.waypointpulses["waypoint_blitz_kill"] = 0;
    level.waypointcolors["waypoint_blitz_pickup"] = "friendly";
    level.waypointbgtype["waypoint_blitz_pickup"] = 0;
    level.waypointstring["waypoint_blitz_pickup"] = "MP_INGAME_ONLY/OBJ_PICKUP_CAPS";
    level.waypointshader["waypoint_blitz_pickup"] = "icon_waypoint_flag";
    level.waypointpulses["waypoint_blitz_pickup"] = 1;
    level.waypointcolors["waypoint_blitz_goal"] = "enemy";
    level.waypointbgtype["waypoint_blitz_goal"] = 0;
    level.waypointstring["waypoint_blitz_goal"] = "MP_INGAME_ONLY/OBJ_TARGET_CAPS";
    level.waypointshader["waypoint_blitz_goal"] = "icon_waypoint_cyber_bombsite";
    level.waypointpulses["waypoint_blitz_goal"] = 0;
    level.waypointcolors["waypoint_blitz_escort"] = "friendly";
    level.waypointbgtype["waypoint_blitz_escort"] = 2;
    level.waypointstring["waypoint_blitz_escort"] = "MP_INGAME_ONLY/OBJ_ESCORT_CAPS";
    level.waypointshader["waypoint_blitz_escort"] = "icon_waypoint_flag";
    level.waypointpulses["waypoint_blitz_escort"] = 0;
    level.waypointcolors["waypoint_blitz_defend"] = "friendly";
    level.waypointbgtype["waypoint_blitz_defend"] = 0;
    level.waypointstring["waypoint_blitz_defend"] = "MP_INGAME_ONLY/OBJ_DEFEND_CAPS";
    level.waypointshader["waypoint_blitz_defend"] = "icon_waypoint_cyber_bombsite";
    level.waypointpulses["waypoint_blitz_defend"] = 0;
    level.waypointcolors["waypoint_blitz_reset"] = "friendly";
    level.waypointbgtype["waypoint_blitz_reset"] = 0;
    level.waypointstring["waypoint_blitz_reset"] = "MP_INGAME_ONLY/OBJ_RESET_CAPS";
    level.waypointshader["waypoint_blitz_reset"] = "icon_waypoint_flag";
    level.waypointpulses["waypoint_blitz_reset"] = 0;
    level.waypointcolors["waypoint_blitz_resetting"] = "enemy";
    level.waypointbgtype["waypoint_blitz_resetting"] = 0;
    level.waypointstring["waypoint_blitz_resetting"] = "MP_INGAME_ONLY/OBJ_RESETTING_CAPS";
    level.waypointshader["waypoint_blitz_resetting"] = "icon_waypoint_flag";
    level.waypointpulses["waypoint_blitz_resetting"] = 0;
    level.waypointcolors["waypoint_blitz_pickup_losing"] = "friendly";
    level.waypointbgtype["waypoint_blitz_pickup_losing"] = 0;
    level.waypointstring["waypoint_blitz_pickup_losing"] = "MP_INGAME_ONLY/OBJ_PICKUP_CAPS";
    level.waypointshader["waypoint_blitz_pickup_losing"] = "icon_waypoint_flag";
    level.waypointpulses["waypoint_blitz_pickup_losing"] = 1;
    level.waypointcolors["waypoint_blitz_pickup_defend"] = "friendly";
    level.waypointbgtype["waypoint_blitz_pickup_defend"] = 0;
    level.waypointstring["waypoint_blitz_pickup_defend"] = "MP_INGAME_ONLY/OBJ_PICKUP_DEFEND_CAPS";
    level.waypointshader["waypoint_blitz_pickup_defend"] = "icon_waypoint_flag";
    level.waypointpulses["waypoint_blitz_pickup_defend"] = 0;
}

