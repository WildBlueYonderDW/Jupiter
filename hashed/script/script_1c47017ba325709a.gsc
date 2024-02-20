// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_48814951e916af89;
#using script_5def7af2a9f04234;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using script_120270bd0a747a35;
#using script_41ba451876d0900c;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_4bac13d511590220;
#using scripts\common\vehicle.gsc;
#using script_24e4405cf93f20ed;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_1c47017ba325709a;

#namespace namespace_3715b32331beba31;

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aa
// Size: 0x1b8
function function_7f4d3080c6e8748b() {
    level.var_ce783fc59ea392d1 = 1;
    /#
        setdvar(@"hash_34414e279fdbc0a1", 0);
    #/
    level.var_fa8b075e623245a7 = getdvarint(@"hash_2ff2c53d8d6e7c01", 30) * 1000;
    level.var_e575d73e8d29994 = getdvarint(@"hash_79b9e1dd01ae9cb7", 0);
    level.var_fcb29aee3f6eab0d = getdvarint(@"hash_9d611e4d54454129", 30);
    level.var_25de264ee4d0e7aa = getdvarint(@"hash_e4be7be05ab1911", 4000);
    /#
        level.var_40e5e944fbbf704e = 1;
    #/
    function_8e34d09c5e2fc0f2();
    /#
        level thread function_9b7d54ce89689d91();
        level thread function_389a8c0032be2508();
    #/
    level.var_e435e1e848664132["veh9_techo_rebel_armor"] = &function_95e274db21433c2b;
    level.var_e435e1e848664132["veh9_overland_2016"] = &function_95e274db21433c2b;
    level.var_e435e1e848664132["veh9_sedan_hatchback_1985"] = &function_95e274db21433c2b;
    level.var_e435e1e848664132["veh9_mil_cargo_truck"] = &function_95e274db21433c2b;
    level.var_e435e1e848664132["veh9_jltv"] = &function_95e274db21433c2b;
    level.var_e435e1e848664132["veh9_jltv_mg"] = &function_95e274db21433c2b;
    level.var_e435e1e848664132["techo_reinforce"] = &function_95e274db21433c2b;
    namespace_f64231d5b7a2c3c4::function_5c8408cb68649308("veh9_techo_rebel_armor", "GROUND_REINFORCE", 6);
    namespace_f64231d5b7a2c3c4::function_5c8408cb68649308("veh9_overland_2016", "GROUND_REINFORCE", 6);
    namespace_f64231d5b7a2c3c4::function_5c8408cb68649308("veh9_sedan_hatchback_1985", "GROUND_REINFORCE", 6);
    namespace_f64231d5b7a2c3c4::function_5c8408cb68649308("veh9_mil_cargo_truck", "GROUND_REINFORCE", 6);
    namespace_f64231d5b7a2c3c4::function_5c8408cb68649308("veh9_jltv", "GROUND_REINFORCE", 6);
    namespace_f64231d5b7a2c3c4::function_5c8408cb68649308("veh9_jltv_mg", "GROUND_REINFORCE", 6);
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x569
// Size: 0x4b5
function function_8e34d09c5e2fc0f2() {
    while (!flag_exist("create_script_initialized")) {
        waitframe();
    }
    flag_wait("create_script_initialized");
    waitframe();
    level.var_b01c03d751886f28 = 0;
    if (getdvarint(@"hash_4a77ef221a7d22a", 0) == 1) {
        return;
    }
    if (namespace_37f0fb6355a4618a::function_47d356083884f913()) {
        while (level.poi.size == 0) {
            waitframe();
        }
        waitframe();
        var_46f73294fb8b410c = getstructarray("ground_reinforce_node", "targetname");
        foreach (var_171f90b9c4c76d44, poi in level.poi) {
            level.poi[var_171f90b9c4c76d44]["groundReinforceStruct"] = spawnstruct();
            level.poi[var_171f90b9c4c76d44]["groundReinforceStruct"].var_e45aa5237f84ce6f = [];
            level.poi[var_171f90b9c4c76d44]["groundReinforceStruct"].var_7afd0cb611ecb973 = [];
            if (istrue(level.var_4cfd75aa6ddde156)) {
                var_b7015a0dbefebce1 = var_46f73294fb8b410c;
            } else {
                var_b7015a0dbefebce1 = namespace_37f0fb6355a4618a::function_9656b61cc8a37cba(var_46f73294fb8b410c, var_171f90b9c4c76d44);
            }
            foreach (index, node in var_b7015a0dbefebce1) {
                if (isdefined(node.var_7643b53b09bbf1d5)) {
                    continue;
                }
                var_3de9d35a8cbb1ea6 = function_6747838fa0463ab2(node, var_b7015a0dbefebce1);
                if (isdefined(var_3de9d35a8cbb1ea6) && isdefined(var_3de9d35a8cbb1ea6.var_e601ac2f09720aa2)) {
                    level.poi[var_171f90b9c4c76d44]["groundReinforceStruct"].var_e45aa5237f84ce6f[var_3de9d35a8cbb1ea6.var_e601ac2f09720aa2] = var_3de9d35a8cbb1ea6;
                }
            }
            foreach (package in level.poi[var_171f90b9c4c76d44]["groundReinforceStruct"].var_e45aa5237f84ce6f) {
                foreach (node in package.pathnodes) {
                    if (!array_contains(package.var_b7015a0dbefebce1, node)) {
                        level.poi[var_171f90b9c4c76d44]["groundReinforceStruct"].var_7afd0cb611ecb973[level.poi[var_171f90b9c4c76d44]["groundReinforceStruct"].var_7afd0cb611ecb973.size] = node;
                    }
                }
                if (!istrue(level.var_40e5e944fbbf704e)) {
                    package.pathnodes = undefined;
                }
            }
        }
    } else {
        level.groundReinforceStruct = spawnstruct();
        level.groundReinforceStruct.var_e45aa5237f84ce6f = [];
        level.groundReinforceStruct.var_7afd0cb611ecb973 = [];
        var_b7015a0dbefebce1 = getstructarray("ground_reinforce_node", "targetname");
        foreach (node in var_b7015a0dbefebce1) {
            var_3de9d35a8cbb1ea6 = function_6747838fa0463ab2(node, var_b7015a0dbefebce1);
            if (isdefined(var_3de9d35a8cbb1ea6) && isdefined(var_3de9d35a8cbb1ea6.var_e601ac2f09720aa2)) {
                level.groundReinforceStruct.var_e45aa5237f84ce6f[var_3de9d35a8cbb1ea6.var_e601ac2f09720aa2] = var_3de9d35a8cbb1ea6;
            }
        }
        foreach (package in level.groundReinforceStruct.var_e45aa5237f84ce6f) {
            foreach (node in package.pathnodes) {
                if (!array_contains(package.var_b7015a0dbefebce1, node)) {
                    level.groundReinforceStruct.var_7afd0cb611ecb973[level.groundReinforceStruct.var_7afd0cb611ecb973.size] = node;
                }
            }
            if (!istrue(level.var_40e5e944fbbf704e)) {
                package.pathnodes = undefined;
            }
        }
    }
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa25
// Size: 0x3f6
function function_6747838fa0463ab2(node, var_b7015a0dbefebce1) {
    if (!isdefined(node.target)) {
        return;
    }
    package = spawnstruct();
    package.var_e601ac2f09720aa2 = level.var_b01c03d751886f28;
    level.var_b01c03d751886f28++;
    package.pathnodes = [];
    var_4a3b8372442841e5 = [];
    var_8bae1659c6ed57f9 = 0;
    allnodes = [0:node];
    var_428b0c825645a14b = 0;
    var_46f73294fb8b410c = [];
    while (var_428b0c825645a14b < allnodes.size) {
        var_fc7b2c2415093b8d = allnodes[var_428b0c825645a14b];
        var_428b0c825645a14b++;
        if (array_contains(var_b7015a0dbefebce1, var_fc7b2c2415093b8d)) {
            if (!array_contains(var_46f73294fb8b410c, var_fc7b2c2415093b8d)) {
                var_46f73294fb8b410c[var_46f73294fb8b410c.size] = var_fc7b2c2415093b8d;
                var_fc7b2c2415093b8d = function_a8c8d8521c0de967(var_fc7b2c2415093b8d, var_8bae1659c6ed57f9);
                var_4a3b8372442841e5[var_4a3b8372442841e5.size] = var_fc7b2c2415093b8d.var_7643b53b09bbf1d5;
                var_fc7b2c2415093b8d.var_4a3b8372442841e5 = [0:var_fc7b2c2415093b8d.var_7643b53b09bbf1d5];
                var_8bae1659c6ed57f9++;
            }
        } else if (isdefined(var_fc7b2c2415093b8d.targetname)) {
            var_eea002e5aaca5242 = getstructarray(var_fc7b2c2415093b8d.targetname, "target");
            foreach (newnode in var_eea002e5aaca5242) {
                if (!array_contains(allnodes, newnode)) {
                    allnodes[allnodes.size] = newnode;
                    newnode.var_4a3b8372442841e5 = [];
                    newnode.var_e601ac2f09720aa2 = package.var_e601ac2f09720aa2;
                    newnode.prev = undefined;
                }
            }
        }
        if (isdefined(var_fc7b2c2415093b8d.target)) {
            var_eea002e5aaca5242 = getstructarray(var_fc7b2c2415093b8d.target, "targetname");
            foreach (newnode in var_eea002e5aaca5242) {
                if (!array_contains(allnodes, newnode)) {
                    allnodes[allnodes.size] = newnode;
                    newnode.var_4a3b8372442841e5 = [];
                    newnode.var_e601ac2f09720aa2 = package.var_e601ac2f09720aa2;
                    newnode.prev = var_fc7b2c2415093b8d;
                } else if (!isdefined(newnode.prev)) {
                    newnode.prev = var_fc7b2c2415093b8d;
                } else if (isarray(newnode.prev)) {
                    if (!array_contains(newnode.prev, var_fc7b2c2415093b8d)) {
                        newnode.prev[newnode.prev.size] = var_fc7b2c2415093b8d;
                    }
                } else if (newnode.prev != var_fc7b2c2415093b8d) {
                    newnode.prev = [0:newnode.prev, 1:var_fc7b2c2415093b8d];
                }
            }
        }
    }
    foreach (var_c229d93c0bb4f8e8 in var_46f73294fb8b410c) {
        function_64f41b179b2030cc(var_c229d93c0bb4f8e8);
    }
    package.pathnodes = array_combine_unique(package.pathnodes, allnodes);
    foreach (var_c229d93c0bb4f8e8 in var_46f73294fb8b410c) {
        package.var_b7015a0dbefebce1[var_c229d93c0bb4f8e8.var_7643b53b09bbf1d5] = var_c229d93c0bb4f8e8;
    }
    package.var_4a3b8372442841e5 = var_4a3b8372442841e5;
    return package;
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe23
// Size: 0x123
function function_64f41b179b2030cc(var_c229d93c0bb4f8e8) {
    allnodes = getstructarray(var_c229d93c0bb4f8e8.target, "targetname");
    var_428b0c825645a14b = 0;
    while (var_428b0c825645a14b < allnodes.size) {
        node = allnodes[var_428b0c825645a14b];
        var_428b0c825645a14b++;
        node.var_4a3b8372442841e5[node.var_4a3b8372442841e5.size] = var_c229d93c0bb4f8e8.var_7643b53b09bbf1d5;
        if (isdefined(node.target)) {
            var_cc8adc8afbbcc72e = getstructarray(node.target, "targetname");
            if (isdefined(var_cc8adc8afbbcc72e)) {
                foreach (childnode in var_cc8adc8afbbcc72e) {
                    if (array_contains(allnodes, childnode)) {
                        /#
                            assertmsg("Found a loop in the node graph in: " + var_c229d93c0bb4f8e8.poi);
                        #/
                    } else {
                        allnodes[allnodes.size] = childnode;
                    }
                }
            }
        }
    }
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4d
// Size: 0x2f
function function_a8c8d8521c0de967(node, var_512ffbffc675f2fc) {
    node.lastusedtime = 0;
    node.var_7643b53b09bbf1d5 = var_512ffbffc675f2fc;
    return node;
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf84
// Size: 0x119
function function_1172336a24a3fac0(var_b9161fca8ca8119a, var_c5e7fce963586ec0, var_171f90b9c4c76d44, var_93390a6953905fef, var_7c99d4ed1e5a3a8) {
    spawners = undefined;
    var_37a86a6d390bf8ec = [];
    if (namespace_37f0fb6355a4618a::function_47d356083884f913()) {
        if (!isdefined(var_171f90b9c4c76d44)) {
            var_171f90b9c4c76d44 = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(var_c5e7fce963586ec0);
        }
        var_a829cd2e1f4ec42a = sortbydistance(level.poi[var_171f90b9c4c76d44]["groundReinforceStruct"].var_7afd0cb611ecb973, var_c5e7fce963586ec0);
    } else {
        var_a829cd2e1f4ec42a = sortbydistance(level.groundReinforceStruct.var_7afd0cb611ecb973, var_c5e7fce963586ec0);
    }
    var_42e40d3b6c566752 = var_7c99d4ed1e5a3a8;
    if (istrue(var_93390a6953905fef)) {
        var_42e40d3b6c566752 = 1;
    }
    var_30f3cbc949cf145c = [];
    for (i = 0; i < var_42e40d3b6c566752; i++) {
        if (isdefined(var_a829cd2e1f4ec42a[i])) {
            var_30f3cbc949cf145c[var_30f3cbc949cf145c.size] = var_a829cd2e1f4ec42a[i];
        }
    }
    if (istrue(level.var_85e83f382aedc103) || istrue(level.var_e575d73e8d29994)) {
        return [0:var_30f3cbc949cf145c[0]];
    }
    return var_30f3cbc949cf145c;
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a5
// Size: 0x2bd
function function_3f36fce913f23b19(var_e710a9290407911b, var_171f90b9c4c76d44) {
    if (namespace_37f0fb6355a4618a::function_47d356083884f913()) {
        foreach (var_9d33fb21f8c1abb2 in var_e710a9290407911b) {
            package = level.poi[var_171f90b9c4c76d44]["groundReinforceStruct"].var_e45aa5237f84ce6f[var_9d33fb21f8c1abb2.var_e601ac2f09720aa2];
            var_fd5ea9cb37c309d3 = [];
            foreach (spawnid in var_9d33fb21f8c1abb2.var_4a3b8372442841e5) {
                var_fd5ea9cb37c309d3[var_fd5ea9cb37c309d3.size] = package.var_b7015a0dbefebce1[spawnid];
            }
            var_d81c039f781faf29 = [];
            if (function_a794fcf9545f2062()) {
                foreach (spawnloc in var_fd5ea9cb37c309d3) {
                    players = function_b1eef70090b5b7b5(spawnloc.origin, level.var_25de264ee4d0e7aa, function_869ccb4e3451b8c6([0:"etype_player"]), [], undefined);
                    if (isdefined(players) && players.size > 0) {
                        continue;
                    } else {
                        var_d81c039f781faf29[var_d81c039f781faf29.size] = spawnloc;
                    }
                }
            }
            if (var_d81c039f781faf29.size > 0) {
                return [0:random(var_d81c039f781faf29), 1:var_9d33fb21f8c1abb2];
            }
        }
        return [0:undefined, 1:undefined];
    } else {
        foreach (var_9d33fb21f8c1abb2 in var_e710a9290407911b) {
            package = level.groundReinforceStruct.var_e45aa5237f84ce6f[var_9d33fb21f8c1abb2.var_e601ac2f09720aa2];
            var_fd5ea9cb37c309d3 = [];
            foreach (spawnid in var_9d33fb21f8c1abb2.var_4a3b8372442841e5) {
                var_fd5ea9cb37c309d3[var_fd5ea9cb37c309d3.size] = package.var_b7015a0dbefebce1[spawnid];
            }
            if (var_fd5ea9cb37c309d3.size > 0) {
                return [0:random(var_fd5ea9cb37c309d3), 1:var_9d33fb21f8c1abb2];
            }
        }
        return [0:undefined, 1:undefined];
    }
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1369
// Size: 0x1e0
function function_c277806325266d3c(var_9d33fb21f8c1abb2, var_c229d93c0bb4f8e8, var_171f90b9c4c76d44) {
    if (namespace_37f0fb6355a4618a::function_47d356083884f913()) {
        if (!isdefined(var_171f90b9c4c76d44)) {
            var_171f90b9c4c76d44 = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(var_9d33fb21f8c1abb2.origin);
        }
        package = level.poi[var_171f90b9c4c76d44]["groundReinforceStruct"].var_e45aa5237f84ce6f[var_9d33fb21f8c1abb2.var_e601ac2f09720aa2];
    } else {
        package = level.groundReinforceStruct.var_e45aa5237f84ce6f[var_9d33fb21f8c1abb2.var_e601ac2f09720aa2];
    }
    var_9f207219355d1982 = [0:var_9d33fb21f8c1abb2];
    currentnode = var_9d33fb21f8c1abb2;
    while (isdefined(currentnode.prev)) {
        if (isarray(currentnode.prev)) {
            var_25dd3020969aa0f6 = [];
            foreach (node in currentnode.prev) {
                if (array_contains(node.var_4a3b8372442841e5, var_c229d93c0bb4f8e8.var_7643b53b09bbf1d5)) {
                    var_25dd3020969aa0f6[var_25dd3020969aa0f6.size] = node;
                }
            }
            currentnode = random(var_25dd3020969aa0f6);
        } else {
            currentnode = currentnode.prev;
        }
        var_9f207219355d1982[var_9f207219355d1982.size] = currentnode;
    }
    var_9f207219355d1982 = array_reverse(var_9f207219355d1982);
    origins = [];
    foreach (node in var_9f207219355d1982) {
        origins[origins.size] = node.origin;
    }
    return origins;
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1551
// Size: 0xd6
function function_96a6b09d8ce2a773(node, var_7643b53b09bbf1d5, package) {
    var_25dd3020969aa0f6 = getstructarray(node.targetname, "target");
    foreach (var_e9c5bbca67080141 in var_25dd3020969aa0f6) {
        if (isdefined(var_e9c5bbca67080141.var_7643b53b09bbf1d5) && var_e9c5bbca67080141.var_7643b53b09bbf1d5 == var_7643b53b09bbf1d5) {
            return var_e9c5bbca67080141;
        }
        if (isdefined(var_e9c5bbca67080141.var_4a3b8372442841e5) && array_contains(var_e9c5bbca67080141.var_4a3b8372442841e5, var_7643b53b09bbf1d5)) {
            var_25dd3020969aa0f6[var_25dd3020969aa0f6.size] = var_e9c5bbca67080141;
        }
    }
    return random(var_25dd3020969aa0f6);
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x162f
// Size: 0x4b
function function_2301ba68ec48226e(var_3de9d35a8cbb1ea6) {
    if (!isdefined(var_3de9d35a8cbb1ea6.lastusedtime)) {
        return 1;
    }
    if (var_3de9d35a8cbb1ea6.lastusedtime + level.var_fa8b075e623245a7 < gettime()) {
        var_3de9d35a8cbb1ea6.lastusedtime = undefined;
        return 1;
    }
    return 0;
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1682
// Size: 0x4f5
function function_a5b0665e0a814be6(numagents, var_ec862c2c00c7ab5d, var_c5e7fce963586ec0, priority, category, subcategory, groupname, team, var_93390a6953905fef, var_171f90b9c4c76d44, nationality, var_b9161fca8ca8119a) {
    if (isdefined(level.radiation) && istrue(level.radiation.var_9badbb469626f6)) {
        return [0:undefined, 1:undefined];
    }
    var_b9161fca8ca8119a = function_5e7837d4d6b6dd45(var_b9161fca8ca8119a);
    if (!namespace_dace9d390bc4a290::vehicle_spawn_canspawnvehicle(var_b9161fca8ca8119a, undefined, undefined, "GROUND_REINFORCE")) {
        return [0:undefined, 1:undefined];
    }
    if (!isdefined(var_171f90b9c4c76d44)) {
        var_171f90b9c4c76d44 = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(var_c5e7fce963586ec0);
    }
    if (namespace_37f0fb6355a4618a::function_47d356083884f913()) {
        if (!isdefined(level.poi[var_171f90b9c4c76d44]) || !isdefined(level.poi[var_171f90b9c4c76d44]["groundReinforceStruct"]) || level.poi[var_171f90b9c4c76d44]["groundReinforceStruct"].var_e45aa5237f84ce6f.size == 0) {
            return [0:undefined, 1:undefined];
        }
    } else if (!isdefined(level.groundReinforceStruct) || level.groundReinforceStruct.var_e45aa5237f84ce6f.size == 0) {
        return [0:undefined, 1:undefined];
    }
    vehicle = undefined;
    var_c5e7fce963586ec0 = namespace_2000a83505151e5b::function_d378cc95abab583b(var_c5e7fce963586ec0, var_171f90b9c4c76d44);
    var_c5e7fce963586ec0 = getclosestpointonnavmesh(var_c5e7fce963586ec0);
    var_7afd0cb611ecb973 = function_1172336a24a3fac0(var_b9161fca8ca8119a, var_c5e7fce963586ec0, var_171f90b9c4c76d44, var_93390a6953905fef, 5);
    var_c0014162498c3d04 = function_3f36fce913f23b19(var_7afd0cb611ecb973, var_171f90b9c4c76d44);
    var_9d33fb21f8c1abb2 = var_c0014162498c3d04[1];
    var_72dac79a97fc7c5c = var_c0014162498c3d04[0];
    if (!isdefined(var_72dac79a97fc7c5c)) {
        return [0:undefined, 1:undefined];
    }
    var_72dac79a97fc7c5c.origin = getclosestpointonnavmesh(var_72dac79a97fc7c5c.origin) + (0, 0, 128);
    var_72dac79a97fc7c5c.var_9d33fb21f8c1abb2 = var_9d33fb21f8c1abb2;
    var_72dac79a97fc7c5c.lastusedtime = gettime();
    tier = function_aa34a142b7664dd1(namespace_6a3f8c14894f44be::function_5cc0c507e92f7b47(var_171f90b9c4c76d44));
    if (!isdefined(var_ec862c2c00c7ab5d)) {
        var_ec862c2c00c7ab5d = function_236a093e8a0ec040(var_b9161fca8ca8119a, tier);
    }
    if (!isdefined(var_72dac79a97fc7c5c.poi)) {
        var_72dac79a97fc7c5c.poi = var_171f90b9c4c76d44;
    }
    logstring("Ground reinforcement spawn: " + numagents + " AI at " + var_c5e7fce963586ec0);
    spawners = function_f260b1cef943f1ab(var_b9161fca8ca8119a, numagents, var_ec862c2c00c7ab5d, var_72dac79a97fc7c5c.origin, var_72dac79a97fc7c5c.poi, priority, category, nationality);
    riders = function_4ad6c25d6754f697(spawners, numagents, var_c5e7fce963586ec0, priority, category, subcategory, team, groupname, var_b9161fca8ca8119a);
    if (!isdefined(riders) || riders.size == 0) {
        return [0:undefined, 1:undefined];
    }
    var_72dac79a97fc7c5c.var_79fa6bd3c9bf6a0d = 1;
    var_72dac79a97fc7c5c.dontgetonpath = 1;
    spawndata = spawnstruct();
    spawndata.origin = var_72dac79a97fc7c5c.origin;
    spawndata.angles = var_72dac79a97fc7c5c.angles;
    spawndata.spawntype = "GROUND_REINFORCE";
    spawndata.showheadicon = 1;
    spawndata.var_f16652e1462a3739 = 1;
    var_14cde247ac3313a4 = function_55dace275f65d5b6(var_b9161fca8ca8119a);
    if (isdefined(var_14cde247ac3313a4)) {
        spawndata.var_14cde247ac3313a4 = var_14cde247ac3313a4;
    }
    var_ee8da5624236dc89 = spawnstruct();
    vehicle = namespace_1f188a13f7e79610::vehicle_spawn(var_b9161fca8ca8119a, spawndata, var_ee8da5624236dc89);
    vehicle.vehicle_spawner = var_72dac79a97fc7c5c;
    vehicle.var_c5e7fce963586ec0 = var_c5e7fce963586ec0;
    vehicle.var_eb504fc7e1cfeb4c = getdvarint(@"hash_9e4fff9024bd3a06", 1);
    spawninvehicle = !isdefined(var_72dac79a97fc7c5c.var_3f0312e6382c878f) || istrue(var_72dac79a97fc7c5c.var_3f0312e6382c878f);
    vehicle namespace_1f188a13f7e79610::function_f92faaaf5c5077c6(riders, spawninvehicle);
    if (isdefined(level.var_6e5ff6cae14c4081)) {
        level.var_6e5ff6cae14c4081[level.var_6e5ff6cae14c4081.size] = vehicle;
    }
    if (isdefined(level.var_e435e1e848664132[var_b9161fca8ca8119a])) {
        vehicle thread [[ level.var_e435e1e848664132[var_b9161fca8ca8119a] ]]();
    }
    /#
        if (0) {
            vehicle thread function_6f177a0ad8466261();
        }
    #/
    if (istrue(vehicle.var_20d6bfff3d46371d)) {
        foreach (rider in riders) {
            namespace_bfef6903bca5845d::function_c9b9fe3f7f739586(rider);
        }
    }
    return [0:vehicle, 1:riders];
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7f
// Size: 0x270
function function_f260b1cef943f1ab(var_3d22f278efd315cc, var_4af808cb9330a11a, var_ec862c2c00c7ab5d, origin, var_171f90b9c4c76d44, priority, category, nationality) {
    var_e4353165dd6de45e = ter_op(isdefined(level.var_f0872e42daf6d4d5), level.var_f0872e42daf6d4d5, origin);
    var_ca38685e5bf373f4 = (0, 0, 0);
    var_1250f27c957fec = namespace_1f188a13f7e79610::function_95022424d8b0dc1c(var_3d22f278efd315cc);
    if (var_4af808cb9330a11a > var_1250f27c957fec) {
        var_4af808cb9330a11a = var_1250f27c957fec;
    }
    if (!isdefined(category)) {
        category = "reinforcements";
    }
    var_644d90de7685f75 = function_8c6dbb64c8e1603c(var_4af808cb9330a11a, category, origin, var_171f90b9c4c76d44, 0);
    if (!var_644d90de7685f75 && !namespace_bfef6903bca5845d::function_359f24553bdcca92(var_4af808cb9330a11a, priority)) {
        /#
            msg = "stop_chasing" + var_4af808cb9330a11a + "<unknown string>";
            println(msg);
        #/
        return undefined;
    }
    riders = [];
    var_c229d93c0bb4f8e8 = spawnstruct();
    var_c229d93c0bb4f8e8.poi = var_171f90b9c4c76d44;
    var_c229d93c0bb4f8e8.origin = origin;
    for (i = 0; i < var_4af808cb9330a11a; i++) {
        riders[i] = spawnstruct();
        riders[i].origin = var_e4353165dd6de45e;
        riders[i].angles = var_ca38685e5bf373f4;
        riders[i].poi = var_171f90b9c4c76d44;
        type = undefined;
        if (isdefined(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i].type)) {
            type = var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i].type;
        }
        tier = undefined;
        if (isdefined(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i].tier)) {
            tier = var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i].tier;
        }
        var_177db62b63710f5d = undefined;
        if (isdefined(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i].nationality)) {
            var_177db62b63710f5d = var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i].nationality;
        }
        riders[i].aitype = function_d5bc07eabf352abb(var_c229d93c0bb4f8e8, var_171f90b9c4c76d44, undefined, type, tier, function_53c4c53197386572(var_177db62b63710f5d, nationality));
    }
    return riders;
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df7
// Size: 0x25b
function function_4ad6c25d6754f697(spawners, numagents, var_c5e7fce963586ec0, priority, category, subcategory, team, groupname, var_3d22f278efd315cc, var_30ec18a4c33af064) {
    if (!isdefined(spawners)) {
        return undefined;
    }
    if (!isdefined(groupname)) {
        groupname = namespace_bfef6903bca5845d::function_78759441c259f58a(var_c5e7fce963586ec0, numagents);
    }
    if (!isdefined(var_30ec18a4c33af064)) {
        var_30ec18a4c33af064 = var_3d22f278efd315cc;
    }
    var_30ec18a4c33af064 = function_ceb3c1ef8f369684(var_30ec18a4c33af064);
    var_a19b73001eb4102 = [];
    riders = [];
    foreach (index, spawner in spawners) {
        rider = namespace_bfef6903bca5845d::function_ea94a8bf24d3c5ef(spawner.aitype, spawner.origin, spawner.angles, priority, category, subcategory, groupname, team, undefined, spawner.poi, undefined, undefined, 0);
        if (isdefined(rider)) {
            rider.group = spawner;
            rider.group.group_name = spawner.targetname;
            rider.spawnpoint = spawner;
            rider.spawner = spawner;
            rider.vehiclerunexit = 1;
            if (isdefined(var_30ec18a4c33af064)) {
                if (isdefined(var_30ec18a4c33af064[index])) {
                    rider.script_startingposition = var_30ec18a4c33af064[index];
                } else if (!array_contains(var_30ec18a4c33af064, index)) {
                    rider.script_startingposition = index;
                } else {
                    for (i = 0; i < numagents; i++) {
                        if (!array_contains(var_30ec18a4c33af064, i) && !array_contains(var_a19b73001eb4102, i)) {
                            rider.script_startingposition = i;
                            break;
                        }
                    }
                }
            } else {
                rider.script_startingposition = index;
            }
            var_a19b73001eb4102[var_a19b73001eb4102.size] = rider.script_startingposition;
            if (isdefined(level.var_7a9f066f79bed633)) {
                rider thread [[ level.var_7a9f066f79bed633 ]]();
            }
            riders[riders.size] = rider;
            rider thread namespace_9246f10206f50768::function_cba4ff426a2f58ab(rider.script_startingposition);
        }
    }
    return riders;
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x205a
// Size: 0x2c9
function function_95e274db21433c2b() {
    var_d8b6f7ad3b0dead7 = [];
    var_d8b6f7ad3b0dead7 = function_c277806325266d3c(self.vehicle_spawner.var_9d33fb21f8c1abb2, self.vehicle_spawner, self.vehicle_spawner.poi);
    if (namespace_bfef6903bca5845d::function_e57289d4e2128a53(var_d8b6f7ad3b0dead7)) {
        self.var_20d6bfff3d46371d = 1;
    }
    self.var_d8b6f7ad3b0dead7 = var_d8b6f7ad3b0dead7;
    thread function_710348ca3287d2e9();
    veh_speed = namespace_3c37cb17ade254d::mph_to_ips(level.var_fcb29aee3f6eab0d);
    if (issubstr(self.classname_mp, "cargo")) {
        namespace_9246f10206f50768::function_1da2c31423c2676a();
        self function_77320e794d35465a("p2p", "brakeAtGoal", 1);
        self function_77320e794d35465a("p2p", "goalThreshold", level.var_fcb29aee3f6eab0d * 4);
        self function_77320e794d35465a("p2p", "steeringMultiplier", 2.5);
        self function_77320e794d35465a("p2p", "stuckTime", 1);
        self function_77320e794d35465a("p2p", "manualSpeed", veh_speed);
    } else {
        namespace_9246f10206f50768::function_1da2c31423c2676a();
        self function_77320e794d35465a("p2p", "brakeAtGoal", 1);
        self function_77320e794d35465a("p2p", "goalThreshold", level.var_fcb29aee3f6eab0d * 4);
        self function_77320e794d35465a("p2p", "steeringMultiplier", 2.5);
        self function_77320e794d35465a("p2p", "stuckTime", 1);
        self function_77320e794d35465a("p2p", "manualSpeed", veh_speed);
    }
    self.var_9acfc0bd86b2e2c1 = &namespace_9246f10206f50768::function_df5d237db38291ac;
    self.var_a9f96e33f612c828 = &namespace_9246f10206f50768::function_6a0b2a08499a9842;
    namespace_dbbb37eb352edf96::vehicle_lights_on("headlights", "script_vehicle_iw9_truck_techo_rebel_armor");
    self endon("death");
    self endon("stop_chasing");
    self endon("startedUnload");
    if (!isdefined(level.var_24a25c6be881be0c)) {
        level.var_24a25c6be881be0c = [];
    }
    if (issharedfuncdefined("veh9_techo_rebel_armor", "damageIgnoresArmor")) {
        self.var_7a646ff827387ac0 = getsharedfunc("veh9_techo_rebel_armor", "damageIgnoresArmor");
    }
    result = undefined;
    while (!istrue(self.unloading)) {
        var_17809e3c62d05f91 = self.var_d8b6f7ad3b0dead7[0];
        waitframe();
        if (!isdefined(var_17809e3c62d05f91)) {
            thread function_fb7e5919765650ea("combat");
            return;
        }
        if (isdefined(result) && result != "path_blocked") {
            self.var_d8b6f7ad3b0dead7 = array_slice(self.var_d8b6f7ad3b0dead7, 1);
        }
        if (self.var_d8b6f7ad3b0dead7.size == 1) {
            self function_77320e794d35465a("p2p", "goalThreshold", level.var_fcb29aee3f6eab0d * 4);
        }
        namespace_9246f10206f50768::function_28991b23dba743d8(var_17809e3c62d05f91);
        result = namespace_9246f10206f50768::function_8f40a2c8678f8304(self.origin, var_17809e3c62d05f91, level.var_fcb29aee3f6eab0d);
    }
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x232a
// Size: 0x10b
function private function_fb7e5919765650ea(exittype) {
    self endon("death");
    self notify("startedUnload");
    if (istrue(self.unloading)) {
        return;
    }
    self.unloading = 1;
    riders = self.riders;
    namespace_cbe993018617a21d::function_7d8f81a94dc08a15(1, exittype);
    namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(self, "neutral");
    namespace_1fbd40990ee60ede::function_887b4e2cbe3ab92c();
    var_8bc50c369b52af0 = self.var_d8b6f7ad3b0dead7;
    var_8bc50c369b52af0[var_8bc50c369b52af0.size] = self.var_c5e7fce963586ec0;
    foreach (rider in riders) {
        rider thread namespace_2000a83505151e5b::function_65f6a39e1083fb6b(rider, var_8bc50c369b52af0, 64, 128, undefined, 1, riders);
    }
    if (getdvarint(@"hash_88693526977782e2", 1) != 1) {
        return;
    }
    self endon("stop_watching_abandoned");
    wait(180);
    level thread function_9f45b9478c4e937b(self);
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x243c
// Size: 0x3c
function function_9f45b9478c4e937b(vehicle) {
    vehicle namespace_dace9d390bc4a290::function_357783d7c1d96273();
    var_fb41d1ca75009bf0 = vehicle namespace_1f188a13f7e79610::function_12f5a0e2344c10c5();
    if (!isdefined(var_fb41d1ca75009bf0)) {
        return;
    }
    wait(60);
    if (isdefined(var_fb41d1ca75009bf0)) {
        var_fb41d1ca75009bf0 namespace_dace9d390bc4a290::function_357783d7c1d96273();
    }
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x247f
// Size: 0x5f
function function_710348ca3287d2e9() {
    self endon("death");
    self endon("startedUnload");
    var_8a96def5a3cc6530 = 0;
    while (1) {
        waitframe();
        if (namespace_b479ac682b93cd92::vehicle_is_stopped()) {
            var_8a96def5a3cc6530++;
        } else {
            var_8a96def5a3cc6530 = 0;
        }
        if (namespace_cbe993018617a21d::function_eee51130cc8dce38()) {
            thread function_fb7e5919765650ea("combat");
            return;
        }
        if (var_8a96def5a3cc6530 > 10) {
            thread function_fb7e5919765650ea();
            return;
        }
    }
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e5
// Size: 0x93
function function_5e7837d4d6b6dd45(type) {
    switch (type) {
    case #"hash_139f3265d782181a":
        return "veh9_techo_rebel_armor";
    case #"hash_b0c26101fc869b42":
        return "veh9_overland_2016";
    case #"hash_6caacd2dac633568":
        return "veh9_sedan_hatchback_1985";
    case #"hash_5b5f747772f36407":
        return "veh9_mil_cargo_truck";
    case #"hash_d63ab45faf622239":
        return "veh9_jltv";
    case #"hash_4fd5c53c1a7ee8be":
        return "veh9_jltv_mg";
    default:
        return "veh9_techo_rebel_armor";
        break;
    }
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x257f
// Size: 0x22f
function function_236a093e8a0ec040(var_3d22f278efd315cc, tier) {
    if (!isdefined(tier)) {
        tier = 1;
    }
    var_246027a1b24dd32f = [];
    switch (var_3d22f278efd315cc) {
    case #"hash_cb367b51338c9d6":
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("patrol_primary", tier);
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("vehicle_patrol_rare", tier);
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("patrol_primary", tier);
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("vehicle_patrol_rare", tier);
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = "lmg";
        break;
    case #"hash_228830c793bd36cb":
    case #"hash_5211f142350a63e1":
    case #"hash_d212f4961f28eb58":
    case #"hash_d63b8f48fb92540d":
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("patrol_primary", tier);
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("convoy_attack_turret", tier);
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("patrol_primary", tier);
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("vehicle_patrol_rare", tier);
        break;
    case #"hash_f9260a8d132b789":
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("patrol_primary", tier);
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("patrol_primary", tier);
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("patrol_primary", tier);
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("patrol_primary", tier);
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("patrol_primary", tier);
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("vehicle_patrol_rare", tier);
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("vehicle_patrol_rare", tier);
        var_246027a1b24dd32f[var_246027a1b24dd32f.size] = function_ed108ff3eb578327("vehicle_patrol_rare", tier);
        break;
    default:
        return undefined;
        break;
    }
    var_cf627bf100b5bafc = [];
    foreach (var_83c3368707c68e6 in var_246027a1b24dd32f) {
        var_cf627bf100b5bafc[var_cf627bf100b5bafc.size] = function_de59d7cb310c1aff(var_83c3368707c68e6, tier);
    }
    var_ec862c2c00c7ab5d = function_b9d78fce07834c95(var_cf627bf100b5bafc);
    return var_ec862c2c00c7ab5d;
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27b6
// Size: 0xa4
function function_ceb3c1ef8f369684(var_3d22f278efd315cc) {
    switch (var_3d22f278efd315cc) {
    case #"hash_cb367b51338c9d6":
        return [0:0, 1:5, 2:6];
    case #"hash_d63b8f48fb92540d":
        return [0:0, 1:4, 2:1, 3:2, 4:3];
    case #"hash_b11f7e24c0be7a29":
        return [0:0, 1:1, 2:3, 3:4, 4:5, 5:6, 6:7];
    default:
        return undefined;
        break;
    }
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2861
// Size: 0x41
function function_55dace275f65d5b6(vehicletype) {
    if (!isdefined(level.var_f5f783a9d656258.var_48d4812167fbb628[vehicletype])) {
        return;
    }
    return random(level.var_f5f783a9d656258.var_48d4812167fbb628[vehicletype]);
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28aa
// Size: 0x55
function function_6f177a0ad8466261() {
    /#
        self endon("<unknown string>");
        while (1) {
            thread namespace_f2ffc0540883e1ad::drawline(self.origin, self.origin + (0, 0, 10000), 1, (1, 0, 0));
            wait(1);
        }
    #/
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2906
// Size: 0xdc
function function_9b7d54ce89689d91() {
    /#
        while (1) {
            while (getdvarint(@"hash_59530b43705e341f", 0) == 0) {
                waitframe();
            }
            var_c017436249a4749d = namespace_43bf74a2ee9234c0::function_a5b0665e0a814be6(getdvarint(@"hash_59530b43705e341f", 0), [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>"], level.players[0].origin, "<unknown string>", "<unknown string>", "<unknown string>", undefined, undefined, 1, namespace_37f0fb6355a4618a::function_6cc445c02b5effac(level.players[0].origin));
            agents = var_c017436249a4749d[1];
            vehicle = var_c017436249a4749d[0];
            setdvar(@"hash_59530b43705e341f", 0);
        }
    #/
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29e9
// Size: 0x2cd
function function_389a8c0032be2508() {
    /#
        while (1) {
            if (getdvarint(@"hash_34414e279fdbc0a1", 0) == 1) {
                if (function_47d356083884f913()) {
                    foreach (var_171f90b9c4c76d44, poi in level.poi) {
                        foreach (package in level.poi[var_171f90b9c4c76d44]["<unknown string>"].var_e45aa5237f84ce6f) {
                            level thread function_956e403f85aab2f7(package);
                            foreach (var_c229d93c0bb4f8e8 in package.var_b7015a0dbefebce1) {
                                print3d(var_c229d93c0bb4f8e8.origin + (0, 0, 128), "<unknown string>" + var_c229d93c0bb4f8e8.var_7643b53b09bbf1d5, (1, 1, 1), 1, 3, 20);
                            }
                            foreach (pathnode in package.pathnodes) {
                                if (array_contains(package.var_b7015a0dbefebce1, pathnode)) {
                                    continue;
                                }
                                var_e30ee4ae67d05d90 = "<unknown string>";
                                foreach (spawnid in pathnode.var_4a3b8372442841e5) {
                                    var_e30ee4ae67d05d90 = var_e30ee4ae67d05d90 + spawnid + "<unknown string>";
                                }
                                print3d(pathnode.origin + (0, 0, 128), var_e30ee4ae67d05d90, (1, 1, 1), 1, 5, 20);
                            }
                        }
                    }
                } else {
                    foreach (package in level.groundReinforceStruct.var_e45aa5237f84ce6f) {
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_3715b32331beba31/namespace_43bf74a2ee9234c0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cbd
// Size: 0x203
function function_956e403f85aab2f7(package) {
    /#
        foreach (node in package.var_b7015a0dbefebce1) {
            sphere(node.origin, 128, (0, 1, 0));
        }
        foreach (node in package.pathnodes) {
            if (array_contains(package.var_b7015a0dbefebce1, node)) {
                continue;
            }
            if (isdefined(node.prev)) {
                if (isarray(node.prev)) {
                    sphere(node.origin, 128, (1, 0, 1));
                    foreach (prevnode in node.prev) {
                        line(node.origin, prevnode.origin, (0, 1, 0));
                    }
                } else {
                    line(node.origin, node.prev.origin, (0, 1, 0));
                }
            }
            if (!array_contains(package.var_b7015a0dbefebce1, node)) {
                sphere(node.origin, 64, (1, 1, 0));
            }
        }
    #/
}

