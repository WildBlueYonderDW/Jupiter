#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\stealth\debug.gsc;
#using scripts\common\values.gsc;
#using scripts\stealth\utility.gsc;
#using scripts\stealth\manager.gsc;

#namespace player;

// Namespace player / scripts\stealth\player
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31e
// Size: 0xea
function main() {
    if (isdefined(self.stealth)) {
        return;
    }
    self endon("death");
    self endon("stealth_disabled");
    self.stealth = spawnstruct();
    scripts\stealth\utility::group_flag_init("stealth_spotted");
    ent_flag_init("stealth_enabled");
    function_e403865f115834a8("stealth_enabled");
    ent_flag_init("stealth_in_shadow");
    ent_flag_init("stealth_use_real_lighting");
    ent_flag_init("stealth_use_player_camera_movement");
    scripts\stealth\utility::group_add();
    if (utility::issp()) {
        thread stealthhints_thread();
        if (isdefined(level.stealth.fnsixthsense)) {
            [[ level.stealth.fnsixthsense ]]();
        }
    } else {
        thread scripts\stealth\manager::player_grenade_check();
        if (isdefined(level.var_6ccee8e6c00f06e6)) {
            self thread [[ level.var_6ccee8e6c00f06e6 ]]();
        }
    }
    /#
        childthread debug_player();
    #/
}

// Namespace player / scripts\stealth\player
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x410
// Size: 0x1d
function function_e403865f115834a8(message) {
    function_31a67e5538887627(self, message, 1);
    ent_flag_set(message);
}

// Namespace player / scripts\stealth\player
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x435
// Size: 0x1c
function function_3718fc282393305(message) {
    function_31a67e5538887627(self, message, 0);
    ent_flag_clear(message);
}

// Namespace player / scripts\stealth\player
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x459
// Size: 0x4ee
function combatstate_thread(enabled) {
    if (!isdefined(enabled)) {
        enabled = 1;
    }
    if (!enabled) {
        self notify("stop_player_combat_state_thread");
        self.stealth.combatstate = undefined;
        return;
    } else if (isdefined(self.stealth.combatstate)) {
        return;
    }
    self endon("death");
    self endon("stealth_disabled");
    self endon("stop_player_combat_state_thread");
    self endon("disconnect");
    childthread playerattackedmonitor();
    childthread combatstate_updatethread();
    self.stealth.combatstate = spawnstruct();
    self.stealth.combatstate.name = "stealth";
    self.stealth.combatstate.type = "idle";
    self.stealth.combatstate.updatefuncs = [];
    var_c6edce1b02951aa2 = [];
    var_20bb85d7bcd0392d = [];
    while (true) {
        ent_flag_wait("stealth_enabled");
        var_c6edce1b02951aa2 = array_removeundefined(var_c6edce1b02951aa2);
        var_c6edce1b02951aa2 = array_removedead(var_c6edce1b02951aa2);
        var_20bb85d7bcd0392d = array_removeundefined(var_20bb85d7bcd0392d);
        var_20bb85d7bcd0392d = array_removedead(var_20bb85d7bcd0392d);
        combatenemies = [];
        huntenemies = [];
        var_d357c65b8336aab = 0;
        if (isdefined(self.lastattackedtime) && !time_has_passed(self.lastattackedtime, 10)) {
            var_d357c65b8336aab = 1;
        }
        investigating = 0;
        foreach (enemy in getaiarray("axis")) {
            if (!isalive(enemy)) {
                continue;
            }
            if (!array_contains(var_c6edce1b02951aa2, enemy)) {
                if (enemy doinglongdeath()) {
                    continue;
                }
                if (is_equal(enemy.script, "pain")) {
                    continue;
                }
            }
            if (enemy [[ enemy.fnisinstealthcombat ]]()) {
                if (isdefined(self.stealth.combatstate.maxcombatdist)) {
                    dist = self.stealth.combatstate.maxcombatdist;
                    if (distancesquared(self.origin, enemy.origin) > squared(dist)) {
                        huntenemies[huntenemies.size] = enemy;
                        continue;
                    }
                }
                combatenemies[combatenemies.size] = enemy;
                if (var_d357c65b8336aab) {
                    continue;
                }
                if (!is_equal(enemy.enemy, self)) {
                    continue;
                }
                if (enemy cansee(self)) {
                    var_d357c65b8336aab = 1;
                }
            } else if (enemy [[ enemy.fnisinstealthhunt ]]()) {
                huntenemies[huntenemies.size] = enemy;
            }
            if (enemy [[ enemy.fnisinstealthinvestigate ]]()) {
                investigating = 1;
            }
        }
        lastname = self.stealth.combatstate.name;
        lasttype = self.stealth.combatstate.type;
        name = lastname;
        type = undefined;
        if (name == "stealth" && investigating) {
            type = "investigate";
        }
        if (lastname == "combat") {
            if (combatenemies.size == 0) {
                name = "stealth";
                if (array_intersection(var_c6edce1b02951aa2, huntenemies).size > 0) {
                    type = "hunt";
                } else if (huntenemies.size == 0) {
                    type = "all_clear";
                } else {
                    type = "combat_clear";
                }
            } else if (is_equal(lasttype, "unaware") && var_d357c65b8336aab) {
                type = "aware";
            }
        } else if (combatenemies.size > 0) {
            name = "combat";
            if (var_d357c65b8336aab) {
                type = "aware";
            } else {
                type = "unaware";
            }
        } else if (is_equal(lasttype, "hunt") && huntenemies.size == 0) {
            type = "all_clear";
        }
        if (name == "stealth" && !isdefined(type) && is_equal(lasttype, "investigate")) {
            type = "idle";
        }
        if (name != lastname || isdefined(type) && !is_equal(type, lasttype)) {
            self.stealth.combatstate.name = name;
            self.stealth.combatstate.type = type;
            self notify("player_combat_state_updated", name, type);
        }
        var_c6edce1b02951aa2 = combatenemies;
        var_20bb85d7bcd0392d = huntenemies;
        waitframe();
    }
}

