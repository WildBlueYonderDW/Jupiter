// mwiii decomp prototype
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\engine\utility.gsc;

#namespace namespace_dc3509b15456adcd;

// Namespace namespace_dc3509b15456adcd/namespace_f8d983d04dd7f098
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f
// Size: 0x237
function init() {
    level.gulag.var_72898299e18201ca = getdvarint(@"hash_9f370893a02d7f7e", 1);
    if (!level.gulag.var_72898299e18201ca) {
        return;
    }
    namespace_47fd1e79a44628cd::function_c797c1f0977d41d1("overrideArenas", &function_2197e8b96724beae);
    namespace_47fd1e79a44628cd::function_c797c1f0977d41d1("getNamedArenaSettings", &getNamedArenaSettings);
    namespace_47fd1e79a44628cd::function_ed608478232fdeb2("addArenas", &function_fd7fbc8d2bcebbd3);
    namespace_47fd1e79a44628cd::function_ed608478232fdeb2("isArenaEnabled", &function_89644aef61fda016);
    namespace_47fd1e79a44628cd::function_ed608478232fdeb2("beginNewFight", &function_6cf3afc244dd4077);
    namespace_47fd1e79a44628cd::function_ed608478232fdeb2("handleEndArena", &function_3d69c38700b870f0);
    namespace_47fd1e79a44628cd::function_ed608478232fdeb2("jailEnter", &function_ae3c6ef7d251fd7d);
    namespace_47fd1e79a44628cd::function_ed608478232fdeb2("respawnCleanup", &function_4d792792272fd894);
    var_85cef4fa0d712afe = getmatchrulesdata("brData", "gulagNamedArenaList");
    if (var_85cef4fa0d712afe == "") {
        return;
    }
    var_e38d6bfcdaa395bd = getscriptbundle("gulagnamedarenalist:" + var_85cef4fa0d712afe);
    if (!isdefined(var_e38d6bfcdaa395bd)) {
        namespace_9c840bb9f2ecbf00::demoforcesre("Could not find scriptbundle gulagnamedarenalist:" + var_85cef4fa0d712afe);
        return;
    }
    level.gulag.var_f47125b3d5474f8d = spawnstruct();
    level.gulag.var_f47125b3d5474f8d.chance = getdvarfloat(@"hash_cbb5097fc1a36d1c", var_e38d6bfcdaa395bd.chance);
    level.gulag.var_f47125b3d5474f8d.var_a8e3c44cc7054759 = getdvarint(@"hash_f86bbf62d7600d2e", var_e38d6bfcdaa395bd.var_a8e3c44cc7054759);
    level.gulag.var_f47125b3d5474f8d.arenas = [];
    level.gulag.var_d22768d920d6fd85 = getdvarint(@"hash_4103c635701b02ab", 0);
    foreach (index, var_da02bb81d22c9cac in var_e38d6bfcdaa395bd.var_702ba38621dc2810) {
        function_5e14b1b91fc333d7(index, var_da02bb81d22c9cac);
    }
}

// Namespace namespace_dc3509b15456adcd/namespace_f8d983d04dd7f098
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd
// Size: 0x173
function function_5e14b1b91fc333d7(index, bundle) {
    var_8ff2cf27828da5a1 = getscriptbundle("gulagnamedarena:" + bundle.var_3b59b086c47c7c3);
    prefix = function_2ef675c13ca1c4af(@"hash_9f372493a02dbd12", var_8ff2cf27828da5a1.ref, "_");
    info = spawnstruct();
    info.index = index;
    info.weight = getdvarfloat(function_2ef675c13ca1c4af(prefix, "weight"), bundle.weight);
    info.settings = var_8ff2cf27828da5a1;
    var_bb81957d1ae1cf3a = namespace_3c37cb17ade254d::getstructarray(var_8ff2cf27828da5a1.targetname, "targetname");
    foreach (var_bdf25d8a73ff7dad in var_bb81957d1ae1cf3a) {
        var_bdf25d8a73ff7dad.var_638e3fc0c10a60ed = 1;
        var_bdf25d8a73ff7dad.var_17dc3ae4805542d3 = index;
        var_bdf25d8a73ff7dad.sortvalue = -1;
    }
    info.var_bb81957d1ae1cf3a = var_bb81957d1ae1cf3a;
    level.gulag.var_f47125b3d5474f8d.arenas[index] = info;
}

