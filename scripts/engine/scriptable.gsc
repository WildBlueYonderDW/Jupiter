// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace scriptable;

// Namespace scriptable / scripts/engine/scriptable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86
// Size: 0x3c
function scriptable_setinitcallback(initcallback) {
    if (!isdefined(level.scriptable_init)) {
        level.scriptable_init = [];
    }
    level.scriptable_init = array_add(level.scriptable_init, initcallback);
}

// Namespace scriptable / scripts/engine/scriptable
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

// Namespace scriptable / scripts/engine/scriptable
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x131
// Size: 0x3c
function scriptable_addpostinitcallback(callback) {
    if (!isdefined(level.scriptable_postinit)) {
        level.scriptable_postinit = [];
    }
    level.scriptable_postinit = array_add(level.scriptable_postinit, callback);
}

// Namespace scriptable / scripts/engine/scriptable
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

// Namespace scriptable / scripts/engine/scriptable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc
// Size: 0x3c
function scriptable_addusedcallback(usedcallback) {
    if (!isdefined(level.scriptable_used_funcs)) {
        level.scriptable_used_funcs = [];
    }
    level.scriptable_used_funcs = array_add(level.scriptable_used_funcs, usedcallback);
}

// Namespace scriptable / scripts/engine/scriptable
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

// Namespace scriptable / scripts/engine/scriptable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x287
// Size: 0x3c
function scriptable_addautousecallback(usecallback) {
    if (!isdefined(level.scriptable_autouse_funcs)) {
        level.scriptable_autouse_funcs = [];
    }
    level.scriptable_autouse_funcs = array_add(level.scriptable_autouse_funcs, usecallback);
}

// Namespace scriptable / scripts/engine/scriptable
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ca
// Size: 0x17f
function scriptable_engineused(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (istrue(var_a5b2c541413aa895)) {
        if (isdefined(level.scriptable_autouse_funcs)) {
            foreach (used_func in level.scriptable_autouse_funcs) {
                [[ used_func ]](instance, part, state, player, 1, usestring);
            }
        }
        return;
    }
    if (isdefined(level.scriptable_used_funcs)) {
        foreach (used_func in level.scriptable_used_funcs) {
            [[ used_func ]](instance, part, state, player, 0, usestring);
        }
    }
    if (isdefined(level.scriptable_used_by_part_funcs) && isdefined(level.scriptable_used_by_part_funcs[part])) {
        foreach (used_func in level.scriptable_used_by_part_funcs[part]) {
            [[ used_func ]](instance, part, state, player, 1, usestring);
        }
    }
}

// Namespace scriptable / scripts/engine/scriptable
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

// Namespace scriptable / scripts/engine/scriptable
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

// Namespace scriptable / scripts/engine/scriptable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c8
// Size: 0x3c
function function_8daea885ec058271(callback) {
    if (!isdefined(level.var_b80c82a60480a43c)) {
        level.var_b80c82a60480a43c = [];
    }
    level.var_b80c82a60480a43c = array_add(level.var_b80c82a60480a43c, callback);
}

// Namespace scriptable / scripts/engine/scriptable
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

// Namespace scriptable / scripts/engine/scriptable
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x650
// Size: 0x3c
function scriptable_addtouchedcallback(touchedcallback) {
    if (!isdefined(level.scriptable_touched_funcs)) {
        level.scriptable_touched_funcs = [];
    }
    level.scriptable_touched_funcs = array_add(level.scriptable_touched_funcs, touchedcallback);
}

// Namespace scriptable / scripts/engine/scriptable
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x693
// Size: 0x87
function scriptable_enginetouched(instance, part, state, player) {
    if (isdefined(level.scriptable_touched_funcs)) {
        foreach (touched_func in level.scriptable_touched_funcs) {
            [[ touched_func ]](instance, part, state, player);
        }
    }
}

// Namespace scriptable / scripts/engine/scriptable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x721
// Size: 0x3c
function scriptable_adddamagedcallback(damagedcallback) {
    if (!isdefined(level.scriptable_damaged_funcs)) {
        level.scriptable_damaged_funcs = [];
    }
    level.scriptable_damaged_funcs = array_add(level.scriptable_damaged_funcs, damagedcallback);
}

// Namespace scriptable / scripts/engine/scriptable
// Params b, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x764
// Size: 0xcd
function scriptable_enginedamaged(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    if (isdefined(level.scriptable_damaged_funcs)) {
        foreach (used_func in level.scriptable_damaged_funcs) {
            [[ used_func ]](einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname);
        }
    }
}

// Namespace scriptable / scripts/engine/scriptable
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x838
// Size: 0x61
function scriptable_addnotifycallback(funckey, func) {
    if (!isdefined(level.scriptable_notify_callback_funcs)) {
        level.scriptable_notify_callback_funcs = [];
    }
    if (!isdefined(level.scriptable_notify_callback_funcs[funckey])) {
        level.scriptable_notify_callback_funcs[funckey] = [];
    }
    level.scriptable_notify_callback_funcs[funckey][level.scriptable_notify_callback_funcs[funckey].size] = func;
}

// Namespace scriptable / scripts/engine/scriptable
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a0
// Size: 0xd3
function scriptable_enginenotifycallback(instance, note, param, ent, var_535d9c3fdddab5a9) {
    funckey = note;
    if (!isdefined(level.scriptable_notify_callback_funcs)) {
        return;
    }
    funcarray = level.scriptable_notify_callback_funcs[funckey];
    if (!isdefined(funcarray) || funcarray.size == 0) {
        return;
    }
    foreach (func in funcarray) {
        if (isdefined(ent)) {
            ent [[ func ]](instance, note, param, var_535d9c3fdddab5a9);
            continue;
        }
        level [[ func ]](instance, note, param, var_535d9c3fdddab5a9);
    }
}

