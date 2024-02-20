// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_54f6d121e91434f8;
#using script_570f992e202c79b4;
#using scripts\mp\gamelogic.gsc;
#using script_6cf3c7c08335321b;
#using script_2707474774db34b;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_3ab210ea917601e7;
#using script_4386d9962a41afc1;
#using script_5d8202968463a21d;
#using script_5815a7cb4d944542;
#using script_17dc47fb18ded931;
#using script_3ac7886f9e4eceef;
#using script_6ab44ed36fd7016b;

#namespace namespace_4faa6169000e657c;

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b9
// Size: 0xe2
function function_89929df8c53338f7() {
    if (isdefined(level.var_83abcb9b3a5dbe24)) {
        return;
    }
    level.var_83abcb9b3a5dbe24 = function_7549ff50f90523c9();
    function_c71c80e21eeb98b0();
    function_c993d376e8f10816(level.var_83abcb9b3a5dbe24);
    function_9c328f2f2bc853e6(level.var_83abcb9b3a5dbe24);
    function_8dd9dcec6a76bffa(level.var_83abcb9b3a5dbe24);
    function_32e7e3d48cd4aec3();
    function_dbdf04ed40266c5(1, &function_72e6923833378e5d);
    function_dbdf04ed40266c5(8, &function_7945819e2d7fc956);
    function_dbdf04ed40266c5(7, &function_38b174f96132d2b4);
    namespace_17c25f0877bfb620::scriptable_addusedcallback(&function_daec7b884974dd17);
    function_8b5b2a3392fc7e2a("ActivityStartedHibernation", &function_7b88d59f853b6833);
    function_8b5b2a3392fc7e2a("ActivityStoppedHibernating", &function_7b88d59f853b6833);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_52a69420197eee1e);
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_52a69420197eee1e);
    /#
        namespace_bcc754285d90ffd9::function_b6f69d3336218238();
    #/
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a2
// Size: 0x15b
function function_8e0a16f0ca8e45e9(var_af0662d6485d5d58, var_aac928f46654cbaf) {
    if (!isdefined(level.var_83abcb9b3a5dbe24.types[var_af0662d6485d5d58])) {
        level.var_83abcb9b3a5dbe24.types[var_af0662d6485d5d58] = spawnstruct();
        var_8807a0ecdc518571 = level.var_83abcb9b3a5dbe24.types[var_af0662d6485d5d58];
        var_8807a0ecdc518571.var_aafc0e60bb520999 = [];
        var_8807a0ecdc518571.var_aafc0e60bb520999[0] = function_35c9943414b3e6ed(0);
        var_8807a0ecdc518571.var_aafc0e60bb520999[1] = function_35c9943414b3e6ed(1);
        var_8807a0ecdc518571.var_aafc0e60bb520999[2] = function_35c9943414b3e6ed(2);
        var_8807a0ecdc518571.var_aafc0e60bb520999[3] = function_35c9943414b3e6ed(3);
        var_8807a0ecdc518571.var_aafc0e60bb520999[4] = function_35c9943414b3e6ed(4);
        var_8807a0ecdc518571.var_aafc0e60bb520999[6] = function_35c9943414b3e6ed(6);
        var_8807a0ecdc518571.var_aafc0e60bb520999[8] = function_35c9943414b3e6ed(8);
        if (function_71d38726159c3f12(0)) {
            function_f541e4e4edaa8e99(0, [0:var_af0662d6485d5d58], 0);
        }
        var_8807a0ecdc518571 function_a1df1f29568a9e00();
        if (isdefined(var_aac928f46654cbaf) && isfunction(var_aac928f46654cbaf)) {
            [[ var_aac928f46654cbaf ]]();
        } else {
            /#
                assertmsg("An init function was not properly passed in while registering this Activity Type: " + var_af0662d6485d5d58);
            #/
        }
    }
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa04
// Size: 0xc1
function function_86f446036c3c25a3(var_e640299f0b857863, var_3b094ac967cc591) {
    if (!function_34d878874ef424(var_3b094ac967cc591)) {
        var_45c17c8bd7095cc4 = spawnstruct();
        var_45c17c8bd7095cc4.var_c48ea022f8f30dc1 = 1;
        var_45c17c8bd7095cc4.var_e640299f0b857863 = var_e640299f0b857863;
        if (!isdefined(level.var_83abcb9b3a5dbe24.var_5357362cdc826253[var_e640299f0b857863])) {
            var_92b48cef37e16a18 = function_f6fcb473df19105c(var_45c17c8bd7095cc4);
            level.var_83abcb9b3a5dbe24.var_5357362cdc826253[var_e640299f0b857863] = var_92b48cef37e16a18.var_6d7b56b5a018bf17;
        }
        level.var_83abcb9b3a5dbe24.var_1d3d12d95e2fc1a5[var_3b094ac967cc591] = var_45c17c8bd7095cc4;
    }
    return level.var_83abcb9b3a5dbe24.var_1d3d12d95e2fc1a5[var_3b094ac967cc591];
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacd
// Size: 0x51
function function_edb2f945bfe8e85e(var_9334f359747f2eb4, var_2c0af78086726265) {
    if (isdefined(var_9334f359747f2eb4) && isdefined(var_2c0af78086726265) && isfunction(var_2c0af78086726265)) {
        level.var_83abcb9b3a5dbe24.var_eeb48d591aae0f9d[var_9334f359747f2eb4] = var_2c0af78086726265;
    } else {
        /#
            assertmsg("Tried to register a Nexus Override with an invalid override function or type");
        #/
    }
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb25
// Size: 0x5b
function function_89384091f7a2dbd(var_af0662d6485d5d58, var_8f07c7b330e08f30, var_2c0af78086726265) {
    var_8807a0ecdc518571 = level.var_83abcb9b3a5dbe24.types[var_af0662d6485d5d58];
    /#
        assertex(isdefined(var_8807a0ecdc518571), "Can't register an activity function override for an activity that has yet to be registered.");
    #/
    var_8807a0ecdc518571.var_aafc0e60bb520999[var_8f07c7b330e08f30] = var_2c0af78086726265;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb87
// Size: 0x9e
function function_104adc18c0d699c3(var_e6013eac45290cab, var_8f07c7b330e08f30, var_6f8af5eb76deac21) {
    var_af0662d6485d5d58 = function_de53ed8e35d0ed7a(var_e6013eac45290cab);
    /#
        assertex(isdefined(level.var_83abcb9b3a5dbe24.types[var_af0662d6485d5d58]), "Can't run an activity function override for an activity that has yet to be registered.");
    #/
    var_d969b8bdeafc5178 = function_811a0fab09c793ce(var_af0662d6485d5d58, var_8f07c7b330e08f30);
    /#
        assertex(isdefined(var_d969b8bdeafc5178), "The override type given was not found. Make sure to use the function override type consts in activity_constants.gsh");
    #/
    if (function_9b97c3ae49015fc6(var_8f07c7b330e08f30)) {
        if (isdefined(var_6f8af5eb76deac21)) {
            return var_e6013eac45290cab [[ var_d969b8bdeafc5178 ]](var_6f8af5eb76deac21);
        } else {
            return var_e6013eac45290cab [[ var_d969b8bdeafc5178 ]]();
        }
    }
    var_e6013eac45290cab thread function_d9c449df6f5a5dd3(var_e6013eac45290cab, var_d969b8bdeafc5178, var_6f8af5eb76deac21);
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2c
// Size: 0x65
function function_811a0fab09c793ce(var_af0662d6485d5d58, var_8f07c7b330e08f30) {
    /#
        assertex(isdefined(level.var_83abcb9b3a5dbe24.types[var_af0662d6485d5d58]), "Can't run an activity function override for an activity that has yet to be registered.");
    #/
    var_8807a0ecdc518571 = level.var_83abcb9b3a5dbe24.types[var_af0662d6485d5d58];
    return var_8807a0ecdc518571.var_aafc0e60bb520999[var_8f07c7b330e08f30];
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc99
// Size: 0xc
function function_efe441752cd7303d() {
    return level.var_83abcb9b3a5dbe24;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcad
// Size: 0x16
function function_c795f9c21a9bc8() {
    return level.var_83abcb9b3a5dbe24.var_bf211a27ae8b9ded;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccb
// Size: 0x21
function function_35c9943414b3e6ed(var_8f07c7b330e08f30) {
    return level.var_83abcb9b3a5dbe24.var_f2ff209054cff55f[var_8f07c7b330e08f30];
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf4
// Size: 0x16
function function_8e6b7fc389a5a9b3() {
    return level.var_83abcb9b3a5dbe24.var_95a5b3673c07cc00;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd12
// Size: 0x1f
function function_8ad3316a4c90145e() {
    var_cb660804b150adc3 = function_8e6b7fc389a5a9b3();
    return var_cb660804b150adc3.var_98b653a321a7b68a;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd39
// Size: 0x2a
function function_f96946a72c233e56(var_c8992e431d7ba2c8) {
    var_cb660804b150adc3 = function_8e6b7fc389a5a9b3();
    return var_cb660804b150adc3.var_cc3816954252444b[var_c8992e431d7ba2c8];
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6b
// Size: 0xd4
function function_8b5b2a3392fc7e2a(var_ffc5db804c3eff2c, callbackfunction, var_af0662d6485d5d58) {
    var_3a18f9695bfedc51 = level.var_83abcb9b3a5dbe24;
    if (isdefined(var_af0662d6485d5d58)) {
        /#
            assertex(isdefined(level.var_83abcb9b3a5dbe24.types[var_af0662d6485d5d58]), "This activity type has not yet been registered with the Activity Nexus.");
        #/
        var_3a18f9695bfedc51 = level.var_83abcb9b3a5dbe24.types[var_af0662d6485d5d58];
    }
    /#
        assertex(isdefined(var_3a18f9695bfedc51.var_ba1aaee263449c3c), "activityMomentCallbacks array not found on the level or activity type.");
    #/
    if (!isdefined(var_3a18f9695bfedc51.var_ba1aaee263449c3c[var_ffc5db804c3eff2c])) {
        var_3a18f9695bfedc51.var_ba1aaee263449c3c[var_ffc5db804c3eff2c] = [];
    }
    var_44f0389112bfccb2 = var_3a18f9695bfedc51.var_ba1aaee263449c3c[var_ffc5db804c3eff2c].size;
    var_3a18f9695bfedc51.var_ba1aaee263449c3c[var_ffc5db804c3eff2c][var_44f0389112bfccb2] = callbackfunction;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe46
// Size: 0x5f
function function_42ab09fd1c5bf443(var_ffc5db804c3eff2c, var_6f8af5eb76deac21) {
    function_38f500f64a70b3c8(level.var_83abcb9b3a5dbe24, var_ffc5db804c3eff2c, var_6f8af5eb76deac21);
    var_af0662d6485d5d58 = function_de53ed8e35d0ed7a(self);
    function_38f500f64a70b3c8(level.var_83abcb9b3a5dbe24.types[var_af0662d6485d5d58], var_ffc5db804c3eff2c, var_6f8af5eb76deac21);
    callback::callback(var_ffc5db804c3eff2c, var_6f8af5eb76deac21);
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeac
// Size: 0x2e
function function_34d878874ef424(var_626b45032e1892da) {
    var_7669bfa60fd97d51 = level.var_83abcb9b3a5dbe24.var_1d3d12d95e2fc1a5[var_626b45032e1892da];
    return isdefined(var_7669bfa60fd97d51);
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee2
// Size: 0x40
function function_1f3e343912ae15c5(var_fb5fdfafc29f4513) {
    var_e6013eac45290cab = level.var_83abcb9b3a5dbe24.instances[var_fb5fdfafc29f4513];
    if (!isdefined(var_e6013eac45290cab)) {
        /#
            assertmsg("The activity instance being retrieved is undefined");
        #/
    }
    return var_e6013eac45290cab;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2a
// Size: 0x59
function function_ac8de2bae6931ae3(var_e6013eac45290cab) {
    if (isdefined(var_e6013eac45290cab) && function_1c67ae607a61c6bb(var_e6013eac45290cab)) {
        var_fb5fdfafc29f4513 = function_f0f498aed6f8fa5d(var_e6013eac45290cab);
        var_8a040e43339bcd9c = level.var_83abcb9b3a5dbe24.instances[var_fb5fdfafc29f4513];
        return (isdefined(var_8a040e43339bcd9c) && var_8a040e43339bcd9c == var_e6013eac45290cab);
    }
    return 0;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8b
// Size: 0x16
function function_385b578f25b2e1f1() {
    return level.var_83abcb9b3a5dbe24.instances;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa9
// Size: 0x94
function function_ebcfa8f0cbb5cbf1(var_626b45032e1892da) {
    foreach (var_e6013eac45290cab in level.var_83abcb9b3a5dbe24.instances) {
        if (isdefined(var_e6013eac45290cab)) {
            if (var_e6013eac45290cab.var_626b45032e1892da == var_626b45032e1892da && !function_acc361d57f8a8d2a(var_e6013eac45290cab)) {
                return var_e6013eac45290cab;
            }
        }
    }
    /#
        iprintln("PlayerEnteredAwarenessZone");
    #/
    return undefined;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1045
// Size: 0xec
function function_8ba4c11453487949(point, var_67020853b5b45a1b, var_21a51c1826b9a6aa) {
    var_27c05912b904412b = undefined;
    closestdistance = undefined;
    var_67020853b5b45a1b = function_53c4c53197386572(var_67020853b5b45a1b, level.var_83abcb9b3a5dbe24.instances);
    foreach (var_e6013eac45290cab in var_67020853b5b45a1b) {
        var_c6581e6d07e94306 = !isdefined(var_21a51c1826b9a6aa) || function_93587d5ba6247f36(var_21a51c1826b9a6aa, var_e6013eac45290cab);
        if (var_c6581e6d07e94306) {
            distancesq = distancesquared(point, namespace_68dc261109a9503f::function_8988a4c89289d7f4(var_e6013eac45290cab));
            if (!isdefined(var_27c05912b904412b) || !isdefined(closestdistance) || distancesq < closestdistance) {
                closestdistance = distancesq;
                var_27c05912b904412b = var_e6013eac45290cab;
            }
        }
    }
    return var_27c05912b904412b;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1139
// Size: 0x45
function function_9a6951feddd3cd17(var_8deb605bbab4c5b2) {
    /#
        assertex(isdefined(level.var_83abcb9b3a5dbe24.var_fc24547823253662[var_8deb605bbab4c5b2]), "Distance type not recognized.");
    #/
    return level.var_83abcb9b3a5dbe24.var_fc24547823253662[var_8deb605bbab4c5b2];
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1186
// Size: 0x6d
function function_6d0db4a1a5cc2157(var_e6013eac45290cab) {
    var_2c05eb8510000fc0 = function_f0f498aed6f8fa5d(var_e6013eac45290cab);
    level.var_83abcb9b3a5dbe24.instances[var_2c05eb8510000fc0] = var_e6013eac45290cab;
    level.var_83abcb9b3a5dbe24.var_2bce13ff5b07c0f8[var_2c05eb8510000fc0] = var_e6013eac45290cab;
    if (function_602655b21cbe7767(var_e6013eac45290cab)) {
        level.var_83abcb9b3a5dbe24.var_dde04de762f05a54[var_2c05eb8510000fc0] = var_e6013eac45290cab;
    }
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11fa
// Size: 0x87
function function_d958ed0ac4ceaa91(var_e6013eac45290cab) {
    var_2c05eb8510000fc0 = function_f0f498aed6f8fa5d(var_e6013eac45290cab);
    level.var_83abcb9b3a5dbe24.var_da5e5d845600111b[level.var_83abcb9b3a5dbe24.var_da5e5d845600111b.size] = var_2c05eb8510000fc0;
    level.var_83abcb9b3a5dbe24.instances[var_2c05eb8510000fc0] = undefined;
    level.var_83abcb9b3a5dbe24.var_2bce13ff5b07c0f8[var_2c05eb8510000fc0] = undefined;
    level.var_83abcb9b3a5dbe24.var_dde04de762f05a54[var_2c05eb8510000fc0] = undefined;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1288
// Size: 0x16
function function_a5424c44da084d6e() {
    return level.var_83abcb9b3a5dbe24.var_ee5a705921acf056;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a6
// Size: 0x99
function function_43f81a2fd15f456() {
    if (level.var_83abcb9b3a5dbe24.var_da5e5d845600111b.size > 0) {
        id = level.var_83abcb9b3a5dbe24.var_da5e5d845600111b[0];
        level.var_83abcb9b3a5dbe24.var_da5e5d845600111b = array_remove(level.var_83abcb9b3a5dbe24.var_da5e5d845600111b, id);
        return id;
    } else {
        id = level.var_83abcb9b3a5dbe24.var_44b0386160008fd1;
        level.var_83abcb9b3a5dbe24.var_44b0386160008fd1++;
    }
    return id;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1347
// Size: 0x4a
function function_538af8a5b8170d0c(var_af0662d6485d5d58, var_8f07c7b330e08f30) {
    var_786451192a67717f = function_35c9943414b3e6ed(var_8f07c7b330e08f30);
    var_1a1dfe661b7858d3 = function_811a0fab09c793ce(var_af0662d6485d5d58, var_8f07c7b330e08f30);
    if (!isdefined(var_1a1dfe661b7858d3) || var_786451192a67717f == var_1a1dfe661b7858d3) {
        return 0;
    }
    return 1;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1399
// Size: 0x22
function function_71d38726159c3f12(var_9334f359747f2eb4) {
    return isdefined(level.var_83abcb9b3a5dbe24.var_eeb48d591aae0f9d[var_9334f359747f2eb4]);
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c3
// Size: 0xa0
function function_f541e4e4edaa8e99(var_9334f359747f2eb4, var_c1a3a9cf7d2963b8, var_3dfeb81d6a088812) {
    if (isdefined(level.var_83abcb9b3a5dbe24.var_eeb48d591aae0f9d[var_9334f359747f2eb4]) && isfunction(level.var_83abcb9b3a5dbe24.var_eeb48d591aae0f9d[var_9334f359747f2eb4])) {
        if (istrue(var_3dfeb81d6a088812)) {
            return self thread [[ level.var_83abcb9b3a5dbe24.var_eeb48d591aae0f9d[var_9334f359747f2eb4] ]](var_c1a3a9cf7d2963b8);
        } else {
            return [[ level.var_83abcb9b3a5dbe24.var_eeb48d591aae0f9d[var_9334f359747f2eb4] ]](var_c1a3a9cf7d2963b8);
        }
    } else {
        /#
            assertmsg("Tried to run a Nexus Override with an invalid override function or type");
        #/
    }
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146a
// Size: 0xae
function function_8288c27883885909(var_91cdbcd8f3d0e448, var_3ba893af46bd0cf6) {
    if (function_71d38726159c3f12(12)) {
        function_f541e4e4edaa8e99(12, [0:var_91cdbcd8f3d0e448, 1:var_3ba893af46bd0cf6]);
    } else if (var_3ba893af46bd0cf6 == "Hibernation_Zone") {
        var_df7744c202bfe48d = getdvarint(@"hash_6e5431373c266ed7", 10000);
        function_51ad14107ca158fb(var_91cdbcd8f3d0e448, "Hibernation_Zone", undefined, var_df7744c202bfe48d);
        if (function_1c67ae607a61c6bb(var_91cdbcd8f3d0e448)) {
            var_e6013eac45290cab = var_91cdbcd8f3d0e448;
            function_79e69463947d9e86(var_e6013eac45290cab, var_3ba893af46bd0cf6, &function_8988a4c89289d7f4, [0:var_e6013eac45290cab]);
        }
    } else {
        /#
            assertex("'UseGameModeDefault' was selected to define the: " + var_3ba893af46bd0cf6 + " zone but no Game Mode default or Nexus default has been specified for that zone.");
        #/
    }
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x151f
// Size: 0x22f
function private function_7549ff50f90523c9() {
    var_8f1b31034e6330fe = spawnstruct();
    var_8f1b31034e6330fe.types = [];
    var_8f1b31034e6330fe.var_1d3d12d95e2fc1a5 = [];
    var_8f1b31034e6330fe.instances = [];
    var_8f1b31034e6330fe.var_eeb48d591aae0f9d = [];
    var_8f1b31034e6330fe.var_f2ff209054cff55f = [];
    var_8f1b31034e6330fe.var_2bce13ff5b07c0f8 = [];
    var_8f1b31034e6330fe.var_dde04de762f05a54 = [];
    var_8f1b31034e6330fe.var_44b0386160008fd1 = 0;
    var_8f1b31034e6330fe.var_da5e5d845600111b = [];
    var_8f1b31034e6330fe.var_95a5b3673c07cc00 = function_8afa6d518fce0c31();
    var_8f1b31034e6330fe.var_387cbfd0e4364cec = function_63555ee8e5fb64fc(13);
    var_8f1b31034e6330fe.var_5357362cdc826253 = [];
    var_8f1b31034e6330fe.var_fc24547823253662 = [];
    var_8f1b31034e6330fe.var_fc24547823253662["Near"] = 1000;
    var_8f1b31034e6330fe.var_fc24547823253662["Mid"] = 2200;
    var_8f1b31034e6330fe.var_fc24547823253662["Far"] = 10000;
    var_8f1b31034e6330fe.var_f2ff209054cff55f[0] = &function_ff180ac87df3d300;
    var_8f1b31034e6330fe.var_f2ff209054cff55f[1] = &function_a0a0f0090c79260;
    var_8f1b31034e6330fe.var_f2ff209054cff55f[2] = &function_7cbe9a82eb78ca2c;
    var_8f1b31034e6330fe.var_f2ff209054cff55f[3] = &function_10752dbaaf34420f;
    var_8f1b31034e6330fe.var_f2ff209054cff55f[4] = &function_dfea1c389f5d4f78;
    var_8f1b31034e6330fe.var_f2ff209054cff55f[6] = &namespace_68375b5cba416e13::function_d8812f59f918bbc;
    var_8f1b31034e6330fe.var_f2ff209054cff55f[8] = &function_2d4b61447e3a46b0;
    var_8f1b31034e6330fe.var_bf211a27ae8b9ded = [0:"InstanceBegin", 1:"InstanceEnd", 2:"ActivityBegin", 3:"ActivityEnd", 4:"ActivitySuccess", 5:"ActivityFailure", 6:"PlayerJoin", 7:"PlayerLeave", 8:"PlayerAbandon", 9:"PlayerRefocusedOnActivity", 10:"PlayerEnteredAwarenessZone", 11:"PlayerExitedAwarenessZone", 12:"ActivityStartedHibernation", 13:"ActivityStoppedHibernating", 14:"RewardsSpawned"];
    var_8f1b31034e6330fe function_a1df1f29568a9e00();
    return var_8f1b31034e6330fe;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1756
// Size: 0x48
function private function_8afa6d518fce0c31() {
    var_95a5b3673c07cc00 = spawnstruct();
    var_95a5b3673c07cc00.var_98b653a321a7b68a = [];
    var_95a5b3673c07cc00.var_cc3816954252444b = [];
    var_95a5b3673c07cc00.var_f86621f26a29c23 = [];
    var_95a5b3673c07cc00.var_c75eef4add685c33 = [];
    return var_95a5b3673c07cc00;
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17a6
// Size: 0x24
function private function_32e7e3d48cd4aec3() {
    var_95a5b3673c07cc00 = function_8e6b7fc389a5a9b3();
    function_af55a41660207bbc(var_95a5b3673c07cc00);
    function_4ed58a73c2ce41ab(var_95a5b3673c07cc00);
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17d1
// Size: 0x255
function private function_af55a41660207bbc(var_95a5b3673c07cc00) {
    var_2fb2947eb2d22b23 = getscriptbundlenames("activityplayerbroadcast");
    foreach (var_6ea03325be11baa0 in var_2fb2947eb2d22b23) {
        var_35ab718ef0636efb = getscriptbundle(var_6ea03325be11baa0);
        if (isdefined(var_35ab718ef0636efb)) {
            var_3bfa54c1785e4e4e = isdefined(var_35ab718ef0636efb.var_76fc63fd0797ef6c) && var_35ab718ef0636efb.var_76fc63fd0797ef6c.size > 0;
            var_88aaf009d452257d = isdefined(var_35ab718ef0636efb.var_3fe16a38efe52773) && var_35ab718ef0636efb.var_3fe16a38efe52773.size > 0;
            if (var_3bfa54c1785e4e4e && var_88aaf009d452257d) {
                var_be35ef62a3780222 = var_35ab718ef0636efb.var_3fe16a38efe52773[0].var_cf0d4d8cc5ac99a4;
                if (istrue(var_be35ef62a3780222.var_74af9703f56e96e)) {
                    foreach (var_d54e25f7cf5c1e97 in var_35ab718ef0636efb.var_76fc63fd0797ef6c) {
                        var_95a5b3673c07cc00.var_98b653a321a7b68a[var_95a5b3673c07cc00.var_98b653a321a7b68a.size] = var_d54e25f7cf5c1e97;
                    }
                } else if (istrue(var_be35ef62a3780222.var_8fce79a777b2ac76) && isdefined(var_be35ef62a3780222.var_c8992e431d7ba2c8)) {
                    var_3443ff296e009618 = var_be35ef62a3780222.var_c8992e431d7ba2c8;
                    /#
                        assertex(var_3443ff296e009618 != "None", "The bundle specifies that these broadcasts should be shared with activities of a specific Category but the specified category is 'None.'");
                    #/
                    if (!isdefined(var_95a5b3673c07cc00.var_cc3816954252444b[var_3443ff296e009618])) {
                        var_95a5b3673c07cc00.var_cc3816954252444b[var_3443ff296e009618] = [];
                    }
                    foreach (var_d54e25f7cf5c1e97 in var_35ab718ef0636efb.var_76fc63fd0797ef6c) {
                        var_fe4798ea52c4c5e9 = var_95a5b3673c07cc00.var_cc3816954252444b[var_3443ff296e009618].size;
                        var_95a5b3673c07cc00.var_cc3816954252444b[var_3443ff296e009618][var_fe4798ea52c4c5e9] = var_d54e25f7cf5c1e97;
                    }
                }
            }
        }
    }
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a2d
// Size: 0x80
function private function_4ed58a73c2ce41ab(var_95a5b3673c07cc00) {
    var_2fb2947eb2d22b23 = getscriptbundlenames("activityrewards");
    foreach (bundlename in var_2fb2947eb2d22b23) {
        bundle = getscriptbundle(bundlename);
        function_15cb7fa5c8bd7af(var_95a5b3673c07cc00, bundle);
    }
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ab4
// Size: 0xbe
function private function_15cb7fa5c8bd7af(var_95a5b3673c07cc00, var_2903e6c44924f6ec) {
    sharingtype = namespace_e81b1392df0afa31::function_58747b8d28c68355(var_2903e6c44924f6ec);
    if (!isdefined(sharingtype) || sharingtype == "DontShareWithActivities") {
        return;
    }
    var_a345cb4944cee5b2 = namespace_e81b1392df0afa31::function_956d43b7266a97d9(var_2903e6c44924f6ec);
    if (!isdefined(var_a345cb4944cee5b2) || var_a345cb4944cee5b2.size == 0) {
        return;
    }
    switch (sharingtype) {
    case #"hash_5e3671de7b9f5a2a":
        function_92dcb4f9cb079209(var_95a5b3673c07cc00, var_a345cb4944cee5b2);
    case #"hash_31d6baffebed40ac":
        var_6e483160d233b2c5 = namespace_e81b1392df0afa31::function_1a30bd41682cb81f(var_2903e6c44924f6ec);
        function_984ca6c5fcea2278(var_95a5b3673c07cc00, var_6e483160d233b2c5, var_a345cb4944cee5b2);
    default:
        /#
            assertmsg("Unrecognized activity rewards sharing type: " + sharingtype);
        #/
        return;
    }
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b79
// Size: 0x73
function private function_92dcb4f9cb079209(var_95a5b3673c07cc00, var_a345cb4944cee5b2) {
    foreach (var_e981cd0e1539bc38 in var_a345cb4944cee5b2) {
        var_95a5b3673c07cc00.var_f86621f26a29c23[var_95a5b3673c07cc00.var_f86621f26a29c23.size] = var_e981cd0e1539bc38;
    }
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1bf3
// Size: 0xcb
function private function_984ca6c5fcea2278(var_95a5b3673c07cc00, var_6e483160d233b2c5, var_a345cb4944cee5b2) {
    /#
        assert(isdefined(var_6e483160d233b2c5));
    #/
    /#
        assertex(var_6e483160d233b2c5 != "None", "The shared rewards bundle specifies that these objects should be shared with activities of a specific Category but the specified category is 'None.'");
    #/
    if (!isdefined(var_95a5b3673c07cc00.var_c75eef4add685c33[var_6e483160d233b2c5])) {
        var_95a5b3673c07cc00.var_c75eef4add685c33[var_6e483160d233b2c5] = [];
    }
    foreach (var_e981cd0e1539bc38 in var_a345cb4944cee5b2) {
        size = var_95a5b3673c07cc00.var_c75eef4add685c33[var_6e483160d233b2c5].size;
        var_95a5b3673c07cc00.var_c75eef4add685c33[var_6e483160d233b2c5][size] = var_e981cd0e1539bc38;
    }
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cc5
// Size: 0x27
function private function_dbdf04ed40266c5(var_9334f359747f2eb4, function) {
    if (!function_71d38726159c3f12(var_9334f359747f2eb4)) {
        function_edb2f945bfe8e85e(var_9334f359747f2eb4, function);
    }
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cf3
// Size: 0x3e
function private function_9b97c3ae49015fc6(var_8f07c7b330e08f30) {
    var_97fa13ca6fe97871 = [0:4, 1:5, 2:6, 3:7, 4:8];
    return array_contains(var_97fa13ca6fe97871, var_8f07c7b330e08f30);
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d39
// Size: 0x56
function private function_d9c449df6f5a5dd3(var_e6013eac45290cab, var_2c0af78086726265, var_6f8af5eb76deac21) {
    var_e6013eac45290cab endon("instance_destroyed");
    if (isdefined(var_2c0af78086726265) && isfunction(var_2c0af78086726265)) {
        if (isdefined(var_6f8af5eb76deac21)) {
            var_e6013eac45290cab [[ var_2c0af78086726265 ]](var_6f8af5eb76deac21);
        } else {
            var_e6013eac45290cab [[ var_2c0af78086726265 ]]();
        }
    } else {
        /#
            assertmsg("The Activity Function Override is not properly defined");
        #/
    }
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d96
// Size: 0xa5
function private function_38f500f64a70b3c8(var_59d8a74634778ff2, var_ffc5db804c3eff2c, var_6f8af5eb76deac21) {
    var_72e1d54d0776d39e = isdefined(var_59d8a74634778ff2.var_ba1aaee263449c3c[var_ffc5db804c3eff2c]) && var_59d8a74634778ff2.var_ba1aaee263449c3c[var_ffc5db804c3eff2c].size > 0;
    if (var_72e1d54d0776d39e) {
        foreach (callback in var_59d8a74634778ff2.var_ba1aaee263449c3c[var_ffc5db804c3eff2c]) {
            self thread [[ callback ]](var_6f8af5eb76deac21);
        }
    }
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e42
// Size: 0xd
function private function_a1df1f29568a9e00() {
    self.var_ba1aaee263449c3c = [];
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e56
// Size: 0x81
function private function_7b88d59f853b6833(var_6f8af5eb76deac21) {
    var_e6013eac45290cab = self;
    var_2c05eb8510000fc0 = function_f0f498aed6f8fa5d(var_e6013eac45290cab);
    if (var_6f8af5eb76deac21.var_ffc5db804c3eff2c == "ActivityStartedHibernation") {
        level.var_83abcb9b3a5dbe24.var_2bce13ff5b07c0f8[var_2c05eb8510000fc0] = undefined;
    } else if (var_6f8af5eb76deac21.var_ffc5db804c3eff2c == "ActivityStoppedHibernating") {
        level.var_83abcb9b3a5dbe24.var_2bce13ff5b07c0f8[var_2c05eb8510000fc0] = var_e6013eac45290cab;
    }
}

// Namespace namespace_4faa6169000e657c/namespace_70aa82e7f409bc33
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ede
// Size: 0x6a
function private function_52a69420197eee1e(var_6f8af5eb76deac21) {
    var_e6013eac45290cab = self;
    var_2c05eb8510000fc0 = function_f0f498aed6f8fa5d(var_e6013eac45290cab);
    if (var_e6013eac45290cab.var_6c29f2fdb0054bbe.size == 0) {
        level.var_83abcb9b3a5dbe24.var_dde04de762f05a54[var_2c05eb8510000fc0] = var_e6013eac45290cab;
    } else {
        level.var_83abcb9b3a5dbe24.var_dde04de762f05a54[var_2c05eb8510000fc0] = undefined;
    }
}

