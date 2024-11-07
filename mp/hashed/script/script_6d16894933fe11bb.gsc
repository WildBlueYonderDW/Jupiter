#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_7e4700be8ab64610;

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x10b
// Size: 0x41
function function_2dc0d6e3950226ac(original_position, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b) {
    thread function_ad5c3711a54f6d7b(original_position, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x154
// Size: 0x41
function function_9a4fc44894d201ce(original_position, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b) {
    thread function_ef55cd1da5e48f24(original_position, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x19d
// Size: 0x42
function function_1ccac97aaa70e4cc(var_968be7ac0c885ec6, var_382b807d2ce2bca0, player) {
    return function_ab7db46b3325436(var_968be7ac0c885ec6, var_382b807d2ce2bca0, 0.5, player.origin, player getplayerangles(), cos(60), 16);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e8
// Size: 0x1a
function function_48d03a548cabbbaa() {
    return function_c18b9feffb0cd128(20, 10, -1, 9, 0, 1, 0, 0, -1, 0, -1);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20b
// Size: 0x1b
function function_e683a4069caa308a() {
    return function_c18b9feffb0cd128(200, 100, 0, 10, 0, 1, 0, 10000, 0, 1000, 0);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x22f
// Size: 0x96
function private function_ad5c3711a54f6d7b(original_position, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b) {
    function_9a4fc44894d201ce(original_position, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b);
    var_e4592b88c9fe6650 waittill("FindNearbySpawnPoint_DONE", selected_point);
    if (!isdefined(selected_point)) {
        function_9a4fc44894d201ce(var_c9b964bd35abf3a4.player_origin, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b);
        var_e4592b88c9fe6650 waittill("FindNearbySpawnPoint_DONE", selected_point);
    }
    if (!isdefined(selected_point)) {
        selected_point = var_c9b964bd35abf3a4.player_origin;
    }
    var_e4592b88c9fe6650 notify("FindNearbySpawnPointGuaranteed_DONE", selected_point);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x2cd
// Size: 0xdc
function private function_ef55cd1da5e48f24(original_position, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b) {
    var_7f4854a36ffa1e4b = default_to(var_7f4854a36ffa1e4b, &function_a86ee9afcab9274b);
    offset_positions = function_677e2d6ea2c4d55a(original_position, search_radius);
    function_6adfab97e68c049a(offset_positions, original_position, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, 2, var_e4592b88c9fe6650);
    var_4b64167e28d5ee78 = undefined;
    var_e4592b88c9fe6650 waittill("AdjustAndScore_DONE", var_4b64167e28d5ee78);
    selected_position = undefined;
    if (var_4b64167e28d5ee78.size > 0) {
        var_1da28eb57130d8f2 = function_9f46ef5fb5beed12(var_4b64167e28d5ee78);
        var_2b3084bcaa7ef2f = [[ var_7f4854a36ffa1e4b ]](var_1da28eb57130d8f2);
        if (isdefined(var_2b3084bcaa7ef2f)) {
            selected_position = var_2b3084bcaa7ef2f.position;
        }
    }
    var_e4592b88c9fe6650 notify("FindNearbySpawnPoint_DONE", selected_position);
    /#
        function_3f5ff1b52f3b134c(selected_position, var_4b64167e28d5ee78, original_position, var_c9b964bd35abf3a4);
    #/
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3b1
// Size: 0x41
function function_6adfab97e68c049a(var_3b42ba940854ed70, var_e08e7fac766e98d3, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_869137a72cd99ed3, var_e4592b88c9fe6650) {
    thread function_2e10b411ead65dcf(var_3b42ba940854ed70, var_e08e7fac766e98d3, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_869137a72cd99ed3, var_e4592b88c9fe6650);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x3fa
// Size: 0xcd
function private function_2e10b411ead65dcf(var_3b42ba940854ed70, var_e08e7fac766e98d3, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_869137a72cd99ed3, var_e4592b88c9fe6650) {
    var_4b64167e28d5ee78 = [];
    var_194432c419132865 = function_114e5c055b13dacf(var_e08e7fac766e98d3);
    frames_waited = 0;
    if (isdefined(var_194432c419132865)) {
        for (i = 0; i < var_3b42ba940854ed70.size; i++) {
            var_1cea27f9e5a44ca3 = var_3b42ba940854ed70[i];
            var_a61ac01523fe8fdb = function_4cca5e4e38f25fac(var_1cea27f9e5a44ca3, var_194432c419132865, var_c9b964bd35abf3a4, var_9633b54b4a5d18de);
            if (isdefined(var_a61ac01523fe8fdb)) {
                var_4b64167e28d5ee78[var_4b64167e28d5ee78.size] = var_a61ac01523fe8fdb;
            }
            if (function_510ad113c8dd1ce4(i, var_3b42ba940854ed70.size, var_869137a72cd99ed3)) {
                frames_waited++;
                waitframe();
            }
        }
    }
    if (frames_waited == 0) {
        waitframe();
    }
    var_e4592b88c9fe6650 notify("AdjustAndScore_DONE", var_4b64167e28d5ee78);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4cf
// Size: 0xaa
function function_9f46ef5fb5beed12(var_4b64167e28d5ee78) {
    var_1da28eb57130d8f2 = [];
    highest_score = -1;
    foreach (var_a61ac01523fe8fdb in var_4b64167e28d5ee78) {
        score = var_a61ac01523fe8fdb.score;
        if (score == -1) {
            continue;
        }
        if (score > highest_score) {
            var_1da28eb57130d8f2 = [var_a61ac01523fe8fdb];
            highest_score = score;
            continue;
        }
        if (score == highest_score) {
            var_1da28eb57130d8f2[var_1da28eb57130d8f2.size] = var_a61ac01523fe8fdb;
        }
    }
    return var_1da28eb57130d8f2;
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x582
// Size: 0x12
function function_a86ee9afcab9274b(var_1da28eb57130d8f2) {
    return utility::array_random(var_1da28eb57130d8f2);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x59d
// Size: 0x26a
function private function_4cca5e4e38f25fac(offset_point, var_194432c419132865, var_c9b964bd35abf3a4, var_9633b54b4a5d18de) {
    if (!isdefined(var_194432c419132865)) {
        println("<dev string:x1c>");
        return undefined;
    }
    var_49cdfab0f4218435 = function_114e5c055b13dacf(offset_point);
    if (!isdefined(var_49cdfab0f4218435)) {
        println("<dev string:x90>");
        return undefined;
    }
    var_2ec1c749a01ca3d2 = function_c7f0422c18cdda30(var_194432c419132865, var_49cdfab0f4218435, var_9633b54b4a5d18de.var_5b31ffa29547405, var_9633b54b4a5d18de.var_c230b42df20d3dca);
    var_cb41931239bbd7f4 = drop_to_ground(var_49cdfab0f4218435);
    if (!isdefined(var_cb41931239bbd7f4)) {
        println("<dev string:x102>");
        return undefined;
    }
    var_9ac69cb5fcff4d42 = score_collision(var_cb41931239bbd7f4, var_c9b964bd35abf3a4.var_db0ba21189111548, var_c9b964bd35abf3a4.var_1ac1f65b0e8643c, var_c9b964bd35abf3a4.var_6e82ca28afde6992, var_9633b54b4a5d18de.var_9be5f041f38d955, var_9633b54b4a5d18de.var_23b853d5aebfb28b, var_9633b54b4a5d18de.var_82a1705495f2db3a);
    var_f5111a13515bfbf = function_7aa8da5d39957d0c(var_cb41931239bbd7f4, var_c9b964bd35abf3a4.player_origin, var_c9b964bd35abf3a4.player_angles, var_c9b964bd35abf3a4.player_fov, var_9633b54b4a5d18de.var_88636fbf7ac1c3ca, var_9633b54b4a5d18de.var_f489656c6a6dd615);
    var_7c21da60af113c3d = function_57d93c53afa6f5b0(var_cb41931239bbd7f4, var_c9b964bd35abf3a4.player_origin, var_c9b964bd35abf3a4.player_angles, var_9633b54b4a5d18de.var_bc5573cd02c964e0, var_9633b54b4a5d18de.var_13ba179a7806e4af);
    var_4c419aac2142adea = function_b6777c70bc659ac1(var_cb41931239bbd7f4, var_c9b964bd35abf3a4.player_origin, var_c9b964bd35abf3a4.var_ae35725717d412dc, var_9633b54b4a5d18de.var_9d820040732f2a3a, var_9633b54b4a5d18de.var_9ae7de37d4fa9e25);
    scores = [var_2ec1c749a01ca3d2.score, var_9ac69cb5fcff4d42.score, var_f5111a13515bfbf.score, var_7c21da60af113c3d.score, var_4c419aac2142adea.score];
    total_score = function_7b1103bf742c213f(scores);
    var_a61ac01523fe8fdb = function_42856ccaccadb424(var_cb41931239bbd7f4, total_score, var_2ec1c749a01ca3d2.computed_data, var_9ac69cb5fcff4d42.computed_data, var_4c419aac2142adea.computed_data);
    return var_a61ac01523fe8fdb;
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x810
// Size: 0x83
function function_ab7db46b3325436(var_db0ba21189111548, var_1ac1f65b0e8643c, var_6e82ca28afde6992, player_origin, player_angles, player_fov, var_ae35725717d412dc) {
    return {#var_ae35725717d412dc:var_ae35725717d412dc, #player_fov:player_fov, #player_angles:player_angles, #player_origin:player_origin, #var_6e82ca28afde6992:var_6e82ca28afde6992, #var_1ac1f65b0e8643c:var_1ac1f65b0e8643c, #var_db0ba21189111548:var_db0ba21189111548};
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 11, eflags: 0x4
// Checksum 0x0, Offset: 0x89c
// Size: 0xcf
function private function_c18b9feffb0cd128(var_9be5f041f38d955, var_23b853d5aebfb28b, var_82a1705495f2db3a, var_88636fbf7ac1c3ca, var_f489656c6a6dd615, var_bc5573cd02c964e0, var_13ba179a7806e4af, var_5b31ffa29547405, var_c230b42df20d3dca, var_9d820040732f2a3a, var_9ae7de37d4fa9e25) {
    return {#var_9ae7de37d4fa9e25:var_9ae7de37d4fa9e25, #var_9d820040732f2a3a:var_9d820040732f2a3a, #var_c230b42df20d3dca:var_c230b42df20d3dca, #var_5b31ffa29547405:var_5b31ffa29547405, #var_13ba179a7806e4af:var_13ba179a7806e4af, #var_bc5573cd02c964e0:var_bc5573cd02c964e0, #var_f489656c6a6dd615:var_f489656c6a6dd615, #var_88636fbf7ac1c3ca:var_88636fbf7ac1c3ca, #var_82a1705495f2db3a:var_82a1705495f2db3a, #var_23b853d5aebfb28b:var_23b853d5aebfb28b, #var_9be5f041f38d955:var_9be5f041f38d955};
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x974
// Size: 0x28
function private function_a85eeeeccebdd928(score, computed_data) {
    return {#computed_data:computed_data, #score:score};
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x9a5
// Size: 0x5e
function private function_42856ccaccadb424(position, score, var_5e2580ae7a0e3a9c, var_ddc70164cdcb7b7f, var_a11c8a0833df22ac) {
    return {#var_a11c8a0833df22ac:var_a11c8a0833df22ac, #var_ddc70164cdcb7b7f:var_ddc70164cdcb7b7f, #var_5e2580ae7a0e3a9c:var_5e2580ae7a0e3a9c, #score:score, #position:position};
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xa0c
// Size: 0x76
function private function_c7f0422c18cdda30(position_from, position_to, var_c1d0b2648a9309f6, var_790d9b119308194f) {
    score = var_790d9b119308194f;
    var_f1d878e9719f84a5 = navtrace(position_from, position_to, undefined, 1);
    if (!isdefined(var_f1d878e9719f84a5)) {
        score = var_c1d0b2648a9309f6;
    } else {
        fraction = var_f1d878e9719f84a5["fraction"];
        if (fraction > 0.95) {
            score = var_c1d0b2648a9309f6;
        }
    }
    return function_a85eeeeccebdd928(score, var_f1d878e9719f84a5);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 7, eflags: 0x4
// Checksum 0x0, Offset: 0xa8b
// Size: 0xf9
function private score_collision(position, var_db0ba21189111548, var_1ac1f65b0e8643c, var_6e82ca28afde6992, var_c1d0b2648a9309f6, var_3c48b578ae1d1520, var_790d9b119308194f) {
    score = var_790d9b119308194f;
    content = 0;
    content += scripts\engine\trace::create_world_contents();
    content += scripts\engine\trace::create_vehicle_contents();
    var_4dbebdf7827031b1 = position + (0, 0, var_1ac1f65b0e8643c);
    var_cb568fc0f8e6c6e = scripts\engine\trace::sphere_trace(var_4dbebdf7827031b1, var_4dbebdf7827031b1, var_db0ba21189111548, undefined, content, 1, 1);
    if (!isdefined(var_cb568fc0f8e6c6e) || var_cb568fc0f8e6c6e["fraction"] == 1) {
        score = var_c1d0b2648a9309f6;
    } else {
        hit_position = var_cb568fc0f8e6c6e["position"];
        var_a5fea26ca8831505 = function_cf89fb8c92ceda52(position, var_db0ba21189111548, hit_position);
        if (var_a5fea26ca8831505 > 0.95) {
            score = var_c1d0b2648a9309f6;
        } else if (var_a5fea26ca8831505 > var_6e82ca28afde6992) {
            score = var_3c48b578ae1d1520;
        }
    }
    return function_a85eeeeccebdd928(score, var_cb568fc0f8e6c6e);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0xb8d
// Size: 0x64
function private function_7aa8da5d39957d0c(position, player_origin, player_angles, fov, var_c1d0b2648a9309f6, var_790d9b119308194f) {
    score = var_790d9b119308194f;
    var_613e7d534471d6dd = utility::within_fov(player_origin, player_angles, position, fov);
    if (var_613e7d534471d6dd) {
        score = var_c1d0b2648a9309f6;
    }
    return function_a85eeeeccebdd928(score);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xbfa
// Size: 0x37
function private function_57d93c53afa6f5b0(position, player_origin, player_angles, var_c1d0b2648a9309f6, var_790d9b119308194f) {
    return function_7aa8da5d39957d0c(position, player_origin, player_angles, 0, var_c1d0b2648a9309f6, var_790d9b119308194f);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xc3a
// Size: 0x5b
function private function_b6777c70bc659ac1(position, player_origin, var_ae35725717d412dc, var_c1d0b2648a9309f6, var_790d9b119308194f) {
    score = var_790d9b119308194f;
    var_a11c8a0833df22ac = distance2d(position, player_origin);
    if (var_a11c8a0833df22ac > var_ae35725717d412dc) {
        score = var_c1d0b2648a9309f6;
    }
    return function_a85eeeeccebdd928(score, var_a11c8a0833df22ac);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc9e
// Size: 0x7d
function function_677e2d6ea2c4d55a(position, offset_radius) {
    offset_positions = [];
    offsets = function_277a001b9d96b876(offset_radius);
    foreach (offset in offsets) {
        offset_positions[offset_positions.size] = position + offset;
    }
    return offset_positions;
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd24
// Size: 0x3f
function function_277a001b9d96b876(radius) {
    offsets = function_88928c61c11ea048();
    for (i = 0; i < offsets.size; i++) {
        offsets[i] = offsets[i] * radius;
    }
    return offsets;
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd6c
// Size: 0x45
function private function_114e5c055b13dacf(position) {
    var_f4f2f1078a1998f6 = 0;
    ground_pos = drop_to_ground(position);
    if (!isdefined(ground_pos)) {
        return ground_pos;
    }
    var_9687e9878f9da949 = getclosestpointonnavmesh(position, undefined, undefined, undefined, var_f4f2f1078a1998f6);
    return var_9687e9878f9da949;
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xdba
// Size: 0x13
function private drop_to_ground(position) {
    return getgroundposition(position, 1);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xdd6
// Size: 0x31
function private function_510ad113c8dd1ce4(position_index, var_64e48a85b0d8d307, var_869137a72cd99ed3) {
    return position_index != 0 && position_index != var_64e48a85b0d8d307 - 1 && position_index % var_869137a72cd99ed3 == 0;
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xe10
// Size: 0x6a
function private function_7b1103bf742c213f(scores) {
    total_score = 0;
    foreach (score in scores) {
        if (score == -1) {
            return -1;
        }
        total_score += score;
    }
    return total_score;
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xe83
// Size: 0x36
function private function_cf89fb8c92ceda52(sphere_origin, sphere_radius, var_de8c49cc6b3b064f) {
    hit_distance = distance2d(sphere_origin, var_de8c49cc6b3b064f);
    return hit_distance / float(sphere_radius);
}

// Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xec2
// Size: 0xc3
function private function_88928c61c11ea048() {
    var_b670d68601bacc13 = level.var_635d51cc5daf677b;
    if (!isdefined(var_b670d68601bacc13)) {
        var_b670d68601bacc13 = [];
        cos_45 = cos(45);
        sin_45 = sin(45);
        var_b670d68601bacc13[0] = (1, 0, 0);
        var_b670d68601bacc13[1] = (-1, 0, 0);
        var_b670d68601bacc13[2] = (0, 1, 0);
        var_b670d68601bacc13[3] = (0, -1, 0);
        var_b670d68601bacc13[4] = (cos_45, sin_45, 0);
        var_b670d68601bacc13[5] = (cos_45 * -1, sin_45, 0);
        var_b670d68601bacc13[6] = (cos_45, sin_45 * -1, 0);
        var_b670d68601bacc13[7] = (cos_45 * -1, sin_45 * -1, 0);
        level.var_635d51cc5daf677b = var_b670d68601bacc13;
    }
    return var_b670d68601bacc13;
}

/#

    // Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
    // Params 4, eflags: 0x4
    // Checksum 0x0, Offset: 0xf8e
    // Size: 0x6c
    function private function_3f5ff1b52f3b134c(selected_position, var_4b64167e28d5ee78, var_b9f9b692fc3709e8, var_c9b964bd35abf3a4) {
        var_ceb612692dd7ca1d = getdvarint(@"hash_eff5e2218caf8354", 0);
        if (var_ceb612692dd7ca1d) {
            var_8413510412a61b93 = getdvarint(@"hash_1ed3e490fb83235e", 999);
            function_4be40ababbe96dc7(selected_position, var_4b64167e28d5ee78, var_b9f9b692fc3709e8, var_c9b964bd35abf3a4, var_8413510412a61b93);
        }
    }

    // Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
    // Params 5, eflags: 0x4
    // Checksum 0x0, Offset: 0x1002
    // Size: 0x1fa
    function private function_4be40ababbe96dc7(selected_position, var_4b64167e28d5ee78, var_b9f9b692fc3709e8, var_c9b964bd35abf3a4, duration) {
        var_7b08892f10fff3b4 = (0, 255, 0);
        var_44abc2142cbaf028 = (0, 100, 100);
        var_eb66e42880eb990b = (0, 0, 255);
        var_37c903fe9120a5d8 = (255, 0, 255);
        var_234455c2ac03c8d = (255, 0, 0);
        var_9017e37442714912 = (255, 255, 0);
        debug_draw(var_b9f9b692fc3709e8, 8, var_44abc2142cbaf028, duration, "<dev string:x186>", undefined, 0.5);
        debug_draw(function_114e5c055b13dacf(var_b9f9b692fc3709e8), 6, var_eb66e42880eb990b, duration, "<dev string:x19e>", 0, 0.5);
        foreach (var_a61ac01523fe8fdb in var_4b64167e28d5ee78) {
            if (isdefined(selected_position) && var_a61ac01523fe8fdb.position == selected_position) {
                color = var_7b08892f10fff3b4;
            } else if (var_a61ac01523fe8fdb.score == -1) {
                color = var_234455c2ac03c8d;
            } else {
                color = var_37c903fe9120a5d8;
            }
            debug_draw(var_a61ac01523fe8fdb.position + (0, 0, var_c9b964bd35abf3a4.var_1ac1f65b0e8643c), var_c9b964bd35abf3a4.var_db0ba21189111548, color, duration, utility::string(var_a61ac01523fe8fdb.score));
            var_cb568fc0f8e6c6e = var_a61ac01523fe8fdb.var_ddc70164cdcb7b7f;
            if (isdefined(var_cb568fc0f8e6c6e) && var_cb568fc0f8e6c6e["<dev string:x1c9>"] < 1) {
                sphere(var_cb568fc0f8e6c6e["<dev string:x1d5>"], 3, var_9017e37442714912, 0, int(duration));
            }
        }
    }

    // Namespace namespace_7e4700be8ab64610 / namespace_2ab9b162a8913b29
    // Params 7, eflags: 0x4
    // Checksum 0x0, Offset: 0x1204
    // Size: 0xab
    function private debug_draw(pos, radius, color, duration, optional_text, var_a3c3604324011b66, var_e42f8c5f7c385ecc) {
        if (!isdefined(duration)) {
            duration = 1;
        }
        if (!isdefined(var_a3c3604324011b66)) {
            var_a3c3604324011b66 = 30;
        }
        if (!isdefined(var_e42f8c5f7c385ecc)) {
            var_e42f8c5f7c385ecc = 1;
        }
        if (!isdefined(pos)) {
            return;
        }
        duration = int(duration);
        sphere(pos, radius, color, 0, duration);
        sphere(pos, 3, undefined, 1, duration);
        if (isdefined(optional_text)) {
            print3d(pos + (0, 0, var_a3c3604324011b66), optional_text, (255, 255, 255), 1, var_e42f8c5f7c385ecc, duration, 1);
        }
    }

#/
