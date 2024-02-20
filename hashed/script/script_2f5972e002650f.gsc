// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using scripts\engine\scriptable.gsc;
#using script_860bfdfe82326e3;
#using script_16ea1b94f0f381b3;
#using script_7b2517368c79e5bc;

#namespace loot_crystal;

// Namespace loot_crystal/namespace_3bf3843b524af7bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b3
// Size: 0xf3
function function_f009d47735dc7adb() {
    var_4af01a2d989e9f6f = level.var_1a2b600a06ec21f4.var_4af01a2d989e9f6f;
    if (!isdefined(var_4af01a2d989e9f6f)) {
        /#
            assertmsg("no loot crystal bundle set for mode");
        #/
        return;
    }
    s_bundle = getscriptbundle("lootcrystal:" + var_4af01a2d989e9f6f);
    level.var_4af01a2d989e9f6f = s_bundle;
    if (istrue(level.var_4af01a2d989e9f6f.var_c6ff3fb792f9b962)) {
        /#
            assertex(isdefined(level.var_4af01a2d989e9f6f.var_2e0dc21e3310887f), "no vfx set for force trail");
        #/
        level._effect["vfx_loot_crystal_trail"] = loadfx(level.var_4af01a2d989e9f6f.var_2e0dc21e3310887f);
    }
    namespace_4164bc931714b00b::function_72f3dd0512f43c96("loot_crystal", &function_a60bb9caaac38e4e);
    level thread function_11d90b6aad7cc54f();
    scriptable_addnotifycallback("loot_crystal_destroyed", &loot_crystal_destroyed);
    callback::add("ob_content_process_create_script", &function_a62a277f18e23661);
}

// Namespace loot_crystal/namespace_3bf3843b524af7bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ad
// Size: 0xa3
function function_11d90b6aad7cc54f() {
    level endon("game_ended");
    waittillframeend();
    var_e10b8f561af1621c = getstructarray("content_destination", "variantname");
    if (isdefined(var_e10b8f561af1621c) && var_e10b8f561af1621c.size > 0) {
        foreach (destination in var_e10b8f561af1621c) {
            level thread function_fd67fc9069339eb0(destination);
        }
    }
    wait(1);
    if (is_equal(level.gametype, "zm_rb")) {
        function_a4c9c7827c00cf5();
    }
}

