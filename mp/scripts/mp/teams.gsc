#using scripts\engine\utility.gsc;
#using scripts\engine\throttle.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\wm.gsc;
#using scripts\cp_mp\killstreaks\uav.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using scripts\mp\gametypes\br_utility.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\hud_message.gsc;
#using script_6775ad452d13858;
#using scripts\cp_mp\execution.gsc;
#using script_600b944a95c3a7bf;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_58be75c518bf0d40;
#using scripts\engine\trace.gsc;
#using scripts\mp\menus.gsc;

#namespace teams;

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x319f
// Size: 0xb31
function init() {
    utility::registersharedfunc("customization", "getOperatorCustomization", &getoperatorcustomization);
    utility::registersharedfunc("customization", "setCharacterModels", &setcharactermodels);
    level.teambalance = getdvarint(@"scr_teambalance");
    level.maxclients = getmaxclients();
    allteams = ["free", "axis", "allies", "team_three", "team_four", "team_five", "team_six", "team_seven", "team_eight", "team_nine", "team_ten", "team_eleven", "team_twelve", "team_thirteen", "team_fourteen", "team_fifteen", "team_sixteen", "team_seventeen", "team_eighteen", "team_nineteen", "team_twenty", "team_twenty_one", "team_twenty_two", "team_twenty_three", "team_twenty_four", "team_twenty_five", "team_twenty_six", "team_twenty_seven", "team_twenty_eight", "team_twenty_nine", "team_thirty", "team_thirty_one", "team_thirty_two", "team_thirty_three", "team_thirty_four", "team_thirty_five", "team_thirty_six", "team_thirty_seven", "team_thirty_eight", "team_thirty_nine", "team_forty", "team_forty_one", "team_forty_two", "team_forty_three", "team_forty_four", "team_forty_five", "team_forty_six", "team_forty_seven", "team_forty_eight", "team_forty_nine", "team_fifty", "team_fifty_one", "team_fifty_two", "team_fifty_three", "team_fifty_four", "team_fifty_five", "team_fifty_six", "team_fifty_seven", "team_fifty_eight", "team_fifty_nine", "team_sixty", "team_sixty_one", "team_sixty_two", "team_sixty_three", "team_sixty_four", "team_sixty_five", "team_sixty_six", "team_sixty_seven", "team_sixty_eight", "team_sixty_nine", "team_seventy", "team_seventy_one", "team_seventy_two", "team_seventy_three", "team_seventy_four", "team_seventy_five", "team_seventy_six", "team_seventy_seven", "team_seventy_eight", "team_seventy_nine", "team_eighty", "team_eighty_one", "team_eighty_two", "team_eighty_three", "team_eighty_four", "team_eighty_five", "team_eighty_six", "team_eighty_seven", "team_eighty_eight", "team_eighty_nine", "team_ninety", "team_ninety_one", "team_ninety_two", "team_ninety_three", "team_ninety_four", "team_ninety_five", "team_ninety_six", "team_ninety_seven", "team_ninety_eight", "team_ninety_nine", "team_hundred", "team_hundred_one", "team_hundred_two", "team_hundred_three", "team_hundred_four", "team_hundred_five", "team_hundred_six", "team_hundred_seven", "team_hundred_eight", "team_hundred_nine", "team_hundred_ten", "team_hundred_eleven", "team_hundred_twelve", "team_hundred_thirteen", "team_hundred_fourteen", "team_hundred_fifteen", "team_hundred_sixteen", "team_hundred_seventeen", "team_hundred_eightteen", "team_hundred_nineteen", "team_hundred_twenty", "team_hundred_twenty_one", "team_hundred_twenty_two", "team_hundred_twenty_three", "team_hundred_twenty_four", "team_hundred_twenty_five", "team_hundred_twenty_six", "team_hundred_twenty_seven", "team_hundred_twenty_eight", "team_hundred_twenty_nine", "team_hundred_thirty", "team_hundred_thirty_one", "team_hundred_thirty_two", "team_hundred_thirty_three", "team_hundred_thirty_four", "team_hundred_thirty_five", "team_hundred_thirty_six", "team_hundred_thirty_seven", "team_hundred_thirty_eight", "team_hundred_thirty_nine", "team_hundred_forty", "team_hundred_forty_one", "team_hundred_forty_two", "team_hundred_forty_three", "team_hundred_forty_four", "team_hundred_forty_five", "team_hundred_forty_six", "team_hundred_forty_seven", "team_hundred_forty_eight", "team_hundred_forty_nine", "team_hundred_fifty", "team_hundred_fifty_one", "team_hundred_fifty_two", "team_hundred_fifty_three", "team_hundred_fifty_four", "team_hundred_fifty_five", "team_hundred_fifty_six", "team_hundred_fifty_seven", "team_hundred_fifty_eight", "team_hundred_fifty_nine", "team_hundred_sixty", "team_hundred_sixty_one", "team_hundred_sixty_two", "team_hundred_sixty_three", "team_hundred_sixty_four", "team_hundred_sixty_five", "team_hundred_sixty_six", "team_hundred_sixty_seven", "team_hundred_sixty_eight", "team_hundred_sixty_nine", "team_hundred_seventy", "team_hundred_seventy_one", "team_hundred_seventy_two", "team_hundred_seventy_three", "team_hundred_seventy_four", "team_hundred_seventy_five", "team_hundred_seventy_six", "team_hundred_seventy_seven", "team_hundred_seventy_eight", "team_hundred_seventy_nine", "team_hundred_eighty", "team_hundred_eighty_one", "team_hundred_eighty_two", "team_hundred_eighty_three", "team_hundred_eighty_four", "team_hundred_eighty_five", "team_hundred_eighty_six", "team_hundred_eighty_seven", "team_hundred_eighty_eight", "team_hundred_eighty_nine", "team_hundred_ninety", "team_hundred_ninety_one", "team_hundred_ninety_two", "team_hundred_ninety_three", "team_hundred_ninety_four", "team_hundred_ninety_five", "team_hundred_ninety_six", "team_hundred_ninety_seven", "team_hundred_ninety_eight", "team_hundred_ninety_nine", "team_two_hundred", "spectator", "codcaster", "civilian", "team_big_map_agent"];
    level.allteamnamelist = allteams;
    combatteams = ["axis", "allies"];
    if (getdvarint(@"hash_5dabea153bf14a41", 0) == 1) {
        combatteams = ["axis"];
    }
    otherteams = ["free", "spectator", "codcaster"];
    var_656660d323003255 = ["SAS", "RUSF", "USMC", "SABF"];
    activeteamcount = getcustomgametypeteammax();
    activeteamcount = min(activeteamcount, getdvarint(hashcat(@"scr_", getgametype(), "_teamcount"), -1));
    maxteamsize = scripts\cp_mp\utility\game_utility::function_4fb37368ae3585bb();
    assertex(activeteamcount != -1, "<dev string:x1c>" + "<dev string:x5d>" + getgametype() + "<dev string:x65>");
    var_75d2cd1035b7c557 = 1;
    var_25a6885224803948 = -1;
    if (activeteamcount >= 3) {
        for (i = 3; i < activeteamcount + var_75d2cd1035b7c557; i++) {
            combatteams[combatteams.size] = level.allteamnamelist[i];
            if (!isdefined(game[level.allteamnamelist[i]])) {
                game[level.allteamnamelist[i]] = var_656660d323003255[(i + var_25a6885224803948) % var_656660d323003255.size];
            }
        }
    }
    level.teamnamelist = combatteams;
    level.multiteambased = level.teamnamelist.size > 2 || getdvarint(@"hash_2c78e7cf8d058302", 0) == 1;
    level.teamdata = [];
    foreach (team in allteams) {
        initteamdata(team);
    }
    level callback::callback("register_team_data");
    foreach (team in combatteams) {
        getteamfactionsfrommap(team);
        function_dd622cd64f483958(team);
    }
    level.teambased = activeteamcount > 1 || getdvarint(@"hash_6bfddbbc0765d353", 0) == 1;
    setdvar(@"hash_afb03e72b1770af", level.teamnamelist.size);
    if (getdvarint(@"hash_f16ba8db72f34fc3", 0) != 0 && level.teambased) {
        level thread scripts\cp_mp\killstreaks\uav::function_c11936b9c6c3a076(undefined, 1);
    }
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&onplayerspawned);
    scripts\mp\utility\join_team_aggregator::registeronplayerjointeamcallback(&onjoinedteam);
    level thread onplayerconnect();
    level thread trackplayedtime();
    function_d650608c959c9675();
    initnightvisionheadoverrides();
    wait 0.15;
    level thread updateplayertimes();
    level thread finalizeplayertimes();
    if (level.teambased) {
        level thread updateteambalance();
    }
    if (matchmakinggame() && !isintournament() && !getdvarint(@"hash_9b383028dfd6542d", 0)) {
        level thread watchafk();
    }
    /#
        level thread devmonitoroperatorcustomizationprint();
    #/
    if (getdvarint(@"hash_cf58bc10c64a1977", 0) == 1) {
        level thread debugprintteams();
    }
    function_6f61a7ebcd7859f6();
    function_67fd50c33d15b163();
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cd8
// Size: 0x1d4
function function_6f61a7ebcd7859f6() {
    level.var_8439ac7b613822b0 = [];
    projectscriptbundle = undefined;
    if (!isdefined(level.projectbundle)) {
        projectscriptbundle = function_811510b694ddd963();
    } else {
        projectscriptbundle = level.projectbundle;
    }
    if (isdefined(projectscriptbundle) && isdefined(projectscriptbundle.parachutelist)) {
        var_150ada5de2119f78 = getscriptbundle("parachutelist:" + projectscriptbundle.parachutelist);
        if (isdefined(var_150ada5de2119f78) && isdefined(var_150ada5de2119f78.parachute_list)) {
            foreach (parachute in var_150ada5de2119f78.parachute_list) {
                lootid = getscriptbundlefieldvalue(hashcat(%"hash_56e1b55b9b3fe8f9", parachute.parachutedata), #"lootid");
                ref = getscriptbundlefieldvalue(hashcat(%"hash_56e1b55b9b3fe8f9", parachute.parachutedata), #"ref");
                assertex(!isdefined(level.var_8439ac7b613822b0[lootid]), "<dev string:x73>" + lootid + "<dev string:xb2>" + parachute.parachutedata);
                if (isdefined(ref)) {
                    level.var_8439ac7b613822b0[lootid] = spawnstruct();
                    level.var_8439ac7b613822b0[lootid].ref = ref;
                    level.var_8439ac7b613822b0[lootid].bundle_name = parachute.parachutedata;
                    continue;
                }
                assertmsg("<dev string:xbb>" + parachute.parachutedata + "<dev string:xd4>");
            }
        }
    }
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3eb4
// Size: 0x1d4
function function_67fd50c33d15b163() {
    level.contraillist = [];
    projectscriptbundle = undefined;
    if (!isdefined(level.projectbundle)) {
        projectscriptbundle = function_811510b694ddd963();
    } else {
        projectscriptbundle = level.projectbundle;
    }
    if (isdefined(projectscriptbundle) && isdefined(projectscriptbundle.contraillist)) {
        var_94e82efc0c1e2431 = getscriptbundle("contraillist:" + projectscriptbundle.contraillist);
        if (isdefined(var_94e82efc0c1e2431) && isdefined(var_94e82efc0c1e2431.contrail_list)) {
            foreach (contrail in var_94e82efc0c1e2431.contrail_list) {
                lootid = getscriptbundlefieldvalue(hashcat(%"hash_3ead86725b3cfa8", contrail.contraildata), #"lootid");
                ref = getscriptbundlefieldvalue(hashcat(%"hash_3ead86725b3cfa8", contrail.contraildata), #"ref");
                assertex(!isdefined(level.contraillist[lootid]), "<dev string:xfb>" + lootid + "<dev string:xb2>" + contrail.contraildata);
                if (isdefined(ref)) {
                    level.contraillist[lootid] = spawnstruct();
                    level.contraillist[lootid].ref = ref;
                    level.contraillist[lootid].bundle_name = contrail.contraildata;
                    continue;
                }
                assertmsg("<dev string:x139>" + contrail.contraildata + "<dev string:xd4>");
            }
        }
    }
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4090
// Size: 0x13f
function initteamdata(team) {
    level.teamdata[team] = [];
    level.teamdata[team]["players"] = [];
    level.teamdata[team]["alivePlayers"] = [];
    level.teamdata[team]["teamCount"] = 0;
    level.teamdata[team]["aliveCount"] = 0;
    level.teamdata[team]["livesCount"] = 0;
    level.teamdata[team]["hasSpawned"] = 0;
    level.teamdata[team]["oneLeftTime"] = 0;
    level.teamdata[team]["twoLeft"] = 0;
    level.teamdata[team]["oneLeft"] = 0;
    level.teamdata[team]["noRespawns"] = 0;
    level.teamdata[team]["playagainHostXuid"] = "0";
    if (level.multiteambased) {
        level.teamdata[team]["deathEvent"] = 0;
    }
    if (isdefined(level.var_7b37b2193f163b9b)) {
        level.teamdata[team]["UIBotCount"] = 0;
        level.teamdata[team]["UnlockedUIBotCount"] = 0;
    }
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41d7
// Size: 0xe1
function onplayerconnect() {
    for (;;) {
        level waittill("connected", player);
        player.timeplayed = [];
        player.timeplayed["game"] = 0;
        player.timeplayed["total"] = 0;
        player.timeplayed["missionTeam"] = 0;
        player.timeplayed["other"] = 0;
        player.timeplayed["gulag"] = 0;
        player.timeplayed["resurgenceRespawn"] = 0;
        player.timeplayed["infil"] = 0;
        if (!isdefined(player.pers["timeDead"])) {
            player.pers["timeDead"] = 0;
        }
        player function_c982e24e79a06bd1();
        player function_6fb381a0318778f5();
    }
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42c0
// Size: 0x34
function onjoinedteam(player) {
    if (getdvarint(@"hash_6074f1620fbd9746", 0) != 0) {
        player scripts\mp\gametypes\br_utility::updateplayereliminatedomnvar("onJoinedTeam");
    }
    player updateteamtime();
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42fc
// Size: 0x2b
function onjoinedspectators(player) {
    if (isdefined(player.pers)) {
        player.pers["teamTime"] = undefined;
    }
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x432f
// Size: 0xf6
function trackplayedtime() {
    level endon("game_ended");
    gameflagwait("prematch_done");
    var_a37b8574c4cb7d20 = 1000;
    frameduration = level.frameduration;
    var_331db3034b68a373 = floor(var_a37b8574c4cb7d20 / frameduration);
    wait 1;
    while (!level.gameended) {
        players = level.players;
        var_e0e025c067d6a3aa = ceil(players.size / var_331db3034b68a373);
        playersupdated = 0;
        framesprocessed = 0;
        for (playeridx = 0; playeridx < players.size; playeridx++) {
            if (!isdefined(players[playeridx])) {
                continue;
            }
            players[playeridx] trackplayedtimeupdate();
            playersupdated++;
            if (playersupdated >= var_e0e025c067d6a3aa) {
                playersupdated = 0;
                framesprocessed++;
                waitframe();
            }
        }
        waittime = max(0, var_a37b8574c4cb7d20 - framesprocessed * frameduration) / 1000;
        wait waittime;
    }
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x442d
// Size: 0xd9
function trackplayedtimeupdate() {
    if (isdefined(self.timeplayed) && isreallyalive(self)) {
        team = self.sessionteam;
        if (!isdefined(self.timeplayed["game"])) {
            self.timeplayed["game"] = 0;
        } else {
            self.timeplayed["game"]++;
        }
        if (team != "spectator" && team != "codcaster") {
            self.timeplayed["total"]++;
            self.timeplayed["missionTeam"]++;
            if (!isreallyalive(self)) {
                scripts\mp\utility\stats::incpersstat("timeDead", 1);
            }
        }
    }
    if (isdefined(self.var_73f7116f87a4fab6) && self.var_73f7116f87a4fab6 > 0) {
        self.var_73f7116f87a4fab6--;
    }
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x450e
// Size: 0x96
function updateplayertimes() {
    level endon("game_ended");
    while (true) {
        playercount = level.players.size;
        for (startplayer = 0; startplayer < playercount; startplayer += 20) {
            scripts\mp\hostmigration::waittillhostmigrationdone();
            for (updateindex = 0; updateindex < 20; updateindex++) {
                playerindex = startplayer + updateindex;
                player = level.players[playerindex];
                if (isdefined(player)) {
                    player updateplayedtime();
                }
            }
            waitframe();
        }
        wait 2;
    }
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45ac
// Size: 0x84
function finalizeplayertimes() {
    while (!level.gameended) {
        wait 2;
    }
    foreach (player in level.players) {
        player updateplayedtime();
        if (!scripts\mp\utility\game::runleanthreadmode()) {
            player scripts\mp\persistence::writebufferedstats();
            player scripts\mp\persistence::updateweaponbufferedstats();
        }
    }
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4638
// Size: 0x141
function updateplayedtime() {
    if (isai(self)) {
        return;
    }
    addtoplayerstatbuffered(self.timeplayed["game"], "matchStats", "timePlayedTotal");
    scripts\mp\persistence::stataddchildbuffered("round", "timePlayed", self.timeplayed["game"], 1);
    if (scripts\mp\gametypes\br_public::isplayeringulag()) {
        self.timeplayed["gulag"] = self.timeplayed["gulag"] + self.timeplayed["game"];
    } else if (scripts\mp\gametypes\br_public::function_8f0e6614368f64c2()) {
        self.timeplayed["resurgenceRespawn"] = self.timeplayed["resurgenceRespawn"] + self.timeplayed["game"];
    } else if (isdefined(self.c130) || istrue(self.brneverlanded)) {
        self.timeplayed["infil"] = self.timeplayed["infil"] + self.timeplayed["game"];
    }
    if (game["state"] == "postgame") {
        return;
    }
    self.timeplayed["game"] = 0;
    self.timeplayed["missionTeam"] = 0;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4781
// Size: 0x28
function updateteamtime() {
    if (game["state"] != "playing") {
        return;
    }
    self.pers["teamTime"] = gettime();
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47b1
// Size: 0x47
function updateteambalancedvar() {
    for (;;) {
        teambalance = getdvarint(@"scr_teambalance");
        if (level.teambalance != teambalance) {
            level.teambalance = getdvarint(@"scr_teambalance");
        }
        wait 1;
    }
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4800
// Size: 0xc9
function updateteambalance() {
    level thread updateteambalancedvar();
    wait 0.15;
    if (level.teambalance && isroundbased()) {
        if (isdefined(game["BalanceTeamsNextRound"])) {
            scripts\mp\hud_message::showerrormessagetoallplayers("MP/AUTOBALANCE_NEXT_ROUND");
        }
        level waittill("restarting");
        if (isdefined(game["BalanceTeamsNextRound"])) {
            level balanceteams();
            game["BalanceTeamsNextRound"] = undefined;
        } else if (!getteambalance()) {
            game["BalanceTeamsNextRound"] = 1;
        }
        return;
    }
    level endon("game_ended");
    for (;;) {
        if (level.teambalance) {
            if (!getteambalance()) {
                scripts\mp\hud_message::showerrormessagetoallplayers("MP/AUTOBALANCE_SECONDS", 15);
                wait 15;
                if (!getteambalance()) {
                    level balanceteams();
                }
            }
            wait 59;
        }
        wait 1;
    }
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48d1
// Size: 0x105
function getteambalance() {
    team["allies"] = 0;
    team["axis"] = 0;
    players = level.players;
    for (i = 0; i < players.size; i++) {
        if (isdefined(players[i].pers["team"]) && players[i].pers["team"] == "allies") {
            team["allies"]++;
            continue;
        }
        if (isdefined(players[i].pers["team"]) && players[i].pers["team"] == "axis") {
            team["axis"]++;
        }
    }
    if (team["allies"] > team["axis"] + level.teambalance || team["axis"] > team["allies"] + level.teambalance) {
        return 0;
    }
    return 1;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49de
// Size: 0x2b2
function balanceteams() {
    iprintlnbold(game["strings"]["autobalance"]);
    var_4b60537d15df5108 = [];
    axisplayers = [];
    players = level.players;
    for (i = 0; i < players.size; i++) {
        if (!isdefined(players[i].pers["teamTime"])) {
            continue;
        }
        if (isdefined(players[i].pers["team"]) && players[i].pers["team"] == "allies") {
            var_4b60537d15df5108[var_4b60537d15df5108.size] = players[i];
            continue;
        }
        if (isdefined(players[i].pers["team"]) && players[i].pers["team"] == "axis") {
            axisplayers[axisplayers.size] = players[i];
        }
    }
    mostrecent = undefined;
    while (var_4b60537d15df5108.size > axisplayers.size + 1 || axisplayers.size > var_4b60537d15df5108.size + 1) {
        if (var_4b60537d15df5108.size > axisplayers.size + 1) {
            for (j = 0; j < var_4b60537d15df5108.size; j++) {
                if (isdefined(var_4b60537d15df5108[j].dont_auto_balance)) {
                    continue;
                }
                if (!isdefined(mostrecent)) {
                    mostrecent = var_4b60537d15df5108[j];
                    continue;
                }
                if (var_4b60537d15df5108[j].pers["teamTime"] > mostrecent.pers["teamTime"]) {
                    mostrecent = var_4b60537d15df5108[j];
                }
            }
            mostrecent [[ level.onteamselection ]]("axis");
        } else if (axisplayers.size > var_4b60537d15df5108.size + 1) {
            for (j = 0; j < axisplayers.size; j++) {
                if (isdefined(axisplayers[j].dont_auto_balance)) {
                    continue;
                }
                if (!isdefined(mostrecent)) {
                    mostrecent = axisplayers[j];
                    continue;
                }
                if (axisplayers[j].pers["teamTime"] > mostrecent.pers["teamTime"]) {
                    mostrecent = axisplayers[j];
                }
            }
            mostrecent [[ level.onteamselection ]]("allies");
        }
        mostrecent = undefined;
        var_4b60537d15df5108 = [];
        axisplayers = [];
        players = level.players;
        for (i = 0; i < players.size; i++) {
            if (isdefined(players[i].pers["team"]) && players[i].pers["team"] == "allies") {
                var_4b60537d15df5108[var_4b60537d15df5108.size] = players[i];
                continue;
            }
            if (isdefined(players[i].pers["team"]) && players[i].pers["team"] == "axis") {
                axisplayers[axisplayers.size] = players[i];
            }
        }
    }
}

// Namespace teams / scripts\mp\teams
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4c98
// Size: 0x13
function playermodelforweapon(weapon, secondary) {
    
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cb3
// Size: 0x11c
function countplayers() {
    player_counts = [];
    for (i = 0; i < level.teamnamelist.size; i++) {
        player_counts[level.teamnamelist[i]] = 0;
    }
    for (i = 0; i < level.players.size; i++) {
        if (level.players[i] == self) {
            continue;
        }
        if (level.players[i].pers["team"] == "spectator") {
            continue;
        }
        if (level.players[i].pers["team"] == "codcaster") {
            continue;
        }
        if (isdefined(level.players[i].pers["team"])) {
            assert(isdefined(player_counts[level.players[i].pers["<dev string:x151>"]]));
            player_counts[level.players[i].pers["team"]]++;
        }
    }
    return player_counts;
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4dd8
// Size: 0x33
function function_4455d13943035bfc(headmodelname) {
    return headmodelname == "head_c_jup_mp_price_16b" || headmodelname == "head_c_jup_mp_ghost_16b" || headmodelname == "head_c_jup_mp_soap_14b" || headmodelname == "head_c_jup_mp_farah_13b";
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e14
// Size: 0x33
function function_9af61b2ea4d9febe(headmodelname) {
    return headmodelname == "head_c_jup_mp_price_16c" || headmodelname == "head_c_jup_mp_ghost_16c" || headmodelname == "head_c_jup_mp_soap_14c" || headmodelname == "head_c_jup_mp_farah_13c";
}

// Namespace teams / scripts\mp\teams
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4e50
// Size: 0x4c
function function_4baf40dc0ba10b6b(var_7be7b8557140e52f, headmodelname) {
    if (getdvarint(@"hash_4753586a2ac8718f", 0) == 1) {
        if (function_4455d13943035bfc(headmodelname)) {
            return "body_c_jup_mp_voxel_medium_head";
        } else if (function_9af61b2ea4d9febe(headmodelname)) {
            return "body_c_jup_mp_voxel_large_head";
        }
    }
    return var_7be7b8557140e52f;
}

// Namespace teams / scripts\mp\teams
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4ea5
// Size: 0xa5
function setcharactermodels(bodymodelname, headmodelname, viewmodelname) {
    if (isdefined(self.headmodel)) {
        self detach(self.headmodel);
    }
    if (function_f3bb4f4911a1beb2("escort", "isDogZombie")) {
        return;
    }
    if (!isagent(self)) {
        bodymodelname = self getcustomizationbody();
        bodymodelname = function_4baf40dc0ba10b6b(bodymodelname, headmodelname);
        headmodelname = self getcustomizationhead();
        viewmodelname = self getcustomizationviewmodel();
    }
    self setmodel(bodymodelname);
    self setviewmodel(viewmodelname);
    if (isdefined(headmodelname)) {
        self attach(headmodelname, "", 1);
        self.headmodel = headmodelname;
    }
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f52
// Size: 0x143
function forcecustomization(index) {
    model = undefined;
    headmodel = undefined;
    customization = [];
    switch (index) {
    case 1:
        model = "mp_warfighter_body_1_3";
        headmodel = "mp_warfighter_head_1_3";
        break;
    case 2:
        model = "mp_body_heavy_1_2";
        headmodel = "mp_head_heavy_1_2";
        break;
    case 3:
        if (scripts\cp_mp\utility\game_utility::isinfectedgametype()) {
            model = "mp_synaptic_body_1_4";
            headmodel = "mp_synaptic_head_1_4";
        } else {
            model = "mp_synaptic_body_1_1";
            headmodel = "mp_synaptic_head_1_1";
        }
        break;
    case 4:
        model = "mp_ftl_body_3_1";
        headmodel = "mp_ftl_head_5_1";
        break;
    case 5:
        model = "mp_stryker_body_2_1";
        headmodel = "mp_stryker_head_3_1";
        break;
    case 6:
        model = "mp_ghost_body_1_3";
        headmodel = "mp_ghost_head_1_1";
        break;
    }
    self setcustomization(model, headmodel);
    bodymodelname = self getcustomizationbody();
    headmodelname = self getcustomizationhead();
    viewmodelname = self getcustomizationviewmodel();
    setcharactermodels(bodymodelname, headmodelname, viewmodelname);
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x509d
// Size: 0x7d
function getcustomization() {
    customization = [];
    if (isdefined(self.operatorcustomization)) {
        customization["body"] = self.operatorcustomization.body;
        customization["head"] = self.operatorcustomization.head;
    } else {
        data = getoperatorcustomization();
        customization["body"] = data[0];
        customization["head"] = data[1];
    }
    return customization;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5123
// Size: 0x7d
function setmodelfromcustomization() {
    assert(isdefined(self));
    assert(isplayer(self));
    customization = getcustomization();
    self setcustomization(customization["body"], customization["head"]);
    bodymodelname = self getcustomizationbody();
    headmodelname = self getcustomizationhead();
    viewmodelname = self getcustomizationviewmodel();
    setcharactermodels(bodymodelname, headmodelname, viewmodelname);
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x51a8
// Size: 0x37
function getplayerviewmodelfrombody(bodyref) {
    viewmodel = namespace_465d40bb08a5337a::function_aa32c85a2c2a2d8b(bodyref);
    if (!isdefined(viewmodel) || viewmodel == "") {
        viewmodel = "viewhands_mp_base_iw8";
    }
    return viewmodel;
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x51e8
// Size: 0x12
function getplayerfoleytype(bodyref) {
    return namespace_465d40bb08a5337a::function_6fd12f8316d3acc6(bodyref);
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5203
// Size: 0x12
function getplayermodelname(bodyindex) {
    return namespace_465d40bb08a5337a::function_3cacd1cd869c0feb(bodyindex);
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x521e
// Size: 0x107
function setupplayermodel() {
    if (!isdefined(self.operatorcustomization) || self.operatorcustomization.rebuild == 1) {
        createoperatorcustomization();
    }
    setcharactermodels(self.operatorcustomization.defaultbody, self.operatorcustomization.defaulthead, self.operatorcustomization.defaultvm);
    _setsuit(self.operatorcustomization.suit);
    if (isdefined(self.operatorcustomization.var_3291e2cbec055766)) {
        self function_602b3de054f2a81(self.operatorcustomization.var_3291e2cbec055766);
    }
    scripts\cp_mp\execution::_giveexecution(self.operatorcustomization.execution);
    if (isdefined(self.operatorcustomization.parachute)) {
        self function_9cd675a7411b6362(self.operatorcustomization.parachute);
    }
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x532d
// Size: 0x141
function function_e7fe5b7d4b92813c() {
    /#
        if (isai(self)) {
            var_1c309d4424389fba = getdvar(@"hash_803cefdbe23f6bfe");
            if (isdefined(var_1c309d4424389fba) && var_1c309d4424389fba != "<dev string:x159>") {
                var_16ec163f5e8303eb = strtok(var_1c309d4424389fba, "<dev string:x15d>");
                var_b7a37613aa3a6f1a = var_16ec163f5e8303eb[randomint(var_16ec163f5e8303eb.size)];
                var_5f913ea9cc37ac31 = namespace_465d40bb08a5337a::function_605079124463a67b(var_b7a37613aa3a6f1a);
                if (namespace_465d40bb08a5337a::function_54240a5fc41f6590(var_5f913ea9cc37ac31)) {
                    return [var_5f913ea9cc37ac31, var_b7a37613aa3a6f1a];
                }
            }
        }
        if (isplayer(self)) {
            var_1c309d4424389fba = getdvar(@"hash_17a1591e3fe7c036");
            if (isdefined(var_1c309d4424389fba) && var_1c309d4424389fba != "<dev string:x159>") {
                var_16ec163f5e8303eb = strtok(var_1c309d4424389fba, "<dev string:x15d>");
                var_b7a37613aa3a6f1a = var_16ec163f5e8303eb[randomint(var_16ec163f5e8303eb.size)];
                var_5f913ea9cc37ac31 = namespace_465d40bb08a5337a::function_605079124463a67b(var_b7a37613aa3a6f1a);
                if (namespace_465d40bb08a5337a::function_54240a5fc41f6590(var_5f913ea9cc37ac31)) {
                    return [var_5f913ea9cc37ac31, var_b7a37613aa3a6f1a];
                }
            }
        }
    #/
    team = self.team;
    if (scripts\cp_mp\utility\game_utility::function_8b6131109e66d962()) {
        team = getotherteam(team)[0];
    }
    operatorref = lookupcurrentoperator(team);
    skinref = function_ed273e317490cb02(operatorref);
    return [operatorref, skinref];
}

// Namespace teams / scripts\mp\teams
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5477
// Size: 0x475
function createoperatorcustomization(operatorref, operatorskin) {
    self function_ecdccfda4326de02();
    self.operatorcustomization = undefined;
    operatorcustomization = spawnstruct();
    if (!isdefined(operatorref) || !isdefined(operatorskin)) {
        var_1c309d4424389fba = getdvar(@"hash_803cefdbe23f6bfe");
        var_bc7876241a7de45c = getdvar(@"hash_17a1591e3fe7c036");
        if (isdefined(var_1c309d4424389fba) && var_1c309d4424389fba != "" || isdefined(var_bc7876241a7de45c) && var_bc7876241a7de45c != "") {
            var_c00a2c6249962d83 = function_e7fe5b7d4b92813c();
            operatorskin = var_c00a2c6249962d83[1];
            operatorref = var_c00a2c6249962d83[0];
        } else {
            operatorref = lookupcurrentoperator(self.team);
            operatorskin = function_ed273e317490cb02(operatorref);
        }
    }
    var_de6cf437be756ee1 = istrue(getdvarint(@"hash_576703ba86051da6", 0));
    if (var_de6cf437be756ee1 && namespace_38b993c4618e76cd::function_8c610908c0e9c6e4(operatorskin)) {
        operatorskin = namespace_465d40bb08a5337a::function_df7d12571397a2b5(operatorref);
    }
    if (var_de6cf437be756ee1 && namespace_38b993c4618e76cd::function_8c610908c0e9c6e4(operatorref)) {
        operatorref = namespace_465d40bb08a5337a::function_9242a55834c7ead8(ter_op(self.team == "allies", 0, 1));
        operatorskin = namespace_465d40bb08a5337a::function_df7d12571397a2b5(operatorref);
    }
    operatorcustomization.operatorref = operatorref;
    operatorcustomization.skinref = operatorskin;
    operatorcustomization.var_3291e2cbec055766 = namespace_465d40bb08a5337a::function_2dc6ef8b84dfec64(operatorskin);
    operatorcustomization.var_d947b7e87c7243ab = function_29b2af59258d6501(operatorskin);
    operatorcustomization.gender = getoperatorgender(operatorref);
    operatorcustomization.voice = getoperatorvoice(operatorref, operatorskin);
    operatorcustomization.clothtype = getoperatorclothtype(operatorskin);
    operatorcustomization.geartype = function_e8770349a2b50bec(operatorskin);
    operatorcustomization.superfaction = getoperatorsuperfaction(operatorref);
    operatorcustomization.execution = getoperatorexecution(operatorref);
    operatorcustomization.executionquip = getoperatorexecutionquip(operatorref);
    operatorcustomization.parachute = function_66b30579f9f18786();
    if (getdvarint(@"hash_4753586a2ac8718f", 0) == 1) {
        operatorcustomization.suit = function_1a29e257d3433d8c(operatorskin);
    } else {
        operatorcustomization.suit = function_ada9a2308a4046e2(operatorref);
    }
    operatorcustomization.brinfilsmokesuffix = getoperatorbrinfilsmokesuffix();
    operatorcustomization.rebuild = 0;
    self.operatorcustomization = operatorcustomization;
    customization = getoperatorcustomization();
    body = customization[0];
    head = customization[1];
    if (!isagent(self)) {
        self setcustomization(body, head);
        bodymodelname = self getcustomizationbody();
        bodymodelname = function_4baf40dc0ba10b6b(bodymodelname, head);
        headmodelname = self getcustomizationhead();
        var_e69fcb0bb9e108b = self getcustomizationviewmodel();
        viewmodelname = getplayerviewmodelfrombody(body);
    } else if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        bodymodelname = "fullbody_usmc_ar_br_infil";
        headmodelname = undefined;
        var_e69fcb0bb9e108b = "viewhands_mp_base_iw8";
        viewmodelname = "viewhands_mp_base_iw8";
    } else {
        bodymodelname = "body_opforce_london_terrorist_1_2";
        headmodelname = "head_male_bc_03";
        var_e69fcb0bb9e108b = "viewmodel_mp_base_iw8";
        viewmodelname = "viewmodel_mp_base_iw8";
    }
    self.operatorcustomization.body = body;
    self.operatorcustomization.defaultbody = bodymodelname;
    self.operatorcustomization.head = head;
    self.operatorcustomization.defaulthead = headmodelname;
    self.operatorcustomization.vm = viewmodelname;
    self.operatorcustomization.defaultvm = var_e69fcb0bb9e108b;
    if (istrue(game["isLaunchChunk"])) {
        if (isbot(self)) {
            if (self.team == "allies") {
                self.operatorcustomization.voice = "ukft1";
            } else {
                self.operatorcustomization.voice = "ruft1";
            }
        }
    }
    if (!isagent(self) && !isbot(self) && !isdefined(self.vehiclecustomization)) {
        self.vehiclecustomization = scripts\cp_mp\vehicles\vehicle::function_1cd6d75165ecbc48();
    }
    function_1800697eba3f6660(self.operatorcustomization);
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58f4
// Size: 0x8d
function function_66b30579f9f18786() {
    parachute = undefined;
    lootid = self getplayerdata("common", "commonCustomization", "parachute");
    if (isdefined(lootid) && lootid != 0) {
        if (isdefined(level.var_8439ac7b613822b0) && isdefined(level.var_8439ac7b613822b0[lootid])) {
            if (!namespace_38b993c4618e76cd::function_8c610908c0e9c6e4(level.var_8439ac7b613822b0[lootid].bundle_name)) {
                parachute = level.var_8439ac7b613822b0[lootid].ref;
            }
        }
    }
    return parachute;
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x598a
// Size: 0xe7
function function_1800697eba3f6660(operatorcustomization) {
    var_cfbd5dfab1e96cb1 = getdvarint(@"hash_838359d5ebdcc7e0", 0);
    if (var_cfbd5dfab1e96cb1 == 0) {
        return;
    }
    var_e701b52b2bdc35c5 = getdvarint(@"hash_b77bb859108e69cd", 0);
    var_179dd20bbf6c2f02 = getdvarint(@"hash_91b801ddfb57ae8a", 0);
    if (utility::iscp() || !level.rankedmatch || !level.matchmakingmatch || !level.onlinestatsenabled) {
        return;
    }
    var_4a654bd9a395c1ff = [];
    if (var_e701b52b2bdc35c5 == 1) {
        var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = self.operatorcustomization.var_d947b7e87c7243ab;
    }
    if (var_179dd20bbf6c2f02 == 1) {
        var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = namespace_38b993c4618e76cd::getlootidfromref(self.operatorcustomization.execution);
    }
    self function_616c0ca219597829(var_4a654bd9a395c1ff);
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a79
// Size: 0x92
function lookupotheroperator(team) {
    if (!isplayer(self) && !isai(self) || !isdefined(team)) {
        return "";
    }
    teamindex = ter_op(team == "allies", 1, 0);
    operatorref = "";
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        if (level.teambased && !isai(self)) {
            operatorref = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operators", teamindex);
        }
    }
    return operatorref;
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b14
// Size: 0x43f
function lookupcurrentoperator(team) {
    if (!isdefined(team)) {
        assertex(0, "<dev string:x162>");
        return "";
    }
    if (!isplayer(self) && !isai(self)) {
        assertex(0, "<dev string:x1a0>");
        return "";
    }
    operatorref = undefined;
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.operatorref)) {
        operatorref = self.operatorcustomization.operatorref;
    } else if (isai(self) || self isplayerheadless()) {
        if (isdefined(self.botoperatorref)) {
            operatorref = self.botoperatorref;
        } else {
            function_d650608c959c9675();
            if (!isdefined(self.botoperatorteam)) {
                self.botoperatorteam = self.team;
                if (!isdefined(level.var_b113f6fe0e7c93bf[self.botoperatorteam])) {
                    var_a35e0c377810107e = getarraykeys(level.var_b113f6fe0e7c93bf);
                    if (self.team == "team_three") {
                        maxsize = -1;
                        foreach (team in var_a35e0c377810107e) {
                            if (level.var_b113f6fe0e7c93bf[team].size > maxsize) {
                                maxsize = level.var_b113f6fe0e7c93bf[team].size;
                                botoperatorteam = team;
                            }
                        }
                        self.botoperatorteam = botoperatorteam;
                    } else {
                        self.botoperatorteam = random(var_a35e0c377810107e);
                    }
                }
            }
            team = self.botoperatorteam;
            if (!isdefined(self.pers["operatorIndex"])) {
                selectedOperatorIndex = randomint(level.var_b113f6fe0e7c93bf[team].size);
                self.pers["operatorIndex"] = selectedOperatorIndex;
            } else {
                selectedOperatorIndex = self.pers["operatorIndex"];
            }
            currentindex = 0;
            foreach (operatorkey, var_eef96dced6dd39f1 in level.var_b113f6fe0e7c93bf[team]) {
                if (currentindex == selectedOperatorIndex) {
                    self.botoperatorref = operatorkey;
                    operatorref = operatorkey;
                    break;
                }
                currentindex++;
            }
        }
        if (!isdefined(operatorref) || operatorref == "") {
            assertmsg("<dev string:x1da>");
            operatorref = namespace_465d40bb08a5337a::function_9242a55834c7ead8(ter_op(team == "allies", 0, 1));
        }
    } else {
        var_e9a5f25420e74f74 = ter_op(team == "allies", 0, 1);
        if (function_1851de461471fd20()) {
            selectedOperatorIndex = self getplayerdata(level.loadoutsgroup, "customizationSetup", "selectedOperatorIndex");
            var_e9a5f25420e74f74 = selectedOperatorIndex;
        }
        if (!isdefined(self.defaultoperatorteam)) {
            if (var_e9a5f25420e74f74 == 0) {
                self.defaultoperatorteam = "allies";
            } else {
                self.defaultoperatorteam = "axis";
            }
        }
        if (scripts\cp_mp\utility\game_utility::isinfectedgametype() && team == "axis") {
            operatorref = "infected_western";
        } else {
            if (utility::issharedfuncdefined("instanceInventory", "getActiveOperatorLootID")) {
                operatorlootid = [[ utility::getsharedfunc("instanceInventory", "getActiveOperatorLootID") ]](self);
                operatorref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(operatorlootid);
            } else {
                operatorref = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operators", var_e9a5f25420e74f74);
            }
            if (getdvarint(@"hash_ac6f58a6e20ed4c2", 0) > 0) {
                if (var_e9a5f25420e74f74 == 0) {
                    operatorref = "jup_mp_delta";
                } else {
                    operatorref = "jup_mp_charlie";
                }
            }
            if (!isdefined(operatorref) || operatorref == "") {
                assertmsg("<dev string:x211>");
                operatorref = namespace_465d40bb08a5337a::function_9242a55834c7ead8(var_e9a5f25420e74f74);
            }
            if (!namespace_465d40bb08a5337a::function_54240a5fc41f6590(operatorref)) {
                println("<dev string:x24b>" + operatorref + "<dev string:x268>");
                operatorref = namespace_465d40bb08a5337a::function_9242a55834c7ead8(var_e9a5f25420e74f74);
            }
        }
    }
    return operatorref;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f5c
// Size: 0x93
function function_1851de461471fd20() {
    if (level.multiteambased || !level.teambased) {
        if (getgametype() == "xfire") {
            return is_equal(self.pers["team"], "team_three");
        } else {
            return 1;
        }
    }
    if (isdefined(level.gametypebundle)) {
        if (is_equal(level.gametypebundle.teambased, 1)) {
            return is_equal(level.gametypebundle.var_94b34756413246bd, 1);
        }
    }
    return 0;
}

// Namespace teams / scripts\mp\teams
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5ff8
// Size: 0x225
function function_47ba2341114690ad(clientnum, team) {
    var_a35e0c377810107e = getarraykeys(level.var_b113f6fe0e7c93bf);
    operatorref = undefined;
    if (!isdefined(self.var_e2c5b532eb1566ab)) {
        foreach (opteam in var_a35e0c377810107e) {
            var_ea61dcdcedf141e7 = getarraykeys(level.var_b113f6fe0e7c93bf[opteam]);
            if (!isdefined(level.headlessopindex)) {
                level.headlessopindex = [];
            }
            if (!isdefined(level.headlessopindex[opteam]) || level.headlessopindex[opteam] > var_ea61dcdcedf141e7.size) {
                level.headlessopindex[opteam] = 0;
            }
            targetref = var_ea61dcdcedf141e7[level.headlessopindex[opteam]];
            assert(var_ea61dcdcedf141e7.size > 1);
            while (isdefined(targetref) && (targetref == "default_western" || targetref == "default_eastern")) {
                level.headlessopindex[opteam] = level.headlessopindex[opteam] + 1;
                if (level.headlessopindex[opteam] > var_ea61dcdcedf141e7.size) {
                    level.headlessopindex[opteam] = 0;
                }
                targetref = var_ea61dcdcedf141e7[level.headlessopindex[opteam]];
            }
            level.headlessopindex[opteam] = level.headlessopindex[opteam] + 1;
            self.var_e2c5b532eb1566ab = targetref;
        }
        self.headlesscustomizationops = 1;
    }
    if (!isdefined(self.botoperatorteam)) {
        self.botoperatorteam = random(var_a35e0c377810107e);
    }
    if (getdvarint(@"hash_a67bcd0c90bdefe1", 0) == 1) {
        logprint("name            = " + self.name);
        logprint("clientNum       = " + clientnum);
        logprint("botOperatorTeam = " + self.botoperatorteam);
        logprint("operatorRef     = " + operatorref);
    }
    operatorref = self.var_e2c5b532eb1566ab;
    return operatorref;
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6226
// Size: 0x298
function function_ed273e317490cb02(operatorref) {
    team = getoperatorteambyref(operatorref);
    if (scripts\cp_mp\utility\game_utility::isinfectedgametype() && self.team == "axis" && getdvarint(@"hash_c9e3e2c3666bb281", 0) == 1) {
        self.pers["operatorSkinRef"] = function_45bf24706ce6aeef();
    } else if (scripts\cp_mp\utility\game_utility::isinfectedgametype() && self.team == "allies" && getdvarint(@"hash_ce84811e8f772df7", 0) == 1) {
        self.pers["operatorSkinRef"] = function_51e69e2a2754278d();
    } else if (function_6c88a48a9e942c3d()) {
        self.pers["operatorSkinRef"] = function_45bf24706ce6aeef();
    } else if (isdefined(self.team) && self.team == "axis" && getdvarint(@"hash_4753586a2ac8718f", 0) == 1) {
        self.pers["operatorSkinRef"] = function_523d23443e43909c();
    } else if (isdefined(self.team) && self.team == "allies" && getdvarint(@"hash_4753586a2ac8718f", 0) == 1) {
        self.pers["operatorSkinRef"] = function_143d479c862a125f();
    } else if (isdefined(self.team) && self.team == "axis" && function_4ef12b6ed882dc9b()) {
        self.pers["operatorSkinRef"] = function_dc7975eb5711e101();
    } else if (isdefined(self.team) && self.team == "allies" && function_4ef12b6ed882dc9b()) {
        self.pers["operatorSkinRef"] = function_e3a9bccddf207ec6();
    } else if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref)) {
        self.pers["operatorSkinRef"] = self.operatorcustomization.skinref;
    } else if (isai(self) || self isplayerheadless()) {
        self.pers["operatorSkinRef"] = botpickskinid(operatorref);
    } else {
        self.pers["operatorSkinRef"] = namespace_465d40bb08a5337a::function_b3b2c9581b1eea75(operatorref);
    }
    return self.pers["operatorSkinRef"];
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x64c7
// Size: 0xeb
function private function_45bf24706ce6aeef() {
    if (getdvarint(@"hash_15da2a2e260eac5e") == 1) {
        if (isdefined(self.pers["operatorSkinRef"]) && (self.pers["operatorSkinRef"] == getdvar(@"hash_c997af43c2e9cad1") || self.pers["operatorSkinRef"] == getdvar(@"hash_23c98470d0fc89e8"))) {
            return self.pers["operatorSkinRef"];
        }
        return function_b834526542f5f364();
    }
    if (!isdefined(level.var_b810c5c259078d91)) {
        var_42956aa4dce9589b = getdvar(@"hash_c997af43c2e9cad1");
        if (isdefined(var_42956aa4dce9589b) && var_42956aa4dce9589b != "" && isdefined(function_a2f84a43b99f877a(var_42956aa4dce9589b))) {
            level.var_b810c5c259078d91 = var_42956aa4dce9589b;
        } else {
            level.var_b810c5c259078d91 = "infected_western_a_halloween";
        }
    }
    return level.var_b810c5c259078d91;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x65bb
// Size: 0xeb
function private function_51e69e2a2754278d() {
    if (getdvarint(@"hash_30467475d23368bc") == 1) {
        if (isdefined(self.pers["operatorSkinRef"]) && (self.pers["operatorSkinRef"] == getdvar(@"hash_ff1e67478325c867") || self.pers["operatorSkinRef"] == getdvar(@"hash_11f8a0acb74bc22e"))) {
            return self.pers["operatorSkinRef"];
        }
        return function_b834526542f5f364();
    }
    if (!isdefined(level.var_8e01b22b786cdb2a)) {
        var_dc73bcb32bc62ed0 = getdvar(@"hash_ff1e67478325c867");
        if (isdefined(var_dc73bcb32bc62ed0) && var_dc73bcb32bc62ed0 != "" && isdefined(function_a2f84a43b99f877a(var_dc73bcb32bc62ed0))) {
            level.var_8e01b22b786cdb2a = var_dc73bcb32bc62ed0;
        } else {
            level.var_8e01b22b786cdb2a = "klaus_western_a";
        }
    }
    return level.var_8e01b22b786cdb2a;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x66af
// Size: 0xbd
function private function_b834526542f5f364() {
    if (self.team == "axis") {
        var_42956aa4dce9589b = getdvar(@"hash_c997af43c2e9cad1");
        var_9815a2b7d4a37d5a = getdvar(@"hash_23c98470d0fc89e8");
        skin = ter_op(randomint(2) == 0, var_42956aa4dce9589b, var_9815a2b7d4a37d5a);
        return skin;
    }
    if (self.team == "allies") {
        var_141c13ac16e83ddd = getdvar(@"hash_ff1e67478325c867");
        var_7e2b1756c4a45e3c = getdvar(@"hash_11f8a0acb74bc22e");
        skin = ter_op(randomint(2) == 0, var_141c13ac16e83ddd, var_7e2b1756c4a45e3c);
        return skin;
    }
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6774
// Size: 0x2e
function private function_523d23443e43909c() {
    skin = ter_op(randomint(2), "jup_mp_price_16_skin", "jup_mp_farah_13_skin");
    function_1842592e93b27ffd(skin);
    return skin;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x67ab
// Size: 0x2e
function private function_143d479c862a125f() {
    skin = ter_op(randomint(2), "jup_mp_soap_14_skin", "jup_mp_ghost_16_skin");
    function_1842592e93b27ffd(skin);
    return skin;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x67e2
// Size: 0x1c
function private function_dc7975eb5711e101() {
    skin = "jup_mp_lambda_15_skin";
    function_5908c8ee9ec5ed78(skin);
    return skin;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6807
// Size: 0x1c
function private function_e3a9bccddf207ec6() {
    skin = "jup_mp_mike_31_skin";
    function_5908c8ee9ec5ed78(skin);
    return skin;
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x682c
// Size: 0x54
function private function_1842592e93b27ffd(operatorSkinRef) {
    body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(operatorSkinRef);
    var_f9d65f39430f5753 = namespace_465d40bb08a5337a::function_223061772e2a61b9(operatorSkinRef);
    var_f9d66039430f5986 = getsubstr(var_f9d65f39430f5753, 0, var_f9d65f39430f5753.size - 1) + "b";
    self loadcustomization(body, var_f9d66039430f5986);
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6888
// Size: 0x38
function private function_5908c8ee9ec5ed78(operatorSkinRef) {
    body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(operatorSkinRef);
    var_f9d65f39430f5753 = namespace_465d40bb08a5337a::function_223061772e2a61b9(operatorSkinRef);
    self loadcustomization(body, var_f9d65f39430f5753);
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x68c8
// Size: 0x54
function private function_1a29e257d3433d8c(operatorSkinRef) {
    if (operatorSkinRef == "jup_mp_price_16_skin") {
        return "iw9_suit_price_mp";
    }
    if (operatorSkinRef == "jup_mp_farah_13_skin") {
        return "iw9_suit_farah_mp";
    }
    if (operatorSkinRef == "jup_mp_soap_14_skin") {
        return "iw9_suit_soap_mp";
    }
    if (operatorSkinRef == "jup_mp_ghost_16_skin") {
        return "iw9_suit_ghost_mp";
    }
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6924
// Size: 0x65
function botpickskinid(operatorref) {
    team = ter_op(isdefined(self.botoperatorteam), self.botoperatorteam, self.team);
    randomindex = randomint(level.var_b113f6fe0e7c93bf[team][operatorref].size);
    return level.var_b113f6fe0e7c93bf[team][operatorref][randomindex];
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6992
// Size: 0x98
function picklaunchchunkoperatorskin(team) {
    if (!isdefined(level.launchchunkskins)) {
        level.launchchunkskins = [];
        level.launchchunkskins["allies"] = 0;
        level.launchchunkskins["axis"] = 0;
    }
    if (!isdefined(self.launchchunkcustomizationindex)) {
        if (level.launchchunkskins[team] == 2) {
            level.launchchunkskins[team] = 0;
        }
        self.launchchunkcustomizationindex = level.launchchunkskins[team];
        level.launchchunkskins[team]++;
    }
    return self.launchchunkcustomizationindex;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a33
// Size: 0x3c6
function getoperatorcustomization() {
    customization = [];
    body = undefined;
    head = undefined;
    if (istrue(game["isLaunchChunk"])) {
        initlaunchchunkoperatorskins();
        if (!isdefined(self.pers["defaultOperatorSkinIndex"])) {
            self.pers["defaultOperatorSkinIndex"] = picklaunchchunkoperatorskin(self.team);
        }
        body = level.defaultoperatorskins[self.team]["body"][self.pers["defaultOperatorSkinIndex"]];
        head = level.defaultoperatorskins[self.team]["head"][self.pers["defaultOperatorSkinIndex"]];
        customization[0] = body;
        customization[1] = head;
    } else {
        operatorSkinRef = undefined;
        if (!isdefined(self.operatorcustomization)) {
            createoperatorcustomization();
        }
        operatorSkinRef = self.operatorcustomization.skinref;
        if (isdefined(level.modegetforceoperatorcustomization)) {
            operatorref = namespace_465d40bb08a5337a::function_605079124463a67b(operatorSkinRef);
            var_c00a326249963ab5 = [[ level.modegetforceoperatorcustomization ]](self, operatorref, operatorSkinRef);
            operatorSkinRef = var_c00a326249963ab5[1];
            operatorIndex = var_c00a326249963ab5[0];
        }
        if (operatorSkinRef == "274" || operatorSkinRef == "275") {
            initdefaultoperatorskins();
            var_3060e7b91e020425 = level.teambased && !scripts\cp_mp\utility\game_utility::isbrstylegametype();
            if (!isdefined(self.defaultoperatorteam) || var_3060e7b91e020425 && self.defaultoperatorteam != self.team && (self.team == "allies" || self.team == "axis")) {
                self.defaultoperatorteam = self.team;
                if (self.team != "allies" && self.team != "axis") {
                    self.defaultoperatorteam = ter_op(cointoss(), "allies", "axis");
                }
            }
            if (!isdefined(self.pers["defaultOperatorSkinIndex"])) {
                self.pers["defaultOperatorSkinIndex"] = randomint(level.defaultoperatorskins[self.defaultoperatorteam]["body"].size);
            }
            body = level.defaultoperatorskins[self.defaultoperatorteam]["body"][self.pers["defaultOperatorSkinIndex"]];
            if (!isdefined(self.pers["defaultOperatorHeadIndex"])) {
                self.pers["defaultOperatorHeadIndex"] = randomint(level.defaultoperatorskins[self.defaultoperatorteam]["head"][self.pers["defaultOperatorSkinIndex"]].size);
            }
            head = level.defaultoperatorskins[self.defaultoperatorteam]["head"][self.pers["defaultOperatorSkinIndex"]][self.pers["defaultOperatorHeadIndex"]];
        } else {
            body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(operatorSkinRef);
            head = namespace_465d40bb08a5337a::function_223061772e2a61b9(operatorSkinRef);
        }
        if (body == "" || head == "") {
            assertmsg("<dev string:x29b>" + head + "<dev string:x2dd>" + body);
            var_f91a44e31cde7d97 = namespace_465d40bb08a5337a::function_df7d12571397a2b5(self.operatorcustomization.operatorref);
            body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(var_f91a44e31cde7d97);
            head = namespace_465d40bb08a5337a::function_223061772e2a61b9(var_f91a44e31cde7d97);
        }
        self.bodymodelname = body;
        self.backuphead = head;
        customization[0] = body;
        customization[1] = head;
    }
    return customization;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e02
// Size: 0x120
function initlaunchchunkoperatorskins() {
    if (isdefined(level.defaultoperatorskins)) {
        return;
    }
    level.defaultoperatorskins = [];
    level.defaultoperatorskins["allies"] = [];
    level.defaultoperatorskins["allies"]["body"] = ["body_mp_western_fireteam_west_dmr_1_1_lod1", "body_mp_western_fireteam_west_ar_1_1_lod1"];
    level.defaultoperatorskins["allies"]["head"] = ["head_mp_western_fireteam_west_dmr_2_1", "head_mp_western_fireteam_west_ar_1_1"];
    level.defaultoperatorskins["allies"]["suit"] = ["iw8_suit_mp_wyatt"];
    level.defaultoperatorskins["axis"] = [];
    level.defaultoperatorskins["axis"]["body"] = ["body_mp_eastern_fireteam_east_ar_lod1", "body_mp_eastern_fireteam_east_lmg_lod1"];
    level.defaultoperatorskins["axis"]["head"] = ["head_mp_eastern_fireteam_east_ar_2", "head_mp_eastern_fireteam_east_lmg"];
    level.defaultoperatorskins["axis"]["suit"] = ["iw8_suit_mp_wyatt"];
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f2a
// Size: 0xa81
function initdefaultoperatorskins() {
    if (isdefined(level.defaultoperatorskins)) {
        return;
    }
    level.defaultoperatorskins = [];
    level.defaultoperatorskins["allies"] = [];
    level.defaultoperatorskins["axis"] = [];
    switch (game["allies_outfit"]) {
    case #"hash_f3ebd2b661f2fb7b":
        level.defaultoperatorskins["allies"]["body"] = ["body_mp_western_fireteam_west_ar_1_1_lod1", "body_mp_western_fireteam_west_smg_1_1_lod1", "body_mp_western_fireteam_west_dmr_1_1_lod1", "body_mp_western_fireteam_west_lmg_1_1_lod1", "body_mp_western_fireteam_west_sg_1_1_lod1"];
        level.defaultoperatorskins["allies"]["head"][0] = ["head_mp_western_fireteam_west_ar_1_1", "head_mp_western_fireteam_west_ar_2_1", "head_mp_western_fireteam_west_ar_1_1", "head_mp_western_fireteam_west_ar_2_1"];
        level.defaultoperatorskins["allies"]["head"][1] = ["head_mp_western_fireteam_west_smg_1_1", "head_mp_western_fireteam_west_smg_2_1", "head_mp_western_fireteam_west_smg_1_1"];
        level.defaultoperatorskins["allies"]["head"][2] = ["head_mp_western_fireteam_west_dmr_1_1", "head_mp_western_fireteam_west_dmr_2_1"];
        level.defaultoperatorskins["allies"]["head"][3] = ["head_mp_western_fireteam_west_lmg_1_1", "head_mp_western_fireteam_west_lmg_2_1"];
        level.defaultoperatorskins["allies"]["head"][4] = ["head_mp_western_fireteam_west_sg_1_1", "head_mp_western_fireteam_west_sg_2_1"];
        break;
    case #"hash_92a46c94f7204a1c":
        level.defaultoperatorskins["allies"]["body"] = ["body_mp_western_fireteam_west_ar_1_2_lod1", "body_mp_western_fireteam_west_smg_1_2_lod1", "body_mp_western_fireteam_west_dmr_1_2_lod1", "body_mp_western_fireteam_west_lmg_1_2_lod1", "body_mp_western_fireteam_west_sg_1_2_lod1"];
        level.defaultoperatorskins["allies"]["head"][0] = ["head_mp_western_fireteam_west_ar_1_2", "head_mp_western_fireteam_west_ar_2_2", "head_mp_western_fireteam_west_ar_1_2", "head_mp_western_fireteam_west_ar_2_2"];
        level.defaultoperatorskins["allies"]["head"][1] = ["head_mp_western_fireteam_west_smg_1_2", "head_mp_western_fireteam_west_smg_2_2", "head_mp_western_fireteam_west_smg_1_2"];
        level.defaultoperatorskins["allies"]["head"][2] = ["head_mp_western_fireteam_west_dmr_1_2", "head_mp_western_fireteam_west_dmr_2_2"];
        level.defaultoperatorskins["allies"]["head"][3] = ["head_mp_western_fireteam_west_lmg_1_2", "head_mp_western_fireteam_west_lmg_2_2"];
        level.defaultoperatorskins["allies"]["head"][4] = ["head_mp_western_fireteam_west_sg_1_2", "head_mp_western_fireteam_west_sg_2_2"];
        break;
    case #"hash_a61c1051c8140ed":
        level.defaultoperatorskins["allies"]["body"] = ["body_mp_western_fireteam_west_ar_1_3_lod1", "body_mp_western_fireteam_west_smg_1_3_lod1", "body_mp_western_fireteam_west_dmr_1_3_lod1", "body_mp_western_fireteam_west_lmg_1_3_lod1", "body_mp_western_fireteam_west_sg_1_3_lod1"];
        level.defaultoperatorskins["allies"]["head"][0] = ["head_mp_western_fireteam_west_ar_1_3", "head_mp_western_fireteam_west_ar_2_3", "head_mp_western_fireteam_west_ar_1_3", "head_mp_western_fireteam_west_ar_2_3"];
        level.defaultoperatorskins["allies"]["head"][1] = ["head_mp_western_fireteam_west_smg_1_3", "head_mp_western_fireteam_west_smg_2_3", "head_mp_western_fireteam_west_smg_1_3"];
        level.defaultoperatorskins["allies"]["head"][2] = ["head_mp_western_fireteam_west_dmr_1_3", "head_mp_western_fireteam_west_dmr_2_3"];
        level.defaultoperatorskins["allies"]["head"][3] = ["head_mp_western_fireteam_west_lmg_1_3", "head_mp_western_fireteam_west_lmg_2_3"];
        level.defaultoperatorskins["allies"]["head"][4] = ["head_mp_western_fireteam_west_sg_1_3", "head_mp_western_fireteam_west_sg_2_3"];
        break;
    default:
        level.defaultoperatorskins["allies"]["body"] = ["body_mp_western_fireteam_west_ar_1_1_lod1", "body_mp_western_fireteam_west_smg_1_1_lod1", "body_mp_western_fireteam_west_dmr_1_1_lod1", "body_mp_western_fireteam_west_lmg_1_1_lod1", "body_mp_western_fireteam_west_sg_1_1_lod1"];
        level.defaultoperatorskins["allies"]["head"][0] = ["head_mp_western_fireteam_west_ar_1_1", "head_mp_western_fireteam_west_ar_2_1", "head_mp_western_fireteam_west_ar_1_1", "head_mp_western_fireteam_west_ar_2_1"];
        level.defaultoperatorskins["allies"]["head"][1] = ["head_mp_western_fireteam_west_smg_1_1", "head_mp_western_fireteam_west_smg_2_1", "head_mp_western_fireteam_west_smg_1_1"];
        level.defaultoperatorskins["allies"]["head"][2] = ["head_mp_western_fireteam_west_dmr_1_1", "head_mp_western_fireteam_west_dmr_2_1"];
        level.defaultoperatorskins["allies"]["head"][3] = ["head_mp_western_fireteam_west_lmg_1_1", "head_mp_western_fireteam_west_lmg_2_1"];
        level.defaultoperatorskins["allies"]["head"][4] = ["head_mp_western_fireteam_west_sg_1_1", "head_mp_western_fireteam_west_sg_2_1"];
        break;
    }
    switch (game["axis_outfit"]) {
    case #"hash_f3ebd2b661f2fb7b":
        level.defaultoperatorskins["axis"]["body"] = ["body_mp_eastern_fireteam_east_ar_lod1", "body_mp_eastern_fireteam_east_smg_lod1", "body_mp_eastern_fireteam_east_dmr_lod1", "body_mp_eastern_fireteam_east_lmg_lod1", "body_mp_eastern_fireteam_east_sg_lod1"];
        level.defaultoperatorskins["axis"]["head"][0] = ["head_mp_eastern_fireteam_east_ar_1", "head_mp_eastern_fireteam_east_ar_2", "head_mp_eastern_fireteam_east_ar_3", "head_mp_eastern_fireteam_east_ar_4"];
        level.defaultoperatorskins["axis"]["head"][1] = ["head_mp_eastern_fireteam_east_smg_1", "head_mp_eastern_fireteam_east_smg_2", "head_mp_eastern_fireteam_east_smg_3"];
        level.defaultoperatorskins["axis"]["head"][2] = ["head_mp_eastern_fireteam_east_dmr", "head_mp_eastern_fireteam_east_dmr"];
        level.defaultoperatorskins["axis"]["head"][3] = ["head_mp_eastern_fireteam_east_lmg", "head_mp_eastern_fireteam_east_lmg"];
        level.defaultoperatorskins["axis"]["head"][4] = ["head_mp_eastern_fireteam_east_sg", "head_mp_eastern_fireteam_east_sg"];
        break;
    case #"hash_92a46c94f7204a1c":
        level.defaultoperatorskins["axis"]["body"] = ["body_mp_eastern_fireteam_east_ar_2_lod1", "body_mp_eastern_fireteam_east_smg_2_lod1", "body_mp_eastern_fireteam_east_dmr_2_lod1", "body_mp_eastern_fireteam_east_lmg_2_lod1", "body_mp_eastern_fireteam_east_sg_2_lod1"];
        level.defaultoperatorskins["axis"]["head"][0] = ["head_mp_eastern_fireteam_east_ar_1_2", "head_mp_eastern_fireteam_east_ar_2_2", "head_mp_eastern_fireteam_east_ar_3_2", "head_mp_eastern_fireteam_east_ar_4_2"];
        level.defaultoperatorskins["axis"]["head"][1] = ["head_mp_eastern_fireteam_east_smg_1_2", "head_mp_eastern_fireteam_east_smg_2_2", "head_mp_eastern_fireteam_east_smg_3_2"];
        level.defaultoperatorskins["axis"]["head"][2] = ["head_mp_eastern_fireteam_east_dmr", "head_mp_eastern_fireteam_east_dmr"];
        level.defaultoperatorskins["axis"]["head"][3] = ["head_mp_eastern_fireteam_east_lmg", "head_mp_eastern_fireteam_east_lmg"];
        level.defaultoperatorskins["axis"]["head"][4] = ["head_mp_eastern_fireteam_east_sg", "head_mp_eastern_fireteam_east_sg"];
        break;
    case #"hash_a61c1051c8140ed":
        level.defaultoperatorskins["axis"]["body"] = ["body_mp_eastern_fireteam_east_ar_3_lod1", "body_mp_eastern_fireteam_east_smg_3_lod1", "body_mp_eastern_fireteam_east_dmr_3_lod1", "body_mp_eastern_fireteam_east_lmg_3_lod1", "body_mp_eastern_fireteam_east_sg_3_lod1"];
        level.defaultoperatorskins["axis"]["head"][0] = ["head_mp_eastern_fireteam_east_ar_1_3", "head_mp_eastern_fireteam_east_ar_2_3", "head_mp_eastern_fireteam_east_ar_3_3", "head_mp_eastern_fireteam_east_ar_4_3"];
        level.defaultoperatorskins["axis"]["head"][1] = ["head_mp_eastern_fireteam_east_smg_1_3", "head_mp_eastern_fireteam_east_smg_2_3", "head_mp_eastern_fireteam_east_smg_3_3"];
        level.defaultoperatorskins["axis"]["head"][2] = ["head_mp_eastern_fireteam_east_dmr", "head_mp_eastern_fireteam_east_dmr"];
        level.defaultoperatorskins["axis"]["head"][3] = ["head_mp_eastern_fireteam_east_lmg", "head_mp_eastern_fireteam_east_lmg"];
        level.defaultoperatorskins["axis"]["head"][4] = ["head_mp_eastern_fireteam_east_sg", "head_mp_eastern_fireteam_east_sg"];
        break;
    default:
        level.defaultoperatorskins["axis"]["body"] = ["body_mp_eastern_fireteam_east_ar_lod1", "body_mp_eastern_fireteam_east_smg_lod1", "body_mp_eastern_fireteam_east_dmr_lod1", "body_mp_eastern_fireteam_east_lmg_lod1", "body_mp_eastern_fireteam_east_sg_lod1"];
        level.defaultoperatorskins["axis"]["head"][0] = ["head_mp_eastern_fireteam_east_ar_1", "head_mp_eastern_fireteam_east_ar_2", "head_mp_eastern_fireteam_east_ar_3", "head_mp_eastern_fireteam_east_ar_4"];
        level.defaultoperatorskins["axis"]["head"][1] = ["head_mp_eastern_fireteam_east_smg_1", "head_mp_eastern_fireteam_east_smg_2", "head_mp_eastern_fireteam_east_smg_3"];
        level.defaultoperatorskins["axis"]["head"][2] = ["head_mp_eastern_fireteam_east_dmr"];
        level.defaultoperatorskins["axis"]["head"][3] = ["head_mp_eastern_fireteam_east_lmg"];
        level.defaultoperatorskins["axis"]["head"][4] = ["head_mp_eastern_fireteam_east_sg"];
        break;
    }
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x79b3
// Size: 0xc1
function pickdefaultoperatorskin(weapon) {
    selectedindex = 0;
    if (isdefined(weapon)) {
        weapongroup = scripts\mp\utility\weapon::getweapongroup(weapon);
        switch (weapongroup) {
        case #"hash_8af0086b038622b5":
        case #"hash_dd616da0b395a0b0":
            selectedindex = 0;
            break;
        case #"hash_ab10f9c080fe4faf":
            selectedindex = 1;
            break;
        case #"hash_47368bc0d2ef1565":
        case #"hash_c095d67337b1f5a1":
            selectedindex = 2;
            break;
        case #"hash_bef5ec0b3e197ae":
            selectedindex = 3;
            break;
        case #"hash_16cf6289ab06bd30":
            selectedindex = 4;
            break;
        default:
            selectedindex = 1;
            break;
        }
    }
    return selectedindex;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a7d
// Size: 0x30d
function getglcustomization() {
    weapon = self.primaryweapon;
    weapongroup = scripts\mp\utility\weapon::getweapongroup(weapon);
    lethal = self.loadoutequipmentprimary;
    var_90a6afada84f104 = undefined;
    var_6d05573579e8816a = undefined;
    lethalsuffix = undefined;
    if (lethal == "equip_helmet") {
        lethalsuffix = "_blstk";
    } else {
        lethalsuffix = "";
    }
    switch (self.team) {
    case #"hash_5f54b9bf7583687f":
        faction = "usmc";
        if (gameflag("infil_will_run") && !gameflag("prematch_done")) {
            weathersuffix = "_wind";
        } else {
            weathersuffix = "";
        }
        switch (weapongroup) {
        case #"hash_16cf6289ab06bd30":
        case #"hash_ab10f9c080fe4faf":
            var_90a6afada84f104 = "_cqc";
            var_6d05573579e8816a = "_cqc";
            break;
        case #"hash_8af0086b038622b5":
        case #"hash_dd616da0b395a0b0":
            var_90a6afada84f104 = "_ar";
            var_6d05573579e8816a = "_ar";
            break;
        case #"hash_bef5ec0b3e197ae":
            var_90a6afada84f104 = "_ar";
            var_6d05573579e8816a = "_lmg";
            break;
        case #"hash_47368bc0d2ef1565":
        case #"hash_c095d67337b1f5a1":
            var_90a6afada84f104 = "_cqc";
            var_6d05573579e8816a = "_cqc";
            break;
        default:
            var_90a6afada84f104 = "_ar";
            var_6d05573579e8816a = "_ar";
            break;
        }
        break;
    case #"hash_7c2d091e6337bf54":
        faction = "sa_militia";
        weathersuffix = "";
        switch (weapongroup) {
        case #"hash_16cf6289ab06bd30":
        case #"hash_ab10f9c080fe4faf":
            var_90a6afada84f104 = "_cqc";
            var_6d05573579e8816a = "_cqc";
            break;
        case #"hash_8af0086b038622b5":
        case #"hash_dd616da0b395a0b0":
            var_90a6afada84f104 = "_ar";
            var_6d05573579e8816a = "_ar";
            break;
        case #"hash_bef5ec0b3e197ae":
            var_90a6afada84f104 = "_lmg";
            var_6d05573579e8816a = "_lmg";
            break;
        case #"hash_47368bc0d2ef1565":
        case #"hash_c095d67337b1f5a1":
            var_90a6afada84f104 = "_ar";
            var_6d05573579e8816a = "_ar";
            break;
        default:
            var_90a6afada84f104 = "_ar";
            var_6d05573579e8816a = "_ar";
            break;
        }
        break;
    default:
        faction = "usmc";
        weathersuffix = "";
        var_90a6afada84f104 = "_ar";
        var_6d05573579e8816a = "_ar";
        break;
    }
    body = "body_" + faction + var_90a6afada84f104 + weathersuffix;
    head = "head_" + faction + var_6d05573579e8816a + lethalsuffix;
    self.backuphead = "head_" + faction + var_6d05573579e8816a;
    self.bodymodelname = "body_" + faction + var_90a6afada84f104;
    customization = [];
    customization[0] = body;
    customization[1] = head;
    return customization;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d93
// Size: 0x2da
function getglcustomizationhackney() {
    weapon = self.primaryweapon;
    weapongroup = scripts\mp\utility\weapon::getweapongroup(weapon);
    lethal = self.loadoutequipmentprimary;
    var_90a6afada84f104 = undefined;
    var_6d05573579e8816a = undefined;
    lethalsuffix = undefined;
    if (lethal == "equip_helmet") {
        lethalsuffix = "_blstk";
    } else {
        lethalsuffix = "";
    }
    switch (self.team) {
    case #"hash_5f54b9bf7583687f":
        faction = "sas_urban";
        if (gameflag("infil_will_run") && !gameflag("prematch_done")) {
            weathersuffix = "";
        } else {
            weathersuffix = "_rain";
        }
        switch (weapongroup) {
        case #"hash_16cf6289ab06bd30":
        case #"hash_ab10f9c080fe4faf":
            var_90a6afada84f104 = "_cqc";
            var_6d05573579e8816a = "_mp_cqc";
            break;
        case #"hash_8af0086b038622b5":
        case #"hash_dd616da0b395a0b0":
            var_90a6afada84f104 = "_ar";
            var_6d05573579e8816a = "_ar";
            break;
        case #"hash_bef5ec0b3e197ae":
            var_90a6afada84f104 = "_lmg";
            var_6d05573579e8816a = "_lmg";
            break;
        case #"hash_47368bc0d2ef1565":
        case #"hash_c095d67337b1f5a1":
            var_90a6afada84f104 = "_dmr";
            var_6d05573579e8816a = "_mp_dmr";
            break;
        default:
            var_90a6afada84f104 = "_ar";
            var_6d05573579e8816a = "_ar";
            break;
        }
        break;
    case #"hash_7c2d091e6337bf54":
        faction = "al_qatala";
        weathersuffix = "";
        switch (weapongroup) {
        case #"hash_bef5ec0b3e197ae":
        case #"hash_16cf6289ab06bd30":
        case #"hash_47368bc0d2ef1565":
        case #"hash_8af0086b038622b5":
        case #"hash_ab10f9c080fe4faf":
        case #"hash_c095d67337b1f5a1":
        case #"hash_dd616da0b395a0b0":
            var_90a6afada84f104 = "_1_ar";
            var_6d05573579e8816a = "_ar";
            break;
        default:
            var_90a6afada84f104 = "_1_ar";
            var_6d05573579e8816a = "_ar";
            break;
        }
        break;
    default:
        faction = "usmc";
        weathersuffix = "";
        var_90a6afada84f104 = "_ar";
        var_6d05573579e8816a = "_ar";
        break;
    }
    body = "body_" + faction + var_90a6afada84f104 + weathersuffix;
    head = "head_" + faction + var_6d05573579e8816a + weathersuffix;
    self.backuphead = "head_" + faction + var_6d05573579e8816a;
    self.bodymodelname = "body_" + faction + var_90a6afada84f104;
    customization = [];
    customization[0] = body;
    customization[1] = head;
    return customization;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8076
// Size: 0xa4
function forcedefaultmodel() {
    if (self.team == "axis") {
        self setmodel("mp_fullbody_heavy");
        self setviewmodel("viewmodel_mp_base_iw8");
    } else {
        self setmodel("mp_body_infected_a");
        self setviewmodel("viewmodel_mp_base_iw8");
    }
    if (isdefined(self.headmodel)) {
        self detach(self.headmodel, "");
        self.headmodel = undefined;
    }
    self attach("head_mp_infected", "", 1);
    self.headmodel = "head_mp_infected";
    self setclothtype(#"cloth");
}

/#

    // Namespace teams / scripts\mp\teams
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x8122
    // Size: 0x92
    function function_5933f55517e82c57() {
        if (getdvarint(@"hash_ff213c5a6a5e05e4", 0) == 1) {
            return;
        }
        level endon("<dev string:x2ea>");
        for (;;) {
            foreach (player in level.players) {
                player getplayerdata("<dev string:x2fe>", "<dev string:x308>", "<dev string:x319>", "<dev string:x328>");
            }
            wait 0.05;
        }
    }

#/

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x81bc
// Size: 0x143
function private function_8075b157830461e0() {
    if (getdvarint(@"hash_11e4f85d7c35874e", 0) && isdefined(level.players) && level.players.size > 0) {
        var_363dfdcaf05d82e0 = getdvarfloat(@"hash_ec95630806957d09", level.framedurationseconds);
        var_5af9fdb2229b2cec = var_363dfdcaf05d82e0 / level.players.size;
        if (var_5af9fdb2229b2cec > level.framedurationseconds) {
            if (isdefined(level.var_fa5689aa69fdbd8a)) {
                throttle_destroy(level.var_fa5689aa69fdbd8a);
            }
            level.var_fa5689aa69fdbd8a = throttle_initialize("teams_afk_player", 1, var_5af9fdb2229b2cec);
            println("<dev string:x32e>" + 1 + "<dev string:x35c>" + var_5af9fdb2229b2cec + "<dev string:x379>" + level.players.size + "<dev string:x38c>" + gettime() + "<dev string:x393>");
            return true;
        }
        if (isdefined(level.var_fa5689aa69fdbd8a)) {
            println("<dev string:x398>");
            level.var_fa5689aa69fdbd8a = undefined;
        }
        println("<dev string:x437>" + var_363dfdcaf05d82e0 + "<dev string:x474>" + level.framedurationseconds + "<dev string:x4a6>" + level.players.size);
    }
    return false;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8308
// Size: 0x258
function watchafk() {
    if (getdvarint(@"hash_b66208719c6bae6a", 0) == 1) {
        return;
    }
    gameflagwait("prematch_done");
    infirstround = isdefined(game["roundsPlayed"]) && game["roundsPlayed"] == 0;
    var_e82b77c55ccc4f76 = gettime();
    var_7b9be079890a7b0 = getdvarfloat(@"hash_444f3c8b2a24404e", 35);
    var_7b9be079890a7b0 *= 1000;
    var_b5ec3f69645ca491 = getdvarint(@"hash_2ea000db61daba7b", 30);
    var_f2b8892cfaa7df7a = getdvarint(@"hash_eb6378a8e84c183", 60);
    var_a4c838400457da2e = getdvarint(@"hash_f6abc159163cdafa", 60);
    var_17f6e610b4c861a7 = getdvarint(@"hash_dc406362e8a37974", 60);
    var_cb0d938e64f611fc = getdvarint(@"hash_8eee933f8b6a65ec", 1);
    var_9bce2d454a1f6e47 = getdvarint(@"hash_dd0bcad4d12f8993", 1);
    level.var_e04e8f03163c0385 = getdvarint(@"hash_213cadd687024445", 15);
    function_8075b157830461e0();
    previousplayercount = level.players.size;
    nexttoupdate = 0;
    while (true) {
        nexttoupdate++;
        if (nexttoupdate >= level.players.size) {
            nexttoupdate = 0;
            if (previousplayercount != level.players.size) {
                function_8075b157830461e0();
                previousplayercount = level.players.size;
            }
        }
        if (isdefined(level.players[nexttoupdate])) {
            if (isai(level.players[nexttoupdate])) {
                waitframe();
                continue;
            }
            if (level.var_ec2fb549b15ad827) {
                if (var_cb0d938e64f611fc && infirstround && gettime() - var_e82b77c55ccc4f76 < var_7b9be079890a7b0) {
                    level.players[nexttoupdate] checkforafk(var_9bce2d454a1f6e47, var_b5ec3f69645ca491, var_f2b8892cfaa7df7a);
                } else {
                    level.players[nexttoupdate] checkforafk(var_9bce2d454a1f6e47, var_a4c838400457da2e, var_17f6e610b4c861a7);
                }
            } else {
                level.players[nexttoupdate] checkforafk();
            }
        }
        if (isdefined(level.var_fa5689aa69fdbd8a)) {
            var_6085d6e241f50958 = spawnstruct();
            throttle::function_f632348cbb773537(level.var_fa5689aa69fdbd8a, var_6085d6e241f50958);
        } else {
            waitframe();
        }
        scripts\mp\hostmigration::waittillhostmigrationdone();
    }
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8568
// Size: 0xc8
function function_19300abfbb10928b() {
    timeplayed = default_to(scripts\mp\persistence::statgetchildbuffered("round", "timePlayed", 0), 0);
    timeDead = default_to(scripts\mp\utility\stats::getpersstat("timeDead"), 0);
    timeplayed = int(max(timeplayed - timeDead, 0));
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        timeplayed -= default_to(self.timeplayed["gulag"], 0);
        timeplayed -= default_to(self.timeplayed["resurgenceRespawn"], 0);
        timeplayed -= default_to(self.timeplayed["infil"], 0);
    }
    var_61c36317dfbafb1f = default_to(scripts\mp\utility\stats::getpersstat("timePlayedOnFirstSpawn"), 0);
    return timeplayed - var_61c36317dfbafb1f;
}

// Namespace teams / scripts\mp\teams
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8639
// Size: 0x55
function function_7b76ffd725358204(time, maxthreshold, warningtime) {
    checkstate = 0;
    if (time >= maxthreshold) {
        checkstate = 2;
    } else if (isdefined(warningtime) && warningtime > 0 && maxthreshold > warningtime) {
        if (time >= maxthreshold - warningtime) {
            checkstate = 1;
        }
    }
    return checkstate;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8697
// Size: 0x150
function dontConsiderAFK() {
    if (istrue(level.gameended) || !istrue(self.hasspawned)) {
        return true;
    }
    if (isdefined(self.c130) || istrue(self.brneverlanded)) {
        return true;
    }
    if (istrue(self.ffsm_isgulagrespawn)) {
        return true;
    }
    if (scripts\cp_mp\utility\game_utility::getgametype() == "bounty" && scripts\engine\utility::array_contains(level.bounty.hvts[self.pers["team"]], self)) {
        return true;
    }
    if (getgametype() == "warrior" && level.var_6298f362ec23d83.ref == "revive" && istrue(self.var_1391ec6ead831d00)) {
        return true;
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        if (self.sessionstate == "spectator" || self.sessionstate == "intermission" || self.sessionstate == "playing_but_spectating") {
            return true;
        }
        if (scripts\mp\gametypes\br_public::isplayeringulag()) {
            return true;
        }
        if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("dontConsiderAFK") && istrue(scripts\mp\gametypes\br_gametypes::runbrgametypefunc("dontConsiderAFK", self))) {
            return true;
        }
        if (istrue(scripts\mp\utility\stats::getpersstat("distTrackingPassed"))) {
            return true;
        }
    }
    return false;
}

// Namespace teams / scripts\mp\teams
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x87f0
// Size: 0x902
function checkforafk(var_6d2f7985df18659a, var_55d48eee7e287cda, var_bdbf4608f99aedb3) {
    if (getsubgametype() == "dmz") {
        return;
    }
    if (dontConsiderAFK()) {
        function_f66fc78c2cb0c0d3(self, "default", 0, 0);
        return;
    }
    if (!isdefined(self.var_73f7116f87a4fab6)) {
        self.var_73f7116f87a4fab6 = 0;
    } else if (self.var_73f7116f87a4fab6 > 0) {
        return;
    }
    if (!isdefined(scripts\mp\utility\stats::getpersstat("timePlayedOnFirstSpawn"))) {
        return;
    }
    var_e817fdf4412ba4ec = level.var_e04e8f03163c0385;
    kills = scripts\mp\utility\stats::getpersstat("kills");
    assists = scripts\mp\utility\stats::getpersstat("assists");
    downs = default_to(scripts\mp\utility\stats::getpersstat("downs"), 0);
    nokillsorassists = kills == 0 && assists == 0 && downs == 0;
    recentdamagestate = 2;
    if (isdefined(scripts\mp\utility\stats::getpersstat("lastDamageTime"))) {
        recentdamagestate = function_7b76ffd725358204(gettime() - scripts\mp\utility\stats::getpersstat("lastDamageTime"), 60000, var_e817fdf4412ba4ec * 1000);
    }
    var_88d83c00473ab477 = 2;
    if (isdefined(scripts\mp\utility\stats::getpersstat("lastStanceChangeTime"))) {
        var_88d83c00473ab477 = function_7b76ffd725358204(gettime() - scripts\mp\utility\stats::getpersstat("lastStanceChangeTime"), 11000, var_e817fdf4412ba4ec * 1000);
    }
    lastDistTrackingPassedTime = default_to(scripts\mp\utility\stats::getpersstat("distTrackingPassedOrResetTime"), 0);
    timeSinceLastPassedDistCheck = function_19300abfbb10928b() - lastDistTrackingPassedTime;
    afkDistTimeThreshold = 60;
    afkNoKillsOrAssists = nokillsorassists && timeSinceLastPassedDistCheck > 120;
    hasRecentMovementImmunity = default_to(self.var_3681793bfd7b68e, 0) > gettime();
    disTrackingPassed = istrue(scripts\mp\utility\stats::getpersstat("distTrackingPassed")) || hasRecentMovementImmunity;
    var_30218be3f4c97a8a = self function_34465874fa328acc() || self issprinting();
    if (level.rankedmatch && var_30218be3f4c97a8a && !disTrackingPassed && self function_f771642d3445111f() == 0 && self.sessionstate == "playing" && nokillsorassists) {
        self dlog_recordplayerevent("dlog_event_player_ranked_boosting_detection", ["kills", kills, "assists", assists, "lastDistTrackingPassedTime", lastDistTrackingPassedTime, "timeSinceLastPassedDistCheck", timeSinceLastPassedDistCheck, "afkDistTimeThreshold", afkDistTimeThreshold, "afkNoKillsOrAssists", afkNoKillsOrAssists, "hasRecentMovementImmunity", hasRecentMovementImmunity, "disTrackingPassed", disTrackingPassed]);
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        if (istrue(self.brkickedfromplane)) {
            afkDistTimeThreshold = getdvarint(@"hash_613644ac82dead59", 60);
        } else {
            afkDistTimeThreshold = getdvarint(@"hash_a6a8cfe5f012e87a", 180);
        }
    } else {
        if (!isdefined(level.afkDistTimeThreshold)) {
            if (getgametype() == "arena") {
                level.afkDistTimeThreshold = getdvarint(@"hash_7f596f03ab14d1b4", 15);
            } else if (getgametype() == "ballmode") {
                level.afkDistTimeThreshold = getdvarint(@"hash_208180e807d0093b", 60);
            } else if (isroundbased()) {
                level.afkDistTimeThreshold = getdvarint(@"hash_208180e807d0093b", 60);
            } else {
                level.afkDistTimeThreshold = getdvarint(@"hash_a6a8cfe5f012e87a", 60);
            }
        }
        afkDistTimeThreshold = level.afkDistTimeThreshold;
        if (isdefined(var_55d48eee7e287cda)) {
            afkDistTimeThreshold = var_55d48eee7e287cda;
        }
        if (isdefined(var_bdbf4608f99aedb3)) {
            level.var_808e471a357552a4 = var_bdbf4608f99aedb3;
        }
    }
    if (istrue(level.var_ec2fb549b15ad827) && isdefined(var_e817fdf4412ba4ec) && var_e817fdf4412ba4ec > 0 && level.var_808e471a357552a4 > afkDistTimeThreshold - var_e817fdf4412ba4ec) {
        level.var_808e471a357552a4 = afkDistTimeThreshold - var_e817fdf4412ba4ec;
    }
    self.afkstate = 0;
    kickreason = "default";
    if (self function_f771642d3445111f() && self.sessionstate == "playing" && nokillsorassists && !disTrackingPassed) {
        self.afkstate = function_7b76ffd725358204(timeSinceLastPassedDistCheck, afkDistTimeThreshold, var_e817fdf4412ba4ec);
        kickreason = "checkForAFK() TRUE, IsCommandInputStale() - " + self.name + "timeSinceLastPassedDistCheck (" + timeSinceLastPassedDistCheck + ") > afkDistTimeThreshold(" + afkDistTimeThreshold + "), lastDistTrackingPassedTime: " + lastDistTrackingPassedTime;
    }
    if (self function_9eff7048a5747cc5()) {
        self.afkstate = 2;
        kickreason = "checkForAFK() TRUE, IsCommandInputRepetitive() - " + self.name + "timeSinceLastPassedDistCheck ( " + timeSinceLastPassedDistCheck + " ), lastDistTrackingPassedTime: " + lastDistTrackingPassedTime;
    }
    var_bad61657da03a98d = getgametype() == "ctf" || getgametype() == "wm";
    if (isroundbased() && !var_bad61657da03a98d) {
        checkdistancetravelled = nokillsorassists || level.gametype == "arena" || level.gametype == "ballmode";
        if (level.gametype != "arena") {
            if (nokillsorassists) {
                if (recentdamagestate != 0) {
                    switch (level.gametype) {
                    case #"hash_fb5b5e6c07253005":
                        if (istrue(level.kick_afk_check)) {
                            self.afkstate = max(self.afkstate, recentdamagestate);
                        }
                        break;
                    }
                }
            }
        }
        if (checkdistancetravelled && !disTrackingPassed) {
            var_678497fcd540b938 = function_7b76ffd725358204(timeSinceLastPassedDistCheck, afkDistTimeThreshold, var_e817fdf4412ba4ec);
            if (scripts\cp_mp\utility\game_utility::isinfectedgametype()) {
                if (self.team == "axis") {
                    self.afkstate = max(self.afkstate, var_678497fcd540b938);
                }
            } else if (level.gametype == "ballmode") {
                hasgoal = isdefined(scripts\mp\utility\stats::getpersstat("goals")) && scripts\mp\utility\stats::getpersstat("goals") > 0;
                hasassist = isdefined(scripts\mp\utility\stats::getpersstat("assists")) && scripts\mp\utility\stats::getpersstat("assists") > 0;
                var_4a834a032d48890e = 2;
                if (isdefined(scripts\mp\utility\stats::getpersstat("lastTouchTime"))) {
                    function_7b76ffd725358204(timeSinceLastPassedDistCheck - scripts\mp\utility\stats::getpersstat("lastTouchTime"), 60, var_e817fdf4412ba4ec);
                }
                var_c8238f8ea16268f7 = 2;
                if (isdefined(scripts\mp\utility\stats::getpersstat("lastRamTime"))) {
                    var_c8238f8ea16268f7 = function_7b76ffd725358204(timeSinceLastPassedDistCheck - scripts\mp\utility\stats::getpersstat("lastRamTime"), 60, var_e817fdf4412ba4ec);
                }
                if (!hasgoal && !hasassist) {
                    var_58dfeb144008c413 = min(min(var_4a834a032d48890e, var_c8238f8ea16268f7), var_678497fcd540b938);
                    self.afkstate = max(self.afkstate, var_58dfeb144008c413);
                }
            } else {
                var_58dfeb144008c413 = min(var_678497fcd540b938, var_88d83c00473ab477);
                self.afkstate = max(self.afkstate, var_58dfeb144008c413);
                kickreason = "checkForAFK() TRUE, " + self.name + "timeSinceLastPassedDistCheck ( " + timeSinceLastPassedDistCheck + " ), disTrackingPassed: " + disTrackingPassed;
            }
        }
        scripts\mp\utility\stats::initpersstat("roundsAFK");
        allowkick = istrue(var_6d2f7985df18659a);
        if (!istrue(var_6d2f7985df18659a)) {
            if (self.afkstate == 2 && !istrue(self.afkroundcounted)) {
                self.afkroundcounted = 1;
                scripts\mp\utility\stats::incpersstat("roundsAFK", 1);
                if (scripts\mp\utility\stats::getpersstat("roundsAFK") > 1) {
                    allowkick = 1;
                }
            }
        }
        function_f66fc78c2cb0c0d3(self, kickreason, self.afkstate, allowkick);
        return;
    } else {
        if (!isdefined(self.var_cb9581fc7ff5f394) || self.var_cb9581fc7ff5f394 < 3) {
            if (nokillsorassists) {
                var_b8c4c1e4916a6d00 = function_7b76ffd725358204(timeSinceLastPassedDistCheck, afkDistTimeThreshold, var_e817fdf4412ba4ec);
                var_58dfeb144008c413 = min(var_b8c4c1e4916a6d00, recentdamagestate);
                if (!disTrackingPassed) {
                    if (scripts\cp_mp\utility\game_utility::isinfectedgametype()) {
                        if (self.team == "axis") {
                            self.afkstate = max(self.afkstate, var_58dfeb144008c413);
                        }
                    } else {
                        self.afkstate = max(self.afkstate, var_58dfeb144008c413);
                        kickreason = "checkForAFK() TRUE, Non Round Based " + self.name + "( noKillsOrAssists(" + nokillsorassists + ") && !recentDamageState(" + recentdamagestate + ") && timeSinceLastPassedDistCheck(" + timeSinceLastPassedDistCheck + ") >= afkDistTimeThreshold(" + afkDistTimeThreshold + "), lastDistTrackingPassedTime: " + lastDistTrackingPassedTime;
                    }
                }
            }
        }
        if (afkNoKillsOrAssists) {
            if (recentdamagestate != 0) {
                switch (level.gametype) {
                case #"hash_fb5b5e6c07253005":
                    if (istrue(level.kick_afk_check)) {
                        self.afkstate = max(self.afkstate, recentdamagestate);
                    }
                    break;
                }
            }
        }
    }
    function_f66fc78c2cb0c0d3(self, kickreason, self.afkstate, 1);
}

// Namespace teams / scripts\mp\teams
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x90fa
// Size: 0x65
function kickafkplayer(player, reason) {
    player endon("disconnect");
    if (istrue(player.var_72c19b43b99e7097)) {
        return;
    }
    if (isdefined(reason)) {
        println(reason);
    }
    player notify("afk_disconnection_imminent");
    player.var_72c19b43b99e7097 = 1;
    wait 1;
    kick(player getentitynumber(), "EXE/PLAYERKICKED_INACTIVE", 1);
}

// Namespace teams / scripts\mp\teams
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9167
// Size: 0xa4
function function_f66fc78c2cb0c0d3(player, reason, afkstate, allowkick) {
    if (afkstate == 2 && istrue(allowkick)) {
        level thread kickafkplayer(player, reason);
        return;
    }
    if (afkstate == 1 && !istrue(player.var_a34845be1b8d5cb5)) {
        player.var_a34845be1b8d5cb5 = 1;
        player setclientomnvar("ui_afk_warning", 1);
        return;
    }
    if (afkstate == 0 && istrue(player.var_a34845be1b8d5cb5)) {
        player.var_a34845be1b8d5cb5 = 0;
        player setclientomnvar("ui_afk_warning", 0);
    }
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9213
// Size: 0x18d
function getjointeampermissions(team) {
    teamcount = 0;
    botcount = 0;
    players = level.players;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (isdefined(player scripts\mp\utility\stats::getpersstat("team")) && player scripts\mp\utility\stats::getpersstat("team") == team) {
            teamcount++;
            if (isbot(player)) {
                botcount++;
            }
        }
    }
    brgametype = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
    if (level.maxteamsize == 0 || teamcount < level.maxteamsize) {
        return 1;
    }
    if (getgametype() == "vip" && istrue(isagent(self))) {
        return 1;
    }
    if (botcount > 0) {
        return 1;
    }
    if (!matchmakinggame()) {
        return 1;
    }
    if (scripts\cp_mp\utility\game_utility::isinfectedgametype()) {
        return 1;
    }
    if (function_d7ec918e29c0b2f4()) {
        return 1;
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && (brgametype == "dmz" || brgametype == "exgm" || brgametype == "plunder" || brgametype == "risk")) {
        return 1;
    }
    println("<dev string:x4c2>" + team + "<dev string:x4ed>");
    if (self ishost()) {
        wait 1.5;
    }
    kick(self getentitynumber(), "EXE/PLAYERKICKED_INVALIDTEAM");
    return 0;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x93a8
// Size: 0x6c
function onplayerspawned() {
    if (!isdefined(scripts\mp\utility\stats::getpersstat("timePlayedOnFirstSpawn"))) {
        self.pers["timePlayedOnFirstSpawn"] = scripts\mp\persistence::statgetchildbuffered("round", "timePlayed");
    }
    if (getdvarint(@"hash_e4b249f4f77bb3c8", 0) == 1 && !runleanthreadmode()) {
        if (namespace_ca7b90256548aa40::issquadmode()) {
            thread outlinesquad_apply();
            return;
        }
        thread outlinefriendly_apply();
    }
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x941c
// Size: 0xae
function outlinefriendly_apply() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (!level.teambased) {
        return;
    }
    if (getdvarint(@"hash_4b96e5b179c4e4ba", 1) == 0) {
        return;
    }
    if (scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
        return;
    }
    if (gameflag("infil_will_run") && !istrue(gameflag("prematch_done"))) {
        level waittill("prematch_over");
    }
    var_4430b08d5a2d47bf = ter_op(isnightmap(), "outline_ally_night", "outline_ally");
    outlineid = outlineenableforteam(self, self.team, var_4430b08d5a2d47bf, "level_script");
    thread outlinefriendly_remove(outlineid);
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x94d2
// Size: 0x2c
function outlinefriendly_remove(outlineid) {
    level endon("game_ended");
    waittill_any_2("death_or_disconnect", "joined_team");
    outlinedisable(outlineid, self);
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9506
// Size: 0xc1
function outlinesquad_apply() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (runleanthreadmode()) {
        return;
    }
    if (!level.teambased) {
        return;
    }
    if (getdvarint(@"hash_72cc1d5b07eee147", 1) == 0) {
        return;
    }
    if (scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
        return;
    }
    if (gameflag("infil_will_run") && !istrue(gameflag("prematch_done"))) {
        level waittill("prematch_over");
    }
    var_4430b08d5a2d47bf = ter_op(isnightmap(), "outline_squad_night", "outline_squad");
    outlineid = outlineenableforsquad(self, self.team, self.sessionsquadid, var_4430b08d5a2d47bf, "level_script");
    thread outlinesquad_remove(outlineid);
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x95cf
// Size: 0x31
function outlinesquad_remove(outlineid) {
    level endon("game_ended");
    waittill_any_3("death_or_disconnect", "joined_team", "joined_squad");
    outlinedisable(outlineid, self);
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9608
// Size: 0x67
function function_ada9a2308a4046e2(operatorref) {
    suit = namespace_465d40bb08a5337a::function_ada9a2308a4046e2(operatorref);
    if (!isdefined(suit) || suit == "") {
        if (isdefined(level.gamemodebundle)) {
            suit = default_to(level.gamemodebundle.var_576fc201a1d5b6dc, "iw9_suit_generic_west_mp");
        } else {
            suit = "iw9_suit_generic_west_mp";
        }
    }
    return suit;
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9678
// Size: 0x65
function getoperatorexecution(operatorref) {
    var_8f65d6a740c2357e = getdvar(@"hash_f84554214a05ea42") != "0";
    var_8e0a26a04f19263d = ter_op(var_8f65d6a740c2357e, getdvar(@"hash_36390c2c231d25bc"), undefined);
    self.loadoutexecution = namespace_465d40bb08a5337a::function_5e2fa33279816be2(operatorref, var_8e0a26a04f19263d);
    return self.loadoutexecution;
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x96e6
// Size: 0x24
function getoperatorexecutionquip(operatorref) {
    self.loadoutexecutionquip = namespace_465d40bb08a5337a::function_ac45022bf37cddfb(operatorref);
    return self.loadoutexecutionquip;
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9713
// Size: 0x24
function getoperatorsuperfaction(operatorref) {
    faction = namespace_465d40bb08a5337a::getoperatorsuperfaction(operatorref);
    return int(faction);
}

// Namespace teams / scripts\mp\teams
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9740
// Size: 0x67
function getoperatorvoice(operatorref, skinref) {
    assert(!isnumber(skinref));
    if (operatorref == "default_eastern" || operatorref == "default_western") {
        voice = namespace_465d40bb08a5337a::function_c7f632b62e2da6dc(skinref);
        if (isdefined(voice) && voice != "") {
            return voice;
        }
    }
    voice = namespace_465d40bb08a5337a::getoperatorvoice(operatorref);
    return voice;
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x97b0
// Size: 0x2f
function getoperatorclothtype(skinref) {
    assert(!isnumber(skinref));
    clothtype = namespace_465d40bb08a5337a::function_32d5918a7844bd9a(skinref);
    return clothtype;
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x97e8
// Size: 0x2f
function function_e8770349a2b50bec(skinref) {
    assert(!isnumber(skinref));
    geartype = namespace_465d40bb08a5337a::function_112bf281c4f02cd5(skinref);
    return geartype;
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9820
// Size: 0x1f
function getoperatorgender(operatorref) {
    gender = namespace_465d40bb08a5337a::getoperatorgender(operatorref);
    return gender;
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9848
// Size: 0x1f
function function_29b2af59258d6501(skinref) {
    var_d947b7e87c7243ab = namespace_38b993c4618e76cd::getlootidfromref(skinref);
    return var_d947b7e87c7243ab;
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9870
// Size: 0x93
function getoperatorbrinfilsmokesuffix(skinref) {
    assert(!isnumber(skinref));
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        suffix = undefined;
        lootid = self getplayerdata("common", "commonCustomization", "contrail");
        if (isdefined(lootid) && lootid != 0) {
            if (isdefined(level.contraillist) && isdefined(level.contraillist[lootid])) {
                suffix = level.contraillist[lootid].ref;
            }
        }
        return suffix;
    }
    return undefined;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x990c
// Size: 0x19d
function initnightvisionheadoverrides() {
    if (!function_d2d2b803a7b741a4()) {
        return;
    }
    level.nvgheadoverrides = [];
    foreach (skinref in namespace_465d40bb08a5337a::function_6ab347c553a20a68()) {
        head = namespace_465d40bb08a5337a::function_223061772e2a61b9(skinref);
        var_8caf1716b3192f8f = namespace_465d40bb08a5337a::function_3af837eb38560aad(skinref);
        var_f164251d2631366a = namespace_465d40bb08a5337a::function_6fa0ec9562a76f6c(skinref);
        if (!isdefined(head) || head == "") {
            break;
        }
        if (var_8caf1716b3192f8f != "") {
            level.nvgheadoverrides[head]["up"] = var_8caf1716b3192f8f;
        }
        if (var_f164251d2631366a != "") {
            level.nvgheadoverrides[head]["down"] = var_f164251d2631366a;
        }
    }
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_ar_1"]["up"] = "none";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_ar_1_2"]["up"] = "none";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_ar_1_3"]["up"] = "none";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_ar_2"]["up"] = "none";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_ar_2_2"]["up"] = "none";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_ar_2_3"]["up"] = "none";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_lmg"]["up"] = "none";
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ab1
// Size: 0x118
function initheadlessoperatorcustomization() {
    if (isdefined(level.headlessoperatorcustomization)) {
        return;
    }
    level.headlessoperatorcustomization = [];
    foreach (skinref in namespace_465d40bb08a5337a::function_6ab347c553a20a68()) {
        if (namespace_465d40bb08a5337a::function_9e28d6dc0ac60d69(skinref) != "") {
            operatorref = namespace_465d40bb08a5337a::function_605079124463a67b(skinref);
            if (!isdefined(level.headlessoperatorcustomization[operatorref])) {
                level.headlessoperatorcustomization[operatorref]["skinRefs"] = [];
                level.headlessoperatorcustomization[operatorref]["curIndex"] = 0;
                level.headlessoperatorcustomization[operatorref]["maxIndex"] = 0;
            }
            level.headlessoperatorcustomization[operatorref]["skinRefs"][level.headlessoperatorcustomization[operatorref]["skinRefs"].size] = skinref;
            level.headlessoperatorcustomization[operatorref]["maxIndex"] = level.headlessoperatorcustomization[operatorref]["maxIndex"] + 1;
        }
    }
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9bd1
// Size: 0x318
function function_d650608c959c9675() {
    if (isdefined(level.var_b113f6fe0e7c93bf)) {
        return;
    }
    level.var_b113f6fe0e7c93bf = [];
    setdvar(@"hash_2b669ad6c3e1d864", 1);
    if (!isdefined(level.var_b113f6fe0e7c93bf["allies"])) {
        level.var_b113f6fe0e7c93bf["allies"] = [];
    }
    if (!isdefined(level.var_b113f6fe0e7c93bf["axis"])) {
        level.var_b113f6fe0e7c93bf["axis"] = [];
    }
    operatorrefs = namespace_465d40bb08a5337a::function_462ac94dd54da47d();
    foreach (operatorref in operatorrefs) {
        if (!isdefined(operatorref) || operatorref == "") {
            continue;
        }
        unlocked = namespace_465d40bb08a5337a::function_422b054f4a5573e0(operatorref);
        if (!unlocked) {
            continue;
        }
        botvalid = namespace_465d40bb08a5337a::function_119cb1191ea939ca(operatorref);
        if (!botvalid) {
            continue;
        }
        superfaction = getoperatorsuperfaction(operatorref);
        team = ter_op(superfaction == 0, "allies", "axis");
        level.var_b113f6fe0e7c93bf[team][operatorref] = [];
    }
    skinRefs = namespace_465d40bb08a5337a::function_6ab347c553a20a68();
    foreach (skinref in skinRefs) {
        if (!isdefined(skinref) || skinref == "") {
            continue;
        }
        canequip = namespace_465d40bb08a5337a::function_9c50981a840033dc(skinref);
        if (!canequip) {
            continue;
        }
        botvalid = namespace_465d40bb08a5337a::function_539b94879a3b6157(skinref);
        if (!botvalid) {
            continue;
        }
        operatorref = namespace_465d40bb08a5337a::function_605079124463a67b(skinref);
        superfaction = getoperatorsuperfaction(operatorref);
        team = ter_op(superfaction == 0, "allies", "axis");
        if (!isdefined(level.var_b113f6fe0e7c93bf[team][operatorref])) {
            continue;
        }
        level.var_b113f6fe0e7c93bf[team][operatorref][level.var_b113f6fe0e7c93bf[team][operatorref].size] = skinref;
    }
    teams = [];
    teams = ["allies", "axis"];
    foreach (team in teams) {
        newarray = [];
        foreach (key, entry in level.var_b113f6fe0e7c93bf[team]) {
            if (entry.size > 0) {
                newarray[key] = entry;
            }
        }
        level.var_b113f6fe0e7c93bf[team] = newarray;
    }
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9ef1
// Size: 0xa3
function getoperatorteambyref(operatorref) {
    foreach (team, operators in level.var_b113f6fe0e7c93bf) {
        foreach (operator, operatorskins in operators) {
            if (operator == operatorref) {
                return team;
            }
        }
    }
    return undefined;
}

// Namespace teams / scripts\mp\teams
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9f9d
// Size: 0xda
function getnextoperatorindex(operatorref, userandom) {
    if (!userandom) {
        var_bf657fe9053a3502 = 0;
        foreach (operatorname, var_3fdc6738d163b2e9 in level.var_b113f6fe0e7c93bf[self.team]) {
            if (operatorref == operatorname) {
                break;
            }
            var_bf657fe9053a3502++;
        }
        var_d9ee2df2fb804df2 = undefined;
        var_6f74dca2e27406fb = var_bf657fe9053a3502 + 1;
        if (var_6f74dca2e27406fb == level.var_b113f6fe0e7c93bf[self.team].size) {
            var_6f74dca2e27406fb = 0;
        }
        return var_6f74dca2e27406fb;
    }
    return randomint(level.var_b113f6fe0e7c93bf[self.team].size);
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa07f
// Size: 0xad
function getplayerlookattarget() {
    startpos = self geteye();
    viewangles = self getplayerangles();
    fwd = anglestoforward(viewangles);
    endpos = startpos + fwd * 10000;
    playercontent = ["physicscontents_characterproxy"];
    var_30d537ea3164e799 = physics_createcontents(playercontent);
    playertrace = scripts\engine\trace::sphere_trace(startpos, endpos, 5, self, var_30d537ea3164e799, 0);
    traceent = playertrace["entity"];
    if (isdefined(traceent) && isplayer(traceent)) {
        return traceent;
    }
    return undefined;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa134
// Size: 0x11b
function devmonitoroperatorcustomizationprint() {
    /#
        setdevdvar(@"hash_a61d9425dd087ddf", 0);
        setdevdvar(@"hash_e71bf09704d58aad", 0);
    #/
    while (true) {
        waitframe();
        players = [];
        if (getdvarint(@"hash_a61d9425dd087ddf", 0) != 0) {
            function_d650608c959c9675();
            /#
                setdevdvar(@"hash_e71bf09704d58aad", 0);
            #/
            players = level.players;
        }
        if (getdvarint(@"hash_e71bf09704d58aad", 0) != 0) {
            function_d650608c959c9675();
            /#
                setdevdvar(@"hash_a61d9425dd087ddf", 0);
            #/
            target = level.players[0] getplayerlookattarget();
            if (!isdefined(target)) {
                continue;
            }
            players[0] = target;
        }
        if (players.size > 0) {
            foreach (player in players) {
                player printcustomization();
            }
        }
    }
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa257
// Size: 0xa8
function printcustomization() {
    if (!isgameplayteam(self.team)) {
        return;
    }
    var_1ceef035c3f3046d = getoperatorcustomization();
    /#
        print3d(self.origin + (0, 0, 40), "<dev string:x553>" + var_1ceef035c3f3046d[0], (1, 1, 1), 1, 0.5);
    #/
    /#
        print3d(self.origin + (0, 0, 60), "<dev string:x55d>" + var_1ceef035c3f3046d[1], (1, 1, 1), 1, 0.5);
    #/
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa307
// Size: 0x106
function persistantgametypeteamassign() {
    team = undefined;
    count = 1;
    if (istrue(level.onlinegame)) {
        fireteammembers = self getfireteammembers();
        count = fireteammembers.size;
        if (isdefined(fireteammembers) && fireteammembers.size > 0) {
            foreach (member in fireteammembers) {
                if (isdefined(member) && isgameplayteam(member.team)) {
                    team = member.team;
                    self.teamstarttime = member.teamstarttime;
                    break;
                }
            }
        }
    }
    if (!isdefined(team)) {
        team = findavailableteam(count);
    }
    assert(isdefined(team));
    if (!isdefined(self.teamstarttime)) {
        self.teamstarttime = gettime();
    }
    thread scripts\mp\menus::setteam(team);
}

// Namespace teams / scripts\mp\teams
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa415
// Size: 0xfd
function findavailableteam(count) {
    if (!isdefined(count)) {
        count = 1;
    }
    team = undefined;
    foreach (entry in level.teamnamelist) {
        teamcount = getteamcount(entry);
        available = level.maxteamsize - teamcount;
        if (available < count) {
            continue;
        }
        if (teamcount > 0) {
            teamplayers = getteamdata(entry, "players");
            if (isdefined(teamplayers[0].teamstarttime) && gettime() > teamplayers[0].teamstarttime + 300000) {
                continue;
            }
        }
        team = entry;
        break;
    }
    assert(isdefined(team));
    return team;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa51b
// Size: 0x75
function function_14a6f65e85694c21() {
    teamcount = 0;
    foreach (teamdata in level.teamdata) {
        if (isdefined(teamdata["teamCount"]) && teamdata["teamCount"] > 0) {
            teamcount++;
        }
    }
    return teamcount;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa599
// Size: 0x75
function getactiveteamcount() {
    teamcount = 0;
    foreach (teamdata in level.teamdata) {
        if (isdefined(teamdata["aliveCount"]) && teamdata["aliveCount"] > 0) {
            teamcount++;
        }
    }
    return teamcount;
}

// Namespace teams / scripts\mp\teams
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa617
// Size: 0x1e1
function debugprintteams() {
    stepy = 25;
    while (true) {
        if (isdefined(level.teamdata)) {
            startx = 400;
            starty = 200;
            linecount = 1;
            teamcount = 0;
            foreach (team in level.teamnamelist) {
                linecount = 1;
                /#
                    printtoscreen2d(startx, starty + stepy * linecount, "<dev string:x567>" + team, (1, 1, 1), 1);
                #/
                linecount++;
                foreach (player in level.teamdata[team]["players"]) {
                    color = (1, 1, 1);
                    if (istrue(player.squadassignedfromlobby)) {
                        color = (0, 1, 0);
                    }
                    /#
                        printtoscreen2d(startx + 25, starty + stepy * linecount, player.name, color, 1);
                    #/
                    linecount++;
                    /#
                        print3d(player.origin + (0, 0, 60), team, (1, 1, 1), 1, 0.5);
                    #/
                }
                starty = starty + stepy * linecount + 50;
                teamcount++;
                if (teamcount > 6) {
                    teamcount = 0;
                    startx += 200;
                    starty = 200;
                }
            }
        }
        waitframe();
    }
}

