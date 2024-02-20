// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\anim.gsc;
#using scripts\common\notetrack.gsc;
#using script_308091d56071a91c;
#using script_784c8c4f3e5f8686;
#using script_3b64eb40368c1450;
#using script_663ff1906e9fe70;
#using script_16ea1b94f0f381b3;

#namespace scene;

// Namespace scene/namespace_32d725839544d40a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c
// Size: 0x3c
function play(var_2b23f2a75a7eb443, var_c38eb8ba73256bfb, scriptbundlename, var_f7ab585bff4b110) {
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_7e5354b44c829c9e(var_2b23f2a75a7eb443, var_c38eb8ba73256bfb, scriptbundlename, var_f7ab585bff4b110);
}

// Namespace scene/namespace_32d725839544d40a
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x27f
// Size: 0x5c
function function_24e44cdb807b87ba(var_198fc279325346db, var_2b23f2a75a7eb443, var_c38eb8ba73256bfb, scriptbundlename, var_f7ab585bff4b110) {
    if (!isdefined(var_198fc279325346db)) {
        var_198fc279325346db = 1;
    }
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_6438932e35cbbfb7(var_2b23f2a75a7eb443, var_c38eb8ba73256bfb, var_198fc279325346db, scriptbundlename);
    wait(var_198fc279325346db);
    var_5aaf7c7163c04623 play(var_2b23f2a75a7eb443, var_c38eb8ba73256bfb, scriptbundlename, var_f7ab585bff4b110);
}

// Namespace scene/namespace_32d725839544d40a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e2
// Size: 0x37
function init(var_2b23f2a75a7eb443, var_c38eb8ba73256bfb, scriptbundlename) {
    var_5aaf7c7163c04623 = self;
    return var_5aaf7c7163c04623 function_a9fc7e7dfd78e15e(var_2b23f2a75a7eb443, var_c38eb8ba73256bfb, scriptbundlename, "scene_init_user");
}

// Namespace scene/namespace_32d725839544d40a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x321
// Size: 0x167
function skip(var_c38eb8ba73256bfb, var_870ed163bd3036dd, var_f77f80bf8f02d9f9) {
    if (!isdefined(var_870ed163bd3036dd)) {
        var_870ed163bd3036dd = 0.5;
    }
    if (!isdefined(var_f77f80bf8f02d9f9)) {
        var_f77f80bf8f02d9f9 = 0.5;
    }
    var_5aaf7c7163c04623 = self;
    state = var_5aaf7c7163c04623 get_state();
    if (state != "Playing") {
        return;
    }
    var_568f62a24b19c46d = var_5aaf7c7163c04623 function_e6197350552df14b(var_c38eb8ba73256bfb, 0);
    if (!isdefined(var_568f62a24b19c46d)) {
        return;
    }
    if (var_f77f80bf8f02d9f9 > 0) {
        namespace_26a75045c9dd4bcb::fade_out(var_f77f80bf8f02d9f9);
        waitframe();
    }
    totalseconds = 0;
    foreach (var_698da5af57b757e7 in var_568f62a24b19c46d.var_df5db7bd235f2729) {
        totalseconds = totalseconds + var_5aaf7c7163c04623 function_30140edcf9e36027(var_568f62a24b19c46d, var_698da5af57b757e7);
    }
    if (var_f77f80bf8f02d9f9 > 0) {
        thread namespace_26a75045c9dd4bcb::fade_in(var_f77f80bf8f02d9f9);
    }
    if (totalseconds <= 0 || var_870ed163bd3036dd >= totalseconds) {
        return;
    }
    timefrac = (totalseconds - var_870ed163bd3036dd) / totalseconds;
    var_568f62a24b19c46d function_5a438716f043fddc(timefrac, var_568f62a24b19c46d.var_df5db7bd235f2729);
    var_5aaf7c7163c04623 function_7e5354b44c829c9e(undefined, var_c38eb8ba73256bfb, undefined, timefrac, var_568f62a24b19c46d.var_adf03bdd42111106);
    var_5aaf7c7163c04623 function_bb980ac4246f5baa("callback_skipped");
}

// Namespace scene/namespace_32d725839544d40a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48f
// Size: 0xa0
function stop() {
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_bd09568f76dd40ca();
    if (var_5aaf7c7163c04623 get_state() == "Playing") {
        foreach (var_568f62a24b19c46d in var_5aaf7c7163c04623.var_84b542bb7490bea7.var_568f62a24b19c46d) {
            var_568f62a24b19c46d thread function_28f230671b0b9a1f(1);
        }
        waittillframeend();
        while (var_5aaf7c7163c04623 get_state() == "Playing") {
            waitframe();
        }
    }
}

// Namespace scene/namespace_32d725839544d40a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x536
// Size: 0x21a
function cleanup(var_4b1151feb587e9ae) {
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623.var_aadf0dea942accd5 = undefined;
    if (istrue(var_4b1151feb587e9ae) && isdefined(var_5aaf7c7163c04623.var_cf24d127aa3920a0)) {
        foreach (entity in var_5aaf7c7163c04623.var_cf24d127aa3920a0) {
            if (!isdefined(entity)) {
                continue;
            }
            if (isagent(entity)) {
                entity.nocorpse = 1;
                entity val::function_c9d0b43701bdba00("scene_shot");
                entity kill();
            } else {
                entity delete();
            }
        }
        var_5aaf7c7163c04623.var_cf24d127aa3920a0 = undefined;
    }
    if (var_5aaf7c7163c04623 get_state() != "NotSetup") {
        var_5aaf7c7163c04623 function_5b54476c3a0cd83f();
    }
    if (var_5aaf7c7163c04623 get_state() == "NotInit") {
        return;
    }
    if (isdefined(var_5aaf7c7163c04623) && !isdefined(var_5aaf7c7163c04623.var_cf24d127aa3920a0)) {
        var_5aaf7c7163c04623.var_cf24d127aa3920a0 = [];
    }
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_5aaf7c7163c04623.var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = var_5aaf7c7163c04623.var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        if (isdefined(var_214d924f4e137244) && isdefined(var_214d924f4e137244.entity) && !istrue(var_214d924f4e137244.var_423f55edd900883)) {
            if (istrue(var_4b1151feb587e9ae)) {
                var_214d924f4e137244 function_746341289f892160();
            } else if (!isplayer(var_214d924f4e137244.entity)) {
                var_5aaf7c7163c04623.var_cf24d127aa3920a0[var_214d924f4e137244.entity getentitynumber()] = var_214d924f4e137244.entity;
            }
        }
    }
    if (isdefined(var_5aaf7c7163c04623) && isdefined(var_5aaf7c7163c04623.var_cf24d127aa3920a0) && var_5aaf7c7163c04623.var_cf24d127aa3920a0.size == 0) {
        var_5aaf7c7163c04623.var_cf24d127aa3920a0 = undefined;
    }
    var_5aaf7c7163c04623 function_c643b2c6b794481e("NotInit");
}

