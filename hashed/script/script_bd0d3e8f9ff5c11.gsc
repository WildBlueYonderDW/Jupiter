// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_52f2d330c7a21cb6;
#using script_200c1cd00f9ab885;

#namespace zombie_deathworm;

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b
// Size: 0x6a
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

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac
// Size: 0xa4
function function_14b3d69b9f175aef() {
    var_4890ccc509043c3c = function_93d1ef5f66691f8b(self.origin);
    if (!isdefined(var_4890ccc509043c3c)) {
        level.var_53335c6347493500++;
        var_4890ccc509043c3c = {var_20cdedd0b40811dc:level.var_53335c6347493500, radius:2000, origin:self.origin};
        level.var_5700d8decfa9d4f = array_add(level.var_5700d8decfa9d4f, var_4890ccc509043c3c);
        level.var_ca6e770e74de937b[level.var_53335c6347493500] = [0:var_4890ccc509043c3c];
    }
    function_858422d3879f557f(var_4890ccc509043c3c);
    /#
        function_66d4d09bd388ee78();
    #/
}

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x257
// Size: 0x36
function function_7b4daaf9179c9cee() {
    /#
        /#
            assert(isdefined(self.var_a64485b1cb0aadc8.origin));
        #/
    #/
    return self.var_a64485b1cb0aadc8.origin;
}

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x295
// Size: 0x36
function function_674396d03ad1a1fa() {
    /#
        /#
            assert(isdefined(self.var_a64485b1cb0aadc8.radius));
        #/
    #/
    return self.var_a64485b1cb0aadc8.radius;
}

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d3
// Size: 0x36
function function_ece5be42c1ccbb71() {
    /#
        /#
            assert(isdefined(self.var_a64485b1cb0aadc8.var_20cdedd0b40811dc));
        #/
    #/
    return self.var_a64485b1cb0aadc8.var_20cdedd0b40811dc;
}

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x311
// Size: 0x46
function function_858422d3879f557f(var_4890ccc509043c3c) {
    /#
        /#
            assert(isdefined(var_4890ccc509043c3c.origin));
        #/
    #/
    /#
        /#
            assert(isdefined(var_4890ccc509043c3c.radius));
        #/
    #/
    self.var_a64485b1cb0aadc8 = var_4890ccc509043c3c;
}

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35e
// Size: 0x67
function function_95d12d803b1f13bb(pos) {
    foreach (volume in level.var_e8b533c647a37168) {
        if (ispointinvolume(pos, volume)) {
            return 1;
        }
    }
    return 0;
}

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd
// Size: 0x67
function function_e82696e7b59178f3(pos) {
    foreach (volume in level.var_b3a50e9cc45c0150) {
        if (ispointinvolume(pos, volume)) {
            return 1;
        }
    }
    return 0;
}

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43c
// Size: 0x8d
function function_93d1ef5f66691f8b(pos) {
    foreach (var_4890ccc509043c3c in level.var_5700d8decfa9d4f) {
        dist_sq = distancesquared(var_4890ccc509043c3c.origin, pos);
        if (dist_sq < squared(var_4890ccc509043c3c.radius)) {
            return var_4890ccc509043c3c;
        }
    }
    return undefined;
}

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d1
// Size: 0xdc
function function_dd196c8614532a7e() {
    self endon("death");
    while (ent_flag("is_underground")) {
        var_20cdedd0b40811dc = function_ece5be42c1ccbb71();
        if (level.var_ca6e770e74de937b[var_20cdedd0b40811dc].size <= 1) {
            return;
        }
        var_7a25821a42f91ded = undefined;
        var_9d9f39b70c22774b = -1;
        foreach (var_4890ccc509043c3c in level.var_ca6e770e74de937b[var_20cdedd0b40811dc]) {
            var_4e333f60b3b1f754 = function_7c093aaec980131b(var_4890ccc509043c3c.origin, 1);
            if (var_4e333f60b3b1f754 > var_9d9f39b70c22774b) {
                var_9d9f39b70c22774b = var_4e333f60b3b1f754;
                var_7a25821a42f91ded = var_4890ccc509043c3c;
            }
            waitframe();
        }
        function_858422d3879f557f(var_7a25821a42f91ded);
        waitframe();
    }
}

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b4
// Size: 0x9a
function function_567352b560bfa797() {
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    level.var_ca6e770e74de937b = [];
    var_9aaea452d450a1bd = getstructarray("deathworm_arena", "script_noteworthy");
    level.var_53335c6347493500 = 0;
    foreach (var_4890ccc509043c3c in var_9aaea452d450a1bd) {
        function_23655a044ca75962(var_4890ccc509043c3c);
    }
    level.var_5700d8decfa9d4f = var_9aaea452d450a1bd;
}

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x655
// Size: 0xcd
function function_23655a044ca75962(var_4890ccc509043c3c) {
    if (!isdefined(var_4890ccc509043c3c)) {
        level.var_53335c6347493500++;
        return level.var_53335c6347493500;
    }
    if (isdefined(var_4890ccc509043c3c.var_20cdedd0b40811dc)) {
        return var_4890ccc509043c3c.var_20cdedd0b40811dc;
    }
    target_struct = undefined;
    if (isdefined(var_4890ccc509043c3c.target)) {
        target_struct = getstruct(var_4890ccc509043c3c.target, "targetname");
    }
    var_20cdedd0b40811dc = function_23655a044ca75962(target_struct);
    var_4890ccc509043c3c.var_20cdedd0b40811dc = var_20cdedd0b40811dc;
    if (!isdefined(level.var_ca6e770e74de937b[var_20cdedd0b40811dc])) {
        level.var_ca6e770e74de937b[var_20cdedd0b40811dc] = [];
    }
    level.var_ca6e770e74de937b[var_20cdedd0b40811dc] = array_add(level.var_ca6e770e74de937b[var_20cdedd0b40811dc], var_4890ccc509043c3c);
    return var_20cdedd0b40811dc;
}

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x72a
// Size: 0x2f
function function_66d4d09bd388ee78() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_751e00a00e530c41);
        function_fe953f000498048f();
    #/
}

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x760
// Size: 0x18
function private function_ffdbb04c41a0ac04() {
    /#
        return getdvarint(@"hash_c48f64bb1ff42277", 0) > 0;
    #/
}

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x77f
// Size: 0x1b
function private function_751e00a00e530c41() {
    /#
        function_2fb888667001fc39("<unknown string>", @"hash_c48f64bb1ff42277");
    #/
}

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x7a1
// Size: 0x5b
function private function_fd721a0350683a14(text, pos) {
    /#
        if (function_ffdbb04c41a0ac04()) {
            pos = function_53c4c53197386572(pos, self.origin + (0, 0, 70));
            print3d(pos, "<unknown string>" + text, (1, 0, 0));
        }
    #/
}

