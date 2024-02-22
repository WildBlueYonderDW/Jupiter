// mwiii decomp prototype
#using script_38eb8f4be20d54f4;
#using scripts\engine\utility.gsc;
#using script_67fb1233e876ed8;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\engine\scriptable.gsc;
#using script_600b944a95c3a7bf;
#using script_2d9d24f7c63ac143;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;

#namespace namespace_dde877bf562c7c83;

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x3c2
// Size: 0x109
function autoexec init() {
    var_38603dae3d76e1d5 = getdvarint(@"hash_ec05c1bc29a209fc", 0) == 1;
    if (!var_38603dae3d76e1d5) {
        return;
    }
    level.var_6c42f1942be0314 = [0:"brloot_drone_part_a_jup", 1:"brloot_drone_part_b_jup", 2:"brloot_drone_part_c_jup", 3:"brloot_drone_part_d_jup", 4:"brloot_drone_part_e_jup"];
    /#
        iprintln("brloot_drone_part_all_jup");
        function_172af363664b6357();
    #/
    level.var_9d7ea50921b67d31 = getdvarint(@"hash_2f0f26d4707f8853", 0) == 1;
    level.var_654f718e0c7ead7c = getdvarint(@"hash_501cfc58fbef89a2", 0) == 1;
    registersharedfunc("br_puzzle_drone_repair", "setDronePartFound", &setdronepartfound);
    registersharedfunc("br_puzzle_drone_repair", "onDronePartDropped", &ondronepartdropped);
    registersharedfunc("br_puzzle_drone_repair", "devSetupBrokenDrone", &devsetupbrokendrone);
    thread function_28d7437a275a45c7();
    thread function_b52c99c6cf1c18af();
    thread function_d9c64c99bd5f47a0();
    thread watchplayerconnect();
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d2
// Size: 0x4e
function function_28d7437a275a45c7() {
    level endon("game_ended");
    while (!isdefined(level.var_be6fec030b2f8e04)) {
        waitframe();
    }
    namespace_7052decdced06e44::function_4f7660cfd85cd517("drone_parts", &function_e6c1c35181a2870f);
    namespace_7052decdced06e44::function_412f527ef0863f0e("drone_parts", &function_b4b48707a625a324);
    namespace_7052decdced06e44::function_eded5b87f8f7bdfd("drone_parts", &function_ec3e14f05c136a35);
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x527
// Size: 0x25
function function_d9c64c99bd5f47a0() {
    while (!isdefined(game["dialog"])) {
        waitframe();
    }
    game["dialog"]["drone_part_repaired"] = "eaeg_eean_eefo";
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x553
// Size: 0xea
function function_2beebfae871aed04(player) {
    for (i = 0; i < level.var_6c42f1942be0314.size; i++) {
        var_5fb1c8573ccbad9c = player getplayerdata(level.var_5d69837cf4db0407, "dronePartsFound", i);
        player setclientomnvar(level.var_6c42f1942be0314[i], var_5fb1c8573ccbad9c);
    }
    if (function_cba9562cfa638fe8(player)) {
        if (getdvarint(@"hash_c8bcd09200a0d6f2", 1)) {
            if (level.var_654f718e0c7ead7c && !player getplayerdata(level.var_5d69837cf4db0407, "droneLaunched")) {
                if (isdefined(level.var_780fff00a6a68686)) {
                    level.var_780fff00a6a68686 enableplayeruse(player);
                } else {
                    thread function_a7a80e8ba88920c8(player);
                }
                return;
            }
            function_3c73da53109dcc01(player);
        } else {
            player setclientomnvar(level.var_6c42f1942be0314[0], 2);
        }
    }
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x644
// Size: 0x2d
function watchplayerconnect() {
    level endon("game_ended");
    while (1) {
        player = level waittill("connected");
        function_2beebfae871aed04(player);
    }
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x678
// Size: 0x32
function private function_a7a80e8ba88920c8(player) {
    level endon("game_ended");
    player endon("disconnect");
    level waittill("PuzzleDroneSetup");
    level.var_780fff00a6a68686 enableplayeruse(player);
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b1
// Size: 0x7f
function function_172af363664b6357() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_fe953f000498048f();
    #/
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x737
// Size: 0x9d
function function_a20133b287aa61da(item) {
    objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    if (objid != -1) {
        item setscriptablepartstate("debug_icon", "disabled");
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "current", item.origin, "jup_ui_map_icon_generic_marker");
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 1);
        namespace_5a22b6f3a56f7e9b::function_d7e3c4a08682c1b9(objid, 1);
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objid, 75);
        namespace_5a22b6f3a56f7e9b::function_98ba077848896a3(objid, 1);
        item.var_7b5e5c2bbc8f9f79 = objid;
    } else {
        item setscriptablepartstate("debug_icon", "visible");
    }
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7db
// Size: 0x24
function function_e6c1c35181a2870f(var_cab957adc8d7710f) {
    var_25227f181a5bb8c9 = getstructarray(var_cab957adc8d7710f, "targetname");
    return var_25227f181a5bb8c9;
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x807
// Size: 0x42
function function_b4b48707a625a324(var_cab957adc8d7710f, var_460f06fb83940b20) {
    if (!isdefined(level.var_13ed53cdcd563f93)) {
        level.var_13ed53cdcd563f93 = [];
    }
    level.var_13ed53cdcd563f93[level.var_13ed53cdcd563f93.size] = var_460f06fb83940b20;
    return var_460f06fb83940b20;
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x851
// Size: 0xfa
function function_4e6039b32b329a2d(var_460f06fb83940b20, var_28bce9f0afe09981) {
    if (!isdefined(level.var_6c42f1942be0314)) {
        /#
            assertmsg("Drone part names not specified.");
        #/
        return;
    }
    if (!isdefined(var_28bce9f0afe09981) || var_28bce9f0afe09981 >= level.var_6c42f1942be0314.size || var_28bce9f0afe09981 < 0) {
        /#
            assertmsg("Drone Part Name Index Out of Bounds");
        #/
        return;
    }
    var_460f06fb83940b20.var_4041cda36a5951ff = level.var_6c42f1942be0314[var_28bce9f0afe09981];
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, var_460f06fb83940b20.origin + (0, 0, 10), var_460f06fb83940b20.angles);
    item = namespace_cb965d2f71fefddc::spawnpickup(var_460f06fb83940b20.var_4041cda36a5951ff, var_cb4fad49263e20c4);
    item.var_bbc200bc77c5db2b = 1;
    if (level.var_9d7ea50921b67d31) {
        function_a20133b287aa61da(item);
    }
    return item;
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x953
// Size: 0x6f
function function_ec3e14f05c136a35(var_cab957adc8d7710f) {
    level endon("game_ended");
    level waittill("prematch_done");
    waitframe();
    if (!isdefined(level.var_13ed53cdcd563f93) || level.var_13ed53cdcd563f93.size == 0) {
        return;
    }
    for (i = 0; i < level.var_13ed53cdcd563f93.size; i++) {
        function_4e6039b32b329a2d(level.var_13ed53cdcd563f93[i], i);
    }
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c9
// Size: 0x122
function setdronepartfound(pickup, player) {
    scriptablename = pickup.scriptablename;
    if (!isdefined(player.var_fa7a636775e34c25)) {
        player.var_fa7a636775e34c25 = [];
    }
    player.var_fa7a636775e34c25 = array_add(player.var_fa7a636775e34c25, scriptablename);
    if (!function_db0ed0033a34d360(player)) {
        function_17827e7b10d50ae4(player, level.var_5c5b88ce7ae1228e);
    } else {
        function_cdebd3f4fa5a45b3(player, level.var_5c5b88ce7ae1228e);
    }
    if (level.var_9d7ea50921b67d31) {
        if (isdefined(pickup.instance.var_7b5e5c2bbc8f9f79)) {
            objective_delete(pickup.instance.var_7b5e5c2bbc8f9f79);
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(pickup.instance.var_7b5e5c2bbc8f9f79);
            pickup.instance.var_7b5e5c2bbc8f9f79 = undefined;
        } else {
            pickup.instance setscriptablepartstate("debug_icon", "disabled");
        }
    }
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf2
// Size: 0x53
function ondronepartdropped(scriptablename, player) {
    player.var_fa7a636775e34c25 = array_remove(player.var_fa7a636775e34c25, scriptablename);
    if (player.var_fa7a636775e34c25.size == 0) {
        level.var_5c5b88ce7ae1228e disableplayeruse(player);
    }
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4c
// Size: 0x44
function devsetupbrokendrone(origin, angles) {
    var_5c5b88ce7ae1228e = spawnscriptable("brloot_drone_part_all_jup", origin, angles);
    var_5c5b88ce7ae1228e setscriptablepartstate("brloot_drone_part_all_jup", "visible");
    function_f1d36faeb630ecea(var_5c5b88ce7ae1228e);
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb97
// Size: 0xe3
function function_b52c99c6cf1c18af() {
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    var_bfbbca1bb1c06680 = getstruct("drone_broken", "targetname");
    if (!isdefined(var_bfbbca1bb1c06680)) {
        /#
            assertmsg("Broken drone struct not found");
        #/
        return;
    }
    level waittill("prematch_done");
    waitframe();
    var_5c5b88ce7ae1228e = spawnscriptable("brloot_drone_part_all_jup", var_bfbbca1bb1c06680.origin);
    var_5c5b88ce7ae1228e setscriptablepartstate("brloot_drone_part_all_jup", "visible");
    function_f1d36faeb630ecea(var_5c5b88ce7ae1228e);
    if (level.var_654f718e0c7ead7c) {
        level.var_780fff00a6a68686 = function_3d94d1b826172df3();
    }
    if (level.var_9d7ea50921b67d31) {
        function_a20133b287aa61da(var_5c5b88ce7ae1228e);
    }
    if (isdefined(var_5c5b88ce7ae1228e.var_7b5e5c2bbc8f9f79)) {
        namespace_5a22b6f3a56f7e9b::function_846c2acd91309cd8(var_5c5b88ce7ae1228e.var_7b5e5c2bbc8f9f79, 255, 60, 60);
    }
    level notify("PuzzleDroneSetup");
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc81
// Size: 0x7d
function function_f1d36faeb630ecea(var_5c5b88ce7ae1228e) {
    foreach (player in level.players) {
        function_17827e7b10d50ae4(player, var_5c5b88ce7ae1228e);
    }
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("brloot_drone_part_all_jup", &function_10a0469fe6e9e108);
    level.var_5c5b88ce7ae1228e = var_5c5b88ce7ae1228e;
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd05
// Size: 0x1da
function function_10a0469fe6e9e108(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(player.var_fa7a636775e34c25)) {
        /#
            assertmsg("Player does not have any drone parts");
        #/
        return;
    }
    var_597e70d33409a0a0 = [];
    foreach (part in player.var_fa7a636775e34c25) {
        if (!function_6ad995b1a14a7e86(player, part)) {
            lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(part);
            player namespace_aead94004cf4c147::function_6f39f9916649ac48(lootid, 1);
            var_597e70d33409a0a0 = array_add(var_597e70d33409a0a0, function_75636dddd4fde65(part));
        }
    }
    foreach (index in var_597e70d33409a0a0) {
        player setclientomnvar(level.var_6c42f1942be0314[index], 1);
        player setplayerdata(level.var_5d69837cf4db0407, "dronePartsFound", index, 1);
        player.var_fa7a636775e34c25 = function_57091b2d67654a14(player.var_fa7a636775e34c25, level.var_6c42f1942be0314[index]);
    }
    function_17827e7b10d50ae4(player, instance);
    if (function_cba9562cfa638fe8(player)) {
        if (level.var_654f718e0c7ead7c) {
            level.var_780fff00a6a68686 enableplayeruse(player);
        } else {
            function_dc3b820c1b231a6c(player);
        }
    } else {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("drone_part_repaired", player, 1, undefined, 0, undefined, "dx_br_jpbm_");
    }
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xee6
// Size: 0xc0
function private function_dc3b820c1b231a6c(player) {
    streakinfo = namespace_9abe40d2af041eb2::createstreakinfo("radar_drone_recon", player);
    streakinfo.mpstreaksysteminfo = namespace_58a74e7d54b56e8d::createstreakitemstruct(streakinfo.streakname);
    player namespace_58a74e7d54b56e8d::streakglobals_onkillstreaktriggered(streakinfo);
    player namespace_58a74e7d54b56e8d::streakglobals_onkillstreakbeginuse(streakinfo);
    function_9a8d68db097f6be8(player, level.var_5c5b88ce7ae1228e.origin, level.var_5c5b88ce7ae1228e.angles, "radar_drone_recon", streakinfo);
    player setclientomnvar(level.var_6c42f1942be0314[0], 2);
    player setplayerdata(level.var_5d69837cf4db0407, "droneLaunched", 1);
    namespace_aad14af462a74d08::function_8359cadd253f9604(player, "BR_EASTEREGG_DRONEASSEMBLE", 1);
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfad
// Size: 0xe7
function function_9a8d68db097f6be8(player, startpos, startang, helperdronetype, streakinfo) {
    var_88f8fa29a514c25d = player namespace_bba8bc8532aa4913::createhelperdrone(startpos, startang, helperdronetype, streakinfo, 0, 1);
    var_88f8fa29a514c25d thread namespace_bba8bc8532aa4913::helperdrone_overwatchplayer();
    thread function_3c03c4c1859f38e1(player, var_88f8fa29a514c25d);
    thread watchplayerdeath(player, var_88f8fa29a514c25d);
    if (level.var_9d7ea50921b67d31) {
        if (isdefined(level.var_5c5b88ce7ae1228e.var_7b5e5c2bbc8f9f79)) {
            objective_delete(level.var_5c5b88ce7ae1228e.var_7b5e5c2bbc8f9f79);
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(level.var_5c5b88ce7ae1228e.var_7b5e5c2bbc8f9f79);
            level.var_5c5b88ce7ae1228e.var_7b5e5c2bbc8f9f79 = undefined;
        } else {
            level.var_5c5b88ce7ae1228e setscriptablepartstate("debug_icon", "disabled");
        }
    }
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109b
// Size: 0x106
function function_3c03c4c1859f38e1(player, var_5c5b88ce7ae1228e) {
    var_5c5b88ce7ae1228e endon("death");
    var_5c5b88ce7ae1228e endon("explode");
    var_5c5b88ce7ae1228e endon("owner_gone");
    player endon("disconnect");
    player endon("death");
    uavtype = "uav";
    duration = 48;
    streakinfo = namespace_9abe40d2af041eb2::createstreakinfo(uavtype, player);
    streakinfo.skipequippedstreakcheck = 1;
    var_fa233ce83d249e21 = 5000;
    var_ec00e2b85c91da0c = 3;
    var_6c3716013ea4f716 = 6;
    team = player.pers["team"];
    function_78033a976b978c7(player, team, streakinfo);
    timepassed = 0;
    while (1) {
        if (!isdefined(team)) {
            break;
        }
        triggerportableradarpingteam(var_5c5b88ce7ae1228e.origin, team, var_fa233ce83d249e21, var_ec00e2b85c91da0c * 1000);
        wait(var_6c3716013ea4f716);
        timepassed = timepassed + var_6c3716013ea4f716;
    }
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a8
// Size: 0x4a
function watchplayerdeath(player, var_5c5b88ce7ae1228e) {
    var_5c5b88ce7ae1228e endon("death");
    var_5c5b88ce7ae1228e endon("explode");
    var_5c5b88ce7ae1228e endon("owner_gone");
    player waittill_2("death", "disconnect");
    var_5c5b88ce7ae1228e thread namespace_bba8bc8532aa4913::function_6edfda4764129e3(0, 1, 0, 1);
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f9
// Size: 0x5f
function function_78033a976b978c7(player, team, streakinfo) {
    var_274a2749ef16ee1f = streakinfo.streakname;
    var_52a5be2e2f91d710 = undefined;
    player thread namespace_9abe40d2af041eb2::playkillstreakoperatordialog(var_274a2749ef16ee1f, var_274a2749ef16ee1f + "_use", 1, var_52a5be2e2f91d710);
    namespace_9abe40d2af041eb2::killstreak_dangernotifyplayersinrange(player, team, 5000, var_274a2749ef16ee1f);
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x125f
// Size: 0x21
function private function_17827e7b10d50ae4(player, var_5c5b88ce7ae1228e) {
    var_5c5b88ce7ae1228e disablescriptablepartplayeruse("brloot_drone_part_all_jup", player);
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1287
// Size: 0x21
function private function_cdebd3f4fa5a45b3(player, var_5c5b88ce7ae1228e) {
    var_5c5b88ce7ae1228e enablescriptablepartplayeruse("brloot_drone_part_all_jup", player);
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12af
// Size: 0x1c
function private function_75636dddd4fde65(scriptablename) {
    return array_find(level.var_6c42f1942be0314, scriptablename);
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12d3
// Size: 0x30
function private function_6ad995b1a14a7e86(player, scriptablename) {
    var_5c9ddcf56d36f133 = player getclientomnvar(scriptablename);
    if (var_5c9ddcf56d36f133 > 0) {
        return 1;
    }
    return 0;
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x130b
// Size: 0x6a
function private function_db0ed0033a34d360(player) {
    foreach (part in player.var_fa7a636775e34c25) {
        if (!function_6ad995b1a14a7e86(player, part)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x137d
// Size: 0x68
function private function_cba9562cfa638fe8(player) {
    foreach (partname in level.var_6c42f1942be0314) {
        if (!function_6ad995b1a14a7e86(player, partname)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13ed
// Size: 0x6d
function private function_3c73da53109dcc01(player) {
    for (i = 0; i < level.var_6c42f1942be0314.size; i++) {
        player setclientomnvar(level.var_6c42f1942be0314[i], 0);
        player setplayerdata(level.var_5d69837cf4db0407, "dronePartsFound", i, 0);
    }
    player setplayerdata(level.var_5d69837cf4db0407, "droneLaunched", 0);
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1461
// Size: 0x6d
function private function_3d94d1b826172df3() {
    useobj = spawn("script_origin", level.var_5c5b88ce7ae1228e.origin);
    useobj makeusable();
    useobj sethintstring("MP/BR_DRONE_PART_ALL_USE");
    useobj setcursorhint("HINT_NOICON");
    useobj sethintrequiresholding(1);
    useobj setuseholdduration(150);
    useobj disableplayeruseforallplayers();
    thread function_256b0962e90123dd(useobj);
    return useobj;
}

// Namespace namespace_dde877bf562c7c83/namespace_5aac65b2f8ef206e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14d6
// Size: 0x3f
function private function_256b0962e90123dd(ent) {
    level endon("game_ended");
    while (1) {
        player = ent waittill("trigger");
        ent disableplayeruse(player);
        player function_dc3b820c1b231a6c(player);
    }
}