// Namespace scene/namespace_32d725839544d40a
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x757
// Size: 0x694
function function_6438932e35cbbfb7(var_2b23f2a75a7eb443, var_c38eb8ba73256bfb, duration, scriptbundlename, predicttime) {
    if (!isdefined(duration)) {
        duration = 5;
    }
    if (!isdefined(scriptbundlename)) {
        scriptbundlename = undefined;
    }
    if (!isdefined(predicttime)) {
        predicttime = 0;
    }
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_70090b9a8db66aeb(scriptbundlename);
    if (!var_5aaf7c7163c04623 function_bd09568f76dd40ca()) {
        return;
    }
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    if (isdefined(var_2b23f2a75a7eb443) && !isarray(var_2b23f2a75a7eb443)) {
        var_2b23f2a75a7eb443 = [0:var_2b23f2a75a7eb443];
    }
    state = var_5aaf7c7163c04623 get_state();
    var_568f62a24b19c46d = undefined;
    var_db52b4a8aba13320 = var_5aaf7c7163c04623 function_6a6ec88abab6a723();
    var_51d2f645ad8afdaf = [];
    if (!isdefined(var_c38eb8ba73256bfb)) {
        var_c38eb8ba73256bfb = var_5aaf7c7163c04623 function_8a37fe423de2b9db();
    }
    if (!isarray(var_c38eb8ba73256bfb)) {
        var_c38eb8ba73256bfb = [0:var_c38eb8ba73256bfb];
    }
    foreach (shotname in var_c38eb8ba73256bfb) {
        var_698da5af57b757e7 = var_db52b4a8aba13320 function_eed2bf36a4defb90(shotname);
        var_51d2f645ad8afdaf[var_698da5af57b757e7] = var_698da5af57b757e7;
    }
    foreach (var_370294f3b91920df in var_84b542bb7490bea7.var_568f62a24b19c46d) {
        if (utility::is_equal(var_370294f3b91920df.state, "Playing")) {
            var_a1709fdb12562ef0 = utility::array_intersection(var_370294f3b91920df.var_df5db7bd235f2729, var_51d2f645ad8afdaf);
            if (var_a1709fdb12562ef0.size == var_51d2f645ad8afdaf.size) {
                var_568f62a24b19c46d = var_370294f3b91920df;
                break;
            }
        }
    }
    if (!isdefined(var_568f62a24b19c46d)) {
        var_568f62a24b19c46d = var_5aaf7c7163c04623 function_a9fc7e7dfd78e15e(var_2b23f2a75a7eb443, var_c38eb8ba73256bfb, undefined, "scene_init_prestream");
    }
    if (isdefined(var_568f62a24b19c46d) && var_568f62a24b19c46d.var_df5db7bd235f2729.size > 0) {
        var_568f62a24b19c46d.var_868bf033439639da = spawnstruct();
        var_568f62a24b19c46d.var_868bf033439639da.players = [];
        var_568f62a24b19c46d.var_868bf033439639da.objects = [];
        /#
            var_8c3ac4ace886c14e = [];
        #/
        foreach (var_698da5af57b757e7 in var_51d2f645ad8afdaf) {
            var_568f62a24b19c46d function_218d0124f21f73b1(var_698da5af57b757e7);
            foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in var_568f62a24b19c46d.var_137e0a58e2c9d26) {
                if (isdefined(var_19a1a40cf0ff83b9[var_698da5af57b757e7])) {
                    var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
                    var_214d924f4e137244 thread function_b62972e8f5541b26(var_568f62a24b19c46d, var_698da5af57b757e7);
                }
            }
            /#
                var_8c3ac4ace886c14e[var_8c3ac4ace886c14e.size] = var_698da5af57b757e7;
            #/
            predicttime = predicttime - var_568f62a24b19c46d.var_5aaf7c7163c04623 function_d9be975d8d1c9db3(var_698da5af57b757e7);
            if (predicttime <= 0) {
                break;
            }
        }
        /#
            if (var_568f62a24b19c46d.var_868bf033439639da.players.size == 0) {
                iprintlnbold("<unknown string>");
            }
        #/
        foreach (var_ad63323b4b7fde00 in var_568f62a24b19c46d.var_868bf033439639da.players) {
            entities = [];
            distances = [];
            player = var_ad63323b4b7fde00.player;
            foreach (var_3df9d9a1027fb9bc in var_ad63323b4b7fde00.var_cc336c187ee5a23d) {
                var_411e3d84deda6ebc = sortbydistance(var_568f62a24b19c46d.var_868bf033439639da.objects, var_3df9d9a1027fb9bc);
                foreach (var_428335b47172b26e in var_411e3d84deda6ebc) {
                    if (!isent(var_428335b47172b26e.entity)) {
                        continue;
                    }
                    entnum = var_428335b47172b26e.entity getentitynumber();
                    dist = distance(var_3df9d9a1027fb9bc, var_428335b47172b26e.origin);
                    if (!isdefined(entities[entnum])) {
                        entities[entnum] = var_428335b47172b26e.entity;
                        distances[entnum] = dist;
                    } else {
                        distances[entnum] = min(distances[entnum], dist);
                    }
                }
            }
            /#
                if (var_ad63323b4b7fde00.var_cc336c187ee5a23d.size > 2) {
                    iprintlnbold("<unknown string>");
                }
            #/
            var_9f63a2ada6054c66 = [];
            var_9a002fb2983c9cef = [];
            foreach (entnum, entity in entities) {
                if (var_9f63a2ada6054c66.size >= 16) {
                    /#
                        iprintlnbold("<unknown string>" + 16);
                    #/
                    break;
                }
                var_9f63a2ada6054c66[var_9f63a2ada6054c66.size] = entity;
                var_9a002fb2983c9cef[var_9a002fb2983c9cef.size] = distances[entnum];
            }
            if (isdefined(player)) {
                /#
                    var_568f62a24b19c46d function_ffae6ec92028ce08(var_8c3ac4ace886c14e, duration, var_ad63323b4b7fde00.var_cc336c187ee5a23d);
                #/
                player utility::player_prestream_camera(var_ad63323b4b7fde00.var_cc336c187ee5a23d[0], duration, var_ad63323b4b7fde00.var_cc336c187ee5a23d[1]);
                player utility::player_prestream_entities(var_9f63a2ada6054c66, var_9a002fb2983c9cef, duration);
            }
        }
        var_568f62a24b19c46d.var_2b0ae4dffc850db2 = undefined;
        if (duration > 0) {
            var_568f62a24b19c46d.var_2b0ae4dffc850db2 = gettime() + duration * 1000;
        } else if (duration < 0) {
            var_568f62a24b19c46d.var_2b0ae4dffc850db2 = -1;
        }
        var_568f62a24b19c46d.var_868bf033439639da = undefined;
    }
}

// Namespace scene/namespace_32d725839544d40a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf2
// Size: 0x76
function function_8a37fe423de2b9db() {
    var_5aaf7c7163c04623 = self;
    var_db52b4a8aba13320 = var_5aaf7c7163c04623 function_6a6ec88abab6a723();
    var_c38eb8ba73256bfb = [];
    shotcount = var_db52b4a8aba13320 function_d1338e27a26ecaeb();
    for (var_698da5af57b757e7 = 0; var_698da5af57b757e7 < shotcount; var_698da5af57b757e7++) {
        shot = var_db52b4a8aba13320 function_2218afa82a590ea3(var_698da5af57b757e7);
        var_c38eb8ba73256bfb[var_698da5af57b757e7] = shot function_55042076624e1180();
    }
    return var_c38eb8ba73256bfb;
}

// Namespace scene/namespace_32d725839544d40a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe70
// Size: 0x10d
function function_3f8173e45076d687(var_2a29e57c1c105d52, filter) {
    if (!isdefined(filter)) {
        filter = "all";
    }
    var_5aaf7c7163c04623 = self;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    entities = [];
    if (!isdefined(var_84b542bb7490bea7)) {
        return entities;
    }
    var_51d2f645ad8afdaf = var_5aaf7c7163c04623 function_14d02a749939e837(var_2a29e57c1c105d52);
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        if (isdefined(var_51d2f645ad8afdaf) && !var_214d924f4e137244 function_225d78e3c485a7ae(var_51d2f645ad8afdaf)) {
            continue;
        }
        switch (filter) {
        case #"hash_d71fd9ff6b033b7a":
            if (istrue(var_214d924f4e137244.var_423f55edd900883) || var_214d924f4e137244.var_9be58c68789faf5c function_d5f4474a16f90132() != "None") {
                continue;
            }
            break;
        }
        entities[entities.size] = var_214d924f4e137244.entity;
    }
    return entities;
}

