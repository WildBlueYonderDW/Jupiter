// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_3f8889c16399185c;
#using scripts\mp\rank.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\weaponrank.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace matchdata;

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f7
// Size: 0x251
function init() {
    if (getdvarint(@"hash_4ba1427c86b79dc5") != 0 && !isdefined(game["gamestarted"])) {
        setmatchdatadef("ddl/mp/matchdata.ddl");
        setmatchdata("commonMatchData", "map", level.script);
        if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
            tmp = getgametype() + " hc";
            setmatchdata("commonMatchData", "gametype", tmp);
        } else {
            setmatchdata("commonMatchData", "gametype", getgametype());
        }
        setmatchdata("commonMatchData", "build_version", getbuildversion());
        setmatchdata("commonMatchData", "build_number", getbuildnumber());
        setmatchdata("commonMatchData", "is_private_match", privatematch());
        setmatchdata("firstOvertimeRoundIndex", -1);
        if (ismlgmatch()) {
            setmatchdata("codESportsRules", 1);
        }
    }
    if (getdvarint(@"hash_4ba1427c86b79dc5") != 0) {
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            level.maxlogclients = 200;
        } else {
            level.maxlogclients = 30;
        }
    } else {
        level.maxlogclients = 0;
    }
    level.maxlives = 475;
    level.maxnamelength = 26;
    level.maxgameevents = 250;
    level.maxkillstreaks = 64;
    level.maxkillstreaksavailable = 64;
    level.maxnumchallengesperplayer = 10;
    level.maxnumawardsperplayer = 10;
    level.maxsupersavailable = 50;
    level.maxsupersactivated = 50;
    level.maxsupersexpired = 50;
    level.matchdataattachmentstatsenabled = 0;
    level.matchdata_onroundend = &onroundend;
    level.matchdata_logkillstreakevent = &logkillstreakevent;
    level.matchdata_logattackerkillevent = &logattackerkillevent;
    level.matchdata_logvictimkillevent = &logvictimkillevent;
    level.matchdata_logmultikill = &logmultikill;
    level.matchdata_logplayerdata = &logplayerdata;
    level.matchdata_recordrecentlyplayeddata = &recordrecentlyplayeddata;
    level.matchdata_logattachmentstat = &logattachmentstat;
    level.matchdata_buildweaponrootlist = &buildweaponrootlist;
    level.matchdata_logchallenge = &logchallenge;
    level.matchdata_logaward = &logaward;
    level thread endofgamesummarylogger();
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64f
// Size: 0x70
function onroundend() {
    level.endtimeutcseconds = getsystemtime();
    setmatchdata("commonMatchData", "utc_end_time_s", level.endtimeutcseconds);
    setmatchdata("commonMatchData", "player_count_end", level.players.size);
    setmatchdata("globalPlayerXpModifier", int(namespace_62c556437da28f50::getglobalrankxpmultiplier()));
    setmatchdata("globalWeaponXpModifier", int(namespace_4cd6e0abb58d4200::getglobalweaponrankxpmultiplier()));
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c6
// Size: 0x2f
function getmatchstarttimeutc() {
    if (getdvarint(@"hash_4ba1427c86b79dc5") == 0) {
        return level.starttimeutcseconds;
    }
    return getmatchdata("commonMatchData", "utc_start_time_s");
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fd
// Size: 0x2f
function getmatchendtimeutc() {
    if (getdvarint(@"hash_4ba1427c86b79dc5") == 0) {
        return level.endtimeutcseconds;
    }
    return getmatchdata("commonMatchData", "utc_end_time_s");
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x734
// Size: 0x42
function gettimefrommatchstart(basetime) {
    var_fbdcfbd6233e2398 = basetime;
    if (isdefined(level.starttimefrommatchstart)) {
        var_fbdcfbd6233e2398 = var_fbdcfbd6233e2398 - level.starttimefrommatchstart;
        if (var_fbdcfbd6233e2398 < 0) {
            var_fbdcfbd6233e2398 = 0;
        }
    } else {
        var_fbdcfbd6233e2398 = 0;
    }
    return var_fbdcfbd6233e2398;
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77e
// Size: 0x22
function logkillstreakevent(event, position) {
    /#
        println("score");
    #/
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a7
// Size: 0x22
function logattackerkillevent(lifeid, eventref) {
    /#
        println("<unknown string>");
    #/
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d0
// Size: 0x22
function logvictimkillevent(lifeid, eventref) {
    /#
        println("<unknown string>");
    #/
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f9
// Size: 0x22
function logmultikill(lifeid, var_5fd73d74128a5e31) {
    /#
        println("<unknown string>");
    #/
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x822
// Size: 0x60
function monitorweaponfire() {
    self endon("death_or_disconnect");
    while (1) {
        self waittill("begin_firing");
        thread monitorweaponfiretime();
        weaponobj = self.lastdroppableweaponobj;
        weaponobj = mapweapon(weaponobj);
        sweapon = getcompleteweaponname(weaponobj);
        thread namespace_d576b6dc7cef9c62::threadedsetweaponstatbyname(sweapon, 1, "trigger_pulls");
    }
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x889
// Size: 0x46
function monitorweaponfiretime() {
    self endon("disconnect");
    self.lastweaponfiretimestart = gettime();
    self notify("monitorWeaponFireTime");
    self endon("monitorWeaponFireTime");
    waittill_either("end_firing", "death");
    self.lastweaponfiretimeend = gettime();
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d6
// Size: 0x124
function ctgs_recordmatchstats() {
    if (!onlinestatsenabled()) {
        return;
    }
    if (!rankingenabled()) {
        return;
    }
    if (!self hasplayerdata()) {
        return;
    }
    gamemode = getgametype();
    kills = getpersstat("kills");
    deaths = getpersstat("deaths");
    headshots = getpersstat("headshots");
    assists = getpersstat("assists");
    suicides = getpersstat("suicides");
    score = getpersstat("score");
    rankxp = getrankxp();
    rank = getrankforxp(rankxp);
    var_a5da089ad8a4e8b9 = self.pers["telemetry"].utc_connect_time_s;
    timeplayed = getsystemtime() - var_a5da089ad8a4e8b9;
    self ctgsreportusermatchstats(gamemode, kills, deaths, headshots, assists, suicides, score, rank, timeplayed);
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa01
// Size: 0x350
function logplayerdata(var_934dc135aaf6f953) {
    if (!isvalidclient(self)) {
        return;
    }
    ctgs_recordmatchstats();
    self sendclientnetworktelemetry();
    self sendcollectedclientanticheatdata();
    shots = 0;
    hits = 0;
    foreach (var_5842e592ddcef384 in self.pers["matchdataWeaponStats"]) {
        var_75e61e9afcfd1e96 = 0;
        var_e1e89bd150d2b6e5 = 0;
        var_111dae76dbee9581 = 0;
        var_4ac1d6453910f005 = 0;
        var_2cd6c62534b95eb8 = 0;
        var_8797207b95ae767 = 0;
        var_c4530fef629dd385 = 0;
        var_be9811f337918ba3 = 0;
        var_474a6d79ef62cf1a = 0;
        var_6ea7d87f1769fdb7 = 0;
        var_53565c7950c80700 = 0;
        if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
            if (isenumvaluevalid("common", "LoadoutWeapon", var_5842e592ddcef384.weapon)) {
                var_75e61e9afcfd1e96 = self getplayerdata(level.loadoutsgroup, "squadMembers", "weapon_xp", var_5842e592ddcef384.weapon);
            }
        }
        foreach (statname, value in var_5842e592ddcef384.stats) {
            if (statname == "deaths") {
                var_111dae76dbee9581 = var_111dae76dbee9581 + value;
            }
            if (statname == "headshots") {
                var_4ac1d6453910f005 = var_4ac1d6453910f005 + value;
            }
            if (statname == "hits") {
                var_2cd6c62534b95eb8 = var_2cd6c62534b95eb8 + value;
                hits = hits + value;
            }
            if (statname == "ads_kills") {
                var_c4530fef629dd385 = var_c4530fef629dd385 + value;
            }
            if (statname == "kills") {
                var_8797207b95ae767 = var_8797207b95ae767 + value;
            }
            if (statname == "shots") {
                var_be9811f337918ba3 = var_be9811f337918ba3 + value;
                shots = shots + value;
            }
            if (statname == "xp_earned") {
                var_e1e89bd150d2b6e5 = var_e1e89bd150d2b6e5 + value;
            }
            if (statname == "damage") {
                var_6ea7d87f1769fdb7 = var_6ea7d87f1769fdb7 + value;
            }
            if (statname == "friendly_fire_damage") {
                var_53565c7950c80700 = var_53565c7950c80700 + value;
            }
        }
        if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
            self dlog_recordplayerevent("dlog_event_mp_player_weapon_stats", [0:"weapon", 1:var_5842e592ddcef384.weapon, 2:"variant_id", 3:var_5842e592ddcef384.variantid, 4:"loadout_index", 5:var_5842e592ddcef384.loadoutindex, 6:"starting_weapon_xp", 7:var_75e61e9afcfd1e96, 8:"xp_earned", 9:var_e1e89bd150d2b6e5, 10:"deaths", 11:var_111dae76dbee9581, 12:"headshots", 13:var_4ac1d6453910f005, 14:"hits", 15:var_2cd6c62534b95eb8, 16:"kills", 17:var_8797207b95ae767, 18:"ads_kills", 19:var_c4530fef629dd385, 20:"shots", 21:var_be9811f337918ba3, 22:"timeUsed", 23:var_474a6d79ef62cf1a, 24:"damage", 25:var_6ea7d87f1769fdb7, 26:"friendly_fire_damage", 27:var_53565c7950c80700]);
        }
    }
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd58
// Size: 0x1e5
function endofgamesummarylogger() {
    winner = level waittill("game_ended");
    if (istrue(level.var_10a1699461d4ad08)) {
        return;
    }
    foreach (player in level.players) {
        wait(0.05);
        if (!isdefined(player)) {
            continue;
        }
        if (isdefined(player.challengescompleted)) {
            player setplayerdata("common", "round", "challengeNumCompleted", player.challengescompleted.size);
        } else {
            player setplayerdata("common", "round", "challengeNumCompleted", 0);
        }
        for (i = 0; i < 20; i++) {
            if (isdefined(player.challengescompleted) && isdefined(player.challengescompleted[i]) && player.challengescompleted[i] != "ch_prestige" && !issubstr(player.challengescompleted[i], "_daily") && !issubstr(player.challengescompleted[i], "_weekly")) {
                player setplayerdata("common", "round", "challengesCompleted", i, player.challengescompleted[i]);
            } else {
                player setplayerdata("common", "round", "challengesCompleted", i, "ch_none");
            }
        }
        current_map = tolower(getdvar(@"hash_687fb8f9b7a23245"));
        player setplayerdata("common", "round", "gameMode", function_60bf8d82001fc22c());
        player setplayerdata("common", "round", "map", current_map);
    }
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf44
// Size: 0xe1
function recordrecentlyplayeddata() {
    if (matchmakinggame()) {
        currentmap = tolower(getdvar(@"hash_687fb8f9b7a23245"));
        foreach (player in level.players) {
            for (i = 4; i > 0; i--) {
                map = player getplayerdata(level.var_5d69837cf4db0407, "mapsPlayed", i - 1);
                player setplayerdata(level.var_5d69837cf4db0407, "mapsPlayed", i, map);
            }
            player setplayerdata(level.var_5d69837cf4db0407, "mapsPlayed", 0, currentmap);
        }
    }
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x102c
// Size: 0x3e
function isvalidclient(client) {
    if (istrue(game["isLaunchChunk"])) {
        return 0;
    }
    if (!isdefined(client)) {
        return 0;
    } else if (isagent(client)) {
        return 0;
    } else if (!isplayer(client)) {
        return 0;
    }
    return 1;
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1072
// Size: 0x31
function canlogclient(client) {
    if (isvalidclient(client)) {
        return (client.clientid < level.maxlogclients);
    } else {
        return 0;
    }
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10aa
// Size: 0x17
function canloglife(lifeid) {
    return lifeid < level.maxlives;
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c9
// Size: 0x3f
function logattachmentstat(var_ff180c307f2bafd3, statname, var_a1d4e7d5ef9da660, weapon) {
    if (!level.matchdataattachmentstatsenabled) {
        return;
    }
    /#
        println("<unknown string>");
    #/
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110f
// Size: 0x22
function logchallenge(challengename, tier) {
    /#
        println("<unknown string>");
    #/
}

// Namespace matchdata/namespace_eb72aa155b5e14e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1138
// Size: 0x85
function logaward(var_84ea5cf2793332c1) {
    if (!isvalidclient(self)) {
        return;
    }
    if (isbot(self) || istestclient(self) || isai(self)) {
        return;
    }
    var_16fbc6a2229d1d81 = gettimefrommatchstart(gettime());
    if (function_d03495fe6418377b(var_84ea5cf2793332c1)) {
        var_84ea5cf2793332c1 = function_f28fd66285fa2c9(var_84ea5cf2793332c1);
    }
    self dlog_recordplayerevent("dlog_event_player_award", [0:"time_ms_from_match_start", 1:var_16fbc6a2229d1d81, 2:"award", 3:var_84ea5cf2793332c1]);
}

