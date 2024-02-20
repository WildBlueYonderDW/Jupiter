// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\flags.gsc;

#namespace matchstats;

// Namespace matchstats/namespace_96723478405aa192
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a
// Size: 0x60
function init() {
    if (!level.rankedmatch) {
        return;
    }
    level.matchstats = spawnstruct();
    level.matchstats.datawritten = 0;
    loadgamemodestatmap();
    thread watchplayerconnect();
    thread watchgameend();
    level.matchstats.enabled = 1;
}

// Namespace matchstats/namespace_96723478405aa192
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x201
// Size: 0xd1
function loadgamemodestatmap() {
    row = tablelookuprownum("mp/gameModeMatchStats.csv", 0, level.gametype);
    var_fb34a58676a70b9c = level.matchstats;
    if (!isdefined(row) || row < 0) {
        /#
            println("<unknown string>");
        #/
        var_fb34a58676a70b9c.modestatsenabled = 0;
        return;
    }
    var_fb34a58676a70b9c.modestatsenabled = 1;
    var_fb34a58676a70b9c.modestatmap = [];
    for (columnindex = 1; columnindex < 7; columnindex++) {
        statname = tablelookupbyrow("mp/gameModeMatchStats.csv", row, columnindex);
        if (!isdefined(statname) || statname == "") {
            continue;
        }
        var_fb34a58676a70b9c.modestatmap[statname] = columnindex - 1;
    }
}

// Namespace matchstats/namespace_96723478405aa192
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d9
// Size: 0x33
function watchplayerconnect() {
    while (1) {
        player = level waittill("connected");
        if (isai(player)) {
            continue;
        }
        player thread initplayer();
    }
}

// Namespace matchstats/namespace_96723478405aa192
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x313
// Size: 0x7d
function initplayer() {
    if (isdefined(self.pers["matchstats"])) {
        self.matchstats = self.pers["matchstats"];
    } else {
        self.matchstats = spawnstruct();
        var_e2f408cda8155ac = self.matchstats;
        self.matchstats.values = [];
        self.matchstats.paths = [];
    }
}

// Namespace matchstats/namespace_96723478405aa192
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x397
// Size: 0x8f
function watchgameend() {
    namespace_4b0406965e556711::levelflagwait("game_over");
    players = level.players;
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player writeplayerinfo();
        waitframe();
    }
    level.matchstats.datawritten = 1;
}

// Namespace matchstats/namespace_96723478405aa192
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d
// Size: 0x1a0
function writeplayerinfo() {
    var_e2f408cda8155ac = self.matchstats;
    if (!isdefined(var_e2f408cda8155ac)) {
        return;
    }
    /#
        assert(var_e2f408cda8155ac.paths.size == var_e2f408cda8155ac.values.size);
    #/
    foreach (var_c6d773a549b2d82a, value in var_e2f408cda8155ac.values) {
        patharray = var_e2f408cda8155ac.paths[var_c6d773a549b2d82a];
        switch (patharray.size) {
        case 1:
            self setplayerdata(level.var_5d69837cf4db0407, "matchStats", patharray[0], value);
            break;
        case 2:
            self setplayerdata(level.var_5d69837cf4db0407, "matchStats", patharray[0], patharray[1], value);
            break;
        case 3:
            self setplayerdata(level.var_5d69837cf4db0407, "matchStats", patharray[0], patharray[1], patharray[2], value);
            break;
        case 4:
            self setplayerdata(level.var_5d69837cf4db0407, "matchStats", patharray[0], patharray[1], patharray[2], patharray[3], value);
            break;
        case 5:
            self setplayerdata(level.var_5d69837cf4db0407, "matchStats", patharray[0], patharray[1], patharray[2], patharray[3], patharray[4], value);
            break;
        }
    }
}

// Namespace matchstats/namespace_96723478405aa192
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d4
// Size: 0x4a
function getmatchstatpathkey(patharray) {
    var_ba170ae7da09e6a3 = "";
    for (i = 0; i < patharray.size; i++) {
        if (isdefined(patharray[i])) {
            var_ba170ae7da09e6a3 = var_ba170ae7da09e6a3 + patharray[i] + ".";
        }
    }
    return var_ba170ae7da09e6a3;
}

// Namespace matchstats/namespace_96723478405aa192
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x626
// Size: 0xdf
function setmatchstat(value, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    if (!arematchstatsenabled()) {
        return;
    }
    /#
        assertex(!level.matchstats.datawritten, "setMatchStat() called after the match is over and data has been written.");
    #/
    patharray = [0:var_59be945b7442f9c1];
    if (isdefined(var_59be915b7442f328)) {
        patharray[patharray.size] = var_59be915b7442f328;
    }
    if (isdefined(var_59be925b7442f55b)) {
        patharray[patharray.size] = var_59be925b7442f55b;
    }
    if (isdefined(var_59be975b7443005a)) {
        patharray[patharray.size] = var_59be975b7443005a;
    }
    if (isdefined(var_59be985b7443028d)) {
        patharray[patharray.size] = var_59be985b7443028d;
    }
    var_be5d99e3162a7241 = getmatchstatpathkey(patharray);
    self.matchstats.values[var_be5d99e3162a7241] = value;
    self.matchstats.paths[var_be5d99e3162a7241] = patharray;
}