// Namespace scene/namespace_32d725839544d40a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf85
// Size: 0x3d
function function_fd344c13b4433aaf(var_9f7e823a4cdab21d) {
    var_5aaf7c7163c04623 = self;
    var_214d924f4e137244 = var_5aaf7c7163c04623 get_object(var_9f7e823a4cdab21d);
    if (isdefined(var_214d924f4e137244)) {
        return var_214d924f4e137244.entity;
    }
    return undefined;
}

// Namespace scene/namespace_32d725839544d40a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfca
// Size: 0xdb
function get_object(var_8a2a5f9c6428c06c) {
    var_5aaf7c7163c04623 = self;
    if (!isdefined(var_5aaf7c7163c04623.var_84b542bb7490bea7)) {
        return undefined;
    }
    if (!isdefined(var_8a2a5f9c6428c06c)) {
        return undefined;
    }
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_db52b4a8aba13320 = var_5aaf7c7163c04623 function_6a6ec88abab6a723();
    if (isint(var_8a2a5f9c6428c06c)) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_8a2a5f9c6428c06c];
        if (isdefined(var_214d924f4e137244)) {
            return var_214d924f4e137244;
        }
    } else {
        for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
            var_9be58c68789faf5c = var_db52b4a8aba13320 function_bfc4196d3da11705(var_56f4af8746a2d458);
            if (var_9be58c68789faf5c function_aeb2b46911a5811d() == var_8a2a5f9c6428c06c) {
                var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
                return var_214d924f4e137244;
            }
        }
    }
    return undefined;
}

// Namespace scene/namespace_32d725839544d40a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10ad
// Size: 0x107
function function_6cb938788c210309(var_8a2a5f9c6428c06c, var_7c76f3de91f4cf3d, scriptbundlename) {
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_70090b9a8db66aeb(scriptbundlename);
    if (!var_5aaf7c7163c04623 function_bd09568f76dd40ca()) {
        return var_5aaf7c7163c04623;
    }
    if (!isdefined(var_8a2a5f9c6428c06c)) {
        return var_5aaf7c7163c04623;
    }
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_214d924f4e137244 = var_5aaf7c7163c04623 get_object(var_8a2a5f9c6428c06c);
    if (!isdefined(var_214d924f4e137244)) {
        return var_5aaf7c7163c04623;
    }
    var_698da5af57b757e7 = var_7c76f3de91f4cf3d;
    if (!isint(var_698da5af57b757e7)) {
        var_698da5af57b757e7 = var_84b542bb7490bea7.var_db52b4a8aba13320 function_924e47d1f90e6366(var_698da5af57b757e7);
    }
    if (!isdefined(var_698da5af57b757e7)) {
        return var_5aaf7c7163c04623;
    }
    if (var_698da5af57b757e7 < 0 || var_698da5af57b757e7 >= var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots.size) {
        return var_5aaf7c7163c04623;
    }
    var_bae27d121b581202 = var_84b542bb7490bea7.var_db52b4a8aba13320 function_ab3ec43370c405d2(var_5aaf7c7163c04623, var_698da5af57b757e7, var_214d924f4e137244.index);
    function_e4fc30ccdca08b9d(var_bae27d121b581202);
    return var_bae27d121b581202;
}

// Namespace scene/namespace_32d725839544d40a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x11bc
// Size: 0xe6
function function_10a1cbb13da3a4fe(var_8a2a5f9c6428c06c, var_7c76f3de91f4cf3d, scriptbundlename) {
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_70090b9a8db66aeb(scriptbundlename);
    if (!var_5aaf7c7163c04623 function_bd09568f76dd40ca()) {
        return [];
    }
    if (!isdefined(var_8a2a5f9c6428c06c)) {
        return [];
    }
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_214d924f4e137244 = var_5aaf7c7163c04623 get_object(var_8a2a5f9c6428c06c);
    if (!isdefined(var_214d924f4e137244)) {
        return [];
    }
    var_698da5af57b757e7 = var_7c76f3de91f4cf3d;
    if (!isint(var_698da5af57b757e7)) {
        var_698da5af57b757e7 = var_84b542bb7490bea7.var_db52b4a8aba13320 function_924e47d1f90e6366(var_698da5af57b757e7);
    }
    if (!isdefined(var_698da5af57b757e7)) {
        return [];
    }
    if (var_698da5af57b757e7 < 0 || var_698da5af57b757e7 >= var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots.size) {
        return [];
    }
    return var_214d924f4e137244.var_9be58c68789faf5c function_79edcc9987330a2a(var_698da5af57b757e7);
}

// Namespace scene/namespace_32d725839544d40a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12aa
// Size: 0xf4
function function_77751080050d2cb1(var_10aa9e765594956e, var_2a29e57c1c105d52, scriptbundlename) {
    var_5aaf7c7163c04623 = self;
    /#
        assert(isstring(var_10aa9e765594956e));
    #/
    var_5aaf7c7163c04623 function_70090b9a8db66aeb(scriptbundlename);
    if (!var_5aaf7c7163c04623 function_bd09568f76dd40ca()) {
        return [];
    }
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    objects = [];
    var_51d2f645ad8afdaf = var_5aaf7c7163c04623 function_14d02a749939e837(var_2a29e57c1c105d52);
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        if (var_214d924f4e137244.var_9be58c68789faf5c function_c77857d663e8cfbe() != var_10aa9e765594956e) {
            continue;
        }
        if (isdefined(var_51d2f645ad8afdaf) && !var_214d924f4e137244 function_225d78e3c485a7ae(var_51d2f645ad8afdaf)) {
            continue;
        }
        objects[objects.size] = var_214d924f4e137244;
    }
    return objects;
}

// Namespace scene/namespace_32d725839544d40a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13a6
// Size: 0x3e
function function_bc521bee52fde214(rate) {
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_6a66a98742866fed();
    var_5aaf7c7163c04623.var_aadf0dea942accd5.animrate = rate;
    function_d225e757dea4eca6();
}

// Namespace scene/namespace_32d725839544d40a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13eb
// Size: 0x8b
function function_b0b8f796886a9c81(var_96ae84e32c080c4) {
    var_5aaf7c7163c04623 = self;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        if (isdefined(var_214d924f4e137244.entity)) {
            var_214d924f4e137244.entity namespace_53fc9ddbb516e6e1::function_cea710f9d017694a(var_96ae84e32c080c4);
        }
    }
}

// Namespace scene/namespace_32d725839544d40a
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x147d
// Size: 0xec
function function_ddebd5f650117455(var_8a2a5f9c6428c06c, var_7c76f3de91f4cf3d, var_816ed2eb8fd78e89, var_17b73aa1820974ee, scriptbundlename) {
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_70090b9a8db66aeb(scriptbundlename);
    if (!var_5aaf7c7163c04623 function_bd09568f76dd40ca()) {
        return;
    }
    if (!isdefined(var_8a2a5f9c6428c06c)) {
        return;
    }
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_214d924f4e137244 = var_5aaf7c7163c04623 get_object(var_8a2a5f9c6428c06c);
    if (!isdefined(var_214d924f4e137244)) {
        return;
    }
    var_698da5af57b757e7 = var_7c76f3de91f4cf3d;
    if (!isint(var_698da5af57b757e7)) {
        var_698da5af57b757e7 = var_84b542bb7490bea7.var_db52b4a8aba13320 function_924e47d1f90e6366(var_698da5af57b757e7);
    }
    if (!isdefined(var_698da5af57b757e7)) {
        return;
    }
    if (var_698da5af57b757e7 < 0 || var_698da5af57b757e7 >= var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots.size) {
        return;
    }
    var_214d924f4e137244 function_5a65e42126f29a4f(var_698da5af57b757e7, var_816ed2eb8fd78e89, var_17b73aa1820974ee);
}

