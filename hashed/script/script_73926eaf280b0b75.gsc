// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3214e6fcdce468a7;
#using script_4c770a9a4ad7659c;
#using script_5a4a5d9ba343ff8f;

#namespace namespace_a73476b42a42e4c8;

// Namespace namespace_a73476b42a42e4c8/namespace_50366cf657bc4995
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b
// Size: 0xd2
function burn(durations, damage_percent, var_8ed41aa732686e5, attacker, unique_id, var_aaf0465944b061ed, inflictor) {
    if (!istrue(self.aiSettings.var_994ad2292fc29de6)) {
        return 0;
    }
    var_f8237675007c4d48 = function_108973a907c11ca7("burn", durations, unique_id, &function_2353dea549961531, &function_534b96f6da57102);
    var_f8237675007c4d48.var_aaf0465944b061ed = var_aaf0465944b061ed;
    var_f8237675007c4d48.damage_percent = damage_percent;
    var_f8237675007c4d48.var_8ed41aa732686e5 = var_8ed41aa732686e5;
    var_f8237675007c4d48.attacker = attacker;
    var_f8237675007c4d48.inflictor = inflictor;
    var_f8237675007c4d48.var_51357609845cf128 = gettime();
    return start_effect(var_f8237675007c4d48);
}

// Namespace namespace_a73476b42a42e4c8/namespace_50366cf657bc4995
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x205
// Size: 0x6e
function private function_2353dea549961531(var_12c084a213d7ad2) {
    thread function_8ca6d968f6bcfe21(var_12c084a213d7ad2);
    if (isdefined(var_12c084a213d7ad2.var_aaf0465944b061ed) && var_12c084a213d7ad2.var_aaf0465944b061ed == "napalmburst_kill") {
        ent_flag_set("napalm_burned");
        callback::callback("napalm_burned", var_12c084a213d7ad2);
    } else {
        ent_flag_set("burned");
        callback::callback("burned", var_12c084a213d7ad2);
    }
}

// Namespace namespace_a73476b42a42e4c8/namespace_50366cf657bc4995
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27a
// Size: 0x73
function private function_534b96f6da57102(var_12c084a213d7ad2) {
    if (!function_8ce7894f1a52fb77("burn")) {
        if (isdefined(var_12c084a213d7ad2.var_aaf0465944b061ed) && var_12c084a213d7ad2.var_aaf0465944b061ed == "napalmburst_kill") {
            ent_flag_clear("napalm_burned");
            callback::callback("napalm_burned_end", var_12c084a213d7ad2);
        } else {
            ent_flag_clear("burned");
            callback::callback("burned_end", var_12c084a213d7ad2);
        }
    }
}

// Namespace namespace_a73476b42a42e4c8/namespace_50366cf657bc4995
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f4
// Size: 0x219
function private function_8ca6d968f6bcfe21(effect) {
    self notify("start_status_effect_burn_tick");
    self endon("start_status_effect_burn_tick");
    self endon("death");
    while (self.status_effects["burn"].size > 0) {
        foreach (var_f8237675007c4d48 in self.status_effects["burn"]) {
            now = gettime();
            if (now < var_f8237675007c4d48.end_time && now >= var_f8237675007c4d48.var_51357609845cf128) {
                var_f8237675007c4d48.var_51357609845cf128 = var_f8237675007c4d48.var_51357609845cf128 + function_a5b14435e3229bed(var_f8237675007c4d48.var_8ed41aa732686e5);
                damage_amount = self.maxhealth * var_f8237675007c4d48.damage_percent;
                if (self.health - damage_amount < 1 && isdefined(effect.var_aaf0465944b061ed)) {
                    if (isplayer(var_f8237675007c4d48.attacker)) {
                        var_1b903f780de3dc79 = spawnstruct();
                        var_1b903f780de3dc79.scoreevent = effect.var_aaf0465944b061ed;
                        var_1b903f780de3dc79.reason = #"kill";
                        var_f8237675007c4d48.attacker callback::callback("zombie_score_event", var_1b903f780de3dc79);
                    }
                }
                var_4122d19555c5a456 = undefined;
                if (isent(var_f8237675007c4d48.attacker)) {
                    var_4122d19555c5a456 = var_f8237675007c4d48.attacker;
                }
                inflictor = var_4122d19555c5a456;
                if (isdefined(var_f8237675007c4d48.inflictor)) {
                    inflictor = var_f8237675007c4d48.inflictor;
                }
                self dodamage(damage_amount, self.origin, var_4122d19555c5a456, inflictor, "MOD_UNKNOWN", "none", "none", undefined, 65536);
            }
            function_f632348cbb773537(function_b46aef18c1b91ade(), self);
        }
    }
}

// Namespace namespace_a73476b42a42e4c8/namespace_50366cf657bc4995
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x514
// Size: 0x2f
function private function_b46aef18c1b91ade() {
    if (!isdefined(level.var_9f85bc34217a22a6)) {
        level.var_9f85bc34217a22a6 = function_e4c99b0f178ffb98("status_effect_burn", 2);
    }
    return level.var_9f85bc34217a22a6;
}

