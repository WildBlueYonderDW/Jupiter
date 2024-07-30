#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using script_3f8889c16399185c;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\rank.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace scoreboard;

// Namespace scoreboard / scripts\mp\scoreboard
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f2
// Size: 0x5e
function processlobbyscoreboards() {
    processmatchscoreboardinfo();
    foreach (player in level.players) {
        processcommonplayerdataforplayer(player);
    }
}

// Namespace scoreboard / scripts\mp\scoreboard
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x458
// Size: 0x58b
function processmatchscoreboardinfo() {
    if (level.multiteambased) {
        buildscoreboardtype("multiteam");
        foreach (player in level.players) {
            player setplayerdata("common", "round", "scoreboardType", "multiteam");
        }
        alliesscore = getteamscore("allies");
        axisscore = getteamscore("axis");
        team3Score = getteamscore("team_three");
        if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
            setclientmatchdata("alliesScore", alliesscore);
            setclientmatchdata("axisScore", axisscore);
            setclientmatchdata("team3Score", team3Score);
            setclientmatchdata("scoreProgressLimit", getomnvar("ui_scorelimit"));
            setclientmatchdata("alliesKills", -1);
            setclientmatchdata("alliesDeaths", -1);
        }
        return;
    }
    if (level.teambased) {
        alliesscore = getteamscore("allies");
        axisscore = getteamscore("axis");
        kills = 0;
        deaths = 0;
        foreach (player in level.players) {
            if (isdefined(player scripts\mp\utility\stats::getpersstat("team")) && player scripts\mp\utility\stats::getpersstat("team") == "allies") {
                kills += player scripts\mp\utility\stats::getpersstat("kills");
                deaths += player scripts\mp\utility\stats::getpersstat("deaths");
            }
        }
        winner = "tie";
        if (inovertime()) {
            if (istimetobeatrulegametype()) {
                if (game["timeToBeatTeam"] == "none") {
                    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
                        setclientmatchdata("alliesTTB", 0);
                        setclientmatchdata("axisTTB", 0);
                    }
                    winner = "tie";
                } else {
                    if ("allies" == game["timeToBeatTeam"]) {
                        alliesscore++;
                    } else {
                        axisscore++;
                    }
                    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
                        setclientmatchdata("alliesTTB", ter_op("allies" == game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                        setclientmatchdata("axisTTB", ter_op("axis" == game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                    }
                    winner = game["timeToBeatTeam"];
                }
            } else if (isscoretobeatrulegametype()) {
            }
        } else if (alliesscore == axisscore) {
            winner = "tie";
        } else if (alliesscore > axisscore) {
            winner = "allies";
        } else {
            winner = "axis";
        }
        if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
            setclientmatchdata("alliesScore", alliesscore);
            setclientmatchdata("axisScore", axisscore);
            setclientmatchdata("scoreProgressLimit", getomnvar("ui_scorelimit"));
            setclientmatchdata("alliesKills", kills);
            setclientmatchdata("alliesDeaths", deaths);
        }
        if (winner == "tie") {
            buildscoreboardtype("allies");
            buildscoreboardtype("axis");
            foreach (player in level.players) {
                var_e59c38a3a9665cfb = player scripts\mp\utility\stats::getpersstat("team");
                if (!isdefined(var_e59c38a3a9665cfb)) {
                    continue;
                }
                if (var_e59c38a3a9665cfb == "spectator" || var_e59c38a3a9665cfb == "codcaster") {
                    player setplayerdata("common", "round", "scoreboardType", "allies");
                    continue;
                }
                player setplayerdata("common", "round", "scoreboardType", var_e59c38a3a9665cfb);
            }
        } else {
            buildscoreboardtype(winner);
            foreach (player in level.players) {
                player setplayerdata("common", "round", "scoreboardType", winner);
            }
        }
        return;
    }
    buildscoreboardtype("neutral");
    foreach (player in level.players) {
        player setplayerdata("common", "round", "scoreboardType", "neutral");
    }
    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
        setclientmatchdata("alliesScore", -1);
        setclientmatchdata("axisScore", -1);
        setclientmatchdata("scoreProgressLimit", getomnvar("ui_scorelimit"));
        setclientmatchdata("alliesKills", -1);
        setclientmatchdata("alliesDeaths", -1);
    }
}

