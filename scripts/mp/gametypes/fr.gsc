// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using script_60b33963be93ae9d;
#using script_392e29d6a9a83091;
#using script_41387eecc35b88bf;
#using script_2707474774db34b;
#using script_6617e2f2bb62b52b;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using script_18c2fb8b3f85c7cd;
#using scripts\mp\gametypes\bradley_spawner.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace fr;

// Namespace fr / scripts/mp/gametypes/fr
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ca
// Size: 0x1e9
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    scripts/mp/globallogic::init();
    scripts/mp/globallogic::setupcallbacks();
    allowed[0] = getgametype();
    scripts/mp/gameobjects::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 9);
        registertimelimitdvar(getgametype(), 600);
        registerscorelimitdvar(getgametype(), 75);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    updategametypedvars();
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.modeonspawnplayer = &onspawnplayer;
    level.onplayerkilled = &onplayerkilled;
    game["dialog"]["gametype"] = "gametype_tdm";
    game["dialog"]["boost"] = "boost_tdm";
    game["dialog"]["offense_obj"] = "boost_tdm";
    game["dialog"]["defense_obj"] = "boost_tdm";
    if (matchmakinggame()) {
        level.shouldgamelobbyremainintact = &shouldgamelobbyremainintact;
    }
    /#
        level.reinitspawns = &reinitspawns;
    #/
    function_b2ab8303e71ffcf4();
    function_6154a7fa500ffdc6();
    function_d6a9e7094f78672e();
    namespace_236d5e32d01e927d::function_70b0f5c75f974eff();
    if (getdvarint(@"hash_3a0783f0e1830d67", 0)) {
        namespace_3a7aeee21b004e1b::function_6f8c89f8f7dd3cc1();
        function_6a2fd0869da15e06("test_0");
    }
}

// Namespace fr / scripts/mp/gametypes/fr
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ba
// Size: 0xa
function function_d6a9e7094f78672e() {
    function_89929df8c53338f7();
}

// Namespace fr / scripts/mp/gametypes/fr
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cb
// Size: 0x38
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_6e7da31aae47b8e0", 0);
    registerhalftimedvar(getgametype(), 0);
    setdynamicdvar(@"hash_bb6e8f8d9be104f4", 0);
}

// Namespace fr / scripts/mp/gametypes/fr
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50a
// Size: 0x13a
function onstartgametype() {
    setclientnamemode("auto_change");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/WAR");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/WAR");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/WAR_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/WAR_HINT");
    }
    if (isdefined(level.initspawnsoverridefunc)) {
        [[ level.initspawnsoverridefunc ]]();
    } else {
        initspawns();
    }
    scripts/mp/gametypes/bradley_spawner::inittankspawns();
    if (getdvarint(@"hash_3a0783f0e1830d67", 0)) {
        function_d1a0788290216f08("test_0");
    }
}

// Namespace fr / scripts/mp/gametypes/fr
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x64b
// Size: 0xa
function updategametypedvars() {
    scripts/mp/gametypes/common::updatecommongametypedvars();
}

// Namespace fr / scripts/mp/gametypes/fr
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65c
// Size: 0x1c3
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        scripts/mp/spawnlogic::setactivespawnlogic(#"default");
    } else if (isdefined(scripts/cp_mp/utility/game_utility::getlocaleid())) {
        scripts/mp/spawnlogic::setactivespawnlogic("BigTDM", "Crit_Frontline");
    } else {
        scripts/mp/spawnlogic::setactivespawnlogic("Default", "Crit_Frontline");
    }
    scripts/mp/spawnlogic::addstartspawnpoints("mp_tdm_spawn_allies_start");
    scripts/mp/spawnlogic::addstartspawnpoints("mp_tdm_spawn_axis_start");
    scripts/mp/spawnlogic::addspawnpoints(game["attackers"], "mp_tdm_spawn_allies_start");
    scripts/mp/spawnlogic::addspawnpoints(game["defenders"], "mp_tdm_spawn_axis_start");
    attackers = scripts/mp/spawnlogic::getspawnpointarray("mp_tdm_spawn_allies_start");
    defenders = scripts/mp/spawnlogic::getspawnpointarray("mp_tdm_spawn_axis_start");
    scripts/mp/spawnlogic::registerspawnset("start_attackers", attackers);
    scripts/mp/spawnlogic::registerspawnset("start_defenders", defenders);
    scripts/mp/spawnlogic::addspawnpoints("allies", "mp_tdm_spawn");
    scripts/mp/spawnlogic::addspawnpoints("axis", "mp_tdm_spawn");
    scripts/mp/spawnlogic::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
    scripts/mp/spawnlogic::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
    spawns = scripts/mp/spawnlogic::getspawnpointarray("mp_tdm_spawn");
    spawnssecondary = scripts/mp/spawnlogic::getspawnpointarray("mp_tdm_spawn_secondary");
    scripts/mp/spawnlogic::registerspawnset("normal", spawns);
    scripts/mp/spawnlogic::registerspawnset("fallback", spawnssecondary);
    level.mapcenter = scripts/mp/spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace fr / scripts/mp/gametypes/fr
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x826
// Size: 0x64
function reinitspawns() {
    /#
        scripts/mp/spawnlogic::function_8390bf8c3b74466a("fallback");
        scripts/mp/spawnlogic::function_8390bf8c3b74466a("end_reason");
        spawns = scripts/mp/spawnlogic::getspawnpointarray("<unknown string>");
        spawnssecondary = scripts/mp/spawnlogic::getspawnpointarray("<unknown string>");
        scripts/mp/spawnlogic::registerspawnset("fallback", spawns);
        scripts/mp/spawnlogic::registerspawnset("end_reason", spawnssecondary);
    #/
}

