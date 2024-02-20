// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\auto_ascender.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\anim.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_7789eb64bade5954;

// Namespace namespace_7789eb64bade5954/namespace_dbfefbfabc3195f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x687
// Size: 0x2c5
function init() {
    level.ascendsolostarts = getstructarray("ascend_solo_begin", "script_noteworthy");
    level.descendsolostarts = getstructarray("descend_solo_begin", "script_noteworthy");
    level.var_bb91debcfc5a4bc2 = getentarray("zipline_shine", "script_noteworthy");
    foreach (a in level.ascendsolostarts) {
        namespace_c851aa543ccfe72f::markupascenderstruct(a, 1);
    }
    foreach (b in level.descendsolostarts) {
        namespace_c851aa543ccfe72f::markupascenderstruct(b, 0);
    }
    foreach (a in level.ascendsolostarts) {
        foreach (b in level.descendsolostarts) {
            var_7a117370745e5467 = distance2dsquared(a.origin, b.origin) < 10;
            if (istrue(level.var_fab1cbf39a6a0e7d)) {
                var_7a117370745e5467 = 1;
            }
            if (!isdefined(b.sololink) && var_7a117370745e5467) {
                a.sololink = b;
                b.sololink = a;
                break;
            }
        }
        foreach (c in level.var_bb91debcfc5a4bc2) {
            if (distance2dsquared(a.origin, c.origin) < 10) {
                a.var_cae998a0647bd745 = c;
                a.sololink.var_cae998a0647bd745 = c;
                break;
            }
        }
        /#
            assertex(isdefined(a.sololink), "+++++++++++++++++++++++++++++ Ascender did not link! Solo ascenders must be position vertically to link.  " + a.origin);
        #/
    }
    initanimtree();
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("ascender_solo", &ascendersoloscriptableused);
}

// Namespace namespace_7789eb64bade5954/namespace_dbfefbfabc3195f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x953
// Size: 0x495
function initanimtree() {
    level.scr_animtree["player"] = %script_model;
    level.scr_anim["player"]["ascender_ext_up_in"] = script_model%vm_eq_ascender_ext_up_get_on_plr;
    level.scr_eventanim["player"]["ascender_ext_up_in"] = %"ascender_ext_up_in";
    level.scr_anim["player"]["ascender_ext_up_loop"] = script_model%vm_eq_ascender_ext_up_loop_plr;
    level.scr_eventanim["player"]["ascender_ext_up_loop"] = %"ascender_ext_up_loop";
    level.scr_anim["player"]["ascender_ext_up_out"] = script_model%vm_eq_ascender_ext_up_get_off_plr;
    level.scr_eventanim["player"]["ascender_ext_up_out"] = %"ascender_ext_up_out";
    level.scr_anim["player"]["ascender_ext_down_in"] = script_model%vm_eq_ascender_ext_down_get_on_plr;
    level.scr_eventanim["player"]["ascender_ext_down_in"] = %"ascender_ext_down_in";
    level.scr_anim["player"]["ascender_ext_down_loop"] = script_model%vm_eq_ascender_ext_down_loop_plr;
    level.scr_eventanim["player"]["ascender_ext_down_loop"] = %"ascender_ext_down_loop";
    level.scr_anim["player"]["ascender_ext_down_out"] = script_model%vm_eq_ascender_ext_down_get_off_plr;
    level.scr_eventanim["player"]["ascender_ext_down_out"] = %"ascender_ext_down_out";
    level.scr_animtree["device"] = %script_model;
    level.scr_anim["device"]["ascender_ext_up_in"] = script_model%vm_eq_ascender_ext_up_get_on_ascender;
    level.scr_eventanim["device"]["ascender_ext_up_in"] = %"ascender_ext_up_in";
    level.scr_anim["device"]["ascender_ext_up_loop"] = script_model%vm_eq_ascender_ext_up_loop_ascender;
    level.scr_eventanim["device"]["ascender_ext_up_loop"] = %"ascender_ext_up_loop";
    level.scr_anim["device"]["ascender_ext_up_out"] = script_model%vm_eq_ascender_ext_up_get_off_ascender;
    level.scr_eventanim["device"]["ascender_ext_up_out"] = %"ascender_ext_up_out";
    level.scr_anim["device"]["ascender_ext_down_in"] = script_model%vm_eq_ascender_ext_down_get_on_ascender;
    level.scr_eventanim["device"]["ascender_ext_down_in"] = %"ascender_ext_down_in";
    level.scr_anim["device"]["ascender_ext_down_loop"] = script_model%vm_eq_ascender_ext_down_loop_ascender;
    level.scr_eventanim["device"]["ascender_ext_down_loop"] = %"ascender_ext_down_loop";
    level.scr_anim["device"]["ascender_ext_down_out"] = script_model%vm_eq_ascender_ext_down_get_off_ascender;
    level.scr_eventanim["device"]["ascender_ext_down_out"] = %"ascender_ext_down_out";
    level.scr_animtree["device"] = %script_model;
    level.scr_anim["device"]["ascender_ext_up_in_wm"] = script_model%wm_eq_ascender_ext_up_get_on_ascender;
    level.scr_eventanim["device"]["ascender_ext_up_in_wm"] = %"ascender_ext_up_in";
    level.scr_anim["device"]["ascender_ext_up_loop_wm"] = script_model%wm_eq_ascender_ext_up_loop_ascender;
    level.scr_eventanim["device"]["ascender_ext_up_loop_wm"] = %"ascender_ext_up_loop";
    level.scr_anim["device"]["ascender_ext_up_out_wm"] = script_model%wm_eq_ascender_ext_up_get_off_ascender;
    level.scr_eventanim["device"]["ascender_ext_up_out_wm"] = %"ascender_ext_up_out";
    level.scr_anim["device"]["ascender_ext_down_in_wm"] = script_model%wm_eq_ascender_ext_down_get_on_ascender;
    level.scr_eventanim["device"]["ascender_ext_down_in_wm"] = %"ascender_ext_down_in";
    level.scr_anim["device"]["ascender_ext_down_loop_wm"] = script_model%wm_eq_ascender_ext_down_loop_ascender;
    level.scr_eventanim["device"]["ascender_ext_down_loop_wm"] = %"ascender_ext_down_loop";
    level.scr_anim["device"]["ascender_ext_down_out_wm"] = script_model%wm_eq_ascender_ext_down_get_off_ascender;
    level.scr_eventanim["device"]["ascender_ext_down_out_wm"] = %"ascender_ext_down_out";
}

