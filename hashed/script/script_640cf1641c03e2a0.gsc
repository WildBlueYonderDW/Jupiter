// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_48814951e916af89;
#using script_5def7af2a9f04234;
#using script_120270bd0a747a35;
#using script_747ad1ab3322f8bc;
#using scripts\mp\utility\debug.gsc;

#namespace namespace_39878ad79a617fab;

// Namespace namespace_39878ad79a617fab/namespace_885300a47c2b51e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x182
// Size: 0x38
function function_ca39a413ace3c168() {
    setdvar(@"hash_cc838a8ebb92734", 0);
    level.parareinforcestruct = spawnstruct();
    function_97af096f73d8367a();
    function_7dccce8c87ea644();
    level thread function_a6193ffd30278d98();
}

// Namespace namespace_39878ad79a617fab/namespace_885300a47c2b51e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c1
// Size: 0x45
function function_97af096f73d8367a() {
    while (!flag_exist("create_script_initialized")) {
        waitframe();
    }
    flag_wait("create_script_initialized");
    level.parareinforcestruct.var_301d639da97100c9 = getstructarray("para_landingSpot", "script_noteworthy");
}

// Namespace namespace_39878ad79a617fab/namespace_885300a47c2b51e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d
// Size: 0x233
function function_7dccce8c87ea644() {
    while (!flag_exist("create_script_initialized")) {
        waitframe();
    }
    flag_wait("create_script_initialized");
    waitframe();
    if (function_47d356083884f913()) {
        while (level.poi.size == 0) {
            waitframe();
        }
        waitframe();
        foreach (poiname, poi in level.poi) {
            struct = spawnstruct();
            struct.var_e574839e9e50e6a7 = [];
            struct.var_932a9b3d757d01e9 = [];
            struct.var_301d639da97100c9 = [];
            if (istrue(level.var_4cfd75aa6ddde156)) {
                struct.var_e574839e9e50e6a7 = getstructarray("ac130_enter", "targetname");
                struct.var_932a9b3d757d01e9 = getstructarray("ac130_exit", "targetname");
                struct.var_301d639da97100c9 = getstructarray("para_landingSpot", "script_noteworthy");
                level.poi[poiname]["paraReinforceStruct"] = struct;
            } else {
                struct.var_e574839e9e50e6a7 = function_9656b61cc8a37cba(getstructarray("ac130_enter", "targetname"), poiname);
                struct.var_932a9b3d757d01e9 = function_9656b61cc8a37cba(getstructarray("ac130_exit", "targetname"), poiname);
                struct.var_301d639da97100c9 = function_9656b61cc8a37cba(getstructarray("para_landingSpot", "script_noteworthy"), poiname);
                level.poi[poiname]["paraReinforceStruct"] = struct;
            }
        }
    } else {
        level.parareinforcestruct = spawnstruct();
        level.parareinforcestruct.var_e574839e9e50e6a7 = getstructarray("ac130_enter", "targetname");
        level.parareinforcestruct.var_932a9b3d757d01e9 = getstructarray("ac130_exit", "targetname");
        level.parareinforcestruct.var_301d639da97100c9 = getstructarray("para_landingSpot", "script_noteworthy");
    }
}

