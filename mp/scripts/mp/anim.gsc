#using scripts\common\anim.gsc;
#using scripts\common\notetrack.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\face.gsc;
#using scripts\anim\notetracks.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\anim\notetracks_mp.gsc;

#namespace anim_mp;

// Namespace anim_mp / scripts\mp\anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ff
// Size: 0x133
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
    anim.callbacks["EntityHandleNotetrackAnimEnd"] = &scripts\anim\notetracks::function_8b5c774e7238fec5;
    anim.callbacks["AIAnimFirstFrame"] = &scripts\asm\shared\mp\utility::ai_anim_first_frame;
    anim.callbacks["playXcam"] = &play_xcam;
}

// Namespace anim_mp / scripts\mp\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x43a
// Size: 0x23
function play_sound_at_viewheight(aliasname, notification_string, var_a68adbd3eefe9282) {
    self playsound(aliasname);
}

// Namespace anim_mp / scripts\mp\anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x465
// Size: 0x4
function should_do_anim() {
    return true;
}

// Namespace anim_mp / scripts\mp\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x472
// Size: 0x96
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
        return;
    }
    if (isplayer(self)) {
        self setorigin(origin);
        self setplayerangles(angles);
        return;
    }
    self.origin = origin;
    self.angles = angles;
    self dontinterpolate();
}

// Namespace anim_mp / scripts\mp\anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x510
// Size: 0x56
function function_c606ca98a77e09ca() {
    canteleport = 1;
    if (isdefined(self.vehiclename)) {
        switch (self.vehiclename) {
        case #"hash_2289ec11d77bce8f":
        case #"hash_56979e0566996b2e":
        case #"hash_d849f9d4eaa9ed93":
            canteleport = 0;
            break;
        }
    }
    return canteleport;
}

// Namespace anim_mp / scripts\mp\anim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x56f
// Size: 0x34
function do_facial_anim(DoFacialAnim, var_9ac73a1996d2dae, DoAnimation, anime, animname, dialogue) {
    return false;
}

// Namespace anim_mp / scripts\mp\anim
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x5ac
// Size: 0x20b
function do_animation(org, angles, animname, anime, anim_string, idleanim, var_43e50904d011917e) {
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
        self setflaggedanim(anim_string, animation, 1, goaltime);
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
                scripted_node = spawnstruct();
                if (isdefined(org)) {
                    scripted_node.origin = org;
                    scripted_node.angles = angles;
                }
                var_5a0a7dfb51da0682 = getanimname(animation);
                thread scripts\asm\shared\mp\utility::animscriptmp(var_1ed6bbc02282dd5, "animscripted", var_5a0a7dfb51da0682, undefined, undefined, undefined, scripted_node);
            } else {
                thread scripts\asm\shared\mp\utility::function_577d8abff6067c23(anime, anim_string, org, angles);
            }
        } else {
            animmode = undefined;
            if (istrue(self.backwards)) {
                animmode = "backwards";
            }
            self animscripted(anim_string, org, angles, animation, animmode, root, goaltime);
        }
    }
    thread start_notetrack_wait(self, anim_string, anime, animname, animation, var_173bdb8ba434651d);
    return getanimlength(animation);
}

// Namespace anim_mp / scripts\mp\anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7c0
// Size: 0x114
function mp_anim_handle_notetrack(scr_notetrack, guy, var_966821fc90c3ca9d, tag_owner) {
    anim_handle_notetrack(scr_notetrack, guy, var_966821fc90c3ca9d, tag_owner);
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

// Namespace anim_mp / scripts\mp\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8dc
// Size: 0x1f
function mp_entity_handle_notetrack(guy, notetrack) {
    if (guy scripts\anim\notetracks_mp::function_6d9ff7d18e45dc9c(notetrack)) {
        return;
    }
}

// Namespace anim_mp / scripts\mp\anim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x903
// Size: 0x6d
function anim_player_solo(player, player_rig, anime, tag, var_9e8a16d47a03007a, animname_override) {
    self endon("death");
    players[0] = player;
    player_rigs[0] = player_rig;
    if (!isdefined(var_9e8a16d47a03007a)) {
        var_9e8a16d47a03007a = 0;
    }
    anim_player(players, player_rigs, anime, tag, var_9e8a16d47a03007a, animname_override);
}

// Namespace anim_mp / scripts\mp\anim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x978
// Size: 0x48
function anim_player(players, player_rigs, anime, tag, var_9e8a16d47a03007a, animname_override) {
    if (!isdefined(var_9e8a16d47a03007a)) {
        var_9e8a16d47a03007a = 0;
    }
    anim_player_internal(players, player_rigs, anime, tag, var_9e8a16d47a03007a, animname_override);
}

// Namespace anim_mp / scripts\mp\anim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x9c8
// Size: 0x14f
function anim_player_internal(players, player_rigs, anime, tag, var_9e8a16d47a03007a, animname_override) {
    duration = 0;
    foreach (player in players) {
        animname = undefined;
        if (isdefined(animname_override)) {
            animname = animname_override;
        } else {
            animname = player.animname;
        }
        if (isdefined(level.scr_eventanim[animname]) && isdefined(level.scr_eventanim[animname][anime])) {
            duration = player playanimscriptsceneevent("scripted_scene", level.scr_eventanim[animname][anime]);
        }
        if (isdefined(level.scr_viewmodelanim[animname]) && isdefined(level.scr_viewmodelanim[animname][anime]) && !istrue(player.blockviewmodelanim)) {
            duration = player playviewmodelanim(level.scr_viewmodelanim[animname][anime]);
            /#
                player notify("<dev string:x1c>", anime, duration);
            #/
        }
    }
    if (isdefined(player_rigs)) {
        anim_single(player_rigs, anime, tag, var_9e8a16d47a03007a, animname_override);
    }
}

// Namespace anim_mp / scripts\mp\anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb1f
// Size: 0x90
function play_xcam(xcamasset, origin, angles) {
    camnum = undefined;
    camnum = default_to(camnum, 0);
    foreach (player in level.players) {
        player playxcam(xcamasset, camnum, origin, angles);
    }
    wait getxcamlength(xcamasset);
}

// Namespace anim_mp / scripts\mp\anim
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbb7
// Size: 0x41
function function_3c8f0102ea5254f3(framecount) {
    frametime = 0.0333333 * framecount;
    if (frametime <= 0) {
        println("<dev string:x3a>" + frametime + "<dev string:x54>");
        return;
    }
    wait frametime;
}

// Namespace anim_mp / scripts\mp\anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc00
// Size: 0x121
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

// Namespace anim_mp / scripts\mp\anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd2a
// Size: 0xa4
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

