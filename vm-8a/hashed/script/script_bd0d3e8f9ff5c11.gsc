#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\devgui.gsc;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_52f2d330c7a21cb6;
#using script_200c1cd00f9ab885;

#namespace zombie_deathworm;

// Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b
// Size: 0x69
function function_1fa609d0d2a30cf9(params) {
    if (utility::flag("deathworm_arena_precache_init")) {
        return;
    }
    utility::flag_set("deathworm_arena_precache_init");
    function_567352b560bfa797();
    level.var_e8b533c647a37168 = function_f159c10d5cf8f0b4("deathworm_exclude_unburrow", "script_noteworthy");
    level.var_b3a50e9cc45c0150 = function_f159c10d5cf8f0b4("deathworm_exclude_melee", "script_noteworthy");
    /#
        level thread function_b168f2d659feab3f();
    #/
}

// Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac
// Size: 0xa3
function function_14b3d69b9f175aef() {
    arena_struct = function_93d1ef5f66691f8b(self.origin);
    if (!isdefined(arena_struct)) {
        level.var_53335c6347493500++;
        arena_struct = {#arena_id:level.var_53335c6347493500, #radius:2000, #origin:self.origin};
        level.var_5700d8decfa9d4f = array_add(level.var_5700d8decfa9d4f, arena_struct);
        level.var_ca6e770e74de937b[level.var_53335c6347493500] = [arena_struct];
    }
    function_858422d3879f557f(arena_struct);
    /#
        function_66d4d09bd388ee78();
    #/
}

// Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x257
// Size: 0x35
function function_7b4daaf9179c9cee() {
    assert(isdefined(self.var_a64485b1cb0aadc8.origin));
    return self.var_a64485b1cb0aadc8.origin;
}

// Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x295
// Size: 0x35
function function_674396d03ad1a1fa() {
    assert(isdefined(self.var_a64485b1cb0aadc8.radius));
    return self.var_a64485b1cb0aadc8.radius;
}

// Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d3
// Size: 0x35
function function_ece5be42c1ccbb71() {
    assert(isdefined(self.var_a64485b1cb0aadc8.arena_id));
    return self.var_a64485b1cb0aadc8.arena_id;
}

// Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x311
// Size: 0x45
function function_858422d3879f557f(arena_struct) {
    assert(isdefined(arena_struct.origin));
    assert(isdefined(arena_struct.radius));
    self.var_a64485b1cb0aadc8 = arena_struct;
}

// Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35e
// Size: 0x66
function function_95d12d803b1f13bb(pos) {
    foreach (volume in level.var_e8b533c647a37168) {
        if (ispointinvolume(pos, volume)) {
            return true;
        }
    }
    return false;
}

// Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd
// Size: 0x66
function function_e82696e7b59178f3(pos) {
    foreach (volume in level.var_b3a50e9cc45c0150) {
        if (ispointinvolume(pos, volume)) {
            return true;
        }
    }
    return false;
}

// Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43c
// Size: 0x8c
function function_93d1ef5f66691f8b(pos) {
    foreach (arena_struct in level.var_5700d8decfa9d4f) {
        dist_sq = distancesquared(arena_struct.origin, pos);
        if (dist_sq < squared(arena_struct.radius)) {
            return arena_struct;
        }
    }
    return undefined;
}

// Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d1
// Size: 0xdb
function function_dd196c8614532a7e() {
    self endon("death");
    while (ent_flag("is_underground")) {
        arena_id = function_ece5be42c1ccbb71();
        if (level.var_ca6e770e74de937b[arena_id].size <= 1) {
            return;
        }
        var_7a25821a42f91ded = undefined;
        var_9d9f39b70c22774b = -1;
        foreach (arena_struct in level.var_ca6e770e74de937b[arena_id]) {
            influence = function_7c093aaec980131b(arena_struct.origin, 1);
            if (influence > var_9d9f39b70c22774b) {
                var_9d9f39b70c22774b = influence;
                var_7a25821a42f91ded = arena_struct;
            }
            waitframe();
        }
        function_858422d3879f557f(var_7a25821a42f91ded);
        waitframe();
    }
}

// Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b4
// Size: 0x99
function function_567352b560bfa797() {
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    level.var_ca6e770e74de937b = [];
    arena_structs = getstructarray("deathworm_arena", "script_noteworthy");
    level.var_53335c6347493500 = 0;
    foreach (arena_struct in arena_structs) {
        function_23655a044ca75962(arena_struct);
    }
    level.var_5700d8decfa9d4f = arena_structs;
}

// Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x655
// Size: 0xcc
function function_23655a044ca75962(arena_struct) {
    if (!isdefined(arena_struct)) {
        level.var_53335c6347493500++;
        return level.var_53335c6347493500;
    }
    if (isdefined(arena_struct.arena_id)) {
        return arena_struct.arena_id;
    }
    target_struct = undefined;
    if (isdefined(arena_struct.target)) {
        target_struct = getstruct(arena_struct.target, "targetname");
    }
    arena_id = function_23655a044ca75962(target_struct);
    arena_struct.arena_id = arena_id;
    if (!isdefined(level.var_ca6e770e74de937b[arena_id])) {
        level.var_ca6e770e74de937b[arena_id] = [];
    }
    level.var_ca6e770e74de937b[arena_id] = array_add(level.var_ca6e770e74de937b[arena_id], arena_struct);
    return arena_id;
}

/#

    // Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x72a
    // Size: 0x2e
    function function_66d4d09bd388ee78() {
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_a9a864379a098ad6("<dev string:x38>", "<dev string:x44>", &function_751e00a00e530c41);
        function_fe953f000498048f();
    }

    // Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x760
    // Size: 0x17
    function private function_ffdbb04c41a0ac04() {
        return getdvarint(@"hash_c48f64bb1ff42277", 0) > 0;
    }

    // Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x77f
    // Size: 0x1a
    function private function_751e00a00e530c41() {
        function_2fb888667001fc39("<dev string:x55>", @"hash_c48f64bb1ff42277");
    }

    // Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x7a1
    // Size: 0x5a
    function private arena_print(text, pos) {
        if (function_ffdbb04c41a0ac04()) {
            pos = default_to(pos, self.origin + (0, 0, 70));
            print3d(pos, "<dev string:x6b>" + text, (1, 0, 0));
        }
    }

    // Namespace zombie_deathworm / namespace_7762066fd5e7dbe9
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x803
    // Size: 0x2fb
    function private function_b168f2d659feab3f() {
        level endon("<dev string:x7d>");
        while (true) {
            if (!function_ffdbb04c41a0ac04()) {
                waitframe();
                continue;
            }
            if (!isdefined(level.players) || !isdefined(level.players[0])) {
                waitframe();
                continue;
            }
            worm = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<dev string:x88>");
            if (isdefined(worm)) {
                arena_color = (0, 0.5, 1);
                draw_circle(worm function_7b4daaf9179c9cee(), worm function_674396d03ad1a1fa(), arena_color, 1, 1, 1);
                sphere(worm function_7b4daaf9179c9cee(), 100, arena_color, 1, 1);
                print3d(worm function_7b4daaf9179c9cee(), "<dev string:x99>", arena_color);
                var_48f627463d405084 = (1, 0.2, 0.2);
                sphere(worm.var_7aeae37022a80dc2.origin, 30, var_48f627463d405084, 1, 1);
                print3d(worm.var_7aeae37022a80dc2.origin + (0, 0, -10), "<dev string:xae>", var_48f627463d405084, 0.8, 0.5);
            }
            foreach (arena_struct in level.var_5700d8decfa9d4f) {
                arena_color = (0.2, 0.5, 0.8);
                if (isdefined(arena_struct.radius)) {
                    influence = function_7c093aaec980131b(arena_struct.origin, 1);
                    draw_circle(arena_struct.origin, arena_struct.radius, arena_color, 0.7, 1, 1);
                    sphere(arena_struct.origin, 50, arena_color, 1, 1);
                    print3d(arena_struct.origin, "<dev string:xca>" + arena_struct.arena_id + "<dev string:xe0>" + influence, arena_color, 0.7);
                }
            }
            foreach (exclude_volume in level.var_e8b533c647a37168) {
                orientedbox(exclude_volume.origin, (20, 20, 20), exclude_volume.angles, (1, 0, 0), 1, 1);
                print3d(exclude_volume.origin, "<dev string:xf1>", (1, 0, 0), 0.7, 0.5);
            }
            waitframe();
        }
    }

#/