// Namespace namespace_39878ad79a617fab/namespace_885300a47c2b51e6
// Params 17, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x447
// Size: 0x367
function function_55ab9c6da96226e7(var_4af808cb9330a11a, var_c5e7fce963586ec0, var_3b496abb2047566b, var_ec862c2c00c7ab5d, priority, category, subcategory, team, var_93390a6953905fef, poiname, var_e7b52c5baf6d8be2, var_94ba23284fa98c04, var_8890c242b55dbff1, var_f891e067b8802c0d, tier, var_4f200828059689db, nationality) {
    if (isdefined(level.radiation) && istrue(level.radiation.var_9badbb469626f6)) {
        return;
    }
    if (!isdefined(var_4af808cb9330a11a)) {
        var_4af808cb9330a11a = 5;
    }
    if (!isdefined(poiname)) {
        poiname = function_6cc445c02b5effac(var_c5e7fce963586ec0);
    }
    if (!isdefined(var_4f200828059689db)) {
        var_4f200828059689db = 2048;
    }
    var_c5e7fce963586ec0 = namespace_2000a83505151e5b::function_d378cc95abab583b(var_c5e7fce963586ec0, poiname);
    var_c5e7fce963586ec0 = getclosestpointonnavmesh(var_c5e7fce963586ec0);
    var_8af454aaf592b9ba = function_2673db74633ed911(var_c5e7fce963586ec0, poiname);
    if (!isdefined(var_8af454aaf592b9ba)) {
        var_8af454aaf592b9ba = var_c5e7fce963586ec0;
    }
    spawners = undefined;
    if (isdefined(var_ec862c2c00c7ab5d) && isdefined(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f)) {
        spawners = var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f;
    }
    spawners = function_984016d3b51024a2(var_4af808cb9330a11a, var_8af454aaf592b9ba, spawners, priority, category, poiname, 512, tier, team, nationality);
    if (!isdefined(spawners) || spawners.size == 0) {
        return;
    }
    spawner = spawners[0];
    var_a9b1da94e346bba3 = ter_op(isdefined(var_3b496abb2047566b), var_3b496abb2047566b, 7000);
    var_1e4bce6c927436e0 = spawner.parachute_land_origin + (0, 0, var_a9b1da94e346bba3);
    if (!isdefined(var_e7b52c5baf6d8be2)) {
        var_e7b52c5baf6d8be2 = (0, randomintrange(1, 360), 0);
    }
    var_cd36c086ac42b7c6 = var_1e4bce6c927436e0 - anglestoforward(var_e7b52c5baf6d8be2) * 512 * var_4af808cb9330a11a / 2;
    var_b8520b1249abbb07 = undefined;
    if (!isdefined(var_e7b52c5baf6d8be2)) {
        var_b8520b1249abbb07 = function_9e7d8e0b07e473f0(var_1e4bce6c927436e0, poiname);
    } else {
        var_b8520b1249abbb07 = var_1e4bce6c927436e0 - anglestoforward(var_e7b52c5baf6d8be2) * 40000;
    }
    if (istrue(var_8890c242b55dbff1)) {
        foreach (spawner in spawners) {
            spawner.origin = var_c5e7fce963586ec0 + (0, 0, var_a9b1da94e346bba3) + (randomfloatrange(-128, 128), randomfloatrange(-128, 128), 0);
        }
        return function_4f963624aaba7f77(spawners, team, var_c5e7fce963586ec0, priority, category, subcategory, var_94ba23284fa98c04, var_4f200828059689db, var_f891e067b8802c0d);
    } else {
        ac130 = namespace_c0945f72aac1f0a::function_35669831b02dc8fa(var_b8520b1249abbb07, var_cd36c086ac42b7c6, -2000);
        /#
            println("<unknown string>");
        #/
        foreach (spawner in spawners) {
            spawner.origin = ac130.origin;
        }
        heading = vectornormalize(var_1e4bce6c927436e0 - var_b8520b1249abbb07);
        var_f7df9b6a197040a2 = ac130.origin + heading * 60000;
        ac130 thread namespace_c0945f72aac1f0a::function_16dfd690940ae271(var_f7df9b6a197040a2);
        return function_4f963624aaba7f77(spawners, team, var_c5e7fce963586ec0, priority, category, subcategory, var_94ba23284fa98c04, var_4f200828059689db, 1, ac130);
    }
}

// Namespace namespace_39878ad79a617fab/namespace_885300a47c2b51e6
// Params 10, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7b5
// Size: 0x1d0
function private function_4f963624aaba7f77(spawners, team, var_c5e7fce963586ec0, priority, category, subcategory, var_94ba23284fa98c04, var_4f200828059689db, var_f891e067b8802c0d, ac130) {
    riders = [];
    var_19fa2154a6002ec3 = 0;
    foreach (spawner in spawners) {
        spawner.script_demeanor = undefined;
        rider = ai_mp_requestspawnagent(spawner.aitype, spawner.origin, spawner.angles, priority, category, subcategory, undefined, team, undefined, undefined, var_f891e067b8802c0d, undefined, 0);
        if (isdefined(rider)) {
            rider.var_b582b10663b5b2a9 = 0;
            rider.spawnpoint = spawner;
            rider.var_48713689eb4db4b4 = undefined;
            if (namespace_3c37cb17ade254d::issharedfuncdefined("paraReinforce", "onChutePull")) {
                rider.var_48713689eb4db4b4 = namespace_3c37cb17ade254d::getsharedfunc("paraReinforce", "onChutePull");
            }
            rider.var_55ddeb59df2dee74 = &function_fa870422edefd17d;
            rider.var_c5e7fce963586ec0 = var_c5e7fce963586ec0;
            rider.ac130 = ter_op(isdefined(ac130), ac130, rider);
            rider thread namespace_c0945f72aac1f0a::create_paratrooper(var_19fa2154a6002ec3, var_4f200828059689db);
            riders[riders.size] = rider;
            if (isdefined(var_94ba23284fa98c04)) {
                thread [[ var_94ba23284fa98c04 ]](rider);
            }
            rider setscriptablepartstate("skydiveVfx", "enabled", 0);
        }
        wait(randomfloatrange(0.1, 0.75));
    }
    return riders;
}

