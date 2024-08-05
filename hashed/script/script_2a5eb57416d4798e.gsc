#using scripts\engine\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\common\notetrack.gsc;
#using scripts\common\scene.gsc;
#using script_784c8c4f3e5f8686;
#using script_308091d56071a91c;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
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

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x5ee
// Size: 0x332
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
    function_7855ec4caf5901f9("Types_Player", "objectDelete", &player_delete);
    function_7855ec4caf5901f9("Types_Player", "shotObjectPrepare", &function_43972bd744497667);
    function_7855ec4caf5901f9("Types_Player", "shotObjectCleanup", &function_8b3b351a42e84dc2);
    function_7855ec4caf5901f9("Types_Player", "objectMatchEntity", &function_70e05db9c7c6c130);
    function_7855ec4caf5901f9("Types_Player", "objectGetLinkEnts", &function_ca4527bcd586d366);
    function_7855ec4caf5901f9("Types_Player", "objectCleanup", &function_f5c1014e1cfdf615);
    function_7855ec4caf5901f9("Types_Player", "objectStoreAnimRequest", &function_8cd22f505439309f);
    function_7855ec4caf5901f9("Types_Player", "objectClearAnimRequest", &function_3e4cf61872dc003b);
    function_7855ec4caf5901f9("Types_Actor", "objectSpawn", &agent_spawn);
    function_7855ec4caf5901f9("Types_Actor", "shotObjectPrepare", &function_61be92922a464251);
    function_7855ec4caf5901f9("Types_Actor", "objectMatchEntity", &function_12f50a9b21b4dd9a);
    function_7855ec4caf5901f9("Types_Actor", "shotObjectPlayAnim", &function_43a42c8097aac565);
    function_7855ec4caf5901f9("Types_Actor", "shotObjectStopAnim", &function_2d573d9c69823343);
    function_7855ec4caf5901f9("Types_Actor", "objectDelete", &agent_delete);
    function_7855ec4caf5901f9("Types_Actor", "shotObjectCleanup", &function_642077a65edc7954);
    function_7855ec4caf5901f9("Types_Actor", "shotObjectFirstFrame", &function_6dad63edc3390487);
    function_7855ec4caf5901f9("Types_Vehicle", "objectSpawn", &function_bcf0caa0a00df979);
    function_7855ec4caf5901f9("Types_Vehicle", "shotObjectPlayAnim", &function_5552728c9588fd02);
    function_7855ec4caf5901f9("Types_Vehicle", "shotObjectStopAnim", &function_b8c3ea8ca94cea0c);
    function_7855ec4caf5901f9("Types_Vehicle", "objectDelete", &vehicle_delete);
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