// Namespace namespace_7789eb64bade5954/namespace_dbfefbfabc3195f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdef
// Size: 0x68
function ascendersoloscriptableused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    /#
        assert(part == "ascender_solo");
    #/
    if (state == "on") {
        if (istrue(player.usingascender)) {
            return;
        }
        thread ascenderuse(instance, player);
    }
}

// Namespace namespace_7789eb64bade5954/namespace_dbfefbfabc3195f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5e
// Size: 0x7b
function endascenderanim(player, dir, ascendermodelview, ascendermodelworld) {
    player endon("death_or_disconnect");
    player endon("ascender_solo_cancel");
    player endon("last_stand_start");
    if (dir) {
        var_45ae85538855919b = "ascender_ext_up_out";
    } else {
        var_45ae85538855919b = "ascender_ext_down_out";
    }
    thread namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, var_45ae85538855919b);
    namespace_bc4a4b9456315863::anim_single_solo(ascendermodelworld, var_45ae85538855919b + "_wm");
}

// Namespace namespace_7789eb64bade5954/namespace_dbfefbfabc3195f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee0
// Size: 0x3e
function spinafterdelay(goalangles) {
    self endon("death_or_disconnect");
    self endon("ascender_solo_cancel");
    self endon("last_stand_start");
    wait(1.75);
    self rotateto(goalangles, 1, 0.1, 0.1);
}

// Namespace namespace_7789eb64bade5954/namespace_dbfefbfabc3195f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf25
// Size: 0x356
function startascenderanim(player, dir, ascendermodelview, ascendermodelworld, var_8ea61c746773c4ae) {
    player endon("death_or_disconnect");
    player endon("ascender_solo_cancel");
    player endon("last_stand_start");
    player thread namespace_7624a117b05021c5::infil_player_rig_updated("player", player.origin, player.angles);
    ascendermodelview.animname = "device";
    ascendermodelview namespace_bc4a4b9456315863::setanimtree();
    ascendermodelworld.animname = "device";
    ascendermodelworld namespace_bc4a4b9456315863::setanimtree();
    var_a08d86a9e7aafc47 = (1, 0, 0);
    if (dir) {
        var_9150bc085d41f530 = "TAG_ACCESSORY_RIGHT";
        var_298ee9614ae698ae = "ascender_ext_up_in";
        var_a08d86a9e7aafc47 = rotatevector((-40.9464, 0, 0), self.angles);
    } else {
        var_9150bc085d41f530 = "TAG_ACCESSORY_LEFT";
        var_298ee9614ae698ae = "ascender_ext_down_in";
        var_a08d86a9e7aafc47 = rotatevector((-42.2388, 0, 0), self.angles);
    }
    player.player_rig moveto(self.origin + var_a08d86a9e7aafc47, 0.4, 0.1, 0.1);
    fwd = vectornormalize(var_a08d86a9e7aafc47 * -1);
    goalangles = namespace_c851aa543ccfe72f::vectortoanglessafe(fwd, (0, 0, 1));
    player.player_rig rotateto(goalangles, 0.4, 0.1, 0.1);
    if (var_8ea61c746773c4ae > 0) {
        thread spinafterdelay(self.angles + (0, var_8ea61c746773c4ae * -1, 0));
    }
    var_cd9982adb17761a8 = gettime();
    player namespace_df5cfdbe6e2d3812::function_fc6a5b145563be33();
    var_698cc218e4ade75f = gettime();
    var_218f64cb035d54be = 0.4 - (var_698cc218e4ade75f - var_cd9982adb17761a8) / 1000;
    waittime = max(0, var_218f64cb035d54be);
    wait(waittime);
    ascendermodelworld show();
    ascendermodelworld hidefromplayer(player);
    ascendermodelview show();
    ascendermodelview showonlytoplayer(player);
    player.player_rig linkto(self, "tag_origin", (0, 0, 0), (0, 0, 0));
    ascendermodelview linkto(player.player_rig, var_9150bc085d41f530, (0, 0, 0), (0, 0, 0));
    ascendermodelworld linkto(self, "tag_origin", (0, 0, 0), (0, 0, 0));
    isthirdperson = player GetCameraThirdPerson();
    if (!isthirdperson) {
        player.player_rig showonlytoplayer(player);
    }
    namespace_bc4a4b9456315863::anim_first_frame_solo(player.player_rig, var_298ee9614ae698ae);
    thread namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, var_298ee9614ae698ae);
    thread namespace_bc4a4b9456315863::anim_single_solo(ascendermodelworld, var_298ee9614ae698ae + "_wm");
    var_5018a9a0d40ed758 = getanimlength(level.scr_anim["player"][var_298ee9614ae698ae]);
    wait(var_5018a9a0d40ed758);
}