// Namespace namespace_39878ad79a617fab/namespace_885300a47c2b51e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98d
// Size: 0x1d
function function_6a8ad55c5a4036d1() {
    thread namespace_2000a83505151e5b::function_a5117518725da028(self, self.var_c5e7fce963586ec0, 768, undefined, 1024, 0);
}

// Namespace namespace_39878ad79a617fab/namespace_885300a47c2b51e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b1
// Size: 0x33
function function_fa870422edefd17d() {
    self setscriptablepartstate("skydiveVfx", "default", 0);
    self playsound("mp_parachute_land_ally");
    self notify("para_landed");
    level thread namespace_2000a83505151e5b::function_5d96b05a065564e(self);
}

// Namespace namespace_39878ad79a617fab/namespace_885300a47c2b51e6
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9eb
// Size: 0x2e1
function function_984016d3b51024a2(var_4af808cb9330a11a, origin, spawners, priority, category, poiname, var_5d0b62df4c7d5d12, tier, team, nationality) {
    if (!isdefined(category)) {
        category = "reinforcements";
    }
    var_644d90de7685f75 = function_8c6dbb64c8e1603c(var_4af808cb9330a11a, category, origin, poiname, 0);
    if (!var_644d90de7685f75 && !function_359f24553bdcca92(var_4af808cb9330a11a, priority)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return;
    }
    if (!isdefined(spawners)) {
        spawners = [];
        var_efa35ded043e4a0f = [];
        var_3c6bec636ac35df8 = [0:-150, 1:-75, 2:0, 3:75, 4:150];
        for (i = 0; i < 5; i++) {
            for (j = 0; j < 5; j++) {
                offset = (var_3c6bec636ac35df8[i], var_3c6bec636ac35df8[j], 0);
                var_1bdc9c3696cabf65 = spawnstruct();
                var_1bdc9c3696cabf65.origin = origin + offset;
                landing_spot = getgroundposition(var_1bdc9c3696cabf65.origin, 64);
                var_efa35ded043e4a0f[var_efa35ded043e4a0f.size] = var_1bdc9c3696cabf65;
            }
        }
        var_efa35ded043e4a0f = array_randomize(var_efa35ded043e4a0f);
    } else {
        var_efa35ded043e4a0f = spawners;
    }
    if (var_4af808cb9330a11a > var_efa35ded043e4a0f.size) {
        var_4af808cb9330a11a = var_efa35ded043e4a0f.size;
    }
    for (i = 0; i < var_4af808cb9330a11a; i++) {
        if (!isdefined(var_efa35ded043e4a0f[i])) {
            continue;
        }
        spawners[i] = var_efa35ded043e4a0f[i];
        spawners[i].angles = (0, 0, 0);
        spawners[i].allow_momentum = 1;
        if (!isdefined(spawners[i].parachute_land_origin)) {
            if (!isdefined(spawners[i].origin)) {
                spawners[i].origin = origin;
            }
            spawners[i].parachute_land_origin = spawners[i].origin;
        }
        if (isdefined(spawners[i].tier)) {
            tier = spawners[i].tier;
        }
        if (!isdefined(nationality)) {
            nationality = undefined;
            if (isdefined(level.var_72f834b3f8b2a366) && isdefined(level.var_72f834b3f8b2a366[team])) {
                nationality = level.var_72f834b3f8b2a366[team];
            }
        }
        if (!isdefined(spawners[i].aitype)) {
            aitype = undefined;
            if (isdefined(spawners[i].type)) {
                aitype = function_7f1a2e2ebe0c1693(spawners[i].type, tier, nationality);
            } else {
                aitype = function_d5bc07eabf352abb(undefined, poiname, undefined, undefined, tier, nationality);
            }
            spawners[i].aitype = aitype;
        }
    }
    return spawners;
}

