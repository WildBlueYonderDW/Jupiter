// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_5a4a5d9ba343ff8f;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;

#namespace namespace_9a07c125349f17e8;

// Namespace namespace_9a07c125349f17e8/namespace_5e5b12854e72824d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed
// Size: 0x117
function slow(var_3f84102752151e7c, var_561c4006f65fb505, var_4de2d203c7e8298b, var_d4739501723a457c, var_9ce58a7f855aba29, var_9142743ed938c8bb) {
    /#
        assertex(isstring(var_3f84102752151e7c), "String required for str_slowType");
    #/
    /#
        assertex(isnumber(var_561c4006f65fb505), "Number required for n_slowRate");
    #/
    /#
        assertex(isnumber(var_4de2d203c7e8298b), "Number required for n_durationS");
    #/
    if (!istrue(var_9142743ed938c8bb)) {
        if (!isdefined(self.aisettings) || !istrue(self.aisettings.var_c9cbc4a3332e44c6)) {
            return 0;
        }
    }
    if (namespace_28edc79fcf2fe234::bb_isanimscripted()) {
        return 0;
    }
    if (!function_8ce7894f1a52fb77("slow")) {
        self.var_8ad91e7d5175af88 = namespace_bf5a1761a8d1bb07::asm_getmoveplaybackrate();
    }
    effect = function_108973a907c11ca7("slow", var_4de2d203c7e8298b, var_3f84102752151e7c, &function_fbe23145b4b96981, &function_ebd60ecd5cf8b74a);
    effect.var_d4739501723a457c = var_d4739501723a457c;
    effect.rate = var_561c4006f65fb505;
    effect.var_21081d0182cdd254 = var_9ce58a7f855aba29;
    return start_effect(effect);
}

// Namespace namespace_9a07c125349f17e8/namespace_5e5b12854e72824d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20c
// Size: 0xe4
function private function_fbe23145b4b96981(effect) {
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

// Namespace namespace_9a07c125349f17e8/namespace_5e5b12854e72824d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f7
// Size: 0x103
function private function_ebd60ecd5cf8b74a(effect) {
    current_time = gettime();
    var_4730143ff75c696e = function_53c4c53197386572(self.var_8ad91e7d5175af88, 1);
    foreach (var_e73c0944e76fac9d in self.status_effects["slow"]) {
        if (isdefined(var_e73c0944e76fac9d.unique_id) && effect.unique_id == var_e73c0944e76fac9d.unique_id) {
            return;
        }
        if (effect.rate < var_4730143ff75c696e && effect.end_time > current_time) {
            var_4730143ff75c696e = effect;
        }
    }
    function_3d9c0570527484dd(var_4730143ff75c696e);
    if (isdefined(effect.var_21081d0182cdd254)) {
        self [[ effect.var_21081d0182cdd254 ]]();
    }
}

// Namespace namespace_9a07c125349f17e8/namespace_5e5b12854e72824d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x401
// Size: 0x60
function private function_3d9c0570527484dd(var_41e050c00dbd88ee) {
    if (!isagent(self)) {
        return;
    }
    if (namespace_bf5a1761a8d1bb07::function_4bb232c0fca955f6() == var_41e050c00dbd88ee) {
        return;
    }
    namespace_bf5a1761a8d1bb07::function_8d1655ae223d862a(var_41e050c00dbd88ee);
    if (!istrue(self.is_traversing) && !istrue(self.var_3ee7fe87f9d81ac7) && gettime() > self.birthtime) {
        function_6e9cb6cd0535fe65();
    }
}

// Namespace namespace_9a07c125349f17e8/namespace_5e5b12854e72824d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x468
// Size: 0xa1
function stop_slow(var_3f84102752151e7c) {
    /#
        assertex(isstring(var_3f84102752151e7c), "String required for str_slowType");
    #/
    foreach (var_e73c0944e76fac9d in self.status_effects["slow"]) {
        if (isdefined(var_e73c0944e76fac9d.unique_id) && var_3f84102752151e7c == var_e73c0944e76fac9d.unique_id) {
            var_e73c0944e76fac9d.end_time = -1;
        }
    }
}

// Namespace namespace_9a07c125349f17e8/namespace_5e5b12854e72824d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x510
// Size: 0x64
function function_778c51b997394ed8() {
    foreach (var_e73c0944e76fac9d in self.status_effects["slow"]) {
        var_e73c0944e76fac9d.end_time = -1;
    }
}

// Namespace namespace_9a07c125349f17e8/namespace_5e5b12854e72824d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57b
// Size: 0xe
function function_75f764da6c0d418a() {
    return function_8ce7894f1a52fb77("slow");
}

// Namespace namespace_9a07c125349f17e8/namespace_5e5b12854e72824d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x591
// Size: 0xa7
function function_c0111492d9bfc56d(var_3f84102752151e7c) {
    /#
        assertex(isstring(var_3f84102752151e7c), "String required for str_slowType");
    #/
    if (!function_8ce7894f1a52fb77("slow")) {
        return 0;
    }
    foreach (var_e73c0944e76fac9d in self.status_effects["slow"]) {
        if (isdefined(var_e73c0944e76fac9d.unique_id) && var_3f84102752151e7c == var_e73c0944e76fac9d.unique_id) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_9a07c125349f17e8/namespace_5e5b12854e72824d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x640
// Size: 0xda
function function_47062c0baf4e14bf(player, var_3f84102752151e7c) {
    /#
        assertex(isstring(var_3f84102752151e7c), "String required for str_slowType");
    #/
    if (!function_8ce7894f1a52fb77("slow")) {
        return 0;
    }
    foreach (var_e73c0944e76fac9d in self.status_effects["slow"]) {
        if (isdefined(var_e73c0944e76fac9d.unique_id) && var_3f84102752151e7c == var_e73c0944e76fac9d.unique_id && isdefined(player) && isdefined(self.var_d76f87abeca1eaa3[var_3f84102752151e7c].var_d4739501723a457c)) {
            return (var_e73c0944e76fac9d.var_d4739501723a457c == player);
        }
    }
    return 0;
}

