// mwiii decomp prototype
#namespace namespace_7c5bb630aad381e;

// Namespace namespace_7c5bb630aad381e/namespace_241b4ec6ed92abdd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x147
// Size: 0xe1
function function_200bd098377a8674(var_335fed1e2375ffb0, var_449da622a6fe97bd, var_9137b8627fdf4cc8) {
    if (!isdefined(level.var_c51387d07af317b7)) {
        level.var_c51387d07af317b7 = [];
    }
    /#
        assertex(!isdefined(level.var_c51387d07af317b7[var_335fed1e2375ffb0]), "scriptable group with id [" + var_335fed1e2375ffb0 + "] has already been initialized");
    #/
    group = spawnstruct();
    group.scriptables = [];
    group.var_ee94b5848a8f3159 = 0;
    group.var_7680c3dc0438706e = 0;
    group.max_count = var_449da622a6fe97bd;
    group.var_35b0b2e8bee60af4 = var_9137b8627fdf4cc8;
    /#
        assertex(group.var_35b0b2e8bee60af4 < group.max_count, "scriptable group with id [" + var_335fed1e2375ffb0 + "] has a larger group_cleanup_batch_size than group_size_max which is not allowed");
    #/
    level.var_c51387d07af317b7[var_335fed1e2375ffb0] = group;
}

// Namespace namespace_7c5bb630aad381e/namespace_241b4ec6ed92abdd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22f
// Size: 0x4c
function function_f8ecd6e02634e682(var_335fed1e2375ffb0) {
    if (isdefined(level.var_c51387d07af317b7) && isdefined(level.var_c51387d07af317b7[var_335fed1e2375ffb0])) {
        group = level.var_c51387d07af317b7[var_335fed1e2375ffb0];
        return group.scriptables;
    }
    return undefined;
}

// Namespace namespace_7c5bb630aad381e/namespace_241b4ec6ed92abdd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x283
// Size: 0xa3
function function_476b3beecd82dcca(var_335fed1e2375ffb0, instance) {
    if (!isdefined(level.var_c51387d07af317b7) || !isdefined(level.var_c51387d07af317b7[var_335fed1e2375ffb0])) {
        /#
            assertmsg("no scriptable group exists with id [" + var_335fed1e2375ffb0 + "]. Did you call init_scriptable_group()?");
        #/
        return;
    }
    group = level.var_c51387d07af317b7[var_335fed1e2375ffb0];
    function_3e036cf2bd9bf933(group);
    instance.var_4a0145502132790a = group.var_7680c3dc0438706e;
    group.scriptables[instance.var_4a0145502132790a] = instance;
    group.var_7680c3dc0438706e++;
}

// Namespace namespace_7c5bb630aad381e/namespace_241b4ec6ed92abdd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32d
// Size: 0x72
function function_879ccb6a53e634f5(var_335fed1e2375ffb0, instance) {
    if (!isdefined(level.var_c51387d07af317b7[var_335fed1e2375ffb0])) {
        /#
            assertmsg("no scriptable group exists with id [" + var_335fed1e2375ffb0 + "]. Did you call init_scriptable_group()?");
        #/
        return;
    }
    group = level.var_c51387d07af317b7[var_335fed1e2375ffb0];
    group.scriptables[instance.var_4a0145502132790a] = undefined;
    instance.var_4a0145502132790a = undefined;
}

// Namespace namespace_7c5bb630aad381e/namespace_241b4ec6ed92abdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a6
// Size: 0xce
function private function_3e036cf2bd9bf933(group) {
    if (group.scriptables.size < group.max_count) {
        return;
    }
    var_d89dfb4bd556862a = 0;
    for (id = group.var_ee94b5848a8f3159; id < group.var_7680c3dc0438706e; id++) {
        if (var_d89dfb4bd556862a == group.var_35b0b2e8bee60af4) {
            break;
        }
        instance = group.scriptables[id];
        if (isdefined(instance)) {
            if (isent(instance)) {
                instance delete();
            } else {
                instance notify("death");
                instance freescriptable();
            }
            var_d89dfb4bd556862a++;
        }
        group.scriptables[id] = undefined;
        group.var_ee94b5848a8f3159++;
    }
}

