// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\obj_bombzone.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\hostmigration.gsc;

#namespace dd;

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc01
// Size: 0x411
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    allowed[1] = "dd_bombzone";
    allowed[2] = "blocker";
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 1, 0, 9);
        registertimelimitdvar(getgametype(), 180);
        registerscorelimitdvar(getgametype(), 0);
        registerroundlimitdvar(getgametype(), 3);
        registerwinlimitdvar(getgametype(), 2);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        setovertimelimitdvar(180);
    }
    updategametypedvars();
    level.objectivebased = 1;
    level.teambased = 1;
    level.onprecachegametype = &onprecachegametype;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.modeonspawnplayer = &onspawnplayer;
    level.ondeadevent = &ondeadevent;
    level.ontimelimit = &ontimelimit;
    level.onnormaldeath = &onnormaldeath;
    level.gamemodemaydropweapon = &isplayeroutsideofanybombsite;
    level.resetuiomnvargamemode = &namespace_fa795886dfc5f58a::resetuiomnvargamemode;
    level.dd = 1;
    level.bombsplanted = 0;
    level.ddbombmodel = [];
    level.aplanted = 0;
    level.bplanted = 0;
    namespace_fa795886dfc5f58a::setbombtimeromnvars();
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "iw9_mpdd_mode_uktl_ddt1";
    } else {
        game["dialog"]["gametype"] = "gametype_demo";
    }
    game["dialog"]["gametype"] = "gametype_demo";
    if (getdvarint(@"hash_4a2b3d01a81655a6")) {
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    } else if (getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_promode"))) {
        game["dialog"]["gametype"] = game["dialog"]["gametype"] + "_pro";
    }
    game["dialog"]["bomb_achieve"] = "bomb_achieve";
    game["dialog"]["bomb_taken"] = "bomb_taken";
    game["dialog"]["bomb_lost"] = "bomb_enemyowns";
    game["dialog"]["bomb_defused"] = "bomb_defused";
    game["dialog"]["bomb_planted"] = "bomb_planted";
    game["dialog"]["enemy_bomb_a"] = "bomb_enemy_a";
    game["dialog"]["enemy_bomb_b"] = "bomb_enemy_b";
    game["dialog"]["enemy_bomb_defused"] = "bomb_enemydefused";
    game["dialog"]["enemy_bomb_planted"] = "bomb_enemyplanted";
    game["dialog"]["bomb_planting"] = "bomb_planting";
    game["dialog"]["bomb_planting_a"] = "bomb_planting_a";
    game["dialog"]["bomb_planting_b"] = "bomb_planting_b";
    game["dialog"]["bomb_destroyed_en"] = "objective_destroyed";
    if (!isdefined(game["roundsPlayed"])) {
        var_4edd1486c09dbedb = "boost_demoattack";
        var_576426d0d8b57b = "boost_demodefend";
    } else if (game["roundsPlayed"] == 2) {
        var_4edd1486c09dbedb = "boost_demo_ot";
        var_576426d0d8b57b = "boost_demo_ot";
    } else {
        var_4edd1486c09dbedb = "boost_demoattack_short";
        var_576426d0d8b57b = "boost_demodefend_short";
    }
    game["dialog"]["offense_obj"] = var_4edd1486c09dbedb;
    game["dialog"]["defense_obj"] = var_576426d0d8b57b;
    return isdefined(game["status"]) && game["status"] == "overtime";
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1074
// Size: 0xeb
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_8851eccfcb6cbd95", getmatchrulesdata("bombData", "bombTimer"));
    setdynamicdvar(@"hash_ba0a2161e1a0d920", getmatchrulesdata("bombData", "plantTime"));
    setdynamicdvar(@"hash_5b309742f9cbd98b", getmatchrulesdata("bombData", "defuseTime"));
    setdynamicdvar(@"hash_ba454753d970e1aa", getmatchrulesdata("bombData", "silentPlant"));
    setdynamicdvar(@"hash_ad7b476595b0c3b3", getmatchrulesdata("demData", "extraTime"));
    setdynamicdvar(@"hash_da793e325bd82aa", getmatchrulesdata("demData", "overtimeLimit"));
    setdynamicdvar(@"hash_6d1378f0e89dc70c", 0);
    registerhalftimedvar("dd", 0);
    setdynamicdvar(@"hash_def21766b9ba47a8", 0);
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1166
// Size: 0x1d
function onprecachegametype() {
    game["bomb_dropped_sound"] = "iw9_mp_ui_objective_lost";
    game["bomb_recovered_sound"] = "iw9_mp_ui_objective_taken";
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x118a
// Size: 0x221
function onstartgametype() {
    setomnvar("ui_victory_condition_completed", 0);
    if (game["roundsPlayed"] == 2) {
        game["status"] = "overtime";
        setdvar(@"hash_caa6faec79f2c4c2", 1);
    }
    if (inovertime()) {
        setomnvar("ui_round_hint_override_attackers", 1);
        setomnvar("ui_round_hint_override_defenders", 1);
    }
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    level.usestartspawns = 1;
    setclientnamemode("manual_change");
    if (inovertime()) {
        game["dialog"]["defense_obj"] = "obj_destroy";
    }
    level._effect["bomb_explosion"] = loadfx("vfx/iw9/dmz/bombsite/vfx_dmz_bombsite_expl.vfx");
    level._effect["vehicle_explosion"] = loadfx("vfx/core/expl/small_vehicle_explosion_new.vfx");
    level._effect["building_explosion"] = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
    setobjectivetext(game["attackers"], "OBJECTIVES/DD_ATTACKER");
    setobjectivetext(game["defenders"], "OBJECTIVES/DD_DEFENDER");
    if (level.splitscreen) {
        setobjectivescoretext(game["attackers"], "OBJECTIVES/DD_ATTACKER");
        setobjectivescoretext(game["defenders"], "OBJECTIVES/DD_DEFENDER");
    } else {
        setobjectivescoretext(game["attackers"], "OBJECTIVES/DD_ATTACKER_SCORE");
        setobjectivescoretext(game["defenders"], "OBJECTIVES/DD_DEFENDER_SCORE");
    }
    if (inovertime()) {
        setobjectivehinttext(game["attackers"], "OBJECTIVES/DD_OVERTIME_HINT");
        setobjectivehinttext(game["defenders"], "OBJECTIVES/DD_OVERTIME_HINT");
    } else {
        setobjectivehinttext(game["attackers"], "OBJECTIVES/DD_ATTACKER_HINT");
        setobjectivehinttext(game["defenders"], "OBJECTIVES/DD_DEFENDER_HINT");
    }
    thread waittoprocess();
    setupobjectiveicons();
    thread bombs();
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b2
// Size: 0x44d
function initspawns() {
    if (spawnlogic::function_bff229a11ecd1e34()) {
        spawnlogic::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Default");
    }
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_dd_spawn_attacker_start");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_dd_spawn_defender_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_dd_spawn_attacker_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_dd_spawn_defender_start");
    attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dd_spawn_attacker_start");
    defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dd_spawn_defender_start");
    namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
    namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_dd_spawn_defender");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_dd_spawn_defender_a", 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_dd_spawn_defender_b", 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_dd_spawn_attacker");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_dd_spawn_attacker_a", 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_dd_spawn_attacker_b", 1);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    if (istrue(level.adjustshipmentspawns)) {
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
        var_3c9c79460e7aee38 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
        var_3d83bc62b320d11a = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_secondary");
        namespace_b2d5aa2baf2b5701::registerspawnset("normal", var_3c9c79460e7aee38);
        namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3d83bc62b320d11a);
        return;
    }
    level.spawn_defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dd_spawn_defender");
    namespace_b2d5aa2baf2b5701::registerspawnset("dd_defenders", level.spawn_defenders);
    level.spawn_defenders_a = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dd_spawn_defender_a");
    level.spawn_defenders_a = array_combine(level.spawn_defenders, level.spawn_defenders_a);
    namespace_b2d5aa2baf2b5701::registerspawnset("dd_defenders_a", level.spawn_defenders_a);
    level.spawn_defenders_b = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dd_spawn_defender_b");
    level.spawn_defenders_b = array_combine(level.spawn_defenders, level.spawn_defenders_b);
    namespace_b2d5aa2baf2b5701::registerspawnset("dd_defenders_b", level.spawn_defenders_b);
    level.spawn_defenders_fallback = array_combine(level.spawn_defenders, level.spawn_defenders_a, level.spawn_defenders_b);
    namespace_b2d5aa2baf2b5701::registerspawnset("dd_defenders_fallback", level.spawn_defenders_fallback);
    level.spawn_attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dd_spawn_attacker");
    namespace_b2d5aa2baf2b5701::registerspawnset("dd_attackers", level.spawn_attackers);
    level.spawn_attackers_a = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dd_spawn_attacker_a");
    level.spawn_attackers_a = array_combine(level.spawn_attackers, level.spawn_attackers_a);
    namespace_b2d5aa2baf2b5701::registerspawnset("dd_attackers_a", level.spawn_attackers_a);
    level.spawn_attackers_b = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dd_spawn_attacker_b");
    level.spawn_attackers_b = array_combine(level.spawn_attackers, level.spawn_attackers_b);
    namespace_b2d5aa2baf2b5701::registerspawnset("dd_attackers_b", level.spawn_attackers_b);
    level.spawn_attackers_fallback = array_combine(level.spawn_attackers, level.spawn_attackers_a, level.spawn_attackers_b);
    namespace_b2d5aa2baf2b5701::registerspawnset("dd_attackers_fallback", level.spawn_attackers_fallback);
    level.spawn_defenders_start = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dd_spawn_defender_start");
    level.spawn_attackers_start = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dd_spawn_attacker_start");
}

