// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_703f8388035ace89;

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e8
// Size: 0x1b7
function init() {
    level._effect["flashpoint_kill_s2"] = loadfx("vfx/iw8_mp/flashpoint/vfx_fp_gunfight_s2.vfx");
    level._effect["flashpoint_pulse_friendly"] = loadfx("vfx/iw8_mp/flashpoint/vfx_fp_pulse_friendly.vfx");
    level._effect["flashpoint_pulse_squad"] = loadfx("vfx/iw8_mp/flashpoint/vfx_fp_pulse_squad.vfx");
    level._effect["flashpoint_pulse_enemy"] = loadfx("vfx/iw8_mp/flashpoint/vfx_fp_pulse_enemy.vfx");
    var_90d2fed9a87f1697 = getdvar(@"hash_67b0bcf9de3df0b0", 0);
    level.flashpoint_objectives = getdvar(@"hash_9f66fbd7bb66e22c", 0) == "1";
    level.iconflashpointfriendly = "icon_swords_friendly";
    level.iconflashpointenemy = "icon_swords_enemy";
    level.iconflashpointcontested = "icon_swords_contested";
    level.iconflashpointneutral = "icon_swords_neutral";
    level.flashpoint_struct = spawnstruct();
    level.flashpoint_struct.flashpoints = [];
    level.flashpointdebugactive = getdvarint(@"hash_9f7206466118e24c", 0);
    if (istrue(level.flashpoint_usebigmapsettings)) {
        level.flashpointmindist = 16777216;
    } else {
        level.flashpointmindist = 4194304;
    }
    if (0 || var_90d2fed9a87f1697 == "1") {
        thread flashpoint_systemthink();
        level.flashpointactive = 1;
        /#
            setdevdvar(@"hash_67b0bcf9de3df0b0", 1);
        #/
    } else {
        /#
            setdevdvar(@"hash_67b0bcf9de3df0b0", 0);
        #/
        level.flashpointactive = 0;
    }
    thread flashpoint_systemtoggle();
    /#
        if (istrue(level.flashpointdebugactive)) {
            function_34b4ca8a02efb2cc();
        }
    #/
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a6
// Size: 0x129
function flashpoint_systemtoggle() {
    while (1) {
        if (getdvar(@"hash_67b0bcf9de3df0b0", 0) != "0") {
            if (level.flashpoint_objectives) {
                thread flashpoint_systemthink();
            }
            level.flashpointactive = 1;
            foreach (player in level.players) {
                if (!isdefined(player.flashpoint_trackingevents)) {
                    flashpoint_trackplayerevents(player);
                }
            }
        } else {
            level notify("disable_flashpoint");
            level.flashpointactive = 0;
            if (level.flashpoint_objectives) {
                foreach (var_703f8388035ace89 in level.flashpoint_struct.flashpoints) {
                    flashpoint_shutdown(var_703f8388035ace89);
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d6
// Size: 0x1ca
function flashpoint_systemthink() {
    level endon("disable_flashpoint");
    while (1) {
        foreach (var_703f8388035ace89 in level.flashpoint_struct.flashpoints) {
            var_4df1e1a017254690 = gettime();
            if (var_4df1e1a017254690 - var_703f8388035ace89.lasteventtime > 12500) {
                flashpoint_shutdown(var_703f8388035ace89);
            } else {
                if (isdefined(var_703f8388035ace89.objective) && var_4df1e1a017254690 - var_703f8388035ace89.lasteventtime >= 7500 && !istrue(var_703f8388035ace89.endingsoon)) {
                    flashpoint_endingsoon(var_703f8388035ace89);
                }
                keys = getarraykeys(var_703f8388035ace89.events);
                foreach (key in keys) {
                    if (var_4df1e1a017254690 - key > 12500) {
                        var_703f8388035ace89.events = array_remove_key(var_703f8388035ace89.events, key);
                    }
                }
            }
        }
        foreach (player in level.players) {
            if (!isdefined(player.flashpoint_trackingevents)) {
                thread flashpoint_trackplayerevents(player);
            }
        }
        wait(1);
    }
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a7
// Size: 0x231
function flashpoint_processnewevent(attacker, victim, time, eventtype) {
    if (!level.flashpointactive) {
        return;
    }
    var_5856c0b118701a9f = (0, 0, 0);
    if (0) {
        var_5856c0b118701a9f = (randomfloatrange(-1000, 1000), randomfloatrange(-1000, 1000), 0);
    }
    if (eventtype == "gunfire") {
        origin = attacker.origin + (0, 0, 32);
        if (0) {
            origin = origin + var_5856c0b118701a9f;
        }
        thread playvfx(origin, "flashpoint_kill_s2");
    } else {
        origin = (0, 0, 0);
        if (level.flashpoint_objectives) {
            origin = vectorlerp(attacker.origin + (0, 0, 48), victim.origin + (0, 0, 48), 0.25);
        } else {
            origin = victim.origin + (0, 0, 48);
        }
        if (0) {
            origin = origin + var_5856c0b118701a9f;
        }
        if (level.flashpoint_objectives) {
            ent = spawn("script_model", origin);
            var_a618a20a42198fa1 = ent array_sort_with_func(level.flashpoint_struct.flashpoints, &sortlocationsbydistance);
            ent delete();
            foreach (var_703f8388035ace89 in var_a618a20a42198fa1) {
                if (distancesquared(var_703f8388035ace89.curorigin, origin) < level.flashpointmindist) {
                    flashpoint_updatepoint(var_703f8388035ace89, origin, time, eventtype);
                    return;
                }
            }
            if (level.flashpoint_struct.flashpoints.size >= 2) {
                flashpoint_clearoldestpoint();
            }
            flashpoint_createnew(origin, time, eventtype);
        }
        thread playvfx(origin, "flashpoint_kill_s2");
    }
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9df
// Size: 0x8b
function flashpoint_createnew(origin, time, eventtype) {
    var_703f8388035ace89 = spawnstruct();
    var_703f8388035ace89.curorigin = origin;
    var_703f8388035ace89.lasteventtime = time;
    var_703f8388035ace89.team = "";
    flashpoint_addeventtoqueue(var_703f8388035ace89, time, eventtype);
    level.flashpoint_struct.flashpoints[level.flashpoint_struct.flashpoints.size] = var_703f8388035ace89;
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa71
// Size: 0xd0
function flashpoint_createmarker(var_703f8388035ace89) {
    var_703f8388035ace89.objective = namespace_19b4203b51d56488::createobjidobject(var_703f8388035ace89.curorigin, "neutral", (0, 0, 0), undefined, "any");
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_703f8388035ace89.objective.objidnum, 0);
    var_703f8388035ace89.objective.lockupdatingicons = 0;
    namespace_5a22b6f3a56f7e9b::update_objective_icon(var_703f8388035ace89.objective.objidnum, level.iconflashpointneutral);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(var_703f8388035ace89.objective.objidnum, 2);
    var_703f8388035ace89.objective.lockupdatingicons = 1;
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb48
// Size: 0xf9
function flashpoint_updatepoint(var_703f8388035ace89, var_6fc81b511db04699, time, eventtype) {
    var_703f8388035ace89 notify("end_update");
    var_703f8388035ace89 endon("end_update");
    level endon("disable_flashpoint");
    if (!isdefined(var_703f8388035ace89.objective) && var_703f8388035ace89.events.size >= 5) {
        flashpoint_createmarker(var_703f8388035ace89);
    }
    var_703f8388035ace89.endingsoon = 0;
    var_703f8388035ace89.lasteventtime = gettime();
    if (isdefined(var_703f8388035ace89.objective) && level.flashpoint_objectives) {
        namespace_5a22b6f3a56f7e9b::objective_set_pulsate(var_703f8388035ace89.objective.objidnum, 0);
    } else {
        var_703f8388035ace89.curorigin = vectorlerp(var_703f8388035ace89.curorigin, var_6fc81b511db04699, 0.75);
    }
    thread playvfx(var_6fc81b511db04699, "flashpoint_kill_s2");
    flashpoint_addeventtoqueue(var_703f8388035ace89, time, eventtype);
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc48
// Size: 0xea
function flashpoint_addeventtoqueue(var_703f8388035ace89, time, eventtype) {
    if (!isdefined(var_703f8388035ace89.events)) {
        var_703f8388035ace89.events = [];
    }
    var_703f8388035ace89.events[time] = eventtype;
    if (var_703f8388035ace89.events.size > 8) {
        var_8054fa0b4941d3ff = [];
        i = 0;
        foreach (index, event in var_703f8388035ace89.events) {
            if (i > var_703f8388035ace89.events.size - 8) {
                var_8054fa0b4941d3ff[index] = event;
            }
            i++;
        }
        var_703f8388035ace89.events = var_8054fa0b4941d3ff;
    }
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd39
// Size: 0xad
function flashpoint_shutdown(var_703f8388035ace89) {
    var_703f8388035ace89 notify("end_update");
    if (isdefined(var_703f8388035ace89.objective) && level.flashpoint_objectives) {
        var_703f8388035ace89.objective namespace_19b4203b51d56488::setvisibleteam("none");
        var_703f8388035ace89.objective namespace_19b4203b51d56488::releaseid();
        var_703f8388035ace89.objective.visibleteam = "none";
        var_703f8388035ace89.objective = undefined;
    }
    level.flashpoint_struct.flashpoints = array_remove(level.flashpoint_struct.flashpoints, var_703f8388035ace89);
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xded
// Size: 0x44
function flashpoint_endingsoon(var_703f8388035ace89) {
    var_703f8388035ace89.endingsoon = 1;
    if (level.flashpoint_objectives) {
        namespace_5a22b6f3a56f7e9b::objective_set_pulsate(var_703f8388035ace89.objective.objidnum, 1);
    }
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe38
// Size: 0x27f
function flashpoint_checkforownerupdate(var_703f8388035ace89) {
    var_f46de3669e2acd79 = 0;
    allieskills = 0;
    var_2dc841aff232fb90 = "No Change";
    var_ab2d6f4cba464964 = var_703f8388035ace89.team;
    foreach (event in var_703f8388035ace89.events) {
        if (event == "kill_by_axis") {
            var_f46de3669e2acd79++;
        } else if (event == "kill_by_allies") {
            allieskills++;
        }
    }
    if ((var_f46de3669e2acd79 - 1 > allieskills || allieskills == 0) && var_703f8388035ace89.team != "axis" && var_f46de3669e2acd79 != 0) {
        if (level.flashpoint_objectives) {
            namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(var_703f8388035ace89.objidnum, "axis");
            namespace_5a22b6f3a56f7e9b::update_objective_sethot(var_703f8388035ace89.objidnum, 0);
        }
        var_703f8388035ace89.team = "axis";
        var_2dc841aff232fb90 = "Switch To Axis Owner";
    } else if ((allieskills - 1 > var_f46de3669e2acd79 || var_f46de3669e2acd79 == 0) && var_703f8388035ace89.team != "allies" && allieskills != 0) {
        if (level.flashpoint_objectives) {
            namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(var_703f8388035ace89.objidnum, "allies");
            namespace_5a22b6f3a56f7e9b::update_objective_sethot(var_703f8388035ace89.objidnum, 0);
        }
        var_703f8388035ace89.team = "allies";
        var_2dc841aff232fb90 = "Switch To Allies Owner";
    } else if (var_703f8388035ace89.team != "neutral" && allieskills != 0 && var_f46de3669e2acd79 != 0) {
        if (level.flashpoint_objectives) {
            namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(var_703f8388035ace89.objidnum, undefined);
            namespace_5a22b6f3a56f7e9b::update_objective_sethot(var_703f8388035ace89.objidnum, 1);
        }
        var_703f8388035ace89.team = "neutral";
        var_2dc841aff232fb90 = "Switch To Contested";
    }
    /#
        if (0) {
            println("Switch To Allies Owner");
            println("<unknown string>");
            println("<unknown string>" + var_ab2d6f4cba464964);
            println("<unknown string>" + var_2dc841aff232fb90);
            println("<unknown string>" + var_f46de3669e2acd79);
            println("<unknown string>" + allieskills);
            println("Switch To Allies Owner");
        }
    #/
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10be
// Size: 0x47
function sortlocationsbydistance(var_fcf7e6e6d8c4861, var_fcf7b6e6d8c41c8) {
    return distancesquared(var_fcf7e6e6d8c4861.curorigin, self.origin) < distancesquared(var_fcf7b6e6d8c41c8.curorigin, self.origin);
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110d
// Size: 0xbe
function flashpoint_clearoldestpoint() {
    var_fcdee31281119324 = undefined;
    foreach (var_703f8388035ace89 in level.flashpoint_struct.flashpoints) {
        if (!isdefined(var_fcdee31281119324)) {
            var_fcdee31281119324 = var_703f8388035ace89;
        } else if (var_703f8388035ace89.lasteventtime > var_fcdee31281119324.lasteventtime) {
            var_fcdee31281119324 = var_703f8388035ace89;
        }
    }
    /#
        if (0) {
            println("<unknown string>");
            println("<unknown string>");
            println("<unknown string>");
        }
    #/
    flashpoint_shutdown(var_fcdee31281119324);
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11d2
// Size: 0x15d
function function_34b4ca8a02efb2cc() {
    /#
        while (1) {
            if (level.flashpointdebugactive == 1) {
                origin = (randomfloatrange(0, 7000), randomfloatrange(0, 7000), randomfloatrange(100, 500));
                thread playvfx(origin, "<unknown string>");
                for (i = 0; i < 10; i++) {
                    thread playvfx((47318 + randomfloatrange(-1024, 1024), -10783 + randomfloatrange(-1024, 1024), 160 + randomfloatrange(-100, 100)), "<unknown string>");
                    wait(randomfloatrange(0.01, 0.05));
                }
            } else if (level.flashpointdebugactive == 2) {
                thread playvfx((7000, 7000, 100), "<unknown string>");
                thread playvfx((-7000, 7000, 100), "<unknown string>");
                thread playvfx((7000, -7000, 100), "<unknown string>");
                thread playvfx((-7000, -7000, 100), "<unknown string>");
            }
            origin = (0, 0, 100);
            thread playvfx(origin, "<unknown string>");
            waittime = 1.1;
            wait(waittime);
        }
    #/
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1336
// Size: 0x22
function playvfx(origin, effect) {
    playfx(getfx(effect), origin);
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135f
// Size: 0x57
function flashpoint_trackplayerevents(player) {
    player endon("disconnect");
    level endon("disable_flashpoint");
    player.flashpoint_trackingevents = 1;
    while (1) {
        player waittill("begin_firing");
        wait(1);
        flashpoint_processnewevent(player, undefined, gettime(), "gunfire");
        wait(0.25);
    }
}

// Namespace namespace_703f8388035ace89/namespace_8af839578a30040a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bd
// Size: 0x12b
function flashpoint_spawnselectionvfx() {
    self endon("disconnect");
    self notify("start_SpawnSelectionThink");
    self endon("start_SpawnSelectionThink");
    while (self.inspawnselection) {
        foreach (player in level.players) {
            if (!isalive(player)) {
                continue;
            }
            if (self.team != player.team) {
                if (istrue(level.spawnselectionshowenemy)) {
                    playfxontagforclients(level._effect["flashpoint_pulse_enemy"], player, "tag_eye", self);
                }
            } else if (istrue(level.spawnselectionshowfriendly)) {
                if (self.var_ff97225579de16a == player.var_ff97225579de16a) {
                    playfxontagforclients(level._effect["flashpoint_pulse_squad"], player, "tag_eye", self);
                } else {
                    playfxontagforclients(level._effect["flashpoint_pulse_friendly"], player, "tag_eye", self);
                }
            }
        }
        wait(1.1);
    }
}

