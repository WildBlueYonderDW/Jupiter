// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\supers.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\utility\stats.gsc;

#namespace persistence;

// Namespace persistence/namespace_2685ec368e022695
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x520
// Size: 0x31
function init() {
    level.persistentdatainfo = [];
    level thread updatebufferedstats();
    level thread updatebufferedstatsatgameend();
    level thread uploadglobalstatcounters();
    level thread writekdhistorystats();
}

// Namespace persistence/namespace_2685ec368e022695
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x558
// Size: 0x47d
function initbufferedstats() {
    /#
        println("shotsHit" + self.name);
    #/
    self.bufferedstats = [];
    self.squadmemberbufferedstats = [];
    if (onlinestatsenabled()) {
        self.bufferedstats["totalShots"] = self getplayerdata(level.var_5d69837cf4db0407, "totalShots");
        self.bufferedstats["accuracy"] = self getplayerdata(level.var_5d69837cf4db0407, "accuracy");
        self.bufferedstats["misses"] = self getplayerdata(level.var_5d69837cf4db0407, "misses");
        self.bufferedstats["hits"] = self getplayerdata(level.var_5d69837cf4db0407, "hits");
    }
    self.bufferedstats["timePlayedAllies"] = self getplayerdata(level.var_5d69837cf4db0407, "timePlayedAllies");
    self.bufferedstats["timePlayedOpfor"] = self getplayerdata(level.var_5d69837cf4db0407, "timePlayedOpfor");
    self.bufferedstats["timePlayedOther"] = self getplayerdata(level.var_5d69837cf4db0407, "timePlayedOther");
    self.bufferedstats["timePlayedTotal"] = self getplayerdata(level.var_5d69837cf4db0407, "timePlayedTotal");
    /#
        println("ai_headshots" + self.bufferedstats["<unknown string>"]);
        println("<unknown string>" + self.bufferedstats["<unknown string>"]);
        println("<unknown string>" + self.bufferedstats["<unknown string>"]);
        println("<unknown string>" + self.bufferedstats["<unknown string>"]);
    #/
    self.bufferedchildstats = [];
    self.bufferedchildstats["round"] = [];
    self.bufferedchildstats["round"]["timePlayed"] = self getplayerdata("common", "round", "timePlayed");
    if (onlinestatsenabled()) {
        self.bufferedchildstats["xpMultiplierTimePlayed"] = [];
        self.bufferedchildstats["xpMultiplierTimePlayed"][0] = self getplayerdata(level.var_5d69837cf4db0407, "xpMultiplierTimePlayed", 0);
        self.bufferedchildstats["xpMultiplierTimePlayed"][1] = self getplayerdata(level.var_5d69837cf4db0407, "xpMultiplierTimePlayed", 1);
        self.bufferedchildstats["xpMultiplierTimePlayed"][2] = self getplayerdata(level.var_5d69837cf4db0407, "xpMultiplierTimePlayed", 2);
        self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"] = [];
        self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][0] = self getplayerdata(level.var_5d69837cf4db0407, "xpMaxMultiplierTimePlayed", 0);
        self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][1] = self getplayerdata(level.var_5d69837cf4db0407, "xpMaxMultiplierTimePlayed", 1);
        self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][2] = self getplayerdata(level.var_5d69837cf4db0407, "xpMaxMultiplierTimePlayed", 2);
        self.bufferedchildstats["challengeXPMultiplierTimePlayed"] = [];
        self.bufferedchildstats["challengeXPMultiplierTimePlayed"][0] = self getplayerdata(level.var_5d69837cf4db0407, "challengeXPMultiplierTimePlayed", 0);
        self.bufferedchildstatsmax["challengeXPMaxMultiplierTimePlayed"] = [];
        self.bufferedchildstatsmax["challengeXPMaxMultiplierTimePlayed"][0] = self getplayerdata(level.var_5d69837cf4db0407, "challengeXPMaxMultiplierTimePlayed", 0);
        self.bufferedchildstats["weaponXPMultiplierTimePlayed"] = [];
        self.bufferedchildstats["weaponXPMultiplierTimePlayed"][0] = self getplayerdata(level.var_5d69837cf4db0407, "weaponXPMultiplierTimePlayed", 0);
        self.bufferedchildstatsmax["weaponXPMaxMultiplierTimePlayed"] = [];
        self.bufferedchildstatsmax["weaponXPMaxMultiplierTimePlayed"][0] = self getplayerdata(level.var_5d69837cf4db0407, "weaponXPMaxMultiplierTimePlayed", 0);
        self.bufferedstats["prestigeDoubleWeaponXp"] = self getplayerdata(level.var_5d69837cf4db0407, "prestigeDoubleWeaponXp");
        self.bufferedstats["prestigeDoubleWeaponXpTimePlayed"] = self getplayerdata(level.var_5d69837cf4db0407, "prestigeDoubleWeaponXpTimePlayed");
        self.bufferedstatsmax["prestigeDoubleWeaponXpMaxTimePlayed"] = self getplayerdata(level.var_5d69837cf4db0407, "prestigeDoubleWeaponXpMaxTimePlayed");
    }
    initbestscorestatstable();
}