// Namespace scene/namespace_32d725839544d40a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1570
// Size: 0x54
function function_70090b9a8db66aeb(scriptbundlename) {
    var_5aaf7c7163c04623 = self;
    if (isdefined(scriptbundlename)) {
        if (isdefined(var_5aaf7c7163c04623.var_8ac77218f7a34e3e) && var_5aaf7c7163c04623.var_8ac77218f7a34e3e != scriptbundlename) {
            var_5aaf7c7163c04623 cleanup(1);
        }
        var_5aaf7c7163c04623.var_8ac77218f7a34e3e = scriptbundlename;
    }
}

// Namespace scene/namespace_32d725839544d40a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15cb
// Size: 0xa5
function add_spawn_function(spawnfunc, var_6bff09752f736d14) {
    if (!isdefined(var_6bff09752f736d14)) {
        var_6bff09752f736d14 = "_object_all_";
    }
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_6a66a98742866fed();
    var_aadf0dea942accd5 = var_5aaf7c7163c04623.var_aadf0dea942accd5;
    if (!isdefined(var_aadf0dea942accd5.var_8124e3f14d523a45)) {
        var_aadf0dea942accd5.var_8124e3f14d523a45 = [];
    }
    if (!isdefined(var_aadf0dea942accd5.var_8124e3f14d523a45[var_6bff09752f736d14])) {
        var_aadf0dea942accd5.var_8124e3f14d523a45[var_6bff09752f736d14] = [];
    }
    var_aadf0dea942accd5.var_8124e3f14d523a45[var_6bff09752f736d14][var_aadf0dea942accd5.var_8124e3f14d523a45[var_6bff09752f736d14].size] = spawnfunc;
}

// Namespace scene/namespace_32d725839544d40a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1677
// Size: 0xdc
function get_state() {
    var_5aaf7c7163c04623 = self;
    if (!isdefined(var_5aaf7c7163c04623.var_84b542bb7490bea7)) {
        return "NotInit";
    }
    var_5aaf7c7163c04623 function_bd09568f76dd40ca();
    if (var_5aaf7c7163c04623.var_84b542bb7490bea7.state == "Setup") {
        foreach (var_568f62a24b19c46d in var_5aaf7c7163c04623.var_84b542bb7490bea7.var_568f62a24b19c46d) {
            if (var_568f62a24b19c46d.state == "Playing") {
                return "Playing";
            }
        }
        return "Stopped";
    } else {
        return var_5aaf7c7163c04623.var_84b542bb7490bea7.state;
    }
}

// Namespace scene/namespace_32d725839544d40a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x175a
// Size: 0x55
function function_263e37fc44b91d4f(var_4cff1f55069da31c) {
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_6a66a98742866fed();
    if (!istrue(var_4cff1f55069da31c)) {
        var_5aaf7c7163c04623.var_aadf0dea942accd5.var_94564218dd6125b9 = undefined;
    } else {
        var_5aaf7c7163c04623.var_aadf0dea942accd5.var_94564218dd6125b9 = 1;
    }
}

// Namespace scene/namespace_32d725839544d40a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b6
// Size: 0x55
function function_595670eb4c1bdf59(var_8d59d732cf917fb2) {
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_6a66a98742866fed();
    if (!istrue(var_8d59d732cf917fb2)) {
        var_5aaf7c7163c04623.var_aadf0dea942accd5.var_8f28f8f196c70a58 = undefined;
    } else {
        var_5aaf7c7163c04623.var_aadf0dea942accd5.var_8f28f8f196c70a58 = 1;
    }
}

// Namespace scene/namespace_32d725839544d40a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1812
// Size: 0x55
function function_2136d6e5467c6caf(var_da75af8d8c3a50e4) {
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_6a66a98742866fed();
    if (var_da75af8d8c3a50e4 >= 0) {
        var_5aaf7c7163c04623.var_aadf0dea942accd5.var_ce9c0a8610712c8d = var_da75af8d8c3a50e4;
    } else {
        var_5aaf7c7163c04623.var_aadf0dea942accd5.var_ce9c0a8610712c8d = undefined;
    }
}

// Namespace scene/namespace_32d725839544d40a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186e
// Size: 0x10f
function add_scene_func(var_53b2db31346dacbd, func, var_8338711a0d65673b) {
    var_8b9b8dc4050f9000 = undefined;
    if (isstring(var_53b2db31346dacbd)) {
        var_8b9b8dc4050f9000 = level.scene;
    } else if (isstruct(var_53b2db31346dacbd)) {
        var_5aaf7c7163c04623 = var_53b2db31346dacbd;
        var_5aaf7c7163c04623 function_6a66a98742866fed();
        var_8b9b8dc4050f9000 = var_5aaf7c7163c04623.var_aadf0dea942accd5;
        var_53b2db31346dacbd = var_5aaf7c7163c04623 function_6c0e3626ebce826f();
    } else {
        /#
            assertmsg("must be called on the level where scene_ref is either a scene bundle name or a scene root object");
        #/
    }
    var_8b9b8dc4050f9000.funcs = utility::function_53c4c53197386572(var_8b9b8dc4050f9000.funcs, []);
    var_8b9b8dc4050f9000.funcs[var_53b2db31346dacbd] = utility::function_53c4c53197386572(var_8b9b8dc4050f9000.funcs[var_53b2db31346dacbd], []);
    var_8b9b8dc4050f9000.funcs[var_53b2db31346dacbd][var_8338711a0d65673b] = utility::function_53c4c53197386572(var_8b9b8dc4050f9000.funcs[var_53b2db31346dacbd][var_8338711a0d65673b], []);
    var_8b9b8dc4050f9000.funcs[var_53b2db31346dacbd][var_8338711a0d65673b] = utility::function_6d6af8144a5131f1(var_8b9b8dc4050f9000.funcs[var_53b2db31346dacbd][var_8338711a0d65673b], func);
}

// Namespace scene/namespace_32d725839544d40a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1984
// Size: 0xff
function remove_scene_func(var_53b2db31346dacbd, func, var_8338711a0d65673b) {
    var_8b9b8dc4050f9000 = undefined;
    if (isstring(var_53b2db31346dacbd)) {
        var_8b9b8dc4050f9000 = level.scene;
    } else if (isstruct(var_53b2db31346dacbd)) {
        var_5aaf7c7163c04623 = var_53b2db31346dacbd;
        var_5aaf7c7163c04623 function_bd09568f76dd40ca();
        var_53b2db31346dacbd = var_5aaf7c7163c04623 function_6c0e3626ebce826f();
        var_8b9b8dc4050f9000 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    } else {
        /#
            assertmsg("must be called on the level where scene_ref is either a scene bundle name or a scene root object");
        #/
    }
    if (!isdefined(var_8b9b8dc4050f9000.funcs)) {
        return 0;
    }
    if (!isdefined(var_8b9b8dc4050f9000.funcs[var_53b2db31346dacbd])) {
        return 0;
    }
    if (!isdefined(var_8b9b8dc4050f9000.funcs[var_53b2db31346dacbd][var_8338711a0d65673b])) {
        return 0;
    }
    if (utility::array_contains(var_8b9b8dc4050f9000.funcs[var_53b2db31346dacbd][var_8338711a0d65673b], func)) {
        var_8b9b8dc4050f9000.funcs[var_53b2db31346dacbd][var_8338711a0d65673b] = utility::array_remove(var_8b9b8dc4050f9000.funcs[var_53b2db31346dacbd][var_8338711a0d65673b], func);
        return 1;
    }
    return 0;
}

