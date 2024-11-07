#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\stealth\callbacks.gsc;
#using scripts\stealth\debug.gsc;
#using scripts\asm\asm.gsc;
#using scripts\stealth\utility.gsc;

#namespace event;

// Namespace event / scripts\stealth\event
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17b
// Size: 0x13
function event_init_entity() {
    thread event_listener_thread();
    self function_4cd0eaf5381f92db(1);
}

// Namespace event / scripts\stealth\event
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x196
// Size: 0x93
function event_init_level() {
    if (!isdefined(level.stealth.event_priority)) {
        level.stealth.event_priority = [];
    }
    level.stealth.event_priority["investigate"] = 0;
    level.stealth.event_priority["cover_blown"] = 1;
    level.stealth.event_priority["combat"] = 2;
    level scripts\stealth\utility::set_stealth_func("broadcast", &event_broadcast_generic);
}

// Namespace event / scripts\stealth\event
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x231
// Size: 0xb8
function event_severity_compare(var_e1b6af8308ee295d, var_e1b6ac8308ee22c4) {
    assert(isdefined(level.stealth));
    assert(isdefined(level.stealth.event_priority));
    assert(isdefined(level.stealth.event_priority[var_e1b6af8308ee295d]));
    assert(isdefined(level.stealth.event_priority[var_e1b6ac8308ee22c4]));
    result = level.stealth.event_priority[var_e1b6af8308ee295d] - level.stealth.event_priority[var_e1b6ac8308ee22c4];
    return result;
}

// Namespace event / scripts\stealth\event
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f2
// Size: 0xe0
function event_severity_shift(severity, direction) {
    assert(isdefined(level.stealth));
    assert(isdefined(level.stealth.event_priority));
    assert(isdefined(level.stealth.event_priority[severity]));
    priority = level.stealth.event_priority[severity] + direction;
    foreach (priorityval in level.stealth.event_priority) {
        if (priorityval == priority) {
            return var_9339b42bbf1c7735;
        }
    }
    return severity;
}

// Namespace event / scripts\stealth\event
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3db
// Size: 0x179
function event_severity_set(severity, eventname, escalation, var_6e7a5f49fca478a9, var_691d20c978d21cd1) {
    assert(!(severity == "cover_blown" && isdefined(var_691d20c978d21cd1)));
    assert(!(severity == "combat" && isdefined(escalation)));
    if (!isdefined(escalation)) {
        escalation = 0;
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
    level.stealth.event_escalation[eventname] = escalation;
    level.stealth.event_escalation_scalars[eventname] = var_6e7a5f49fca478a9;
    level.stealth.event_escalation_to_combat[eventname] = var_691d20c978d21cd1;
}

// Namespace event / scripts\stealth\event
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x55c
// Size: 0x11
function event_severity_get(eventname) {
    return function_df4360488e5c458e(eventname);
}

// Namespace event / scripts\stealth\event
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x576
// Size: 0x1a
function event_escalation_get(eventname, aient) {
    return function_9846f68b2edd52d5(eventname, aient);
}

// Namespace event / scripts\stealth\event
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x599
// Size: 0x1a
function event_escalation_scalar_get(eventname, aient) {
    return function_1473e5c0181c7ad0(eventname, aient);
}

// Namespace event / scripts\stealth\event
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5bc
// Size: 0x1a
function event_escalation_to_combat_get(eventname, aient) {
    return function_67fee9f22662295c(eventname, aient);
}

// Namespace event / scripts\stealth\event
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5df
// Size: 0x1a
function function_ce9fdd8d28d5d8dd(eventname, aient) {
    return function_63c101c16f5f40be(eventname, aient);
}

// Namespace event / scripts\stealth\event
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x602
// Size: 0x23
function event_escalation_clear() {
    self.stealth.event_escalation_count = undefined;
    self.event_escalation_scalar = 0;
}

// Namespace event / scripts\stealth\event
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x62d
// Size: 0x102
function function_1f4d13d0f711ba69(event, eventhandled) {
    if (isdefined(level.var_1a6c1600565c49a)) {
        thread [[ level.var_1a6c1600565c49a ]](event);
    }
    /#
        if (function_1d0abf2c82b32237() == -1 || function_1d0abf2c82b32237() == self getentitynumber()) {
            if (isdefined(eventhandled) && eventhandled) {
                if (debug_enabled()) {
                    typeorig = "<dev string:x1c>";
                    if (isdefined(event.typeorig)) {
                        typeorig = "<dev string:x1d>" + event.typeorig + "<dev string:x20>";
                    }
                    event_str = "<dev string:x22>" + event.type + typeorig;
                    thread function_55f9cd7d60a115bb(event_str, (1, 1, 1), 1, 0.5, (0, 0, 40), 4);
                }
                self.stealth.ai_event = event.type;
            }
        }
    #/
}

// Namespace event / scripts\stealth\event
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x737
// Size: 0x12f
function event_listener_thread() {
    self notify("event_listener_thread");
    self endon("event_listener_thread");
    self endon("death");
    filterexclusions = ["footstep", "footstep_sprint", "footstep_walk", "swim", "swim_sprint", "silenced_shot_impact", "gunshot_impact"];
    while (true) {
        ent_flag_wait("stealth_enabled");
        self waittill("ai_events", events);
        if (!ent_flag("stealth_enabled")) {
            continue;
        }
        if (self.ignoreall || self isragdoll()) {
            continue;
        }
        highestpriority = 0;
        foreach (event in events) {
            if (!isdefined(event.entity)) {
                continue;
            }
            if (istrue(event.var_f049a0914f8eeb8a)) {
                function_1f4d13d0f711ba69(event, 1);
            }
        }
    }
}

// Namespace event / scripts\stealth\event
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x86e
// Size: 0x3b
function entity_is_approved(entity) {
    switch (entity.classname) {
    case #"hash_adbcc9c8e4f8d955":
        return 1;
    default:
        return 0;
    }
}

// Namespace event / scripts\stealth\event
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x8b1
// Size: 0x1f6
function event_broadcast_axis(eventtype, eventtypeperipheral, enemy, rangeauto, rangesight) {
    ais = getaiunittypearray("bad_guys", "all");
    var_b2e38cd9c1e056a5 = squared(rangeauto);
    var_6292d181cc8b8f1b = squared(rangesight);
    myteam = self.team;
    if (!isdefined(myteam)) {
        myteam = self.agentteam;
    }
    assert(isdefined(myteam));
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
            if (ai scripts\stealth\utility::is_visible(self) || ai scripts\stealth\utility::is_visible(enemy)) {
                broadcast = 1;
            }
        }
        if (ai [[ ai.fnisinstealthcombat ]]()) {
            if (broadcast) {
                ai getenemyinfo(enemy);
            }
            continue;
        }
        if (broadcast) {
            if (var_291d5eed4387426d && ai lastknowntime(enemy) == 0) {
                ai aieventlistenerevent(eventtype, enemy, self.origin);
                continue;
            }
            ai aieventlistenerevent(eventtype, enemy, enemy.origin);
        }
    }
}

