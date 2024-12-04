#using scripts\asm\asm;
#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\stealth\debug;
#using scripts\stealth\utility;

#namespace corpse;

// Namespace corpse / scripts\stealth\corpse
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14d
// Size: 0x2e
function corpse_init_entity() {
    assert(isdefined(self.stealth));
    self.stealth.corpse = spawnstruct();
}

// Namespace corpse / scripts\stealth\corpse
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x183
// Size: 0x8c
function corpse_init_level() {
    if (isdefined(level.stealth) && isdefined(level.stealth.corpse)) {
        return;
    }
    level.stealth.corpse = spawnstruct();
    level.stealth.corpse.reset_time = 30;
    level scripts\stealth\utility::set_stealth_func("saw_corpse", &corpse_seen);
    level scripts\stealth\utility::set_stealth_func("found_corpse", &corpse_found);
    set_corpse_ranges_default();
}

// Namespace corpse / scripts\stealth\corpse
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x217
// Size: 0x34
function set_corpse_ranges_default() {
    array["sight_dist"] = 600;
    array["detect_dist"] = 300;
    array["found_dist"] = 100;
    set_corpse_ranges(array);
}

// Namespace corpse / scripts\stealth\corpse
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x253
// Size: 0x2c
function set_corpse_ranges(array) {
    if (!isdefined(array["shadow_dist"])) {
        array["shadow_dist"] = array["found_dist"];
    }
    function_76b92db94020c5ce(array);
}

// Namespace corpse / scripts\stealth\corpse
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x287
// Size: 0x1a
function set_corpse_ignore() {
    assert(isent(self));
    function_aa940a5b82d4d6a3(self, 1);
}

// Namespace corpse / scripts\stealth\corpse
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a9
// Size: 0xc7
function corpse_check_shadow(origin) {
    if (!isdefined(self.in_shadow_origin) || distancesquared(self.in_shadow_origin, origin) > 1) {
        self.in_shadow = undefined;
        if (isdefined(level.trigger_stealth_shadow)) {
            foreach (trigger in level.trigger_stealth_shadow) {
                if (isdefined(trigger) && ispointinvolume(origin, trigger)) {
                    self.in_shadow = 1;
                    break;
                }
            }
        }
        self.in_shadow_origin = origin;
    }
    return istrue(self.in_shadow);
}

// Namespace corpse / scripts\stealth\corpse
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x379
// Size: 0xfb
function corpse_found(event) {
    self notify("corpse_found");
    self endon("corpse_found");
    self endon("death");
    if (isdefined(level.battlechatter)) {
        function_216c67ab6749137a(self, undefined, "corpse_found");
    }
    corpse = event.entity;
    corpseorigin = getcorpseorigin(corpse);
    if (isdefined(self.var_2836afe73a94b60b) && self.var_2836afe73a94b60b != corpse) {
        function_bc97202ba2db4cf4(self.var_2836afe73a94b60b, 0);
    }
    self.var_2836afe73a94b60b = corpse;
    if (!isdefined(self.var_a9abd657131af071) || self.var_a9abd657131af071 == "small") {
        self.bexaminerequested = 1;
    }
    if (isdefined(level.fnsetcorpseremovetimerfunc)) {
        corpse [[ level.fnsetcorpseremovetimerfunc ]](level.stealth.corpse.reset_time);
    }
}

// Namespace corpse / scripts\stealth\corpse
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47c
// Size: 0xde
function corpse_seen(event) {
    if (isdefined(level.battlechatter)) {
        function_216c67ab6749137a(self, undefined, "corpse_seen");
    }
    corpse = event.entity;
    corpseorigin = getcorpseorigin(corpse);
    self.stealth.corpse.origin = corpseorigin;
    if (!isdefined(self.var_a9abd657131af071) || self.var_a9abd657131af071 == "small") {
        self.bexaminerequested = 1;
    }
    self notify("corpse_seen_claim");
    if (isdefined(self.var_2836afe73a94b60b) && self.var_2836afe73a94b60b != corpse) {
        function_bc97202ba2db4cf4(self.var_2836afe73a94b60b, 0);
    }
    function_bc97202ba2db4cf4(corpse, 1);
    self.var_2836afe73a94b60b = corpse;
}

