// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\pet_watch.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_883b0db1d686c37e;

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x562
// Size: 0x345
function init() {
    if (!isdefined(level.petconsts) && !utility::iscp()) {
        level thread autofeeder();
    }
    level.petconsts = [];
    for (i = 0; 1; i++) {
        var_401cb2fe1aacac95 = tablelookupbyrow("mp/petWatchTable.csv", i, 1);
        if (!isdefined(var_401cb2fe1aacac95) || var_401cb2fe1aacac95 == "") {
            break;
        }
        var_401cb2fe1aacac95 = int(var_401cb2fe1aacac95);
        var_b36d39fe14bd8279 = spawnstruct();
        var_b36d39fe14bd8279.phasetime = int(tablelookupbyrow("mp/petWatchTable.csv", i, 2));
        var_b36d39fe14bd8279.bonustimemax = int(tablelookupbyrow("mp/petWatchTable.csv", i, 3));
        var_b36d39fe14bd8279.boredomrate = int(tablelookupbyrow("mp/petWatchTable.csv", i, 4));
        var_b36d39fe14bd8279.dirtyrate = int(tablelookupbyrow("mp/petWatchTable.csv", i, 5));
        var_b36d39fe14bd8279.unrulyrate = int(tablelookupbyrow("mp/petWatchTable.csv", i, 6));
        var_b36d39fe14bd8279.hungryrate = int(tablelookupbyrow("mp/petWatchTable.csv", i, 7));
        var_b36d39fe14bd8279.bonustype = tablelookupbyrow("mp/petWatchTable.csv", i, 8);
        var_b36d39fe14bd8279.boredstart = int(tablelookupbyrow("mp/petWatchTable.csv", i, 9));
        var_b36d39fe14bd8279.dirtystart = int(tablelookupbyrow("mp/petWatchTable.csv", i, 10));
        var_b36d39fe14bd8279.unrulystart = int(tablelookupbyrow("mp/petWatchTable.csv", i, 11));
        var_b36d39fe14bd8279.hungrystart = int(tablelookupbyrow("mp/petWatchTable.csv", i, 12));
        level.petconsts[var_401cb2fe1aacac95] = var_b36d39fe14bd8279;
    }
    level.petobjectivefilter = [];
    level.petobjectivefilter[#"assist"] = 1;
    level.petobjectivefilter[#"longshot"] = 1;
    level.petobjectivefilter[#"pointblank"] = 1;
    level.petobjectivefilter[#"headshot"] = 1;
    level.petobjectivefilter[#"avenger"] = 1;
    level.petobjectivefilter[#"hash_58b9cd84a305dd09"] = 1;
    level.petobjectivefilter[#"posthumous"] = 1;
    level.petobjectivefilter[#"revenge"] = 1;
    level.petobjectivefilter[#"firstblood"] = 1;
    level.petobjectivefilter[#"comeback"] = 1;
    level.petobjectivefilter[#"backfire"] = 1;
    level.petobjectivefilter[#"quad_feed"] = 1;
    level.petobjectivefilter[#"hash_b25fda74d611ddf2"] = 1;
    level.petobjectivefilter[#"hash_20fbb2528f21bd3"] = 1;
    level.petobjectivefilter[#"hash_5f9fc734692af8d7"] = 1;
    level.petobjectivefilter[#"hash_978b9bab778f200b"] = 1;
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ae
// Size: 0x79
function autofeeder() {
    level endon("game_ended");
    while (1) {
        foreach (player in level.players) {
            if (isdefined(player.petwatch)) {
                player feedaction();
            }
        }
        wait(1);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x92e
// Size: 0x40
function setstate(state, var_4dd38ae0e0773275) {
    self setclientomnvar("ui_pet_watch_action", state * -1);
    self.petwatch.phase = state;
    updateuistate();
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x975
// Size: 0xc9
function doaction(action) {
    switch (action) {
    case 1:
        growpet();
        break;
    case 2:
        feedaction();
        break;
    case 3:
        thread updatepetstatesincelastupdate();
        break;
    case 4:
        namespace_74465391b3cf76b::initpet(1);
        break;
    case 6:
        namespace_74465391b3cf76b::initpet(1, "pet_black");
        break;
    case 5:
        namespace_74465391b3cf76b::initpet(1, "pet_turbo");
        break;
    case 7:
        namespace_74465391b3cf76b::initpet(1, "pet_turbo", 1);
        break;
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa45
// Size: 0x52
function growpet() {
    var_24f8be8b27233505 = level.petconsts[self.petwatch.phase].phasetime;
    self.petwatch.growthtime = var_24f8be8b27233505;
    debugsetlasttime(var_24f8be8b27233505);
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9e
// Size: 0xd
function onjoinspectators() {
    self.petwatch = undefined;
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab2
// Size: 0x236
function turbopetchallengewatcher() {
    self endon("disconnect");
    self notify("turboPetChallengeWatcher()");
    self endon("turboPetChallengeWatcher()");
    for (;;) {
        val = channel = self waittill("luinotifyserver");
        if (channel == "petwatch_turbo_grow") {
            switch (val) {
            case 1:
                self reportchallengeuserevent("collect_item", "petwatch_turbo_egg");
                break;
            case 2:
                self reportchallengeuserevent("collect_item", "petwatch_turbo_baby");
                break;
            case 3:
                self reportchallengeuserevent("collect_item", "petwatch_turbo_child");
                break;
            case 4:
                self reportchallengeuserevent("collect_item", "petwatch_turbo_teen_a");
                break;
            case 5:
                self reportchallengeuserevent("collect_item", "petwatch_turbo_teen_b");
                break;
            case 6:
                self reportchallengeuserevent("collect_item", "petwatch_turbo_skunk");
                break;
            case 7:
                self reportchallengeuserevent("collect_item", "petwatch_turbo_bear");
                break;
            case 8:
                self reportchallengeuserevent("collect_item", "petwatch_turbo_mantis");
                break;
            case 9:
                self reportchallengeuserevent("collect_item", "petwatch_turbo_trex");
                break;
            case 10:
                self reportchallengeuserevent("collect_item", "petwatch_turbo_octopus");
                break;
            case 11:
                self reportchallengeuserevent("collect_item", "petwatch_turbo_fox");
                break;
            case 12:
                self reportchallengeuserevent("collect_item", "petwatch_turbo_secret1");
                break;
            case 13:
                self reportchallengeuserevent("collect_item", "petwatch_turbo_secret2");
                break;
            case 14:
                self reportchallengeuserevent("collect_item", "petwatch_turbo_secret3");
                break;
            default:
                break;
            }
        } else if (channel == "petwatch_turbo_state") {
            self setclientomnvar("ui_pet_watch_state", val);
        }
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcef
// Size: 0x870
function initpet(forceinit, var_f14d8f0fa461ea50, var_12ddbf4558cc0e91) {
    if (!isdefined(self.petwatch)) {
        self setclientomnvar("ui_pet_watch_state", 0);
        self.petwatch = spawnstruct();
        self.petwatch.petwatchtype = var_f14d8f0fa461ea50;
        if (var_f14d8f0fa461ea50 == "pet_black") {
            self.petwatch.playerdatafield = "petWatchDataBlack";
        } else if (var_f14d8f0fa461ea50 == "pet_turbo") {
            self.petwatch.playerdatafield = "petWatchDataTurbo";
            thread turbopetchallengewatcher();
        } else {
            self.petwatch.playerdatafield = "petWatchData";
        }
        if (forceinit && !istrue(var_12ddbf4558cc0e91)) {
            self setclientomnvar("ui_pet_watch_action", -1);
            setphase(0);
        } else {
            setphase(self getplayerdata("common", self.petwatch.playerdatafield, "phase"));
        }
    } else {
        if (forceinit) {
            self setclientomnvar("ui_pet_watch_action", -1);
            setphase(0);
        }
        if (self.petwatch.phase == 0) {
            resetpet(1);
        }
        if (!istrue(forceinit)) {
            return;
        }
    }
    self.petwatch.debugtimedelta = 0;
    if (self.petwatch.phase == 0) {
        resetpet(1);
    } else {
        self.petwatch.bonustime = 0;
        self.petwatch.bonustimeapplied = 0;
        self.petwatch.lastupdatetime = self getplayerdata("common", self.petwatch.playerdatafield, "lastUpdateTime");
        self.petwatch.bored = self getplayerdata("common", self.petwatch.playerdatafield, "boredDmg");
        self.petwatch.dirty = self getplayerdata("common", self.petwatch.playerdatafield, "dirtyDmg");
        self.petwatch.unruly = self getplayerdata("common", self.petwatch.playerdatafield, "unrulyDmg");
        self.petwatch.hungry = self getplayerdata("common", self.petwatch.playerdatafield, "hungryDmg");
        self.petwatch.bonustimeapplied = self getplayerdata("common", self.petwatch.playerdatafield, "bonusTime");
        self.petwatch.charged = self getplayerdata("common", self.petwatch.playerdatafield, "charged");
        self.petwatch.growthtime = self getplayerdata("common", self.petwatch.playerdatafield, "growthTime");
        self.petwatch.reproductionstreak = self getplayerdata("common", self.petwatch.playerdatafield, "reproductionStreak");
        self.petwatch.damage = self getplayerdata("common", self.petwatch.playerdatafield, "damage");
        self.petwatch.lastbored = self.petwatch.bored;
        self.petwatch.lastdirty = self.petwatch.dirty;
        self.petwatch.lastunruly = self.petwatch.unruly;
        self.petwatch.lasthungry = self.petwatch.hungry;
        var_3f302e5360a8fcec = self.petwatch.reproductionstreak % 10;
        var_89c912c00b9cbcc8 = var_3f302e5360a8fcec / 10;
        self.petwatch.growthtime = self.petwatch.growthtime + var_89c912c00b9cbcc8;
        self.petwatch.bonustimeapplied = self.petwatch.bonustimeapplied + var_89c912c00b9cbcc8;
        self.petwatch.reproductionstreak = int(self.petwatch.reproductionstreak / 10);
        self.petwatch.unicornpoints = self getplayerdata("common", self.petwatch.playerdatafield, "orcaPoints");
        self.petwatch.vampirepoints = self getplayerdata("common", self.petwatch.playerdatafield, "apachePoints");
        self.petwatch.dragonpoints = self getplayerdata("common", self.petwatch.playerdatafield, "dragonPoints");
        self.petwatch.bonuskillstreakcharge = self getplayerdata("common", self.petwatch.playerdatafield, "killstreakCharge");
        self.petwatch.bonuswingamescharge = self getplayerdata("common", self.petwatch.playerdatafield, "winGamesCharge");
        self.petwatch.bonusobjectivescorecharge = self getplayerdata("common", self.petwatch.playerdatafield, "objectiveScoreCharge");
        self.petwatch.bonuskillscharge = self getplayerdata("common", self.petwatch.playerdatafield, "killsCharge");
        self.petwatch.topkillstreakcharge = self getplayerdata("common", self.petwatch.playerdatafield, "topKillstreakCharge");
        self.petwatch.nukecharge = self getplayerdata("common", self.petwatch.playerdatafield, "nukeCharge");
        self.petwatch.wingamestop3 = self getplayerdata("common", self.petwatch.playerdatafield, "winGamesTop3");
        self.petwatch.plantscharge = self getplayerdata("common", self.petwatch.playerdatafield, "plantsCharge");
        self.petwatch.executionscharge = self getplayerdata("common", self.petwatch.playerdatafield, "executionsCharge");
        self.petwatch.objectivescorecharge = 0;
        self.petwatch.killstreakcharge = 0;
        self.petwatch.wingamescharge = 0;
        self.petwatch.killscharge = 0;
        self.petwatch.lasthungryscore = 0;
        self.petwatch.lastboredscore = 0;
        self.petwatch.lastunrulyscore = 0;
        self.petwatch.lastdirtyscore = 0;
    }
    updateuistate();
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1566
// Size: 0x22
function gethours(time) {
    var_30fecbc8f289eab = 3600;
    return int(time / var_30fecbc8f289eab);
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1590
// Size: 0x8b
function gethourtime(var_c7c12df76958c19b) {
    var_30fecbc8f289eab = 3600;
    var_663ed12a0431a739 = 24 * var_30fecbc8f289eab;
    var_e63dd21bf38dc550 = var_663ed12a0431a739 * 365.25;
    var_84a44d77d58a4989 = var_c7c12df76958c19b / int(var_e63dd21bf38dc550);
    var_b88cdd72b1d7d08e = int(var_c7c12df76958c19b % var_e63dd21bf38dc550) / int(var_663ed12a0431a739);
    hours = int(var_c7c12df76958c19b % var_663ed12a0431a739) / int(var_30fecbc8f289eab);
    return int(hours);
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1623
// Size: 0x1a4
function testtiming() {
    now = getsystemtime();
    var_bf86f2c24693e09b = now - 300;
    var_bf81cfc2468d6acb = now - 7200;
    var_c855b34135c24f2b = now - 3480;
    var_f3362e4154f3dec0 = now - 3720;
    var_8ebe16410bb40212 = now - 43200;
    var_88911763074c226b = now - 86400;
    var_58c1838db2a6595a = var_88911763074c226b - 43200;
    var_f36bd4bf83ff5bd = now - 604800;
    var_85e9a613d1c4c14f = hoursawakesincelastupdate(now, var_bf86f2c24693e09b).hours;
    var_ad83e480f7b61231 = hoursawakesincelastupdate(now, var_c855b34135c24f2b).hours;
    var_24edf68034edb3a8 = hoursawakesincelastupdate(now, var_f3362e4154f3dec0).hours;
    var_9c51c091db48ab9f = hoursawakesincelastupdate(now, var_bf81cfc2468d6acb).hours;
    var_9e33fd315e72164a = hoursawakesincelastupdate(now, var_8ebe16410bb40212).hours;
    var_f60fc0867426749e = hoursawakesincelastupdate(now, var_88911763074c226b).hours;
    var_39b990d611d4821f = hoursawakesincelastupdate(now, var_58c1838db2a6595a).hours;
    var_47ccd2ec26d9d794 = hoursawakesincelastupdate(now, var_f36bd4bf83ff5bd).hours;
    winning = 1;
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ce
// Size: 0x843
function printplayerdatastats() {
    /#
        phase = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "unrulyDmg");
        lastupdatetime = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "damage");
        bored = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "ui_pet_watch_bonus_earned_0");
        dirty = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "getTeamData");
        unruly = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "ui_pet_watch_health_unruly");
        hungry = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        bonustimeapplied = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        charged = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        growthtime = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        reproductionstreak = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        damage = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        unicornpoints = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        vampirepoints = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        dragonpoints = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        killstreakcharge = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        wingamescharge = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        objectivescorecharge = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        killscharge = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        topkillstreakcharge = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        nukecharge = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        wingamestop3 = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        plantscharge = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        executionscharge = self getplayerdata("petWatchDataTurbo", self.petwatch.playerdatafield, "<unknown string>");
        println("<unknown string>");
        println("<unknown string>" + self.petwatch.phase);
        println("<unknown string>" + self.petwatch.lastupdatetime);
        println("<unknown string>" + self.petwatch.bored);
        println("<unknown string>" + self.petwatch.dirty);
        println("<unknown string>" + self.petwatch.unruly);
        println("<unknown string>" + self.petwatch.hungry);
        println("<unknown string>" + self.petwatch.bonustimeapplied);
        println("<unknown string>" + self.petwatch.charged);
        println("<unknown string>" + self.petwatch.growthtime);
        println("<unknown string>" + self.petwatch.reproductionstreak);
        println("<unknown string>" + self.petwatch.damage);
        println("<unknown string>" + self.petwatch.unicornpoints);
        println("<unknown string>" + self.petwatch.vampirepoints);
        println("<unknown string>" + self.petwatch.dragonpoints);
        println("<unknown string>" + self.petwatch.killstreakcharge);
        println("<unknown string>" + self.petwatch.wingamescharge);
        println("<unknown string>" + self.petwatch.objectivescorecharge);
        println("<unknown string>" + self.petwatch.killscharge);
        println("<unknown string>" + self.petwatch.topkillstreakcharge);
        println("<unknown string>" + self.petwatch.nukecharge);
        println("<unknown string>" + self.petwatch.wingamestop3);
        println("<unknown string>" + self.petwatch.plantscharge);
        println("<unknown string>" + self.petwatch.executionscharge);
        println("<unknown string>");
        println("<unknown string>" + phase);
        println("<unknown string>" + lastupdatetime);
        println("<unknown string>" + bored);
        println("<unknown string>" + dirty);
        println("<unknown string>" + unruly);
        println("<unknown string>" + hungry);
        println("<unknown string>" + bonustimeapplied);
        println("<unknown string>" + charged);
        println("<unknown string>" + growthtime);
        println("<unknown string>" + reproductionstreak);
        println("<unknown string>" + damage);
        println("<unknown string>" + unicornpoints);
        println("<unknown string>" + vampirepoints);
        println("<unknown string>" + dragonpoints);
        println("<unknown string>" + killstreakcharge);
        println("<unknown string>" + wingamescharge);
        println("<unknown string>" + objectivescorecharge);
        println("<unknown string>" + killscharge);
        println("<unknown string>" + topkillstreakcharge);
        println("<unknown string>" + nukecharge);
        println("<unknown string>" + wingamestop3);
        println("<unknown string>" + plantscharge);
        println("<unknown string>" + executionscharge);
    #/
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2018
// Size: 0x2a8
function testpetdebug(var_f01f2b519b66f760) {
    if (var_f01f2b519b66f760 > 16 && !isdefined(self.petwatch)) {
        initpet(1, "pet_turbo");
    }
    if (!isdefined(self.petwatch)) {
        return;
    }
    switch (var_f01f2b519b66f760) {
    case 1:
        testtiming();
        break;
    case 2:
        printplayerdatastats();
        break;
    case 3:
        addkillcharge();
        break;
    case 4:
        addtenkillcharge();
        break;
    case 5:
        addobjectivescorecharge("debug", 1);
        break;
    case 6:
        addobjectivescorecharge("debug", 10);
        break;
    case 7:
        addwatchchargewin();
        break;
    case 8:
        addplantingcharge();
        break;
    case 9:
        addexecutioncharge();
        break;
    case 10:
        addwatchchargewintop3();
        break;
    case 11:
        addtopkillstreakcharge();
        break;
    case 12:
        addnukecharge();
        break;
    case 13:
        self.petwatch.damage = 0;
        updateuistate();
        break;
    case 14:
        self.petwatch.damage = 900;
        updateuistate();
        break;
    case 15:
        self.petwatch.damage = 500;
        updateuistate();
        break;
    case 16:
        namespace_74465391b3cf76b::addkillstreakcharge();
        break;
    case 17:
        self setclientomnvar("ui_smart_watch_interact", 2);
        break;
    case 18:
        self setclientomnvar("ui_smart_watch_interact", 3);
        break;
    case 19:
        self setclientomnvar("ui_smart_watch_interact", 4);
        break;
    case 20:
        self notify("luinotifyserver", "petwatch_turbo_grow");
        break;
    case 21:
        self notify("luinotifyserver", "petwatch_turbo_grow");
        break;
    case 22:
        self notify("luinotifyserver", "petwatch_turbo_grow");
        break;
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22c7
// Size: 0x74
function hoursawakesincelastupdate(currenttime, lastupdatetime, var_6ba7d3f06e41be2b) {
    var_e01aac667d095892 = gethourtime(currenttime);
    var_50c8acb81baf34af = gethours(currenttime - lastupdatetime);
    var_8a2748d84fa9ae30 = max(0, var_50c8acb81baf34af);
    var_ac7ab45fb1212ba1 = spawnstruct();
    var_ac7ab45fb1212ba1.hours = var_8a2748d84fa9ae30;
    return var_ac7ab45fb1212ba1;
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2343
// Size: 0x13
function updatepetstatesincelastupdate(var_6ba7d3f06e41be2b) {
    self endon("disconnect");
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x235e
// Size: 0x66
function addthrowingknifecharge() {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype == "pet_turbo") {
        self.petwatch.wingamescharge++;
        self setclientomnvar("ui_pet_watch_bonus_earned_0", 80000 + self.petwatch.wingamescharge);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23cb
// Size: 0x78
function addkillstreakcharge() {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype == "pet_turbo") {
        self.petwatch.bonuskillstreakcharge++;
        self.petwatch.killstreakcharge++;
        self setclientomnvar("ui_pet_watch_bonus_earned_1", 30000 + self.petwatch.killstreakcharge);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244a
// Size: 0x3c
function addallkillstreaksunlockedinonelife() {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype == "pet_turbo") {
        self setclientomnvar("ui_pet_watch_bonus_earned_2", 20000);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x248d
// Size: 0x64
function addteabagcharge() {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype == "pet_turbo") {
        self.petwatch.plantscharge++;
        self setclientomnvar("ui_pet_watch_bonus_earned_0", 40000 + self.petwatch.plantscharge);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24f8
// Size: 0x3c
function addplundercarrycredit() {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype == "pet_turbo") {
        self setclientomnvar("ui_pet_watch_bonus_earned_0", 40000);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x253b
// Size: 0x64
function addjuggernautcharge() {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype == "pet_turbo") {
        self.petwatch.nukecharge++;
        self setclientomnvar("ui_pet_watch_bonus_earned_4", 10000 + self.petwatch.nukecharge);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a6
// Size: 0x66
function addvehicularmanslaughtercharge() {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype == "pet_turbo") {
        self.petwatch.wingamestop3++;
        self setclientomnvar("ui_pet_watch_bonus_earned_1", 90000 + self.petwatch.wingamestop3);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2613
// Size: 0x8f
function addtop3brcharge() {
    subtype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    if (namespace_36f464722d326bbe::isBRStyleGameType() && (subtype == "br" || subtype == "aladdin" || subtype == "jugg" || subtype == "mini" || subtype == "mini_mgl")) {
        if (isdefined(self.petwatch) && self.petwatch.petwatchtype == "pet_turbo") {
            self setclientomnvar("ui_pet_watch_bonus_earned_1", 90000);
        }
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26a9
// Size: 0x3e
function addwatch2v2topscore() {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype == "pet_turbo") {
        self setclientomnvar("ui_pet_watch_bonus_earned_0", 80000);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26ee
// Size: 0x143
function update2v2progress() {
    if (!namespace_3c37cb17ade254d::issharedfuncdefined("game", "getTeamData")) {
        return;
    }
    roundsplayed = game["roundsPlayed"];
    foreach (entry in level.teamnamelist) {
        var_41095fce198f513b = game["roundsWon"][entry];
        ratio = var_41095fce198f513b / level.winlimit;
        players = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "getTeamData") ]](entry, "players");
        foreach (player in players) {
            if (isdefined(player.petwatch) && player.petwatch.petwatchtype == "pet_turbo") {
                player tryupdategenericprogress(ratio, 2);
            }
        }
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2838
// Size: 0x69
function tryupdategenericprogress(progress, code) {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype == "pet_turbo") {
        progress = min(1, progress);
        self setclientomnvar("ui_pet_watch_bonus_earned_4", 50000 + int(progress * 10) + code * 100);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28a8
// Size: 0x125
function trackcarpunches(car) {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype == "pet_turbo") {
        if (!isdefined(car.carpunchers)) {
            car.carpunchers = [];
            car.carpunchcount = [];
        }
        var_4c98940b9e06b7f8 = -1;
        foreach (i, var_1138c1029fecae7c in car.carpunchers) {
            if (var_1138c1029fecae7c == self) {
                var_4c98940b9e06b7f8 = i;
                break;
            }
        }
        if (var_4c98940b9e06b7f8 == -1) {
            var_4c98940b9e06b7f8 = car.carpunchers.size;
            car.carpunchers[var_4c98940b9e06b7f8] = self;
            car.carpunchcount[var_4c98940b9e06b7f8] = 1;
        } else {
            car.carpunchcount[var_4c98940b9e06b7f8]++;
        }
        tryupdategenericprogress(car.carpunchcount[var_4c98940b9e06b7f8] / 10, 3);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29d4
// Size: 0xc9
function checkcarpuncherprogressgeneric() {
    if (isdefined(self.carpunchers)) {
        var_bb67f9136f0dd9fe = 0;
        foreach (i, var_1138c1029fecae7c in self.carpunchers) {
            var_1e47e3db30463930 = isdefined(var_1138c1029fecae7c.petwatch) && var_1138c1029fecae7c.petwatch.petwatchtype == "pet_turbo";
            if (!var_1e47e3db30463930) {
                continue;
            }
            var_bb67f9136f0dd9fe = self.carpunchcount[i];
            if (var_bb67f9136f0dd9fe >= 10) {
                var_1138c1029fecae7c setclientomnvar("ui_pet_watch_bonus_earned_1", 10000);
            }
        }
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aa4
// Size: 0xce
function checkcarpuncherprogress(car) {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype == "pet_turbo") {
        if (isdefined(car.carpunchers)) {
            var_bb67f9136f0dd9fe = 0;
            foreach (i, var_1138c1029fecae7c in car.carpunchers) {
                if (var_1138c1029fecae7c == self) {
                    var_bb67f9136f0dd9fe = car.carpunchcount[i];
                    break;
                }
            }
            if (var_bb67f9136f0dd9fe >= 10) {
                self setclientomnvar("ui_pet_watch_bonus_earned_1", 10000);
            }
        }
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b79
// Size: 0x75
function addnukecharge() {
    if (isdefined(self.petwatch)) {
        self.petwatch.nukecharge++;
        code = 10000 + self.petwatch.nukecharge;
        if (self.petwatch.petwatchtype == "pet_turbo") {
            code = code + 100;
        }
        self setclientomnvar("ui_pet_watch_bonus_earned_4", code);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bf5
// Size: 0x47
function addtopkillstreakcharge() {
    if (isdefined(self.petwatch)) {
        self.petwatch.topkillstreakcharge++;
        self setclientomnvar("ui_pet_watch_bonus_earned_2", 20000 + self.petwatch.topkillstreakcharge);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c43
// Size: 0x1f
function addallkillstreaksunlocked() {
    if (isdefined(self.petwatch)) {
        self setclientomnvar("ui_pet_watch_bonus_earned_2", 20001);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c69
// Size: 0x64
function addplantingcharge() {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype != "pet_turbo") {
        self.petwatch.plantscharge++;
        self setclientomnvar("ui_pet_watch_bonus_earned_0", 40000 + self.petwatch.plantscharge);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd4
// Size: 0xff
function addobjectivescorecharge(event, originalpoints, var_7ec7671a1e0c788f) {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype != "pet_turbo") {
        if (istrue(level.petobjectivefilter[event])) {
            return;
        }
        if (event == #"kill") {
            return;
        }
        if (isdefined(var_7ec7671a1e0c788f)) {
            if (istrue(var_7ec7671a1e0c788f.var_e62ceeee8b598809)) {
                return;
            }
            if (istrue(var_7ec7671a1e0c788f.var_e0badec2b1517ca3)) {
                return;
            }
        }
        self.petwatch.bonusobjectivescorecharge = self.petwatch.bonusobjectivescorecharge + originalpoints;
        self.petwatch.objectivescorecharge = self.petwatch.objectivescorecharge + originalpoints;
        self setclientomnvar("ui_pet_watch_bonus_earned_3", 50000 + self.petwatch.objectivescorecharge);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dda
// Size: 0x87
function addtenkillcharge() {
    if (isdefined(self.petwatch)) {
        self.petwatch.killscharge = self.petwatch.killscharge + 10;
        self.petwatch.bonuskillscharge = self.petwatch.bonuskillscharge + 10;
        self setclientomnvar("ui_pet_watch_bonus_earned_0", 60000 + self.petwatch.killscharge);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e68
// Size: 0x5b
function addkillcharge() {
    if (isdefined(self.petwatch)) {
        self.petwatch.killscharge++;
        self.petwatch.bonuskillscharge++;
        self setclientomnvar("ui_pet_watch_bonus_earned_0", 60000 + self.petwatch.killscharge);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eca
// Size: 0x49
function addexecutioncharge() {
    if (isdefined(self.petwatch)) {
        self.petwatch.executionscharge++;
        self setclientomnvar("ui_pet_watch_bonus_earned_1", 70000 + self.petwatch.executionscharge);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f1a
// Size: 0x81
function addwatchchargewin() {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype != "pet_turbo") {
        self.petwatch.bonuswingamescharge++;
        self.petwatch.wingamescharge++;
        self setclientomnvar("ui_pet_watch_bonus_earned_0", 80000 + self.petwatch.wingamescharge);
        feedaction();
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fa2
// Size: 0x66
function addwatchchargewintop3() {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype != "pet_turbo") {
        self.petwatch.wingamestop3++;
        self setclientomnvar("ui_pet_watch_bonus_earned_1", 90000 + self.petwatch.wingamestop3);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x300f
// Size: 0x76
function petplundertimer() {
    self endon("disconnect");
    self endon("cancel_pet_plunder_timer");
    self.petwatch.plundertimer = 1;
    totaltime = 180;
    var_ab255606fab17dbc = totaltime / 5;
    for (i = 1; i <= 5; i++) {
        wait(var_ab255606fab17dbc);
        tryupdategenericprogress(i / 5, 4);
    }
    addplundercarrycredit();
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308c
// Size: 0x40
function updatenukeprogress(progress) {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype == "pet_turbo") {
        tryupdategenericprogress(progress, 1);
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30d3
// Size: 0x9a
function onplayergetsplunder() {
    if (isdefined(self.petwatch) && self.petwatch.petwatchtype == "pet_turbo") {
        if (self.plundercount > 5000) {
            if (!isdefined(self.petwatch.plundertimer)) {
                thread petplundertimer();
            }
        } else if (isdefined(self.petwatch.plundertimer)) {
            self notify("cancel_pet_plunder_timer");
            self.petwatch.plundertimer = undefined;
            tryupdategenericprogress(0, 0);
        }
    }
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3174
// Size: 0x32
function setphase(phase) {
    self.petwatch.phase = phase;
    self.pers["petWatchData_phase"] = phase;
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31ad
// Size: 0x129
function updateuistate() {
    bitfield = 0;
    if (self.petwatch.bored < 0) {
        bitfield = bitfield + 20;
    }
    if (self.petwatch.dirty < 0) {
        bitfield = bitfield + 100;
    }
    if (self.petwatch.unruly < 0) {
        bitfield = bitfield + 1000;
    }
    if (self.petwatch.hungry < 0) {
        bitfield = bitfield + 10000;
    }
    var_d6b7105506475db1 = int(self.petwatch.damage / 100) - 1;
    var_d6b7105506475db1 = int(max(0, min(var_d6b7105506475db1, 9)));
    bitfield = bitfield + 100000 * var_d6b7105506475db1;
    state = bitfield + self.petwatch.phase;
    /#
        println("<unknown string>" + bitfield + "<unknown string>" + self.petwatch.phase);
    #/
    self setclientomnvar("ui_pet_watch_state", state);
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32dd
// Size: 0x2fc
function resetpetstats() {
    self.petwatch.bored = level.petconsts[self.petwatch.phase].boredstart;
    self.petwatch.dirty = level.petconsts[self.petwatch.phase].dirtystart;
    self.petwatch.unruly = level.petconsts[self.petwatch.phase].unrulystart;
    self.petwatch.hungry = level.petconsts[self.petwatch.phase].hungrystart;
    self.petwatch.lasthungryscore = 0;
    self.petwatch.lastboredscore = 0;
    self.petwatch.lastunrulyscore = 0;
    self.petwatch.lastdirtyscore = 0;
    self.petwatch.charged = 0;
    self.petwatch.growthtime = 0;
    self.petwatch.bonustimeapplied = 0;
    self.petwatch.bonustime = 0;
    self.petwatch.damage = 0;
    self.petwatch.unicornpoints = 0;
    self.petwatch.vampirepoints = 0;
    self.petwatch.dragonpoints = 0;
    self.petwatch.bonuskillstreakcharge = 0;
    self.petwatch.killstreakcharge = 0;
    self.petwatch.bonuswingamescharge = 0;
    self.petwatch.wingamescharge = 0;
    self.petwatch.bonusobjectivescorecharge = 0;
    self.petwatch.objectivescorecharge = 0;
    self.petwatch.bonuskillscharge = 0;
    self.petwatch.killscharge = 0;
    self.petwatch.topkillstreakcharge = 0;
    self.petwatch.nukecharge = 0;
    self.petwatch.wingamestop3 = 0;
    self.petwatch.plantscharge = 0;
    self.petwatch.executionscharge = 0;
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35e0
// Size: 0x4d
function resetpet(var_801259433dadb5e0, var_d4c366276174ef4c) {
    if (isdefined(var_d4c366276174ef4c)) {
        setphase(var_d4c366276174ef4c);
    } else {
        setphase(1);
    }
    self.petwatch.lastupdatetime = getsystemtime();
    resetpetstats();
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3634
// Size: 0x19
function debugsetlasttime(hours) {
    self setclientomnvar("ui_pet_watch_action", hours);
}

// Namespace namespace_883b0db1d686c37e/namespace_74465391b3cf76b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3654
// Size: 0x46c
function feedaction() {
    if (!isdefined(self.petwatch)) {
        return;
    }
    if (self.petwatch.petwatchtype == "pet_turbo") {
        return;
    }
    if (self.petwatch.phase == 15) {
        return;
    }
    var_68f4532ae38c7889 = self.petwatch.killstreakcharge * 20;
    var_b3047d81080c48b3 = self.petwatch.wingamescharge * 20;
    var_10da2b565b61ab1e = self.petwatch.objectivescorecharge * 0.5;
    var_cc874f65d38801b2 = self.petwatch.killscharge * 1;
    var_e4de697fecf32054 = self.petwatch.lasthungryscore < var_cc874f65d38801b2;
    var_8dbc9f460c6fc36d = self.petwatch.lastdirtyscore < var_b3047d81080c48b3;
    var_9635660a6eb2d37f = self.petwatch.lastboredscore < var_68f4532ae38c7889;
    var_b2f5debac3f6ee00 = self.petwatch.lastunrulyscore < var_10da2b565b61ab1e;
    /#
        println("<unknown string>" + var_68f4532ae38c7889 + "<unknown string>" + var_b3047d81080c48b3 + "<unknown string>" + var_10da2b565b61ab1e + "<unknown string>" + var_cc874f65d38801b2);
    #/
    if (!var_e4de697fecf32054 && !var_8dbc9f460c6fc36d && !var_9635660a6eb2d37f && !var_b2f5debac3f6ee00) {
        return;
    }
    /#
        println("<unknown string>" + self.petwatch.bored + "<unknown string>" + self.petwatch.dirty + "<unknown string>" + self.petwatch.unruly + "<unknown string>" + self.petwatch.hungry);
    #/
    var_68f4532ae38c7889 = max(-240, min(var_68f4532ae38c7889, 240));
    var_b3047d81080c48b3 = max(-240, min(var_b3047d81080c48b3, 240));
    var_10da2b565b61ab1e = max(-240, min(var_10da2b565b61ab1e, 240));
    var_cc874f65d38801b2 = max(-240, min(var_cc874f65d38801b2, 240));
    if (var_8dbc9f460c6fc36d) {
        var_b3047d81080c48b3 = int(var_b3047d81080c48b3);
        if (var_b3047d81080c48b3 == 0) {
            var_b3047d81080c48b3 = 1;
        }
        self setclientomnvar("ui_pet_watch_health_dirty", var_b3047d81080c48b3);
    }
    if (var_b2f5debac3f6ee00) {
        var_10da2b565b61ab1e = int(var_10da2b565b61ab1e);
        if (var_10da2b565b61ab1e == 0) {
            var_10da2b565b61ab1e = 1;
        }
        self setclientomnvar("ui_pet_watch_health_unruly", int(var_10da2b565b61ab1e));
    }
    if (var_e4de697fecf32054) {
        var_cc874f65d38801b2 = int(var_cc874f65d38801b2);
        if (var_cc874f65d38801b2 == 0) {
            var_cc874f65d38801b2 = 1;
        }
        self setclientomnvar("ui_pet_watch_health_hungry", int(var_cc874f65d38801b2));
    }
    if (var_9635660a6eb2d37f) {
        var_68f4532ae38c7889 = int(var_68f4532ae38c7889);
        if (var_68f4532ae38c7889 == 0) {
            var_68f4532ae38c7889 = 1;
        }
        self setclientomnvar("ui_pet_watch_health_bored", int(var_68f4532ae38c7889));
    }
    self.petwatch.lasthungryscore = var_cc874f65d38801b2;
    self.petwatch.lastdirtyscore = var_b3047d81080c48b3;
    self.petwatch.lastboredscore = var_68f4532ae38c7889;
    self.petwatch.lastunrulyscore = var_10da2b565b61ab1e;
    self.petwatch.topkillstreakcharge = 0;
    self.petwatch.nukecharge = 0;
    self.petwatch.wingamestop3 = 0;
    self.petwatch.plantscharge = 0;
    self.petwatch.executionscharge = 0;
    self.petwatch.bored = var_68f4532ae38c7889;
    self.petwatch.dirty = var_b3047d81080c48b3;
    self.petwatch.unruly = var_10da2b565b61ab1e;
    self.petwatch.hungry = var_cc874f65d38801b2;
    /#
        println("<unknown string>" + self.petwatch.bored + "<unknown string>" + self.petwatch.dirty + "<unknown string>" + self.petwatch.unruly + "<unknown string>" + self.petwatch.hungry);
    #/
}

