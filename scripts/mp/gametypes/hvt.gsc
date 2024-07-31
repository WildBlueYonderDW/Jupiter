#using scripts\common\callbacks.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using script_2b264b25c7da0b12;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\gametypes\bradley_spawner.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\utility\dialog.gsc;
#using scripts\cp_mp\killstreaks\uav.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace hvt;

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x783
// Size: 0x21b
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    scripts\mp\globallogic::init();
    scripts\mp\globallogic::setupcallbacks();
    allowed[0] = getgametype();
    scripts\mp\gameobjects::main(allowed);
    setdvar(@"hash_a4d532f42d919827", 1);
    setdvar(@"hash_fde1113ce9981d91", 3);
    setdvar(@"hash_f477e59410bec785", 1);
    setdvar(@"hash_fa6cdf74e2592068", "t10_pi_p13_usugar9_mp");
    level.armoronweaponswitchlongpress = 1;
    level.var_e70ce1a0418791bd = array_add_safe(level.var_e70ce1a0418791bd, "t10_combataxe_mp");
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 9);
        registertimelimitdvar(getgametype(), 10);
        registerscorelimitdvar(getgametype(), 150);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        setdvar(@"hash_e723cc761de7b161", 1);
    }
    updategametypedvars();
    initdialog();
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerkilled = &onplayerkilled;
    level.modelaststandallowed = &modelaststandallowed;
    level.modeonlaststandfunc = &function_8e02eb5056d9e4d2;
    level.modeonexitlaststandfunc = &function_930d45cca276d8e2;
    level.var_4941fc1ee570d4cb = &function_a5b896d29f677e6b;
    level.disablebuddyspawn = 1;
    level.var_2d3ee92902ba30fa = &namespace_1d863a7bbc05fc52::laststandthink;
    level.var_43cd475109571dae = [];
    level.var_43cd475109571dae["allies"] = 0;
    level.var_43cd475109571dae["axis"] = 0;
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a6
// Size: 0xc0
function initdialog() {
    game["dialog"]["gametype"] = "gametype_hvt";
    game["dialog"]["boost"] = "boost_tdm";
    game["dialog"]["offense_obj"] = "boost_tdm";
    game["dialog"]["defense_obj"] = "boost_tdm";
    game["dialog"]["hvt_friend_eliminated"] = "iw9_annm_tghv_rutl_ghfa";
    game["dialog"]["hvt_enemy_eliminated"] = "iw9_annm_tghv_rutl_ghea";
    game["dialog"]["hvt_new_friendly"] = "iw9_annm_tghv_rutl_ghfc";
    game["dialog"]["hvt_new_enemy"] = "iw9_annm_tghv_rutl_gheb";
    game["dialog"]["hvt_damaged_friendly"] = "iw9_annm_tghv_rutl_ghfb";
    game["dialog"]["hvt_self"] = "iw9_annm_tghv_rutl_ghfd";
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa6e
// Size: 0x3f
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    level.var_7f447a56a749ac85 = getmatchrulesdata("hvtData", "hvtSpawnArmorPlates");
    setdynamicdvar(@"hash_6e7da31aae47b8e0", 0);
    registerhalftimedvar(getgametype(), 0);
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab5
// Size: 0x55
function updategametypedvars() {
    updatecommongametypedvars();
    level.hvtNumHVTPerTeam = dvarintvalue("hvtNumHVTPerTeam", 1, 1, 7);
    level.hvtPointsPerHVTKilled = dvarintvalue("hvtPointsPerHVTKilled", 5, 0, 15);
    level.hvtPointsPerKillAsHVT = dvarintvalue("hvtPointsPerKillAsHVT", 2, 0, 15);
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb12
// Size: 0x114
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
        setobjectivetext(entry, %OBJECTIVES/WAR);
        if (level.splitscreen) {
            setobjectivescoretext(entry, %OBJECTIVES/WAR);
        } else {
            setobjectivescoretext(entry, %OBJECTIVES/WAR_SCORE);
        }
        setobjectivehinttext(entry, %OBJECTIVES/WAR_HINT);
    }
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&onplayerspawned);
    scripts\mp\utility\disconnect_event_aggregator::registerondisconnecteventcallback(&onplayerdisconnect);
    initspawns();
    scripts\mp\gametypes\bradley_spawner::inittankspawns();
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc2e
// Size: 0x1eb
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        scripts\mp\spawnlogic::setactivespawnlogic(#"default");
    } else if (getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        scripts\mp\spawnlogic::setactivespawnlogic("Default", "Crit_Default");
    } else if (isdefined(level.localeid)) {
        scripts\mp\spawnlogic::setactivespawnlogic("BigTDM", "Crit_Frontline");
    } else {
        scripts\mp\spawnlogic::setactivespawnlogic("Default", "Crit_Frontline");
    }
    scripts\mp\spawnlogic::addstartspawnpoints("mp_tdm_spawn_allies_start");
    scripts\mp\spawnlogic::addstartspawnpoints("mp_tdm_spawn_axis_start");
    scripts\mp\spawnlogic::addspawnpoints(game["attackers"], "mp_tdm_spawn_allies_start");
    scripts\mp\spawnlogic::addspawnpoints(game["defenders"], "mp_tdm_spawn_axis_start");
    attackers = scripts\mp\spawnlogic::getspawnpointarray("mp_tdm_spawn_allies_start");
    defenders = scripts\mp\spawnlogic::getspawnpointarray("mp_tdm_spawn_axis_start");
    scripts\mp\spawnlogic::registerspawnset("start_attackers", attackers);
    scripts\mp\spawnlogic::registerspawnset("start_defenders", defenders);
    scripts\mp\spawnlogic::addspawnpoints("allies", "mp_tdm_spawn");
    scripts\mp\spawnlogic::addspawnpoints("axis", "mp_tdm_spawn");
    scripts\mp\spawnlogic::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
    scripts\mp\spawnlogic::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
    spawns = scripts\mp\spawnlogic::getspawnpointarray("mp_tdm_spawn");
    spawnssecondary = scripts\mp\spawnlogic::getspawnpointarray("mp_tdm_spawn_secondary");
    scripts\mp\spawnlogic::registerspawnset("normal", spawns);
    scripts\mp\spawnlogic::registerspawnset("fallback", spawnssecondary);
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe21
// Size: 0x95
function getspawnpoint() {
    spawnteam = self.pers["team"];
    if (game["switchedsides"]) {
        spawnteam = getotherteam(spawnteam)[0];
    }
    if (scripts\mp\spawnlogic::shoulduseteamstartspawn()) {
        spawnpoints = scripts\mp\spawnlogic::getspawnpointarray("mp_tdm_spawn_" + spawnteam + "_start");
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint_startspawn(spawnpoints);
    } else {
        scripts\mp\spawnlogic::activatespawnset("normal");
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, spawnteam, undefined, "fallback");
        /#
            spawncompare(spawnpoint, spawnteam);
        #/
    }
    return spawnpoint;
}