// Namespace scoreboard / scripts\mp\scoreboard
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9eb
// Size: 0x1d5
function processcommonplayerdataforplayer(player) {
    var_851e1b97814c1a58 = player scripts\mp\utility\stats::getpersstat("summary");
    if (isdefined(var_851e1b97814c1a58)) {
        player setplayerdata("common", "round", "totalXp", var_851e1b97814c1a58["xp"]);
        player setplayerdata("common", "round", "scoreXp", var_851e1b97814c1a58["score"]);
        player setplayerdata("common", "round", "challengeXp", var_851e1b97814c1a58["challenge"]);
        player setplayerdata("common", "round", "matchXp", var_851e1b97814c1a58["match"]);
        player setplayerdata("common", "round", "miscXp", var_851e1b97814c1a58["misc"]);
        player setplayerdata("common", "round", "medalXp", var_851e1b97814c1a58["medal"]);
        player setplayerdata("common", "common_entitlement_xp", var_851e1b97814c1a58["bonusXP"]);
    }
    var_97b1e872968f2e54 = player scripts\mp\utility\stats::getpersstat("aarData");
    if (isdefined(var_97b1e872968f2e54)) {
        player setplayerdata("common", "round", "aarData", "combat_xp", var_97b1e872968f2e54["combat_xp"]);
        player setplayerdata("common", "round", "aarData", "support_xp", var_97b1e872968f2e54["support_xp"]);
        player setplayerdata("common", "round", "aarData", "strategy_xp", var_97b1e872968f2e54["strategy_xp"]);
        player setplayerdata("common", "round", "aarData", "logistics_xp", var_97b1e872968f2e54["logistics_xp"]);
        player setplayerdata("common", "round", "aarData", "recon_xp", var_97b1e872968f2e54["recon_xp"]);
        player setplayerdata("common", "round", "aarData", "use_featured_operator_skin_xp", var_97b1e872968f2e54["use_featured_operator_skin_xp"]);
    }
}