// Namespace scene/namespace_32d725839544d40a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8b
// Size: 0xa7
function function_a07af33558d3050f(var_891c23d72f418e61, var_c1b61ccbfb03f1f2, var_ef9359cb724d0ea3) {
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_6a66a98742866fed();
    if (!isdefined(var_ef9359cb724d0ea3)) {
        var_ef9359cb724d0ea3 = "Stopped";
    }
    /#
        if (var_ef9359cb724d0ea3 != "<unknown string>" && var_ef9359cb724d0ea3 != "<unknown string>") {
            /#
                assertmsg("<unknown string>");
            #/
        }
    #/
    var_5aaf7c7163c04623.var_aadf0dea942accd5.var_c586ec36655fd62f = var_891c23d72f418e61;
    var_5aaf7c7163c04623.var_aadf0dea942accd5.var_51b0b5d62d2618a0 = var_c1b61ccbfb03f1f2;
    var_5aaf7c7163c04623.var_aadf0dea942accd5.var_68d7a81a3effb349 = var_ef9359cb724d0ea3;
}

// Namespace scene/namespace_32d725839544d40a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b39
// Size: 0x1cd
function function_8207074e79f22926(var_891c23d72f418e61, note, var_6bff09752f736d14, repeat) {
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_6a66a98742866fed();
    var_aadf0dea942accd5 = var_5aaf7c7163c04623.var_aadf0dea942accd5;
    var_ef9c48b2fc3a9ce4 = spawnstruct();
    var_ef9c48b2fc3a9ce4.var_c586ec36655fd62f = var_891c23d72f418e61;
    var_ef9c48b2fc3a9ce4.var_b9954627fcce58b4 = note;
    var_ef9c48b2fc3a9ce4.var_a981703f16897b47 = repeat;
    var_6bff09752f736d14 = function_53c4c53197386572(var_6bff09752f736d14, "_object_all_");
    if (!isdefined(var_aadf0dea942accd5.notifies)) {
        var_aadf0dea942accd5.notifies = [];
    }
    if (!isdefined(var_aadf0dea942accd5.notifies[var_6bff09752f736d14])) {
        var_aadf0dea942accd5.notifies[var_6bff09752f736d14] = [];
    }
    if (function_85b2629a7bbafad9(var_aadf0dea942accd5.notifies["_object_all_"], var_ef9c48b2fc3a9ce4)) {
        return;
    }
    if (function_85b2629a7bbafad9(var_aadf0dea942accd5.notifies[var_6bff09752f736d14], var_ef9c48b2fc3a9ce4)) {
        return;
    }
    var_aadf0dea942accd5.notifies[var_6bff09752f736d14][var_aadf0dea942accd5.notifies[var_6bff09752f736d14].size] = var_ef9c48b2fc3a9ce4;
    if (var_5aaf7c7163c04623 get_state() == "Playing") {
        for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_5aaf7c7163c04623.var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
            var_214d924f4e137244 = var_5aaf7c7163c04623.var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
            if (isdefined(var_214d924f4e137244) && isdefined(var_214d924f4e137244.var_36831a04af11576f) && isdefined(var_214d924f4e137244.var_36831a04af11576f["DeltaAnimation"])) {
                var_214d924f4e137244 thread function_924dc6425bd2b70d(var_214d924f4e137244.var_36831a04af11576f["DeltaAnimation"]);
            }
        }
    }
}

// Namespace scene/namespace_32d725839544d40a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d0d
// Size: 0xcd
function private function_85b2629a7bbafad9(notifies, var_527860a5d22aaab4) {
    if (!isdefined(notifies)) {
        return 0;
    }
    foreach (var_b628ab4a4e13e004 in notifies) {
        if (var_b628ab4a4e13e004.var_c586ec36655fd62f == var_527860a5d22aaab4.var_c586ec36655fd62f && var_b628ab4a4e13e004.var_b9954627fcce58b4 == var_527860a5d22aaab4.var_b9954627fcce58b4 && utility::function_53c4c53197386572(var_b628ab4a4e13e004.var_a981703f16897b47, 0) == utility::function_53c4c53197386572(var_527860a5d22aaab4.var_a981703f16897b47, 0)) {
            var_b628ab4a4e13e004.var_d516421e67c11065 = undefined;
            return 1;
        }
    }
    return 0;
}

// Namespace scene/namespace_32d725839544d40a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de2
// Size: 0x210
function function_d9be975d8d1c9db3(var_7c76f3de91f4cf3d, var_c5b4f177c96bcce1) {
    var_5aaf7c7163c04623 = self;
    if (!var_5aaf7c7163c04623 function_bd09568f76dd40ca()) {
        return 0;
    }
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_698da5af57b757e7 = var_7c76f3de91f4cf3d;
    if (!isint(var_698da5af57b757e7)) {
        var_698da5af57b757e7 = var_84b542bb7490bea7.var_db52b4a8aba13320 function_924e47d1f90e6366(var_698da5af57b757e7);
    }
    if (!isdefined(var_698da5af57b757e7)) {
        return 0;
    }
    if (var_698da5af57b757e7 < 0) {
        return 0;
    }
    var_c5b4f177c96bcce1 = utility::function_53c4c53197386572(var_c5b4f177c96bcce1, 1);
    var_ba7c51f4385e6b48 = 0;
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        if (var_698da5af57b757e7 < var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.shots.size) {
            CameraAnimation = var_214d924f4e137244 function_6c3d100538f590b3(var_698da5af57b757e7);
            if (isdefined(CameraAnimation)) {
                var_4aade63686d9cdf2 = var_214d924f4e137244 function_9c0d01ef917ee30(CameraAnimation, "CameraAnimation");
                if (var_4aade63686d9cdf2 > var_ba7c51f4385e6b48) {
                    var_ba7c51f4385e6b48 = var_4aade63686d9cdf2;
                }
            }
            var_755a82d10fefd14 = 0;
            animtype = var_214d924f4e137244.var_9be58c68789faf5c function_92192185fc7c5500();
            var_7535cec6dfd38a5e = var_214d924f4e137244.var_9be58c68789faf5c function_79edcc9987330a2a(var_698da5af57b757e7);
            for (var_6dba2c33a7be786f = 0; var_6dba2c33a7be786f < var_7535cec6dfd38a5e.size; var_6dba2c33a7be786f++) {
                var_755a82d10fefd14 = var_755a82d10fefd14 + var_214d924f4e137244 function_9c0d01ef917ee30(var_7535cec6dfd38a5e[var_6dba2c33a7be786f], animtype);
            }
            if (var_755a82d10fefd14 > var_ba7c51f4385e6b48) {
                var_ba7c51f4385e6b48 = var_755a82d10fefd14;
            }
        }
    }
    if (isdefined(var_5aaf7c7163c04623.var_aadf0dea942accd5) && isdefined(var_5aaf7c7163c04623.var_aadf0dea942accd5.animrate) && var_c5b4f177c96bcce1) {
        var_ba7c51f4385e6b48 = var_ba7c51f4385e6b48 * var_5aaf7c7163c04623.var_aadf0dea942accd5.animrate;
    }
    return var_ba7c51f4385e6b48;
}

