#using scripts\engine\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\equipment\offhands.gsc;
#using scripts\sp\player\cursor_hint.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_644c8b26caaac809;

// Namespace namespace_644c8b26caaac809 / namespace_7a9d05cd551e40e9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18f
// Size: 0x50
function precache(offhand) {
    level.offhands.var_e1d317c7329ac2d2 = spawnstruct();
    level.offhands.var_e1d317c7329ac2d2.var_83fc771306eded0f = [];
    registeroffhandfirefunc(offhand, &function_8a9f51e377f0e1af);
}

// Namespace namespace_644c8b26caaac809 / namespace_7a9d05cd551e40e9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e7
// Size: 0x35
function function_8a9f51e377f0e1af(grenade, weapon) {
    if (!isdefined(grenade)) {
        return;
    }
    self notify("player_improvisedMinePlaced");
    thread function_f5964c57cc8da167(grenade, self, self.team, weapon);
}

// Namespace namespace_644c8b26caaac809 / namespace_7a9d05cd551e40e9
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x224
// Size: 0xf4
function function_f5964c57cc8da167(grenade, mineowner, team, var_4fa68e590a2bcf6) {
    grenade endon("entitydeleted");
    grenade endon("death");
    mineowner endon("death");
    level.offhands.var_e1d317c7329ac2d2.var_83fc771306eded0f = array_add(level.offhands.var_e1d317c7329ac2d2.var_83fc771306eded0f, grenade);
    grenade.team = default_to(mineowner.team, team);
    grenade setentityowner(mineowner);
    grenade setotherent(mineowner);
    grenade makeunusable();
    grenade.targetname = "offhand_car_grenade";
    grenade waittill("missile_stuck");
    grenade setcandamage(1);
    thread function_6e5ce23490c6fea6(grenade, var_4fa68e590a2bcf6, %EQUIPMENT/IMPROVISED_MINE_PICKUP);
    grenade childthread function_d5b93c92c3f30a80(mineowner);
    grenade thread function_57abe555dd7dd3b8(mineowner);
}

// Namespace namespace_644c8b26caaac809 / namespace_7a9d05cd551e40e9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x320
// Size: 0x8b
function function_180c6f276018e945() {
    nearbyenemies = getaiarrayinradius(self.origin, 200, "axis");
    foreach (var_a09e6d340590460a in nearbyenemies) {
        if (!isdefined(var_a09e6d340590460a.stealth)) {
            continue;
        }
        var_a09e6d340590460a aieventlistenerevent("investigate", self, self.origin);
    }
}

// Namespace namespace_644c8b26caaac809 / namespace_7a9d05cd551e40e9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3b3
// Size: 0xa5
function function_fc5ca7252f44256a(mineowner, var_ff882f75755f7367) {
    mineowner endon("death");
    mineowner endon("detonate");
    while (true) {
        scripts\sp\player\cursor_hint::create_cursor_hint(undefined, (0, 0, 5), %EQUIPMENT/IMPROVISED_MINE_PICKUP, 55, 100, 70, 0);
        childthread function_bb7d0fd0262d852d(%EQUIPMENT/IMPROVISED_MINE_PICKUP, var_ff882f75755f7367);
        self waittill("trigger");
        pickedup = function_e2c7f0ed80637008(var_ff882f75755f7367);
        if (!pickedup) {
            continue;
        }
        if (isdefined(self)) {
            if (isdefined(self.trigger)) {
                self.trigger delete();
            }
        }
        self delete();
        return;
    }
}

// Namespace namespace_644c8b26caaac809 / namespace_7a9d05cd551e40e9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x460
// Size: 0xae
function function_d5b93c92c3f30a80(mineowner) {
    self endon("entitydeleted");
    self.trigger = spawn("trigger_radius", self.origin, 23, 55, 72);
    wait 2;
    while (true) {
        self.trigger waittill("trigger", var_2087e4030aa793b);
        if (!is_equal(var_2087e4030aa793b.team, self.team)) {
            break;
        }
        if (!isdefined(var_2087e4030aa793b.velocity)) {
            continue;
        }
        if (!length(var_2087e4030aa793b.velocity)) {
            continue;
        }
    }
    thread function_5a73691d0868ca47(mineowner);
}

// Namespace namespace_644c8b26caaac809 / namespace_7a9d05cd551e40e9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x516
// Size: 0x9e
function function_57abe555dd7dd3b8(mineowner) {
    self endon("entitydeleted");
    mineowner endon("death");
    while (true) {
        self waittill("damage", null, attacker, null, null, meansofdeath);
        if (!isplayer(attacker)) {
            continue;
        }
        if (meansofdeath == "MOD_MELEE") {
            continue;
        }
        if (meansofdeath == "MOD_IMPACT" && is_equal(attacker.team, self.team)) {
            continue;
        }
        thread function_5a73691d0868ca47(attacker);
        break;
    }
}

// Namespace namespace_644c8b26caaac809 / namespace_7a9d05cd551e40e9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5bc
// Size: 0x199
function function_5a73691d0868ca47(attacker) {
    earthquake(0.25, 0.35, self.origin, 1000);
    playrumbleonposition("grenade_rumble", self.origin);
    if (scripts\engine\trace::ray_trace_passed(self.origin, level.player geteye(), self, scripts\engine\trace::create_world_contents())) {
        var_a830aa21c1b60a3c = distancesquared(level.player.origin, self.origin);
        if (var_a830aa21c1b60a3c <= 10000) {
            level.player do_damage(99999, self.origin, attacker, self, "MOD_EXPLOSIVE");
        } else if (var_a830aa21c1b60a3c <= 16900) {
            level.player shellshock("default_nosound", 2);
        }
    }
    enemies = getaiarrayinradius(self.origin, 350);
    foreach (enemy in enemies) {
        enemy do_damage(2000, self.origin, attacker, self, "MOD_EXPLOSIVE");
    }
    if (isdefined(self)) {
        if (isdefined(self.trigger)) {
            self.trigger delete();
        }
        function_dc31ef5a2d33be25();
        scripts\sp\player\cursor_hint::remove_cursor_hint();
        self detonate();
    }
    function_1c1b9d33706c152d(attacker, "explosion");
}

// Namespace namespace_644c8b26caaac809 / namespace_7a9d05cd551e40e9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x75d
// Size: 0x44
function function_dc31ef5a2d33be25() {
    level.offhands.var_e1d317c7329ac2d2.var_83fc771306eded0f = array_remove(level.offhands.var_e1d317c7329ac2d2.var_83fc771306eded0f, self);
}

