// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;

#namespace namespace_3ea25ac177a3c7db;

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x185
// Size: 0x1a
function function_ae82ffec3211495c() {
    if (!isdefined(level.var_c4383be682666f38)) {
        level.var_c4383be682666f38 = [];
    }
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a6
// Size: 0x7b
function function_a18d80bcfacb9e00(var_89bc1179ee536d3, var_635d9aafc5320f18) {
    if (!isdefined(level.var_c4383be682666f38)) {
        function_ae82ffec3211495c();
    }
    if (isdefined(level.var_c4383be682666f38[var_89bc1179ee536d3])) {
        return level.var_c4383be682666f38[var_89bc1179ee536d3];
    }
    /#
        assertex(var_635d9aafc5320f18 >= 0 && var_635d9aafc5320f18 < 4, "Invalid formation type of " + var_635d9aafc5320f18);
    #/
    level.var_c4383be682666f38[var_89bc1179ee536d3] = function_7c845df803100f6(var_635d9aafc5320f18);
    return level.var_c4383be682666f38[var_89bc1179ee536d3];
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x229
// Size: 0x38
function function_fed58bb9b0efe392(var_89bc1179ee536d3) {
    if (!isdefined(level.var_c4383be682666f38[var_89bc1179ee536d3])) {
        return;
    }
    function_795225119619e713(level.var_c4383be682666f38[var_89bc1179ee536d3]);
    level.var_c4383be682666f38[var_89bc1179ee536d3] = undefined;
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x268
// Size: 0xc5
function function_73d6d4ee28a18071(var_89bc1179ee536d3, var_129f5d1ec2e3fec5, var_635d9aafc5320f18) {
    if (!isdefined(var_635d9aafc5320f18)) {
        var_635d9aafc5320f18 = 3;
    }
    if (!isdefined(level.var_c4383be682666f38)) {
        function_ae82ffec3211495c();
    }
    if (!isdefined(level.var_c4383be682666f38[var_89bc1179ee536d3])) {
        function_a18d80bcfacb9e00(var_89bc1179ee536d3, var_635d9aafc5320f18);
    }
    if (!isarray(var_129f5d1ec2e3fec5)) {
        var_129f5d1ec2e3fec5 = [0:var_129f5d1ec2e3fec5];
    }
    foreach (ai in var_129f5d1ec2e3fec5) {
        ai function_72f3ddfe9ce296e9(level.var_c4383be682666f38[var_89bc1179ee536d3]);
        ai thread need_to_run(var_89bc1179ee536d3);
    }
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x334
// Size: 0x119
function function_98e62e94c2b167e0(var_89bc1179ee536d3, var_ce8aa2f658ab065c, var_ee585d28e97a042e, var_b4060a330731f1bd, var_1b9a7d48f06da667, var_9af84e76946ada66) {
    if (!isdefined(var_9af84e76946ada66)) {
        var_9af84e76946ada66 = 0;
    }
    if (!isdefined(level.var_c4383be682666f38[var_89bc1179ee536d3])) {
        return;
    }
    mid = floor(var_ce8aa2f658ab065c / 2);
    var_2d9b3ce673de9e8d = 1;
    for (var_a18a6ede5e50fbbd = 0; var_a18a6ede5e50fbbd < var_ee585d28e97a042e; var_a18a6ede5e50fbbd++) {
        for (var_db2bd31085bd21c3 = 0; var_db2bd31085bd21c3 < var_ce8aa2f658ab065c; var_db2bd31085bd21c3++) {
            if (!var_9af84e76946ada66 && var_a18a6ede5e50fbbd == 0 && var_db2bd31085bd21c3 == mid) {
                continue;
            }
            yoffset = var_b4060a330731f1bd * -1 * (var_db2bd31085bd21c3 - mid);
            xoffset = var_1b9a7d48f06da667 * -1 * var_a18a6ede5e50fbbd;
            if (var_9af84e76946ada66) {
                yoffset = yoffset - 0.5 * (var_ce8aa2f658ab065c - 1) % 2 * var_b4060a330731f1bd;
                xoffset = xoffset - var_1b9a7d48f06da667;
            }
            function_c412284514efc768(level.var_c4383be682666f38[var_89bc1179ee536d3], var_2d9b3ce673de9e8d, (xoffset, yoffset, 0));
            var_2d9b3ce673de9e8d++;
        }
    }
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x454
// Size: 0x27f
function function_cf3f27c3c5266ee2(var_89bc1179ee536d3, var_3f4d3640a452a225, numai, var_b4060a330731f1bd, var_1b9a7d48f06da667, var_9af84e76946ada66) {
    if (!isdefined(var_9af84e76946ada66)) {
        var_9af84e76946ada66 = 0;
    }
    if (!isdefined(level.var_c4383be682666f38[var_89bc1179ee536d3])) {
        return 1;
    }
    if (numai <= 1) {
        return 1;
    }
    if (var_9af84e76946ada66 && var_3f4d3640a452a225 != 1) {
        numai--;
    }
    switch (var_3f4d3640a452a225) {
    case 1:
        var_a2ba5631bd00e9d7 = ceil((sqrt(8 * numai + 1) - 1) / 2);
        var_2d9b3ce673de9e8d = 1;
        for (var_a18a6ede5e50fbbd = 0; var_a18a6ede5e50fbbd < var_a2ba5631bd00e9d7; var_a18a6ede5e50fbbd++) {
            for (var_db2bd31085bd21c3 = 0; var_db2bd31085bd21c3 < var_a18a6ede5e50fbbd + 1; var_db2bd31085bd21c3++) {
                if (var_a18a6ede5e50fbbd == 0 && var_db2bd31085bd21c3 == 0) {
                    continue;
                }
                yoffset = var_b4060a330731f1bd * (var_db2bd31085bd21c3 - var_a18a6ede5e50fbbd / 2);
                xoffset = var_1b9a7d48f06da667 * -1 * var_a18a6ede5e50fbbd;
                function_c412284514efc768(level.var_c4383be682666f38[var_89bc1179ee536d3], var_2d9b3ce673de9e8d, (xoffset, yoffset, 0));
                var_2d9b3ce673de9e8d++;
            }
        }
        return ((var_a2ba5631bd00e9d7 - 1) * var_b4060a330731f1bd);
    case 2:
        mid = 0;
        var_ce8aa2f658ab065c = 1;
        var_ee585d28e97a042e = numai;
        break;
    case 3:
        mid = 1;
        var_ce8aa2f658ab065c = 2;
        var_ee585d28e97a042e = ceil(numai / var_ce8aa2f658ab065c);
        break;
    case 4:
        mid = 1;
        var_ce8aa2f658ab065c = 3;
        var_ee585d28e97a042e = ceil(numai / var_ce8aa2f658ab065c);
        break;
    default:
        var_ce8aa2f658ab065c = ceil(sqrt(numai));
        var_ee585d28e97a042e = ceil(numai / var_ce8aa2f658ab065c);
        mid = floor(var_ce8aa2f658ab065c / 2);
        break;
    }
    var_2d9b3ce673de9e8d = 1;
    for (var_a18a6ede5e50fbbd = 0; var_a18a6ede5e50fbbd < var_ee585d28e97a042e; var_a18a6ede5e50fbbd++) {
        for (var_db2bd31085bd21c3 = 0; var_db2bd31085bd21c3 < var_ce8aa2f658ab065c; var_db2bd31085bd21c3++) {
            if (!var_9af84e76946ada66 && var_a18a6ede5e50fbbd == 0 && var_db2bd31085bd21c3 == mid) {
                continue;
            }
            yoffset = var_b4060a330731f1bd * -1 * (var_db2bd31085bd21c3 - mid);
            xoffset = var_1b9a7d48f06da667 * -1 * var_a18a6ede5e50fbbd;
            if (var_9af84e76946ada66) {
                yoffset = yoffset - 0.5 * (var_ce8aa2f658ab065c - 1) % 2 * var_b4060a330731f1bd;
                xoffset = xoffset - var_1b9a7d48f06da667;
            }
            function_c412284514efc768(level.var_c4383be682666f38[var_89bc1179ee536d3], var_2d9b3ce673de9e8d, (xoffset, yoffset, 0));
            var_2d9b3ce673de9e8d++;
        }
    }
    return (var_ce8aa2f658ab065c - 1) * var_b4060a330731f1bd;
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6db
// Size: 0xb7
function function_e780688c49cc9549(var_89bc1179ee536d3, var_93e0bc97a6d45499) {
    if (!isdefined(level.var_c4383be682666f38[var_89bc1179ee536d3])) {
        return;
    }
    /#
        assertex(var_93e0bc97a6d45499.size < 31, "Exceeding max number of formation offsets of " + 32 - 1 + " . Formation name of " + level.var_c4383be682666f38[var_89bc1179ee536d3]);
    #/
    count = 1;
    foreach (offset in var_93e0bc97a6d45499) {
        function_c412284514efc768(level.var_c4383be682666f38[var_89bc1179ee536d3], count, offset);
        count++;
    }
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x799
// Size: 0x78
function function_bc785df299663d60(var_89bc1179ee536d3, var_594fae9d24f99d9c, var_4544e77f9c7ca45d) {
    if (!isdefined(level.var_c4383be682666f38[var_89bc1179ee536d3])) {
        return;
    }
    maxcount = 31;
    /#
        assertex(var_594fae9d24f99d9c < maxcount && var_594fae9d24f99d9c > 0, "Setting invalid formation slot custom offset, must be below " + maxcount + " and above 0. Formation name of " + level.var_c4383be682666f38[var_89bc1179ee536d3]);
    #/
    function_c412284514efc768(level.var_c4383be682666f38[var_89bc1179ee536d3], var_594fae9d24f99d9c, var_4544e77f9c7ca45d);
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x818
// Size: 0x36
function set_goal(var_89bc1179ee536d3, goalposition) {
    if (!isdefined(level.var_c4383be682666f38[var_89bc1179ee536d3])) {
        return;
    }
    function_e29a9a1d854faa6a(level.var_c4383be682666f38[var_89bc1179ee536d3], goalposition);
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x855
// Size: 0x6a
function function_abfbc13862d7d880(var_cc408e19cc4792d2) {
    if (!isarray(var_cc408e19cc4792d2)) {
        var_cc408e19cc4792d2 = [0:var_cc408e19cc4792d2];
    }
    foreach (ai in var_cc408e19cc4792d2) {
        ai function_6d7d406f340b14c9();
    }
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8c6
// Size: 0x7b
function function_15fcafd3f1c9568e(var_89bc1179ee536d3, ent, var_f13def0a8331ba7, timestep) {
    if (!isdefined(var_f13def0a8331ba7)) {
        var_f13def0a8331ba7 = 100;
    }
    if (!isdefined(ent)) {
        return 0;
    }
    if (!isdefined(level.var_c4383be682666f38[var_89bc1179ee536d3])) {
        return 0;
    }
    leader = function_391f3c4f5a880ce5(var_89bc1179ee536d3);
    if (isdefined(leader)) {
        leader setgoalentity(ent);
        function_34c06b9933952e67(level.var_c4383be682666f38[var_89bc1179ee536d3], var_f13def0a8331ba7);
        return 1;
    }
    return 0;
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x949
// Size: 0x3f
function function_5e8d7d93ecffa23f(var_89bc1179ee536d3) {
    if (!isdefined(level.var_c4383be682666f38[var_89bc1179ee536d3])) {
        return 0;
    }
    leader = function_391f3c4f5a880ce5(var_89bc1179ee536d3);
    if (isdefined(leader)) {
        leader function_b3ca5b15a43d5f4e();
        return 1;
    }
    return 0;
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x990
// Size: 0x2d
function function_391f3c4f5a880ce5(var_89bc1179ee536d3) {
    if (!isdefined(level.var_c4383be682666f38[var_89bc1179ee536d3])) {
        return undefined;
    }
    return function_37a4bf80ea1cae75(level.var_c4383be682666f38[var_89bc1179ee536d3]);
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c5
// Size: 0x30
function function_679b2830741a1384(var_89bc1179ee536d3) {
    var_e766403f74b980cd = level.var_c4383be682666f38[var_89bc1179ee536d3];
    if (!isdefined(var_e766403f74b980cd)) {
        return;
    }
    self function_5ba70c95e357a4f9(var_e766403f74b980cd);
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9fc
// Size: 0x28
function private function_6d7d406f340b14c9() {
    if (istrue(self.var_eb3173f357049031)) {
        self.var_eb3173f357049031 = 0;
        self function_fd663014f7eae161();
        function_699890f2ebe93aa9();
    }
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa2b
// Size: 0x26
function private function_72f3ddfe9ce296e9(var_e766403f74b980cd) {
    function_6d7d406f340b14c9();
    self.var_eb3173f357049031 = 1;
    self function_19ef30914f93393e(var_e766403f74b980cd);
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa58
// Size: 0x1dc
function private need_to_run(var_89bc1179ee536d3) {
    self endon("death");
    self endon("enemy");
    self endon("following_entity");
    level endon("game_ended");
    self notify("ai_formation_run_watcher");
    self endon("ai_formation_run_watcher");
    var_5ceb8e651146f51c = 1000;
    var_4a9b8203f0e14a0 = 250;
    while (1) {
        leader = function_391f3c4f5a880ce5(var_89bc1179ee536d3);
        if (!isdefined(leader)) {
            wait(1);
            continue;
        }
        disttogoal = self pathdisttogoal() - leader pathdisttogoal();
        /#
            if (getdvarint(@"hash_96eb05fe9867a3a4", 0) == 1) {
                print3d(self.origin, self function_869f129f31d72088(), (1, 0, 0), 1, 1, 20);
                goal = self function_419ec26f7e37156(3);
                draw_circle(goal, var_5ceb8e651146f51c, (1, 0, 0), 50);
                draw_circle(goal, var_4a9b8203f0e14a0, (0, 1, 0), 50);
            }
        #/
        var_dd47ec6a7eac4674 = "sprint";
        if (self.var_7bd1c0edbaafb6e0 != var_dd47ec6a7eac4674 && disttogoal > var_5ceb8e651146f51c) {
            self enableavoidance(1);
            if (!isdefined(self.var_3bca4b669ba7140c) || !isdefined(self.var_d008717a85388441)) {
                self.var_3bca4b669ba7140c = self.var_7bd1c0edbaafb6e0;
                self.var_d008717a85388441 = self.var_5bdfa4fd67341cf5;
            }
            self.var_7bd1c0edbaafb6e0 = var_dd47ec6a7eac4674;
            self.var_5bdfa4fd67341cf5 = var_dd47ec6a7eac4674;
        } else if (self.var_7bd1c0edbaafb6e0 == var_dd47ec6a7eac4674 && disttogoal < var_4a9b8203f0e14a0) {
            self enableavoidance(0);
            self.var_7bd1c0edbaafb6e0 = self.var_3bca4b669ba7140c;
            self.var_5bdfa4fd67341cf5 = self.var_d008717a85388441;
        }
        wait(1);
    }
}

// Namespace namespace_3ea25ac177a3c7db/namespace_21337af87513582c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc3b
// Size: 0x41
function private function_699890f2ebe93aa9() {
    if (isdefined(self.var_3bca4b669ba7140c)) {
        self.var_7bd1c0edbaafb6e0 = self.var_3bca4b669ba7140c;
    }
    if (isdefined(self.var_d008717a85388441)) {
        self.var_5bdfa4fd67341cf5 = self.var_d008717a85388441;
    }
}