// Namespace persistence/namespace_2685ec368e022695
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9dc
// Size: 0x7f
function initbestscorestatstable() {
    table = "mp/bestscorestatsTable.csv";
    self.bestscorestats = [];
    self.bufferedbestscorestats = [];
    for (row = 0; 1; row++) {
        statname = tablelookupbyrow(table, row, 0);
        if (statname == "") {
            break;
        }
        self.bestscorestats[statname] = self getplayerdata(level.var_5d69837cf4db0407, "bestScores", statname);
    }
}

// Namespace persistence/namespace_2685ec368e022695
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa62
// Size: 0x41
function statgetchild(parent, child) {
    if (parent == "round") {
        return self getplayerdata("common", parent, child);
    } else {
        return self getplayerdata(level.var_5d69837cf4db0407, parent, child);
    }
}

// Namespace persistence/namespace_2685ec368e022695
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaaa
// Size: 0x82
function statsetchild(parent, child, value, ignorekdrstats) {
    if (isagent(self)) {
        return;
    }
    if (istrue(game["practiceRound"])) {
        return;
    }
    if (isdefined(ignorekdrstats) || !onlinestatsenabled()) {
        return;
    }
    if (parent == "round") {
        self setplayerdata("common", parent, child, value);
        setbestscore(child, value);
    } else {
        self setplayerdata(level.var_5d69837cf4db0407, parent, child, value);
    }
}

// Namespace persistence/namespace_2685ec368e022695
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb33
// Size: 0x6e
function stataddchild(parent, child, value) {
    if (!onlinestatsenabled()) {
        return;
    }
    /#
        assert(isdefined(self.bufferedchildstats[parent][child]));
    #/
    curvalue = self getplayerdata(level.var_5d69837cf4db0407, parent, child);
    self setplayerdata(level.var_5d69837cf4db0407, parent, child, curvalue + value);
}

// Namespace persistence/namespace_2685ec368e022695
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba8
// Size: 0x52
function statgetchildbuffered(parent, child, force) {
    if (!onlinestatsenabled() && !istrue(force)) {
        return 0;
    }
    /#
        assert(isdefined(self.bufferedchildstats[parent][child]));
    #/
    return self.bufferedchildstats[parent][child];
}

// Namespace persistence/namespace_2685ec368e022695
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc02
// Size: 0x5b
function statsetchildbuffered(parent, child, value, force) {
    if (!onlinestatsenabled() && !istrue(force)) {
        return;
    }
    /#
        assert(isdefined(self.bufferedchildstats[parent][child]));
    #/
    self.bufferedchildstats[parent][child] = value;
}

