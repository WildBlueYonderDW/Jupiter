// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_f86ba2003950072a;

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46a
// Size: 0x5f
function function_6dca6f439ca0a74f() {
    if (!isdefined(level.snd)) {
        level.snd = spawnstruct();
        level.snd.objects = [];
        level.snd.var_a79bb46c42ffe2fd = [];
        level.snd.var_5ee4aba82383469e = &playsoundonmovingent;
    }
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d0
// Size: 0x6e
function function_b3e5599c9f6a8895(obj) {
    /#
        assert(obj == level || isstruct(obj) || isent(obj));
    #/
    if (!isstruct(obj.snd)) {
        obj.snd = spawnstruct();
    }
    /#
        assertex(isstruct(obj.snd), "snd_init_obj obj.snd is not a struct");
    #/
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x545
// Size: 0x18
function function_f0b5522ee5ce0cb1() {
    if (isstruct(level.snd)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x565
// Size: 0x12
function function_40a17693396019a7() {
    while (function_f0b5522ee5ce0cb1() == 0) {
        waitframe();
    }
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x57e
// Size: 0x6b
function private function_55f5473e977f265f(team_name) {
    players = [];
    if (isarray(level.teamdata) && isarray(level.teamdata[team_name]) && isarray(level.teamdata[team_name]["players"])) {
        players = level.teamdata[team_name]["players"];
    }
    return players;
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f1
// Size: 0x140
function function_d6fe092bc83da45b(var_6e077719c0efcb61, radius, team_name) {
    origin = undefined;
    radius = function_53c4c53197386572(radius, 240);
    team_name = function_53c4c53197386572(team_name, "");
    players = [];
    if (isvector(var_6e077719c0efcb61)) {
        origin = var_6e077719c0efcb61;
    } else if (isent(var_6e077719c0efcb61)) {
        origin = var_6e077719c0efcb61.origin;
    }
    if (isvector(origin)) {
        var_3a35f39b95df3bf5 = getentarrayinradius("player", "classname", origin, radius);
        foreach (player in var_3a35f39b95df3bf5) {
            if (isplayer(player) && !isagent(player)) {
                if (team_name == "" || isstring(player.team) && player.team == team_name) {
                    players[players.size] = player;
                }
            }
        }
        return players;
    } else {
        /#
            assertmsg("snd_get_players_in_radius: unknown ent_or_origin parameter");
        #/
    }
    return players;
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x739
// Size: 0x4b
function function_ad9f5152bfdebcfe(var_34c51814a444fa62, var_647f0d4fb967a7e9, value) {
    /#
        assertex(isstring(var_34c51814a444fa62), "setGameStateData: gameKey must be string");
    #/
    /#
        assertex(isstring(var_647f0d4fb967a7e9), "setGameStateData: stateKey must be string");
    #/
    game[var_34c51814a444fa62][var_647f0d4fb967a7e9] = value;
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x78b
// Size: 0x1e
function function_d05e164d112ab01(var_34c51814a444fa62, var_647f0d4fb967a7e9) {
    function_ad9f5152bfdebcfe(var_34c51814a444fa62, var_647f0d4fb967a7e9, undefined);
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b0
// Size: 0x4d
function function_9a0f23d8adcd6392(var_34c51814a444fa62, var_647f0d4fb967a7e9) {
    /#
        assertex(isstring(var_34c51814a444fa62), "getGameStateData: gameKey must be string");
    #/
    /#
        assertex(isstring(var_647f0d4fb967a7e9), "getGameStateData: stateKey must be string");
    #/
    data = game[var_34c51814a444fa62][var_647f0d4fb967a7e9];
    return data;
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x805
// Size: 0x6f
function function_5cb73579174212fd(var_34c51814a444fa62, var_647f0d4fb967a7e9) {
    value = function_9a0f23d8adcd6392(var_34c51814a444fa62, var_647f0d4fb967a7e9);
    if (isarray(value)) {
        index = 0;
        if (value.size > 1) {
            index = randomintrange(0, value.size);
            /#
                assertex(index >= 0 && index < value.size, "getGameStateDataRandom: invalid random index " + index);
            #/
        }
        value = value[index];
    }
    return value;
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87c
// Size: 0xa6
function function_7acde5feb50c98f2(players, soundalias) {
    players = function_53c4c53197386572(players, []);
    soundalias = function_53c4c53197386572(soundalias, "");
    if (isarray(players)) {
        foreach (player in players) {
            if (isplayer(player) && !isagent(player)) {
                player playlocalsound(soundalias);
            }
        }
    } else {
        /#
            assertmsg("playLocalSoundToPlayers: players was not an array");
        #/
    }
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x929
// Size: 0xa6
function function_66f41f0823bd279c(players, soundalias) {
    players = function_53c4c53197386572(players, []);
    soundalias = function_53c4c53197386572(soundalias, "");
    if (isarray(players)) {
        foreach (player in players) {
            if (isplayer(player) && !isagent(player)) {
                player stoplocalsound(soundalias);
            }
        }
    } else {
        /#
            assertmsg("stopLocalSoundToPlayers: players was not an array");
        #/
    }
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d6
// Size: 0xe5
function function_a408e30ca85e03a9(players, zonename, fadetime) {
    players = function_53c4c53197386572(players, []);
    zonename = function_53c4c53197386572(zonename, "");
    fadetime = function_53c4c53197386572(fadetime, 1);
    if (isarray(players)) {
        /#
            assertex(isstring(zonename), "setClientTriggerAudioForPlayers: zonename is not a string");
        #/
        /#
            assertex(isnumber(fadetime), "setClientTriggerAudioForPlayers: fadetime is not a number");
        #/
        foreach (player in players) {
            if (isplayer(player) && !isagent(player)) {
                player setclienttriggeraudiozone(zonename, fadetime);
            }
        }
    } else {
        /#
            assertmsg("setClientTriggerAudioForPlayers: players was not an array");
        #/
    }
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac2
// Size: 0xba
function function_326e5ed05234a4f0(players, fadetime) {
    players = function_53c4c53197386572(players, []);
    fadetime = function_53c4c53197386572(fadetime, 1);
    if (isarray(players)) {
        /#
            assertex(isnumber(fadetime), "clearClientTriggerAudioForPlayers: fadetime is not a number");
        #/
        foreach (player in players) {
            if (isplayer(player) && !isagent(player)) {
                player clearclienttriggeraudiozone(fadetime);
            }
        }
    } else {
        /#
            assertmsg("clearClientTriggerAudioForPlayers: players was not an array");
        #/
    }
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb83
// Size: 0x22
function function_b11cfee3350d246a(musicset, value) {
    function_ad9f5152bfdebcfe("music", musicset, value);
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbac
// Size: 0x59
function function_a771505a563da506(musicset) {
    state = function_9a0f23d8adcd6392("music", musicset);
    if (isarray(state)) {
        if (state.size == 0) {
            state = undefined;
        } else {
            state = state[0];
        }
    } else if (!isstring(state)) {
        state = undefined;
    }
    if (!isdefined(state)) {
        return "";
    }
    return state;
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0d
// Size: 0x3a
function function_17ee301cf0b5ba85(musicset) {
    state = function_5cb73579174212fd("music", musicset);
    if (!isdefined(state) || !isstring(state)) {
        return "";
    }
    return state;
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4f
// Size: 0x48
function function_5df2f278f44a6ffd(style) {
    if (isstring(style) && isdefined(level.music_style) && isstring(level.music_style) && level.music_style == style) {
        return 1;
    }
    return 0;
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9f
// Size: 0x150
function function_fe75a89529dd0fd0(players, var_9adc1bcdce9cf8b0, var_c342527a25f10cc5, var_aa00c7eb0e7e9c94, var_206c8dfdb8c43d68) {
    players = function_53c4c53197386572(players, []);
    var_9adc1bcdce9cf8b0 = function_53c4c53197386572(var_9adc1bcdce9cf8b0, "");
    var_206c8dfdb8c43d68 = function_53c4c53197386572(var_206c8dfdb8c43d68, "");
    if (isdefined(level.var_973185176be76120)) {
        level thread [[ level.var_973185176be76120 ]](players, var_9adc1bcdce9cf8b0, var_c342527a25f10cc5);
        return;
    }
    if (isarray(players)) {
        foreach (player in players) {
            if (isplayer(player) && !isagent(player)) {
                if (var_9adc1bcdce9cf8b0 == "" && isdefined(var_aa00c7eb0e7e9c94)) {
                    player function_9bb444fe81766f7e(var_aa00c7eb0e7e9c94);
                } else if (isarray(var_c342527a25f10cc5)) {
                    player setplayermusicstate(var_9adc1bcdce9cf8b0, var_c342527a25f10cc5);
                } else if (isdefined(player.var_acfbb9caed7125f9) && player.var_acfbb9caed7125f9 == 1) {
                    player setplayermusicstate(var_206c8dfdb8c43d68);
                } else {
                    player setplayermusicstate(var_9adc1bcdce9cf8b0);
                }
            }
        }
    } else {
        /#
            assertmsg("setMusicStateForPlayers: players was not an array");
        #/
    }
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf6
// Size: 0x6c
function function_46979d2fd81a6d4b(team_name, var_9adc1bcdce9cf8b0, var_c342527a25f10cc5, var_206c8dfdb8c43d68) {
    team_name = function_53c4c53197386572(team_name, "");
    var_9adc1bcdce9cf8b0 = function_53c4c53197386572(var_9adc1bcdce9cf8b0, "");
    var_206c8dfdb8c43d68 = function_53c4c53197386572(var_206c8dfdb8c43d68, "");
    players = function_55f5473e977f265f(team_name);
    function_fe75a89529dd0fd0(players, var_9adc1bcdce9cf8b0, var_c342527a25f10cc5, undefined, var_206c8dfdb8c43d68);
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe69
// Size: 0x71
function function_fdd0934f1a32f70d(var_6e077719c0efcb61, radius, var_9adc1bcdce9cf8b0, team_name, var_c342527a25f10cc5, var_206c8dfdb8c43d68) {
    var_9adc1bcdce9cf8b0 = function_53c4c53197386572(var_9adc1bcdce9cf8b0, "");
    var_206c8dfdb8c43d68 = function_53c4c53197386572(var_206c8dfdb8c43d68, "");
    players = function_d6fe092bc83da45b(var_6e077719c0efcb61, radius, team_name);
    function_fe75a89529dd0fd0(players, var_9adc1bcdce9cf8b0, var_c342527a25f10cc5, undefined, var_206c8dfdb8c43d68);
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee1
// Size: 0xd4
function function_4e8ba327eb12540c(players, var_220cfd744ed0ba55, fadetime, scale) {
    players = function_53c4c53197386572(players, []);
    var_220cfd744ed0ba55 = function_53c4c53197386572(var_220cfd744ed0ba55, "");
    fadetime = function_53c4c53197386572(fadetime, -1);
    scale = function_53c4c53197386572(scale, 1);
    if (isarray(players)) {
        foreach (player in players) {
            if (isplayer(player) && !isagent(player)) {
                player setsoundsubmix(var_220cfd744ed0ba55, fadetime, scale);
            }
        }
    } else {
        /#
            assertmsg("setSubmixForPlayers: players was not an array");
        #/
    }
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbc
// Size: 0x5d
function function_c7f38d0611aa82e7(team_name, var_220cfd744ed0ba55, fadetime, scale) {
    var_220cfd744ed0ba55 = function_53c4c53197386572(var_220cfd744ed0ba55, "");
    team_name = function_53c4c53197386572(team_name, "");
    players = function_55f5473e977f265f(team_name);
    function_4e8ba327eb12540c(players, var_220cfd744ed0ba55, fadetime, scale);
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1020
// Size: 0xa7
function function_c79f9300ee85f805(players, var_220cfd744ed0ba55, fadetime) {
    players = function_53c4c53197386572(players, []);
    var_220cfd744ed0ba55 = function_53c4c53197386572(var_220cfd744ed0ba55, "");
    fadetime = function_53c4c53197386572(fadetime, -1);
    if (isarray(players)) {
        foreach (player in players) {
            player clearsoundsubmix(var_220cfd744ed0ba55, fadetime);
        }
    } else {
        /#
            assertmsg("setSubmixForPlayers: players was not an array");
        #/
    }
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x10ce
// Size: 0x5c
function function_e3a3a924d8604018(team_name, var_220cfd744ed0ba55, fadetime, scale) {
    var_220cfd744ed0ba55 = function_53c4c53197386572(var_220cfd744ed0ba55, "");
    team_name = function_53c4c53197386572(team_name, "");
    players = function_55f5473e977f265f(team_name);
    function_c79f9300ee85f805(players, var_220cfd744ed0ba55, fadetime);
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1131
// Size: 0x24
function function_110d3ab280057f5b(condition, var_d2b72f7c2d3af70e) {
    /#
        if (istrue(condition)) {
            println(var_d2b72f7c2d3af70e);
        }
    #/
    return condition;
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x115d
// Size: 0x80
function private function_5b159f140bd186df() {
    function_40a17693396019a7();
    if (!isarray(level.snd.var_828ab610e771905)) {
        level.snd.var_828ab610e771905 = [];
    }
    if (!isent(level.snd.var_4388174fd6467686)) {
        level.snd.var_4388174fd6467686 = spawn("sound_transient_soundbanks", (0, 0, 0));
    }
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e4
// Size: 0x53
function function_1186ca4e2e51afea(name) {
    if (isstruct(level.snd) && isdefined(level.snd.var_828ab610e771905) && isdefined(level.snd.var_828ab610e771905[name])) {
        return 1;
    }
    return 0;
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123f
// Size: 0x119
function function_f1aed36ab4598ea(name) {
    if (getdvarint(@"hash_e6afce2cf5cf7515") != 0 || getdvarint(@"hash_add5b80d30e0737a") != 0) {
        return;
    }
    function_5b159f140bd186df();
    /#
        assert(function_f0b5522ee5ce0cb1());
    #/
    /#
        assert(isent(level.snd.var_4388174fd6467686));
    #/
    /#
        assert(isarray(level.snd.var_828ab610e771905));
    #/
    /#
        assertex(isstring(name), "snd_transient_load requires a name argument");
    #/
    var_97453abd88b8cee4 = function_1186ca4e2e51afea(name);
    if (function_110d3ab280057f5b(var_97453abd88b8cee4, "snd_transient_load loaded '" + name + "'")) {
        return;
    } else {
        level.snd.var_4388174fd6467686 settransientsoundbank(name + ".all", 1);
        level.snd.var_828ab610e771905[name] = level.snd.var_828ab610e771905.size;
    }
}

// Namespace namespace_f86ba2003950072a/namespace_e688cd9db0404268
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135f
// Size: 0x101
function function_f4e0ff5cb899686d(name) {
    if (getdvarint(@"hash_e6afce2cf5cf7515") != 0 || getdvarint(@"hash_add5b80d30e0737a") != 0) {
        return;
    }
    function_5b159f140bd186df();
    /#
        assert(function_f0b5522ee5ce0cb1());
    #/
    /#
        assert(isent(level.snd.var_4388174fd6467686));
    #/
    /#
        assert(isarray(level.snd.var_828ab610e771905));
    #/
    /#
        assertex(isstring(name), "snd_transient_unload requires a name argument");
    #/
    var_97453abd88b8cee4 = function_1186ca4e2e51afea(name);
    if (function_110d3ab280057f5b(!var_97453abd88b8cee4, "snd_transient_unload '" + name + "' not loaded")) {
        return;
    }
    level.snd.var_4388174fd6467686 settransientsoundbank(name + ".all", 0);
    level.snd.var_828ab610e771905[name] = undefined;
}

