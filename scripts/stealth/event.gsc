// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\stealth\callbacks.gsc;
#using scripts\stealth\debug.gsc;
#using scripts\asm\asm.gsc;
#using scripts\stealth\utility.gsc;

#namespace event;

// Namespace event/namespace_92d413b0c411a750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b
// Size: 0x14
function event_init_entity() {
    thread event_listener_thread();
    self function_4cd0eaf5381f92db(1);
}

// Namespace event/namespace_92d413b0c411a750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x196
// Size: 0x94
function event_init_level() {
    if (!isdefined(level.stealth.event_priority)) {
        level.stealth.event_priority = [];
    }
    level.stealth.event_priority["investigate"] = 0;
    level.stealth.event_priority["cover_blown"] = 1;
    level.stealth.event_priority["combat"] = 2;
    level namespace_e124d8b75dab4be0::set_stealth_func("broadcast", &event_broadcast_generic);
}

// Namespace event/namespace_92d413b0c411a750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x231
// Size: 0xb9
function event_severity_compare(var_e1b6af8308ee295d, var_e1b6ac8308ee22c4) {
    /#
        assert(isdefined(level.stealth));
    #/
    /#
        assert(isdefined(level.stealth.event_priority));
    #/
    /#
        assert(isdefined(level.stealth.event_priority[var_e1b6af8308ee295d]));
    #/
    /#
        assert(isdefined(level.stealth.event_priority[var_e1b6ac8308ee22c4]));
    #/
    result = level.stealth.event_priority[var_e1b6af8308ee295d] - level.stealth.event_priority[var_e1b6ac8308ee22c4];
    return result;
}

// Namespace event/namespace_92d413b0c411a750
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f2
// Size: 0xe5
function event_severity_shift(severity, direction) {
    /#
        assert(isdefined(level.stealth));
    #/
    /#
        assert(isdefined(level.stealth.event_priority));
    #/
    /#
        assert(isdefined(level.stealth.event_priority[severity]));
    #/
    priority = level.stealth.event_priority[severity] + direction;
    foreach (var_9339b42bbf1c7735, var_96bc11f18055bc8c in level.stealth.event_priority) {
        if (var_96bc11f18055bc8c == priority) {
            return var_9339b42bbf1c7735;
        }
    }
    return severity;
}

// Namespace event/namespace_92d413b0c411a750
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3df
// Size: 0x17a
function event_severity_set(severity, eventname, var_a3a9959b0a31f7bc, var_6e7a5f49fca478a9, var_691d20c978d21cd1) {
    /#
        assert(!(severity == "cover_blown" && isdefined(var_691d20c978d21cd1)));
    #/
    /#
        assert(!(severity == "combat" && isdefined(var_a3a9959b0a31f7bc)));
    #/
    if (!isdefined(var_a3a9959b0a31f7bc)) {
        var_a3a9959b0a31f7bc = 0;
    }
    if (!isdefined(var_6e7a5f49fca478a9)) {
        var_6e7a5f49fca478a9 = 0;
    }
    if (!isdefined(level.stealth.event_severity)) {
        level.stealth.event_severity = [];
    }
    if (!isdefined(level.stealth.event_escalation)) {
        level.stealth.event_escalation = [];
    }
    if (!isdefined(level.stealth.event_escalation_scalars)) {
        level.stealth.event_escalation_scalars = [];
    }
    if (!isdefined(level.stealth.event_escalation_to_combat)) {
        level.stealth.event_escalation_to_combat = [];
    }
    level.stealth.event_severity[eventname] = severity;
    level.stealth.event_escalation[eventname] = var_a3a9959b0a31f7bc;
    level.stealth.event_escalation_scalars[eventname] = var_6e7a5f49fca478a9;
    level.stealth.event_escalation_to_combat[eventname] = var_691d20c978d21cd1;
}

// Namespace event/namespace_92d413b0c411a750
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x560
// Size: 0x12
function event_severity_get(eventname) {
    return function_df4360488e5c458e(eventname);
}

// Namespace event/namespace_92d413b0c411a750
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x57a
// Size: 0x1b
function event_escalation_get(eventname, aient) {
    return function_9846f68b2edd52d5(eventname, aient);
}

// Namespace event/namespace_92d413b0c411a750
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x59d
// Size: 0x1b
function event_escalation_scalar_get(eventname, aient) {
    return function_1473e5c0181c7ad0(eventname, aient);
}

// Namespace event/namespace_92d413b0c411a750
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5c0
// Size: 0x1b
function event_escalation_to_combat_get(eventname, aient) {
    return function_67fee9f22662295c(eventname, aient);
}

// Namespace event/namespace_92d413b0c411a750
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5e3
// Size: 0x1b
function function_ce9fdd8d28d5d8dd(eventname, aient) {
    return function_63c101c16f5f40be(eventname, aient);
}

// Namespace event/namespace_92d413b0c411a750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x606
// Size: 0x24
function event_escalation_clear() {
    self.stealth.event_escalation_count = undefined;
    self.event_escalation_scalar = 0;
}

