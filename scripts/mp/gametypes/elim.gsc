// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\spawnlogic.gsc;
#using script_548072087c9fd504;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using script_2b264b25c7da0b12;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\gametypes\hq.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\common\devgui.gsc;
#using scripts\mp\dev.gsc;

#namespace elim;

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9d6
// Size: 0x2d9
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    scripts/mp/globallogic::init();
    scripts/mp/globallogic::setupcallbacks();
    allowed[0] = getgametype();
    allowed[1] = "dom";
    scripts/mp/gameobjects::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 1, 0, 1);
        registertimelimitdvar(getgametype(), 600);
        registerscorelimitdvar(getgametype(), 65);
        registerroundlimitdvar(getgametype(), 0);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        registerdogtagsenableddvar(getgametype(), 1);
    }
    updategametypedvars();
    level.teambased = 1;
    level.nobuddyspawns = 1;
    level.objectivebased = 1;
    level.var_6f175c9cc4d2f1b7 = 1;
    level.onstartgametype = &onstartgametype;
    level.updatealiveomnvars = &function_9b2677ca6406227a;
    level.onplayerkilled = &elim_onplayerkilled;
    level.getspawnpoint = &getspawnpoint;
    level.onmaprestart = &function_de042a9016c7ff57;
    level.onnormaldeath = &onnormaldeath;
    level.modeonspawnplayer = &elim_onspawnplayer;
    level.ononeleftevent = &elim_ononeleftevent;
    level.ontimelimit = &elim_ontimelimit;
    level.ontimelimitot = &function_7af30b834b2361b5;
    level.modelaststandallowed = &modelaststandallowed;
    level.var_2d3ee92902ba30fa = &namespace_1d863a7bbc05fc52::laststandthink;
    level.var_2a91b79384531432 = 1;
    level callback::add("on_revive_trigger_requested", &function_5f65819c8a31674c);
    level.var_46c429e667d32f63 = 1;
    if (scripts/cp_mp/utility/game_utility::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    }
    game["dialog"]["boost"] = "iw9_conf_mode_uktl_bost";
    game["dialog"]["offense_obj"] = "iw9_conf_mode_uktl_bost";
    game["dialog"]["defense_obj"] = "iw9_conf_mode_uktl_bost";
    game["dialog"]["kill_confirmed"] = "iw9_conf_mode_uktl_kcnf";
    game["dialog"]["team_low_lives"] = "iw9_ctrl_mode_uktl_cfll";
    game["dialog"]["enemy_low_lives"] = "iw9_ctrl_mode_uktl_cell";
    game["dialog"]["team_no_lives"] = "iw9_ctrl_mode_uktl_cfnl";
    game["dialog"]["enemy_no_lives"] = "iw9_ctrl_mode_uktl_cenl";
    game["dialog"]["hint_tags"] = "iw9_conf_mode_uktl_htag";
    /#
        level thread function_ca18c921f35b6ef();
    #/
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb6
// Size: 0x63
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_757df52ba9feb2f3", getmatchrulesdata("controlData", "suicideTeamKillLowersLives"));
    setdynamicdvar(@"hash_79913d8651158ea5", getmatchrulesdata("controlData", "numTeamLives"));
    setdynamicdvar(@"hash_ca5a15907e4f1c1", 0);
    registerhalftimedvar("elim", 0);
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd20
// Size: 0x28a
function onstartgametype() {
    function_73d0c187f5ec8c7c();
    setdvar(@"hash_5fb9811d17b52a04", 1);
    level.wingamebytype = "roundsWon";
    attacking_team = game["attackers"];
    defending_team = game["defenders"];
    level.teamdata[attacking_team]["livesCount"] = level.numteamlives;
    level.teamdata[defending_team]["livesCount"] = level.numteamlives;
    level.teamdata[attacking_team]["elimUILivesCount"] = level.teamdata[attacking_team]["livesCount"];
    level.teamdata[defending_team]["elimUILivesCount"] = level.teamdata[defending_team]["livesCount"];
    setclientnamemode("auto_change");
    if (!isdefined(game["match_kills"])) {
        game["match_kills"][defending_team] = 0;
        game["match_kills"][attacking_team] = 0;
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
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/CONF");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/CONF");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/CONF_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/CONF_HINT");
    }
    initspawns();
    function_15f1737384d03c2e();
    setupovertime();
    level.dogtagallyonusecb = &dogtagallyonusecb;
    level.dogtagenemyonusecb = &dogtagenemyonusecb;
    /#
        thread function_c9cb37cdd0caa2f4();
        function_811292df738947aa();
    #/
    level.var_a18fa3de81feff0a = 0;
    level.var_a18fa0de81fef871 = 0;
    level.teamdata[attacking_team]["uncountedDeaths"] = 0;
    level.teamdata[defending_team]["uncountedDeaths"] = 0;
    level.teamdata[attacking_team]["dbno"] = 0;
    level.teamdata[defending_team]["dbno"] = 0;
    thread function_212d9bd663252af4();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb1