// Namespace loot_crystal/namespace_3bf3843b524af7bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x457
// Size: 0x592
function function_fd67fc9069339eb0(destination) {
    if (istrue(level.var_4af01a2d989e9f6f.var_89e2af74eb7cf125) && isdefined(level.var_8241e0d86017df29)) {
        var_a4dee53b875bb846 = level.var_4af01a2d989e9f6f.var_e656a6b6a513b25d / 100;
        var_2665f3e21251620b = level.var_4af01a2d989e9f6f.var_6553b34b13330328 / 100;
        var_6c7b9c59a38ff415 = level.var_4af01a2d989e9f6f.var_a08d3d8f5639f6f6 / 100;
        var_6b28aa27cff8bf26 = level.var_4af01a2d989e9f6f.var_d1d73d2524d6bc6d / 100;
        var_af05cdbea35d46c = [];
        var_46b5992c2733accd = [];
        var_41464293eca8efd7 = [];
        var_6b94404ff55d952c = [];
        var_142e262ef4250cdd = [];
        foreach (location in destination.locations) {
            loot_crystal = location.instances["loot_crystal"];
            if (isdefined(loot_crystal)) {
                foreach (instance in loot_crystal.var_67b2b78e28eaa758) {
                    difficulty = [[ level.var_8241e0d86017df29 ]](instance.origin);
                    switch (difficulty) {
                    case #"hash_7bb2cd766703d463":
                        var_af05cdbea35d46c = array_add(var_af05cdbea35d46c, instance);
                        break;
                    case #"hash_af83e47edfa8900a":
                        var_46b5992c2733accd = array_add(var_46b5992c2733accd, instance);
                        break;
                    case #"hash_5343b465e56ec9a4":
                        var_41464293eca8efd7 = array_add(var_41464293eca8efd7, instance);
                        break;
                    case #"hash_651f76c0ad6741ec":
                        var_6b94404ff55d952c = array_add(var_6b94404ff55d952c, instance);
                        break;
                    case #"hash_a1e09f51896088fb":
                        var_142e262ef4250cdd = array_add(var_142e262ef4250cdd, instance);
                        break;
                    }
                }
                var_8d0fc73f82c3715c = 0;
                var_d211eea36b16b15 = 0;
                var_bd8640129a0b2867 = 0;
                var_87155613ec4cfd1c = 0;
                var_f413f108e237053b = var_af05cdbea35d46c.size * var_a4dee53b875bb846;
                var_263a1961483d1c6c = var_46b5992c2733accd.size * var_2665f3e21251620b;
                var_59b0d07e8399e9a2 = var_41464293eca8efd7.size * var_6c7b9c59a38ff415;
                var_11fd29abbcd121fb = var_6b94404ff55d952c.size * var_6b28aa27cff8bf26;
                var_af05cdbea35d46c = array_randomize(var_af05cdbea35d46c);
                var_46b5992c2733accd = array_randomize(var_46b5992c2733accd);
                var_41464293eca8efd7 = array_randomize(var_41464293eca8efd7);
                var_6b94404ff55d952c = array_randomize(var_6b94404ff55d952c);
                foreach (instance in var_af05cdbea35d46c) {
                    if (var_8d0fc73f82c3715c < var_f413f108e237053b) {
                        namespace_4164bc931714b00b::function_7e2984b7610f3616(instance);
                        var_8d0fc73f82c3715c++;
                    }
                }
                foreach (instance in var_46b5992c2733accd) {
                    if (var_d211eea36b16b15 < var_263a1961483d1c6c) {
                        namespace_4164bc931714b00b::function_7e2984b7610f3616(instance);
                        var_d211eea36b16b15++;
                    }
                }
                foreach (instance in var_41464293eca8efd7) {
                    if (var_bd8640129a0b2867 < var_59b0d07e8399e9a2) {
                        namespace_4164bc931714b00b::function_7e2984b7610f3616(instance);
                        var_bd8640129a0b2867++;
                    }
                }
                foreach (instance in var_6b94404ff55d952c) {
                    if (var_87155613ec4cfd1c < var_11fd29abbcd121fb) {
                        namespace_4164bc931714b00b::function_7e2984b7610f3616(instance);
                        var_87155613ec4cfd1c++;
                    }
                }
                foreach (instance in var_142e262ef4250cdd) {
                    namespace_4164bc931714b00b::function_7e2984b7610f3616(instance);
                }
                level.var_4af01a2d989e9f6f.var_8d0fc73f82c3715c = var_8d0fc73f82c3715c;
                level.var_4af01a2d989e9f6f.var_d211eea36b16b15 = var_d211eea36b16b15;
                level.var_4af01a2d989e9f6f.var_bd8640129a0b2867 = var_bd8640129a0b2867;
                level.var_4af01a2d989e9f6f.var_87155613ec4cfd1c = var_87155613ec4cfd1c;
            }
        }
    } else {
        foreach (location in destination.locations) {
            loot_crystal = location.instances["loot_crystal"];
            if (isdefined(loot_crystal)) {
                foreach (instance in loot_crystal.var_67b2b78e28eaa758) {
                    namespace_4164bc931714b00b::function_7e2984b7610f3616(instance);
                }
            }
        }
    }
}

// Namespace loot_crystal/namespace_3bf3843b524af7bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f0
// Size: 0x232
function function_a60bb9caaac38e4e(struct) {
    /#
        assert(isstruct(struct), "no struct on spawn wallbuy");
    #/
    if (isdefined(struct.var_305e36cbb51f88ce)) {
        spawn_points = struct.var_305e36cbb51f88ce["loot_crystal_spawn"];
    } else {
        spawn_points = getstructarray(struct.targetname, "target");
    }
    spawn_points = array_randomize(spawn_points);
    if (istrue(level.var_4af01a2d989e9f6f.var_89e2af74eb7cf125) && isdefined(level.var_8241e0d86017df29)) {
        var_53f968fd95d49b22 = level.var_4af01a2d989e9f6f.var_4819e64b57d10e5b / 100;
        var_a4d9d9dbfcbf6fb7 = level.var_4af01a2d989e9f6f.var_fb1f51496c10895c / 100;
        var_3de3c8bce67e4fa9 = level.var_4af01a2d989e9f6f.var_305ebee8191eb016 / 100;
        var_e8a4498fc709e6a2 = level.var_4af01a2d989e9f6f.var_818038caf4aeab2b / 100;
        difficulty = [[ level.var_8241e0d86017df29 ]](struct.origin);
        var_dc713ce23542133 = spawn_points.size;
        switch (difficulty) {
        case #"hash_7bb2cd766703d463":
            var_dc713ce23542133 = var_dc713ce23542133 * var_53f968fd95d49b22;
            break;
        case #"hash_af83e47edfa8900a":
            var_dc713ce23542133 = var_dc713ce23542133 * var_a4d9d9dbfcbf6fb7;
            break;
        case #"hash_5343b465e56ec9a4":
            var_dc713ce23542133 = var_dc713ce23542133 * var_3de3c8bce67e4fa9;
            break;
        case #"hash_651f76c0ad6741ec":
            var_dc713ce23542133 = var_dc713ce23542133 * var_e8a4498fc709e6a2;
            break;
        case #"hash_a1e09f51896088fb":
            var_dc713ce23542133 = spawn_points.size;
            break;
        }
        for (count = 0; count < var_dc713ce23542133; count++) {
            point = spawn_points[count];
            point function_e87afa054556fca(point);
        }
    } else {
        foreach (point in spawn_points) {
            point function_e87afa054556fca(point);
        }
    }
}

