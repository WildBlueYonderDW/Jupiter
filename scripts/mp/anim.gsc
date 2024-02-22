// mwiii decomp prototype
#using scripts\common\anim.gsc;
#using scripts\common\notetrack.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\face.gsc;
#using scripts\anim\notetracks.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\anim\notetracks_mp.gsc;

#namespace namespace_725871aae3b7bfd4;

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x282
// Size: 0x134
function init() {
    initanim();
    if (!isdefined(level.scr_viewmodelanim)) {
        level.scr_viewmodelanim = [];
    }
    if (!isdefined(level.scr_eventanim)) {
        level.scr_eventanim = [];
    }
    anim.callbacks["PlaySoundAtViewHeight"] = &play_sound_at_viewheight;
    anim.callbacks["TeleportEnt"] = &teleport_entity;
    anim.callbacks["ShouldDoAnim"] = &should_do_anim;
    anim.callbacks["DoAnimation"] = &do_animation;
    anim.callbacks["DoFacialAnim"] = &do_facial_anim;
    anim.callbacks["reach_with_standard_adjustments_begin"] = &function_b9c0db166bfa05de;
    anim.callbacks["reach_with_standard_adjustments_end"] = &function_4e8646c3e9f9ec0a;
    anim.callbacks["AnimHandleNotetrack"] = &mp_anim_handle_notetrack;
    anim.callbacks["EntityHandleNotetrack"] = &mp_entity_handle_notetrack;
    anim.callbacks["EntityHandleNotetrackAnimEnd"] = &namespace_a4081f3d58d76916::function_8b5c774e7238fec5;
    anim.callbacks["AIAnimFirstFrame"] = &namespace_aaebfc23308fe5e4::ai_anim_first_frame;
    anim.callbacks["playXcam"] = &function_a871831543fd27ef;
}

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bd
// Size: 0x24
function play_sound_at_viewheight(aliasname, var_b1a4e9fa39b3858a, var_a68adbd3eefe9282) {
    self playsound(aliasname);
}

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e8
// Size: 0x5
function should_do_anim() {
    return 1;
}

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f5
// Size: 0x97
function teleport_entity(origin, angles) {
    if (self.code_classname == "script_vehicle") {
        if (!function_c606ca98a77e09ca()) {
            self.origin = origin;
            self.angles = angles;
            self dontinterpolate();
        } else {
            self vehicle_teleport(origin, angles);
            self dontinterpolate();
        }
    } else if (isplayer(self)) {
        self setorigin(origin);
        self setplayerangles(angles);
    } else {
        self.origin = origin;
        self.angles = angles;
        self dontinterpolate();
    }
}

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x493
// Size: 0x56
function function_c606ca98a77e09ca() {
    var_458075ba716043ba = 1;
    if (isdefined(self.vehiclename)) {
        switch (self.vehiclename) {
        case #"hash_2289ec11d77bce8f":
        case #"hash_56979e0566996b2e":
        case #"hash_d849f9d4eaa9ed93":
            var_458075ba716043ba = 0;
            break;
        }
    }
    return var_458075ba716043ba;
}

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f1
// Size: 0x35
function do_facial_anim(dofacialanim, var_9ac73a1996d2dae, doanimation, anime, animname, dialogue) {
    return 0;
}

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52e
// Size: 0x212
function do_animation(org, angles, animname, anime, var_314c4455b996b224, idleanim, var_43e50904d011917e) {
    var_173bdb8ba434651d = 0;
    animation = undefined;
    if (isdefined(idleanim) && !isagent(self)) {
        animation = level.scr_anim[animname][anime][idleanim];
    } else {
        animation = level.scr_anim[animname][anime];
    }
    goaltime = anim_get_goal_time(animname, anime);
    last_anim_time_check();
    if (!isdefined(idleanim)) {
        self._lastanime = anime;
    }
    if (self.code_classname == "misc_turret" && !isdefined(idleanim)) {
        self setflaggedanim(var_314c4455b996b224, animation, 1, goaltime);
    } else {
        if (self.code_classname == "script_vehicle") {
            self vehicleplayanim(animation);
        }
        root = undefined;
        if (isdefined(self.anim_getrootfunc)) {
            root = [[ self.anim_getrootfunc ]]();
        }
        if (isagent(self)) {
            var_173bdb8ba434651d = 1;
            var_1ed6bbc02282dd5 = "agent_scripted_" + getdvar(@"hash_687fb8f9b7a23245");
            if (archetypeassetloaded(var_1ed6bbc02282dd5)) {
                var_a165f8affea867ac = spawnstruct();
                if (isdefined(org)) {
                    var_a165f8affea867ac.origin = org;
                    var_a165f8affea867ac.angles = angles;
                }
                var_5a0a7dfb51da0682 = getanimname(animation);
                thread namespace_aaebfc23308fe5e4::animscriptmp(var_1ed6bbc02282dd5, "animscripted", var_5a0a7dfb51da0682, undefined, undefined, undefined, var_a165f8affea867ac);
            } else {
                thread namespace_aaebfc23308fe5e4::function_577d8abff6067c23(anime, var_314c4455b996b224, org, angles);
            }
        } else {
            animmode = undefined;
            if (istrue(self.backwards)) {
                animmode = "backwards";
            }
            self animscripted(var_314c4455b996b224, org, angles, animation, animmode, root, goaltime);
        }
    }
    thread start_notetrack_wait(self, var_314c4455b996b224, anime, animname, animation, var_173bdb8ba434651d);
    return getanimlength(animation);
}

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x748
// Size: 0x115
function mp_anim_handle_notetrack(scr_notetrack, guy, var_966821fc90c3ca9d, var_f20e2b3859e05e9f) {
    anim_handle_notetrack(scr_notetrack, guy, var_966821fc90c3ca9d, var_f20e2b3859e05e9f);
    if (isdefined(scr_notetrack["flag"])) {
        if (issharedfuncdefined("game", "gameflagSet")) {
            [[ getsharedfunc("game", "gameflagSet") ]](scr_notetrack["flag"]);
        }
    }
    if (isdefined(scr_notetrack["flag_clear"])) {
        if (issharedfuncdefined("game", "gameflagClear")) {
            [[ getsharedfunc("game", "gameflagClear") ]](scr_notetrack["flag_clear"]);
        }
    }
    if (isdefined(scr_notetrack["sound"])) {
        var_a38dc1947e93b08d = undefined;
        if (!isdefined(scr_notetrack["sound_stays_death"])) {
            var_a38dc1947e93b08d = 1;
        }
        tag = undefined;
        if (isdefined(scr_notetrack["sound_on_tag"])) {
            tag = scr_notetrack["sound_on_tag"];
        }
        if (issharedfuncdefined("game", "gameflagClear")) {
            guy thread [[ getsharedfunc("sound", "playSoundOnTag") ]](scr_notetrack["sound"], tag);
        }
    }
}

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x864
// Size: 0x20
function mp_entity_handle_notetrack(guy, notetrack) {
    if (guy namespace_aca06a2f73bc4246::function_6d9ff7d18e45dc9c(notetrack)) {
        return;
    }
}

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88b
// Size: 0x6e
function anim_player_solo(player, player_rig, anime, tag, var_9e8a16d47a03007a, var_8e3b87acaad3de58) {
    self endon("death");
    players[0] = player;
    player_rigs[0] = player_rig;
    if (!isdefined(var_9e8a16d47a03007a)) {
        var_9e8a16d47a03007a = 0;
    }
    anim_player(players, player_rigs, anime, tag, var_9e8a16d47a03007a, var_8e3b87acaad3de58);
}

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x900
// Size: 0x49
function anim_player(players, player_rigs, anime, tag, var_9e8a16d47a03007a, var_8e3b87acaad3de58) {
    if (!isdefined(var_9e8a16d47a03007a)) {
        var_9e8a16d47a03007a = 0;
    }
    anim_player_internal(players, player_rigs, anime, tag, var_9e8a16d47a03007a, var_8e3b87acaad3de58);
}

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x950
// Size: 0x144
function anim_player_internal(players, player_rigs, anime, tag, var_9e8a16d47a03007a, var_8e3b87acaad3de58) {
    duration = 0;
    foreach (player in players) {
        animname = undefined;
        if (isdefined(var_8e3b87acaad3de58)) {
            animname = var_8e3b87acaad3de58;
        } else {
            animname = player.animname;
        }
        if (isdefined(level.scr_eventanim[animname]) && isdefined(level.scr_eventanim[animname][anime])) {
            duration = player playanimscriptsceneevent("scripted_scene", level.scr_eventanim[animname][anime]);
        }
        if (isdefined(level.scr_viewmodelanim[animname]) && isdefined(level.scr_viewmodelanim[animname][anime]) && !istrue(player.blockviewmodelanim)) {
            player playviewmodelanim(level.scr_viewmodelanim[animname][anime]);
        }
    }
    if (isdefined(player_rigs)) {
        anim_single(player_rigs, anime, tag, var_9e8a16d47a03007a, var_8e3b87acaad3de58);
    }
}

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9b
// Size: 0x93
function function_a871831543fd27ef(var_437b6bb41d98df26, origin, angles) {
    var_f25cb776566aa658 = undefined;
    var_f25cb776566aa658 = function_53c4c53197386572(var_f25cb776566aa658, 0);
    foreach (player in level.players) {
        player playxcam(var_437b6bb41d98df26, var_f25cb776566aa658, origin, angles);
    }
    wait(function_4358b309fdcc6d44(var_437b6bb41d98df26));
}

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb35
// Size: 0x41
function function_3c8f0102ea5254f3(framecount) {
    frametime = 0.0333333 * framecount;
    if (frametime <= 0) {
        /#
            println("<unknown string>" + frametime + "<unknown string>");
        #/
        return;
    }
    wait(frametime);
}

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7d
// Size: 0x122
function function_b9c0db166bfa05de(startorg, startangles) {
    self.oldgoalradius = self.goalradius;
    self.oldpathenemyfightdist = self.pathenemyfightdist;
    self.oldpathenemylookahead = self.pathenemylookahead;
    self.pathenemyfightdist = 0;
    self.pathenemylookahead = 128;
    self pushplayer(1);
    self.nododgemove = 1;
    self.doavoidanceblocking = 0;
    self.fixednodewason = self.fixednode;
    self.fixednode = 0;
    self.var_a4700673c6ef6c4 = self.var_b29c3655b12e292d;
    self.var_b29c3655b12e292d = 0;
    self.ignoreall = 1;
    if (!isdefined(self.scriptedarrivalent)) {
        self.old_disablearrivals = self.disablearrivals;
        self.disablearrivals = 1;
    } else {
        self.scriptedarrivalent.angles = startangles;
        self.scriptedarrivalent.origin = startorg;
    }
    self.reach_goal_pos = undefined;
    return startorg;
}

// Namespace namespace_725871aae3b7bfd4/namespace_4e680905778c0f0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca7
// Size: 0xa5
function function_4e8646c3e9f9ec0a() {
    self pushplayer(0);
    self.nododgemove = 0;
    self.doavoidanceblocking = 1;
    self.fixednode = self.fixednodewason;
    self.fixednodewason = undefined;
    self.var_b29c3655b12e292d = self.var_a4700673c6ef6c4;
    self.var_a4700673c6ef6c4 = undefined;
    self.pathenemyfightdist = self.oldpathenemyfightdist;
    self.pathenemylookahead = self.oldpathenemylookahead;
    self.ignoreall = 0;
    if (isdefined(self.old_disablearrivals)) {
        self.disablearrivals = self.old_disablearrivals;
    }
}

