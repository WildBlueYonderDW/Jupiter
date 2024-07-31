#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\throttle.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\debug.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using scripts\mp\gametypes\br_bunker_utility.gsc;
#using scripts\mp\flags.gsc;
#using script_67fb1233e876ed8;
#using scripts\mp\utility\debug.gsc;

#namespace namespace_3f34405c51e49637;

// Namespace namespace_3f34405c51e49637 / namespace_76ebb832f1cbeaa
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac
// Size: 0x172
function init(var_224bf1253364b30a, var_487aa685c1c31808, var_3b24d8dc30ca944b, spawnitemsratio) {
    if (getdvarint(@"hash_2bd08bfff808053a", 1) && getdvarint(@"hash_89be1a979c1ec008", 0)) {
        var_85fc2214cea298e4 = function_8385f4c035230abe();
        if (var_85fc2214cea298e4) {
            assert(!isdefined(var_224bf1253364b30a) && !isdefined(var_487aa685c1c31808), "<dev string:x1c>");
            return;
        }
    }
    /#
        init_debug(var_224bf1253364b30a, var_487aa685c1c31808);
    #/
    level waittill("prematch_over");
    if (!isdefined(level.brgametype)) {
        return;
    }
    level.stagedItemsSpawnThrottle = throttle_initialize("stagedItemsSpawnThrottle", 2, level.framedurationseconds, 16);
    if (getdvarint(@"hash_22bdd6f7e2988733", 1) == 1) {
        if (isdefined(var_224bf1253364b30a)) {
            level.brgametype.var_fc940842d42c2893 = getscriptbundle(var_224bf1253364b30a);
            if (!isdefined(var_3b24d8dc30ca944b)) {
                var_3b24d8dc30ca944b = getdvarfloat(@"hash_c7995999ec4e8cf4", 0.6);
            }
            function_83f276ef36c2e4ab(level.brgametype.var_fc940842d42c2893, var_3b24d8dc30ca944b);
        }
    }
    if (getdvarint(@"hash_6f8a167abf7e11e0", 1) == 1) {
        if (isdefined(var_487aa685c1c31808)) {
            var_428c9aad17e4e279 = getscriptbundle(var_487aa685c1c31808);
            if (!isdefined(spawnitemsratio)) {
                spawnitemsratio = getdvarfloat(@"hash_809ccd5453be062", 0.6);
            }
            function_83f276ef36c2e4ab(var_428c9aad17e4e279, spawnitemsratio);
        }
    }
}

// Namespace namespace_3f34405c51e49637 / namespace_76ebb832f1cbeaa
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x326
// Size: 0x1a8
function function_83f276ef36c2e4ab(var_428c9aad17e4e279, spawnratio) {
    if (!isdefined(var_428c9aad17e4e279)) {
        return;
    }
    var_bed8b702214653a5 = var_428c9aad17e4e279.var_6c073ecdc1c6dba5;
    if (var_bed8b702214653a5.size == 0) {
        return;
    }
    totalspawns = math::round_float(spawnratio * var_bed8b702214653a5.size, 0, 0);
    spawnlist = [];
    spawnlistweight = 0;
    priorityspawns = 0;
    foreach (item in var_bed8b702214653a5) {
        if (istrue(item.forcespawn)) {
            thread function_77708fbf186d74d6(item);
            priorityspawns++;
            continue;
        }
        spawnlist[spawnlist.size] = item;
        spawnlistweight += item.weight;
    }
    spawnlist = array_randomize(spawnlist);
    for (i = priorityspawns; i < totalspawns; i++) {
        spawnitem = undefined;
        weighttarget = randomfloat(spawnlistweight);
        foreach (item in spawnlist) {
            weighttarget -= item.weight;
            if (weighttarget <= 0) {
                spawnitem = item;
                break;
            }
        }
        thread function_77708fbf186d74d6(spawnitem);
        spawnlistweight -= spawnitem.weight;
        spawnlist = array_remove(spawnlist, item);
    }
}

