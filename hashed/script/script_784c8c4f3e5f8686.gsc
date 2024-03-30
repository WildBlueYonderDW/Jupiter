// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\anim.gsc;
#using scripts\common\notetrack.gsc;
#using scripts\common\scene.gsc;
#using script_308091d56071a91c;
#using scripts\common\values.gsc;
#using script_6bfe39bd5c12f84a;
#using script_7d535542e36d66f9;

#namespace scene;

// Namespace scene / namespace_dd27d6c3daf67646
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
    scenebundles = getscriptbundlenames("scenescriptbundle");
    foreach (scenescriptbundle in scenebundles) {
        scenescriptbundle = getscriptbundle(scenescriptbundle);
        if (isdefined(scenescriptbundle)) {
            scenescriptbundle function_69abf08346f3f6d9();
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xacb
// Size: 0x3ba
function private function_ace39e84230f386() {
    if (!isdefined(level.scene)) {
        level.scene = spawnstruct();
    }
    if (!isdefined(level.scene.objecthandlers)) {
        level.scene.objecthandlers = [];
        function_7855ec4caf5901f9("Types_Object", "objectSpawn", &object_spawn);
        function_7855ec4caf5901f9("Types_Object", "objectSetup", &object_setup);
        function_7855ec4caf5901f9("Types_Object", "shotObjectPrepare", &function_d4dcec93a1db6e3f);
        function_7855ec4caf5901f9("Types_Object", "shotObjectSetup", &function_770c0b047ce9cfc1);
        function_7855ec4caf5901f9("Types_Object", "shotObjectLinkSetup", &function_d82945c5509ec28e);
        function_7855ec4caf5901f9("Types_Object", "shotObjectFirstFrame", &function_9745e01cedd81c85);
        function_7855ec4caf5901f9("Types_Object", "objectMatchEntity", &function_2294fe71a7c1d8d6);
        function_7855ec4caf5901f9("Types_Object", "objectGetAnimEntity", &function_4c4c2a548b9fc7ab);
        function_7855ec4caf5901f9("Types_Object", "objectGetLinkEnts", &function_f054a83311d7f448);
        function_7855ec4caf5901f9("Types_Object", "objectGetAnimRoot", &function_b9c245bf99df4a8);
        function_7855ec4caf5901f9("Types_Object", "objectTeleport", &object_teleport);
        function_7855ec4caf5901f9("Types_Object", "objectVelocity", &object_velocity);
        function_7855ec4caf5901f9("Types_Object", "shotObjectPlayAnim", &function_c34fc4bc3e1ecbcb);
        function_7855ec4caf5901f9("Types_Object", "objectWaitNotes", &function_8e9f8e1fbe2b7ab4);
        function_7855ec4caf5901f9("Types_Object", "shotObjectStopAnim", &function_9b8055c613f1bb31);
        function_7855ec4caf5901f9("Types_Object", "shotObjectCleanup", &function_a477eb91dc3b38b8);
        function_7855ec4caf5901f9("Types_Object", "objectCleanup", &object_cleanup);
        function_7855ec4caf5901f9("Types_Object", "objectDelete", &object_delete);
        function_7855ec4caf5901f9("Types_Object", "objectKill", &object_kill);
        function_7855ec4caf5901f9("Types_Vehicle", "objectSpawn", &function_6acf84052cd5ab1);
        function_7855ec4caf5901f9("Types_Vehicle", "shotObjectSetup", &function_dec77fd275b35e92);
        function_7855ec4caf5901f9("Types_Vehicle", "objectMatchEntity", &function_619f2e5d7f38d9d5);
        function_7855ec4caf5901f9("Types_Mayhem", "objectSpawn", &function_f09a700ae2edf8dc);
        function_7855ec4caf5901f9("Types_Mayhem", "shotObjectSetup", &function_d4f1b2dce50c7b7);
        function_7855ec4caf5901f9("Types_Mayhem", "shotObjectFirstFrame", &function_532562ce2e63032f);
        function_7855ec4caf5901f9("Types_Mayhem", "shotObjectPlayAnim", &function_d0ffa1bea912444d);
        function_7855ec4caf5901f9("Types_Mayhem", "shotObjectStopAnim", &function_94d19635a2c1b723);
        function_7855ec4caf5901f9("Types_Mayhem", "objectDelete", &function_e045fde582740c36);
        function_7855ec4caf5901f9("Types_XCam", "objectSpawn", &xcam_spawn);
        function_7855ec4caf5901f9("Types_XCam", "shotObjectSetup", &function_371c152f2c391c55);
        function_7855ec4caf5901f9("Types_XCam", "shotObjectCleanup", &function_2db9cd1521705174);
        function_7855ec4caf5901f9("Types_XCam", "shotObjectFirstFrame", &function_d6ce74b74dc12311);
        function_7855ec4caf5901f9("Types_XCam", "shotObjectPreStream", &function_90e78898cf74b132);
        function_7855ec4caf5901f9("Types_XCam", "shotObjectPlayAnim", &function_7ce890b54a48b767);
        function_7855ec4caf5901f9("Types_XCam", "shotObjectSkipAnim", &function_fe644d526883b9b4);
        function_7855ec4caf5901f9("Types_XCam", "shotObjectStopAnim", &function_544bbcb14d370c45);
        function_7855ec4caf5901f9("Types_XCam", "objectDelete", &xcam_delete);
        function_7855ec4caf5901f9("Types_XCam", "objectMatchEntity", &function_a9acafbfcda23112);
        function_7855ec4caf5901f9("Types_XCam", "objectCleanup", &xcam_cleanup);
        function_7855ec4caf5901f9("Types_XCam", "objectParticipatingCinematics", &function_1069a83dc140e900);
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe8c
// Size: 0xad
function private function_e16b1ab0a35605d3(str_flag) {
    flag_wait(str_flag);
    foreach (s_scene in level.var_a0b4eb1703be349a) {
        if (isdefined(s_scene.spawnflags)) {
            if ((s_scene.spawnflags & 2) == 2) {
                s_scene thread play();
                continue;
            }
            if ((s_scene.spawnflags & 1) == 1) {
                s_scene thread init();
            }
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf40
// Size: 0x37
function private function_6a66a98742866fed() {
    sceneroot = self;
    function_ace39e84230f386();
    if (isdefined(sceneroot.scenestatic)) {
        return;
    }
    sceneroot.scenestatic = spawnstruct();
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf7e
// Size: 0x298
function private function_bd09568f76dd40ca() {
    sceneroot = self;
    function_ace39e84230f386();
    if (isdefined(sceneroot.scenedata) && sceneroot.scenedata.state != "NotInit") {
        return isdefined(sceneroot.scenedata.scenescriptbundle);
    }
    scenedata = spawnstruct();
    sceneroot.scenedata = scenedata;
    scenedata.sceneroot = sceneroot;
    /#
        sceneroot function_475cdb01202582a1();
    #/
    scenedata.state = "NotSetup";
    scenedata.sceneplay = [];
    scenedata.scenescriptbundle = sceneroot scene_scriptbundle();
    scenedata.var_214d924f4e137244 = [];
    if (!isdefined(scenedata.scenescriptbundle)) {
        scriptbundlename = sceneroot function_6c0e3626ebce826f();
        /#
            if (isdefined(scriptbundlename)) {
                println("NotSetup" + sceneroot function_6c0e3626ebce826f() + "weapon_switch");
            }
        #/
        return 0;
    }
    objectcount = scenedata.scenescriptbundle function_291cd2f1089d3a94();
    for (objectindex = 0; objectindex < objectcount; objectindex++) {
        objectdata = spawnstruct();
        scenedata.var_214d924f4e137244[objectindex] = objectdata;
        objectdata.index = objectindex;
        objectdata.sceneroot = sceneroot;
        objectdata.sceneplay = undefined;
        objectdata.scenedata = scenedata;
        objectdata.sceneobject = scenedata.scenescriptbundle function_bfc4196d3da11705(objectindex);
        objectdata.functable = level.scene.var_8a6cbf5e0998e58d[objectdata.sceneobject function_c77857d663e8cfbe()];
        objectdata.entity = undefined;
        objectdata.existingentity = undefined;
        objectdata.active = undefined;
        objectdata.var_36831a04af11576f = undefined;
        objectdata.animtreeprevious = undefined;
        objectdata.var_41dc93404af773a3 = undefined;
        objectdata.var_77c99123aefe423b = undefined;
        objectdata.var_53c962747bd1f2f = undefined;
        objectdata.var_a3ff79ae166c57aa = undefined;
        objectdata.playbacksuccessful = undefined;
        objectdata.alignmentinfo = undefined;
        objectdata.issetup = undefined;
        objectdata.linkedtag = undefined;
        objectdata.xcamplaying = undefined;
        objectdata.alignmentinfo = undefined;
        objectdata.var_251898eb5a0e0c9f = undefined;
    }
    return 1;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x121e
// Size: 0x28
function private function_798498fd6521b8f0() {
    sceneroot = self;
    waittillframeend();
    if (sceneroot get_state() == "Stopped") {
        sceneroot scene_reset();
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x124d
// Size: 0x107
function private scene_reset() {
    sceneroot = self;
    state = sceneroot get_state();
    if (state == "NotInit" || state == "NotSetup") {
        return;
    }
    if (state == "Playing") {
        sceneroot stop();
    }
    if (isdefined(sceneroot.scenedata)) {
        for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < sceneroot.scenedata.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
            var_214d924f4e137244 = sceneroot.scenedata.var_214d924f4e137244[var_56f4af8746a2d458];
            if (isdefined(var_214d924f4e137244) && isdefined(var_214d924f4e137244.entity)) {
                var_214d924f4e137244 object_cleanup();
            }
        }
    }
    sceneroot function_c643b2c6b794481e("NotSetup");
    if (isdefined(sceneroot.scenedata) && sceneroot.scenedata.scenescriptbundle function_62cef499110730d3()) {
        sceneroot cleanup();
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x135b
// Size: 0x28
function private function_e525ff755ac18cf6() {
    sceneroot = self;
    scenescriptbundle = sceneroot scene_scriptbundle();
    return scenescriptbundle function_2c5f030a3c002210();
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x138b
// Size: 0xa1
function private function_d225e757dea4eca6() {
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    animrate = undefined;
    if (isdefined(sceneroot.scenestatic)) {
        animrate = sceneroot.scenestatic.animrate;
    }
    if (!isdefined(scenedata)) {
        return;
    }
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < scenedata.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = scenedata.var_214d924f4e137244[var_56f4af8746a2d458];
        var_214d924f4e137244 function_6a4d64bdba27cb06(animrate);
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1433
// Size: 0x18e
function private function_bb980ac4246f5baa(var_8338711a0d65673b) {
    sceneroot = self;
    scenestatic = sceneroot.scenestatic;
    if (!isdefined(var_8338711a0d65673b)) {
        return;
    }
    scriptbundlename = sceneroot function_6c0e3626ebce826f();
    if (!isdefined(scriptbundlename)) {
        return;
    }
    if (isdefined(level.scene.funcs) && isdefined(level.scene.funcs[scriptbundlename]) && isdefined(level.scene.funcs[scriptbundlename][var_8338711a0d65673b])) {
        foreach (func in level.scene.funcs[scriptbundlename][var_8338711a0d65673b]) {
            sceneroot thread [[ func ]]();
        }
    }
    if (isdefined(scenestatic) && isdefined(scenestatic.funcs) && isdefined(scenestatic.funcs[scriptbundlename]) && isdefined(scenestatic.funcs[scriptbundlename][var_8338711a0d65673b])) {
        foreach (func in scenestatic.funcs[scriptbundlename][var_8338711a0d65673b]) {
            sceneroot thread [[ func ]]();
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15c8
// Size: 0x128
function private function_14d02a749939e837(var_2a29e57c1c105d52) {
    sceneroot = self;
    shotindexes = var_2a29e57c1c105d52;
    if (isdefined(shotindexes)) {
        scenescriptbundle = sceneroot scene_scriptbundle();
        shotcount = scenescriptbundle function_d1338e27a26ecaeb();
        if (!isarray(shotindexes)) {
            shotindexes = [shotindexes];
        }
        for (i = 0; i < shotindexes.size; i++) {
            shotindex = shotindexes[i];
            if (isdefined(shotindex) && !isint(shotindex)) {
                shotindexes[i] = -1;
                for (var_b0239d47df5d0169 = 0; var_b0239d47df5d0169 < shotcount; var_b0239d47df5d0169++) {
                    shot = scenescriptbundle function_2218afa82a590ea3(var_b0239d47df5d0169);
                    shotname = shot function_55042076624e1180();
                    if (shotname == shotindex) {
                        shotindexes[i] = var_b0239d47df5d0169;
                        break;
                    }
                }
            }
        }
    } else {
        shotindexes = [];
        shotcount = sceneroot.scenedata.scenescriptbundle function_d1338e27a26ecaeb();
        for (shotindex = 0; shotindex < shotcount; shotindex++) {
            shotindexes[shotindexes.size] = shotindex;
        }
    }
    return shotindexes;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16f8
// Size: 0xc2
function private function_303476b29feb54bb(shotindices) {
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    scenescriptbundle = sceneroot scene_scriptbundle();
    shotcount = scenescriptbundle function_d1338e27a26ecaeb();
    if (!isarray(shotindices)) {
        shotindices = [shotindices];
    }
    result = function_1823ff50bb28148d("SSK");
    for (i = 0; i < shotindices.size; i++) {
        shotindex = shotindices[i];
        /#
            assert(isint(shotindex));
        #/
        result = hashcat(result, "_" + shotindex);
    }
    return result;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17c2
// Size: 0x181
function private function_e6197350552df14b(shotnames, var_94f8931d2dd061eb) {
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    shotindices = sceneroot function_14d02a749939e837(shotnames);
    sequencekey = sceneroot function_303476b29feb54bb(shotindices);
    if (isdefined(scenedata.sceneplay[sequencekey])) {
        return scenedata.sceneplay[sequencekey];
    }
    if (!istrue(var_94f8931d2dd061eb)) {
        return undefined;
    }
    sceneplay = spawnstruct();
    sceneplay.sceneroot = sceneroot;
    sceneplay.var_df5db7bd235f2729 = [];
    sceneplay.shotindices = shotindices;
    sceneplay.var_1344e48bc80d0f52 = undefined;
    for (shotindex = 0; shotindex < shotindices.size; shotindex++) {
        var_531b82ca81cb9e5c = shotindices[shotindex];
        shot = scenedata.scenescriptbundle function_2218afa82a590ea3(var_531b82ca81cb9e5c);
        if (isdefined(shot) && !shot function_d218620a1b80e648()) {
            sceneplay.var_df5db7bd235f2729[sceneplay.var_df5db7bd235f2729.size] = var_531b82ca81cb9e5c;
        }
    }
    if (isdefined(sceneplay.var_df5db7bd235f2729[0])) {
        sceneplay.shotinit = sceneplay.var_df5db7bd235f2729[0];
    } else {
        sceneplay.shotinit = 0;
    }
    scenedata.sceneplay[sequencekey] = sceneplay;
    return sceneplay;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x194b
// Size: 0x161
function private scene_coordinated_reach(sceneplay, shotindex, var_4bc185af207d5706, var_64b5ab50f22a4efc) {
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    sceneplay notify("scene_coordinated_reach");
    sceneplay endon("scene_coordinated_reach");
    if (isdefined(sceneplay.var_56ebabfb3c6985b8)) {
        sceneplay.var_56ebabfb3c6985b8 = min(sceneplay.var_56ebabfb3c6985b8, var_4bc185af207d5706);
    } else {
        sceneplay.var_56ebabfb3c6985b8 = var_4bc185af207d5706;
    }
    if (!isdefined(sceneplay.var_6909d1a5df21c351)) {
        sceneplay.var_6909d1a5df21c351 = [];
    }
    sceneplay.var_6909d1a5df21c351[sceneplay.var_6909d1a5df21c351.size] = var_64b5ab50f22a4efc;
    waittillframeend();
    sceneroot function_dca1a3a29d2ee467(sceneplay.var_6909d1a5df21c351, sceneplay.var_56ebabfb3c6985b8);
    foreach (var_64b5ab50f22a4efc in sceneplay.var_6909d1a5df21c351) {
        guy = var_64b5ab50f22a4efc[0];
        if (isdefined(guy)) {
            guy notify("scene_coordinated_reach");
        }
    }
    sceneplay.var_6909d1a5df21c351 = undefined;
    sceneplay.var_56ebabfb3c6985b8 = undefined;
}

// Namespace scene / namespace_dd27d6c3daf67646
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

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c0a
// Size: 0x120
function private reach_speed(demeanor, locomotion) {
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

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d32
// Size: 0x30
function private function_950e5107399d1111() {
    sceneplay = self;
    typefunc = function_1a2cae854fe073a0("modeStartMonitoringPlayers");
    if (isdefined(typefunc)) {
        sceneplay thread [[ typefunc ]]();
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d69
// Size: 0x2f
function private function_bc27ed6c295108d7() {
    sceneplay = self;
    typefunc = function_1a2cae854fe073a0("modeStopMonitoringPlayers");
    if (isdefined(typefunc)) {
        sceneplay [[ typefunc ]]();
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d9f
// Size: 0x23
function private function_9f853ecc68f5058() {
    typefunc = function_1a2cae854fe073a0("modeXCamRespectsStartingTimeOnClients");
    if (isdefined(typefunc)) {
        return [[ typefunc ]]();
    }
    return 0;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1dca
// Size: 0x39
function private function_a89f1262c5148bdf() {
    var_214d924f4e137244 = self;
    return default_to(var_214d924f4e137244.sceneobject.variant_object.playerlinktag, "tag_player");
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e0b
// Size: 0x2f
function private function_b6130df53fbf724c() {
    var_214d924f4e137244 = self;
    return istrue(var_214d924f4e137244.sceneobject.variant_object.var_9f78587cfefc10ac);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e42
// Size: 0x2f
function private function_3e13497ed7044cbd() {
    var_214d924f4e137244 = self;
    return istrue(var_214d924f4e137244.sceneobject.variant_object.isfemale);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e79
// Size: 0x57
function private function_ac04e049ff623301(entity, var_214d924f4e137244) {
    if (!isdefined(entity)) {
        return 0;
    }
    if (istrue(var_214d924f4e137244.scenedata.var_a416d1b334ed6b37)) {
        typefunc = function_1a2cae854fe073a0("modePlayerMatchingObjectForFemale");
        if (isdefined(typefunc)) {
            return [[ typefunc ]](entity, var_214d924f4e137244);
        }
    }
    return 1;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ed8
// Size: 0x2f
function private function_7c447098301ac4a3() {
    var_214d924f4e137244 = self;
    return istrue(var_214d924f4e137244.sceneobject.variant_object.var_9cadc424d1421646);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f0f
// Size: 0xaa
function private function_5fe020a6db35fab3(shotindex) {
    var_214d924f4e137244 = self;
    var_409dc6bbf1421f94 = ["offhand_weapons", "melee", "sprint", "allow_jump", "mantle"];
    if (!var_214d924f4e137244 function_b6130df53fbf724c()) {
        var_409dc6bbf1421f94[var_409dc6bbf1421f94.size] = "usability";
    }
    if (var_214d924f4e137244.sceneobject function_d1dd52dc1f43215d(shotindex) != "Keep") {
        var_409dc6bbf1421f94[var_409dc6bbf1421f94.size] = "weapon";
    }
    if (!var_214d924f4e137244.sceneobject function_fcc766f42b75a322(shotindex)) {
        var_409dc6bbf1421f94[var_409dc6bbf1421f94.size] = "weapon_switch";
    }
    return var_409dc6bbf1421f94;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1fc1
// Size: 0x56
function private function_285bdba488858f9e(shotindex) {
    var_214d924f4e137244 = self;
    shotobject = var_214d924f4e137244.sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.var_e6d38aba102a77d4, 0);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x201f
// Size: 0x49
function private function_e7257014ebaeeaa8(enabled) {
    /#
        assert(isplayer(self));
    #/
    player = self;
    typefunc = function_1a2cae854fe073a0("modeLetterbox");
    if (isdefined(typefunc)) {
        player thread [[ typefunc ]](enabled);
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x206f
// Size: 0x4f
function private function_bb60d8e77392c74e(tweenout, duration, hidemodel, stopxcam) {
    /#
        assert(isplayer(self));
    #/
    player = self;
    player startcameratween(duration, hidemodel, "ease_inout_sine", 0, stopxcam);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20c5
// Size: 0x94
function private function_15848d0bdc45e95e() {
    sceneplay = self;
    scenescriptbundle = sceneplay.sceneroot scene_scriptbundle();
    result = [];
    foreach (shotindex in sceneplay.var_df5db7bd235f2729) {
        result[result.size] = scenescriptbundle function_a3be29c7b9c648ef(shotindex);
    }
    return result;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2161
// Size: 0x232
function private function_218d0124f21f73b1(shotindex) {
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    scenedata = sceneroot.scenedata;
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in sceneplay.var_7038c2a13f1f5db8) {
        if (isdefined(var_19a1a40cf0ff83b9[shotindex])) {
            var_214d924f4e137244 = scenedata.var_214d924f4e137244[var_56f4af8746a2d458];
            var_214d924f4e137244.alignmentinfo = scenedata.scenescriptbundle function_ab3ec43370c405d2(sceneroot, shotindex, var_56f4af8746a2d458);
        }
    }
    sceneplay.objectorder = [];
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in sceneplay.var_7038c2a13f1f5db8) {
        addorder = [];
        for (var_bf53103eaf0d32f9 = var_56f4af8746a2d458; isdefined(var_bf53103eaf0d32f9) && isdefined(scenedata.var_214d924f4e137244[var_bf53103eaf0d32f9]) && !isdefined(sceneplay.objectorder[var_bf53103eaf0d32f9]); var_bf53103eaf0d32f9 = undefined) {
            addorder[addorder.size] = var_bf53103eaf0d32f9;
            if (!isdefined(scenedata.var_214d924f4e137244[var_bf53103eaf0d32f9].alignmentinfo)) {
                scenedata.var_214d924f4e137244[var_bf53103eaf0d32f9].alignmentinfo = scenedata.scenescriptbundle function_ab3ec43370c405d2(sceneroot, shotindex, var_56f4af8746a2d458);
            }
            nextindex = scenedata.var_214d924f4e137244[var_bf53103eaf0d32f9].alignmentinfo.var_93cd726eb6096497;
            if (isdefined(nextindex) && nextindex != var_bf53103eaf0d32f9) {
                var_bf53103eaf0d32f9 = nextindex;
                continue;
            }
        }
        for (i = addorder.size - 1; i >= 0; i--) {
            sceneplay.objectorder[addorder[i]] = sceneplay.var_7038c2a13f1f5db8[addorder[i]];
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x239a
// Size: 0x12f
function private function_e1b0a65cc436523d(shotindex) {
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    scenedata = sceneroot.scenedata;
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < scenedata.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = scenedata.var_214d924f4e137244[var_56f4af8746a2d458];
        if (isdefined(var_214d924f4e137244)) {
            var_214d924f4e137244.var_bb2bc0aa7d81de89 = undefined;
        }
    }
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in sceneplay.var_7038c2a13f1f5db8) {
        if (isdefined(var_19a1a40cf0ff83b9[shotindex])) {
            var_214d924f4e137244 = scenedata.var_214d924f4e137244[var_56f4af8746a2d458];
            var_be98a78ee33f18b8 = sceneplay.nextshot;
            if (isdefined(var_be98a78ee33f18b8)) {
                if (isdefined(var_19a1a40cf0ff83b9[var_be98a78ee33f18b8])) {
                    var_214d924f4e137244.var_bb2bc0aa7d81de89 = scenedata.scenescriptbundle function_ab3ec43370c405d2(sceneroot, var_be98a78ee33f18b8, var_56f4af8746a2d458);
                }
            }
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x24d0
// Size: 0xeb
function private function_e5b5e877417bc710(isskipping) {
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    scenedata = sceneroot.scenedata;
    sceneplay.state = "Playing";
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in sceneplay.var_7038c2a13f1f5db8) {
        var_214d924f4e137244 = scenedata.var_214d924f4e137244[var_56f4af8746a2d458];
        var_214d924f4e137244.sceneplay = sceneplay;
        var_214d924f4e137244 notify("scene_play");
    }
    sceneplay notify("scene_play");
    if (!istrue(isskipping)) {
        sceneplay thread function_888500a6dee53008();
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25c2
// Size: 0xd5
function private function_888500a6dee53008() {
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    scenedata = sceneroot.scenedata;
    if (!sceneroot function_e525ff755ac18cf6()) {
        return;
    }
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in sceneplay.var_7038c2a13f1f5db8) {
        var_214d924f4e137244 = scenedata.var_214d924f4e137244[var_56f4af8746a2d458];
        if (isplayer(var_214d924f4e137244.entity)) {
            var_214d924f4e137244.entity thread player_scene_play_wait_skip(sceneplay);
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x269e
// Size: 0x11c
function private function_317afd3b93b0b54d(player, pos) {
    sceneplay = self;
    /#
        assert(isplayer(player));
    #/
    /#
        assert(isvector(pos));
    #/
    clientnum = player getentitynumber();
    if (!isdefined(sceneplay.prestream.players)) {
        sceneplay.prestream.players = [];
    }
    if (!isdefined(sceneplay.prestream.players[clientnum])) {
        sceneplay.prestream.players[clientnum] = spawnstruct();
    }
    playerinfo = sceneplay.prestream.players[clientnum];
    playerinfo.player = player;
    if (!isdefined(playerinfo.cameraorigins)) {
        playerinfo.cameraorigins = [];
    }
    playerinfo.cameraorigins[playerinfo.cameraorigins.size] = pos;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27c1
// Size: 0xbb
function private function_da660bb71d6eb080(boolval) {
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    scenedata = sceneroot.scenedata;
    if (!isdefined(scenedata)) {
        return;
    }
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in sceneplay.var_7038c2a13f1f5db8) {
        var_214d924f4e137244 = scenedata.var_214d924f4e137244[var_56f4af8746a2d458];
        var_214d924f4e137244 function_5006f1d3bba27ce4(boolval);
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2883
// Size: 0xd2
function private player_scene_play_wait_skip(sceneplay) {
    /#
        assert(isplayer(self));
    #/
    player = self;
    player notify("player_scene_play_wait_skip");
    player endon("player_scene_play_wait_skip");
    player endon("death_or_disconnect");
    sceneplay endon("scene_stop");
    sceneplay endon("Stopped");
    player setclientomnvar("ui_is_bink_skippable", 1);
    while (true) {
        player waittillmatch("luinotifyserver", "skip_bink_input");
        if (!is_equal(sceneplay.state, "Playing")) {
            break;
        }
        player setclientomnvar("ui_is_bink_skippable", 0);
        shotnames = sceneplay function_15848d0bdc45e95e();
        sceneplay.sceneroot thread skip(shotnames, 0.5);
        return;
    }
    player setclientomnvar("ui_is_bink_skippable", 0);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x295c
// Size: 0x188
function private function_5a438716f043fddc(var_f7ab585bff4b110, var_df5db7bd235f2729) {
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    sceneplay.var_43286fd46706909c = undefined;
    if (!isdefined(var_f7ab585bff4b110) || isdefined(var_f7ab585bff4b110) && var_f7ab585bff4b110 == 0) {
        return;
    }
    var_43286fd46706909c = spawnstruct();
    var_43286fd46706909c.var_f7ab585bff4b110 = clamp(var_f7ab585bff4b110, 0, 1);
    var_43286fd46706909c.totaltimesec = 0;
    var_43286fd46706909c.var_f263562e5b98bed4 = [];
    sceneplay.var_43286fd46706909c = var_43286fd46706909c;
    foreach (shotindex in var_df5db7bd235f2729) {
        var_f263562e5b98bed4 = spawnstruct();
        var_f263562e5b98bed4.startsec = var_43286fd46706909c.totaltimesec;
        var_f263562e5b98bed4.durationsec = sceneroot function_30140edcf9e36027(sceneplay, shotindex);
        var_43286fd46706909c.var_f263562e5b98bed4[shotindex] = var_f263562e5b98bed4;
        var_43286fd46706909c.totaltimesec = var_43286fd46706909c.totaltimesec + var_f263562e5b98bed4.durationsec;
    }
    var_43286fd46706909c.fromtimesec = var_43286fd46706909c.totaltimesec * var_43286fd46706909c.var_f7ab585bff4b110;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2aeb
// Size: 0x349
function private function_afea5de3a99c09ab(sceneplay, shotindex) {
    sceneroot = self;
    success = 1;
    scenedata = sceneroot.scenedata;
    sceneplay.currentshot = shotindex;
    sceneplay function_218d0124f21f73b1(shotindex);
    sceneplay function_e1b0a65cc436523d(shotindex);
    sceneroot function_bb980ac4246f5baa(scenedata.scenescriptbundle function_a3be29c7b9c648ef(shotindex));
    sceneplay function_7c1dbb8157a07757("prepare", shotindex);
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in sceneplay.objectorder) {
        if (isdefined(var_19a1a40cf0ff83b9[shotindex])) {
            sceneroot thread function_c4b3a49a6470bd32(sceneplay, "prepare", shotindex, var_56f4af8746a2d458);
        }
    }
    sceneplay function_fef8a82cd85330df("prepare");
    /#
        var_4e7a3e672aaebeaa = getdvarint(@"hash_36ab188f318b1392", 0);
        if (var_4e7a3e672aaebeaa) {
            var_2f23edb971f368a6 = gettime();
            if (isdefined(sceneroot.var_708c03f822068263)) {
                /#
                    assert(sceneroot.var_708c03f822068263 == var_2f23edb971f368a6);
                #/
                if (sceneroot.var_708c03f822068263 != var_2f23edb971f368a6) {
                    here = 0;
                }
            }
            sceneroot.var_2f23edb971f368a6 = var_2f23edb971f368a6;
        }
    #/
    if (!istrue(sceneplay.stoprequested)) {
        /#
            sceneplay namespace_6068faad90cf91ee::function_d4cfde3fa9af7e5a(shotindex);
        #/
        sceneplay function_7c1dbb8157a07757("anim", shotindex);
        foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in sceneplay.objectorder) {
            if (isdefined(var_19a1a40cf0ff83b9[shotindex])) {
                sceneroot thread function_daa02d9da601d14d(sceneplay, "anim", shotindex, var_56f4af8746a2d458);
            }
        }
        shot = sceneroot.scenedata.scenescriptbundle function_2218afa82a590ea3(shotindex);
        if (shot function_9336a9805a4ab29a()) {
            var_73e1014ebc31c952 = sceneroot function_d9be975d8d1c9db3(shotindex, 1);
            var_40954f4dddf00c13 = function_81bab5b9c097deb5(var_73e1014ebc31c952);
            if (var_40954f4dddf00c13 > 0) {
                sceneplay delaythread(var_40954f4dddf00c13, &function_8cb9e28d833bd068, "anim");
            }
        }
        sceneplay function_fef8a82cd85330df("anim");
        /#
            if (var_4e7a3e672aaebeaa) {
                sceneroot.var_708c03f822068263 = gettime();
            }
        #/
        /#
            sceneplay namespace_6068faad90cf91ee::function_6b2bc344ea55f120();
        #/
    }
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in sceneplay.objectorder) {
        if (isdefined(var_19a1a40cf0ff83b9[shotindex])) {
            var_214d924f4e137244 = scenedata.var_214d924f4e137244[var_56f4af8746a2d458];
            if (isdefined(var_214d924f4e137244.playbacksuccessful) && !var_214d924f4e137244.playbacksuccessful) {
                success = 0;
            }
        }
    }
    sceneplay notify("scene_shot_cleanup");
    return success;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e3c
// Size: 0x76
function private function_81bab5b9c097deb5(shot_length) {
    var_9f421c699167b4eb = 50;
    if (isdefined(level.frameduration) && level.frameduration > 0) {
        var_9f421c699167b4eb = level.frameduration;
    }
    lengthms = round(shot_length * 1000);
    modms = lengthms % var_9f421c699167b4eb;
    adjustedlength = (lengthms - modms) / 1000;
    return adjustedlength;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2eba
// Size: 0x89
function private function_30140edcf9e36027(sceneplay, shotindex) {
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    maxtimesec = 0;
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < scenedata.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_ae362d23669f650 = sceneroot function_7d78fe1c5576bf4c(sceneplay, shotindex, var_56f4af8746a2d458);
        maxtimesec = max(maxtimesec, var_ae362d23669f650);
    }
    return maxtimesec;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f4b
// Size: 0xb4
function private function_7c1dbb8157a07757(objecttask, shotindex) {
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    scenedata = sceneroot.scenedata;
    sceneplay.waitobjects[objecttask] = [];
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < scenedata.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        if (isdefined(sceneplay.var_7038c2a13f1f5db8[var_56f4af8746a2d458]) && isdefined(sceneplay.var_7038c2a13f1f5db8[var_56f4af8746a2d458][shotindex])) {
            sceneplay.waitobjects[objecttask][var_56f4af8746a2d458] = var_56f4af8746a2d458;
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3006
// Size: 0x54
function private function_456603ee124b8267(objecttask, objectindex) {
    sceneplay = self;
    if (isdefined(sceneplay.waitobjects) && isdefined(sceneplay.waitobjects[objecttask])) {
        sceneplay.waitobjects[objecttask][objectindex] = undefined;
    }
    sceneplay notify(objecttask);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3061
// Size: 0x51
function private function_fef8a82cd85330df(objecttask) {
    sceneplay = self;
    while (isdefined(sceneplay.waitobjects[objecttask]) && sceneplay.waitobjects[objecttask].size > 0) {
        sceneplay waittill(objecttask);
    }
    sceneplay.waitobjects[objecttask] = undefined;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x30b9
// Size: 0xcd
function private function_8cb9e28d833bd068(objecttask) {
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    scenedata = sceneroot.scenedata;
    if (!isdefined(sceneplay)) {
        return;
    }
    if (!isdefined(sceneplay.waitobjects)) {
        return;
    }
    foreach (var_56f4af8746a2d458 in sceneplay.waitobjects[objecttask]) {
        var_214d924f4e137244 = scenedata.var_214d924f4e137244[var_56f4af8746a2d458];
        var_214d924f4e137244 function_bdd631983c9e6f5c();
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x318d
// Size: 0x15a
function private function_28f230671b0b9a1f(var_9ca58f7c9e862815) {
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    scenedata = sceneroot.scenedata;
    sceneplay.stoprequested = 1;
    sceneplay notify("scene_stop");
    sceneroot notify("scene_stop");
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < scenedata.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        if (isdefined(sceneplay.var_7038c2a13f1f5db8[var_56f4af8746a2d458])) {
            var_214d924f4e137244 = scenedata.var_214d924f4e137244[var_56f4af8746a2d458];
            sceneroot function_b9b2392985736c52(var_56f4af8746a2d458);
        }
    }
    waittillframeend();
    while (sceneplay.state == "Playing") {
        anyactive = 0;
        for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < scenedata.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
            if (isdefined(sceneplay.var_7038c2a13f1f5db8[var_56f4af8746a2d458])) {
                var_214d924f4e137244 = scenedata.var_214d924f4e137244[var_56f4af8746a2d458];
                if (isdefined(var_214d924f4e137244.active)) {
                    anyactive = 1;
                    break;
                }
            }
        }
        if (!anyactive) {
            sceneplay.state = "Stopped";
        }
        waitframe();
    }
    if (istrue(var_9ca58f7c9e862815)) {
        sceneplay function_8accfbca6fff9e0();
    }
    sceneplay.stoprequested = undefined;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32ee
// Size: 0xf9
function private function_c4b3a49a6470bd32(sceneplay, objecttask, shotindex, objectindex) {
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    var_214d924f4e137244 = scenedata.var_214d924f4e137244[objectindex];
    if (var_214d924f4e137244 ent_flag("scene_object_active")) {
        sceneroot function_b9b2392985736c52(objectindex);
    }
    var_214d924f4e137244 ent_flag_waitopen("scene_object_active");
    var_214d924f4e137244 ent_flag_set("scene_object_active");
    animtype = var_214d924f4e137244.sceneobject function_92192185fc7c5500();
    var_214d924f4e137244.var_36831a04af11576f = [];
    var_214d924f4e137244.var_36831a04af11576f[animtype] = "prepare" + shotindex + objectindex;
    var_214d924f4e137244.active = "prepare";
    var_214d924f4e137244 function_d4dcec93a1db6e3f(sceneplay, shotindex, objectindex);
    sceneplay function_456603ee124b8267(objecttask, objectindex);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x33ee
// Size: 0x5c3
function private function_daa02d9da601d14d(sceneplay, objecttask, shotindex, objectindex) {
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    var_214d924f4e137244 = scenedata.var_214d924f4e137244[objectindex];
    var_214d924f4e137244.var_36831a04af11576f = undefined;
    if (!isdefined(var_214d924f4e137244.active)) {
        sceneplay function_456603ee124b8267(objecttask, objectindex);
        return;
    }
    if (var_214d924f4e137244.sceneobject function_c2a0ad9229a93162(shotindex)) {
        sceneplay function_456603ee124b8267(objecttask, objectindex);
    }
    animated = var_214d924f4e137244.sceneobject function_938cdb6ca25882fc(shotindex);
    var_214d924f4e137244 function_770c0b047ce9cfc1(shotindex);
    var_214d924f4e137244.active = "anim";
    var_214d924f4e137244.playbacksuccessful = 1;
    var_c5edd954050d9248 = 0;
    var_e731c34c23a09be5 = 0;
    lerptime = var_214d924f4e137244.sceneobject function_1e3ba3c3afdbb7b4(shotindex);
    blendtime = var_214d924f4e137244.sceneobject function_205f7afe5d801664(shotindex);
    blendcurve = var_214d924f4e137244.sceneobject function_167ed32773c7c534(shotindex);
    overridelerp = var_214d924f4e137244 function_a680ab1ba5753613(shotindex, "lerp");
    overrideblend = var_214d924f4e137244 function_a680ab1ba5753613(shotindex, "blend");
    if (isdefined(overridelerp)) {
        lerptime = float(overridelerp);
    }
    if (isdefined(overrideblend)) {
        blendtime = float(overrideblend);
    }
    CameraAnimation = var_214d924f4e137244 function_6c3d100538f590b3(shotindex);
    var_7535cec6dfd38a5e = var_214d924f4e137244.sceneobject function_79edcc9987330a2a(shotindex);
    var_44a5342136771a97 = isarray(var_7535cec6dfd38a5e) && var_7535cec6dfd38a5e.size > 0;
    var_214d924f4e137244 function_535e6f4c06c15b1d(sceneplay, 1, 0, var_214d924f4e137244.alignmentinfo, lerptime);
    if (animated) {
        animtype = var_214d924f4e137244.sceneobject function_92192185fc7c5500();
        if (isdefined(sceneplay.var_43286fd46706909c)) {
            var_66a9a5767d99231e = sceneroot function_7d78fe1c5576bf4c(sceneplay, shotindex, objectindex);
            var_29506d8602a737a4 = sceneplay.var_43286fd46706909c.var_f263562e5b98bed4[shotindex].startsec;
            var_c5edd954050d9248 = var_29506d8602a737a4;
            var_9102eff943c3c717 = var_29506d8602a737a4 + var_66a9a5767d99231e;
            var_e731c34c23a09be5 = 0;
            if (var_9102eff943c3c717 < sceneplay.var_43286fd46706909c.fromtimesec) {
                var_214d924f4e137244.active = undefined;
                if (var_44a5342136771a97) {
                    for (animationindex = 0; animationindex < var_7535cec6dfd38a5e.size; animationindex++) {
                        var_ad746e2693353028 = animtype + shotindex + objectindex + animationindex;
                        var_214d924f4e137244 function_9605363169f7b770(var_214d924f4e137244.alignmentinfo, var_7535cec6dfd38a5e[animationindex], var_ad746e2693353028, 0, 1, animtype);
                    }
                }
                if (isdefined(CameraAnimation)) {
                    var_ad746e2693353028 = animtype + shotindex + objectindex + animationindex + 0;
                    var_214d924f4e137244 function_9605363169f7b770(var_214d924f4e137244.alignmentinfo, CameraAnimation, var_ad746e2693353028, 0, 1, "CameraAnimation");
                }
                var_214d924f4e137244 function_4479600930e9e402(0, sceneplay, objecttask, shotindex, objectindex);
                return;
            } else {
                var_c5edd954050d9248 = sceneplay.var_43286fd46706909c.fromtimesec - var_29506d8602a737a4;
            }
        }
        if (is_equal(var_214d924f4e137244.active, "anim")) {
            if (isdefined(CameraAnimation)) {
                var_ad746e2693353028 = animtype + shotindex + objectindex + 0;
                var_866b3a3066122e39 = 0;
                if (isdefined(sceneplay.var_43286fd46706909c)) {
                    var_866b3a3066122e39 = clamp(var_c5edd954050d9248 / var_214d924f4e137244 function_9c0d01ef917ee30(CameraAnimation, "CameraAnimation"), 0, 1);
                    var_214d924f4e137244 function_9605363169f7b770(var_214d924f4e137244.alignmentinfo, CameraAnimation, var_ad746e2693353028, 0, var_866b3a3066122e39, "CameraAnimation");
                }
                var_812033365bb24665 = "CameraAnimation" + shotindex + objectindex;
                var_214d924f4e137244 childthread function_c34fc4bc3e1ecbcb(shotindex, 0, var_812033365bb24665, var_214d924f4e137244.alignmentinfo, CameraAnimation, var_866b3a3066122e39, blendtime, blendcurve, lerptime, "CameraAnimation");
            }
            if (var_44a5342136771a97) {
                animationindex = 0;
                while (animationindex < var_7535cec6dfd38a5e.size) {
                    var_ad746e2693353028 = animtype + shotindex + objectindex + animationindex;
                    var_866b3a3066122e39 = 0;
                    if (var_c5edd954050d9248 > var_e731c34c23a09be5) {
                        var_1f44bab9b75c3c9 = var_214d924f4e137244 function_9c0d01ef917ee30(var_7535cec6dfd38a5e[animationindex], animtype);
                        if (var_1f44bab9b75c3c9 > 0) {
                            var_866b3a3066122e39 = clamp((var_c5edd954050d9248 - var_e731c34c23a09be5) / var_1f44bab9b75c3c9, 0, 1);
                            var_214d924f4e137244 function_9605363169f7b770(var_214d924f4e137244.alignmentinfo, var_7535cec6dfd38a5e[animationindex], var_ad746e2693353028, 0, var_866b3a3066122e39, animtype);
                            if (var_866b3a3066122e39 > 1) {
                                var_e731c34c23a09be5 = var_e731c34c23a09be5 + var_1f44bab9b75c3c9;
                                animationindex++;
                                continue;
                            }
                        } else {
                            animationindex++;
                            continue;
                        }
                    }
                    var_1f44bab9b75c3c9 = var_214d924f4e137244 function_c34fc4bc3e1ecbcb(shotindex, animationindex, var_ad746e2693353028, var_214d924f4e137244.alignmentinfo, var_7535cec6dfd38a5e[animationindex], var_866b3a3066122e39, blendtime, blendcurve, lerptime, animtype);
                    if (isdefined(var_1f44bab9b75c3c9)) {
                        var_c5edd954050d9248 = var_c5edd954050d9248 + var_1f44bab9b75c3c9;
                        var_e731c34c23a09be5 = var_e731c34c23a09be5 + var_1f44bab9b75c3c9;
                    }
                    animationindex++;
                    if (!is_equal(var_214d924f4e137244.active, "anim") || !is_equal(var_214d924f4e137244.sceneplay, sceneplay) || !isdefined(var_214d924f4e137244.scenedata)) {
                        break;
                    }
                }
            }
        }
    }
    while (isdefined(var_214d924f4e137244.var_36831a04af11576f) && var_214d924f4e137244.var_36831a04af11576f.size > 0) {
        var_214d924f4e137244 waittill("scene_anim_ended");
    }
    var_214d924f4e137244 function_4479600930e9e402(animated, sceneplay, objecttask, shotindex, objectindex);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x39b8
// Size: 0x130
function private function_4479600930e9e402(animated, sceneplay, objecttask, shotindex, objectindex) {
    var_214d924f4e137244 = self;
    if (animated && !isdefined(var_214d924f4e137244.var_77c99123aefe423b)) {
        var_d6a0e35c2c8084e7 = 0;
        if (isdefined(var_214d924f4e137244.var_bb2bc0aa7d81de89)) {
            var_d6a0e35c2c8084e7 = function_1cf2b9abf05dd81d(var_214d924f4e137244.alignmentinfo.alignent, var_214d924f4e137244.alignmentinfo.aligntag, var_214d924f4e137244.var_bb2bc0aa7d81de89.alignent, var_214d924f4e137244.var_bb2bc0aa7d81de89.aligntag);
        }
        if (!var_d6a0e35c2c8084e7) {
            var_214d924f4e137244 function_535e6f4c06c15b1d(sceneplay, 0, 0, var_214d924f4e137244.alignmentinfo);
        }
    }
    var_214d924f4e137244 function_a477eb91dc3b38b8(shotindex);
    if (var_214d924f4e137244 function_d04468979de3a6dd(sceneplay, shotindex)) {
        var_214d924f4e137244 function_f9a207358d70923c(level.framedurationseconds, "scene_play", &object_cleanup);
    }
    var_214d924f4e137244.active = undefined;
    var_214d924f4e137244 ent_flag_clear("scene_object_active");
    sceneplay function_456603ee124b8267(objecttask, objectindex);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3aef
// Size: 0xdd
function private function_157c6db3114c1ec9(sceneplay) {
    var_214d924f4e137244 = self;
    /#
        assert(isdefined(sceneplay));
    #/
    /#
        assert(isarray(sceneplay.var_df5db7bd235f2729));
    #/
    /#
        assert(isint(sceneplay.var_1344e48bc80d0f52));
    #/
    objectindex = var_214d924f4e137244.index;
    if (!isdefined(sceneplay.var_7038c2a13f1f5db8[objectindex])) {
        return false;
    }
    for (var_2d687b7add41f6a3 = sceneplay.var_1344e48bc80d0f52 + 1; var_2d687b7add41f6a3 < sceneplay.var_df5db7bd235f2729.size; var_2d687b7add41f6a3++) {
        var_1ee8422a72befa7 = sceneplay.var_df5db7bd235f2729[var_2d687b7add41f6a3];
        if (isdefined(sceneplay.var_7038c2a13f1f5db8[objectindex][var_1ee8422a72befa7])) {
            return true;
        }
    }
    return false;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3bd4
// Size: 0x153
function private function_d04468979de3a6dd(sceneplay, shotindex) {
    var_214d924f4e137244 = self;
    sceneroot = var_214d924f4e137244.sceneroot;
    scenedata = sceneroot.scenedata;
    if (!isdefined(scenedata)) {
        return true;
    }
    if (!is_equal(sceneplay, var_214d924f4e137244.sceneplay)) {
        return false;
    }
    if (isdefined(var_214d924f4e137244.var_77c99123aefe423b)) {
        return false;
    }
    if (sceneroot.scenedata.scenescriptbundle function_4f93a0dfb8fd6a47()) {
        return false;
    }
    if (!var_214d924f4e137244.sceneobject function_938cdb6ca25882fc(shotindex)) {
        return false;
    }
    if (sceneplay.var_df5db7bd235f2729.size == 0 || shotindex == sceneplay.var_df5db7bd235f2729[sceneplay.var_df5db7bd235f2729.size - 1]) {
        return true;
    }
    deletetype = var_214d924f4e137244.sceneobject function_d5f4474a16f90132();
    if (var_214d924f4e137244.sceneobject function_c77857d663e8cfbe() == "Types_XCam" || deletetype == "DeleteAlwaysNotInvolved" || deletetype == "DeleteSpawnedNotInvolved" && !istrue(var_214d924f4e137244.existingentity)) {
        if (!var_214d924f4e137244 function_157c6db3114c1ec9(sceneplay)) {
            return true;
        }
    }
    return false;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d2f
// Size: 0x165
function private function_7d78fe1c5576bf4c(sceneplay, shotindex, objectindex) {
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    var_214d924f4e137244 = scenedata.var_214d924f4e137244[objectindex];
    if (isdefined(sceneplay.var_43286fd46706909c) && isdefined(sceneplay.var_43286fd46706909c.var_f263562e5b98bed4[shotindex])) {
        return sceneplay.var_43286fd46706909c.var_f263562e5b98bed4[shotindex].durationsec;
    }
    deltatimesec = 0;
    cameratimesec = 0;
    CameraAnimation = var_214d924f4e137244 function_6c3d100538f590b3(shotindex);
    if (isdefined(CameraAnimation)) {
        shottimesec = var_214d924f4e137244 function_9c0d01ef917ee30(CameraAnimation, "CameraAnimation");
    }
    animtype = var_214d924f4e137244.sceneobject function_92192185fc7c5500();
    var_7535cec6dfd38a5e = var_214d924f4e137244.sceneobject function_79edcc9987330a2a(shotindex);
    for (animationindex = 0; animationindex < var_7535cec6dfd38a5e.size; animationindex++) {
        deltatimesec = deltatimesec + var_214d924f4e137244 function_9c0d01ef917ee30(var_7535cec6dfd38a5e[animationindex], animtype);
    }
    return max(cameratimesec, deltatimesec);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3e9c
// Size: 0x83
function private function_b9b2392985736c52(var_56f4af8746a2d458) {
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    var_214d924f4e137244 = scenedata.var_214d924f4e137244[var_56f4af8746a2d458];
    var_214d924f4e137244.active = undefined;
    var_214d924f4e137244.playbacksuccessful = 0;
    var_214d924f4e137244 notify("scene_stop");
    var_214d924f4e137244 function_bdd631983c9e6f5c();
    var_214d924f4e137244 function_9b8055c613f1bb31();
    var_214d924f4e137244 ent_flag_clear("scene_object_active");
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f26
// Size: 0x1c0
function private function_c643b2c6b794481e(newstate) {
    sceneroot = self;
    /#
        assert(newstate != "Playing");
    #/
    /#
        assert(newstate != "Stopped");
    #/
    if (isdefined(sceneroot.scenedata) && sceneroot.scenedata.state != newstate) {
        if (newstate != "NotInit") {
            sceneroot.scenedata.state = newstate;
            sceneroot function_2549c341bf1ae3e7(sceneroot.scenedata.state);
            return;
        }
        /#
            assert(sceneroot.scenedata.state == "NotSetup");
        #/
        if (isdefined(sceneroot.scenedata.var_214d924f4e137244) && isdefined(sceneroot.scenedata.scenescriptbundle)) {
            objectcount = sceneroot.scenedata.scenescriptbundle function_291cd2f1089d3a94();
            if (isdefined(objectcount)) {
                for (objectindex = 0; objectindex < objectcount; objectindex++) {
                    if (objectindex < sceneroot.scenedata.var_214d924f4e137244.size) {
                        sceneroot.scenedata.var_214d924f4e137244[objectindex].scenedata = undefined;
                    }
                }
            }
        }
        function_680ff86fdba6e483(sceneroot.scenedata.scriptbundle);
        /#
            sceneroot function_86051e11e7b7a98e();
        #/
        sceneroot.scenedata.sceneroot = undefined;
        sceneroot.scenedata = undefined;
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40ed
// Size: 0xbc
function private function_2549c341bf1ae3e7(state) {
    sceneroot = self;
    if (isdefined(sceneroot.scenestatic) && isdefined(sceneroot.scenestatic.notifyobject) && isdefined(sceneroot.scenestatic.notifyevent)) {
        if (!isdefined(sceneroot.scenestatic.notifymatch) || sceneroot.scenestatic.notifymatch == state) {
            sceneroot.scenestatic.notifyobject notify(sceneroot.scenestatic.notifyevent);
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41b0
// Size: 0x1a
function private function_6c0e3626ebce826f() {
    sceneroot = self;
    return sceneroot.var_8ac77218f7a34e3e;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41d2
// Size: 0x87
function private scene_scriptbundle() {
    sceneroot = self;
    sceneroot function_bd09568f76dd40ca();
    if (!isdefined(sceneroot.scenedata.scriptbundle)) {
        scenescriptbundlename = sceneroot function_6c0e3626ebce826f();
        if (isdefined(scenescriptbundlename)) {
            sceneroot.scenedata.scriptbundle = function_5e9baece4185ee1e(hashcat(%"scenescriptbundle:", scenescriptbundlename));
        }
    }
    return sceneroot.scenedata.scriptbundle;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4261
// Size: 0x6c
function private function_7855ec4caf5901f9(typename, funcname, func) {
    function_ace39e84230f386();
    if (!isdefined(level.scene.objecthandlers[typename])) {
        level.scene.objecthandlers[typename] = [];
    }
    level.scene.objecthandlers[typename][funcname] = func;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x42d4
// Size: 0x26d
function private function_5a197e7b54a9091e() {
    /#
        assert(isdefined(level.scene.objecthandlers));
    #/
    /#
        assert(isdefined(level.scene.objecthandlers["Types_Object"]));
    #/
    /#
        assert(!isdefined(level.scene.var_8a6cbf5e0998e58d));
    #/
    level.scene.var_8a6cbf5e0998e58d = [];
    var_a05b670b818e941c = ["Types_Object", "Types_Prop", "Types_Actor", "Types_Player", "Types_EnemyPlayer", "Types_FakePlayer", "Types_FakeActor", "Types_Vehicle", "Types_Mayhem", "Types_XCam"];
    foreach (var_c311f4d2b460f074 in var_a05b670b818e941c) {
        level.scene.var_8a6cbf5e0998e58d[var_c311f4d2b460f074] = [];
        foreach (functype, func in level.scene.objecthandlers["Types_Object"]) {
            level.scene.var_8a6cbf5e0998e58d[var_c311f4d2b460f074][functype] = func;
        }
    }
    foreach (var_c311f4d2b460f074, functable in level.scene.objecthandlers) {
        if (var_c311f4d2b460f074 == "Types_Object") {
            continue;
        }
        foreach (functype, func in functable) {
            level.scene.var_8a6cbf5e0998e58d[var_c311f4d2b460f074][functype] = func;
        }
    }
    level.scene.objecthandlers = undefined;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4548
// Size: 0x5e
function private function_9d3850b024ab89b1(funcname, func) {
    function_ace39e84230f386();
    if (!isdefined(level.scene.modehandlers)) {
        level.scene.modehandlers = [];
    }
    level.scene.modehandlers[funcname] = func;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x45ad
// Size: 0x47
function private function_1a2cae854fe073a0(functype) {
    typefunc = undefined;
    if (isdefined(level.scene.modehandlers)) {
        typefunc = level.scene.modehandlers[functype];
    }
    return typefunc;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x45fc
// Size: 0x17
function private function_8a786f133d7341c0(functype) {
    return self.functable[functype];
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x461b
// Size: 0x379
function private object_spawn(alignmentinfo, shotinit) {
    var_214d924f4e137244 = self;
    scenestatic = var_214d924f4e137244.sceneroot.scenestatic;
    entity = undefined;
    var_c311f4d2b460f074 = var_214d924f4e137244.sceneobject function_c77857d663e8cfbe();
    var_373a2c3b02b1d81c = var_214d924f4e137244.sceneobject function_992de34e05c5cea7();
    var_6fc4d2978cf27bef = var_214d924f4e137244.sceneobject function_12eb9fd56334261c();
    var_982109bda19f3517 = var_214d924f4e137244.sceneobject function_aeb2b46911a5811d();
    spawnorigin = alignmentinfo.origin;
    spawnangles = alignmentinfo.angles;
    if (isdefined(shotinit)) {
        var_7535cec6dfd38a5e = var_214d924f4e137244.sceneobject function_79edcc9987330a2a(shotinit);
        if (isdefined(var_7535cec6dfd38a5e) && var_7535cec6dfd38a5e.size > 0 && isanimation(var_7535cec6dfd38a5e[0])) {
            spawnorigin = getstartorigin(alignmentinfo.origin, alignmentinfo.angles, var_7535cec6dfd38a5e[0]);
            spawnangles = getstartangles(alignmentinfo.origin, alignmentinfo.angles, var_7535cec6dfd38a5e[0]);
        }
    }
    /#
        function_ce4b6d4d859ede39(var_214d924f4e137244, "scene_shot", spawnorigin, spawnangles);
    #/
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectSpawn");
    if (isdefined(typefunc) && typefunc != &object_spawn) {
        entity = var_214d924f4e137244 [[ typefunc ]](spawnorigin, spawnangles);
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
    if (isdefined(entity) && !isplayer(entity) && isdefined(scenestatic) && isdefined(scenestatic.spawnfunctions)) {
        entity.var_214d924f4e137244 = var_214d924f4e137244;
        checktables = [var_982109bda19f3517, var_c311f4d2b460f074, "_object_all_"];
        foreach (tablename in checktables) {
            if (isdefined(scenestatic.spawnfunctions[tablename])) {
                foreach (spawnfunc in scenestatic.spawnfunctions[tablename]) {
                    entity thread [[ spawnfunc ]]();
                }
            }
        }
    }
    if (isdefined(entity)) {
        switch (var_214d924f4e137244.sceneobject function_b5a77eb340ad5552()) {
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

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x499c
// Size: 0x19b
function private function_3e19c1b49e591d34(spawnorigin, spawnangles) {
    var_214d924f4e137244 = self;
    entity = undefined;
    var_373a2c3b02b1d81c = var_214d924f4e137244.sceneobject function_992de34e05c5cea7();
    var_6fc4d2978cf27bef = var_214d924f4e137244.sceneobject function_12eb9fd56334261c();
    if (var_373a2c3b02b1d81c == "xmodel" || var_373a2c3b02b1d81c == "xcompositemodel") {
        entity = spawn("script_model", spawnorigin);
        if (isdefined(entity)) {
            entity val::set("scene_scene", "cinematics_participant", 1);
            entity.angles = spawnangles;
            entity setmodel(var_6fc4d2978cf27bef);
            animtree = var_214d924f4e137244.sceneobject function_c106523f3836b90b();
            if (isdefined(animtree)) {
                entity useanimtree(animtree);
            }
            entity namespace_c5f7e08ad7ea4280::function_d5f76e611c78509a();
        }
    } else if (var_373a2c3b02b1d81c == "character") {
        character = function_1823ff50bb28148d(var_6fc4d2978cf27bef);
        if (isdefined(level.fncharacter) && isdefined(level.fncharacter[character])) {
            entity = spawn("script_model", spawnorigin);
            if (isdefined(entity)) {
                entity val::set("scene_scene", "cinematics_participant", 1);
                func = level.fncharacter[character];
                entity [[ func ]]();
                entity.angles = spawnangles;
                animtree = var_214d924f4e137244.sceneobject function_c106523f3836b90b();
                if (isdefined(animtree)) {
                    entity useanimtree(animtree);
                }
                entity namespace_c5f7e08ad7ea4280::function_d5f76e611c78509a();
            }
        }
    }
    return entity;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b3f
// Size: 0x8e
function private function_476ef6856b76fadb(var_fa1af9d2277fd747) {
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244)) {
        return;
    }
    if (isdefined(var_214d924f4e137244.sceneplay) && isdefined(var_214d924f4e137244.active)) {
        var_214d924f4e137244.sceneplay function_456603ee124b8267(var_214d924f4e137244.active, var_214d924f4e137244.index);
    }
    var_214d924f4e137244 function_bdd631983c9e6f5c();
    var_214d924f4e137244 object_cleanup(var_fa1af9d2277fd747);
    var_214d924f4e137244 ent_flag_clear("scene_object_active");
    var_214d924f4e137244.entity = undefined;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4bd4
// Size: 0x12e
function private function_6acd8ab4606e2a09(sceneroot, sceneplay, entity, existing, inittype) {
    var_214d924f4e137244 = self;
    if (isdefined(entity) && isdefined(entity.var_214d924f4e137244) && !is_equal(sceneplay, entity.var_214d924f4e137244.sceneplay)) {
        if (inittype != "scene_init_prestream" && entity.var_214d924f4e137244 != var_214d924f4e137244) {
            /#
                assert(var_214d924f4e137244 != entity.var_214d924f4e137244 || !is_equal(sceneplay, entity.var_214d924f4e137244.sceneplay));
            #/
            entity.var_214d924f4e137244 function_476ef6856b76fadb(sceneroot);
        }
    }
    if (isent(var_214d924f4e137244.entity)) {
        if (var_214d924f4e137244.entity == entity) {
            return;
        }
        if (!istrue(var_214d924f4e137244.existingentity)) {
            var_214d924f4e137244 object_cleanup();
            var_214d924f4e137244 object_delete();
        }
    }
    var_214d924f4e137244.entity = entity;
    var_214d924f4e137244.existingentity = existing;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d09
// Size: 0x184
function private object_setup(sceneplay) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244.sceneplay = sceneplay;
    if (isdefined(var_214d924f4e137244.entity)) {
        var_982109bda19f3517 = var_214d924f4e137244.sceneobject function_aeb2b46911a5811d();
        var_43ae35d311ef0ccc = var_214d924f4e137244.sceneobject function_c106523f3836b90b();
        var_214d924f4e137244 function_729a3f3943f35748(var_982109bda19f3517, var_43ae35d311ef0ccc);
        if (!isdefined(var_214d924f4e137244.var_f143eb748d8b5556)) {
            var_214d924f4e137244.var_f143eb748d8b5556 = var_214d924f4e137244.entity.dontmelee;
        }
        var_214d924f4e137244.entity.dontmelee = 1;
        var_214d924f4e137244.entity ent_flag_set("scene_active");
        if (isplayer(var_214d924f4e137244.entity)) {
            if (var_214d924f4e137244.scenedata.scenescriptbundle function_295cf85da8fa8653()) {
                var_214d924f4e137244.entity val::set("scene_scene", "show_hud", 0);
            }
        }
    }
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectSetup");
    if (isdefined(typefunc) && typefunc != &object_setup) {
        var_214d924f4e137244 [[ typefunc ]](sceneplay);
    }
    if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity.var_214d924f4e137244 = var_214d924f4e137244;
    }
    var_214d924f4e137244.issetup = 1;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e94
// Size: 0x165
function private function_729a3f3943f35748(animname, animtree) {
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.entity)) {
        return;
    }
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectSetAnimName");
    if (isdefined(typefunc) && typefunc != &function_729a3f3943f35748) {
        var_214d924f4e137244 [[ typefunc ]](animname, animtree);
        return;
    }
    if (isdefined(animname)) {
        if (!isplayer(var_214d924f4e137244.entity) && isdefined(animtree) && (!isdefined(var_214d924f4e137244.entity.animtree) || var_214d924f4e137244.entity.animtree == "")) {
            if (!isdefined(var_214d924f4e137244.animtreeprevious)) {
                var_214d924f4e137244.animtreeprevious = var_214d924f4e137244.entity.animtree;
            }
            var_214d924f4e137244.entity useanimtree(animtree);
        }
        if (!isdefined(var_214d924f4e137244.entity.animname)) {
            var_214d924f4e137244.entity.animname = animname;
        }
        return;
    }
    if (isdefined(var_214d924f4e137244.animtreeprevious)) {
        var_214d924f4e137244.entity useanimtree(var_214d924f4e137244.animtreeprevious);
    }
    var_214d924f4e137244.animtreeprevious = undefined;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5000
// Size: 0x69
function private function_bdfc45b799d27532(var_4f3089070d8b1e24) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244.var_53c962747bd1f2f = undefined;
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectSetAnimPlaying");
    if (isdefined(typefunc) && typefunc != &function_bdfc45b799d27532) {
        var_214d924f4e137244 [[ typefunc ]](var_4f3089070d8b1e24);
        return;
    }
    var_214d924f4e137244.var_53c962747bd1f2f = var_4f3089070d8b1e24;
    var_214d924f4e137244 notify("scene_anim_playing", var_4f3089070d8b1e24);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5070
// Size: 0xe1
function private function_5006f1d3bba27ce4(boolval) {
    var_214d924f4e137244 = self;
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectParticipatingCinematics");
    if (isdefined(typefunc) && typefunc != &function_5006f1d3bba27ce4) {
        var_214d924f4e137244 [[ typefunc ]](boolval);
        return;
    }
    entities = var_214d924f4e137244 function_f054a83311d7f448();
    if (isarray(entities)) {
        foreach (entity in entities) {
            if (isent(entity)) {
                if (istrue(boolval)) {
                    entity val::set("scene_scene", "cinematics_participant", 1);
                    continue;
                }
                entity val::reset("scene_scene", "cinematics_participant");
            }
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x5158
// Size: 0x3d
function private function_2142970a7a74d1f2(endonevent, func, param1, param2) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 thread function_a3511922b90bf177(endonevent, func, param1, param2);
}

// Namespace scene / namespace_dd27d6c3daf67646
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
                endonevent = [endonevent];
            }
            foreach (endonname in endonevent) {
                entity endon(endonname);
            }
        }
        var_214d924f4e137244 waittill("scene_anim_playing");
    }
    if (isdefined(param2)) {
        entity builtin [[ func ]](param1, param2);
        return;
    }
    if (isdefined(param1)) {
        entity builtin [[ func ]](param1);
        return;
    }
    entity builtin [[ func ]]();
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5296
// Size: 0xb4
function private function_6a4d64bdba27cb06(animrate) {
    var_214d924f4e137244 = self;
    animrate = default_to(animrate, 1);
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectSetAnimRate");
    if (isdefined(typefunc) && typefunc != &function_6a4d64bdba27cb06) {
        var_214d924f4e137244 [[ typefunc ]](animrate);
        return;
    }
    if (isdefined(var_214d924f4e137244.var_77c99123aefe423b) && isdefined(var_214d924f4e137244.var_41dc93404af773a3) && var_214d924f4e137244.var_41dc93404af773a3 == "DeltaAnimation") {
        entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
        if (isdefined(entity)) {
            entity setanimrate(var_214d924f4e137244.var_77c99123aefe423b, animrate);
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5351
// Size: 0x86
function private function_380708345e16e475(var_4f3089070d8b1e24, timefrac) {
    var_214d924f4e137244 = self;
    timefrac = default_to(timefrac, 0);
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectSetAnimTime");
    if (isdefined(typefunc) && typefunc != &function_380708345e16e475) {
        var_214d924f4e137244 [[ typefunc ]](var_4f3089070d8b1e24, timefrac);
        return;
    }
    entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    if (isdefined(entity)) {
        entity setanimtime(var_4f3089070d8b1e24, timefrac);
        entity dontinterpolate();
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x53de
// Size: 0xe5
function private function_db16fb604c5ca71d(lerptime, velocity) {
    var_214d924f4e137244 = self;
    lerptime = default_to(lerptime, 0);
    velocity = default_to(velocity, (0, 0, 0));
    waittillframeend();
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectSetAnimLerp");
    if (isdefined(typefunc) && typefunc != &function_db16fb604c5ca71d) {
        var_214d924f4e137244 [[ typefunc ]](lerptime, velocity);
        return;
    }
    entities = var_214d924f4e137244 function_f054a83311d7f448();
    foreach (entity in entities) {
        if (isanimscripted(entity)) {
            entity function_4beb9f7715504995(lerptime, velocity);
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x54ca
// Size: 0xc7
function private function_bf2f06d70b4e15ad(enabled) {
    var_214d924f4e137244 = self;
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectSetProcBones");
    if (isdefined(typefunc) && typefunc != &function_bf2f06d70b4e15ad) {
        var_214d924f4e137244 [[ typefunc ]](enabled);
        return;
    }
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

// Namespace scene / namespace_dd27d6c3daf67646
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
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectMatchEntity");
    if (isdefined(typefunc) && typefunc != &function_2294fe71a7c1d8d6) {
        return var_214d924f4e137244 [[ typefunc ]](entity);
    }
    return entity.classname == "script_model";
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x560c
// Size: 0x1c0
function private function_1ba5fc9ef8e19620(sceneroot, sceneplay, var_982109bda19f3517, matchset, var_11e3bd5dd8eea638, existing, inittype) {
    var_214d924f4e137244 = self;
    if (isarray(matchset)) {
        if (isdefined(var_214d924f4e137244.entity)) {
            foreach (var_f638bf84f355737e, existingent in matchset) {
                if (isent(existingent) && var_214d924f4e137244 function_2294fe71a7c1d8d6(existingent)) {
                    if (existingent == var_214d924f4e137244.entity || isdefined(existingent.animname) && isdefined(var_214d924f4e137244.entity.animname) && existingent.animname == var_214d924f4e137244.entity.animname) {
                        var_214d924f4e137244 function_6acd8ab4606e2a09(sceneroot, sceneplay, existingent, existing, inittype);
                        matchset[var_f638bf84f355737e] = undefined;
                        break;
                    }
                }
            }
            return matchset;
        }
        foreach (var_f638bf84f355737e, existingent in matchset) {
            if (isent(existingent) && var_214d924f4e137244 function_2294fe71a7c1d8d6(existingent)) {
                if (!istrue(var_11e3bd5dd8eea638) || isdefined(existingent.animname) && existingent.animname == var_982109bda19f3517) {
                    var_214d924f4e137244 function_6acd8ab4606e2a09(sceneroot, sceneplay, existingent, existing, inittype);
                    matchset[var_f638bf84f355737e] = undefined;
                    break;
                }
            }
        }
    }
    return matchset;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x57d4
// Size: 0x12f
function private function_53687c7001a0784b(sceneroot, sceneplay, var_982109bda19f3517, usedset, keyname, inittype) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244 function_6acd8ab4606e2a09(sceneroot, sceneplay, var_214d924f4e137244.entity, 1, inittype);
        entnum = var_214d924f4e137244.entity getentitynumber();
        usedset[entnum] = var_214d924f4e137244.entity;
        return usedset;
    }
    foundentities = getentarray(var_982109bda19f3517, keyname);
    foreach (foundent in foundentities) {
        entnum = foundent getentitynumber();
        if (isdefined(usedset) && isdefined(usedset[entnum])) {
            continue;
        }
        if (var_214d924f4e137244 function_2294fe71a7c1d8d6(foundent)) {
            var_214d924f4e137244 function_6acd8ab4606e2a09(sceneroot, sceneplay, foundent, 1, inittype);
            usedset[entnum] = foundent;
            break;
        }
    }
    return usedset;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x590b
// Size: 0x57
function private function_4c4c2a548b9fc7ab() {
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.entity)) {
        return undefined;
    }
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectGetAnimEntity");
    if (isdefined(typefunc) && typefunc != &function_4c4c2a548b9fc7ab) {
        return var_214d924f4e137244 [[ typefunc ]]();
    }
    return var_214d924f4e137244.entity;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x596a
// Size: 0x53
function private function_f054a83311d7f448() {
    var_214d924f4e137244 = self;
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectGetLinkEnts");
    if (isdefined(typefunc) && typefunc != &function_f054a83311d7f448) {
        return var_214d924f4e137244 [[ typefunc ]]();
    }
    animentity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    return [animentity];
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x59c5
// Size: 0x70
function private function_b9c245bf99df4a8() {
    var_214d924f4e137244 = self;
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectGetAnimRoot");
    if (isdefined(typefunc) && typefunc != &function_b9c245bf99df4a8) {
        return var_214d924f4e137244 [[ typefunc ]]();
    }
    entity = function_4c4c2a548b9fc7ab();
    if (isdefined(entity) && isdefined(entity.anim_getrootfunc)) {
        return [[ entity.anim_getrootfunc ]]();
    }
    return undefined;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5a3d
// Size: 0xf0
function private object_teleport(origin, angles) {
    var_214d924f4e137244 = self;
    /#
        function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>", origin, angles);
    #/
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectTeleport");
    if (isdefined(typefunc) && typefunc != &object_teleport) {
        var_214d924f4e137244 [[ typefunc ]](origin, angles);
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

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5b34
// Size: 0x48
function private object_velocity() {
    var_214d924f4e137244 = self;
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectVelocity");
    if (isdefined(typefunc) && typefunc != &object_velocity) {
        return var_214d924f4e137244 [[ typefunc ]]();
    }
    return (0, 0, 0);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5b84
// Size: 0x52
function private function_1cf2b9abf05dd81d(previousentity, previoustag, newentity, newtag) {
    if (!isdefined(previousentity)) {
        return false;
    }
    if (!isdefined(newentity)) {
        return false;
    }
    if (previousentity != newentity) {
        return false;
    }
    if (!isdefined(previoustag)) {
        return false;
    }
    if (!isdefined(newtag)) {
        return false;
    }
    if (previoustag != newtag) {
        return false;
    }
    return true;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5bde
// Size: 0x471
function private function_535e6f4c06c15b1d(sceneplay, blink, bsetup, alignmentinfo, lerptime) {
    var_214d924f4e137244 = self;
    if (istrue(blink)) {
        function_e4fc30ccdca08b9d(alignmentinfo);
    }
    linkents = var_214d924f4e137244 function_f054a83311d7f448();
    if (istrue(bsetup) && isdefined(sceneplay) && !var_214d924f4e137244 function_d82945c5509ec28e(sceneplay.shotinit)) {
        return;
    }
    foreach (entity in linkents) {
        if (!isent(entity)) {
            continue;
        }
        linkedparent = entity getlinkedparent();
        if (!isdefined(alignmentinfo) || !isent(alignmentinfo.alignent)) {
            if (isdefined(linkedparent)) {
                entity unlink();
            }
            return;
        }
        if (istrue(blink)) {
            prevorigin = entity.origin;
            prevangles = entity.angles;
            var_80cc7e738d1c353f = function_1cf2b9abf05dd81d(var_214d924f4e137244.linkedent, var_214d924f4e137244.linkedtag, alignmentinfo.alignent, alignmentinfo.aligntag);
            if (!var_80cc7e738d1c353f && alignmentinfo.alignent != entity && !entity isragdoll() && (!isdefined(linkedparent) || linkedparent != alignmentinfo.alignent || default_to(var_214d924f4e137244.linkedtag, "") != default_to(alignmentinfo.aligntag, ""))) {
                if (!isdefined(lerptime) || lerptime <= 0) {
                    var_214d924f4e137244 object_teleport(alignmentinfo.origin, alignmentinfo.angles);
                }
                if (isstring(alignmentinfo.aligntag)) {
                    /#
                        function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + alignmentinfo.aligntag, alignmentinfo.alignent gettagorigin(alignmentinfo.aligntag), alignmentinfo.alignent gettagangles(alignmentinfo.aligntag));
                    #/
                    if (isplayer(entity)) {
                        entity playerlinkto(alignmentinfo.alignent, alignmentinfo.aligntag);
                    } else if (isagent(entity)) {
                        entity linktomoveoffset(alignmentinfo.alignent, alignmentinfo.aligntag);
                        entity playerlinkedoffsetenable();
                        entity fixlinktointerpolationbug(1);
                    } else {
                        entity linkto(alignmentinfo.alignent, alignmentinfo.aligntag, (0, 0, 0), (0, 0, 0));
                    }
                    var_214d924f4e137244.linkedtag = alignmentinfo.aligntag;
                    var_214d924f4e137244.linkedent = alignmentinfo.alignent;
                    if (isdefined(lerptime) && lerptime > 0) {
                        var_214d924f4e137244 object_teleport(prevorigin, prevangles);
                    }
                } else {
                    /#
                        function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>", entity.origin, entity.angles);
                    #/
                    var_214d924f4e137244.linkedtag = undefined;
                    var_214d924f4e137244.linkedent = alignmentinfo.alignent;
                    if (isplayer(entity)) {
                        entity playerlinkto(alignmentinfo.alignent);
                    } else if (isagent(entity)) {
                        entity linktomoveoffset(alignmentinfo.alignent);
                        entity playerlinkedoffsetenable();
                        entity fixlinktointerpolationbug(1);
                    } else {
                        entity linkto(alignmentinfo.alignent);
                    }
                }
            }
            continue;
        }
        if (isdefined(linkedparent) && linkedparent == alignmentinfo.alignent) {
            /#
                function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>", entity.origin, entity.angles);
            #/
            entity unlink();
            var_214d924f4e137244.linkedtag = undefined;
            var_214d924f4e137244.linkedent = undefined;
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6056
// Size: 0x1b9
function private function_9745e01cedd81c85(alignmentinfo, shotindex) {
    var_214d924f4e137244 = self;
    shotindex = default_to(shotindex, var_214d924f4e137244.sceneplay.shotinit);
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectFirstFrame");
    if (isdefined(typefunc) && typefunc != &function_9745e01cedd81c85) {
        var_214d924f4e137244 [[ typefunc ]](alignmentinfo, shotindex);
        return;
    }
    if (!isdefined(var_214d924f4e137244.entity)) {
        return;
    }
    var_7535cec6dfd38a5e = var_214d924f4e137244.sceneobject function_79edcc9987330a2a(shotindex);
    if (var_7535cec6dfd38a5e.size != 0) {
        entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
        var_4f3089070d8b1e24 = var_7535cec6dfd38a5e[0];
        if (isent(entity) && entity.model != "") {
            entity stopanimscripted();
            entity.origin = getstartorigin(alignmentinfo.origin, alignmentinfo.angles, var_4f3089070d8b1e24);
            entity.angles = getstartangles(alignmentinfo.origin, alignmentinfo.angles, var_4f3089070d8b1e24);
            entity setanimknob(var_4f3089070d8b1e24, 1, 0, 0);
            entity setanimtime(var_4f3089070d8b1e24, 0);
            entity dontinterpolate();
            /#
                function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + function_3c8848a3a11b2553(getanimname(var_4f3089070d8b1e24)), entity.origin, entity.angles);
            #/
            /#
                function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + function_3c8848a3a11b2553(getanimname(var_4f3089070d8b1e24)), alignmentinfo.origin, alignmentinfo.angles);
            #/
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6216
// Size: 0x3d
function private function_744a16ccecd8e4dd() {
    var_214d924f4e137244 = self;
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectCanAnimate");
    if (isdefined(typefunc) && typefunc != &function_744a16ccecd8e4dd) {
        return var_214d924f4e137244 [[ typefunc ]]();
    }
    return 1;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 10, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x625b
// Size: 0x470
function private function_c34fc4bc3e1ecbcb(shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, animationtype) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244.var_41dc93404af773a3 = animationtype;
    var_214d924f4e137244.var_77c99123aefe423b = var_4f3089070d8b1e24;
    var_214d924f4e137244 function_16714fbc8955e6c7(shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, animationtype);
    if (isdefined(animationtype)) {
        var_214d924f4e137244.var_36831a04af11576f[animationtype] = notifystring;
    }
    animationtype = default_to(animationtype, "DeltaAnimation");
    animplaybacktime = 0;
    if (isent(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity notify("scene_play_anim");
    }
    var_214d924f4e137244 notify("scene_play_anim");
    if (animationtype == "DeltaAnimation") {
        if (!isent(var_214d924f4e137244.entity)) {
            n_anim_length = getanimlength(var_4f3089070d8b1e24);
            var_214d924f4e137244 utility::waittill_any_timeout_1(n_anim_length, "scene_anim_ended");
            var_214d924f4e137244 function_bf0d14daf3e53248(var_4f3089070d8b1e24, animationtype, notifystring);
            var_214d924f4e137244 function_68056529c69f4097(animationtype, shotindex, animindex);
            return;
        }
        anim_entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
        if (!isdefined(anim_entity) || anim_entity.model == "") {
            var_214d924f4e137244 function_bf0d14daf3e53248(var_4f3089070d8b1e24, animationtype, notifystring);
            var_214d924f4e137244 function_68056529c69f4097(animationtype, shotindex, animindex);
            return;
        }
        if (var_214d924f4e137244.sceneobject function_84eff20f9e29c7f6(shotindex)) {
            function_e4fc30ccdca08b9d(alignmentinfo);
            var_214d924f4e137244 function_9745e01cedd81c85(var_214d924f4e137244.alignmentinfo, shotindex);
            var_214d924f4e137244 function_bf0d14daf3e53248(var_4f3089070d8b1e24, animationtype, notifystring);
            var_214d924f4e137244 function_68056529c69f4097(animationtype, shotindex, animindex);
            return;
        }
        var_214d924f4e137244.entity endon("death_or_disconnect");
        anim_entity endon("death_or_disconnect");
        var_214d924f4e137244 thread object_play_anim_waittill_end(var_4f3089070d8b1e24, [var_214d924f4e137244.entity, anim_entity], "death_or_disconnect", animationtype, notifystring);
        /#
            debugname = function_3c8848a3a11b2553(getanimname(var_4f3089070d8b1e24));
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + debugname, alignmentinfo.origin, alignmentinfo.angles);
        #/
        typefunc = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectPlayAnim");
        if (isdefined(typefunc) && typefunc != &function_c34fc4bc3e1ecbcb) {
            animplaybacktime = var_214d924f4e137244 [[ typefunc ]](shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime);
        }
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + debugname, alignmentinfo.origin, alignmentinfo.angles);
        #/
    } else if (animationtype == "CameraAnimation") {
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_4f3089070d8b1e24, alignmentinfo.origin, alignmentinfo.angles);
        #/
        typefunc = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectPlayAnim");
        if (isdefined(typefunc) && typefunc != &function_c34fc4bc3e1ecbcb) {
            animplaybacktime = var_214d924f4e137244 [[ typefunc ]](shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime);
        }
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_4f3089070d8b1e24, alignmentinfo.origin, alignmentinfo.angles);
        #/
    } else if (animationtype == "MayhemAnimation") {
        if (var_214d924f4e137244.sceneobject function_84eff20f9e29c7f6(shotindex)) {
            function_e4fc30ccdca08b9d(alignmentinfo);
            var_214d924f4e137244 function_9745e01cedd81c85(var_214d924f4e137244.alignmentinfo);
            var_214d924f4e137244 function_bf0d14daf3e53248(var_4f3089070d8b1e24, animationtype, notifystring);
            var_214d924f4e137244 function_68056529c69f4097(animationtype, shotindex, animindex);
            return;
        }
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_4f3089070d8b1e24, alignmentinfo.origin, alignmentinfo.angles);
        #/
        typefunc = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectPlayAnim");
        if (isdefined(typefunc) && typefunc != &function_c34fc4bc3e1ecbcb) {
            animplaybacktime = var_214d924f4e137244 [[ typefunc ]](shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime);
        }
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_4f3089070d8b1e24, alignmentinfo.origin, alignmentinfo.angles);
        #/
    }
    var_214d924f4e137244 function_bf0d14daf3e53248(var_4f3089070d8b1e24, animationtype, notifystring);
    var_214d924f4e137244 function_68056529c69f4097(animationtype, shotindex, animindex);
    return animplaybacktime;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x66d3
// Size: 0x9d
function private object_play_anim_waittill_end(var_4f3089070d8b1e24, var_23a35a13a8548fe6, waitfor, animationtype, notifystring) {
    var_214d924f4e137244 = self;
    if (isdefined(var_4f3089070d8b1e24) && is_equal(animationtype, "DeltaAnimation")) {
        suffix = function_f28fd66285fa2c9(getanimname(var_4f3089070d8b1e24));
    } else {
        suffix = "";
    }
    var_214d924f4e137244 notify("object_play_anim_waittill_end" + suffix);
    var_214d924f4e137244 endon("object_play_anim_waittill_end" + suffix);
    waittill_any_ents_array(var_23a35a13a8548fe6, waitfor);
    if (isdefined(var_214d924f4e137244)) {
        var_214d924f4e137244 thread function_bf0d14daf3e53248(var_4f3089070d8b1e24, animationtype, notifystring);
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6777
// Size: 0x18e
function private function_bf0d14daf3e53248(var_4f3089070d8b1e24, animationtype, notifystring) {
    var_214d924f4e137244 = self;
    if (isdefined(var_4f3089070d8b1e24) && is_equal(animationtype, "DeltaAnimation")) {
        suffix = function_f28fd66285fa2c9(getanimname(var_4f3089070d8b1e24));
    } else {
        suffix = "";
    }
    var_214d924f4e137244 notify("object_play_anim_waittill_end" + suffix);
    ended = 0;
    if (isdefined(var_214d924f4e137244.var_36831a04af11576f)) {
        foreach (var_41dc93404af773a3, activenotifystring in var_214d924f4e137244.var_36831a04af11576f) {
            if (!isdefined(animationtype) || animationtype == var_41dc93404af773a3) {
                if (!isdefined(notifystring) || notifystring == activenotifystring) {
                    var_214d924f4e137244 notify(activenotifystring, "end");
                    ended = 1;
                }
            }
        }
    }
    if (ended) {
        if (isdefined(animationtype)) {
            var_214d924f4e137244.var_36831a04af11576f[animationtype] = undefined;
        } else {
            var_214d924f4e137244.var_36831a04af11576f = undefined;
        }
    }
    if (!isdefined(var_4f3089070d8b1e24) || isdefined(var_214d924f4e137244.var_41dc93404af773a3) && var_214d924f4e137244.var_41dc93404af773a3 == animationtype && is_equal(var_214d924f4e137244.var_77c99123aefe423b, var_4f3089070d8b1e24)) {
        var_214d924f4e137244.var_77c99123aefe423b = undefined;
        var_214d924f4e137244.var_41dc93404af773a3 = undefined;
        var_214d924f4e137244.var_53c962747bd1f2f = undefined;
    }
    var_214d924f4e137244 notify("scene_anim_ended");
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x690c
// Size: 0x80
function private function_8e9f8e1fbe2b7ab4(notifystring, var_4f3089070d8b1e24) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 childthread function_924dc6425bd2b70d(notifystring);
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectWaitNotes");
    if (isdefined(typefunc) && typefunc != &function_8e9f8e1fbe2b7ab4) {
        var_214d924f4e137244 [[ typefunc ]](notifystring, var_4f3089070d8b1e24);
        return;
    }
    entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    if (isdefined(entity)) {
        var_214d924f4e137244 childthread start_notetrack_wait(entity, notifystring, undefined, undefined, var_4f3089070d8b1e24);
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6993
// Size: 0xf5
function private function_9605363169f7b770(alignmentinfo, var_4f3089070d8b1e24, notifystring, var_866b3a3066122e39, var_1cbffacca2bd0d4c, animationtype) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    if (animationtype == "DeltaAnimation") {
        typefunc = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectSkipAnim");
        if (isdefined(typefunc) && typefunc != &function_9605363169f7b770) {
            var_214d924f4e137244 [[ typefunc ]](alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, var_1cbffacca2bd0d4c);
            return;
        }
        if (isdefined(entity) && entity.model != "") {
            entity animscripted(notifystring, alignmentinfo.origin, alignmentinfo.angles, var_4f3089070d8b1e24);
            entity setanimtime(var_4f3089070d8b1e24, var_866b3a3066122e39);
            if (!(function_8581f011ce975a6(var_4f3089070d8b1e24) && var_1cbffacca2bd0d4c == 1)) {
                entity setanimtime(var_4f3089070d8b1e24, var_1cbffacca2bd0d4c);
            }
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6a8f
// Size: 0x18d
function private function_924dc6425bd2b70d(notifystring, var_d091096ced443a73) {
    var_214d924f4e137244 = self;
    scenestatic = var_214d924f4e137244.sceneroot.scenestatic;
    if (!isdefined(scenestatic) || !isdefined(scenestatic.notifies)) {
        return;
    }
    var_c311f4d2b460f074 = var_214d924f4e137244.sceneobject function_c77857d663e8cfbe();
    var_982109bda19f3517 = var_214d924f4e137244.sceneobject function_aeb2b46911a5811d();
    notifies = [];
    checktables = [var_982109bda19f3517, var_c311f4d2b460f074, "_object_all_"];
    foreach (tablename in checktables) {
        if (isdefined(scenestatic.notifies[tablename])) {
            notifies = array_combine(notifies, scenestatic.notifies[tablename]);
        }
    }
    foreach (notifyitem in notifies) {
        if (!isdefined(var_d091096ced443a73) || var_d091096ced443a73 == notifyitem) {
            var_214d924f4e137244 thread function_c9fbe2a0f09e68b0(notifystring, notifyitem);
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6c23
// Size: 0x42
function private function_c9fbe2a0f09e68b0(notifystring, notifyitem) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    if (isdefined(entity)) {
        entity function_5ecd1fd13181af98(notifystring, notifyitem, var_214d924f4e137244);
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6c6c
// Size: 0x1aa
function private object_shot_death_wait(sceneplay, shotindex, var_56f4af8746a2d458) {
    var_214d924f4e137244 = self;
    sceneroot = var_214d924f4e137244.sceneroot;
    scenedata = sceneroot.scenedata;
    var_214d924f4e137244 notify("object_shot_death_wait");
    var_214d924f4e137244 endon("object_shot_death_wait");
    deathanim = var_214d924f4e137244.sceneobject function_f731c1198ec2b72f(shotindex);
    var_fe3c33d4dd6936af = var_214d924f4e137244.sceneobject function_becdf44d08cc1faf();
    if (!var_fe3c33d4dd6936af && !isdefined(deathanim)) {
        return;
    }
    sceneplay endon("scene_shot_cleanup");
    entity = var_214d924f4e137244.entity;
    if (isalive(entity)) {
        entity val::set("scene_shot", "death", 0);
        while (entity.health > 1) {
            entity waittill("damage");
        }
        if (var_fe3c33d4dd6936af) {
            sceneroot thread stop();
        }
        if (isdefined(entity) && isdefined(deathanim)) {
            animentity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
            if (isdefined(animentity)) {
                animtype = var_214d924f4e137244.sceneobject function_92192185fc7c5500();
                notifystring = var_214d924f4e137244.var_36831a04af11576f[animtype];
                var_214d924f4e137244.var_36831a04af11576f[animtype] = undefined;
                var_214d924f4e137244 function_c34fc4bc3e1ecbcb(shotindex, -1, notifystring, var_214d924f4e137244.alignmentinfo, deathanim);
            }
        }
        entity val::set("scene_shot", "death", 1);
        var_214d924f4e137244 object_kill();
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6e1d
// Size: 0x58
function private function_9c0d01ef917ee30(var_4f3089070d8b1e24, animationtype) {
    switch (animationtype) {
    case #"hash_db2a102a7b3b4349":
        return getanimlength(var_4f3089070d8b1e24);
    case #"hash_3c9daf4fd5203d1c":
        return function_c55e2627715b3a72(var_4f3089070d8b1e24);
    case #"hash_eb9c9817350b0b1e":
        break;
    }
    return 0;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6e7d
// Size: 0xca
function private function_bdd631983c9e6f5c() {
    var_214d924f4e137244 = self;
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectAnimEnd");
    if (isdefined(typefunc) && typefunc != &function_bdd631983c9e6f5c) {
        var_214d924f4e137244 [[ typefunc ]]();
    } else if (isdefined(var_214d924f4e137244.entity) && isdefined(var_214d924f4e137244.var_36831a04af11576f)) {
        foreach (message in var_214d924f4e137244.var_36831a04af11576f) {
            var_214d924f4e137244.entity notify(message, "end");
        }
    }
    var_214d924f4e137244.var_36831a04af11576f = undefined;
}

// Namespace scene / namespace_dd27d6c3daf67646
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
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectStopAnim");
    if (isdefined(typefunc) && typefunc != &function_9b8055c613f1bb31) {
        var_214d924f4e137244 [[ typefunc ]]();
    } else if (isdefined(var_214d924f4e137244.entity) && isdefined(var_214d924f4e137244.var_41dc93404af773a3) && var_214d924f4e137244.var_41dc93404af773a3 == "DeltaAnimation") {
        var_214d924f4e137244.entity stopanimscripted();
    }
    var_214d924f4e137244.var_41dc93404af773a3 = undefined;
    var_214d924f4e137244.var_77c99123aefe423b = undefined;
    var_214d924f4e137244.var_a3ff79ae166c57aa = var_214d924f4e137244.var_53c962747bd1f2f;
    var_214d924f4e137244.var_53c962747bd1f2f = undefined;
    var_214d924f4e137244 function_bf0d14daf3e53248();
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7061
// Size: 0x122
function private object_cleanup(var_fa1af9d2277fd747) {
    var_214d924f4e137244 = self;
    if (istrue(var_214d924f4e137244.issetup)) {
        var_214d924f4e137244 function_535e6f4c06c15b1d(undefined, 0, 0, var_214d924f4e137244.alignmentinfo);
        typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectCleanup");
        if (isdefined(typefunc) && typefunc != &object_cleanup) {
            var_214d924f4e137244 [[ typefunc ]](var_fa1af9d2277fd747);
        }
        if (isdefined(var_214d924f4e137244.entity)) {
            var_214d924f4e137244.entity val::reset_all("scene_scene");
            var_214d924f4e137244.entity ent_flag_clear("scene_active");
            var_214d924f4e137244.entity.var_214d924f4e137244 = undefined;
            var_214d924f4e137244 function_729a3f3943f35748(undefined, undefined);
            if (isdefined(var_214d924f4e137244.var_f143eb748d8b5556)) {
                var_214d924f4e137244.entity.dontmelee = var_214d924f4e137244.var_f143eb748d8b5556;
            }
        }
        var_214d924f4e137244 notify("scene_ai_stealth");
        if (!isdefined(var_fa1af9d2277fd747) && var_214d924f4e137244 function_cdec4d1452eba0d8()) {
            var_214d924f4e137244 object_delete();
        }
        var_214d924f4e137244.issetup = undefined;
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x718a
// Size: 0x82
function private function_cdec4d1452eba0d8() {
    var_214d924f4e137244 = self;
    deletetype = var_214d924f4e137244.sceneobject function_d5f4474a16f90132();
    DeleteAlways = deletetype == "DeleteAlways" || deletetype == "DeleteAlwaysNotInvolved";
    DeleteSpawned = (deletetype == "DeleteSpawned" || deletetype == "DeleteSpawnedNotInvolved") && !istrue(var_214d924f4e137244.existingentity);
    if (DeleteAlways || DeleteSpawned) {
        return true;
    }
    return false;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7214
// Size: 0x62
function private object_kill() {
    var_214d924f4e137244 = self;
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectKill");
    if (isdefined(typefunc) && typefunc != &object_kill) {
        var_214d924f4e137244 [[ typefunc ]]();
        return;
    }
    if (isalive(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity kill();
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x727d
// Size: 0xcf
function private object_delete() {
    var_214d924f4e137244 = self;
    /#
        if (isdefined(var_214d924f4e137244.entity)) {
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>", var_214d924f4e137244.entity.origin, var_214d924f4e137244.entity.angles);
        }
    #/
    namespace_c5f7e08ad7ea4280::function_b6e23e71bb7ad50f(var_214d924f4e137244.entity);
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectDelete");
    if (isdefined(typefunc) && typefunc != &object_delete) {
        var_214d924f4e137244 [[ typefunc ]]();
    } else if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity delete();
    }
    var_214d924f4e137244.entity = undefined;
    var_214d924f4e137244.existingentity = undefined;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7353
// Size: 0x4d
function private function_2f2327d535ed0bb() {
    var_214d924f4e137244 = self;
    if (istrue(var_214d924f4e137244.xcamplaying)) {
        if (isplayer(var_214d924f4e137244.entity)) {
            var_214d924f4e137244.entity stopxcam();
        }
        var_214d924f4e137244.xcamplaying = undefined;
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x73a7
// Size: 0x340
function private function_b62972e8f5541b26(sceneplay, shotindex) {
    var_214d924f4e137244 = self;
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectPreStream");
    if (isdefined(typefunc) && typefunc != &function_b62972e8f5541b26) {
        var_214d924f4e137244 [[ typefunc ]](sceneplay, shotindex);
    }
    var_214d924f4e137244 function_e4fc30ccdca08b9d(var_214d924f4e137244.alignmentinfo);
    if (isdefined(var_214d924f4e137244.alignmentinfo)) {
        CameraAnimation = var_214d924f4e137244 function_6c3d100538f590b3(shotindex);
        var_7535cec6dfd38a5e = var_214d924f4e137244.sceneobject function_79edcc9987330a2a(shotindex);
        if (isplayer(var_214d924f4e137244.entity)) {
            player = var_214d924f4e137244.entity;
            var_a9b43fd80025b224 = undefined;
            if (isdefined(CameraAnimation)) {
                var_a9b43fd80025b224 = player getxcamposition(CameraAnimation, 0, 0, var_214d924f4e137244.alignmentinfo.origin, var_214d924f4e137244.alignmentinfo.angles);
            } else if (isdefined(var_7535cec6dfd38a5e) && var_7535cec6dfd38a5e.size > 0) {
                linktag = var_214d924f4e137244 function_a89f1262c5148bdf();
                animentity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
                offset = (0, 0, player getplayerviewheight());
                if (isdefined(animentity)) {
                    var_742d65eb48a1aafd = animentity function_d2e8597ff01310ed(var_7535cec6dfd38a5e[0], linktag, 0, var_214d924f4e137244.alignmentinfo.origin, var_214d924f4e137244.alignmentinfo.angles);
                    if (isdefined(var_742d65eb48a1aafd)) {
                        var_a9b43fd80025b224 = var_742d65eb48a1aafd["origin"];
                        offset = rotatevector(offset, var_742d65eb48a1aafd["angles"]);
                    }
                }
                if (!isdefined(var_a9b43fd80025b224)) {
                    var_a9b43fd80025b224 = getstartorigin(var_214d924f4e137244.alignmentinfo.origin, var_214d924f4e137244.alignmentinfo.angles, var_7535cec6dfd38a5e[0]);
                }
                if (!is_equal(linktag, "tag_camera")) {
                    var_a9b43fd80025b224 = var_a9b43fd80025b224 + offset;
                }
            }
            if (isdefined(var_a9b43fd80025b224)) {
                /#
                    function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>", var_a9b43fd80025b224, (0, 0, 0));
                #/
                playerinfo = sceneplay function_317afd3b93b0b54d(player, var_a9b43fd80025b224);
            }
        }
        if (isdefined(var_7535cec6dfd38a5e) && var_7535cec6dfd38a5e.size > 0) {
            entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
            if (isdefined(entity)) {
                if (var_214d924f4e137244 function_7f90ebd0aa7ad958(shotindex)) {
                    objectorigin = getstartorigin(var_214d924f4e137244.alignmentinfo.origin, var_214d924f4e137244.alignmentinfo.angles, var_7535cec6dfd38a5e[0]);
                } else {
                    objectorigin = var_214d924f4e137244.alignmentinfo.origin;
                }
                objectinfo = spawnstruct();
                objectinfo.origin = objectorigin;
                objectinfo.entity = entity;
                sceneplay.prestream.objects[sceneplay.prestream.objects.size] = objectinfo;
            }
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x76ee
// Size: 0xc8
function private function_d4dcec93a1db6e3f(sceneplay, shotindex, var_56f4af8746a2d458) {
    var_214d924f4e137244 = self;
    sceneplay endon("scene_stop");
    var_214d924f4e137244 endon("scene_stop");
    foreach (message in var_214d924f4e137244.var_36831a04af11576f) {
        var_214d924f4e137244 endon(message);
    }
    var_214d924f4e137244 childthread object_shot_death_wait(sceneplay, shotindex, var_56f4af8746a2d458);
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectPrepare");
    if (isdefined(typefunc) && typefunc != &function_d4dcec93a1db6e3f) {
        var_214d924f4e137244 [[ typefunc ]](sceneplay, shotindex, var_56f4af8746a2d458);
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x77bd
// Size: 0x245
function private function_770c0b047ce9cfc1(shotindex) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        if (var_214d924f4e137244.sceneobject function_7a553773a0af8bcd(shotindex)) {
            var_214d924f4e137244.entity val::set("scene_scene", "hide", 1);
            var_214d924f4e137244.entity val::set("scene_scene", "ignoreall", 1);
            var_214d924f4e137244.entity val::set("scene_scene", "ignoreme", 1);
        }
        if (var_214d924f4e137244.sceneobject function_8ed9853e35162b7c(shotindex)) {
            var_214d924f4e137244.entity val::reset("scene_scene", "hide");
            var_214d924f4e137244.entity show();
            var_214d924f4e137244.entity val::reset("scene_scene", "ignoreall");
            var_214d924f4e137244.entity val::reset("scene_scene", "ignoreme");
        }
        if (!var_214d924f4e137244.sceneobject function_fc9281240877df76()) {
            var_214d924f4e137244.entity val::set("scene_shot", "damage", 0);
        }
        if (isplayer(var_214d924f4e137244.entity)) {
            tweenin = var_214d924f4e137244.sceneobject function_6cf39bfd67cda93a(shotindex);
            if (tweenin > 0) {
                viewmodelvisible = var_214d924f4e137244.sceneobject function_a8485c8c63aa2cc3(shotindex);
                stopxcam = var_214d924f4e137244.sceneobject function_4040a1e0bb19e02f(shotindex);
                /#
                    function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_214d924f4e137244.entity getentitynumber(), var_214d924f4e137244.entity.origin, var_214d924f4e137244.entity.angles);
                #/
                var_214d924f4e137244.entity function_bb60d8e77392c74e(0, tweenin, !istrue(viewmodelvisible), stopxcam);
            }
        }
    }
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectSetup");
    if (isdefined(typefunc) && typefunc != &function_770c0b047ce9cfc1) {
        var_214d924f4e137244 [[ typefunc ]](shotindex);
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7a09
// Size: 0x47
function private function_d82945c5509ec28e(shotindex) {
    var_214d924f4e137244 = self;
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectLinkSetup");
    if (isdefined(typefunc) && typefunc != &function_d82945c5509ec28e) {
        return var_214d924f4e137244 [[ typefunc ]](shotindex);
    }
    return 1;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7a58
// Size: 0x170
function private function_a477eb91dc3b38b8(shotindex) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity val::reset_all("scene_shot");
        if (isplayer(var_214d924f4e137244.entity)) {
            tweenout = var_214d924f4e137244.sceneobject function_be64404b86d48153(shotindex);
            if (tweenout > 0) {
                viewmodelvisible = var_214d924f4e137244.sceneobject function_c5c4ac51272db146(shotindex);
                stopxcam = var_214d924f4e137244.sceneobject function_51bd4cd630963c3a(shotindex);
                /#
                    function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + var_214d924f4e137244.entity getentitynumber(), var_214d924f4e137244.entity.origin, var_214d924f4e137244.entity.angles);
                #/
                var_214d924f4e137244.entity function_bb60d8e77392c74e(1, tweenout, !istrue(viewmodelvisible), stopxcam);
            }
        }
    }
    if (isent(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity notify("scene_shot_cleanup");
    }
    var_214d924f4e137244 notify("scene_shot_cleanup");
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectCleanup");
    if (isdefined(typefunc) && typefunc != &function_a477eb91dc3b38b8) {
        var_214d924f4e137244 [[ typefunc ]](shotindex);
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7bcf
// Size: 0x6e
function private function_6c3d100538f590b3(shotindex) {
    var_214d924f4e137244 = self;
    sceneobject = var_214d924f4e137244.sceneobject;
    CameraAnimation = sceneobject.variant_object.shots[shotindex].CameraAnimation;
    if (isdefined(CameraAnimation) && CameraAnimation == "") {
        CameraAnimation = undefined;
    }
    return CameraAnimation;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7c45
// Size: 0x69
function private function_7f90ebd0aa7ad958(shotindex) {
    var_214d924f4e137244 = self;
    sceneobject = var_214d924f4e137244.sceneobject;
    var_f403b8bef0c4a943 = sceneobject function_1d5820595bc2d310(shotindex);
    var_badc9307ea231fbe = !istrue(sceneobject.variant_object.var_adbd47886f23e1a2);
    return var_f403b8bef0c4a943 && var_badc9307ea231fbe;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7cb6
// Size: 0xff
function private function_b4d836fe99f480e(shotindex) {
    var_214d924f4e137244 = self;
    sceneobject = var_214d924f4e137244.sceneobject;
    shotobject = sceneobject.variant_object.shots[shotindex];
    var_80db383140a106e8 = istrue(shotobject.removeweapon);
    var_1dc8da8f86fd9a5b = istrue(sceneobject.variant_object.removeweapon);
    var_62df8bf2c6dd7fc6 = undefined;
    if (isplayer(var_214d924f4e137244.entity) || !isdefined(var_214d924f4e137244.entity)) {
        var_62df8bf2c6dd7fc6 = 1;
    } else {
        entity_weapon = var_214d924f4e137244.entity.weapon;
        var_62df8bf2c6dd7fc6 = isdefined(entity_weapon) && !isnullweapon(entity_weapon);
    }
    if ((var_80db383140a106e8 || var_1dc8da8f86fd9a5b) && var_62df8bf2c6dd7fc6) {
        return true;
    }
    return false;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7dbd
// Size: 0x79
function private function_5a65e42126f29a4f(shotindex, overridetype, overridevalue) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244.shotoverrides = default_to(var_214d924f4e137244.shotoverrides, []);
    var_214d924f4e137244.shotoverrides[overridetype] = default_to(var_214d924f4e137244.shotoverrides[overridetype], []);
    var_214d924f4e137244.shotoverrides[overridetype][shotindex] = overridevalue;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7e3d
// Size: 0x62
function private function_a680ab1ba5753613(shotindex, overridetype) {
    var_214d924f4e137244 = self;
    /#
        assert(isint(shotindex));
    #/
    if (!isdefined(var_214d924f4e137244.shotoverrides)) {
        return undefined;
    }
    if (!isdefined(var_214d924f4e137244.shotoverrides[overridetype])) {
        return undefined;
    }
    return var_214d924f4e137244.shotoverrides[overridetype][shotindex];
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ea7
// Size: 0x284
function private function_225d78e3c485a7ae(shotindexes, sceneplay, var_56f4af8746a2d458) {
    var_214d924f4e137244 = self;
    scenedata = var_214d924f4e137244.scenedata;
    scenestatic = var_214d924f4e137244.sceneroot.scenestatic;
    if (var_214d924f4e137244.sceneobject function_cb6926d352c405c7()) {
        return 0;
    }
    if (isdefined(scenestatic) && istrue(scenestatic.excludeplayers) && var_214d924f4e137244 object_get_type() == "Types_Player") {
        return 0;
    }
    if (isdefined(scenestatic) && isdefined(scenestatic.var_8f28f8f196c70a58) && scenestatic.var_8f28f8f196c70a58 && var_214d924f4e137244 object_get_type() != "Types_Player") {
        return 0;
    }
    if (!isarray(shotindexes)) {
        shotindexes = [shotindexes];
    }
    result = 0;
    foreach (shotindex in shotindexes) {
        doeshide = var_214d924f4e137244.sceneobject function_7a553773a0af8bcd(shotindex);
        doesshow = var_214d924f4e137244.sceneobject function_8ed9853e35162b7c(shotindex);
        animated = var_214d924f4e137244.sceneobject function_938cdb6ca25882fc(shotindex);
        if (!animated || doeshide || doesshow) {
            if (isdefined(sceneplay) && isdefined(var_56f4af8746a2d458)) {
                if (!isdefined(sceneplay.var_7038c2a13f1f5db8[var_56f4af8746a2d458])) {
                    sceneplay.var_7038c2a13f1f5db8[var_56f4af8746a2d458] = [];
                }
                sceneplay.var_7038c2a13f1f5db8[var_56f4af8746a2d458][shotindex] = 1;
                result = 1;
            } else {
                return 1;
            }
            continue;
        }
        var_7535cec6dfd38a5e = var_214d924f4e137244.sceneobject function_79edcc9987330a2a(shotindex);
        CameraAnimation = var_214d924f4e137244 function_6c3d100538f590b3(shotindex);
        if (var_7535cec6dfd38a5e.size != 0 || isdefined(CameraAnimation)) {
            if (isdefined(sceneplay) && isdefined(var_56f4af8746a2d458)) {
                if (!isdefined(sceneplay.var_7038c2a13f1f5db8[var_56f4af8746a2d458])) {
                    sceneplay.var_7038c2a13f1f5db8[var_56f4af8746a2d458] = [];
                }
                sceneplay.var_7038c2a13f1f5db8[var_56f4af8746a2d458][shotindex] = 1;
                result = 1;
                continue;
            }
            return 1;
        }
    }
    return result;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8133
// Size: 0x20
function private object_get_type() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244.sceneobject function_c77857d663e8cfbe();
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x815b
// Size: 0xc
function private function_c77857d663e8cfbe() {
    return self.variant_type;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x816f
// Size: 0x37
function private function_92192185fc7c5500() {
    sceneobject = self;
    animtype = "DeltaAnimation";
    if (sceneobject function_c77857d663e8cfbe() == "Types_Mayhem") {
        animtype = "MayhemAnimation";
    }
    return animtype;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x81ae
// Size: 0xaf
function private function_992de34e05c5cea7() {
    sceneobject = self;
    if (isdefined(sceneobject.variant_object.aitypename)) {
        return "aitype";
    }
    if (isdefined(sceneobject.variant_object.charactername)) {
        return "character";
    }
    if (isdefined(sceneobject.variant_object.vehiclename)) {
        return "vehicle";
    }
    if (isdefined(sceneobject.variant_object.var_2d53850266558c60)) {
        return "xcompositemodel";
    }
    if (isdefined(sceneobject.variant_object.xmodelname)) {
        return "xmodel";
    }
    return "mayhem";
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8265
// Size: 0xe0
function private function_12eb9fd56334261c() {
    sceneobject = self;
    if (isdefined(sceneobject.variant_object.aitypename)) {
        return sceneobject.variant_object.aitypename;
    }
    if (isdefined(sceneobject.variant_object.charactername)) {
        return sceneobject.variant_object.charactername;
    }
    if (isdefined(sceneobject.variant_object.vehiclename)) {
        return sceneobject.variant_object.vehiclename;
    }
    if (isdefined(sceneobject.variant_object.var_2d53850266558c60)) {
        return sceneobject.variant_object.var_2d53850266558c60;
    }
    return sceneobject.variant_object.xmodelname;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x834d
// Size: 0x24
function private function_aeb2b46911a5811d() {
    sceneobject = self;
    return sceneobject.variant_object.name;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8379
// Size: 0x25
function private function_83ba0b38ef7f3949() {
    sceneobject = self;
    return istrue(sceneobject.variant_object.firstframe);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x83a6
// Size: 0x4c
function private function_84eff20f9e29c7f6(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return isdefined(shotobject) && istrue(shotobject.firstframeonly);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x83fa
// Size: 0x25
function private function_cb6926d352c405c7() {
    sceneobject = self;
    return istrue(sceneobject.variant_object.disabled);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8427
// Size: 0x2f
function private function_d5f4474a16f90132() {
    sceneobject = self;
    return default_to(sceneobject.variant_object.deletetype, "None");
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x845e
// Size: 0x2f
function private function_b5a77eb340ad5552() {
    sceneobject = self;
    return default_to(sceneobject.variant_object.globaltype, "None");
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8495
// Size: 0x25
function private function_fc9281240877df76() {
    sceneobject = self;
    return istrue(sceneobject.variant_object.takedamage);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x84c2
// Size: 0x25
function private function_becdf44d08cc1faf() {
    sceneobject = self;
    return istrue(sceneobject.variant_object.var_6da5cfc338f95f28);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x84ef
// Size: 0x49
function private function_c106523f3836b90b() {
    sceneobject = self;
    if (isdefined(sceneobject.variant_object.animtree)) {
        return sceneobject.variant_object.animtree.id;
    }
    return undefined;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8540
// Size: 0x25
function private function_d301ab09c0738edf() {
    sceneobject = self;
    return istrue(sceneobject.variant_object.var_eb6d97710680539f);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x856d
// Size: 0x10c
function private function_79edcc9987330a2a(shotindex) {
    sceneobject = self;
    animations = [];
    objtype = sceneobject function_c77857d663e8cfbe();
    switch (objtype) {
    case #"hash_873689dd62a87ffa":
        var_7535cec6dfd38a5e = sceneobject.variant_object.shots[shotindex].var_e608c28a92676233;
        if (isdefined(var_7535cec6dfd38a5e)) {
            for (animationindex = 0; animationindex < var_7535cec6dfd38a5e.size; animationindex++) {
                animations[animationindex] = var_7535cec6dfd38a5e[animationindex].MayhemAnimation;
            }
        }
        break;
    default:
        var_7535cec6dfd38a5e = sceneobject.variant_object.shots[shotindex].var_45d86f20e184e36a;
        if (isdefined(var_7535cec6dfd38a5e)) {
            for (animationindex = 0; animationindex < var_7535cec6dfd38a5e.size; animationindex++) {
                animations[animationindex] = var_7535cec6dfd38a5e[animationindex].DeltaAnimation.id;
            }
        }
        break;
    }
    return animations;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8681
// Size: 0x1b0
function private function_698798987ca7073(shotindex) {
    sceneobject = self;
    lengths = [];
    objtype = sceneobject function_c77857d663e8cfbe();
    if (shotindex < 0 || shotindex > sceneobject.variant_object.shots.size - 1) {
        return lengths;
    }
    switch (objtype) {
    case #"hash_873689dd62a87ffa":
        var_7535cec6dfd38a5e = sceneobject.variant_object.shots[shotindex].var_e608c28a92676233;
        if (isdefined(var_7535cec6dfd38a5e)) {
            animationcount = var_7535cec6dfd38a5e.size;
            for (animationindex = 0; animationindex < animationcount; animationindex++) {
                lengths[animationindex] = 0;
                if (isdefined(var_7535cec6dfd38a5e[animationindex].framecount) && isdefined(var_7535cec6dfd38a5e[animationindex].framerate)) {
                    lengths[animationindex] = var_7535cec6dfd38a5e[animationindex].framecount * 1 / float(var_7535cec6dfd38a5e[animationindex].framerate);
                }
            }
        }
        break;
    default:
        var_7535cec6dfd38a5e = sceneobject.variant_object.shots[shotindex].var_45d86f20e184e36a;
        if (isdefined(var_7535cec6dfd38a5e)) {
            animationcount = var_7535cec6dfd38a5e.size;
            for (animationindex = 0; animationindex < animationcount; animationindex++) {
                lengths[animationindex] = 0;
                if (isanimation(var_7535cec6dfd38a5e[animationindex].DeltaAnimation.id)) {
                    lengths[animationindex] = getanimlength(var_7535cec6dfd38a5e[animationindex].DeltaAnimation.id);
                }
            }
        }
        break;
    }
    return lengths;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8839
// Size: 0x60
function private function_f731c1198ec2b72f(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    if (isdefined(shotobject.deathanim)) {
        return shotobject.deathanim.id;
    }
    return undefined;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88a1
// Size: 0x47
function private function_938cdb6ca25882fc(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return !istrue(shotobject.var_c60d7dc962b40dab);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88f0
// Size: 0x47
function private function_1d5820595bc2d310(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return !istrue(shotobject.var_adbd47886f23e1a2);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x893f
// Size: 0x46
function private function_7a553773a0af8bcd(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return istrue(shotobject.preparehide);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x898d
// Size: 0x46
function private function_8ed9853e35162b7c(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return istrue(shotobject.prepareshow);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x89db
// Size: 0x50
function private function_1e3ba3c3afdbb7b4(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.float_lerptime, 0);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a33
// Size: 0x50
function private function_205f7afe5d801664(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.float_blendtime, 0.2);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a8b
// Size: 0x50
function private function_167ed32773c7c534(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.blendcurve, "linear");
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8ae3
// Size: 0x46
function private function_2917c4d9acc44d9(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return istrue(shotobject.lookatplayer);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8b31
// Size: 0x50
function private function_8b6dcfac0d2921ad(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.reachtype, "Teleport");
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8b89
// Size: 0x50
function private function_ceabc6a1e0fac4cf(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.arrivaltype, "Exposed");
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8be1
// Size: 0x50
function private function_1b712c4c79096ef9(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.var_7db06d4a4c1afffa, "DEFAULT");
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8c39
// Size: 0x50
function private function_b56c0812b975be8(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.var_d223a5b14195b3ef, "DEFAULT");
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8c91
// Size: 0x50
function private function_8f11c2704d4c19c3(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.locomotionstart, "DEFAULT");
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ce9
// Size: 0x50
function private function_d1dd52dc1f43215d(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.weaponuse, "DropQuick");
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8d41
// Size: 0x4d
function private function_fcc766f42b75a322(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.weaponswitch, 1);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8d96
// Size: 0x55
function private function_892812e26790e793(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return tolower(default_to(shotobject.stancebegin, "stand"));
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8df3
// Size: 0x55
function private function_c3345343cc0eb8ab(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return tolower(default_to(shotobject.stanceend, "stand"));
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8e50
// Size: 0x4d
function private function_16b4cb7e4c5af0fd(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.var_52c388f739467cb0, 45);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ea5
// Size: 0x4d
function private function_918dc2e0c83784b6(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.var_1f406d98a26a7085, 45);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8efa
// Size: 0x4d
function private function_b06da1547120edef(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.var_88317c7614e6553c, 15);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8f4f
// Size: 0x4d
function private function_be3310ec58dd9807(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.var_169ec6c28c4aae8a, 15);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8fa4
// Size: 0x4d
function private function_8851aea907b47f88(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.var_562ff78798cbfcc8, 1);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8ff9
// Size: 0x46
function private function_20e9c3d094691efe(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return istrue(shotobject.autocenter);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9047
// Size: 0x50
function private function_b083c5862877c8e3(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.var_ea65489e6dd7e725, 1);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x909f
// Size: 0x4c
function private function_c2a0ad9229a93162(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.var_88e69aa15889ab66, 0);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x90f3
// Size: 0x4c
function private function_9be5ff9b4bc5843a(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.nospawn, 0);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9147
// Size: 0x50
function private function_6cf39bfd67cda93a(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.cameratweenin, 0);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x919f
// Size: 0x4d
function private function_a8485c8c63aa2cc3(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.cameratweeninvisible, 1);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x91f4
// Size: 0x4c
function private function_4040a1e0bb19e02f(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.var_5f517de02c7ca959, 0);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9248
// Size: 0x50
function private function_be64404b86d48153(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.cameratweenout, 0);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x92a0
// Size: 0x4d
function private function_c5c4ac51272db146(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.cameratweenoutvisible, 1);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x92f5
// Size: 0x4c
function private function_51bd4cd630963c3a(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.var_9d3a8c6c70cf8ae4, 0);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9349
// Size: 0x4c
function private function_f0f9db1f4b0000f4(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.xcamthirdperson, 0);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x939d
// Size: 0x4c
function private function_cef37972e99fd713(shotindex) {
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.var_fdbf9e3bd86923cf, 0);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x93f1
// Size: 0xa1
function private function_6acf84052cd5ab1(spawnorigin, spawnangles) {
    var_214d924f4e137244 = self;
    entity = undefined;
    var_373a2c3b02b1d81c = var_214d924f4e137244.sceneobject function_992de34e05c5cea7();
    var_6fc4d2978cf27bef = var_214d924f4e137244.sceneobject function_12eb9fd56334261c();
    if (var_373a2c3b02b1d81c == "vehicle") {
        entity = spawnvehicle(vehicle_modelname(var_6fc4d2978cf27bef), "scene_system_vehicle", var_6fc4d2978cf27bef, spawnorigin, spawnangles);
        if (isdefined(entity)) {
            entity useanimtree(var_214d924f4e137244.sceneobject function_c106523f3836b90b());
        }
    }
    return entity;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x949a
// Size: 0x3b
function private function_619f2e5d7f38d9d5(entity) {
    if (entity.classname == "script_vehicle") {
        return true;
    }
    if (entity.classname == "script_model") {
        return true;
    }
    return false;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x94dd
// Size: 0x44
function private function_dec77fd275b35e92(shotindex) {
    var_214d924f4e137244 = self;
    vehicle = var_214d924f4e137244.entity;
    if (isdefined(vehicle) && vehicle vehicle_isphysveh()) {
        vehicle vehphys_forcekeyframedmotion();
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9528
// Size: 0x11d
function private function_69abf08346f3f6d9() {
    scenescriptbundle = self;
    var_bb49a14608f264e3 = scenescriptbundle function_291cd2f1089d3a94();
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_bb49a14608f264e3; var_56f4af8746a2d458++) {
        sceneobject = scenescriptbundle function_bfc4196d3da11705(var_56f4af8746a2d458);
        var_373a2c3b02b1d81c = sceneobject function_992de34e05c5cea7();
        var_6fc4d2978cf27bef = sceneobject function_12eb9fd56334261c();
        if (!isdefined(var_6fc4d2978cf27bef)) {
            continue;
        }
        if (var_373a2c3b02b1d81c == "aitype") {
            continue;
        }
        if (var_373a2c3b02b1d81c == "character") {
            character = function_1823ff50bb28148d(var_6fc4d2978cf27bef);
            if (isdefined(level.var_7d97144daa7995cd) && isdefined(level.var_7d97144daa7995cd[character])) {
                funcprecache = level.var_7d97144daa7995cd[character];
                level [[ funcprecache ]]();
            }
            continue;
        }
        if (var_373a2c3b02b1d81c == "vehicle") {
            precachevehicle(var_6fc4d2978cf27bef);
            modelname = vehicle_modelname(var_6fc4d2978cf27bef);
            if (modelname != "") {
                precachemodel(modelname);
            }
            continue;
        }
        precachemodel(var_6fc4d2978cf27bef);
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x964c
// Size: 0x542
function private function_ab3ec43370c405d2(sceneroot, shotindex, objectindex) {
    scenescriptbundle = self;
    alignmentinfo = spawnstruct();
    alignmentinfo.aligntarget = undefined;
    alignmentinfo.aligntag = undefined;
    alignmentinfo.alignent = undefined;
    alignmentinfo.var_93cd726eb6096497 = undefined;
    alignmentinfo.originoffset = (0, 0, 0);
    alignmentinfo.anglesoffset = (0, 0, 0);
    alignmentinfo.shotindex = shotindex;
    shot = scenescriptbundle function_2218afa82a590ea3(shotindex);
    sceneobject = scenescriptbundle function_bfc4196d3da11705(objectindex);
    shotobject = sceneobject.variant_object.shots[shotindex];
    aligncheck = [shotobject, sceneobject.variant_object, shot.variant_object, scenescriptbundle];
    for (var_afaaf74a3ad05eae = 0; var_afaaf74a3ad05eae < aligncheck.size; var_afaaf74a3ad05eae++) {
        alignobj = aligncheck[var_afaaf74a3ad05eae];
        if (isdefined(alignobj.aligntarget)) {
            alignmentinfo.aligntarget = alignobj.aligntarget;
            if (isdefined(alignobj.aligntargettag)) {
                alignmentinfo.aligntag = tolower(alignobj.aligntargettag);
            }
            break;
        }
    }
    alignmentinfo.originoffset = alignmentinfo.originoffset + function_61f8f9a912f9df9f(shotobject.var_8db9e726632f82c7, shotobject.var_8db9e626632f8094, shotobject.var_8db9e926632f872d);
    alignmentinfo.anglesoffset = alignmentinfo.anglesoffset + function_61f8f9a912f9df9f(shotobject.var_ac0c3857c7b0c6d, shotobject.var_ac0c2857c7b0a3a, shotobject.var_ac0c1857c7b0807);
    alignmentinfo.originoffset = alignmentinfo.originoffset + function_61f8f9a912f9df9f(sceneobject.variant_object.var_8db9e726632f82c7, sceneobject.variant_object.var_8db9e626632f8094, sceneobject.variant_object.var_8db9e926632f872d);
    alignmentinfo.anglesoffset = alignmentinfo.anglesoffset + function_61f8f9a912f9df9f(sceneobject.variant_object.var_ac0c3857c7b0c6d, sceneobject.variant_object.var_ac0c2857c7b0a3a, sceneobject.variant_object.var_ac0c1857c7b0807);
    alignmentinfo.originoffset = alignmentinfo.originoffset + function_61f8f9a912f9df9f(shot.variant_object.var_8db9e726632f82c7, shot.variant_object.var_8db9e626632f8094, shot.variant_object.var_8db9e926632f872d);
    alignmentinfo.anglesoffset = alignmentinfo.anglesoffset + function_61f8f9a912f9df9f(shot.variant_object.var_ac0c3857c7b0c6d, shot.variant_object.var_ac0c2857c7b0a3a, shot.variant_object.var_ac0c1857c7b0807);
    alignmentinfo.originoffset = alignmentinfo.originoffset + function_61f8f9a912f9df9f(scenescriptbundle.var_8db9e726632f82c7, scenescriptbundle.var_8db9e626632f8094, scenescriptbundle.var_8db9e926632f872d);
    alignmentinfo.anglesoffset = alignmentinfo.anglesoffset + function_61f8f9a912f9df9f(scenescriptbundle.var_ac0c3857c7b0c6d, scenescriptbundle.var_ac0c2857c7b0a3a, scenescriptbundle.var_ac0c1857c7b0807);
    aligntarget = undefined;
    if (isdefined(alignmentinfo.aligntarget)) {
        var_aecf57ef77b2c2e6 = sceneroot get_object(alignmentinfo.aligntarget);
        if (isdefined(var_aecf57ef77b2c2e6)) {
            aligntarget = var_aecf57ef77b2c2e6 function_4c4c2a548b9fc7ab();
            if (isdefined(aligntarget)) {
                alignmentinfo.var_93cd726eb6096497 = var_aecf57ef77b2c2e6.index;
            }
        }
        if (!isdefined(aligntarget)) {
            aligntarget = function_9b40ea5276506411(alignmentinfo.aligntarget);
            if (isdefined(aligntarget) && isdefined(aligntarget.var_214d924f4e137244)) {
                alignmentinfo.var_93cd726eb6096497 = aligntarget.var_214d924f4e137244.index;
            }
        }
    }
    if (!isdefined(aligntarget)) {
        aligntarget = sceneroot;
    }
    alignmentinfo.alignent = aligntarget;
    alignmentinfo.origin = default_to(alignmentinfo.alignent.origin, (0, 0, 0));
    alignmentinfo.angles = default_to(alignmentinfo.alignent.angles, (0, 0, 0));
    return alignmentinfo;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9b96
// Size: 0x1b
function private function_2c5f030a3c002210() {
    scenescriptbundle = self;
    return istrue(scenescriptbundle.bool_skippable);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9bb9
// Size: 0x1b
function private function_4f93a0dfb8fd6a47() {
    scenescriptbundle = self;
    return istrue(scenescriptbundle.bool_looping);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9bdc
// Size: 0x1b
function private function_cf67ad1bae22e908() {
    scenescriptbundle = self;
    return istrue(scenescriptbundle.var_40e675414bba8ec3);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9bff
// Size: 0x22
function private function_62cef499110730d3() {
    scenescriptbundle = self;
    return default_to(scenescriptbundle.autocleanup, 1);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9c29
// Size: 0x1b
function private function_291cd2f1089d3a94() {
    scenescriptbundle = self;
    return scenescriptbundle.objects.size;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9c4c
// Size: 0x25
function private function_bfc4196d3da11705(index) {
    scenescriptbundle = self;
    return scenescriptbundle.objects[index];
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9c79
// Size: 0x1b
function private function_d1338e27a26ecaeb() {
    scenescriptbundle = self;
    return scenescriptbundle.shots.size;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9c9c
// Size: 0x25
function private function_2218afa82a590ea3(index) {
    scenescriptbundle = self;
    return scenescriptbundle.shots[index];
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9cc9
// Size: 0xcb
function private function_eed2bf36a4defb90(var_f8c9c619e9b781d) {
    scenescriptbundle = self;
    var_38640d9c6ebeb669 = isstring(var_f8c9c619e9b781d);
    b_isint = isint(var_f8c9c619e9b781d);
    foreach (index, shot in scenescriptbundle.shots) {
        if (!isdefined(var_f8c9c619e9b781d)) {
            return index;
        }
        if (b_isint && var_f8c9c619e9b781d == index) {
            return index;
        }
        if (var_38640d9c6ebeb669 && shot.variant_object.name == var_f8c9c619e9b781d) {
            return index;
        }
    }
    return -1;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d9c
// Size: 0x2b
function private function_a3be29c7b9c648ef(index) {
    scenescriptbundle = self;
    return scenescriptbundle.shots[index] function_55042076624e1180();
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9dcf
// Size: 0x1b
function private function_e65f46a710591a5() {
    scenescriptbundle = self;
    return istrue(scenescriptbundle.autostream);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9df2
// Size: 0x25
function private function_ee55ab255c0be00d() {
    scenescriptbundle = self;
    return default_to(scenescriptbundle.var_b9717bd2a5317a1c, "AnimScripted");
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9e1f
// Size: 0x74
function private function_924e47d1f90e6366(shotname) {
    scenescriptbundle = self;
    var_406b6072ae54dcd1 = undefined;
    shotcount = scenescriptbundle function_d1338e27a26ecaeb();
    for (shotindex = 0; shotindex < shotcount; shotindex++) {
        shot = scenescriptbundle function_2218afa82a590ea3(shotindex);
        if (shot function_55042076624e1180() == shotname) {
            var_406b6072ae54dcd1 = shotindex;
            break;
        }
    }
    return var_406b6072ae54dcd1;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9e9b
// Size: 0x1b
function private function_295cf85da8fa8653() {
    scenescriptbundle = self;
    return istrue(scenescriptbundle.disablehud);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9ebe
// Size: 0x2b
function private function_55042076624e1180() {
    shot = self;
    if (!isdefined(shot)) {
        return undefined;
    }
    return shot.variant_object.name;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9ef1
// Size: 0x25
function private function_d218620a1b80e648() {
    shot = self;
    return istrue(shot.variant_object.disableshot);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9f1e
// Size: 0x25
function private function_dd4368cda4b91e7d() {
    shot = self;
    return istrue(shot.variant_object.autostream);
}

// Namespace scene / namespace_dd27d6c3daf67646
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
    return istrue(shot.variant_object.syncend);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9f90
// Size: 0x14
function private function_f09a700ae2edf8dc(alignmentinfo, shotinit) {
    
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9fab
// Size: 0xc6
function private function_d4f1b2dce50c7b7(shotindex) {
    var_214d924f4e137244 = self;
    if (var_214d924f4e137244.sceneobject function_7a553773a0af8bcd(shotindex)) {
        if (!isdefined(var_214d924f4e137244.var_251898eb5a0e0c9f)) {
            var_214d924f4e137244 function_532562ce2e63032f(var_214d924f4e137244.alignmentinfo);
        }
        if (isdefined(var_214d924f4e137244.var_251898eb5a0e0c9f)) {
            hidemayhem(var_214d924f4e137244.var_251898eb5a0e0c9f);
        }
    }
    if (var_214d924f4e137244.sceneobject function_8ed9853e35162b7c(shotindex)) {
        if (!isdefined(var_214d924f4e137244.var_251898eb5a0e0c9f)) {
            var_214d924f4e137244 function_532562ce2e63032f(var_214d924f4e137244.alignmentinfo);
        }
        if (isdefined(var_214d924f4e137244.var_251898eb5a0e0c9f)) {
            showmayhem(var_214d924f4e137244.var_251898eb5a0e0c9f);
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa078
// Size: 0xa1
function private function_532562ce2e63032f(alignmentinfo, shotindex) {
    var_214d924f4e137244 = self;
    shotindex = default_to(shotindex, var_214d924f4e137244.sceneplay.shotinit);
    var_7535cec6dfd38a5e = var_214d924f4e137244.sceneobject function_79edcc9987330a2a(shotindex);
    if (var_7535cec6dfd38a5e.size != 0) {
        var_214d924f4e137244 function_d0ffa1bea912444d(var_214d924f4e137244.sceneplay.shotinit, "mayhem", alignmentinfo, var_7535cec6dfd38a5e[0], 0, 0, 0, "MayhemAnimation");
        pausemayhem(var_214d924f4e137244.var_251898eb5a0e0c9f);
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 10, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa120
// Size: 0x14d
function private function_d0ffa1bea912444d(shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, animationtype) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 function_e045fde582740c36();
    if (!isdefined(level.scene.var_629ea32e5d4a2c40)) {
        level.scene.var_629ea32e5d4a2c40 = 0;
    }
    level.scene.var_629ea32e5d4a2c40++;
    var_214d924f4e137244.var_251898eb5a0e0c9f = var_214d924f4e137244.sceneroot.var_8ac77218f7a34e3e + "_mayhem" + level.scene.var_629ea32e5d4a2c40;
    function_e4fc30ccdca08b9d(alignmentinfo);
    animlengths = var_214d924f4e137244.sceneobject function_698798987ca7073(shotindex);
    if (animlengths.size == 0) {
        return;
    }
    spawnmayhem(var_214d924f4e137244.var_251898eb5a0e0c9f, var_4f3089070d8b1e24, alignmentinfo.origin, alignmentinfo.angles);
    waittill_match_or_timeout(notifystring, "end", animlengths[animindex]);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa274
// Size: 0x17
function private function_94d19635a2c1b723() {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 function_e045fde582740c36();
}

// Namespace scene / namespace_dd27d6c3daf67646
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

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa2d3
// Size: 0x14
function private xcam_spawn(alignmentinfo, shotinit) {
    
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa2ee
// Size: 0x1ad
function private function_371c152f2c391c55(shotindex) {
    var_214d924f4e137244 = self;
    scenescriptbundle = var_214d924f4e137244.sceneroot scene_scriptbundle();
    letterbox = scenescriptbundle function_cf67ad1bae22e908();
    if (letterbox) {
        foreach (player in level.players) {
            player function_e7257014ebaeeaa8(1);
        }
    }
    tweenin = var_214d924f4e137244.sceneobject function_6cf39bfd67cda93a(shotindex);
    if (tweenin > 0) {
        foreach (player in level.players) {
            player val::set("scene_scene" + "_xcam", "cinematic_motion", 0);
            if (var_214d924f4e137244 function_b4d836fe99f480e(shotindex)) {
                player val::set("scene_scene" + "_xcam", "take_weapons", 1);
            }
            stopxcam = var_214d924f4e137244.sceneobject function_4040a1e0bb19e02f(shotindex);
            /#
                function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + player getentitynumber(), player.origin, player.angles);
            #/
            player function_bb60d8e77392c74e(0, tweenin, 1, stopxcam);
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa4a2
// Size: 0xf9
function private function_2db9cd1521705174(shotindex) {
    var_214d924f4e137244 = self;
    tweenout = var_214d924f4e137244.sceneobject function_be64404b86d48153(shotindex);
    if (tweenout > 0) {
        foreach (player in level.players) {
            player val::reset_all("scene_scene" + "_xcam");
            stopxcam = var_214d924f4e137244.sceneobject function_51bd4cd630963c3a(shotindex);
            /#
                function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + player getentitynumber(), player.origin, player.angles);
            #/
            player function_bb60d8e77392c74e(1, tweenout, 1, stopxcam);
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa5a2
// Size: 0x14
function private function_d6ce74b74dc12311(alignmentinfo, shotindex) {
    
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa5bd
// Size: 0x114
function private function_90e78898cf74b132(sceneplay, shotindex) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 function_e4fc30ccdca08b9d(var_214d924f4e137244.alignmentinfo);
    if (isdefined(var_214d924f4e137244.alignmentinfo)) {
        CameraAnimation = var_214d924f4e137244 function_6c3d100538f590b3(shotindex);
        if (isdefined(CameraAnimation)) {
            foreach (player in level.players) {
                var_a9b43fd80025b224 = player getxcamposition(CameraAnimation, 0, 0, var_214d924f4e137244.alignmentinfo.origin, var_214d924f4e137244.alignmentinfo.angles);
                if (isdefined(var_a9b43fd80025b224)) {
                    /#
                        function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>", var_a9b43fd80025b224, (0, 0, 0));
                    #/
                    sceneplay function_317afd3b93b0b54d(player, var_a9b43fd80025b224);
                }
            }
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 10, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa6d8
// Size: 0x1a0
function private function_7ce890b54a48b767(shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, animationtype) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 xcam_delete();
    if (level.players.size == 0) {
        return 0;
    }
    function_e4fc30ccdca08b9d(alignmentinfo);
    var_214d924f4e137244 endon("scene_stop");
    var_214d924f4e137244 endon("scene_play_anim");
    var_214d924f4e137244.xcamplaying = 1;
    foreach (player in level.players) {
        var_214d924f4e137244 childthread function_bae0f68830d519ad("scene_shot_xcam", player, var_4f3089070d8b1e24, var_866b3a3066122e39, notifystring, alignmentinfo, shotindex);
    }
    waittime = function_c55e2627715b3a72(var_4f3089070d8b1e24, var_866b3a3066122e39);
    if (getxcamlooping(var_4f3089070d8b1e24)) {
        var_214d924f4e137244 waittillmatch(notifystring, "end");
    } else if (waittime > 0) {
        var_214d924f4e137244 waittill_match_or_timeout(notifystring, "end", waittime);
    }
    foreach (player in level.players) {
        player val::reset_all("scene_shot_xcam");
    }
    return waittime;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa880
// Size: 0x20e
function private function_bae0f68830d519ad(valgroup, player, var_4f3089070d8b1e24, var_866b3a3066122e39, notifystring, alignmentinfo, shotindex) {
    var_214d924f4e137244 = self;
    /#
        assert(isplayer(player));
    #/
    player endon("death_or_disconnect");
    /#
        function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + shotindex, alignmentinfo.origin, alignmentinfo.angles);
    #/
    waittime = 0;
    player val::set(valgroup, "cg_drawcrosshair", 0);
    player val::set(valgroup, "freezecontrols", 1);
    if (var_4f3089070d8b1e24 != "") {
        starttime = 0;
        if (isdefined(var_866b3a3066122e39) && var_866b3a3066122e39 > 0) {
            starttime = getxcamlength(var_4f3089070d8b1e24) * var_866b3a3066122e39;
        }
        var_be9e9d8d5ea874f9 = !var_214d924f4e137244.sceneobject function_cef37972e99fd713(shotindex);
        var_a9eb89bfa3d96107 = function_9f853ecc68f5058();
        thirdpersonplayer = var_214d924f4e137244.sceneobject function_f0f9db1f4b0000f4(shotindex);
        player notify("scene_play_xcam");
        if (isent(alignmentinfo.alignent) && isdefined(alignmentinfo.aligntag) && alignmentinfo.aligntag != "") {
            player function_cebd47970f60e9b(var_4f3089070d8b1e24, 0, alignmentinfo.alignent, alignmentinfo.aligntag, starttime, 1, var_be9e9d8d5ea874f9, var_a9eb89bfa3d96107, thirdpersonplayer);
        } else {
            player playxcam(var_4f3089070d8b1e24, 0, alignmentinfo.origin, alignmentinfo.angles, starttime, 1, var_be9e9d8d5ea874f9, var_a9eb89bfa3d96107, thirdpersonplayer);
        }
        if (getxcamlooping(var_4f3089070d8b1e24)) {
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

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaa96
// Size: 0x48
function private function_c55e2627715b3a72(var_4f3089070d8b1e24, var_866b3a3066122e39) {
    var_43869b27e8e72c31 = getxcamlength(var_4f3089070d8b1e24);
    starttime = 0;
    if (isdefined(var_866b3a3066122e39) && var_866b3a3066122e39 > 0) {
        starttime = var_43869b27e8e72c31 * var_866b3a3066122e39;
        var_43869b27e8e72c31 = var_43869b27e8e72c31 - starttime;
    }
    return var_43869b27e8e72c31;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaae6
// Size: 0x34
function private function_fe644d526883b9b4(alignmentinfo, var_4f3089070d8b1e24, notifystring, var_866b3a3066122e39, var_1cbffacca2bd0d4c, animationtype) {
    
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab21
// Size: 0x17
function private function_544bbcb14d370c45() {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 xcam_delete();
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab3f
// Size: 0xb6
function private xcam_delete() {
    var_214d924f4e137244 = self;
    scenescriptbundle = var_214d924f4e137244.sceneroot scene_scriptbundle();
    letterbox = scenescriptbundle function_cf67ad1bae22e908();
    foreach (player in level.players) {
        player stopxcam();
        player val::reset_all("scene_shot_xcam");
        if (letterbox) {
            player function_e7257014ebaeeaa8(0);
        }
    }
    var_214d924f4e137244.xcamplaying = undefined;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xabfc
// Size: 0xd
function private function_a9acafbfcda23112(entity) {
    return false;
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xac11
// Size: 0x20
function private xcam_cleanup(var_fa1af9d2277fd747) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 xcam_delete();
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xac38
// Size: 0x93
function private function_1069a83dc140e900(boolval) {
    foreach (player in level.players) {
        if (!isent(player)) {
            continue;
        }
        if (istrue(boolval)) {
            player val::set("scene_scene", "cinematics_participant", 1);
            continue;
        }
        player val::reset("scene_scene", "cinematics_participant");
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xacd2
// Size: 0x3b
function private function_61f8f9a912f9df9f(paramx, paramy, paramz) {
    if (!isdefined(paramx)) {
        paramx = 0;
    }
    if (!isdefined(paramy)) {
        paramy = 0;
    }
    if (!isdefined(paramz)) {
        paramz = 0;
    }
    return (paramx, paramy, paramz);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xad15
// Size: 0x1d8
function private function_e4fc30ccdca08b9d(alignmentinfo) {
    alignmentinfo.origin = (0, 0, 0);
    alignmentinfo.angles = (0, 0, 0);
    if (isent(alignmentinfo.alignent) && isdefined(alignmentinfo.aligntag)) {
        alignmentinfo.origin = alignmentinfo.alignent gettagorigin(alignmentinfo.aligntag, 1, 0, 0);
        if (!isdefined(alignmentinfo.origin)) {
            alignmentinfo.origin = (0, 0, 0);
        }
        alignmentinfo.angles = alignmentinfo.alignent gettagangles(alignmentinfo.aligntag, 1, 0, 0);
        if (!isdefined(alignmentinfo.angles)) {
            alignmentinfo.angles = (0, 0, 0);
        }
    } else {
        if (isdefined(alignmentinfo.alignent.origin)) {
            alignmentinfo.origin = alignmentinfo.alignent.origin;
        }
        if (isdefined(alignmentinfo.alignent.angles)) {
            alignmentinfo.angles = alignmentinfo.alignent.angles;
        }
    }
    alignmentinfo.origin = alignmentinfo.origin + rotatevector(alignmentinfo.originoffset, alignmentinfo.angles);
    alignmentinfo.angles = combineangles(alignmentinfo.angles, alignmentinfo.anglesoffset);
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaef4
// Size: 0x1a3
function private function_5ecd1fd13181af98(notifystring, notifyitem, var_214d924f4e137244) {
    entity = self;
    if (!isent(self)) {
        return;
    }
    if (!isdefined(notifystring) || !isdefined(notifyitem.notifyobject)) {
        return;
    }
    if (!istrue(notifyitem.notifyrepeat) && istrue(notifyitem.notifytriggered)) {
        return;
    }
    note = tolower(notifyitem.notifynote);
    singletonnotify = "ewnr_" + self getentitynumber() + "_" + notifystring + "_" + note + "_" + (istrue(notifyitem.notifyrepeat) ? "_r" : "");
    notifyitem.notifyobject notify(singletonnotify);
    notifyitem.notifyobject endon(singletonnotify);
    waittillframeend();
    if (notifyitem.notifynote != "end") {
        entity thread function_b66a5adba2137274(notifystring, "end", "entity_wait_note_abort");
        entity endon("entity_wait_note_abort");
    }
    while (true) {
        entity waittillmatch(notifystring, note);
        if (isdefined(notifyitem.notifyobject)) {
            if (istrue(notifyitem.notifyrepeat) || !istrue(notifyitem.notifytriggered)) {
                notifyitem.notifyobject notify(notifyitem.notifynote);
                notifyitem.notifytriggered = 1;
            }
            if (!istrue(notifyitem.notifyrepeat) || notifyitem.notifynote == "end") {
                return;
            }
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb09e
// Size: 0x38
function private function_b66a5adba2137274(notifystring, match, notifyresult) {
    entity = self;
    entity waittillmatch(notifystring, match);
    if (isdefined(entity)) {
        entity notify(notifyresult);
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb0dd
// Size: 0x2ca
function private function_bea88b25e17cea66(sceneplay, shotindex, objectindex) {
    var_214d924f4e137244 = self;
    sceneroot = sceneplay.sceneroot;
    if (isdefined(var_214d924f4e137244.entity)) {
        aientity = var_214d924f4e137244.entity;
        var_7db06d4a4c1afffa = var_214d924f4e137244.sceneobject function_1b712c4c79096ef9(shotindex);
        locomotionstart = var_214d924f4e137244.sceneobject function_8f11c2704d4c19c3(shotindex);
        if (var_7db06d4a4c1afffa != "DEFAULT") {
            aientity val::set("scene_shot", "demeanor", var_7db06d4a4c1afffa);
        }
        if (var_214d924f4e137244 function_b4d836fe99f480e(shotindex)) {
            aientity val::set("scene_shot", "take_weapons", 1);
        }
        if (isdefined(var_214d924f4e137244.scenedata.var_43286fd46706909c)) {
            return;
        }
        reachtype = var_214d924f4e137244.sceneobject function_8b6dcfac0d2921ad(shotindex);
        if (reachtype != "Teleport" && istrue(var_214d924f4e137244.existingentity)) {
            scenedata = sceneroot.scenedata;
            var_4f3089070d8b1e24 = var_214d924f4e137244.sceneobject function_79edcc9987330a2a(shotindex)[0];
            if (isdefined(var_4f3089070d8b1e24)) {
                function_e4fc30ccdca08b9d(var_214d924f4e137244.alignmentinfo);
                animstartorigin = getstartorigin(var_214d924f4e137244.alignmentinfo.origin, var_214d924f4e137244.alignmentinfo.angles, var_4f3089070d8b1e24);
                if (distancesquared(aientity.origin, animstartorigin) > squared(16)) {
                    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("shotObjectStopAnim");
                    if (isdefined(typefunc) && typefunc != &function_9b8055c613f1bb31) {
                        var_214d924f4e137244 [[ typefunc ]]();
                    }
                    var_4bc185af207d5706 = reach_speed(var_7db06d4a4c1afffa, locomotionstart);
                    arrivaltype = undefined;
                    if (reachtype == "ReachArrive") {
                        arrivaltype = function_796087cbcf3fb30(var_214d924f4e137244.sceneobject function_ceabc6a1e0fac4cf(shotindex));
                    }
                    /#
                        function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>", var_214d924f4e137244.alignmentinfo.origin, var_214d924f4e137244.alignmentinfo.angles);
                    #/
                    sceneroot childthread scene_coordinated_reach(sceneplay, shotindex, var_4bc185af207d5706, [aientity, var_4f3089070d8b1e24, var_214d924f4e137244.alignmentinfo, arrivaltype]);
                    aientity waittill_any_2("scene_coordinated_reach", "death_or_disconnect");
                }
            }
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
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
    while (true) {
        lookatplayer = var_214d924f4e137244.entity function_47dbe773d9a4572f(0.25);
        if (isdefined(lookatplayer) && (!isdefined(var_214d924f4e137244.var_63dd238417ee222c) || var_214d924f4e137244.var_63dd238417ee222c != lookatplayer)) {
            var_214d924f4e137244.var_63dd238417ee222c = lookatplayer;
            var_214d924f4e137244.entity namespace_17a0e830dd8fa113::enablelookatentity(var_214d924f4e137244.var_63dd238417ee222c);
        } else if (isdefined(var_214d924f4e137244.var_63dd238417ee222c)) {
            var_214d924f4e137244.entity namespace_17a0e830dd8fa113::disablelookatentity(var_214d924f4e137244.var_63dd238417ee222c);
            var_214d924f4e137244.var_63dd238417ee222c = undefined;
        }
        waitframe();
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
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
    while (true) {
        events = var_214d924f4e137244.entity waittill("ai_events");
        foreach (event in events) {
            var_214d924f4e137244 function_bdd631983c9e6f5c();
            var_214d924f4e137244 function_9b8055c613f1bb31();
            var_214d924f4e137244 thread object_cleanup();
        }
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb573
// Size: 0xad
function private function_9b40ea5276506411(searchname, ignorespawners) {
    if (!isdefined(ignorespawners)) {
        ignorespawners = 1;
    }
    aligntargets = utility::function_a5079b5837467402(searchname, "targetname", ignorespawners);
    if (!isdefined(aligntargets) || aligntargets.size == 0) {
        aligntarget = utility::function_a5079b5837467402(searchname, "script_noteworthy", ignorespawners);
    }
    if (!isdefined(aligntargets) || aligntargets.size == 0) {
        aligntarget = utility::function_a5079b5837467402("_scene_global_" + searchname, "targetname", ignorespawners);
    }
    if (!isdefined(aligntargets) || aligntargets.size == 0) {
        aligntarget = utility::function_a5079b5837467402("_scene_global_" + searchname, "script_noteworthy", ignorespawners);
    }
    if (aligntargets.size > 1) {
    }
    return aligntargets[0];
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 10, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb628
// Size: 0x91
function private function_16714fbc8955e6c7(shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, animationtype) {
    var_214d924f4e137244 = self;
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectStoreAnimRequest");
    if (isdefined(typefunc)) {
        var_214d924f4e137244 [[ typefunc ]](shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, animationtype);
    }
}

// Namespace scene / namespace_dd27d6c3daf67646
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb6c0
// Size: 0x4c
function private function_68056529c69f4097(animationtype, shotindex, animindex) {
    var_214d924f4e137244 = self;
    typefunc = var_214d924f4e137244 function_8a786f133d7341c0("objectClearAnimRequest");
    if (isdefined(typefunc)) {
        var_214d924f4e137244 [[ typefunc ]](animationtype, shotindex, animindex);
    }
}

