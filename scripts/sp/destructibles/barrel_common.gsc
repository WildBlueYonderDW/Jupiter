#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\sp\player\gestures.gsc;

#namespace namespace_5cc04bea2bab73e7;

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x14b
// Size: 0xe0
function barrel_setup(subtype, barrel_health, var_9a4c98958a819874, var_c15f10425692fc0d, var_cccd919d92c1c40, min_range_max_amp, var_3f07f189631aa7b6) {
    if (!isdefined(level.phys_barrels)) {
        level.phys_barrels = [];
    }
    level.phys_barrels = array_add(level.phys_barrels, self);
    self.onfire = undefined;
    self.subtype = subtype;
    self.isbarrel = 1;
    self setcandamage(1);
    self.barrel_health = barrel_health;
    self.phys_barrel_radius = var_9a4c98958a819874;
    self.phys_amp_normal = var_c15f10425692fc0d;
    self.phys_amp_max = var_cccd919d92c1c40;
    self.min_range_max_amp = min_range_max_amp;
    self.spewtags = [];
    thread barrel_cleanup();
    thread barrel_nav_obstruction();
}

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x233
// Size: 0xb9
function barrel_nav_obstruction() {
    var_373f8b6fb3bd6fbc = createnavobstaclebybounds(self.origin, (12, 12, 50), (0, 0, 0));
    var_8edeba7f896c4553 = undefined;
    while (isdefined(self) && self.spewtags.size <= 0) {
        wait 0.05;
    }
    if (!isdefined(self)) {
        destroynavobstacle(var_373f8b6fb3bd6fbc);
        return;
    }
    var_90d8a00109786d78 = self.phys_barrel_radius / 4.5;
    var_8edeba7f896c4553 = "barrel" + self getentitynumber();
    createnavrepulsor(var_8edeba7f896c4553, -1, self, var_90d8a00109786d78, 1);
    waittill_either("barrel_death", "entitydeleted");
    destroynavobstacle(var_373f8b6fb3bd6fbc);
}

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f4
// Size: 0x1a
function is_self_detonating(subtype) {
    return self.subtype == "red";
}

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x317
// Size: 0x2c
function barrel_cleanup() {
    waittill_either("barrel_death", "entitydeleted");
    level.phys_barrels = array_remove(level.phys_barrels, self);
}

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34b
// Size: 0x9e
function get_barrels(subtype) {
    if (!isdefined(subtype)) {
        return level.phys_barrels;
    }
    barrels = [];
    foreach (barrel in level.phys_barrels) {
        if (isdefined(barrel.subtype) && barrel.subtype == subtype) {
            barrels = array_add(barrels, barrel);
        }
    }
    return barrels;
}

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f1
// Size: 0x3c
function barrel_fusetimer(timer) {
    self endon("barrel_death");
    self notify("new_barrel_timer");
    self endon("new_barrel_timer");
    wait timer;
    while (isdefined(self.dont_explode)) {
        waitframe();
    }
    self notify("barrel_death");
}

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x435
// Size: 0x10b
function barrel_block_gesture(max_dist, spot) {
    if (level.player isthrowinggrenade() || level.player isthrowingbackgrenade()) {
        return;
    }
    dist = distance2dsquared(level.player.origin, spot);
    if (dist > squared(max_dist)) {
        return;
    }
    if (dist > squared(max_dist * 0.25)) {
        dot = vectordot(flatten_vector(vectornormalize(spot - level.player.origin)), anglestoforward(level.player.angles));
        if (dot < 0) {
            return;
        }
    }
    if (!scripts\engine\trace::ray_trace_passed(spot + (0, 0, 12), level.player geteye(), undefined, scripts\engine\trace::create_world_contents())) {
        return;
    }
    level.player thread barrel_reaction_gesture(spot);
}

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x548
// Size: 0xb4
function barrel_reaction_gesture(spot) {
    self endon("death");
    tagorigin = spawn_tag_origin(spot, (0, 0, 0));
    thread delete_on_death(tagorigin);
    var_b03cfac5ee568943 = "ges_frag_block";
    var_447611fd38474e73 = self playgestureviewmodel(var_b03cfac5ee568943, tagorigin, 1, 0.1);
    if (var_447611fd38474e73) {
        childthread scripts\sp\player\gestures::player_gestures_input_disable(var_b03cfac5ee568943, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1.4, "barrelReactionGesture");
        while (true) {
            var_b03cfac5ee568943 = self waittill("gesture_stopped");
            if (var_b03cfac5ee568943 == "ges_frag_block") {
                break;
            }
        }
    }
    if (isdefined(tagorigin)) {
        tagorigin delete();
    }
}

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x604
// Size: 0x46
function isplayersniperhit(attacker, objweapon) {
    if (isdefined(attacker) && isdefined(objweapon) && attacker == level.player && objweapon.classname == "sniper") {
        return true;
    }
    return false;
}

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x653
// Size: 0x1f
function isdirectunderbarrelhit(type) {
    if (isdefined(type) && type == "MOD_IMPACT") {
        return true;
    }
    return false;
}

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x67b
// Size: 0x69
function isgrenadeinrange(point, type, range) {
    if (!isdefined(type)) {
        return 0;
    }
    if (isdefined(type) && type != "MOD_GRENADE" && type != "MOD_GRENADE_SPLASH") {
        return 0;
    }
    if (!isdefined(point)) {
        return;
    }
    dist = distance(self.origin, point);
    if (dist > range) {
        return 0;
    }
    return 1;
}

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6ed
// Size: 0x49
function isvalidbarreldamage(attacker, type) {
    if (isdefined(attacker) && isai(attacker)) {
        return false;
    }
    if (isdefined(attacker) && isdefined(attacker.isbarrel)) {
        return false;
    }
    if (ismeleedamage(type)) {
        return false;
    }
    return true;
}

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x73f
// Size: 0xb7
function barrel_launch(var_f3b898b4c1762e04, var_d062fa74a20c4a2, timer) {
    self endon("barrel_death");
    wait timer;
    if (!isdefined(self)) {
        return;
    }
    var_edcb1eeb9e6136bf = vectornormalize(self.origin - var_f3b898b4c1762e04);
    var_ca8f37e9d92bb48 = self.phys_amp_normal;
    if (var_d062fa74a20c4a2 <= self.min_range_max_amp) {
        var_ca8f37e9d92bb48 = self.phys_amp_max;
    }
    distcheck = self.phys_barrel_radius - var_d062fa74a20c4a2;
    var_7e47bfbb162bf7fe = distcheck / self.phys_barrel_radius;
    var_7e47bfbb162bf7fe *= var_ca8f37e9d92bb48;
    self physicslaunchserver(self.origin, var_edcb1eeb9e6136bf * var_7e47bfbb162bf7fe);
}

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7fe
// Size: 0x14
function barrel_one_hit_kill() {
    self waittill("damage");
    waitframe();
    waitframe();
    self notify("barrel_death");
}

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81a
// Size: 0xa2
function barrel_player() {
    self endon("entitydeleted");
    while (true) {
        while (distancesquared(level.player.origin, self.origin) > squared(40)) {
            wait 0.05;
        }
        var_602f0504ad8de573 = self physics_getentitycenterofmass();
        var_602f0504ad8de573 = var_602f0504ad8de573["unscaled"] + (0, 0, 4);
        self physicslaunchserver(var_602f0504ad8de573, vectornormalize(self.origin - level.player.origin) * 1000);
        wait 0.05;
    }
}

// Namespace namespace_5cc04bea2bab73e7 / scripts\sp\destructibles\barrel_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8c4
// Size: 0x9e
function barrel_debug() {
    self endon("barrel_death");
    starttime = undefined;
    var_2be0c96385c78102 = undefined;
    setdvarifuninitialized(@"hash_d15deb4bc845fb2", 0);
    for (;;) {
        if (!getdvarint(@"hash_d15deb4bc845fb2")) {
        } else {
            /#
                print3d(self gettagorigin("<dev string:x1c>") + (0, 0, 10), self.barrel_health);
            #/
            thread draw_circle(self.origin, 250, (1, 0, 0), 1, 0, 1);
        }
        wait 0.05;
    }
}