// Namespace fr / scripts/mp/gametypes/fr
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x891
// Size: 0xab
function getspawnpoint() {
    spawnteam = self.pers["team"];
    spawnpoint = undefined;
    if (scripts/mp/spawnlogic::shoulduseteamstartspawn()) {
        if (spawnteam == game["attackers"]) {
            scripts/mp/spawnlogic::activatespawnset("start_attackers", 1);
            spawnpoint = scripts/mp/spawnlogic::getspawnpoint(self, spawnteam, undefined, "start_attackers");
        } else {
            scripts/mp/spawnlogic::activatespawnset("start_defenders", 1);
            spawnpoint = scripts/mp/spawnlogic::getspawnpoint(self, spawnteam, undefined, "start_defenders");
        }
    } else {
        scripts/mp/spawnlogic::activatespawnset("normal", 1);
        spawnpoint = scripts/mp/spawnlogic::getspawnpoint(self, spawnteam, undefined, "fallback");
        /#
            spawncompare(spawnpoint, spawnteam);
        #/
    }
    return spawnpoint;
}

// Namespace fr / scripts/mp/gametypes/fr
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x944
// Size: 0x28
function onspawnplayer(revivespawn) {
    if (istrue(level.var_3cd921e8f55a730b)) {
        function_cc6a3b6b4c6e5ed8();
    }
    function_1f99e5a11b5e285b(self);
}

// Namespace fr / scripts/mp/gametypes/fr
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x973
// Size: 0x17c
function spawncompare(spawnpoint, spawnteam) {
    /#
        if (getdvarint(@"hash_b5ceec3e3cb419be") != 0) {
            spawnpoints = scripts/mp/spawnlogic::getteamspawnpoints(spawnteam);
            fallbackspawnpoints = [];
            scriptspawnpoint = scripts/mp/spawnscoring::getspawnpoint_legacy(spawnpoints, fallbackspawnpoints);
            if (!isdefined(level.var_3d292942d52b104a)) {
                level.var_3d292942d52b104a = 0;
                level.var_2dc7108159dc1da3 = 0;
                level.var_a065445ba781ddf6 = 0;
            }
            level.var_3d292942d52b104a++;
            println("<unknown string>" + scriptspawnpoint.index + "<unknown string>" + scriptspawnpoint.totalscore);
            if (scriptspawnpoint.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("<unknown string>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("<unknown string>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            }
            return scriptspawnpoint;
        }
    #/
}

// Namespace fr / scripts/mp/gametypes/fr
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xaf6
// Size: 0x41
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    scripts/mp/gametypes/common::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace fr / scripts/mp/gametypes/fr
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb3e
// Size: 0x53
function ontimelimit() {
    winner = scripts/mp/gamescore::gethighestscoringteam();
    if (game["status"] == "overtime") {
        winner = "forfeit";
    } else if ("tie") {
        winner = "overtime";
    }
    thread scripts/mp/gamelogic::endgame(winner, game["end_reason"]["time_limit_reached"]);
}

// Namespace fr / scripts/mp/gametypes/fr
// Params a, eflags: 0x0
// Checksum 0x0, Offset: 0xb98
// Size: 0x54
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid) {
    
}

// Namespace fr / scripts/mp/gametypes/fr
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf3
// Size: 0x4f
function shouldgamelobbyremainintact() {
    axisscore = int(game["teamScores"]["axis"]);
    alliesscore = int(game["teamScores"]["allies"]);
    differential = axisscore - alliesscore;
    return differential < 10;
}

