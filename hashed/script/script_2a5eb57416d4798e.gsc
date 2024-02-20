// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\anim.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\notetrack.gsc;
#using script_72a196b6c7df2f38;
#using script_784c8c4f3e5f8686;
#using script_308091d56071a91c;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\asm\asm.gsc;
#using scripts\cp_mp\anim_scene.gsc;
#using script_371b4c2ab5861e62;
#using script_16ea1b94f0f381b3;
#using scripts\mp\mp_agent.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace scene;

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x5f7
// Size: 0x333
function private autoexec function_683aefb412af1596() {
    /#
        if (getdvarint(@"hash_e6afce2cf5cf7515")) {
            return;
        }
    #/
    function_ace39e84230f386();
    function_9d3850b024ab89b1("modeStartMonitoringPlayers", &function_22f6fca8362a92b);
    function_9d3850b024ab89b1("modeStopMonitoringPlayers", &function_276d3342cddac11a);
    function_9d3850b024ab89b1("modeXCamRespectsStartingTimeOnClients", &function_720d21706a7ff164);
    function_9d3850b024ab89b1("modeLetterbox", &function_f66b22351778fe49);
    function_9d3850b024ab89b1("modePlayerMatchingObjectForFemale", &function_d18c2d3d2819c322);
    function_7855ec4caf5901f9("Types_Player", "objectSetup", &function_c14ed0fc1a6ccf72);
    function_7855ec4caf5901f9("Types_Player", "shotObjectPlayAnim", &function_5fd2b7d3c29f131b);
    function_7855ec4caf5901f9("Types_Player", "shotObjectStopAnim", &function_e3f3a0837cae6779);
    function_7855ec4caf5901f9("Types_Player", "objectSetAnimName", &function_24b6b2bfc5bdab36);
    function_7855ec4caf5901f9("Types_Player", "objectDelete", &function_76b8db54c4fd325e);
    function_7855ec4caf5901f9("Types_Player", "shotObjectPrepare", &function_43972bd744497667);
    function_7855ec4caf5901f9("Types_Player", "shotObjectCleanup", &function_8b3b351a42e84dc2);
    function_7855ec4caf5901f9("Types_Player", "objectMatchEntity", &function_70e05db9c7c6c130);
    function_7855ec4caf5901f9("Types_Player", "objectGetLinkEnts", &function_ca4527bcd586d366);
    function_7855ec4caf5901f9("Types_Player", "objectCleanup", &function_f5c1014e1cfdf615);
    function_7855ec4caf5901f9("Types_Player", "objectStoreAnimRequest", &function_8cd22f505439309f);
    function_7855ec4caf5901f9("Types_Player", "objectClearAnimRequest", &function_3e4cf61872dc003b);
    function_7855ec4caf5901f9("Types_Actor", "objectSpawn", &function_95c579445e1097ca);
    function_7855ec4caf5901f9("Types_Actor", "shotObjectPrepare", &function_61be92922a464251);
    function_7855ec4caf5901f9("Types_Actor", "objectMatchEntity", &function_12f50a9b21b4dd9a);
    function_7855ec4caf5901f9("Types_Actor", "shotObjectPlayAnim", &function_43a42c8097aac565);
    function_7855ec4caf5901f9("Types_Actor", "shotObjectStopAnim", &function_2d573d9c69823343);
    function_7855ec4caf5901f9("Types_Actor", "objectDelete", &function_4efd74883670af4c);
    function_7855ec4caf5901f9("Types_Actor", "shotObjectCleanup", &function_642077a65edc7954);
    function_7855ec4caf5901f9("Types_Actor", "shotObjectFirstFrame", &function_6dad63edc3390487);
    function_7855ec4caf5901f9("Types_Vehicle", "objectSpawn", &function_bcf0caa0a00df979);
    function_7855ec4caf5901f9("Types_Vehicle", "shotObjectPlayAnim", &function_5552728c9588fd02);
    function_7855ec4caf5901f9("Types_Vehicle", "shotObjectStopAnim", &function_b8c3ea8ca94cea0c);
    function_7855ec4caf5901f9("Types_Vehicle", "objectDelete", &function_e4b0080d3057884f);
    function_7855ec4caf5901f9("Types_Vehicle", "objectMatchEntity", &function_684629695ffebbdb);
    function_7855ec4caf5901f9("Types_Vehicle", "objectSetAnimName", &function_2e11be8a4ef151b5);
    function_7855ec4caf5901f9("Types_Object", "shotObjectPlayAnim", &function_70bd06355933aec9);
    function_7855ec4caf5901f9("Types_Object", "shotObjectStopAnim", &function_cc538c3233d741af);
    function_7855ec4caf5901f9("Types_Object", "shotObjectFirstFrame", &function_8bac7edf73a29d6b);
    function_7855ec4caf5901f9("Types_Object", "objectTeleport", &function_e8800b55f7cbd5a4);
    function_7855ec4caf5901f9("Types_Object", "objectMatchEntity", &function_83f1be5a5eb5f706);
    function_5a197e7b54a9091e();
    level thread function_e16b1ab0a35605d3("onStartGameTypeFinished");
}

