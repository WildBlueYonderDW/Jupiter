// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_5a4a5d9ba343ff8f;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;

#namespace effect_slow;

// Namespace effect_slow / namespace_5e5b12854e72824d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed
// Size: 0x117
function slow(var_3f84102752151e7c, var_561c4006f65fb505, n_durations, var_d4739501723a457c, endcallback, var_9142743ed938c8bb) {
    /#
        assertex(isstring(var_3f84102752151e7c), "String required for str_slowType");
    #/
    /#
        assertex(isnumber(var_561c4006f65fb505), "Number required for n_slowRate");
    #/
    /#
        assertex(isnumber(n_durations), "Number required for n_durationS");
    #/
    if (!istrue(var_9142743ed938c8bb)) {
        if (!isdefined(self.aisettings) || !istrue(self.aisettings.var_c9cbc4a3332e44c6)) {
            return 0;
        }
    }
    if (scripts/asm/asm_bb::bb_isanimscripted()) {
        return 0;
    }
    if (!function_8ce7894f1a52fb77("slow")) {
        self.var_8ad91e7d5175af88 = scripts/asm/asm::asm_getmoveplaybackrate();
    }
    effect = function_108973a907c11ca7("slow", n_durations, var_3f84102752151e7c, &start_slow, &end_slow);
    effect.var_d4739501723a457c = var_d4739501723a457c;
    effect.rate = var_561c4006f65fb505;
    effect.end_callback = endcallback;
    return start_effect(effect);
}

// Namespace effect_slow / namespace_5e5b12854e72824d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20c
// Size: 0xe4
function private start_slow(effect) {
    n_time = gettime();
    var_3eab2eda9e5ce31 = undefined;
    var_9751e67c93627448 = undefined;
    foreach (effect in self.status_effects["slow"]) {
        if (!isdefined(var_9751e67c93627448) || effect.rate < var_9751e67c93627448.rate) {
            var_9751e67c93627448 = effect;
        }
        if (!isdefined(var_3eab2eda9e5ce31) || effect.end_time < var_3eab2eda9e5ce31) {
            var_3eab2eda9e5ce31 = effect.end_time;
        }
    }
    if (isdefined(var_9751e67c93627448) && n_time < var_3eab2eda9e5ce31) {
        function_3d9c0570527484dd(var_9751e67c93627448.rate);
    }
}

// Namespace effect_slow / namespace_5e5b12854e72824d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f7
// Size: 0x103
function private end_slow(effect) {
    current_time = gettime();
    return_rate = default_to(self.var_8ad91e7d5175af88, 1);
    foreach (active_effect in self.status_effects["slow"]) {
        if (isdefined(active_effect.unique_id) && effect.unique_id == active_effect.unique_id) {
            return;
        }
        if (effect.rate < return_rate && effect.end_time > current_time) {
            return_rate = effect;
        }
    }
    function_3d9c0570527484dd(return_rate);
    if (isdefined(effect.end_callback)) {
        self [[ effect.end_callback ]]();
    }
}

// Namespace effect_slow / namespace_5e5b12854e72824d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x401
// Size: 0x60
function private function_3d9c0570527484dd(var_41e050c00dbd88ee) {
    if (!isagent(self)) {
        return;
    }
    if (scripts/asm/asm::function_4bb232c0fca955f6() == var_41e050c00dbd88ee) {
        return;
    }
    scripts/asm/asm::function_8d1655ae223d862a(var_41e050c00dbd88ee);
    if (!istrue(self.is_traversing) && !istrue(self.is_dying) && gettime() > self.birthtime) {
        function_6e9cb6cd0535fe65();
    }
}

// Namespace effect_slow / namespace_5e5b12854e72824d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x468
// Size: 0xa1
function stop_slow(var_3f84102752151e7c) {
    /#
        assertex(isstring(var_3f84102752151e7c), "String required for str_slowType");
    #/
    foreach (active_effect in self.status_effects["slow"]) {
        if (isdefined(active_effect.unique_id) && var_3f84102752151e7c == active_effect.unique_id) {
            active_effect.end_time = -1;
        }
    }
}

// Namespace effect_slow / namespace_5e5b12854e72824d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x510
// Size: 0x64
function function_778c51b997394ed8() {
    foreach (active_effect in self.status_effects["slow"]) {
        active_effect.end_time = -1;
    }
}

// Namespace effect_slow / namespace_5e5b12854e72824d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57b
// Size: 0xe
function is_slowed() {
    return function_8ce7894f1a52fb77("slow");
}

// Namespace effect_slow / namespace_5e5b12854e72824d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x591
// Size: 0xa7
function has_slow(var_3f84102752151e7c) {
    /#
        assertex(isstring(var_3f84102752151e7c), "String required for str_slowType");
    #/
    if (!function_8ce7894f1a52fb77("slow")) {
        return false;
    }
    foreach (active_effect in self.status_effects["slow"]) {
        if (isdefined(active_effect.unique_id) && var_3f84102752151e7c == active_effect.unique_id) {
            return true;
        }
    }
    return false;
}

// Namespace effect_slow / namespace_5e5b12854e72824d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x640
// Size: 0xda
function function_47062c0baf4e14bf(player, var_3f84102752151e7c) {
    /#
        assertex(isstring(var_3f84102752151e7c), "String required for str_slowType");
    #/
    if (!function_8ce7894f1a52fb77("slow")) {
        return false;
    }
    foreach (active_effect in self.status_effects["slow"]) {
        if (isdefined(active_effect.unique_id) && var_3f84102752151e7c == active_effect.unique_id && isdefined(player) && isdefined(self.var_d76f87abeca1eaa3[var_3f84102752151e7c].var_d4739501723a457c)) {
            return (active_effect.var_d4739501723a457c == player);
        }
    }
    return false;
}

