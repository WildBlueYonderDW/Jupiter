// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_77c18cdedec620b3;
#using scripts\common\vehicle.gsc;
#using script_3b64eb40368c1450;
#using script_6bfe39bd5c12f84a;

#namespace animation;

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xada
// Size: 0x80
function anim_first_frame(guys, anime, tag) {
    /#
        assertex(isarray(guys), "guys needs to be an array");
    #/
    array = get_anim_position(tag);
    org = array["origin"];
    angles = array["angles"];
    guys = function_1eba925251530689(guys, anime);
    array_levelthread(guys, &anim_first_frame_on_guy, anime, org, angles);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb61
// Size: 0x63
function anim_generic_first_frame(guy, anime, tag) {
    array = get_anim_position(tag);
    org = array["origin"];
    angles = array["angles"];
    thread anim_first_frame_on_guy(guy, anime, org, angles, "generic");
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbcb
// Size: 0x3d
function anim_generic(guy, anime, tag) {
    guys = [];
    guys[0] = guy;
    anim_single(guys, anime, tag, 0, "generic");
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc0f
// Size: 0x41
function anim_generic_run(guy, anime, tag) {
    guys = [];
    guys[0] = guy;
    anim_single(guys, anime, tag, 0.25, "generic");
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc57
// Size: 0x40
function anim_single_solo_run(guy, anime, tag) {
    self endon("death");
    var_280ee35a5ecce148[0] = guy;
    anim_single(var_280ee35a5ecce148, anime, tag, 0.25);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9e
// Size: 0x37
function anim_first_frame_solo(guy, anime, tag) {
    guys = [];
    guys[0] = guy;
    anim_first_frame(guys, anime, tag);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdc
// Size: 0x1fc
function anim_first_frame_on_guy(guy, anime, org, angles, var_8e3b87acaad3de58) {
    guy.first_frame_time = gettime();
    animname = undefined;
    if (isdefined(var_8e3b87acaad3de58)) {
        animname = var_8e3b87acaad3de58;
    } else {
        animname = guy.animname;
    }
    var_469f8a33356c276f = 0;
    if (function_f1e7ee8ddeece062(anime)) {
        animation = guy function_c099f6fd9c19f5a6(anime, org, angles, animname);
    } else if (isarray(level.scr_anim[animname][anime])) {
        animation = level.scr_anim[animname][anime][0];
        var_469f8a33356c276f = 1;
    } else {
        animation = level.scr_anim[animname][anime];
    }
    /#
        guy assert_existance_of_anim(anime, animname, animation);
    #/
    guy set_start_pos(anime, org, angles, animname, var_469f8a33356c276f, animation);
    if (isai(guy)) {
        /#
            assertex(isdefined(anim.callbacks["AIAnimFirstFrame"]), "You must define anim.callbacks[ AIAnimFirstFrame ] if you are first frame animating an AI");
        #/
        guy [[ anim.callbacks["AIAnimFirstFrame"] ]](animation, animname);
    } else {
        guy stopanimscripted();
        guy setanimknob(animation, 1, 0, 0);
        if (!issp()) {
            if (!isplayer(guy) && !guy isvehicle() && isdefined(level.scr_anim[animname]) && isdefined(level.scr_anim[animname][anime])) {
                if (isarray(level.scr_anim[animname][anime])) {
                    guy builtin [[ level.func["scriptModelPlayAnim"] ]](level.scr_anim[animname][anime][0], undefined, 0, 0, "none");
                } else {
                    guy builtin [[ level.func["scriptModelPlayAnim"] ]](level.scr_anim[animname][anime], undefined, 0, 0, "none");
                }
            }
        }
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xedf
// Size: 0xe6
function set_start_pos(anime, org, angles, var_8e3b87acaad3de58, anim_array, animation) {
    animname = undefined;
    if (isdefined(var_8e3b87acaad3de58)) {
        animname = var_8e3b87acaad3de58;
    } else {
        animname = self.animname;
    }
    if (!isdefined(animation)) {
        if (function_f1e7ee8ddeece062(anime)) {
            animation = function_c099f6fd9c19f5a6(anime, org, angles, animname);
        } else if (isdefined(anim_array) && anim_array) {
            animation = level.scr_anim[animname][anime][0];
        } else {
            animation = level.scr_anim[animname][anime];
        }
    }
    var_b48c995a0a557ff1 = getstartorigin(org, angles, animation);
    newangles = getstartangles(org, angles, animation);
    self [[ anim.callbacks["TeleportEnt"] ]](var_b48c995a0a557ff1, newangles);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcc
// Size: 0x62
function anim_start_pos(var_76ca61ead2153a39, anime, tag) {
    pos = get_anim_position(tag);
    org = pos["origin"];
    angles = pos["angles"];
    array_thread(var_76ca61ead2153a39, &set_start_pos, anime, org, angles);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1035
// Size: 0x34
function anim_start_pos_solo(guy, anime, tag) {
    var_280ee35a5ecce148[0] = guy;
    anim_start_pos(var_280ee35a5ecce148, anime, tag);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1070
// Size: 0xe8
function anim_last_frame_solo(guy, anime, tag) {
    guys = [];
    guys[0] = guy;
    anim_first_frame(guys, anime, tag);
    anim_set_time(guys, anime, 1);
    animation = guy getanim(anime);
    translation = getmovedelta(animation);
    rotation = getangledelta3d(animation);
    var_357ae03f80f39459 = rotatevector(translation, guy.angles);
    origin = guy.origin + var_357ae03f80f39459;
    angles = combineangles(guy.angles, rotation);
    guy [[ anim.callbacks["TeleportEnt"] ]](origin, angles);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115f
// Size: 0x55
function anim_single_solo(guy, anime, tag, var_9e8a16d47a03007a, var_8e3b87acaad3de58) {
    self endon("death");
    var_280ee35a5ecce148[0] = guy;
    if (!isdefined(var_9e8a16d47a03007a)) {
        var_9e8a16d47a03007a = 0;
    }
    anim_single(var_280ee35a5ecce148, anime, tag, var_9e8a16d47a03007a, var_8e3b87acaad3de58);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11bb
// Size: 0x7c2
function anim_single_internal(guys, anime, tag, var_9e8a16d47a03007a, var_8e3b87acaad3de58) {
    entity = self;
    /#
        thread anim_single_failsafe(guys, anime);
    #/
    foreach (guy in guys) {
        if (!isdefined(guy)) {
            continue;
        }
        if (!isdefined(guy._animactive)) {
            guy._animactive = 0;
        }
        guy._animactive++;
    }
    pos = get_anim_position(tag);
    org = pos["origin"];
    angles = pos["angles"];
    var_c89cf41205d8055d = undefined;
    var_2afd32f7cad8af86 = 999999;
    var_7d006c3a8c8ff60a = undefined;
    var_a3d52619ed30853a = undefined;
    var_2a44bd45833fc3ef = undefined;
    var_910e49245fadfc70 = undefined;
    var_314c4455b996b224 = "single anim";
    var_328b6e3cd8ca1af4 = 0;
    if (isdefined(level.var_79c41a27b516111f) && isdefined(level.var_79c41a27b516111f[anime])) {
        var_328b6e3cd8ca1af4 = 1;
    }
    guys = function_1eba925251530689(guys, anime);
    foreach (i, guy in guys) {
        if (!isdefined(guy)) {
            continue;
        }
        dofacialanim = 0;
        var_ae4f6e4d11bb5adb = 0;
        var_9ac73a1996d2dae = 0;
        doanimation = 0;
        var_b6efd5e31167b2f7 = 0;
        dialogue = undefined;
        facialanim = undefined;
        var_6abad61ca454f906 = undefined;
        animname = undefined;
        if (isdefined(var_8e3b87acaad3de58)) {
            animname = var_8e3b87acaad3de58;
        } else {
            animname = guy.animname;
        }
        /#
            guy assert_existance_of_anim(anime, animname);
        #/
        if (!isdefined(animname)) {
            continue;
        }
        if (isdefined(level.scr_sound[animname]) && isdefined(level.scr_sound[animname][anime])) {
            var_9ac73a1996d2dae = 1;
            dialogue = level.scr_sound[animname][anime];
        }
        if (isdefined(level.scr_face[animname]) && isdefined(level.scr_face[animname][anime])) {
            dofacialanim = 1;
            facialanim = level.scr_face[animname][anime];
            var_2a44bd45833fc3ef = facialanim;
            if (var_9ac73a1996d2dae) {
                if (animhasnotetrack(facialanim, "vo_" + dialogue)) {
                    var_9ac73a1996d2dae = 0;
                    dialogue = undefined;
                }
            }
        }
        if (isdefined(level.scr_head[animname]) && isdefined(level.scr_head[animname][anime])) {
            var_ae4f6e4d11bb5adb = 1;
            var_6abad61ca454f906 = level.scr_head[animname][anime];
            var_910e49245fadfc70 = var_6abad61ca454f906;
        }
        if (isdefined(level.scr_anim[animname]) && isdefined(level.scr_anim[animname][anime]) && self [[ anim.callbacks["ShouldDoAnim"] ]]()) {
            doanimation = 1;
        }
        if (isdefined(level.scr_animsound[animname]) && isdefined(level.scr_animsound[animname][anime])) {
            guy playsound(level.scr_animsound[animname][anime]);
        }
        /#
            if (isdefined(level.scr_text[animname]) && isdefined(level.scr_text[animname][anime])) {
                var_b6efd5e31167b2f7 = 1;
            }
        #/
        if (doanimation) {
            var_43e50904d011917e = undefined;
            if (function_6bc36c81fc28a22e()) {
                var_43e50904d011917e = self;
            }
            /#
                /#
                    assertex(isdefined(guy.model) && guy.model != "Xcams shouldn't be used in looping animations.", "stop_loop" + function_a2eaafb222316a2(guy) + "mayhem_end" + animname + "the animation entry for level.scr_anim[ " + anime + "weaponDropQuick");
                #/
            #/
            guy namespace_c5f7e08ad7ea4280::function_d5f76e611c78509a();
            animtime = guy [[ anim.callbacks["DoAnimation"] ]](org, angles, animname, anime, var_314c4455b996b224, undefined, var_43e50904d011917e);
            if (animtime < var_2afd32f7cad8af86) {
                var_2afd32f7cad8af86 = animtime;
                var_c89cf41205d8055d = i;
            }
        }
        if (dofacialanim || var_9ac73a1996d2dae) {
            if (guy [[ anim.callbacks["DoFacialAnim"] ]](dofacialanim, var_9ac73a1996d2dae, doanimation, anime, animname, dialogue, 0)) {
                var_a3d52619ed30853a = i;
            }
            var_7d006c3a8c8ff60a = i;
        }
        if (isai(guy)) {
            /#
                assertex(!(doanimation && guy doinglongdeath()), "AI is doing a long death, you cannot call animscripted on ai in long death");
            #/
        }
        /#
            assertex(doanimation || dofacialanim || var_9ac73a1996d2dae || var_b6efd5e31167b2f7, "Tried to do anim scene " + anime + " on guy with animname " + animname + ", but he didn't have that anim scene.");
        #/
        if (var_ae4f6e4d11bb5adb) {
            guy thread play_addtive_head_anim(guy, var_910e49245fadfc70);
        }
        /#
            if (var_b6efd5e31167b2f7 && !var_9ac73a1996d2dae) {
                guy thread [[ anim.callbacks["generic_human"] ]](level.scr_text[animname][anime]);
            }
        #/
        if (!issp()) {
            if (!isplayer(guy) && !isagent(guy) && !(guy isvehicle() || isdefined(guy.var_be4ead373697180b) || istrue(guy.var_dfecb928163c6c6)) && isdefined(level.scr_anim[animname]) && isdefined(level.scr_anim[animname][anime])) {
                var_b78b21364b175024 = function_4a2dd4b9088bd637(animname, anime);
                if (isdefined(level.var_96c8e55e70edd512)) {
                    var_b78b21364b175024 = [[ level.var_96c8e55e70edd512 ]](animname);
                }
                guy self_func("scriptModelPlayAnim", level.scr_anim[animname][anime], undefined, undefined, undefined, var_b78b21364b175024);
            }
        }
        if (guy function_e42b762e098c8f9e()) {
            guy function_4beb9f7715504995(guy.var_37b96012304143d7, guy.var_f1a075b476ca91f1, "tag_camera");
        }
    }
    if (var_328b6e3cd8ca1af4) {
        [[ anim.callbacks["playXcam"] ]](level.var_79c41a27b516111f[anime], org, angles);
    } else if (isdefined(var_c89cf41205d8055d)) {
        ent = spawnstruct();
        ent thread anim_deathnotify(guys[var_c89cf41205d8055d], anime);
        ent thread anim_animationendnotify(guys[var_c89cf41205d8055d], anime, var_2afd32f7cad8af86, var_9e8a16d47a03007a);
        ent waittill(anime);
    } else if (isdefined(var_a3d52619ed30853a)) {
        ent = spawnstruct();
        ent thread anim_deathnotify(guys[var_a3d52619ed30853a], anime);
        ent thread anim_facialendnotify(guys[var_a3d52619ed30853a], anime, var_2a44bd45833fc3ef);
        ent waittill(anime);
    } else if (isdefined(var_7d006c3a8c8ff60a)) {
        ent = spawnstruct();
        ent thread anim_deathnotify(guys[var_7d006c3a8c8ff60a], anime);
        ent thread anim_dialogueendnotify(guys[var_7d006c3a8c8ff60a], anime);
        ent waittill(anime);
    }
    foreach (guy in guys) {
        if (!isdefined(guy) || !isdefined(guy._animactive)) {
            continue;
        }
        namespace_c5f7e08ad7ea4280::function_b6e23e71bb7ad50f(guy);
        guy._animactive--;
        guy._lastanimtime = gettime();
        /#
            assert(guy._animactive >= 0);
        #/
    }
    self notify(anime);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1984
// Size: 0x5f
function function_4a2dd4b9088bd637(animname, anime) {
    var_b78b21364b175024 = undefined;
    if (isdefined(level.scr_goaltime[animname]) && isdefined(level.scr_goaltime[animname][anime])) {
        if (level.scr_goaltime[animname][anime] == 0) {
            var_b78b21364b175024 = "none";
        }
    }
    return var_b78b21364b175024;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19eb
// Size: 0x40
function anim_single(guys, anime, tag, var_9e8a16d47a03007a, var_8e3b87acaad3de58) {
    if (!isdefined(var_9e8a16d47a03007a)) {
        var_9e8a16d47a03007a = 0;
    }
    anim_single_internal(guys, anime, tag, var_9e8a16d47a03007a, var_8e3b87acaad3de58);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a32
// Size: 0x5f
function anim_loop_solo(guy, anime, ender, tag, var_656e3d548572faf6, var_8e3b87acaad3de58) {
    self endon("death");
    guy endon("death");
    var_280ee35a5ecce148[0] = guy;
    anim_loop(var_280ee35a5ecce148, anime, ender, tag, var_656e3d548572faf6, var_8e3b87acaad3de58);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1a98
// Size: 0x79
function anim_loop_solo_with_nags(guy, anime, ender, tag) {
    self endon("death");
    guy endon("death");
    /#
        assertex(isdefined(level.scr_anim[guy.animname][anime + "_nags"]), "No nag anims registered for anime scene " + anime);
    #/
    var_280ee35a5ecce148[0] = guy;
    anim_loop(var_280ee35a5ecce148, anime, ender, tag);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1b18
// Size: 0x68
function anim_generic_loop(guy, anime, ender, tag) {
    var_ad98e6d70679846d = [];
    var_ad98e6d70679846d["guy"] = guy;
    var_ad98e6d70679846d["entity"] = self;
    var_ad98e6d70679846d["tag"] = tag;
    var_3d308e5cd595225d[0] = var_ad98e6d70679846d;
    anim_loop_packet(var_3d308e5cd595225d, anime, ender, "generic");
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b87
// Size: 0xcb
function anim_loop(guys, anime, ender, tag, var_656e3d548572faf6, var_8e3b87acaad3de58) {
    var_3d308e5cd595225d = [];
    foreach (guy in guys) {
        var_ad98e6d70679846d = [];
        var_ad98e6d70679846d["guy"] = guy;
        var_ad98e6d70679846d["entity"] = self;
        var_ad98e6d70679846d["tag"] = tag;
        var_ad98e6d70679846d["origin_offset"] = var_656e3d548572faf6;
        var_3d308e5cd595225d[var_3d308e5cd595225d.size] = var_ad98e6d70679846d;
    }
    anim_loop_packet(var_3d308e5cd595225d, anime, ender, var_8e3b87acaad3de58);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1c59
// Size: 0x40
function anim_loop_packet_solo(var_6fab270f71d41318, anime, ender, var_8e3b87acaad3de58) {
    var_9a78a1c57e90a3fb = [];
    var_9a78a1c57e90a3fb[0] = var_6fab270f71d41318;
    anim_loop_packet(var_9a78a1c57e90a3fb, anime, ender, var_8e3b87acaad3de58);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca0
// Size: 0x98
function pick_nag_anim(var_5842e592ddcef384) {
    var_e77b7da8d8132c4 = undefined;
    if (var_5842e592ddcef384.nag_anims.size == 1) {
        var_e77b7da8d8132c4 = 0;
    } else if (var_5842e592ddcef384.currentnagindex == var_5842e592ddcef384.nag_anims.size - 1) {
        var_e77b7da8d8132c4 = 0;
    } else {
        var_e77b7da8d8132c4 = var_5842e592ddcef384.currentnagindex + 1;
    }
    /#
        assert(isdefined(var_e77b7da8d8132c4));
    #/
    var_5842e592ddcef384.currentnagindex = var_e77b7da8d8132c4;
    var_5842e592ddcef384.last_nag_time = gettime();
    return var_5842e592ddcef384.currentnagindex;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d40
// Size: 0x8c6
function anim_loop_packet(var_3d308e5cd595225d, anime, ender, var_8e3b87acaad3de58) {
    /#
        assertex(!isdefined(level.var_79c41a27b516111f[anime]), "Xcams shouldn't be used in looping animations.");
    #/
    foreach (var_f2811089f0eb595c in var_3d308e5cd595225d) {
        guy = var_f2811089f0eb595c["guy"];
        if (!isdefined(guy)) {
            continue;
        }
        if (!isdefined(guy._animactive)) {
            guy._animactive = 0;
        }
        guy endon("death");
        guy._animactive++;
    }
    var_bb7e95c4f524e79f = var_3d308e5cd595225d[0]["guy"];
    /#
        if (!isdefined(var_bb7e95c4f524e79f.loops)) {
            var_bb7e95c4f524e79f.loops = 0;
            var_bb7e95c4f524e79f.var_d893523de11db06f = [];
        }
        thread function_aa14daf4aa0fa4a3(var_bb7e95c4f524e79f, anime);
    #/
    if (!isdefined(ender)) {
        ender = "stop_loop";
    }
    thread endonremoveanimactive(ender, var_3d308e5cd595225d);
    self endon(ender);
    /#
        thread function_1d3c30084bbec96a(var_bb7e95c4f524e79f, ender, anime);
    #/
    var_314c4455b996b224 = "looping anim";
    base_anime = anime;
    var_f9909a84715a4ddf = undefined;
    if (isdefined(var_8e3b87acaad3de58)) {
        var_f9909a84715a4ddf = var_8e3b87acaad3de58;
    } else {
        var_f9909a84715a4ddf = var_bb7e95c4f524e79f.animname;
    }
    idleanim = 0;
    var_81d62d85676996da = 0;
    var_ac74514763a944f4 = 0;
    var_6beb6c37769023f8 = isdefined(level.scr_anim[var_f9909a84715a4ddf][anime + "_nags"]);
    if (var_6beb6c37769023f8 && utility::issp()) {
        ai = 0;
        foreach (i, var_f2811089f0eb595c in var_3d308e5cd595225d) {
            if (isai(var_f2811089f0eb595c["guy"])) {
                ai++;
            }
        }
        /#
            assertex(ai == 1, "Loop anims with _nags should only be done with one AI");
        #/
        if (isdefined(level.scr_anim[var_f9909a84715a4ddf][anime + "_nags_timer"])) {
            var_ac74514763a944f4 = level.scr_anim[var_f9909a84715a4ddf][anime + "_nags_timer"];
        } else {
            var_ac74514763a944f4 = 15;
        }
    }
    var_9a2893fb28421d42 = 0;
    var_d851a74f8df27de9 = undefined;
    var_405d3683254d21e8 = 0;
    if (var_6beb6c37769023f8) {
        setdvarifuninitialized(@"hash_e35578a601bcd680", 0);
        var_d851a74f8df27de9 = spawnstruct();
        var_d851a74f8df27de9.last_nag_time = gettime();
        var_d851a74f8df27de9.nag_anims = level.scr_anim[var_f9909a84715a4ddf][anime + "_nags"];
        var_d851a74f8df27de9.currentnagindex = 0;
        childthread nag_timer(var_ac74514763a944f4, var_bb7e95c4f524e79f);
    }
    while (1) {
        if (!var_9a2893fb28421d42 && !isagent(var_bb7e95c4f524e79f)) {
            anime = base_anime;
            idleanim = anim_weight(var_f9909a84715a4ddf, anime);
            while (idleanim == var_81d62d85676996da && idleanim != 0) {
                idleanim = anim_weight(var_f9909a84715a4ddf, anime);
            }
        } else if (!isagent(var_bb7e95c4f524e79f)) {
            idleanim = pick_nag_anim(var_d851a74f8df27de9);
            anime = base_anime + "_nags";
            childthread nag_timer(var_ac74514763a944f4, var_bb7e95c4f524e79f);
            var_9a2893fb28421d42 = 0;
        } else {
            idleanim = anime;
        }
        var_81d62d85676996da = idleanim;
        var_c89cf41205d8055d = undefined;
        var_2afd32f7cad8af86 = 999999;
        var_7d006c3a8c8ff60a = undefined;
        guy = undefined;
        foreach (i, var_f2811089f0eb595c in var_3d308e5cd595225d) {
            entity = var_f2811089f0eb595c["entity"];
            guy = var_f2811089f0eb595c["guy"];
            pos = entity get_anim_position(var_f2811089f0eb595c["tag"]);
            org = pos["origin"];
            angles = pos["angles"];
            if (isdefined(var_f2811089f0eb595c["origin_offset"])) {
                offset = var_f2811089f0eb595c["origin_offset"];
                forward = anglestoforward(angles);
                right = anglestoright(angles);
                up = anglestoup(angles);
                org = org + forward * offset[0];
                org = org + right * offset[1];
                org = org + up * offset[2];
            }
            if (isdefined(guy.remove_from_animloop)) {
                guy.remove_from_animloop = undefined;
                var_3d308e5cd595225d[i] = undefined;
            } else {
                dofacialanim = 0;
                var_9ac73a1996d2dae = 0;
                doanimation = 0;
                var_b6efd5e31167b2f7 = 0;
                facialanim = undefined;
                dialogue = undefined;
                animname = undefined;
                if (isdefined(var_8e3b87acaad3de58)) {
                    animname = var_8e3b87acaad3de58;
                } else {
                    animname = guy.animname;
                }
                if (isdefined(level.scr_face[animname]) && isdefined(level.scr_face[animname][anime]) && isdefined(level.scr_face[animname][anime][idleanim])) {
                    dofacialanim = 1;
                    facialanim = level.scr_face[animname][anime][idleanim];
                }
                if (isdefined(level.scr_sound[animname]) && isdefined(level.scr_sound[animname][anime]) && isdefined(level.scr_sound[animname][anime][idleanim])) {
                    var_9ac73a1996d2dae = 1;
                    dialogue = level.scr_sound[animname][anime][idleanim];
                }
                if (isdefined(level.scr_animsound[animname]) && isdefined(level.scr_animsound[animname][idleanim + anime])) {
                    guy playsound(level.scr_animsound[animname][idleanim + anime]);
                }
                if (isdefined(level.scr_anim[animname]) && isdefined(level.scr_anim[animname][anime]) && self [[ anim.callbacks["ShouldDoAnim"] ]]()) {
                    doanimation = 1;
                } else if (isagent(guy) && self [[ anim.callbacks["ShouldDoAnim"] ]]()) {
                    doanimation = 1;
                }
                /#
                    if (isdefined(level.scr_text[animname]) && isdefined(level.scr_text[animname][anime])) {
                        var_b6efd5e31167b2f7 = 1;
                    }
                    if (!dofacialanim && !var_9ac73a1996d2dae && !doanimation && !var_b6efd5e31167b2f7) {
                        /#
                            assertmsg("<unknown string>" + guy getentitynumber() + "<unknown string>" + anime + "<unknown string>");
                        #/
                        var_405d3683254d21e8 = 1;
                        goto LOC_00000842;
                    }
                #/
                if (doanimation) {
                    guy namespace_c5f7e08ad7ea4280::function_d5f76e611c78509a();
                    animtime = guy [[ anim.callbacks["DoAnimation"] ]](org, angles, animname, anime, var_314c4455b996b224, idleanim, undefined);
                    if (animtime < var_2afd32f7cad8af86) {
                        var_2afd32f7cad8af86 = animtime;
                        var_c89cf41205d8055d = i;
                    }
                }
                if (!issp()) {
                    if (!isplayer(guy) && !isagent(guy) && !guy isvehicle() && !isdefined(guy.vehiclename) && isdefined(level.scr_anim[animname]) && isdefined(level.scr_anim[animname][anime]) && isdefined(level.scr_anim[animname][anime][idleanim])) {
                        guy self_func("scriptModelPlayAnim", level.scr_anim[animname][anime][idleanim], undefined, undefined, undefined, function_4a2dd4b9088bd637(animname, anime));
                    }
                }
                if (dofacialanim || var_9ac73a1996d2dae) {
                    guy [[ anim.callbacks["DoFacialAnim"] ]](dofacialanim, var_9ac73a1996d2dae, doanimation, anime, animname, dialogue, 1);
                    var_7d006c3a8c8ff60a = i;
                }
                /#
                    if (var_b6efd5e31167b2f7 && !var_9ac73a1996d2dae) {
                        guy thread [[ anim.callbacks["generic_human"] ]](level.scr_text[animname][anime]);
                    }
                #/
            }
        }
        if (!isdefined(guy)) {
            break;
        }
        if (isdefined(var_c89cf41205d8055d)) {
            var_d06de988641fd606 = waittill_animend(var_3d308e5cd595225d[var_c89cf41205d8055d]["guy"], var_314c4455b996b224, var_6beb6c37769023f8);
            if (!isdefined(var_d06de988641fd606) && var_6beb6c37769023f8) {
                var_9a2893fb28421d42 = 1;
                if (isdefined(anim.callbacks["StopAnimscripted"])) {
                    guy [[ anim.callbacks["StopAnimscripted"] ]]();
                }
            }
        } else if (isdefined(var_7d006c3a8c8ff60a)) {
            var_3d308e5cd595225d[var_7d006c3a8c8ff60a]["guy"] waittill(var_314c4455b996b224);
        }
        if (var_405d3683254d21e8) {
            break;
        }
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x260d
// Size: 0x35
function waittill_animend(guy, var_65dc1767352c19cd, var_6beb6c37769023f8) {
    if (istrue(var_6beb6c37769023f8)) {
        self endon("do_nag");
    }
    guy waittillmatch(var_65dc1767352c19cd, "end");
    return 1;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x264a
// Size: 0xa8
function nag_timer(timer, guy) {
    self endon("death");
    temp = timer;
    currenttime = gettime();
    while (currenttime + timer * 1000 > gettime()) {
        /#
            if (getdvarint(@"hash_e35578a601bcd680")) {
                print3d(guy.origin + (0, 0, 70), temp + "<unknown string>", (1, 1, 0.5), 1, 0.6, 20);
                temp--;
            }
        #/
        wait(1);
    }
    self notify("do_nag");
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x26f9
// Size: 0x3b
function anim_set_time_solo(guy, anime, time) {
    self endon("death");
    var_280ee35a5ecce148[0] = guy;
    anim_set_time(var_280ee35a5ecce148, anime, time);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x273b
// Size: 0x2b
function anim_set_time(guys, anime, time) {
    array_thread(guys, &anim_self_set_time, anime, time);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x276d
// Size: 0x3d
function anim_self_set_time(anime, time) {
    animation = getanim(anime);
    if (isarray(animation)) {
        animation = animation[0];
    }
    self setanimtime(animation, time);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27b1
// Size: 0x54
function last_anim_time_check() {
    if (!isdefined(self.last_anim_time)) {
        self.last_anim_time = gettime();
        return;
    }
    time = gettime();
    if (self.last_anim_time == time) {
        self endon("death");
        wait(0.05);
    }
    self.last_anim_time = time;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x280c
// Size: 0x13d
function anim_moveto(guys, anime, tag, time, var_5fcd68807ada6113, var_efe93c754f5124e6) {
    pos = get_anim_position(tag);
    org = pos["origin"];
    angles = pos["angles"];
    foreach (guy in guys) {
        startorg = getstartorigin(org, angles, level.scr_anim[guy.animname][anime]);
        startang = getstartangles(org, angles, level.scr_anim[guy.animname][anime]);
        if (isai(guy)) {
            /#
                assertmsg("ai not supported by anim_moveto");
            #/
        } else {
            guy moveto(startorg, time, var_5fcd68807ada6113, var_efe93c754f5124e6);
            guy rotateto(startang, time, var_5fcd68807ada6113, var_efe93c754f5124e6);
        }
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2950
// Size: 0x3b
function anim_teleport_solo(guy, anime, tag) {
    self endon("death");
    var_280ee35a5ecce148[0] = guy;
    anim_teleport(var_280ee35a5ecce148, anime, tag);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2992
// Size: 0x104
function anim_teleport(guys, anime, tag) {
    pos = get_anim_position(tag);
    org = pos["origin"];
    angles = pos["angles"];
    foreach (guy in guys) {
        startorg = getstartorigin(org, angles, level.scr_anim[guy.animname][anime]);
        startang = getstartangles(org, angles, level.scr_anim[guy.animname][anime]);
        guy [[ anim.callbacks["TeleportEnt"] ]](startorg, startang);
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2a9d
// Size: 0xb0
function anim_generic_teleport(guy, anime, tag) {
    pos = get_anim_position(tag);
    org = pos["origin"];
    angles = pos["angles"];
    startorg = getstartorigin(org, angles, level.scr_anim["generic"][anime]);
    startang = getstartangles(org, angles, level.scr_anim["generic"][anime]);
    guy [[ anim.callbacks["TeleportEnt"] ]](startorg, startang);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2b54
// Size: 0x2a
function anim_spawn_generic_model(model, anime, tag) {
    return anim_spawn_model(model, "generic", anime, tag);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b86
// Size: 0xca
function anim_spawn_model(model, animname, anime, tag) {
    pos = get_anim_position(tag);
    org = pos["origin"];
    angles = pos["angles"];
    startorg = getstartorigin(org, angles, level.scr_anim[animname][anime]);
    startangles = getstartorigin(org, angles, level.scr_anim[animname][anime]);
    spawned = spawn("script_model", startorg);
    spawned setmodel(model);
    spawned.angles = startangles;
    return spawned;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c58
// Size: 0x1d
function anim_spawn_tag_model(model, tag) {
    self attach(model, tag);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c7c
// Size: 0x68
function anim_link_tag_model(model, tag) {
    org = self gettagorigin(tag);
    spawned = spawn("script_model", org);
    spawned setmodel(model);
    spawned linkto(self, tag, (0, 0, 0), (0, 0, 0));
    return spawned;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2cec
// Size: 0xec
function removenotetrack(animname, notetrack, anime, notetype, ent) {
    notetrack = tolower(notetrack);
    array = level.scr_notetrack[animname][anime][notetrack];
    anime = get_generic_anime(anime);
    index = -1;
    if (!isdefined(array) || !isarray(array) || array.size < 1) {
        return;
    }
    for (i = 0; i < array.size; i++) {
        if (isdefined(array[i][notetype])) {
            if (!isdefined(ent) || array[i][notetype] == ent) {
                index = i;
                break;
            }
        }
    }
    if (index < 0) {
        return;
    }
    if (array.size == 1) {
        array = [];
    } else {
        array = array_remove_index(array, index);
    }
    level.scr_notetrack[animname][anime][notetrack] = array;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2ddf
// Size: 0xa0
function addnotetrack_flag(animname, notetrack, var_3f594777b26bb842, anime) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["flag"] = var_3f594777b26bb842;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
    if (utility::issp()) {
        if (!isdefined(level.flag) || !isdefined(level.flag[var_3f594777b26bb842])) {
            flag_init(var_3f594777b26bb842);
        }
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2e86
// Size: 0x97
function addnotetrack_flag_clear(animname, notetrack, var_3f594777b26bb842, anime) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["flag_clear"] = var_3f594777b26bb842;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
    if (!isdefined(level.flag) || !isdefined(level.flag[var_3f594777b26bb842])) {
        flag_init(var_3f594777b26bb842);
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2f24
// Size: 0x75
function addnotetrack_dialogue(animname, notetrack, anime, soundalias) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    level.scr_notetrack[animname][anime][notetrack][index] = [];
    level.scr_notetrack[animname][anime][notetrack][index]["dialog"] = soundalias;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fa0
// Size: 0x3e
function add_notetrack_and_get_index(animname, notetrack, anime) {
    notetrack = tolower(notetrack);
    add_notetrack_array(animname, notetrack, anime);
    return level.scr_notetrack[animname][anime][notetrack].size;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fe6
// Size: 0x9b
function add_notetrack_array(animname, notetrack, anime) {
    notetrack = tolower(notetrack);
    if (!isdefined(level.scr_notetrack)) {
        level.scr_notetrack = [];
    }
    if (!isdefined(level.scr_notetrack[animname])) {
        level.scr_notetrack[animname] = [];
    }
    if (!isdefined(level.scr_notetrack[animname][anime])) {
        level.scr_notetrack[animname][anime] = [];
    }
    if (!isdefined(level.scr_notetrack[animname][anime][notetrack])) {
        level.scr_notetrack[animname][anime][notetrack] = [];
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3088
// Size: 0xc7
function addnotetrack_sound(animname, notetrack, anime, soundalias, sound_stays_death, tag) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    level.scr_notetrack[animname][anime][notetrack][index] = [];
    level.scr_notetrack[animname][anime][notetrack][index]["sound"] = soundalias;
    if (isdefined(sound_stays_death)) {
        level.scr_notetrack[animname][anime][notetrack][index]["sound_stays_death"] = 1;
    }
    if (isdefined(tag)) {
        level.scr_notetrack[animname][anime][notetrack][index]["sound_on_tag"] = tag;
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3156
// Size: 0x56
function note_track_start_sound(notetrack, soundalias, sound_stays_death, tag) {
    var_84b542bb7490bea7 = get_datascene();
    addnotetrack_sound(var_84b542bb7490bea7.animname, notetrack, var_84b542bb7490bea7.anim_sequence, soundalias, sound_stays_death, tag);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x31b3
// Size: 0x75
function addnotetrack_playersound(animname, notetrack, anime, soundalias) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    level.scr_notetrack[animname][anime][notetrack][index] = [];
    level.scr_notetrack[animname][anime][notetrack][index]["playersound"] = soundalias;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x322f
// Size: 0x18
function get_generic_anime(anime) {
    if (!isdefined(anime)) {
        return "any";
    }
    return anime;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x324f
// Size: 0x47
function addonstart_animsound(animname, anime, soundalias) {
    if (!isdefined(level.scr_animsound[animname])) {
        level.scr_animsound[animname] = [];
    }
    level.scr_animsound[animname][anime] = soundalias;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x329d
// Size: 0x75
function addnotetrack_playerdialogue(animname, notetrack, anime, soundalias) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    level.scr_notetrack[animname][anime][notetrack][index] = [];
    level.scr_notetrack[animname][anime][notetrack][index]["playerdialogue"] = soundalias;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3319
// Size: 0x7b
function addnotetrack_animsound(animname, anime, notetrack, soundalias) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["sound"] = soundalias;
    array["created_by_animSound"] = 1;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x339b
// Size: 0x84
function addnotetrack_attach(animname, notetrack, model, tag, anime) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["attach model"] = model;
    array["selftag"] = tag;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3426
// Size: 0x84
function addnotetrack_detach(animname, notetrack, model, tag, anime) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["detach model"] = model;
    array["selftag"] = tag;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x34b1
// Size: 0x8d
function addnotetrack_detach_gun(animname, notetrack, anime, suspend) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["detach gun"] = 1;
    array["tag"] = "tag_weapon_right";
    if (isdefined(suspend)) {
        array["suspend"] = suspend;
    }
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3545
// Size: 0x86
function addnotetrack_attach_gun(animname, notetrack, anime, var_4c37afcaaee1c603) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    if (isdefined(var_4c37afcaaee1c603)) {
        array["attach gun " + var_4c37afcaaee1c603] = 1;
    } else {
        array["attach gun right"] = 1;
    }
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35d2
// Size: 0x71
function addnotetrack_customfunction(animname, notetrack, function, anime) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["function"] = function;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x364a
// Size: 0xa5
function addnotetrack_startfxontag(animname, notetrack, anime, effect_name, tagname, morethanthreehack) {
    getfx(effect_name);
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["effect"] = effect_name;
    array["selftag"] = tagname;
    if (isdefined(morethanthreehack)) {
        array["moreThanThreeHack"] = morethanthreehack;
    }
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36f6
// Size: 0x8c
function addnotetrack_stopfxontag(animname, notetrack, anime, effect_name, tagname) {
    getfx(effect_name);
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["stop_effect"] = effect_name;
    array["selftag"] = tagname;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3789
// Size: 0x84
function addnotetrack_mayhemstart(animname, notetrack, animation, anime, var_5a75409ef0c9a36a) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["mayhem_start"] = animation;
    array["use_hat_model"] = var_5a75409ef0c9a36a;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3814
// Size: 0x84
function addnotetrack_mayhemend(animname, notetrack, animation, anime, var_5a75409ef0c9a36a) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["mayhem_end"] = animation;
    array["use_hat_model"] = var_5a75409ef0c9a36a;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x389f
// Size: 0x56
function note_track_swap_to_efx(notetrack, var_94c7bb1299ad3a66, tagname) {
    var_84b542bb7490bea7 = get_datascene();
    add_fx(var_94c7bb1299ad3a66, var_94c7bb1299ad3a66);
    addnotetrack_swapparttoefx(var_84b542bb7490bea7.animname, notetrack, var_84b542bb7490bea7.animsequence, var_94c7bb1299ad3a66, tagname);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x38fc
// Size: 0x56
function note_track_stop_efx_on_tag(notetrack, var_94c7bb1299ad3a66, tagname) {
    var_84b542bb7490bea7 = get_datascene();
    add_fx(var_94c7bb1299ad3a66, var_94c7bb1299ad3a66);
    addnotetrack_stopfxontag(var_84b542bb7490bea7.animname, notetrack, var_84b542bb7490bea7.animsequence, var_94c7bb1299ad3a66, tagname);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3959
// Size: 0x8c
function addnotetrack_swapparttoefx(animname, notetrack, anime, effect_name, tagname) {
    getfx(effect_name);
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["swap_part_to_efx"] = effect_name;
    array["selftag"] = tagname;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x39ec
// Size: 0xcc
function note_track_trace_to_efx(notetrack, var_c7c4553caae5c97e, tagname, var_94c7bb1299ad3a66, var_56aef90205769a90, var_420b93892ad918c4) {
    var_84b542bb7490bea7 = get_datascene();
    if (notetrack != "start" && !animhasnotetrack(var_84b542bb7490bea7 getanim(var_84b542bb7490bea7.anim_sequence), notetrack)) {
        /#
            println("<unknown string>" + var_84b542bb7490bea7.anim_sequence + "<unknown string>" + notetrack);
        #/
        return;
    }
    add_fx(var_94c7bb1299ad3a66, var_94c7bb1299ad3a66);
    if (isdefined(var_56aef90205769a90)) {
        add_fx(var_56aef90205769a90, var_56aef90205769a90);
    }
    addnotetrack_tracepartforefx(var_84b542bb7490bea7.animname, notetrack, var_c7c4553caae5c97e, var_84b542bb7490bea7.anim_sequence, tagname, var_94c7bb1299ad3a66, var_56aef90205769a90, var_420b93892ad918c4);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3abf
// Size: 0xa1
function note_track_start_fx_on_tag(notetrack, tagname, var_94c7bb1299ad3a66) {
    var_84b542bb7490bea7 = get_datascene();
    if (notetrack != "start" && !animhasnotetrack(var_84b542bb7490bea7 getanim(var_84b542bb7490bea7.anim_sequence), notetrack)) {
        /#
            println("<unknown string>" + var_84b542bb7490bea7.anim_sequence + "<unknown string>" + notetrack);
        #/
        return;
    }
    add_fx(var_94c7bb1299ad3a66, var_94c7bb1299ad3a66);
    addnotetrack_startfxontag(var_84b542bb7490bea7.animname, notetrack, var_84b542bb7490bea7.anim_sequence, var_94c7bb1299ad3a66, tagname, 1);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b67
// Size: 0x45
function get_datascene() {
    /#
        assertex(isdefined(level.current_anim_data_scene));
    #/
    var_84b542bb7490bea7 = level.current_anim_data_scene;
    /#
        assertex(isdefined(var_84b542bb7490bea7.animtree), "Missing calling scene, Must use create_anim_scene() ");
    #/
    return var_84b542bb7490bea7;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bb4
// Size: 0x106
function addnotetrack_tracepartforefx(animname, notetrack, var_c7c4553caae5c97e, anime, tagname, effect_name, var_6c3cb0b533910c44, var_420b93892ad918c4) {
    getfx(effect_name);
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["trace_part_for_efx"] = effect_name;
    array["trace_part_for_efx_water"] = var_6c3cb0b533910c44;
    array["trace_part_for_efx_cancel"] = var_c7c4553caae5c97e;
    array["trace_part_for_efx_delete_depth"] = var_420b93892ad918c4;
    array["selftag"] = tagname;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
    if (isdefined(var_c7c4553caae5c97e)) {
        array = [];
        array["trace_part_for_efx_canceling"] = var_c7c4553caae5c97e;
        array["selftag"] = tagname;
        index = add_notetrack_and_get_index(animname, var_c7c4553caae5c97e, anime);
        level.scr_notetrack[animname][anime][var_c7c4553caae5c97e][index] = array;
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3cc1
// Size: 0x71
function addnotetrack_notify(animname, notetrack, var_511f299fa4fac739, anime) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["notify"] = var_511f299fa4fac739;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d39
// Size: 0x1d
function setanimtree() {
    self useanimtree(level.scr_animtree[self.animname]);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d5d
// Size: 0x1b8
function initanim() {
    if (!isdefined(level.scr_notetrack)) {
        level.scr_notetrack = [];
    }
    if (!isdefined(level.scr_face)) {
        level.scr_face = [];
    }
    if (!isdefined(level.scr_head)) {
        level.scr_head = [];
    }
    if (!isdefined(level.scr_look)) {
        level.scr_look = [];
    }
    if (!isdefined(level.scr_animsound)) {
        level.scr_animsound = [];
    }
    if (!isdefined(level.scr_sound)) {
        level.scr_sound = [];
    }
    if (!isdefined(level.scr_radio)) {
        level.scr_radio = [];
    }
    if (!isdefined(level.scr_text)) {
        level.scr_text = [];
    }
    if (!isdefined(level.scr_anim)) {
        level.scr_anim[0][0] = 0;
    }
    if (!isdefined(level.var_539e9dc23256f26d)) {
        level.var_539e9dc23256f26d[0][0] = 0;
    }
    if (!isdefined(level.scr_radio)) {
        level.scr_radio = [];
    }
    if (!isdefined(level.scr_plrdialogue)) {
        level.scr_plrdialogue = [];
    }
    if (!isdefined(level.scr_goaltime)) {
        level.scr_goaltime = [];
    }
    if (!isdefined(level._notetrackfx)) {
        level._notetrackfx = [];
    }
    if (!isdefined(level.var_79c41a27b516111f)) {
        level.var_79c41a27b516111f = [];
    }
    thread precache_script_models_thread();
    thread precache_weapon_models_thread();
    create_lock("moreThanThreeHack", 3);
    create_lock("trace_part_for_efx", 12);
    /#
        setdevdvarifuninitialized(@"hash_b46df2b57cc019b", 0);
    #/
    init_animsounds();
    /#
        level thread function_65e9f4b64110bb5c();
    #/
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f1c
// Size: 0xa9
function precache_script_models_thread() {
    waittillframeend();
    if (!isdefined(level.scr_model)) {
        return;
    }
    models = getarraykeys(level.scr_model);
    for (i = 0; i < models.size; i++) {
        if (isarray(level.scr_model[models[i]])) {
            for (modelindex = 0; modelindex < level.scr_model[models[i]].size; modelindex++) {
                precachemodel(level.scr_model[models[i]][modelindex]);
            }
        } else {
            precachemodel(level.scr_model[models[i]]);
        }
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fcc
// Size: 0xd8
function precache_weapon_models_thread() {
    waittillframeend();
    if (!isdefined(level.scr_weapon)) {
        return;
    }
    weapons = getarraykeys(level.scr_weapon);
    for (i = 0; i < weapons.size; i++) {
        /#
            assertex(isarray(level.scr_weapon[weapons[i]]), weapons[i] + ": scr_weapon needs to be defined as an array!");
        #/
        attachments = [];
        if (isdefined(level.scr_weapon[weapons[i]][1])) {
            /#
                assertex(isarray(level.scr_weapon[weapons[i]][1]), "scr_weapon attachments need to be defined as an array!");
            #/
            attachments = level.scr_weapon[weapons[i]][1];
        }
        utility::make_weapon_model(level.scr_weapon[weapons[i]][0], attachments, 1, 1);
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40ab
// Size: 0x7d
function init_animsounds() {
    level.animsounds = [];
    level.animsound_aliases = [];
    animnames = getarraykeys(level.scr_notetrack);
    for (i = 0; i < animnames.size; i++) {
        init_notetracks_for_animname(animnames[i]);
    }
    animnames = getarraykeys(level.scr_animsound);
    for (i = 0; i < animnames.size; i++) {
        init_animsounds_for_animname(animnames[i]);
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x412f
// Size: 0xa1
function init_animsounds_for_animname(animname) {
    var_2c9b1fd08f99d088 = getarraykeys(level.scr_animsound[animname]);
    for (i = 0; i < var_2c9b1fd08f99d088.size; i++) {
        anime = var_2c9b1fd08f99d088[i];
        soundalias = level.scr_animsound[animname][anime];
        level.animsound_aliases[animname][anime]["#" + anime]["soundalias"] = soundalias;
        level.animsound_aliases[animname][anime]["#" + anime]["created_by_animSound"] = 1;
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41d7
// Size: 0x141
function init_notetracks_for_animname(animname) {
    foreach (anime, var_72e7f473bbab5d91 in level.scr_notetrack[animname]) {
        foreach (notetrack, var_39b955b6ea2a96e in var_72e7f473bbab5d91) {
            foreach (scr_notetrack in var_39b955b6ea2a96e) {
                soundalias = scr_notetrack["sound"];
                if (!isdefined(soundalias)) {
                    continue;
                }
                level.animsound_aliases[animname][anime][notetrack]["soundalias"] = soundalias;
                if (isdefined(scr_notetrack["created_by_animSound"])) {
                    level.animsound_aliases[animname][anime][notetrack]["created_by_animSound"] = 1;
                }
            }
        }
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x431f
// Size: 0xb2
function endonremoveanimactive(endonstring, var_3d308e5cd595225d) {
    self waittill(endonstring);
    foreach (var_f2811089f0eb595c in var_3d308e5cd595225d) {
        guy = var_f2811089f0eb595c["guy"];
        if (!isdefined(guy)) {
            continue;
        }
        namespace_c5f7e08ad7ea4280::function_b6e23e71bb7ad50f(guy);
        guy._animactive--;
        guy._lastanimtime = gettime();
        /#
            assert(guy._animactive >= 0);
        #/
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43d8
// Size: 0x42
function anim_deathnotify(guy, anime) {
    self endon(anime);
    guy waittill("death");
    if (isdefined(guy.anim_is_death) && guy.anim_is_death) {
        return;
    }
    self notify(anime);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4421
// Size: 0x36
function anim_facialendnotify(guy, anime, var_2a44bd45833fc3ef) {
    self endon(anime);
    time = getanimlength(var_2a44bd45833fc3ef);
    wait(time);
    self notify(anime);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x445e
// Size: 0x23
function anim_dialogueendnotify(guy, anime) {
    self endon(anime);
    guy waittill("single dialogue");
    self notify(anime);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4488
// Size: 0x70
function anim_animationendnotify(guy, anime, var_2afd32f7cad8af86, var_9e8a16d47a03007a) {
    self endon(anime);
    guy endon("death");
    var_2afd32f7cad8af86 = var_2afd32f7cad8af86 - var_9e8a16d47a03007a;
    if (var_9e8a16d47a03007a > 0 && var_2afd32f7cad8af86 > 0) {
        guy waittill_match_or_timeout("single anim", "end", var_2afd32f7cad8af86);
        guy stopanimscripted();
    } else {
        guy waittillmatch("single anim", "end");
    }
    self notify(anime);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44ff
// Size: 0xb7
function anim_weight(animname, anime) {
    /#
        assertex(isdefined(level.scr_anim[animname][anime]), "There is no animation scene "" + anime + "" for animname " + animname);
    #/
    /#
        assertex(isarray(level.scr_anim[animname][anime]), "the animation entry for level.scr_anim[ " + animname + " ][ " + anime + " ] needs to be an array of looping animations, not a single animation");
    #/
    total_anims = level.scr_anim[animname][anime].size;
    idleanim = randomint(total_anims);
    if (isdefined(level.scr_anim[animname][anime + "weight"])) {
        idleanim = get_weighted_anim(animname, anime, total_anims);
    }
    return idleanim;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45be
// Size: 0x102
function get_weighted_anim(animname, anime, total_anims) {
    idleanim = undefined;
    if (total_anims > 1) {
        weights = 0;
        anim_weight = 0;
        for (i = 0; i < total_anims; i++) {
            if (isdefined(level.scr_anim[animname][anime + "weight"])) {
                if (isdefined(level.scr_anim[animname][anime + "weight"][i])) {
                    weights++;
                    anim_weight = anim_weight + level.scr_anim[animname][anime + "weight"][i];
                }
            }
        }
        if (weights == total_anims) {
            anim_play = randomfloat(anim_weight);
            anim_weight = 0;
            for (i = 0; i < total_anims; i++) {
                anim_weight = anim_weight + level.scr_anim[animname][anime + "weight"][i];
                if (anim_play < anim_weight) {
                    idleanim = i;
                    break;
                }
            }
        }
    }
    return idleanim;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46c8
// Size: 0x69
function play_addtive_head_anim(guy, animation) {
    guy setanimlimited(generic_human%addtive_head_anims, 1, 0.2);
    guy setanimlimited(animation, 1, 0.2);
    wait(getanimlength(animation));
    guy clearanim(generic_human%addtive_head_anims, 0.2);
    guy clearanim(animation, 0.2);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4738
// Size: 0x87
function get_anim_position(tag) {
    org = undefined;
    angles = undefined;
    if (isdefined(tag)) {
        org = self gettagorigin(tag);
        angles = self gettagangles(tag);
    } else {
        org = self.origin;
        angles = self.angles;
        if (!isdefined(angles)) {
            angles = (0, 0, 0);
        }
    }
    array = [];
    array["angles"] = angles;
    array["origin"] = org;
    return array;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47c7
// Size: 0x71
function function_d2e8597ff01310ed(xanim, tag, time, baseorigin, baseangles) {
    result = self function_bbf5cb43caa911b7(xanim, tag, time);
    if (isdefined(result)) {
        result["origin"] = coordtransform(result["origin"], baseorigin, baseangles);
        result["angles"] = combineangles(baseangles, result["angles"]);
    }
    return result;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4840
// Size: 0x33
function anim_at_self(entity, tag) {
    var_ad98e6d70679846d = [];
    var_ad98e6d70679846d["guy"] = self;
    var_ad98e6d70679846d["entity"] = self;
    return var_ad98e6d70679846d;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x487b
// Size: 0x3c
function anim_at_entity(entity, tag) {
    var_ad98e6d70679846d = [];
    var_ad98e6d70679846d["guy"] = self;
    var_ad98e6d70679846d["entity"] = entity;
    var_ad98e6d70679846d["tag"] = tag;
    return var_ad98e6d70679846d;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x48bf
// Size: 0x345
function assert_existance_of_anim(anime, animname, animation) {
    if (!isdefined(self)) {
        return;
    }
    if (isagent(self)) {
        return;
    }
    if (!isdefined(animname)) {
        animname = self.animname;
    }
    if (!isdefined(animname)) {
        /#
            assertmsg("Animating character of type " + self.classname + " has no animname.");
        #/
        return;
    }
    var_869e4eefb559f49d = 0;
    if (isdefined(level.scr_anim[animname])) {
        var_869e4eefb559f49d = 1;
        if (isdefined(level.scr_anim[animname][anime])) {
            return;
        }
    }
    var_a5db3464f3c53649 = 0;
    if (isdefined(level.scr_face[animname])) {
        var_a5db3464f3c53649 = 1;
        if (isdefined(level.scr_face[animname][anime])) {
            return;
        }
    }
    var_130a721269939a47 = 0;
    if (isdefined(level.scr_sound[animname])) {
        var_130a721269939a47 = 1;
        if (isdefined(level.scr_sound[animname][anime])) {
            return;
        }
    }
    if (var_869e4eefb559f49d || var_130a721269939a47 || var_a5db3464f3c53649) {
        if (var_869e4eefb559f49d) {
            array = getarraykeys(level.scr_anim[animname]);
            /#
                println("<unknown string>" + animname + "<unknown string>");
                foreach (member in array) {
                    println(member);
                }
            #/
        }
        if (var_130a721269939a47) {
            array = getarraykeys(level.scr_sound[animname]);
            /#
                println("<unknown string>" + animname + "<unknown string>");
                foreach (member in array) {
                    println(member);
                }
            #/
        }
        if (var_a5db3464f3c53649) {
            array = getarraykeys(level.scr_face[animname]);
            /#
                println("<unknown string>" + animname + "<unknown string>");
                foreach (member in array) {
                    println(member);
                }
            #/
        }
        /#
            /#
                assertmsg("<unknown string>" + function_a2eaafb222316a2(self) + "mayhem_end" + animname + "the animation entry for level.scr_anim[ " + anime + "<unknown string>");
            #/
        #/
        return;
    }
    keys = getarraykeys(level.scr_anim);
    keys = array_combine(keys, getarraykeys(level.scr_sound));
    foreach (key in keys) {
        /#
            println(key);
        #/
    }
    /#
        assertmsg("Animname " + animname + " is not setup to do animations. See above for list of legal animnames.");
    #/
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4c0b
// Size: 0xe5
function function_aa14daf4aa0fa4a3(guy, anime) {
    /#
        if (!isdefined(guy)) {
            return;
        }
        guy endon("<unknown string>");
        waittillframeend();
        guy.loops++;
        if (guy.loops > 0) {
            guy.var_d893523de11db06f[guy.var_d893523de11db06f.size] = anime;
        }
        if (guy.loops > 1) {
            println("<unknown string>" + guy.animname + "<unknown string>" + guy.loops + "<unknown string>");
            for (i = 0; i < guy.var_d893523de11db06f.size; i++) {
                println("<unknown string>" + guy.var_d893523de11db06f[i]);
            }
            /#
                assertmsg("<unknown string>");
            #/
        }
    #/
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4cf7
// Size: 0x54
function function_1d3c30084bbec96a(guy, ender, anime) {
    /#
        guy endon("<unknown string>");
        self waittill(ender);
        guy.var_d893523de11db06f = array_remove(guy.var_d893523de11db06f, anime);
        guy.loops--;
    #/
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d52
// Size: 0x95
function anim_single_failsafeonguy(owner, anime) {
    /#
        if (getdvar(@"hash_27494f1d75fc0809") != "<unknown string>") {
            return;
        }
        owner endon(anime);
        owner endon("<unknown string>");
        self endon("<unknown string>");
        name = self.classname;
        num = self getentitynumber();
        wait(60);
        println("<unknown string>" + name + "<unknown string>" + num);
        waittillframeend();
        /#
            assertex(0, "<unknown string>" + anime + "<unknown string>");
        #/
    #/
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4dee
// Size: 0x64
function anim_single_failsafe(guys, anime) {
    foreach (guy in guys) {
        guy thread anim_single_failsafeonguy(self, anime);
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e59
// Size: 0x4c
function anim_get_goal_time(animname, anime) {
    if (isdefined(level.scr_goaltime[animname]) && isdefined(level.scr_goaltime[animname][anime])) {
        return level.scr_goaltime[animname][anime];
    } else {
        return 0.5;
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4eac
// Size: 0x1c
function function_89b3eabd606fcda3(animation) {
    if (utility::issp()) {
        return 0.5;
    }
    return 0;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ed0
// Size: 0x37
function function_f1e7ee8ddeece062(anime) {
    if (utility::issp() && isdefined(level.var_df7711b84d224bcf) && istrue(level.var_df7711b84d224bcf[anime])) {
        return 1;
    }
    return 0;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f0f
// Size: 0xbe
function function_1eba925251530689(guys, anime) {
    if (function_f1e7ee8ddeece062(anime) && guys.size > 1) {
        foreach (guy in guys) {
            if (!isdefined(guy.animname) || !guy function_9c6a9b923786f602(guy.animname) && !guy function_84a46f10a88351cd(guy.animname)) {
                guys = array_remove(guys, guy);
                guys = array_add(guys, guy);
            }
        }
    }
    return guys;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fd5
// Size: 0x3e
function function_56bd620e57a834af(anime, animname, animation) {
    var_4f51ef0bd97a4707 = anime + "_entrance";
    level.scr_anim[animname][var_4f51ef0bd97a4707] = animation;
    return var_4f51ef0bd97a4707;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x501b
// Size: 0xd9
function function_c099f6fd9c19f5a6(anime, org, angles, animname) {
    /#
        setdvarifuninitialized(@"hash_4140c00f3efa94c6", 0);
    #/
    if (function_9c6a9b923786f602(animname)) {
        return function_96b3d74019cd30a(anime, org, angles, animname);
    } else if (function_84a46f10a88351cd(animname)) {
        return function_1ed6444c29da9045(anime, org, angles, animname);
    }
    if (!isdefined(level.var_ac0205cb091a126e)) {
        level.var_ac0205cb091a126e = 0;
        /#
            if (getdvarint(@"hash_4140c00f3efa94c6", 0)) {
                iprintln("<unknown string>");
            }
        #/
    }
    if (isarray(level.scr_anim[animname][anime])) {
        return level.scr_anim[animname][anime][level.var_ac0205cb091a126e];
    } else {
        return level.scr_anim[animname][anime];
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50fb
// Size: 0x225
function function_96b3d74019cd30a(anime, org, angles, animname) {
    if (isdefined(level.var_ac0205cb091a126e) && istrue(level.var_99364109f9f9b3f4) && level.var_99364109f9f9b3f4 == gettime()) {
        return level.scr_anim[animname][anime][level.var_ac0205cb091a126e];
    }
    var_48c468c35e48fd78 = 0;
    closest_dist = undefined;
    level.var_ac0205cb091a126e = undefined;
    foreach (i, animation in level.scr_anim[animname][anime]) {
        var_b48c995a0a557ff1 = getstartorigin(org, angles, animation);
        /#
            if (getdvarint(@"hash_4140c00f3efa94c6", 0)) {
                line(self.origin, var_b48c995a0a557ff1, (1, 1, 1), 1, 0, 1000);
                print3d(var_b48c995a0a557ff1 + (0, 0, 2), animation, (1, 1, 1), 1, 0.075, 1000, 1);
                print3d(var_b48c995a0a557ff1, "<unknown string>", (1, 1, 1), 1, 0.2, 1000, 1);
            }
        #/
        if (!isdefined(closest_dist)) {
            closest_dist = distancesquared(var_b48c995a0a557ff1, level.player.origin);
        } else {
            dist = distancesquared(level.player.origin, var_b48c995a0a557ff1);
            if (dist < closest_dist) {
                var_48c468c35e48fd78 = i;
                closest_dist = dist;
            }
        }
    }
    animation = level.scr_anim[animname][anime][var_48c468c35e48fd78];
    /#
        if (getdvarint(@"hash_4140c00f3efa94c6", 0)) {
            iprintln("<unknown string>" + animation);
        }
    #/
    level.var_99364109f9f9b3f4 = gettime();
    level.var_ac0205cb091a126e = var_48c468c35e48fd78;
    return animation;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5328
// Size: 0x53
function function_1ed6444c29da9045(anime, org, angles, animname) {
    level.var_ac0205cb091a126e = undefined;
    animation = level.scr_anim[animname][anime][0];
    level.var_ac0205cb091a126e = 0;
    return animation;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5383
// Size: 0x31
function function_84a46f10a88351cd(animname) {
    if (isdefined(level.scr_animtree[animname]) && level.scr_animtree[animname] == %generic_human) {
        return 1;
    }
    return 0;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53bc
// Size: 0x1e
function function_9c6a9b923786f602(animname) {
    return [[ anim.callbacks["CheckPlayerAnimtree"] ]](animname);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53e2
// Size: 0x28
function function_2c88f6e05af61090(animation) {
    if (!animhasnotetrack(animation, "blend_into")) {
        return 0;
    }
    return get_notetrack_time(animation, "blend_into");
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5412
// Size: 0x28
function function_f92de130e8613662(animation) {
    if (!animhasnotetrack(animation, "blend_out")) {
        return undefined;
    }
    return get_notetrack_time(animation, "blend_out");
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5442
// Size: 0x47
function function_70b77e26541e095(animation) {
    speed = 128;
    if (animhasnotetrack(animation, "blend_speed = walk")) {
        speed = 128;
    } else if (animhasnotetrack(animation, "blend_speed = run")) {
        speed = 145;
    }
    return speed * 0.7;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5491
// Size: 0xef
function function_48af09f152896047(animation) {
    stances = [];
    if (animhasnotetrack(animation, "start_stance = stand")) {
        stances = array_add(stances, "stand");
    } else if (animhasnotetrack(animation, "start_stance = crouch")) {
        stances = array_add(stances, "crouch");
    } else if (animhasnotetrack(animation, "start_stance = prone")) {
        stances = array_add(stances, "prone");
    } else {
        stances = array_add(stances, "none");
    }
    if (animhasnotetrack(animation, "end_stance = stand")) {
        stances = array_add(stances, "stand");
    } else if (animhasnotetrack(animation, "end_stance = crouch")) {
        stances = array_add(stances, "crouch");
    } else if (animhasnotetrack(animation, "end_stance = prone")) {
        stances = array_add(stances, "prone");
    } else {
        stances = array_add(stances, "none");
    }
    return stances;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5588
// Size: 0x206
function function_d0fafbacba98a40f(playerpos, var_bcf9684c0529009a, blendspeed, blendintotime, var_ec165a067af34f8f, var_8831fc7320076829, var_e123fee5ae019570) {
    var_ec165a067af34f8f = ter_op(isdefined(var_ec165a067af34f8f), var_ec165a067af34f8f, 1);
    var_8831fc7320076829 = ter_op(isdefined(var_8831fc7320076829), var_8831fc7320076829, 0);
    var_e123fee5ae019570 = ter_op(isdefined(var_e123fee5ae019570), var_e123fee5ae019570, 0);
    /#
        assertex(!(var_ec165a067af34f8f && var_8831fc7320076829), "dropWeaponWithGesture and dropWeaponWithAnim can not both be true.");
    #/
    if (istrue(var_ec165a067af34f8f)) {
        weapondroptime = level.player getgestureanimlength("proto_vm_gesture_gun_drop");
    } else if (istrue(var_8831fc7320076829)) {
        weapondroptime = 0.5;
    } else {
        weapondroptime = 0;
    }
    weapondropquick = 0;
    if (istrue(var_e123fee5ae019570)) {
        weapondropquick = 1;
        weapondroptime = 0;
    } else if (level.player getdemeanorviewmodel() == "relaxed") {
        weapondropquick = 1;
        weapondroptime = 0.2;
    }
    var_60163a10465b892c = distance2d(playerpos, var_bcf9684c0529009a) / blendspeed;
    var_a46cdf78d1cd46dc = blendintotime + weapondroptime;
    /#
        if (getdvarint(@"hash_398da46238160a6", 0)) {
            iprintln("<unknown string>" + var_60163a10465b892c);
        }
    #/
    if (blendintotime > 0) {
        frac = var_60163a10465b892c / var_a46cdf78d1cd46dc;
        if (frac < 1.4 && frac > 0.4) {
            blendtime = var_a46cdf78d1cd46dc;
        } else if (var_60163a10465b892c < blendintotime) {
            blendtime = ter_op(blendintotime < 1, blendintotime + weapondroptime, 1 + weapondroptime);
        } else if (var_60163a10465b892c > 0.5) {
            blendtime = var_60163a10465b892c;
        } else {
            blendtime = 0.5;
        }
    } else {
        blendtime = 0.5;
    }
    if (blendtime > var_a46cdf78d1cd46dc) {
        /#
            if (getdvarint(@"hash_398da46238160a6", 0)) {
                iprintln("<unknown string>");
            }
        #/
        weapondroptime = blendtime - blendintotime;
    }
    level.var_64fee87637de3b30["weaponDropQuick"] = weapondropquick;
    level.var_64fee87637de3b30["weaponDropTime"] = weapondroptime;
    return blendtime;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x5796
// Size: 0x228
function function_309bb9de5db13227(playerpos, var_bcf9684c0529009a, blendspeed, blendintotime, var_ec165a067af34f8f, var_8831fc7320076829, var_e123fee5ae019570) {
    var_ec165a067af34f8f = ter_op(isdefined(var_ec165a067af34f8f), var_ec165a067af34f8f, 1);
    var_8831fc7320076829 = ter_op(isdefined(var_8831fc7320076829), var_8831fc7320076829, 0);
    var_e123fee5ae019570 = ter_op(isdefined(var_e123fee5ae019570), var_e123fee5ae019570, 0);
    if (!var_8831fc7320076829) {
        quickdroptime = 0;
        var_be4234afa13ba43a = 0;
    } else {
        quickdroptime = 0.2;
        if (var_ec165a067af34f8f) {
            var_be4234afa13ba43a = level.player getgestureanimlength("proto_vm_gesture_gun_drop");
        } else {
            var_be4234afa13ba43a = 0.5;
        }
    }
    blendtime = distance2d(playerpos, var_bcf9684c0529009a) / blendspeed;
    /#
        if (getdvarint(@"hash_398da46238160a6", 0)) {
            iprintln("<unknown string>" + blendtime);
        }
    #/
    var_a46cdf78d1cd46dc = blendintotime + var_be4234afa13ba43a;
    if (var_a46cdf78d1cd46dc > 0) {
        frac = blendtime / var_a46cdf78d1cd46dc;
        if (frac < 1.4 && frac > 0.4) {
            blendtime = var_a46cdf78d1cd46dc;
        } else if (blendtime < blendintotime) {
            blendtime = ter_op(blendintotime <= 1, blendintotime, 1);
        }
    }
    if (istrue(var_ec165a067af34f8f) && istrue(var_8831fc7320076829)) {
        blendtime = ter_op(blendtime < var_be4234afa13ba43a, var_be4234afa13ba43a, blendtime);
    } else if (!istrue(var_8831fc7320076829)) {
        blendtime = ter_op(blendtime < 0.5, 0.5, blendtime);
    } else {
        blendtime = ter_op(blendtime < quickdroptime, quickdroptime, blendtime);
    }
    weapondropquick = 0;
    weapondroptime = var_be4234afa13ba43a;
    if (blendtime < var_be4234afa13ba43a || level.player getdemeanorviewmodel() == "relaxed") {
        weapondropquick = 1;
        weapondroptime = quickdroptime;
    } else if (blendtime > var_a46cdf78d1cd46dc) {
        /#
            if (getdvarint(@"hash_398da46238160a6", 0)) {
                iprintln("<unknown string>");
            }
        #/
        weapondroptime = blendtime - blendintotime;
    }
    if (istrue(var_e123fee5ae019570)) {
        weapondropquick = 1;
        weapondroptime = 0;
    }
    level.var_64fee87637de3b30["weaponDropQuick"] = weapondropquick;
    level.var_64fee87637de3b30["weaponDropTime"] = weapondroptime;
    return blendtime;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x59c6
// Size: 0x78
function function_dba8ec1939d3f1a(anime, animname, var_ec165a067af34f8f, var_8831fc7320076829, var_e123fee5ae019570) {
    if (function_f1e7ee8ddeece062(anime)) {
        animation = function_c099f6fd9c19f5a6(anime, self.origin, self.angles, animname);
    } else {
        animation = level.scr_anim[animname][anime];
    }
    function_1d134c1e220fb6d7(animation, var_ec165a067af34f8f, var_8831fc7320076829, var_e123fee5ae019570);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a45
// Size: 0x1b2
function function_1d134c1e220fb6d7(animation, var_ec165a067af34f8f, var_8831fc7320076829, var_e123fee5ae019570) {
    var_c458edac96d58b16 = getstartorigin(self.origin, self.angles, animation);
    level.var_64fee87637de3b30 = [];
    blendintotime = function_2c88f6e05af61090(animation);
    blendouttime = function_f92de130e8613662(animation);
    blendspeed = function_70b77e26541e095(animation);
    blendtime = function_d0fafbacba98a40f(level.player.origin, var_c458edac96d58b16, blendspeed, blendintotime, var_ec165a067af34f8f, var_8831fc7320076829, var_e123fee5ae019570);
    stances = function_48af09f152896047(animation);
    level.var_64fee87637de3b30["blendIntoTime"] = blendintotime;
    level.var_64fee87637de3b30["blendOutTime"] = blendouttime;
    level.var_64fee87637de3b30["blendSpeed"] = blendspeed;
    level.var_64fee87637de3b30["blendTime"] = blendtime;
    level.var_64fee87637de3b30["stances"] = stances;
    /#
        if (getdvarint(@"hash_398da46238160a6", 0)) {
            iprintln("<unknown string>" + blendtime);
            iprintln("<unknown string>" + blendintotime);
            if (isdefined(blendouttime)) {
                iprintln("<unknown string>" + blendouttime);
            }
            iprintln("<unknown string>" + level.var_64fee87637de3b30["<unknown string>"]);
            iprintln("<unknown string>" + level.var_64fee87637de3b30["<unknown string>"][0] + "<unknown string>" + level.var_64fee87637de3b30["<unknown string>"][1]);
        }
    #/
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5bfe
// Size: 0x39
function function_5cffe82f5e70231b(bool) {
    /#
        assertex(isdefined(bool), "Must pass a bool!");
    #/
    if (istrue(bool)) {
        self.var_c7b88c656f64ad0d = 1;
    } else {
        self.var_c7b88c656f64ad0d = undefined;
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c3e
// Size: 0x14
function function_6bc36c81fc28a22e() {
    if (istrue(self.var_c7b88c656f64ad0d)) {
        return 1;
    }
    return 0;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5c5a
// Size: 0x9c
function function_1cb661b457551a3(bool, var_b271bffb6a81ed13, blendtime) {
    /#
        assertex(isdefined(bool), "Must pass a bool!");
    #/
    if (istrue(bool)) {
        /#
            assertex(isdefined(var_b271bffb6a81ed13), "Must pass an ent for velocity!");
        #/
        self.var_a986b9d4a1be703b = 1;
        self.var_f1a075b476ca91f1 = var_b271bffb6a81ed13 getvelocity();
        if (isdefined(blendtime)) {
            self.var_37b96012304143d7 = blendtime;
        } else {
            self.var_37b96012304143d7 = 0.2;
        }
    } else {
        self.var_a986b9d4a1be703b = undefined;
        self.var_f1a075b476ca91f1 = undefined;
        self.var_37b96012304143d7 = undefined;
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cfd
// Size: 0x30
function function_e42b762e098c8f9e() {
    if (istrue(self.var_a986b9d4a1be703b) && isdefined(self.var_f1a075b476ca91f1) && isdefined(self.var_37b96012304143d7)) {
        return 1;
    }
    return 0;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d35
// Size: 0xd2
function function_52351c3338da63f4(var_cd1bd02e8922204, animindex) {
    /#
        /#
            assertex(isdefined(var_cd1bd02e8922204) && isdefined(animindex), "<unknown string>");
        #/
    #/
    animlength = 0;
    if (isdefined(level.var_539e9dc23256f26d) && isdefined(level.var_539e9dc23256f26d[var_cd1bd02e8922204]) && isdefined(level.var_539e9dc23256f26d[var_cd1bd02e8922204][animindex])) {
        animlength = level.var_539e9dc23256f26d[var_cd1bd02e8922204][animindex];
    } else if (isdefined(level.scr_anim) && isdefined(level.scr_anim[var_cd1bd02e8922204]) && isdefined(level.scr_anim[var_cd1bd02e8922204][animindex])) {
        animlength = getanimlength(level.scr_anim[var_cd1bd02e8922204][animindex]);
    } else {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
    }
    return animlength;
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e0f
// Size: 0x165
function function_65e9f4b64110bb5c() {
    /#
        while (1) {
            var_c2f824d12694c5a8 = getdvarint(@"hash_300079a74221ae45", 0);
            if (var_c2f824d12694c5a8 != 0) {
                origin = (0, 0, 0);
                angles = (0, 0, 0);
                align_target = getdvar(@"hash_43022f85e8f590a5");
                align_tag = getdvar(@"hash_9dfd128a6efc97b4");
                aligntarget = getent_or_struct(align_target, "<unknown string>");
                if (isdefined(aligntarget)) {
                    if (isdefined(aligntarget.origin)) {
                        origin = aligntarget.origin;
                    }
                    if (isdefined(aligntarget.angles)) {
                        angles = aligntarget.angles;
                    }
                }
                setdvar(@"hash_aac2e2e60bc546c8", origin[0]);
                setdvar(@"hash_aac2e3e60bc548fb", origin[1]);
                setdvar(@"hash_aac2e4e60bc54b2e", origin[2]);
                setdvar(@"hash_8961ba30d631ddb0", angles[0]);
                setdvar(@"hash_8961bb30d631dfe3", angles[1]);
                setdvar(@"hash_8961bc30d631e216", angles[2]);
                setdvar(@"hash_300079a74221ae45", 0);
            }
            waitframe();
        }
    #/
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f7b
// Size: 0x30
function function_dca1a3a29d2ee467(var_54e516bef4218c8f, var_4bc185af207d5706) {
    thread anim_reach_speed_control(var_54e516bef4218c8f, var_4bc185af207d5706);
    function_9dbe1a78b03782f2(var_54e516bef4218c8f, &reach_with_standard_adjustments_begin, &reach_with_standard_adjustments_end);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x5fb2
// Size: 0x177
function anim_reach_with_funcs(guys, anime, tag, var_8e3b87acaad3de58, start_func, end_func, var_14c67b74b8ddfda3) {
    array = get_anim_position(tag);
    var_bae27d121b581202 = spawnstruct();
    var_bae27d121b581202.origin = array["origin"];
    var_bae27d121b581202.angles = array["angles"];
    var_54e516bef4218c8f = [];
    foreach (guy in guys) {
        if (isdefined(var_8e3b87acaad3de58)) {
            animname = var_8e3b87acaad3de58;
        } else {
            animname = guy.animname;
        }
        animation = undefined;
        if (isdefined(level.scr_anim[animname][anime])) {
            if (isarray(level.scr_anim[animname][anime])) {
                animation = level.scr_anim[animname][anime][0];
            } else {
                animation = level.scr_anim[animname][anime];
            }
        }
        var_54e516bef4218c8f[var_54e516bef4218c8f.size] = [0:guy, 1:animation, 2:var_bae27d121b581202];
    }
    function_9dbe1a78b03782f2(var_54e516bef4218c8f, start_func, end_func, var_14c67b74b8ddfda3);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6130
// Size: 0x337
function function_9dbe1a78b03782f2(var_54e516bef4218c8f, start_func, end_func, var_14c67b74b8ddfda3) {
    ent = spawnstruct();
    var_c5416631ed26148a = 0;
    /#
        var_c5416631ed26148a = getdvar(@"hash_34dab4f8f3a04f4a") == "<unknown string>";
    #/
    threads = 0;
    guys = [];
    foreach (var_64b5ab50f22a4efc in var_54e516bef4218c8f) {
        guy = var_64b5ab50f22a4efc[0];
        animation = var_64b5ab50f22a4efc[1];
        alignment = var_64b5ab50f22a4efc[2];
        var_93e32c180cab35b3 = var_64b5ab50f22a4efc[3];
        startorg = self.origin;
        startangles = self.angles;
        if (isdefined(alignment)) {
            startorg = alignment.origin;
            startangles = alignment.angles;
        }
        if (isdefined(animation)) {
            animorg = getstartorigin(startorg, startangles, animation);
            var_8c94765ca587f86c = getstartangles(startorg, startangles, animation);
            startorg = animorg;
            startangles = var_8c94765ca587f86c;
        }
        if (!isdefined(var_93e32c180cab35b3)) {
            var_93e32c180cab35b3 = var_14c67b74b8ddfda3;
        }
        if (isdefined(var_93e32c180cab35b3)) {
            if (isdefined(guy.scriptedarrivalent)) {
                guy.scriptedarrivalent delete();
                guy.scriptedarrivalent = undefined;
            }
            guy.scriptedarrivalent = spawn("script_origin", startorg);
            guy.scriptedarrivalent.angles = startangles;
            guy.scriptedarrivalent.type = var_93e32c180cab35b3;
            guy.scriptedarrivalent.arrivalstance = "stand";
            guy.forcenextpathfindimmediate = 1;
            if (isplayer(guy) || isactor(guy)) {
                platform = guy getmovingplatformparent();
                if (isdefined(platform)) {
                    guy.scriptedarrivalent linkto(platform);
                }
            }
        }
        threads++;
        guy thread begin_anim_reach(ent, startorg, startangles, start_func, end_func);
    }
    while (threads) {
        ent waittill("reach_notify");
        threads--;
    }
    /#
        if (var_c5416631ed26148a) {
            level notify("<unknown string>" + "<unknown string>");
        }
    #/
    foreach (var_64b5ab50f22a4efc in var_54e516bef4218c8f) {
        guy = var_64b5ab50f22a4efc[0];
        if (!isalive(guy)) {
            continue;
        }
        guy.goalradius = guy.oldgoalradius;
        if (isdefined(guy.scriptedarrivalent)) {
            guy.scriptedarrivalent delete();
            guy.scriptedarrivalent = undefined;
        }
        guy.stopanimdistsq = 0;
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x646e
// Size: 0x44
function private reach_death_notify(ent) {
    waittill_either("death", "goal");
    while (isalive(self) && self.arriving) {
        wait(0.05);
    }
    ent notify("reach_notify");
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x64b9
// Size: 0x11b
function private begin_anim_reach(ent, startorg, startangles, start_func, end_func) {
    self endon("death");
    self endon("new_anim_reach");
    thread reach_death_notify(ent);
    startorg = [[ start_func ]](startorg, startangles);
    points = [];
    if ((!isdefined(self.scriptedarrivalent) || !isdefined(self.scriptedarrivalent.type)) && distance2dsquared(startorg, self.origin) > 2500) {
        forward = anglestoforward(startangles);
        var_b88bb2e631bcc2b3 = startorg - forward * 50;
        if (navisstraightlinereachable(startorg, var_b88bb2e631bcc2b3, self)) {
            points[points.size] = var_b88bb2e631bcc2b3;
        }
    }
    points[points.size] = startorg;
    self setgoalpath(points);
    self.reach_goal_pos = startorg;
    self.goalradius = 0;
    self.stopanimdistsq = squared(120);
    self waittill("goal");
    self notify("anim_reach_complete");
    [[ end_func ]]();
    self notify("new_anim_reach");
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65db
// Size: 0x5f9
function anim_reach_speed_control(var_54e516bef4218c8f, var_4bc185af207d5706, var_ad86b98c8c9def3d) {
    waittillframeend();
    var_4bc185af207d5706 = function_53c4c53197386572(var_4bc185af207d5706, 140);
    var_ad86b98c8c9def3d = function_53c4c53197386572(var_ad86b98c8c9def3d, 4);
    foreach (index, var_64b5ab50f22a4efc in var_54e516bef4218c8f) {
        guy = var_64b5ab50f22a4efc[0];
        var_93e32c180cab35b3 = var_64b5ab50f22a4efc[3];
        var_fdeb26d1db94e98c = isdefined(var_93e32c180cab35b3) && var_93e32c180cab35b3 == "Exposed Moving";
        var_be82b88c46ae8890 = var_fdeb26d1db94e98c;
        /#
            var_be82b88c46ae8890 = var_be82b88c46ae8890 || getdvarint(@"hash_d3e33f1288718b9e");
        #/
        if (var_be82b88c46ae8890) {
            guy childthread anim_reach_speed_control_avg(var_ad86b98c8c9def3d, var_4bc185af207d5706);
        }
        guy aisetdesiredspeed(var_4bc185af207d5706);
    }
    while (1) {
        var_e8a584c1f8d1b0fd = undefined;
        var_5d5cb5aa330e94ce = 0;
        dist = [];
        var_33ae59f14a7c225d = [];
        remove = [];
        foreach (index, var_64b5ab50f22a4efc in var_54e516bef4218c8f) {
            guy = var_64b5ab50f22a4efc[0];
            if (!isalive(guy)) {
                remove[remove.size] = index;
            } else {
                dist[index] = guy pathdisttogoal();
                if (dist[index] == 0) {
                    pos = guy.goalpos;
                    if (isdefined(guy.reach_goal_pos)) {
                        pos = guy.reach_goal_pos;
                    }
                    dist[index] = distance(guy.origin, pos);
                }
                if (dist[index] <= 4) {
                    remove[remove.size] = index;
                } else if (dist[index] > var_5d5cb5aa330e94ce) {
                    var_e8a584c1f8d1b0fd = guy;
                    var_5d5cb5aa330e94ce = dist[index];
                }
            }
        }
        foreach (index in remove) {
            guy = var_54e516bef4218c8f[index][0];
            if (isalive(guy)) {
                guy val::function_c9d0b43701bdba00("anim_reach_speed_control");
                guy enableavoidance(1, 1);
                guy.var_546b551cb7a41e2f = undefined;
                guy notify("anim_reach_speed_control_avg");
            }
            var_54e516bef4218c8f[index] = undefined;
        }
        if (var_54e516bef4218c8f.size == 0) {
            break;
        }
        foreach (index, var_64b5ab50f22a4efc in var_54e516bef4218c8f) {
            guy = var_64b5ab50f22a4efc[0];
            var_93e32c180cab35b3 = var_64b5ab50f22a4efc[3];
            var_fdeb26d1db94e98c = isdefined(var_93e32c180cab35b3) && var_93e32c180cab35b3 == "Exposed Moving";
            if (dist[index] < 96) {
                guy enableavoidance(0, 0);
            }
            var_33ae59f14a7c225d[index] = dist[index] / var_5d5cb5aa330e94ce;
            speedscale = 1;
            if (var_e8a584c1f8d1b0fd != guy) {
                if (var_fdeb26d1db94e98c && dist[index] <= 16) {
                    speedscale = min(1, guy.var_546b551cb7a41e2f.var_e2b417b32dbed0f7 + 0.05);
                } else {
                    speedscale = max(var_33ae59f14a7c225d[index], 0.4);
                }
            }
            desiredspeed = speedscale * var_4bc185af207d5706;
            /#
                if (getdvarint(@"hash_d3e33f1288718b9e")) {
                    if (var_e8a584c1f8d1b0fd == guy) {
                        print3d(guy.origin + (0, 0, 36), "<unknown string>", (0, 1, 0), 1, 0.3, 1, 1);
                    }
                    line(guy.origin, guy.goalpos, (1, 1, 1), 1, 0, 1);
                    print3d(guy.origin, "Xcams shouldn't be used in looping animations." + int(var_4bc185af207d5706), (0, 1, 0), 1, 0.3, 1, 1);
                    print3d(guy.origin + (0, 0, 10), "Xcams shouldn't be used in looping animations." + int(desiredspeed), (1, 1, 1), 1, 0.3, 1, 1);
                    if (isdefined(guy.var_546b551cb7a41e2f)) {
                        print3d(guy.origin + (0, 0, 20), "Xcams shouldn't be used in looping animations." + int(guy.var_546b551cb7a41e2f.var_e2b417b32dbed0f7), (0, 1, 1), 1, 0.3, 1, 1);
                    }
                    print3d(guy.origin + (0, 0, 80), "Xcams shouldn't be used in looping animations." + speedscale, (0, 0, 1), 1, 0.3, 1, 1);
                    print3d(guy.goalpos + (0, 0, 12), "Xcams shouldn't be used in looping animations." + int(dist[index]), (0, 0, 1), 1, 1, 1, 1);
                    sphere(guy.goalpos, 16);
                }
            #/
            switch (guy function_869f129f31d72088()) {
            case #"hash_186d745a92c317d9":
            case #"hash_9128327eb51e0b7b":
                guy val::set("anim_reach_speed_control", "move_speed_scale", speedscale);
                guy val::reset("anim_reach_speed_control", "desired_speed");
                break;
            default:
                guy val::set("anim_reach_speed_control", "desired_speed", desiredspeed);
                guy val::reset("anim_reach_speed_control", "move_speed_scale");
                break;
            }
        }
        waitframe();
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bdb
// Size: 0x139
function anim_reach_speed_control_avg(var_ad86b98c8c9def3d, var_4bc185af207d5706) {
    self endon("death");
    self notify("anim_reach_speed_control_avg");
    self endon("anim_reach_speed_control_avg");
    self.var_546b551cb7a41e2f = spawnstruct();
    var_546b551cb7a41e2f = self.var_546b551cb7a41e2f;
    var_546b551cb7a41e2f.var_e2b417b32dbed0f7 = var_4bc185af207d5706;
    var_546b551cb7a41e2f.var_d479bfc40454bb40 = [];
    var_546b551cb7a41e2f.var_d2341bf5ae1766a9 = 0;
    curr = 0;
    while (1) {
        index = mod(curr, var_ad86b98c8c9def3d);
        curr++;
        if (isdefined(var_546b551cb7a41e2f.var_d479bfc40454bb40[index])) {
            var_546b551cb7a41e2f.var_d2341bf5ae1766a9 = var_546b551cb7a41e2f.var_d2341bf5ae1766a9 - var_546b551cb7a41e2f.var_d479bfc40454bb40[index];
        }
        var_546b551cb7a41e2f.var_d479bfc40454bb40[index] = length(self.velocity);
        var_546b551cb7a41e2f.var_d2341bf5ae1766a9 = var_546b551cb7a41e2f.var_d2341bf5ae1766a9 + var_546b551cb7a41e2f.var_d479bfc40454bb40[index];
        var_546b551cb7a41e2f.var_e2b417b32dbed0f7 = var_546b551cb7a41e2f.var_d2341bf5ae1766a9 / var_546b551cb7a41e2f.var_d479bfc40454bb40.size;
        waitframe();
    }
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6d1b
// Size: 0x46
function private reach_with_standard_adjustments_begin(startorg, startangles) {
    /#
        assertex(isdefined(anim.callbacks["reach_with_standard_adjustments_begin"]), "You must define anim.callbacks[ reach_with_standard_adjustments_begin ] if you are first frame animating an AI");
    #/
    return self [[ anim.callbacks["reach_with_standard_adjustments_begin"] ]](startorg, startangles);
}

// Namespace animation/namespace_bc4a4b9456315863
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6d69
// Size: 0x34
function private reach_with_standard_adjustments_end() {
    /#
        assertex(isdefined(anim.callbacks["reach_with_standard_adjustments_end"]), "You must define anim.callbacks[ reach_with_standard_adjustments_end ] if you are first frame animating an AI");
    #/
    self [[ anim.callbacks["reach_with_standard_adjustments_end"] ]]();
}

