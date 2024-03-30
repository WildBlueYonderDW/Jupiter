// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace awards;

// Namespace awards / scripts/mp/awards
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26d
// Size: 0x28
function init() {
    initawards();
    scripts/mp/utility/spawn_event_aggregator::registeronplayerspawncallback(&onplayerspawned);
    level thread onplayerconnect();
    level thread saveaarawardsonroundswitch();
}

// Namespace awards / scripts/mp/awards
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c
// Size: 0x34
function onplayerconnect() {
    while (true) {
        player = level waittill("connected");
        player thread initaarawardlist();
        player.awardqueue = [];
    }
}

// Namespace awards / scripts/mp/awards
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d7
// Size: 0xd
function onplayerspawned() {
    self.awardsthislife = [];
}

// Namespace awards / scripts/mp/awards
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb
// Size: 0xa
function initawards() {
    initmidmatchawards();
}

// Namespace awards / scripts/mp/awards
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fc
// Size: 0x65
function function_6df0786b01ec7028(ref) {
    /#
        assert(isdefined(ref));
    #/
    aarpriority = tablelookup("mp/awardtable.csv", 0, ref, 1);
    if (isdefined(aarpriority) && aarpriority > 0) {
        randomvalue = randomfloat(1);
        level.var_6d808d6c553c2d9a[ref] = float(aarpriority) + randomvalue;
    }
}

// Namespace awards / scripts/mp/awards
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x368
// Size: 0x14
function initmidmatchaward(ref) {
    function_6df0786b01ec7028(ref);
}

// Namespace awards / scripts/mp/awards
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x383
// Size: 0x6a
function initmidmatchawards() {
    for (row = 0; true; row++) {
        ref = tablelookupbyrow("mp/awardtable.csv", row, 0);
        if (!isdefined(ref) || ref == "") {
            break;
        }
        if (!function_d03495fe6418377b(ref)) {
            /#
                assertex(1, ref);
            #/
            ref = function_1823ff50bb28148d(ref);
        }
        initmidmatchaward(ref);
    }
}

// Namespace awards / scripts/mp/awards
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f4
// Size: 0x3e
function incplayerrecord(ref) {
    recordvalue = self getplayerdata("common", "awards", ref);
    self setplayerdata("common", "awards", ref, recordvalue + 1);
}

// Namespace awards / scripts/mp/awards
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x439
// Size: 0x17d
function giveaward(ref, objweapon, pointsoverride, xpoverride, immediate, victim, cankillchain, streakinfo, var_ad8c6c5cc50af10b, eventinfo) {
    if (!istrue(immediate)) {
        self endon("disconnect");
        waitframe();
        waittillslowprocessallowed();
    }
    if (!scripts/mp/rank::function_34294184e90b96c(ref)) {
        /#
            assertmsg("giveAward() called on "" + ref + "" which is not marked as an award in the current score event list. IsAward should be checked.");
        #/
        return;
    }
    if (isenumvaluevalid(level.var_5d69837cf4db0407, "Awards", function_f28fd66285fa2c9(ref))) {
        addawardtoaarlist(ref);
    }
    xp = xpoverride;
    if (!isdefined(xp)) {
        xp = scripts/mp/rank::getscoreinfoxp(ref);
    }
    if (isdefined(xp) && xp > 0) {
        scripts/mp/rank::giverankxp(ref, xp, objweapon, undefined, immediate, undefined, undefined, eventinfo);
    }
    if (!isdefined(pointsoverride)) {
        points = scripts/mp/rank::getscoreinfovalue(ref);
        pointsoverride = default_to(points, 0);
    }
    if (pointsoverride > 0) {
        giveunifiedpoints(ref, objweapon, pointsoverride, -1, victim, cankillchain, streakinfo, undefined, eventinfo);
    }
    bufferednotify("earned_award_buffered", ref);
    if (isdefined(self.awardsthislife[ref])) {
        self.awardsthislife[ref]++;
    } else {
        self.awardsthislife[ref] = 1;
    }
    utility::trycall(level.matchdata_logaward, ref);
    /#
    #/
}

