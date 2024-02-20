// mwiii decomp prototype
#using scripts\aitypes\bt_util.gsc;
#using script_38c251115537f16e;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_16ea1b94f0f381b3;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using script_1bfe8e965532ee8a;
#using scripts\anim\weaponlist.gsc;
#using scripts\anim\utility_common.gsc;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_3b78d23dad7ec5be;
#using script_40510196b9a59795;
#using script_5133812eb5db429a;
#using script_21cf081b320a9938;
#using script_60dd6e3992c1f29;
#using script_516de9f009ec5f26;
#using script_a35012b9b75a996;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;

#namespace namespace_59fe849c39adbb0;

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x41c
// Size: 0xd9
function autoexec function_f67abbf91bd2f54d() {
    level._effect["mimic_emp_blast"] = loadfx("vfx/iw9/fieldupgrades/vfx_electric_discharge_blast.vfx");
    callback::add("on_zombie_mimic_emp_spawned", &function_b9405466354e742f);
    callback::add("on_zombie_mimic_hvt_emp_spawned", &function_b9405466354e742f);
    utility::registersharedfunc("game", "shockStick_applyHaywire", &namespace_742e7eca5294ecdc::shockStick_applyHaywire);
    utility::registersharedfunc("game", "shockstick_canBeHaywire", &namespace_742e7eca5294ecdc::shockstick_canBeHaywire);
    utility::registersharedfunc("game", "empdebuff_get_emp_ents", &namespace_5a51aa78ea0b1b9f::empdebuff_get_emp_ents);
    utility::registersharedfunc("game", "play_emp_scramble", &namespace_5a51aa78ea0b1b9f::play_emp_scramble);
    utility::registersharedfunc("game", "stop_emp_scramble", &namespace_5a51aa78ea0b1b9f::stop_emp_scramble);
    utility::registersharedfunc("game", "vehicle_isEnemyToPlayer", &namespace_1f188a13f7e79610::vehicle_isenemytoplayer);
    utility::registersharedfunc("game", "vehicle_isNeutralToPlayer", &namespace_1f188a13f7e79610::vehicle_isneutraltoplayer);
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fc
// Size: 0x47
function function_b9405466354e742f(params) {
    thread function_4b225ffb3a8f07d8();
    callback::add("on_zombie_ai_killed", &function_ee7c6e89281ad07d);
    callback::add("on_entity_hidden_in_prop", &function_454e4da9021b5310);
    callback::add("on_entity_revealed", &function_664465ce23144228);
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x54a
// Size: 0x57
function private function_454e4da9021b5310(params) {
    if (isdefined(self.var_f583b91c1067e38f) && self.var_f583b91c1067e38f islinked(self)) {
        self.var_f583b91c1067e38f unlink(self);
    }
    params.prop setscriptablepartstate("vfx", "on");
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5a8
// Size: 0x50
function private function_664465ce23144228(params) {
    self setscriptablepartstate("ambient_emp_vfx", "enabled");
    self.var_f583b91c1067e38f linkto(self);
    function_b07326afbb0334d3(500, 1.5);
    playsoundatpos(self.origin, "iw9_emp_blast");
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ff
// Size: 0xb0
function function_4b225ffb3a8f07d8() {
    var_34bc7c92dd533602 = 1700;
    var_ec1224f291cd200f = 1700;
    var_f583b91c1067e38f = spawn("trigger_radius", self.origin, 0, var_34bc7c92dd533602, var_ec1224f291cd200f);
    self.var_f583b91c1067e38f = var_f583b91c1067e38f;
    var_f583b91c1067e38f.owner = self;
    if (issharedfuncdefined("game", "makeEnterExitTrigger")) {
        [[ getsharedfunc("game", "makeEnterExitTrigger") ]](self.var_f583b91c1067e38f, &function_3fae690d4b8f72d7, &function_74c430277be6f877);
    }
    self.var_f583b91c1067e38f enablelinkto();
    thread function_25458d021dacc7e0();
    thread function_395ccf02853e8649(var_f583b91c1067e38f);
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b6
// Size: 0xbf
function function_238dbae32131b4a8(var_f583b91c1067e38f) {
    self notify("trigger_removed");
    var_f52f7c588475c17d = getplayersinradius(self.origin, 1700, 1700);
    foreach (player in var_f52f7c588475c17d) {
        if (istrue(player.empscramblelevels.size > 0)) {
            player function_8887420281f3ff3f(1);
        }
    }
    if (isdefined(var_f583b91c1067e38f)) {
        var_f583b91c1067e38f delete();
    } else if (isdefined(self.var_f583b91c1067e38f)) {
        self.var_f583b91c1067e38f delete();
    }
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77c
// Size: 0x1c
function function_395ccf02853e8649(var_f583b91c1067e38f) {
    self waittill("death");
    function_238dbae32131b4a8(var_f583b91c1067e38f);
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79f
// Size: 0x7b
function function_25458d021dacc7e0() {
    self endon("death");
    self endon("trigger_removed");
    while (1) {
        var_5321eb7c0023b4a7 = randomfloatrange(5, 22);
        wait(var_5321eb7c0023b4a7);
        if (!istrue(self.hidden_in_prop) && !istrue(self.var_76d65f0b5902d51d)) {
            function_b07326afbb0334d3(500, 1.5);
        } else if (istrue(self.var_76d65f0b5902d51d) && !istrue(self.hidden_in_prop)) {
            wait(10);
        }
    }
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x821
// Size: 0x55
function function_3fae690d4b8f72d7(player, trigger) {
    if (!isplayer(player)) {
        return;
    }
    /#
        iprintln("entity");
    #/
    if (istrue(player.var_b3678b10abbf63e5)) {
        /#
            iprintln("equip_shockstick");
        #/
        return;
    }
    player thread function_377c97bfdd963952(1);
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87d
// Size: 0x55
function function_74c430277be6f877(player, trigger) {
    if (!isplayer(player)) {
        return;
    }
    if (istrue(player.var_b3678b10abbf63e5)) {
        /#
            iprintln("equip_shockstick");
        #/
        return;
    }
    player thread function_8887420281f3ff3f(1);
    /#
        iprintln("<unknown string>");
    #/
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8d9
// Size: 0x274
function private function_b07326afbb0334d3(radius, var_f5ae019bfc804965) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    thread function_3ce4b28ed71f750a();
    self.var_76d65f0b5902d51d = 1;
    var_5da234812450b0d7 = self.origin;
    var_170b85c668cf4b59 = self.angles;
    step = 100;
    maxdist = radius;
    waittime = 0.1;
    var_556b31282abcb132 = step;
    var_f3ea705a2e523bad = function_1fd889c40c7941b8(var_f5ae019bfc804965);
    var_afc2f18cdaa6c9cc = function_2d7fd59d039fa69b(self.origin, maxdist);
    var_9ba81be3ce3691 = function_2c9f694b8b0758e1(var_afc2f18cdaa6c9cc, var_5da234812450b0d7, var_f3ea705a2e523bad);
    if (issharedfuncdefined("game", "empdebuff_get_emp_ents")) {
        var_6f0350c82fc94c38 = [[ getsharedfunc("game", "empdebuff_get_emp_ents") ]](var_5da234812450b0d7, radius);
    }
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
                continue;
            }
            var_6bb2d94137551dbc[var_6bb2d94137551dbc.size] = var_bc910fd8949150f6;
        }
        var_82636d311009a1eb = var_6bb2d94137551dbc;
        var_556b31282abcb132 = var_556b31282abcb132 + step;
        wait(waittime);
    }
    wait(1);
    self.var_76d65f0b5902d51d = 0;
    self notify("finished_electric_blast");
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb54
// Size: 0x1e8
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
    victim thread function_b0e45c5c9f310e2f();
    while (gettime() < shockendtime) {
        victim.var_108e6be5e24e9d1d = 1;
        if (issharedfuncdefined("game", "shockStick_applyHaywire")) {
            var_f3ea705a2e523bad thread [[ getsharedfunc("game", "shockStick_applyHaywire") ]](victim, var_f3ea705a2e523bad.weapon, 0);
        }
        var_3af58b59b546738d = 3;
        damage = ter_op(isplayer(victim), var_3af58b59b546738d, 0);
        if (victim isswimming()) {
            damage = damage * 2;
        }
        victim dodamage(damage, victim.origin, self, self, "MOD_EXPLOSIVE", weaponobj, "torso_upper");
        wait(var_d51f1d877f3b9e9e);
    }
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd43
// Size: 0x31
function function_b0e45c5c9f310e2f() {
    if (!isplayer(self)) {
        return;
    }
    function_377c97bfdd963952(2);
    self waittill("haywire_cleared");
    function_8887420281f3ff3f(2);
    self.var_108e6be5e24e9d1d = undefined;
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7b
// Size: 0x5c
function function_83a614bd6a1f69f0(victim, var_1b50ea388b19171c) {
    victim endon("disconnect");
    victim notify("electricDischarge_haywire");
    victim endon("electricDischarge_haywire");
    level endon("game_ended");
    victim waittill_any_timeout_2(var_1b50ea388b19171c, "death", "last_stand_start");
    victim.var_108e6be5e24e9d1d = undefined;
    victim.var_99e82fcc9b77ec71 = 0;
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdde
// Size: 0x29
function function_ef718870091ebbd9(victim, var_f3ea705a2e523bad) {
    thread function_55d0db940f81e2e6(victim, var_f3ea705a2e523bad.weapon, var_f3ea705a2e523bad);
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0e
// Size: 0xe2
function function_3ce4b28ed71f750a() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    var_56f0277b0ed98101 = 0.75;
    var_ff85637831346339 = 0.25;
    var_ff624f78310def85 = 0.15;
    var_ff625578310dfcb7 = 0.08;
    var_31bfd6cefec15dc7 = 200;
    var_31e2eacefee7d17b = 400;
    var_31e2e4cefee7c449 = 600;
    if (issharedfuncdefined("game", "artillery_earthQuake")) {
        [[ getsharedfunc("game", "artillery_earthQuake") ]](self.origin, var_56f0277b0ed98101, var_ff85637831346339, var_ff624f78310def85, var_ff625578310dfcb7, var_31bfd6cefec15dc7, var_31e2eacefee7d17b, var_31e2e4cefee7c449, undefined, 1, 1);
    }
    self setscriptablepartstate("emp_pulse", "electric_blast", 0);
    self waittill("finished_electric_blast");
    self setscriptablepartstate("emp_pulse", "off", 0);
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef7
// Size: 0x142
function function_1fd889c40c7941b8(var_f5ae019bfc804965) {
    var_f3ea705a2e523bad = spawnstruct();
    var_f3ea705a2e523bad.var_8bf83d28be4c2d4f = namespace_1cd9f6896754adb0::getequipmenttableinfo("equip_shockstick");
    var_f3ea705a2e523bad.owner = self;
    var_f3ea705a2e523bad.team = self.team;
    var_f3ea705a2e523bad.origin = self.origin;
    var_f3ea705a2e523bad.weapon = makeweapon("electric_discharge_mp");
    var_f3ea705a2e523bad.var_8bf83d28be4c2d4f.var_b79e08e886b92d46 = 0;
    var_f3ea705a2e523bad.var_8bf83d28be4c2d4f.var_5dd66ebda239d1b = 1;
    var_f3ea705a2e523bad.var_8bf83d28be4c2d4f.bundle.var_33bce1558051ceb5 = 0.3;
    var_f3ea705a2e523bad.var_8bf83d28be4c2d4f.bundle.var_7c742af3d434b807 = var_f5ae019bfc804965;
    var_f3ea705a2e523bad.var_8bf83d28be4c2d4f.bundle.var_95602b4d7262c11f = var_f5ae019bfc804965 + 0.25;
    var_f3ea705a2e523bad.var_8bf83d28be4c2d4f.bundle.var_aba76142349af9c0 = 0.2;
    return var_f3ea705a2e523bad;
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1041
// Size: 0xf1
function function_2c9f694b8b0758e1(var_55c733bb252489e1, var_2c3a1bf3bfd80420, var_f3ea705a2e523bad) {
    var_67e54dc8917a5918 = [];
    foreach (player in var_55c733bb252489e1) {
        if (!isdefined(player)) {
            continue;
        }
        if (player == self) {
            continue;
        }
        if (issharedfuncdefined("game", "shockstick_canBeHaywire")) {
            var_daca8eb57598bcc1 = player [[ getsharedfunc("game", "shockstick_canBeHaywire") ]](var_f3ea705a2e523bad, 1);
        }
        if (!istrue(var_daca8eb57598bcc1)) {
            continue;
        }
        index = var_67e54dc8917a5918.size;
        var_67e54dc8917a5918[index]["player"] = player;
        var_67e54dc8917a5918[index]["distanceSQ"] = distancesquared(player.origin, var_2c3a1bf3bfd80420);
    }
    return var_67e54dc8917a5918;
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x113a
// Size: 0x1c7
function function_8b664d9dfe6f4a7e(var_55c733bb252489e1, var_2c3a1bf3bfd80420) {
    var_b5c65d27dfc53f84 = [];
    foreach (ent in var_55c733bb252489e1) {
        if (!isdefined(ent) || istrue(ent.isdestroyed)) {
            continue;
        }
        if (isdefined(ent.vehiclename)) {
            if (issharedfuncdefined("game", "vehicle_isEnemyToPlayer")) {
                var_20d93df9dea9a05 = [[ getsharedfunc("game", "vehicle_isEnemyToPlayer") ]](ent, self);
            }
            if (issharedfuncdefined("game", "vehicle_isNeutralToPlayer")) {
                var_e2772225ec2bac16 = [[ getsharedfunc("game", "vehicle_isNeutralToPlayer") ]](ent, self);
            }
            if (!istrue(var_20d93df9dea9a05) && !istrue(var_e2772225ec2bac16)) {
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

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1309
// Size: 0x40
function function_377c97bfdd963952(var_686570a991b92948) {
    if (issharedfuncdefined("game", "play_emp_scramble")) {
        [[ getsharedfunc("game", "play_emp_scramble") ]](var_686570a991b92948);
    }
    self playsoundtoplayer("kls_emp_hud_deactivate", self);
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1350
// Size: 0x33
function function_8887420281f3ff3f(var_686570a991b92948) {
    if (issharedfuncdefined("game", "stop_emp_scramble")) {
        [[ getsharedfunc("game", "stop_emp_scramble") ]](var_686570a991b92948);
    }
}

// Namespace namespace_59fe849c39adbb0/namespace_9669c43b34f7a964
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138a
// Size: 0x49
function function_ee7c6e89281ad07d(params) {
    function_b07326afbb0334d3(500, 1.5);
    playfx(getfx("mimic_emp_blast"), self.origin);
    playsoundatpos(self.origin, "iw9_emp_blast");
}