// Namespace persistence/namespace_2685ec368e022695
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc64
// Size: 0x6d
function stataddchildbuffered(parent, child, value, force) {
    if (!onlinestatsenabled() && !istrue(force)) {
        return;
    }
    /#
        assert(isdefined(self.bufferedchildstats[parent][child]));
    #/
    curvalue = statgetchildbuffered(parent, child, force);
    statsetchildbuffered(parent, child, curvalue + value, force);
}

// Namespace persistence/namespace_2685ec368e022695
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xcd8
// Size: 0x7d
function stataddchildbufferedwithmax(parent, child, value, max) {
    if (!onlinestatsenabled()) {
        return;
    }
    /#
        assert(isdefined(self.bufferedchildstats[parent][child]));
    #/
    newvalue = statgetchildbuffered(parent, child) + value;
    if (newvalue > max) {
        newvalue = max;
    }
    if (newvalue < statgetchildbuffered(parent, child)) {
        newvalue = max;
    }
    statsetchildbuffered(parent, child, newvalue);
}

// Namespace persistence/namespace_2685ec368e022695
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5c
// Size: 0x79
function updatebufferedstats() {
    wait(0.15);
    nexttoupdate = 0;
    while (!level.gameended) {
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
        nexttoupdate++;
        if (nexttoupdate >= level.players.size) {
            nexttoupdate = 0;
        }
        if (isdefined(level.players[nexttoupdate])) {
            level.players[nexttoupdate] writebufferedstats();
            level.players[nexttoupdate] updateweaponbufferedstats();
        }
        wait(2);
    }
}

// Namespace persistence/namespace_2685ec368e022695
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddc
// Size: 0x7a
function updatebufferedstatsatgameend() {
    level endon("game_cleanup");
    level waittill("game_ended");
    foreach (player in level.players) {
        player writebufferedstats();
        player updateweaponbufferedstats();
    }
    level.disableweaponstats = 1;
}

// Namespace persistence/namespace_2685ec368e022695
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5d
// Size: 0x64
function setbestscore(statname, newvalue) {
    rankingenabled = onlinestatsenabled();
    if (!rankingenabled) {
        return;
    }
    if (isdefined(self.bestscorestats[statname]) && newvalue > self.bestscorestats[statname]) {
        self.bestscorestats[statname] = newvalue;
        self.bufferedbestscorestats[statname] = newvalue;
    }
}

// Namespace persistence/namespace_2685ec368e022695
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec8
// Size: 0xc6
function writebestscores() {
    foreach (player in level.players) {
        if (isdefined(player) && player onlinestatsenabled()) {
            foreach (statname, var_b1f473a47e479cc2 in player.bufferedbestscorestats) {
                player setplayerdata(level.var_5d69837cf4db0407, "bestScores", statname, var_b1f473a47e479cc2);
            }
        }
    }
}

// Namespace persistence/namespace_2685ec368e022695
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf95
// Size: 0x198
function writebufferedstats() {
    rankingenabled = onlinestatsenabled();
    if (rankingenabled) {
        foreach (statname, var_b1f473a47e479cc2 in self.bufferedstats) {
            self setplayerdata(level.var_5d69837cf4db0407, statname, var_b1f473a47e479cc2);
        }
        if (!isai(self)) {
            foreach (statname, var_b1f473a47e479cc2 in self.squadmemberbufferedstats) {
                self setplayerdata(level.loadoutsgroup, "squadMembers", statname, var_b1f473a47e479cc2);
            }
        }
    }
    foreach (statname, var_b1f473a47e479cc2 in self.bufferedchildstats) {
        foreach (var_af5410e8aacb5fe8, var_74224fe98d0679d2 in var_b1f473a47e479cc2) {
            if (statname == "round") {
                self setplayerdata("common", statname, var_af5410e8aacb5fe8, var_74224fe98d0679d2);
                setbestscore(var_af5410e8aacb5fe8, var_74224fe98d0679d2);
            } else if (rankingenabled) {
                self setplayerdata(level.var_5d69837cf4db0407, statname, var_af5410e8aacb5fe8, var_74224fe98d0679d2);
            }
        }
    }
}

