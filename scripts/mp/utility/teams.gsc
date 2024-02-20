// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using script_18661c91de5b5195;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\player.gsc;

#namespace teams;

// Namespace teams/namespace_54d20dd0dd79277f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x504
// Size: 0x69
function getteamdata(team, property) {
    /#
        assertex(isdefined(level.teamdata[team]), "UNDEFINED level.teamData[" + team + "]");
    #/
    /#
        assertex(function_ef7cf07ba921200e(team, property), "UNDEFINED level.teamData[" + team + "][" + property + "]");
    #/
    return level.teamdata[team][property];
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x575
// Size: 0x83
function setteamdata(team, property, value) {
    /#
        assertex(isdefined(level.teamdata[team]), "UNDEFINED level.teamData[" + team + "]");
    #/
    /#
        assertex(function_ef7cf07ba921200e(team, property), "UNDEFINED level.teamData[" + team + "][" + property + "]");
    #/
    /#
        assertex(isdefined(value), "modifyTeamCount() undefined value");
    #/
    level.teamdata[team][property] = value;
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ff
// Size: 0x91
function modifyteamdata(team, property, value) {
    /#
        assertex(isdefined(level.teamdata[team]), "UNDEFINED level.teamData[" + team + "]");
    #/
    /#
        assertex(function_ef7cf07ba921200e(team, property), "UNDEFINED level.teamData[" + team + "][" + property + "]");
    #/
    /#
        assertex(isdefined(value), "modifyTeamCount() undefined value");
    #/
    level.teamdata[team][property] = level.teamdata[team][property] + value;
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x697
// Size: 0x44
function function_ef7cf07ba921200e(team, property) {
    /#
        assertex(isdefined(level.teamdata[team]), "UNDEFINED level.teamData[" + team + "]");
    #/
    return isdefined(level.teamdata[team][property]);
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e3
// Size: 0xca
function addplayertoteam(player, team, var_cf5d3f8f0d10e600) {
    /#
        assertex(!array_contains(level.teamdata[team]["players"], player), "Attempting to add a player to a team they are already on.");
    #/
    level.teamdata[team]["teamCount"]++;
    level.teamdata[team]["players"] = array_add(level.teamdata[team]["players"], player);
    /#
        if (level.teamdata[team]["alive_count"].size != level.teamdata[team]["exgm"]) {
            /#
                assertmsg("shortName");
            #/
        }
    #/
    if (var_cf5d3f8f0d10e600) {
        addtoteamlives(player, team, undefined, "addPlayerToTeam");
    }
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b4
// Size: 0xae
function removeplayerfromteam(player, team) {
    /#
        assertex(array_contains(level.teamdata[team]["players"], player), "Attempting to remove a player from a team they are not on.");
    #/
    level.teamdata[team]["teamCount"]--;
    level.teamdata[team]["players"] = array_remove(level.teamdata[team]["players"], player);
    /#
        if (level.teamdata[team]["alive_count"].size != level.teamdata[team]["exgm"]) {
            /#
                assertmsg("shortName");
            #/
        }
    #/
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x869
// Size: 0x185
function addtoteamlives(player, team, var_28335de6505d7e0c, context) {
    level.teamdata[team]["aliveCount"]++;
    level.teamdata[team]["alivePlayers"] = array_add(level.teamdata[team]["alivePlayers"], player);
    if (level.multiteambased) {
        level.teamdata[team]["deathEvent"] = 0;
    }
    validatealivecount("add", team, player, context);
    if (isdefined(level.modeaddtoteamlives)) {
        [[ level.modeaddtoteamlives ]](player, team, context);
    }
    if (lpcfeaturegated()) {
        return;
    }
    if (istrue(var_28335de6505d7e0c) && isgameplayteam(team)) {
        foreach (player in level.teamdata[team]["players"]) {
            player playlocalsound("mp_bodycount_tick_positive");
        }
        enemies = getenemyplayers(team);
        foreach (player in enemies) {
            player playlocalsound("mp_bodycount_tick_negative");
        }
    }
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f5
// Size: 0x1a5
function removefromteamlives(player, team, var_28335de6505d7e0c, context) {
    level.teamdata[team]["aliveCount"]--;
    level.teamdata[team]["alivePlayers"] = array_remove(level.teamdata[team]["alivePlayers"], player);
    validatealivecount("remove", team, player, context);
    if (isdefined(level.moderemovefromteamlives)) {
        [[ level.moderemovefromteamlives ]](player, team, context);
    }
    if (istrue(var_28335de6505d7e0c) && isgameplayteam(team)) {
        var_8e64916b837afa27 = "mp_bodycount_tick_negative";
        var_8940a36ac40ebf77 = "mp_bodycount_tick_positive";
        if (level.teamdata[team]["aliveCount"] == 1) {
            var_8e64916b837afa27 = "mp_bodycount_tick_negative_final";
            var_8940a36ac40ebf77 = "mp_bodycount_tick_positive_final";
        }
        foreach (player in level.teamdata[team]["players"]) {
            player playlocalsound(var_8e64916b837afa27);
        }
        if (!lpcfeaturegated()) {
            enemies = getenemyplayers(team);
            foreach (player in enemies) {
                player playlocalsound(var_8940a36ac40ebf77);
            }
        }
    }
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba1
// Size: 0x281
function validatealivecount(eventtype, team, player, context) {
    var_8129a2cbd6a585d4 = getdvarint(@"hash_2bfdcc415ed38338", 1);
    context = function_53c4c53197386572(context, "?");
    var_a6b269d3a73b87f9 = 0;
    var_1124b7ac7d344fed = 0;
    if (isdefined(eventtype)) {
        if (eventtype == "disconnect" || eventtype == "extract") {
            var_a6b269d3a73b87f9 = array_contains(level.teamdata[team]["alivePlayers"], player);
            if (var_a6b269d3a73b87f9 && var_8129a2cbd6a585d4) {
                player namespace_99ac021a7547cae3::removefromalivecount(1, "validateAliveCount");
            }
        } else if (eventtype == "add") {
            var_fd5e7a241044b880 = array_remove_duplicates(level.teamdata[team]["alivePlayers"]);
            if (var_fd5e7a241044b880.size < level.teamdata[team]["alivePlayers"].size) {
                var_1124b7ac7d344fed = 1;
                eventtype = eventtype + " duplicate";
            }
        }
    }
    aliveplayers = level.teamdata[team]["alivePlayers"].size;
    alivecount = level.teamdata[team]["aliveCount"];
    if (aliveplayers != alivecount || var_a6b269d3a73b87f9 || var_1124b7ac7d344fed) {
        message = "";
        if (var_1124b7ac7d344fed) {
            message = "WARNING: Duplicate players in alive player array! context=" + context;
        } else if (var_a6b269d3a73b87f9) {
            message = "WARNING: player in alive array after disconnect! context=" + context;
        } else {
            message = "WARNING: alivePlayers and aliveCount are out of sync! context=" + context;
        }
        /#
            /#
                assertmsg(message);
            #/
        #/
        dlog_recordevent("dlog_event_alive_count_mismatch", [0:"alive_players", 1:aliveplayers, 2:"alive_count", 3:alivecount, 4:"event", 5:eventtype, 6:"team", 7:team, 8:"player_xuid", 9:player getxuid(), 10:"player_name", 11:player.name]);
        namespace_9c840bb9f2ecbf00::demoforcesre(message);
        if (var_8129a2cbd6a585d4) {
            level.teamdata[team]["alivePlayers"] = array_remove_duplicates(level.teamdata[team]["alivePlayers"]);
            level.teamdata[team]["aliveCount"] = level.teamdata[team]["alivePlayers"].size;
            [[ level.updategameevents ]]();
        }
    }
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe29
// Size: 0x42
function getteamcount(team, var_7102f45d5f0b5834) {
    if (istrue(var_7102f45d5f0b5834)) {
        return level.teamdata[team]["alivePlayers"].size;
    } else {
        return level.teamdata[team]["players"].size;
    }
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe72
// Size: 0x42
function getenemyteams(var_68bb1f110ec06a58) {
    /#
        assertex(isgameplayteam(var_68bb1f110ec06a58), "Not a valid gameplay team: " + var_68bb1f110ec06a58);
    #/
    teams = level.teamnamelist;
    teams = array_remove(teams, var_68bb1f110ec06a58);
    return teams;
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebc
// Size: 0xf8
function getfriendlyplayers(var_68bb1f110ec06a58, var_7102f45d5f0b5834) {
    friends = [];
    if (istrue(var_7102f45d5f0b5834)) {
        foreach (player in level.teamdata[var_68bb1f110ec06a58]["alivePlayers"]) {
            if (isdefined(player) && isalive(player) && !isdefined(player.fauxdead)) {
                friends[friends.size] = player;
            }
        }
    } else {
        foreach (player in level.teamdata[var_68bb1f110ec06a58]["players"]) {
            friends[friends.size] = player;
        }
    }
    return friends;
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbc
// Size: 0x154
function getenemyplayers(var_68bb1f110ec06a58, var_7102f45d5f0b5834) {
    enemies = [];
    var_b0c33d224b825287 = getenemyteams(var_68bb1f110ec06a58);
    foreach (team in var_b0c33d224b825287) {
        if (istrue(var_7102f45d5f0b5834)) {
            foreach (player in level.teamdata[team]["alivePlayers"]) {
                if (isdefined(player) && isalive(player) && !isdefined(player.fauxdead)) {
                    enemies[enemies.size] = player;
                }
            }
        } else {
            foreach (player in level.teamdata[team]["players"]) {
                enemies[enemies.size] = player;
            }
        }
    }
    return enemies;
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1118
// Size: 0xcc
function getSquadmates(var_68bb1f110ec06a58, var_d9aa850e7ee12ca3, var_7102f45d5f0b5834) {
    if (function_d0e67bb0e7f430f8(var_68bb1f110ec06a58, var_d9aa850e7ee12ca3)) {
        if (istrue(var_7102f45d5f0b5834)) {
            var_607da387f3617ed1 = [];
            foreach (player in level.squaddata[var_68bb1f110ec06a58][var_d9aa850e7ee12ca3].players) {
                if (namespace_7e17181d03156026::isreallyalive(player)) {
                    var_607da387f3617ed1[var_607da387f3617ed1.size] = player;
                }
            }
            return var_607da387f3617ed1;
        } else {
            return level.squaddata[var_68bb1f110ec06a58][var_d9aa850e7ee12ca3].players;
        }
    }
    return getfriendlyplayers(var_68bb1f110ec06a58, var_7102f45d5f0b5834);
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ec
// Size: 0x28
function function_5b7802e04b6d946(player) {
    return function_d0e67bb0e7f430f8(player.team, player.var_ff97225579de16a);
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121c
// Size: 0x4c
function function_d0e67bb0e7f430f8(team, squadindex) {
    return isdefined(team) && isdefined(squadindex) && isdefined(level.squaddata) && isdefined(level.squaddata[team]) && isdefined(level.squaddata[team][squadindex]);
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1270
// Size: 0x86
function getenemycount(var_68bb1f110ec06a58, var_7102f45d5f0b5834) {
    count = 0;
    var_b0c33d224b825287 = getenemyteams(var_68bb1f110ec06a58);
    foreach (team in var_b0c33d224b825287) {
        count = count + getteamcount(team, istrue(var_7102f45d5f0b5834));
    }
    return count;
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12fe
// Size: 0x98
function function_44a6f98cc3c0f5f4(team) {
    var_7d247415a9640d07 = getsubgametype() == "dmz" || getsubgametype() == "exgm";
    var_65c32dd267d39ddb = team == "team_hundred_ninety_five" || team == "team_hundred_ninety_three" || team == "team_hundred_ninety_four" || team == "team_hundred_ninety_five" || team == "team_hundred_ninety_six" || team == "team_hundred_ninety_seven" || team == "team_hundred_ninety_eight" || team == "team_hundred_ninety_nine";
    return var_7d247415a9640d07 && var_65c32dd267d39ddb;
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x139e
// Size: 0x21
function isgameplayteam(team) {
    return isdefined(team) && function_fc64178f71375137(level.teamnamelist, team);
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c7
// Size: 0xf
function getfaction(team) {
    return game[team];
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13de
// Size: 0x19b
function function_dd622cd64f483958(teamref) {
    bundle = function_716b04a356073ae5(level.teamdata[teamref]["teamFaction"]);
    game[teamref] = bundle.ref;
    if (!isdefined(level.teamdata[teamref]["teamName"])) {
        level.teamdata[teamref]["teamName"] = bundle.name;
    }
    if (!isdefined(level.teamdata[teamref]["shortName"])) {
        level.teamdata[teamref]["shortName"] = bundle.shortName;
    }
    if (!isdefined(level.teamdata[teamref]["teamIcon"])) {
        level.teamdata[teamref]["teamIcon"] = bundle.var_493bf0f1c7cf4ad1;
    }
    if (!isdefined(level.teamdata[teamref]["headIcon"])) {
        level.teamdata[teamref]["headIcon"] = bundle.headicon;
    }
    if (!isdefined(level.teamdata[teamref]["soundInfix"])) {
        level.teamdata[teamref]["soundInfix"] = bundle.var_d5fbbcddd0fdfe3b;
    }
    if (!isdefined(level.teamdata[teamref]["customizationInfix"])) {
        level.teamdata[teamref]["customizationInfix"] = bundle.customizationInfix;
    }
    if (!isdefined(level.teamdata[teamref]["superFaction"])) {
        level.teamdata[teamref]["superFaction"] = bundle.var_47eff39aeeb815fb;
    }
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1580
// Size: 0x67
function getteamname(teamref) {
    if (!isdefined(level.teamdata[teamref]["teamName"])) {
        faction = getfaction(teamref);
        level.teamdata[teamref]["teamName"] = function_716b04a356073ae5(faction).name;
    }
    return level.teamdata[teamref]["teamName"];
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15ef
// Size: 0x67
function getteamshortname(teamref) {
    if (!isdefined(level.teamdata[teamref]["shortName"])) {
        faction = getfaction(teamref);
        level.teamdata[teamref]["shortName"] = function_716b04a356073ae5(faction).shortName;
    }
    return level.teamdata[teamref]["shortName"];
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x165e
// Size: 0x67
function getteamicon(teamref) {
    if (!isdefined(level.teamdata[teamref]["teamIcon"])) {
        faction = getfaction(teamref);
        level.teamdata[teamref]["teamIcon"] = function_716b04a356073ae5(faction).var_493bf0f1c7cf4ad1;
    }
    return level.teamdata[teamref]["teamIcon"];
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16cd
// Size: 0x67
function getteamheadicon(teamref) {
    if (!isdefined(level.teamdata[teamref]["headIcon"])) {
        faction = getfaction(teamref);
        level.teamdata[teamref]["headIcon"] = function_716b04a356073ae5(faction).headicon;
    }
    return level.teamdata[teamref]["headIcon"];
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x173c
// Size: 0x67
function getteamvoiceinfix(teamref) {
    if (!isdefined(level.teamdata[teamref]["soundInfix"])) {
        faction = getfaction(teamref);
        level.teamdata[teamref]["soundInfix"] = function_716b04a356073ae5(faction).var_d5fbbcddd0fdfe3b;
    }
    return level.teamdata[teamref]["soundInfix"];
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17ab
// Size: 0x67
function getcustomizationprefix(teamref) {
    if (!isdefined(level.teamdata[teamref]["customizationInfix"])) {
        faction = getfaction(teamref);
        level.teamdata[teamref]["customizationInfix"] = function_716b04a356073ae5(faction).customizationInfix;
    }
    return level.teamdata[teamref]["customizationInfix"];
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x181a
// Size: 0x67
function function_f5f92738a88b4577(teamref) {
    if (!isdefined(level.teamdata[teamref]["superFaction"])) {
        faction = getfaction(teamref);
        level.teamdata[teamref]["superFaction"] = function_716b04a356073ae5(faction).var_47eff39aeeb815fb;
    }
    return level.teamdata[teamref]["superFaction"];
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1889
// Size: 0x1a9
function getteamfactionsfrommap(teamref) {
    var_55f7ec9f66f3468d = function_79404c2fcca1c184();
    var_1e4ad72b4e8b7383 = undefined;
    var_b051af13cb960b7a = %"hash_6a3e9234e0d7e26d";
    if (!isdefined(level.teamdata[teamref]["teamFaction"])) {
        if (isdefined(var_55f7ec9f66f3468d)) {
            switch (teamref) {
            case #"hash_7c2d091e6337bf54":
                var_1e4ad72b4e8b7383 = var_55f7ec9f66f3468d.var_43e060f09bf639b5;
                break;
            case #"hash_5f54b9bf7583687f":
                var_1e4ad72b4e8b7383 = var_55f7ec9f66f3468d.var_dd123f8d490e1eda;
                break;
            case #"hash_11f9d28d306ceab7":
                var_1e4ad72b4e8b7383 = var_55f7ec9f66f3468d.var_8141b672d3a01417;
                break;
            case #"hash_de35e9ca17933bf1":
                var_1e4ad72b4e8b7383 = var_55f7ec9f66f3468d.var_55a6b82843503e54;
                break;
            case #"hash_ec4dd0ca1ec42f41":
                var_1e4ad72b4e8b7383 = var_55f7ec9f66f3468d.var_7d9fcf9bd0c2a739;
                break;
            case #"hash_cb45d282427f65a7":
                var_1e4ad72b4e8b7383 = var_55f7ec9f66f3468d.var_8112676ea3c4f98e;
                break;
            default:
                var_1e4ad72b4e8b7383 = var_55f7ec9f66f3468d.var_dd123f8d490e1eda;
                break;
            }
            if (!isdefined(var_1e4ad72b4e8b7383) || var_1e4ad72b4e8b7383 == "") {
                /#
                    println("<unknown string>" + teamref + "<unknown string>" + level.mapname);
                #/
                var_1e4ad72b4e8b7383 = var_b051af13cb960b7a;
            }
            level.teamdata[teamref]["teamFaction"] = var_1e4ad72b4e8b7383;
        } else {
            /#
                println("<unknown string>" + level.mapname);
            #/
            level.teamdata[teamref]["teamFaction"] = var_b051af13cb960b7a;
        }
    }
    return level.teamdata[teamref]["teamFaction"];
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3a
// Size: 0x2f
function getcustomgametypeteammax() {
    gametype = getgametype();
    return getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", gametype, "_teamcount"), -1);
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a71
// Size: 0x2f
function function_f6728366ba30005c() {
    registersharedfunc("team_utility", "getFriendlyPlayers", &getfriendlyplayers);
    registersharedfunc("team_utility", "getEnemyPlayers", &getenemyplayers);
}

// Namespace teams/namespace_54d20dd0dd79277f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa7
// Size: 0x76
function calculatenumteamswithplayers() {
    var_153f283bcbffa477 = 0;
    foreach (team in level.teamdata) {
        if (team["players"].size > 0) {
            var_153f283bcbffa477++;
        }
    }
    level.var_153f283bcbffa477 = var_153f283bcbffa477;
}

