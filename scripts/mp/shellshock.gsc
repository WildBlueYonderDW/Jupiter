// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\mp\equipment\flash_grenade.gsc;
#using script_588f0d30a20975f5;
#using scripts\mp\equipment\gas_grenade.gsc;
#using scripts\mp\laststand.gsc;
#using script_6853191397ec0259;

#namespace shellshock;

// Namespace shellshock/namespace_6de0840c25c8dc22
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bc
// Size: 0xa9
function init() {
    level._effect["slide_dust"] = loadfx("vfx/core/screen/vfx_scrnfx_tocam_slidedust_m");
    level._effect["hit_left"] = loadfx("vfx/core/screen/vfx_blood_hit_left");
    level._effect["hit_right"] = loadfx("vfx/core/screen/vfx_blood_hit_right");
    namespace_3c37cb17ade254d::registersharedfunc("shellshock", "flashInterruptDelayFunc", &namespace_5e840d01a2244aea::calculateinterruptdelay);
    namespace_3c37cb17ade254d::registersharedfunc("shellshock", "concussionInterruptDelayFunc", &namespace_ed24ea3973f52fdd::calculateinterruptdelay);
    namespace_3c37cb17ade254d::registersharedfunc("shellshock", "gasInterruptDelayFunc", &namespace_d39a86483d995ed1::gas_getblurinterruptdelayms);
    namespace_3c37cb17ade254d::registersharedfunc("shellshock", "lastStandInterruptDelayFunc", &namespace_10260b963310d30e::getshellshockinterruptdelayms);
}

// Namespace shellshock/namespace_6de0840c25c8dc22
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36c
// Size: 0xbf
function shellshockondamage(cause, damage) {
    if (isdefined(self.flashendtime) && gettime() < self.flashendtime) {
        return;
    }
    if (cause == "MOD_EXPLOSIVE" || cause == "MOD_GRENADE" || cause == "MOD_GRENADE_SPLASH" || cause == "MOD_PROJECTILE" || cause == "MOD_PROJECTILE_SPLASH") {
        if (damage > 10) {
            if (isdefined(self.shellshockreduction) && self.shellshockreduction) {
                _shellshock("light_damage_mp", "damage", self.shellshockreduction);
            } else {
                _shellshock("light_damage_mp", "damage", 0.5);
            }
        }
    }
}

// Namespace shellshock/namespace_6de0840c25c8dc22
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x432
// Size: 0x14
function endondeath() {
    self waittill("death");
    waittillframeend();
    self notify("end_explode");
}

// Namespace shellshock/namespace_6de0840c25c8dc22
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44d
// Size: 0x82
function grenade_earthquake(scale, var_7bb0eac0599aa23d) {
    /#
        assertex(!isdefined(scale) || scale > 0, "Invalid scale passed to grenade_earthQuake()");
    #/
    self notify("grenade_earthQuake");
    self endon("grenade_earthQuake");
    thread endondeath();
    self endon("end_explode");
    position = undefined;
    if (!isdefined(var_7bb0eac0599aa23d) || var_7bb0eac0599aa23d) {
        position = self waittill("explode");
    } else {
        position = self.origin;
    }
    grenade_earthquakeatposition_internal(position, scale);
}

// Namespace shellshock/namespace_6de0840c25c8dc22
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d6
// Size: 0x1d
function grenade_earthquakeatposition(position, scale) {
    grenade_earthquakeatposition_internal(position, scale);
}

// Namespace shellshock/namespace_6de0840c25c8dc22
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fa
// Size: 0x6e
function grenade_earthquakeatposition_internal(position, scale) {
    if (!isdefined(scale)) {
        scale = 1;
    }
    playrumbleonposition("grenade_rumble", position);
    var_be290e030ae1165a = 0.45 * scale;
    var_d4400603d79f0cf4 = 0.7;
    rad = 800;
    earthquake(var_be290e030ae1165a, var_d4400603d79f0cf4, position, rad);
    _screenshakeonposition(position, 600);
}

// Namespace shellshock/namespace_6de0840c25c8dc22
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56f
// Size: 0x14
function bloodmeleeeffect(objweapon) {
    namespace_1ce798d596a27341::bloodmeleeeffect(objweapon);
}

// Namespace shellshock/namespace_6de0840c25c8dc22
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58a
// Size: 0xba
function c4_earthquake() {
    thread endondeath();
    self endon("end_explode");
    position = self waittill("explode");
    playrumbleonposition("grenade_rumble", position);
    earthquake(0.4, 0.75, position, 512);
    var_99aff74b8ea85298 = utility::playersinsphere(position, 512);
    foreach (player in var_99aff74b8ea85298) {
        if (player isusingremote()) {
            continue;
        }
        player setclientomnvar("ui_hud_shake", 1);
    }
}

