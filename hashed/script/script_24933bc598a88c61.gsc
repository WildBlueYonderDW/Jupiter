// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\cp_mp\utility\callback_group.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\engine\trace.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_a35012b9b75a996;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\shellshock.gsc;
#using script_104e3370b024f998;
#using script_7ef95bba57dc4b82;

#namespace super_electric_discharge;

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x373
// Size: 0x8d
function function_9e8a4373c9755f3d() {
    namespace_1cd9f6896754adb0::function_2d6e7e0b80767910("electricFire", [0:"usability", 1:"mantle", 2:"armor", 3:"supers", 4:"killstreaks", 5:"ladder", 6:"melee", 7:"execution_attack", 8:"execution_victim"]);
    namespace_3c37cb17ade254d::registersharedfunc("super_electric_discharge", "giveAndFireOffhand", &function_1b73127b2849cc95);
    namespace_3c37cb17ade254d::registersharedfunc("super_electric_discharge", "endSuper", &function_456170ef7257430b);
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x407
// Size: 0x32
function function_c0327b881b392647() {
    giveperk("specialty_blastshield");
    result = function_4468fd6516623b9f();
    if (!istrue(result)) {
        removeperk("specialty_blastshield");
    }
    return result;
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x441
// Size: 0x4b
function function_4468fd6516623b9f() {
    if (self isinexecutionattack() || self isinexecutionvictim()) {
        return 0;
    }
    thread namespace_44abc05161e2e2cb::showsplash("super_electric_discharge" + "_activate", undefined, self, undefined, undefined, undefined, 1);
    self setscriptablepartstate("superpowers", "electric_charge", 0);
    return function_b275e1f539394ae1(undefined);
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x494
// Size: 0x12f
function function_1b73127b2849cc95(killstreakbundle) {
    self endon("disconnect");
    level endon("game_ended");
    if (self isinexecutionattack() || self isinexecutionvictim()) {
        return 0;
    }
    objweapon = makeweapon("electric_discharge_mp");
    var_f24845eeaeedc946 = namespace_e0ee43ef2dddadaa::getgrenadeinpullback();
    if (isdefined(var_f24845eeaeedc946) && !isnullweapon(var_f24845eeaeedc946) && var_f24845eeaeedc946 != objweapon) {
        self.var_f3bc490293d6afd5 = gettime();
    }
    if (isdefined(self.var_f3bc490293d6afd5)) {
        lastfiretime = self.var_f3bc490293d6afd5;
        if ((gettime() - lastfiretime) / 1000 <= 1.5) {
            return 0;
        }
    }
    if (!function_da1cc53c13568565()) {
        return 0;
    }
    self giveandfireoffhand(objweapon);
    namespace_1cd9f6896754adb0::function_3633b947164be4f3("electricFire", 0);
    result = function_9abe408951f8cc02();
    namespace_1cd9f6896754adb0::function_588f2307a3040610("electricFire");
    if (isdefined(result) && (result == "offhand_fired" || result == "timeout")) {
        return function_b275e1f539394ae1(killstreakbundle);
    } else if (!isdefined(result) || result == "death") {
        self.var_f3bc490293d6afd5 = undefined;
    }
    return 0;
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cb
// Size: 0xe
function function_e721c06d0e8502bf() {
    thread function_1b73127b2849cc95(undefined);
    return 1;
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5e1
// Size: 0x6c
function private function_b275e1f539394ae1(killstreakbundle) {
    self notify("electric_blast_succeed");
    self.var_f3bc490293d6afd5 = gettime();
    if (!isdefined(killstreakbundle)) {
        self.super.isactive = 1;
        namespace_aad14af462a74d08::function_d997435895422ecc("super_electric_discharge", namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    }
    thread function_b07326afbb0334d3(killstreakbundle);
    return 1;
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x655
// Size: 0x79
function private function_da1cc53c13568565() {
    return isreallyalive(self) && !isinlaststand(self) && !self function_9cc921a57ff4deb5() && !self isonladder() && !self ismantling() && !self function_415fe9eeca7b2e2b() && !self isinfreefall() && !self isparachuting() && !self function_e5bf22923d0004bc() && !self ismeleeing() && !self isswitchingweapon() && !isusingremote();
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6d6
// Size: 0x3a
function private function_9abe408951f8cc02() {
    self endon("disconnect");
    level endon("game_ended");
    thread function_127ef8142005081a();
    result = waittill_any_timeout_4(0.9, "offhand_fired", "electric_blast_fail");
    return result;
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x718
// Size: 0x43
function function_127ef8142005081a() {
    self endon("disconnect");
    self endon("electric_blast_succeed");
    var_2f58778b47edf515 = 0;
    while (1) {
        if (!function_da1cc53c13568565()) {
            var_2f58778b47edf515 = 1;
            break;
        }
        waitframe();
    }
    if (istrue(var_2f58778b47edf515)) {
        self notify("electric_blast_fail");
    }
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x762
// Size: 0x26a
function private function_b07326afbb0334d3(killstreakbundle) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    thread function_3ce4b28ed71f750a();
    var_5da234812450b0d7 = self.origin;
    var_170b85c668cf4b59 = self.angles;
    step = 100;
    if (isdefined(killstreakbundle)) {
        goto LOC_00000120;
    }
    maxdist = 400;
    waittime = 0.1;
    var_556b31282abcb132 = step;
    var_f3ea705a2e523bad = function_1fd889c40c7941b8();
    var_afc2f18cdaa6c9cc = function_2d7fd59d039fa69b(self.origin, maxdist);
    var_9ba81be3ce3691 = function_2c9f694b8b0758e1(var_afc2f18cdaa6c9cc, var_5da234812450b0d7, var_f3ea705a2e523bad);
    var_6f0350c82fc94c38 = function_107fdcaa299cfa40();
    var_82636d311009a1eb = function_8b664d9dfe6f4a7e(var_6f0350c82fc94c38, var_5da234812450b0d7);
    while (var_556b31282abcb132 <= maxdist) {
        var_186931b5967c0e6 = var_556b31282abcb132 * var_556b31282abcb132;
        var_fe93d078a44d7866 = [];
        foreach (var_ad63323b4b7fde00 in var_9ba81be3ce3691) {
            victim = var_ad63323b4b7fde00["player"];
            var_88b443ee2963b2a0 = var_ad63323b4b7fde00["distanceSQ"];
            if (var_88b443ee2963b2a0 <= var_186931b5967c0e6) {
                function_ef718870091ebbd9(victim, var_f3ea705a2e523bad);
            } else {
                var_fe93d078a44d7866[var_fe93d078a44d7866.size] = var_ad63323b4b7fde00;
            }
        }
        var_9ba81be3ce3691 = var_fe93d078a44d7866;
        var_6bb2d94137551dbc = [];
        foreach (var_bc910fd8949150f6 in var_82636d311009a1eb) {
            ent = var_bc910fd8949150f6["entity"];
            var_88b443ee2963b2a0 = var_bc910fd8949150f6["distanceSQ"];
            if (var_88b443ee2963b2a0 <= var_186931b5967c0e6) {
                function_822a7fd2e23b8fb6(ent);
            } else {
                var_6bb2d94137551dbc[var_6bb2d94137551dbc.size] = var_bc910fd8949150f6;
            }
        }
        var_82636d311009a1eb = var_6bb2d94137551dbc;
        var_556b31282abcb132 = var_556b31282abcb132 + step;
        wait(waittime);
    }
    if (!isdefined(killstreakbundle)) {
        self.super.isactive = 0;
    }
    wait(1);
    self notify("finished_electric_blast");
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d3
// Size: 0xc5
function function_2c9f694b8b0758e1(var_55c733bb252489e1, var_2c3a1bf3bfd80420, var_f3ea705a2e523bad) {
    var_67e54dc8917a5918 = [];
    foreach (player in var_55c733bb252489e1) {
        if (!isdefined(player)) {
            continue;
        }
        if (player == self) {
            continue;
        }
        if (!istrue(player namespace_742e7eca5294ecdc::function_13efd74a5091dc42(var_f3ea705a2e523bad, 1))) {
            continue;
        }
        index = var_67e54dc8917a5918.size;
        var_67e54dc8917a5918[index]["player"] = player;
        var_67e54dc8917a5918[index]["distanceSQ"] = distancesquared(player.origin, var_2c3a1bf3bfd80420);
    }
    return var_67e54dc8917a5918;
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa0
// Size: 0x166
function function_8b664d9dfe6f4a7e(var_55c733bb252489e1, var_2c3a1bf3bfd80420) {
    var_b5c65d27dfc53f84 = [];
    foreach (ent in var_55c733bb252489e1) {
        if (!isdefined(ent) || istrue(ent.isdestroyed)) {
            continue;
        }
        if (ent namespace_1f188a13f7e79610::isvehicle()) {
            if (!namespace_1f188a13f7e79610::vehicle_isenemytoplayer(ent, self) && !namespace_1f188a13f7e79610::vehicle_isneutraltoplayer(ent, self)) {
                continue;
            }
        } else {
            var_fd38e227901f5bf8 = undefined;
            var_1513504db97a5be7 = undefined;
            if (isdefined(ent.owner)) {
                var_fd38e227901f5bf8 = ent.owner.team;
                var_1513504db97a5be7 = ent.owner;
            } else if (isdefined(ent.team)) {
                var_fd38e227901f5bf8 = ent.team;
            }
            if (isdefined(var_fd38e227901f5bf8) && var_fd38e227901f5bf8 == self.team && var_1513504db97a5be7 != self) {
                continue;
            }
        }
        index = var_b5c65d27dfc53f84.size;
        var_b5c65d27dfc53f84[index]["entity"] = ent;
        var_b5c65d27dfc53f84[index]["distanceSQ"] = distancesquared(ent.origin, var_2c3a1bf3bfd80420);
    }
    return var_b5c65d27dfc53f84;
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0e
// Size: 0xcc
function function_3ce4b28ed71f750a() {
    self endon("disconnect");
    level endon("game_ended");
    var_56f0277b0ed98101 = 0.75;
    var_ff85637831346339 = 0.25;
    var_ff624f78310def85 = 0.15;
    var_ff625578310dfcb7 = 0.08;
    var_31bfd6cefec15dc7 = 200;
    var_31e2eacefee7d17b = 400;
    var_31e2e4cefee7c449 = 600;
    namespace_6de0840c25c8dc22::artillery_earthquake(self.origin, var_56f0277b0ed98101, var_ff85637831346339, var_ff624f78310def85, var_ff625578310dfcb7, var_31bfd6cefec15dc7, var_31e2eacefee7d17b, var_31e2e4cefee7c449, undefined, 1, 1);
    self setscriptablepartstate("superpowers", "electric_blast", 0);
    waittill_any_2("finished_electric_blast", "death");
    self setscriptablepartstate("superpowers", "off", 0);
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce1
// Size: 0x29
function function_ef718870091ebbd9(victim, var_f3ea705a2e523bad) {
    thread function_55d0db940f81e2e6(victim, var_f3ea705a2e523bad.weapon, var_f3ea705a2e523bad);
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd11
// Size: 0x1a5
function function_55d0db940f81e2e6(victim, weaponobj, var_f3ea705a2e523bad) {
    self endon("disconnect");
    victim endon("death_or_disconnect");
    victim endon("haywire_cleared");
    level endon("game_ended");
    var_d51f1d877f3b9e9e = var_f3ea705a2e523bad.var_8bf83d28be4c2d4f.bundle.var_aba76142349af9c0;
    var_1b50ea388b19171c = var_f3ea705a2e523bad.var_8bf83d28be4c2d4f.bundle.var_95602b4d7262c11f;
    if (!isdefined(victim.var_99e82fcc9b77ec71)) {
        victim.var_99e82fcc9b77ec71 = 0;
    }
    victim.var_99e82fcc9b77ec71++;
    if (isdefined(victim.var_fe74f3f4d5afe567)) {
        if ((gettime() - victim.var_fe74f3f4d5afe567) / 1000 <= var_1b50ea388b19171c) {
            var_dab7d922f4d7be0c = victim.var_99e82fcc9b77ec71;
            var_1b50ea388b19171c = int(var_1b50ea388b19171c / var_dab7d922f4d7be0c);
        }
    }
    shockendtime = gettime() + var_1b50ea388b19171c * 1000;
    victim.var_fe74f3f4d5afe567 = gettime();
    thread function_83a614bd6a1f69f0(victim, var_1b50ea388b19171c);
    while (gettime() < shockendtime) {
        var_f3ea705a2e523bad thread namespace_742e7eca5294ecdc::function_cf4ff41f0ae2047f(victim, var_f3ea705a2e523bad.weapon, 0);
        damage = ter_op(isplayer(victim), 3, 5);
        if (victim isswimming()) {
            damage = damage * 2;
        }
        victim dodamage(damage, victim.origin, self, self, "MOD_EXPLOSIVE", weaponobj, "torso_upper");
        wait(var_d51f1d877f3b9e9e);
    }
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebd
// Size: 0x51
function function_83a614bd6a1f69f0(victim, var_1b50ea388b19171c) {
    victim endon("disconnect");
    victim notify("electricDischarge_haywire");
    victim endon("electricDischarge_haywire");
    level endon("game_ended");
    victim waittill_any_timeout_2(var_1b50ea388b19171c, "death", "last_stand_start");
    victim.var_99e82fcc9b77ec71 = 0;
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf15
// Size: 0x14f
function function_822a7fd2e23b8fb6(ent) {
    var_a688c2446d2d3bba = makeweapon("electric_discharge_mp");
    if (isdefined(ent)) {
        if (ent namespace_1f188a13f7e79610::isvehicle()) {
            if (istrue(ent.var_a2ba7043631b3392)) {
                return;
            } else if (isdefined(ent.var_47bde44b1acec603)) {
                var_ed76db33212e6a92 = 200;
                if (isdefined(ent.maxhealth)) {
                    var_ed76db33212e6a92 = ent.maxhealth / 6;
                }
                ent dodamage(var_ed76db33212e6a92, ent.origin, self, self, "MOD_EXPLOSIVE", var_a688c2446d2d3bba);
            } else if (ent namespace_1f188a13f7e79610::function_2a503318e000e11d()) {
                ent dodamage(9999, ent.origin, self, self, "MOD_EXPLOSIVE", var_a688c2446d2d3bba);
            } else {
                ent.var_a8f4bb03b366aa80 = 1;
                damagedata = spawnstruct();
                damagedata.attacker = self;
                damagedata.inflictor = ent;
                damagedata.objweapon = ent.objweapon;
                damagedata.meansofdeath = "MOD_EXPLOSIVE";
                ent namespace_1f188a13f7e79610::function_ab08028468ab68f9(damagedata);
            }
        } else {
            ent dodamage(9999, ent.origin, self, self, "MOD_EXPLOSIVE", var_a688c2446d2d3bba);
        }
    }
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106b
// Size: 0x8e
function function_456170ef7257430b(var_58e914135e6ea706, iskillstreak) {
    self endon("disconnect");
    level endon("game_ended");
    var_eb3aa4092c07d861 = 0;
    var_dc9cdb0dde14c2e3 = 0;
    if (!istrue(var_58e914135e6ea706)) {
        self waittill("finished_electric_blast");
    }
    if (isdefined(self.super) && !istrue(iskillstreak)) {
        self.super.isactive = 0;
    }
    removeperk("specialty_blastshield");
    thread namespace_416e533f6ed17708::function_269b97f3d86eb172(var_eb3aa4092c07d861, var_dc9cdb0dde14c2e3, "super_use_finished", istrue(iskillstreak));
    return 1;
}

// Namespace super_electric_discharge/namespace_5f3bfac07f561003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1101
// Size: 0x15c
function function_1fd889c40c7941b8(killstreakbundle) {
    var_f3ea705a2e523bad = spawnstruct();
    var_f3ea705a2e523bad.var_8bf83d28be4c2d4f = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo("equip_shockstick");
    var_f3ea705a2e523bad.owner = self;
    var_f3ea705a2e523bad.team = self.team;
    var_f3ea705a2e523bad.origin = self.origin;
    var_f3ea705a2e523bad.weapon = makeweapon("electric_discharge_mp");
    if (isdefined(killstreakbundle)) {
        goto LOC_0000009c;
    }
    duration = 5;
    var_f3ea705a2e523bad.var_8bf83d28be4c2d4f.var_b79e08e886b92d46 = 0;
    var_f3ea705a2e523bad.var_8bf83d28be4c2d4f.var_5dd66ebda239d1b = 1;
    var_f3ea705a2e523bad.var_8bf83d28be4c2d4f.bundle.var_33bce1558051ceb5 = 0.3;
    var_f3ea705a2e523bad.var_8bf83d28be4c2d4f.bundle.var_7c742af3d434b807 = duration;
    var_f3ea705a2e523bad.var_8bf83d28be4c2d4f.bundle.var_95602b4d7262c11f = duration;
    var_f3ea705a2e523bad.var_8bf83d28be4c2d4f.bundle.var_aba76142349af9c0 = 0.2;
    return var_f3ea705a2e523bad;
}