// Namespace zombie_deathworm/namespace_7762066fd5e7dbe9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x803
// Size: 0x2fc
function private function_b168f2d659feab3f() {
    /#
        level endon("<unknown string>");
        while (1) {
            if (!function_ffdbb04c41a0ac04()) {
                waitframe();
                continue;
            }
            if (!isdefined(level.players) || !isdefined(level.players[0])) {
                waitframe();
                continue;
            }
            var_33a6ac144efb85a6 = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
            if (isdefined(var_33a6ac144efb85a6)) {
                var_a80cebfdc85766dc = (0, 0.5, 1);
                draw_circle(var_33a6ac144efb85a6 function_7b4daaf9179c9cee(), var_33a6ac144efb85a6 function_674396d03ad1a1fa(), var_a80cebfdc85766dc, 1, 1, 1);
                sphere(var_33a6ac144efb85a6 function_7b4daaf9179c9cee(), 100, var_a80cebfdc85766dc, 1, 1);
                print3d(var_33a6ac144efb85a6 function_7b4daaf9179c9cee(), "<unknown string>", var_a80cebfdc85766dc);
                var_48f627463d405084 = (1, 0.2, 0.2);
                sphere(var_33a6ac144efb85a6.var_7aeae37022a80dc2.origin, 30, var_48f627463d405084, 1, 1);
                print3d(var_33a6ac144efb85a6.var_7aeae37022a80dc2.origin + (0, 0, -10), "<unknown string>", var_48f627463d405084, 0.8, 0.5);
            }
            foreach (var_4890ccc509043c3c in level.var_5700d8decfa9d4f) {
                var_a80cebfdc85766dc = (0.2, 0.5, 0.8);
                if (isdefined(var_4890ccc509043c3c.radius)) {
                    var_4e333f60b3b1f754 = function_7c093aaec980131b(var_4890ccc509043c3c.origin, 1);
                    draw_circle(var_4890ccc509043c3c.origin, var_4890ccc509043c3c.radius, var_a80cebfdc85766dc, 0.7, 1, 1);
                    sphere(var_4890ccc509043c3c.origin, 50, var_a80cebfdc85766dc, 1, 1);
                    print3d(var_4890ccc509043c3c.origin, "<unknown string>" + var_4890ccc509043c3c.var_20cdedd0b40811dc + "<unknown string>" + var_4e333f60b3b1f754, var_a80cebfdc85766dc, 0.7);
                }
            }
            foreach (var_5511c25d905eaae0 in level.var_e8b533c647a37168) {
                orientedbox(var_5511c25d905eaae0.origin, (20, 20, 20), var_5511c25d905eaae0.angles, (1, 0, 0), 1, 1);
                print3d(var_5511c25d905eaae0.origin, "<unknown string>", (1, 0, 0), 0.7, 0.5);
            }
            waitframe();
        }
    #/
}