// Namespace scene / namespace_5952db407689619a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x928
// Size: 0x7d
function private function_70e05db9c7c6c130(entity) {
    /#
        if (function_2fbba7f29e8d78ce(self.index, entity)) {
            entity.animname = self.sceneobject.variant_object.name;
            return 1;
        }
    #/
    var_214d924f4e137244 = self;
    isplayerentity = isplayer(entity);
    if (isdefined(isplayerentity)) {
        if (!function_ac04e049ff623301(entity, var_214d924f4e137244)) {
            return 0;
        }
    }
    return isplayerentity;
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9ae
// Size: 0x2e
function private function_72777e12c4307f96() {
    var_214d924f4e137244 = self;
    return istrue(var_214d924f4e137244.sceneobject.variant_object.var_59f9757349c241a1);
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9e5
// Size: 0x2d
function private function_be5a45fff59957b() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244.sceneobject.variant_object.var_d192b38b7ad90242;
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa1b
// Size: 0x2d
function private function_306026c41bd7abbd() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244.sceneobject.variant_object.var_a6da0bee0f0e8948;
}

// Namespace scene / namespace_5952db407689619a
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xa51
// Size: 0x87
function private set_character_models(bodymodelname, headmodelname, viewmodelname) {
    if (isdefined(self.headmodel)) {
        self detach(self.headmodel);
    }
    if (!isagent(self)) {
        bodymodelname = self getcustomizationbody();
        headmodelname = self getcustomizationhead();
        viewmodelname = self getcustomizationviewmodel();
    }
    self setmodel(bodymodelname);
    self setviewmodel(viewmodelname);
    if (isdefined(headmodelname)) {
        self attach(headmodelname, "", 1);
        self.headmodel = headmodelname;
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xae0
// Size: 0x5a
function private function_ec6039191e7c076a(player, var_36a19240d8d46bc2, newheadmodel) {
    assert(isdefined(player));
    assert(isplayer(player));
    player setcustomization(var_36a19240d8d46bc2, newheadmodel);
    var_e243ecbc215e7e07 = player getcustomizationviewmodel();
    player set_character_models(var_36a19240d8d46bc2, newheadmodel, var_e243ecbc215e7e07);
}

// Namespace scene / namespace_5952db407689619a
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xb42
// Size: 0x27f
function private function_43972bd744497667(sceneplay, shotindex, objectindex) {
    var_214d924f4e137244 = self;
    player = var_214d924f4e137244.entity;
    if (!isdefined(player)) {
        return;
    }
    assert(isplayer(player));
    function_3d8d8ad244283e65(#"hash_d54b289d498be977");
    player val::set("scene_scene", "cinematic_motion", 0);
    var_7fba0dfc25328161 = ["offhand_weapons", "melee", "sprint", "allow_jump", "mantle", "tacmap_scoreboard", "backpack_inventory"];
    if (!istrue(var_214d924f4e137244.sceneobject.variant_object.var_9f78587cfefc10ac)) {
        var_7fba0dfc25328161 = array_add(var_7fba0dfc25328161, "usability");
    }
    if (var_214d924f4e137244.sceneobject function_d1dd52dc1f43215d(shotindex) != "Keep") {
        var_7fba0dfc25328161 = array_add(var_7fba0dfc25328161, "weapon");
    }
    if (!var_214d924f4e137244.sceneobject function_fcc766f42b75a322(shotindex)) {
        var_7fba0dfc25328161 = array_add(var_7fba0dfc25328161, "weapon_switch");
    }
    var_214d924f4e137244.entity val::set("scene_shot", "freezecontrols", 1);
    var_214d924f4e137244.entity val::set("scene_shot", "swimming_underwater", 0);
    function_7f3923ed3d66f8ad();
    function_3d8d8ad244283e65(#"hash_559bfd7b0925399d");
    var_214d924f4e137244.entity val::set_array("scene_shot", var_7fba0dfc25328161, 0);
    function_7f3923ed3d66f8ad();
    if (shotindex == var_214d924f4e137244.sceneplay.var_df5db7bd235f2729[0]) {
        if (var_214d924f4e137244 function_72777e12c4307f96()) {
            var_36a19240d8d46bc2 = player getcustomizationbody();
            newheadmodel = player getcustomizationhead();
            if (!isdefined(var_214d924f4e137244.var_d5d84848169bf792)) {
                var_214d924f4e137244.var_d5d84848169bf792 = var_36a19240d8d46bc2;
            }
            if (!isdefined(var_214d924f4e137244.var_79825563576bccb8)) {
                var_214d924f4e137244.var_79825563576bccb8 = newheadmodel;
            }
            var_9a843b7e2ec0ad7c = var_214d924f4e137244 function_be5a45fff59957b();
            if (isdefined(var_9a843b7e2ec0ad7c) && var_9a843b7e2ec0ad7c.size > 0) {
                var_36a19240d8d46bc2 = var_9a843b7e2ec0ad7c;
            }
            requestedheadmodel = var_214d924f4e137244 function_306026c41bd7abbd();
            if (isdefined(requestedheadmodel) && requestedheadmodel.size > 0) {
                newheadmodel = requestedheadmodel;
            }
            function_ec6039191e7c076a(player, var_36a19240d8d46bc2, newheadmodel);
        }
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xdc9
// Size: 0x105
function private function_8b3b351a42e84dc2(shotindex) {
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.entity)) {
        return;
    }
    assert(isplayer(var_214d924f4e137244.entity));
    if (shotindex == var_214d924f4e137244.sceneplay.var_df5db7bd235f2729[var_214d924f4e137244.sceneplay.var_df5db7bd235f2729.size - 1]) {
        if (var_214d924f4e137244 function_72777e12c4307f96()) {
            if (isdefined(var_214d924f4e137244.var_d5d84848169bf792) && isdefined(var_214d924f4e137244.var_79825563576bccb8)) {
                function_ec6039191e7c076a(var_214d924f4e137244.entity, var_214d924f4e137244.var_d5d84848169bf792, var_214d924f4e137244.var_79825563576bccb8);
                var_214d924f4e137244.var_d5d84848169bf792 = undefined;
                var_214d924f4e137244.var_79825563576bccb8 = undefined;
            }
        }
        function_2d5d63169291228e(var_214d924f4e137244.entity, shotindex);
    }
    var_214d924f4e137244.entity val::reset_all("scene_shot");
}

// Namespace scene / namespace_5952db407689619a
// Params 9, eflags: 0x4
// Checksum 0x0, Offset: 0xed6
// Size: 0x304
function private function_5fd2b7d3c29f131b(shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime) {
    var_214d924f4e137244 = self;
    player = var_214d924f4e137244.entity;
    var_214d924f4e137244 endon("scene_stop");
    var_214d924f4e137244 endon("scene_play_anim");
    if (!isplayer(player)) {
        var_214d924f4e137244 function_bf0d14daf3e53248(var_4f3089070d8b1e24, var_214d924f4e137244.var_41dc93404af773a3, notifystring);
        var_214d924f4e137244 function_68056529c69f4097(var_214d924f4e137244.var_41dc93404af773a3, shotindex, animindex);
        return 0;
    }
    var_409dc6bbf1421f94 = var_214d924f4e137244 function_5fe020a6db35fab3(shotindex);
    player val::set_array("scene_shot", var_409dc6bbf1421f94, 0);
    if (var_214d924f4e137244.var_41dc93404af773a3 == "CameraAnimation") {
        var_214d924f4e137244 thread object_play_anim_waittill_end(var_4f3089070d8b1e24, [player], "death", "CameraAnimation", notifystring);
        var_214d924f4e137244.xcamplaying = 1;
        return var_214d924f4e137244 function_bae0f68830d519ad("scene_shot", player, var_4f3089070d8b1e24, var_866b3a3066122e39, notifystring, alignmentinfo, shotindex);
    }
    player val::set("scene_shot", "cinematics_participant", 1);
    var_2e2a2f75fd49152a = getanimname(var_4f3089070d8b1e24);
    n_anim_length = getanimlength(var_4f3089070d8b1e24);
    player setorigin(alignmentinfo.origin);
    player setplayerangles(alignmentinfo.angles);
    var_d0cbd253b25b43f5 = istrue(var_214d924f4e137244.xcamplaying) && var_214d924f4e137244.sceneobject.variant_object.shots[shotindex].var_45d86f20e184e36a.size == 1;
    var_9ebbc3376d9ce8f2 = var_214d924f4e137244 function_d776460a61b689bf(shotindex);
    var_d8ab3f21c6db562e = !var_9ebbc3376d9ce8f2;
    if (var_9ebbc3376d9ce8f2) {
        function_639a0acd683457ec(player, shotindex);
    } else {
        function_2d5d63169291228e(player, shotindex);
    }
    var_214d924f4e137244 childthread function_8e9f8e1fbe2b7ab4(notifystring, var_4f3089070d8b1e24);
    function_3d8d8ad244283e65(#"hash_e45c00238da3528c");
    player playanimscriptsceneevent("scripted_scene", var_2e2a2f75fd49152a, var_d8ab3f21c6db562e);
    function_7f3923ed3d66f8ad();
    var_214d924f4e137244 function_bdfc45b799d27532(var_4f3089070d8b1e24);
    if (var_9ebbc3376d9ce8f2) {
        n_anim_length = function_a7bfaa03b4d58c00(player, shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, n_anim_length);
    } else if (var_d0cbd253b25b43f5) {
        n_start_time = gettime();
        player waittill_any_timeout_2(n_anim_length, "stop_animmode", "death_or_disconnect");
        var_ef8433621bf198f1 = function_c89ed1840c8d0f0f(gettime() - n_start_time);
        println("<dev string:x1c>" + var_ef8433621bf198f1 + "<dev string:x3e>" + function_3c8848a3a11b2553(var_2e2a2f75fd49152a) + "<dev string:x52>" + n_anim_length + "<dev string:x5e>" + n_anim_length - var_ef8433621bf198f1 + "<dev string:x70>");
        n_anim_length = var_ef8433621bf198f1;
    } else {
        wait n_anim_length;
    }
    return n_anim_length;
}

// Namespace scene / namespace_5952db407689619a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x11e3
// Size: 0x145
function private function_639a0acd683457ec(player, shotindex) {
    var_214d924f4e137244 = self;
    var_9ebbc3376d9ce8f2 = var_214d924f4e137244 function_d776460a61b689bf(shotindex);
    if (var_9ebbc3376d9ce8f2 && !isdefined(player.var_7c6c008ca46286b0)) {
        player.var_7c6c008ca46286b0 = spawn("script_arms", player.origin, 0, 0, player);
        player.var_7c6c008ca46286b0.animname = var_214d924f4e137244.sceneobject.variant_object.name;
        player.var_7c6c008ca46286b0 useanimtree(var_214d924f4e137244.sceneobject function_c106523f3836b90b());
        player.var_7c6c008ca46286b0 hide();
        player.var_7c6c008ca46286b0.entity = player;
        player.var_7c6c008ca46286b0 showonlytoplayer(player);
        player.var_7c6c008ca46286b0.noragdoll = 1;
        player.var_7c6c008ca46286b0 val::set("scene_scene", "cinematics_participant", 1);
        thread function_382ab03066aa1207(player, player.var_7c6c008ca46286b0);
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1330
// Size: 0x74
function private function_382ab03066aa1207(player, rig) {
    rig endon("death");
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

// Namespace scene / namespace_5952db407689619a
// Params 11, eflags: 0x4
// Checksum 0x0, Offset: 0x13ac
// Size: 0x2ad
function private function_a7bfaa03b4d58c00(player, shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, n_anim_length) {
    var_214d924f4e137244 = self;
    function_639a0acd683457ec(player, shotindex);
    arcright = var_214d924f4e137244.sceneobject function_918dc2e0c83784b6(shotindex);
    arcleft = var_214d924f4e137244.sceneobject function_16b4cb7e4c5af0fd(shotindex);
    arctop = var_214d924f4e137244.sceneobject function_b06da1547120edef(shotindex);
    arcbottom = var_214d924f4e137244.sceneobject function_be3310ec58dd9807(shotindex);
    var_562ff78798cbfcc8 = var_214d924f4e137244.sceneobject function_8851aea907b47f88(shotindex);
    viewfraction = var_214d924f4e137244.sceneobject function_b083c5862877c8e3(shotindex);
    var_e854c1a35488c7d6 = function_a89f1262c5148bdf();
    player playerlinktoblend(player.var_7c6c008ca46286b0, var_e854c1a35488c7d6, lerptime);
    player playerlinktodelta(player.var_7c6c008ca46286b0, var_e854c1a35488c7d6, viewfraction, arcright, arcleft, arctop, arcbottom, var_562ff78798cbfcc8, 1, 1);
    player lerpviewangleclamp(blendtime, blendtime * 0.5, blendtime * 0.25, arcright, arcleft, arctop, arcbottom, 1);
    var_6325cb53ec163839 = "none";
    if (blendtime > 0 && blendtime < 1) {
        var_6325cb53ec163839 = "normal";
    } else if (blendtime >= 1) {
        var_6325cb53ec163839 = "slow";
    }
    var_2e2a2f75fd49152a = getanimname(var_4f3089070d8b1e24);
    var_4fdfa3b181211e22 = var_866b3a3066122e39 * n_anim_length;
    if (var_214d924f4e137244 function_7f90ebd0aa7ad958(shotindex)) {
        player.var_7c6c008ca46286b0 animscripted(notifystring, alignmentinfo.origin, alignmentinfo.angles, var_4f3089070d8b1e24, undefined, undefined, blendtime);
        player.var_7c6c008ca46286b0 scriptmodelplayanim(var_2e2a2f75fd49152a, undefined, var_4fdfa3b181211e22, undefined, var_6325cb53ec163839);
        player.var_7c6c008ca46286b0 function_ee012c2dd711a8ce(notifystring, "end", "stop_animmode");
    } else {
        player.var_7c6c008ca46286b0 scriptmodelplayanim(var_2e2a2f75fd49152a, undefined, var_4fdfa3b181211e22, undefined, var_6325cb53ec163839);
        player.var_7c6c008ca46286b0 waittill_any_timeout_1(getanimlength(var_4f3089070d8b1e24), "stop_animmode");
        player.var_7c6c008ca46286b0 notify(notifystring, "end");
    }
    return n_anim_length - var_4fdfa3b181211e22;
}

// Namespace scene / namespace_5952db407689619a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1662
// Size: 0x7b
function private function_2d5d63169291228e(player, shotindex) {
    var_214d924f4e137244 = self;
    if (isdefined(player.var_7c6c008ca46286b0)) {
        if (isdefined(shotindex)) {
            tweenout = var_214d924f4e137244.sceneobject function_be64404b86d48153(shotindex);
            player function_af4b9b0f0e7c6c42(tweenout);
        } else {
            player function_af4b9b0f0e7c6c42(0);
        }
        player stopanimscriptsceneevent();
        player.var_7c6c008ca46286b0 delete();
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x16e5
// Size: 0x83
function private function_c14ed0fc1a6ccf72(sceneplay) {
    var_214d924f4e137244 = self;
    player = var_214d924f4e137244.entity;
    shotindex = sceneplay.var_df5db7bd235f2729[0];
    if (isdefined(player)) {
        function_639a0acd683457ec(player, shotindex);
        scenescriptbundle = var_214d924f4e137244.sceneroot scene_scriptbundle();
        if (scenescriptbundle function_cf67ad1bae22e908()) {
            player function_e7257014ebaeeaa8(1);
        }
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1770
// Size: 0x51
function private function_ca4527bcd586d366() {
    var_214d924f4e137244 = self;
    player = var_214d924f4e137244.entity;
    if (!isdefined(player)) {
        return [];
    }
    if (isdefined(player.var_7c6c008ca46286b0)) {
        return [player.var_7c6c008ca46286b0];
    }
    return [player];
}

// Namespace scene / namespace_5952db407689619a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x17ca
// Size: 0x69
function private function_f5c1014e1cfdf615(var_fa1af9d2277fd747) {
    var_214d924f4e137244 = self;
    player = var_214d924f4e137244.entity;
    var_214d924f4e137244 function_2f2327d535ed0bb();
    if (isdefined(player)) {
        scenescriptbundle = var_214d924f4e137244.sceneroot scene_scriptbundle();
        if (scenescriptbundle function_cf67ad1bae22e908()) {
            player function_e7257014ebaeeaa8(0);
        }
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x183b
// Size: 0x77
function private function_e3f3a0837cae6779() {
    var_214d924f4e137244 = self;
    player = var_214d924f4e137244.entity;
    var_214d924f4e137244 function_2f2327d535ed0bb();
    if (isdefined(player)) {
        player notify("stop_loop");
        player notify("single anim", "end");
        player notify("looping anim", "end");
        player notify("stop_animmode");
        player stopanimscriptsceneevent();
        function_2d5d63169291228e(player);
        player val::reset_all("scene_shot");
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x18ba
// Size: 0x1f
function private function_24b6b2bfc5bdab36(animname, animtree) {
    var_214d924f4e137244 = self;
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x18e1
// Size: 0x2
function private player_delete() {
    
}

// Namespace scene / namespace_5952db407689619a
// Params 10, eflags: 0x4
// Checksum 0x0, Offset: 0x18eb
// Size: 0x1e7
function private function_8cd22f505439309f(shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, animationtype) {
    if (animationtype != "DeltaAnimation") {
        return;
    }
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.var_b2de9e740fef7506)) {
        var_214d924f4e137244.var_b2de9e740fef7506 = spawnstruct();
    }
    var_214d924f4e137244.var_b2de9e740fef7506.newrequest = 1;
    var_214d924f4e137244.var_b2de9e740fef7506.shotindex = shotindex;
    var_214d924f4e137244.var_b2de9e740fef7506.animindex = animindex;
    var_214d924f4e137244.var_b2de9e740fef7506.notifystring = notifystring;
    var_214d924f4e137244.var_b2de9e740fef7506.alignmentinfo = alignmentinfo;
    var_214d924f4e137244.var_b2de9e740fef7506.alignmentinfo.origin = alignmentinfo.origin;
    var_214d924f4e137244.var_b2de9e740fef7506.alignmentinfo.angles = alignmentinfo.angles;
    var_214d924f4e137244.var_b2de9e740fef7506.var_4f3089070d8b1e24 = var_4f3089070d8b1e24;
    var_214d924f4e137244.var_b2de9e740fef7506.var_866b3a3066122e39 = var_866b3a3066122e39;
    var_214d924f4e137244.var_b2de9e740fef7506.blendtime = blendtime;
    var_214d924f4e137244.var_b2de9e740fef7506.blendcurve = blendcurve;
    var_214d924f4e137244.var_b2de9e740fef7506.lerptime = lerptime;
    var_214d924f4e137244.var_b2de9e740fef7506.var_fe62dc1bdc14feca = gettime();
}

// Namespace scene / namespace_5952db407689619a
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1ada
// Size: 0x89
function private function_3e4cf61872dc003b(animationtype, shotindex, animindex) {
    if (!isdefined(animationtype) || animationtype != "DeltaAnimation") {
        return;
    }
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.var_b2de9e740fef7506)) {
        return;
    }
    if (shotindex == var_214d924f4e137244.var_b2de9e740fef7506.shotindex && animindex == var_214d924f4e137244.var_b2de9e740fef7506.animindex) {
        var_214d924f4e137244.var_b2de9e740fef7506 = undefined;
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1b6b
// Size: 0x250
function private agent_spawn(spawnorigin, spawnangles) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.sceneobject.variant_object.aitypename)) {
        var_373a2c3b02b1d81c = "aitype";
        var_6fc4d2978cf27bef = var_214d924f4e137244.sceneobject.variant_object.aitypename;
    } else if (isdefined(var_214d924f4e137244.sceneobject.variant_object.charactername)) {
        var_373a2c3b02b1d81c = "character";
        var_6fc4d2978cf27bef = var_214d924f4e137244.sceneobject.variant_object.charactername;
    } else {
        var_373a2c3b02b1d81c = "xmodel";
        var_6fc4d2978cf27bef = var_214d924f4e137244.sceneobject.variant_object.xmodelname;
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
        if (isdefined(var_214d924f4e137244.sceneobject.variant_object.var_c8b64adafd8e5711)) {
            var_e51bc72666444e2d = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_sharedfunc(var_214d924f4e137244.sceneobject.variant_object.var_c8b64adafd8e5711);
            var_3a7ad9d5e8329009 = random(var_e51bc72666444e2d);
            var_6fc4d2978cf27bef = default_to(var_3a7ad9d5e8329009, var_6fc4d2978cf27bef);
        }
        if (scripts\engine\utility::issharedfuncdefined("ai", "get_aitype_default_spawn_team_SharedFunc")) {
            var_e94f24c42205140 = namespace_53fc9ddbb516e6e1::get_aitype_default_spawn_team_SharedFunc();
        }
        if (scripts\engine\utility::issharedfuncdefined("ai", "spawnNewAIType_SharedFunc")) {
            entity = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_6fc4d2978cf27bef, spawnorigin, spawnangles, var_e94f24c42205140);
        } else {
            entity = scripts\mp\mp_agent::spawnnewagentaitype(var_6fc4d2978cf27bef, spawnorigin, spawnangles, var_e94f24c42205140);
        }
        entity useanimtree(var_214d924f4e137244.sceneobject.variant_object.animtree.id);
    }
    return entity;
}

// Namespace scene / namespace_5952db407689619a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1dc4
// Size: 0x1d
function private function_12f50a9b21b4dd9a(entity) {
    var_214d924f4e137244 = self;
    return isagent(entity);
}

// Namespace scene / namespace_5952db407689619a
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1dea
// Size: 0x25
function private function_61be92922a464251(sceneplay, shotindex, objectindex) {
    function_bea88b25e17cea66(sceneplay, shotindex, objectindex);
}

// Namespace scene / namespace_5952db407689619a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1e17
// Size: 0xd8
function private function_6dad63edc3390487(alignmentinfo, shotindex) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244.entity;
    var_7535cec6dfd38a5e = var_214d924f4e137244.sceneobject function_79edcc9987330a2a(shotindex);
    if (var_7535cec6dfd38a5e.size != 0) {
        var_4f3089070d8b1e24 = var_7535cec6dfd38a5e[0];
        function_549578bb9e3f4f78(alignmentinfo, var_4f3089070d8b1e24, undefined, undefined, undefined, 0);
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<dev string:x72>" + function_3c8848a3a11b2553(getanimname(var_4f3089070d8b1e24)), entity.origin, entity.angles);
        #/
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<dev string:x7f>" + function_3c8848a3a11b2553(getanimname(var_4f3089070d8b1e24)), alignmentinfo.origin, alignmentinfo.angles);
        #/
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 9, eflags: 0x4
// Checksum 0x0, Offset: 0x1ef7
// Size: 0x91
function private function_43a42c8097aac565(shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244.entity;
    var_d77e596283581825 = entity function_d28a53b100cbdda7(var_214d924f4e137244, shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, undefined);
    return var_d77e596283581825;
}

// Namespace scene / namespace_5952db407689619a
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x1f91
// Size: 0x276
function private function_549578bb9e3f4f78(alignmentinfo, var_4f3089070d8b1e24, var_7c6075e90a7b0fa, lerptime, var_866b3a3066122e39, animrate) {
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
    entity = var_214d924f4e137244.entity;
    if (!isagent(entity) || !isalive(entity)) {
        return;
    }
    function_e4fc30ccdca08b9d(alignmentinfo);
    var_2e2a2f75fd49152a = getanimname(var_4f3089070d8b1e24);
    entity.var_34a25b21bc155d14 = var_214d924f4e137244.sceneobject.variant_object.var_7c6075e90a7b0fa;
    if (isdefined(var_7c6075e90a7b0fa)) {
        entity.var_34a25b21bc155d14 = var_7c6075e90a7b0fa;
    }
    if (isdefined(entity.var_34a25b21bc155d14)) {
        entity setoverridearchetype("animscript", entity.var_34a25b21bc155d14, 0);
        thread function_887f073158089317(entity);
    }
    entity asmsetstate(entity.asmname, "animscripted");
    animindex = entity asm_lookupanimfromalias("animscripted", var_2e2a2f75fd49152a);
    entity.var_b65a7211c663d3ed = animindex;
    entity animmode("noclip");
    startorigin = getstartorigin(alignmentinfo.origin, alignmentinfo.angles, var_4f3089070d8b1e24);
    startangles = getstartangles(alignmentinfo.origin, alignmentinfo.angles, var_4f3089070d8b1e24);
    if (lerptime == 0) {
        entity dontinterpolate();
    }
    entity orientmode("face angle", entity.angles[1]);
    entity scripts\asm\asm_bb::bb_setanimscripted();
    if (isdefined(entity.scripted_mode)) {
        entity.scripted_mode = 1;
    }
    if (isent(alignmentinfo.alignent)) {
        entity unlink();
        entity forceteleport(startorigin, startangles);
        if (isdefined(alignmentinfo.aligntag)) {
            entity linktomoveoffset(alignmentinfo.alignent, alignmentinfo.aligntag);
        } else {
            entity linktomoveoffset(alignmentinfo.alignent);
        }
    } else {
        entity forceteleport(startorigin, startangles);
    }
    entity aisetanim("animscripted", animindex, animrate, var_866b3a3066122e39);
}

// Namespace scene / namespace_5952db407689619a
// Params 11, eflags: 0x4
// Checksum 0x0, Offset: 0x220f
// Size: 0x21f
function private function_d28a53b100cbdda7(var_214d924f4e137244, shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, var_7c6075e90a7b0fa) {
    entity = self;
    entity endon("scene_monitor_players_agent_will_be_despawned");
    entity endon("scene_monitor_players_new_animation_for_agent");
    entity endon("agent_scene_stop");
    entity endon("death");
    if (!isdefined(entity)) {
        return;
    }
    if (!isagent(entity)) {
        return;
    }
    if (!isalive(entity)) {
        return;
    }
    blendtime = default_to(blendtime, 0);
    lerptime = default_to(lerptime, 0);
    if (isdefined(var_214d924f4e137244.scenedata.var_43286fd46706909c)) {
        blendtime = 0;
        lerptime = 0;
    }
    var_2e2a2f75fd49152a = getanimname(var_4f3089070d8b1e24);
    n_anim_length = getanimlength(var_4f3089070d8b1e24);
    var_7a4a31d740c51ee8 = n_anim_length - var_866b3a3066122e39 * n_anim_length;
    if (var_866b3a3066122e39 < 1) {
        var_214d924f4e137244 childthread function_8e9f8e1fbe2b7ab4(notifystring, var_4f3089070d8b1e24);
    }
    var_214d924f4e137244 function_549578bb9e3f4f78(alignmentinfo, var_4f3089070d8b1e24, var_7c6075e90a7b0fa, lerptime, var_866b3a3066122e39);
    var_214d924f4e137244 function_bdfc45b799d27532(var_4f3089070d8b1e24);
    if (var_866b3a3066122e39 < 1) {
        if (function_8581f011ce975a6(var_4f3089070d8b1e24)) {
            while (true) {
                var_6fde8947aa74cf43 = entity scripts\asm\asm::asm_donotetracks(entity.asmname, "animscripted", scripts\asm\asm::asm_getnotehandler(entity.asmname, "animscripted"));
                if (is_equal(var_6fde8947aa74cf43, "end")) {
                    break;
                }
            }
        } else {
            wait var_7a4a31d740c51ee8;
        }
    }
    entity.var_b65a7211c663d3ed = undefined;
    if (isdefined(entity.scripted_mode)) {
        entity.scripted_mode = 0;
    }
    entity scripts\asm\asm_bb::bb_clearanimscripted();
    entity orientmode("face current");
    entity animmode("none");
    if (isdefined(entity.var_34a25b21bc155d14)) {
        entity clearoverridearchetype("animscript");
        entity.var_34a25b21bc155d14 = undefined;
    }
    return var_7a4a31d740c51ee8;
}

// Namespace scene / namespace_5952db407689619a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2437
// Size: 0x46
function private function_887f073158089317(entity) {
    self endon("scene_shot_cleanup");
    entity waittill("death");
    if (isdefined(entity) && isdefined(entity.var_34a25b21bc155d14)) {
        entity clearoverridearchetype("animscript");
        entity.var_34a25b21bc155d14 = undefined;
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2485
// Size: 0x181
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
        if (isalive(var_214d924f4e137244.entity) && var_214d924f4e137244.entity scripts\asm\asm_bb::bb_isanimscripted()) {
            var_214d924f4e137244.entity scripts\asm\asm_bb::bb_clearanimscripted();
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

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x260e
// Size: 0x6e
function private agent_delete() {
    var_214d924f4e137244 = self;
    if (isagent(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity.nocorpse = 1;
        var_214d924f4e137244.entity namespace_14d36171baccf528::despawnagent();
        return;
    }
    if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity delete();
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2684
// Size: 0x127
function private function_642077a65edc7954(shotindex) {
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.entity)) {
        return;
    }
    if (isdefined(var_214d924f4e137244.entity.scripted_mode)) {
        var_214d924f4e137244.entity.scripted_mode = 0;
    }
    if (isalive(var_214d924f4e137244.entity) && var_214d924f4e137244.entity scripts\asm\asm_bb::bb_isanimscripted()) {
        var_214d924f4e137244.entity scripts\asm\asm_bb::bb_clearanimscripted();
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

// Namespace scene / namespace_5952db407689619a
// Params 9, eflags: 0x4
// Checksum 0x0, Offset: 0x27b3
// Size: 0x2f8
function private function_70bd06355933aec9(shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244.entity;
    if (!isdefined(entity)) {
        return;
    }
    animlengthtime = 0;
    done = 0;
    if (entity.model == "") {
        println("<dev string:x92>" + var_214d924f4e137244.sceneobject.variant_object.name + "<dev string:xc2>");
        return 0;
    }
    entity val::set("scene_shot", "cinematics_participant", 1);
    if (isdefined(var_214d924f4e137244.scenedata.var_43286fd46706909c)) {
        blendtime = 0;
        lerptime = 0;
    }
    var_2e2a2f75fd49152a = getanimname(var_4f3089070d8b1e24);
    function_e4fc30ccdca08b9d(alignmentinfo);
    var_6325cb53ec163839 = "none";
    if (blendtime > 0 && blendtime < 1) {
        var_6325cb53ec163839 = "normal";
    } else if (blendtime >= 1) {
        var_6325cb53ec163839 = "slow";
    }
    if (var_866b3a3066122e39 < 1) {
        var_214d924f4e137244 childthread function_8e9f8e1fbe2b7ab4(notifystring, var_4f3089070d8b1e24);
    }
    if (var_214d924f4e137244 function_7f90ebd0aa7ad958(shotindex)) {
        var_6db82a0c287ea33 = var_214d924f4e137244.scenedata.scenescriptbundle function_ee55ab255c0be00d();
        if (var_6db82a0c287ea33 == "AnimScripted") {
            entity useanimtree(var_214d924f4e137244.sceneobject function_c106523f3836b90b());
            entity animscripted(notifystring, alignmentinfo.origin, alignmentinfo.angles, var_4f3089070d8b1e24, undefined, undefined, blendtime);
            entity scriptmodelplayanim(var_2e2a2f75fd49152a, undefined, var_866b3a3066122e39, 1, var_6325cb53ec163839);
            var_214d924f4e137244 function_bdfc45b799d27532(var_4f3089070d8b1e24);
            if (var_866b3a3066122e39 < 1) {
                entity function_ee012c2dd711a8ce(notifystring, "end", "stop_animmode");
            }
        } else if (var_6db82a0c287ea33 == "ScriptModelPlayAnimDeltaMotionFromPos") {
            entity stopuseanimtree();
            entity scriptmodelplayanimdeltamotionfrompos(var_2e2a2f75fd49152a, alignmentinfo.origin, alignmentinfo.angles, notifystring, var_866b3a3066122e39, var_6325cb53ec163839);
            var_214d924f4e137244 function_bdfc45b799d27532(var_4f3089070d8b1e24);
            if (var_866b3a3066122e39 < 1) {
                entity function_ee012c2dd711a8ce(notifystring, "end", "stop_animmode");
            }
        }
    } else {
        entity stopuseanimtree();
        entity scriptmodelplayanim(var_2e2a2f75fd49152a, notifystring, var_866b3a3066122e39, 1, var_6325cb53ec163839);
        var_214d924f4e137244 function_bdfc45b799d27532(var_4f3089070d8b1e24);
        entity function_ee012c2dd711a8ce(notifystring, "end", "stop_animmode");
        entity scriptmodelclearanim();
        entity useanimtree(var_214d924f4e137244.sceneobject function_c106523f3836b90b());
    }
    animlengthtime += getanimlength(var_4f3089070d8b1e24);
    return animlengthtime - var_866b3a3066122e39 * animlengthtime;
}

// Namespace scene / namespace_5952db407689619a
// Params 9, eflags: 0x4
// Checksum 0x0, Offset: 0x2ab4
// Size: 0x2da
function private function_5552728c9588fd02(shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244.entity;
    if (!isdefined(entity)) {
        return;
    }
    animlengthtime = 0;
    done = 0;
    if (entity.model == "") {
        println("<dev string:x92>" + var_214d924f4e137244.sceneobject.variant_object.name + "<dev string:xc2>");
        return 0;
    }
    entity endon("death");
    entity endon("vehicle_scene_stop");
    blendtime = default_to(blendtime, 0);
    lerptime = default_to(lerptime, 0);
    if (isdefined(var_214d924f4e137244.scenedata.var_43286fd46706909c)) {
        blendtime = 0;
        lerptime = 0;
    }
    var_2e2a2f75fd49152a = getanimname(var_4f3089070d8b1e24);
    function_e4fc30ccdca08b9d(alignmentinfo);
    if (entity vehicle_isphysveh()) {
        entity function_247ad6a91f6a4ffe(1);
        entity vehphys_forcekeyframedmotion();
    } else {
        entity notsolid();
    }
    if (lerptime == 0) {
        entity dontinterpolate();
    }
    startorigin = getstartorigin(alignmentinfo.origin, alignmentinfo.angles, var_4f3089070d8b1e24);
    startangles = getstartangles(alignmentinfo.origin, alignmentinfo.angles, var_4f3089070d8b1e24);
    entity vehicle_teleport(startorigin, startangles);
    if (var_866b3a3066122e39 < 1) {
        var_214d924f4e137244 childthread function_8e9f8e1fbe2b7ab4(notifystring, var_4f3089070d8b1e24);
    }
    entity animscripted(notifystring, alignmentinfo.origin, alignmentinfo.angles, var_4f3089070d8b1e24, undefined, undefined, blendtime);
    entity vehicleplayanim(var_4f3089070d8b1e24);
    var_214d924f4e137244 function_bdfc45b799d27532(var_4f3089070d8b1e24);
    if (isdefined(var_866b3a3066122e39) && var_866b3a3066122e39 > 0 && var_866b3a3066122e39 <= 1) {
        if (var_866b3a3066122e39 == 1 && function_8581f011ce975a6(var_4f3089070d8b1e24)) {
            var_866b3a3066122e39 = 0.999;
        }
        var_214d924f4e137244 function_380708345e16e475(var_4f3089070d8b1e24, var_866b3a3066122e39);
    }
    animlengthtime += getanimlength(var_4f3089070d8b1e24);
    n_wait_time = animlengthtime - var_866b3a3066122e39 * animlengthtime;
    if (var_866b3a3066122e39 < 1) {
        wait n_wait_time;
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

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2d97
// Size: 0xdc
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
            return;
        }
        var_214d924f4e137244.entity solid();
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2e7b
// Size: 0x150
function private function_bcf0caa0a00df979(spawnorigin, spawnangles) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.sceneobject.variant_object.vehiclename)) {
        var_373a2c3b02b1d81c = "vehicle";
        var_6fc4d2978cf27bef = var_214d924f4e137244.sceneobject.variant_object.vehiclename;
    } else {
        var_373a2c3b02b1d81c = "xmodel";
        var_6fc4d2978cf27bef = var_214d924f4e137244.sceneobject.variant_object.xmodelname;
    }
    if (!isdefined(var_214d924f4e137244.entity)) {
        if (var_373a2c3b02b1d81c == "vehicle") {
            spawndata = spawnstruct();
            spawndata.origin = spawnorigin;
            spawndata.angles = spawnangles;
            spawndata.vehicletype = var_6fc4d2978cf27bef;
            spawndata.targetname = "scene_vehicle";
            spawndata.modelname = vehicle_modelname(var_6fc4d2978cf27bef);
            var_214d924f4e137244.entity = scripts\cp_mp\vehicles\vehicle_tracking::_spawnvehicle(spawndata);
        } else {
            var_214d924f4e137244.entity = utility::spawn_model(var_6fc4d2978cf27bef, spawnorigin, spawnangles);
        }
    }
    return var_214d924f4e137244.entity;
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2fd4
// Size: 0x2e
function private vehicle_delete() {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity delete();
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x300a
// Size: 0x12
function private function_684629695ffebbdb(entity) {
    return entity scripts\common\vehicle::isvehicle();
}

// Namespace scene / namespace_5952db407689619a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3025
// Size: 0x5f
function private function_2e11be8a4ef151b5(animname, animtree) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity) && !isdefined(var_214d924f4e137244.entity.animname)) {
        var_214d924f4e137244.entity.animname = animname;
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x308c
// Size: 0x91
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

// Namespace scene / namespace_5952db407689619a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3125
// Size: 0x3f
function private function_8bac7edf73a29d6b(alignmentinfo, shotindex) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity scriptmodelclearanim();
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x316c
// Size: 0x95
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

// Namespace scene / namespace_5952db407689619a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3209
// Size: 0x33
function private function_83f1be5a5eb5f706(entity) {
    if (isdefined(entity.classname) && entity.classname == "script_model") {
        return true;
    }
    return false;
}

// Namespace scene / namespace_5952db407689619a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3245
// Size: 0xa8
function private function_d776460a61b689bf(shotindex) {
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.sceneobject.variant_object.shots)) {
        return 0;
    }
    if (shotindex < 0 || shotindex >= var_214d924f4e137244.sceneobject.variant_object.shots.size) {
        return 0;
    }
    shotobject = var_214d924f4e137244.sceneobject.variant_object.shots[shotindex];
    return default_to(shotobject.var_25a8d725d83b4fc1, 0);
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x32f6
// Size: 0x2a
function private function_4e15410d3aae945c() {
    var_214d924f4e137244 = self;
    agenttype = var_214d924f4e137244 function_a2142af2db8fbb0();
    return isdefined(agenttype) && agenttype.size > 0;
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3329
// Size: 0x2d
function private function_a2142af2db8fbb0() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244.sceneobject.variant_object.var_ab73f93a436a7409;
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x335f
// Size: 0x2d
function private function_7c9fcb0161b76b2d() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244.sceneobject.variant_object.var_ed40a4854b93740c;
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3395
// Size: 0x2d
function private function_23cc62938b72190b() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244.sceneobject.variant_object.var_6b7d083fa865688a;
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x33cb
// Size: 0x315
function private function_22f6fca8362a92b() {
    sceneplay = self;
    sceneplay endon("Stopped");
    scenedata = sceneplay.sceneroot.scenedata;
    if (!isdefined(sceneplay.var_760345b17988f984)) {
        sceneplay.var_760345b17988f984 = [];
    }
    var_6e050937039896b9 = 0;
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < scenedata.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = scenedata.var_214d924f4e137244[var_56f4af8746a2d458];
        if (var_214d924f4e137244 object_get_type() == "Types_Player") {
            sceneplay.var_760345b17988f984[var_6e050937039896b9] = spawnstruct();
            var_6e050937039896b9++;
        }
    }
    while (true) {
        playerindex = 0;
        for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < scenedata.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
            var_214d924f4e137244 = scenedata.var_214d924f4e137244[var_56f4af8746a2d458];
            if (var_214d924f4e137244 object_get_type() == "Types_Player") {
                replacementisenabled = var_214d924f4e137244 function_4e15410d3aae945c();
                if (replacementisenabled && !isdefined(var_214d924f4e137244.entity)) {
                    var_570735e9e6be86eb = sceneplay.var_760345b17988f984[playerindex];
                    if (isdefined(var_214d924f4e137244.var_b2de9e740fef7506) && !isdefined(var_570735e9e6be86eb.agententity)) {
                        var_214d924f4e137244 function_fa25c05bae26b761(var_214d924f4e137244.var_b2de9e740fef7506, var_570735e9e6be86eb);
                    }
                    if (!isdefined(var_214d924f4e137244.var_b2de9e740fef7506) && isdefined(var_570735e9e6be86eb.agententity)) {
                        function_f4cf37b2c85bb5c0(var_570735e9e6be86eb);
                    }
                    if (isdefined(var_214d924f4e137244.var_b2de9e740fef7506) && var_214d924f4e137244.var_b2de9e740fef7506.newrequest) {
                        agententity = var_570735e9e6be86eb.agententity;
                        if (isdefined(agententity)) {
                            agententity notify("scene_monitor_players_new_animation_for_agent");
                            var_6751e5eb36fccfa9 = var_214d924f4e137244.var_b2de9e740fef7506;
                            n_anim_length = getanimlength(var_6751e5eb36fccfa9.var_4f3089070d8b1e24);
                            var_b7d39a4661f3460 = gettime();
                            var_c952be88c3ffef2f = (var_b7d39a4661f3460 - var_6751e5eb36fccfa9.var_fe62dc1bdc14feca) / 1000;
                            var_53cea02c2ced41aa = var_6751e5eb36fccfa9.var_866b3a3066122e39;
                            if (n_anim_length > 0) {
                                var_53cea02c2ced41aa += var_c952be88c3ffef2f / n_anim_length;
                            }
                            var_7c6075e90a7b0fa = var_214d924f4e137244 function_23cc62938b72190b();
                            agententity thread function_d28a53b100cbdda7(var_214d924f4e137244, var_6751e5eb36fccfa9.shotindex, var_6751e5eb36fccfa9.animindex, var_6751e5eb36fccfa9.notifystring, var_6751e5eb36fccfa9.alignmentinfo, var_6751e5eb36fccfa9.var_4f3089070d8b1e24, var_53cea02c2ced41aa, var_6751e5eb36fccfa9.blendtime, var_6751e5eb36fccfa9.blendcurve, var_6751e5eb36fccfa9.lerptime, var_7c6075e90a7b0fa);
                            var_214d924f4e137244.var_b2de9e740fef7506.newrequest = 0;
                        }
                    }
                }
                playerindex++;
            }
        }
        waitframe();
    }
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x36e8
// Size: 0x7c
function private function_276d3342cddac11a() {
    sceneplay = self;
    if (!isdefined(sceneplay.var_760345b17988f984)) {
        return;
    }
    foreach (var_570735e9e6be86eb in sceneplay.var_760345b17988f984) {
        function_f4cf37b2c85bb5c0(var_570735e9e6be86eb);
    }
    sceneplay.var_760345b17988f984 = undefined;
}

// Namespace scene / namespace_5952db407689619a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x376c
// Size: 0x8d
function private function_fa25c05bae26b761(var_6751e5eb36fccfa9, var_570735e9e6be86eb) {
    var_214d924f4e137244 = self;
    agent_type = var_214d924f4e137244 function_a2142af2db8fbb0();
    agent_team = var_214d924f4e137244 function_7c9fcb0161b76b2d();
    var_6b2ae165daddd53e = scripts\mp\mp_agent::spawnnewagentaitype(agent_type, var_6751e5eb36fccfa9.alignmentinfo.origin, var_6751e5eb36fccfa9.alignmentinfo.angles, agent_team);
    var_570735e9e6be86eb.agententity = var_6b2ae165daddd53e;
}

// Namespace scene / namespace_5952db407689619a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3801
// Size: 0x69
function private function_f4cf37b2c85bb5c0(var_570735e9e6be86eb) {
    if (!isdefined(var_570735e9e6be86eb.agententity)) {
        return;
    }
    agententity = var_570735e9e6be86eb.agententity;
    agententity notify("scene_monitor_players_agent_will_be_despawned");
    assert(isagent(agententity));
    agententity.nocorpse = 1;
    agententity namespace_14d36171baccf528::despawnagent();
    var_570735e9e6be86eb.agententity = undefined;
}

// Namespace scene / namespace_5952db407689619a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3872
// Size: 0x4
function function_720d21706a7ff164() {
    return true;
}

// Namespace scene / namespace_5952db407689619a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x387f
// Size: 0x30
function function_f66b22351778fe49(enabled) {
    assert(isplayer(self));
    player = self;
    player scripts\common\utility::letterbox_enable(enabled, 0);
}

// Namespace scene / namespace_5952db407689619a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x38b7
// Size: 0x50
function function_d18c2d3d2819c322(entity, var_214d924f4e137244) {
    assert(isplayer(entity));
    var_dbdcde08b6a6c0f2 = var_214d924f4e137244 function_3e13497ed7044cbd();
    var_a7f983dc6ed7cd38 = entity scripts\cp_mp\utility\player_utility::isfemale();
    if (var_dbdcde08b6a6c0f2 != var_a7f983dc6ed7cd38) {
        return false;
    }
    return true;
}