// Namespace loot_crystal/namespace_3bf3843b524af7bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc29
// Size: 0x9b
function function_e87afa054556fca(point) {
    randomindex = randomintrange(0, level.var_4af01a2d989e9f6f.var_63a804e036bfaf8f.size);
    scriptablename = level.var_4af01a2d989e9f6f.var_63a804e036bfaf8f[randomindex];
    var_2f49151159f060ba = spawnscriptable(scriptablename.var_f65bc692c0385ca7, point.origin, point.angles);
    level.var_2161a5a5ecb28ea3 = array_add_safe(level.var_2161a5a5ecb28ea3, var_2f49151159f060ba);
}

// Namespace loot_crystal/namespace_3bf3843b524af7bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccb
// Size: 0x9e
function function_a4c9c7827c00cf5() {
    if (isdefined(level.var_2161a5a5ecb28ea3)) {
        var_2c796eac8075783b = array_randomize(level.var_2161a5a5ecb28ea3);
        for (i = 0; i < var_2c796eac8075783b.size - 2; i++) {
            loot_crystal = var_2c796eac8075783b[i];
            if (isdefined(loot_crystal)) {
                loot_crystal.var_f6f86c3af9ca88a0 = 1;
                loot_crystal setscriptablepartstate("loot_crystal", "dead");
                loot_crystal.var_f6f86c3af9ca88a0 = undefined;
            }
        }
        callback::add("on_round_end", &function_11817d38f58bbb);
        /#
            function_4a792a9a49c9da56();
        #/
    }
}

// Namespace loot_crystal/namespace_3bf3843b524af7bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd70
// Size: 0x15b
function function_1be1c2a4c44b823c() {
    self endon("death");
    waitframe();
    var_f3b3c6de643ff4ad = level.var_4af01a2d989e9f6f.var_1def69d4074b4408;
    n_round = namespace_53fc9ddbb516e6e1::function_560b2e700ce084a2(self.origin);
    if (n_round > 0 && n_round < 15) {
        var_f3b3c6de643ff4ad = level.var_4af01a2d989e9f6f.var_1def69d4074b4408;
    } else if (n_round >= 15 && n_round < 35) {
        var_f3b3c6de643ff4ad = level.var_4af01a2d989e9f6f.var_898998ee991b93d5;
    } else if (n_round >= 35 && n_round < 55) {
        var_f3b3c6de643ff4ad = level.var_4af01a2d989e9f6f.var_88ed1b1224856ddf;
    } else if (n_round >= 55) {
        var_f3b3c6de643ff4ad = level.var_4af01a2d989e9f6f.var_3443cad32959c5b8;
    }
    var_1d441103e7105cff = level namespace_2abc885019e1956::function_cd45408bd44fab07(var_f3b3c6de643ff4ad, 1, self.origin);
    if (istrue(level.var_4af01a2d989e9f6f.var_c6ff3fb792f9b962)) {
        foreach (item in var_1d441103e7105cff) {
            item.var_1c9b1e35f32a7097 = 1;
        }
    }
}