// Namespace namespace_3f34405c51e49637 / namespace_76ebb832f1cbeaa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d6
// Size: 0x118
function function_77708fbf186d74d6(stageditem) {
    if (!isdefined(stageditem)) {
        return;
    }
    var_7957ae38c168f3df = stageditem.var_d2d351beaab03413;
    if (!scripts\mp\gametypes\br_lootcache::canspawnitemname(var_7957ae38c168f3df)) {
        return;
    }
    spawnpositions = stageditem.var_96c78bfdaf20aa5a;
    if (scripts\mp\gametypes\br_pickups::function_1be34022a4acce73(var_7957ae38c168f3df)) {
        count = undefined;
    } else if (scripts\mp\gametypes\br_pickups::isgasmask(var_7957ae38c168f3df)) {
        count = scripts\cp_mp\gasmask::getmaxhealth(var_7957ae38c168f3df);
    } else {
        count = scripts\mp\gametypes\br_bunker_utility::getitemcount(var_7957ae38c168f3df);
    }
    randomspawnpos = randomint(spawnpositions.size);
    origin = function_57718c5233376cf1(spawnpositions[randomspawnpos].spawnorigin);
    angles = function_57718c5233376cf1(spawnpositions[randomspawnpos].spawnangle);
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(origin, angles);
    function_f632348cbb773537(level.stagedItemsSpawnThrottle, stageditem);
    scriptable = scripts\mp\gametypes\br_pickups::spawnpickup(var_7957ae38c168f3df, dropinfo, count, 0);
    scriptable.criticalitem = 1;
}

// Namespace namespace_3f34405c51e49637 / namespace_76ebb832f1cbeaa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f6
// Size: 0x4e
function function_57718c5233376cf1(vector) {
    return (default_to(vector.x, 0), default_to(vector.y, 0), default_to(vector.z, 0));
}

// Namespace namespace_3f34405c51e49637 / namespace_76ebb832f1cbeaa
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x64d
// Size: 0x124
function private function_8385f4c035230abe() {
    var_6731622e5983330e = getstructarray("staged_item", "script_noteworthy");
    var_312c925211ea7c91 = [];
    foreach (stageditem in var_6731622e5983330e) {
        var_b0112b6173fb6a58 = stageditem.targetname;
        if (isdefined(var_b0112b6173fb6a58)) {
            var_312c925211ea7c91 = function_6d6af8144a5131f1(var_312c925211ea7c91, var_b0112b6173fb6a58);
        }
    }
    if (var_312c925211ea7c91.size == 0) {
        return false;
    }
    scripts\mp\flags::function_1240434f4201ac9d("ssc_initialized");
    foreach (var_b0112b6173fb6a58 in var_312c925211ea7c91) {
        if (getdvarint(hashcat(@"hash_ea224dc24c0b7e07", var_b0112b6173fb6a58), 1)) {
            namespace_7052decdced06e44::function_4f7660cfd85cd517(var_b0112b6173fb6a58, &function_79691f9f27624735);
            namespace_7052decdced06e44::function_412f527ef0863f0e(var_b0112b6173fb6a58, &function_c4b0ccbcd6f0113a);
            namespace_7052decdced06e44::function_eded5b87f8f7bdfd(var_b0112b6173fb6a58, &function_673f910f067ac67a);
        }
    }
    return true;
}

// Namespace namespace_3f34405c51e49637 / namespace_76ebb832f1cbeaa
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x77a
// Size: 0x61
function private function_c4b0ccbcd6f0113a(structname, var_1fd6b62e7661fec9) {
    if (!isdefined(level.var_701c718d777ba02f)) {
        level.var_701c718d777ba02f = [];
    }
    if (!isdefined(level.var_701c718d777ba02f[structname])) {
        level.var_701c718d777ba02f[structname] = [];
    }
    level.var_701c718d777ba02f[structname][level.var_701c718d777ba02f[structname].size] = var_1fd6b62e7661fec9;
    return var_1fd6b62e7661fec9;
}