// Namespace namespace_39878ad79a617fab/namespace_885300a47c2b51e6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd4
// Size: 0x1d0
function function_2673db74633ed911(origin, poiname) {
    var_f32859820cd51fe = [];
    if (function_47d356083884f913()) {
        if (!isdefined(poiname)) {
            poiname = function_6cc445c02b5effac(origin, 0, 1);
        }
        if (!isdefined(level.poi[poiname]["paraReinforceStruct"].var_301d639da97100c9) || level.poi[poiname]["paraReinforceStruct"].var_301d639da97100c9.size == 0) {
            return;
        }
        var_f32859820cd51fe = level.poi[poiname]["paraReinforceStruct"].var_301d639da97100c9;
    } else {
        if (!isdefined(level.parareinforcestruct.var_301d639da97100c9) || level.parareinforcestruct.var_301d639da97100c9.size == 0) {
            return;
        }
        var_f32859820cd51fe = level.parareinforcestruct.var_301d639da97100c9;
    }
    if (isdefined(origin)) {
        var_bb1b37bc627cb745 = sortbydistance(level.parareinforcestruct.var_301d639da97100c9, origin);
        var_f32859820cd51fe = [];
        foreach (loc in var_bb1b37bc627cb745) {
            dist = distance2dsquared(loc.origin, origin);
            if (dist > 65536 && dist < 2250000) {
                var_f32859820cd51fe[var_f32859820cd51fe.size] = loc;
            }
        }
        if (var_f32859820cd51fe.size > 0) {
            return random(var_f32859820cd51fe).origin;
        } else {
            return var_bb1b37bc627cb745[0].origin;
        }
    }
    return random(var_f32859820cd51fe).origin;
}

// Namespace namespace_39878ad79a617fab/namespace_885300a47c2b51e6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeac
// Size: 0xf6
function function_9e7d8e0b07e473f0(origin, poiname) {
    var_f32859820cd51fe = [];
    if (function_47d356083884f913()) {
        if (!isdefined(poiname)) {
            poiname = function_6cc445c02b5effac(origin, 0, 1);
        }
        if (!isdefined(level.poi[poiname]["paraReinforceStruct"].var_e574839e9e50e6a7) || level.poi[poiname]["paraReinforceStruct"].var_e574839e9e50e6a7.size == 0) {
            return;
        }
        var_f32859820cd51fe = level.poi[poiname]["paraReinforceStruct"].var_e574839e9e50e6a7;
    } else {
        if (!isdefined(level.parareinforcestruct.var_e574839e9e50e6a7) || level.parareinforcestruct.var_e574839e9e50e6a7.size == 0) {
            return;
        }
        var_f32859820cd51fe = level.parareinforcestruct.var_e574839e9e50e6a7;
    }
    return random(var_f32859820cd51fe).origin;
}

// Namespace namespace_39878ad79a617fab/namespace_885300a47c2b51e6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfaa
// Size: 0xf6
function function_1cd198f23cffc84f(origin, poiname) {
    var_f32859820cd51fe = [];
    if (function_47d356083884f913()) {
        if (!isdefined(poiname)) {
            poiname = function_6cc445c02b5effac(origin, 0, 1);
        }
        if (!isdefined(level.poi[poiname]["paraReinforceStruct"].var_932a9b3d757d01e9) || level.poi[poiname]["paraReinforceStruct"].var_932a9b3d757d01e9.size == 0) {
            return;
        }
        var_f32859820cd51fe = level.poi[poiname]["paraReinforceStruct"].var_932a9b3d757d01e9;
    } else {
        if (!isdefined(level.parareinforcestruct.var_932a9b3d757d01e9) || level.parareinforcestruct.var_932a9b3d757d01e9.size == 0) {
            return;
        }
        var_f32859820cd51fe = level.parareinforcestruct.var_932a9b3d757d01e9;
    }
    return random(var_f32859820cd51fe).origin;
}

// Namespace namespace_39878ad79a617fab/namespace_885300a47c2b51e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a8
// Size: 0x9e
function function_a6193ffd30278d98() {
    while (1) {
        if (getdvarint(@"hash_cc838a8ebb92734", 0) == 1) {
            foreach (node in level.parareinforcestruct.var_301d639da97100c9) {
                thread namespace_d028276791d9cff6::drawsphere(node.origin, 64, 1, (0, 1, 0));
            }
        }
        wait(1);
    }
}

// Namespace namespace_39878ad79a617fab/namespace_885300a47c2b51e6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x114d
// Size: 0x9e
function function_9dfd191f35f0c0eb() {
    while (1) {
        if (getdvarint(@"hash_2f74ed938ab306ba", 0) == 1) {
            foreach (node in level.parareinforcestruct.var_301d639da97100c9) {
                thread namespace_d028276791d9cff6::drawsphere(node.origin, 64, 1, (0, 1, 0));
            }
        }
        wait(1);
    }
}