// Namespace awards / scripts/mp/awards
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bd
// Size: 0x12d
function queuemidmatchaward(ref, objweapon, pointsoverride, xpoverride, var_51bdae03b05bc75e, dontwait, victim, cankillchain, streakinfo, var_ad8c6c5cc50af10b, eventinfo) {
    awardinfo = spawnstruct();
    awardinfo.ref = [ref, gettime()];
    awardinfo.objweapon = objweapon;
    awardinfo.pointsoverride = pointsoverride;
    awardinfo.xpoverride = xpoverride;
    awardinfo.var_51bdae03b05bc75e = var_51bdae03b05bc75e;
    awardinfo.dontwait = dontwait;
    awardinfo.victim = victim;
    awardinfo.cankillchain = cankillchain;
    awardinfo.streakinfo = streakinfo;
    awardinfo.var_ad8c6c5cc50af10b = var_ad8c6c5cc50af10b;
    awardinfo.eventinfo = eventinfo;
    self.awardqueue[self.awardqueue.size] = awardinfo;
    thread flushmidmatchawardqueuewhenable();
}

// Namespace awards / scripts/mp/awards
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f1
// Size: 0xef
function flushmidmatchawardqueue() {
    /#
        assertex(!shouldqueuemidmatchaward(), "Attempting to flush award queue when the awards can't be dispalyed");
    #/
    foreach (award in self.awardqueue) {
        givemidmatchaward(award.ref, award.objweapon, award.pointsoverride, award.xpoverride, award.var_51bdae03b05bc75e, award.dontwait, award.victim, award.cankillchain, award.streakinfo, award.var_ad8c6c5cc50af10b, award.eventinfo);
    }
    self.awardqueue = [];
}

// Namespace awards / scripts/mp/awards
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e7
// Size: 0x36
function flushmidmatchawardqueuewhenable() {
    self endon("disconnect");
    self notify("flushMidMatchAwardQueueWhenAble()");
    self endon("flushMidMatchAwardQueueWhenAble()");
    while (true) {
        if (!shouldqueuemidmatchaward()) {
            break;
        }
        waitframe();
    }
    thread flushmidmatchawardqueue();
}

// Namespace awards / scripts/mp/awards
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x824
// Size: 0xb2
function shouldqueuemidmatchaward(var_3cda0e0b6a2d1f97) {
    if (level.gameended) {
        return false;
    }
    /#
        if (getdvarint(@"hash_9779e069cc4f5bc8", 0) > 0) {
            level.var_6d05adacfaa6fbb2 = getdvarint(@"hash_9779e069cc4f5bc8", 0);
            setdvar(@"hash_9779e069cc4f5bc8", 0);
        }
        if (isdefined(level.var_6d05adacfaa6fbb2)) {
            if (level.var_6d05adacfaa6fbb2 > 0) {
                level.var_6d05adacfaa6fbb2--;
                return true;
            }
            level.var_6d05adacfaa6fbb2 = undefined;
        }
    #/
    if (!isreallyalive(self)) {
        if (!istrue(var_3cda0e0b6a2d1f97) || isinkillcam()) {
            if (!isusingremote()) {
                return true;
            }
        }
    }
    return false;
}

