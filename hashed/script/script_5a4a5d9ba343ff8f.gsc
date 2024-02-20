// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;

#namespace status_effects;

// Namespace status_effects/namespace_c56b0b75fd51eab1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b
// Size: 0xf
function function_e82e8aa41de42513() {
    /#
        level thread function_a29b12dda2453832();
    #/
}

// Namespace status_effects/namespace_c56b0b75fd51eab1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1
// Size: 0x38
function function_8ce7894f1a52fb77(var_ad6fa7af5ed7c23d) {
    return isdefined(self.status_effects) && isdefined(self.status_effects[var_ad6fa7af5ed7c23d]) && self.status_effects[var_ad6fa7af5ed7c23d].size > 0;
}

// Namespace status_effects/namespace_c56b0b75fd51eab1
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1
// Size: 0xa1
function function_108973a907c11ca7(var_ad6fa7af5ed7c23d, durations, unique_id, start_func, end_func) {
    var_c0af8588fcc88050 = spawnstruct();
    var_c0af8588fcc88050.var_ad6fa7af5ed7c23d = var_ad6fa7af5ed7c23d;
    var_c0af8588fcc88050.unique_id = unique_id;
    var_c0af8588fcc88050.durations = durations;
    var_c0af8588fcc88050.start_func = start_func;
    var_c0af8588fcc88050.end_func = end_func;
    var_c0af8588fcc88050.end_time = gettime() + function_a5b14435e3229bed(var_c0af8588fcc88050.durations);
    return var_c0af8588fcc88050;
}

// Namespace status_effects/namespace_c56b0b75fd51eab1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a
// Size: 0x152
function start_effect(effect) {
    self.status_effects = function_53c4c53197386572(self.status_effects, []);
    self.status_effects[effect.var_ad6fa7af5ed7c23d] = function_53c4c53197386572(self.status_effects[effect.var_ad6fa7af5ed7c23d], []);
    if (isdefined(effect.unique_id)) {
        foreach (var_e73c0944e76fac9d in self.status_effects[effect.var_ad6fa7af5ed7c23d]) {
            if (isdefined(var_e73c0944e76fac9d.unique_id) && effect.unique_id == var_e73c0944e76fac9d.unique_id) {
                var_e73c0944e76fac9d.end_time = -1;
            }
        }
    }
    self.status_effects[effect.var_ad6fa7af5ed7c23d] = array_add(self.status_effects[effect.var_ad6fa7af5ed7c23d], effect);
    if (isdefined(effect.start_func)) {
        self [[ effect.start_func ]](effect);
    }
    thread function_6ce497fffc21bd1c();
    return 1;
}

// Namespace status_effects/namespace_c56b0b75fd51eab1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f4
// Size: 0x198
function private function_6ce497fffc21bd1c() {
    self notify("start_status_effects_monitor");
    self endon("start_status_effects_monitor");
    self endon("death");
    if (!isdefined(self.status_effects)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    var_38390394bac2df06 = self.status_effects.size;
    while (var_38390394bac2df06 > 0) {
        now = gettime();
        var_adf142bd0124af2f = [];
        foreach (var_ad6fa7af5ed7c23d, effects in self.status_effects) {
            var_f8b55088fa994f6a = [];
            foreach (effect in effects) {
                if (now < effect.end_time) {
                    var_f8b55088fa994f6a = array_add(var_f8b55088fa994f6a, effect);
                } else {
                    var_adf142bd0124af2f = array_add(var_adf142bd0124af2f, effect);
                }
            }
            self.status_effects[var_ad6fa7af5ed7c23d] = var_f8b55088fa994f6a;
        }
        foreach (effect in var_adf142bd0124af2f) {
            end_effect(effect);
        }
        var_38390394bac2df06 = self.status_effects.size;
        waitframe();
    }
}

// Namespace status_effects/namespace_c56b0b75fd51eab1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x493
// Size: 0x2b
function private end_effect(effect) {
    if (isdefined(effect.end_func)) {
        self [[ effect.end_func ]](effect);
    }
}

// Namespace status_effects/namespace_c56b0b75fd51eab1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4c5
// Size: 0x22b
function private function_a29b12dda2453832() {
    /#
        level endon("<unknown string>");
        while (1) {
            entity_num = getdvarint(@"hash_f429fe6098c1896a", -1);
            entity = getentbynum(entity_num);
            if (isdefined(entity)) {
                now = gettime();
                var_9e6265311a12073 = 400;
                var_9e6255311a11e40 = 300;
                printtoscreen2d(var_9e6265311a12073, var_9e6255311a11e40, "<unknown string>");
                if (isdefined(entity.status_effects)) {
                    foreach (var_ad6fa7af5ed7c23d, effects in entity.status_effects) {
                        if (effects.size == 0) {
                            continue;
                        }
                        var_92e8f89f0e8b1bcb = [];
                        var_8523031a78c3d7af = 0;
                        foreach (effect in effects) {
                            var_67e76145ecffd7cb = effect.end_time - now;
                            if (var_67e76145ecffd7cb > var_8523031a78c3d7af) {
                                var_8523031a78c3d7af = var_67e76145ecffd7cb;
                            }
                            if (isdefined(effect.unique_id)) {
                                var_92e8f89f0e8b1bcb = function_6d6af8144a5131f1(var_92e8f89f0e8b1bcb, effect.unique_id);
                            }
                        }
                        var_9e6255311a11e40 = var_9e6255311a11e40 + 20;
                        var_72d6d5843877426 = var_ad6fa7af5ed7c23d + "<unknown string>" + effects.size + "<unknown string>" + function_c89ed1840c8d0f0f(var_8523031a78c3d7af) + "<unknown string>";
                        printtoscreen2d(var_9e6265311a12073, var_9e6255311a11e40, var_72d6d5843877426);
                        foreach (id in var_92e8f89f0e8b1bcb) {
                            var_9e6255311a11e40 = var_9e6255311a11e40 + 20;
                            printtoscreen2d(var_9e6265311a12073 + 10, var_9e6255311a11e40, id);
                        }
                    }
                }
            }
            waitframe();
        }
    #/
}

