#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5d265b4fca61f070;

#namespace dialogue;

// Namespace dialogue / namespace_71a239de73c38174
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x4ac
// Size: 0x216
function say(alias, priority, timeout, overlap, delay, scope) {
    assertex(isstring(alias), "<dev string:x1c>");
    if (!soundexists(alias) && !function_c0af485270de3fbf(alias)) {
        /#
            iprintlnbold("<dev string:x3f>" + alias + "<dev string:x4c>");
        #/
        return 0;
    }
    self endon("death");
    priority = default_to(priority, 0);
    overlap = default_to(overlap, priority > 0);
    scope = default_to(scope, "self");
    assertex(scope == "<dev string:x5d>" || scope == "<dev string:x65>" || scope == "<dev string:x6d>", "<dev string:x77>");
    speaker = self;
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
        speaker.var_568a463dbba1469c = 1;
    }
    if (is_dead_or_dying(speaker) || istrue(speaker.vo_disabled) || istrue(level.vo_disabled)) {
        return 0;
    }
    assertex(scope != "<dev string:x65>" || isdefined(speaker.team), "<dev string:xb1>");
    if (isdefined(level.var_32ed4c64de33eaa6)) {
        function_4495922f7faaffe7(level.var_32ed4c64de33eaa6, alias);
        level.var_32ed4c64de33eaa6 = undefined;
    }
    vo_data = spawnstruct();
    vo_data.alias = alias;
    vo_data.priority = priority;
    vo_data.timeout = timeout;
    vo_data.overlap = overlap;
    vo_data.speaker = speaker;
    vo_data.scope = scope;
    vo_data.scope_ents = speaker function_28e38eefd3cc4ab();
    vo_data thread queue_say(speaker, alias, priority, timeout, overlap, delay);
    if (!istrue(vo_data.vo_done_or_cancelled)) {
        vo_data waittill("vo_done_or_cancelled");
    }
    return vo_data.said_vo;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6cb
