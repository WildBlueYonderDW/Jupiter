// mwiii decomp prototype
#using script_7edf952f8921aa6b;
#using scripts\asm\asm.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\common\ai.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_16ea1b94f0f381b3;
#using scripts\common\system.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using script_19c169a442d5975a;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\engine\utility.gsc;
#using scripts\vehicle\vehicle_common.gsc;
#using scripts\stealth\enemy.gsc;
#using script_686729055b66c6e4;
#using script_405d05c89e998922;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;

#namespace ww_humangun;

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x5f9
// Size: 0x22
function private autoexec __init__system__() {
    system::register(#"ww_humangun", #"ww_setup", &function_ca54f37762600466, undefined);
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x622
// Size: 0x63
function private function_ca54f37762600466() {
    level callback::add("player_weapon_change", &function_4405588a9af68a0a);
    function_51479cdb5a0fd4c7();
    utility::registersharedfunc("player", "onHumanGunPowerupDamage", &function_248c0b74e56b5699);
    level zombie_utils::function_b5e57408c7878df7(&function_95fd04af9b96bd16);
    level namespace_fb05e1623b934e8::function_9a024cd909d6e0a3(&function_ca515975069c3e76);
    level namespace_25ead30c6ed027fb::register_vehicle_damage_callback(&function_7c89ba702a4e1038);
    /#
        function_9979ab75cbd987dd();
    #/
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x68c
// Size: 0x5ea
function private function_51479cdb5a0fd4c7() {
    var_2de32448c67a5ad = makeweapon("jup_la_humangun_mp");
    if (!is_equal(function_f581838ce4328f7a(var_2de32448c67a5ad), "humangun")) {
        /#
            assertmsg("Weapon is not a Human Gun weapon");
        #/
        return;
    }
    level.var_e01baa6e6a9eef5c = {var_2759d442fe0a4fc8:[], var_a884758675fa7873:[]};
    custom_settings = var_2de32448c67a5ad.weaponcustomsettings;
    if (!isdefined(custom_settings)) {
        /#
            assertmsg("Can't find custom settings for Human Gun weapon");
        #/
        return;
    }
    if (isdefined(custom_settings.var_f83ca5ee7d0caf2f)) {
        foreach (var_7d06282de3611219 in custom_settings.var_f83ca5ee7d0caf2f) {
            if (!isdefined(var_7d06282de3611219.unittype) || !isdefined(var_7d06282de3611219.subclass)) {
                continue;
            }
            level.var_e01baa6e6a9eef5c.var_a884758675fa7873[level.var_e01baa6e6a9eef5c.var_a884758675fa7873.size] = var_7d06282de3611219.unittype + ":" + var_7d06282de3611219.subclass;
        }
    }
    if (isdefined(custom_settings.var_db084f1cf5e27d83)) {
        foreach (var_24e74da2ae566502 in custom_settings.var_db084f1cf5e27d83) {
            if (!isdefined(var_24e74da2ae566502.name)) {
                continue;
            }
            type_array = [];
            var_d18824e20516924b = [];
            type_index = 0;
            foreach (var_6bbf8239a7a2d1f3 in var_24e74da2ae566502.var_60a51bbca016b65) {
                if (var_6bbf8239a7a2d1f3.weight > 0) {
                    type_array[type_index] = var_6bbf8239a7a2d1f3.aitype;
                    var_d18824e20516924b[type_index] = var_6bbf8239a7a2d1f3.weight;
                    type_index++;
                }
            }
            level.var_e01baa6e6a9eef5c.var_64344bdf55255fd7[var_24e74da2ae566502.name] = {var_d18824e20516924b:var_d18824e20516924b, type_array:type_array};
        }
    }
    if (isdefined(custom_settings.var_20233888a67ff470)) {
        foreach (var_5c3840bfc944d881 in custom_settings.var_20233888a67ff470) {
            if (!isdefined(var_5c3840bfc944d881.unittype) || !isdefined(var_5c3840bfc944d881.subclass) || !isdefined(var_5c3840bfc944d881.var_5217ac10dbbbc8d9)) {
                continue;
            }
            /#
                assert(isdefined(level.var_e01baa6e6a9eef5c.var_64344bdf55255fd7[var_5c3840bfc944d881.var_5217ac10dbbbc8d9]));
            #/
            level.var_e01baa6e6a9eef5c.var_2759d442fe0a4fc8[var_5c3840bfc944d881.unittype + ":" + var_5c3840bfc944d881.subclass] = {var_c6c617738926a03c:var_5c3840bfc944d881.var_43811893a316f84b, var_64344bdf55255fd7:var_5c3840bfc944d881.var_5217ac10dbbbc8d9};
        }
    }
    if (isdefined(custom_settings.var_ef601e3ee477e950)) {
        level._effect["humangun_transformation_fx"] = loadfx(custom_settings.var_ef601e3ee477e950);
    }
    if (isdefined(custom_settings.var_d321e477699580b7)) {
        level._effect["humangun_transformation_pap_fx"] = loadfx(custom_settings.var_d321e477699580b7);
    }
    if (isdefined(custom_settings.var_e496af7439e11c89)) {
        level.var_e01baa6e6a9eef5c.var_6de68dec41c3f263 = custom_settings.var_e496af7439e11c89;
    }
    if (isdefined(custom_settings.var_4e1f6080aa106884)) {
        level.var_e01baa6e6a9eef5c.var_1966e1831c542d8e = custom_settings.var_4e1f6080aa106884;
        for (i = 0; i < custom_settings.var_4e1f6080aa106884.size; i++) {
            if (isdefined(custom_settings.var_4e1f6080aa106884[i].var_fda0ed7e67ea625d)) {
                level._effect["humangun_consecutive_hit_normal_fx_" + i + 1] = loadfx(custom_settings.var_4e1f6080aa106884[i].var_fda0ed7e67ea625d);
            }
            if (isdefined(custom_settings.var_4e1f6080aa106884[i].var_cbc64e1962385dc0)) {
                level._effect["humangun_consecutive_hit_normal_pap_fx_" + i + 1] = loadfx(custom_settings.var_4e1f6080aa106884[i].var_cbc64e1962385dc0);
            }
            if (isdefined(custom_settings.var_4e1f6080aa106884[i].var_7b066992b167348f)) {
                level._effect["humangun_consecutive_hit_large_fx_" + i + 1] = loadfx(custom_settings.var_4e1f6080aa106884[i].var_7b066992b167348f);
            }
            if (isdefined(custom_settings.var_4e1f6080aa106884[i].var_268d8ef9df8d4f06)) {
                level._effect["humangun_consecutive_hit_large_pap_fx_" + i + 1] = loadfx(custom_settings.var_4e1f6080aa106884[i].var_268d8ef9df8d4f06);
            }
        }
    }
    if (isdefined(custom_settings.var_622d0dcc6ccb65a2)) {
        level._effect["humangun_pap_transformed_explosion_fx"] = loadfx(custom_settings.var_622d0dcc6ccb65a2);
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7d
// Size: 0xbf
function function_4405588a9af68a0a(params) {
    if (isweapon(params.weapon)) {
        var_aa4e219eafaa4d9 = function_f581838ce4328f7a(params.weapon);
        if (is_equal(var_aa4e219eafaa4d9, "humangun")) {
            /#
                assert(isdefined(level.var_e01baa6e6a9eef5c));
            #/
            thread function_c46bf1052c91620();
            is_upgraded = namespace_2b1145f62aa835b8::function_af5127390d3221e9(params.weapon) > 0;
            thread function_f509ccd3c26bebee(is_upgraded);
            thread function_c0fff54bdd610fff();
            return;
        }
    }
    self notify("stop_monitor_humangun_fire");
    self notify("stop_monitor_humangun_vfx_state");
    utility::function_3677f2be30fdd581("human_gun_fx", "off");
    self.var_f71a970f77310f07 = undefined;
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd43
// Size: 0x66
function private function_c0fff54bdd610fff() {
    self endon("death");
    self endon("stop_monitor_humangun_vfx_state");
    while (1) {
        result = waittill_any_return_5("weapon_switch_started", "skydive_deployparachute", "weapon_switch_canceled", "offhand_end", "skydive_end");
        if (!isdefined(result)) {
            continue;
        }
        self.var_f71a970f77310f07 = result == "weapon_switch_started" || result == "skydive_deployparachute";
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdb0
// Size: 0xa9
function private function_f509ccd3c26bebee(is_upgraded) {
    self endon("death");
    self notify("stop_monitor_humangun_vfx_state");
    self endon("stop_monitor_humangun_vfx_state");
    var_a627695ca60ccced = 0;
    if (!istrue(self.var_c2ffb89c2dc28d5e)) {
        wait(1.2);
        self.var_c2ffb89c2dc28d5e = 1;
    }
    while (1) {
        weapon_active = !istrue(self.var_f71a970f77310f07);
        if (weapon_active != var_a627695ca60ccced) {
            if (weapon_active) {
                utility::function_3677f2be30fdd581("human_gun_fx", is_upgraded ? "weapon_active_pap" : "weapon_active");
            } else {
                utility::function_3677f2be30fdd581("human_gun_fx", "off");
            }
            var_a627695ca60ccced = weapon_active;
        }
        waitframe();
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe60
// Size: 0xa6
function private function_c46bf1052c91620() {
    self endon("death");
    self notify("stop_monitor_humangun_fire");
    self endon("stop_monitor_humangun_fire");
    while (1) {
        weapon = projectile = self waittill("missile_fire");
        if (isdefined(projectile) && isdefined(weapon) && is_equal(function_f581838ce4328f7a(weapon), "humangun")) {
            projectile setentityowner(undefined);
            projectile.is_upgraded = namespace_2b1145f62aa835b8::function_af5127390d3221e9(weapon) > 0;
            projectile thread function_7a42dc2737de32fc(self, weapon);
            projectile thread function_49d9f4c10c483cc4(self, weapon);
            projectile thread function_2dc0cad678a62470(self);
            projectile thread function_7ad0f0c81051396f(self);
        }
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf0d
// Size: 0x5a
function private function_7a42dc2737de32fc(attacker, weapon) {
    self endon("humangun_hit");
    self waittill("death");
    if (isdefined(self) && isplayer(attacker)) {
        attacker.var_f5164c160f176e2f = undefined;
        attacker radiusdamage(self.origin, 50, 220, 5, attacker, "MOD_EXPLOSIVE", weapon);
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf6e
// Size: 0x63
function private function_69fbf21c6968c480() {
    self endon("death");
    max_targets = istrue(self.is_upgraded) ? 3 : 1;
    self notify("humangun_hit");
    self.var_1b7b67f665b522ca = function_53c4c53197386572(self.var_1b7b67f665b522ca, 0) + 1;
    if (self.var_1b7b67f665b522ca >= max_targets) {
        waittillframeend();
        self delete();
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfd8
// Size: 0x1b
function private delay_endon(string) {
    self waittill(string);
    waittillframeend();
    self notify("delay_" + string);
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xffa
// Size: 0xa2
function private function_49d9f4c10c483cc4(attacker, weapon) {
    self endon("delay_death");
    childthread delay_endon("death");
    attacker endon("death_or_disconnect");
    if (!isdefined(attacker.team)) {
        return;
    }
    while (1) {
        ai = self waittill("projectile_impact_ai");
        if (!isalive(ai) || is_equal(ai.team, attacker.team) || isdefined(ai.var_e365c08bc3b28fc0)) {
            continue;
        }
        thread function_b1b8bef6d07fab7b(ai, attacker, weapon);
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10a3
// Size: 0x5b
function private function_dd53a55c27406672(var_e702bf0dc03f8c6d) {
    var_64344bdf55255fd7 = level.var_e01baa6e6a9eef5c.var_64344bdf55255fd7[var_e702bf0dc03f8c6d];
    if (isdefined(var_64344bdf55255fd7)) {
        var_6bbf8239a7a2d1f3 = function_6e4039e57d0a3e7e(var_64344bdf55255fd7.type_array, var_64344bdf55255fd7.var_d18824e20516924b);
        return var_6bbf8239a7a2d1f3;
    }
    return undefined;
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1106
// Size: 0x12b
function private function_b1b8bef6d07fab7b(ai, attacker, weapon) {
    thread function_69fbf21c6968c480();
    attacker function_b4a87d1c46429f40(ai);
    if (!isdefined(ai.unittype) || !isdefined(ai.subclass)) {
        return;
    }
    var_520fbbdb23e0bddd = ai.unittype + ":" + ai.subclass;
    if (istrue(ai._blackboard.var_93aa3eefdf57f46) || array_contains(level.var_e01baa6e6a9eef5c.var_a884758675fa7873, var_520fbbdb23e0bddd)) {
        ai kill();
    } else {
        var_5c3840bfc944d881 = level.var_e01baa6e6a9eef5c.var_2759d442fe0a4fc8[var_520fbbdb23e0bddd];
        if (isdefined(var_5c3840bfc944d881)) {
            var_6bbf8239a7a2d1f3 = function_dd53a55c27406672(var_5c3840bfc944d881.var_64344bdf55255fd7);
            if (isdefined(var_6bbf8239a7a2d1f3)) {
                ai thread function_1645c86f412894a2(var_6bbf8239a7a2d1f3, attacker, var_5c3840bfc944d881.var_c6c617738926a03c, istrue(self.is_upgraded));
            }
        } else {
            thread function_24431db3fb80ec73(ai, attacker, weapon);
        }
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1238
// Size: 0xe2
function private function_2f8e6fe2d4ed8af8(var_cad65df1d1eb2c93) {
    self.var_f8acc27178c5ea5b = function_53c4c53197386572(self.var_f8acc27178c5ea5b, []);
    var_c413d6aa7dc7aba0 = [];
    for (i = self.var_f8acc27178c5ea5b.size - 1; i >= 0; i--) {
        agent = self.var_f8acc27178c5ea5b[i];
        if (!isalive(agent) || isai(agent) && agent doinglongdeath() || agent == var_cad65df1d1eb2c93) {
            continue;
        }
        if (is_equal(agent.var_e365c08bc3b28fc0, 1)) {
            if (var_c413d6aa7dc7aba0.size < 2) {
                var_c413d6aa7dc7aba0[var_c413d6aa7dc7aba0.size] = agent;
            } else {
                agent kill();
            }
        }
    }
    if (var_c413d6aa7dc7aba0.size > 0) {
        var_c413d6aa7dc7aba0 = array_reverse(var_c413d6aa7dc7aba0);
    }
    var_c413d6aa7dc7aba0[var_c413d6aa7dc7aba0.size] = var_cad65df1d1eb2c93;
    self.var_f8acc27178c5ea5b = var_c413d6aa7dc7aba0;
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1321
// Size: 0x1b
function private function_3c0a0f8cc46643f1(var_9a6b08f16368f69f) {
    self endon("death");
    animscripted_single(var_9a6b08f16368f69f);
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1343
// Size: 0x24
function private function_a8f0e10480b1f5b4(var_9a6b08f16368f69f, node_struct) {
    self endon("death");
    animscripted_single_relative(var_9a6b08f16368f69f, node_struct);
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x136e
// Size: 0x3e0
function private function_1645c86f412894a2(var_1e6e19f31783df76, attacker, var_c6c617738926a03c, is_upgraded) {
    attacker_team = attacker.team;
    if (!isdefined(attacker_team)) {
        return;
    }
    if (isdefined(self.var_e365c08bc3b28fc0)) {
        return;
    }
    self.var_e365c08bc3b28fc0 = 0;
    self.battlechatterallowed = 0;
    self notify("removed from battleChatter");
    disable_pain();
    val::set("humangun_transforming", "ignoreall", 1);
    val::set("humangun_transforming", "disallow_stun", 1);
    val::set("humangun_transforming", "disallow_knockdown", 1);
    var_5a52293fee9aed2f = is_upgraded ? "humangun_transformation_pap_fx" : "humangun_transformation_fx";
    if (utility::fxexists(var_5a52293fee9aed2f)) {
        playfxontag(utility::getfx(var_5a52293fee9aed2f), self, "j_spine4");
    }
    if (namespace_57744fbd46e2d2d5::hasvehicle()) {
        waitframe();
        if (isalive(self)) {
            self kill();
        }
        return;
    }
    function_3c0a0f8cc46643f1("humangun_turn_into");
    if (!isalive(self)) {
        return;
    }
    var_554bc47ac994662e = self function_617d6e7d0b7859cc() ? "female" : "male";
    var_5245f9956e09e9b1 = self.agent_type;
    var_e9ecac3bbe4fc333 = self.var_42e5c77b1d7fe6e7;
    if (string_starts_with(var_5245f9956e09e9b1, "actor_")) {
        var_5245f9956e09e9b1 = getsubstr(var_5245f9956e09e9b1, 6);
    }
    anim_node = spawnstruct();
    anim_node.origin = self.origin;
    anim_node.angles = self.angles;
    if (is_equal(self.type, "zombie")) {
        self.var_7e4b076a06c6df27 = 1;
    }
    despawnagent();
    character_list = undefined;
    if (issubstr(var_1e6e19f31783df76, "basic_grunt") && var_554bc47ac994662e == "female") {
        character_list = "female";
    }
    var_496f2ebba4c22ee = attacker_team;
    if (isplayer(attacker) && isdefined(attacker.team)) {
        var_496f2ebba4c22ee = attacker.team;
    }
    var_cad65df1d1eb2c93 = spawnnewaitype_sharedfunc(var_1e6e19f31783df76, anim_node.origin, anim_node.angles, var_496f2ebba4c22ee, character_list, var_554bc47ac994662e);
    if (isdefined(var_cad65df1d1eb2c93)) {
        var_cad65df1d1eb2c93.var_e365c08bc3b28fc0 = 1;
        var_cad65df1d1eb2c93.var_8e63ab141b9f85f9 = var_5245f9956e09e9b1;
        var_cad65df1d1eb2c93.var_ca8cda392638c7db = var_e9ecac3bbe4fc333;
        if (isdefined(var_c6c617738926a03c) && var_c6c617738926a03c > 0) {
            var_cad65df1d1eb2c93.maxhealth = var_c6c617738926a03c;
        }
        var_cad65df1d1eb2c93 function_ca27630def7b7aad(attacker);
        var_cad65df1d1eb2c93.var_941802a0997e0c42 = attacker;
        var_cad65df1d1eb2c93.var_93eb5ea81d2cc4d = 1;
        var_cad65df1d1eb2c93.var_988d62e7fca4e8c2 = 0;
        var_cad65df1d1eb2c93 val::set("humangun_transformed", "damage", 0);
        var_cad65df1d1eb2c93 val::set("humangun_transformed", "ignoreme", 1);
        var_cad65df1d1eb2c93.battlechatterallowed = 0;
        var_cad65df1d1eb2c93 notify("removed from battleChatter");
        var_cad65df1d1eb2c93 utility::function_3677f2be30fdd581("humangun_transformed", "transformed_fx_on");
        if (!isdefined(var_cad65df1d1eb2c93.script_stealthgroup)) {
            var_cad65df1d1eb2c93.script_stealthgroup = "humangun_transformed_stealth_group";
            var_cad65df1d1eb2c93 thread namespace_6db9b2dcda758664::main();
        }
        if (isplayer(attacker)) {
            attacker function_2f8e6fe2d4ed8af8(var_cad65df1d1eb2c93);
        }
        var_cad65df1d1eb2c93 function_a8f0e10480b1f5b4("humangun_turn_from", anim_node);
        if (isalive(var_cad65df1d1eb2c93)) {
            var_cad65df1d1eb2c93 animscripted_clear();
            var_cad65df1d1eb2c93 function_65cdab0fc78aba8f(var_cad65df1d1eb2c93.origin, 2000);
            var_cad65df1d1eb2c93 val::reset("humangun_transformed", "ignoreme");
            var_cad65df1d1eb2c93.aggressivemode = 1;
            var_cad65df1d1eb2c93.usestrictreacquiresightshoot = 1;
            var_cad65df1d1eb2c93 thread function_c5b688060b9a63ae(is_upgraded);
        }
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1755
// Size: 0x224
function private function_e61ac5f093c0ad62() {
    function_3c0a0f8cc46643f1("humangun_turned_death_intro");
    if (!isalive(self)) {
        return undefined;
    }
    anim_node = spawnstruct();
    anim_node.origin = self.origin;
    anim_node.angles = self.angles;
    var_496f2ebba4c22ee = self.team;
    var_8b8d2919220bc129 = self.health;
    var_cfbb4689987a4111 = self.maxhealth;
    var_554bc47ac994662e = self function_617d6e7d0b7859cc() ? "female" : "male";
    var_f8126e87c176d7f9 = self.var_8e63ab141b9f85f9;
    var_c3f0a3ebfd4659db = is_equal(self.var_ca8cda392638c7db, "default") ? undefined : self.var_ca8cda392638c7db;
    var_941802a0997e0c42 = self.var_941802a0997e0c42;
    var_988d62e7fca4e8c2 = self.var_988d62e7fca4e8c2;
    if (is_equal(self.type, "zombie")) {
        self.var_7e4b076a06c6df27 = 1;
    }
    self.var_941802a0997e0c42 = undefined;
    despawnagent();
    if (isdefined(var_f8126e87c176d7f9)) {
        var_ae1c129be05bb93c = spawnnewaitype_sharedfunc(var_f8126e87c176d7f9, anim_node.origin, anim_node.angles, var_496f2ebba4c22ee, var_c3f0a3ebfd4659db, var_554bc47ac994662e);
        if (isdefined(var_ae1c129be05bb93c)) {
            var_ae1c129be05bb93c.var_e365c08bc3b28fc0 = 2;
            var_ae1c129be05bb93c function_ca27630def7b7aad();
            var_ae1c129be05bb93c.var_941802a0997e0c42 = var_941802a0997e0c42;
            var_ae1c129be05bb93c.var_93eb5ea81d2cc4d = 1;
            var_ae1c129be05bb93c.var_988d62e7fca4e8c2 = var_988d62e7fca4e8c2;
            var_ae1c129be05bb93c val::set("humangun_transformed", "damage", 0);
            var_ae1c129be05bb93c.maxhealth = var_cfbb4689987a4111;
            var_ae1c129be05bb93c.health = var_8b8d2919220bc129;
            var_ae1c129be05bb93c.do_immediate_ragdoll = 1;
            var_ae1c129be05bb93c utility::function_3677f2be30fdd581("humangun_transformed", "transformed_fx_on");
            var_ae1c129be05bb93c function_a8f0e10480b1f5b4("humangun_turned_death_outro", anim_node);
            return var_ae1c129be05bb93c;
        }
    }
    return undefined;
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1981
// Size: 0xfa
function private function_2a853ff67461d06b(is_upgraded) {
    agent = self;
    if (is_equal(self.unittype, "soldier")) {
        agent = function_e61ac5f093c0ad62();
    }
    if (!isalive(agent)) {
        return;
    }
    if (is_upgraded) {
        agent.var_f33496b914378bbd = 1;
        if (utility::fxexists("humangun_pap_transformed_explosion_fx")) {
            var_d49ecb358968208b = function_53c4c53197386572(agent gettagorigin("j_spine4", 1), agent.origin);
            playfx(utility::getfx("humangun_pap_transformed_explosion_fx"), var_d49ecb358968208b);
        }
        agent radiusdamage(agent.origin, 256, 3420, 1700, agent, "MOD_EXPLOSIVE");
        wait(0.4);
    }
    if (isalive(agent)) {
        if (is_equal(agent.type, "zombie")) {
            agent.var_7e4b076a06c6df27 = 1;
        }
        agent kill();
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a82
// Size: 0x1f
function private function_c5b688060b9a63ae(is_upgraded) {
    self endon("death");
    wait(15);
    thread function_2a853ff67461d06b(is_upgraded);
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1aa8
// Size: 0xaf
function private function_b4a87d1c46429f40(victim) {
    if (!isdefined(self.var_f5164c160f176e2f)) {
        self.var_f5164c160f176e2f = spawnstruct();
    }
    if (!isdefined(self.var_f5164c160f176e2f.victim) || self.var_f5164c160f176e2f.victim != victim) {
        self.var_f5164c160f176e2f.victim = victim;
        self.var_f5164c160f176e2f.var_f9761284972135c5 = 0;
    }
    self.var_f5164c160f176e2f.var_f9761284972135c5 = self.var_f5164c160f176e2f.var_f9761284972135c5 % 3 + 1;
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b5e
// Size: 0x118
function private function_24431db3fb80ec73(agent, attacker, weapon) {
    if (isdefined(agent.aicategory)) {
        if (agent.aicategory == "special") {
            function_3aac7fba9f5de153(agent, attacker, attacker.var_f5164c160f176e2f.var_f9761284972135c5, weapon);
        } else if (agent.aicategory == "elite") {
            function_54976578adb8d7f7(agent, attacker, attacker.var_f5164c160f176e2f.var_f9761284972135c5, weapon);
        } else if (agent.aicategory == "boss") {
            function_3d2e2ae7d4a1195f(agent, attacker, attacker.var_f5164c160f176e2f.var_f9761284972135c5, weapon);
        }
    } else if (agent ai::function_74368588170b0497()) {
        function_54976578adb8d7f7(agent, attacker, attacker.var_f5164c160f176e2f.var_f9761284972135c5, weapon);
    } else {
        function_3aac7fba9f5de153(agent, attacker, attacker.var_f5164c160f176e2f.var_f9761284972135c5, weapon);
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c7d
// Size: 0xc1
function private function_b73079d82ccbc0cb(attacker, var_f9761284972135c5, is_upgraded) {
    if (isdefined(self.aicategory) && self.aicategory == "boss") {
        return;
    }
    hit_fx = undefined;
    var_90fdc24590fe48f0 = self getboundshalfsize();
    if (max(var_90fdc24590fe48f0[0], var_90fdc24590fe48f0[1]) < 64) {
        hit_fx = (is_upgraded ? "humangun_consecutive_hit_normal_pap_fx_" : "humangun_consecutive_hit_normal_fx_") + var_f9761284972135c5;
    } else {
        hit_fx = (is_upgraded ? "humangun_consecutive_hit_large_pap_fx_" : "humangun_consecutive_hit_large_fx_") + var_f9761284972135c5;
    }
    if (utility::fxexists(hit_fx) && isplayer(attacker)) {
        playfxontagforclients(utility::getfx(hit_fx), self, "j_spine4", attacker);
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d45
// Size: 0x19c
function private function_3aac7fba9f5de153(agent, attacker, var_f9761284972135c5, weapon) {
    var_1cb27f891d7c8b99 = [0:0.1, 1:0.15, 2:0.25];
    /#
        assert(var_f9761284972135c5 > 0 && var_f9761284972135c5 <= var_1cb27f891d7c8b99.size);
    #/
    var_bccff4eb0fbb027a = agent.maxhealth * var_1cb27f891d7c8b99[var_f9761284972135c5 - 1];
    agent function_b73079d82ccbc0cb(attacker, var_f9761284972135c5, istrue(self.is_upgraded));
    var_d39b9b69b9c1a06a = is_equal(agent.type, "human");
    switch (var_f9761284972135c5) {
    case 2:
        var_335349871f393012 = 3;
        if (istrue(self.is_upgraded)) {
            var_335349871f393012 = var_335349871f393012 * 2;
        }
        if (var_d39b9b69b9c1a06a) {
            agent notify("flashbang", agent.origin);
            goto LOC_0000010e;
        }
        agent namespace_ed7c38f3847343dc::function_2e4d3c67e63f83ac(var_335349871f393012);
    case 1:
    LOC_0000010e:
        agent dodamage(var_bccff4eb0fbb027a, self.origin, attacker, self, "MOD_IMPACT", weapon);
        break;
    case 3:
        if (var_bccff4eb0fbb027a >= agent.health && !var_d39b9b69b9c1a06a) {
            agent namespace_9e6ef02d993a7eba::annihilate();
            agent kill();
        } else {
            agent dodamage(var_bccff4eb0fbb027a, self.origin, attacker, self, "MOD_IMPACT", weapon);
        }
        break;
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ee8
// Size: 0x17e
function private function_54976578adb8d7f7(agent, attacker, var_f9761284972135c5, weapon) {
    var_1cb27f891d7c8b99 = [0:0.025, 1:0.05, 2:0.1];
    /#
        assert(var_f9761284972135c5 <= var_1cb27f891d7c8b99.size);
    #/
    var_bccff4eb0fbb027a = agent.maxhealth * var_1cb27f891d7c8b99[var_f9761284972135c5 - 1];
    agent function_b73079d82ccbc0cb(attacker, var_f9761284972135c5, istrue(self.is_upgraded));
    var_d39b9b69b9c1a06a = is_equal(agent.type, "human");
    switch (var_f9761284972135c5) {
    case 1:
        agent disable_pain();
        agent dodamage(var_bccff4eb0fbb027a, self.origin, attacker, self, "MOD_IMPACT", weapon);
        agent enable_pain();
        break;
    case 3:
        var_335349871f393012 = 3;
        if (istrue(self.is_upgraded)) {
            var_335349871f393012 = var_335349871f393012 * 2;
        }
        if (var_d39b9b69b9c1a06a) {
            agent notify("flashbang", agent.origin);
            goto LOC_00000137;
        }
        agent namespace_ed7c38f3847343dc::function_2e4d3c67e63f83ac(var_335349871f393012);
    case 2:
    LOC_00000137:
        agent dodamage(var_bccff4eb0fbb027a, self.origin, attacker, self, "MOD_IMPACT", weapon);
        break;
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x206d
// Size: 0xa2
function private function_3d2e2ae7d4a1195f(agent, attacker, var_f9761284972135c5, weapon) {
    var_1cb27f891d7c8b99 = [0:0.005, 1:0.0025, 2:0.05];
    /#
        assert(var_f9761284972135c5 <= var_1cb27f891d7c8b99.size);
    #/
    var_bccff4eb0fbb027a = agent.maxhealth * var_1cb27f891d7c8b99[var_f9761284972135c5 - 1];
    agent function_b73079d82ccbc0cb(attacker, var_f9761284972135c5, istrue(self.is_upgraded));
    agent dodamage(var_bccff4eb0fbb027a, self.origin, attacker, self, "MOD_IMPACT", weapon);
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2116
// Size: 0x3e
function private function_3f283b94120f2cf8(weapon, meansofdeath) {
    if (!isdefined(weapon) || !isdefined(meansofdeath)) {
        return 0;
    }
    return is_equal(function_f581838ce4328f7a(weapon), "humangun") && meansofdeath == "MOD_EXPLOSIVE";
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x215c
// Size: 0x34
function private function_95fd04af9b96bd16(params) {
    if (function_3f283b94120f2cf8(params.sweapon, params.smeansofdeath)) {
        return 0;
    }
    return function_248c0b74e56b5699(params);
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2198
// Size: 0x2f
function private function_ca515975069c3e76(params) {
    if (function_3f283b94120f2cf8(params.sweapon, params.smeansofdeath)) {
        return 0;
    }
    return -1;
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21cf
// Size: 0x95
function private function_2dc0cad678a62470(attacker) {
    self endon("delay_death");
    childthread delay_endon("death");
    attacker endon("death_or_disconnect");
    if (!isdefined(attacker.team)) {
        return;
    }
    while (1) {
        player = self waittill("projectile_impact_player");
        if (!isalive(player) || !is_equal(player.team, attacker.team) || is_equal(player, attacker)) {
            continue;
        }
        thread function_6d650476765969f(player, attacker);
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x226b
// Size: 0x2f
function private function_6d650476765969f(player, attacker) {
    thread function_69fbf21c6968c480();
    attacker function_b4a87d1c46429f40(player);
    player thread function_70a116b31333aee3(attacker);
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22a1
// Size: 0xc5
function private function_70a116b31333aee3(attacker) {
    if (istrue(self.humangun_transformed)) {
        return;
    }
    self.humangun_transformed = 1;
    utility::function_f3bb4f4911a1beb2("player", "setIgnoredByZombies", "humangun", 1);
    var_a4b3c5217d526b58 = level.var_e01baa6e6a9eef5c.var_6de68dec41c3f263;
    if (isdefined(var_a4b3c5217d526b58)) {
        namespace_f15b4b82e231cf42::function_27a921508cb04613(var_a4b3c5217d526b58, 0.5);
    }
    utility::function_3677f2be30fdd581("humangun_powerup_fx", "powerup_fx_on");
    wait(7);
    if (isdefined(self)) {
        utility::function_f3bb4f4911a1beb2("player", "setIgnoredByZombies", "humangun", 0);
        if (isdefined(var_a4b3c5217d526b58)) {
            namespace_f15b4b82e231cf42::function_9a92ae402e209ecc(var_a4b3c5217d526b58);
        }
        utility::function_3677f2be30fdd581("humangun_powerup_fx", "powerup_fx_worn_off");
        self.humangun_transformed = undefined;
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x236d
// Size: 0x4a
function private function_248c0b74e56b5699(params) {
    if (isplayer(params.eattacker) && istrue(params.eattacker.humangun_transformed)) {
        return (params.idamage * 2);
    }
    return -1;
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23bf
// Size: 0x2f
function private function_7c89ba702a4e1038(params) {
    if (function_3f283b94120f2cf8(params.objweapon, params.meansofdeath)) {
        return 0;
    }
    return -1;
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23f6
// Size: 0x122
function private function_7ad0f0c81051396f(attacker) {
    self endon("delay_death");
    childthread delay_endon("death");
    attacker endon("death_or_disconnect");
    while (1) {
        vehicle = self waittill("projectile_impact_vehicle");
        if (istrue(self.is_upgraded) && vehicle isvehicle() && !vehicle function_b7148a3bfc4defb2()) {
            var_44329742b6e043c9 = vehicle.maxhealth * 0.25;
            vehicle function_653b96ce8310763e(var_44329742b6e043c9);
            vehicle thread function_5fd2dcf6788ab3f2();
            if (isdefined(vehicle.fuel)) {
                var_ff14b8ed1c93b9be = vehicle_interact_getleveldataforvehicle(vehicle.vehiclename).var_29f1ea79ed2b40dd;
                vehicle.fuel = min(var_ff14b8ed1c93b9be, vehicle.fuel + var_ff14b8ed1c93b9be * 0.25);
                vehicle namespace_84cff6185e39aa66::function_9da76b0be4b2a2d4(vehicle.fuel, var_ff14b8ed1c93b9be);
            }
            if (is_equal(vehicle.vehiclename, "veh_jup_ob_tank_escort")) {
                vehicle notify("damage");
            }
        }
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x251f
// Size: 0x24
function private function_5fd2dcf6788ab3f2() {
    if (isdefined(self.var_f2b4d0e8470f108b)) {
        function_e6f68a61bffc259a(self, 0);
    } else {
        function_9b27177ad97bb8d8(self);
    }
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x254a
// Size: 0x71
function private function_9979ab75cbd987dd() {
    /#
        function_6e7290c8ee4f558b("humangun_hit");
        function_b23a59dfb4ca49a1("default", "<unknown string>", &function_2b409a09a21ce63d);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_2b409a09a21ce63d);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_d566dbc05a0a774);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_5c99c5fb2d0edeee);
        function_fe953f000498048f();
    #/
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x25c2
// Size: 0x15a
function private function_2b409a09a21ce63d(params) {
    /#
        player = level.players[0];
        enemies = getaispeciesarray("<unknown string>", "<unknown string>");
        var_5609f6af3401797 = get_array_of_closest(player.origin, enemies);
        is_upgraded = int(params[0]) > 0;
        var_6cc875025be834fe = undefined;
        foreach (agent in var_5609f6af3401797) {
            if (!isdefined(agent.var_e365c08bc3b28fc0)) {
                var_6cc875025be834fe = agent;
                break;
            }
        }
        if (!isdefined(var_6cc875025be834fe)) {
            return;
        }
        var_5c3840bfc944d881 = level.var_e01baa6e6a9eef5c.var_2759d442fe0a4fc8[var_6cc875025be834fe.unittype + "<unknown string>" + var_6cc875025be834fe.subclass];
        if (isdefined(var_5c3840bfc944d881)) {
            var_6bbf8239a7a2d1f3 = function_dd53a55c27406672(var_5c3840bfc944d881.var_64344bdf55255fd7);
            if (isdefined(var_6bbf8239a7a2d1f3)) {
                var_6cc875025be834fe thread function_1645c86f412894a2(var_6bbf8239a7a2d1f3, player, var_5c3840bfc944d881.var_c6c617738926a03c, is_upgraded);
            }
        }
    #/
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2723
// Size: 0xc2
function private function_d566dbc05a0a774(params) {
    /#
        player = level.players[0];
        enemies = getaispeciesarray("<unknown string>", "<unknown string>");
        var_5609f6af3401797 = get_array_of_closest(player.origin, enemies);
        foreach (agent in var_5609f6af3401797) {
            if (is_equal(agent.var_e365c08bc3b28fc0, 1)) {
                agent thread function_2a853ff67461d06b(1);
            }
        }
    #/
}

// Namespace ww_humangun/namespace_bbdaab8ec2235136
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x27ec
// Size: 0x26
function private function_5c99c5fb2d0edeee() {
    /#
        player = level.players[0];
        player thread function_70a116b31333aee3(player);
    #/
}