// Namespace event/namespace_92d413b0c411a750
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x631
// Size: 0x103
function function_1f4d13d0f711ba69(event, var_f44aaaeedd6bf35b) {
    if (isdefined(level.var_1a6c1600565c49a)) {
        thread [[ level.var_1a6c1600565c49a ]](event);
    }
    /#
        if (function_1d0abf2c82b32237() == -1 || function_1d0abf2c82b32237() == self getentitynumber()) {
            if (isdefined(var_f44aaaeedd6bf35b) && var_f44aaaeedd6bf35b) {
                if (debug_enabled()) {
                    typeorig = "<unknown string>";
                    if (isdefined(event.typeorig)) {
                        typeorig = "<unknown string>" + event.typeorig + "<unknown string>";
                    }
                    event_str = "<unknown string>" + event.type + typeorig;
                    thread function_55f9cd7d60a115bb(event_str, (1, 1, 1), 1, 0.5, (0, 0, 40), 4);
                }
                self.stealth.ai_event = event.type;
            }
        }
    #/
}

// Namespace event/namespace_92d413b0c411a750
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73b
// Size: 0x134
function event_listener_thread() {
    self notify("event_listener_thread");
    self endon("event_listener_thread");
    self endon("death");
    var_8e9d5073bb8a9872 = [0:"footstep", 1:"footstep_sprint", 2:"footstep_walk", 3:"swim", 4:"swim_sprint", 5:"silenced_shot_impact", 6:"gunshot_impact"];
    while (1) {
        ent_flag_wait("stealth_enabled");
        events = self waittill("ai_events");
        if (!ent_flag("stealth_enabled")) {
            continue;
        }
        if (self.ignoreall || self isragdoll()) {
            continue;
        }
        var_ba0ae3f9f364b7f3 = 0;
        foreach (event in events) {
            if (!isdefined(event.entity)) {
                continue;
            }
            if (istrue(event.var_f049a0914f8eeb8a)) {
                function_1f4d13d0f711ba69(event, 1);
                continue;
            }
        }
    }
}