// Namespace loot_crystal/namespace_3bf3843b524af7bd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xed2
// Size: 0x7f
function function_a120a3b57a6087c2(item, originpos) {
    var_34c14613d8b78b3e = spawn("script_model", originpos);
    var_34c14613d8b78b3e setmodel("tag_origin");
    playfxontag(getfx("vfx_loot_crystal_trail"), var_34c14613d8b78b3e, "tag_origin");
    var_f9567f37db523f7a = item.origin - originpos;
    var_34c14613d8b78b3e movegravity(var_f9567f37db523f7a, 1);
    wait(1);
    var_34c14613d8b78b3e delete();
}

// Namespace loot_crystal/namespace_3bf3843b524af7bd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf58
// Size: 0x8d
function loot_crystal_destroyed(instance, note, param, var_535d9c3fdddab5a9) {
    if (!istrue(instance.var_f6f86c3af9ca88a0)) {
        instance thread function_1be1c2a4c44b823c();
    }
    var_d27680ff86693f5c = spawnstruct();
    var_d27680ff86693f5c.instance = instance;
    var_d27680ff86693f5c.note = note;
    var_d27680ff86693f5c.param = param;
    var_d27680ff86693f5c.var_535d9c3fdddab5a9 = var_535d9c3fdddab5a9;
    callback::callback("loot_crystal_destroyed", var_d27680ff86693f5c);
}

// Namespace loot_crystal/namespace_3bf3843b524af7bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfec
// Size: 0x179
function function_11817d38f58bbb(params) {
    if (isdefined(level.var_2161a5a5ecb28ea3)) {
        var_260d30366b6c35dc = 0;
        var_e7cc345429d93ae3 = [];
        foreach (crystal in level.var_2161a5a5ecb28ea3) {
            if (isdefined(crystal) && crystal getscriptablepartstate("loot_crystal") == "healthy") {
                var_260d30366b6c35dc++;
            } else {
                var_e7cc345429d93ae3 = array_add(var_e7cc345429d93ae3, crystal);
            }
        }
        var_eecabbec50e06c39 = min(10, level.var_2161a5a5ecb28ea3.size);
        var_e098da9ac92f01ff = min(var_eecabbec50e06c39 - var_260d30366b6c35dc, 2);
        if (var_e098da9ac92f01ff > 0) {
            if (var_e098da9ac92f01ff > var_e7cc345429d93ae3.size) {
                foreach (crystal in var_e7cc345429d93ae3) {
                    if (isdefined(crystal)) {
                        crystal setscriptablepartstate("loot_crystal", "healthy");
                    }
                }
            } else {
                var_e7cc345429d93ae3 = array_randomize(var_e7cc345429d93ae3);
                for (i = 0; i < var_e098da9ac92f01ff; i++) {
                    var_e7cc345429d93ae3[i] setscriptablepartstate("loot_crystal", "healthy");
                }
            }
        }
    }
}