// Namespace shellshock/namespace_6de0840c25c8dc22
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64b
// Size: 0xf5
function artillery_earthquake(position, duration, var_ed404db23f89e299, var_ed1d39b23f636ee5, var_ed1d3fb23f637c17, radiusmax, var_809f6a04440a9dbb, radiusmin, var_78ce85a35312119, playrumble, var_a03583ed539bdb39) {
    if (!isdefined(duration)) {
        duration = 1;
    }
    if (!isdefined(var_ed404db23f89e299)) {
        var_ed404db23f89e299 = 0.35;
    }
    if (!isdefined(var_ed1d39b23f636ee5)) {
        var_ed1d39b23f636ee5 = 0.15;
    }
    if (!isdefined(var_ed1d3fb23f637c17)) {
        var_ed1d3fb23f637c17 = 0.05;
    }
    if (!isdefined(radiusmax)) {
        radiusmax = 800;
    }
    if (!isdefined(var_809f6a04440a9dbb)) {
        var_809f6a04440a9dbb = 2500;
    }
    if (!isdefined(radiusmin)) {
        radiusmin = 10000;
    }
    if (!isdefined(playrumble)) {
        playrumble = 1;
    }
    if (!isdefined(var_a03583ed539bdb39)) {
        var_a03583ed539bdb39 = 1;
    }
    function_e45e5fd94ec4af36(var_ed404db23f89e299, var_ed1d39b23f636ee5, var_ed1d3fb23f637c17, duration, position, radiusmax, var_809f6a04440a9dbb, radiusmin);
    if (istrue(playrumble)) {
        playrumbleonposition("artillery_rumble", position);
    }
    if (istrue(var_a03583ed539bdb39)) {
        _screenshakeonposition(position, radiusmax, var_78ce85a35312119);
    }
}

// Namespace shellshock/namespace_6de0840c25c8dc22
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x747
// Size: 0xa1
function stealthairstrike_earthquake(position) {
    playrumbleonposition("grenade_rumble", position);
    earthquake(1, 0.6, position, 2000);
    var_99aff74b8ea85298 = utility::playersinsphere(position, 1000);
    foreach (player in var_99aff74b8ea85298) {
        if (player isusingremote()) {
            continue;
        }
        player setclientomnvar("ui_hud_shake", 1);
    }
}

// Namespace shellshock/namespace_6de0840c25c8dc22
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ef
// Size: 0x37
function airstrike_earthquake(position) {
    playrumbleonposition("artillery_rumble", position);
    earthquake(0.5, 0.65, position, 1000);
    _screenshakeonposition(position, 900);
}

// Namespace shellshock/namespace_6de0840c25c8dc22
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x82d
// Size: 0xee
function pulsegrenade_earthquake(var_7bb0eac0599aa23d) {
    self notify("pulseGrenade_earthQuake");
    self endon("pulseGrenade_earthQuake");
    thread endondeath();
    self endon("end_explode");
    position = undefined;
    if (!isdefined(var_7bb0eac0599aa23d) || var_7bb0eac0599aa23d) {
        position = self waittill("explode");
    } else {
        position = self.origin;
    }
    playrumbleonposition("grenade_rumble", position);
    earthquake(0.3, 0.35, position, 800);
    var_99aff74b8ea85298 = utility::playersinsphere(position, 300);
    foreach (player in var_99aff74b8ea85298) {
        if (player isusingremote()) {
            continue;
        }
        player setclientomnvar("ui_hud_shake", 1);
    }
}

// Namespace shellshock/namespace_6de0840c25c8dc22
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x922
// Size: 0xee
function engineerdrone_earthquake(var_7bb0eac0599aa23d) {
    self notify("pulseGrenade_earthQuake");
    self endon("pulseGrenade_earthQuake");
    thread endondeath();
    self endon("end_explode");
    position = undefined;
    if (!isdefined(var_7bb0eac0599aa23d) || var_7bb0eac0599aa23d) {
        position = self waittill("explode");
    } else {
        position = self.origin;
    }
    playrumbleonposition("grenade_rumble", position);
    earthquake(0.3, 0.35, position, 800);
    var_99aff74b8ea85298 = utility::playersinsphere(position, 300);
    foreach (player in var_99aff74b8ea85298) {
        if (player isusingremote()) {
            continue;
        }
        player setclientomnvar("ui_hud_shake", 1);
    }
}

// Namespace shellshock/namespace_6de0840c25c8dc22
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa17
// Size: 0xb8
function _screenshakeonposition(position, radius, var_78ce85a35312119) {
    var_762df206b07e49dd = utility::playersinsphere(position, radius);
    foreach (player in var_762df206b07e49dd) {
        if (isdefined(var_78ce85a35312119)) {
            if (isarray(var_78ce85a35312119)) {
                if (array_contains(var_78ce85a35312119, player)) {
                    continue;
                }
                goto LOC_00000089;
            }
            jumpiffalse(player == var_78ce85a35312119) LOC_00000089;
        } else {
        LOC_00000089:
            if (player isusingremote()) {
                continue;
            }
            player setclientomnvar("ui_hud_shake", 1);
        }
    }
}

