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
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\utility\dialog.gsc;
#using script_548072087c9fd504;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\equipment\tac_insert.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\hud_message.gsc;

#namespace ctf;

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb88
// Size: 0x2d1
function main() {
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    flag_default_origins();
    allowed[0] = "ctf";
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
    level.onmaprestart = &function_9136c8e96ae14d11;
    level.resetscoreonroundstart = &function_3f98ea23e8fa1954;
    level.spawnnodetype = "mp_ctf_spawn";
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "iw9_mpcf_mode_uktl_cft1";
    } else {
        game["dialog"]["gametype"] = "gametype_ctf";
    }
    game["dialog"]["boost"] = "boost_ctf";
    game["dialog"]["offense_obj"] = "boost_ctf";
    game["dialog"]["defense_obj"] = "boost_ctf";
    game["dialog"]["flag_taken"] = "ourflag_taken";
    game["dialog"]["flag_dropped"] = "ourflag_drop";
    game["dialog"]["flag_returned"] = "ourflag_return";
    game["dialog"]["flag_captured"] = "ourflag_capt";
    game["dialog"]["flag_getback"] = "ourflag_getback";
    game["dialog"]["enemy_flag_bringhome"] = "enemyflag_tobase";
    game["dialog"]["enemy_flag_taken"] = "enemyflag_taken";
    game["dialog"]["enemy_flag_dropped"] = "enemyflag_drop";
    game["dialog"]["enemy_flag_returned"] = "enemyflag_return";
    game["dialog"]["enemy_flag_captured"] = "enemyflag_capt";
    setomnvar("ui_ctf_flag_axis", -2);
    setomnvar("ui_ctf_flag_allies", -2);
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe60
// Size: 0xf9
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_d1d5e42ea50e97bd", getmatchrulesdata("ctfData", "winRule"));
    setdynamicdvar(@"hash_a2d431c4aaa9315c", getmatchrulesdata("ctfData", "captureCondition"));
    setdynamicdvar(@"hash_5cec825b941e1a68", getmatchrulesdata("ctfData", "returnTime"));
    setdynamicdvar(@"hash_f4a43cc54d1c9b3a", getmatchrulesdata("carryData", "showEnemyCarrier"));
    setdynamicdvar(@"hash_58c0e8ca6390c725", getmatchrulesdata("carryData", "idleResetTime"));
    setdynamicdvar(@"hash_97ede3296a3d49d2", getmatchrulesdata("carryData", "pickupTime"));
    setdynamicdvar(@"hash_82f42dfd88cbacad", getmatchrulesdata("carryData", "manualDropEnabled"));
    setdynamicdvar(@"hash_95c5d19271613c1f", 0);
    registerhalftimedvar("ctf", 0);
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf60
// Size: 0x13
function onspawnplayer(var_9156b53bcf7ce573) {
    updatematchstatushintonnoflag();
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf7a
// Size: 0x262
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
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    setclientnamemode("auto_change");
    if (level.splitscreen) {
        setobjectivescoretext(game["attackers"], "OBJECTIVES_ONE_FLAG_ATTACKER");
        setobjectivescoretext(game["defenders"], "OBJECTIVES_ONE_FLAG_DEFENDER");
    } else {
        setobjectivescoretext(game["attackers"], "OBJECTIVES_ONE_FLAG_ATTACKER_SCORE");
        setobjectivescoretext(game["defenders"], "OBJECTIVES_ONE_FLAG_DEFENDER_SCORE");
    }
    setobjectivetext(game["attackers"], "OBJECTIVES/CTF");
    setobjectivetext(game["defenders"], "OBJECTIVES/CTF");
    setobjectivehinttext(game["attackers"], "OBJECTIVES_ONE_FLAG_ATTACKER_HINT");
    setobjectivehinttext(game["defenders"], "OBJECTIVES_ONE_FLAG_DEFENDER_HINT");
    flag_setupvfx();
    createflagsandhud();
    initspawns();
    /#
        thread function_2f8e8b92f965d936();
    #/
    thread removeflag();
    thread placeflag();
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e3
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

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1287
// Size: 0x1ce
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
    level.iconescort = "waypoint_escort_flag";
    level.iconkill = "waypoint_ctf_kill";
    level.iconcaptureflag = "waypoint_take_flag";
    level.icondefendflag = "waypoint_defend_flag";
    level.iconreturnflag = "waypoint_recover_flag";
    level.teamflags[game["defenders"]] = createteamflag(game["defenders"], "axis");
    level.teamflags[game["attackers"]] = createteamflag(game["attackers"], "allies");
    level.capzones[game["defenders"]] = createcapzone(game["defenders"], "axis");
    level.capzones[game["attackers"]] = createcapzone(game["attackers"], "allies");
    namespace_5a22b6f3a56f7e9b::objective_show_for_mlg_spectator(level.capzones[game["defenders"]].objidnum, 1);
    namespace_5a22b6f3a56f7e9b::objective_show_for_mlg_spectator(level.capzones[game["attackers"]].objidnum, 1);
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x145c
// Size: 0x3
function flag_setupvfx() {
    
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1466
// Size: 0x20e
function initspawns() {
    if (spawnlogic::function_bff229a11ecd1e34()) {
        spawnlogic::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("AwayFromEnemies", "Crit_Default");
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    var_6170ec00c4bc9b5b = "ctf";
    var_ba6687ab13d4dce0 = namespace_b2d5aa2baf2b5701::function_b17bf43316b9fb08(var_6170ec00c4bc9b5b);
    if (var_ba6687ab13d4dce0) {
        namespace_b2d5aa2baf2b5701::function_85f6a1797c330b26(var_6170ec00c4bc9b5b, 1, "start_attacker", "start_defender");
        namespace_b2d5aa2baf2b5701::function_85f6a1797c330b26(var_6170ec00c4bc9b5b, 0, "spawn", "spawn");
    } else {
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_ctf_spawn_allies_start");
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_ctf_spawn_axis_start");
        namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_ctf_spawn_allies_start");
        namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_ctf_spawn_axis_start");
        attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_ctf_spawn_allies_start");
        defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_ctf_spawn_axis_start");
        namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
        namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_ctf_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_ctf_spawn");
    }
    assignteamspawns(var_ba6687ab13d4dce0, var_6170ec00c4bc9b5b, "spawn");
    level.ctfteamspawnsetids["allies"] = "primary_allies";
    level.ctfteamspawnsetids["axis"] = "primary_axis";
    namespace_b2d5aa2baf2b5701::registerspawnset("primary_allies", level.teamspawnpoints["allies"]);
    namespace_b2d5aa2baf2b5701::registerspawnset("primary_axis", level.teamspawnpoints["axis"]);
    namespace_b2d5aa2baf2b5701::registerspawnset("primary_neutral", level.teamspawnpoints["neutral"]);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x167b
// Size: 0x46b
function assignteamspawns(var_8719ff6e31a3d80b, var_6170ec00c4bc9b5b, var_9e9bd2d16bf2b7e5) {
    if (var_8719ff6e31a3d80b) {
        spawnpoints = namespace_b2d5aa2baf2b5701::function_5cb7f8468d3b9fe0(var_6170ec00c4bc9b5b, var_9e9bd2d16bf2b7e5);
    } else {
        spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray(level.spawnnodetype);
    }
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
                spawnpoint.teambase = getotherteam(var_52283a0a1cf75c1e.ownerteam)[0];
                level.teamspawnpoints[spawnpoint.teambase][level.teamspawnpoints[spawnpoint.teambase].size] = spawnpoint;
            } else if (var_a40d2cea46f228ca > 0.67) {
                spawnpoint.teambase = getotherteam(var_5228390a1cf759eb.ownerteam)[0];
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

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1aed
// Size: 0x106
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
    return getotherteam(nearestflag.ownerteam)[0];
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bfb
// Size: 0x57
function getspawnpoint() {
    spawnteam = self.pers["team"];
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        spawnpoint = namespace_b2d5aa2baf2b5701::function_542d0780ea7c537d(self, spawnteam);
    } else {
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, level.ctfteamspawnsetids[spawnteam], "primary_neutral");
    }
    return spawnpoint;
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c5a
// Size: 0x10d
function flag_default_origins() {
    level.default_goal_origins = [];
    level.flags = getentarray("flag_primary", "targetname");
    if (!isdefined(game["attackers"])) {
        game["attackers"] = "allies";
    }
    if (!isdefined(game["defenders"])) {
        game["defenders"] = "axis";
    }
    foreach (flag in level.flags) {
        switch (flag.script_label) {
        case #"hash_fac2c5f6bddd49bd":
            level.default_flag_origins[game["attackers"]] = flag.origin;
            break;
        case #"hash_fac2c3f6bddd4697":
            level.default_flag_origins[game["defenders"]] = flag.origin;
            break;
        }
    }
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d6e
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

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e0d
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

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ecb
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

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe9
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

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2103
// Size: 0x8d
function removeflagpickupradiuseffect(flagteam) {
    if (flagteam == self.team) {
        if (isdefined(self._flagradiuseffect[self.team])) {
            self._flagradiuseffect[self.team] delete();
        }
    } else if (isdefined(self._flagradiuseffect[getotherteam(self.team)[0]])) {
        self._flagradiuseffect[getotherteam(self.team)[0]] delete();
    }
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2197
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

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21de
// Size: 0x8d
function player_delete_flag_goal_fx(flagteam) {
    if (flagteam == self.team) {
        if (isdefined(self._flageffect[self.team])) {
            self._flageffect[self.team] delete();
        }
    } else if (isdefined(self._flageffect[getotherteam(self.team)[0]])) {
        self._flageffect[getotherteam(self.team)[0]] delete();
    }
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2272
// Size: 0x4e
function getflagpos(team) {
    ent = getent("ctf_flag_" + team, "targetname");
    /#
        assertex(isdefined(ent) && isdefined(ent.origin));
    #/
    return ent.origin;
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x22c8
// Size: 0x6f5
function createteamflag(team, entityteam) {
    var_da71d292931c16b = 0;
    trigger = getent("ctf_zone_" + entityteam, "targetname");
    if (!isdefined(trigger)) {
        var_b7ba378ae30bedb4 = flag_create_team_goal(team);
        trigger = spawn("trigger_radius", var_b7ba378ae30bedb4.origin - (0, 0, var_b7ba378ae30bedb4.radius / 2), 0, var_b7ba378ae30bedb4.radius, 80);
        trigger.no_moving_platfrom_unlink = 1;
        trigger.linktoenabledflag = 1;
        trigger.baseorigin = trigger.origin;
        var_da71d292931c16b = 1;
        visuals[0] = spawn("script_model", var_b7ba378ae30bedb4.origin);
        visuals[0] setasgametypeobjective();
        visuals[0] setteaminhuddatafromteamname(entityteam);
    } else {
        visuals[0] = getent("ctf_flag_" + entityteam, "targetname");
    }
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
    if (level.mapname == "mp_m_speedball") {
        trigger flag_find_ground();
        trigger.origin = trigger.ground_origin;
        visuals[0].origin = trigger.ground_origin - (0, 0, 0.5);
    }
    visuals[0] setmodel(level.flagmodel[team]);
    visuals[0] setasgametypeobjective();
    visuals[0] setteaminhuddatafromteamname(entityteam);
    var_4e86579dc7e39505 = getotherteam(team)[0];
    var_3bc2b88a59b6d062 = namespace_19b4203b51d56488::createcarryobject(var_4e86579dc7e39505, trigger, visuals, (0, 0, 85));
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::allowcarry("friendly");
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setteamusetime("friendly", level.pickuptime);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setteamusetime("enemy", level.returntime);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setvisibleteam("none");
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, undefined);
    var_3bc2b88a59b6d062 namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_3bc2b88a59b6d062.objidnum, 0);
    var_3bc2b88a59b6d062 namespace_5a22b6f3a56f7e9b::objective_set_play_outro(var_3bc2b88a59b6d062.objidnum, 0);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::registercarryobjectpickupcheck(&flagpickupchecks);
    var_3bc2b88a59b6d062.allowweapons = 1;
    var_3bc2b88a59b6d062.originalownerteam = var_4e86579dc7e39505;
    var_3bc2b88a59b6d062.onpickup = &onpickup;
    var_3bc2b88a59b6d062.onpickupfailed = &onpickupfailed;
    var_3bc2b88a59b6d062.ondrop = &ondrop;
    var_3bc2b88a59b6d062.onreset = &onreset;
    if (getdvarint(@"hash_82f42dfd88cbacad") != 0) {
        var_3bc2b88a59b6d062 namespace_19b4203b51d56488::function_316d9da870e12a03([0:visuals[0]], trigger, 1, 80, 0);
    }
    if (isdefined(level.showenemycarrier)) {
        switch (level.showenemycarrier) {
        case 0:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 60;
            break;
        case 1:
            var_3bc2b88a59b6d062.objidpingfriendly = 0;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 0.05;
            break;
        case 2:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 1;
            break;
        case 3:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 1.5;
            break;
        case 4:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 2;
            break;
        case 5:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 3;
            break;
        case 6:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 4;
            break;
        }
        var_220be32c83520117 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
        var_3bc2b88a59b6d062.pingobjidnum = var_220be32c83520117;
        namespace_5a22b6f3a56f7e9b::objective_add_objective(var_220be32c83520117, "done", var_3bc2b88a59b6d062.origin);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_220be32c83520117, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(var_220be32c83520117, 0);
        var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setvisibleteam("none", var_220be32c83520117);
        objective_setownerteam(var_220be32c83520117, team);
        var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, level.mlgiconfullflag, var_220be32c83520117);
    } else {
        var_3bc2b88a59b6d062.objidpingfriendly = 1;
        var_3bc2b88a59b6d062.objidpingenemy = 0;
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

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29c5
// Size: 0x14
function flagpickupchecks(player) {
    return !player namespace_f8065cafc523dba5::isinvehicle();
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x29e1
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

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2aab
// Size: 0x271
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
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::allowuse("friendly");
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setvisibleteam("any");
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setobjectivestatusallicons(level.icondefendflag, level.iconcaptureflag, level.mlgiconfullflag);
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setusetime(0);
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setkeyobject(level.teamflags[getotherteam(team)[0]]);
    var_e1c2bb288fc23e0d.onuse = &onuse;
    var_e1c2bb288fc23e0d.oncantuse = &oncantuse;
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

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d24
// Size: 0x6a
function onbeginuse(player) {
    team = player.pers["team"];
    if (team == namespace_19b4203b51d56488::getownerteam()) {
        self.trigger.radius = 1024;
    } else {
        self.trigger.radius = self.oldradius;
    }
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2d95
// Size: 0x39
function onenduse(player, team, success) {
    self.trigger.radius = self.oldradius;
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd5
// Size: 0x52d
function onpickup(player, var_5760e0f038d1baa3, defused) {
    self notify("picked_up");
    player notify("obj_picked_up");
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (isdefined(self.droppedteam)) {
        if (self.droppedteam == player.team) {
            namespace_19b4203b51d56488::setownerteam(self.droppedteam);
            ownerteam = self.droppedteam;
        } else {
            namespace_19b4203b51d56488::setownerteam(getotherteam(player.team)[0]);
            ownerteam = self.droppedteam;
        }
        self.droppedteam = undefined;
    }
    team = player.pers["team"];
    otherteam = getotherteam(team)[0];
    if (team != ownerteam) {
        if (isdefined(level.closecapturekiller[player.team]) && level.closecapturekiller[player.team] == player) {
            player thread namespace_48a08c5037514e04::doscoreevent(#"hash_fe8ba8ad4e2e427b");
        }
        level.closecapturekiller[player.team] = undefined;
        player thread doscoreevent(#"flag_return");
        if (level.codcasterenabled) {
            level.capzones[player.team] namespace_19b4203b51d56488::resetmlgobjectivestatusicon();
        }
        thread returnflag();
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = player;
        var_7e2c53b0bcf117d9.eventname = "obj_return";
        var_7e2c53b0bcf117d9.position = player.origin;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
        printandsoundoneveryone(team, getotherteam(team)[0], undefined, undefined, "mp_obj_returned", "mp_obj_returned", player);
        namespace_944ddf7b8df1b0e3::leaderdialog("enemy_flag_returned", otherteam, "status");
        namespace_944ddf7b8df1b0e3::leaderdialog("flag_returned", team, "status");
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(18, player.team, player getentitynumber());
        player incpersstat("returns", 1);
        player namespace_b919c4be206d3c80::function_48544e365f4f5648(15, 1);
        player namespace_2685ec368e022695::statsetchild("round", "returns", player.pers["returns"]);
        if (isplayer(player)) {
            player setextrascore1(player.pers["returns"]);
        }
        if (self.originalownerteam == "allies") {
            setomnvar("ui_ctf_flag_axis", -2);
        } else {
            setomnvar("ui_ctf_flag_allies", -2);
        }
    } else {
        if (isdefined(level.ctf_loadouts) && isdefined(level.ctf_loadouts[team])) {
            player thread applyflagcarrierclass();
        } else {
            player attachflag();
        }
        player incpersstat("pickups", 1);
        level.closecapturekiller[otherteam] = undefined;
        if (self.originalownerteam == "allies") {
            setomnvar("ui_ctf_flag_axis", player getentitynumber());
        } else {
            setomnvar("ui_ctf_flag_allies", player getentitynumber());
        }
        player setclientomnvar("ui_flag_player_hud_icon", 1);
        if (isdefined(level.showenemycarrier)) {
            if (level.showenemycarrier == 0) {
                namespace_19b4203b51d56488::setvisibleteam("none");
            } else {
                namespace_19b4203b51d56488::setvisibleteam("friendly");
                objective_state(self.pingobjidnum, "current");
                namespace_19b4203b51d56488::updatecompassicon("enemy", self.pingobjidnum);
                objective_icon(self.pingobjidnum, "icon_waypoint_kill");
                namespace_5a22b6f3a56f7e9b::objective_hide_for_mlg_spectator(self.pingobjidnum, 1);
            }
        }
        namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, level.mlgiconfullflag);
        if (level.capturecondition == 0) {
            level.capzones[otherteam] namespace_19b4203b51d56488::allowuse("none");
        }
        level.capzones[otherteam] namespace_19b4203b51d56488::setvisibleteam("none");
        printandsoundoneveryone(team, otherteam, undefined, undefined, "mp_obj_taken", "mp_enemy_obj_taken", player);
        namespace_944ddf7b8df1b0e3::leaderdialog("enemy_flag_taken", team);
        namespace_944ddf7b8df1b0e3::leaderdialog("flag_getback", otherteam);
        thread teamplayercardsplash("callout_flagpickup", player);
        if (!isdefined(self.previouscarrier) || self.previouscarrier != player) {
            player thread doscoreevent(#"flag_grab");
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
        player thread superabilitywatcher();
    }
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3309
// Size: 0xc
function onpickupfailed(player) {
    
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x331d
// Size: 0xa
function returnflag() {
    namespace_19b4203b51d56488::returnhome();
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x332e
// Size: 0x27f
function ondrop(player) {
    if (isdefined(player.leaving_team)) {
        self.droppedteam = player.leaving_team;
        player.leaving_team = undefined;
    } else if (!isdefined(player)) {
        self.droppedteam = self.originalownerteam;
    } else {
        self.droppedteam = player.team;
    }
    if (isdefined(player)) {
        player updatematchstatushintonnoflag();
    }
    namespace_19b4203b51d56488::setownerteam(getotherteam(self.droppedteam)[0]);
    team = self.droppedteam;
    otherteam = getotherteam(self.droppedteam)[0];
    namespace_19b4203b51d56488::allowcarry("any");
    namespace_19b4203b51d56488::setvisibleteam("any");
    objective_state(self.pingobjidnum, "done");
    if (level.returntime >= 0) {
        namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconreturnflag, level.iconcaptureflag, level.mlgiconfullflag);
    } else {
        namespace_19b4203b51d56488::setobjectivestatusallicons(level.icondefendflag, level.iconcaptureflag, level.mlgiconfullflag);
        namespace_5a22b6f3a56f7e9b::objective_hide_for_mlg_spectator(self.objidnum, 1);
    }
    if (self.originalownerteam == "allies") {
        setomnvar("ui_ctf_flag_axis", -1);
    } else {
        setomnvar("ui_ctf_flag_allies", -1);
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
        printandsoundoneveryone(otherteam, "none", undefined, undefined, "iw9_mp_ui_objective_lost", "", player);
        if (level.codcasterenabled) {
            player setgametypevip(0);
        }
    } else {
        namespace_a34451ae3d453e::playsoundonplayers("iw9_mp_ui_objective_lost", otherteam);
    }
    namespace_944ddf7b8df1b0e3::leaderdialog("enemy_flag_dropped", self.originalownerteam, "status");
    namespace_944ddf7b8df1b0e3::leaderdialog("flag_dropped", getotherteam(self.originalownerteam)[0], "status");
    if (level.idleresettime > 0) {
        thread returnaftertime();
    }
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35b4
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

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x364c
// Size: 0x114
function onreset() {
    if (isdefined(self.droppedteam)) {
        namespace_19b4203b51d56488::setownerteam(self.droppedteam);
    }
    team = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(team)[0];
    self.droppedteam = undefined;
    namespace_19b4203b51d56488::allowcarry("friendly");
    namespace_19b4203b51d56488::setvisibleteam("none");
    namespace_19b4203b51d56488::setobjectivestatusicons(level.iconescort, level.iconkill);
    if (self.originalownerteam == "allies") {
        setomnvar("ui_ctf_flag_axis", -2);
    } else {
        setomnvar("ui_ctf_flag_allies", -2);
    }
    level.capzones[otherteam] namespace_19b4203b51d56488::allowuse("friendly");
    level.capzones[otherteam] namespace_19b4203b51d56488::setvisibleteam("any");
    level.capzones[otherteam] namespace_19b4203b51d56488::setobjectivestatusallicons(level.icondefendflag, level.iconcaptureflag, level.mlgiconfullflag);
    self.previouscarrier = undefined;
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3767
// Size: 0x270
function onuse(player) {
    if (!level.gameended) {
        if (player namespace_f8065cafc523dba5::isinvehicle()) {
            return;
        }
        team = player.pers["team"];
        otherteam = getotherteam(team)[0];
        player setclientomnvar("ui_flag_player_hud_icon", 0);
        namespace_944ddf7b8df1b0e3::leaderdialog("enemy_flag_captured", team, "status");
        namespace_944ddf7b8df1b0e3::leaderdialog("flag_captured", otherteam, "status");
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(17, player.team, player getentitynumber());
        objective_state(level.teamflags[otherteam].pingobjidnum, "done");
        player updatematchstatushintonnoflag();
        thread teamplayercardsplash("callout_flagcapture", player);
        player thread namespace_62c556437da28f50::scoreeventpopup(#"flag_capture");
        player thread namespace_48a08c5037514e04::doscoreevent(#"hash_7b8c8a78ac292c0d");
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
        player namespace_b919c4be206d3c80::function_48544e365f4f5648(15, 1);
        player namespace_2685ec368e022695::statsetchild("round", "captures", player.pers["captures"]);
        if (isplayer(player)) {
            player setextrascore0(player.pers["captures"]);
        }
        printandsoundoneveryone(team, otherteam, undefined, undefined, "mp_obj_captured", "mp_enemy_obj_captured", player);
        if (isdefined(player.carryflag)) {
            player detachflag();
        }
        if (isdefined(level.ctf_loadouts) && isdefined(level.ctf_loadouts[team])) {
            player thread removeflagcarrierclass();
        }
        level.closecapturekiller[team] = undefined;
        level.closecapturekiller[otherteam] = undefined;
        if (level.codcasterenabled) {
            level.capzones[otherteam] namespace_19b4203b51d56488::resetmlgobjectivestatusicon();
        }
        level.teamflags[otherteam] returnflag();
        level namespace_e8a49b70d0769b66::giveteamscoreforobjective(team, 1, 0);
    }
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39de
// Size: 0x2f
function onplayerconnect(player) {
    player._flageffect = [];
    player._flagradiuseffect = [];
    player thread onplayerspawned();
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a14
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

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3aa4
// Size: 0xda
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
    namespace_d19129e4fa5d176::function_a16868d4dcd81a4b();
    self notify("faux_spawn");
    self.gameobject_fauxspawn = 1;
    self.faux_spawn_stance = self getstance();
    thread namespace_99ac021a7547cae3::spawnplayer(1);
    thread waitattachflag();
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b85
// Size: 0xec
function superabilitywatcher() {
    self notify("superWatcher");
    self endon("superWatcher");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self endon("drop_object");
    team = self.pers["team"];
    otherteam = getotherteam(team)[0];
    level.teamflags[otherteam] endon("reset");
    while (1) {
        self waittill("super_started");
        var_3f594777b26bb842 = level.teamflags[otherteam];
        if (!isdefined(var_3f594777b26bb842)) {
            continue;
        }
        super = self.super;
        switch (super.staticdata.ref) {
        case #"hash_8cf10370c167105a":
            waittill_any_2("teleport_success", "rewind_success");
            var_3f594777b26bb842 thread namespace_19b4203b51d56488::setdropped();
            return;
        }
    }
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c78
// Size: 0x20
function waitattachflag() {
    level endon("game_ende");
    self endon("death_or_disconnect");
    self waittill("spawned_player");
    attachflag();
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c9f
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

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d40
// Size: 0xc
function oncantuse(player) {
    
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params a, eflags: 0x0
// Checksum 0x0, Offset: 0x3d53
// Size: 0x3be
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
            attacker thread namespace_62c556437da28f50::scoreeventpopup(#"hash_ebcc9c019c3b6818");
            attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_f735b92839c5a687");
            var_aec2e5e01f424119 = 1;
        }
        if (isdefined(self.carryflag)) {
            var_33f8ce08c3e0650b = distancesquared(self.origin, level.capzones[self.team].trigger.origin);
            if (var_33f8ce08c3e0650b < 90000) {
                level.closecapturekiller[attacker.team] = attacker;
            } else {
                level.closecapturekiller[attacker.team] = undefined;
            }
            attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_5311f153a7fee40c");
            attacker incpersstat("carrierKills", 1);
            attacker incpersstat("defends", 1);
            attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
            thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "carrying");
            namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(20, attacker.team, attacker getentitynumber());
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
                attacker thread namespace_62c556437da28f50::scoreeventpopup(#"assault");
                attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_5a3b180273be47b1");
                thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "defending");
                attacker incpersstat("assaults", 1);
            } else if (var_c3f9fed5999c974e) {
                attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
                attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_2d96ced878338cd2");
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

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4118
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

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x417c
// Size: 0x59
function attachflag() {
    updatematchstatushintonhasflag();
    otherteam = getotherteam(self.pers["team"])[0];
    self attach(level.carryflag[otherteam], "tag_stowed_back3", 1);
    self.carryflag = level.carryflag[otherteam];
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41dc
// Size: 0x22
function detachflag() {
    self detach(self.carryflag, "tag_stowed_back3");
    self.carryflag = undefined;
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4205
// Size: 0x8b
function setspecialloadouts() {
    if (isusingmatchrulesdata() && getmatchrulesdata("defaultClasses", "axis", 5, "class", "inUse")) {
        level.ctf_loadouts["axis"] = getmatchrulesspecialclass("axis", 5);
    }
    if (isusingmatchrulesdata() && getmatchrulesdata("defaultClasses", "allies", 5, "class", "inUse")) {
        level.ctf_loadouts["allies"] = getmatchrulesspecialclass("allies", 5);
    }
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4297
// Size: 0x257
function removeflag() {
    level endon("game_ended");
    while (1) {
        if (getdvar(@"hash_6ce167f2cdc8ef7c", "") != "") {
            var_3a8f577077353c70 = getdvar(@"hash_6ce167f2cdc8ef7c", "");
            if (var_3a8f577077353c70 == "_a") {
                team = "allies";
            } else {
                team = "axis";
            }
            if (team == "allies") {
                if (game["switchedsides"]) {
                    team = game["defenders"];
                } else {
                    team = game["attackers"];
                }
            } else if (game["switchedsides"]) {
                team = game["attackers"];
            } else {
                team = game["defenders"];
            }
            level.teamflags[team].trigger notify("move_gameobject");
            level.teamflags[team] namespace_19b4203b51d56488::allowuse("none");
            level.teamflags[team].trigger = undefined;
            level.teamflags[team] notify("deleted");
            level.teamflags[team].visuals[0] delete();
            level.teamflagbases[team] delete();
            level.capzones[team] namespace_19b4203b51d56488::allowuse("none");
            level.capzones[team].trigger = undefined;
            level.capzones[team] notify("deleted");
            foreach (player in level.players) {
                player player_delete_flag_goal_fx(team);
            }
            level.teamflags[team].visibleteam = "none";
            level.teamflags[team] namespace_19b4203b51d56488::setobjectivestatusicons(undefined, undefined);
            level.capzones[team].visibleteam = "none";
            level.capzones[team] namespace_19b4203b51d56488::setobjectivestatusicons(undefined, undefined);
            level.teamflags[team] = undefined;
            setdynamicdvar(@"hash_6ce167f2cdc8ef7c", "");
        }
        wait(1);
    }
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44f5
// Size: 0x638
function placeflag() {
    level endon("game_ended");
    while (1) {
        if (getdvar(@"hash_29d45d6822a1cf6d", "") != "") {
            var_3a8f577077353c70 = getdvar(@"hash_29d45d6822a1cf6d", "");
            if (var_3a8f577077353c70 == "_a") {
                team = "allies";
            } else {
                team = "axis";
            }
            if (team == "allies") {
                if (game["switchedsides"]) {
                    team = game["defenders"];
                } else {
                    team = game["attackers"];
                }
            } else if (game["switchedsides"]) {
                team = game["attackers"];
            } else {
                team = game["defenders"];
            }
            goal = undefined;
            goal = spawnstruct();
            goal dev_flag_find_ground();
            goal.origin = goal.ground_origin;
            goal.radius = 30;
            goal.team = team;
            trigger = spawn("trigger_radius", goal.origin, 0, 30, 80);
            visuals[0] = spawn("script_model", goal.origin);
            visuals[0] setmodel(level.flagmodel[team]);
            var_62e400453977eee = namespace_19b4203b51d56488::createcarryobject(team, trigger, visuals, (0, 0, 85));
            var_62e400453977eee namespace_19b4203b51d56488::setteamusetext("enemy", "MP/GRABBING_FLAG");
            var_62e400453977eee namespace_19b4203b51d56488::setteamusetext("friendly", "MP/RETURNING_FLAG");
            var_62e400453977eee namespace_19b4203b51d56488::allowcarry("enemy");
            var_62e400453977eee namespace_19b4203b51d56488::setvisibleteam("none");
            var_62e400453977eee namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, level.mlgiconfullflag);
            var_62e400453977eee.objidpingfriendly = 1;
            var_62e400453977eee.allowweapons = 1;
            var_62e400453977eee.onpickup = &onpickup;
            var_62e400453977eee.onpickupfailed = &onpickupfailed;
            var_62e400453977eee.ondrop = &ondrop;
            var_62e400453977eee.onreset = &onreset;
            var_62e400453977eee.oldradius = trigger.radius;
            var_62e400453977eee.origin = goal.origin;
            var_62e400453977eee.label = team;
            var_62e400453977eee.previouscarrier = undefined;
            tracestart = trigger.origin + (0, 0, 32);
            traceend = trigger.origin + (0, 0, -32);
            contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
            ignoreents = [];
            trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
            var_62e400453977eee.baseeffectpos = trace["position"];
            upangles = vectortoangles(trace["normal"]);
            var_62e400453977eee.baseeffectforward = anglestoforward(upangles);
            level.teamflagbases[team] = createteamflagbase(team, var_62e400453977eee);
            if (team == "allies") {
                if (game["switchedsides"]) {
                    level.teamflags[game["defenders"]] = var_62e400453977eee;
                } else {
                    level.teamflags[game["attackers"]] = var_62e400453977eee;
                }
            } else if (game["switchedsides"]) {
                level.teamflags[game["attackers"]] = var_62e400453977eee;
            } else {
                level.teamflags[game["defenders"]] = var_62e400453977eee;
            }
            visuals = [];
            trigger = spawn("trigger_radius", goal.origin - (0, 0, goal.radius / 2), 0, goal.radius, 80);
            trigger.no_moving_platfrom_unlink = 1;
            trigger.linktoenabledflag = 1;
            trigger.baseorigin = trigger.origin;
            var_e1c2bb288fc23e0d = namespace_19b4203b51d56488::createuseobject(team, trigger, visuals, (0, 0, 115));
            var_e1c2bb288fc23e0d namespace_19b4203b51d56488::allowuse("friendly");
            var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setvisibleteam("any");
            var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setobjectivestatusallicons(level.icondefendflag, level.iconcaptureflag, level.mlgiconfullflag);
            var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setusetime(0);
            var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setkeyobject(level.teamflags[getotherteam(team)[0]]);
            level.capzones[getotherteam(team)[0]] namespace_19b4203b51d56488::setkeyobject(var_62e400453977eee);
            var_e1c2bb288fc23e0d.onuse = &onuse;
            var_e1c2bb288fc23e0d.oncantuse = &oncantuse;
            tracestart = trigger.origin + (0, 0, 32);
            traceend = trigger.origin + (0, 0, -32);
            contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
            ignoreents = [];
            trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
            upangles = vectortoangles(trace["normal"]);
            forward = anglestoforward(upangles);
            right = anglestoright(upangles);
            if (team == "allies") {
                if (game["switchedsides"]) {
                    level.capzones[game["defenders"]] = var_e1c2bb288fc23e0d;
                } else {
                    level.capzones[game["attackers"]] = var_e1c2bb288fc23e0d;
                }
            } else if (game["switchedsides"]) {
                level.capzones[game["attackers"]] = var_e1c2bb288fc23e0d;
            } else {
                level.capzones[game["defenders"]] = var_e1c2bb288fc23e0d;
            }
            setdynamicdvar(@"hash_29d45d6822a1cf6d", "");
        }
        wait(1);
    }
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b34
// Size: 0xc5
function dev_flag_find_ground() {
    tracestart = level.players[0].origin + (0, 0, 32);
    traceend = level.players[0].origin + (0, 0, -1000);
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    self.ground_origin = trace["position"];
    return trace["fraction"] != 0 && trace["fraction"] != 1;
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c01
// Size: 0xde
function setupwaypointicons() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_ctf_kill", 2, "enemy", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_kill", 0, undefined);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_recover_flag", 2, "friendly", "MP_INGAME_ONLY/OBJ_RECOVER_CAPS", "icon_waypoint_flag", 0, 12);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_escort_flag", 2, "friendly", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_flag", 0, 12);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_take_flag", 2, "enemy", "MP_INGAME_ONLY/OBJ_TAKE_CAPS", "icon_waypoint_flag", 0, 13);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_flag", 2, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_flag", 0, 13);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_mlg_empty_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "codcaster_icon_waypoint_ctf_empty", 0, undefined);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_mlg_full_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "codcaster_icon_waypoint_ctf_full", 0, undefined);
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ce6
// Size: 0xf
function updatematchstatushintonnoflag() {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("flag_capture");
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cfc
// Size: 0xf
function updatematchstatushintonhasflag() {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("flag_return");
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d12
// Size: 0xa5
function function_2f8e8b92f965d936() {
    /#
        self endon("enemyflag_return");
        while (1) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("carryData", getdvarint(@"hash_46a6b424af6acbc2"), 0);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("timeToBeatTeam", getdvarint(@"hash_86e14326e43c0115"), 0);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_2f8e8b92f965d936();
    #/
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4dbe
// Size: 0xa
function function_9136c8e96ae14d11() {
    namespace_b919c4be206d3c80::function_edba1ee7c2375a5();
}

// Namespace ctf/namespace_9a8ced8445d35c7d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4dcf
// Size: 0x1e
function function_3f98ea23e8fa1954(var_cc37d8dbd43b23c9) {
    return !var_cc37d8dbd43b23c9 && getwingamebytype() == "roundsWon";
}

