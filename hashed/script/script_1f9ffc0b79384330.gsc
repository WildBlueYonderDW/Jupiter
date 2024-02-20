// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_1f9ffc0b79384330;
#using script_5d265b4fca61f070;

#namespace dialogue_wheel;

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x500
// Size: 0x228
function function_306c305b8c51b11c(options, duration, active, positions, var_6b9a984d61c9ff12, player) {
    /#
        assert(options.size > 0, "Need at least one dialogue wheel option");
    #/
    /#
        assert(options.size <= 4, "Cannot have more than 4 dialogue wheel options");
    #/
    if (!isdefined(player.dialogue_wheel)) {
        player function_1d914778ed5e4032();
    }
    if (namespace_448ccf1ca136fbbe::issp()) {
        player = level.player;
    }
    player.dialogue_wheel.options = options;
    player.dialogue_wheel.result = undefined;
    setomnvar("ui_dialogue_prompts_option_a", "none");
    setomnvar("ui_dialogue_prompts_option_b", "none");
    setomnvar("ui_dialogue_prompts_option_c", "none");
    setomnvar("ui_dialogue_prompts_option_d", "none");
    player function_544db35a3301834f();
    if (isdefined(positions)) {
        foreach (position in positions) {
            function_e61ab3e2bde6b663(options, position);
        }
    } else {
        for (position = 0; position < options.size; position++) {
            if (!(isstring(options[position]) && options[position] == "none")) {
                player function_e61ab3e2bde6b663(options, position);
            }
        }
    }
    if (!isdefined(duration)) {
        duration = 0;
    }
    player.dialogue_wheel.duration = duration;
    if (!isdefined(var_6b9a984d61c9ff12)) {
        var_6b9a984d61c9ff12 = 0;
    }
    player.dialogue_wheel.var_6b9a984d61c9ff12 = var_6b9a984d61c9ff12;
    setomnvar("ui_dialogue_prompts_duration", duration);
    if (!isdefined(active)) {
        active = 1;
    }
    if (player.dialogue_wheel.active && !active) {
        function_6f846e9519b4cff2(player);
    }
    player.dialogue_wheel.active = active;
    if (active) {
        function_ba24ddb136cbab67(player);
    }
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x72f
// Size: 0x6a
function function_e61ab3e2bde6b663(options, position) {
    /#
        assert(position >= 0 && position <= 3, "Position must be 0-3");
    #/
    omnvar = function_27cb1968e9f31a97(position);
    setomnvar(omnvar, options[position]);
    self.dialogue_wheel.inputs[position].bypass = 0;
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7a0
// Size: 0x86
function function_27cb1968e9f31a97(position) {
    omnvar = "ui_dialogue_prompts_option_";
    switch (position) {
    case 0:
        omnvar = omnvar + "a";
        break;
    case 1:
        omnvar = omnvar + "b";
        break;
    case 2:
        omnvar = omnvar + "c";
        break;
    case 3:
        omnvar = omnvar + "d";
        break;
    }
    return omnvar;
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x82e
// Size: 0x68
function function_544db35a3301834f() {
    foreach (input in self.dialogue_wheel.inputs) {
        input.bypass = 1;
    }
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x89d
// Size: 0x47
function function_20245cecf244d934(player) {
    if (!isdefined(player.dialogue_wheel)) {
        return;
    }
    if (player.dialogue_wheel.active) {
        function_6f846e9519b4cff2(player);
    }
    player.dialogue_wheel = undefined;
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8eb
// Size: 0x25
function function_ffdce2654ea23d5a() {
    if (!isdefined(self.dialogue_wheel)) {
        return 0;
    }
    return self.dialogue_wheel.active;
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x918
// Size: 0x13c
function function_ba24ddb136cbab67(player) {
    thread function_8d81c892708a5d8e(player);
    player setclientomnvar("ui_dialogue_prompts_active", 1);
    setomnvar("ui_prompt_hold_progress", 0);
    player.var_db68d53730879e4b = undefined;
    player.var_a8f8b0c2350371b = undefined;
    player function_279fb9d5f4a3d7b2();
    player.dialogue_wheel.active = 1;
    player.dialogue_wheel.var_caf1e8e3cbe08856 = player.var_33a0b6852d7ff0d;
    player.var_33a0b6852d7ff0d = 275;
    player.dialogue_wheel.var_4bdf439ffb1842c0 = 0;
    if (player.dialogue_wheel.var_4bdf439ffb1842c0) {
        foreach (input in player.dialogue_wheel.inputs) {
            input thread function_afeae0424199f820(player);
        }
    } else {
        thread function_98936c4e24c0d9fa(player);
    }
    thread function_cfe381f310a0f174(player);
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa5b
// Size: 0x535
function private function_8d81c892708a5d8e(player) {
    var_b904048b1d6b6803 = undefined;
    if (namespace_448ccf1ca136fbbe::issp()) {
        player = level.player;
    }
    while (function_ffdce2654ea23d5a()) {
        var_8c66a4561e2a3b0d = var_b904048b1d6b6803;
        var_b904048b1d6b6803 = player usinggamepad();
        if (!is_equal(var_8c66a4561e2a3b0d, var_b904048b1d6b6803)) {
            player namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("dialogue_wheel");
            if (var_b904048b1d6b6803) {
                player namespace_1cd9f6896754adb0::set("dialogue_wheel", "action_slot_weapon", 0);
                player namespace_1cd9f6896754adb0::set("dialogue_wheel", "nvg", 0);
            } else {
                cmds = [0:"+usereload", 1:"+reload", 2:"+frag", 3:"+smoke", 4:"+melee", 5:"+melee_zoom", 6:"+sprint", 7:"+sprint_zoom", 8:"+breath_sprint", 9:"+attack", 10:"+attack_akimbo_accessible", 11:"+toggleads_throw", 12:"+speed_throw", 13:"+ads_akimbo_accessible", 14:"+stance", 15:"+togglecrouch", 16:"+movedown", 17:"+gostand", 18:"+stanceup", 19:"+weapnext", 20:"+weapprev", 21:"selectweapon1", 22:"selectweapon2", 23:"selectweapon3", 24:"+actionslot 1", 25:"+actionslot 2", 26:"+actionslot 3", 27:"+actionslot 4", 28:"armor", 29:"nightvision"];
                foreach (cmd in cmds) {
                    if (function_b7d7a703c13eb1df(cmd)) {
                        switch (cmd) {
                        case #"hash_c1922905c1b7c5d4":
                            player namespace_1cd9f6896754adb0::set("dialogue_wheel", "usability", 0);
                        case #"hash_d354393c6fd7832f":
                            player namespace_1cd9f6896754adb0::set("dialogue_wheel", "reload", 0);
                            break;
                        case #"hash_203d8ea2bf3b5dda":
                            player namespace_1cd9f6896754adb0::set("dialogue_wheel", "offhand_primary_weapons", 0);
                            break;
                        case #"hash_5b56a4ba0edb6e23":
                            player namespace_1cd9f6896754adb0::set("dialogue_wheel", "offhand_secondary_weapons", 0);
                            break;
                        case #"hash_32bc9ead4c5a2ac8":
                        case #"hash_5e7d90c630bf02a2":
                            player namespace_1cd9f6896754adb0::set("dialogue_wheel", "melee", 0);
                            break;
                        case #"hash_74d3c6a203d8ce69":
                        case #"hash_c5e1746b311608aa":
                        case #"hash_fa9515aca385fed0":
                            player namespace_1cd9f6896754adb0::set("dialogue_wheel", "sprint", 0);
                            player namespace_1cd9f6896754adb0::set("dialogue_wheel", "supersprint", 0);
                            break;
                        case #"hash_145d147f72c3e226":
                        case #"hash_5c976cabc05a3229":
                            player namespace_1cd9f6896754adb0::set("dialogue_wheel", "fire", 0);
                            break;
                        case #"hash_515c29a15bc6fb56":
                        case #"hash_9ea184d2a4d36334":
                        case #"hash_a078229a756faf6f":
                            player namespace_1cd9f6896754adb0::set("dialogue_wheel", "ads", 0);
                            break;
                        case #"hash_121ff0782562a716":
                        case #"hash_23a4afdda8018a0b":
                        case #"hash_5cb36fb3342c2813":
                        case #"hash_63d4756e06dd0968":
                        case #"hash_e2df384de99a55d8":
                            switch (player getstance()) {
                            case #"hash_c6775c88e38f7803":
                                player namespace_1cd9f6896754adb0::set("dialogue_wheel", "crouch", 0);
                                player namespace_1cd9f6896754adb0::set("dialogue_wheel", "prone", 0);
                                break;
                            case #"hash_3fed0cbd303639eb":
                                player namespace_1cd9f6896754adb0::set("dialogue_wheel", "stand", 0);
                                player namespace_1cd9f6896754adb0::set("dialogue_wheel", "prone", 0);
                                break;
                            case #"hash_d91940431ed7c605":
                                player namespace_1cd9f6896754adb0::set("dialogue_wheel", "stand", 0);
                                player namespace_1cd9f6896754adb0::set("dialogue_wheel", "crouch", 0);
                                break;
                            }
                            break;
                        case #"hash_a727710e67c210ae":
                        case #"hash_adbd970961b37388":
                        case #"hash_adbd990961b376ae":
                        case #"hash_adbd9a0961b37841":
                        case #"hash_b382e36ce00ac638":
                        case #"hash_b382e86ce00ace17":
                        case #"hash_b382e96ce00acfaa":
                        case #"hash_b382ea6ce00ad13d":
                        case #"hash_f2c2aac8d326354a":
                            player namespace_1cd9f6896754adb0::set("dialogue_wheel", "weapon_switch", 0);
                            break;
                        case #"hash_25789111b74943b4":
                            player namespace_1cd9f6896754adb0::set("dialogue_wheel", "armor", 0);
                            break;
                        case #"hash_b4b26057ca84210d":
                            player namespace_1cd9f6896754adb0::set("dialogue_wheel", "nvg", 0);
                            break;
                        }
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf97
// Size: 0x41
function function_861dc23c52d31c41(var_5c76167572fce9c1, var_8c791b0ce2679fba) {
    if (!isdefined(var_5c76167572fce9c1) || !isdefined(var_8c791b0ce2679fba)) {
        return 1;
    }
    return var_8c791b0ce2679fba == 0 || !isdefined(var_5c76167572fce9c1[var_8c791b0ce2679fba - 1]) || var_5c76167572fce9c1[var_8c791b0ce2679fba - 1] == "silent";
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfe0
// Size: 0xbe
function function_6f846e9519b4cff2(player) {
    if (namespace_448ccf1ca136fbbe::issp()) {
        player = level.player;
    }
    player namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("dialogue_wheel");
    player setclientomnvar("ui_dialogue_prompts_choice", 0);
    player setclientomnvar("ui_dialogue_prompts_active", 0);
    setomnvar("ui_prompt_hold_progress", 0);
    player.var_db68d53730879e4b = undefined;
    player.var_a8f8b0c2350371b = undefined;
    player function_279fb9d5f4a3d7b2();
    player.var_33a0b6852d7ff0d = player.dialogue_wheel.var_caf1e8e3cbe08856;
    player.dialogue_wheel.var_caf1e8e3cbe08856 = undefined;
    player.dialogue_wheel.active = 0;
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10a5
// Size: 0x16
function function_3d548a32743df49b(duration) {
    self.var_9837358c0745f890 = duration;
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10c2
// Size: 0x21
function function_64c637dd115ff678(duration) {
    self.dialogue_wheel.var_6b9a984d61c9ff12 = duration;
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x10ea
// Size: 0x71
function function_d92b8b076e34f82b(options, duration, positions, player) {
    if (namespace_448ccf1ca136fbbe::issp()) {
        player = level.player;
    }
    if (!isdefined(duration) && isdefined(player.var_9837358c0745f890)) {
        duration = player.var_9837358c0745f890;
    }
    player function_306c305b8c51b11c(options, duration, 1, positions, undefined, player);
    return player function_aba526840f970cda();
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1163
// Size: 0xef
function function_dad8b67b4a097168(options, funcs, duration, positions, player) {
    if (namespace_448ccf1ca136fbbe::issp()) {
        player = level.player;
    }
    response = undefined;
    while (!isdefined(response)) {
        response = function_d92b8b076e34f82b(options, duration, positions, player);
        switch (response) {
        case 0:
            if (isdefined(level.var_10cadaa85158716a)) {
                return [[ level.var_10cadaa85158716a ]]();
            } else {
                response = undefined;
            }
            break;
        case 5:
            if (isdefined(level.var_786ebb8c8449c873)) {
                return [[ level.var_786ebb8c8449c873 ]]();
            } else {
                response = undefined;
            }
            break;
        default:
            /#
                assert(funcs.size >= response, "No associated function for response " + response);
            #/
            return [[ funcs[response - 1] ]]();
            break;
        }
        waitframe();
    }
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1259
// Size: 0x11b
function function_e6acdf1a7626587e(options, nodes, duration, player) {
    if (namespace_448ccf1ca136fbbe::issp()) {
        player = level.player;
    }
    response = undefined;
    while (!isdefined(response)) {
        response = function_d92b8b076e34f82b(options, duration, undefined, player);
        switch (response) {
        case 0:
            if (isdefined(level.var_1b2599094f1aa7a3.nodes["silence"])) {
                return level.var_1b2599094f1aa7a3.nodes["silence"];
            }
            response = undefined;
            break;
        case 5:
            if (isdefined(level.var_1b2599094f1aa7a3.nodes["attack"])) {
                return level.var_1b2599094f1aa7a3.nodes["attack"];
            }
            response = undefined;
            break;
        default:
            /#
                assert(options.size >= response, "No associated node for response " + response);
            #/
            return nodes[response - 1];
            break;
        }
        waitframe();
    }
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x137b
// Size: 0xe
function function_b7d7a703c13eb1df(binding) {
    return 1;
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1391
// Size: 0x181
function play_dialogue(aliases, var_8434387bbf43985a, var_85aedcd1aaf0a83, var_ae7efd102fc19bb5, var_bb81dd63c26df58d) {
    var_5c76167572fce9c1 = [];
    foreach (alias in aliases) {
        var_5c76167572fce9c1[var_5c76167572fce9c1.size] = var_8434387bbf43985a + alias;
    }
    positions = undefined;
    if (var_5c76167572fce9c1.size < 3) {
        positions = [0:2, 1:3];
        var_5c76167572fce9c1 = array_combine([0:"", 1:""], var_5c76167572fce9c1);
        aliases = array_combine([0:"", 1:""], aliases);
    }
    var_8c791b0ce2679fba = namespace_7248e2483812ac3c::function_d92b8b076e34f82b(var_5c76167572fce9c1, 6, positions, self);
    if (isdefined(aliases) && !namespace_7248e2483812ac3c::function_861dc23c52d31c41(var_5c76167572fce9c1, var_8c791b0ce2679fba)) {
        var_ae7efd102fc19bb5 = function_53c4c53197386572(var_ae7efd102fc19bb5, &namespace_71a239de73c38174::function_88357f565d1badf5);
        alias = aliases[var_8c791b0ce2679fba - 1];
        if (isdefined(var_bb81dd63c26df58d)) {
            if (!isarray(var_bb81dd63c26df58d)) {
                var_bb81dd63c26df58d = [0:var_bb81dd63c26df58d];
            }
            var_bb81dd63c26df58d = array_combine([0:0, 1:alias], var_bb81dd63c26df58d);
        } else {
            var_bb81dd63c26df58d = [0:0, 1:alias];
        }
        if (istrue(var_85aedcd1aaf0a83)) {
            thread namespace_71a239de73c38174::call_with_params(var_ae7efd102fc19bb5, var_bb81dd63c26df58d);
        } else {
            namespace_71a239de73c38174::call_with_params(var_ae7efd102fc19bb5, var_bb81dd63c26df58d);
        }
    }
    return var_8c791b0ce2679fba;
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x151a
// Size: 0xc5
function function_1d914778ed5e4032() {
    if (isdefined(self.dialogue_wheel)) {
        return;
    }
    self.dialogue_wheel = spawnstruct();
    self.dialogue_wheel.inputs = [0:function_53e4805c5404e4bb([0:"DPAD_LEFT", 1:"1"], 1), 1:function_53e4805c5404e4bb([0:"DPAD_RIGHT", 1:"2"], 2), 2:function_53e4805c5404e4bb([0:"DPAD_UP", 1:"3"], 3), 3:function_53e4805c5404e4bb([0:"DPAD_DOWN", 1:"4"], 4)];
    self.dialogue_wheel.active = 0;
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15e6
// Size: 0x80
function function_53e4805c5404e4bb(buttons, result) {
    struct = spawnstruct();
    struct.buttons = buttons;
    struct.result = result;
    struct.pressed = 0;
    struct.bypass = 0;
    struct.running = 0;
    struct.reset = 0;
    struct.progress = 0;
    return struct;
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x166e
// Size: 0x221
function function_98936c4e24c0d9fa(player) {
    if (namespace_448ccf1ca136fbbe::issp()) {
        player = level.player;
    }
    player endon("death");
    while (player function_ffdce2654ea23d5a()) {
        player notifyonplayercommand("option1", "+actionslot 3");
        player notifyonplayercommand("option1", "killstreak3");
        player notifyonplayercommand("option2", "+actionslot 4");
        player notifyonplayercommand("option2", "killstreak1");
        player notifyonplayercommand("option3", "+actionslot 1");
        player notifyonplayercommand("option3", "killstreak2");
        player notifyonplayercommand("option4", "+actionslot 2");
        player notifyonplayercommand("option4", "killstreak4");
        if (!istrue(player.var_a8f8b0c2350371b)) {
            input = player waittill_any_return_4("option1", "option2", "option3", "option4");
            var_49bf6cfbb891abed = player is_player_gamepad_enabled();
            selection = 0;
            switch (input) {
            case #"hash_cd4f55d4aa6a4b1f":
                selection = ter_op(var_49bf6cfbb891abed, 1, 3);
                break;
            case #"hash_cd4f56d4aa6a4cb2":
                selection = ter_op(var_49bf6cfbb891abed, 2, 1);
                break;
            case #"hash_cd4f57d4aa6a4e45":
                selection = ter_op(var_49bf6cfbb891abed, 3, 2);
                break;
            case #"hash_cd4f50d4aa6a4340":
                selection = 4;
                break;
            default:
                selection = 0;
                break;
            }
            if (selection > 0) {
                index = selection - 1;
                if (player.dialogue_wheel.inputs[index].bypass) {
                    continue;
                }
                player.dialogue_wheel.inputs[index].pressed = 1;
                if (var_49bf6cfbb891abed) {
                    setomnvar("ui_prompt_hold_progress", 1);
                }
            }
            player setclientomnvar("ui_dialogue_prompts_choice", selection);
            player.var_a8f8b0c2350371b = 1;
        } else {
            waitframe();
        }
    }
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1896
// Size: 0x305
function function_afeae0424199f820(player) {
    if (self.running) {
        return;
    }
    self.running = 1;
    while (isdefined(player.dialogue_wheel)) {
        if (self.reset) {
            self.pressed = 0;
            while (1) {
                var_e0a884d37e9a9e = 1;
                foreach (button in self.buttons) {
                    if (player buttonpressed(button)) {
                        var_e0a884d37e9a9e = 0;
                        setomnvar("ui_prompt_hold_progress", 0);
                        break;
                    }
                }
                if (var_e0a884d37e9a9e) {
                    break;
                }
                waitframe();
            }
            self.reset = 0;
        }
        pressed = 0;
        var_49bf6cfbb891abed = player is_player_gamepad_enabled();
        foreach (button in self.buttons) {
            if (player buttonpressed(button) && !self.bypass) {
                if (var_49bf6cfbb891abed && !istrue(player.var_a8f8b0c2350371b)) {
                    if (player.dialogue_wheel.var_6b9a984d61c9ff12 > 0) {
                        if (!isdefined(player.var_db68d53730879e4b) || player.var_db68d53730879e4b == button) {
                            self.progress = self.progress + player.framedurationseconds / player.dialogue_wheel.var_6b9a984d61c9ff12;
                            player setclientomnvar("ui_dialogue_prompts_choice", self.result);
                        } else {
                            self.progress = 0;
                        }
                    } else {
                        player setclientomnvar("ui_dialogue_prompts_choice", self.result);
                        self.progress = 1;
                    }
                    setomnvar("ui_prompt_hold_progress", self.progress);
                    if (self.progress >= 1) {
                        player.var_a8f8b0c2350371b = 1;
                        pressed = 1;
                        break;
                    }
                } else {
                    pressed = 1;
                    break;
                }
                player.var_db68d53730879e4b = button;
            } else if (isdefined(player.var_db68d53730879e4b) && player.var_db68d53730879e4b == button && var_49bf6cfbb891abed) {
                if (!isdefined(player.var_a8f8b0c2350371b) && self.progress > 0) {
                    self.progress = self.progress - player.framedurationseconds;
                    setomnvar("ui_prompt_hold_progress", self.progress);
                }
            }
        }
        self.pressed = pressed;
        waitframe();
    }
    self.running = 0;
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ba2
// Size: 0x92
function function_98a2a3001f683ec5(result) {
    foreach (input in self.dialogue_wheel.inputs) {
        if (input.result == result) {
            if (input.bypass) {
                return 0;
            } else {
                return input.pressed;
            }
        }
    }
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c3b
// Size: 0x82
function function_dc4eb1cb90de68ed() {
    foreach (input in self.dialogue_wheel.inputs) {
        input.reset = 1;
        input.pressed = 0;
        input.progress = 0;
    }
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc4
// Size: 0x16e
function function_cfe381f310a0f174(player) {
    end_time = undefined;
    if (player.dialogue_wheel.duration > 0) {
        end_time = gettime() + player.dialogue_wheel.duration * 1000;
    }
    player function_dc4eb1cb90de68ed();
    result = 0;
    while (player.dialogue_wheel.active && (!isdefined(end_time) || gettime() < end_time)) {
        for (i = 1; i <= player.dialogue_wheel.options.size; i++) {
            if (player function_98a2a3001f683ec5(i)) {
                result = i;
                break;
            }
        }
        if (istrue(player.var_51c2c290dfe4ada) && (player attackbuttonpressed() || player meleebuttonpressed())) {
            result = 5;
            if (istrue(player.var_c5104c6853ea5de4)) {
                result = 0;
            }
        }
        if (result > 0) {
            break;
        }
        waitframe();
    }
    if (!player.dialogue_wheel.active) {
        return;
    }
    if (result > 0 && result <= 4) {
        setomnvar("ui_dialogue_prompts_choice", result);
        wait(1.5);
    }
    player.dialogue_wheel.result = result;
    function_6f846e9519b4cff2(player);
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e39
// Size: 0x48
function function_aba526840f970cda() {
    while (self.dialogue_wheel.active && !isdefined(self.dialogue_wheel.result)) {
        waitframe();
    }
    return self.dialogue_wheel.result;
}

// Namespace dialogue_wheel/namespace_7248e2483812ac3c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e89
// Size: 0x2f
function function_279fb9d5f4a3d7b2() {
    if (isdefined(self.dialogue_wheel) && isdefined(self.dialogue_wheel.inputs)) {
        function_dc4eb1cb90de68ed();
    }
}

