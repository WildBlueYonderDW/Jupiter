// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_4c770a9a4ad7659c;
#using scripts\mp\music_and_dialog.gsc;

#namespace namespace_744722863d89a92f;

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168
// Size: 0x2c
function function_4b77a1615a8dd64a() {
    level thread namespace_3bde6869e44a2770::disablemusic();
    game["zombiemusic_bank"] = undefined;
    game["zombiemusic_bank_default"] = undefined;
    level callback::add("player_connect", &function_502eaa8750a0527a);
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19b
// Size: 0x13
function function_502eaa8750a0527a(var_d27680ff86693f5c) {
    function_5fd4ac422c2433ab();
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b5
// Size: 0x99
function function_5fd4ac422c2433ab() {
    if (!isdefined(self.var_3fb2c165c0c044b8)) {
        self.var_3fb2c165c0c044b8 = spawnstruct();
        self.var_3fb2c165c0c044b8.var_4b6a0e0f9520fa47 = 1;
        self.var_3fb2c165c0c044b8.var_afee93dea14ad95a = undefined;
        self.var_3fb2c165c0c044b8.var_dfa0ba95a4a31cb8 = undefined;
        self.var_3fb2c165c0c044b8.var_faa3bf5759883a02 = undefined;
        self.var_3fb2c165c0c044b8.var_f6af02eb25ca4cf7 = 1;
        self.var_3fb2c165c0c044b8.var_694b7f499f7e6b3 = 1;
    }
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x255
// Size: 0x63
function function_8888f70dbecaeda1(var_d7c75c93c4ca506) {
    foreach (player in level.players) {
        player thread function_8ae818ed183a1753(var_d7c75c93c4ca506);
    }
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bf
// Size: 0x10a
function function_8ae818ed183a1753(var_d7c75c93c4ca506) {
    function_8b1835eeb80e8efc(self);
    if (function_17f2893c6d199180(self, var_d7c75c93c4ca506)) {
        return;
    }
    self notify("zombieMusicStateUpdate");
    var_8af73af26533d0ac = game["zombiemusic_bank"][self.var_3fb2c165c0c044b8.var_afee93dea14ad95a][var_d7c75c93c4ca506];
    if (isdefined(self.var_3fb2c165c0c044b8.var_dfa0ba95a4a31cb8)) {
        self.var_3fb2c165c0c044b8.var_faa3bf5759883a02 = self.var_3fb2c165c0c044b8.var_dfa0ba95a4a31cb8;
    }
    self.var_3fb2c165c0c044b8.var_dfa0ba95a4a31cb8 = var_d7c75c93c4ca506;
    self.var_3fb2c165c0c044b8.var_f6af02eb25ca4cf7 = var_8af73af26533d0ac.n_priority;
    var_e13d86eabf5ff75d = var_8af73af26533d0ac.var_2f27fb8f9ba90e5c[randomintrange(0, var_8af73af26533d0ac.var_2f27fb8f9ba90e5c.size)];
    self setplayermusicstate(var_e13d86eabf5ff75d);
    if (!var_8af73af26533d0ac.var_aaa744342068977a) {
        thread function_b88aec4b0b3b3614(var_e13d86eabf5ff75d);
    }
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3d0
// Size: 0x169
function function_17f2893c6d199180(player, var_d7c75c93c4ca506) {
    if (!function_cda1c2ac4fa2e2da(player)) {
        return 1;
    }
    if (!isdefined(game["zombiemusic_bank"]) || !isdefined(player.var_3fb2c165c0c044b8.var_afee93dea14ad95a)) {
        return 1;
    }
    if (!isdefined(game["zombiemusic_bank"][player.var_3fb2c165c0c044b8.var_afee93dea14ad95a])) {
        return 1;
    }
    if (!isdefined(game["zombiemusic_bank"][player.var_3fb2c165c0c044b8.var_afee93dea14ad95a][var_d7c75c93c4ca506])) {
        return 1;
    }
    var_8af73af26533d0ac = game["zombiemusic_bank"][player.var_3fb2c165c0c044b8.var_afee93dea14ad95a][var_d7c75c93c4ca506];
    if (var_8af73af26533d0ac.var_2f27fb8f9ba90e5c.size <= 0) {
        return 1;
    }
    if (!isdefined(player.var_3fb2c165c0c044b8)) {
        return 1;
    }
    var_225923bb7dfc33dd = player.var_3fb2c165c0c044b8;
    if (isdefined(player.var_3fb2c165c0c044b8.var_dfa0ba95a4a31cb8)) {
        if (player.var_3fb2c165c0c044b8.var_f6af02eb25ca4cf7 > var_8af73af26533d0ac.n_priority && var_8af73af26533d0ac.n_priority != 0) {
            return 1;
        }
        if (player.var_3fb2c165c0c044b8.var_dfa0ba95a4a31cb8 == var_d7c75c93c4ca506) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x541
// Size: 0x48
function function_b88aec4b0b3b3614(var_e13d86eabf5ff75d) {
    self endon("zombieMusicStateUpdate");
    self endon("zombieMusicStateClear");
    self endon("death_or_disconnect");
    level endon("game_ended");
    n_wait_time = function_30429ea66e99f476(var_e13d86eabf5ff75d);
    wait(n_wait_time);
    if (isdefined(self)) {
        function_9450c133a155c196();
    }
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x590
// Size: 0x63
function function_9e6da63353ea9512(var_d7c75c93c4ca506) {
    foreach (player in level.players) {
        player thread function_9450c133a155c196(var_d7c75c93c4ca506);
    }
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5fa
// Size: 0x16c
function function_9450c133a155c196(var_d7c75c93c4ca506) {
    if (!function_cda1c2ac4fa2e2da(self)) {
        return;
    }
    if (isdefined(var_d7c75c93c4ca506)) {
        if (isdefined(self.var_3fb2c165c0c044b8.var_dfa0ba95a4a31cb8)) {
            if (self.var_3fb2c165c0c044b8.var_dfa0ba95a4a31cb8 == var_d7c75c93c4ca506) {
                self notify("zombieMusicStateClear");
                self setplayermusicstate("");
                self.var_3fb2c165c0c044b8.var_faa3bf5759883a02 = self.var_3fb2c165c0c044b8.var_dfa0ba95a4a31cb8;
                self.var_3fb2c165c0c044b8.var_694b7f499f7e6b3 = self.var_3fb2c165c0c044b8.var_f6af02eb25ca4cf7;
                self.var_3fb2c165c0c044b8.var_dfa0ba95a4a31cb8 = undefined;
                self.var_3fb2c165c0c044b8.var_f6af02eb25ca4cf7 = 1;
            } else {
                return;
            }
        } else {
            return;
        }
    } else {
        self notify("zombieMusicStateClear");
        self setplayermusicstate("");
        self.var_3fb2c165c0c044b8.var_faa3bf5759883a02 = self.var_3fb2c165c0c044b8.var_dfa0ba95a4a31cb8;
        self.var_3fb2c165c0c044b8.var_694b7f499f7e6b3 = self.var_3fb2c165c0c044b8.var_f6af02eb25ca4cf7;
        self.var_3fb2c165c0c044b8.var_dfa0ba95a4a31cb8 = undefined;
        self.var_3fb2c165c0c044b8.var_f6af02eb25ca4cf7 = 1;
    }
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x76d
// Size: 0x4c
function function_30429ea66e99f476(var_b98e753f37d5fe11) {
    str_alias = "mus_" + var_b98e753f37d5fe11 + "_intro";
    duration_ms = lookupsoundlength(str_alias);
    if (!isdefined(duration_ms) || duration_ms <= 0) {
        duration_ms = 1000;
    }
    return duration_ms / 1000;
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c1
// Size: 0x5a
function function_43956cb0410eec0f() {
    foreach (player in level.players) {
        level thread function_f95cf184582d2009(player);
    }
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x822
// Size: 0x3a
function function_f95cf184582d2009(player) {
    if (!isdefined(player)) {
        return;
    }
    if (!isdefined(player.var_3fb2c165c0c044b8)) {
        return;
    }
    player.var_3fb2c165c0c044b8.var_4b6a0e0f9520fa47 = 1;
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x863
// Size: 0x61
function function_94636ebe77d7581a() {
    function_9e6da63353ea9512();
    foreach (player in level.players) {
        level thread function_665863ce16735aae(player);
    }
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8cb
// Size: 0x39
function function_665863ce16735aae(player) {
    if (!isdefined(player)) {
        return;
    }
    if (!isdefined(player.var_3fb2c165c0c044b8)) {
        return;
    }
    player.var_3fb2c165c0c044b8.var_4b6a0e0f9520fa47 = 0;
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x90b
// Size: 0x39
function function_cda1c2ac4fa2e2da(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (!isdefined(player.var_3fb2c165c0c044b8)) {
        return 0;
    }
    return player.var_3fb2c165c0c044b8.var_4b6a0e0f9520fa47;
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x94c
// Size: 0x2f
function function_d7f0cecf71088d68(var_60e81aa6c9b5d1cf) {
    /#
        assertex(!isdefined(level.var_4beddfdc7466d52a), "Cannot add a new zombie music bank as another add is currently open");
    #/
    level.var_4beddfdc7466d52a = var_60e81aa6c9b5d1cf;
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x982
// Size: 0x20
function function_fba03eb610498694() {
    /#
        assert(isdefined(level.var_4beddfdc7466d52a));
    #/
    level.var_4beddfdc7466d52a = undefined;
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9a9
// Size: 0x118
function function_956cfd575691a5d9(var_6e450c4f40b511ee, var_7a511a9369ed49e5, n_priority, var_aaa744342068977a) {
    if (!isdefined(game["zombiemusic_bank"])) {
        game["zombiemusic_bank"] = [];
    }
    var_9e2dc14ec772ce23 = undefined;
    tokens = strtok(var_6e450c4f40b511ee, "#");
    if (tokens.size > 1) {
        var_9e2dc14ec772ce23 = tokens[0];
        var_6e450c4f40b511ee = tokens[1];
    } else if (isdefined(level.var_4beddfdc7466d52a)) {
        var_9e2dc14ec772ce23 = level.var_4beddfdc7466d52a;
    }
    if (!isdefined(var_9e2dc14ec772ce23)) {
        return;
    }
    if (!isdefined(game["zombiemusic_bank"][var_9e2dc14ec772ce23])) {
        game["zombiemusic_bank"][var_9e2dc14ec772ce23] = [];
    }
    game["zombiemusic_bank"][var_9e2dc14ec772ce23][var_6e450c4f40b511ee] = spawnstruct();
    game["zombiemusic_bank"][var_9e2dc14ec772ce23][var_6e450c4f40b511ee].n_priority = n_priority;
    game["zombiemusic_bank"][var_9e2dc14ec772ce23][var_6e450c4f40b511ee].var_2f27fb8f9ba90e5c = var_7a511a9369ed49e5;
    game["zombiemusic_bank"][var_9e2dc14ec772ce23][var_6e450c4f40b511ee].var_aaa744342068977a = 0;
    if (isdefined(var_aaa744342068977a)) {
        game["zombiemusic_bank"][var_9e2dc14ec772ce23][var_6e450c4f40b511ee].var_aaa744342068977a = var_aaa744342068977a;
    }
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xac8
// Size: 0x62
function function_9326597e1696db30(var_60e81aa6c9b5d1cf) {
    foreach (player in level.players) {
        player function_bf7177d54915e7d4(var_60e81aa6c9b5d1cf);
    }
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb31
// Size: 0x21
function function_bf7177d54915e7d4(var_60e81aa6c9b5d1cf) {
    self.var_3fb2c165c0c044b8.var_afee93dea14ad95a = var_60e81aa6c9b5d1cf;
}

// Namespace namespace_744722863d89a92f/namespace_72b76910190cf144
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb59
// Size: 0x4f
function function_8b1835eeb80e8efc(player) {
    if (!isdefined(player.var_3fb2c165c0c044b8)) {
        return;
    }
    if (!isdefined(player.var_3fb2c165c0c044b8.var_afee93dea14ad95a)) {
        if (isdefined(game["zombiemusic_bank_default"])) {
            player function_bf7177d54915e7d4(game["zombiemusic_bank_default"]);
        }
    }
}

