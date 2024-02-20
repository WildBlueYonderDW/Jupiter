// mwiii decomp prototype
#namespace namespace_a51e05c6a6f8c5b2;

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e
// Size: 0x27
function player_standing_on_train() {
    var_eb0bf8d1503bbb00 = self getmovingplatformparent();
    if (isdefined(var_eb0bf8d1503bbb00)) {
        if (is_train_ent(var_eb0bf8d1503bbb00)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d
// Size: 0x3e
function function_d6b0a591ac99bd() {
    if (isdefined(level.wztrain_info) && isdefined(level.wztrain_info.train_array)) {
        return level.wztrain_info.train_array[0];
    }
}

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x182
// Size: 0xa8
function is_train_ent(hitent) {
    if (isdefined(level.wztrain_info)) {
        foreach (ent in level.wztrain_info.train_array) {
            if (!isdefined(ent)) {
                continue;
            }
            if (ent == hitent) {
                return 1;
            } else if (isdefined(ent.linked_model) && ent.linked_model == hitent) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232
// Size: 0x2a
function function_31156831afc882ad() {
    if (!isdefined(level.wztrain_info)) {
        return undefined;
    }
    var_eb0bf8d1503bbb00 = self getmovingplatformparent();
    return function_e58b746157089c68(var_eb0bf8d1503bbb00);
}

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x264
// Size: 0x108
function function_e58b746157089c68(hitent) {
    if (!isdefined(level.wztrain_info)) {
        return undefined;
    }
    if (!isdefined(level.wztrain_info.var_c3604781a9d33a7a)) {
        return undefined;
    }
    if (!isdefined(hitent)) {
        return undefined;
    }
    foreach (train, array in level.wztrain_info.var_c3604781a9d33a7a) {
        foreach (ent in array) {
            if (ent == hitent) {
                return train;
            } else if (isdefined(ent.linked_model) && ent.linked_model == hitent) {
                return train;
            }
        }
    }
    return undefined;
}

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x374
// Size: 0x54
function function_d699841d5e241043() {
    content = [0:"physicscontents_missileclip", 1:"physicscontents_item", 2:"physicscontents_vehicle", 3:"physicscontents_solid", 4:"physicscontents_glass", 5:"physicscontents_water", 6:"physicscontents_playerclip"];
    return physics_createcontents(content);
}

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d0
// Size: 0xa7
function is_moving_platform_train(movingplatforment) {
    if (!isdefined(movingplatforment)) {
        return 0;
    }
    if (isdefined(level.wztrain_info)) {
        foreach (ent in level.wztrain_info.train_array) {
            if (ent == movingplatforment) {
                return 1;
            } else if (isdefined(ent.linked_model) && ent.linked_model == movingplatforment) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47f
// Size: 0x71
function isplayerinsiderectangularzonebasedonent(player, var_712ea31644c12f3b, var_f5e80a9c637f1716, var_1575b6a2d72eab66, var_dff51823f3f6bcdd, var_98029591bfd2abae, var_1d3812e060e06bf3, var_88469bde23234dfd, var_20e0e132629f3354) {
    var_988d234c5db33afd = createrectangularzonebasedonent(var_712ea31644c12f3b, var_f5e80a9c637f1716, var_1575b6a2d72eab66, var_dff51823f3f6bcdd, var_98029591bfd2abae, var_1d3812e060e06bf3, var_88469bde23234dfd, var_20e0e132629f3354);
    return isplayerinsiderectangularzone(player, var_988d234c5db33afd);
}

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f8
// Size: 0xcc
function isplayerinsiderectangularzone(player, var_988d234c5db33afd) {
    player_x = player.origin[0];
    player_y = player.origin[1];
    player_z = player.origin[2];
    if (player_x > var_988d234c5db33afd.max_x) {
        return 0;
    }
    if (player_x < var_988d234c5db33afd.min_x) {
        return 0;
    }
    if (player_y > var_988d234c5db33afd.max_y) {
        return 0;
    }
    if (player_y < var_988d234c5db33afd.min_y) {
        return 0;
    }
    if (player_z > var_988d234c5db33afd.max_z) {
        return 0;
    }
    if (player_z < var_988d234c5db33afd.min_z) {
        return 0;
    }
    return 1;
}

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cc
// Size: 0x28c
function createrectangularzonebasedonent(var_712ea31644c12f3b, var_f5e80a9c637f1716, var_1575b6a2d72eab66, var_dff51823f3f6bcdd, var_98029591bfd2abae, var_1d3812e060e06bf3, var_88469bde23234dfd, var_20e0e132629f3354) {
    var_988d234c5db33afd = createdefaultrectangularzone();
    var_ac8052989cdb2473 = anglestoforward(var_712ea31644c12f3b.angles);
    var_ebef6d02b5739464 = anglestoright(var_712ea31644c12f3b.angles);
    var_e3899ff8c3f3e723 = anglestoup(var_712ea31644c12f3b.angles);
    var_8b429bc997bde15e = var_712ea31644c12f3b gettagorigin(var_f5e80a9c637f1716);
    var_891c8352f22d5dae = var_8b429bc997bde15e + var_ac8052989cdb2473 * var_1575b6a2d72eab66 + var_ebef6d02b5739464 * var_dff51823f3f6bcdd + var_e3899ff8c3f3e723 * var_98029591bfd2abae;
    var_b068b11c5df814d = [];
    /#
        function_6c75bb7dbb04ead5(var_891c8352f22d5dae);
    #/
    halflength = var_1d3812e060e06bf3 / 2;
    halfwidth = var_88469bde23234dfd / 2;
    halfheight = var_20e0e132629f3354 / 2;
    var_b125447fffeb35c0 = [0:halflength, 1:halflength * -1];
    var_5a33cfa8a827bfd2 = [0:halfwidth, 1:halfwidth * -1];
    var_f3079322750cd72f = [0:halfheight, 1:halfheight * -1];
    foreach (var_c734df03c2e01876 in var_b125447fffeb35c0) {
        foreach (var_210f94a8fd146f18 in var_5a33cfa8a827bfd2) {
            foreach (heightoffset in var_f3079322750cd72f) {
                var_1b5afbedd7e1ee0c = var_891c8352f22d5dae + var_ac8052989cdb2473 * var_c734df03c2e01876 + var_ebef6d02b5739464 * var_210f94a8fd146f18 + var_e3899ff8c3f3e723 * heightoffset;
                /#
                    function_e3aeb62332441401(var_1b5afbedd7e1ee0c);
                    var_b068b11c5df814d[var_b068b11c5df814d.size] = var_1b5afbedd7e1ee0c;
                #/
                updaterectangularzone(var_1b5afbedd7e1ee0c, var_988d234c5db33afd);
            }
        }
    }
    /#
        function_e80ba1fe0db513dc(var_b068b11c5df814d);
    #/
    return var_988d234c5db33afd;
}

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x860
// Size: 0xee
function updaterectangularzone(var_1b5afbedd7e1ee0c, var_988d234c5db33afd) {
    var_b068011c5df691c = var_1b5afbedd7e1ee0c[0];
    var_b068111c5df6b4f = var_1b5afbedd7e1ee0c[1];
    var_b068211c5df6d82 = var_1b5afbedd7e1ee0c[2];
    if (var_b068011c5df691c > var_988d234c5db33afd.max_x) {
        var_988d234c5db33afd.max_x = var_b068011c5df691c;
    }
    if (var_b068011c5df691c < var_988d234c5db33afd.min_x) {
        var_988d234c5db33afd.min_x = var_b068011c5df691c;
    }
    if (var_b068111c5df6b4f > var_988d234c5db33afd.max_y) {
        var_988d234c5db33afd.max_y = var_b068111c5df6b4f;
    }
    if (var_b068111c5df6b4f < var_988d234c5db33afd.min_y) {
        var_988d234c5db33afd.min_y = var_b068111c5df6b4f;
    }
    if (var_b068211c5df6d82 > var_988d234c5db33afd.max_z) {
        var_988d234c5db33afd.max_z = var_b068211c5df6d82;
    }
    if (var_b068211c5df6d82 < var_988d234c5db33afd.min_z) {
        var_988d234c5db33afd.min_z = var_b068211c5df6d82;
    }
}

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x955
// Size: 0x7a
function createdefaultrectangularzone() {
    var_988d234c5db33afd = spawnstruct();
    var_988d234c5db33afd.max_x = -999999;
    var_988d234c5db33afd.min_x = 999999;
    var_988d234c5db33afd.max_y = -999999;
    var_988d234c5db33afd.min_y = 999999;
    var_988d234c5db33afd.max_z = -999999;
    var_988d234c5db33afd.min_z = 999999;
    return var_988d234c5db33afd;
}

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9d7
// Size: 0x32
function function_6c75bb7dbb04ead5(var_891c8352f22d5dae) {
    /#
        if (!function_4237fc6e024c0cc1()) {
            return;
        }
        sphere(var_891c8352f22d5dae, 2, (1, 0, 0), 0, 60);
    #/
}

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa10
// Size: 0x32
function function_e3aeb62332441401(var_1b5afbedd7e1ee0c) {
    /#
        if (!function_4237fc6e024c0cc1()) {
            return;
        }
        sphere(var_1b5afbedd7e1ee0c, 2, (0, 1, 0), 0, 60);
    #/
}

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa49
// Size: 0xd6
function function_e80ba1fe0db513dc(var_b068b11c5df814d) {
    /#
        if (!function_4237fc6e024c0cc1()) {
            return;
        }
        foreach (var_1b5afbedd7e1ee0c in var_b068b11c5df814d) {
            var_bffc067dc1ee8974 = var_b068b11c5df814d;
            foreach (var_459b52e393ab64cf in var_bffc067dc1ee8974) {
                if (var_459b52e393ab64cf == var_1b5afbedd7e1ee0c) {
                    continue;
                }
                line(var_1b5afbedd7e1ee0c, var_459b52e393ab64cf, (0, 0, 1), 1, 0, 60);
            }
        }
    #/
}

// Namespace namespace_a51e05c6a6f8c5b2/namespace_9db09f982acd35b4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb26
// Size: 0x18
function function_4237fc6e024c0cc1() {
    /#
        return getdvarint(@"hash_aaddf2135ab39ed5", 0) != 0;
    #/
}