// Namespace loot_crystal/namespace_3bf3843b524af7bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116c
// Size: 0x5a7
function function_a62a277f18e23661(var_d27680ff86693f5c) {
    if (getdvarint(@"hash_3f9da19597f5e1ba", 0)) {
        return;
    }
    if (istrue(level.var_4af01a2d989e9f6f.var_89e2af74eb7cf125) && isdefined(level.var_8241e0d86017df29)) {
        var_a4dee53b875bb846 = level.var_4af01a2d989e9f6f.var_e656a6b6a513b25d / 100;
        var_2665f3e21251620b = level.var_4af01a2d989e9f6f.var_6553b34b13330328 / 100;
        var_6c7b9c59a38ff415 = level.var_4af01a2d989e9f6f.var_a08d3d8f5639f6f6 / 100;
        var_6b28aa27cff8bf26 = level.var_4af01a2d989e9f6f.var_d1d73d2524d6bc6d / 100;
        var_af05cdbea35d46c = [];
        var_46b5992c2733accd = [];
        var_41464293eca8efd7 = [];
        var_6b94404ff55d952c = [];
        var_142e262ef4250cdd = [];
        var_b139ae25c4db8bbe = [];
        var_cfa15b0adac0f8bd = getstructarray("content_instance", "variantname");
        foreach (struct in var_cfa15b0adac0f8bd) {
            if (isdefined(struct.content_script_name) && struct.content_script_name == "loot_crystal") {
                var_b139ae25c4db8bbe = array_add(var_b139ae25c4db8bbe, struct);
            }
        }
        foreach (instance in var_b139ae25c4db8bbe) {
            difficulty = [[ level.var_8241e0d86017df29 ]](instance.origin);
            switch (difficulty) {
            case #"hash_7bb2cd766703d463":
                var_af05cdbea35d46c = array_add(var_af05cdbea35d46c, instance);
                break;
            case #"hash_af83e47edfa8900a":
                var_46b5992c2733accd = array_add(var_46b5992c2733accd, instance);
                break;
            case #"hash_5343b465e56ec9a4":
                var_41464293eca8efd7 = array_add(var_41464293eca8efd7, instance);
                break;
            case #"hash_651f76c0ad6741ec":
                var_6b94404ff55d952c = array_add(var_6b94404ff55d952c, instance);
                break;
            case #"hash_a1e09f51896088fb":
                var_142e262ef4250cdd = array_add(var_142e262ef4250cdd, instance);
                break;
            }
        }
        var_8d0fc73f82c3715c = 0;
        var_d211eea36b16b15 = 0;
        var_bd8640129a0b2867 = 0;
        var_87155613ec4cfd1c = 0;
        var_f413f108e237053b = var_af05cdbea35d46c.size * var_a4dee53b875bb846;
        var_263a1961483d1c6c = var_46b5992c2733accd.size * var_2665f3e21251620b;
        var_59b0d07e8399e9a2 = var_41464293eca8efd7.size * var_6c7b9c59a38ff415;
        var_11fd29abbcd121fb = var_6b94404ff55d952c.size * var_6b28aa27cff8bf26;
        var_af05cdbea35d46c = array_randomize(var_af05cdbea35d46c);
        var_46b5992c2733accd = array_randomize(var_46b5992c2733accd);
        var_41464293eca8efd7 = array_randomize(var_41464293eca8efd7);
        var_6b94404ff55d952c = array_randomize(var_6b94404ff55d952c);
        if (isdefined(level.var_c383b967aa7e551b)) {
            var_af05cdbea35d46c = [[ level.var_c383b967aa7e551b ]]("green_crystal", var_af05cdbea35d46c);
        }
        foreach (instance in var_af05cdbea35d46c) {
            if (var_8d0fc73f82c3715c < var_f413f108e237053b) {
                function_a60bb9caaac38e4e(instance);
                var_8d0fc73f82c3715c++;
            }
        }
        if (isdefined(level.var_c383b967aa7e551b)) {
            var_46b5992c2733accd = [[ level.var_c383b967aa7e551b ]]("yellow_crystal", var_46b5992c2733accd);
        }
        foreach (instance in var_46b5992c2733accd) {
            if (var_d211eea36b16b15 < var_263a1961483d1c6c) {
                function_a60bb9caaac38e4e(instance);
                var_d211eea36b16b15++;
            }
        }
        if (isdefined(level.var_c383b967aa7e551b)) {
            var_41464293eca8efd7 = [[ level.var_c383b967aa7e551b ]]("orange_crystal", var_41464293eca8efd7);
        }
        foreach (instance in var_41464293eca8efd7) {
            if (var_bd8640129a0b2867 < var_59b0d07e8399e9a2) {
                function_a60bb9caaac38e4e(instance);
                var_bd8640129a0b2867++;
            }
        }
        if (isdefined(level.var_c383b967aa7e551b)) {
            var_6b94404ff55d952c = [[ level.var_c383b967aa7e551b ]]("red_crystal", var_6b94404ff55d952c);
        }
        foreach (instance in var_6b94404ff55d952c) {
            if (var_87155613ec4cfd1c < var_11fd29abbcd121fb) {
                function_a60bb9caaac38e4e(instance);
                var_87155613ec4cfd1c++;
            }
        }
        foreach (instance in var_142e262ef4250cdd) {
            function_a60bb9caaac38e4e(instance);
        }
        level.var_4af01a2d989e9f6f.var_8d0fc73f82c3715c = var_8d0fc73f82c3715c;
        level.var_4af01a2d989e9f6f.var_d211eea36b16b15 = var_d211eea36b16b15;
        level.var_4af01a2d989e9f6f.var_bd8640129a0b2867 = var_bd8640129a0b2867;
        level.var_4af01a2d989e9f6f.var_87155613ec4cfd1c = var_87155613ec4cfd1c;
        callback::callback("ob_crystals_create_script_done");
    }
}

// Namespace loot_crystal/namespace_3bf3843b524af7bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x171a
// Size: 0x30
function function_4a792a9a49c9da56() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_11817d38f58bbb, 0);
        function_fe953f000498048f();
    #/
}

