// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace interactive;

// Namespace interactive/namespace_ad136f1d5091df4a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70
// Size: 0x67
function entity_used(entity, player) {
    if (!isdefined(entity.interactive_used_func_id)) {
        return;
    }
    if (!isdefined(level.interactive_used_funcs)) {
        return;
    }
    if (!isdefined(level.interactive_used_funcs[entity.interactive_used_func_id])) {
        return;
    }
    thread [[ level.interactive_used_funcs[entity.interactive_used_func_id] ]](entity, player);
}

// Namespace interactive/namespace_ad136f1d5091df4a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde
// Size: 0x81
function interactive_addusedcallback(usedcallback, id) {
    if (!isdefined(level.interactive_used_funcs)) {
        level.interactive_used_funcs = [];
        level.interactive_used_funcs_unique_id = 0;
    }
    if (!isdefined(id)) {
        while (isdefined(level.interactive_used_funcs[level.interactive_used_funcs_unique_id])) {
            level.interactive_used_funcs_unique_id++;
        }
        id = level.interactive_used_funcs_unique_id;
        level.interactive_used_funcs_unique_id++;
    }
    level.interactive_used_funcs[id] = usedcallback;
    return id;
}

// Namespace interactive/namespace_ad136f1d5091df4a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x167
// Size: 0x16
function interactive_addusedcallbacktoentity(id) {
    self.interactive_used_func_id = id;
}

// Namespace interactive/namespace_ad136f1d5091df4a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184
// Size: 0xd
function interactive_removeusedcallbackfromentity() {
    self.interactive_used_func_id = undefined;
}

// Namespace interactive/namespace_ad136f1d5091df4a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x198
// Size: 0x6f
function function_366418be14db1a9f(usable, player) {
    if (isdefined(usable.var_d19dfa5205fce031)) {
        result = [[ usable.var_d19dfa5205fce031 ]](usable, player);
        /#
            assert(isstruct(result) && isdefined(result.type) && isdefined(result.string));
        #/
        return result;
    }
    return undefined;
}

// Namespace interactive/namespace_ad136f1d5091df4a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20f
// Size: 0x41
function function_14ec0a1f46d4d2d0(usable, player) {
    if (isdefined(usable.var_ee69e6a611184cfb)) {
        result = [[ usable.var_ee69e6a611184cfb ]](usable, player);
        return result;
    }
    return 1;
}

