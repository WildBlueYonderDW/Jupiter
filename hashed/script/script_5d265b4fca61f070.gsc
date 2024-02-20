// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5d265b4fca61f070;

#namespace dialogue;

// Namespace dialogue/namespace_71a239de73c38174
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x839
// Size: 0x217
function say(alias, priority, timeout, var_f6e387b9f5a2b39c, delay, scope) {
    /#
        assertex(isstring(alias), "Alias must be a defined string.");
    #/
    if (!soundexists(alias) && !function_c0af485270de3fbf(alias)) {
        /#
            iprintlnbold("Invalid delay type." + alias + "finished_or_cancelled");
        #/
        return 0;
    }
    self endon("death");
    priority = function_53c4c53197386572(priority, 0);
    var_f6e387b9f5a2b39c = function_53c4c53197386572(var_f6e387b9f5a2b39c, priority > 0);
    scope = function_53c4c53197386572(scope, "self");
    /#
        assertex(scope == "self" || scope == "team" || scope == "global", "^1Invalid scope:^7 Must be "self", "team", or "global"");
    #/
    speaker = self;
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
        speaker.var_568a463dbba1469c = 1;
    }
    if (is_dead_or_dying(speaker) || istrue(speaker.var_88e1b2f9582e6283) || istrue(level.var_88e1b2f9582e6283)) {
        return 0;
    }
    /#
        assertex(scope != "team" || isdefined(speaker.team), "Scope cannot be "team" if team is not assigned.");
    #/
    if (isdefined(level.var_32ed4c64de33eaa6)) {
        function_4495922f7faaffe7(level.var_32ed4c64de33eaa6, alias);
        level.var_32ed4c64de33eaa6 = undefined;
    }
    var_5564a66c3ec1c07b = spawnstruct();
    var_5564a66c3ec1c07b.alias = alias;
    var_5564a66c3ec1c07b.priority = priority;
    var_5564a66c3ec1c07b.timeout = timeout;
    var_5564a66c3ec1c07b.var_f6e387b9f5a2b39c = var_f6e387b9f5a2b39c;
    var_5564a66c3ec1c07b.speaker = speaker;
    var_5564a66c3ec1c07b.scope = scope;
    var_5564a66c3ec1c07b.var_9a4096e3a9b92412 = speaker function_28e38eefd3cc4ab();
    var_5564a66c3ec1c07b thread function_c616a96afe9e57bc(speaker, alias, priority, timeout, var_f6e387b9f5a2b39c, delay);
    if (!istrue(var_5564a66c3ec1c07b.vo_done_or_cancelled)) {
        var_5564a66c3ec1c07b waittill("vo_done_or_cancelled");
    }
    return var_5564a66c3ec1c07b.var_6170366b0d0ed9ea;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa58
