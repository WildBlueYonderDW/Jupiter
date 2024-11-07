#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\debug.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\common\values.gsc;
#using script_6bfe39bd5c12f84a;

#namespace animation;

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xada
// Size: 0x7f
function anim_first_frame(guys, anime, tag) {
    assertex(isarray(guys), "guys needs to be an array");
    array = get_anim_position(tag);
    org = array["origin"];
    angles = array["angles"];
    guys = function_1eba925251530689(guys, anime);
    array_levelthread(guys, &anim_first_frame_on_guy, anime, org, angles);
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb61
// Size: 0x62
function anim_generic_first_frame(guy, anime, tag) {
    array = get_anim_position(tag);
    org = array["origin"];
    angles = array["angles"];
    thread anim_first_frame_on_guy(guy, anime, org, angles, "generic");
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbcb
// Size: 0x3c
function anim_generic(guy, anime, tag) {
    guys = [];
    guys[0] = guy;
    anim_single(guys, anime, tag, 0, "generic");
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc0f
// Size: 0x40
function anim_generic_run(guy, anime, tag) {
    guys = [];
    guys[0] = guy;
    anim_single(guys, anime, tag, 0.25, "generic");
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc57
// Size: 0x3f
function anim_single_solo_run(guy, anime, tag) {
    self endon("death");
    newguy[0] = guy;
    anim_single(newguy, anime, tag, 0.25);
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc9e
// Size: 0x36
function anim_first_frame_solo(guy, anime, tag) {
    guys = [];
    guys[0] = guy;
    anim_first_frame(guys, anime, tag);
}

// Namespace animation / scripts\common\anim
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xcdc
// Size: 0x1fb
function anim_first_frame_on_guy(guy, anime, org, angles, animname_override) {
    guy.first_frame_time = gettime();
    animname = undefined;
    if (isdefined(animname_override)) {
        animname = animname_override;
    } else {
        animname = guy.animname;
    }
    isloop = 0;
    if (function_f1e7ee8ddeece062(anime)) {
        animation = guy function_c099f6fd9c19f5a6(anime, org, angles, animname);
    } else if (isarray(level.scr_anim[animname][anime])) {
        animation = level.scr_anim[animname][anime][0];
        isloop = 1;
    } else {
        animation = level.scr_anim[animname][anime];
    }
    /#
        guy assert_existance_of_anim(anime, animname, animation);
    #/
    guy set_start_pos(anime, org, angles, animname, isloop, animation);
    if (isai(guy)) {
        assertex(isdefined(anim.callbacks["AIAnimFirstFrame"]), "You must define anim.callbacks[ AIAnimFirstFrame ] if you are first frame animating an AI");
        guy [[ anim.callbacks["AIAnimFirstFrame"] ]](animation, animname);
        return;
    }
    guy stopanimscripted();
    guy setanimknob(animation, 1, 0, 0);
    if (!issp()) {
        if (!isplayer(guy) && !guy isvehicle() && isdefined(level.scr_anim[animname]) && isdefined(level.scr_anim[animname][anime])) {
            if (isarray(level.scr_anim[animname][anime])) {
                guy builtin [[ level.func["scriptModelPlayAnim"] ]](level.scr_anim[animname][anime][0], undefined, 0, 0, "none");
                return;
            }
            guy builtin [[ level.func["scriptModelPlayAnim"] ]](level.scr_anim[animname][anime], undefined, 0, 0, "none");
        }
    }
}

// Namespace animation / scripts\common\anim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xedf
// Size: 0xe5
function set_start_pos(anime, org, angles, animname_override, anim_array, animation) {
    animname = undefined;
    if (isdefined(animname_override)) {
        animname = animname_override;
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
    neworg = getstartorigin(org, angles, animation);
    newangles = getstartangles(org, angles, animation);
    self [[ anim.callbacks["TeleportEnt"] ]](neworg, newangles);
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xfcc
// Size: 0x61
function anim_start_pos(var_76ca61ead2153a39, anime, tag) {
    pos = get_anim_position(tag);
    org = pos["origin"];
    angles = pos["angles"];
    array_thread(var_76ca61ead2153a39, &set_start_pos, anime, org, angles);
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1035
// Size: 0x33
function anim_start_pos_solo(guy, anime, tag) {
    newguy[0] = guy;
    anim_start_pos(newguy, anime, tag);
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1070
// Size: 0xe7
function anim_last_frame_solo(guy, anime, tag) {
    guys = [];
    guys[0] = guy;
    anim_first_frame(guys, anime, tag);
    anim_set_time(guys, anime, 1);
    animation = guy getanim(anime);
    translation = getmovedelta(animation);
    rotation = getangledelta3d(animation);
    rotatedtranslation = rotatevector(translation, guy.angles);
    origin = guy.origin + rotatedtranslation;
    angles = combineangles(guy.angles, rotation);
    guy [[ anim.callbacks["TeleportEnt"] ]](origin, angles);
}

// Namespace animation / scripts\common\anim
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x115f
// Size: 0x54
function anim_single_solo(guy, anime, tag, var_9e8a16d47a03007a, animname_override) {
    self endon("death");
    newguy[0] = guy;
    if (!isdefined(var_9e8a16d47a03007a)) {
        var_9e8a16d47a03007a = 0;
    }
    anim_single(newguy, anime, tag, var_9e8a16d47a03007a, animname_override);
}

// Namespace animation / scripts\common\anim
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x11bb
// Size: 0x795
function anim_single_internal(guys, anime, tag, var_9e8a16d47a03007a, animname_override) {
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
    scriptedfaceanim = undefined;
    var_910e49245fadfc70 = undefined;
    anim_string = "single anim";
    hasxcam = 0;
    if (isdefined(level.scr_xcam) && isdefined(level.scr_xcam[anime])) {
        hasxcam = 1;
    }
    guys = function_1eba925251530689(guys, anime);
    foreach (i, guy in guys) {
        if (!isdefined(guy)) {
            continue;
        }
        DoFacialAnim = 0;
        var_ae4f6e4d11bb5adb = 0;
        var_9ac73a1996d2dae = 0;
        DoAnimation = 0;
        dotext = 0;
        dialogue = undefined;
        facialanim = undefined;
        headanim = undefined;
        animname = undefined;
        if (isdefined(animname_override)) {
            animname = animname_override;
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
            DoFacialAnim = 1;
            facialanim = level.scr_face[animname][anime];
            scriptedfaceanim = facialanim;
            if (var_9ac73a1996d2dae) {
                if (animhasnotetrack(facialanim, "vo_" + dialogue)) {
                    var_9ac73a1996d2dae = 0;
                    dialogue = undefined;
                }
            }
        }
        if (isdefined(level.scr_head[animname]) && isdefined(level.scr_head[animname][anime])) {
            var_ae4f6e4d11bb5adb = 1;
            headanim = level.scr_head[animname][anime];
            var_910e49245fadfc70 = headanim;
        }
        if (isdefined(level.scr_anim[animname]) && isdefined(level.scr_anim[animname][anime]) && self [[ anim.callbacks["ShouldDoAnim"] ]]()) {
            DoAnimation = 1;
        }
        if (isdefined(level.scr_animsound[animname]) && isdefined(level.scr_animsound[animname][anime])) {
            guy playsound(level.scr_animsound[animname][anime]);
        }
        /#
            if (isdefined(level.scr_text[animname]) && isdefined(level.scr_text[animname][anime])) {
                dotext = 1;
            }
        #/
        if (DoAnimation) {
            scripted_node_ent = undefined;
            if (function_6bc36c81fc28a22e()) {
                scripted_node_ent = self;
            }
            assertex(isdefined(guy.model) && guy.model != "<dev string:x1c>", "<dev string:x1d>" + function_a2eaafb222316a2(guy) + "<dev string:x3e>" + animname + "<dev string:x4f>" + anime + "<dev string:x69>");
            guy namespace_c5f7e08ad7ea4280::function_d5f76e611c78509a();
            animtime = guy [[ anim.callbacks["DoAnimation"] ]](org, angles, animname, anime, anim_string, undefined, scripted_node_ent);
            if (animtime < var_2afd32f7cad8af86) {
                var_2afd32f7cad8af86 = animtime;
                var_c89cf41205d8055d = i;
            }
        }
        if (DoFacialAnim || var_9ac73a1996d2dae) {
            if (guy [[ anim.callbacks["DoFacialAnim"] ]](DoFacialAnim, var_9ac73a1996d2dae, DoAnimation, anime, animname, dialogue, 0)) {
                var_a3d52619ed30853a = i;
            }
            var_7d006c3a8c8ff60a = i;
        }
        if (isai(guy)) {
            assertex(!(DoAnimation && guy doinglongdeath()), "AI is doing a long death, you cannot call animscripted on ai in long death");
        }
        assertex(DoAnimation || DoFacialAnim || var_9ac73a1996d2dae || dotext, "Tried to do anim scene " + anime + " on guy with animname " + animname + ", but he didn't have that anim scene.");
        if (var_ae4f6e4d11bb5adb) {
            guy thread play_addtive_head_anim(guy, var_910e49245fadfc70);
        }
        /#
            if (dotext && !var_9ac73a1996d2dae) {
                guy thread [[ anim.callbacks["<dev string:x80>"] ]](level.scr_text[animname][anime]);
            }
        #/
        if (!issp()) {
            if (!isplayer(guy) && !isagent(guy) && !guy isvehicle() && isdefined(level.scr_anim[animname]) && isdefined(level.scr_anim[animname][anime])) {
                blendtype = function_4a2dd4b9088bd637(animname, anime);
                if (isdefined(level.var_96c8e55e70edd512)) {
                    blendtype = [[ level.var_96c8e55e70edd512 ]](animname);
                }
                guy self_func("scriptModelPlayAnim", level.scr_anim[animname][anime], undefined, undefined, undefined, blendtype);
            }
        }
        if (guy function_e42b762e098c8f9e()) {
            guy function_4beb9f7715504995(guy.var_37b96012304143d7, guy.var_f1a075b476ca91f1, "tag_camera");
        }
    }
    if (hasxcam) {
        [[ anim.callbacks["playXcam"] ]](level.scr_xcam[anime], org, angles);
    } else if (isdefined(var_c89cf41205d8055d)) {
        ent = spawnstruct();
        ent thread anim_deathnotify(guys[var_c89cf41205d8055d], anime);
        ent thread anim_animationendnotify(guys[var_c89cf41205d8055d], anime, var_2afd32f7cad8af86, var_9e8a16d47a03007a);
        ent waittill(anime);
    } else if (isdefined(var_a3d52619ed30853a)) {
        ent = spawnstruct();
        ent thread anim_deathnotify(guys[var_a3d52619ed30853a], anime);
        ent thread anim_facialendnotify(guys[var_a3d52619ed30853a], anime, scriptedfaceanim);
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
        assert(guy._animactive >= 0);
    }
    self notify(anime);
}

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1958
// Size: 0x5e
function function_4a2dd4b9088bd637(animname, anime) {
    blendtype = undefined;
    if (isdefined(level.scr_goaltime[animname]) && isdefined(level.scr_goaltime[animname][anime])) {
        if (level.scr_goaltime[animname][anime] == 0) {
            blendtype = "none";
        }
    }
    return blendtype;
}

// Namespace animation / scripts\common\anim
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x19bf
// Size: 0x3f
function anim_single(guys, anime, tag, var_9e8a16d47a03007a, animname_override) {
    if (!isdefined(var_9e8a16d47a03007a)) {
        var_9e8a16d47a03007a = 0;
    }
    anim_single_internal(guys, anime, tag, var_9e8a16d47a03007a, animname_override);
}

// Namespace animation / scripts\common\anim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1a06
// Size: 0x5e
function anim_loop_solo(guy, anime, ender, tag, var_656e3d548572faf6, animname_override) {
    self endon("death");
    guy endon("death");
    newguy[0] = guy;
    anim_loop(newguy, anime, ender, tag, var_656e3d548572faf6, animname_override);
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1a6c
// Size: 0x78
function anim_loop_solo_with_nags(guy, anime, ender, tag) {
    self endon("death");
    guy endon("death");
    assertex(isdefined(level.scr_anim[guy.animname][anime + "_nags"]), "No nag anims registered for anime scene " + anime);
    newguy[0] = guy;
    anim_loop(newguy, anime, ender, tag);
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1aec
// Size: 0x67
function anim_generic_loop(guy, anime, ender, tag) {
    packet = [];
    packet["guy"] = guy;
    packet["entity"] = self;
    packet["tag"] = tag;
    var_3d308e5cd595225d[0] = packet;
    anim_loop_packet(var_3d308e5cd595225d, anime, ender, "generic");
}

// Namespace animation / scripts\common\anim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1b5b
// Size: 0xc6
function anim_loop(guys, anime, ender, tag, var_656e3d548572faf6, animname_override) {
    var_3d308e5cd595225d = [];
    foreach (guy in guys) {
        packet = [];
        packet["guy"] = guy;
        packet["entity"] = self;
        packet["tag"] = tag;
        packet["origin_offset"] = var_656e3d548572faf6;
        var_3d308e5cd595225d[var_3d308e5cd595225d.size] = packet;
    }
    anim_loop_packet(var_3d308e5cd595225d, anime, ender, animname_override);
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1c29
// Size: 0x3f
function anim_loop_packet_solo(var_6fab270f71d41318, anime, ender, animname_override) {
    looppacket = [];
    looppacket[0] = var_6fab270f71d41318;
    anim_loop_packet(looppacket, anime, ender, animname_override);
}

// Namespace animation / scripts\common\anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c70
// Size: 0x97
function pick_nag_anim(datastruct) {
    naganim = undefined;
    if (datastruct.nag_anims.size == 1) {
        naganim = 0;
    } else if (datastruct.currentnagindex == datastruct.nag_anims.size - 1) {
        naganim = 0;
    } else {
        naganim = datastruct.currentnagindex + 1;
    }
    assert(isdefined(naganim));
    datastruct.currentnagindex = naganim;
    datastruct.last_nag_time = gettime();
    return datastruct.currentnagindex;
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1d10
// Size: 0x8b9
function anim_loop_packet(var_3d308e5cd595225d, anime, ender, animname_override) {
    assertex(!isdefined(level.scr_xcam[anime]), "Xcams shouldn't be used in looping animations.");
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
    baseguy = var_3d308e5cd595225d[0]["guy"];
    /#
        if (!isdefined(baseguy.loops)) {
            baseguy.loops = 0;
            baseguy.loopanims = [];
        }
        thread printloops(baseguy, anime);
    #/
    if (!isdefined(ender)) {
        ender = "stop_loop";
    }
    thread endonremoveanimactive(ender, var_3d308e5cd595225d);
    self endon(ender);
    /#
        thread function_1d3c30084bbec96a(baseguy, ender, anime);
    #/
    anim_string = "looping anim";
    base_anime = anime;
    var_f9909a84715a4ddf = undefined;
    if (isdefined(animname_override)) {
        var_f9909a84715a4ddf = animname_override;
    } else {
        var_f9909a84715a4ddf = baseguy.animname;
    }
    idleanim = 0;
    lastidleanim = 0;
    naginterval = 0;
    var_6beb6c37769023f8 = isdefined(level.scr_anim[var_f9909a84715a4ddf][anime + "_nags"]);
    if (var_6beb6c37769023f8 && utility::issp()) {
        ai = 0;
        foreach (i, var_f2811089f0eb595c in var_3d308e5cd595225d) {
            if (isai(var_f2811089f0eb595c["guy"])) {
                ai++;
            }
        }
        assertex(ai == 1, "Loop anims with _nags should only be done with one AI");
        if (isdefined(level.scr_anim[var_f9909a84715a4ddf][anime + "_nags_timer"])) {
            naginterval = level.scr_anim[var_f9909a84715a4ddf][anime + "_nags_timer"];
        } else {
            naginterval = 15;
        }
    }
    donag = 0;
    nagdata = undefined;
    var_405d3683254d21e8 = 0;
    if (var_6beb6c37769023f8) {
        setdvarifuninitialized(@"hash_e35578a601bcd680", 0);
        nagdata = spawnstruct();
        nagdata.last_nag_time = gettime();
        nagdata.nag_anims = level.scr_anim[var_f9909a84715a4ddf][anime + "_nags"];
        nagdata.currentnagindex = 0;
        childthread nag_timer(naginterval, baseguy);
    }
    while (true) {
        if (!donag && !isagent(baseguy)) {
            anime = base_anime;
            for (idleanim = anim_weight(var_f9909a84715a4ddf, anime); idleanim == lastidleanim && idleanim != 0; idleanim = anim_weight(var_f9909a84715a4ddf, anime)) {
            }
        } else if (!isagent(baseguy)) {
            idleanim = pick_nag_anim(nagdata);
            anime = base_anime + "_nags";
            childthread nag_timer(naginterval, baseguy);
            donag = 0;
        } else {
            idleanim = anime;
        }
        lastidleanim = idleanim;
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
                org += forward * offset[0];
                org += right * offset[1];
                org += up * offset[2];
            }
            if (isdefined(guy.remove_from_animloop)) {
                guy.remove_from_animloop = undefined;
                var_3d308e5cd595225d[i] = undefined;
                continue;
            }
            DoFacialAnim = 0;
            var_9ac73a1996d2dae = 0;
            DoAnimation = 0;
            dotext = 0;
            facialanim = undefined;
            dialogue = undefined;
            animname = undefined;
            if (isdefined(animname_override)) {
                animname = animname_override;
            } else {
                animname = guy.animname;
            }
            if (isdefined(level.scr_face[animname]) && isdefined(level.scr_face[animname][anime]) && isdefined(level.scr_face[animname][anime][idleanim])) {
                DoFacialAnim = 1;
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
                DoAnimation = 1;
            } else if (isagent(guy) && self [[ anim.callbacks["ShouldDoAnim"] ]]()) {
                DoAnimation = 1;
            }
            /#
                if (isdefined(level.scr_text[animname]) && isdefined(level.scr_text[animname][anime])) {
                    dotext = 1;
                }
                if (!DoFacialAnim && !var_9ac73a1996d2dae && !DoAnimation && !dotext) {
                    assertmsg("<dev string:x8a>" + guy getentitynumber() + "<dev string:x96>" + anime + "<dev string:xb4>");
                    var_405d3683254d21e8 = 1;
                    break;
                }
            #/
            if (DoAnimation) {
                guy namespace_c5f7e08ad7ea4280::function_d5f76e611c78509a();
                animtime = guy [[ anim.callbacks["DoAnimation"] ]](org, angles, animname, anime, anim_string, idleanim, undefined);
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
            if (DoFacialAnim || var_9ac73a1996d2dae) {
                guy [[ anim.callbacks["DoFacialAnim"] ]](DoFacialAnim, var_9ac73a1996d2dae, DoAnimation, anime, animname, dialogue, 1);
                var_7d006c3a8c8ff60a = i;
            }
            /#
                if (dotext && !var_9ac73a1996d2dae) {
                    guy thread [[ anim.callbacks["<dev string:x80>"] ]](level.scr_text[animname][anime]);
                }
            #/
        }
        if (!isdefined(guy)) {
            break;
        }
        if (isdefined(var_c89cf41205d8055d)) {
            finishedanim = waittill_animend(var_3d308e5cd595225d[var_c89cf41205d8055d]["guy"], anim_string, var_6beb6c37769023f8);
            if (!isdefined(finishedanim) && var_6beb6c37769023f8) {
                donag = 1;
                if (isdefined(anim.callbacks["StopAnimscripted"])) {
                    guy [[ anim.callbacks["StopAnimscripted"] ]]();
                }
            }
        } else if (isdefined(var_7d006c3a8c8ff60a)) {
            var_3d308e5cd595225d[var_7d006c3a8c8ff60a]["guy"] waittill(anim_string);
        }
        if (var_405d3683254d21e8) {
            break;
        }
    }
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x25d1
// Size: 0x34
function waittill_animend(guy, animstring, var_6beb6c37769023f8) {
    if (istrue(var_6beb6c37769023f8)) {
        self endon("do_nag");
    }
    guy waittillmatch(animstring, "end");
    return true;
}

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x260e
// Size: 0xa7
function nag_timer(timer, guy) {
    self endon("death");
    temp = timer;
    currenttime = gettime();
    while (currenttime + timer * 1000 > gettime()) {
        /#
            if (getdvarint(@"hash_e35578a601bcd680")) {
                print3d(guy.origin + (0, 0, 70), temp + "<dev string:xc8>", (1, 1, 0.5), 1, 0.6, 20);
                temp--;
            }
        #/
        wait 1;
    }
    self notify("do_nag");
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x26bd
// Size: 0x3a
function anim_set_time_solo(guy, anime, time) {
    self endon("death");
    newguy[0] = guy;
    anim_set_time(newguy, anime, time);
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x26ff
// Size: 0x2a
function anim_set_time(guys, anime, time) {
    array_thread(guys, &anim_self_set_time, anime, time);
}

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2731
// Size: 0x3c
function anim_self_set_time(anime, time) {
    animation = getanim(anime);
    if (isarray(animation)) {
        animation = animation[0];
    }
    self setanimtime(animation, time);
}

// Namespace animation / scripts\common\anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2775
// Size: 0x53
function last_anim_time_check() {
    if (!isdefined(self.last_anim_time)) {
        self.last_anim_time = gettime();
        return;
    }
    time = gettime();
    if (self.last_anim_time == time) {
        self endon("death");
        wait 0.05;
    }
    self.last_anim_time = time;
}

// Namespace animation / scripts\common\anim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x27d0
// Size: 0x138
function anim_moveto(guys, anime, tag, time, acceleration_time, var_efe93c754f5124e6) {
    pos = get_anim_position(tag);
    org = pos["origin"];
    angles = pos["angles"];
    foreach (guy in guys) {
        startorg = getstartorigin(org, angles, level.scr_anim[guy.animname][anime]);
        startang = getstartangles(org, angles, level.scr_anim[guy.animname][anime]);
        if (isai(guy)) {
            assertmsg("ai not supported by anim_moveto");
            continue;
        }
        guy moveto(startorg, time, acceleration_time, var_efe93c754f5124e6);
        guy rotateto(startang, time, acceleration_time, var_efe93c754f5124e6);
    }
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2910
// Size: 0x3a
function anim_teleport_solo(guy, anime, tag) {
    self endon("death");
    newguy[0] = guy;
    anim_teleport(newguy, anime, tag);
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2952
// Size: 0xff
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

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2a59
// Size: 0xaf
function anim_generic_teleport(guy, anime, tag) {
    pos = get_anim_position(tag);
    org = pos["origin"];
    angles = pos["angles"];
    startorg = getstartorigin(org, angles, level.scr_anim["generic"][anime]);
    startang = getstartangles(org, angles, level.scr_anim["generic"][anime]);
    guy [[ anim.callbacks["TeleportEnt"] ]](startorg, startang);
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2b10
// Size: 0x29
function anim_spawn_generic_model(model, anime, tag) {
    return anim_spawn_model(model, "generic", anime, tag);
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2b42
// Size: 0xc9
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

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c14
// Size: 0x1c
function anim_spawn_tag_model(model, tag) {
    self attach(model, tag);
}

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c38
// Size: 0x67
function anim_link_tag_model(model, tag) {
    org = self gettagorigin(tag);
    spawned = spawn("script_model", org);
    spawned setmodel(model);
    spawned linkto(self, tag, (0, 0, 0), (0, 0, 0));
    return spawned;
}

// Namespace animation / scripts\common\anim
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2ca8
// Size: 0xeb
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

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2d9b
// Size: 0x9f
function addnotetrack_flag(animname, notetrack, theflag, anime) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["flag"] = theflag;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
    if (utility::issp()) {
        if (!isdefined(level.flag) || !isdefined(level.flag[theflag])) {
            flag_init(theflag);
        }
    }
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2e42
// Size: 0x96
function addnotetrack_flag_clear(animname, notetrack, theflag, anime) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["flag_clear"] = theflag;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
    if (!isdefined(level.flag) || !isdefined(level.flag[theflag])) {
        flag_init(theflag);
    }
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2ee0
// Size: 0x74
function addnotetrack_dialogue(animname, notetrack, anime, soundalias) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    level.scr_notetrack[animname][anime][notetrack][index] = [];
    level.scr_notetrack[animname][anime][notetrack][index]["dialog"] = soundalias;
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2f5c
// Size: 0x3d
function add_notetrack_and_get_index(animname, notetrack, anime) {
    notetrack = tolower(notetrack);
    add_notetrack_array(animname, notetrack, anime);
    return level.scr_notetrack[animname][anime][notetrack].size;
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2fa2
// Size: 0x9a
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

// Namespace animation / scripts\common\anim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3044
// Size: 0xc6
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

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3112
// Size: 0x55
function note_track_start_sound(notetrack, soundalias, sound_stays_death, tag) {
    scenedata = get_datascene();
    addnotetrack_sound(scenedata.animname, notetrack, scenedata.anim_sequence, soundalias, sound_stays_death, tag);
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x316f
// Size: 0x74
function addnotetrack_playersound(animname, notetrack, anime, soundalias) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    level.scr_notetrack[animname][anime][notetrack][index] = [];
    level.scr_notetrack[animname][anime][notetrack][index]["playersound"] = soundalias;
}

// Namespace animation / scripts\common\anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31eb
// Size: 0x17
function get_generic_anime(anime) {
    if (!isdefined(anime)) {
        return "any";
    }
    return anime;
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x320b
// Size: 0x46
function addonstart_animsound(animname, anime, soundalias) {
    if (!isdefined(level.scr_animsound[animname])) {
        level.scr_animsound[animname] = [];
    }
    level.scr_animsound[animname][anime] = soundalias;
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3259
// Size: 0x74
function addnotetrack_playerdialogue(animname, notetrack, anime, soundalias) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    level.scr_notetrack[animname][anime][notetrack][index] = [];
    level.scr_notetrack[animname][anime][notetrack][index]["playerdialogue"] = soundalias;
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x32d5
// Size: 0x7a
function addnotetrack_animsound(animname, anime, notetrack, soundalias) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["sound"] = soundalias;
    array["created_by_animSound"] = 1;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation / scripts\common\anim
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3357
// Size: 0x83
function addnotetrack_attach(animname, notetrack, model, tag, anime) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["attach model"] = model;
    array["selftag"] = tag;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation / scripts\common\anim
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x33e2
// Size: 0x83
function addnotetrack_detach(animname, notetrack, model, tag, anime) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["detach model"] = model;
    array["selftag"] = tag;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x346d
// Size: 0x8c
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

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3501
// Size: 0x85
function addnotetrack_attach_gun(animname, notetrack, anime, weapplacement) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    if (isdefined(weapplacement)) {
        array["attach gun " + weapplacement] = 1;
    } else {
        array["attach gun right"] = 1;
    }
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x358e
// Size: 0x70
function addnotetrack_customfunction(animname, notetrack, function, anime) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["function"] = function;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation / scripts\common\anim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3606
// Size: 0xa4
function addnotetrack_startfxontag(animname, notetrack, anime, effect_name, tagname, moreThanThreeHack) {
    getfx(effect_name);
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["effect"] = effect_name;
    array["selftag"] = tagname;
    if (isdefined(moreThanThreeHack)) {
        array["moreThanThreeHack"] = moreThanThreeHack;
    }
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation / scripts\common\anim
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x36b2
// Size: 0x8b
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

// Namespace animation / scripts\common\anim
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3745
// Size: 0x83
function addnotetrack_mayhemstart(animname, notetrack, animation, anime, usehatmodel) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["mayhem_start"] = animation;
    array["use_hat_model"] = usehatmodel;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation / scripts\common\anim
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x37d0
// Size: 0x83
function addnotetrack_mayhemend(animname, notetrack, animation, anime, usehatmodel) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["mayhem_end"] = animation;
    array["use_hat_model"] = usehatmodel;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x385b
// Size: 0x55
function note_track_swap_to_efx(notetrack, effect_path, tagname) {
    scenedata = get_datascene();
    add_fx(effect_path, effect_path);
    addnotetrack_swapparttoefx(scenedata.animname, notetrack, scenedata.animsequence, effect_path, tagname);
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x38b8
// Size: 0x55
function note_track_stop_efx_on_tag(notetrack, effect_path, tagname) {
    scenedata = get_datascene();
    add_fx(effect_path, effect_path);
    addnotetrack_stopfxontag(scenedata.animname, notetrack, scenedata.animsequence, effect_path, tagname);
}

// Namespace animation / scripts\common\anim
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3915
// Size: 0x8b
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

// Namespace animation / scripts\common\anim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x39a8
// Size: 0xcb
function note_track_trace_to_efx(notetrack, canceltrack, tagname, effect_path, var_56aef90205769a90, delete_depth) {
    scenedata = get_datascene();
    if (notetrack != "start" && !animhasnotetrack(scenedata getanim(scenedata.anim_sequence), notetrack)) {
        println("<dev string:xd8>" + scenedata.anim_sequence + "<dev string:xf4>" + notetrack);
        return;
    }
    add_fx(effect_path, effect_path);
    if (isdefined(var_56aef90205769a90)) {
        add_fx(var_56aef90205769a90, var_56aef90205769a90);
    }
    addnotetrack_tracepartforefx(scenedata.animname, notetrack, canceltrack, scenedata.anim_sequence, tagname, effect_path, var_56aef90205769a90, delete_depth);
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3a7b
// Size: 0xa0
function note_track_start_fx_on_tag(notetrack, tagname, effect_path) {
    scenedata = get_datascene();
    if (notetrack != "start" && !animhasnotetrack(scenedata getanim(scenedata.anim_sequence), notetrack)) {
        println("<dev string:x10f>" + scenedata.anim_sequence + "<dev string:xf4>" + notetrack);
        return;
    }
    add_fx(effect_path, effect_path);
    addnotetrack_startfxontag(scenedata.animname, notetrack, scenedata.anim_sequence, effect_path, tagname, 1);
}

// Namespace animation / scripts\common\anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b23
// Size: 0x44
function get_datascene() {
    assertex(isdefined(level.current_anim_data_scene));
    scenedata = level.current_anim_data_scene;
    assertex(isdefined(scenedata.animtree), "Missing calling scene, Must use create_anim_scene() ");
    return scenedata;
}

// Namespace animation / scripts\common\anim
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x3b70
// Size: 0x105
function addnotetrack_tracepartforefx(animname, notetrack, canceltrack, anime, tagname, effect_name, var_6c3cb0b533910c44, delete_depth) {
    getfx(effect_name);
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["trace_part_for_efx"] = effect_name;
    array["trace_part_for_efx_water"] = var_6c3cb0b533910c44;
    array["trace_part_for_efx_cancel"] = canceltrack;
    array["trace_part_for_efx_delete_depth"] = delete_depth;
    array["selftag"] = tagname;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
    if (isdefined(canceltrack)) {
        array = [];
        array["trace_part_for_efx_canceling"] = canceltrack;
        array["selftag"] = tagname;
        index = add_notetrack_and_get_index(animname, canceltrack, anime);
        level.scr_notetrack[animname][anime][canceltrack][index] = array;
    }
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3c7d
// Size: 0x70
function addnotetrack_notify(animname, notetrack, thenotify, anime) {
    notetrack = tolower(notetrack);
    anime = get_generic_anime(anime);
    index = add_notetrack_and_get_index(animname, notetrack, anime);
    array = [];
    array["notify"] = thenotify;
    level.scr_notetrack[animname][anime][notetrack][index] = array;
}

// Namespace animation / scripts\common\anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cf5
// Size: 0x1c
function setanimtree() {
    self useanimtree(level.scr_animtree[self.animname]);
}

// Namespace animation / scripts\common\anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d19
// Size: 0x1b7
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
    if (!isdefined(level.scr_xcam)) {
        level.scr_xcam = [];
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

// Namespace animation / scripts\common\anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ed8
// Size: 0xa8
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
            continue;
        }
        precachemodel(level.scr_model[models[i]]);
    }
}

// Namespace animation / scripts\common\anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f88
// Size: 0xd7
function precache_weapon_models_thread() {
    waittillframeend();
    if (!isdefined(level.scr_weapon)) {
        return;
    }
    weapons = getarraykeys(level.scr_weapon);
    for (i = 0; i < weapons.size; i++) {
        assertex(isarray(level.scr_weapon[weapons[i]]), weapons[i] + ": scr_weapon needs to be defined as an array!");
        attachments = [];
        if (isdefined(level.scr_weapon[weapons[i]][1])) {
            assertex(isarray(level.scr_weapon[weapons[i]][1]), "scr_weapon attachments need to be defined as an array!");
            attachments = level.scr_weapon[weapons[i]][1];
        }
        utility::make_weapon_model(level.scr_weapon[weapons[i]][0], attachments, 1, 1);
    }
}

// Namespace animation / scripts\common\anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4067
// Size: 0x7c
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

// Namespace animation / scripts\common\anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40eb
// Size: 0xa0
function init_animsounds_for_animname(animname) {
    animes = getarraykeys(level.scr_animsound[animname]);
    for (i = 0; i < animes.size; i++) {
        anime = animes[i];
        soundalias = level.scr_animsound[animname][anime];
        level.animsound_aliases[animname][anime]["#" + anime]["soundalias"] = soundalias;
        level.animsound_aliases[animname][anime]["#" + anime]["created_by_animSound"] = 1;
    }
}

// Namespace animation / scripts\common\anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4193
// Size: 0x134
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

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x42cf
// Size: 0xad
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
        assert(guy._animactive >= 0);
    }
}

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4384
// Size: 0x41
function anim_deathnotify(guy, anime) {
    self endon(anime);
    guy waittill("death");
    if (isdefined(guy.anim_is_death) && guy.anim_is_death) {
        return;
    }
    self notify(anime);
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x43cd
// Size: 0x35
function anim_facialendnotify(guy, anime, scriptedfaceanim) {
    self endon(anime);
    time = getanimlength(scriptedfaceanim);
    wait time;
    self notify(anime);
}

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x440a
// Size: 0x22
function anim_dialogueendnotify(guy, anime) {
    self endon(anime);
    guy waittill("single dialogue");
    self notify(anime);
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4434
// Size: 0x6f
function anim_animationendnotify(guy, anime, var_2afd32f7cad8af86, var_9e8a16d47a03007a) {
    self endon(anime);
    guy endon("death");
    var_2afd32f7cad8af86 -= var_9e8a16d47a03007a;
    if (var_9e8a16d47a03007a > 0 && var_2afd32f7cad8af86 > 0) {
        guy waittill_match_or_timeout("single anim", "end", var_2afd32f7cad8af86);
        guy stopanimscripted();
    } else {
        guy waittillmatch("single anim", "end");
    }
    self notify(anime);
}

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x44ab
// Size: 0xb6
function anim_weight(animname, anime) {
    assertex(isdefined(level.scr_anim[animname][anime]), "There is no animation scene \"" + anime + "\" for animname " + animname);
    assertex(isarray(level.scr_anim[animname][anime]), "the animation entry for level.scr_anim[ " + animname + " ][ " + anime + " ] needs to be an array of looping animations, not a single animation");
    total_anims = level.scr_anim[animname][anime].size;
    idleanim = randomint(total_anims);
    if (isdefined(level.scr_anim[animname][anime + "weight"])) {
        idleanim = get_weighted_anim(animname, anime, total_anims);
    }
    return idleanim;
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x456a
// Size: 0x101
function get_weighted_anim(animname, anime, total_anims) {
    idleanim = undefined;
    if (total_anims > 1) {
        weights = 0;
        anim_weight = 0;
        for (i = 0; i < total_anims; i++) {
            if (isdefined(level.scr_anim[animname][anime + "weight"])) {
                if (isdefined(level.scr_anim[animname][anime + "weight"][i])) {
                    weights++;
                    anim_weight += level.scr_anim[animname][anime + "weight"][i];
                }
            }
        }
        if (weights == total_anims) {
            anim_play = randomfloat(anim_weight);
            anim_weight = 0;
            for (i = 0; i < total_anims; i++) {
                anim_weight += level.scr_anim[animname][anime + "weight"][i];
                if (anim_play < anim_weight) {
                    idleanim = i;
                    break;
                }
            }
        }
    }
    return idleanim;
}

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4674
// Size: 0x68
function play_addtive_head_anim(guy, animation) {
    guy setanimlimited(generic_human%addtive_head_anims, 1, 0.2);
    guy setanimlimited(animation, 1, 0.2);
    wait getanimlength(animation);
    guy clearanim(generic_human%addtive_head_anims, 0.2);
    guy clearanim(animation, 0.2);
}

// Namespace animation / scripts\common\anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46e4
// Size: 0x86
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

// Namespace animation / scripts\common\anim
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x4773
// Size: 0x70
function function_d2e8597ff01310ed(xanim, tag, time, baseorigin, baseangles) {
    result = self function_bbf5cb43caa911b7(xanim, tag, time);
    if (isdefined(result)) {
        result["origin"] = coordtransform(result["origin"], baseorigin, baseangles);
        result["angles"] = combineangles(baseangles, result["angles"]);
    }
    return result;
}

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x47ec
// Size: 0x32
function anim_at_self(entity, tag) {
    packet = [];
    packet["guy"] = self;
    packet["entity"] = self;
    return packet;
}

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4827
// Size: 0x3b
function anim_at_entity(entity, tag) {
    packet = [];
    packet["guy"] = self;
    packet["entity"] = entity;
    packet["tag"] = tag;
    return packet;
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x486b
// Size: 0x334
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
        assertmsg("Animating character of type " + self.classname + " has no animname.");
        return;
    }
    has_anim = 0;
    if (isdefined(level.scr_anim[animname])) {
        has_anim = 1;
        if (isdefined(level.scr_anim[animname][anime])) {
            return;
        }
    }
    has_face = 0;
    if (isdefined(level.scr_face[animname])) {
        has_face = 1;
        if (isdefined(level.scr_face[animname][anime])) {
            return;
        }
    }
    has_sound = 0;
    if (isdefined(level.scr_sound[animname])) {
        has_sound = 1;
        if (isdefined(level.scr_sound[animname][anime])) {
            return;
        }
    }
    if (has_anim || has_sound || has_face) {
        if (has_anim) {
            array = getarraykeys(level.scr_anim[animname]);
            /#
                println("<dev string:x125>" + animname + "<dev string:x13d>");
                foreach (member in array) {
                    println(member);
                }
            #/
        }
        if (has_sound) {
            array = getarraykeys(level.scr_sound[animname]);
            /#
                println("<dev string:x13f>" + animname + "<dev string:x13d>");
                foreach (member in array) {
                    println(member);
                }
            #/
        }
        if (has_face) {
            array = getarraykeys(level.scr_face[animname]);
            /#
                println("<dev string:x15b>" + animname + "<dev string:x13d>");
                foreach (member in array) {
                    println(member);
                }
            #/
        }
        assertmsg("<dev string:x176>" + function_a2eaafb222316a2(self) + "<dev string:x3e>" + animname + "<dev string:x4f>" + anime + "<dev string:x179>");
        return;
    }
    keys = getarraykeys(level.scr_anim);
    keys = array_combine(keys, getarraykeys(level.scr_sound));
    foreach (key in keys) {
        println(key);
    }
    assertmsg("Animname " + animname + " is not setup to do animations. See above for list of legal animnames.");
}

/#

    // Namespace animation / scripts\common\anim
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4ba7
    // Size: 0xe4
    function printloops(guy, anime) {
        if (!isdefined(guy)) {
            return;
        }
        guy endon("<dev string:x1b9>");
        waittillframeend();
        guy.loops++;
        if (guy.loops > 0) {
            guy.loopanims[guy.loopanims.size] = anime;
        }
        if (guy.loops > 1) {
            println("<dev string:x1bf>" + guy.animname + "<dev string:x1d0>" + guy.loops + "<dev string:x1d6>");
            for (i = 0; i < guy.loopanims.size; i++) {
                println("<dev string:x1f3>" + guy.loopanims[i]);
            }
            assertmsg("<dev string:x1fc>");
        }
    }

    // Namespace animation / scripts\common\anim
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x4c93
    // Size: 0x53
    function function_1d3c30084bbec96a(guy, ender, anime) {
        guy endon("<dev string:x1b9>");
        self waittill(ender);
        guy.loopanims = array_remove(guy.loopanims, anime);
        guy.loops--;
    }

#/

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4cee
// Size: 0x94
function anim_single_failsafeonguy(owner, anime) {
    /#
        if (getdvar(@"hash_27494f1d75fc0809") != "<dev string:x23c>") {
            return;
        }
        owner endon(anime);
        owner endon("<dev string:x1b9>");
        self endon("<dev string:x1b9>");
        name = self.classname;
        num = self getentitynumber();
        wait 60;
        println("<dev string:x23f>" + name + "<dev string:x254>" + num);
        waittillframeend();
        assertex(0, "<dev string:x261>" + anime + "<dev string:x26d>");
    #/
}

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4d8a
// Size: 0x5f
function anim_single_failsafe(guys, anime) {
    foreach (guy in guys) {
        guy thread anim_single_failsafeonguy(self, anime);
    }
}

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4df1
// Size: 0x4b
function anim_get_goal_time(animname, anime) {
    if (isdefined(level.scr_goaltime[animname]) && isdefined(level.scr_goaltime[animname][anime])) {
        return level.scr_goaltime[animname][anime];
    }
    return 0.5;
}

// Namespace animation / scripts\common\anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e44
// Size: 0x1b
function function_89b3eabd606fcda3(animation) {
    if (utility::issp()) {
        return 0.5;
    }
    return 0;
}

// Namespace animation / scripts\common\anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e68
// Size: 0x36
function function_f1e7ee8ddeece062(anime) {
    if (utility::issp() && isdefined(level.var_df7711b84d224bcf) && istrue(level.var_df7711b84d224bcf[anime])) {
        return true;
    }
    return false;
}

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4ea7
// Size: 0xb9
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

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4f69
// Size: 0x3d
function function_56bd620e57a834af(anime, animname, animation) {
    var_4f51ef0bd97a4707 = anime + "_entrance";
    level.scr_anim[animname][var_4f51ef0bd97a4707] = animation;
    return var_4f51ef0bd97a4707;
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4faf
// Size: 0xd8
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
                iprintln("<dev string:x29f>");
            }
        #/
    }
    if (isarray(level.scr_anim[animname][anime])) {
        return level.scr_anim[animname][anime][level.var_ac0205cb091a126e];
    }
    return level.scr_anim[animname][anime];
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x508f
// Size: 0x220
function function_96b3d74019cd30a(anime, org, angles, animname) {
    if (isdefined(level.var_ac0205cb091a126e) && istrue(level.var_99364109f9f9b3f4) && level.var_99364109f9f9b3f4 == gettime()) {
        return level.scr_anim[animname][anime][level.var_ac0205cb091a126e];
    }
    var_48c468c35e48fd78 = 0;
    closest_dist = undefined;
    level.var_ac0205cb091a126e = undefined;
    foreach (animation in level.scr_anim[animname][anime]) {
        neworg = getstartorigin(org, angles, animation);
        /#
            if (getdvarint(@"hash_4140c00f3efa94c6", 0)) {
                line(self.origin, neworg, (1, 1, 1), 1, 0, 1000);
                print3d(neworg + (0, 0, 2), animation, (1, 1, 1), 1, 0.075, 1000, 1);
                print3d(neworg, "<dev string:x2c4>", (1, 1, 1), 1, 0.2, 1000, 1);
            }
        #/
        if (!isdefined(closest_dist)) {
            closest_dist = distancesquared(neworg, level.player.origin);
            continue;
        }
        dist = distancesquared(level.player.origin, neworg);
        if (dist < closest_dist) {
            var_48c468c35e48fd78 = i;
            closest_dist = dist;
        }
    }
    animation = level.scr_anim[animname][anime][var_48c468c35e48fd78];
    /#
        if (getdvarint(@"hash_4140c00f3efa94c6", 0)) {
            iprintln("<dev string:x2c6>" + animation);
        }
    #/
    level.var_99364109f9f9b3f4 = gettime();
    level.var_ac0205cb091a126e = var_48c468c35e48fd78;
    return animation;
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x52b8
// Size: 0x52
function function_1ed6444c29da9045(anime, org, angles, animname) {
    level.var_ac0205cb091a126e = undefined;
    animation = level.scr_anim[animname][anime][0];
    level.var_ac0205cb091a126e = 0;
    return animation;
}

// Namespace animation / scripts\common\anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5313
// Size: 0x30
function function_84a46f10a88351cd(animname) {
    if (isdefined(level.scr_animtree[animname]) && level.scr_animtree[animname] == %generic_human) {
        return true;
    }
    return false;
}

// Namespace animation / scripts\common\anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x534c
// Size: 0x1d
function function_9c6a9b923786f602(animname) {
    return [[ anim.callbacks["CheckPlayerAnimtree"] ]](animname);
}

// Namespace animation / scripts\common\anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5372
// Size: 0x27
function function_2c88f6e05af61090(animation) {
    if (!animhasnotetrack(animation, "blend_into")) {
        return 0;
    }
    return get_notetrack_time(animation, "blend_into");
}

// Namespace animation / scripts\common\anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53a2
// Size: 0x27
function function_f92de130e8613662(animation) {
    if (!animhasnotetrack(animation, "blend_out")) {
        return undefined;
    }
    return get_notetrack_time(animation, "blend_out");
}

// Namespace animation / scripts\common\anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53d2
// Size: 0x46
function function_70b77e26541e095(animation) {
    speed = 128;
    if (animhasnotetrack(animation, "blend_speed = walk")) {
        speed = 128;
    } else if (animhasnotetrack(animation, "blend_speed = run")) {
        speed = 145;
    }
    return speed * 0.7;
}

// Namespace animation / scripts\common\anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5421
// Size: 0xee
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

// Namespace animation / scripts\common\anim
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x5518
// Size: 0x205
function function_d0fafbacba98a40f(playerpos, animstartpos, blendspeed, blendIntoTime, var_ec165a067af34f8f, var_8831fc7320076829, simultaneous) {
    var_ec165a067af34f8f = ter_op(isdefined(var_ec165a067af34f8f), var_ec165a067af34f8f, 1);
    var_8831fc7320076829 = ter_op(isdefined(var_8831fc7320076829), var_8831fc7320076829, 0);
    simultaneous = ter_op(isdefined(simultaneous), simultaneous, 0);
    assertex(!(var_ec165a067af34f8f && var_8831fc7320076829), "dropWeaponWithGesture and dropWeaponWithAnim can not both be true.");
    if (istrue(var_ec165a067af34f8f)) {
        weaponDropTime = level.player getgestureanimlength("proto_vm_gesture_gun_drop");
    } else if (istrue(var_8831fc7320076829)) {
        weaponDropTime = 0.5;
    } else {
        weaponDropTime = 0;
    }
    weaponDropQuick = 0;
    if (istrue(simultaneous)) {
        weaponDropQuick = 1;
        weaponDropTime = 0;
    } else if (level.player getdemeanorviewmodel() == "relaxed") {
        weaponDropQuick = 1;
        weaponDropTime = 0.2;
    }
    blendtimecalc = distance2d(playerpos, animstartpos) / blendspeed;
    idealblendtime = blendIntoTime + weaponDropTime;
    /#
        if (getdvarint(@"hash_398da46238160a6", 0)) {
            iprintln("<dev string:x2dd>" + blendtimecalc);
        }
    #/
    if (blendIntoTime > 0) {
        frac = blendtimecalc / idealblendtime;
        if (frac < 1.4 && frac > 0.4) {
            blendtime = idealblendtime;
        } else if (blendtimecalc < blendIntoTime) {
            blendtime = ter_op(blendIntoTime < 1, blendIntoTime + weaponDropTime, 1 + weaponDropTime);
        } else if (blendtimecalc > 0.5) {
            blendtime = blendtimecalc;
        } else {
            blendtime = 0.5;
        }
    } else {
        blendtime = 0.5;
    }
    if (blendtime > idealblendtime) {
        /#
            if (getdvarint(@"hash_398da46238160a6", 0)) {
                iprintln("<dev string:x2f4>");
            }
        #/
        weaponDropTime = blendtime - blendIntoTime;
    }
    level.blendinfo["weaponDropQuick"] = weaponDropQuick;
    level.blendinfo["weaponDropTime"] = weaponDropTime;
    return blendtime;
}

// Namespace animation / scripts\common\anim
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x5726
// Size: 0x227
function function_309bb9de5db13227(playerpos, animstartpos, blendspeed, blendIntoTime, var_ec165a067af34f8f, var_8831fc7320076829, simultaneous) {
    var_ec165a067af34f8f = ter_op(isdefined(var_ec165a067af34f8f), var_ec165a067af34f8f, 1);
    var_8831fc7320076829 = ter_op(isdefined(var_8831fc7320076829), var_8831fc7320076829, 0);
    simultaneous = ter_op(isdefined(simultaneous), simultaneous, 0);
    if (!var_8831fc7320076829) {
        quickdroptime = 0;
        normaldroptime = 0;
    } else {
        quickdroptime = 0.2;
        if (var_ec165a067af34f8f) {
            normaldroptime = level.player getgestureanimlength("proto_vm_gesture_gun_drop");
        } else {
            normaldroptime = 0.5;
        }
    }
    blendtime = distance2d(playerpos, animstartpos) / blendspeed;
    /#
        if (getdvarint(@"hash_398da46238160a6", 0)) {
            iprintln("<dev string:x2dd>" + blendtime);
        }
    #/
    idealblendtime = blendIntoTime + normaldroptime;
    if (idealblendtime > 0) {
        frac = blendtime / idealblendtime;
        if (frac < 1.4 && frac > 0.4) {
            blendtime = idealblendtime;
        } else if (blendtime < blendIntoTime) {
            blendtime = ter_op(blendIntoTime <= 1, blendIntoTime, 1);
        }
    }
    if (istrue(var_ec165a067af34f8f) && istrue(var_8831fc7320076829)) {
        blendtime = ter_op(blendtime < normaldroptime, normaldroptime, blendtime);
    } else if (!istrue(var_8831fc7320076829)) {
        blendtime = ter_op(blendtime < 0.5, 0.5, blendtime);
    } else {
        blendtime = ter_op(blendtime < quickdroptime, quickdroptime, blendtime);
    }
    weaponDropQuick = 0;
    weaponDropTime = normaldroptime;
    if (blendtime < normaldroptime || level.player getdemeanorviewmodel() == "relaxed") {
        weaponDropQuick = 1;
        weaponDropTime = quickdroptime;
    } else if (blendtime > idealblendtime) {
        /#
            if (getdvarint(@"hash_398da46238160a6", 0)) {
                iprintln("<dev string:x2f4>");
            }
        #/
        weaponDropTime = blendtime - blendIntoTime;
    }
    if (istrue(simultaneous)) {
        weaponDropQuick = 1;
        weaponDropTime = 0;
    }
    level.blendinfo["weaponDropQuick"] = weaponDropQuick;
    level.blendinfo["weaponDropTime"] = weaponDropTime;
    return blendtime;
}

// Namespace animation / scripts\common\anim
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x5956
// Size: 0x77
function function_dba8ec1939d3f1a(anime, animname, var_ec165a067af34f8f, var_8831fc7320076829, simultaneous) {
    if (function_f1e7ee8ddeece062(anime)) {
        animation = function_c099f6fd9c19f5a6(anime, self.origin, self.angles, animname);
    } else {
        animation = level.scr_anim[animname][anime];
    }
    function_1d134c1e220fb6d7(animation, var_ec165a067af34f8f, var_8831fc7320076829, simultaneous);
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x59d5
// Size: 0x1b1
function function_1d134c1e220fb6d7(animation, var_ec165a067af34f8f, var_8831fc7320076829, simultaneous) {
    animpos = getstartorigin(self.origin, self.angles, animation);
    level.blendinfo = [];
    blendIntoTime = function_2c88f6e05af61090(animation);
    blendouttime = function_f92de130e8613662(animation);
    blendspeed = function_70b77e26541e095(animation);
    blendtime = function_d0fafbacba98a40f(level.player.origin, animpos, blendspeed, blendIntoTime, var_ec165a067af34f8f, var_8831fc7320076829, simultaneous);
    stances = function_48af09f152896047(animation);
    level.blendinfo["blendIntoTime"] = blendIntoTime;
    level.blendinfo["blendOutTime"] = blendouttime;
    level.blendinfo["blendSpeed"] = blendspeed;
    level.blendinfo["blendTime"] = blendtime;
    level.blendinfo["stances"] = stances;
    /#
        if (getdvarint(@"hash_398da46238160a6", 0)) {
            iprintln("<dev string:x345>" + blendtime);
            iprintln("<dev string:x351>" + blendIntoTime);
            if (isdefined(blendouttime)) {
                iprintln("<dev string:x361>" + blendouttime);
            }
            iprintln("<dev string:x370>" + level.blendinfo["<dev string:x381>"]);
            iprintln("<dev string:x390>" + level.blendinfo["<dev string:x39a>"][0] + "<dev string:x3a2>" + level.blendinfo["<dev string:x39a>"][1]);
        }
    #/
}

// Namespace animation / scripts\common\anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b8e
// Size: 0x38
function function_5cffe82f5e70231b(bool) {
    assertex(isdefined(bool), "Must pass a bool!");
    if (istrue(bool)) {
        self.animscripted_collision = 1;
        return;
    }
    self.animscripted_collision = undefined;
}

// Namespace animation / scripts\common\anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5bce
// Size: 0x13
function function_6bc36c81fc28a22e() {
    if (istrue(self.animscripted_collision)) {
        return true;
    }
    return false;
}

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5bea
// Size: 0x9b
function function_1cb661b457551a3(bool, velocityent, blendtime) {
    assertex(isdefined(bool), "Must pass a bool!");
    if (istrue(bool)) {
        assertex(isdefined(velocityent), "Must pass an ent for velocity!");
        self.var_a986b9d4a1be703b = 1;
        self.var_f1a075b476ca91f1 = velocityent getvelocity();
        if (isdefined(blendtime)) {
            self.var_37b96012304143d7 = blendtime;
        } else {
            self.var_37b96012304143d7 = 0.2;
        }
        return;
    }
    self.var_a986b9d4a1be703b = undefined;
    self.var_f1a075b476ca91f1 = undefined;
    self.var_37b96012304143d7 = undefined;
}

// Namespace animation / scripts\common\anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c8d
// Size: 0x2f
function function_e42b762e098c8f9e() {
    if (istrue(self.var_a986b9d4a1be703b) && isdefined(self.var_f1a075b476ca91f1) && isdefined(self.var_37b96012304143d7)) {
        return true;
    }
    return false;
}

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5cc5
// Size: 0xd1
function function_52351c3338da63f4(animcategory, animindex) {
    assertex(isdefined(animcategory) && isdefined(animindex), "<dev string:x3a5>");
    animlength = 0;
    if (isdefined(level.var_539e9dc23256f26d) && isdefined(level.var_539e9dc23256f26d[animcategory]) && isdefined(level.var_539e9dc23256f26d[animcategory][animindex])) {
        animlength = level.var_539e9dc23256f26d[animcategory][animindex];
    } else if (isdefined(level.scr_anim) && isdefined(level.scr_anim[animcategory]) && isdefined(level.scr_anim[animcategory][animindex])) {
        animlength = getanimlength(level.scr_anim[animcategory][animindex]);
    } else {
        assertmsg("<dev string:x3db>");
    }
    return animlength;
}

/#

    // Namespace animation / scripts\common\anim
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5d9f
    // Size: 0x164
    function function_65e9f4b64110bb5c() {
        while (true) {
            requestflag = getdvarint(@"hash_300079a74221ae45", 0);
            if (requestflag != 0) {
                origin = (0, 0, 0);
                angles = (0, 0, 0);
                align_target = getdvar(@"hash_43022f85e8f590a5");
                align_tag = getdvar(@"hash_9dfd128a6efc97b4");
                aligntarget = getent_or_struct(align_target, "<dev string:x464>");
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
    }

#/

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5f0b
// Size: 0x2f
function function_dca1a3a29d2ee467(var_54e516bef4218c8f, var_4bc185af207d5706) {
    thread anim_reach_speed_control(var_54e516bef4218c8f, var_4bc185af207d5706);
    function_9dbe1a78b03782f2(var_54e516bef4218c8f, &reach_with_standard_adjustments_begin, &reach_with_standard_adjustments_end);
}

// Namespace animation / scripts\common\anim
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x5f42
// Size: 0x172
function anim_reach_with_funcs(guys, anime, tag, animname_override, start_func, end_func, arrival_type) {
    array = get_anim_position(tag);
    alignmentinfo = spawnstruct();
    alignmentinfo.origin = array["origin"];
    alignmentinfo.angles = array["angles"];
    var_54e516bef4218c8f = [];
    foreach (guy in guys) {
        if (isdefined(animname_override)) {
            animname = animname_override;
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
        var_54e516bef4218c8f[var_54e516bef4218c8f.size] = [guy, animation, alignmentinfo];
    }
    function_9dbe1a78b03782f2(var_54e516bef4218c8f, start_func, end_func, arrival_type);
}

// Namespace animation / scripts\common\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x60bc
// Size: 0x32e
function function_9dbe1a78b03782f2(var_54e516bef4218c8f, start_func, end_func, arrival_type) {
    ent = spawnstruct();
    debugstartpos = 0;
    /#
        debugstartpos = getdvar(@"hash_34dab4f8f3a04f4a") == "<dev string:x23c>";
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
            var_93e32c180cab35b3 = arrival_type;
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
        if (debugstartpos) {
            level notify("<dev string:x46f>" + "<dev string:x471>");
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

// Namespace animation / scripts\common\anim
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x63f2
// Size: 0x43
function private reach_death_notify(ent) {
    waittill_either("death", "goal");
    while (isalive(self) && self.arriving) {
        wait 0.05;
    }
    ent notify("reach_notify");
}

// Namespace animation / scripts\common\anim
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x643d
// Size: 0x11a
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

// Namespace animation / scripts\common\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x655f
// Size: 0x5e8
function anim_reach_speed_control(var_54e516bef4218c8f, var_4bc185af207d5706, var_ad86b98c8c9def3d) {
    waittillframeend();
    var_4bc185af207d5706 = default_to(var_4bc185af207d5706, 140);
    var_ad86b98c8c9def3d = default_to(var_ad86b98c8c9def3d, 4);
    foreach (index, var_64b5ab50f22a4efc in var_54e516bef4218c8f) {
        guy = var_64b5ab50f22a4efc[0];
        var_93e32c180cab35b3 = var_64b5ab50f22a4efc[3];
        moving_destination = isdefined(var_93e32c180cab35b3) && var_93e32c180cab35b3 == "Exposed Moving";
        track_speed = moving_destination;
        /#
            track_speed = track_speed || getdvarint(@"hash_d3e33f1288718b9e");
        #/
        if (track_speed) {
            guy childthread anim_reach_speed_control_avg(var_ad86b98c8c9def3d, var_4bc185af207d5706);
        }
        guy aisetdesiredspeed(var_4bc185af207d5706);
    }
    while (true) {
        furthestguy = undefined;
        furthestdist = 0;
        dist = [];
        dist_normal = [];
        remove = [];
        foreach (index, var_64b5ab50f22a4efc in var_54e516bef4218c8f) {
            guy = var_64b5ab50f22a4efc[0];
            if (!isalive(guy)) {
                remove[remove.size] = index;
                continue;
            }
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
                continue;
            }
            if (dist[index] > furthestdist) {
                furthestguy = guy;
                furthestdist = dist[index];
            }
        }
        foreach (index in remove) {
            guy = var_54e516bef4218c8f[index][0];
            if (isalive(guy)) {
                guy val::reset_all("anim_reach_speed_control");
                guy enableavoidance(1, 1);
                guy.reachspeed = undefined;
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
            moving_destination = isdefined(var_93e32c180cab35b3) && var_93e32c180cab35b3 == "Exposed Moving";
            if (dist[index] < 96) {
                guy enableavoidance(0, 0);
            }
            dist_normal[index] = dist[index] / furthestdist;
            speedscale = 1;
            if (furthestguy != guy) {
                if (moving_destination && dist[index] <= 16) {
                    speedscale = min(1, guy.reachspeed.var_e2b417b32dbed0f7 + 0.05);
                } else {
                    speedscale = max(dist_normal[index], 0.4);
                }
            }
            desiredspeed = speedscale * var_4bc185af207d5706;
            /#
                if (getdvarint(@"hash_d3e33f1288718b9e")) {
                    if (furthestguy == guy) {
                        print3d(guy.origin + (0, 0, 36), "<dev string:x480>", (0, 1, 0), 1, 0.3, 1, 1);
                    }
                    line(guy.origin, guy.goalpos, (1, 1, 1), 1, 0, 1);
                    print3d(guy.origin, "<dev string:x1c>" + int(var_4bc185af207d5706), (0, 1, 0), 1, 0.3, 1, 1);
                    print3d(guy.origin + (0, 0, 10), "<dev string:x1c>" + int(desiredspeed), (1, 1, 1), 1, 0.3, 1, 1);
                    if (isdefined(guy.reachspeed)) {
                        print3d(guy.origin + (0, 0, 20), "<dev string:x1c>" + int(guy.reachspeed.var_e2b417b32dbed0f7), (0, 1, 1), 1, 0.3, 1, 1);
                    }
                    print3d(guy.origin + (0, 0, 80), "<dev string:x1c>" + speedscale, (0, 0, 1), 1, 0.3, 1, 1);
                    print3d(guy.goalpos + (0, 0, 12), "<dev string:x1c>" + int(dist[index]), (0, 0, 1), 1, 1, 1, 1);
                    sphere(guy.goalpos, 16);
                }
            #/
            switch (guy getdemeanor()) {
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

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6b4f
// Size: 0x138
function anim_reach_speed_control_avg(var_ad86b98c8c9def3d, var_4bc185af207d5706) {
    self endon("death");
    self notify("anim_reach_speed_control_avg");
    self endon("anim_reach_speed_control_avg");
    self.reachspeed = spawnstruct();
    reachspeed = self.reachspeed;
    reachspeed.var_e2b417b32dbed0f7 = var_4bc185af207d5706;
    reachspeed.speed_samples = [];
    reachspeed.speed_total = 0;
    curr = 0;
    while (true) {
        index = mod(curr, var_ad86b98c8c9def3d);
        curr++;
        if (isdefined(reachspeed.speed_samples[index])) {
            reachspeed.speed_total -= reachspeed.speed_samples[index];
        }
        reachspeed.speed_samples[index] = length(self.velocity);
        reachspeed.speed_total += reachspeed.speed_samples[index];
        reachspeed.var_e2b417b32dbed0f7 = reachspeed.speed_total / reachspeed.speed_samples.size;
        waitframe();
    }
}

// Namespace animation / scripts\common\anim
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x6c8f
// Size: 0x45
function private reach_with_standard_adjustments_begin(startorg, startangles) {
    assertex(isdefined(anim.callbacks["reach_with_standard_adjustments_begin"]), "You must define anim.callbacks[ reach_with_standard_adjustments_begin ] if you are first frame animating an AI");
    return self [[ anim.callbacks["reach_with_standard_adjustments_begin"] ]](startorg, startangles);
}

// Namespace animation / scripts\common\anim
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6cdd
// Size: 0x33
function private reach_with_standard_adjustments_end() {
    assertex(isdefined(anim.callbacks["reach_with_standard_adjustments_end"]), "You must define anim.callbacks[ reach_with_standard_adjustments_end ] if you are first frame animating an AI");
    self [[ anim.callbacks["reach_with_standard_adjustments_end"] ]]();
}