// Namespace scene/namespace_32d725839544d40a
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ffa
// Size: 0x7c9
function private function_a9fc7e7dfd78e15e(var_2b23f2a75a7eb443, var_c38eb8ba73256bfb, scriptbundlename, var_5ce6119315ff5b97) {
    var_5aaf7c7163c04623 = self;
    var_5aaf7c7163c04623 function_70090b9a8db66aeb(scriptbundlename);
    if (!var_5aaf7c7163c04623 function_bd09568f76dd40ca()) {
        return;
    }
    var_568f62a24b19c46d = var_5aaf7c7163c04623 function_e6197350552df14b(var_c38eb8ba73256bfb, 1);
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    if (isdefined(var_2b23f2a75a7eb443)) {
        if (!isarray(var_2b23f2a75a7eb443)) {
            var_2b23f2a75a7eb443 = [0:var_2b23f2a75a7eb443];
        }
        var_2b23f2a75a7eb443 = utility::array_removeundefined(var_2b23f2a75a7eb443);
        foreach (var_423f55edd900883 in var_2b23f2a75a7eb443) {
            if (isdefined(var_423f55edd900883.script_animname) && !isdefined(var_423f55edd900883.animname)) {
                var_423f55edd900883.animname = var_423f55edd900883.script_animname;
            }
        }
    }
    var_84b542bb7490bea7.var_a416d1b334ed6b37 = undefined;
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        if (var_214d924f4e137244 function_acef03c7ed4a3f86() == "Types_Player") {
            if (var_214d924f4e137244 function_3e13497ed7044cbd()) {
                var_84b542bb7490bea7.var_a416d1b334ed6b37 = 1;
                break;
            }
        }
    }
    if (istrue(var_84b542bb7490bea7.var_a416d1b334ed6b37)) {
        var_5aaf7c7163c04623 function_9030d05e9f5301ff();
    }
    var_568f62a24b19c46d.var_7038c2a13f1f5db8 = [];
    var_a55c41e47aa5aeb5 = [];
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        if (!var_214d924f4e137244 function_225d78e3c485a7ae(var_568f62a24b19c46d.var_df5db7bd235f2729, var_568f62a24b19c46d, var_56f4af8746a2d458)) {
            continue;
        }
        var_982109bda19f3517 = var_214d924f4e137244.var_9be58c68789faf5c function_aeb2b46911a5811d();
        var_2b23f2a75a7eb443 = var_214d924f4e137244 function_1ba5fc9ef8e19620(var_5aaf7c7163c04623, var_568f62a24b19c46d, var_982109bda19f3517, var_2b23f2a75a7eb443, 1, 1, var_5ce6119315ff5b97);
        if (!isdefined(var_214d924f4e137244.entity)) {
            var_5aaf7c7163c04623.var_cf24d127aa3920a0 = var_214d924f4e137244 function_1ba5fc9ef8e19620(var_5aaf7c7163c04623, var_568f62a24b19c46d, var_982109bda19f3517, var_5aaf7c7163c04623.var_cf24d127aa3920a0, 1, 0, var_5ce6119315ff5b97);
        }
        if (!isdefined(var_214d924f4e137244.entity)) {
            var_a55c41e47aa5aeb5 = var_214d924f4e137244 function_53687c7001a0784b(var_5aaf7c7163c04623, var_568f62a24b19c46d, var_982109bda19f3517, var_a55c41e47aa5aeb5, "targetname", var_5ce6119315ff5b97);
        }
        if (!isdefined(var_214d924f4e137244.entity)) {
            var_a55c41e47aa5aeb5 = var_214d924f4e137244 function_53687c7001a0784b(var_5aaf7c7163c04623, var_568f62a24b19c46d, var_982109bda19f3517, var_a55c41e47aa5aeb5, "script_noteworthy", var_5ce6119315ff5b97);
        }
        if (!isdefined(var_214d924f4e137244.entity)) {
            var_a55c41e47aa5aeb5 = var_214d924f4e137244 function_53687c7001a0784b(var_5aaf7c7163c04623, var_568f62a24b19c46d, "_scene_global_" + var_982109bda19f3517, var_a55c41e47aa5aeb5, "targetname", var_5ce6119315ff5b97);
        }
        if (!isdefined(var_214d924f4e137244.entity)) {
            var_a55c41e47aa5aeb5 = var_214d924f4e137244 function_53687c7001a0784b(var_5aaf7c7163c04623, var_568f62a24b19c46d, "_scene_global_" + var_982109bda19f3517, var_a55c41e47aa5aeb5, "script_noteworthy", var_5ce6119315ff5b97);
        }
    }
    playerindex = 0;
    var_2218e47de6541d57 = 0;
    var_48e25d3373e9b4b0 = 0;
    maxplayers = -1;
    if (isdefined(var_5aaf7c7163c04623.var_aadf0dea942accd5) && isdefined(var_5aaf7c7163c04623.var_aadf0dea942accd5.var_ce9c0a8610712c8d)) {
        maxplayers = var_5aaf7c7163c04623.var_aadf0dea942accd5.var_ce9c0a8610712c8d;
    }
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        if (!isdefined(var_568f62a24b19c46d.var_7038c2a13f1f5db8[var_56f4af8746a2d458])) {
            continue;
        }
        var_982109bda19f3517 = var_214d924f4e137244.var_9be58c68789faf5c function_aeb2b46911a5811d();
        if (!isdefined(var_214d924f4e137244.entity) && !var_214d924f4e137244.var_9be58c68789faf5c function_d301ab09c0738edf()) {
            var_2b23f2a75a7eb443 = var_214d924f4e137244 function_1ba5fc9ef8e19620(var_5aaf7c7163c04623, var_568f62a24b19c46d, var_982109bda19f3517, var_2b23f2a75a7eb443, 0, 1, var_5ce6119315ff5b97);
            if (!isdefined(var_214d924f4e137244.entity)) {
                var_5aaf7c7163c04623.var_cf24d127aa3920a0 = var_214d924f4e137244 function_1ba5fc9ef8e19620(var_5aaf7c7163c04623, var_568f62a24b19c46d, var_982109bda19f3517, var_5aaf7c7163c04623.var_cf24d127aa3920a0, 0, 0, var_5ce6119315ff5b97);
            }
        }
        entity = var_214d924f4e137244.entity;
        var_5008c96f8b06a31b = var_214d924f4e137244 function_acef03c7ed4a3f86() == "Types_Player";
        var_fdc8fd88a88422e5 = 0;
        /#
            var_fdc8fd88a88422e5 = getdvarint(@"hash_3bc9bc279e3f772", 0);
        #/
        if (!isdefined(entity)) {
            var_d05ef3f217cebd10 = 1;
            if (var_5008c96f8b06a31b && maxplayers >= 0) {
                var_7b16b71f3113d26d = var_2218e47de6541d57;
                if (var_214d924f4e137244 function_3e13497ed7044cbd()) {
                    var_7b16b71f3113d26d = var_48e25d3373e9b4b0;
                }
                if (var_7b16b71f3113d26d >= maxplayers) {
                    var_d05ef3f217cebd10 = 0;
                }
            }
            if (var_d05ef3f217cebd10 && (!var_214d924f4e137244.var_9be58c68789faf5c function_9be5ff9b4bc5843a(var_568f62a24b19c46d.var_49a7f73f0fb5f6cf) || var_fdc8fd88a88422e5 && var_5008c96f8b06a31b)) {
                var_214d924f4e137244.var_bae27d121b581202 = var_84b542bb7490bea7.var_db52b4a8aba13320 function_ab3ec43370c405d2(var_5aaf7c7163c04623, var_568f62a24b19c46d.var_49a7f73f0fb5f6cf, var_56f4af8746a2d458);
                function_e4fc30ccdca08b9d(var_214d924f4e137244.var_bae27d121b581202);
                if (var_5008c96f8b06a31b) {
                    if (!var_214d924f4e137244 function_7c447098301ac4a3()) {
                        if (playerindex < level.players.size) {
                            var_63214d32e3c3cfe7 = level.players[playerindex];
                            if (!function_ac04e049ff623301(var_63214d32e3c3cfe7, var_214d924f4e137244)) {
                                var_63214d32e3c3cfe7 = undefined;
                            }
                            entity = var_63214d32e3c3cfe7;
                        }
                    }
                    /#
                        if (var_fdc8fd88a88422e5) {
                            if (function_2fbba7f29e8d78ce(var_56f4af8746a2d458)) {
                                entity = level.players[0];
                            } else if (utility::is_equal(entity, level.players[0])) {
                                entity = undefined;
                            }
                        }
                    #/
                } else {
                    var_214d924f4e137244.spawner = function_9b40ea5276506411(var_982109bda19f3517, 0);
                    entity = var_214d924f4e137244 function_fcb671080d2533e6(var_214d924f4e137244.var_bae27d121b581202, var_568f62a24b19c46d.var_49a7f73f0fb5f6cf);
                }
            } else {
                var_568f62a24b19c46d.var_7038c2a13f1f5db8[var_56f4af8746a2d458] = undefined;
            }
        }
        if (isdefined(entity)) {
            var_214d924f4e137244 function_6acd8ab4606e2a09(var_5aaf7c7163c04623, var_568f62a24b19c46d, entity, undefined, var_5ce6119315ff5b97);
        }
        issetup = istrue(var_214d924f4e137244.issetup) || isdefined(entity) && isdefined(entity.var_214d924f4e137244) && istrue(entity.var_214d924f4e137244.issetup);
        if (isdefined(var_568f62a24b19c46d.var_7038c2a13f1f5db8[var_56f4af8746a2d458]) && !(issetup && var_5ce6119315ff5b97 == "scene_init_prestream")) {
            var_214d924f4e137244 function_73ba1df113a6ca64(var_568f62a24b19c46d);
        }
        if (var_5008c96f8b06a31b) {
            playerindex++;
            if (var_214d924f4e137244 function_3e13497ed7044cbd()) {
                var_48e25d3373e9b4b0++;
            } else {
                var_2218e47de6541d57++;
            }
        }
    }
    var_568f62a24b19c46d function_218d0124f21f73b1(var_568f62a24b19c46d.var_49a7f73f0fb5f6cf);
    foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in var_568f62a24b19c46d.var_137e0a58e2c9d26) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        if (!isdefined(var_568f62a24b19c46d.var_7038c2a13f1f5db8[var_56f4af8746a2d458])) {
            continue;
        }
        var_214d924f4e137244 function_535e6f4c06c15b1d(var_568f62a24b19c46d, 1, 1, var_214d924f4e137244.var_bae27d121b581202);
        if (var_214d924f4e137244.var_9be58c68789faf5c function_83ba0b38ef7f3949() && var_5ce6119315ff5b97 == "scene_init_user") {
            var_214d924f4e137244 function_9745e01cedd81c85(var_214d924f4e137244.var_bae27d121b581202);
        }
    }
    var_5aaf7c7163c04623 function_c643b2c6b794481e("Setup");
    var_568f62a24b19c46d.state = "Stopped";
    var_5aaf7c7163c04623 function_bb980ac4246f5baa("callback_init");
    return var_568f62a24b19c46d;
}

