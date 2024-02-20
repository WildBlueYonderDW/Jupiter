// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_7e4700be8ab64610;

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc
// Size: 0x42
function function_2dc0d6e3950226ac(var_c4f916881a2bfc0, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b) {
    thread function_ad5c3711a54f6d7b(var_c4f916881a2bfc0, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b);
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x125
// Size: 0x42
function function_9a4fc44894d201ce(var_c4f916881a2bfc0, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b) {
    thread function_ef55cd1da5e48f24(var_c4f916881a2bfc0, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b);
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e
// Size: 0x43
function function_1ccac97aaa70e4cc(var_968be7ac0c885ec6, var_382b807d2ce2bca0, player) {
    return function_ab7db46b3325436(var_968be7ac0c885ec6, var_382b807d2ce2bca0, 0.5, player.origin, player getplayerangles(), cos(60), 16);
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b9
// Size: 0x1b
function function_48d03a548cabbbaa() {
    return function_c18b9feffb0cd128(20, 10, -1, 9, 0, 1, 0, 0, -1, 0, -1);
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc
// Size: 0x1c
function function_e683a4069caa308a() {
    return function_c18b9feffb0cd128(200, 100, 0, 10, 0, 1, 0, 10000, 0, 1000, 0);
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x200
// Size: 0x96
function private function_ad5c3711a54f6d7b(var_c4f916881a2bfc0, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b) {
    function_9a4fc44894d201ce(var_c4f916881a2bfc0, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b);
    var_5ccd7894e22805b9 = var_e4592b88c9fe6650 waittill("FindNearbySpawnPoint_DONE");
    if (!isdefined(var_5ccd7894e22805b9)) {
        function_9a4fc44894d201ce(var_c9b964bd35abf3a4.player_origin, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b);
        var_5ccd7894e22805b9 = var_e4592b88c9fe6650 waittill("FindNearbySpawnPoint_DONE");
    }
    if (!isdefined(var_5ccd7894e22805b9)) {
        var_5ccd7894e22805b9 = var_c9b964bd35abf3a4.player_origin;
    }
    var_e4592b88c9fe6650 notify("FindNearbySpawnPointGuaranteed_DONE", var_5ccd7894e22805b9);
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x29d
// Size: 0xe0
function private function_ef55cd1da5e48f24(var_c4f916881a2bfc0, search_radius, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_e4592b88c9fe6650, var_7f4854a36ffa1e4b) {
    var_7f4854a36ffa1e4b = function_53c4c53197386572(var_7f4854a36ffa1e4b, &function_a86ee9afcab9274b);
    var_4fc2e68df2d360f9 = function_677e2d6ea2c4d55a(var_c4f916881a2bfc0, search_radius);
    function_6adfab97e68c049a(var_4fc2e68df2d360f9, var_c4f916881a2bfc0, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, 2, var_e4592b88c9fe6650);
    var_4b64167e28d5ee78 = undefined;
    var_4b64167e28d5ee78 = var_e4592b88c9fe6650 waittill("AdjustAndScore_DONE");
    var_aa7619a6e0831aa2 = undefined;
    if (var_4b64167e28d5ee78.size > 0) {
        var_1da28eb57130d8f2 = function_9f46ef5fb5beed12(var_4b64167e28d5ee78);
        var_2b3084bcaa7ef2f = [[ var_7f4854a36ffa1e4b ]](var_1da28eb57130d8f2);
        if (isdefined(var_2b3084bcaa7ef2f)) {
            var_aa7619a6e0831aa2 = var_2b3084bcaa7ef2f.position;
        }
    }
    var_e4592b88c9fe6650 notify("FindNearbySpawnPoint_DONE", var_aa7619a6e0831aa2);
    /#
        function_3f5ff1b52f3b134c(var_aa7619a6e0831aa2, var_4b64167e28d5ee78, var_c4f916881a2bfc0, var_c9b964bd35abf3a4);
    #/
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x384
// Size: 0x42
function function_6adfab97e68c049a(var_3b42ba940854ed70, var_e08e7fac766e98d3, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_869137a72cd99ed3, var_e4592b88c9fe6650) {
    thread function_2e10b411ead65dcf(var_3b42ba940854ed70, var_e08e7fac766e98d3, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_869137a72cd99ed3, var_e4592b88c9fe6650);
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cd
// Size: 0xd2
function private function_2e10b411ead65dcf(var_3b42ba940854ed70, var_e08e7fac766e98d3, var_c9b964bd35abf3a4, var_9633b54b4a5d18de, var_869137a72cd99ed3, var_e4592b88c9fe6650) {
    var_4b64167e28d5ee78 = [];
    var_194432c419132865 = function_114e5c055b13dacf(var_e08e7fac766e98d3);
    var_7afd6f5377b6b8c = 0;
    if (isdefined(var_194432c419132865)) {
        for (i = 0; i < var_3b42ba940854ed70.size; i++) {
            var_1cea27f9e5a44ca3 = var_3b42ba940854ed70[i];
            var_a61ac01523fe8fdb = function_4cca5e4e38f25fac(var_1cea27f9e5a44ca3, var_194432c419132865, var_c9b964bd35abf3a4, var_9633b54b4a5d18de);
            if (isdefined(var_a61ac01523fe8fdb)) {
                var_4b64167e28d5ee78[var_4b64167e28d5ee78.size] = var_a61ac01523fe8fdb;
            }
            if (function_510ad113c8dd1ce4(i, var_3b42ba940854ed70.size, var_869137a72cd99ed3)) {
                var_7afd6f5377b6b8c++;
                waitframe();
            }
        }
    }
    if (var_7afd6f5377b6b8c == 0) {
        waitframe();
    }
    var_e4592b88c9fe6650 notify("AdjustAndScore_DONE", var_4b64167e28d5ee78);
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a6
// Size: 0xaf
function function_9f46ef5fb5beed12(var_4b64167e28d5ee78) {
    var_1da28eb57130d8f2 = [];
    highest_score = -1;
    foreach (var_a61ac01523fe8fdb in var_4b64167e28d5ee78) {
        score = var_a61ac01523fe8fdb.score;
        if (score == -1) {
            continue;
        } else if (score > highest_score) {
            var_1da28eb57130d8f2 = [0:var_a61ac01523fe8fdb];
            highest_score = score;
        } else if (score == highest_score) {
            var_1da28eb57130d8f2[var_1da28eb57130d8f2.size] = var_a61ac01523fe8fdb;
        }
    }
    return var_1da28eb57130d8f2;
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55d
// Size: 0x13
function function_a86ee9afcab9274b(var_1da28eb57130d8f2) {
    return utility::function_7a2aaa4a09a4d250(var_1da28eb57130d8f2);
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x578
// Size: 0x273
function private function_4cca5e4e38f25fac(var_f969843d41df3a2b, var_194432c419132865, var_c9b964bd35abf3a4, var_9633b54b4a5d18de) {
    if (!isdefined(var_194432c419132865)) {
        /#
            println("<unknown string>");
        #/
        return undefined;
    }
    var_49cdfab0f4218435 = function_114e5c055b13dacf(var_f969843d41df3a2b);
    if (!isdefined(var_49cdfab0f4218435)) {
        /#
            println("<unknown string>");
        #/
        return undefined;
    }
    var_2ec1c749a01ca3d2 = function_c7f0422c18cdda30(var_194432c419132865, var_49cdfab0f4218435, var_9633b54b4a5d18de.var_5b31ffa29547405, var_9633b54b4a5d18de.var_c230b42df20d3dca);
    var_cb41931239bbd7f4 = drop_to_ground(var_49cdfab0f4218435);
    if (!isdefined(var_cb41931239bbd7f4)) {
        /#
            println("<unknown string>");
        #/
        return undefined;
    }
    var_9ac69cb5fcff4d42 = function_aefda4fd1849e142(var_cb41931239bbd7f4, var_c9b964bd35abf3a4.var_db0ba21189111548, var_c9b964bd35abf3a4.var_1ac1f65b0e8643c, var_c9b964bd35abf3a4.var_6e82ca28afde6992, var_9633b54b4a5d18de.var_9be5f041f38d955, var_9633b54b4a5d18de.var_23b853d5aebfb28b, var_9633b54b4a5d18de.var_82a1705495f2db3a);
    var_f5111a13515bfbf = function_7aa8da5d39957d0c(var_cb41931239bbd7f4, var_c9b964bd35abf3a4.player_origin, var_c9b964bd35abf3a4.player_angles, var_c9b964bd35abf3a4.var_b58fa288ed37ed30, var_9633b54b4a5d18de.var_88636fbf7ac1c3ca, var_9633b54b4a5d18de.var_f489656c6a6dd615);
    var_7c21da60af113c3d = function_57d93c53afa6f5b0(var_cb41931239bbd7f4, var_c9b964bd35abf3a4.player_origin, var_c9b964bd35abf3a4.player_angles, var_9633b54b4a5d18de.var_bc5573cd02c964e0, var_9633b54b4a5d18de.var_13ba179a7806e4af);
    var_4c419aac2142adea = function_b6777c70bc659ac1(var_cb41931239bbd7f4, var_c9b964bd35abf3a4.player_origin, var_c9b964bd35abf3a4.var_ae35725717d412dc, var_9633b54b4a5d18de.var_9d820040732f2a3a, var_9633b54b4a5d18de.var_9ae7de37d4fa9e25);
    scores = [0:var_2ec1c749a01ca3d2.score, 1:var_9ac69cb5fcff4d42.score, 2:var_f5111a13515bfbf.score, 3:var_7c21da60af113c3d.score, 4:var_4c419aac2142adea.score];
    total_score = function_7b1103bf742c213f(scores);
    var_a61ac01523fe8fdb = function_42856ccaccadb424(var_cb41931239bbd7f4, total_score, var_2ec1c749a01ca3d2.var_67893f6112cdff93, var_9ac69cb5fcff4d42.var_67893f6112cdff93, var_4c419aac2142adea.var_67893f6112cdff93);
    return var_a61ac01523fe8fdb;
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f3
// Size: 0x84
function function_ab7db46b3325436(var_db0ba21189111548, var_1ac1f65b0e8643c, var_6e82ca28afde6992, player_origin, player_angles, var_b58fa288ed37ed30, var_ae35725717d412dc) {
    return {var_ae35725717d412dc:var_ae35725717d412dc, var_b58fa288ed37ed30:var_b58fa288ed37ed30, player_angles:player_angles, player_origin:player_origin, var_6e82ca28afde6992:var_6e82ca28afde6992, var_1ac1f65b0e8643c:var_1ac1f65b0e8643c, var_db0ba21189111548:var_db0ba21189111548};
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params b, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x87f
// Size: 0xd0
function private function_c18b9feffb0cd128(var_9be5f041f38d955, var_23b853d5aebfb28b, var_82a1705495f2db3a, var_88636fbf7ac1c3ca, var_f489656c6a6dd615, var_bc5573cd02c964e0, var_13ba179a7806e4af, var_5b31ffa29547405, var_c230b42df20d3dca, var_9d820040732f2a3a, var_9ae7de37d4fa9e25) {
    return {var_9ae7de37d4fa9e25:var_9ae7de37d4fa9e25, var_9d820040732f2a3a:var_9d820040732f2a3a, var_c230b42df20d3dca:var_c230b42df20d3dca, var_5b31ffa29547405:var_5b31ffa29547405, var_13ba179a7806e4af:var_13ba179a7806e4af, var_bc5573cd02c964e0:var_bc5573cd02c964e0, var_f489656c6a6dd615:var_f489656c6a6dd615, var_88636fbf7ac1c3ca:var_88636fbf7ac1c3ca, var_82a1705495f2db3a:var_82a1705495f2db3a, var_23b853d5aebfb28b:var_23b853d5aebfb28b, var_9be5f041f38d955:var_9be5f041f38d955};
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x957
// Size: 0x29
function private function_a85eeeeccebdd928(score, var_67893f6112cdff93) {
    return {var_67893f6112cdff93:var_67893f6112cdff93, score:score};
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x988
// Size: 0x5f
function private function_42856ccaccadb424(position, score, var_5e2580ae7a0e3a9c, var_ddc70164cdcb7b7f, var_a11c8a0833df22ac) {
    return {var_a11c8a0833df22ac:var_a11c8a0833df22ac, var_ddc70164cdcb7b7f:var_ddc70164cdcb7b7f, var_5e2580ae7a0e3a9c:var_5e2580ae7a0e3a9c, score:score, position:position};
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9ef
// Size: 0x78
function private function_c7f0422c18cdda30(var_e126771627f2c947, var_5f65f1eea626ecc6, var_c1d0b2648a9309f6, var_790d9b119308194f) {
    score = var_790d9b119308194f;
    var_f1d878e9719f84a5 = navtrace(var_e126771627f2c947, var_5f65f1eea626ecc6, undefined, 1);
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

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa6f
// Size: 0xfe
function private function_aefda4fd1849e142(position, var_db0ba21189111548, var_1ac1f65b0e8643c, var_6e82ca28afde6992, var_c1d0b2648a9309f6, var_3c48b578ae1d1520, var_790d9b119308194f) {
    score = var_790d9b119308194f;
    content = 0;
    content = content + namespace_2a184fc4902783dc::create_world_contents();
    content = content + namespace_2a184fc4902783dc::create_vehicle_contents();
    var_4dbebdf7827031b1 = position + (0, 0, var_1ac1f65b0e8643c);
    var_cb568fc0f8e6c6e = namespace_2a184fc4902783dc::sphere_trace(var_4dbebdf7827031b1, var_4dbebdf7827031b1, var_db0ba21189111548, undefined, content, 1, 1);
    if (!isdefined(var_cb568fc0f8e6c6e) || var_cb568fc0f8e6c6e["fraction"] == 1) {
        score = var_c1d0b2648a9309f6;
    } else {
        var_80b5ece86294ebf8 = var_cb568fc0f8e6c6e["position"];
        var_a5fea26ca8831505 = function_cf89fb8c92ceda52(position, var_db0ba21189111548, var_80b5ece86294ebf8);
        if (var_a5fea26ca8831505 > 0.95) {
            score = var_c1d0b2648a9309f6;
        } else if (var_a5fea26ca8831505 > var_6e82ca28afde6992) {
            score = var_3c48b578ae1d1520;
        }
    }
    return function_a85eeeeccebdd928(score, var_cb568fc0f8e6c6e);
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb75
// Size: 0x65
function private function_7aa8da5d39957d0c(position, player_origin, player_angles, fov, var_c1d0b2648a9309f6, var_790d9b119308194f) {
    score = var_790d9b119308194f;
    var_613e7d534471d6dd = utility::within_fov(player_origin, player_angles, position, fov);
    if (var_613e7d534471d6dd) {
        score = var_c1d0b2648a9309f6;
    }
    return function_a85eeeeccebdd928(score);
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbe2
// Size: 0x38
function private function_57d93c53afa6f5b0(position, player_origin, player_angles, var_c1d0b2648a9309f6, var_790d9b119308194f) {
    return function_7aa8da5d39957d0c(position, player_origin, player_angles, 0, var_c1d0b2648a9309f6, var_790d9b119308194f);
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc22
// Size: 0x5c
function private function_b6777c70bc659ac1(position, player_origin, var_ae35725717d412dc, var_c1d0b2648a9309f6, var_790d9b119308194f) {
    score = var_790d9b119308194f;
    var_a11c8a0833df22ac = distance2d(position, player_origin);
    if (var_a11c8a0833df22ac > var_ae35725717d412dc) {
        score = var_c1d0b2648a9309f6;
    }
    return function_a85eeeeccebdd928(score, var_a11c8a0833df22ac);
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc86
// Size: 0x81
function function_677e2d6ea2c4d55a(position, var_6dfc95df4208a111) {
    var_4fc2e68df2d360f9 = [];
    offsets = function_277a001b9d96b876(var_6dfc95df4208a111);
    foreach (offset in offsets) {
        var_4fc2e68df2d360f9[var_4fc2e68df2d360f9.size] = position + offset;
    }
    return var_4fc2e68df2d360f9;
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0f
// Size: 0x40
function function_277a001b9d96b876(radius) {
    offsets = function_88928c61c11ea048();
    for (i = 0; i < offsets.size; i++) {
        offsets[i] = offsets[i] * radius;
    }
    return offsets;
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd57
// Size: 0x47
function private function_114e5c055b13dacf(position) {
    var_f4f2f1078a1998f6 = 0;
    ground_pos = drop_to_ground(position);
    if (!isdefined(ground_pos)) {
        return ground_pos;
    }
    var_9687e9878f9da949 = getclosestpointonnavmesh(position, undefined, undefined, undefined, var_f4f2f1078a1998f6);
    return var_9687e9878f9da949;
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xda6
// Size: 0x14
function private drop_to_ground(position) {
    return getgroundposition(position, 1);
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdc2
// Size: 0x32
function private function_510ad113c8dd1ce4(var_ea5c8082d397e641, var_64e48a85b0d8d307, var_869137a72cd99ed3) {
    return var_ea5c8082d397e641 != 0 && var_ea5c8082d397e641 != var_64e48a85b0d8d307 - 1 && var_ea5c8082d397e641 % var_869137a72cd99ed3 == 0;
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdfc
// Size: 0x6d
function private function_7b1103bf742c213f(scores) {
    total_score = 0;
    foreach (score in scores) {
        if (score == -1) {
            return -1;
        }
        total_score = total_score + score;
    }
    return total_score;
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe71
// Size: 0x36
function private function_cf89fb8c92ceda52(var_61416a7af7dddb93, sphere_radius, var_de8c49cc6b3b064f) {
    hit_distance = distance2d(var_61416a7af7dddb93, var_de8c49cc6b3b064f);
    return hit_distance / float(sphere_radius);
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeaf
// Size: 0xc5
function private function_88928c61c11ea048() {
    var_b670d68601bacc13 = level.var_635d51cc5daf677b;
    if (!isdefined(var_b670d68601bacc13)) {
        var_b670d68601bacc13 = [];
        var_941a11d22cfee922 = cos(45);
        var_31cb782b9e8750b5 = sin(45);
        var_b670d68601bacc13[0] = (1, 0, 0);
        var_b670d68601bacc13[1] = (-1, 0, 0);
        var_b670d68601bacc13[2] = (0, 1, 0);
        var_b670d68601bacc13[3] = (0, -1, 0);
        var_b670d68601bacc13[4] = (var_941a11d22cfee922, var_31cb782b9e8750b5, 0);
        var_b670d68601bacc13[5] = (var_941a11d22cfee922 * -1, var_31cb782b9e8750b5, 0);
        var_b670d68601bacc13[6] = (var_941a11d22cfee922, var_31cb782b9e8750b5 * -1, 0);
        var_b670d68601bacc13[7] = (var_941a11d22cfee922 * -1, var_31cb782b9e8750b5 * -1, 0);
        level.var_635d51cc5daf677b = var_b670d68601bacc13;
    }
    return var_b670d68601bacc13;
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xf7c
// Size: 0x6d
function private function_3f5ff1b52f3b134c(var_aa7619a6e0831aa2, var_4b64167e28d5ee78, var_b9f9b692fc3709e8, var_c9b964bd35abf3a4) {
    /#
        var_ceb612692dd7ca1d = getdvarint(@"hash_eff5e2218caf8354", 0);
        if (var_ceb612692dd7ca1d) {
            var_8413510412a61b93 = getdvarint(@"hash_1ed3e490fb83235e", 999);
            function_4be40ababbe96dc7(var_aa7619a6e0831aa2, var_4b64167e28d5ee78, var_b9f9b692fc3709e8, var_c9b964bd35abf3a4, var_8413510412a61b93);
        }
    #/
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xff0
// Size: 0x204
function private function_4be40ababbe96dc7(var_aa7619a6e0831aa2, var_4b64167e28d5ee78, var_b9f9b692fc3709e8, var_c9b964bd35abf3a4, duration) {
    /#
        var_7b08892f10fff3b4 = (0, 255, 0);
        var_44abc2142cbaf028 = (0, 100, 100);
        var_eb66e42880eb990b = (0, 0, 255);
        var_37c903fe9120a5d8 = (255, 0, 255);
        var_234455c2ac03c8d = (255, 0, 0);
        var_9017e37442714912 = (255, 255, 0);
        debug_draw(var_b9f9b692fc3709e8, 8, var_44abc2142cbaf028, duration, "<unknown string>", undefined, 0.5);
        debug_draw(function_114e5c055b13dacf(var_b9f9b692fc3709e8), 6, var_eb66e42880eb990b, duration, "<unknown string>", 0, 0.5);
        foreach (var_a61ac01523fe8fdb in var_4b64167e28d5ee78) {
            if (isdefined(var_aa7619a6e0831aa2) && var_a61ac01523fe8fdb.position == var_aa7619a6e0831aa2) {
                color = var_7b08892f10fff3b4;
            } else if (var_a61ac01523fe8fdb.score == -1) {
                color = var_234455c2ac03c8d;
            } else {
                color = var_37c903fe9120a5d8;
            }
            debug_draw(var_a61ac01523fe8fdb.position + (0, 0, var_c9b964bd35abf3a4.var_1ac1f65b0e8643c), var_c9b964bd35abf3a4.var_db0ba21189111548, color, duration, utility::string(var_a61ac01523fe8fdb.score));
            var_cb568fc0f8e6c6e = var_a61ac01523fe8fdb.var_ddc70164cdcb7b7f;
            if (isdefined(var_cb568fc0f8e6c6e) && var_cb568fc0f8e6c6e["<unknown string>"] < 1) {
                sphere(var_cb568fc0f8e6c6e["<unknown string>"], 3, var_9017e37442714912, 0, int(duration));
            }
        }
    #/
}

// Namespace namespace_7e4700be8ab64610/namespace_2ab9b162a8913b29
// Params 7, eflags: 0x4
// Checksum 0x0, Offset: 0x11fb
// Size: 0xac
function private debug_draw(pos, radius, color, duration, var_997aa3596c2f9865, var_a3c3604324011b66, var_e42f8c5f7c385ecc) {
    /#
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
        if (isdefined(var_997aa3596c2f9865)) {
            print3d(pos + (0, 0, var_a3c3604324011b66), var_997aa3596c2f9865, (255, 255, 255), 1, var_e42f8c5f7c385ecc, duration, 1);
        }
    #/
}