// Namespace scene/namespace_5952db407689619a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x931
// Size: 0x7e
function private function_70e05db9c7c6c130(entity) {
    /#
        if (function_2fbba7f29e8d78ce(self.index, entity)) {
            entity.animname = self.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.name;
            return 1;
        }
    #/
    var_214d924f4e137244 = self;
    var_fd21765103d9bb37 = isplayer(entity);
    if (isdefined(var_fd21765103d9bb37)) {
        if (!function_ac04e049ff623301(entity, var_214d924f4e137244)) {
            return 0;
        }
    }
    return var_fd21765103d9bb37;
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9b7
// Size: 0x2f
function private function_72777e12c4307f96() {
    var_214d924f4e137244 = self;
    return istrue(var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_59f9757349c241a1);
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9ee
// Size: 0x2e
function private function_be5a45fff59957b() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_d192b38b7ad90242;
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa24
// Size: 0x2e
function private function_306026c41bd7abbd() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_a6da0bee0f0e8948;
}

// Namespace scene/namespace_5952db407689619a
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa5a
// Size: 0x88
function private set_character_models(bodymodelname, headmodelname, var_41bd2eeda1c033d2) {
    if (isdefined(self.headmodel)) {
        self detach(self.headmodel);
    }
    if (!isagent(self)) {
        bodymodelname = self getcustomizationbody();
        headmodelname = self getcustomizationhead();
        var_41bd2eeda1c033d2 = self getcustomizationviewmodel();
    }
    self setmodel(bodymodelname);
    self setviewmodel(var_41bd2eeda1c033d2);
    if (isdefined(headmodelname)) {
        self attach(headmodelname, "", 1);
        self.headmodel = headmodelname;
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xae9
// Size: 0x5b
function private function_ec6039191e7c076a(player, var_36a19240d8d46bc2, var_be8eaa36d09f2c8) {
    /#
        assert(isdefined(player));
    #/
    /#
        assert(isplayer(player));
    #/
    player setcustomization(var_36a19240d8d46bc2, var_be8eaa36d09f2c8);
    var_e243ecbc215e7e07 = player getcustomizationviewmodel();
    player set_character_models(var_36a19240d8d46bc2, var_be8eaa36d09f2c8, var_e243ecbc215e7e07);
}

// Namespace scene/namespace_5952db407689619a
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb4b
// Size: 0x2dd
function private function_43972bd744497667(var_568f62a24b19c46d, var_698da5af57b757e7, objectindex) {
    var_214d924f4e137244 = self;
    player = var_214d924f4e137244.entity;
    if (!isplayer(player)) {
        return;
    }
    /#
        assert(isplayer(player));
    #/
    function_3d8d8ad244283e65(#"hash_d54b289d498be977");
    if (var_214d924f4e137244 function_b4d836fe99f480e(var_698da5af57b757e7)) {
        player val::set("scene_shot", "take_weapons", 1);
    }
    var_db52b4a8aba13320 = var_214d924f4e137244.var_5aaf7c7163c04623 function_6a6ec88abab6a723();
    if (var_db52b4a8aba13320 function_cf67ad1bae22e908()) {
        player function_e7257014ebaeeaa8(1);
    }
    player val::set("scene_scene", "cinematic_motion", 0);
    var_7fba0dfc25328161 = [0:"offhand_weapons", 1:"melee", 2:"sprint", 3:"allow_jump", 4:"mantle", 5:"tacmap_scoreboard", 6:"backpack_inventory"];
    if (!istrue(var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_9f78587cfefc10ac)) {
        var_7fba0dfc25328161 = array_add(var_7fba0dfc25328161, "usability");
    }
    if (var_214d924f4e137244.var_9be58c68789faf5c function_d1dd52dc1f43215d(var_698da5af57b757e7) != "Keep") {
        var_7fba0dfc25328161 = array_add(var_7fba0dfc25328161, "weapon");
    }
    if (!var_214d924f4e137244.var_9be58c68789faf5c function_fcc766f42b75a322(var_698da5af57b757e7)) {
        var_7fba0dfc25328161 = array_add(var_7fba0dfc25328161, "weapon_switch");
    }
    var_214d924f4e137244.entity val::set("scene_shot", "freezecontrols", 1);
    var_214d924f4e137244.entity val::set("scene_shot", "swimming_underwater", 0);
    function_7f3923ed3d66f8ad();
    function_3d8d8ad244283e65(#"hash_559bfd7b0925399d");
    var_214d924f4e137244.entity val::function_59c053b89257bc95("scene_shot", var_7fba0dfc25328161, 0);
    function_7f3923ed3d66f8ad();
    if (var_698da5af57b757e7 == var_214d924f4e137244.var_568f62a24b19c46d.var_df5db7bd235f2729[0]) {
        if (var_214d924f4e137244 function_72777e12c4307f96()) {
            var_36a19240d8d46bc2 = player getcustomizationbody();
            var_be8eaa36d09f2c8 = player getcustomizationhead();
            if (!isdefined(var_214d924f4e137244.var_d5d84848169bf792)) {
                var_214d924f4e137244.var_d5d84848169bf792 = var_36a19240d8d46bc2;
            }
            if (!isdefined(var_214d924f4e137244.var_79825563576bccb8)) {
                var_214d924f4e137244.var_79825563576bccb8 = var_be8eaa36d09f2c8;
            }
            var_9a843b7e2ec0ad7c = var_214d924f4e137244 function_be5a45fff59957b();
            if (isdefined(var_9a843b7e2ec0ad7c) && var_9a843b7e2ec0ad7c.size > 0) {
                var_36a19240d8d46bc2 = var_9a843b7e2ec0ad7c;
            }
            var_9328dfa502dc6872 = var_214d924f4e137244 function_306026c41bd7abbd();
            if (isdefined(var_9328dfa502dc6872) && var_9328dfa502dc6872.size > 0) {
                var_be8eaa36d09f2c8 = var_9328dfa502dc6872;
            }
            function_ec6039191e7c076a(player, var_36a19240d8d46bc2, var_be8eaa36d09f2c8);
        }
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe2f
// Size: 0x10a
function private function_8b3b351a42e84dc2(var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    if (!isplayer(var_214d924f4e137244.entity)) {
        return;
    }
    /#
        assert(isplayer(var_214d924f4e137244.entity));
    #/
    if (var_698da5af57b757e7 == var_214d924f4e137244.var_568f62a24b19c46d.var_df5db7bd235f2729[var_214d924f4e137244.var_568f62a24b19c46d.var_df5db7bd235f2729.size - 1]) {
        if (var_214d924f4e137244 function_72777e12c4307f96()) {
            if (isdefined(var_214d924f4e137244.var_d5d84848169bf792) && isdefined(var_214d924f4e137244.var_79825563576bccb8)) {
                function_ec6039191e7c076a(var_214d924f4e137244.entity, var_214d924f4e137244.var_d5d84848169bf792, var_214d924f4e137244.var_79825563576bccb8);
                var_214d924f4e137244.var_d5d84848169bf792 = undefined;
                var_214d924f4e137244.var_79825563576bccb8 = undefined;
            }
        }
        function_2d5d63169291228e(var_214d924f4e137244.entity, var_698da5af57b757e7);
    }
    var_214d924f4e137244.entity val::function_c9d0b43701bdba00("scene_shot");
}

// Namespace scene/namespace_5952db407689619a
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf40
// Size: 0x389
function private function_5fd2b7d3c29f131b(var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime) {
    var_214d924f4e137244 = self;
    player = var_214d924f4e137244.entity;
    var_214d924f4e137244 endon("scene_stop");
    var_214d924f4e137244 endon("scene_play_anim");
    if (!isplayer(player)) {
        if (is_equal(player, var_214d924f4e137244.var_647acce9fbbb526c)) {
            if (isagent(player)) {
                var_7c6075e90a7b0fa = var_214d924f4e137244 function_23cc62938b72190b();
                var_e5b70543a43b4c89 = player function_d28a53b100cbdda7(var_214d924f4e137244, var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, var_7c6075e90a7b0fa);
                return var_e5b70543a43b4c89;
            } else {
                var_e5b70543a43b4c89 = var_214d924f4e137244 function_70bd06355933aec9(var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime);
                return var_e5b70543a43b4c89;
            }
        } else {
            var_214d924f4e137244 function_bf0d14daf3e53248(var_4f3089070d8b1e24, var_214d924f4e137244.var_41dc93404af773a3, notifystring);
            var_214d924f4e137244 function_68056529c69f4097(var_214d924f4e137244.var_41dc93404af773a3, var_698da5af57b757e7, animindex);
            return 0;
        }
    }
    var_409dc6bbf1421f94 = var_214d924f4e137244 function_5fe020a6db35fab3(var_698da5af57b757e7);
    player val::function_59c053b89257bc95("scene_shot", var_409dc6bbf1421f94, 0);
    if (var_214d924f4e137244.var_41dc93404af773a3 == "CameraAnimation") {
        var_214d924f4e137244 thread function_1a03f495ca2de598(var_4f3089070d8b1e24, [0:player], "death_or_disconnect", "CameraAnimation", notifystring);
        var_214d924f4e137244.var_e32ce590a15666ec = 1;
        return var_214d924f4e137244 function_bae0f68830d519ad("scene_shot", player, var_4f3089070d8b1e24, var_866b3a3066122e39, notifystring, var_bae27d121b581202, var_698da5af57b757e7);
    }
    player val::set("scene_shot", "cinematics_participant", 1);
    var_2e2a2f75fd49152a = getanimname(var_4f3089070d8b1e24);
    n_anim_length = getanimlength(var_4f3089070d8b1e24);
    player setorigin(var_bae27d121b581202.origin);
    player setplayerangles(var_bae27d121b581202.angles);
    var_d0cbd253b25b43f5 = istrue(var_214d924f4e137244.var_e32ce590a15666ec) && var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7].var_45d86f20e184e36a.size == 1;
    var_9ebbc3376d9ce8f2 = var_214d924f4e137244 function_d776460a61b689bf(var_698da5af57b757e7);
    var_d8ab3f21c6db562e = !var_9ebbc3376d9ce8f2;
    if (var_9ebbc3376d9ce8f2) {
        function_639a0acd683457ec(player, var_698da5af57b757e7);
    } else {
        function_2d5d63169291228e(player, var_698da5af57b757e7);
    }
    var_214d924f4e137244 childthread function_8e9f8e1fbe2b7ab4(notifystring, var_4f3089070d8b1e24);
    function_3d8d8ad244283e65(#"hash_e45c00238da3528c");
    player playanimscriptsceneevent("scripted_scene", var_2e2a2f75fd49152a, var_d8ab3f21c6db562e);
    function_7f3923ed3d66f8ad();
    var_214d924f4e137244 function_bdfc45b799d27532(var_4f3089070d8b1e24);
    if (var_9ebbc3376d9ce8f2) {
        n_anim_length = function_a7bfaa03b4d58c00(player, var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, n_anim_length);
    } else if (var_d0cbd253b25b43f5) {
        n_start_time = gettime();
        player waittill_any_timeout_2(n_anim_length, "stop_animmode", "death_or_disconnect");
        var_ef8433621bf198f1 = function_c89ed1840c8d0f0f(gettime() - n_start_time);
        /#
            println("cinematic_motion" + var_ef8433621bf198f1 + "team_eighty" + function_3c8848a3a11b2553(var_2e2a2f75fd49152a) + "<unknown string>" + n_anim_length + "<unknown string>" + n_anim_length - var_ef8433621bf198f1 + "<unknown string>");
        #/
        n_anim_length = var_ef8433621bf198f1;
    } else {
        wait(n_anim_length);
    }
    return n_anim_length;
}

// Namespace scene/namespace_5952db407689619a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12d1
// Size: 0x146
function private function_639a0acd683457ec(player, var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    var_9ebbc3376d9ce8f2 = var_214d924f4e137244 function_d776460a61b689bf(var_698da5af57b757e7);
    if (var_9ebbc3376d9ce8f2 && !isdefined(player.var_7c6c008ca46286b0)) {
        player.var_7c6c008ca46286b0 = spawn("script_arms", player.origin, 0, 0, player);
        player.var_7c6c008ca46286b0.animname = var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.name;
        player.var_7c6c008ca46286b0 useanimtree(var_214d924f4e137244.var_9be58c68789faf5c function_c106523f3836b90b());
        player.var_7c6c008ca46286b0 hide();
        player.var_7c6c008ca46286b0.entity = player;
        player.var_7c6c008ca46286b0 showonlytoplayer(player);
        player.var_7c6c008ca46286b0.noragdoll = 1;
        player.var_7c6c008ca46286b0 val::set("scene_scene", "cinematics_participant", 1);
        thread function_382ab03066aa1207(player, player.var_7c6c008ca46286b0);
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x141e
// Size: 0x75
function private function_382ab03066aa1207(player, rig) {
    rig endon("death_or_disconnect");
    var_d1259a4ca338a8bd = 1;
    while (isdefined(player)) {
        var_8c9a37d8546a9e51 = player GetCameraThirdPerson();
        if (var_8c9a37d8546a9e51 && var_d1259a4ca338a8bd) {
            rig hide();
            var_d1259a4ca338a8bd = 0;
        } else if (!var_8c9a37d8546a9e51 && !var_d1259a4ca338a8bd) {
            rig showonlytoplayer(player);
            var_d1259a4ca338a8bd = 1;
        }
        waitframe();
    }
    rig delete();
}

// Namespace scene/namespace_5952db407689619a
// Params 11, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x149a
// Size: 0x2c1
function private function_a7bfaa03b4d58c00(player, var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, n_anim_length) {
    var_214d924f4e137244 = self;
    function_639a0acd683457ec(player, var_698da5af57b757e7);
    var_ea4b96b3bc07d5eb = var_214d924f4e137244.var_9be58c68789faf5c function_918dc2e0c83784b6(var_698da5af57b757e7);
    var_a4f80a2adf98dd96 = var_214d924f4e137244.var_9be58c68789faf5c function_16b4cb7e4c5af0fd(var_698da5af57b757e7);
    var_ec8f49ef6138e6de = var_214d924f4e137244.var_9be58c68789faf5c function_b06da1547120edef(var_698da5af57b757e7);
    var_94c9659b7604e0a0 = var_214d924f4e137244.var_9be58c68789faf5c function_be3310ec58dd9807(var_698da5af57b757e7);
    var_562ff78798cbfcc8 = var_214d924f4e137244.var_9be58c68789faf5c function_8851aea907b47f88(var_698da5af57b757e7);
    var_3adbb72f4082d366 = var_214d924f4e137244.var_9be58c68789faf5c function_b083c5862877c8e3(var_698da5af57b757e7);
    var_e854c1a35488c7d6 = function_a89f1262c5148bdf();
    player playerlinktoblend(player.var_7c6c008ca46286b0, var_e854c1a35488c7d6, lerptime);
    player playerlinktodelta(player.var_7c6c008ca46286b0, var_e854c1a35488c7d6, var_3adbb72f4082d366, var_ea4b96b3bc07d5eb, var_a4f80a2adf98dd96, var_ec8f49ef6138e6de, var_94c9659b7604e0a0, var_562ff78798cbfcc8, 1, 1);
    player lerpviewangleclamp(blendtime, blendtime * 0.5, blendtime * 0.25, var_ea4b96b3bc07d5eb, var_a4f80a2adf98dd96, var_ec8f49ef6138e6de, var_94c9659b7604e0a0, 1);
    player.var_7c6c008ca46286b0 showonlytoplayer(player);
    var_6325cb53ec163839 = "none";
    if (blendtime > 0 && blendtime < 1) {
        var_6325cb53ec163839 = "normal";
    } else if (blendtime >= 1) {
        var_6325cb53ec163839 = "slow";
    }
    var_2e2a2f75fd49152a = getanimname(var_4f3089070d8b1e24);
    var_4fdfa3b181211e22 = var_866b3a3066122e39 * n_anim_length;
    if (var_214d924f4e137244 function_7f90ebd0aa7ad958(var_698da5af57b757e7)) {
        player.var_7c6c008ca46286b0 animscripted(notifystring, var_bae27d121b581202.origin, var_bae27d121b581202.angles, var_4f3089070d8b1e24, undefined, undefined, blendtime);
        player.var_7c6c008ca46286b0 scriptmodelplayanim(var_2e2a2f75fd49152a, undefined, var_4fdfa3b181211e22, undefined, var_6325cb53ec163839);
        player.var_7c6c008ca46286b0 function_ee012c2dd711a8ce(notifystring, "end", "stop_animmode");
    } else {
        player.var_7c6c008ca46286b0 scriptmodelplayanim(var_2e2a2f75fd49152a, undefined, var_4fdfa3b181211e22, undefined, var_6325cb53ec163839);
        player.var_7c6c008ca46286b0 waittill_any_timeout_1(getanimlength(var_4f3089070d8b1e24), "stop_animmode");
        player.var_7c6c008ca46286b0 notify(notifystring, "end");
    }
    return n_anim_length - var_4fdfa3b181211e22;
}

// Namespace scene/namespace_5952db407689619a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1763
// Size: 0x7c
function private function_2d5d63169291228e(player, var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    if (isdefined(player.var_7c6c008ca46286b0)) {
        if (isdefined(var_698da5af57b757e7)) {
            var_89d01150f6ea37bc = var_214d924f4e137244.var_9be58c68789faf5c function_be64404b86d48153(var_698da5af57b757e7);
            player function_af4b9b0f0e7c6c42(var_89d01150f6ea37bc);
        } else {
            player function_af4b9b0f0e7c6c42(0);
        }
        player stopanimscriptsceneevent();
        player.var_7c6c008ca46286b0 delete();
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17e6
// Size: 0x54
function private function_c14ed0fc1a6ccf72(var_568f62a24b19c46d) {
    var_214d924f4e137244 = self;
    player = var_214d924f4e137244.entity;
    var_698da5af57b757e7 = var_568f62a24b19c46d.var_df5db7bd235f2729[0];
    if (isdefined(player)) {
        function_639a0acd683457ec(player, var_698da5af57b757e7);
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1841
// Size: 0x52
function private function_ca4527bcd586d366() {
    var_214d924f4e137244 = self;
    player = var_214d924f4e137244.entity;
    if (!isdefined(player)) {
        return [];
    }
    if (isdefined(player.var_7c6c008ca46286b0)) {
        return [0:player.var_7c6c008ca46286b0];
    }
    return [0:player];
}

// Namespace scene/namespace_5952db407689619a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x189b
// Size: 0x6a
function private function_f5c1014e1cfdf615(var_fa1af9d2277fd747) {
    var_214d924f4e137244 = self;
    player = var_214d924f4e137244.entity;
    var_214d924f4e137244 function_2f2327d535ed0bb();
    if (isdefined(player)) {
        var_db52b4a8aba13320 = var_214d924f4e137244.var_5aaf7c7163c04623 function_6a6ec88abab6a723();
        if (var_db52b4a8aba13320 function_cf67ad1bae22e908()) {
            player function_e7257014ebaeeaa8(0);
        }
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x190c
// Size: 0x81
function private function_e3f3a0837cae6779() {
    var_214d924f4e137244 = self;
    player = var_214d924f4e137244.entity;
    var_214d924f4e137244 function_2f2327d535ed0bb();
    if (isdefined(player)) {
        player notify("stop_loop");
        player notify("single anim", "end");
        player notify("looping anim", "end");
        player notify("stop_animmode");
        if (isplayer(player)) {
            player stopanimscriptsceneevent();
        }
        function_2d5d63169291228e(player);
        player val::function_c9d0b43701bdba00("scene_shot");
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1994
// Size: 0x20
function private function_24b6b2bfc5bdab36(animname, animtree) {
    var_214d924f4e137244 = self;
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x19bb
// Size: 0x3
function private function_76b8db54c4fd325e() {
    
}

// Namespace scene/namespace_5952db407689619a
// Params a, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x19c5
// Size: 0x1e8
function private function_8cd22f505439309f(var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, var_efef5984278284b1) {
    if (var_efef5984278284b1 != "DeltaAnimation") {
        return;
    }
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.var_b2de9e740fef7506)) {
        var_214d924f4e137244.var_b2de9e740fef7506 = spawnstruct();
    }
    var_214d924f4e137244.var_b2de9e740fef7506.var_910bb5a10c1baada = 1;
    var_214d924f4e137244.var_b2de9e740fef7506.var_698da5af57b757e7 = var_698da5af57b757e7;
    var_214d924f4e137244.var_b2de9e740fef7506.animindex = animindex;
    var_214d924f4e137244.var_b2de9e740fef7506.notifystring = notifystring;
    var_214d924f4e137244.var_b2de9e740fef7506.var_bae27d121b581202 = var_bae27d121b581202;
    var_214d924f4e137244.var_b2de9e740fef7506.var_bae27d121b581202.origin = var_bae27d121b581202.origin;
    var_214d924f4e137244.var_b2de9e740fef7506.var_bae27d121b581202.angles = var_bae27d121b581202.angles;
    var_214d924f4e137244.var_b2de9e740fef7506.var_4f3089070d8b1e24 = var_4f3089070d8b1e24;
    var_214d924f4e137244.var_b2de9e740fef7506.var_866b3a3066122e39 = var_866b3a3066122e39;
    var_214d924f4e137244.var_b2de9e740fef7506.blendtime = blendtime;
    var_214d924f4e137244.var_b2de9e740fef7506.blendcurve = blendcurve;
    var_214d924f4e137244.var_b2de9e740fef7506.lerptime = lerptime;
    var_214d924f4e137244.var_b2de9e740fef7506.var_fe62dc1bdc14feca = gettime();
}

// Namespace scene/namespace_5952db407689619a
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1bb4
// Size: 0x8a
function private function_3e4cf61872dc003b(var_efef5984278284b1, var_698da5af57b757e7, animindex) {
    if (!isdefined(var_efef5984278284b1) || var_efef5984278284b1 != "DeltaAnimation") {
        return;
    }
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.var_b2de9e740fef7506)) {
        return;
    }
    if (var_698da5af57b757e7 == var_214d924f4e137244.var_b2de9e740fef7506.var_698da5af57b757e7 && animindex == var_214d924f4e137244.var_b2de9e740fef7506.animindex) {
        var_214d924f4e137244.var_b2de9e740fef7506 = undefined;
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c45
// Size: 0x251
function private function_95c579445e1097ca(spawnorigin, spawnangles) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_39a06a790caf5608)) {
        var_373a2c3b02b1d81c = "aitype";
        var_6fc4d2978cf27bef = var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_39a06a790caf5608;
    } else if (isdefined(var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_e4024bd5bbbd291f)) {
        var_373a2c3b02b1d81c = "character";
        var_6fc4d2978cf27bef = var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_e4024bd5bbbd291f;
    } else {
        var_373a2c3b02b1d81c = "xmodel";
        var_6fc4d2978cf27bef = var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_4f08e017049ad3cb;
    }
    if (isdefined(var_214d924f4e137244.entity)) {
        if (isagent(var_214d924f4e137244.entity)) {
            var_214d924f4e137244.entity namespace_14d36171baccf528::despawnagent();
        } else {
            var_214d924f4e137244.entity delete();
        }
    }
    entity = undefined;
    var_e94f24c42205140 = "team_eighty";
    if (var_373a2c3b02b1d81c == "aitype") {
        if (isdefined(var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_c8b64adafd8e5711)) {
            var_e51bc72666444e2d = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_SharedFunc(var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_c8b64adafd8e5711);
            var_3a7ad9d5e8329009 = random(var_e51bc72666444e2d);
            var_6fc4d2978cf27bef = function_53c4c53197386572(var_3a7ad9d5e8329009, var_6fc4d2978cf27bef);
        }
        if (namespace_3c37cb17ade254d::issharedfuncdefined("ai", "get_aitype_default_spawn_team_SharedFunc")) {
            var_e94f24c42205140 = namespace_53fc9ddbb516e6e1::get_aitype_default_spawn_team_SharedFunc();
        }
        if (namespace_3c37cb17ade254d::issharedfuncdefined("ai", "spawnNewAIType_SharedFunc")) {
            entity = namespace_53fc9ddbb516e6e1::spawnNewAIType_SharedFunc(var_6fc4d2978cf27bef, spawnorigin, spawnangles, var_e94f24c42205140);
        } else {
            entity = namespace_34f6a6adabfc542d::spawnnewagentaitype(var_6fc4d2978cf27bef, spawnorigin, spawnangles, var_e94f24c42205140);
        }
        entity useanimtree(var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.animtree.id);
    }
    return entity;
}

// Namespace scene/namespace_5952db407689619a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e9e
// Size: 0x28
function private function_12f50a9b21b4dd9a(entity) {
    var_214d924f4e137244 = self;
    return isagent(entity) && isalive(entity);
}

// Namespace scene/namespace_5952db407689619a
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ece
// Size: 0x26
function private function_61be92922a464251(var_568f62a24b19c46d, var_698da5af57b757e7, objectindex) {
    function_bea88b25e17cea66(var_568f62a24b19c46d, var_698da5af57b757e7, objectindex);
}

// Namespace scene/namespace_5952db407689619a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1efb
// Size: 0xda
function private function_6dad63edc3390487(var_bae27d121b581202, var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244.entity;
    var_7535cec6dfd38a5e = var_214d924f4e137244.var_9be58c68789faf5c function_79edcc9987330a2a(var_698da5af57b757e7);
    if (var_7535cec6dfd38a5e.size != 0) {
        var_4f3089070d8b1e24 = var_7535cec6dfd38a5e[0];
        function_549578bb9e3f4f78(entity, var_bae27d121b581202, var_4f3089070d8b1e24, undefined, undefined, undefined, 0);
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + function_3c8848a3a11b2553(getanimname(var_4f3089070d8b1e24)), entity.origin, entity.angles);
        #/
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<unknown string>" + function_3c8848a3a11b2553(getanimname(var_4f3089070d8b1e24)), var_bae27d121b581202.origin, var_bae27d121b581202.angles);
        #/
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fdc
// Size: 0x92
function private function_43a42c8097aac565(var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244.entity;
    var_d77e596283581825 = entity function_d28a53b100cbdda7(var_214d924f4e137244, var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, undefined);
    return var_d77e596283581825;
}

// Namespace scene/namespace_5952db407689619a
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2076
// Size: 0x296
function private function_549578bb9e3f4f78(entity, var_bae27d121b581202, var_4f3089070d8b1e24, var_7c6075e90a7b0fa, lerptime, var_866b3a3066122e39, animrate) {
    if (!isdefined(lerptime)) {
        lerptime = 0;
    }
    if (!isdefined(var_866b3a3066122e39)) {
        var_866b3a3066122e39 = 0;
    }
    if (!isdefined(animrate)) {
        animrate = 1;
    }
    var_214d924f4e137244 = self;
    if (!isagent(entity) || !isalive(entity)) {
        return;
    }
    function_e4fc30ccdca08b9d(var_bae27d121b581202);
    var_2e2a2f75fd49152a = getanimname(var_4f3089070d8b1e24);
    entity.var_34a25b21bc155d14 = var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_7c6075e90a7b0fa;
    if (isdefined(var_7c6075e90a7b0fa)) {
        entity.var_34a25b21bc155d14 = var_7c6075e90a7b0fa;
    }
    if (isdefined(entity.var_34a25b21bc155d14)) {
        entity setoverridearchetype("animscript", entity.var_34a25b21bc155d14, 0);
    }
    entity asmsetstate(entity.asmname, "animscripted");
    animindex = entity asm_lookupanimfromalias("animscripted", var_2e2a2f75fd49152a);
    entity.var_b65a7211c663d3ed = animindex;
    entity animmode("noclip");
    startorigin = getstartorigin(var_bae27d121b581202.origin, var_bae27d121b581202.angles, var_4f3089070d8b1e24);
    startangles = getstartangles(var_bae27d121b581202.origin, var_bae27d121b581202.angles, var_4f3089070d8b1e24);
    if (lerptime == 0) {
        entity dontinterpolate();
    }
    entity orientmode("face angle", entity.angles[1]);
    entity namespace_28edc79fcf2fe234::bb_setanimscripted();
    if (isdefined(entity.scripted_mode)) {
        entity.scripted_mode = 1;
    }
    if (isent(var_bae27d121b581202.var_13352dba0905ac7)) {
        entity unlink();
        entity forceteleport(startorigin, startangles);
        if (isdefined(var_bae27d121b581202.aligntag)) {
            entity linktomoveoffset(var_bae27d121b581202.var_13352dba0905ac7, var_bae27d121b581202.aligntag);
        } else {
            entity linktomoveoffset(var_bae27d121b581202.var_13352dba0905ac7);
        }
    } else {
        entity forceteleport(startorigin, startangles);
    }
    entity aisetanim("animscripted", animindex, animrate, var_866b3a3066122e39);
    entity callback::remove("on_ai_killed", &function_c1a5da4f68a742a6, 1);
    entity callback::add("on_ai_killed", &function_c1a5da4f68a742a6);
}

// Namespace scene/namespace_5952db407689619a
// Params 11, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2313
// Size: 0x221
function private function_d28a53b100cbdda7(var_214d924f4e137244, var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, var_7c6075e90a7b0fa) {
    entity = self;
    entity endon("scene_monitor_players_agent_will_be_despawned");
    entity endon("scene_monitor_players_new_animation_for_agent");
    entity endon("agent_scene_stop");
    entity endon("death_or_disconnect");
    if (!isdefined(entity)) {
        return;
    }
    if (!isagent(entity)) {
        return;
    }
    if (!isalive(entity)) {
        return;
    }
    blendtime = function_53c4c53197386572(blendtime, 0);
    lerptime = function_53c4c53197386572(lerptime, 0);
    if (isdefined(var_214d924f4e137244.var_84b542bb7490bea7.var_43286fd46706909c)) {
        blendtime = 0;
        lerptime = 0;
    }
    var_2e2a2f75fd49152a = getanimname(var_4f3089070d8b1e24);
    n_anim_length = getanimlength(var_4f3089070d8b1e24);
    var_7a4a31d740c51ee8 = n_anim_length - var_866b3a3066122e39 * n_anim_length;
    if (var_866b3a3066122e39 < 1) {
        var_214d924f4e137244 childthread function_8e9f8e1fbe2b7ab4(notifystring, var_4f3089070d8b1e24);
    }
    var_214d924f4e137244 function_549578bb9e3f4f78(entity, var_bae27d121b581202, var_4f3089070d8b1e24, var_7c6075e90a7b0fa, lerptime, var_866b3a3066122e39);
    var_214d924f4e137244 function_bdfc45b799d27532(var_4f3089070d8b1e24);
    if (var_866b3a3066122e39 < 1) {
        if (function_8581f011ce975a6(var_4f3089070d8b1e24)) {
            while (1) {
                var_6fde8947aa74cf43 = entity namespace_bf5a1761a8d1bb07::asm_donotetracks(entity.asmname, "animscripted", namespace_bf5a1761a8d1bb07::asm_getnotehandler(entity.asmname, "animscripted"));
                if (is_equal(var_6fde8947aa74cf43, "end")) {
                    break;
                }
            }
        } else {
            wait(var_7a4a31d740c51ee8);
        }
    }
    entity.var_b65a7211c663d3ed = undefined;
    if (isdefined(entity.scripted_mode)) {
        entity.scripted_mode = 0;
    }
    entity namespace_28edc79fcf2fe234::bb_clearanimscripted();
    entity orientmode("face current");
    entity animmode("none");
    if (isdefined(entity.var_34a25b21bc155d14)) {
        entity clearoverridearchetype("animscript");
        entity.var_34a25b21bc155d14 = undefined;
    }
    return var_7a4a31d740c51ee8;
}

// Namespace scene/namespace_5952db407689619a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x253c
// Size: 0x71
function private function_c1a5da4f68a742a6(params) {
    if (isdefined(self)) {
        if (isdefined(self.var_34a25b21bc155d14)) {
            self clearoverridearchetype("animscript");
            self.var_34a25b21bc155d14 = undefined;
        }
        if (isdefined(self.var_214d924f4e137244)) {
            self.var_214d924f4e137244.entity = undefined;
            self.var_214d924f4e137244 = undefined;
        }
        callback::remove("on_ai_killed", &function_c1a5da4f68a742a6, 1);
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25b4
// Size: 0x182
function private function_2d573d9c69823343() {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity notify("stop_loop");
        var_214d924f4e137244.entity notify("single anim", "end");
        var_214d924f4e137244.entity notify("looping anim", "end");
        var_214d924f4e137244.entity notify("stop_animmode");
        var_214d924f4e137244.entity notify("agent_scene_stop");
        if (isdefined(var_214d924f4e137244.entity.scripted_mode)) {
            var_214d924f4e137244.entity.scripted_mode = 0;
        }
        if (isalive(var_214d924f4e137244.entity) && var_214d924f4e137244.entity namespace_28edc79fcf2fe234::bb_isanimscripted()) {
            var_214d924f4e137244.entity namespace_28edc79fcf2fe234::bb_clearanimscripted();
        }
        var_214d924f4e137244.entity orientmode("face current");
        var_214d924f4e137244.entity animmode("none");
        var_214d924f4e137244.entity stopanimscripted();
        var_214d924f4e137244.entity.var_b65a7211c663d3ed = undefined;
        if (isdefined(var_214d924f4e137244.entity.var_34a25b21bc155d14)) {
            var_214d924f4e137244.entity clearoverridearchetype("animscript");
            var_214d924f4e137244.entity.var_34a25b21bc155d14 = undefined;
        }
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x273d
// Size: 0x6f
function private function_4efd74883670af4c() {
    var_214d924f4e137244 = self;
    if (isagent(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity.nocorpse = 1;
        var_214d924f4e137244.entity namespace_14d36171baccf528::despawnagent();
    } else if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity delete();
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27b3
// Size: 0x128
function private function_642077a65edc7954(var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.entity)) {
        return;
    }
    if (isdefined(var_214d924f4e137244.entity.scripted_mode)) {
        var_214d924f4e137244.entity.scripted_mode = 0;
    }
    if (isalive(var_214d924f4e137244.entity) && var_214d924f4e137244.entity namespace_28edc79fcf2fe234::bb_isanimscripted()) {
        var_214d924f4e137244.entity namespace_28edc79fcf2fe234::bb_clearanimscripted();
    }
    var_214d924f4e137244.entity orientmode("face current");
    var_214d924f4e137244.entity animmode("none");
    var_214d924f4e137244.entity stopanimscripted();
    var_214d924f4e137244.entity.var_b65a7211c663d3ed = undefined;
    if (isdefined(var_214d924f4e137244.entity.var_34a25b21bc155d14)) {
        var_214d924f4e137244.entity clearoverridearchetype("animscript");
        var_214d924f4e137244.entity.var_34a25b21bc155d14 = undefined;
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x28e2
// Size: 0x332
function private function_70bd06355933aec9(var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244.entity;
    if (!isdefined(entity)) {
        return;
    }
    var_f4c57b09ea3f9539 = 0;
    done = 0;
    if (entity.model == "") {
        /#
            println("<unknown string>" + var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.name + "<unknown string>");
        #/
        return 0;
    }
    entity val::set("scene_shot", "cinematics_participant", 1);
    if (isdefined(var_214d924f4e137244.var_84b542bb7490bea7.var_43286fd46706909c)) {
        blendtime = 0;
        lerptime = 0;
    }
    var_2e2a2f75fd49152a = getanimname(var_4f3089070d8b1e24);
    function_e4fc30ccdca08b9d(var_bae27d121b581202);
    var_6325cb53ec163839 = "none";
    if (blendtime > 0 && blendtime < 1) {
        var_6325cb53ec163839 = "normal";
    } else if (blendtime >= 1) {
        var_6325cb53ec163839 = "slow";
    }
    var_bc4340437549698a = 0;
    if (isdefined(var_866b3a3066122e39) && var_866b3a3066122e39 > 0) {
        var_bc4340437549698a = getanimlength(var_4f3089070d8b1e24) * var_866b3a3066122e39;
    }
    if (var_866b3a3066122e39 < 1) {
        var_214d924f4e137244 childthread function_8e9f8e1fbe2b7ab4(notifystring, var_4f3089070d8b1e24);
    }
    if (var_214d924f4e137244 function_7f90ebd0aa7ad958(var_698da5af57b757e7)) {
        var_6db82a0c287ea33 = var_214d924f4e137244.var_84b542bb7490bea7.var_db52b4a8aba13320 function_ee55ab255c0be00d();
        if (var_6db82a0c287ea33 == "AnimScripted") {
            entity scriptmodelclearanim();
            entity useanimtree(var_214d924f4e137244.var_9be58c68789faf5c function_c106523f3836b90b());
            entity animscripted(notifystring, var_bae27d121b581202.origin, var_bae27d121b581202.angles, var_4f3089070d8b1e24, undefined, undefined, blendtime);
            entity scriptmodelplayanim(var_2e2a2f75fd49152a, undefined, var_bc4340437549698a, 1, var_6325cb53ec163839);
            var_214d924f4e137244 function_bdfc45b799d27532(var_4f3089070d8b1e24);
            if (var_866b3a3066122e39 < 1) {
                entity function_ee012c2dd711a8ce(notifystring, "end", "stop_animmode");
            }
        } else if (var_6db82a0c287ea33 == "ScriptModelPlayAnimDeltaMotionFromPos") {
            entity stopuseanimtree();
            entity scriptmodelplayanimdeltamotionfrompos(var_2e2a2f75fd49152a, var_bae27d121b581202.origin, var_bae27d121b581202.angles, notifystring, var_bc4340437549698a, var_6325cb53ec163839);
            var_214d924f4e137244 function_bdfc45b799d27532(var_4f3089070d8b1e24);
            if (var_866b3a3066122e39 < 1) {
                entity function_ee012c2dd711a8ce(notifystring, "end", "stop_animmode");
            }
        }
    } else {
        entity stopuseanimtree();
        entity scriptmodelplayanim(var_2e2a2f75fd49152a, notifystring, var_bc4340437549698a, 1, var_6325cb53ec163839);
        var_214d924f4e137244 function_bdfc45b799d27532(var_4f3089070d8b1e24);
        entity function_ee012c2dd711a8ce(notifystring, "end", "stop_animmode");
        entity scriptmodelclearanim();
        entity useanimtree(var_214d924f4e137244.var_9be58c68789faf5c function_c106523f3836b90b());
    }
    var_f4c57b09ea3f9539 = var_f4c57b09ea3f9539 + getanimlength(var_4f3089070d8b1e24);
    return var_f4c57b09ea3f9539 - var_866b3a3066122e39 * var_f4c57b09ea3f9539;
}

// Namespace scene/namespace_5952db407689619a
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c1c
// Size: 0x2db
function private function_5552728c9588fd02(var_698da5af57b757e7, animindex, notifystring, var_bae27d121b581202, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244.entity;
    if (!isdefined(entity)) {
        return;
    }
    var_f4c57b09ea3f9539 = 0;
    done = 0;
    if (entity.model == "") {
        /#
            println("<unknown string>" + var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.name + "<unknown string>");
        #/
        return 0;
    }
    entity endon("death_or_disconnect");
    entity endon("vehicle_scene_stop");
    blendtime = function_53c4c53197386572(blendtime, 0);
    lerptime = function_53c4c53197386572(lerptime, 0);
    if (isdefined(var_214d924f4e137244.var_84b542bb7490bea7.var_43286fd46706909c)) {
        blendtime = 0;
        lerptime = 0;
    }
    var_2e2a2f75fd49152a = getanimname(var_4f3089070d8b1e24);
    function_e4fc30ccdca08b9d(var_bae27d121b581202);
    if (entity vehicle_isphysveh()) {
        entity function_247ad6a91f6a4ffe(1);
        entity vehphys_forcekeyframedmotion();
    } else {
        entity notsolid();
    }
    if (lerptime == 0) {
        entity dontinterpolate();
    }
    startorigin = getstartorigin(var_bae27d121b581202.origin, var_bae27d121b581202.angles, var_4f3089070d8b1e24);
    startangles = getstartangles(var_bae27d121b581202.origin, var_bae27d121b581202.angles, var_4f3089070d8b1e24);
    entity vehicle_teleport(startorigin, startangles);
    if (var_866b3a3066122e39 < 1) {
        var_214d924f4e137244 childthread function_8e9f8e1fbe2b7ab4(notifystring, var_4f3089070d8b1e24);
    }
    entity animscripted(notifystring, var_bae27d121b581202.origin, var_bae27d121b581202.angles, var_4f3089070d8b1e24, undefined, undefined, blendtime);
    entity vehicleplayanim(var_4f3089070d8b1e24);
    var_214d924f4e137244 function_bdfc45b799d27532(var_4f3089070d8b1e24);
    if (isdefined(var_866b3a3066122e39) && var_866b3a3066122e39 > 0 && var_866b3a3066122e39 <= 1) {
        if (var_866b3a3066122e39 == 1 && function_8581f011ce975a6(var_4f3089070d8b1e24)) {
            var_866b3a3066122e39 = 0.999;
        }
        var_214d924f4e137244 function_380708345e16e475(var_4f3089070d8b1e24, var_866b3a3066122e39);
    }
    var_f4c57b09ea3f9539 = var_f4c57b09ea3f9539 + getanimlength(var_4f3089070d8b1e24);
    n_wait_time = var_f4c57b09ea3f9539 - var_866b3a3066122e39 * var_f4c57b09ea3f9539;
    if (var_866b3a3066122e39 < 1) {
        wait(n_wait_time);
    }
    if (entity vehicle_isphysveh()) {
        entity function_247ad6a91f6a4ffe(0);
        entity vehphys_setdefaultmotion();
    } else {
        entity solid();
    }
    if (isdefined(entity.var_cb77a772d04fc8e4)) {
        entity thread [[ entity.var_cb77a772d04fc8e4 ]]();
    }
    return n_wait_time;
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2eff
// Size: 0xdd
function private function_b8c3ea8ca94cea0c() {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity notify("stop_loop");
        var_214d924f4e137244.entity notify("single anim", "end");
        var_214d924f4e137244.entity notify("looping anim", "end");
        var_214d924f4e137244.entity notify("stop_animmode");
        var_214d924f4e137244.entity notify("vehicle_scene_stop");
        var_214d924f4e137244.entity stopanimscripted();
        if (var_214d924f4e137244.entity vehicle_isphysveh()) {
            var_214d924f4e137244.entity function_247ad6a91f6a4ffe(0);
            var_214d924f4e137244.entity vehphys_setdefaultmotion();
        } else {
            var_214d924f4e137244.entity solid();
        }
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2fe3
// Size: 0x151
function private function_bcf0caa0a00df979(spawnorigin, spawnangles) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.vehiclename)) {
        var_373a2c3b02b1d81c = "vehicle";
        var_6fc4d2978cf27bef = var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.vehiclename;
    } else {
        var_373a2c3b02b1d81c = "xmodel";
        var_6fc4d2978cf27bef = var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_4f08e017049ad3cb;
    }
    if (!isdefined(var_214d924f4e137244.entity)) {
        if (var_373a2c3b02b1d81c == "vehicle") {
            spawndata = spawnstruct();
            spawndata.origin = spawnorigin;
            spawndata.angles = spawnangles;
            spawndata.vehicletype = var_6fc4d2978cf27bef;
            spawndata.targetname = "scene_vehicle";
            spawndata.modelname = function_4feb334351c0c1ca(var_6fc4d2978cf27bef);
            var_214d924f4e137244.entity = namespace_f64231d5b7a2c3c4::_spawnvehicle(spawndata);
        } else {
            var_214d924f4e137244.entity = utility::spawn_model(var_6fc4d2978cf27bef, spawnorigin, spawnangles);
        }
    }
    return var_214d924f4e137244.entity;
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x313c
// Size: 0x2f
function private function_e4b0080d3057884f() {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity delete();
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3172
// Size: 0x13
function private function_684629695ffebbdb(entity) {
    return entity namespace_dbbb37eb352edf96::isvehicle();
}

// Namespace scene/namespace_5952db407689619a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x318d
// Size: 0x60
function private function_2e11be8a4ef151b5(animname, animtree) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity) && !isdefined(var_214d924f4e137244.entity.animname)) {
        var_214d924f4e137244.entity.animname = animname;
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x31f4
// Size: 0x92
function private function_cc538c3233d741af() {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity stopanimscripted();
        var_214d924f4e137244.entity scriptmodelclearanim();
        var_214d924f4e137244.entity notify("stop_loop");
        var_214d924f4e137244.entity notify("single anim", "end");
        var_214d924f4e137244.entity notify("looping anim", "end");
        var_214d924f4e137244.entity notify("stop_animmode");
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x328d
// Size: 0x40
function private function_8bac7edf73a29d6b(var_bae27d121b581202, var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity scriptmodelclearanim();
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32d4
// Size: 0x96
function private function_e8800b55f7cbd5a4(origin, angles) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244.entity;
    if (isdefined(entity)) {
        if (!isagent(entity) && !isplayer(entity) && entity.model != "") {
            entity scriptmodelclearanim();
        }
        entity dontinterpolate();
        if (isdefined(origin)) {
            entity.origin = origin;
        }
        if (isdefined(angles)) {
            entity.angles = angles;
        }
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3371
// Size: 0x34
function private function_83f1be5a5eb5f706(entity) {
    if (isdefined(entity.classname) && entity.classname == "script_model") {
        return 1;
    }
    return 0;
}

// Namespace scene/namespace_5952db407689619a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x33ad
// Size: 0xa9
function private function_d776460a61b689bf(var_698da5af57b757e7) {
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots)) {
        return 0;
    }
    if (var_698da5af57b757e7 < 0 || var_698da5af57b757e7 >= var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots.size) {
        return 0;
    }
    var_907051501530beee = var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots[var_698da5af57b757e7];
    return function_53c4c53197386572(var_907051501530beee.var_25a8d725d83b4fc1, 0);
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x345e
// Size: 0x2b
function private function_4e15410d3aae945c() {
    var_214d924f4e137244 = self;
    var_dcf5e15c58c4152a = var_214d924f4e137244 function_a2142af2db8fbb0();
    return isdefined(var_dcf5e15c58c4152a) && var_dcf5e15c58c4152a.size > 0;
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3491
// Size: 0x2e
function private function_f66e8916121d9737() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_8e16e8d6f4501d72;
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34c7
// Size: 0x2e
function private function_a2142af2db8fbb0() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_ab73f93a436a7409;
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34fd
// Size: 0x2e
function private function_7c9fcb0161b76b2d() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_ed40a4854b93740c;
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3533
// Size: 0x2e
function private function_23cc62938b72190b() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.var_6b7d083fa865688a;
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3569
// Size: 0x5f9
function private function_22f6fca8362a92b() {
    var_568f62a24b19c46d = self;
    var_568f62a24b19c46d endon("Stopped");
    var_84b542bb7490bea7 = var_568f62a24b19c46d.var_5aaf7c7163c04623.var_84b542bb7490bea7;
    if (!isdefined(var_568f62a24b19c46d.var_ca29a69dc742b367)) {
        var_568f62a24b19c46d.var_ca29a69dc742b367 = [];
    }
    var_6e050937039896b9 = 0;
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        if (var_214d924f4e137244 function_acef03c7ed4a3f86() == "Types_Player") {
            var_568f62a24b19c46d.var_ca29a69dc742b367[var_6e050937039896b9] = spawnstruct();
            var_568f62a24b19c46d.var_ca29a69dc742b367[var_6e050937039896b9].var_1f8a5343efe1dda5 = 1;
            if (var_214d924f4e137244 function_3e13497ed7044cbd()) {
                if (isdefined(var_214d924f4e137244.var_17f5321d96d1bf24)) {
                    if (isdefined(var_84b542bb7490bea7.var_214d924f4e137244[var_214d924f4e137244.var_17f5321d96d1bf24].entity)) {
                        var_568f62a24b19c46d.var_ca29a69dc742b367[var_6e050937039896b9].var_1f8a5343efe1dda5 = 0;
                    }
                }
            } else if (isdefined(var_214d924f4e137244.var_9668be326e00024b)) {
                if (isdefined(var_84b542bb7490bea7.var_214d924f4e137244[var_214d924f4e137244.var_9668be326e00024b].entity)) {
                    var_568f62a24b19c46d.var_ca29a69dc742b367[var_6e050937039896b9].var_1f8a5343efe1dda5 = 0;
                }
            }
            var_6e050937039896b9++;
        }
    }
    var_568f62a24b19c46d function_a8bfee1f6abe8209();
    while (1) {
        waittillframeend();
        playerindex = 0;
        for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
            var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
            if (var_214d924f4e137244 function_acef03c7ed4a3f86() == "Types_Player") {
                var_1f8a5343efe1dda5 = istrue(var_568f62a24b19c46d.var_ca29a69dc742b367[playerindex].var_1f8a5343efe1dda5);
                var_78a74cdc6a350b7c = var_214d924f4e137244 function_4e15410d3aae945c() || isdefined(var_214d924f4e137244 function_f66e8916121d9737());
                if (var_1f8a5343efe1dda5 && var_78a74cdc6a350b7c && !isdefined(var_214d924f4e137244.entity) && !var_214d924f4e137244 function_fe495eb5e40771ec(var_84b542bb7490bea7)) {
                    var_55a633546dd964d7 = var_568f62a24b19c46d.var_ca29a69dc742b367[playerindex];
                    var_84cccd2e89c1bbe7 = !isdefined(var_214d924f4e137244 function_f66e8916121d9737());
                    if (var_84cccd2e89c1bbe7) {
                        if (isdefined(var_214d924f4e137244.var_b2de9e740fef7506) && !isdefined(var_55a633546dd964d7.var_2533e0d8a4abdc19)) {
                            var_214d924f4e137244 function_fa25c05bae26b761(var_214d924f4e137244.var_b2de9e740fef7506, var_55a633546dd964d7);
                        }
                        if (isdefined(var_214d924f4e137244.var_b2de9e740fef7506) && var_214d924f4e137244.var_b2de9e740fef7506.var_910bb5a10c1baada) {
                            var_2533e0d8a4abdc19 = var_55a633546dd964d7.var_2533e0d8a4abdc19;
                            if (isdefined(var_2533e0d8a4abdc19)) {
                                var_2533e0d8a4abdc19 notify("scene_monitor_players_new_animation_for_agent");
                                var_6751e5eb36fccfa9 = var_214d924f4e137244.var_b2de9e740fef7506;
                                n_anim_length = getanimlength(var_6751e5eb36fccfa9.var_4f3089070d8b1e24);
                                var_b7d39a4661f3460 = gettime();
                                var_c952be88c3ffef2f = (var_b7d39a4661f3460 - var_6751e5eb36fccfa9.var_fe62dc1bdc14feca) / 1000;
                                var_53cea02c2ced41aa = var_6751e5eb36fccfa9.var_866b3a3066122e39;
                                if (n_anim_length > 0) {
                                    var_53cea02c2ced41aa = var_53cea02c2ced41aa + var_c952be88c3ffef2f / n_anim_length;
                                }
                                var_7c6075e90a7b0fa = var_214d924f4e137244 function_23cc62938b72190b();
                                var_2533e0d8a4abdc19 thread function_d28a53b100cbdda7(var_214d924f4e137244, var_6751e5eb36fccfa9.var_698da5af57b757e7, var_6751e5eb36fccfa9.animindex, var_6751e5eb36fccfa9.notifystring, var_6751e5eb36fccfa9.var_bae27d121b581202, var_6751e5eb36fccfa9.var_4f3089070d8b1e24, var_53cea02c2ced41aa, var_6751e5eb36fccfa9.blendtime, var_6751e5eb36fccfa9.blendcurve, var_6751e5eb36fccfa9.lerptime, var_7c6075e90a7b0fa);
                                var_214d924f4e137244.var_b2de9e740fef7506.var_910bb5a10c1baada = 0;
                            }
                        }
                    } else {
                        if (isdefined(var_214d924f4e137244.var_b2de9e740fef7506) && !isdefined(var_55a633546dd964d7.var_5822ce3cdbd50f4)) {
                            modelname = var_214d924f4e137244 function_f66e8916121d9737();
                            var_55a633546dd964d7.var_5822ce3cdbd50f4 = function_6a16552e40cb91e1(var_214d924f4e137244.var_b2de9e740fef7506.var_bae27d121b581202.origin, var_214d924f4e137244.var_b2de9e740fef7506.var_bae27d121b581202.angles, modelname);
                            var_214d924f4e137244.var_647acce9fbbb526c = var_55a633546dd964d7.var_5822ce3cdbd50f4;
                            var_214d924f4e137244.entity = var_214d924f4e137244.var_647acce9fbbb526c;
                            var_214d924f4e137244 function_535e6f4c06c15b1d(var_568f62a24b19c46d, 1, 0, var_214d924f4e137244.var_bae27d121b581202);
                        }
                        if (isdefined(var_214d924f4e137244.var_b2de9e740fef7506) && var_214d924f4e137244.var_b2de9e740fef7506.var_910bb5a10c1baada) {
                            var_5822ce3cdbd50f4 = var_55a633546dd964d7.var_5822ce3cdbd50f4;
                            if (isdefined(var_5822ce3cdbd50f4)) {
                                var_6751e5eb36fccfa9 = var_214d924f4e137244.var_b2de9e740fef7506;
                                n_anim_length = getanimlength(var_6751e5eb36fccfa9.var_4f3089070d8b1e24);
                                var_b7d39a4661f3460 = gettime();
                                var_c952be88c3ffef2f = float(var_b7d39a4661f3460 - var_6751e5eb36fccfa9.var_fe62dc1bdc14feca) / 1000;
                                var_2e2a2f75fd49152a = getanimname(var_6751e5eb36fccfa9.var_4f3089070d8b1e24);
                                var_6325cb53ec163839 = "none";
                                var_5822ce3cdbd50f4 stopuseanimtree();
                                var_5822ce3cdbd50f4 scriptmodelplayanimdeltamotionfrompos(var_2e2a2f75fd49152a, var_6751e5eb36fccfa9.var_bae27d121b581202.origin, var_6751e5eb36fccfa9.var_bae27d121b581202.angles, var_6751e5eb36fccfa9.notifystring, var_c952be88c3ffef2f, var_6325cb53ec163839);
                                var_214d924f4e137244.var_b2de9e740fef7506.var_910bb5a10c1baada = 0;
                            }
                        }
                    }
                }
                playerindex++;
            }
        }
        waitframe();
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3b69
// Size: 0x89
function private function_276d3342cddac11a() {
    var_568f62a24b19c46d = self;
    if (!isdefined(var_568f62a24b19c46d.var_ca29a69dc742b367)) {
        return;
    }
    foreach (var_55a633546dd964d7 in var_568f62a24b19c46d.var_ca29a69dc742b367) {
        function_f4cf37b2c85bb5c0(var_55a633546dd964d7);
        function_870557fc814fab46(var_55a633546dd964d7);
    }
    var_568f62a24b19c46d.var_ca29a69dc742b367 = undefined;
}

// Namespace scene/namespace_5952db407689619a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3bf9
// Size: 0xc9
function private function_fa25c05bae26b761(var_6751e5eb36fccfa9, var_55a633546dd964d7) {
    var_214d924f4e137244 = self;
    agent_type = var_214d924f4e137244 function_a2142af2db8fbb0();
    var_496f2ebba4c22ee = var_214d924f4e137244 function_7c9fcb0161b76b2d();
    var_6b2ae165daddd53e = namespace_34f6a6adabfc542d::spawnnewagentaitype(agent_type, var_6751e5eb36fccfa9.var_bae27d121b581202.origin, var_6751e5eb36fccfa9.var_bae27d121b581202.angles, var_496f2ebba4c22ee);
    var_55a633546dd964d7.var_2533e0d8a4abdc19 = var_6b2ae165daddd53e;
    var_214d924f4e137244.var_647acce9fbbb526c = var_6b2ae165daddd53e;
    var_214d924f4e137244.entity = var_6b2ae165daddd53e;
    var_214d924f4e137244 function_535e6f4c06c15b1d(var_214d924f4e137244.var_568f62a24b19c46d, 1, 0, var_214d924f4e137244.var_bae27d121b581202);
}

// Namespace scene/namespace_5952db407689619a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cc9
// Size: 0x6a
function private function_f4cf37b2c85bb5c0(var_55a633546dd964d7) {
    if (!isdefined(var_55a633546dd964d7.var_2533e0d8a4abdc19)) {
        return;
    }
    var_2533e0d8a4abdc19 = var_55a633546dd964d7.var_2533e0d8a4abdc19;
    var_2533e0d8a4abdc19 notify("scene_monitor_players_agent_will_be_despawned");
    /#
        assert(isagent(var_2533e0d8a4abdc19));
    #/
    var_2533e0d8a4abdc19.nocorpse = 1;
    var_2533e0d8a4abdc19 namespace_14d36171baccf528::despawnagent();
    var_55a633546dd964d7.var_2533e0d8a4abdc19 = undefined;
}

// Namespace scene/namespace_5952db407689619a
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d3a
// Size: 0x4e
function private function_6a16552e40cb91e1(spawnorigin, spawnangles, modelname) {
    newentity = utility::spawn_model(modelname, spawnorigin, spawnangles);
    newentity forcenetfieldhighlod(1);
    newentity val::set("scene_shot", "cinematics_participant", 1);
    return newentity;
}

// Namespace scene/namespace_5952db407689619a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d90
// Size: 0x44
function private function_870557fc814fab46(var_55a633546dd964d7) {
    if (!isdefined(var_55a633546dd964d7.var_5822ce3cdbd50f4)) {
        return;
    }
    var_5822ce3cdbd50f4 = var_55a633546dd964d7.var_5822ce3cdbd50f4;
    var_5822ce3cdbd50f4 delete();
    var_55a633546dd964d7.var_5822ce3cdbd50f4 = undefined;
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ddb
// Size: 0x1d4
function private function_a8bfee1f6abe8209() {
    var_568f62a24b19c46d = self;
    var_84b542bb7490bea7 = var_568f62a24b19c46d.var_5aaf7c7163c04623.var_84b542bb7490bea7;
    playerindex = 0;
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        if (var_214d924f4e137244 function_acef03c7ed4a3f86() == "Types_Player") {
            var_1f8a5343efe1dda5 = istrue(var_568f62a24b19c46d.var_ca29a69dc742b367[playerindex].var_1f8a5343efe1dda5);
            var_78a74cdc6a350b7c = isdefined(var_214d924f4e137244 function_f66e8916121d9737());
            if (var_1f8a5343efe1dda5 && var_78a74cdc6a350b7c && !isdefined(var_214d924f4e137244.entity)) {
                var_55a633546dd964d7 = var_568f62a24b19c46d.var_ca29a69dc742b367[playerindex];
                if (!isdefined(var_55a633546dd964d7.var_5822ce3cdbd50f4)) {
                    spawnorigin = var_568f62a24b19c46d.var_5aaf7c7163c04623.origin;
                    spawnorigin = spawnorigin + (0, 0, -200);
                    spawnangles = var_568f62a24b19c46d.var_5aaf7c7163c04623.angles;
                    modelname = var_214d924f4e137244 function_f66e8916121d9737();
                    var_55a633546dd964d7.var_5822ce3cdbd50f4 = function_6a16552e40cb91e1(spawnorigin, spawnangles, modelname);
                    var_214d924f4e137244.var_647acce9fbbb526c = var_55a633546dd964d7.var_5822ce3cdbd50f4;
                    var_214d924f4e137244.entity = var_214d924f4e137244.var_647acce9fbbb526c;
                    if (isdefined(var_214d924f4e137244.var_bae27d121b581202)) {
                        var_214d924f4e137244 function_535e6f4c06c15b1d(var_568f62a24b19c46d, 1, 0, var_214d924f4e137244.var_bae27d121b581202);
                    }
                }
            }
            playerindex++;
        }
    }
}

// Namespace scene/namespace_5952db407689619a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3fb6
// Size: 0x9b
function private function_fe495eb5e40771ec(var_84b542bb7490bea7) {
    var_214d924f4e137244 = self;
    if (var_214d924f4e137244 function_acef03c7ed4a3f86() != "Types_Player") {
        return 0;
    }
    if (var_214d924f4e137244 function_3e13497ed7044cbd()) {
        if (isdefined(var_214d924f4e137244.var_17f5321d96d1bf24)) {
            return isdefined(var_84b542bb7490bea7.var_214d924f4e137244[var_214d924f4e137244.var_17f5321d96d1bf24].var_647acce9fbbb526c);
        }
        return 0;
    }
    if (isdefined(var_214d924f4e137244.var_9668be326e00024b)) {
        return isdefined(var_84b542bb7490bea7.var_214d924f4e137244[var_214d924f4e137244.var_9668be326e00024b].var_647acce9fbbb526c);
    }
    return 0;
}

// Namespace scene/namespace_5952db407689619a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4059
// Size: 0x5
function function_720d21706a7ff164() {
    return 1;
}

// Namespace scene/namespace_5952db407689619a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4066
// Size: 0x31
function function_f66b22351778fe49(enabled) {
    /#
        assert(isplayer(self));
    #/
    player = self;
    player namespace_448ccf1ca136fbbe::function_a7634932f5d9565c(enabled, 0);
}

// Namespace scene/namespace_5952db407689619a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x409e
// Size: 0xda
function function_d18c2d3d2819c322(entity, var_214d924f4e137244) {
    /#
        assert(isplayer(entity));
    #/
    var_84b542bb7490bea7 = var_214d924f4e137244.var_84b542bb7490bea7;
    var_dbdcde08b6a6c0f2 = var_214d924f4e137244 function_3e13497ed7044cbd();
    if (var_dbdcde08b6a6c0f2) {
        if (isdefined(var_214d924f4e137244.var_17f5321d96d1bf24)) {
            if (isdefined(var_84b542bb7490bea7.var_214d924f4e137244[var_214d924f4e137244.var_17f5321d96d1bf24].entity)) {
                return 0;
            }
        }
    } else if (isdefined(var_214d924f4e137244.var_9668be326e00024b)) {
        if (isdefined(var_84b542bb7490bea7.var_214d924f4e137244[var_214d924f4e137244.var_9668be326e00024b].entity)) {
            return 0;
        }
    }
    var_a7f983dc6ed7cd38 = entity namespace_f8065cafc523dba5::isfemale();
    if (var_dbdcde08b6a6c0f2 != var_a7f983dc6ed7cd38) {
        return 0;
    }
    return 1;
}

