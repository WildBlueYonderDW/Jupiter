// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\flags.gsc;

#namespace playerstats;

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cf
// Size: 0x214
function init() {
    if (!level.onlinestatsenabled) {
        return;
    }
    level.playerstats = spawnstruct();
    var_584994fab4a8712b = level.playerstats;
    var_584994fab4a8712b.statgroups = [];
    var_584994fab4a8712b.disabledstats = [];
    var_584994fab4a8712b.enabled = 1;
    var_584994fab4a8712b.readonly = 0;
    var_584994fab4a8712b.ratios = [];
    var_584994fab4a8712b.ratiochildren = [];
    var_584994fab4a8712b.disabledpaths = [];
    registerplayerstatratio([0:"combatStats", 1:"kdRatio"], [0:"combatStats", 1:"kills"], [0:"combatStats", 1:"deaths"]);
    registerplayerstatratio([0:"combatStats", 1:"accuracy"], [0:"combatStats", 1:"hits"], [0:"combatStats", 1:"totalShots"]);
    registerplayerstatratio([0:"matchStats", 1:"winLossRatio"], [0:"matchStats", 1:"wins"], [0:"matchStats", 1:"losses"]);
    addtostatgroup("kdr", "combatStats", "kills");
    addtostatgroup("kdr", "combatStats", "deaths");
    addtostatgroup("kdr", "combatStats", "kdRatio");
    addtostatgroup("winLoss", "matchStats", "wins");
    addtostatgroup("winLoss", "matchStats", "losses");
    addtostatgroup("winLoss", "matchStats", "winLossRatio");
    addtostatgroup("winLoss", "matchStats", "winStreak");
    addtostatgroup("winLoss", "matchStats", "ties");
    addtostatgroup("losses", "matchStats", "losses");
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ea
// Size: 0xb0
function initplayer() {
    if (!level.onlinestatsenabled) {
        return;
    }
    if (isdefined(self.pers["playerstats"])) {
        self.playerstats = self.pers["playerstats"];
    } else {
        self.playerstats = spawnstruct();
        var_5571a07135ba6940 = self.playerstats;
        self.playerstats.values = [];
        self.playerstats.paths = [];
        self.playerstats.bufferedstats = [];
    }
    if (!namespace_cd0b2d039510b38d::runleanthreadmode()) {
        thread bufferedstatwritethink();
    }
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a1
// Size: 0x2f
function bufferedstatwritethink() {
    self endon("disconnect");
    while (!namespace_4b0406965e556711::levelflag("game_over")) {
        writebufferedstats();
        wait(2);
    }
    writebufferedstats();
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d7
// Size: 0xd4
function writebufferedstats() {
    if (isai(self)) {
        return;
    }
    foreach (var_be5d99e3162a7241, unused in self.playerstats.bufferedstats) {
        patharray = self.playerstats.paths[var_be5d99e3162a7241];
        value = self.playerstats.values[var_be5d99e3162a7241];
        writeplayerstat(value, patharray[0], patharray[1], patharray[2], patharray[3], patharray[4]);
    }
    self.playerstats.bufferedstats = [];
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b2
// Size: 0xc1
function getplayerstatpathkey(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    var_ba170ae7da09e6a3 = "";
    if (isdefined(var_59be985b7443028d)) {
        var_ba170ae7da09e6a3 = var_59be945b7442f9c1 + "." + var_59be915b7442f328 + "." + var_59be925b7442f55b + "." + var_59be975b7443005a + "." + var_59be985b7443028d;
    } else if (isdefined(var_59be975b7443005a)) {
        var_ba170ae7da09e6a3 = var_59be945b7442f9c1 + "." + var_59be915b7442f328 + "." + var_59be925b7442f55b + "." + var_59be975b7443005a;
    } else if (isdefined(var_59be925b7442f55b)) {
        var_ba170ae7da09e6a3 = var_59be945b7442f9c1 + "." + var_59be915b7442f328 + "." + var_59be925b7442f55b;
    } else if (isdefined(var_59be915b7442f328)) {
        var_ba170ae7da09e6a3 = var_59be945b7442f9c1 + "." + var_59be915b7442f328;
    } else if (isdefined(var_59be945b7442f9c1)) {
        var_ba170ae7da09e6a3 = var_59be945b7442f9c1;
    }
    return var_ba170ae7da09e6a3;
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67b
// Size: 0xd6
function writeplayerstat(value, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    if (isdefined(var_59be985b7443028d)) {
        self setplayerdata(level.var_5d69837cf4db0407, "playerStats", var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d, value);
    } else if (isdefined(var_59be975b7443005a)) {
        self setplayerdata(level.var_5d69837cf4db0407, "playerStats", var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, value);
    } else if (isdefined(var_59be925b7442f55b)) {
        self setplayerdata(level.var_5d69837cf4db0407, "playerStats", var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, value);
    } else if (isdefined(var_59be915b7442f328)) {
        self setplayerdata(level.var_5d69837cf4db0407, "playerStats", var_59be945b7442f9c1, var_59be915b7442f328, value);
    } else if (isdefined(var_59be945b7442f9c1)) {
        self setplayerdata(level.var_5d69837cf4db0407, "playerStats", var_59be945b7442f9c1, value);
    }
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x758
// Size: 0xc9
function readplayerstat(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    if (isdefined(var_59be985b7443028d)) {
        return self getplayerdata(level.var_5d69837cf4db0407, "playerStats", var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    } else if (isdefined(var_59be975b7443005a)) {
        return self getplayerdata(level.var_5d69837cf4db0407, "playerStats", var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a);
    } else if (isdefined(var_59be925b7442f55b)) {
        return self getplayerdata(level.var_5d69837cf4db0407, "playerStats", var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b);
    } else if (isdefined(var_59be915b7442f328)) {
        return self getplayerdata(level.var_5d69837cf4db0407, "playerStats", var_59be945b7442f9c1, var_59be915b7442f328);
    } else if (isdefined(var_59be945b7442f9c1)) {
        return self getplayerdata(level.var_5d69837cf4db0407, "playerStats", var_59be945b7442f9c1);
    }
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x828
// Size: 0xa2
function flagstatforbufferedwrite(var_be5d99e3162a7241) {
    var_584994fab4a8712b = level.playerstats;
    if (namespace_4b0406965e556711::levelflag("game_over")) {
        patharray = self.playerstats.paths[var_be5d99e3162a7241];
        value = self.playerstats.values[var_be5d99e3162a7241];
        writeplayerstat(value, patharray[0], patharray[1], patharray[2], patharray[3], patharray[4]);
        return;
    }
    self.playerstats.bufferedstats[var_be5d99e3162a7241] = 1;
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d1
// Size: 0x96
function setplayerstat_internal(value, var_be5d99e3162a7241, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    patharray = [0:var_59be945b7442f9c1];
    patharray[patharray.size] = var_59be915b7442f328;
    patharray[patharray.size] = var_59be925b7442f55b;
    patharray[patharray.size] = var_59be975b7443005a;
    patharray[patharray.size] = var_59be985b7443028d;
    self.playerstats.values[var_be5d99e3162a7241] = value;
    self.playerstats.paths[var_be5d99e3162a7241] = patharray;
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96e
// Size: 0xfd
function addtoplayerstat_internal(var_930290d7f474a0ae, var_be5d99e3162a7241, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    patharray = [0:var_59be945b7442f9c1];
    patharray[patharray.size] = var_59be915b7442f328;
    patharray[patharray.size] = var_59be925b7442f55b;
    patharray[patharray.size] = var_59be975b7443005a;
    patharray[patharray.size] = var_59be985b7443028d;
    if (!isdefined(self.playerstats.paths[var_be5d99e3162a7241])) {
        var_10dc579c373a93dd = readplayerstat(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
        self.playerstats.values[var_be5d99e3162a7241] = var_10dc579c373a93dd + var_930290d7f474a0ae;
        self.playerstats.paths[var_be5d99e3162a7241] = patharray;
    } else {
        self.playerstats.values[var_be5d99e3162a7241] = self.playerstats.values[var_be5d99e3162a7241] + var_930290d7f474a0ae;
    }
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa72
// Size: 0xbd
function modifystatwritability(var_be5d99e3162a7241, var_fa0ab025b91d42cd) {
    var_584994fab4a8712b = level.playerstats;
    if (var_fa0ab025b91d42cd) {
        /#
            assertex(isdefined(var_584994fab4a8712b.disabledstats[var_be5d99e3162a7241]) && var_584994fab4a8712b.disabledstats[var_be5d99e3162a7241] > 0, "Attempting to make a stat writable more times than it has been made read only");
        #/
        var_584994fab4a8712b.disabledstats[var_be5d99e3162a7241]--;
        if (var_584994fab4a8712b.disabledstats[var_be5d99e3162a7241] <= 0) {
            var_584994fab4a8712b.disabledstats[var_be5d99e3162a7241] = undefined;
        }
    } else if (!isdefined(var_584994fab4a8712b.disabledstats[var_be5d99e3162a7241])) {
        var_584994fab4a8712b.disabledstats[var_be5d99e3162a7241] = 1;
    } else {
        var_584994fab4a8712b.disabledstats[var_be5d99e3162a7241]++;
    }
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb36
// Size: 0x2d
function isstatwritable_internal(var_be5d99e3162a7241) {
    return !areplayerstatsreadonly() && !isdefined(level.playerstats.disabledstats[var_be5d99e3162a7241]);
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6b
// Size: 0xa1
function addtostatgroup(var_14e8c48563b7348a, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    var_584994fab4a8712b = level.playerstats;
    var_be5d99e3162a7241 = getplayerstatpathkey(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    if (!isdefined(var_584994fab4a8712b.statgroups[var_14e8c48563b7348a])) {
        var_584994fab4a8712b.statgroups[var_14e8c48563b7348a] = [];
    }
    var_584994fab4a8712b.statgroups[var_14e8c48563b7348a][var_584994fab4a8712b.statgroups[var_14e8c48563b7348a].size] = var_be5d99e3162a7241;
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc13
// Size: 0x82
function modifystatgroupwritability(var_14e8c48563b7348a, var_fa0ab025b91d42cd) {
    var_584994fab4a8712b = level.playerstats;
    foreach (var_be5d99e3162a7241 in var_584994fab4a8712b.statgroups[var_14e8c48563b7348a]) {
        modifystatwritability(var_be5d99e3162a7241, var_fa0ab025b91d42cd);
    }
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9c
// Size: 0x129
function calculateplayerstatratio(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    if (!areplayerstatsenabled()) {
        return undefined;
    }
    var_584994fab4a8712b = level.playerstats;
    var_be5d99e3162a7241 = getplayerstatpathkey(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    if (!isdefined(var_584994fab4a8712b.ratios[var_be5d99e3162a7241])) {
        /#
            assertmsg("updatePlayerStatRatio() - Un-Registered ratio "" + var_be5d99e3162a7241 + """);
        #/
    }
    if (!isstatwritable_internal(var_be5d99e3162a7241)) {
        return;
    }
    var_998d185046c07e5c = var_584994fab4a8712b.ratios[var_be5d99e3162a7241]["numerator"];
    var_85468554d750c31d = var_584994fab4a8712b.ratios[var_be5d99e3162a7241]["denominator"];
    numerator = getplayerstat(var_998d185046c07e5c[0], var_998d185046c07e5c[1], var_998d185046c07e5c[2], var_998d185046c07e5c[3], var_998d185046c07e5c[4]);
    denominator = getplayerstat(var_85468554d750c31d[0], var_85468554d750c31d[1], var_85468554d750c31d[2], var_85468554d750c31d[3], var_85468554d750c31d[4]);
    if (denominator == 0) {
        denominator = 1;
    }
    return numerator / denominator;
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcd
// Size: 0x4f
function updateplayerstatratio(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    value = calculateplayerstatratio(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    setplayerstat(value, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe23
// Size: 0x4f
function updateplayerstatratiobuffered(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    value = calculateplayerstatratio(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    setplayerstatbuffered(value, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe79
// Size: 0x9d
function updateparentratios(var_795f8fa71513ebce) {
    var_584994fab4a8712b = level.playerstats;
    if (!isdefined(var_584994fab4a8712b.ratiochildren[var_795f8fa71513ebce])) {
        return;
    }
    foreach (var_558824b1025d74ab in var_584994fab4a8712b.ratiochildren[var_795f8fa71513ebce]) {
        updateplayerstatratio(var_558824b1025d74ab[0], var_558824b1025d74ab[1], var_558824b1025d74ab[2], var_558824b1025d74ab[3], var_558824b1025d74ab[4]);
    }
}

// Namespace playerstats/namespace_3300a08ae9755a72
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1d
// Size: 0x9d
function updateparentratiosbuffered(var_795f8fa71513ebce) {
    var_584994fab4a8712b = level.playerstats;
    if (!isdefined(var_584994fab4a8712b.ratiochildren[var_795f8fa71513ebce])) {
        return;
    }
    foreach (var_558824b1025d74ab in var_584994fab4a8712b.ratiochildren[var_795f8fa71513ebce]) {
        updateplayerstatratiobuffered(var_558824b1025d74ab[0], var_558824b1025d74ab[1], var_558824b1025d74ab[2], var_558824b1025d74ab[3], var_558824b1025d74ab[4]);
    }
}

