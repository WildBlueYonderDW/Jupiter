// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_66e927a1c37cda66;
#using script_6ef052b7d38465d9;

#namespace analytics;

// Namespace analytics/namespace_11c0583894ef486f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2
// Size: 0x40
function init() {
    if (0) {
        return;
    }
    flag_set("analytics");
    level.delayedeventtypes = [];
    if (1) {
        analyticsreset();
    }
    namespace_5b79e0098b7edf4d::init();
    namespace_30101e0cca498f6::init();
    level thread onendgame();
}

// Namespace analytics/namespace_11c0583894ef486f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x129
// Size: 0x3e
function function_90ab35efc8f0fb46(info, var_80ed4d4a2aaf5d44) {
    if (isdedicatedserver()) {
        setdvar(@"hash_bd87b6ef2da571db", info);
    }
    if (istrue(var_80ed4d4a2aaf5d44)) {
        logstring("[KEY_MOMENT] " + info);
    }
}

// Namespace analytics/namespace_11c0583894ef486f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e
// Size: 0x14
function function_2c6779a0712ad84f() {
    time = gettime();
    return time;
}

// Namespace analytics/namespace_11c0583894ef486f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a
// Size: 0xad
function function_b8b443d92560ecf4(type, origin, state, time, data, entnum) {
    if (!isdefined(data) || !isstring(data)) {
        data = "";
    }
    if (1) {
        analyticsaddevent(origin, type, state, time, data, entnum);
    }
    if (0 && type != "breadcrumb") {
        logstring("[GAE]," + time + "," + entnum + "," + origin[0] + "," + origin[1] + "," + type + "," + state + "," + data);
    }
}

// Namespace analytics/namespace_11c0583894ef486f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23e
// Size: 0x9b
function function_bf23e005e136dc90(type, origin, state, data, ent) {
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
        ent function_d01eb75af2ead3d1(time);
    }
}

// Namespace analytics/namespace_11c0583894ef486f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e0
// Size: 0x34
function function_e18f9b7e01cd916f(type, ent) {
    if (!isdefined(ent)) {
        return;
    }
    function_bf23e005e136dc90(type, ent.origin, 0, "", ent);
}

// Namespace analytics/namespace_11c0583894ef486f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31b
// Size: 0x40
function function_a569c60476357392(type, ent, state, data) {
    if (!isdefined(ent)) {
        return;
    }
    function_bf23e005e136dc90(type, ent.origin, state, data, ent);
}

// Namespace analytics/namespace_11c0583894ef486f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x362
// Size: 0x109
function function_82ffbfa82a26d37e(type, origin, ent, data) {
    /#
        assert(isdefined(level.delayedeventtypes));
    #/
    /#
        assert(isdefined(type));
    #/
    /#
        assert(isdefined(origin));
    #/
    /#
        assert(isdefined(ent));
    #/
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
    var_fcf163e2db91eba2 = level.delayedeventtypes[type].size;
    level.delayedeventtypes[type][var_fcf163e2db91eba2] = evt;
}

// Namespace analytics/namespace_11c0583894ef486f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x472
// Size: 0xc6
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

// Namespace analytics/namespace_11c0583894ef486f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53f
// Size: 0xe8
function onendgame() {
    level waittill("start_game_ended");
    foreach (var_bafef05479604422 in level.delayedeventtypes) {
        foreach (var_ce203d78f57223de in var_bafef05479604422) {
            function_b8b443d92560ecf4(var_ce203d78f57223de.type, var_ce203d78f57223de.origin, var_ce203d78f57223de.state, var_ce203d78f57223de.time, var_ce203d78f57223de.data, -1);
        }
    }
    if (1) {
        analyticswritecsv();
    }
}

// Namespace analytics/namespace_11c0583894ef486f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62e
// Size: 0x1c
function function_3eb0a74e7ece96f9() {
    if (isplayer(self)) {
        return 1;
    }
    if (isagent(self)) {
        return 1;
    }
    return 0;
}

// Namespace analytics/namespace_11c0583894ef486f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x652
// Size: 0x12f
function function_5c0639c941555983() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    entnum = self getentitynumber();
    state = 0;
    data = "";
    nextstate = 0;
    var_a81180fe2df07c44 = "";
    while (1) {
        wait(30);
        if (!isalive(self)) {
            continue;
        }
        if (isagent(self)) {
            if (isdefined(self.enemy)) {
                nextstate = self.enemy getentitynumber();
            } else {
                nextstate = 0;
            }
            if (isdefined(self.var_f8bc7ecdd324dd79)) {
                var_a81180fe2df07c44 = self.var_f8bc7ecdd324dd79.behavior;
            } else {
                var_a81180fe2df07c44 = "";
            }
        }
        time = function_2c6779a0712ad84f();
        if (self.var_d5c444a3fbb7d030 < time - 30 || state != nextstate || data != var_a81180fe2df07c44) {
            self.var_d5c444a3fbb7d030 = time;
            state = nextstate;
            data = var_a81180fe2df07c44;
            function_b8b443d92560ecf4("breadcrumb", self.origin, state, time, data, entnum);
        }
    }
}

// Namespace analytics/namespace_11c0583894ef486f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x788
// Size: 0x42
function function_d01eb75af2ead3d1(time) {
    if (!function_3eb0a74e7ece96f9()) {
        return;
    }
    if (!isdefined(self.var_d5c444a3fbb7d030)) {
        self.var_d5c444a3fbb7d030 = time;
        thread function_5c0639c941555983();
    } else {
        self.var_d5c444a3fbb7d030 = time;
    }
}

