#using scripts\common\utility;
#using scripts\engine\utility;

#namespace threat_sight;

// Namespace threat_sight / scripts\stealth\threat_sight
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12e
// Size: 0x15f
function threat_sight_set_enabled(enabled) {
    assert(isdefined(level.stealth));
    wasenabled = function_7a21aa652f0613b0();
    function_24e85292b191399c(enabled);
    threat_sight_set_dvar(enabled);
    if (!enabled && wasenabled) {
        level notify("threat_sight_disabled");
        foreach (player in level.players) {
            player thread function_9b25540da1b89219();
            player thread function_e4eaeef9e706471e();
        }
    } else if (enabled && !wasenabled) {
        level notify("threat_sight_enabled");
    }
    allai = getaiarray();
    foreach (guy in allai) {
        if (isalive(guy) && isdefined(guy.var_9329445a125d4443)) {
            guy function_24cb3b5e0d4216b1(guy.var_9329445a125d4443);
        }
    }
    if (enabled && !wasenabled) {
        level thread function_468da1365698eabf();
        level thread function_3e245e55717e286a();
    }
}

// Namespace threat_sight / scripts\stealth\threat_sight
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x295
// Size: 0x33
function threat_sight_set_dvar(enabled) {
    if (enabled && !function_7a21aa652f0613b0()) {
        return;
    }
    setsaveddvar(@"ai_threatsight", enabled);
    level thread threat_sight_set_dvar_display(enabled);
}

// Namespace threat_sight / scripts\stealth\threat_sight
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d0
// Size: 0x56
function threat_sight_set_dvar_display(enabled) {
    self notify("threat_sight_set_dvar_display");
    self endon("threat_sight_set_dvar_display");
    if (!enabled) {
        wait 1;
    }
    if (getdvarint(@"ai_threatusedisplay", 0)) {
        setsaveddvar(@"hash_dfbef9bc86d93b90", enabled);
    }
    setdvar(@"hash_21b72d8c9ff7a1b3", enabled);
}

// Namespace threat_sight / scripts\stealth\threat_sight
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32e
// Size: 0x38
function threat_sight_enabled() {
    if (!getdvarint(@"ai_threatsight")) {
        return 0;
    }
    if (self == level) {
        return function_7a21aa652f0613b0();
    }
    return isdefined(self.threatsight) && self.threatsight;
}

// Namespace threat_sight / scripts\stealth\threat_sight
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x36f
// Size: 0x9e
function threat_sight_player_entity_state_set(ai, statename) {
    if (!isdefined(self.stealth)) {
        return;
    }
    switch (statename) {
    case #"hash_9a31640cc41d3ff3":
        ai setthreatsight(self, 0);
        break;
    case #"hash_e21b072df2b47f94":
        if (isdefined(ai.enemy) && ai.enemy == self) {
            ai setthreatsight(self, 1);
        }
        break;
    case #"hash_e8bc3da4af287c2d":
        ai setthreatsight(self, 0);
        break;
    }
}

// Namespace threat_sight / scripts\stealth\threat_sight
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x415
// Size: 0x13c
function threat_sight_force_visible(othersentient, durationseconds) {
    self function_d955a85131dc6e69(othersentient, durationseconds);
    end = gettime() + int(1000 * durationseconds);
    entnum = othersentient getentitynumber();
    if (!isdefined(self.stealth.force_visible)) {
        self.stealth.force_visible = [];
    }
    if (isdefined(self.stealth.force_visible[entnum])) {
        self.stealth.force_visible[entnum].end = max(self.stealth.force_visible[entnum].end, end);
    } else {
        self.stealth.force_visible[entnum] = spawnstruct();
        self.stealth.force_visible[entnum].end = end;
    }
    self.stealth.force_visible[entnum].ent = othersentient;
    thread threat_sight_force_visible_thread();
}

// Namespace threat_sight / scripts\stealth\threat_sight
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x559
// Size: 0x21c
function threat_sight_force_visible_thread() {
    if (istrue(self.stealth.force_visible_thread)) {
        return;
    }
    self notify("threat_sight_force_visible_thread");
    self endon("threat_sight_force_visible_thread");
    self endon("death");
    self.stealth.force_visible_thread = 1;
    waittime = 0.05;
    while (isdefined(self.stealth.force_visible) && self.stealth.force_visible.size > 0) {
        now = gettime();
        remove = [];
        foreach (key, forcedvis in self.stealth.force_visible) {
            if (now < forcedvis.end && issentient(forcedvis.ent) && !self cansee(forcedvis.ent)) {
                if (isplayer(forcedvis.ent)) {
                    newthreat = self getthreatsight(forcedvis.ent);
                    var_3d4b09d94df0885a = function_910a912f327b8d34(forcedvis.ent);
                    forcedvis.ent thread threat_sight_player_sight_audio(1, max(var_3d4b09d94df0885a, newthreat));
                }
                continue;
            }
            remove[remove.size] = key;
        }
        foreach (key in remove) {
            self.stealth.force_visible[key] = undefined;
        }
        wait waittime;
    }
    self.stealth.force_visible = undefined;
    self.stealth.force_visible_thread = undefined;
}