// Namespace event/namespace_92d413b0c411a750
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x876
// Size: 0x3c
function entity_is_approved(entity) {
    switch (entity.classname) {
    case #"hash_adbcc9c8e4f8d955":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace event/namespace_92d413b0c411a750
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x8b9
// Size: 0x1fb
function event_broadcast_axis(eventtype, var_ad9e88ad94128d67, enemy, var_448a418e975e9b01, var_6a01daab475b44ab) {
    ais = getaiunittypearray("bad_guys", "all");
    var_b2e38cd9c1e056a5 = squared(var_448a418e975e9b01);
    var_6292d181cc8b8f1b = squared(var_6a01daab475b44ab);
    myteam = self.team;
    if (!isdefined(myteam)) {
        myteam = self.agentteam;
    }
    /#
        assert(isdefined(myteam));
    #/
    var_291d5eed4387426d = issentient(enemy);
    foreach (ai in ais) {
        if (!isalive(ai)) {
            continue;
        }
        if (ai == self) {
            continue;
        }
        if (ai.team != myteam) {
            continue;
        }
        if (!isdefined(ai.stealth)) {
            continue;
        }
        broadcast = 0;
        distsq = distancesquared(ai.origin, self.origin);
        if (distsq <= var_b2e38cd9c1e056a5) {
            broadcast = self hastacvis(ai);
        }
        if (!broadcast && distsq <= var_6292d181cc8b8f1b) {
            if (ai namespace_e124d8b75dab4be0::is_visible(self) || ai namespace_e124d8b75dab4be0::is_visible(enemy)) {
                broadcast = 1;
            }
        }
        if (ai [[ ai.fnisinstealthcombat ]]()) {
            if (broadcast) {
                ai getenemyinfo(enemy);
            }
        } else if (broadcast) {
            if (var_291d5eed4387426d && ai lastknowntime(enemy) == 0) {
                ai aieventlistenerevent(eventtype, enemy, self.origin);
            } else {
                ai aieventlistenerevent(eventtype, enemy, enemy.origin);
            }
        }
    }
}

// Namespace event/namespace_92d413b0c411a750
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabb
// Size: 0x106
function event_broadcast_generic(eventtype, var_43f256778ac8f6a8, eventradius, var_f23a20b5d39dbf34, var_88a1fd55e85770e9) {
    ais = [];
    if (isarray(var_88a1fd55e85770e9)) {
        ais = getaiarrayinradius(var_43f256778ac8f6a8, eventradius, var_88a1fd55e85770e9);
    } else {
        ais = getaiunittypearray("bad_guys");
    }
    if (!isdefined(var_f23a20b5d39dbf34)) {
        var_f23a20b5d39dbf34 = level.player;
    }
    var_b2e38cd9c1e056a5 = squared(eventradius);
    foreach (ai in ais) {
        if (!isalive(ai)) {
            continue;
        }
        if (!isdefined(ai.stealth)) {
            continue;
        }
        if (distancesquared(ai.origin, var_43f256778ac8f6a8) <= var_b2e38cd9c1e056a5) {
            ai aieventlistenerevent(eventtype, var_f23a20b5d39dbf34, var_43f256778ac8f6a8);
        }
    }
}

// Namespace event/namespace_92d413b0c411a750
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xbc8
// Size: 0x15c
function event_broadcast_axis_by_tacsight(eventtype, enemy, var_43f256778ac8f6a8, eventradius, var_be714c91530ba6ca, var_33d9f922bb21c778, var_81a2fb4f638bbce8) {
    ais = getaiunittypearray("bad_guys", "all");
    var_29b1911eee2bcb5c = eventradius * eventradius;
    if (!isdefined(var_be714c91530ba6ca)) {
        var_be714c91530ba6ca = 1;
    }
    var_8dfd9c1cb37614b0 = undefined;
    if (isdefined(var_81a2fb4f638bbce8)) {
        var_8dfd9c1cb37614b0 = var_81a2fb4f638bbce8 * var_81a2fb4f638bbce8;
    }
    if (!isdefined(var_33d9f922bb21c778)) {
        var_33d9f922bb21c778 = var_43f256778ac8f6a8;
    }
    foreach (ai in ais) {
        if (!isalive(ai)) {
            continue;
        }
        if (!isdefined(ai.stealth)) {
            continue;
        }
        var_dbb6869e366c8aa4 = distancesquared(ai.origin, var_43f256778ac8f6a8);
        if (var_dbb6869e366c8aa4 > var_29b1911eee2bcb5c) {
            continue;
        }
        var_771837493a52b2f7 = var_be714c91530ba6ca;
        if (var_be714c91530ba6ca && isdefined(var_8dfd9c1cb37614b0) && var_dbb6869e366c8aa4 <= var_8dfd9c1cb37614b0) {
            var_771837493a52b2f7 = 0;
        }
        if (!ai hastacvis(var_33d9f922bb21c778, var_771837493a52b2f7)) {
            continue;
        }
        ai aieventlistenerevent(eventtype, enemy, var_43f256778ac8f6a8);
    }
}

// Namespace event/namespace_92d413b0c411a750
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xd2b
// Size: 0x4c
function event_broadcast_axis_by_sight(eventtype, enemy, var_43f256778ac8f6a8, eventradius, var_be714c91530ba6ca, var_33d9f922bb21c778, var_601d79340374bc27) {
    thread event_broadcast_axis_by_sight_thread(eventtype, enemy, var_43f256778ac8f6a8, eventradius, var_be714c91530ba6ca, var_33d9f922bb21c778, var_601d79340374bc27);
}

// Namespace event/namespace_92d413b0c411a750
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7e
// Size: 0x19c
function event_broadcast_axis_by_sight_thread(eventtype, enemy, var_43f256778ac8f6a8, eventradius, var_be714c91530ba6ca, var_33d9f922bb21c778, var_601d79340374bc27) {
    ais = getaiunittypearray("bad_guys", "all");
    var_29b1911eee2bcb5c = eventradius * eventradius;
    if (!isdefined(var_be714c91530ba6ca)) {
        var_be714c91530ba6ca = 1;
    }
    if (!isdefined(var_33d9f922bb21c778)) {
        var_33d9f922bb21c778 = var_43f256778ac8f6a8;
    }
    var_2068a3efd793afba = 3;
    var_c9787abb0668d729 = 0;
    foreach (ai in ais) {
        if (!isalive(ai)) {
            continue;
        }
        if (!isdefined(ai.stealth)) {
            continue;
        }
        distsq = distancesquared(ai.origin, var_43f256778ac8f6a8);
        if (distsq > var_29b1911eee2bcb5c) {
            continue;
        }
        if (isdefined(var_601d79340374bc27) && distsq <= var_601d79340374bc27 * var_601d79340374bc27) {
            ai aieventlistenerevent(eventtype, enemy, var_43f256778ac8f6a8);
        } else if (!ai hastacvis(var_33d9f922bb21c778, var_be714c91530ba6ca)) {
            if (var_be714c91530ba6ca && !ai aipointinfov(var_43f256778ac8f6a8)) {
                continue;
            }
            var_c9787abb0668d729++;
            if (var_c9787abb0668d729 > var_2068a3efd793afba) {
                waitframe();
                var_c9787abb0668d729 = 0;
                if (!isalive(ai)) {
                    continue;
                }
            }
            jumpiftrue(sighttracepassed(ai geteye(), var_43f256778ac8f6a8, 0, enemy)) LOC_0000017b;
        } else {
        LOC_0000017b:
            ai aieventlistenerevent(eventtype, enemy, var_43f256778ac8f6a8);
        }
    }
}

// Namespace event/namespace_92d413b0c411a750
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf21
// Size: 0x11
function function_1d0abf2c82b32237() {
    return getdvarint(@"hash_932e9550632df2cb");
}