// Namespace awards / scripts/mp/awards
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8de
// Size: 0x167
function givemidmatchaward(ref, objweapon, pointsoverride, xpoverride, var_51bdae03b05bc75e, dontwait, victim, cankillchain, streakinfo, var_ad8c6c5cc50af10b, eventinfo) {
    if (!isplayer(self)) {
        return;
    }
    if (isai(self)) {
        return;
    }
    if (istrue(level.gameended)) {
        isvalidevent = 0;
        if (isarray(ref)) {
            if (isnumber(level.gameendtime)) {
                if (ref[1] <= level.gameendtime) {
                    isvalidevent = 1;
                    ref = ref[0];
                }
            }
        } else if (isdefined(ref)) {
            isvalidevent = 1;
        }
        if (!isvalidevent) {
            return;
        }
    } else if (isarray(ref)) {
        ref = ref[0];
    }
    if (!function_d03495fe6418377b(ref)) {
        /#
            assertex(1, ref);
        #/
        ref = function_1823ff50bb28148d(ref);
    }
    if (self ispcplayer() && scripts/mp/flags::gameflag("prematch_done")) {
        createnvidiavideo(ref);
    }
    if (shouldqueuemidmatchaward(var_51bdae03b05bc75e)) {
        queuemidmatchaward(ref, objweapon, pointsoverride, xpoverride, var_51bdae03b05bc75e, dontwait, victim, cankillchain, streakinfo, var_ad8c6c5cc50af10b, eventinfo);
        return;
    }
    scripts/mp/analyticslog::logevent_awardgained(ref);
    thread giveaward(ref, objweapon, pointsoverride, xpoverride, dontwait, victim, cankillchain, streakinfo, var_ad8c6c5cc50af10b, eventinfo);
}

// Namespace awards / scripts/mp/awards
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4c
// Size: 0x1d6
function createnvidiavideo(ref) {
    var_7861cc7f1384834e = undefined;
    if (ref == #"four") {
        var_7861cc7f1384834e = 9;
    } else if (ref == #"hash_8368a43e439d8a67") {
        var_7861cc7f1384834e = 7;
    } else if (ref == #"grenade_double") {
        var_7861cc7f1384834e = 12;
    } else if (ref == #"explosive_stick") {
        var_7861cc7f1384834e = 13;
    } else if (ref == #"item_impact") {
        var_7861cc7f1384834e = 8;
    }
    if (!isdefined(var_7861cc7f1384834e)) {
        if (scripts/cp_mp/utility/game_utility::isbrstylegametype()) {
            if (ref == #"double") {
                var_7861cc7f1384834e = 17;
            } else if (ref == #"triple") {
                var_7861cc7f1384834e = 18;
            } else if (ref == #"longshot") {
                var_7861cc7f1384834e = 19;
            } else if (ref == #"revenge") {
                var_7861cc7f1384834e = 20;
            } else if (ref == #"backstab") {
                var_7861cc7f1384834e = 21;
            } else if (ref == #"throwingknife_kill") {
                var_7861cc7f1384834e = 22;
            }
        } else if (ref == #"five") {
            var_7861cc7f1384834e = 1;
        } else if (ref == #"seven") {
            var_7861cc7f1384834e = 2;
        } else if (ref == #"eight") {
            var_7861cc7f1384834e = 3;
        } else if (ref == #"streak_10") {
            var_7861cc7f1384834e = 4;
        } else if (ref == #"streak_20") {
            var_7861cc7f1384834e = 5;
        } else if (ref == #"streak_30") {
            var_7861cc7f1384834e = 6;
        } else if (ref == #"six") {
            var_7861cc7f1384834e = 10;
        } else if (ref == #"multi") {
            var_7861cc7f1384834e = 11;
        } else if (ref == #"hash_fe6243d280c9e5cf") {
            var_7861cc7f1384834e = 14;
        }
    }
    if (isdefined(var_7861cc7f1384834e)) {
        self setclientomnvar("nVidiaHighlights_events", var_7861cc7f1384834e);
    }
}