// Namespace threat_sight / scripts\stealth\threat_sight
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x77d
// Size: 0xf1
function function_468da1365698eabf() {
    level endon("threat_sight_disabled");
    if (!isdefined(level.stealth.fnthreatsightplayersightaudio)) {
        level waittill("threat_sight_audio_enabled");
        assert(isdefined(level.stealth.fnthreatsightplayersightaudio));
    }
    while (!isdefined(level.players)) {
        waitframe();
    }
    while (true) {
        if (getdvarfloat(@"ai_threatsightfakethreat") <= 0) {
            foreach (player in level.players) {
                if (!isalive(player) || !isdefined(player.stealth)) {
                    continue;
                }
                player thread threat_sight_player_sight_audio(function_8ce5803b7d377d72(player), function_910a912f327b8d34(player));
            }
        }
        waitframe();
    }
}

// Namespace threat_sight / scripts\stealth\threat_sight
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x876
// Size: 0xb5
function function_3e245e55717e286a() {
    level endon("threat_sight_disabled");
    while (!isdefined(level.players)) {
        waitframe();
    }
    while (true) {
        if (getdvarfloat(@"ai_threatsightfakethreat") <= 0) {
            foreach (player in level.players) {
                if (!isalive(player) || !isdefined(player.stealth)) {
                    continue;
                }
                player thread function_82079fb63bda0995(function_8ce5803b7d377d72(player), function_910a912f327b8d34(player));
            }
        }
        waitframe();
    }
}

// Namespace threat_sight / scripts\stealth\threat_sight
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x933
// Size: 0xab
function threat_sight_fake(origin, amount) {
    self notify("threat_sight_fake");
    self endon("threat_sight_fake");
    setsaveddvar(@"ai_threatsightfakethreat", amount);
    setsaveddvar(@"ai_threatsightfakex", origin[0]);
    setsaveddvar(@"ai_threatsightfakey", origin[1]);
    setsaveddvar(@"ai_threatsightfakez", origin[2]);
    var_3d4b09d94df0885a = function_910a912f327b8d34(self);
    while (amount > 0) {
        thread threat_sight_player_sight_audio(1, max(var_3d4b09d94df0885a, amount));
        wait 0.15;
    }
    thread threat_sight_player_sight_audio(0, max(var_3d4b09d94df0885a, amount));
}

// Namespace threat_sight / scripts\stealth\threat_sight
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9e6
// Size: 0x5b
function threat_sight_player_sight_audio(anycansee, maxthreat, var_67e8151f4dfc690b) {
    if (isdefined(level.stealth) && isdefined(level.stealth.fnthreatsightplayersightaudio)) {
        self thread [[ level.stealth.fnthreatsightplayersightaudio ]](anycansee, maxthreat, var_67e8151f4dfc690b);
    }
}

// Namespace threat_sight / scripts\stealth\threat_sight
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa49
// Size: 0x3f
function function_9b25540da1b89219() {
    if (isdefined(level.stealth) && isdefined(level.stealth.var_585390079b597cd6)) {
        self thread [[ level.stealth.var_585390079b597cd6 ]]();
    }
}

// Namespace threat_sight / scripts\stealth\threat_sight
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa90
// Size: 0x52
function function_82079fb63bda0995(anycansee, maxthreat) {
    if (isdefined(level.stealth) && isdefined(level.stealth.var_ed06a52046d9f7a1)) {
        self thread [[ level.stealth.var_ed06a52046d9f7a1 ]](anycansee, maxthreat);
    }
}

// Namespace threat_sight / scripts\stealth\threat_sight
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaea
// Size: 0x3f
function function_e4eaeef9e706471e() {
    if (isdefined(level.stealth) && isdefined(level.stealth.var_45cffb1cb64f32c7)) {
        self thread [[ level.stealth.var_45cffb1cb64f32c7 ]]();
    }
}

