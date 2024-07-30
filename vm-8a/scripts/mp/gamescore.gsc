#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_4a6760982b403bad;
#using scripts\cp_mp\pet_watch.gsc;
#using scripts\mp\utility\dialog.gsc;
#using script_371b4c2ab5861e62;
#using scripts\mp\damage.gsc;
#using scripts\mp\rank.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_15eddb0fac236a22;

#namespace gamescore;

// Namespace gamescore / scripts\mp\gamescore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x737
// Size: 0xbb
function gethighestscoringteam() {
    highestscore = 0;
    highestteam = undefined;
    var_ca17acb9ea3fa61d = 0;
    foreach (entry in level.teamnamelist) {
        teamscore = game["teamScores"][entry];
        if (!isdefined(highestteam) || teamscore > highestscore) {
            highestscore = teamscore;
            highestteam = entry;
            var_ca17acb9ea3fa61d = 0;
            continue;
        }
        if (teamscore == highestscore) {
            var_ca17acb9ea3fa61d = 1;
        }
    }
    if (var_ca17acb9ea3fa61d) {
        return "tie";
    }
    return highestteam;
}

// Namespace gamescore / scripts\mp\gamescore
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7fa
// Size: 0xbb
function gethighestscore(ignoreteam) {
    highestscore = 0;
    highestteam = undefined;
    foreach (entry in level.teamnamelist) {
        if (isdefined(ignoreteam) && entry == ignoreteam) {
            continue;
        }
        teamscore = game["teamScores"][entry];
        if (!isdefined(highestteam) || teamscore > highestscore) {
            highestscore = teamscore;
            highestteam = entry;
        }
    }
    return [highestteam, game["teamScores"][highestteam]];
}

