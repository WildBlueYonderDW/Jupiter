#using script_16ea1b94f0f381b3;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_2583ee5680cf4736;
#using script_3390b73ac3318fe;
#using script_3559130ee2bb3a29;
#using script_3e2f8cc477d57433;
#using script_41387eecc35b88bf;
#using script_46c7c73b1a7e4773;
#using script_485622d93fa7e4cf;
#using script_5605739161b1abe1;
#using script_5640d32580c6bc7d;
#using script_58be75c518bf0d40;
#using script_600b944a95c3a7bf;
#using script_76cc264b397db9cb;
#using script_7b2517368c79e5bc;
#using script_7f9409b703dad400;
#using script_860bfdfe82326e3;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\engine\utility;
#using scripts\mp\objidpoolmanager;

#namespace namespace_26f804e2951e85f2;

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x80c
// Size: 0x65
function function_7b936b2474aa34c2(interact, player, var_419535d231262698) {
    if (isdefined(player) && isdefined(interact) && isdefined(var_419535d231262698) && isplayer(player)) {
        if (issubstr(interact.s_gate.targetname, var_419535d231262698) && function_dc9b318397db29cb(player, var_419535d231262698) == 1) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x87a
// Size: 0xa1
function function_dc9b318397db29cb(player, var_419535d231262698) {
    if (isdefined(player) && isdefined(var_419535d231262698) && isplayer(player)) {
        switch (var_419535d231262698) {
        case #"hash_fa50fdf6bd8362a9":
            return istrue(player.var_f618a05d316a2fd6);
        case #"hash_fa50faf6bd835df0":
            return istrue(player.var_d34c91079b4d1515);
        case #"hash_fa50fbf6bd835f83":
            return istrue(player.var_f277fbd58fcf41c8);
        case #"hash_fa5101f6bd8368f5":
            return istrue(player.var_2123e95946a8122a);
        }
    }
    return false;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x924
// Size: 0x1d4
function function_2911a407cdc7858(interact, player, var_419535d231262698) {
    if (isdefined(player) && isdefined(interact) && isdefined(var_419535d231262698) && isplayer(player)) {
        var_35d868a4ad30ee6e = function_755c94f4a8509b03(player.team, player.sessionsquadid);
        if (istrue(var_35d868a4ad30ee6e)) {
            player.var_9c6168187b815669 = undefined;
            return {#string:%JUP_OB_S5/RIFT_TOKEN_VOTE_IN_PROGRESS, #type:"HINT_NOBUTTON"};
        }
        if (function_6932962f514cd776(player)) {
            player.var_9c6168187b815669 = undefined;
            return {#string:%JUP_OB_S5/RIFT_TOKEN_CONTRACT_IN_PROGRESS, #type:"HINT_NOBUTTON"};
        }
        if (interact.script_label == "low") {
            if (getdvarint(@"hash_624740d0cdd65be5", 0)) {
                player.var_9c6168187b815669 = "free_low_rift";
                return {#string:%JUP_OB_OBJECTIVES/INTERACT_ACTIVATE, #type:"HINT_BUTTON"};
            } else {
                lootid = namespace_2abc885019e1956::function_2c836ad05e5f634c("jup_rift_gate_key_token_low");
                var_3ff928df2d5138ea = %JUP_OB_S5/RIFT_TOKEN_MISSING_PROMPT_LOW;
                var_e5242855a04339bf = %JUP_OB_S5/RIFT_TOKEN_ACTIVATE_PROMPT_LOW;
            }
        } else {
            lootid = namespace_2abc885019e1956::function_2c836ad05e5f634c("jup_rift_gate_key_token_high");
            var_3ff928df2d5138ea = %JUP_OB_S5/RIFT_TOKEN_MISSING_PROMPT_HIGH;
            var_e5242855a04339bf = %JUP_OB_S5/RIFT_TOKEN_ACTIVATE_PROMPT_HIGH;
        }
        backpackindex = player namespace_feea61bc660e9e0f::function_4776284a348ebb6a(lootid);
        if (backpackindex == -1) {
            player.var_9c6168187b815669 = undefined;
            return {#string:var_3ff928df2d5138ea, #type:"HINT_NOBUTTON"};
        } else {
            player.var_9c6168187b815669 = lootid;
            return {#string:var_e5242855a04339bf, #type:"HINT_BUTTON"};
        }
    }
    return undefined;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb01
// Size: 0xa7
function function_6932962f514cd776(player) {
    var_32a6f9b3d487152d = activity_participation::function_553a690e1064cf0b(player);
    foreach (var_b2941d08f576eb6c in var_32a6f9b3d487152d) {
        var_6965880b974574a6 = var_b2941d08f576eb6c.instanceid;
        activityinstance = activity_common::function_1f3e343912ae15c5(var_6965880b974574a6);
        activitycategory = namespace_4fda5d7358015a06::function_511be8bcaede8b52(activityinstance);
        if (activitycategory == "Contract") {
            return true;
        }
    }
    return false;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbb1
// Size: 0x490
function function_f1db902e3af4f3c(tokenid, player, var_419535d231262698) {
    player endon("death_or_disconnect");
    player forceplaygestureviewmodel("jup_ges_open_portal");
    player playsound("fly_player_activate_portal");
    var_88234437d3758ed8 = !isnumber(tokenid) && tokenid == "free_low_rift" ? tokenid : namespace_2abc885019e1956::function_fc925a153c7fd55c(tokenid);
    var_f0467a62f52ac9d6 = issubstr(var_88234437d3758ed8, "low");
    var_e075f39c1003cdcb = undefined;
    a_squad = player namespace_ca7b90256548aa40::getsquadmembers();
    foreach (squaddie in a_squad) {
        if (isdefined(squaddie)) {
            var_c9d4fb4a80f8fe33 = function_c9697d8bfd34a22b(squaddie, var_419535d231262698);
            if (!isdefined(var_c9d4fb4a80f8fe33)) {
                var_e075f39c1003cdcb = namespace_4164bc931714b00b::spawn_script_model(self.s_gate, "jup_zm_rift_gate", 1, 1);
                break;
            }
        }
    }
    if (isdefined(var_e075f39c1003cdcb)) {
        var_e075f39c1003cdcb hide();
        foreach (squaddie in a_squad) {
            var_e075f39c1003cdcb function_af96f7c8819ae854(squaddie, 2000);
        }
    }
    function_fd5211de155982af(player.team, player.sessionsquadid, 1);
    wait 0.5;
    var_1a92db52accd1108 = {#player:player};
    self.s_gate.var_d1e2ce25ea15c51d = array_add(self.s_gate.var_d1e2ce25ea15c51d, var_1a92db52accd1108);
    var_5d3c6815aef4e678 = function_c9697d8bfd34a22b(player, var_419535d231262698);
    if (isdefined(var_5d3c6815aef4e678)) {
        var_5d3c6815aef4e678 playsoundtoplayer("ui_zm_core_door_purchase_success", player);
    }
    a_squad = player namespace_ca7b90256548aa40::getsquadmembers();
    if (isdefined(var_e075f39c1003cdcb)) {
        foreach (squaddie in a_squad) {
            if (isdefined(squaddie)) {
                var_c9d4fb4a80f8fe33 = function_c9697d8bfd34a22b(squaddie, var_419535d231262698);
                if (!isdefined(var_c9d4fb4a80f8fe33)) {
                    self.s_gate.mdl_vortex hidefromplayer(squaddie);
                    var_e075f39c1003cdcb showtoplayer(squaddie);
                }
            }
        }
        var_e075f39c1003cdcb setscriptablepartstate("reveal", "reveal_in");
    }
    if (isdefined(self.var_8d4002c21d2cac70)) {
        [[ self.var_8d4002c21d2cac70 ]](a_squad, var_f0467a62f52ac9d6, 1, 1, var_e075f39c1003cdcb);
    }
    b_success = namespace_6c57c664b4288f88::function_93c8f90c3bd798c6(player, 30);
    self.s_gate.var_d1e2ce25ea15c51d = array_remove(self.s_gate.var_d1e2ce25ea15c51d, var_1a92db52accd1108);
    function_fd5211de155982af(player.team, player.sessionsquadid, 0);
    if (b_success == 1) {
        if (isnumber(tokenid)) {
            b_valid = player namespace_feea61bc660e9e0f::function_181a584e4a68d5d6(tokenid);
        } else if (tokenid == "free_low_rift") {
            b_valid = 1;
        }
        player.var_9c6168187b815669 = undefined;
        if (istrue(b_valid)) {
            if (isdefined(self.var_b83ca58b862b27e9)) {
                level thread [[ self.var_b83ca58b862b27e9 ]](a_squad, var_f0467a62f52ac9d6);
            }
        } else {
            var_5d3c6815aef4e678 = function_c9697d8bfd34a22b(player, var_419535d231262698);
            if (isdefined(var_5d3c6815aef4e678)) {
                var_5d3c6815aef4e678 playsoundtoplayer("ui_zm_core_purchase_deny", player);
            }
        }
        return;
    }
    var_5d3c6815aef4e678 = function_c9697d8bfd34a22b(player, var_419535d231262698);
    if (isdefined(var_5d3c6815aef4e678)) {
        var_5d3c6815aef4e678 playsoundtoplayer("ui_zm_core_purchase_deny", player);
    }
    if (isdefined(self.var_8d4002c21d2cac70)) {
        level thread [[ self.var_8d4002c21d2cac70 ]](a_squad, var_f0467a62f52ac9d6, 0, 1, var_e075f39c1003cdcb);
    }
    if (isdefined(var_e075f39c1003cdcb)) {
        var_e075f39c1003cdcb setscriptablepartstate("reveal", "reveal_out");
        foreach (squaddie in a_squad) {
            if (isdefined(squaddie)) {
                var_c9d4fb4a80f8fe33 = function_c9697d8bfd34a22b(squaddie, var_419535d231262698);
                if (!isdefined(var_c9d4fb4a80f8fe33)) {
                    self.s_gate.mdl_vortex showtoplayer(squaddie);
                }
            }
        }
    }
    wait 5;
    if (isdefined(var_e075f39c1003cdcb)) {
        var_e075f39c1003cdcb delete();
    }
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1049
// Size: 0xd7
function function_1184fa6d41336bdc(player, var_419535d231262698) {
    if (isdefined(player) && isdefined(var_419535d231262698)) {
        switch (var_419535d231262698) {
        case #"hash_fa50fdf6bd8362a9":
            return (istrue(player.var_960d2cf04cf1af82) || istrue(player.var_a13ef67ff2b6a0c7));
        case #"hash_fa50faf6bd835df0":
            return (istrue(player.var_6e3e8cbe4462b237) || istrue(player.var_dfe88c94f4491748));
        case #"hash_fa50fbf6bd835f83":
            return (istrue(player.var_a06c01d1d8837948) || istrue(player.var_6169093f322d0a91));
        case #"hash_fa5101f6bd8368f5":
            return (istrue(player.var_700b4aa41100cdce) || istrue(player.var_e6e89f4ebf9ea3c3));
        }
    }
    return false;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1129
// Size: 0xd7
function function_670ac099eac79d1b(player, var_419535d231262698) {
    if (isdefined(player) && isdefined(var_419535d231262698)) {
        switch (var_419535d231262698) {
        case #"hash_fa50fdf6bd8362a9":
            return (istrue(player.var_cecf6e02785a794e) || istrue(player.var_a13ef67ff2b6a0c7));
        case #"hash_fa50faf6bd835df0":
            return (istrue(player.var_1a55d22a257e4cff) || istrue(player.var_dfe88c94f4491748));
        case #"hash_fa50fbf6bd835f83":
            return (istrue(player.var_66dfc0bdf8ed7e10) || istrue(player.var_6169093f322d0a91));
        case #"hash_fa5101f6bd8368f5":
            return (istrue(player.var_2103624e16ae7a7a) || istrue(player.var_e6e89f4ebf9ea3c3));
        }
    }
    return false;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1209
// Size: 0x12
function function_50ab9eb71c85b240() {
    return getdvarint(@"hash_9340b665773f30c4", 1);
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1224
// Size: 0x1bb
function function_5cdb4ce28191f853(player, s_gate, var_419535d231262698, modeloverride) {
    if (isdefined(s_gate) && isdefined(player) && isdefined(var_419535d231262698) && isplayer(player)) {
        var_e2a842de589a0b63 = isdefined(modeloverride) ? modeloverride : "jup_zm_rift_gate";
        switch (var_419535d231262698) {
        case #"hash_fa50fdf6bd8362a9":
            if (!isdefined(player.var_a20bb623ab5f6211)) {
                player.var_a20bb623ab5f6211 = namespace_4164bc931714b00b::spawn_script_model(s_gate, var_e2a842de589a0b63, 1, 1);
                if (isdefined(player.var_a20bb623ab5f6211)) {
                    player.var_a20bb623ab5f6211 showonlytoplayer(player);
                }
            }
            break;
        case #"hash_fa50faf6bd835df0":
            if (!isdefined(player.var_c6e9f44da9dc3af8)) {
                player.var_c6e9f44da9dc3af8 = namespace_4164bc931714b00b::spawn_script_model(s_gate, var_e2a842de589a0b63, 1, 1);
                if (isdefined(player.var_c6e9f44da9dc3af8)) {
                    player.var_c6e9f44da9dc3af8 showonlytoplayer(player);
                }
            }
            break;
        case #"hash_fa50fbf6bd835f83":
            if (!isdefined(player.var_f04a7621530c4687)) {
                player.var_f04a7621530c4687 = namespace_4164bc931714b00b::spawn_script_model(s_gate, var_e2a842de589a0b63, 1, 1);
                if (isdefined(player.var_f04a7621530c4687)) {
                    player.var_f04a7621530c4687 showonlytoplayer(player);
                }
            }
            break;
        case #"hash_fa5101f6bd8368f5":
            if (!isdefined(player.var_a98ca13545b6233d)) {
                player.var_a98ca13545b6233d = namespace_4164bc931714b00b::spawn_script_model(s_gate, var_e2a842de589a0b63, 1, 1);
                if (isdefined(player.var_a98ca13545b6233d)) {
                    player.var_a98ca13545b6233d showonlytoplayer(player);
                }
            }
            break;
        }
    }
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13e7
// Size: 0xec
function function_96b2f0429cd884b5(player, var_419535d231262698) {
    if (isdefined(player) && isdefined(var_419535d231262698) && isplayer(player)) {
        switch (var_419535d231262698) {
        case #"hash_fa50fdf6bd8362a9":
            if (isdefined(player.var_a20bb623ab5f6211)) {
                player.var_a20bb623ab5f6211 delete();
            }
            break;
        case #"hash_fa50faf6bd835df0":
            if (isdefined(player.var_c6e9f44da9dc3af8)) {
                player.var_c6e9f44da9dc3af8 delete();
            }
            break;
        case #"hash_fa50fbf6bd835f83":
            if (isdefined(player.var_f04a7621530c4687)) {
                player.var_f04a7621530c4687 delete();
            }
            break;
        case #"hash_fa5101f6bd8368f5":
            if (isdefined(player.var_a98ca13545b6233d)) {
                player.var_a98ca13545b6233d delete();
            }
            break;
        }
    }
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14db
// Size: 0xd9
function function_c9697d8bfd34a22b(player, var_419535d231262698) {
    if (isdefined(player) && isdefined(var_419535d231262698) && isplayer(player)) {
        switch (var_419535d231262698) {
        case #"hash_fa50fdf6bd8362a9":
            if (isdefined(player.var_a20bb623ab5f6211)) {
                return player.var_a20bb623ab5f6211;
            }
            break;
        case #"hash_fa50faf6bd835df0":
            if (isdefined(player.var_c6e9f44da9dc3af8)) {
                return player.var_c6e9f44da9dc3af8;
            }
            break;
        case #"hash_fa50fbf6bd835f83":
            if (isdefined(player.var_f04a7621530c4687)) {
                return player.var_f04a7621530c4687;
            }
            break;
        case #"hash_fa5101f6bd8368f5":
            if (isdefined(player.var_a98ca13545b6233d)) {
                return player.var_a98ca13545b6233d;
            }
            break;
        }
    }
    return undefined;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15bd
// Size: 0x2f
function function_b45f9d15a24dd4d0() {
    if (!istrue(level.var_4be7e86a1c7de358)) {
        callback::add(#"hash_58cd2edf70911e82", &namespace_af93597583d94051::function_d98d2ea053541d5d);
        level.var_4be7e86a1c7de358 = 1;
    }
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15f4
// Size: 0x16a
function function_d98d2ea053541d5d(sparams) {
    if (!(isdefined(sparams.team) && isdefined(sparams) && isdefined(sparams.index))) {
        return;
    }
    oldteam = sparams.team;
    oldsquadid = sparams.index;
    if (isdefined(oldteam) && isdefined(oldsquadid)) {
        var_3f544337aa64eadc = level.squaddata[oldteam][oldsquadid];
        if (isdefined(var_3f544337aa64eadc)) {
            var_503885d27a3d40da = isdefined(var_3f544337aa64eadc.players) ? var_3f544337aa64eadc.players : undefined;
            var_8751194ab02b357d = 1;
            if (isdefined(var_503885d27a3d40da) && isarray(var_503885d27a3d40da) && var_503885d27a3d40da.size > 0) {
                foreach (var_cc646804cb6ec1b1 in var_503885d27a3d40da) {
                    if (isdefined(var_cc646804cb6ec1b1) && var_cc646804cb6ec1b1 != self) {
                        var_8751194ab02b357d = 0;
                        break;
                    }
                }
            }
            if (istrue(var_8751194ab02b357d)) {
                function_ed033cc3e7f647a2(oldteam, oldsquadid, "s1");
                function_ed033cc3e7f647a2(oldteam, oldsquadid, "s2");
                function_ed033cc3e7f647a2(oldteam, oldsquadid, "s3");
                function_ed033cc3e7f647a2(oldteam, oldsquadid, "s5");
            }
        }
    }
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1766
// Size: 0xf8
function private function_ed033cc3e7f647a2(team, sessionsquadid, var_419535d231262698) {
    var_5cb02e311220e539 = function_8dae31f3453c535c(var_419535d231262698);
    if (isdefined(var_5cb02e311220e539.var_70826f0845ce7402) && isdefined(var_5cb02e311220e539) && isdefined(var_5cb02e311220e539.var_26e51088c6471824)) {
        var_a5ba4e20c23b7b33 = function_b200e7001502a482(team, sessionsquadid, var_419535d231262698);
        if (isdefined(var_a5ba4e20c23b7b33) && isarray(var_a5ba4e20c23b7b33) && var_a5ba4e20c23b7b33.size > 0) {
            foreach (var_3cd7928d78d7a372 in var_a5ba4e20c23b7b33) {
                function_3c3bcb8717d26853(var_419535d231262698, var_3cd7928d78d7a372);
                function_2ba47d2b2d7cadf3(var_3cd7928d78d7a372);
            }
        } else {
            println("<dev string:x1c>");
        }
        namespace_9bb409deb69fb31d::function_a20a10ce593f692b(team, sessionsquadid, var_5cb02e311220e539.var_70826f0845ce7402, []);
    }
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1866
// Size: 0xaa
function private function_b200e7001502a482(team, sessionsquadid, var_419535d231262698, var_6b0ee97314aed333) {
    var_ac0eafb387bd7c4 = undefined;
    if (isdefined(sessionsquadid) && isdefined(team) && isdefined(var_419535d231262698)) {
        var_5cb02e311220e539 = function_8dae31f3453c535c(var_419535d231262698);
        if (isdefined(var_5cb02e311220e539.var_70826f0845ce7402) && isdefined(var_5cb02e311220e539) && isdefined(var_5cb02e311220e539.var_26e51088c6471824)) {
            if (isdefined(team) && isdefined(sessionsquadid) && namespace_9bb409deb69fb31d::function_be6ce63a202791c5(team, sessionsquadid, var_5cb02e311220e539.var_70826f0845ce7402)) {
                var_ac0eafb387bd7c4 = namespace_9bb409deb69fb31d::getsquaddata(team, sessionsquadid, var_5cb02e311220e539.var_70826f0845ce7402);
            }
        }
    }
    return var_ac0eafb387bd7c4;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1919
// Size: 0x1f
function private function_2ba47d2b2d7cadf3(var_8986997b27e850da) {
    if (isdefined(var_8986997b27e850da)) {
        var_8986997b27e850da function_da9dd315433f48fa();
        var_8986997b27e850da freescriptable();
    }
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1940
// Size: 0x6e
function private function_da9dd315433f48fa() {
    if (!(isdefined(self) && isdefined(self.var_745e910fb84e7971))) {
        return;
    }
    if (isdefined(self.var_745e910fb84e7971.var_d1c37d94e5043730)) {
        self.var_745e910fb84e7971.var_d1c37d94e5043730 delete();
    }
    self.var_745e910fb84e7971 notify("cleanup");
    self.var_745e910fb84e7971 freescriptable();
    self.var_745e910fb84e7971 = undefined;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19b6
// Size: 0x10b
function function_3c3bcb8717d26853(var_419535d231262698, var_3961e3337da1825e) {
    if (isdefined(var_419535d231262698) && isdefined(var_3961e3337da1825e)) {
        var_efe357496e561519 = spawnstruct();
        switch (var_419535d231262698) {
        case #"hash_fa50fdf6bd8362a9":
            if (isdefined(level.var_f9faff3d5230e3ce)) {
                level.var_f9faff3d5230e3ce = array_remove(level.var_f9faff3d5230e3ce, var_3961e3337da1825e);
            }
            break;
        case #"hash_fa50faf6bd835df0":
            if (isdefined(level.var_f9fafe3d5230e19b)) {
                level.var_f9fafe3d5230e19b = array_remove(level.var_f9fafe3d5230e19b, var_3961e3337da1825e);
            }
            break;
        case #"hash_fa50fbf6bd835f83":
            if (isdefined(level.var_f9fafd3d5230df68)) {
                level.var_f9fafd3d5230df68 = array_remove(level.var_f9fafd3d5230df68, var_3961e3337da1825e);
            }
            break;
        case #"hash_fa5101f6bd8368f5":
            if (isdefined(level.var_f9fb033d5230ec9a)) {
                level.var_f9fb033d5230ec9a = array_remove(level.var_f9fb033d5230ec9a, var_3961e3337da1825e);
            }
            break;
        }
    }
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1ac9
// Size: 0xa2
function private function_d71a760b0589b81d(team, sessionsquadid, var_419535d231262698) {
    var_a6a61f71b44e87af = 0;
    if (isdefined(sessionsquadid) && isdefined(team) && isdefined(var_419535d231262698)) {
        var_5cb02e311220e539 = function_8dae31f3453c535c(var_419535d231262698);
        if (isdefined(var_5cb02e311220e539.var_70826f0845ce7402) && isdefined(var_5cb02e311220e539) && isdefined(var_5cb02e311220e539.var_26e51088c6471824)) {
            if (isdefined(team) && isdefined(sessionsquadid) && namespace_9bb409deb69fb31d::function_be6ce63a202791c5(team, sessionsquadid, var_5cb02e311220e539.var_26e51088c6471824)) {
                var_a6a61f71b44e87af = namespace_9bb409deb69fb31d::getsquaddata(team, sessionsquadid, var_5cb02e311220e539.var_26e51088c6471824);
            }
        }
    }
    return var_a6a61f71b44e87af;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b74
// Size: 0xf1
function function_8dae31f3453c535c(var_419535d231262698) {
    if (isdefined(var_419535d231262698)) {
        var_efe357496e561519 = spawnstruct();
        switch (var_419535d231262698) {
        case #"hash_fa50fdf6bd8362a9":
            var_efe357496e561519.var_70826f0845ce7402 = "UnlockQuestPedestalsS1";
            var_efe357496e561519.var_26e51088c6471824 = "UnlockQuestPedestalsCompleteS1";
            break;
        case #"hash_fa50faf6bd835df0":
            var_efe357496e561519.var_70826f0845ce7402 = "UnlockQuestPedestalsS2";
            var_efe357496e561519.var_26e51088c6471824 = "UnlockQuestPedestalsCompleteS2";
            break;
        case #"hash_fa50fbf6bd835f83":
            var_efe357496e561519.var_70826f0845ce7402 = "UnlockQuestPedestalsS3";
            var_efe357496e561519.var_26e51088c6471824 = "UnlockQuestPedestalsCompleteS3";
            break;
        case #"hash_fa5101f6bd8368f5":
            var_efe357496e561519.var_70826f0845ce7402 = "UnlockQuestPedestalsS5";
            var_efe357496e561519.var_26e51088c6471824 = "UnlockQuestPedestalsCompleteS5";
            break;
        }
        return var_efe357496e561519;
    }
    return undefined;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x1c6e
// Size: 0x5ac
function private function_5121e154aabb5b05(player, oldteam, newteam, oldsquadid, newsquadid, var_419535d231262698) {
    if (!(isdefined(player) && isdefined(var_419535d231262698)) || !isplayer(player)) {
        println("<dev string:x91>");
        return;
    }
    function_b589440141c6678e(player, var_419535d231262698, 1);
    if (isdefined(oldteam) && isdefined(oldsquadid)) {
        var_3f544337aa64eadc = level.squaddata[oldteam][oldsquadid];
        if (isdefined(var_3f544337aa64eadc)) {
            var_503885d27a3d40da = var_3f544337aa64eadc.players;
            var_8751194ab02b357d = 1;
            var_8cd0a01c25c55df3 = undefined;
            if (isdefined(var_503885d27a3d40da) && isarray(var_503885d27a3d40da) && var_503885d27a3d40da.size > 0) {
                foreach (var_cc646804cb6ec1b1 in var_503885d27a3d40da) {
                    if (isdefined(var_cc646804cb6ec1b1)) {
                        var_8cd0a01c25c55df3 = var_cc646804cb6ec1b1;
                        var_8751194ab02b357d = 0;
                        break;
                    }
                }
            }
            if (istrue(var_8751194ab02b357d)) {
                function_ed033cc3e7f647a2(oldteam, oldsquadid, var_419535d231262698);
            } else {
                var_a5ba4e20c23b7b33 = function_b200e7001502a482(oldteam, oldsquadid, var_419535d231262698);
                if (isdefined(var_a5ba4e20c23b7b33) && isarray(var_a5ba4e20c23b7b33) && var_a5ba4e20c23b7b33.size > 0) {
                    foreach (var_3cd7928d78d7a372 in var_a5ba4e20c23b7b33) {
                        if (isdefined(var_3cd7928d78d7a372.var_745e910fb84e7971)) {
                            bundlename = function_2cdc55ba39d97d70(var_3cd7928d78d7a372.var_745e910fb84e7971.type);
                            var_3cd7928d78d7a372 function_da9dd315433f48fa();
                            if (isdefined(var_8cd0a01c25c55df3)) {
                                var_3cd7928d78d7a372 function_aabd1ec8342d4794(bundlename, var_8cd0a01c25c55df3);
                                var_3cd7928d78d7a372 function_fb77e77aa1cd3508(bundlename, var_8cd0a01c25c55df3, var_419535d231262698);
                                continue;
                            }
                            println("<dev string:xd7>");
                        }
                    }
                } else {
                    println("<dev string:x150>");
                }
            }
        }
    }
    if (isdefined(newteam) && isdefined(newsquadid)) {
        var_2edc190ae1e05188 = level.squaddata[newteam][newsquadid];
        if (isdefined(var_2edc190ae1e05188) && !function_d71a760b0589b81d(newteam, newsquadid, var_419535d231262698)) {
            var_90a66d5b0d63b307 = 1;
            var_9b862428a6a2ba8c = function_b200e7001502a482(newteam, newsquadid, var_419535d231262698);
            if (isdefined(var_9b862428a6a2ba8c) && isarray(var_9b862428a6a2ba8c) && var_9b862428a6a2ba8c.size > 0) {
                foreach (var_6aeb63c24c7e8f62 in var_9b862428a6a2ba8c) {
                    if (isdefined(var_6aeb63c24c7e8f62)) {
                        var_6aeb63c24c7e8f62 enablescriptableplayeruse(player);
                        function_ae472ac4d2ad5228(player, var_6aeb63c24c7e8f62, var_419535d231262698);
                        if (isdefined(var_6aeb63c24c7e8f62.var_745e910fb84e7971)) {
                            if (isdefined(var_6aeb63c24c7e8f62.var_745e910fb84e7971.var_d1c37d94e5043730)) {
                                var_6aeb63c24c7e8f62.var_745e910fb84e7971.var_d1c37d94e5043730 showtoplayer(player);
                            } else {
                                var_2edc190ae1e05188 = level.squaddata[newteam][newsquadid];
                                if (isdefined(var_2edc190ae1e05188)) {
                                    var_5784343d984c418 = var_2edc190ae1e05188.players;
                                    if (isdefined(var_5784343d984c418)) {
                                        var_f80137eb06c0b1cd = undefined;
                                        if (isdefined(var_6aeb63c24c7e8f62.var_745e910fb84e7971.owner)) {
                                            var_f80137eb06c0b1cd = var_6aeb63c24c7e8f62.var_745e910fb84e7971.owner;
                                        } else if (isdefined(var_6aeb63c24c7e8f62.var_745e910fb84e7971.var_d7bb337bb99de0fc)) {
                                            var_f80137eb06c0b1cd = var_6aeb63c24c7e8f62.var_745e910fb84e7971.var_d7bb337bb99de0fc;
                                        } else if (isdefined(var_6aeb63c24c7e8f62.var_745e910fb84e7971.var_ca7127f058c4cf74) && isdefined(var_6aeb63c24c7e8f62.var_745e910fb84e7971.var_17c46414203a5da7)) {
                                            var_f80137eb06c0b1cd = namespace_ca7b90256548aa40::getsquadleader(var_6aeb63c24c7e8f62.var_745e910fb84e7971.var_ca7127f058c4cf74, var_6aeb63c24c7e8f62.var_745e910fb84e7971.var_17c46414203a5da7);
                                        }
                                        if (isdefined(var_f80137eb06c0b1cd)) {
                                            level thread function_dc5d83d97e8f9e9c(var_6aeb63c24c7e8f62.var_745e910fb84e7971, var_6aeb63c24c7e8f62.var_745e910fb84e7971.type, var_f80137eb06c0b1cd, var_f80137eb06c0b1cd.team, var_f80137eb06c0b1cd.sessionsquadid);
                                        }
                                    }
                                }
                            }
                        }
                        var_90a66d5b0d63b307 = 0;
                    }
                }
            }
            if (istrue(var_90a66d5b0d63b307) && function_f0ae0bcc1d1be67c(player, var_419535d231262698)) {
                a_newteam = var_2edc190ae1e05188.players;
                if (isdefined(a_newteam) && isarray(a_newteam) && a_newteam.size > 0) {
                    var_b5ad4e3fbf0fb403 = 0;
                    foreach (var_15e48d55c29a0ac4 in a_newteam) {
                        if (function_f0ae0bcc1d1be67c(player, var_419535d231262698) && !function_d71a760b0589b81d(var_15e48d55c29a0ac4.team, var_15e48d55c29a0ac4.sessionsquadid, var_419535d231262698)) {
                            var_b5ad4e3fbf0fb403 = 1;
                            break;
                        }
                    }
                    if (istrue(var_b5ad4e3fbf0fb403)) {
                        params = spawnstruct();
                        params.player = player;
                        var_615d80c3854d9f1d = function_494387f2e1cdba47(var_419535d231262698);
                        level callback::callback(var_615d80c3854d9f1d, params);
                    }
                }
            }
        }
    }
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2222
// Size: 0x111
function function_f0ae0bcc1d1be67c(player, var_419535d231262698) {
    result = 0;
    if (isdefined(player) && isdefined(var_419535d231262698) && isplayer(player)) {
        switch (var_419535d231262698) {
        case #"hash_fa50fdf6bd8362a9":
            if (player namespace_510e82113265fae9::function_3bb8b73991355a1(0) || getdvarint(@"hash_67e441ba61ff128a", 0) == 1) {
                result = 1;
            }
            break;
        case #"hash_fa50faf6bd835df0":
            if (player namespace_510e82113265fae9::function_3bb8b73991355a1(12) || getdvarint(@"hash_24df0a85fff6ee6b", 0) == 1) {
                result = 1;
            }
            break;
        case #"hash_fa50fbf6bd835f83":
            if (player namespace_510e82113265fae9::function_3bb8b73991355a1(17) || getdvarint(@"hash_f361aa685712210c", 0) == 1) {
                result = 1;
            }
            break;
        case #"hash_fa5101f6bd8368f5":
            if (player namespace_510e82113265fae9::function_3bb8b73991355a1(19) || getdvarint(@"hash_9b01ae5336c960a6", 0) == 1) {
                result = 1;
            }
            break;
        }
    }
    return result;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x233c
// Size: 0x7f
function function_494387f2e1cdba47(var_419535d231262698) {
    result = undefined;
    if (isdefined(var_419535d231262698)) {
        switch (var_419535d231262698) {
        case #"hash_fa50fdf6bd8362a9":
            result = "spawn_s1_rift_pedestal_containers";
            break;
        case #"hash_fa50faf6bd835df0":
            result = "spawn_s2_rift_pedestal_containers";
            break;
        case #"hash_fa50fbf6bd835f83":
            result = "spawn_s3_rift_pedestal_containers";
            break;
        case #"hash_fa5101f6bd8368f5":
            result = "spawn_s5_rift_pedestal_containers";
            break;
        }
    }
    return result;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x23c4
// Size: 0x273
function function_dc5d83d97e8f9e9c(item, itembundlename, var_4e79213273c7fb1d, teamid, squadid) {
    level endon("game_ended");
    if (!(isdefined(teamid) && isdefined(var_4e79213273c7fb1d) && isdefined(itembundlename) && isdefined(item) && isdefined(squadid))) {
        return;
    }
    item notify("gate_relic_spawn_requested");
    item endon("gate_relic_spawn_requested");
    while (isdefined(item)) {
        str_state = item getscriptablepartstate(item.type);
        if (str_state == "dropped") {
            waitframe();
            continue;
        }
        break;
    }
    if (!(isdefined(teamid) && isdefined(itembundlename) && isdefined(item) && isdefined(squadid))) {
        return;
    }
    a_squad = undefined;
    if (isdefined(var_4e79213273c7fb1d)) {
        a_squad = var_4e79213273c7fb1d namespace_ca7b90256548aa40::getsquadmembers();
    } else {
        var_4e79213273c7fb1d = namespace_ca7b90256548aa40::getsquadleader(teamid, squadid);
        if (isdefined(var_4e79213273c7fb1d)) {
            a_squad = var_4e79213273c7fb1d namespace_ca7b90256548aa40::getsquadmembers();
        }
    }
    if (isdefined(a_squad) && isarray(a_squad) && a_squad.size > 0) {
        item.var_d1c37d94e5043730 = spawn("script_model", item.origin);
        if (!isdefined(item.var_d1c37d94e5043730)) {
            return;
        }
        str_model = getscriptbundle("itemspawnentry:" + itembundlename).worldmodel;
        item.var_d1c37d94e5043730 setmodel(str_model);
        item.var_d1c37d94e5043730.angles = item.angles;
        item.var_d1c37d94e5043730 hide();
        if (issubstr(itembundlename, "attuned") && scripts\cp_mp\utility\game_utility::getmapname() == "mp_jup_bigmap") {
            str_fx = function_694cb9e28beb0210(itembundlename);
        }
        foreach (unknown_player in level.players) {
            if (array_contains(a_squad, unknown_player)) {
                if (unknown_player != var_4e79213273c7fb1d) {
                    item.var_d1c37d94e5043730 showtoplayer(unknown_player);
                    if (isdefined(str_fx)) {
                        playfxontagforclients(level._effect["rift_gate_item_fx_" + str_fx], item.var_d1c37d94e5043730, "tag_origin", unknown_player);
                    }
                }
                continue;
            }
            item disablescriptableplayeruse(unknown_player);
        }
    }
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x263f
// Size: 0x151
function function_694cb9e28beb0210(itembundlename) {
    if (isdefined(itembundlename)) {
        if (issubstr(itembundlename, "toxic")) {
            return "toxic";
        }
        if (issubstr(itembundlename, "ice")) {
            return "ice";
        }
        if (issubstr(itembundlename, "fire")) {
            return "fire";
        }
        if (issubstr(itembundlename, "electric")) {
            return "electric";
        }
        if (issubstr(itembundlename, "season2_targets")) {
            return "targets";
        }
        if (issubstr(itembundlename, "season2_drums")) {
            return "drums";
        }
        if (issubstr(itembundlename, "season2_mirror")) {
            return "mirror";
        }
        if (issubstr(itembundlename, "season2_gloves")) {
            return "gloves";
        }
        if (issubstr(itembundlename, "season3_crayon")) {
            return "crayon";
        }
        if (issubstr(itembundlename, "season3_giraffe")) {
            return "giraffe";
        }
        if (issubstr(itembundlename, "season3_journal")) {
            return "journal";
        }
        if (issubstr(itembundlename, "season3_laptop")) {
            return "laptop";
        }
        if (issubstr(itembundlename, "season5_giraffe")) {
            return "electric";
        }
        if (issubstr(itembundlename, "season5_diary")) {
            return "fire";
        }
        if (issubstr(itembundlename, "season5_drums")) {
            return "ice";
        }
        if (issubstr(itembundlename, "season5_peeks")) {
            return "toxic";
        }
    }
    return undefined;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2799
// Size: 0x1b8
function private function_b589440141c6678e(player, var_419535d231262698, var_7a47e4b1ec65a63c) {
    if (isdefined(player) && isdefined(var_419535d231262698) && isplayer(player)) {
        var_d3bf0c27097652c7 = undefined;
        switch (var_419535d231262698) {
        case #"hash_fa50fdf6bd8362a9":
            if (isdefined(level.var_f9faff3d5230e3ce)) {
                var_d3bf0c27097652c7 = level.var_f9faff3d5230e3ce;
            }
            break;
        case #"hash_fa50faf6bd835df0":
            if (isdefined(level.var_f9fafe3d5230e19b)) {
                var_d3bf0c27097652c7 = level.var_f9fafe3d5230e19b;
            }
            break;
        case #"hash_fa50fbf6bd835f83":
            if (isdefined(level.var_f9fafd3d5230df68)) {
                var_d3bf0c27097652c7 = level.var_f9fafd3d5230df68;
            }
            break;
        case #"hash_fa5101f6bd8368f5":
            if (isdefined(level.var_f9fb033d5230ec9a)) {
                var_d3bf0c27097652c7 = level.var_f9fb033d5230ec9a;
            }
            break;
        }
        if (isdefined(var_d3bf0c27097652c7)) {
            foreach (var_8986997b27e850da in var_d3bf0c27097652c7) {
                if (isdefined(var_8986997b27e850da)) {
                    var_8986997b27e850da disablescriptableplayeruse(player);
                    if (istrue(var_7a47e4b1ec65a63c)) {
                        if (isdefined(var_8986997b27e850da.s_pedestal)) {
                            if (isdefined(var_8986997b27e850da.s_pedestal.mdl_pedestal)) {
                                var_8986997b27e850da.s_pedestal.mdl_pedestal hidefromplayer(player);
                            }
                            if (isdefined(var_8986997b27e850da.s_pedestal.mdl_pedestal_on)) {
                                var_8986997b27e850da.s_pedestal.mdl_pedestal_on hidefromplayer(player);
                            }
                        }
                    }
                }
            }
        }
    }
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2959
// Size: 0x13f
function private function_aabd1ec8342d4794(var_5f598218fed720bd, var_cff59389275db3fc) {
    if (!(isdefined(var_5f598218fed720bd) && isdefined(var_cff59389275db3fc))) {
        println("<dev string:x1d0>");
        return;
    }
    payload = [#"teamselect", var_cff59389275db3fc getentitynumber()];
    v_spawn = self.s_pedestal.origin + anglestoup(self.s_pedestal.angles) * 38;
    itembundle = getscriptbundle("itemspawnentry:" + var_5f598218fed720bd);
    if (isdefined(itembundle)) {
        item = namespace_2abc885019e1956::function_c465d27f3f6066b4(itembundle, v_spawn, self.s_pedestal.angles, 1, 1, payload);
        if (isdefined(item)) {
            item.var_695427780354d0e5 = 1;
            item.s_pedestal = self.s_pedestal;
            item.var_ca7127f058c4cf74 = var_cff59389275db3fc.team;
            item.var_17c46414203a5da7 = var_cff59389275db3fc.sessionsquadid;
            self.var_745e910fb84e7971 = item;
            return;
        }
    }
    println("<dev string:x215>" + var_5f598218fed720bd);
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2aa0
// Size: 0x181
function private function_fb77e77aa1cd3508(var_5f598218fed720bd, var_cff59389275db3fc, var_419535d231262698) {
    if (isdefined(self.var_745e910fb84e7971)) {
        a_squad = var_cff59389275db3fc namespace_ca7b90256548aa40::getsquadmembers();
        foreach (unknown_player in level.players) {
            self.var_745e910fb84e7971 disablescriptableplayeruse(unknown_player);
            if (array_contains(a_squad, unknown_player)) {
                if (!isdefined(self.var_745e910fb84e7971.var_d1c37d94e5043730)) {
                    level thread function_dc5d83d97e8f9e9c(self.var_745e910fb84e7971, var_5f598218fed720bd, var_cff59389275db3fc, var_cff59389275db3fc.team, var_cff59389275db3fc.sessionsquadid);
                }
                if (istrue(self.var_f8431b01820e31a8)) {
                    var_c388bef108dd25df = isdefined(var_419535d231262698) && var_419535d231262698 == "s5" ? function_7e5dc4e6619f88ac(self.s_pedestal.targetname) : self.s_pedestal.targetname;
                    self setscriptablepartstate("audio", "active_" + var_c388bef108dd25df);
                    self.s_pedestal.mdl_pedestal_on showtoplayer(unknown_player);
                    self.s_pedestal.mdl_pedestal hidefromplayer(unknown_player);
                }
            }
        }
    }
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2c29
// Size: 0x8d
function private function_7e5dc4e6619f88ac(var_50ad5fd315fa5a61) {
    var_c388bef108dd25df = "off";
    switch (var_50ad5fd315fa5a61) {
    case #"hash_e4bebac3e7867ac8":
        var_c388bef108dd25df = "giraffe";
        break;
    case #"hash_2fe8e15e44ade2d7":
        var_c388bef108dd25df = "diary";
        break;
    case #"hash_49079fa46994eb6c":
        var_c388bef108dd25df = "drum";
        break;
    case #"hash_43c02a59c9eec85e":
        var_c388bef108dd25df = "peeks";
        break;
    default:
        break;
    }
    return var_c388bef108dd25df;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2cbf
// Size: 0x122
function private function_42a3e6a8375b53dc(player, var_419535d231262698, var_5a960021eaafad1c) {
    if (isdefined(player) && isdefined(var_419535d231262698) && isplayer(player)) {
        function_b589440141c6678e(player, var_419535d231262698, var_5a960021eaafad1c);
        if (isdefined(player.team) && isdefined(player.sessionsquadid)) {
            var_2f01fe73c710d488 = function_b200e7001502a482(player.team, player.sessionsquadid, var_419535d231262698);
            if (isdefined(var_2f01fe73c710d488) && isdefined(var_2f01fe73c710d488.size) && var_2f01fe73c710d488.size > 0) {
                foreach (var_c2af578dfec7b286 in var_2f01fe73c710d488) {
                    if (!function_d71a760b0589b81d(player.team, player.sessionsquadid, var_419535d231262698)) {
                        var_c2af578dfec7b286 enablescriptableplayeruse(player);
                    }
                    if (istrue(var_5a960021eaafad1c)) {
                        function_ae472ac4d2ad5228(player, var_c2af578dfec7b286, var_419535d231262698);
                    }
                }
            }
        }
        return;
    }
    println("<dev string:x256>");
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2de9
// Size: 0x153
function private function_ae472ac4d2ad5228(player, var_8986997b27e850da, var_419535d231262698) {
    if (isdefined(var_8986997b27e850da.s_pedestal) && isdefined(var_8986997b27e850da) && isdefined(player) && isdefined(var_419535d231262698)) {
        if (isdefined(var_8986997b27e850da.s_pedestal.mdl_pedestal)) {
            if (function_d71a760b0589b81d(player.team, player.sessionsquadid, var_419535d231262698) || !istrue(var_8986997b27e850da.var_f8431b01820e31a8)) {
                var_8986997b27e850da.s_pedestal.mdl_pedestal showtoplayer(player);
            } else {
                var_8986997b27e850da.s_pedestal.mdl_pedestal hidefromplayer(player);
            }
        }
        if (isdefined(var_8986997b27e850da.s_pedestal.mdl_pedestal_on)) {
            if (!function_d71a760b0589b81d(player.team, player.sessionsquadid, var_419535d231262698) && istrue(var_8986997b27e850da.var_f8431b01820e31a8)) {
                var_8986997b27e850da.s_pedestal.mdl_pedestal_on showtoplayer(player);
            } else {
                var_8986997b27e850da.s_pedestal.mdl_pedestal_on hidefromplayer(player);
            }
        }
        return;
    }
    println("<dev string:x256>");
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2f44
// Size: 0xf7
function function_21ff655d80e2e4aa(var_8986997b27e850da, var_9281831b50d55a3d, var_419535d231262698) {
    if (isdefined(var_9281831b50d55a3d) && isdefined(var_8986997b27e850da) && isdefined(var_419535d231262698) && isarray(var_9281831b50d55a3d)) {
        var_8986997b27e850da setscriptablepartstate("rift_gate_pedestal_container", "closed_usable");
        foreach (var_cd1b2eae3618a04d in level.players) {
            var_8986997b27e850da disablescriptableplayeruse(var_cd1b2eae3618a04d);
        }
        foreach (squadmember in var_9281831b50d55a3d) {
            function_bdf0c15c84f8200e(squadmember, var_8986997b27e850da, var_419535d231262698);
            var_8986997b27e850da enablescriptableplayeruse(squadmember);
        }
    }
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x3043
// Size: 0x129
function private function_bdf0c15c84f8200e(player, var_8986997b27e850da, var_419535d231262698) {
    if (isdefined(player) && isdefined(var_419535d231262698) && isplayer(player)) {
        switch (var_419535d231262698) {
        case #"hash_fa50fdf6bd8362a9":
            if (isdefined(player.var_f9faff3d5230e3ce)) {
                player.var_f9faff3d5230e3ce = function_6d6af8144a5131f1(player.var_f9faff3d5230e3ce, var_8986997b27e850da);
            }
            break;
        case #"hash_fa50faf6bd835df0":
            if (isdefined(player.var_f9fafe3d5230e19b)) {
                player.var_f9fafe3d5230e19b = function_6d6af8144a5131f1(player.var_f9fafe3d5230e19b, var_8986997b27e850da);
            }
            break;
        case #"hash_fa50fbf6bd835f83":
            if (isdefined(player.var_f9fafd3d5230df68)) {
                player.var_f9fafd3d5230df68 = function_6d6af8144a5131f1(player.var_f9fafd3d5230df68, var_8986997b27e850da);
            }
            break;
        case #"hash_fa5101f6bd8368f5":
            if (isdefined(player.var_f9fb033d5230ec9a)) {
                player.var_f9fb033d5230ec9a = function_6d6af8144a5131f1(player.var_f9fb033d5230ec9a, var_8986997b27e850da);
            }
            break;
        }
    }
    return undefined;
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3175
// Size: 0x4d
function function_2eb31b437fe134f7(playerteam, var_4b814e821394cbbb) {
    if (isdefined(playerteam) && isdefined(var_4b814e821394cbbb) && !namespace_9bb409deb69fb31d::function_be6ce63a202791c5(playerteam, var_4b814e821394cbbb, "SquadRiftGateVotingInProgress")) {
        level.squaddata[playerteam][var_4b814e821394cbbb].properties["SquadRiftGateVotingInProgress"] = 0;
    }
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x31ca
// Size: 0x48
function function_fd5211de155982af(playerteam, var_4b814e821394cbbb, value) {
    if (isdefined(playerteam) && isdefined(var_4b814e821394cbbb)) {
        function_2eb31b437fe134f7(playerteam, var_4b814e821394cbbb);
        var_35d868a4ad30ee6e = namespace_9bb409deb69fb31d::function_a20a10ce593f692b(playerteam, var_4b814e821394cbbb, "SquadRiftGateVotingInProgress", value);
    }
}

// Namespace namespace_26f804e2951e85f2 / namespace_af93597583d94051
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x321a
// Size: 0x35
function function_755c94f4a8509b03(playerteam, var_4b814e821394cbbb) {
    if (isdefined(playerteam) && isdefined(var_4b814e821394cbbb)) {
        function_2eb31b437fe134f7(playerteam, var_4b814e821394cbbb);
        return namespace_9bb409deb69fb31d::getsquaddata(playerteam, var_4b814e821394cbbb, "SquadRiftGateVotingInProgress");
    }
    return 0;
}

