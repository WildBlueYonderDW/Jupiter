#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace flashpoint;

// Namespace flashpoint / scripts\mp\flashpoint
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e8
// Size: 0x1b6
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

// Namespace flashpoint / scripts\mp\flashpoint
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a6
// Size: 0x128
function flashpoint_systemtoggle() {
    while (true) {
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
                foreach (flashpoint in level.flashpoint_struct.flashpoints) {
                    flashpoint_shutdown(flashpoint);
                }
            }
        }
        wait 1;
    }
}

// Namespace flashpoint / scripts\mp\flashpoint
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d6
// Size: 0x1c9
function flashpoint_systemthink() {
    level endon("disable_flashpoint");
    while (true) {
        foreach (flashpoint in level.flashpoint_struct.flashpoints) {
            timenow = gettime();
            if (timenow - flashpoint.lasteventtime > 12500) {
                flashpoint_shutdown(flashpoint);
                continue;
            }
            if (isdefined(flashpoint.objective) && timenow - flashpoint.lasteventtime >= 7500 && !istrue(flashpoint.endingsoon)) {
                flashpoint_endingsoon(flashpoint);
            }
            keys = getarraykeys(flashpoint.events);
            foreach (key in keys) {
                if (timenow - key > 12500) {
                    flashpoint.events = array_remove_key(flashpoint.events, key);
                }
            }
        }
        foreach (player in level.players) {
            if (!isdefined(player.flashpoint_trackingevents)) {
                thread flashpoint_trackplayerevents(player);
            }
        }
        wait 1;
    }
}

