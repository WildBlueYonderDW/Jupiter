#using scripts\engine\utility.gsc;

#namespace namespace_f13e1c376c4ed4d6;

// Namespace namespace_f13e1c376c4ed4d6 / namespace_919696d9beeafbce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd6
// Size: 0x7f
function function_efafec9a80234daa(var_fdf147e36d51ad1b) {
    if (!isdefined(level.var_2d50d527b0001797)) {
        level.var_2d50d527b0001797 = [];
    }
    if (!isdefined(level.var_2d50d527b0001797[var_fdf147e36d51ad1b])) {
        var_ae6302f7f057e26f = getscriptbundle("dtanimtemplate:" + var_fdf147e36d51ad1b);
        assertex(isdefined(var_ae6302f7f057e26f), "ERROR: Attempting to use undefined dialog tree animation template: " + var_fdf147e36d51ad1b);
        level.var_2d50d527b0001797[var_fdf147e36d51ad1b] = var_ae6302f7f057e26f;
        level.var_2d50d527b0001797[var_fdf147e36d51ad1b].var_cf16dd7d69d82879 = -1;
    }
}

// Namespace namespace_f13e1c376c4ed4d6 / namespace_919696d9beeafbce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15d
// Size: 0x8c
function function_1d41e14159f8de35(var_fdf147e36d51ad1b, var_1a38b75e63708470) {
    if (isdefined(var_fdf147e36d51ad1b)) {
        template = level.var_2d50d527b0001797[var_fdf147e36d51ad1b];
        foreach (pos in template.player_positions) {
            if (pos.name == var_1a38b75e63708470) {
                return pos;
            }
        }
    }
    return undefined;
}

// Namespace namespace_f13e1c376c4ed4d6 / namespace_919696d9beeafbce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f2
// Size: 0x108
function function_7dc5dc6ca7fc72c4(var_fdf147e36d51ad1b, feature) {
    if (isdefined(var_fdf147e36d51ad1b)) {
        template = level.var_2d50d527b0001797[var_fdf147e36d51ad1b];
        if (isdefined(template)) {
            switch (feature) {
            case #"hash_1c39674e5b0de0f3":
                if (isdefined(template.var_a169c76164480381) && template.var_a169c76164480381.size > 0) {
                    return template function_ee798af1fbe1bf55(template.var_a169c76164480381);
                } else {
                    return template function_ee798af1fbe1bf55(template.var_1ed047e294633c0e);
                }
            case #"hash_228e2e6b4608a098":
                if (isdefined(template.var_1ed047e294633c0e) && template.var_1ed047e294633c0e.size > 0) {
                    return template function_ee798af1fbe1bf55(template.var_1ed047e294633c0e);
                } else {
                    return template function_ee798af1fbe1bf55(template.var_a169c76164480381);
                }
            case #"hash_143efe6e1538f5af":
                return template function_ee798af1fbe1bf55(template.var_a5c6a348df337747);
            }
        }
    }
    return undefined;
}

// Namespace namespace_f13e1c376c4ed4d6 / namespace_919696d9beeafbce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x303
// Size: 0x38
function function_d66c0bfe054fd887(var_fdf147e36d51ad1b) {
    if (isdefined(var_fdf147e36d51ad1b)) {
        template = level.var_2d50d527b0001797[var_fdf147e36d51ad1b];
        if (isdefined(template)) {
            return template.scene;
        }
    }
    return undefined;
}

// Namespace namespace_f13e1c376c4ed4d6 / namespace_919696d9beeafbce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x344
// Size: 0x8c
function function_ee798af1fbe1bf55(var_679454d2f4a9a7e4) {
    if (isdefined(var_679454d2f4a9a7e4) && isarray(var_679454d2f4a9a7e4) && var_679454d2f4a9a7e4.size > 0) {
        if (var_679454d2f4a9a7e4.size > 1) {
            r = randomint(var_679454d2f4a9a7e4.size);
            if (r == self.var_cf16dd7d69d82879) {
                r = ter_op(r >= var_679454d2f4a9a7e4.size - 1, 0, r + 1);
            }
            self.var_cf16dd7d69d82879 = r;
            return var_679454d2f4a9a7e4[r].shot;
        } else {
            return var_679454d2f4a9a7e4[0].shot;
        }
        return;
    }
    return undefined;
}

