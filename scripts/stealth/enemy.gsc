// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_72a196b6c7df2f38;
#using scripts\stealth\threat_sight.gsc;
#using scripts\stealth\callbacks.gsc;
#using scripts\stealth\debug.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\stealth\group.gsc;
#using scripts\stealth\event.gsc;
#using script_26265e158b27bdda;
#using scripts\stealth\utility.gsc;
#using scripts\stealth\corpse.gsc;
#using scripts\common\gameskill.gsc;

#namespace enemy;

// Namespace enemy/namespace_6db9b2dcda758664
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x597
// Size: 0x262
function main() {
    init_settings();
    init_flags();
    namespace_e5c9a7258a3d79cb::addtogroup(self.script_stealthgroup, self);
    if (!istrue(self.var_b19befc7a8bfc30f)) {
        self function_4db6fc194702d153();
    }
    namespace_92d413b0c411a750::event_init_entity();
    thread monitor_damage_thread(level.stealth.damage_auto_range, level.stealth.damage_sight_range);
    self function_1aff80c5fc5a3eea("noncombat");
    bt_set_stealth_state("idle");
    stealth_init_goal_radius();
    /#
        thread function_f545d4a803ca4bd7();
    #/
    if (isdefined(self.fnstealthflashlighton)) {
        self.stealth.funcs["flashlight_on"] = self.fnstealthflashlighton;
    }
    if (isdefined(self.fnstealthflashlightoff)) {
        self.stealth.funcs["flashlight_off"] = self.fnstealthflashlightoff;
    }
    if (isdefined(self.var_5221cb0637cd44e7)) {
        self.stealth.funcs["flashlight_attach"] = self.var_5221cb0637cd44e7;
    }
    if (isdefined(self.fnstealthflashlightdetach)) {
        self.stealth.funcs["flashlight_detach"] = self.fnstealthflashlightdetach;
    }
    self.stealth.funcs["on_state_change"] = &function_482904a05ecb1101;
    if (getdvarint(@"hash_3dd93292c69a9d62", 0) == 0) {
        self.var_d7f4a1b60f84e53f = self.script_stealthgroup;
    }
    if (getdvarint(@"hash_6109644d57e1122e", 0)) {
        thread namespace_2ab3cc97bdf86f18::suspicious_door_thread();
    }
    if (isdefined(level.stealth) && isdefined(level.stealth.var_b164de1a339a2b06) && !(isdefined(self.aisettings) && isdefined(self.aisettings.var_4975344f645984a6))) {
        self function_d493e7fe15e5eaf4(level.stealth.var_b164de1a339a2b06);
    }
    if (isdefined(level.var_4fa3c4eb77c24130)) {
        self [[ level.var_4fa3c4eb77c24130 ]]();
    }
    if (isdefined(level.stealth.fninitenemygame)) {
        self thread [[ level.stealth.fninitenemygame ]]();
    }
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x800
// Size: 0x27
function init_flags() {
    ent_flag_init("stealth_enabled");
    ent_flag_set("stealth_enabled");
    namespace_e124d8b75dab4be0::group_flag_init("stealth_spotted");
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82e
// Size: 0x6d
function stealth_init_goal_radius() {
    if (isdefined(self.goalradius)) {
        return;
    }
    if (isdefined(self.script_radius)) {
        self.goalradius = self.script_radius;
        return;
    }
    if (isdefined(self.var_9ff99cfc426066a2)) {
        self.goalradius = self.var_9ff99cfc426066a2;
        return;
    }
    if (!isdefined(self getgoalvolume())) {
        self.goalradius = level.default_goalradius;
    }
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a2
// Size: 0x14b
function init_settings() {
    self.stealth = spawnstruct();
    self.stealth_enabled = 1;
    self.var_fe5ebefa740c7106 = 4;
    self.stealth.funcs = [];
    self.stealth.max_warnings = 2;
    /#
        self.stealth.ai_event = "finish";
        self.stealth.var_4fc268e229e1af6c = "finish";
    #/
    var_8c591f1bde417eb4 = function_61b03c8c194a6733("hidden", "footstep_sprint");
    self.newenemyreactiondistsq = ter_op(isdefined(var_8c591f1bde417eb4), var_8c591f1bde417eb4, squared(function_9d30fd63965bafa9("footstep_sprint", undefined)));
    namespace_70203d71cdb728fc::corpse_init_entity();
    self.event_escalation_scalar = 0;
    if (!isdefined(level.stealth.damage_auto_range)) {
        level.stealth.damage_auto_range = 240;
    }
    if (!isdefined(level.stealth.damage_sight_range)) {
        level.stealth.damage_sight_range = 750;
    }
    self.grenadeawareness = 0;
    self.canacquirenearbytacvisenemies = 0;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f4
// Size: 0x32
function death_cleanup() {
    if (isdefined(self)) {
        self function_24cb3b5e0d4216b1("death");
    }
    if (isdefined(self.stealth_vo_ent)) {
        self.stealth_vo_ent thread death_vo_cleanup();
    }
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2d
// Size: 0x12
function death_vo_cleanup() {
    self stopsounds();
    waitframe();
    self delete();
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa46
// Size: 0x91
function add_active_sense_function(function) {
    /#
        assertex(isdefined(self.stealth), "Stealth is not initiated on ai " + self getentitynumber() + " at pos " + self.origin);
    #/
    if (!isdefined(self.stealth.active_sense_funcs)) {
        self.stealth.active_sense_funcs = [];
    }
    self.stealth.active_sense_funcs[self.stealth.active_sense_funcs.size] = function;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xade
// Size: 0xe4
function set_blind(blind, force) {
    if (!isdefined(self.stealth)) {
        return;
    }
    if (!blind && !istrue(self.var_5ae62f5db161ccaf)) {
        return;
    }
    var_238c192f07833950 = isdefined(self.fnisinstealthcombat) && self [[ self.fnisinstealthcombat ]]();
    var_2e660c634ae5407d = isdefined(self.fnisinstealthhunt) && self [[ self.fnisinstealthhunt ]]();
    var_11d82b3f1dcb2eb5 = var_238c192f07833950 || var_2e660c634ae5407d;
    if (blind && (!var_11d82b3f1dcb2eb5 || istrue(force))) {
        self.var_5ae62f5db161ccaf = 1;
        self function_ea50442798fca4c1("blind");
    } else {
        self.var_5ae62f5db161ccaf = 0;
        if (var_11d82b3f1dcb2eb5) {
            self function_ea50442798fca4c1("spotted");
        } else {
            self function_ea50442798fca4c1("hidden");
        }
    }
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc9
// Size: 0x42
function alertlevel_normal(param) {
    thread namespace_e124d8b75dab4be0::addeventplaybcs("stealth", "announce5", "alertreset");
    self function_1aff80c5fc5a3eea("noncombat");
    bt_set_stealth_state("idle");
    namespace_e124d8b75dab4be0::function_783cf2a7aaab23c();
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc12
// Size: 0xc9
function set_default_stealth_funcs() {
    level namespace_e124d8b75dab4be0::set_stealth_func("go_to_node_wait", &go_to_node_wait);
    level namespace_e124d8b75dab4be0::set_stealth_func("go_to_node_arrive", &go_to_node_arrived);
    level namespace_e124d8b75dab4be0::set_stealth_func("go_to_node_post_wait", &go_to_node_post_wait);
    level namespace_e124d8b75dab4be0::set_stealth_func("reset", &alertlevel_normal);
    level namespace_e124d8b75dab4be0::set_stealth_func("set_patrol_style", &namespace_e124d8b75dab4be0::set_patrol_style);
    level namespace_e124d8b75dab4be0::set_stealth_func("trigger_cover_blown", &trigger_cover_blown);
    level namespace_e124d8b75dab4be0::set_stealth_func("investigate", &bt_event_handler_severity);
    level namespace_e124d8b75dab4be0::set_stealth_func("cover_blown", &bt_event_handler_severity);
    level namespace_e124d8b75dab4be0::set_stealth_func("combat", &bt_event_handler_severity);
    level namespace_e124d8b75dab4be0::set_stealth_func("finish", &function_dfdec2ff9ba6b863);
    level namespace_e124d8b75dab4be0::set_stealth_func("override_should_ignore", &function_d83f0e5272e07d8c);
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce2
// Size: 0x26f
function monitor_damage_thread(var_448a418e975e9b01, var_6a01daab475b44ab) {
    team = self.team;
    while (isalive(self)) {
        other = undefined;
        while (1) {
            if (!isalive(self)) {
                return;
            }
            type = point = null = attacker = dmg = self waittill("damage");
            check_kill_damage(dmg, attacker, point);
            var_98782a2d2a5dbcb4 = self.origin;
            if (isalive(self) && !ent_flag("stealth_enabled")) {
                continue;
            }
            if (isalive(attacker)) {
                other = attacker;
            }
            if (!isdefined(other)) {
                continue;
            }
            if (istrue(stealth_call("damage", dmg, attacker, type))) {
                continue;
            }
            self aieventlistenerevent("damage", other, other.origin);
            if (isplayer(other) || isdefined(other.team) && other.team != team) {
                break;
            }
            if (isdefined(other.classname) && other.classname == "script_model") {
                if (istrue(other.isbarrel)) {
                    break;
                }
            }
        }
        if (!isdefined(self) || !isdefined(self.stealth)) {
            return;
        }
        if (isdefined(self.stealth.override_damage_auto_range)) {
            var_448a418e975e9b01 = self.stealth.override_damage_auto_range;
        } else if (isdefined(level.stealth.override_damage_auto_range)) {
            var_448a418e975e9b01 = level.stealth.override_damage_auto_range;
        }
        if (isdefined(self.stealth.override_damage_sight_range)) {
            var_6a01daab475b44ab = self.stealth.override_damage_sight_range;
        } else if (isdefined(level.stealth.override_damage_sight_range)) {
            var_6a01daab475b44ab = level.stealth.override_damage_sight_range;
        }
        if (isalive(self)) {
            function_aad7a0ea8ac4ca23("ally_damaged", self, other, var_448a418e975e9b01, var_6a01daab475b44ab, type);
        } else {
            function_aad7a0ea8ac4ca23("ally_killed", self, other, var_448a418e975e9b01, var_6a01daab475b44ab, type);
        }
    }
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf58
// Size: 0xcb
function check_kill_damage(damage, attacker, origin) {
    if (isdefined(self.disableeasystealthheadshot)) {
        return;
    }
    if (damage > 0 && self.damagemod != "MOD_MELEE" && self.damagemod != "MOD_IMPACT" && self.alertlevel != "combat") {
        eyepos = self geteye();
        if (distancesquared(origin, eyepos) < squared(level.stealth.head_shot_dist)) {
            self dodamage(self.health, origin, attacker, attacker, "MOD_HEAD_SHOT");
            self.stealth.override_damage_auto_range = 128;
        }
    }
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x102a
// Size: 0x183
function shotisreasonablysafe(target) {
    guys = getaiunittypearray("bad_guys", "all");
    var_f1e0b8658014350d = [];
    var_61337b0b147086d7 = squared(level.stealth.damage_auto_range);
    var_6b29dceda0f0afaf = squared(level.stealth.damage_sight_range);
    foreach (guy in guys) {
        if (guy == target) {
            continue;
        }
        var_ec59b0d4c5cf7b28 = distancesquared(target.origin, guy.origin);
        if (var_ec59b0d4c5cf7b28 < var_61337b0b147086d7) {
            return 0;
        }
        if (var_ec59b0d4c5cf7b28 < var_6b29dceda0f0afaf) {
            if (guy getthreatsight(self) > 0) {
                return 0;
            }
            if (guy math::point_in_fov(target.origin, 0) && guy hastacvis(target)) {
                return 0;
            }
            var_f1e0b8658014350d[var_f1e0b8658014350d.size] = guy;
        }
    }
    foreach (guy in var_f1e0b8658014350d) {
        if (guy cansee(target)) {
            return 0;
        }
    }
    return 1;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11b5
// Size: 0x185
function shotisbadidea(target) {
    guys = getaiunittypearray("bad_guys", "all");
    var_f1e0b8658014350d = [];
    var_61337b0b147086d7 = squared(level.stealth.damage_auto_range);
    var_6b29dceda0f0afaf = squared(level.stealth.damage_sight_range);
    foreach (guy in guys) {
        if (guy == target) {
            continue;
        }
        var_ec59b0d4c5cf7b28 = distancesquared(target.origin, guy.origin);
        if (var_ec59b0d4c5cf7b28 < var_61337b0b147086d7) {
            return 1;
        }
        if (var_ec59b0d4c5cf7b28 < var_6b29dceda0f0afaf) {
            if (guy getthreatsight(self) > 0) {
                return 1;
            }
            if (guy math::point_in_fov(target.origin, 0)) {
                if (guy hastacvis(target)) {
                    return 1;
                }
                var_f1e0b8658014350d[var_f1e0b8658014350d.size] = guy;
            }
        }
    }
    foreach (guy in var_f1e0b8658014350d) {
        if (guy cansee(target)) {
            return 1;
        }
    }
    return 0;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1342
// Size: 0xcf
function headtrack_player_toggle(bool) {
    if (bool) {
        if (!isdefined(self.stealth.allowplayerheadtracking)) {
            self.stealth.allowplayerheadtracking = 1;
        } else if (!self.stealth.allowplayerheadtracking) {
            return;
        }
        if (!isdefined(self.stealth.looking_at_entity)) {
            self.stealth.looking_at_entity = level.player;
        }
        utility::lookatentity(level.player);
    } else if (isdefined(self.stealth.looking_at_entity)) {
        self.stealth.looking_at_entity = undefined;
        utility::lookatentity();
    }
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1418
// Size: 0x32
function lock_player_headtracking_off(duration) {
    self endon("death");
    self notify("lock_headtracking_off");
    self endon("lock_headtracking_off");
    disable_player_headtracking();
    wait(duration);
    enable_player_headtracking();
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1451
// Size: 0x20
function disable_player_headtracking() {
    self.stealth.allowplayerheadtracking = 0;
    headtrack_player_toggle(0);
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1478
// Size: 0x19
function enable_player_headtracking() {
    self.stealth.allowplayerheadtracking = 1;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1498
// Size: 0x1ff
function event_handler_should_ignore(event) {
    event_severity_min = self.stealth.event_severity_min;
    if (!isdefined(event_severity_min)) {
        event_severity_min = level.stealth.event_severity_min;
    }
    if (isdefined(event_severity_min)) {
        diff = namespace_92d413b0c411a750::event_severity_compare(event_severity_min, event.type);
        if (diff > 0) {
            return 1;
        }
    }
    if (event.typeorig == "explosion") {
        if (isdefined(event.entity) && isdefined(event.entity.team) && event.entity.team == self.team) {
            return 1;
        }
    }
    if (event.typeorig == "footstep" || event.typeorig == "footstep_walk") {
        if (function_44f457c9d6a9d038(event)) {
            return 1;
        }
    }
    if (event.typeorig == "footstep_sprint") {
        if (should_ignore_sprint_footstep(event)) {
            return 1;
        }
    }
    if (event.typeorig == "silenced_shot") {
        if (isplayer(event.entity) && distancesquared(event.entity geteye(), event.origin) > 1296) {
            return 1;
        }
    }
    if (event.typeorig == "gunshot" || event.typeorig == "gunshot_impact" || event.typeorig == "gunshot_teammate" || event.typeorig == "bulletwhizby") {
        if (isagent(event.entity) && event.entity isinscriptedstate()) {
            return 1;
        }
    }
    return function_d83f0e5272e07d8c(event);
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169f
// Size: 0x100
function function_d83f0e5272e07d8c(event) {
    if (istrue(stealth_call("event_should_ignore", event))) {
        return 1;
    }
    var_3d816d7a91186fbb = stealth_get_func("event_" + event.type);
    if (isdefined(var_3d816d7a91186fbb)) {
        var_cd3e60a015731c6a = event.type;
        var_1298ba38e89f0611 = event.typeorig;
        var_b74b63836f4d0607 = stealth_call("event_" + event.type, event);
        if (isdefined(event.typeorig)) {
            function_6eb2235636d28921(event.typeorig, event.entity, self, event.type, event.origin, event.investigate_pos);
        } else {
            /#
                assertmsg("We tried modifying the event but somehow emptied the event string. Please fix your stealth function. Event Type: " + var_cd3e60a015731c6a + " Event Name: " + var_1298ba38e89f0611);
            #/
        }
        return var_b74b63836f4d0607;
    }
    return 0;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a7
// Size: 0x3f
function function_44f457c9d6a9d038(event) {
    if (!isplayer(event.entity)) {
        return 1;
    }
    if (event.entity getstance() != "stand") {
        return 1;
    }
    return 0;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ee
// Size: 0x122
function should_ignore_sprint_footstep(event) {
    if (isplayer(event.entity)) {
        dist_sq = distancesquared(self.origin, event.origin);
        traceoffset = (0, 0, 18);
        ignoreents = array_combine(function_67e2b3dda1bee8a(), self function_e2fc2d773338e90f());
        var_4513d58533339de5 = self function_be2f606dbaa90a7d(event.entity, "footstep");
        if (dist_sq < var_4513d58533339de5 * var_4513d58533339de5) {
            return 0;
        } else if (can_trace_to_ai(event.origin + traceoffset, self, ignoreents)) {
            if (isdefined(self.sprintfootstepradius)) {
                sprintfootstepradius = self.sprintfootstepradius;
                if (dist_sq < sprintfootstepradius * sprintfootstepradius) {
                    return 0;
                }
            }
            var_5b5ec4358b49b47e = self cansee(event.entity);
            if (!var_5b5ec4358b49b47e && self function_89931185060d4d6f(event.entity)) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1918
// Size: 0x7e
function event_override_disguise(event) {
    if (issentient(event.entity)) {
        switch (event.typeorig) {
        case #"hash_161d2d6c65d1cc82":
        case #"hash_37d1562da9bab005":
        case #"hash_52ad2c78c47fbfc8":
        case #"hash_9715afcc5dd0e063":
            thread threat_sight_force_visible(event.entity, 1);
            return 1;
            break;
        }
    }
    return 0;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x199e
// Size: 0xcc
function event_override_controlling_robot(event) {
    if (issentient(event.entity)) {
        switch (event.typeorig) {
        case #"hash_161d2d6c65d1cc82":
            return 1;
        case #"hash_1d0022d9b49074c0":
        case #"hash_1de3ab20a61203e4":
        case #"hash_412938e72fd9ab35":
        case #"hash_46bae15508b25675":
        case #"hash_937c75a05af24ea4":
        case #"hash_c910677ee9c31085":
        case #"hash_de811d1d5fa7e6b4":
        case #"hash_ea10345acf995244":
            event.type = "combat";
            return 0;
            break;
        }
    }
    if (event.type != "combat") {
        return 1;
    }
    return 0;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a72
// Size: 0x9c
function event_anyone_within_radius(eventorigin, dist) {
    distsq = dist * dist;
    ais = getaiunittypearray("bad_guys", "all");
    foreach (ai in ais) {
        if (distancesquared(eventorigin, ai.origin) <= distsq) {
            return 1;
        }
    }
    return 0;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b16
// Size: 0x2f8
function event_handler_translate_severity(event) {
    if (!isdefined(event) || !isdefined(event.typeorig)) {
        return;
    }
    if (self [[ self.fnisinstealthhunt ]]()) {
        if (event.type == "investigate") {
            event.type = "cover_blown";
        }
    }
    switch (event.typeorig) {
    case #"hash_641050446d8ad59e":
        if (self.unittype == "dog") {
            event.type = "investigate";
        } else {
            var_926a11e24ff33ab5 = undefined;
            if (isdefined(event.entity) && issentient(event.entity)) {
                var_926a11e24ff33ab5 = event.entity getentitynumber();
            }
            if (isdefined(var_926a11e24ff33ab5) && self function_f4d54a90334a7dea(event.entity, 2)) {
                var_24b0344b8d70d598 = event.entity;
                if (isplayer(event.entity)) {
                    drone = event.entity namespace_e124d8b75dab4be0::get_player_drone();
                    if (isdefined(drone) && !self cansee(event.entity)) {
                        var_24b0344b8d70d598 = drone;
                    }
                }
                self getenemyinfo(var_24b0344b8d70d598);
                event.type = "combat";
            }
        }
        break;
    case #"hash_ea10345acf995244":
        if (isdefined(event.entity) && is_equal(event.entity.model, "offhand_1h_wm_bottle_v0")) {
            event.type = "cover_blown";
        } else if (event_anyone_within_radius(event.origin, 128)) {
            event.type = "combat";
        }
        break;
    case #"hash_1d0022d9b49074c0":
        if (event_anyone_within_radius(event.origin, 192)) {
            event.type = "combat";
        } else if (distancesquared(event.origin, self.origin) <= 1048576) {
            event.type = "combat";
        }
        break;
    case #"hash_412938e72fd9ab35":
        if (distancesquared(event.origin, self.origin) < 640000) {
            event.type = "combat";
        }
        break;
    case #"hash_eaa4394d31c175bf":
        if (self hastacvis(event.origin, 0) && distance2dsquared(event.origin, self.origin) < 36864) {
            event.type = "combat";
        }
        break;
    }
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e15
// Size: 0x25
function trigger_cover_blown(event) {
    if (!isdefined(self.stealth)) {
        return;
    }
    self.var_e31ee88092e41cc8 = 1;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e41
// Size: 0x171
function react_announce(event) {
    self endon("death");
    delaytime = randomfloatrange(0.5, 1.1);
    switch (event.type) {
    case #"hash_e21b072df2b47f94":
        thread namespace_e124d8b75dab4be0::addeventplaybcs("stealth", "announce5", "investigate", delaytime, event);
        /#
            println("override_should_ignore" + self getentitynumber() + "dog" + event.typeorig + "<unknown string>");
        #/
        /#
            namespace_91707ccc3e1bf8ff::function_ec780a18fdfb4982(self, "<unknown string>");
        #/
        return 1;
    case #"hash_f796130a9b9cec5":
        thread namespace_e124d8b75dab4be0::addeventplaybcs("stealth", "announce5", "coverblown", delaytime, event);
        /#
            println("override_should_ignore" + self getentitynumber() + "<unknown string>" + event.typeorig + "<unknown string>");
        #/
        /#
            namespace_91707ccc3e1bf8ff::function_ec780a18fdfb4982(self, "<unknown string>");
        #/
        return 1;
    case #"hash_9e02cd4a0f3ca981":
        thread namespace_e124d8b75dab4be0::addeventplaybcs("stealth", "announce2", "combat", 1, event);
        /#
            println("override_should_ignore" + self getentitynumber() + "<unknown string>" + event.typeorig + "<unknown string>");
        #/
        /#
            namespace_91707ccc3e1bf8ff::function_ec780a18fdfb4982(self, "<unknown string>");
        #/
        return 1;
        break;
    }
    return 0;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fba
// Size: 0x5f
function react_announce_specific(event) {
    self endon("death");
    if (isdefined(event.typeorig)) {
        delaytime = randomfloatrange(0.5, 1);
        thread namespace_e124d8b75dab4be0::addeventplaybcs("stealth", "announce4", event.typeorig, delaytime, event);
        return 1;
    }
    return 0;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2021
// Size: 0x52
function go_to_node_wait_investigate(var_e2a7566fb8a29355, node, var_5297224e2a5333e6) {
    self endon("death");
    if (!isdefined(var_5297224e2a5333e6)) {
        var_5297224e2a5333e6 = 1;
    }
    var_9966d5c750dd965a = !var_5297224e2a5333e6;
    while (!var_9966d5c750dd965a) {
        self [[ var_e2a7566fb8a29355 ]](node);
        var_9966d5c750dd965a = 1;
        self waittill("goal");
    }
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x207a
// Size: 0x4b
function go_to_node_wait(var_e2a7566fb8a29355, node) {
    self endon("death");
    self function_f7cff9f6dafb297();
    if (isdefined(node.var_8ac77218f7a34e3e)) {
        function_b6a081f78a507c7a(var_e2a7566fb8a29355, node);
    } else {
        self [[ var_e2a7566fb8a29355 ]](node);
        self waittill("goal");
    }
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20cc
// Size: 0x42
function function_b6a081f78a507c7a(var_e2a7566fb8a29355, node) {
    self endon("death");
    self [[ var_e2a7566fb8a29355 ]](node);
    self waittill("goal");
    if (isdefined(node.var_8ac77218f7a34e3e)) {
        node scene::play(self, 0);
    }
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2115
// Size: 0x7d
function go_to_node_post_wait(var_e2a7566fb8a29355, node) {
    self endon("death");
    self notify("gotonode_post_wait");
    if (isdefined(self.stealth.idle) && isdefined(node.target)) {
    }
    id = self function_92435c7a6ae85c3c();
    if (isdefined(id)) {
        self function_ea63241a4d3092c4();
    }
    if (isdefined(node.target)) {
        self function_f7cff9f6dafb297();
    }
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2199
// Size: 0x206
function go_to_node_arrived(var_e2a7566fb8a29355, node) {
    go_to_node_wait_investigate(var_e2a7566fb8a29355, node, 0);
    if (isdefined(node.script_moveplaybackrate)) {
        self.moveplaybackrate = node.script_moveplaybackrate;
    }
    if ((istrue(node.script_delay) || istrue(node.script_delay_min) || istrue(node.script_wait) || isdefined(node.script_idle) || istrue(node.patrol_stop) || !isdefined(node.target)) && isdefined(node.angles)) {
        var_82fdf4c0d6ca802c = undefined;
        if (isdefined(node.script_idle)) {
            var_82fdf4c0d6ca802c = node.script_idle;
        }
        self function_e4b58a023e0da030(node.origin, node.angles, var_82fdf4c0d6ca802c);
        self._blackboard.idlenode = node;
        if (!istrue(node.script_delay) && !istrue(node.script_wait)) {
            waitframe();
        }
    }
    if (isdefined(node.script_animation)) {
        anime = node.script_animation;
        namespace_e124d8b75dab4be0::animgenericcustomanimmode(self, "gravity", anime);
    } else if (isdefined(node.var_8ac77218f7a34e3e)) {
        node scene::play(self, 0);
    } else if (isdefined(node.script_idle)) {
        var_82fdf4c0d6ca802c = undefined;
        if (isdefined(node.script_idle)) {
            var_82fdf4c0d6ca802c = node.script_idle;
        }
        self function_e4b58a023e0da030(node.origin, node.angles, var_82fdf4c0d6ca802c);
        self._blackboard.idlenode = node;
    }
    if (isdefined(node.script_animation_exit)) {
        namespace_e124d8b75dab4be0::animgenericcustomanimmode(self, "gravity", node.script_animation_exit);
    }
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23a6
// Size: 0x36
function bt_set_stealth_state(statename, event) {
    /#
        assert(isdefined(self.fnsetstealthstate));
    #/
    self [[ self.fnsetstealthstate ]](statename, event);
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23e3
// Size: 0x20c
function bt_event_handler_severity(event) {
    var_a16e3d3c7cafcd0e = undefined;
    if (isplayer(event.entity) && event.typeorig == "sight") {
        drone = event.entity namespace_e124d8b75dab4be0::get_player_drone();
        if (isdefined(drone) && !self cansee(event.entity)) {
            var_a16e3d3c7cafcd0e = drone;
        }
    }
    event.investigate_pos = event.origin;
    if (isdefined(self.enemy) && isdefined(event.entity) && event.entity == self.enemy) {
        event.investigate_pos = self lastknownpos(self.enemy);
    } else if (isdefined(event.entity) && (event.typeorig == "bulletwhizby" || event.typeorig == "throwingknife_whizby")) {
        event.investigate_pos = event.entity.origin;
    } else if (isdefined(event.entity) && issentient(event.entity) && self function_97bb81acbb14c09c(event.entity) && self cansee(event.entity)) {
        event.investigate_pos = event.entity.origin;
    } else if (isdefined(var_a16e3d3c7cafcd0e)) {
        event.investigate_pos = var_a16e3d3c7cafcd0e.origin;
    }
    event_handler_translate_severity(event);
    if (event_handler_should_ignore(event)) {
        return 0;
    }
    if (isdefined(var_a16e3d3c7cafcd0e)) {
        event.entity = var_a16e3d3c7cafcd0e;
    }
    self.last_severity_time = gettime();
    function_dfdec2ff9ba6b863(event);
    return 1;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25f7
// Size: 0xc1
function function_dfdec2ff9ba6b863(event) {
    if (!namespace_e124d8b75dab4be0::bcisincombat()) {
        if (!react_announce_specific(event)) {
            react_announce(event);
        }
    }
    switch (event.type) {
    case #"hash_e21b072df2b47f94":
        thread bt_event_investigate(event);
        break;
    case #"hash_f796130a9b9cec5":
        thread bt_event_cover_blown(event);
        break;
    case #"hash_9e02cd4a0f3ca981":
        thread bt_event_combat(event);
        break;
    }
    level notify("stealth_event", event);
    func = stealth_get_func(event.typeorig);
    if (isdefined(func) && func != &bt_event_handler_severity) {
        self thread [[ func ]](event);
    }
    return 1;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26c0
// Size: 0x35
function bt_event_investigate(event) {
    if (self [[ self.fnisinstealthcombat ]]()) {
        return;
    }
    self function_1aff80c5fc5a3eea("alert");
    bt_set_stealth_state("investigate", event);
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26fc
// Size: 0x130
function bt_event_cover_blown(event) {
    if (!isdefined(self.fnisinstealthcombat) || self [[ self.fnisinstealthcombat ]]()) {
        return;
    }
    if (isdefined(event.entity) && isdefined(event.entity.classname) && event.entity.classname == "script_vehicle_blackhornet") {
        return;
    }
    if (event.typeorig == "light_killed") {
        event.look_pos = event.investigate_pos;
        event.investigate_pos = drop_to_ground(event.investigate_pos, 24, -256);
    }
    if (event.typeorig == "grenade danger") {
        self.grenadeawareness = 1;
        self.grenadereturnthrowchance = 0;
        if (self.var_fe5ebefa740c7106 == 2) {
            return;
        }
    }
    self function_1aff80c5fc5a3eea("alert");
    if (self [[ self.fnisinstealthhunt ]]()) {
        if (function_cb5dc7bd04b05b04(event, self)) {
            return;
        }
    } else {
        bt_set_stealth_state("investigate", event);
    }
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2833
// Size: 0x4e
function bt_event_combat(event) {
    self notify("stop_going_to_node");
    bt_set_stealth_state("combat", event);
    if (isdefined(event) && issentient(event.entity)) {
        if (!isdefined(self.enemy)) {
            self resetthreatupdate();
        }
    }
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2888
// Size: 0x37
function set_provide_cover_fire() {
    self.providecoveringfire = 1;
    self endon("death");
    self endon("stealth_investigate");
    self endon("stealth_hunt");
    self endon("stealth_combat");
    wait(5);
    self.providecoveringfire = 0;
}

// Namespace enemy/namespace_6db9b2dcda758664
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c6
// Size: 0x2a3
function function_482904a05ecb1101(var_8f4ef4fdb5e7800a, var_93279c66a2e49a45, var_d24e406e7deefabc) {
    switch (var_93279c66a2e49a45) {
    case 0:
        thread namespace_e124d8b75dab4be0::addeventplaybcs("stealth", "state_change", "idle", undefined, undefined);
        break;
    case 1:
        if (var_8f4ef4fdb5e7800a == 1) {
            thread namespace_e124d8b75dab4be0::addeventplaybcs("stealth", "state_change", "update_investigate", undefined, undefined);
        } else {
            self.script_forcegoal = 0;
            level thread namespace_e5c9a7258a3d79cb::function_92f7df07df367143(self);
            if (var_d24e406e7deefabc) {
            }
        }
        break;
    case 2:
        self.last_set_goalnode = undefined;
        self.last_set_goalent = undefined;
        level thread namespace_e5c9a7258a3d79cb::pod_hunt_vo();
        if (var_d24e406e7deefabc) {
            squadid = function_8d0e1f40856173f4(self);
            thread namespace_e5c9a7258a3d79cb::pod_hunt_update(squadid);
        }
        if (isdefined(self.script_stealth_region_group)) {
            self function_9e200fd4120297e8(self.script_stealth_region_group);
        }
        thread namespace_e124d8b75dab4be0::addeventplaybcs("stealth", "state_change", "hunt", undefined, undefined);
        break;
    case 3:
        namespace_92d413b0c411a750::event_escalation_clear();
        if (isdefined(self.script_stealthgroup)) {
            goalvolume = level.stealth.combat_volumes[self.script_stealthgroup];
            if (isdefined(goalvolume)) {
                self setgoalvolumeauto(goalvolume);
                self forceupdategoalpos();
            } else if (isdefined(level.stealth.combat_goalradius) && isdefined(level.stealth.combat_goalradius[self.script_stealthgroup])) {
                self setgoalpos(self.scriptgoalpos, level.stealth.combat_goalradius[self.script_stealthgroup]);
                self forceupdategoalpos();
            }
        }
        namespace_2f36c2cc5a44d845::grenadeawareness();
        if (var_d24e406e7deefabc) {
            pod = function_bc5df124338cefea(self);
            if (isdefined(pod)) {
                pod thread namespace_e5c9a7258a3d79cb::pod_combat_update_checklosttarget();
            }
            var_f16e8cb356cb454d = ter_op(var_8f4ef4fdb5e7800a < 2, "first_combat", "combat");
        } else {
            var_f16e8cb356cb454d = "join_combat";
        }
        if (var_f16e8cb356cb454d == "first_combat") {
            function_216c67ab6749137a(self, undefined, "initial_combat", undefined, 2);
        }
        if (var_f16e8cb356cb454d == "first_combat" && getdvarint(@"hash_df03d7ac5b31599") == 1) {
            return;
        } else {
            function_216c67ab6749137a(self, undefined, var_f16e8cb356cb454d, undefined, 2);
        }
        break;
    default:
        /#
            assertmsg("unsupported state from code " + var_93279c66a2e49a45);
        #/
        break;
    }
}

