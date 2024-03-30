// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_48814951e916af89;
#using scripts\mp\poi.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_6fba7df440c493c4;
#using script_6bc507afe7a93a3;
#using script_69a61780e1cc21a9;
#using scripts\mp\utility\debug.gsc;
#using script_1174abedbefe9ada;
#using scripts\mp\ai_behavior.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\common\vehicle_paths.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_2bc0b0102f9b7751;

#namespace namespace_f3747e64a39c0f46;

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
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
    helimindist = getdvarint(@"hash_7e7a367ebf018b24", 768);
    level.heli_mindistsq = helimindist * helimindist;
    helimaxdist = getdvarint(@"hash_89d19c15b1e73afa", 3072);
    level.heli_maxdistsq = helimaxdist * helimaxdist;
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

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d0
// Size: 0x19
function initvehicles() {
    waittillframeend();
    namespace_68d1bc1bac7da538::init_vehicles();
    namespace_ea79ad160580b4e7::main();
    namespace_d8c2d739478db8bb::main();
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
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
            struct.pathstartnodes = [];
            struct.unload_locs = [];
            if (istrue(level.var_4cfd75aa6ddde156)) {
                struct.postlandingdest = getstructarray("heli_postLandingDest", "script_noteworthy");
                unload_locs = getstructarray("heli_unload", "script_noteworthy");
                struct.unload_locs = function_7802832a1f064ccd(unload_locs, "heli_unload");
                struct.exitstructs = getstructarray("heli_exit", "targetname");
                level.poi[poiname]["heliReinforceStruct"] = struct;
                temparray = getstructarray("heli_reinforceNode", "script_noteworthy");
                var_5d0d1ce28492ddad = function_7802832a1f064ccd(temparray, "heli_reinforceNode");
            } else {
                struct.postlandingdest = function_9656b61cc8a37cba(getstructarray("heli_postLandingDest", "script_noteworthy"), poiname);
                unload_locs = function_9656b61cc8a37cba(getstructarray("heli_unload", "script_noteworthy"), poiname);
                struct.unload_locs = function_7802832a1f064ccd(unload_locs, "heli_unload");
                struct.exitstructs = function_9656b61cc8a37cba(getstructarray("heli_exit", "targetname"), poiname);
                level.poi[poiname]["heliReinforceStruct"] = struct;
                temparray = function_9656b61cc8a37cba(getstructarray("heli_reinforceNode", "script_noteworthy"), poiname);
                var_5d0d1ce28492ddad = function_7802832a1f064ccd(temparray, "heli_reinforceNode");
            }
            foreach (loc in unload_locs) {
                if (isdefined(loc.target)) {
                    loc.exit_node = getstruct(loc.target, "targetname");
                    loc.target = undefined;
                }
            }
            foreach (pathnode in var_5d0d1ce28492ddad) {
                arraysize = level.poi[poiname]["heliReinforceStruct"].pathstartnodes.size;
                level.poi[poiname]["heliReinforceStruct"].pathstartnodes[arraysize] = pathnode;
                if (isdefined(pathnode.target)) {
                    for (node = getstruct(pathnode.target, "targetname"); isdefined(node) && isdefined(node.target); node = getstruct(node.target, "targetname")) {
                        if (isdefined(node.script_unload)) {
                            node.path_start_node = pathnode;
                            arraysize = level.poi[poiname]["heliReinforceStruct"].unload_locs.size;
                            level.poi[poiname]["heliReinforceStruct"].unload_locs[arraysize] = node;
                        }
                    }
                }
            }
            level.poi[poiname]["heliReinforceStruct"].pathstartnodes = array_randomize(level.poi[poiname]["heliReinforceStruct"].pathstartnodes);
        }
        return;
    }
    level.heliReinforceStruct = spawnstruct();
    level.heliReinforceStruct.pathstartnodes = [];
    level.heliReinforceStruct.unload_locs = [];
    level.heliReinforceStruct.postlandingdest = getstructarray("heli_postLandingDest", "script_noteworthy");
    unload_locs = getstructarray("heli_unload", "script_noteworthy");
    level.heliReinforceStruct.unload_locs = function_7802832a1f064ccd(unload_locs, "heli_unload");
    temparray = getstructarray("heli_reinforceNode", "script_noteworthy");
    var_5d0d1ce28492ddad = function_7802832a1f064ccd(temparray, "heli_reinforceNode");
    foreach (pathnode in var_5d0d1ce28492ddad) {
        level.heliReinforceStruct.pathstartnodes[level.heliReinforceStruct.pathstartnodes.size] = pathnode;
        if (isdefined(pathnode.target)) {
            for (node = getstruct(pathnode.target, "targetname"); isdefined(node.target); node = getstruct(node.target, "targetname")) {
                if (isdefined(node.script_unload)) {
                    node.path_start_node = pathnode;
                    level.heliReinforceStruct.unload_locs[level.heliReinforceStruct.unload_locs.size] = node;
                }
            }
        }
    }
    level.heliReinforceStruct.pathstartnodes = array_randomize(level.heliReinforceStruct.pathstartnodes);
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2f
// Size: 0x114
function function_7802832a1f064ccd(array, name) {
    uniquearray = [];
    foreach (loc in array) {
        duplicate = 0;
        foreach (entry in uniquearray) {
            if (distance2dsquared(loc.origin, entry.origin) < 65536) {
                /#
                    println("smoke_grenade_expl_trans" + name + "<unknown string>" + loc.origin);
                #/
                duplicate = 1;
                break;
            }
        }
        if (!duplicate) {
            uniquearray[uniquearray.size] = loc;
        }
    }
    return uniquearray;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4b
// Size: 0x2c9
function function_9be6618055ceb851(reinforceorigin, var_93390a6953905fef, team, poiname) {
    unloadlocs = undefined;
    if (false) {
        level thread scripts/mp/utility/debug::drawsphere(reinforceorigin, 32, 60, (0, 0, 1));
    }
    if (function_47d356083884f913()) {
        if (!isdefined(poiname)) {
            poiname = function_6cc445c02b5effac(reinforceorigin);
        }
        unloadlocs = sortbydistance(level.poi[poiname]["heliReinforceStruct"].unload_locs, reinforceorigin);
    } else {
        unloadlocs = sortbydistance(level.heliReinforceStruct.unload_locs, reinforceorigin);
    }
    templocs = [];
    foreach (loc in unloadlocs) {
        temporigin = drop_to_ground(loc.origin, 100);
        if (abs(temporigin[2] - reinforceorigin[2]) <= level.var_253d97d4fc2e6355) {
            templocs[templocs.size] = loc;
        }
    }
    unloadlocs = templocs;
    var_8824eed8622b038a = 5;
    if (istrue(var_93390a6953905fef)) {
        var_8824eed8622b038a = 1;
    }
    var_a678dfa17ec4c56b = [];
    foreach (loc in unloadlocs) {
        if (var_a678dfa17ec4c56b.size == var_8824eed8622b038a) {
            break;
        }
        dist = distance2dsquared(loc.origin, reinforceorigin);
        if (dist < level.heli_mindistsq) {
            if (false) {
                level thread scripts/mp/utility/debug::drawsphere(loc.origin, 32, 60, (1, 0, 0));
            }
            continue;
        }
        if (dist > level.heli_maxdistsq) {
            if (false) {
                level thread scripts/mp/utility/debug::drawsphere(loc.origin, 32, 60, (1, 0, 0));
            }
            continue;
        }
        if (false) {
            level thread scripts/mp/utility/debug::drawsphere(loc.origin, 32, 60, (0, 1, 0));
        }
        var_a678dfa17ec4c56b[var_a678dfa17ec4c56b.size] = loc;
    }
    if (!istrue(level.forceclosest)) {
        var_a678dfa17ec4c56b = function_34ea974920aa74b9(var_a678dfa17ec4c56b);
        var_a678dfa17ec4c56b = array_randomize(var_a678dfa17ec4c56b);
    }
    pathnode = function_321665dcdcbf401e(var_a678dfa17ec4c56b, reinforceorigin, undefined, poiname);
    if (isdefined(pathnode)) {
        return pathnode;
    }
    pathnode = function_321665dcdcbf401e(unloadlocs, reinforceorigin, var_8824eed8622b038a, poiname);
    if (isdefined(pathnode)) {
        return pathnode;
    }
    return undefined;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1c
// Size: 0x123
function function_34ea974920aa74b9(unloadlocs) {
    var_8d990899198d4647 = undefined;
    foreach (loc in unloadlocs) {
        if (isdefined(loc.timesused)) {
            if (!isdefined(var_8d990899198d4647) || loc.timesused < var_8d990899198d4647) {
                var_8d990899198d4647 = loc.timesused;
            }
            continue;
        }
        var_8d990899198d4647 = 0;
    }
    var_8022a89f6197d261 = [];
    foreach (loc in unloadlocs) {
        if (isdefined(loc.timesused) && loc.timesused == var_8d990899198d4647 || !isdefined(loc.timesused) && var_8d990899198d4647 == 0) {
            var_8022a89f6197d261[var_8022a89f6197d261.size] = loc;
        }
    }
    return var_8022a89f6197d261;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1047
// Size: 0x1ed
function function_321665dcdcbf401e(array, desired_origin, skiptoindex, poiname) {
    if (!isdefined(array)) {
        return;
    }
    var_9e334397541dca8e = spawnstruct();
    index = 0;
    if (isdefined(skiptoindex)) {
        index = skiptoindex;
    }
    for (i = index; i < array.size; i++) {
        if (!isdefined(array[i])) {
            continue;
        }
        loc = array[i];
        if (istrue(loc.used)) {
            continue;
        }
        if (namespace_7789f919216d38a2::radiation_isInRadiation(loc.origin)) {
            continue;
        }
        node = undefined;
        if (isdefined(loc.path_start_node)) {
            node = loc.path_start_node;
        } else {
            node = function_42aa412d7e4d7c37(loc, desired_origin, poiname);
        }
        if (!isdefined(node)) {
            continue;
        }
        if (istrue(node.used)) {
            continue;
        }
        heli_type = undefined;
        if (isdefined(loc.script_parameters)) {
            heli_list = strtok(loc.script_parameters, " ");
            heli_type = random(heli_list);
            if (!function_fa537f1ab52a76d1(heli_type) || !istrue(function_29b4292c92443328(heli_type).ai.var_289df80e1ded586f)) {
                heli_type = undefined;
            }
        }
        var_9e334397541dca8e.node = node;
        var_9e334397541dca8e.type_override = heli_type;
        var_9e334397541dca8e.node.unloadorigin = loc.origin;
        var_9e334397541dca8e.unloadloc = loc;
        function_b3d7b682f3c2d9d(node, loc);
        if (!isdefined(loc.timesused)) {
            loc.timesused = 0;
        }
        loc.timesused++;
        return var_9e334397541dca8e;
    }
    return undefined;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123c
// Size: 0xc6
function function_42aa412d7e4d7c37(loc, desired_origin, poiname) {
    startnodearray = undefined;
    if (function_47d356083884f913()) {
        if (!isdefined(poiname)) {
            poiname = function_6cc445c02b5effac(desired_origin);
        }
        startnodearray = sortbydistance(level.poi[poiname]["heliReinforceStruct"].pathstartnodes, desired_origin);
    } else {
        startnodearray = sortbydistance(level.heliReinforceStruct.pathstartnodes, desired_origin);
    }
    for (i = 0; i < startnodearray.size; i++) {
        if (istrue(startnodearray[i].used)) {
            continue;
        }
        if (isdefined(startnodearray[i].target)) {
            continue;
        }
        return startnodearray[i];
    }
    return undefined;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x130a
// Size: 0x23
function function_db68d9a06b8c63a6(node, timer) {
    wait(timer);
    node.used = 0;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1334
// Size: 0x52
function function_307d3746c484ec65(desired_loc) {
    if (isdefined(desired_loc)) {
        var_1dc99acf04aceb20 = sortbydistance(level.heliReinforceStruct.postlandingdest, desired_loc);
        return var_1dc99acf04aceb20[0];
    }
    return random(level.heliReinforceStruct.postlandingdest);
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138e
// Size: 0x3d
function function_b3d7b682f3c2d9d(startloc, unloadloc) {
    startloc.used = 1;
    unloadloc.used = 1;
    startloc.unloadloc = unloadloc;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d2
// Size: 0x4a
function function_e1310878ab1f5e7c(startloc) {
    startloc.used = 0;
    if (isdefined(startloc.unloadloc)) {
        startloc.unloadloc.used = 0;
        startloc.unloadloc = undefined;
    }
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1423
// Size: 0x198
function function_8062c7f3856760fc() {
    level endon("game_ended");
    level notify("stopUnloadTest");
    level endon("stopUnloadTest");
    level.forceclosest = 1;
    locs = level.heliReinforceStruct.unload_locs;
    foreach (loc in locs) {
        loc.debug_used = undefined;
    }
    tested = 0;
    while (true) {
        if (tested == locs.size) {
            foreach (loc in locs) {
                loc.debug_used = undefined;
            }
        }
        tested = 0;
        for (i = 0; i < locs.size; i++) {
            loc = locs[i];
            if (istrue(loc.debug_used)) {
                tested++;
                continue;
            }
            riders = function_3779deb97b61a65(2, loc.origin, "high", "reinforcements", "debug");
            if (isdefined(riders)) {
                loc.debug_used = 1;
                thread scripts/mp/utility/debug::drawsphere(loc.origin, 64, 60, (0, 1, 0));
            }
            wait(15);
        }
        wait(1);
    }
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 17, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c2
// Size: 0x24f
function function_3779deb97b61a65(numagents, reinforceorigin, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, goalradius, var_21f24aecb313e479, var_ec862c2c00c7ab5d, skipstealth, var_ebc42e43f4b05504, nationality, vehicletypeoverride, overridetier) {
    if (isdefined(level.radiation) && istrue(level.radiation.spreading)) {
        return;
    }
    if (isdefined(level.var_b08b4d8a5fedebdb)) {
        riders = [[ level.var_b08b4d8a5fedebdb ]](reinforceorigin, team, poiname);
        if (isdefined(riders)) {
            return riders;
        }
    }
    reinforceorigin = scripts/mp/ai_behavior::function_d378cc95abab583b(reinforceorigin, poiname);
    reinforceorigin = getclosestpointonnavmesh(reinforceorigin);
    if (!isdefined(poiname)) {
        poiname = scripts/mp/poi::function_6cc445c02b5effac(reinforceorigin);
    }
    if (scripts/cp_mp/utility/game_utility::function_22cd3d64fdb05892() || is_equal(level.gametype, "wm")) {
        var_9e334397541dca8e = [[ level.var_4eb71f2b8cba5cb ]](reinforceorigin, var_93390a6953905fef, team);
    } else {
        var_9e334397541dca8e = [[ level.var_4eb71f2b8cba5cb ]](reinforceorigin, var_93390a6953905fef, team, poiname);
    }
    if (isdefined(var_9e334397541dca8e)) {
        var_9e334397541dca8e.node.reinforceorigin = reinforceorigin;
        var_9e334397541dca8e.node.goalradius = goalradius;
        var_9e334397541dca8e.node.var_21f24aecb313e479 = var_21f24aecb313e479;
        if (isdefined(vehicletypeoverride)) {
            var_9e334397541dca8e.type_override = vehicletypeoverride;
        }
        if (!isdefined(groupname)) {
            groupname = function_78759441c259f58a(reinforceorigin, numagents);
        }
        vehicle = level heli_spawnheli(var_9e334397541dca8e.node, var_9e334397541dca8e.type_override, numagents, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, var_ec862c2c00c7ab5d, skipstealth, var_ebc42e43f4b05504, nationality, overridetier);
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

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1819
// Size: 0x8c
function function_173e2a87c2a19acc(riders, typeoverride) {
    typearray = ["little_bird", "veh9_blima"];
    if (isdefined(typeoverride) && typeoverride != "") {
        typearray = typeoverride;
        if (!isarray(typeoverride)) {
            typearray = [typeoverride];
        }
    }
    if (isdefined(riders)) {
        if (riders > 6) {
            typearray = array_remove(typearray, "little_bird");
        }
        if (riders > 6) {
            typearray = array_remove(typearray, "veh9_blima");
        }
    }
    return random(typearray);
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ad
// Size: 0x1b
function function_bd28fa0797f4d5ec() {
    self endon("death");
    self waittill("pushplayerchanged");
    self pushplayer(1);
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18cf
// Size: 0x7a3
function heli_spawnheli(var_a4e4a71852a83d8f, type_override, num_riders, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, var_ec862c2c00c7ab5d, skipstealth, var_ebc42e43f4b05504, nationality, overridetier) {
    heli_type = function_173e2a87c2a19acc(num_riders, type_override);
    if (isdefined(type_override) && type_override != "") {
        heli_type = type_override;
    }
    if (!isdefined(num_riders)) {
        num_riders = 6;
    }
    if (!isdefined(skipstealth)) {
        skipstealth = 0;
    }
    var_a3affcf53bb2d1f8 = undefined;
    orig_vehicletype = undefined;
    heliverticaloffset = 10000;
    newval = getdvarint(@"hash_45680b15d7117402", 0);
    if (newval) {
        heliverticaloffset = newval;
    }
    var_a13c822ae90e7c51 = 8000;
    newval = getdvarint(@"hash_7b5759d6bf7c3b73", 0);
    if (newval) {
        var_a13c822ae90e7c51 = newval;
    }
    orig_origin = undefined;
    if (isdefined(var_a4e4a71852a83d8f.unloadorigin)) {
        orig_origin = var_a4e4a71852a83d8f.origin;
        var_d4f8974f990de095 = var_a4e4a71852a83d8f.origin - var_a4e4a71852a83d8f.unloadorigin;
        var_d4f8974f990de095 = vectornormalize(var_d4f8974f990de095);
        var_a4e4a71852a83d8f.origin = var_a4e4a71852a83d8f.unloadorigin + var_d4f8974f990de095 * var_a13c822ae90e7c51;
        var_a4e4a71852a83d8f.origin = var_a4e4a71852a83d8f.origin + (0, 0, heliverticaloffset);
    }
    seatindex = 0;
    if (isdefined(heli_type)) {
        switch (heli_type) {
        case #"hash_835a3b4bb4e34233":
            seatindex = 2;
            num_riders = num_riders + 2;
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
            if (isdefined(var_a4e4a71852a83d8f.unloadorigin)) {
                var_3a6b42ab825a103e = var_a4e4a71852a83d8f.unloadorigin;
            } else {
                var_3a6b42ab825a103e = var_a4e4a71852a83d8f.origin;
            }
            poiname = scripts/mp/poi::function_6cc445c02b5effac(var_3a6b42ab825a103e);
            var_a4e4a71852a83d8f.poi = poiname;
        }
        logstring("Heli reinforcement spawn: " + num_riders + " AI at " + var_a4e4a71852a83d8f.origin);
        spawners = function_b276f0690ce15746(heli_type, num_riders, var_a4e4a71852a83d8f.origin, var_a4e4a71852a83d8f.poi, priority, var_ec862c2c00c7ab5d, category, team, nationality, overridetier);
        riders = [];
        var_b5424ebe989b94b4 = 0;
        foreach (spawner in spawners) {
            spawner.script_demeanor = undefined;
            rider = ai_mp_requestspawnagent(spawner.aitype, spawner.origin, spawner.angles, priority, category, subcategory, groupname, team, var_a4e4a71852a83d8f.reinforceorigin, var_a4e4a71852a83d8f.poi, skipstealth, undefined, 0);
            if (isdefined(rider)) {
                rider thread function_bd28fa0797f4d5ec();
                if (heli_type == "veh9_blima" && !istrue(var_b5424ebe989b94b4) && num_riders <= 4) {
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
            spawndata.initai = 1;
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
            vehicle scripts/cp_mp/vehicles/vehicle_interact::vehicle_interact_makeunusable(vehicle);
            vehicle function_247ad6a91f6a4ffe(1);
            vehicle vehphys_forcekeyframedmotion();
            vehicle scripts/cp_mp/vehicles/vehicle_interact::function_5c097a8f16a227d5(0);
            if (isdefined(orig_origin)) {
                var_a4e4a71852a83d8f.origin = orig_origin;
            }
            vehicle.poi = var_a4e4a71852a83d8f.poi;
            vehicle endon("death");
            function_7045fb761a4998e3(vehicle);
            vehicle function_f92faaaf5c5077c6(riders, 1, 1);
            foreach (rider in riders) {
                var_9fb566418340eedd = var_a4e4a71852a83d8f.reinforceorigin;
                if (!isdefined(var_9fb566418340eedd)) {
                    var_9fb566418340eedd = function_a130de01f9e62aa4(var_a4e4a71852a83d8f.unloadorigin);
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
                vehicle.animintro = 1;
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
        return;
    }
    spawndata = spawnstruct();
    spawndata.origin = var_a4e4a71852a83d8f.origin;
    spawndata.angles = var_a4e4a71852a83d8f.angles;
    spawndata.team = team;
    spawndata.initai = 1;
    vehicle = vehicle_spawn(heli_type, spawndata);
    if (isdefined(vehicle)) {
        vehicle scripts/cp_mp/vehicles/vehicle_interact::vehicle_interact_makeunusable(vehicle);
        vehicle function_247ad6a91f6a4ffe(1);
        vehicle vehphys_forcekeyframedmotion();
    }
    if (isdefined(orig_origin)) {
        var_a4e4a71852a83d8f.origin = orig_origin;
    }
    function_e1310878ab1f5e7c(var_a4e4a71852a83d8f);
    return vehicle;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2079
// Size: 0x408
function function_bbfeb6cfdbc102a1(vehicle, var_a4e4a71852a83d8f, heli_type, var_ebc42e43f4b05504) {
    vehicle thread function_88982797150bf237(vehicle, var_a4e4a71852a83d8f, var_ebc42e43f4b05504);
    exit_path = 0;
    move_path = undefined;
    unload_locs = undefined;
    poiname = undefined;
    if (function_47d356083884f913()) {
        poiname = function_6cc445c02b5effac(var_a4e4a71852a83d8f.unloadorigin);
        unload_locs = sortbydistance(level.poi[poiname]["heliReinforceStruct"].unload_locs, var_a4e4a71852a83d8f.unloadorigin);
    } else {
        unload_locs = sortbydistance(level.heliReinforceStruct.unload_locs, var_a4e4a71852a83d8f.unloadorigin);
    }
    if (!function_3e4b3c31abee91e7(heli_type)) {
        move_path = function_88b89f0f153d496(var_a4e4a71852a83d8f, var_a4e4a71852a83d8f.unloadloc);
    } else {
        move_path = var_a4e4a71852a83d8f.unloadloc;
    }
    if (!isdefined(move_path)) {
        function_e1310878ab1f5e7c(var_a4e4a71852a83d8f);
        scripts/cp_mp/vehicles/vehicle::vehicle_death(vehicle);
        msg = "We didn't find an unload location for: " + default_to(poiname, "Undefined POI Name") + " at location: " + default_to(var_a4e4a71852a83d8f.unloadorigin, "Undefined Unload Origin");
        /#
            assertmsg(msg);
        #/
        _ = undefined == msg;
        return;
    }
    vehicle scripts/cp_mp/vehicles/vehicle_interact::function_5c097a8f16a227d5(1);
    vehicle thread function_e92bac7b0b067a7b(var_a4e4a71852a83d8f.unloadorigin, heli_type);
    if (istrue(vehicle.animintro)) {
        node = move_path;
        vehicle.currentnode = node;
        ground_pos = drop_to_ground(node.origin, 100, -1000);
        scenenode = spawnstruct();
        scenenode.origin = ground_pos;
        scenenode.angles = node.angles;
        vehicle.scenenode = scenenode;
        animation = level.vehicle.templates.aianims[vehicle scripts/common/vehicle_code::get_vehicle_classname()][0].vehicle_getoutanim;
        neworg = getstartorigin(scenenode.origin, scenenode.angles, animation);
        newangles = getstartangles(scenenode.origin, scenenode.angles, animation);
        vehicle vehicle_teleport(neworg, newangles);
        vehicle dontinterpolate();
        vehicle scripts/common/vehicle_paths::unload_node(node);
    } else if (isdefined(move_path) && !isdefined(var_a4e4a71852a83d8f.nopath)) {
        if (vehicle scripts/common/vehicle::ishelicopter()) {
            vehicle vehphys_setdefaultmotion();
            vehicle scripts/common/vehicle_paths::vehicle_paths_helicopter(move_path);
        }
    }
    vehicle.unloaded = 1;
    if (isdefined(vehicle.currentnode) && isdefined(vehicle.currentnode.target)) {
        exit_path = 1;
    }
    if (isdefined(var_a4e4a71852a83d8f.auto_crash)) {
        vehicle.auto_crash = 1;
    }
    if (!exit_path) {
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

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2488
// Size: 0x199
function function_88b89f0f153d496(var_a4e4a71852a83d8f, unload_struct) {
    end = 3;
    next_struct = unload_struct;
    struct_path = [];
    struct_path[0] = next_struct;
    for (i = 0; i < end; i++) {
        next_struct = struct_path[i];
        next_struct.script_goalyaw = 1;
        prev_struct = spawnstruct();
        struct_path[i + 1] = prev_struct;
        if (i == 0) {
            zup = 1000;
            magnitude = 1000;
            prev_struct.speed = 10;
            offset = function_3bd98e79a697ce64(var_a4e4a71852a83d8f, next_struct, zup, magnitude);
        } else if (i == 1) {
            zup = 0;
            magnitude = 750;
            prev_struct.speed = 25;
            offset = function_3bd98e79a697ce64(var_a4e4a71852a83d8f, next_struct, zup, magnitude);
        } else {
            zup = 0;
            magnitude = 500;
            prev_struct.speed = var_a4e4a71852a83d8f.speed;
            prev_struct.script_stopnode = 1;
            prev_struct.radius = 100;
            offset = function_3bd98e79a697ce64(var_a4e4a71852a83d8f, next_struct, zup, magnitude);
        }
        prev_struct.origin = next_struct.origin + offset;
        prev_struct.angles = next_struct.angles;
        prev_struct.radius = 500;
        prev_struct.target = next_struct;
    }
    return struct_path[struct_path.size - 1];
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2629
// Size: 0x68
function function_3bd98e79a697ce64(start_node, end_node, z_val, mag) {
    distance_vector = start_node.origin - end_node.origin;
    offset = vectornormalize(distance_vector);
    offset = offset * mag;
    offset = (offset[0], offset[1], z_val);
    return offset;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2699
// Size: 0xcb
function function_e92bac7b0b067a7b(unloadorigin, helitype) {
    self endon("death");
    if (istrue(level.var_b4c49b42d82621c9)) {
        return;
    }
    pos = getgroundposition(unloadorigin, 1, 1000, 0);
    dist = 500;
    dist_sq = dist * dist;
    while (distance2dsquared(unloadorigin, self.origin) > dist_sq) {
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

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x276b
// Size: 0x33
function function_3e4b3c31abee91e7(heli_type) {
    switch (heli_type) {
    case #"hash_835a3b4bb4e34233":
        return true;
    case #"hash_9d4e22a00fc630b5":
        return false;
    }
    return false;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27a6
// Size: 0x52
function function_bb0826e06fc68038(helitype) {
    switch (helitype) {
    case #"hash_835a3b4bb4e34233":
        if (self.vehicle_position == 5 || self.vehicle_position == 6) {
            return true;
        }
    case #"hash_9d4e22a00fc630b5":
        return false;
    }
    return false;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
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
            var_61bec49fd0ba66b6 = random(level.poi[poiname]["heliReinforceStruct"].exitstructs);
        }
        if (!isdefined(var_61bec49fd0ba66b6)) {
            var_61bec49fd0ba66b6 = random(level.var_3122f605f0e8e125);
        }
    }
    ground_pos = getgroundposition(self.origin, 1);
    if (distancesquared(self.origin, ground_pos) <= 1000000) {
        offset = function_3bd98e79a697ce64(var_61bec49fd0ba66b6, self, 1000, 1000);
        exit_path = spawnstruct();
        exit_path.origin = ground_pos + offset;
        exit_path.angles = pathnode.angles;
        exit_path.radius = 512;
        self.var_918c5a31037e00ee = spawnstruct();
        self.var_918c5a31037e00ee.speed = 85;
        self vehphys_setdefaultmotion();
        scripts/common/vehicle_paths::vehicle_paths_helicopter(exit_path);
    }
    self.end_point = var_61bec49fd0ba66b6;
    path_start = var_61bec49fd0ba66b6;
    path_start.radius = 1000;
    self.var_918c5a31037e00ee = spawnstruct();
    self.var_918c5a31037e00ee.speed = 85;
    self function_247ad6a91f6a4ffe(0);
    self.var_6df468049c1f41dc = 1;
    thread scripts/common/vehicle_paths::vehicle_paths_helicopter(path_start);
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
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
    dotangles = pathnode.angles;
    var_2b008b868cc6c2f7 = undefined;
    if (function_47d356083884f913()) {
        poiname = function_6cc445c02b5effac(org);
        var_2b008b868cc6c2f7 = level.poi[poiname]["heliReinforceStruct"].exitstructs;
    } else {
        var_2b008b868cc6c2f7 = level.var_3122f605f0e8e125;
    }
    best_dot = -5;
    var_14bb0bb2b7d418d7 = undefined;
    sorted_structs = get_array_of_closest(org, var_2b008b868cc6c2f7);
    foreach (struct in sorted_structs) {
        dot = math::get_dot(org, dotangles, struct.origin);
        if (dot > best_dot) {
            best_dot = dot;
            var_14bb0bb2b7d418d7 = struct;
        }
    }
    return var_14bb0bb2b7d418d7;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b13
// Size: 0x33d
function function_b276f0690ce15746(heli_type, numriders, origin, poiname, priority, var_ec862c2c00c7ab5d, category, team, nationality, overridetier) {
    standardorigin = ter_op(isdefined(level.var_f0872e42daf6d4d5), level.var_f0872e42daf6d4d5, origin);
    var_ca38685e5bf373f4 = (0, 0, 0);
    maxriders = 7;
    switch (heli_type) {
    case #"hash_835a3b4bb4e34233":
        maxriders = 8;
        break;
    case #"hash_9d4e22a00fc630b5":
        maxriders = 6;
        break;
    default:
        break;
    }
    if (numriders > maxriders) {
        numriders = maxriders;
    }
    riders = [];
    if (!isdefined(category)) {
        category = "reinforcements";
    }
    var_644d90de7685f75 = function_8c6dbb64c8e1603c(numriders, category, origin, poiname, 0);
    if (!var_644d90de7685f75 && !namespace_bfef6903bca5845d::function_359f24553bdcca92(numriders, priority)) {
        /#
            msg = "<unknown string>" + numriders + "<unknown string>";
            println(msg);
        #/
        return riders;
    }
    if (isdefined(var_ec862c2c00c7ab5d)) {
        for (i = 0; i < numriders; i++) {
            riders[i] = spawnstruct();
            riders[i].origin = standardorigin;
            riders[i].angles = var_ca38685e5bf373f4;
            if (!isdefined(nationality)) {
                nationality = undefined;
                if (isdefined(level.teamnationality) && isdefined(level.teamnationality[team])) {
                    nationality = level.teamnationality[team];
                }
            }
            if (isdefined(var_ec862c2c00c7ab5d.requests[i])) {
                riders[i].aitype = function_7f1a2e2ebe0c1693(var_ec862c2c00c7ab5d.requests[i].type, default_to(overridetier, var_ec862c2c00c7ab5d.requests[i].tier), default_to(var_ec862c2c00c7ab5d.requests[i].nationality, nationality));
                continue;
            }
            if (var_ec862c2c00c7ab5d.requests.size) {
                riders[i].aitype = function_7f1a2e2ebe0c1693(var_ec862c2c00c7ab5d.requests[0].type, default_to(overridetier, var_ec862c2c00c7ab5d.requests[0].tier), default_to(var_ec862c2c00c7ab5d.requests[0].nationality, nationality));
                continue;
            }
            aitype = function_d5bc07eabf352abb(undefined, poiname, undefined, undefined, overridetier);
        }
    } else {
        for (i = 0; i < numriders; i++) {
            aitype = function_d5bc07eabf352abb(undefined, poiname, undefined, undefined, overridetier, nationality);
            riders[i] = spawnstruct();
            riders[i].origin = standardorigin;
            riders[i].angles = var_ca38685e5bf373f4;
            riders[i].aitype = aitype;
        }
    }
    return riders;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e58
// Size: 0x141
function function_7045fb761a4998e3(vehicle) {
    drivermodels = ["aq_pilot_fullbody_1", "aq_pilot_fullbody_2"];
    pilot_num = 2;
    if (!isdefined(level.ai_spawn_vehicle_func)) {
        level.ai_spawn_vehicle_func = [];
    }
    if (!isdefined(level.vehicle_ai_script_models)) {
        level.vehicle_ai_script_models = [];
    }
    fake_guys = [];
    for (i = 0; i < pilot_num; i++) {
        struct = level.vehicle.templates.aianims[function_29b4292c92443328(vehicle function_d93ec4635290febd()).ai.classname][i];
        tag = struct.sittag;
        fake_guy = vehicle function_97dc419ef1552c44(i, tag, struct.idle_anim, struct.idle, drivermodels[i]);
        fake_guys[fake_guys.size] = fake_guy;
        level.vehicle_ai_script_models[level.vehicle_ai_script_models.size] = fake_guy;
        vehicle thread function_c69ae9cd7a024f7a(fake_guys);
    }
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fa0
// Size: 0x3c
function function_c69ae9cd7a024f7a(fake_guys) {
    self waittill("death");
    if (isdefined(fake_guys)) {
        for (i = 0; i < fake_guys.size; i++) {
            fake_guys[i] function_3a1b698f5e1a66da();
        }
    }
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
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

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3025
// Size: 0x13d
function function_97dc419ef1552c44(posindex, tag, animname, xanim, model) {
    /#
        assertex(!istrue(self.usedpositions[posindex]), "Trying to assign to a position already in use");
    #/
    spawnorg = self gettagorigin(tag);
    spawnang = self gettagangles(tag);
    startorg = getstartorigin(spawnorg, spawnang, xanim);
    startangles = getstartangles(spawnorg, spawnang, xanim);
    spawned = spawn("script_model", startorg);
    spawned.angles = startangles;
    spawned setmodel(model);
    spawned linkto(self);
    if (isdefined(animname)) {
        spawned scriptmodelplayanim(animname);
    } else if (isdefined(xanim)) {
        spawned scriptmodelplayanim(xanim);
    }
    spawned.vehicle_position = posindex;
    spawned.disable_gun_recall = 1;
    self.attachedguys[self.attachedguys.size] = spawned;
    self.usedpositions[posindex] = 1;
    if (posindex == 0) {
        self.driver = spawned;
    }
    return spawned;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
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
    while (true) {
        amount, attacker, unused, point = self waittill("damage");
        if (isdefined(attacker) && isplayer(attacker) && isdefined(amount) && amount > 0 && isdefined(point)) {
            if (var_c2f1ca305ee16808 tagexists("j_head")) {
                head_pos = var_c2f1ca305ee16808 gettagorigin("j_head");
            } else {
                head_pos = var_c2f1ca305ee16808.origin + (0, 0, 50);
            }
            head_pos = head_pos + (0, 0, -20);
            start_point = attacker geteye();
            vec_shot = vectornormalize(point - start_point);
            vec_head = vectornormalize(head_pos - start_point);
            hit_dot = vectordot(vec_shot, vec_head);
            veh_dot = vectordot(vectornormalize(anglestoforward(self.angles)), vectornormalize(point - self.origin));
            seat_pos = var_c2f1ca305ee16808.origin + (0, 0, 18);
            if (hit_dot > 0.99975 && veh_dot > 0.73 && point[2] > seat_pos[2]) {
                var_4116e8fd5da7b698 = var_4116e8fd5da7b698 - amount;
                if (var_4116e8fd5da7b698 <= 0) {
                    self notify("death", attacker);
                }
            }
        }
    }
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x333e
// Size: 0x2a
function function_e7d3411db935e99b(pos) {
    self endon("death");
    wait(2);
    self.vehicle_position = pos;
    self.script_startingposition = pos;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x336f
// Size: 0x1d7
function function_88982797150bf237(vehicle, var_a4e4a71852a83d8f, var_ebc42e43f4b05504) {
    vehicle endon("death");
    riders = vehicle.riders;
    if (!istrue(var_ebc42e43f4b05504) && isdefined(var_a4e4a71852a83d8f.reinforceorigin)) {
        foreach (rider in riders) {
            scripts/mp/ai_behavior::function_bd9acc7c99ad884(rider, var_a4e4a71852a83d8f.reinforceorigin, undefined, var_a4e4a71852a83d8f.goalradius, var_a4e4a71852a83d8f.var_21f24aecb313e479, 0, riders);
        }
    }
    vehicle waittill("unloaded");
    reinforceorigin = var_a4e4a71852a83d8f.reinforceorigin;
    if (!isdefined(reinforceorigin)) {
        reinforceorigin = function_a130de01f9e62aa4(vehicle.origin);
    }
    wait(1);
    foreach (rider in riders) {
        if (!istrue(var_ebc42e43f4b05504)) {
            /#
                assertex(distance(var_a4e4a71852a83d8f.reinforceorigin, rider.origin) < 12500, "heli_postUnload: combat rush (" + reinforceorigin + ") is too far from where the agents were dropped off (" + rider.origin + ")");
            #/
            rider thread scripts/mp/ai_behavior::function_a5117518725da028(rider, reinforceorigin, undefined, var_a4e4a71852a83d8f.goalradius, var_a4e4a71852a83d8f.var_21f24aecb313e479, 0, riders);
        }
        if (isdefined(rider.var_b582b10663b5b2a9) && !rider.var_b582b10663b5b2a9) {
            continue;
        }
        rider thread function_e42f5ec55b8546b();
    }
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x354d
// Size: 0x18
function function_e42f5ec55b8546b() {
    self endon("death");
    wait(10);
    self.var_b582b10663b5b2a9 = 1;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x356c
// Size: 0x1eb
function function_a130de01f9e62aa4(origin, toleranceoverride) {
    if (level.heliReinforceStruct.postlandingdest.size == 0) {
        radius = 1000;
        var_c154e6e386654a30 = 50;
        min = radius - var_c154e6e386654a30;
        max = radius + var_c154e6e386654a30;
        random_x = randomfloatrange(min, max) * scripts/engine/utility::ter_op(randomint(100) > 50, 1, -1);
        random_y = randomfloatrange(min, max) * scripts/engine/utility::ter_op(randomint(100) > 50, 1, -1);
        var_28545e194202f384 = (origin[0] + random_x, origin[1] + random_y, origin[2]);
        return getclosestpointonnavmesh(var_28545e194202f384);
    }
    closenodes = [];
    closestnode = undefined;
    closestdist = 2500000000;
    maxdist = ter_op(isdefined(toleranceoverride), toleranceoverride, 12250000);
    foreach (node in level.heliReinforceStruct.postlandingdest) {
        dist = distance2dsquared(origin, node.origin);
        if (!isdefined(closestnode) || closestdist > dist) {
            closestnode = node;
            closestdist = dist;
        }
        if (dist < maxdist) {
            closenodes[closenodes.size] = node;
        }
    }
    if (closenodes.size > 0) {
        return getclosestpointonnavmesh(random(closenodes).origin);
    }
    return getclosestpointonnavmesh(closestnode.origin);
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x375e
// Size: 0x9d
function function_16c5ca10b4c664a7(nodes, override) {
    if (istrue(override)) {
        level.heliReinforceStruct.postlandingdest = [];
    }
    foreach (node in nodes) {
        level.heliReinforceStruct.postlandingdest[level.heliReinforceStruct.postlandingdest.size] = node;
    }
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3802
// Size: 0x16
function function_bf8ab11dd9e76f93(function) {
    level.var_4eb71f2b8cba5cb = function;
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x381f
// Size: 0x59
function function_4a64c621dd8090ab(heli_type, riders, nationality) {
    if (heli_type == "little_bird") {
        if (isdefined(nationality)) {
            if (nationality == "merc" || nationality == "ru") {
                return "black";
            }
            if (nationality == "cartel") {
                return "yellow";
            }
        }
    }
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x387f
// Size: 0x17c
function function_cd8465a96bf94b14(var_a4e4a71852a83d8f, vehicle) {
    /#
        if (getdvarint(@"hash_cc62b45cdbe0ddc1", 0) == 1) {
            thread scripts/mp/utility/debug::drawsphere(var_a4e4a71852a83d8f.origin, 128, 45, (1, 0, 0));
            thread scripts/mp/utility/debug::drawsphere(var_a4e4a71852a83d8f.unloadorigin, 128, 45, (0, 1, 0));
            thread scripts/mp/utility/debug::drawsphere(var_a4e4a71852a83d8f.reinforceorigin, 128, 45, (0, 0, 1));
            if (isdefined(var_a4e4a71852a83d8f.origin) && isdefined(var_a4e4a71852a83d8f.unloadorigin)) {
                thread scripts/cp_mp/utility/debug_utility::drawline(var_a4e4a71852a83d8f.origin, var_a4e4a71852a83d8f.unloadorigin, 45, (1, 0, 0));
            }
            if (isdefined(vehicle.origin) && isdefined(var_a4e4a71852a83d8f.unloadorigin)) {
                thread scripts/cp_mp/utility/debug_utility::drawline(vehicle.origin, var_a4e4a71852a83d8f.unloadorigin, 45, (0, 1, 0));
            }
            if (isdefined(var_a4e4a71852a83d8f.unloadorigin) && isdefined(var_a4e4a71852a83d8f.reinforceorigin)) {
                thread scripts/cp_mp/utility/debug_utility::drawline(var_a4e4a71852a83d8f.unloadorigin, var_a4e4a71852a83d8f.reinforceorigin, 45, (0, 0, 1));
            }
        }
    #/
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a02
// Size: 0x57b
function function_d3d8ae54f1db925() {
    /#
        while (true) {
            if (getdvarint(@"hash_44d7ef19e2c9454e", 0) == 1) {
                if (function_47d356083884f913()) {
                    foreach (poiname, poi in level.poi) {
                        foreach (node in level.poi[poiname]["<unknown string>"].pathstartnodes) {
                            thread scripts/mp/utility/debug::drawsphere(node.origin, 64, 1, (0, 1, 0));
                            print3d(node.origin, poiname, (0, 1, 0), 1, 1, 20);
                        }
                        foreach (node in level.poi[poiname]["<unknown string>"].unload_locs) {
                            thread scripts/mp/utility/debug::drawsphere(node.origin, 64, 1, (1, 1, 0.3));
                            print3d(node.origin, poiname, (1, 1, 0.3), 1, 1, 20);
                        }
                        foreach (node in level.poi[poiname]["<unknown string>"].exitstructs) {
                            thread scripts/mp/utility/debug::drawsphere(node.origin, 64, 1, (1, 0, 0));
                            print3d(node.origin, poiname, (1, 0, 0), 1, 1, 20);
                        }
                    }
                } else {
                    foreach (i, node in level.heliReinforceStruct.pathstartnodes) {
                        thread scripts/mp/utility/debug::drawsphere(node.origin, 64, 1, (0, 1, 0));
                        print3d(node.origin, i, (1, 1, 1), 1, 3, 1000, 1);
                    }
                    foreach (i, node in level.heliReinforceStruct.unload_locs) {
                        thread scripts/mp/utility/debug::drawsphere(node.origin, 64, 1, (1, 1, 0.3));
                        print3d(node.origin, i, (1, 1, 1), 1, 3, 1000, 1);
                    }
                    foreach (i, node in level.var_3122f605f0e8e125) {
                        thread scripts/mp/utility/debug::drawsphere(node.origin, 64, 1, (1, 0, 0));
                        print3d(node.origin, i, (1, 1, 1), 1, 3, 1000, 1);
                    }
                }
            }
            if (getdvarint(@"hash_83158ef84a03a108", 0) == 1) {
                if (function_47d356083884f913()) {
                    foreach (poiname, poi in level.poi) {
                        foreach (dest in level.poi[poiname]["<unknown string>"].postlandingdest) {
                            thread scripts/mp/utility/debug::drawsphere(dest.origin, 64, 1, (1, 0, 1));
                        }
                    }
                } else {
                    foreach (node in level.heliReinforceStruct.postlandingdest) {
                        thread scripts/mp/utility/debug::drawsphere(node.origin, 64, 1, (1, 0, 1));
                    }
                }
            }
            wait(1);
        }
    #/
}

// Namespace namespace_f3747e64a39c0f46 / namespace_7ae25d9e5d5a28ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f84
// Size: 0x5f
function function_6bbc2202f6cb024d() {
    /#
        startagain = 1;
        while (true) {
            if (getdvarint(@"hash_31aabcc3ae1ae28b", 0) == 1) {
                if (startagain) {
                    startagain = 0;
                    level thread namespace_7ae25d9e5d5a28ef::function_8062c7f3856760fc();
                }
            } else {
                level notify("<unknown string>");
                level.forceclosest = undefined;
                startagain = 1;
            }
            wait(0.1);
        }
    #/
}