// Namespace namespace_3f34405c51e49637 / namespace_76ebb832f1cbeaa
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7e4
// Size: 0x126
function private function_a80b36bc796b3a90(var_1fd6b62e7661fec9) {
    if (!isdefined(var_1fd6b62e7661fec9.script_parameters)) {
        return;
    }
    var_44c7d2d159cfe344 = strtok(var_1fd6b62e7661fec9.script_parameters, " ");
    var_7957ae38c168f3df = array_random(var_44c7d2d159cfe344);
    if (!isdefined(var_7957ae38c168f3df)) {
        return;
    }
    if (!scripts\mp\gametypes\br_lootcache::canspawnitemname(var_7957ae38c168f3df)) {
        return;
    }
    if (scripts\mp\gametypes\br_pickups::function_1be34022a4acce73(var_7957ae38c168f3df)) {
        count = undefined;
    } else if (scripts\mp\gametypes\br_pickups::isgasmask(var_7957ae38c168f3df)) {
        count = scripts\cp_mp\gasmask::getmaxhealth(var_7957ae38c168f3df);
    } else if (scripts\mp\gametypes\br_pickups::isplunder(var_7957ae38c168f3df)) {
        count = default_to(level.br_pickups.counts[var_7957ae38c168f3df], 1);
    } else {
        count = scripts\mp\gametypes\br_bunker_utility::getitemcount(var_7957ae38c168f3df);
    }
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(var_1fd6b62e7661fec9.origin, var_1fd6b62e7661fec9.angles);
    if (scripts\mp\gametypes\br_pickups::isweaponpickup(var_7957ae38c168f3df)) {
        scriptable = scripts\mp\gametypes\br_pickups::spawnpickup(var_7957ae38c168f3df, dropinfo, count, 0, undefined, undefined, count);
    } else {
        scriptable = scripts\mp\gametypes\br_pickups::spawnpickup(var_7957ae38c168f3df, dropinfo, count, 0);
    }
    scriptable.criticalitem = 1;
    return var_1fd6b62e7661fec9;
}

// Namespace namespace_3f34405c51e49637 / namespace_76ebb832f1cbeaa
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x913
// Size: 0x199
function private function_673f910f067ac67a(structname) {
    level endon("game_ended");
    level waittill("infil_animatic_complete");
    waitframe();
    if (!isdefined(level.var_701c718d777ba02f) || !isdefined(level.var_701c718d777ba02f[structname]) || level.var_701c718d777ba02f[structname].size == 0) {
        return;
    }
    /#
        uniquedebugcolor = (0, randomfloat(1), randomfloat(1));
    #/
    foreach (loc in level.var_701c718d777ba02f[structname]) {
        var_cbc63cf0f68e053f = isdefined(loc.var_2023ce1979fe53f7) && isdefined(loc.areaswap_state);
        if (var_cbc63cf0f68e053f) {
            statename = function_15468d13080662ca(loc.var_2023ce1979fe53f7);
            var_cbc63cf0f68e053f = statename != function_1823ff50bb28148d(loc.areaswap_state);
        }
        if (var_cbc63cf0f68e053f) {
            function_a630813f938520d5(loc, function_1823ff50bb28148d(loc.var_2023ce1979fe53f7), function_1823ff50bb28148d(loc.areaswap_state));
        } else {
            function_a80b36bc796b3a90(loc);
        }
        /#
            if (getdvarint(@"hash_61b94d31059f975", 0)) {
                thread scripts\mp\utility\debug::drawsphere(loc.origin, 128, 10000, uniquedebugcolor);
            }
        #/
    }
    if (isdefined(level.var_b79c884fb43bf695)) {
        level thread function_644b84ea3bc96275();
    }
    level.var_701c718d777ba02f[structname] = undefined;
}

