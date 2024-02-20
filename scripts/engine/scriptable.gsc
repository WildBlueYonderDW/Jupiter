// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace scriptable;

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86
// Size: 0x3c
function scriptable_setinitcallback(var_dad9b8459425c9d8) {
    if (!isdefined(level.scriptable_init)) {
        level.scriptable_init = [];
    }
    level.scriptable_init = array_add(level.scriptable_init, var_dad9b8459425c9d8);
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9
// Size: 0x61
function scriptable_engineinitialize() {
    if (isdefined(level.scriptable_init)) {
        foreach (init_func in level.scriptable_init) {
            [[ init_func ]]();
        }
    }
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x131
// Size: 0x3c
function scriptable_addpostinitcallback(callback) {
    if (!isdefined(level.scriptable_postinit)) {
        level.scriptable_postinit = [];
    }
    level.scriptable_postinit = array_add(level.scriptable_postinit, callback);
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174
// Size: 0x61
function scriptable_enginepostinitialize() {
    if (isdefined(level.scriptable_postinit)) {
        foreach (func in level.scriptable_postinit) {
            [[ func ]]();
        }
    }
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc
// Size: 0x3c
function scriptable_addusedcallback(usedcallback) {
    if (!isdefined(level.scriptable_used_funcs)) {
        level.scriptable_used_funcs = [];
    }
    level.scriptable_used_funcs = array_add(level.scriptable_used_funcs, usedcallback);
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f
// Size: 0x61
function scriptable_addusedcallbackbypart(part, usedcallback) {
    if (!isdefined(level.scriptable_used_by_part_funcs)) {
        level.scriptable_used_by_part_funcs = [];
    }
    if (!isdefined(level.scriptable_used_by_part_funcs[part])) {
        level.scriptable_used_by_part_funcs[part] = [];
    }
    level.scriptable_used_by_part_funcs[part][level.scriptable_used_by_part_funcs[part].size] = usedcallback;
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x287
// Size: 0x3c
function scriptable_addautousecallback(usecallback) {
    if (!isdefined(level.scriptable_autouse_funcs)) {
        level.scriptable_autouse_funcs = [];
    }
    level.scriptable_autouse_funcs = array_add(level.scriptable_autouse_funcs, usecallback);
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ca
// Size: 0x17f
function scriptable_engineused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (istrue(var_a5b2c541413aa895)) {
        if (isdefined(level.scriptable_autouse_funcs)) {
            foreach (var_58f77e58a4ec14cb in level.scriptable_autouse_funcs) {
                [[ var_58f77e58a4ec14cb ]](instance, part, state, player, 1, var_cc38472e36be1b61);
            }
        }
    } else {
        if (isdefined(level.scriptable_used_funcs)) {
            foreach (var_58f77e58a4ec14cb in level.scriptable_used_funcs) {
                [[ var_58f77e58a4ec14cb ]](instance, part, state, player, 0, var_cc38472e36be1b61);
            }
        }
        if (isdefined(level.scriptable_used_by_part_funcs) && isdefined(level.scriptable_used_by_part_funcs[part])) {
            foreach (var_58f77e58a4ec14cb in level.scriptable_used_by_part_funcs[part]) {
                [[ var_58f77e58a4ec14cb ]](instance, part, state, player, 1, var_cc38472e36be1b61);
            }
        }
    }
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x450
// Size: 0x105
function function_2cdeacfad7141a8d(instance, part, state, player, useduration) {
    if (isdefined(level.var_b80c82a60480a43c)) {
        foreach (func in level.var_b80c82a60480a43c) {
            [[ func ]](instance, part, state, player, useduration);
        }
    }
    if (isdefined(level.var_5aa42233dc7bddcc) && isdefined(level.var_5aa42233dc7bddcc[part])) {
        foreach (func in level.var_5aa42233dc7bddcc[part]) {
            [[ func ]](instance, part, state, player, useduration);
        }
    }
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x55c
// Size: 0x65
function function_9a0a13a69553c5a5(part, usedcallback) {
    if (!isdefined(level.var_5aa42233dc7bddcc)) {
        level.var_5aa42233dc7bddcc = [];
    }
    if (!isdefined(level.var_5aa42233dc7bddcc[part])) {
        level.var_5aa42233dc7bddcc[part] = [];
    }
    level.var_5aa42233dc7bddcc[part] = array_add(level.var_5aa42233dc7bddcc[part], usedcallback);
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c8
// Size: 0x3c
function function_8daea885ec058271(callback) {
    if (!isdefined(level.var_b80c82a60480a43c)) {
        level.var_b80c82a60480a43c = [];
    }
    level.var_b80c82a60480a43c = array_add(level.var_b80c82a60480a43c, callback);
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60b
// Size: 0x3d
function function_43f2de646836802d(instance, player) {
    result = 0;
    if (isdefined(level.var_b8e67f48a1d47883)) {
        result = [[ level.var_b8e67f48a1d47883 ]](instance, player);
    }
    return result;
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x650
// Size: 0x3c
function scriptable_addtouchedcallback(var_702aae5d8ebc0626) {
    if (!isdefined(level.scriptable_touched_funcs)) {
        level.scriptable_touched_funcs = [];
    }
    level.scriptable_touched_funcs = array_add(level.scriptable_touched_funcs, var_702aae5d8ebc0626);
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x693
// Size: 0x87
function scriptable_enginetouched(instance, part, state, player) {
    if (isdefined(level.scriptable_touched_funcs)) {
        foreach (var_4ce7b25e56e36048 in level.scriptable_touched_funcs) {
            [[ var_4ce7b25e56e36048 ]](instance, part, state, player);
        }
    }
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x721
// Size: 0x3c
function scriptable_adddamagedcallback(var_5032486bbddb00d3) {
    if (!isdefined(level.scriptable_damaged_funcs)) {
        level.scriptable_damaged_funcs = [];
    }
    level.scriptable_damaged_funcs = array_add(level.scriptable_damaged_funcs, var_5032486bbddb00d3);
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params b, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x764
// Size: 0xcd
function scriptable_enginedamaged(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    if (isdefined(level.scriptable_damaged_funcs)) {
        foreach (var_58f77e58a4ec14cb in level.scriptable_damaged_funcs) {
            [[ var_58f77e58a4ec14cb ]](einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname);
        }
    }
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x838
// Size: 0x61
function scriptable_addnotifycallback(var_6bc01ec47bec43b2, func) {
    if (!isdefined(level.scriptable_notify_callback_funcs)) {
        level.scriptable_notify_callback_funcs = [];
    }
    if (!isdefined(level.scriptable_notify_callback_funcs[var_6bc01ec47bec43b2])) {
        level.scriptable_notify_callback_funcs[var_6bc01ec47bec43b2] = [];
    }
    level.scriptable_notify_callback_funcs[var_6bc01ec47bec43b2][level.scriptable_notify_callback_funcs[var_6bc01ec47bec43b2].size] = func;
}

// Namespace scriptable/namespace_17c25f0877bfb620
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a0
// Size: 0xd3
function scriptable_enginenotifycallback(instance, note, param, ent, var_535d9c3fdddab5a9) {
    var_6bc01ec47bec43b2 = note;
    if (!isdefined(level.scriptable_notify_callback_funcs)) {
        return;
    }
    var_fe7e82f6d37cda80 = level.scriptable_notify_callback_funcs[var_6bc01ec47bec43b2];
    if (!isdefined(var_fe7e82f6d37cda80) || var_fe7e82f6d37cda80.size == 0) {
        return;
    }
    foreach (func in var_fe7e82f6d37cda80) {
        if (isdefined(ent)) {
            ent [[ func ]](instance, note, param, var_535d9c3fdddab5a9);
        } else {
            level [[ func ]](instance, note, param, var_535d9c3fdddab5a9);
        }
    }
}