// Size: 0x21
function function_212d9bd663252af4() {
    if (!gameflag("prematch_done")) {
        level waittill("prematch_done");
    }
    level function_56c428ee980a8464();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfd9
// Size: 0x187
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        scripts/mp/spawnlogic::setactivespawnlogic(#"default");
    } else {
        scripts/mp/spawnlogic::setactivespawnlogic("Default", "Crit_Default");
    }
    attackers_start = scripts/mp/spawnlogic::getspawnpointarray("mp_ctf_spawn_allies_start");
    defenders_start = scripts/mp/spawnlogic::getspawnpointarray("mp_ctf_spawn_axis_start");
    scripts/mp/spawnlogic::addstartspawnpoints("mp_ctf_spawn_allies_start", 0, "allies");
    scripts/mp/spawnlogic::addstartspawnpoints("mp_ctf_spawn_axis_start", 0, "axis");
    scripts/mp/spawnlogic::addspawnpoints("allies", "mp_ctf_spawn_allies_start");
    scripts/mp/spawnlogic::addspawnpoints("axis", "mp_ctf_spawn_axis_start");
    scripts/mp/spawnlogic::registerspawnset("start_attackers", attackers_start);
    scripts/mp/spawnlogic::registerspawnset("start_defenders", defenders_start);
    attackers = scripts/mp/spawnlogic::getspawnpointarray("mp_ctf_spawn_allies");
    defenders = scripts/mp/spawnlogic::getspawnpointarray("mp_ctf_spawn_axis");
    scripts/mp/spawnlogic::addspawnpoints("allies", "mp_ctf_spawn_allies", 1);
    scripts/mp/spawnlogic::addspawnpoints("axis", "mp_ctf_spawn_axis", 1);
    scripts/mp/spawnlogic::registerspawnset("attackers", attackers);
    scripts/mp/spawnlogic::registerspawnset("defenders", defenders);
    level.mapcenter = scripts/mp/spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1167
// Size: 0x54
function updategametypedvars() {
    updatecommongametypedvars();
    level.scoreconfirm = dvarintvalue("pointsPerConfirm", 1, 0, 25);
    level.scoredeny = dvarintvalue("pointsPerDeny", 0, 0, 25);
    level.numteamlives = dvarintvalue("numTeamLives", 10, 0, 100);
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11c2
// Size: 0xae
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
    } else if (spawnteam == game["attackers"]) {
        spawnpoint = scripts/mp/spawnlogic::getspawnpoint(self, spawnteam, "attackers");
    } else {
        spawnpoint = scripts/mp/spawnlogic::getspawnpoint(self, spawnteam, "defenders");
    }
    return spawnpoint;
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1278
// Size: 0x51
function dogtagallyonusecb(player) {
    if (isplayer(player)) {
        player setextrascore1(player.pers["denied"]);
        player scripts/mp/gamescore::giveteamscoreforobjective(player.pers["team"], level.scoredeny, 0);
    }
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12d0
// Size: 0x80
function dogtagenemyonusecb(player) {
    if (isplayer(player)) {
        currentteam = getotherteam(player.team)[0];
        if (!getteamdata(currentteam, "noRespawns")) {
            thread function_cf18a42c2718cd59(player, currentteam);
        }
        if (isdefined(self.joining_team) && self.joining_team != "spectator") {
            currentteam = getotherteam(self.joining_team)[0];
        }
        return;
    }
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1357
// Size: 0x63
function function_9589bc4a06570c45(player, currentteam) {
    level.teamdata[currentteam]["uncountedDeaths"]++;
    player.uncounteddeath = 1;
    player waittill_any_2("spawned", "disconnect");
    level.teamdata[currentteam]["uncountedDeaths"]--;
    player.uncounteddeath = undefined;
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13c1
// Size: 0x286
function function_56c428ee980a8464() {
    var_853bab92f5cddacb = getteamdata("allies", "aliveCount");
    var_648c7106b0a281e7 = getteamdata("axis", "aliveCount");
    if (level.numteamlives == 0) {
        setomnvar("ui_allies_alive", getteamdata("allies", "teamCount"));
        setomnvar("ui_axis_alive", getteamdata("axis", "teamCount"));
        setomnvar("ui_allies_lives_remaining", getteamdata("allies", "livesCount"));
        setomnvar("ui_axis_lives_remaining", getteamdata("axis", "livesCount"));
        return;
    } else if (var_853bab92f5cddacb > level.numteamlives || var_648c7106b0a281e7 > level.numteamlives) {
        var_4edf38fbab5966e5 = ter_op(var_853bab92f5cddacb > var_648c7106b0a281e7, var_853bab92f5cddacb, var_648c7106b0a281e7);
        function_1f5ab97903453ce1("allies", var_4edf38fbab5966e5);
        function_1f5ab97903453ce1("axis", var_4edf38fbab5966e5);
        level.numteamlives = var_4edf38fbab5966e5;
    }
    setomnvar("ui_allies_alive", function_b6d7a7ce224438f9("allies", 1));
    setomnvar("ui_axis_alive", function_b6d7a7ce224438f9("axis", 1));
    setomnvar("ui_allies_lives_remaining", function_b6d7a7ce224438f9("allies", 1));
    setomnvar("ui_axis_lives_remaining", function_b6d7a7ce224438f9("axis", 1));
    var_3c88e2c95a9c563d = level.teamdata["allies"]["teamCount"];
    if (getteamdata("allies", "livesCount") <= 8 && !level.var_a18fa3de81feff0a && level.numteamlives - var_3c88e2c95a9c563d > 8) {
        scripts/mp/utility/dialog::statusdialog("team_low_lives", "allies", "lives");
        scripts/mp/utility/dialog::statusdialog("enemy_low_lives", "axis", "lives");
        level.var_a18fa3de81feff0a = 1;
    }
    var_76686016ad63e461 = level.teamdata["axis"]["teamCount"];
    if (getteamdata("axis", "livesCount") <= 8 && !level.var_a18fa0de81fef871 && level.numteamlives - var_76686016ad63e461 > 8) {
        scripts/mp/utility/dialog::statusdialog("team_low_lives", "axis", "lives");
        scripts/mp/utility/dialog::statusdialog("enemy_low_lives", "allies", "lives");
        level.var_a18fa0de81fef871 = 1;
    }
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x164e
// Size: 0xf6
function function_1f5ab97903453ce1(team_name, var_41e4d73fabed18df) {
    alivecount = getteamdata(team_name, "aliveCount");
    livescount = getteamdata(team_name, "livesCount");
    uicount = getteamdata(team_name, "elimUILivesCount");
    if (var_41e4d73fabed18df < uicount || var_41e4d73fabed18df < alivecount + livescount) {
        /#
            assertmsg("Attempted to reduce the total lives of for team " + team_name);
        #/
        return;
    }
    if (alivecount + livescount < var_41e4d73fabed18df) {
        var_e4c33c2942b6c9cd = var_41e4d73fabed18df - alivecount + livescount;
        level.teamdata[team_name]["livesCount"] = level.teamdata[team_name]["livesCount"] + var_e4c33c2942b6c9cd;
        level.teamdata[team_name]["noRespawns"] = 0;
        setomnvar("elim_" + team_name + "_no_respawn", 0);
    }
    if (uicount != var_41e4d73fabed18df) {
        level.teamdata[team_name]["elimUILivesCount"] = var_41e4d73fabed18df;
    }
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x174b
// Size: 0xb
function function_9b2677ca6406227a() {
    level function_56c428ee980a8464();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x175d
// Size: 0x7f
function function_b6d7a7ce224438f9(team, internal_count) {
    total_lives = undefined;
    if (istrue(internal_count)) {
        total_lives = level.teamdata[team]["elimUILivesCount"];
    } else {
        livescount = getteamdata(team, "livesCount");
        alivecount = getteamdata(team, "aliveCount");
        total_lives = livescount + alivecount;
    }
    if (!isdefined(total_lives) || total_lives < 0) {
        total_lives = 0;
    }
    return total_lives;
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17e4
// Size: 0x5c
function onplayerspawned(player) {
    self endon("disconnect");
    while (true) {
        self waittill("spawned");
        setextrascore0(0);
        if (isdefined(self.pers["damage"])) {
            setextrascore0(self.pers["damage"]);
        }
        level function_56c428ee980a8464();
    }
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1847
// Size: 0x1e3
function elim_onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid) {
    if (isdefined(attacker) && isplayer(attacker) && attacker != self && attacker.team != self.team) {
        isattacker = attacker.team == game["attackers"];
        victim = self;
        attackerteam = attacker.team;
        if (isattacker) {
            attacker scripts/mp/codcasterclientmatchdata::function_d16498b27251da56(10, 1);
        } else {
            attacker scripts/mp/codcasterclientmatchdata::function_d16498b27251da56(9, 1);
        }
        currentteam = self.team;
        issuicide = scripts/mp/damage::issuicide(einflictor, attacker, smeansofdeath, objweapon);
        isteamkill = scripts/mp/damage::isteamkill(einflictor, attacker);
        if (isdefined(self.joining_team) && self.joining_team != "spectator") {
            currentteam = getotherteam(self.joining_team)[0];
        }
        if ((issuicide || isteamkill) && !level.suicideTeamKillLowersLives && !istrue(self.switching_teams)) {
            if (getteamdata(currentteam, "noRespawns")) {
                thread scripts/mp/playerlogic::spawnclient();
            }
            level thread function_9589bc4a06570c45(self, currentteam);
            return;
        }
        game["match_kills"][getotherteam(currentteam)[0]]++;
        noRespawns = getteamdata(currentteam, "noRespawns");
        if (istrue(noRespawns)) {
            function_cf18a42c2718cd59(self, currentteam);
        }
        level function_56c428ee980a8464();
    }
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a31
// Size: 0x124
function function_cf18a42c2718cd59(player, affectedteam) {
    teamcount = getteamdata(affectedteam, "teamCount");
    noRespawns = getteamdata(affectedteam, "noRespawns");
    elimUILivesCount = getteamdata(affectedteam, "elimUILivesCount");
    level.teamdata[affectedteam]["elimUILivesCount"]--;
    level.teamdata[affectedteam]["livesCount"]--;
    elimUILivesCount = level.teamdata[affectedteam]["elimUILivesCount"];
    if (!noRespawns && elimUILivesCount == teamcount) {
        function_5ac1fc4ebbadd34b(affectedteam);
    }
    var_6bcdfd625daabeef = level.teamdata[affectedteam]["elimUILivesCount"];
    if (var_6bcdfd625daabeef == 0 && level.numteamlives != 0 || teamcount == 0) {
        otherteam = getotherteam(player.team)[0];
        elim_endround(otherteam, game["end_reason"]["enemies_eliminated"], game["end_reason"]["friendlies_eliminated"]);
    }
    level function_56c428ee980a8464();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1b5c
// Size: 0x4b
function elim_endround(winningteam, endreasontext, endreasontextloss, nukedetonated, var_8e4a26ed257a393b) {
    scripts/mp/gamescore::giveteamscoreforobjective(winningteam, 1);
    level thread scripts/mp/gamelogic::endgame(winningteam, endreasontext, endreasontextloss, nukedetonated, var_8e4a26ed257a393b);
    scripts/mp/codcasterclientmatchdata::function_94c8f3722d550646();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bae
// Size: 0x27
function elim_ononeleftevent(team) {
    lastplayer = getlastlivingplayer(team);
    lastplayer thread elim_givelastonteamwarning();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bdc
// Size: 0x82
function elim_givelastonteamwarning() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    waittillrecoveredhealth(3);
    level thread scripts/mp/battlechatter_mp::trysaylocalsound(self, "inform_last_one");
    otherteam = getotherteam(self.pers["team"])[0];
    level thread teamplayercardsplash("callout_lastteammemberalive", self, self.pers["team"]);
    level thread teamplayercardsplash("callout_lastenemyalive", self, otherteam);
    level notify("last_alive", self);
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c65
// Size: 0x167
function function_df4c58d276eea572(team) {
    if (gettimepassed() < 5000) {
        return;
    }
    players = scripts/mp/utility/teams::getteamdata(team, "players");
    function_d728ac09bfb9f96(team);
    foreach (player in players) {
        player thread scripts/mp/gametypes/hq::showrespawnwarningmessage();
    }
    scripts/mp/utility/dialog::statusdialog("team_no_lives", team, "lives");
    foreach (enemyteam in getotherteam(team)) {
        scripts/mp/utility/dialog::statusdialog("enemy_no_lives", enemyteam, "lives");
    }
    foreach (player in level.players) {
        if (player.team == getotherteam(team)[0]) {
            player giveperk("specialty_kill_report");
        }
    }
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1dd3
// Size: 0x5a
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    victim.lastdeathtime = gettime();
    level function_56c428ee980a8464();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e34
// Size: 0x66
function elim_onspawnplayer(revivespawn) {
    if (getteamdata(self.team, "noRespawns") && istrue(revivespawn)) {
        thread function_77c785d6e612c0c8(self, self.team);
    }
    if (getteamdata(getotherteam(self.team)[0], "noRespawns")) {
        giveperk("specialty_kill_report");
    }
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea1
// Size: 0x40
function function_77c785d6e612c0c8(player, affectedteam) {
    level.teamdata[affectedteam]["elimUILivesCount"]++;
    level.teamdata[affectedteam]["livesCount"]++;
    level function_56c428ee980a8464();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ee8
// Size: 0x76
function function_5ac1fc4ebbadd34b(team) {
    function_fe5183c2db26af8a();
    setteamdata(team, "dbno", 1);
    setteamdata(team, "noRespawns", 1);
    if (!isdefined(level.var_defc2acd2b0203ad)) {
        level.var_defc2acd2b0203ad = [];
    }
    level.var_defc2acd2b0203ad[team] = gettime();
    setomnvar("elim_" + team + "_no_respawn", 1);
    function_df4c58d276eea572(team);
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f65
// Size: 0xa5
function elim_ontimelimit() {
    if (!isdefined(level.var_3d06de480d9ef9c4)) {
        var_c617ff765ca24ffa = level.teamdata[game["attackers"]]["elimUILivesCount"];
        var_855467642e29d156 = level.teamdata[game["defenders"]]["elimUILivesCount"];
        winningteam = "tie";
        if (var_c617ff765ca24ffa > var_855467642e29d156) {
            winningteam = game["attackers"];
        } else if (var_855467642e29d156 > var_c617ff765ca24ffa) {
            winningteam = game["defenders"];
        }
        elim_endround(winningteam, game["end_reason"]["time_limit_reached"]);
        level.var_3d06de480d9ef9c4 = 1;
    }
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2011
// Size: 0xc
function function_7af30b834b2361b5() {
    level thread function_681cdc48fee81765();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2024
// Size: 0xbd
function function_742b83d1bbea8146() {
    attacking_team = game["attackers"];
    defending_team = game["defenders"];
    if (level.overtimeDefenders == 2) {
        if (game["segment_captures"][attacking_team] > game["segment_captures"][defending_team]) {
            return attacking_team;
        } else if (game["segment_captures"][defending_team] > game["segment_captures"][attacking_team]) {
            return defending_team;
        }
    }
    totalkills[attacking_team] = game["match_kills"][attacking_team];
    totalkills[defending_team] = game["match_kills"][defending_team];
    if (totalkills[attacking_team] > totalkills[defending_team]) {
        return attacking_team;
    }
    if (totalkills[defending_team] > totalkills[attacking_team]) {
        return defending_team;
    }
    if (randomint(2) == 0) {
        return attacking_team;
    }
    return defending_team;
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20e8
// Size: 0x36
function function_fe5183c2db26af8a() {
    level.laststand = 2;
    scripts/mp/teamrevive::function_66e35a0b8bd5c2a7();
    level.liveRagdollRevive = 1;
    level.var_b961dd6c88e9a008 = 1;
    level.numlives = 1;
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2125
// Size: 0x35
function function_73d0c187f5ec8c7c() {
    level.laststand = 0;
    scripts/mp/teamrevive::function_66e35a0b8bd5c2a7(0, 0, 0);
    level.liveRagdollRevive = 0;
    level.var_b961dd6c88e9a008 = 0;
    level.numlives = 0;
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2161
// Size: 0x8a
function function_5f65819c8a31674c(deathdata) {
    if (!isdefined(deathdata)) {
        return;
    }
    victim = deathdata.victim;
    attacker = deathdata.attacker;
    meansofdeath = deathdata.meansofdeath;
    noRespawns = getteamdata(victim.team, "noRespawns");
    if (noRespawns) {
        level thread scripts/mp/teamrevive::spawnrevivetrigger(victim, attacker, "new_trigger_spawned", meansofdeath);
    }
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21f2
// Size: 0xa
function function_de042a9016c7ff57() {
    scripts/mp/codcasterclientmatchdata::function_edba1ee7c2375a5();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x2203
// Size: 0x75
function modelaststandallowed(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (getteamdata(self.team, "dbno") == 1 || function_311066dfee085643(self)) {
        return true;
    }
    return false;
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2280
// Size: 0x1b3
function function_15f1737384d03c2e() {
    level.icontaking = "waypoint_taking";
    level.iconcapture = "waypoint_capture";
    level.icondefend = "waypoint_defend";
    level.icondefending = "waypoint_defending";
    level.iconlosing = "waypoint_losing";
    level.iconneutral = "waypoint_captureneutral";
    level.iconcontested = "waypoint_contested";
    level.iconwaypointovertime = "icon_waypoint_overtime";
    scripts/mp/gamelogic::setwaypointiconinfo(level.icontaking, 0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", level.iconwaypointovertime, 1);
    scripts/mp/gamelogic::setwaypointiconinfo(level.iconcapture, 0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", level.iconwaypointovertime, 0);
    scripts/mp/gamelogic::setwaypointiconinfo(level.icondefend, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", level.iconwaypointovertime, 0);
    scripts/mp/gamelogic::setwaypointiconinfo(level.icondefending, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", level.iconwaypointovertime, 0);
    scripts/mp/gamelogic::setwaypointiconinfo(level.iconlosing, 0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", level.iconwaypointovertime, 1);
    scripts/mp/gamelogic::setwaypointiconinfo(level.iconcontested, 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", level.iconwaypointovertime, 1);
    scripts/mp/gamelogic::setwaypointiconinfo(level.iconneutral, 0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", level.iconwaypointovertime, 0);
    scripts/mp/gamelogic::setwaypointiconinfo("waypoint_dogtags", 0, "enemy", "", "hud_icon_minimap_misc_dog_tag", 0);
    scripts/mp/gamelogic::setwaypointiconinfo("waypoint_dogtags_friendly", 0, "friendly", "", "hud_icon_minimap_misc_dog_tag", 0);
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x243a
// Size: 0x51
function setupovertime() {
    level.overtimeFlag = 1;
    level.disableinitplayergameobjects = 0;
    level.ontimelimitgraceperiod = 60;
    level.currenttimelimitdelay = 0;
    level.canprocessot = 1;
    level.var_990ac861b0b61675 = 120;
    function_aece75d270fa29e0();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2492
// Size: 0x34
function function_aece75d270fa29e0() {
    level.var_9afb5a7306b515c7 = function_b266970ca8418ea7();
    level.var_9afb5a7306b515c7 function_5f9879a1d8da72ef(0);
    level.var_9afb5a7306b515c7 elim_flag_setVisible(0);
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24cd
// Size: 0x2db
function function_b266970ca8418ea7() {
    triggers = getentarray("flag_primary", "targetname");
    foreach (trigger in triggers) {
        if (trigger.script_label == "_b") {
            level.otzone = trigger;
            break;
        }
    }
    objective = scripts/mp/gameobjects::createuseobject("neutral", level.otzone, [], (0, 0, 70), 0, 0, 1);
    objective scripts/mp/gameobjects::allowuse("enemy");
    objective scripts/mp/gameobjects::setvisibleteam("any");
    objective scripts/mp/gameobjects::setobjectivestatusicons(level.iconneutral);
    objective scripts/mp/gameobjects::cancontestclaim(1);
    objective scripts/mp/gameobjects::setusetime(15);
    objective scripts/mp/gameobjects::pinobjiconontriggertouch();
    objective scripts/mp/gameobjects::mustmaintainclaim(0);
    objective.var_88806e65c3197677 = 1;
    objective.alwaysstalemate = 0;
    objective.var_6c9cdfc1bc07df96 = 1;
    objective.id = "domFlag";
    objective.firstcapture = 1;
    objective.ignorestomp = 1;
    tracestart = level.otzone.origin + (0, 0, 32);
    traceend = level.otzone.origin + (0, 0, -32);
    contentoverride = scripts/engine/trace::create_contents(1, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    trace = scripts/engine/trace::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    objective.baseeffectpos = trace["position"];
    objective.flagmodel = spawn("script_model", objective.baseeffectpos);
    objective.flagmodel.angles = (0, 0, 0);
    objective.flagmodel setmodel("military_dom_flag_neutral");
    objective.onbeginuse = &function_e523100354b2bc57;
    objective.onuseupdate = &function_98b2ab6cb6f9d803;
    objective.onenduse = &function_bf70bd889e8c9657;
    objective.onuse = &function_2ed74e8fe9f7a19f;
    objective.oncontested = &function_9faeb1f447e32bb0;
    objective.onuncontested = &function_1b7b31315c2ca80d;
    objective.onunoccupied = &function_e0437f7871ef9238;
    return objective;
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27b0
// Size: 0xf4
function function_681cdc48fee81765() {
    level.canprocessot = 1;
    level.var_9afb5a7306b515c7.flagmodel playsound("flag_spawned");
    level.var_9afb5a7306b515c7 elim_flag_setVisible(1);
    level.var_9afb5a7306b515c7 function_5f9879a1d8da72ef(1);
    foreach (player in level.players) {
        if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
            continue;
        }
        player scripts/mp/utility/dialog::leaderdialogonplayer("overtime");
    }
    function_b203ef9def1f8c74();
    function_f5b6d37e13aa566a(level.otzone.target, level.otzone.script_label);
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28ab
// Size: 0x52
function function_5f9879a1d8da72ef(enable) {
    if (enable) {
        scripts/mp/gameobjects::allowuse("any");
        self.trigger scripts/engine/utility::trigger_on();
        return;
    }
    scripts/mp/gameobjects::allowuse("none");
    self.trigger scripts/engine/utility::trigger_off();
    scripts/mp/gameobjects::resetcaptureprogress();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2904
// Size: 0x8c
function elim_flag_setVisible(enable) {
    self notify("elim_flag_setVisible");
    if (enable) {
        scripts/mp/objidpoolmanager::update_objective_state(level.var_9afb5a7306b515c7.objidnum, "current");
        scripts/mp/gameobjects::setvisibleteam("any");
        scripts/mp/objidpoolmanager::function_9b1a086f348520b0(self.objidnum, "neutral");
        scripts/mp/gameobjects::setobjectivestatusicons(level.iconneutral);
        scripts/mp/gameobjects::setvisibleteam("any");
        return;
    }
    thread function_726259d42f88361("off");
    thread function_9ad0b84181341b7e();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2997
// Size: 0x43
function function_9ad0b84181341b7e() {
    self endon("elim_flag_setVisible");
    objective_setpinned(self.objidnum, 0);
    wait(1);
    scripts/mp/gameobjects::setvisibleteam("none");
    thread function_3d8b794656fa0ff2(0);
    self.flagmodel hide(1);
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29e1
// Size: 0x65
function function_3d8b794656fa0ff2(enable) {
    if (isdefined(level.players) && level.players.size > 0) {
        if (enable) {
            self.flagmodel hudoutlineenableforclients(level.players, "outline_nodepth_orange");
            return;
        }
        self.flagmodel hudoutlinedisableforclients(level.players);
    }
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a4d
// Size: 0x25
function function_e0a623e1aeb469cc() {
    scripts/mp/gameobjects::allowuse("none");
    scripts/mp/gameobjects::disableobject();
    self.flagmodel hide();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a79
// Size: 0x58
function function_7da9bb89110739db(captureteam) {
    scripts/mp/objidpoolmanager::function_9b1a086f348520b0(self.objidnum, captureteam);
    scripts/mp/gameobjects::setobjectivestatusicons(level.icondefending, level.iconcapture);
    scripts/mp/objidpoolmanager::objective_show_progress(self.objidnum, 0);
    scripts/mp/objidpoolmanager::objective_set_progress(self.objidnum, 0);
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ad8
// Size: 0xba
function function_f5b6d37e13aa566a(target, label) {
    wait(1);
    othervisuals = getentitylessscriptablearray(target, "targetname");
    chevrons = [];
    foreach (visual in othervisuals) {
        index = chevrons.size;
        chevrons[index] = visual;
        chevrons[index].numchevrons = 1;
    }
    self.chevrons = chevrons;
    function_726259d42f88361("idle");
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b99
// Size: 0xb6
function function_726259d42f88361(state) {
    self notify("updateChevrons");
    self endon("updateChevrons");
    while (!isdefined(self.chevrons)) {
        waitframe();
    }
    var_a27485475186b39d = "chevron_";
    foreach (chevron in self.chevrons) {
        for (i = 0; i < chevron.numchevrons; i++) {
            chevron setscriptablepartstate(var_a27485475186b39d + i, state);
        }
    }
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c56
// Size: 0xef
function function_223fb185e0afb231() {
    if (game["switchedsides"]) {
        if (self.ownerteam == game["attackers"]) {
            thread function_726259d42f88361("axis");
        } else if (self.ownerteam == game["defenders"]) {
            thread function_726259d42f88361("allies");
        }
    } else if (self.ownerteam == game["attackers"]) {
        thread function_726259d42f88361("allies");
    } else if (self.ownerteam == game["defenders"]) {
        thread function_726259d42f88361("axis");
    } else if (self.isunoccupied) {
        thread function_726259d42f88361("idle");
    }
    if (self.stalemate) {
        thread function_726259d42f88361("contested");
        return;
    }
    if (!self.isunoccupied) {
        thread function_726259d42f88361(self.mostnumtouchingteam);
    }
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d4c
// Size: 0x6c
function function_e523100354b2bc57(player) {
    level.canprocessot = 0;
    scripts/mp/objidpoolmanager::function_9b1a086f348520b0(self.objidnum, player.team);
    scripts/mp/gameobjects::setobjectivestatusicons(level.icontaking, level.iconlosing);
    scripts/mp/objidpoolmanager::objective_set_progress_team(self.objidnum, player.team);
    function_223fb185e0afb231();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dbf
// Size: 0xe4
function function_2ed74e8fe9f7a19f(creditplayer) {
    if (!isdefined(creditplayer) || !isdefined(creditplayer.team)) {
        return;
    }
    level.canprocessot = 1;
    oldteam = scripts/mp/gameobjects::getownerteam();
    otherteam = getotherteam(creditplayer.team)[0];
    thread printandsoundoneveryone(creditplayer.team, otherteam, undefined, undefined, "mp_dom_flag_captured", "mp_dom_flag_lost", creditplayer);
    function_7da9bb89110739db(creditplayer.team);
    game["dialog"]["round_success"] = "gamestate_win_capture";
    game["dialog"]["round_failure"] = "gamestate_lost_capture";
    level thread elim_endround(creditplayer.team, game["end_reason"]["arena_otflag_completed"], game["end_reason"]["arena_otflag_failed"]);
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2eaa
// Size: 0x46
function function_98b2ab6cb6f9d803(team, progress, change, capplayer) {
    scripts/mp/objidpoolmanager::objective_set_progress_team(self.objidnum, team);
    scripts/mp/objidpoolmanager::function_9b1a086f348520b0(self.objidnum, team);
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2ef7
// Size: 0x69
function function_bf70bd889e8c9657(team, player, success) {
    level.canprocessot = 1;
    if (success) {
        scripts/mp/objidpoolmanager::objective_show_progress(self.objidnum, 0);
        thread function_726259d42f88361(player.team);
    } else {
        function_223fb185e0afb231();
    }
    scripts/mp/gameobjects::setobjectivestatusicons(level.iconneutral);
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f67
// Size: 0x49
function function_9faeb1f447e32bb0() {
    scripts/mp/objidpoolmanager::function_9b1a086f348520b0(self.objidnum, "neutral");
    scripts/mp/gameobjects::setobjectivestatusicons(level.iconcontested);
    scripts/mp/objidpoolmanager::objective_set_progress_team(self.objidnum, undefined);
    level thread forcegameendcontesttimeout();
    function_223fb185e0afb231();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fb7
// Size: 0x68
function function_1b7b31315c2ca80d(lastclaimteam) {
    scripts/mp/objidpoolmanager::function_9b1a086f348520b0(self.objidnum, "neutral");
    if (lastclaimteam == "none") {
        scripts/mp/gameobjects::setobjectivestatusicons(level.iconneutral);
    } else {
        scripts/mp/gameobjects::setobjectivestatusicons(level.icontaking, level.iconcapture);
    }
    delaythread(0.05, &function_223fb185e0afb231);
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3026
// Size: 0x1f
function function_e0437f7871ef9238() {
    scripts/mp/objidpoolmanager::function_9b1a086f348520b0(self.objidnum, "neutral");
    function_223fb185e0afb231();
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x304c
// Size: 0x66
function forcegameendcontesttimeout() {
    level notify("start_overtime_timeout");
    level endon("start_overtime_timeout");
    level endon("game_ended");
    if (!isdefined(level.ottimecontested)) {
        level.ottimecontested = 0;
    }
    while (level.ottimecontested < 5000) {
        wait(1);
        level.ottimecontested = level.ottimecontested + 1;
    }
    level.canprocessot = 1;
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30b9
// Size: 0xac
function function_d728ac09bfb9f96(teamname) {
    foreach (player in level.players) {
        if (player.team == teamname) {
            player scripts/mp/hud_message::function_51614e8fce37b07f("elim_friendly_norespawn", level.gametypebundle.var_3b841d10cb84cb06);
            continue;
        }
        player scripts/mp/hud_message::function_51614e8fce37b07f("elim_enemy_norespawn", level.gametypebundle.var_3b841d10cb84cb06);
    }
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x316c
// Size: 0x70
function function_b203ef9def1f8c74() {
    foreach (player in level.players) {
        player scripts/mp/hud_message::function_51614e8fce37b07f("elim_overtime", level.gametypebundle.var_3b841d10cb84cb06);
    }
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31e3
// Size: 0x2c
function function_a7456cf75cba76b2(player) {
    player scripts/mp/hud_message::function_51614e8fce37b07f("elim_last_alive", level.gametypebundle.var_3b841d10cb84cb06);
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3216
// Size: 0x71
function function_811292df738947aa() {
    /#
        scripts/common/devgui::function_6e7290c8ee4f558b("defenders");
        scripts/common/devgui::function_a9a864379a098ad6("_no_respawn", "waypoint_captureneutral", &function_9e2eca1aedfb8e4);
        scripts/common/devgui::function_a9a864379a098ad6("elim_flag_setVisible", "<unknown string>", &function_a2e6be25493acaed);
        scripts/common/devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_53da610a95ce4073);
        scripts/common/devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_bb509befa79c026);
        scripts/common/devgui::function_fe953f000498048f();
    #/
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x328e
// Size: 0x73
function function_9e2eca1aedfb8e4() {
    /#
        foreach (player in level.players) {
            player scripts/mp/hud_message::function_51614e8fce37b07f("<unknown string>", level.gametypebundle.var_3b841d10cb84cb06);
        }
    #/
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3308
// Size: 0x73
function function_a2e6be25493acaed() {
    /#
        foreach (player in level.players) {
            player scripts/mp/hud_message::function_51614e8fce37b07f("<unknown string>", level.gametypebundle.var_3b841d10cb84cb06);
        }
    #/
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3382
// Size: 0xd
function function_53da610a95ce4073() {
    /#
        function_b203ef9def1f8c74();
    #/
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3396
// Size: 0x5b
function function_bb509befa79c026() {
    /#
        foreach (player in level.players) {
            function_a7456cf75cba76b2(player);
        }
    #/
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33f8
// Size: 0x11a
function function_ca18c921f35b6ef() {
    /#
        level endon("<unknown string>");
        while (true) {
            if (getdvarint(@"hash_ca96aac073a2fff9", 0)) {
                setdvar(@"hash_ca96aac073a2fff9", 0);
                host = scripts/mp/dev::devfindhost();
                if (!isdefined(host)) {
                    continue;
                }
                team = host.team;
                teamcount = getteamdata(team, "<unknown string>");
                while (level.teamdata[team]["<unknown string>"] > teamcount) {
                    function_cf18a42c2718cd59(host, team);
                    waitframe();
                }
            } else if (getdvarint(@"hash_cd3c9b7362869e5a", 0)) {
                setdvar(@"hash_ca96aac073a2fff9", 0);
                host = scripts/mp/dev::devfindhost();
                if (!isdefined(host)) {
                    continue;
                }
                team = scripts/engine/utility::get_enemy_team(host.team);
                teamcount = getteamdata(team, "<unknown string>");
                while (level.teamdata[team]["<unknown string>"] > teamcount) {
                    function_cf18a42c2718cd59(host, team);
                    waitframe();
                }
            }
            waitframe();
        }
    #/
}

// Namespace elim / scripts/mp/gametypes/elim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3519
// Size: 0xa5
function function_c9cb37cdd0caa2f4() {
    /#
        self endon("<unknown string>");
        while (true) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                scripts/mp/gamescore::giveteamscoreforobjective("<unknown string>", getdvarint(@"hash_46a6b424af6acbc2"), 0);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                scripts/mp/gamescore::giveteamscoreforobjective("<unknown string>", getdvarint(@"hash_86e14326e43c0115"), 0);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_c9cb37cdd0caa2f4();
    #/
}