// Namespace namespace_3f34405c51e49637 / namespace_76ebb832f1cbeaa
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xab4
// Size: 0x90
function private function_a630813f938520d5(loc, var_2023ce1979fe53f7, areaswap_state) {
    if (!isdefined(level.var_b79c884fb43bf695)) {
        level.var_b79c884fb43bf695 = [];
    }
    if (!isdefined(level.var_b79c884fb43bf695[var_2023ce1979fe53f7])) {
        level.var_b79c884fb43bf695[var_2023ce1979fe53f7] = [];
    }
    if (!isdefined(level.var_b79c884fb43bf695[var_2023ce1979fe53f7][areaswap_state])) {
        level.var_b79c884fb43bf695[var_2023ce1979fe53f7][areaswap_state] = [];
    }
    level.var_b79c884fb43bf695[var_2023ce1979fe53f7][areaswap_state] = array_add(level.var_b79c884fb43bf695[var_2023ce1979fe53f7][areaswap_state], loc);
}

// Namespace namespace_3f34405c51e49637 / namespace_76ebb832f1cbeaa
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb4c
// Size: 0xb3
function private function_644b84ea3bc96275() {
    level endon("game_ended");
    while (true) {
        var_2023ce1979fe53f7, areaswap_state = level waittill("areaswap_changed");
        if (isdefined(level.var_b79c884fb43bf695[var_2023ce1979fe53f7]) && isdefined(level.var_b79c884fb43bf695[var_2023ce1979fe53f7][areaswap_state])) {
            foreach (loc in level.var_b79c884fb43bf695[var_2023ce1979fe53f7][areaswap_state]) {
                function_a80b36bc796b3a90(loc);
            }
            level.var_b79c884fb43bf695[var_2023ce1979fe53f7][areaswap_state] = undefined;
        }
    }
}

// Namespace namespace_3f34405c51e49637 / namespace_76ebb832f1cbeaa
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc07
// Size: 0x17
function private function_79691f9f27624735(structname) {
    return getstructarray(structname, "targetname");
}

/#

    // Namespace namespace_3f34405c51e49637 / namespace_76ebb832f1cbeaa
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xc27
    // Size: 0x6d
    function init_debug(var_224bf1253364b30a, var_487aa685c1c31808) {
        if (!isdefined(var_487aa685c1c31808)) {
            return;
        }
        level.var_9ffcbd98034a5cd4 = spawnstruct();
        level.var_9ffcbd98034a5cd4.var_e0b2360bcb173320 = getscriptbundle(var_487aa685c1c31808);
        devgui::function_6e7290c8ee4f558b("<dev string:x68>");
        devgui::function_a9a864379a098ad6("<dev string:x7f>", "<dev string:x92>", &function_d0fe7707ad955a32);
        devgui::function_fe953f000498048f();
    }

    // Namespace namespace_3f34405c51e49637 / namespace_76ebb832f1cbeaa
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc9c
    // Size: 0x130
    function function_d0fe7707ad955a32() {
        if (istrue(level.var_9ffcbd98034a5cd4.debug_active)) {
            level.var_9ffcbd98034a5cd4.debug_active = undefined;
            level notify("<dev string:xbc>");
            return;
        }
        level.var_9ffcbd98034a5cd4.debug_active = 1;
        var_bed8b702214653a5 = level.var_9ffcbd98034a5cd4.var_e0b2360bcb173320.var_6c073ecdc1c6dba5;
        foreach (item in var_bed8b702214653a5) {
            spawn_positions = item.var_96c78bfdaf20aa5a;
            debug_origin = function_57718c5233376cf1(spawn_positions[0].spawnorigin);
            debug_str = item.var_d2d351beaab03413 + "<dev string:xd9>" + debug_origin;
            debug::debug_print3d(debug_origin, debug_str, (1, 0, 1), undefined, "<dev string:xbc>", undefined, 1, 0.2);
        }
    }

#/
