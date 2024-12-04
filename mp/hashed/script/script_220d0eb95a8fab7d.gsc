#using script_185660037b9236c1;
#using script_24f248b33b79e48d;
#using script_2707474774db34b;
#using script_3ab210ea917601e7;
#using script_3ac7886f9e4eceef;
#using script_3ff084f114b7f6c9;
#using script_41387eecc35b88bf;
#using script_4fdefae8b7bcdf73;
#using script_54f6d121e91434f8;
#using script_5d8202968463a21d;
#using script_6617e2f2bb62b52b;
#using script_7956d56c4922bd1;
#using scripts\common\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\utility\teams;

#namespace activity_participation;

// Namespace activity_participation / namespace_d886885225a713a7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x829
// Size: 0xb8
function function_84ac3d5c82b5ba3c() {
    namespace_76a219af07c28c13::registerteamassimilatecallback(&function_b128e76919aac9f6);
    var_3ee819ca72435cc3 = getdvarfloat(@"hash_e19c52a408e0765d", 2.3);
    var_1eea19fb9ba75d8b = getdvarfloat(@"hash_fad3c5e3b27f4e7e", 2);
    var_8d7e3a68cd4badb5 = getdvarfloat(@"hash_9c8124fab915f0eb", 16);
    function_fca481c0e8fafd2c("SpatialZoneContainerGroup_ActivityInstance_AwarenessZone", &function_4bd96b7a4fab6757, &function_8638a952b0054cfd, "Awareness_Zone", var_3ee819ca72435cc3);
    function_fca481c0e8fafd2c("SpatialZoneContainerGroup_ActivityInstance_ProximityJoin", &function_687f410b54c889e7, &function_6c5b54cf6ee9a22d, "Proximity_Join_Zone", var_1eea19fb9ba75d8b);
    function_fca481c0e8fafd2c("SpatialZoneContainerGroup_ActivityInstance_HibernationZone", &function_4f7f062ae2f36003, &function_2fc8157d6b3423d3, "Hibernation_Zone", var_8d7e3a68cd4badb5);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e9
// Size: 0x19c
function function_60e8ae157274f8a1(activityinstance) {
    activityinstance.participationconditions = spawnstruct();
    activityinstance.participationconditions function_a1f71337a6844055();
    addcondition(activityinstance.participationconditions, &function_cb4ca5223677f95e, [activityinstance, getmaxplayercount(activityinstance)], undefined, "Activity Instance already at Max Players.");
    addcondition(activityinstance.participationconditions, &function_e7ba68d59b999a45, [activityinstance], undefined, "Activity Instance has Ended.");
    addcondition(activityinstance.participationconditions, &function_d4959a754e2acb72, [activityinstance], undefined, "Player is already participating in this Activity Instance.");
    if (function_108e464bb2e39da1(activityinstance)) {
        addcondition(activityinstance.participationconditions, &function_bcf8c89ae154798e, [activityinstance], undefined, "Player is not within the Awarenss Zone.");
    }
    if (function_d4f841b62fb29144(activityinstance)) {
        addcondition(activityinstance.participationconditions, &function_643cc89b3c14fbe4, [activityinstance], undefined, "Player is already participating in an Activity Instance with the same Type.");
    }
    if (function_d152999f66a33e7d(activityinstance)) {
        addcondition(activityinstance.participationconditions, &function_e8379671b512aa24, [activityinstance], undefined, "Player is already participating in any Activity Instance.");
    }
    if (function_ed550fddb5f694e1(activityinstance)) {
        addcondition(activityinstance.participationconditions, &function_34e215db7fc6d16a, [activityinstance], undefined, "Player is already participating in an Activity Instance with the same Category.");
    }
    if (function_1888d1b2aeeda25(activityinstance, "Hibernation_Zone")) {
        var_368d78809a6e6567 = function_7ec62d1550b9897e(activityinstance, "Hibernation_Zone");
        if (var_368d78809a6e6567.size == 0) {
            function_e81ff3302ce5788b(activityinstance, 1);
        }
    }
    activityinstance.var_6c29902757fa1b25 = 1;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa8d
// Size: 0x45
function function_c990ea1181ca3c72(activityinstance) {
    if (function_b066d006c79d07df(activityinstance)) {
        var_c6574360bed3d6cf = function_f541e4e4edaa8e99(8, [activityinstance], 0);
        function_f541e4e4edaa8e99(7, [activityinstance, var_c6574360bed3d6cf], 0);
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xada
// Size: 0x10f
function function_91c9ad377a3c4725(activityinstance, playerlist) {
    if (!isarray(playerlist) && isplayer(playerlist)) {
        playerlist = [playerlist];
    } else if (!isarray(playerlist)) {
        assertmsg("<dev string:x1c>");
        return;
    }
    var_b32751d0a14e69d5 = [];
    foreach (player in playerlist) {
        var_eed8fe8660794b35 = function_4ab1cdfd84bbd3f2(activityinstance, player);
        if (var_eed8fe8660794b35) {
            function_f403dff8e00acbda(player, activityinstance);
            var_b32751d0a14e69d5[var_b32751d0a14e69d5.size] = player;
        }
    }
    if (var_b32751d0a14e69d5.size > 0) {
        var_6f8af5eb76deac21 = spawnstruct();
        var_6f8af5eb76deac21.playerlist = var_b32751d0a14e69d5;
        function_735ee8e9d0f1b00b(activityinstance, "PlayerLeave", var_6f8af5eb76deac21);
        activitynexuslog("Players Left Activity.", @"hash_39bc09a8c55a7875", activityinstance, var_b32751d0a14e69d5);
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbf1
// Size: 0x2b
function function_887918ed2a888e8f(activityinstance) {
    var_dd5aaf93c0189e1 = activityinstance.var_6c29f2fdb0054bbe;
    function_91c9ad377a3c4725(activityinstance, var_dd5aaf93c0189e1);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc24
// Size: 0x1a
function function_acc361d57f8a8d2a(activityinstance) {
    return function_42a842295fe70a62(activityinstance) == getmaxplayercount(activityinstance);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc47
// Size: 0x8e
function function_cd7143f04f862b4a(player, varianttag) {
    var_9d0a2cc88b985e38 = function_553a690e1064cf0b(player);
    foreach (instanceid, var_b71e9b133c89cc7b in var_9d0a2cc88b985e38) {
        activityinstance = function_1f3e343912ae15c5(instanceid);
        if (activityinstance.varianttag == varianttag) {
            return true;
        }
    }
    return false;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcde
// Size: 0x22
function function_d446389b3af72567(player) {
    var_9d0a2cc88b985e38 = function_553a690e1064cf0b(player);
    return var_9d0a2cc88b985e38.size > 0;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd09
// Size: 0x8b
function function_4ab1cdfd84bbd3f2(activityinstance, player) {
    foundplayer = array_find(activityinstance.var_6c29f2fdb0054bbe, player);
    /#
        var_9d0a2cc88b985e38 = function_553a690e1064cf0b(player);
        var_51bb116d018f49f5 = var_9d0a2cc88b985e38[activityinstance.id];
        if (isdefined(foundplayer) && !isdefined(var_51bb116d018f49f5) || !isdefined(foundplayer) && isdefined(var_51bb116d018f49f5)) {
            assertmsg("<dev string:x92>");
        }
    #/
    if (isdefined(foundplayer)) {
        return true;
    }
    return false;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd9d
// Size: 0x60
function function_cb4ca5223677f95e(player, params) {
    assertex(params.size == 2 && isdefined(params[0]), "<dev string:xf1>");
    activityinstance = params[0];
    maxplayercount = params[1];
    var_78ab76867ae841db = function_42a842295fe70a62(activityinstance) == maxplayercount;
    return !var_78ab76867ae841db;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe06
// Size: 0x66
function function_bcf8c89ae154798e(player, params) {
    assertex(params.size == 1 && isdefined(params[0]), "<dev string:xf1>");
    activityinstance = params[0];
    if (!function_1888d1b2aeeda25(activityinstance, "Awareness_Zone")) {
        return 0;
    }
    var_32dae89bc8223352 = function_b53f54c7e64f1e5b(player, activityinstance, "Awareness_Zone");
    return var_32dae89bc8223352;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe75
// Size: 0x51
function function_d4959a754e2acb72(player, params) {
    assertex(params.size == 1 && isdefined(params[0]), "<dev string:xf1>");
    activityinstance = params[0];
    var_e3d11416203dfd45 = function_4ab1cdfd84bbd3f2(activityinstance, player);
    return !var_e3d11416203dfd45;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xecf
// Size: 0x67
function function_e7ba68d59b999a45(player, params) {
    assertex(params.size == 1 && isdefined(params[0]), "<dev string:xf1>");
    activityinstance = params[0];
    activitycurrentstate = function_73bd348a2ec322cf(activityinstance);
    if (activitycurrentstate == "EndedState" || activitycurrentstate == "CleanupState") {
        return false;
    }
    return true;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf3f
// Size: 0x5b
function function_643cc89b3c14fbe4(player, params) {
    assertex(params.size == 1 && isdefined(params[0]), "<dev string:xf1>");
    activityinstance = params[0];
    var_b91cae5829560d4d = function_cd7143f04f862b4a(player, activityinstance.varianttag);
    return !var_b91cae5829560d4d;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfa3
// Size: 0x1b
function function_e8379671b512aa24(player, params) {
    return !function_d446389b3af72567(player);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfc7
// Size: 0x1a
function function_935c3f2efd9c2a4a(player, params) {
    return function_d446389b3af72567(player);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfea
// Size: 0x29
function function_553a690e1064cf0b(player) {
    var_3900d8bea91376b4 = function_5cc2fd3d10cbab56(player);
    return var_3900d8bea91376b4.var_6ff9941006fb29cd;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x101c
// Size: 0x2b
function private function_68f570bd43c84660(activityinstance, player) {
    return isdefined(activityinstance.var_47187a65a8fb783d[player.guid]);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1050
// Size: 0x73
function private function_7ecf4c3817a5ee70(activityinstance, player, var_ebdc26444cd57171) {
    activityinstance.var_47187a65a8fb783d[player.guid] = 1;
    var_6f8af5eb76deac21 = spawnstruct();
    var_6f8af5eb76deac21.playerlist = [player];
    var_6f8af5eb76deac21.var_ebdc26444cd57171 = var_ebdc26444cd57171;
    function_735ee8e9d0f1b00b(activityinstance, "PlayerEnteredAwarenessZone", var_6f8af5eb76deac21);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x10cb
// Size: 0x5b
function private function_762b576045b77e22(activityinstance, player) {
    activityinstance.var_47187a65a8fb783d[player.guid] = undefined;
    var_6f8af5eb76deac21 = spawnstruct();
    var_6f8af5eb76deac21.playerlist = [player];
    function_735ee8e9d0f1b00b(activityinstance, "PlayerExitedAwarenessZone", var_6f8af5eb76deac21);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x112e
// Size: 0x8c
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

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x11c3
// Size: 0x111
function private function_8638a952b0054cfd(var_d6bfa53c531546d6) {
    activityinstance = self;
    spatialzonename = var_d6bfa53c531546d6.zonename;
    player = var_d6bfa53c531546d6.player;
    var_a917328b0b1b2a19 = var_d6bfa53c531546d6.enteredzone;
    var_ebdc26444cd57171 = var_d6bfa53c531546d6.var_ebdc26444cd57171;
    assertex(function_1c67ae607a61c6bb(activityinstance), "<dev string:x145>");
    assertex(spatialzonename == "<dev string:x19c>", "<dev string:x1ae>");
    assertex(isplayer(player), "<dev string:x20b>");
    activitydefinition = function_4188e118731a30f4(activityinstance);
    if (var_a917328b0b1b2a19) {
        if (!function_68f570bd43c84660(activityinstance, player)) {
            function_7ecf4c3817a5ee70(activityinstance, player, var_ebdc26444cd57171);
        }
        return;
    }
    if (function_68f570bd43c84660(activityinstance, player)) {
        function_762b576045b77e22(activityinstance, player);
    }
    var_e282ac248c4f1371 = function_e3b085e9b8ddd75c(activitydefinition, 0);
    if (var_e282ac248c4f1371) {
        function_b80856244372c252(activityinstance, player);
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x12dc
// Size: 0x6a
function private function_f403dff8e00acbda(player, activityinstance) {
    activityinstance.var_6c29f2fdb0054bbe = array_remove(activityinstance.var_6c29f2fdb0054bbe, player);
    function_e7519c69e072277c(player, activityinstance);
    if (function_9a5bdd69b1e544f9(player, activityinstance)) {
        function_7a68246baec59148(player);
    } else {
        function_575933e868e5c6e8(player, activityinstance);
    }
    function_d10ee44b55e7d8d4(player);
    activityinstance notify("player_left", player);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x134e
// Size: 0x67
function private function_8568803ca63d272e(player, activityinstance, var_b494ea8c4b70490) {
    var_6ae539730dd8b11a = spawnstruct();
    var_6ae539730dd8b11a.var_2cbce2fd25a1eac2 = 0;
    var_6ae539730dd8b11a.joinreason = var_b494ea8c4b70490;
    var_6ae539730dd8b11a.var_ab4cdd1bcafb1dff = 0;
    var_6ae539730dd8b11a.instanceid = function_f0f498aed6f8fa5d(activityinstance);
    return var_6ae539730dd8b11a;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x13be
// Size: 0x5a
function private function_2b092733dffb114(player, activityinstance, var_b494ea8c4b70490) {
    var_6ae539730dd8b11a = function_8568803ca63d272e(player, activityinstance, var_b494ea8c4b70490);
    var_3900d8bea91376b4 = function_5cc2fd3d10cbab56(player);
    var_3900d8bea91376b4.var_6ff9941006fb29cd[activityinstance.id] = var_6ae539730dd8b11a;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1420
// Size: 0x58
function private function_e7519c69e072277c(player, activityinstance) {
    var_3900d8bea91376b4 = function_5cc2fd3d10cbab56(player);
    if (isdefined(var_3900d8bea91376b4.var_6ff9941006fb29cd[activityinstance.id])) {
        var_3900d8bea91376b4.var_6ff9941006fb29cd[activityinstance.id] = undefined;
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1480
// Size: 0x17
function private function_d1887c42fa98d3ea(activityinstance) {
    return istrue(activityinstance.var_6c29902757fa1b25);
}

/#

    // Namespace activity_participation / namespace_d886885225a713a7
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x14a0
    // Size: 0x5
    function function_922e7dd63bc48668() {
        
    }

#/

// Namespace activity_participation / namespace_d886885225a713a7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14ad
// Size: 0x227
function function_bbdcd857d0c2a65e(activityinstance, playerlist, var_b494ea8c4b70490) {
    if (!isdefined(var_b494ea8c4b70490)) {
        var_b494ea8c4b70490 = "PlayerJoinedOther";
    }
    if (!isarray(playerlist) && isplayer(playerlist)) {
        playerlist = [playerlist];
    } else if (!isarray(playerlist)) {
        assertmsg("<dev string:x24e>");
        return false;
    }
    var_4b1c35b918f9d256 = function_7ee64875f9ff9ef8();
    foreach (player in playerlist) {
        function_2ee23050ad97fd79(var_4b1c35b918f9d256, activityinstance, player, var_b494ea8c4b70490);
    }
    if (var_4b1c35b918f9d256.var_6429be92ad7c5324.size > 0) {
        var_6f8af5eb76deac21 = spawnstruct();
        var_6f8af5eb76deac21.playerlist = var_4b1c35b918f9d256.var_6429be92ad7c5324;
        var_6f8af5eb76deac21.var_b494ea8c4b70490 = var_b494ea8c4b70490;
        if (!istrue(activityinstance.var_6769b69c3916c8ed)) {
            function_735ee8e9d0f1b00b(activityinstance, "PlayerJoin", var_6f8af5eb76deac21);
        }
        if (function_2a1e9879f71ab677(@"hash_39bc09a8c55a7875")) {
            foreach (player in var_4b1c35b918f9d256.var_6429be92ad7c5324) {
                joinreason = var_4b1c35b918f9d256.var_893ce0289e7fbf39[player.guid];
                activitynexuslog("Player Joined Activity. Join Reason: " + joinreason, @"hash_39bc09a8c55a7875", activityinstance, [player]);
            }
        }
    }
    foreach (player in playerlist) {
        if (!function_4ab1cdfd84bbd3f2(activityinstance, player)) {
            activitynexuslog("At least one player in the given Player List was unable to Join the Activity.", @"hash_39bc09a8c55a7875", activityinstance, playerlist);
            return false;
        }
    }
    return true;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16dd
// Size: 0x54
function function_3e33031646de23b0(activityinstance) {
    activityinstance endon("activity_ended");
    activityinstance endon("instance_destroyed");
    if (!function_1888d1b2aeeda25(activityinstance, "Proximity_Join_Zone")) {
        activitynexuslog("Proximity Join Player Participation polling is starting but Proximity Join Spatial information is either undefined or disabled in the script bundle definition.", @"hash_39bc09a8c55a7875", activityinstance, undefined, 3);
    }
    if (function_94e9b15c2db8c147(activityinstance)) {
        return;
    }
    function_8998be30c1bc4137(activityinstance);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1739
// Size: 0x25
function function_a0df260910df9e83(activityinstance) {
    activityinstance.var_fb3c9eb2fa2690da = 0;
    function_d829ceb32b15c66a(activityinstance, "Proximity_Join_Zone");
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1766
// Size: 0x17
function function_94e9b15c2db8c147(activityinstance) {
    return istrue(activityinstance.var_fb3c9eb2fa2690da);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1786
// Size: 0x44
function function_d58bbda1de18e318(var_6f8af5eb76deac21) {
    var_e1b36cc1a2488212 = getdvarfloat(@"hash_3f1b7cad793f566c", 1);
    var_6f8af5eb76deac21 function_ec65095e6f342856(var_6f8af5eb76deac21.playerlist, &function_9e433939954bf894, undefined, undefined, var_e1b36cc1a2488212, 1);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17d2
// Size: 0x73
function function_38b174f96132d2b4(relevantparameters) {
    activityinstance = relevantparameters[0];
    var_6f70b937380efa95 = relevantparameters[1];
    foreach (var_915dd3ba12be1864 in var_6f70b937380efa95) {
        activityinstance function_992db069ef59360f(var_915dd3ba12be1864);
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x184d
// Size: 0xcd
function function_992db069ef59360f(var_915dd3ba12be1864, var_38bc43853a89babb, callbackfunction) {
    activityinstance = self;
    if (isdefined(var_915dd3ba12be1864)) {
        var_915dd3ba12be1864.var_44645e2073da991c = spawnstruct();
        var_915dd3ba12be1864.var_44645e2073da991c.activityinstance = activityinstance;
        var_915dd3ba12be1864.var_44645e2073da991c.var_27c597e03327afaa = istrue(var_38bc43853a89babb);
        var_915dd3ba12be1864.var_44645e2073da991c.joincallbackfunction = callbackfunction;
        var_eb37d4f988e45602 = function_40d5384184be8e3c(activityinstance);
        if (!istrue(array_find(var_eb37d4f988e45602, var_915dd3ba12be1864))) {
            namespace_68dc261109a9503f::function_62b3e2a4e6e15396(activityinstance, var_915dd3ba12be1864);
        }
        return;
    }
    assertmsg("<dev string:x2c3>" + activityinstance.varianttag + "<dev string:x2f8>");
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1922
// Size: 0x1fa
function function_7945819e2d7fc956(relevantparameters) {
    var_6608bafe66c4007b = [];
    activityinstance = relevantparameters[0];
    activitydefinition = activityinstance function_4188e118731a30f4();
    if (function_1f66cd7e1eadca9c(activitydefinition)) {
        varianttag = function_a4748b32a824c79c(activityinstance);
        var_5d23c1ad1f4411ad = getstructarray(varianttag, "script_noteworthy");
        activitydefinition = activityinstance function_4188e118731a30f4();
        foreach (scriptstruct in var_5d23c1ad1f4411ad) {
            if (scriptstruct.targetname == "activity_nexus_instance_joiner") {
                var_5e40f85b57215816 = function_22a7bd9a3df1380d(activitydefinition);
                contents = create_contents(0, 1, 1, 1, 1, 1, 1, 0, 1);
                trace = ray_trace(scriptstruct.origin + (0, 0, 36), scriptstruct.origin - (0, 0, 36), undefined, contents, undefined, 0, 1);
                endpos = trace["position"];
                var_ebebcc6c5963332 = 12;
                if (abs(endpos[2] - scriptstruct.origin[2]) <= var_ebebcc6c5963332) {
                    endpos = scriptstruct.origin;
                }
                var_8cb27b6c067f0fe0 = spawnscriptable(var_5e40f85b57215816, endpos, scriptstruct.angles);
                var_6608bafe66c4007b[var_6608bafe66c4007b.size] = var_8cb27b6c067f0fe0;
                namespace_68dc261109a9503f::function_62b3e2a4e6e15396(activityinstance, var_8cb27b6c067f0fe0, 1);
            }
        }
        /#
            var_8fded318b97c8a14 = getstructarray("<dev string:x312>", "<dev string:x328>");
            if (isdefined(var_8fded318b97c8a14) && var_8fded318b97c8a14.size > 0) {
                assertex(var_8fded318b97c8a14.size + "<dev string:x33d>");
            }
        #/
    }
    return var_6608bafe66c4007b;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b25
// Size: 0x21
function function_f0675d4a690011d6(var_1de3e0ea1c8b2aba, callbackfunction) {
    function_c47ebbb07d9fd7de([var_1de3e0ea1c8b2aba], callbackfunction);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b4e
// Size: 0x6d
function function_c47ebbb07d9fd7de(var_2431820d8e9cc387, callbackfunction) {
    foreach (ent in var_2431820d8e9cc387) {
        thread function_edaa9716e4706f38(self, ent, callbackfunction);
        thread function_20953d12221a809b(self, ent, callbackfunction);
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1bc3
// Size: 0x11f
function function_daec7b884974dd17(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (isdefined(instance) && isdefined(instance.var_44645e2073da991c)) {
        var_d8257cf1117710d2 = instance.var_44645e2073da991c.activityinstance;
        if (istrue(instance.var_44645e2073da991c.var_27c597e03327afaa) && function_acc361d57f8a8d2a(var_d8257cf1117710d2)) {
            varianttag = function_a4748b32a824c79c(instance.var_44645e2073da991c.activityinstance);
            var_d8257cf1117710d2 = function_ebcfa8f0cbb5cbf1(varianttag);
        }
        if (isdefined(var_d8257cf1117710d2) && !function_4ab1cdfd84bbd3f2(var_d8257cf1117710d2, player)) {
            playedjoined = function_bbdcd857d0c2a65e(var_d8257cf1117710d2, player, "PlayerJoinedInteract");
            if (playedjoined && isdefined(instance.var_44645e2073da991c.joincallbackfunction)) {
                var_d8257cf1117710d2 [[ instance.var_44645e2073da991c.joincallbackfunction ]](var_d8257cf1117710d2, instance, player);
            }
        }
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1cea
// Size: 0x111
function private function_feb9f7a42fec48dc(activityinstance, player, var_b494ea8c4b70490) {
    var_512aa3dcae8b14f8 = function_42a842295fe70a62(activityinstance) >= function_e3a6cc803541a75f(activityinstance);
    var_4357bcaf7290e1aa = function_acc361d57f8a8d2a(activityinstance);
    activityinstance.var_6c29f2fdb0054bbe = array_add(activityinstance.var_6c29f2fdb0054bbe, player);
    function_2b092733dffb114(player, activityinstance, var_b494ea8c4b70490);
    function_d10ee44b55e7d8d4(player);
    activityinstance notify("player_joined", player);
    function_e81ff3302ce5788b(activityinstance, 0);
    if (function_acc361d57f8a8d2a(activityinstance) && !var_4357bcaf7290e1aa) {
        activityinstance notify("activity_max_players_reached");
        return;
    }
    if (function_42a842295fe70a62(activityinstance) >= function_e3a6cc803541a75f(activityinstance) && !var_512aa3dcae8b14f8) {
        var_45dc76b6e82311ee = istrue(activityinstance.var_45dc76b6e82311ee);
        if (function_df5092441b879128(activityinstance, "IdleState", "ActiveState") && !var_45dc76b6e82311ee) {
            function_20e36ec9e5802d01(activityinstance, "ActiveState", "Minimum player count has been reached");
            activityinstance.var_45dc76b6e82311ee = 1;
        }
        activityinstance notify("activity_min_players_reached");
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1e03
// Size: 0xa7
function private function_6c5b54cf6ee9a22d(var_d6bfa53c531546d6) {
    activityinstance = self;
    spatialzonename = var_d6bfa53c531546d6.zonename;
    player = var_d6bfa53c531546d6.player;
    var_a917328b0b1b2a19 = var_d6bfa53c531546d6.enteredzone;
    assertex(function_1c67ae607a61c6bb(activityinstance), "<dev string:x145>");
    assertex(spatialzonename == "<dev string:x3d0>", "<dev string:x3e7>");
    assertex(isplayer(player), "<dev string:x20b>");
    if (var_a917328b0b1b2a19) {
        function_bbdcd857d0c2a65e(activityinstance, player, "PlayerJoinedProximity");
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1eb2
// Size: 0xa2
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

// Namespace activity_participation / namespace_d886885225a713a7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1f5d
// Size: 0x1f
function private function_4f7f062ae2f36003() {
    var_d3f89f07fe3fa0ab = function_efe441752cd7303d();
    return var_d3f89f07fe3fa0ab.var_dde04de762f05a54;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1f85
// Size: 0xd2
function private function_2fc8157d6b3423d3(var_d6bfa53c531546d6) {
    activityinstance = self;
    spatialzonename = var_d6bfa53c531546d6.zonename;
    player = var_d6bfa53c531546d6.player;
    var_a917328b0b1b2a19 = var_d6bfa53c531546d6.enteredzone;
    assertex(function_1c67ae607a61c6bb(activityinstance), "<dev string:x145>");
    assertex(spatialzonename == "<dev string:x449>", "<dev string:x45d>");
    assertex(isplayer(player), "<dev string:x20b>");
    if (var_a917328b0b1b2a19) {
        function_e81ff3302ce5788b(activityinstance, 0);
        return;
    }
    if (var_d6bfa53c531546d6.var_9f2dab34edc7e257.size == 0 && activityinstance.var_6c29f2fdb0054bbe.size == 0) {
        function_e81ff3302ce5788b(activityinstance, 1);
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x205f
// Size: 0x18f
function private function_b128e76919aac9f6(var_bd11f2561cb089ec, oldteamindex, newteamindex) {
    if (function_71d38726159c3f12(11)) {
        function_f541e4e4edaa8e99(11, [var_bd11f2561cb089ec], 1);
        return;
    }
    squad = scripts\mp\utility\teams::getsquadmates(var_bd11f2561cb089ec.team, var_bd11f2561cb089ec.sessionsquadid, 0);
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
            activityinstance = function_1f3e343912ae15c5(var_d13c18af4084bdfd.instanceid);
            if (function_9edc3a4b955d5a6c(activityinstance)) {
                foreach (squadmember in squad) {
                    if (!function_4ab1cdfd84bbd3f2(activityinstance, squadmember)) {
                        function_bbdcd857d0c2a65e(activityinstance, squadmember, "PlayerJoinedSquad");
                    }
                }
            }
        }
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x21f6
// Size: 0x19
function private function_8998be30c1bc4137(activityinstance) {
    activityinstance.var_fb3c9eb2fa2690da = 1;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2217
// Size: 0xe9
function private function_edaa9716e4706f38(activityinstance, ent, callbackfunction) {
    ent endon("death");
    activityinstance endon("activity_ended");
    activityinstance endon("instance_destroyed");
    level endon("game_ended");
    while (true) {
        ent waittill("damage", amount, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor);
        function_e99a897e960f3e1(activityinstance, ent, attacker, callbackfunction);
        waitframe();
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2308
// Size: 0x59
function private function_20953d12221a809b(activityinstance, ent, callbackfunction) {
    activityinstance endon("activity_ended");
    activityinstance endon("instance_destroyed");
    level endon("game_ended");
    ent waittill("death", attacker, meansofdeath);
    function_e99a897e960f3e1(activityinstance, ent, attacker, callbackfunction);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x2369
// Size: 0x68
function private function_e99a897e960f3e1(activityinstance, attacked, attacker, callbackfunction) {
    if (isdefined(attacker) && isplayer(attacker) && !function_4ab1cdfd84bbd3f2(activityinstance, attacker)) {
        playerjoined = function_bbdcd857d0c2a65e(activityinstance, attacker, "PlayerJoinedDamage");
        if (playerjoined && isdefined(callbackfunction)) {
            [[ callbackfunction ]](activityinstance, attacked, attacker);
        }
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x23d9
// Size: 0x4d
function private function_9e433939954bf894(player) {
    var_cdfb9e28717617cb = getdvarfloat(@"hash_556de73f87d68d35", 3);
    activityinstances = function_385b578f25b2e1f1();
    player function_ec65095e6f342856(activityinstances, &function_7eb3fe884322d4ec, &function_ac8de2bae6931ae3, undefined, var_cdfb9e28717617cb, 0);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x242e
// Size: 0xb5
function private function_7eb3fe884322d4ec(activityinstance) {
    player = self;
    if (isplayer(player)) {
        var_9849a2f15828f30f = function_e931f3b80616c348(activityinstance);
        var_5b7a4408af439191 = namespace_8d0d5743d0799922::function_93587d5ba6247f36(var_9849a2f15828f30f, player);
        var_c6574360bed3d6cf = function_40d5384184be8e3c(activityinstance);
        foreach (var_17c3872fea835486 in var_c6574360bed3d6cf) {
            if (istrue(var_5b7a4408af439191)) {
                var_17c3872fea835486 enablescriptableplayeruse(player);
                continue;
            }
            var_17c3872fea835486 disablescriptableplayeruse(player);
        }
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x24eb
// Size: 0x2e
function private function_7ee64875f9ff9ef8() {
    var_4b1c35b918f9d256 = spawnstruct();
    var_4b1c35b918f9d256.var_6429be92ad7c5324 = [];
    var_4b1c35b918f9d256.var_893ce0289e7fbf39 = [];
    return var_4b1c35b918f9d256;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x2522
// Size: 0x1c3
function private function_2ee23050ad97fd79(var_4b1c35b918f9d256, activityinstance, player, var_b494ea8c4b70490, addsquad) {
    if (!isdefined(var_b494ea8c4b70490)) {
        var_b494ea8c4b70490 = "PlayerJoinedOther";
    }
    if (!isdefined(addsquad)) {
        addsquad = 1;
    }
    var_b4d905018a2cfcc = function_ff013f3a89dabca4(activityinstance.participationconditions, player);
    if (var_b4d905018a2cfcc.var_3cae69b2d0f4ae72) {
        function_feb9f7a42fec48dc(activityinstance, player, var_b494ea8c4b70490);
        var_4b1c35b918f9d256.var_6429be92ad7c5324[var_4b1c35b918f9d256.var_6429be92ad7c5324.size] = player;
        var_4b1c35b918f9d256.var_893ce0289e7fbf39[player.guid] = var_b494ea8c4b70490;
        if (addsquad) {
            activitydefinition = activityinstance function_4188e118731a30f4();
            var_23d6245ff51f1599 = scripts\mp\utility\teams::function_5b7802e04b6d946(player);
            var_63aa2177c0bac532 = function_9edc3a4b955d5a6c(activitydefinition);
            if (var_23d6245ff51f1599 && var_63aa2177c0bac532) {
                squad = scripts\mp\utility\teams::getsquadmates(player.team, player.sessionsquadid, 0);
                foreach (squadmember in squad) {
                    if (player != squadmember && !function_4ab1cdfd84bbd3f2(activityinstance, squadmember)) {
                        function_2ee23050ad97fd79(var_4b1c35b918f9d256, activityinstance, squadmember, "PlayerJoinedSquad", 0);
                    }
                }
            }
        }
        return;
    }
    if (function_2a1e9879f71ab677(@"hash_39bc09a8c55a7875")) {
        activitynexuslog("Player Didn't Meet the Participation Conditions to join the Activity. Failed Condition's Description: " + var_b4d905018a2cfcc.var_4b6d8587438ed9aa, @"hash_39bc09a8c55a7875", activityinstance, [player]);
    }
}

/#

    // Namespace activity_participation / namespace_d886885225a713a7
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x26ed
    // Size: 0x5
    function function_7a1df10c6c92d7b3() {
        
    }

#/

// Namespace activity_participation / namespace_d886885225a713a7
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x26fa
// Size: 0x95
function function_ad54e18b503363a0(activityinstance, playerlist, var_a8839f00f8702b4a, var_c626e727c242968c) {
    var_a8839f00f8702b4a = default_to(var_a8839f00f8702b4a, 1);
    var_c626e727c242968c = default_to(var_c626e727c242968c, 0);
    if (var_c626e727c242968c) {
        foreach (player in playerlist) {
            function_d306509ca7ea3ac3(activityinstance, player);
        }
    }
    function_6d03648148e1a9df(activityinstance, playerlist, var_a8839f00f8702b4a);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2797
// Size: 0xbe
function function_d306509ca7ea3ac3(activityinstance, player, var_a8839f00f8702b4a, var_c6ab7a5fb43f6d11) {
    var_a8839f00f8702b4a = default_to(var_a8839f00f8702b4a, 1);
    var_c626e727c242968c = default_to(var_c626e727c242968c, 0);
    var_da89cda9da7e11 = 0;
    if (!function_7b4d0a8fdbbf4193(player, activityinstance)) {
        function_d5c655d706be5a5a(player, activityinstance);
        activitynexuslog("Activity Abandon Sequence Has Begun For Player", @"hash_39bc09a8c55a7875", activityinstance, [player]);
        var_33c9828bcba3ca00 = activityinstance function_404f9294989f829b(activityinstance, player, var_a8839f00f8702b4a, var_c6ab7a5fb43f6d11);
        function_15b9cdad6fea7395(player, activityinstance);
        if (istrue(var_33c9828bcba3ca00)) {
            var_da89cda9da7e11 = 1;
        }
    }
    if (var_da89cda9da7e11) {
        function_6d03648148e1a9df(activityinstance, [player], var_a8839f00f8702b4a);
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x285d
// Size: 0x52
function function_cfc0a56c1b2b3bd8(activityinstance, player) {
    squadmembers = scripts\mp\utility\teams::getsquadmates(player.team, player.sessionsquadid, 0);
    var_c626e727c242968c = 0;
    function_ad54e18b503363a0(activityinstance, squadmembers, undefined, var_c626e727c242968c);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x28b7
// Size: 0x7f
function function_1c93e1762d4bf23f(activityinstance, player, abandontriggertype, var_c6ab7a5fb43f6d11) {
    activitydefinition = activityinstance function_4188e118731a30f4();
    var_fe04a620eaf5cbe7 = function_b52d9bd121846fd6(activitydefinition, abandontriggertype);
    var_d40ab9c653910a7d = function_1b0550352b65e18d(activitydefinition, abandontriggertype);
    if (istrue(var_d40ab9c653910a7d)) {
        function_ad54e18b503363a0(activityinstance, [player], var_fe04a620eaf5cbe7);
        return;
    }
    function_d306509ca7ea3ac3(activityinstance, player, var_fe04a620eaf5cbe7, var_c6ab7a5fb43f6d11);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x293e
// Size: 0x1bf
function private function_c2a2dfab27307a93(var_bd11f2561cb089ec, var_1acd4938f955faa5) {
    var_5a831f721c6ff88c = function_96f3e17b9bbaa9c1(var_1acd4938f955faa5);
    var_5106f97ec41072cf = function_553a690e1064cf0b(var_bd11f2561cb089ec);
    var_c5a4ebc9255c44a = [];
    var_94ca71165ecc2aa9 = [];
    foreach (instanceid, var_d13c18af4084bdfd in var_5106f97ec41072cf) {
        activityinstance = function_1f3e343912ae15c5(instanceid);
        var_1284782798be0bef = function_511be8bcaede8b52(activityinstance);
        if (function_ed550fddb5f694e1(activityinstance) && function_9edc3a4b955d5a6c(activityinstance)) {
            if (var_5a831f721c6ff88c function_a00a363ab21dc770(var_1284782798be0bef)) {
                var_c5a4ebc9255c44a[var_c5a4ebc9255c44a.size] = activityinstance;
            }
        }
        if (var_5a831f721c6ff88c function_1d2480a5046281fd(var_1284782798be0bef)) {
            if (istrue(var_94ca71165ecc2aa9[var_1284782798be0bef])) {
                var_c5a4ebc9255c44a[var_c5a4ebc9255c44a.size] = activityinstance;
                continue;
            }
            foreach (var_e8aaa9453439dcf0 in var_5a831f721c6ff88c.var_b444db5cbbca40f5[var_1284782798be0bef]) {
                if (function_9edc3a4b955d5a6c(var_e8aaa9453439dcf0)) {
                    var_94ca71165ecc2aa9[var_1284782798be0bef] = 1;
                    var_c5a4ebc9255c44a[var_c5a4ebc9255c44a.size] = activityinstance;
                    break;
                }
            }
        }
    }
    foreach (var_f7eb259b58a5e63f in var_c5a4ebc9255c44a) {
        function_ad54e18b503363a0(var_f7eb259b58a5e63f, [var_bd11f2561cb089ec]);
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2b05
// Size: 0x60
function private function_b80856244372c252(activityinstance, player) {
    var_31b31fcbd1e5961b = function_4ab1cdfd84bbd3f2(activityinstance, player);
    if (var_31b31fcbd1e5961b) {
        var_5bfbbad24429c95f = spawnstruct();
        var_5bfbbad24429c95f function_a1f71337a6844055();
        addcondition(var_5bfbbad24429c95f, &function_bcf8c89ae154798e, [activityinstance]);
        function_1c93e1762d4bf23f(activityinstance, player, 0, var_5bfbbad24429c95f);
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2b6d
// Size: 0x66
function private function_1b23a631e9e54b5e(player, broadcastinstances) {
    function_724d89e705c4c011(player, broadcastinstances);
    if (!isdefined(level.var_b3efbddcabfb0fe0)) {
        level.var_b3efbddcabfb0fe0 = [];
    }
    if (isdefined(level.var_b3efbddcabfb0fe0["create"]) && function_9a5bdd69b1e544f9(player, self)) {
        self [[ level.var_b3efbddcabfb0fe0["create"] ]](player);
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2bdb
// Size: 0x47
function private function_ebe994f7f766c66d(player, var_c032a77c26f812ba) {
    if (isdefined(level.var_b3efbddcabfb0fe0["update"]) && function_9a5bdd69b1e544f9(player, self)) {
        self [[ level.var_b3efbddcabfb0fe0["update"] ]](player, var_c032a77c26f812ba);
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2c2a
// Size: 0x66
function private function_1768d10b1f7b90c0(player, broadcastinstances) {
    function_dc1c1d2f6e9de57d(player, broadcastinstances);
    if (isdefined(level.var_b3efbddcabfb0fe0["cleanup"])) {
        var_6f8af5eb76deac21 = spawnstruct();
        var_6f8af5eb76deac21.playerlist = [player];
        self [[ level.var_b3efbddcabfb0fe0["cleanup"] ]](var_6f8af5eb76deac21);
    }
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x2c98
// Size: 0x138
function private function_404f9294989f829b(activityinstance, player, var_fe04a620eaf5cbe7, var_c6ab7a5fb43f6d11) {
    activityinstance endon("activity_ended");
    activityinstance endon("instance_destroyed");
    broadcastinstances = undefined;
    var_33c9828bcba3ca00 = 0;
    if (var_fe04a620eaf5cbe7) {
        broadcastinstances = activityinstance function_e38f1d6d5a208fe1("PlayerLeaveWarning");
        activityinstance function_1b23a631e9e54b5e(player, broadcastinstances);
    }
    var_3313ce172f38b2b0 = gettime();
    var_997d81b90f85f939 = 5;
    while (true) {
        var_b7d39a4661f3460 = gettime();
        var_c032a77c26f812ba = (var_b7d39a4661f3460 - var_3313ce172f38b2b0) / 1000;
        var_681a6082238c4471 = 0;
        if (isdefined(var_c6ab7a5fb43f6d11) && var_c6ab7a5fb43f6d11 function_cb7d9fafcbb7a3da()) {
            var_681a6082238c4471 = function_93587d5ba6247f36(var_c6ab7a5fb43f6d11, player);
        }
        if (var_681a6082238c4471) {
            break;
        } else if (var_c032a77c26f812ba >= var_997d81b90f85f939) {
            activitynexuslog("Player Abandoned Activity because the countdown sequence timer elapsed.", @"hash_39bc09a8c55a7875", activityinstance, [player]);
            var_33c9828bcba3ca00 = 1;
            break;
        } else if (var_fe04a620eaf5cbe7) {
            activityinstance function_ebe994f7f766c66d(player, var_c032a77c26f812ba);
        }
        waitframe();
    }
    if (var_fe04a620eaf5cbe7) {
        activityinstance function_1768d10b1f7b90c0(player, broadcastinstances);
    }
    return var_33c9828bcba3ca00;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2dd9
// Size: 0x62
function private function_6d03648148e1a9df(activityinstance, playerlist, var_a8839f00f8702b4a) {
    if (var_a8839f00f8702b4a) {
        activityinstance function_1281c7fff9456e18("PlayerAbandonNotification", playerlist);
    }
    function_91c9ad377a3c4725(activityinstance, playerlist);
    var_6f8af5eb76deac21 = spawnstruct();
    var_6f8af5eb76deac21.playerlist = playerlist;
    function_735ee8e9d0f1b00b(activityinstance, "PlayerAbandon", var_6f8af5eb76deac21);
}

/#

    // Namespace activity_participation / namespace_d886885225a713a7
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2e43
    // Size: 0x5
    function function_c81f47cd6a07b50() {
        
    }

#/

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2e50
// Size: 0xdc
function private function_96f3e17b9bbaa9c1(player) {
    var_72548ab2774a3c1b = spawnstruct();
    var_72548ab2774a3c1b.var_b14f12f073231b9 = 1;
    var_72548ab2774a3c1b.var_a594ec6ead1a932c = [];
    var_72548ab2774a3c1b.var_b444db5cbbca40f5 = [];
    var_32a6f9b3d487152d = function_553a690e1064cf0b(player);
    foreach (var_6965880b974574a6, var_d13c18af4084bdfd in var_32a6f9b3d487152d) {
        activityinstance = function_1f3e343912ae15c5(var_6965880b974574a6);
        var_1284782798be0bef = function_511be8bcaede8b52(activityinstance);
        var_72548ab2774a3c1b function_15c9cc306f3b9bfe(activityinstance, var_1284782798be0bef);
        if (function_ed550fddb5f694e1(activityinstance)) {
            var_72548ab2774a3c1b function_96d17931af44322d(activityinstance, var_1284782798be0bef);
        }
    }
    return var_72548ab2774a3c1b;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2f35
// Size: 0x21
function private function_7527493a5c6ca(var_fec478000595694b) {
    return isstruct(var_fec478000595694b) && istrue(var_fec478000595694b.var_b14f12f073231b9);
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2f5f
// Size: 0x7e
function private function_15c9cc306f3b9bfe(activityinstance, var_1284782798be0bef) {
    var_72548ab2774a3c1b = self;
    assertex(function_7527493a5c6ca(var_72548ab2774a3c1b), "<dev string:x4bc>");
    if (!isdefined(var_72548ab2774a3c1b.var_a594ec6ead1a932c[var_1284782798be0bef])) {
        var_72548ab2774a3c1b.var_a594ec6ead1a932c[var_1284782798be0bef] = [];
    }
    var_25ebb1f54b1ad6ca = var_72548ab2774a3c1b.var_a594ec6ead1a932c[var_1284782798be0bef].size;
    var_72548ab2774a3c1b.var_a594ec6ead1a932c[var_1284782798be0bef][var_25ebb1f54b1ad6ca] = activityinstance;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2fe5
// Size: 0x7e
function private function_96d17931af44322d(activityinstance, var_1284782798be0bef) {
    var_72548ab2774a3c1b = self;
    assertex(function_7527493a5c6ca(var_72548ab2774a3c1b), "<dev string:x4bc>");
    if (!isdefined(var_72548ab2774a3c1b.var_b444db5cbbca40f5[var_1284782798be0bef])) {
        var_72548ab2774a3c1b.var_b444db5cbbca40f5[var_1284782798be0bef] = [];
    }
    var_25ebb1f54b1ad6ca = var_72548ab2774a3c1b.var_b444db5cbbca40f5[var_1284782798be0bef].size;
    var_72548ab2774a3c1b.var_b444db5cbbca40f5[var_1284782798be0bef][var_25ebb1f54b1ad6ca] = activityinstance;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x306b
// Size: 0x5b
function private function_1d2480a5046281fd(var_1284782798be0bef) {
    var_72548ab2774a3c1b = self;
    assertex(function_7527493a5c6ca(var_72548ab2774a3c1b), "<dev string:x4bc>");
    if (isdefined(var_72548ab2774a3c1b.var_b444db5cbbca40f5[var_1284782798be0bef])) {
        var_87e006a81263984 = var_72548ab2774a3c1b.var_b444db5cbbca40f5[var_1284782798be0bef].size;
        return (var_87e006a81263984 > 0);
    }
    return false;
}

// Namespace activity_participation / namespace_d886885225a713a7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x30cf
// Size: 0x5b
function private function_a00a363ab21dc770(var_1284782798be0bef) {
    var_72548ab2774a3c1b = self;
    assertex(function_7527493a5c6ca(var_72548ab2774a3c1b), "<dev string:x4bc>");
    if (isdefined(var_72548ab2774a3c1b.var_a594ec6ead1a932c[var_1284782798be0bef])) {
        var_87e006a81263984 = var_72548ab2774a3c1b.var_a594ec6ead1a932c[var_1284782798be0bef].size;
        return (var_87e006a81263984 > 0);
    }
    return false;
}

