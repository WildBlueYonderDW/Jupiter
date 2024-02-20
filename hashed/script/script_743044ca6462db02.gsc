// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5d813d45c6b1b1be;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_1ed614e30b49e2ed;

// Namespace namespace_1ed614e30b49e2ed/namespace_9b230bed5d2cbd7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb
// Size: 0x119
function init(var_5179c48492d1d2c2) {
    function_efabc5ae0422de9e(var_5179c48492d1d2c2);
    level._effect["vfx_mrp_bonfire"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_zm_firepit_sm.vfx");
    var_5179c48492d1d2c2.var_92ea5d02ebdbafaf = [];
    var_5179c48492d1d2c2.var_15e5a065bd9bc560 = getstruct(var_5179c48492d1d2c2.target, "targetname");
    var_5179c48492d1d2c2.var_afb1f6db651e2203 = getstruct(var_5179c48492d1d2c2.var_15e5a065bd9bc560.target, "targetname");
    var_bc470c2421433610 = getstruct(var_5179c48492d1d2c2.var_afb1f6db651e2203.target, "targetname");
    var_5179c48492d1d2c2.reward_struct = getstruct(var_bc470c2421433610.target, "targetname");
    var_5179c48492d1d2c2.var_cfdd50d1363c2440 = namespace_8eedd8f6cf5d9f19::function_698513ab21b7913d(var_bc470c2421433610);
    thread function_6bb52c1ccf10c874(var_5179c48492d1d2c2);
    thread function_f7f26ad6ed8a5a9(var_5179c48492d1d2c2);
    /#
        if (getdvarint(@"hash_870b2b2720067cf9", 0)) {
            thread function_e7077708bf984b51(var_5179c48492d1d2c2);
        }
    #/
}

// Namespace namespace_1ed614e30b49e2ed/namespace_9b230bed5d2cbd7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31b
// Size: 0x56
function function_f7f26ad6ed8a5a9(var_5179c48492d1d2c2) {
    var_5179c48492d1d2c2 endon("MRP_BONFIRE_NOTIFY_SUCCESS");
    while (1) {
        data = var_5179c48492d1d2c2.var_cfdd50d1363c2440 waittill("trigger");
        if (data.classname == "actor_jup_spawner_zombie_hellhound") {
            data thread function_f71c0dfb2a56fe9f(var_5179c48492d1d2c2);
        }
    }
}

// Namespace namespace_1ed614e30b49e2ed/namespace_9b230bed5d2cbd7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378
// Size: 0x8d
function function_f71c0dfb2a56fe9f(var_5179c48492d1d2c2) {
    self notify("MRP_BONFIRE_HELLHOUND_SINGLETON");
    self endon("MRP_BONFIRE_HELLHOUND_SINGLETON");
    attacker = self waittill("death");
    if (!isplayer(attacker)) {
        return;
    }
    if (distance(self.origin, var_5179c48492d1d2c2.var_afb1f6db651e2203.origin) < 100) {
        exploder("mrpc_bonfire");
        /#
            iprintlnbold("<unknown string>");
        #/
        attacker thread function_5bc7e10e27f62a48(var_5179c48492d1d2c2);
        var_5179c48492d1d2c2 notify("MRP_BONFIRE_NOTIFY_SUCCESS");
    }
}

// Namespace namespace_1ed614e30b49e2ed/namespace_9b230bed5d2cbd7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40c
// Size: 0x1b1
function function_6bb52c1ccf10c874(var_5179c48492d1d2c2) {
    var_5179c48492d1d2c2 endon("MRP_BONFIRE_NOTIFY_SUCCESS");
    while (1) {
        namespace_36f464722d326bbe::function_f5e8b13acc5b4e24();
        foreach (projectile in level.var_715aa7f8de54c394 function_99b7cb4906b8cb4f(var_5179c48492d1d2c2.origin)) {
            if (!isdefined(projectile)) {
                waitframe();
            } else if (!array_contains([0:"jup_thermite_ob", 1:"jup_molotov_ob"], projectile.weapon_name)) {
                waitframe();
            } else if (array_contains(var_5179c48492d1d2c2.var_92ea5d02ebdbafaf, projectile)) {
                waitframe();
            } else if (!isdefined(projectile.owner.origin)) {
                waitframe();
            } else if (distancesquared(projectile.owner.origin, var_5179c48492d1d2c2.var_afb1f6db651e2203.origin) > 1000000) {
                waitframe();
            } else if (distancesquared(projectile.origin, var_5179c48492d1d2c2.var_afb1f6db651e2203.origin) < var_5179c48492d1d2c2.var_afb1f6db651e2203.radius * var_5179c48492d1d2c2.var_afb1f6db651e2203.radius) {
                exploder("mrpc_bonfire");
                /#
                    iprintlnbold("<unknown string>");
                #/
                projectile.owner thread function_5bc7e10e27f62a48(var_5179c48492d1d2c2);
                var_5179c48492d1d2c2 notify("MRP_BONFIRE_NOTIFY_SUCCESS");
            }
        }
        waitframe();
    }
}

// Namespace namespace_1ed614e30b49e2ed/namespace_9b230bed5d2cbd7a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5c4
// Size: 0xe
function private function_cc3e13f38f81229() {
    wait(15);
    self notify("MRP_BONFIRE_NOTIFY_TIMEOUT");
}

// Namespace namespace_1ed614e30b49e2ed/namespace_9b230bed5d2cbd7a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x5d9
// Size: 0x91
function private function_5fbea66198fd836a(projectile, owner) {
    self endon("MRP_BONFIRE_NOTIFY_TIMEOUT");
    while (1) {
        data = self.var_c4a6ff90b11ac74 waittill("trigger");
        if (isplayer(data) && data == owner) {
            if (istrue(data.var_1bf2c7fb1024bf90)) {
                continue;
            }
            /#
                iprintlnbold("<unknown string>");
            #/
            data.var_1bf2c7fb1024bf90 = 1;
            data childthread function_3405018385bb58ed(self);
            data childthread function_8e4e6ef939444a94(self);
        }
        waitframe();
    }
}

// Namespace namespace_1ed614e30b49e2ed/namespace_9b230bed5d2cbd7a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x671
// Size: 0x95
function private function_3405018385bb58ed(var_5179c48492d1d2c2) {
    self endon("MRP_BONFIRE_NOTIFY_FAILURE");
    start_time = gettime();
    while (gettime() - start_time < 3000) {
        data = var_5179c48492d1d2c2.var_c4a6ff90b11ac74 waittill("trigger");
        if (data == self) {
            self notify("MRP_BONFIRE_NOTIFY_CONTINUE");
        }
        wait(0.5);
    }
    /#
        iprintlnbold("<unknown string>");
    #/
    thread function_5bc7e10e27f62a48(var_5179c48492d1d2c2);
    var_5179c48492d1d2c2.var_c4a6ff90b11ac74 delete();
    var_5179c48492d1d2c2 notify("MRP_BONFIRE_NOTIFY_SUCCESS");
}

// Namespace namespace_1ed614e30b49e2ed/namespace_9b230bed5d2cbd7a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x70d
// Size: 0x44
function private function_5bc7e10e27f62a48(var_5179c48492d1d2c2) {
    var_5179c48492d1d2c2.var_cfdd50d1363c2440 delete();
    function_568b8a57e0fa955f(var_5179c48492d1d2c2, self);
    wait(2);
    namespace_8eedd8f6cf5d9f19::function_a4dfabe55dd4a652(self, var_5179c48492d1d2c2.reward_struct, "ob_jup_items_activity_mrp_bonfire");
}

// Namespace namespace_1ed614e30b49e2ed/namespace_9b230bed5d2cbd7a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x758
// Size: 0x5d
function private function_8e4e6ef939444a94(var_5179c48492d1d2c2) {
    self endon("MRP_BONFIRE_NOTIFY_FAILURE");
    while (1) {
        result = waittill_any_timeout_1(1, "MRP_BONFIRE_NOTIFY_CONTINUE");
        if (result == "timeout") {
            /#
                iprintlnbold("<unknown string>");
            #/
            self.var_1bf2c7fb1024bf90 = undefined;
            self notify("MRP_BONFIRE_NOTIFY_FAILURE");
        }
    }
}

// Namespace namespace_1ed614e30b49e2ed/namespace_9b230bed5d2cbd7a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7bc
// Size: 0x4b
function private function_27c2d9e9caf7b6c5(var_5179c48492d1d2c2) {
    self endon("MRP_BONFIRE_NOTIFY_FAILURE");
    while (1) {
        if (self getstance() != "crouch") {
            /#
                iprintlnbold("<unknown string>");
            #/
            self.var_1bf2c7fb1024bf90 = undefined;
            self notify("MRP_BONFIRE_NOTIFY_FAILURE");
        }
        waitframe();
    }
}

// Namespace namespace_1ed614e30b49e2ed/namespace_9b230bed5d2cbd7a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x80e
// Size: 0x80
function private function_e7077708bf984b51(var_5179c48492d1d2c2) {
    /#
        while (1) {
            sphere(var_5179c48492d1d2c2.var_afb1f6db651e2203.origin, var_5179c48492d1d2c2.var_afb1f6db651e2203.radius, (0, 1, 0));
            sphere(var_5179c48492d1d2c2.var_afb1f6db651e2203.origin, 1000, (1, 1, 0));
            waitframe();
        }
    #/
}

