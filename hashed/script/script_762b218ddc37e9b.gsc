// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_57614a088fb41089;
#using scripts\mp\flags.gsc;
#using script_3ce0495c8649ee91;
#using script_3fddda92c991755e;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\hud_message.gsc;

#namespace namespace_f9abaed971c570f0;

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9f
// Size: 0x11
function init() {
    waittillframeend();
    namespace_4b0406965e556711::gameflaginit("ui_objectives_setup", 0);
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb7
// Size: 0x1e8
function function_56e0031a424d8009(var_ee13e110c0910a51) {
    player = self;
    var_c1a5752672c6c05e = undefined;
    var_eed4d285ffd8460f = 0;
    var_3de49dbd37f0d2d5 = 0;
    var_89888e2560659a3 = 0;
    if (isdefined(var_ee13e110c0910a51)) {
        if (var_ee13e110c0910a51.size == 1) {
            var_b40cc245aef22ba8 = var_ee13e110c0910a51[0].objectivekey;
            switch (var_b40cc245aef22ba8) {
            case #"hash_fac2c5f6bddd49bd":
                var_c1a5752672c6c05e = 0;
                break;
            case #"hash_fac2c2f6bddd4504":
                var_c1a5752672c6c05e = 1;
                break;
            case #"hash_fac2c3f6bddd4697":
                var_c1a5752672c6c05e = 2;
                break;
            }
            var_eed4d285ffd8460f = 1;
        } else if (var_ee13e110c0910a51.size > 1) {
            var_89888e2560659a3 = 1;
            var_3de49dbd37f0d2d5 = var_ee13e110c0910a51.size;
        }
    }
    var_fd3f3786e1ff0478 = namespace_87e7f6fcf1544253::function_fb82e12375af065f();
    if (is_equal(player.pers["team"], game["attackers"])) {
        uid = function_751ff808e0219b4f("WAR_CAPTURE_UID");
        var_a7c99b4e402f44ff = "WAR_CAPTURE";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
        if (isdefined(var_c1a5752672c6c05e)) {
            function_8733c2caee45c023(player, uid, var_c1a5752672c6c05e);
        }
        function_c1edc8a24a424e72(player, uid, var_eed4d285ffd8460f);
        if (var_89888e2560659a3) {
            function_cae7c80607a403a7(player, uid, var_3de49dbd37f0d2d5, var_fd3f3786e1ff0478);
        }
    } else if (is_equal(player.pers["team"], game["defenders"])) {
        uid = function_751ff808e0219b4f("WAR_DEFEND_UID");
        var_a7c99b4e402f44ff = "WAR_DEFEND";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
        if (isdefined(var_c1a5752672c6c05e)) {
            function_8733c2caee45c023(player, uid, var_c1a5752672c6c05e);
        }
        function_c1edc8a24a424e72(player, uid, var_eed4d285ffd8460f);
        if (var_89888e2560659a3) {
            function_cae7c80607a403a7(player, uid, var_3de49dbd37f0d2d5, var_fd3f3786e1ff0478);
        }
    }
    if (var_eed4d285ffd8460f) {
        player thread function_8f9f8e317d100761();
    }
    if (var_89888e2560659a3) {
        player thread function_98625aa96f4af3f4();
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea6
// Size: 0x11d
function function_8f9f8e317d100761() {
    level endon("game_ended");
    level endon("end_zone_objective");
    while (1) {
        if (!isdefined(self) || !isalive(self)) {
            break;
        }
        if (isdefined(level.zone.var_ee13e110c0910a51)) {
            if (level.zone.var_ee13e110c0910a51.size > 1) {
                break;
            }
            zone = level.zone.var_ee13e110c0910a51[0];
            progress = zone.curprogress / zone.usetime;
            state = undefined;
            if (zone.stalemate) {
                state = 1;
            } else if (is_equal(self.pers["team"], game["attackers"])) {
                state = 2;
            } else if (is_equal(self.pers["team"], game["defenders"])) {
                state = 3;
            } else {
                state = 0;
            }
            function_b41a05f6198e9a29(self, progress, state);
        }
        waitframe();
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfca
// Size: 0x46
function function_98625aa96f4af3f4() {
    level endon("game_ended");
    level endon("end_zone_objective");
    self endon("disconnect");
    var_fd3f3786e1ff0478 = namespace_87e7f6fcf1544253::function_fb82e12375af065f();
    while (var_fd3f3786e1ff0478 > 0) {
        level waittill("wm_zone_captured");
        var_fd3f3786e1ff0478--;
        function_92b2c173041b8fb6(self, var_fd3f3786e1ff0478);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1017
// Size: 0x194
function function_bd670364611e5003(objectives) {
    player = self;
    if (isdefined(objectives)) {
        if (!isdefined(level.var_d7365b1fc402bfb6)) {
            level.var_d7365b1fc402bfb6 = spawnstruct();
        }
        if (!isdefined(level.var_d7365b1fc402bfb6.var_39c187ac5aa7d2c7)) {
            level.var_d7365b1fc402bfb6.var_39c187ac5aa7d2c7 = objectives.size;
        }
        if (!isdefined(level.var_d7365b1fc402bfb6.var_cd818fd3dc756da9)) {
            level.var_d7365b1fc402bfb6.var_cd818fd3dc756da9 = level.var_d7365b1fc402bfb6.var_39c187ac5aa7d2c7;
        }
    }
    if (is_equal(player.pers["team"], game["attackers"])) {
        uid = function_751ff808e0219b4f("WAR_BOMB_DEFUSE_UID");
        var_a7c99b4e402f44ff = "WAR_BOMB_DEFUSE";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
        function_cae7c80607a403a7(player, uid, level.var_d7365b1fc402bfb6.var_39c187ac5aa7d2c7, level.var_d7365b1fc402bfb6.var_cd818fd3dc756da9);
    } else if (is_equal(player.pers["team"], game["defenders"])) {
        uid = function_751ff808e0219b4f("WAR_BOMB_DEFEND_UID");
        var_a7c99b4e402f44ff = "WAR_BOMB_DEFEND";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
        function_cae7c80607a403a7(player, uid, level.var_d7365b1fc402bfb6.var_39c187ac5aa7d2c7, level.var_d7365b1fc402bfb6.var_cd818fd3dc756da9);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b2
// Size: 0xce
function function_ace0b0228cd34c4b() {
    if (level.zone.objectivetype == 2 && isdefined(level.var_d7365b1fc402bfb6)) {
        var_4f0f66f6a09facd7 = level.var_d7365b1fc402bfb6.var_cd818fd3dc756da9;
        if (isdefined(var_4f0f66f6a09facd7) && var_4f0f66f6a09facd7 > 0) {
            remaining = var_4f0f66f6a09facd7 - 1;
            level.var_d7365b1fc402bfb6.var_cd818fd3dc756da9 = remaining;
            foreach (player in level.players) {
                function_92b2c173041b8fb6(player, remaining);
            }
        }
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1287
// Size: 0xa2
function function_a79d4af0fcd2254() {
    player = self;
    if (is_equal(player.pers["team"], game["attackers"])) {
        uid = function_751ff808e0219b4f("WAR_HOSTAGE_RESCUE_UID");
        var_a7c99b4e402f44ff = "WAR_HOSTAGE_RESCUE";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
    } else if (is_equal(player.pers["team"], game["defenders"])) {
        uid = function_751ff808e0219b4f("WAR_HOSTAGE_DEFEND_UID");
        var_a7c99b4e402f44ff = "WAR_HOSTAGE_DEFEND";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1330
// Size: 0xa2
function function_31c1ef0e3da10143() {
    player = self;
    if (is_equal(player.pers["team"], game["attackers"])) {
        uid = function_751ff808e0219b4f("WAR_DESTROY_PLANT_ATTACKERS_UID");
        var_a7c99b4e402f44ff = "WAR_DESTROY_PLANT_ATTACKERS";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
    } else if (is_equal(player.pers["team"], game["defenders"])) {
        uid = function_751ff808e0219b4f("WAR_DESTROY_PLANT_DEFENDERS_UID");
        var_a7c99b4e402f44ff = "WAR_DESTROY_PLANT_DEFENDERS";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d9
// Size: 0x1b3
function function_9fcbcb3aa626b914() {
    player = self;
    while (!isdefined(level.var_e718773786ad42e8[0])) {
        waitframe();
    }
    setomnvar("ui_wm_escort_objective_id", level.var_e718773786ad42e8[0].marker.objidnum);
    foreach (vehicle in level.var_e718773786ad42e8) {
        if (isdefined(vehicle.checkpoints)) {
            foreach (i, checkpoint in vehicle.checkpoints) {
                if (istrue(checkpoint.visible)) {
                    setomnvar("ui_wm_escort_checkpoint_" + i, checkpoint.progress);
                }
            }
        }
    }
    if (is_equal(player.pers["team"], game["attackers"])) {
        uid = function_751ff808e0219b4f("WAR_TANK_ESCORT_ATTACKERS_UID");
        var_a7c99b4e402f44ff = "WAR_TANK_ESCORT_ATTACKERS";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
    } else if (is_equal(player.pers["team"], game["defenders"])) {
        uid = function_751ff808e0219b4f("WAR_TANK_ESCORT_DEFENDERS_UID");
        var_a7c99b4e402f44ff = "WAR_TANK_ESCORT_DEFENDERS";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1593
// Size: 0xa2
function function_3de47cff2123e1d() {
    player = self;
    if (is_equal(player.pers["team"], game["attackers"])) {
        uid = function_751ff808e0219b4f("WAR_AI_BOSS_ATTACKERS_UID");
        var_a7c99b4e402f44ff = "WAR_AI_BOSS_ATTACKERS";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
    } else if (is_equal(player.pers["team"], game["defenders"])) {
        uid = function_751ff808e0219b4f("WAR_AI_BOSS_DEFENDERS_UID");
        var_a7c99b4e402f44ff = "WAR_AI_BOSS_DEFENDERS";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163c
// Size: 0xa2
function function_55c691baef314f84() {
    player = self;
    if (is_equal(player.pers["team"], game["attackers"])) {
        uid = function_751ff808e0219b4f("WAR_AI_BOSS_ZONE_ATTACKERS_UID");
        var_a7c99b4e402f44ff = "WAR_AI_BOSS_ZONE_ATTACKERS";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
    } else if (is_equal(player.pers["team"], game["defenders"])) {
        uid = function_751ff808e0219b4f("WAR_AI_BOSS_ZONE_DEFENDERS_UID");
        var_a7c99b4e402f44ff = "WAR_AI_BOSS_ZONE_DEFENDERS";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e5
// Size: 0x129
function function_db1805fcbcb64e80() {
    player = self;
    var_84a5d2e85af8ee18 = level.zone.var_54a90fd3dd9a59b3;
    if (isdefined(var_84a5d2e85af8ee18) && var_84a5d2e85af8ee18.size > 1) {
        var_89888e2560659a3 = 1;
        var_3de49dbd37f0d2d5 = var_84a5d2e85af8ee18.size;
    }
    var_fd3f3786e1ff0478 = namespace_87e7f6fcf1544253::function_fb82e12375af065f();
    if (is_equal(player.pers["team"], game["attackers"])) {
        uid = function_751ff808e0219b4f("WAR_HACK_ATTACK_UID");
        var_a7c99b4e402f44ff = "WAR_HACK_ATTACK";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
        if (var_89888e2560659a3) {
            function_cae7c80607a403a7(player, uid, var_3de49dbd37f0d2d5, var_fd3f3786e1ff0478);
        }
    } else if (is_equal(player.pers["team"], game["defenders"])) {
        uid = function_751ff808e0219b4f("WAR_HACK_DEFEND_UID");
        var_a7c99b4e402f44ff = "WAR_HACK_DEFEND";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
        if (var_89888e2560659a3) {
            function_cae7c80607a403a7(player, uid, var_3de49dbd37f0d2d5, var_fd3f3786e1ff0478);
        }
    }
    if (var_89888e2560659a3) {
        player thread function_375e9b4b38c52544();
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1815
// Size: 0x46
function function_375e9b4b38c52544() {
    level endon("game_ended");
    level endon("end_hack_zone_objective");
    self endon("disconnect");
    var_fd3f3786e1ff0478 = namespace_87e7f6fcf1544253::function_fb82e12375af065f();
    while (var_fd3f3786e1ff0478 > 0) {
        level waittill("obj_hack_zone_uploaded");
        var_fd3f3786e1ff0478--;
        function_92b2c173041b8fb6(self, var_fd3f3786e1ff0478);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1862
// Size: 0x176
function function_84b6083a11611721() {
    player = self;
    var_3de49dbd37f0d2d5 = 0;
    var_84a5d2e85af8ee18 = level.zone.var_54a90fd3dd9a59b3;
    if (isdefined(var_84a5d2e85af8ee18) && var_84a5d2e85af8ee18.size > 1) {
        var_3de49dbd37f0d2d5 = var_84a5d2e85af8ee18.size;
    }
    var_edf6ad250b4f68b5 = namespace_87e7f6fcf1544253::function_d277ca7e1acc3003();
    var_fd3f3786e1ff0478 = namespace_87e7f6fcf1544253::function_77dccebe95510a4f();
    var_2fa5191727f3bfe4 = function_7f3a51d588ffeb11();
    var_77dddfe21ff9e256 = function_e53cbc2fb3dfe2bf();
    index = -1;
    if (is_equal(player.pers["team"], game["attackers"])) {
        index = 0;
    } else if (is_equal(player.pers["team"], game["defenders"])) {
        index = 1;
    }
    uid = var_77dddfe21ff9e256[index];
    var_a7c99b4e402f44ff = var_2fa5191727f3bfe4[index];
    if (isdefined(var_edf6ad250b4f68b5) && var_edf6ad250b4f68b5 == "hack") {
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
        function_cae7c80607a403a7(player, uid, var_3de49dbd37f0d2d5, var_fd3f3786e1ff0478);
        player thread function_62f6b2de158a6952();
        player thread function_20ecdab10ad77b65();
    } else {
        setomnvar("ui_wm_objective_phase_" + level.zone.index, 1);
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff, 1);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19df
// Size: 0x45
function function_20ecdab10ad77b65() {
    level endon("game_ended");
    self endon("disconnect");
    level waittill("hack_zone_upload_full_complete");
    function_be0ddc8cccc0f4a4(is_equal(self.pers["team"], game["attackers"]));
    waitframe();
    thread function_84b6083a11611721();
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a2b
// Size: 0x46
function function_62f6b2de158a6952() {
    level endon("game_ended");
    level endon("hack_zone_upload_full_complete");
    self endon("disconnect");
    var_fd3f3786e1ff0478 = namespace_87e7f6fcf1544253::function_77dccebe95510a4f();
    while (var_fd3f3786e1ff0478 > 0) {
        level waittill("obj_hack_zone_uploaded");
        var_fd3f3786e1ff0478--;
        function_92b2c173041b8fb6(self, var_fd3f3786e1ff0478);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a78
// Size: 0x4b
function function_7f3a51d588ffeb11() {
    var_edf6ad250b4f68b5 = namespace_87e7f6fcf1544253::function_d277ca7e1acc3003();
    if (isdefined(var_edf6ad250b4f68b5) && var_edf6ad250b4f68b5 == "hack") {
        return [0:"WAR_HACK_BOMB_ATTACK_PHASE_1", 1:"WAR_HACK_BOMB_DEFEND_PHASE_1"];
    }
    return [0:"WAR_HACK_BOMB_ATTACK_PHASE_2", 1:"WAR_HACK_BOMB_DEFEND_PHASE_2"];
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1acb
// Size: 0x4b
function function_e53cbc2fb3dfe2bf() {
    var_edf6ad250b4f68b5 = namespace_87e7f6fcf1544253::function_d277ca7e1acc3003();
    if (isdefined(var_edf6ad250b4f68b5) && var_edf6ad250b4f68b5 == "hack") {
        return [0:"WAR_HACK_BOMB_ATTACK_PHASE_1_UID", 1:"WAR_HACK_BOMB_DEFEND_PHASE_1_UID"];
    }
    return [0:"WAR_HACK_BOMB_ATTACK_PHASE_2_UID", 1:"WAR_HACK_BOMB_DEFEND_PHASE_2_UID"];
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1e
// Size: 0x1b3
function function_400f3f1de2faf5e1() {
    player = self;
    while (!isdefined(level.var_e718773786ad42e8[0])) {
        waitframe();
    }
    setomnvar("ui_wm_escort_objective_id", level.var_e718773786ad42e8[0].marker.objidnum);
    foreach (vehicle in level.var_e718773786ad42e8) {
        if (isdefined(vehicle.checkpoints)) {
            foreach (i, checkpoint in vehicle.checkpoints) {
                if (istrue(checkpoint.visible)) {
                    setomnvar("ui_wm_escort_checkpoint_" + i, checkpoint.progress);
                }
            }
        }
    }
    if (is_equal(player.pers["team"], game["attackers"])) {
        uid = function_751ff808e0219b4f("WAR_ESCORT_WHEELSON_ATTACK_UID");
        var_a7c99b4e402f44ff = "WAR_ESCORT_WHEELSON_ATTACK";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
    } else if (is_equal(player.pers["team"], game["defenders"])) {
        uid = function_751ff808e0219b4f("WAR_ESCORT_WHEELSON_DEFEND_UID");
        var_a7c99b4e402f44ff = "WAR_ESCORT_WHEELSON_DEFEND";
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd8
// Size: 0x141
function function_1fcd300591a7cf98() {
    player = self;
    var_edf6ad250b4f68b5 = namespace_87e7f6fcf1544253::function_d277ca7e1acc3003();
    totalflags = level.requiredflag;
    var_585990e6fdb983a8 = namespace_16a6643951556450::function_ce0967f06e5921a4();
    var_2fa5191727f3bfe4 = function_fcc3c58a459eb914();
    var_77dddfe21ff9e256 = function_d6e9255e29b5fd5c();
    index = -1;
    if (is_equal(player.pers["team"], game["attackers"])) {
        index = 0;
    } else if (is_equal(player.pers["team"], game["defenders"])) {
        index = 1;
    }
    uid = var_77dddfe21ff9e256[index];
    var_a7c99b4e402f44ff = var_2fa5191727f3bfe4[index];
    if (isdefined(var_edf6ad250b4f68b5) && var_edf6ad250b4f68b5 == "capture_flag") {
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff);
        function_cae7c80607a403a7(player, uid, totalflags, var_585990e6fdb983a8);
        player thread function_ff17535db12ae897();
    } else {
        setomnvar("ui_wm_objective_phase_" + level.zone.index, 1);
        player function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff, 1);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e20
// Size: 0x4b
function function_fcc3c58a459eb914() {
    var_edf6ad250b4f68b5 = namespace_87e7f6fcf1544253::function_d277ca7e1acc3003();
    if (isdefined(var_edf6ad250b4f68b5) && var_edf6ad250b4f68b5 == "capture_flag") {
        return [0:"WAR_CAPTURE_FLAG_ATTACK_PHASE_1", 1:"WAR_CAPTURE_FLAG_DEFEND_PHASE_1"];
    }
    return [0:"WAR_CAPTURE_FLAG_ATTACK_PHASE_2", 1:"WAR_CAPTURE_FLAG_DEFEND_PHASE_2"];
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e73
// Size: 0x4b
function function_d6e9255e29b5fd5c() {
    var_edf6ad250b4f68b5 = namespace_87e7f6fcf1544253::function_d277ca7e1acc3003();
    if (isdefined(var_edf6ad250b4f68b5) && var_edf6ad250b4f68b5 == "capture_flag") {
        return [0:"WAR_CAPTURE_FLAG_ATTACK_PHASE_1_UID", 1:"WAR_CAPTURE_FLAG_DEFEND_PHASE_1_UID"];
    }
    return [0:"WAR_CAPTURE_FLAG_ATTACK_PHASE_2_UID", 1:"WAR_CAPTURE_FLAG_DEFEND_PHASE_2_UID"];
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec6
// Size: 0x6b
function function_ff17535db12ae897() {
    level endon("game_ended");
    self endon("disconnect");
    var_585990e6fdb983a8 = namespace_16a6643951556450::function_ce0967f06e5921a4();
    while (var_585990e6fdb983a8 > 0) {
        level waittill("flag_placed");
        var_585990e6fdb983a8--;
        function_92b2c173041b8fb6(self, var_585990e6fdb983a8);
    }
    function_be0ddc8cccc0f4a4(is_equal(self.pers["team"], game["attackers"]));
    waitframe();
    thread function_1fcd300591a7cf98();
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f38
// Size: 0xee
function function_f56dd59bba71b655(var_5a9850a3cc230985) {
    omnvar = "ui_wm_objective_state_" + level.zone.index;
    if (var_5a9850a3cc230985) {
        setomnvar(omnvar, 2);
    } else {
        setomnvar(omnvar, 3);
    }
    foreach (player in level.players) {
        if (is_equal(player.pers["team"], game["attackers"])) {
            player function_4ca6dc38a2cb2639(var_5a9850a3cc230985);
        } else if (is_equal(player.pers["team"], game["defenders"])) {
            player function_4ca6dc38a2cb2639(!var_5a9850a3cc230985);
        }
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x202d
// Size: 0x1c8
function function_d2ac05c6539c221e(objectivetype) {
    player = self;
    setomnvar("ui_wm_objective_state_" + level.zone.index, 1);
    setomnvar("ui_wm_objective_phase_" + level.zone.index, 0);
    if (isdefined(level.zone.objectivetype)) {
        switch (level.zone.objectivetype) {
        case 1:
            player thread function_56e0031a424d8009(level.zone.var_ee13e110c0910a51);
            break;
        case 2:
            player thread function_bd670364611e5003(level.zone.objectives);
            break;
        case 3:
            player thread function_a79d4af0fcd2254();
            break;
        case 5:
            player thread function_31c1ef0e3da10143();
            break;
        case 6:
            player thread function_9fcbcb3aa626b914();
            break;
        case 11:
            player thread function_400f3f1de2faf5e1();
            break;
        case 7:
            player thread function_3de47cff2123e1d();
            break;
        case 8:
            player thread function_55c691baef314f84();
            break;
        case 9:
            player thread function_db1805fcbcb64e80();
            break;
        case 10:
            player thread function_84b6083a11611721();
            break;
        case 12:
            player thread function_1fcd300591a7cf98();
            break;
        default:
            break;
        }
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21fc
// Size: 0x40
function function_cae7c80607a403a7(player, uid, total, remaining) {
    function_15010f27afb2d1e7(player);
    function_41e69df7eeb5c17b(player, uid, total);
    function_a92e843c02dc6414(player, uid, remaining);
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2243
// Size: 0x67
function function_92b2c173041b8fb6(player, remaining) {
    if (isdefined(player.var_f2b3eb0f3505f5af) && isdefined(player.var_f2b3eb0f3505f5af.var_301e67ae9379349e)) {
        uid = player.var_f2b3eb0f3505f5af.var_301e67ae9379349e;
        function_a92e843c02dc6414(player, uid, remaining);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22b1
// Size: 0x79
function function_b41a05f6198e9a29(player, progress, state) {
    if (isdefined(player.var_f2b3eb0f3505f5af) && isdefined(player.var_f2b3eb0f3505f5af.var_301e67ae9379349e)) {
        uid = player.var_f2b3eb0f3505f5af.var_301e67ae9379349e;
        function_3e38fac7ccd01903(player, uid, progress);
        function_c718b293158313c9(player, uid, state);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2331
// Size: 0x6f
function function_23db8dc38b007d5e() {
    timeremaining = int(namespace_d576b6dc7cef9c62::gettimeremaining());
    foreach (player in level.players) {
        function_5e299d656e336919(player, timeremaining);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23a7
// Size: 0x67
function function_5e299d656e336919(player, timeremaining) {
    if (isdefined(player.var_f2b3eb0f3505f5af) && isdefined(player.var_f2b3eb0f3505f5af.var_301e67ae9379349e)) {
        uid = player.var_f2b3eb0f3505f5af.var_301e67ae9379349e;
        function_5d2c66d2ea6e4267(player, uid, timeremaining);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2415
// Size: 0x7c
function function_557efb699f50447b(var_bf7b563b13ab1125, isfallback) {
    if (!isdefined(var_bf7b563b13ab1125) || var_bf7b563b13ab1125 <= 0) {
        namespace_9c840bb9f2ecbf00::demoforcesre("ooBTimeLimit: " + var_bf7b563b13ab1125 + " must be defined and greater than 0");
        return;
    }
    player = self;
    var_4a3cc04781d25c6f = 1;
    if (isdefined(isfallback)) {
        var_4a3cc04781d25c6f = 4;
    }
    player setclientomnvar("ui_out_of_bounds_type", var_4a3cc04781d25c6f);
    player setclientomnvar("ui_out_of_bounds_countdown", gettime() + var_bf7b563b13ab1125 * 1000);
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2498
// Size: 0x58
function function_353ca278babb871e(player) {
    var_77a7be006731f124 = "scripted_widget_objective_tracker_jup_wm";
    if (isdefined(level.var_77a7be006731f124)) {
        var_77a7be006731f124 = level.var_77a7be006731f124;
    }
    player_init(player, "ObjectiveTracker_WarMode", var_77a7be006731f124, 26, 265);
    player function_d2ac05c6539c221e();
    player thread function_524eac445bf29eab();
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24f7
// Size: 0xa5
function function_25bcacb7fb00fc47(uid, var_a7c99b4e402f44ff, var_4f1c7c8ad5d5b9e4) {
    completed = 0;
    var_185416cb8a76fb63 = isdefined(self.var_f2b3eb0f3505f5af) && isdefined(self.var_f2b3eb0f3505f5af.objectives[uid]);
    if (isdefined(self.var_f2b3eb0f3505f5af)) {
        namespace_4b0406965e556711::gameflagset("ui_objectives_setup");
        if (!istrue(var_185416cb8a76fb63)) {
            add_objective(uid, undefined, undefined, var_a7c99b4e402f44ff, completed, var_4f1c7c8ad5d5b9e4);
        }
    } else {
        level.var_c98b5921be7579fd = uid;
        level.var_1837cfa1aeb8ff0b = var_a7c99b4e402f44ff;
        namespace_4b0406965e556711::gameflagclear("ui_objectives_setup");
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25a3
// Size: 0x75
function function_5010e8025865011e(uid, is_successful) {
    var_185416cb8a76fb63 = isdefined(self.var_f2b3eb0f3505f5af) && isdefined(self.var_f2b3eb0f3505f5af.objectives[uid]);
    if (istrue(var_185416cb8a76fb63) && !istrue(self.var_f2b3eb0f3505f5af.objectives[uid].is_completed)) {
        function_c0257db3a941f1b6(uid, is_successful);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x261f
// Size: 0x7b
function function_4ca6dc38a2cb2639(is_successful) {
    if (isdefined(self.var_f2b3eb0f3505f5af) && isdefined(self.var_f2b3eb0f3505f5af.var_301e67ae9379349e)) {
        uid = self.var_f2b3eb0f3505f5af.var_301e67ae9379349e;
        if (!istrue(self.var_f2b3eb0f3505f5af.objectives[uid].is_completed)) {
            function_c0257db3a941f1b6(uid, is_successful);
        }
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26a1
// Size: 0xa1
function function_be0ddc8cccc0f4a4(is_successful) {
    if (isdefined(self.var_f2b3eb0f3505f5af) && isdefined(self.var_f2b3eb0f3505f5af.var_301e67ae9379349e)) {
        uid = self.var_f2b3eb0f3505f5af.var_301e67ae9379349e;
        if (!istrue(self.var_f2b3eb0f3505f5af.objectives[uid].is_completed)) {
            function_c0257db3a941f1b6(uid, is_successful);
        }
        self.var_f2b3eb0f3505f5af.var_301e67ae9379349e = undefined;
        self.var_f2b3eb0f3505f5af.var_cf707e989930334d = undefined;
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2749
// Size: 0x48
function function_ee64e6233820f296(uid) {
    var_8f5353255e77c5bf = isdefined(self.var_f2b3eb0f3505f5af) && isdefined(self.var_f2b3eb0f3505f5af.objectives[uid]);
    if (istrue(var_8f5353255e77c5bf)) {
        function_2d15427fd33a134d(uid);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2798
// Size: 0x64
function function_d4a8824fbf63451d() {
    current_obj = undefined;
    var_8489c1287642b709 = self.var_f2b3eb0f3505f5af.var_8489c1287642b709;
    if (isdefined(var_8489c1287642b709) && isdefined(self.var_f2b3eb0f3505f5af.objectives[var_8489c1287642b709])) {
        current_obj = self.var_f2b3eb0f3505f5af.objectives[var_8489c1287642b709];
    }
    return current_obj;
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2804
// Size: 0x218
function function_2ea2aacc5d66ae03() {
    if (!namespace_4b0406965e556711::gameflag("ui_objectives_setup")) {
        if (isdefined(level.var_c98b5921be7579fd) && isdefined(level.var_1837cfa1aeb8ff0b)) {
            foreach (player in level.players) {
                player function_25bcacb7fb00fc47(level.var_c98b5921be7579fd, level.var_1837cfa1aeb8ff0b);
            }
        }
    }
    if (!isdefined(self) || !isdefined(self.var_f2b3eb0f3505f5af) || !isdefined(self.var_f2b3eb0f3505f5af.objectives)) {
        return;
    }
    self.var_f2b3eb0f3505f5af.var_1710c224de197b0a = level.framedurationseconds;
    current_obj = function_d4a8824fbf63451d();
    if (isdefined(current_obj)) {
        if (!isdefined(self.var_f2b3eb0f3505f5af.var_301e67ae9379349e)) {
            if (istrue(current_obj.var_4f1c7c8ad5d5b9e4)) {
                function_7fcc6994dd0b0374(current_obj.uid, current_obj.var_a7c99b4e402f44ff);
            } else {
                function_3b4b24bbf0814ee6(current_obj.uid, current_obj.var_a7c99b4e402f44ff, current_obj.is_completed, current_obj.is_successful);
            }
        } else if (self.var_f2b3eb0f3505f5af.var_301e67ae9379349e != current_obj.uid) {
            function_4c43cb3c8fcb9b87();
        } else if (!isdefined(self.var_f2b3eb0f3505f5af.var_cf707e989930334d) || self.var_f2b3eb0f3505f5af.var_cf707e989930334d != current_obj.is_completed) {
            if (istrue(current_obj.is_completed)) {
                function_d463ec55daebbd66(current_obj.is_successful);
            }
        }
    } else if (isdefined(self.var_f2b3eb0f3505f5af.var_301e67ae9379349e)) {
        function_4c43cb3c8fcb9b87();
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a23
// Size: 0x39
function function_a2b714e5d5977e3a(zone) {
    var_86e5d92463aaef93 = function_707fa37138f06a58(zone.objectivetype);
    if (isdefined(var_86e5d92463aaef93)) {
        setomnvar("ui_wm_objective", var_86e5d92463aaef93);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a63
// Size: 0x102
function function_707fa37138f06a58(objectivetype) {
    switch (objectivetype) {
    case 1:
        if (namespace_36f464722d326bbe::getmapname() == "mp_jup_dam") {
            return 9;
            goto LOC_00000028;
        }
        return 1;
    case 2:
    LOC_00000028:
        if (namespace_36f464722d326bbe::getmapname() == "mp_jup_dam") {
            return 10;
            goto LOC_00000040;
        }
        return 2;
    case 3:
    LOC_00000040:
        return 3;
    case 4:
        return 4;
    case 5:
        return 5;
    case 6:
        return 6;
    case 7:
        return 7;
    case 8:
        return 8;
    case 9:
        return 11;
    case 10:
        return 12;
    case 11:
        return 13;
    case 12:
        return 14;
    default:
        break;
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b6c
// Size: 0x1e
function function_20c1029d048bbe3c(attackingteam) {
    setomnvar("ui_wm_axis_attacking", attackingteam == "axis");
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b91
// Size: 0x48
function function_e20cff3c3800c3a() {
    setomnvar("ui_wm_show_objectives", 0);
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    wait(5);
    function_104402acd2337387(self.zone.objectivetype);
    wait(1);
    setomnvar("ui_wm_show_objectives", 1);
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2be0
// Size: 0x168
function function_104402acd2337387(objectivetype) {
    switch (objectivetype) {
    case 1:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_zone_attack", "jup_wm_zone_defend", game["attackers"]);
        break;
    case 2:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_bomb_attack", "jup_wm_bomb_defend", game["attackers"]);
        break;
    case 3:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_hostage_attack", "jup_wm_hostage_defend", game["attackers"]);
        break;
    case 4:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_destroy_attack", "jup_wm_destroy_defend", game["attackers"]);
        break;
    case 5:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_plant_attack", "jup_wm_plant_defend", game["attackers"]);
        break;
    case 6:
    case 11:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_escort_attack", "jup_wm_escort_defend", game["attackers"]);
        break;
    case 7:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_boss_attack", "jup_wm_boss_defend", game["attackers"]);
        break;
    case 8:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_boss_zone_attack", "jup_wm_boss_zone_defend", game["attackers"]);
        break;
    default:
        break;
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d4f
// Size: 0xc0
function function_51bce80de8cbf370(var_a56d40e76fdbc670, var_15ec18bea9b1ec17) {
    if (isdefined(level.zone.objective.params["transitionSplash"])) {
        var_c91aec495c8b0e99 = level.zone.objective.params["transitionSplash"][0];
        var_f631201da418f9cd = level.zone.objective.params["transitionSplash"][1];
        namespace_44abc05161e2e2cb::notifyteam(var_c91aec495c8b0e99, var_f631201da418f9cd, game["attackers"]);
    } else {
        function_ab0851fa181e1fb2(var_a56d40e76fdbc670);
        waitframe();
        function_b5b3534cd8504c4b(var_15ec18bea9b1ec17);
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e16
// Size: 0x168
function function_ab0851fa181e1fb2(objectivetype) {
    switch (objectivetype) {
    case 1:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_secured_zone", "jup_wm_secured_zone_enemy", game["attackers"]);
        break;
    case 2:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_secured_bomb", "jup_wm_secured_bomb_enemy", game["attackers"]);
        break;
    case 3:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_secured_hostage", "jup_wm_secured_hostage_enemy", game["attackers"]);
        break;
    case 4:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_secured_destroy", "jup_wm_secured_destroy_enemy", game["attackers"]);
        break;
    case 5:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_secured_plant", "jup_wm_secured_plant_enemy", game["attackers"]);
        break;
    case 6:
    case 11:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_secured_escort", "jup_wm_secured_escort_enemy", game["attackers"]);
        break;
    case 7:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_secured_boss", "jup_wm_secured_boss_enemy", game["attackers"]);
        break;
    case 8:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_secured_boss_zone", "jup_wm_secured_boss_zone_enemy", game["attackers"]);
        break;
    default:
        break;
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f85
// Size: 0x168
function function_b5b3534cd8504c4b(objectivetype) {
    switch (objectivetype) {
    case 1:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_next_zone", "jup_wm_next_zone_enemy", game["attackers"]);
        break;
    case 2:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_next_bomb", "jup_wm_next_bomb_enemy", game["attackers"]);
        break;
    case 3:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_next_hostage", "jup_wm_next_hostage_enemy", game["attackers"]);
        break;
    case 4:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_next_destroy", "jup_wm_next_destroy_enemy", game["attackers"]);
        break;
    case 5:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_next_plant", "jup_wm_next_plant_enemy", game["attackers"]);
        break;
    case 6:
    case 11:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_next_escort", "jup_wm_next_escort_enemy", game["attackers"]);
        break;
    case 7:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_next_boss", "jup_wm_next_boss_enemy", game["attackers"]);
        break;
    case 8:
        namespace_44abc05161e2e2cb::notifyteam("jup_wm_next_boss_zone", "jup_wm_next_boss_zone_enemy", game["attackers"]);
        break;
    default:
        break;
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30f4
// Size: 0x185
function function_524eac445bf29eab() {
    self endon("game_ended");
    self endon("disconnect");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    while (1) {
        self waittill("joined_team");
        lastteam = self.pers["last_team"];
        if (isdefined(lastteam) && self.team != lastteam) {
            current_obj = function_d4a8824fbf63451d();
            if (!isdefined(current_obj)) {
                continue;
            }
            if (isdefined(self.var_f2b3eb0f3505f5af.var_301e67ae9379349e)) {
                self.var_f2b3eb0f3505f5af.var_8489c1287642b709 = undefined;
                wait(1);
            }
            objectivetype = level.zone.objectivetype;
            self.var_f2b3eb0f3505f5af.objectives[current_obj.uid] = undefined;
            current_obj.uid = function_7e6a8f883ef06080(objectivetype, self.team);
            current_obj.var_a7c99b4e402f44ff = function_37b37dfde06a36af(objectivetype, self.team);
            current_obj.var_9c9dc0bc7ea4a64e = 1;
            current_obj.var_b768c68c436ee397 = 1;
            self.var_f2b3eb0f3505f5af.objectives[current_obj.uid] = current_obj;
            self.var_f2b3eb0f3505f5af.var_8489c1287642b709 = current_obj.uid;
            self.var_f2b3eb0f3505f5af.var_301e67ae9379349e = undefined;
        }
    }
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3280
// Size: 0x159
function function_37b37dfde06a36af(objectivetype, team) {
    side = ter_op(team == game["attackers"], 0, 1);
    var_877dcafdfba1ebda = function_7f3a51d588ffeb11();
    var_a18f2d067f37ee8d = function_fcc3c58a459eb914();
    mp = [0:[], 1:[0:"WAR_CAPTURE", 1:"WAR_DEFEND"], 2:[0:"WAR_BOMB_DEFUSE", 1:"WAR_BOMB_DEFEND"], 3:[0:"WAR_HOSTAGE_RESCUE", 1:"WAR_HOSTAGE_DEFEND"], 4:[0:"", 1:""], 5:[0:"WAR_DESTROY_PLANT_ATTACKERS", 1:"WAR_DESTROY_PLANT_DEFENDERS"], 6:[0:"WAR_TANK_ESCORT_ATTACKERS", 1:"WAR_TANK_ESCORT_DEFENDERS"], 7:[0:"WAR_AI_BOSS_ATTACKERS", 1:"WAR_AI_BOSS_DEFENDERS"], 8:[0:"WAR_AI_BOSS_ZONE_ATTACKERS", 1:"WAR_AI_BOSS_ZONE_DEFENDERS"], 9:[0:"WAR_HACK_ATTACK", 1:"WAR_HACK_DEFEND"], 10:var_877dcafdfba1ebda, 11:[0:"WAR_ESCORT_WHEELSON_ATTACK", 1:"WAR_ESCORT_WHEELSON_DEFEND"], 12:var_a18f2d067f37ee8d];
    return mp[objectivetype][side];
}

// Namespace namespace_f9abaed971c570f0/namespace_dbbbcd68be00451d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33e1
// Size: 0x34
function function_7e6a8f883ef06080(objectivetype, team) {
    prefix = function_37b37dfde06a36af(objectivetype, team) + "_UID";
    return function_751ff808e0219b4f(prefix);
}

