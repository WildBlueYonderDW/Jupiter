// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\gameobjects.gsc;
#using script_2583ee5680cf4736;
#using script_38eb8f4be20d54f4;
#using script_7534b1d3ac3ea47a;

#namespace namespace_166fd5d99fbeb429;

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1
// Size: 0xe
function function_75d03a2a8cb2b64() {
    /#
        thread function_13ef2d3c992a2954();
    #/
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f6
// Size: 0x195
function function_aec261e207cbd04a(device, player, var_67f77763824b63fb, var_bd16f0d97883fd8d, var_d8ae21ee61622b1c) {
    if (!isdefined(var_d8ae21ee61622b1c)) {
        var_d8ae21ee61622b1c = 1;
    }
    if (!function_9eb59ca699681ccb(device)) {
        return 0;
    }
    if (isdefined(player.using_device) && istrue(player.using_device)) {
        return 0;
    }
    player setclientomnvar("ui_hackingdevice_state", -1);
    player.using_device = 1;
    if (isdefined(var_bd16f0d97883fd8d)) {
        var_bd16f0d97883fd8d makeunusable();
    }
    device = function_7ad811954bb2f1c6(device, player, var_d8ae21ee61622b1c);
    player setclientomnvar("ui_hackingdevice_state", 0);
    thread function_2a27403675796f41(player);
    thread function_f3f4132cb28e3739(player, var_67f77763824b63fb);
    thread function_c01611fbd560866e(player);
    buttontime = 0;
    while (buttontime < var_67f77763824b63fb) {
        if (istrue(player.var_486734ff3e32a3a) || !isalive(player) || isdefined(player.var_2ca0dac193d83c1) && player.var_2ca0dac193d83c1) {
            player namespace_8b68a49ebf57ab74::getridofweapon(device);
            player function_26f48c219f97a889();
            if (isdefined(var_bd16f0d97883fd8d)) {
                var_bd16f0d97883fd8d makeusable();
            }
            player.using_device = 0;
            return 0;
        }
        buttontime = buttontime + level.framedurationseconds;
        waitframe();
    }
    player namespace_8b68a49ebf57ab74::getridofweapon(device);
    if (isdefined(player)) {
        player notifyonplayercommandremove("cancel", "+weapnext");
        player notifyonplayercommandremove("cancel", "-weapnext");
    }
    player function_26f48c219f97a889();
    player.using_device = 0;
    player notify("interaction_complete");
    return 1;
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x393
// Size: 0x1f
function private function_9eb59ca699681ccb(device) {
    if (!utility::is_equal(device, "jup_hacking_device_ob")) {
        return 0;
    }
    return 1;
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ba
// Size: 0x60
function private function_7ad811954bb2f1c6(device, player, var_d8ae21ee61622b1c) {
    var_6ad851378cb1e07f = makeweapon(device);
    player namespace_8b68a49ebf57ab74::_giveweapon(var_6ad851378cb1e07f, undefined, undefined, 0);
    player setweaponammostock(var_6ad851378cb1e07f, 0);
    player setweaponammoclip(var_6ad851378cb1e07f, 0);
    player function_2d339ccf11a6db49(var_d8ae21ee61622b1c);
    player gameobjects::switchtouseweapon(var_6ad851378cb1e07f, 1);
    return var_6ad851378cb1e07f;
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x422
// Size: 0x83
function private function_2d339ccf11a6db49(var_e9dda49148a0d090) {
    if (var_e9dda49148a0d090) {
        val::set("using_device", "allow_movement", 0);
        val::set("using_device", "allow_jump", 0);
    }
    val::set("using_device", "equipment_primary", 0);
    val::set("using_device", "equipment_secondary", 0);
    val::set("using_device", "gesture", 0);
    val::set("using_device", "weapon_pickup", 0);
    self function_35501b42058d4de9();
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ac
// Size: 0x24
function private function_26f48c219f97a889() {
    val::function_c9d0b43701bdba00("using_device");
    self function_bb04491d50d9e43e();
    self setclientomnvar("ui_hackingdevice_state", -1);
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d7
// Size: 0x8b
function private function_c01611fbd560866e(player) {
    player endon("interaction_complete");
    player endon("death");
    player notifyonplayercommand("cancel", "+weapnext");
    player notifyonplayercommand("cancel", "-weapnext");
    player.var_486734ff3e32a3a = 0;
    player waittill_any_2("cancel", "super_use_started");
    player.var_486734ff3e32a3a = 1;
    player notifyonplayercommandremove("cancel", "+weapnext");
    player notifyonplayercommandremove("cancel", "-weapnext");
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x569
// Size: 0xa2
function function_3cec1b2981075936(var_aa148c7d8b42232a, scriptable, on_use_function, var_81adce70ad13cf33, var_f3bf6e6da951239b, var_67f77763824b63fb) {
    scriptable.var_aa148c7d8b42232a = var_aa148c7d8b42232a;
    scriptable.on_use_function = on_use_function;
    scriptable.var_81adce70ad13cf33 = var_81adce70ad13cf33;
    scriptable.var_f3bf6e6da951239b = var_f3bf6e6da951239b;
    scriptable = interaction::function_32645103f7520635(scriptable, &function_3cd671ed8c469f52, &function_e4571272ae008ea7, &function_d562e8fefd4e2fb);
    scriptable interaction::function_9a0883b5a0999dac();
    scriptable.var_2c8b529b40457e20 = [];
    scriptable.var_67f77763824b63fb = var_67f77763824b63fb;
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x612
// Size: 0x42
function function_e9aa849fed70470d(origin, angles) {
    angles = function_53c4c53197386572(angles, (0, 0, 0));
    var_fb888835c117c2e = spawnscriptable("ob_hacking_device_default", origin, angles);
    return var_fb888835c117c2e;
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x65c
// Size: 0x1a5
function private function_d562e8fefd4e2fb(player) {
    player endon("interaction_complete");
    thread function_ff435575adff1b0f(player);
    if (isdefined(self.var_f3bf6e6da951239b)) {
        thread [[ self.var_f3bf6e6da951239b ]](player);
    }
    if (!function_9eb59ca699681ccb(self.var_aa148c7d8b42232a)) {
        return 0;
    }
    if (isdefined(player.using_device) && istrue(player.using_device)) {
        return 0;
    }
    player setclientomnvar("ui_hackingdevice_state", -1);
    player.using_device = 1;
    self.var_7eed2f9905632fd7 = 0;
    device = function_7ad811954bb2f1c6(self.var_aa148c7d8b42232a, player, 1);
    self.var_2c8b529b40457e20 = array_add(self.var_2c8b529b40457e20, player);
    player setclientomnvar("ui_hackingdevice_state", 0);
    thread function_2a27403675796f41(player);
    thread function_f3f4132cb28e3739(player, self.var_67f77763824b63fb);
    self.var_2b37e5554c33ef0b = 0;
    wait(0.2);
    while (!istrue(self.var_7eed2f9905632fd7)) {
        if (!isalive(player) || isdefined(player.var_2ca0dac193d83c1) && player.var_2ca0dac193d83c1 || istrue(player.var_486734ff3e32a3a)) {
            self disablescriptableplayeruse(player);
            player namespace_8b68a49ebf57ab74::getridofweapon(device, 1);
            player function_26f48c219f97a889();
            player.using_device = 0;
            self.var_2b37e5554c33ef0b = 1;
            self.var_2c8b529b40457e20 = array_remove(self.var_2c8b529b40457e20, player);
            wait(0.5);
            self enablescriptableplayeruse(player);
            return;
        }
        waitframe();
    }
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x808
// Size: 0x4e
function private function_2a27403675796f41(player, var_ddad3435bff34bfe) {
    if (!isdefined(var_ddad3435bff34bfe)) {
        var_ddad3435bff34bfe = 0.65;
    }
    player endon("cancel");
    player endon("super_use_started");
    wait(var_ddad3435bff34bfe);
    if (!istrue(player.var_486734ff3e32a3a)) {
        player setclientomnvar("ui_hackingdevice_state", 1);
    }
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x85d
// Size: 0x51
function private function_f3f4132cb28e3739(player, var_9ec962b61582c0b8) {
    if (!isdefined(var_9ec962b61582c0b8)) {
        var_9ec962b61582c0b8 = 2;
    }
    player endon("cancel");
    player endon("super_use_started");
    wait(var_9ec962b61582c0b8 - 0.65);
    if (!istrue(player.var_486734ff3e32a3a)) {
        player setclientomnvar("ui_hackingdevice_state", 2);
    }
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8b5
// Size: 0x26
function private function_e4571272ae008ea7(player) {
    if (isdefined(self.var_81adce70ad13cf33)) {
        [[ self.var_81adce70ad13cf33 ]](player);
    }
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8e2
// Size: 0x22b
function private function_3cd671ed8c469f52(player) {
    self.var_7eed2f9905632fd7 = 1;
    player notify("interaction_complete");
    if (isarray(self.var_2c8b529b40457e20)) {
        foreach (player_check in self.var_2c8b529b40457e20) {
            if (!is_equal(player_check, player)) {
                player notify("cancel");
            }
        }
    }
    if (isdefined(self.on_use_function)) {
        thread [[ self.on_use_function ]](player);
    }
    if (isdefined(self.var_ce27baf629c783b8) && self.var_ce27baf629c783b8) {
        self setscriptablepartstate("interact", "unusable");
    }
    var_b314247c470b4954 = getdvarint(@"hash_7c14bd5d6a04f082", 1);
    player namespace_8b68a49ebf57ab74::getridofweapon(self.var_aa148c7d8b42232a, var_b314247c470b4954);
    if (isdefined(player)) {
        player notifyonplayercommandremove("cancel", "-usereload");
        player notifyonplayercommandremove("cancel", "-activate");
    }
    player function_26f48c219f97a889();
    player.using_device = 0;
    if (isarray(self.var_2c8b529b40457e20)) {
        if (isplayer(player) && array_contains(self.var_2c8b529b40457e20, player)) {
            self.var_2c8b529b40457e20 = array_remove(self.var_2c8b529b40457e20, player);
        }
        if (self.var_2c8b529b40457e20.size > 0) {
            foreach (var_6662380a60401dbf in self.var_2c8b529b40457e20) {
                var_6662380a60401dbf function_70946e24f54d3f1a(self.var_aa148c7d8b42232a);
            }
            self.var_2c8b529b40457e20 = [];
        }
    }
    if (isdefined(self.var_ce27baf629c783b8) && self.var_ce27baf629c783b8) {
        self freescriptable();
    }
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb14
// Size: 0xb5
function private function_ff435575adff1b0f(player) {
    player endon("interaction_complete");
    player endon("death");
    player.var_486734ff3e32a3a = 0;
    player notifyonplayercommand("cancel", "-usereload");
    player notifyonplayercommand("cancel", "-activate");
    if (player usebuttonpressed(1)) {
        player waittill_any_2("cancel", "super_use_started");
        player.var_486734ff3e32a3a = 1;
    } else {
        player.var_486734ff3e32a3a = 1;
    }
    player setclientomnvar("ui_hackingdevice_state", -1);
    player notifyonplayercommandremove("cancel", "-usereload");
    player notifyonplayercommandremove("cancel", "-activate");
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd0
// Size: 0x82
function function_70946e24f54d3f1a(var_e6560b7a88a9d976) {
    if (isdefined(self.using_device)) {
        if (!self.using_device) {
            return;
        }
        device = makeweapon(var_e6560b7a88a9d976);
        if (self.currentweapon == device) {
            namespace_8b68a49ebf57ab74::getridofweapon(device, 1);
            self notifyonplayercommandremove("cancel", "-usereload");
            self notifyonplayercommandremove("cancel", "-activate");
            function_26f48c219f97a889();
            self.using_device = 0;
        }
    }
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc59
// Size: 0x89
function function_a7ed9b756a764621(var_aa148c7d8b42232a, var_22e1dd3e25642d69, var_28f03cd0fca2c176, on_use_function, var_81adce70ad13cf33, var_f3bf6e6da951239b) {
    if (!isdefined(var_28f03cd0fca2c176)) {
        var_28f03cd0fca2c176 = "ob_anim_interact";
    }
    var_621e019ea4ee3223 = spawnscriptable(var_28f03cd0fca2c176, var_22e1dd3e25642d69);
    while (!isdefined(var_621e019ea4ee3223)) {
        waitframe();
    }
    var_621e019ea4ee3223 setscriptablepartstate("interact", "usable");
    var_621e019ea4ee3223.var_ce27baf629c783b8 = 1;
    function_3cec1b2981075936(var_aa148c7d8b42232a, var_621e019ea4ee3223, on_use_function, var_81adce70ad13cf33, var_f3bf6e6da951239b);
    return var_621e019ea4ee3223;
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcea
// Size: 0x55
function function_13ef2d3c992a2954(params) {
    /#
        wait(5);
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_e0a739780149a4c3, 1);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_dd51ec3ef232fe0f, 1);
        devgui::function_fe953f000498048f();
    #/
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd46
// Size: 0x32
function function_e0a739780149a4c3(params) {
    /#
        var_5738b32c08d8eef9 = namespace_29b5250e9959ea::function_aec261e207cbd04a("<unknown string>", level.players[0], 2);
    #/
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd7f
// Size: 0x87
function function_dd51ec3ef232fe0f(params) {
    /#
        if (isdefined(level.var_46aae20c1089909c)) {
            level.var_46aae20c1089909c freescriptable();
            level.var_46aae20c1089909c notify("<unknown string>");
        }
        level.var_46aae20c1089909c = function_e9aa849fed70470d(level.players[0].origin + (30, 30, 0));
        namespace_29b5250e9959ea::function_3cec1b2981075936("<unknown string>", level.var_46aae20c1089909c, &function_a0cf72fa5939f30b);
    #/
}

// Namespace namespace_166fd5d99fbeb429/namespace_29b5250e9959ea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe0d
// Size: 0xf
function function_a0cf72fa5939f30b(params) {
    /#
    #/
}

