// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using script_3214e6fcdce468a7;
#using scripts\common\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_77c18cdedec620b3;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gametypes\br_bunker_utility.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\flags.gsc;
#using script_67fb1233e876ed8;
#using scripts\mp\utility\debug.gsc;

#namespace namespace_3f34405c51e49637;

// Namespace namespace_3f34405c51e49637/namespace_76ebb832f1cbeaa
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d
// Size: 0x14d
function init(var_224bf1253364b30a, var_487aa685c1c31808, var_3b24d8dc30ca944b, var_8652221c9d53d1a3) {
    /#
        function_172af363664b6357(var_224bf1253364b30a, var_487aa685c1c31808);
    #/
    if (getdvarint(@"hash_2bd08bfff808053a", 1) && getdvarint(@"hash_89be1a979c1ec008", 0)) {
        function_8385f4c035230abe();
    }
    level waittill("prematch_over");
    if (!isdefined(level.brgametype)) {
        return;
    }
    level.stagedItemsSpawnThrottle = function_e4c99b0f178ffb98("stagedItemsSpawnThrottle", 2, level.framedurationseconds, 16);
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
            if (!isdefined(var_8652221c9d53d1a3)) {
                var_8652221c9d53d1a3 = getdvarfloat(@"hash_809ccd5453be062", 0.6);
            }
            function_83f276ef36c2e4ab(var_428c9aad17e4e279, var_8652221c9d53d1a3);
        }
    }
}

// Namespace namespace_3f34405c51e49637/namespace_76ebb832f1cbeaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1
// Size: 0x1b4
function function_83f276ef36c2e4ab(var_428c9aad17e4e279, var_73783e51d7dca907) {
    if (!isdefined(var_428c9aad17e4e279)) {
        return;
    }
    var_bed8b702214653a5 = var_428c9aad17e4e279.var_6c073ecdc1c6dba5;
    if (var_bed8b702214653a5.size == 0) {
        return;
    }
    totalspawns = math::round_float(var_73783e51d7dca907 * var_bed8b702214653a5.size, 0, 0);
    spawnlist = [];
    var_6816629c4b45504 = 0;
    var_7f9a85843fcd7be1 = 0;
    foreach (item in var_bed8b702214653a5) {
        if (istrue(item.forcespawn)) {
            thread function_77708fbf186d74d6(item);
            var_7f9a85843fcd7be1++;
        } else {
            spawnlist[spawnlist.size] = item;
            var_6816629c4b45504 = var_6816629c4b45504 + item.weight;
        }
    }
    spawnlist = array_randomize(spawnlist);
    for (i = var_7f9a85843fcd7be1; i < totalspawns; i++) {
        spawnitem = undefined;
        var_94f583e2fce2d328 = randomfloat(var_6816629c4b45504);
        foreach (item in spawnlist) {
            var_94f583e2fce2d328 = var_94f583e2fce2d328 - item.weight;
            if (var_94f583e2fce2d328 <= 0) {
                spawnitem = item;
                break;
            }
        }
        thread function_77708fbf186d74d6(spawnitem);
        var_6816629c4b45504 = var_6816629c4b45504 - spawnitem.weight;
        spawnlist = array_remove(spawnlist, item);
    }
}

// Namespace namespace_3f34405c51e49637/namespace_76ebb832f1cbeaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45c
// Size: 0xf8
function function_77708fbf186d74d6(var_31b8245c9cea94d0) {
    if (!isdefined(var_31b8245c9cea94d0)) {
        return;
    }
    var_7957ae38c168f3df = var_31b8245c9cea94d0.var_d2d351beaab03413;
    var_22ce7236b68b2334 = var_31b8245c9cea94d0.var_96c78bfdaf20aa5a;
    count = namespace_ff69a74765774dfd::getitemcount(var_7957ae38c168f3df);
    if (namespace_cb965d2f71fefddc::function_1be34022a4acce73(var_7957ae38c168f3df)) {
        count = undefined;
    }
    var_f126f0c539f806b1 = randomint(var_22ce7236b68b2334.size);
    origin = function_57718c5233376cf1(var_22ce7236b68b2334[var_f126f0c539f806b1].spawnorigin);
    angles = function_57718c5233376cf1(var_22ce7236b68b2334[var_f126f0c539f806b1].spawnangle);
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(origin, angles);
    function_f632348cbb773537(level.stagedItemsSpawnThrottle, var_31b8245c9cea94d0);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup(var_7957ae38c168f3df, var_cb4fad49263e20c4, count, 0);
    scriptable.var_bbc200bc77c5db2b = 1;
}

// Namespace namespace_3f34405c51e49637/namespace_76ebb832f1cbeaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55b
// Size: 0x4f
function function_57718c5233376cf1(vector) {
    return (function_53c4c53197386572(vector.x, 0), function_53c4c53197386572(vector.y, 0), function_53c4c53197386572(vector.z, 0));
}

// Namespace namespace_3f34405c51e49637/namespace_76ebb832f1cbeaa
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5b2
// Size: 0x11f
function private function_8385f4c035230abe() {
    var_6731622e5983330e = getstructarray("staged_item", "script_noteworthy");
    var_312c925211ea7c91 = [];
    foreach (var_31b8245c9cea94d0 in var_6731622e5983330e) {
        var_b0112b6173fb6a58 = var_31b8245c9cea94d0.targetname;
        if (isdefined(var_b0112b6173fb6a58)) {
            var_312c925211ea7c91 = function_6d6af8144a5131f1(var_312c925211ea7c91, var_b0112b6173fb6a58);
        }
    }
    namespace_4b0406965e556711::function_1240434f4201ac9d("ssc_initialized");
    foreach (var_b0112b6173fb6a58 in var_312c925211ea7c91) {
        if (getdvarint(function_2ef675c13ca1c4af(@"hash_ea224dc24c0b7e07", var_b0112b6173fb6a58), 1)) {
            namespace_7052decdced06e44::function_4f7660cfd85cd517(var_b0112b6173fb6a58, &function_79691f9f27624735);
            namespace_7052decdced06e44::function_412f527ef0863f0e(var_b0112b6173fb6a58, &function_c4b0ccbcd6f0113a);
            namespace_7052decdced06e44::function_eded5b87f8f7bdfd(var_b0112b6173fb6a58, &function_673f910f067ac67a);
        }
    }
}

