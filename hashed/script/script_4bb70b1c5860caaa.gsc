// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_4c770a9a4ad7659c;
#using scripts\engine\trace.gsc;
#using script_3214e6fcdce468a7;
#using scripts\mp\supers.gsc;
#using script_38db8bccc9eb301f;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_16ea1b94f0f381b3;
#using script_63d03bd53d001217;
#using script_686729055b66c6e4;
#using script_429c2a03090c1ea1;

#namespace namespace_9a9b47877ca3f004;

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d7
// Size: 0x13e
function init() {
    level._effect["energy_mine_stationary"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_fld_energy_mine_lvl1_orb.vfx");
    level._effect["energy_mine_explosion3"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_fld_energy_mine_lvl5_activate.vfx");
    namespace_85d036cb78063c4a::function_53110a12409d01da("super_energy_mine", undefined, undefined, &function_62bf63d59a97c263, &function_b790d6291eab001f, undefined);
    namespace_85d036cb78063c4a::registersuperextraweapon("super_energy_mine", "energy_mine_ball_mp");
    /#
        function_6e7290c8ee4f558b("energy_mine_ai_throttle");
        function_a2fe753948998c89("MOD_UNKNOWN", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_fe953f000498048f();
    #/
    var_7c7b046a6b9536fc = getscriptbundle(level.var_7c7b046a6b9536fc);
    foreach (super in var_7c7b046a6b9536fc.var_63b618614d288401) {
        if (super.ref == "super_energy_mine") {
            level.var_f04301db8ca5ecfa["super_energy_mine"] = getscriptbundle("super:" + super.bundle);
            break;
        }
    }
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61c
// Size: 0x5c
function function_62bf63d59a97c263() {
    if (isdefined(level.var_f04301db8ca5ecfa["super_energy_mine"])) {
        var_4c7b639370677d2a = level.var_f04301db8ca5ecfa["super_energy_mine"].offhandweapon;
        var_d54d53eaf955518d = namespace_e23f629a8349dfaf::function_75abcff430ed00b7(var_4c7b639370677d2a);
        if (var_d54d53eaf955518d) {
            thread function_f1a745e0820f56c8();
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x680
// Size: 0x15
function function_b790d6291eab001f(var_fcef8d217a441961, attacker) {
    return 0;
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69d
// Size: 0x2a
function function_f1a745e0820f56c8() {
    self endon("death");
    level endon("game_ended");
    self setscriptablepartstate("wand_fx", "wand_on_energy_mine", 0);
    function_e072876ccd1495e8();
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ce
// Size: 0x234
function function_e072876ccd1495e8() {
    forward = anglestoforward(self getplayerangles());
    var_76da69f57d1f80e = "energy_mine_ball_mp";
    result = namespace_f8065cafc523dba5::isinvehicle();
    if (istrue(result)) {
        seatid = namespace_1fbd40990ee60ede::vehicle_occupancy_getoccupantseat(self.vehicle, self);
        data = namespace_1fbd40990ee60ede::vehicle_occupancy_getexitpositionandangles(self.vehicle, self, seatid);
        if (isdefined(data)) {
            location = data[0];
            var_1465865115935670 = function_ee5a64593eeafb01(location, forward * 1, var_76da69f57d1f80e);
        } else {
            location = self.vehicle.origin + (0, 0, 10);
            var_1465865115935670 = function_ee5a64593eeafb01(location, forward * 1, var_76da69f57d1f80e);
        }
    } else {
        upvector = (0, 0, 1);
        var_5c2c1eddb0f0959b = 10;
        var_197136a65d1c9c3b = 30;
        var_785bdca2b3c12d34 = 400;
        origin = self gettagorigin("j_wrist_le", 1);
        origin = isdefined(origin) ? self gettagorigin("tag_accessory_left") : origin;
        var_1e54d7b3480e50c9 = origin + upvector * var_5c2c1eddb0f0959b + forward * var_197136a65d1c9c3b;
        throwvelocity = forward * var_785bdca2b3c12d34 + self getvelocity();
        var_1465865115935670 = function_ee5a64593eeafb01(var_1e54d7b3480e50c9, throwvelocity, var_76da69f57d1f80e);
    }
    if (isdefined(var_1465865115935670)) {
        var_1465865115935670 function_6b9674c374b1f1d8();
        newent = var_1465865115935670 function_a059dc384d5983ba();
        if (!isdefined(newent)) {
            if (isdefined(var_1465865115935670) && isdefined(var_1465865115935670.scriptable)) {
                var_1465865115935670.scriptable freescriptable();
            }
            if (isdefined(var_1465865115935670)) {
                var_1465865115935670 delete();
            }
            return 0;
        }
        if (isdefined(var_1465865115935670)) {
            var_1465865115935670 delete();
        }
        var_1465865115935670 = newent;
        var_1465865115935670.team = self.team;
        var_1465865115935670 thread function_59a8b49b95ed21bc();
        thread function_7bea38ba568b92e6(var_1465865115935670);
    } else {
        /#
            assertmsg(var_76da69f57d1f80e + " failed to spawn");
        #/
        return 0;
    }
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x909
// Size: 0x86
function private function_ee5a64593eeafb01(location, throwvelocity, var_9dd882aa2117d44f) {
    var_1465865115935670 = magicgrenademanual(var_9dd882aa2117d44f, location, throwvelocity, 99999, self);
    var_7bd51846bb8b9086 = spawnscriptable("super_energymine_ball", var_1465865115935670.origin);
    var_7bd51846bb8b9086 scriptablesetparententity(var_1465865115935670);
    var_1465865115935670.scriptable = var_7bd51846bb8b9086;
    var_1465865115935670.scriptable setscriptablepartstate("audio", "fired");
    return var_1465865115935670;
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x997
// Size: 0xbb
function private function_59a8b49b95ed21bc() {
    var_12baea29dc62088 = function_2e9e02e8bda61ef2();
    if (isdefined(var_12baea29dc62088) && isdefined(var_12baea29dc62088.groundent) && isdefined(var_12baea29dc62088.var_ea3b9640a6ad3c8e) && isdefined(var_12baea29dc62088.localangles)) {
        if (isdefined(self.var_bf8e5f003146af44)) {
            self.var_bf8e5f003146af44 linkto(var_12baea29dc62088.groundent, "", var_12baea29dc62088.var_ea3b9640a6ad3c8e, var_12baea29dc62088.localangles);
        } else {
            self linkto(var_12baea29dc62088.groundent, "", var_12baea29dc62088.var_ea3b9640a6ad3c8e, var_12baea29dc62088.localangles);
        }
    }
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa59
// Size: 0x66
function function_6b9674c374b1f1d8() {
    self endon("death");
    level endon("game_ended");
    last_origin = self.origin + (1, 1, 1);
    while (1) {
        if (distancesquared(self.origin, last_origin) > 0) {
            last_origin = self.origin;
        } else {
            break;
        }
        wait(0.4);
    }
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac6
// Size: 0xb2
function function_a059dc384d5983ba() {
    self endon("death");
    if (!isdefined(self)) {
        return;
    }
    offset = (0, 0, 0);
    ent = spawn_tag_origin(self.origin + offset, (0, 0, 0));
    ent show();
    var_7bd51846bb8b9086 = self.scriptable;
    var_7bd51846bb8b9086 scriptableclearparententity();
    waitframe();
    var_7bd51846bb8b9086 scriptablesetparententity(ent);
    ent.scriptable = var_7bd51846bb8b9086;
    ent.scriptable setscriptablepartstate("audio", "planted");
    ent function_d20c2da6a20af84("energy_mine_stationary");
    return ent;
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb80
// Size: 0x25c
function function_7bea38ba568b92e6(var_1465865115935670) {
    var_1465865115935670 endon("death");
    var_4ba22c74c1521c2a = function_bfef753aaf727ca0("energy_mine_deploy_limit");
    if (isdefined(var_4ba22c74c1521c2a)) {
        if (!isdefined(self.var_c005fa4a47da9984)) {
            self.var_c005fa4a47da9984 = [];
        }
        self.var_c005fa4a47da9984 = array_add(self.var_c005fa4a47da9984, var_1465865115935670);
        if (self.var_c005fa4a47da9984.size > var_4ba22c74c1521c2a) {
            var_c56419f2ede2fc5f = array_get_first_item(self.var_c005fa4a47da9984);
            var_c56419f2ede2fc5f.var_60fae3fe6a67317a = 1;
            self.var_c005fa4a47da9984 = array_remove(self.var_c005fa4a47da9984, var_c56419f2ede2fc5f);
        }
    }
    var_828c4c6ae53b48c4 = 0.6;
    var_818c0fdeb609f44c = 1;
    var_16379c59a5f75eba = function_bfef753aaf727ca0("energy_mine_ai_proximity_distance");
    var_1465865115935670 function_d4081170de1f3ef1(self, var_16379c59a5f75eba);
    var_1465865115935670.scriptable setscriptablepartstate("audio", "tripped");
    if (isdefined(var_1465865115935670)) {
        var_1465865115935670 function_19a5fed2ac84ab0a("energy_mine_stationary");
        var_1465865115935670 function_d20c2da6a20af84("energy_mine_explosion3");
        wait(var_828c4c6ae53b48c4);
        if (isplayer(self)) {
            if (isdefined(var_1465865115935670) && isdefined(var_1465865115935670.scriptable)) {
                var_1465865115935670.scriptable setscriptablepartstate("audio", "explosion");
            }
            if (isdefined(var_1465865115935670)) {
                var_1465865115935670 thread function_a0bf2d7b4b5632f8(self);
            }
        }
        var_dda21aa6ac78fa04 = function_bfef753aaf727ca0("energy_mine_base_extra_explosion");
        for (i = 0; i < var_dda21aa6ac78fa04; i++) {
            wait(var_818c0fdeb609f44c);
            if (isplayer(self)) {
                if (isdefined(var_1465865115935670) && isdefined(var_1465865115935670.scriptable)) {
                    var_1465865115935670.scriptable setscriptablepartstate("audio", "explosion");
                }
                if (isdefined(var_1465865115935670)) {
                    var_1465865115935670 thread function_a0bf2d7b4b5632f8(self);
                }
            } else {
                break;
            }
        }
        wait(var_818c0fdeb609f44c);
        if (isdefined(self.var_c005fa4a47da9984) && isdefined(var_1465865115935670)) {
            self.var_c005fa4a47da9984 = array_remove(self.var_c005fa4a47da9984, var_1465865115935670);
        }
        if (isdefined(var_1465865115935670) && isdefined(var_1465865115935670.scriptable)) {
            var_1465865115935670.scriptable freescriptable();
        }
        if (isdefined(var_1465865115935670)) {
            var_1465865115935670 delete();
        }
    }
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde3
// Size: 0x81
function function_d4081170de1f3ef1(e_player, n_radius) {
    self endon("death");
    while (1) {
        if (!isplayer(e_player)) {
            return;
        }
        if (istrue(self.var_60fae3fe6a67317a)) {
            return;
        }
        a_ai_targets = e_player function_8e6d126b004376fa(n_radius, self.origin, 0);
        a_turrets = e_player function_bdb0c24fab4bf13c(n_radius, self.origin);
        if (a_ai_targets.size || a_turrets.size) {
            return;
        }
        waitframe();
    }
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6b
// Size: 0xc6
function function_226e870ed356947(var_3b3c6903cef1c238, params) {
    if (isdefined(params.player) && isdefined(params.vehicle)) {
        if (!params.vehicle ent_flag_exist("convoy_energy_mine_stopped")) {
            params.player callback::callback("energy_mine_convoy_stopped", params);
            params.vehicle ent_flag_init("convoy_energy_mine_stopped");
        }
        if (var_3b3c6903cef1c238 >= params.vehicle.health || isdefined(params.vehicle.burningdown)) {
            params.vehicle ent_flag_init("energy_mine_kill");
        }
    }
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf38
// Size: 0x63e
function function_a0bf2d7b4b5632f8(player) {
    var_86288ab91cf2da30 = spawnstruct();
    if (!isdefined(level.energy_mine_vehicle_throttle)) {
        level.energy_mine_vehicle_throttle = function_e4c99b0f178ffb98("energy_mine_vehicle_throttle", 1, level.framedurationseconds);
    }
    var_8631e3bf9b3d2f28 = spawnstruct();
    if (!isdefined(level.energy_mine_ai_throttle)) {
        level.energy_mine_ai_throttle = function_e4c99b0f178ffb98("energy_mine_ai_throttle", 1, level.framedurationseconds);
    }
    var_47e7331542d7234a = function_bfef753aaf727ca0("energy_mine_explosion_radius");
    sweapon = "none";
    if (isdefined(level.var_96c4059aa2eabfb8[%"hash_41abaa40d2817d6c"])) {
        if (!isdefined(level.var_96c4059aa2eabfb8[%"hash_41abaa40d2817d6c"].weaponobj)) {
            sweapon = makeweapon(level.var_96c4059aa2eabfb8[%"hash_41abaa40d2817d6c"].weapon);
            level.var_96c4059aa2eabfb8[%"hash_41abaa40d2817d6c"].weaponobj = sweapon;
        } else {
            sweapon = level.var_96c4059aa2eabfb8[%"hash_41abaa40d2817d6c"].weaponobj;
        }
    }
    var_3b3c6903cef1c238 = function_bfef753aaf727ca0("energy_mine_env_damage");
    player radiusdamage(self.origin, var_47e7331542d7234a, var_3b3c6903cef1c238, var_3b3c6903cef1c238, player, "MOD_EXPLOSIVE", sweapon, 1);
    vehicles = vehicle_getarrayinradius(self.origin, var_47e7331542d7234a);
    var_900f41c02b277619 = spawnstruct();
    var_900f41c02b277619.player = player;
    foreach (vehicle in vehicles) {
        var_900f41c02b277619.vehicle = vehicle;
        if (isdefined(vehicle.owner) && isdefined(vehicle.owner.team) && vehicle.owner.team != self.team) {
            function_226e870ed356947(var_3b3c6903cef1c238, var_900f41c02b277619);
        } else if (isdefined(vehicle.team) && vehicle.team != player.team) {
            function_226e870ed356947(var_3b3c6903cef1c238, var_900f41c02b277619);
        }
        vehicle dodamage(var_3b3c6903cef1c238, self.origin, player, player, "MOD_EXPLOSIVE", sweapon);
        function_f632348cbb773537(level.energy_mine_vehicle_throttle, var_86288ab91cf2da30);
    }
    turrets = player function_bdb0c24fab4bf13c(var_47e7331542d7234a, self.origin);
    foreach (turret in turrets) {
        if (isdefined(turret)) {
            turret notify("kill_turret", 1);
        }
    }
    a_ai_targets = player function_8e6d126b004376fa(var_47e7331542d7234a, self.origin, 1);
    var_1166efc9ef31932c = function_bfef753aaf727ca0("energy_mine_ai_soldier_damage");
    var_b3e4335e71ba04f6 = function_bfef753aaf727ca0("energy_mine_ai_special_damage_percent");
    var_86bd417f8eaa95d6 = function_bfef753aaf727ca0("energy_mine_ai_elite_damage_percent");
    var_c44ee1e9c7e69214 = function_bfef753aaf727ca0("energy_mine_ai_boss_damage_percent");
    var_e0dab373c4606f30 = function_bfef753aaf727ca0("energy_mine_ai_base_damage_percent");
    foreach (ai in a_ai_targets) {
        damage = 0;
        if (isdefined(ai.type) && ai.type == "human") {
            if (isdefined(ai.subclass) && issubstr(ai.subclass, "warlord")) {
                if (isdefined(var_86bd417f8eaa95d6)) {
                    damage = ai.maxhealth * var_86bd417f8eaa95d6;
                }
            } else {
                damage = var_1166efc9ef31932c;
            }
        }
        if (damage == 0 && isdefined(ai.aicategory)) {
            if (ai.aicategory == "normal") {
                if (isdefined(var_e0dab373c4606f30)) {
                    damage = ai.maxhealth * var_e0dab373c4606f30;
                }
            } else if (ai.aicategory == "special") {
                damage = ai.maxhealth * var_b3e4335e71ba04f6;
            } else if (ai.aicategory == "elite") {
                damage = ai.maxhealth * var_86bd417f8eaa95d6;
            } else if (ai.aicategory == "boss") {
                damage = ai.maxhealth * var_c44ee1e9c7e69214;
            }
        }
        if (damage == 0) {
            var_43ea7ee7224a5f65 = namespace_53fc9ddbb516e6e1::function_560b2e700ce084a2(ai.origin);
            var_87599197ac030074 = function_bfef753aaf727ca0("energy_mine_env_damage");
            damage = namespace_73f07f62510f0f5b::function_6f4c937aa843fac2(var_87599197ac030074, var_43ea7ee7224a5f65, "frag_grenade", ai.aicategory, ai.maxhealth);
        }
        hitlocation = ai function_e715bf8be42d93b6();
        if (damage >= ai.health) {
            ai ent_flag_init("energy_mine_kill");
            ai ent_flag_set("energy_mine_kill");
            ai val::set("insta_kill", "kill_on_damage", 1);
            ai val::set("zm_allow_give_super_point", "allow_give_super_point", 0);
        }
        ai dodamage(damage, ai.origin, player, player, "MOD_UNKNOWN", sweapon, hitlocation, undefined, 65536);
        function_f632348cbb773537(level.energy_mine_ai_throttle, var_8631e3bf9b3d2f28);
    }
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x157d
// Size: 0x8e
function function_6d2f600ec6654e8(player, a_ai_targets, v_origin) {
    var_cb33d37f28e9ef29 = 3;
    foreach (ai in a_ai_targets) {
        if (!isalive(ai)) {
            continue;
        }
        ai thread function_6fb86f0439bedb8b(var_cb33d37f28e9ef29);
        ai namespace_ed7c38f3847343dc::function_2e4d3c67e63f83ac(var_cb33d37f28e9ef29);
        waitframe();
    }
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1612
// Size: 0x174
function private function_e715bf8be42d93b6() {
    hitlocation = "none";
    if (isdefined(self.var_9bc8186f76d68603)) {
        possiblehitlocations = [];
        var_46a3e181e35f46ab = namespace_6fb6f707cdc959d::function_97fd256a244527b4(self.var_9bc8186f76d68603.var_c545f61c9ba000a9);
        if (isdefined(var_46a3e181e35f46ab)) {
            foreach (var_20237ca8e4edbc82 in var_46a3e181e35f46ab.var_9bc8186f76d68603) {
                if (!self.var_9bc8186f76d68603.info[var_20237ca8e4edbc82.name].is_active) {
                    continue;
                }
                if (namespace_6fb6f707cdc959d::function_cec565632b7fc419(var_20237ca8e4edbc82.name)) {
                    continue;
                }
                if (!isdefined(var_20237ca8e4edbc82.hitlocations)) {
                    continue;
                }
                foreach (var_7cec1af3073bea5d in var_20237ca8e4edbc82.hitlocations) {
                    possiblehitlocations[possiblehitlocations.size] = var_7cec1af3073bea5d.hitlocation;
                }
            }
            if (possiblehitlocations.size > 0) {
                hitlocation = possiblehitlocations[randomintrange(0, possiblehitlocations.size)];
            }
        }
    }
    return hitlocation;
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178e
// Size: 0xd2
function function_8e6d126b004376fa(n_radius, v_origin, var_9fa5d293ddd3b202) {
    var_efbfe13c7644d02b = getaiarrayinradius(v_origin, n_radius);
    a_ai_targets = [];
    foreach (ai in var_efbfe13c7644d02b) {
        if (!isalive(ai)) {
            continue;
        }
        if (isdefined(ai.team) && ai.team == self.team) {
            continue;
        }
        a_ai_targets = array_add(a_ai_targets, ai);
    }
    if (istrue(var_9fa5d293ddd3b202)) {
        a_ai_targets = sortbydistance(a_ai_targets, v_origin);
    }
    return a_ai_targets;
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1868
// Size: 0xc0
function function_bdb0c24fab4bf13c(n_radius, v_origin) {
    var_199e6864751d7458 = getentarrayinradius("misc_turret", "classname", v_origin, n_radius);
    a_targets = [];
    foreach (turret in var_199e6864751d7458) {
        if (!isdefined(turret)) {
            continue;
        }
        if (isdefined(turret.team) && turret.team == self.team) {
            continue;
        }
        a_targets = array_add(a_targets, turret);
    }
    return a_targets;
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1930
// Size: 0x1f
function function_d20c2da6a20af84(var_69e074f3c6e5686a) {
    playfxontag(getfx(var_69e074f3c6e5686a), self, "tag_origin");
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1956
// Size: 0x1f
function function_19a5fed2ac84ab0a(var_69e074f3c6e5686a) {
    stopfxontag(getfx(var_69e074f3c6e5686a), self, "tag_origin");
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x197c
// Size: 0x1a
function function_6fb86f0439bedb8b(duration) {
    level endon("game_ended");
    self endon("death");
}

// Namespace namespace_9a9b47877ca3f004/namespace_f375801da2a1ee3a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199d
// Size: 0x18
function function_bfef753aaf727ca0(str_field) {
    return namespace_e23f629a8349dfaf::function_e7b6474ebd683537("super_energy_mine", str_field);
}

