// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace callbacks;

// Namespace callbacks/namespace_1be3576f1131ba20
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c7
// Size: 0xd5
function init_callbacks() {
    level.global_callbacks = [];
    foreach (callback in [0:"_autosave_stealthcheck", 1:"_patrol_endon_spotted_flag", 2:"_spawner_stealth_default", 3:"_idle_call_idle_func"]) {
        level.global_callbacks[callback] = &global_empty_callback;
    }
    if (!flag_exist("stealth_spotted")) {
        flag_init("stealth_spotted");
    }
    if (!flag_exist("stealth_enabled")) {
        flag_init("stealth_enabled");
    }
    if (!flag_exist("stealth_music_pause")) {
        flag_init("stealth_music_pause");
    }
}

// Namespace callbacks/namespace_1be3576f1131ba20
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a3
// Size: 0x3a
function global_empty_callback(var_c925170ba48d0111, var_c925140ba48cfa78, var_c925150ba48cfcab, var_c9251a0ba48d07aa, var_c9251b0ba48d09dd) {
    /#
        assertmsg("a _stealth or _idle related function was called in a global script without being initilized by the stealth system.  If you've already initilized those scripts, then this is a bug for Mo.");
    #/
}

// Namespace callbacks/namespace_1be3576f1131ba20
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e4
// Size: 0x9d
function stealth_get_func(type) {
    if (isdefined(self.stealth) && isdefined(self.stealth.funcs) && isdefined(self.stealth.funcs[type])) {
        return self.stealth.funcs[type];
    }
    if (isdefined(level.stealth) && isdefined(level.stealth.funcs)) {
        return level.stealth.funcs[type];
    }
    return undefined;
}

// Namespace callbacks/namespace_1be3576f1131ba20
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x389
// Size: 0x87
function stealth_call(type, parm1, parm2, parm3, parm4) {
    func = stealth_get_func(type);
    if (isdefined(func)) {
        if (isdefined(parm4)) {
            return self [[ func ]](parm1, parm2, parm3, parm4);
        } else if (isdefined(parm3)) {
            return self [[ func ]](parm1, parm2, parm3);
        } else if (isdefined(parm2)) {
            return self [[ func ]](parm1, parm2);
        } else if (isdefined(parm1)) {
            return self [[ func ]](parm1);
        } else {
            return self [[ func ]]();
        }
    }
    return undefined;
}

// Namespace callbacks/namespace_1be3576f1131ba20
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x418
// Size: 0x8c
function stealth_call_thread(type, parm1, parm2, parm3, parm4) {
    func = stealth_get_func(type);
    if (isdefined(func)) {
        if (isdefined(parm4)) {
            return self thread [[ func ]](parm1, parm2, parm3, parm4);
        } else if (isdefined(parm3)) {
            return self thread [[ func ]](parm1, parm2, parm3);
        } else if (isdefined(parm2)) {
            return self thread [[ func ]](parm1, parm2);
        } else if (isdefined(parm1)) {
            return self thread [[ func ]](parm1);
        } else {
            return self thread [[ func ]]();
        }
    }
    return undefined;
}