// Namespace persistence/namespace_2685ec368e022695
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1134
// Size: 0x15c
function writekdhistorystats() {
    if (!matchmakinggame()) {
        return;
    }
    level waittill("game_ended");
    wait(0.1);
    if (waslastround() || !isroundbased() && hittimelimit()) {
        foreach (player in level.players) {
            accuracy = 0;
            if (isdefined(player.pers["shotsFired"]) && player.pers["shotsFired"] > 0) {
                totalshots = player.pers["shotsFired"];
                hits = 0;
                if (isdefined(player.pers["shotsHit"])) {
                    hits = player.pers["shotsHit"];
                }
                accuracy = int(100 * hits / totalshots);
            }
            player incrementrankedreservedhistory(player.kills, player.deaths, player.pers["headshots"], accuracy, player.pers["damage"]);
        }
    }
}

// Namespace persistence/namespace_2685ec368e022695
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1297
// Size: 0x1f2
function incrementrankedreservedhistory(kills, deaths, headshots, accuracy, damage) {
    if (!onlinestatsenabled()) {
        return;
    }
    for (i = 0; i < 4; i++) {
        prev = self getplayerdata(level.var_5d69837cf4db0407, "kdHistoryK", i + 1);
        self setplayerdata(level.var_5d69837cf4db0407, "kdHistoryK", i, prev);
        prev = self getplayerdata(level.var_5d69837cf4db0407, "kdHistoryD", i + 1);
        self setplayerdata(level.var_5d69837cf4db0407, "kdHistoryD", i, prev);
        prev = self getplayerdata(level.var_5d69837cf4db0407, "headshotHistory", i + 1);
        self setplayerdata(level.var_5d69837cf4db0407, "headshotHistory", i, prev);
        prev = self getplayerdata(level.var_5d69837cf4db0407, "accuracyHistory", i + 1);
        self setplayerdata(level.var_5d69837cf4db0407, "accuracyHistory", i, prev);
        prev = self getplayerdata(level.var_5d69837cf4db0407, "damageHistory", i + 1);
        self setplayerdata(level.var_5d69837cf4db0407, "damageHistory", i, prev);
    }
    self setplayerdata(level.var_5d69837cf4db0407, "kdHistoryK", 4, int(clamp(kills, 0, 255)));
    self setplayerdata(level.var_5d69837cf4db0407, "kdHistoryD", 4, int(clamp(deaths, 0, 255)));
    self setplayerdata(level.var_5d69837cf4db0407, "headshotHistory", 4, int(clamp(headshots, 0, 255)));
    self setplayerdata(level.var_5d69837cf4db0407, "accuracyHistory", 4, int(accuracy));
    self setplayerdata(level.var_5d69837cf4db0407, "damageHistory", 4, damage);
}

// Namespace persistence/namespace_2685ec368e022695
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1490
// Size: 0x174
function incrementweaponstat(weaponname, stat, var_a1d4e7d5ef9da660) {
    if (iskillstreakweapon(weaponname)) {
        return;
    }
    if (istrue(level.disableweaponstats)) {
        return;
    }
    if (weaponname == "jup_la_humangun") {
        return;
    }
    if (onlinestatsenabled()) {
        oldval = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "weaponStats", weaponname, stat);
        self setplayerdata(level.var_5d69837cf4db0407, "playerStats", "weaponStats", weaponname, stat, oldval + var_a1d4e7d5ef9da660);
        if (stat == "kills") {
            foreach (scope in [0:"lifetimeStats", 1:"seasonalStats"]) {
                oldval = 0;
                if (self hasplayerdata(level.var_5d69837cf4db0407, "playerStats", scope, function_f6bad1d33ad22078(), "weaponStats", weaponname, "kills")) {
                    oldval = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", scope, function_f6bad1d33ad22078(), "weaponStats", weaponname, "kills");
                }
                self setplayerdata(level.var_5d69837cf4db0407, "playerStats", scope, function_f6bad1d33ad22078(), "weaponStats", weaponname, "kills", oldval + var_a1d4e7d5ef9da660);
            }
        }
    }
}

