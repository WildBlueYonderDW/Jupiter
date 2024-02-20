// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5d813d45c6b1b1be;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_cf0b338237e9bb2f;

// Namespace namespace_cf0b338237e9bb2f/namespace_9ea631c76b6bef2c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa
// Size: 0x84
function init(var_5179c48492d1d2c2) {
    function_efabc5ae0422de9e(var_5179c48492d1d2c2);
    var_5179c48492d1d2c2.var_92ea5d02ebdbafaf = [];
    var_5179c48492d1d2c2.var_c003cb00d349f44b = getstruct(var_5179c48492d1d2c2.target, "targetname");
    var_5179c48492d1d2c2.var_7e0a8f7b41c11cfb = getstructarray(var_5179c48492d1d2c2.var_c003cb00d349f44b.target, "targetname");
    thread function_78a99f6fa6a3f5de(var_5179c48492d1d2c2);
    /#
        thread function_19750c412a511f5f(var_5179c48492d1d2c2);
    #/
}

// Namespace namespace_cf0b338237e9bb2f/namespace_9ea631c76b6bef2c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x185
// Size: 0x1f8
function function_78a99f6fa6a3f5de(var_5179c48492d1d2c2) {
    var_5179c48492d1d2c2 endon("MRP_HHG_NOTIFY_SUCCESS");
    while (1) {
        namespace_36f464722d326bbe::function_f5e8b13acc5b4e24();
        foreach (var_ac9fe0afffb8ef7 in level.var_715aa7f8de54c394 function_df633f460888a47(var_5179c48492d1d2c2.var_c003cb00d349f44b.origin)) {
            foreach (projectile in var_ac9fe0afffb8ef7) {
                if (!isdefined(projectile) || !isdefined(projectile.weapon_name)) {
                    continue;
                }
                if (!array_contains([0:"jup_semtex_ob", 1:"jup_frag_grenade_ob"], projectile.weapon_name)) {
                    continue;
                }
                var_5179c48492d1d2c2.var_92ea5d02ebdbafaf = array_removeundefined(var_5179c48492d1d2c2.var_92ea5d02ebdbafaf);
                if (array_contains(var_5179c48492d1d2c2.var_92ea5d02ebdbafaf, projectile)) {
                    continue;
                }
                foreach (window_trigger in var_5179c48492d1d2c2.var_7e0a8f7b41c11cfb) {
                    if (distancesquared(projectile.origin, window_trigger.origin) < window_trigger.radius * window_trigger.radius) {
                        var_5179c48492d1d2c2.var_92ea5d02ebdbafaf = array_add(var_5179c48492d1d2c2.var_92ea5d02ebdbafaf, projectile);
                        var_5179c48492d1d2c2 childthread function_9789f9ab1fa68a93(projectile);
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_cf0b338237e9bb2f/namespace_9ea631c76b6bef2c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x384
// Size: 0xd6
function function_9789f9ab1fa68a93(projectile) {
    while (1) {
        if (!isdefined(projectile)) {
            self.var_92ea5d02ebdbafaf = array_remove(self.var_92ea5d02ebdbafaf, projectile);
            return;
        }
        if (distancesquared(projectile.origin, self.var_c003cb00d349f44b.origin) < self.var_c003cb00d349f44b.radius * self.var_c003cb00d349f44b.radius && distancesquared(self.var_c003cb00d349f44b.origin, projectile.owner.origin) > 250000) {
            thread function_af99b4a9d69fc433(projectile, projectile.owner);
            self notify("MRP_HHG_NOTIFY_SUCCESS");
            return;
        }
        waitframe();
    }
}

// Namespace namespace_cf0b338237e9bb2f/namespace_9ea631c76b6bef2c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x461
// Size: 0x55
function private function_af99b4a9d69fc433(projectile, owner) {
    while (1) {
        if (!isdefined(projectile) || istrue(projectile.exploding)) {
            function_568b8a57e0fa955f(self, owner);
            namespace_8eedd8f6cf5d9f19::function_a4dfabe55dd4a652(owner, self.var_c003cb00d349f44b, "ob_jup_items_activity_mrp_hhg", 1);
            return;
        }
        waitframe();
    }
}

// Namespace namespace_cf0b338237e9bb2f/namespace_9ea631c76b6bef2c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4bd
// Size: 0xdf
function private function_19750c412a511f5f(var_5179c48492d1d2c2) {
    /#
        while (1) {
            if (getdvarint(@"hash_870b2b2720067cf9", 0)) {
                sphere(var_5179c48492d1d2c2.var_c003cb00d349f44b.origin, var_5179c48492d1d2c2.var_c003cb00d349f44b.radius, (0, 1, 0));
                foreach (window_trigger in var_5179c48492d1d2c2.var_7e0a8f7b41c11cfb) {
                    sphere(window_trigger.origin, window_trigger.radius, (0, 1, 0));
                }
            }
            waitframe();
        }
    #/
}

