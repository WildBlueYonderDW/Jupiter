#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\sp\mgturret.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_41b94b17a250d8db;

// Namespace namespace_41b94b17a250d8db / scripts\sp\mg_penetration
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13a
// Size: 0x16e
function gunner_think(turret) {
    if (!isdefined(level.shared_portable_turrets)) {
        level.shared_portable_turrets = [];
    }
    self endon("death");
    self notify("end_mg_behavior");
    self endon("end_mg_behavior");
    self.can_fire_turret = 1;
    self.wants_to_fire = 0;
    if (!use_the_turret(turret)) {
        self notify("continue_cover_script");
        return;
    }
    self.last_enemy_sighting_position = undefined;
    thread record_enemy_sightings();
    forward = anglestoforward(turret.angles);
    ent = spawn("script_origin", (0, 0, 0));
    thread target_ent_cleanup(ent);
    ent.origin = turret.origin + forward * 500;
    if (isdefined(self.last_enemy_sighting_position)) {
        ent.origin = self.last_enemy_sighting_position;
    }
    turret settargetentity(ent);
    enemy = undefined;
    for (;;) {
        if (!isalive(self.current_enemy)) {
            stop_firing();
            self waittill("new_enemy");
        }
        start_firing();
        shoot_enemy_until_he_hides_then_shoot_wall(ent);
        if (!isalive(self.current_enemy)) {
            continue;
        }
        if (self cansee(self.current_enemy)) {
            continue;
        }
        self waittill("saw_enemy");
    }
}

// Namespace namespace_41b94b17a250d8db / scripts\sp\mg_penetration
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b0
// Size: 0x23
function target_ent_cleanup(ent) {
    waittill_either("death", "end_mg_behavior");
    ent delete();
}

// Namespace namespace_41b94b17a250d8db / scripts\sp\mg_penetration
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2db
// Size: 0x1d0
function shoot_enemy_until_he_hides_then_shoot_wall(ent) {
    self endon("death");
    self endon("new_enemy");
    self.current_enemy endon("death");
    enemy = self.current_enemy;
    while (self cansee(enemy)) {
        angles = vectortoangles(enemy geteye() - ent.origin);
        angles = anglestoforward(angles);
        ent moveto(ent.origin + angles * 12, 0.1);
        wait 0.1;
    }
    if (isplayer(enemy)) {
        self endon("saw_enemy");
        eye = enemy geteye();
        angles = vectortoangles(eye - ent.origin);
        angles = anglestoforward(angles);
        var_5e6ce37bb5c4acd9 = 150;
        timer = distance(ent.origin, self.last_enemy_sighting_position) / var_5e6ce37bb5c4acd9;
        if (timer > 0) {
            ent moveto(self.last_enemy_sighting_position, timer);
            wait timer;
        }
        org = ent.origin + angles * 180;
        oldorigin = get_suppress_point(self geteye(), ent.origin, org);
        if (!isdefined(oldorigin)) {
            oldorigin = ent.origin;
        }
        ent moveto(ent.origin + angles * 80 + (0, 0, randomfloatrange(15, 50) * -1), 3, 1, 1);
        wait 3.5;
        ent moveto(oldorigin + angles * -20, 3, 1, 1);
    }
    wait randomfloatrange(2.5, 4);
    stop_firing();
}

// Namespace namespace_41b94b17a250d8db / scripts\sp\mg_penetration
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b3
// Size: 0x53
function set_firing(val) {
    if (val) {
        self.can_fire_turret = 1;
        if (self.wants_to_fire) {
            self.turret notify("startfiring");
        }
        return;
    }
    self.can_fire_turret = 0;
    self.turret notify("stopfiring");
}

// Namespace namespace_41b94b17a250d8db / scripts\sp\mg_penetration
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50e
// Size: 0x1c
function stop_firing() {
    self.wants_to_fire = 0;
    self.turret notify("stopfiring");
}

// Namespace namespace_41b94b17a250d8db / scripts\sp\mg_penetration
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x532
// Size: 0x29
function start_firing() {
    self.wants_to_fire = 1;
    if (self.can_fire_turret) {
        self.turret notify("startfiring");
    }
}

