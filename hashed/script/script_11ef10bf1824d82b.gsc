// mwiii decomp prototype
#using scripts\aitypes\bt_util.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\anim\weaponlist.gsc;
#using scripts\anim\utility_common.gsc;
#using script_595089f78ef8e11b;
#using script_405d05c89e998922;
#using script_686729055b66c6e4;

#namespace namespace_b33bbc2484de3752;

// Namespace namespace_b33bbc2484de3752/namespace_757f0fc2fc31608f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x343
// Size: 0x85
function init_zombie_base_abom_crawler() {
    if (flag("init_zombie_base_abom_crawler")) {
        return;
    }
    flag_set("init_zombie_base_abom_crawler");
    callback::add("on_zombie_base_abom_crawler_spawned", &on_zombie_base_abom_crawler_spawned);
    callback::add("on_zombie_base_abom_crawler_hvt_spawned", &on_zombie_base_abom_crawler_spawned);
    callback::add("on_zombie_base_abom_crawler_nest_spawned", &on_zombie_base_abom_crawler_spawned);
    level._effect["zombie_base_abom_crawler_explode"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_megabomb_crawler_exp.vfx");
    level._effect["zombie_base_abom_crawler_aoe"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_megabomb_crawler_aoe.vfx");
}

// Namespace namespace_b33bbc2484de3752/namespace_757f0fc2fc31608f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cf
// Size: 0x5b
function private on_zombie_base_abom_crawler_spawned(params) {
    thread_on_notify("bmeleestarted", &function_322d8cb834021eb0);
    thread_on_notify("explode_death", &function_ec481db6f0a4e653);
    callback::add("on_zombie_ai_damaged", &function_13da6f593406ec4d);
    self.var_fe9174386ff8b1f = 1;
    namespace_9e6ef02d993a7eba::function_dd8dcd65f2ebbb35(1);
    thread function_692d3f57a32b93d9();
}

// Namespace namespace_b33bbc2484de3752/namespace_757f0fc2fc31608f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x431
// Size: 0x76
function private function_13da6f593406ec4d(var_d74fc41b6b10ccf5) {
    if (isdefined(var_d74fc41b6b10ccf5.smeansofdeath) && var_d74fc41b6b10ccf5.smeansofdeath == "MOD_EXPLOSIVE" || var_d74fc41b6b10ccf5.smeansofdeath == "MOD_EXPLOSIVE_BULLET" || var_d74fc41b6b10ccf5.smeansofdeath == "MOD_GRENADE_SPLASH" || var_d74fc41b6b10ccf5.smeansofdeath == "MOD_PROJECTILE_SPLASH") {
        function_ec481db6f0a4e653();
    }
}

// Namespace namespace_b33bbc2484de3752/namespace_757f0fc2fc31608f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ae
// Size: 0x2d
function private function_322d8cb834021eb0() {
    self notify("ambientvoxshutdown");
    utility::function_3ab9164ef76940fd("explode", "charge");
    utility::function_3ab9164ef76940fd("audio_explode", "rise");
}

// Namespace namespace_b33bbc2484de3752/namespace_757f0fc2fc31608f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e2
// Size: 0x8a
function private function_ec481db6f0a4e653() {
    self notify("ambientvoxshutdown");
    playfx(level._effect["zombie_base_abom_crawler_explode"], self.origin);
    playfx(level._effect["zombie_base_abom_crawler_aoe"], self.origin);
    utility::function_3ab9164ef76940fd("audio_explode", "explode");
    thread function_5b62af1eb5b04cc9(self.origin, self.team);
    wait(0.2);
    self.nocorpse = 1;
    self kill();
}

// Namespace namespace_b33bbc2484de3752/namespace_757f0fc2fc31608f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x573
// Size: 0x1a8
function private function_5b62af1eb5b04cc9(position, friendly_team) {
    var_6106559c907390e4 = spawn_script_origin();
    time_interval = 0.5;
    var_4806892e9b0b79ef = 3.5;
    var_27e637c9d6724493 = 150;
    var_f548ba0eafd95830 = 10;
    var_a95f61e7118777d1 = 20;
    var_6d3c185e57dfab73 = 0;
    while (var_6d3c185e57dfab73 <= var_4806892e9b0b79ef) {
        /#
            if (function_8320c7d13584d021()) {
                sphere(position, var_27e637c9d6724493, (1, 0, 0));
            }
        #/
        var_35e8bc989028d1b7 = physics_querypoint(position, var_27e637c9d6724493, physics_createcontents([0:"physicscontents_characterproxy"]), [0:self], "physicsquery_all");
        foreach (potential_target in var_35e8bc989028d1b7) {
            target_ent = potential_target["entity"];
            if (!isalive(target_ent) || target_ent.team == friendly_team) {
                continue;
            }
            if (isai(potential_target)) {
                if (potential_target.type == "zombie") {
                    potential_target namespace_ed7c38f3847343dc::function_2e4d3c67e63f83ac(time_interval);
                }
            }
            damage = ter_op(var_6d3c185e57dfab73 == 0, var_a95f61e7118777d1, var_f548ba0eafd95830);
            target_ent dodamage(damage, position, var_6106559c907390e4);
        }
        wait(time_interval);
        var_6d3c185e57dfab73 = var_6d3c185e57dfab73 + time_interval;
    }
    var_6106559c907390e4 delete();
}

// Namespace namespace_b33bbc2484de3752/namespace_757f0fc2fc31608f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x722
// Size: 0x47
function private function_692d3f57a32b93d9() {
    self endon("death");
    while (1) {
        self waittill("wander_start");
        self._blackboard.var_46621811c1024018 = self.origin;
        thread function_3ef8c54a29b98522();
        self waittill("wander_end");
    }
}

// Namespace namespace_b33bbc2484de3752/namespace_757f0fc2fc31608f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x770
// Size: 0x9d
function private function_3ef8c54a29b98522() {
    self endon("death");
    self endon("wander_end");
    var_a7e8c3cb1a811e6f = 10;
    wait(var_a7e8c3cb1a811e6f);
    if (isdefined(self.var_c383683308e840a7)) {
        var_15ac5500f542090d = distance2dsquared(self.var_c383683308e840a7.origin, self.origin);
        var_62733f9f4971379d = 1500;
        if (var_15ac5500f542090d > var_62733f9f4971379d * var_62733f9f4971379d) {
            self kill();
        }
        self._blackboard.var_46621811c1024018 = self.var_c383683308e840a7.origin;
    }
}

// Namespace namespace_b33bbc2484de3752/namespace_757f0fc2fc31608f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x814
// Size: 0xc1
function private function_6e789d7df8701ad3() {
    var_fc3f1cd5f74c5908 = 3;
    self endon("death");
    self endon("ambientvoxshutdown");
    wait(randomfloatrange(1, 3));
    var_b038488e06f13dd0 = 0;
    while (1) {
        if (isdefined(self.movemode) && self.movemode == "stop") {
            wait(1);
            continue;
        }
        if (isdefined(level.var_3c408363d81b00e0)) {
            level.var_3c408363d81b00e0++;
            if (level.var_3c408363d81b00e0 < var_fc3f1cd5f74c5908) {
                var_b038488e06f13dd0 = 1;
                level thread function_d01c8da69fe6ad5(self, "ambient_normal", "vox_ai_abom_crawl_ambient", 1);
            }
        }
        if (var_b038488e06f13dd0) {
            var_b038488e06f13dd0 = 0;
            wait(randomfloatrange(0.1, 0.3));
        } else {
            wait(0.1);
        }
    }
}

// Namespace namespace_b33bbc2484de3752/namespace_757f0fc2fc31608f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8dc
// Size: 0x18
function private function_8320c7d13584d021() {
    /#
        return getdvarint(@"hash_1b61c9ce76ad3a4e", 0) > 0;
    #/
}