// Namespace flashpoint / scripts\mp\flashpoint
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a7
// Size: 0x230
function flashpoint_processnewevent(attacker, victim, time, eventtype) {
    if (!level.flashpointactive) {
        return;
    }
    var_5856c0b118701a9f = (0, 0, 0);
    if (false) {
        var_5856c0b118701a9f = (randomfloatrange(-1000, 1000), randomfloatrange(-1000, 1000), 0);
    }
    if (eventtype == "gunfire") {
        origin = attacker.origin + (0, 0, 32);
        if (false) {
            origin += var_5856c0b118701a9f;
        }
        thread playvfx(origin, "flashpoint_kill_s2");
        return;
    }
    origin = (0, 0, 0);
    if (level.flashpoint_objectives) {
        origin = vectorlerp(attacker.origin + (0, 0, 48), victim.origin + (0, 0, 48), 0.25);
    } else {
        origin = victim.origin + (0, 0, 48);
    }
    if (false) {
        origin += var_5856c0b118701a9f;
    }
    if (level.flashpoint_objectives) {
        ent = spawn("script_model", origin);
        var_a618a20a42198fa1 = ent array_sort_with_func(level.flashpoint_struct.flashpoints, &sortlocationsbydistance);
        ent delete();
        foreach (flashpoint in var_a618a20a42198fa1) {
            if (distancesquared(flashpoint.curorigin, origin) < level.flashpointmindist) {
                flashpoint_updatepoint(flashpoint, origin, time, eventtype);
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

// Namespace flashpoint / scripts\mp\flashpoint
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9df
// Size: 0x8a
function flashpoint_createnew(origin, time, eventtype) {
    flashpoint = spawnstruct();
    flashpoint.curorigin = origin;
    flashpoint.lasteventtime = time;
    flashpoint.team = "";
    flashpoint_addeventtoqueue(flashpoint, time, eventtype);
    level.flashpoint_struct.flashpoints[level.flashpoint_struct.flashpoints.size] = flashpoint;
}

// Namespace flashpoint / scripts\mp\flashpoint
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa71
// Size: 0xcf
function flashpoint_createmarker(flashpoint) {
    flashpoint.objective = scripts\mp\gameobjects::createobjidobject(flashpoint.curorigin, "neutral", (0, 0, 0), undefined, "any");
    scripts\mp\objidpoolmanager::objective_set_play_intro(flashpoint.objective.objidnum, 0);
    flashpoint.objective.lockupdatingicons = 0;
    scripts\mp\objidpoolmanager::update_objective_icon(flashpoint.objective.objidnum, level.iconflashpointneutral);
    scripts\mp\objidpoolmanager::update_objective_setbackground(flashpoint.objective.objidnum, 2);
    flashpoint.objective.lockupdatingicons = 1;
}

// Namespace flashpoint / scripts\mp\flashpoint
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb48
// Size: 0xf8
function flashpoint_updatepoint(flashpoint, var_6fc81b511db04699, time, eventtype) {
    flashpoint notify("end_update");
    flashpoint endon("end_update");
    level endon("disable_flashpoint");
    if (!isdefined(flashpoint.objective) && flashpoint.events.size >= 5) {
        flashpoint_createmarker(flashpoint);
    }
    flashpoint.endingsoon = 0;
    flashpoint.lasteventtime = gettime();
    if (isdefined(flashpoint.objective) && level.flashpoint_objectives) {
        scripts\mp\objidpoolmanager::objective_set_pulsate(flashpoint.objective.objidnum, 0);
    } else {
        flashpoint.curorigin = vectorlerp(flashpoint.curorigin, var_6fc81b511db04699, 0.75);
    }
    thread playvfx(var_6fc81b511db04699, "flashpoint_kill_s2");
    flashpoint_addeventtoqueue(flashpoint, time, eventtype);
}

// Namespace flashpoint / scripts\mp\flashpoint
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc48
// Size: 0xe9
function flashpoint_addeventtoqueue(flashpoint, time, eventtype) {
    if (!isdefined(flashpoint.events)) {
        flashpoint.events = [];
    }
    flashpoint.events[time] = eventtype;
    if (flashpoint.events.size > 8) {
        var_8054fa0b4941d3ff = [];
        i = 0;
        foreach (index, event in flashpoint.events) {
            if (i > flashpoint.events.size - 8) {
                var_8054fa0b4941d3ff[index] = event;
            }
            i++;
        }
        flashpoint.events = var_8054fa0b4941d3ff;
    }
}

// Namespace flashpoint / scripts\mp\flashpoint
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd39
// Size: 0xac
function flashpoint_shutdown(flashpoint) {
    flashpoint notify("end_update");
    if (isdefined(flashpoint.objective) && level.flashpoint_objectives) {
        flashpoint.objective scripts\mp\gameobjects::setvisibleteam("none");
        flashpoint.objective scripts\mp\gameobjects::releaseid();
        flashpoint.objective.visibleteam = "none";
        flashpoint.objective = undefined;
    }
    level.flashpoint_struct.flashpoints = array_remove(level.flashpoint_struct.flashpoints, flashpoint);
}

// Namespace flashpoint / scripts\mp\flashpoint
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xded
// Size: 0x43
function flashpoint_endingsoon(flashpoint) {
    flashpoint.endingsoon = 1;
    if (level.flashpoint_objectives) {
        scripts\mp\objidpoolmanager::objective_set_pulsate(flashpoint.objective.objidnum, 1);
    }
}

// Namespace flashpoint / scripts\mp\flashpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe38
// Size: 0x27e
function flashpoint_checkforownerupdate(flashpoint) {
    axiskills = 0;
    alliesKills = 0;
    switchstring = "No Change";
    startingowner = flashpoint.team;
    foreach (event in flashpoint.events) {
        if (event == "kill_by_axis") {
            axiskills++;
            continue;
        }
        if (event == "kill_by_allies") {
            alliesKills++;
        }
    }
    if ((axiskills - 1 > alliesKills || alliesKills == 0) && flashpoint.team != "axis" && axiskills != 0) {
        if (level.flashpoint_objectives) {
            scripts\mp\objidpoolmanager::update_objective_ownerteam(flashpoint.objidnum, "axis");
            scripts\mp\objidpoolmanager::update_objective_sethot(flashpoint.objidnum, 0);
        }
        flashpoint.team = "axis";
        switchstring = "Switch To Axis Owner";
    } else if ((alliesKills - 1 > axiskills || axiskills == 0) && flashpoint.team != "allies" && alliesKills != 0) {
        if (level.flashpoint_objectives) {
            scripts\mp\objidpoolmanager::update_objective_ownerteam(flashpoint.objidnum, "allies");
            scripts\mp\objidpoolmanager::update_objective_sethot(flashpoint.objidnum, 0);
        }
        flashpoint.team = "allies";
        switchstring = "Switch To Allies Owner";
    } else if (flashpoint.team != "neutral" && alliesKills != 0 && axiskills != 0) {
        if (level.flashpoint_objectives) {
            scripts\mp\objidpoolmanager::update_objective_ownerteam(flashpoint.objidnum, undefined);
            scripts\mp\objidpoolmanager::update_objective_sethot(flashpoint.objidnum, 1);
        }
        flashpoint.team = "neutral";
        switchstring = "Switch To Contested";
    }
    /#
        if (false) {
            println("<dev string:x1c>");
            println("<dev string:x43>");
            println("<dev string:x5e>" + startingowner);
            println("<dev string:x6e>" + switchstring);
            println("<dev string:x79>" + axiskills);
            println("<dev string:x88>" + alliesKills);
            println("<dev string:x1c>");
        }
    #/
}

// Namespace flashpoint / scripts\mp\flashpoint
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10be
// Size: 0x46
function sortlocationsbydistance(location1, location2) {
    return distancesquared(location1.curorigin, self.origin) < distancesquared(location2.curorigin, self.origin);
}

// Namespace flashpoint / scripts\mp\flashpoint
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110d
// Size: 0xbd
function flashpoint_clearoldestpoint() {
    oldestpoint = undefined;
    foreach (flashpoint in level.flashpoint_struct.flashpoints) {
        if (!isdefined(oldestpoint)) {
            oldestpoint = flashpoint;
            continue;
        }
        if (flashpoint.lasteventtime > oldestpoint.lasteventtime) {
            oldestpoint = flashpoint;
        }
    }
    /#
        if (false) {
            println("<dev string:x99>");
            println("<dev string:xcc>");
            println("<dev string:x99>");
        }
    #/
    flashpoint_shutdown(oldestpoint);
}

/#

    // Namespace flashpoint / scripts\mp\flashpoint
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x11d2
    // Size: 0x15c
    function function_34b4ca8a02efb2cc() {
        while (true) {
            if (level.flashpointdebugactive == 1) {
                origin = (randomfloatrange(0, 7000), randomfloatrange(0, 7000), randomfloatrange(100, 500));
                thread playvfx(origin, "<dev string:xfd>");
                for (i = 0; i < 10; i++) {
                    thread playvfx((47318 + randomfloatrange(-1024, 1024), -10783 + randomfloatrange(-1024, 1024), 160 + randomfloatrange(-100, 100)), "<dev string:xfd>");
                    wait randomfloatrange(0.01, 0.05);
                }
            } else if (level.flashpointdebugactive == 2) {
                thread playvfx((7000, 7000, 100), "<dev string:xfd>");
                thread playvfx((-7000, 7000, 100), "<dev string:xfd>");
                thread playvfx((7000, -7000, 100), "<dev string:xfd>");
                thread playvfx((-7000, -7000, 100), "<dev string:xfd>");
            }
            origin = (0, 0, 100);
            thread playvfx(origin, "<dev string:xfd>");
            waittime = 1.1;
            wait waittime;
        }
    }

#/

// Namespace flashpoint / scripts\mp\flashpoint
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1336
// Size: 0x21
function playvfx(origin, effect) {
    playfx(getfx(effect), origin);
}

// Namespace flashpoint / scripts\mp\flashpoint
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135f
// Size: 0x56
function flashpoint_trackplayerevents(player) {
    player endon("disconnect");
    level endon("disable_flashpoint");
    player.flashpoint_trackingevents = 1;
    while (true) {
        player waittill("begin_firing");
        wait 1;
        flashpoint_processnewevent(player, undefined, gettime(), "gunfire");
        wait 0.25;
    }
}

// Namespace flashpoint / scripts\mp\flashpoint
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bd
// Size: 0x12a
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
                continue;
            }
            if (istrue(level.spawnselectionshowfriendly)) {
                if (self.sessionsquadid == player.sessionsquadid) {
                    playfxontagforclients(level._effect["flashpoint_pulse_squad"], player, "tag_eye", self);
                    continue;
                }
                playfxontagforclients(level._effect["flashpoint_pulse_friendly"], player, "tag_eye", self);
            }
        }
        wait 1.1;
    }
}