// Namespace player / scripts\stealth\player
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94f
// Size: 0x91
function combatstate_updatethread() {
    while (true) {
        name, type = self waittill("player_combat_state_updated");
        foreach (func in self.stealth.combatstate.updatefuncs) {
            self thread [[ func ]](name, type);
        }
    }
}

// Namespace player / scripts\stealth\player
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9e8
// Size: 0xbe
function combatstate_addupdatefunc(key, func) {
    assert(isplayer(self));
    assert(isdefined(self.stealth));
    assert(isdefined(self.stealth.combatstate));
    assert(isdefined(key), "Must have a key to identify the function!");
    assert(!array_contains_key(self.stealth.combatstate.updatefuncs, key), "CombatState updateFunc with key " + key + " already exists!");
    self.stealth.combatstate.updatefuncs[key] = func;
}

// Namespace player / scripts\stealth\player
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaae
// Size: 0xd6
function combatstate_removeupdatefunc(key) {
    assert(isplayer(self));
    assert(isdefined(self.stealth));
    assert(isdefined(self.stealth.combatstate));
    assert(isdefined(key), "Must have a key to identify the function!");
    assert(array_contains_key(self.stealth.combatstate.updatefuncs, key), "CombatState updateFunc with key " + key + " doesn't exist!");
    self.stealth.combatstate.updatefuncs = array_remove_key(self.stealth.combatstate.updatefuncs, key);
}

// Namespace player / scripts\stealth\player
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8c
// Size: 0x2a
function playerattackedmonitor() {
    while (true) {
        level waittill_any_2("an_enemy_shot", "enemy_grenade_fire");
        self.lastattackedtime = gettime();
    }
}

// Namespace player / scripts\stealth\player
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbe
// Size: 0x15a
function stealthhints_thread() {
    self endon("stealth_disabled");
    self.stealth.hints = spawnstruct();
    self.stealth.hints.causeofdeath = undefined;
    self.stealth.hints.investigators = [];
    self.stealth.hints.deathhints["footstep_sprint"] = 6;
    self.stealth.hints.deathhints["gunshot_suppressed"] = 8;
    self.stealth.hints.deathhints["proximity_speed"] = 16;
    self.stealth.hints.deathhints["sight_standing"] = 19;
    self.stealth.hints.deathhints["gunshot"] = 201;
    self.stealth.hints.deathhints["footstep_walk"] = 203;
    childthread stealthhints_eventmonitor();
    childthread stealthhints_deathmonitor();
    childthread stealthhints_combatmonitor();
}