// Size: 0x66
function function_4495922f7faaffe7(var_2e6e4390dc1c2fd9, alias) {
    /#
        assertex(isfloat(var_2e6e4390dc1c2fd9) || isint(var_2e6e4390dc1c2fd9), "radio_dist must be a number");
    #/
    if (!isdefined(alias)) {
        level.var_32ed4c64de33eaa6 = var_2e6e4390dc1c2fd9;
        return;
    }
    if (!isdefined(level.var_cb329546ed01d21a)) {
        level.var_cb329546ed01d21a = [];
    }
    level.var_cb329546ed01d21a[alias] = var_2e6e4390dc1c2fd9;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac5
// Size: 0x64
function say_sequence(sequence, priority, timeout, var_f6e387b9f5a2b39c, delay, scope, endons) {
    var_5564a66c3ec1c07b = create_vo_data(sequence, priority, timeout, function_53c4c53197386572(var_f6e387b9f5a2b39c, 0), delay, scope, endons);
    return function_e80002fd834a68b3(var_5564a66c3ec1c07b);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xb31
// Size: 0x4a
function function_b0c2a659a5c2761f(endons, sequence, priority, timeout, var_f6e387b9f5a2b39c, delay, scope) {
    return say_sequence(sequence, priority, timeout, var_f6e387b9f5a2b39c, delay, scope, endons);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xb83
// Size: 0x4a
function function_c9a09b3ba9c68f8d(delay, sequence, priority, timeout, var_f6e387b9f5a2b39c, scope, endons) {
    return say_sequence(sequence, priority, timeout, var_f6e387b9f5a2b39c, delay, scope, endons);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xbd5
// Size: 0x45
function function_72b26ba6d062726(sequence, priority, timeout, var_f6e387b9f5a2b39c, delay, endons) {
    return say_sequence(sequence, priority, timeout, var_f6e387b9f5a2b39c, delay, "global", endons);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc22
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
    if (utility::issp() && isplayer(self) || isstruct(self) || isdefined(self.var_63fdbddd04be9f53)) {
        emitter = function_f5eb5b4d0e6714aa();
    }
    thread function_3e5d12eb11d543a2(emitter);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcf1
// Size: 0x52
function function_bb9f95455e7b6dfe(var_96a30fd04ad50605) {
    speaker = self;
    if (level == self) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    speaker.var_88e1b2f9582e6283 = 1;
    if (istrue(var_96a30fd04ad50605)) {
        speaker set_battlechatter(0);
    }
    speaker notify("cancel_queued_vo");
    speaker notify("cancel_delayed_vo");
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd4a
// Size: 0x43
function function_49ce27ac35596e2d(var_96a30fd04ad50605) {
    speaker = self;
    if (level == self) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    speaker.var_88e1b2f9582e6283 = 1;
    if (istrue(var_96a30fd04ad50605)) {
        speaker set_battlechatter(1);
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd94
// Size: 0xc0
function function_a583984eb78c6c32(var_96a30fd04ad50605) {
    level.var_88e1b2f9582e6283 = 1;
    if (istrue(var_96a30fd04ad50605)) {
        level.var_91a8c7abdf195c70 = 1;
    }
    foreach (var_5564a66c3ec1c07b in array_combine(level.vo_queue, level.var_261aaf24a09d231d)) {
        if (!istrue(var_96a30fd04ad50605) && istrue(var_5564a66c3ec1c07b.var_79498adf23c51e6a)) {
            continue;
        }
        var_5564a66c3ec1c07b.speaker notify("cancel_queued_vo");
        var_5564a66c3ec1c07b.speaker notify("cancel_delayed_vo");
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe5b
// Size: 0x25
function function_4adf4f4524e8c0fd(var_96a30fd04ad50605) {
    level.var_88e1b2f9582e6283 = 0;
    if (istrue(var_96a30fd04ad50605)) {
        level.var_91a8c7abdf195c70 = 0;
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xe87
// Size: 0x3c
function function_3eb481d98453cecb(alias, priority, timeout, var_f6e387b9f5a2b39c, delay) {
    return namespace_71a239de73c38174::say(alias, priority, timeout, var_f6e387b9f5a2b39c, delay, "self");
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xecb
// Size: 0x3c
function say_team(alias, priority, timeout, var_f6e387b9f5a2b39c, delay) {
    return namespace_71a239de73c38174::say(alias, priority, timeout, var_f6e387b9f5a2b39c, delay, "team");
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xf0f
// Size: 0x3c
function function_e732b9fbf689e21a(alias, priority, timeout, var_f6e387b9f5a2b39c, delay) {
    return namespace_71a239de73c38174::say(alias, priority, timeout, var_f6e387b9f5a2b39c, delay, "global");
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xf53
// Size: 0x40
function function_88357f565d1badf5(delay, alias, priority, timeout, var_f6e387b9f5a2b39c, scope) {
    return namespace_71a239de73c38174::say(alias, priority, timeout, var_f6e387b9f5a2b39c, delay, scope);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xf9b
// Size: 0x3c
function function_8c1bbaeb5d3fe61a(delay, alias, priority, timeout, var_f6e387b9f5a2b39c) {
    return namespace_71a239de73c38174::say(alias, priority, timeout, var_f6e387b9f5a2b39c, delay, "self");
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xfdf
// Size: 0x3c
function function_fc0eb6b81c66c661(delay, alias, priority, timeout, var_f6e387b9f5a2b39c) {
    return namespace_71a239de73c38174::say(alias, priority, timeout, var_f6e387b9f5a2b39c, delay, "team");
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1023
// Size: 0x3c
function function_8c12d3c7fd8bc4ff(delay, alias, priority, timeout, var_f6e387b9f5a2b39c) {
    return namespace_71a239de73c38174::say(alias, priority, timeout, var_f6e387b9f5a2b39c, delay, "global");
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1067
// Size: 0xb8
function function_cb329cf8896edeaa(team, cancel_queued_vo, cancel_delayed_vo) {
    /#
        assertex(isdefined(team), "Team must be defined to stop team speaking.");
    #/
    if (!isdefined(level.var_60df2b6c3887b3eb) || !isdefined(level.var_60df2b6c3887b3eb[team])) {
        return;
    }
    foreach (var_5564a66c3ec1c07b in level.var_60df2b6c3887b3eb[team].var_261aaf24a09d231d) {
        var_5564a66c3ec1c07b.speaker stop_dialogue(cancel_queued_vo, cancel_delayed_vo);
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1126
// Size: 0x83
function function_54d3bd59bff7e908(cancel_queued_vo, cancel_delayed_vo) {
    if (!isdefined(level.var_261aaf24a09d231d)) {
        return;
    }
    foreach (var_5564a66c3ec1c07b in level.var_261aaf24a09d231d) {
        var_5564a66c3ec1c07b.speaker stop_dialogue(cancel_queued_vo, cancel_delayed_vo);
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b0
// Size: 0xc5
function is_speaking() {
    speaker = self;
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    if (!isdefined(speaker.var_e5cf232129f9ec01) || !isdefined(speaker.var_88502eb1e08dfc4d) && !isdefined(speaker.var_800206351d64e3f4)) {
        return 0;
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

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127d
// Size: 0x34
function function_8951f1a8a6f683c9() {
    speaker = self;
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    return speaker is_speaking() || isdefined(speaker.var_8329bfd06cbb047a);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b9
// Size: 0x34
function function_754c9897f3b89964() {
    speaker = self;
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    return speaker is_speaking() || istrue(speaker.var_3968de209a1c2b97);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12f5
// Size: 0x44
function function_ed8a0ba27b9104c5() {
    speaker = self;
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    return speaker is_speaking() || istrue(speaker.var_3968de209a1c2b97) || isdefined(speaker.var_8329bfd06cbb047a);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1341
// Size: 0x66
function function_d871f93553913276(team) {
    team = function_53c4c53197386572(team, self.team);
    /#
        assertex(isdefined(team), "Must provide team to check if speaking.");
    #/
    if (!isdefined(level.var_60df2b6c3887b3eb) || !isdefined(level.var_60df2b6c3887b3eb[team])) {
        return 0;
    }
    return level.var_60df2b6c3887b3eb[team].var_261aaf24a09d231d.size > 0;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13af
// Size: 0xb7
function function_6c31b0b0edd184ed(var_6f9b6fae768b41e0, cooldown) {
    cooldown = function_53c4c53197386572(cooldown, 15);
    /#
        assertex(isdefined(var_6f9b6fae768b41e0), "Must provide an array of speakers");
    #/
    /#
        assertex(isarray(var_6f9b6fae768b41e0), "Speakers must be in an array");
    #/
    foreach (speaker in var_6f9b6fae768b41e0) {
        if (speaker function_754c9897f3b89964()) {
            return 1;
        }
        var_2ac238396b2cbed8 = speaker function_bce20c074033e937();
        if (isdefined(var_2ac238396b2cbed8) && var_2ac238396b2cbed8 < cooldown) {
            return 1;
        }
    }
    return 0;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x146e
// Size: 0x1e
function function_e9e38931019c791f() {
    if (!isdefined(level.var_261aaf24a09d231d)) {
        return 0;
    }
    return level.var_261aaf24a09d231d.size > 0;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1494
// Size: 0x106
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
        return 0;
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
        wait(time_remaining);
    }
    return 1;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15a2
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

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1608
// Size: 0x7d
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

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168d
// Size: 0xde
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

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1773
// Size: 0x55
function function_53037a6cae32fb97(var, value) {
    if (!isdefined(self.var_a36de4031e866ce5)) {
        function_746d94ac5ed3ee5c();
    }
    /#
        assertex(isdefined(var) && isdefined(self.var_9080a00567019b53[var]), "Invalid nagvar");
    #/
    self.var_a36de4031e866ce5[var] = value;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x17cf
// Size: 0xf0
function function_c3a221031a1ff66c(priority, timeout, var_f6e387b9f5a2b39c, scope) {
    if (!isdefined(self.var_a36de4031e866ce5)) {
        function_746d94ac5ed3ee5c();
    }
    self.var_a36de4031e866ce5.priority = function_53c4c53197386572(priority, self.var_a36de4031e866ce5.priority);
    self.var_a36de4031e866ce5.timeout = function_53c4c53197386572(timeout, self.var_a36de4031e866ce5.timeout);
    self.var_a36de4031e866ce5.var_f6e387b9f5a2b39c = function_53c4c53197386572(var_f6e387b9f5a2b39c, self.var_a36de4031e866ce5.var_f6e387b9f5a2b39c);
    self.var_a36de4031e866ce5.scope = function_53c4c53197386572(scope, self.var_a36de4031e866ce5.scope);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c6
// Size: 0xea
function function_746d94ac5ed3ee5c() {
    if (self != level && !isdefined(level.var_a36de4031e866ce5)) {
        level function_746d94ac5ed3ee5c();
    }
    self.var_a36de4031e866ce5 = spawnstruct();
    self.var_a36de4031e866ce5.priority = function_53c4c53197386572(level.var_a36de4031e866ce5.priority, 0);
    self.var_a36de4031e866ce5.timeout = function_53c4c53197386572(level.var_a36de4031e866ce5.timeout, 1);
    self.var_a36de4031e866ce5.var_f6e387b9f5a2b39c = function_53c4c53197386572(level.var_a36de4031e866ce5.var_f6e387b9f5a2b39c, 0);
    self.var_a36de4031e866ce5.scope = function_53c4c53197386572(level.var_a36de4031e866ce5.scope, "team");
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b7
// Size: 0xa5
function nag_wait(var_f4b4fe5611c0f995, nags, var_4b0c85beee0df862, initial_delay, var_206ca980a28e3343, var_d032257acca66a08) {
    self endon("finished_nag_loop");
    if (ter_op(istrue(var_d032257acca66a08), !flag(var_f4b4fe5611c0f995), flag(var_f4b4fe5611c0f995))) {
        return;
    }
    var_344578fb5c1f5325 = spawnstruct();
    childthread nagtill([0:var_344578fb5c1f5325, 1:"stop"], nags, var_4b0c85beee0df862, initial_delay, var_206ca980a28e3343);
    if (istrue(var_d032257acca66a08)) {
        flag_waitopen(var_f4b4fe5611c0f995);
    } else {
        flag_wait(var_f4b4fe5611c0f995);
    }
    var_344578fb5c1f5325 notify("stop");
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1a63
// Size: 0x3a
function function_bace8af56ef0688b(var_f4b4fe5611c0f995, nags, var_4b0c85beee0df862, initial_delay, var_206ca980a28e3343) {
    nag_wait(var_f4b4fe5611c0f995, nags, var_4b0c85beee0df862, initial_delay, var_206ca980a28e3343, 1);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1aa4
// Size: 0x13e
function function_91c23782840cf632(var_eb053d490b6594d2, nags, var_4b0c85beee0df862, initial_delay, var_206ca980a28e3343, var_d032257acca66a08) {
    self endon("finished_nag_loop");
    foreach (var_f4b4fe5611c0f995 in var_eb053d490b6594d2) {
        if (ter_op(istrue(var_d032257acca66a08), !flag(var_f4b4fe5611c0f995), flag(var_f4b4fe5611c0f995))) {
            return;
        }
    }
    var_344578fb5c1f5325 = spawnstruct();
    childthread nagtill([0:var_344578fb5c1f5325, 1:"stop"], nags, var_4b0c85beee0df862, initial_delay, var_206ca980a28e3343);
    while (1) {
        function_5adca43f839a3cce(var_eb053d490b6594d2);
        foreach (var_f4b4fe5611c0f995 in var_eb053d490b6594d2) {
            if (ter_op(istrue(var_d032257acca66a08), !flag(var_f4b4fe5611c0f995), flag(var_f4b4fe5611c0f995))) {
                var_344578fb5c1f5325 notify("stop");
                return;
            }
        }
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1be9
// Size: 0x15c
function function_91cb20828416e24b(var_eb053d490b6594d2, nags, var_4b0c85beee0df862, initial_delay, var_206ca980a28e3343, var_d032257acca66a08) {
    self endon("finished_nag_loop");
    foreach (var_f4b4fe5611c0f995 in var_eb053d490b6594d2) {
        if (ter_op(istrue(var_d032257acca66a08), flag(var_f4b4fe5611c0f995), !flag(var_f4b4fe5611c0f995))) {
            continue;
        }
        return;
    }
    var_344578fb5c1f5325 = spawnstruct();
    childthread nagtill([0:var_344578fb5c1f5325, 1:"stop"], nags, var_4b0c85beee0df862, initial_delay, var_206ca980a28e3343);
    exit = 0;
    while (exit == 0) {
        level function_5adca43f839a3cce(var_eb053d490b6594d2);
        exit = 1;
        foreach (var_f4b4fe5611c0f995 in var_eb053d490b6594d2) {
            if (ter_op(istrue(var_d032257acca66a08), flag(var_f4b4fe5611c0f995), !flag(var_f4b4fe5611c0f995))) {
                exit = 0;
                break;
            }
        }
    }
    var_344578fb5c1f5325 notify("stop");
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d4c
// Size: 0xb8
function nagtill(var_a490edba2726ec98, nags, var_4b0c85beee0df862, initial_delay, var_206ca980a28e3343) {
    self endon("finished_nag_loop");
    /#
        assertex(isdefined(var_4b0c85beee0df862), "Nag must have defined repeat delay.");
    #/
    var_344578fb5c1f5325 = self;
    var_ac1cddfbb55b0e81 = var_a490edba2726ec98;
    if (isarray(var_a490edba2726ec98)) {
        /#
            assertex(var_a490edba2726ec98.size == 2 && (isent(var_a490edba2726ec98[0]) || isstruct(var_a490edba2726ec98[0])) && isstring(var_a490edba2726ec98[1]), "Endon data array must be array of ent-string pair.");
        #/
        var_344578fb5c1f5325 = var_a490edba2726ec98[0];
        var_ac1cddfbb55b0e81 = var_a490edba2726ec98[1];
    }
    var_344578fb5c1f5325 endon(var_ac1cddfbb55b0e81);
    function_407745805f870(nags, var_4b0c85beee0df862, initial_delay, var_206ca980a28e3343);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1e0b
// Size: 0xc1
function function_a60fea4f51763a4f(var_a490edba2726ec98, nags, var_4b0c85beee0df862, initial_delay, var_206ca980a28e3343) {
    var_344578fb5c1f5325 = self;
    foreach (var_a240832e918cda1f in var_a490edba2726ec98) {
        if (isent(var_a240832e918cda1f) || isstruct(var_a240832e918cda1f)) {
            var_344578fb5c1f5325 = var_a240832e918cda1f;
        } else if (isstring(var_a240832e918cda1f)) {
            var_344578fb5c1f5325 endon(var_a240832e918cda1f);
        } else {
            /#
                assertmsg("endon_data array contains invalid endon data type");
            #/
        }
    }
    function_407745805f870(nags, var_4b0c85beee0df862, initial_delay, var_206ca980a28e3343);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed3
// Size: 0x58
function function_b9007d9f0ff19676(start, end, count) {
    delay = spawnstruct();
    delay.current = start;
    delay.maximum = end;
    delay.increment = (end - start) / count;
    return delay;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f33
// Size: 0x224
function function_b0fddb86a2358953(delay, params) {
    /#
        assertex(isdefined(delay), "Cannot wait for an undefined delay.");
    #/
    if (isarray(delay)) {
        if (delay.size == 1 && isnumber(delay[0])) {
            delay = (delay[0] - gettime()) / 1000;
        } else if (isfunction(delay[0]) || isbuiltinmethod(delay[0]) || isbuiltinfunction(delay[0])) {
            return call_with_params(delay[0], array_remove_index(delay, 0));
        } else if (delay.size == 2 && (isent(delay[0]) || isstruct(delay[0])) && isstring(delay[1])) {
            value = delay[0] waittill(delay[1]);
            return value;
        } else if (delay.size == 2 && isnumber(delay[0]) && isnumber(delay[1])) {
            /#
                assertex(delay[0] >= 0 && delay[1] >= delay[1], "Number range must be two positive numbers, with the second greater or equal to the first.");
            #/
            wait(randomfloatrange(delay[0], delay[1]));
            return 1;
        } else {
            return function_cf139ec9192b3dae(delay, params);
        }
    }
    if (isnumber(delay)) {
        if (delay <= 0) {
            return;
        }
        wait(delay);
        return 1;
    }
    if (isstruct(delay) && isdefined(delay.current)) {
        wait(delay.current);
        if (isdefined(delay.increment)) {
            delay.current = delay.current + delay.increment;
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
    /#
        assertmsg("Invalid delay type.");
    #/
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x215e
// Size: 0xc5
function function_cf139ec9192b3dae(delays, params) {
    if (!isarray(delays)) {
        function_b0fddb86a2358953(delays, params);
        return delays;
    }
    ent = spawnstruct();
    ent endon("kill");
    foreach (delay in delays) {
        childthread function_d74571b48c6d763b(delay, "finished", ent, params);
    }
    delay = result = ent waittill("finished");
    ent delaythread(0.05, &send_notify, "kill");
    return result;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x222b
// Size: 0x46
function function_d74571b48c6d763b(delay, msg, notify_ent, params) {
    if (!isdefined(notify_ent)) {
        notify_ent = self;
    }
    result = function_b0fddb86a2358953(delay, params);
    notify_ent notify(msg, result);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2278
// Size: 0x45
function function_5cf2ff53d6a7c938(delays, msg, notify_ent, params) {
    if (!isdefined(notify_ent)) {
        notify_ent = self;
    }
    result = function_cf139ec9192b3dae(delays, params);
    notify_ent notify(msg, result);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x22c4
// Size: 0x44
function function_97a6f7c8f1800369(delay, params, msg) {
    struct = spawnstruct();
    thread function_d74571b48c6d763b(delay, function_53c4c53197386572(msg, "finish"), struct, params);
    return struct;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2310
// Size: 0x61
function call_with_params(func, params) {
    if (isfunction(func)) {
        return call_with_params_script(func, params);
    } else if (isbuiltinmethod(func)) {
        return call_with_params_builtin(func, params);
    } else if (isbuiltinfunction(func)) {
        return function_8093ac75aa6abb73(func, params);
    } else {
        /#
            assertmsg("Func must be a function: either a script function or a builtin function/method.");
        #/
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2378
// Size: 0x1bd
function call_with_params_script(func, params) {
    /#
        assertex(isfunction(func), "Func must be a script function.");
    #/
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
        /#
            assertmsg("Params array is too large: cannot have more than 9 params");
        #/
        break;
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x253c
// Size: 0x1c8
function call_with_params_builtin(func, params) {
    /#
        assertex(isbuiltinmethod(func), "Func must be a builtin method ( a function that is called on an ent ).");
    #/
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
        /#
            assertmsg("Params array is too large: cannot have more than 9 params");
        #/
        break;
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270b
// Size: 0x1bd
function function_8093ac75aa6abb73(func, params) {
    /#
        assertex(isbuiltinfunction(func), "Func must be a builtin function ( a function NOT called on an ent ).");
    #/
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
        /#
            assertmsg("Params array is too large: cannot have more than 9 params");
        #/
        break;
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x28cf
// Size: 0x4e
function function_ea6f404468959fd2(timeout, func, params) {
    ent = spawnstruct();
    ent delaythread(timeout, &send_notify, "kill");
    ent endon("kill");
    return call_with_params(func, params);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2925
// Size: 0x221
function create_vo_data(sequence, priority, timeout, var_f6e387b9f5a2b39c, delay, scope, endons) {
    /#
        assertex(isdefined(sequence), "Sequence must be defined.");
    #/
    speaker = self;
    if (self == level) {
        speaker = function_f5eb5b4d0e6714aa();
    }
    if (is_dead_or_dying(speaker) || istrue(speaker.var_88e1b2f9582e6283) || istrue(level.var_88e1b2f9582e6283)) {
        return;
    }
    var_a7ab82ff3cc6ac85 = ter_op(isdefined(speaker.team), "team", "global");
    scope = function_53c4c53197386572(scope, var_a7ab82ff3cc6ac85);
    /#
        assertex(scope == "self" || scope == "team" || scope == "global", "^1Invalid scope:^7 Must be "self", "team", or "global"");
    #/
    /#
        assertex(scope != "team" || isdefined(speaker.team), "Scope cannot be "team" if team is not assigned.");
    #/
    var_5564a66c3ec1c07b = spawnstruct();
    var_5564a66c3ec1c07b.owner = self;
    var_5564a66c3ec1c07b.speaker = speaker;
    var_5564a66c3ec1c07b.var_9a4096e3a9b92412 = speaker function_28e38eefd3cc4ab();
    var_5564a66c3ec1c07b.var_c6122c93e719738e = 1;
    if (!isarray(sequence)) {
        sequence = [0:sequence];
    }
    var_5564a66c3ec1c07b.index = 0;
    var_5564a66c3ec1c07b.sequence = sequence;
    var_5564a66c3ec1c07b.priority = function_53c4c53197386572(priority, 0);
    var_5564a66c3ec1c07b.var_f6e387b9f5a2b39c = function_53c4c53197386572(var_f6e387b9f5a2b39c, 1);
    var_5564a66c3ec1c07b.endons = function_53c4c53197386572(endons, []);
    var_5564a66c3ec1c07b.timeout = timeout;
    var_5564a66c3ec1c07b.delay = delay;
    var_5564a66c3ec1c07b.scope = scope;
    if (!isarray(var_5564a66c3ec1c07b.endons)) {
        var_5564a66c3ec1c07b.endons = [0:var_5564a66c3ec1c07b.endons];
    }
    return var_5564a66c3ec1c07b;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4e
// Size: 0x3e
function function_e80002fd834a68b3(var_5564a66c3ec1c07b) {
    if (!isdefined(var_5564a66c3ec1c07b)) {
        return 0;
    }
    var_5564a66c3ec1c07b thread function_9a5ad53e35891fd4();
    if (!istrue(var_5564a66c3ec1c07b.finished_or_cancelled)) {
        var_5564a66c3ec1c07b waittill("finished_or_cancelled");
    }
    return var_5564a66c3ec1c07b.finished;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b94
// Size: 0x24a
function function_c616a96afe9e57bc(speaker, alias, priority, timeout, var_f6e387b9f5a2b39c, delay) {
    self.finished = 0;
    speaker.var_44e1869b50a57309 = self.scope;
    speaker notify("started_queue_wait", self);
    cancelled = self.var_9a4096e3a9b92412[self.scope] function_f2a79001721945a(self, timeout);
    speaker notify("finished_queue_wait", self);
    if (!istrue(cancelled) && !is_dead_or_dying(speaker) && !istrue(speaker.var_88e1b2f9582e6283) && !istrue(level.var_88e1b2f9582e6283)) {
        speaker.var_ec9f57e7698baffb = priority;
        foreach (ent in self.var_9a4096e3a9b92412) {
            ent function_797820cad48747ef(self);
        }
        self notify("proceeded");
        cancelled = speaker function_19e262da812ccbef(delay, alias);
        speaker.var_8329bfd06cbb047a = undefined;
        speaker.var_c037496486cc9d4b = undefined;
        speaker notify("stop_bcs_sequence");
        if (isdefined(cancelled) && !cancelled) {
            function_76f8015b9b041e57(var_f6e387b9f5a2b39c, self.var_9a4096e3a9b92412[self.scope]);
            self.var_6170366b0d0ed9ea = speaker function_7b52f05da542c2ff(alias, var_f6e387b9f5a2b39c, self.var_9a4096e3a9b92412[self.scope], self.var_5c1322185369efcd);
        }
        if (is_dead_or_dying(speaker)) {
            speaker stop_dialogue(0, 0);
        }
        foreach (ent in self.var_9a4096e3a9b92412) {
            ent remove_vo_data(self);
        }
    } else {
        self notify("proceeded");
    }
    function_ab8711048f02259d(self.var_9a4096e3a9b92412);
    self.vo_done_or_cancelled = 1;
    speaker notify("vo_done_or_cancelled", self);
    self notify("vo_done_or_cancelled");
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2de5
// Size: 0x100
function function_76f8015b9b041e57(var_f6e387b9f5a2b39c, var_f30b49a2bc186dd5) {
    if (!istrue(var_f6e387b9f5a2b39c)) {
        speaker = function_53c4c53197386572(self.var_868e98cf48b92cfb, self);
        foreach (var_5564a66c3ec1c07b in var_f30b49a2bc186dd5.var_261aaf24a09d231d) {
            if (var_5564a66c3ec1c07b == self) {
                continue;
            }
            var_76ff72b66d59a33 = var_5564a66c3ec1c07b.speaker;
            var_c578b4a015b24cd8 = utility::issp() || isstruct(speaker) || isstruct(var_76ff72b66d59a33);
            if (var_c578b4a015b24cd8 || distance2dsquared(speaker.origin, var_76ff72b66d59a33.origin) <= level.var_c1ed820e79e07b7c) {
                var_76ff72b66d59a33 stop_dialogue(0, 1);
            }
        }
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eec
// Size: 0x195
function function_9a5ad53e35891fd4() {
    self.finished = 0;
    self.finished_or_cancelled = 0;
    self.speaker.var_44e1869b50a57309 = self.scope;
    self.speaker notify("started_queue_wait", self);
    cancelled = self.var_9a4096e3a9b92412[self.scope] function_f2a79001721945a(self, self.timeout, self.endons);
    self.speaker notify("finished_queue_wait", self);
    if (!istrue(cancelled) && !is_dead_or_dying(self.speaker) && !istrue(self.speaker.var_88e1b2f9582e6283) && !istrue(level.var_88e1b2f9582e6283)) {
        function_a79d3edb8b0d3d9c();
    } else {
        self notify("proceeded");
    }
    if (!isdefined(self.finished)) {
        if (isdefined(self.var_5a99a0a244447afd)) {
            self thread [[ self.var_5a99a0a244447afd ]]();
        }
    } else if (!self.finished) {
        if (isdefined(self.var_7731e4e561fe4d38)) {
            self thread [[ self.var_7731e4e561fe4d38 ]]();
        }
    } else if (isdefined(self.var_d33b713a010187c)) {
        self thread [[ self.var_d33b713a010187c ]]();
    }
    function_ab8711048f02259d(self.var_9a4096e3a9b92412);
    self.speaker notify("vo_finished_or_cancelled", self);
    level notify("vo_finished_or_cancelled", self);
    self.finished_or_cancelled = 1;
    self notify("finished_or_cancelled");
    return self.finished;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3089
// Size: 0x1e3
function function_a79d3edb8b0d3d9c() {
    level notify("vo_sequence_started", self);
    self.speaker.var_ec9f57e7698baffb = self.priority;
    foreach (ent in self.var_9a4096e3a9b92412) {
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
        function_76f8015b9b041e57(self.var_f6e387b9f5a2b39c, self.var_9a4096e3a9b92412[self.scope]);
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
    foreach (ent in self.var_9a4096e3a9b92412) {
        ent remove_vo_data(self);
    }
    level notify("vo_sequence_ended", self);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3273
// Size: 0x3bb
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
    if (istrue(self.speaker.var_88e1b2f9582e6283) || istrue(level.var_88e1b2f9582e6283)) {
        return function_139ccec48e7e3539("VO DISABLED");
    }
    self.var_9a4096e3a9b92412[self.scope] endon("stop_vo_sequence");
    self.speaker endon("stop_vo_sequence");
    self.speaker endon("death");
    self notify("new_segment");
    var_344578fb5c1f5325 = self.speaker;
    foreach (var_a490edba2726ec98 in self.endons) {
        if (isent(var_a490edba2726ec98) || isstruct(var_a490edba2726ec98)) {
            var_344578fb5c1f5325 = var_a490edba2726ec98;
        } else if (isstring(var_a490edba2726ec98)) {
            var_344578fb5c1f5325 endon(var_a490edba2726ec98);
        }
    }
    self.alias = undefined;
    segment = self.sequence[self.index];
    self.index++;
    if (isstring(segment)) {
        self.alias = segment;
        if (!soundexists(self.alias) && !function_c0af485270de3fbf(self.alias)) {
            /#
                iprintlnbold("Invalid delay type." + self.alias + "finished_or_cancelled");
            #/
            return function_139ccec48e7e3539("MISSING ALIAS");
        }
        finished = self.speaker function_7b52f05da542c2ff(self.alias, self.var_f6e387b9f5a2b39c, self.var_9a4096e3a9b92412[self.scope], self.var_5c1322185369efcd);
        if (!istrue(finished)) {
            return function_139ccec48e7e3539("SAY INTERRUPTED");
        }
        return 0;
    } else if (isnumber(segment)) {
        if (segment <= 0) {
            return 0;
        }
        wait(segment);
        return 0;
    } else if (isent(segment) || isstruct(segment)) {
        result = function_8853208b795fe407(segment);
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
            } else {
                sequence[sequence.size] = self.sequence[i];
            }
        }
        self.sequence = sequence;
        return 0;
    }
    return function_139ccec48e7e3539("UNDEFINED SEGMENT");
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3636
// Size: 0x49
function function_139ccec48e7e3539(reason) {
    /#
        if (!getdvarint(@"hash_62a9dffcf730f69")) {
            return;
        }
        iprintlnbold("UNDEFINED SEGMENT" + reason + "proceed" + function_53c4c53197386572(self.name, "script_origin"));
    #/
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3686
// Size: 0x2bd
function function_ac754fead4684fbc() {
    /#
        self endon("black");
        for (;;) {
            sequence = self.sequence;
            var_3e55110c18e69a9f = 0;
            for (i = 0; i < sequence.size; i++) {
                var_67d117e11f6e4cc = undefined;
                segment = sequence[i];
                if (isstring(segment)) {
                    var_67d117e11f6e4cc = "<unknown string>" + segment;
                } else if (isnumber(segment)) {
                    var_67d117e11f6e4cc = "<unknown string>" + segment + "<unknown string>";
                } else if (isent(segment)) {
                    var_8efef5b1e4d79b79 = "<unknown string>" + segment getentitynumber();
                    var_67d117e11f6e4cc = "<unknown string>";
                    if (isdefined(segment.animname)) {
                        var_67d117e11f6e4cc = var_67d117e11f6e4cc + segment.animname + "<unknown string>" + var_8efef5b1e4d79b79 + "<unknown string>";
                    } else {
                        var_67d117e11f6e4cc = var_67d117e11f6e4cc + var_8efef5b1e4d79b79;
                    }
                }
                if (isdefined(var_67d117e11f6e4cc)) {
                    var_9ef7c7fe01448dee = i == self.index - 1;
                    setdvarifuninitialized(@"hash_91d2bfdbf8875369", 1350);
                    setdvarifuninitialized(@"hash_91d2bedbf8875136", 500);
                    var_dcebffdb83b0ff93 = getdvarint(@"hash_91d2bfdbf8875369");
                    var_dcebfedb83b0fd60 = getdvarint(@"hash_91d2bedbf8875136");
                    if (isdefined(self.name)) {
                        var_bd00ebb44a0208e0 = "<unknown string>" + self.speaker getentitynumber() + "<unknown string>" + self.name + "<unknown string>";
                        printtoscreen2d(var_dcebffdb83b0ff93, var_dcebfedb83b0fd60 + 22, var_bd00ebb44a0208e0, (0, 0, 0), 1.75);
                        printtoscreen2d(var_dcebffdb83b0ff93 - 2, var_dcebfedb83b0fd60 + 20, var_bd00ebb44a0208e0, (1, 1, 0), 1.75);
                    }
                    color = ter_op(var_9ef7c7fe01448dee, (0, 0.85, 0), (1, 1, 1));
                    space = ter_op(var_9ef7c7fe01448dee, 35, 25);
                    scale = ter_op(var_9ef7c7fe01448dee, 2, 1.5);
                    printtoscreen2d(var_dcebffdb83b0ff93 + 2, var_dcebfedb83b0fd60 + 52 + var_3e55110c18e69a9f + var_9ef7c7fe01448dee * 10, var_67d117e11f6e4cc, (0, 0, 0), scale);
                    printtoscreen2d(var_dcebffdb83b0ff93 + 2, var_dcebfedb83b0fd60 + 52 + var_3e55110c18e69a9f + var_9ef7c7fe01448dee * 10, var_67d117e11f6e4cc, (0, 0, 0), scale);
                    printtoscreen2d(var_dcebffdb83b0ff93, var_dcebfedb83b0fd60 + 50 + var_3e55110c18e69a9f + var_9ef7c7fe01448dee * 10, var_67d117e11f6e4cc, color, scale);
                    var_3e55110c18e69a9f = var_3e55110c18e69a9f + space;
                }
            }
            waitframe();
        }
    #/
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x394a
// Size: 0x10f
function function_8853208b795fe407(var_65e9c81367809607) {
    foreach (ent in self.var_9a4096e3a9b92412) {
        ent remove_vo_data(self);
    }
    if (var_65e9c81367809607 == level) {
        var_65e9c81367809607 = var_65e9c81367809607 function_f5eb5b4d0e6714aa();
    }
    self.var_6727329a89208345 = self.speaker;
    self.speaker = var_65e9c81367809607;
    self.speaker.var_ec9f57e7698baffb = self.priority;
    self.var_9a4096e3a9b92412 = self.speaker function_28e38eefd3cc4ab();
    foreach (ent in self.var_9a4096e3a9b92412) {
        ent function_797820cad48747ef(self);
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a60
// Size: 0x9b
function function_19e262da812ccbef(delay, var_30356ee6394ecf19) {
    if (!isdefined(delay)) {
        return 0;
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
    result = function_b0fddb86a2358953(delay);
    return isint(result) && result == 0;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b03
// Size: 0x98
function function_7b52f05da542c2ff(alias, var_f6e387b9f5a2b39c, var_f30b49a2bc186dd5, var_5c1322185369efcd) {
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
        finished = function_e7c1c9dee13137aa(alias, var_5c1322185369efcd);
    } else {
        finished = 0;
    }
    self notify("done_saying", alias);
    return finished;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ba3
// Size: 0x63
function function_e7c1c9dee13137aa(alias, var_5c1322185369efcd) {
    self endon("death");
    self.var_e5cf232129f9ec01 = gettime();
    self.var_88502eb1e08dfc4d = alias;
    self.var_800206351d64e3f4 = undefined;
    if (isdefined(var_5c1322185369efcd) && utility::issp()) {
        thread function_5baebd9837531e1f(alias, var_5c1322185369efcd);
    }
    return self [[ level.var_9a62261b5b534b06 ]](alias);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c0e
// Size: 0xac
function function_f2a79001721945a(var_5564a66c3ec1c07b, timeout, endons) {
    var_5564a66c3ec1c07b endon("proceed");
    if (self.var_261aaf24a09d231d.size == 0 || !istrue(var_5564a66c3ec1c07b.var_79498adf23c51e6a) && var_5564a66c3ec1c07b.priority >= 0 && function_623d7aa584b346ac()) {
        return 0;
    }
    function_5ee32a2da994afab(var_5564a66c3ec1c07b);
    cancelled = !istrue(var_5564a66c3ec1c07b.speaker function_f983ce9b3755f759(timeout, endons));
    function_4866daf9001cdb5f(var_5564a66c3ec1c07b);
    if (cancelled || !var_5564a66c3ec1c07b function_6cf6a58c99522e20(self.var_261aaf24a09d231d)) {
        return 1;
    }
    return 0;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cc2
// Size: 0x63
function private function_623d7aa584b346ac() {
    foreach (var_5564a66c3ec1c07b in self.var_261aaf24a09d231d) {
        if (!istrue(var_5564a66c3ec1c07b.var_79498adf23c51e6a)) {
            return 0;
        }
    }
    return 1;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2d
// Size: 0xc5
function function_ab8711048f02259d(var_9a4096e3a9b92412) {
    foreach (var_f30b49a2bc186dd5 in var_9a4096e3a9b92412) {
        if (!isdefined(var_f30b49a2bc186dd5.vo_queue) || var_f30b49a2bc186dd5.vo_queue.size == 0) {
            continue;
        }
        var_104668542102dc3c = var_f30b49a2bc186dd5.vo_queue[0];
        if (var_f30b49a2bc186dd5.var_261aaf24a09d231d.size == 0 || var_104668542102dc3c function_ca829a8ed4c9efbe(var_f30b49a2bc186dd5)) {
            var_f30b49a2bc186dd5 function_4866daf9001cdb5f(var_104668542102dc3c);
            var_104668542102dc3c notify("proceed");
            var_104668542102dc3c waittill("proceeded");
            return;
        }
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3df9
// Size: 0xdc
function private function_f983ce9b3755f759(timeout, endons) {
    self endon("death");
    if (isdefined(endons)) {
        if (!isarray(endons)) {
            endons = [0:endons];
        }
        var_344578fb5c1f5325 = self;
        foreach (var_a490edba2726ec98 in endons) {
            if (isent(var_a490edba2726ec98) || isstruct(var_a490edba2726ec98)) {
                var_344578fb5c1f5325 = var_a490edba2726ec98;
            } else if (isstring(var_a490edba2726ec98)) {
                var_344578fb5c1f5325 endon(var_a490edba2726ec98);
            }
        }
    }
    if (isdefined(timeout)) {
        self endon("cancel_queued_vo");
        result = function_b0fddb86a2358953(timeout);
        return (!isint(result) || result);
    }
    self waittill("cancel_queued_vo");
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3edc
// Size: 0xd
function private function_ca829a8ed4c9efbe(var_f30b49a2bc186dd5) {
    return 0;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ef1
// Size: 0x1e2
function function_6cf6a58c99522e20(var_372fac4e460e7107, var_7f94b97d0581da71) {
    if (isstruct(var_372fac4e460e7107)) {
        var_372fac4e460e7107 = var_372fac4e460e7107.var_261aaf24a09d231d;
    }
    speakers = [];
    if (utility::issp() || !isdefined(self.speaker.origin) || istrue(self.speaker.var_568a463dbba1469c) || istrue(self.speaker.var_cbc44e3ab4fe0707)) {
        foreach (var_5564a66c3ec1c07b in var_372fac4e460e7107) {
            speakers[speakers.size] = var_5564a66c3ec1c07b.speaker;
        }
    } else {
        foreach (var_5564a66c3ec1c07b in var_372fac4e460e7107) {
            speaker = var_5564a66c3ec1c07b.speaker;
            if (isstruct(speaker) || istrue(speaker.var_cbc44e3ab4fe0707) || distance2dsquared(self.speaker.origin, speaker.origin) <= level.var_c1ed820e79e07b7c) {
                speakers[speakers.size] = speaker;
            }
        }
    }
    if (self.priority >= 1 || speakers.size == 0) {
        return 1;
    }
    var_63803077b6413ba4 = speakers[0].var_ec9f57e7698baffb;
    if (!isdefined(var_63803077b6413ba4)) {
        return 1;
    }
    if (istrue(var_7f94b97d0581da71)) {
        return (self.priority >= var_63803077b6413ba4);
    } else {
        return (self.priority > var_63803077b6413ba4);
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40da
// Size: 0xc8
function private function_5ee32a2da994afab(struct) {
    if (!isdefined(struct.speaker.var_3968de209a1c2b97)) {
        struct.speaker.var_3968de209a1c2b97 = 0;
    }
    struct.speaker.var_3968de209a1c2b97++;
    for (i = self.vo_queue.size; 1; i--) {
        if (i == 0 || self.vo_queue[i - 1].priority >= struct.priority) {
            self.vo_queue[i] = struct;
            return;
        }
        self.vo_queue[i] = self.vo_queue[i - 1];
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41a9
// Size: 0xc8
function private function_4866daf9001cdb5f(struct) {
    found = 0;
    for (i = 0; i < self.vo_queue.size; i++) {
        if (found) {
            self.vo_queue[i - 1] = self.vo_queue[i];
        } else if (self.vo_queue[i] == struct) {
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

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4278
// Size: 0xc0
function function_797820cad48747ef(var_5564a66c3ec1c07b) {
    for (i = self.var_261aaf24a09d231d.size; 1; i--) {
        if (i == 0 || isalive(self.var_261aaf24a09d231d[i - 1].speaker) && isdefined(self.var_261aaf24a09d231d[i - 1].priority) && self.var_261aaf24a09d231d[i - 1].priority >= var_5564a66c3ec1c07b.priority) {
            self.var_261aaf24a09d231d[i] = var_5564a66c3ec1c07b;
            return;
        }
        self.var_261aaf24a09d231d[i] = self.var_261aaf24a09d231d[i - 1];
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x433f
// Size: 0x9e
function remove_vo_data(var_5564a66c3ec1c07b) {
    if (!isdefined(self) || !isdefined(self.var_261aaf24a09d231d)) {
        return;
    }
    found = 0;
    for (i = 0; i < self.var_261aaf24a09d231d.size; i++) {
        if (found) {
            self.var_261aaf24a09d231d[i - 1] = self.var_261aaf24a09d231d[i];
        } else if (self.var_261aaf24a09d231d[i] == var_5564a66c3ec1c07b) {
            found = 1;
        }
    }
    if (found) {
        self.var_261aaf24a09d231d[self.var_261aaf24a09d231d.size - 1] = undefined;
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43e4
// Size: 0xb0
function function_28e38eefd3cc4ab() {
    if (!isdefined(level.var_60df2b6c3887b3eb)) {
        level.var_60df2b6c3887b3eb = [];
    }
    if (isdefined(self.team) && !isdefined(level.var_60df2b6c3887b3eb[self.team])) {
        level.var_60df2b6c3887b3eb[self.team] = spawnstruct();
    }
    var_9a4096e3a9b92412 = [];
    var_9a4096e3a9b92412["self"] = function_a940efae252424c5();
    if (isdefined(self.team)) {
        var_9a4096e3a9b92412["team"] = level.var_60df2b6c3887b3eb[self.team] function_a940efae252424c5();
    }
    var_9a4096e3a9b92412["global"] = level function_a940efae252424c5();
    return var_9a4096e3a9b92412;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x449c
// Size: 0x32
function private function_a940efae252424c5() {
    if (!isdefined(self.var_261aaf24a09d231d)) {
        self.var_261aaf24a09d231d = [];
    }
    if (!isdefined(self.vo_queue)) {
        self.vo_queue = [];
    }
    return self;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x44d6
// Size: 0x18
function function_4fba9e11ee207d7c(alias) {
    return lookupsoundlength(alias, 1) / 1000;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44f6
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

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4570
// Size: 0x96
function function_5baebd9837531e1f(alias, var_5c1322185369efcd) {
    if (!isarray(var_5c1322185369efcd)) {
        var_5c1322185369efcd = [0:var_5c1322185369efcd];
    }
    wait(0.1);
    foreach (receiver in var_5c1322185369efcd) {
        if (is_dead_or_dying(receiver) || receiver == self) {
            continue;
        }
        receiver playcontextsound(alias, "dx_type", "dx_radio_3d");
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x460d
// Size: 0x4d
function function_f5eb5b4d0e6714aa(tag, originoffset, anglesoffset, var_ac180ceb6dc3c95b) {
    if (!isdefined(self.var_63fdbddd04be9f53)) {
        self.var_63fdbddd04be9f53 = function_3a8815118a9b0d69(tag, originoffset, anglesoffset, var_ac180ceb6dc3c95b);
    }
    return self.var_63fdbddd04be9f53;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4662
// Size: 0x17b
function function_3a8815118a9b0d69(tag, originoffset, anglesoffset, var_ac180ceb6dc3c95b) {
    if (isent(self)) {
        if (self tagexists("j_head")) {
            tag = function_53c4c53197386572(tag, "j_head");
        }
        originoffset = function_53c4c53197386572(originoffset, (0, 0, 0));
        anglesoffset = function_53c4c53197386572(anglesoffset, (0, 0, 0));
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
    emitter.team = function_53c4c53197386572(self.team, "allies");
    emitter.var_87d26ab52f61fa8b = var_ac180ceb6dc3c95b;
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

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47e5
// Size: 0x2a
function function_d45390dc3a16d16(parent) {
    self endon("entitydeleted");
    parent waittill("death");
    self stopsounds();
    waitframe();
    self delete();
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4816
// Size: 0x1a5
function function_52846cd9b5efeafe(tag, originoffset, anglesoffset, var_ac180ceb6dc3c95b) {
    if (!isdefined(self.var_4413114d1d17278b)) {
        origin = function_53c4c53197386572(self.origin, originoffset);
        self.var_4413114d1d17278b = spawn("script_origin", origin);
        if (isent(self)) {
            if (self tagexists("j_hip_ri")) {
                tag = function_53c4c53197386572(tag, "j_hip_ri");
            }
            originoffset = function_53c4c53197386572(originoffset, (0, 0, 0));
            anglesoffset = function_53c4c53197386572(anglesoffset, (0, 0, 0));
            if (isdefined(tag)) {
                self.var_4413114d1d17278b linkto(self, tag, originoffset, anglesoffset);
            } else {
                self.var_4413114d1d17278b linkto(self);
            }
        }
        self.var_4413114d1d17278b.var_ed56b39b72558e56 = 1;
        self.var_4413114d1d17278b.battlechatterallowed = 1;
        self.var_4413114d1d17278b.team = function_53c4c53197386572(self.team, "allies");
        self.var_4413114d1d17278b.battlechatter = spawnstruct();
        if (isdefined(self.battlechatter)) {
            self.var_4413114d1d17278b.battlechatter.countryid = self.battlechatter.countryid;
        }
        self.var_4413114d1d17278b.var_87d26ab52f61fa8b = var_ac180ceb6dc3c95b;
    }
    return self.var_4413114d1d17278b;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49c3
// Size: 0xd
function get_radio_alias(alias) {
    return alias;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49d8
// Size: 0x35
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

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a14
// Size: 0x56
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

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a71
// Size: 0x53
function function_c0af485270de3fbf(text) {
    setdvarifuninitialized(@"hash_ce3d6e5d48671653", 1);
    return getdvarint(@"hash_ce3d6e5d48671653") && (isistring(text) || !soundexists(text) && getsubstr(text, 0, 3) != "dx_");
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4ace
// Size: 0xe1
function function_fb381a52cc8f3784(var_bcabc3998e6c48bf, var_bca6d5998e66477e) {
    var_bcabc3998e6c48bf = function_53c4c53197386572(var_bcabc3998e6c48bf, 1);
    var_bca6d5998e66477e = function_53c4c53197386572(var_bca6d5998e66477e, 0);
    level.var_a16d55725feba235 = var_bcabc3998e6c48bf;
    level.var_a1682f725fe525cc = var_bca6d5998e66477e;
    if (!var_bcabc3998e6c48bf && !var_bca6d5998e66477e) {
        return;
    }
    if (!isdefined(level.var_261aaf24a09d231d)) {
        return;
    }
    foreach (var_5564a66c3ec1c07b in level.var_261aaf24a09d231d) {
        speaker = var_5564a66c3ec1c07b.speaker;
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

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bb6
// Size: 0xee
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
            duration = duration - 0.05;
        }
        waitframe();
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cab
// Size: 0x34
function function_f9e725c7fd059300(text) {
    var_a727023afa3213a1 = strtok(text, " ").size;
    return max(1.5, var_a727023afa3213a1 * 0.4);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ce7
// Size: 0x4e6
function function_932c63c904570806(text) {
    self notify("stop_dialogue");
    self endon("death");
    self endon("stop_dialogue");
    /#
        assertex(isent(self), "Dialogue text must be displayed on an entity.");
    #/
    emitter = self;
    player = undefined;
    if (isplayer(self)) {
        player = self;
    }
    if (isdefined(player) || isdefined(self.var_63fdbddd04be9f53)) {
        emitter = function_f5eb5b4d0e6714aa();
    }
    self.var_e5cf232129f9ec01 = gettime();
    self.var_800206351d64e3f4 = text;
    self.var_88502eb1e08dfc4d = undefined;
    holdtime = function_f9e725c7fd059300(text);
    color = function_1f6b853c415cb9c1();
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
        wait(holdtime);
        return 1;
    }
    var_b54520c420443a7c = int(6.96);
    var_ca02086954972024 = int(17.4);
    var_7794fdd4649e6d7f = int(5.075);
    var_ddfeff0efa1cd0c4 = 0;
    if (isdefined(level.var_ace32b0108a3e1f1) && isdefined(level.var_ace32b0108a3e1f1[text])) {
        lines = [0:level.var_ace32b0108a3e1f1[text]];
        var_ddfeff0efa1cd0c4 = 1;
    } else {
        text = color + name + ": ^7" + text;
        lines = wrap_text(text, int(500 / var_b54520c420443a7c));
    }
    width = int(clamp(text.size * var_b54520c420443a7c, 0, 500));
    height = var_ca02086954972024 * lines.size + var_7794fdd4649e6d7f;
    endy = function_53c4c53197386572(level.var_33a0b6852d7ff0d, 300) - height;
    if (!isdefined(level.var_94ad130eea50b708)) {
        level.var_94ad130eea50b708 = [];
    }
    foreach (var_cd8195c935c24ccc in level.var_94ad130eea50b708) {
        var_cd8195c935c24ccc moveovertime(0.2);
        var_cd8195c935c24ccc.y = var_cd8195c935c24ccc.y - height - 2;
    }
    var_b64928813a4ec80d = [];
    foreach (i, var_afe3ca01808d2595 in lines) {
        var_db39ac342b5f8704 = newhudelem();
        var_db39ac342b5f8704.speaker = self;
        var_db39ac342b5f8704.alpha = 0;
        if (var_ddfeff0efa1cd0c4) {
            var_db39ac342b5f8704.label = var_afe3ca01808d2595;
            if (isdefined(self.var_8284c960ab37a90d) && isistring(self.var_8284c960ab37a90d)) {
                var_db39ac342b5f8704 settext(self.var_8284c960ab37a90d);
            } else {
                var_db39ac342b5f8704 settext("DIALOGUE_TEMP/NAME_TEST");
            }
        } else {
            var_db39ac342b5f8704 settext(var_afe3ca01808d2595);
        }
        var_db39ac342b5f8704.fontscale = 0.6525;
        var_db39ac342b5f8704.font = "bigfixed";
        var_db39ac342b5f8704.row = i;
        var_db39ac342b5f8704 function_866a3b95a50aa7c2(height, endy, var_ca02086954972024, var_7794fdd4649e6d7f);
        var_b64928813a4ec80d[var_b64928813a4ec80d.size] = var_db39ac342b5f8704;
    }
    bg = newhudelem();
    bg.alpha = 0;
    bg setshader("black", width, height);
    bg function_866a3b95a50aa7c2(height, endy);
    var_b64928813a4ec80d[var_b64928813a4ec80d.size] = bg;
    level.var_94ad130eea50b708 = array_combine(level.var_94ad130eea50b708, var_b64928813a4ec80d);
    end_time = gettime() + (0.2 + holdtime) * 1000;
    thread function_f149afdd57e23278(var_b64928813a4ec80d, holdtime);
    finished = self waittill("text_display_done");
    if (isdefined(finished) && finished == 0) {
        remaining_time = (end_time - gettime()) / 1000;
        if (remaining_time > 0) {
            wait(remaining_time);
        }
        finished = 1;
    }
    return finished;
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51d5
// Size: 0x8b
function function_1f6b853c415cb9c1(team) {
    team = function_53c4c53197386572(team, self.team);
    team = function_53c4c53197386572(team, "neutral");
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
        break;
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5267
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
    team = function_53c4c53197386572(self.team, "neutral");
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
        break;
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5354
// Size: 0xf4
function function_866a3b95a50aa7c2(height, endy, var_ca02086954972024, var_7794fdd4649e6d7f) {
    self.alignx = "center";
    self.aligny = "top";
    self.x = 320;
    self.y = 300 + height;
    self.sort = 5;
    if (isdefined(self.row)) {
        self.y = self.y + self.row * var_ca02086954972024 + var_7794fdd4649e6d7f;
    }
    self fadeovertime(0.2);
    if (isdefined(self.row)) {
        self.y = endy + self.row * var_ca02086954972024 + var_7794fdd4649e6d7f;
        self.alpha = 1;
    } else {
        self.y = endy;
        self.alpha = function_53c4c53197386572(level.var_97e909fed3ab1904, 0);
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x544f
// Size: 0x110
function function_f149afdd57e23278(var_b64928813a4ec80d, holdtime) {
    finished = function_c0f47bf696bd27ac(0.2 + holdtime);
    self notify("text_display_done", finished);
    foreach (var_cd8195c935c24ccc in var_b64928813a4ec80d) {
        var_cd8195c935c24ccc fadeovertime(0.3);
        var_cd8195c935c24ccc.alpha = 0;
    }
    wait(0.3);
    level.var_94ad130eea50b708 = array_remove_array(level.var_94ad130eea50b708, var_b64928813a4ec80d);
    if (!level.var_94ad130eea50b708.size) {
        level.var_94ad130eea50b708 = undefined;
    }
    foreach (var_cd8195c935c24ccc in var_b64928813a4ec80d) {
        var_cd8195c935c24ccc destroy();
    }
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5566
// Size: 0x2c
function function_c0f47bf696bd27ac(holdtime) {
    self endon("death");
    self endon("stop_dialogue");
    return waittill_notify_or_timeout_return("stop_2d_text", holdtime) == "timeout";
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x559a
// Size: 0x132
function function_407745805f870(nags, var_4b0c85beee0df862, initial_delay, var_206ca980a28e3343) {
    self notify("stop_nag_loop");
    self endon("death");
    self endon("stop_nag_loop");
    initial_delay = function_53c4c53197386572(initial_delay, var_4b0c85beee0df862);
    if (!isdefined(level.var_a36de4031e866ce5)) {
        level function_746d94ac5ed3ee5c();
    }
    /#
        assertex(isdefined(nags), "Nags must be defined.");
    #/
    /#
        assertex(isstruct(nags) && isdefined(nags.items) && isdefined(nags.index) || isarray(nags) || isfunction(nags), "Nags must be a deck, array, or function.");
    #/
    if (isarray(nags) && (nags.size == 0 || !isfunction(nags[0]))) {
        /#
            assertex(nags.size, "Nags deck/array must contain at least one nag.");
        #/
        nags = create_deck(nags, 1, 0);
    }
    function_305eddcdfb20b45d(nags, initial_delay);
    for (nag_count = 1; !isdefined(var_206ca980a28e3343) || nag_count / nags.items.size < var_206ca980a28e3343; nag_count++) {
        function_305eddcdfb20b45d(nags, var_4b0c85beee0df862);
        waitframe();
    }
    self notify("finished_nag_loop");
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56d3
// Size: 0x262
function function_305eddcdfb20b45d(nags, delay) {
    speaker = self;
    var_3089d38b926beb3b = 0;
    current = undefined;
    if (isarray(nags) && nags.size > 0 && isfunction(nags[0])) {
        nags = speaker call_with_params(nags[0], array_remove_index(nags, 0));
        /#
            assertex(isstruct(nags) && isdefined(nags.items) && isdefined(nags.index) || isarray(nags) || isstring(nags), "Nags returned by function must be a deck, array, or string");
        #/
    } else if (isfunction(nags)) {
        nags = speaker call_with_params(nags);
        /#
            assertex(isstruct(nags) && isdefined(nags.items) && isdefined(nags.index) || isarray(nags) || isstring(nags), "Nags returned by function must be a deck, array, or string");
        #/
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
    result = speaker function_b0fddb86a2358953(delay);
    if (!isdefined(result) || result) {
        var_9080a00567019b53 = function_53c4c53197386572(self.var_a36de4031e866ce5, level.var_a36de4031e866ce5);
        var_3089d38b926beb3b = speaker say(nag, var_9080a00567019b53.priority, var_9080a00567019b53.timeout, var_9080a00567019b53.var_f6e387b9f5a2b39c, &started_nag, var_9080a00567019b53.scope);
    }
    if (!isdefined(var_3089d38b926beb3b)) {
        result = "interrupted";
    } else if (var_3089d38b926beb3b) {
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
    speaker notify("nag_done_or_cancelled", nag);
}

// Namespace dialogue/namespace_71a239de73c38174
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x593c
// Size: 0x4a
function started_nag() {
    self notify("started_nag", self.var_88502eb1e08dfc4d);
    if (isdefined(self.var_23471685b065b4ad)) {
        self thread [[ self.var_23471685b065b4ad ]]();
    }
    if (isdefined(level.var_23471685b065b4ad)) {
        level thread [[ level.var_23471685b065b4ad ]]();
    }
}