// Namespace dd/namespace_d2068cf223870afe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1806
// Size: 0x4d
function getspawnpointdist(spawnpoint, goalpos) {
    dist = getpathdist(spawnpoint.origin, goalpos, 16000);
    if (dist < 0) {
        dist = distance(spawnpoint.origin, goalpos);
    }
    return dist;
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x185b
// Size: 0x29
function waittoprocess() {
    level endon("game_end");
    for (;;) {
        for (;;) {
            if (level.ingraceperiod == 0) {
                break;
            }
        }
    }
    level.usestartspawns = 0;
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x188b
// Size: 0x257
function getspawnpoint() {
    spawnteam = self.pers["team"];
    if (istrue(level.adjustshipmentspawns)) {
        if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
            if (spawnteam == game["attackers"]) {
                namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
                spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers");
            } else {
                namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
                spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders");
            }
        } else {
            namespace_b2d5aa2baf2b5701::activatespawnset("normal", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "fallback");
        }
    } else if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        if (spawnteam == game["attackers"]) {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers");
        } else {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders");
        }
    } else {
        spawnset = undefined;
        fallbackspawnset = undefined;
        if (spawnteam == game["attackers"]) {
            if (inovertime()) {
                spawnset = "dd_attackers";
            } else if (!level.aplanted && !level.bplanted) {
                spawnset = "dd_attackers";
            } else if (level.aplanted && !level.bplanted) {
                spawnset = "dd_attackers_a";
            } else if (level.bplanted && !level.aplanted) {
                spawnset = "dd_attackers_b";
            } else {
                spawnset = "dd_attackers";
            }
            fallbackspawnset = "dd_attackers_fallback";
        } else {
            if (inovertime()) {
                spawnset = "dd_defenders";
            } else if (!level.aplanted && !level.bplanted) {
                spawnset = "dd_defenders";
            } else if (level.aplanted && !level.bplanted) {
                spawnset = "dd_defenders_a";
            } else if (level.bplanted && !level.aplanted) {
                spawnset = "dd_defenders_b";
            } else {
                spawnset = "dd_defenders";
            }
            fallbackspawnset = "dd_defenders_fallback";
        }
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, spawnset, fallbackspawnset);
    }
    /#
        assert(isdefined(spawnpoint));
    #/
    return spawnpoint;
}

