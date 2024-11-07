#using scripts\engine\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\common\notetrack.gsc;
#using scripts\common\scene.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_sp.gsc;
#using script_308091d56071a91c;
#using script_784c8c4f3e5f8686;
#using scripts\sp\anim.gsc;
#using scripts\sp\player_rig.gsc;
#using scripts\sp\fakeactor.gsc;
#using scripts\sp\spawner.gsc;
#using scripts\asm\asm_bb.gsc;

#namespace scene;

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x542
// Size: 0x418
function private autoexec function_5f517f216d006d36() {
    /#
        if (getdvarint(@"hash_e6afce2cf5cf7515")) {
            return;
        }
    #/
    function_ace39e84230f386();
    function_9d3850b024ab89b1("modeLetterbox", &function_f6623635176f0b97);
    function_7855ec4caf5901f9("Types_Object", "shotObjectPlayAnim", &function_70b41a355929bc17);
    function_7855ec4caf5901f9("Types_Object", "shotObjectStopAnim", &function_cca29832342e0a31);
    function_7855ec4caf5901f9("Types_Object", "objectGetAnimRoot", &function_d63c9b1154a8be6);
    function_7855ec4caf5901f9("Types_Object", "objectWaitNotes", &function_5ace47d8b41f84c2);
    function_7855ec4caf5901f9("Types_Player", "objectSetup", &player_setup);
    function_7855ec4caf5901f9("Types_Player", "shotObjectSetup", &function_fbcd130e311a767f);
    function_7855ec4caf5901f9("Types_Player", "objectSetAnimName", &function_24b6b2bfc5bdab36);
    function_7855ec4caf5901f9("Types_Player", "objectMatchEntity", &function_c29e618edeaa7720);
    function_7855ec4caf5901f9("Types_Player", "objectGetAnimEntity", &function_e6e53745b22ae909);
    function_7855ec4caf5901f9("Types_Player", "objectGetLinkEnts", &function_9f8add72acb9b1f6);
    function_7855ec4caf5901f9("Types_Player", "objectVelocity", &player_velocity);
    function_7855ec4caf5901f9("Types_Player", "shotObjectPlayAnim", &function_a57d915bb947515);
    function_7855ec4caf5901f9("Types_Player", "shotObjectStopAnim", &function_e477b4837d3fc6a7);
    function_7855ec4caf5901f9("Types_Player", "shotObjectAnimEnd", &function_3efb11b3bc18a9c6);
    function_7855ec4caf5901f9("Types_Player", "objectCleanup", &function_a308fee174c4cbef);
    function_7855ec4caf5901f9("Types_Player", "objectDelete", &player_delete);
    function_7855ec4caf5901f9("Types_Player", "objectSetAnimRate", &function_c655258c05f2383c);
    function_7855ec4caf5901f9("Types_Player", "objectSetAnimTime", &function_3e11215cec07f917);
    function_7855ec4caf5901f9("Types_Actor", "objectSpawn", &function_8659067f9a753916);
    function_7855ec4caf5901f9("Types_Actor", "objectSetup", &function_93077082bb2dfff4);
    function_7855ec4caf5901f9("Types_Actor", "shotObjectPrepare", &function_9e7b86e7070de40f);
    function_7855ec4caf5901f9("Types_Actor", "shotObjectSetup", &function_451712661ab10691);
    function_7855ec4caf5901f9("Types_Actor", "shotObjectLinkSetup", &function_9acdf50d8ceba89e);
    function_7855ec4caf5901f9("Types_Actor", "objectMatchEntity", &function_62d306b8ddab4726);
    function_7855ec4caf5901f9("Types_Actor", "objectTeleport", &function_98f1777ab38d2bac);
    function_7855ec4caf5901f9("Types_Actor", "shotObjectFirstFrame", &function_f05b1eb6b24263b5);
    function_7855ec4caf5901f9("Types_Actor", "objectSetAnimRate", &function_9b5a56bdfebe61d6);
    function_7855ec4caf5901f9("Types_Actor", "objectSetAnimTime", &actor_set_anim_time);
    function_7855ec4caf5901f9("Types_Actor", "objectSetAnimLerp", &function_d3d0a7ea23cbe6d);
    function_7855ec4caf5901f9("Types_Actor", "objectSetAnimPlaying", &actor_set_anim_playing);
    function_7855ec4caf5901f9("Types_Actor", "shotObjectCleanup", &function_4a2b39e903062a08);
    function_7855ec4caf5901f9("Types_Actor", "objectCleanup", &function_345b126b71891225);
    function_7855ec4caf5901f9("Types_Actor", "objectKill", &actor_kill);
    function_7855ec4caf5901f9("Types_Actor", "objectCanAnimate", &function_dd4e63bb65c5102d);
    function_7855ec4caf5901f9("Types_FakeActor", "objectSpawn", &function_fb3ea231a7df2bf2);
    function_7855ec4caf5901f9("Types_FakeActor", "objectMatchEntity", &function_aa6788c9ed21c842);
    function_7855ec4caf5901f9("Types_FakeActor", "shotObjectPrepare", &function_f07b0cbbb739527b);
    function_7855ec4caf5901f9("Types_FakeActor", "shotObjectCleanup", &function_aaa12a8607a888a4);
    function_7855ec4caf5901f9("Types_FakeActor", "objectCleanup", &function_b76ec219f2a45811);
    function_5a197e7b54a9091e();
    if (!isdefined(level.scr_animtree) || !isdefined(level.scr_animtree["player_rig"])) {
        gamemodebundle = function_1e231fc15fdab31d();
        if (isdefined(gamemodebundle) && isdefined(gamemodebundle.var_8ec20071f762ea35)) {
            scripts\sp\player_rig::init_player_rig(gamemodebundle.var_8ec20071f762ea35, undefined, gamemodebundle.var_6c2ad496230d88b9);
        } else {
            scripts\sp\player_rig::init_player_rig("viewhands_base_iw8", undefined, "viewhands_base_fullbody_iw8");
        }
    }
    level thread function_e16b1ab0a35605d3("load_finished");
}