// Namespace scene/namespace_32d725839544d40a
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27cb
// Size: 0x61d
function private function_7e5354b44c829c9e(var_2b23f2a75a7eb443, var_c38eb8ba73256bfb, scriptbundlename, var_f7ab585bff4b110, var_4f20498ef1bfe199) {
    var_5aaf7c7163c04623 = self;
    /#
        if (getdvarint(@"hash_1aa832f211c5245e")) {
            level waittill("<unknown string>");
            return;
        }
        if (!utility::array_contains(level.var_a0b4eb1703be349a, var_5aaf7c7163c04623)) {
            var_5aaf7c7163c04623.var_4d8e093da0426022 = 1;
            level.var_a0b4eb1703be349a = utility::function_6d6af8144a5131f1(level.var_a0b4eb1703be349a, var_5aaf7c7163c04623);
        }
    #/
    var_5aaf7c7163c04623 function_70090b9a8db66aeb(scriptbundlename);
    if (!var_5aaf7c7163c04623 function_bd09568f76dd40ca()) {
        return;
    }
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    if (isdefined(var_2b23f2a75a7eb443) && !isarray(var_2b23f2a75a7eb443)) {
        var_2b23f2a75a7eb443 = [0:var_2b23f2a75a7eb443];
    }
    state = var_5aaf7c7163c04623 get_state();
    var_568f62a24b19c46d = undefined;
    if (state != "NotSetup") {
        var_568f62a24b19c46d = var_5aaf7c7163c04623 function_e6197350552df14b(var_c38eb8ba73256bfb, 0);
        if (isdefined(var_568f62a24b19c46d) && var_568f62a24b19c46d.state == "Playing") {
            var_568f62a24b19c46d function_28f230671b0b9a1f(0);
        }
        var_f2a8279cf934c80e = undefined;
        foreach (var_370294f3b91920df in var_84b542bb7490bea7.var_568f62a24b19c46d) {
            if (isdefined(var_370294f3b91920df.var_2b0ae4dffc850db2)) {
                var_6e70dd21d9147b17 = is_equal(var_370294f3b91920df, var_568f62a24b19c46d);
                if (!var_6e70dd21d9147b17) {
                    if (!isdefined(var_f2a8279cf934c80e)) {
                        var_f2a8279cf934c80e = var_5aaf7c7163c04623 function_14d02a749939e837(var_c38eb8ba73256bfb);
                    }
                    var_a1709fdb12562ef0 = utility::array_intersection(var_370294f3b91920df.var_df5db7bd235f2729, var_f2a8279cf934c80e);
                    if (var_a1709fdb12562ef0.size > 0) {
                        var_6e70dd21d9147b17 = 1;
                    }
                }
                if (var_6e70dd21d9147b17) {
                    if (var_370294f3b91920df.var_2b0ae4dffc850db2 < 0 || gettime() > var_370294f3b91920df.var_2b0ae4dffc850db2) {
                        var_5aaf7c7163c04623 function_6438932e35cbbfb7(var_2b23f2a75a7eb443, var_370294f3b91920df.var_df5db7bd235f2729, level.framedurationseconds * 2);
                    }
                    var_370294f3b91920df.var_2b0ae4dffc850db2 = undefined;
                }
            }
        }
    }
    var_568f62a24b19c46d = var_5aaf7c7163c04623 function_a9fc7e7dfd78e15e(var_2b23f2a75a7eb443, var_c38eb8ba73256bfb, undefined, "scene_init_play");
    if (var_568f62a24b19c46d.var_df5db7bd235f2729.size == 0) {
        /#
            var_97f8083a78f57989 = "<unknown string>";
            if (isdefined(var_c38eb8ba73256bfb)) {
                var_97f8083a78f57989 = "<unknown string>";
                if (!isarray(var_c38eb8ba73256bfb)) {
                    var_c38eb8ba73256bfb = [0:var_c38eb8ba73256bfb];
                }
                foreach (shot in var_c38eb8ba73256bfb) {
                    var_97f8083a78f57989 = var_97f8083a78f57989 + "<unknown string>" + shot;
                }
            }
            iprintlnbold("<unknown string>" + var_5aaf7c7163c04623.var_8ac77218f7a34e3e + "<unknown string>" + var_97f8083a78f57989);
        #/
        return;
    }
    var_568f62a24b19c46d function_da660bb71d6eb080(1);
    var_568f62a24b19c46d function_e5b5e877417bc710(isdefined(var_4f20498ef1bfe199));
    var_568f62a24b19c46d function_5a438716f043fddc(var_f7ab585bff4b110, var_568f62a24b19c46d.var_df5db7bd235f2729);
    var_568f62a24b19c46d function_950e5107399d1111();
    var_5aaf7c7163c04623 function_bb980ac4246f5baa("callback_play");
    var_5aaf7c7163c04623.var_708c03f822068263 = undefined;
    while (isdefined(var_5aaf7c7163c04623.var_84b542bb7490bea7) && !istrue(var_568f62a24b19c46d.var_7bee1a965a8d9487)) {
        var_5119eba6031edf54 = gettime();
        var_568f62a24b19c46d.var_1344e48bc80d0f52 = utility::function_53c4c53197386572(var_4f20498ef1bfe199, 0);
        while (var_568f62a24b19c46d.var_1344e48bc80d0f52 < var_568f62a24b19c46d.var_df5db7bd235f2729.size) {
            var_568f62a24b19c46d.var_adf03bdd42111106 = var_568f62a24b19c46d.var_df5db7bd235f2729[var_568f62a24b19c46d.var_1344e48bc80d0f52];
            var_568f62a24b19c46d.var_98ccc4289cd8e03c = undefined;
            if (var_568f62a24b19c46d.var_1344e48bc80d0f52 + 1 < var_568f62a24b19c46d.var_df5db7bd235f2729.size) {
                var_568f62a24b19c46d.var_98ccc4289cd8e03c = var_568f62a24b19c46d.var_df5db7bd235f2729[var_568f62a24b19c46d.var_1344e48bc80d0f52 + 1];
            }
            if (var_568f62a24b19c46d.var_df5db7bd235f2729.size > var_568f62a24b19c46d.var_1344e48bc80d0f52 + 1) {
                var_43799a95aaee8d61 = var_84b542bb7490bea7.var_db52b4a8aba13320 function_e65f46a710591a5();
                var_5361b7714ea1f8e0 = 2;
                predicttime = var_5361b7714ea1f8e0;
                var_5b1df6bdb52e24c = [];
                for (var_7d3411523e9ab92c = var_568f62a24b19c46d.var_1344e48bc80d0f52 + 1; var_7d3411523e9ab92c < var_568f62a24b19c46d.var_df5db7bd235f2729.size; var_7d3411523e9ab92c++) {
                    var_be98a78ee33f18b8 = var_568f62a24b19c46d.var_df5db7bd235f2729[var_7d3411523e9ab92c];
                    var_98ccc4289cd8e03c = var_84b542bb7490bea7.var_db52b4a8aba13320 function_2218afa82a590ea3(var_be98a78ee33f18b8);
                    var_5b1df6bdb52e24c[var_5b1df6bdb52e24c.size] = var_98ccc4289cd8e03c function_55042076624e1180();
                    var_43799a95aaee8d61 = var_43799a95aaee8d61 || var_98ccc4289cd8e03c function_dd4368cda4b91e7d();
                    predicttime = predicttime - var_5aaf7c7163c04623 function_d9be975d8d1c9db3(var_be98a78ee33f18b8);
                    if (predicttime <= 0) {
                        break;
                    }
                }
                if (var_43799a95aaee8d61) {
                    var_73e1014ebc31c952 = var_5aaf7c7163c04623 function_d9be975d8d1c9db3(var_568f62a24b19c46d.var_adf03bdd42111106, 1);
                    var_912feae1924de442 = max(var_73e1014ebc31c952 - var_5361b7714ea1f8e0, level.framedurationseconds);
                    var_5aaf7c7163c04623 utility::function_f9a207358d70923c(var_912feae1924de442, "scene_stop", &function_6438932e35cbbfb7, var_2b23f2a75a7eb443, var_5b1df6bdb52e24c, var_5361b7714ea1f8e0 + 0.1, undefined, var_5361b7714ea1f8e0);
                }
            }
            success = var_5aaf7c7163c04623 function_afea5de3a99c09ab(var_568f62a24b19c46d, var_568f62a24b19c46d.var_adf03bdd42111106);
            if (!success) {
                break;
            }
            var_568f62a24b19c46d.var_1344e48bc80d0f52++;
        }
        if (!isdefined(var_5aaf7c7163c04623.var_84b542bb7490bea7) || !var_5aaf7c7163c04623.var_84b542bb7490bea7.var_db52b4a8aba13320 function_4f93a0dfb8fd6a47()) {
            break;
        }
        if (gettime() == var_5119eba6031edf54) {
            break;
        }
    }
    var_568f62a24b19c46d function_8accfbca6fff9e0();
}