// Namespace dd/namespace_d2068cf223870afe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aea
// Size: 0xf9
function onspawnplayer(var_9156b53bcf7ce573) {
    var_887d0c63ad49a9d4 = getbombteam();
    if (inovertime() || self.pers["team"] == var_887d0c63ad49a9d4) {
        self setclientomnvar("ui_carrying_bomb", 1);
        self.isplanting = 0;
        self.isdefusing = 0;
        self.isbombcarrier = 1;
    } else {
        self.isplanting = 0;
        self.isdefusing = 0;
        self.isbombcarrier = 0;
    }
    if (isdefined(self.pers["plants"])) {
        setextrascore0(self.pers["plants"]);
    } else {
        setextrascore0(0);
    }
    if (isdefined(self.pers["defuses"])) {
        setextrascore1(self.pers["defuses"]);
    } else {
        setextrascore1(0);
    }
    level notify("spawned_player");
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bea
// Size: 0x47
function getbombteam() {
    var_887d0c63ad49a9d4 = game["attackers"];
    if (level.mapname == "mp_euphrates") {
        if (game["switchedsides"]) {
            var_887d0c63ad49a9d4 = game["attackers"];
        } else {
            var_887d0c63ad49a9d4 = game["defenders"];
        }
    }
    return var_887d0c63ad49a9d4;
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c39
// Size: 0x34
function hidecarryiconongameend() {
    self endon("disconnect");
    level waittill("game_ended");
    if (isdefined(self.carryicon)) {
        self.carryicon.alpha = 0;
    }
}

// Namespace dd/namespace_d2068cf223870afe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c74
// Size: 0x2a
function dd_endgame(winningteam, endreasontext) {
    setomnvar("ui_bomb_interacting", 0);
    thread namespace_d576b6dc7cef9c62::endgame(winningteam, endreasontext);
}

// Namespace dd/namespace_d2068cf223870afe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca5
// Size: 0x118
function ondeadevent(team) {
    if (level.bombexploded > 0 || level.bombdefused) {
        return;
    }
    if (team == "all") {
        if (level.bombplanted) {
            dd_endgame(game["attackers"], game["end_reason"][tolower(game[game["defenders"]]) + "_eliminated"]);
        } else {
            dd_endgame(game["defenders"], game["end_reason"][tolower(game[game["attackers"]]) + "_eliminated"]);
        }
    } else if (team == game["attackers"]) {
        if (level.bombplanted) {
            return;
        }
        level thread dd_endgame(game["defenders"], game["end_reason"][tolower(game[game["attackers"]]) + "_eliminated"]);
    } else if (team == game["defenders"]) {
        level thread dd_endgame(game["attackers"], game["end_reason"][tolower(game[game["defenders"]]) + "_eliminated"]);
    }
}

// Namespace dd/namespace_d2068cf223870afe
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc4
// Size: 0x113
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    team = victim.team;
    if (victim.isplanting) {
        thread utility::trycall(level.matchdata_logvictimkillevent, lifeid, "planting");
        attacker incpersstat("defends", 1);
        attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
    } else if (victim.isdefusing) {
        thread utility::trycall(level.matchdata_logvictimkillevent, lifeid, "defusing");
        attacker incpersstat("defends", 1);
        attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
    }
    namespace_fa795886dfc5f58a::bombzone_awardgenericbombzonemedals(attacker, victim);
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ede
// Size: 0x43
function ontimelimit() {
    if (inovertime()) {
        dd_endgame("tie", game["end_reason"]["time_limit_reached"]);
    } else {
        dd_endgame(game["defenders"], game["end_reason"]["time_limit_reached"]);
    }
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f28
// Size: 0xcb
function updategametypedvars() {
    updatecommongametypedvars();
    level.planttime = dvarfloatvalue("planttime", 5, 0, 20);
    level.defusetime = dvarfloatvalue("defusetime", 5, 0, 20);
    level.bombtimer = dvarintvalue("bombtimer", 45, 1, 300);
    level.ddtimetoadd = dvarfloatvalue("extraTime", 120, 0, 500);
    level.overtime = dvarfloatvalue("overtimeLimit", 1, 0, 180);
    level.resetprogress = dvarintvalue("resetProgress", 1, 0, 1);
    setovertimelimitdvar(level.overtime);
    level.silentplant = dvarintvalue("silentPlant", 0, 0, 1);
}

// Namespace dd/namespace_d2068cf223870afe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ffa
// Size: 0x144
function verifybombzones(bombzones) {
    missing = "";
    if (bombzones.size != 3) {
        var_8ab8cdaa16d825ee = 0;
        var_8ab8ccaa16d823bb = 0;
        var_8ab8cbaa16d82188 = 0;
        foreach (bombzone in bombzones) {
            if (issubstr(tolower(bombzone.script_label), "a")) {
                var_8ab8cdaa16d825ee = 1;
            } else if (issubstr(tolower(bombzone.script_label), "b")) {
                var_8ab8ccaa16d823bb = 1;
            } else if (issubstr(tolower(bombzone.script_label), "c")) {
                var_8ab8cbaa16d82188 = 1;
            }
        }
        if (!var_8ab8cdaa16d825ee) {
            missing = missing + " A ";
        }
        if (!var_8ab8ccaa16d823bb) {
            missing = missing + " B ";
        }
        if (!var_8ab8cbaa16d82188) {
            missing = missing + " C ";
        }
    }
    if (missing != "") {
        /#
            assertmsg("Bombzones:" + missing + "missing.");
        #/
    }
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2145
// Size: 0x1dc
function bombs() {
    waittillframeend();
    level.bombplanted = 0;
    level.bombdefused = 0;
    level.bombexploded = 0;
    level.multibomb = 1;
    triggers = getentarray("dd_bombzone", "targetname");
    verifybombzones(triggers);
    level.objectives = [];
    foreach (trigger in triggers) {
        /#
            if (isdefined(level.var_904de0754f390c72)) {
                level thread [[ level.var_904de0754f390c72 ]](trigger.script_label, trigger);
            }
        #/
        bombzone = namespace_fa795886dfc5f58a::setupobjective(trigger, 1);
        if (isdefined(bombzone)) {
            bombzone.onbeginuse = &onbeginuse;
            bombzone.onenduse = &onenduse;
            bombzone.onuse = &onuseplantobject;
            level.objectives[bombzone.objectivekey] = bombzone;
        }
    }
    initspawns();
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level waittill_any_2("prematch_done", "start_mode_setup");
    }
    foreach (bombzone in level.objectives) {
        bombzone namespace_19b4203b51d56488::requestid(1, 1);
        if (inovertime()) {
            bombzone namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_target_neutral");
        } else {
            bombzone namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_target");
        }
        bombzone namespace_19b4203b51d56488::setvisibleteam("any");
    }
}

// Namespace dd/namespace_d2068cf223870afe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2328
// Size: 0x14
function onbeginuse(player) {
    namespace_fa795886dfc5f58a::bombzone_onbeginuse(player);
}

// Namespace dd/namespace_d2068cf223870afe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2343
// Size: 0x26
function onenduse(team, player, result) {
    namespace_fa795886dfc5f58a::bombzone_onenduse(team, player, result);
}

// Namespace dd/namespace_d2068cf223870afe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2370
// Size: 0x79
function onuseplantobject(player) {
    var_4725e52b7c3aa25c = [];
    var_4725e52b7c3aa25c[var_4725e52b7c3aa25c.size] = player;
    level thread namespace_44abc05161e2e2cb::notifyteam("emp_planted", "emp_planted_enemy", player.team, var_4725e52b7c3aa25c);
    player thread namespace_44abc05161e2e2cb::showsplash("emp_planted", namespace_62c556437da28f50::getscoreinfovalue(#"plant"));
    namespace_fa795886dfc5f58a::bombzone_onuseplantobject(player);
    if (level.bombexploded == 1) {
        thread namespace_3bde6869e44a2770::bombplanted_music();
    }
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23f0
// Size: 0x103
function setupkillcament() {
    var_27ba39cb4da36c7 = spawn("script_origin", self.origin);
    var_27ba39cb4da36c7.angles = self.angles;
    var_27ba39cb4da36c7 rotateyaw(-45, 0.05);
    waitframe();
    var_b44cefcf38b5da97 = self.origin + (0, 0, 5);
    var_dfdbe7c0c9dca192 = self.origin + anglestoforward(var_27ba39cb4da36c7.angles) * 100 + (0, 0, 128);
    result = namespace_2a184fc4902783dc::ray_trace(var_b44cefcf38b5da97, var_dfdbe7c0c9dca192, self, namespace_2a184fc4902783dc::create_default_contents(1));
    self.killcament = spawn("script_model", result["position"]);
    self.killcament setscriptmoverkillcam("explosive");
    var_27ba39cb4da36c7 delete();
    /#
        self.killcament thread function_db3df42ecd416b38(self);
    #/
}

// Namespace dd/namespace_d2068cf223870afe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24fa
// Size: 0x1d1
function function_db3df42ecd416b38(visual) {
    /#
        self endon("bomb_destroyed_en");
        level endon("boost_demodefend_short");
        visual endon("bomb_destroyed_en");
        while (1) {
            if (getdvarint(@"hash_98151d926a0bebbf") > 0) {
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

// Namespace dd/namespace_d2068cf223870afe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26d2
// Size: 0xae
function resetbombzone(player) {
    if (inovertime()) {
        namespace_19b4203b51d56488::setownerteam("neutral");
        namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_target");
    } else {
        namespace_19b4203b51d56488::setownerteam(game["defenders"]);
        namespace_19b4203b51d56488::allowuse("enemy");
        namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_target");
    }
    namespace_19b4203b51d56488::setusehinttext("MP/HOLD_TO_PLANT_EXPLOSIVES");
    self.id = "bomb_zone";
    namespace_19b4203b51d56488::setusetime(level.planttime);
    namespace_19b4203b51d56488::setvisibleteam("any");
    self.useweapon = makeweapon("briefcase_bomb_mp");
    self.bombexploded = undefined;
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2787
// Size: 0x44
function setupfordefusing() {
    namespace_19b4203b51d56488::allowuse("friendly");
    namespace_19b4203b51d56488::setusetime(level.defusetime);
    namespace_19b4203b51d56488::setkeyobject(undefined);
    namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defuse", "waypoint_defend");
    namespace_19b4203b51d56488::setvisibleteam("any");
}

// Namespace dd/namespace_d2068cf223870afe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27d2
// Size: 0x18
function oncantuse(player) {
    player iprintlnbold("MP/BOMBSITE_IN_USE");
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27f1
// Size: 0x3
function onreset() {
    
}

// Namespace dd/namespace_d2068cf223870afe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x27fb
// Size: 0x15b
function bombplanted(destroyedobj, player) {
    destroyedobj endon("defused");
    playerteam = player.team;
    level.bombsplanted = level.bombsplanted + 1;
    namespace_d576b6dc7cef9c62::pausetimer();
    level.timepausestart = gettime();
    level.timelimitoverride = 1;
    level.bombplanted = 1;
    level.destroyedobject = destroyedobj;
    if (level.destroyedobject.objectivekey == "_a") {
        level.aplanted = 1;
    } else {
        level.bplanted = 1;
    }
    level.destroyedobject.bombplanted = 1;
    level.tickingobject = destroyedobj.visuals[0];
    dropbombmodel(player, destroyedobj.objectivekey);
    destroyedobj.bombdefused = 0;
    destroyedobj namespace_19b4203b51d56488::allowuse("none");
    destroyedobj namespace_19b4203b51d56488::setvisibleteam("none");
    if (inovertime()) {
        destroyedobj namespace_19b4203b51d56488::setownerteam(getotherteam(player.team)[0]);
    }
    destroyedobj setupfordefusing();
    destroyedobj bombtimerwait(destroyedobj);
    destroyedobj thread bombhandler(player, "explode", playerteam);
}

// Namespace dd/namespace_d2068cf223870afe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x295d
// Size: 0x1dc
function bombhandler(player, var_68b7e26f25ca1151, playerteam) {
    level.bombsplanted = level.bombsplanted - 1;
    if (self.objectivekey == "_a") {
        level.aplanted = 0;
    } else {
        level.bplanted = 0;
    }
    restarttimer();
    namespace_fa795886dfc5f58a::setbombtimeromnvars();
    if (level.gameended) {
        return;
    }
    if (var_68b7e26f25ca1151 == "explode") {
        self.bombexploded = 1;
        timelimit = getwatcheddvar("timelimit");
        if (timelimit != 0 && !inovertime() && level.bombexploded < 2 && level.ddtimetoadd > 0) {
            level.extratime = level.bombexploded * level.ddtimetoadd;
            timeleft = namespace_d576b6dc7cef9c62::gettimeremaining();
            if (istrue(level.timerstoppedforgamemode)) {
                timeleft = timeleft - level.bombtimer * 1000;
            }
            setgameendtime(gettime() + int(timeleft));
        }
        wait(2);
        if (inovertime() || level.bombexploded > 1) {
            if (istrue(level.nukeinfo.incoming)) {
                return;
            }
            dd_endgame(playerteam, game["end_reason"]["target_destroyed"]);
        } else if (level.ddtimetoadd > 0) {
            namespace_944ddf7b8df1b0e3::statusdialog("bomb_destroyed_en", game["defenders"]);
            level thread namespace_44abc05161e2e2cb::notifyteam("callout_time_added", "callout_time_added", player.team);
        }
    } else {
        player notify("bomb_defused" + self.objectivekey);
        self notify("defused");
        resetbombzone(player);
    }
}

// Namespace dd/namespace_d2068cf223870afe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b40
// Size: 0x105
function dropbombmodel(player, site) {
    trace = namespace_2a184fc4902783dc::ray_trace(player.origin + (0, 0, 20), player.origin - (0, 0, 2000), player, namespace_2a184fc4902783dc::create_default_contents(1));
    tempangle = randomfloat(360);
    forward = (cos(tempangle), sin(tempangle), 0);
    forward = vectornormalize(forward - trace["normal"] * vectordot(forward, trace["normal"]));
    dropangles = vectortoangles(forward);
    level.ddbombmodel[site] = spawn("script_model", trace["position"]);
    level.ddbombmodel[site].angles = dropangles;
    level.ddbombmodel[site] setmodel("prop_suitcase_bomb");
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c4c
// Size: 0x66
function restarttimer() {
    if (inovertime()) {
        if (level.bombexploded == 1) {
            return;
        }
    } else if (level.bombexploded > 1) {
        return;
    }
    if (level.bombsplanted <= 0) {
        namespace_d576b6dc7cef9c62::resumetimer();
        level.timepaused = gettime() - level.timepausestart;
        level.timelimitoverride = 0;
    }
}

// Namespace dd/namespace_d2068cf223870afe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cb9
// Size: 0x9f
function bombtimerwait(var_5ac945a5ed78e00c) {
    level endon("game_ended");
    level endon("bomb_defused" + var_5ac945a5ed78e00c.objectivekey);
    if (inovertime()) {
        var_5ac945a5ed78e00c.waittime = level.bombtimer;
    } else {
        var_5ac945a5ed78e00c.waittime = level.bombtimer;
    }
    level thread update_ui_timers(var_5ac945a5ed78e00c);
    while (var_5ac945a5ed78e00c.waittime >= 0) {
        var_5ac945a5ed78e00c.waittime--;
        if (var_5ac945a5ed78e00c.waittime >= 0) {
            wait(1);
        }
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
    }
}

// Namespace dd/namespace_d2068cf223870afe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d5f
// Size: 0xc1
function update_ui_timers(var_5ac945a5ed78e00c) {
    level endon("game_ended");
    level endon("disconnect");
    level endon("bomb_defused" + var_5ac945a5ed78e00c.objectivekey);
    level endon("bomb_exploded" + var_5ac945a5ed78e00c.objectivekey);
    var_4dfaa92e2bce1194 = var_5ac945a5ed78e00c.waittime * 1000 + gettime();
    setdvar(function_2ef675c13ca1c4af(@"hash_b6224ab79b658c2", var_5ac945a5ed78e00c.objectivekey), var_4dfaa92e2bce1194);
    level waittill("host_migration_begin");
    timepassed = namespace_e323c8674b44c8f4::waittillhostmigrationdone();
    if (timepassed > 0) {
        setdvar(function_2ef675c13ca1c4af(@"hash_b6224ab79b658c2", var_5ac945a5ed78e00c.objectivekey), var_4dfaa92e2bce1194 + timepassed);
    }
}

// Namespace dd/namespace_d2068cf223870afe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e27
// Size: 0x3e
function bombdefused(var_530b0cc4b4365bc4) {
    level.tickingobject namespace_d576b6dc7cef9c62::stoptickingsound();
    var_530b0cc4b4365bc4.bombdefused = 1;
    level notify("bomb_defused" + var_530b0cc4b4365bc4.objectivekey);
}

// Namespace dd/namespace_d2068cf223870afe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e6c
// Size: 0x108
function setupobjectiveicons() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_target_neutral_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_a", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defuse_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_a", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defuse_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_b", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bomb_defend_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_a", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bomb_defend_b", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_b", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defuse_nt_a", 0, "enemy", "", "icon_waypoint_dom_a", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defuse_nt_b", 0, "enemy", "", "icon_waypoint_dom_b", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bomb_defend_nt_a", 0, "friendly", "", "icon_waypoint_dom_a", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bomb_defend_nt_b", 0, "friendly", "", "icon_waypoint_dom_b", 0);
}

