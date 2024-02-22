// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\scriptable.gsc;
#using script_11f4fc0fd23c7bed;
#using script_600b944a95c3a7bf;
#using scripts\mp\gameobjects.gsc;
#using script_2583ee5680cf4736;
#using script_2d9d24f7c63ac143;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using script_12668187dcf15b96;

#namespace namespace_e192b53669adb26d;

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4dd
// Size: 0xbd
function init() {
    if (!isdefined(level.var_50702f8c7636572f)) {
        level.var_50702f8c7636572f = spawnstruct();
        level.var_50702f8c7636572f.var_a32b4464bd2b3a84 = [];
        level.var_50702f8c7636572f.var_3162ebc254b69b75 = [];
        level.var_50702f8c7636572f.var_833ab01147ed4eba = getdvarint(@"hash_3f606843a775b487", 1);
    }
    if (!isdefined(level.br_pickups)) {
        level waittill("br_pickups_init");
    }
    function_69ac00aaca3df9d2();
    namespace_17c25f0877bfb620::function_8daea885ec058271(&function_9ea56c6edd53918);
    namespace_7f114a09d9ee51c3::init();
    level.var_50702f8c7636572f.init = 1;
    /#
        level thread function_172af363664b6357();
    #/
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5a1
// Size: 0x429
function private function_69ac00aaca3df9d2() {
    if (!isdefined(level.var_1a2b600a06ec21f4) || !isdefined(level.var_1a2b600a06ec21f4.var_61e8a47c516baf04)) {
        function_511041aef993713e("parseToolUseBundles: Unable to find gamemode bundle or ingredient tool use bundle");
        return;
    }
    var_61e8a47c516baf04 = level.var_1a2b600a06ec21f4.var_61e8a47c516baf04;
    if (!isstring(var_61e8a47c516baf04) || var_61e8a47c516baf04.size == 0) {
        function_511041aef993713e("parseToolUseBundles: Invalid type or value for ingredientToolUseListBundleName");
        return;
    }
    var_48b94be65b2a158e = getscriptbundle(function_2ef675c13ca1c4af(%"hash_174a600b1b827dac", var_61e8a47c516baf04));
    if (!isdefined(var_48b94be65b2a158e)) {
        function_511041aef993713e("parseToolUseBundles: Invalid Ingredient List Bundle: " + var_48b94be65b2a158e);
        return;
    }
    foreach (index, entry in var_48b94be65b2a158e.var_a7bf6c1051d7f068) {
        var_2fb0e88235a5834f = function_908fc5a1f259c42c(entry.var_be3154b162ea34d1);
        if (!isdefined(var_2fb0e88235a5834f)) {
            function_511041aef993713e("parseToolUseBundles: Invalid tool use settings asset at hintEntityToolUseList[" + index + "] in bundle " + var_61e8a47c516baf04);
        } else {
            var_28fc67990ae8169e = spawnstruct();
            var_28fc67990ae8169e.var_12db389f0fecd79e = var_2fb0e88235a5834f;
            var_28fc67990ae8169e.var_2c8f270f17725f28 = "UseWeaponFlow";
            level.var_50702f8c7636572f.var_3162ebc254b69b75[level.var_50702f8c7636572f.var_3162ebc254b69b75.size] = var_28fc67990ae8169e;
        }
    }
    foreach (index, entry in var_48b94be65b2a158e.var_12c7b012c140fe7f) {
        scriptablename = entry.var_5e40f85b57215816;
        if (!isdefined(scriptablename)) {
            function_511041aef993713e("parseToolUseBundles: Invalid ingredient at scriptableToolUseList[" + index + "] in bundle " + var_61e8a47c516baf04);
        } else {
            var_2fb0e88235a5834f = function_908fc5a1f259c42c(entry.var_be3154b162ea34d1);
            if (!isdefined(var_2fb0e88235a5834f)) {
                function_511041aef993713e("parseToolUseBundles: Invalid tool use settings asset at scriptableToolUseList[" + index + "] in bundle " + var_61e8a47c516baf04);
            } else {
                var_28fc67990ae8169e = spawnstruct();
                var_28fc67990ae8169e.var_12db389f0fecd79e = var_2fb0e88235a5834f;
                var_28fc67990ae8169e.var_3c1a3a6d974c9683 = namespace_3c37cb17ade254d::function_53c4c53197386572(entry.var_3c1a3a6d974c9683, 0);
                var_28fc67990ae8169e.var_c11bd6939e2eab48 = function_cc974f6066708dc9(entry.var_c11bd6939e2eab48, (0, 0, 0));
                var_28fc67990ae8169e.var_78003ee028921cf3 = namespace_3c37cb17ade254d::function_53c4c53197386572(entry.var_78003ee028921cf3, 0);
                var_28fc67990ae8169e.var_d9be5b54e8a3f098 = function_cc974f6066708dc9(entry.var_d9be5b54e8a3f098, (0, 0, 0));
                var_28fc67990ae8169e.var_287ee32e87270c8e = namespace_3c37cb17ade254d::function_53c4c53197386572(entry.var_287ee32e87270c8e, #"");
                var_28fc67990ae8169e.var_17dea2b4e4c9137e = namespace_3c37cb17ade254d::function_53c4c53197386572(entry.var_17dea2b4e4c9137e, #"");
                var_28fc67990ae8169e.var_dbaa4837728a65f3 = namespace_3c37cb17ade254d::function_53c4c53197386572(entry.var_dbaa4837728a65f3, #"");
                var_28fc67990ae8169e.var_68c5bd011a549dd = namespace_3c37cb17ade254d::function_53c4c53197386572(entry.var_68c5bd011a549dd, "MP_DMZ_LOCKS/LOCKED");
                var_28fc67990ae8169e.var_e2842446eec2f014 = namespace_3c37cb17ade254d::function_53c4c53197386572(entry.var_e2842446eec2f014, "MP_DMZ_LOCKS/LOCKED");
                var_28fc67990ae8169e.var_2c8f270f17725f28 = namespace_3c37cb17ade254d::function_53c4c53197386572(entry.var_2c8f270f17725f28, "UseWeaponFlow");
                var_28fc67990ae8169e.var_1652909a360b82eb = namespace_3c37cb17ade254d::function_53c4c53197386572(entry.var_1652909a360b82eb, 0);
                var_28fc67990ae8169e.var_93b9ec961aa25883 = namespace_3c37cb17ade254d::function_53c4c53197386572(entry.var_93b9ec961aa25883, "");
                var_28fc67990ae8169e.var_4883db9641b2fef8 = namespace_3c37cb17ade254d::function_53c4c53197386572(entry.var_4883db9641b2fef8, "");
                level.var_50702f8c7636572f.var_a32b4464bd2b3a84[scriptablename] = var_28fc67990ae8169e;
            }
        }
    }
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9d1
// Size: 0x19e
function private function_908fc5a1f259c42c(bundlename) {
    if (!isdefined(bundlename)) {
        return undefined;
    }
    bundle = getscriptbundle(function_2ef675c13ca1c4af(%"hash_6c3f91c9ca035a07", bundlename));
    if (!isdefined(bundle) || !isdefined(bundle.var_2fb0e88235a5834f) || bundle.var_2fb0e88235a5834f.size == 0) {
        return undefined;
    }
    var_2fb0e88235a5834f = [];
    foreach (entry in bundle.var_2fb0e88235a5834f) {
        useweapon = namespace_3c37cb17ade254d::function_53c4c53197386572(entry.var_b48a3f44acc6764, "");
        var_a1093166de09e6b8 = namespace_3c37cb17ade254d::function_53c4c53197386572(entry.var_77c4f32bb26a1a85, "");
        lootid = namespace_38b993c4618e76cd::getlootidfromref(var_a1093166de09e6b8);
        if (!isdefined(lootid)) {
            function_511041aef993713e("parseToolUseBundles: cannot find loot id for " + var_a1093166de09e6b8);
        } else {
            settings = spawnstruct();
            settings.lootid = lootid;
            settings.var_a1093166de09e6b8 = var_a1093166de09e6b8;
            settings.useweapon = useweapon;
            settings.stances = function_4d102b9311261fd5(entry.stances);
            settings.var_1ec33e1708fd3e55 = function_89b3458a046bf612(entry.var_1ec33e1708fd3e55);
            var_2fb0e88235a5834f[var_2fb0e88235a5834f.size] = settings;
        }
    }
    return var_2fb0e88235a5834f;
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xb77
// Size: 0xb4
function private function_89b3458a046bf612(data) {
    if (istrue(data.var_e5d42093389bc2fa)) {
        var_1ec33e1708fd3e55 = spawnstruct();
        var_1ec33e1708fd3e55.var_e5d42093389bc2fa = 1;
        var_1ec33e1708fd3e55.var_ca93049c5125808c = namespace_3c37cb17ade254d::function_53c4c53197386572(data.var_ca93049c5125808c, 0);
        var_1ec33e1708fd3e55.var_982c3ed6dfe551e5 = namespace_3c37cb17ade254d::function_53c4c53197386572(data.var_982c3ed6dfe551e5, 0);
        var_1ec33e1708fd3e55.var_c02e41f0dc3063fd = namespace_3c37cb17ade254d::function_53c4c53197386572(data.var_c02e41f0dc3063fd, 0);
        var_1ec33e1708fd3e55.var_6350817fe4bb8114 = namespace_3c37cb17ade254d::function_53c4c53197386572(data.var_6350817fe4bb8114, 0);
        return var_1ec33e1708fd3e55;
    }
    return undefined;
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc33
// Size: 0x57
function private function_4d102b9311261fd5(data) {
    stances = [];
    if (isdefined(data)) {
        stances["stand"] = data.var_a14c4538b773d669;
        stances["crouch"] = data.var_ae3c539e6ade71c5;
        stances["prone"] = data.var_9787b93301a495d7;
    }
    return stances;
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xc92
// Size: 0x8d
function function_a6b3ae56de1dc2c8(useposition, var_4924b92c1de32bc4, usetext, var_bf5cbe08799f2189, var_2ca0e2098daf8b8d) {
    var_79332814b1d548f = namespace_19b4203b51d56488::createhintobject(useposition, "HINT_BUTTON", undefined, usetext, undefined, var_4924b92c1de32bc4, "show", undefined, 120, 125, 120);
    var_79332814b1d548f.useduration = var_4924b92c1de32bc4;
    var_79332814b1d548f.var_bf5cbe08799f2189 = var_bf5cbe08799f2189;
    var_79332814b1d548f.var_2ca0e2098daf8b8d = var_2ca0e2098daf8b8d;
    level thread function_de3bba90c47cfcf2(var_79332814b1d548f);
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd26
// Size: 0xcf
function private function_de3bba90c47cfcf2(var_79332814b1d548f) {
    level endon("game_ended");
    var_79332814b1d548f endon("death");
    while (1) {
        player = var_79332814b1d548f waittill("trigger_progress");
        if (!isdefined(var_79332814b1d548f.var_1d0feee7f9822187)) {
            var_28fc67990ae8169e = level.var_50702f8c7636572f.var_3162ebc254b69b75[var_79332814b1d548f.var_bf5cbe08799f2189];
            if (isdefined(var_28fc67990ae8169e) && var_79332814b1d548f function_ee3c484dddf76a86(player, var_28fc67990ae8169e)) {
                thread function_f0a739e333d058b9(player, var_79332814b1d548f, var_79332814b1d548f.useduration, var_28fc67990ae8169e);
                var_79710492b71b9e81 = var_79332814b1d548f waittill("use_finished");
                if (istrue(var_79710492b71b9e81)) {
                    var_79332814b1d548f waittill("use_animation_finished");
                    if (istrue(var_79332814b1d548f.var_2ca0e2098daf8b8d)) {
                        break;
                    }
                }
            }
        }
    }
    var_79332814b1d548f delete();
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdfc
// Size: 0x12c
function function_9c3bc425fad907df(var_db376ee90688810d) {
    level endon("game_ended");
    while (!isdefined(level.var_50702f8c7636572f) || !istrue(level.var_50702f8c7636572f.init)) {
        waitframe();
    }
    if (!isdefined(var_db376ee90688810d) || !isdefined(var_db376ee90688810d.type)) {
        function_511041aef993713e("enableToolInteraction: failed due to invalid self or self.type");
        return;
    }
    var_28fc67990ae8169e = level.var_50702f8c7636572f.var_a32b4464bd2b3a84[var_db376ee90688810d.type];
    if (!isdefined(var_28fc67990ae8169e)) {
        function_511041aef993713e("enableToolInteraction: failed due to invalid toolsettings");
        return;
    }
    partname = var_28fc67990ae8169e.var_287ee32e87270c8e;
    statename = var_28fc67990ae8169e.var_17dea2b4e4c9137e;
    if (!isdefined(partname) || !isdefined(statename) || !var_db376ee90688810d getscriptableparthasstate(partname, statename)) {
        function_511041aef993713e("enableToolInteraction: failed due to invalid part/state names");
        return;
    }
    var_db376ee90688810d setscriptablepartstate(partname, statename);
    var_db376ee90688810d namespace_5775ad2badedbcaa::function_98fc2e3f04194a50(&function_92012e88222eb9bf);
    var_db376ee90688810d namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_c25b12b39f2f27d5);
    if (var_28fc67990ae8169e.var_2c8f270f17725f28 == "DMZDrillFlow") {
        var_db376ee90688810d namespace_7f114a09d9ee51c3::function_1feb17858cd36268();
    }
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xf2f
// Size: 0xcd
function function_9ea56c6edd53918(instance, part, state, player, useduration) {
    var_28fc67990ae8169e = level.var_50702f8c7636572f.var_a32b4464bd2b3a84[instance.type];
    if (!isdefined(var_28fc67990ae8169e)) {
        return;
    }
    if (!isdefined(state) || function_1823ff50bb28148d(state) != var_28fc67990ae8169e.var_17dea2b4e4c9137e) {
        return;
    }
    if (!isdefined(part) || function_1823ff50bb28148d(part) != var_28fc67990ae8169e.var_287ee32e87270c8e) {
        return;
    }
    if (isdefined(instance.var_1d0feee7f9822187)) {
        return;
    }
    if (!instance function_ee3c484dddf76a86(player, var_28fc67990ae8169e)) {
        return;
    }
    instance.isscriptable = 1;
    thread function_f0a739e333d058b9(player, instance, useduration, var_28fc67990ae8169e);
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1003
// Size: 0x1c
function function_92012e88222eb9bf(scriptable, player) {
    return scriptable function_ee3c484dddf76a86(player);
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1027
// Size: 0x11f
function function_c25b12b39f2f27d5(scriptable, player) {
    var_28fc67990ae8169e = level.var_50702f8c7636572f.var_a32b4464bd2b3a84[scriptable.type];
    var_e8160f0a47c4c779 = function_df126e61db751279(var_28fc67990ae8169e, player);
    if (isdefined(var_28fc67990ae8169e)) {
        if (isdefined(var_e8160f0a47c4c779)) {
            if (isdefined(var_e8160f0a47c4c779.var_15658e8fe23687fa)) {
                return {params:[0:var_e8160f0a47c4c779.var_15658e8fe23687fa], string:var_28fc67990ae8169e.var_68c5bd011a549dd, type:"HINT_BUTTON"};
            } else if (function_eb1b65c6da4a9c55()) {
                return {string:var_28fc67990ae8169e.var_68c5bd011a549dd, type:"HINT_BUTTON"};
            }
        } else {
            return {string:var_28fc67990ae8169e.var_e2842446eec2f014, type:"HINT_BUTTON"};
        }
    } else {
        return {string:"MP_DMZ_LOCKS/LOCKED", type:"HINT_BUTTON"};
    }
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x114d
// Size: 0x13e
function function_df126e61db751279(var_28fc67990ae8169e, player) {
    if (!isdefined(player) || !isdefined(var_28fc67990ae8169e)) {
        return undefined;
    }
    var_56922af9a10f5866 = undefined;
    var_e16db61858a1af1c = undefined;
    var_185ddeff6f79e975 = undefined;
    if (function_eb1b65c6da4a9c55()) {
        var_56922af9a10f5866 = 0;
    } else {
        foreach (index, entry in var_28fc67990ae8169e.var_12db389f0fecd79e) {
            var_57ad1dc40b3000d = player namespace_aead94004cf4c147::function_d9749a7ab0c838d3(entry.var_a1093166de09e6b8);
            var_c1747892482d8b4c = var_57ad1dc40b3000d[1];
            var_8e43a8e305aaebf4 = var_57ad1dc40b3000d[0];
            if (!isdefined(var_8e43a8e305aaebf4)) {
                continue;
            }
            if (!isdefined(var_185ddeff6f79e975) || var_c1747892482d8b4c < var_185ddeff6f79e975) {
                var_185ddeff6f79e975 = var_c1747892482d8b4c;
                var_56922af9a10f5866 = index;
                var_e16db61858a1af1c = var_8e43a8e305aaebf4;
            }
        }
    }
    result = spawnstruct();
    result.stackindex = var_e16db61858a1af1c;
    result.var_bf5cbe08799f2189 = var_56922af9a10f5866;
    result.var_15658e8fe23687fa = var_185ddeff6f79e975;
    return result;
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1293
// Size: 0x113
function function_15237da5e7dc7fe6(instance, player, var_50a96a161eeba9a0, var_28fc67990ae8169e) {
    level endon("game_ended");
    if (istrue(instance.isscriptable) && isdefined(var_28fc67990ae8169e)) {
        partname = var_28fc67990ae8169e.var_287ee32e87270c8e;
        var_f268092df3db887d = var_28fc67990ae8169e.var_dbaa4837728a65f3;
        if (isdefined(partname) && isdefined(var_f268092df3db887d) && instance getscriptableparthasstate(partname, var_f268092df3db887d)) {
            instance setscriptablepartstate(partname, var_f268092df3db887d);
        }
    }
    if (isdefined(instance) && isdefined(instance.var_5fe3b18c69f51bb8)) {
        level thread [[ instance.var_5fe3b18c69f51bb8 ]](instance, player);
    }
    if (isdefined(player) && isdefined(var_50a96a161eeba9a0)) {
        player namespace_aead94004cf4c147::function_db1dd76061352e5b(var_50a96a161eeba9a0, 1);
    }
    instance namespace_5775ad2badedbcaa::function_98fc2e3f04194a50();
    instance namespace_5775ad2badedbcaa::function_e6c63f16f2258b80();
    instance waittill("use_animation_finished");
    if (istrue(instance.isscriptable) && instance scriptableislootcache() && !isdefined(instance.opener)) {
        namespace_1b7e64f50cca9321::function_c56e597e3aa81261(instance, player);
    }
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x13ad
// Size: 0x9d
function private function_f0a739e333d058b9(player, instance, useduration, var_28fc67990ae8169e) {
    /#
        assert(isdefined(var_28fc67990ae8169e.var_2c8f270f17725f28));
    #/
    switch (var_28fc67990ae8169e.var_2c8f270f17725f28) {
    case #"hash_65b4e30dcc739a00":
        function_a3c0c6ebb66b718e(player, instance, useduration, var_28fc67990ae8169e);
        break;
    case #"hash_baaeb5714bfa5a09":
        namespace_7f114a09d9ee51c3::function_28fc0d8bad595704(player, instance, useduration, var_28fc67990ae8169e);
        break;
    default:
        /#
            assertmsg("br_exgm_tool_interaction: startInteraction - Unsupported type");
        #/
        break;
    }
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1451
// Size: 0x288
function private function_a3c0c6ebb66b718e(player, instance, useduration, var_28fc67990ae8169e) {
    level endon("game_ended");
    /#
        assert(isdefined(instance) && !isdefined(instance.var_1d0feee7f9822187));
    #/
    /#
        assert(isdefined(player) && isdefined(useduration) && isdefined(var_28fc67990ae8169e));
    #/
    instance.var_1d0feee7f9822187 = player;
    instance function_35e3d48918b548bc(0, instance.var_1d0feee7f9822187);
    var_e8160f0a47c4c779 = function_df126e61db751279(var_28fc67990ae8169e, player);
    /#
        assert(isdefined(var_e8160f0a47c4c779));
    #/
    var_643cb175c27e8967 = var_28fc67990ae8169e.var_12db389f0fecd79e[var_e8160f0a47c4c779.var_bf5cbe08799f2189];
    /#
        assert(isdefined(var_643cb175c27e8967));
    #/
    var_a1093166de09e6b8 = var_643cb175c27e8967.var_a1093166de09e6b8;
    var_69f9f1a5d8cf3187 = var_643cb175c27e8967.useweapon;
    player function_bffd72a3766031d2(1, var_643cb175c27e8967.stances);
    player thread function_d8106ff3211f102d(instance, var_28fc67990ae8169e);
    useweapon = makeweapon(var_69f9f1a5d8cf3187);
    /#
        assert(isdefined(useweapon));
    #/
    player thread function_7db3f060257e57ca(useweapon, var_28fc67990ae8169e, var_643cb175c27e8967);
    player thread function_38e09559680e7d91(var_e8160f0a47c4c779.stackindex, var_a1093166de09e6b8, 1);
    var_79710492b71b9e81 = function_bac176a6bce74e7b(player, instance, useduration);
    instance notify("use_finished", var_79710492b71b9e81);
    if (istrue(var_79710492b71b9e81)) {
        thread function_15237da5e7dc7fe6(instance, player, var_e8160f0a47c4c779.stackindex, var_28fc67990ae8169e);
        player thread function_38e09559680e7d91(var_e8160f0a47c4c779.stackindex, var_a1093166de09e6b8, 1);
    }
    instance function_9f662288c13b7217(0, instance.var_1d0feee7f9822187);
    var_9a456461b47468e4 = isdefined(var_e8160f0a47c4c779.var_15658e8fe23687fa) && var_e8160f0a47c4c779.var_15658e8fe23687fa == 1;
    player thread function_a1d7b3bec1fdac12(useweapon, var_79710492b71b9e81, var_9a456461b47468e4, var_643cb175c27e8967);
    player function_60894d03ab457534(useweapon);
    if (isdefined(player)) {
        player unlink();
        if (isdefined(self.linktoent)) {
            player.linktoent delete();
            player.linktoent = undefined;
        }
        player function_bffd72a3766031d2(0);
        player thread function_38e09559680e7d91(var_e8160f0a47c4c779.stackindex, var_a1093166de09e6b8, 0);
    }
    instance.var_1d0feee7f9822187 = undefined;
    instance function_35e3d48918b548bc(1);
    instance notify("use_animation_finished");
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x16e0
// Size: 0x76
function function_bac176a6bce74e7b(player, instance, useduration) {
    level endon("game_ended");
    holdtime = 0;
    while (1) {
        if (!isdefined(player) || !isalive(player) || !isdefined(instance) || !player usebuttonpressed()) {
            break;
        }
        if (holdtime >= useduration) {
            return 1;
        }
        holdtime = holdtime + level.framedurationseconds * 1000;
        waitframe();
    }
    return 0;
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x175e
// Size: 0xc8
function private function_7db3f060257e57ca(useweapon, var_28fc67990ae8169e, var_643cb175c27e8967) {
    if (!isdefined(useweapon)) {
        return;
    }
    lastweapon = self getcurrentweapon();
    /#
        assert(isdefined(lastweapon));
    #/
    switchimmediate = 0;
    if (lastweapon == useweapon) {
        /#
            assert(isdefined(self.lastnonuseweapon));
        #/
        lastweapon = self.lastnonuseweapon;
    }
    /#
        assert(lastweapon != useweapon);
    #/
    self.lastnonuseweapon = lastweapon;
    setammo = 0;
    _giveweapon(useweapon, undefined, undefined, 0);
    self setweaponammostock(useweapon, setammo);
    self setweaponammoclip(useweapon, setammo);
    thread namespace_19b4203b51d56488::switchtouseweapon(useweapon, switchimmediate);
    thread function_4b2a64d118730cb7(var_643cb175c27e8967);
    function_1652909a360b82eb(var_28fc67990ae8169e);
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x182d
// Size: 0x3e
function private function_1652909a360b82eb(var_28fc67990ae8169e) {
    if (!isdefined(var_28fc67990ae8169e)) {
        return;
    }
    if (istrue(var_28fc67990ae8169e.var_1652909a360b82eb)) {
        self setentitysoundcontext(var_28fc67990ae8169e.var_93b9ec961aa25883, var_28fc67990ae8169e.var_4883db9641b2fef8);
    }
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1872
// Size: 0xbc
function private function_a1d7b3bec1fdac12(useweapon, var_79710492b71b9e81, var_db3cade94fa044b4, var_643cb175c27e8967) {
    if (!isdefined(useweapon)) {
        return;
    }
    var_c9f07c0481b9634a = 1;
    if (istrue(var_79710492b71b9e81)) {
        setammo = ter_op(istrue(var_db3cade94fa044b4), 0, 1);
        self setweaponammostock(useweapon, setammo);
        self setweaponammoclip(useweapon, setammo);
        var_c9f07c0481b9634a = 0;
    }
    if (namespace_df5cfdbe6e2d3812::isswitchingtoweaponwithmonitoring(useweapon)) {
        abortmonitoredweaponswitch(useweapon);
    } else {
        var_efcc85f1a7d3a7db = self gethighpriorityweapon();
        if (isdefined(var_efcc85f1a7d3a7db) && var_efcc85f1a7d3a7db == useweapon) {
            self clearhighpriorityweapon(var_efcc85f1a7d3a7db);
        }
        thread getridofweapon(useweapon, var_c9f07c0481b9634a);
    }
    thread function_bdd294473326b3e8(var_79710492b71b9e81, var_643cb175c27e8967);
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1935
// Size: 0x98
function private function_4b2a64d118730cb7(var_643cb175c27e8967) {
    level endon("game_ended");
    if (!isdefined(var_643cb175c27e8967) || !isdefined(var_643cb175c27e8967.var_1ec33e1708fd3e55)) {
        return;
    }
    var_1ec33e1708fd3e55 = var_643cb175c27e8967.var_1ec33e1708fd3e55;
    if (!istrue(var_1ec33e1708fd3e55.var_e5d42093389bc2fa)) {
        return;
    }
    waittime = var_1ec33e1708fd3e55.var_ca93049c5125808c / 1000;
    lerpduration = var_1ec33e1708fd3e55.var_982c3ed6dfe551e5 / 1000;
    wait(waittime);
    if (isdefined(self)) {
        self lerpfovscalefactor(0, lerpduration);
    }
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x19d4
// Size: 0xaf
function private function_bdd294473326b3e8(var_79710492b71b9e81, var_643cb175c27e8967) {
    level endon("game_ended");
    if (!isdefined(var_643cb175c27e8967) || !isdefined(var_643cb175c27e8967.var_1ec33e1708fd3e55)) {
        return;
    }
    var_1ec33e1708fd3e55 = var_643cb175c27e8967.var_1ec33e1708fd3e55;
    if (!istrue(var_1ec33e1708fd3e55.var_e5d42093389bc2fa)) {
        return;
    }
    waittime = 0;
    lerpduration = 0.2;
    if (istrue(var_79710492b71b9e81)) {
        waittime = var_1ec33e1708fd3e55.var_c02e41f0dc3063fd / 1000;
        lerpduration = var_1ec33e1708fd3e55.var_6350817fe4bb8114 / 1000;
    }
    wait(waittime);
    if (isdefined(self)) {
        self lerpfovscalefactor(1, lerpduration);
    }
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1a8a
// Size: 0x5e
function private function_60894d03ab457534(useweapon) {
    level endon("game_ended");
    while (1) {
        if (!istrue(self.connected) || !isalive(self)) {
            break;
        }
        weapon = self getcurrentweapon();
        if (!isdefined(weapon) || !isdefined(useweapon) || weapon != useweapon) {
            break;
        }
        waitframe();
    }
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1aef
// Size: 0xe9
function function_ee3c484dddf76a86(player, var_28fc67990ae8169e) {
    if (!isdefined(player)) {
        return 0;
    }
    if (function_eb1b65c6da4a9c55()) {
        return 1;
    }
    if (!isdefined(var_28fc67990ae8169e)) {
        if (isdefined(self.type)) {
            var_28fc67990ae8169e = level.var_50702f8c7636572f.var_a32b4464bd2b3a84[self.type];
        } else {
            var_28fc67990ae8169e = level.var_50702f8c7636572f.var_3162ebc254b69b75[self.var_bf5cbe08799f2189];
        }
    }
    if (!isdefined(var_28fc67990ae8169e)) {
        return 0;
    }
    foreach (entry in var_28fc67990ae8169e.var_12db389f0fecd79e) {
        if (player namespace_aead94004cf4c147::function_36b1968bfe78916b(entry.lootid)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1be0
// Size: 0x8c
function function_35e3d48918b548bc(var_9e788d8828649a5c, var_f5720cac60ca8410) {
    foreach (player in level.players) {
        if (!isdefined(player) || !isalive(player)) {
            continue;
        }
        if (isdefined(var_f5720cac60ca8410) && player == var_f5720cac60ca8410) {
            continue;
        }
        function_9f662288c13b7217(var_9e788d8828649a5c, player);
    }
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1c73
// Size: 0x5d
function private function_9f662288c13b7217(var_9e788d8828649a5c, player) {
    /#
        assert(isdefined(player));
    #/
    if (istrue(self.isscriptable)) {
        if (var_9e788d8828649a5c) {
            self enablescriptableplayeruse(player);
        } else {
            self disablescriptableplayeruse(player);
        }
    } else if (var_9e788d8828649a5c) {
        self enableplayeruse(player);
    } else {
        self disableplayeruse(player);
    }
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1cd7
// Size: 0x137
function private function_bffd72a3766031d2(var_8fda2f947e5c9e14, var_6edcc4c0efa28272) {
    controls = [0:"allow_movement", 1:"allow_jump", 2:"melee", 3:"offhand_primary_weapons", 4:"offhand_secondary_weapons", 5:"crouch", 6:"prone", 7:"stand"];
    if (istrue(var_8fda2f947e5c9e14)) {
        var_d4dda39d49fc90d1 = self getstance();
        /#
            assert(isdefined(var_d4dda39d49fc90d1));
        #/
        desiredstance = ter_op(isdefined(var_6edcc4c0efa28272) && istrue(var_6edcc4c0efa28272[var_d4dda39d49fc90d1]), var_d4dda39d49fc90d1, "stand");
        switch (desiredstance) {
        case #"hash_c6775c88e38f7803":
            controls = array_remove(controls, "stand");
            break;
        case #"hash_d91940431ed7c605":
            controls = array_remove(controls, "prone");
            break;
        case #"hash_3fed0cbd303639eb":
            controls = array_remove(controls, "crouch");
            break;
        default:
            break;
        }
        val::function_59c053b89257bc95("exgm_tool_interaction", controls, 0);
    } else {
        val::function_38f73441260ce622("exgm_tool_interaction", controls);
    }
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1e15
// Size: 0x151
function private function_d8106ff3211f102d(scriptable, var_28fc67990ae8169e) {
    /#
        assert(isdefined(var_28fc67990ae8169e) && isdefined(scriptable));
    #/
    scriptable endon("use_animation_finished");
    var_c00a2c6249962d83 = function_8443dcfc48098ab6(scriptable, var_28fc67990ae8169e);
    playerangles = var_c00a2c6249962d83[1];
    playerorigin = var_c00a2c6249962d83[0];
    if (distancesquared(playerorigin, self.origin) >= squared(0.1)) {
        var_5502de86e091f1c8 = player_drop_to_ground(playerorigin, 15, 60, -60);
        playerorigin = (playerorigin[0], playerorigin[1], var_5502de86e091f1c8[2]);
    }
    self.linktoent = spawn_tag_origin(self.origin, self.angles);
    self playerlinktodelta(self.linktoent, "tag_origin", 1, 0, 0, 0, 0, 1);
    movetime = getdvarfloat(@"hash_a36bc8fcbb54637f", 0.3);
    self.linktoent moveto(playerorigin, movetime);
    self.linktoent rotateto(playerangles, movetime);
    wait(movetime);
    if (isdefined(self)) {
        self setorigin(playerorigin);
        self setplayerangles(playerangles);
    }
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f6d
// Size: 0xbc
function function_8443dcfc48098ab6(scriptable, var_28fc67990ae8169e) {
    /#
        assert(isdefined(var_28fc67990ae8169e) && isdefined(scriptable));
    #/
    playerorigin = self.origin;
    playerangles = self.angles;
    if (istrue(var_28fc67990ae8169e.var_3c1a3a6d974c9683)) {
        playerorigin = scriptable.origin + rotatevector(var_28fc67990ae8169e.var_c11bd6939e2eab48, scriptable.angles);
    }
    if (istrue(var_28fc67990ae8169e.var_78003ee028921cf3)) {
        playerangles = combineangles(scriptable.angles, var_28fc67990ae8169e.var_d9be5b54e8a3f098);
    }
    return [0:playerorigin, 1:playerangles];
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2031
// Size: 0x7b
function private function_4258c140bef4fdab(var_db4adbde7cad1ff5, var_543b65082c035c5b, var_2bb24aa5b6557593) {
    var_bdb2eb3c34d01ab2 = 0;
    if (!isdefined(var_db4adbde7cad1ff5)) {
        var_db4adbde7cad1ff5 = 0;
    }
    if (!isdefined(var_543b65082c035c5b)) {
        var_543b65082c035c5b = 0;
    }
    if (isdefined(var_2bb24aa5b6557593)) {
        if (istrue(var_2bb24aa5b6557593)) {
            var_2bb24aa5b6557593 = 1;
        } else {
            var_2bb24aa5b6557593 = 0;
        }
    } else {
        var_2bb24aa5b6557593 = 0;
    }
    var_bdb2eb3c34d01ab2 = var_bdb2eb3c34d01ab2 | var_db4adbde7cad1ff5 << 0;
    var_bdb2eb3c34d01ab2 = var_bdb2eb3c34d01ab2 | var_543b65082c035c5b << 4;
    var_bdb2eb3c34d01ab2 = var_bdb2eb3c34d01ab2 | var_2bb24aa5b6557593 << 8;
    self setclientomnvar("ui_tool_use_info", int(var_bdb2eb3c34d01ab2));
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x20b3
// Size: 0x25
function private function_2e7de122fc7cd023() {
    return isdefined(level.var_1a2b600a06ec21f4) && istrue(level.var_1a2b600a06ec21f4.var_51fe99dfa5384b12);
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x20e0
// Size: 0x80
function private function_38e09559680e7d91(var_a6230945d4e6204f, var_c94ffa886eb2612e, var_2bb24aa5b6557593) {
    if (!function_2e7de122fc7cd023() || !isdefined(var_a6230945d4e6204f) || !isdefined(var_c94ffa886eb2612e)) {
        return;
    }
    var_db4adbde7cad1ff5 = namespace_aead94004cf4c147::function_897b29adb37f06a7(var_a6230945d4e6204f);
    if (!isdefined(var_db4adbde7cad1ff5)) {
        return;
    }
    var_9c994389856e9b10 = namespace_aead94004cf4c147::function_dee7316da051a630(var_c94ffa886eb2612e);
    if (!isdefined(var_9c994389856e9b10)) {
        return;
    }
    if (istrue(var_2bb24aa5b6557593)) {
        function_4258c140bef4fdab(var_db4adbde7cad1ff5, var_9c994389856e9b10, 1);
    } else {
        function_4258c140bef4fdab(0, 0, 0);
    }
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2167
// Size: 0x25
function private function_eb1b65c6da4a9c55() {
    return isdefined(level.var_50702f8c7636572f) && istrue(level.var_50702f8c7636572f.var_833ab01147ed4eba);
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2194
// Size: 0x5a
function private function_cc974f6066708dc9(vector, var_e9e90ed64e36c694) {
    if (!isdefined(vector)) {
        return var_e9e90ed64e36c694;
    }
    return (namespace_3c37cb17ade254d::function_53c4c53197386572(vector.x, var_e9e90ed64e36c694[0]), namespace_3c37cb17ade254d::function_53c4c53197386572(vector.y, var_e9e90ed64e36c694[1]), namespace_3c37cb17ade254d::function_53c4c53197386572(vector.z, var_e9e90ed64e36c694[2]));
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x21f6
// Size: 0x1c
function private function_511041aef993713e(text) {
    /#
        println("allow_jump" + text);
    #/
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2219
// Size: 0x7f
function private function_172af363664b6357() {
    /#
        level endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_49a67262a39b39ab", -1) >= 0) {
                var_bf5cbe08799f2189 = getdvarint(@"hash_49a67262a39b39ab", -1);
                setdvar(@"hash_49a67262a39b39ab", -1);
                level thread function_5df9ee7cc2ee2ece(var_bf5cbe08799f2189);
            }
            if (getdvarint(@"hash_fccff3252f2106a5", 0) >= 1) {
                level thread function_7084e044e0ba070a();
            }
            waitframe();
        }
    #/
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x229f
// Size: 0xd9
function private function_5df9ee7cc2ee2ece(var_bf5cbe08799f2189) {
    /#
        playerorigin = level.players[0].origin;
        playerforward = anglestoforward(level.players[0].angles);
        var_c35db60fca6b4eb7 = (playerforward[0], playerforward[1], 0);
        var_575cd7f038cdb101 = (0, 0, 1);
        useposition = playerorigin + var_c35db60fca6b4eb7 * 50 + var_575cd7f038cdb101 * 35;
        var_4924b92c1de32bc4 = 3000;
        usetext = "<unknown string>";
        var_2ca0e2098daf8b8d = 1;
        function_a6b3ae56de1dc2c8(useposition, var_4924b92c1de32bc4, usetext, var_bf5cbe08799f2189, var_2ca0e2098daf8b8d);
    #/
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x237f
// Size: 0x72
function private function_c1c6eddd67bf7457(player, weapon, var_2feb0814d8b653e0) {
    /#
        if (isdefined(weapon)) {
            return [0:var_2feb0814d8b653e0, 1:function_7b2b4dc5f3dfb2c9(weapon), 2:player iscurrentweapon(weapon), 3:player isswitchingtoweaponwithmonitoring(weapon)];
        } else {
            return [0:var_2feb0814d8b653e0, 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>"];
        }
    #/
}

// Namespace namespace_e192b53669adb26d/namespace_8a301a9e06bc923e
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x23f8
// Size: 0x16d
function private function_7084e044e0ba070a() {
    /#
        player = level.players[0];
        if (!isdefined(player)) {
            return;
        }
        offsety = 20;
        var_96e397feed35233a = 50;
        var_96e398feed35256d = 500;
        var_e680527dcb69df5a = (0, 1, 0);
        var_66a5c605656bbab3 = 1;
        var_9712576966b33c8b = 1;
        var_2aeb10326cc4122b = "<unknown string>";
        var_cd8110645a9a2632 = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>"];
        var_871bdbc7e5abb341 = [];
        var_871bdbc7e5abb341[0] = function_c1c6eddd67bf7457(player, player getcurrentweapon(), "<unknown string>");
        var_871bdbc7e5abb341[1] = function_c1c6eddd67bf7457(player, player getcurrentmonitoredweaponswitchweapon(), "<unknown string>");
        var_871bdbc7e5abb341[2] = function_c1c6eddd67bf7457(player, player gethighpriorityweapon(), "<unknown string>");
        var_b0685c2da8adfbca = namespace_36be7f9eab6ca7bc::function_b1ea22d278623807(var_96e397feed35233a, var_96e398feed35256d, var_2aeb10326cc4122b, var_cd8110645a9a2632, var_871bdbc7e5abb341, var_e680527dcb69df5a, var_66a5c605656bbab3, var_9712576966b33c8b);
        var_96e398feed35256d = var_96e398feed35256d + var_b0685c2da8adfbca[1];
        var_2a70afa93ebb723b = "<unknown string>" + player isanymonitoredweaponswitchinprogress();
        printtoscreen2d(var_96e397feed35233a, var_96e398feed35256d, var_2a70afa93ebb723b, var_e680527dcb69df5a, var_66a5c605656bbab3, var_9712576966b33c8b);
        var_96e398feed35256d = var_96e398feed35256d + offsety;
    #/
}