// Namespace namespace_7789eb64bade5954/namespace_dbfefbfabc3195f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1282
// Size: 0xc5
function loopwaitanim(scenenode, ascendermodelview, ascendermodelworld, dir) {
    self endon("death_or_disconnect");
    self endon("ascender_solo_loop_done");
    self endon("ascender_solo_cancel");
    self endon("last_stand_start");
    if (dir) {
        var_b164ebced1cbe96c = "ascender_ext_up_loop";
    } else {
        var_b164ebced1cbe96c = "ascender_ext_down_loop";
    }
    animlength = getanimlength(level.scr_anim["player"][var_b164ebced1cbe96c]);
    while (1) {
        if (!isdefined(self)) {
            break;
        }
        scenenode thread namespace_4e680905778c0f0f::anim_player_solo(self, self.player_rig, var_b164ebced1cbe96c);
        scenenode namespace_bc4a4b9456315863::anim_single_solo(ascendermodelworld, var_b164ebced1cbe96c + "_wm");
        if (!isdefined(animlength) || animlength == 0) {
            break;
        }
        wait(animlength);
    }
}

// Namespace namespace_7789eb64bade5954/namespace_dbfefbfabc3195f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x134e
// Size: 0x55d
function ascenderuse(instance, player) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("ascender_solo_cancel");
    if (!namespace_c851aa543ccfe72f::function_3070aab95202a0e6(instance, player)) {
        return;
    }
    var_da39c6d2e190d5c9 = level.ascendstructs[instance.target];
    if (isdefined(var_da39c6d2e190d5c9.var_cae998a0647bd745)) {
        var_da39c6d2e190d5c9.var_cae998a0647bd745 hide();
    }
    player.shouldskiplaststand = 1;
    var_da39c6d2e190d5c9.ascender = spawn("script_model", var_da39c6d2e190d5c9.origin);
    var_da39c6d2e190d5c9.ascender setmodel("tag_origin");
    var_da39c6d2e190d5c9.scriptable = instance;
    if (player getstance() != "stand") {
        player setstance("stand");
    }
    player val::set("ascender", "melee", 0);
    player val::set("ascender", "ads", 0);
    player val::set("ascender", "fire", 0);
    if (istrue(player.isjuggernaut)) {
        if (issharedfuncdefined("juggernaut", "canUseWeaponPickups")) {
            canUseWeaponPickups = player [[ getsharedfunc("juggernaut", "canUseWeaponPickups") ]]();
            if (istrue(canUseWeaponPickups)) {
                player val::set("ascender", "weapon_switch", 0);
            }
        }
    } else {
        player val::set("ascender", "offhand_weapons", 0);
        player val::set("ascender", "killstreaks", 0);
        player val::set("ascender", "weapon_switch", 0);
    }
    var_da39c6d2e190d5c9.ascender namespace_2a9588dfac284b77::registerspawncount(2);
    var_da39c6d2e190d5c9.inuse = 1;
    player.usingascender = 1;
    player val::set("ascender", "usability", 0);
    var_1c86fed9265b1179 = anglestoforward(var_da39c6d2e190d5c9.angles);
    var_e227374d9d756c2d = anglestoforward(player.angles);
    dot = vectordot(var_e227374d9d756c2d, var_1c86fed9265b1179);
    var_8ea61c746773c4ae = 0;
    if (dot < 0.5) {
        cross = vectorcross(var_e227374d9d756c2d, var_1c86fed9265b1179);
        if (cross[2] < 0) {
            var_8ea61c746773c4ae = 120;
        } else {
            var_8ea61c746773c4ae = 240;
        }
    }
    angleoffset = (0, var_8ea61c746773c4ae, 0);
    var_b1f6e33c254d1d38 = var_da39c6d2e190d5c9.ascendstructend;
    var_21315f3bbb4a8a3d = var_da39c6d2e190d5c9.ascendstructout;
    var_da39c6d2e190d5c9.ascender dontinterpolate();
    var_da39c6d2e190d5c9.ascender.origin = var_da39c6d2e190d5c9.origin;
    var_da39c6d2e190d5c9.ascender.angles = var_da39c6d2e190d5c9.angles + angleoffset;
    ascendermodelview = spawn("script_model", var_da39c6d2e190d5c9.origin);
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        ascendermodelview setmodel("misc_vm_ascender");
    } else {
        ascendermodelview setmodel("misc_wm_ascender");
    }
    ascendermodelview hide();
    ascendermodelworld = spawn("script_model", var_da39c6d2e190d5c9.origin);
    ascendermodelworld setmodel("misc_wm_ascender");
    ascendermodelworld hide();
    player.ascenderstart = var_da39c6d2e190d5c9;
    player.ascendermodelview = ascendermodelview;
    player.ascendermodelworld = ascendermodelworld;
    player thread namespace_c851aa543ccfe72f::ascenddeathlistener(var_da39c6d2e190d5c9);
    var_da39c6d2e190d5c9.ascender startascenderanim(player, var_da39c6d2e190d5c9.dir, ascendermodelview, ascendermodelworld, var_8ea61c746773c4ae);
    player thread loopwaitanim(var_da39c6d2e190d5c9.ascender, ascendermodelview, ascendermodelworld, var_da39c6d2e190d5c9.dir);
    var_6c29ccc8d58c68e3 = distance(var_b1f6e33c254d1d38.origin, var_da39c6d2e190d5c9.origin);
    if (!var_da39c6d2e190d5c9.dir) {
        if (utility::iscp()) {
            var_2451a07aca478bf6 = getdvarfloat(@"hash_23ed39c8f9324ffe", namespace_c851aa543ccfe72f::function_f3c35aacfbe68158());
        } else {
            var_2451a07aca478bf6 = getdvarfloat(@"hash_89e4c06f52246b50", namespace_c851aa543ccfe72f::function_9412c45e2bc1218b());
        }
    } else {
        var_2451a07aca478bf6 = getdvarfloat(@"hash_1726c98446555f2", namespace_c851aa543ccfe72f::function_68fe08d119bbd54f());
    }
    var_6bba8ad63924e722 = var_6c29ccc8d58c68e3 / var_2451a07aca478bf6;
    var_e1085fbf185d9d57 = namespace_c851aa543ccfe72f::function_99e7d00e9d903c57() * var_6bba8ad63924e722;
    var_6aa5b76b245ab989 = namespace_c851aa543ccfe72f::function_ca18084bdcc82ea8() * var_6bba8ad63924e722;
    var_da39c6d2e190d5c9.ascender moveto(var_b1f6e33c254d1d38.origin, var_6bba8ad63924e722, var_e1085fbf185d9d57, var_6aa5b76b245ab989);
    wait(var_6bba8ad63924e722);
    player notify("ascender_solo_loop_done");
    var_da39c6d2e190d5c9.ascender endascenderanim(player, var_da39c6d2e190d5c9.dir, ascendermodelview, ascendermodelworld);
    if (isdefined(var_da39c6d2e190d5c9.var_cae998a0647bd745)) {
        var_da39c6d2e190d5c9.var_cae998a0647bd745 show();
    }
    var_da39c6d2e190d5c9 namespace_c851aa543ccfe72f::cleanupascenduse(player);
    player notify("ascend_solo_complete");
}

// Namespace namespace_7789eb64bade5954/namespace_dbfefbfabc3195f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b2
// Size: 0xd6
function ispointnearsoloascenderline(point) {
    foreach (a in level.ascendsolostarts) {
        if (distance2dsquared(a.origin, point) < namespace_c851aa543ccfe72f::function_211b63898ba23e96()) {
            if (isdefined(a.sololink)) {
                if (abs(point[2] - a.origin[2]) < namespace_c851aa543ccfe72f::function_9bb960f8f80f543f() || abs(point[2] - a.sololink.origin[2]) < namespace_c851aa543ccfe72f::function_9bb960f8f80f543f()) {
                    return 1;
                }
            }
        }
    }
    return 0;
}