// Namespace gamescore / scripts\mp\gamescore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8be
// Size: 0xbe
function updateteamscoreplacements() {
    level notify("updateTeamScorePlacement");
    level endon("updateTeamScorePlacement");
    waittillframeend();
    teamssorted = tablesort(game["teamScores"], "down");
    currentscore = undefined;
    place = 0;
    foreach (team in teamssorted) {
        score = game["teamScores"][team];
        if (!isdefined(currentscore) || score < currentscore) {
            currentscore = score;
            place++;
        }
        game["teamPlacements"][team] = place;
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x984
// Size: 0x9
function getteamscoreplacements() {
    return game["teamPlacements"];
}

// Namespace gamescore / scripts\mp\gamescore
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x996
// Size: 0x2a
function compareteamscores(left, right) {
    return left.score > right.score;
}

// Namespace gamescore / scripts\mp\gamescore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c9
// Size: 0x33
function gethighestscoringplayer() {
    updateplacement();
    if (!level.placement["all"].size) {
        return undefined;
    }
    return level.placement["all"][0];
}

// Namespace gamescore / scripts\mp\gamescore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa04
// Size: 0x62
function ishighestscoringplayertied() {
    if (level.placement["all"].size > 1) {
        firstscore = _getplayerscore(level.placement["all"][0]);
        secondscore = _getplayerscore(level.placement["all"][1]);
        return (firstscore == secondscore);
    }
    return false;
}

// Namespace gamescore / scripts\mp\gamescore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6f
// Size: 0x94
function getlosingplayers() {
    updateplacement();
    players = level.placement["all"];
    losingplayers = [];
    foreach (player in players) {
        if (player == level.placement["all"][0]) {
            continue;
        }
        losingplayers[losingplayers.size] = player;
    }
    return losingplayers;
}

// Namespace gamescore / scripts\mp\gamescore
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0c
// Size: 0x3d1
function giveplayerscore(event, points, victim, eventinfo) {
    if (istrue(level.gameended)) {
        isvalidevent = 0;
        if (isarray(event)) {
            if (isnumber(level.gameendtime)) {
                if (event[1] <= level.gameendtime) {
                    isvalidevent = 1;
                    event = event[0];
                }
            }
        } else if (isdefined(event)) {
            isvalidevent = 1;
        }
        if (!isvalidevent) {
            return;
        }
    } else if (isarray(event)) {
        event = event[0];
    }
    if (istrue(level.ignorescoring)) {
        var_587eb1f4e11a34f3 = 1;
        var_e7a7e20ec68138e3 = game_utility::isbrstylegametype() && !flags::gameflag("prematch_done");
        if (var_e7a7e20ec68138e3) {
            var_587eb1f4e11a34f3 = 0;
        }
        if (var_587eb1f4e11a34f3) {
            return;
        }
    }
    if (!level.teambased) {
        foreach (player in level.players) {
            if (game_utility::issimultaneouskillenabled()) {
                if (player != self) {
                    continue;
                }
                if (level.roundscorelimit > 1 && player.pers["score"] >= level.roundscorelimit) {
                    return;
                }
                continue;
            }
            if (level.roundscorelimit > 1 && player.pers["score"] >= level.roundscorelimit) {
                return;
            }
        }
    }
    player = self;
    if (isdefined(self.owner) && !isbot(self)) {
        player = self.owner;
    }
    if (!isplayer(player)) {
        return;
    }
    originalpoints = points;
    if (isdefined(level.onplayerscore)) {
        points = [[ level.onplayerscore ]](event, player, points, victim, eventinfo);
    }
    if (points == 0) {
        return;
    }
    challenges::function_cf995e658ab79867(player, points);
    player.pers["score"] = int(max(player scripts\mp\utility\stats::getpersstat("score") + points, 0));
    if (level.var_27dcaf9644646944 == #"display_score") {
        player points::displayscoreeventpoints(originalpoints, event);
    }
    player namespace_26e1361ab951ec6b::addtoplayerstat(int(originalpoints), "matchStats", "score");
    assertex(isdefined(level.gamemodebundle.maxclientscore), "maxClientScore not defined for the current game mode");
    maxscore = level.gamemodebundle.maxclientscore;
    if (player scripts\mp\utility\stats::getpersstat("score") >= maxscore) {
        player.pers["score"] = maxscore;
    }
    player.score = player scripts\mp\utility\stats::getpersstat("score");
    var_67686728e255208b = player.score;
    player persistence::statsetchild("round", "score", var_67686728e255208b);
    player gamelogic::checkplayerscorelimitsoon();
    player thread gamelogic::checkscorelimit();
    player script::bufferednotify("earned_score_buffered", points);
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.player = player;
    var_7e2c53b0bcf117d9.scoreevent = event;
    namespace_c45ac99c4997e722::function_80820d6d364c1836("callback_player_score_event", var_7e2c53b0bcf117d9);
    player pet_watch::addobjectivescorecharge(event, int(originalpoints), eventinfo);
    params = {#event:event};
    player callback::callback(#"hash_d06b059fdd983fc3", params);
    player namespace_6b49ddb858f34366::function_4781d3b961760043();
}

// Namespace gamescore / scripts\mp\gamescore
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee5
// Size: 0x55
function _setplayerscore(player, score) {
    if (score == player scripts\mp\utility\stats::getpersstat("score")) {
        return;
    }
    if (score < 0) {
        return;
    }
    player.pers["score"] = score;
    player.score = score;
    player thread gamelogic::checkscorelimit();
}

// Namespace gamescore / scripts\mp\gamescore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf42
// Size: 0x1f
function _getplayerscore(player) {
    if (!isdefined(player)) {
        player = self;
    }
    return player scripts\mp\utility\stats::getpersstat("score");
}

// Namespace gamescore / scripts\mp\gamescore
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf6a
// Size: 0x7a
function function_6e6350a3296633f4(team) {
    sorted = [];
    if (level.teambased) {
        assert(teams::isgameplayteam(team));
        players = level.teamdata[team]["players"];
        sorted = utility::array_sort_with_func(players, &sortbyscore);
    } else {
        players = level.players;
        sorted = utility::array_sort_with_func(players, &sortbyscore);
    }
    return sorted;
}

// Namespace gamescore / scripts\mp\gamescore
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfed
// Size: 0x22
function sortbyscore(lhs, rhs) {
    return _getplayerscore(lhs) > _getplayerscore(rhs);
}

// Namespace gamescore / scripts\mp\gamescore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1018
// Size: 0x6c
function checkffascorejip() {
    if (!game_utility::matchmakinggame()) {
        return;
    }
    if (istrue(level.nojip)) {
        return;
    }
    if (level.roundscorelimit > 0) {
        scorepercentage = self.score / level.roundscorelimit * 100;
        if (scorepercentage > level.scorepercentagecutoff) {
            setnojipscore(1, 1);
            level.nojip = 1;
        }
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108c
// Size: 0x292
function giveteamscoreforobjective(team, score, allowtie, scoreevent, skipdialog, var_c6544e2c82d62dfb) {
    if (game_utility::cantiebysimultaneouskill()) {
        allowtie = 1;
    }
    if (!isdefined(allowtie)) {
        allowtie = 0;
    }
    if (istrue(level.gameended) && !allowtie) {
        return;
    }
    if (istrue(level.ignorescoring)) {
        return;
    }
    if (!teams::isgameplayteam(team)) {
        return;
    }
    if (istrue(level.dontendonscore) && _getteamscore(team) >= level.scorelimit) {
        return;
    }
    if (allowtie) {
        if (level.roundscorelimit > 1 && game["teamScores"][team] >= level.roundscorelimit) {
            return;
        }
    } else if (level.roundscorelimit > 1 && !istrue(level.dontendonscore)) {
        foreach (entry in level.teamnamelist) {
            if (game["teamScores"][entry] >= level.roundscorelimit) {
                return;
            }
        }
    }
    _setteamscore(team, _getteamscore(team) + score, allowtie);
    level notify("update_team_score", team, _getteamscore(team));
    if (isdefined(level.onteamscore)) {
        [[ level.onteamscore ]](team, _getteamscore(team), scoreevent);
    }
    if (isdefined(var_c6544e2c82d62dfb)) {
        winningteam = var_c6544e2c82d62dfb;
    } else {
        winningteam = calculatewinningteam(allowtie);
    }
    if (!istrue(skipdialog)) {
        playscorestatusdialog(winningteam, allowtie, level.waswinning);
    }
    if (winningteam != "none" && winningteam != "tie") {
        level.waswinning = winningteam;
        teamscore = _getteamscore(winningteam);
        scorelimit = level.roundscorelimit;
        if (teamscore == 0 || scorelimit == 0) {
            return;
        }
        scorepercentage = teamscore / scorelimit * 100;
        if (!game_utility::isroundbased() && isdefined(level.nojip) && !level.nojip) {
            if (scorepercentage > level.scorepercentagecutoff) {
                setnojipscore(1, 1);
                level.nojip = 1;
            }
        }
    }
    if (!level.onlinegame) {
        loggamescore();
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1326
// Size: 0x12b
function playscorestatusdialog(winningteam, allowtie, waswinning) {
    if (!level.splitscreen && winningteam != "none" && winningteam != waswinning && gettime() - level.lastscorestatustime > 5000 && game_utility::getscorelimit() != 1) {
        if (isdefined(level.delayleadtakendialog)) {
            level thread playleadtakendialog(allowtie);
            return;
        }
        if (winningteam == "none" && waswinning != "none") {
            foreach (team in level.teamnamelist) {
                dialog::leaderdialog("lead_tied", team, "status");
            }
            return;
        }
        level.lastscorestatustime = gettime();
        dialog::leaderdialog("lead_taken", winningteam, "status");
        if (waswinning != "none") {
            dialog::leaderdialog("lead_lost", waswinning, "status");
        }
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1459
// Size: 0x12f
function playleadtakendialog(allowtie) {
    wait level.delayleadtakendialog;
    level.lastscorestatustime = gettime();
    winningteam = calculatewinningteam(allowtie);
    if (winningteam == "none" && level.waswinning != "none") {
        foreach (team in level.teamnamelist) {
            dialog::leaderdialog("lead_tied", team, "status");
        }
        return;
    }
    dialog::leaderdialog("lead_taken", winningteam, "status");
    foreach (entry in level.teamnamelist) {
        if (entry != winningteam) {
            dialog::leaderdialog("lead_lost", entry, "status");
        }
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1590
// Size: 0x13e
function calculatewinningteam(allowtie) {
    assert(level.teambased == 1);
    teams_list = level.teamnamelist;
    if (!isdefined(level.waswinning)) {
        level.waswinning = "none";
    }
    winning_team = "none";
    winning_score = 0;
    if (level.waswinning != "none") {
        winning_team = level.waswinning;
        winning_score = game["teamScores"][level.waswinning];
    }
    var_2ec641b1e117731e = 1;
    foreach (teamname in teams_list) {
        if (teamname == level.waswinning) {
            continue;
        }
        if (game["teamScores"][teamname] > winning_score) {
            winning_team = teamname;
            winning_score = game["teamScores"][teamname];
            var_2ec641b1e117731e = 1;
            continue;
        }
        if (game["teamScores"][teamname] == winning_score) {
            var_2ec641b1e117731e += 1;
            winning_team = "none";
        }
    }
    return winning_team;
}

// Namespace gamescore / scripts\mp\gamescore
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d7
// Size: 0x5d
function _setteamscore(team, teamscore, allowtie) {
    if (teamscore < 0) {
        teamscore = 0;
    }
    if (teamscore == game["teamScores"][team]) {
        return;
    }
    game["teamScores"][team] = teamscore;
    updateteamscore(team);
    if (!istrue(level.dontendonscore)) {
        thread gamelogic::roundend_checkscorelimit(team, allowtie);
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x173c
// Size: 0x74
function updateteamscore(team) {
    assert(level.teambased);
    teamscore = 0;
    if (!game_utility::isroundbased() || !game_utility::isobjectivebased() || game_utility::ismoddedroundgame()) {
        teamscore = _getteamscore(team);
    } else {
        teamscore = game["roundsWon"][team];
    }
    setteamscore(team, int(teamscore));
    level thread updateteamscoreplacements();
}

// Namespace gamescore / scripts\mp\gamescore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b8
// Size: 0x155
function updatetotalteamscore(team) {
    assert(level.teambased);
    if (!isdefined(game["totalScore"])) {
        game["totalScore"] = [];
        foreach (entry in level.teamnamelist) {
            game["totalScore"][entry] = 0;
        }
    }
    wingamebytype = game_utility::getwingamebytype();
    switch (wingamebytype) {
    case #"hash_d1a3ced2d2675de8": 
        game["teamScores"][team] = game["roundsWon"][team];
        break;
    case #"hash_a25a6e74ab817a7f": 
        if (game_utility::inovertime()) {
            game["teamScores"][team] = game["preOvertimeScore"][team] + game["overtimeScore"][team] + game["teamScores"][team];
        } else if (game_utility::resetscoreonroundstart()) {
            game["totalScore"][team] = game["totalScore"][team] + game["teamScores"][team];
            game["teamScores"][team] = game["totalScore"][team];
        }
        break;
    }
    setteamscore(team, int(game["teamScores"][team]));
}

// Namespace gamescore / scripts\mp\gamescore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1915
// Size: 0x2c9
function updateovertimescore() {
    if (game["overtimeRoundsPlayed"] == 0) {
        if (!isdefined(game["preOvertimeScore"])) {
            game["preOvertimeScore"] = [];
            foreach (entry in level.teamnamelist) {
                game["preOvertimeScore"][entry] = 0;
            }
        }
        foreach (entry in level.teamnamelist) {
            game["preOvertimeScore"][entry] = game["teamScores"][entry] + game["totalScore"][entry];
        }
    }
    if (!isdefined(game["overtimeScore"])) {
        game["overtimeScore"] = [];
        foreach (entry in level.teamnamelist) {
            game["overtimeScore"][entry] = 0;
        }
    }
    foreach (entry in level.teamnamelist) {
        game["overtimeScore"][entry] = game["overtimeScore"][entry] + game["teamScores"][entry] - game["preOvertimeScore"][entry];
    }
    if (!game_utility::iswinbytworulegametype()) {
        game["teamScores"][game["attackers"]] = 0;
        setteamscore(game["attackers"], 0);
        game["teamScores"][game["defenders"]] = 0;
        setteamscore(game["defenders"], 0);
        if (game_utility::istimetobeatvalid() && game["timeToBeatTeam"] == game["attackers"]) {
            game["teamScores"][game["attackers"]] = game["timeToBeatScore"];
            updateteamscore(game["attackers"]);
            game["overtimeScore"][game["attackers"]] = game["overtimeScore"][game["attackers"]] - game["timeToBeatScore"];
        }
        if (game_utility::istimetobeatvalid() && game["timeToBeatTeam"] == game["defenders"]) {
            game["teamScores"][game["defenders"]] = game["timeToBeatScore"];
            updateteamscore(game["defenders"]);
            game["overtimeScore"][game["defenders"]] = game["overtimeScore"][game["defenders"]] - game["timeToBeatScore"];
        }
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be6
// Size: 0x19
function _getteamscore(team) {
    return int(game["teamScores"][team]);
}

// Namespace gamescore / scripts\mp\gamescore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c08
// Size: 0xfe
function removedisconnectedplayerfromplacement() {
    if (!isdefined(level.placement) || !isdefined(level.placement["all"])) {
        return;
    }
    offset = 0;
    numplayers = level.placement["all"].size;
    found = 0;
    for (i = 0; i < numplayers; i++) {
        if (level.placement["all"][i] == self) {
            found = 1;
        }
        if (found) {
            level.placement["all"][i] = level.placement["all"][i + 1];
        }
    }
    if (!found) {
        return;
    }
    level.placement["all"][numplayers - 1] = undefined;
    assert(level.placement["all"].size == numplayers - 1);
    if (level.teambased) {
        updateteamplacement();
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d0e
// Size: 0x1a5
function updateplacement() {
    if (isdefined(level.placement) && isdefined(level.placement["all"]) && isdefined(level.placementtime) && level.placementtime == gettime()) {
        return;
    }
    placement = [];
    level.placementtime = gettime();
    foreach (player in level.players) {
        if (isdefined(player.connectedpostgame)) {
            continue;
        }
        playerteam = player scripts\mp\utility\stats::getpersstat("team");
        if (playerteam == "spectator" || playerteam == "codcaster" || playerteam == "none") {
            continue;
        }
        if (isdefined(level.lastplayerwins)) {
            if (player == level.lastplayerwins) {
                player.lastplayerwins = 1;
            } else {
                player.lastplayerwins = 0;
            }
        }
        placement[placement.size] = player;
    }
    if (isdefined(level.lastplayerwins)) {
        level.placement["all"] = sort(placement, "lastPlayerWins", 1, "score", 1, "deaths");
    } else {
        level.placement["all"] = sort(placement, "score", 1, "deaths");
    }
    if (level.teambased) {
        updateteamplacement();
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ebb
// Size: 0xf3
function updateteamplacement() {
    assert(level.teambased);
    foreach (entry in level.teamnamelist) {
        level.placement[entry] = [];
    }
    foreach (player in level.placement["all"]) {
        team = player scripts\mp\utility\stats::getpersstat("team");
        level.placement[team][level.placement[team].size] = player;
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb6
// Size: 0x33
function processassist(killedplayer, objweapon, bonusmagnitude) {
    if (isdefined(level.assists_disabled)) {
        return;
    }
    processassist_regularmp(killedplayer, objweapon, bonusmagnitude);
}

// Namespace gamescore / scripts\mp\gamescore
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ff1
// Size: 0x307
function processassist_regularmp(killedplayer, objweapon, bonusmagnitude) {
    self endon("disconnect");
    killedplayer endon("disconnect");
    if (isagent(self)) {
        return;
    }
    if (isdefined(objweapon) && objweapon.basename == "white_phosphorus_proj_mp") {
        return;
    }
    if (!isdefined(bonusmagnitude)) {
        bonusmagnitude = 0;
    }
    eventtime = gettime();
    var_4928d7738ebe2222 = isagent(killedplayer);
    victimteam = undefined;
    if (var_4928d7738ebe2222) {
        victimteam = agent_utils::agentpers_getagentpersdata(killedplayer, "team");
    } else {
        victimteam = killedplayer.pers["team"];
    }
    wait 0.05;
    script::waittillslowprocessallowed();
    var_b47248e0c4294fa4 = self.pers["team"];
    if (!teams::isgameplayteam(var_b47248e0c4294fa4)) {
        return;
    }
    if (isdefined(victimteam) && var_b47248e0c4294fa4 == victimteam && level.teambased) {
        return;
    }
    if (istrue(level.gamemodebundle.var_198508771f0592a9)) {
        damage::playerincrementscoreboardkills();
        thread points::doScoreEvent(#"elimination_assist", objweapon, undefined, undefined, killedplayer);
    } else {
        pointsoverride = undefined;
        xpoverride = undefined;
        event = #"assist";
        if (!level.teambased) {
            event = #"assist_ffa";
        }
        points = rank::getscoreinfovalue(event);
        xp = rank::getscoreinfoxp(event);
        if (!level.teambased) {
            xpoverride = xp + xp * bonusmagnitude;
            pointsoverride = points + points * bonusmagnitude;
            thread points::doScoreEvent(#"assist_ffa", objweapon, pointsoverride, xpoverride);
        } else {
            xpoverride = xp + xp * bonusmagnitude;
            pointsoverride = points + points * bonusmagnitude;
            thread points::doScoreEvent([#"assist", eventtime], objweapon, pointsoverride, xpoverride);
        }
        if (!var_4928d7738ebe2222) {
            function_5a48de6e3fb64115();
            script::bufferednotify("assist_buffered", self.modifiers);
            thread challenges::function_247ba07507f78ac2(killedplayer, self);
            if (isdefined(level.var_561addf876799987)) {
                self [[ level.var_561addf876799987 ]]("assist");
            }
        }
    }
    if (level.teambased) {
        nearplayers = utility::playersinsphere(self.origin, 300);
        foreach (player in nearplayers) {
            if (self.team != player.team || self == player) {
                continue;
            }
            if (!player::isreallyalive(player)) {
                continue;
            }
            self.modifiers["buddy_kill"] = 1;
            break;
        }
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2300
// Size: 0xb6
function function_5a48de6e3fb64115() {
    var_715d1ac74d3ba31a = self;
    if (!scripts\cp_mp\utility\game_utility::function_d04af493b6e718ac()) {
        var_715d1ac74d3ba31a addtoplayerstat(1, "combatStats", "assists");
    }
    if (isdefined(var_715d1ac74d3ba31a.pers) && isdefined(var_715d1ac74d3ba31a.pers["assists"]) && var_715d1ac74d3ba31a.pers["assists"] < 999) {
        var_715d1ac74d3ba31a incpersstat("assists", 1);
        var_715d1ac74d3ba31a.assists = var_715d1ac74d3ba31a getpersstat("assists");
        var_715d1ac74d3ba31a scripts\mp\persistence::statsetchild("round", "assists", var_715d1ac74d3ba31a.assists, level.ignorekdrstats);
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23be
// Size: 0x21
function processshieldassist(killedplayer) {
    if (isdefined(level.assists_disabled)) {
        return;
    }
    processshieldassist_regularmp(killedplayer);
}

// Namespace gamescore / scripts\mp\gamescore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23e7
// Size: 0x115
function processshieldassist_regularmp(killedplayer) {
    self endon("disconnect");
    killedplayer endon("disconnect");
    wait 0.05;
    script::waittillslowprocessallowed();
    if (!teams::isgameplayteam(self.pers["team"])) {
        return;
    }
    if (self.pers["team"] == killedplayer.pers["team"]) {
        return;
    }
    thread points::doScoreEvent(#"shield_assist");
    if (!scripts\cp_mp\utility\game_utility::function_d04af493b6e718ac()) {
        namespace_26e1361ab951ec6b::addtoplayerstat(1, "combatStats", "assists");
    }
    if (self.pers["assists"] < 998) {
        stats::incpersstat("assists", 1);
        self.assists = stats::getpersstat("assists");
        persistence::statsetchild("round", "assists", self.assists, level.ignorekdrstats);
    }
    thread challenges::function_247ba07507f78ac2(killedplayer, self);
    if (isdefined(level.var_561addf876799987)) {
        self [[ level.var_561addf876799987 ]]("assist");
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2504
// Size: 0x1e
function initassisttrackers() {
    self notify("initAssistTrackers");
    self.buffedbyplayers = [];
    self.debuffedbyplayers = [];
}

// Namespace gamescore / scripts\mp\gamescore
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x252a
// Size: 0xa2
function trackdebuffassist(attacker, victim, weapon) {
    if (game_utility::runleanthreadmode()) {
        return;
    }
    assertex(isdefined(victim.debuffedbyplayers), "trackDebuffAssist called on a victim with undefined .debuffedByPlayers.");
    if (!isdefined(victim.debuffedbyplayers[weapon])) {
        victim.debuffedbyplayers[weapon] = [];
    }
    if (!isdefined(victim.debuffedbyplayers[weapon][attacker getentitynumber()])) {
        victim.debuffedbyplayers[weapon][attacker getentitynumber()] = 0;
    }
    victim.debuffedbyplayers[weapon][attacker getentitynumber()]++;
}

// Namespace gamescore / scripts\mp\gamescore
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d4
// Size: 0x14d
function untrackdebuffassist(attacker, victim, weapon) {
    if (game_utility::runleanthreadmode()) {
        return;
    }
    assertex(isdefined(victim.debuffedbyplayers), "untrackDebuffAssist called on a victim with undefined .debuffedByPlayers.");
    if (isdefined(attacker)) {
        if (isdefined(victim.debuffedbyplayers[weapon]) && isdefined(victim.debuffedbyplayers[weapon][attacker getentitynumber()])) {
            victim.debuffedbyplayers[weapon][attacker getentitynumber()]--;
            assertex(victim.debuffedbyplayers[weapon][attacker getentitynumber()] >= 0, "untrackDebuffAssist called more times than trackDebuffAssist.");
            canremove = 1;
            foreach (value in victim.debuffedbyplayers[weapon]) {
                if (value > 0) {
                    canremove = 0;
                    break;
                }
            }
            if (canremove && isdefined(weapon) && isdefined(victim.debuffedbyplayers)) {
                victim.debuffedbyplayers[weapon] = undefined;
            }
            return;
        }
        assertmsg("untrackDebuffAssist called more times than trackDebuffAssist.");
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2729
// Size: 0x5f
function trackdebuffassistfortime(attacker, victim, weapon, duration) {
    if (game_utility::runleanthreadmode()) {
        return;
    }
    victim endon("initAssistTrackers");
    victim endon("disconnect");
    attacker endon("disconnect");
    level endon("game_ended");
    trackdebuffassist(attacker, victim, weapon);
    wait duration;
    untrackdebuffassist(attacker, victim, weapon);
}

// Namespace gamescore / scripts\mp\gamescore
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2790
// Size: 0xb9
function isdebuffedbyweapon(victim, weapon) {
    if (game_utility::runleanthreadmode()) {
        return false;
    }
    assertex(isdefined(victim.debuffedbyplayers), "isDebuffedByWeapon called on a victim with undefined .debuffedByPlayers.");
    if (isdefined(victim.debuffedbyplayers[weapon])) {
        foreach (playerentitynumber, var_5aec7759028b3ada in victim.debuffedbyplayers[weapon]) {
            if (var_5aec7759028b3ada <= 0) {
                continue;
            }
            if (!isdefined(level.playersbyentitynumber[playerentitynumber])) {
                continue;
            }
            return true;
        }
    }
    return false;
}

// Namespace gamescore / scripts\mp\gamescore
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2852
// Size: 0x8a
function isdebuffedbyweaponandplayer(attacker, victim, weapon) {
    if (game_utility::runleanthreadmode()) {
        return false;
    }
    assertex(isdefined(victim.debuffedbyplayers), "isDebuffedByWeaponAndPlayer called on a victim with undefined .debuffedByPlayers.");
    if (!isdefined(victim.debuffedbyplayers[weapon])) {
        return false;
    }
    if (!isdefined(victim.debuffedbyplayers[weapon][attacker getentitynumber()])) {
        return false;
    }
    if (victim.debuffedbyplayers[weapon][attacker getentitynumber()] <= 0) {
        return false;
    }
    return true;
}

// Namespace gamescore / scripts\mp\gamescore
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28e5
// Size: 0xdb
function getdebuffattackersbyweapon(victim, weapon) {
    if (game_utility::runleanthreadmode()) {
        return undefined;
    }
    assertex(isdefined(victim.debuffedbyplayers), "getDebuffAttackersByWeapon called on a victim with undefined .debuffedByPlayers.");
    var_a676df5d3d80a259 = [];
    if (isplayer(victim)) {
        if (isdefined(victim.debuffedbyplayers[weapon])) {
            foreach (playerentitynumber, var_5aec7759028b3ada in victim.debuffedbyplayers[weapon]) {
                if (var_5aec7759028b3ada <= 0) {
                    continue;
                }
                if (!isdefined(level.playersbyentitynumber[playerentitynumber])) {
                    continue;
                }
                var_a676df5d3d80a259[var_a676df5d3d80a259.size] = level.playersbyentitynumber[playerentitynumber];
            }
        }
    }
    return var_a676df5d3d80a259;
}

// Namespace gamescore / scripts\mp\gamescore
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c9
// Size: 0xa8
function trackbuffassist(player, teammate, weapon) {
    if (game_utility::runleanthreadmode()) {
        return;
    }
    assertex(isdefined(teammate.buffedbyplayers), "trackBuffAssist called on a teammate with undefined .buffedByPlayers.");
    if (player != teammate) {
        if (!isdefined(teammate.buffedbyplayers[weapon])) {
            teammate.buffedbyplayers[weapon] = [];
        }
        if (!isdefined(teammate.buffedbyplayers[weapon][player getentitynumber()])) {
            teammate.buffedbyplayers[weapon][player getentitynumber()] = 0;
        }
        teammate.buffedbyplayers[weapon][player getentitynumber()]++;
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a79
// Size: 0xce
function untrackbuffassist(player, teammate, weapon) {
    if (game_utility::runleanthreadmode()) {
        return;
    }
    assertex(isdefined(teammate.buffedbyplayers), "untrackBuffAssist called on a teammate with undefined .buffedByPlayers.");
    if (isdefined(teammate)) {
        if (isdefined(teammate.buffedbyplayers[weapon]) && isdefined(teammate.buffedbyplayers[weapon][player getentitynumber()])) {
            teammate.buffedbyplayers[weapon][player getentitynumber()]--;
            assertex(teammate.buffedbyplayers[weapon][player getentitynumber()] >= 0, "untrackBuffAssist called more times than trackBuffAssist.");
            return;
        }
        assertex(teammate.buffedbyplayers[weapon][player getentitynumber()] >= 0, "untrackBuffAssist called more times than trackBuffAssist.");
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2b4f
// Size: 0x5f
function trackbuffassistfortime(player, teammate, weapon, duration) {
    if (game_utility::runleanthreadmode()) {
        return;
    }
    teammate endon("initAssistTrackers");
    teammate endon("disconnect");
    player endon("disconnect");
    level endon("game_ended");
    trackbuffassist(player, teammate, weapon);
    wait duration;
    untrackbuffassist(player, teammate, weapon);
}

// Namespace gamescore / scripts\mp\gamescore
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb6
// Size: 0x2dd
function awardbuffdebuffassists(attacker, victim) {
    if (game_utility::runleanthreadmode()) {
        return;
    }
    var_63669ae0c61d1484 = [];
    assertex(isdefined(victim.debuffedbyplayers), "awardBuffDebuffAssists called on a victim with undefined .debuffedByPlayers");
    foreach (weaponlist in victim.debuffedbyplayers) {
        foreach (playerentitynumber, var_5aec7759028b3ada in weaponlist) {
            if (var_5aec7759028b3ada <= 0) {
                continue;
            }
            player = level.playersbyentitynumber[playerentitynumber];
            if (isdefined(player) && player.team != "spectator" && player.team != "codcaster" && player player_utility::isenemy(victim)) {
                index = player.guid;
                if (!isdefined(var_63669ae0c61d1484[index])) {
                    var_63669ae0c61d1484[index] = player;
                }
            }
        }
    }
    assertex(isdefined(attacker.buffedbyplayers), "awardBuffDebuffAssists called on an attacker with undefined .buffedByPlayers");
    foreach (weaponlist in attacker.buffedbyplayers) {
        foreach (playerentitynumber, buffcount in weaponlist) {
            if (buffcount <= 0) {
                continue;
            }
            player = level.playersbyentitynumber[playerentitynumber];
            if (isdefined(player) && player.team != "spectator" && player.team != "codcaster" && player player_utility::isenemy(victim)) {
                index = player.guid;
                if (!isdefined(var_63669ae0c61d1484[index])) {
                    var_63669ae0c61d1484[index] = player;
                }
            }
        }
    }
    foreach (index, player in var_63669ae0c61d1484) {
        if (!isdefined(victim.attackerdata) || !isdefined(victim.attackerdata[player.guid])) {
            damage::addattacker(victim, player, undefined, nullweapon(), 0, undefined, undefined, undefined, undefined, undefined);
        }
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e9b
// Size: 0xff
function function_6251f7723be2f90c(victim, var_10f37e0e73fd3a4c) {
    attacker = self;
    if (isdefined(attacker.team) && scripts\engine\utility::issharedfuncdefined("game", "getTeamData")) {
        attackersquad = [[ scripts\engine\utility::getsharedfunc("game", "getTeamData") ]](attacker.team, "alivePlayers");
        if (isdefined(var_10f37e0e73fd3a4c)) {
            if (!isarray(var_10f37e0e73fd3a4c)) {
                var_10f37e0e73fd3a4c = [var_10f37e0e73fd3a4c];
            }
            attackersquad = array_remove_array(attackersquad, var_10f37e0e73fd3a4c);
        }
        foreach (squadmate in attackersquad) {
            if (istrue(squadmate.var_632bad3edb4e449e) && istrue(level.var_3da7cf812433fd50)) {
                continue;
            }
            squadmate function_5a687b65c904b197(attacker, victim);
        }
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fa2
// Size: 0x70
function function_5a687b65c904b197(attacker, victim, team) {
    var_a7bcc27d58860046 = self;
    if (var_a7bcc27d58860046 != attacker) {
        if (isdefined(team) && var_a7bcc27d58860046.team != team) {
            return;
        }
        var_a7bcc27d58860046 thread scripts\cp_mp\challenges::function_817629c461ea3540(victim, var_a7bcc27d58860046, attacker);
        if (isdefined(level.var_561addf876799987)) {
            var_a7bcc27d58860046 [[ level.var_561addf876799987 ]]("unassisted", victim);
        }
    }
}

// Namespace gamescore / scripts\mp\gamescore
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x301a
// Size: 0x1d
function gamemodeusesdeathmatchscoring(mode) {
    return mode == "dm" || mode == "sotf_ffa";
}

// Namespace gamescore / scripts\mp\gamescore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3040
// Size: 0x95
function loggamescore() {
    teamname1 = level.teamnamelist[0];
    teamname2 = level.teamnamelist[1];
    teamscore1 = getteamscore(teamname1);
    teamscore2 = getteamscore(teamname2);
    dlog_recordevent("dlog_event_score_change", ["team_1_name", teamname1, "team_2_name", teamname2, "team_1_score", teamscore1, "team_2_score", teamscore2]);
}