/#

    // Namespace hvt / scripts\mp\gametypes\hvt
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xebf
    // Size: 0x17a
    function spawncompare(spawnpoint, spawnteam) {
        if (getdvarint(@"hash_b5ceec3e3cb419be") != 0) {
            spawnpoints = scripts\mp\spawnlogic::getteamspawnpoints(spawnteam);
            fallbackspawnpoints = [];
            scriptspawnpoint = scripts\mp\spawnscoring::getspawnpoint_legacy(spawnpoints, fallbackspawnpoints);
            if (!isdefined(level.var_3d292942d52b104a)) {
                level.var_3d292942d52b104a = 0;
                level.var_2dc7108159dc1da3 = 0;
                level.var_a065445ba781ddf6 = 0;
            }
            level.var_3d292942d52b104a++;
            println("<dev string:x1c>" + scriptspawnpoint.index + "<dev string:x37>" + scriptspawnpoint.totalscore);
            if (scriptspawnpoint.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("<dev string:x4d>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<dev string:x6c>" + "<dev string:x7a>" + level.var_2dc7108159dc1da3 + "<dev string:x7f>" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("<dev string:x84>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<dev string:x6c>" + "<dev string:x7a>" + level.var_2dc7108159dc1da3 + "<dev string:x7f>" + level.var_3d292942d52b104a);
            }
            return scriptspawnpoint;
        }
    }

#/

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1041
// Size: 0x170
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid) {
    issuicide = scripts\mp\damage::issuicide(einflictor, attacker, smeansofdeath, objweapon);
    isteamkill = scripts\mp\damage::isteamkill(einflictor, attacker);
    if (issuicide || isteamkill) {
        return;
    }
    if (ishvt()) {
        function_a2ec131d150b20c8(attacker);
        return;
    }
    if (attacker ishvt()) {
        attacker scripts\mp\utility\points::doScoreEvent(#"hash_c848dfdd9f079443");
        attacker thread scripts\mp\hud_message::showsplash("hvt_kill_splash");
        scripts\mp\gamescore::giveteamscoreforobjective(attacker.team, level.hvtPointsPerKillAsHVT);
        if (isdefined(self.attackers)) {
            foreach (player in self.attackers) {
                if (player == attacker) {
                    continue;
                }
                player scripts\mp\utility\points::doScoreEvent(#"hash_fd3eb0cb2e45667e");
            }
        }
        return;
    }
    scripts\mp\gamescore::giveteamscoreforobjective(attacker.team, 1);
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11b9
// Size: 0x1ac
function function_a2ec131d150b20c8(attacker) {
    excludelist = [];
    excludelist[0] = self;
    foreach (player in getteamdata(self.team, "players")) {
        player playlocalsound("uin_hvt_ally_killed");
    }
    enemyteam = getotherteam(self.team)[0];
    foreach (player in getteamdata(enemyteam, "players")) {
        player playlocalsound("uin_hvt_enemy_killed");
    }
    if (isdefined(attacker)) {
        attacker scripts\mp\utility\points::doScoreEvent(#"hvt_kill");
        attacker thread scripts\mp\hud_message::showsplash("hvt_killed_splash");
        if (isdefined(self.attackers)) {
            foreach (player in self.attackers) {
                if (player == attacker) {
                    continue;
                }
                player scripts\mp\utility\points::doScoreEvent(#"hash_e7321c2c761418a4");
            }
        }
        scripts\mp\gamescore::giveteamscoreforobjective(attacker.team, level.hvtPointsPerHVTKilled);
    }
    function_f7e228a53add5c40();
    self.var_1c65528773f3bdb3 = 1;
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x136d
// Size: 0x2a
function ontimelimit() {
    winner = scripts\mp\gamescore::gethighestscoringteam();
    thread scripts\mp\gamelogic::endgame(winner, game["end_reason"]["time_limit_reached"]);
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x139f
// Size: 0xdc
function onplayerspawned() {
    println("<dev string:xb4>" + self.name + "<dev string:xcd>" + self.origin);
    foreach (p in getteamdata(self.team, "players")) {
        if (p != self && isdefined(p.objidnumfriend)) {
            objective_addclienttomask(p.objidnumfriend, self);
        }
    }
    if (function_a0f16653bd8c0125(self.team)) {
        if (istrue(self.var_1c65528773f3bdb3)) {
            self.var_1c65528773f3bdb3 = undefined;
            return;
        }
        becomehvt();
    }
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1483
// Size: 0x1d
function onplayerdisconnect(player) {
    if (player ishvt()) {
        player function_f7e228a53add5c40();
    }
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x14a8
// Size: 0x63
function modelaststandallowed(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (ishvt() || function_311066dfee085643(self)) {
        return true;
    }
    return false;
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1514
// Size: 0xda
function function_8e02eb5056d9e4d2() {
    if (ishvt()) {
        foreach (player in getteamdata(self.team, "players")) {
            player playlocalsound("uin_hvt_ally_downed");
        }
        enemyteam = getotherteam(self.team)[0];
        foreach (player in getteamdata(enemyteam, "players")) {
            player playlocalsound("uin_hvt_enemy_downed");
        }
    }
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15f6
// Size: 0x32
function function_930d45cca276d8e2(revived) {
    if (ishvt()) {
        if (istrue(revived)) {
            self.var_63b104851a574f2a scripts\mp\utility\points::doScoreEvent(#"hash_a8cd2254f8c02a4b");
        }
    }
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1630
// Size: 0xb
function function_a5b896d29f677e6b() {
    return level.var_7f447a56a749ac85;
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1644
// Size: 0xc
function ishvt() {
    return istrue(self.ishvt);
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1659
// Size: 0x73
function function_aa6ad03630bbc953(team) {
    hvtcount = 0;
    foreach (player in getteamdata(team, "players")) {
        if (player ishvt()) {
            hvtcount++;
        }
    }
    return hvtcount;
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16d5
// Size: 0x2c
function function_a0f16653bd8c0125(team) {
    if (level.var_43cd475109571dae[team]) {
        return false;
    }
    return function_aa6ad03630bbc953(team) < level.hvtNumHVTPerTeam;
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x170a
// Size: 0x63
function function_4be33b77f63f508f() {
    setomnvar("ui_" + self.team + "_hvt_count", function_aa6ad03630bbc953(self.team));
    enemyteam = getotherteam(self.team)[0];
    setomnvar("ui_" + enemyteam + "_hvt_count", function_aa6ad03630bbc953(enemyteam));
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1775
// Size: 0x1db
function becomehvt() {
    self.ishvt = 1;
    self.game_extrainfo |= 1 << 16;
    function_136329cdd2983505();
    self setclientomnvar("ui_hvt_status", 1);
    enemyteam = getotherteam(self.team)[0];
    scripts\mp\utility\outline::_hudoutlineviewmodelenable("outlinefill_friendly_hvt", 0);
    self.friendlyoutlineid = outlineenableforteam(self, self.team, "outlinefill_friendly_hvt", "level_script");
    self.var_eeefde0f13484fb6 = outlineenableforteam(self, enemyteam, "outlinefill_enemy_hvt", "level_script");
    namespace_f8d3520d3483c1::initarmor();
    namespace_f8d3520d3483c1::givestartingarmor(250, level.var_7f447a56a749ac85);
    thread function_12d9fdaf83ab5ffb();
    if (issharedfuncdefined("player", "showMiniMap")) {
        self [[ getsharedfunc("player", "showMiniMap") ]]();
    }
    scripts\mp\hud_message::showsplash("hvt_player_selected");
    thread function_1d5e82320be9da1d();
    excludelist = [];
    excludelist[0] = self;
    foreach (player in getteamdata(self.team, "players")) {
        player playlocalsound("uin_hvt_ally_spawned");
    }
    foreach (player in getteamdata(enemyteam, "players")) {
        player playlocalsound("uin_hvt_enemy_spawned");
    }
    thread scripts\mp\utility\dialog::leaderdialogonplayer("hvt_self", "hvtUpdate");
    function_4be33b77f63f508f();
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1958
// Size: 0xa8
function function_f7e228a53add5c40() {
    self.ishvt = undefined;
    self.game_extrainfo &= ~(1 << 16);
    function_fb537e337319c2fe();
    self setclientomnvar("ui_hvt_status", 0);
    outlinedisable(self.friendlyoutlineid, self);
    scripts\mp\utility\outline::_hudoutlineviewmodeldisable();
    self.skipuavupdate = undefined;
    if (!istrue(level.minimaponbydefault)) {
        if (issharedfuncdefined("player", "hideMiniMap")) {
            self [[ getsharedfunc("player", "hideMiniMap") ]]();
        }
    }
    level thread function_f3b9baf1a4c79509(self.team);
    function_4be33b77f63f508f();
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a08
// Size: 0x4a
function function_f3b9baf1a4c79509(str_team) {
    level.var_43cd475109571dae[str_team] = 1;
    delay = 5;
    /#
        delay = getdvarint(@"hash_d6f1ae7da2a80d3", delay);
    #/
    wait delay;
    level.var_43cd475109571dae[str_team] = 0;
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a5a
// Size: 0xb7
function function_12d9fdaf83ab5ffb() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    while (ishvt()) {
        level waittill("uav_update");
        if (scripts\cp_mp\killstreaks\uav::function_5ec24d236512fd7a(self.team) > getuavstrengthmin()) {
            self.skipuavupdate = 1;
            self.radarstrength = getuavstrengthlevelneutral() + 1;
            self.isradarblocked = 0;
            self.hasradar = 1;
            self.radarshowenemydirection = 1;
            self.radarmode = "constant_radar";
            continue;
        }
        self.skipuavupdate = 0;
        radardata = scripts\cp_mp\killstreaks\uav::function_ddcbf96c5ef69597(self.team);
        scripts\cp_mp\killstreaks\uav::function_13b8682b55619852(self, radardata);
    }
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b19
// Size: 0x7c
function function_1d5e82320be9da1d() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    gameflagwait("prematch_done");
    var_393b16e2805d9e10 = 5;
    self.var_38ab0933f7a5e698 = 0;
    while (isdefined(self.ishvt)) {
        if (self.var_38ab0933f7a5e698 >= var_393b16e2805d9e10) {
            self.var_38ab0933f7a5e698 = 0;
            scripts\mp\utility\points::doScoreEvent(#"hash_d132f951cbf73638");
        } else {
            self.var_38ab0933f7a5e698++;
        }
        wait 1;
    }
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b9d
// Size: 0x1c6
function function_136329cdd2983505() {
    self.curorigin = self.origin;
    self.offset3d = (0, 0, 14);
    self.objidnumfriend = scripts\mp\objidpoolmanager::requestobjectiveid(1);
    objid = self.objidnumfriend;
    objective_setlabel(objid, "MP_INGAME_ONLY/OBJ_HVT_CAPS");
    objective_setzoffset(objid, 30);
    objective_icon(objid, "hud_icon_frontline_shield_hvt");
    objective_setplayintro(objid, 0);
    objective_removeallfrommask(objid);
    foreach (p in getteamdata(self.team, "players")) {
        if (p != self) {
            objective_addclienttomask(objid, p);
        }
    }
    objective_showtoplayersinmask(objid);
    objective_setbackground(objid, 0);
    objective_position(objid, self geteye() + self.offset3d);
    objective_state(objid, "current");
    objective_setownerteam(objid, self.team);
    self.objidnumenemy = scripts\mp\objidpoolmanager::requestobjectiveid(1);
    objid = self.objidnumenemy;
    objective_setlabel(objid, "MP_INGAME_ONLY/OBJ_HVT_CAPS");
    objective_setzoffset(objid, 15);
    objective_icon(objid, "hud_icon_death_spawn");
    objective_setplayintro(objid, 0);
    scripts\mp\objidpoolmanager::objective_teammask_single(objid, getotherteam(self.team)[0]);
    objective_setownerteam(objid, self.team);
    objective_setbackground(objid, 0);
    objective_position(objid, self geteye() + self.offset3d);
    objective_state(objid, "current");
    thread function_3bd91003ede3001e();
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d6b
// Size: 0xdc
function function_3bd91003ede3001e() {
    level endon("game_ended");
    self endon("disconnect");
    self notify("endUpdateHVTObjPos");
    self endon("endUpdateHVTObjPos");
    if (!isdefined(level.objpingdelay)) {
        level.objpingdelay = 1.5;
    }
    previousupdatetime = gettime();
    while (isdefined(self.objidnumfriend)) {
        objpos = self geteye() + self.offset3d;
        scripts\mp\objidpoolmanager::update_objective_position(self.objidnumfriend, objpos);
        objective_ping(self.objidnumfriend);
        currtime = gettime();
        if (currtime - previousupdatetime >= level.objpingdelay * 1000) {
            scripts\mp\objidpoolmanager::update_objective_position(self.objidnumenemy, objpos);
            objective_ping(self.objidnumenemy);
            previousupdatetime = currtime;
        }
        waitframe();
    }
}

// Namespace hvt / scripts\mp\gametypes\hvt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e4f
// Size: 0x43
function function_fb537e337319c2fe() {
    if (isdefined(self.objidnumfriend)) {
        scripts\mp\objidpoolmanager::returnobjectiveid(self.objidnumfriend);
        scripts\mp\objidpoolmanager::returnobjectiveid(self.objidnumenemy);
        self.objidnumfriend = undefined;
        self.objidnumenemy = undefined;
    }
}

