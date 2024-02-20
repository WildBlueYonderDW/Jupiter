// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_54f6d121e91434f8;
#using script_41387eecc35b88bf;
#using script_2707474774db34b;
#using script_185660037b9236c1;
#using script_7956d56c4922bd1;
#using script_24f248b33b79e48d;
#using script_3ab210ea917601e7;
#using script_4fdefae8b7bcdf73;
#using script_6617e2f2bb62b52b;
#using script_5d8202968463a21d;
#using script_3ac7886f9e4eceef;
#using script_3ff084f114b7f6c9;
#using scripts\mp\utility\teams.gsc;

#namespace namespace_41957062447a88fe;

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad1
// Size: 0xba
function function_84ac3d5c82b5ba3c() {
    namespace_76a219af07c28c13::function_f3d757808130bac4(&function_b128e76919aac9f6);
    var_3ee819ca72435cc3 = getdvarfloat(@"hash_e19c52a408e0765d", 2.3);
    var_1eea19fb9ba75d8b = getdvarfloat(@"hash_fad3c5e3b27f4e7e", 2);
    var_8d7e3a68cd4badb5 = getdvarfloat(@"hash_9c8124fab915f0eb", 16);
    function_fca481c0e8fafd2c("SpatialZoneContainerGroup_ActivityInstance_AwarenessZone", &function_4bd96b7a4fab6757, &function_8638a952b0054cfd, "Awareness_Zone", var_3ee819ca72435cc3);
    function_fca481c0e8fafd2c("SpatialZoneContainerGroup_ActivityInstance_ProximityJoin", &function_687f410b54c889e7, &function_6c5b54cf6ee9a22d, "Proximity_Join_Zone", var_1eea19fb9ba75d8b);
    function_fca481c0e8fafd2c("SpatialZoneContainerGroup_ActivityInstance_HibernationZone", &function_4f7f062ae2f36003, &function_2fc8157d6b3423d3, "Hibernation_Zone", var_8d7e3a68cd4badb5);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb92
// Size: 0x19c
function function_60e8ae157274f8a1(var_e6013eac45290cab) {
    var_e6013eac45290cab.var_1f01d52ce920a114 = spawnstruct();
    var_e6013eac45290cab.var_1f01d52ce920a114 function_a1f71337a6844055();
    function_45945c0e6cfb54cd(var_e6013eac45290cab.var_1f01d52ce920a114, &function_cb4ca5223677f95e, [0:var_e6013eac45290cab, 1:function_152bad0e3347f1(var_e6013eac45290cab)], undefined, "Activity Instance already at Max Players.");
    function_45945c0e6cfb54cd(var_e6013eac45290cab.var_1f01d52ce920a114, &function_e7ba68d59b999a45, [0:var_e6013eac45290cab], undefined, "Activity Instance has Ended.");
    function_45945c0e6cfb54cd(var_e6013eac45290cab.var_1f01d52ce920a114, &function_d4959a754e2acb72, [0:var_e6013eac45290cab], undefined, "Player is already participating in this Activity Instance.");
    if (function_108e464bb2e39da1(var_e6013eac45290cab)) {
        function_45945c0e6cfb54cd(var_e6013eac45290cab.var_1f01d52ce920a114, &function_bcf8c89ae154798e, [0:var_e6013eac45290cab], undefined, "Player is not within the Awarenss Zone.");
    }
    if (function_d4f841b62fb29144(var_e6013eac45290cab)) {
        function_45945c0e6cfb54cd(var_e6013eac45290cab.var_1f01d52ce920a114, &function_643cc89b3c14fbe4, [0:var_e6013eac45290cab], undefined, "Player is already participating in an Activity Instance with the same Type.");
    }
    if (function_d152999f66a33e7d(var_e6013eac45290cab)) {
        function_45945c0e6cfb54cd(var_e6013eac45290cab.var_1f01d52ce920a114, &function_e8379671b512aa24, [0:var_e6013eac45290cab], undefined, "Player is already participating in any Activity Instance.");
    }
    if (function_ed550fddb5f694e1(var_e6013eac45290cab)) {
        function_45945c0e6cfb54cd(var_e6013eac45290cab.var_1f01d52ce920a114, &function_34e215db7fc6d16a, [0:var_e6013eac45290cab], undefined, "Player is already participating in an Activity Instance with the same Category.");
    }
    if (function_1888d1b2aeeda25(var_e6013eac45290cab, "Hibernation_Zone")) {
        var_368d78809a6e6567 = function_7ec62d1550b9897e(var_e6013eac45290cab, "Hibernation_Zone");
        if (var_368d78809a6e6567.size == 0) {
            function_e81ff3302ce5788b(var_e6013eac45290cab, 1);
        }
    }
    var_e6013eac45290cab.var_6c29902757fa1b25 = 1;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd35
// Size: 0x45
function function_c990ea1181ca3c72(var_e6013eac45290cab) {
    if (function_b066d006c79d07df(var_e6013eac45290cab)) {
        var_c6574360bed3d6cf = function_f541e4e4edaa8e99(8, [0:var_e6013eac45290cab], 0);
        function_f541e4e4edaa8e99(7, [0:var_e6013eac45290cab, 1:var_c6574360bed3d6cf], 0);
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd81
// Size: 0x114
function function_91c9ad377a3c4725(var_e6013eac45290cab, playerlist) {
    if (!isarray(playerlist) && isplayer(playerlist)) {
        playerlist = [0:playerlist];
    } else if (!isarray(playerlist)) {
        /#
            assertmsg("'PlayerLeaveActivityInstance'expects an array of players or a single player entity to be passed in as an argument.");
        #/
        return;
    }
    var_b32751d0a14e69d5 = [];
    foreach (player in playerlist) {
        var_eed8fe8660794b35 = function_4ab1cdfd84bbd3f2(var_e6013eac45290cab, player);
        if (var_eed8fe8660794b35) {
            function_f403dff8e00acbda(player, var_e6013eac45290cab);
            var_b32751d0a14e69d5[var_b32751d0a14e69d5.size] = player;
        }
    }
    if (var_b32751d0a14e69d5.size > 0) {
        var_6f8af5eb76deac21 = spawnstruct();
        var_6f8af5eb76deac21.playerlist = var_b32751d0a14e69d5;
        function_735ee8e9d0f1b00b(var_e6013eac45290cab, "PlayerLeave", var_6f8af5eb76deac21);
        function_c662924b60a37407("Players Left Activity.", @"hash_39bc09a8c55a7875", var_e6013eac45290cab, var_b32751d0a14e69d5);
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9c
// Size: 0x2b
function function_887918ed2a888e8f(var_e6013eac45290cab) {
    var_dd5aaf93c0189e1 = var_e6013eac45290cab.var_6c29f2fdb0054bbe;
    function_91c9ad377a3c4725(var_e6013eac45290cab, var_dd5aaf93c0189e1);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xece
// Size: 0x1b
function function_acc361d57f8a8d2a(var_e6013eac45290cab) {
    return function_42a842295fe70a62(var_e6013eac45290cab) == function_152bad0e3347f1(var_e6013eac45290cab);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef1
// Size: 0x92
function function_cd7143f04f862b4a(player, var_626b45032e1892da) {
    var_9d0a2cc88b985e38 = function_553a690e1064cf0b(player);
    foreach (var_fb5fdfafc29f4513, var_b71e9b133c89cc7b in var_9d0a2cc88b985e38) {
        var_e6013eac45290cab = function_1f3e343912ae15c5(var_fb5fdfafc29f4513);
        if (var_e6013eac45290cab.var_626b45032e1892da == var_626b45032e1892da) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8b
// Size: 0x22
function function_d446389b3af72567(player) {
    var_9d0a2cc88b985e38 = function_553a690e1064cf0b(player);
    return var_9d0a2cc88b985e38.size > 0;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb5
// Size: 0x8d
function function_4ab1cdfd84bbd3f2(var_e6013eac45290cab, player) {
    foundplayer = array_find(var_e6013eac45290cab.var_6c29f2fdb0054bbe, player);
    /#
        var_9d0a2cc88b985e38 = function_553a690e1064cf0b(player);
        var_51bb116d018f49f5 = var_9d0a2cc88b985e38[var_e6013eac45290cab.id];
        if (isdefined(foundplayer) && !isdefined(var_51bb116d018f49f5) || !isdefined(foundplayer) && isdefined(var_51bb116d018f49f5)) {
            /#
                assertmsg("Player Joined Activity. Join Reason: ");
            #/
        }
    #/
    if (isdefined(foundplayer)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104a
// Size: 0x62
function function_cb4ca5223677f95e(player, params) {
    /#
        assertex(params.size == 2 && isdefined(params[0]), "The first parameter for this conditional function should be an Activity Instance");
    #/
    var_e6013eac45290cab = params[0];
    maxplayercount = params[1];
    var_78ab76867ae841db = function_42a842295fe70a62(var_e6013eac45290cab) == maxplayercount;
    return !var_78ab76867ae841db;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b4
// Size: 0x67
function function_bcf8c89ae154798e(player, params) {
    /#
        assertex(params.size == 1 && isdefined(params[0]), "The first parameter for this conditional function should be an Activity Instance");
    #/
    var_e6013eac45290cab = params[0];
    if (!function_1888d1b2aeeda25(var_e6013eac45290cab, "Awareness_Zone")) {
        return 0;
    }
    var_32dae89bc8223352 = function_b53f54c7e64f1e5b(player, var_e6013eac45290cab, "Awareness_Zone");
    return var_32dae89bc8223352;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1123
// Size: 0x52
function function_d4959a754e2acb72(player, params) {
    /#
        assertex(params.size == 1 && isdefined(params[0]), "The first parameter for this conditional function should be an Activity Instance");
    #/
    var_e6013eac45290cab = params[0];
    var_e3d11416203dfd45 = function_4ab1cdfd84bbd3f2(var_e6013eac45290cab, player);
    return !var_e3d11416203dfd45;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117d
// Size: 0x68
function function_e7ba68d59b999a45(player, params) {
    /#
        assertex(params.size == 1 && isdefined(params[0]), "The first parameter for this conditional function should be an Activity Instance");
    #/
    var_e6013eac45290cab = params[0];
    var_d47a7d41884d906 = function_73bd348a2ec322cf(var_e6013eac45290cab);
    if (var_d47a7d41884d906 == "EndedState" || var_d47a7d41884d906 == "CleanupState") {
        return 0;
    }
    return 1;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ed
// Size: 0x5c
function function_643cc89b3c14fbe4(player, params) {
    /#
        assertex(params.size == 1 && isdefined(params[0]), "The first parameter for this conditional function should be an Activity Instance");
    #/
    var_e6013eac45290cab = params[0];
    var_b91cae5829560d4d = function_cd7143f04f862b4a(player, var_e6013eac45290cab.var_626b45032e1892da);
    return !var_b91cae5829560d4d;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1251
// Size: 0x1c
function function_e8379671b512aa24(player, params) {
    return !function_d446389b3af72567(player);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1275
// Size: 0x1b
function function_935c3f2efd9c2a4a(player, params) {
    return function_d446389b3af72567(player);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1298
// Size: 0x29
function function_553a690e1064cf0b(player) {
    var_3900d8bea91376b4 = function_5cc2fd3d10cbab56(player);
    return var_3900d8bea91376b4.var_6ff9941006fb29cd;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12c9
// Size: 0x2c
function private function_68f570bd43c84660(var_e6013eac45290cab, player) {
    return isdefined(var_e6013eac45290cab.var_47187a65a8fb783d[player.guid]);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12fd
// Size: 0x73
function private function_7ecf4c3817a5ee70(var_e6013eac45290cab, player, var_ebdc26444cd57171) {
    var_e6013eac45290cab.var_47187a65a8fb783d[player.guid] = 1;
    var_6f8af5eb76deac21 = spawnstruct();
    var_6f8af5eb76deac21.playerlist = [0:player];
    var_6f8af5eb76deac21.var_ebdc26444cd57171 = var_ebdc26444cd57171;
    function_735ee8e9d0f1b00b(var_e6013eac45290cab, "PlayerEnteredAwarenessZone", var_6f8af5eb76deac21);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1377
// Size: 0x5b
function private function_762b576045b77e22(var_e6013eac45290cab, player) {
    var_e6013eac45290cab.var_47187a65a8fb783d[player.guid] = undefined;
    var_6f8af5eb76deac21 = spawnstruct();
    var_6f8af5eb76deac21.playerlist = [0:player];
    function_735ee8e9d0f1b00b(var_e6013eac45290cab, "PlayerExitedAwarenessZone", var_6f8af5eb76deac21);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13d9
// Size: 0x91
function private function_4bd96b7a4fab6757() {
    var_d3f89f07fe3fa0ab = function_efe441752cd7303d();
    var_e6360d11a4557773 = var_d3f89f07fe3fa0ab.var_2bce13ff5b07c0f8;
    var_e30f35db10b74393 = [];
    foreach (instance in var_e6360d11a4557773) {
        if (function_1888d1b2aeeda25(instance, "Awareness_Zone")) {
            var_e30f35db10b74393[var_e30f35db10b74393.size] = instance;
        }
    }
    return var_e30f35db10b74393;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1472
// Size: 0x117
function private function_8638a952b0054cfd(var_d6bfa53c531546d6) {
    var_e6013eac45290cab = self;
    var_3ba893af46bd0cf6 = var_d6bfa53c531546d6.zonename;
    player = var_d6bfa53c531546d6.player;
    var_a917328b0b1b2a19 = var_d6bfa53c531546d6.var_7f9b2cc8a7bdb61e;
    var_ebdc26444cd57171 = var_d6bfa53c531546d6.var_ebdc26444cd57171;
    /#
        assertex(function_1c67ae607a61c6bb(var_e6013eac45290cab), "The Spatial Zone Container for this watcher callback should be an Activity Instance");
    #/
    /#
        assertex(var_3ba893af46bd0cf6 == "Awareness_Zone", "This callback is specifically meant to handle players entering/exiting the Awareness Zone");
    #/
    /#
        assertex(isplayer(player), "This watcher callback expects the first argument to be a player");
    #/
    var_7669bfa60fd97d51 = function_4188e118731a30f4(var_e6013eac45290cab);
    if (var_a917328b0b1b2a19) {
        if (!function_68f570bd43c84660(var_e6013eac45290cab, player)) {
            function_7ecf4c3817a5ee70(var_e6013eac45290cab, player, var_ebdc26444cd57171);
        }
    } else {
        if (function_68f570bd43c84660(var_e6013eac45290cab, player)) {
            function_762b576045b77e22(var_e6013eac45290cab, player);
        }
        var_e282ac248c4f1371 = function_e3b085e9b8ddd75c(var_7669bfa60fd97d51, 0);
        if (var_e282ac248c4f1371) {
            function_b80856244372c252(var_e6013eac45290cab, player);
        }
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1590
// Size: 0x6b
function private function_f403dff8e00acbda(player, var_e6013eac45290cab) {
    var_e6013eac45290cab.var_6c29f2fdb0054bbe = array_remove(var_e6013eac45290cab.var_6c29f2fdb0054bbe, player);
    function_e7519c69e072277c(player, var_e6013eac45290cab);
    if (function_9a5bdd69b1e544f9(player, var_e6013eac45290cab)) {
        function_7a68246baec59148(player);
    } else {
        function_575933e868e5c6e8(player, var_e6013eac45290cab);
    }
    function_d10ee44b55e7d8d4(player);
    var_e6013eac45290cab notify("player_left", player);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1602
// Size: 0x67
function private function_8568803ca63d272e(player, var_e6013eac45290cab, var_b494ea8c4b70490) {
    var_6ae539730dd8b11a = spawnstruct();
    var_6ae539730dd8b11a.var_2cbce2fd25a1eac2 = 0;
    var_6ae539730dd8b11a.var_97ebad77fdbb25c9 = var_b494ea8c4b70490;
    var_6ae539730dd8b11a.var_ab4cdd1bcafb1dff = 0;
    var_6ae539730dd8b11a.var_fb5fdfafc29f4513 = function_f0f498aed6f8fa5d(var_e6013eac45290cab);
    return var_6ae539730dd8b11a;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1671
// Size: 0x5b
function private function_2b092733dffb114(player, var_e6013eac45290cab, var_b494ea8c4b70490) {
    var_6ae539730dd8b11a = function_8568803ca63d272e(player, var_e6013eac45290cab, var_b494ea8c4b70490);
    var_3900d8bea91376b4 = function_5cc2fd3d10cbab56(player);
    var_3900d8bea91376b4.var_6ff9941006fb29cd[var_e6013eac45290cab.id] = var_6ae539730dd8b11a;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16d3
// Size: 0x58
function private function_e7519c69e072277c(player, var_e6013eac45290cab) {
    var_3900d8bea91376b4 = function_5cc2fd3d10cbab56(player);
    if (isdefined(var_3900d8bea91376b4.var_6ff9941006fb29cd[var_e6013eac45290cab.id])) {
        var_3900d8bea91376b4.var_6ff9941006fb29cd[var_e6013eac45290cab.id] = undefined;
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1732
// Size: 0x18
function private function_d1887c42fa98d3ea(var_e6013eac45290cab) {
    return istrue(var_e6013eac45290cab.var_6c29902757fa1b25);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1752
// Size: 0x6
function function_922e7dd63bc48668() {
    /#
    #/
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175f
// Size: 0x221
function function_bbdcd857d0c2a65e(var_e6013eac45290cab, playerlist, var_b494ea8c4b70490) {
    if (!isdefined(var_b494ea8c4b70490)) {
        var_b494ea8c4b70490 = "PlayerJoinedOther";
    }
    if (!isarray(playerlist) && isplayer(playerlist)) {
        playerlist = [0:playerlist];
    } else if (!isarray(playerlist)) {
        /#
            assertmsg("'PlayerJoinActivityInstance'expects an array of players or a single player entity to be passed in as an argument.");
        #/
        return 0;
    }
    var_4b1c35b918f9d256 = function_7ee64875f9ff9ef8();
    foreach (player in playerlist) {
        function_2ee23050ad97fd79(var_4b1c35b918f9d256, var_e6013eac45290cab, player, var_b494ea8c4b70490);
    }
    if (var_4b1c35b918f9d256.var_6429be92ad7c5324.size > 0) {
        var_6f8af5eb76deac21 = spawnstruct();
        var_6f8af5eb76deac21.playerlist = var_4b1c35b918f9d256.var_6429be92ad7c5324;
        var_6f8af5eb76deac21.var_b494ea8c4b70490 = var_b494ea8c4b70490;
        function_735ee8e9d0f1b00b(var_e6013eac45290cab, "PlayerJoin", var_6f8af5eb76deac21);
        if (function_2a1e9879f71ab677(@"hash_39bc09a8c55a7875")) {
            foreach (player in var_4b1c35b918f9d256.var_6429be92ad7c5324) {
                var_97ebad77fdbb25c9 = var_4b1c35b918f9d256.var_893ce0289e7fbf39[player.guid];
                function_c662924b60a37407("Player Joined Activity. Join Reason: " + var_97ebad77fdbb25c9, @"hash_39bc09a8c55a7875", var_e6013eac45290cab, [0:player]);
            }
        }
    }
    foreach (player in playerlist) {
        if (!function_4ab1cdfd84bbd3f2(var_e6013eac45290cab, player)) {
            function_c662924b60a37407("At least one player in the given Player List was unable to Join the Activity.", @"hash_39bc09a8c55a7875", var_e6013eac45290cab, playerlist);
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1988
// Size: 0x55
function function_3e33031646de23b0(var_e6013eac45290cab) {
    var_e6013eac45290cab endon("activity_ended");
    var_e6013eac45290cab endon("instance_destroyed");
    if (!function_1888d1b2aeeda25(var_e6013eac45290cab, "Proximity_Join_Zone")) {
        function_c662924b60a37407("Proximity Join Player Participation polling is starting but Proximity Join Spatial information is either undefined or disabled in the script bundle definition.", @"hash_39bc09a8c55a7875", var_e6013eac45290cab, undefined, 3);
    }
    if (function_94e9b15c2db8c147(var_e6013eac45290cab)) {
        return;
    }
    function_8998be30c1bc4137(var_e6013eac45290cab);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e4
// Size: 0x26
function function_a0df260910df9e83(var_e6013eac45290cab) {
    var_e6013eac45290cab.var_fb3c9eb2fa2690da = 0;
    function_d829ceb32b15c66a(var_e6013eac45290cab, "Proximity_Join_Zone");
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a11
// Size: 0x18
function function_94e9b15c2db8c147(var_e6013eac45290cab) {
    return istrue(var_e6013eac45290cab.var_fb3c9eb2fa2690da);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a31
// Size: 0x44
function function_d58bbda1de18e318(var_6f8af5eb76deac21) {
    var_e1b36cc1a2488212 = getdvarfloat(@"hash_3f1b7cad793f566c", 1);
    var_6f8af5eb76deac21 function_ec65095e6f342856(var_6f8af5eb76deac21.playerlist, &function_9e433939954bf894, undefined, undefined, var_e1b36cc1a2488212, 1);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a7c
// Size: 0x77
function function_38b174f96132d2b4(var_c1a3a9cf7d2963b8) {
    var_e6013eac45290cab = var_c1a3a9cf7d2963b8[0];
    var_6f70b937380efa95 = var_c1a3a9cf7d2963b8[1];
    foreach (var_915dd3ba12be1864 in var_6f70b937380efa95) {
        var_e6013eac45290cab function_992db069ef59360f(var_915dd3ba12be1864);
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1afa
// Size: 0xce
function function_992db069ef59360f(var_915dd3ba12be1864, var_38bc43853a89babb, callbackfunction) {
    var_e6013eac45290cab = self;
    if (isdefined(var_915dd3ba12be1864)) {
        var_915dd3ba12be1864.var_44645e2073da991c = spawnstruct();
        var_915dd3ba12be1864.var_44645e2073da991c.var_e6013eac45290cab = var_e6013eac45290cab;
        var_915dd3ba12be1864.var_44645e2073da991c.var_27c597e03327afaa = istrue(var_38bc43853a89babb);
        var_915dd3ba12be1864.var_44645e2073da991c.var_1a2792ccf4f9d0ea = callbackfunction;
        var_eb37d4f988e45602 = function_40d5384184be8e3c(var_e6013eac45290cab);
        if (!istrue(array_find(var_eb37d4f988e45602, var_915dd3ba12be1864))) {
            namespace_68dc261109a9503f::function_62b3e2a4e6e15396(var_e6013eac45290cab, var_915dd3ba12be1864);
        }
    } else {
        /#
            assertmsg("The interact scriptable being registered for the " + var_e6013eac45290cab.var_626b45032e1892da + " activity is undefined");
        #/
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bcf
// Size: 0x15e
function function_7945819e2d7fc956(var_c1a3a9cf7d2963b8) {
    var_6608bafe66c4007b = [];
    var_e6013eac45290cab = var_c1a3a9cf7d2963b8[0];
    var_7669bfa60fd97d51 = var_e6013eac45290cab function_4188e118731a30f4();
    if (function_1f66cd7e1eadca9c(var_7669bfa60fd97d51)) {
        var_626b45032e1892da = function_a4748b32a824c79c(var_e6013eac45290cab);
        var_5d23c1ad1f4411ad = getstructarray(var_626b45032e1892da, "script_noteworthy");
        var_7669bfa60fd97d51 = var_e6013eac45290cab function_4188e118731a30f4();
        foreach (var_9479a9b75a38cd2b in var_5d23c1ad1f4411ad) {
            if (var_9479a9b75a38cd2b.targetname == "activity_nexus_instance_joiner") {
                var_5e40f85b57215816 = function_22a7bd9a3df1380d(var_7669bfa60fd97d51);
                var_8cb27b6c067f0fe0 = spawnscriptable(var_5e40f85b57215816, var_9479a9b75a38cd2b.origin, var_9479a9b75a38cd2b.angles);
                var_6608bafe66c4007b[var_6608bafe66c4007b.size] = var_8cb27b6c067f0fe0;
                namespace_68dc261109a9503f::function_62b3e2a4e6e15396(var_e6013eac45290cab, var_8cb27b6c067f0fe0, 1);
            }
        }
        /#
            var_8fded318b97c8a14 = getstructarray("<unknown string>", "<unknown string>");
            if (isdefined(var_8fded318b97c8a14) && var_8fded318b97c8a14.size > 0) {
                /#
                    assertex(var_8fded318b97c8a14.size + "<unknown string>");
                #/
            }
        #/
    }
    return var_6608bafe66c4007b;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d35
// Size: 0x22
function function_f0675d4a690011d6(var_1de3e0ea1c8b2aba, callbackfunction) {
    function_c47ebbb07d9fd7de([0:var_1de3e0ea1c8b2aba], callbackfunction);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d5e
// Size: 0x6f
function function_c47ebbb07d9fd7de(var_2431820d8e9cc387, callbackfunction) {
    foreach (ent in var_2431820d8e9cc387) {
        thread function_edaa9716e4706f38(self, ent, callbackfunction);
        thread function_20953d12221a809b(self, ent, callbackfunction);
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd4
// Size: 0x121
function function_daec7b884974dd17(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (isdefined(instance) && isdefined(instance.var_44645e2073da991c)) {
        var_d8257cf1117710d2 = instance.var_44645e2073da991c.var_e6013eac45290cab;
        if (istrue(instance.var_44645e2073da991c.var_27c597e03327afaa) && function_acc361d57f8a8d2a(var_d8257cf1117710d2)) {
            var_626b45032e1892da = function_a4748b32a824c79c(instance.var_44645e2073da991c.var_e6013eac45290cab);
            var_d8257cf1117710d2 = function_ebcfa8f0cbb5cbf1(var_626b45032e1892da);
        }
        if (isdefined(var_d8257cf1117710d2) && !function_4ab1cdfd84bbd3f2(var_d8257cf1117710d2, player)) {
            var_7ec4c0455b2aaa3 = function_bbdcd857d0c2a65e(var_d8257cf1117710d2, player, "PlayerJoinedInteract");
            if (var_7ec4c0455b2aaa3 && isdefined(instance.var_44645e2073da991c.var_1a2792ccf4f9d0ea)) {
                var_d8257cf1117710d2 [[ instance.var_44645e2073da991c.var_1a2792ccf4f9d0ea ]](var_d8257cf1117710d2, instance, player);
            }
        }
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1efc
// Size: 0x113
function private function_feb9f7a42fec48dc(var_e6013eac45290cab, player, var_b494ea8c4b70490) {
    var_512aa3dcae8b14f8 = function_42a842295fe70a62(var_e6013eac45290cab) >= function_e3a6cc803541a75f(var_e6013eac45290cab);
    var_4357bcaf7290e1aa = function_acc361d57f8a8d2a(var_e6013eac45290cab);
    var_e6013eac45290cab.var_6c29f2fdb0054bbe = array_add(var_e6013eac45290cab.var_6c29f2fdb0054bbe, player);
    function_2b092733dffb114(player, var_e6013eac45290cab, var_b494ea8c4b70490);
    function_d10ee44b55e7d8d4(player);
    var_e6013eac45290cab notify("player_joined", player);
    function_e81ff3302ce5788b(var_e6013eac45290cab, 0);
    if (function_acc361d57f8a8d2a(var_e6013eac45290cab) && !var_4357bcaf7290e1aa) {
        var_e6013eac45290cab notify("activity_max_players_reached");
    } else if (function_42a842295fe70a62(var_e6013eac45290cab) >= function_e3a6cc803541a75f(var_e6013eac45290cab) && !var_512aa3dcae8b14f8) {
        var_45dc76b6e82311ee = istrue(var_e6013eac45290cab.var_45dc76b6e82311ee);
        if (function_df5092441b879128(var_e6013eac45290cab, "IdleState", "ActiveState") && !var_45dc76b6e82311ee) {
            function_20e36ec9e5802d01(var_e6013eac45290cab, "ActiveState", "Minimum player count has been reached");
            var_e6013eac45290cab.var_45dc76b6e82311ee = 1;
        }
        var_e6013eac45290cab notify("activity_min_players_reached");
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2016
// Size: 0xaa
function private function_6c5b54cf6ee9a22d(var_d6bfa53c531546d6) {
    var_e6013eac45290cab = self;
    var_3ba893af46bd0cf6 = var_d6bfa53c531546d6.zonename;
    player = var_d6bfa53c531546d6.player;
    var_a917328b0b1b2a19 = var_d6bfa53c531546d6.var_7f9b2cc8a7bdb61e;
    /#
        assertex(function_1c67ae607a61c6bb(var_e6013eac45290cab), "The Spatial Zone Container for this watcher callback should be an Activity Instance");
    #/
    /#
        assertex(var_3ba893af46bd0cf6 == "Proximity_Join_Zone", "This callback is specifically meant to handle players entering/exiting the Proximity Join Zone");
    #/
    /#
        assertex(isplayer(player), "This watcher callback expects the first argument to be a player");
    #/
    if (var_a917328b0b1b2a19) {
        function_bbdcd857d0c2a65e(var_e6013eac45290cab, player, "PlayerJoinedProximity");
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20c7
// Size: 0xa7
function private function_687f410b54c889e7() {
    var_d3f89f07fe3fa0ab = function_efe441752cd7303d();
    var_e6360d11a4557773 = var_d3f89f07fe3fa0ab.var_2bce13ff5b07c0f8;
    var_3fd512e0c2899613 = [];
    foreach (instance in var_e6360d11a4557773) {
        if (function_d1887c42fa98d3ea(instance) && function_1888d1b2aeeda25(instance, "Proximity_Join_Zone") && function_94e9b15c2db8c147(instance)) {
            var_3fd512e0c2899613[var_3fd512e0c2899613.size] = instance;
        }
    }
    return var_3fd512e0c2899613;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2176
// Size: 0x1f
function private function_4f7f062ae2f36003() {
    var_d3f89f07fe3fa0ab = function_efe441752cd7303d();
    return var_d3f89f07fe3fa0ab.var_dde04de762f05a54;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x219d
// Size: 0xd5
function private function_2fc8157d6b3423d3(var_d6bfa53c531546d6) {
    var_e6013eac45290cab = self;
    var_3ba893af46bd0cf6 = var_d6bfa53c531546d6.zonename;
    player = var_d6bfa53c531546d6.player;
    var_a917328b0b1b2a19 = var_d6bfa53c531546d6.var_7f9b2cc8a7bdb61e;
    /#
        assertex(function_1c67ae607a61c6bb(var_e6013eac45290cab), "The Spatial Zone Container for this watcher callback should be an Activity Instance");
    #/
    /#
        assertex(var_3ba893af46bd0cf6 == "Hibernation_Zone", "This callback is specifically meant to handle players entering/exiting the Hibernation Zone");
    #/
    /#
        assertex(isplayer(player), "This watcher callback expects the first argument to be a player");
    #/
    if (var_a917328b0b1b2a19) {
        function_e81ff3302ce5788b(var_e6013eac45290cab, 0);
    } else if (var_d6bfa53c531546d6.var_9f2dab34edc7e257.size == 0 && var_e6013eac45290cab.var_6c29f2fdb0054bbe.size == 0) {
        function_e81ff3302ce5788b(var_e6013eac45290cab, 1);
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2279
// Size: 0x19a
function private function_b128e76919aac9f6(var_bd11f2561cb089ec, var_229340472f26759, var_c6054eed6b10a30) {
    if (function_71d38726159c3f12(11)) {
        function_f541e4e4edaa8e99(11, [0:var_bd11f2561cb089ec], 1);
    } else {
        squad = namespace_54d20dd0dd79277f::function_3d0f2343793d709b(var_bd11f2561cb089ec.team, var_bd11f2561cb089ec.var_ff97225579de16a, 0);
        if (squad.size >= 2) {
            var_1acd4938f955faa5 = squad[0];
            if (var_1acd4938f955faa5 == var_bd11f2561cb089ec) {
                var_1acd4938f955faa5 = squad[1];
            }
            function_c2a2dfab27307a93(var_bd11f2561cb089ec, var_1acd4938f955faa5);
            var_aca1cc230b21bf68 = function_553a690e1064cf0b(var_1acd4938f955faa5);
            var_861695cd06824d43 = function_553a690e1064cf0b(var_bd11f2561cb089ec);
            var_3c4c2dab1407cc88 = array_combine(var_aca1cc230b21bf68, var_861695cd06824d43);
            foreach (var_d13c18af4084bdfd in var_3c4c2dab1407cc88) {
                var_e6013eac45290cab = function_1f3e343912ae15c5(var_d13c18af4084bdfd.var_fb5fdfafc29f4513);
                if (function_9edc3a4b955d5a6c(var_e6013eac45290cab)) {
                    foreach (squadmember in squad) {
                        if (!function_4ab1cdfd84bbd3f2(var_e6013eac45290cab, squadmember)) {
                            function_bbdcd857d0c2a65e(var_e6013eac45290cab, squadmember, "PlayerJoinedSquad");
                        }
                    }
                }
            }
        }
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x241a
// Size: 0x1a
function private function_8998be30c1bc4137(var_e6013eac45290cab) {
    var_e6013eac45290cab.var_fb3c9eb2fa2690da = 1;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x243b
// Size: 0xf6
function private function_edaa9716e4706f38(var_e6013eac45290cab, ent, callbackfunction) {
    ent endon("death");
    var_e6013eac45290cab endon("activity_ended");
    var_e6013eac45290cab endon("instance_destroyed");
    level endon("game_ended");
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = amount = ent waittill("damage");
        function_e99a897e960f3e1(var_e6013eac45290cab, ent, attacker, callbackfunction);
        waitframe();
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2538
// Size: 0x5a
function private function_20953d12221a809b(var_e6013eac45290cab, ent, callbackfunction) {
    var_e6013eac45290cab endon("activity_ended");
    var_e6013eac45290cab endon("instance_destroyed");
    level endon("game_ended");
    meansofdeath = attacker = ent waittill("death");
    function_e99a897e960f3e1(var_e6013eac45290cab, ent, attacker, callbackfunction);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2599
// Size: 0x68
function private function_e99a897e960f3e1(var_e6013eac45290cab, attacked, attacker, callbackfunction) {
    if (isdefined(attacker) && isplayer(attacker) && !function_4ab1cdfd84bbd3f2(var_e6013eac45290cab, attacker)) {
        var_9aeda7c2d232948d = function_bbdcd857d0c2a65e(var_e6013eac45290cab, attacker, "PlayerJoinedDamage");
        if (var_9aeda7c2d232948d && isdefined(callbackfunction)) {
            [[ callbackfunction ]](var_e6013eac45290cab, attacked, attacker);
        }
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2608
// Size: 0x4e
function private function_9e433939954bf894(player) {
    var_cdfb9e28717617cb = getdvarfloat(@"hash_556de73f87d68d35", 3);
    var_fdc9acdc19473f08 = function_385b578f25b2e1f1();
    player function_ec65095e6f342856(var_fdc9acdc19473f08, &function_7eb3fe884322d4ec, &function_ac8de2bae6931ae3, undefined, var_cdfb9e28717617cb, 0);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x265d
// Size: 0xbb
function private function_7eb3fe884322d4ec(var_e6013eac45290cab) {
    player = self;
    if (isplayer(player)) {
        var_9849a2f15828f30f = function_e931f3b80616c348(var_e6013eac45290cab);
        var_5b7a4408af439191 = namespace_8d0d5743d0799922::function_93587d5ba6247f36(var_9849a2f15828f30f, player);
        var_c6574360bed3d6cf = function_40d5384184be8e3c(var_e6013eac45290cab);
        foreach (var_17c3872fea835486 in var_c6574360bed3d6cf) {
            if (istrue(var_5b7a4408af439191)) {
                var_17c3872fea835486 enablescriptableplayeruse(player);
            } else {
                var_17c3872fea835486 disablescriptableplayeruse(player);
            }
        }
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x271f
// Size: 0x2e
function private function_7ee64875f9ff9ef8() {
    var_4b1c35b918f9d256 = spawnstruct();
    var_4b1c35b918f9d256.var_6429be92ad7c5324 = [];
    var_4b1c35b918f9d256.var_893ce0289e7fbf39 = [];
    return var_4b1c35b918f9d256;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2755
// Size: 0x1ca
function private function_2ee23050ad97fd79(var_4b1c35b918f9d256, var_e6013eac45290cab, player, var_b494ea8c4b70490, var_a2e7801897e4d53a) {
    if (!isdefined(var_b494ea8c4b70490)) {
        var_b494ea8c4b70490 = "PlayerJoinedOther";
    }
    if (!isdefined(var_a2e7801897e4d53a)) {
        var_a2e7801897e4d53a = 1;
    }
    var_b4d905018a2cfcc = function_ff013f3a89dabca4(var_e6013eac45290cab.var_1f01d52ce920a114, player);
    if (var_b4d905018a2cfcc.var_3cae69b2d0f4ae72) {
        function_feb9f7a42fec48dc(var_e6013eac45290cab, player, var_b494ea8c4b70490);
        var_4b1c35b918f9d256.var_6429be92ad7c5324[var_4b1c35b918f9d256.var_6429be92ad7c5324.size] = player;
        var_4b1c35b918f9d256.var_893ce0289e7fbf39[player.guid] = var_b494ea8c4b70490;
        if (var_a2e7801897e4d53a) {
            var_7669bfa60fd97d51 = var_e6013eac45290cab function_4188e118731a30f4();
            var_23d6245ff51f1599 = namespace_54d20dd0dd79277f::function_5b7802e04b6d946(player);
            var_63aa2177c0bac532 = function_9edc3a4b955d5a6c(var_7669bfa60fd97d51);
            if (var_23d6245ff51f1599 && var_63aa2177c0bac532) {
                squad = namespace_54d20dd0dd79277f::function_3d0f2343793d709b(player.team, player.var_ff97225579de16a, 0);
                foreach (squadmember in squad) {
                    if (player != squadmember && !function_4ab1cdfd84bbd3f2(var_e6013eac45290cab, squadmember)) {
                        function_2ee23050ad97fd79(var_4b1c35b918f9d256, var_e6013eac45290cab, squadmember, "PlayerJoinedSquad", 0);
                    }
                }
            }
        }
    } else if (function_2a1e9879f71ab677(@"hash_39bc09a8c55a7875")) {
        function_c662924b60a37407("Player Didn't Meet the Participation Conditions to join the Activity. Failed Condition's Description: " + var_b4d905018a2cfcc.var_4b6d8587438ed9aa, @"hash_39bc09a8c55a7875", var_e6013eac45290cab, [0:player]);
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2926
// Size: 0x6
function function_7a1df10c6c92d7b3() {
    /#
    #/
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2933
// Size: 0x97
function function_ad54e18b503363a0(var_e6013eac45290cab, playerlist, var_a8839f00f8702b4a, var_c626e727c242968c) {
    var_a8839f00f8702b4a = function_53c4c53197386572(var_a8839f00f8702b4a, 1);
    var_c626e727c242968c = function_53c4c53197386572(var_c626e727c242968c, 0);
    if (var_c626e727c242968c) {
        foreach (player in playerlist) {
            function_d306509ca7ea3ac3(var_e6013eac45290cab, player);
        }
    }
    function_6d03648148e1a9df(var_e6013eac45290cab, playerlist, var_a8839f00f8702b4a);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29d1
// Size: 0xc0
function function_d306509ca7ea3ac3(var_e6013eac45290cab, player, var_a8839f00f8702b4a, var_c6ab7a5fb43f6d11) {
    var_a8839f00f8702b4a = function_53c4c53197386572(var_a8839f00f8702b4a, 1);
    var_c626e727c242968c = function_53c4c53197386572(var_c626e727c242968c, 0);
    var_da89cda9da7e11 = 0;
    if (!function_7b4d0a8fdbbf4193(player, var_e6013eac45290cab)) {
        function_d5c655d706be5a5a(player, var_e6013eac45290cab);
        function_c662924b60a37407("Activity Abandon Sequence Has Begun For Player", @"hash_39bc09a8c55a7875", var_e6013eac45290cab, [0:player]);
        var_33c9828bcba3ca00 = var_e6013eac45290cab function_404f9294989f829b(var_e6013eac45290cab, player, var_a8839f00f8702b4a, var_c6ab7a5fb43f6d11);
        function_15b9cdad6fea7395(player, var_e6013eac45290cab);
        if (istrue(var_33c9828bcba3ca00)) {
            var_da89cda9da7e11 = 1;
        }
    }
    if (var_da89cda9da7e11) {
        function_6d03648148e1a9df(var_e6013eac45290cab, [0:player], var_a8839f00f8702b4a);
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a98
// Size: 0x53
function function_cfc0a56c1b2b3bd8(var_e6013eac45290cab, player) {
    squadmembers = namespace_54d20dd0dd79277f::function_3d0f2343793d709b(player.team, player.var_ff97225579de16a, 0);
    var_c626e727c242968c = 0;
    function_ad54e18b503363a0(var_e6013eac45290cab, squadmembers, undefined, var_c626e727c242968c);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2af2
// Size: 0x81
function function_1c93e1762d4bf23f(var_e6013eac45290cab, player, var_976b092582260e3a, var_c6ab7a5fb43f6d11) {
    var_7669bfa60fd97d51 = var_e6013eac45290cab function_4188e118731a30f4();
    var_fe04a620eaf5cbe7 = function_b52d9bd121846fd6(var_7669bfa60fd97d51, var_976b092582260e3a);
    var_d40ab9c653910a7d = function_1b0550352b65e18d(var_7669bfa60fd97d51, var_976b092582260e3a);
    if (istrue(var_d40ab9c653910a7d)) {
        function_ad54e18b503363a0(var_e6013eac45290cab, [0:player], var_fe04a620eaf5cbe7);
    } else {
        function_d306509ca7ea3ac3(var_e6013eac45290cab, player, var_fe04a620eaf5cbe7, var_c6ab7a5fb43f6d11);
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b7a
// Size: 0x1cd
function private function_c2a2dfab27307a93(var_bd11f2561cb089ec, var_1acd4938f955faa5) {
    var_5a831f721c6ff88c = function_96f3e17b9bbaa9c1(var_1acd4938f955faa5);
    var_5106f97ec41072cf = function_553a690e1064cf0b(var_bd11f2561cb089ec);
    var_c5a4ebc9255c44a = [];
    var_94ca71165ecc2aa9 = [];
    foreach (var_fb5fdfafc29f4513, var_d13c18af4084bdfd in var_5106f97ec41072cf) {
        var_e6013eac45290cab = function_1f3e343912ae15c5(var_fb5fdfafc29f4513);
        var_1284782798be0bef = function_511be8bcaede8b52(var_e6013eac45290cab);
        if (function_ed550fddb5f694e1(var_e6013eac45290cab) && function_9edc3a4b955d5a6c(var_e6013eac45290cab)) {
            if (var_5a831f721c6ff88c function_a00a363ab21dc770(var_1284782798be0bef)) {
                var_c5a4ebc9255c44a[var_c5a4ebc9255c44a.size] = var_e6013eac45290cab;
            }
        }
        if (var_5a831f721c6ff88c function_1d2480a5046281fd(var_1284782798be0bef)) {
            if (istrue(var_94ca71165ecc2aa9[var_1284782798be0bef])) {
                var_c5a4ebc9255c44a[var_c5a4ebc9255c44a.size] = var_e6013eac45290cab;
            } else {
                foreach (var_e8aaa9453439dcf0 in var_5a831f721c6ff88c.var_b444db5cbbca40f5[var_1284782798be0bef]) {
                    if (function_9edc3a4b955d5a6c(var_e8aaa9453439dcf0)) {
                        var_94ca71165ecc2aa9[var_1284782798be0bef] = 1;
                        var_c5a4ebc9255c44a[var_c5a4ebc9255c44a.size] = var_e6013eac45290cab;
                        break;
                    }
                }
            }
        }
    }
    foreach (var_f7eb259b58a5e63f in var_c5a4ebc9255c44a) {
        function_ad54e18b503363a0(var_f7eb259b58a5e63f, [0:var_bd11f2561cb089ec]);
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d4e
// Size: 0x61
function private function_b80856244372c252(var_e6013eac45290cab, player) {
    var_31b31fcbd1e5961b = function_4ab1cdfd84bbd3f2(var_e6013eac45290cab, player);
    if (var_31b31fcbd1e5961b) {
        var_5bfbbad24429c95f = spawnstruct();
        var_5bfbbad24429c95f function_a1f71337a6844055();
        function_45945c0e6cfb54cd(var_5bfbbad24429c95f, &function_bcf8c89ae154798e, [0:var_e6013eac45290cab]);
        function_1c93e1762d4bf23f(var_e6013eac45290cab, player, 0, var_5bfbbad24429c95f);
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2db6
// Size: 0x67
function private function_1b23a631e9e54b5e(player, var_cba67650c000bc08) {
    function_724d89e705c4c011(player, var_cba67650c000bc08);
    if (!isdefined(level.var_b3efbddcabfb0fe0)) {
        level.var_b3efbddcabfb0fe0 = [];
    }
    if (isdefined(level.var_b3efbddcabfb0fe0["create"]) && function_9a5bdd69b1e544f9(player, self)) {
        self [[ level.var_b3efbddcabfb0fe0["create"] ]](player);
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e24
// Size: 0x48
function private function_ebe994f7f766c66d(player, var_c032a77c26f812ba) {
    if (isdefined(level.var_b3efbddcabfb0fe0["update"]) && function_9a5bdd69b1e544f9(player, self)) {
        self [[ level.var_b3efbddcabfb0fe0["update"] ]](player, var_c032a77c26f812ba);
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e73
// Size: 0x66
function private function_1768d10b1f7b90c0(player, var_cba67650c000bc08) {
    function_dc1c1d2f6e9de57d(player, var_cba67650c000bc08);
    if (isdefined(level.var_b3efbddcabfb0fe0["cleanup"])) {
        var_6f8af5eb76deac21 = spawnstruct();
        var_6f8af5eb76deac21.playerlist = [0:player];
        self [[ level.var_b3efbddcabfb0fe0["cleanup"] ]](var_6f8af5eb76deac21);
    }
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ee0
// Size: 0x13e
function private function_404f9294989f829b(var_e6013eac45290cab, player, var_fe04a620eaf5cbe7, var_c6ab7a5fb43f6d11) {
    var_e6013eac45290cab endon("activity_ended");
    var_e6013eac45290cab endon("instance_destroyed");
    var_cba67650c000bc08 = undefined;
    var_33c9828bcba3ca00 = 0;
    if (var_fe04a620eaf5cbe7) {
        var_cba67650c000bc08 = var_e6013eac45290cab function_e38f1d6d5a208fe1("PlayerLeaveWarning");
        var_e6013eac45290cab function_1b23a631e9e54b5e(player, var_cba67650c000bc08);
    }
    var_3313ce172f38b2b0 = gettime();
    var_997d81b90f85f939 = 5;
    while (1) {
        var_b7d39a4661f3460 = gettime();
        var_c032a77c26f812ba = (var_b7d39a4661f3460 - var_3313ce172f38b2b0) / 1000;
        var_681a6082238c4471 = 0;
        if (isdefined(var_c6ab7a5fb43f6d11) && var_c6ab7a5fb43f6d11 function_cb7d9fafcbb7a3da()) {
            var_681a6082238c4471 = function_93587d5ba6247f36(var_c6ab7a5fb43f6d11, player);
        }
        if (var_681a6082238c4471) {
            break;
        } else if (var_c032a77c26f812ba >= var_997d81b90f85f939) {
            function_c662924b60a37407("Player Abandoned Activity because the countdown sequence timer elapsed.", @"hash_39bc09a8c55a7875", var_e6013eac45290cab, [0:player]);
            var_33c9828bcba3ca00 = 1;
            break;
        } else if (var_fe04a620eaf5cbe7) {
            var_e6013eac45290cab function_ebe994f7f766c66d(player, var_c032a77c26f812ba);
        }
        waitframe();
    }
    if (var_fe04a620eaf5cbe7) {
        var_e6013eac45290cab function_1768d10b1f7b90c0(player, var_cba67650c000bc08);
    }
    return var_33c9828bcba3ca00;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3026
// Size: 0x62
function private function_6d03648148e1a9df(var_e6013eac45290cab, playerlist, var_a8839f00f8702b4a) {
    if (var_a8839f00f8702b4a) {
        var_e6013eac45290cab function_1281c7fff9456e18("PlayerAbandonNotification", playerlist);
    }
    function_91c9ad377a3c4725(var_e6013eac45290cab, playerlist);
    var_6f8af5eb76deac21 = spawnstruct();
    var_6f8af5eb76deac21.playerlist = playerlist;
    function_735ee8e9d0f1b00b(var_e6013eac45290cab, "PlayerAbandon", var_6f8af5eb76deac21);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x308f
// Size: 0x6
function function_c81f47cd6a07b50() {
    /#
    #/
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x309c
// Size: 0xe2
function private function_96f3e17b9bbaa9c1(player) {
    var_72548ab2774a3c1b = spawnstruct();
    var_72548ab2774a3c1b.var_b14f12f073231b9 = 1;
    var_72548ab2774a3c1b.var_a594ec6ead1a932c = [];
    var_72548ab2774a3c1b.var_b444db5cbbca40f5 = [];
    var_32a6f9b3d487152d = function_553a690e1064cf0b(player);
    foreach (var_6965880b974574a6, var_d13c18af4084bdfd in var_32a6f9b3d487152d) {
        var_e6013eac45290cab = function_1f3e343912ae15c5(var_6965880b974574a6);
        var_1284782798be0bef = function_511be8bcaede8b52(var_e6013eac45290cab);
        var_72548ab2774a3c1b function_15c9cc306f3b9bfe(var_e6013eac45290cab, var_1284782798be0bef);
        if (function_ed550fddb5f694e1(var_e6013eac45290cab)) {
            var_72548ab2774a3c1b function_96d17931af44322d(var_e6013eac45290cab, var_1284782798be0bef);
        }
    }
    return var_72548ab2774a3c1b;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3186
// Size: 0x22
function private function_7527493a5c6ca(var_fec478000595694b) {
    return isstruct(var_fec478000595694b) && istrue(var_fec478000595694b.var_b14f12f073231b9);
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x31b0
// Size: 0x7f
function private function_15c9cc306f3b9bfe(var_e6013eac45290cab, var_1284782798be0bef) {
    var_72548ab2774a3c1b = self;
    /#
        assertex(function_7527493a5c6ca(var_72548ab2774a3c1b), "Self is expected to be a CategoryInfoForParticipatingActivityInstancesStruct");
    #/
    if (!isdefined(var_72548ab2774a3c1b.var_a594ec6ead1a932c[var_1284782798be0bef])) {
        var_72548ab2774a3c1b.var_a594ec6ead1a932c[var_1284782798be0bef] = [];
    }
    var_25ebb1f54b1ad6ca = var_72548ab2774a3c1b.var_a594ec6ead1a932c[var_1284782798be0bef].size;
    var_72548ab2774a3c1b.var_a594ec6ead1a932c[var_1284782798be0bef][var_25ebb1f54b1ad6ca] = var_e6013eac45290cab;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3236
// Size: 0x7f
function private function_96d17931af44322d(var_e6013eac45290cab, var_1284782798be0bef) {
    var_72548ab2774a3c1b = self;
    /#
        assertex(function_7527493a5c6ca(var_72548ab2774a3c1b), "Self is expected to be a CategoryInfoForParticipatingActivityInstancesStruct");
    #/
    if (!isdefined(var_72548ab2774a3c1b.var_b444db5cbbca40f5[var_1284782798be0bef])) {
        var_72548ab2774a3c1b.var_b444db5cbbca40f5[var_1284782798be0bef] = [];
    }
    var_25ebb1f54b1ad6ca = var_72548ab2774a3c1b.var_b444db5cbbca40f5[var_1284782798be0bef].size;
    var_72548ab2774a3c1b.var_b444db5cbbca40f5[var_1284782798be0bef][var_25ebb1f54b1ad6ca] = var_e6013eac45290cab;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32bc
// Size: 0x5c
function private function_1d2480a5046281fd(var_1284782798be0bef) {
    var_72548ab2774a3c1b = self;
    /#
        assertex(function_7527493a5c6ca(var_72548ab2774a3c1b), "Self is expected to be a CategoryInfoForParticipatingActivityInstancesStruct");
    #/
    if (isdefined(var_72548ab2774a3c1b.var_b444db5cbbca40f5[var_1284782798be0bef])) {
        var_87e006a81263984 = var_72548ab2774a3c1b.var_b444db5cbbca40f5[var_1284782798be0bef].size;
        return (var_87e006a81263984 > 0);
    }
    return 0;
}

// Namespace namespace_41957062447a88fe/namespace_d886885225a713a7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3320
// Size: 0x5c
function private function_a00a363ab21dc770(var_1284782798be0bef) {
    var_72548ab2774a3c1b = self;
    /#
        assertex(function_7527493a5c6ca(var_72548ab2774a3c1b), "Self is expected to be a CategoryInfoForParticipatingActivityInstancesStruct");
    #/
    if (isdefined(var_72548ab2774a3c1b.var_a594ec6ead1a932c[var_1284782798be0bef])) {
        var_87e006a81263984 = var_72548ab2774a3c1b.var_a594ec6ead1a932c[var_1284782798be0bef].size;
        return (var_87e006a81263984 > 0);
    }
    return 0;
}

