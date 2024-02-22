// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\usability.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\obj_bombzone.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_548072087c9fd504;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\hud_message.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\rank.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\cp_mp\pet_watch.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\equipment\tac_insert.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\motiondetectors.gsc;

#namespace cyber;

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1466
// Size: 0x406
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    allowed[1] = "blocker";
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 3, 0, 12);
        registertimelimitdvar(getgametype(), 150);
        registerscorelimitdvar(getgametype(), 1);
        registerroundlimitdvar(getgametype(), 0);
        registerwinlimitdvar(getgametype(), 4);
        registernumlivesdvar(getgametype(), 1);
        registerhalftimedvar(getgametype(), 0);
        registerwinbytwoenableddvar(getgametype(), 1);
        registerwinbytwomaxroundsdvar(getgametype(), 4);
    }
    updategametypedvars();
    level.objectivebased = 1;
    level.teambased = 1;
    /#
        println("iw9_cybr_mode_uktl_cycb" + gettime());
    #/
    level.nobuddyspawns = 1;
    level.onprecachegametype = &onprecachegametype;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.modeonspawnplayer = &onspawnplayer;
    level.onplayerkilled = &onplayerkilled;
    level.ondeadevent = &ondeadevent;
    level.ononeleftevent = &ononeleftevent;
    level.ontimelimit = &ontimelimit;
    level.onnormaldeath = &onnormaldeath;
    level.gamemodemaydropweapon = &isplayeroutsideofanybombsite;
    level.onexfilstarted = &onexfilstarted;
    level.onmaprestart = &function_b47a96f58a61d923;
    level.resetuiomnvargamemode = &namespace_fa795886dfc5f58a::resetuiomnvargamemode;
    level.emplightsoff = &emplightsoff;
    level.allowlatecomers = 0;
    level.bombplanted = 0;
    level.bombplantedteam = undefined;
    level.bombexploded = 0;
    game["canScoreOnTie"] = 1;
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "iw9_cybr_mode_uktl_cyt1";
    } else {
        game["dialog"]["gametype"] = "iw9_cybr_mode_uktl_cynm";
    }
    if (!isdefined(game["roundsPlayed"])) {
        var_126fe93c04fe16df = "iw9_cybr_mode_uktl_cybo";
    } else {
        var_126fe93c04fe16df = "iw9_cybr_mode_uktl_cybs";
    }
    game["dialog"]["offense_obj"] = var_126fe93c04fe16df;
    game["dialog"]["defense_obj"] = var_126fe93c04fe16df;
    game["dialog"]["emppickup_friendly"] = "iw9_cybr_mode_uktl_cyaa";
    game["dialog"]["emppickup_friendly_first"] = "iw9_cybr_mode_uktl_cyab";
    game["dialog"]["emppickup_enemy"] = "iw9_cybr_mode_uktl_cyac";
    game["dialog"]["empdefused_friendly"] = "iw9_cybr_mode_uktl_cyba";
    game["dialog"]["empdefused_final_friendly"] = "iw9_cybr_mode_uktl_cybb";
    game["dialog"]["empdefused_enemy"] = "iw9_cybr_mode_uktl_cybc";
    game["dialog"]["empdefused_final_enemy"] = "iw9_cybr_mode_uktl_cybd";
    game["dialog"]["empplanted_friendly"] = "iw9_cybr_mode_uktl_cyca";
    game["dialog"]["empplanted_enemy"] = "iw9_cybr_mode_uktl_cycb";
    game["dialog"]["lead_lost"] = "iw9_cybr_mode_uktl_cyla";
    game["dialog"]["lead_taken"] = "iw9_cybr_mode_uktl_cylb";
    setomnvar("ui_bomb_carrier", -1);
    setomnvar("ui_bomb_owner_team", -1);
    setomnvar("ui_bomb_interacting", 0);
    setomnvar("ui_bomb_timer_endtime_a", 0);
    /#
        if (getgametypenumlives() == 1) {
            setdvar(@"hash_e723cc761de7b161", 2);
        }
        setdevdvarifuninitialized(@"hash_3f3a15fb7e7c9b0", 0);
        thread function_8598880f9b913b55();
        thread function_847f04c317e266d();
        thread function_a60e39eb7d5bd5f4();
        thread function_4df61dc99c28632b();
        thread function_68dd1d69fdeeff68();
    #/
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1873
// Size: 0x18f
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_a38528b401241da8", getmatchrulesdata("cyberData", "empSpawn"));
    setdynamicdvar(@"hash_75c66152feeaf80e", getmatchrulesdata("cyberData", "radarPingTime"));
    setdynamicdvar(@"hash_c0a25843c920c4ce", getmatchrulesdata("cyberData", "persBombTimer"));
    setdynamicdvar(@"hash_b00ce75fd0d5d769", getmatchrulesdata("cyberData", "detonateScore"));
    setdynamicdvar(@"hash_b4c3a376c3c7fb9e", getmatchrulesdata("bombData", "bombTimer"));
    setdynamicdvar(@"hash_ac70a9da7ed6e503", getmatchrulesdata("bombData", "plantTime"));
    setdynamicdvar(@"hash_2267b7060ff04c06", getmatchrulesdata("bombData", "defuseTime"));
    setdynamicdvar(@"hash_f020a63fa5f08136", getmatchrulesdata("bombData", "multiBomb"));
    setdynamicdvar(@"hash_a2739716dc4f6e7c", getmatchrulesdata("carryData", "showEnemyCarrier"));
    setdynamicdvar(@"hash_89e70fdb949bff03", getmatchrulesdata("carryData", "idleResetTime"));
    setdynamicdvar(@"hash_2e66964b7b7ff414", getmatchrulesdata("carryData", "pickupTime"));
    setdynamicdvar(@"hash_484e617d6f7b7fa7", getmatchrulesdata("carryData", "manualDropEnabled"));
    setdynamicdvar(@"hash_4df16047bc4718d5", 0);
    registerhalftimedvar("cyber", 0);
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a09
// Size: 0x1a
function waittooverridegraceperiod() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    level.overrideingraceperiod = 1;
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a2a
// Size: 0x1d
function onprecachegametype() {
    game["bomb_dropped_sound"] = "iw9_mp_ui_objective_lost";
    game["bomb_recovered_sound"] = "iw9_mp_ui_objective_taken";
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a4e
// Size: 0x188
function onstartgametype() {
    setomnvar("ui_victory_condition_completed", 0);
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    setclientnamemode("manual_change");
    level._effect["emp_detonation"] = loadfx("vfx/iw9/gameplay/mp/vfx_cyber_emp_explode.vfx");
    level._effect["vehicle_explosion"] = loadfx("vfx/core/expl/small_vehicle_explosion_new.vfx");
    level._effect["building_explosion"] = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
    setobjectivetext(game["attackers"], "OBJECTIVES/SD_ATTACKER");
    setobjectivetext(game["defenders"], "OBJECTIVES/SD_DEFENDER");
    if (level.splitscreen) {
        setobjectivescoretext(game["attackers"], "OBJECTIVES/SD_ATTACKER");
        setobjectivescoretext(game["defenders"], "OBJECTIVES/SD_DEFENDER");
    } else {
        setobjectivescoretext(game["attackers"], "OBJECTIVES/SD_ATTACKER_SCORE");
        setobjectivescoretext(game["defenders"], "OBJECTIVES/SD_DEFENDER_SCORE");
    }
    setobjectivehinttext(game["attackers"], "OBJECTIVES/SD_ATTACKER_HINT");
    setobjectivehinttext(game["defenders"], "OBJECTIVES/SD_DEFENDER_HINT");
    cyberattack();
    initspawns();
    thread startmatchobjectiveicons();
    thread waittooverridegraceperiod();
    setupwaypointicons();
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bdd
// Size: 0x124
function updategametypedvars() {
    updatecommongametypedvars();
    level.empspawnindex = dvarintvalue("empSpawn", 0, 0, 4);
    level.radarpingtime = 4;
    level.persbombtimer = dvarintvalue("persBombTimer", 0, 0, 1);
    level.detonatescore = dvarintvalue("detonateScore", 1, 0, 5);
    level.bombtimer = dvarfloatvalue("bombtimer", 30, 1, 300);
    level.planttime = dvarfloatvalue("planttime", 1, 0, 20);
    level.defusetime = dvarfloatvalue("defusetime", 1, 0, 20);
    level.multibomb = dvarintvalue("multibomb", 0, 0, 1);
    level.showenemycarrier = dvarintvalue("showEnemyCarrier", 5, 0, 6);
    level.idleresettime = dvarfloatvalue("idleResetTime", 0, 0, 60);
    level.pickuptime = dvarfloatvalue("pickupTime", 0, 0, 10);
    level.allowempweapon = dvarintvalue("allowEMPWeapon", 0, 0, 1);
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d08
// Size: 0x19f
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_cyber_spawn_allies");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_cyber_spawn_axis");
    var_66d22f456a85031a = function_53c4c53197386572(level.var_998e6c3eeb879000, 0);
    attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_cyber_spawn_allies", var_66d22f456a85031a);
    defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_cyber_spawn_axis", var_66d22f456a85031a);
    namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
    namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_ctf_spawn", 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_ctf_spawn", 1);
    if (getgametypenumlives() != 1) {
        assignteamspawns();
        level.cyberteamspawnsetids["allies"] = "allies";
        level.cyberteamspawnsetids["axis"] = "axis";
        namespace_b2d5aa2baf2b5701::registerspawnset("allies", level.teamspawnpoints["allies"]);
        namespace_b2d5aa2baf2b5701::registerspawnset("axis", level.teamspawnpoints["axis"]);
        namespace_b2d5aa2baf2b5701::registerspawnset("neutral", level.teamspawnpoints["neutral"]);
    }
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1eae
// Size: 0x11f
function getspawnpoint() {
    if (spawnlogic::function_bff229a11ecd1e34()) {
        spawnlogic::setactivespawnlogic(#"start");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("StartSpawn", "Crit_Default");
    }
    spawnteam = self.pers["team"];
    if (getgametypenumlives() != 1) {
        if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
            if (spawnteam == game["attackers"]) {
                namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
                spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers");
            } else {
                namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
                spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders");
            }
        } else {
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, level.cyberteamspawnsetids[spawnteam], "neutral");
        }
    } else if (spawnteam == game["attackers"]) {
        namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers");
    } else {
        namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders");
    }
    return spawnpoint;
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fd5
// Size: 0x7b
function function_72118bfd9964ea0a(teamname) {
    players = level.teamdata[teamname]["players"];
    foreach (player in players) {
        if (namespace_7e17181d03156026::isreallyalive(player)) {
            return 0;
        }
    }
    return 1;
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2058
// Size: 0x43c
function assignteamspawns() {
    level.spawnnodetype = "mp_ctf_spawn";
    spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray(level.spawnnodetype);
    ispathdataavailable = namespace_b2d5aa2baf2b5701::ispathdataavailable();
    level.teamspawnpoints["axis"] = [];
    level.teamspawnpoints["allies"] = [];
    level.teamspawnpoints["neutral"] = [];
    if (level.objectives.size == 2) {
        var_6d651a87c5a99dbb = level.objectives["axis"];
        var_3e473a3d5740c130 = level.objectives["allies"];
        var_d363bc9d0700ed97 = (var_6d651a87c5a99dbb.curorigin[0], var_6d651a87c5a99dbb.curorigin[1], 0);
        var_59bdaac880603126 = (var_3e473a3d5740c130.curorigin[0], var_3e473a3d5740c130.curorigin[1], 0);
        var_e2d2b97130316270 = var_59bdaac880603126 - var_d363bc9d0700ed97;
        var_4dac618cc1728faa = length2d(var_e2d2b97130316270);
        foreach (spawnpoint in spawnpoints) {
            var_c982049ea3238d92 = (spawnpoint.origin[0], spawnpoint.origin[1], 0);
            var_42eaea0258074021 = var_c982049ea3238d92 - var_d363bc9d0700ed97;
            var_4d2d882316198c95 = vectordot(var_42eaea0258074021, var_e2d2b97130316270);
            var_79d0930df6523209 = var_4d2d882316198c95 / var_4dac618cc1728faa * var_4dac618cc1728faa;
            if (var_79d0930df6523209 < 0.33) {
                spawnpoint.teambase = var_6d651a87c5a99dbb.ownerteam;
                level.teamspawnpoints[spawnpoint.teambase][level.teamspawnpoints[spawnpoint.teambase].size] = spawnpoint;
            } else if (var_79d0930df6523209 > 0.67) {
                spawnpoint.teambase = var_3e473a3d5740c130.ownerteam;
                level.teamspawnpoints[spawnpoint.teambase][level.teamspawnpoints[spawnpoint.teambase].size] = spawnpoint;
            } else {
                var_1ea3ff868194391b = undefined;
                var_f3417be7c70940a0 = undefined;
                if (ispathdataavailable) {
                    var_1ea3ff868194391b = getpathdist(spawnpoint.origin, var_6d651a87c5a99dbb.curorigin, 999999);
                }
                if (isdefined(var_1ea3ff868194391b) && var_1ea3ff868194391b != -1) {
                    var_f3417be7c70940a0 = getpathdist(spawnpoint.origin, var_3e473a3d5740c130.curorigin, 999999);
                }
                if (!isdefined(var_f3417be7c70940a0) || var_f3417be7c70940a0 == -1) {
                    var_1ea3ff868194391b = distance2d(var_6d651a87c5a99dbb.curorigin, spawnpoint.origin);
                    var_f3417be7c70940a0 = distance2d(var_3e473a3d5740c130.curorigin, spawnpoint.origin);
                }
                var_7c7809cdc3f571e5 = max(var_1ea3ff868194391b, var_f3417be7c70940a0);
                var_126715ed2b04d65f = min(var_1ea3ff868194391b, var_f3417be7c70940a0);
                var_882f07cd483ee4da = var_126715ed2b04d65f / var_7c7809cdc3f571e5;
                if (var_882f07cd483ee4da > 0.5) {
                    level.teamspawnpoints["neutral"][level.teamspawnpoints["neutral"].size] = spawnpoint;
                }
            }
        }
    } else {
        foreach (spawnpoint in spawnpoints) {
            spawnpoint.teambase = getnearestbombsiteteam(spawnpoint);
            if (spawnpoint.teambase == "axis") {
                level.teamspawnpoints["axis"][level.teamspawnpoints["axis"].size] = spawnpoint;
            } else {
                level.teamspawnpoints["allies"][level.teamspawnpoints["allies"].size] = spawnpoint;
            }
        }
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x249b
// Size: 0x106
function getnearestbombsiteteam(spawnpoint) {
    ispathdataavailable = namespace_b2d5aa2baf2b5701::ispathdataavailable();
    var_da039f6e2e6a19d2 = undefined;
    nearestdist = undefined;
    foreach (bombsite in level.objectives) {
        dist = undefined;
        if (ispathdataavailable) {
            dist = getpathdist(spawnpoint.origin, bombsite.curorigin, 999999);
        }
        if (!isdefined(dist) || dist == -1) {
            dist = distancesquared(bombsite.curorigin, spawnpoint.origin);
        }
        if (!isdefined(var_da039f6e2e6a19d2) || dist < nearestdist) {
            var_da039f6e2e6a19d2 = bombsite;
            nearestdist = dist;
        }
    }
    return getotherteam(var_da039f6e2e6a19d2.ownerteam)[0];
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x25a9
// Size: 0xc6
function private function_5151fb129e5aafdf(var_a350db35c646e0f9) {
    /#
        assertex(isdefined(var_a350db35c646e0f9) && var_a350db35c646e0f9.size > 0, "Invalid spawn trigger array");
    #/
    switch (level.mapname) {
    case #"hash_b4040d028dc0782a":
        foreach (var_128edf2232d31c50 in var_a350db35c646e0f9) {
            if (distancesquared((9770, 11472, -82), var_128edf2232d31c50.origin) < 1) {
                var_a350db35c646e0f9 = namespace_3c37cb17ade254d::array_remove(var_a350db35c646e0f9, var_128edf2232d31c50);
            }
        }
        break;
    default:
        break;
    }
    return var_a350db35c646e0f9;
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2677
// Size: 0x8c2
function cyberattack() {
    var_8a65b17ba13a8fdd = getentarray("cyber_emp", "targetname");
    foreach (cyberemp in var_8a65b17ba13a8fdd) {
        cyberemp delete();
    }
    var_92fc6d4f242a0f8d = function_53c4c53197386572(getstructarray("cyber_emp_pickup_trig", "script_noteworthy"), []);
    if (var_92fc6d4f242a0f8d.size > 0) {
        level.var_998e6c3eeb879000 = 1;
    } else {
        var_92fc6d4f242a0f8d = getentarray("cyber_emp_pickup_trig", "targetname");
        if (var_92fc6d4f242a0f8d.size > 0) {
            var_92fc6d4f242a0f8d = function_5151fb129e5aafdf(var_92fc6d4f242a0f8d);
        } else {
            /#
                /#
                    assertmsg("vehicle_explosion");
                #/
            #/
            return;
        }
    }
    if (level.empspawnindex == 3) {
        if (isdefined(game["empSpawn"])) {
            var_d2113414696571e3 = [];
            for (i = 0; i < var_92fc6d4f242a0f8d.size; i++) {
                var_d2113414696571e3[var_d2113414696571e3.size] = i;
            }
            var_d2113414696571e3 = array_remove(var_d2113414696571e3, game["empSpawn"]);
            level.empspawnindex = random(var_d2113414696571e3);
        } else {
            level.empspawnindex = randomintrange(0, var_92fc6d4f242a0f8d.size);
        }
        game["empSpawn"] = level.empspawnindex;
    } else if (level.empspawnindex == 4) {
        if (isdefined(game["empSpawn"])) {
            level.empspawnindex = game["empSpawn"] + 1;
            if (level.empspawnindex == var_92fc6d4f242a0f8d.size) {
                level.empspawnindex = 0;
            }
        } else {
            level.empspawnindex = 0;
        }
        game["empSpawn"] = level.empspawnindex;
    }
    var_f583b91c1067e38f = var_92fc6d4f242a0f8d[level.empspawnindex];
    if (!istrue(level.allowempweapon)) {
        var_f583b91c1067e38f = spawn("trigger_radius", var_f583b91c1067e38f.origin, 0, 32, 128);
    }
    visuals[0] = spawn("script_model", var_f583b91c1067e38f.origin);
    visuals[0] setmodel("projectile_cyber_emp_v0");
    tracestart = visuals[0].origin + (0, 0, 32);
    traceend = visuals[0].origin + (0, 0, -100);
    ignoreents = [0:visuals[0]];
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 1, 1, 1);
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    if (trace["fraction"] < 1) {
        visuals[0].origin = trace["position"] + (0, 0, 2);
    }
    var_f583b91c1067e38f enablelinkto();
    var_f583b91c1067e38f linkto(visuals[0]);
    var_f583b91c1067e38f.baseorigin = var_f583b91c1067e38f.origin;
    var_f583b91c1067e38f.no_moving_platfrom_unlink = 1;
    var_f583b91c1067e38f.linktoenabledflag = 1;
    if (!level.multibomb) {
        level.cyberemp = namespace_19b4203b51d56488::createcarryobject("neutral", var_f583b91c1067e38f, visuals, (0, 0, 16), undefined, 1);
        level.cyberemp.cancontestclaim = 1;
        level.cyberemp.stalemate = 0;
        level.cyberemp.wasstalemate = 1;
        level.cyberemp namespace_19b4203b51d56488::allowuse("any");
        level.cyberemp.curprogress = 0;
        level.cyberemp.usetime = 0.05;
        level.cyberemp.userate = 1;
        level.cyberemp.id = "";
        level.cyberemp.exclusiveuse = 0;
        level.cyberemp.skiptouching = 1;
        level.cyberemp.skipminimapids = 1;
        level.cyberemp.onuse = &emptriggerholdonuse;
        if (level.cyberemp.triggertype == "use") {
            level.cyberemp.trigger setcursorhint("HINT_NOICON");
            level.cyberemp.trigger sethintstring("MP/EMP_PICKUP_USE");
            level.cyberemp.trigger setusepriority(-1 - 1 - 1 - 1);
        }
        level.cyberemp namespace_19b4203b51d56488::setusetime(level.cyberemp.usetime);
        level.cyberemp namespace_19b4203b51d56488::setwaitweaponchangeonuse(0);
        level.cyberemp.allowweapons = 1;
        level.cyberemp.onpickup = &onpickup;
        level.cyberemp.ondrop = &ondrop;
        level.cyberemp.firstpickup = 1;
        level thread empsitewatcher();
        level.bombrespawnpoint = level.cyberemp.visuals[0].origin;
        level.bombrespawnangles = level.cyberemp.visuals[0].angles;
        level.cyberemp.visualgroundoffset = (0, 0, 2);
        if (getdvarint(@"hash_484e617d6f7b7fa7") != 0) {
            level.cyberemp namespace_19b4203b51d56488::function_316d9da870e12a03([0:level.cyberemp.visuals[0]], level.cyberemp.trigger, 1, 80, 0, &function_bf60004ce7bda1f8);
        }
    } else {
        var_f583b91c1067e38f delete();
        visuals[0] delete();
    }
    var_999a5ea101dcf58e = function_53c4c53197386572(getent("cyber_empzone_axis", "targetname"), undefined);
    if (isdefined(var_999a5ea101dcf58e)) {
        var_f9cbff5134da960b = getstruct("cyber_empzone_axis", "script_noteworthy");
        if (isdefined(var_f9cbff5134da960b)) {
            var_999a5ea101dcf58e.origin = drop_to_ground(var_f9cbff5134da960b.origin, 10, -10);
        }
    } else {
        var_999a5ea101dcf58e = function_ce51e08dcc037220(getent("cyber_empzone_axis", "script_noteworthy"), undefined, "No cyber_empzone_axis trigger found in map. Please bug this to the level designer");
        if (!isdefined(var_999a5ea101dcf58e)) {
            return;
        }
    }
    var_16f4d27615f0d9b1 = function_53c4c53197386572(getent("cyber_empzone_allies", "targetname"), undefined);
    if (isdefined(var_16f4d27615f0d9b1)) {
        var_f9cbff5134da960b = getstruct("cyber_empzone_allies", "script_noteworthy");
        if (isdefined(var_f9cbff5134da960b)) {
            var_16f4d27615f0d9b1.origin = drop_to_ground(var_f9cbff5134da960b.origin, 10, -10);
        }
    } else {
        var_16f4d27615f0d9b1 = function_ce51e08dcc037220(getent("cyber_empzone_allies", "script_noteworthy"), undefined, "No cyber_empzone_allies trigger found in map. Please bug this to the level designer");
        if (!isdefined(var_16f4d27615f0d9b1)) {
            return;
        }
    }
    var_e42151cf313ec61e = function_53c4c53197386572(getent("cyber_emp_defuse_axis", "targetname"), undefined);
    if (isdefined(var_e42151cf313ec61e)) {
        var_e42151cf313ec61e delete();
    }
    var_838d920af3079ba1 = function_53c4c53197386572(getent("cyber_emp_defuse_allies", "targetname"), undefined);
    if (isdefined(var_838d920af3079ba1)) {
        var_838d920af3079ba1 delete();
    }
    if (game["switchedsides"]) {
        level.objectives["allies"] = createbombzone("allies", var_999a5ea101dcf58e);
        level.objectives["axis"] = createbombzone("axis", var_16f4d27615f0d9b1);
    } else {
        level.objectives["allies"] = createbombzone("allies", var_16f4d27615f0d9b1);
        level.objectives["axis"] = createbombzone("axis", var_999a5ea101dcf58e);
    }
    level notify("enable_player_usability");
    level.objectives["axis"] thread data_center_sfx_loop();
    level.objectives["allies"] thread data_center_sfx_loop();
    if ("mp_hackney_yard" == level.mapname) {
        thread destroytvs();
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f40
// Size: 0x2f5
function createbombzone(team, trigger) {
    var_6668f4680f6b59bb = undefined;
    if (isdefined(trigger) && isdefined(trigger.target)) {
        var_6668f4680f6b59bb = getentarray(trigger.target, "targetname");
        foreach (var_e921cd594eb1122a in var_6668f4680f6b59bb) {
            var_e921cd594eb1122a delete();
        }
    }
    visuals[0] = spawn("script_model", drop_to_ground(trigger.origin, 10, -10));
    visuals[0] setmodel("misc_carepackage_friendly");
    if (istrue(level.var_998e6c3eeb879000)) {
        trigger = visuals[0];
        trigger.usetype = 1;
        trigger.isuseobject = 1;
        trigger.skiptouching = 1;
        trigger makeusable();
    }
    bombzone = namespace_19b4203b51d56488::createuseobject(team, trigger, visuals, (0, 0, 64), undefined, 1);
    bombzone.onuse = &onuse;
    bombzone.onbeginuse = &onbeginuse;
    bombzone.onenduse = &onenduse;
    bombzone.oncantuse = &oncantuse;
    bombzone.useweapon = makeweapon("iw9_cyberemp_plant_mp");
    bombzone.id = "bomb_zone";
    bombzone.trigger setusepriority(-1 - 1 - 1 - 1);
    bombzone.trigger setuseholdduration("duration_none");
    bombzone.trigger setusehideprogressbar(1);
    bombzone.bombplanted = 0;
    bombzone.bombexploded = undefined;
    bombzone namespace_19b4203b51d56488::setusetime(level.planttime);
    bombzone namespace_19b4203b51d56488::setusetext("MP/PLANTING_EXPLOSIVE");
    bombzone namespace_19b4203b51d56488::setusehinttext("MP/HOLD_TO_PLANT_EXPLOSIVES");
    bombzone namespace_19b4203b51d56488::setwaitweaponchangeonuse(0);
    bombzone.objectivekey = "_" + team;
    bombzone.label = bombzone.objectivekey;
    bombzone resetbombsite(1, undefined, 1);
    for (i = 0; i < visuals.size; i++) {
        if (isdefined(visuals[i].script_exploder)) {
            bombzone.exploderindex = visuals[i].script_exploder;
            visuals[i] thread setupkillcament(bombzone);
            break;
        }
    }
    bombzone.noweapondropallowedtrigger = spawn("trigger_radius", bombzone.trigger.origin, 0, 140, 100);
    return bombzone;
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x323d
// Size: 0x243
function startmatchobjectiveicons() {
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level waittill_any_2("prematch_done", "start_mode_setup");
    }
    level.objectives["allies"] namespace_19b4203b51d56488::requestid(1, 1);
    level.objectives["allies"] namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_defend_empsite", "icon_waypoint_target_empsite");
    level.objectives["allies"] namespace_19b4203b51d56488::setvisibleteam("any");
    level.objectives["axis"] namespace_19b4203b51d56488::requestid(1, 1);
    level.objectives["axis"] namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_defend_empsite", "icon_waypoint_target_empsite");
    level.objectives["axis"] namespace_19b4203b51d56488::setvisibleteam("any");
    level thread hidebombsitesaftermatchstart();
    level.cyberemp namespace_19b4203b51d56488::requestid(1, 1);
    level.cyberemp namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_emp");
    level.cyberemp namespace_19b4203b51d56488::setvisibleteam("any");
    if (isdefined(level.cyberemp.visuals[0])) {
        level.cyberemp.visuals[0] namespace_fa795886dfc5f58a::setteaminhuddatafromteamname("neutral");
        level.cyberemp.visuals[0] setasgametypeobjective();
    }
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(level.cyberemp.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(level.cyberemp.objidnum, 0);
    objective_setspecialobjectivedisplay(level.cyberemp.objidnum, 1);
    var_220be32c83520117 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    level.cyberemp.pingobjidnum = var_220be32c83520117;
    namespace_5a22b6f3a56f7e9b::objective_add_objective(var_220be32c83520117, "done", level.cyberemp.origin);
    level.cyberemp namespace_19b4203b51d56488::setvisibleteam("none", var_220be32c83520117);
    objective_setownerteam(var_220be32c83520117, undefined);
    level.cyberemp namespace_19b4203b51d56488::setobjectivestatusallicons("icon_waypoint_escort_emp", "waypoint_capture_kill", undefined, var_220be32c83520117);
    setcarriervisibility();
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3487
// Size: 0x117
function hidebombsitesaftermatchstart() {
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level waittill("prematch_done");
    }
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(level.objectives["allies"].objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(level.objectives["allies"].objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_show_for_mlg_spectator(level.objectives["allies"].objidnum, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(level.objectives["axis"].objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(level.objectives["axis"].objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_show_for_mlg_spectator(level.objectives["axis"].objidnum, 1);
    level.objectives["allies"] namespace_19b4203b51d56488::setvisibleteam("none");
    level.objectives["axis"] namespace_19b4203b51d56488::setvisibleteam("none");
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35a5
// Size: 0xc
function emptriggerholdonuse(player) {
    
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35b8
// Size: 0x168
function setupkillcament(bombzone) {
    var_27ba39cb4da36c7 = spawn("script_origin", self.origin);
    var_27ba39cb4da36c7.angles = self.angles;
    var_27ba39cb4da36c7 rotateyaw(-45, 0.05);
    waitframe();
    campos = undefined;
    var_b44cefcf38b5da97 = self.origin + (0, 0, 45);
    var_dfdbe7c0c9dca192 = self.origin + anglestoforward(var_27ba39cb4da36c7.angles) * 100 + (0, 0, 128);
    content = [0:"physicscontents_clipshot", 1:"physicscontents_missileclip", 2:"physicscontents_vehicle"];
    contentoverride = physics_createcontents(content);
    result = namespace_2a184fc4902783dc::ray_trace(var_b44cefcf38b5da97, var_dfdbe7c0c9dca192, self, contentoverride);
    campos = result["position"];
    self.killcament = spawn("script_model", campos);
    self.killcament setscriptmoverkillcam("explosive");
    bombzone.killcamentnum = self.killcament getentitynumber();
    var_27ba39cb4da36c7 delete();
    /#
        self.killcament thread function_db3df42ecd416b38(self);
    #/
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3727
// Size: 0x1d1
function function_db3df42ecd416b38(visual) {
    /#
        self endon("mlg_icon_waypoint_emp_planted");
        level endon("on");
        visual endon("mlg_icon_waypoint_emp_planted");
        while (1) {
            if (getdvarint(@"hash_3f3a15fb7e7c9b0") > 0) {
                line(self.origin, self.origin + anglestoforward(self.angles) * 10, (1, 0, 0));
                line(self.origin, self.origin + anglestoright(self.angles) * 10, (0, 1, 0));
                line(self.origin, self.origin + anglestoup(self.angles) * 10, (0, 0, 1));
                line(visual.origin + (0, 0, 5), self.origin, (0, 0, 1));
                line(visual.origin, visual.origin + anglestoforward(visual.angles) * 10, (1, 0, 0));
                line(visual.origin, visual.origin + anglestoright(visual.angles) * 10, (0, 1, 0));
                line(visual.origin, visual.origin + anglestoup(visual.angles) * 10, (0, 0, 1));
            }
            waitframe();
        }
    #/
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38ff
// Size: 0x70
function empsitewatcher() {
    level endon("game_ended");
    while (1) {
        level waittill("bomb_pickup");
        if (level.cyberemp.carrier.team == "allies") {
            level.objectives["axis"] setupforplanting();
        } else {
            level.objectives["allies"] setupforplanting();
        }
        waitframe();
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3976
// Size: 0x64
function data_center_sfx_loop() {
    ent = spawn_script_origin(self.trigger.origin, self.trigger.angles);
    ent thread play_loop_sound_on_entity("data_center_cyber_lp");
    level waittill("emp_detonated");
    ent stopsounds("data_center_cyber_lp");
    waitframe();
    ent delete();
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39e1
// Size: 0x175
function onbeginuse(player) {
    if (!namespace_19b4203b51d56488::isfriendlyteam(player.pers["team"]) && !level.bombplanted) {
        player.isplanting = 1;
        setomnvar("ui_bomb_interacting", 1);
        namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_defend_empsite", "icon_waypoint_emp_planting");
    } else {
        player.isdefusing = 1;
        setomnvar("ui_bomb_interacting", 3);
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(2, player.team, player getentitynumber());
        namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_defend_empsite_nt", "icon_waypoint_emp_defusing");
        namespace_5a22b6f3a56f7e9b::objective_teammask_removefrommask(self.radialtimeobjid, player.team);
    }
    player thread allowedwhileplanting(0);
    if (level.bombplanted && !namespace_19b4203b51d56488::isfriendlyteam(player.pers["team"])) {
        player namespace_c52269d70f989750::notify_enemy_bots_bomb_used("defuse");
        player.isdefusing = 1;
        setomnvar("ui_bomb_interacting", 3);
        setomnvar("ui_bomb_defuser", player getentitynumber());
        if (isdefined(level.cyberemp.visuals[0])) {
            level.cyberemp.visuals[0] hide();
        }
        player thread startnpcbombusesound("briefcase_bomb_defuse_mp", "equip_suitcase_defuse_button");
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b5d
// Size: 0x94
function allowedwhileplanting(isallowed) {
    val::set("planting", "melee", isallowed);
    val::set("planting", "allow_jump", isallowed);
    val::set("planting", "gesture", isallowed);
    if (isallowed) {
        self waittill("bomb_allow_offhands");
    }
    val::set("planting", "melee", isallowed);
    val::set("planting", "mantle", isallowed);
    val::set("planting", "offhand_weapons", isallowed);
    if (isallowed) {
        val::function_c9d0b43701bdba00("planting");
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3bf8
// Size: 0x199
function onenduse(team, player, result) {
    objid = self.objidnum;
    namespace_5a22b6f3a56f7e9b::objective_set_progress(objid, 0);
    namespace_5a22b6f3a56f7e9b::objective_show_progress(objid, 0);
    if (!result) {
        if (player.isdefusing) {
            namespace_19b4203b51d56488::setobjectivestatusallicons("icon_waypoint_defuse_empsite_nt", "icon_waypoint_defend_empsite_nt", "mlg_icon_waypoint_emp_planted");
        } else {
            namespace_19b4203b51d56488::setobjectivestatusallicons("icon_waypoint_defend_empsite", "icon_waypoint_target_empsite", undefined);
        }
        if (isdefined(self.radialtimeobjid)) {
            namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(self.radialtimeobjid, player.team);
        }
        if (player meleebuttonpressed()) {
            interruptbombplanting(player);
        } else {
            player switchtolastweapon();
        }
    }
    if (istrue(player.isdefusing) || istrue(player.isplanting)) {
        setomnvar("ui_bomb_interacting", 0);
    }
    player.isplanting = 0;
    player.isdefusing = 0;
    setomnvar("ui_bomb_defuser", -1);
    if (!isdefined(player)) {
        return;
    }
    player thread allowedwhileplanting(1);
    player.bombplantweapon = undefined;
    if (isplayer(player)) {
        player setclientomnvar("ui_objective_pinned_text_param", 0);
        player.ui_bomb_planting_defusing = undefined;
    }
    if (!namespace_19b4203b51d56488::isfriendlyteam(player.pers["team"])) {
        if (isdefined(level.cyberemp) && !result) {
            level.cyberemp.visuals[0] show();
        }
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3d98
// Size: 0xcf
function startnpcbombusesound(weaponname, var_cb3339ece72dbdeb) {
    self endon("death");
    self endon("stopNpcBombSound");
    if (isanymlgmatch() || istrue(level.silentplant) || _hasperk("specialty_engineer")) {
        self setentitysoundcontext("silent_plant", "on");
        return;
    }
    while (1) {
        var_66b3db972ac1531e = self waittill("weapon_change");
        if (var_66b3db972ac1531e.basename == weaponname) {
            break;
        }
    }
    self playsoundtoteam(var_cb3339ece72dbdeb, self.team, self);
    enemyteam = getotherteam(self.team)[0];
    self playsoundtoteam(var_cb3339ece72dbdeb, enemyteam);
    self waittill("weapon_change");
    self notify("stopNpcBombSound");
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3e6e
// Size: 0x3f9
function onpickup(player, var_5760e0f038d1baa3, defused) {
    level notify("bomb_pickup");
    if (istrue(level.allowempweapon)) {
        curweapon = player getcurrentprimaryweapon();
        if (isdefined(curweapon.basename) && curweapon.basename == "iw8_lm_dblmg_mp") {
            player notify("switched_from_minigun");
        }
        player _giveweapon("iw9_cyberemp_mp");
        if (!istrue(defused) && !player namespace_a2f809133c566621::isjuggernaut() && !isbot(player)) {
            player _switchtoweaponimmediate("iw9_cyberemp_mp");
        }
    }
    player thread empradarwatcher();
    setomnvar("ui_bomb_carrier", player getentitynumber());
    player setclientomnvar("ui_emp_carrier_hud", 1);
    namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(16, player.team, player getentitynumber());
    if (self.firstpickup) {
        player thread doscoreevent(#"hash_bb78056c283362a4");
    }
    level.usestartspawns = 0;
    team = player.pers["team"];
    if (team == "allies") {
        otherteam = "axis";
    } else {
        otherteam = "allies";
    }
    player.isbombcarrier = 1;
    if (level.codcasterenabled) {
        player setgametypevip(1);
    }
    if (!isdefined(defused)) {
        if (self.firstpickup) {
            var_a675744864c65c1 = "emppickup_friendly_first";
            self.firstpickup = 0;
        } else {
            var_a675744864c65c1 = "emppickup_friendly";
        }
        leaderdialog(var_a675744864c65c1, team, "bomb");
        leaderdialog("emppickup_enemy", otherteam, "bomb");
        namespace_a34451ae3d453e::playsoundonplayers(game["bomb_recovered_sound"], team);
        var_4725e52b7c3aa25c = getteamdata(player.team, "players");
        level thread namespace_44abc05161e2e2cb::notifyteam("emp_pickup", "emp_pickup_enemy", player.team, var_4725e52b7c3aa25c);
        player thread namespace_44abc05161e2e2cb::showsplash("emp_pickup");
        level thread teamplayercardsplash("callout_emppickup", player, player.team, undefined, 1);
    }
    level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(player.team, "cyber_carrier_defend", "cyber_data_defend", player, "cyber_emp_plant");
    self.offset3d = (0, 0, 85);
    namespace_19b4203b51d56488::setownerteam(team);
    namespace_19b4203b51d56488::allowuse("none");
    if (isdefined(level.showenemycarrier)) {
        if (level.showenemycarrier == 0) {
            namespace_19b4203b51d56488::setvisibleteam("friendly");
            objective_state(self.pingobjidnum, "done");
        } else {
            namespace_19b4203b51d56488::setvisibleteam("friendly");
            objective_state(self.pingobjidnum, "current");
            namespace_19b4203b51d56488::updatecompassicon("enemy", self.pingobjidnum);
            objective_icon(self.pingobjidnum, "icon_waypoint_kill");
        }
    }
    namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_escort_emp", "waypoint_capture_kill");
    level.objectives[team] namespace_19b4203b51d56488::setvisibleteam("none");
    level.objectives[otherteam] namespace_19b4203b51d56488::setvisibleteam("any");
    namespace_5a22b6f3a56f7e9b::objective_show_for_mlg_spectator(level.objectives["allies"].objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_show_for_mlg_spectator(level.objectives["axis"].objidnum, 0);
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.player = player;
    var_7e2c53b0bcf117d9.eventname = "pickup";
    var_7e2c53b0bcf117d9.position = player.origin;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x426e
// Size: 0x172
function ondrop(player) {
    self notify("emp_dropped");
    setomnvar("ui_bomb_carrier", -1);
    if (level.bombplanted) {
        namespace_19b4203b51d56488::setownerteam(player.team);
        namespace_19b4203b51d56488::allowuse("none");
    } else {
        foreach (objective in level.objectives) {
            objective resetbombsite(1);
        }
        playsoundonplayers(game["bomb_dropped_sound"], namespace_19b4203b51d56488::getownerteam());
        self.offset3d = (0, 0, 16);
        namespace_19b4203b51d56488::allowuse("any");
        namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_emp", "icon_waypoint_emp");
        namespace_19b4203b51d56488::setownerteam("neutral");
        namespace_19b4203b51d56488::setvisibleteam("any");
        if (isdefined(player)) {
            printonteamarg("MP/EXPLOSIVES_DROPPED_BY", namespace_19b4203b51d56488::getownerteam(), player);
        }
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(player.team, "cyber_emp_pickup", "cyber_emp_pickup");
        if (level.idleresettime > 0) {
            thread returnaftertime();
        }
    }
    if (istrue(level.allowempweapon)) {
        player _takeweapon("iw9_cyberemp_mp");
        player switchtolastweapon();
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43e7
// Size: 0xae
function returnaftertime() {
    level endon("bomb_pickup");
    var_8e53d4ca3de8531a = 0;
    while (var_8e53d4ca3de8531a < level.idleresettime) {
        waitframe();
        if (self.ownerteam == "neutral") {
            var_8e53d4ca3de8531a = var_8e53d4ca3de8531a + level.framedurationseconds;
        }
    }
    foreach (team in level.teamnamelist) {
        playsoundonplayers(game["bomb_dropped_sound"], team);
    }
    namespace_19b4203b51d56488::returnhome();
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x449c
// Size: 0x5d3
function onuse(player) {
    team = player.pers["team"];
    otherteam = getotherteam(team)[0];
    if (!namespace_19b4203b51d56488::isfriendlyteam(player.pers["team"]) && !level.bombplanted) {
        level thread empjamandrumbleclients(0);
        setomnvar("ui_bomb_timer_endtime_a", int(namespace_d576b6dc7cef9c62::gettimeremaining()) + gettime());
        level notify("bomb_planted");
        player notify("bomb_planted");
        player notify("objective", "plant");
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(15, player.team, player getentitynumber());
        var_4725e52b7c3aa25c = [];
        var_4725e52b7c3aa25c[var_4725e52b7c3aa25c.size] = player;
        level thread namespace_44abc05161e2e2cb::notifyteam("emp_planted", "emp_planted_enemy", player.team, var_4725e52b7c3aa25c);
        player thread namespace_44abc05161e2e2cb::showsplash("emp_planted", namespace_62c556437da28f50::getscoreinfovalue(#"plant"));
        level thread teamplayercardsplash("callout_empplanted", player, undefined, undefined, 1);
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(player.team, "cyber_emp_defend", "cyber_emp_defsue");
        player setclientomnvar("ui_emp_carrier_hud", 0);
        leaderdialog("empplanted_friendly", team);
        player playsoundtoteam("mp_bombplaced_friendly", team);
        leaderdialog("empplanted_enemy", otherteam);
        player playsoundtoteam("mp_bombplaced_enemy", otherteam);
        player thread doscoreevent(#"plant");
        player namespace_aad14af462a74d08::onplant();
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = player;
        var_7e2c53b0bcf117d9.eventname = "plant";
        var_7e2c53b0bcf117d9.position = player.origin;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
        player.bombplantedtime = gettime();
        player incpersstat("plants", 1);
        player namespace_b919c4be206d3c80::function_48544e365f4f5648(15, 1);
        player namespace_2685ec368e022695::statsetchild("round", "plants", player.pers["plants"]);
        player setextrascore0(player.pers["plants"]);
        player namespace_74465391b3cf76b::addplantingcharge();
        level.bombplanted = 1;
        level thread bombplanted(self, player.pers["team"]);
        level.bombowner = player;
        level.bombowner.isbombcarrier = 0;
        if (level.codcasterenabled) {
            player setgametypevip(0);
        }
        level.cyberemp namespace_19b4203b51d56488::setdropped();
        level.cyberemp namespace_19b4203b51d56488::allowuse("none");
        level.cyberemp namespace_19b4203b51d56488::setvisibleteam("none");
        if (istrue(level.allowempweapon)) {
            player _takeweapon("iw9_cyberemp_mp");
            player switchtolastweapon();
        }
        self.useweapon = makeweapon("iw9_cyberemp_defuse_mp");
        setupfordefusing(self, player);
    } else {
        player notify("bomb_defused");
        player notify("objective", "defuse");
        var_4555368557dc49ac = function_72118bfd9964ea0a(otherteam);
        if (var_4555368557dc49ac) {
            var_ebbe93b2cf924047 = "empdefused_final_friendly";
            var_ad194f060980b384 = "empdefused_final_enemy";
            level.var_1242a000845a4331 = 1;
        } else {
            var_ebbe93b2cf924047 = "empdefused_friendly";
            var_ad194f060980b384 = "empdefused_enemy";
        }
        leaderdialog(var_ebbe93b2cf924047, team);
        leaderdialog(var_ad194f060980b384, otherteam);
        var_4725e52b7c3aa25c = [];
        var_4725e52b7c3aa25c[var_4725e52b7c3aa25c.size] = player;
        level thread namespace_44abc05161e2e2cb::notifyteam("emp_defuse", "emp_defuse_enemy", player.team, var_4725e52b7c3aa25c);
        level thread teamplayercardsplash("callout_empdefused", player, undefined, undefined, 1);
        level thread namespace_44abc05161e2e2cb::updatematchstatushintforallplayers(player.team, "cyber_carrier_defend", "cyber_data_defend", player, "cyber_emp_plant");
        if (isdefined(level.bombowner) && level.bombowner.bombplantedtime + 3000 + level.defusetime * 1000 > gettime() && isreallyalive(level.bombowner)) {
            player thread namespace_62c556437da28f50::scoreeventpopup(#"ninja_defuse");
            player thread namespace_44abc05161e2e2cb::showsplash("ninja_defuse", namespace_62c556437da28f50::getscoreinfovalue(#"defuse"));
        } else {
            player thread namespace_62c556437da28f50::scoreeventpopup(#"defuse");
            player thread namespace_44abc05161e2e2cb::showsplash("emp_defuse", namespace_62c556437da28f50::getscoreinfovalue(#"defuse"));
        }
        player thread namespace_48a08c5037514e04::doscoreevent(#"hash_d42f3a6d11e62127");
        player incpersstat("defuses", 1);
        player namespace_b919c4be206d3c80::function_48544e365f4f5648(15, 1);
        player namespace_2685ec368e022695::statsetchild("round", "defuses", player.pers["defuses"]);
        namespace_aad14af462a74d08::function_c51330573171a1be(player);
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = player;
        var_7e2c53b0bcf117d9.eventname = "defuse";
        var_7e2c53b0bcf117d9.position = player.origin;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
        level.bombplanted = 0;
        level thread bombdefused(self);
        resetbombsite(1, player);
        if (var_4555368557dc49ac) {
            wait(3);
        }
        level.cyberemp namespace_19b4203b51d56488::allowuse("any");
        level.cyberemp namespace_19b4203b51d56488::setpickedup(player, 0, 1);
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4a76
// Size: 0xdb
function empjamandrumbleclients(rumble, endgame) {
    foreach (player in level.players) {
        player setempjammed(1);
        if (istrue(rumble)) {
            player playrumbleonpositionforclient("artillery_rumble", player.origin);
        }
    }
    if (!istrue(endgame)) {
        wait(1);
        foreach (player in level.players) {
            player setempjammed(0);
        }
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4b58
// Size: 0xcb
function resetbombsite(defused, player, matchstart) {
    if (!defused) {
        namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_planted_empsite", "icon_waypoint_target_empsite");
        namespace_19b4203b51d56488::setvisibleteam("any");
    } else {
        if (istrue(matchstart)) {
            goto LOC_000000c9;
        }
        if (isdefined(player)) {
            self.ownerteam = player.team;
        }
        self.id = "bomb_zone";
        namespace_19b4203b51d56488::allowuse("none");
        namespace_19b4203b51d56488::setvisibleteam("none");
        namespace_5a22b6f3a56f7e9b::objective_show_for_mlg_spectator(level.objectives["allies"].objidnum, 1);
        namespace_5a22b6f3a56f7e9b::objective_show_for_mlg_spectator(level.objectives["axis"].objidnum, 1);
    LOC_000000c9:
    }
LOC_000000c9:
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c2a
// Size: 0x97
function setupforplanting() {
    self.trigger enableplayeruse(level.cyberemp.carrier);
    namespace_19b4203b51d56488::allowuse("enemy");
    namespace_19b4203b51d56488::setusetime(level.planttime);
    namespace_19b4203b51d56488::setusetext("MP/PLANTING_EXPLOSIVE");
    namespace_19b4203b51d56488::setusehinttext("MP/HOLD_TO_PLANT_EMP");
    namespace_19b4203b51d56488::setkeyobject(level.cyberemp);
    self.useweapon = makeweapon("iw9_cyberemp_plant_mp");
    namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_defend_empsite", "icon_waypoint_target_empsite");
    self.bombplanted = 0;
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4cc8
// Size: 0x1e4
function setupfordefusing(defuseobject, player) {
    self.trigger setusepriority(-1 - 1 - 1 - 1);
    self.ownerteam = player.team;
    namespace_19b4203b51d56488::allowuse("enemy");
    namespace_19b4203b51d56488::setusetime(level.defusetime);
    namespace_19b4203b51d56488::setusetext("MP/DEFUSING_EXPLOSIVE");
    namespace_19b4203b51d56488::setusehinttext("MP/HOLD_TO_DEFUSE_EMP");
    namespace_19b4203b51d56488::setkeyobject(undefined);
    namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_defend_empsite_nt", "icon_waypoint_defuse_empsite_nt");
    thread namespace_fa795886dfc5f58a::bombradialfill(player.team, "icon_waypoint_planted_empsite", "icon_waypoint_defuse_empsite");
    namespace_19b4203b51d56488::setvisibleteam("any", self.radialtimeobjid);
    self.id = "defuse_object";
    self.bombplanted = 1;
    var_b0c33d224b825287 = getenemyteams(player.team);
    var_3aaa5fb58a6c2eb7 = var_b0c33d224b825287[0];
    foreach (p in getteamdata(var_3aaa5fb58a6c2eb7, "players")) {
        self.trigger enableplayeruse(p);
    }
    if (istrue(level.var_998e6c3eeb879000)) {
        teammates = getsquadmates(player.team);
        foreach (var_c98aac0e8e6eaf8c in teammates) {
            self.trigger disableplayeruse(var_c98aac0e8e6eaf8c);
        }
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4eb3
// Size: 0x6b
function bombdefused(object) {
    namespace_d576b6dc7cef9c62::resumetimer();
    level.timelimitoverride = 0;
    level.scorelimitoverride = 0;
    object.bombplanted = 0;
    setomnvar("ui_bomb_owner_team", -1);
    level thread [[ level.updategameevents ]]();
    object.visuals[0] namespace_d576b6dc7cef9c62::stoptickingsound();
    level notify("bomb_defused");
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f25
// Size: 0xc
function oncantuse(player) {
    
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4f38
// Size: 0x493
function bombplanted(destroyedobj, team) {
    level endon("overtime");
    namespace_d576b6dc7cef9c62::pausetimer();
    setomnvar("ui_match_timer_stopped", 0);
    level.bombplantedteam = team;
    level.timelimitoverride = 1;
    level.scorelimitoverride = 1;
    if (isdefined(team)) {
        if (team == "allies") {
            setomnvar("ui_bomb_owner_team", 2);
        } else {
            setomnvar("ui_bomb_owner_team", 1);
        }
    }
    setgameendtime(int(gettime() + level.bombtimer * 1000));
    destroyedobj.visuals[0] thread namespace_d576b6dc7cef9c62::playtickingsound();
    starttime = gettime();
    thread bomb_pre_exp_music();
    thread bomb_pre_exp_sfx_wait(destroyedobj.visuals[0].origin);
    bombtimerwait();
    destroyedobj.visuals[0] namespace_d576b6dc7cef9c62::stoptickingsound();
    if (!level.bombplanted) {
        if (level.persbombtimer) {
            timepassed = (gettime() - starttime) / 1000;
            level.bombtimer = level.bombtimer - timepassed;
        }
        return;
    }
    explosionorigin = destroyedobj.visuals[0].origin;
    level.bombexploded = 1;
    setdvar(@"hash_a19c6a194a53f076", "BombExploded");
    if (isdefined(level.bombowner)) {
        destroyedobj.visuals[0] radiusdamage(explosionorigin, 512, 1, 1, level.bombowner, "MOD_EXPLOSIVE", "bomb_site_mp");
        level.bombowner incpersstat("destructions", 1);
        level.bombowner namespace_2685ec368e022695::statsetchild("round", "destructions", level.bombowner.pers["destructions"]);
    } else {
        destroyedobj.visuals[0] radiusdamage(explosionorigin, 512, 1, 1, undefined, "MOD_EXPLOSIVE", "bomb_site_mp");
    }
    playsoundatpos(explosionorigin, "iw9_exp_cyber_emp_close");
    var_9af72bbdfdeace5d = destroyedobj.visuals[0] gettagorigin("tag_origin");
    explosioneffect = spawnfx(level._effect["emp_detonation"], var_9af72bbdfdeace5d);
    triggerfx(explosioneffect);
    earthquake(0.6, 1.5, explosionorigin, 10000);
    destroyedobj.visuals[0] setmodel("misc_carepackage_friendly_dmg");
    level thread empjamandrumbleclients(1, 1);
    level notify("emp_detonated");
    foreach (objective in level.objectives) {
        objective notify("disabled");
        objective.trigger setallunusable();
    }
    if (game["switchedsides"]) {
        destroyedobj.exploderindex = 200;
    } else {
        destroyedobj.exploderindex = 201;
    }
    if (isdefined(destroyedobj.exploderindex)) {
        exploder(destroyedobj.exploderindex);
    }
    destroyedobj.bombplanted = 0;
    level.cyberemp namespace_19b4203b51d56488::setvisibleteam("none");
    level.objectives["allies"] namespace_19b4203b51d56488::setvisibleteam("none");
    level.objectives["axis"] namespace_19b4203b51d56488::setvisibleteam("none");
    namespace_5a22b6f3a56f7e9b::objective_show_for_mlg_spectator(level.objectives["allies"].objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_show_for_mlg_spectator(level.objectives["axis"].objidnum, 0);
    setgameendtime(0);
    level.scorelimitoverride = 1;
    if (isdefined(level.bombowner)) {
        level thread teamplayercardsplash("callout_destroyed_cyberbombsite", level.bombowner);
    }
    destroyedobj namespace_19b4203b51d56488::releaseid();
    if (istrue(level.nukeinfo.incoming)) {
        return;
    }
    wait(3);
    thread namespace_d576b6dc7cef9c62::endgame(team, game["end_reason"]["target_destroyed"], undefined, undefined, level.detonatescore);
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53d2
// Size: 0x5a
function bombtimerwait() {
    level endon("bomb_defused");
    level endon("overtime_ended");
    var_4dfaa92e2bce1194 = int(level.bombtimer * 1000 + gettime());
    setomnvar("ui_bomb_timer_endtime", var_4dfaa92e2bce1194);
    level thread handlehostmigration(var_4dfaa92e2bce1194);
    namespace_e323c8674b44c8f4::waitlongdurationwithgameendtimeupdate(level.bombtimer);
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5433
// Size: 0x13
function bomb_pre_exp_music() {
    thread namespace_3bde6869e44a2770::stopsuspensemusic();
    thread namespace_3bde6869e44a2770::bombplanted_music();
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x544d
// Size: 0x3d
function bomb_pre_exp_sfx_wait(var_80b64a135ea82d49) {
    level endon("bomb_defused");
    level endon("overtime_ended");
    wait(max(level.bombtimer - 2, 0.1));
    playsoundatpos(var_80b64a135ea82d49, "iw9_exp_cyber_emp_preexplode");
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5491
// Size: 0x55
function handlehostmigration(var_4dfaa92e2bce1194) {
    level endon("bomb_defused");
    level endon("overtime_ended");
    level endon("game_ended");
    level endon("disconnect");
    level waittill("host_migration_begin");
    timepassed = namespace_e323c8674b44c8f4::waittillhostmigrationdone();
    if (timepassed > 0) {
        setomnvar("ui_bomb_timer_endtime", var_4dfaa92e2bce1194 + timepassed);
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x54ed
// Size: 0x2f
function overtimethread(time) {
    level endon("game_ended");
    level.inovertime = 1;
    wait(5);
    level.disablespawning = 1;
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5523
// Size: 0x86
function givelastonteamwarning() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    waittillrecoveredhealth(3);
    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_915f01baa2419c9f");
    otherteam = getotherteam(self.pers["team"])[0];
    level thread teamplayercardsplash("callout_lastteammemberalive", self, self.pers["team"]);
    level thread teamplayercardsplash("callout_lastenemyalive", self, otherteam);
    level notify("last_alive", self);
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x55b0
// Size: 0x31
function ontimelimit() {
    if (level.bombexploded) {
        return;
    }
    function_f0f967947c6a7ec8();
    thread namespace_d576b6dc7cef9c62::endgame("tie", game["end_reason"]["cyber_tie"]);
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x55e8
// Size: 0xfb
function onspawnplayer(var_9156b53bcf7ce573) {
    self setclientomnvar("ui_securing", 0);
    self setclientomnvar("ui_securing_progress", 0);
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("hide_match_hint");
    if (level.multibomb) {
        self setclientomnvar("ui_emp_carrier_hud", 1);
    } else {
        self setclientomnvar("ui_emp_carrier_hud", 0);
        thread updatebombsiteusability();
    }
    self.isplanting = 0;
    self.isdefusing = 0;
    self.isbombcarrier = 0;
    if (inovertime() && !isdefined(self.otspawned)) {
        thread printothint();
    }
    if (isdefined(self.pers["plants"])) {
        setextrascore0(self.pers["plants"]);
    }
    if (isdefined(self.pers["rescues"])) {
        setextrascore1(self.pers["rescues"]);
    }
    thread updatematchstatushintonspawn();
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x56ea
// Size: 0x87
function updatebombsiteusability() {
    if (!isdefined(level.objectives)) {
        level waittill("enable_player_usability");
    }
    foreach (bombzone in level.objectives) {
        if (bombzone.bombplanted == 0) {
            bombzone.trigger disableplayeruse(self);
        }
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5778
// Size: 0xf1
function updatematchstatushintonspawn() {
    if (level.bombplanted) {
        if (isdefined(level.bombplantedteam) && level.bombplantedteam == self.team) {
            namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("cyber_emp_defend");
        } else {
            namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("cyber_emp_defsue");
        }
    } else if (isdefined(level.cyberemp) && isdefined(level.cyberemp.carrier)) {
        if (level.cyberemp.carrier.team == self.team) {
            if (level.cyberemp.carrier == self) {
                namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("cyber_emp_plant");
            } else {
                namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("cyber_carrier_defend");
            }
        } else {
            namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("cyber_data_defend");
        }
    } else {
        namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("cyber_emp_pickup");
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5870
// Size: 0x5d
function function_f0f967947c6a7ec8() {
    foreach (player in level.players) {
        if (interruptbombplanting(player)) {
            break;
        }
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x58d4
// Size: 0x42
function interruptbombplanting(player) {
    if (istrue(player.isplanting) && isdefined(player.lastnonuseweapon)) {
        player _switchtoweaponimmediate(player.lastnonuseweapon);
        return 1;
    }
    return 0;
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x591e
// Size: 0x179
function ondeadevent(team) {
    function_f0f967947c6a7ec8();
    if (level.bombexploded > 0 && !level.postgameexfil) {
        return;
    }
    if (team == "all") {
        if (level.bombplanted) {
            otherteam = getotherteam(level.bombplantedteam)[0];
            thread namespace_d576b6dc7cef9c62::endgame(level.bombplantedteam, game["end_reason"][tolower(game[otherteam]) + "_eliminated"], undefined, undefined, level.detonatescore);
        } else {
            thread namespace_d576b6dc7cef9c62::endgame("tie", game["end_reason"]["tie"]);
        }
    } else if (level.bombplanted) {
        if (team != level.bombplantedteam) {
            thread namespace_d576b6dc7cef9c62::endgame(level.bombplantedteam, game["end_reason"][tolower(game[team]) + "_eliminated"], undefined, undefined, level.detonatescore);
        } else {
            return;
        }
    } else if (team == game["attackers"]) {
        level thread namespace_d576b6dc7cef9c62::endgame(game["defenders"], game["end_reason"][tolower(game[game["attackers"]]) + "_eliminated"]);
    } else if (team == game["defenders"]) {
        level thread namespace_d576b6dc7cef9c62::endgame(game["attackers"], game["end_reason"][tolower(game[game["defenders"]]) + "_eliminated"]);
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a9e
// Size: 0x49
function ononeleftevent(team) {
    if (level.bombexploded > 0) {
        return;
    }
    lastplayer = getlastlivingplayer(team);
    if (isdefined(lastplayer)) {
        lastplayer.laststanding = 1;
        lastplayer thread givelastonteamwarning();
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x5aee
// Size: 0xc4
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    self setclientomnvar("ui_emp_carrier_hud", 0);
    thread checkallowspectating();
    if (!isplayer(attacker) || attacker.team == self.team) {
        return;
    }
    if (self.isbombcarrier && level.codcasterenabled) {
        self setgametypevip(0);
    }
    awardgenericmedals(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00);
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5bb9
// Size: 0x89
function checkallowspectating() {
    waitframe();
    update = 0;
    if (!getteamdata(game["attackers"], "aliveCount")) {
        level.spectateoverride[game["attackers"]].allowenemyspectate = 1;
        update = 1;
    }
    if (!getteamdata(game["defenders"], "aliveCount")) {
        level.spectateoverride[game["defenders"]].allowenemyspectate = 1;
        update = 1;
    }
    if (update) {
        namespace_5aeecefc462876::updatespectatesettings();
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5c49
// Size: 0xe8
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    if (victim.isplanting) {
        thread utility::trycall(level.matchdata_logvictimkillevent, lifeid, "planting");
        attacker incpersstat("defends", 1);
        attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
    } else if (victim.isbombcarrier) {
        thread utility::trycall(level.matchdata_logvictimkillevent, lifeid, "carrying");
    } else if (victim.isdefusing) {
        thread utility::trycall(level.matchdata_logvictimkillevent, lifeid, "defusing");
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d38
// Size: 0x1b
function printothint() {
    self endon("disconnect");
    wait(0.25);
    self.otspawned = 1;
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x5d5a
// Size: 0x487
function awardgenericmedals(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    var_9ff9376383f4bc58 = 0;
    var_8363beb01b537d3e = 0;
    var_88f4967a49a22ed7 = 0;
    victim = self;
    var_f7ded1fdb02a123d = victim.origin;
    var_86c1c8628b1d55f8 = attacker.origin;
    attackerisinflictor = 0;
    if (isdefined(einflictor)) {
        var_86c1c8628b1d55f8 = einflictor.origin;
        attackerisinflictor = einflictor == attacker;
    }
    if (isdefined(level.cyberemp.carrier)) {
        if (isdefined(attacker) && isplayer(attacker) && attacker.pers["team"] != victim.pers["team"]) {
            if (isdefined(attacker.isbombcarrier) && attackerisinflictor && isdefined(objweapon) && objweapon.basename == "iw9_cyberemp_mp") {
                attacker thread namespace_62c556437da28f50::scoreeventpopup(#"hash_381f16dd2b01c743");
                attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_8f7ff4d5395b6ac3");
            } else if (istrue(victim.isbombcarrier)) {
                victim.isbombcarrier = 0;
                if (istrue(victim.showempminimap)) {
                    victim hideminimap();
                }
                attacker thread namespace_62c556437da28f50::scoreeventpopup(#"hash_a019ba6fda76386");
                attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_2e0245db0447f036");
                thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "carrying");
            }
            if (attacker.pers["team"] == level.cyberemp.ownerteam && attacker != level.cyberemp.carrier) {
                var_db36f135f40e7940 = distancesquared(level.cyberemp.carrier.origin, var_86c1c8628b1d55f8);
                if (var_db36f135f40e7940 < 105625) {
                    attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
                    attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_2d96ced878338cd2");
                    attacker incpersstat("defends", 1);
                    attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
                    thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "defending");
                }
            }
        }
    }
    foreach (bombzone in level.objectives) {
        if (istrue(bombzone.trigger.trigger_off)) {
            continue;
        }
        ownerteam = bombzone namespace_19b4203b51d56488::getownerteam();
        if (ownerteam != attacker.team) {
            var_a3a2ce8b8e74ebef = distsquaredcheck(bombzone.trigger, var_86c1c8628b1d55f8, var_f7ded1fdb02a123d);
            if (var_a3a2ce8b8e74ebef) {
                var_8363beb01b537d3e = 1;
                attacker thread namespace_62c556437da28f50::scoreeventpopup(#"assault");
                attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_5a3b180273be47b1");
                bombzone notify("assault", attacker);
                thread utility::trycall(level.matchdata_logattackerkillevent, var_61b5d0250b328f00, "assaulting");
                continue;
            }
        } else {
            var_f6a091229a5e7b04 = distsquaredcheck(bombzone.trigger, var_86c1c8628b1d55f8, var_f7ded1fdb02a123d);
            if (var_f6a091229a5e7b04) {
                var_88f4967a49a22ed7 = 1;
                attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
                attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_2d96ced878338cd2");
                bombzone notify("defend", attacker);
                attacker incpersstat("defends", 1);
                attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
                thread utility::trycall(level.matchdata_logattackerkillevent, var_61b5d0250b328f00, "defending");
                continue;
            }
        }
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x61e8
// Size: 0xbe
function distsquaredcheck(trigger, var_86c1c8628b1d55f8, var_f7ded1fdb02a123d) {
    var_9ae8b00a8e8f64fa = distancesquared(trigger.origin, var_86c1c8628b1d55f8);
    var_1881a89c6f1e8775 = distancesquared(trigger.origin, var_f7ded1fdb02a123d);
    if (var_9ae8b00a8e8f64fa < 105625 || var_1881a89c6f1e8775 < 105625) {
        if (!isdefined(trigger.modifieddefendcheck)) {
            return 1;
        } else if (var_86c1c8628b1d55f8[2] - trigger.origin[2] < 100 || var_f7ded1fdb02a123d[2] - trigger.origin[2] < 100) {
            return 1;
        } else {
            return 0;
        }
    } else {
        return 0;
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x62ad
// Size: 0xa
function function_b47a96f58a61d923() {
    namespace_b919c4be206d3c80::function_edba1ee7c2375a5();
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x62be
// Size: 0x103
function empradarwatcher() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("bomb_planted");
    self endon("last_stand_start");
    self endon("emp_dropped");
    if (istrue(level.allowempweapon)) {
        thread weaponswapwatcher();
    }
    while (isdefined(level.cyberemp.carrier) && self == level.cyberemp.carrier) {
        waitframe();
        if (istrue(level.allowempweapon) && self.currentprimaryweapon.basename != "iw9_cyberemp_mp") {
            continue;
        }
        if (!isdefined(self.nextradarpingtime) || gettime() > self.nextradarpingtime) {
            if (istrue(level.allowempweapon)) {
                triggeroneoffradarsweep(self);
            } else {
                triggerportableradarping(self.origin, self, 1000);
            }
            self.nextradarpingtime = gettime() + level.radarpingtime * 1000;
        }
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x63c8
// Size: 0x87
function weaponswapwatcher() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("bomb_planted");
    self.showempminimap = 0;
    while (1) {
        if (self.currentprimaryweapon.basename == "iw9_cyberemp_mp") {
            if (!istrue(self.showempminimap)) {
                showminimap();
                self.showempminimap = 1;
            }
        } else if (istrue(self.showempminimap)) {
            hideminimap();
            self.showempminimap = 0;
        }
        waitframe();
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6456
// Size: 0xd2
function applybombcarrierclass() {
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
    self.pers["gamemodeLoadout"] = level.cyber_loadouts[self.team];
    namespace_add8ab90fc53d7f7::spawnpoint_setspawnpoint(self.origin, self.angles);
    self.gamemode_chosenclass = self.class;
    namespace_d19129e4fa5d176::function_a16868d4dcd81a4b();
    self notify("faux_spawn");
    self.gameobject_fauxspawn = 1;
    self.faux_spawn_stance = self getstance();
    thread namespace_99ac021a7547cae3::spawnplayer(1);
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x652f
// Size: 0xa3
function removebombcarrierclass() {
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
    self notify("lost_juggernaut");
    waitframe();
    self.pers["gamemodeLoadout"] = undefined;
    namespace_add8ab90fc53d7f7::spawnpoint_setspawnpoint(self.origin, self.angles);
    self notify("faux_spawn");
    self.faux_spawn_stance = self getstance();
    thread namespace_99ac021a7547cae3::spawnplayer(1);
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65d9
// Size: 0x2ac
function setcarriervisibility() {
    if (isdefined(level.showenemycarrier)) {
        switch (level.showenemycarrier) {
        case 0:
            level.cyberemp.objidpingfriendly = 1;
            level.cyberemp.objidpingenemy = 0;
            level.cyberemp.objpingdelay = 0;
            break;
        case 1:
            level.cyberemp.objidpingfriendly = 0;
            level.cyberemp.objidpingenemy = 0;
            level.cyberemp.objpingdelay = 0.05;
            break;
        case 2:
            level.cyberemp.objidpingfriendly = 1;
            level.cyberemp.objidpingenemy = 0;
            level.cyberemp.objpingdelay = 1;
            break;
        case 3:
            level.cyberemp.objidpingfriendly = 1;
            level.cyberemp.objidpingenemy = 0;
            level.cyberemp.objpingdelay = 1.5;
            break;
        case 4:
            level.cyberemp.objidpingfriendly = 1;
            level.cyberemp.objidpingenemy = 0;
            level.cyberemp.objpingdelay = 2;
            break;
        case 5:
            level.cyberemp.objidpingfriendly = 1;
            level.cyberemp.objidpingenemy = 0;
            level.cyberemp.objpingdelay = 3;
            break;
        case 6:
            level.cyberemp.objidpingfriendly = 1;
            level.cyberemp.objidpingenemy = 0;
            level.cyberemp.objpingdelay = 4;
            break;
        }
    } else {
        level.cyberemp.objidpingfriendly = 1;
        level.cyberemp.objidpingenemy = 0;
        level.cyberemp.objpingdelay = 3;
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x688c
// Size: 0xdf
function onexfilstarted() {
    level.cyberemp namespace_19b4203b51d56488::releaseid();
    if (isdefined(level.cyberemp.carrier)) {
        foreach (var_aedd764b7987a8b2 in level.objectives) {
            if (var_aedd764b7987a8b2.bombplanted == 0) {
                var_aedd764b7987a8b2.trigger disableplayeruse(level.cyberemp.carrier);
            }
        }
    }
    level.cyberemp.trigger delete();
    level.cyberemp.visuals[0] delete();
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6972
// Size: 0x219
function emplightsoff() {
    level endon("game_ended");
    level waittill("emp_detonated");
    while (1) {
        foreach (struct in level.emplights) {
            struct.switchstatus = "off";
            handleemponoff(struct);
        }
        wait(0.1);
        foreach (struct in level.emplights) {
            struct.switchstatus = "on";
            handleemponoff(struct);
        }
        wait(0.15);
        foreach (struct in level.emplights) {
            struct.switchstatus = "off";
            handleemponoff(struct);
        }
        wait(0.1);
        foreach (struct in level.emplights) {
            struct.switchstatus = "on";
            handleemponoff(struct, 0.05);
        }
        wait(0.5);
        foreach (struct in level.emplights) {
            struct.switchstatus = "off";
            handleemponoff(struct);
        }
        wait(10);
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b92
// Size: 0xe9
function destroytvs() {
    level endon("game_ended");
    level waittill("emp_detonated");
    tvs = getentarray("destructibleTVs", "script_noteworthy");
    foreach (tv in tvs) {
        var_fa10ca1040abb07 = getscriptablearray(tv.target, "targetname");
        foreach (var_be61e7030b1f3b80 in var_fa10ca1040abb07) {
            var_be61e7030b1f3b80 setscriptablepartstate("tv", "dead");
            waitframe();
        }
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6c82
// Size: 0x170
function handleemponoff(struct, var_38a6b48a5f70c0b8) {
    timedelay = 0.2;
    if (isdefined(var_38a6b48a5f70c0b8)) {
        timedelay = var_38a6b48a5f70c0b8;
    }
    if (struct.switchstatus == "on") {
        self notify("masterSwitch_on");
        if (!struct.lightson) {
            foreach (light in struct.lights) {
                light thread namespace_91812d9f6e7b8a2b::lightonroutine(randomfloat(timedelay));
            }
            thread namespace_91812d9f6e7b8a2b::onoffmodelswap(struct.models, "on");
            struct.lightson = 1;
        }
    } else if (struct.switchstatus == "off") {
        if (struct.lightson) {
            level namespace_91812d9f6e7b8a2b::lightoffroutine(struct.lights);
            thread namespace_91812d9f6e7b8a2b::onoffmodelswap(struct.models, "off");
            struct.lightson = 0;
        }
        if (isdefined(self.script_parameters) && self.script_parameters == "motion") {
            struct.switchstatus = "motion";
        }
        self notify("lights_off");
    }
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6df9
// Size: 0x19
function function_bf60004ce7bda1f8(player) {
    player setclientomnvar("ui_emp_carrier_hud", 0);
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e19
// Size: 0x157
function setupwaypointicons() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_emp", 2, "neutral", "MP_INGAME_ONLY/OBJ_EMP_CAPS", "hud_icon_cyber_bomb", 0, 10);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_escort_emp", 2, "friendly", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "hud_icon_cyber_bomb", 0, 10);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_defend_empsite", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_cyber_bombsite", 0, 3);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_target_empsite", 0, "enemy", "MP_INGAME_ONLY/OBJ_ATTACK_CAPS", "icon_waypoint_cyber_bombsite", 0, 3);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_planted_empsite", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_cyber_bombsite", 0, 4);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_defuse_empsite", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_cyber_bombsite", 0, 4);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_emp_planting", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_cyber_bombsite", 0, 3);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_emp_defusing", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_cyber_bombsite", 0, 4);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_defend_empsite_nt", 0, "friendly", "", "icon_waypoint_cyber_bombsite", 0, undefined);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_defuse_empsite_nt", 0, "enemy", "", "icon_waypoint_cyber_bombsite", 0, undefined);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("mlg_icon_waypoint_emp_planted", 0, "neutral", "", "icon_minimap_objective_codcaster_bomb", 0, undefined);
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f77
// Size: 0xb8
function function_8598880f9b913b55() {
    /#
        level endon("on");
        self notify("cyber_emp_plant");
        self endon("cyber_emp_plant");
        self endon("cyber_emp_pickup");
        wait(5);
        while (!level.bombplanted) {
            if (getdvarint(@"hash_28d1831203c6967b", 0) == 1) {
                if (isdefined(level.cyberemp.carrier)) {
                    level.cyberemp.carrier.carryobject thread namespace_19b4203b51d56488::setdropped();
                    setdevdvar(@"hash_28d1831203c6967b", 0);
                    break;
                }
            }
            wait(1);
        }
        if (level.bombplanted) {
            level waittill("plants");
        }
        thread function_8598880f9b913b55();
    #/
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7036
// Size: 0x24b
function function_847f04c317e266d() {
    /#
        level endon("on");
        self notify("MP/HOLD_TO_DEFUSE_EMP");
        self endon("MP/HOLD_TO_DEFUSE_EMP");
        self endon("cyber_emp_pickup");
        wait(5);
        while (!level.bombplanted) {
            if (getdvarint(@"hash_31674c76da07f46f", 0) == 1) {
                foreach (p in level.players) {
                    if (isreallyalive(p) && p.team == "target_destroyed") {
                        level.cyberemp.safeorigin = level.cyberemp.trigger.origin;
                        level.cyberemp.carrier = p;
                        level.objectives["death_or_disconnect"] [[ level.objectives["death_or_disconnect"].onuse ]](p);
                        setdevdvar(@"hash_31674c76da07f46f", 0);
                        break;
                    }
                }
            }
            if (getdvarint(@"hash_c65dbfe96fb1f3c4", 0) == 1) {
                foreach (p in level.players) {
                    if (isreallyalive(p) && p.team == "death_or_disconnect") {
                        level.cyberemp.safeorigin = level.cyberemp.trigger.origin;
                        level.cyberemp.carrier = p;
                        level.objectives["target_destroyed"] [[ level.objectives["target_destroyed"].onuse ]](p);
                        setdevdvar(@"hash_c65dbfe96fb1f3c4", 0);
                        break;
                    }
                }
            }
            wait(1);
        }
        level waittill("plants");
        thread function_847f04c317e266d();
    #/
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7288
// Size: 0x1bf
function function_a60e39eb7d5bd5f4() {
    /#
        level endon("on");
        self notify("tie");
        self endon("tie");
        self endon("cyber_emp_pickup");
        wait(5);
        while (level.bombplanted) {
            if (getdvarint(@"hash_18728111915eef48", 0) == 1) {
                foreach (p in level.players) {
                    if (isreallyalive(p) && p.team == "target_destroyed") {
                        level.objectives["target_destroyed"] [[ level.objectives["target_destroyed"].onuse ]](p);
                        setdevdvar(@"hash_18728111915eef48", 0);
                        break;
                    }
                }
            }
            if (getdvarint(@"hash_af011dbf40cf4773", 0) == 1) {
                foreach (p in level.players) {
                    if (isreallyalive(p) && p.team == "death_or_disconnect") {
                        level.objectives["death_or_disconnect"] [[ level.objectives["death_or_disconnect"].onuse ]](p);
                        setdevdvar(@"hash_af011dbf40cf4773", 0);
                        break;
                    }
                }
            }
            wait(1);
        }
        level waittill("last_stand_start");
        thread function_a60e39eb7d5bd5f4();
    #/
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x744e
// Size: 0x167
function function_4df61dc99c28632b() {
    /#
        level endon("on");
        wait(1);
        team = "target_destroyed";
        while (getdvarint(@"hash_d51785ab78729b60", 0) == 1) {
            explosionorigin = level.objectives[team].visuals[0] gettagorigin("MP_INGAME_ONLY/OBJ_EMP_CAPS");
            level.objectives[team].visuals[0] radiusdamage(explosionorigin, 512, 1, 1, undefined, "<unknown string>", "<unknown string>");
            playsoundatpos(explosionorigin, "<unknown string>");
            rot = randomfloat(360);
            explosioneffect = spawnfx(level._effect["<unknown string>"], explosionorigin + (0, 0, 50), (0, 0, 1), (cos(rot), sin(rot), 0));
            triggerfx(explosioneffect);
            playrumbleonposition("<unknown string>", explosionorigin);
            earthquake(0.6, 1.5, explosionorigin, 10000);
            level thread empjamandrumbleclients(1);
            if (game["<unknown string>"]) {
                exploderindex = 200;
            } else {
                exploderindex = 201;
            }
            if (isdefined(exploderindex)) {
                exploder(exploderindex);
            }
            wait(5);
        }
        wait(1);
        thread function_4df61dc99c28632b();
    #/
}

// Namespace cyber/namespace_5d8d5ae44462641f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x75bc
// Size: 0x167
function function_68dd1d69fdeeff68() {
    /#
        level endon("on");
        wait(1);
        team = "death_or_disconnect";
        while (getdvarint(@"hash_4d5720fef87ec87b", 0) == 1) {
            explosionorigin = level.objectives[team].visuals[0] gettagorigin("MP_INGAME_ONLY/OBJ_EMP_CAPS");
            level.objectives[team].visuals[0] radiusdamage(explosionorigin, 512, 1, 1, undefined, "<unknown string>", "<unknown string>");
            playsoundatpos(explosionorigin, "<unknown string>");
            rot = randomfloat(360);
            explosioneffect = spawnfx(level._effect["<unknown string>"], explosionorigin + (0, 0, 50), (0, 0, 1), (cos(rot), sin(rot), 0));
            triggerfx(explosioneffect);
            playrumbleonposition("<unknown string>", explosionorigin);
            earthquake(0.6, 1.5, explosionorigin, 10000);
            level thread empjamandrumbleclients(1);
            if (game["<unknown string>"]) {
                exploderindex = 201;
            } else {
                exploderindex = 200;
            }
            if (isdefined(exploderindex)) {
                exploder(exploderindex);
            }
            wait(5);
        }
        wait(1);
        thread function_68dd1d69fdeeff68();
    #/
}