// Namespace scoreboard / scripts\mp\scoreboard
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc8
// Size: 0xb53
function setplayerscoreboardinfo() {
    if (getdvarint(@"hash_1bc373211683e0b6") == 0) {
        return;
    }
    scoreboardPlayerCount = getclientmatchdata("scoreboardPlayerCount");
    if (scoreboardPlayerCount < 200) {
        if (isdefined(scripts\mp\utility\stats::getpersstat("score"))) {
            setclientmatchdata("players", self.clientmatchdataid, "score", scripts\mp\utility\stats::getpersstat("score"));
            println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:x2c>" + scripts\mp\utility\stats::getpersstat("<dev string:x38>"));
        }
        if (isdefined(scripts\mp\utility\stats::getpersstat("kills"))) {
            kills = scripts\mp\utility\stats::getpersstat("kills");
            setclientmatchdata("players", self.clientmatchdataid, "kills", kills);
            println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:x3e>" + kills);
        }
        if (getgametype() == "dm" || getgametype() == "gun") {
            assists = self.assists;
        } else if (isdefined(scripts\mp\utility\stats::getpersstat("assists"))) {
            assists = scripts\mp\utility\stats::getpersstat("assists");
        } else {
            assists = 0;
        }
        setclientmatchdata("players", self.clientmatchdataid, "assists", assists);
        println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:x4a>" + assists);
        if (isdefined(scripts\mp\utility\stats::getpersstat("deaths"))) {
            deaths = scripts\mp\utility\stats::getpersstat("deaths");
            setclientmatchdata("players", self.clientmatchdataid, "deaths", deaths);
            println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:x58>" + deaths);
        }
        if (isdefined(scripts\mp\utility\stats::getpersstat("team"))) {
            team = scripts\mp\utility\stats::getpersstat("team");
            setclientmatchdata("players", self.clientmatchdataid, "team", team);
            println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:x65>" + team);
            if (isdefined(game[team])) {
                faction = game[team];
                setclientmatchdata("players", self.clientmatchdataid, "faction", faction);
                println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:x70>" + faction);
            }
        }
        if (isdefined(scripts\mp\utility\stats::getpersstat("extrascore0"))) {
            extrascore0 = scripts\mp\utility\stats::getpersstat("extrascore0");
            setclientmatchdata("players", self.clientmatchdataid, "extrascore0", extrascore0);
            println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:x7e>" + extrascore0);
        }
        if (isdefined(scripts\mp\utility\stats::getpersstat("extrascore1"))) {
            extrascore1 = scripts\mp\utility\stats::getpersstat("extrascore1");
            setclientmatchdata("players", self.clientmatchdataid, "extrascore1", extrascore1);
            println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:x90>" + extrascore1);
        }
        if (isdefined(self.timeplayed["total"])) {
            timeplayed = self.timeplayed["total"];
            setclientmatchdata("players", self.clientmatchdataid, "timeplayed", timeplayed);
            println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:xa2>" + timeplayed);
        }
        if (isdefined(scripts\mp\utility\stats::getpersstat("rank")) && isdefined(scripts\mp\utility\stats::getpersstat("rankxp"))) {
            rank = getrank();
            setclientmatchdata("players", self.clientmatchdataid, "rank", rank);
            println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:xb3>" + rank);
        }
        if (isdefined(scripts\mp\utility\stats::getpersstat("prestige"))) {
            prestige = scripts\mp\rank::getprestigelevel();
            setclientmatchdata("players", self.clientmatchdataid, "prestige", prestige);
            println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:xbe>" + prestige);
        }
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            var_7746ca3b56c9afd3 = scripts\mp\gametypes\br::calculateclientmatchdataextrainfopayload(self);
            assert(var_7746ca3b56c9afd3.size < 5);
            for (i = 0; i < var_7746ca3b56c9afd3.size; i++) {
                var_1abc650bb92e6e04 = "extrascore" + i;
                setclientmatchdata("players", self.clientmatchdataid, var_1abc650bb92e6e04, var_7746ca3b56c9afd3[i]);
                println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:xcd>" + var_1abc650bb92e6e04 + "<dev string:xd1>" + var_7746ca3b56c9afd3[i]);
            }
            if (getsubgametype() == "risk" || getsubgametype() == "plunder") {
                placements = scripts\mp\gamescore::getteamscoreplacements();
                placement = placements[self.team];
                assert(isdefined(placement), "Placement somehow undefined for team: " + self.team);
                if (isdefined(placement)) {
                    setclientmatchdata("players", self.clientmatchdataid, "placement", placement);
                }
                packedvalue = [[ scripts\engine\utility::getsharedfunc("plunder", "packClientMatchData") ]]();
                setclientmatchdata("players", self.clientmatchdataid, "extrascore4", packedvalue);
                lootcachesopened = 0;
                if (isdefined(self.lootcachesopened)) {
                    lootcachesopened = self.lootcachesopened;
                }
                setclientmatchdata("players", self.clientmatchdataid, "extrascore5", lootcachesopened);
            } else if (getsubgametype() == "kingslayer") {
                placements = scripts\mp\gamescore::getteamscoreplacements();
                placement = placements[self.team];
                setclientmatchdata("players", self.clientmatchdataid, "placement", placement);
                packedvalue = [[ scripts\engine\utility::getsharedfunc("kingslayer", "packClientMatchData") ]]();
                setclientmatchdata("players", self.clientmatchdataid, "extrascore4", packedvalue);
                lootcachesopened = 0;
                if (isdefined(self.lootcachesopened)) {
                    lootcachesopened = self.lootcachesopened;
                }
                setclientmatchdata("players", self.clientmatchdataid, "extrascore5", lootcachesopened);
            } else if (getsubgametype() == "resurgence") {
                if (isdefined(self.teamplacement)) {
                    setclientmatchdata("players", self.clientmatchdataid, "placement", self.teamplacement);
                }
                packedvalue = [[ scripts\engine\utility::getsharedfunc("resurgence", "packClientMatchData") ]]();
                setclientmatchdata("players", self.clientmatchdataid, "extrascore4", packedvalue);
                println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:xd5>" + packedvalue);
            } else if (getsubgametype() == "resurgence_mgl") {
                if (isdefined(self.teamplacement)) {
                    setclientmatchdata("players", self.clientmatchdataid, "placement", self.teamplacement);
                }
                packedvalue = [[ scripts\engine\utility::getsharedfunc("resurgence_mgl", "packClientMatchData") ]]();
                setclientmatchdata("players", self.clientmatchdataid, "extrascore4", packedvalue);
                println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:xd5>" + packedvalue);
            } else if (getsubgametype() == "champion") {
                if (isdefined(self.teamplacement)) {
                    setclientmatchdata("players", self.clientmatchdataid, "placement", self.teamplacement);
                }
                packedvalue = [[ scripts\engine\utility::getsharedfunc("champion", "packClientMatchData") ]]();
                setclientmatchdata("players", self.clientmatchdataid, "extrascore4", packedvalue);
                println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:xd5>" + packedvalue);
            } else if (getsubgametype() == "zonecontrol") {
                if (isdefined(self.teamplacement)) {
                    setclientmatchdata("players", self.clientmatchdataid, "placement", self.teamplacement);
                }
                packedvalue = [[ scripts\engine\utility::getsharedfunc("zonecontrol", "packClientMatchData") ]]();
                setclientmatchdata("players", self.clientmatchdataid, "extrascore4", packedvalue[0]);
                println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:xd5>" + packedvalue[0]);
                setclientmatchdata("players", self.clientmatchdataid, "extrascore5", packedvalue[1]);
                println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:xe9>" + packedvalue[1]);
            } else {
                if (isdefined(self.teamplacement)) {
                    setclientmatchdata("players", self.clientmatchdataid, "placement", self.teamplacement);
                }
                packedvalue = [[ scripts\engine\utility::getsharedfunc("br", "packClientMatchData") ]]();
                setclientmatchdata("players", self.clientmatchdataid, "extrascore4", packedvalue);
                println("<dev string:x1c>" + self.name + "<dev string:x2a>" + self.clientmatchdataid + "<dev string:xd5>" + packedvalue);
            }
        }
        println("<dev string:xfd>" + scoreboardPlayerCount);
        scoreboardPlayerCount++;
        setclientmatchdata("scoreboardPlayerCount", scoreboardPlayerCount);
        println("<dev string:x124>" + scoreboardPlayerCount);
        maxplayercount = getdvarint(@"hash_818c699a5caaee4f", 0);
        setclientmatchdata("maxPlayerCount", maxplayercount);
        return;
    }
    println("<dev string:x14b>" + scoreboardPlayerCount + "<dev string:x182>");
}

