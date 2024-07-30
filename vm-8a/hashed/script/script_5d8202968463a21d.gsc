#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;

#namespace namespace_4c2b495b8d79cc2e;

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x81c
    // Size: 0x5
    function function_cccba3f922586417() {
        
    }

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x829
    // Size: 0x5
    function function_da25e77be5a0ad6d() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x836
// Size: 0x14
function function_7a6a7504cc87e758() {
    var_91cdbcd8f3d0e448 = function_92d6ba64263cef01();
    return var_91cdbcd8f3d0e448;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x853
// Size: 0x31
function function_99a59990b4652967(var_e0071ac2f8a77fe3) {
    assertex(isstruct(var_e0071ac2f8a77fe3), "And object must be a struct to be set up as a Spatial Zone Container.");
    var_e0071ac2f8a77fe3.var_9504c866f3fb1c50 = function_92d6ba64263cef01();
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x88c
// Size: 0xbb
function function_63dd1279e845df5b(var_b9c79f374983c9f4, var_b4bba111dd1edca8) {
    function_99a59990b4652967(var_b9c79f374983c9f4);
    assertex(function_9a9bd30dd7bfe358(var_b4bba111dd1edca8), "You must pass in a struct that has been setup as a Spatial Zone Container using 'SetupAsSpatialZoneContainer'");
    assertex(isstruct(var_b9c79f374983c9f4), "And object must be a struct to be set up as a Spatial Zone Container.");
    var_62124a4aeaeba185 = function_14ae9707b3f6e0d3(var_b4bba111dd1edca8);
    foreach (var_c3abd07869aae560 in var_62124a4aeaeba185) {
        var_c451b98c9b5241b0 = function_e0f46a70ffb4d87f(var_c3abd07869aae560, var_b9c79f374983c9f4);
        function_e1751681d067c1bb(var_b9c79f374983c9f4, var_c451b98c9b5241b0);
    }
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x94f
    // Size: 0x5
    function function_d70183decd8c2e1c() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x95c
// Size: 0x17
function function_9a9bd30dd7bfe358(var_b54df0d66c0b6f60) {
    return isdefined(var_b54df0d66c0b6f60.var_9504c866f3fb1c50);
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97c
// Size: 0x37
function function_1888d1b2aeeda25(var_91cdbcd8f3d0e448, zonename) {
    var_87041f4af6cd6c98 = var_91cdbcd8f3d0e448.var_9504c866f3fb1c50;
    return isdefined(var_87041f4af6cd6c98.zones[zonename]);
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bc
// Size: 0x3e
function function_6733741f628baeff(var_91cdbcd8f3d0e448, zonename) {
    var_c451b98c9b5241b0 = function_8df6169f1826404f(var_91cdbcd8f3d0e448, zonename);
    var_4c2133bbceb6bd16 = var_c451b98c9b5241b0.var_4c2133bbceb6bd16;
    return istrue(var_4c2133bbceb6bd16);
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa03
// Size: 0x44
function function_5bbdc39a533d9d57(var_91cdbcd8f3d0e448, zonename) {
    var_c451b98c9b5241b0 = function_8df6169f1826404f(var_91cdbcd8f3d0e448, zonename);
    if (function_7674e05ba210de51(var_c451b98c9b5241b0)) {
        return function_480085f3edb26a96(var_91cdbcd8f3d0e448, zonename);
    }
    return var_c451b98c9b5241b0.spheres;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa50
// Size: 0x7f
function function_803a3ef29d1b6598(var_91cdbcd8f3d0e448) {
    zonenames = [];
    var_11fcd33995e69fd9 = function_14ae9707b3f6e0d3(var_91cdbcd8f3d0e448);
    foreach (var_c451b98c9b5241b0 in var_11fcd33995e69fd9) {
        zonenames[zonenames.size] = var_c451b98c9b5241b0.name;
    }
    return zonenames;
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xad8
    // Size: 0x5
    function function_8681471a080af440() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae5
// Size: 0xdd
function function_51ad14107ca158fb(var_91cdbcd8f3d0e448, zonename, orign, radius, ignoreheight) {
    if (!function_1888d1b2aeeda25(var_91cdbcd8f3d0e448, zonename)) {
        function_6636b8cd03ed660e(var_91cdbcd8f3d0e448, zonename);
    }
    var_c451b98c9b5241b0 = function_8df6169f1826404f(var_91cdbcd8f3d0e448, zonename);
    if (function_7674e05ba210de51(var_c451b98c9b5241b0)) {
        assertmsg("Spatial Zone: " + zonename + " is linked to " + var_c451b98c9b5241b0.linkedzonename + "and so you can't add this sphere. Instead, add the sphere directly to the " + var_c451b98c9b5241b0.linkedzonename + "zone.");
        return;
    }
    if (!function_6733741f628baeff(var_91cdbcd8f3d0e448, zonename) && !isdefined(orign)) {
        function_79e69463947d9e86(var_91cdbcd8f3d0e448, zonename, &function_d062cecc46c021f8);
    }
    newsphere = function_fafa83b3d61f29bf(var_91cdbcd8f3d0e448, zonename, orign, radius, ignoreheight);
    function_bda026519a101554(var_c451b98c9b5241b0, newsphere);
    return newsphere;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbcb
// Size: 0x2f
function function_6636b8cd03ed660e(var_91cdbcd8f3d0e448, zonename) {
    var_c451b98c9b5241b0 = function_7504cd850bb3a272(zonename);
    function_e1751681d067c1bb(var_91cdbcd8f3d0e448, var_c451b98c9b5241b0);
    return var_c451b98c9b5241b0;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc03
// Size: 0x59
function function_9a33c4470751069d(var_91cdbcd8f3d0e448, zonename, originfunc, originfuncparams) {
    originfunc = default_to(originfunc, &function_d062cecc46c021f8);
    originfuncparams = default_to(originfuncparams, []);
    var_c451b98c9b5241b0 = function_7504cd850bb3a272(zonename, originfunc, originfuncparams);
    function_e1751681d067c1bb(var_91cdbcd8f3d0e448, var_c451b98c9b5241b0);
    return var_c451b98c9b5241b0;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc65
// Size: 0x8e
function function_c4fb45a11de2d13d(var_91cdbcd8f3d0e448, zonename, var_a06fb23870ee1eec, var_f22e6ba735780bf0) {
    var_f22e6ba735780bf0 = default_to(var_f22e6ba735780bf0, 1);
    var_87041f4af6cd6c98 = function_1b52014ec8720ead(var_91cdbcd8f3d0e448);
    if (!function_1888d1b2aeeda25(var_91cdbcd8f3d0e448, zonename)) {
        var_c451b98c9b5241b0 = function_6636b8cd03ed660e(var_91cdbcd8f3d0e448, zonename);
    }
    var_c451b98c9b5241b0 = function_8df6169f1826404f(var_91cdbcd8f3d0e448, zonename);
    if (!function_1888d1b2aeeda25(var_91cdbcd8f3d0e448, zonename)) {
        function_6636b8cd03ed660e(var_91cdbcd8f3d0e448, var_a06fb23870ee1eec);
    }
    function_d4756552d03feb4b(var_c451b98c9b5241b0, var_a06fb23870ee1eec);
    function_273614bdb500882a(var_c451b98c9b5241b0, var_f22e6ba735780bf0);
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfb
// Size: 0xc7
function function_79e69463947d9e86(var_91cdbcd8f3d0e448, zonename, originfunc, originfuncparams) {
    originfuncparams = default_to(originfuncparams, []);
    var_c451b98c9b5241b0 = function_8df6169f1826404f(var_91cdbcd8f3d0e448, zonename);
    function_52fde51c281eeab7(var_c451b98c9b5241b0, 1, originfunc, originfuncparams);
    var_52e597b8a20c31b6 = var_c451b98c9b5241b0.spheres;
    foreach (var_cd3c764a71f6ed01 in var_52e597b8a20c31b6) {
        dynamicorigin = function_761ac31d57f48836(var_c451b98c9b5241b0);
        function_b7cc79aa88b72aa(var_cd3c764a71f6ed01, dynamicorigin);
    }
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xdca
// Size: 0x7c
function function_e5bb9b7f1aadf178(var_91cdbcd8f3d0e448, zonename, var_cd3c764a71f6ed01) {
    var_c451b98c9b5241b0 = function_8df6169f1826404f(var_91cdbcd8f3d0e448, zonename);
    if (function_7674e05ba210de51(var_c451b98c9b5241b0)) {
        assertmsg("Spatial Zone: " + zonename + " is linked to " + var_c451b98c9b5241b0.linkedzonename + "and so you can't remove this sphere. Instead, remove the sphere directly from the " + var_c451b98c9b5241b0.linkedzonename + "zone.");
        return;
    }
    function_2a428fdf96745d77(var_c451b98c9b5241b0, var_cd3c764a71f6ed01);
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4e
// Size: 0x78
function function_99ea7dc018941548(var_91cdbcd8f3d0e448, zonename) {
    var_c451b98c9b5241b0 = function_8df6169f1826404f(var_91cdbcd8f3d0e448, zonename);
    if (function_7674e05ba210de51(var_c451b98c9b5241b0)) {
        assertmsg("Spatial Zone: " + zonename + " is linked to " + var_c451b98c9b5241b0.linkedzonename + "and so you can't remove these spheres. Instead, remove the spheres directly from the " + var_c451b98c9b5241b0.linkedzonename + "zone.");
        return;
    }
    var_c451b98c9b5241b0.spheres = [];
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xece
// Size: 0xf2
function function_35da39cae76b832d(var_91cdbcd8f3d0e448, zonename, ignoreheight) {
    var_c451b98c9b5241b0 = function_8df6169f1826404f(var_91cdbcd8f3d0e448, zonename);
    if (function_7674e05ba210de51(var_c451b98c9b5241b0)) {
        assertmsg("Spatial Zone: " + zonename + " is linked to " + var_c451b98c9b5241b0.linkedzonename + "and so you can't ignore height for this zone. Instead, ignore height directly from the " + var_c451b98c9b5241b0.linkedzonename + "zone.");
        return;
    }
    var_52e597b8a20c31b6 = var_c451b98c9b5241b0.spheres;
    foreach (spherestruct in var_52e597b8a20c31b6) {
        if (istrue(ignoreheight)) {
            spherestruct.var_960f115da5659783 = 1;
            continue;
        }
        spherestruct.var_960f115da5659783 = undefined;
    }
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xfc8
    // Size: 0x5
    function function_fd482c9419cc7d94() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd5
// Size: 0x12c
function function_b53f54c7e64f1e5b(player, var_91cdbcd8f3d0e448, zonename, var_af05175e4604c05c) {
    assertex(function_1888d1b2aeeda25(var_91cdbcd8f3d0e448, zonename), "Zone: " + zonename + " was not found in this Spatial Zone Container despite being asked if a player is within that Zone");
    var_af05175e4604c05c = default_to(var_af05175e4604c05c, 1);
    var_e2ba8e54ae6fa092 = function_5bbdc39a533d9d57(var_91cdbcd8f3d0e448, zonename);
    foreach (var_cd3c764a71f6ed01 in var_e2ba8e54ae6fa092) {
        sphereorigin = function_37c1f31d2434f628(var_cd3c764a71f6ed01);
        sphereradius = function_2403f7fe5d40cecc(var_cd3c764a71f6ed01) * var_af05175e4604c05c;
        var_960f115da5659783 = istrue(var_cd3c764a71f6ed01.var_960f115da5659783);
        if (!function_cb1b89cc191e41a1(sphereorigin, sphereradius)) {
            continue;
        }
        var_3d7c908c7166d6a9 = 0;
        if (var_960f115da5659783) {
            var_3d7c908c7166d6a9 = function_acb96530881571aa(player, sphereorigin, sphereradius);
        } else {
            var_3d7c908c7166d6a9 = function_44daa65837a12044(player, sphereorigin, sphereradius);
        }
        if (var_3d7c908c7166d6a9) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110a
// Size: 0x187
function function_7ec62d1550b9897e(var_91cdbcd8f3d0e448, zonename, var_3ac42d6185ec557b) {
    assertex(function_1888d1b2aeeda25(var_91cdbcd8f3d0e448, zonename), "Zone: " + zonename + " was not found in this Spatial Zone Container despite being asked to find players within that Zone");
    var_3ac42d6185ec557b = default_to(var_3ac42d6185ec557b, 1);
    var_e2ba8e54ae6fa092 = function_5bbdc39a533d9d57(var_91cdbcd8f3d0e448, zonename);
    var_aec21a5b011527dc = [];
    foreach (var_cd3c764a71f6ed01 in var_e2ba8e54ae6fa092) {
        sphereorigin = function_37c1f31d2434f628(var_cd3c764a71f6ed01);
        sphereradius = function_2403f7fe5d40cecc(var_cd3c764a71f6ed01) * var_3ac42d6185ec557b;
        var_960f115da5659783 = istrue(var_cd3c764a71f6ed01.var_960f115da5659783);
        if (!function_cb1b89cc191e41a1(sphereorigin, sphereradius)) {
            continue;
        }
        if (var_960f115da5659783) {
            foreach (player in level.players) {
                if (function_acb96530881571aa(player, sphereorigin, sphereradius)) {
                    var_aec21a5b011527dc[var_aec21a5b011527dc.size] = player;
                }
            }
            continue;
        }
        var_c4c734be3d13cdf6 = getplayersinradius(sphereorigin, sphereradius, undefined);
        var_aec21a5b011527dc = array_combine_unique(var_aec21a5b011527dc, var_c4c734be3d13cdf6);
    }
    return var_aec21a5b011527dc;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x129a
// Size: 0x8e
function function_716a64eee61603d4(var_91cdbcd8f3d0e448, zonename, var_a9cb02436b6682c4, var_af754afeff6c9add, var_175b79dd6f604cac) {
    var_c451b98c9b5241b0 = function_8df6169f1826404f(var_91cdbcd8f3d0e448, zonename);
    if (isdefined(var_a9cb02436b6682c4) && isfunction(var_a9cb02436b6682c4)) {
        function_c95dbcaf321695bf(var_c451b98c9b5241b0, var_a9cb02436b6682c4);
    }
    if (istrue(var_c451b98c9b5241b0.var_4faa734a51b7c302)) {
        return;
    }
    function_e2d5ed9933b02f0(var_c451b98c9b5241b0, 1);
    if (istrue(var_175b79dd6f604cac)) {
        childthread function_8b2c457acbd14043(var_91cdbcd8f3d0e448, zonename, var_af754afeff6c9add);
        return;
    }
    thread function_8b2c457acbd14043(var_91cdbcd8f3d0e448, zonename, var_af754afeff6c9add);
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1330
// Size: 0x71
function function_fca481c0e8fafd2c(var_e499efaafb62f65c, var_112b3319b6684d8d, var_a9cb02436b6682c4, zonename, var_8e455a7fd03e24c7) {
    if (!function_7c6ad7d6dbbe8f8d(var_e499efaafb62f65c)) {
        var_fddf10a2d71f933f = function_c105bef1dce7e126(var_e499efaafb62f65c);
        function_89a410e0520a2538(var_fddf10a2d71f933f);
        function_2dac62aa2032b9b1(var_e499efaafb62f65c, var_a9cb02436b6682c4);
        var_fddf10a2d71f933f thread function_772ac1165605d8d(var_112b3319b6684d8d, var_fddf10a2d71f933f, zonename, var_8e455a7fd03e24c7);
        return;
    }
    function_2dac62aa2032b9b1(var_e499efaafb62f65c, var_a9cb02436b6682c4);
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a9
// Size: 0x91
function function_d829ceb32b15c66a(var_91cdbcd8f3d0e448, zonename) {
    var_91cdbcd8f3d0e448 notify("stop_player_zone_watching_" + zonename);
    var_c451b98c9b5241b0 = function_8df6169f1826404f(var_91cdbcd8f3d0e448, zonename);
    foreach (player in level.players) {
        function_86db5dfb83ed493c(var_c451b98c9b5241b0, player, 2);
    }
    function_e2d5ed9933b02f0(var_c451b98c9b5241b0, 0);
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1442
// Size: 0x34
function function_9ba6374badfee1d2(var_e499efaafb62f65c) {
    if (function_7c6ad7d6dbbe8f8d(var_e499efaafb62f65c)) {
        level.var_7124e21f1a70f024[var_e499efaafb62f65c] notify("stop_player_zone_watching_" + var_e499efaafb62f65c);
        level.var_7124e21f1a70f024[var_e499efaafb62f65c] = undefined;
    }
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x147e
// Size: 0xcb
function function_2dac62aa2032b9b1(var_e499efaafb62f65c, var_a9cb02436b6682c4) {
    assertex(isfunction(var_a9cb02436b6682c4), "Passed in a Spatial Zone Watcher Callback Function that is not a function.");
    var_fddf10a2d71f933f = level.var_7124e21f1a70f024[var_e499efaafb62f65c];
    if (isdefined(var_fddf10a2d71f933f)) {
        foreach (callbackfunc in var_fddf10a2d71f933f.var_a946cf5961339ba3) {
            if (callbackfunc == var_a9cb02436b6682c4) {
                return;
            }
        }
        var_fddf10a2d71f933f.var_a946cf5961339ba3[var_fddf10a2d71f933f.var_a946cf5961339ba3.size] = var_a9cb02436b6682c4;
        return;
    }
    assertmsg("No Grouped Spatial Zone Player Watcher found with the unique name: " + var_e499efaafb62f65c + ". Did you forget to call 'StartGroupedSpatialZonePlayerWatcher()' ?");
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1551
// Size: 0x68
function function_11a6c27cf403881f(var_e499efaafb62f65c, var_e8fd20aceb2acf03) {
    assertex(isfunction(var_e8fd20aceb2acf03), "Passed in a Spatial Zone Watcher Callback Function that is not a function.");
    var_fddf10a2d71f933f = level.var_7124e21f1a70f024[var_e499efaafb62f65c];
    if (isdefined(var_fddf10a2d71f933f)) {
        var_fddf10a2d71f933f.var_e8fd20aceb2acf03 = var_e8fd20aceb2acf03;
        return;
    }
    assertmsg("No Grouped Spatial Zone Player Watcher found with the unique name: " + var_e499efaafb62f65c + ". Did you forget to call 'StartGroupedSpatialZonePlayerWatcher()' ?");
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x15c1
    // Size: 0x5
    function function_8108bfce514bab99() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15ce
// Size: 0x20
function private function_92d6ba64263cef01() {
    var_9504c866f3fb1c50 = spawnstruct();
    var_9504c866f3fb1c50.zones = [];
    return var_9504c866f3fb1c50;
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x15f7
    // Size: 0x5
    function function_9cb6446bcc60c0b8() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1604
// Size: 0x2b
function private function_1b52014ec8720ead(var_91cdbcd8f3d0e448) {
    assertex(function_9a9bd30dd7bfe358(var_91cdbcd8f3d0e448), "You must pass in a struct that has been setup as a Spatial Zone Container using 'SetupAsSpatialZoneContainer'");
    return var_91cdbcd8f3d0e448.var_9504c866f3fb1c50;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1638
// Size: 0x56
function private function_8df6169f1826404f(var_91cdbcd8f3d0e448, zonename) {
    var_87041f4af6cd6c98 = function_1b52014ec8720ead(var_91cdbcd8f3d0e448);
    assertex(isdefined(var_87041f4af6cd6c98.zones[zonename]), "Could not find the: " + zonename + " within this Spatial Zone Container.");
    return var_87041f4af6cd6c98.zones[zonename];
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1697
// Size: 0x28
function private function_14ae9707b3f6e0d3(var_91cdbcd8f3d0e448) {
    var_87041f4af6cd6c98 = function_1b52014ec8720ead(var_91cdbcd8f3d0e448);
    return var_87041f4af6cd6c98.zones;
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x16c8
    // Size: 0x5
    function function_7a1f9e98e65eaff8() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16d5
// Size: 0x6c
function private function_e1751681d067c1bb(var_91cdbcd8f3d0e448, var_c451b98c9b5241b0) {
    var_87041f4af6cd6c98 = function_1b52014ec8720ead(var_91cdbcd8f3d0e448);
    zonename = var_c451b98c9b5241b0.name;
    if (function_1888d1b2aeeda25(var_91cdbcd8f3d0e448, zonename)) {
        assertmsg("A Spatial Zone with the name: " + zonename + "already exists within this Container");
        return;
    }
    var_87041f4af6cd6c98.zones[zonename] = var_c451b98c9b5241b0;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1749
// Size: 0x183
function private function_480085f3edb26a96(var_91cdbcd8f3d0e448, zonename) {
    var_c451b98c9b5241b0 = function_8df6169f1826404f(var_91cdbcd8f3d0e448, zonename);
    var_60b7fc6b70fba741 = ter_op(isdefined(var_c451b98c9b5241b0.var_f22e6ba735780bf0), var_c451b98c9b5241b0.var_f22e6ba735780bf0, 1);
    while (function_7674e05ba210de51(var_c451b98c9b5241b0)) {
        var_e5dd54916c7dd3c7 = function_5d535ab79673ef9(var_91cdbcd8f3d0e448, var_c451b98c9b5241b0);
        var_b085b58dbe9e7778 = ter_op(isdefined(var_e5dd54916c7dd3c7.var_f22e6ba735780bf0), var_e5dd54916c7dd3c7.var_f22e6ba735780bf0, 1);
        if (isnumber(var_b085b58dbe9e7778)) {
            var_60b7fc6b70fba741 *= var_b085b58dbe9e7778;
        }
        var_c451b98c9b5241b0 = var_e5dd54916c7dd3c7;
    }
    if (var_60b7fc6b70fba741 != 1) {
        var_e421906d4aced407 = [];
        var_f8b1af8995e3d601 = var_c451b98c9b5241b0.spheres;
        foreach (zonesphere in var_f8b1af8995e3d601) {
            origin = function_37c1f31d2434f628(zonesphere);
            radius = function_2403f7fe5d40cecc(zonesphere) * var_60b7fc6b70fba741;
            ignoreheight = istrue(zonesphere.var_960f115da5659783);
            var_e421906d4aced407[var_e421906d4aced407.size] = function_fafa83b3d61f29bf(var_91cdbcd8f3d0e448, zonename, origin, radius, ignoreheight);
        }
        return var_e421906d4aced407;
    }
    return var_c451b98c9b5241b0.spheres;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18d5
// Size: 0x29c
function private function_8b2c457acbd14043(var_91cdbcd8f3d0e448, zonename, var_af754afeff6c9add) {
    var_91cdbcd8f3d0e448 endon("stop_player_zone_watching_" + zonename);
    var_af754afeff6c9add = default_to(var_af754afeff6c9add, 1);
    var_c451b98c9b5241b0 = function_8df6169f1826404f(var_91cdbcd8f3d0e448, zonename);
    while (true) {
        function_3d8d8ad244283e65(#"hash_86f9c9a6fb0a647e");
        var_536ac6b9e3d2178 = level.players.size;
        availableframes = max(var_af754afeff6c9add / level.framedurationseconds, 1);
        var_f7cb275e600c3881 = max(var_536ac6b9e3d2178 / availableframes, 1);
        var_fdec72ea7bdf0ed6 = 0;
        var_b9c43ea665a8cad2 = gettime() / 1000;
        var_5f307eb5b02ca2c1 = level.players;
        foreach (player in var_5f307eb5b02ca2c1) {
            if (!isplayer(player) || !isalive(player)) {
                continue;
            }
            if (var_fdec72ea7bdf0ed6 >= var_f7cb275e600c3881) {
                function_7f3923ed3d66f8ad();
                var_fdec72ea7bdf0ed6 = 0;
                waitframe();
                function_3d8d8ad244283e65(#"hash_86f9c9a6fb0a647e");
            }
            var_8bd78a648ccdea91 = function_b53f54c7e64f1e5b(player, var_91cdbcd8f3d0e448, zonename);
            var_73e7a09080fc7032 = function_81cf0e4208bf4700(var_c451b98c9b5241b0, player);
            if (var_8bd78a648ccdea91) {
                if (var_73e7a09080fc7032 != 0) {
                    var_ebdc26444cd57171 = var_73e7a09080fc7032 == 2;
                    function_86db5dfb83ed493c(var_c451b98c9b5241b0, player, 0);
                    var_d6bfa53c531546d6 = function_e446aba84f4ffc9e(player, zonename, 1, var_ebdc26444cd57171, var_c451b98c9b5241b0.var_fd58633b3f789a94);
                    function_a958d8b86ac941fa(var_91cdbcd8f3d0e448, var_c451b98c9b5241b0, var_d6bfa53c531546d6);
                }
            } else if (var_73e7a09080fc7032 == 0) {
                var_af8181363d678ebb = var_73e7a09080fc7032 == 0;
                function_86db5dfb83ed493c(var_c451b98c9b5241b0, player, 1);
                var_d6bfa53c531546d6 = function_e446aba84f4ffc9e(player, zonename, 0, 0, var_c451b98c9b5241b0.var_fd58633b3f789a94);
                function_a958d8b86ac941fa(var_91cdbcd8f3d0e448, var_c451b98c9b5241b0, var_d6bfa53c531546d6);
            }
            var_fdec72ea7bdf0ed6++;
        }
        var_468c00b577420bbd = gettime() / 1000;
        var_40bf9975972ed2ee = var_468c00b577420bbd - var_b9c43ea665a8cad2;
        if (var_40bf9975972ed2ee < var_af754afeff6c9add) {
            function_7f3923ed3d66f8ad();
            var_43f0f7bc766fdb2e = var_af754afeff6c9add - var_40bf9975972ed2ee;
            wait var_43f0f7bc766fdb2e;
            function_3d8d8ad244283e65(#"hash_86f9c9a6fb0a647e");
        } else {
            function_7f3923ed3d66f8ad();
            waitframe();
            function_3d8d8ad244283e65(#"hash_86f9c9a6fb0a647e");
        }
        function_7f3923ed3d66f8ad();
    }
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b79
// Size: 0x31
function private function_5d535ab79673ef9(var_91cdbcd8f3d0e448, var_c451b98c9b5241b0) {
    var_d8cafec191ee9029 = var_c451b98c9b5241b0.linkedzonename;
    return function_8df6169f1826404f(var_91cdbcd8f3d0e448, var_d8cafec191ee9029);
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bb3
    // Size: 0x5
    function function_6d3b68c342b16196() {
        
    }

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bc0
    // Size: 0x5
    function function_dc399f19a760cfe() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1bcd
// Size: 0x9a
function private function_7504cd850bb3a272(zonename, originfunc, originfuncparams) {
    var_c451b98c9b5241b0 = spawnstruct();
    var_c451b98c9b5241b0.name = zonename;
    var_c451b98c9b5241b0.spheres = [];
    var_c451b98c9b5241b0.var_f22e6ba735780bf0 = undefined;
    var_c451b98c9b5241b0.var_4faa734a51b7c302 = undefined;
    var_c451b98c9b5241b0.linkedzonename = undefined;
    var_c451b98c9b5241b0.var_fd58633b3f789a94 = undefined;
    var_c451b98c9b5241b0.trackedplayercallbacks = undefined;
    if (isdefined(originfunc)) {
        function_52fde51c281eeab7(var_c451b98c9b5241b0, 1, originfunc, originfuncparams);
    } else {
        function_52fde51c281eeab7(var_c451b98c9b5241b0, 0);
    }
    return var_c451b98c9b5241b0;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c70
// Size: 0x166
function private function_e0f46a70ffb4d87f(var_c3abd07869aae560, var_30b4c4c7de0af09a) {
    var_c451b98c9b5241b0 = spawnstruct();
    var_c451b98c9b5241b0.name = var_c3abd07869aae560.name;
    var_c451b98c9b5241b0.originfunc = var_c3abd07869aae560.originfunc;
    var_c451b98c9b5241b0.originfuncparams = var_c3abd07869aae560.originfuncparams;
    var_c451b98c9b5241b0.var_4c2133bbceb6bd16 = var_c3abd07869aae560.var_4c2133bbceb6bd16;
    var_c451b98c9b5241b0.spheres = [];
    var_c451b98c9b5241b0.var_fd58633b3f789a94 = [];
    var_c451b98c9b5241b0.var_4faa734a51b7c302 = undefined;
    var_c451b98c9b5241b0.linkedzonename = var_c3abd07869aae560.linkedzonename;
    var_c451b98c9b5241b0.var_f22e6ba735780bf0 = var_c3abd07869aae560.var_f22e6ba735780bf0;
    var_c451b98c9b5241b0.trackedplayercallbacks = var_c3abd07869aae560.trackedplayercallbacks;
    foreach (var_8c0d87dc4c5d1519 in var_c3abd07869aae560.spheres) {
        spherestruct = function_597b29b9438e170e(var_8c0d87dc4c5d1519, var_30b4c4c7de0af09a);
        var_c451b98c9b5241b0.spheres[var_c451b98c9b5241b0.spheres.size] = spherestruct;
    }
    return var_c451b98c9b5241b0;
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ddf
    // Size: 0x5
    function function_4f0760b2bbdff4a9() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1dec
// Size: 0x27
function private function_a7498090b981e3ce(var_c451b98c9b5241b0) {
    if (isdefined(var_c451b98c9b5241b0.trackedplayercallbacks)) {
        return var_c451b98c9b5241b0.trackedplayercallbacks;
    }
    return [];
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e1c
// Size: 0x55
function private function_81cf0e4208bf4700(var_c451b98c9b5241b0, player) {
    if (isdefined(var_c451b98c9b5241b0.var_fd58633b3f789a94)) {
        var_73e7a09080fc7032 = var_c451b98c9b5241b0.var_fd58633b3f789a94[player.guid];
        if (isdefined(var_73e7a09080fc7032) && var_73e7a09080fc7032 != 2) {
            return var_73e7a09080fc7032;
        }
    }
    return 2;
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e7a
    // Size: 0x5
    function function_c39f5c7c7c2d462d() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1e87
// Size: 0x34
function private function_838c21358befc7e8(var_c451b98c9b5241b0, name) {
    assertex(isstring(name), "The Spatial Zone 'Name' property must be of type: string");
    var_c451b98c9b5241b0.name = name;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1ec3
// Size: 0x34
function private function_94a148e71e81b6b7(var_c451b98c9b5241b0, spheres) {
    assertex(isarray(spheres), "The Spatial Zone 'spheres' property must be of type: array");
    var_c451b98c9b5241b0.spheres = spheres;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1eff
// Size: 0x34
function private function_d4756552d03feb4b(var_c451b98c9b5241b0, linkedzonename) {
    assertex(isstring(linkedzonename), "The Spatial Zone 'linkedZoneName' property must be of type: string");
    var_c451b98c9b5241b0.linkedzonename = linkedzonename;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f3b
// Size: 0x62
function private function_273614bdb500882a(var_c451b98c9b5241b0, var_f22e6ba735780bf0) {
    assertex(isnumber(var_f22e6ba735780bf0), "The Spatial Zone 'linkedZoneScale' property must be of type: number");
    assertex(var_f22e6ba735780bf0 >= 0 && var_f22e6ba735780bf0 <= 1, "The Spatial Zone 'linkedZoneScale' property must be a number between or equal to 0 and 1");
    if (var_f22e6ba735780bf0 == 1) {
        var_c451b98c9b5241b0.var_f22e6ba735780bf0 = undefined;
        return;
    }
    var_c451b98c9b5241b0.var_f22e6ba735780bf0 = var_f22e6ba735780bf0;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fa5
// Size: 0x34
function private function_e8a513e2ad91765f(var_c451b98c9b5241b0, originfunc) {
    assertex(isfunction(originfunc), "The Spatial Zone 'originFunc' property must be of type: Function");
    var_c451b98c9b5241b0.originfunc = originfunc;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fe1
// Size: 0x34
function private function_288aecc063db7ead(var_c451b98c9b5241b0, originfuncparams) {
    assertex(isarray(originfuncparams), "The Spatial Zone 'originFuncParams' property must be of type: array");
    var_c451b98c9b5241b0.originfuncparams = originfuncparams;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x201d
// Size: 0x21
function private function_8da40627a9767c84(var_c451b98c9b5241b0, var_4c2133bbceb6bd16) {
    var_c451b98c9b5241b0.var_4c2133bbceb6bd16 = istrue(var_4c2133bbceb6bd16);
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2046
// Size: 0x65
function private function_52fde51c281eeab7(var_c451b98c9b5241b0, var_4c2133bbceb6bd16, originfunc, originfuncparams) {
    if (istrue(var_4c2133bbceb6bd16)) {
        function_e8a513e2ad91765f(var_c451b98c9b5241b0, originfunc);
        function_288aecc063db7ead(var_c451b98c9b5241b0, originfuncparams);
        function_8da40627a9767c84(var_c451b98c9b5241b0, var_4c2133bbceb6bd16);
        return;
    }
    var_c451b98c9b5241b0.originfunc = undefined;
    var_c451b98c9b5241b0.originfuncparams = undefined;
    function_8da40627a9767c84(var_c451b98c9b5241b0, var_4c2133bbceb6bd16);
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20b3
// Size: 0x50
function private function_86db5dfb83ed493c(var_c451b98c9b5241b0, player, state) {
    if (!isdefined(var_c451b98c9b5241b0.var_fd58633b3f789a94)) {
        var_c451b98c9b5241b0.var_fd58633b3f789a94 = [];
    }
    var_c451b98c9b5241b0.var_fd58633b3f789a94[player.guid] = state;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x210b
// Size: 0x34
function private function_e2d5ed9933b02f0(var_c451b98c9b5241b0, trackingplayers) {
    if (istrue(trackingplayers)) {
        var_c451b98c9b5241b0.var_4faa734a51b7c302 = 1;
        return;
    }
    var_c451b98c9b5241b0.var_4faa734a51b7c302 = undefined;
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2147
    // Size: 0x5
    function function_9e7e849efc9e0ff() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2154
// Size: 0x88
function private function_c95dbcaf321695bf(var_c451b98c9b5241b0, callbackfunc) {
    if (!isfunction(callbackfunc)) {
        /#
            zonename = var_c451b98c9b5241b0.name;
            assertex(isfunction(callbackfunc), "<dev string:x1c>" + zonename + "<dev string:x4b>");
        #/
        return;
    }
    if (!isdefined(var_c451b98c9b5241b0.trackedplayercallbacks)) {
        var_c451b98c9b5241b0.trackedplayercallbacks = [];
    }
    var_c451b98c9b5241b0.trackedplayercallbacks[var_c451b98c9b5241b0.trackedplayercallbacks.size] = callbackfunc;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21e4
// Size: 0x7a
function private function_a958d8b86ac941fa(var_91cdbcd8f3d0e448, var_c451b98c9b5241b0, var_d6bfa53c531546d6) {
    trackedplayercallbacks = function_a7498090b981e3ce(var_c451b98c9b5241b0);
    foreach (callbackfunc in trackedplayercallbacks) {
        var_91cdbcd8f3d0e448 thread [[ callbackfunc ]](var_d6bfa53c531546d6);
    }
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2266
// Size: 0xaf
function private function_bda026519a101554(var_c451b98c9b5241b0, spherestruct) {
    if (function_7674e05ba210de51(var_c451b98c9b5241b0)) {
        /#
            zonename = var_c451b98c9b5241b0.name;
            linkedzonename = var_c451b98c9b5241b0.linkedzonename;
            assertmsg("<dev string:x7e>" + zonename + "<dev string:x9a>" + linkedzonename + "<dev string:xc6>");
        #/
        return;
    }
    var_c451b98c9b5241b0.spheres[var_c451b98c9b5241b0.spheres.size] = spherestruct;
    if (istrue(var_c451b98c9b5241b0.var_4c2133bbceb6bd16)) {
        dynamicorigin = function_761ac31d57f48836(var_c451b98c9b5241b0);
        function_b7cc79aa88b72aa(spherestruct, dynamicorigin);
    }
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x231d
// Size: 0xcb
function private function_2a428fdf96745d77(var_c451b98c9b5241b0, spherestruct) {
    if (function_7674e05ba210de51(var_c451b98c9b5241b0)) {
        /#
            zonename = var_c451b98c9b5241b0.name;
            linkedzonename = var_c451b98c9b5241b0.linkedzonename;
            assertmsg("<dev string:x7e>" + zonename + "<dev string:x9a>" + linkedzonename + "<dev string:xfe>");
        #/
        return;
    }
    /#
        spherefound = array_find(var_c451b98c9b5241b0.spheres, spherestruct);
        assertex(isdefined(spherefound), "<dev string:x13b>" + var_c451b98c9b5241b0.name + "<dev string:x15a>");
    #/
    var_c451b98c9b5241b0.spheres = array_remove(var_c451b98c9b5241b0.spheres, spherestruct);
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23f0
// Size: 0x17
function private function_7674e05ba210de51(var_c451b98c9b5241b0) {
    return isdefined(var_c451b98c9b5241b0.linkedzonename);
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2410
// Size: 0x11c
function private function_761ac31d57f48836(var_c451b98c9b5241b0) {
    /#
        spatialzonename = var_c451b98c9b5241b0.name;
        var_4c2133bbceb6bd16 = var_c451b98c9b5241b0.var_4c2133bbceb6bd16;
        assertex(istrue(var_4c2133bbceb6bd16), "<dev string:x188>" + spatialzonename + "<dev string:x19c>");
    #/
    originfunc = var_c451b98c9b5241b0.originfunc;
    originfuncparams = var_c451b98c9b5241b0.originfuncparams;
    if (originfuncparams.size == 0) {
        return [[ originfunc ]]();
    }
    if (originfuncparams.size == 1) {
        return [[ originfunc ]](originfuncparams[0]);
    }
    if (originfuncparams.size == 2) {
        return [[ originfunc ]](originfuncparams[0], originfuncparams[1]);
    }
    if (originfuncparams.size == 3) {
        return [[ originfunc ]](originfuncparams[0], originfuncparams[1], originfuncparams[2]);
    }
    if (originfuncparams.size == 4) {
        return [[ originfunc ]](originfuncparams[0], originfuncparams[1], originfuncparams[2], originfuncparams[3]);
    }
    if (originfuncparams.size == 5) {
        return [[ originfunc ]](originfuncparams[0], originfuncparams[1], originfuncparams[2], originfuncparams[3], originfuncparams[4]);
    }
    assertmsg("Did not expect a Spatial Zone dynamic origin function to require more than 5 arguments. Please update '_getSpatialZoneStructDynamicOrigin' in spatial_zone_container.gsc");
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2534
// Size: 0xf
function private function_d062cecc46c021f8() {
    return (0, 0, 0);
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x254c
    // Size: 0x5
    function function_480fb313d80cf3f5() {
        
    }

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2559
    // Size: 0x5
    function function_77d20a3b70a7283a() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2566
// Size: 0xae
function function_37c1f31d2434f628(var_cd3c764a71f6ed01) {
    var_30b4c4c7de0af09a = var_cd3c764a71f6ed01.var_30b4c4c7de0af09a;
    var_6c505aa10657425c = var_cd3c764a71f6ed01.var_6c505aa10657425c;
    var_c451b98c9b5241b0 = function_8df6169f1826404f(var_30b4c4c7de0af09a, var_6c505aa10657425c);
    var_4c2133bbceb6bd16 = var_c451b98c9b5241b0.var_4c2133bbceb6bd16;
    if (istrue(var_4c2133bbceb6bd16)) {
        dynamicorigin = function_761ac31d57f48836(var_c451b98c9b5241b0);
        if (isdefined(var_cd3c764a71f6ed01.originoffset)) {
            sphereoriginoffset = var_cd3c764a71f6ed01.originoffset;
            dynamicorigin += sphereoriginoffset;
        }
        return dynamicorigin;
    }
    return var_cd3c764a71f6ed01.origin;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x261d
// Size: 0x27
function function_2403f7fe5d40cecc(var_cd3c764a71f6ed01) {
    if (isdefined(var_cd3c764a71f6ed01.radius)) {
        return var_cd3c764a71f6ed01.radius;
    }
    return 0;
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x264d
    // Size: 0x5
    function function_57b6f343b7d09b4f() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x265a
// Size: 0x9a
function private function_fafa83b3d61f29bf(var_30b4c4c7de0af09a, var_6c505aa10657425c, origin, radius, var_ce5a9a9b3cb0e391) {
    var_cd3c764a71f6ed01 = spawnstruct();
    var_cd3c764a71f6ed01.var_6c505aa10657425c = var_6c505aa10657425c;
    var_cd3c764a71f6ed01.var_30b4c4c7de0af09a = var_30b4c4c7de0af09a;
    var_cd3c764a71f6ed01.origin = origin;
    var_cd3c764a71f6ed01.originoffset = undefined;
    var_cd3c764a71f6ed01.radius = ter_op(istrue(radius), radius, undefined);
    var_cd3c764a71f6ed01.var_960f115da5659783 = ter_op(istrue(var_ce5a9a9b3cb0e391), var_ce5a9a9b3cb0e391, undefined);
    return var_cd3c764a71f6ed01;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x26fd
// Size: 0xa4
function private function_597b29b9438e170e(var_db04b14477ee8a3d, var_30b4c4c7de0af09a) {
    var_cd3c764a71f6ed01 = spawnstruct();
    var_cd3c764a71f6ed01.var_6c505aa10657425c = var_db04b14477ee8a3d.var_6c505aa10657425c;
    var_cd3c764a71f6ed01.var_30b4c4c7de0af09a = var_30b4c4c7de0af09a;
    var_cd3c764a71f6ed01.origin = var_db04b14477ee8a3d.origin;
    var_cd3c764a71f6ed01.radius = var_db04b14477ee8a3d.radius;
    var_cd3c764a71f6ed01.originoffset = var_db04b14477ee8a3d.originoffset;
    var_cd3c764a71f6ed01.var_960f115da5659783 = var_db04b14477ee8a3d.var_960f115da5659783;
    return var_cd3c764a71f6ed01;
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x27aa
    // Size: 0x5
    function function_9e4d4e02d806dcb6() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27b7
// Size: 0x47
function private function_b7cc79aa88b72aa(spherestruct, relativeorigin) {
    sphereorigin = spherestruct.origin;
    if (isdefined(sphereorigin)) {
        spherestruct.originoffset = spherestruct.origin - relativeorigin;
    }
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2806
// Size: 0x37
function private function_9bbcadf2b49388fe(var_cd3c764a71f6ed01) {
    radius = function_2403f7fe5d40cecc(var_cd3c764a71f6ed01);
    origin = function_37c1f31d2434f628(var_cd3c764a71f6ed01);
    return function_cb1b89cc191e41a1(origin, radius);
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2846
// Size: 0x83
function private function_cb1b89cc191e41a1(origin, radius) {
    var_52d4532288e7d57b = getdvarfloat(@"hash_7cea12faaeb9d47");
    var_c7fb046f48fd6f5d = 500;
    var_14e6c26fe86384ed = 150;
    if (radius > var_52d4532288e7d57b) {
        return true;
    }
    var_40ad756883c3a593 = function_e7cf54cfde888617(origin);
    radiusdistance = max(radius, var_c7fb046f48fd6f5d);
    radiusdistance += var_14e6c26fe86384ed;
    if (var_40ad756883c3a593 <= radiusdistance) {
        return true;
    }
    return false;
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x28d2
    // Size: 0x5
    function function_5b838ee087a0dcf() {
        
    }

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x28df
    // Size: 0x5
    function function_a23cbc14c47de301() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x28ec
// Size: 0x36
function private function_c105bef1dce7e126(var_e499efaafb62f65c) {
    var_fddf10a2d71f933f = spawnstruct();
    var_fddf10a2d71f933f.var_a946cf5961339ba3 = [];
    var_fddf10a2d71f933f.var_e499efaafb62f65c = var_e499efaafb62f65c;
    return var_fddf10a2d71f933f;
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x292b
    // Size: 0x5
    function function_1b5676eddeadaac0() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2938
// Size: 0x6a
function private function_7b11f0e21972b417(var_fddf10a2d71f933f, var_91cdbcd8f3d0e448, player) {
    var_ace38138c8f0d9b1 = var_fddf10a2d71f933f.var_e499efaafb62f65c;
    if (isdefined(var_91cdbcd8f3d0e448.var_fd78ed23cea8879a[var_ace38138c8f0d9b1][player.guid])) {
        return var_91cdbcd8f3d0e448.var_fd78ed23cea8879a[var_ace38138c8f0d9b1][player.guid];
    }
    return 2;
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x29ab
    // Size: 0x5
    function function_6bd6b3b2a42ee49c() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x29b8
// Size: 0x8f
function private function_8cb56cec0bc3aa3b(var_fddf10a2d71f933f, var_91cdbcd8f3d0e448, player, state) {
    var_ace38138c8f0d9b1 = var_fddf10a2d71f933f.var_e499efaafb62f65c;
    var_fd78ed23cea8879a = var_91cdbcd8f3d0e448.var_fd78ed23cea8879a[var_ace38138c8f0d9b1];
    if (state == 2) {
        var_91cdbcd8f3d0e448.var_fd78ed23cea8879a[var_ace38138c8f0d9b1][player.guid] = undefined;
        return;
    }
    var_91cdbcd8f3d0e448.var_fd78ed23cea8879a[var_ace38138c8f0d9b1][player.guid] = state;
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2a4f
    // Size: 0x5
    function function_a6cc014227a6df00() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a5c
// Size: 0x45
function private function_89a410e0520a2538(var_fddf10a2d71f933f) {
    if (!isdefined(level.var_7124e21f1a70f024)) {
        level.var_7124e21f1a70f024 = [];
    }
    var_e499efaafb62f65c = var_fddf10a2d71f933f.var_e499efaafb62f65c;
    level.var_7124e21f1a70f024[var_e499efaafb62f65c] = var_fddf10a2d71f933f;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2aa9
// Size: 0x2c
function private function_7c6ad7d6dbbe8f8d(var_e499efaafb62f65c) {
    if (isdefined(level.var_7124e21f1a70f024) && isdefined(level.var_7124e21f1a70f024[var_e499efaafb62f65c])) {
        return true;
    }
    return false;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ade
// Size: 0x71
function private function_e29cde2039de320b(var_91cdbcd8f3d0e448, var_fddf10a2d71f933f, var_d6bfa53c531546d6) {
    foreach (var_add82376d656f0a2 in var_fddf10a2d71f933f.var_a946cf5961339ba3) {
        var_91cdbcd8f3d0e448 thread [[ var_add82376d656f0a2 ]](var_d6bfa53c531546d6);
    }
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b57
// Size: 0x2a
function private function_a6fa763d7797fba4(var_91cdbcd8f3d0e448, var_fddf10a2d71f933f, var_5dd9cb9b94aebbec) {
    return var_91cdbcd8f3d0e448 [[ var_fddf10a2d71f933f.var_e8fd20aceb2acf03 ]](var_5dd9cb9b94aebbec);
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b8a
// Size: 0x17
function private function_d945c3caff4dfe6a(var_fddf10a2d71f933f) {
    return isdefined(var_fddf10a2d71f933f.var_e8fd20aceb2acf03);
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2baa
// Size: 0x65
function private function_1fa32a566ea388ec(var_fddf10a2d71f933f, var_91cdbcd8f3d0e448) {
    if (!isdefined(var_91cdbcd8f3d0e448.var_fd78ed23cea8879a)) {
        var_91cdbcd8f3d0e448.var_fd78ed23cea8879a = [];
    }
    var_ace38138c8f0d9b1 = var_fddf10a2d71f933f.var_e499efaafb62f65c;
    if (!isdefined(var_91cdbcd8f3d0e448.var_fd78ed23cea8879a[var_ace38138c8f0d9b1])) {
        var_91cdbcd8f3d0e448.var_fd78ed23cea8879a[var_ace38138c8f0d9b1] = [];
    }
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c17
// Size: 0x4f
function private function_67e9780e178e0f49(var_fddf10a2d71f933f, var_91cdbcd8f3d0e448) {
    if (!isdefined(var_91cdbcd8f3d0e448.var_fd78ed23cea8879a)) {
        return false;
    }
    var_ace38138c8f0d9b1 = var_fddf10a2d71f933f.var_e499efaafb62f65c;
    if (!isdefined(var_91cdbcd8f3d0e448.var_fd78ed23cea8879a[var_ace38138c8f0d9b1])) {
        return false;
    }
    return true;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c6f
// Size: 0x3c9
function private function_772ac1165605d8d(var_112b3319b6684d8d, var_fddf10a2d71f933f, zonename, var_8e455a7fd03e24c7) {
    var_e499efaafb62f65c = var_fddf10a2d71f933f.var_e499efaafb62f65c;
    var_fddf10a2d71f933f endon("stop_player_zone_watching_" + var_e499efaafb62f65c);
    var_b4879576df4e0a18 = default_to(var_8e455a7fd03e24c7, 2);
    while (true) {
        if (!isdefined(level.players)) {
            waitframe();
            continue;
        }
        var_b93495deafd94e3f = self [[ var_112b3319b6684d8d ]]();
        var_ce232bf9498cb4aa = level.players;
        var_457fb4e5e28e3bff = var_ce232bf9498cb4aa.size;
        var_167520872fb644e9 = var_b93495deafd94e3f.size;
        var_e8a501af877f0ba0 = var_457fb4e5e28e3bff * var_167520872fb644e9;
        var_e67e40114df7cf27 = max(var_b4879576df4e0a18 / level.framedurationseconds, 1);
        var_e778e7213e094e03 = max(var_e8a501af877f0ba0 / var_e67e40114df7cf27, 1);
        var_e778e7213e094e03 = ceil(var_e778e7213e094e03);
        var_7e37925a7863886e = gettime() / 1000;
        var_fdec72ea7bdf0ed6 = 0;
        foreach (var_91cdbcd8f3d0e448 in var_b93495deafd94e3f) {
            if (!isdefined(var_91cdbcd8f3d0e448) || !function_1888d1b2aeeda25(var_91cdbcd8f3d0e448, zonename)) {
                continue;
            }
            if (!function_67e9780e178e0f49(var_fddf10a2d71f933f, var_91cdbcd8f3d0e448)) {
                function_1fa32a566ea388ec(var_fddf10a2d71f933f, var_91cdbcd8f3d0e448);
            }
            var_daffb4098d7ba87 = 0;
            var_bbc0c327dc7508fb = 0;
            var_a0a6bb97d0f7cf8 = var_ce232bf9498cb4aa.size;
            while (var_a0a6bb97d0f7cf8 > 0) {
                var_783eb6b458f23ed6 = 0;
                var_af5ea151937c1c71 = var_e778e7213e094e03 - var_fdec72ea7bdf0ed6;
                var_46405c045ed46de0 = min(var_daffb4098d7ba87 + var_af5ea151937c1c71 - 1, var_ce232bf9498cb4aa.size - 1);
                var_46405c045ed46de0 = int(var_46405c045ed46de0);
                var_ce60632ae996343a = function_19a1763950dc39f2(var_ce232bf9498cb4aa, var_daffb4098d7ba87, var_46405c045ed46de0, var_91cdbcd8f3d0e448, var_fddf10a2d71f933f, zonename);
                for (playerindex = var_daffb4098d7ba87; playerindex <= var_46405c045ed46de0; playerindex++) {
                    player = var_ce232bf9498cb4aa[playerindex];
                    if (!isdefined(player)) {
                        continue;
                    }
                    var_8bd78a648ccdea91 = istrue(var_ce60632ae996343a[player.guid]);
                    var_73e7a09080fc7032 = function_7b11f0e21972b417(var_fddf10a2d71f933f, var_91cdbcd8f3d0e448, player);
                    if (var_8bd78a648ccdea91) {
                        if (var_73e7a09080fc7032 != 0) {
                            var_ebdc26444cd57171 = var_73e7a09080fc7032 == 2;
                            function_8cb56cec0bc3aa3b(var_fddf10a2d71f933f, var_91cdbcd8f3d0e448, player, 0);
                            var_ace38138c8f0d9b1 = var_fddf10a2d71f933f.var_e499efaafb62f65c;
                            var_fd78ed23cea8879a = var_91cdbcd8f3d0e448.var_fd78ed23cea8879a[var_ace38138c8f0d9b1];
                            var_d6bfa53c531546d6 = function_e446aba84f4ffc9e(player, zonename, 1, var_ebdc26444cd57171, var_fd78ed23cea8879a);
                            function_e29cde2039de320b(var_91cdbcd8f3d0e448, var_fddf10a2d71f933f, var_d6bfa53c531546d6);
                        }
                        continue;
                    }
                    if (var_73e7a09080fc7032 == 0) {
                        function_8cb56cec0bc3aa3b(var_fddf10a2d71f933f, var_91cdbcd8f3d0e448, player, 1);
                        var_ace38138c8f0d9b1 = var_fddf10a2d71f933f.var_e499efaafb62f65c;
                        var_fd78ed23cea8879a = var_91cdbcd8f3d0e448.var_fd78ed23cea8879a[var_ace38138c8f0d9b1];
                        var_d6bfa53c531546d6 = function_e446aba84f4ffc9e(player, zonename, 0, 0, var_fd78ed23cea8879a);
                        function_e29cde2039de320b(var_91cdbcd8f3d0e448, var_fddf10a2d71f933f, var_d6bfa53c531546d6);
                    }
                }
                var_783eb6b458f23ed6 = var_46405c045ed46de0 - var_daffb4098d7ba87 + 1;
                var_bbc0c327dc7508fb += var_783eb6b458f23ed6;
                var_a0a6bb97d0f7cf8 -= var_bbc0c327dc7508fb;
                var_fdec72ea7bdf0ed6 += var_783eb6b458f23ed6;
                var_daffb4098d7ba87 = var_46405c045ed46de0 + 1;
                if (var_fdec72ea7bdf0ed6 >= var_e778e7213e094e03) {
                    waitframe();
                    var_fdec72ea7bdf0ed6 = 0;
                }
            }
            var_3fc8f38998f11641 = gettime() / 1000;
            var_2c3ea2fc1caa85b8 = var_3fc8f38998f11641 - var_7e37925a7863886e;
            if (var_2c3ea2fc1caa85b8 < var_b4879576df4e0a18) {
                var_94f6d0227b36c6f8 = var_b4879576df4e0a18 - var_2c3ea2fc1caa85b8;
                wait var_94f6d0227b36c6f8;
                continue;
            }
            waitframe();
        }
        waitframe();
    }
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3040
// Size: 0x206
function private function_19a1763950dc39f2(playerlist, startingplayerindex, endingplayerindex, var_91cdbcd8f3d0e448, var_fddf10a2d71f933f, zonename, var_af05175e4604c05c) {
    assertex(startingplayerindex <= endingplayerindex && startingplayerindex >= 0, "The starting player index must be greater or equal to 0 and less than or equal to the end index.");
    assertex(endingplayerindex < playerlist.size, "The ending player index can't be greater than or equal to the size of the player list array.");
    assertex(function_1888d1b2aeeda25(var_91cdbcd8f3d0e448, zonename), "Zone: " + zonename + " was not found in this Spatial Zone Container despite being asked if a player is within that Zone");
    var_af05175e4604c05c = default_to(var_af05175e4604c05c, 1);
    var_e2ba8e54ae6fa092 = function_5bbdc39a533d9d57(var_91cdbcd8f3d0e448, zonename);
    var_aefb4954fb48f074 = [];
    var_ef85bfc09583aed6 = function_d945c3caff4dfe6a(var_fddf10a2d71f933f);
    foreach (var_cd3c764a71f6ed01 in var_e2ba8e54ae6fa092) {
        var_3d7c908c7166d6a9 = 0;
        sphereorigin = function_37c1f31d2434f628(var_cd3c764a71f6ed01);
        sphereradius = function_2403f7fe5d40cecc(var_cd3c764a71f6ed01) * var_af05175e4604c05c;
        var_960f115da5659783 = istrue(var_cd3c764a71f6ed01.var_960f115da5659783);
        if (!function_cb1b89cc191e41a1(sphereorigin, sphereradius)) {
            continue;
        }
        for (playerindex = startingplayerindex; playerindex <= endingplayerindex; playerindex++) {
            player = playerlist[playerindex];
            if (!isplayer(player) || !isalive(player)) {
                continue;
            }
            if (var_960f115da5659783) {
                var_3d7c908c7166d6a9 = function_acb96530881571aa(player, sphereorigin, sphereradius);
            } else {
                var_3d7c908c7166d6a9 = function_44daa65837a12044(player, sphereorigin, sphereradius);
            }
            if (var_ef85bfc09583aed6) {
                var_e33aa6ec4a9e8de9 = function_e90a0002d2d986ea(player, zonename, var_3d7c908c7166d6a9);
                var_3d7c908c7166d6a9 = function_a6fa763d7797fba4(var_91cdbcd8f3d0e448, var_fddf10a2d71f933f, var_e33aa6ec4a9e8de9);
            }
            if (var_3d7c908c7166d6a9) {
                var_aefb4954fb48f074[player.guid] = 1;
            }
        }
    }
    return var_aefb4954fb48f074;
}

/#

    // Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x324f
    // Size: 0x5
    function function_2fc81158cd76e4d0() {
        
    }

#/

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x325c
// Size: 0x105
function private function_e446aba84f4ffc9e(player, zonename, var_18e24f887f518d61, var_ebdc26444cd57171, var_d1afc0a367bfc7f2) {
    var_757bf8d3263ee8b7 = spawnstruct();
    var_757bf8d3263ee8b7.player = player;
    var_757bf8d3263ee8b7.zonename = zonename;
    var_757bf8d3263ee8b7.enteredzone = var_18e24f887f518d61;
    var_757bf8d3263ee8b7.var_ebdc26444cd57171 = var_ebdc26444cd57171;
    var_757bf8d3263ee8b7.var_9f2dab34edc7e257 = [];
    if (isdefined(var_d1afc0a367bfc7f2)) {
        foreach (playerguid, var_50b52e18d39524df in var_d1afc0a367bfc7f2) {
            if (var_50b52e18d39524df == 0) {
                player = getplayerforguid(playerguid);
                if (isdefined(player) && isplayer(player)) {
                    var_757bf8d3263ee8b7.var_9f2dab34edc7e257[var_757bf8d3263ee8b7.var_9f2dab34edc7e257.size] = player;
                }
            }
        }
    }
    return var_757bf8d3263ee8b7;
}

// Namespace namespace_4c2b495b8d79cc2e / namespace_8480efeffcd6e233
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x336a
// Size: 0x53
function private function_e90a0002d2d986ea(player, zonename, var_3d7c908c7166d6a9) {
    var_e33aa6ec4a9e8de9 = spawnstruct();
    var_e33aa6ec4a9e8de9.player = player;
    var_e33aa6ec4a9e8de9.zonename = zonename;
    var_e33aa6ec4a9e8de9.withinradius = var_3d7c908c7166d6a9;
    return var_e33aa6ec4a9e8de9;
}

