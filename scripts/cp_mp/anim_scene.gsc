// mwiii decomp prototype
#using scripts\common\anim.gsc;
#using scripts\common\notetrack.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\anim\face.gsc;

#namespace anim_scene;

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a
// Size: 0x157
function anim_scene_create_actor(entity, animname, is_player, player_rig_visible, disable_weapons, var_fdfaf00190efaf80) {
    actor = spawnstruct();
    actor.entity = entity;
    actor.animname = animname;
    actor.interruptable = 0;
    actor.interrupted = 0;
    actor.endscene = 0;
    actor.forceendscene = 0;
    if (isdefined(is_player) && is_player) {
        actor.is_player = is_player;
        if (isdefined(player_rig_visible)) {
            actor.player_rig_visible = player_rig_visible;
        } else {
            actor.player_rig_visible = 1;
        }
        if (isdefined(disable_weapons)) {
            actor.disable_weapons = disable_weapons;
        } else {
            actor.disable_weapons = 1;
        }
        if (isdefined(var_fdfaf00190efaf80)) {
            actor.var_fdfaf00190efaf80 = var_fdfaf00190efaf80;
        } else {
            actor.var_fdfaf00190efaf80 = 0;
        }
    } else {
        actor.is_player = 0;
        actor.entity.animname = actor.animname;
        actor.entity useanimtree(%script_model);
    }
    return actor;
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3b9
// Size: 0x51
function anim_scene_set_actor_interruptable(var_9c5feb9c7ef9892d, interrupt_anime, first_frame) {
    self.interruptable = var_9c5feb9c7ef9892d;
    if (isdefined(interrupt_anime)) {
        self.interrupt_anime = interrupt_anime;
        if (isdefined(first_frame)) {
            self.interrupt_first_frame = first_frame;
        } else {
            self.interrupt_first_frame = 0;
        }
    }
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x411
// Size: 0xd6
function anim_scene(actors, anime, start_scene, var_c502534a60e19429, tag, blend_in_time, var_aa3247c3c61f5e1c, var_e1c732b6f63f3e8b) {
    foreach (actor in actors) {
        actor.interrupted = 0;
        actor.endscene = 0;
    }
    result = _anim_scene_internal(actors, anime, 0, tag, start_scene, var_c502534a60e19429, blend_in_time, var_aa3247c3c61f5e1c, var_e1c732b6f63f3e8b);
    if (isdefined(result) && result) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x4ee
// Size: 0x11c
function anim_scene_loop(actors, anime, start_scene, var_c502534a60e19429, tag, blend_in_time, var_aa3247c3c61f5e1c, var_e1c732b6f63f3e8b) {
    foreach (actor in actors) {
        actor.interrupted = 0;
        actor.endscene = 0;
    }
    _anim_scene_internal(actors, anime, 1, tag, start_scene, var_c502534a60e19429, blend_in_time, var_aa3247c3c61f5e1c, var_e1c732b6f63f3e8b);
    var_b51b919d4c5e5691 = 1;
    foreach (actor in actors) {
        if (!actor.endscene) {
            var_b51b919d4c5e5691 = 0;
            break;
        }
    }
    return var_b51b919d4c5e5691;
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x612
// Size: 0x29
function anim_scene_stop(var_ec951e7a56c0f445) {
    if (isdefined(var_ec951e7a56c0f445) && var_ec951e7a56c0f445) {
        self notify("anim_scene_force_end");
    } else {
        self notify("stop_scene");
    }
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x642
// Size: 0x1a
function anim_scene_stop_actor(actor) {
    actor.endscene = 1;
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x663
// Size: 0x2c3
function _anim_scene_internal(actors, anime, looping, tag, start_scene, var_c502534a60e19429, blend_in_time, var_aa3247c3c61f5e1c, var_e1c732b6f63f3e8b) {
    self endon("anim_scene_interrupted");
    if (!isdefined(start_scene)) {
        start_scene = 1;
    }
    if (!isdefined(var_c502534a60e19429)) {
        var_c502534a60e19429 = 1;
    }
    /#
        /#
            assert(isarray(actors));
        #/
        foreach (actor in actors) {
            /#
                assertex(isstruct(actor), "<unknown string>");
            #/
            /#
                assertex(isdefined(actor.entity), "<unknown string>");
            #/
            /#
                assertex(!actor.is_player || isalive(actor.entity) && !isdefined(actor.entity.fauxdead), "<unknown string>");
            #/
        }
        if (!var_c502534a60e19429 && !looping) {
            function_a3ec83bacb1ebf0f(actors, anime);
        }
    #/
    thread _anim_scene_ender_think(actors);
    thread _anim_scene_force_end_think(actors);
    var_20d060c0d2ee7de0 = 0;
    thread _anim_scene_interrupt_think(actors, tag, var_c502534a60e19429);
    if (start_scene) {
        if (!isdefined(blend_in_time)) {
            blend_in_time = 0.4;
        }
        if (!isdefined(var_aa3247c3c61f5e1c)) {
            var_aa3247c3c61f5e1c = 0.8;
        }
        _anim_scene_internal_blend_in(actors, anime, tag, blend_in_time, var_e1c732b6f63f3e8b);
        _anim_scene_internal_finish_blend(actors, blend_in_time, var_aa3247c3c61f5e1c);
    }
    _anim_scene_internal_start_anims(actors, anime, looping, tag);
    if (!looping) {
        foreach (actor in actors) {
            actor.animduration = _anim_scene_internal_get_anim_duration(actor, anime);
            if (actor.animduration > var_20d060c0d2ee7de0) {
                var_20d060c0d2ee7de0 = actor.animduration;
            }
        }
        foreach (actor in actors) {
            if (actor.animduration < var_20d060c0d2ee7de0) {
                thread _anim_scene_actor_end_interrupt_think(actor);
            }
        }
    }
    if (looping) {
        self waittill("never");
    } else {
        wait(var_20d060c0d2ee7de0);
    }
    waittillframeend();
    self notify("anim_scene_success");
    if (var_c502534a60e19429) {
        _anim_scene_internal_end(actors);
    }
    return 1;
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92e
// Size: 0x244
function _anim_scene_internal_blend_in(actors, anime, tag, blend_in_time, var_e1c732b6f63f3e8b) {
    foreach (actor in actors) {
        if (actor.is_player) {
            if (istrue(var_e1c732b6f63f3e8b)) {
                var_486db5fa512a3b6b = "viewhands_base_iw8";
                actor.player_rig = spawn("script_model", actor.entity.origin);
                actor.player_rig setmodel(var_486db5fa512a3b6b);
                actor.player_rig.animname = actor.animname;
                actor.player_rig useanimtree(%script_model);
                actor.player_rig hide();
            } else {
                actor.player_rig = spawn("script_arms", actor.entity.origin, 0, 0, actor.entity);
                actor.player_rig.animname = actor.animname;
                actor.player_rig useanimtree(%script_model);
                actor.player_rig hide();
                actor.player_rig.entity = actor.entity;
            }
            anim_first_frame_solo(actor.player_rig, anime, tag);
            actor.entity setstance(get_actor_stance(actor));
            actor.entity playerlinktoblend(actor.player_rig, "tag_player", blend_in_time, 0, 0, 1, 1, actor.var_fdfaf00190efaf80);
            if (actor.disable_weapons) {
                actor.entity val::set("anim_scene", "weapon", 0);
            }
        }
    }
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb79
// Size: 0x40
function get_actor_stance(actor) {
    if (isdefined(actor.entity.anim_scene_stance_override)) {
        return actor.entity.anim_scene_stance_override;
    }
    return "stand";
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc1
// Size: 0x1d6
function _anim_scene_internal_finish_blend(actors, blend_in_time, var_aa3247c3c61f5e1c) {
    var_119ff7e589190b4b = var_aa3247c3c61f5e1c - blend_in_time;
    if (var_119ff7e589190b4b > 0) {
        wait(blend_in_time);
        foreach (actor in actors) {
            if (actor.interrupted) {
                continue;
            }
            if (actor.is_player) {
                actor.entity playerlinktodelta(actor.player_rig, "tag_player", 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, actor.var_fdfaf00190efaf80);
            }
        }
        wait(var_119ff7e589190b4b);
        foreach (actor in actors) {
            if (actor.interrupted) {
                continue;
            }
            if (actor.is_player) {
            }
        }
    } else {
        wait(blend_in_time);
        foreach (actor in actors) {
            if (actor.interrupted) {
                continue;
            }
            if (actor.is_player) {
                actor.entity playerlinktodelta(actor.player_rig, "tag_player", 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, actor.var_fdfaf00190efaf80);
            }
        }
    }
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9e
// Size: 0x97
function _anim_scene_internal_get_anim_duration(actor, anime) {
    var_20d060c0d2ee7de0 = 0;
    if (actor.is_player) {
        var_a0b4be40585bbded = getanimlength(level.scr_anim[actor.player_rig.animname][anime]);
        if (var_a0b4be40585bbded > var_20d060c0d2ee7de0) {
            var_20d060c0d2ee7de0 = var_a0b4be40585bbded;
        }
    } else {
        var_a0b4be40585bbded = getanimlength(level.scr_anim[actor.animname][anime]);
        if (var_a0b4be40585bbded > var_20d060c0d2ee7de0) {
            var_20d060c0d2ee7de0 = var_a0b4be40585bbded;
        }
    }
    return var_20d060c0d2ee7de0;
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3d
// Size: 0x3a1
function _anim_scene_internal_start_anims(actors, anime, looping, tag) {
    foreach (actor in actors) {
        if (actor.interrupted) {
            continue;
        }
        if (actor.is_player) {
            if (looping) {
                /#
                    assertex(isarray(level.scr_eventanim[actor.animname][anime]) && level.scr_eventanim[actor.animname][anime].size == 1, "anim_scene -- the animation entry for level.scr_eventAnim[ " + actor.animname + " ][ " + anime + " ] needs to be an array of size 1 for looping anims. This is to keep parity with common anim scripts.");
                #/
                actor.entity playanimscriptsceneevent("scripted_scene", level.scr_eventanim[actor.animname][anime][0]);
            } else {
                /#
                    assertex(!isarray(level.scr_eventanim[actor.animname][anime]), "anim_scene -- the animation entry for level.scr_eventAnim[ " + actor.animname + " ][ " + anime + " ] cannot be an array for non-looping anims.");
                #/
                actor.entity playanimscriptsceneevent("scripted_scene", level.scr_eventanim[actor.animname][anime]);
            }
            if (isdefined(level.scr_viewmodelanim[actor.animname]) && isdefined(level.scr_viewmodelanim[actor.animname][anime]) && !istrue(actor.entity.blockviewmodelanim)) {
                if (looping) {
                    /#
                        assertex(isarray(level.scr_viewmodelanim[actor.animname][anime]) && level.scr_viewmodelanim[actor.animname][anime].size == 1, "anim_scene -- the animation entry for level.scr_viewmodelAnim[ " + actor.animname + " ][ " + anime + " ] needs to be an array of size 1 for looping anims. This is to keep parity with common anim scripts.");
                    #/
                    actor.entity playviewmodelanim(level.scr_viewmodelanim[actor.animname][anime][0]);
                } else {
                    /#
                        assertex(!isarray(level.scr_viewmodelanim[actor.animname][anime]), "anim_scene -- the animation entry for level.scr_viewmodelAnim[ " + actor.animname + " ][ " + anime + " ] cannot be an array for non-looping anims.");
                    #/
                    actor.entity playviewmodelanim(level.scr_viewmodelanim[actor.animname][anime]);
                }
            }
            if (actor.player_rig_visible && isdefined(actor.player_rig) && !actor.entity getcamerathirdperson()) {
                actor.player_rig showonlytoplayer(actor.entity);
            }
            if (looping) {
                thread anim_loop_solo(actor.player_rig, anime, "stop_scene", tag);
            } else {
                thread anim_single_solo(actor.player_rig, anime, tag);
            }
        } else if (looping) {
            thread anim_loop_solo(actor.entity, anime, "stop_scene", tag);
        } else {
            thread anim_single_solo(actor.entity, anime, tag);
        }
    }
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e5
// Size: 0xb4
function _anim_scene_internal_end(actors) {
    foreach (actor in actors) {
        if (actor.interrupted) {
            continue;
        }
        if (actor.is_player) {
            actor.entity val::function_c9d0b43701bdba00("anim_scene");
            actor.entity unlink();
            actor.player_rig delete();
            actor.player_rig = undefined;
        }
    }
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a0
// Size: 0x75
function _anim_scene_ender_think(actors) {
    self endon("anim_scene_success");
    self endon("anim_scene_interrupted");
    self waittill("stop_scene");
    foreach (actor in actors) {
        actor.endscene = 1;
    }
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131c
// Size: 0x75
function _anim_scene_force_end_think(actors) {
    self endon("anim_scene_success");
    self endon("anim_scene_interrupted");
    self waittill("anim_scene_force_end");
    foreach (actor in actors) {
        actor.forceendscene = 1;
    }
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1398
// Size: 0x42
function _anim_scene_actor_end_interrupt_think(actor) {
    self endon("anim_scene_success");
    self endon("anim_scene_interrupted");
    wait(actor.animduration);
    if (!actor.interrupted) {
        actor.endscene = 1;
    }
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e1
// Size: 0x403
function _anim_scene_interrupt_think(actors, tag, var_c502534a60e19429) {
    self endon("anim_scene_success");
    self endon("anim_scene_interrupted");
    while (1) {
        interrupted = 0;
        while (1) {
            wait(0.05);
            foreach (actor in actors) {
                if (actor.endscene || actor.forceendscene || !isdefined(actor.entity) || actor.is_player && !isalive(actor.entity) || actor.is_player && isdefined(actor.entity.fauxdead)) {
                    if (!actor.interrupted) {
                        interrupted = 1;
                        break;
                    }
                }
            }
            if (interrupted) {
                break;
            }
        }
        var_c37d8d58474be788 = 1;
        foreach (actor in actors) {
            var_4c28ed808c01983c = 0;
            if (!isdefined(actor.entity) || actor.is_player && !isalive(actor.entity) || actor.is_player && isdefined(actor.entity.fauxdead)) {
                var_4c28ed808c01983c = 1;
            }
            if (!var_4c28ed808c01983c && !actor.endscene && !actor.forceendscene && !actor.interruptable) {
                var_c37d8d58474be788 = 0;
            } else {
                actor.interrupted = 1;
                if (var_4c28ed808c01983c && !actor.is_player) {
                    continue;
                }
                if (actor.is_player) {
                    if ((var_c502534a60e19429 || actor.forceendscene) && !var_4c28ed808c01983c) {
                        actor.entity val::function_c9d0b43701bdba00("anim_scene");
                        actor.entity stopanimscriptsceneevent();
                        actor.entity unlink();
                        actor.entity setorigin(actor.entity.origin + (0, 0, 1));
                    }
                    if (var_c502534a60e19429 || actor.forceendscene || var_4c28ed808c01983c) {
                        if (isent(actor.player_rig)) {
                            actor.player_rig delete();
                            actor.player_rig = undefined;
                        }
                    }
                } else if (isdefined(actor.interrupt_anime)) {
                    if (actor.interrupt_first_frame) {
                        thread anim_first_frame_solo(actor.entity, actor.interrupt_anime, tag);
                    } else {
                        actor.entity stopanimscripted();
                        thread anim_single_solo(actor.entity, actor.interrupt_anime, tag);
                    }
                } else {
                    actor.entity stopanimscripted();
                    if (is_equal(actor.entity.classname, "script_model") || is_equal(actor.entity.code_classname, "script_model")) {
                        actor.entity scriptmodelclearanim();
                    }
                }
            }
        }
        if (var_c37d8d58474be788) {
            self notify("anim_scene_interrupted");
            return;
        }
    }
}

// Namespace anim_scene/namespace_f118adcc06856afc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17eb
// Size: 0x8e
function function_a3ec83bacb1ebf0f(actors, anime) {
    /#
        scenelength = 0;
        for (i = 0; i < actors.size; i++) {
            actor = actors[i];
            var_a0b4be40585bbded = getanimlength(level.scr_anim[actor.animname][anime]);
            if (i == 0) {
                scenelength = var_a0b4be40585bbded;
            } else if (var_a0b4be40585bbded != scenelength) {
                iprintlnbold("<unknown string>");
            }
        }
    #/
}

