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

// Namespace awards/namespace_46006c5769c2ac90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26d
// Size: 0x28
function init() {
    initawards();
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawned);
    level thread onplayerconnect();
    level thread saveaarawardsonroundswitch();
}

// Namespace awards/namespace_46006c5769c2ac90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c
// Size: 0x34
function onplayerconnect() {
    while (1) {
        player = level waittill("connected");
        player thread initaarawardlist();
        player.awardqueue = [];
    }
}

// Namespace awards/namespace_46006c5769c2ac90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d7
// Size: 0xd
function onplayerspawned() {
    self.awardsthislife = [];
}

// Namespace awards/namespace_46006c5769c2ac90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb
// Size: 0xa
function initawards() {
    initmidmatchawards();
}

// Namespace awards/namespace_46006c5769c2ac90
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fc
// Size: 0x65
function function_6df0786b01ec7028(ref) {
    /#
        assert(isdefined(ref));
    #/
    aarpriority = tablelookup("mp/awardtable.csv", 0, ref, 1);
    if (isdefined(aarpriority) && aarpriority > 0) {
        var_908ffeb2459e73af = randomfloat(1);
        level.var_6d808d6c553c2d9a[ref] = float(aarpriority) + var_908ffeb2459e73af;
    }
}

// Namespace awards/namespace_46006c5769c2ac90
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x368
// Size: 0x14
function initmidmatchaward(ref) {
    function_6df0786b01ec7028(ref);
}