// Namespace namespace_3f34405c51e49637/namespace_76ebb832f1cbeaa
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6d8
// Size: 0x62
function private function_c4b0ccbcd6f0113a(var_cab957adc8d7710f, var_1fd6b62e7661fec9) {
    if (!isdefined(level.var_701c718d777ba02f)) {
        level.var_701c718d777ba02f = [];
    }
    if (!isdefined(level.var_701c718d777ba02f[var_cab957adc8d7710f])) {
        level.var_701c718d777ba02f[var_cab957adc8d7710f] = [];
    }
    level.var_701c718d777ba02f[var_cab957adc8d7710f][level.var_701c718d777ba02f[var_cab957adc8d7710f].size] = var_1fd6b62e7661fec9;
    return var_1fd6b62e7661fec9;
}

// Namespace namespace_3f34405c51e49637/namespace_76ebb832f1cbeaa
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x742
// Size: 0xbe
function private function_a80b36bc796b3a90(var_1fd6b62e7661fec9) {
    if (!isdefined(var_1fd6b62e7661fec9.script_parameters)) {
        return;
    }
    var_44c7d2d159cfe344 = strtok(var_1fd6b62e7661fec9.script_parameters, " ");
    var_7957ae38c168f3df = function_7a2aaa4a09a4d250(var_44c7d2d159cfe344);
    if (!isdefined(var_7957ae38c168f3df)) {
        return;
    }
    count = namespace_ff69a74765774dfd::getitemcount(var_7957ae38c168f3df);
    if (namespace_cb965d2f71fefddc::function_1be34022a4acce73(var_7957ae38c168f3df)) {
        count = undefined;
    }
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(var_1fd6b62e7661fec9.origin, var_1fd6b62e7661fec9.angles);
    scriptable = namespace_cb965d2f71fefddc::spawnpickup(var_7957ae38c168f3df, var_cb4fad49263e20c4, count, 0);
    scriptable.var_bbc200bc77c5db2b = 1;
    return var_1fd6b62e7661fec9;
}

// Namespace namespace_3f34405c51e49637/namespace_76ebb832f1cbeaa
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x808
// Size: 0xfb
function private function_673f910f067ac67a(var_cab957adc8d7710f) {
    level endon("game_ended");
    level waittill("infil_animatic_complete");
    waitframe();
    if (!isdefined(level.var_701c718d777ba02f) || !isdefined(level.var_701c718d777ba02f[var_cab957adc8d7710f]) || level.var_701c718d777ba02f[var_cab957adc8d7710f].size == 0) {
        return;
    }
    /#
        var_c4b4ec83d69e2628 = (0, randomfloat(1), randomfloat(1));
    #/
    foreach (loc in level.var_701c718d777ba02f[var_cab957adc8d7710f]) {
        function_a80b36bc796b3a90(loc);
        /#
            if (getdvarint(@"hash_61b94d31059f975", 0)) {
                thread namespace_d028276791d9cff6::drawsphere(loc.origin, 128, 10000, var_c4b4ec83d69e2628);
            }
        #/
    }
    level.var_701c718d777ba02f[var_cab957adc8d7710f] = undefined;
}

// Namespace namespace_3f34405c51e49637/namespace_76ebb832f1cbeaa
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x90a
// Size: 0x18
function private function_79691f9f27624735(var_cab957adc8d7710f) {
    return getstructarray(var_cab957adc8d7710f, "targetname");
}

// Namespace namespace_3f34405c51e49637/namespace_76ebb832f1cbeaa
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x92a
// Size: 0x68
function function_172af363664b6357(var_224bf1253364b30a, var_487aa685c1c31808) {
    /#
        level.var_9ffcbd98034a5cd4 = spawnstruct();
        level.var_9ffcbd98034a5cd4.var_e0b2360bcb173320 = getscriptbundle(var_487aa685c1c31808);
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_d0fe7707ad955a32);
        devgui::function_fe953f000498048f();
    #/
}

// Namespace namespace_3f34405c51e49637/namespace_76ebb832f1cbeaa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x999
// Size: 0x136
function function_d0fe7707ad955a32() {
    /#
        if (istrue(level.var_9ffcbd98034a5cd4.var_5e3f9239d4084b9b)) {
            level.var_9ffcbd98034a5cd4.var_5e3f9239d4084b9b = undefined;
            level notify("<unknown string>");
            return;
        }
        level.var_9ffcbd98034a5cd4.var_5e3f9239d4084b9b = 1;
        var_bed8b702214653a5 = level.var_9ffcbd98034a5cd4.var_e0b2360bcb173320.var_6c073ecdc1c6dba5;
        foreach (item in var_bed8b702214653a5) {
            var_7e82993cf2face37 = item.var_96c78bfdaf20aa5a;
            debug_origin = function_57718c5233376cf1(var_7e82993cf2face37[0].spawnorigin);
            var_e802d41806cbe964 = item.var_d2d351beaab03413 + "<unknown string>" + debug_origin;
            debug::debug_print3d(debug_origin, var_e802d41806cbe964, (1, 0, 1), undefined, "<unknown string>", undefined, 1, 0.2);
        }
    #/
}

