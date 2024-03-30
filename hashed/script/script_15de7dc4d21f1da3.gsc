// mwiii decomp prototype
#namespace namespace_ee5e52a75fbcf489;

// Namespace namespace_ee5e52a75fbcf489 / namespace_a2c409363d7f24e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6
// Size: 0x2d
function init() {
    if (!isdefined(level.var_170a29e0c0e257b7)) {
        level.var_170a29e0c0e257b7 = [];
        level.var_6d69e5fde1ae8e9e = [];
    }
    level thread function_5b1d60872d5f7d1f();
}

// Namespace namespace_ee5e52a75fbcf489 / namespace_a2c409363d7f24e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda
// Size: 0x2b
function function_5b1d60872d5f7d1f() {
    for (;;) {
        player = level waittill("connected");
        player thread function_6b1fcec8b1789d65();
        player thread function_df97371d5dcee28c();
    }
}

// Namespace namespace_ee5e52a75fbcf489 / namespace_a2c409363d7f24e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c
// Size: 0x39
function function_ba46cf958ae0cbda(callback) {
    if (!isdefined(level.var_170a29e0c0e257b7)) {
        level.var_170a29e0c0e257b7 = [];
    }
    level.var_170a29e0c0e257b7[level.var_170a29e0c0e257b7.size] = callback;
}

// Namespace namespace_ee5e52a75fbcf489 / namespace_a2c409363d7f24e7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14c
// Size: 0x7b
function function_7f4116eba8c42fa0(weapondropcallback) {
    temparray = [];
    foreach (callback in level.var_170a29e0c0e257b7) {
        if (weapondropcallback != callback) {
            temparray[temparray.size] = callback;
        }
    }
    level.var_170a29e0c0e257b7 = temparray;
}

// Namespace namespace_ee5e52a75fbcf489 / namespace_a2c409363d7f24e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ce
// Size: 0x39
function function_39027364b9c16127(callback) {
    if (!isdefined(level.var_6d69e5fde1ae8e9e)) {
        level.var_6d69e5fde1ae8e9e = [];
    }
    level.var_6d69e5fde1ae8e9e[level.var_6d69e5fde1ae8e9e.size] = callback;
}

// Namespace namespace_ee5e52a75fbcf489 / namespace_a2c409363d7f24e7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20e
// Size: 0x7b
function function_e7aae5b770c4747b(var_2d2deddadd177b34) {
    temparray = [];
    foreach (callback in level.var_6d69e5fde1ae8e9e) {
        if (var_2d2deddadd177b34 != callback) {
            temparray[temparray.size] = callback;
        }
    }
    level.var_6d69e5fde1ae8e9e = temparray;
}

// Namespace namespace_ee5e52a75fbcf489 / namespace_a2c409363d7f24e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x290
// Size: 0x7f
function function_6b1fcec8b1789d65() {
    self endon("disconnect");
    for (;;) {
        droppedentity, weaponobject = self waittill("weapon_dropped");
        foreach (callback in level.var_170a29e0c0e257b7) {
            self [[ callback ]](droppedentity, weaponobject);
        }
    }
}

// Namespace namespace_ee5e52a75fbcf489 / namespace_a2c409363d7f24e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x316
// Size: 0x8b
function function_df97371d5dcee28c() {
    self endon("disconnect");
    for (;;) {
        droppedweapon, secondparam, soundposition = self waittill("dropped_weapon_scriptable");
        foreach (callback in level.var_6d69e5fde1ae8e9e) {
            self [[ callback ]](droppedweapon, secondparam, soundposition);
        }
    }
}