// Namespace scene / namespace_e13328197b5f445c
// Params 8, eflags: 0x4
// Checksum 0x0, Offset: 0x962
// Size: 0x342
function private function_cfe0d1ffc4e09be5(entity, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime) {
    var_214d924f4e137244 = self;
    if (!isdefined(entity)) {
        return;
    }
    animlengthtime = 0;
    animrate = undefined;
    done = 0;
    if (isdefined(var_214d924f4e137244.sceneroot.scenestatic)) {
        animrate = var_214d924f4e137244.sceneroot.scenestatic.animrate;
    }
    var_866b3a3066122e39 = default_to(var_866b3a3066122e39, 0);
    lerptime = default_to(lerptime, 0);
    blendtime = default_to(blendtime, 0.2);
    root = var_214d924f4e137244 function_b9c245bf99df4a8();
    if (entity.model == "") {
        println("<dev string:x1c>" + var_214d924f4e137244.sceneobject function_aeb2b46911a5811d() + "<dev string:x4c>");
        return 0;
    }
    if (isdefined(var_866b3a3066122e39) && var_866b3a3066122e39 > 0) {
        blendtime = 0;
        lerptime = 0;
    }
    function_e4fc30ccdca08b9d(alignmentinfo);
    if (!var_214d924f4e137244 function_744a16ccecd8e4dd()) {
        return 0;
    }
    startorigin = getstartorigin(alignmentinfo.origin, alignmentinfo.angles, var_4f3089070d8b1e24);
    startangles = getstartangles(alignmentinfo.origin, alignmentinfo.angles, var_4f3089070d8b1e24);
    if (lerptime <= 0) {
        var_214d924f4e137244 object_teleport(startorigin, startangles);
    } else {
        angledelta = anglesdelta(entity.angles, startangles);
        entity.anglelerprate = angledelta / lerptime;
    }
    if (var_866b3a3066122e39 < 1) {
        var_214d924f4e137244 childthread function_8e9f8e1fbe2b7ab4(notifystring, var_4f3089070d8b1e24);
    }
    entity animscripted(notifystring, alignmentinfo.origin, alignmentinfo.angles, var_4f3089070d8b1e24, undefined, root, blendtime);
    var_2b6a8cc75ce67f16 = is_equal(var_4f3089070d8b1e24, var_214d924f4e137244.var_a3ff79ae166c57aa);
    var_214d924f4e137244 function_bdfc45b799d27532(var_4f3089070d8b1e24);
    var_214d924f4e137244 thread function_bf2f06d70b4e15ad(1);
    if (isdefined(lerptime) && lerptime > 0) {
        var_214d924f4e137244 childthread function_db16fb604c5ca71d(lerptime, var_214d924f4e137244 object_velocity());
    }
    if (isdefined(blendcurve) && blendtime > 0) {
        entity setanimblendcurve(var_4f3089070d8b1e24, blendcurve);
    }
    if (isdefined(var_866b3a3066122e39) && var_866b3a3066122e39 > 0 && var_866b3a3066122e39 <= 1) {
        if (var_866b3a3066122e39 == 1 && function_8581f011ce975a6(var_4f3089070d8b1e24)) {
            var_866b3a3066122e39 = 0.999;
        }
        var_214d924f4e137244 function_380708345e16e475(var_4f3089070d8b1e24, var_866b3a3066122e39);
    } else if (istrue(var_2b6a8cc75ce67f16)) {
        var_214d924f4e137244 function_380708345e16e475(var_4f3089070d8b1e24, 0);
    }
    var_214d924f4e137244 function_6a4d64bdba27cb06(animrate);
    if (var_866b3a3066122e39 < 1) {
        entity function_ee012c2dd711a8ce(notifystring, "end", "stop_animmode");
    }
    animlengthtime += getanimlength(var_4f3089070d8b1e24);
    return animlengthtime - var_866b3a3066122e39 * animlengthtime;
}