// Namespace player / scripts\stealth\player
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd20
// Size: 0x26b
function stealthhints_eventmonitor() {
    self endon("death");
    while (isalive(self)) {
        ent_flag_wait("stealth_enabled");
        event, receiver = level waittill("stealth_event");
        if (!isalive(receiver)) {
            continue;
        }
        if (!is_equal(event.entity, level.player)) {
            continue;
        }
        if (!ent_flag("stealth_enabled")) {
            self.stealth.hints.causeofdeath = undefined;
            self.stealth.hints.investigators = [];
            continue;
        }
        if (scripts\stealth\utility::any_groups_in_combat()) {
            if (event.type != "combat") {
                continue;
            }
            var_2728a62095970115 = 0;
            foreach (guy in getaiarray(receiver.team)) {
                if (guy == receiver) {
                    continue;
                }
                if (guy [[ guy.fnisinstealthcombat ]]()) {
                    var_2728a62095970115 = 1;
                    break;
                }
            }
            if (var_2728a62095970115) {
                continue;
            }
        }
        eventtype = event.typeorig;
        if (eventtype == "gunshot" && istrue(level.hassuppressedweapons)) {
            eventtype = "gunshot_suppressed";
        } else if ((eventtype == "sight" || eventtype == "proximity") && self issprinting()) {
            eventtype = "footstep_sprint";
        } else if (eventtype == "proximity" && length2dsquared(level.player getvelocity()) > 11025) {
            eventtype = "proximity_speed";
        } else if (eventtype == "sight" && self getstance() == "stand") {
            eventtype = "sight_standing";
        }
        if (!isdefined(self.stealth.hints.deathhints[eventtype])) {
            continue;
        }
        if (array_contains(self.stealth.hints.investigators, receiver)) {
            continue;
        }
        childthread stealthhints_aimonitor(receiver, eventtype);
    }
}

// Namespace player / scripts\stealth\player
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf93
// Size: 0x16b
function stealthhints_aimonitor(ai, eventtype) {
    self endon("combat_started");
    self endon("stealth_enabled");
    self.stealth.hints.investigators[self.stealth.hints.investigators.size] = ai;
    if (ai [[ ai.fnisinstealthhunt ]]()) {
        ai delaythread(10, &send_notify, "stealthHints_timeout");
        ai waittill_any_3("stealth_combat", "death", "stealthHints_timeout");
    } else if (ai [[ ai.fnisinstealthinvestigate ]]()) {
        ai waittill_any_3("stealth_idle", "stealth_combat", "death");
    }
    self.stealth.hints.investigators = array_remove(self.stealth.hints.investigators, ai);
    if (!isalive(ai) || !ai [[ ai.fnisinstealthcombat ]]()) {
        return;
    }
    self.stealth.hints.causeofdeath = eventtype;
    self.stealth.hints.investigators = [];
    self notify("combat_started");
}

// Namespace player / scripts\stealth\player
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1106
// Size: 0xa0
function stealthhints_deathmonitor() {
    self waittill("death");
    if (!ent_flag("stealth_enabled")) {
        return;
    }
    if (isdefined(level.custom_death_quote)) {
        return;
    }
    if (!isdefined(self.stealth.hints.causeofdeath)) {
        return;
    }
    if (getdvarint(@"hash_f9c8928ccea1a275", 0)) {
        return;
    }
    level.custom_death_quote = self.stealth.hints.deathhints[self.stealth.hints.causeofdeath];
}

// Namespace player / scripts\stealth\player
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ae
// Size: 0x84
function stealthhints_combatmonitor() {
    self endon("death");
    while (true) {
        if (istrue(level.laststandentered)) {
            self waittill("last_stand_finished");
        } else {
            ent_flag_wait("stealth_enabled");
        }
        while (!isdefined(self.stealth.hints.causeofdeath)) {
            waitframe();
        }
        while (scripts\stealth\utility::any_groups_in_combat()) {
            waitframe();
        }
        self.stealth.hints.causeofdeath = undefined;
    }
}