// Namespace event / scripts\stealth\event
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xaaf
// Size: 0x101
function event_broadcast_generic(eventtype, eventposition, eventradius, evententity, teamsoverride) {
    ais = [];
    if (isarray(teamsoverride)) {
        ais = getaiarrayinradius(eventposition, eventradius, teamsoverride);
    } else {
        ais = getaiunittypearray("bad_guys");
    }
    if (!isdefined(evententity)) {
        evententity = level.player;
    }
    var_b2e38cd9c1e056a5 = squared(eventradius);
    foreach (ai in ais) {
        if (!isalive(ai)) {
            continue;
        }
        if (!isdefined(ai.stealth)) {
            continue;
        }
        if (distancesquared(ai.origin, eventposition) <= var_b2e38cd9c1e056a5) {
            ai aieventlistenerevent(eventtype, evententity, eventposition);
        }
    }
}

// Namespace event / scripts\stealth\event
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xbb8
// Size: 0x157
function event_broadcast_axis_by_tacsight(eventtype, enemy, eventposition, eventradius, var_be714c91530ba6ca, tacposition, var_81a2fb4f638bbce8) {
    ais = getaiunittypearray("bad_guys", "all");
    cradiussq = eventradius * eventradius;
    if (!isdefined(var_be714c91530ba6ca)) {
        var_be714c91530ba6ca = 1;
    }
    var_8dfd9c1cb37614b0 = undefined;
    if (isdefined(var_81a2fb4f638bbce8)) {
        var_8dfd9c1cb37614b0 = var_81a2fb4f638bbce8 * var_81a2fb4f638bbce8;
    }
    if (!isdefined(tacposition)) {
        tacposition = eventposition;
    }
    foreach (ai in ais) {
        if (!isalive(ai)) {
            continue;
        }
        if (!isdefined(ai.stealth)) {
            continue;
        }
        var_dbb6869e366c8aa4 = distancesquared(ai.origin, eventposition);
        if (var_dbb6869e366c8aa4 > cradiussq) {
            continue;
        }
        var_771837493a52b2f7 = var_be714c91530ba6ca;
        if (var_be714c91530ba6ca && isdefined(var_8dfd9c1cb37614b0) && var_dbb6869e366c8aa4 <= var_8dfd9c1cb37614b0) {
            var_771837493a52b2f7 = 0;
        }
        if (!ai hastacvis(tacposition, var_771837493a52b2f7)) {
            continue;
        }
        ai aieventlistenerevent(eventtype, enemy, eventposition);
    }
}

// Namespace event / scripts\stealth\event
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xd17
// Size: 0x4b
function event_broadcast_axis_by_sight(eventtype, enemy, eventposition, eventradius, var_be714c91530ba6ca, tacposition, autorange) {
    thread event_broadcast_axis_by_sight_thread(eventtype, enemy, eventposition, eventradius, var_be714c91530ba6ca, tacposition, autorange);
}

// Namespace event / scripts\stealth\event
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xd6a
// Size: 0x197
function event_broadcast_axis_by_sight_thread(eventtype, enemy, eventposition, eventradius, var_be714c91530ba6ca, tacposition, autorange) {
    ais = getaiunittypearray("bad_guys", "all");
    cradiussq = eventradius * eventradius;
    if (!isdefined(var_be714c91530ba6ca)) {
        var_be714c91530ba6ca = 1;
    }
    if (!isdefined(tacposition)) {
        tacposition = eventposition;
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
        distsq = distancesquared(ai.origin, eventposition);
        if (distsq > cradiussq) {
            continue;
        }
        if (isdefined(autorange) && distsq <= autorange * autorange) {
            ai aieventlistenerevent(eventtype, enemy, eventposition);
            continue;
        }
        if (!ai hastacvis(tacposition, var_be714c91530ba6ca)) {
            if (var_be714c91530ba6ca && !ai aipointinfov(eventposition)) {
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
            if (!sighttracepassed(ai geteye(), eventposition, 0, enemy)) {
                continue;
            }
        }
        ai aieventlistenerevent(eventtype, enemy, eventposition);
    }
}

// Namespace event / scripts\stealth\event
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf09
// Size: 0x10
function function_1d0abf2c82b32237() {
    return getdvarint(@"ai_debugentindex");
}