// Namespace scene/namespace_32d725839544d40a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2def
// Size: 0xbc
function private function_8accfbca6fff9e0() {
    var_568f62a24b19c46d = self;
    var_5aaf7c7163c04623 = var_568f62a24b19c46d.var_5aaf7c7163c04623;
    /#
        if (istrue(var_5aaf7c7163c04623.var_4d8e093da0426022)) {
            level.var_a0b4eb1703be349a = utility::array_remove(level.var_a0b4eb1703be349a, var_5aaf7c7163c04623);
        }
    #/
    var_568f62a24b19c46d function_da660bb71d6eb080(0);
    var_568f62a24b19c46d.state = "Stopped";
    var_568f62a24b19c46d notify("Stopped");
    var_568f62a24b19c46d function_bc27ed6c295108d7();
    if (var_5aaf7c7163c04623 get_state() == "Stopped") {
        var_5aaf7c7163c04623 function_2549c341bf1ae3e7("Stopped");
    }
    if (!istrue(var_568f62a24b19c46d.var_7bee1a965a8d9487)) {
        var_5aaf7c7163c04623 function_bb980ac4246f5baa("callback_done");
    }
    var_5aaf7c7163c04623 thread function_798498fd6521b8f0();
}

// Namespace scene/namespace_32d725839544d40a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2eb2
// Size: 0x11f
function private function_9030d05e9f5301ff() {
    var_5aaf7c7163c04623 = self;
    var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    var_218f7092ef70a851 = [];
    var_7c160369c52b033a = [];
    for (var_56f4af8746a2d458 = 0; var_56f4af8746a2d458 < var_84b542bb7490bea7.var_214d924f4e137244.size; var_56f4af8746a2d458++) {
        var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
        if (var_214d924f4e137244 function_acef03c7ed4a3f86() == "Types_Player") {
            if (var_214d924f4e137244 function_3e13497ed7044cbd()) {
                var_7c160369c52b033a[var_7c160369c52b033a.size] = var_56f4af8746a2d458;
            } else {
                var_218f7092ef70a851[var_218f7092ef70a851.size] = var_56f4af8746a2d458;
            }
        }
    }
    maxcount = min(var_218f7092ef70a851.size, var_7c160369c52b033a.size);
    for (i = 0; i < maxcount; i++) {
        var_64b987531d63627f = var_218f7092ef70a851[i];
        var_f4ebcb5a7d1512e4 = var_7c160369c52b033a[i];
        var_84b542bb7490bea7.var_214d924f4e137244[var_64b987531d63627f].var_9668be326e00024b = var_f4ebcb5a7d1512e4;
        var_84b542bb7490bea7.var_214d924f4e137244[var_f4ebcb5a7d1512e4].var_17f5321d96d1bf24 = var_64b987531d63627f;
    }
}

