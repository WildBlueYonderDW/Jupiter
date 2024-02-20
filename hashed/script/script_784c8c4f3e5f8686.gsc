// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\anim.gsc;
#using scripts\common\notetrack.gsc;
#using script_72a196b6c7df2f38;
#using script_308091d56071a91c;
#using script_3b64eb40368c1450;
#using script_6bfe39bd5c12f84a;
#using script_7d535542e36d66f9;

#namespace scene;

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xa35
// Size: 0x8f
function private autoexec function_2afb8e0809c2e65d() {
    /#
        if (getdvarint(@"hash_e6afce2cf5cf7515")) {
            return;
        }
        thread function_6cd499378aadcad8();
    #/
    var_53352cb855c5c91c = getscriptbundlenames("scenescriptbundle");
    foreach (scenescriptbundle in var_53352cb855c5c91c) {
        scenescriptbundle = getscriptbundle(scenescriptbundle);
        if (isdefined(scenescriptbundle)) {
            scenescriptbundle function_69abf08346f3f6d9();
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xacb
// Size: 0x3ba
function private function_ace39e84230f386() {
    if (!isdefined(level.scene)) {
        level.scene = spawnstruct();
    }
    if (!isdefined(level.scene.var_4083b70e2b4728b7)) {
        level.scene.var_4083b70e2b4728b7 = [];
        function_7855ec4caf5901f9("Types_Object", "objectSpawn", &function_fcb671080d2533e6);
        function_7855ec4caf5901f9("Types_Object", "objectSetup", &function_73ba1df113a6ca64);
        function_7855ec4caf5901f9("Types_Object", "shotObjectPrepare", &function_d4dcec93a1db6e3f);
        function_7855ec4caf5901f9("Types_Object", "shotObjectSetup", &function_770c0b047ce9cfc1);
        function_7855ec4caf5901f9("Types_Object", "shotObjectLinkSetup", &function_d82945c5509ec28e);
        function_7855ec4caf5901f9("Types_Object", "shotObjectFirstFrame", &function_9745e01cedd81c85);
        function_7855ec4caf5901f9("Types_Object", "objectMatchEntity", &function_2294fe71a7c1d8d6);
        function_7855ec4caf5901f9("Types_Object", "objectGetAnimEntity", &function_4c4c2a548b9fc7ab);
        function_7855ec4caf5901f9("Types_Object", "objectGetLinkEnts", &function_f054a83311d7f448);
        function_7855ec4caf5901f9("Types_Object", "objectGetAnimRoot", &function_b9c245bf99df4a8);
        function_7855ec4caf5901f9("Types_Object", "objectTeleport", &function_f94f4fe0f6cf86bc);
        function_7855ec4caf5901f9("Types_Object", "objectVelocity", &function_3be41fe991fc4b94);
        function_7855ec4caf5901f9("Types_Object", "shotObjectPlayAnim", &function_c34fc4bc3e1ecbcb);
        function_7855ec4caf5901f9("Types_Object", "objectWaitNotes", &function_8e9f8e1fbe2b7ab4);
        function_7855ec4caf5901f9("Types_Object", "shotObjectStopAnim", &function_9b8055c613f1bb31);
        function_7855ec4caf5901f9("Types_Object", "shotObjectCleanup", &function_a477eb91dc3b38b8);
        function_7855ec4caf5901f9("Types_Object", "objectCleanup", &function_37e4ff5a9807c7d5);
        function_7855ec4caf5901f9("Types_Object", "objectDelete", &function_746341289f892160);
        function_7855ec4caf5901f9("Types_Object", "objectKill", &function_16bf7d1ae7273583);
        function_7855ec4caf5901f9("Types_Vehicle", "objectSpawn", &function_6acf84052cd5ab1);
        function_7855ec4caf5901f9("Types_Vehicle", "shotObjectSetup", &function_dec77fd275b35e92);
        function_7855ec4caf5901f9("Types_Vehicle", "objectMatchEntity", &function_619f2e5d7f38d9d5);
        function_7855ec4caf5901f9("Types_Mayhem", "objectSpawn", &function_f09a700ae2edf8dc);
        function_7855ec4caf5901f9("Types_Mayhem", "shotObjectSetup", &function_d4f1b2dce50c7b7);
        function_7855ec4caf5901f9("Types_Mayhem", "shotObjectFirstFrame", &function_532562ce2e63032f);
        function_7855ec4caf5901f9("Types_Mayhem", "shotObjectPlayAnim", &function_d0ffa1bea912444d);
        function_7855ec4caf5901f9("Types_Mayhem", "shotObjectStopAnim", &function_94d19635a2c1b723);
        function_7855ec4caf5901f9("Types_Mayhem", "objectDelete", &function_e045fde582740c36);
        function_7855ec4caf5901f9("Types_XCam", "objectSpawn", &function_4eeb4b296c894ce2);
        function_7855ec4caf5901f9("Types_XCam", "shotObjectSetup", &function_371c152f2c391c55);
        function_7855ec4caf5901f9("Types_XCam", "shotObjectCleanup", &function_2db9cd1521705174);
        function_7855ec4caf5901f9("Types_XCam", "shotObjectFirstFrame", &function_d6ce74b74dc12311);
        function_7855ec4caf5901f9("Types_XCam", "shotObjectPreStream", &function_90e78898cf74b132);
        function_7855ec4caf5901f9("Types_XCam", "shotObjectPlayAnim", &function_7ce890b54a48b767);
        function_7855ec4caf5901f9("Types_XCam", "shotObjectSkipAnim", &function_fe644d526883b9b4);
        function_7855ec4caf5901f9("Types_XCam", "shotObjectStopAnim", &function_544bbcb14d370c45);
        function_7855ec4caf5901f9("Types_XCam", "objectDelete", &function_675f201c7358ed54);
        function_7855ec4caf5901f9("Types_XCam", "objectMatchEntity", &function_a9acafbfcda23112);
        function_7855ec4caf5901f9("Types_XCam", "objectCleanup", &function_1cc94dda1955e721);
        function_7855ec4caf5901f9("Types_XCam", "objectParticipatingCinematics", &function_1069a83dc140e900);
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe8c
// Size: 0xad
function private function_e16b1ab0a35605d3(str_flag) {
    flag_wait(str_flag);
    foreach (s_scene in level.var_a0b4eb1703be349a) {
        if (isdefined(s_scene.spawnflags)) {
            if ((s_scene.spawnflags & 2) == 2) {
                s_scene thread play();
            } else if ((s_scene.spawnflags & 1) == 1) {
                s_scene thread init();
            }
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf40
// Size: 0x37
function private function_6a66a98742866fed() {
    var_5aaf7c7163c04623 = self;
    function_ace39e84230f386();
    if (isdefined(var_5aaf7c7163c04623.var_aadf0dea942accd5)) {
        return;
    }
    var_5aaf7c7163c04623.var_aadf0dea942accd5 = spawnstruct();
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf7e
// Size: 0x298
function private function_bd09568f76dd40ca() {
    var_5aaf7c7163c04623 = self;
    function_ace39e84230f386();
    if (isdefined(var_5aaf7c7163c04623.var_84b542bb7490bea7) && var_5aaf7c7163c04623.var_84b542bb7490bea7.state != "NotInit") {
        return isdefined(var_5aaf7c7163c04623.var_84b542bb7490bea7.scenescriptbundle);
    }
    var_84b542bb7490bea7 = spawnstruct();
    var_5aaf7c7163c04623.var_84b542bb7490bea7 = var_84b542bb7490bea7;
    var_84b542bb7490bea7.var_5aaf7c7163c04623 = var_5aaf7c7163c04623;
    /#
        var_5aaf7c7163c04623 function_475cdb01202582a1();
    #/
    var_84b542bb7490bea7.state = "NotSetup";
    var_84b542bb7490bea7.var_568f62a24b19c46d = [];
    var_84b542bb7490bea7.scenescriptbundle = var_5aaf7c7163c04623 function_6a6ec88abab6a723();
    var_84b542bb7490bea7.var_214d924f4e137244 = [];
    if (!isdefined(var_84b542bb7490bea7.scenescriptbundle)) {
        scriptbundlename = var_5aaf7c7163c04623 function_6c0e3626ebce826f();
        /#
            if (isdefined(scriptbundlename)) {
                println("NotSetup" + var_5aaf7c7163c04623 function_6c0e3626ebce826f() + "weapon_switch");
            }
        #/
        return 0;
    }
    var_caec512e105611cd = var_84b542bb7490bea7.scenescriptbundle function_291cd2f1089d3a94();
    for (objectindex = 0; objectindex < var_caec512e105611cd; objectindex++) {
        var_9de370fa69b301ce = spawnstruct();
        var_84b542bb7490bea7.var_214d924f4e137244[objectindex] = var_9de370fa69b301ce;
        var_9de370fa69b301ce.index = objectindex;
        var_9de370fa69b301ce.var_5aaf7c7163c04623 = var_5aaf7c7163c04623;
        var_9de370fa69b301ce.var_568f62a24b19c46d = undefined;
        var_9de370fa69b301ce.var_84b542bb7490bea7 = var_84b542bb7490bea7;
        var_9de370fa69b301ce.var_9be58c68789faf5c = var_84b542bb7490bea7.scenescriptbundle function_bfc4196d3da11705(objectindex);
        var_9de370fa69b301ce.var_c7383d9309c52a8d = level.scene.var_8a6cbf5e0998e58d[var_9de370fa69b301ce.var_9be58c68789faf5c function_c77857d663e8cfbe()];
        var_9de370fa69b301ce.entity = undefined;
        var_9de370fa69b301ce.var_423f55edd900883 = undefined;
        var_9de370fa69b301ce.active = undefined;
        var_9de370fa69b301ce.var_36831a04af11576f = undefined;
        var_9de370fa69b301ce.var_86fb513899b4cb91 = undefined;
        var_9de370fa69b301ce.var_41dc93404af773a3 = undefined;
        var_9de370fa69b301ce.var_77c99123aefe423b = undefined;
        var_9de370fa69b301ce.var_53c962747bd1f2f = undefined;
        var_9de370fa69b301ce.var_a3ff79ae166c57aa = undefined;
        var_9de370fa69b301ce.var_45b7e6a0ab6469e6 = undefined;
        var_9de370fa69b301ce.var_bae27d121b581202 = undefined;
        var_9de370fa69b301ce.issetup = undefined;
        var_9de370fa69b301ce.var_2b16b22ac076fda4 = undefined;
        var_9de370fa69b301ce.var_e32ce590a15666ec = undefined;
        var_9de370fa69b301ce.var_bae27d121b581202 = undefined;
        var_9de370fa69b301ce.var_251898eb5a0e0c9f = undefined;
    }
    return 1;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x121e
// Size: 0x28
function private function_798498fd6521b8f0() {
    var_5aaf7c7163c04623 = self;
    waittillframeend();
    if (var_5aaf7c7163c04623 get_state() == "Stopped") {
        var_5aaf7c7163c04623 function_5b54476c3a0cd83f();
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x124d
// Size: 0x107
function private function_5b54476c3a0cd83f() {
    var_5aaf7c7163c04623 = self;
    state = var_5aaf7c7163c04623 get_state();
    if (state == "NotInit" || state == "NotSetup") {
        return;
    }
    if (state == "Playing") {
        var_5aaf7c7163c04623 stop();
    }
    if (isdefined(var_5aaf7c7163c04623.var_84b542bb7490bea7)) {
        for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_5aaf7c7163c04623.var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
            var_214d924f4e137244 = var_5aaf7c7163c04623.var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
            if (isdefined(var_214d924f4e137244) && isdefined(var_214d924f4e137244.entity)) {
                var_214d924f4e137244 function_37e4ff5a9807c7d5();
            }
        }
    }
    var_5aaf7c7163c04623 function_c643b2c6b794481e("NotSetup");
    if (isdefined(var_5aaf7c7163c04623.var_84b542bb7490bea7) && var_5aaf7c7163c04623.var_84b542bb7490bea7.scenescriptbundle function_62cef499110730d3()) {
        var_5aaf7c7163c04623 cleanup();
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x135b
// Size: 0x28
function private function_e525ff755ac18cf6() {
    var_5aaf7c7163c04623 = self;
    scenescriptbundle = var_5aaf7c7163c04623 function_6a6ec88abab6a723();
    return scenescriptbundle function_2c5f030a3c002210();
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x138b
// Size: 0xa1
function private function_d225e757dea4eca6() {
    var_5aaf7c7163c04623 = self;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    animrate = undefined;
    if (isdefined(var_5aaf7c7163c04623.var_aadf0dea942accd5)) {
        animrate = var_5aaf7c7163c04623.var_aadf0dea942accd5.animrate;
    }
    if (!isdefined(var_84b542bb7490bea7)) {
        return;
    }
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        var_214d924f4e137244 function_6a4d64bdba27cb06(animrate);
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1433
// Size: 0x18e
function private function_bb980ac4246f5baa(var_8338711a0d65673b) {
    var_5aaf7c7163c04623 = self;
    var_aadf0dea942accd5 = var_5aaf7c7163c04623.var_aadf0dea942accd5;
    if (!isdefined(var_8338711a0d65673b)) {
        return;
    }
    scriptbundlename = var_5aaf7c7163c04623 function_6c0e3626ebce826f();
    if (!isdefined(scriptbundlename)) {
        return;
    }
    if (isdefined(level.scene.funcs) && isdefined(level.scene.funcs[scriptbundlename]) && isdefined(level.scene.funcs[scriptbundlename][var_8338711a0d65673b])) {
        foreach (func in level.scene.funcs[scriptbundlename][var_8338711a0d65673b]) {
            var_5aaf7c7163c04623 thread [[ func ]]();
        }
    }
    if (isdefined(var_aadf0dea942accd5) && isdefined(var_aadf0dea942accd5.funcs) && isdefined(var_aadf0dea942accd5.funcs[scriptbundlename]) && isdefined(var_aadf0dea942accd5.funcs[scriptbundlename][var_8338711a0d65673b])) {
        foreach (func in var_aadf0dea942accd5.funcs[scriptbundlename][var_8338711a0d65673b]) {
            var_5aaf7c7163c04623 thread [[ func ]]();
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15c8
// Size: 0x128
function private function_14d02a749939e837(var_2a29e57c1c105d52) {
    var_5aaf7c7163c04623 = self;
    var_51d2f645ad8afdaf = var_2a29e57c1c105d52;
    if (isdefined(var_51d2f645ad8afdaf)) {
        scenescriptbundle = var_5aaf7c7163c04623 function_6a6ec88abab6a723();
        shotcount = scenescriptbundle function_d1338e27a26ecaeb();
        if (!isarray(var_51d2f645ad8afdaf)) {
            var_51d2f645ad8afdaf = [0:var_51d2f645ad8afdaf];
        }
        for (i = 0; i < var_51d2f645ad8afdaf.size; i++) {
            var_698da5af57b757e7 = var_51d2f645ad8afdaf[i];
            if (isdefined(var_698da5af57b757e7) && !isint(var_698da5af57b757e7)) {
                var_51d2f645ad8afdaf[i] = -1;
                for (var_b0239d47df5d0169 = 0; var_b0239d47df5d0169 < shotcount; var_b0239d47df5d0169++) {
                    shot = scenescriptbundle function_2218afa82a590ea3(var_b0239d47df5d0169);
                    shotname = shot function_55042076624e1180();
                    if (shotname == var_698da5af57b757e7) {
                        var_51d2f645ad8afdaf[i] = var_b0239d47df5d0169;
                        continue;
                    }
                }
            }
        }
    } else {
        var_51d2f645ad8afdaf = [];
        shotcount = var_5aaf7c7163c04623.var_84b542bb7490bea7.scenescriptbundle function_d1338e27a26ecaeb();
        for (var_698da5af57b757e7 = 0; var_698da5af57b757e7 < shotcount; var_698da5af57b757e7++) {
            var_51d2f645ad8afdaf[var_51d2f645ad8afdaf.size] = var_698da5af57b757e7;
        }
    }
    return var_51d2f645ad8afdaf;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16f8
// Size: 0xc2
function private function_303476b29feb54bb(var_f2a8279cf934c80e) {
    var_5aaf7c7163c04623 = self;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    scenescriptbundle = var_5aaf7c7163c04623 function_6a6ec88abab6a723();
    shotcount = scenescriptbundle function_d1338e27a26ecaeb();
    if (!isarray(var_f2a8279cf934c80e)) {
        var_f2a8279cf934c80e = [0:var_f2a8279cf934c80e];
    }
    result = function_1823ff50bb28148d("SSK");
    for (i = 0; i < var_f2a8279cf934c80e.size; i++) {
        var_698da5af57b757e7 = var_f2a8279cf934c80e[i];
        /#
            assert(isint(var_698da5af57b757e7));
        #/
        result = function_2ef675c13ca1c4af(result, "_" + var_698da5af57b757e7);
    }
    return result;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17c2
// Size: 0x181
function private function_e6197350552df14b(var_c38eb8ba73256bfb, var_94f8931d2dd061eb) {
    var_5aaf7c7163c04623 = self;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_f2a8279cf934c80e = var_5aaf7c7163c04623 function_14d02a749939e837(var_c38eb8ba73256bfb);
    var_1c3d1176ec532f2b = var_5aaf7c7163c04623 function_303476b29feb54bb(var_f2a8279cf934c80e);
    if (isdefined(var_84b542bb7490bea7.var_568f62a24b19c46d[var_1c3d1176ec532f2b])) {
        return var_84b542bb7490bea7.var_568f62a24b19c46d[var_1c3d1176ec532f2b];
    }
    if (!istrue(var_94f8931d2dd061eb)) {
        return undefined;
    }
    var_568f62a24b19c46d = spawnstruct();
    var_568f62a24b19c46d.var_5aaf7c7163c04623 = var_5aaf7c7163c04623;
    var_568f62a24b19c46d.var_df5db7bd235f2729 = [];
    var_568f62a24b19c46d.var_f2a8279cf934c80e = var_f2a8279cf934c80e;
    var_568f62a24b19c46d.var_1344e48bc80d0f52 = undefined;
    for (var_698da5af57b757e7 = 0; var_698da5af57b757e7 < var_f2a8279cf934c80e.size; var_698da5af57b757e7++) {
        var_531b82ca81cb9e5c = var_f2a8279cf934c80e[var_698da5af57b757e7];
        shot = var_84b542bb7490bea7.scenescriptbundle function_2218afa82a590ea3(var_531b82ca81cb9e5c);
        if (isdefined(shot) && !shot function_d218620a1b80e648()) {
            var_568f62a24b19c46d.var_df5db7bd235f2729[var_568f62a24b19c46d.var_df5db7bd235f2729.size] = var_531b82ca81cb9e5c;
        }
    }
    if (isdefined(var_568f62a24b19c46d.var_df5db7bd235f2729[0])) {
        var_568f62a24b19c46d.var_49a7f73f0fb5f6cf = var_568f62a24b19c46d.var_df5db7bd235f2729[0];
    } else {
        var_568f62a24b19c46d.var_49a7f73f0fb5f6cf = 0;
    }
    var_84b542bb7490bea7.var_568f62a24b19c46d[var_1c3d1176ec532f2b] = var_568f62a24b19c46d;
    return var_568f62a24b19c46d;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x194b
// Size: 0x161
function private scene_coordinated_reach(var_568f62a24b19c46d, var_698da5af57b757e7, var_4bc185af207d5706, var_64b5ab50f22a4efc) {
    var_5aaf7c7163c04623 = self;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_568f62a24b19c46d notify("scene_coordinated_reach");
    var_568f62a24b19c46d endon("scene_coordinated_reach");
    if (isdefined(var_568f62a24b19c46d.var_56ebabfb3c6985b8)) {
        var_568f62a24b19c46d.var_56ebabfb3c6985b8 = min(var_568f62a24b19c46d.var_56ebabfb3c6985b8, var_4bc185af207d5706);
    } else {
        var_568f62a24b19c46d.var_56ebabfb3c6985b8 = var_4bc185af207d5706;
    }
    if (!isdefined(var_568f62a24b19c46d.var_6909d1a5df21c351)) {
        var_568f62a24b19c46d.var_6909d1a5df21c351 = [];
    }
    var_568f62a24b19c46d.var_6909d1a5df21c351[var_568f62a24b19c46d.var_6909d1a5df21c351.size] = var_64b5ab50f22a4efc;
    waittillframeend();
    var_5aaf7c7163c04623 function_dca1a3a29d2ee467(var_568f62a24b19c46d.var_6909d1a5df21c351, var_568f62a24b19c46d.var_56ebabfb3c6985b8);
    foreach (var_64b5ab50f22a4efc in var_568f62a24b19c46d.var_6909d1a5df21c351) {
        guy = var_64b5ab50f22a4efc[0];
        if (isdefined(guy)) {
            guy notify("scene_coordinated_reach");
        }
    }
    var_568f62a24b19c46d.var_6909d1a5df21c351 = undefined;
    var_568f62a24b19c46d.var_56ebabfb3c6985b8 = undefined;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ab3
// Size: 0x14f
function private function_796087cbcf3fb30(var_a99e1a741be31063) {
    if (!isdefined(level.var_3d4e5fba17201307)) {
        level.var_3d4e5fba17201307 = [];
        level.var_3d4e5fba17201307["Exposed"] = "Exposed";
        level.var_3d4e5fba17201307["ExposedMoving"] = "Exposed Moving";
        level.var_3d4e5fba17201307["ExposedCrouch"] = "Exposed Crouch";
        level.var_3d4e5fba17201307["CoverCrouch"] = "Cover Crouch";
        level.var_3d4e5fba17201307["CoverStand"] = "Cover Stand";
        level.var_3d4e5fba17201307["CoverProne"] = "Cover Prone";
        level.var_3d4e5fba17201307["CoverLeft"] = "Cover Left";
        level.var_3d4e5fba17201307["CoverLeftCrouch"] = "Cover Left Crouch";
        level.var_3d4e5fba17201307["CoverRight"] = "Cover Right";
        level.var_3d4e5fba17201307["CoverRightCrouch"] = "Cover Right Crouch";
        level.var_3d4e5fba17201307["CoverCrouchLMG"] = "Cover Crouch LMG";
        level.var_3d4e5fba17201307["CoverStandLMG"] = "Cover Stand LMG";
    }
    if (!isdefined(level.var_3d4e5fba17201307[var_a99e1a741be31063])) {
        /#
            println("ease_inout_sine" + var_a99e1a741be31063);
        #/
        return "Exposed";
    }
    return level.var_3d4e5fba17201307[var_a99e1a741be31063];
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c0a
// Size: 0x120
function private function_8b0aed4c74bd673c(demeanor, locomotion) {
    var_4bc185af207d5706 = 225;
    switch (demeanor) {
    case #"hash_186d745a92c317d9":
        var_4bc185af207d5706 = 53;
        break;
    case #"hash_9128327eb51e0b7b":
        var_4bc185af207d5706 = 48;
        break;
    case #"hash_46fdaf04e9be63e4":
        var_4bc185af207d5706 = 75;
        break;
    case #"hash_d320ccf96c495f71":
        var_4bc185af207d5706 = 47;
        break;
    case #"hash_1a53266c17b7d481":
    case #"hash_9a93c307fd4015ae":
    case #"hash_9e02cd4a0f3ca981":
    case #"hash_a7db48ba68421306":
        if (locomotion == "sprint") {
            var_4bc185af207d5706 = 225;
        } else {
            var_4bc185af207d5706 = 140;
        }
        break;
    case #"hash_eb06fed69a41dab5":
        var_4bc185af207d5706 = 225;
        break;
    }
    if (demeanor != "patrol" && demeanor != "alert") {
        switch (locomotion) {
        case #"hash_bdea5e7441323370":
            var_4bc185af207d5706 = var_4bc185af207d5706 * 0.5;
            break;
        case #"hash_5c7fca6c3a403003":
            var_4bc185af207d5706 = var_4bc185af207d5706 * 0.75;
            break;
        }
    }
    return var_4bc185af207d5706;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d32
// Size: 0x30
function private function_950e5107399d1111() {
    var_568f62a24b19c46d = self;
    var_9ecbeba68a379903 = function_1a2cae854fe073a0("modeStartMonitoringPlayers");
    if (isdefined(var_9ecbeba68a379903)) {
        var_568f62a24b19c46d thread [[ var_9ecbeba68a379903 ]]();
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d69
// Size: 0x2f
function private function_bc27ed6c295108d7() {
    var_568f62a24b19c46d = self;
    var_9ecbeba68a379903 = function_1a2cae854fe073a0("modeStopMonitoringPlayers");
    if (isdefined(var_9ecbeba68a379903)) {
        var_568f62a24b19c46d [[ var_9ecbeba68a379903 ]]();
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d9f
// Size: 0x23
function private function_9f853ecc68f5058() {
    var_9ecbeba68a379903 = function_1a2cae854fe073a0("modeXCamRespectsStartingTimeOnClients");
    if (isdefined(var_9ecbeba68a379903)) {
        return [[ var_9ecbeba68a379903 ]]();
    }
    return 0;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1dca
// Size: 0x39
function private function_a89f1262c5148bdf() {
    var_214d924f4e137244 = self;
    return function_53c4c53197386572(var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_d337825df4506344, "tag_player");
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e0b
// Size: 0x2f
function private function_b6130df53fbf724c() {
    var_214d924f4e137244 = self;
    return istrue(var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_9f78587cfefc10ac);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e42
// Size: 0x2f
function private function_3e13497ed7044cbd() {
    var_214d924f4e137244 = self;
    return istrue(var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.isfemale);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e79
// Size: 0x57
function private function_ac04e049ff623301(entity, var_214d924f4e137244) {
    if (!isdefined(entity)) {
        return 0;
    }
    if (istrue(var_214d924f4e137244.var_84b542bb7490bea7.var_a416d1b334ed6b37)) {
        var_9ecbeba68a379903 = function_1a2cae854fe073a0("modePlayerMatchingObjectForFemale");
        if (isdefined(var_9ecbeba68a379903)) {
            return [[ var_9ecbeba68a379903 ]](entity, var_214d924f4e137244);
        }
    }
    return 1;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ed8
// Size: 0x2f
function private function_7c447098301ac4a3() {
    var_214d924f4e137244 = self;
    return istrue(var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_9cadc424d1421646);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f0f
// Size: 0xaa
function private function_5fe020a6db35fab3(var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    var_409dc6bbf1421f94 = [0:"offhand_weapons", 1:"melee", 2:"sprint", 3:"allow_jump", 4:"mantle"];
    if (!var_214d924f4e137244 function_b6130df53fbf724c()) {
        var_409dc6bbf1421f94[var_409dc6bbf1421f94.size] = "usability";
    }
    if (var_214d924f4e137244.var_9be58c68789faf5c function_d1dd52dc1f43215d(var_698da5af57b757e7) != "Keep") {
        var_409dc6bbf1421f94[var_409dc6bbf1421f94.size] = "weapon";
    }
    if (!var_214d924f4e137244.var_9be58c68789faf5c function_fcc766f42b75a322(var_698da5af57b757e7)) {
        var_409dc6bbf1421f94[var_409dc6bbf1421f94.size] = "weapon_switch";
    }
    return var_409dc6bbf1421f94;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1fc1
// Size: 0x56
function private function_285bdba488858f9e(var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    var_907051501530beee = var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_e6d38aba102a77d4, 0);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x201f
// Size: 0x49
function private function_e7257014ebaeeaa8(enabled) {
    /#
        assert(isplayer(self));
    #/
    player = self;
    var_9ecbeba68a379903 = function_1a2cae854fe073a0("modeLetterbox");
    if (isdefined(var_9ecbeba68a379903)) {
        player thread [[ var_9ecbeba68a379903 ]](enabled);
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x206f
// Size: 0x4f
function private function_bb60d8e77392c74e(var_89d01150f6ea37bc, duration, var_5e0a7399a2cd7c5e, var_8ff8fd7841f6eba2) {
    /#
        assert(isplayer(self));
    #/
    player = self;
    player startcameratween(duration, var_5e0a7399a2cd7c5e, "ease_inout_sine", 0, var_8ff8fd7841f6eba2);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20c5
// Size: 0x94
function private function_15848d0bdc45e95e() {
    var_568f62a24b19c46d = self;
    scenescriptbundle = var_568f62a24b19c46d.var_5aaf7c7163c04623 function_6a6ec88abab6a723();
    result = [];
    foreach (var_698da5af57b757e7 in var_568f62a24b19c46d.var_df5db7bd235f2729) {
        result[result.size] = scenescriptbundle function_a3be29c7b9c648ef(var_698da5af57b757e7);
    }
    return result;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2161
// Size: 0x232
function private function_218d0124f21f73b1(var_698da5af57b757e7) {
    var_568f62a24b19c46d = self;
    var_5aaf7c7163c04623 = var_568f62a24b19c46d.var_5aaf7c7163c04623;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in var_568f62a24b19c46d.var_7038c2a13f1f5db8) {
        if (isdefined(var_19a1a40cf0ff83b9[var_698da5af57b757e7])) {
            var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
            var_214d924f4e137244.var_bae27d121b581202 = var_84b542bb7490bea7.scenescriptbundle function_ab3ec43370c405d2(var_5aaf7c7163c04623, var_698da5af57b757e7, var_56f4af8746a2d458);
        }
    }
    var_568f62a24b19c46d.var_137e0a58e2c9d26 = [];
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in var_568f62a24b19c46d.var_7038c2a13f1f5db8) {
        var_54cfba7bf24400e0 = [];
        var_bf53103eaf0d32f9 = var_56f4af8746a2d458;
        while (isdefined(var_bf53103eaf0d32f9) && isdefined(var_84b542bb7490bea7.var_214d924f4e137244[var_bf53103eaf0d32f9]) && !isdefined(var_568f62a24b19c46d.var_137e0a58e2c9d26[var_bf53103eaf0d32f9])) {
            var_54cfba7bf24400e0[var_54cfba7bf24400e0.size] = var_bf53103eaf0d32f9;
            if (!isdefined(var_84b542bb7490bea7.var_214d924f4e137244[var_bf53103eaf0d32f9].var_bae27d121b581202)) {
                var_84b542bb7490bea7.var_214d924f4e137244[var_bf53103eaf0d32f9].var_bae27d121b581202 = var_84b542bb7490bea7.scenescriptbundle function_ab3ec43370c405d2(var_5aaf7c7163c04623, var_698da5af57b757e7, var_56f4af8746a2d458);
            }
            nextindex = var_84b542bb7490bea7.var_214d924f4e137244[var_bf53103eaf0d32f9].var_bae27d121b581202.var_93cd726eb6096497;
            if (isdefined(nextindex) && nextindex != var_bf53103eaf0d32f9) {
                var_bf53103eaf0d32f9 = nextindex;
            } else {
                var_bf53103eaf0d32f9 = undefined;
            }
        }
        for (i = var_54cfba7bf24400e0.size - 1; i >= 0; i--) {
            var_568f62a24b19c46d.var_137e0a58e2c9d26[var_54cfba7bf24400e0[i]] = var_568f62a24b19c46d.var_7038c2a13f1f5db8[var_54cfba7bf24400e0[i]];
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x239a
// Size: 0x12f
function private function_e1b0a65cc436523d(var_698da5af57b757e7) {
    var_568f62a24b19c46d = self;
    var_5aaf7c7163c04623 = var_568f62a24b19c46d.var_5aaf7c7163c04623;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        if (isdefined(var_214d924f4e137244)) {
            var_214d924f4e137244.var_bb2bc0aa7d81de89 = undefined;
        }
    }
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in var_568f62a24b19c46d.var_7038c2a13f1f5db8) {
        if (isdefined(var_19a1a40cf0ff83b9[var_698da5af57b757e7])) {
            var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
            var_be98a78ee33f18b8 = var_568f62a24b19c46d.var_98ccc4289cd8e03c;
            if (isdefined(var_be98a78ee33f18b8)) {
                if (isdefined(var_19a1a40cf0ff83b9[var_be98a78ee33f18b8])) {
                    var_214d924f4e137244.var_bb2bc0aa7d81de89 = var_84b542bb7490bea7.scenescriptbundle function_ab3ec43370c405d2(var_5aaf7c7163c04623, var_be98a78ee33f18b8, var_56f4af8746a2d458);
                }
            }
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x24d0
// Size: 0xeb
function private function_e5b5e877417bc710(var_28f886c93eb6c826) {
    var_568f62a24b19c46d = self;
    var_5aaf7c7163c04623 = var_568f62a24b19c46d.var_5aaf7c7163c04623;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_568f62a24b19c46d.state = "Playing";
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in var_568f62a24b19c46d.var_7038c2a13f1f5db8) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        var_214d924f4e137244.var_568f62a24b19c46d = var_568f62a24b19c46d;
        var_214d924f4e137244 notify("scene_play");
    }
    var_568f62a24b19c46d notify("scene_play");
    if (!istrue(var_28f886c93eb6c826)) {
        var_568f62a24b19c46d thread function_888500a6dee53008();
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25c2
// Size: 0xd5
function private function_888500a6dee53008() {
    var_568f62a24b19c46d = self;
    var_5aaf7c7163c04623 = var_568f62a24b19c46d.var_5aaf7c7163c04623;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    if (!var_5aaf7c7163c04623 function_e525ff755ac18cf6()) {
        return;
    }
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in var_568f62a24b19c46d.var_7038c2a13f1f5db8) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        if (isplayer(var_214d924f4e137244.entity)) {
            var_214d924f4e137244.entity thread player_scene_play_wait_skip(var_568f62a24b19c46d);
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x269e
// Size: 0x11c
function private function_317afd3b93b0b54d(player, pos) {
    var_568f62a24b19c46d = self;
    /#
        assert(isplayer(player));
    #/
    /#
        assert(isvector(pos));
    #/
    clientnum = player getentitynumber();
    if (!isdefined(var_568f62a24b19c46d.var_868bf033439639da.players)) {
        var_568f62a24b19c46d.var_868bf033439639da.players = [];
    }
    if (!isdefined(var_568f62a24b19c46d.var_868bf033439639da.players[clientnum])) {
        var_568f62a24b19c46d.var_868bf033439639da.players[clientnum] = spawnstruct();
    }
    var_ad63323b4b7fde00 = var_568f62a24b19c46d.var_868bf033439639da.players[clientnum];
    var_ad63323b4b7fde00.player = player;
    if (!isdefined(var_ad63323b4b7fde00.var_cc336c187ee5a23d)) {
        var_ad63323b4b7fde00.var_cc336c187ee5a23d = [];
    }
    var_ad63323b4b7fde00.var_cc336c187ee5a23d[var_ad63323b4b7fde00.var_cc336c187ee5a23d.size] = pos;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27c1
// Size: 0xbb
function private function_da660bb71d6eb080(var_fcc3f96f3cb06900) {
    var_568f62a24b19c46d = self;
    var_5aaf7c7163c04623 = var_568f62a24b19c46d.var_5aaf7c7163c04623;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    if (!isdefined(var_84b542bb7490bea7)) {
        return;
    }
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in var_568f62a24b19c46d.var_7038c2a13f1f5db8) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        var_214d924f4e137244 function_5006f1d3bba27ce4(var_fcc3f96f3cb06900);
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2883
// Size: 0xd2
function private player_scene_play_wait_skip(var_568f62a24b19c46d) {
    /#
        assert(isplayer(self));
    #/
    player = self;
    player notify("player_scene_play_wait_skip");
    player endon("player_scene_play_wait_skip");
    player endon("death_or_disconnect");
    var_568f62a24b19c46d endon("scene_stop");
    var_568f62a24b19c46d endon("Stopped");
    player setclientomnvar("ui_is_bink_skippable", 1);
    while (1) {
        player waittillmatch("luinotifyserver", "skip_bink_input");
        if (!is_equal(var_568f62a24b19c46d.state, "Playing")) {
            break;
        }
        player setclientomnvar("ui_is_bink_skippable", 0);
        var_c38eb8ba73256bfb = var_568f62a24b19c46d function_15848d0bdc45e95e();
        var_568f62a24b19c46d.var_5aaf7c7163c04623 thread skip(var_c38eb8ba73256bfb, 0.5);
        return;
    }
    player setclientomnvar("ui_is_bink_skippable", 0);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x295c
// Size: 0x188
function private function_5a438716f043fddc(var_f7ab585bff4b110, var_df5db7bd235f2729) {
    var_568f62a24b19c46d = self;
    var_5aaf7c7163c04623 = var_568f62a24b19c46d.var_5aaf7c7163c04623;
    var_568f62a24b19c46d.var_43286fd46706909c = undefined;
    if (!isdefined(var_f7ab585bff4b110) || isdefined(var_f7ab585bff4b110) && var_f7ab585bff4b110 == 0) {
        return;
    }
    var_43286fd46706909c = spawnstruct();
    var_43286fd46706909c.var_f7ab585bff4b110 = clamp(var_f7ab585bff4b110, 0, 1);
    var_43286fd46706909c.var_fc1e1636b43c53ed = 0;
    var_43286fd46706909c.var_f263562e5b98bed4 = [];
    var_568f62a24b19c46d.var_43286fd46706909c = var_43286fd46706909c;
    foreach (var_698da5af57b757e7 in var_df5db7bd235f2729) {
        var_f263562e5b98bed4 = spawnstruct();
        var_f263562e5b98bed4.var_10b4fa855f381b04 = var_43286fd46706909c.var_fc1e1636b43c53ed;
        var_f263562e5b98bed4.var_396646edb4ba78fe = var_5aaf7c7163c04623 function_30140edcf9e36027(var_568f62a24b19c46d, var_698da5af57b757e7);
        var_43286fd46706909c.var_f263562e5b98bed4[var_698da5af57b757e7] = var_f263562e5b98bed4;
        var_43286fd46706909c.var_fc1e1636b43c53ed = var_43286fd46706909c.var_fc1e1636b43c53ed + var_f263562e5b98bed4.var_396646edb4ba78fe;
    }
    var_43286fd46706909c.var_2fce6a0d9ab1d85 = var_43286fd46706909c.var_fc1e1636b43c53ed * var_43286fd46706909c.var_f7ab585bff4b110;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2aeb
// Size: 0x349
function private function_afea5de3a99c09ab(var_568f62a24b19c46d, var_698da5af57b757e7) {
    var_5aaf7c7163c04623 = self;
    success = 1;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_568f62a24b19c46d.var_adf03bdd42111106 = var_698da5af57b757e7;
    var_568f62a24b19c46d function_218d0124f21f73b1(var_698da5af57b757e7);
    var_568f62a24b19c46d function_e1b0a65cc436523d(var_698da5af57b757e7);
    var_5aaf7c7163c04623 function_bb980ac4246f5baa(var_84b542bb7490bea7.scenescriptbundle function_a3be29c7b9c648ef(var_698da5af57b757e7));
    var_568f62a24b19c46d function_7c1dbb8157a07757("prepare", var_698da5af57b757e7);
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in var_568f62a24b19c46d.var_137e0a58e2c9d26) {
        if (isdefined(var_19a1a40cf0ff83b9[var_698da5af57b757e7])) {
            var_5aaf7c7163c04623 thread function_c4b3a49a6470bd32(var_568f62a24b19c46d, "prepare", var_698da5af57b757e7, var_56f4af8746a2d458);
        }
    }
    var_568f62a24b19c46d function_fef8a82cd85330df("prepare");
    /#
        var_4e7a3e672aaebeaa = getdvarint(@"hash_36ab188f318b1392", 0);
        if (var_4e7a3e672aaebeaa) {
            var_2f23edb971f368a6 = gettime();
            if (isdefined(var_5aaf7c7163c04623.var_708c03f822068263)) {
                /#
                    assert(var_5aaf7c7163c04623.var_708c03f822068263 == var_2f23edb971f368a6);
                #/
                if (var_5aaf7c7163c04623.var_708c03f822068263 != var_2f23edb971f368a6) {
                    var_e1be6bcb1d5a42c7 = 0;
                }
            }
            var_5aaf7c7163c04623.var_2f23edb971f368a6 = var_2f23edb971f368a6;
        }
    #/
    if (!istrue(var_568f62a24b19c46d.var_7bee1a965a8d9487)) {
        /#
            var_568f62a24b19c46d namespace_6068faad90cf91ee::function_d4cfde3fa9af7e5a(var_698da5af57b757e7);
        #/
        var_568f62a24b19c46d function_7c1dbb8157a07757("anim", var_698da5af57b757e7);
        foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in var_568f62a24b19c46d.var_137e0a58e2c9d26) {
            if (isdefined(var_19a1a40cf0ff83b9[var_698da5af57b757e7])) {
                var_5aaf7c7163c04623 thread function_daa02d9da601d14d(var_568f62a24b19c46d, "anim", var_698da5af57b757e7, var_56f4af8746a2d458);
            }
        }
        shot = var_5aaf7c7163c04623.var_84b542bb7490bea7.scenescriptbundle function_2218afa82a590ea3(var_698da5af57b757e7);
        if (shot function_9336a9805a4ab29a()) {
            var_73e1014ebc31c952 = var_5aaf7c7163c04623 function_d9be975d8d1c9db3(var_698da5af57b757e7, 1);
            var_40954f4dddf00c13 = function_81bab5b9c097deb5(var_73e1014ebc31c952);
            if (var_40954f4dddf00c13 > 0) {
                var_568f62a24b19c46d delaythread(var_40954f4dddf00c13, &function_8cb9e28d833bd068, "anim");
            }
        }
        var_568f62a24b19c46d function_fef8a82cd85330df("anim");
        /#
            if (var_4e7a3e672aaebeaa) {
                var_5aaf7c7163c04623.var_708c03f822068263 = gettime();
            }
        #/
        /#
            var_568f62a24b19c46d namespace_6068faad90cf91ee::function_6b2bc344ea55f120();
        #/
    }
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in var_568f62a24b19c46d.var_137e0a58e2c9d26) {
        if (isdefined(var_19a1a40cf0ff83b9[var_698da5af57b757e7])) {
            var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
            if (isdefined(var_214d924f4e137244.var_45b7e6a0ab6469e6) && !var_214d924f4e137244.var_45b7e6a0ab6469e6) {
                success = 0;
            }
        }
    }
    var_568f62a24b19c46d notify("scene_shot_cleanup");
    return success;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e3c
// Size: 0x76
function private function_81bab5b9c097deb5(var_82455b176212fd4e) {
    var_9f421c699167b4eb = 50;
    if (isdefined(level.frameduration) && level.frameduration > 0) {
        var_9f421c699167b4eb = level.frameduration;
    }
    var_37f0849ceb07378d = round(var_82455b176212fd4e * 1000);
    var_3a818f89eec1c01f = var_37f0849ceb07378d % var_9f421c699167b4eb;
    var_c409b005497fc20b = (var_37f0849ceb07378d - var_3a818f89eec1c01f) / 1000;
    return var_c409b005497fc20b;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2eba
// Size: 0x89
function private function_30140edcf9e36027(var_568f62a24b19c46d, var_698da5af57b757e7) {
    var_5aaf7c7163c04623 = self;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_92171f2efd466b59 = 0;
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_ae362d23669f650 = var_5aaf7c7163c04623 function_7d78fe1c5576bf4c(var_568f62a24b19c46d, var_698da5af57b757e7, var_56f4af8746a2d458);
        var_92171f2efd466b59 = max(var_92171f2efd466b59, var_ae362d23669f650);
    }
    return var_92171f2efd466b59;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f4b
// Size: 0xb4
function private function_7c1dbb8157a07757(var_9db4287601b5f233, var_698da5af57b757e7) {
    var_568f62a24b19c46d = self;
    var_5aaf7c7163c04623 = var_568f62a24b19c46d.var_5aaf7c7163c04623;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_568f62a24b19c46d.var_b953954891af97c8[var_9db4287601b5f233] = [];
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        if (isdefined(var_568f62a24b19c46d.var_7038c2a13f1f5db8[var_56f4af8746a2d458]) && isdefined(var_568f62a24b19c46d.var_7038c2a13f1f5db8[var_56f4af8746a2d458][var_698da5af57b757e7])) {
            var_568f62a24b19c46d.var_b953954891af97c8[var_9db4287601b5f233][var_56f4af8746a2d458] = var_56f4af8746a2d458;
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3006
// Size: 0x54
function private function_456603ee124b8267(var_9db4287601b5f233, objectindex) {
    var_568f62a24b19c46d = self;
    if (isdefined(var_568f62a24b19c46d.var_b953954891af97c8) && isdefined(var_568f62a24b19c46d.var_b953954891af97c8[var_9db4287601b5f233])) {
        var_568f62a24b19c46d.var_b953954891af97c8[var_9db4287601b5f233][objectindex] = undefined;
    }
    var_568f62a24b19c46d notify(var_9db4287601b5f233);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3061
// Size: 0x51
function private function_fef8a82cd85330df(var_9db4287601b5f233) {
    var_568f62a24b19c46d = self;
    while (isdefined(var_568f62a24b19c46d.var_b953954891af97c8[var_9db4287601b5f233]) && var_568f62a24b19c46d.var_b953954891af97c8[var_9db4287601b5f233].size > 0) {
        var_568f62a24b19c46d waittill(var_9db4287601b5f233);
    }
    var_568f62a24b19c46d.var_b953954891af97c8[var_9db4287601b5f233] = undefined;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x30b9
// Size: 0xcd
function private function_8cb9e28d833bd068(var_9db4287601b5f233) {
    var_568f62a24b19c46d = self;
    var_5aaf7c7163c04623 = var_568f62a24b19c46d.var_5aaf7c7163c04623;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    if (!isdefined(var_568f62a24b19c46d)) {
        return;
    }
    if (!isdefined(var_568f62a24b19c46d.var_b953954891af97c8)) {
        return;
    }
    foreach (var_56f4af8746a2d458 in var_568f62a24b19c46d.var_b953954891af97c8[var_9db4287601b5f233]) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        var_214d924f4e137244 function_bdd631983c9e6f5c();
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x318d
// Size: 0x15a
function private function_28f230671b0b9a1f(var_9ca58f7c9e862815) {
    var_568f62a24b19c46d = self;
    var_5aaf7c7163c04623 = var_568f62a24b19c46d.var_5aaf7c7163c04623;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_568f62a24b19c46d.var_7bee1a965a8d9487 = 1;
    var_568f62a24b19c46d notify("scene_stop");
    var_5aaf7c7163c04623 notify("scene_stop");
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        if (isdefined(var_568f62a24b19c46d.var_7038c2a13f1f5db8[var_56f4af8746a2d458])) {
            var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
            var_5aaf7c7163c04623 function_b9b2392985736c52(var_56f4af8746a2d458);
        }
    }
    waittillframeend();
    while (var_568f62a24b19c46d.state == "Playing") {
        var_7256b1c211c7aedb = 0;
        for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
            if (isdefined(var_568f62a24b19c46d.var_7038c2a13f1f5db8[var_56f4af8746a2d458])) {
                var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
                if (isdefined(var_214d924f4e137244.active)) {
                    var_7256b1c211c7aedb = 1;
                    break;
                }
            }
        }
        if (!var_7256b1c211c7aedb) {
            var_568f62a24b19c46d.state = "Stopped";
        }
        waitframe();
    }
    if (istrue(var_9ca58f7c9e862815)) {
        var_568f62a24b19c46d function_8accfbca6fff9e0();
    }
    var_568f62a24b19c46d.var_7bee1a965a8d9487 = undefined;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32ee
// Size: 0xf9
function private function_c4b3a49a6470bd32(var_568f62a24b19c46d, var_9db4287601b5f233, var_698da5af57b757e7, objectindex) {
    var_5aaf7c7163c04623 = self;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[objectindex];
    if (var_214d924f4e137244 ent_flag("scene_object_active")) {
        var_5aaf7c7163c04623 function_b9b2392985736c52(objectindex);
    }
    var_214d924f4e137244 ent_flag_waitopen("scene_object_active");
    var_214d924f4e137244 ent_flag_set("scene_object_active");
    animtype = var_214d924f4e137244.var_9be58c68789faf5c function_92192185fc7c5500();
    var_214d924f4e137244.var_36831a04af11576f = [];
    var_214d924f4e137244.var_36831a04af11576f[animtype] = "prepare" + var_698da5af57b757e7 + objectindex;
    var_214d924f4e137244.active = "prepare";
    var_214d924f4e137244 function_d4dcec93a1db6e3f(var_568f62a24b19c46d, var_698da5af57b757e7, objectindex);
    var_568f62a24b19c46d function_456603ee124b8267(var_9db4287601b5f233, objectindex);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x33ee
// Size: 0x5c3
function private function_daa02d9da601d14d(var_568f62a24b19c46d, var_9db4287601b5f233, var_698da5af57b757e7, objectindex) {
    var_5aaf7c7163c04623 = self;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[objectindex];
    var_214d924f4e137244.var_36831a04af11576f = undefined;
    if (!isdefined(var_214d924f4e137244.active)) {
        var_568f62a24b19c46d function_456603ee124b8267(var_9db4287601b5f233, objectindex);
        return;
    }
    if (var_214d924f4e137244.var_9be58c68789faf5c function_c2a0ad9229a93162(var_698da5af57b757e7)) {
        var_568f62a24b19c46d function_456603ee124b8267(var_9db4287601b5f233, objectindex);
    }
    animated = var_214d924f4e137244.var_9be58c68789faf5c function_938cdb6ca25882fc(var_698da5af57b757e7);
    var_214d924f4e137244 function_770c0b047ce9cfc1(var_698da5af57b757e7);
    var_214d924f4e137244.active = "anim";
    var_214d924f4e137244.var_45b7e6a0ab6469e6 = 1;
    var_c5edd954050d9248 = 0;
    var_e731c34c23a09be5 = 0;
    lerptime = var_214d924f4e137244.var_9be58c68789faf5c function_1e3ba3c3afdbb7b4(var_698da5af57b757e7);
    blendtime = var_214d924f4e137244.var_9be58c68789faf5c function_205f7afe5d801664(var_698da5af57b757e7);
    blendcurve = var_214d924f4e137244.var_9be58c68789faf5c function_167ed32773c7c534(var_698da5af57b757e7);
    var_91597527f1cca694 = var_214d924f4e137244 function_a680ab1ba5753613(var_698da5af57b757e7, "lerp");
    var_2161c17b292c8dfc = var_214d924f4e137244 function_a680ab1ba5753613(var_698da5af57b757e7, "blend");
    if (isdefined(var_91597527f1cca694)) {
        lerptime = float(var_91597527f1cca694);
    }
    if (isdefined(var_2161c17b292c8dfc)) {
        blendtime = float(var_2161c17b292c8dfc);
    }
    CameraAnimation = var_214d924f4e137244 function_6c3d100538f590b3(var_698da5af57b757e7);
    var_7535cec6dfd38a5e = var_214d924f4e137244.var_9be58c68789faf5c function_79edcc9987330a2a(var_698da5af57b757e7);
    var_44a5342136771a97 = isarray(var_7535cec6dfd38a5e) && var_7535cec6dfd38a5e.size > 0;
    var_214d924f4e137244 function_535e6f4c06c15b1d(var_568f62a24b19c46d, 1, 0, var_214d924f4e137244.var_bae27d121b581202, lerptime);
    if (animated) {
        animtype = var_214d924f4e137244.var_9be58c68789faf5c function_92192185fc7c5500();
        if (isdefined(var_568f62a24b19c46d.var_43286fd46706909c)) {
            var_66a9a5767d99231e = var_5aaf7c7163c04623 function_7d78fe1c5576bf4c(var_568f62a24b19c46d, var_698da5af57b757e7, objectindex);
            var_29506d8602a737a4 = var_568f62a24b19c46d.var_43286fd46706909c.var_f263562e5b98bed4[var_698da5af57b757e7].var_10b4fa855f381b04;
            var_c5edd954050d9248 = var_29506d8602a737a4;
            var_9102eff943c3c717 = var_29506d8602a737a4 + var_66a9a5767d99231e;
            var_e731c34c23a09be5 = 0;
            if (var_9102eff943c3c717 < var_568f62a24b19c46d.var_43286fd46706909c.var_2fce6a0d9ab1d85) {
                var_214d924f4e137244.active = undefined;
                if (var_44a5342136771a97) {
                    for (var_6dba2c33a7be786f = 0; var_6dba2c33a7be786f < var_7535cec6dfd38a5e.size; var_6dba2c33a7be786f++) {
                        var_ad746e2693353028 = animtype + var_698da5af57b757e7 + objectindex + var_6dba2c33a7be786f;
                        var_214d924f4e137244 function_9605363169f7b770(var_214d924f4e137244.var_bae27d121b581202, var_7535cec6dfd38a5e[var_6dba2c33a7be786f], var_ad746e2693353028, 0, 1, animtype);
                    }
                }
                if (isdefined(CameraAnimation)) {
                    var_ad746e2693353028 = animtype + var_698da5af57b757e7 + objectindex + var_6dba2c33a7be786f + 0;
                    var_214d924f4e137244 function_9605363169f7b770(var_214d924f4e137244.var_bae27d121b581202, CameraAnimation, var_ad746e2693353028, 0, 1, "CameraAnimation");
                }
                var_214d924f4e137244 function_4479600930e9e402(0, var_568f62a24b19c46d, var_9db4287601b5f233, var_698da5af57b757e7, objectindex);
                return;
            } else {
                var_c5edd954050d9248 = var_568f62a24b19c46d.var_43286fd46706909c.var_2fce6a0d9ab1d85 - var_29506d8602a737a4;
            }
        }
        if (is_equal(var_214d924f4e137244.active, "anim")) {
            if (isdefined(CameraAnimation)) {
                var_ad746e2693353028 = animtype + var_698da5af57b757e7 + objectindex + 0;
                var_866b3a3066122e39 = 0;
                if (isdefined(var_568f62a24b19c46d.var_43286fd46706909c)) {
                    var_866b3a3066122e39 = clamp(var_c5edd954050d9248 / var_214d924f4e137244 function_9c0d01ef917ee30(CameraAnimation, "CameraAnimation"), 0, 1);
                    var_214d924f4e137244 function_9605363169f7b770(var_214d924f4e137244.var_bae27d121b581202, CameraAnimation, var_ad746e2693353028, 0, var_866b3a3066122e39, "CameraAnimation");
                }
                var_812033365bb24665 = "CameraAnimation" + var_698da5af57b757e7 + objectindex;
                var_214d924f4e137244 childthread function_c34fc4bc3e1ecbcb(var_698da5af57b757e7, 0, var_812033365bb24665, var_214d924f4e137244.var_bae27d121b581202, CameraAnimation, var_866b3a3066122e39, blendtime, blendcurve, lerptime, "CameraAnimation");
            }
            if (var_44a5342136771a97) {
                var_6dba2c33a7be786f = 0;
                while (var_6dba2c33a7be786f < var_7535cec6dfd38a5e.size) {
                    var_ad746e2693353028 = animtype + var_698da5af57b757e7 + objectindex + var_6dba2c33a7be786f;
                    var_866b3a3066122e39 = 0;
                    if (var_c5edd954050d9248 > var_e731c34c23a09be5) {
                        var_1f44bab9b75c3c9 = var_214d924f4e137244 function_9c0d01ef917ee30(var_7535cec6dfd38a5e[var_6dba2c33a7be786f], animtype);
                        if (var_1f44bab9b75c3c9 > 0) {
                            var_866b3a3066122e39 = clamp((var_c5edd954050d9248 - var_e731c34c23a09be5) / var_1f44bab9b75c3c9, 0, 1);
                            var_214d924f4e137244 function_9605363169f7b770(var_214d924f4e137244.var_bae27d121b581202, var_7535cec6dfd38a5e[var_6dba2c33a7be786f], var_ad746e2693353028, 0, var_866b3a3066122e39, animtype);
                            if (var_866b3a3066122e39 > 1) {
                                var_e731c34c23a09be5 = var_e731c34c23a09be5 + var_1f44bab9b75c3c9;
                                var_6dba2c33a7be786f++;
                                continue;
                            }
                        } else {
                            var_6dba2c33a7be786f++;
                            continue;
                        }
                    }
                    var_1f44bab9b75c3c9 = var_214d924f4e137244 function_c34fc4bc3e1ecbcb(var_698da5af57b757e7, var_6dba2c33a7be786f, var_ad746e2693353028, var_214d924f4e137244.var_bae27d121b581202, var_7535cec6dfd38a5e[var_6dba2c33a7be786f], var_866b3a3066122e39, blendtime, blendcurve, lerptime, animtype);
                    if (isdefined(var_1f44bab9b75c3c9)) {
                        var_c5edd954050d9248 = var_c5edd954050d9248 + var_1f44bab9b75c3c9;
                        var_e731c34c23a09be5 = var_e731c34c23a09be5 + var_1f44bab9b75c3c9;
                    }
                    var_6dba2c33a7be786f++;
                    if (!is_equal(var_214d924f4e137244.active, "anim") || !is_equal(var_214d924f4e137244.var_568f62a24b19c46d, var_568f62a24b19c46d) || !isdefined(var_214d924f4e137244.var_84b542bb7490bea7)) {
                        break;
                    }
                }
            }
        }
    }
    while (isdefined(var_214d924f4e137244.var_36831a04af11576f) && var_214d924f4e137244.var_36831a04af11576f.size > 0) {
        var_214d924f4e137244 waittill("scene_anim_ended");
    }
    var_214d924f4e137244 function_4479600930e9e402(animated, var_568f62a24b19c46d, var_9db4287601b5f233, var_698da5af57b757e7, objectindex);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x39b8
// Size: 0x130
function private function_4479600930e9e402(animated, var_568f62a24b19c46d, var_9db4287601b5f233, var_698da5af57b757e7, objectindex) {
    var_214d924f4e137244 = self;
    if (animated && !isdefined(var_214d924f4e137244.var_77c99123aefe423b)) {
        var_d6a0e35c2c8084e7 = 0;
        if (isdefined(var_214d924f4e137244.var_bb2bc0aa7d81de89)) {
            var_d6a0e35c2c8084e7 = function_1cf2b9abf05dd81d(var_214d924f4e137244.var_bae27d121b581202.var_13352dba0905ac7, var_214d924f4e137244.var_bae27d121b581202.aligntag, var_214d924f4e137244.var_bb2bc0aa7d81de89.var_13352dba0905ac7, var_214d924f4e137244.var_bb2bc0aa7d81de89.aligntag);
        }
        if (!var_d6a0e35c2c8084e7) {
            var_214d924f4e137244 function_535e6f4c06c15b1d(var_568f62a24b19c46d, 0, 0, var_214d924f4e137244.var_bae27d121b581202);
        }
    }
    var_214d924f4e137244 function_a477eb91dc3b38b8(var_698da5af57b757e7);
    if (var_214d924f4e137244 function_d04468979de3a6dd(var_568f62a24b19c46d, var_698da5af57b757e7)) {
        var_214d924f4e137244 function_f9a207358d70923c(level.framedurationseconds, "scene_play", &function_37e4ff5a9807c7d5);
    }
    var_214d924f4e137244.active = undefined;
    var_214d924f4e137244 ent_flag_clear("scene_object_active");
    var_568f62a24b19c46d function_456603ee124b8267(var_9db4287601b5f233, objectindex);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3aef
// Size: 0xdd
function private function_157c6db3114c1ec9(var_568f62a24b19c46d) {
    var_214d924f4e137244 = self;
    /#
        assert(isdefined(var_568f62a24b19c46d));
    #/
    /#
        assert(isarray(var_568f62a24b19c46d.var_df5db7bd235f2729));
    #/
    /#
        assert(isint(var_568f62a24b19c46d.var_1344e48bc80d0f52));
    #/
    objectindex = var_214d924f4e137244.index;
    if (!isdefined(var_568f62a24b19c46d.var_7038c2a13f1f5db8[objectindex])) {
        return 0;
    }
    for (var_2d687b7add41f6a3 = var_568f62a24b19c46d.var_1344e48bc80d0f52 + 1; var_2d687b7add41f6a3 < var_568f62a24b19c46d.var_df5db7bd235f2729.size; var_2d687b7add41f6a3++) {
        var_1ee8422a72befa7 = var_568f62a24b19c46d.var_df5db7bd235f2729[var_2d687b7add41f6a3];
        if (isdefined(var_568f62a24b19c46d.var_7038c2a13f1f5db8[objectindex][var_1ee8422a72befa7])) {
            return 1;
        }
    }
    return 0;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3bd4
// Size: 0x153
function private function_d04468979de3a6dd(var_568f62a24b19c46d, var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    var_5aaf7c7163c04623 = var_214d924f4e137244.var_5aaf7c7163c04623;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    if (!isdefined(var_84b542bb7490bea7)) {
        return 1;
    }
    if (!is_equal(var_568f62a24b19c46d, var_214d924f4e137244.var_568f62a24b19c46d)) {
        return 0;
    }
    if (isdefined(var_214d924f4e137244.var_77c99123aefe423b)) {
        return 0;
    }
    if (var_5aaf7c7163c04623.var_84b542bb7490bea7.scenescriptbundle function_4f93a0dfb8fd6a47()) {
        return 0;
    }
    if (!var_214d924f4e137244.var_9be58c68789faf5c function_938cdb6ca25882fc(var_698da5af57b757e7)) {
        return 0;
    }
    if (var_568f62a24b19c46d.var_df5db7bd235f2729.size == 0 || var_698da5af57b757e7 == var_568f62a24b19c46d.var_df5db7bd235f2729[var_568f62a24b19c46d.var_df5db7bd235f2729.size - 1]) {
        return 1;
    }
    var_7a28050da4d92ad6 = var_214d924f4e137244.var_9be58c68789faf5c function_d5f4474a16f90132();
    if (var_214d924f4e137244.var_9be58c68789faf5c function_c77857d663e8cfbe() == "Types_XCam" || var_7a28050da4d92ad6 == "DeleteAlwaysNotInvolved" || var_7a28050da4d92ad6 == "DeleteSpawnedNotInvolved" && !istrue(var_214d924f4e137244.var_423f55edd900883)) {
        if (!var_214d924f4e137244 function_157c6db3114c1ec9(var_568f62a24b19c46d)) {
            return 1;
        }
    }
    return 0;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d2f
// Size: 0x165
function private function_7d78fe1c5576bf4c(var_568f62a24b19c46d, var_698da5af57b757e7, objectindex) {
    var_5aaf7c7163c04623 = self;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[objectindex];
    if (isdefined(var_568f62a24b19c46d.var_43286fd46706909c) && isdefined(var_568f62a24b19c46d.var_43286fd46706909c.var_f263562e5b98bed4[var_698da5af57b757e7])) {
        return var_568f62a24b19c46d.var_43286fd46706909c.var_f263562e5b98bed4[var_698da5af57b757e7].var_396646edb4ba78fe;
    }
    var_cb8abce5b631aac9 = 0;
    var_971620ae7c7f0f6c = 0;
    CameraAnimation = var_214d924f4e137244 function_6c3d100538f590b3(var_698da5af57b757e7);
    if (isdefined(CameraAnimation)) {
        var_7e2f32c3500293bd = var_214d924f4e137244 function_9c0d01ef917ee30(CameraAnimation, "CameraAnimation");
    }
    animtype = var_214d924f4e137244.var_9be58c68789faf5c function_92192185fc7c5500();
    var_7535cec6dfd38a5e = var_214d924f4e137244.var_9be58c68789faf5c function_79edcc9987330a2a(var_698da5af57b757e7);
    for (var_6dba2c33a7be786f = 0; var_6dba2c33a7be786f < var_7535cec6dfd38a5e.size; var_6dba2c33a7be786f++) {
        var_cb8abce5b631aac9 = var_cb8abce5b631aac9 + var_214d924f4e137244 function_9c0d01ef917ee30(var_7535cec6dfd38a5e[var_6dba2c33a7be786f], animtype);
    }
    return max(var_971620ae7c7f0f6c, var_cb8abce5b631aac9);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3e9c
// Size: 0x83
function private function_b9b2392985736c52(var_56f4af8746a2d458) {
    var_5aaf7c7163c04623 = self;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
    var_214d924f4e137244.active = undefined;
    var_214d924f4e137244.var_45b7e6a0ab6469e6 = 0;
    var_214d924f4e137244 notify("scene_stop");
    var_214d924f4e137244 function_bdd631983c9e6f5c();
    var_214d924f4e137244 function_9b8055c613f1bb31();
    var_214d924f4e137244 ent_flag_clear("scene_object_active");
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f26
// Size: 0x1c0
function private function_c643b2c6b794481e(newstate) {
    var_5aaf7c7163c04623 = self;
    /#
        assert(newstate != "Playing");
    #/
    /#
        assert(newstate != "Stopped");
    #/
    if (isdefined(var_5aaf7c7163c04623.var_84b542bb7490bea7) && var_5aaf7c7163c04623.var_84b542bb7490bea7.state != newstate) {
        if (newstate != "NotInit") {
            var_5aaf7c7163c04623.var_84b542bb7490bea7.state = newstate;
            var_5aaf7c7163c04623 function_2549c341bf1ae3e7(var_5aaf7c7163c04623.var_84b542bb7490bea7.state);
        } else {
            /#
                assert(var_5aaf7c7163c04623.var_84b542bb7490bea7.state == "NotSetup");
            #/
            if (isdefined(var_5aaf7c7163c04623.var_84b542bb7490bea7.var_214d924f4e137244) && isdefined(var_5aaf7c7163c04623.var_84b542bb7490bea7.scenescriptbundle)) {
                var_caec512e105611cd = var_5aaf7c7163c04623.var_84b542bb7490bea7.scenescriptbundle function_291cd2f1089d3a94();
                if (isdefined(var_caec512e105611cd)) {
                    for (objectindex = 0; objectindex < var_caec512e105611cd; objectindex++) {
                        if (objectindex < var_5aaf7c7163c04623.var_84b542bb7490bea7.var_214d924f4e137244.size) {
                            var_5aaf7c7163c04623.var_84b542bb7490bea7.var_214d924f4e137244[objectindex].var_84b542bb7490bea7 = undefined;
                        }
                    }
                }
            }
            function_680ff86fdba6e483(var_5aaf7c7163c04623.var_84b542bb7490bea7.scriptbundle);
            /#
                var_5aaf7c7163c04623 function_86051e11e7b7a98e();
            #/
            var_5aaf7c7163c04623.var_84b542bb7490bea7.var_5aaf7c7163c04623 = undefined;
            var_5aaf7c7163c04623.var_84b542bb7490bea7 = undefined;
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40ed
// Size: 0xbc
function private function_2549c341bf1ae3e7(state) {
    var_5aaf7c7163c04623 = self;
    if (isdefined(var_5aaf7c7163c04623.var_aadf0dea942accd5) && isdefined(var_5aaf7c7163c04623.var_aadf0dea942accd5.var_c586ec36655fd62f) && isdefined(var_5aaf7c7163c04623.var_aadf0dea942accd5.var_51b0b5d62d2618a0)) {
        if (!isdefined(var_5aaf7c7163c04623.var_aadf0dea942accd5.var_68d7a81a3effb349) || var_5aaf7c7163c04623.var_aadf0dea942accd5.var_68d7a81a3effb349 == state) {
            var_5aaf7c7163c04623.var_aadf0dea942accd5.var_c586ec36655fd62f notify(var_5aaf7c7163c04623.var_aadf0dea942accd5.var_51b0b5d62d2618a0);
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41b0
// Size: 0x1a
function private function_6c0e3626ebce826f() {
    var_5aaf7c7163c04623 = self;
    return var_5aaf7c7163c04623.var_8ac77218f7a34e3e;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41d2
// Size: 0x87
function private function_6a6ec88abab6a723() {
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_bd09568f76dd40ca();
    if (!isdefined(var_5aaf7c7163c04623.var_84b542bb7490bea7.scriptbundle)) {
        var_fdde7202170bac63 = var_5aaf7c7163c04623 function_6c0e3626ebce826f();
        if (isdefined(var_fdde7202170bac63)) {
            var_5aaf7c7163c04623.var_84b542bb7490bea7.scriptbundle = function_5e9baece4185ee1e(function_2ef675c13ca1c4af(%"scenescriptbundle:", var_fdde7202170bac63));
        }
    }
    return var_5aaf7c7163c04623.var_84b542bb7490bea7.scriptbundle;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4261
// Size: 0x6c
function private function_7855ec4caf5901f9(typename, funcname, func) {
    function_ace39e84230f386();
    if (!isdefined(level.scene.var_4083b70e2b4728b7[typename])) {
        level.scene.var_4083b70e2b4728b7[typename] = [];
    }
    level.scene.var_4083b70e2b4728b7[typename][funcname] = func;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x42d4
// Size: 0x26d
function private function_5a197e7b54a9091e() {
    /#
        assert(isdefined(level.scene.var_4083b70e2b4728b7));
    #/
    /#
        assert(isdefined(level.scene.var_4083b70e2b4728b7["Types_Object"]));
    #/
    /#
        assert(!isdefined(level.scene.var_8a6cbf5e0998e58d));
    #/
    level.scene.var_8a6cbf5e0998e58d = [];
    var_a05b670b818e941c = [0:"Types_Object", 1:"Types_Prop", 2:"Types_Actor", 3:"Types_Player", 4:"Types_EnemyPlayer", 5:"Types_FakePlayer", 6:"Types_FakeActor", 7:"Types_Vehicle", 8:"Types_Mayhem", 9:"Types_XCam"];
    foreach (var_c311f4d2b460f074 in var_a05b670b818e941c) {
        level.scene.var_8a6cbf5e0998e58d[var_c311f4d2b460f074] = [];
        foreach (functype, func in level.scene.var_4083b70e2b4728b7["Types_Object"]) {
            level.scene.var_8a6cbf5e0998e58d[var_c311f4d2b460f074][functype] = func;
        }
    }
    foreach (var_c311f4d2b460f074, var_c7383d9309c52a8d in level.scene.var_4083b70e2b4728b7) {
        if (var_c311f4d2b460f074 == "Types_Object") {
            continue;
        }
        foreach (functype, func in var_c7383d9309c52a8d) {
            level.scene.var_8a6cbf5e0998e58d[var_c311f4d2b460f074][functype] = func;
        }
    }
    level.scene.var_4083b70e2b4728b7 = undefined;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4548
// Size: 0x5e
function private function_9d3850b024ab89b1(funcname, func) {
    function_ace39e84230f386();
    if (!isdefined(level.scene.var_f691f31b4f1e0c17)) {
        level.scene.var_f691f31b4f1e0c17 = [];
    }
    level.scene.var_f691f31b4f1e0c17[funcname] = func;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x45ad
// Size: 0x47
function private function_1a2cae854fe073a0(functype) {
    var_9ecbeba68a379903 = undefined;
    if (isdefined(level.scene.var_f691f31b4f1e0c17)) {
        var_9ecbeba68a379903 = level.scene.var_f691f31b4f1e0c17[functype];
    }
    return var_9ecbeba68a379903;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x45fc
// Size: 0x17
function private function_8a786f133d7341c0(functype) {
    return self.var_c7383d9309c52a8d[functype];
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x461b
// Size: 0x379
function private function_fcb671080d2533e6(var_bae27d121b581202, var_49a7f73f0fb5f6cf) {
    var_214d924f4e137244 = self;
    var_aadf0dea942accd5 = var_214d924f4e137244.var_5aaf7c7163c04623.var_aadf0dea942accd5;
    entity = undefined;
    var_c311f4d2b460f074 = var_214d924f4e137244.var_9be58c68789faf5c function_c77857d663e8cfbe();
    var_373a2c3b02b1d81c = var_214d924f4e137244.var_9be58c68789faf5c function_992de34e05c5cea7();
    var_6fc4d2978cf27bef = var_214d924f4e137244.var_9be58c68789faf5c function_12eb9fd56334261c();
    var_982109bda19f3517 = var_214d924f4e137244.var_9be58c68789faf5c function_aeb2b46911a5811d();
    spawnorigin = var_bae27d121b581202.origin;
    spawnangles = var_bae27d121b581202.angles;
    if (isdefined(var_49a7f73f0fb5f6cf)) {
        var_7535cec6dfd38a5e = var_214d924f4e137244.var_9be58c68789faf5c function_79edcc9987330a2a(var_49a7f73f0fb5f6cf);
        if (isdefined(var_7535cec6dfd38a5e) && var_7535cec6dfd38a5e.size > 0 && isanimation(var_7535cec6dfd38a5e[0])) {
            spawnorigin = getstartorigin(var_bae27d121b581202.origin, var_bae27d121b581202.angles, var_7535cec6dfd38a5e[0]);
            spawnangles = getstartangles(var_bae27d121b581202.origin, var_bae27d121b581202.angles, var_7535cec6dfd38a5e[0]);
        }
    }
    /#
        function_ce4b6d4d859ede39(var_214d924f4e137244, "scene_shot", spawnorigin, spawnangles);
    #/
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectSpawn");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_fcb671080d2533e6) {
        entity = var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](spawnorigin, spawnangles);
    }
    if (!isdefined(entity)) {
        entity = var_214d924f4e137244 function_3e19c1b49e591d34(spawnorigin, spawnangles);
    }
    /#
        if (!isdefined(entity)) {
            if (var_c311f4d2b460f074 != "origin" && var_c311f4d2b460f074 != "DropQuick") {
                println("freezecontrols" + var_982109bda19f3517 + "<unknown string>" + var_373a2c3b02b1d81c + "<unknown string>" + var_6fc4d2978cf27bef + "weapon_switch");
            }
        }
    #/
    if (isdefined(entity) && !isplayer(entity) && isdefined(var_aadf0dea942accd5) && isdefined(var_aadf0dea942accd5.var_8124e3f14d523a45)) {
        entity.var_214d924f4e137244 = var_214d924f4e137244;
        var_e0068a37b92d6b2 = [0:var_982109bda19f3517, 1:var_c311f4d2b460f074, 2:"_object_all_"];
        foreach (tablename in var_e0068a37b92d6b2) {
            if (isdefined(var_aadf0dea942accd5.var_8124e3f14d523a45[tablename])) {
                foreach (spawnfunc in var_aadf0dea942accd5.var_8124e3f14d523a45[tablename]) {
                    entity thread [[ spawnfunc ]]();
                }
            }
        }
    }
    if (isdefined(entity)) {
        switch (var_214d924f4e137244.var_9be58c68789faf5c function_b5a77eb340ad5552()) {
        case #"hash_5a532485943b3d4b":
            entity.targetname = "_scene_global_" + var_982109bda19f3517;
            break;
        case #"hash_6d8a4db48060bf8":
            entity.script_noteworthy = "_scene_global_" + var_982109bda19f3517;
            break;
        }
    }
    return entity;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x499c
// Size: 0x19b
function private function_3e19c1b49e591d34(spawnorigin, spawnangles) {
    var_214d924f4e137244 = self;
    entity = undefined;
    var_373a2c3b02b1d81c = var_214d924f4e137244.var_9be58c68789faf5c function_992de34e05c5cea7();
    var_6fc4d2978cf27bef = var_214d924f4e137244.var_9be58c68789faf5c function_12eb9fd56334261c();
    if (var_373a2c3b02b1d81c == "xmodel" || var_373a2c3b02b1d81c == "xcompositemodel") {
        entity = spawn("script_model", spawnorigin);
        if (isdefined(entity)) {
            entity val::set("scene_scene", "cinematics_participant", 1);
            entity.angles = spawnangles;
            entity setmodel(var_6fc4d2978cf27bef);
            animtree = var_214d924f4e137244.var_9be58c68789faf5c function_c106523f3836b90b();
            if (isdefined(animtree)) {
                entity useanimtree(animtree);
            }
            entity namespace_c5f7e08ad7ea4280::function_d5f76e611c78509a();
        }
    } else if (var_373a2c3b02b1d81c == "character") {
        character = function_1823ff50bb28148d(var_6fc4d2978cf27bef);
        if (isdefined(level.var_586887bc5dc30f34) && isdefined(level.var_586887bc5dc30f34[character])) {
            entity = spawn("script_model", spawnorigin);
            if (isdefined(entity)) {
                entity val::set("scene_scene", "cinematics_participant", 1);
                func = level.var_586887bc5dc30f34[character];
                entity [[ func ]]();
                entity.angles = spawnangles;
                animtree = var_214d924f4e137244.var_9be58c68789faf5c function_c106523f3836b90b();
                if (isdefined(animtree)) {
                    entity useanimtree(animtree);
                }
                entity namespace_c5f7e08ad7ea4280::function_d5f76e611c78509a();
            }
        }
    }
    return entity;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b3f
// Size: 0x8e
function private function_476ef6856b76fadb(var_fa1af9d2277fd747) {
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244)) {
        return;
    }
    if (isdefined(var_214d924f4e137244.var_568f62a24b19c46d) && isdefined(var_214d924f4e137244.active)) {
        var_214d924f4e137244.var_568f62a24b19c46d function_456603ee124b8267(var_214d924f4e137244.active, var_214d924f4e137244.index);
    }
    var_214d924f4e137244 function_bdd631983c9e6f5c();
    var_214d924f4e137244 function_37e4ff5a9807c7d5(var_fa1af9d2277fd747);
    var_214d924f4e137244 ent_flag_clear("scene_object_active");
    var_214d924f4e137244.entity = undefined;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4bd4
// Size: 0x12e
function private function_6acd8ab4606e2a09(var_5aaf7c7163c04623, var_568f62a24b19c46d, entity, var_ffed1da1387e6d58, var_5ce6119315ff5b97) {
    var_214d924f4e137244 = self;
    if (isdefined(entity) && isdefined(entity.var_214d924f4e137244) && !is_equal(var_568f62a24b19c46d, entity.var_214d924f4e137244.var_568f62a24b19c46d)) {
        if (var_5ce6119315ff5b97 != "scene_init_prestream" && entity.var_214d924f4e137244 != var_214d924f4e137244) {
            /#
                assert(var_214d924f4e137244 != entity.var_214d924f4e137244 || !is_equal(var_568f62a24b19c46d, entity.var_214d924f4e137244.var_568f62a24b19c46d));
            #/
            entity.var_214d924f4e137244 function_476ef6856b76fadb(var_5aaf7c7163c04623);
        }
    }
    if (isent(var_214d924f4e137244.entity)) {
        if (var_214d924f4e137244.entity == entity) {
            return;
        }
        if (!istrue(var_214d924f4e137244.var_423f55edd900883)) {
            var_214d924f4e137244 function_37e4ff5a9807c7d5();
            var_214d924f4e137244 function_746341289f892160();
        }
    }
    var_214d924f4e137244.entity = entity;
    var_214d924f4e137244.var_423f55edd900883 = var_ffed1da1387e6d58;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d09
// Size: 0x184
function private function_73ba1df113a6ca64(var_568f62a24b19c46d) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244.var_568f62a24b19c46d = var_568f62a24b19c46d;
    if (isdefined(var_214d924f4e137244.entity)) {
        var_982109bda19f3517 = var_214d924f4e137244.var_9be58c68789faf5c function_aeb2b46911a5811d();
        var_43ae35d311ef0ccc = var_214d924f4e137244.var_9be58c68789faf5c function_c106523f3836b90b();
        var_214d924f4e137244 function_729a3f3943f35748(var_982109bda19f3517, var_43ae35d311ef0ccc);
        if (!isdefined(var_214d924f4e137244.var_f143eb748d8b5556)) {
            var_214d924f4e137244.var_f143eb748d8b5556 = var_214d924f4e137244.entity.dontmelee;
        }
        var_214d924f4e137244.entity.dontmelee = 1;
        var_214d924f4e137244.entity ent_flag_set("scene_active");
        if (isplayer(var_214d924f4e137244.entity)) {
            if (var_214d924f4e137244.var_84b542bb7490bea7.scenescriptbundle function_295cf85da8fa8653()) {
                var_214d924f4e137244.entity val::set("scene_scene", "show_hud", 0);
            }
        }
    }
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectSetup");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_73ba1df113a6ca64) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_568f62a24b19c46d);
    }
    if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity.var_214d924f4e137244 = var_214d924f4e137244;
    }
    var_214d924f4e137244.issetup = 1;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e94
// Size: 0x165
function private function_729a3f3943f35748(animname, animtree) {
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.entity)) {
        return;
    }
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectSetAnimName");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_729a3f3943f35748) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](animname, animtree);
    } else if (isdefined(animname)) {
        if (!isplayer(var_214d924f4e137244.entity) && isdefined(animtree) && (!isdefined(var_214d924f4e137244.entity.animtree) || var_214d924f4e137244.entity.animtree == "")) {
            if (!isdefined(var_214d924f4e137244.var_86fb513899b4cb91)) {
                var_214d924f4e137244.var_86fb513899b4cb91 = var_214d924f4e137244.entity.animtree;
            }
            var_214d924f4e137244.entity useanimtree(animtree);
        }
        if (!isdefined(var_214d924f4e137244.entity.animname)) {
            var_214d924f4e137244.entity.animname = animname;
        }
    } else {
        if (isdefined(var_214d924f4e137244.var_86fb513899b4cb91)) {
            var_214d924f4e137244.entity useanimtree(var_214d924f4e137244.var_86fb513899b4cb91);
        }
        var_214d924f4e137244.var_86fb513899b4cb91 = undefined;
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5000
// Size: 0x69
function private function_bdfc45b799d27532(var_4f3089070d8b1e24) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244.var_53c962747bd1f2f = undefined;
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectSetAnimPlaying");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_bdfc45b799d27532) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_4f3089070d8b1e24);
    } else {
        var_214d924f4e137244.var_53c962747bd1f2f = var_4f3089070d8b1e24;
        var_214d924f4e137244 notify("scene_anim_playing", var_4f3089070d8b1e24);
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5070
// Size: 0xe1
function private function_5006f1d3bba27ce4(var_fcc3f96f3cb06900) {
    var_214d924f4e137244 = self;
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectParticipatingCinematics");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_5006f1d3bba27ce4) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_fcc3f96f3cb06900);
    } else {
        entities = var_214d924f4e137244 function_f054a83311d7f448();
        if (isarray(entities)) {
            foreach (entity in entities) {
                if (isent(entity)) {
                    if (istrue(var_fcc3f96f3cb06900)) {
                        entity val::set("scene_scene", "cinematics_participant", 1);
                    } else {
                        entity val::reset("scene_scene", "cinematics_participant");
                    }
                }
            }
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x5158
// Size: 0x3d
function private function_2142970a7a74d1f2(endonevent, func, param1, param2) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 thread function_a3511922b90bf177(endonevent, func, param1, param2);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x519c
// Size: 0xf3
function private function_a3511922b90bf177(endonevent, func, param1, param2) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    if (!isdefined(entity)) {
        return;
    }
    if (!isdefined(var_214d924f4e137244.var_53c962747bd1f2f)) {
        entity endon("death_or_disconnect");
        if (isdefined(endonevent)) {
            if (!isarray(endonevent)) {
                endonevent = [0:endonevent];
            }
            foreach (var_cb57658b734d4b0c in endonevent) {
                entity endon(var_cb57658b734d4b0c);
            }
        }
        var_214d924f4e137244 waittill("scene_anim_playing");
    }
    if (isdefined(param2)) {
        entity builtin [[ func ]](param1, param2);
    } else if (isdefined(param1)) {
        entity builtin [[ func ]](param1);
    } else {
        entity builtin [[ func ]]();
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5296
// Size: 0xb4
function private function_6a4d64bdba27cb06(animrate) {
    var_214d924f4e137244 = self;
    animrate = function_53c4c53197386572(animrate, 1);
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectSetAnimRate");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_6a4d64bdba27cb06) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](animrate);
    } else if (isdefined(var_214d924f4e137244.var_77c99123aefe423b) && isdefined(var_214d924f4e137244.var_41dc93404af773a3) && var_214d924f4e137244.var_41dc93404af773a3 == "DeltaAnimation") {
        entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
        if (isdefined(entity)) {
            entity setanimrate(var_214d924f4e137244.var_77c99123aefe423b, animrate);
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5351
// Size: 0x86
function private function_380708345e16e475(var_4f3089070d8b1e24, timefrac) {
    var_214d924f4e137244 = self;
    timefrac = function_53c4c53197386572(timefrac, 0);
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectSetAnimTime");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_380708345e16e475) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_4f3089070d8b1e24, timefrac);
    } else {
        entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
        if (isdefined(entity)) {
            entity setanimtime(var_4f3089070d8b1e24, timefrac);
            entity dontinterpolate();
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x53de
// Size: 0xe5
function private function_db16fb604c5ca71d(lerptime, velocity) {
    var_214d924f4e137244 = self;
    lerptime = function_53c4c53197386572(lerptime, 0);
    velocity = function_53c4c53197386572(velocity, (0, 0, 0));
    waittillframeend();
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectSetAnimLerp");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_db16fb604c5ca71d) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](lerptime, velocity);
    } else {
        entities = var_214d924f4e137244 function_f054a83311d7f448();
        foreach (entity in entities) {
            if (function_6b39e3ba5cb9726(entity)) {
                entity function_4beb9f7715504995(lerptime, velocity);
            }
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x54ca
// Size: 0xc7
function private function_bf2f06d70b4e15ad(enabled) {
    var_214d924f4e137244 = self;
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectSetProcBones");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_bf2f06d70b4e15ad) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](enabled);
    } else {
        entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
        if (!isdefined(entity)) {
            return;
        }
        if (isdefined(entity.animtree)) {
            proc_node = function_d2fff5ce136ca7b("proc_node", entity);
            if (isdefined(proc_node)) {
                weight = 1;
                if (!istrue(enabled)) {
                    weight = 0;
                }
                if (!isdefined(var_214d924f4e137244.var_53c962747bd1f2f)) {
                    var_214d924f4e137244 waittill("scene_anim_playing");
                }
                entity setanim(proc_node, weight, 0);
            }
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5598
// Size: 0x6c
function private function_2294fe71a7c1d8d6(entity) {
    var_214d924f4e137244 = self;
    if (!isent(entity)) {
        return 0;
    }
    if (isspawner(entity)) {
        return 0;
    }
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectMatchEntity");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_2294fe71a7c1d8d6) {
        return var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](entity);
    }
    return entity.classname == "script_model";
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x560c
// Size: 0x1c0
function private function_1ba5fc9ef8e19620(var_5aaf7c7163c04623, var_568f62a24b19c46d, var_982109bda19f3517, var_b8f911d5d30c646a, var_11e3bd5dd8eea638, var_ffed1da1387e6d58, var_5ce6119315ff5b97) {
    var_214d924f4e137244 = self;
    if (isarray(var_b8f911d5d30c646a)) {
        if (isdefined(var_214d924f4e137244.entity)) {
            foreach (var_f638bf84f355737e, var_45acf67403d5cd in var_b8f911d5d30c646a) {
                if (isent(var_45acf67403d5cd) && var_214d924f4e137244 function_2294fe71a7c1d8d6(var_45acf67403d5cd)) {
                    if (var_45acf67403d5cd == var_214d924f4e137244.entity || isdefined(var_45acf67403d5cd.animname) && isdefined(var_214d924f4e137244.entity.animname) && var_45acf67403d5cd.animname == var_214d924f4e137244.entity.animname) {
                        var_214d924f4e137244 function_6acd8ab4606e2a09(var_5aaf7c7163c04623, var_568f62a24b19c46d, var_45acf67403d5cd, var_ffed1da1387e6d58, var_5ce6119315ff5b97);
                        var_b8f911d5d30c646a[var_f638bf84f355737e] = undefined;
                        break;
                    }
                }
            }
            return var_b8f911d5d30c646a;
        }
        foreach (var_f638bf84f355737e, var_45acf67403d5cd in var_b8f911d5d30c646a) {
            if (isent(var_45acf67403d5cd) && var_214d924f4e137244 function_2294fe71a7c1d8d6(var_45acf67403d5cd)) {
                if (!istrue(var_11e3bd5dd8eea638) || isdefined(var_45acf67403d5cd.animname) && var_45acf67403d5cd.animname == var_982109bda19f3517) {
                    var_214d924f4e137244 function_6acd8ab4606e2a09(var_5aaf7c7163c04623, var_568f62a24b19c46d, var_45acf67403d5cd, var_ffed1da1387e6d58, var_5ce6119315ff5b97);
                    var_b8f911d5d30c646a[var_f638bf84f355737e] = undefined;
                    break;
                }
            }
        }
    }
    return var_b8f911d5d30c646a;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x57d4
// Size: 0x12f
function private function_53687c7001a0784b(var_5aaf7c7163c04623, var_568f62a24b19c46d, var_982109bda19f3517, var_4b594fd689af17dc, keyname, var_5ce6119315ff5b97) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244 function_6acd8ab4606e2a09(var_5aaf7c7163c04623, var_568f62a24b19c46d, var_214d924f4e137244.entity, 1, var_5ce6119315ff5b97);
        entnum = var_214d924f4e137244.entity getentitynumber();
        var_4b594fd689af17dc[entnum] = var_214d924f4e137244.entity;
        return var_4b594fd689af17dc;
    }
    var_60233c05c532a850 = getentarray(var_982109bda19f3517, keyname);
    foreach (var_db7ea2b71b14d258 in var_60233c05c532a850) {
        entnum = var_db7ea2b71b14d258 getentitynumber();
        if (isdefined(var_4b594fd689af17dc) && isdefined(var_4b594fd689af17dc[entnum])) {
            continue;
        }
        if (var_214d924f4e137244 function_2294fe71a7c1d8d6(var_db7ea2b71b14d258)) {
            var_214d924f4e137244 function_6acd8ab4606e2a09(var_5aaf7c7163c04623, var_568f62a24b19c46d, var_db7ea2b71b14d258, 1, var_5ce6119315ff5b97);
            var_4b594fd689af17dc[entnum] = var_db7ea2b71b14d258;
            break;
        }
    }
    return var_4b594fd689af17dc;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x590b
// Size: 0x57
function private function_4c4c2a548b9fc7ab() {
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.entity)) {
        return undefined;
    }
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectGetAnimEntity");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_4c4c2a548b9fc7ab) {
        return var_214d924f4e137244 [[ var_9ecbeba68a379903 ]]();
    }
    return var_214d924f4e137244.entity;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x596a
// Size: 0x53
function private function_f054a83311d7f448() {
    var_214d924f4e137244 = self;
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectGetLinkEnts");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_f054a83311d7f448) {
        return var_214d924f4e137244 [[ var_9ecbeba68a379903 ]]();
    }
    var_73147aa08912a797 = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    return [0:var_73147aa08912a797];
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x59c5
// Size: 0x70
function private function_b9c245bf99df4a8() {
    var_214d924f4e137244 = self;
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectGetAnimRoot");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_b9c245bf99df4a8) {
        return var_214d924f4e137244 [[ var_9ecbeba68a379903 ]]();
    }
    entity = function_4c4c2a548b9fc7ab();
    if (isdefined(entity) && isdefined(entity.anim_getrootfunc)) {
        return [[ entity.anim_getrootfunc ]]();
    }
    return undefined;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5a3d
// Size: 0xf0
function private function_f94f4fe0f6cf86bc(origin, angles) {
    var_214d924f4e137244 = self;
    /#
        function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>", origin, angles);
    #/
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectTeleport");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_f94f4fe0f6cf86bc) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](origin, angles);
        return;
    }
    entities = var_214d924f4e137244 function_f054a83311d7f448();
    foreach (entity in entities) {
        if (isdefined(entity)) {
            entity dontinterpolate();
            if (isdefined(origin)) {
                entity.origin = origin;
            }
            if (isdefined(angles)) {
                entity.angles = angles;
            }
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5b34
// Size: 0x48
function private function_3be41fe991fc4b94() {
    var_214d924f4e137244 = self;
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectVelocity");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_3be41fe991fc4b94) {
        return var_214d924f4e137244 [[ var_9ecbeba68a379903 ]]();
    }
    return (0, 0, 0);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5b84
// Size: 0x52
function private function_1cf2b9abf05dd81d(var_142eba0283c1472f, var_e973ee32eaf2f7c, newentity, var_34744859ad58739b) {
    if (!isdefined(var_142eba0283c1472f)) {
        return 0;
    }
    if (!isdefined(newentity)) {
        return 0;
    }
    if (var_142eba0283c1472f != newentity) {
        return 0;
    }
    if (!isdefined(var_e973ee32eaf2f7c)) {
        return 0;
    }
    if (!isdefined(var_34744859ad58739b)) {
        return 0;
    }
    if (var_e973ee32eaf2f7c != var_34744859ad58739b) {
        return 0;
    }
    return 1;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5bde
// Size: 0x471
function private function_535e6f4c06c15b1d(var_568f62a24b19c46d, blink, var_70f375eb0b696d8a, var_bae27d121b581202, lerptime) {
    var_214d924f4e137244 = self;
    if (istrue(blink)) {
        function_e4fc30ccdca08b9d(var_bae27d121b581202);
    }
    var_69ee0afd4f1ea64b = var_214d924f4e137244 function_f054a83311d7f448();
    if (istrue(var_70f375eb0b696d8a) && isdefined(var_568f62a24b19c46d) && !var_214d924f4e137244 function_d82945c5509ec28e(var_568f62a24b19c46d.var_49a7f73f0fb5f6cf)) {
        return;
    }
    foreach (entity in var_69ee0afd4f1ea64b) {
        if (!isent(entity)) {
            continue;
        }
        var_bf8e5f003146af44 = entity getlinkedparent();
        if (!isdefined(var_bae27d121b581202) || !isent(var_bae27d121b581202.var_13352dba0905ac7)) {
            if (isdefined(var_bf8e5f003146af44)) {
                entity unlink();
            }
            return;
        }
        if (istrue(blink)) {
            prevorigin = entity.origin;
            prevangles = entity.angles;
            var_80cc7e738d1c353f = function_1cf2b9abf05dd81d(var_214d924f4e137244.linkedent, var_214d924f4e137244.var_2b16b22ac076fda4, var_bae27d121b581202.var_13352dba0905ac7, var_bae27d121b581202.aligntag);
            if (!var_80cc7e738d1c353f && var_bae27d121b581202.var_13352dba0905ac7 != entity && !entity isragdoll() && (!isdefined(var_bf8e5f003146af44) || var_bf8e5f003146af44 != var_bae27d121b581202.var_13352dba0905ac7 || function_53c4c53197386572(var_214d924f4e137244.var_2b16b22ac076fda4, "") != function_53c4c53197386572(var_bae27d121b581202.aligntag, ""))) {
                if (!isdefined(lerptime) || lerptime <= 0) {
                    var_214d924f4e137244 function_f94f4fe0f6cf86bc(var_bae27d121b581202.origin, var_bae27d121b581202.angles);
                }
                if (isstring(var_bae27d121b581202.aligntag)) {
                    /#
                        function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_bae27d121b581202.aligntag, var_bae27d121b581202.var_13352dba0905ac7 gettagorigin(var_bae27d121b581202.aligntag), var_bae27d121b581202.var_13352dba0905ac7 gettagangles(var_bae27d121b581202.aligntag));
                    #/
                    if (isplayer(entity)) {
                        entity playerlinkto(var_bae27d121b581202.var_13352dba0905ac7, var_bae27d121b581202.aligntag);
                    } else if (isagent(entity)) {
                        entity linktomoveoffset(var_bae27d121b581202.var_13352dba0905ac7, var_bae27d121b581202.aligntag);
                        entity playerlinkedoffsetenable();
                        entity fixlinktointerpolationbug(1);
                    } else {
                        entity linkto(var_bae27d121b581202.var_13352dba0905ac7, var_bae27d121b581202.aligntag, (0, 0, 0), (0, 0, 0));
                    }
                    var_214d924f4e137244.var_2b16b22ac076fda4 = var_bae27d121b581202.aligntag;
                    var_214d924f4e137244.linkedent = var_bae27d121b581202.var_13352dba0905ac7;
                    if (isdefined(lerptime) && lerptime > 0) {
                        var_214d924f4e137244 function_f94f4fe0f6cf86bc(prevorigin, prevangles);
                    }
                } else {
                    /#
                        function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>", entity.origin, entity.angles);
                    #/
                    var_214d924f4e137244.var_2b16b22ac076fda4 = undefined;
                    var_214d924f4e137244.linkedent = var_bae27d121b581202.var_13352dba0905ac7;
                    if (isplayer(entity)) {
                        entity playerlinkto(var_bae27d121b581202.var_13352dba0905ac7);
                    } else if (isagent(entity)) {
                        entity linktomoveoffset(var_bae27d121b581202.var_13352dba0905ac7);
                        entity playerlinkedoffsetenable();
                        entity fixlinktointerpolationbug(1);
                    } else {
                        entity linkto(var_bae27d121b581202.var_13352dba0905ac7);
                    }
                }
            }
        } else if (isdefined(var_bf8e5f003146af44) && var_bf8e5f003146af44 == var_bae27d121b581202.var_13352dba0905ac7) {
            /#
                function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>", entity.origin, entity.angles);
            #/
            entity unlink();
            var_214d924f4e137244.var_2b16b22ac076fda4 = undefined;
            var_214d924f4e137244.linkedent = undefined;
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6056
// Size: 0x1b9
function private function_9745e01cedd81c85(var_bae27d121b581202, var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    var_698da5af57b757e7 = function_53c4c53197386572(var_698da5af57b757e7, var_214d924f4e137244.var_568f62a24b19c46d.var_49a7f73f0fb5f6cf);
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectFirstFrame");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_9745e01cedd81c85) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_bae27d121b581202, var_698da5af57b757e7);
    } else {
        if (!isdefined(var_214d924f4e137244.entity)) {
            return;
        }
        var_7535cec6dfd38a5e = var_214d924f4e137244.var_9be58c68789faf5c function_79edcc9987330a2a(var_698da5af57b757e7);
        if (var_7535cec6dfd38a5e.size != 0) {
            entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
            var_4f3089070d8b1e24 = var_7535cec6dfd38a5e[0];
            if (isent(entity) && entity.model != "") {
                entity stopanimscripted();
                entity.origin = getstartorigin(var_bae27d121b581202.origin, var_bae27d121b581202.angles, var_4f3089070d8b1e24);
                entity.angles = getstartangles(var_bae27d121b581202.origin, var_bae27d121b581202.angles, var_4f3089070d8b1e24);
                entity setanimknob(var_4f3089070d8b1e24, 1, 0, 0);
                entity setanimtime(var_4f3089070d8b1e24, 0);
                entity dontinterpolate();
                /#
                    function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + function_3c8848a3a11b2553(getanimname(var_4f3089070d8b1e24)), entity.origin, entity.angles);
                #/
                /#
                    function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + function_3c8848a3a11b2553(getanimname(var_4f3089070d8b1e24)), var_bae27d121b581202.origin, var_bae27d121b581202.angles);
                #/
            }
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6216
// Size: 0x3d
function private function_744a16ccecd8e4dd() {
    var_214d924f4e137244 = self;
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectCanAnimate");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_744a16ccecd8e4dd) {
        return var_214d924f4e137244 [[ var_9ecbeba68a379903 ]]();
    }
    return 1;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 10, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x625b
// Size: 0x470
function private function_c34fc4bc3e1ecbcb(var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, var_efef5984278284b1) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244.var_41dc93404af773a3 = var_efef5984278284b1;
    var_214d924f4e137244.var_77c99123aefe423b = var_4f3089070d8b1e24;
    var_214d924f4e137244 function_16714fbc8955e6c7(var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, var_efef5984278284b1);
    if (isdefined(var_efef5984278284b1)) {
        var_214d924f4e137244.var_36831a04af11576f[var_efef5984278284b1] = notifystring;
    }
    var_efef5984278284b1 = function_53c4c53197386572(var_efef5984278284b1, "DeltaAnimation");
    var_8cfa75bbd51c5764 = 0;
    if (isent(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity notify("scene_play_anim");
    }
    var_214d924f4e137244 notify("scene_play_anim");
    if (var_efef5984278284b1 == "DeltaAnimation") {
        if (!isent(var_214d924f4e137244.entity)) {
            n_anim_length = getanimlength(var_4f3089070d8b1e24);
            var_214d924f4e137244 utility::waittill_any_timeout_1(n_anim_length, "scene_anim_ended");
            var_214d924f4e137244 function_bf0d14daf3e53248(var_4f3089070d8b1e24, var_efef5984278284b1, notifystring);
            var_214d924f4e137244 function_68056529c69f4097(var_efef5984278284b1, var_698da5af57b757e7, animindex);
            return;
        }
        var_a89553168990773e = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
        if (!isdefined(var_a89553168990773e) || var_a89553168990773e.model == "") {
            var_214d924f4e137244 function_bf0d14daf3e53248(var_4f3089070d8b1e24, var_efef5984278284b1, notifystring);
            var_214d924f4e137244 function_68056529c69f4097(var_efef5984278284b1, var_698da5af57b757e7, animindex);
            return;
        }
        if (var_214d924f4e137244.var_9be58c68789faf5c function_84eff20f9e29c7f6(var_698da5af57b757e7)) {
            function_e4fc30ccdca08b9d(var_bae27d121b581202);
            var_214d924f4e137244 function_9745e01cedd81c85(var_214d924f4e137244.var_bae27d121b581202, var_698da5af57b757e7);
            var_214d924f4e137244 function_bf0d14daf3e53248(var_4f3089070d8b1e24, var_efef5984278284b1, notifystring);
            var_214d924f4e137244 function_68056529c69f4097(var_efef5984278284b1, var_698da5af57b757e7, animindex);
            return;
        }
        var_214d924f4e137244.entity endon("death_or_disconnect");
        var_a89553168990773e endon("death_or_disconnect");
        var_214d924f4e137244 thread object_play_anim_waittill_end(var_4f3089070d8b1e24, [0:var_214d924f4e137244.entity, 1:var_a89553168990773e], "death_or_disconnect", var_efef5984278284b1, notifystring);
        /#
            var_69a45793029b3bb7 = function_3c8848a3a11b2553(getanimname(var_4f3089070d8b1e24));
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_69a45793029b3bb7, var_bae27d121b581202.origin, var_bae27d121b581202.angles);
        #/
        var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectPlayAnim");
        if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_c34fc4bc3e1ecbcb) {
            var_8cfa75bbd51c5764 = var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime);
        }
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_69a45793029b3bb7, var_bae27d121b581202.origin, var_bae27d121b581202.angles);
        #/
    } else if (var_efef5984278284b1 == "CameraAnimation") {
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_4f3089070d8b1e24, var_bae27d121b581202.origin, var_bae27d121b581202.angles);
        #/
        var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectPlayAnim");
        if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_c34fc4bc3e1ecbcb) {
            var_8cfa75bbd51c5764 = var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime);
        }
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_4f3089070d8b1e24, var_bae27d121b581202.origin, var_bae27d121b581202.angles);
        #/
    } else if (var_efef5984278284b1 == "MayhemAnimation") {
        if (var_214d924f4e137244.var_9be58c68789faf5c function_84eff20f9e29c7f6(var_698da5af57b757e7)) {
            function_e4fc30ccdca08b9d(var_bae27d121b581202);
            var_214d924f4e137244 function_9745e01cedd81c85(var_214d924f4e137244.var_bae27d121b581202);
            var_214d924f4e137244 function_bf0d14daf3e53248(var_4f3089070d8b1e24, var_efef5984278284b1, notifystring);
            var_214d924f4e137244 function_68056529c69f4097(var_efef5984278284b1, var_698da5af57b757e7, animindex);
            return;
        }
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_4f3089070d8b1e24, var_bae27d121b581202.origin, var_bae27d121b581202.angles);
        #/
        var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectPlayAnim");
        if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_c34fc4bc3e1ecbcb) {
            var_8cfa75bbd51c5764 = var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime);
        }
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_4f3089070d8b1e24, var_bae27d121b581202.origin, var_bae27d121b581202.angles);
        #/
    }
    var_214d924f4e137244 function_bf0d14daf3e53248(var_4f3089070d8b1e24, var_efef5984278284b1, notifystring);
    var_214d924f4e137244 function_68056529c69f4097(var_efef5984278284b1, var_698da5af57b757e7, animindex);
    return var_8cfa75bbd51c5764;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x66d3
// Size: 0x9d
function private object_play_anim_waittill_end(var_4f3089070d8b1e24, var_23a35a13a8548fe6, var_b0fddb86a2358953, var_efef5984278284b1, notifystring) {
    var_214d924f4e137244 = self;
    if (isdefined(var_4f3089070d8b1e24) && is_equal(var_efef5984278284b1, "DeltaAnimation")) {
        suffix = function_f28fd66285fa2c9(getanimname(var_4f3089070d8b1e24));
    } else {
        suffix = "";
    }
    var_214d924f4e137244 notify("object_play_anim_waittill_end" + suffix);
    var_214d924f4e137244 endon("object_play_anim_waittill_end" + suffix);
    waittill_any_ents_array(var_23a35a13a8548fe6, var_b0fddb86a2358953);
    if (isdefined(var_214d924f4e137244)) {
        var_214d924f4e137244 thread function_bf0d14daf3e53248(var_4f3089070d8b1e24, var_efef5984278284b1, notifystring);
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6777
// Size: 0x18e
function private function_bf0d14daf3e53248(var_4f3089070d8b1e24, var_efef5984278284b1, notifystring) {
    var_214d924f4e137244 = self;
    if (isdefined(var_4f3089070d8b1e24) && is_equal(var_efef5984278284b1, "DeltaAnimation")) {
        suffix = function_f28fd66285fa2c9(getanimname(var_4f3089070d8b1e24));
    } else {
        suffix = "";
    }
    var_214d924f4e137244 notify("object_play_anim_waittill_end" + suffix);
    ended = 0;
    if (isdefined(var_214d924f4e137244.var_36831a04af11576f)) {
        foreach (var_41dc93404af773a3, var_70062678dc72b66f in var_214d924f4e137244.var_36831a04af11576f) {
            if (!isdefined(var_efef5984278284b1) || var_efef5984278284b1 == var_41dc93404af773a3) {
                if (!isdefined(notifystring) || notifystring == var_70062678dc72b66f) {
                    var_214d924f4e137244 notify(var_70062678dc72b66f, "end");
                    ended = 1;
                }
            }
        }
    }
    if (ended) {
        if (isdefined(var_efef5984278284b1)) {
            var_214d924f4e137244.var_36831a04af11576f[var_efef5984278284b1] = undefined;
        } else {
            var_214d924f4e137244.var_36831a04af11576f = undefined;
        }
    }
    if (!isdefined(var_4f3089070d8b1e24) || isdefined(var_214d924f4e137244.var_41dc93404af773a3) && var_214d924f4e137244.var_41dc93404af773a3 == var_efef5984278284b1 && is_equal(var_214d924f4e137244.var_77c99123aefe423b, var_4f3089070d8b1e24)) {
        var_214d924f4e137244.var_77c99123aefe423b = undefined;
        var_214d924f4e137244.var_41dc93404af773a3 = undefined;
        var_214d924f4e137244.var_53c962747bd1f2f = undefined;
    }
    var_214d924f4e137244 notify("scene_anim_ended");
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x690c
// Size: 0x80
function private function_8e9f8e1fbe2b7ab4(notifystring, var_4f3089070d8b1e24) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 childthread function_924dc6425bd2b70d(notifystring);
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectWaitNotes");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_8e9f8e1fbe2b7ab4) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](notifystring, var_4f3089070d8b1e24);
    } else {
        entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
        if (isdefined(entity)) {
            var_214d924f4e137244 childthread start_notetrack_wait(entity, notifystring, undefined, undefined, var_4f3089070d8b1e24);
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6993
// Size: 0xf5
function private function_9605363169f7b770(var_bae27d121b581202, var_4f3089070d8b1e24, notifystring, var_866b3a3066122e39, var_1cbffacca2bd0d4c, var_efef5984278284b1) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    if (var_efef5984278284b1 == "DeltaAnimation") {
        var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectSkipAnim");
        if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_9605363169f7b770) {
            var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, var_1cbffacca2bd0d4c);
        } else if (isdefined(entity) && entity.model != "") {
            entity animscripted(notifystring, var_bae27d121b581202.origin, var_bae27d121b581202.angles, var_4f3089070d8b1e24);
            entity setanimtime(var_4f3089070d8b1e24, var_866b3a3066122e39);
            if (!(function_8581f011ce975a6(var_4f3089070d8b1e24) && var_1cbffacca2bd0d4c == 1)) {
                entity setanimtime(var_4f3089070d8b1e24, var_1cbffacca2bd0d4c);
            }
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6a8f
// Size: 0x18d
function private function_924dc6425bd2b70d(notifystring, var_d091096ced443a73) {
    var_214d924f4e137244 = self;
    var_aadf0dea942accd5 = var_214d924f4e137244.var_5aaf7c7163c04623.var_aadf0dea942accd5;
    if (!isdefined(var_aadf0dea942accd5) || !isdefined(var_aadf0dea942accd5.notifies)) {
        return;
    }
    var_c311f4d2b460f074 = var_214d924f4e137244.var_9be58c68789faf5c function_c77857d663e8cfbe();
    var_982109bda19f3517 = var_214d924f4e137244.var_9be58c68789faf5c function_aeb2b46911a5811d();
    notifies = [];
    var_e0068a37b92d6b2 = [0:var_982109bda19f3517, 1:var_c311f4d2b460f074, 2:"_object_all_"];
    foreach (tablename in var_e0068a37b92d6b2) {
        if (isdefined(var_aadf0dea942accd5.notifies[tablename])) {
            notifies = array_combine(notifies, var_aadf0dea942accd5.notifies[tablename]);
        }
    }
    foreach (var_80ba00b3669e6f07 in notifies) {
        if (!isdefined(var_d091096ced443a73) || var_d091096ced443a73 == var_80ba00b3669e6f07) {
            var_214d924f4e137244 thread function_c9fbe2a0f09e68b0(notifystring, var_80ba00b3669e6f07);
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6c23
// Size: 0x42
function private function_c9fbe2a0f09e68b0(notifystring, var_80ba00b3669e6f07) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    if (isdefined(entity)) {
        entity function_5ecd1fd13181af98(notifystring, var_80ba00b3669e6f07, var_214d924f4e137244);
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6c6c
// Size: 0x1aa
function private object_shot_death_wait(var_568f62a24b19c46d, var_698da5af57b757e7, var_56f4af8746a2d458) {
    var_214d924f4e137244 = self;
    var_5aaf7c7163c04623 = var_214d924f4e137244.var_5aaf7c7163c04623;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_214d924f4e137244 notify("object_shot_death_wait");
    var_214d924f4e137244 endon("object_shot_death_wait");
    deathanim = var_214d924f4e137244.var_9be58c68789faf5c function_f731c1198ec2b72f(var_698da5af57b757e7);
    var_fe3c33d4dd6936af = var_214d924f4e137244.var_9be58c68789faf5c function_becdf44d08cc1faf();
    if (!var_fe3c33d4dd6936af && !isdefined(deathanim)) {
        return;
    }
    var_568f62a24b19c46d endon("scene_shot_cleanup");
    entity = var_214d924f4e137244.entity;
    if (isalive(entity)) {
        entity val::set("scene_shot", "death", 0);
        while (entity.health > 1) {
            entity waittill("damage");
        }
        if (var_fe3c33d4dd6936af) {
            var_5aaf7c7163c04623 thread stop();
        }
        if (isdefined(entity) && isdefined(deathanim)) {
            var_73147aa08912a797 = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
            if (isdefined(var_73147aa08912a797)) {
                animtype = var_214d924f4e137244.var_9be58c68789faf5c function_92192185fc7c5500();
                notifystring = var_214d924f4e137244.var_36831a04af11576f[animtype];
                var_214d924f4e137244.var_36831a04af11576f[animtype] = undefined;
                var_214d924f4e137244 function_c34fc4bc3e1ecbcb(var_698da5af57b757e7, -1, notifystring, var_214d924f4e137244.var_bae27d121b581202, deathanim);
            }
        }
        entity val::set("scene_shot", "death", 1);
        var_214d924f4e137244 function_16bf7d1ae7273583();
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6e1d
// Size: 0x58
function private function_9c0d01ef917ee30(var_4f3089070d8b1e24, var_efef5984278284b1) {
    switch (var_efef5984278284b1) {
    case #"hash_db2a102a7b3b4349":
        return getanimlength(var_4f3089070d8b1e24);
    case #"hash_3c9daf4fd5203d1c":
        return function_c55e2627715b3a72(var_4f3089070d8b1e24);
    case #"hash_eb9c9817350b0b1e":
        break;
    }
    return 0;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6e7d
// Size: 0xca
function private function_bdd631983c9e6f5c() {
    var_214d924f4e137244 = self;
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectAnimEnd");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_bdd631983c9e6f5c) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]]();
    } else if (isdefined(var_214d924f4e137244.entity) && isdefined(var_214d924f4e137244.var_36831a04af11576f)) {
        foreach (message in var_214d924f4e137244.var_36831a04af11576f) {
            var_214d924f4e137244.entity notify(message, "end");
        }
    }
    var_214d924f4e137244.var_36831a04af11576f = undefined;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6f4e
// Size: 0x10c
function private function_9b8055c613f1bb31() {
    var_214d924f4e137244 = self;
    /#
        if (isdefined(var_214d924f4e137244.entity)) {
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>", var_214d924f4e137244.entity.origin, var_214d924f4e137244.entity.angles);
        }
    #/
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectStopAnim");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_9b8055c613f1bb31) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]]();
    } else if (isdefined(var_214d924f4e137244.entity) && isdefined(var_214d924f4e137244.var_41dc93404af773a3) && var_214d924f4e137244.var_41dc93404af773a3 == "DeltaAnimation") {
        var_214d924f4e137244.entity stopanimscripted();
    }
    var_214d924f4e137244.var_41dc93404af773a3 = undefined;
    var_214d924f4e137244.var_77c99123aefe423b = undefined;
    var_214d924f4e137244.var_a3ff79ae166c57aa = var_214d924f4e137244.var_53c962747bd1f2f;
    var_214d924f4e137244.var_53c962747bd1f2f = undefined;
    var_214d924f4e137244 function_bf0d14daf3e53248();
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7061
// Size: 0x122
function private function_37e4ff5a9807c7d5(var_fa1af9d2277fd747) {
    var_214d924f4e137244 = self;
    if (istrue(var_214d924f4e137244.issetup)) {
        var_214d924f4e137244 function_535e6f4c06c15b1d(undefined, 0, 0, var_214d924f4e137244.var_bae27d121b581202);
        var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectCleanup");
        if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_37e4ff5a9807c7d5) {
            var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_fa1af9d2277fd747);
        }
        if (isdefined(var_214d924f4e137244.entity)) {
            var_214d924f4e137244.entity val::function_c9d0b43701bdba00("scene_scene");
            var_214d924f4e137244.entity ent_flag_clear("scene_active");
            var_214d924f4e137244.entity.var_214d924f4e137244 = undefined;
            var_214d924f4e137244 function_729a3f3943f35748(undefined, undefined);
            if (isdefined(var_214d924f4e137244.var_f143eb748d8b5556)) {
                var_214d924f4e137244.entity.dontmelee = var_214d924f4e137244.var_f143eb748d8b5556;
            }
        }
        var_214d924f4e137244 notify("scene_ai_stealth");
        if (!isdefined(var_fa1af9d2277fd747) && var_214d924f4e137244 function_cdec4d1452eba0d8()) {
            var_214d924f4e137244 function_746341289f892160();
        }
        var_214d924f4e137244.issetup = undefined;
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x718a
// Size: 0x82
function private function_cdec4d1452eba0d8() {
    var_214d924f4e137244 = self;
    var_7a28050da4d92ad6 = var_214d924f4e137244.var_9be58c68789faf5c function_d5f4474a16f90132();
    DeleteAlways = var_7a28050da4d92ad6 == "DeleteAlways" || var_7a28050da4d92ad6 == "DeleteAlwaysNotInvolved";
    DeleteSpawned = (var_7a28050da4d92ad6 == "DeleteSpawned" || var_7a28050da4d92ad6 == "DeleteSpawnedNotInvolved") && !istrue(var_214d924f4e137244.var_423f55edd900883);
    if (DeleteAlways || DeleteSpawned) {
        return 1;
    }
    return 0;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7214
// Size: 0x62
function private function_16bf7d1ae7273583() {
    var_214d924f4e137244 = self;
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectKill");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_16bf7d1ae7273583) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]]();
    } else if (isalive(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity kill();
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x727d
// Size: 0xcf
function private function_746341289f892160() {
    var_214d924f4e137244 = self;
    /#
        if (isdefined(var_214d924f4e137244.entity)) {
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>", var_214d924f4e137244.entity.origin, var_214d924f4e137244.entity.angles);
        }
    #/
    namespace_c5f7e08ad7ea4280::function_b6e23e71bb7ad50f(var_214d924f4e137244.entity);
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectDelete");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_746341289f892160) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]]();
    } else if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity delete();
    }
    var_214d924f4e137244.entity = undefined;
    var_214d924f4e137244.var_423f55edd900883 = undefined;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7353
// Size: 0x4d
function private function_2f2327d535ed0bb() {
    var_214d924f4e137244 = self;
    if (istrue(var_214d924f4e137244.var_e32ce590a15666ec)) {
        if (isplayer(var_214d924f4e137244.entity)) {
            var_214d924f4e137244.entity function_8ff8fd7841f6eba2();
        }
        var_214d924f4e137244.var_e32ce590a15666ec = undefined;
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x73a7
// Size: 0x340
function private function_b62972e8f5541b26(var_568f62a24b19c46d, var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectPreStream");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_b62972e8f5541b26) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_568f62a24b19c46d, var_698da5af57b757e7);
    }
    var_214d924f4e137244 function_e4fc30ccdca08b9d(var_214d924f4e137244.var_bae27d121b581202);
    if (isdefined(var_214d924f4e137244.var_bae27d121b581202)) {
        CameraAnimation = var_214d924f4e137244 function_6c3d100538f590b3(var_698da5af57b757e7);
        var_7535cec6dfd38a5e = var_214d924f4e137244.var_9be58c68789faf5c function_79edcc9987330a2a(var_698da5af57b757e7);
        if (isplayer(var_214d924f4e137244.entity)) {
            player = var_214d924f4e137244.entity;
            var_a9b43fd80025b224 = undefined;
            if (isdefined(CameraAnimation)) {
                var_a9b43fd80025b224 = player function_c5106bdaced133ab(CameraAnimation, 0, 0, var_214d924f4e137244.var_bae27d121b581202.origin, var_214d924f4e137244.var_bae27d121b581202.angles);
            } else if (isdefined(var_7535cec6dfd38a5e) && var_7535cec6dfd38a5e.size > 0) {
                linktag = var_214d924f4e137244 function_a89f1262c5148bdf();
                var_73147aa08912a797 = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
                offset = (0, 0, player getplayerviewheight());
                if (isdefined(var_73147aa08912a797)) {
                    var_742d65eb48a1aafd = var_73147aa08912a797 function_d2e8597ff01310ed(var_7535cec6dfd38a5e[0], linktag, 0, var_214d924f4e137244.var_bae27d121b581202.origin, var_214d924f4e137244.var_bae27d121b581202.angles);
                    if (isdefined(var_742d65eb48a1aafd)) {
                        var_a9b43fd80025b224 = var_742d65eb48a1aafd["origin"];
                        offset = rotatevector(offset, var_742d65eb48a1aafd["angles"]);
                    }
                }
                if (!isdefined(var_a9b43fd80025b224)) {
                    var_a9b43fd80025b224 = getstartorigin(var_214d924f4e137244.var_bae27d121b581202.origin, var_214d924f4e137244.var_bae27d121b581202.angles, var_7535cec6dfd38a5e[0]);
                }
                if (!is_equal(linktag, "tag_camera")) {
                    var_a9b43fd80025b224 = var_a9b43fd80025b224 + offset;
                }
            }
            if (isdefined(var_a9b43fd80025b224)) {
                /#
                    function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>", var_a9b43fd80025b224, (0, 0, 0));
                #/
                var_ad63323b4b7fde00 = var_568f62a24b19c46d function_317afd3b93b0b54d(player, var_a9b43fd80025b224);
            }
        }
        if (isdefined(var_7535cec6dfd38a5e) && var_7535cec6dfd38a5e.size > 0) {
            entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
            if (isdefined(entity)) {
                if (var_214d924f4e137244 function_7f90ebd0aa7ad958(var_698da5af57b757e7)) {
                    var_5e111665d158be18 = getstartorigin(var_214d924f4e137244.var_bae27d121b581202.origin, var_214d924f4e137244.var_bae27d121b581202.angles, var_7535cec6dfd38a5e[0]);
                } else {
                    var_5e111665d158be18 = var_214d924f4e137244.var_bae27d121b581202.origin;
                }
                var_428335b47172b26e = spawnstruct();
                var_428335b47172b26e.origin = var_5e111665d158be18;
                var_428335b47172b26e.entity = entity;
                var_568f62a24b19c46d.var_868bf033439639da.objects[var_568f62a24b19c46d.var_868bf033439639da.objects.size] = var_428335b47172b26e;
            }
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x76ee
// Size: 0xc8
function private function_d4dcec93a1db6e3f(var_568f62a24b19c46d, var_698da5af57b757e7, var_56f4af8746a2d458) {
    var_214d924f4e137244 = self;
    var_568f62a24b19c46d endon("scene_stop");
    var_214d924f4e137244 endon("scene_stop");
    foreach (message in var_214d924f4e137244.var_36831a04af11576f) {
        var_214d924f4e137244 endon(message);
    }
    var_214d924f4e137244 childthread object_shot_death_wait(var_568f62a24b19c46d, var_698da5af57b757e7, var_56f4af8746a2d458);
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectPrepare");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_d4dcec93a1db6e3f) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_568f62a24b19c46d, var_698da5af57b757e7, var_56f4af8746a2d458);
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x77bd
// Size: 0x245
function private function_770c0b047ce9cfc1(var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        if (var_214d924f4e137244.var_9be58c68789faf5c function_7a553773a0af8bcd(var_698da5af57b757e7)) {
            var_214d924f4e137244.entity val::set("scene_scene", "hide", 1);
            var_214d924f4e137244.entity val::set("scene_scene", "ignoreall", 1);
            var_214d924f4e137244.entity val::set("scene_scene", "ignoreme", 1);
        }
        if (var_214d924f4e137244.var_9be58c68789faf5c function_8ed9853e35162b7c(var_698da5af57b757e7)) {
            var_214d924f4e137244.entity val::reset("scene_scene", "hide");
            var_214d924f4e137244.entity show();
            var_214d924f4e137244.entity val::reset("scene_scene", "ignoreall");
            var_214d924f4e137244.entity val::reset("scene_scene", "ignoreme");
        }
        if (!var_214d924f4e137244.var_9be58c68789faf5c function_fc9281240877df76()) {
            var_214d924f4e137244.entity val::set("scene_shot", "damage", 0);
        }
        if (isplayer(var_214d924f4e137244.entity)) {
            var_8ed8d60ce0091e17 = var_214d924f4e137244.var_9be58c68789faf5c function_6cf39bfd67cda93a(var_698da5af57b757e7);
            if (var_8ed8d60ce0091e17 > 0) {
                var_4d216f633a458d65 = var_214d924f4e137244.var_9be58c68789faf5c function_a8485c8c63aa2cc3(var_698da5af57b757e7);
                var_8ff8fd7841f6eba2 = var_214d924f4e137244.var_9be58c68789faf5c function_4040a1e0bb19e02f(var_698da5af57b757e7);
                /#
                    function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_214d924f4e137244.entity getentitynumber(), var_214d924f4e137244.entity.origin, var_214d924f4e137244.entity.angles);
                #/
                var_214d924f4e137244.entity function_bb60d8e77392c74e(0, var_8ed8d60ce0091e17, !istrue(var_4d216f633a458d65), var_8ff8fd7841f6eba2);
            }
        }
    }
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectSetup");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_770c0b047ce9cfc1) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_698da5af57b757e7);
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7a09
// Size: 0x47
function private function_d82945c5509ec28e(var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectLinkSetup");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_d82945c5509ec28e) {
        return var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_698da5af57b757e7);
    }
    return 1;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7a58
// Size: 0x170
function private function_a477eb91dc3b38b8(var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity val::function_c9d0b43701bdba00("scene_shot");
        if (isplayer(var_214d924f4e137244.entity)) {
            var_89d01150f6ea37bc = var_214d924f4e137244.var_9be58c68789faf5c function_be64404b86d48153(var_698da5af57b757e7);
            if (var_89d01150f6ea37bc > 0) {
                var_4d216f633a458d65 = var_214d924f4e137244.var_9be58c68789faf5c function_c5c4ac51272db146(var_698da5af57b757e7);
                var_8ff8fd7841f6eba2 = var_214d924f4e137244.var_9be58c68789faf5c function_51bd4cd630963c3a(var_698da5af57b757e7);
                /#
                    function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_214d924f4e137244.entity getentitynumber(), var_214d924f4e137244.entity.origin, var_214d924f4e137244.entity.angles);
                #/
                var_214d924f4e137244.entity function_bb60d8e77392c74e(1, var_89d01150f6ea37bc, !istrue(var_4d216f633a458d65), var_8ff8fd7841f6eba2);
            }
        }
    }
    if (isent(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity notify("scene_shot_cleanup");
    }
    var_214d924f4e137244 notify("scene_shot_cleanup");
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectCleanup");
    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_a477eb91dc3b38b8) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_698da5af57b757e7);
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7bcf
// Size: 0x6e
function private function_6c3d100538f590b3(var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    var_9be58c68789faf5c = var_214d924f4e137244.var_9be58c68789faf5c;
    CameraAnimation = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7].CameraAnimation;
    if (isdefined(CameraAnimation) && CameraAnimation == "") {
        CameraAnimation = undefined;
    }
    return CameraAnimation;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7c45
// Size: 0x69
function private function_7f90ebd0aa7ad958(var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    var_9be58c68789faf5c = var_214d924f4e137244.var_9be58c68789faf5c;
    var_f403b8bef0c4a943 = var_9be58c68789faf5c function_1d5820595bc2d310(var_698da5af57b757e7);
    var_badc9307ea231fbe = !istrue(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_adbd47886f23e1a2);
    return var_f403b8bef0c4a943 && var_badc9307ea231fbe;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7cb6
// Size: 0xff
function private function_b4d836fe99f480e(var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    var_9be58c68789faf5c = var_214d924f4e137244.var_9be58c68789faf5c;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    var_80db383140a106e8 = istrue(var_907051501530beee.removeweapon);
    var_1dc8da8f86fd9a5b = istrue(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.removeweapon);
    var_62df8bf2c6dd7fc6 = undefined;
    if (isplayer(var_214d924f4e137244.entity) || !isdefined(var_214d924f4e137244.entity)) {
        var_62df8bf2c6dd7fc6 = 1;
    } else {
        var_a716ae8a2112647b = var_214d924f4e137244.entity.weapon;
        var_62df8bf2c6dd7fc6 = isdefined(var_a716ae8a2112647b) && !isnullweapon(var_a716ae8a2112647b);
    }
    if ((var_80db383140a106e8 || var_1dc8da8f86fd9a5b) && var_62df8bf2c6dd7fc6) {
        return 1;
    }
    return 0;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7dbd
// Size: 0x79
function private function_5a65e42126f29a4f(var_698da5af57b757e7, var_816ed2eb8fd78e89, var_17b73aa1820974ee) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244.var_75cefc53f51fa896 = function_53c4c53197386572(var_214d924f4e137244.var_75cefc53f51fa896, []);
    var_214d924f4e137244.var_75cefc53f51fa896[var_816ed2eb8fd78e89] = function_53c4c53197386572(var_214d924f4e137244.var_75cefc53f51fa896[var_816ed2eb8fd78e89], []);
    var_214d924f4e137244.var_75cefc53f51fa896[var_816ed2eb8fd78e89][var_698da5af57b757e7] = var_17b73aa1820974ee;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7e3d
// Size: 0x62
function private function_a680ab1ba5753613(var_698da5af57b757e7, var_816ed2eb8fd78e89) {
    var_214d924f4e137244 = self;
    /#
        assert(isint(var_698da5af57b757e7));
    #/
    if (!isdefined(var_214d924f4e137244.var_75cefc53f51fa896)) {
        return undefined;
    }
    if (!isdefined(var_214d924f4e137244.var_75cefc53f51fa896[var_816ed2eb8fd78e89])) {
        return undefined;
    }
    return var_214d924f4e137244.var_75cefc53f51fa896[var_816ed2eb8fd78e89][var_698da5af57b757e7];
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ea7
// Size: 0x284
function private function_225d78e3c485a7ae(var_51d2f645ad8afdaf, var_568f62a24b19c46d, var_56f4af8746a2d458) {
    var_214d924f4e137244 = self;
    var_84b542bb7490bea7 = var_214d924f4e137244.var_84b542bb7490bea7;
    var_aadf0dea942accd5 = var_214d924f4e137244.var_5aaf7c7163c04623.var_aadf0dea942accd5;
    if (var_214d924f4e137244.var_9be58c68789faf5c function_cb6926d352c405c7()) {
        return 0;
    }
    if (isdefined(var_aadf0dea942accd5) && istrue(var_aadf0dea942accd5.var_94564218dd6125b9) && var_214d924f4e137244 function_acef03c7ed4a3f86() == "Types_Player") {
        return 0;
    }
    if (isdefined(var_aadf0dea942accd5) && isdefined(var_aadf0dea942accd5.var_8f28f8f196c70a58) && var_aadf0dea942accd5.var_8f28f8f196c70a58 && var_214d924f4e137244 function_acef03c7ed4a3f86() != "Types_Player") {
        return 0;
    }
    if (!isarray(var_51d2f645ad8afdaf)) {
        var_51d2f645ad8afdaf = [0:var_51d2f645ad8afdaf];
    }
    result = 0;
    foreach (var_698da5af57b757e7 in var_51d2f645ad8afdaf) {
        var_e66c7d5aef34cca4 = var_214d924f4e137244.var_9be58c68789faf5c function_7a553773a0af8bcd(var_698da5af57b757e7);
        var_3bd1d9598df623dd = var_214d924f4e137244.var_9be58c68789faf5c function_8ed9853e35162b7c(var_698da5af57b757e7);
        animated = var_214d924f4e137244.var_9be58c68789faf5c function_938cdb6ca25882fc(var_698da5af57b757e7);
        if (!animated || var_e66c7d5aef34cca4 || var_3bd1d9598df623dd) {
            if (isdefined(var_568f62a24b19c46d) && isdefined(var_56f4af8746a2d458)) {
                if (!isdefined(var_568f62a24b19c46d.var_7038c2a13f1f5db8[var_56f4af8746a2d458])) {
                    var_568f62a24b19c46d.var_7038c2a13f1f5db8[var_56f4af8746a2d458] = [];
                }
                var_568f62a24b19c46d.var_7038c2a13f1f5db8[var_56f4af8746a2d458][var_698da5af57b757e7] = 1;
                result = 1;
            } else {
                return 1;
            }
        } else {
            var_7535cec6dfd38a5e = var_214d924f4e137244.var_9be58c68789faf5c function_79edcc9987330a2a(var_698da5af57b757e7);
            CameraAnimation = var_214d924f4e137244 function_6c3d100538f590b3(var_698da5af57b757e7);
            if (var_7535cec6dfd38a5e.size != 0 || isdefined(CameraAnimation)) {
                if (isdefined(var_568f62a24b19c46d) && isdefined(var_56f4af8746a2d458)) {
                    if (!isdefined(var_568f62a24b19c46d.var_7038c2a13f1f5db8[var_56f4af8746a2d458])) {
                        var_568f62a24b19c46d.var_7038c2a13f1f5db8[var_56f4af8746a2d458] = [];
                    }
                    var_568f62a24b19c46d.var_7038c2a13f1f5db8[var_56f4af8746a2d458][var_698da5af57b757e7] = 1;
                    result = 1;
                } else {
                    return 1;
                }
            }
        }
    }
    return result;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8133
// Size: 0x20
function private function_acef03c7ed4a3f86() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244.var_9be58c68789faf5c function_c77857d663e8cfbe();
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x815b
// Size: 0xc
function private function_c77857d663e8cfbe() {
    return self.variant_type;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x816f
// Size: 0x37
function private function_92192185fc7c5500() {
    var_9be58c68789faf5c = self;
    animtype = "DeltaAnimation";
    if (var_9be58c68789faf5c function_c77857d663e8cfbe() == "Types_Mayhem") {
        animtype = "MayhemAnimation";
    }
    return animtype;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x81ae
// Size: 0xaf
function private function_992de34e05c5cea7() {
    var_9be58c68789faf5c = self;
    if (isdefined(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_39a06a790caf5608)) {
        return "aitype";
    }
    if (isdefined(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_e4024bd5bbbd291f)) {
        return "character";
    }
    if (isdefined(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.vehiclename)) {
        return "vehicle";
    }
    if (isdefined(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_2d53850266558c60)) {
        return "xcompositemodel";
    }
    if (isdefined(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_4f08e017049ad3cb)) {
        return "xmodel";
    }
    return "mayhem";
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8265
// Size: 0xe0
function private function_12eb9fd56334261c() {
    var_9be58c68789faf5c = self;
    if (isdefined(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_39a06a790caf5608)) {
        return var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_39a06a790caf5608;
    }
    if (isdefined(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_e4024bd5bbbd291f)) {
        return var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_e4024bd5bbbd291f;
    }
    if (isdefined(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.vehiclename)) {
        return var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.vehiclename;
    }
    if (isdefined(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_2d53850266558c60)) {
        return var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_2d53850266558c60;
    }
    return var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_4f08e017049ad3cb;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x834d
// Size: 0x24
function private function_aeb2b46911a5811d() {
    var_9be58c68789faf5c = self;
    return var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.name;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8379
// Size: 0x25
function private function_83ba0b38ef7f3949() {
    var_9be58c68789faf5c = self;
    return istrue(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.firstframe);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x83a6
// Size: 0x4c
function private function_84eff20f9e29c7f6(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return isdefined(var_907051501530beee) && istrue(var_907051501530beee.var_8816c61903e94b90);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x83fa
// Size: 0x25
function private function_cb6926d352c405c7() {
    var_9be58c68789faf5c = self;
    return istrue(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.disabled);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8427
// Size: 0x2f
function private function_d5f4474a16f90132() {
    var_9be58c68789faf5c = self;
    return function_53c4c53197386572(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_7a28050da4d92ad6, "None");
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x845e
// Size: 0x2f
function private function_b5a77eb340ad5552() {
    var_9be58c68789faf5c = self;
    return function_53c4c53197386572(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_2573726c1f53219a, "None");
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8495
// Size: 0x25
function private function_fc9281240877df76() {
    var_9be58c68789faf5c = self;
    return istrue(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.takedamage);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x84c2
// Size: 0x25
function private function_becdf44d08cc1faf() {
    var_9be58c68789faf5c = self;
    return istrue(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_6da5cfc338f95f28);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x84ef
// Size: 0x49
function private function_c106523f3836b90b() {
    var_9be58c68789faf5c = self;
    if (isdefined(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.animtree)) {
        return var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.animtree.id;
    }
    return undefined;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8540
// Size: 0x25
function private function_d301ab09c0738edf() {
    var_9be58c68789faf5c = self;
    return istrue(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_eb6d97710680539f);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x856d
// Size: 0x10c
function private function_79edcc9987330a2a(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    animations = [];
    objtype = var_9be58c68789faf5c function_c77857d663e8cfbe();
    switch (objtype) {
    case #"hash_873689dd62a87ffa":
        var_7535cec6dfd38a5e = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7].var_e608c28a92676233;
        if (isdefined(var_7535cec6dfd38a5e)) {
            for (var_6dba2c33a7be786f = 0; var_6dba2c33a7be786f < var_7535cec6dfd38a5e.size; var_6dba2c33a7be786f++) {
                animations[var_6dba2c33a7be786f] = var_7535cec6dfd38a5e[var_6dba2c33a7be786f].MayhemAnimation;
            }
        }
        break;
    default:
        var_7535cec6dfd38a5e = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7].var_45d86f20e184e36a;
        if (isdefined(var_7535cec6dfd38a5e)) {
            for (var_6dba2c33a7be786f = 0; var_6dba2c33a7be786f < var_7535cec6dfd38a5e.size; var_6dba2c33a7be786f++) {
                animations[var_6dba2c33a7be786f] = var_7535cec6dfd38a5e[var_6dba2c33a7be786f].DeltaAnimation.id;
            }
        }
        break;
    }
    return animations;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8681
// Size: 0x1b0
function private function_698798987ca7073(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_6fa3785720b3cfae = [];
    objtype = var_9be58c68789faf5c function_c77857d663e8cfbe();
    if (var_698da5af57b757e7 < 0 || var_698da5af57b757e7 > var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots.size - 1) {
        return var_6fa3785720b3cfae;
    }
    switch (objtype) {
    case #"hash_873689dd62a87ffa":
        var_7535cec6dfd38a5e = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7].var_e608c28a92676233;
        if (isdefined(var_7535cec6dfd38a5e)) {
            var_f2a3d133905a28a0 = var_7535cec6dfd38a5e.size;
            for (var_6dba2c33a7be786f = 0; var_6dba2c33a7be786f < var_f2a3d133905a28a0; var_6dba2c33a7be786f++) {
                var_6fa3785720b3cfae[var_6dba2c33a7be786f] = 0;
                if (isdefined(var_7535cec6dfd38a5e[var_6dba2c33a7be786f].framecount) && isdefined(var_7535cec6dfd38a5e[var_6dba2c33a7be786f].var_d8457d2ff5366db0)) {
                    var_6fa3785720b3cfae[var_6dba2c33a7be786f] = var_7535cec6dfd38a5e[var_6dba2c33a7be786f].framecount * 1 / float(var_7535cec6dfd38a5e[var_6dba2c33a7be786f].var_d8457d2ff5366db0);
                }
            }
        }
        break;
    default:
        var_7535cec6dfd38a5e = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7].var_45d86f20e184e36a;
        if (isdefined(var_7535cec6dfd38a5e)) {
            var_f2a3d133905a28a0 = var_7535cec6dfd38a5e.size;
            for (var_6dba2c33a7be786f = 0; var_6dba2c33a7be786f < var_f2a3d133905a28a0; var_6dba2c33a7be786f++) {
                var_6fa3785720b3cfae[var_6dba2c33a7be786f] = 0;
                if (isanimation(var_7535cec6dfd38a5e[var_6dba2c33a7be786f].DeltaAnimation.id)) {
                    var_6fa3785720b3cfae[var_6dba2c33a7be786f] = getanimlength(var_7535cec6dfd38a5e[var_6dba2c33a7be786f].DeltaAnimation.id);
                }
            }
        }
        break;
    }
    return var_6fa3785720b3cfae;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8839
// Size: 0x60
function private function_f731c1198ec2b72f(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    if (isdefined(var_907051501530beee.deathanim)) {
        return var_907051501530beee.deathanim.id;
    }
    return undefined;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88a1
// Size: 0x47
function private function_938cdb6ca25882fc(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return !istrue(var_907051501530beee.var_c60d7dc962b40dab);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88f0
// Size: 0x47
function private function_1d5820595bc2d310(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return !istrue(var_907051501530beee.var_adbd47886f23e1a2);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x893f
// Size: 0x46
function private function_7a553773a0af8bcd(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return istrue(var_907051501530beee.preparehide);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x898d
// Size: 0x46
function private function_8ed9853e35162b7c(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return istrue(var_907051501530beee.prepareshow);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x89db
// Size: 0x50
function private function_1e3ba3c3afdbb7b4(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_95910760d7ab6f46, 0);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a33
// Size: 0x50
function private function_205f7afe5d801664(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_23f6517d33611970, 0.2);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a8b
// Size: 0x50
function private function_167ed32773c7c534(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.blendcurve, "linear");
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8ae3
// Size: 0x46
function private function_2917c4d9acc44d9(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return istrue(var_907051501530beee.lookatplayer);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8b31
// Size: 0x50
function private function_8b6dcfac0d2921ad(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_da79ebe29c84d14c, "Teleport");
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8b89
// Size: 0x50
function private function_ceabc6a1e0fac4cf(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_8695dc19ef4c8376, "Exposed");
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8be1
// Size: 0x50
function private function_1b712c4c79096ef9(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_7db06d4a4c1afffa, "DEFAULT");
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8c39
// Size: 0x50
function private function_b56c0812b975be8(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_d223a5b14195b3ef, "DEFAULT");
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8c91
// Size: 0x50
function private function_8f11c2704d4c19c3(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_b9013c55bc0d035c, "DEFAULT");
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ce9
// Size: 0x50
function private function_d1dd52dc1f43215d(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.weaponuse, "DropQuick");
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8d41
// Size: 0x4d
function private function_fcc766f42b75a322(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_19af0860c5502839, 1);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8d96
// Size: 0x55
function private function_892812e26790e793(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return tolower(function_53c4c53197386572(var_907051501530beee.var_e8d87eef3c44cff2, "stand"));
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8df3
// Size: 0x55
function private function_c3345343cc0eb8ab(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return tolower(function_53c4c53197386572(var_907051501530beee.var_29c3c24d83989b1e, "stand"));
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8e50
// Size: 0x4d
function private function_16b4cb7e4c5af0fd(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_52c388f739467cb0, 45);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ea5
// Size: 0x4d
function private function_918dc2e0c83784b6(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_1f406d98a26a7085, 45);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8efa
// Size: 0x4d
function private function_b06da1547120edef(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_88317c7614e6553c, 15);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8f4f
// Size: 0x4d
function private function_be3310ec58dd9807(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_169ec6c28c4aae8a, 15);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8fa4
// Size: 0x4d
function private function_8851aea907b47f88(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_562ff78798cbfcc8, 1);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8ff9
// Size: 0x46
function private function_20e9c3d094691efe(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return istrue(var_907051501530beee.var_e5b223855538688f);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9047
// Size: 0x50
function private function_b083c5862877c8e3(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_ea65489e6dd7e725, 1);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x909f
// Size: 0x4c
function private function_c2a0ad9229a93162(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_88e69aa15889ab66, 0);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x90f3
// Size: 0x4c
function private function_9be5ff9b4bc5843a(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.nospawn, 0);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9147
// Size: 0x50
function private function_6cf39bfd67cda93a(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_7d63ca25b0117d6e, 0);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x919f
// Size: 0x4d
function private function_a8485c8c63aa2cc3(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_79283a9578fe4900, 1);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x91f4
// Size: 0x4c
function private function_4040a1e0bb19e02f(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_5f517de02c7ca959, 0);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9248
// Size: 0x50
function private function_be64404b86d48153(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.cameratweenout, 0);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x92a0
// Size: 0x4d
function private function_c5c4ac51272db146(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_7ec8d5cf6cd51793, 1);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x92f5
// Size: 0x4c
function private function_51bd4cd630963c3a(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_9d3a8c6c70cf8ae4, 0);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9349
// Size: 0x4c
function private function_f0f9db1f4b0000f4(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_aeced7593e628dce, 0);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x939d
// Size: 0x4c
function private function_cef37972e99fd713(var_698da5af57b757e7) {
    var_9be58c68789faf5c = self;
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_fdbf9e3bd86923cf, 0);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x93f1
// Size: 0xa1
function private function_6acf84052cd5ab1(spawnorigin, spawnangles) {
    var_214d924f4e137244 = self;
    entity = undefined;
    var_373a2c3b02b1d81c = var_214d924f4e137244.var_9be58c68789faf5c function_992de34e05c5cea7();
    var_6fc4d2978cf27bef = var_214d924f4e137244.var_9be58c68789faf5c function_12eb9fd56334261c();
    if (var_373a2c3b02b1d81c == "vehicle") {
        entity = spawnvehicle(function_4feb334351c0c1ca(var_6fc4d2978cf27bef), "scene_system_vehicle", var_6fc4d2978cf27bef, spawnorigin, spawnangles);
        if (isdefined(entity)) {
            entity useanimtree(var_214d924f4e137244.var_9be58c68789faf5c function_c106523f3836b90b());
        }
    }
    return entity;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x949a
// Size: 0x3b
function private function_619f2e5d7f38d9d5(entity) {
    if (entity.classname == "script_vehicle") {
        return 1;
    }
    if (entity.classname == "script_model") {
        return 1;
    }
    return 0;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x94dd
// Size: 0x44
function private function_dec77fd275b35e92(var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    vehicle = var_214d924f4e137244.entity;
    if (isdefined(vehicle) && vehicle vehicle_isphysveh()) {
        vehicle vehphys_forcekeyframedmotion();
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9528
// Size: 0x11d
function private function_69abf08346f3f6d9() {
    scenescriptbundle = self;
    var_bb49a14608f264e3 = scenescriptbundle function_291cd2f1089d3a94();
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_bb49a14608f264e3; var_56f4af8746a2d458++) {
        var_9be58c68789faf5c = scenescriptbundle function_bfc4196d3da11705(var_56f4af8746a2d458);
        var_373a2c3b02b1d81c = var_9be58c68789faf5c function_992de34e05c5cea7();
        var_6fc4d2978cf27bef = var_9be58c68789faf5c function_12eb9fd56334261c();
        if (!isdefined(var_6fc4d2978cf27bef)) {
            continue;
        }
        if (var_373a2c3b02b1d81c == "aitype") {
            continue;
        }
        if (var_373a2c3b02b1d81c == "character") {
            character = function_1823ff50bb28148d(var_6fc4d2978cf27bef);
            if (isdefined(level.var_7d97144daa7995cd) && isdefined(level.var_7d97144daa7995cd[character])) {
                var_c34506cfaa97c45e = level.var_7d97144daa7995cd[character];
                level [[ var_c34506cfaa97c45e ]]();
            }
        } else if (var_373a2c3b02b1d81c == "vehicle") {
            precachevehicle(var_6fc4d2978cf27bef);
            modelname = function_4feb334351c0c1ca(var_6fc4d2978cf27bef);
            if (modelname != "") {
                precachemodel(modelname);
            }
        } else {
            precachemodel(var_6fc4d2978cf27bef);
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x964c
// Size: 0x542
function private function_ab3ec43370c405d2(var_5aaf7c7163c04623, var_698da5af57b757e7, objectindex) {
    scenescriptbundle = self;
    var_bae27d121b581202 = spawnstruct();
    var_bae27d121b581202.aligntarget = undefined;
    var_bae27d121b581202.aligntag = undefined;
    var_bae27d121b581202.var_13352dba0905ac7 = undefined;
    var_bae27d121b581202.var_93cd726eb6096497 = undefined;
    var_bae27d121b581202.originoffset = (0, 0, 0);
    var_bae27d121b581202.anglesoffset = (0, 0, 0);
    var_bae27d121b581202.var_698da5af57b757e7 = var_698da5af57b757e7;
    shot = scenescriptbundle function_2218afa82a590ea3(var_698da5af57b757e7);
    var_9be58c68789faf5c = scenescriptbundle function_bfc4196d3da11705(objectindex);
    var_907051501530beee = var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    var_312fada63335955a = [0:var_907051501530beee, 1:var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4, 2:shot.var_cf0d4d8cc5ac99a4, 3:scenescriptbundle];
    for (var_afaaf74a3ad05eae = 0; var_afaaf74a3ad05eae < var_312fada63335955a.size; var_afaaf74a3ad05eae++) {
        var_703da6db36591397 = var_312fada63335955a[var_afaaf74a3ad05eae];
        if (isdefined(var_703da6db36591397.aligntarget)) {
            var_bae27d121b581202.aligntarget = var_703da6db36591397.aligntarget;
            if (isdefined(var_703da6db36591397.aligntargettag)) {
                var_bae27d121b581202.aligntag = tolower(var_703da6db36591397.aligntargettag);
            }
            break;
        }
    }
    var_bae27d121b581202.originoffset = var_bae27d121b581202.originoffset + function_61f8f9a912f9df9f(var_907051501530beee.var_8db9e726632f82c7, var_907051501530beee.var_8db9e626632f8094, var_907051501530beee.var_8db9e926632f872d);
    var_bae27d121b581202.anglesoffset = var_bae27d121b581202.anglesoffset + function_61f8f9a912f9df9f(var_907051501530beee.var_ac0c3857c7b0c6d, var_907051501530beee.var_ac0c2857c7b0a3a, var_907051501530beee.var_ac0c1857c7b0807);
    var_bae27d121b581202.originoffset = var_bae27d121b581202.originoffset + function_61f8f9a912f9df9f(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_8db9e726632f82c7, var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_8db9e626632f8094, var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_8db9e926632f872d);
    var_bae27d121b581202.anglesoffset = var_bae27d121b581202.anglesoffset + function_61f8f9a912f9df9f(var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_ac0c3857c7b0c6d, var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_ac0c2857c7b0a3a, var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_ac0c1857c7b0807);
    var_bae27d121b581202.originoffset = var_bae27d121b581202.originoffset + function_61f8f9a912f9df9f(shot.var_cf0d4d8cc5ac99a4.var_8db9e726632f82c7, shot.var_cf0d4d8cc5ac99a4.var_8db9e626632f8094, shot.var_cf0d4d8cc5ac99a4.var_8db9e926632f872d);
    var_bae27d121b581202.anglesoffset = var_bae27d121b581202.anglesoffset + function_61f8f9a912f9df9f(shot.var_cf0d4d8cc5ac99a4.var_ac0c3857c7b0c6d, shot.var_cf0d4d8cc5ac99a4.var_ac0c2857c7b0a3a, shot.var_cf0d4d8cc5ac99a4.var_ac0c1857c7b0807);
    var_bae27d121b581202.originoffset = var_bae27d121b581202.originoffset + function_61f8f9a912f9df9f(scenescriptbundle.var_8db9e726632f82c7, scenescriptbundle.var_8db9e626632f8094, scenescriptbundle.var_8db9e926632f872d);
    var_bae27d121b581202.anglesoffset = var_bae27d121b581202.anglesoffset + function_61f8f9a912f9df9f(scenescriptbundle.var_ac0c3857c7b0c6d, scenescriptbundle.var_ac0c2857c7b0a3a, scenescriptbundle.var_ac0c1857c7b0807);
    aligntarget = undefined;
    if (isdefined(var_bae27d121b581202.aligntarget)) {
        var_aecf57ef77b2c2e6 = var_5aaf7c7163c04623 get_object(var_bae27d121b581202.aligntarget);
        if (isdefined(var_aecf57ef77b2c2e6)) {
            aligntarget = var_aecf57ef77b2c2e6 function_4c4c2a548b9fc7ab();
            if (isdefined(aligntarget)) {
                var_bae27d121b581202.var_93cd726eb6096497 = var_aecf57ef77b2c2e6.index;
            }
        }
        if (!isdefined(aligntarget)) {
            aligntarget = function_9b40ea5276506411(var_bae27d121b581202.aligntarget);
            if (isdefined(aligntarget) && isdefined(aligntarget.var_214d924f4e137244)) {
                var_bae27d121b581202.var_93cd726eb6096497 = aligntarget.var_214d924f4e137244.index;
            }
        }
    }
    if (!isdefined(aligntarget)) {
        aligntarget = var_5aaf7c7163c04623;
    }
    var_bae27d121b581202.var_13352dba0905ac7 = aligntarget;
    var_bae27d121b581202.origin = function_53c4c53197386572(var_bae27d121b581202.var_13352dba0905ac7.origin, (0, 0, 0));
    var_bae27d121b581202.angles = function_53c4c53197386572(var_bae27d121b581202.var_13352dba0905ac7.angles, (0, 0, 0));
    return var_bae27d121b581202;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9b96
// Size: 0x1b
function private function_2c5f030a3c002210() {
    scenescriptbundle = self;
    return istrue(scenescriptbundle.var_c20575a933a783ef);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9bb9
// Size: 0x1b
function private function_4f93a0dfb8fd6a47() {
    scenescriptbundle = self;
    return istrue(scenescriptbundle.var_a4acb64fe0d4a1d0);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9bdc
// Size: 0x1b
function private function_cf67ad1bae22e908() {
    scenescriptbundle = self;
    return istrue(scenescriptbundle.var_40e675414bba8ec3);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9bff
// Size: 0x22
function private function_62cef499110730d3() {
    scenescriptbundle = self;
    return function_53c4c53197386572(scenescriptbundle.var_d5db6bb8edba85c2, 1);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9c29
// Size: 0x1b
function private function_291cd2f1089d3a94() {
    scenescriptbundle = self;
    return scenescriptbundle.objects.size;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9c4c
// Size: 0x25
function private function_bfc4196d3da11705(index) {
    scenescriptbundle = self;
    return scenescriptbundle.objects[index];
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9c79
// Size: 0x1b
function private function_d1338e27a26ecaeb() {
    scenescriptbundle = self;
    return scenescriptbundle.shots.size;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9c9c
// Size: 0x25
function private function_2218afa82a590ea3(index) {
    scenescriptbundle = self;
    return scenescriptbundle.shots[index];
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9cc9
// Size: 0xcb
function private function_eed2bf36a4defb90(var_f8c9c619e9b781d) {
    scenescriptbundle = self;
    var_38640d9c6ebeb669 = isstring(var_f8c9c619e9b781d);
    var_dec1299c2c16c907 = isint(var_f8c9c619e9b781d);
    foreach (index, shot in scenescriptbundle.shots) {
        if (!isdefined(var_f8c9c619e9b781d)) {
            return index;
        } else if (var_dec1299c2c16c907 && var_f8c9c619e9b781d == index) {
            return index;
        } else if (var_38640d9c6ebeb669 && shot.var_cf0d4d8cc5ac99a4.name == var_f8c9c619e9b781d) {
            return index;
        }
    }
    return -1;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d9c
// Size: 0x2b
function private function_a3be29c7b9c648ef(index) {
    scenescriptbundle = self;
    return scenescriptbundle.shots[index] function_55042076624e1180();
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9dcf
// Size: 0x1b
function private function_e65f46a710591a5() {
    scenescriptbundle = self;
    return istrue(scenescriptbundle.var_b46b5e7241514342);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9df2
// Size: 0x25
function private function_ee55ab255c0be00d() {
    scenescriptbundle = self;
    return function_53c4c53197386572(scenescriptbundle.var_b9717bd2a5317a1c, "AnimScripted");
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9e1f
// Size: 0x74
function private function_924e47d1f90e6366(shotname) {
    scenescriptbundle = self;
    var_406b6072ae54dcd1 = undefined;
    shotcount = scenescriptbundle function_d1338e27a26ecaeb();
    for (var_698da5af57b757e7 = 0; var_698da5af57b757e7 < shotcount; var_698da5af57b757e7++) {
        shot = scenescriptbundle function_2218afa82a590ea3(var_698da5af57b757e7);
        if (shot function_55042076624e1180() == shotname) {
            var_406b6072ae54dcd1 = var_698da5af57b757e7;
            break;
        }
    }
    return var_406b6072ae54dcd1;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9e9b
// Size: 0x1b
function private function_295cf85da8fa8653() {
    scenescriptbundle = self;
    return istrue(scenescriptbundle.var_206d2caf9cbdec7c);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9ebe
// Size: 0x2b
function private function_55042076624e1180() {
    shot = self;
    if (!isdefined(shot)) {
        return undefined;
    }
    return shot.var_cf0d4d8cc5ac99a4.name;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9ef1
// Size: 0x25
function private function_d218620a1b80e648() {
    shot = self;
    return istrue(shot.var_cf0d4d8cc5ac99a4.var_bcaa951e2a50f6af);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9f1e
// Size: 0x25
function private function_dd4368cda4b91e7d() {
    shot = self;
    return istrue(shot.var_cf0d4d8cc5ac99a4.var_b46b5e7241514342);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9f4b
// Size: 0x3d
function private function_9336a9805a4ab29a() {
    shot = self;
    /#
        if (getdvarint(@"hash_b279d32f047f16db", 0)) {
            return 1;
        }
    #/
    return istrue(shot.var_cf0d4d8cc5ac99a4.var_c2c23e4b902d3dcb);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9f90
// Size: 0x14
function private function_f09a700ae2edf8dc(var_bae27d121b581202, var_49a7f73f0fb5f6cf) {
    
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9fab
// Size: 0xc6
function private function_d4f1b2dce50c7b7(var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    if (var_214d924f4e137244.var_9be58c68789faf5c function_7a553773a0af8bcd(var_698da5af57b757e7)) {
        if (!isdefined(var_214d924f4e137244.var_251898eb5a0e0c9f)) {
            var_214d924f4e137244 function_532562ce2e63032f(var_214d924f4e137244.var_bae27d121b581202);
        }
        if (isdefined(var_214d924f4e137244.var_251898eb5a0e0c9f)) {
            hidemayhem(var_214d924f4e137244.var_251898eb5a0e0c9f);
        }
    }
    if (var_214d924f4e137244.var_9be58c68789faf5c function_8ed9853e35162b7c(var_698da5af57b757e7)) {
        if (!isdefined(var_214d924f4e137244.var_251898eb5a0e0c9f)) {
            var_214d924f4e137244 function_532562ce2e63032f(var_214d924f4e137244.var_bae27d121b581202);
        }
        if (isdefined(var_214d924f4e137244.var_251898eb5a0e0c9f)) {
            showmayhem(var_214d924f4e137244.var_251898eb5a0e0c9f);
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa078
// Size: 0xa1
function private function_532562ce2e63032f(var_bae27d121b581202, var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    var_698da5af57b757e7 = function_53c4c53197386572(var_698da5af57b757e7, var_214d924f4e137244.var_568f62a24b19c46d.var_49a7f73f0fb5f6cf);
    var_7535cec6dfd38a5e = var_214d924f4e137244.var_9be58c68789faf5c function_79edcc9987330a2a(var_698da5af57b757e7);
    if (var_7535cec6dfd38a5e.size != 0) {
        var_214d924f4e137244 function_d0ffa1bea912444d(var_214d924f4e137244.var_568f62a24b19c46d.var_49a7f73f0fb5f6cf, "mayhem", var_bae27d121b581202, var_7535cec6dfd38a5e[0], 0, 0, 0, "MayhemAnimation");
        pausemayhem(var_214d924f4e137244.var_251898eb5a0e0c9f);
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 10, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa120
// Size: 0x14d
function private function_d0ffa1bea912444d(var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, var_efef5984278284b1) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 function_e045fde582740c36();
    if (!isdefined(level.scene.var_629ea32e5d4a2c40)) {
        level.scene.var_629ea32e5d4a2c40 = 0;
    }
    level.scene.var_629ea32e5d4a2c40++;
    var_214d924f4e137244.var_251898eb5a0e0c9f = var_214d924f4e137244.var_5aaf7c7163c04623.var_8ac77218f7a34e3e + "_mayhem" + level.scene.var_629ea32e5d4a2c40;
    function_e4fc30ccdca08b9d(var_bae27d121b581202);
    var_9ede37c35118aba9 = var_214d924f4e137244.var_9be58c68789faf5c function_698798987ca7073(var_698da5af57b757e7);
    if (var_9ede37c35118aba9.size == 0) {
        return;
    }
    spawnmayhem(var_214d924f4e137244.var_251898eb5a0e0c9f, var_4f3089070d8b1e24, var_bae27d121b581202.origin, var_bae27d121b581202.angles);
    waittill_match_or_timeout(notifystring, "end", var_9ede37c35118aba9[animindex]);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa274
// Size: 0x17
function private function_94d19635a2c1b723() {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 function_e045fde582740c36();
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa292
// Size: 0x3a
function private function_e045fde582740c36() {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.var_251898eb5a0e0c9f)) {
        killmayhem(var_214d924f4e137244.var_251898eb5a0e0c9f);
        var_214d924f4e137244.var_251898eb5a0e0c9f = undefined;
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa2d3
// Size: 0x14
function private function_4eeb4b296c894ce2(var_bae27d121b581202, var_49a7f73f0fb5f6cf) {
    
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa2ee
// Size: 0x1ad
function private function_371c152f2c391c55(var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    scenescriptbundle = var_214d924f4e137244.var_5aaf7c7163c04623 function_6a6ec88abab6a723();
    var_329c816db66ec05e = scenescriptbundle function_cf67ad1bae22e908();
    if (var_329c816db66ec05e) {
        foreach (player in level.players) {
            player function_e7257014ebaeeaa8(1);
        }
    }
    var_8ed8d60ce0091e17 = var_214d924f4e137244.var_9be58c68789faf5c function_6cf39bfd67cda93a(var_698da5af57b757e7);
    if (var_8ed8d60ce0091e17 > 0) {
        foreach (player in level.players) {
            player val::set("scene_scene" + "_xcam", "cinematic_motion", 0);
            if (var_214d924f4e137244 function_b4d836fe99f480e(var_698da5af57b757e7)) {
                player val::set("scene_scene" + "_xcam", "take_weapons", 1);
            }
            var_8ff8fd7841f6eba2 = var_214d924f4e137244.var_9be58c68789faf5c function_4040a1e0bb19e02f(var_698da5af57b757e7);
            /#
                function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + player getentitynumber(), player.origin, player.angles);
            #/
            player function_bb60d8e77392c74e(0, var_8ed8d60ce0091e17, 1, var_8ff8fd7841f6eba2);
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa4a2
// Size: 0xf9
function private function_2db9cd1521705174(var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    var_89d01150f6ea37bc = var_214d924f4e137244.var_9be58c68789faf5c function_be64404b86d48153(var_698da5af57b757e7);
    if (var_89d01150f6ea37bc > 0) {
        foreach (player in level.players) {
            player val::function_c9d0b43701bdba00("scene_scene" + "_xcam");
            var_8ff8fd7841f6eba2 = var_214d924f4e137244.var_9be58c68789faf5c function_51bd4cd630963c3a(var_698da5af57b757e7);
            /#
                function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + player getentitynumber(), player.origin, player.angles);
            #/
            player function_bb60d8e77392c74e(1, var_89d01150f6ea37bc, 1, var_8ff8fd7841f6eba2);
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa5a2
// Size: 0x14
function private function_d6ce74b74dc12311(var_bae27d121b581202, var_698da5af57b757e7) {
    
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa5bd
// Size: 0x114
function private function_90e78898cf74b132(var_568f62a24b19c46d, var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 function_e4fc30ccdca08b9d(var_214d924f4e137244.var_bae27d121b581202);
    if (isdefined(var_214d924f4e137244.var_bae27d121b581202)) {
        CameraAnimation = var_214d924f4e137244 function_6c3d100538f590b3(var_698da5af57b757e7);
        if (isdefined(CameraAnimation)) {
            foreach (player in level.players) {
                var_a9b43fd80025b224 = player function_c5106bdaced133ab(CameraAnimation, 0, 0, var_214d924f4e137244.var_bae27d121b581202.origin, var_214d924f4e137244.var_bae27d121b581202.angles);
                if (isdefined(var_a9b43fd80025b224)) {
                    /#
                        function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>", var_a9b43fd80025b224, (0, 0, 0));
                    #/
                    var_568f62a24b19c46d function_317afd3b93b0b54d(player, var_a9b43fd80025b224);
                }
            }
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 10, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa6d8
// Size: 0x1a0
function private function_7ce890b54a48b767(var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, var_efef5984278284b1) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 function_675f201c7358ed54();
    if (level.players.size == 0) {
        return 0;
    }
    function_e4fc30ccdca08b9d(var_bae27d121b581202);
    var_214d924f4e137244 endon("scene_stop");
    var_214d924f4e137244 endon("scene_play_anim");
    var_214d924f4e137244.var_e32ce590a15666ec = 1;
    foreach (player in level.players) {
        var_214d924f4e137244 childthread function_bae0f68830d519ad("scene_shot_xcam", player, var_4f3089070d8b1e24, var_866b3a3066122e39, notifystring, var_bae27d121b581202, var_698da5af57b757e7);
    }
    waittime = function_c55e2627715b3a72(var_4f3089070d8b1e24, var_866b3a3066122e39);
    if (function_264b81079e1be84a(var_4f3089070d8b1e24)) {
        var_214d924f4e137244 waittillmatch(notifystring, "end");
    } else if (waittime > 0) {
        var_214d924f4e137244 waittill_match_or_timeout(notifystring, "end", waittime);
    }
    foreach (player in level.players) {
        player val::function_c9d0b43701bdba00("scene_shot_xcam");
    }
    return waittime;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa880
// Size: 0x20e
function private function_bae0f68830d519ad(var_4beff9d042dd4ca3, player, var_4f3089070d8b1e24, var_866b3a3066122e39, notifystring, var_bae27d121b581202, var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    /#
        assert(isplayer(player));
    #/
    player endon("death_or_disconnect");
    /#
        function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_698da5af57b757e7, var_bae27d121b581202.origin, var_bae27d121b581202.angles);
    #/
    waittime = 0;
    player val::set(var_4beff9d042dd4ca3, "cg_drawcrosshair", 0);
    player val::set(var_4beff9d042dd4ca3, "freezecontrols", 1);
    if (var_4f3089070d8b1e24 != "") {
        starttime = 0;
        if (isdefined(var_866b3a3066122e39) && var_866b3a3066122e39 > 0) {
            starttime = function_4358b309fdcc6d44(var_4f3089070d8b1e24) * var_866b3a3066122e39;
        }
        var_be9e9d8d5ea874f9 = !var_214d924f4e137244.var_9be58c68789faf5c function_cef37972e99fd713(var_698da5af57b757e7);
        var_a9eb89bfa3d96107 = function_9f853ecc68f5058();
        var_1f8b120e72bb5ee = var_214d924f4e137244.var_9be58c68789faf5c function_f0f9db1f4b0000f4(var_698da5af57b757e7);
        player notify("scene_play_xcam");
        if (isent(var_bae27d121b581202.var_13352dba0905ac7) && isdefined(var_bae27d121b581202.aligntag) && var_bae27d121b581202.aligntag != "") {
            player function_cebd47970f60e9b(var_4f3089070d8b1e24, 0, var_bae27d121b581202.var_13352dba0905ac7, var_bae27d121b581202.aligntag, starttime, 1, var_be9e9d8d5ea874f9, var_a9eb89bfa3d96107, var_1f8b120e72bb5ee);
        } else {
            player playXcam(var_4f3089070d8b1e24, 0, var_bae27d121b581202.origin, var_bae27d121b581202.angles, starttime, 1, var_be9e9d8d5ea874f9, var_a9eb89bfa3d96107, var_1f8b120e72bb5ee);
        }
        if (function_264b81079e1be84a(var_4f3089070d8b1e24)) {
            var_214d924f4e137244 waittillmatch(notifystring, "end");
        } else {
            waittime = function_c55e2627715b3a72(var_4f3089070d8b1e24, var_866b3a3066122e39);
            if (waittime > 0) {
                var_214d924f4e137244 waittill_match_or_timeout(notifystring, "end", waittime);
            }
        }
        player notify("scene_play_xcam_done");
    }
    return waittime;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaa96
// Size: 0x48
function private function_c55e2627715b3a72(var_4f3089070d8b1e24, var_866b3a3066122e39) {
    var_43869b27e8e72c31 = function_4358b309fdcc6d44(var_4f3089070d8b1e24);
    starttime = 0;
    if (isdefined(var_866b3a3066122e39) && var_866b3a3066122e39 > 0) {
        starttime = var_43869b27e8e72c31 * var_866b3a3066122e39;
        var_43869b27e8e72c31 = var_43869b27e8e72c31 - starttime;
    }
    return var_43869b27e8e72c31;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaae6
// Size: 0x34
function private function_fe644d526883b9b4(var_bae27d121b581202, var_4f3089070d8b1e24, notifystring, var_866b3a3066122e39, var_1cbffacca2bd0d4c, var_efef5984278284b1) {
    
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab21
// Size: 0x17
function private function_544bbcb14d370c45() {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 function_675f201c7358ed54();
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab3f
// Size: 0xb6
function private function_675f201c7358ed54() {
    var_214d924f4e137244 = self;
    scenescriptbundle = var_214d924f4e137244.var_5aaf7c7163c04623 function_6a6ec88abab6a723();
    var_329c816db66ec05e = scenescriptbundle function_cf67ad1bae22e908();
    foreach (player in level.players) {
        player function_8ff8fd7841f6eba2();
        player val::function_c9d0b43701bdba00("scene_shot_xcam");
        if (var_329c816db66ec05e) {
            player function_e7257014ebaeeaa8(0);
        }
    }
    var_214d924f4e137244.var_e32ce590a15666ec = undefined;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xabfc
// Size: 0xd
function private function_a9acafbfcda23112(entity) {
    return 0;
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xac11
// Size: 0x20
function private function_1cc94dda1955e721(var_fa1af9d2277fd747) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 function_675f201c7358ed54();
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xac38
// Size: 0x93
function private function_1069a83dc140e900(var_fcc3f96f3cb06900) {
    foreach (player in level.players) {
        if (!isent(player)) {
            continue;
        }
        if (istrue(var_fcc3f96f3cb06900)) {
            player val::set("scene_scene", "cinematics_participant", 1);
        } else {
            player val::reset("scene_scene", "cinematics_participant");
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xacd2
// Size: 0x3b
function private function_61f8f9a912f9df9f(var_f3cad551d6321662, var_f3cad651d6321895, var_f3cad351d63211fc) {
    if (!isdefined(var_f3cad551d6321662)) {
        var_f3cad551d6321662 = 0;
    }
    if (!isdefined(var_f3cad651d6321895)) {
        var_f3cad651d6321895 = 0;
    }
    if (!isdefined(var_f3cad351d63211fc)) {
        var_f3cad351d63211fc = 0;
    }
    return (var_f3cad551d6321662, var_f3cad651d6321895, var_f3cad351d63211fc);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xad15
// Size: 0x1d8
function private function_e4fc30ccdca08b9d(var_bae27d121b581202) {
    var_bae27d121b581202.origin = (0, 0, 0);
    var_bae27d121b581202.angles = (0, 0, 0);
    if (isent(var_bae27d121b581202.var_13352dba0905ac7) && isdefined(var_bae27d121b581202.aligntag)) {
        var_bae27d121b581202.origin = var_bae27d121b581202.var_13352dba0905ac7 gettagorigin(var_bae27d121b581202.aligntag, 1, 0, 0);
        if (!isdefined(var_bae27d121b581202.origin)) {
            var_bae27d121b581202.origin = (0, 0, 0);
        }
        var_bae27d121b581202.angles = var_bae27d121b581202.var_13352dba0905ac7 gettagangles(var_bae27d121b581202.aligntag, 1, 0, 0);
        if (!isdefined(var_bae27d121b581202.angles)) {
            var_bae27d121b581202.angles = (0, 0, 0);
        }
    } else {
        if (isdefined(var_bae27d121b581202.var_13352dba0905ac7.origin)) {
            var_bae27d121b581202.origin = var_bae27d121b581202.var_13352dba0905ac7.origin;
        }
        if (isdefined(var_bae27d121b581202.var_13352dba0905ac7.angles)) {
            var_bae27d121b581202.angles = var_bae27d121b581202.var_13352dba0905ac7.angles;
        }
    }
    var_bae27d121b581202.origin = var_bae27d121b581202.origin + rotatevector(var_bae27d121b581202.originoffset, var_bae27d121b581202.angles);
    var_bae27d121b581202.angles = combineangles(var_bae27d121b581202.angles, var_bae27d121b581202.anglesoffset);
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaef4
// Size: 0x1a3
function private function_5ecd1fd13181af98(notifystring, var_80ba00b3669e6f07, var_214d924f4e137244) {
    entity = self;
    if (!isent(self)) {
        return;
    }
    if (!isdefined(notifystring) || !isdefined(var_80ba00b3669e6f07.var_c586ec36655fd62f)) {
        return;
    }
    if (!istrue(var_80ba00b3669e6f07.var_a981703f16897b47) && istrue(var_80ba00b3669e6f07.var_d516421e67c11065)) {
        return;
    }
    note = tolower(var_80ba00b3669e6f07.var_b9954627fcce58b4);
    if (istrue(var_80ba00b3669e6f07.var_a981703f16897b47)) {
        goto LOC_000000ca;
    }
    var_d6549707542fa7bb = "_r" + "";
    var_80ba00b3669e6f07.var_c586ec36655fd62f notify(var_d6549707542fa7bb);
    var_80ba00b3669e6f07.var_c586ec36655fd62f endon(var_d6549707542fa7bb);
    waittillframeend();
    if (var_80ba00b3669e6f07.var_b9954627fcce58b4 != "end") {
        entity thread function_b66a5adba2137274(notifystring, "end", "entity_wait_note_abort");
        entity endon("entity_wait_note_abort");
    }
    while (1) {
        entity waittillmatch(notifystring, note);
        if (isdefined(var_80ba00b3669e6f07.var_c586ec36655fd62f)) {
            if (istrue(var_80ba00b3669e6f07.var_a981703f16897b47) || !istrue(var_80ba00b3669e6f07.var_d516421e67c11065)) {
                var_80ba00b3669e6f07.var_c586ec36655fd62f notify(var_80ba00b3669e6f07.var_b9954627fcce58b4);
                var_80ba00b3669e6f07.var_d516421e67c11065 = 1;
            }
            if (!istrue(var_80ba00b3669e6f07.var_a981703f16897b47) || var_80ba00b3669e6f07.var_b9954627fcce58b4 == "end") {
                return;
            }
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb09e
// Size: 0x38
function private function_b66a5adba2137274(notifystring, match, var_55870452e821a3c1) {
    entity = self;
    entity waittillmatch(notifystring, match);
    if (isdefined(entity)) {
        entity notify(var_55870452e821a3c1);
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb0dd
// Size: 0x2ca
function private function_bea88b25e17cea66(var_568f62a24b19c46d, var_698da5af57b757e7, objectindex) {
    var_214d924f4e137244 = self;
    var_5aaf7c7163c04623 = var_568f62a24b19c46d.var_5aaf7c7163c04623;
    if (isdefined(var_214d924f4e137244.entity)) {
        var_472689d0a8c07f44 = var_214d924f4e137244.entity;
        var_7db06d4a4c1afffa = var_214d924f4e137244.var_9be58c68789faf5c function_1b712c4c79096ef9(var_698da5af57b757e7);
        var_b9013c55bc0d035c = var_214d924f4e137244.var_9be58c68789faf5c function_8f11c2704d4c19c3(var_698da5af57b757e7);
        if (var_7db06d4a4c1afffa != "DEFAULT") {
            var_472689d0a8c07f44 val::set("scene_shot", "demeanor", var_7db06d4a4c1afffa);
        }
        if (var_214d924f4e137244 function_b4d836fe99f480e(var_698da5af57b757e7)) {
            var_472689d0a8c07f44 val::set("scene_shot", "take_weapons", 1);
        }
        if (isdefined(var_214d924f4e137244.var_84b542bb7490bea7.var_43286fd46706909c)) {
            return;
        }
        var_da79ebe29c84d14c = var_214d924f4e137244.var_9be58c68789faf5c function_8b6dcfac0d2921ad(var_698da5af57b757e7);
        if (var_da79ebe29c84d14c != "Teleport" && istrue(var_214d924f4e137244.var_423f55edd900883)) {
            var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
            var_4f3089070d8b1e24 = var_214d924f4e137244.var_9be58c68789faf5c function_79edcc9987330a2a(var_698da5af57b757e7)[0];
            if (isdefined(var_4f3089070d8b1e24)) {
                function_e4fc30ccdca08b9d(var_214d924f4e137244.var_bae27d121b581202);
                var_11275708e7b3f422 = getstartorigin(var_214d924f4e137244.var_bae27d121b581202.origin, var_214d924f4e137244.var_bae27d121b581202.angles, var_4f3089070d8b1e24);
                if (distancesquared(var_472689d0a8c07f44.origin, var_11275708e7b3f422) > squared(16)) {
                    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectStopAnim");
                    if (isdefined(var_9ecbeba68a379903) && var_9ecbeba68a379903 != &function_9b8055c613f1bb31) {
                        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]]();
                    }
                    var_4bc185af207d5706 = function_8b0aed4c74bd673c(var_7db06d4a4c1afffa, var_b9013c55bc0d035c);
                    var_8695dc19ef4c8376 = undefined;
                    if (var_da79ebe29c84d14c == "ReachArrive") {
                        var_8695dc19ef4c8376 = function_796087cbcf3fb30(var_214d924f4e137244.var_9be58c68789faf5c function_ceabc6a1e0fac4cf(var_698da5af57b757e7));
                    }
                    /#
                        function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>", var_214d924f4e137244.var_bae27d121b581202.origin, var_214d924f4e137244.var_bae27d121b581202.angles);
                    #/
                    var_5aaf7c7163c04623 childthread scene_coordinated_reach(var_568f62a24b19c46d, var_698da5af57b757e7, var_4bc185af207d5706, [0:var_472689d0a8c07f44, 1:var_4f3089070d8b1e24, 2:var_214d924f4e137244.var_bae27d121b581202, 3:var_8695dc19ef4c8376]);
                    var_472689d0a8c07f44 waittill_any_2("scene_coordinated_reach", "death_or_disconnect");
                }
            }
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb3ae
// Size: 0xf4
function private function_89c29980d9b0ebe() {
    var_214d924f4e137244 = self;
    /#
        assert(isai(var_214d924f4e137244.entity));
    #/
    var_214d924f4e137244.entity endon("death_or_disconnect");
    var_214d924f4e137244 endon("scene_ai_stealth");
    while (1) {
        lookatplayer = var_214d924f4e137244.entity function_47dbe773d9a4572f(0.25);
        if (isdefined(lookatplayer) && (!isdefined(var_214d924f4e137244.var_63dd238417ee222c) || var_214d924f4e137244.var_63dd238417ee222c != lookatplayer)) {
            var_214d924f4e137244.var_63dd238417ee222c = lookatplayer;
            var_214d924f4e137244.entity namespace_17a0e830dd8fa113::function_6fbea72303085c6f(var_214d924f4e137244.var_63dd238417ee222c);
        } else if (isdefined(var_214d924f4e137244.var_63dd238417ee222c)) {
            var_214d924f4e137244.entity namespace_17a0e830dd8fa113::function_1e1767fdc6980106(var_214d924f4e137244.var_63dd238417ee222c);
            var_214d924f4e137244.var_63dd238417ee222c = undefined;
        }
        waitframe();
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb4a9
// Size: 0xc3
function private function_81f89576d8f466b4() {
    var_214d924f4e137244 = self;
    /#
        assert(isai(var_214d924f4e137244.entity));
    #/
    var_214d924f4e137244.entity endon("death_or_disconnect");
    var_214d924f4e137244 endon("scene_ai_stealth");
    while (1) {
        events = var_214d924f4e137244.entity waittill("ai_events");
        foreach (event in events) {
            var_214d924f4e137244 function_bdd631983c9e6f5c();
            var_214d924f4e137244 function_9b8055c613f1bb31();
            var_214d924f4e137244 thread function_37e4ff5a9807c7d5();
        }
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb573
// Size: 0xad
function private function_9b40ea5276506411(var_f50d468c940e852e, var_294bbb5f1a18a41a) {
    if (!isdefined(var_294bbb5f1a18a41a)) {
        var_294bbb5f1a18a41a = 1;
    }
    var_f35bac3c881fec88 = utility::function_a5079b5837467402(var_f50d468c940e852e, "targetname", var_294bbb5f1a18a41a);
    if (!isdefined(var_f35bac3c881fec88) || var_f35bac3c881fec88.size == 0) {
        aligntarget = utility::function_a5079b5837467402(var_f50d468c940e852e, "script_noteworthy", var_294bbb5f1a18a41a);
    }
    if (!isdefined(var_f35bac3c881fec88) || var_f35bac3c881fec88.size == 0) {
        aligntarget = utility::function_a5079b5837467402("_scene_global_" + var_f50d468c940e852e, "targetname", var_294bbb5f1a18a41a);
    }
    if (!isdefined(var_f35bac3c881fec88) || var_f35bac3c881fec88.size == 0) {
        aligntarget = utility::function_a5079b5837467402("_scene_global_" + var_f50d468c940e852e, "script_noteworthy", var_294bbb5f1a18a41a);
    }
    if (var_f35bac3c881fec88.size > 1) {
    }
    return var_f35bac3c881fec88[0];
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 10, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb628
// Size: 0x91
function private function_16714fbc8955e6c7(var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, var_efef5984278284b1) {
    var_214d924f4e137244 = self;
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectStoreAnimRequest");
    if (isdefined(var_9ecbeba68a379903)) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, var_efef5984278284b1);
    }
}

// Namespace scene/namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb6c0
// Size: 0x4c
function private function_68056529c69f4097(var_efef5984278284b1, var_698da5af57b757e7, animindex) {
    var_214d924f4e137244 = self;
    var_9ecbeba68a379903 = var_214d924f4e137244 function_8a786f133d7341c0("objectClearAnimRequest");
    if (isdefined(var_9ecbeba68a379903)) {
        var_214d924f4e137244 [[ var_9ecbeba68a379903 ]](var_efef5984278284b1, var_698da5af57b757e7, animindex);
    }
}