// Namespace persistence/namespace_2685ec368e022695
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160b
// Size: 0x47
function incrementattachmentstat(attachmentname, stat, var_a1d4e7d5ef9da660, weapon) {
    if (istrue(level.disableweaponstats)) {
        return;
    }
    if (!attachmentlogsstats(attachmentname, weapon)) {
        return;
    }
    if (onlinestatsenabled()) {
    }
}

// Namespace persistence/namespace_2685ec368e022695
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1659
// Size: 0x1fa
function updateweaponbufferedstats() {
    if (!isdefined(self.trackingweapon)) {
        return;
    }
    if (isnullweapon(self.trackingweapon)) {
        return;
    }
    if (namespace_68e641469fde3fa7::issuperweapon(self.trackingweapon)) {
        if (!istrue(namespace_85d036cb78063c4a::shouldtracksuperweaponstats(self.trackingweapon))) {
            return;
        }
    }
    if (iskillstreakweapon(self.trackingweapon) || isenvironmentweapon(self.trackingweapon) || isbombsiteweapon(self.trackingweapon)) {
        return;
    }
    weapon = self.trackingweapon;
    var_fe4ff31502b2826 = undefined;
    if (weapon.isalternate) {
        var_1439f86640d42e34 = function_7c612ac92ba98dcb(weapon, weapon.underbarrel);
        if (var_1439f86640d42e34 == "altfire") {
            var_fe4ff31502b2826 = weapon.underbarrel;
            perslog_attachmentstats(var_fe4ff31502b2826, weapon);
            persclear_stats();
            return;
        }
    }
    if (!isdefined(var_fe4ff31502b2826)) {
        var_fe4ff31502b2826 = getweaponrootname(weapon);
    }
    /#
        assertex(isdefined(var_fe4ff31502b2826), "updateWeaponBufferedStats() failed to get weapon name for stats.");
    #/
    if (!iscacprimaryweapon(var_fe4ff31502b2826) && !iscacsecondaryweapon(var_fe4ff31502b2826)) {
        return;
    }
    variantid = getweaponvariantindex(weapon);
    persincrement_weaponstats(var_fe4ff31502b2826, variantid);
    fullweaponname = getcompleteweaponname(weapon);
    perslog_weaponstats(var_fe4ff31502b2826, fullweaponname, variantid);
    attachments = getweaponattachments(weapon);
    foreach (var_ff180c307f2bafd3 in attachments) {
        if (!attachmentlogsstats(var_ff180c307f2bafd3, weapon)) {
            continue;
        }
        var_1439f86640d42e34 = function_7c612ac92ba98dcb(weapon, var_ff180c307f2bafd3);
        if (var_1439f86640d42e34 == "altfire") {
            continue;
        }
        perslog_attachmentstats(var_ff180c307f2bafd3, weapon);
    }
    persclear_stats();
}

// Namespace persistence/namespace_2685ec368e022695
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x185a
// Size: 0xbb
function persclear_stats() {
    self.trackingweapon = nullweapon();
    self.trackingweaponshots = 0;
    self.trackingweaponkills = 0;
    self.var_e16d751a51153a7b = 0;
    self.var_2bf7b072e416002a = 0;
    self.var_1fe884779e5f4dbe = 0;
    self.trackingweaponhits = 0;
    self.var_a00eddcf879bdbc3 = 0;
    self.var_ca6e0d389c0ca0a7 = 0;
    self.trackingweaponheadshots = 0;
    self.var_9a2fd6f8771f2e58 = 0;
    self.var_5fac5778fe3fdc1c = 0;
    self.trackingweapondeaths = 0;
    self.var_f00517aa8f668932 = 0;
    self.var_14cec2ba65099256 = 0;
    self.var_883957b1c1ef6745 = 0;
    self.var_7b522bf6f7aeca98 = 0;
    self.var_bf617879def40524 = 0;
}

