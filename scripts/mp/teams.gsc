// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3214e6fcdce468a7;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_e5db4163ddc9246;
#using scripts\cp_mp\killstreaks\uav.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using script_a34750d17473c49;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\hud_message.gsc;
#using script_6775ad452d13858;
#using scripts\cp_mp\execution.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_600b944a95c3a7bf;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_58be75c518bf0d40;
#using scripts\engine\trace.gsc;
#using scripts\mp\menus.gsc;

#namespace teams;

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a6d
// Size: 0xb12
function init() {
    level.teambalance = getdvarint(@"hash_51ef9682c921092e");
    level.maxclients = getmaxclients();
    var_f2da32f8a5f3e866 = [0:"free", 1:"axis", 2:"allies", 3:"team_three", 4:"team_four", 5:"team_five", 6:"team_six", 7:"team_seven", 8:"team_eight", 9:"team_nine", 10:"team_ten", 11:"team_eleven", 12:"team_twelve", 13:"team_thirteen", 14:"team_fourteen", 15:"team_fifteen", 16:"team_sixteen", 17:"team_seventeen", 18:"team_eighteen", 19:"team_nineteen", 20:"team_twenty", 21:"team_twenty_one", 22:"team_twenty_two", 23:"team_twenty_three", 24:"team_twenty_four", 25:"team_twenty_five", 26:"team_twenty_six", 27:"team_twenty_seven", 28:"team_twenty_eight", 29:"team_twenty_nine", 30:"team_thirty", 31:"team_thirty_one", 32:"team_thirty_two", 33:"team_thirty_three", 34:"team_thirty_four", 35:"team_thirty_five", 36:"team_thirty_six", 37:"team_thirty_seven", 38:"team_thirty_eight", 39:"team_thirty_nine", 40:"team_forty", 41:"team_forty_one", 42:"team_forty_two", 43:"team_forty_three", 44:"team_forty_four", 45:"team_forty_five", 46:"team_forty_six", 47:"team_forty_seven", 48:"team_forty_eight", 49:"team_forty_nine", 50:"team_fifty", 51:"team_fifty_one", 52:"team_fifty_two", 53:"team_fifty_three", 54:"team_fifty_four", 55:"team_fifty_five", 56:"team_fifty_six", 57:"team_fifty_seven", 58:"team_fifty_eight", 59:"team_fifty_nine", 60:"team_sixty", 61:"team_sixty_one", 62:"team_sixty_two", 63:"team_sixty_three", 64:"team_sixty_four", 65:"team_sixty_five", 66:"team_sixty_six", 67:"team_sixty_seven", 68:"team_sixty_eight", 69:"team_sixty_nine", 70:"team_seventy", 71:"team_seventy_one", 72:"team_seventy_two", 73:"team_seventy_three", 74:"team_seventy_four", 75:"team_seventy_five", 76:"team_seventy_six", 77:"team_seventy_seven", 78:"team_seventy_eight", 79:"team_seventy_nine", 80:"team_eighty", 81:"team_eighty_one", 82:"team_eighty_two", 83:"team_eighty_three", 84:"team_eighty_four", 85:"team_eighty_five", 86:"team_eighty_six", 87:"team_eighty_seven", 88:"team_eighty_eight", 89:"team_eighty_nine", 90:"team_ninety", 91:"team_ninety_one", 92:"team_ninety_two", 93:"team_ninety_three", 94:"team_ninety_four", 95:"team_ninety_five", 96:"team_ninety_six", 97:"team_ninety_seven", 98:"team_ninety_eight", 99:"team_ninety_nine", 100:"team_hundred", 101:"team_hundred_one", 102:"team_hundred_two", 103:"team_hundred_three", 104:"team_hundred_four", 105:"team_hundred_five", 106:"team_hundred_six", 107:"team_hundred_seven", 108:"team_hundred_eight", 109:"team_hundred_nine", 110:"team_hundred_ten", 111:"team_hundred_eleven", 112:"team_hundred_twelve", 113:"team_hundred_thirteen", 114:"team_hundred_fourteen", 115:"team_hundred_fifteen", 116:"team_hundred_sixteen", 117:"team_hundred_seventeen", 118:"team_hundred_eightteen", 119:"team_hundred_nineteen", 120:"team_hundred_twenty", 121:"team_hundred_twenty_one", 122:"team_hundred_twenty_two", 123:"team_hundred_twenty_three", 124:"team_hundred_twenty_four", 125:"team_hundred_twenty_five", 126:"team_hundred_twenty_six", 127:"team_hundred_twenty_seven", 128:"team_hundred_twenty_eight", 129:"team_hundred_twenty_nine", 130:"team_hundred_thirty", 131:"team_hundred_thirty_one", 132:"team_hundred_thirty_two", 133:"team_hundred_thirty_three", 134:"team_hundred_thirty_four", 135:"team_hundred_thirty_five", 136:"team_hundred_thirty_six", 137:"team_hundred_thirty_seven", 138:"team_hundred_thirty_eight", 139:"team_hundred_thirty_nine", 140:"team_hundred_forty", 141:"team_hundred_forty_one", 142:"team_hundred_forty_two", 143:"team_hundred_forty_three", 144:"team_hundred_forty_four", 145:"team_hundred_forty_five", 146:"team_hundred_forty_six", 147:"team_hundred_forty_seven", 148:"team_hundred_forty_eight", 149:"team_hundred_forty_nine", 150:"team_hundred_fifty", 151:"team_hundred_fifty_one", 152:"team_hundred_fifty_two", 153:"team_hundred_fifty_three", 154:"team_hundred_fifty_four", 155:"team_hundred_fifty_five", 156:"team_hundred_fifty_six", 157:"team_hundred_fifty_seven", 158:"team_hundred_fifty_eight", 159:"team_hundred_fifty_nine", 160:"team_hundred_sixty", 161:"team_hundred_sixty_one", 162:"team_hundred_sixty_two", 163:"team_hundred_sixty_three", 164:"team_hundred_sixty_four", 165:"team_hundred_sixty_five", 166:"team_hundred_sixty_six", 167:"team_hundred_sixty_seven", 168:"team_hundred_sixty_eight", 169:"team_hundred_sixty_nine", 170:"team_hundred_seventy", 171:"team_hundred_seventy_one", 172:"team_hundred_seventy_two", 173:"team_hundred_seventy_three", 174:"team_hundred_seventy_four", 175:"team_hundred_seventy_five", 176:"team_hundred_seventy_six", 177:"team_hundred_seventy_seven", 178:"team_hundred_seventy_eight", 179:"team_hundred_seventy_nine", 180:"team_hundred_eighty", 181:"team_hundred_eighty_one", 182:"team_hundred_eighty_two", 183:"team_hundred_eighty_three", 184:"team_hundred_eighty_four", 185:"team_hundred_eighty_five", 186:"team_hundred_eighty_six", 187:"team_hundred_eighty_seven", 188:"team_hundred_eighty_eight", 189:"team_hundred_eighty_nine", 190:"team_hundred_ninety", 191:"team_hundred_ninety_one", 192:"team_hundred_ninety_two", 193:"team_hundred_ninety_three", 194:"team_hundred_ninety_four", 195:"team_hundred_ninety_five", 196:"team_hundred_ninety_six", 197:"team_hundred_ninety_seven", 198:"team_hundred_ninety_eight", 199:"team_hundred_ninety_nine", 200:"team_two_hundred", 201:"spectator", 202:"codcaster", 203:"civilian", 204:"team_big_map_agent"];
    level.allteamnamelist = var_f2da32f8a5f3e866;
    var_f5798b9364e0158d = [0:"axis", 1:"allies"];
    if (getdvarint(@"hash_5dabea153bf14a41", 0) == 1) {
        var_f5798b9364e0158d = [0:"axis"];
    }
    var_d44b7b1a5d0e8f39 = [0:"free", 1:"spectator", 2:"codcaster"];
    var_656660d323003255 = [0:"SAS", 1:"RUSF", 2:"USMC", 3:"SABF"];
    activeteamcount = getcustomgametypeteammax();
    activeteamcount = min(activeteamcount, getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_teamcount"), -1));
    maxteamsize = namespace_36f464722d326bbe::function_4fb37368ae3585bb();
    /#
        assertex(activeteamcount != -1, "++++++++++++++++++++++ERROR TEAMCOUNT DVAR NOT SET! For dvar " + "scr_" + getgametype() + "_teamcount");
    #/
    var_75d2cd1035b7c557 = 1;
    var_25a6885224803948 = -1;
    if (activeteamcount >= 3) {
        for (i = 3; i < activeteamcount + var_75d2cd1035b7c557; i++) {
            var_f5798b9364e0158d[var_f5798b9364e0158d.size] = level.allteamnamelist[i];
            if (!isdefined(game[level.allteamnamelist[i]])) {
                game[level.allteamnamelist[i]] = var_656660d323003255[(i + var_25a6885224803948) % var_656660d323003255.size];
            }
        }
    }
    level.teamnamelist = var_f5798b9364e0158d;
    level.multiteambased = level.teamnamelist.size > 2 || getdvarint(@"hash_2c78e7cf8d058302", 0) == 1;
    level.teamdata = [];
    foreach (team in var_f2da32f8a5f3e866) {
        function_53cecc93d53fb16e(team);
    }
    level callback::callback("register_team_data");
    foreach (team in var_f5798b9364e0158d) {
        getteamfactionsfrommap(team);
        function_dd622cd64f483958(team);
    }
    level.teambased = activeteamcount > 1 || getdvarint(@"hash_6bfddbbc0765d353", 0) == 1;
    setdvar(@"hash_afb03e72b1770af", level.teamnamelist.size);
    if (getdvarint(@"hash_f16ba8db72f34fc3", 0) != 0 && level.teambased) {
        level thread namespace_f1fe279354a7da2::function_c11936b9c6c3a076(undefined, 1);
    }
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawned);
    namespace_1309ce202b9aa92b::registeronplayerjointeamcallback(&onjoinedteam);
    level thread onplayerconnect();
    level thread trackplayedtime();
    function_d650608c959c9675();
    initnightvisionheadoverrides();
    wait(0.15);
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3586
// Size: 0x1da
function function_6f61a7ebcd7859f6() {
    level.var_8439ac7b613822b0 = [];
    var_95e750bc139e9da9 = undefined;
    if (!isdefined(level.var_21e8a7768c0260f2)) {
        var_95e750bc139e9da9 = function_811510b694ddd963();
    } else {
        var_95e750bc139e9da9 = level.var_21e8a7768c0260f2;
    }
    if (isdefined(var_95e750bc139e9da9) && isdefined(var_95e750bc139e9da9.var_a05dea7444800c60)) {
        var_150ada5de2119f78 = getscriptbundle("parachutelist:" + var_95e750bc139e9da9.var_a05dea7444800c60);
        if (isdefined(var_150ada5de2119f78) && isdefined(var_150ada5de2119f78.var_b6fd95000e4ee1e1)) {
            foreach (parachute in var_150ada5de2119f78.var_b6fd95000e4ee1e1) {
                lootid = function_6a36b14e6b79459(function_2ef675c13ca1c4af(%"hash_56e1b55b9b3fe8f9", parachute.var_54b59037b61f6be0), #"lootid");
                ref = function_6a36b14e6b79459(function_2ef675c13ca1c4af(%"hash_56e1b55b9b3fe8f9", parachute.var_54b59037b61f6be0), #"ref");
                /#
                    assertex(!isdefined(level.var_8439ac7b613822b0[lootid]), "Duplicate Loot ID found for multiple parachute data assets " + lootid + "with " + parachute.var_54b59037b61f6be0);
                #/
                if (isdefined(ref)) {
                    level.var_8439ac7b613822b0[lootid] = spawnstruct();
                    level.var_8439ac7b613822b0[lootid].ref = ref;
                    level.var_8439ac7b613822b0[lootid].var_c545f61c9ba000a9 = parachute.var_54b59037b61f6be0;
                } else {
                    /#
                        assertmsg("ParachuteData asset: " + parachute.var_54b59037b61f6be0 + "does not have a parachute reference");
                    #/
                }
            }
        }
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3767
// Size: 0x1da
function function_67fd50c33d15b163() {
    level.var_a36fdb48e33dee79 = [];
    var_95e750bc139e9da9 = undefined;
    if (!isdefined(level.var_21e8a7768c0260f2)) {
        var_95e750bc139e9da9 = function_811510b694ddd963();
    } else {
        var_95e750bc139e9da9 = level.var_21e8a7768c0260f2;
    }
    if (isdefined(var_95e750bc139e9da9) && isdefined(var_95e750bc139e9da9.var_a36fdb48e33dee79)) {
        var_94e82efc0c1e2431 = getscriptbundle("contraillist:" + var_95e750bc139e9da9.var_a36fdb48e33dee79);
        if (isdefined(var_94e82efc0c1e2431) && isdefined(var_94e82efc0c1e2431.var_98daeb71e127b3b2)) {
            foreach (contrail in var_94e82efc0c1e2431.var_98daeb71e127b3b2) {
                lootid = function_6a36b14e6b79459(function_2ef675c13ca1c4af(%"hash_3ead86725b3cfa8", contrail.var_8d2e4703afcc8abd), #"lootid");
                ref = function_6a36b14e6b79459(function_2ef675c13ca1c4af(%"hash_3ead86725b3cfa8", contrail.var_8d2e4703afcc8abd), #"ref");
                /#
                    assertex(!isdefined(level.var_a36fdb48e33dee79[lootid]), "Duplicate Loot ID found for multiple contrail data assets " + lootid + "with " + contrail.var_8d2e4703afcc8abd);
                #/
                if (isdefined(ref)) {
                    level.var_a36fdb48e33dee79[lootid] = spawnstruct();
                    level.var_a36fdb48e33dee79[lootid].ref = ref;
                    level.var_a36fdb48e33dee79[lootid].var_c545f61c9ba000a9 = contrail.var_8d2e4703afcc8abd;
                } else {
                    /#
                        assertmsg("ContrailData asset: " + contrail.var_8d2e4703afcc8abd + "does not have a parachute reference");
                    #/
                }
            }
        }
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3948
// Size: 0x140
function function_53cecc93d53fb16e(team) {
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a8f
// Size: 0xe1
function onplayerconnect() {
    for (;;) {
        player = level waittill("connected");
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b77
// Size: 0x35
function onjoinedteam(player) {
    if (getdvarint(@"hash_6074f1620fbd9746", 0) != 0) {
        player namespace_80cec6cfc70c4f95::updateplayereliminatedomnvar("onJoinedTeam");
    }
    player updateteamtime();
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bb3
// Size: 0x2c
function onjoinedspectators(player) {
    if (isdefined(player.pers)) {
        player.pers["teamTime"] = undefined;
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be6
// Size: 0xfe
function trackplayedtime() {
    level endon("game_ended");
    gameflagwait("prematch_done");
    var_a37b8574c4cb7d20 = 1000;
    frameduration = level.frameduration;
    var_331db3034b68a373 = floor(var_a37b8574c4cb7d20 / frameduration);
    wait(1);
    while (!level.gameended) {
        players = level.players;
        var_e0e025c067d6a3aa = ceil(players.size / var_331db3034b68a373);
        var_9f35e6303fc62b58 = 0;
        var_5b3bc73feda97439 = 0;
        for (var_99594a4d67fef20b = 0; var_99594a4d67fef20b < players.size; var_99594a4d67fef20b++) {
            if (!isdefined(players[var_99594a4d67fef20b])) {
                continue;
            }
            players[var_99594a4d67fef20b] trackplayedtimeupdate();
            var_9f35e6303fc62b58++;
            if (var_9f35e6303fc62b58 >= var_e0e025c067d6a3aa) {
                var_9f35e6303fc62b58 = 0;
                var_5b3bc73feda97439++;
                waitframe();
            }
        }
        waittime = max(0, var_a37b8574c4cb7d20 - var_5b3bc73feda97439 * frameduration) / 1000;
        wait(waittime);
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ceb
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
                namespace_3c5a4254f2b957ea::incpersstat("timeDead", 1);
            }
        }
    }
    if (isdefined(self.var_73f7116f87a4fab6) && self.var_73f7116f87a4fab6 > 0) {
        self.var_73f7116f87a4fab6--;
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dcb
// Size: 0x9a
function updateplayertimes() {
    level endon("game_ended");
    while (1) {
        playercount = level.players.size;
        startplayer = 0;
        while (startplayer < playercount) {
            namespace_e323c8674b44c8f4::waittillhostmigrationdone();
            for (var_82555c709fbe7ccc = 0; var_82555c709fbe7ccc < 20; var_82555c709fbe7ccc++) {
                playerindex = startplayer + var_82555c709fbe7ccc;
                player = level.players[playerindex];
                if (isdefined(player)) {
                    player updateplayedtime();
                }
            }
            waitframe();
            startplayer = startplayer + 20;
        }
        wait(2);
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e6c
// Size: 0x86
function finalizeplayertimes() {
    while (!level.gameended) {
        wait(2);
    }
    foreach (player in level.players) {
        player updateplayedtime();
        if (!namespace_cd0b2d039510b38d::runleanthreadmode()) {
            player namespace_2685ec368e022695::writebufferedstats();
            player namespace_2685ec368e022695::updateweaponbufferedstats();
        }
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ef9
// Size: 0x142
function updateplayedtime() {
    if (isai(self)) {
        return;
    }
    addtoplayerstatbuffered(self.timeplayed["game"], "matchStats", "timePlayedTotal");
    namespace_2685ec368e022695::stataddchildbuffered("round", "timePlayed", self.timeplayed["game"], 1);
    if (namespace_d3d40f75bb4e4c32::isplayeringulag()) {
        self.timeplayed["gulag"] = self.timeplayed["gulag"] + self.timeplayed["game"];
    } else if (namespace_d3d40f75bb4e4c32::function_8f0e6614368f64c2()) {
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4042
// Size: 0x29
function updateteamtime() {
    if (game["state"] != "playing") {
        return;
    }
    self.pers["teamTime"] = gettime();
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4072
// Size: 0x47
function updateteambalancedvar() {
    for (;;) {
        teambalance = getdvarint(@"hash_51ef9682c921092e");
        if (level.teambalance != teambalance) {
            level.teambalance = getdvarint(@"hash_51ef9682c921092e");
        }
        wait(1);
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40c0
// Size: 0xca
function updateteambalance() {
    level thread updateteambalancedvar();
    wait(0.15);
    if (level.teambalance && isroundbased()) {
        if (isdefined(game["BalanceTeamsNextRound"])) {
            namespace_44abc05161e2e2cb::showerrormessagetoallplayers("MP/AUTOBALANCE_NEXT_ROUND");
        }
        level waittill("restarting");
        if (isdefined(game["BalanceTeamsNextRound"])) {
            level balanceteams();
            game["BalanceTeamsNextRound"] = undefined;
        } else if (!getteambalance()) {
            game["BalanceTeamsNextRound"] = 1;
        }
    } else {
        level endon("game_ended");
        for (;;) {
            for (;;) {
                if (level.teambalance) {
                    if (!getteambalance()) {
                        namespace_44abc05161e2e2cb::showerrormessagetoallplayers("MP/AUTOBALANCE_SECONDS", 15);
                        wait(15);
                        if (!getteambalance()) {
                            level balanceteams();
                        }
                    }
                    wait(59);
                }
            }
        }
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4191
// Size: 0x107
function getteambalance() {
    team["allies"] = 0;
    team["axis"] = 0;
    players = level.players;
    for (i = 0; i < players.size; i++) {
        if (isdefined(players[i].pers["team"]) && players[i].pers["team"] == "allies") {
            team["allies"]++;
        } else if (isdefined(players[i].pers["team"]) && players[i].pers["team"] == "axis") {
            team["axis"]++;
        }
    }
    if (team["allies"] > team["axis"] + level.teambalance || team["axis"] > team["allies"] + level.teambalance) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x429f
// Size: 0x2b7
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
        } else if (isdefined(players[i].pers["team"]) && players[i].pers["team"] == "axis") {
            axisplayers[axisplayers.size] = players[i];
        }
    }
    var_946d134ebc6c711d = undefined;
    while (var_4b60537d15df5108.size > axisplayers.size + 1 || axisplayers.size > var_4b60537d15df5108.size + 1) {
        if (var_4b60537d15df5108.size > axisplayers.size + 1) {
            for (j = 0; j < var_4b60537d15df5108.size; j++) {
                if (isdefined(var_4b60537d15df5108[j].dont_auto_balance)) {
                    continue;
                }
                if (!isdefined(var_946d134ebc6c711d)) {
                    var_946d134ebc6c711d = var_4b60537d15df5108[j];
                } else if (var_4b60537d15df5108[j].pers["teamTime"] > var_946d134ebc6c711d.pers["teamTime"]) {
                    var_946d134ebc6c711d = var_4b60537d15df5108[j];
                }
            }
            var_946d134ebc6c711d [[ level.onteamselection ]]("axis");
        } else if (axisplayers.size > var_4b60537d15df5108.size + 1) {
            for (j = 0; j < axisplayers.size; j++) {
                if (isdefined(axisplayers[j].dont_auto_balance)) {
                    continue;
                }
                if (!isdefined(var_946d134ebc6c711d)) {
                    var_946d134ebc6c711d = axisplayers[j];
                } else if (axisplayers[j].pers["teamTime"] > var_946d134ebc6c711d.pers["teamTime"]) {
                    var_946d134ebc6c711d = axisplayers[j];
                }
            }
            var_946d134ebc6c711d [[ level.onteamselection ]]("allies");
        }
        var_946d134ebc6c711d = undefined;
        var_4b60537d15df5108 = [];
        axisplayers = [];
        players = level.players;
        for (i = 0; i < players.size; i++) {
            if (isdefined(players[i].pers["team"]) && players[i].pers["team"] == "allies") {
                var_4b60537d15df5108[var_4b60537d15df5108.size] = players[i];
            } else if (isdefined(players[i].pers["team"]) && players[i].pers["team"] == "axis") {
                axisplayers[axisplayers.size] = players[i];
            }
        }
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x455d
// Size: 0x14
function playermodelforweapon(weapon, secondary) {
    
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4578
// Size: 0x11d
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
            /#
                assert(isdefined(player_counts[level.players[i].pers["team"]]));
            #/
            player_counts[level.players[i].pers["team"]]++;
        }
    }
    return player_counts;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x469d
// Size: 0x88
function setcharactermodels(bodymodelname, headmodelname, var_41bd2eeda1c033d2) {
    if (isdefined(self.headmodel)) {
        self detach(self.headmodel);
    }
    if (!isagent(self)) {
        bodymodelname = self getcustomizationbody();
        headmodelname = self getcustomizationhead();
        var_41bd2eeda1c033d2 = self getcustomizationviewmodel();
    }
    self setmodel(bodymodelname);
    self setviewmodel(var_41bd2eeda1c033d2);
    if (isdefined(headmodelname)) {
        self attach(headmodelname, "", 1);
        self.headmodel = headmodelname;
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x472c
// Size: 0x148
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
        if (namespace_36f464722d326bbe::function_2536e99eb6586f8f()) {
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
    var_41bd2eeda1c033d2 = self getcustomizationviewmodel();
    setcharactermodels(bodymodelname, headmodelname, var_41bd2eeda1c033d2);
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x487b
// Size: 0x7e
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4901
// Size: 0x80
function setmodelfromcustomization() {
    /#
        assert(isdefined(self));
    #/
    /#
        assert(isplayer(self));
    #/
    customization = getcustomization();
    self setcustomization(customization["body"], customization["head"]);
    bodymodelname = self getcustomizationbody();
    headmodelname = self getcustomizationhead();
    var_41bd2eeda1c033d2 = self getcustomizationviewmodel();
    setcharactermodels(bodymodelname, headmodelname, var_41bd2eeda1c033d2);
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4988
// Size: 0x37
function getplayerviewmodelfrombody(var_c993ec5d5206d3c6) {
    viewmodel = namespace_465d40bb08a5337a::function_aa32c85a2c2a2d8b(var_c993ec5d5206d3c6);
    if (!isdefined(viewmodel) || viewmodel == "") {
        viewmodel = "viewhands_mp_base_iw8";
    }
    return viewmodel;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49c7
// Size: 0x13
function getplayerfoleytype(var_c993ec5d5206d3c6) {
    return namespace_465d40bb08a5337a::function_6fd12f8316d3acc6(var_c993ec5d5206d3c6);
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49e2
// Size: 0x13
function getplayermodelname(bodyindex) {
    return namespace_465d40bb08a5337a::function_3cacd1cd869c0feb(bodyindex);
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49fd
// Size: 0x108
function setupplayermodel() {
    if (!isdefined(self.operatorcustomization) || self.operatorcustomization.rebuild == 1) {
        createoperatorcustomization();
    }
    setcharactermodels(self.operatorcustomization.defaultbody, self.operatorcustomization.defaulthead, self.operatorcustomization.defaultvm);
    _setsuit(self.operatorcustomization.suit);
    if (isdefined(self.operatorcustomization.var_3291e2cbec055766)) {
        self function_602b3de054f2a81(self.operatorcustomization.var_3291e2cbec055766);
    }
    namespace_f446f6030ca8cff8::_giveexecution(self.operatorcustomization.execution);
    if (isdefined(self.operatorcustomization.parachute)) {
        self function_9cd675a7411b6362(self.operatorcustomization.parachute);
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b0c
// Size: 0x147
function function_e7fe5b7d4b92813c() {
    /#
        if (isai(self)) {
            var_1c309d4424389fba = getdvar(@"hash_803cefdbe23f6bfe");
            if (isdefined(var_1c309d4424389fba) && var_1c309d4424389fba != "team_twenty_eight") {
                var_16ec163f5e8303eb = strtok(var_1c309d4424389fba, "team_twenty_nine");
                var_b7a37613aa3a6f1a = var_16ec163f5e8303eb[randomint(var_16ec163f5e8303eb.size)];
                var_5f913ea9cc37ac31 = namespace_465d40bb08a5337a::function_605079124463a67b(var_b7a37613aa3a6f1a);
                if (namespace_465d40bb08a5337a::function_54240a5fc41f6590(var_5f913ea9cc37ac31)) {
                    return [0:var_5f913ea9cc37ac31, 1:var_b7a37613aa3a6f1a];
                }
            }
        }
        if (isplayer(self)) {
            var_1c309d4424389fba = getdvar(@"hash_17a1591e3fe7c036");
            if (isdefined(var_1c309d4424389fba) && var_1c309d4424389fba != "team_twenty_eight") {
                var_16ec163f5e8303eb = strtok(var_1c309d4424389fba, "team_twenty_nine");
                var_b7a37613aa3a6f1a = var_16ec163f5e8303eb[randomint(var_16ec163f5e8303eb.size)];
                var_5f913ea9cc37ac31 = namespace_465d40bb08a5337a::function_605079124463a67b(var_b7a37613aa3a6f1a);
                if (namespace_465d40bb08a5337a::function_54240a5fc41f6590(var_5f913ea9cc37ac31)) {
                    return [0:var_5f913ea9cc37ac31, 1:var_b7a37613aa3a6f1a];
                }
            }
        }
    #/
    team = self.team;
    if (namespace_36f464722d326bbe::function_8b6131109e66d962()) {
        team = getotherteam(team)[0];
    }
    operatorref = lookupcurrentoperator(team);
    skinref = function_ed273e317490cb02(operatorref);
    return [0:operatorref, 1:skinref];
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c5b
// Size: 0x3d9
function createoperatorcustomization(operatorref, var_5864ea4e21a60cd4) {
    self function_ecdccfda4326de02();
    self.operatorcustomization = undefined;
    operatorcustomization = spawnstruct();
    if (!isdefined(operatorref) || !isdefined(var_5864ea4e21a60cd4)) {
        var_1c309d4424389fba = getdvar(@"hash_803cefdbe23f6bfe");
        var_bc7876241a7de45c = getdvar(@"hash_17a1591e3fe7c036");
        if (isdefined(var_1c309d4424389fba) && var_1c309d4424389fba != "" || isdefined(var_bc7876241a7de45c) && var_bc7876241a7de45c != "") {
            var_c00a2c6249962d83 = function_e7fe5b7d4b92813c();
            var_5864ea4e21a60cd4 = var_c00a2c6249962d83[1];
            operatorref = var_c00a2c6249962d83[0];
        } else {
            operatorref = lookupcurrentoperator(self.team);
            var_5864ea4e21a60cd4 = function_ed273e317490cb02(operatorref);
        }
    }
    operatorcustomization.operatorref = operatorref;
    operatorcustomization.skinref = var_5864ea4e21a60cd4;
    operatorcustomization.var_3291e2cbec055766 = namespace_465d40bb08a5337a::function_2dc6ef8b84dfec64(var_5864ea4e21a60cd4);
    operatorcustomization.var_d947b7e87c7243ab = function_29b2af59258d6501(var_5864ea4e21a60cd4);
    operatorcustomization.gender = getoperatorgender(operatorref);
    operatorcustomization.voice = getoperatorvoice(operatorref, var_5864ea4e21a60cd4);
    operatorcustomization.clothtype = getoperatorclothtype(var_5864ea4e21a60cd4);
    operatorcustomization.var_400ef51562606e7a = function_e8770349a2b50bec(var_5864ea4e21a60cd4);
    operatorcustomization.superfaction = getoperatorsuperfaction(operatorref);
    operatorcustomization.execution = getoperatorexecution(operatorref);
    operatorcustomization.executionquip = getoperatorexecutionquip(operatorref);
    operatorcustomization.parachute = function_66b30579f9f18786();
    operatorcustomization.suit = function_ada9a2308a4046e2(operatorref);
    operatorcustomization.brinfilsmokesuffix = getoperatorbrinfilsmokesuffix();
    operatorcustomization.rebuild = 0;
    self.operatorcustomization = operatorcustomization;
    customization = getoperatorcustomization();
    body = customization[0];
    head = customization[1];
    if (!isagent(self)) {
        self setcustomization(body, head);
        bodymodelname = self getcustomizationbody();
        headmodelname = self getcustomizationhead();
        var_e69fcb0bb9e108b = self getcustomizationviewmodel();
        var_41bd2eeda1c033d2 = getplayerviewmodelfrombody(body);
    } else if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        bodymodelname = "fullbody_usmc_ar_br_infil";
        headmodelname = undefined;
        var_e69fcb0bb9e108b = "viewhands_mp_base_iw8";
        var_41bd2eeda1c033d2 = "viewhands_mp_base_iw8";
    } else {
        bodymodelname = "body_opforce_london_terrorist_1_2";
        headmodelname = "head_male_bc_03";
        var_e69fcb0bb9e108b = "viewmodel_mp_base_iw8";
        var_41bd2eeda1c033d2 = "viewmodel_mp_base_iw8";
    }
    self.operatorcustomization.body = body;
    self.operatorcustomization.defaultbody = bodymodelname;
    self.operatorcustomization.head = head;
    self.operatorcustomization.defaulthead = headmodelname;
    self.operatorcustomization.vm = var_41bd2eeda1c033d2;
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
        self.vehiclecustomization = namespace_1f188a13f7e79610::function_1cd6d75165ecbc48();
    }
    function_1800697eba3f6660(self.operatorcustomization);
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x503b
// Size: 0x70
function function_66b30579f9f18786() {
    parachute = undefined;
    lootid = self getplayerdata("common", "commonCustomization", "parachute");
    if (isdefined(lootid) && lootid != 0) {
        if (isdefined(level.var_8439ac7b613822b0) && isdefined(level.var_8439ac7b613822b0[lootid])) {
            parachute = level.var_8439ac7b613822b0[lootid].ref;
        }
    }
    return parachute;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50b3
// Size: 0xea
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
        var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = namespace_38b993c4618e76cd::function_a50b607d2500dda5(self.operatorcustomization.execution);
    }
    self function_616c0ca219597829(var_4a654bd9a395c1ff);
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51a4
// Size: 0x8d
function lookupotheroperator(team) {
    if (!isplayer(self) && !isai(self)) {
        return "";
    }
    teamindex = ter_op(team == "allies", 1, 0);
    operatorref = "";
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (level.teambased && !isai(self)) {
            operatorref = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operators", teamindex);
        }
    }
    return operatorref;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5239
// Size: 0x397
function lookupcurrentoperator(team) {
    if (!isplayer(self) && !isai(self)) {
        /#
            assertex(0, "Non Player or Agent has called LookupCurrentOperator()");
        #/
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
                    self.botoperatorteam = random(var_a35e0c377810107e);
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
            foreach (var_257df77381fccc70, var_eef96dced6dd39f1 in level.var_b113f6fe0e7c93bf[team]) {
                if (currentindex == selectedOperatorIndex) {
                    self.botoperatorref = var_257df77381fccc70;
                    operatorref = var_257df77381fccc70;
                    break;
                }
                currentindex++;
            }
        }
        if (!isdefined(operatorref) || operatorref == "") {
            /#
                assertmsg("Could not find operator reference on an AI Operator");
            #/
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
        if (namespace_36f464722d326bbe::function_2536e99eb6586f8f() && team == "axis") {
            operatorref = "infected_western";
        } else {
            if (utility::issharedfuncdefined("instanceInventory", "getActiveOperatorLootID")) {
                var_a74fc57fb4a4d3e6 = [[ utility::getsharedfunc("instanceInventory", "getActiveOperatorLootID") ]](self);
                operatorref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_a74fc57fb4a4d3e6);
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
                /#
                    assertmsg("Could not find operator reference on a Player Operator");
                #/
                operatorref = namespace_465d40bb08a5337a::function_9242a55834c7ead8(var_e9a5f25420e74f74);
            }
            if (!namespace_465d40bb08a5337a::function_54240a5fc41f6590(operatorref)) {
                /#
                    println("team_thirty_one" + operatorref + "team_fifty_seven");
                #/
                operatorref = namespace_465d40bb08a5337a::function_9242a55834c7ead8(var_e9a5f25420e74f74);
            }
        }
    }
    return operatorref;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55d8
// Size: 0x94
function function_1851de461471fd20() {
    if (level.multiteambased || !level.teambased) {
        if (getgametype() == "xfire") {
            return is_equal(self.pers["team"], "team_three");
        } else {
            return 1;
        }
    }
    if (isdefined(level.var_62f6f7640e4431e3)) {
        if (is_equal(level.var_62f6f7640e4431e3.teambased, 1)) {
            return is_equal(level.var_62f6f7640e4431e3.var_94b34756413246bd, 1);
        }
    }
    return 0;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5674
// Size: 0x22b
function function_47ba2341114690ad(clientnum, team) {
    var_a35e0c377810107e = getarraykeys(level.var_b113f6fe0e7c93bf);
    operatorref = undefined;
    if (!isdefined(self.var_e2c5b532eb1566ab)) {
        foreach (var_7c578f2f3ebfdd97 in var_a35e0c377810107e) {
            var_ea61dcdcedf141e7 = getarraykeys(level.var_b113f6fe0e7c93bf[var_7c578f2f3ebfdd97]);
            if (!isdefined(level.headlessopindex)) {
                level.headlessopindex = [];
            }
            if (!isdefined(level.headlessopindex[var_7c578f2f3ebfdd97]) || level.headlessopindex[var_7c578f2f3ebfdd97] > var_ea61dcdcedf141e7.size) {
                level.headlessopindex[var_7c578f2f3ebfdd97] = 0;
            }
            var_fbaf0295a16d4c79 = var_ea61dcdcedf141e7[level.headlessopindex[var_7c578f2f3ebfdd97]];
            /#
                assert(var_ea61dcdcedf141e7.size > 1);
            #/
            while (isdefined(var_fbaf0295a16d4c79) && (var_fbaf0295a16d4c79 == "default_western" || var_fbaf0295a16d4c79 == "default_eastern")) {
                level.headlessopindex[var_7c578f2f3ebfdd97] = level.headlessopindex[var_7c578f2f3ebfdd97] + 1;
                if (level.headlessopindex[var_7c578f2f3ebfdd97] > var_ea61dcdcedf141e7.size) {
                    level.headlessopindex[var_7c578f2f3ebfdd97] = 0;
                }
                var_fbaf0295a16d4c79 = var_ea61dcdcedf141e7[level.headlessopindex[var_7c578f2f3ebfdd97]];
            }
            level.headlessopindex[var_7c578f2f3ebfdd97] = level.headlessopindex[var_7c578f2f3ebfdd97] + 1;
            self.var_e2c5b532eb1566ab = var_fbaf0295a16d4c79;
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58a7
// Size: 0x152
function function_ed273e317490cb02(operatorref) {
    team = getoperatorteambyref(operatorref);
    if (namespace_36f464722d326bbe::function_2536e99eb6586f8f() && self.team == "axis" && getdvarint(@"hash_c9e3e2c3666bb281", 0) == 1) {
        self.pers["operatorSkinRef"] = function_45bf24706ce6aeef();
    } else if (namespace_36f464722d326bbe::function_2536e99eb6586f8f() && self.team == "allies" && getdvarint(@"hash_ce84811e8f772df7", 0) == 1) {
        self.pers["operatorSkinRef"] = function_51e69e2a2754278d();
    } else if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref)) {
        self.pers["operatorSkinRef"] = self.operatorcustomization.skinref;
    } else if (isai(self) || self isplayerheadless()) {
        self.pers["operatorSkinRef"] = botpickskinid(operatorref);
    } else {
        self.pers["operatorSkinRef"] = namespace_465d40bb08a5337a::function_b3b2c9581b1eea75(operatorref);
    }
    return self.pers["operatorSkinRef"];
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5a01
// Size: 0x69
function private function_45bf24706ce6aeef() {
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5a72
// Size: 0x69
function private function_51e69e2a2754278d() {
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ae3
// Size: 0x66
function botpickskinid(operatorref) {
    team = ter_op(isdefined(self.botoperatorteam), self.botoperatorteam, self.team);
    randomindex = randomint(level.var_b113f6fe0e7c93bf[team][operatorref].size);
    return level.var_b113f6fe0e7c93bf[team][operatorref][randomindex];
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b51
// Size: 0x99
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bf2
// Size: 0x3ce
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
            var_c00a30624996364f = [[ level.modegetforceoperatorcustomization ]](self, operatorref, operatorSkinRef);
            operatorSkinRef = var_c00a30624996364f[1];
            operatorIndex = var_c00a30624996364f[0];
        }
        if (operatorSkinRef == "274" || operatorSkinRef == "275") {
            initdefaultoperatorskins();
            var_3060e7b91e020425 = level.teambased && !namespace_36f464722d326bbe::isBRStyleGameType();
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
            /#
                assertmsg("Body or Head came back empty, May need to resetstats. Head is " + head + " Body is " + body);
            #/
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fc8
// Size: 0x121
function initlaunchchunkoperatorskins() {
    if (isdefined(level.defaultoperatorskins)) {
        return;
    }
    level.defaultoperatorskins = [];
    level.defaultoperatorskins["allies"] = [];
    level.defaultoperatorskins["allies"]["body"] = [0:"body_mp_western_fireteam_west_dmr_1_1_lod1", 1:"body_mp_western_fireteam_west_ar_1_1_lod1"];
    level.defaultoperatorskins["allies"]["head"] = [0:"head_mp_western_fireteam_west_dmr_2_1", 1:"head_mp_western_fireteam_west_ar_1_1"];
    level.defaultoperatorskins["allies"]["suit"] = [0:"iw8_suit_mp_wyatt"];
    level.defaultoperatorskins["axis"] = [];
    level.defaultoperatorskins["axis"]["body"] = [0:"body_mp_eastern_fireteam_east_ar_lod1", 1:"body_mp_eastern_fireteam_east_lmg_lod1"];
    level.defaultoperatorskins["axis"]["head"] = [0:"head_mp_eastern_fireteam_east_ar_2", 1:"head_mp_eastern_fireteam_east_lmg"];
    level.defaultoperatorskins["axis"]["suit"] = [0:"iw8_suit_mp_wyatt"];
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60f0
// Size: 0xa82
function initdefaultoperatorskins() {
    if (isdefined(level.defaultoperatorskins)) {
        return;
    }
    level.defaultoperatorskins = [];
    level.defaultoperatorskins["allies"] = [];
    level.defaultoperatorskins["axis"] = [];
    switch (game["allies_outfit"]) {
    case #"hash_f3ebd2b661f2fb7b":
        level.defaultoperatorskins["allies"]["body"] = [0:"body_mp_western_fireteam_west_ar_1_1_lod1", 1:"body_mp_western_fireteam_west_smg_1_1_lod1", 2:"body_mp_western_fireteam_west_dmr_1_1_lod1", 3:"body_mp_western_fireteam_west_lmg_1_1_lod1", 4:"body_mp_western_fireteam_west_sg_1_1_lod1"];
        level.defaultoperatorskins["allies"]["head"][0] = [0:"head_mp_western_fireteam_west_ar_1_1", 1:"head_mp_western_fireteam_west_ar_2_1", 2:"head_mp_western_fireteam_west_ar_1_1", 3:"head_mp_western_fireteam_west_ar_2_1"];
        level.defaultoperatorskins["allies"]["head"][1] = [0:"head_mp_western_fireteam_west_smg_1_1", 1:"head_mp_western_fireteam_west_smg_2_1", 2:"head_mp_western_fireteam_west_smg_1_1"];
        level.defaultoperatorskins["allies"]["head"][2] = [0:"head_mp_western_fireteam_west_dmr_1_1", 1:"head_mp_western_fireteam_west_dmr_2_1"];
        level.defaultoperatorskins["allies"]["head"][3] = [0:"head_mp_western_fireteam_west_lmg_1_1", 1:"head_mp_western_fireteam_west_lmg_2_1"];
        level.defaultoperatorskins["allies"]["head"][4] = [0:"head_mp_western_fireteam_west_sg_1_1", 1:"head_mp_western_fireteam_west_sg_2_1"];
        break;
    case #"hash_92a46c94f7204a1c":
        level.defaultoperatorskins["allies"]["body"] = [0:"body_mp_western_fireteam_west_ar_1_2_lod1", 1:"body_mp_western_fireteam_west_smg_1_2_lod1", 2:"body_mp_western_fireteam_west_dmr_1_2_lod1", 3:"body_mp_western_fireteam_west_lmg_1_2_lod1", 4:"body_mp_western_fireteam_west_sg_1_2_lod1"];
        level.defaultoperatorskins["allies"]["head"][0] = [0:"head_mp_western_fireteam_west_ar_1_2", 1:"head_mp_western_fireteam_west_ar_2_2", 2:"head_mp_western_fireteam_west_ar_1_2", 3:"head_mp_western_fireteam_west_ar_2_2"];
        level.defaultoperatorskins["allies"]["head"][1] = [0:"head_mp_western_fireteam_west_smg_1_2", 1:"head_mp_western_fireteam_west_smg_2_2", 2:"head_mp_western_fireteam_west_smg_1_2"];
        level.defaultoperatorskins["allies"]["head"][2] = [0:"head_mp_western_fireteam_west_dmr_1_2", 1:"head_mp_western_fireteam_west_dmr_2_2"];
        level.defaultoperatorskins["allies"]["head"][3] = [0:"head_mp_western_fireteam_west_lmg_1_2", 1:"head_mp_western_fireteam_west_lmg_2_2"];
        level.defaultoperatorskins["allies"]["head"][4] = [0:"head_mp_western_fireteam_west_sg_1_2", 1:"head_mp_western_fireteam_west_sg_2_2"];
        break;
    case #"hash_a61c1051c8140ed":
        level.defaultoperatorskins["allies"]["body"] = [0:"body_mp_western_fireteam_west_ar_1_3_lod1", 1:"body_mp_western_fireteam_west_smg_1_3_lod1", 2:"body_mp_western_fireteam_west_dmr_1_3_lod1", 3:"body_mp_western_fireteam_west_lmg_1_3_lod1", 4:"body_mp_western_fireteam_west_sg_1_3_lod1"];
        level.defaultoperatorskins["allies"]["head"][0] = [0:"head_mp_western_fireteam_west_ar_1_3", 1:"head_mp_western_fireteam_west_ar_2_3", 2:"head_mp_western_fireteam_west_ar_1_3", 3:"head_mp_western_fireteam_west_ar_2_3"];
        level.defaultoperatorskins["allies"]["head"][1] = [0:"head_mp_western_fireteam_west_smg_1_3", 1:"head_mp_western_fireteam_west_smg_2_3", 2:"head_mp_western_fireteam_west_smg_1_3"];
        level.defaultoperatorskins["allies"]["head"][2] = [0:"head_mp_western_fireteam_west_dmr_1_3", 1:"head_mp_western_fireteam_west_dmr_2_3"];
        level.defaultoperatorskins["allies"]["head"][3] = [0:"head_mp_western_fireteam_west_lmg_1_3", 1:"head_mp_western_fireteam_west_lmg_2_3"];
        level.defaultoperatorskins["allies"]["head"][4] = [0:"head_mp_western_fireteam_west_sg_1_3", 1:"head_mp_western_fireteam_west_sg_2_3"];
        break;
    default:
        level.defaultoperatorskins["allies"]["body"] = [0:"body_mp_western_fireteam_west_ar_1_1_lod1", 1:"body_mp_western_fireteam_west_smg_1_1_lod1", 2:"body_mp_western_fireteam_west_dmr_1_1_lod1", 3:"body_mp_western_fireteam_west_lmg_1_1_lod1", 4:"body_mp_western_fireteam_west_sg_1_1_lod1"];
        level.defaultoperatorskins["allies"]["head"][0] = [0:"head_mp_western_fireteam_west_ar_1_1", 1:"head_mp_western_fireteam_west_ar_2_1", 2:"head_mp_western_fireteam_west_ar_1_1", 3:"head_mp_western_fireteam_west_ar_2_1"];
        level.defaultoperatorskins["allies"]["head"][1] = [0:"head_mp_western_fireteam_west_smg_1_1", 1:"head_mp_western_fireteam_west_smg_2_1", 2:"head_mp_western_fireteam_west_smg_1_1"];
        level.defaultoperatorskins["allies"]["head"][2] = [0:"head_mp_western_fireteam_west_dmr_1_1", 1:"head_mp_western_fireteam_west_dmr_2_1"];
        level.defaultoperatorskins["allies"]["head"][3] = [0:"head_mp_western_fireteam_west_lmg_1_1", 1:"head_mp_western_fireteam_west_lmg_2_1"];
        level.defaultoperatorskins["allies"]["head"][4] = [0:"head_mp_western_fireteam_west_sg_1_1", 1:"head_mp_western_fireteam_west_sg_2_1"];
        break;
    }
    switch (game["axis_outfit"]) {
    case #"hash_f3ebd2b661f2fb7b":
        level.defaultoperatorskins["axis"]["body"] = [0:"body_mp_eastern_fireteam_east_ar_lod1", 1:"body_mp_eastern_fireteam_east_smg_lod1", 2:"body_mp_eastern_fireteam_east_dmr_lod1", 3:"body_mp_eastern_fireteam_east_lmg_lod1", 4:"body_mp_eastern_fireteam_east_sg_lod1"];
        level.defaultoperatorskins["axis"]["head"][0] = [0:"head_mp_eastern_fireteam_east_ar_1", 1:"head_mp_eastern_fireteam_east_ar_2", 2:"head_mp_eastern_fireteam_east_ar_3", 3:"head_mp_eastern_fireteam_east_ar_4"];
        level.defaultoperatorskins["axis"]["head"][1] = [0:"head_mp_eastern_fireteam_east_smg_1", 1:"head_mp_eastern_fireteam_east_smg_2", 2:"head_mp_eastern_fireteam_east_smg_3"];
        level.defaultoperatorskins["axis"]["head"][2] = [0:"head_mp_eastern_fireteam_east_dmr", 1:"head_mp_eastern_fireteam_east_dmr"];
        level.defaultoperatorskins["axis"]["head"][3] = [0:"head_mp_eastern_fireteam_east_lmg", 1:"head_mp_eastern_fireteam_east_lmg"];
        level.defaultoperatorskins["axis"]["head"][4] = [0:"head_mp_eastern_fireteam_east_sg", 1:"head_mp_eastern_fireteam_east_sg"];
        break;
    case #"hash_92a46c94f7204a1c":
        level.defaultoperatorskins["axis"]["body"] = [0:"body_mp_eastern_fireteam_east_ar_2_lod1", 1:"body_mp_eastern_fireteam_east_smg_2_lod1", 2:"body_mp_eastern_fireteam_east_dmr_2_lod1", 3:"body_mp_eastern_fireteam_east_lmg_2_lod1", 4:"body_mp_eastern_fireteam_east_sg_2_lod1"];
        level.defaultoperatorskins["axis"]["head"][0] = [0:"head_mp_eastern_fireteam_east_ar_1_2", 1:"head_mp_eastern_fireteam_east_ar_2_2", 2:"head_mp_eastern_fireteam_east_ar_3_2", 3:"head_mp_eastern_fireteam_east_ar_4_2"];
        level.defaultoperatorskins["axis"]["head"][1] = [0:"head_mp_eastern_fireteam_east_smg_1_2", 1:"head_mp_eastern_fireteam_east_smg_2_2", 2:"head_mp_eastern_fireteam_east_smg_3_2"];
        level.defaultoperatorskins["axis"]["head"][2] = [0:"head_mp_eastern_fireteam_east_dmr", 1:"head_mp_eastern_fireteam_east_dmr"];
        level.defaultoperatorskins["axis"]["head"][3] = [0:"head_mp_eastern_fireteam_east_lmg", 1:"head_mp_eastern_fireteam_east_lmg"];
        level.defaultoperatorskins["axis"]["head"][4] = [0:"head_mp_eastern_fireteam_east_sg", 1:"head_mp_eastern_fireteam_east_sg"];
        break;
    case #"hash_a61c1051c8140ed":
        level.defaultoperatorskins["axis"]["body"] = [0:"body_mp_eastern_fireteam_east_ar_3_lod1", 1:"body_mp_eastern_fireteam_east_smg_3_lod1", 2:"body_mp_eastern_fireteam_east_dmr_3_lod1", 3:"body_mp_eastern_fireteam_east_lmg_3_lod1", 4:"body_mp_eastern_fireteam_east_sg_3_lod1"];
        level.defaultoperatorskins["axis"]["head"][0] = [0:"head_mp_eastern_fireteam_east_ar_1_3", 1:"head_mp_eastern_fireteam_east_ar_2_3", 2:"head_mp_eastern_fireteam_east_ar_3_3", 3:"head_mp_eastern_fireteam_east_ar_4_3"];
        level.defaultoperatorskins["axis"]["head"][1] = [0:"head_mp_eastern_fireteam_east_smg_1_3", 1:"head_mp_eastern_fireteam_east_smg_2_3", 2:"head_mp_eastern_fireteam_east_smg_3_3"];
        level.defaultoperatorskins["axis"]["head"][2] = [0:"head_mp_eastern_fireteam_east_dmr", 1:"head_mp_eastern_fireteam_east_dmr"];
        level.defaultoperatorskins["axis"]["head"][3] = [0:"head_mp_eastern_fireteam_east_lmg", 1:"head_mp_eastern_fireteam_east_lmg"];
        level.defaultoperatorskins["axis"]["head"][4] = [0:"head_mp_eastern_fireteam_east_sg", 1:"head_mp_eastern_fireteam_east_sg"];
        break;
    default:
        level.defaultoperatorskins["axis"]["body"] = [0:"body_mp_eastern_fireteam_east_ar_lod1", 1:"body_mp_eastern_fireteam_east_smg_lod1", 2:"body_mp_eastern_fireteam_east_dmr_lod1", 3:"body_mp_eastern_fireteam_east_lmg_lod1", 4:"body_mp_eastern_fireteam_east_sg_lod1"];
        level.defaultoperatorskins["axis"]["head"][0] = [0:"head_mp_eastern_fireteam_east_ar_1", 1:"head_mp_eastern_fireteam_east_ar_2", 2:"head_mp_eastern_fireteam_east_ar_3", 3:"head_mp_eastern_fireteam_east_ar_4"];
        level.defaultoperatorskins["axis"]["head"][1] = [0:"head_mp_eastern_fireteam_east_smg_1", 1:"head_mp_eastern_fireteam_east_smg_2", 2:"head_mp_eastern_fireteam_east_smg_3"];
        level.defaultoperatorskins["axis"]["head"][2] = [0:"head_mp_eastern_fireteam_east_dmr"];
        level.defaultoperatorskins["axis"]["head"][3] = [0:"head_mp_eastern_fireteam_east_lmg"];
        level.defaultoperatorskins["axis"]["head"][4] = [0:"head_mp_eastern_fireteam_east_sg"];
        break;
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b79
// Size: 0xc2
function pickdefaultoperatorskin(weapon) {
    selectedindex = 0;
    if (isdefined(weapon)) {
        var_cf4209c200f8bbf4 = namespace_68e641469fde3fa7::getweapongroup(weapon);
        switch (var_cf4209c200f8bbf4) {
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c43
// Size: 0x317
function getglcustomization() {
    weapon = self.primaryweapon;
    var_cf4209c200f8bbf4 = namespace_68e641469fde3fa7::getweapongroup(weapon);
    lethal = self.loadoutequipmentprimary;
    var_90a6afada84f104 = undefined;
    var_6d05573579e8816a = undefined;
    var_555cd24bc240b6a2 = undefined;
    if (lethal == "equip_helmet") {
        var_555cd24bc240b6a2 = "_blstk";
    } else {
        var_555cd24bc240b6a2 = "";
    }
    switch (self.team) {
    case #"hash_5f54b9bf7583687f":
        faction = "usmc";
        if (gameflag("infil_will_run") && !gameflag("prematch_done")) {
            var_2d3b5b36b4481172 = "_wind";
        } else {
            var_2d3b5b36b4481172 = "";
        }
        switch (var_cf4209c200f8bbf4) {
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
        var_2d3b5b36b4481172 = "";
        switch (var_cf4209c200f8bbf4) {
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
        var_2d3b5b36b4481172 = "";
        var_90a6afada84f104 = "_ar";
        var_6d05573579e8816a = "_ar";
        break;
    }
    body = "body_" + faction + var_90a6afada84f104 + var_2d3b5b36b4481172;
    head = "head_" + faction + var_6d05573579e8816a + var_555cd24bc240b6a2;
    self.backuphead = "head_" + faction + var_6d05573579e8816a;
    self.bodymodelname = "body_" + faction + var_90a6afada84f104;
    customization = [];
    customization[0] = body;
    customization[1] = head;
    return customization;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f62
// Size: 0x2e4
function getglcustomizationhackney() {
    weapon = self.primaryweapon;
    var_cf4209c200f8bbf4 = namespace_68e641469fde3fa7::getweapongroup(weapon);
    lethal = self.loadoutequipmentprimary;
    var_90a6afada84f104 = undefined;
    var_6d05573579e8816a = undefined;
    var_555cd24bc240b6a2 = undefined;
    if (lethal == "equip_helmet") {
        var_555cd24bc240b6a2 = "_blstk";
    } else {
        var_555cd24bc240b6a2 = "";
    }
    switch (self.team) {
    case #"hash_5f54b9bf7583687f":
        faction = "sas_urban";
        if (gameflag("infil_will_run") && !gameflag("prematch_done")) {
            var_2d3b5b36b4481172 = "";
        } else {
            var_2d3b5b36b4481172 = "_rain";
        }
        switch (var_cf4209c200f8bbf4) {
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
        var_2d3b5b36b4481172 = "";
        switch (var_cf4209c200f8bbf4) {
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
        var_2d3b5b36b4481172 = "";
        var_90a6afada84f104 = "_ar";
        var_6d05573579e8816a = "_ar";
        break;
    }
    body = "body_" + faction + var_90a6afada84f104 + var_2d3b5b36b4481172;
    head = "head_" + faction + var_6d05573579e8816a + var_2d3b5b36b4481172;
    self.backuphead = "head_" + faction + var_6d05573579e8816a;
    self.bodymodelname = "body_" + faction + var_90a6afada84f104;
    customization = [];
    customization[0] = body;
    customization[1] = head;
    return customization;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x724e
// Size: 0xa5
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x72fa
// Size: 0x94
function function_5933f55517e82c57() {
    /#
        if (getdvarint(@"hash_ff213c5a6a5e05e4", 0) == 1) {
            return;
        }
        level endon("team_hundred_five");
        for (;;) {
            foreach (player in level.players) {
                player getplayerdata("team_hundred_twenty_two", "team_hundred_twenty_nine", "team_hundred_forty_three", "team_hundred_fifty_five");
            }
            wait(0.05);
        }
    #/
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7395
// Size: 0x144
function private function_8075b157830461e0() {
    if (getdvarint(@"hash_11e4f85d7c35874e", 0) && isdefined(level.players) && level.players.size > 0) {
        var_363dfdcaf05d82e0 = getdvarfloat(@"hash_ec95630806957d09", level.framedurationseconds);
        var_5af9fdb2229b2cec = var_363dfdcaf05d82e0 / level.players.size;
        if (var_5af9fdb2229b2cec > level.framedurationseconds) {
            if (isdefined(level.var_fa5689aa69fdbd8a)) {
                function_e70f01b44a09852c(level.var_fa5689aa69fdbd8a);
            }
            level.var_fa5689aa69fdbd8a = function_e4c99b0f178ffb98("teams_afk_player", 1, var_5af9fdb2229b2cec);
            /#
                println("team_hundred_fifty_eight" + 1 + "spectator" + var_5af9fdb2229b2cec + "oneLeftTime" + level.players.size + "infil" + gettime() + "game_ended");
            #/
            return 1;
        }
        if (isdefined(level.var_fa5689aa69fdbd8a)) {
            /#
                println("timePlayedTotal");
            #/
            level.var_fa5689aa69fdbd8a = undefined;
        }
        /#
            println("head_mp_eastern_fireteam_east_smg_2_3" + var_363dfdcaf05d82e0 + ") && timeSinceLastPassedDistCheck(" + level.framedurationseconds + "<unknown string>" + level.players.size);
        #/
    }
    return 0;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74e1
// Size: 0x263
function watchafk() {
    if (getdvarint(@"hash_b66208719c6bae6a", 0) == 1) {
        return;
    }
    gameflagwait("prematch_done");
    var_e599e01c671b91c0 = isdefined(game["roundsPlayed"]) && game["roundsPlayed"] == 0;
    var_e82b77c55ccc4f76 = gettime();
    var_7b9be079890a7b0 = getdvarfloat(@"hash_444f3c8b2a24404e", 35);
    var_7b9be079890a7b0 = var_7b9be079890a7b0 * 1000;
    var_b5ec3f69645ca491 = getdvarint(@"hash_2ea000db61daba7b", 30);
    var_f2b8892cfaa7df7a = getdvarint(@"hash_eb6378a8e84c183", 60);
    var_a4c838400457da2e = getdvarint(@"hash_f6abc159163cdafa", 60);
    var_17f6e610b4c861a7 = getdvarint(@"hash_dc406362e8a37974", 60);
    var_cb0d938e64f611fc = getdvarint(@"hash_8eee933f8b6a65ec", 1);
    var_9bce2d454a1f6e47 = getdvarint(@"hash_dd0bcad4d12f8993", 1);
    level.var_e04e8f03163c0385 = getdvarint(@"hash_213cadd687024445", 15);
    function_8075b157830461e0();
    var_4fa709d9b5888570 = level.players.size;
    nexttoupdate = 0;
    while (1) {
        nexttoupdate++;
        if (nexttoupdate >= level.players.size) {
            nexttoupdate = 0;
            if (var_4fa709d9b5888570 != level.players.size) {
                function_8075b157830461e0();
                var_4fa709d9b5888570 = level.players.size;
            }
        }
        if (isdefined(level.players[nexttoupdate])) {
            if (isai(level.players[nexttoupdate])) {
                waitframe();
                continue;
            }
            if (level.var_ec2fb549b15ad827) {
                if (var_cb0d938e64f611fc && var_e599e01c671b91c0 && gettime() - var_e82b77c55ccc4f76 < var_7b9be079890a7b0) {
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
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x774b
// Size: 0xca
function function_19300abfbb10928b() {
    timeplayed = function_53c4c53197386572(namespace_2685ec368e022695::statgetchildbuffered("round", "timePlayed", 0), 0);
    timeDead = function_53c4c53197386572(namespace_3c5a4254f2b957ea::getpersstat("timeDead"), 0);
    timeplayed = int(max(timeplayed - timeDead, 0));
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        timeplayed = timeplayed - function_53c4c53197386572(self.timeplayed["gulag"], 0);
        timeplayed = timeplayed - function_53c4c53197386572(self.timeplayed["resurgenceRespawn"], 0);
        timeplayed = timeplayed - function_53c4c53197386572(self.timeplayed["infil"], 0);
    }
    var_61c36317dfbafb1f = function_53c4c53197386572(namespace_3c5a4254f2b957ea::getpersstat("timePlayedOnFirstSpawn"), 0);
    return timeplayed - var_61c36317dfbafb1f;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x781d
// Size: 0x55
function function_7b76ffd725358204(time, var_1dec950bbb71cde8, var_1e6c2cb81cc42e5a) {
    var_42222d94e3306524 = 0;
    if (time >= var_1dec950bbb71cde8) {
        var_42222d94e3306524 = 2;
    } else if (isdefined(var_1e6c2cb81cc42e5a) && var_1e6c2cb81cc42e5a > 0 && var_1dec950bbb71cde8 > var_1e6c2cb81cc42e5a) {
        if (time >= var_1dec950bbb71cde8 - var_1e6c2cb81cc42e5a) {
            var_42222d94e3306524 = 1;
        }
    }
    return var_42222d94e3306524;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x787a
// Size: 0xd4
function dontConsiderAFK() {
    if (istrue(level.gameended) || !istrue(self.hasspawned)) {
        return 1;
    }
    if (isdefined(self.c130) || istrue(self.brneverlanded)) {
        return 1;
    }
    if (istrue(self.ffsm_isgulagrespawn)) {
        return 1;
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (self.sessionstate == "spectator" || self.sessionstate == "intermission" || self.sessionstate == "playing_but_spectating") {
            return 1;
        }
        if (namespace_d3d40f75bb4e4c32::isplayeringulag()) {
            return 1;
        }
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("dontConsiderAFK") && istrue(namespace_71073fa38f11492::runbrgametypefunc("dontConsiderAFK", self))) {
            return 1;
        }
        if (istrue(namespace_3c5a4254f2b957ea::getpersstat("distTrackingPassed"))) {
            return 1;
        }
    }
    return 0;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7956
// Size: 0x83d
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
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("timePlayedOnFirstSpawn"))) {
        return;
    }
    var_e817fdf4412ba4ec = level.var_e04e8f03163c0385;
    kills = namespace_3c5a4254f2b957ea::getpersstat("kills");
    assists = namespace_3c5a4254f2b957ea::getpersstat("assists");
    downs = function_53c4c53197386572(namespace_3c5a4254f2b957ea::getpersstat("downs"), 0);
    var_80a323cfc33bd9e2 = kills == 0 && assists == 0 && downs == 0;
    var_ab0fbba581d754c8 = 2;
    if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("lastDamageTime"))) {
        var_ab0fbba581d754c8 = function_7b76ffd725358204(gettime() - namespace_3c5a4254f2b957ea::getpersstat("lastDamageTime"), 60000, var_e817fdf4412ba4ec * 1000);
    }
    var_88d83c00473ab477 = 2;
    if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("lastStanceChangeTime"))) {
        var_88d83c00473ab477 = function_7b76ffd725358204(gettime() - namespace_3c5a4254f2b957ea::getpersstat("lastStanceChangeTime"), 11000, var_e817fdf4412ba4ec * 1000);
    }
    var_2a8062c05d69fcf1 = function_53c4c53197386572(namespace_3c5a4254f2b957ea::getpersstat("distTrackingPassedOrResetTime"), 0);
    var_913292631f9d9e2a = function_19300abfbb10928b() - var_2a8062c05d69fcf1;
    var_9af0bd77617d4e0d = 60;
    var_f6dba1911b90d82c = var_80a323cfc33bd9e2 && var_913292631f9d9e2a > 120;
    var_d7c6b91d300a1023 = function_53c4c53197386572(self.var_3681793bfd7b68e, 0) > gettime();
    var_b79528872f8bdde = istrue(namespace_3c5a4254f2b957ea::getpersstat("distTrackingPassed")) || var_d7c6b91d300a1023;
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (istrue(self.brkickedfromplane)) {
            var_9af0bd77617d4e0d = getdvarint(@"hash_613644ac82dead59", 60);
        } else {
            var_9af0bd77617d4e0d = getdvarint(@"hash_a6a8cfe5f012e87a", 180);
        }
    } else {
        if (!isdefined(level.var_9af0bd77617d4e0d)) {
            if (getgametype() == "arena") {
                level.var_9af0bd77617d4e0d = getdvarint(@"hash_7f596f03ab14d1b4", 15);
            } else if (getgametype() == "ballmode") {
                level.var_9af0bd77617d4e0d = getdvarint(@"hash_208180e807d0093b", 60);
            } else if (isroundbased()) {
                level.var_9af0bd77617d4e0d = getdvarint(@"hash_208180e807d0093b", 60);
            } else {
                level.var_9af0bd77617d4e0d = getdvarint(@"hash_a6a8cfe5f012e87a", 60);
            }
        }
        var_9af0bd77617d4e0d = level.var_9af0bd77617d4e0d;
        if (isdefined(var_55d48eee7e287cda)) {
            var_9af0bd77617d4e0d = var_55d48eee7e287cda;
        }
        if (isdefined(var_bdbf4608f99aedb3)) {
            level.var_808e471a357552a4 = var_bdbf4608f99aedb3;
        }
    }
    if (istrue(level.var_ec2fb549b15ad827) && isdefined(var_e817fdf4412ba4ec) && var_e817fdf4412ba4ec > 0 && level.var_808e471a357552a4 > var_9af0bd77617d4e0d - var_e817fdf4412ba4ec) {
        level.var_808e471a357552a4 = var_9af0bd77617d4e0d - var_e817fdf4412ba4ec;
    }
    self.var_b0a74a5efc0d2f8c = 0;
    var_3d36e66f4dadfe3f = "default";
    if (self function_f771642d3445111f() && self.sessionstate == "playing" && var_80a323cfc33bd9e2 && !var_b79528872f8bdde) {
        self.var_b0a74a5efc0d2f8c = function_7b76ffd725358204(var_913292631f9d9e2a, var_9af0bd77617d4e0d, var_e817fdf4412ba4ec);
        var_3d36e66f4dadfe3f = "checkForAFK() TRUE, IsCommandInputStale() - " + self.name + "timeSinceLastPassedDistCheck (" + var_913292631f9d9e2a + ") > afkDistTimeThreshold(" + var_9af0bd77617d4e0d + "), lastDistTrackingPassedTime: " + var_2a8062c05d69fcf1;
    }
    if (self function_9eff7048a5747cc5()) {
        self.var_b0a74a5efc0d2f8c = 2;
        var_3d36e66f4dadfe3f = "checkForAFK() TRUE, IsCommandInputRepetitive() - " + self.name + "timeSinceLastPassedDistCheck ( " + var_913292631f9d9e2a + " ), lastDistTrackingPassedTime: " + var_2a8062c05d69fcf1;
    }
    var_bad61657da03a98d = getgametype() == "ctf" || getgametype() == "wm";
    if (isroundbased() && !var_bad61657da03a98d) {
        var_3f775fa731a484c5 = var_80a323cfc33bd9e2 || level.gametype == "arena" || level.gametype == "ballmode";
        if (level.gametype != "arena") {
            if (var_80a323cfc33bd9e2) {
                if (var_ab0fbba581d754c8 != 0) {
                    switch (level.gametype) {
                    case #"hash_fb5b5e6c07253005":
                        if (istrue(level.kick_afk_check)) {
                            self.var_b0a74a5efc0d2f8c = max(self.var_b0a74a5efc0d2f8c, var_ab0fbba581d754c8);
                        }
                        break;
                    }
                }
            }
        }
        if (var_3f775fa731a484c5 && !var_b79528872f8bdde) {
            var_678497fcd540b938 = function_7b76ffd725358204(var_913292631f9d9e2a, var_9af0bd77617d4e0d, var_e817fdf4412ba4ec);
            if (namespace_36f464722d326bbe::function_2536e99eb6586f8f()) {
                if (self.team == "axis") {
                    self.var_b0a74a5efc0d2f8c = max(self.var_b0a74a5efc0d2f8c, var_678497fcd540b938);
                }
            } else if (level.gametype == "ballmode") {
                var_ac1f7e6aecc80188 = isdefined(namespace_3c5a4254f2b957ea::getpersstat("goals")) && namespace_3c5a4254f2b957ea::getpersstat("goals") > 0;
                var_3524f819257867f4 = isdefined(namespace_3c5a4254f2b957ea::getpersstat("assists")) && namespace_3c5a4254f2b957ea::getpersstat("assists") > 0;
                var_4a834a032d48890e = 2;
                if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("lastTouchTime"))) {
                    function_7b76ffd725358204(var_913292631f9d9e2a - namespace_3c5a4254f2b957ea::getpersstat("lastTouchTime"), 60, var_e817fdf4412ba4ec);
                }
                var_c8238f8ea16268f7 = 2;
                if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("lastRamTime"))) {
                    var_c8238f8ea16268f7 = function_7b76ffd725358204(var_913292631f9d9e2a - namespace_3c5a4254f2b957ea::getpersstat("lastRamTime"), 60, var_e817fdf4412ba4ec);
                }
                if (!var_ac1f7e6aecc80188 && !var_3524f819257867f4) {
                    var_58dfeb144008c413 = min(min(var_4a834a032d48890e, var_c8238f8ea16268f7), var_678497fcd540b938);
                    self.var_b0a74a5efc0d2f8c = max(self.var_b0a74a5efc0d2f8c, var_58dfeb144008c413);
                }
            } else {
                var_58dfeb144008c413 = min(var_678497fcd540b938, var_88d83c00473ab477);
                self.var_b0a74a5efc0d2f8c = max(self.var_b0a74a5efc0d2f8c, var_58dfeb144008c413);
                var_3d36e66f4dadfe3f = "checkForAFK() TRUE, " + self.name + "timeSinceLastPassedDistCheck ( " + var_913292631f9d9e2a + " ), disTrackingPassed: " + var_b79528872f8bdde;
            }
        }
        namespace_3c5a4254f2b957ea::initpersstat("roundsAFK");
        var_fd2fff5ce3d12ee0 = istrue(var_6d2f7985df18659a);
        if (!istrue(var_6d2f7985df18659a)) {
            if (self.var_b0a74a5efc0d2f8c == 2 && !istrue(self.afkroundcounted)) {
                self.afkroundcounted = 1;
                namespace_3c5a4254f2b957ea::incpersstat("roundsAFK", 1);
                if (namespace_3c5a4254f2b957ea::getpersstat("roundsAFK") > 1) {
                    var_fd2fff5ce3d12ee0 = 1;
                }
            }
        }
        function_f66fc78c2cb0c0d3(self, var_3d36e66f4dadfe3f, self.var_b0a74a5efc0d2f8c, var_fd2fff5ce3d12ee0);
        return;
    } else {
        if (!isdefined(self.var_cb9581fc7ff5f394) || self.var_cb9581fc7ff5f394 < 3) {
            if (var_80a323cfc33bd9e2) {
                var_b8c4c1e4916a6d00 = function_7b76ffd725358204(var_913292631f9d9e2a, var_9af0bd77617d4e0d, var_e817fdf4412ba4ec);
                var_58dfeb144008c413 = min(var_b8c4c1e4916a6d00, var_ab0fbba581d754c8);
                if (!var_b79528872f8bdde) {
                    if (namespace_36f464722d326bbe::function_2536e99eb6586f8f()) {
                        if (self.team == "axis") {
                            self.var_b0a74a5efc0d2f8c = max(self.var_b0a74a5efc0d2f8c, var_58dfeb144008c413);
                        }
                    } else {
                        self.var_b0a74a5efc0d2f8c = max(self.var_b0a74a5efc0d2f8c, var_58dfeb144008c413);
                        var_3d36e66f4dadfe3f = "checkForAFK() TRUE, Non Round Based " + self.name + "( noKillsOrAssists(" + var_80a323cfc33bd9e2 + ") && !recentDamageState(" + var_ab0fbba581d754c8 + ") && timeSinceLastPassedDistCheck(" + var_913292631f9d9e2a + ") >= afkDistTimeThreshold(" + var_9af0bd77617d4e0d + "), lastDistTrackingPassedTime: " + var_2a8062c05d69fcf1;
                    }
                }
            }
        }
        if (var_f6dba1911b90d82c) {
            if (var_ab0fbba581d754c8 != 0) {
                switch (level.gametype) {
                case #"hash_fb5b5e6c07253005":
                    if (istrue(level.kick_afk_check)) {
                        self.var_b0a74a5efc0d2f8c = max(self.var_b0a74a5efc0d2f8c, var_ab0fbba581d754c8);
                    }
                    break;
                }
            }
        }
    }
    function_f66fc78c2cb0c0d3(self, var_3d36e66f4dadfe3f, self.var_b0a74a5efc0d2f8c, 1);
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x819a
// Size: 0x66
function kickafkplayer(player, reason) {
    player endon("disconnect");
    if (istrue(player.var_72c19b43b99e7097)) {
        return;
    }
    if (isdefined(reason)) {
        /#
            println(reason);
        #/
    }
    player notify("afk_disconnection_imminent");
    player.var_72c19b43b99e7097 = 1;
    wait(1);
    kick(player getentitynumber(), "EXE/PLAYERKICKED_INACTIVE", 1);
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8207
// Size: 0xa5
function function_f66fc78c2cb0c0d3(player, reason, var_b0a74a5efc0d2f8c, var_fd2fff5ce3d12ee0) {
    if (var_b0a74a5efc0d2f8c == 2 && istrue(var_fd2fff5ce3d12ee0)) {
        level thread kickafkplayer(player, reason);
    } else if (var_b0a74a5efc0d2f8c == 1 && !istrue(player.var_a34845be1b8d5cb5)) {
        player.var_a34845be1b8d5cb5 = 1;
        player setclientomnvar("ui_afk_warning", 1);
    } else if (var_b0a74a5efc0d2f8c == 0 && istrue(player.var_a34845be1b8d5cb5)) {
        player.var_a34845be1b8d5cb5 = 0;
        player setclientomnvar("ui_afk_warning", 0);
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82b3
// Size: 0x192
function getjointeampermissions(team) {
    teamcount = 0;
    botcount = 0;
    players = level.players;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (isdefined(player namespace_3c5a4254f2b957ea::getpersstat("team")) && player namespace_3c5a4254f2b957ea::getpersstat("team") == team) {
            teamcount++;
            if (isbot(player)) {
                botcount++;
            }
        }
    }
    brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    if (level.maxteamsize == 0 || teamcount < level.maxteamsize) {
        return 1;
    } else if (getgametype() == "vip" && istrue(isagent(self))) {
        return 1;
    } else if (botcount > 0) {
        return 1;
    } else if (!matchmakinggame()) {
        return 1;
    } else if (namespace_36f464722d326bbe::function_2536e99eb6586f8f()) {
        return 1;
    } else if (function_d7ec918e29c0b2f4()) {
        return 1;
    } else if (namespace_36f464722d326bbe::isBRStyleGameType() && (brgametype == "dmz" || brgametype == "exgm" || brgametype == "plunder" || brgametype == "risk")) {
        return 1;
    } else {
        /#
            println("<unknown string>" + team + "<unknown string>");
        #/
        if (self ishost()) {
            wait(1.5);
        }
        kick(self getentitynumber(), "EXE/PLAYERKICKED_INVALIDTEAM");
        return 0;
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x844c
// Size: 0x6d
function onplayerspawned() {
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("timePlayedOnFirstSpawn"))) {
        self.pers["timePlayedOnFirstSpawn"] = namespace_2685ec368e022695::statgetchildbuffered("round", "timePlayed");
    }
    if (getdvarint(@"hash_e4b249f4f77bb3c8", 0) == 1 && !runleanthreadmode()) {
        if (namespace_ca7b90256548aa40::issquadmode()) {
            thread outlinesquad_apply();
        } else {
            thread outlinefriendly_apply();
        }
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84c0
// Size: 0xaf
function outlinefriendly_apply() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (!level.teambased) {
        return;
    }
    if (getdvarint(@"hash_4b96e5b179c4e4ba", 1) == 0) {
        return;
    }
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        return;
    }
    if (gameflag("infil_will_run") && !istrue(gameflag("prematch_done"))) {
        level waittill("prematch_over");
    }
    var_4430b08d5a2d47bf = ter_op(isnightmap(), "outline_ally_night", "outline_ally");
    outlineid = outlineenableforteam(self, self.team, var_4430b08d5a2d47bf, "level_script");
    thread outlinefriendly_remove(outlineid);
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8576
// Size: 0x2d
function outlinefriendly_remove(outlineid) {
    level endon("game_ended");
    waittill_any_2("death_or_disconnect", "joined_team");
    outlinedisable(outlineid, self);
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85aa
// Size: 0xc2
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
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        return;
    }
    if (gameflag("infil_will_run") && !istrue(gameflag("prematch_done"))) {
        level waittill("prematch_over");
    }
    var_4430b08d5a2d47bf = ter_op(isnightmap(), "outline_squad_night", "outline_squad");
    outlineid = outlineenableforsquad(self, self.team, self.var_ff97225579de16a, var_4430b08d5a2d47bf, "level_script");
    thread outlinesquad_remove(outlineid);
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8673
// Size: 0x32
function outlinesquad_remove(outlineid) {
    level endon("game_ended");
    waittill_any_3("death_or_disconnect", "joined_team", "joined_squad");
    outlinedisable(outlineid, self);
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86ac
// Size: 0x67
function function_ada9a2308a4046e2(operatorref) {
    suit = namespace_465d40bb08a5337a::function_ada9a2308a4046e2(operatorref);
    if (!isdefined(suit) || suit == "") {
        if (isdefined(level.var_1a2b600a06ec21f4)) {
            suit = function_53c4c53197386572(level.var_1a2b600a06ec21f4.var_576fc201a1d5b6dc, "iw9_suit_generic_west_mp");
        } else {
            suit = "iw9_suit_generic_west_mp";
        }
    }
    return suit;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x871b
// Size: 0x66
function getoperatorexecution(operatorref) {
    var_8f65d6a740c2357e = getdvar(@"hash_f84554214a05ea42") != "0";
    var_8e0a26a04f19263d = ter_op(var_8f65d6a740c2357e, getdvar(@"hash_36390c2c231d25bc"), undefined);
    self.loadoutexecution = namespace_465d40bb08a5337a::function_5e2fa33279816be2(operatorref, var_8e0a26a04f19263d);
    return self.loadoutexecution;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8789
// Size: 0x25
function getoperatorexecutionquip(operatorref) {
    self.loadoutexecutionquip = namespace_465d40bb08a5337a::function_ac45022bf37cddfb(operatorref);
    return self.loadoutexecutionquip;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87b6
// Size: 0x24
function getoperatorsuperfaction(operatorref) {
    faction = namespace_465d40bb08a5337a::getoperatorsuperfaction(operatorref);
    return int(faction);
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87e2
// Size: 0x67
function getoperatorvoice(operatorref, skinref) {
    /#
        assert(!isnumber(skinref));
    #/
    if (operatorref == "default_eastern" || operatorref == "default_western") {
        voice = namespace_465d40bb08a5337a::function_c7f632b62e2da6dc(skinref);
        if (isdefined(voice) && voice != "") {
            return voice;
        }
    }
    voice = namespace_465d40bb08a5337a::getoperatorvoice(operatorref);
    return voice;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8851
// Size: 0x2f
function getoperatorclothtype(skinref) {
    /#
        assert(!isnumber(skinref));
    #/
    clothtype = namespace_465d40bb08a5337a::function_32d5918a7844bd9a(skinref);
    return clothtype;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8888
// Size: 0x2f
function function_e8770349a2b50bec(skinref) {
    /#
        assert(!isnumber(skinref));
    #/
    var_400ef51562606e7a = namespace_465d40bb08a5337a::function_112bf281c4f02cd5(skinref);
    return var_400ef51562606e7a;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88bf
// Size: 0x1f
function getoperatorgender(operatorref) {
    gender = namespace_465d40bb08a5337a::getoperatorgender(operatorref);
    return gender;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88e6
// Size: 0x1f
function function_29b2af59258d6501(skinref) {
    var_d947b7e87c7243ab = namespace_38b993c4618e76cd::function_a50b607d2500dda5(skinref);
    return var_d947b7e87c7243ab;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x890d
// Size: 0x94
function getoperatorbrinfilsmokesuffix(skinref) {
    /#
        assert(!isnumber(skinref));
    #/
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        suffix = undefined;
        lootid = self getplayerdata("common", "commonCustomization", "contrail");
        if (isdefined(lootid) && lootid != 0) {
            if (isdefined(level.var_a36fdb48e33dee79) && isdefined(level.var_a36fdb48e33dee79[lootid])) {
                suffix = level.var_a36fdb48e33dee79[lootid].ref;
            }
        }
        return suffix;
    }
    return undefined;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89a9
// Size: 0x1a2
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b52
// Size: 0x11b
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c74
// Size: 0x32b
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
    var_5154a960b45e4207 = namespace_465d40bb08a5337a::function_462ac94dd54da47d();
    foreach (operatorref in var_5154a960b45e4207) {
        if (!isdefined(operatorref) || operatorref == "") {
            continue;
        }
        unlocked = namespace_465d40bb08a5337a::function_422b054f4a5573e0(operatorref);
        if (!unlocked) {
            continue;
        }
        var_78fd085c338f57f4 = namespace_465d40bb08a5337a::function_119cb1191ea939ca(operatorref);
        if (!var_78fd085c338f57f4) {
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
        var_df0cfcc0964acc07 = namespace_465d40bb08a5337a::function_9c50981a840033dc(skinref);
        if (!var_df0cfcc0964acc07) {
            continue;
        }
        var_78fd085c338f57f4 = namespace_465d40bb08a5337a::function_539b94879a3b6157(skinref);
        if (!var_78fd085c338f57f4) {
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
    teams = [0:"allies", 1:"axis"];
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fa6
// Size: 0xa8
function getoperatorteambyref(operatorref) {
    foreach (team, operators in level.var_b113f6fe0e7c93bf) {
        foreach (operator, var_bfbf0d4002dd345 in operators) {
            if (operator == operatorref) {
                return team;
            }
        }
    }
    return undefined;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9056
// Size: 0xdf
function getnextoperatorindex(operatorref, var_96bdb02c18792e2f) {
    if (!var_96bdb02c18792e2f) {
        var_bf657fe9053a3502 = 0;
        foreach (var_48232c7be8e19692, var_3fdc6738d163b2e9 in level.var_b113f6fe0e7c93bf[self.team]) {
            if (operatorref == var_48232c7be8e19692) {
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
    } else {
        return randomint(level.var_b113f6fe0e7c93bf[self.team].size);
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x913c
// Size: 0xb4
function getplayerlookattarget() {
    startpos = self geteye();
    viewangles = self getplayerangles();
    fwd = anglestoforward(viewangles);
    endpos = startpos + fwd * 10000;
    var_8d727bc70842a709 = [0:"physicscontents_characterproxy"];
    var_30d537ea3164e799 = physics_createcontents(var_8d727bc70842a709);
    var_8c685a74e876c0fd = namespace_2a184fc4902783dc::sphere_trace(startpos, endpos, 5, self, var_30d537ea3164e799, 0);
    var_8b39d5984da1dc7f = var_8c685a74e876c0fd["entity"];
    if (isdefined(var_8b39d5984da1dc7f) && isplayer(var_8b39d5984da1dc7f)) {
        return var_8b39d5984da1dc7f;
    } else {
        return undefined;
    }
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x91f7
// Size: 0x11f
function devmonitoroperatorcustomizationprint() {
    /#
        setdevdvar(@"hash_a61d9425dd087ddf", 0);
        setdevdvar(@"hash_e71bf09704d58aad", 0);
    #/
    while (1) {
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

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x931d
// Size: 0xa8
function printcustomization() {
    if (!isgameplayteam(self.team)) {
        return;
    }
    var_1ceef035c3f3046d = getoperatorcustomization();
    /#
        print3d(self.origin + (0, 0, 40), "<unknown string>" + var_1ceef035c3f3046d[0], (1, 1, 1), 1, 0.5);
    #/
    /#
        print3d(self.origin + (0, 0, 60), "<unknown string>" + var_1ceef035c3f3046d[1], (1, 1, 1), 1, 0.5);
    #/
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93cc
// Size: 0x10b
function persistantgametypeteamassign() {
    team = undefined;
    count = 1;
    if (istrue(level.onlinegame)) {
        var_6980251e86d0a47 = self getfireteammembers();
        count = var_6980251e86d0a47.size;
        if (isdefined(var_6980251e86d0a47) && var_6980251e86d0a47.size > 0) {
            foreach (member in var_6980251e86d0a47) {
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
    /#
        assert(isdefined(team));
    #/
    if (!isdefined(self.teamstarttime)) {
        self.teamstarttime = gettime();
    }
    thread namespace_e5ed2f5a5ee8410e::setteam(team);
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94de
// Size: 0x103
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
            jumpiffalse(isdefined(teamplayers[0].teamstarttime) && gettime() > teamplayers[0].teamstarttime + 300000) LOC_000000db;
        } else {
        LOC_000000db:
            team = entry;
            break;
        }
    }
    /#
        assert(isdefined(team));
    #/
    return team;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x95e9
// Size: 0x78
function function_14a6f65e85694c21() {
    teamcount = 0;
    foreach (teamdata in level.teamdata) {
        if (isdefined(teamdata["teamCount"]) && teamdata["teamCount"] > 0) {
            teamcount++;
        }
    }
    return teamcount;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9669
// Size: 0x78
function getactiveteamcount() {
    teamcount = 0;
    foreach (teamdata in level.teamdata) {
        if (isdefined(teamdata["aliveCount"]) && teamdata["aliveCount"] > 0) {
            teamcount++;
        }
    }
    return teamcount;
}

// Namespace teams/namespace_6d8da2b47f878104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96e9
// Size: 0x1ec
function debugprintteams() {
    var_63f43f469b885ec6 = 25;
    while (1) {
        if (isdefined(level.teamdata)) {
            var_1b11eaa9b42e5081 = 400;
            var_1b11e9a9b42e4e4e = 200;
            linecount = 1;
            teamcount = 0;
            foreach (team in level.teamnamelist) {
                linecount = 1;
                /#
                    printtoscreen2d(var_1b11eaa9b42e5081, var_1b11e9a9b42e4e4e + var_63f43f469b885ec6 * linecount, "<unknown string>" + team, (1, 1, 1), 1);
                #/
                linecount++;
                foreach (player in level.teamdata[team]["players"]) {
                    color = (1, 1, 1);
                    if (istrue(player.squadassignedfromlobby)) {
                        color = (0, 1, 0);
                    }
                    /#
                        printtoscreen2d(var_1b11eaa9b42e5081 + 25, var_1b11e9a9b42e4e4e + var_63f43f469b885ec6 * linecount, player.name, color, 1);
                    #/
                    linecount++;
                    /#
                        print3d(player.origin + (0, 0, 60), team, (1, 1, 1), 1, 0.5);
                    #/
                }
                var_1b11e9a9b42e4e4e = var_1b11e9a9b42e4e4e + var_63f43f469b885ec6 * linecount + 50;
                teamcount++;
                if (teamcount > 6) {
                    teamcount = 0;
                    var_1b11eaa9b42e5081 = var_1b11eaa9b42e5081 + 200;
                    var_1b11e9a9b42e4e4e = 200;
                }
            }
        }
        waitframe();
    }
}