// Namespace awards/namespace_46006c5769c2ac90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x383
// Size: 0x6a
function initmidmatchawards() {
    for (row = 0; 1; row++) {
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

// Namespace awards/namespace_46006c5769c2ac90
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f4
// Size: 0x3e
function incplayerrecord(ref) {
    var_f313905dff43d261 = self getplayerdata("common", "awards", ref);
    self setplayerdata("common", "awards", ref, var_f313905dff43d261 + 1);
}

// Namespace awards/namespace_46006c5769c2ac90
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x439
// Size: 0x17d
function giveaward(ref, objweapon, var_91185ff4a2e16a72, var_4b5a99c16abfdfb1, immediate, victim, cankillchain, streakinfo, var_ad8c6c5cc50af10b, var_7ec7671a1e0c788f) {
    if (!istrue(immediate)) {
        self endon("disconnect");
        waitframe();
        waittillslowprocessallowed();
    }
    if (!namespace_62c556437da28f50::function_34294184e90b96c(ref)) {
        /#
            assertmsg("giveAward() called on "" + ref + "" which is not marked as an award in the current score event list. IsAward should be checked.");
        #/
        return;
    }
    if (isenumvaluevalid(level.var_5d69837cf4db0407, "Awards", function_f28fd66285fa2c9(ref))) {
        addawardtoaarlist(ref);
    }
    xp = var_4b5a99c16abfdfb1;
    if (!isdefined(xp)) {
        xp = namespace_62c556437da28f50::getscoreinfoxp(ref);
    }
    if (isdefined(xp) && xp > 0) {
        namespace_62c556437da28f50::giverankxp(ref, xp, objweapon, undefined, immediate, undefined, undefined, var_7ec7671a1e0c788f);
    }
    if (!isdefined(var_91185ff4a2e16a72)) {
        points = namespace_62c556437da28f50::getscoreinfovalue(ref);
        var_91185ff4a2e16a72 = function_53c4c53197386572(points, 0);
    }
    if (var_91185ff4a2e16a72 > 0) {
        giveunifiedpoints(ref, objweapon, var_91185ff4a2e16a72, -1, victim, cankillchain, streakinfo, undefined, var_7ec7671a1e0c788f);
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

// Namespace awards/namespace_46006c5769c2ac90
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bd
// Size: 0x12d
function queuemidmatchaward(ref, objweapon, var_91185ff4a2e16a72, var_4b5a99c16abfdfb1, var_51bdae03b05bc75e, var_30e33d4e4669117f, victim, cankillchain, streakinfo, var_ad8c6c5cc50af10b, var_7ec7671a1e0c788f) {
    var_6dfac1dd9d7ffae2 = spawnstruct();
    var_6dfac1dd9d7ffae2.ref = [0:ref, 1:gettime()];
    var_6dfac1dd9d7ffae2.objweapon = objweapon;
    var_6dfac1dd9d7ffae2.var_91185ff4a2e16a72 = var_91185ff4a2e16a72;
    var_6dfac1dd9d7ffae2.var_4b5a99c16abfdfb1 = var_4b5a99c16abfdfb1;
    var_6dfac1dd9d7ffae2.var_51bdae03b05bc75e = var_51bdae03b05bc75e;
    var_6dfac1dd9d7ffae2.var_30e33d4e4669117f = var_30e33d4e4669117f;
    var_6dfac1dd9d7ffae2.victim = victim;
    var_6dfac1dd9d7ffae2.cankillchain = cankillchain;
    var_6dfac1dd9d7ffae2.streakinfo = streakinfo;
    var_6dfac1dd9d7ffae2.var_ad8c6c5cc50af10b = var_ad8c6c5cc50af10b;
    var_6dfac1dd9d7ffae2.var_7ec7671a1e0c788f = var_7ec7671a1e0c788f;
    self.awardqueue[self.awardqueue.size] = var_6dfac1dd9d7ffae2;
    thread flushmidmatchawardqueuewhenable();
}

// Namespace awards/namespace_46006c5769c2ac90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f1
// Size: 0xef
function flushmidmatchawardqueue() {
    /#
        assertex(!shouldqueuemidmatchaward(), "Attempting to flush award queue when the awards can't be dispalyed");
    #/
    foreach (award in self.awardqueue) {
        givemidmatchaward(award.ref, award.objweapon, award.var_91185ff4a2e16a72, award.var_4b5a99c16abfdfb1, award.var_51bdae03b05bc75e, award.var_30e33d4e4669117f, award.victim, award.cankillchain, award.streakinfo, award.var_ad8c6c5cc50af10b, award.var_7ec7671a1e0c788f);
    }
    self.awardqueue = [];
}

// Namespace awards/namespace_46006c5769c2ac90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e7
// Size: 0x36
function flushmidmatchawardqueuewhenable() {
    self endon("disconnect");
    self notify("flushMidMatchAwardQueueWhenAble()");
    self endon("flushMidMatchAwardQueueWhenAble()");
    while (1) {
        if (!shouldqueuemidmatchaward()) {
            break;
        }
        waitframe();
    }
    thread flushmidmatchawardqueue();
}

// Namespace awards/namespace_46006c5769c2ac90
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x824
// Size: 0xb2
function shouldqueuemidmatchaward(var_3cda0e0b6a2d1f97) {
    if (level.gameended) {
        return 0;
    }
    /#
        if (getdvarint(@"hash_9779e069cc4f5bc8", 0) > 0) {
            level.var_6d05adacfaa6fbb2 = getdvarint(@"hash_9779e069cc4f5bc8", 0);
            setdvar(@"hash_9779e069cc4f5bc8", 0);
        }
        if (isdefined(level.var_6d05adacfaa6fbb2)) {
            if (level.var_6d05adacfaa6fbb2 > 0) {
                level.var_6d05adacfaa6fbb2--;
                return 1;
            }
            level.var_6d05adacfaa6fbb2 = undefined;
        }
    #/
    if (!isreallyalive(self)) {
        if (!istrue(var_3cda0e0b6a2d1f97) || isinkillcam()) {
            if (!isusingremote()) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace awards/namespace_46006c5769c2ac90
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8de
// Size: 0x167
function givemidmatchaward(ref, objweapon, var_91185ff4a2e16a72, var_4b5a99c16abfdfb1, var_51bdae03b05bc75e, var_30e33d4e4669117f, victim, cankillchain, streakinfo, var_ad8c6c5cc50af10b, var_7ec7671a1e0c788f) {
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
    if (self ispcplayer() && namespace_4b0406965e556711::gameflag("prematch_done")) {
        createnvidiavideo(ref);
    }
    if (shouldqueuemidmatchaward(var_51bdae03b05bc75e)) {
        queuemidmatchaward(ref, objweapon, var_91185ff4a2e16a72, var_4b5a99c16abfdfb1, var_51bdae03b05bc75e, var_30e33d4e4669117f, victim, cankillchain, streakinfo, var_ad8c6c5cc50af10b, var_7ec7671a1e0c788f);
        return;
    }
    namespace_bd0162aedd8c8594::logevent_awardgained(ref);
    thread giveaward(ref, objweapon, var_91185ff4a2e16a72, var_4b5a99c16abfdfb1, var_30e33d4e4669117f, victim, cankillchain, streakinfo, var_ad8c6c5cc50af10b, var_7ec7671a1e0c788f);
}

// Namespace awards/namespace_46006c5769c2ac90
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4c
// Size: 0x1d6
function createnvidiavideo(ref) {
    var_7861cc7f1384834e = undefined;
    if (ref == #"four") {
        var_7861cc7f1384834e = 9;
    } else if (ref == #"hash_8368a43e439d8a67") {
        var_7861cc7f1384834e = 7;
    } else if (ref == #"hash_978b9bab778f200b") {
        var_7861cc7f1384834e = 12;
    } else if (ref == #"hash_3b7863dcdff98b13") {
        var_7861cc7f1384834e = 13;
    } else if (ref == #"item_impact") {
        var_7861cc7f1384834e = 8;
    }
    if (!isdefined(var_7861cc7f1384834e)) {
        if (namespace_36f464722d326bbe::isbrstylegametype()) {
            if (ref == #"double") {
                var_7861cc7f1384834e = 17;
            } else if (ref == #"hash_f42b79a30529ba75") {
                var_7861cc7f1384834e = 18;
            } else if (ref == #"longshot") {
                var_7861cc7f1384834e = 19;
            } else if (ref == #"revenge") {
                var_7861cc7f1384834e = 20;
            } else if (ref == #"backstab") {
                var_7861cc7f1384834e = 21;
            } else if (ref == #"hash_123320811bf44b63") {
                var_7861cc7f1384834e = 22;
            }
        } else if (ref == #"five") {
            var_7861cc7f1384834e = 1;
        } else if (ref == #"seven") {
            var_7861cc7f1384834e = 2;
        } else if (ref == #"eight") {
            var_7861cc7f1384834e = 3;
        } else if (ref == #"hash_f3d5adb30a50aa6d") {
            var_7861cc7f1384834e = 4;
        } else if (ref == #"hash_f3d913b30a538d96") {
            var_7861cc7f1384834e = 5;
        } else if (ref == #"hash_f3dc99b30a56a71f") {
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

// Namespace awards/namespace_46006c5769c2ac90
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc29
// Size: 0x33f
function addawardtoaarlist(ref) {
    if (!isdefined(self.aarawards)) {
        self.aarawards = [];
        self.aarawardcount = 0;
        for (var_44d5a2614eed724e = 0; var_44d5a2614eed724e < 10; var_44d5a2614eed724e++) {
            struct = spawnstruct();
            self.aarawards[var_44d5a2614eed724e] = struct;
            struct.ref = "none";
            struct.count = 0;
        }
    }
    foreach (var_44d5a2614eed724e, var_6dfac1dd9d7ffae2 in self.aarawards) {
        if (var_6dfac1dd9d7ffae2.ref == ref) {
            var_6dfac1dd9d7ffae2.count++;
            self setplayerdata("common", "round", "awards", var_44d5a2614eed724e, "value", var_6dfac1dd9d7ffae2.count);
            return;
        }
    }
    var_ece43214e2fd6e1 = function_53c4c53197386572(level.var_6d808d6c553c2d9a[ref], 0);
    for (var_347e4138d03a99c8 = 0; var_347e4138d03a99c8 < self.aarawards.size; var_347e4138d03a99c8++) {
        var_6dfac1dd9d7ffae2 = self.aarawards[var_347e4138d03a99c8];
        if (var_6dfac1dd9d7ffae2.ref == "none") {
            break;
        }
        var_cca79d36f592ef75 = function_53c4c53197386572(level.var_6d808d6c553c2d9a[var_6dfac1dd9d7ffae2.ref], 0);
        if (var_ece43214e2fd6e1 > var_cca79d36f592ef75) {
            break;
        }
    }
    if (var_347e4138d03a99c8 >= self.aarawards.size) {
        return;
    }
    for (listindex = self.aarawards.size - 2; listindex >= var_347e4138d03a99c8; listindex--) {
        newindex = listindex + 1;
        self.aarawards[newindex] = self.aarawards[listindex];
        var_6dfac1dd9d7ffae2 = self.aarawards[newindex];
        if (var_6dfac1dd9d7ffae2.ref != "none") {
            self setplayerdata("common", "round", "awards", newindex, "award", function_f28fd66285fa2c9(var_6dfac1dd9d7ffae2.ref));
            self setplayerdata("common", "round", "awards", newindex, "value", var_6dfac1dd9d7ffae2.count);
        }
    }
    var_6dfac1dd9d7ffae2 = spawnstruct();
    self.aarawards[var_347e4138d03a99c8] = var_6dfac1dd9d7ffae2;
    var_6dfac1dd9d7ffae2.ref = ref;
    var_6dfac1dd9d7ffae2.count = 1;
    self setplayerdata("common", "round", "awards", var_347e4138d03a99c8, "award", function_f28fd66285fa2c9(var_6dfac1dd9d7ffae2.ref));
    self setplayerdata("common", "round", "awards", var_347e4138d03a99c8, "value", var_6dfac1dd9d7ffae2.count);
    if (self.aarawardcount < 10) {
        self.aarawardcount++;
        self setplayerdata("common", "round", "awardCount", self.aarawardcount);
    }
    if (istrue(self.savedaarawards)) {
        saveaarawards();
    }
}

// Namespace awards/namespace_46006c5769c2ac90
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
    for (var_44d5a2614eed724e = 0; var_44d5a2614eed724e < 10; var_44d5a2614eed724e++) {
        self setplayerdata("common", "round", "awards", var_44d5a2614eed724e, "award", "none");
        self setplayerdata("common", "round", "awards", var_44d5a2614eed724e, "value", 0);
    }
}

// Namespace awards/namespace_46006c5769c2ac90
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

// Namespace awards/namespace_46006c5769c2ac90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109b
// Size: 0x40
function saveaarawards() {
    self.pers["aarAwards"] = self.aarawards;
    self.pers["aarAwardCount"] = self.aarawardcount;
    self.savedaarawards = 1;
}

// Namespace awards/namespace_46006c5769c2ac90
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10e2
// Size: 0xe9
function function_c346fd8caa61c2ed() {
    /#
        for (var_44d5a2614eed724e = 0; var_44d5a2614eed724e < self.aarawards.size; var_44d5a2614eed724e++) {
            var_6dfac1dd9d7ffae2 = self.aarawards[var_44d5a2614eed724e];
            var_6c4759d0aa083a92 = self getplayerdata("<unknown string>", "<unknown string>", "<unknown string>", var_44d5a2614eed724e, "<unknown string>");
            var_c7198bd08368f0e4 = self getplayerdata("<unknown string>", "<unknown string>", "<unknown string>", var_44d5a2614eed724e, "<unknown string>");
            /#
                assert(var_6dfac1dd9d7ffae2.ref == var_6c4759d0aa083a92);
            #/
            /#
                assert(var_6dfac1dd9d7ffae2.count == var_c7198bd08368f0e4);
            #/
            println("<unknown string>" + var_44d5a2614eed724e + 1 + "<unknown string>" + var_6dfac1dd9d7ffae2.ref + "<unknown string>" + var_6dfac1dd9d7ffae2.count);
        }
    #/
}