// Namespace persistence/namespace_2685ec368e022695
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191c
// Size: 0x10e
function persincrement_weaponstats(weaponname, variantid) {
    if (isdefined(self.trackingweaponshots) && self.trackingweaponshots > 0) {
        incrementweaponstat(weaponname, "shots", self.trackingweaponshots);
    }
    if (isdefined(self.trackingweaponkills) && self.trackingweaponkills > 0) {
        incrementweaponstat(weaponname, "kills", self.trackingweaponkills);
    }
    if (isdefined(self.trackingweaponhits) && self.trackingweaponhits > 0) {
        incrementweaponstat(weaponname, "hits", self.trackingweaponhits);
    }
    if (isdefined(self.trackingweaponheadshots) && self.trackingweaponheadshots > 0) {
        incrementweaponstat(weaponname, "headShots", self.trackingweaponheadshots);
    }
    if (isdefined(self.trackingweapondeaths) && self.trackingweapondeaths > 0) {
        incrementweaponstat(weaponname, "deaths", self.trackingweapondeaths);
    }
}

// Namespace persistence/namespace_2685ec368e022695
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a31
// Size: 0x78b
function perslog_weaponstats(weaponname, fullweaponname, variantid) {
    var_7e2c53b0bcf117d9 = spawnstruct();
    if (function_53c4c53197386572(self.trackingweaponshots, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "shots";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.trackingweaponshots;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.trackingweaponkills, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "kills";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.trackingweaponkills;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.var_e16d751a51153a7b, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "ads_kills";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.var_e16d751a51153a7b;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.var_2bf7b072e416002a, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "ai_ads_kills";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.var_2bf7b072e416002a;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.var_1fe884779e5f4dbe, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "player_ads_kills";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.var_1fe884779e5f4dbe;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.trackingweaponhits, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "hits";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.trackingweaponhits;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.var_a00eddcf879bdbc3, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "ai_hits";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.var_a00eddcf879bdbc3;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.var_ca6e0d389c0ca0a7, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "player_hits";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.var_ca6e0d389c0ca0a7;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.trackingweaponheadshots, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "headshots";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.trackingweaponheadshots;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.var_9a2fd6f8771f2e58, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "ai_headshots";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.var_9a2fd6f8771f2e58;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.var_5fac5778fe3fdc1c, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "player_headshots";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.var_5fac5778fe3fdc1c;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.trackingweapondeaths, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "deaths";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.trackingweapondeaths;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.var_f00517aa8f668932, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "ai_deaths";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.var_f00517aa8f668932;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.var_14cec2ba65099256, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "player_deaths";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.var_14cec2ba65099256;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.var_883957b1c1ef6745, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "damage";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.var_883957b1c1ef6745;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.var_7b522bf6f7aeca98, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "ai_damage";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.var_7b522bf6f7aeca98;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    if (function_53c4c53197386572(self.var_bf617879def40524, 0) > 0) {
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = fullweaponname;
        var_7e2c53b0bcf117d9.statname = "player_damage";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = self.var_bf617879def40524;
        var_7e2c53b0bcf117d9.variantid = variantid;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
}

// Namespace persistence/namespace_2685ec368e022695
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c3
// Size: 0x1de
function perslog_attachmentstats(var_ff180c307f2bafd3, weapon) {
    if (!attachmentlogsstats(var_ff180c307f2bafd3, weapon)) {
        return;
    }
    if (self.trackingweaponshots > 0 && var_ff180c307f2bafd3 != "tactical") {
        incrementattachmentstat(var_ff180c307f2bafd3, "shots", self.trackingweaponshots, weapon);
        utility::trycall(level.matchdata_logattachmentstat, var_ff180c307f2bafd3, "shots", self.trackingweaponshots, weapon);
    }
    if (self.trackingweaponkills > 0 && var_ff180c307f2bafd3 != "tactical") {
        incrementattachmentstat(var_ff180c307f2bafd3, "kills", self.trackingweaponkills, weapon);
        utility::trycall(level.matchdata_logattachmentstat, var_ff180c307f2bafd3, "kills", self.trackingweaponkills, weapon);
    }
    if (self.var_e16d751a51153a7b > 0 && var_ff180c307f2bafd3 != "tactical") {
        utility::trycall(level.matchdata_logattachmentstat, var_ff180c307f2bafd3, "ads_kills", self.var_e16d751a51153a7b, weapon);
    }
    if (self.trackingweaponhits > 0 && var_ff180c307f2bafd3 != "tactical") {
        incrementattachmentstat(var_ff180c307f2bafd3, "hits", self.trackingweaponhits, weapon);
        utility::trycall(level.matchdata_logattachmentstat, var_ff180c307f2bafd3, "hits", self.trackingweaponhits, weapon);
    }
    if (self.trackingweaponheadshots > 0 && var_ff180c307f2bafd3 != "tactical") {
        incrementattachmentstat(var_ff180c307f2bafd3, "headShots", self.trackingweaponheadshots, weapon);
        utility::trycall(level.matchdata_logattachmentstat, var_ff180c307f2bafd3, "headShots", self.trackingweaponheadshots, weapon);
    }
    if (self.trackingweapondeaths > 0) {
        incrementattachmentstat(var_ff180c307f2bafd3, "deaths", self.trackingweapondeaths, weapon);
        utility::trycall(level.matchdata_logattachmentstat, var_ff180c307f2bafd3, "deaths", self.trackingweapondeaths, weapon);
    }
}

// Namespace persistence/namespace_2685ec368e022695
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23a8
// Size: 0x23b
function uploadglobalstatcounters() {
    level waittill("game_ended");
    if (!matchmakinggame()) {
        return;
    }
    totalkills = 0;
    totaldeaths = 0;
    var_74ba9cc277cbe543 = 0;
    var_6e9e8acae1c9b574 = 0;
    var_43390b25454afa28 = 0;
    totaltimeplayed = 0;
    foreach (player in level.players) {
        totaltimeplayed = totaltimeplayed + player.timeplayed["total"];
    }
    dlog_recordevent("dlog_event_global_minutes", [0:"increment", 1:int(totaltimeplayed / 60)]);
    if (isroundbased() && !waslastround()) {
        return;
    }
    waitframe();
    foreach (player in level.players) {
        totalkills = totalkills + player.kills;
        totaldeaths = totaldeaths + player.deaths;
        var_74ba9cc277cbe543 = var_74ba9cc277cbe543 + player.assists;
        var_6e9e8acae1c9b574 = var_6e9e8acae1c9b574 + player namespace_3c5a4254f2b957ea::getpersstat("headshots");
        var_43390b25454afa28 = var_43390b25454afa28 + player namespace_3c5a4254f2b957ea::getpersstat("suicides");
    }
    dlog_recordevent("dlog_event_global_kills", [0:"increment", 1:totalkills]);
    dlog_recordevent("dlog_event_global_deaths", [0:"increment", 1:totaldeaths]);
    dlog_recordevent("dlog_event_global_headshots", [0:"increment", 1:var_6e9e8acae1c9b574]);
    dlog_recordevent("dlog_event_global_suicides", [0:"increment", 1:var_43390b25454afa28]);
    dlog_recordevent("dlog_event_global_games", [0:"increment", 1:1]);
    if (!isdefined(level.assists_disabled)) {
        dlog_recordevent("dlog_event_global_assists", [0:"increment", 1:var_74ba9cc277cbe543]);
    }
}