// Namespace scoreboard / scripts\mp\scoreboard
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1723
// Size: 0x61
function computescoreboardslot(team, index) {
    if (team == "none") {
        return (0 + index);
    }
    if (team == "neutral") {
        return (200 + index);
    }
    if (team == "allies") {
        return (400 + index);
    }
    if (team == "axis") {
        return (600 + index);
    }
    if (team == "multiteam") {
        return (800 + index);
    }
    return 0;
}

// Namespace scoreboard / scripts\mp\scoreboard
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178d
// Size: 0x3e5
function buildscoreboardtype(team) {
    if (getdvarint(@"hash_1bc373211683e0b6") == 0) {
        return;
    }
    assert(team == "allies" || team == "axis" || team == "neutral" || team == "multiteam");
    println("<dev string:x184>" + team + "<dev string:x182>");
    if (team == "multiteam" || getsubgametype() == "rumble_mgl") {
        index = 0;
        foreach (teamname in level.teamnamelist) {
            teammembers = undefined;
            if (isdefined(level.placement)) {
                teammembers = level.placement[teamname];
            }
            if (!isdefined(teammembers)) {
                teammembers = scripts\mp\utility\teams::getteamdata(teamname, "players");
            }
            foreach (player in teammembers) {
                scripts\mp\gamelogic::assignclientmatchdataid(player);
                setclientmatchdata("scoreboards", computescoreboardslot(team, index), player.clientmatchdataid);
                println("<dev string:x1a6>" + team + "<dev string:x1c1>" + index + "<dev string:x1c1>" + player.clientmatchdataid + "<dev string:x1c4>");
                index++;
            }
        }
        return;
    }
    if (team == "neutral") {
        index = 0;
        foreach (player in level.placement["all"]) {
            setclientmatchdata("scoreboards", computescoreboardslot(team, index), player.clientmatchdataid);
            println("<dev string:x1a6>" + team + "<dev string:x1c1>" + index + "<dev string:x1c1>" + player.clientmatchdataid + "<dev string:x1c4>");
            index++;
        }
        return;
    }
    otherteam = getotherteam(team)[0];
    index = 0;
    foreach (player in level.placement[team]) {
        setclientmatchdata("scoreboards", computescoreboardslot(team, index), player.clientmatchdataid);
        println("<dev string:x1a6>" + team + "<dev string:x1c1>" + index + "<dev string:x1c1>" + player.name + "<dev string:x2a>" + player.clientmatchdataid + "<dev string:x1c6>");
        index++;
    }
    foreach (player in level.placement[otherteam]) {
        setclientmatchdata("scoreboards", computescoreboardslot(team, index), player.clientmatchdataid);
        println("<dev string:x1a6>" + team + "<dev string:x1c1>" + index + "<dev string:x1c1>" + player.name + "<dev string:x2a>" + player.clientmatchdataid + "<dev string:x1c6>");
        index++;
    }
}

