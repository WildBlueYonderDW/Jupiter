// mwiii decomp prototype
#using script_3214e6fcdce468a7;
#using scripts\engine\utility.gsc;
#using scripts\common\ai.gsc;
#using script_4c770a9a4ad7659c;
#using script_16ea1b94f0f381b3;
#using scripts\common\system.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\common\vehicle.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\flags.gsc;
#using script_3433ee6b63c7e243;
#using script_58682e6578ce0515;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\engine\trace.gsc;

#namespace blackhole_bomb;

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x40b
// Size: 0x1e
function private autoexec __init__system__() {
    system::register(#"blackhole_bomb", undefined, &function_ca54f37762600466, &post_main);
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x430
// Size: 0x8a
function private function_ca54f37762600466() {
    level.var_603671ff1b339327["pull"]["zombie"] = &function_44b6f0ccb41f556d;
    level.var_603671ff1b339327["pull"]["soldier"] = &function_a68269c9dae2006f;
    level.var_603671ff1b339327["damage"]["zombie"] = &function_d8836e99347f2eb;
    level.var_603671ff1b339327["damage"]["soldier"] = &function_aa12208993fdf9c1;
    level.var_13c65b7115437d69 = throttle::function_e4c99b0f178ffb98("blackhole_portal_player_search", 1, 0.05);
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4c1
// Size: 0x9c
function private post_main() {
    level endon("game_ended");
    namespace_3bbb5a98b932c46f::function_1bacc798ac81809a("blackhole_bomb", &function_667a1af25742dded);
    namespace_4b0406965e556711::function_1240434f4201ac9d("infil_started");
    /#
        assert(isdefined(level.equipment) && isdefined(level.equipment.callbacks));
    #/
    level.equipment.callbacks["equip_blackhole_bomb"]["onGive"] = &function_2cd25daec1369d73;
    level.equipment.callbacks["equip_blackhole_bomb"]["onTake"] = &function_c2dc933ed742cf81;
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x564
// Size: 0x8f
function private function_2cd25daec1369d73(var_ff075089d2af00d1, slot, variant_id) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("blackhole_bomb_taken");
    while (1) {
        objweapon = self waittill("offhand_pullback");
        if (is_equal(function_f581838ce4328f7a(objweapon), "blackhole_bomb")) {
            utility::function_3677f2be30fdd581("blackhole_bomb_fx", "grenade_pullback");
            while (!self function_784e70183e5c3f4c()) {
                waitframe();
            }
            utility::function_3677f2be30fdd581("blackhole_bomb_fx", "off");
        }
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5fa
// Size: 0x1c
function private function_c2dc933ed742cf81(var_ff075089d2af00d1, slot) {
    self notify("blackhole_bomb_taken");
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x61d
// Size: 0x110
function private function_667a1af25742dded(grenade) {
    grenade endon("death");
    grenade thread function_f8d8329a90d0eb79();
    hitent = grenade waittill("missile_stuck");
    var_f45ac1215b82c32c = isdefined(hitent) && hitent vehicle::isvehicle();
    grenade.update_time = var_f45ac1215b82c32c ? 0.1 : 0.5;
    while (1) {
        var_eb4396dfb44e2e16 = grenade function_72269ee58c0811da();
        if (!isdefined(var_eb4396dfb44e2e16)) {
            break;
        }
        if (!isdefined(grenade.var_2c79ccf927f4748b)) {
            grenade.var_2c79ccf927f4748b = grenade start_timed_vortex(var_eb4396dfb44e2e16, 60, 1000, 275, 10, 32, !var_f45ac1215b82c32c);
            grenade thread function_b24870401644121d(var_eb4396dfb44e2e16, !var_f45ac1215b82c32c);
            grenade thread function_d0c0afca2d602641();
        } else {
            grenade.var_2c79ccf927f4748b.var_5887e5956c362ea2 = var_eb4396dfb44e2e16;
        }
        /#
            grenade.var_2c79ccf927f4748b thread function_1cbb9bfb3eebf7d();
        #/
        wait(grenade.update_time);
    }
    grenade function_ab089252607fce9b();
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x734
// Size: 0xc8
function private function_72269ee58c0811da() {
    var_154288d91ba8cf1a = getclosestpointonnavmesh(self.origin);
    /#
        if (getdvarint(@"hash_679e2a774cf4d25f", 0)) {
            half_height = (0, 0, 80);
            cylinder(self.origin - half_height, self.origin + half_height, sqrt(16384), (0, 1, 1), 1, int(self.update_time * 20));
        }
    #/
    if (isdefined(var_154288d91ba8cf1a)) {
        if (distance2dsquared(var_154288d91ba8cf1a, self.origin) <= 16384 && abs(var_154288d91ba8cf1a[2] - self.origin[2]) <= 80) {
            return var_154288d91ba8cf1a;
        }
    }
    return undefined;
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x804
// Size: 0x52
function private function_d0c0afca2d602641() {
    self endon("death");
    while (1) {
        var_bbf82bcf823ae309 = vectordot(anglestoup(self.angles), (0, 0, 1));
        if (var_bbf82bcf823ae309 < 0.7) {
            function_ab089252607fce9b();
            break;
        }
        waitframe();
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x85d
// Size: 0x34
function private function_ab089252607fce9b() {
    if (isdefined(self.var_2c79ccf927f4748b)) {
        self.var_2c79ccf927f4748b notify("vortex_implode");
    }
    function_ad9433aab9fcdf04(1.2, "death", &delete);
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x898
// Size: 0x1b
function private function_f8d8329a90d0eb79() {
    self endon("death");
    self endon("missile_stuck");
    wait(10);
    self delete();
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ba
// Size: 0xa4
function private function_7c9cda67b23ad013() {
    level endon("game_ended");
    thread function_75fc5c709c8b261e();
    thread function_80f4de5fe3073820();
    thread function_2191472180719015();
    self.grenade waittill("death");
    foreach (agent in self.var_406f669bc3bfad72) {
        if (!isdefined(agent) || !isalive(agent)) {
            continue;
        }
        agent function_c163851c7b898874();
    }
    self.var_406f669bc3bfad72 = [];
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x965
// Size: 0x171
function private function_7b51e7028feeeadb(var_91c7a22ac9c21219, var_9b9fcec418a4df6f, var_4d0770ac27f255d3) {
    self._blackboard.var_f2ac77c8e464c518 = var_91c7a22ac9c21219;
    self._blackboard.var_7b401f435e1b9e8a = var_9b9fcec418a4df6f;
    self._blackboard.var_20bc623ec15e9c82 = "blackhole";
    self._blackboard.var_f65c4810e7a7571f = 1;
    val::set("blackhole", "ignore_ai_collision");
    val::set("blackhole", "disallow_knockdown");
    val::set("blackhole", "disallow_stun");
    if (is_equal(self.unittype, "soldier") && isdefined(self.weapon)) {
        self.var_3e0aca101aac496a = self.weapon;
        namespace_223959d3e5206cfb::placeweaponon(self.weapon, "none");
        self takeweapon(self.weapon);
        if (istrue(self.var_896173c5036728f9)) {
            self function_36c9cc1aacacc4a8();
        }
    }
    var_eb55f9fe191fa615 = max(var_4d0770ac27f255d3[2] - var_91c7a22ac9c21219[2], 0);
    var_2e1a7c34911b55e4 = {var_eb55f9fe191fa615:var_eb55f9fe191fa615};
    callback::callback("on_vortex_pulled", var_2e1a7c34911b55e4);
    utility::function_3677f2be30fdd581("blackhole_pulled", "blackhole_pulled_on");
    self.do_immediate_ragdoll = 1;
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xadd
// Size: 0xc8
function private function_c163851c7b898874() {
    self._blackboard.var_20bc623ec15e9c82 = "";
    self._blackboard.var_f65c4810e7a7571f = 0;
    val::function_c9d0b43701bdba00("blackhole");
    var_2f495f6783fb6df4 = self.var_3e0aca101aac496a;
    self.var_3e0aca101aac496a = undefined;
    if (is_equal(self.unittype, "soldier") && isdefined(var_2f495f6783fb6df4)) {
        self giveweapon(var_2f495f6783fb6df4);
        namespace_223959d3e5206cfb::placeweaponon(var_2f495f6783fb6df4, "right");
        if (istrue(self.var_896173c5036728f9)) {
            self function_4924f775ed21316();
        }
    }
    callback::callback("on_vortex_pulled_end");
    utility::function_3677f2be30fdd581("blackhole_pulled", "blackhole_pulled_off");
    self.do_immediate_ragdoll = undefined;
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbac
// Size: 0xe1
function function_6a0fdda07c1ebbf7(var_2c79ccf927f4748b, var_89d9e69374754848) {
    /#
        assert(isagent(self));
    #/
    if (var_89d9e69374754848) {
        if (!istrue(self._blackboard.var_f65c4810e7a7571f)) {
            function_7b51e7028feeeadb(var_2c79ccf927f4748b.var_5887e5956c362ea2, var_2c79ccf927f4748b.var_9b9fcec418a4df6f, var_2c79ccf927f4748b.var_4d0770ac27f255d3);
            var_2c79ccf927f4748b.var_406f669bc3bfad72[var_2c79ccf927f4748b.var_406f669bc3bfad72.size] = self;
        } else {
            self._blackboard.var_f2ac77c8e464c518 = var_2c79ccf927f4748b.var_5887e5956c362ea2;
        }
    } else if (istrue(self._blackboard.var_f65c4810e7a7571f)) {
        function_c163851c7b898874();
        var_2c79ccf927f4748b.var_406f669bc3bfad72 = array_remove(var_2c79ccf927f4748b.var_406f669bc3bfad72, self);
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc94
// Size: 0x105
function function_81e9889140d42fa9(var_2c79ccf927f4748b, var_7ad31e3b5afe6770) {
    current_time = gettime();
    if (!isdefined(self.var_65211cc8a7b703bd) || self.var_65211cc8a7b703bd + 1000 <= current_time) {
        var_85303c6c2d48617 = 0;
        if (isdefined(self.maxhealth)) {
            var_85303c6c2d48617 = self.maxhealth;
        } else if (isdefined(self.max_fake_health)) {
            var_85303c6c2d48617 = self.max_fake_health;
        } else {
            /#
                println("" + self.classname + "<unknown string>" + self.origin);
            #/
        }
        if (var_85303c6c2d48617 > 0) {
            var_51d68438c6a7835e = var_85303c6c2d48617 * var_7ad31e3b5afe6770;
            self dodamage(var_51d68438c6a7835e, var_2c79ccf927f4748b.var_4d0770ac27f255d3, var_2c79ccf927f4748b.grenade.owner, var_2c79ccf927f4748b.grenade, "MOD_CRUSH");
        }
        self.var_65211cc8a7b703bd = current_time;
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xda0
// Size: 0x3e
function private function_44b6f0ccb41f556d(zombie, var_89d9e69374754848) {
    if (!istrue(zombie.var_7e3144ab69fefa03)) {
        return;
    }
    if (istrue(zombie.var_46ff71d1aa27d2ed)) {
        zombie thread function_6a0fdda07c1ebbf7(self, var_89d9e69374754848);
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xde5
// Size: 0x119
function private function_d8836e99347f2eb(zombie) {
    if (!istrue(zombie.var_7e3144ab69fefa03)) {
        return;
    }
    if (istrue(zombie.var_46ff71d1aa27d2ed)) {
        return;
    }
    var_4e4fede326974d47 = 0;
    var_d54a458af0ade7cb = 1;
    if (isdefined(zombie.aicategory)) {
        if (zombie.aicategory == "normal") {
            var_4e4fede326974d47 = 0.4;
            var_d54a458af0ade7cb = 0.6;
        } else if (zombie.aicategory == "special") {
            var_4e4fede326974d47 = 0.2;
            var_d54a458af0ade7cb = 0.7;
        } else if (zombie.aicategory == "elite") {
            var_4e4fede326974d47 = 0.02;
            var_d54a458af0ade7cb = 0.7;
        } else if (zombie.aicategory == "boss") {
            var_4e4fede326974d47 = 0.02;
            var_d54a458af0ade7cb = 1;
        }
    }
    if (var_d54a458af0ade7cb < 1) {
        zombie namespace_5e5b12854e72824d::slow("blackhole", var_d54a458af0ade7cb, 0.5, self.grenade.owner);
    }
    zombie function_81e9889140d42fa9(self, var_4e4fede326974d47);
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf05
// Size: 0x2a
function private function_a68269c9dae2006f(soldier, var_89d9e69374754848) {
    if (soldier ai::function_74368588170b0497()) {
        return;
    }
    soldier thread function_6a0fdda07c1ebbf7(self, var_89d9e69374754848);
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf36
// Size: 0x4e
function private function_aa12208993fdf9c1(soldier) {
    if (soldier ai::function_74368588170b0497()) {
        soldier namespace_5e5b12854e72824d::slow("blackhole", 0.7, 0.5, self.grenade.owner);
        soldier function_81e9889140d42fa9(self, 0.02);
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf8b
// Size: 0x1a5
function private function_75fc5c709c8b261e() {
    level endon("game_ended");
    self.grenade endon("death");
    childthread function_fcbee1c97567d2f9();
    while (1) {
        var_d4b2d97fa0a991e8 = getaiarrayinradius(self.var_4d0770ac27f255d3, self.var_6ddfae6b147ffb95);
        var_37f45f290c89b71 = 0;
        if (var_d4b2d97fa0a991e8.size == 0) {
            waitframe();
            continue;
        }
        foreach (agent in var_d4b2d97fa0a991e8) {
            if (!isdefined(agent) || !isalive(agent)) {
                continue;
            }
            if (is_equal(agent.team, self.team)) {
                continue;
            }
            var_c86f50466aa10d22 = agent getcentroid();
            var_89d9e69374754848 = sighttracepassed(self.var_4d0770ac27f255d3, var_c86f50466aa10d22, 0, agent, undefined, 1);
            /#
                if (getdvarint(@"hash_679e2a774cf4d25f", 0)) {
                    line(self.var_4d0770ac27f255d3, var_c86f50466aa10d22, var_89d9e69374754848 ? (0, 1, 0) : (1, 0, 0));
                }
            #/
            var_f6f320fcf5c9f695 = level.var_603671ff1b339327["pull"][agent.unittype];
            if (isdefined(var_f6f320fcf5c9f695)) {
                self [[ var_f6f320fcf5c9f695 ]](agent, var_89d9e69374754848);
            }
            var_37f45f290c89b71++;
            if (var_37f45f290c89b71 % 10 == 0) {
                waitframe();
            }
        }
        if (var_37f45f290c89b71 == 0 || var_37f45f290c89b71 % 10 > 0) {
            waitframe();
        }
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1137
// Size: 0x170
function private function_fcbee1c97567d2f9() {
    while (1) {
        foreach (agent in self.var_406f669bc3bfad72) {
            if (!isdefined(agent) || !isalive(agent)) {
                continue;
            }
            if (istrue(agent._blackboard.var_6e530f2f5ec3e63c)) {
                agent.do_immediate_ragdoll = undefined;
                if (isdefined(agent.unittype)) {
                    switch (agent.unittype) {
                    case #"hash_f695947f7a9ce23f":
                        agent.var_5ede61272f442abd = "zombie_kia_kazimir";
                        break;
                    case #"hash_44aaeb0edd152195":
                        agent.var_5ede61272f442abd = "soldier_kia_kazimir";
                        break;
                    }
                }
                if (isdefined(self.vortex)) {
                    self.vortex setscriptablepartstate("fake_gib_audio", "play_gib_audio");
                }
                agent kill(self.var_4d0770ac27f255d3, function_53c4c53197386572(self.grenade.owner, self.grenade), self.grenade, "MOD_CRUSH");
            }
        }
        self.var_406f669bc3bfad72 = function_fdc9d5557c53078e(self.var_406f669bc3bfad72);
        waitframe();
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12ae
// Size: 0xed
function private function_80f4de5fe3073820() {
    level endon("game_ended");
    self.grenade endon("death");
    while (1) {
        var_d4b2d97fa0a991e8 = getaiarrayinradius(self.var_4d0770ac27f255d3, self.damage_radius);
        foreach (agent in var_d4b2d97fa0a991e8) {
            if (!isdefined(agent) || !isalive(agent)) {
                continue;
            }
            if (is_equal(agent.team, self.team)) {
                continue;
            }
            damage_func = level.var_603671ff1b339327["damage"][agent.unittype];
            if (isdefined(damage_func)) {
                self [[ damage_func ]](agent);
            }
        }
        waitframe();
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13a2
// Size: 0xe3
function private function_2191472180719015() {
    level endon("game_ended");
    self.grenade endon("death");
    while (1) {
        var_9be3dd72db39ec63 = vehicle_getarrayinradius(self.var_4d0770ac27f255d3, self.damage_radius);
        foreach (vehicle in var_9be3dd72db39ec63) {
            if (!isdefined(vehicle) || !isalive(vehicle)) {
                continue;
            }
            if (!vehicle namespace_1f188a13f7e79610::isvehicle() || vehicle namespace_1f188a13f7e79610::isvehicledestroyed()) {
                continue;
            }
            if (is_equal(vehicle.team, self.team)) {
                continue;
            }
            vehicle function_81e9889140d42fa9(self, 0.05);
        }
        waitframe();
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x148c
// Size: 0x164
function private function_409c3911c7c1a06d() {
    level endon("game_ended");
    self.vortex = spawnscriptable("equip_blackhole_bomb_vortex", self.grenade.origin, self.grenade.angles);
    self.vortex scriptablesetparententity(self.grenade);
    if (isdefined(self.vortex)) {
        self.vortex setscriptablepartstate("vortex", "loop");
    }
    waittill_notify_or_timeout("vortex_implode", self.duration);
    if (isdefined(self.vortex)) {
        self.vortex setscriptablepartstate("vortex", "implode");
    }
    if (isdefined(self.grenade)) {
        self.grenade radiusdamage(self.var_4d0770ac27f255d3, 300, 500, 250, function_53c4c53197386572(self.grenade.owner, self.grenade), "MOD_EXPLOSIVE", self.grenade.weapon_object);
        self.grenade function_ad9433aab9fcdf04(1, "death", &delete);
    }
    if (isdefined(self.vortex)) {
        self.vortex function_ad9433aab9fcdf04(1, "death", &freescriptable);
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15f7
// Size: 0x26
function private function_804aa4597eb3df2c(var_8b5f8add8ec135fa) {
    return self.origin + var_8b5f8add8ec135fa * anglestoup(self.angles);
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1625
// Size: 0x11d
function start_timed_vortex(var_53fe16a989d5d1c8, var_8b5f8add8ec135fa, var_d2b0a5e37e2f66d4, var_eb1ea2de02f5efc2, duration, var_9b9fcec418a4df6f, var_a71eab44ed1f8c8) {
    var_2c79ccf927f4748b = spawnstruct();
    var_2c79ccf927f4748b.var_5887e5956c362ea2 = var_53fe16a989d5d1c8;
    var_2c79ccf927f4748b.var_8b5f8add8ec135fa = var_8b5f8add8ec135fa;
    var_2c79ccf927f4748b.grenade = self;
    var_2c79ccf927f4748b.team = self.team;
    var_2c79ccf927f4748b.var_6ddfae6b147ffb95 = var_d2b0a5e37e2f66d4;
    var_2c79ccf927f4748b.damage_radius = var_eb1ea2de02f5efc2;
    var_2c79ccf927f4748b.var_9b9fcec418a4df6f = function_53c4c53197386572(var_9b9fcec418a4df6f, 0);
    var_2c79ccf927f4748b.duration = duration;
    var_2c79ccf927f4748b.var_406f669bc3bfad72 = [];
    if (var_a71eab44ed1f8c8) {
        var_2c79ccf927f4748b.var_4d0770ac27f255d3 = var_2c79ccf927f4748b.grenade function_804aa4597eb3df2c(var_2c79ccf927f4748b.var_8b5f8add8ec135fa);
    } else {
        var_2c79ccf927f4748b thread function_8a5e1113c836189f();
    }
    var_2c79ccf927f4748b thread function_7c9cda67b23ad013();
    var_2c79ccf927f4748b thread function_409c3911c7c1a06d();
    return var_2c79ccf927f4748b;
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x174a
// Size: 0x3c
function private function_8a5e1113c836189f() {
    self.grenade endon("death");
    while (1) {
        self.var_4d0770ac27f255d3 = self.grenade function_804aa4597eb3df2c(self.var_8b5f8add8ec135fa);
        waitframe();
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x178d
// Size: 0xbe
function function_1cbb9bfb3eebf7d() {
    /#
        if (getdvarint(@"hash_679e2a774cf4d25f", 0)) {
            var_8a4649ebced8e2f5 = (0, 0, 0);
            var_a5252e07f8c2f19e = int(self.grenade.update_time * 20);
            debugstar(self.var_5887e5956c362ea2, var_8a4649ebced8e2f5, var_a5252e07f8c2f19e, "<unknown string>");
            debugstar(self.var_4d0770ac27f255d3, var_8a4649ebced8e2f5, var_a5252e07f8c2f19e, "<unknown string>");
            namespace_3c37cb17ade254d::draw_circle(self.var_4d0770ac27f255d3, self.var_6ddfae6b147ffb95, var_8a4649ebced8e2f5, 1, 0, var_a5252e07f8c2f19e);
            namespace_3c37cb17ade254d::draw_circle(self.var_4d0770ac27f255d3, self.damage_radius, var_8a4649ebced8e2f5, 1, 0, var_a5252e07f8c2f19e);
        }
    #/
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1852
// Size: 0x199
function generate_portal_exits(var_e959e6626e5ae421) {
    self notify("generate_portal_exits");
    self endon("generate_portal_exits");
    self.anchor endon("death");
    var_81366857d9eacda2 = self.var_a2ba86d22c3b53dc;
    self.var_a2ba86d22c3b53dc = 0;
    for (i = 0; i < var_81366857d9eacda2; i++) {
        var_f7ee11dfed87449c = self.var_1c8116a6bf1d1f39[i];
        /#
            assert(isvector(var_f7ee11dfed87449c));
        #/
        var_11b2830c58bc9036 = distance2dsquared(self.anchor.origin, var_f7ee11dfed87449c);
        if (var_11b2830c58bc9036 < 1000 || var_11b2830c58bc9036 > 2000) {
            continue;
        }
        self.var_1c8116a6bf1d1f39[self.var_a2ba86d22c3b53dc] = var_f7ee11dfed87449c;
        self.var_a2ba86d22c3b53dc++;
    }
    while (self.var_a2ba86d22c3b53dc < var_e959e6626e5ae421) {
        var_137fa8a8bdd21729 = min(var_e959e6626e5ae421 - self.var_a2ba86d22c3b53dc, 2);
        exit_points = namespace_6205bc7c5e394598::function_3bd08a7c5eba1671(var_137fa8a8bdd21729, self.anchor.origin, 160, 2000, 1000, 0);
        foreach (var_f7ee11dfed87449c in exit_points) {
            self.var_1c8116a6bf1d1f39[self.var_a2ba86d22c3b53dc] = var_f7ee11dfed87449c;
            self.var_a2ba86d22c3b53dc++;
        }
        waitframe();
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x19f2
// Size: 0x75
function private function_c0f1f631332882f1() {
    /#
        self.anchor endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_888c38619e0ec63a", 0)) {
                for (i = 0; i < self.var_a2ba86d22c3b53dc; i++) {
                    debugstar(self.var_1c8116a6bf1d1f39[i], (1, 1, 1), 1, "<unknown string>");
                }
            }
            waitframe();
        }
    #/
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a6e
// Size: 0x2c
function private can_teleport() {
    return !self function_9cc921a57ff4deb5() && !self isonladder() && !self ismantling() && !isdefined(self.vehicle);
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1aa2
// Size: 0xb5
function private function_3ba1ab88f5ad866e() {
    self.anchor endon("death");
    while (1) {
        throttle::function_f632348cbb773537(level.var_13c65b7115437d69, self);
        var_b8343ddba49c479 = self.anchor function_804aa4597eb3df2c(self.var_8b5f8add8ec135fa);
        self.nearby_players = namespace_2b1145f62aa835b8::function_883458a342af3041(var_b8343ddba49c479, 512);
        /#
            if (getdvarint(@"hash_888c38619e0ec63a", 0)) {
                duration = int(0.5 / level.framedurationseconds);
                sphere(var_b8343ddba49c479, 512, (1, 1, 1), 1, duration);
            }
        #/
        wait(0.5);
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b5e
// Size: 0x17b
function private function_6f3e2351189e02d1(player) {
    var_99f9a57d34d477c7 = array_slice(self.var_1c8116a6bf1d1f39, 0, self.var_a2ba86d22c3b53dc);
    var_deaec2b2867cc764 = array_randomize(var_99f9a57d34d477c7);
    var_6d810cc007db1099 = [];
    foreach (var_f7ee11dfed87449c in var_deaec2b2867cc764) {
        if (function_73f2baa01fa2b921(var_f7ee11dfed87449c, player.team)) {
            continue;
        }
        var_6d810cc007db1099[0] = var_f7ee11dfed87449c;
        if (positionwouldtelefrag(var_f7ee11dfed87449c)) {
            continue;
        }
        var_6d810cc007db1099[1] = var_f7ee11dfed87449c;
        var_ff2bba10be6a1a4 = function_143526130b12b2b6(var_f7ee11dfed87449c, 250);
        var_15d5106746811361 = 1;
        foreach (var_fc5a23eb91083583 in var_ff2bba10be6a1a4) {
            if (isdefined(var_fc5a23eb91083583.team) && var_fc5a23eb91083583.team != player.team) {
                var_15d5106746811361 = 0;
                break;
            }
        }
        if (var_15d5106746811361) {
            return var_f7ee11dfed87449c;
        }
    }
    return function_53c4c53197386572(var_6d810cc007db1099[1], function_53c4c53197386572(var_6d810cc007db1099[0], var_deaec2b2867cc764[0]));
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ce1
// Size: 0x1c6
function private teleport_screen_flash() {
    self endon("death_or_disconnect");
    self notify("teleport_screen_flash");
    self endon("teleport_screen_flash");
    if (!isdefined(self.var_ab58f5f010db86fc)) {
        self.var_ab58f5f010db86fc = newclienthudelem(self);
        self.var_ab58f5f010db86fc.x = 0;
        self.var_ab58f5f010db86fc.y = 0;
        self.var_ab58f5f010db86fc setshader("white", 640, 480);
        self.var_ab58f5f010db86fc.alignx = "left";
        self.var_ab58f5f010db86fc.aligny = "top";
        self.var_ab58f5f010db86fc.sort = 1;
        self.var_ab58f5f010db86fc.horzalign = "fullscreen";
        self.var_ab58f5f010db86fc.vertalign = "fullscreen";
        self.var_ab58f5f010db86fc.alpha = 0;
        self.var_ab58f5f010db86fc.foreground = 1;
        self.var_ab58f5f010db86fc.archived = 0;
    }
    var_b30889d67cf4b028 = 0.15;
    n_target_alpha = 1;
    self.var_ab58f5f010db86fc fadeovertime(var_b30889d67cf4b028);
    self.var_ab58f5f010db86fc.alpha = 1;
    wait(0.7);
    var_b30889d67cf4b028 = 0.7;
    self.var_ab58f5f010db86fc fadeovertime(var_b30889d67cf4b028);
    self.var_ab58f5f010db86fc.alpha = 0;
    wait(var_b30889d67cf4b028);
    if (isdefined(self.var_ab58f5f010db86fc)) {
        self.var_ab58f5f010db86fc destroy();
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1eae
// Size: 0xca
function private function_2d1de451f4f1ff6f(var_f7ee11dfed87449c, var_3fc85d04e96d05c3) {
    self endon("death");
    portal = spawnscriptable("equip_blackhole_bomb_portal_exit", var_f7ee11dfed87449c);
    portal function_ad9433aab9fcdf04(5, "death", &freescriptable);
    destination = var_f7ee11dfed87449c + var_3fc85d04e96d05c3;
    val::set("blackhole_teleport", "freezecontrols", 1);
    val::set("blackhole_teleport", "offhand_weapons", 0);
    val::set("blackhole_teleport", "weapon", 0);
    self function_c664a2459d6f3eaa("sndevent_kasimir_teleport");
    thread teleport_screen_flash();
    wait(0.2);
    self setorigin(destination, 1);
    waitframe();
    if (isdefined(self)) {
        val::function_c9d0b43701bdba00("blackhole_teleport");
        ent_flag_clear("blackhole_teleporting");
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f7f
// Size: 0x151
function private teleport_players() {
    self.anchor endon("death");
    while (1) {
        foreach (player in self.nearby_players) {
            if (self.var_a2ba86d22c3b53dc == 0) {
                break;
            }
            if (!isalive(player) || !player jumpbuttonpressed() || !player can_teleport()) {
                continue;
            }
            if (player ent_flag("blackhole_teleporting")) {
                continue;
            }
            var_8b333a88ce97ba96 = player geteye();
            var_b8343ddba49c479 = self.anchor function_804aa4597eb3df2c(self.var_8b5f8add8ec135fa);
            if (distancesquared(var_8b333a88ce97ba96, var_b8343ddba49c479) > 4096) {
                continue;
            }
            if (!namespace_2a184fc4902783dc::ray_trace_passed(var_8b333a88ce97ba96, var_b8343ddba49c479, player)) {
                continue;
            }
            player ent_flag_set("blackhole_teleporting");
            var_f7ee11dfed87449c = function_6f3e2351189e02d1(player);
            var_3fc85d04e96d05c3 = (0, 0, self.var_8b5f8add8ec135fa);
            player thread function_2d1de451f4f1ff6f(var_f7ee11dfed87449c, var_3fc85d04e96d05c3);
            wait(0.1);
        }
        waitframe();
    }
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d7
// Size: 0xa6
function function_b24870401644121d(portal_origin, var_a71eab44ed1f8c8) {
    level endon("game_ended");
    var_12a84f92662290d9 = spawnstruct();
    var_12a84f92662290d9.anchor = self;
    var_12a84f92662290d9.var_8b5f8add8ec135fa = 60;
    var_12a84f92662290d9.nearby_players = [];
    var_12a84f92662290d9.var_1c8116a6bf1d1f39 = [];
    var_12a84f92662290d9.var_a2ba86d22c3b53dc = 0;
    if (var_a71eab44ed1f8c8) {
        var_12a84f92662290d9 thread generate_portal_exits(16);
    } else {
        var_12a84f92662290d9 thread function_ff52ed4046bcb7d5();
    }
    /#
        var_12a84f92662290d9 thread function_c0f1f631332882f1();
    #/
    var_12a84f92662290d9 thread function_3ba1ab88f5ad866e();
    var_12a84f92662290d9 thread teleport_players();
}

// Namespace blackhole_bomb/namespace_ef96e7c723871c3d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2184
// Size: 0x6f
function private function_ff52ed4046bcb7d5() {
    self.anchor endon("death");
    var_f57d747b1a4e0f4f = undefined;
    while (1) {
        if (!isdefined(var_f57d747b1a4e0f4f) || distancesquared(self.anchor.origin, var_f57d747b1a4e0f4f) > 65536) {
            thread generate_portal_exits(16);
            var_f57d747b1a4e0f4f = self.anchor.origin;
        }
        waitframe();
    }
}