// Namespace awards / scripts/mp/awards
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc29
// Size: 0x33f
function addawardtoaarlist(ref) {
    if (!isdefined(self.aarawards)) {
        self.aarawards = [];
        self.aarawardcount = 0;
        for (awardindex = 0; awardindex < 10; awardindex++) {
            struct = spawnstruct();
            self.aarawards[awardindex] = struct;
            struct.ref = "none";
            struct.count = 0;
        }
    }
    foreach (awardindex, awardinfo in self.aarawards) {
        if (awardinfo.ref == ref) {
            awardinfo.count++;
            self setplayerdata("common", "round", "awards", awardindex, "value", awardinfo.count);
            return;
        }
    }
    newpriority = default_to(level.var_6d808d6c553c2d9a[ref], 0);
    for (insertindex = 0; insertindex < self.aarawards.size; insertindex++) {
        awardinfo = self.aarawards[insertindex];
        if (awardinfo.ref == "none") {
            break;
        }
        otherpriority = default_to(level.var_6d808d6c553c2d9a[awardinfo.ref], 0);
        if (newpriority > otherpriority) {
            break;
        }
    }
    if (insertindex >= self.aarawards.size) {
        return;
    }
    for (listindex = self.aarawards.size - 2; listindex >= insertindex; listindex--) {
        newindex = listindex + 1;
        self.aarawards[newindex] = self.aarawards[listindex];
        awardinfo = self.aarawards[newindex];
        if (awardinfo.ref != "none") {
            self setplayerdata("common", "round", "awards", newindex, "award", function_f28fd66285fa2c9(awardinfo.ref));
            self setplayerdata("common", "round", "awards", newindex, "value", awardinfo.count);
        }
    }
    awardinfo = spawnstruct();
    self.aarawards[insertindex] = awardinfo;
    awardinfo.ref = ref;
    awardinfo.count = 1;
    self setplayerdata("common", "round", "awards", insertindex, "award", function_f28fd66285fa2c9(awardinfo.ref));
    self setplayerdata("common", "round", "awards", insertindex, "value", awardinfo.count);
    if (self.aarawardcount < 10) {
        self.aarawardcount++;
        self setplayerdata("common", "round", "awardCount", self.aarawardcount);
    }
    if (istrue(self.savedaarawards)) {
        saveaarawards();
    }
}

// Namespace awards / scripts/mp/awards
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6f
// Size: 0xaf
function initaarawardlist() {
    self.aarawards = self.pers["aarAwards"];
    self.aarawardcount = self.pers["aarAwardCount"];
    if (isdefined(self.aarawards)) {
        return;
    }
    self setplayerdata("common", "round", "awardCount", 0);
    for (awardindex = 0; awardindex < 10; awardindex++) {
        self setplayerdata("common", "round", "awards", awardindex, "award", "none");
        self setplayerdata("common", "round", "awards", awardindex, "value", 0);
    }
}

// Namespace awards / scripts/mp/awards
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1025
// Size: 0x6f
function saveaarawardsonroundswitch() {
    level waittill("game_ended");
    foreach (player in level.players) {
        if (isdefined(player) && !isbot(player)) {
            player saveaarawards();
        }
    }
}

// Namespace awards / scripts/mp/awards
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109b
// Size: 0x40
function saveaarawards() {
    self.pers["aarAwards"] = self.aarawards;
    self.pers["aarAwardCount"] = self.aarawardcount;
    self.savedaarawards = 1;
}

// Namespace awards / scripts/mp/awards
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10e2
// Size: 0xe9
function function_c346fd8caa61c2ed() {
    /#
        for (awardindex = 0; awardindex < self.aarawards.size; awardindex++) {
            awardinfo = self.aarawards[awardindex];
            pdref = self getplayerdata("<unknown string>", "<unknown string>", "<unknown string>", awardindex, "<unknown string>");
            pdcount = self getplayerdata("<unknown string>", "<unknown string>", "<unknown string>", awardindex, "<unknown string>");
            /#
                assert(awardinfo.ref == pdref);
            #/
            /#
                assert(awardinfo.count == pdcount);
            #/
            println("<unknown string>" + awardindex + 1 + "<unknown string>" + awardinfo.ref + "<unknown string>" + awardinfo.count);
        }
    #/
}

