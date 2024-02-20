// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\potg_events.gsc;
#using scripts\mp\flags.gsc;

#namespace potg;

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x708
// Size: 0x382
function init() {
    if (namespace_36f464722d326bbe::isBRStyleGameType() || istrue(game["isLaunchChunk"])) {
        level.potgenabled = 0;
        return;
    }
    if (!isdefined(level.potgenabled) || level.potgenabled) {
        level.potgenabled = level.finalkillcamtype == 1;
    }
    if (getdvarint(@"hash_6625c2cb0de90a41", 0) == 0) {
        level.potgenabled = 0;
    }
    if (!level.potgenabled) {
        return;
    }
    var_584994fab4a8712b = spawnstruct();
    level.potgglobals = var_584994fab4a8712b;
    var_584994fab4a8712b.curpotgscene = undefined;
    var_584994fab4a8712b.systemfinalized = 0;
    var_584994fab4a8712b.entities = [];
    var_584994fab4a8712b.settings = [];
    var_584994fab4a8712b.settingtypes = [];
    var_584994fab4a8712b.nextsceneid = 0;
    var_584994fab4a8712b.lastarchivetime = -1;
    var_584994fab4a8712b.pendingarchiverequest = 0;
    loadeventtable();
    if (function_acab8b716476b589()) {
        if (!isdefined(game["potg"])) {
            bundle = level.var_62f6f7640e4431e3;
            var_a0bf9704c57af093 = bundle.var_fd6ad9506987a3a9 - 2 * bundle.var_c0bcb92698db94ff;
            var_a0e2ad04c5a168ad = bundle.var_fd47eb5069618387 - 2 * bundle.var_c0bcb92698db94ff;
            potg = spawnstruct();
            potg.var_f15f1ae1f182d55f = int(var_a0bf9704c57af093 * 1000);
            potg.var_f13c08e1f15c6611 = int(var_a0e2ad04c5a168ad * 1000);
            potg.var_bfb3d122d9c4fab3 = int(bundle.var_c0bcb92698db94ff * 1000);
            potg.var_1754edabe7fe6405 = int(bundle.var_c2ae38b58d8126f9 * 1000);
            potg.var_2d7dbb87afd5e11 = function_53c4c53197386572(bundle.var_54b8c66e7a10fce5, 0);
            potg.var_ad57f209122ed51d = [];
            potg.var_b9d4b224bd428c07 = [];
            potg.var_2ec58fa823337cd8 = [];
            if (isdefined(bundle.var_8631c9f0b1efa3a7) && bundle.var_8631c9f0b1efa3a7.size > 0) {
                potg.var_2ec58fa823337cd8 = array_sort_with_func(bundle.var_8631c9f0b1efa3a7, &function_8f4e175dca760a87);
            }
            game["potg"] = potg;
        }
        if (isdefined(level.var_62f6f7640e4431e3.var_e9789a14091683e1)) {
            level thread function_e14b5f1aa08d9caa();
        }
    } else {
        setdvarifuninitialized(@"hash_8606ee05fd13fa87", 8000);
        setdvarifuninitialized(@"hash_8629fc05fd3a6109", 3000);
        setdvarifuninitialized(@"hash_54872a63f6b7a88a", 3500);
        setdvarifuninitialized(@"hash_81e3c31a787ce483", 420);
    }
    setdvarifuninitialized(@"hash_1354f825daa8fdd3", 1000);
    /#
        setdevdvarifuninitialized(@"hash_ffd4a481b33d985a", 0);
        setdevdvarifuninitialized(@"hash_a8d6f0b654204b81", 0);
        setdevdvarifuninitialized(@"hash_1fd181ebeebe83bf", 0);
        setdevdvarifuninitialized(@"hash_ba2d7c5976a9ec58", 0);
        setdevdvarifuninitialized(@"hash_c2407250e6c4bbbc", 0);
        setdevdvarifuninitialized(@"hash_750a15da0bd4dc96", 750);
    #/
    thread onplayerconnect();
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
    namespace_57f20ee4fe3eebba::init();
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa91
// Size: 0x30
function getminimumscorerequired() {
    if (function_acab8b716476b589()) {
        return game["potg"].var_2d7dbb87afd5e11;
    } else {
        return getdvarint(@"hash_81e3c31a787ce483");
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac8
// Size: 0x30
function getactionscenedurationmax() {
    if (function_acab8b716476b589()) {
        return game["potg"].var_f15f1ae1f182d55f;
    } else {
        return getdvarint(@"hash_8606ee05fd13fa87");
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaff
// Size: 0x30
function getactionscenedurationmin() {
    if (function_acab8b716476b589()) {
        return game["potg"].var_f13c08e1f15c6611;
    } else {
        return getdvarint(@"hash_8629fc05fd3a6109");
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb36
// Size: 0x30
function getscenebufferduration() {
    if (function_acab8b716476b589()) {
        return game["potg"].var_bfb3d122d9c4fab3;
    } else {
        return getdvarint(@"hash_54872a63f6b7a88a");
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6d
// Size: 0x30
function function_c32dbde9550fc4d5() {
    if (function_acab8b716476b589()) {
        return game["potg"].var_1754edabe7fe6405;
    } else {
        return getdvarint(@"hash_54872a63f6b7a88a");
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba4
// Size: 0x13
function getwholescenedurationmin() {
    return getactionscenedurationmin() + getscenebufferduration() * 2;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbf
// Size: 0x13
function getwholescenedurationmax() {
    return getactionscenedurationmax() + getscenebufferduration() * 2;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbda
// Size: 0x11
function getminimumscorerequirednvidiahighlights() {
    return getdvarint(@"hash_750a15da0bd4dc96");
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf3
// Size: 0xd7
function loadeventtable() {
    if (function_acab8b716476b589()) {
        return;
    }
    var_584994fab4a8712b = level.potgglobals;
    for (rowindex = 0; 1; rowindex++) {
        eventref = tablelookupbyrow("mp/potg_event_table.csv", rowindex, 0);
        if (!isdefined(eventref) || eventref == "") {
            break;
        }
        var_584994fab4a8712b.eventtable[eventref] = [];
        score = tablelookupbyrow("mp/potg_event_table.csv", rowindex, 1);
        var_584994fab4a8712b.eventtable[eventref]["score"] = float(score);
        addOn = tablelookupbyrow("mp/potg_event_table.csv", rowindex, 2);
        var_584994fab4a8712b.eventtable[eventref]["addOn"] = addOn != "";
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd1
// Size: 0x4b
function onplayerconnect() {
    level endon("game_ended");
    while (1) {
        player = level waittill("connected");
        registerpotgentity(player);
        player thread updateplayerrecording();
        /#
            if (!namespace_cd0b2d039510b38d::lpcfeaturegated()) {
                player thread function_a7465123c4bb2ec5();
            }
        #/
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd23
// Size: 0x4c
function updateplayerrecording() {
    level endon("game_ended");
    self endon("disconnect");
    while (1) {
        self waittill("spawned_player");
        startrecording();
        self waittill("death");
        if (!istrue(self.fauxdead)) {
            self waittill("death_delay_finished");
        }
        stoprecording();
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd76
// Size: 0x14
function onplayerdisconnect(player) {
    deregisterpotgentity(player);
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd91
// Size: 0x2b
function onroundended(winner) {
    if (!istrue(level.potgenabled)) {
        return;
    }
    namespace_57f20ee4fe3eebba::onroundended(winner);
    waitframe();
    thread waitforrecordingandfinalize();
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc3
// Size: 0x21
function waitforrecordingandfinalize() {
    wait(getscenebufferduration() / 1000);
    waitframe();
    if (!shouldskippotg()) {
        finalizepotgsystem();
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdeb
// Size: 0x42
function shouldskippotg() {
    var_c38a3b36ba5342c7 = getcurpotgscene();
    if (isdefined(var_c38a3b36ba5342c7) && isdefined(var_c38a3b36ba5342c7.primaryentity)) {
        return (var_c38a3b36ba5342c7.score < getminimumscorerequired());
    } else {
        return 1;
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe34
// Size: 0x6e
function finalizepotgsystem() {
    level notify("potg_finalize");
    finalizeallrecordings();
    waittillframeend();
    level.potgglobals.systemfinalized = 1;
    if (shouldskippotg()) {
        return;
    }
    if (level.potgglobals.pendingarchiverequest) {
        archivecurrentgamestate();
    }
    var_cc46931e59a508d3 = getcurpotgscene();
    if (isdefined(var_cc46931e59a508d3)) {
        finalizescene(var_cc46931e59a508d3);
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea9
// Size: 0x16
function issystemfinalized() {
    return level.potgglobals.systemfinalized;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec7
// Size: 0x61
function function_acab8b716476b589() {
    if (!isdefined(level.var_62f6f7640e4431e3)) {
        return 0;
    }
    if (istrue(level.var_62f6f7640e4431e3.var_76309a09e264bb97)) {
        if (function_950c8234f03299d4()) {
            return 1;
        } else {
            /#
                function_5013853947770621(#"hash_7aa1f96477bc1fb6");
            #/
            level.var_62f6f7640e4431e3.var_76309a09e264bb97 = 0;
            return 0;
        }
    }
    return 0;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf30
// Size: 0x4c
function function_6ccc879a30fe522c() {
    if (function_acab8b716476b589()) {
        return level.var_62f6f7640e4431e3.finalkillcamtype;
    } else {
        return getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_killcamType"), @"hash_769d7362e31fdf55");
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf83
// Size: 0xcd
function registerpotgentity(entity) {
    if (!level.potgenabled) {
        return;
    }
    var_584994fab4a8712b = level.potgglobals;
    id = getentityid(entity);
    /#
        assert(isdefined(entity) && !isdefined(var_584994fab4a8712b.entities[id]));
    #/
    newstruct = spawnstruct();
    newstruct.entity = entity;
    newstruct.events = [];
    newstruct.recordingenabledcount = 0;
    newstruct.lastrecordingstarttime = -1;
    newstruct.nexteventid = 0;
    var_584994fab4a8712b.entities[id] = newstruct;
    /#
        function_931a8f6e47923a14(entity, "ui_score_event_list_0");
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1057
// Size: 0x64
function deregisterpotgentity(entity) {
    if (!level.potgenabled) {
        return;
    }
    var_584994fab4a8712b = level.potgglobals;
    id = getentityid(entity);
    var_584994fab4a8712b.entities[id] = undefined;
    entity notify("cleanup_potg_entity");
    /#
        function_931a8f6e47923a14(entity, "(GameObject)");
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c2
// Size: 0x33
function getentitypotgdata(entity) {
    id = getentityid(entity);
    return level.potgglobals.entities[id];
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10fd
// Size: 0x44
function getentityid(entity) {
    if (isdefined(entity.potgid)) {
        return entity.potgid;
    }
    entity.potgid = entity getentitynumber();
    return entity.potgid;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1149
// Size: 0x80
function startrecording() {
    if (!level.potgenabled) {
        return;
    }
    if (issystemfinalized()) {
        return;
    }
    var_3ff449a8eec1b966 = getentitypotgdata(self);
    /#
        assert(isdefined(var_3ff449a8eec1b966));
    #/
    /#
        assertex(!issystemfinalized(), "potg::startRecording called after recordings have been finalized");
    #/
    if (var_3ff449a8eec1b966.recordingenabledcount == 0) {
        onrecordingstarted(var_3ff449a8eec1b966);
    }
    var_3ff449a8eec1b966.recordingenabledcount++;
    /#
        function_4f8540de8b6894db(self, "end_time");
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d0
// Size: 0x1d
function onrecordingstarted(var_3ff449a8eec1b966) {
    var_3ff449a8eec1b966.lastrecordingstarttime = gettime();
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f4
// Size: 0x86
function stoprecording() {
    if (!level.potgenabled) {
        return;
    }
    if (issystemfinalized()) {
        return;
    }
    var_3ff449a8eec1b966 = getentitypotgdata(self);
    /#
        assert(isdefined(var_3ff449a8eec1b966));
    #/
    /#
        assertex(var_3ff449a8eec1b966.recordingenabledcount > 0, "POTG::stopRecording() Attempting to enable recording more times than startRecording has been called");
    #/
    var_3ff449a8eec1b966.recordingenabledcount--;
    if (var_3ff449a8eec1b966.recordingenabledcount == 0) {
        onrecordingstopped(var_3ff449a8eec1b966);
    }
    /#
        function_4f8540de8b6894db(self, "archiveDuration");
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1281
// Size: 0x46
function forcestoprecording(var_3ff449a8eec1b966) {
    var_3ff449a8eec1b966.recordingenabledcount = 0;
    var_3ff449a8eec1b966.entity onrecordingstopped(var_3ff449a8eec1b966);
    /#
        function_4f8540de8b6894db(var_3ff449a8eec1b966.entity, "dedi");
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ce
// Size: 0x41
function onrecordingstopped(var_3ff449a8eec1b966) {
    var_584994fab4a8712b = level.potgglobals;
    namespace_57f20ee4fe3eebba::onpotgrecordingstopped();
    var_3ff449a8eec1b966.entity notify("potg_stop_recording");
    removeallevents(var_3ff449a8eec1b966);
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1316
// Size: 0x4b
function isrecordingenabled(var_3ff449a8eec1b966) {
    if (!level.potgenabled) {
        return 0;
    }
    if (issystemfinalized()) {
        return 0;
    }
    if (!isdefined(var_3ff449a8eec1b966)) {
        var_3ff449a8eec1b966 = getentitypotgdata(self);
    }
    /#
        assert(isdefined(var_3ff449a8eec1b966));
    #/
    return var_3ff449a8eec1b966.recordingenabledcount > 0;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1369
// Size: 0x78
function finalizeallrecordings() {
    var_584994fab4a8712b = level.potgglobals;
    foreach (var_3ff449a8eec1b966 in var_584994fab4a8712b.entities) {
        forcestoprecording(var_3ff449a8eec1b966);
    }
    /#
        function_58af25849b7e7eee();
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e8
// Size: 0x299
function processevent(eventref, starttime, endtime, psoffsettime, var_500370e4f476faa9, scoremultiplier) {
    if (!level.potgenabled) {
        return;
    }
    if (function_acab8b716476b589()) {
        if (!function_d03495fe6418377b(eventref)) {
            eventref = function_1823ff50bb28148d(eventref);
        }
        if (!eventtable_isevent(eventref)) {
            return;
        }
    } else {
        /#
            /#
                assertex(isdefined(level.potgglobals.eventtable[eventref]), "<unknown string>" + eventref);
            #/
        #/
    }
    if (!isdefined(starttime)) {
        starttime = gettime();
    }
    if (!isdefined(endtime)) {
        endtime = starttime;
    }
    /#
        assert(endtime >= starttime);
    #/
    /#
        assert(starttime <= gettime());
    #/
    /#
        assert(endtime <= gettime());
    #/
    var_584994fab4a8712b = level.potgglobals;
    var_3ff449a8eec1b966 = getentitypotgdata(self);
    /#
        assert(isdefined(var_3ff449a8eec1b966));
    #/
    removeoldevents(var_3ff449a8eec1b966);
    if (!isrecordingenabled(var_3ff449a8eec1b966)) {
        return;
    }
    var_312642b9c7019ad5 = int(max(getcurwindowstarttime(), var_3ff449a8eec1b966.lastrecordingstarttime));
    if (starttime <= var_312642b9c7019ad5 || endtime <= var_312642b9c7019ad5) {
        return;
    }
    var_e6ef9f6d477c0397 = spawnstruct();
    player = self;
    score = undefined;
    if (isdefined(var_500370e4f476faa9)) {
        score = var_500370e4f476faa9;
    } else {
        score = eventtable_getscore(eventref, player);
    }
    if (isdefined(scoremultiplier)) {
        score = score * scoremultiplier;
    }
    var_fde7d503ea7bba89 = int(clamp(player.health / player.maxhealth * 127, 0, 127));
    var_e6ef9f6d477c0397.eventref = eventref;
    var_e6ef9f6d477c0397.starttime = starttime;
    var_e6ef9f6d477c0397.endtime = endtime;
    var_e6ef9f6d477c0397.score = score;
    var_e6ef9f6d477c0397.psoffsettime = psoffsettime;
    var_e6ef9f6d477c0397.var_fde7d503ea7bba89 = var_fde7d503ea7bba89;
    eventid = var_3ff449a8eec1b966.nexteventid;
    var_3ff449a8eec1b966.nexteventid++;
    var_3ff449a8eec1b966.events[eventid] = var_e6ef9f6d477c0397;
    /#
        function_7fe17c62b2ba41a2(eventref);
    #/
    /#
        function_89e809869ae732cc(self, eventref, score, starttime, endtime);
    #/
    datalog_newevent(var_e6ef9f6d477c0397, eventid, self);
    if (!eventtable_isaddonevent(eventref)) {
        thread waitandnominatepotg(var_3ff449a8eec1b966);
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1688
// Size: 0xb6
function waitandnominatepotg(var_3ff449a8eec1b966) {
    entity = var_3ff449a8eec1b966.entity;
    entity endon("disconnect");
    entity endon("cleanup_potg_entity");
    entity notify("waitAndNominatePOTG()");
    entity endon("waitAndNominatePOTG()");
    waittillframeend();
    if (!isrecordingenabled(var_3ff449a8eec1b966)) {
        return;
    }
    totalscore = calculatepotgscore(var_3ff449a8eec1b966.events);
    if (totalscore > getminimumscorerequired() && totalscore > getbestpotgscore()) {
        var_58debfd84e38f50b = createscenefromnewevent(var_3ff449a8eec1b966, totalscore);
        entity thread waitformorerecordingtimeforscene(var_58debfd84e38f50b);
    } else {
        /#
            function_db2034a316b2f949(entity, totalscore, var_3ff449a8eec1b966.events.size);
        #/
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1745
// Size: 0x89
function removeoldevents(var_3ff449a8eec1b966) {
    var_3071102f98cbed33 = getcurwindowstarttime();
    foreach (var_acffd3a74a7aa812, eventdata in var_3ff449a8eec1b966.events) {
        if (eventdata.starttime < var_3071102f98cbed33) {
            var_3ff449a8eec1b966.events[var_acffd3a74a7aa812] = undefined;
        }
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d5
// Size: 0x19
function removeallevents(var_3ff449a8eec1b966) {
    var_3ff449a8eec1b966.events = [];
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f5
// Size: 0x28d
function createscenefromnewevent(var_3ff449a8eec1b966, totalscore) {
    scene = spawnstruct();
    scene.primaryentity = var_3ff449a8eec1b966.entity;
    scene.events = var_3ff449a8eec1b966.events;
    scene.score = totalscore;
    scene.sceneid = level.potgglobals.nextsceneid;
    level.potgglobals.nextsceneid++;
    /#
        assert(var_3ff449a8eec1b966.events.size > 0);
    #/
    scene.actionstarttime = undefined;
    scene.actionendtime = undefined;
    scene.var_fde7d503ea7bba89 = undefined;
    foreach (event in var_3ff449a8eec1b966.events) {
        if (!isdefined(scene.actionstarttime) || event.starttime < scene.actionstarttime) {
            scene.actionstarttime = event.starttime;
        }
        if (!isdefined(scene.actionendtime) || event.endtime > scene.actionendtime) {
            scene.actionendtime = event.endtime;
        }
        if (isdefined(event.var_fde7d503ea7bba89)) {
            if (!isdefined(scene.var_fde7d503ea7bba89) || scene.var_fde7d503ea7bba89 != event.var_fde7d503ea7bba89) {
                scene.var_fde7d503ea7bba89 = event.var_fde7d503ea7bba89;
            }
        } else {
            scene.var_fde7d503ea7bba89 = 127;
        }
    }
    /#
        assert(scene.actionendtime >= scene.actionstarttime);
    #/
    /#
        assert(isdefined(var_3ff449a8eec1b966.lastrecordingstarttime));
    #/
    scene.recordingstarttime = var_3ff449a8eec1b966.lastrecordingstarttime;
    /#
        assert(scene.actionstarttime >= scene.recordingstarttime);
    #/
    scene.endtime = undefined;
    scene.playbackstarttime = undefined;
    scene.playbackendtime = undefined;
    return scene;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8a
// Size: 0x1a
function doesscenehaveenoughtotalrecordingtime(scene) {
    return getmaxsceneduration(scene) >= getwholescenedurationmin();
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aac
// Size: 0x5f
function doesscenehaveenoughbufferrecordingtime(scene) {
    /#
        assert(isdefined(scene.endtime));
    #/
    /#
        assert(scene.endtime >= scene.actionendtime);
    #/
    return scene.endtime - scene.actionendtime >= function_c32dbde9550fc4d5();
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b13
// Size: 0x63
function getmaxsceneduration(scene) {
    /#
        assert(isdefined(scene.recordingstarttime));
    #/
    /#
        assert(isdefined(scene.endtime));
    #/
    starttime = scene.recordingstarttime;
    return scene.endtime - scene.recordingstarttime;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7e
// Size: 0x1fa
function waitformorerecordingtimeforscene(scene) {
    self endon("disconnect");
    self endon("cleanup_potg_entity");
    var_5741558440486aa4 = scene.recordingstarttime + getwholescenedurationmin();
    var_d6aae35763cad502 = scene.actionendtime + getscenebufferduration();
    latestendtime = scene.actionstarttime + getwholescenedurationmax();
    /#
        assert(var_5741558440486aa4 <= latestendtime);
    #/
    endtime = int(clamp(var_d6aae35763cad502, var_5741558440486aa4, latestendtime));
    /#
        assert(endtime >= scene.actionendtime);
    #/
    /#
        function_6d136a77e61ca284(scene, "<unknown string>" + endtime - gettime() + "<unknown string>");
    #/
    result = "no_wait";
    if (endtime > gettime()) {
        thread watchpendingscenetimeout(endtime);
        result = waittill_any_return_no_endon_death_2("potg_pending_scene_timeout", "potg_stop_recording");
        self notify("potg_scene_finished_pending");
    }
    if (gettime() > endtime) {
        scene.endtime = endtime;
    } else {
        scene.endtime = gettime();
    }
    /#
        assertex(isdefined(self), "POTG: Entity deleted while a POTG was waiting on it's recording. It needed to be deregistered when it was destroyed");
    #/
    /#
        function_6d136a77e61ca284(scene, "<unknown string>" + result + "<unknown string>");
    #/
    if (doesscenehaveenoughtotalrecordingtime(scene)) {
        if (doesscenehaveenoughbufferrecordingtime(scene)) {
            if (scene.score > getminimumscorerequired() && scene.score >= getbestpotgscore()) {
                setcurpotgscene(scene);
            } else {
                /#
                    function_2f99c1774457a61a(scene.primaryentity, scene, "<unknown string>");
                #/
            }
        } else {
            /#
                function_2f99c1774457a61a(scene.primaryentity, scene, "<unknown string>");
            #/
        }
    } else {
        /#
            function_2f99c1774457a61a(scene.primaryentity, scene, "<unknown string>");
        #/
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d7f
// Size: 0x29
function watchpendingscenetimeout(endtime) {
    self endon("potg_scene_finished_pending");
    while (gettime() < endtime) {
        waitframe();
    }
    self notify("potg_pending_scene_timeout");
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1daf
// Size: 0xb3
function calculatepotgscore(events) {
    killcount = 0;
    var_4862098ee5021db9 = 0;
    foreach (eventdata in events) {
        var_4862098ee5021db9 = var_4862098ee5021db9 + eventdata.score;
        if (eventdata.eventref == "kill") {
            killcount++;
        }
    }
    if (killcount > 2) {
        score = eventtable_getscore("triple_kill");
        var_4862098ee5021db9 = var_4862098ee5021db9 + score;
    }
    return var_4862098ee5021db9;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e6a
// Size: 0x7c
function setcurpotgscene(scene) {
    /#
        assert(doesscenehaveenoughtotalrecordingtime(scene));
    #/
    calcsceneplaybacktimes(scene);
    requestarchive(scene.playbackstarttime, scene.playbackendtime);
    screenprint_newpotgchosen(scene, level.potgglobals.curpotgscene);
    level.potgglobals.curpotgscene = scene;
    /#
        function_eab0b74dcbef7e9c(scene);
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eed
// Size: 0x24
function getcurpotgscene() {
    if (!level.potgenabled) {
        return undefined;
    }
    return level.potgglobals.curpotgscene;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f19
// Size: 0x4d
function getbestpotgscore() {
    if (!level.potgenabled) {
        return -1;
    }
    var_584994fab4a8712b = level.potgglobals;
    if (!isdefined(var_584994fab4a8712b.curpotgscene)) {
        return -1;
    }
    return var_584994fab4a8712b.curpotgscene.score;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f6e
// Size: 0xf
function getcurwindowstarttime() {
    return gettime() - getwholescenedurationmax();
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f85
// Size: 0x95
function eventtable_getscore(eventref, player) {
    if (function_acab8b716476b589()) {
        if (!function_d03495fe6418377b(eventref)) {
            eventref = function_1823ff50bb28148d(eventref);
        }
        if (!isdefined(level.scoreinfo[eventref])) {
            return 0;
        }
        basescore = level.scoreinfo[eventref][#"hash_98fbaf2f45d2fc09"];
        var_54611f7d8321e83c = function_972555778bce6766(eventref, player);
        return (basescore * var_54611f7d8321e83c);
    } else {
        return level.potgglobals.eventtable[eventref]["score"];
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2021
// Size: 0x46
function function_972555778bce6766(eventref, player) {
    var_54611f7d8321e83c = 1;
    var_54611f7d8321e83c = var_54611f7d8321e83c * function_f6c9a415f86697af(eventref);
    var_54611f7d8321e83c = var_54611f7d8321e83c * function_c488370b61042846(player);
    var_54611f7d8321e83c = var_54611f7d8321e83c * function_4ed25b1ffc14d7a8(player);
    return var_54611f7d8321e83c;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x206f
// Size: 0xd0
function function_f6c9a415f86697af(eventref) {
    if (!isroundbased() || level.currentround == 1) {
        return 1;
    }
    if (!isdefined(level.var_62f6f7640e4431e3.var_37420a2cbcb0ab)) {
        return 1;
    }
    if (!isdefined(game["potg"].var_b9d4b224bd428c07[level.currentround - 1])) {
        return 1;
    }
    if (!isdefined(eventref)) {
        return 1;
    }
    var_3c2ac3375e0ba894 = game["potg"].var_b9d4b224bd428c07[level.currentround - 1];
    var_88016caa290ff502 = var_3c2ac3375e0ba894 == eventref;
    if (var_88016caa290ff502) {
        return level.var_62f6f7640e4431e3.var_37420a2cbcb0ab;
    }
    return 1;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2147
// Size: 0x7c
function function_c488370b61042846(player) {
    if (!isroundbased() || level.currentround == 1) {
        return 1;
    }
    if (!isdefined(level.var_62f6f7640e4431e3.var_2a467946281a4fd4)) {
        return 1;
    }
    if (!isdefined(player)) {
        return 1;
    }
    if (istrue(player.var_b74182dec395b240)) {
        return level.var_62f6f7640e4431e3.var_2a467946281a4fd4;
    }
    return 1;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21cb
// Size: 0xe7
function function_4ed25b1ffc14d7a8(player) {
    if (!isdefined(level.var_62f6f7640e4431e3.var_8631c9f0b1efa3a7) || level.var_62f6f7640e4431e3.var_8631c9f0b1efa3a7.size == 0) {
        return 1;
    }
    if (!isplayer(player)) {
        return 1;
    }
    var_b04380ede90495aa = player getplayerdata(level.var_5d69837cf4db0407, "roundsSinceLastPOTG");
    var_1498673d1311049b = game["potg"].var_2ec58fa823337cd8;
    if (var_b04380ede90495aa < var_1498673d1311049b[0].roundsSinceLastPOTG) {
        return 1;
    }
    for (i = var_1498673d1311049b.size - 1; i >= 0; i--) {
        if (var_b04380ede90495aa >= var_1498673d1311049b[i].roundsSinceLastPOTG) {
            return var_1498673d1311049b[i].modifier;
        }
    }
    return 1;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ba
// Size: 0x103
function function_fa47d8c13e83a98c() {
    var_a520dc4735b5b315 = game["potg"].var_ad57f209122ed51d[level.currentround];
    var_a16a87f3dde73d18 = level.potgglobals.entities[var_a520dc4735b5b315].entity;
    var_a16a87f3dde73d18 setplayerdata(level.var_5d69837cf4db0407, "roundsSinceLastPOTG", 0);
    foreach (player in level.players) {
        if (!isplayer(player)) {
            continue;
        }
        if (player == var_a16a87f3dde73d18) {
            continue;
        }
        roundsSinceLastPOTG = player getplayerdata(level.var_5d69837cf4db0407, "roundsSinceLastPOTG");
        player setplayerdata(level.var_5d69837cf4db0407, "roundsSinceLastPOTG", roundsSinceLastPOTG + 1);
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c4
// Size: 0x2b
function function_8f4e175dca760a87(var_9f57e1a03621e9d9, var_749e109bf218507a) {
    return var_9f57e1a03621e9d9.modifier < var_749e109bf218507a.modifier;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f7
// Size: 0x36
function eventtable_isaddonevent(eventref) {
    if (function_acab8b716476b589()) {
        return 0;
    } else {
        return level.potgglobals.eventtable[eventref]["addOn"];
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2434
// Size: 0x69
function eventtable_isevent(eventref) {
    if (function_acab8b716476b589()) {
        if (!function_d03495fe6418377b(eventref)) {
            eventref = function_1823ff50bb28148d(eventref);
        }
        if (!isdefined(level.scoreinfo[eventref])) {
            return 0;
        }
        return (level.scoreinfo[eventref][#"hash_98fbaf2f45d2fc09"] != 0);
    } else {
        return isdefined(level.potgglobals.eventtable[eventref]);
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a4
// Size: 0xf5
function function_e14b5f1aa08d9caa() {
    level endon("game_ended");
    level namespace_4b0406965e556711::gameflagwait("prematch_done");
    var_e05c0da4be412a37 = level.currentround;
    var_4c025902e0a710fc = var_e05c0da4be412a37 - 1;
    var_74a884b855cb7dbd = level.var_62f6f7640e4431e3.var_e9789a14091683e1;
    for (round = 1; round < var_e05c0da4be412a37; round++) {
        var_a520dc4735b5b315 = game["potg"].var_ad57f209122ed51d[round];
        var_a16a87f3dde73d18 = level.potgglobals.entities[var_a520dc4735b5b315].entity;
        if (!isdefined(var_a16a87f3dde73d18)) {
            continue;
        }
        var_b04380ede90495aa = var_4c025902e0a710fc - round;
        if (var_b04380ede90495aa >= var_74a884b855cb7dbd) {
            var_a16a87f3dde73d18.var_b74182dec395b240 = 0;
        } else {
            var_a16a87f3dde73d18.var_b74182dec395b240 = 1;
        }
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a0
// Size: 0xd2
function finalizescene(scene) {
    /#
        assert(issystemfinalized() || getdvarint(@"hash_a8d6f0b654204b81"));
    #/
    scene.finalized = 1;
    if (function_acab8b716476b589()) {
        game["potg"].var_ad57f209122ed51d[level.currentround] = getentityid(scene.primaryentity);
        game["potg"].var_b9d4b224bd428c07[level.currentround] = array_get_first_item(scene.events).eventref;
        level function_fa47d8c13e83a98c();
    }
    calcscenepsoffset(scene);
    resetscorefeedcontrolomnvar();
    /#
        function_434562c57a231693(scene);
    #/
    datalog_scenefinalized(scene);
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2679
// Size: 0xa4
function resetscorefeedcontrolomnvar() {
    foreach (player in level.players) {
        player setclientomnvar("ui_potg_score_event_control", -1);
        player setclientomnvar("ui_score_event_list_0", -1);
        player setclientomnvar("ui_score_event_list_1", -1);
        player setclientomnvar("ui_score_event_list_2", -1);
        player setclientomnvar("ui_score_event_list_3", -1);
        player setclientomnvar("ui_score_event_list_4", -1);
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2724
// Size: 0x17b
function calcsceneplaybacktimes(scene) {
    var_6294534a03b3d4a7 = gettime() - 13500;
    var_27dc7d2c5dede987 = scene.endtime - getwholescenedurationmax();
    var_eb9fb8a764ae917d = int(max(var_27dc7d2c5dede987, max(scene.recordingstarttime, var_6294534a03b3d4a7)));
    var_c3eccd2658b3fd57 = scene.actionstarttime - getscenebufferduration();
    var_10dbae4afe99066b = int(min(scene.actionstarttime, scene.endtime - getwholescenedurationmin()));
    /#
        assert(var_10dbae4afe99066b >= var_eb9fb8a764ae917d);
    #/
    /#
        assert(scene.endtime - var_eb9fb8a764ae917d >= getwholescenedurationmin());
    #/
    /#
        assert(scene.endtime - var_10dbae4afe99066b >= getwholescenedurationmin());
    #/
    scene.playbackstarttime = int(clamp(var_c3eccd2658b3fd57, var_eb9fb8a764ae917d, var_10dbae4afe99066b));
    scene.playbackendtime = scene.endtime;
    var_884db59e2243e42c = scene.playbackendtime - scene.playbackstarttime;
    /#
        assert(var_884db59e2243e42c >= getwholescenedurationmin());
    #/
    /#
        assert(var_884db59e2243e42c <= getwholescenedurationmax());
    #/
    /#
        assert(var_884db59e2243e42c <= 13500);
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28a6
// Size: 0x134
function calcscenepsoffset(scene) {
    var_6a45d2e4a65780cb = [];
    foreach (event in scene.events) {
        if (isdefined(event.psoffsettime) && !isdefined(var_6a45d2e4a65780cb[event.endtime])) {
            var_6a45d2e4a65780cb[event.endtime] = event.psoffsettime;
        }
    }
    if (var_6a45d2e4a65780cb.size <= 0) {
        scene.psoffsettime = 0;
        return;
    }
    var_9ae310be2354d6c3 = 0;
    foreach (time in var_6a45d2e4a65780cb) {
        var_9ae310be2354d6c3 = var_9ae310be2354d6c3 + time;
    }
    var_ad8e46ec031ef58d = var_9ae310be2354d6c3 / var_6a45d2e4a65780cb.size;
    scene.psoffsettime = int(var_ad8e46ec031ef58d);
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29e1
// Size: 0xe5
function getfinalpotginfo() {
    /#
        assertex(level.potgenabled, "Attempting to show POTG, but POTG is disabled");
    #/
    /#
        assert(issystemfinalized() || getdvarint(@"hash_a8d6f0b654204b81"));
    #/
    var_cc46931e59a508d3 = getcurpotgscene();
    if (!isdefined(var_cc46931e59a508d3)) {
        return undefined;
    }
    /#
        assert(istrue(var_cc46931e59a508d3.finalized));
    #/
    /#
        assert(doesscenefitincurrentarchive(var_cc46931e59a508d3));
    #/
    info = spawnstruct();
    info.starttime = var_cc46931e59a508d3.playbackstarttime;
    info.endtime = var_cc46931e59a508d3.playbackendtime;
    info.spectateentity = var_cc46931e59a508d3.primaryentity;
    info.psoffsettime = var_cc46931e59a508d3.psoffsettime;
    return info;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ace
// Size: 0x1f
function requestarchive(starttime, endtime) {
    level thread archiverequesthelper(starttime, endtime);
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2af4
// Size: 0xe0
function archiverequesthelper(starttime, endtime) {
    level endon("potg_finalize");
    level notify("potg_archiveRequestHelper()");
    level endon("potg_archiveRequestHelper()");
    level.potgglobals.pendingarchiverequest = 1;
    /#
        assert(endtime > starttime);
    #/
    /#
        assertex(endtime - starttime <= 13500, "POTG system attempting to archive a scene that is larger than the max archive length");
    #/
    /#
        assertex(gettime() - 13500 <= starttime, "POTG system attempting to request an archive that is outside the possible archive time");
    #/
    var_a127b5a0b26a9b01 = starttime + 13500 - 100;
    var_436681fb9914bb6a = var_a127b5a0b26a9b01 - gettime();
    /#
        assert(var_436681fb9914bb6a >= 0);
    #/
    /#
        function_6e0f018a9e890127(var_436681fb9914bb6a / 1000);
    #/
    wait_time_in_ms(var_436681fb9914bb6a);
    level.potgglobals.pendingarchiverequest = 0;
    archivecurrentgamestate();
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bdb
// Size: 0xbb
function archivecurrentgamestate() {
    thread debug_watcharchivesize(getpotgstarttime(), getcurpotgscene());
    savepotgdata();
    var_b19688b8c0890315 = level.potgglobals.lastarchivetime;
    level.potgglobals.lastarchivetime = gettime();
    /#
        assert(doesscenefitincurrentarchive(getcurpotgscene()));
    #/
    var_70cc693025693d44 = -1;
    if (var_b19688b8c0890315 > 0) {
        var_70cc693025693d44 = level.potgglobals.lastarchivetime - var_b19688b8c0890315;
        /#
            assert(var_70cc693025693d44 >= getrapidarchivewarningrate(), "POTG System trying to request archives too frequently. " + var_70cc693025693d44 + "s since last archive");
        #/
    }
    /#
        function_1483fe96ec345b56(var_70cc693025693d44);
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c9d
// Size: 0x10
function getrapidarchivewarningrate() {
    return 13500 - getwholescenedurationmax() - 250;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cb5
// Size: 0x60
function doesscenefitincurrentarchive(scene) {
    var_55ba69b15e012577 = level.potgglobals.lastarchivetime;
    if (var_55ba69b15e012577 < 0) {
        return 0;
    }
    archiveStartTime = var_55ba69b15e012577 - 13500;
    return scene.playbackstarttime >= archiveStartTime && scene.playbackendtime <= var_55ba69b15e012577;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d1d
// Size: 0x132
function screenprint_newpotgchosen(var_58debfd84e38f50b, var_ba4b27edc7c3a602) {
    if (getdvarint(@"hash_ba2d7c5976a9ec58") == 0) {
        return;
    }
    if (var_58debfd84e38f50b.score <= 250) {
        return;
    }
    var_fab9ca08ad8fe199 = undefined;
    if (isplayer(var_58debfd84e38f50b.primaryentity)) {
        var_fab9ca08ad8fe199 = var_58debfd84e38f50b.primaryentity.name;
    } else {
        var_fab9ca08ad8fe199 = "(GameObject)";
    }
    if (isplayer(var_58debfd84e38f50b.primaryentity)) {
        var_58debfd84e38f50b.primaryentity iprintlnbold("POTG Nominee! (" + var_58debfd84e38f50b.score + ")");
    }
    if (isdefined(var_ba4b27edc7c3a602) && isplayer(var_ba4b27edc7c3a602.primaryentity) && var_ba4b27edc7c3a602.primaryentity != var_58debfd84e38f50b.primaryentity) {
        var_ba4b27edc7c3a602.primaryentity iprintlnbold("Your POTG was bested by +" + var_fab9ca08ad8fe199 + "! (" + var_58debfd84e38f50b.score + ")");
    }
    level.potgglobals.lastchosenscreenprinttime = gettime();
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e56
// Size: 0x111
function screenprint_dosceneprintplayback() {
    if (getdvarint(@"hash_ba2d7c5976a9ec58") == 0) {
        return;
    }
    scene = getcurpotgscene();
    var_bc01593c93e86b53 = gettime() - int(self.archivetime * 1000);
    updaterate = 0.15;
    var_e9eb390a12336fc1 = [];
    while (1) {
        foreach (eventid, event in scene.events) {
            if (event.starttime <= var_bc01593c93e86b53 && !isdefined(var_e9eb390a12336fc1[eventid])) {
                iprintlnbold(event.eventref);
                iprintln(event.eventref);
                var_e9eb390a12336fc1[eventid] = 1;
                break;
            }
        }
        wait(updaterate);
        var_bc01593c93e86b53 = var_bc01593c93e86b53 + int(updaterate * 1000);
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f6e
// Size: 0x33
function datalog_getlogversion() {
    if (getdvarint(@"hash_6af7e4425b1f5d10", 0) != 0) {
        return -1;
    }
    if (getdvarint(@"hash_ff689af941dd10a1", 0) != 0) {
        return 9;
    }
    return -1;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fa9
// Size: 0x13
function datalog_isloggingenabled() {
    return getdvarint(@"hash_1fd181ebeebe83bf") != 0;
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fc4
// Size: 0x1c4
function datalog_scenefinalized(scene) {
    if (!datalog_isloggingenabled()) {
        return;
    }
    var_ce11efacb4914ac2 = datalog_getlogversion();
    dlog_recordevent("mpscript_potg", [0:"score", 1:scene.score, 2:"duration", 3:scene.playbackendtime - scene.playbackstarttime, 4:"start_time", 5:scene.playbackstarttime, 6:"action_start_offset", 7:scene.actionstarttime - scene.playbackstarttime, 8:"action_end_offset", 9:scene.actionendtime - scene.playbackstarttime, 10:"entity_id", 11:getentityid(scene.primaryentity), 12:"script_version", 13:var_ce11efacb4914ac2]);
    foreach (event in scene.events) {
        dlog_recordevent("mpscript_potg_final_events", [0:"event_ref", 1:event.eventref, 2:"score", 3:event.score, 4:"start_time", 5:event.playbackstarttime, 6:"end_time", 7:event.playbackendtime, 8:"script_version", 9:var_ce11efacb4914ac2]);
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x318f
// Size: 0xc7
function datalog_newevent(event, id, entity) {
    if (!datalog_isloggingenabled()) {
        return;
    }
    dlog_recordevent("mpscript_potg_events", [0:"event_ref", 1:event.eventref, 2:"score", 3:event.score, 4:"start_time", 5:event.starttime, 6:"end_time", 7:event.endtime, 8:"event_id", 9:id, 10:"entity_id", 11:getentityid(entity), 12:"script_version", 13:datalog_getlogversion()]);
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x325d
// Size: 0x105
function datalog_archivesaved(requesttime, archiveStartTime, archiveDuration, desiredSceneStartTime, desiredSceneEndTime) {
    if (getdvarint(@"hash_1354f825daa8fdd3", 0) == 0) {
        return;
    }
    version = datalog_getlogversion();
    dlog_recordevent("mpscript_potg_archive", [0:"requestTime", 1:requesttime, 2:"archiveStartTime", 3:archiveStartTime, 4:"archiveDuration", 5:archiveDuration, 6:"desiredSceneStartTime", 7:desiredSceneStartTime, 8:"desiredSceneEndTime", 9:desiredSceneEndTime, 10:"playerCount", 11:level.players.size, 12:"tickRate", 13:int(1 / level.framedurationseconds), 14:"dedi", 15:ter_op(isdedicatedserver(), 1, 0), 16:"version", 17:0]);
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3369
// Size: 0x39
function debug_watcharchivesize(var_1ef6de18f8155949, scene) {
    requesttime = gettime();
    thread debug_watcharchivefinished(requesttime, var_1ef6de18f8155949, scene);
    thread debug_watcharchiveinterrupted(requesttime, scene);
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33a9
// Size: 0x7a
function debug_watcharchivefinished(requesttime, var_1ef6de18f8155949, scene) {
    level notify("watching_potg_archive_request");
    level endon("watching_potg_archive_request");
    if (getdvarint(@"hash_1354f825daa8fdd3") == 0) {
        return;
    }
    while (1) {
        var_d944740cb0dc50da = getpotgstarttime();
        if (var_d944740cb0dc50da != var_1ef6de18f8155949) {
            level notify("potg_archive_request_finished");
            debug_logarchiveresult(1, scene, requesttime, var_d944740cb0dc50da, getpotgduration());
            break;
        }
        waitframe();
    }
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x342a
// Size: 0x2d
function debug_watcharchiveinterrupted(requesttime, scene) {
    level endon("potg_archive_request_finished");
    level waittill("watching_potg_archive_request");
    debug_logarchiveresult(0, scene, requesttime);
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x345e
// Size: 0x13f
function debug_logarchiveresult(result, scene, requesttime, var_ceaae222a63f4928, var_f94bf66afa95e4b7) {
    if (result) {
        thread datalog_archivesaved(requesttime, var_ceaae222a63f4928, var_f94bf66afa95e4b7, scene.playbackstarttime, scene.playbackendtime);
    }
    /#
        println("<unknown string>");
        println("<unknown string>" + ter_op(result, "<unknown string>", "<unknown string>"));
        println("<unknown string>" + requesttime);
        println("<unknown string>" + gettime() - requesttime);
        if (result) {
            println("<unknown string>" + var_ceaae222a63f4928);
            println("<unknown string>" + var_f94bf66afa95e4b7);
            println("<unknown string>" + scene.playbackendtime - scene.playbackstarttime);
            println("<unknown string>" + scene.playbackstarttime);
            println("<unknown string>" + scene.playbackendtime);
            println("<unknown string>" + var_ceaae222a63f4928 - scene.playbackstarttime);
            println("<unknown string>" + scene.playbackendtime - var_ceaae222a63f4928 + var_f94bf66afa95e4b7);
        }
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x35a4
// Size: 0x6b
function debug_print(text, entity) {
    /#
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        var_b75710d62f6cc8c5 = function_b5fc4169a40984f4(entity);
        if (var_b75710d62f6cc8c5 != "<unknown string>") {
            var_b75710d62f6cc8c5 = "<unknown string>" + var_b75710d62f6cc8c5 + "<unknown string>";
        }
        println("<unknown string>" + var_b75710d62f6cc8c5 + "<unknown string>" + text);
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3616
// Size: 0x64
function function_b5fc4169a40984f4(entity) {
    /#
        var_b75710d62f6cc8c5 = "<unknown string>";
        if (isdefined(entity) && isent(entity)) {
            id = getentityid(entity);
            if (isplayer(entity)) {
                var_b75710d62f6cc8c5 = entity.name;
            } else {
                var_b75710d62f6cc8c5 = "<unknown string>" + id;
            }
        }
        return var_b75710d62f6cc8c5;
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3681
// Size: 0x3a
function function_931a8f6e47923a14(entity, registered) {
    /#
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        debug_print("<unknown string>" + registered, entity);
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x36c2
// Size: 0x6a
function function_4f8540de8b6894db(entity, var_fd855f8b83c74f59) {
    /#
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        filterid = getdvarint(@"hash_c50427c6f2e00c08", -1);
        if (filterid != -1 && getentityid(entity) != filterid) {
            return;
        }
        debug_print("<unknown string>" + var_fd855f8b83c74f59, entity);
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3733
// Size: 0x26
function function_58af25849b7e7eee() {
    /#
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        debug_print("<unknown string>");
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3760
// Size: 0xb1
function function_89e809869ae732cc(entity, eventref, var_29728d2a6ecae1c7, starttime, endtime) {
    /#
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        filterid = getdvarint(@"hash_c50427c6f2e00c08", -1);
        if (filterid != -1 && getentityid(entity) != filterid) {
            return;
        }
        if (function_d03495fe6418377b(eventref)) {
            eventref = function_3c8848a3a11b2553(eventref);
        }
        debug_print("<unknown string>" + eventref + "<unknown string>" + var_29728d2a6ecae1c7 + "<unknown string>" + starttime + "<unknown string>" + endtime + "<unknown string>", entity);
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3818
// Size: 0xa2
function function_db2034a316b2f949(entity, score, var_485602f85c3b72fa) {
    /#
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        filterid = getdvarint(@"hash_c50427c6f2e00c08", -1);
        if (filterid != -1 && getentityid(entity) != filterid) {
            return;
        }
        debug_print("<unknown string>", entity);
        debug_print("<unknown string>" + score, entity);
        debug_print("<unknown string>" + getbestpotgscore(), entity);
        debug_print("<unknown string>" + var_485602f85c3b72fa, entity);
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x38c1
// Size: 0xf1
function function_2f99c1774457a61a(entity, scene, reason) {
    /#
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        filterid = getdvarint(@"hash_c50427c6f2e00c08", -1);
        if (filterid != -1 && getentityid(entity) != filterid) {
            return;
        }
        debug_print("<unknown string>" + scene.sceneid + "<unknown string>" + reason, entity);
        debug_print("<unknown string>" + scene.score, entity);
        debug_print("<unknown string>" + getbestpotgscore(), entity);
        debug_print("<unknown string>" + scene.events.size, entity);
        function_14c0539b7a4ff13a(scene);
        function_b4ccc30f6252a635(scene.events);
        debug_print("<unknown string>");
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x39b9
// Size: 0x90
function function_6d136a77e61ca284(scene, text) {
    /#
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        filterid = getdvarint(@"hash_c50427c6f2e00c08", -1);
        if (filterid != -1 && getentityid(scene.primaryentity) != filterid) {
            return;
        }
        debug_print("<unknown string>" + scene.sceneid + "<unknown string>" + text, scene.primaryentity);
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a50
// Size: 0x93
function function_eab0b74dcbef7e9c(scene) {
    /#
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        debug_print("<unknown string>" + scene.sceneid + "<unknown string>" + scene.score + "<unknown string>" + function_b5fc4169a40984f4(scene.primaryentity));
        function_81d753db205136b6(scene);
        function_14c0539b7a4ff13a(scene);
        function_b4ccc30f6252a635(scene.events);
        debug_print("<unknown string>");
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3aea
// Size: 0x93
function function_434562c57a231693(scene) {
    /#
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        debug_print("<unknown string>" + scene.sceneid + "<unknown string>" + scene.score + "<unknown string>" + function_b5fc4169a40984f4(scene.primaryentity));
        function_81d753db205136b6(scene);
        function_14c0539b7a4ff13a(scene);
        function_b4ccc30f6252a635(scene.events);
        debug_print("<unknown string>");
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b84
// Size: 0x123
function function_81d753db205136b6(scene) {
    /#
        debug_print("<unknown string>" + scene.playbackstarttime);
        debug_print("<unknown string>" + scene.playbackendtime);
        debug_print("<unknown string>" + scene.playbackendtime - scene.playbackstarttime);
        debug_print("<unknown string>" + scene.actionstarttime);
        debug_print("<unknown string>" + scene.actionendtime);
        debug_print("<unknown string>" + scene.actionendtime - scene.actionstarttime);
        debug_print("<unknown string>" + scene.actionstarttime - scene.playbackstarttime);
        debug_print("<unknown string>" + scene.playbackendtime - scene.actionendtime);
        debug_print("<unknown string>" + scene.actionendtime - scene.playbackstarttime);
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3cae
// Size: 0x82
function function_14c0539b7a4ff13a(scene) {
    /#
        if (!function_acab8b716476b589()) {
            return;
        }
        debug_print("<unknown string>" + function_3c8848a3a11b2553(array_get_first_item(scene.events).eventref));
        debug_print("<unknown string>" + function_c488370b61042846(scene.primaryentity));
        debug_print("<unknown string>" + function_4ed25b1ffc14d7a8(scene.primaryentity));
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d37
// Size: 0x122
function function_b4ccc30f6252a635(events) {
    /#
        debug_print("<unknown string>");
        foreach (event in events) {
            eventref = event.eventref;
            if (function_acab8b716476b589()) {
                if (function_f6c9a415f86697af(eventref) == 1) {
                    debug_print("<unknown string>" + function_3c8848a3a11b2553(eventref) + "<unknown string>" + event.score + "<unknown string>");
                } else {
                    debug_print("<unknown string>" + function_3c8848a3a11b2553(eventref) + "<unknown string>" + event.score + "<unknown string>" + "<unknown string>" + function_f6c9a415f86697af(eventref) + "<unknown string>");
                }
            } else {
                debug_print("<unknown string>" + eventref + "<unknown string>" + event.score + "<unknown string>");
            }
        }
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e60
// Size: 0x37
function function_6e0f018a9e890127(waittime) {
    /#
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        debug_print("<unknown string>" + waittime + "<unknown string>");
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e9e
// Size: 0x3d
function function_1483fe96ec345b56(var_70cc693025693d44) {
    /#
        if (getdvarint(@"hash_ffd4a481b33d985a") == 0) {
            return;
        }
        debug_print("<unknown string>" + var_70cc693025693d44 / 1000 + "<unknown string>");
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ee2
// Size: 0x17b
function function_a7465123c4bb2ec5() {
    /#
        level endon("<unknown string>");
        self endon("<unknown string>");
        self.var_2790de63f699069b = [];
        self.var_649bd2548fcd09fb = [];
        self.var_547a5f5c78feb97e = 0;
        if (isai(self)) {
            return;
        }
        while (1) {
            if (getdvarint(@"hash_c2407250e6c4bbbc") == 1 && self ishost()) {
                foreach (id, time in self.var_649bd2548fcd09fb) {
                    if (gettime() - time > 5000) {
                        self.var_649bd2548fcd09fb[id] = undefined;
                        self.var_2790de63f699069b[id] = undefined;
                    }
                }
                var_1703e3622ae7da70 = int(min(10, self.var_2790de63f699069b.size));
                if (var_1703e3622ae7da70 > 0) {
                    startid = self.var_547a5f5c78feb97e - 1;
                    endid = int(max(0, startid - var_1703e3622ae7da70 - 1));
                    var_354cbe170c838c81 = 400;
                    for (id = startid; id >= endid; id--) {
                        printtoscreen2d(100, var_354cbe170c838c81, self.var_2790de63f699069b[id], (1, 0.5, 0.7), 1.5);
                        var_354cbe170c838c81 = var_354cbe170c838c81 + 20;
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace potg/namespace_ab70c875589b8f6a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4064
// Size: 0x90
function function_7fe17c62b2ba41a2(eventref) {
    /#
        dvarvalue = getdvarint(@"hash_c2407250e6c4bbbc");
        if (function_d03495fe6418377b(eventref)) {
            eventref = function_3c8848a3a11b2553(eventref);
        }
        if (dvarvalue == 1) {
            self.var_2790de63f699069b[self.var_547a5f5c78feb97e] = eventref;
            self.var_649bd2548fcd09fb[self.var_547a5f5c78feb97e] = gettime();
            self.var_547a5f5c78feb97e++;
        } else if (dvarvalue == 2) {
            self iprintln("<unknown string>" + eventref);
        }
    #/
}

