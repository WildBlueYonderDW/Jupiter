// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_48814951e916af89;
#using script_5def7af2a9f04234;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_6fba7df440c493c4;
#using script_6bc507afe7a93a3;
#using script_69a61780e1cc21a9;
#using scripts\mp\utility\debug.gsc;
#using script_1174abedbefe9ada;
#using script_120270bd0a747a35;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\common\vehicle_paths.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_2bc0b0102f9b7751;

#namespace namespace_f3747e64a39c0f46;

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ad
// Size: 0x11c
function function_d0ffcd08e0870cf2() {
    level.var_425df8e23aaef18c = 1;
    level endon("game_ended");
    setdvar(@"hash_cc62b45cdbe0ddc1", 0);
    setdvar(@"hash_44d7ef19e2c9454e", 0);
    setdvar(@"hash_83158ef84a03a108", 0);
    setdvar(@"hash_31aabcc3ae1ae28b", 0);
    level.var_5bf59658dac91f53 = getdvarint(@"hash_2b8c82f04a4d868c", 15);
    var_2b95d18cd2efb24b = getdvarint(@"hash_7e7a367ebf018b24", 768);
    level.var_b6596eac6f86e8f6 = var_2b95d18cd2efb24b * var_2b95d18cd2efb24b;
    var_25c50bea7cfd2659 = getdvarint(@"hash_89d19c15b1e73afa", 3072);
    level.var_21de02fbb76d8a4 = var_25c50bea7cfd2659 * var_25c50bea7cfd2659;
    level.var_253d97d4fc2e6355 = getdvarint(@"hash_89d19c15b1e73afa", 1024);
    level thread initvehicles();
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    level.var_4eb71f2b8cba5cb = &function_9be6618055ceb851;
    function_203ace42414afb23();
    /#
        level thread function_d3d8ae54f1db925();
        level thread function_6bbc2202f6cb024d();
    #/
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d0
// Size: 0x19
function initvehicles() {
    waittillframeend();
    namespace_68d1bc1bac7da538::init_vehicles();
    namespace_ea79ad160580b4e7::main();
    namespace_d8c2d739478db8bb::main();
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f0
// Size: 0x638
function function_203ace42414afb23() {
    while (!flag_exist("create_script_initialized")) {
        waitframe();
    }
    flag_wait("create_script_initialized");
    waitframe();
    level.var_3122f605f0e8e125 = getstructarray("heli_exit", "targetname");
    if (function_47d356083884f913()) {
        while (level.poi.size == 0) {
            waitframe();
        }
        waitframe();
        foreach (poiname, poi in level.poi) {
            struct = spawnstruct();
            struct.var_c4677fcd658fc8e7 = [];
            struct.var_4f922af45d0cac6c = [];
            if (istrue(level.var_4cfd75aa6ddde156)) {
                struct.var_c9464c89a69010e2 = getstructarray("heli_postLandingDest", "script_noteworthy");
                var_4f922af45d0cac6c = getstructarray("heli_unload", "script_noteworthy");
                struct.var_4f922af45d0cac6c = function_7802832a1f064ccd(var_4f922af45d0cac6c, "heli_unload");
                struct.var_144fd45f9438fc65 = getstructarray("heli_exit", "targetname");
                level.poi[poiname]["heliReinforceStruct"] = struct;
                var_50f783a5617f8940 = getstructarray("heli_reinforceNode", "script_noteworthy");
                var_5d0d1ce28492ddad = function_7802832a1f064ccd(var_50f783a5617f8940, "heli_reinforceNode");
            } else {
                struct.var_c9464c89a69010e2 = function_9656b61cc8a37cba(getstructarray("heli_postLandingDest", "script_noteworthy"), poiname);
                var_4f922af45d0cac6c = function_9656b61cc8a37cba(getstructarray("heli_unload", "script_noteworthy"), poiname);
                struct.var_4f922af45d0cac6c = function_7802832a1f064ccd(var_4f922af45d0cac6c, "heli_unload");
                struct.var_144fd45f9438fc65 = function_9656b61cc8a37cba(getstructarray("heli_exit", "targetname"), poiname);
                level.poi[poiname]["heliReinforceStruct"] = struct;
                var_50f783a5617f8940 = function_9656b61cc8a37cba(getstructarray("heli_reinforceNode", "script_noteworthy"), poiname);
                var_5d0d1ce28492ddad = function_7802832a1f064ccd(var_50f783a5617f8940, "heli_reinforceNode");
            }
            foreach (loc in var_4f922af45d0cac6c) {
                if (isdefined(loc.target)) {
                    loc.exit_node = getstruct(loc.target, "targetname");
                    loc.target = undefined;
                }
            }
            foreach (pathnode in var_5d0d1ce28492ddad) {
                arraysize = level.poi[poiname]["heliReinforceStruct"].var_c4677fcd658fc8e7.size;
                level.poi[poiname]["heliReinforceStruct"].var_c4677fcd658fc8e7[arraysize] = pathnode;
                if (isdefined(pathnode.target)) {
                    node = getstruct(pathnode.target, "targetname");
                    while (isdefined(node) && isdefined(node.target)) {
                        if (isdefined(node.script_unload)) {
                            node.var_9c763a8af793b77a = pathnode;
                            arraysize = level.poi[poiname]["heliReinforceStruct"].var_4f922af45d0cac6c.size;
                            level.poi[poiname]["heliReinforceStruct"].var_4f922af45d0cac6c[arraysize] = node;
                        }
                        node = getstruct(node.target, "targetname");
                    }
                }
            }
            level.poi[poiname]["heliReinforceStruct"].var_c4677fcd658fc8e7 = array_randomize(level.poi[poiname]["heliReinforceStruct"].var_c4677fcd658fc8e7);
        }
    } else {
        level.helireinforcestruct = spawnstruct();
        level.helireinforcestruct.var_c4677fcd658fc8e7 = [];
        level.helireinforcestruct.var_4f922af45d0cac6c = [];
        level.helireinforcestruct.var_c9464c89a69010e2 = getstructarray("heli_postLandingDest", "script_noteworthy");
        var_4f922af45d0cac6c = getstructarray("heli_unload", "script_noteworthy");
        level.helireinforcestruct.var_4f922af45d0cac6c = function_7802832a1f064ccd(var_4f922af45d0cac6c, "heli_unload");
        var_50f783a5617f8940 = getstructarray("heli_reinforceNode", "script_noteworthy");
        var_5d0d1ce28492ddad = function_7802832a1f064ccd(var_50f783a5617f8940, "heli_reinforceNode");
        foreach (pathnode in var_5d0d1ce28492ddad) {
            level.helireinforcestruct.var_c4677fcd658fc8e7[level.helireinforcestruct.var_c4677fcd658fc8e7.size] = pathnode;
            if (isdefined(pathnode.target)) {
                node = getstruct(pathnode.target, "targetname");
                while (isdefined(node.target)) {
                    if (isdefined(node.script_unload)) {
                        node.var_9c763a8af793b77a = pathnode;
                        level.helireinforcestruct.var_4f922af45d0cac6c[level.helireinforcestruct.var_4f922af45d0cac6c.size] = node;
                    }
                    node = getstruct(node.target, "targetname");
                }
            }
        }
        level.helireinforcestruct.var_c4677fcd658fc8e7 = array_randomize(level.helireinforcestruct.var_c4677fcd658fc8e7);
    }
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2f
// Size: 0x114
function function_7802832a1f064ccd(array, name) {
    var_e4c0c3198c6d4413 = [];
    foreach (loc in array) {
        duplicate = 0;
        foreach (entry in var_e4c0c3198c6d4413) {
            if (distance2dsquared(loc.origin, entry.origin) < 65536) {
                /#
                    println("smoke_grenade_expl_trans" + name + "<unknown string>" + loc.origin);
                #/
                duplicate = 1;
                break;
            }
        }
        if (!duplicate) {
            var_e4c0c3198c6d4413[var_e4c0c3198c6d4413.size] = loc;
        }
    }
    return var_e4c0c3198c6d4413;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4b
// Size: 0x2c9
function function_9be6618055ceb851(var_c5e7fce963586ec0, var_93390a6953905fef, team, poiname) {
    var_a9ce0552ed2ea429 = undefined;
    if (0) {
        level thread namespace_d028276791d9cff6::drawsphere(var_c5e7fce963586ec0, 32, 60, (0, 0, 1));
    }
    if (function_47d356083884f913()) {
        if (!isdefined(poiname)) {
            poiname = function_6cc445c02b5effac(var_c5e7fce963586ec0);
        }
        var_a9ce0552ed2ea429 = sortbydistance(level.poi[poiname]["heliReinforceStruct"].var_4f922af45d0cac6c, var_c5e7fce963586ec0);
    } else {
        var_a9ce0552ed2ea429 = sortbydistance(level.helireinforcestruct.var_4f922af45d0cac6c, var_c5e7fce963586ec0);
    }
    var_1c6832ef5cbb10fc = [];
    foreach (loc in var_a9ce0552ed2ea429) {
        var_54b174a893636475 = drop_to_ground(loc.origin, 100);
        if (abs(var_54b174a893636475[2] - var_c5e7fce963586ec0[2]) <= level.var_253d97d4fc2e6355) {
            var_1c6832ef5cbb10fc[var_1c6832ef5cbb10fc.size] = loc;
        }
    }
    var_a9ce0552ed2ea429 = var_1c6832ef5cbb10fc;
    var_8824eed8622b038a = 5;
    if (istrue(var_93390a6953905fef)) {
        var_8824eed8622b038a = 1;
    }
    var_a678dfa17ec4c56b = [];
    foreach (loc in var_a9ce0552ed2ea429) {
        if (var_a678dfa17ec4c56b.size == var_8824eed8622b038a) {
            break;
        }
        dist = distance2dsquared(loc.origin, var_c5e7fce963586ec0);
        if (dist < level.var_b6596eac6f86e8f6) {
            if (0) {
                level thread namespace_d028276791d9cff6::drawsphere(loc.origin, 32, 60, (1, 0, 0));
            }
            continue;
        } else if (dist > level.var_21de02fbb76d8a4) {
            if (0) {
                level thread namespace_d028276791d9cff6::drawsphere(loc.origin, 32, 60, (1, 0, 0));
            }
            continue;
        } else {
            if (0) {
                level thread namespace_d028276791d9cff6::drawsphere(loc.origin, 32, 60, (0, 1, 0));
            }
            var_a678dfa17ec4c56b[var_a678dfa17ec4c56b.size] = loc;
        }
    }
    if (!istrue(level.var_85e83f382aedc103)) {
        var_a678dfa17ec4c56b = function_34ea974920aa74b9(var_a678dfa17ec4c56b);
        var_a678dfa17ec4c56b = array_randomize(var_a678dfa17ec4c56b);
    }
    pathnode = function_321665dcdcbf401e(var_a678dfa17ec4c56b, var_c5e7fce963586ec0, undefined, poiname);
    if (isdefined(pathnode)) {
        return pathnode;
    }
    pathnode = function_321665dcdcbf401e(var_a9ce0552ed2ea429, var_c5e7fce963586ec0, var_8824eed8622b038a, poiname);
    if (isdefined(pathnode)) {
        return pathnode;
    }
    return undefined;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1c
// Size: 0x123
function function_34ea974920aa74b9(var_a9ce0552ed2ea429) {
    var_8d990899198d4647 = undefined;
    foreach (loc in var_a9ce0552ed2ea429) {
        if (isdefined(loc.var_f132458be445204)) {
            if (!isdefined(var_8d990899198d4647) || loc.var_f132458be445204 < var_8d990899198d4647) {
                var_8d990899198d4647 = loc.var_f132458be445204;
            }
        } else {
            var_8d990899198d4647 = 0;
        }
    }
    var_8022a89f6197d261 = [];
    foreach (loc in var_a9ce0552ed2ea429) {
        if (isdefined(loc.var_f132458be445204) && loc.var_f132458be445204 == var_8d990899198d4647 || !isdefined(loc.var_f132458be445204) && var_8d990899198d4647 == 0) {
            var_8022a89f6197d261[var_8022a89f6197d261.size] = loc;
        }
    }
    return var_8022a89f6197d261;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1047
// Size: 0x1ed
function function_321665dcdcbf401e(array, var_34ce337e073a0c34, var_9747c46274dba9d9, poiname) {
    if (!isdefined(array)) {
        return;
    }
    var_9e334397541dca8e = spawnstruct();
    index = 0;
    if (isdefined(var_9747c46274dba9d9)) {
        index = var_9747c46274dba9d9;
    }
    for (i = index; i < array.size; i++) {
        if (!isdefined(array[i])) {
            continue;
        }
        loc = array[i];
        if (istrue(loc.used)) {
            continue;
        }
        if (namespace_7789f919216d38a2::radiation_isinradiation(loc.origin)) {
            continue;
        }
        node = undefined;
        if (isdefined(loc.var_9c763a8af793b77a)) {
            node = loc.var_9c763a8af793b77a;
        } else {
            node = function_42aa412d7e4d7c37(loc, var_34ce337e073a0c34, poiname);
        }
        if (!isdefined(node)) {
            continue;
        }
        if (istrue(node.used)) {
            continue;
        }
        heli_type = undefined;
        if (isdefined(loc.script_parameters)) {
            var_75d516368976b166 = strtok(loc.script_parameters, " ");
            heli_type = random(var_75d516368976b166);
            if (!function_fa537f1ab52a76d1(heli_type) || !istrue(function_29b4292c92443328(heli_type).ai.var_289df80e1ded586f)) {
                heli_type = undefined;
            }
        }
        var_9e334397541dca8e.node = node;
        var_9e334397541dca8e.var_378d6643d1b02a = heli_type;
        var_9e334397541dca8e.node.var_4583939a603f7170 = loc.origin;
        var_9e334397541dca8e.var_2770af6f8cecfc40 = loc;
        function_b3d7b682f3c2d9d(node, loc);
        if (!isdefined(loc.var_f132458be445204)) {
            loc.var_f132458be445204 = 0;
        }
        loc.var_f132458be445204++;
        return var_9e334397541dca8e;
    }
    return undefined;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123c
// Size: 0xc6
function function_42aa412d7e4d7c37(loc, var_34ce337e073a0c34, poiname) {
    var_aace9cdbda94ed28 = undefined;
    if (function_47d356083884f913()) {
        if (!isdefined(poiname)) {
            poiname = function_6cc445c02b5effac(var_34ce337e073a0c34);
        }
        var_aace9cdbda94ed28 = sortbydistance(level.poi[poiname]["heliReinforceStruct"].var_c4677fcd658fc8e7, var_34ce337e073a0c34);
    } else {
        var_aace9cdbda94ed28 = sortbydistance(level.helireinforcestruct.var_c4677fcd658fc8e7, var_34ce337e073a0c34);
    }
    for (i = 0; i < var_aace9cdbda94ed28.size; i++) {
        if (istrue(var_aace9cdbda94ed28[i].used)) {
            continue;
        }
        if (isdefined(var_aace9cdbda94ed28[i].target)) {
            continue;
        }
        return var_aace9cdbda94ed28[i];
    }
    return undefined;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x130a
// Size: 0x23
function function_db68d9a06b8c63a6(node, timer) {
    wait(timer);
    node.used = 0;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1334
// Size: 0x52
function function_307d3746c484ec65(var_a3bc9c316b0f9d64) {
    if (isdefined(var_a3bc9c316b0f9d64)) {
        var_1dc99acf04aceb20 = sortbydistance(level.helireinforcestruct.var_c9464c89a69010e2, var_a3bc9c316b0f9d64);
        return var_1dc99acf04aceb20[0];
    }
    return random(level.helireinforcestruct.var_c9464c89a69010e2);
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138e
// Size: 0x3d
function function_b3d7b682f3c2d9d(var_41ee18556b2486f, var_2770af6f8cecfc40) {
    var_41ee18556b2486f.used = 1;
    var_2770af6f8cecfc40.used = 1;
    var_41ee18556b2486f.var_2770af6f8cecfc40 = var_2770af6f8cecfc40;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d2
// Size: 0x4a
function function_e1310878ab1f5e7c(var_41ee18556b2486f) {
    var_41ee18556b2486f.used = 0;
    if (isdefined(var_41ee18556b2486f.var_2770af6f8cecfc40)) {
        var_41ee18556b2486f.var_2770af6f8cecfc40.used = 0;
        var_41ee18556b2486f.var_2770af6f8cecfc40 = undefined;
    }
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1423
// Size: 0x198
function function_8062c7f3856760fc() {
    level endon("game_ended");
    level notify("stopUnloadTest");
    level endon("stopUnloadTest");
    level.var_85e83f382aedc103 = 1;
    locs = level.helireinforcestruct.var_4f922af45d0cac6c;
    foreach (loc in locs) {
        loc.var_5b697c075e0717dc = undefined;
    }
    var_3663424bf23734e0 = 0;
    while (1) {
        if (var_3663424bf23734e0 == locs.size) {
            foreach (loc in locs) {
                loc.var_5b697c075e0717dc = undefined;
            }
        }
        var_3663424bf23734e0 = 0;
        for (i = 0; i < locs.size; i++) {
            loc = locs[i];
            if (istrue(loc.var_5b697c075e0717dc)) {
                var_3663424bf23734e0++;
            } else {
                riders = function_3779deb97b61a65(2, loc.origin, "high", "reinforcements", "debug");
                if (isdefined(riders)) {
                    loc.var_5b697c075e0717dc = 1;
                    thread namespace_d028276791d9cff6::drawsphere(loc.origin, 64, 60, (0, 1, 0));
                }
                wait(15);
            }
        }
        wait(1);
    }
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 17, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c2
// Size: 0x24f
function function_3779deb97b61a65(numagents, var_c5e7fce963586ec0, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, goalradius, var_21f24aecb313e479, var_ec862c2c00c7ab5d, var_f891e067b8802c0d, var_ebc42e43f4b05504, nationality, var_6dce075f68546b3, var_96e335eae30651e5) {
    if (isdefined(level.radiation) && istrue(level.radiation.var_9badbb469626f6)) {
        return;
    }
    if (isdefined(level.var_b08b4d8a5fedebdb)) {
        riders = [[ level.var_b08b4d8a5fedebdb ]](var_c5e7fce963586ec0, team, poiname);
        if (isdefined(riders)) {
            return riders;
        }
    }
    var_c5e7fce963586ec0 = namespace_2000a83505151e5b::function_d378cc95abab583b(var_c5e7fce963586ec0, poiname);
    var_c5e7fce963586ec0 = getclosestpointonnavmesh(var_c5e7fce963586ec0);
    if (!isdefined(poiname)) {
        poiname = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(var_c5e7fce963586ec0);
    }
    if (namespace_36f464722d326bbe::function_22cd3d64fdb05892() || is_equal(level.gametype, "wm")) {
        var_9e334397541dca8e = [[ level.var_4eb71f2b8cba5cb ]](var_c5e7fce963586ec0, var_93390a6953905fef, team);
    } else {
        var_9e334397541dca8e = [[ level.var_4eb71f2b8cba5cb ]](var_c5e7fce963586ec0, var_93390a6953905fef, team, poiname);
    }
    if (isdefined(var_9e334397541dca8e)) {
        var_9e334397541dca8e.node.var_c5e7fce963586ec0 = var_c5e7fce963586ec0;
        var_9e334397541dca8e.node.goalradius = goalradius;
        var_9e334397541dca8e.node.var_21f24aecb313e479 = var_21f24aecb313e479;
        if (isdefined(var_6dce075f68546b3)) {
            var_9e334397541dca8e.var_378d6643d1b02a = var_6dce075f68546b3;
        }
        if (!isdefined(groupname)) {
            groupname = function_78759441c259f58a(var_c5e7fce963586ec0, numagents);
        }
        vehicle = level function_acf5238e41722111(var_9e334397541dca8e.node, var_9e334397541dca8e.var_378d6643d1b02a, numagents, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, var_ec862c2c00c7ab5d, var_f891e067b8802c0d, var_ebc42e43f4b05504, nationality, var_96e335eae30651e5);
        if (isdefined(vehicle)) {
            /#
                function_cd8465a96bf94b14(var_9e334397541dca8e.node, vehicle);
            #/
            if (isdefined(level.var_4691a578582af454)) {
                [[ level.var_4691a578582af454 ]](vehicle);
            }
            return vehicle.riders;
        }
    }
    return undefined;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1819
// Size: 0x8c
function function_173e2a87c2a19acc(riders, var_3ec0ce479098af29) {
    var_bafef05479604422 = [0:"little_bird", 1:"veh9_blima"];
    if (isdefined(var_3ec0ce479098af29) && var_3ec0ce479098af29 != "") {
        var_bafef05479604422 = var_3ec0ce479098af29;
        if (!isarray(var_3ec0ce479098af29)) {
            var_bafef05479604422 = [0:var_3ec0ce479098af29];
        }
    }
    if (isdefined(riders)) {
        if (riders > 6) {
            var_bafef05479604422 = array_remove(var_bafef05479604422, "little_bird");
        }
        if (riders > 6) {
            var_bafef05479604422 = array_remove(var_bafef05479604422, "veh9_blima");
        }
    }
    return random(var_bafef05479604422);
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ad
// Size: 0x1b
function function_bd28fa0797f4d5ec() {
    self endon("death");
    self waittill("pushplayerchanged");
    self pushplayer(1);
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18cf
// Size: 0x7a3
function function_acf5238e41722111(var_a4e4a71852a83d8f, var_378d6643d1b02a, var_c0001a6c73106ee1, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, var_ec862c2c00c7ab5d, var_f891e067b8802c0d, var_ebc42e43f4b05504, nationality, var_96e335eae30651e5) {
    heli_type = function_173e2a87c2a19acc(var_c0001a6c73106ee1, var_378d6643d1b02a);
    if (isdefined(var_378d6643d1b02a) && var_378d6643d1b02a != "") {
        heli_type = var_378d6643d1b02a;
    }
    if (!isdefined(var_c0001a6c73106ee1)) {
        var_c0001a6c73106ee1 = 6;
    }
    if (!isdefined(var_f891e067b8802c0d)) {
        var_f891e067b8802c0d = 0;
    }
    var_a3affcf53bb2d1f8 = undefined;
    var_86b5af97e6866b13 = undefined;
    var_f0147bb7ad8e1a6c = 10000;
    newval = getdvarint(@"hash_45680b15d7117402", 0);
    if (newval) {
        var_f0147bb7ad8e1a6c = newval;
    }
    var_a13c822ae90e7c51 = 8000;
    newval = getdvarint(@"hash_7b5759d6bf7c3b73", 0);
    if (newval) {
        var_a13c822ae90e7c51 = newval;
    }
    orig_origin = undefined;
    if (isdefined(var_a4e4a71852a83d8f.var_4583939a603f7170)) {
        orig_origin = var_a4e4a71852a83d8f.origin;
        var_d4f8974f990de095 = var_a4e4a71852a83d8f.origin - var_a4e4a71852a83d8f.var_4583939a603f7170;
        var_d4f8974f990de095 = vectornormalize(var_d4f8974f990de095);
        var_a4e4a71852a83d8f.origin = var_a4e4a71852a83d8f.var_4583939a603f7170 + var_d4f8974f990de095 * var_a13c822ae90e7c51;
        var_a4e4a71852a83d8f.origin = var_a4e4a71852a83d8f.origin + (0, 0, var_f0147bb7ad8e1a6c);
    }
    seatindex = 0;
    if (isdefined(heli_type)) {
        switch (heli_type) {
        case #"hash_835a3b4bb4e34233":
            seatindex = 2;
            var_c0001a6c73106ee1 = var_c0001a6c73106ee1 + 2;
            break;
        case #"hash_9d4e22a00fc630b5":
            seatindex = 2;
            break;
        default:
            break;
        }
    }
    if (isdefined(var_a4e4a71852a83d8f.spawngroup)) {
        spawngroup = var_a4e4a71852a83d8f.spawngroup;
        poiname = var_a4e4a71852a83d8f.poi;
        if (!isdefined(poiname)) {
            if (isdefined(var_a4e4a71852a83d8f.var_4583939a603f7170)) {
                var_3a6b42ab825a103e = var_a4e4a71852a83d8f.var_4583939a603f7170;
            } else {
                var_3a6b42ab825a103e = var_a4e4a71852a83d8f.origin;
            }
            poiname = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(var_3a6b42ab825a103e);
            var_a4e4a71852a83d8f.poi = poiname;
        }
        logstring("Heli reinforcement spawn: " + var_c0001a6c73106ee1 + " AI at " + var_a4e4a71852a83d8f.origin);
        spawners = function_b276f0690ce15746(heli_type, var_c0001a6c73106ee1, var_a4e4a71852a83d8f.origin, var_a4e4a71852a83d8f.poi, priority, var_ec862c2c00c7ab5d, category, team, nationality, var_96e335eae30651e5);
        riders = [];
        var_b5424ebe989b94b4 = 0;
        foreach (spawner in spawners) {
            spawner.script_demeanor = undefined;
            rider = ai_mp_requestspawnagent(spawner.aitype, spawner.origin, spawner.angles, priority, category, subcategory, groupname, team, var_a4e4a71852a83d8f.var_c5e7fce963586ec0, var_a4e4a71852a83d8f.poi, var_f891e067b8802c0d, undefined, 0);
            if (isdefined(rider)) {
                rider thread function_bd28fa0797f4d5ec();
                if (heli_type == "veh9_blima" && !istrue(var_b5424ebe989b94b4) && var_c0001a6c73106ee1 <= 4) {
                    rider.script_startingposition = 5;
                    var_b5424ebe989b94b4 = 1;
                } else if (isdefined(spawner.script_startingposition)) {
                    rider.script_startingposition = int(spawner.script_startingposition);
                } else {
                    rider.script_startingposition = seatindex;
                    seatindex++;
                }
                rider.vehicle_position = rider.script_startingposition;
                riders[riders.size] = rider;
                rider thread function_e7d3411db935e99b(int(rider.script_startingposition));
            }
            waitframe();
        }
        if (riders.size) {
            spawndata = spawnstruct();
            spawndata.origin = var_a4e4a71852a83d8f.origin;
            spawndata.angles = var_a4e4a71852a83d8f.angles;
            spawndata.team = team;
            spawndata.var_f16652e1462a3739 = 1;
            var_14cde247ac3313a4 = function_4a64c621dd8090ab(heli_type, riders, nationality);
            if (isdefined(var_14cde247ac3313a4)) {
                spawndata.var_14cde247ac3313a4 = var_14cde247ac3313a4;
            }
            vehicle = vehicle_spawn(heli_type, spawndata);
            if (!isdefined(vehicle)) {
                foreach (rider in riders) {
                    namespace_14d36171baccf528::agentpers_setagentpersdata(rider, "skipDeathCount", 1);
                    rider kill();
                }
                return;
            }
            vehicle namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(vehicle);
            vehicle function_247ad6a91f6a4ffe(1);
            vehicle vehphys_forcekeyframedmotion();
            vehicle namespace_141c4634b6ea7b27::function_5c097a8f16a227d5(0);
            if (isdefined(orig_origin)) {
                var_a4e4a71852a83d8f.origin = orig_origin;
            }
            vehicle.poi = var_a4e4a71852a83d8f.poi;
            vehicle endon("death");
            function_7045fb761a4998e3(vehicle);
            vehicle function_f92faaaf5c5077c6(riders, 1, 1);
            foreach (rider in riders) {
                var_9fb566418340eedd = var_a4e4a71852a83d8f.var_c5e7fce963586ec0;
                if (!isdefined(var_9fb566418340eedd)) {
                    var_9fb566418340eedd = function_a130de01f9e62aa4(var_a4e4a71852a83d8f.var_4583939a603f7170);
                }
                if (rider function_bb0826e06fc68038(heli_type)) {
                    namespace_14d36171baccf528::agentpers_setagentpersdata(rider, "skipDeathCount", 1);
                    rider.ignoreme = 1;
                }
            }
            wait(1);
            foreach (rider in riders) {
                namespace_bfef6903bca5845d::function_caf96a86ca85140f(rider);
            }
            if (heli_type == "veh9_blima") {
                vehicle.var_7b349dc60a25d9fe = 1;
            }
            level thread function_bbfeb6cfdbc102a1(vehicle, var_a4e4a71852a83d8f, heli_type, var_ebc42e43f4b05504);
            return vehicle;
        } else {
            if (isdefined(orig_origin)) {
                var_a4e4a71852a83d8f.origin = orig_origin;
            }
            function_e1310878ab1f5e7c(var_a4e4a71852a83d8f);
            return undefined;
        }
    } else {
        spawndata = spawnstruct();
        spawndata.origin = var_a4e4a71852a83d8f.origin;
        spawndata.angles = var_a4e4a71852a83d8f.angles;
        spawndata.team = team;
        spawndata.var_f16652e1462a3739 = 1;
        vehicle = vehicle_spawn(heli_type, spawndata);
        if (isdefined(vehicle)) {
            vehicle namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(vehicle);
            vehicle function_247ad6a91f6a4ffe(1);
            vehicle vehphys_forcekeyframedmotion();
        }
        if (isdefined(orig_origin)) {
            var_a4e4a71852a83d8f.origin = orig_origin;
        }
        function_e1310878ab1f5e7c(var_a4e4a71852a83d8f);
        return vehicle;
    }
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2079
// Size: 0x408
function function_bbfeb6cfdbc102a1(vehicle, var_a4e4a71852a83d8f, heli_type, var_ebc42e43f4b05504) {
    vehicle thread function_88982797150bf237(vehicle, var_a4e4a71852a83d8f, var_ebc42e43f4b05504);
    var_7b02a0c55eeddf9 = 0;
    var_516e3bab99fe629e = undefined;
    var_4f922af45d0cac6c = undefined;
    poiname = undefined;
    if (function_47d356083884f913()) {
        poiname = function_6cc445c02b5effac(var_a4e4a71852a83d8f.var_4583939a603f7170);
        var_4f922af45d0cac6c = sortbydistance(level.poi[poiname]["heliReinforceStruct"].var_4f922af45d0cac6c, var_a4e4a71852a83d8f.var_4583939a603f7170);
    } else {
        var_4f922af45d0cac6c = sortbydistance(level.helireinforcestruct.var_4f922af45d0cac6c, var_a4e4a71852a83d8f.var_4583939a603f7170);
    }
    if (!function_3e4b3c31abee91e7(heli_type)) {
        var_516e3bab99fe629e = function_88b89f0f153d496(var_a4e4a71852a83d8f, var_a4e4a71852a83d8f.var_2770af6f8cecfc40);
    } else {
        var_516e3bab99fe629e = var_a4e4a71852a83d8f.var_2770af6f8cecfc40;
    }
    if (!isdefined(var_516e3bab99fe629e)) {
        function_e1310878ab1f5e7c(var_a4e4a71852a83d8f);
        namespace_1f188a13f7e79610::vehicle_death(vehicle);
        msg = "We didn't find an unload location for: " + function_53c4c53197386572(poiname, "Undefined POI Name") + " at location: " + function_53c4c53197386572(var_a4e4a71852a83d8f.var_4583939a603f7170, "Undefined Unload Origin");
        /#
            assertmsg(msg);
        #/
        _ = undefined == msg;
        return;
    }
    vehicle namespace_141c4634b6ea7b27::function_5c097a8f16a227d5(1);
    vehicle thread function_e92bac7b0b067a7b(var_a4e4a71852a83d8f.var_4583939a603f7170, heli_type);
    if (istrue(vehicle.var_7b349dc60a25d9fe)) {
        node = var_516e3bab99fe629e;
        vehicle.currentnode = node;
        ground_pos = drop_to_ground(node.origin, 100, -1000);
        scenenode = spawnstruct();
        scenenode.origin = ground_pos;
        scenenode.angles = node.angles;
        vehicle.scenenode = scenenode;
        animation = level.vehicle.templates.aianims[vehicle namespace_b479ac682b93cd92::get_vehicle_classname()][0].vehicle_getoutanim;
        var_b48c995a0a557ff1 = getstartorigin(scenenode.origin, scenenode.angles, animation);
        newangles = getstartangles(scenenode.origin, scenenode.angles, animation);
        vehicle vehicle_teleport(var_b48c995a0a557ff1, newangles);
        vehicle dontinterpolate();
        vehicle namespace_3bb9da687f15383d::unload_node(node);
    } else if (isdefined(var_516e3bab99fe629e) && !isdefined(var_a4e4a71852a83d8f.var_79fa6bd3c9bf6a0d)) {
        if (vehicle namespace_dbbb37eb352edf96::ishelicopter()) {
            vehicle vehphys_setdefaultmotion();
            vehicle namespace_3bb9da687f15383d::vehicle_paths_helicopter(var_516e3bab99fe629e);
            goto LOC_00000300;
        }
    LOC_00000300:
    }
LOC_00000300:
    vehicle.unloaded = 1;
    if (isdefined(vehicle.currentnode) && isdefined(vehicle.currentnode.target)) {
        var_7b02a0c55eeddf9 = 1;
    }
    if (isdefined(var_a4e4a71852a83d8f.var_5abe2c141f995fb2)) {
        vehicle.var_5abe2c141f995fb2 = 1;
    }
    if (!var_7b02a0c55eeddf9) {
        vehicle function_fc805ec1e7b08264(vehicle.currentnode);
    }
    /#
        if (getdvarint(@"hash_691520ae38c53622", 0) != 0) {
            vehicle.maxhealth = getdvarint(@"hash_691520ae38c53622");
            vehicle.health = vehicle.maxhealth;
        }
    #/
    if (isdefined(var_a4e4a71852a83d8f.var_72772fa651ecbe2b) && isdefined(level.var_a8dc22c62ba69b88[var_a4e4a71852a83d8f.var_72772fa651ecbe2b])) {
        vehicle thread [[ level.var_a8dc22c62ba69b88[var_a4e4a71852a83d8f.var_72772fa651ecbe2b] ]]();
    }
    function_e1310878ab1f5e7c(var_a4e4a71852a83d8f);
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2488
// Size: 0x199
function function_88b89f0f153d496(var_a4e4a71852a83d8f, var_7dce14fb8eae79c2) {
    end = 3;
    var_104668542102dc3c = var_7dce14fb8eae79c2;
    var_dd58d7d9a9ab6f6a = [];
    var_dd58d7d9a9ab6f6a[0] = var_104668542102dc3c;
    for (i = 0; i < end; i++) {
        var_104668542102dc3c = var_dd58d7d9a9ab6f6a[i];
        var_104668542102dc3c.script_goalyaw = 1;
        var_9a47afbb4ca34dbc = spawnstruct();
        var_dd58d7d9a9ab6f6a[i + 1] = var_9a47afbb4ca34dbc;
        if (i == 0) {
            var_42bd6a036ccc9714 = 1000;
            magnitude = 1000;
            var_9a47afbb4ca34dbc.speed = 10;
            offset = function_3bd98e79a697ce64(var_a4e4a71852a83d8f, var_104668542102dc3c, var_42bd6a036ccc9714, magnitude);
        } else if (i == 1) {
            var_42bd6a036ccc9714 = 0;
            magnitude = 750;
            var_9a47afbb4ca34dbc.speed = 25;
            offset = function_3bd98e79a697ce64(var_a4e4a71852a83d8f, var_104668542102dc3c, var_42bd6a036ccc9714, magnitude);
        } else {
            var_42bd6a036ccc9714 = 0;
            magnitude = 500;
            var_9a47afbb4ca34dbc.speed = var_a4e4a71852a83d8f.speed;
            var_9a47afbb4ca34dbc.script_stopnode = 1;
            var_9a47afbb4ca34dbc.radius = 100;
            offset = function_3bd98e79a697ce64(var_a4e4a71852a83d8f, var_104668542102dc3c, var_42bd6a036ccc9714, magnitude);
        }
        var_9a47afbb4ca34dbc.origin = var_104668542102dc3c.origin + offset;
        var_9a47afbb4ca34dbc.angles = var_104668542102dc3c.angles;
        var_9a47afbb4ca34dbc.radius = 500;
        var_9a47afbb4ca34dbc.target = var_104668542102dc3c;
    }
    return var_dd58d7d9a9ab6f6a[var_dd58d7d9a9ab6f6a.size - 1];
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2629
// Size: 0x68
function function_3bd98e79a697ce64(start_node, end_node, var_8847a8b73dd41819, mag) {
    var_bfd00490746e4860 = start_node.origin - end_node.origin;
    offset = vectornormalize(var_bfd00490746e4860);
    offset = offset * mag;
    offset = (offset[0], offset[1], var_8847a8b73dd41819);
    return offset;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2699
// Size: 0xcb
function function_e92bac7b0b067a7b(var_4583939a603f7170, helitype) {
    self endon("death");
    if (istrue(level.var_b4c49b42d82621c9)) {
        return;
    }
    pos = getgroundposition(var_4583939a603f7170, 1, 1000, 0);
    dist = 500;
    dist_sq = dist * dist;
    while (distance2dsquared(var_4583939a603f7170, self.origin) > dist_sq) {
        wait(0.1);
    }
    if (isdefined(helitype)) {
        if (function_3e4b3c31abee91e7(helitype)) {
            wait(6);
        } else {
            wait(1);
        }
    } else {
        wait(8);
    }
    magicgrenademanual("smoke_grenade_mp", pos, (0, 0, -10), 0.5);
    thread play_sound_in_space("smoke_grenade_expl_trans", self.origin);
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x276b
// Size: 0x33
function function_3e4b3c31abee91e7(heli_type) {
    switch (heli_type) {
    case #"hash_835a3b4bb4e34233":
        return 1;
    case #"hash_9d4e22a00fc630b5":
        return 0;
        break;
    }
    return 0;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27a6
// Size: 0x52
function function_bb0826e06fc68038(helitype) {
    switch (helitype) {
    case #"hash_835a3b4bb4e34233":
        jumpiffalse(self.vehicle_position == 5 || self.vehicle_position == 6) LOC_00000032;
        return 1;
    case #"hash_9d4e22a00fc630b5":
    LOC_00000032:
        return 0;
        break;
    }
    return 0;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2800
// Size: 0x1b5
function function_fc805ec1e7b08264(pathnode) {
    self endon("death");
    var_61bec49fd0ba66b6 = function_757672b5f0cde59a(pathnode);
    if (!isdefined(var_61bec49fd0ba66b6)) {
        var_61bec49fd0ba66b6 = undefined;
        if (function_47d356083884f913()) {
            poiname = function_6cc445c02b5effac(pathnode.origin);
            var_61bec49fd0ba66b6 = random(level.poi[poiname]["heliReinforceStruct"].var_144fd45f9438fc65);
        }
        if (!isdefined(var_61bec49fd0ba66b6)) {
            var_61bec49fd0ba66b6 = random(level.var_3122f605f0e8e125);
        }
    }
    ground_pos = getgroundposition(self.origin, 1);
    if (distancesquared(self.origin, ground_pos) <= 1000000) {
        offset = function_3bd98e79a697ce64(var_61bec49fd0ba66b6, self, 1000, 1000);
        var_7b02a0c55eeddf9 = spawnstruct();
        var_7b02a0c55eeddf9.origin = ground_pos + offset;
        var_7b02a0c55eeddf9.angles = pathnode.angles;
        var_7b02a0c55eeddf9.radius = 512;
        self.var_918c5a31037e00ee = spawnstruct();
        self.var_918c5a31037e00ee.speed = 85;
        self vehphys_setdefaultmotion();
        namespace_3bb9da687f15383d::vehicle_paths_helicopter(var_7b02a0c55eeddf9);
    }
    self.end_point = var_61bec49fd0ba66b6;
    path_start = var_61bec49fd0ba66b6;
    path_start.radius = 1000;
    self.var_918c5a31037e00ee = spawnstruct();
    self.var_918c5a31037e00ee.speed = 85;
    self function_247ad6a91f6a4ffe(0);
    self.var_6df468049c1f41dc = 1;
    thread namespace_3bb9da687f15383d::vehicle_paths_helicopter(path_start);
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29bc
// Size: 0x14f
function function_757672b5f0cde59a(pathnode) {
    if (!isdefined(pathnode)) {
        return;
    }
    if (isdefined(pathnode.exit_node)) {
        return pathnode.exit_node;
    }
    org = pathnode.origin;
    var_c4f26c1e0080bd7c = pathnode.angles;
    var_2b008b868cc6c2f7 = undefined;
    if (function_47d356083884f913()) {
        poiname = function_6cc445c02b5effac(org);
        var_2b008b868cc6c2f7 = level.poi[poiname]["heliReinforceStruct"].var_144fd45f9438fc65;
    } else {
        var_2b008b868cc6c2f7 = level.var_3122f605f0e8e125;
    }
    best_dot = -5;
    var_14bb0bb2b7d418d7 = undefined;
    var_8631092c00d598f5 = get_array_of_closest(org, var_2b008b868cc6c2f7);
    foreach (struct in var_8631092c00d598f5) {
        dot = math::get_dot(org, var_c4f26c1e0080bd7c, struct.origin);
        if (dot > best_dot) {
            best_dot = dot;
            var_14bb0bb2b7d418d7 = struct;
        }
    }
    return var_14bb0bb2b7d418d7;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b13
// Size: 0x33d
function function_b276f0690ce15746(heli_type, var_4af808cb9330a11a, origin, poiname, priority, var_ec862c2c00c7ab5d, category, team, nationality, var_96e335eae30651e5) {
    var_e4353165dd6de45e = ter_op(isdefined(level.var_f0872e42daf6d4d5), level.var_f0872e42daf6d4d5, origin);
    var_ca38685e5bf373f4 = (0, 0, 0);
    var_1250f27c957fec = 7;
    switch (heli_type) {
    case #"hash_835a3b4bb4e34233":
        var_1250f27c957fec = 8;
        break;
    case #"hash_9d4e22a00fc630b5":
        var_1250f27c957fec = 6;
        break;
    default:
        break;
    }
    if (var_4af808cb9330a11a > var_1250f27c957fec) {
        var_4af808cb9330a11a = var_1250f27c957fec;
    }
    riders = [];
    if (!isdefined(category)) {
        category = "reinforcements";
    }
    var_644d90de7685f75 = function_8c6dbb64c8e1603c(var_4af808cb9330a11a, category, origin, poiname, 0);
    if (!var_644d90de7685f75 && !namespace_bfef6903bca5845d::function_359f24553bdcca92(var_4af808cb9330a11a, priority)) {
        /#
            msg = "<unknown string>" + var_4af808cb9330a11a + "<unknown string>";
            println(msg);
        #/
        return riders;
    }
    if (isdefined(var_ec862c2c00c7ab5d)) {
        for (i = 0; i < var_4af808cb9330a11a; i++) {
            riders[i] = spawnstruct();
            riders[i].origin = var_e4353165dd6de45e;
            riders[i].angles = var_ca38685e5bf373f4;
            if (!isdefined(nationality)) {
                nationality = undefined;
                if (isdefined(level.var_72f834b3f8b2a366) && isdefined(level.var_72f834b3f8b2a366[team])) {
                    nationality = level.var_72f834b3f8b2a366[team];
                }
            }
            if (isdefined(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i])) {
                riders[i].aitype = function_7f1a2e2ebe0c1693(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i].type, function_53c4c53197386572(var_96e335eae30651e5, var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i].tier), function_53c4c53197386572(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i].nationality, nationality));
            } else if (var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f.size) {
                riders[i].aitype = function_7f1a2e2ebe0c1693(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[0].type, function_53c4c53197386572(var_96e335eae30651e5, var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[0].tier), function_53c4c53197386572(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[0].nationality, nationality));
            } else {
                aitype = function_d5bc07eabf352abb(undefined, poiname, undefined, undefined, var_96e335eae30651e5);
            }
        }
    } else {
        for (i = 0; i < var_4af808cb9330a11a; i++) {
            aitype = function_d5bc07eabf352abb(undefined, poiname, undefined, undefined, var_96e335eae30651e5, nationality);
            riders[i] = spawnstruct();
            riders[i].origin = var_e4353165dd6de45e;
            riders[i].angles = var_ca38685e5bf373f4;
            riders[i].aitype = aitype;
        }
    }
    return riders;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e58
// Size: 0x141
function function_7045fb761a4998e3(vehicle) {
    var_2a94a31f5c16a229 = [0:"aq_pilot_fullbody_1", 1:"aq_pilot_fullbody_2"];
    var_c2a106d998c9f3be = 2;
    if (!isdefined(level.ai_spawn_vehicle_func)) {
        level.ai_spawn_vehicle_func = [];
    }
    if (!isdefined(level.vehicle_ai_script_models)) {
        level.vehicle_ai_script_models = [];
    }
    var_166c0f7056edb681 = [];
    for (i = 0; i < var_c2a106d998c9f3be; i++) {
        struct = level.vehicle.templates.aianims[function_29b4292c92443328(vehicle function_d93ec4635290febd()).ai.classname][i];
        tag = struct.sittag;
        var_514d9e806d48b808 = vehicle function_97dc419ef1552c44(i, tag, struct.idle_anim, struct.idle, var_2a94a31f5c16a229[i]);
        var_166c0f7056edb681[var_166c0f7056edb681.size] = var_514d9e806d48b808;
        level.vehicle_ai_script_models[level.vehicle_ai_script_models.size] = var_514d9e806d48b808;
        vehicle thread function_c69ae9cd7a024f7a(var_166c0f7056edb681);
    }
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fa0
// Size: 0x3c
function function_c69ae9cd7a024f7a(var_166c0f7056edb681) {
    self waittill("death");
    if (isdefined(var_166c0f7056edb681)) {
        for (i = 0; i < var_166c0f7056edb681.size; i++) {
            var_166c0f7056edb681[i] function_3a1b698f5e1a66da();
        }
    }
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fe3
// Size: 0x3b
function function_3a1b698f5e1a66da() {
    if (array_contains(level.vehicle_ai_script_models, self)) {
        level.vehicle_ai_script_models = array_remove(level.vehicle_ai_script_models, self);
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3025
// Size: 0x13d
function function_97dc419ef1552c44(var_dcef536353ea980b, tag, animname, xanim, model) {
    /#
        assertex(!istrue(self.usedpositions[var_dcef536353ea980b]), "Trying to assign to a position already in use");
    #/
    var_2626560098d08682 = self gettagorigin(tag);
    var_b7850001037aa074 = self gettagangles(tag);
    startorg = getstartorigin(var_2626560098d08682, var_b7850001037aa074, xanim);
    startangles = getstartangles(var_2626560098d08682, var_b7850001037aa074, xanim);
    spawned = spawn("script_model", startorg);
    spawned.angles = startangles;
    spawned setmodel(model);
    spawned linkto(self);
    if (isdefined(animname)) {
        spawned scriptmodelplayanim(animname);
    } else if (isdefined(xanim)) {
        spawned scriptmodelplayanim(xanim);
    }
    spawned.vehicle_position = var_dcef536353ea980b;
    spawned.disable_gun_recall = 1;
    self.attachedguys[self.attachedguys.size] = spawned;
    self.usedpositions[var_dcef536353ea980b] = 1;
    if (var_dcef536353ea980b == 0) {
        self.driver = spawned;
    }
    return spawned;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x316a
// Size: 0x1cd
function function_369da33099abb357(var_c2f1ca305ee16808) {
    self endon("death");
    var_c2f1ca305ee16808 endon("death");
    if (!isdefined(self) || !isdefined(var_c2f1ca305ee16808)) {
        return;
    }
    var_4116e8fd5da7b698 = 250;
    while (1) {
        point = unused = attacker = amount = self waittill("damage");
        if (isdefined(attacker) && isplayer(attacker) && isdefined(amount) && amount > 0 && isdefined(point)) {
            if (var_c2f1ca305ee16808 tagexists("j_head")) {
                head_pos = var_c2f1ca305ee16808 gettagorigin("j_head");
            } else {
                head_pos = var_c2f1ca305ee16808.origin + (0, 0, 50);
            }
            head_pos = head_pos + (0, 0, -20);
            start_point = attacker geteye();
            var_de2dc247cdcb29a = vectornormalize(point - start_point);
            var_16577d6cd42ab23c = vectornormalize(head_pos - start_point);
            var_f22fd5f94653ccb6 = vectordot(var_de2dc247cdcb29a, var_16577d6cd42ab23c);
            var_7b3aa6febd7b23a0 = vectordot(vectornormalize(anglestoforward(self.angles)), vectornormalize(point - self.origin));
            seat_pos = var_c2f1ca305ee16808.origin + (0, 0, 18);
            if (var_f22fd5f94653ccb6 > 0.99975 && var_7b3aa6febd7b23a0 > 0.73 && point[2] > seat_pos[2]) {
                var_4116e8fd5da7b698 = var_4116e8fd5da7b698 - amount;
                if (var_4116e8fd5da7b698 <= 0) {
                    self notify("death", attacker);
                }
            }
        }
    }
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x333e
// Size: 0x2a
function function_e7d3411db935e99b(pos) {
    self endon("death");
    wait(2);
    self.vehicle_position = pos;
    self.script_startingposition = pos;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x336f
// Size: 0x1d7
function function_88982797150bf237(vehicle, var_a4e4a71852a83d8f, var_ebc42e43f4b05504) {
    vehicle endon("death");
    riders = vehicle.riders;
    if (!istrue(var_ebc42e43f4b05504) && isdefined(var_a4e4a71852a83d8f.var_c5e7fce963586ec0)) {
        foreach (rider in riders) {
            namespace_2000a83505151e5b::function_bd9acc7c99ad884(rider, var_a4e4a71852a83d8f.var_c5e7fce963586ec0, undefined, var_a4e4a71852a83d8f.goalradius, var_a4e4a71852a83d8f.var_21f24aecb313e479, 0, riders);
        }
    }
    vehicle waittill("unloaded");
    var_c5e7fce963586ec0 = var_a4e4a71852a83d8f.var_c5e7fce963586ec0;
    if (!isdefined(var_c5e7fce963586ec0)) {
        var_c5e7fce963586ec0 = function_a130de01f9e62aa4(vehicle.origin);
    }
    wait(1);
    foreach (rider in riders) {
        if (!istrue(var_ebc42e43f4b05504)) {
            /#
                assertex(distance(var_a4e4a71852a83d8f.var_c5e7fce963586ec0, rider.origin) < 12500, "heli_postUnload: combat rush (" + var_c5e7fce963586ec0 + ") is too far from where the agents were dropped off (" + rider.origin + ")");
            #/
            rider thread namespace_2000a83505151e5b::function_a5117518725da028(rider, var_c5e7fce963586ec0, undefined, var_a4e4a71852a83d8f.goalradius, var_a4e4a71852a83d8f.var_21f24aecb313e479, 0, riders);
        }
        if (isdefined(rider.var_b582b10663b5b2a9) && !rider.var_b582b10663b5b2a9) {
            continue;
        }
        rider thread function_e42f5ec55b8546b();
    }
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x354d
// Size: 0x18
function function_e42f5ec55b8546b() {
    self endon("death");
    wait(10);
    self.var_b582b10663b5b2a9 = 1;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x356c
// Size: 0x1eb
function function_a130de01f9e62aa4(origin, var_fbb99cd7fa27e8b4) {
    if (level.helireinforcestruct.var_c9464c89a69010e2.size == 0) {
        radius = 1000;
        var_c154e6e386654a30 = 50;
        min = radius - var_c154e6e386654a30;
        max = radius + var_c154e6e386654a30;
        var_bcfec646853a95c1 = randomfloatrange(min, max) * namespace_3c37cb17ade254d::ter_op(randomint(100) > 50, 1, -1);
        var_bcfec546853a938e = randomfloatrange(min, max) * namespace_3c37cb17ade254d::ter_op(randomint(100) > 50, 1, -1);
        var_28545e194202f384 = (origin[0] + var_bcfec646853a95c1, origin[1] + var_bcfec546853a938e, origin[2]);
        return getclosestpointonnavmesh(var_28545e194202f384);
    }
    var_260a7567900f4224 = [];
    var_d6eb01b1dc33ffdc = undefined;
    closestdist = 2500000000;
    maxdist = ter_op(isdefined(var_fbb99cd7fa27e8b4), var_fbb99cd7fa27e8b4, 12250000);
    foreach (node in level.helireinforcestruct.var_c9464c89a69010e2) {
        dist = distance2dsquared(origin, node.origin);
        if (!isdefined(var_d6eb01b1dc33ffdc) || closestdist > dist) {
            var_d6eb01b1dc33ffdc = node;
            closestdist = dist;
        }
        if (dist < maxdist) {
            var_260a7567900f4224[var_260a7567900f4224.size] = node;
        }
    }
    if (var_260a7567900f4224.size > 0) {
        return getclosestpointonnavmesh(random(var_260a7567900f4224).origin);
    } else {
        return getclosestpointonnavmesh(var_d6eb01b1dc33ffdc.origin);
    }
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x375e
// Size: 0x9d
function function_16c5ca10b4c664a7(nodes, override) {
    if (istrue(override)) {
        level.helireinforcestruct.var_c9464c89a69010e2 = [];
    }
    foreach (node in nodes) {
        level.helireinforcestruct.var_c9464c89a69010e2[level.helireinforcestruct.var_c9464c89a69010e2.size] = node;
    }
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3802
// Size: 0x16
function function_bf8ab11dd9e76f93(function) {
    level.var_4eb71f2b8cba5cb = function;
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x381f
// Size: 0x59
function function_4a64c621dd8090ab(heli_type, riders, nationality) {
    if (heli_type == "little_bird") {
        if (isdefined(nationality)) {
            if (nationality == "merc" || nationality == "ru") {
                return "black";
            } else if (nationality == "cartel") {
                return "yellow";
            }
        }
    }
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x387f
// Size: 0x17c
function function_cd8465a96bf94b14(var_a4e4a71852a83d8f, vehicle) {
    /#
        if (getdvarint(@"hash_cc62b45cdbe0ddc1", 0) == 1) {
            thread namespace_d028276791d9cff6::drawsphere(var_a4e4a71852a83d8f.origin, 128, 45, (1, 0, 0));
            thread namespace_d028276791d9cff6::drawsphere(var_a4e4a71852a83d8f.var_4583939a603f7170, 128, 45, (0, 1, 0));
            thread namespace_d028276791d9cff6::drawsphere(var_a4e4a71852a83d8f.var_c5e7fce963586ec0, 128, 45, (0, 0, 1));
            if (isdefined(var_a4e4a71852a83d8f.origin) && isdefined(var_a4e4a71852a83d8f.var_4583939a603f7170)) {
                thread namespace_f2ffc0540883e1ad::drawline(var_a4e4a71852a83d8f.origin, var_a4e4a71852a83d8f.var_4583939a603f7170, 45, (1, 0, 0));
            }
            if (isdefined(vehicle.origin) && isdefined(var_a4e4a71852a83d8f.var_4583939a603f7170)) {
                thread namespace_f2ffc0540883e1ad::drawline(vehicle.origin, var_a4e4a71852a83d8f.var_4583939a603f7170, 45, (0, 1, 0));
            }
            if (isdefined(var_a4e4a71852a83d8f.var_4583939a603f7170) && isdefined(var_a4e4a71852a83d8f.var_c5e7fce963586ec0)) {
                thread namespace_f2ffc0540883e1ad::drawline(var_a4e4a71852a83d8f.var_4583939a603f7170, var_a4e4a71852a83d8f.var_c5e7fce963586ec0, 45, (0, 0, 1));
            }
        }
    #/
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a02
// Size: 0x57b
function function_d3d8ae54f1db925() {
    /#
        while (1) {
            if (getdvarint(@"hash_44d7ef19e2c9454e", 0) == 1) {
                if (function_47d356083884f913()) {
                    foreach (poiname, poi in level.poi) {
                        foreach (node in level.poi[poiname]["<unknown string>"].var_c4677fcd658fc8e7) {
                            thread namespace_d028276791d9cff6::drawsphere(node.origin, 64, 1, (0, 1, 0));
                            print3d(node.origin, poiname, (0, 1, 0), 1, 1, 20);
                        }
                        foreach (node in level.poi[poiname]["<unknown string>"].var_4f922af45d0cac6c) {
                            thread namespace_d028276791d9cff6::drawsphere(node.origin, 64, 1, (1, 1, 0.3));
                            print3d(node.origin, poiname, (1, 1, 0.3), 1, 1, 20);
                        }
                        foreach (node in level.poi[poiname]["<unknown string>"].var_144fd45f9438fc65) {
                            thread namespace_d028276791d9cff6::drawsphere(node.origin, 64, 1, (1, 0, 0));
                            print3d(node.origin, poiname, (1, 0, 0), 1, 1, 20);
                        }
                    }
                } else {
                    foreach (i, node in level.helireinforcestruct.var_c4677fcd658fc8e7) {
                        thread namespace_d028276791d9cff6::drawsphere(node.origin, 64, 1, (0, 1, 0));
                        print3d(node.origin, i, (1, 1, 1), 1, 3, 1000, 1);
                    }
                    foreach (i, node in level.helireinforcestruct.var_4f922af45d0cac6c) {
                        thread namespace_d028276791d9cff6::drawsphere(node.origin, 64, 1, (1, 1, 0.3));
                        print3d(node.origin, i, (1, 1, 1), 1, 3, 1000, 1);
                    }
                    foreach (i, node in level.var_3122f605f0e8e125) {
                        thread namespace_d028276791d9cff6::drawsphere(node.origin, 64, 1, (1, 0, 0));
                        print3d(node.origin, i, (1, 1, 1), 1, 3, 1000, 1);
                    }
                }
            }
            if (getdvarint(@"hash_83158ef84a03a108", 0) == 1) {
                if (function_47d356083884f913()) {
                    foreach (poiname, poi in level.poi) {
                        foreach (dest in level.poi[poiname]["<unknown string>"].var_c9464c89a69010e2) {
                            thread namespace_d028276791d9cff6::drawsphere(dest.origin, 64, 1, (1, 0, 1));
                        }
                    }
                } else {
                    foreach (node in level.helireinforcestruct.var_c9464c89a69010e2) {
                        thread namespace_d028276791d9cff6::drawsphere(node.origin, 64, 1, (1, 0, 1));
                    }
                }
            }
            wait(1);
        }
    #/
}

// Namespace namespace_f3747e64a39c0f46/namespace_7ae25d9e5d5a28ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f84
// Size: 0x5f
function function_6bbc2202f6cb024d() {
    /#
        var_3a72705e2ea7e159 = 1;
        while (1) {
            if (getdvarint(@"hash_31aabcc3ae1ae28b", 0) == 1) {
                if (var_3a72705e2ea7e159) {
                    var_3a72705e2ea7e159 = 0;
                    level thread namespace_7ae25d9e5d5a28ef::function_8062c7f3856760fc();
                }
            } else {
                level notify("<unknown string>");
                level.var_85e83f382aedc103 = undefined;
                var_3a72705e2ea7e159 = 1;
            }
            wait(0.1);
        }
    #/
}

