// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_10b6724c15a95e8;
#using script_4e1d4dd23699a8a4;

#namespace namespace_54acaf301486afc6;

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x469
// Size: 0x6a4
function function_c984f2a1e4436eba() {
    level.var_f62b6e59c0e00d48 = spawnstruct();
    level.var_f62b6e59c0e00d48.var_2382776051beed37 = 4000;
    level.var_f62b6e59c0e00d48.var_61996ea555e490fc = 0;
    level.var_f62b6e59c0e00d48.var_cb0412bfad561be1 = 0;
    level.var_f62b6e59c0e00d48.var_df9cdff867da6dd9 = 3000;
    level.var_f62b6e59c0e00d48.var_9e4da84360423c6 = 2000;
    level.var_f62b6e59c0e00d48.var_448e04f667a280b1 = 0;
    level.var_f62b6e59c0e00d48.var_af1d1102ede20fc2 = "relaxed";
    level.var_f62b6e59c0e00d48.var_fd5676cc382cc7e1 = 0;
    level.var_f62b6e59c0e00d48.var_a576b24ef9af6865 = 20000;
    level.var_f62b6e59c0e00d48.var_8b3c659fe74ae0ec = 1000;
    level.var_f62b6e59c0e00d48.var_932238a570868df2 = 1000;
    level.var_f62b6e59c0e00d48.var_63946b7b3280a1be = 0;
    level.var_f62b6e59c0e00d48.var_4c000e21703586f = [];
    level.var_f62b6e59c0e00d48.var_a7b0a5f16322cf86 = [];
    level.var_f62b6e59c0e00d48.var_a8bf30fbb992eb1 = 200;
    level.var_f62b6e59c0e00d48.var_869a1ef8b53fb0bc = 0;
    level.var_f62b6e59c0e00d48.var_30e8e171b32c1d5c = 64;
    level.var_f62b6e59c0e00d48.var_e2b778b4a4a266f5 = 108;
    level.var_f62b6e59c0e00d48.var_bcce56724567c4a3 = [];
    level.var_f62b6e59c0e00d48.var_bcce56724567c4a3["relaxed"] = 0;
    level.var_f62b6e59c0e00d48.var_bcce56724567c4a3["curious"] = 1;
    level.var_f62b6e59c0e00d48.var_bcce56724567c4a3["staring"] = 1;
    level.var_f62b6e59c0e00d48.var_bcce56724567c4a3["angered"] = 2;
    level.var_f62b6e59c0e00d48.var_bcce56724567c4a3["scared"] = 3;
    level.var_f62b6e59c0e00d48.var_bcce56724567c4a3["panicked"] = 4;
    level.var_f62b6e59c0e00d48.var_bcce56724567c4a3["cower"] = 5;
    level.var_f62b6e59c0e00d48.civs = [];
    level.var_f62b6e59c0e00d48.events = function_79c374ab1ca30cc9(5);
    level.var_b13f1c7f8e404252 = spawnstruct();
    level.var_b13f1c7f8e404252.fov = 0.996;
    level.var_b13f1c7f8e404252.var_2626acf65f81f6a9 = 0.975;
    level.var_b13f1c7f8e404252.var_be89e0f4bf70ed43 = 0.965;
    level.var_b13f1c7f8e404252.var_7e14e46e198de798 = 0.707;
    level.var_b13f1c7f8e404252.maxdistance = 400;
    level.var_b13f1c7f8e404252.var_d28d8ad618d1af7f = 6;
    level.var_b13f1c7f8e404252.var_e420701002f63dac = 400;
    level.var_b13f1c7f8e404252.var_ee3b0f193196d7fb = 150;
    level.var_b13f1c7f8e404252.var_f857ce93fc87458f = 0.02;
    level.var_b13f1c7f8e404252.var_fdce0a7f3646918c = 60;
    level.var_b13f1c7f8e404252.var_8f1c451c993982b6 = 600;
    level.var_9958731831312749 = spawnstruct();
    level.var_9958731831312749.var_b42ba1f1aae8d641 = 0;
    level.var_9958731831312749.var_b44e93f1ab0eff2f = 200;
    level.var_9958731831312749.var_1306d89ed2b850ff = 500;
    level.var_9958731831312749.var_12e3e69ed2922811 = 1500;
    level.var_9958731831312749.var_5aa858d7411e83e9 = 1500;
    level.var_9958731831312749.var_5a854ad740f81d67 = 2500;
    level.var_9958731831312749.var_bceea906e00dbe5d = 0;
    level.var_9958731831312749.var_bccbb306dfe78ca3 = 4500;
    level.var_9958731831312749.var_7684b0649e83c0f = 3000;
    level.var_9958731831312749.var_745390649c1ccc1 = 5500;
    level.var_9958731831312749.var_ab47b155a0c0b6e9 = 256;
    level.var_9958731831312749.var_7030873a2cb05d89 = 2;
    level.var_9958731831312749.var_2fe9915eca4d8d12 = 1;
    level.var_9958731831312749.var_832e9f5262aaa2b2 = 0.5;
    level.var_9958731831312749.var_55beb89839cbe08b = 0.6;
    level.var_9958731831312749.var_de22934892b70a4e = 0.8;
    level.var_9958731831312749.var_ada3cdb8ba2cd2ec = 1;
    level.var_9958731831312749.var_44b96437c2e7f624 = 3;
    level.var_9958731831312749.var_30f007ac9a8e642e = 75;
    level.var_9958731831312749.var_4bee8d2b5a70f239 = 230;
    level.var_9958731831312749.var_a2fe99c7d215229e = 100;
    level.var_9958731831312749.var_630d43da7f95f8fb = 1500;
    level.var_9958731831312749.var_7c9588454c703131 = 400;
    level.var_9958731831312749.var_37460d7564c32f23 = 200;
    level.var_9958731831312749.var_28aa9afd2281bef1 = 10;
    level.var_9958731831312749.var_6c2da9c7a6c0dedb = 7;
    level.var_9958731831312749.var_e1987e04cee18cc9 = 3;
    level.var_9958731831312749.var_6026b57b0b875efc = 1000;
    level.var_9958731831312749.var_fd4dfd13f9e063c0 = 1000;
    level.var_9958731831312749.var_922aa1ced3d997d7 = level.var_9958731831312749.var_fd4dfd13f9e063c0 + 1000;
    setdvarifuninitialized(@"hash_18f4855098e19194", 1);
    setdvarifuninitialized(@"hash_4323dba64c360cf0", 0);
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb14
// Size: 0x3a
function function_32d74b97e987274c(var_2b7ca3d82a3844a5, var_2b7ca0d82a383e0c, var_bd1eea299be01a5c, var_bbf329e619893dcf) {
    return function_b1eeb1edab8e23d4(var_2b7ca3d82a3844a5, var_2b7ca0d82a383e0c, var_bd1eea299be01a5c) && function_b1eeb1edab8e23d4(var_2b7ca0d82a383e0c, var_2b7ca3d82a3844a5, var_bbf329e619893dcf);
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb56
// Size: 0x72
function function_b1eeb1edab8e23d4(var_d80b9483a7b08877, targetentity, fov) {
    var_d6ce9b417363979e = anglestoforward(var_d80b9483a7b08877.angles);
    var_d6ce9b417363979e = vectornormalize(var_d6ce9b417363979e);
    var_93259a67391ac2c8 = targetentity.origin - var_d80b9483a7b08877.origin;
    var_93259a67391ac2c8 = vectornormalize(var_93259a67391ac2c8);
    return vectordot(var_d6ce9b417363979e, var_93259a67391ac2c8) >= fov;
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd0
// Size: 0x63
function function_4b685c24abf694be(civilian, var_7afd86c1af40885b) {
    return civilian.var_7afd86c1af40885b == var_7afd86c1af40885b || isdefined(civilian.var_f73ef0cdee5d001e) && civilian.var_f73ef0cdee5d001e == var_7afd86c1af40885b || isdefined(civilian.var_e032f690711396e6) && civilian.var_e032f690711396e6 == var_7afd86c1af40885b;
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3b
// Size: 0x9c
function function_8ba22addf492e664(civilian, ent) {
    result = 0;
    if (isdefined(civilian)) {
        eyepos = (civilian.origin[0], civilian.origin[1], civilian.origin[2] + level.var_b13f1c7f8e404252.var_fdce0a7f3646918c);
        var_a645210f4ad96adf = ent geteye();
        if (sighttracepassed(eyepos, var_a645210f4ad96adf, 0, civilian.sight_ignore, civilian, 0)) {
            result = 1;
        }
    }
    return result;
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdf
// Size: 0xa3
function function_bf7a1de4139d5af(civilian, ent, time, speed) {
    civilian endon("death");
    civilian function_106bce0aeee91d2c(utility::function_b88f4e5baff057a9(speed));
    civilian function_1c339daaba3f71db(1);
    if (isdefined(level.players) && array_contains(level.players, ent) || ent == level.player) {
        civilian function_5621e511b99964a7(level.player);
        wait(time + 1);
        civilian function_504a5e2df31069a4();
    } else {
        civilian glanceatentity(ent, time, speed);
    }
    civilian function_1c339daaba3f71db(0);
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd89
// Size: 0x15d
function function_51e25764b9a2f1b1(var_899d1d2b08e4c8cc) {
    var_3855202b89328bc2 = 0;
    switch (var_899d1d2b08e4c8cc) {
    case #"hash_5971965ed985a26c":
        var_3855202b89328bc2 = randomintrange(level.var_9958731831312749.var_b42ba1f1aae8d641, level.var_9958731831312749.var_b44e93f1ab0eff2f);
        break;
    case #"hash_c71b112fe04823d6":
        var_3855202b89328bc2 = randomintrange(level.var_9958731831312749.var_1306d89ed2b850ff, level.var_9958731831312749.var_12e3e69ed2922811);
        break;
    case #"hash_4bf33d595d8f4894":
        var_3855202b89328bc2 = randomintrange(level.var_9958731831312749.var_5aa858d7411e83e9, level.var_9958731831312749.var_5a854ad740f81d67);
        break;
    case #"hash_862b9a06fd4c4c8d":
        var_3855202b89328bc2 = randomintrange(level.var_9958731831312749.var_bceea906e00dbe5d, level.var_9958731831312749.var_bccbb306dfe78ca3);
        break;
    case #"hash_3d34b62cda8bac2c":
        var_3855202b89328bc2 = randomintrange(level.var_9958731831312749.var_7684b0649e83c0f, level.var_9958731831312749.var_745390649c1ccc1);
        break;
    default:
        break;
    }
    return var_3855202b89328bc2;
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeee
// Size: 0x2c
function function_309155e57ee0de92(path) {
    if (isdefined(path)) {
        thread function_412f5234020b3c49(path);
    } else {
        function_e6f0084e863e9a4b();
        self notify("party_civ_run");
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf21
// Size: 0x336
function function_fff7117076af2d16(var_cbbdf6bcf5ab31be, maxdistance, var_70dadc532b43fec6, var_24d90d64debefdd4, var_11e63846bef0af01) {
    if (var_70dadc532b43fec6 == "relaxed") {
        return;
    }
    for (var_6ee979218ac554d7 = 0; var_6ee979218ac554d7 < level.var_f62b6e59c0e00d48.civs.size; var_6ee979218ac554d7++) {
        var_a5638903b40c5a21 = level.var_f62b6e59c0e00d48.civs[var_6ee979218ac554d7];
        if (!isdefined(var_a5638903b40c5a21) || var_a5638903b40c5a21 == var_cbbdf6bcf5ab31be) {
            continue;
        }
        if (isdefined(var_a5638903b40c5a21.var_34df90223221b7a6) && isdefined(var_cbbdf6bcf5ab31be.var_a2c8b8008309aae2)) {
            jumpiffalse(level.var_6961d0344027496f[var_a5638903b40c5a21.var_a2c8b8008309aae2] == level.var_6961d0344027496f[var_cbbdf6bcf5ab31be.var_34df90223221b7a6]) LOC_000000f7;
        } else {
        LOC_000000f7:
            if (function_4b685c24abf694be(var_a5638903b40c5a21, var_70dadc532b43fec6)) {
                continue;
            }
            if (level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_70dadc532b43fec6] <= level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_a5638903b40c5a21.var_b2c134a19497e578.var_1532b27e26d5db21]) {
                continue;
            }
            if (var_a5638903b40c5a21.var_b2c134a19497e578.var_e4f4900d6d00346 == 1) {
                continue;
            }
            var_691f481a8bba4062 = 0;
            player = function_47c84e03dcbc5aa7(var_a5638903b40c5a21.origin);
            if (!isdefined(player)) {
                continue;
            }
            if (var_24d90d64debefdd4) {
                var_691f481a8bba4062 = distance(player, var_a5638903b40c5a21.origin);
            } else {
                var_691f481a8bba4062 = distance(var_cbbdf6bcf5ab31be.origin, var_a5638903b40c5a21.origin);
            }
            if (isdefined(maxdistance) && var_691f481a8bba4062 > maxdistance) {
                continue;
            }
            var_a55bc01c545dfc5d = !var_11e63846bef0af01 || function_b1eeb1edab8e23d4(var_a5638903b40c5a21, var_cbbdf6bcf5ab31be, level.var_b13f1c7f8e404252.var_f857ce93fc87458f);
            if (var_a55bc01c545dfc5d) {
                var_a5638903b40c5a21.var_b2c134a19497e578.var_1532b27e26d5db21 = var_70dadc532b43fec6;
                if (level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_70dadc532b43fec6] >= level.var_f62b6e59c0e00d48.var_bcce56724567c4a3["scared"]) {
                    var_a5638903b40c5a21.var_b2c134a19497e578.var_6a8b5cade9b556cf = randomintrange(0, 200);
                } else {
                    var_a5638903b40c5a21.var_b2c134a19497e578.var_6a8b5cade9b556cf = randomintrange(int(level.var_9958731831312749.var_922aa1ced3d997d7), level.var_9958731831312749.var_922aa1ced3d997d7 + int(var_691f481a8bba4062));
                }
                var_a5638903b40c5a21.var_9e065b0d5f81453c = undefined;
                var_a5638903b40c5a21.var_b2c134a19497e578.var_e4f4900d6d00346 = 0;
                var_a5638903b40c5a21.var_e0f99af636c737b = undefined;
                var_a5638903b40c5a21.var_f73ef0cdee5d001e = undefined;
                var_a5638903b40c5a21.var_a2d61fcd0ca0dbb9 = undefined;
                var_a5638903b40c5a21.var_84c1ae8d0dce5970 = undefined;
                var_a5638903b40c5a21.var_e032f690711396e6 = undefined;
                var_a5638903b40c5a21.var_83b37a7080fd5c11 = undefined;
                var_a5638903b40c5a21.var_14c9c06bc882eee8 = undefined;
                var_a5638903b40c5a21.var_9d8893066146a5b6 = 0;
            }
        }
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x125e
// Size: 0x3b6
function function_8fcb3ba9dd0eb394(var_75d604bcb71dddd1, mindistance, var_70dadc532b43fec6) {
    if (var_70dadc532b43fec6 == "relaxed") {
        return;
    }
    if (level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_70dadc532b43fec6] <= level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[level.var_f62b6e59c0e00d48.var_af1d1102ede20fc2]) {
        return;
    }
    level.var_f62b6e59c0e00d48.var_af1d1102ede20fc2 = var_70dadc532b43fec6;
    for (var_6ee979218ac554d7 = 0; var_6ee979218ac554d7 < level.var_f62b6e59c0e00d48.civs.size; var_6ee979218ac554d7++) {
        var_a5638903b40c5a21 = level.var_f62b6e59c0e00d48.civs[var_6ee979218ac554d7];
        if (!isdefined(var_a5638903b40c5a21) || var_a5638903b40c5a21 == var_75d604bcb71dddd1) {
            continue;
        }
        if (isdefined(var_a5638903b40c5a21.var_34df90223221b7a6) && isdefined(var_75d604bcb71dddd1.var_a2c8b8008309aae2)) {
            jumpiffalse(level.var_6961d0344027496f[var_a5638903b40c5a21.var_a2c8b8008309aae2] == level.var_6961d0344027496f[var_75d604bcb71dddd1.var_34df90223221b7a6]) LOC_00000148;
        } else {
        LOC_00000148:
            if (function_4b685c24abf694be(var_a5638903b40c5a21, var_70dadc532b43fec6)) {
                continue;
            }
            var_7f42d6d073c141c9 = distance(var_75d604bcb71dddd1.origin, var_a5638903b40c5a21.origin);
            if (isdefined(mindistance) && var_7f42d6d073c141c9 <= mindistance) {
                continue;
            }
            var_e410824219965002 = "relaxed";
            var_cee1ee42c6b3b053 = 0;
            switch (var_70dadc532b43fec6) {
            case #"hash_dd76edf4ebd198bd":
                if (var_7f42d6d073c141c9 <= 800) {
                    if (randomint(5) <= 2) {
                        var_e410824219965002 = "curious";
                    } else {
                        var_e410824219965002 = "scared";
                    }
                    var_cee1ee42c6b3b053 = randomintrange(int(var_7f42d6d073c141c9), int(2 * var_7f42d6d073c141c9));
                } else {
                    if (randomint(4) <= 2) {
                        var_e410824219965002 = "curious";
                    } else {
                        var_e410824219965002 = "scared";
                    }
                    var_cee1ee42c6b3b053 = randomintrange(int(2 * var_7f42d6d073c141c9), int(4 * var_7f42d6d073c141c9));
                }
                break;
            case #"hash_ea9150ecc8538d74":
                if (var_7f42d6d073c141c9 <= 800) {
                    if (randomint(4) <= 2) {
                        var_e410824219965002 = "scared";
                    } else {
                        var_e410824219965002 = "curious";
                    }
                    var_cee1ee42c6b3b053 = randomintrange(int(var_7f42d6d073c141c9 / 2), int(var_7f42d6d073c141c9));
                } else {
                    var_469bb23c3ef9a2f8 = randomint(10);
                    if (var_469bb23c3ef9a2f8 <= 7) {
                        var_e410824219965002 = "curious";
                    } else {
                        var_e410824219965002 = "scared";
                    }
                    var_cee1ee42c6b3b053 = randomintrange(int(var_7f42d6d073c141c9), int(2 * var_7f42d6d073c141c9));
                }
                break;
            default:
                continue;
            }
            if (var_e410824219965002 != "relaxed") {
                if (function_4b685c24abf694be(var_a5638903b40c5a21, var_e410824219965002)) {
                    continue;
                }
                if (level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_e410824219965002] <= level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_a5638903b40c5a21.var_b2c134a19497e578.var_af1d1102ede20fc2]) {
                    continue;
                }
                var_a5638903b40c5a21.var_b2c134a19497e578.var_af1d1102ede20fc2 = var_e410824219965002;
                var_a5638903b40c5a21.var_b2c134a19497e578.var_ac13962f5c74201c = var_cee1ee42c6b3b053;
                var_a5638903b40c5a21.var_e0f99af636c737b = undefined;
                var_a5638903b40c5a21.var_b2c134a19497e578.var_e4f4900d6d00346 = 0;
                var_a5638903b40c5a21.var_f73ef0cdee5d001e = undefined;
                var_a5638903b40c5a21.var_a2d61fcd0ca0dbb9 = undefined;
                var_a5638903b40c5a21.var_84c1ae8d0dce5970 = undefined;
                var_a5638903b40c5a21.var_e032f690711396e6 = undefined;
                var_a5638903b40c5a21.var_83b37a7080fd5c11 = undefined;
                var_a5638903b40c5a21.var_14c9c06bc882eee8 = undefined;
                var_a5638903b40c5a21.var_9d8893066146a5b6 = 0;
            }
        }
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161b
// Size: 0x359
function function_db0d38fa7aab73f3(civilian) {
    time = gettime();
    player = function_47c84e03dcbc5aa7(civilian.origin);
    dist = distance(civilian.origin, player.origin);
    var_78db04a2c5454859 = randomintrange(0, int(level.var_9958731831312749.var_fd4dfd13f9e063c0 / 2));
    if (!isdefined(civilian.var_cd4296a99a7e9e7b)) {
        civilian.var_cd4296a99a7e9e7b = spawnstruct();
        if (isai(civilian)) {
            if (civilian.var_7afd86c1af40885b == "relaxed") {
                civilian.var_cd4296a99a7e9e7b.var_6d30df7910778c5c = time + randomintrange(var_78db04a2c5454859, var_78db04a2c5454859 + int(dist));
                civilian.var_cd4296a99a7e9e7b.var_5b30cb3c0cc4fc14 = civilian.var_cd4296a99a7e9e7b.var_6d30df7910778c5c + level.var_9958731831312749.var_fd4dfd13f9e063c0;
            } else {
                civilian.var_cd4296a99a7e9e7b.var_5b30cb3c0cc4fc14 = time + randomintrange(int(dist / 2), int(dist));
            }
        } else if (civilian.var_7afd86c1af40885b == "relaxed") {
            civilian.var_cd4296a99a7e9e7b.var_5b30cb3c0cc4fc14 = time + randomintrange(var_78db04a2c5454859, var_78db04a2c5454859 + int(dist)) + level.var_9958731831312749.var_fd4dfd13f9e063c0;
        } else {
            civilian.var_cd4296a99a7e9e7b.var_5b30cb3c0cc4fc14 = time + randomintrange(int(dist / 2), int(dist));
        }
    } else if (isdefined(civilian.var_cd4296a99a7e9e7b)) {
        if (isdefined(civilian.var_cd4296a99a7e9e7b.var_6d30df7910778c5c) && time >= civilian.var_cd4296a99a7e9e7b.var_6d30df7910778c5c) {
            civilian.var_b2c134a19497e578.var_e4f4900d6d00346 = 1;
            if (isai(civilian)) {
                civilian thread function_bf7a1de4139d5af(civilian, player, level.var_9958731831312749.var_ada3cdb8ba2cd2ec, level.var_9958731831312749.var_de22934892b70a4e);
            }
            civilian.var_cd4296a99a7e9e7b.var_6d30df7910778c5c = undefined;
        } else if (time >= civilian.var_cd4296a99a7e9e7b.var_5b30cb3c0cc4fc14) {
            civilian.var_a2d61fcd0ca0dbb9 = time;
            civilian.var_f73ef0cdee5d001e = "scared";
            civilian.var_84c1ae8d0dce5970 = 0;
            civilian._blackboard.var_610cb18ecc1af719 = player;
            civilian.var_b2c134a19497e578.var_e4f4900d6d00346 = 0;
            civilian.var_cd4296a99a7e9e7b = undefined;
            civilian.var_9d8893066146a5b6 = 1;
            function_fff7117076af2d16(civilian, level.var_9958731831312749.var_4bee8d2b5a70f239, "scared", 0, 0);
            function_8fcb3ba9dd0eb394(player, level.var_b13f1c7f8e404252.var_8f1c451c993982b6, "scared");
        }
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x197b
// Size: 0x4aa
function function_5bc5a2142d93c46e(civilian, var_75d604bcb71dddd1) {
    time = gettime();
    dist = distance(civilian.origin, var_75d604bcb71dddd1.origin);
    if (istrue(civilian.var_9d8893066146a5b6)) {
        return;
    }
    player = function_47c84e03dcbc5aa7(civilian.origin);
    if (civilian.var_e909843b1034ccc2.var_56d6f93840cb5f45 && function_32d74b97e987274c(player, civilian, level.var_b13f1c7f8e404252.var_7e14e46e198de798, level.var_b13f1c7f8e404252.var_f857ce93fc87458f)) {
        var_80974f880973e4b6 = civilian.var_85b25c3e99617524 <= level.var_b13f1c7f8e404252.var_e420701002f63dac && function_b1eeb1edab8e23d4(player, civilian, level.var_b13f1c7f8e404252.fov);
        if (var_80974f880973e4b6) {
            if (isdefined(civilian.var_f73ef0cdee5d001e) && civilian.var_f73ef0cdee5d001e == "panicked") {
                return;
            }
            if (civilian.var_7afd86c1af40885b == "cower") {
                level thread function_d383856f09f7b8ac(player);
                return;
            }
            if (civilian.var_7afd86c1af40885b == "panicked") {
                if (!isdefined(civilian.var_ee1569ca7e841108)) {
                    civilian.var_ee1569ca7e841108 = time + randomintrange(int(dist), int(2 * dist));
                    return;
                }
                if (time >= civilian.var_ee1569ca7e841108) {
                    civilian.var_a2d61fcd0ca0dbb9 = time;
                    civilian.var_f73ef0cdee5d001e = "cower";
                    civilian.var_84c1ae8d0dce5970 = 0;
                    civilian.var_ee1569ca7e841108 = undefined;
                    civilian._blackboard.var_610cb18ecc1af719 = player;
                    civilian.var_b2c134a19497e578.var_e4f4900d6d00346 = 0;
                    civilian.var_cd4296a99a7e9e7b = undefined;
                    civilian.var_9d8893066146a5b6 = 1;
                    level thread function_d383856f09f7b8ac(player);
                    return;
                }
            } else {
                civilian.var_a2d61fcd0ca0dbb9 = time + randomintrange(0, int(dist));
                civilian.var_f73ef0cdee5d001e = "panicked";
                civilian.var_84c1ae8d0dce5970 = 0;
            }
            if (isdefined(civilian.var_e032f690711396e6)) {
                civilian.var_e032f690711396e6 = undefined;
                civilian.var_83b37a7080fd5c11 = undefined;
                civilian.var_14c9c06bc882eee8 = undefined;
            }
            civilian.var_b2c134a19497e578.var_e4f4900d6d00346 = 0;
            civilian.var_cd4296a99a7e9e7b = undefined;
            civilian.var_9d8893066146a5b6 = 1;
            function_fff7117076af2d16(civilian, level.var_9958731831312749.var_a2fe99c7d215229e, "scared", 0, 0);
            function_8fcb3ba9dd0eb394(player, level.var_b13f1c7f8e404252.var_8f1c451c993982b6, "panicked");
        } else {
            civilian.var_ee1569ca7e841108 = undefined;
            if (function_4b685c24abf694be(civilian, "scared")) {
                return;
            }
            function_db0d38fa7aab73f3(civilian);
        }
    } else {
        if (civilian.var_b2c134a19497e578.var_1532b27e26d5db21 != "relaxed" || civilian.var_b2c134a19497e578.var_af1d1102ede20fc2 != "relaxed") {
            return;
        }
        if (function_b1eeb1edab8e23d4(player, civilian, level.var_b13f1c7f8e404252.var_7e14e46e198de798)) {
            return;
        }
        if (function_4b685c24abf694be(civilian, "curious")) {
            return;
        }
        multiplier = 3;
        var_9b51e1e2bf192031 = anglestoforward(civilian.angles);
        var_9b51e1e2bf192031 = vectornormalize(var_9b51e1e2bf192031);
        var_f7c4b15f897205c0 = player.origin - civilian.origin;
        var_f7c4b15f897205c0 = vectornormalize(var_f7c4b15f897205c0);
        var_473b29060667cc4a = 1 - vectordot(var_9b51e1e2bf192031, var_f7c4b15f897205c0);
        civilian.var_a2d61fcd0ca0dbb9 = time + randomintrange(int(dist), int(2 * dist)) + var_473b29060667cc4a * multiplier * level.var_9958731831312749.var_6026b57b0b875efc;
        civilian.var_f73ef0cdee5d001e = "curious";
        civilian.var_84c1ae8d0dce5970 = 0;
        civilian.var_b2c134a19497e578.var_e4f4900d6d00346 = 0;
        civilian.var_cd4296a99a7e9e7b = undefined;
        civilian.var_9d8893066146a5b6 = 1;
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e2c
// Size: 0x340
function function_2e4bf288de5058a5(civilian, var_54049822cd45f4b8) {
    if (istrue(civilian.var_ab39b6ca764a6695)) {
        return;
    }
    if (istrue(civilian.var_e909843b1034ccc2.var_56d6f93840cb5f45) || istrue(civilian.var_e909843b1034ccc2.var_ee72620ac1467e7f)) {
        time = gettime();
        player = function_47c84e03dcbc5aa7(civilian.origin);
        if (!isdefined(player)) {
            return;
        }
        if (!isdefined(civilian.var_c637a07b110d6d1a)) {
            civilian.var_c637a07b110d6d1a = spawnstruct();
            if (isai(civilian)) {
                civilian.var_c637a07b110d6d1a.var_821cc2d0b3a62578 = time + randomintrange(500, 1000);
                civilian.var_c637a07b110d6d1a.var_5b30cb3c0cc4fc14 = time + randomintrange(6000, 7000);
            } else {
                civilian.var_c637a07b110d6d1a.var_5b30cb3c0cc4fc14 = time + randomintrange(1500, 3000);
            }
        } else if (isdefined(civilian.var_c637a07b110d6d1a)) {
            if (isdefined(civilian.var_c637a07b110d6d1a.var_6d30df7910778c5c) && time >= civilian.var_c637a07b110d6d1a.var_6d30df7910778c5c) {
                civilian.var_b2c134a19497e578.var_e4f4900d6d00346 = 1;
                if (isai(civilian)) {
                    civilian thread function_bf7a1de4139d5af(civilian, player, level.var_9958731831312749.var_ada3cdb8ba2cd2ec, level.var_9958731831312749.var_55beb89839cbe08b);
                }
                civilian.var_c637a07b110d6d1a.var_6d30df7910778c5c = undefined;
            } else if (isdefined(civilian.var_c637a07b110d6d1a.var_821cc2d0b3a62578) && time >= civilian.var_c637a07b110d6d1a.var_821cc2d0b3a62578) {
                civilian.var_b2c134a19497e578.var_e4f4900d6d00346 = 1;
                if (isai(civilian)) {
                    civilian thread function_bf7a1de4139d5af(civilian, player, level.var_9958731831312749.var_44b96437c2e7f624, level.var_9958731831312749.var_de22934892b70a4e);
                }
                civilian.var_c637a07b110d6d1a.var_821cc2d0b3a62578 = undefined;
            } else if (time >= civilian.var_c637a07b110d6d1a.var_5b30cb3c0cc4fc14) {
                if (var_54049822cd45f4b8) {
                    civilian.var_a2d61fcd0ca0dbb9 = time;
                    civilian.var_f73ef0cdee5d001e = "staring";
                    civilian.var_84c1ae8d0dce5970 = 0;
                    civilian.var_9d8893066146a5b6 = 1;
                    civilian._blackboard.var_610cb18ecc1af719 = player;
                }
                civilian.var_b2c134a19497e578.var_e4f4900d6d00346 = 0;
                civilian.var_c637a07b110d6d1a = undefined;
                if (var_54049822cd45f4b8) {
                    function_fff7117076af2d16(civilian, level.var_9958731831312749.var_30f007ac9a8e642e, "staring", 0, 1);
                }
            }
        }
    } else if (isdefined(civilian.var_c637a07b110d6d1a)) {
        civilian.var_c637a07b110d6d1a = undefined;
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2173
// Size: 0x151
function function_35f7191a1541ef00(civilian, var_75d604bcb71dddd1) {
    civilian.var_e909843b1034ccc2.var_21965e18b854f978 = undefined;
    if (civilian.var_7afd86c1af40885b != "relaxed" || istrue(civilian.var_c419286e653edc35)) {
        return;
    }
    if (function_b1eeb1edab8e23d4(var_75d604bcb71dddd1, civilian, level.var_b13f1c7f8e404252.var_be89e0f4bf70ed43)) {
        check = 0;
        if (!function_b1eeb1edab8e23d4(civilian, var_75d604bcb71dddd1, level.var_b13f1c7f8e404252.var_7e14e46e198de798)) {
            if (isdefined(civilian.var_e909843b1034ccc2.var_dd42e0cfcc2298aa)) {
                return;
            }
            if (!isdefined(civilian.var_e909843b1034ccc2.var_ee72620ac1467e7f)) {
                civilian.var_e909843b1034ccc2.var_ee72620ac1467e7f = 0;
            }
            level.var_b13f1c7f8e404252.var_76448df574c47eca = function_6cf786a6cf335cb9(level.var_b13f1c7f8e404252.var_76448df574c47eca, civilian);
            civilian.var_e909843b1034ccc2.var_dd42e0cfcc2298aa = 1;
        } else {
            civilian.var_e909843b1034ccc2.var_56d6f93840cb5f45 = function_8ba22addf492e664(civilian, var_75d604bcb71dddd1);
            function_2e4bf288de5058a5(civilian, 1);
        }
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22cb
// Size: 0x50
function function_8bee41bbdbe247f4(civilian, var_75d604bcb71dddd1) {
    civilian.var_e909843b1034ccc2.var_21965e18b854f978 = undefined;
    civilian.var_e909843b1034ccc2.var_56d6f93840cb5f45 = function_8ba22addf492e664(civilian, var_75d604bcb71dddd1);
    function_5bc5a2142d93c46e(civilian, var_75d604bcb71dddd1);
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2322
// Size: 0x370
function function_a1469580c494459c(civilian) {
    time = gettime();
    player = function_47c84e03dcbc5aa7(civilian.origin);
    if (!isdefined(player)) {
        return;
    }
    dist = distance(civilian.origin, player.origin);
    var_53abacdb770d946a = abs(civilian.origin[2] - player.origin[2]);
    if (var_53abacdb770d946a > level.var_f62b6e59c0e00d48.var_e2b778b4a4a266f5) {
        return;
    }
    var_aada733a877f36ee = civilian.var_b2c134a19497e578.var_6a8b5cade9b556cf;
    if (!isdefined(civilian.var_9e065b0d5f81453c)) {
        civilian.var_9e065b0d5f81453c = spawnstruct();
        if (isai(civilian)) {
            if (civilian.var_7afd86c1af40885b == "relaxed") {
                civilian.var_9e065b0d5f81453c.var_6d30df7910778c5c = time + var_aada733a877f36ee;
                civilian.var_9e065b0d5f81453c.var_5b30cb3c0cc4fc14 = civilian.var_9e065b0d5f81453c.var_6d30df7910778c5c + var_aada733a877f36ee;
            } else {
                civilian.var_9e065b0d5f81453c.var_5b30cb3c0cc4fc14 = time + randomintrange(int(dist / 2), int(dist));
            }
        } else if (civilian.var_7afd86c1af40885b == "relaxed") {
            civilian.var_9e065b0d5f81453c.var_5b30cb3c0cc4fc14 = time + randomintrange(var_aada733a877f36ee, var_aada733a877f36ee + int(dist)) + level.var_9958731831312749.var_922aa1ced3d997d7;
        } else {
            civilian.var_9e065b0d5f81453c.var_5b30cb3c0cc4fc14 = time + randomintrange(int(dist / 2), int(dist));
        }
    } else if (isdefined(civilian.var_9e065b0d5f81453c.var_6d30df7910778c5c)) {
        if (time >= civilian.var_9e065b0d5f81453c.var_6d30df7910778c5c) {
            civilian.var_b2c134a19497e578.var_e4f4900d6d00346 = 1;
            if (isai(civilian)) {
                civilian thread function_bf7a1de4139d5af(civilian, player, level.var_9958731831312749.var_ada3cdb8ba2cd2ec, 0.2);
            }
            civilian.var_9e065b0d5f81453c.var_6d30df7910778c5c = undefined;
        }
    } else if (isdefined(civilian.var_9e065b0d5f81453c.var_5b30cb3c0cc4fc14)) {
        if (time >= civilian.var_9e065b0d5f81453c.var_5b30cb3c0cc4fc14) {
            civilian.var_a2d61fcd0ca0dbb9 = time;
            civilian.var_f73ef0cdee5d001e = civilian.var_b2c134a19497e578.var_1532b27e26d5db21;
            civilian.var_84c1ae8d0dce5970 = 0;
            civilian._blackboard.var_610cb18ecc1af719 = player;
            civilian.var_9e065b0d5f81453c = undefined;
            civilian.var_9d8893066146a5b6 = 1;
            civilian.var_b2c134a19497e578.var_1532b27e26d5db21 = "relaxed";
        }
    } else {
        civilian.var_9e065b0d5f81453c = undefined;
        civilian.var_b2c134a19497e578.var_1532b27e26d5db21 = "relaxed";
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2699
// Size: 0x402
function function_59e85ddec8976510(civilian) {
    time = gettime();
    player = function_47c84e03dcbc5aa7(civilian.origin);
    if (!isdefined(player)) {
        return;
    }
    dist = distance(civilian.origin, player.origin);
    var_53abacdb770d946a = abs(civilian.origin[2] - player.origin[2]);
    if (var_53abacdb770d946a > level.var_f62b6e59c0e00d48.var_e2b778b4a4a266f5) {
        return;
    }
    if (!isdefined(civilian.var_e0f99af636c737b)) {
        civilian.var_e0f99af636c737b = spawnstruct();
        if (isai(civilian)) {
            if (civilian.var_7afd86c1af40885b == "relaxed") {
                civilian.var_e0f99af636c737b.var_6d30df7910778c5c = time + randomintrange(level.var_9958731831312749.var_fd4dfd13f9e063c0, level.var_9958731831312749.var_fd4dfd13f9e063c0 + int(dist));
                civilian.var_e0f99af636c737b.var_5b30cb3c0cc4fc14 = civilian.var_e0f99af636c737b.var_6d30df7910778c5c + level.var_9958731831312749.var_fd4dfd13f9e063c0 + civilian.var_b2c134a19497e578.var_ac13962f5c74201c;
            } else {
                civilian.var_e0f99af636c737b.var_5b30cb3c0cc4fc14 = time + civilian.var_b2c134a19497e578.var_ac13962f5c74201c;
            }
        } else if (civilian.var_7afd86c1af40885b == "relaxed") {
            civilian.var_e0f99af636c737b.var_5b30cb3c0cc4fc14 = time + randomintrange(level.var_9958731831312749.var_fd4dfd13f9e063c0, level.var_9958731831312749.var_fd4dfd13f9e063c0 + int(dist)) + level.var_9958731831312749.var_fd4dfd13f9e063c0 + civilian.var_b2c134a19497e578.var_ac13962f5c74201c;
        } else {
            civilian.var_e0f99af636c737b.var_5b30cb3c0cc4fc14 = time + civilian.var_b2c134a19497e578.var_ac13962f5c74201c;
        }
    } else if (isdefined(civilian.var_e0f99af636c737b)) {
        if (isdefined(civilian.var_e0f99af636c737b.var_6d30df7910778c5c)) {
            if (time >= civilian.var_e0f99af636c737b.var_6d30df7910778c5c) {
                civilian.var_b2c134a19497e578.var_e4f4900d6d00346 = 1;
                if (isai(civilian)) {
                    civilian thread function_bf7a1de4139d5af(civilian, player, level.var_9958731831312749.var_ada3cdb8ba2cd2ec, level.var_9958731831312749.var_de22934892b70a4e);
                }
                civilian.var_e0f99af636c737b.var_6d30df7910778c5c = undefined;
            }
        } else if (isdefined(civilian.var_e0f99af636c737b.var_5b30cb3c0cc4fc14)) {
            if (time >= civilian.var_e0f99af636c737b.var_5b30cb3c0cc4fc14) {
                civilian.var_a2d61fcd0ca0dbb9 = time;
                civilian.var_f73ef0cdee5d001e = civilian.var_b2c134a19497e578.var_af1d1102ede20fc2;
                civilian.var_84c1ae8d0dce5970 = 0;
                civilian._blackboard.var_610cb18ecc1af719 = player;
                civilian.var_e0f99af636c737b = undefined;
                civilian.var_9d8893066146a5b6 = 1;
                civilian.var_b2c134a19497e578.var_af1d1102ede20fc2 = "relaxed";
            }
        } else {
            civilian.var_e0f99af636c737b = undefined;
            civilian.var_b2c134a19497e578.var_af1d1102ede20fc2 = "relaxed";
        }
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2aa2
// Size: 0xbf
function function_60798c1c9231aa81(civilian) {
    civilian.var_f73ef0cdee5d001e = undefined;
    civilian.var_a2d61fcd0ca0dbb9 = undefined;
    civilian.var_84c1ae8d0dce5970 = undefined;
    civilian.var_e032f690711396e6 = undefined;
    civilian.var_83b37a7080fd5c11 = undefined;
    civilian.var_14c9c06bc882eee8 = undefined;
    civilian.var_a2d61fcd0ca0dbb9 = gettime() + function_51e25764b9a2f1b1("medium");
    civilian.var_f73ef0cdee5d001e = "panicked";
    civilian.var_84c1ae8d0dce5970 = 0;
    civilian.var_9d8893066146a5b6 = 1;
    civilian.var_cd4296a99a7e9e7b = undefined;
    civilian.var_e0f99af636c737b = undefined;
    civilian.var_9e065b0d5f81453c = undefined;
    function_35eca80b3823c8b();
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b68
// Size: 0xb7
function function_e0bae58f26ee1323() {
    self endon("death");
    level endon("civreact_terminate");
    self.var_b2c134a19497e578.var_91ab28d2cb1639ce = 1;
    if (self codemoverequested()) {
        self waittill("goal");
    }
    if (!(self isinscriptedstate() || namespace_28edc79fcf2fe234::bb_isanimscripted()) && isdefined(self.var_be5b4c59c12df3a8) && isdefined(self.var_8effd09d2c6077d7)) {
        namespace_aebb27832287cd3a::cap_start(self.var_be5b4c59c12df3a8, self.var_8effd09d2c6077d7);
    } else {
        self.var_be5b4c59c12df3a8 = undefined;
        self.var_8effd09d2c6077d7 = undefined;
        self.var_35336d0f72f57871 = 0;
    }
    self.var_b2c134a19497e578.var_91ab28d2cb1639ce = 0;
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c26
// Size: 0xd3
function function_e6f0084e863e9a4b() {
    self.var_b2c134a19497e578.var_54e869f8deb4f44f = 1;
    function_405bf7cde917b70e(self);
    if (isdefined(self.unittype) && self.unittype == "civilian" && isai(self)) {
        utility::demeanor_override("frantic");
    }
    self.goalradius = 120;
    self.patrol_stop = 0;
    self.disableexits = 0;
    self._blackboard.var_b9fe3860c557e5d6 = 1;
    self.doavoidanceblocking = 0;
    self.dosharpturnspeedscaling = 0;
    var_8ba91cc72b54af6c = randomintrange(180, 220);
    set_movement_speed(var_8ba91cc72b54af6c);
    self.exitspeedtarget = var_8ba91cc72b54af6c;
    wait(randomfloatrange(0.05, 2));
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d00
// Size: 0x82
function function_2871e87dbd100e26(path) {
    newnode = path;
    patharray = [];
    while (1) {
        patharray[patharray.size] = newnode;
        if (isdefined(newnode.target)) {
            nodes = getstructarray(newnode.target, "targetname");
            if (nodes.size == 1) {
                newnode = nodes[0];
            } else {
                newnode = random(nodes);
            }
        } else {
            break;
        }
    }
    return patharray;
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d8a
// Size: 0x41
function function_dc3866343d3f5b15() {
    self waittill("cap_exit_completed");
    if (istrue(level.var_a24e8dafc9fac7db)) {
        self setoverridearchetype("default", "civilian_1");
        level.var_a24e8dafc9fac7db = 0;
    } else {
        level.var_a24e8dafc9fac7db = 1;
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd2
// Size: 0x1e6
function function_639ac5f87833e45c(path, patharray) {
    percentage = 0;
    foreach (node in patharray) {
        dist = 40;
        if (isdefined(node.radius)) {
            dist = node.radius;
        }
        pointa = node.origin + anglestoleft(node.angles) * dist;
        pointb = node.origin + anglestoright(node.angles) * dist;
        if (node == path) {
            origin = pointonsegmentnearesttopoint(pointa, pointb, self.origin);
            origin = self getclosestreachablepointonnavmesh(origin);
            var_17d4b717cd3df404 = length(pointa - pointb);
            var_15eac16add50fa0b = length(pointa - origin);
            percentage = var_15eac16add50fa0b / var_17d4b717cd3df404;
        } else {
            var_71ceb6d7f7e4ee6d = dist * 2 * percentage;
            origin = pointa + anglestoright(node.angles) * var_71ceb6d7f7e4ee6d;
            origin = self getclosestreachablepointonnavmesh(origin);
        }
        /#
            if (getdvarint(@"hash_4323dba64c360cf0") == 1) {
                thread function_99210893ea5ea5f7(pointa, pointb, origin);
            }
        #/
        self.last_set_goalnode = undefined;
        self.last_set_goalpos = origin;
        self.last_set_goalent = undefined;
        self setgoalpos(origin);
        if (getdvarint(@"hash_126bbee19522aa10") == 1) {
            thread function_dc3866343d3f5b15();
        }
        self waittill("goal");
        /#
            self notify("small");
        #/
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fbf
// Size: 0x371
function function_1c29806b1e483c2d(sorted, var_2def26b58710b5d1, var_5cb080bc298f2db0) {
    player = function_47c84e03dcbc5aa7(self.origin);
    if (!isdefined(player)) {
        return undefined;
    }
    left = anglestoleft(player.angles);
    forward = anglestoforward(player.angles);
    var_3d978a255f632a5 = self.origin - player.origin;
    var_c6dc218d10e0e5b5 = vectordot(left, var_3d978a255f632a5);
    var_c31c9ae87a14cf4d = vectordot(var_3d978a255f632a5, forward) >= 0;
    var_ec4db30dd8263b55 = 0.65;
    var_491b91a3a64265cf = 0.1;
    path = undefined;
    foreach (node in sorted) {
        if (istrue(var_5cb080bc298f2db0) && isdefined(node.script_parameters) && node.script_parameters != "middle") {
            continue;
        }
        var_625873782c3eabbd = vectornormalize(node.origin - player.origin);
        var_398607f86ce55d6d = vectordot(left, var_625873782c3eabbd);
        dot = vectordot(var_625873782c3eabbd, forward);
        if (var_2def26b58710b5d1) {
            var_6fbe5a48e90fd7da = var_c31c9ae87a14cf4d && dot > var_491b91a3a64265cf || !var_c31c9ae87a14cf4d && dot < -1 * var_491b91a3a64265cf;
            if (!var_6fbe5a48e90fd7da) {
                continue;
            }
            var_935bc598929fcdee = anglestoforward(self.angles);
            var_fa909a27b74a724c = vectornormalize(node.origin - self.origin);
            if (vectordot(var_935bc598929fcdee, var_fa909a27b74a724c) > -0.25) {
                continue;
            }
        } else {
            var_cf7879588dd7d9d1 = dot < var_ec4db30dd8263b55;
            var_cf7876588dd7d338 = dot > var_491b91a3a64265cf;
            if (var_c6dc218d10e0e5b5 * var_398607f86ce55d6d < 0 || !(var_cf7879588dd7d9d1 && var_cf7876588dd7d338)) {
                continue;
            }
        }
        var_7bcee75adcde5bfd = vectornormalize(player.origin - node.origin);
        nodeforward = anglestoforward(node.angles);
        var_c259d082033e76a4 = vectordot(var_7bcee75adcde5bfd, nodeforward);
        if (var_c259d082033e76a4 > 0) {
            continue;
        }
        if (distance(node.origin, player.origin) < distance(self.origin, player.origin)) {
            continue;
        }
        dist = distancesquared(player.origin, node.origin);
        if (dist <= level.var_72f8a6a3656c27ba["player"]) {
            continue;
        }
        /#
            if (getdvarint(@"hash_4323dba64c360cf0") == 1) {
                thread function_6aa255201d6332f9(dot, node);
            }
        #/
        path = node;
        break;
    }
    return path;
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3338
// Size: 0x9b
function function_a9e8cc25edfd1488(var_2def26b58710b5d1) {
    if (istrue(self.var_b2c134a19497e578.var_54e869f8deb4f44f)) {
        return undefined;
    }
    path = undefined;
    paths = getstructarray("panicked_path", "script_noteworthy");
    if (!isdefined(paths)) {
        return undefined;
    }
    var_5cb080bc298f2db0 = 0;
    if (var_2def26b58710b5d1 && randomint(10) <= 8) {
        var_5cb080bc298f2db0 = 1;
    }
    sorted = sortbydistance(paths, self.origin);
    path = function_1c29806b1e483c2d(sorted, var_2def26b58710b5d1, var_5cb080bc298f2db0);
    return path;
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33db
// Size: 0x5e
function function_412f5234020b3c49(path) {
    if (!isdefined(path) || isdefined(self.var_b2c134a19497e578.var_ba47d2c54ae6364d) || !isai(self)) {
        return;
    }
    function_e6f0084e863e9a4b();
    patharray = function_2871e87dbd100e26(path);
    function_639ac5f87833e45c(path, patharray);
    self delete();
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3440
// Size: 0xf3
function function_4585228f63bec744() {
    level endon("civreact_terminate");
    self endon("civ_deregister");
    while (1) {
        var_375c5ff0a6f238ac = var_7176b6a64d4d823b = self waittill("bulletwhizby");
        var_6ee979218ac554d7 = array_find(level.var_f62b6e59c0e00d48.civs, self);
        if (gettime() < level.var_f62b6e59c0e00d48.var_a7b0a5f16322cf86[var_6ee979218ac554d7]) {
            level.var_f62b6e59c0e00d48.var_a7b0a5f16322cf86[var_6ee979218ac554d7] = gettime() + level.var_f62b6e59c0e00d48.var_a8bf30fbb992eb1;
            continue;
        }
        level.var_f62b6e59c0e00d48.var_a7b0a5f16322cf86[var_6ee979218ac554d7] = gettime() + level.var_f62b6e59c0e00d48.var_a8bf30fbb992eb1;
        level.var_f62b6e59c0e00d48.var_4c000e21703586f[var_6ee979218ac554d7] = 1;
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x353a
// Size: 0x70
function function_f44bcfc1647b23f() {
    level endon("civreact_terminate");
    self endon("civ_deregister");
    self endon("death");
    while (1) {
        var_a5638903b40c5a21 = level waittill("civ_death");
        if (isdefined(var_a5638903b40c5a21)) {
            if (distance(self.origin, var_a5638903b40c5a21.origin) < level.var_f62b6e59c0e00d48.var_30e8e171b32c1d5c) {
                function_1ce443834cd6b133();
                return;
            }
        }
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35b1
// Size: 0x42
function function_1ce443834cd6b133() {
    self.var_b2c134a19497e578.var_2141f7cb7ff397a6 = 1;
    self.var_7afd86c1af40885b = "panicked";
    var_106443ea359fca35 = function_a9e8cc25edfd1488(1);
    function_309155e57ee0de92(var_106443ea359fca35);
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35fa
// Size: 0x22
function function_8cbbda93904d3a65() {
    level endon("civreact_terminate");
    self endon("civ_deregister");
    self waittill("death");
    level notify("civ_death", self);
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3623
// Size: 0x87
function function_6aa255201d6332f9(dot, path) {
    /#
        self endon("cellPhoneGuy");
        while (1) {
            line(self.origin, path.origin, (1, 1, 1), 1, 0, 1);
            print3d(path.origin + (0, 0, 5), dot, (1, 1, 1), 1, 1, 0, 1);
            waitframe();
        }
    #/
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x36b1
// Size: 0x8b
function function_99210893ea5ea5f7(pointa, pointb, origin) {
    /#
        self endon("cellPhoneGuy");
        self endon("small");
        while (1) {
            line(pointa, pointb, (1, 1, 1), 1, 0, 1);
            line(self.origin, origin, (0, 1, 0), 1, 0, 1);
            sphere(origin, 10, (1, 0, 0), 0, 1);
            waitframe();
        }
    #/
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3743
// Size: 0x294
function function_d383856f09f7b8ac(var_75d604bcb71dddd1) {
    if (isdefined(level.var_f62b6e59c0e00d48.var_e88ea00698d6a285)) {
        return;
    }
    level.var_f62b6e59c0e00d48.var_e88ea00698d6a285 = 1;
    time = gettime();
    var_f51f8fde5588634a = randomint(2);
    for (var_6ee979218ac554d7 = 0; var_6ee979218ac554d7 < level.var_f62b6e59c0e00d48.civs.size; var_6ee979218ac554d7++) {
        var_a5638903b40c5a21 = level.var_f62b6e59c0e00d48.civs[var_6ee979218ac554d7];
        if (!isai(var_a5638903b40c5a21)) {
            continue;
        }
        if (var_a5638903b40c5a21.var_b2c134a19497e578.var_a576b24ef9af6865 > 0) {
            continue;
        }
        dist = distance(var_75d604bcb71dddd1.origin, var_a5638903b40c5a21.origin);
        if (dist > level.var_9958731831312749.var_7c9588454c703131) {
            continue;
        }
        if (level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_a5638903b40c5a21.var_7afd86c1af40885b] < level.var_f62b6e59c0e00d48.var_bcce56724567c4a3["scared"] || function_4b685c24abf694be(var_a5638903b40c5a21, "cower")) {
            continue;
        }
        if (function_b1eeb1edab8e23d4(var_75d604bcb71dddd1, var_a5638903b40c5a21, level.var_b13f1c7f8e404252.var_2626acf65f81f6a9)) {
            continue;
        }
        var_3c6560027930bc25 = function_b1eeb1edab8e23d4(var_75d604bcb71dddd1, var_a5638903b40c5a21, 0.7);
        if (!var_3c6560027930bc25) {
            continue;
        }
        var_a5638903b40c5a21.var_b2c134a19497e578.var_a576b24ef9af6865 = time + level.var_f62b6e59c0e00d48.var_a576b24ef9af6865;
        if (var_f51f8fde5588634a > 1) {
            continue;
        }
        multiplier = dist / level.var_9958731831312749.var_7c9588454c703131;
        rand = (randomint(10) + 1) * multiplier;
        if (rand <= 0.2 && randomint(5) <= 3) {
            continue;
        }
        var_106443ea359fca35 = var_a5638903b40c5a21 function_a9e8cc25edfd1488(0);
        function_309155e57ee0de92(var_106443ea359fca35);
        var_f51f8fde5588634a++;
        var_a5638903b40c5a21.var_b2c134a19497e578.var_e4f4900d6d00346 = 0;
        var_a5638903b40c5a21.var_cd4296a99a7e9e7b = undefined;
        var_a5638903b40c5a21.var_9d8893066146a5b6 = 0;
        function_35eca80b3823c8b();
    }
    level.var_f62b6e59c0e00d48.var_e88ea00698d6a285 = undefined;
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39de
// Size: 0x689
function function_384465a3a8aa24f7(event) {
    var_85b25c3e99617524 = distance(self.origin, event.position);
    var_106443ea359fca35 = function_a9e8cc25edfd1488(1);
    var_9e3e2c5efb0667ae = getdvarint(@"hash_18f4855098e19194") == 1 && isai(self) && var_85b25c3e99617524 >= 800;
    var_92330e20f15dc14 = getdvarint(@"hash_18f4855098e19194") == 1 && isai(self) && !function_4b685c24abf694be(self, "cower") && self.var_b2c134a19497e578.var_a576b24ef9af6865 <= 0;
    var_1919d7729da23373 = function_b1eeb1edab8e23d4(event.originator, self, level.var_b13f1c7f8e404252.var_2626acf65f81f6a9);
    self.var_dd25f55f775fa187 = event.originator.origin;
    self.var_74e455cfaa148985 = event.originator;
    var_801eb63f7c1178cf = getdvarint(@"hash_e605a179ccf872", 500);
    var_455adacb086acebd = getdvarint(@"hash_79ead190d52f34da", 1000);
    var_c5f83ffc76c21554 = getdvarint(@"hash_13259e908967df41", 4000);
    if (var_85b25c3e99617524 <= var_801eb63f7c1178cf) {
        if (var_92330e20f15dc14 && var_1919d7729da23373 && randomint(10) <= 7) {
            function_309155e57ee0de92(var_106443ea359fca35);
        } else if (self.var_7afd86c1af40885b == "cower") {
            if (randomint(10) <= 3) {
                self.var_f73ef0cdee5d001e = "cower";
            }
        } else if (self.var_7afd86c1af40885b != "panicked" && self.var_7afd86c1af40885b != "scared") {
            var_469bb23c3ef9a2f8 = randomint(10);
            if (var_469bb23c3ef9a2f8 <= 2) {
                self.var_f73ef0cdee5d001e = "scared";
            } else if (var_9e3e2c5efb0667ae && var_469bb23c3ef9a2f8 == 4) {
                function_309155e57ee0de92(var_106443ea359fca35);
            } else {
                self.var_f73ef0cdee5d001e = "panicked";
            }
        } else if (self.var_7afd86c1af40885b != "panicked") {
            if (var_9e3e2c5efb0667ae && randomint(4) == 0) {
                function_309155e57ee0de92(var_106443ea359fca35);
            } else {
                self.var_f73ef0cdee5d001e = "panicked";
            }
        } else {
            var_469bb23c3ef9a2f8 = randomint(3);
            if (var_1919d7729da23373 || var_469bb23c3ef9a2f8 == 0) {
                self.var_f73ef0cdee5d001e = "cower";
            } else {
                self.var_f73ef0cdee5d001e = "panicked";
            }
        }
        self.var_a2d61fcd0ca0dbb9 = gettime() + randomintrange(0, int(max(var_85b25c3e99617524 / 2, 1)));
    } else if (var_85b25c3e99617524 <= var_455adacb086acebd) {
        if (var_92330e20f15dc14 && var_1919d7729da23373 && randomint(10) <= 6) {
            function_309155e57ee0de92(var_106443ea359fca35);
        } else if (self.var_7afd86c1af40885b == "cower") {
            if (randomint(10) <= 3) {
                self.var_f73ef0cdee5d001e = "cower";
            }
        } else if (self.var_7afd86c1af40885b == "panicked") {
            var_469bb23c3ef9a2f8 = randomint(3);
            if (var_1919d7729da23373 || var_469bb23c3ef9a2f8 == 0) {
                self.var_f73ef0cdee5d001e = "cower";
            } else {
                self.var_f73ef0cdee5d001e = "panicked";
            }
        } else if (self.var_7afd86c1af40885b != "scared") {
            var_469bb23c3ef9a2f8 = randomint(10);
            if (var_469bb23c3ef9a2f8 <= 3) {
                self.var_f73ef0cdee5d001e = "scared";
            } else if (var_9e3e2c5efb0667ae && var_469bb23c3ef9a2f8 <= 6) {
                function_309155e57ee0de92(var_106443ea359fca35);
            } else {
                self.var_f73ef0cdee5d001e = "panicked";
            }
        } else if (var_9e3e2c5efb0667ae && randomint(4) <= 1) {
            function_309155e57ee0de92(var_106443ea359fca35);
        } else {
            self.var_f73ef0cdee5d001e = "panicked";
        }
        self.var_a2d61fcd0ca0dbb9 = gettime() + randomintrange(0, int(max(var_85b25c3e99617524 / 2, 1)));
    } else if (var_85b25c3e99617524 < var_c5f83ffc76c21554) {
        if (var_92330e20f15dc14 && var_1919d7729da23373 && randomint(10) <= 3) {
            function_309155e57ee0de92(var_106443ea359fca35);
        } else if (self.var_7afd86c1af40885b == "cower") {
            if (randomint(10) <= 3) {
                self.var_f73ef0cdee5d001e = "cower";
            }
        } else if (self.var_7afd86c1af40885b == "panicked") {
            var_469bb23c3ef9a2f8 = randomint(3);
            if (var_1919d7729da23373 || var_469bb23c3ef9a2f8 == 0) {
                self.var_f73ef0cdee5d001e = "cower";
            } else {
                self.var_f73ef0cdee5d001e = "panicked";
            }
        } else if (self.var_7afd86c1af40885b == "scared") {
            if (var_9e3e2c5efb0667ae && randomint(4) <= 2) {
                function_309155e57ee0de92(var_106443ea359fca35);
            } else {
                self.var_f73ef0cdee5d001e = "panicked";
            }
        } else if (self.var_7afd86c1af40885b != "curious") {
            var_469bb23c3ef9a2f8 = randomint(10);
            if (var_469bb23c3ef9a2f8 <= 1) {
                self.var_f73ef0cdee5d001e = "curious";
            } else if (var_469bb23c3ef9a2f8 <= 2) {
                self.var_f73ef0cdee5d001e = "scared";
            } else if (var_9e3e2c5efb0667ae && var_469bb23c3ef9a2f8 <= 8) {
                function_309155e57ee0de92(var_106443ea359fca35);
            } else {
                self.var_f73ef0cdee5d001e = "panicked";
            }
        } else {
            self.var_f73ef0cdee5d001e = "scared";
        }
        self.var_a2d61fcd0ca0dbb9 = gettime() + 500 + randomintrange(int(var_85b25c3e99617524 / 2), int(max(var_85b25c3e99617524, 1)));
    }
    if (isdefined(self.var_f73ef0cdee5d001e)) {
        self.var_b2c134a19497e578.var_a576b24ef9af6865 = level.var_f62b6e59c0e00d48.var_a576b24ef9af6865;
        self.var_9d8893066146a5b6 = 1;
        self.var_cd4296a99a7e9e7b = undefined;
        self.var_e0f99af636c737b = undefined;
        self.var_9e065b0d5f81453c = undefined;
        self.var_b2c134a19497e578.var_1532b27e26d5db21 = "relaxed";
        self.var_b2c134a19497e578.var_af1d1102ede20fc2 = "relaxed";
        self._blackboard.var_610cb18ecc1af719 = event.originator;
        function_35eca80b3823c8b();
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x406e
// Size: 0x1a4
function function_fbdb93097601737a(event) {
    var_85b25c3e99617524 = distance(event.position, self.origin);
    var_53abacdb770d946a = abs(self.origin[2] - event.position[2]);
    if (var_53abacdb770d946a > level.var_f62b6e59c0e00d48.var_e2b778b4a4a266f5) {
        return;
    }
    var_b5adf29860122c43 = function_9d30fd63965bafa9("silenced_shot", self);
    if (function_32d74b97e987274c(self, event.originator, level.var_b13f1c7f8e404252.var_f857ce93fc87458f, level.var_b13f1c7f8e404252.var_f857ce93fc87458f)) {
        if (isdefined(level.stealth)) {
            var_b5adf29860122c43 = function_61b03c8c194a6733("spotted", "silenced_shot");
        }
        var_dc9bb42b119def9f = "panicked";
    } else {
        if (isdefined(level.stealth)) {
            var_b5adf29860122c43 = function_61b03c8c194a6733("hidden", "silenced_shot");
        }
        var_dc9bb42b119def9f = "curious";
    }
    if (var_85b25c3e99617524 <= var_b5adf29860122c43) {
        if (function_4b685c24abf694be(self, var_dc9bb42b119def9f)) {
            return;
        }
        self.var_a2d61fcd0ca0dbb9 = gettime() + function_51e25764b9a2f1b1("medium");
        self.var_f73ef0cdee5d001e = var_dc9bb42b119def9f;
        self.var_84c1ae8d0dce5970 = 0;
        self.var_b2c134a19497e578.var_e4f4900d6d00346 = 0;
        self.var_cd4296a99a7e9e7b = undefined;
        self.var_9d8893066146a5b6 = 1;
        self._blackboard.var_610cb18ecc1af719 = event.originator;
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4219
// Size: 0x94
function function_a4962be231e7f4cf(event) {
    var_85b25c3e99617524 = distance(event.position, self.origin);
    if (function_b1eeb1edab8e23d4(event.originator, self, level.var_b13f1c7f8e404252.var_be89e0f4bf70ed43)) {
        if (var_85b25c3e99617524 <= 50) {
            self.var_b2c134a19497e578.var_39cbcdce57275c53 = 1;
            self._blackboard.var_610cb18ecc1af719 = event.originator;
        }
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x42b4
// Size: 0x38
function function_73a4e814a7693f37(asmname, statename, var_f2b19b25d457c2a6, params) {
    return istrue(self.var_b2c134a19497e578.var_39cbcdce57275c53);
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42f4
// Size: 0x2f
function function_56628bebf53a65c() {
    if (isdefined(self.var_b2c134a19497e578.var_39cbcdce57275c53)) {
        self.var_b2c134a19497e578.var_39cbcdce57275c53 = 0;
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x432a
// Size: 0x19a
function function_87d532954468d789(event) {
    var_85b25c3e99617524 = distance(event.position, self.origin);
    var_53abacdb770d946a = abs(self.origin[2] - event.position[2]);
    if (var_53abacdb770d946a > level.var_f62b6e59c0e00d48.var_e2b778b4a4a266f5) {
        return;
    }
    target = spawnstruct();
    target.origin = event.position;
    if (isdefined(event.stuckto) && event.stuckto == self) {
        self.var_a2d61fcd0ca0dbb9 = gettime() + function_51e25764b9a2f1b1("small");
        self.var_f73ef0cdee5d001e = "angered";
    } else if (var_85b25c3e99617524 <= 500) {
        self.var_a2d61fcd0ca0dbb9 = gettime() + function_51e25764b9a2f1b1("small");
        self.var_f73ef0cdee5d001e = "curious";
        self._blackboard.var_610cb18ecc1af719 = target;
        self.var_731b4f6bd2e8eb89 = event.originator;
        self.var_bfb728a6bee19f20 = gettime() + function_51e25764b9a2f1b1("medium");
    } else if (var_85b25c3e99617524 <= 1000 && randomint(3) == 1) {
        self.var_a2d61fcd0ca0dbb9 = gettime() + function_51e25764b9a2f1b1("small");
        self.var_f73ef0cdee5d001e = "curious";
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44cb
// Size: 0x1c2
function function_befe366dded94832() {
    var_106443ea359fca35 = function_a9e8cc25edfd1488(1);
    var_9e3e2c5efb0667ae = getdvarint(@"hash_18f4855098e19194") == 1 && isai(self) && self.var_b2c134a19497e578.var_a576b24ef9af6865 <= 0;
    if (self.var_7afd86c1af40885b == "cower") {
        if (var_9e3e2c5efb0667ae && randomint(10) <= 3) {
            function_309155e57ee0de92(var_106443ea359fca35);
        } else {
            self.var_f73ef0cdee5d001e = "cower";
        }
    } else if (self.var_7afd86c1af40885b == "panicked" || self.var_7afd86c1af40885b == "scared") {
        if (randomint(10) <= 7) {
            self.var_f73ef0cdee5d001e = "cower";
        } else if (var_9e3e2c5efb0667ae) {
            function_309155e57ee0de92(var_106443ea359fca35);
        }
    } else if (randomint(3) == 0) {
        self.var_f73ef0cdee5d001e = "cower";
    } else {
        self.var_f73ef0cdee5d001e = "panicked";
    }
    self.var_a2d61fcd0ca0dbb9 = gettime() + function_51e25764b9a2f1b1("small");
    if (isdefined(self.var_f73ef0cdee5d001e)) {
        self.var_b2c134a19497e578.var_a576b24ef9af6865 = level.var_f62b6e59c0e00d48.var_a576b24ef9af6865;
        self.var_9d8893066146a5b6 = 1;
        self.var_cd4296a99a7e9e7b = undefined;
        self.var_e0f99af636c737b = undefined;
        self.var_9e065b0d5f81453c = undefined;
        self.var_b2c134a19497e578.var_1532b27e26d5db21 = "relaxed";
        self.var_b2c134a19497e578.var_af1d1102ede20fc2 = "relaxed";
        function_35eca80b3823c8b();
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4694
// Size: 0x29d
function function_262d76ab041e99c2(event) {
    function_447f2db6891c228c();
    checkdistance = level.var_b13f1c7f8e404252.var_ee3b0f193196d7fb;
    if (level.var_f62b6e59c0e00d48.var_61996ea555e490fc && !level.var_f62b6e59c0e00d48.var_cb0412bfad561be1) {
        return;
    }
    if (level.var_f62b6e59c0e00d48.var_cb0412bfad561be1) {
        checkdistance = self.var_b13f1c7f8e404252.var_8f1c451c993982b6;
    }
    for (var_6ee979218ac554d7 = 0; var_6ee979218ac554d7 < level.var_f62b6e59c0e00d48.civs.size; var_6ee979218ac554d7++) {
        var_a5638903b40c5a21 = level.var_f62b6e59c0e00d48.civs[var_6ee979218ac554d7];
        if (!level.var_f62b6e59c0e00d48.var_cb0412bfad561be1 && isdefined(var_a5638903b40c5a21.var_9d8893066146a5b6) && var_a5638903b40c5a21.var_9d8893066146a5b6) {
            continue;
        }
        if (!isdefined(event.position) || !isdefined(event.originator)) {
            player = function_47c84e03dcbc5aa7(var_a5638903b40c5a21.origin);
            if (!isdefined(player)) {
                return;
            }
            event.position = player.origin;
            event.originator = player;
        }
        var_85b25c3e99617524 = distance(var_a5638903b40c5a21.origin, event.position);
        if (var_85b25c3e99617524 <= checkdistance) {
            var_a5638903b40c5a21.var_85b25c3e99617524 = var_85b25c3e99617524;
            var_a5638903b40c5a21.var_dd25f55f775fa187 = event.position;
            var_a5638903b40c5a21.var_74e455cfaa148985 = event.originator;
            if (istrue(var_a5638903b40c5a21.var_e909843b1034ccc2.var_21965e18b854f978)) {
                continue;
            }
            if (!isdefined(var_a5638903b40c5a21.var_e909843b1034ccc2.var_56d6f93840cb5f45)) {
                var_a5638903b40c5a21.var_e909843b1034ccc2.var_56d6f93840cb5f45 = 0;
            }
            level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc = function_6cf786a6cf335cb9(level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc, var_a5638903b40c5a21);
            var_a5638903b40c5a21.var_e909843b1034ccc2.var_21965e18b854f978 = 1;
        } else {
            var_a5638903b40c5a21.var_b2c134a19497e578.var_e4f4900d6d00346 = 0;
            var_a5638903b40c5a21.var_c637a07b110d6d1a = undefined;
            var_a5638903b40c5a21.var_cd4296a99a7e9e7b = undefined;
        }
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4938
// Size: 0x2f9
function function_61eac1179884dcf9(civilian) {
    if (istrue(civilian.var_9d8893066146a5b6) || istrue(civilian.var_c419286e653edc35)) {
        return;
    }
    if (civilian.var_7afd86c1af40885b == "relaxed") {
        return;
    }
    player = civilian.var_74e455cfaa148985;
    if (!isdefined(player)) {
        player = function_47c84e03dcbc5aa7(civilian.origin);
    }
    if (!isdefined(player)) {
        return;
    }
    var_6d10010320439599 = distancesquared(civilian.origin, player.origin);
    var_5674645139015d99 = 1;
    var_ae49978a941bbb30 = abs(civilian.origin[2] - player.origin[2]);
    if (var_ae49978a941bbb30 > 72) {
        var_5674645139015d99 = 0;
    }
    var_893255aafd7b8c87 = level.var_9958731831312749.var_37460d7564c32f23;
    cooldowntime = level.var_9958731831312749.var_28aa9afd2281bef1;
    var_b067772eb97c4337 = "relaxed";
    if (civilian.var_7afd86c1af40885b == "panicked" || civilian.var_7afd86c1af40885b == "cower") {
        cooldowntime = level.var_9958731831312749.var_6c2da9c7a6c0dedb;
        var_893255aafd7b8c87 = level.var_9958731831312749.var_7c9588454c703131;
        var_b067772eb97c4337 = "scared";
    } else if (civilian.var_7afd86c1af40885b == "scared") {
        cooldowntime = level.var_9958731831312749.var_6c2da9c7a6c0dedb;
        var_893255aafd7b8c87 = level.var_9958731831312749.var_7c9588454c703131;
        var_b067772eb97c4337 = "curious";
    } else if (civilian.var_7afd86c1af40885b == "angered") {
        cooldowntime = level.var_9958731831312749.var_6c2da9c7a6c0dedb;
        var_893255aafd7b8c87 = level.var_9958731831312749.var_7c9588454c703131;
        var_b067772eb97c4337 = "relaxed";
    } else {
        cooldowntime = level.var_9958731831312749.var_e1987e04cee18cc9;
        var_b067772eb97c4337 = "relaxed";
    }
    if (var_5674645139015d99 && !level.var_f62b6e59c0e00d48.var_fd5676cc382cc7e1) {
        if (var_6d10010320439599 < var_893255aafd7b8c87 * var_893255aafd7b8c87) {
            return;
        }
    }
    if (level.var_f62b6e59c0e00d48.var_fd5676cc382cc7e1) {
        var_893255aafd7b8c87 = 0;
        level.var_f62b6e59c0e00d48.var_fd5676cc382cc7e1 = 0;
    }
    civilian.var_c419286e653edc35 = 1;
    civilian.var_a2d61fcd0ca0dbb9 = gettime() + cooldowntime * level.var_9958731831312749.var_6026b57b0b875efc + function_51e25764b9a2f1b1("extra_large");
    civilian.var_f73ef0cdee5d001e = var_b067772eb97c4337;
    civilian.var_84c1ae8d0dce5970 = 1;
    civilian._blackboard.var_610cb18ecc1af719 = undefined;
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4c38
// Size: 0x65
function function_2965d2916e126b37(eventname, originator, origin, radius) {
    entarray = getentarrayinradius("civ_cap", "target", origin, radius);
    for (var_89d86711a7226025 = 0; var_89d86711a7226025 < entarray.size; var_89d86711a7226025++) {
        entarray[var_89d86711a7226025] notify("cap_event", eventname);
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ca4
// Size: 0x91
function function_5739996c28d6429f(grenade, objweapon) {
    hitnormal = position = null = null = null = stuckto = grenade waittill("missile_stuck");
    eventname = "grenade";
    if (objweapon.basename == "bottle") {
        eventname = "bottleThrow";
    }
    function_cac704adccfe911(eventname, "civilian", level.player, position, objweapon, stuckto);
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d3c
// Size: 0x44
function function_4ead24a48cd14450(offhand) {
    level endon("civreact_terminate");
    while (1) {
        objweapon = grenade = self waittill("grenade_fire");
        thread function_5739996c28d6429f(grenade, objweapon);
        waitframe();
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d87
// Size: 0xcd
function function_63decb4f6cdcf09a() {
    level endon("civreact_terminate");
    if (!flag_exist("weapon_unholstered")) {
        return;
    }
    while (1) {
        while (!flag("weapon_unholstered")) {
            waitframe();
        }
        if (!level.var_f62b6e59c0e00d48.var_cb0412bfad561be1) {
            level.var_f62b6e59c0e00d48.var_cb0412bfad561be1 = 1;
            function_35eca80b3823c8b();
            function_cac704adccfe911("lookAt", "level");
        }
        while (flag("weapon_unholstered")) {
            waitframe();
        }
        if (level.var_f62b6e59c0e00d48.var_cb0412bfad561be1) {
            level.var_f62b6e59c0e00d48.var_cb0412bfad561be1 = 0;
            function_35eca80b3823c8b();
            function_cac704adccfe911("lookAt", "level");
        }
        waitframe();
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e5b
// Size: 0x102
function function_a5c5d7e306852a60() {
    level endon("civreact_terminate");
    while (1) {
        objweapon = self waittill("weapon_fired");
        var_135823c8d383ee64 = objweapon issilenced();
        if (gettime() < level.var_f62b6e59c0e00d48.var_63946b7b3280a1be) {
            level.var_f62b6e59c0e00d48.var_63946b7b3280a1be = gettime() + level.var_f62b6e59c0e00d48.var_8b3c659fe74ae0ec;
            continue;
        }
        if (var_135823c8d383ee64) {
            function_cac704adccfe911("silenced_shot", "civilian", self, self.origin);
        } else {
            function_cac704adccfe911("gunshot", "civilian", self, self.origin);
            level.var_f62b6e59c0e00d48.var_61996ea555e490fc = 1;
        }
        level.var_f62b6e59c0e00d48.var_63946b7b3280a1be = gettime() + level.var_f62b6e59c0e00d48.var_8b3c659fe74ae0ec;
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f64
// Size: 0xbb
function function_f8ec45e1854c97bc() {
    level endon("civreact_terminate");
    while (1) {
        while (self meleebuttonpressed()) {
            waitframe();
        }
        self waittill("melee");
        if (gettime() < level.var_f62b6e59c0e00d48.var_869a1ef8b53fb0bc) {
            level.var_f62b6e59c0e00d48.var_869a1ef8b53fb0bc = gettime() + level.var_f62b6e59c0e00d48.var_932238a570868df2;
            continue;
        }
        function_cac704adccfe911("melee", "civilian", self, self.origin);
        level.var_f62b6e59c0e00d48.var_869a1ef8b53fb0bc = gettime() + level.var_f62b6e59c0e00d48.var_932238a570868df2;
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5026
// Size: 0xd9
function function_c17e63bc92f46e3e() {
    if (utility::issp()) {
        while (!isdefined(level.player)) {
            waitframe();
        }
    }
    if (isdefined(level.players)) {
        foreach (player in level.players) {
            player thread function_4ead24a48cd14450();
            player thread function_a5c5d7e306852a60();
            player thread function_f8ec45e1854c97bc();
        }
    } else {
        level.player thread function_4ead24a48cd14450();
        level.player thread function_a5c5d7e306852a60();
        level.player thread function_63decb4f6cdcf09a();
        level.player thread function_f8ec45e1854c97bc();
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5106
// Size: 0x63
function function_dc2bce7e852d197b(var_6ee979218ac554d7) {
    var_a5638903b40c5a21 = level.var_f62b6e59c0e00d48.civs[var_6ee979218ac554d7];
    level.var_f62b6e59c0e00d48.var_a7b0a5f16322cf86[var_6ee979218ac554d7] = 0;
    level.var_f62b6e59c0e00d48.var_4c000e21703586f[var_6ee979218ac554d7] = 0;
    var_a5638903b40c5a21 thread function_4585228f63bec744();
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x5170
// Size: 0xbe
function function_b318dc6f26328b88(var_7afd86c1af40885b, time, override, var_62370ee9083222cb, var_82d6532f8814bb78) {
    if (isdefined(self.var_34df90223221b7a6)) {
        group = level.var_6961d0344027496f[self.var_34df90223221b7a6];
        foreach (ent in group) {
            ent function_e64776b765c9b869(var_7afd86c1af40885b, time, override, var_62370ee9083222cb, var_82d6532f8814bb78);
        }
    } else {
        function_e64776b765c9b869(var_7afd86c1af40885b, time, override, var_62370ee9083222cb, var_82d6532f8814bb78);
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5235
// Size: 0x64
function function_e64776b765c9b869(var_7afd86c1af40885b, time, override, var_62370ee9083222cb, var_82d6532f8814bb78) {
    self.var_a2d61fcd0ca0dbb9 = time;
    self.var_f73ef0cdee5d001e = var_7afd86c1af40885b;
    self.var_84c1ae8d0dce5970 = override;
    if (var_62370ee9083222cb != var_7afd86c1af40885b) {
        self.var_e032f690711396e6 = var_62370ee9083222cb;
        self.var_83b37a7080fd5c11 = var_82d6532f8814bb78;
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52a0
// Size: 0x3e
function function_442900a9a1893842() {
    function_c984f2a1e4436eba();
    function_447f2db6891c228c();
    level thread function_929576cfa3ada541();
    function_c17e63bc92f46e3e();
    function_cac704adccfe911("lookAt", "level");
    /#
        level thread function_1d44ab1df1d7d067();
    #/
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52e5
// Size: 0x730
function function_929576cfa3ada541() {
    level endon("civreact_terminate");
    var_abfd1b50f4376c2a = [];
    var_abfd1b50f4376c2a["gunshot"] = &function_384465a3a8aa24f7;
    var_abfd1b50f4376c2a["silenced_shot"] = &function_fbdb93097601737a;
    var_abfd1b50f4376c2a["melee"] = &function_a4962be231e7f4cf;
    var_abfd1b50f4376c2a["bottleThrow"] = &function_87d532954468d789;
    var_abfd1b50f4376c2a["lookAt"] = &function_262d76ab041e99c2;
    while (1) {
        /#
            assert(level.var_f62b6e59c0e00d48.events.array.size <= 5);
        #/
        var_f44aa0eedd6bdd5d = undefined;
        event = undefined;
        time = gettime();
        level.var_f62b6e59c0e00d48.civs = array_removeundefined(level.var_f62b6e59c0e00d48.civs);
        if (level.var_f62b6e59c0e00d48.events.array.size > 0) {
            event = function_73d8a9394fc5eda2(level.var_f62b6e59c0e00d48.events);
            var_f44aa0eedd6bdd5d = var_abfd1b50f4376c2a[event.type];
            if (event.entitytype == "level") {
                level [[ var_f44aa0eedd6bdd5d ]](event);
                var_f44aa0eedd6bdd5d = undefined;
            }
            level.var_f62b6e59c0e00d48.events = function_93def91a50927481(level.var_f62b6e59c0e00d48.events);
        } else if (!isdefined(level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc) || function_45fad871d0bee0f2(level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc)) {
            function_cac704adccfe911("lookAt", "level");
        }
        for (var_6ee979218ac554d7 = 0; var_6ee979218ac554d7 < level.var_f62b6e59c0e00d48.civs.size; var_6ee979218ac554d7++) {
            var_a5638903b40c5a21 = level.var_f62b6e59c0e00d48.civs[var_6ee979218ac554d7];
            if (!isdefined(var_a5638903b40c5a21)) {
                continue;
            }
            var_7a140ee03cfc699e = self findoverridearchetype("animscript");
            if (isdefined(var_a5638903b40c5a21.var_8effd09d2c6077d7) && (!isdefined(var_7a140ee03cfc699e) || var_a5638903b40c5a21.var_8effd09d2c6077d7 != var_7a140ee03cfc699e) && !istrue(var_a5638903b40c5a21.var_b2c134a19497e578.var_91ab28d2cb1639ce)) {
                if (istrue(var_a5638903b40c5a21.var_35336d0f72f57871) && isdefined(var_a5638903b40c5a21.var_b2c134a19497e578)) {
                    var_a5638903b40c5a21 thread function_e0bae58f26ee1323();
                } else {
                    function_405bf7cde917b70e(var_a5638903b40c5a21);
                    var_a5638903b40c5a21.var_8effd09d2c6077d7 = undefined;
                    break;
                }
            }
            if (istrue(var_a5638903b40c5a21.var_b2c134a19497e578.var_2141f7cb7ff397a6) || istrue(var_a5638903b40c5a21.var_b2c134a19497e578.var_54e869f8deb4f44f) || istrue(var_a5638903b40c5a21.var_b2c134a19497e578.var_b03d5e070b921b97)) {
                continue;
            }
            if (istrue(var_a5638903b40c5a21.var_950c1ab89c9c4e2a)) {
                continue;
            }
            if (level.var_f62b6e59c0e00d48.var_4c000e21703586f[var_6ee979218ac554d7]) {
                var_a5638903b40c5a21 function_befe366dded94832();
                level.var_f62b6e59c0e00d48.var_4c000e21703586f[var_6ee979218ac554d7] = 0;
            } else if (isdefined(var_f44aa0eedd6bdd5d)) {
                var_a5638903b40c5a21 [[ var_f44aa0eedd6bdd5d ]](event);
            }
            if (!isdefined(var_a5638903b40c5a21.var_f73ef0cdee5d001e)) {
                if (isdefined(var_a5638903b40c5a21.var_9d8893066146a5b6)) {
                    var_a5638903b40c5a21.var_9d8893066146a5b6 = 0;
                }
            }
            if (isdefined(var_a5638903b40c5a21.var_731b4f6bd2e8eb89) && time >= var_a5638903b40c5a21.var_bfb728a6bee19f20) {
                var_a5638903b40c5a21._blackboard.var_610cb18ecc1af719 = var_a5638903b40c5a21.var_731b4f6bd2e8eb89;
                var_a5638903b40c5a21.var_731b4f6bd2e8eb89 = undefined;
                var_a5638903b40c5a21.var_bfb728a6bee19f20 = undefined;
            }
            if (isdefined(var_a5638903b40c5a21.var_f73ef0cdee5d001e) && time >= var_a5638903b40c5a21.var_a2d61fcd0ca0dbb9) {
                var_b067772eb97c4337 = var_a5638903b40c5a21.var_f73ef0cdee5d001e;
                player = function_47c84e03dcbc5aa7(var_a5638903b40c5a21.origin);
                if (istrue(var_a5638903b40c5a21.var_c419286e653edc35)) {
                    if (function_b1eeb1edab8e23d4(player, var_a5638903b40c5a21, 0)) {
                        if (level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_b067772eb97c4337] <= level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_a5638903b40c5a21.var_7afd86c1af40885b]) {
                            continue;
                        } else {
                            var_a5638903b40c5a21.var_84c1ae8d0dce5970 = undefined;
                            var_a5638903b40c5a21.var_c419286e653edc35 = undefined;
                        }
                    } else {
                        var_a5638903b40c5a21._blackboard.var_610cb18ecc1af719 = undefined;
                    }
                }
                var_a5638903b40c5a21.var_b2c134a19497e578.var_1532b27e26d5db21 = "relaxed";
                if (var_b067772eb97c4337 == "panicked" && var_a5638903b40c5a21.var_7afd86c1af40885b == "panicked" || var_b067772eb97c4337 == "cower" && var_a5638903b40c5a21.var_7afd86c1af40885b == "cower") {
                    var_a5638903b40c5a21._blackboard.var_af9e2d62dd7da3c3 = 1;
                } else if (level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_b067772eb97c4337] > level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_a5638903b40c5a21.var_7afd86c1af40885b] || istrue(var_a5638903b40c5a21.var_84c1ae8d0dce5970)) {
                    var_a5638903b40c5a21.var_358a269a1ca60e5a = var_a5638903b40c5a21.var_7afd86c1af40885b;
                    var_a5638903b40c5a21.var_7afd86c1af40885b = var_b067772eb97c4337;
                }
                if (isdefined(var_a5638903b40c5a21.var_e032f690711396e6)) {
                    var_a5638903b40c5a21.var_f73ef0cdee5d001e = var_a5638903b40c5a21.var_e032f690711396e6;
                    var_a5638903b40c5a21.var_a2d61fcd0ca0dbb9 = var_a5638903b40c5a21.var_83b37a7080fd5c11;
                    var_a5638903b40c5a21.var_84c1ae8d0dce5970 = var_a5638903b40c5a21.var_14c9c06bc882eee8;
                    var_a5638903b40c5a21.var_e032f690711396e6 = undefined;
                    var_a5638903b40c5a21.var_83b37a7080fd5c11 = undefined;
                    var_a5638903b40c5a21.var_14c9c06bc882eee8 = undefined;
                } else {
                    var_a5638903b40c5a21.var_f73ef0cdee5d001e = undefined;
                    var_a5638903b40c5a21.var_a2d61fcd0ca0dbb9 = undefined;
                    var_a5638903b40c5a21.var_84c1ae8d0dce5970 = undefined;
                    if (isdefined(var_a5638903b40c5a21.var_9d8893066146a5b6)) {
                        var_a5638903b40c5a21.var_9d8893066146a5b6 = 0;
                    }
                    if (isdefined(var_a5638903b40c5a21.var_c419286e653edc35)) {
                        var_a5638903b40c5a21.var_c419286e653edc35 = 0;
                    }
                }
            } else if (!level.var_f62b6e59c0e00d48.var_61996ea555e490fc && var_a5638903b40c5a21.var_b2c134a19497e578.var_1532b27e26d5db21 != "relaxed") {
                function_a1469580c494459c(var_a5638903b40c5a21);
            } else if (!level.var_f62b6e59c0e00d48.var_61996ea555e490fc && var_a5638903b40c5a21.var_b2c134a19497e578.var_af1d1102ede20fc2 != "relaxed") {
                function_59e85ddec8976510(var_a5638903b40c5a21);
            } else if (!istrue(var_a5638903b40c5a21.var_c419286e653edc35) && !level.var_f62b6e59c0e00d48.var_cb0412bfad561be1) {
                function_61eac1179884dcf9(var_a5638903b40c5a21);
            }
        }
        level.var_f62b6e59c0e00d48.var_af1d1102ede20fc2 = "relaxed";
        waitframe();
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a1c
// Size: 0x79
function function_2b93cb073c8caa49(var_a5638903b40c5a21) {
    /#
        assert(isdefined(level.var_f62b6e59c0e00d48));
    #/
    level.var_f62b6e59c0e00d48.civs[level.var_f62b6e59c0e00d48.civs.size] = var_a5638903b40c5a21;
    function_dc2bce7e852d197b(level.var_f62b6e59c0e00d48.civs.size - 1);
    var_a5638903b40c5a21 thread function_8cbbda93904d3a65();
    var_a5638903b40c5a21 thread function_f44bcfc1647b23f();
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a9c
// Size: 0xd8
function function_405bf7cde917b70e(var_a5638903b40c5a21) {
    /#
        assert(isdefined(level.var_f62b6e59c0e00d48));
    #/
    var_a5638903b40c5a21 notify("civ_deregister");
    var_6ee979218ac554d7 = array_find(level.var_f62b6e59c0e00d48.civs, var_a5638903b40c5a21);
    level.var_f62b6e59c0e00d48.civs = array_remove(level.var_f62b6e59c0e00d48.civs, var_a5638903b40c5a21);
    level.var_f62b6e59c0e00d48.var_a7b0a5f16322cf86 = array_remove_index(level.var_f62b6e59c0e00d48.var_a7b0a5f16322cf86, var_6ee979218ac554d7, 0);
    level.var_f62b6e59c0e00d48.var_4c000e21703586f = array_remove_index(level.var_f62b6e59c0e00d48.var_4c000e21703586f, var_6ee979218ac554d7, 0);
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b7b
// Size: 0x1cd
function function_1d44ab1df1d7d067() {
    /#
        while (1) {
            while (getdvarint(@"hash_c544e07187fda60", 0) == 0) {
                wait(1);
            }
            while (getdvarint(@"hash_c544e07187fda60", 0) != 0) {
                for (var_6ee979218ac554d7 = 0; var_6ee979218ac554d7 < level.var_f62b6e59c0e00d48.civs.size; var_6ee979218ac554d7++) {
                    var_a5638903b40c5a21 = level.var_f62b6e59c0e00d48.civs[var_6ee979218ac554d7];
                    if (isalive(var_a5638903b40c5a21) && distancesquared(level.player.origin, var_a5638903b40c5a21.origin) < 1048576) {
                        if (isdefined(var_a5638903b40c5a21.asmname)) {
                            print3d(var_a5638903b40c5a21.origin + (0, 0, 80), "civilian_gl_ending_caps_watcher_mom_shot" + var_a5638903b40c5a21.asmname, (1, 1, 0), 1, 0.3, 5);
                        }
                        if (isdefined(var_a5638903b40c5a21.var_ae3ea15396b65c1f)) {
                            print3d(var_a5638903b40c5a21.origin + (0, 0, 72), "civilian_gl_ending_caps_watcher_mom_shot" + var_a5638903b40c5a21.var_ae3ea15396b65c1f, (1, 1, 0), 1, 0.3, 5);
                        }
                        state = var_a5638903b40c5a21 asmgetcurrentstate(var_a5638903b40c5a21.asmname);
                        if (isdefined(state)) {
                            print3d(var_a5638903b40c5a21.origin + (0, 0, 64), "civilian_gl_ending_caps_watcher_mom_shot" + state, (1, 1, 0), 1, 0.3, 5);
                        }
                    }
                }
                wait(0.25);
            }
        }
    #/
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d4f
// Size: 0x9d
function function_447f2db6891c228c() {
    if (!isdefined(level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc)) {
        level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc = function_79c374ab1ca30cc9(level.var_9958731831312749.var_ab47b155a0c0b6e9);
        level thread function_62642d01fcc6fd7b();
    }
    if (!isdefined(level.var_b13f1c7f8e404252.var_76448df574c47eca)) {
        level.var_b13f1c7f8e404252.var_76448df574c47eca = function_79c374ab1ca30cc9(level.var_9958731831312749.var_ab47b155a0c0b6e9);
        level thread function_731be81501e0bc9d();
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5df3
// Size: 0x1ac
function function_35eca80b3823c8b() {
    if (isdefined(level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc)) {
        while (!function_45fad871d0bee0f2(level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc)) {
            civilian = function_73d8a9394fc5eda2(level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc);
            level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc = function_93def91a50927481(level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc);
            if (isdefined(civilian)) {
                civilian.var_e909843b1034ccc2.var_21965e18b854f978 = 0;
                civilian.var_e909843b1034ccc2.var_56d6f93840cb5f45 = 0;
            } else {
                waitframe();
            }
        }
        level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc = undefined;
    }
    if (isdefined(level.var_b13f1c7f8e404252.var_76448df574c47eca)) {
        while (!function_45fad871d0bee0f2(level.var_b13f1c7f8e404252.var_76448df574c47eca)) {
            civilian = function_73d8a9394fc5eda2(level.var_b13f1c7f8e404252.var_76448df574c47eca);
            level.var_b13f1c7f8e404252.var_76448df574c47eca = function_93def91a50927481(level.var_b13f1c7f8e404252.var_76448df574c47eca);
            if (isdefined(civilian)) {
                civilian.var_e909843b1034ccc2.var_dd42e0cfcc2298aa = 0;
                civilian.var_e909843b1034ccc2.var_ee72620ac1467e7f = 0;
            } else {
                waitframe();
            }
        }
        level.var_b13f1c7f8e404252.var_76448df574c47eca = undefined;
    }
    level notify("civilian_process_eye_look_at");
    level notify("player_look_at_process");
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fa6
// Size: 0x125
function function_62642d01fcc6fd7b() {
    level notify("player_look_at_process");
    level endon("player_look_at_process");
    var_98cfcdbee7100d1 = level.var_9958731831312749.var_7030873a2cb05d89;
    while (1) {
        numtraces = min(var_98cfcdbee7100d1, level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc.array.size);
        for (i = 0; i < numtraces; i++) {
            civilian = function_73d8a9394fc5eda2(level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc);
            level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc = function_93def91a50927481(level.var_b13f1c7f8e404252.var_ba6be00a0c2658cc);
            if (isdefined(civilian)) {
                player = function_47c84e03dcbc5aa7(civilian.origin);
                if (!isdefined(player)) {
                    continue;
                }
                if (level.var_f62b6e59c0e00d48.var_cb0412bfad561be1) {
                    function_8bee41bbdbe247f4(civilian, player);
                } else {
                    function_35f7191a1541ef00(civilian, player);
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60d2
// Size: 0x1d6
function function_731be81501e0bc9d() {
    level notify("civilian_process_eye_look_at");
    level endon("civilian_process_eye_look_at");
    var_a2f52cef95a01cd6 = level.var_9958731831312749.var_2fe9915eca4d8d12;
    while (1) {
        numtraces = min(var_a2f52cef95a01cd6, level.var_b13f1c7f8e404252.var_76448df574c47eca.array.size);
        for (i = 0; i < numtraces; i++) {
            civilian = function_73d8a9394fc5eda2(level.var_b13f1c7f8e404252.var_76448df574c47eca);
            level.var_b13f1c7f8e404252.var_76448df574c47eca = function_93def91a50927481(level.var_b13f1c7f8e404252.var_76448df574c47eca);
            if (isdefined(civilian)) {
                player = function_47c84e03dcbc5aa7(civilian.origin);
                if (!isdefined(player)) {
                    continue;
                }
                civilian.var_e909843b1034ccc2.var_dd42e0cfcc2298aa = undefined;
                if (isai(civilian)) {
                    var_de5bce61d0970048 = civilian gettagangles("TAG_EYE");
                } else {
                    var_de5bce61d0970048 = civilian gettagangles("TAG_ORIGIN");
                }
                var_9b51e1e2bf192031 = anglestoforward(var_de5bce61d0970048);
                var_9b51e1e2bf192031 = vectornormalize(var_9b51e1e2bf192031);
                var_93259a67391ac2c8 = player.origin - civilian.origin;
                var_93259a67391ac2c8 = vectornormalize(var_93259a67391ac2c8);
                if (vectordot(var_9b51e1e2bf192031, var_93259a67391ac2c8) >= level.var_b13f1c7f8e404252.var_f857ce93fc87458f) {
                    civilian.var_e909843b1034ccc2.var_ee72620ac1467e7f = 1;
                    function_2e4bf288de5058a5(civilian, 1);
                }
            }
        }
        wait(level.var_9958731831312749.var_832e9f5262aaa2b2);
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62af
// Size: 0xbf
function function_cac704adccfe911(eventtype, entitytype, originator, position, object, stuckto) {
    var_e6ef9f6d477c0397 = spawnstruct();
    var_e6ef9f6d477c0397.type = eventtype;
    var_e6ef9f6d477c0397.entitytype = entitytype;
    var_e6ef9f6d477c0397.originator = originator;
    var_e6ef9f6d477c0397.position = position;
    var_e6ef9f6d477c0397.time = gettime();
    var_e6ef9f6d477c0397.object = object;
    var_e6ef9f6d477c0397.stuckto = stuckto;
    function_6cf786a6cf335cb9(level.var_f62b6e59c0e00d48.events, var_e6ef9f6d477c0397);
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6375
// Size: 0x64
function function_85c36ebf7018ecfa(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!isdefined(self.var_7afd86c1af40885b)) {
        return 0;
    }
    if (self.var_7afd86c1af40885b == "relaxed" || self.var_7afd86c1af40885b == "panicked") {
        return namespace_dd3a5c61bf082e18::function_85eca0a1310a70c(asmname, statename, var_f2b19b25d457c2a6, params);
    }
    return 0;
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x63e1
// Size: 0x49
function function_c41c4fe8ec2978f7(asmname, statename, var_f2b19b25d457c2a6) {
    if (self.var_b2c134a19497e578.var_2141f7cb7ff397a6 && self.var_7afd86c1af40885b == "panicked") {
        return 1;
    }
    return 0;
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6432
// Size: 0xc
function function_8652e1daf9f118cb() {
    level thread function_df878d36247b150d();
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6445
// Size: 0x346
function function_df878d36247b150d() {
    level notify("civilian_cap_random_headlook_end");
    level endon("civilian_cap_random_headlook_end");
    while (1) {
        if (!isdefined(level.civs["ending_ai"]) || level.civs["ending_ai"].size == 0) {
            level notify("civilian_cap_random_headlook_end");
            return;
        }
        level.civs["ending_ai"] = array_removeundefined(level.civs["ending_ai"]);
        level.civs["ending_ai"] = array_removedead_or_dying(level.civs["ending_ai"]);
        foreach (var_a5638903b40c5a21 in level.civs["ending_ai"]) {
            if (!isalive(var_a5638903b40c5a21) || !isdefined(var_a5638903b40c5a21.using_goto_node) || istrue(var_a5638903b40c5a21.var_b3cd65f3e4b5e386)) {
                continue;
            }
            if (!isdefined(var_a5638903b40c5a21.var_38a73270d08067d1)) {
                var_a5638903b40c5a21 function_1c339daaba3f71db(1);
                var_a5638903b40c5a21.var_38a73270d08067d1 = spawnstruct();
                var_a5638903b40c5a21.var_38a73270d08067d1.timeout = 1000;
                var_a5638903b40c5a21.var_38a73270d08067d1.var_cb58849338c969fb = 0;
                var_a5638903b40c5a21.var_38a73270d08067d1.var_be4d6cbdc72c118b = 2;
                var_a5638903b40c5a21 function_504a5e2df31069a4();
                var_a5638903b40c5a21 function_1c339daaba3f71db(0);
                timedelay = randomintrange(2000, 3000);
                var_a5638903b40c5a21.var_38a73270d08067d1.var_cb58849338c969fb = gettime() + timedelay;
            }
            player = function_47c84e03dcbc5aa7(var_a5638903b40c5a21.origin);
            if (!isdefined(player)) {
                continue;
            }
            var_7db3f23075364db4 = !function_b1eeb1edab8e23d4(var_a5638903b40c5a21, player, -0.707);
            if (var_a5638903b40c5a21.var_38a73270d08067d1.var_be4d6cbdc72c118b == 1 && var_7db3f23075364db4) {
                var_a5638903b40c5a21.var_38a73270d08067d1.var_cb58849338c969fb = gettime();
            }
            if (gettime() > var_a5638903b40c5a21.var_38a73270d08067d1.var_cb58849338c969fb && !istrue(var_a5638903b40c5a21.var_ed20e92824c3b6f)) {
                var_a5638903b40c5a21 function_1c339daaba3f71db(1);
                var_a5638903b40c5a21 function_106bce0aeee91d2c(utility::function_b88f4e5baff057a9(0.2));
                timedelay = 0;
                if (var_a5638903b40c5a21.var_38a73270d08067d1.var_be4d6cbdc72c118b == 1 || var_7db3f23075364db4) {
                    var_a5638903b40c5a21 function_504a5e2df31069a4();
                    var_a5638903b40c5a21 function_1c339daaba3f71db(0);
                    var_a5638903b40c5a21.var_38a73270d08067d1.var_be4d6cbdc72c118b = 2;
                    timedelay = randomintrange(2000, 3000);
                } else {
                    var_a5638903b40c5a21._blackboard.var_610cb18ecc1af719 = undefined;
                    var_a5638903b40c5a21 namespace_dd3a5c61bf082e18::function_7495a975f79b957(player);
                    var_a5638903b40c5a21.var_38a73270d08067d1.var_be4d6cbdc72c118b = 1;
                    timedelay = randomintrange(500, 750);
                }
                var_a5638903b40c5a21.var_38a73270d08067d1.var_cb58849338c969fb = gettime() + timedelay;
            }
        }
        waitframe();
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6792
// Size: 0x4a7
function function_bdddad63d480f563() {
    level notify("civilian_gl_ending_caps_reaction");
    level endon("civilian_gl_ending_caps_reaction");
    while (1) {
        time = gettime();
        level.civs["ending_cap"] = array_removeundefined(level.civs["ending_cap"]);
        level.civs["ending_cap"] = array_removedead_or_dying(level.civs["ending_cap"]);
        if (isdefined(level.civs["cellPhoneGuy"]) && isdefined(level.civs["cellPhoneGuy"].var_f73ef0cdee5d001e) && time >= level.civs["cellPhoneGuy"].var_a2d61fcd0ca0dbb9) {
            var_b067772eb97c4337 = level.civs["cellPhoneGuy"].var_f73ef0cdee5d001e;
            if (level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_b067772eb97c4337] > level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[level.civs["cellPhoneGuy"].var_7afd86c1af40885b] || istrue(level.civs["cellPhoneGuy"].var_84c1ae8d0dce5970)) {
                level.civs["cellPhoneGuy"].var_358a269a1ca60e5a = level.civs["cellPhoneGuy"].var_7afd86c1af40885b;
                level.civs["cellPhoneGuy"].var_7afd86c1af40885b = var_b067772eb97c4337;
            }
            level.civs["cellPhoneGuy"].var_f73ef0cdee5d001e = undefined;
            level.civs["cellPhoneGuy"].var_a2d61fcd0ca0dbb9 = undefined;
            level.civs["cellPhoneGuy"].var_84c1ae8d0dce5970 = undefined;
        }
        if (isdefined(level.civs["ending_church_grp"]) && level.civs["ending_church_grp"].size > 0) {
            level.civs["ending_church_grp"] = array_removeundefined(level.civs["ending_church_grp"]);
            level.civs["ending_church_grp"] = array_removedead_or_dying(level.civs["ending_church_grp"]);
            foreach (var_a5638903b40c5a21 in level.civs["ending_church_grp"]) {
                if (isdefined(var_a5638903b40c5a21.var_f73ef0cdee5d001e) && time >= var_a5638903b40c5a21.var_a2d61fcd0ca0dbb9) {
                    var_b067772eb97c4337 = var_a5638903b40c5a21.var_f73ef0cdee5d001e;
                    if (level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_b067772eb97c4337] > level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_a5638903b40c5a21.var_7afd86c1af40885b] || istrue(var_a5638903b40c5a21.var_84c1ae8d0dce5970)) {
                        var_a5638903b40c5a21.var_358a269a1ca60e5a = var_a5638903b40c5a21.var_7afd86c1af40885b;
                        var_a5638903b40c5a21.var_7afd86c1af40885b = var_b067772eb97c4337;
                    }
                    var_a5638903b40c5a21.var_f73ef0cdee5d001e = undefined;
                    var_a5638903b40c5a21.var_a2d61fcd0ca0dbb9 = undefined;
                    var_a5638903b40c5a21.var_84c1ae8d0dce5970 = undefined;
                }
            }
        }
        foreach (var_a5638903b40c5a21 in level.civs["ending_cap"]) {
            if (isdefined(var_a5638903b40c5a21.var_f73ef0cdee5d001e) && time >= var_a5638903b40c5a21.var_a2d61fcd0ca0dbb9) {
                var_b067772eb97c4337 = var_a5638903b40c5a21.var_f73ef0cdee5d001e;
                if (var_b067772eb97c4337 == "panicked" && var_a5638903b40c5a21.var_7afd86c1af40885b == "panicked") {
                    var_a5638903b40c5a21._blackboard.var_af9e2d62dd7da3c3 = 1;
                } else if (level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_b067772eb97c4337] > level.var_f62b6e59c0e00d48.var_bcce56724567c4a3[var_a5638903b40c5a21.var_7afd86c1af40885b] || istrue(var_a5638903b40c5a21.var_84c1ae8d0dce5970)) {
                    var_a5638903b40c5a21.var_358a269a1ca60e5a = var_a5638903b40c5a21.var_7afd86c1af40885b;
                    var_a5638903b40c5a21.var_7afd86c1af40885b = var_b067772eb97c4337;
                }
                var_a5638903b40c5a21.var_f73ef0cdee5d001e = undefined;
                var_a5638903b40c5a21.var_a2d61fcd0ca0dbb9 = undefined;
                var_a5638903b40c5a21.var_84c1ae8d0dce5970 = undefined;
            }
        }
        waitframe();
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c40
// Size: 0x30
function function_e703112e44ace0bb() {
    level thread function_4ec9b795d4c490d7();
    level thread function_2ec0f8c971eda828();
    level thread function_89051fa78d0f0af7();
    level thread function_3e7e8e0bd69a89f7();
    level thread function_cd4c7a39360d8657();
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c77
// Size: 0x9c
function function_4ec9b795d4c490d7() {
    level notify("civilian_gl_ending_caps_watcher_HVT_running");
    level endon("civilian_gl_ending_caps_watcher_HVT_running");
    level endon("civreact_terminate");
    while (1) {
        level waittill("hvt_running");
        if (isdefined(level.civs["cellPhoneGuy"])) {
            level.civs["cellPhoneGuy"].var_f73ef0cdee5d001e = "panicked";
            level.civs["cellPhoneGuy"].var_a2d61fcd0ca0dbb9 = gettime() + randomintrange(0, 500);
        }
        function_9eab2622d3518f80();
        function_6145ab8334e20d85(level.player);
        waitframe();
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d1a
// Size: 0x3c
function function_2ec0f8c971eda828() {
    level notify("civilian_gl_ending_caps_Watcher_HVT_Shot");
    level endon("civilian_gl_ending_caps_Watcher_HVT_Shot");
    level endon("civreact_terminate");
    while (1) {
        level waittill("hvt_shot");
        function_6145ab8334e20d85(level.player, 1);
        waitframe();
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d5d
// Size: 0x3a
function function_89051fa78d0f0af7() {
    level notify("civilian_gl_ending_caps_watcher_mom_shot");
    level endon("civilian_gl_ending_caps_watcher_mom_shot");
    level endon("civreact_terminate");
    while (1) {
        level waittill("mom_shot_by_hvt");
        function_6145ab8334e20d85(level.var_691be1fb9619adb);
        waitframe();
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d9e
// Size: 0x42
function function_3e7e8e0bd69a89f7() {
    level notify("civilian_gl_ending_caps_watcher_player_shoots");
    level endon("civilian_gl_ending_caps_watcher_player_shoots");
    level endon("civreact_terminate");
    while (1) {
        level.player waittill("weapon_fired");
        function_6145ab8334e20d85(level.player);
        waitframe();
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6de7
// Size: 0x31
function function_cd4c7a39360d8657() {
    level notify("civilian_gl_ending_caps_watcher_kid_hostage");
    level endon("civilian_gl_ending_caps_watcher_kid_hostage");
    level endon("civreact_terminate");
    while (1) {
        level waittill("kid_is_a_hostage");
        function_c3b1c08c4de97f52();
        waitframe();
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e1f
// Size: 0x100
function function_c3b1c08c4de97f52() {
    level.civs["ending_cap"] = array_removeundefined(level.civs["ending_cap"]);
    level.civs["ending_cap"] = array_removedead_or_dying(level.civs["ending_cap"]);
    foreach (var_a5638903b40c5a21 in level.civs["ending_cap"]) {
        if (distance(var_a5638903b40c5a21.origin, level.var_691be1fb9619adb.origin) <= 230) {
            var_a5638903b40c5a21._blackboard.var_610cb18ecc1af719 = level.var_691be1fb9619adb;
        } else {
            var_a5638903b40c5a21._blackboard.var_610cb18ecc1af719 = undefined;
        }
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f26
// Size: 0xaf
function function_9eab2622d3518f80() {
    if (!isdefined(level.civs["ending_church_grp"]) || level.civs["ending_church_grp"].size == 0) {
        return;
    }
    foreach (var_a5638903b40c5a21 in level.civs["ending_church_grp"]) {
        var_a5638903b40c5a21.var_f73ef0cdee5d001e = "panicked";
        var_a5638903b40c5a21.var_a2d61fcd0ca0dbb9 = gettime() + randomintrange(1000, 1500);
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fdc
// Size: 0x2b
function function_a5a743ce26ef37b5(animset) {
    if (isdefined(animset) && (animset == "cap_civ_react_4" || animset == "cap_civ_react_4_female")) {
        return 0;
    }
    return 1;
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x700f
// Size: 0x4eb
function function_6145ab8334e20d85(source, var_bc807aa760828d81) {
    source endon("death");
    level.civs["ending_cap"] = array_removeundefined(level.civs["ending_cap"]);
    level.civs["ending_cap"] = array_removedead_or_dying(level.civs["ending_cap"]);
    foreach (var_a5638903b40c5a21 in level.civs["ending_cap"]) {
        if (!isdefined(var_a5638903b40c5a21)) {
            continue;
        }
        if (source == level.var_691be1fb9619adb || istrue(var_bc807aa760828d81) && isdefined(level.var_691be1fb9619adb) && distance(level.var_691be1fb9619adb.origin, var_a5638903b40c5a21.origin) <= 350 && randomint(4) <= 1) {
            var_a5638903b40c5a21._blackboard.var_610cb18ecc1af719 = level.var_691be1fb9619adb;
        } else {
            var_a5638903b40c5a21._blackboard.var_610cb18ecc1af719 = undefined;
        }
        dist = distance(var_a5638903b40c5a21.origin, source.origin);
        if (dist <= 500) {
            if (var_a5638903b40c5a21.var_7afd86c1af40885b == "cower") {
                goto LOC_0000027e;
            }
            if (var_a5638903b40c5a21.var_7afd86c1af40885b != "panicked" && var_a5638903b40c5a21.var_7afd86c1af40885b != "scared") {
                var_469bb23c3ef9a2f8 = randomint(10);
                if (var_469bb23c3ef9a2f8 <= 2) {
                    var_a5638903b40c5a21.var_f73ef0cdee5d001e = "scared";
                } else {
                    var_a5638903b40c5a21.var_f73ef0cdee5d001e = "panicked";
                }
            } else if (var_a5638903b40c5a21.var_7afd86c1af40885b != "panicked") {
                var_a5638903b40c5a21.var_f73ef0cdee5d001e = "panicked";
            } else if (!function_a5a743ce26ef37b5(var_a5638903b40c5a21.animset) || randomint(3) == 0 && !function_b1eeb1edab8e23d4(source, var_a5638903b40c5a21, level.var_b13f1c7f8e404252.var_7e14e46e198de798)) {
                var_a5638903b40c5a21.var_f73ef0cdee5d001e = "cower";
            } else {
                var_a5638903b40c5a21.var_f73ef0cdee5d001e = "panicked";
            LOC_0000027e:
            }
        LOC_0000027e:
            var_a5638903b40c5a21.var_a2d61fcd0ca0dbb9 = gettime() + randomintrange(0, int(dist / 2));
        } else if (dist <= 1000) {
            if (var_a5638903b40c5a21.var_7afd86c1af40885b == "cower") {
                goto LOC_0000037c;
            }
            if (var_a5638903b40c5a21.var_7afd86c1af40885b == "panicked") {
                if (!function_a5a743ce26ef37b5(var_a5638903b40c5a21.animset) || randomint(3) == 0) {
                    var_a5638903b40c5a21.var_f73ef0cdee5d001e = "cower";
                } else {
                    var_a5638903b40c5a21.var_f73ef0cdee5d001e = "panicked";
                }
            } else if (var_a5638903b40c5a21.var_7afd86c1af40885b != "scared") {
                var_469bb23c3ef9a2f8 = randomint(10);
                if (var_469bb23c3ef9a2f8 <= 4) {
                    var_a5638903b40c5a21.var_f73ef0cdee5d001e = "scared";
                } else {
                    var_a5638903b40c5a21.var_f73ef0cdee5d001e = "panicked";
                }
            } else {
                var_a5638903b40c5a21.var_f73ef0cdee5d001e = "panicked";
            LOC_0000037c:
            }
        LOC_0000037c:
            var_a5638903b40c5a21.var_a2d61fcd0ca0dbb9 = gettime() + randomintrange(0, int(dist / 2));
        } else {
            if (var_a5638903b40c5a21.var_7afd86c1af40885b == "cower") {
                goto LOC_000004b5;
            }
            if (var_a5638903b40c5a21.var_7afd86c1af40885b == "panicked") {
                if (!function_a5a743ce26ef37b5(var_a5638903b40c5a21.animset) || randomint(3) == 0) {
                    var_a5638903b40c5a21.var_f73ef0cdee5d001e = "cower";
                } else {
                    var_a5638903b40c5a21.var_f73ef0cdee5d001e = "panicked";
                }
            } else if (var_a5638903b40c5a21.var_7afd86c1af40885b == "scared") {
                var_a5638903b40c5a21.var_f73ef0cdee5d001e = "panicked";
            } else if (var_a5638903b40c5a21.var_7afd86c1af40885b != "curious") {
                var_469bb23c3ef9a2f8 = randomint(10);
                if (var_469bb23c3ef9a2f8 <= 6) {
                    var_a5638903b40c5a21.var_f73ef0cdee5d001e = "curious";
                } else if (var_469bb23c3ef9a2f8 <= 8) {
                    var_a5638903b40c5a21.var_f73ef0cdee5d001e = "scared";
                } else {
                    var_a5638903b40c5a21.var_f73ef0cdee5d001e = "panicked";
                }
            } else {
                var_a5638903b40c5a21.var_f73ef0cdee5d001e = "scared";
            LOC_000004b5:
            }
        LOC_000004b5:
            var_a5638903b40c5a21.var_a2d61fcd0ca0dbb9 = gettime() + 500 + randomintrange(0, int(dist));
        }
    }
}

// Namespace namespace_54acaf301486afc6/namespace_2b520709cc9e7442
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7501
// Size: 0xe3
function function_47c84e03dcbc5aa7(var_1cfccac3e5778bbb) {
    if (utility::ismp()) {
        var_afc2f18cdaa6c9cc = [];
        foreach (player in level.players) {
            if (!isalive(player) || isdefined(player.fauxdead) || istrue(player.delayedspawnedplayernotify)) {
                continue;
            }
            var_afc2f18cdaa6c9cc[var_afc2f18cdaa6c9cc.size] = player;
        }
        if (var_afc2f18cdaa6c9cc.size == 0) {
            return sortbydistance(level.players, var_1cfccac3e5778bbb)[0];
        } else if (var_afc2f18cdaa6c9cc.size == 1) {
            return var_afc2f18cdaa6c9cc[0];
        } else {
            return sortbydistance(var_afc2f18cdaa6c9cc, var_1cfccac3e5778bbb)[0];
        }
    } else {
        return level.player;
    }
}

