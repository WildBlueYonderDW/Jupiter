// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\throttle.gsc;
#using scripts\common\callbacks.gsc;
#using script_5a4a5d9ba343ff8f;

#namespace effect_burn;

// Namespace effect_burn / namespace_50366cf657bc4995
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b
// Size: 0xd2
function burn(durations, damage_percent, damage_cooldowns, attacker, unique_id, var_aaf0465944b061ed, inflictor) {
    if (!istrue(self.aisettings.var_994ad2292fc29de6)) {
        return 0;
    }
    burn_effect = function_108973a907c11ca7("burn", durations, unique_id, &start_burn, &end_burn);
    burn_effect.var_aaf0465944b061ed = var_aaf0465944b061ed;
    burn_effect.damage_percent = damage_percent;
    burn_effect.damage_cooldowns = damage_cooldowns;
    burn_effect.attacker = attacker;
    burn_effect.inflictor = inflictor;
    burn_effect.var_51357609845cf128 = gettime();
    return start_effect(burn_effect);
}

// Namespace effect_burn / namespace_50366cf657bc4995
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x205
// Size: 0x6e
function private start_burn(var_12c084a213d7ad2) {
    thread function_8ca6d968f6bcfe21(var_12c084a213d7ad2);
    if (isdefined(var_12c084a213d7ad2.var_aaf0465944b061ed) && var_12c084a213d7ad2.var_aaf0465944b061ed == "napalmburst_kill") {
        ent_flag_set("napalm_burned");
        callback::callback("napalm_burned", var_12c084a213d7ad2);
        return;
    }
    ent_flag_set("burned");
    callback::callback("burned", var_12c084a213d7ad2);
}

// Namespace effect_burn / namespace_50366cf657bc4995
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27a
// Size: 0x73
function private end_burn(var_12c084a213d7ad2) {
    if (!function_8ce7894f1a52fb77("burn")) {
        if (isdefined(var_12c084a213d7ad2.var_aaf0465944b061ed) && var_12c084a213d7ad2.var_aaf0465944b061ed == "napalmburst_kill") {
            ent_flag_clear("napalm_burned");
            callback::callback("napalm_burned_end", var_12c084a213d7ad2);
            return;
        }
        ent_flag_clear("burned");
        callback::callback("burned_end", var_12c084a213d7ad2);
    }
}

// Namespace effect_burn / namespace_50366cf657bc4995
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f4
// Size: 0x219
function private function_8ca6d968f6bcfe21(effect) {
    self notify("start_status_effect_burn_tick");
    self endon("start_status_effect_burn_tick");
    self endon("death");
    while (self.status_effects["burn"].size > 0) {
        foreach (burn_effect in self.status_effects["burn"]) {
            now = gettime();
            if (now < burn_effect.end_time && now >= burn_effect.var_51357609845cf128) {
                burn_effect.var_51357609845cf128 = burn_effect.var_51357609845cf128 + function_a5b14435e3229bed(burn_effect.damage_cooldowns);
                damage_amount = self.maxhealth * burn_effect.damage_percent;
                if (self.health - damage_amount < 1 && isdefined(effect.var_aaf0465944b061ed)) {
                    if (isplayer(burn_effect.attacker)) {
                        scoreeventparams = spawnstruct();
                        scoreeventparams.scoreevent = effect.var_aaf0465944b061ed;
                        scoreeventparams.reason = #"kill";
                        burn_effect.attacker callback::callback("zombie_score_event", scoreeventparams);
                    }
                }
                var_4122d19555c5a456 = undefined;
                if (isent(burn_effect.attacker)) {
                    var_4122d19555c5a456 = burn_effect.attacker;
                }
                inflictor = var_4122d19555c5a456;
                if (isdefined(burn_effect.inflictor)) {
                    inflictor = burn_effect.inflictor;
                }
                self dodamage(damage_amount, self.origin, var_4122d19555c5a456, inflictor, "MOD_UNKNOWN", "none", "none", undefined, 65536);
            }
            function_f632348cbb773537(function_b46aef18c1b91ade(), self);
        }
    }
}

// Namespace effect_burn / namespace_50366cf657bc4995
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x514
// Size: 0x2f
function private function_b46aef18c1b91ade() {
    if (!isdefined(level.var_9f85bc34217a22a6)) {
        level.var_9f85bc34217a22a6 = throttle_initialize("status_effect_burn", 2);
    }
    return level.var_9f85bc34217a22a6;
}