// Namespace matchstats/namespace_96723478405aa192
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70c
// Size: 0x133
function addtomatchstat(var_930290d7f474a0ae, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    if (!arematchstatsenabled()) {
        return;
    }
    /#
        assertex(!level.matchstats.datawritten, "setMatchStat() called after the match is over and data has been written.");
    #/
    if (!isdefined(var_930290d7f474a0ae)) {
        var_930290d7f474a0ae = 1;
    }
    patharray = [0:var_59be945b7442f9c1];
    if (isdefined(var_59be915b7442f328)) {
        patharray[patharray.size] = var_59be915b7442f328;
    }
    if (isdefined(var_59be925b7442f55b)) {
        patharray[patharray.size] = var_59be925b7442f55b;
    }
    if (isdefined(var_59be975b7443005a)) {
        patharray[patharray.size] = var_59be975b7443005a;
    }
    if (isdefined(var_59be985b7443028d)) {
        patharray[patharray.size] = var_59be985b7443028d;
    }
    var_be5d99e3162a7241 = getmatchstatpathkey(patharray);
    if (!isdefined(self.matchstats.paths[var_be5d99e3162a7241])) {
        self.matchstats.values[var_be5d99e3162a7241] = var_930290d7f474a0ae;
        self.matchstats.paths[var_be5d99e3162a7241] = patharray;
    } else {
        self.matchstats.values[var_be5d99e3162a7241] = self.matchstats.values[var_be5d99e3162a7241] + var_930290d7f474a0ae;
    }
}

// Namespace matchstats/namespace_96723478405aa192
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x846
// Size: 0x9f
function getmatchstat(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    if (!arematchstatsenabled()) {
        return undefined;
    }
    patharray = [0:var_59be945b7442f9c1, 1:var_59be915b7442f328, 2:var_59be925b7442f55b, 3:var_59be975b7443005a, 4:var_59be985b7443028d];
    var_be5d99e3162a7241 = getmatchstatpathkey(patharray);
    if (!isdefined(self.matchstats.values[var_be5d99e3162a7241])) {
        return 0;
    }
    return self.matchstats.values[var_be5d99e3162a7241];
}

// Namespace matchstats/namespace_96723478405aa192
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ed
// Size: 0x3e
function getmodestatindex(statname) {
    var_fb34a58676a70b9c = level.matchstats;
    if (!isdefined(var_fb34a58676a70b9c.modestatsenabled)) {
        return undefined;
    }
    return var_fb34a58676a70b9c.modestatmap[statname];
}

// Namespace matchstats/namespace_96723478405aa192
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x933
// Size: 0x5a
function setgamemodestat(statname, newvalue) {
    if (!arematchstatsenabled()) {
        return;
    }
    statindex = getmodestatindex(statname);
    if (!isdefined(statindex)) {
        /#
            assertmsg("setGameModeStat() - statName "" + statname + "" not found in gameModeMatchStats.csv for current game mode");
        #/
        return;
    }
    setmatchstat(newvalue, "modeStats", statindex);
}

// Namespace matchstats/namespace_96723478405aa192
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x994
// Size: 0x5a
function addtogamemodestat(statname, var_930290d7f474a0ae) {
    if (!arematchstatsenabled()) {
        return;
    }
    statindex = getmodestatindex(statname);
    if (!isdefined(statindex)) {
        /#
            assertmsg("incrementGameModeStat() - statName "" + statname + "" not found in gameModeMatchStats.csv for current game mode");
        #/
        return;
    }
    addtomatchstat(var_930290d7f474a0ae, "modeStats", statindex);
}

// Namespace matchstats/namespace_96723478405aa192
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9f5
// Size: 0x50
function getgamemodestat(statname) {
    if (!arematchstatsenabled()) {
        return;
    }
    statindex = getmodestatindex(statname);
    if (!isdefined(statindex)) {
        /#
            assertmsg("incrementGameModeStat() - statName "" + statname + "" not found in gameModeMatchStats.csv for current game mode");
        #/
        return;
    }
    return getmatchstat("modeStats", statindex);
}

// Namespace matchstats/namespace_96723478405aa192
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4d
// Size: 0x25
function arematchstatsenabled() {
    return isdefined(level.matchstats) && istrue(level.matchstats.enabled);
}