// Namespace namespace_dc3509b15456adcd/namespace_f8d983d04dd7f098
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x547
// Size: 0xe9
function function_fd7fbc8d2bcebbd3() {
    arenas = [];
    foreach (info in level.gulag.var_f47125b3d5474f8d.arenas) {
        var_72898299e18201ca = namespace_3c37cb17ade254d::getstructarray(info.settings.targetname, "targetname");
        foreach (arena in var_72898299e18201ca) {
            arenas[arenas.size] = arena;
        }
    }
    return arenas;
}

// Namespace namespace_dc3509b15456adcd/namespace_f8d983d04dd7f098
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x638
// Size: 0x41
function getNamedArenaSettings(arena) {
    if (!function_638e3fc0c10a60ed(arena)) {
        return undefined;
    }
    return level.gulag.var_f47125b3d5474f8d.arenas[arena.var_17dc3ae4805542d3];
}

// Namespace namespace_dc3509b15456adcd/namespace_f8d983d04dd7f098
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x681
// Size: 0x1c6
function function_2197e8b96724beae() {
    var_a15a6f013d6326e3 = function_5eba1288a2444fd9(self);
    if (isdefined(var_a15a6f013d6326e3)) {
        self.var_f065df9906eca7eb = 1;
        return [0:[0:var_a15a6f013d6326e3], 1:1];
    }
    if (randomfloat(1) >= level.gulag.var_f47125b3d5474f8d.chance) {
        return undefined;
    }
    var_6e4fee5e86fe52a9 = [];
    var_a67beaf986e513d7 = 0;
    foreach (arena in level.gulag.var_f47125b3d5474f8d.arenas) {
        if (arena.weight <= 0) {
            continue;
        }
        if (!function_c22fd025365f66e(arena)) {
            continue;
        }
        var_a67beaf986e513d7 = var_a67beaf986e513d7 + arena.weight;
        var_6e4fee5e86fe52a9[var_6e4fee5e86fe52a9.size] = arena;
    }
    if (!var_6e4fee5e86fe52a9.size) {
        return undefined;
    }
    var_f3fd55934af8f5d1 = randomfloat(var_a67beaf986e513d7);
    var_be66de030b25508c = 0;
    foreach (var_3960988d56840020 in var_6e4fee5e86fe52a9) {
        var_be66de030b25508c = var_be66de030b25508c + var_3960988d56840020.weight;
        if (var_f3fd55934af8f5d1 < var_be66de030b25508c) {
            self.var_f065df9906eca7eb = 1;
            return [0:var_3960988d56840020.var_bb81957d1ae1cf3a, 1:0];
        }
    }
}

