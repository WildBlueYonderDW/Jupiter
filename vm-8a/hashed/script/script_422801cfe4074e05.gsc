#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_66e927a1c37cda66;
#using script_6ef052b7d38465d9;

#namespace analytics;

// Namespace analytics / namespace_11c0583894ef486f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2
// Size: 0x3f
function init() {
    if (false) {
        return;
    }
    flag_set("analytics");
    level.delayedeventtypes = [];
    if (true) {
        analyticsreset();
    }
    namespace_5b79e0098b7edf4d::init();
    namespace_30101e0cca498f6::init();
    level thread onendgame();
}

// Namespace analytics / namespace_11c0583894ef486f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x129
// Size: 0x3d
function function_90ab35efc8f0fb46(info, var_80ed4d4a2aaf5d44) {
    if (isdedicatedserver()) {
        setdvar(@"hash_bd87b6ef2da571db", info);
    }
    if (istrue(var_80ed4d4a2aaf5d44)) {
        logstring("[KEY_MOMENT] " + info);
    }
}

// Namespace analytics / namespace_11c0583894ef486f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e
// Size: 0x13
function function_2c6779a0712ad84f() {
    time = gettime();
    return time;
}

// Namespace analytics / namespace_11c0583894ef486f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a
// Size: 0xac
function function_b8b443d92560ecf4(type, origin, state, time, data, entnum) {
    if (!isdefined(data) || !isstring(data)) {
        data = "";
    }
    if (true) {
        analyticsaddevent(origin, type, state, time, data, entnum);
    }
    if (0 && type != "breadcrumb") {
        logstring("[GAE]," + time + "," + entnum + "," + origin[0] + "," + origin[1] + "," + type + "," + state + "," + data);
    }
}

// Namespace analytics / namespace_11c0583894ef486f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23e
// Size: 0x9a
function addevent(type, origin, state, data, ent) {
    if (!isdefined(origin)) {
        origin = (0, 0, 0);
    }
    if (!isdefined(state)) {
        state = 0;
    }
    if (!isdefined(data)) {
        data = "";
    }
    entnum = -1;
    if (isdefined(ent)) {
        entnum = ent getentitynumber();
    }
    time = function_2c6779a0712ad84f();
    function_b8b443d92560ecf4(type, origin, state, time, data, entnum);
    if (isdefined(ent)) {
        ent updatebreadcrumb(time);
    }
}

// Namespace analytics / namespace_11c0583894ef486f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e0
// Size: 0x33
function function_e18f9b7e01cd916f(type, ent) {
    if (!isdefined(ent)) {
        return;
    }
    addevent(type, ent.origin, 0, "", ent);
}

// Namespace analytics / namespace_11c0583894ef486f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31b
// Size: 0x3f
function function_a569c60476357392(type, ent, state, data) {
    if (!isdefined(ent)) {
        return;
    }
    addevent(type, ent.origin, state, data, ent);
}

// Namespace analytics / namespace_11c0583894ef486f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x362
// Size: 0x108
function function_82ffbfa82a26d37e(type, origin, ent, data) {
    assert(isdefined(level.delayedeventtypes));
    assert(isdefined(type));
    assert(isdefined(origin));
    assert(isdefined(ent));
    if (!isdefined(data)) {
        data = "";
    }
    if (!isdefined(level.delayedeventtypes[type])) {
        level.delayedeventtypes[type] = [];
    }
    evt = spawnstruct();
    evt.type = type;
    evt.origin = origin;
    evt.ent = ent;
    evt.data = data;
    evt.state = 0;
    evt.time = function_2c6779a0712ad84f();
    evtindex = level.delayedeventtypes[type].size;
    level.delayedeventtypes[type][evtindex] = evt;
}

// Namespace analytics / namespace_11c0583894ef486f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x472
// Size: 0xc5
function function_56c9bb1673c2ca(type, ent, state) {
    if (!isdefined(type) || !isdefined(ent) || !isdefined(level.delayedeventtypes) || !isdefined(level.delayedeventtypes[type])) {
        return;
    }
    foreach (evt in level.delayedeventtypes[type]) {
        if (evt.ent == ent) {
            evt.time = function_2c6779a0712ad84f();
            evt.state = state;
            return;
        }
    }
}

// Namespace analytics / namespace_11c0583894ef486f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53f
// Size: 0xe7
function onendgame() {
    level waittill("start_game_ended");
    foreach (typearray in level.delayedeventtypes) {
        foreach (ev in typearray) {
            function_b8b443d92560ecf4(ev.type, ev.origin, ev.state, ev.time, ev.data, -1);
        }
    }
    if (true) {
        analyticswritecsv();
    }
}

// Namespace analytics / namespace_11c0583894ef486f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62e
// Size: 0x1b
function function_3eb0a74e7ece96f9() {
    if (isplayer(self)) {
        return true;
    }
    if (isagent(self)) {
        return true;
    }
    return false;
}

// Namespace analytics / namespace_11c0583894ef486f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x652
// Size: 0x12e
function function_5c0639c941555983() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    entnum = self getentitynumber();
    state = 0;
    data = "";
    nextstate = 0;
    nextdata = "";
    while (true) {
        wait 30;
        if (!isalive(self)) {
            continue;
        }
        if (isagent(self)) {
            if (isdefined(self.enemy)) {
                nextstate = self.enemy getentitynumber();
            } else {
                nextstate = 0;
            }
            if (isdefined(self.behaviorpackage)) {
                nextdata = self.behaviorpackage.behavior;
            } else {
                nextdata = "";
            }
        }
        time = function_2c6779a0712ad84f();
        if (self.var_d5c444a3fbb7d030 < time - 30 || state != nextstate || data != nextdata) {
            self.var_d5c444a3fbb7d030 = time;
            state = nextstate;
            data = nextdata;
            function_b8b443d92560ecf4("breadcrumb", self.origin, state, time, data, entnum);
        }
    }
}

// Namespace analytics / namespace_11c0583894ef486f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x788
// Size: 0x41
function updatebreadcrumb(time) {
    if (!function_3eb0a74e7ece96f9()) {
        return;
    }
    if (!isdefined(self.var_d5c444a3fbb7d030)) {
        self.var_d5c444a3fbb7d030 = time;
        thread function_5c0639c941555983();
        return;
    }
    self.var_d5c444a3fbb7d030 = time;
}