// Namespace scene / namespace_e13328197b5f445c
// Params 10, eflags: 0x4
// Checksum 0x0, Offset: 0xcad
// Size: 0xac
function private function_70b41a355929bc17(shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime, animationtype) {
    var_214d924f4e137244 = self;
    anim_entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    assert(default_to(animationtype, "DeltaAnimation") == "DeltaAnimation");
    animplaybacktime = var_214d924f4e137244 function_cfe0d1ffc4e09be5(anim_entity, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime);
    return animplaybacktime;
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd62
// Size: 0x2d
function private function_cca29832342e0a31() {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    if (isdefined(entity)) {
        entity scripts\engine\sp\utility::anim_stopanimscripted();
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd97
// Size: 0x8c
function private function_d63c9b1154a8be6() {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    root = undefined;
    if (isai(entity) || entity scripts\sp\fakeactor::is_fakeactor()) {
        root = entity asm_getbodyknob();
    } else if (isdefined(entity.anim_getrootfunc)) {
        root = [[ entity.anim_getrootfunc ]]();
    }
    if (isdefined(entity.asm) && !isai(entity)) {
        entity asm_animscripted();
    }
    return root;
}

// Namespace scene / namespace_e13328197b5f445c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xe2c
// Size: 0x51
function private function_5ace47d8b41f84c2(notifystring, var_4f3089070d8b1e24) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    if (!isdefined(entity)) {
        return;
    }
    var_214d924f4e137244 childthread start_notetrack_wait(entity, notifystring, undefined, undefined, var_4f3089070d8b1e24);
    var_214d924f4e137244 childthread animscriptdonotetracksthread(entity, notifystring, undefined);
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xe85
// Size: 0x2a
function private player_setup(sceneplay) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244.var_2149ca9fd12d790b = var_214d924f4e137244 function_11f0b522fd79c07b();
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xeb7
// Size: 0x132
function private function_fbcd130e311a767f(shotindex) {
    var_214d924f4e137244 = self;
    if (isplayer(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity delaycall(0.1, &clearplayerhintlock);
        var_214d924f4e137244.entity val::set("scene_scene", "cinematic_motion", 0);
        var_214d924f4e137244.entity val::set("scene_scene", "show_legs_and_shadow", 0);
        if (var_214d924f4e137244 function_8186a93a774b5977() == "Scene_Model") {
            if (!isdefined(var_214d924f4e137244.var_d4981703521d992)) {
                var_214d924f4e137244.var_d4981703521d992 = [];
                foreach (rig in var_214d924f4e137244.var_2149ca9fd12d790b) {
                    var_214d924f4e137244.var_d4981703521d992[animname] = rig.model;
                }
            }
            model = var_214d924f4e137244.sceneobject function_12eb9fd56334261c();
            scripts\sp\player_rig::init_player_rig_no_precache(model);
        }
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xff1
// Size: 0x1f
function private function_24b6b2bfc5bdab36(animname, animtree) {
    var_214d924f4e137244 = self;
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1018
// Size: 0x9a
function private function_c655258c05f2383c(animrate) {
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.var_2149ca9fd12d790b)) {
        return;
    }
    foreach (rig in var_214d924f4e137244.var_2149ca9fd12d790b) {
        if (isdefined(rig) && isdefined(var_214d924f4e137244.var_77c99123aefe423b)) {
            rig setanimrate(var_214d924f4e137244.var_77c99123aefe423b, animrate);
        }
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x10ba
// Size: 0x8f
function private function_3e11215cec07f917(var_4f3089070d8b1e24, timefrac) {
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.var_2149ca9fd12d790b)) {
        return;
    }
    foreach (rig in var_214d924f4e137244.var_2149ca9fd12d790b) {
        if (isdefined(rig)) {
            rig setanimtime(var_4f3089070d8b1e24, timefrac);
            rig dontinterpolate();
        }
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1151
// Size: 0x1d
function private function_c29e618edeaa7720(entity) {
    var_214d924f4e137244 = self;
    return isplayer(entity);
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1177
// Size: 0x15f
function private function_11f0b522fd79c07b() {
    var_214d924f4e137244 = self;
    result = [];
    animtree = var_214d924f4e137244.sceneobject function_c106523f3836b90b();
    rigs = var_214d924f4e137244 scripts\sp\player_rig::function_8ded956fcab6f73a(0, 1, animtree);
    var_e7fa17ac3f0d00fd = var_214d924f4e137244 function_8186a93a774b5977();
    switch (var_e7fa17ac3f0d00fd) {
    case #"hash_f900f466f5425fa7":
        result["player_rig"] = rigs["player_rig"];
        result["player_legs"] = rigs["player_legs"];
        break;
    case #"hash_cc1dcc1121d79906":
        result["player_rig"] = rigs["player_rig"];
        result["player_body"] = rigs["player_body"];
        break;
    case #"hash_a947444bcd267ab4":
        result = rigs;
        break;
    case #"hash_8619326cd6780be9":
    default:
        result["player_rig"] = rigs["player_rig"];
        break;
    }
    foreach (animname, rig in rigs) {
        if (result.size == 0) {
            result[animname] = rigs[animname];
        }
        if (!isdefined(result[animname])) {
            rig hide();
        }
    }
    return result;
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x12df
// Size: 0x92
function private function_5f3da76468742def() {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.var_2149ca9fd12d790b)) {
        if (isdefined(var_214d924f4e137244.var_2149ca9fd12d790b["player_rig"])) {
            return var_214d924f4e137244.var_2149ca9fd12d790b["player_rig"];
        }
        foreach (rig in var_214d924f4e137244.var_2149ca9fd12d790b) {
            return rig;
        }
    }
    return undefined;
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x137a
// Size: 0x15
function private function_e6e53745b22ae909() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244 function_5f3da76468742def();
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1398
// Size: 0x19
function private function_9f8add72acb9b1f6() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244.var_2149ca9fd12d790b;
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x13ba
// Size: 0x1e
function private player_velocity() {
    var_214d924f4e137244 = self;
    return var_214d924f4e137244.entity getvelocity();
}

// Namespace scene / namespace_e13328197b5f445c
// Params 9, eflags: 0x4
// Checksum 0x0, Offset: 0x13e1
// Size: 0x5db
function private function_a57d915bb947515(shotindex, animindex, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, lerptime) {
    var_214d924f4e137244 = self;
    player = var_214d924f4e137244.entity;
    var_214d924f4e137244 endon("scene_stop");
    var_214d924f4e137244 endon("scene_play_anim");
    if (istrue(var_214d924f4e137244.sceneroot.scenedata.excludeplayer) || !isplayer(player)) {
        var_214d924f4e137244 function_bf0d14daf3e53248(var_4f3089070d8b1e24, var_214d924f4e137244.var_41dc93404af773a3, notifystring);
        var_214d924f4e137244 function_68056529c69f4097(var_214d924f4e137244.var_41dc93404af773a3, shotindex, animindex);
        return 0;
    }
    var_409dc6bbf1421f94 = var_214d924f4e137244 function_5fe020a6db35fab3(shotindex);
    if (var_214d924f4e137244.var_41dc93404af773a3 == "CameraAnimation") {
        var_214d924f4e137244 thread object_play_anim_waittill_end(var_4f3089070d8b1e24, [player], "death", "CameraAnimation", notifystring);
        var_214d924f4e137244.xcamplaying = 1;
        player val::set_array("scene_shot", var_409dc6bbf1421f94, 0);
        return var_214d924f4e137244 function_bae0f68830d519ad("scene_shot", player, var_4f3089070d8b1e24, var_866b3a3066122e39, notifystring, alignmentinfo, shotindex);
    }
    animlengthtime = 0;
    rig = var_214d924f4e137244 function_5f3da76468742def();
    shotindex = var_214d924f4e137244.sceneplay.currentshot;
    stance = var_214d924f4e137244.sceneobject function_892812e26790e793(shotindex);
    blendtime = var_214d924f4e137244.sceneobject function_205f7afe5d801664(shotindex);
    arcright = var_214d924f4e137244.sceneobject function_918dc2e0c83784b6(shotindex);
    arcleft = var_214d924f4e137244.sceneobject function_16b4cb7e4c5af0fd(shotindex);
    arctop = var_214d924f4e137244.sceneobject function_b06da1547120edef(shotindex);
    arcbottom = var_214d924f4e137244.sceneobject function_be3310ec58dd9807(shotindex);
    var_562ff78798cbfcc8 = var_214d924f4e137244.sceneobject function_8851aea907b47f88(shotindex);
    var_b85605ef08d6e4c2 = 0;
    autocenter = var_214d924f4e137244.sceneobject function_20e9c3d094691efe(shotindex);
    viewfraction = var_214d924f4e137244.sceneobject function_b083c5862877c8e3(shotindex);
    if (isdefined(var_214d924f4e137244.scenedata.var_43286fd46706909c)) {
        blendtime = 0;
        lerptime = 0;
    }
    scripts\sp\player_rig::set_player_rig_allows(var_409dc6bbf1421f94);
    /#
        if (getdvarint(@"hash_54fd90073299424e")) {
            player thread namespace_6068faad90cf91ee::function_c623b8e6e4b0a90("<dev string:x4e>", 20, getdvarint(@"hash_54fd90073299424e"), lerptime);
            rig thread namespace_6068faad90cf91ee::function_c623b8e6e4b0a90("<dev string:x4f>", 20, getdvarint(@"hash_54fd90073299424e"));
            rig thread namespace_6068faad90cf91ee::function_c623b8e6e4b0a90("<dev string:x5a>", 20, getdvarint(@"hash_54fd90073299424e"));
        }
    #/
    if (!var_214d924f4e137244 function_829b387c84d7e2c0()) {
        var_ec96a350b2692ae9 = lerptime > 0;
        var_1c5d1595dab3ef39 = blendtime > 0;
        if (var_1c5d1595dab3ef39) {
            level.blendinfo["weaponDropTime"] = max(lerptime, blendtime) * 0.7;
        }
        linktag = var_214d924f4e137244 function_a89f1262c5148bdf();
        var_88debd1c2ff963d2 = [];
        foreach (var_e079e7d4275a0ea5 in var_214d924f4e137244.var_2149ca9fd12d790b) {
            if (var_e079e7d4275a0ea5 == rig) {
                continue;
            }
            var_88debd1c2ff963d2[var_88debd1c2ff963d2.size] = var_e079e7d4275a0ea5;
        }
        var_214d924f4e137244.sceneroot childthread scripts\sp\player_rig::link_player_to_rig(undefined, stance, var_ec96a350b2692ae9, lerptime, var_b85605ef08d6e4c2, arcright, arcleft, arctop, arcbottom, var_562ff78798cbfcc8, undefined, undefined, undefined, var_1c5d1595dab3ef39, undefined, undefined, undefined, linktag, var_88debd1c2ff963d2);
    } else {
        foreach (var_2778218a409bad6a in var_214d924f4e137244.var_2149ca9fd12d790b) {
            var_2778218a409bad6a show();
        }
        if (!player function_68d997f850b153c7()) {
            player lerpviewangleclamp(lerptime, lerptime * 0.5, lerptime * 0.5, arcright, arcleft, arctop, arcbottom, 1);
        }
        player scripts\sp\player_rig::function_73341653f76b4e43();
    }
    if (lerptime <= 0) {
        if (!var_214d924f4e137244 function_285bdba488858f9e(shotindex)) {
            player dontinterpolate();
        }
    }
    var_214d924f4e137244.var_b3996565972e4ff0 = 1;
    if (var_214d924f4e137244 function_829b387c84d7e2c0() && !player isufo() && !player isnoclip()) {
        if (autocenter) {
            player springcamenabled(1);
        } else {
            player springcamdisabled(0.2);
        }
        player function_6b8a3855966e9ada(viewfraction);
    }
    var_214d924f4e137244 thread function_e0ade8dd368ad3a5();
    var_2c898415e2a1fcb1 = 0;
    foreach (var_e079e7d4275a0ea5 in var_214d924f4e137244.var_2149ca9fd12d790b) {
        if (var_e079e7d4275a0ea5 != rig) {
            var_214d924f4e137244 thread function_cfe0d1ffc4e09be5(var_e079e7d4275a0ea5, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, var_2c898415e2a1fcb1);
        }
    }
    animlengthtime = var_214d924f4e137244 function_cfe0d1ffc4e09be5(rig, notifystring, alignmentinfo, var_4f3089070d8b1e24, var_866b3a3066122e39, blendtime, blendcurve, var_2c898415e2a1fcb1);
    return animlengthtime;
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x19c5
// Size: 0x1e
function private function_e477b4837d3fc6a7() {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 function_2f2327d535ed0bb();
    var_214d924f4e137244 function_cca29832342e0a31();
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x19eb
// Size: 0x138
function private function_3efb11b3bc18a9c6() {
    var_214d924f4e137244 = self;
    foreach (rig in var_214d924f4e137244.var_2149ca9fd12d790b) {
        if (isdefined(rig) && isdefined(var_214d924f4e137244.var_36831a04af11576f)) {
            foreach (message in var_214d924f4e137244.var_36831a04af11576f) {
                rig notify(message, "end");
            }
        }
    }
    if (isdefined(var_214d924f4e137244.entity) && isdefined(var_214d924f4e137244.var_36831a04af11576f)) {
        foreach (message in var_214d924f4e137244.var_36831a04af11576f) {
            var_214d924f4e137244.entity notify(message, "end");
        }
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1b2b
// Size: 0x1ee
function private function_a308fee174c4cbef(var_fa1af9d2277fd747) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 function_2f2327d535ed0bb();
    if (var_214d924f4e137244.var_2149ca9fd12d790b.size > 0) {
        rig = var_214d924f4e137244 function_5f3da76468742def();
        if (!isdefined(var_fa1af9d2277fd747)) {
            if (var_214d924f4e137244 function_829b387c84d7e2c0()) {
                stancebegin = var_214d924f4e137244.sceneobject function_892812e26790e793(var_214d924f4e137244.sceneplay.currentshot);
                stanceend = var_214d924f4e137244.sceneobject function_c3345343cc0eb8ab(var_214d924f4e137244.sceneplay.currentshot);
                var_ccea62aa85f5d332 = default_to(rig.linktag, "tag_player") == "tag_camera";
                if (!is_equal(stancebegin, stanceend)) {
                    var_ccea62aa85f5d332 = 1;
                }
                childthread scripts\sp\player_rig::unlink_player_from_rig(0, stanceend, var_ccea62aa85f5d332, 1);
            }
            if (isplayer(var_214d924f4e137244.entity) && istrue(var_214d924f4e137244.var_b3996565972e4ff0)) {
                var_214d924f4e137244.entity val::reset_all("player_rig");
                var_214d924f4e137244.var_b3996565972e4ff0 = undefined;
            }
        }
        foreach (rig in var_214d924f4e137244.var_2149ca9fd12d790b) {
            rig hide();
        }
        if (var_214d924f4e137244 function_8186a93a774b5977() == "Scene_Model" && isdefined(var_214d924f4e137244.var_d4981703521d992)) {
            scripts\sp\player_rig::init_player_rig_no_precache(var_214d924f4e137244.var_d4981703521d992["player_rig"], var_214d924f4e137244.var_d4981703521d992["player_legs"], var_214d924f4e137244.var_d4981703521d992["player_body"]);
            var_214d924f4e137244.var_d4981703521d992 = undefined;
        }
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1d21
// Size: 0x2
function private player_delete() {
    
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1d2b
// Size: 0x38
function private function_8186a93a774b5977() {
    var_214d924f4e137244 = self;
    return default_to(var_214d924f4e137244.sceneobject.variant_object.var_4abe5bbb3e48b9fa, "Rig");
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1d6c
// Size: 0x62
function private function_829b387c84d7e2c0() {
    var_214d924f4e137244 = self;
    rig = var_214d924f4e137244 function_5f3da76468742def();
    player = var_214d924f4e137244.entity;
    if (isdefined(player) && isdefined(rig)) {
        playerparent = player getlinkedparent();
        if (isdefined(playerparent) && playerparent == rig) {
            return true;
        }
    }
    return false;
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dd7
// Size: 0x92
function function_e0ade8dd368ad3a5() {
    var_214d924f4e137244 = self;
    if (!isdefined(var_214d924f4e137244.var_2149ca9fd12d790b)) {
        return;
    }
    body = var_214d924f4e137244.var_2149ca9fd12d790b["player_body"];
    if (isdefined(body)) {
        if (!isdefined(var_214d924f4e137244.var_53c962747bd1f2f)) {
            var_214d924f4e137244 waittill("scene_anim_playing");
        }
        waittillframeend();
        /#
            if (getdvarint(@"hash_d0761d5c3f9e3bf", 0)) {
                body setanim(player%head_shoulder_hide, 0, 0);
                return;
            }
        #/
        body setanim(player%head_shoulder_hide, 1, 0);
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1e71
// Size: 0x123
function private function_fb3ea231a7df2bf2(spawnorigin, spawnangles) {
    var_214d924f4e137244 = self;
    var_373a2c3b02b1d81c = var_214d924f4e137244.sceneobject function_992de34e05c5cea7();
    var_6fc4d2978cf27bef = var_214d924f4e137244.sceneobject function_12eb9fd56334261c();
    entity = undefined;
    if (var_373a2c3b02b1d81c == "aitype") {
        entity = function_d9469562fdbb08bc("actor_" + var_6fc4d2978cf27bef, spawnorigin, spawnangles);
    }
    if (!isdefined(entity)) {
        entity = var_214d924f4e137244 function_3e19c1b49e591d34(spawnorigin, spawnangles);
        if (isdefined(entity)) {
            entity.team = "allies";
            entity.type = "human";
            entity.unittype = "soldier";
            var_214d924f4e137244.var_5e52befcbd249bdc = 1;
        }
    }
    if (isdefined(entity)) {
        entity scripts\sp\spawner::function_7a2464dfda234e36();
        if (var_214d924f4e137244 function_5a831c826484d0fa() == "Sentient" && !istrue(var_214d924f4e137244.var_5e52befcbd249bdc)) {
            var_214d924f4e137244 function_318f4852c1eb7c74(entity);
        }
        entity useanimtree(var_214d924f4e137244.sceneobject function_c106523f3836b90b());
    }
    return entity;
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1f9d
// Size: 0x50
function private function_aa6788c9ed21c842(entity) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244.var_5e52befcbd249bdc = undefined;
    if (var_214d924f4e137244 function_5a831c826484d0fa() == "Sentient") {
        return istrue(entity.script_fakeactor);
    }
    return entity.classname == "script_model";
}

// Namespace scene / namespace_e13328197b5f445c
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1ff6
// Size: 0xf1
function private function_f07b0cbbb739527b(sceneplay, shotindex, objectindex) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        fakeactor = var_214d924f4e137244.entity;
        if (var_214d924f4e137244 function_e2bb6af4c53815a0()) {
            fakeactor scripts\sp\fakeactor::function_cc5fb4563e4cbd5d();
        }
        if (var_214d924f4e137244.sceneobject function_fc9281240877df76()) {
            if (var_214d924f4e137244 function_5a831c826484d0fa() == "Sentient" && !istrue(var_214d924f4e137244.var_5e52befcbd249bdc)) {
                var_214d924f4e137244 function_318f4852c1eb7c74();
                fakeactor scripts\sp\fakeactor::set_use_pain(1);
            } else {
                var_214d924f4e137244 thread function_7e0dd853c6d00913();
            }
        } else {
            fakeactor scripts\sp\fakeactor::function_b4deaa96649c12db();
        }
        if (istrue(fakeactor.script_fakeactor)) {
            fakeactor scripts\sp\fakeactor::take_control();
        }
        if (var_214d924f4e137244 function_e0c309a786687925(shotindex)) {
            fakeactor val::set("scene_shot", "take_weapons", 1);
        }
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x20ef
// Size: 0x70
function private function_aaa12a8607a888a4(shotindex) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        fakeactor = var_214d924f4e137244.entity;
        if (istrue(fakeactor.script_fakeactor)) {
            fakeactor scripts\sp\fakeactor::release_control();
        }
        if (var_214d924f4e137244 function_e0c309a786687925(shotindex)) {
            fakeactor val::reset("scene_shot", "take_weapons");
        }
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2167
// Size: 0x4e
function private function_b76ec219f2a45811(var_fa1af9d2277fd747) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        fakeactor = var_214d924f4e137244.entity;
        if (var_214d924f4e137244 function_e2bb6af4c53815a0()) {
            fakeactor scripts\sp\fakeactor::function_ca5cea9991fa5306();
        }
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x21bd
// Size: 0x77
function private function_318f4852c1eb7c74(entity) {
    var_214d924f4e137244 = self;
    entity = default_to(entity, var_214d924f4e137244.entity);
    if (isdefined(entity)) {
        fakeactor = entity;
        if (!isdefined(level.fakeactor_spawn_func)) {
            scripts\sp\fakeactor::fakeactor_spawner_init();
        }
        if (!istrue(fakeactor.script_fakeactor) && isdefined(level.fakeactor_spawn_func)) {
            fakeactor thread function_1fad0f895757885a();
        }
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x223c
// Size: 0x4a
function private function_7e0dd853c6d00913() {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        fakeactor = var_214d924f4e137244.entity;
        if (!istrue(fakeactor.script_fakeactor)) {
            fakeactor scripts\sp\fakeactor::function_b247aabd62f70947();
        }
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x228e
// Size: 0x38
function private function_5a831c826484d0fa() {
    var_214d924f4e137244 = self;
    return default_to(var_214d924f4e137244.sceneobject.variant_object.var_d535bb329f6c6a09, "Drone");
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x22cf
// Size: 0x2e
function private function_e2bb6af4c53815a0() {
    var_214d924f4e137244 = self;
    return istrue(var_214d924f4e137244.sceneobject.variant_object.navRepulsor);
}

// Namespace scene / namespace_e13328197b5f445c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2306
// Size: 0x167
function private function_8659067f9a753916(spawnorigin, spawnangles) {
    var_214d924f4e137244 = self;
    var_373a2c3b02b1d81c = var_214d924f4e137244.sceneobject function_992de34e05c5cea7();
    var_6fc4d2978cf27bef = var_214d924f4e137244.sceneobject function_12eb9fd56334261c();
    entity = undefined;
    if (isactorspawner(var_214d924f4e137244.spawner)) {
        var_75c15e716113c51b = isdefined(var_214d924f4e137244.spawner.script_stealthgroup) && flag("stealth_enabled") && !flag("stealth_spotted");
        entity = var_214d924f4e137244.spawner stalingradspawn(var_75c15e716113c51b, 1);
        if (isdefined(entity)) {
            entity teleport(spawnorigin, spawnangles);
        }
    }
    if (!isdefined(entity)) {
        if (var_373a2c3b02b1d81c == "aitype") {
            entity = dospawnaitype("actor_" + var_6fc4d2978cf27bef, spawnorigin, spawnangles, 1, 0, 1, 1);
            if (isdefined(entity)) {
                entity thread scripts\sp\spawner::spawn_think();
            }
        } else if (var_373a2c3b02b1d81c == "character") {
            println("<dev string:x65>" + var_214d924f4e137244.sceneobject function_aeb2b46911a5811d() + "<dev string:x8f>" + var_6fc4d2978cf27bef + "<dev string:x4c>");
        }
    }
    if (isdefined(entity)) {
        entity useanimtree(var_214d924f4e137244.sceneobject function_c106523f3836b90b());
    }
    return entity;
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2476
// Size: 0xa1
function private function_93077082bb2dfff4(sceneplay) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        actor = var_214d924f4e137244.entity;
        if (isdefined(actor.stealth) && isdefined(level.stealth)) {
            if (var_214d924f4e137244 function_62305a66a4f213b()) {
                var_214d924f4e137244 thread function_89c29980d9b0ebe();
            }
            if (var_214d924f4e137244 function_c811d75d62ab3b31()) {
                var_214d924f4e137244 thread function_81f89576d8f466b4();
            }
        }
        if (var_214d924f4e137244.sceneobject function_fc9281240877df76()) {
            actor.allowdeath = 1;
        }
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x251f
// Size: 0x27
function private function_62d306b8ddab4726(entity) {
    var_214d924f4e137244 = self;
    return isactor(entity) && isalive(entity);
}

// Namespace scene / namespace_e13328197b5f445c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x254f
// Size: 0x32
function private function_98f1777ab38d2bac(origin, angles) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244.entity forceteleport(origin, angles);
}

// Namespace scene / namespace_e13328197b5f445c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2589
// Size: 0x19d
function private function_f05b1eb6b24263b5(alignmentinfo, shotindex) {
    var_214d924f4e137244 = self;
    shotindex = default_to(shotindex, var_214d924f4e137244.sceneplay.shotinit);
    actor = var_214d924f4e137244.entity;
    var_45d86f20e184e36a = var_214d924f4e137244.sceneobject function_79edcc9987330a2a(shotindex);
    if (var_45d86f20e184e36a.size != 0 && isent(actor)) {
        var_4f3089070d8b1e24 = var_45d86f20e184e36a[0];
        var_214d924f4e137244 function_cca29832342e0a31();
        origin = getstartorigin(alignmentinfo.origin, alignmentinfo.angles, var_4f3089070d8b1e24);
        angles = getstartangles(alignmentinfo.origin, alignmentinfo.angles, var_4f3089070d8b1e24);
        actor thread ai_anim_first_frame(var_4f3089070d8b1e24, actor.animname);
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<dev string:x95>" + function_3c8848a3a11b2553(getanimname(var_4f3089070d8b1e24)), origin, angles);
        #/
        /#
            function_ce4b6d4d859ede39(var_214d924f4e137244, "<dev string:xa2>" + function_3c8848a3a11b2553(getanimname(var_4f3089070d8b1e24)), alignmentinfo.origin, alignmentinfo.angles);
        #/
        actor function_ad9433aab9fcdf04(level.framedurationseconds, "scene_play_anim", &forceteleport, origin, angles);
        actor function_ad9433aab9fcdf04(level.framedurationseconds, "scene_play_anim", &setanimtime, var_4f3089070d8b1e24, 0);
        actor function_ad9433aab9fcdf04(level.framedurationseconds, "scene_play_anim", &setanimrate, var_4f3089070d8b1e24, 0);
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x272e
// Size: 0x5a
function private function_9b5a56bdfebe61d6(animrate) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    if (isdefined(entity) && isdefined(var_214d924f4e137244.var_77c99123aefe423b)) {
        var_214d924f4e137244 function_2142970a7a74d1f2("scene_play_anim", &setanimrate, var_214d924f4e137244.var_77c99123aefe423b, animrate);
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2790
// Size: 0x57
function private actor_set_anim_time(var_4f3089070d8b1e24, timefrac) {
    var_214d924f4e137244 = self;
    entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    if (isdefined(entity)) {
        entity notify("actor_set_anim_time");
        entity dontinterpolate();
        var_214d924f4e137244 function_2142970a7a74d1f2("scene_play_anim", &setanimtime, var_4f3089070d8b1e24, timefrac);
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x27ef
// Size: 0x75
function private function_d3d0a7ea23cbe6d(lerptime, velocity) {
    var_214d924f4e137244 = self;
    lerptime = default_to(lerptime, 0);
    var_8e37660f5aca2238 = default_to(velocity, (0, 0, 0));
    entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    if (isdefined(entity)) {
        var_214d924f4e137244 function_2142970a7a74d1f2("scene_play_anim", &function_4beb9f7715504995, lerptime, velocity);
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x286c
// Size: 0x9e
function private actor_set_anim_playing(var_4f3089070d8b1e24) {
    var_214d924f4e137244 = self;
    var_214d924f4e137244 notify("actor_set_anim_playing");
    var_214d924f4e137244 endon("actor_set_anim_playing");
    var_214d924f4e137244 endon("scene_stop");
    entity = var_214d924f4e137244 function_4c4c2a548b9fc7ab();
    if (!isdefined(entity)) {
        return;
    }
    codescripted = undefined;
    if (!isdefined(var_214d924f4e137244.var_53c962747bd1f2f)) {
        entity waittill("scripted_anim", codescripted);
    }
    if (isdefined(codescripted) && isdefined(codescripted["anim"]) && codescripted["anim"] == var_4f3089070d8b1e24) {
        var_214d924f4e137244.var_53c962747bd1f2f = var_4f3089070d8b1e24;
        var_214d924f4e137244 notify("scene_anim_playing", var_4f3089070d8b1e24);
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2912
// Size: 0x25
function private function_9e7b86e7070de40f(sceneplay, shotindex, objectindex) {
    function_bea88b25e17cea66(sceneplay, shotindex, objectindex);
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x293f
// Size: 0x87
function private function_451712661ab10691(shotindex) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        actor = var_214d924f4e137244.entity;
        if (var_214d924f4e137244.sceneobject function_2917c4d9acc44d9(shotindex) && isdefined(anim.var_91bc951178da9f3b)) {
            actor function_f9a207358d70923c(level.framedurationseconds, "scene_shot_cleanup", anim.var_91bc951178da9f3b, level.player);
        }
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x29ce
// Size: 0x3b
function private function_9acdf50d8ceba89e(shotindex) {
    var_214d924f4e137244 = self;
    reachtype = var_214d924f4e137244.sceneobject function_8b6dcfac0d2921ad(shotindex);
    return reachtype == "Teleport";
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2a12
// Size: 0x128
function private function_4a2b39e903062a08(shotindex) {
    var_214d924f4e137244 = self;
    if (isdefined(var_214d924f4e137244.entity)) {
        actor = var_214d924f4e137244.entity;
        var_d223a5b14195b3ef = var_214d924f4e137244.sceneobject function_b56c0812b975be8(shotindex);
        if (var_d223a5b14195b3ef != "DEFAULT") {
            actor val::set("scene_end", "demeanor", var_d223a5b14195b3ef);
        }
        if (var_214d924f4e137244.sceneobject function_2917c4d9acc44d9(shotindex) && isdefined(anim.var_8122f7efa052c448)) {
            actor [[ anim.var_8122f7efa052c448 ]](level.player);
        }
        stanceend = var_214d924f4e137244.sceneobject function_c3345343cc0eb8ab(shotindex);
        actor scripts\asm\asm_bb::bb_requeststance(stanceend);
        if (var_214d924f4e137244 function_1ac09e541828ca09()) {
            actor setgoalpos(actor.origin);
        }
        if (var_214d924f4e137244 function_ebd63773be52d607()) {
            actor pausepath(randomfloatrange(2, 3));
        }
        if (var_214d924f4e137244 function_e0c309a786687925(shotindex)) {
            actor val::reset("scene_shot", "take_weapons");
        }
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2b42
// Size: 0x33
function private function_dd4e63bb65c5102d() {
    var_214d924f4e137244 = self;
    return isalive(var_214d924f4e137244.entity) && !var_214d924f4e137244.entity doinglongdeath();
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2b7e
// Size: 0x43
function private actor_kill() {
    var_214d924f4e137244 = self;
    if (isalive(var_214d924f4e137244.entity)) {
        var_214d924f4e137244.entity startragdoll();
        var_214d924f4e137244.entity kill();
    }
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2bc9
// Size: 0x17
function private function_345b126b71891225(var_fa1af9d2277fd747) {
    var_214d924f4e137244 = self;
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2be8
// Size: 0x2e
function private function_62305a66a4f213b() {
    var_214d924f4e137244 = self;
    return istrue(var_214d924f4e137244.sceneobject.variant_object.var_c7a287a49a73337e);
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2c1f
// Size: 0x2e
function private function_c811d75d62ab3b31() {
    var_214d924f4e137244 = self;
    return istrue(var_214d924f4e137244.sceneobject.variant_object.var_6a57596fc25e6a9f);
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2c56
// Size: 0x2e
function private function_ebd63773be52d607() {
    var_214d924f4e137244 = self;
    return istrue(var_214d924f4e137244.sceneobject.variant_object.delaymovementatend);
}

// Namespace scene / namespace_e13328197b5f445c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2c8d
// Size: 0x2e
function private function_1ac09e541828ca09() {
    var_214d924f4e137244 = self;
    return istrue(var_214d924f4e137244.sceneobject.variant_object.var_fefc136f72d755f);
}

// Namespace scene / namespace_e13328197b5f445c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cc4
// Size: 0x30
function function_f6623635176f0b97(enabled) {
    assert(isplayer(self));
    player = self;
    player scripts\sp\anim::letterbox_enable(enabled, 0);
}