// Namespace namespace_dc3509b15456adcd/namespace_f8d983d04dd7f098
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84e
// Size: 0xbe
function function_c22fd025365f66e(var_3960988d56840020) {
    foreach (arena in level.gulag.arenas) {
        if (!function_638e3fc0c10a60ed(arena)) {
            continue;
        }
        if (arena.var_17dc3ae4805542d3 != var_3960988d56840020.index) {
            continue;
        }
        if (arena.matches.size < level.gulag.var_f47125b3d5474f8d.var_a8e3c44cc7054759) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_dc3509b15456adcd/namespace_f8d983d04dd7f098
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x914
// Size: 0x7e
function function_89644aef61fda016(arena, player) {
    if (!function_638e3fc0c10a60ed(arena)) {
        return 1;
    }
    if (function_638e3fc0c10a60ed(arena) && !istrue(player.var_f065df9906eca7eb)) {
        return 0;
    }
    info = level.gulag.var_f47125b3d5474f8d.arenas[arena.var_17dc3ae4805542d3];
    return info.weight > 0;
}

// Namespace namespace_dc3509b15456adcd/namespace_f8d983d04dd7f098
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99a
// Size: 0x18
function function_638e3fc0c10a60ed(arena) {
    return istrue(arena.var_638e3fc0c10a60ed);
}

// Namespace namespace_dc3509b15456adcd/namespace_f8d983d04dd7f098
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ba
// Size: 0x8b
function function_ae3c6ef7d251fd7d(arena) {
    if (!function_638e3fc0c10a60ed(arena)) {
        return;
    }
    info = level.gulag.var_f47125b3d5474f8d.arenas[arena.var_17dc3ae4805542d3];
    if (istrue(info.settings.var_a92a286f14b01cf4) && istrue(level.gulag.var_d22768d920d6fd85)) {
        self nightvisionviewon();
        thread function_eef7b748cc7aca1f();
    }
}

// Namespace namespace_dc3509b15456adcd/namespace_f8d983d04dd7f098
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4c
// Size: 0xd9
function function_6cf3afc244dd4077(arena) {
    if (!function_638e3fc0c10a60ed(arena)) {
        return;
    }
    info = level.gulag.var_f47125b3d5474f8d.arenas[arena.var_17dc3ae4805542d3];
    foreach (player in arena.arenaplayers) {
        if (istrue(info.settings.var_a92a286f14b01cf4) && !istrue(level.gulag.var_d22768d920d6fd85)) {
            player thread function_d03e0dc9dc0d509c(1.5);
        }
    }
}

// Namespace namespace_dc3509b15456adcd/namespace_f8d983d04dd7f098
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2c
// Size: 0x120
function function_3d69c38700b870f0(arena) {
    foreach (player in arena.arenaplayers) {
        player.var_f065df9906eca7eb = undefined;
    }
    if (!function_638e3fc0c10a60ed(arena)) {
        return;
    }
    wait(namespace_47fd1e79a44628cd::function_86ee3121d91c59c3() + 1);
    info = level.gulag.var_f47125b3d5474f8d.arenas[arena.var_17dc3ae4805542d3];
    foreach (player in arena.arenaplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (istrue(info.settings.var_a92a286f14b01cf4)) {
            player nightvisionviewoff(1);
        }
    }
}

// Namespace namespace_dc3509b15456adcd/namespace_f8d983d04dd7f098
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc53
// Size: 0x94
function function_4d792792272fd894(player) {
    arena = player.arena;
    player.var_f065df9906eca7eb = undefined;
    if (!isdefined(arena)) {
        return;
    }
    if (!function_638e3fc0c10a60ed(arena)) {
        return;
    }
    info = level.gulag.var_f47125b3d5474f8d.arenas[arena.var_17dc3ae4805542d3];
    if (istrue(info.settings.var_a92a286f14b01cf4)) {
        player nightvisionviewoff(1);
    }
}

// Namespace namespace_dc3509b15456adcd/namespace_f8d983d04dd7f098
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcee
// Size: 0xe9
function function_5eba1288a2444fd9(player) {
    foreach (arena in level.gulag.arenas) {
        if (!function_638e3fc0c10a60ed(arena)) {
            continue;
        }
        foreach (match in arena.matches) {
            if (match.size == 1) {
                if (player.team == match[0].team) {
                    continue;
                }
                return arena;
            }
        }
    }
    return undefined;
}

// Namespace namespace_dc3509b15456adcd/namespace_f8d983d04dd7f098
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddf
// Size: 0x24
function function_d03e0dc9dc0d509c(delay) {
    self endon("death_or_disconnect");
    wait(delay);
    self nightvisionviewon();
    thread function_eef7b748cc7aca1f();
}

// Namespace namespace_dc3509b15456adcd/namespace_f8d983d04dd7f098
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0a
// Size: 0x2d
function function_eef7b748cc7aca1f() {
    self endon("death_or_disconnect");
    wait(2);
    if (istrue(self.gulag) && !self isnightvisionon()) {
        self nightvisionviewon(1);
    }
}