// Namespace namespace_41b94b17a250d8db / scripts\sp\mg_penetration
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x563
// Size: 0xcf
function create_mg_team() {
    if (isdefined(level.mg_gunner_team)) {
        level.mg_gunner_team[level.mg_gunner_team.size] = self;
        return;
    }
    level.mg_gunner_team = [];
    level.mg_gunner_team[level.mg_gunner_team.size] = self;
    waittillframeend();
    ent = spawnstruct();
    array_thread(level.mg_gunner_team, &mg_gunner_death_notify, ent);
    array = level.mg_gunner_team;
    level.mg_gunner_team = undefined;
    ent waittill("gunner_died");
    for (i = 0; i < array.size; i++) {
        if (!isalive(array[i])) {
            continue;
        }
        array[i] notify("stop_using_built_in_burst_fire");
        array[i] thread solo_fires();
    }
}

// Namespace namespace_41b94b17a250d8db / scripts\sp\mg_penetration
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63a
// Size: 0x1b
function mg_gunner_death_notify(ent) {
    self waittill("death");
    ent notify("gunner_died");
}

// Namespace namespace_41b94b17a250d8db / scripts\sp\mg_penetration
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x65d
// Size: 0x4c
function solo_firing(var_4583761e006c72d8) {
    var_ef3a46ba5a537ce6 = undefined;
    for (i = 0; i < var_4583761e006c72d8.size; i++) {
        if (!isalive(var_4583761e006c72d8[i])) {
            continue;
        }
        var_ef3a46ba5a537ce6 = var_4583761e006c72d8[i];
        break;
    }
    if (!isdefined(var_ef3a46ba5a537ce6)) {
        return;
    }
}

// Namespace namespace_41b94b17a250d8db / scripts\sp\mg_penetration
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b1
// Size: 0x4a
function solo_fires() {
    self endon("death");
    for (;;) {
        self.turret startfiring();
        wait randomfloatrange(0.3, 0.7);
        self.turret stopfiring();
        wait randomfloatrange(0.1, 1.1);
    }
}

// Namespace namespace_41b94b17a250d8db / scripts\sp\mg_penetration
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x703
// Size: 0x98
function dual_firing(var_4583761e006c72d8) {
    for (i = 0; i < var_4583761e006c72d8.size; i++) {
        var_4583761e006c72d8[i] endon("death");
    }
    a = 0;
    b = 1;
    for (;;) {
        if (isalive(var_4583761e006c72d8[a])) {
            var_4583761e006c72d8[a] set_firing(1);
        }
        if (isalive(var_4583761e006c72d8[b])) {
            var_4583761e006c72d8[b] set_firing(0);
        }
        c = a;
        a = b;
        b = c;
        wait randomfloatrange(2.3, 3.5);
    }
}

// Namespace namespace_41b94b17a250d8db / scripts\sp\mg_penetration
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7a3
// Size: 0xe6
function get_suppress_point(origin, trace_start, trace_end) {
    traces = distance(trace_start, trace_end) * 0.05;
    if (traces < 5) {
        traces = 5;
    }
    if (traces > 20) {
        traces = 20;
    }
    var_151e2425c0a5f5c9 = trace_end - trace_start;
    var_151e2425c0a5f5c9 = (var_151e2425c0a5f5c9[0] / traces, var_151e2425c0a5f5c9[1] / traces, var_151e2425c0a5f5c9[2] / traces);
    offset = (0, 0, 0);
    var_d067acf8720bed6b = undefined;
    for (i = 0; i < traces + 2; i++) {
        trace = scripts\engine\trace::_bullet_trace(origin, trace_start + offset, 0, undefined);
        if (trace["fraction"] < 1) {
            var_d067acf8720bed6b = trace["position"];
            break;
        }
        offset += var_151e2425c0a5f5c9;
    }
    return var_d067acf8720bed6b;
}

// Namespace namespace_41b94b17a250d8db / scripts\sp\mg_penetration
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x892
// Size: 0x2a
function record_enemy_sightings() {
    self endon("death");
    self endon("end_mg_behavior");
    self.current_enemy = undefined;
    for (;;) {
        record_sighting();
        wait 0.05;
    }
}

// Namespace namespace_41b94b17a250d8db / scripts\sp\mg_penetration
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8c4
// Size: 0x89
function record_sighting() {
    if (!isalive(self.enemy)) {
        return;
    }
    if (!self cansee(self.enemy)) {
        return;
    }
    self.last_enemy_sighting_position = self.enemy geteye();
    self notify("saw_enemy");
    if (!isalive(self.current_enemy) || self.current_enemy != self.enemy) {
        self.current_enemy = self.enemy;
        self notify("new_enemy");
    }
}

