// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_e59f070a7a8a4fcd;

// Namespace namespace_e59f070a7a8a4fcd/namespace_25db8a825b1053d8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x82
// Size: 0x15
function function_3e05580ca5606e0e(params) {
    return params[randomint(params.size)];
}

// Namespace namespace_e59f070a7a8a4fcd/namespace_25db8a825b1053d8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9f
// Size: 0x5d
function function_d111906fa4da345c(params) {
    result = [];
    for (i = 0; i < params.size; i++) {
        param = params[i];
        if (isarray(param)) {
            result = result array_combine(result, param);
        } else {
            result[result.size] = param;
        }
    }
    return result;
}

// Namespace namespace_e59f070a7a8a4fcd/namespace_25db8a825b1053d8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x104
// Size: 0x6d
function function_c7dcf35d43da192b(names) {
    entities = [];
    foreach (i, name in names) {
        entities[i] = getent(name, "script_noteworthy");
    }
    return entities;
}

