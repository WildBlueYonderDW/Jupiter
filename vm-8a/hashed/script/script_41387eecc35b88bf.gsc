#using scripts\engine\utility.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
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

#namespace activity_common;

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b9
// Size: 0xe1
function function_89929df8c53338f7() {
    if (isdefined(level.activities)) {
        return;
    }
    level.activities = function_7549ff50f90523c9();
    function_c71c80e21eeb98b0();
    function_c993d376e8f10816(level.activities);
    function_9c328f2f2bc853e6(level.activities);
    function_8dd9dcec6a76bffa(level.activities);
    function_32e7e3d48cd4aec3();
    function_dbdf04ed40266c5(1, &setupinstance);
    function_dbdf04ed40266c5(8, &function_7945819e2d7fc956);
    function_dbdf04ed40266c5(7, &function_38b174f96132d2b4);
    scripts\engine\scriptable::scriptable_addusedcallback(&function_daec7b884974dd17);
    function_8b5b2a3392fc7e2a("ActivityStartedHibernation", &function_7b88d59f853b6833);
    function_8b5b2a3392fc7e2a("ActivityStoppedHibernating", &function_7b88d59f853b6833);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_52a69420197eee1e);
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_52a69420197eee1e);
    /#
        namespace_bcc754285d90ffd9::function_b6f69d3336218238();
    #/
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a2
// Size: 0x15a
function function_8e0a16f0ca8e45e9(activitytype, initfunction) {
    if (!isdefined(level.activities.types[activitytype])) {
        level.activities.types[activitytype] = spawnstruct();
        var_8807a0ecdc518571 = level.activities.types[activitytype];
        var_8807a0ecdc518571.commonfunctions = [];
        var_8807a0ecdc518571.commonfunctions[0] = function_35c9943414b3e6ed(0);
        var_8807a0ecdc518571.commonfunctions[1] = function_35c9943414b3e6ed(1);
        var_8807a0ecdc518571.commonfunctions[2] = function_35c9943414b3e6ed(2);
        var_8807a0ecdc518571.commonfunctions[3] = function_35c9943414b3e6ed(3);
        var_8807a0ecdc518571.commonfunctions[4] = function_35c9943414b3e6ed(4);
        var_8807a0ecdc518571.commonfunctions[6] = function_35c9943414b3e6ed(6);
        var_8807a0ecdc518571.commonfunctions[8] = function_35c9943414b3e6ed(8);
        if (function_71d38726159c3f12(0)) {
            function_f541e4e4edaa8e99(0, [activitytype], 0);
        }
        var_8807a0ecdc518571 function_a1df1f29568a9e00();
        if (isdefined(initfunction) && isfunction(initfunction)) {
            [[ initfunction ]]();
            return;
        }
        assertmsg("An init function was not properly passed in while registering this Activity Type: " + activitytype);
    }
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa04
// Size: 0xc0
function function_86f446036c3c25a3(associatedscriptbundlename, var_3b094ac967cc591) {
    if (!function_34d878874ef424(var_3b094ac967cc591)) {
        var_45c17c8bd7095cc4 = spawnstruct();
        var_45c17c8bd7095cc4.var_c48ea022f8f30dc1 = 1;
        var_45c17c8bd7095cc4.associatedscriptbundlename = associatedscriptbundlename;
        if (!isdefined(level.activities.var_5357362cdc826253[associatedscriptbundlename])) {
            var_92b48cef37e16a18 = function_f6fcb473df19105c(var_45c17c8bd7095cc4);
            level.activities.var_5357362cdc826253[associatedscriptbundlename] = var_92b48cef37e16a18.customproperties;
        }
        level.activities.definitions[var_3b094ac967cc591] = var_45c17c8bd7095cc4;
    }
    return level.activities.definitions[var_3b094ac967cc591];
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacd
// Size: 0x50
function function_edb2f945bfe8e85e(var_9334f359747f2eb4, overridefunction) {
    if (isdefined(var_9334f359747f2eb4) && isdefined(overridefunction) && isfunction(overridefunction)) {
        level.activities.var_eeb48d591aae0f9d[var_9334f359747f2eb4] = overridefunction;
        return;
    }
    assertmsg("Tried to register a Nexus Override with an invalid override function or type");
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb25
// Size: 0x5a
function function_89384091f7a2dbd(activitytype, var_8f07c7b330e08f30, overridefunction) {
    var_8807a0ecdc518571 = level.activities.types[activitytype];
    assertex(isdefined(var_8807a0ecdc518571), "Can't register an activity function override for an activity that has yet to be registered.");
    var_8807a0ecdc518571.commonfunctions[var_8f07c7b330e08f30] = overridefunction;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb87
// Size: 0x9d
function function_104adc18c0d699c3(activityinstance, var_8f07c7b330e08f30, var_6f8af5eb76deac21) {
    activitytype = function_de53ed8e35d0ed7a(activityinstance);
    assertex(isdefined(level.activities.types[activitytype]), "Can't run an activity function override for an activity that has yet to be registered.");
    activityfunction = function_811a0fab09c793ce(activitytype, var_8f07c7b330e08f30);
    assertex(isdefined(activityfunction), "The override type given was not found. Make sure to use the function override type consts in activity_constants.gsh");
    if (function_9b97c3ae49015fc6(var_8f07c7b330e08f30)) {
        if (isdefined(var_6f8af5eb76deac21)) {
            return activityinstance [[ activityfunction ]](var_6f8af5eb76deac21);
        } else {
            return activityinstance [[ activityfunction ]]();
        }
    }
    activityinstance thread function_d9c449df6f5a5dd3(activityinstance, activityfunction, var_6f8af5eb76deac21);
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2c
// Size: 0x64
function function_811a0fab09c793ce(activitytype, var_8f07c7b330e08f30) {
    assertex(isdefined(level.activities.types[activitytype]), "Can't run an activity function override for an activity that has yet to be registered.");
    var_8807a0ecdc518571 = level.activities.types[activitytype];
    return var_8807a0ecdc518571.commonfunctions[var_8f07c7b330e08f30];
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc99
// Size: 0xb
function function_efe441752cd7303d() {
    return level.activities;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcad
// Size: 0x15
function function_c795f9c21a9bc8() {
    return level.activities.var_bf211a27ae8b9ded;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccb
// Size: 0x20
function function_35c9943414b3e6ed(var_8f07c7b330e08f30) {
    return level.activities.defaultfunctions[var_8f07c7b330e08f30];
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf4
// Size: 0x15
function function_8e6b7fc389a5a9b3() {
    return level.activities.var_95a5b3673c07cc00;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd12
// Size: 0x1e
function function_8ad3316a4c90145e() {
    var_cb660804b150adc3 = function_8e6b7fc389a5a9b3();
    return var_cb660804b150adc3.var_98b653a321a7b68a;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd39
// Size: 0x29
function function_f96946a72c233e56(activitycategory) {
    var_cb660804b150adc3 = function_8e6b7fc389a5a9b3();
    return var_cb660804b150adc3.var_cc3816954252444b[activitycategory];
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6b
// Size: 0xd3
function function_8b5b2a3392fc7e2a(activitymoment, callbackfunction, activitytype) {
    callbackcontainer = level.activities;
    if (isdefined(activitytype)) {
        assertex(isdefined(level.activities.types[activitytype]), "This activity type has not yet been registered with the Activity Nexus.");
        callbackcontainer = level.activities.types[activitytype];
    }
    assertex(isdefined(callbackcontainer.var_ba1aaee263449c3c), "activityMomentCallbacks array not found on the level or activity type.");
    if (!isdefined(callbackcontainer.var_ba1aaee263449c3c[activitymoment])) {
        callbackcontainer.var_ba1aaee263449c3c[activitymoment] = [];
    }
    var_44f0389112bfccb2 = callbackcontainer.var_ba1aaee263449c3c[activitymoment].size;
    callbackcontainer.var_ba1aaee263449c3c[activitymoment][var_44f0389112bfccb2] = callbackfunction;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe46
// Size: 0x5e
function function_42ab09fd1c5bf443(activitymoment, var_6f8af5eb76deac21) {
    function_38f500f64a70b3c8(level.activities, activitymoment, var_6f8af5eb76deac21);
    activitytype = function_de53ed8e35d0ed7a(self);
    function_38f500f64a70b3c8(level.activities.types[activitytype], activitymoment, var_6f8af5eb76deac21);
    callback::callback(activitymoment, var_6f8af5eb76deac21);
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeac
// Size: 0x2d
function function_34d878874ef424(varianttag) {
    activitydefinition = level.activities.definitions[varianttag];
    return isdefined(activitydefinition);
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee2
// Size: 0x3f
function function_1f3e343912ae15c5(instanceid) {
    activityinstance = level.activities.instances[instanceid];
    if (!isdefined(activityinstance)) {
        assertmsg("The activity instance being retrieved is undefined");
    }
    return activityinstance;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2a
// Size: 0x58
function function_ac8de2bae6931ae3(activityinstance) {
    if (isdefined(activityinstance) && function_1c67ae607a61c6bb(activityinstance)) {
        instanceid = function_f0f498aed6f8fa5d(activityinstance);
        var_8a040e43339bcd9c = level.activities.instances[instanceid];
        return (isdefined(var_8a040e43339bcd9c) && var_8a040e43339bcd9c == activityinstance);
    }
    return false;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8b
// Size: 0x15
function function_385b578f25b2e1f1() {
    return level.activities.instances;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa9
// Size: 0x93
function function_ebcfa8f0cbb5cbf1(varianttag) {
    foreach (activityinstance in level.activities.instances) {
        if (isdefined(activityinstance)) {
            if (activityinstance.varianttag == varianttag && !function_acc361d57f8a8d2a(activityinstance)) {
                return activityinstance;
            }
        }
    }
    /#
        iprintln("<dev string:x1c>");
    #/
    return undefined;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1045
// Size: 0xeb
function function_8ba4c11453487949(point, var_67020853b5b45a1b, var_21a51c1826b9a6aa) {
    closestinstance = undefined;
    closestdistance = undefined;
    var_67020853b5b45a1b = default_to(var_67020853b5b45a1b, level.activities.instances);
    foreach (activityinstance in var_67020853b5b45a1b) {
        var_c6581e6d07e94306 = !isdefined(var_21a51c1826b9a6aa) || function_93587d5ba6247f36(var_21a51c1826b9a6aa, activityinstance);
        if (var_c6581e6d07e94306) {
            distancesq = distancesquared(point, namespace_68dc261109a9503f::function_8988a4c89289d7f4(activityinstance));
            if (!isdefined(closestinstance) || !isdefined(closestdistance) || distancesq < closestdistance) {
                closestdistance = distancesq;
                closestinstance = activityinstance;
            }
        }
    }
    return closestinstance;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1139
// Size: 0x44
function function_9a6951feddd3cd17(var_8deb605bbab4c5b2) {
    assertex(isdefined(level.activities.var_fc24547823253662[var_8deb605bbab4c5b2]), "Distance type not recognized.");
    return level.activities.var_fc24547823253662[var_8deb605bbab4c5b2];
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1186
// Size: 0x6c
function function_6d0db4a1a5cc2157(activityinstance) {
    instid = function_f0f498aed6f8fa5d(activityinstance);
    level.activities.instances[instid] = activityinstance;
    level.activities.var_2bce13ff5b07c0f8[instid] = activityinstance;
    if (function_602655b21cbe7767(activityinstance)) {
        level.activities.var_dde04de762f05a54[instid] = activityinstance;
    }
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11fa
// Size: 0x86
function function_d958ed0ac4ceaa91(activityinstance) {
    instid = function_f0f498aed6f8fa5d(activityinstance);
    level.activities.var_da5e5d845600111b[level.activities.var_da5e5d845600111b.size] = instid;
    level.activities.instances[instid] = undefined;
    level.activities.var_2bce13ff5b07c0f8[instid] = undefined;
    level.activities.var_dde04de762f05a54[instid] = undefined;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1288
// Size: 0x15
function function_a5424c44da084d6e() {
    return level.activities.var_ee5a705921acf056;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a6
// Size: 0x98
function function_43f81a2fd15f456() {
    if (level.activities.var_da5e5d845600111b.size > 0) {
        id = level.activities.var_da5e5d845600111b[0];
        level.activities.var_da5e5d845600111b = array_remove(level.activities.var_da5e5d845600111b, id);
        return id;
    } else {
        id = level.activities.var_44b0386160008fd1;
        level.activities.var_44b0386160008fd1++;
    }
    return id;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1347
// Size: 0x49
function function_538af8a5b8170d0c(activitytype, var_8f07c7b330e08f30) {
    var_786451192a67717f = function_35c9943414b3e6ed(var_8f07c7b330e08f30);
    var_1a1dfe661b7858d3 = function_811a0fab09c793ce(activitytype, var_8f07c7b330e08f30);
    if (!isdefined(var_1a1dfe661b7858d3) || var_786451192a67717f == var_1a1dfe661b7858d3) {
        return false;
    }
    return true;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1399
// Size: 0x21
function function_71d38726159c3f12(var_9334f359747f2eb4) {
    return isdefined(level.activities.var_eeb48d591aae0f9d[var_9334f359747f2eb4]);
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c3
// Size: 0x9f
function function_f541e4e4edaa8e99(var_9334f359747f2eb4, relevantparameters, shouldthread) {
    if (isdefined(level.activities.var_eeb48d591aae0f9d[var_9334f359747f2eb4]) && isfunction(level.activities.var_eeb48d591aae0f9d[var_9334f359747f2eb4])) {
        if (istrue(shouldthread)) {
            return self thread [[ level.activities.var_eeb48d591aae0f9d[var_9334f359747f2eb4] ]](relevantparameters);
        } else {
            return [[ level.activities.var_eeb48d591aae0f9d[var_9334f359747f2eb4] ]](relevantparameters);
        }
        return;
    }
    assertmsg("Tried to run a Nexus Override with an invalid override function or type");
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146a
// Size: 0xad
function function_8288c27883885909(var_91cdbcd8f3d0e448, spatialzonename) {
    if (function_71d38726159c3f12(12)) {
        function_f541e4e4edaa8e99(12, [var_91cdbcd8f3d0e448, spatialzonename]);
        return;
    }
    if (spatialzonename == "Hibernation_Zone") {
        var_df7744c202bfe48d = getdvarint(@"hash_6e5431373c266ed7", 10000);
        function_51ad14107ca158fb(var_91cdbcd8f3d0e448, "Hibernation_Zone", undefined, var_df7744c202bfe48d);
        if (function_1c67ae607a61c6bb(var_91cdbcd8f3d0e448)) {
            activityinstance = var_91cdbcd8f3d0e448;
            function_79e69463947d9e86(activityinstance, spatialzonename, &function_8988a4c89289d7f4, [activityinstance]);
        }
        return;
    }
    assertex("'UseGameModeDefault' was selected to define the: " + spatialzonename + " zone but no Game Mode default or Nexus default has been specified for that zone.");
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x151f
// Size: 0x22e
function private function_7549ff50f90523c9() {
    var_8f1b31034e6330fe = spawnstruct();
    var_8f1b31034e6330fe.types = [];
    var_8f1b31034e6330fe.definitions = [];
    var_8f1b31034e6330fe.instances = [];
    var_8f1b31034e6330fe.var_eeb48d591aae0f9d = [];
    var_8f1b31034e6330fe.defaultfunctions = [];
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
    var_8f1b31034e6330fe.defaultfunctions[0] = &function_ff180ac87df3d300;
    var_8f1b31034e6330fe.defaultfunctions[1] = &function_a0a0f0090c79260;
    var_8f1b31034e6330fe.defaultfunctions[2] = &function_7cbe9a82eb78ca2c;
    var_8f1b31034e6330fe.defaultfunctions[3] = &function_10752dbaaf34420f;
    var_8f1b31034e6330fe.defaultfunctions[4] = &function_dfea1c389f5d4f78;
    var_8f1b31034e6330fe.defaultfunctions[6] = &activity_rewards::function_d8812f59f918bbc;
    var_8f1b31034e6330fe.defaultfunctions[8] = &function_2d4b61447e3a46b0;
    var_8f1b31034e6330fe.var_bf211a27ae8b9ded = ["InstanceBegin", "InstanceEnd", "ActivityBegin", "ActivityEnd", "ActivitySuccess", "ActivityFailure", "PlayerJoin", "PlayerLeave", "PlayerAbandon", "PlayerRefocusedOnActivity", "PlayerEnteredAwarenessZone", "PlayerExitedAwarenessZone", "ActivityStartedHibernation", "ActivityStoppedHibernating", "RewardsSpawned"];
    var_8f1b31034e6330fe function_a1df1f29568a9e00();
    return var_8f1b31034e6330fe;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1756
// Size: 0x47
function private function_8afa6d518fce0c31() {
    var_95a5b3673c07cc00 = spawnstruct();
    var_95a5b3673c07cc00.var_98b653a321a7b68a = [];
    var_95a5b3673c07cc00.var_cc3816954252444b = [];
    var_95a5b3673c07cc00.var_f86621f26a29c23 = [];
    var_95a5b3673c07cc00.var_c75eef4add685c33 = [];
    return var_95a5b3673c07cc00;
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17a6
// Size: 0x23
function private function_32e7e3d48cd4aec3() {
    var_95a5b3673c07cc00 = function_8e6b7fc389a5a9b3();
    function_af55a41660207bbc(var_95a5b3673c07cc00);
    function_4ed58a73c2ce41ab(var_95a5b3673c07cc00);
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17d1
// Size: 0x254
function private function_af55a41660207bbc(var_95a5b3673c07cc00) {
    bundlenames = getscriptbundlenames("activityplayerbroadcast");
    foreach (var_6ea03325be11baa0 in bundlenames) {
        var_35ab718ef0636efb = getscriptbundle(var_6ea03325be11baa0);
        if (isdefined(var_35ab718ef0636efb)) {
            var_3bfa54c1785e4e4e = isdefined(var_35ab718ef0636efb.var_76fc63fd0797ef6c) && var_35ab718ef0636efb.var_76fc63fd0797ef6c.size > 0;
            var_88aaf009d452257d = isdefined(var_35ab718ef0636efb.sharingoptions) && var_35ab718ef0636efb.sharingoptions.size > 0;
            if (var_3bfa54c1785e4e4e && var_88aaf009d452257d) {
                var_be35ef62a3780222 = var_35ab718ef0636efb.sharingoptions[0].variant_object;
                if (istrue(var_be35ef62a3780222.var_74af9703f56e96e)) {
                    foreach (playerbroadcast in var_35ab718ef0636efb.var_76fc63fd0797ef6c) {
                        var_95a5b3673c07cc00.var_98b653a321a7b68a[var_95a5b3673c07cc00.var_98b653a321a7b68a.size] = playerbroadcast;
                    }
                    continue;
                }
                if (istrue(var_be35ef62a3780222.var_8fce79a777b2ac76) && isdefined(var_be35ef62a3780222.activitycategory)) {
                    var_3443ff296e009618 = var_be35ef62a3780222.activitycategory;
                    assertex(var_3443ff296e009618 != "None", "The bundle specifies that these broadcasts should be shared with activities of a specific Category but the specified category is 'None.'");
                    if (!isdefined(var_95a5b3673c07cc00.var_cc3816954252444b[var_3443ff296e009618])) {
                        var_95a5b3673c07cc00.var_cc3816954252444b[var_3443ff296e009618] = [];
                    }
                    foreach (playerbroadcast in var_35ab718ef0636efb.var_76fc63fd0797ef6c) {
                        var_fe4798ea52c4c5e9 = var_95a5b3673c07cc00.var_cc3816954252444b[var_3443ff296e009618].size;
                        var_95a5b3673c07cc00.var_cc3816954252444b[var_3443ff296e009618][var_fe4798ea52c4c5e9] = playerbroadcast;
                    }
                }
            }
        }
    }
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a2d
// Size: 0x7f
function private function_4ed58a73c2ce41ab(var_95a5b3673c07cc00) {
    bundlenames = getscriptbundlenames("activityrewards");
    foreach (bundlename in bundlenames) {
        bundle = getscriptbundle(bundlename);
        function_15cb7fa5c8bd7af(var_95a5b3673c07cc00, bundle);
    }
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ab4
// Size: 0xbd
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
        return;
    case #"hash_31d6baffebed40ac": 
        categorytype = namespace_e81b1392df0afa31::function_1a30bd41682cb81f(var_2903e6c44924f6ec);
        function_984ca6c5fcea2278(var_95a5b3673c07cc00, categorytype, var_a345cb4944cee5b2);
        return;
    default: 
        assertmsg("Unrecognized activity rewards sharing type: " + sharingtype);
        return;
    }
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b79
// Size: 0x72
function private function_92dcb4f9cb079209(var_95a5b3673c07cc00, var_a345cb4944cee5b2) {
    foreach (var_e981cd0e1539bc38 in var_a345cb4944cee5b2) {
        var_95a5b3673c07cc00.var_f86621f26a29c23[var_95a5b3673c07cc00.var_f86621f26a29c23.size] = var_e981cd0e1539bc38;
    }
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1bf3
// Size: 0xca
function private function_984ca6c5fcea2278(var_95a5b3673c07cc00, categorytype, var_a345cb4944cee5b2) {
    assert(isdefined(categorytype));
    assertex(categorytype != "None", "The shared rewards bundle specifies that these objects should be shared with activities of a specific Category but the specified category is 'None.'");
    if (!isdefined(var_95a5b3673c07cc00.var_c75eef4add685c33[categorytype])) {
        var_95a5b3673c07cc00.var_c75eef4add685c33[categorytype] = [];
    }
    foreach (var_e981cd0e1539bc38 in var_a345cb4944cee5b2) {
        size = var_95a5b3673c07cc00.var_c75eef4add685c33[categorytype].size;
        var_95a5b3673c07cc00.var_c75eef4add685c33[categorytype][size] = var_e981cd0e1539bc38;
    }
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cc5
// Size: 0x26
function private function_dbdf04ed40266c5(var_9334f359747f2eb4, function) {
    if (!function_71d38726159c3f12(var_9334f359747f2eb4)) {
        function_edb2f945bfe8e85e(var_9334f359747f2eb4, function);
    }
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cf3
// Size: 0x3d
function private function_9b97c3ae49015fc6(var_8f07c7b330e08f30) {
    var_97fa13ca6fe97871 = [4, 5, 6, 7, 8];
    return array_contains(var_97fa13ca6fe97871, var_8f07c7b330e08f30);
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d39
// Size: 0x55
function private function_d9c449df6f5a5dd3(activityinstance, overridefunction, var_6f8af5eb76deac21) {
    activityinstance endon("instance_destroyed");
    if (isdefined(overridefunction) && isfunction(overridefunction)) {
        if (isdefined(var_6f8af5eb76deac21)) {
            activityinstance [[ overridefunction ]](var_6f8af5eb76deac21);
        } else {
            activityinstance [[ overridefunction ]]();
        }
        return;
    }
    assertmsg("The Activity Function Override is not properly defined");
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d96
// Size: 0xa4
function private function_38f500f64a70b3c8(var_59d8a74634778ff2, activitymoment, var_6f8af5eb76deac21) {
    var_72e1d54d0776d39e = isdefined(var_59d8a74634778ff2.var_ba1aaee263449c3c[activitymoment]) && var_59d8a74634778ff2.var_ba1aaee263449c3c[activitymoment].size > 0;
    if (var_72e1d54d0776d39e) {
        foreach (callback in var_59d8a74634778ff2.var_ba1aaee263449c3c[activitymoment]) {
            self thread [[ callback ]](var_6f8af5eb76deac21);
        }
    }
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e42
// Size: 0xc
function private function_a1df1f29568a9e00() {
    self.var_ba1aaee263449c3c = [];
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e56
// Size: 0x80
function private function_7b88d59f853b6833(var_6f8af5eb76deac21) {
    activityinstance = self;
    instid = function_f0f498aed6f8fa5d(activityinstance);
    if (var_6f8af5eb76deac21.activitymoment == "ActivityStartedHibernation") {
        level.activities.var_2bce13ff5b07c0f8[instid] = undefined;
        return;
    }
    if (var_6f8af5eb76deac21.activitymoment == "ActivityStoppedHibernating") {
        level.activities.var_2bce13ff5b07c0f8[instid] = activityinstance;
    }
}

// Namespace activity_common / namespace_70aa82e7f409bc33
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ede
// Size: 0x69
function private function_52a69420197eee1e(var_6f8af5eb76deac21) {
    activityinstance = self;
    instid = function_f0f498aed6f8fa5d(activityinstance);
    if (activityinstance.var_6c29f2fdb0054bbe.size == 0) {
        level.activities.var_dde04de762f05a54[instid] = activityinstance;
        return;
    }
    level.activities.var_dde04de762f05a54[instid] = undefined;
}

