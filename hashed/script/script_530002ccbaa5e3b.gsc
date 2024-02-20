// mwiii decomp prototype
#namespace namespace_9b9fbf828d53f353;

// Namespace namespace_9b9fbf828d53f353/namespace_4525f113583a8ae5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x86
// Size: 0x51
function function_54dfca3641c2c1ab(var_d8bfb2d96bc7f634) {
    if (!isdefined(level.var_87766fb0b0a03a87)) {
        level.var_87766fb0b0a03a87 = [];
    }
    var_1fc5e3c207dbb9f4 = function_113ae197e6c38cb8(var_d8bfb2d96bc7f634);
    if (!isdefined(var_1fc5e3c207dbb9f4)) {
        var_1fc5e3c207dbb9f4 = function_a22fc988697bb76d(var_d8bfb2d96bc7f634);
        if (var_1fc5e3c207dbb9f4) {
            function_b6d1131bbf38fd70(var_d8bfb2d96bc7f634, var_1fc5e3c207dbb9f4);
        }
    }
    return var_1fc5e3c207dbb9f4;
}

// Namespace namespace_9b9fbf828d53f353/namespace_4525f113583a8ae5
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xdf
// Size: 0x5c
function private function_b6d1131bbf38fd70(filename, var_1fc5e3c207dbb9f4) {
    if (var_1fc5e3c207dbb9f4) {
        var_dae5b56fef5253a7 = spawnstruct();
        var_dae5b56fef5253a7.id = filename;
        var_dae5b56fef5253a7.object = var_1fc5e3c207dbb9f4;
        level.var_87766fb0b0a03a87[level.var_87766fb0b0a03a87.size] = var_dae5b56fef5253a7;
        return 1;
    }
    return 0;
}

// Namespace namespace_9b9fbf828d53f353/namespace_4525f113583a8ae5
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x143
// Size: 0x76
function private function_113ae197e6c38cb8(var_9344c8c712054a49) {
    foreach (var_b643a4a42d8b8dbf in level.var_87766fb0b0a03a87) {
        if (var_b643a4a42d8b8dbf.id == var_9344c8c712054a49) {
            return var_b643a4a42d8b8dbf.object;
        }
    }
    return undefined;
}

// Namespace namespace_9b9fbf828d53f353/namespace_4525f113583a8ae5
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1c1
// Size: 0x86
function private function_a22fc988697bb76d(var_9344c8c712054a49) {
    while (istrue(level.var_6ff7b075bad15e1b)) {
        waitframe();
    }
    if (function_a5eda2d3293e9225(var_9344c8c712054a49)) {
        level.var_6ff7b075bad15e1b = 1;
        filename = "";
        var_1fc5e3c207dbb9f4 = undefined;
        var_bb9730f6ce13f387 = 0;
        while (filename != var_9344c8c712054a49) {
            filename = var_bb9730f6ce13f387 = level waittill("publisher_download_completed");
        }
        if (var_bb9730f6ce13f387) {
            var_1fc5e3c207dbb9f4 = function_e7f8033f0614eb44();
        }
        level.var_6ff7b075bad15e1b = 0;
        return var_1fc5e3c207dbb9f4;
    }
    return undefined;
}