// Size: 0x65
function function_4495922f7faaffe7(radio_dist, alias) {
    assertex(isfloat(radio_dist) || isint(radio_dist), "<dev string:xe4>");
    if (!isdefined(alias)) {
        level.var_32ed4c64de33eaa6 = radio_dist;
        return;
    }
    if (!isdefined(level.var_cb329546ed01d21a)) {
        level.var_cb329546ed01d21a = [];
    }
    level.var_cb329546ed01d21a[alias] = radio_dist;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x738
// Size: 0x64
function say_sequence(sequence, priority, timeout, overlap, delay, scope, endons) {
    vo_data = create_vo_data(sequence, priority, timeout, default_to(overlap, 0), delay, scope, endons);
    return function_e80002fd834a68b3(vo_data);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x7a5
// Size: 0x49
function function_b0c2a659a5c2761f(endons, sequence, priority, timeout, overlap, delay, scope) {
    return say_sequence(sequence, priority, timeout, overlap, delay, scope, endons);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x7f7
// Size: 0x49
function function_c9a09b3ba9c68f8d(delay, sequence, priority, timeout, overlap, scope, endons) {
    return say_sequence(sequence, priority, timeout, overlap, delay, scope, endons);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x849
// Size: 0x44
function function_72b26ba6d062726(sequence, priority, timeout, overlap, delay, endons) {
    return say_sequence(sequence, priority, timeout, overlap, delay, "global", endons);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x896
// Size: 0xc8
function stop_dialogue(cancel_queued_vo, cancel_delayed_vo) {
    if (!isdefined(cancel_queued_vo) || cancel_queued_vo) {
        self notify("cancel_queued_vo");
    }
    if (!isdefined(cancel_delayed_vo) || cancel_delayed_vo) {
        self notify("cancel_delayed_vo");
    }
    self notify("stop_vo_sequence");
    self notify("stop_dialogue");
    self notify("stop_facialFiller");
    if (isdefined(self.var_88502eb1e08dfc4d)) {
        self notify("scripted_face_" + self.var_88502eb1e08dfc4d, "end");
    }
    self.var_e5cf232129f9ec01 = undefined;
    emitter = self;
    if (utility::issp() && isplayer(self) || isstruct(self) || isdefined(self.vo_emitter)) {
        emitter = function_f5eb5b4d0e6714aa();
    }
    thread function_3e5d12eb11d543a2(emitter);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x966
// Size: 0x52
function function_bb9f95455e7b6dfe(include_chatter) {
    speaker = self;
    if (level == self) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    speaker.vo_disabled = 1;
    if (istrue(include_chatter)) {
        speaker set_battlechatter(0);
    }
    speaker notify("cancel_queued_vo");
    speaker notify("cancel_delayed_vo");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c0
// Size: 0x43
function function_49ce27ac35596e2d(include_chatter) {
    speaker = self;
    if (level == self) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    speaker.vo_disabled = 1;
    if (istrue(include_chatter)) {
        speaker set_battlechatter(1);
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa0b
// Size: 0xbe
function function_a583984eb78c6c32(include_chatter) {
    level.vo_disabled = 1;
    if (istrue(include_chatter)) {
        level.battlechatterdisabled = 1;
    }
    foreach (vo_data in array_combine(level.vo_queue, level.var_261aaf24a09d231d)) {
        if (!istrue(include_chatter) && istrue(vo_data.ischatter)) {
            continue;
        }
        vo_data.speaker notify("cancel_queued_vo");
        vo_data.speaker notify("cancel_delayed_vo");
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xad1
// Size: 0x24
function function_4adf4f4524e8c0fd(include_chatter) {
    level.vo_disabled = 0;
    if (istrue(include_chatter)) {
        level.battlechatterdisabled = 0;
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xafd
// Size: 0x3b
function say_self(alias, priority, timeout, overlap, delay) {
    return namespace_71a239de73c38174::say(alias, priority, timeout, overlap, delay, "self");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xb41
// Size: 0x3b
function say_team(alias, priority, timeout, overlap, delay) {
    return namespace_71a239de73c38174::say(alias, priority, timeout, overlap, delay, "team");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xb85
// Size: 0x3b
function say_global(alias, priority, timeout, overlap, delay) {
    return namespace_71a239de73c38174::say(alias, priority, timeout, overlap, delay, "global");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xbc9
// Size: 0x3f
function say_delayed(delay, alias, priority, timeout, overlap, scope) {
    return namespace_71a239de73c38174::say(alias, priority, timeout, overlap, delay, scope);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xc11
// Size: 0x3b
function function_8c1bbaeb5d3fe61a(delay, alias, priority, timeout, overlap) {
    return namespace_71a239de73c38174::say(alias, priority, timeout, overlap, delay, "self");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xc55
// Size: 0x3b
function function_fc0eb6b81c66c661(delay, alias, priority, timeout, overlap) {
    return namespace_71a239de73c38174::say(alias, priority, timeout, overlap, delay, "team");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xc99
// Size: 0x3b
function function_8c12d3c7fd8bc4ff(delay, alias, priority, timeout, overlap) {
    return namespace_71a239de73c38174::say(alias, priority, timeout, overlap, delay, "global");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xcdd
// Size: 0xb6
function function_cb329cf8896edeaa(team, cancel_queued_vo, cancel_delayed_vo) {
    assertex(isdefined(team), "<dev string:x103>");
    if (!isdefined(level.vo_teams) || !isdefined(level.vo_teams[team])) {
        return;
    }
    foreach (vo_data in level.vo_teams[team].var_261aaf24a09d231d) {
        vo_data.speaker stop_dialogue(cancel_queued_vo, cancel_delayed_vo);
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd9b
// Size: 0x81
function function_54d3bd59bff7e908(cancel_queued_vo, cancel_delayed_vo) {
    if (!isdefined(level.var_261aaf24a09d231d)) {
        return;
    }
    foreach (vo_data in level.var_261aaf24a09d231d) {
        vo_data.speaker stop_dialogue(cancel_queued_vo, cancel_delayed_vo);
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe24
// Size: 0xc4
function is_speaking() {
    speaker = self;
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    if (!isdefined(speaker.var_e5cf232129f9ec01) || !isdefined(speaker.var_88502eb1e08dfc4d) && !isdefined(speaker.var_800206351d64e3f4)) {
        return false;
    }
    if (isdefined(speaker.var_261aaf24a09d231d)) {
        return (speaker.var_261aaf24a09d231d.size > 0);
    }
    if (isdefined(speaker.var_800206351d64e3f4)) {
        duration_ms = function_f9e725c7fd059300(speaker.var_800206351d64e3f4) * 1000;
    } else {
        duration_ms = lookupsoundlength(speaker.var_88502eb1e08dfc4d);
    }
    return gettime() <= speaker.var_e5cf232129f9ec01 + duration_ms;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef1
// Size: 0x34
function function_8951f1a8a6f683c9() {
    speaker = self;
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    return speaker is_speaking() || isdefined(speaker.var_8329bfd06cbb047a);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf2e
// Size: 0x34
function function_754c9897f3b89964() {
    speaker = self;
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    return speaker is_speaking() || istrue(speaker.var_3968de209a1c2b97);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf6b
// Size: 0x44
function function_ed8a0ba27b9104c5() {
    speaker = self;
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    return speaker is_speaking() || istrue(speaker.var_3968de209a1c2b97) || isdefined(speaker.var_8329bfd06cbb047a);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfb8
// Size: 0x65
function function_d871f93553913276(team) {
    team = default_to(team, self.team);
    assertex(isdefined(team), "<dev string:x132>");
    if (!isdefined(level.vo_teams) || !isdefined(level.vo_teams[team])) {
        return false;
    }
    return level.vo_teams[team].var_261aaf24a09d231d.size > 0;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1026
// Size: 0xb4
function function_6c31b0b0edd184ed(var_6f9b6fae768b41e0, cooldown) {
    cooldown = default_to(cooldown, 15);
    assertex(isdefined(var_6f9b6fae768b41e0), "<dev string:x15d>");
    assertex(isarray(var_6f9b6fae768b41e0), "<dev string:x182>");
    foreach (speaker in var_6f9b6fae768b41e0) {
        if (speaker function_754c9897f3b89964()) {
            return true;
        }
        var_2ac238396b2cbed8 = speaker function_bce20c074033e937();
        if (isdefined(var_2ac238396b2cbed8) && var_2ac238396b2cbed8 < cooldown) {
            return true;
        }
    }
    return false;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10e3
// Size: 0x1d
function function_e9e38931019c791f() {
    if (!isdefined(level.var_261aaf24a09d231d)) {
        return false;
    }
    return level.var_261aaf24a09d231d.size > 0;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1109
// Size: 0x102
function function_5731e26b3ff6304d(timeout) {
    speaker = self;
    if (isdefined(timeout)) {
        struct = spawnstruct();
        struct endon("end");
        childthread function_d74571b48c6d763b(timeout, "end", struct);
    }
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    if (!speaker function_8951f1a8a6f683c9()) {
        return false;
    }
    speaker endon("death");
    if (isdefined(speaker.var_261aaf24a09d231d) && speaker.var_261aaf24a09d231d.size > 0) {
        speaker waittill("vo_done_or_cancelled");
    } else {
        var_83e3baae738687f4 = gettime() - speaker.var_e5cf232129f9ec01;
        if (isdefined(speaker.var_88502eb1e08dfc4d)) {
            duration_ms = lookupsoundlength(speaker.var_88502eb1e08dfc4d);
        } else {
            duration_ms = function_f9e725c7fd059300(speaker.var_800206351d64e3f4) * 1000;
        }
        time_remaining = (duration_ms - var_83e3baae738687f4) / 1000;
        wait time_remaining;
    }
    return true;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1214
// Size: 0x5e
function wait_finish_speaking() {
    speaker = self;
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    if (!istrue(speaker.var_3968de209a1c2b97)) {
        return function_5731e26b3ff6304d();
    }
    speaker endon("cancel_queued_vo");
    speaker endon("death");
    while (speaker.var_3968de209a1c2b97 > 0) {
        speaker waittill("vo_done_or_cancelled");
    }
    return 1;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x127b
// Size: 0x7c
function function_bce20c074033e937() {
    speaker = self;
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    if (!isdefined(speaker.var_e5cf232129f9ec01) || !isdefined(speaker.var_88502eb1e08dfc4d)) {
        return undefined;
    }
    var_1189f67cda3a6ec6 = speaker.var_e5cf232129f9ec01 + lookupsoundlength(speaker.var_88502eb1e08dfc4d);
    if (gettime() < var_1189f67cda3a6ec6) {
        return undefined;
    }
    return (gettime() - var_1189f67cda3a6ec6) / 1000;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1300
// Size: 0xdc
function function_2e6c500b83dc82f5() {
    speaker = self;
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    var_3a006b25cf6977aa = isdefined(speaker.var_8329bfd06cbb047a) && isnumber(speaker.var_c037496486cc9d4b);
    if (!var_3a006b25cf6977aa && !isdefined(speaker.var_e5cf232129f9ec01) || !isdefined(speaker.var_88502eb1e08dfc4d)) {
        return undefined;
    }
    if (var_3a006b25cf6977aa) {
        var_1189f67cda3a6ec6 = speaker.var_8329bfd06cbb047a + speaker.var_c037496486cc9d4b * 1000 + lookupsoundlength(speaker.var_88502eb1e08dfc4d);
    } else {
        var_1189f67cda3a6ec6 = self.var_e5cf232129f9ec01 + lookupsoundlength(self.var_88502eb1e08dfc4d);
    }
    if (gettime() > var_1189f67cda3a6ec6) {
        return undefined;
    }
    return (var_1189f67cda3a6ec6 - gettime()) / 1000;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13e5
// Size: 0x54
function function_53037a6cae32fb97(var, value) {
    if (!isdefined(self.var_a36de4031e866ce5)) {
        function_746d94ac5ed3ee5c();
    }
    assertex(isdefined(var) && isdefined(self.nagvars[var]), "<dev string:x1a2>");
    self.var_a36de4031e866ce5[var] = value;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1441
// Size: 0xef
function function_c3a221031a1ff66c(priority, timeout, overlap, scope) {
    if (!isdefined(self.var_a36de4031e866ce5)) {
        function_746d94ac5ed3ee5c();
    }
    self.var_a36de4031e866ce5.priority = default_to(priority, self.var_a36de4031e866ce5.priority);
    self.var_a36de4031e866ce5.timeout = default_to(timeout, self.var_a36de4031e866ce5.timeout);
    self.var_a36de4031e866ce5.overlap = default_to(overlap, self.var_a36de4031e866ce5.overlap);
    self.var_a36de4031e866ce5.scope = default_to(scope, self.var_a36de4031e866ce5.scope);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1538
// Size: 0xe9
function function_746d94ac5ed3ee5c() {
    if (self != level && !isdefined(level.var_a36de4031e866ce5)) {
        level function_746d94ac5ed3ee5c();
    }
    self.var_a36de4031e866ce5 = spawnstruct();
    self.var_a36de4031e866ce5.priority = default_to(level.var_a36de4031e866ce5.priority, 0);
    self.var_a36de4031e866ce5.timeout = default_to(level.var_a36de4031e866ce5.timeout, 1);
    self.var_a36de4031e866ce5.overlap = default_to(level.var_a36de4031e866ce5.overlap, 0);
    self.var_a36de4031e866ce5.scope = default_to(level.var_a36de4031e866ce5.scope, "team");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1629
// Size: 0xa5
function nag_wait(flag_msg, nags, repeat_delay, initial_delay, loop_limit, invert_flag) {
    self endon("finished_nag_loop");
    if (ter_op(istrue(invert_flag), !flag(flag_msg), flag(flag_msg))) {
        return;
    }
    endon_ent = spawnstruct();
    childthread nagtill([endon_ent, "stop"], nags, repeat_delay, initial_delay, loop_limit);
    if (istrue(invert_flag)) {
        flag_waitopen(flag_msg);
    } else {
        flag_wait(flag_msg);
    }
    endon_ent notify("stop");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x16d6
// Size: 0x39
function function_bace8af56ef0688b(flag_msg, nags, repeat_delay, initial_delay, loop_limit) {
    nag_wait(flag_msg, nags, repeat_delay, initial_delay, loop_limit, 1);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1717
// Size: 0x139
function function_91c23782840cf632(var_eb053d490b6594d2, nags, repeat_delay, initial_delay, loop_limit, invert_flag) {
    self endon("finished_nag_loop");
    foreach (flag_msg in var_eb053d490b6594d2) {
        if (ter_op(istrue(invert_flag), !flag(flag_msg), flag(flag_msg))) {
            return;
        }
    }
    endon_ent = spawnstruct();
    childthread nagtill([endon_ent, "stop"], nags, repeat_delay, initial_delay, loop_limit);
    while (true) {
        function_5adca43f839a3cce(var_eb053d490b6594d2);
        foreach (flag_msg in var_eb053d490b6594d2) {
            if (ter_op(istrue(invert_flag), !flag(flag_msg), flag(flag_msg))) {
                endon_ent notify("stop");
                return;
            }
        }
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1858
// Size: 0x156
function function_91cb20828416e24b(var_eb053d490b6594d2, nags, repeat_delay, initial_delay, loop_limit, invert_flag) {
    self endon("finished_nag_loop");
    foreach (flag_msg in var_eb053d490b6594d2) {
        if (ter_op(istrue(invert_flag), flag(flag_msg), !flag(flag_msg))) {
            continue;
        }
        return;
    }
    endon_ent = spawnstruct();
    childthread nagtill([endon_ent, "stop"], nags, repeat_delay, initial_delay, loop_limit);
    exit = 0;
    while (exit == 0) {
        level function_5adca43f839a3cce(var_eb053d490b6594d2);
        exit = 1;
        foreach (flag_msg in var_eb053d490b6594d2) {
            if (ter_op(istrue(invert_flag), flag(flag_msg), !flag(flag_msg))) {
                exit = 0;
                break;
            }
        }
    }
    endon_ent notify("stop");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x19b6
// Size: 0xb7
function nagtill(endon_data, nags, repeat_delay, initial_delay, loop_limit) {
    self endon("finished_nag_loop");
    assertex(isdefined(repeat_delay), "<dev string:x1b4>");
    endon_ent = self;
    endon_msg = endon_data;
    if (isarray(endon_data)) {
        assertex(endon_data.size == 2 && (isent(endon_data[0]) || isstruct(endon_data[0])) && isstring(endon_data[1]), "<dev string:x1db>");
        endon_ent = endon_data[0];
        endon_msg = endon_data[1];
    }
    endon_ent endon(endon_msg);
    nag_loop(nags, repeat_delay, initial_delay, loop_limit);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1a75
// Size: 0xbe
function function_a60fea4f51763a4f(endon_data, nags, repeat_delay, initial_delay, loop_limit) {
    endon_ent = self;
    foreach (endon_item in endon_data) {
        if (isent(endon_item) || isstruct(endon_item)) {
            endon_ent = endon_item;
            continue;
        }
        if (isstring(endon_item)) {
            endon_ent endon(endon_item);
            continue;
        }
        assertmsg("<dev string:x211>");
    }
    nag_loop(nags, repeat_delay, initial_delay, loop_limit);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b3b
// Size: 0x58
function growing_delay(start, end, count) {
    delay = spawnstruct();
    delay.current = start;
    delay.maximum = end;
    delay.increment = (end - start) / count;
    return delay;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b9c
// Size: 0x224
function waitfor(delay, params) {
    assertex(isdefined(delay), "<dev string:x246>");
    if (isarray(delay)) {
        if (delay.size == 1 && isnumber(delay[0])) {
            delay = (delay[0] - gettime()) / 1000;
        } else if (isfunction(delay[0]) || isbuiltinmethod(delay[0]) || isbuiltinfunction(delay[0])) {
            return call_with_params(delay[0], array_remove_index(delay, 0));
        } else if (delay.size == 2 && (isent(delay[0]) || isstruct(delay[0])) && isstring(delay[1])) {
            value = delay[0] waittill(delay[1]);
            return value;
        } else if (delay.size == 2 && isnumber(delay[0]) && isnumber(delay[1])) {
            assertex(delay[0] >= 0 && delay[1] >= delay[1], "<dev string:x26d>");
            wait randomfloatrange(delay[0], delay[1]);
            return 1;
        } else {
            return waitfor_any(delay, params);
        }
    }
    if (isnumber(delay)) {
        if (delay <= 0) {
            return;
        }
        wait delay;
        return 1;
    }
    if (isstruct(delay) && isdefined(delay.current)) {
        wait delay.current;
        if (isdefined(delay.increment)) {
            delay.current += delay.increment;
        }
        if (isdefined(delay.maximum) && delay.current >= delay.maximum) {
            delay.current = delay.maximum;
            return 1;
        }
        return;
    }
    if (isstring(delay)) {
        value = self waittill(delay);
        return value;
    }
    if (isfunction(delay) || isbuiltinmethod(delay) || isbuiltinfunction(delay)) {
        return call_with_params(delay, params);
    }
    assertmsg("<dev string:x2ca>");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc8
// Size: 0xc1
function waitfor_any(delays, params) {
    if (!isarray(delays)) {
        waitfor(delays, params);
        return delays;
    }
    ent = spawnstruct();
    ent endon("kill");
    foreach (delay in delays) {
        childthread function_d74571b48c6d763b(delay, "finished", ent, params);
    }
    result, delay = ent waittill("finished");
    ent delaythread(0.05, &send_notify, "kill");
    return result;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1e92
// Size: 0x46
function function_d74571b48c6d763b(delay, msg, notify_ent, params) {
    if (!isdefined(notify_ent)) {
        notify_ent = self;
    }
    result = waitfor(delay, params);
    notify_ent notify(msg, result, delay, self);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ee0
// Size: 0x45
function function_5cf2ff53d6a7c938(delays, msg, notify_ent, params) {
    if (!isdefined(notify_ent)) {
        notify_ent = self;
    }
    result = waitfor_any(delays, params);
    notify_ent notify(msg, result, self);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1f2d
// Size: 0x44
function waitfor_ent(delay, params, msg) {
    struct = spawnstruct();
    thread function_d74571b48c6d763b(delay, default_to(msg, "finish"), struct, params);
    return struct;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f7a
// Size: 0x60
function call_with_params(func, params) {
    if (isfunction(func)) {
        return call_with_params_script(func, params);
    }
    if (isbuiltinmethod(func)) {
        return call_with_params_builtin(func, params);
    }
    if (isbuiltinfunction(func)) {
        return function_8093ac75aa6abb73(func, params);
    }
    assertmsg("<dev string:x2e1>");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe2
// Size: 0x1bc
function call_with_params_script(func, params) {
    assertex(isfunction(func), "<dev string:x334>");
    if (!isdefined(params)) {
        return self [[ func ]]();
    }
    if (!isarray(params)) {
        return self [[ func ]](params);
    }
    switch (params.size) {
    case 0: 
        return self [[ func ]]();
    case 1: 
        return self [[ func ]](params[0]);
    case 2: 
        return self [[ func ]](params[0], params[1]);
    case 3: 
        return self [[ func ]](params[0], params[1], params[2]);
    case 4: 
        return self [[ func ]](params[0], params[1], params[2], params[3]);
    case 5: 
        return self [[ func ]](params[0], params[1], params[2], params[3], params[4]);
    case 6: 
        return self [[ func ]](params[0], params[1], params[2], params[3], params[4], params[5]);
    case 7: 
        return self [[ func ]](params[0], params[1], params[2], params[3], params[4], params[5], params[6]);
    case 8: 
        return self [[ func ]](params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7]);
    case 9: 
        return self [[ func ]](params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8]);
    default: 
        assertmsg("<dev string:x357>");
        break;
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x21a6
// Size: 0x1c7
function call_with_params_builtin(func, params) {
    assertex(isbuiltinmethod(func), "<dev string:x394>");
    if (!isdefined(params)) {
        return self [[ func ]]();
    }
    if (!isarray(params)) {
        return self builtin [[ func ]](params);
    }
    switch (params.size) {
    case 0: 
        return self builtin [[ func ]]();
    case 1: 
        return self builtin [[ func ]](params[0]);
    case 2: 
        return self builtin [[ func ]](params[0], params[1]);
    case 3: 
        return self builtin [[ func ]](params[0], params[1], params[2]);
    case 4: 
        return self builtin [[ func ]](params[0], params[1], params[2], params[3]);
    case 5: 
        return self builtin [[ func ]](params[0], params[1], params[2], params[3], params[4]);
    case 6: 
        return self builtin [[ func ]](params[0], params[1], params[2], params[3], params[4], params[5]);
    case 7: 
        return self builtin [[ func ]](params[0], params[1], params[2], params[3], params[4], params[5], params[6]);
    case 8: 
        return self builtin [[ func ]](params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7]);
    case 9: 
        return self builtin [[ func ]](params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8]);
    default: 
        assertmsg("<dev string:x357>");
        break;
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2375
// Size: 0x1bc
function function_8093ac75aa6abb73(func, params) {
    assertex(isbuiltinfunction(func), "<dev string:x3de>");
    if (!isdefined(params)) {
        return builtin [[ func ]]();
    }
    if (!isarray(params)) {
        return builtin [[ func ]](params);
    }
    switch (params.size) {
    case 0: 
        return builtin [[ func ]]();
    case 1: 
        return builtin [[ func ]](params[0]);
    case 2: 
        return builtin [[ func ]](params[0], params[1]);
    case 3: 
        return builtin [[ func ]](params[0], params[1], params[2]);
    case 4: 
        return builtin [[ func ]](params[0], params[1], params[2], params[3]);
    case 5: 
        return builtin [[ func ]](params[0], params[1], params[2], params[3], params[4]);
    case 6: 
        return builtin [[ func ]](params[0], params[1], params[2], params[3], params[4], params[5]);
    case 7: 
        return builtin [[ func ]](params[0], params[1], params[2], params[3], params[4], params[5], params[6]);
    case 8: 
        return builtin [[ func ]](params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7]);
    case 9: 
        return builtin [[ func ]](params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8]);
    default: 
        assertmsg("<dev string:x357>");
        break;
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2539
// Size: 0x4e
function function_ea6f404468959fd2(timeout, func, params) {
    ent = spawnstruct();
    ent delaythread(timeout, &send_notify, "kill");
    ent endon("kill");
    return call_with_params(func, params);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x2590
// Size: 0x21f
function create_vo_data(sequence, priority, timeout, overlap, delay, scope, endons) {
    assertex(isdefined(sequence), "<dev string:x426>");
    speaker = self;
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    if (is_dead_or_dying(speaker) || istrue(speaker.vo_disabled) || istrue(level.vo_disabled)) {
        return;
    }
    default_scope = ter_op(isdefined(speaker.team), "team", "global");
    scope = default_to(scope, default_scope);
    assertex(scope == "<dev string:x5d>" || scope == "<dev string:x65>" || scope == "<dev string:x6d>", "<dev string:x77>");
    assertex(scope != "<dev string:x65>" || isdefined(speaker.team), "<dev string:xb1>");
    vo_data = spawnstruct();
    vo_data.owner = self;
    vo_data.speaker = speaker;
    vo_data.scope_ents = speaker function_28e38eefd3cc4ab();
    vo_data.var_c6122c93e719738e = 1;
    if (!isarray(sequence)) {
        sequence = [sequence];
    }
    vo_data.index = 0;
    vo_data.sequence = sequence;
    vo_data.priority = default_to(priority, 0);
    vo_data.overlap = default_to(overlap, 1);
    vo_data.endons = default_to(endons, []);
    vo_data.timeout = timeout;
    vo_data.delay = delay;
    vo_data.scope = scope;
    if (!isarray(vo_data.endons)) {
        vo_data.endons = [vo_data.endons];
    }
    return vo_data;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27b8
// Size: 0x3d
function function_e80002fd834a68b3(vo_data) {
    if (!isdefined(vo_data)) {
        return 0;
    }
    vo_data thread queue_sequence();
    if (!istrue(vo_data.finished_or_cancelled)) {
        vo_data waittill("finished_or_cancelled");
    }
    return vo_data.finished;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x27fe
// Size: 0x245
function queue_say(speaker, alias, priority, timeout, overlap, delay) {
    self.finished = 0;
    speaker.var_44e1869b50a57309 = self.scope;
    speaker notify("started_queue_wait", self);
    cancelled = self.scope_ents[self.scope] function_f2a79001721945a(self, timeout);
    speaker notify("finished_queue_wait", self, cancelled);
    if (!istrue(cancelled) && !is_dead_or_dying(speaker) && !istrue(speaker.vo_disabled) && !istrue(level.vo_disabled)) {
        speaker.var_ec9f57e7698baffb = priority;
        foreach (ent in self.scope_ents) {
            ent function_797820cad48747ef(self);
        }
        self notify("proceeded");
        cancelled = speaker function_19e262da812ccbef(delay, alias);
        speaker.var_8329bfd06cbb047a = undefined;
        speaker.var_c037496486cc9d4b = undefined;
        speaker notify("stop_bcs_sequence");
        if (isdefined(cancelled) && !cancelled) {
            check_interrupt(overlap, self.scope_ents[self.scope]);
            self.said_vo = speaker function_7b52f05da542c2ff(alias, overlap, self.scope_ents[self.scope], self.receivers);
        }
        if (is_dead_or_dying(speaker)) {
            speaker stop_dialogue(0, 0);
        }
        foreach (ent in self.scope_ents) {
            ent remove_vo_data(self);
        }
    } else {
        self notify("proceeded");
    }
    function_ab8711048f02259d(self.scope_ents);
    self.vo_done_or_cancelled = 1;
    speaker notify("vo_done_or_cancelled", self);
    self notify("vo_done_or_cancelled");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a4b
// Size: 0xfb
function check_interrupt(overlap, scope_ent) {
    if (!istrue(overlap)) {
        speaker = default_to(self.vo_parent, self);
        foreach (vo_data in scope_ent.var_261aaf24a09d231d) {
            if (vo_data == self) {
                continue;
            }
            other_speaker = vo_data.speaker;
            force_interrupt = utility::issp() || isstruct(speaker) || isstruct(other_speaker);
            if (force_interrupt || distance2dsquared(speaker.origin, other_speaker.origin) <= level.var_c1ed820e79e07b7c) {
                other_speaker stop_dialogue(0, 1);
            }
        }
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b4e
// Size: 0x195
function queue_sequence() {
    self.finished = 0;
    self.finished_or_cancelled = 0;
    self.speaker.var_44e1869b50a57309 = self.scope;
    self.speaker notify("started_queue_wait", self);
    cancelled = self.scope_ents[self.scope] function_f2a79001721945a(self, self.timeout, self.endons);
    self.speaker notify("finished_queue_wait", self, cancelled);
    if (!istrue(cancelled) && !is_dead_or_dying(self.speaker) && !istrue(self.speaker.vo_disabled) && !istrue(level.vo_disabled)) {
        execute_sequence();
    } else {
        self notify("proceeded");
    }
    if (!isdefined(self.finished)) {
        if (isdefined(self.var_5a99a0a244447afd)) {
            self thread [[ self.var_5a99a0a244447afd ]]();
        }
    } else if (!self.finished) {
        if (isdefined(self.oncancelfunc)) {
            self thread [[ self.oncancelfunc ]]();
        }
    } else if (isdefined(self.onfinishedfunc)) {
        self thread [[ self.onfinishedfunc ]]();
    }
    function_ab8711048f02259d(self.scope_ents);
    self.speaker notify("vo_finished_or_cancelled", self);
    level notify("vo_finished_or_cancelled", self);
    self.finished_or_cancelled = 1;
    self notify("finished_or_cancelled");
    return self.finished;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cec
// Size: 0x1de
function execute_sequence() {
    level notify("vo_sequence_started", self);
    self.speaker.var_ec9f57e7698baffb = self.priority;
    foreach (ent in self.scope_ents) {
        ent function_797820cad48747ef(self);
    }
    self notify("proceeded");
    cancelled = self.speaker function_19e262da812ccbef(self.delay, self.alias);
    self.speaker.var_8329bfd06cbb047a = undefined;
    self.speaker.var_c037496486cc9d4b = undefined;
    if (isdefined(cancelled) && !cancelled) {
        /#
            if (getdvarint(@"hash_62a9dffcf730f69")) {
                thread function_ac754fead4684fbc();
            }
        #/
        check_interrupt(self.overlap, self.scope_ents[self.scope]);
        while (isdefined(self.finished) && !self.finished) {
            self.finished = function_2f5f29da6f0f73e6();
        }
        if (is_dead_or_dying(self.speaker)) {
            self.speaker stop_dialogue(0, 0);
            if (isdefined(self.var_547430358c7ce6fe)) {
                self thread [[ self.var_547430358c7ce6fe ]]();
            }
        }
    }
    foreach (ent in self.scope_ents) {
        ent remove_vo_data(self);
    }
    level notify("vo_sequence_ended", self);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ed2
// Size: 0x3b0
function function_2f5f29da6f0f73e6() {
    if (self.index >= self.sequence.size) {
        return 1;
    }
    if (is_dead_or_dying(self.speaker)) {
        if (isdefined(self.var_8148255515ef1b38)) {
            self [[ self.var_8148255515ef1b38 ]]();
        }
        if (is_dead_or_dying(self.speaker)) {
            return function_139ccec48e7e3539("DEAD SPEAKER");
        }
    }
    if (istrue(self.speaker.vo_disabled) || istrue(level.vo_disabled)) {
        return function_139ccec48e7e3539("VO DISABLED");
    }
    self.scope_ents[self.scope] endon("stop_vo_sequence");
    self.speaker endon("stop_vo_sequence");
    self.speaker endon("death");
    self notify("new_segment");
    endon_ent = self.speaker;
    foreach (endon_data in self.endons) {
        if (isent(endon_data) || isstruct(endon_data)) {
            endon_ent = endon_data;
            continue;
        }
        if (isstring(endon_data)) {
            endon_ent endon(endon_data);
        }
    }
    self.alias = undefined;
    segment = self.sequence[self.index];
    self.index++;
    if (isstring(segment)) {
        self.alias = segment;
        if (!soundexists(self.alias) && !function_c0af485270de3fbf(self.alias)) {
            /#
                iprintlnbold("<dev string:x3f>" + self.alias + "<dev string:x4c>");
            #/
            return function_139ccec48e7e3539("MISSING ALIAS");
        }
        finished = self.speaker function_7b52f05da542c2ff(self.alias, self.overlap, self.scope_ents[self.scope], self.receivers);
        if (!istrue(finished)) {
            return function_139ccec48e7e3539("SAY INTERRUPTED");
        }
        return 0;
    } else if (isnumber(segment)) {
        if (segment <= 0) {
            return 0;
        }
        wait segment;
        return 0;
    } else if (isent(segment) || isstruct(segment)) {
        result = switch_speaker(segment);
        return 0;
    } else if (isfunction(segment)) {
        result = self [[ segment ]]();
        if (isdefined(result)) {
            if (isint(result) && result == 0) {
                return function_139ccec48e7e3539("FUNC RETURNED FALSE");
            }
            self.index--;
            self.sequence[self.index] = result;
        }
        return 0;
    } else if (isarray(segment)) {
        self.index--;
        sequence = [];
        for (i = 0; i < self.sequence.size; i++) {
            if (i == self.index) {
                foreach (item in segment) {
                    sequence[sequence.size] = item;
                }
                continue;
            }
            sequence[sequence.size] = self.sequence[i];
        }
        self.sequence = sequence;
        return 0;
    }
    return function_139ccec48e7e3539("UNDEFINED SEGMENT");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x328b
// Size: 0x48
function function_139ccec48e7e3539(reason) {
    /#
        if (!getdvarint(@"hash_62a9dffcf730f69")) {
            return;
        }
        iprintlnbold("<dev string:x443>" + reason + "<dev string:x449>" + default_to(self.name, "<dev string:x451>"));
    #/
}

/#

    // Namespace dialogue / namespace_71a239de73c38174
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x32db
    // Size: 0x2b1
    function function_ac754fead4684fbc() {
        self endon("<dev string:x462>");
        for (;;) {
            sequence = self.sequence;
            ln_height = 0;
            for (i = 0; i < sequence.size; i++) {
                display_ln = undefined;
                segment = sequence[i];
                if (isstring(segment)) {
                    display_ln = "<dev string:x47e>" + segment;
                } else if (isnumber(segment)) {
                    display_ln = "<dev string:x487>" + segment + "<dev string:x491>";
                } else if (isent(segment)) {
                    ent_num = "<dev string:x499>" + segment getentitynumber();
                    display_ln = "<dev string:x49e>";
                    if (isdefined(segment.animname)) {
                        display_ln += segment.animname + "<dev string:x4b5>" + ent_num + "<dev string:x4bb>";
                    } else {
                        display_ln += ent_num;
                    }
                }
                if (isdefined(display_ln)) {
                    is_index = i == self.index - 1;
                    setdvarifuninitialized(@"hash_91d2bfdbf8875369", 1350);
                    setdvarifuninitialized(@"hash_91d2bedbf8875136", 500);
                    base_x = getdvarint(@"hash_91d2bfdbf8875369");
                    base_y = getdvarint(@"hash_91d2bedbf8875136");
                    if (isdefined(self.name)) {
                        event_info = "<dev string:x4c0>" + self.speaker getentitynumber() + "<dev string:x4c9>" + self.name + "<dev string:x4cf>";
                        printtoscreen2d(base_x, base_y + 22, event_info, (0, 0, 0), 1.75);
                        printtoscreen2d(base_x - 2, base_y + 20, event_info, (1, 1, 0), 1.75);
                    }
                    color = ter_op(is_index, (0, 0.85, 0), (1, 1, 1));
                    space = ter_op(is_index, 35, 25);
                    scale = ter_op(is_index, 2, 1.5);
                    printtoscreen2d(base_x + 2, base_y + 52 + ln_height + is_index * 10, display_ln, (0, 0, 0), scale);
                    printtoscreen2d(base_x + 2, base_y + 52 + ln_height + is_index * 10, display_ln, (0, 0, 0), scale);
                    printtoscreen2d(base_x, base_y + 50 + ln_height + is_index * 10, display_ln, color, scale);
                    ln_height += space;
                }
            }
            waitframe();
        }
    }

#/

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3594
// Size: 0x10b
function switch_speaker(new_speaker) {
    foreach (ent in self.scope_ents) {
        ent remove_vo_data(self);
    }
    if (new_speaker == level) {
        new_speaker = new_speaker function_f5eb5b4d0e6714aa();
    }
    self.listener = self.speaker;
    self.speaker = new_speaker;
    self.speaker.var_ec9f57e7698baffb = self.priority;
    self.scope_ents = self.speaker function_28e38eefd3cc4ab();
    foreach (ent in self.scope_ents) {
        ent function_797820cad48747ef(self);
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x36a7
// Size: 0x9b
function function_19e262da812ccbef(delay, var_30356ee6394ecf19) {
    if (!isdefined(delay)) {
        return false;
    }
    self endon("death");
    self endon("cancel_delayed_vo");
    self.var_88502eb1e08dfc4d = undefined;
    self.var_800206351d64e3f4 = undefined;
    self.var_8329bfd06cbb047a = gettime();
    self.var_c037496486cc9d4b = delay;
    if (isdefined(var_30356ee6394ecf19) && function_c0af485270de3fbf(var_30356ee6394ecf19)) {
        self.var_800206351d64e3f4 = var_30356ee6394ecf19;
    } else {
        self.var_88502eb1e08dfc4d = var_30356ee6394ecf19;
    }
    result = waitfor(delay);
    return isint(result) && result == 0;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x374b
// Size: 0x98
function function_7b52f05da542c2ff(alias, overlap, scope_ent, receivers) {
    if (is_dead_or_dying(self)) {
        return 0;
    }
    self notify("started_saying", alias);
    if (isdefined(self.var_aed624967395163b)) {
        self thread [[ self.var_aed624967395163b ]](alias);
    }
    if (function_c0af485270de3fbf(alias)) {
        finished = function_932c63c904570806(alias);
    } else if (soundexists(alias)) {
        finished = function_e7c1c9dee13137aa(alias, receivers);
    } else {
        finished = 0;
    }
    self notify("done_saying", alias, finished);
    return finished;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x37ec
// Size: 0x62
function function_e7c1c9dee13137aa(alias, receivers) {
    self endon("death");
    self.var_e5cf232129f9ec01 = gettime();
    self.var_88502eb1e08dfc4d = alias;
    self.var_800206351d64e3f4 = undefined;
    if (isdefined(receivers) && utility::issp()) {
        thread function_5baebd9837531e1f(alias, receivers);
    }
    return self [[ level.var_9a62261b5b534b06 ]](alias);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3857
// Size: 0xac
function function_f2a79001721945a(vo_data, timeout, endons) {
    vo_data endon("proceed");
    if (self.var_261aaf24a09d231d.size == 0 || !istrue(vo_data.ischatter) && vo_data.priority >= 0 && function_623d7aa584b346ac()) {
        return false;
    }
    function_5ee32a2da994afab(vo_data);
    cancelled = !istrue(vo_data.speaker function_f983ce9b3755f759(timeout, endons));
    function_4866daf9001cdb5f(vo_data);
    if (cancelled || !vo_data has_priority(self.var_261aaf24a09d231d)) {
        return true;
    }
    return false;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x390c
// Size: 0x61
function private function_623d7aa584b346ac() {
    foreach (vo_data in self.var_261aaf24a09d231d) {
        if (!istrue(vo_data.ischatter)) {
            return false;
        }
    }
    return true;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3976
// Size: 0xc2
function function_ab8711048f02259d(scope_ents) {
    foreach (scope_ent in scope_ents) {
        if (!isdefined(scope_ent.vo_queue) || scope_ent.vo_queue.size == 0) {
            continue;
        }
        next_struct = scope_ent.vo_queue[0];
        if (scope_ent.var_261aaf24a09d231d.size == 0 || next_struct function_ca829a8ed4c9efbe(scope_ent)) {
            scope_ent function_4866daf9001cdb5f(next_struct);
            next_struct notify("proceed");
            next_struct waittill("proceeded");
            return;
        }
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3a40
// Size: 0xd8
function private function_f983ce9b3755f759(timeout, endons) {
    self endon("death");
    if (isdefined(endons)) {
        if (!isarray(endons)) {
            endons = [endons];
        }
        endon_ent = self;
        foreach (endon_data in endons) {
            if (isent(endon_data) || isstruct(endon_data)) {
                endon_ent = endon_data;
                continue;
            }
            if (isstring(endon_data)) {
                endon_ent endon(endon_data);
            }
        }
    }
    if (isdefined(timeout)) {
        self endon("cancel_queued_vo");
        result = waitfor(timeout);
        return (!isint(result) || result);
    }
    self waittill("cancel_queued_vo");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3b20
// Size: 0xc
function private function_ca829a8ed4c9efbe(scope_ent) {
    return false;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3b35
// Size: 0x1db
function has_priority(var_372fac4e460e7107, allow_equal) {
    if (isstruct(var_372fac4e460e7107)) {
        var_372fac4e460e7107 = var_372fac4e460e7107.var_261aaf24a09d231d;
    }
    speakers = [];
    if (utility::issp() || !isdefined(self.speaker.origin) || istrue(self.speaker.var_568a463dbba1469c) || istrue(self.speaker.var_cbc44e3ab4fe0707)) {
        foreach (vo_data in var_372fac4e460e7107) {
            speakers[speakers.size] = vo_data.speaker;
        }
    } else {
        foreach (vo_data in var_372fac4e460e7107) {
            speaker = vo_data.speaker;
            if (isstruct(speaker) || istrue(speaker.var_cbc44e3ab4fe0707) || distance2dsquared(self.speaker.origin, speaker.origin) <= level.var_c1ed820e79e07b7c) {
                speakers[speakers.size] = speaker;
            }
        }
    }
    if (self.priority >= 1 || speakers.size == 0) {
        return 1;
    }
    highest_priority = speakers[0].var_ec9f57e7698baffb;
    if (!isdefined(highest_priority)) {
        return 1;
    }
    if (istrue(allow_equal)) {
        return (self.priority >= highest_priority);
    }
    return self.priority > highest_priority;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3d18
// Size: 0xc8
function private function_5ee32a2da994afab(struct) {
    if (!isdefined(struct.speaker.var_3968de209a1c2b97)) {
        struct.speaker.var_3968de209a1c2b97 = 0;
    }
    struct.speaker.var_3968de209a1c2b97++;
    for (i = self.vo_queue.size; true; i--) {
        if (i == 0 || self.vo_queue[i - 1].priority >= struct.priority) {
            self.vo_queue[i] = struct;
            return;
        }
        self.vo_queue[i] = self.vo_queue[i - 1];
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3de8
// Size: 0xc7
function private function_4866daf9001cdb5f(struct) {
    found = 0;
    for (i = 0; i < self.vo_queue.size; i++) {
        if (found) {
            self.vo_queue[i - 1] = self.vo_queue[i];
            continue;
        }
        if (self.vo_queue[i] == struct) {
            found = 1;
        }
    }
    if (found) {
        self.vo_queue[self.vo_queue.size - 1] = undefined;
    }
    if (isdefined(struct.speaker) && isdefined(struct.speaker.var_3968de209a1c2b97)) {
        struct.speaker.var_3968de209a1c2b97--;
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3eb7
// Size: 0xc0
function function_797820cad48747ef(vo_data) {
    for (i = self.var_261aaf24a09d231d.size; true; i--) {
        if (i == 0 || isalive(self.var_261aaf24a09d231d[i - 1].speaker) && isdefined(self.var_261aaf24a09d231d[i - 1].priority) && self.var_261aaf24a09d231d[i - 1].priority >= vo_data.priority) {
            self.var_261aaf24a09d231d[i] = vo_data;
            return;
        }
        self.var_261aaf24a09d231d[i] = self.var_261aaf24a09d231d[i - 1];
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f7f
// Size: 0x9d
function remove_vo_data(vo_data) {
    if (!isdefined(self) || !isdefined(self.var_261aaf24a09d231d)) {
        return;
    }
    found = 0;
    for (i = 0; i < self.var_261aaf24a09d231d.size; i++) {
        if (found) {
            self.var_261aaf24a09d231d[i - 1] = self.var_261aaf24a09d231d[i];
            continue;
        }
        if (self.var_261aaf24a09d231d[i] == vo_data) {
            found = 1;
        }
    }
    if (found) {
        self.var_261aaf24a09d231d[self.var_261aaf24a09d231d.size - 1] = undefined;
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4024
// Size: 0xb0
function function_28e38eefd3cc4ab() {
    if (!isdefined(level.vo_teams)) {
        level.vo_teams = [];
    }
    if (isdefined(self.team) && !isdefined(level.vo_teams[self.team])) {
        level.vo_teams[self.team] = spawnstruct();
    }
    scope_ents = [];
    scope_ents["self"] = function_a940efae252424c5();
    if (isdefined(self.team)) {
        scope_ents["team"] = level.vo_teams[self.team] function_a940efae252424c5();
    }
    scope_ents["global"] = level function_a940efae252424c5();
    return scope_ents;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x40dd
// Size: 0x31
function private function_a940efae252424c5() {
    if (!isdefined(self.var_261aaf24a09d231d)) {
        self.var_261aaf24a09d231d = [];
    }
    if (!isdefined(self.vo_queue)) {
        self.vo_queue = [];
    }
    return self;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4117
// Size: 0x17
function function_4fba9e11ee207d7c(alias) {
    return lookupsoundlength(alias, 1) / 1000;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4137
// Size: 0x73
function function_6d4c7d2bd5969057(dialogue) {
    animname = ter_op(isdefined(self.animname), self.animname, "generic");
    if (!isdefined(level.scr_face) || !isdefined(level.scr_face[animname])) {
        return;
    }
    if (isdefined(level.scr_face[animname][dialogue])) {
        return level.scr_face[animname][dialogue];
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x41b2
// Size: 0x94
function function_5baebd9837531e1f(alias, receivers) {
    if (!isarray(receivers)) {
        receivers = [receivers];
    }
    wait 0.1;
    foreach (receiver in receivers) {
        if (is_dead_or_dying(receiver) || receiver == self) {
            continue;
        }
        receiver playcontextsound(alias, "dx_type", "dx_radio_3d");
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x424e
// Size: 0x4c
function function_f5eb5b4d0e6714aa(tag, originoffset, anglesoffset, istemp) {
    if (!isdefined(self.vo_emitter)) {
        self.vo_emitter = function_3a8815118a9b0d69(tag, originoffset, anglesoffset, istemp);
    }
    return self.vo_emitter;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x42a3
// Size: 0x17b
function function_3a8815118a9b0d69(tag, originoffset, anglesoffset, istemp) {
    if (isent(self)) {
        if (self tagexists("j_head")) {
            tag = default_to(tag, "j_head");
        }
        originoffset = default_to(originoffset, (0, 0, 0));
        anglesoffset = default_to(anglesoffset, (0, 0, 0));
        emitter = spawn("script_origin", self.origin);
        if (isdefined(tag)) {
            emitter linkto(self, tag, originoffset, anglesoffset);
        } else {
            emitter linkto(self);
        }
    } else {
        emitter = spawn("script_origin", (0, 0, 0));
        emitter.var_cbc44e3ab4fe0707 = 1;
        emitter.name = self.name;
    }
    emitter.var_58522807bce24c1c = 1;
    emitter.team = default_to(self.team, "allies");
    emitter.var_87d26ab52f61fa8b = istemp;
    /#
        if (!isdefined(level.var_a5a7ad116f37f360)) {
            level.var_a5a7ad116f37f360 = [];
        }
        level.var_a5a7ad116f37f360[level.var_a5a7ad116f37f360.size] = emitter;
        level.var_a5a7ad116f37f360 = array_removeundefined(level.var_a5a7ad116f37f360);
    #/
    emitter thread function_d45390dc3a16d16(self);
    return emitter;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4427
// Size: 0x29
function function_d45390dc3a16d16(parent) {
    self endon("entitydeleted");
    parent waittill("death");
    self stopsounds();
    waitframe();
    self delete();
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4458
// Size: 0x1a5
function function_52846cd9b5efeafe(tag, originoffset, anglesoffset, istemp) {
    if (!isdefined(self.var_4413114d1d17278b)) {
        origin = default_to(self.origin, originoffset);
        self.var_4413114d1d17278b = spawn("script_origin", origin);
        if (isent(self)) {
            if (self tagexists("j_hip_ri")) {
                tag = default_to(tag, "j_hip_ri");
            }
            originoffset = default_to(originoffset, (0, 0, 0));
            anglesoffset = default_to(anglesoffset, (0, 0, 0));
            if (isdefined(tag)) {
                self.var_4413114d1d17278b linkto(self, tag, originoffset, anglesoffset);
            } else {
                self.var_4413114d1d17278b linkto(self);
            }
        }
        self.var_4413114d1d17278b.var_ed56b39b72558e56 = 1;
        self.var_4413114d1d17278b.battlechatterallowed = 1;
        self.var_4413114d1d17278b.team = default_to(self.team, "allies");
        self.var_4413114d1d17278b.battlechatter = spawnstruct();
        if (isdefined(self.battlechatter)) {
            self.var_4413114d1d17278b.battlechatter.countryid = self.battlechatter.countryid;
        }
        self.var_4413114d1d17278b.var_87d26ab52f61fa8b = istemp;
    }
    return self.var_4413114d1d17278b;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4606
// Size: 0xc
function get_radio_alias(alias) {
    return alias;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x461b
// Size: 0x34
function function_3e5d12eb11d543a2(emitter) {
    if (!isdefined(emitter)) {
        return;
    }
    emitter endon("entitydeleted");
    waittillframeend();
    if (!isdefined(self.var_e5cf232129f9ec01) && isdefined(emitter)) {
        emitter stopsounds();
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4657
// Size: 0x55
function function_690ccae4e694f51e(emitter) {
    if (!isdefined(emitter) || emitter == self || !istrue(emitter.var_87d26ab52f61fa8b)) {
        return;
    }
    emitter.shoulddelete = 1;
    emitter endon("entitydeleted");
    waitframe();
    if (istrue(emitter.shoulddelete)) {
        emitter delete();
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46b4
// Size: 0x52
function function_c0af485270de3fbf(text) {
    setdvarifuninitialized(@"hash_ce3d6e5d48671653", 1);
    return getdvarint(@"hash_ce3d6e5d48671653") && (isistring(text) || !soundexists(text) && getsubstr(text, 0, 3) != "dx_");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4711
// Size: 0xde
function function_fb381a52cc8f3784(var_bcabc3998e6c48bf, var_bca6d5998e66477e) {
    var_bcabc3998e6c48bf = default_to(var_bcabc3998e6c48bf, 1);
    var_bca6d5998e66477e = default_to(var_bca6d5998e66477e, 0);
    level.var_a16d55725feba235 = var_bcabc3998e6c48bf;
    level.var_a1682f725fe525cc = var_bca6d5998e66477e;
    if (!var_bcabc3998e6c48bf && !var_bca6d5998e66477e) {
        return;
    }
    if (!isdefined(level.var_261aaf24a09d231d)) {
        return;
    }
    foreach (vo_data in level.var_261aaf24a09d231d) {
        speaker = vo_data.speaker;
        if (speaker.var_ec9f57e7698baffb < 0) {
            if (var_bcabc3998e6c48bf) {
                speaker notify("stop_2d_text");
            }
            if (var_bca6d5998e66477e) {
                speaker notify("stop_3d_text");
            }
        }
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x47f7
// Size: 0xed
function function_1b22b2d53ba5b092(text, duration) {
    self endon("death");
    self endon("stop_dialogue");
    self notify("stop_3d_text");
    self endon("stop_3d_text");
    alpha = 1;
    while (!isdefined(duration) || duration + 0.3 > 0) {
        if (self tagexists("j_head")) {
            origin = self gettagorigin("j_head") + (0, 0, 15);
        } else {
            origin = self.origin + (0, 0, 70);
        }
        if (isdefined(duration) && duration < 0) {
            alpha = 1 - duration * -1 / 0.3;
        }
        /#
            print3d(origin, text, (1, 1, 1), alpha, 0.3, 1, 1);
        #/
        if (isdefined(duration)) {
            duration -= 0.05;
        }
        waitframe();
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x48ec
// Size: 0x34
function function_f9e725c7fd059300(text) {
    word_count = strtok(text, " ").size;
    return max(1.5, word_count * 0.4);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4929
// Size: 0x4cd
function function_932c63c904570806(text) {
    self notify("stop_dialogue");
    self endon("death");
    self endon("stop_dialogue");
    assertex(isent(self), "<dev string:x4d6>");
    emitter = self;
    player = undefined;
    if (isplayer(self)) {
        player = self;
    }
    if (isdefined(player) || isdefined(self.vo_emitter)) {
        emitter = function_f5eb5b4d0e6714aa();
    }
    self.var_e5cf232129f9ec01 = gettime();
    self.var_800206351d64e3f4 = text;
    self.var_88502eb1e08dfc4d = undefined;
    holdtime = function_f9e725c7fd059300(text);
    color = get_team_color();
    name = get_name();
    if (!isistring(text) && isstartstr(text, ">>")) {
        text = "(RADIO) " + getsubstr(text, 2, text.size);
    } else if (!istrue(level.var_a1682f725fe525cc) || self.var_ec9f57e7698baffb >= 0) {
        if (!istrue(level.var_a1682f725fe525cc)) {
            thread function_1b22b2d53ba5b092(text, holdtime);
        }
    }
    var_5a127677fb14f8c2 = istrue(level.var_a16d55725feba235) && self.var_ec9f57e7698baffb < 0;
    if (var_5a127677fb14f8c2 || !issp()) {
        wait holdtime;
        return 1;
    }
    var_b54520c420443a7c = int(6.96);
    lineheight = int(17.4);
    var_7794fdd4649e6d7f = int(5.075);
    var_ddfeff0efa1cd0c4 = 0;
    if (isdefined(level.var_ace32b0108a3e1f1) && isdefined(level.var_ace32b0108a3e1f1[text])) {
        lines = [level.var_ace32b0108a3e1f1[text]];
        var_ddfeff0efa1cd0c4 = 1;
    } else {
        text = color + name + ": ^7" + text;
        lines = wrap_text(text, int(500 / var_b54520c420443a7c));
    }
    width = int(clamp(text.size * var_b54520c420443a7c, 0, 500));
    height = lineheight * lines.size + var_7794fdd4649e6d7f;
    endy = default_to(level.var_33a0b6852d7ff0d, 300) - height;
    if (!isdefined(level.vo_hud)) {
        level.vo_hud = [];
    }
    foreach (hud_elem in level.vo_hud) {
        hud_elem moveovertime(0.2);
        hud_elem.y -= height - 2;
    }
    hud_elems = [];
    foreach (i, text_line in lines) {
        text_elem = newhudelem();
        text_elem.speaker = self;
        text_elem.alpha = 0;
        if (var_ddfeff0efa1cd0c4) {
            text_elem.label = text_line;
            if (isdefined(self.var_8284c960ab37a90d) && isistring(self.var_8284c960ab37a90d)) {
                text_elem settext(self.var_8284c960ab37a90d);
            } else {
                text_elem settext(%DIALOGUE_TEMP/NAME_TEST);
            }
        } else {
            text_elem settext(text_line);
        }
        text_elem.fontscale = 0.6525;
        text_elem.font = "bigfixed";
        text_elem.row = i;
        text_elem function_866a3b95a50aa7c2(height, endy, lineheight, var_7794fdd4649e6d7f);
        hud_elems[hud_elems.size] = text_elem;
    }
    bg = newhudelem();
    bg.alpha = 0;
    bg setshader("black", width, height);
    bg function_866a3b95a50aa7c2(height, endy);
    hud_elems[hud_elems.size] = bg;
    level.vo_hud = array_combine(level.vo_hud, hud_elems);
    end_time = gettime() + (0.2 + holdtime) * 1000;
    thread function_f149afdd57e23278(hud_elems, holdtime);
    finished = self waittill("text_display_done");
    if (isdefined(finished) && finished == 0) {
        remaining_time = (end_time - gettime()) / 1000;
        if (remaining_time > 0) {
            wait remaining_time;
        }
        finished = 1;
    }
    return finished;
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4dff
// Size: 0x8a
function get_team_color(team) {
    team = default_to(team, self.team);
    team = default_to(team, "neutral");
    if (isstartstr(team, "team_")) {
        return "^1";
    }
    switch (team) {
    case #"hash_7c2d091e6337bf54": 
        return "^1";
    case #"hash_5f54b9bf7583687f":
    case #"hash_a571cacc018623b8": 
        return "^2";
    default: 
        return "^3";
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e91
// Size: 0xe6
function get_name() {
    if (isdefined(self.name)) {
        return self.name;
    }
    if (isdefined(self.ainame)) {
        return self.ainame;
    } else if (isplayer(self)) {
        return "Player";
    }
    team = default_to(self.team, "neutral");
    if (isdefined(level.var_fb9cab687c8a7c70) && isdefined(level.var_fb9cab687c8a7c70[team])) {
        return level.var_fb9cab687c8a7c70[team];
    }
    if (isstartstr(team, "team_")) {
        return "Enemy";
    }
    switch (self.team) {
    case #"hash_7c2d091e6337bf54": 
        return "Enemy";
    case #"hash_5f54b9bf7583687f": 
        return "Friendly";
    default: 
        return "Civilian";
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4f7f
// Size: 0xf3
function function_866a3b95a50aa7c2(height, endy, lineheight, var_7794fdd4649e6d7f) {
    self.alignx = "center";
    self.aligny = "top";
    self.x = 320;
    self.y = 300 + height;
    self.sort = 5;
    if (isdefined(self.row)) {
        self.y += self.row * lineheight + var_7794fdd4649e6d7f;
    }
    self fadeovertime(0.2);
    if (isdefined(self.row)) {
        self.y = endy + self.row * lineheight + var_7794fdd4649e6d7f;
        self.alpha = 1;
        return;
    }
    self.y = endy;
    self.alpha = default_to(level.var_97e909fed3ab1904, 0);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x507a
// Size: 0x10b
function function_f149afdd57e23278(hud_elems, holdtime) {
    finished = function_c0f47bf696bd27ac(0.2 + holdtime);
    self notify("text_display_done", finished);
    foreach (hud_elem in hud_elems) {
        hud_elem fadeovertime(0.3);
        hud_elem.alpha = 0;
    }
    wait 0.3;
    level.vo_hud = array_remove_array(level.vo_hud, hud_elems);
    if (!level.vo_hud.size) {
        level.vo_hud = undefined;
    }
    foreach (hud_elem in hud_elems) {
        hud_elem destroy();
    }
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x518d
// Size: 0x2b
function function_c0f47bf696bd27ac(holdtime) {
    self endon("death");
    self endon("stop_dialogue");
    return waittill_notify_or_timeout_return("stop_2d_text", holdtime) == "timeout";
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x51c1
// Size: 0x132
function nag_loop(nags, repeat_delay, initial_delay, loop_limit) {
    self notify("stop_nag_loop");
    self endon("death");
    self endon("stop_nag_loop");
    initial_delay = default_to(initial_delay, repeat_delay);
    if (!isdefined(level.var_a36de4031e866ce5)) {
        level function_746d94ac5ed3ee5c();
    }
    assertex(isdefined(nags), "<dev string:x507>");
    assertex(isstruct(nags) && isdefined(nags.items) && isdefined(nags.index) || isarray(nags) || isfunction(nags), "<dev string:x520>");
    if (isarray(nags) && (nags.size == 0 || !isfunction(nags[0]))) {
        assertex(nags.size, "<dev string:x54c>");
        nags = create_deck(nags, 1, 0);
    }
    do_nag(nags, initial_delay);
    for (nag_count = 1; !isdefined(loop_limit) || nag_count / nags.items.size < loop_limit; nag_count++) {
        do_nag(nags, repeat_delay);
        waitframe();
    }
    self notify("finished_nag_loop");
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x52fb
// Size: 0x25d
function do_nag(nags, delay) {
    speaker = self;
    did_nag = 0;
    current = undefined;
    if (isarray(nags) && nags.size > 0 && isfunction(nags[0])) {
        nags = speaker call_with_params(nags[0], array_remove_index(nags, 0));
        assertex(isstruct(nags) && isdefined(nags.items) && isdefined(nags.index) || isarray(nags) || isstring(nags), "<dev string:x57e>");
    } else if (isfunction(nags)) {
        nags = speaker call_with_params(nags);
        assertex(isstruct(nags) && isdefined(nags.items) && isdefined(nags.index) || isarray(nags) || isstring(nags), "<dev string:x57e>");
    }
    if (isstruct(nags)) {
        nag = nags deck_draw();
    } else {
        nag = nags;
    }
    if (isarray(nag)) {
        speaker = nag[0];
        nag = nag[1];
    }
    if (!isdefined(speaker)) {
        return;
    }
    if (isstruct(delay)) {
        current = delay.current;
    }
    result = speaker waitfor(delay);
    if (!isdefined(result) || result) {
        nagvars = default_to(self.var_a36de4031e866ce5, level.var_a36de4031e866ce5);
        did_nag = speaker say(nag, nagvars.priority, nagvars.timeout, nagvars.overlap, &started_nag, nagvars.scope);
    }
    if (!isdefined(did_nag)) {
        result = "interrupted";
    } else if (did_nag) {
        result = "finished";
    } else {
        result = "failed";
        if (isstruct(nags) && isdefined(nags.index)) {
            nags.index--;
        }
        if (isstruct(delay)) {
            delay.current = current;
        }
    }
    speaker notify("nag_" + result, nag);
    speaker notify("nag_done_or_cancelled", nag, result);
}

// Namespace dialogue / namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5560
// Size: 0x49
function started_nag() {
    self notify("started_nag", self.var_88502eb1e08dfc4d);
    if (isdefined(self.var_23471685b065b4ad)) {
        self thread [[ self.var_23471685b065b4ad ]]();
    }
    if (isdefined(level.var_23471685b065b4ad)) {
        level thread [[ level.var_23471685b065b4ad ]]();
    }
}

