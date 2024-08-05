#using script_72ef6b9f0cf1f55a;
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\scene.gsc;
#using scripts\common\values.gsc;
#using script_5d265b4fca61f070;
#using scripts\engine\sp\utility.gsc;
#using script_39b1f0d056a0c138;
#using scripts\common\ui.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\player\cursor_hint.gsc;
#using script_7d535542e36d66f9;
#using script_7921358c02f87a25;

#namespace dialog_tree;

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x942
// Size: 0xce
function private autoexec function_85c4374b5e2ec4b1() {
    level.var_53e726a5ce0f4530 = [];
    level.var_53e726a5ce0f4530["none"] = undefined;
    level.var_53e726a5ce0f4530["slight_zoom"] = 55;
    level.var_53e726a5ce0f4530["zoom"] = 45;
    level.var_53e726a5ce0f4530["more_zoom"] = 35;
    level.var_53e726a5ce0f4530["extreme_zoom"] = 25;
    level.var_7c1687cb471e91d2 = [];
    level.var_daa9346aafb503a2["close"] = 1;
    level.var_daa9346aafb503a2["medium"] = 2.8;
    flag_init("dialog_tree_active");
    flag_init("prompts_disabled");
    scripts\common\ui::lui_registercallback("dialog_tree_option_selected", &function_26cc8ab8ee78d07f);
    scripts\common\ui::lui_registercallback("dialog_tree_request_skip", &function_e70848b1ace60b2d);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0xa18
// Size: 0x18f
function function_802546f2a3f6f8ca(enter_func, exit_func, allow_movement, allow_weapon, script_bundle, var_7c495f86e82a2621, timeout, skippable, var_ed0fcbcd5f033f98) {
    if (!isdefined(allow_movement)) {
        allow_movement = 0;
    }
    if (!isdefined(allow_weapon)) {
        allow_weapon = 0;
    }
    if (!isdefined(var_7c495f86e82a2621)) {
        var_7c495f86e82a2621 = 1;
    }
    if (!isdefined(timeout)) {
        timeout = 0;
    }
    if (!isdefined(skippable)) {
        skippable = 1;
    }
    if (!isdefined(var_ed0fcbcd5f033f98)) {
        var_ed0fcbcd5f033f98 = 1;
    }
    var_ac487100f8766a06 = spawnstruct();
    var_ac487100f8766a06.var_28ac3afdf36f413d = 0;
    var_ac487100f8766a06.player_pos = [];
    var_ac487100f8766a06.enter_func = enter_func;
    var_ac487100f8766a06.exit_func = exit_func;
    var_ac487100f8766a06.allow_movement = allow_movement;
    var_ac487100f8766a06.allow_weapon = allow_weapon;
    var_ac487100f8766a06.var_7c495f86e82a2621 = var_7c495f86e82a2621;
    var_ac487100f8766a06.timeout = timeout;
    var_ac487100f8766a06.skippable = skippable;
    var_ac487100f8766a06.var_ed0fcbcd5f033f98 = var_ed0fcbcd5f033f98;
    var_ac487100f8766a06.var_b11619776bfbfa3a = 0;
    var_ac487100f8766a06.options = [];
    var_ac487100f8766a06.position = (1224, 650, 0);
    var_ac487100f8766a06.state_index = 0;
    var_ac487100f8766a06.var_7a7fad7e2ff2c684 = 0;
    var_ac487100f8766a06.var_6d8359c75fd25cf8 = %T10_DIALOG_TREE/NOT_SAFE_FOR_CONVERSATION;
    var_ac487100f8766a06 set_scriptbundle(script_bundle);
    var_ac487100f8766a06.var_ae6649775a3f3762 = 0;
    return var_ac487100f8766a06;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbb0
// Size: 0x96
function set_scriptbundle(bundle, var_b5c75fc7489c4ef5, var_54e7225e3f7ea0ba) {
    if (isdefined(bundle)) {
        if (isstring(bundle)) {
            self.scriptbundle = bundle;
        } else if (isdefined(bundle.var_8ac77218f7a34e3e)) {
            self.scriptbundle = bundle.var_8ac77218f7a34e3e;
        } else {
            assert("dialog_tree: set_scriptbundle: Invalid script bundle parameter: " + bundle);
        }
        self.var_ea8cafa6b0eb06c7 = var_b5c75fc7489c4ef5;
    }
    if (isdefined(var_54e7225e3f7ea0ba)) {
        if (!isarray(var_54e7225e3f7ea0ba)) {
            var_54e7225e3f7ea0ba = [var_54e7225e3f7ea0ba];
        }
        self.var_54e7225e3f7ea0ba = var_54e7225e3f7ea0ba;
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc4e
// Size: 0x3d
function function_ddef287c20089430(var_fdf147e36d51ad1b, player_positions) {
    function_efafec9a80234daa(var_fdf147e36d51ad1b);
    self.var_ae6302f7f057e26f = var_fdf147e36d51ad1b;
    self.var_2c6249da4d27ca4e = player_positions;
    self.var_78db940d2989f211 = spawnstruct();
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0xc93
// Size: 0x85
function function_2696432cc4ef27a4(var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9) {
    if (!isdefined(end_dialog)) {
        end_dialog = 0;
    }
    option = function_90cdd85860a9e8df(undefined, var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, undefined, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9);
    return function_896a08d617c4a4e4(option);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0xd21
// Size: 0x85
function function_26412a0fc619f981(var_176104ebd5b06dab, var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9) {
    option = function_90cdd85860a9e8df(undefined, var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, var_176104ebd5b06dab, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9);
    return function_896a08d617c4a4e4(option);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 13, eflags: 0x0
// Checksum 0x0, Offset: 0xdaf
// Size: 0xa5
function function_db717f41559f6cab(var_f76e8406f0920af2, var_251b1b5ad40a075d, reset, var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9) {
    if (!isdefined(reset)) {
        reset = 1;
    }
    option = function_90cdd85860a9e8df(undefined, var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, undefined, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9, 0, var_f76e8406f0920af2, var_251b1b5ad40a075d, reset);
    return function_896a08d617c4a4e4(option);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0xe5d
// Size: 0xa2
function function_eb25fb6b87dd57d3(var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9) {
    var_e9a574a5ef884c9d = self.options.size - 1;
    option = function_90cdd85860a9e8df(var_e9a574a5ef884c9d, var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, undefined, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9);
    option.active = 0;
    return function_896a08d617c4a4e4(option);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0xf08
// Size: 0x92
function function_82c7d1482d815396(var_e9a574a5ef884c9d, var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9) {
    option = function_90cdd85860a9e8df(var_e9a574a5ef884c9d, var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, undefined, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9);
    option.active = 0;
    return function_896a08d617c4a4e4(option);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0xfa3
// Size: 0xab
function function_a7b448f1ff4bdf88(var_176104ebd5b06dab, var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9) {
    var_e9a574a5ef884c9d = self.options.size - 1;
    option = function_90cdd85860a9e8df(var_e9a574a5ef884c9d, var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, var_176104ebd5b06dab, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9);
    option.active = 0;
    return function_896a08d617c4a4e4(option);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0x1057
// Size: 0x9b
function function_8495817a14e39bcf(var_e9a574a5ef884c9d, var_176104ebd5b06dab, var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9) {
    option = function_90cdd85860a9e8df(var_e9a574a5ef884c9d, var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, var_176104ebd5b06dab, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9);
    option.active = 0;
    return function_896a08d617c4a4e4(option);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 14, eflags: 0x0
// Checksum 0x0, Offset: 0x10fb
// Size: 0xbb
function function_694b58fb71ff8739(var_e9a574a5ef884c9d, var_f76e8406f0920af2, var_251b1b5ad40a075d, reset, var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9) {
    if (!isdefined(reset)) {
        reset = 1;
    }
    option = function_90cdd85860a9e8df(var_e9a574a5ef884c9d, var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, undefined, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9, 0, var_f76e8406f0920af2, var_251b1b5ad40a075d, reset);
    option.active = 0;
    return function_896a08d617c4a4e4(option);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11bf
// Size: 0x48
function function_836a91a25a0959ea(var_97e020544f563db8, end_dialog) {
    if (!isdefined(end_dialog)) {
        end_dialog = 1;
    }
    if (!isdefined(var_97e020544f563db8)) {
        var_97e020544f563db8 = self.options.size - 1;
    }
    self.options[var_97e020544f563db8].end_dialog = end_dialog;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x120f
// Size: 0x60
function function_20db3ae16c16a034(var_97e020544f563db8, var_efa1ab49708bcee5) {
    if (!isdefined(var_efa1ab49708bcee5)) {
        var_efa1ab49708bcee5 = 1;
    }
    if (!isdefined(var_97e020544f563db8)) {
        var_97e020544f563db8 = self.options.size - 1;
    }
    self.options[var_97e020544f563db8].end_dialog = 1;
    self.options[var_97e020544f563db8].var_efa1ab49708bcee5 = var_efa1ab49708bcee5;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1277
// Size: 0x42
function function_ad302d4c644188ca(var_97e020544f563db8) {
    if (!isdefined(var_97e020544f563db8)) {
        var_97e020544f563db8 = self.options.size - 1;
    }
    self.options[var_97e020544f563db8].var_2180d498dd0472c2 = 1;
    self.var_b11619776bfbfa3a = 1;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12c1
// Size: 0xb2
function function_985eb5a1a4780d17(var_31e67aee2e18b4b1, var_97e020544f563db8) {
    var_97e020544f563db8 = function_efa6071d5c0c7cf6(var_97e020544f563db8);
    assertex(!isdefined(self.options[var_97e020544f563db8].var_79a2e334ef20037c) && !isdefined(self.options[var_97e020544f563db8].var_e4ef57c233595c4c), "option_unlock_on_all_flags called on an option with activation flag(s) already set!");
    self.options[var_97e020544f563db8].locked = 1;
    if (isarray(var_31e67aee2e18b4b1)) {
        self.options[var_97e020544f563db8].var_79a2e334ef20037c = var_31e67aee2e18b4b1;
        return;
    }
    self.options[var_97e020544f563db8].var_79a2e334ef20037c = [var_31e67aee2e18b4b1];
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x137b
// Size: 0xb2
function function_fe57780a219892e1(var_31e67aee2e18b4b1, var_97e020544f563db8) {
    var_97e020544f563db8 = function_efa6071d5c0c7cf6(var_97e020544f563db8);
    assertex(!isdefined(self.options[var_97e020544f563db8].var_79a2e334ef20037c) && !isdefined(self.options[var_97e020544f563db8].var_e4ef57c233595c4c), "option_unlock_on_any_flag called on an option with activation flag(s) already set!");
    self.options[var_97e020544f563db8].locked = 1;
    if (isarray(var_31e67aee2e18b4b1)) {
        self.options[var_97e020544f563db8].var_e4ef57c233595c4c = var_31e67aee2e18b4b1;
        return;
    }
    self.options[var_97e020544f563db8].var_e4ef57c233595c4c = [var_31e67aee2e18b4b1];
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1435
// Size: 0x9a
function function_409b8682ff1c1175(var_31e67aee2e18b4b1, var_97e020544f563db8) {
    var_97e020544f563db8 = function_efa6071d5c0c7cf6(var_97e020544f563db8);
    assertex(!isdefined(self.options[var_97e020544f563db8].var_9e70d6ccc832341) && !isdefined(self.options[var_97e020544f563db8].var_43d0b8282bd404df), "option_repeat_until_all_flags called on an option with repeat flag(s) already set!");
    if (isarray(var_31e67aee2e18b4b1)) {
        self.options[var_97e020544f563db8].var_9e70d6ccc832341 = var_31e67aee2e18b4b1;
        return;
    }
    self.options[var_97e020544f563db8].var_9e70d6ccc832341 = [var_31e67aee2e18b4b1];
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14d7
// Size: 0x9a
function function_7836816fa6ccc853(var_31e67aee2e18b4b1, var_97e020544f563db8) {
    var_97e020544f563db8 = function_efa6071d5c0c7cf6(var_97e020544f563db8);
    assertex(!isdefined(self.options[var_97e020544f563db8].var_9e70d6ccc832341) && !isdefined(self.options[var_97e020544f563db8].var_43d0b8282bd404df), "option_repeat_until_any_flag called on an option with repeat flag(s) already set!");
    if (isarray(var_31e67aee2e18b4b1)) {
        self.options[var_97e020544f563db8].var_43d0b8282bd404df = var_31e67aee2e18b4b1;
        return;
    }
    self.options[var_97e020544f563db8].var_43d0b8282bd404df = [var_31e67aee2e18b4b1];
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1579
// Size: 0x37
function function_3c28bcef9ae8e464(var_97e020544f563db8) {
    if (!isdefined(var_97e020544f563db8)) {
        var_97e020544f563db8 = self.options.size - 1;
    }
    self.options[var_97e020544f563db8].important = 1;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15b8
// Size: 0x37
function function_431f560b1728a0cd(var_97e020544f563db8) {
    if (!isdefined(var_97e020544f563db8)) {
        var_97e020544f563db8 = self.options.size - 1;
    }
    self.options[var_97e020544f563db8].var_6c2ca93aac17e873 = 1;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x15f7
// Size: 0x1ee
function function_b67633ee02ae6b2(var_97e020544f563db8, var_9a5c68dcc5c8bd6d, var_9fb9aa3e99cbaaa3, var_5b729f094c82d3fe, anims) {
    if (!isdefined(var_97e020544f563db8)) {
        var_97e020544f563db8 = self.options.size - 1;
    }
    if (!isdefined(var_9a5c68dcc5c8bd6d)) {
        var_9a5c68dcc5c8bd6d = 0;
    }
    if (!isdefined(var_9fb9aa3e99cbaaa3)) {
        var_9fb9aa3e99cbaaa3 = "loop";
    }
    if (!isdefined(var_5b729f094c82d3fe)) {
        var_5b729f094c82d3fe = 1;
    }
    if (!isdefined(anims)) {
        anims = 1;
    }
    self.options[var_97e020544f563db8].var_9fb9aa3e99cbaaa3 = var_9fb9aa3e99cbaaa3;
    if (var_5b729f094c82d3fe) {
        if (isdefined(self.options[var_97e020544f563db8].var_b2be5c0f00bdc222)) {
            if (!isarray(self.options[var_97e020544f563db8].var_b2be5c0f00bdc222)) {
                self.options[var_97e020544f563db8].var_b2be5c0f00bdc222 = [self.options[var_97e020544f563db8].var_b2be5c0f00bdc222];
            }
            if (var_9a5c68dcc5c8bd6d) {
                self.options[var_97e020544f563db8].var_6f4f18042c9479e1 = randomint(self.options[var_97e020544f563db8].var_b2be5c0f00bdc222.size);
            } else {
                self.options[var_97e020544f563db8].var_6f4f18042c9479e1 = 0;
            }
        }
    }
    if (anims) {
        if (isdefined(self.options[var_97e020544f563db8].var_5ab01cd2ebcf1604)) {
            if (!isarray(self.options[var_97e020544f563db8].var_5ab01cd2ebcf1604)) {
                self.options[var_97e020544f563db8].var_5ab01cd2ebcf1604 = [self.options[var_97e020544f563db8].var_5ab01cd2ebcf1604];
            }
            if (var_9a5c68dcc5c8bd6d) {
                self.options[var_97e020544f563db8].var_5da09cbbc19fc673 = randomint(self.options[var_97e020544f563db8].var_5ab01cd2ebcf1604.size);
                return;
            }
            self.options[var_97e020544f563db8].var_5da09cbbc19fc673 = 0;
        }
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17ed
// Size: 0x44
function function_787240d6c2742ddc(message, var_2910bcf7078c9f81) {
    self.var_7a7fad7e2ff2c684 = 1;
    if (isdefined(message)) {
        self.var_6d8359c75fd25cf8 = message;
    }
    if (isdefined(var_2910bcf7078c9f81)) {
        flag_wait(var_2910bcf7078c9f81);
        self.var_7a7fad7e2ff2c684 = 0;
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1839
// Size: 0xc
function function_dc13a584a0aa03f9() {
    self.var_7a7fad7e2ff2c684 = 0;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x184d
// Size: 0x53
function function_b4bb4d1ddabc5697(dialog_tree, var_c7db93f999bd20d8) {
    assert(isdefined(dialog_tree) && isarray(var_c7db93f999bd20d8) && isint(var_c7db93f999bd20d8[0]) && isint(var_c7db93f999bd20d8[1]), "position2D must be an array of integer values");
    dialog_tree.position = var_c7db93f999bd20d8;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18a8
// Size: 0x15
function function_603c5988986065f9(state_index) {
    self.state_index = state_index;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0x18c5
// Size: 0x187
function function_20c528b5c4f4eac1(var_2465f58882c851b9, var_5df695ba8d6a39fb, var_8b9d7241bd481e99, var_d35bbd317ecfb67b, var_6874582d5c9ff240, stance, fov, dof, lerptime, var_53accda7a1822a74, var_c8618f0ebefdd30a, var_d08c1f65483c0d7f) {
    if (!isdefined(stance)) {
        stance = "stand";
    }
    if (!isdefined(fov)) {
        fov = "more_zoom";
    }
    if (!isdefined(dof)) {
        dof = "medium";
    }
    if (!isdefined(lerptime)) {
        lerptime = 2;
    }
    if (!isdefined(var_53accda7a1822a74)) {
        var_53accda7a1822a74 = "left";
    }
    new_pos = spawnstruct();
    new_pos.var_2465f58882c851b9 = var_2465f58882c851b9;
    if (isdefined(var_2465f58882c851b9)) {
        new_pos.origin = var_2465f58882c851b9.origin;
    }
    new_pos.var_5df695ba8d6a39fb = var_5df695ba8d6a39fb;
    new_pos.var_26380da9bb0a366 = var_8b9d7241bd481e99;
    new_pos.var_d35bbd317ecfb67b = var_d35bbd317ecfb67b;
    new_pos.var_6874582d5c9ff240 = var_6874582d5c9ff240;
    new_pos.stance = stance;
    new_pos.fov = fov;
    new_pos.dof = dof;
    new_pos.lerptime = lerptime;
    new_pos.var_9123067972d392c7 = var_53accda7a1822a74;
    new_pos.var_c8618f0ebefdd30a = var_c8618f0ebefdd30a;
    new_pos.var_d08c1f65483c0d7f = var_d08c1f65483c0d7f;
    self.player_pos[self.player_pos.size] = new_pos;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1a54
// Size: 0x4f
function function_fa2f61f680989e86(vo_line, var_ee94080f12348d8a, var_62917efdd761c125, actor) {
    assert(isdefined(vo_line), "add_greeting called with no vo_line!");
    self.var_b4bb08e971c5bef3 = function_5b314449d3e0df23(self.var_b4bb08e971c5bef3, vo_line, var_ee94080f12348d8a, var_62917efdd761c125, actor);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1aab
// Size: 0x4f
function function_f5c480aca0b8155d(vo_line, var_ee94080f12348d8a, var_62917efdd761c125, actor) {
    assert(isdefined(vo_line), "add_exhaustion called with no vo_line!");
    self.var_726cfe4c7e9ec556 = function_5b314449d3e0df23(self.var_726cfe4c7e9ec556, vo_line, var_ee94080f12348d8a, var_62917efdd761c125, actor);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b02
// Size: 0x1e
function function_38c59761063c03eb(exhausted) {
    if (!isdefined(exhausted)) {
        exhausted = 1;
    }
    self.exhausted = exhausted;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b28
// Size: 0x3d
function function_c2ebc6a384126d7() {
    var_facd509222059348 = 0;
    if (isdefined(self.exhausted) && self.exhausted == 1 || function_3041b446fbb7cebe(1) <= var_facd509222059348) {
        return true;
    }
    return false;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b6e
// Size: 0x2d
function function_f90abf1b067d49a7(var_36e52d9011ebb465) {
    self.var_11edd59c0112e599 = function_9f1af335b72ba436(self.var_b4bb08e971c5bef3, self.var_11edd59c0112e599, var_36e52d9011ebb465);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ba3
// Size: 0x48
function function_a61e244dd0bb1ae4(var_36e52d9011ebb465) {
    if (isdefined(self.var_726cfe4c7e9ec556) && function_c2ebc6a384126d7()) {
        self.var_7818a30c28de7142 = function_9f1af335b72ba436(self.var_726cfe4c7e9ec556, self.var_7818a30c28de7142, var_36e52d9011ebb465);
        return true;
    }
    return false;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x1bf4
// Size: 0x8d
function private function_5b314449d3e0df23(var_efe1c4b2620f108, vo_line, var_ee94080f12348d8a, var_62917efdd761c125, actor) {
    var_88318301272d82da = spawnstruct();
    var_88318301272d82da.vo_line = vo_line;
    if (isdefined(var_ee94080f12348d8a)) {
        var_88318301272d82da.var_cd5374c65761a5f6 = var_ee94080f12348d8a;
    }
    if (isdefined(var_62917efdd761c125)) {
        var_88318301272d82da.post_delay = var_62917efdd761c125;
    }
    if (isdefined(actor)) {
        var_88318301272d82da.actor = actor;
    }
    if (!isdefined(var_efe1c4b2620f108)) {
        var_efe1c4b2620f108 = [];
    }
    var_efe1c4b2620f108[var_efe1c4b2620f108.size] = var_88318301272d82da;
    return var_efe1c4b2620f108;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1c8a
// Size: 0x13a
function private function_9f1af335b72ba436(var_efe1c4b2620f108, var_24bc875dca80abdd, var_36e52d9011ebb465) {
    if (!isdefined(var_efe1c4b2620f108)) {
        return -1;
    }
    if (!isdefined(var_24bc875dca80abdd)) {
        var_24bc875dca80abdd = -1;
    }
    var_24bc875dca80abdd = function_4c99d8252f8b3ae6(var_24bc875dca80abdd, var_efe1c4b2620f108.size, "randomize");
    var_88318301272d82da = var_efe1c4b2620f108[var_24bc875dca80abdd];
    vo_line = var_88318301272d82da.vo_line;
    if (isdefined(var_88318301272d82da.actor)) {
        var_36e52d9011ebb465 = var_88318301272d82da.actor;
    }
    if (isdefined(var_88318301272d82da.var_cd5374c65761a5f6)) {
        wait var_88318301272d82da.var_cd5374c65761a5f6;
    }
    if (soundexists(vo_line)) {
        if (isai(var_36e52d9011ebb465)) {
            var_36e52d9011ebb465 stop_dialogue();
            waitframe();
            var_36e52d9011ebb465 smart_dialogue(vo_line);
        } else if (!isdefined(var_36e52d9011ebb465) || var_36e52d9011ebb465 == level) {
            self.activator smart_radio_dialogue(vo_line);
        } else {
            var_36e52d9011ebb465 playsoundonentity(vo_line, vo_line + "_complete");
        }
    } else {
        /#
            if (var_36e52d9011ebb465 != level && var_36e52d9011ebb465 != level.player) {
                var_36e52d9011ebb465 thread function_77bcf02459f2ba7(vo_line);
            } else {
                iprintlnbold(vo_line);
            }
        #/
    }
    if (isdefined(var_88318301272d82da.post_delay)) {
        wait var_88318301272d82da.post_delay;
    }
    return var_24bc875dca80abdd;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1dcd
// Size: 0xe9
function function_4c99d8252f8b3ae6(var_f4a0752d008ed58d, var_814be63fe1f3bf58, var_7d78b50908261113) {
    var_b18f97f37df3e951 = var_f4a0752d008ed58d;
    var_f4a0752d008ed58d++;
    if (var_f4a0752d008ed58d >= var_814be63fe1f3bf58) {
        var_f4a0752d008ed58d = 0;
        switch (var_7d78b50908261113) {
        case #"hash_ef6e32f0225e8f5a": 
            var_f4a0752d008ed58d = 1;
            break;
        case #"hash_f657293e61f29f2f": 
            var_f4a0752d008ed58d = var_b18f97f37df3e951;
            break;
        case #"hash_1ae0bd40582c8a9c": 
            var_f4a0752d008ed58d = randomint(var_814be63fe1f3bf58);
            break;
        case #"hash_b161b2bee816e90f": 
            var_f4a0752d008ed58d = randomint(var_814be63fe1f3bf58 - 1) + 1;
            break;
        }
        if (var_7d78b50908261113 == "randomize" || var_7d78b50908261113 == "randomize_skip_first") {
            var_5d11cc6615c734f3 = 0;
            if (var_7d78b50908261113 == "randomize_skip_first") {
                var_5d11cc6615c734f3 = 1;
            }
            if (var_f4a0752d008ed58d == var_b18f97f37df3e951) {
                var_f4a0752d008ed58d++;
                if (var_f4a0752d008ed58d >= var_814be63fe1f3bf58) {
                    var_f4a0752d008ed58d = var_5d11cc6615c734f3;
                }
            }
        }
        var_f4a0752d008ed58d = int(clamp(var_f4a0752d008ed58d, 0, var_814be63fe1f3bf58 - 1));
    }
    return var_f4a0752d008ed58d;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ebf
// Size: 0x853
function function_d61b10a951adbc62(var_36e52d9011ebb465, anim_struct) {
    var_fba45646132ed63a = 4.32;
    player = self.activator;
    if (isdefined(self.var_ae6302f7f057e26f) && isdefined(self.var_2c6249da4d27ca4e)) {
        function_3274dd5fa9090931();
    }
    if (isdefined(self.player_pos) && self.player_pos.size > 0) {
        foreach (pos in self.player_pos) {
            /#
            #/
            if (isdefined(var_36e52d9011ebb465) && hastag(var_36e52d9011ebb465.model, "tag_eye")) {
                ai_pos = spawnstruct();
                ai_pos.origin = var_36e52d9011ebb465 gettagorigin("tag_eye");
                ai_pos.angles = var_36e52d9011ebb465.angles;
            }
            var_3037504fe6414cff = undefined;
            if (isdefined(pos.var_5df695ba8d6a39fb)) {
                bundle = self.scriptbundle;
                struct = anim_struct;
                if (isdefined(pos.var_c8618f0ebefdd30a)) {
                    bundle = pos.var_c8618f0ebefdd30a;
                }
                if (isdefined(pos.var_d08c1f65483c0d7f)) {
                    struct = pos.var_d08c1f65483c0d7f;
                }
                var_5c46b854dc778af7 = scene::function_77751080050d2cb1("Types_Player", pos.var_5df695ba8d6a39fb, bundle);
                if (var_5c46b854dc778af7.size > 0) {
                    pos.var_5e5b24e8b8fc017f = 1;
                    var_3037504fe6414cff = function_de02ae5fe5a079a(var_5c46b854dc778af7[0], struct, bundle, pos.var_5df695ba8d6a39fb);
                } else {
                    var_c67a1c0590a28018 = function_dd230b54e233f4bd(var_36e52d9011ebb465, struct, bundle, pos.var_5df695ba8d6a39fb);
                    if (isdefined(var_c67a1c0590a28018)) {
                        ai_pos = var_c67a1c0590a28018;
                        var_3037504fe6414cff = spawnstruct();
                        var_3037504fe6414cff.origin = (ai_pos.origin[0], ai_pos.origin[1], var_36e52d9011ebb465.origin[2] + var_fba45646132ed63a);
                        var_3037504fe6414cff.angles = ai_pos.angles;
                    }
                }
            }
            if (!isdefined(pos.var_2465f58882c851b9)) {
                pos.var_2465f58882c851b9 = spawnstruct();
                self.position = (1224, 650, 0);
                if (isdefined(pos.var_5e5b24e8b8fc017f) && isdefined(var_3037504fe6414cff)) {
                    pos.var_2465f58882c851b9 = var_3037504fe6414cff;
                } else {
                    side_offset = 5;
                    angle_offset = 12;
                    if (pos.var_9123067972d392c7 == "right") {
                        side_offset *= -1;
                        angle_offset *= -1;
                    }
                    pos.var_2465f58882c851b9.origin = ai_pos.origin + anglestoforward(ai_pos.angles) * 56 + anglestoright(ai_pos.angles) * side_offset;
                    pos.var_2465f58882c851b9.origin = (pos.var_2465f58882c851b9.origin[0], pos.var_2465f58882c851b9.origin[1], var_36e52d9011ebb465.origin[2] + var_fba45646132ed63a);
                    pos.var_2465f58882c851b9.angles = ai_pos.angles + (0, 180, 0) - (0, angle_offset, 0);
                    player_fwd = anglestoforward(pos.var_2465f58882c851b9.angles);
                    player_eye = pos.var_2465f58882c851b9.origin + (0, 0, level.player getplayerviewheight(pos.stance));
                    var_4c5621dabf9fe966 = ai_pos.origin - (0, 0, 6) - player_eye;
                    if (player_eye[2] - ai_pos.origin[2] > 18) {
                        var_4c5621dabf9fe966 = ai_pos.origin - player_eye;
                    }
                    pos.var_2465f58882c851b9.angles = (vectortoangles(var_4c5621dabf9fe966)[0], pos.var_2465f58882c851b9.angles[1], pos.var_2465f58882c851b9.angles[2]);
                }
                pos.origin = pos.var_2465f58882c851b9.origin;
            }
        }
        var_e5972e634de0fbe1 = getclosest(player.origin, self.player_pos);
        var_36e52d9011ebb465.var_25bf3c46b0b8d3c8 = var_e5972e634de0fbe1;
        self.position = (1224, 650, 0);
        if (var_e5972e634de0fbe1.var_9123067972d392c7 == "right") {
            self.position = (240, 650, 0);
        }
        /#
        #/
        if (isdefined(var_e5972e634de0fbe1.stance)) {
            switch (var_e5972e634de0fbe1.stance) {
            case #"hash_c6775c88e38f7803": 
                self.activator val::set("dialog_tree", "crouch", 0);
                self.activator val::set("dialog_tree", "prone", 0);
                self.activator val::set("dialog_tree", "stand", 1);
                break;
            case #"hash_3fed0cbd303639eb": 
                self.activator val::set("dialog_tree", "crouch", 1);
                self.activator val::set("dialog_tree", "prone", 0);
                self.activator val::set("dialog_tree", "stand", 0);
                break;
            case #"hash_d91940431ed7c605": 
                self.activator val::set("dialog_tree", "crouch", 0);
                self.activator val::set("dialog_tree", "prone", 1);
                self.activator val::set("dialog_tree", "stand", 0);
                break;
            }
            player setstance(var_e5972e634de0fbe1.stance);
        }
        self.activator val::set("dialog_tree", "allow_movement", 0);
        if (isplayer(player)) {
            self.activator hideonclient(player);
        }
        var_36e52d9011ebb465 thread function_8e310442d0eb60d0(var_e5972e634de0fbe1);
        if (!isdefined(var_e5972e634de0fbe1.var_5e5b24e8b8fc017f)) {
            self.var_e746431534339e9c = player spawn_tag_origin(var_e5972e634de0fbe1.var_2465f58882c851b9.origin, var_e5972e634de0fbe1.var_2465f58882c851b9.angles);
            self.var_e746431534339e9c dontinterpolate();
            var_36e52d9011ebb465 notify("DT_camera_adjustments");
            var_52e4402613ce54dc = self.var_e746431534339e9c gettagorigin("tag_origin");
            if (var_52e4402613ce54dc == (0, 0, 0) || distance(player.origin, var_52e4402613ce54dc) > 256) {
                player show();
            } else {
                self.var_e746431534339e9c.prev_origin = player.origin;
                player playerlinktoblend(self.var_e746431534339e9c, "tag_origin", var_e5972e634de0fbe1.lerptime, var_e5972e634de0fbe1.lerptime * 0.25, var_e5972e634de0fbe1.lerptime * 0.5);
                thread function_4efb78e6627f5cda(player);
            }
        }
        thread function_44d159250853c75f(var_36e52d9011ebb465, anim_struct, var_e5972e634de0fbe1);
        var_36e52d9011ebb465 waittill_any("dialog_tree_show_choices", "_dt_enter_anims_complete");
        var_36e52d9011ebb465 notify("DT_camera_adjustments");
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x271a
// Size: 0x14b
function private function_8e310442d0eb60d0(var_e5972e634de0fbe1) {
    if (isdefined(var_e5972e634de0fbe1.fov) && isdefined(level.var_53e726a5ce0f4530[var_e5972e634de0fbe1.fov])) {
        level.player lerpfov(level.var_53e726a5ce0f4530[var_e5972e634de0fbe1.fov], var_e5972e634de0fbe1.lerptime, var_e5972e634de0fbe1.lerptime * 0.25, var_e5972e634de0fbe1.lerptime * 0.5);
    }
    if (isdefined(var_e5972e634de0fbe1.dof) && isdefined(level.var_daa9346aafb503a2[var_e5972e634de0fbe1.dof]) && var_e5972e634de0fbe1.dof != "none") {
        if (isdefined(self) && isactor(self)) {
            level.player thread utility::dof_enable_autofocus(level.var_daa9346aafb503a2[var_e5972e634de0fbe1.dof], self, 50, var_e5972e634de0fbe1.lerptime, undefined, "tag_eye", undefined, 1);
            return;
        }
        level.player thread utility::dof_enable_autofocus(level.var_daa9346aafb503a2[var_e5972e634de0fbe1.dof], undefined, 50, var_e5972e634de0fbe1.lerptime, undefined, undefined, undefined, 1);
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x286d
// Size: 0x75
function function_4efb78e6627f5cda(player) {
    wait 2;
    if (!self.allow_movement) {
        player playerlinktodelta(self.var_e746431534339e9c, "tag_origin", 1, 10, 10, 5, 5, 1, 1);
    } else {
        player unlink();
        self.var_e746431534339e9c = undefined;
        self.activator val::reset("dialog_tree", "allow_movement");
    }
    player show();
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x28ea
// Size: 0x1ad
function function_de02ae5fe5a079a(var_355425889014385e, struct, scene, shot) {
    fake_player = spawn("script_model", level.player.origin);
    fake_player setmodel(var_355425889014385e.sceneobject.variant_object.xmodelname);
    fake_player.angles = level.player.angles;
    fake_player scripts\engine\sp\utility::assign_animtree("player");
    fake_player hide();
    var_509c3a9b40401881 = struct scene::function_10a1cbb13da3a4fe(var_355425889014385e.sceneobject.variant_object.name, shot, scene);
    var_d106bb39919ece08 = var_509c3a9b40401881[var_509c3a9b40401881.size - 1];
    alignmentinfo = struct scene::function_6cb938788c210309(var_355425889014385e.sceneobject.variant_object.name, shot, scene);
    fake_player animscripted("gettingpos", alignmentinfo.origin, alignmentinfo.angles, var_d106bb39919ece08, undefined, undefined, 0, 0);
    if (!function_8581f011ce975a6(var_d106bb39919ece08)) {
        fake_player setanimtime(var_d106bb39919ece08, 1);
    }
    fake_player dontinterpolate();
    wait 0.05;
    var_dd3145cec7c4d4ee = spawnstruct();
    var_dd3145cec7c4d4ee.origin = fake_player gettagorigin("tag_origin");
    var_dd3145cec7c4d4ee.angles = fake_player gettagangles("tag_origin");
    fake_player delete();
    return var_dd3145cec7c4d4ee;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2aa0
// Size: 0x1d5
function function_dd230b54e233f4bd(var_36e52d9011ebb465, struct, scene, shot) {
    if (isdefined(var_36e52d9011ebb465)) {
        var_dd3145cec7c4d4ee = spawnstruct();
        var_dd3145cec7c4d4ee.origin = var_36e52d9011ebb465 gettagorigin("tag_eye");
        var_dd3145cec7c4d4ee.angles = var_36e52d9011ebb465 gettagangles("tag_origin");
        if (isdefined(scene) && isdefined(shot) && isdefined(struct)) {
            var_16345aa956bf0ede = spawn("script_model", var_36e52d9011ebb465.origin);
            var_16345aa956bf0ede setmodel(var_36e52d9011ebb465.model);
            var_16345aa956bf0ede.angles = var_36e52d9011ebb465.angles;
            var_16345aa956bf0ede.targetname = var_36e52d9011ebb465.targetname;
            var_16345aa956bf0ede.animname = var_36e52d9011ebb465.animname;
            var_16345aa956bf0ede scripts\sp\utility::assign_human_animtree();
            var_16345aa956bf0ede hide();
            var_509c3a9b40401881 = struct scene::function_10a1cbb13da3a4fe(var_16345aa956bf0ede.animname, shot, scene);
            var_d106bb39919ece08 = var_509c3a9b40401881[var_509c3a9b40401881.size - 1];
            alignmentinfo = struct scene::function_6cb938788c210309(var_16345aa956bf0ede.animname, shot, scene);
            if (isdefined(var_d106bb39919ece08)) {
                var_16345aa956bf0ede animscripted("gettingpos", alignmentinfo.origin, alignmentinfo.angles, var_d106bb39919ece08, undefined, undefined, 0, 0);
                var_16345aa956bf0ede setanimtime(var_d106bb39919ece08, 1);
                var_16345aa956bf0ede dontinterpolate();
                wait 0.05;
                var_dd3145cec7c4d4ee.origin = var_16345aa956bf0ede gettagorigin("tag_eye");
                var_dd3145cec7c4d4ee.angles = var_16345aa956bf0ede gettagangles("tag_origin");
            }
            var_16345aa956bf0ede delete();
        }
        return var_dd3145cec7c4d4ee;
    }
    return undefined;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2c7d
// Size: 0x154
function function_44d159250853c75f(var_36e52d9011ebb465, struct, player_pos) {
    if (!isdefined(player_pos.var_c8618f0ebefdd30a)) {
        player_pos.var_c8618f0ebefdd30a = self.scriptbundle;
    }
    if (!isdefined(player_pos.var_d08c1f65483c0d7f)) {
        player_pos.var_d08c1f65483c0d7f = struct;
    }
    bundle = player_pos.var_c8618f0ebefdd30a;
    var_c4359ab5def7f9b9 = player_pos.var_d08c1f65483c0d7f;
    var_3fb7720b732e55fb = function_27e66e2cf814c5e4(var_36e52d9011ebb465);
    if (isdefined(bundle)) {
        if (isdefined(player_pos.var_5df695ba8d6a39fb)) {
            var_c4359ab5def7f9b9 scene::play(var_3fb7720b732e55fb, player_pos.var_5df695ba8d6a39fb, bundle);
        } else {
            waitframe();
        }
    } else {
        waitframe();
    }
    var_36e52d9011ebb465 notify("_dt_enter_anims_complete");
    start_idle = self.var_ea8cafa6b0eb06c7;
    if (isdefined(player_pos.var_26380da9bb0a366)) {
        start_idle = player_pos.var_26380da9bb0a366;
    }
    if (isdefined(self.var_ae6302f7f057e26f)) {
        start_idle = function_7dc5dc6ca7fc72c4(self.var_ae6302f7f057e26f, "dt_idle");
        bundle = function_d66c0bfe054fd887(self.var_ae6302f7f057e26f);
        var_c4359ab5def7f9b9 = self.var_78db940d2989f211;
    }
    if (isdefined(start_idle)) {
        var_c4359ab5def7f9b9 thread scene::play(var_3fb7720b732e55fb, start_idle, bundle);
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd9
// Size: 0x19e
function function_b0728c7b89fee84(var_36e52d9011ebb465, struct, player_pos) {
    if (isdefined(player_pos)) {
        bundle = self.scriptbundle;
        var_5938ea7d5977bd0f = struct;
        if (isdefined(player_pos.fov)) {
            lerptime = player_pos.lerptime * 0.5;
            level.player lerpfov(var_36e52d9011ebb465.var_31abe8aab080e9f7, lerptime, lerptime * 0.25, lerptime * 0.5);
        }
        if (isdefined(player_pos.dof)) {
            if (isdefined(var_36e52d9011ebb465) && isactor(var_36e52d9011ebb465)) {
                level.player utility::dof_disable_autofocus();
            } else {
                level.player utility::dof_disable_autofocus();
            }
        }
        if (isdefined(player_pos.var_c8618f0ebefdd30a)) {
            bundle = player_pos.var_c8618f0ebefdd30a;
        }
        if (isdefined(player_pos.var_d08c1f65483c0d7f)) {
            var_5938ea7d5977bd0f = player_pos.var_d08c1f65483c0d7f;
        }
        if (isdefined(bundle)) {
            var_3fb7720b732e55fb = function_27e66e2cf814c5e4(var_36e52d9011ebb465);
            if (isdefined(player_pos.var_d35bbd317ecfb67b)) {
                var_36e52d9011ebb465 notify("dialog_tree_exit_anim");
                var_36e52d9011ebb465 ent_flag_set("_dialog_exit_anim");
                var_5938ea7d5977bd0f scene::play(var_3fb7720b732e55fb, player_pos.var_d35bbd317ecfb67b, bundle);
                var_36e52d9011ebb465 ent_flag_clear("_dialog_exit_anim");
            }
            var_36e52d9011ebb465 notify("dialog_tree_exit_anim_complete");
            if (isdefined(player_pos.var_6874582d5c9ff240)) {
                var_5938ea7d5977bd0f thread scene::play(var_3fb7720b732e55fb, player_pos.var_6874582d5c9ff240, bundle);
            }
        }
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x2f7f
// Size: 0x251
function function_77875203287214db(dialog_tree, anim_struct, timer, var_5d96b92cfab78abb, var_3619f00a65ff1269, var_e974e658fb7adde6, var_e208202acdef3371, use_offset, var_31d55a939e9cbc7a, var_bb0e04b41962c3ae) {
    level.player endon("death");
    dialog_tree endon("delete");
    if (isdefined(self) && isai(self) && !isalive(self)) {
        println("<dev string:x1c>" + self.name + "<dev string:x5a>");
        return;
    }
    if (!isdefined(var_5d96b92cfab78abb)) {
        var_5d96b92cfab78abb = "dialog_wait_cancel";
    }
    if (!isdefined(var_3619f00a65ff1269)) {
        var_3619f00a65ff1269 = 80;
    }
    if (!isdefined(var_e974e658fb7adde6)) {
        var_e974e658fb7adde6 = 200;
    }
    if (!isdefined(var_e208202acdef3371)) {
        var_e208202acdef3371 = 180;
    }
    if (!isdefined(use_offset)) {
        use_offset = (6, 0, 0);
    }
    if (!isdefined(var_31d55a939e9cbc7a)) {
        var_31d55a939e9cbc7a = 0;
    }
    anim_struct = function_a10c80dbb1f95f26(anim_struct, self);
    self.radius = 2.5;
    if (self tagexists("j_spine4")) {
        tagname = "j_spine4";
    } else {
        tagname = undefined;
    }
    var_529d4f9260f8008e = %T10_DIALOG_TREE/TALK_TO;
    if (isdefined(var_bb0e04b41962c3ae)) {
        var_529d4f9260f8008e = var_bb0e04b41962c3ae;
    }
    if (isdefined(dialog_tree.var_ae6302f7f057e26f)) {
        dialog_tree function_607273064331d2b8(self);
        if (!ent_flag("scene_active")) {
            idle_anim = function_7dc5dc6ca7fc72c4(dialog_tree.var_ae6302f7f057e26f, "idle");
            bundle = function_d66c0bfe054fd887(dialog_tree.var_ae6302f7f057e26f);
            struct = dialog_tree.var_78db940d2989f211;
            var_3fb7720b732e55fb = dialog_tree function_27e66e2cf814c5e4(self);
            struct thread scene::play(var_3fb7720b732e55fb, idle_anim, bundle);
        }
    }
    scripts\sp\player\cursor_hint::create_cursor_hint(tagname, use_offset, var_529d4f9260f8008e, undefined, var_e974e658fb7adde6, var_3619f00a65ff1269, 0, undefined, undefined, undefined, undefined, undefined, undefined, undefined, var_e208202acdef3371);
    msg = waittill_any_return("trigger", "death", "start_context_melee", "deleted", var_5d96b92cfab78abb, "_dt_cancel_interaction");
    if (msg == "trigger") {
        return dialog_tree run(self, anim_struct, timer, level.player, var_31d55a939e9cbc7a);
    }
    scripts\sp\player\cursor_hint::remove_cursor_hint();
    return;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 13, eflags: 0x0
// Checksum 0x0, Offset: 0x31d8
// Size: 0x14a
function function_3907588e683bb352(dialog_tree, anim_struct, var_def11c2f0ae2b342, var_8340f2036ada799c, var_12e3cdec8fa929ac, timer, var_5d96b92cfab78abb, var_3619f00a65ff1269, var_e974e658fb7adde6, var_e208202acdef3371, use_offset, var_31d55a939e9cbc7a, var_bb0e04b41962c3ae) {
    level.player endon("death");
    self endon("death");
    dialog_tree endon("delete");
    if (isdefined(var_def11c2f0ae2b342) && !isarray(var_def11c2f0ae2b342)) {
        var_def11c2f0ae2b342 = [var_def11c2f0ae2b342];
    }
    if (!isdefined(var_def11c2f0ae2b342)) {
        var_def11c2f0ae2b342 = [];
    }
    if (isdefined(var_8340f2036ada799c) && !isarray(var_8340f2036ada799c)) {
        var_8340f2036ada799c = [var_8340f2036ada799c];
    }
    if (!isdefined(var_8340f2036ada799c)) {
        var_8340f2036ada799c = [];
    }
    if (var_8340f2036ada799c.size > 0) {
        flag_waitopen_all_array(var_8340f2036ada799c);
    }
    if (!isdefined(var_12e3cdec8fa929ac)) {
        var_12e3cdec8fa929ac = 2;
    }
    while (var_def11c2f0ae2b342.size == 0 || !function_a3bbe05692652216(var_def11c2f0ae2b342)) {
        childthread _dt_handle_disable_flags(var_def11c2f0ae2b342, var_8340f2036ada799c, var_5d96b92cfab78abb);
        function_77875203287214db(dialog_tree, anim_struct, timer, var_5d96b92cfab78abb, var_3619f00a65ff1269, var_e974e658fb7adde6, var_e208202acdef3371, use_offset, var_31d55a939e9cbc7a, var_bb0e04b41962c3ae);
        ent_flag_waitopen("_dialog_exit_anim");
        if (isdefined(var_12e3cdec8fa929ac)) {
            wait var_12e3cdec8fa929ac;
        }
        if (var_8340f2036ada799c.size > 0) {
            flag_waitopen_all_array(var_8340f2036ada799c);
        }
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x332a
// Size: 0x5c
function private _dt_handle_disable_flags(var_def11c2f0ae2b342, var_8340f2036ada799c, var_5d96b92cfab78abb) {
    self notify("_dt_handle_disable_flags");
    self endon("_dt_handle_disable_flags");
    if (isdefined(var_5d96b92cfab78abb)) {
        self endon(var_5d96b92cfab78abb);
    }
    var_31e67aee2e18b4b1 = array_combine(var_def11c2f0ae2b342, var_8340f2036ada799c);
    if (var_31e67aee2e18b4b1.size > 0) {
        function_665d474ff040b446(var_31e67aee2e18b4b1);
    }
    self notify("_dt_cancel_interaction");
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x338e
// Size: 0xea3
function run(var_36e52d9011ebb465, anim_struct, timer, activator, var_31d55a939e9cbc7a, var_b763c53f8a399479, var_6a5d78d46f3a9e2) {
    assert(isarray(self.options));
    if (!isdefined(var_36e52d9011ebb465)) {
        var_36e52d9011ebb465 = level;
    }
    self.var_36e52d9011ebb465 = var_36e52d9011ebb465;
    if (isdefined(activator) && isplayer(activator)) {
        self.activator = activator;
    } else {
        self.activator = level.players[0];
    }
    if (!isdefined(var_31d55a939e9cbc7a)) {
        var_31d55a939e9cbc7a = 0;
    }
    if (!isdefined(var_b763c53f8a399479)) {
        var_b763c53f8a399479 = 4;
    }
    if (!isdefined(var_6a5d78d46f3a9e2)) {
        var_6a5d78d46f3a9e2 = 0;
    }
    function_607273064331d2b8(var_36e52d9011ebb465);
    if (!isdefined(self.activator)) {
        return -1;
    }
    self.activator endon("death");
    if (function_a61e244dd0bb1ae4(var_36e52d9011ebb465)) {
        return -1;
    }
    var_36e52d9011ebb465 notify("dialog_active");
    if (!isdefined(var_36e52d9011ebb465.var_41fc4f898c255d37)) {
        var_36e52d9011ebb465.var_41fc4f898c255d37 = 0;
    }
    var_36e52d9011ebb465.var_41fc4f898c255d37++;
    anim_struct = function_a10c80dbb1f95f26(anim_struct, var_36e52d9011ebb465);
    if (self.skippable) {
        thread function_952cfa1c522b5457(var_36e52d9011ebb465, anim_struct);
    }
    var_36e52d9011ebb465 function_6fcfd605093266bb("_dialog_enter_func");
    if (isdefined(self.enter_func)) {
        var_36e52d9011ebb465 thread function_ebb58316927b2e(self.enter_func);
    }
    var_392205194b959b79 = 0;
    if (var_36e52d9011ebb465.var_41fc4f898c255d37 <= 1) {
        flag_set("dialog_tree_active");
        flag_set("prompts_disabled");
        var_36e52d9011ebb465.var_63de0686e572034c = self;
        self.activator val::set("dialog_tree", "ignoreme", 1);
        self.activator val::set("dialog_tree", "damage", 0);
        self.activator val::set("dialog_tree", "equipment_wheel", 0);
        if (isai(var_36e52d9011ebb465)) {
            if (!isdefined(var_36e52d9011ebb465.animname)) {
                var_36e52d9011ebb465.animname = "generic";
            }
            var_36e52d9011ebb465 val::set("dialog_tree", "ignoreme", 1);
            var_36e52d9011ebb465 val::set("dialog_tree", "damage", 0);
        }
        if (!self.allow_weapon) {
            self.activator val::set("dialog_tree", "weapon", 0);
            self.activator val::set("dialog_tree", "offhand_weapons", 0);
        }
        var_36e52d9011ebb465.var_31abe8aab080e9f7 = getdvarint(@"cg_fov");
        var_36e52d9011ebb465.var_ea70e39ddb4a6465 = anim_struct;
        function_d61b10a951adbc62(var_36e52d9011ebb465, anim_struct);
        if (isai(var_36e52d9011ebb465) && self.var_ed0fcbcd5f033f98) {
            var_36e52d9011ebb465 namespace_17a0e830dd8fa113::enablelookatplayer(0.5, 1);
        }
        if (!isdefined(self.var_e746431534339e9c) && !self.allow_movement) {
            self.var_e746431534339e9c = spawn_tag_origin(self.activator.origin, self.activator.angles);
            if (istrue(level.var_bb012f571db2b0c9)) {
                v = level.player getplayerangles();
                var_5afa8eabfc01bd2 = -1 * (v[0] - 10);
                var_45dfab367a73b8f3 = v[0] + 10;
                self.activator playerlinktodelta(self.var_e746431534339e9c, "tag_origin", 0, 20, 20, var_5afa8eabfc01bd2, var_45dfab367a73b8f3, 1);
            } else {
                self.activator playerlinktodelta(self.var_e746431534339e9c, "tag_origin", 0, 20, 20, 10, 10, 1);
            }
        }
        function_f90abf1b067d49a7(var_36e52d9011ebb465);
        self.var_28ac3afdf36f413d = 0;
        var_392205194b959b79 = 1;
    } else if (isdefined(var_36e52d9011ebb465.var_63de0686e572034c)) {
        var_cae767cd1cad0d5a = var_36e52d9011ebb465.var_63de0686e572034c;
        self.var_ed0fcbcd5f033f98 = var_cae767cd1cad0d5a.var_ed0fcbcd5f033f98;
        if (!isdefined(self.var_e746431534339e9c)) {
            self.var_e746431534339e9c = var_cae767cd1cad0d5a.var_e746431534339e9c;
        }
        if (!isdefined(self.scriptbundle) && isdefined(var_cae767cd1cad0d5a.scriptbundle)) {
            self.scriptbundle = var_cae767cd1cad0d5a.scriptbundle;
        }
        if (!isdefined(self.var_ae6302f7f057e26f) && isdefined(var_cae767cd1cad0d5a.var_ae6302f7f057e26f)) {
            self.var_ae6302f7f057e26f = var_cae767cd1cad0d5a.var_ae6302f7f057e26f;
            self.var_78db940d2989f211 = var_cae767cd1cad0d5a.var_78db940d2989f211;
        }
        if (!isdefined(self.var_54e7225e3f7ea0ba) && isdefined(var_cae767cd1cad0d5a.var_54e7225e3f7ea0ba)) {
            self.var_54e7225e3f7ea0ba = var_cae767cd1cad0d5a.var_54e7225e3f7ea0ba;
        }
        if (!isdefined(self.var_ea8cafa6b0eb06c7) && isdefined(var_cae767cd1cad0d5a.var_ea8cafa6b0eb06c7)) {
            self.var_ea8cafa6b0eb06c7 = var_cae767cd1cad0d5a.var_ea8cafa6b0eb06c7;
        }
    }
    var_36e52d9011ebb465 ent_flag_waitopen("_dialog_enter_func");
    var_36e52d9011ebb465 function_6fcfd605093266bb("_dialog_vo_playing");
    var_36e52d9011ebb465 function_6fcfd605093266bb("_dialog_anim_playing");
    var_36e52d9011ebb465 function_6fcfd605093266bb("_dialog_func_running");
    var_36e52d9011ebb465 function_6fcfd605093266bb("_dialog_ui_animating");
    var_36e52d9011ebb465 ent_flag_waitopen("_dialog_ui_animating");
    while (var_36e52d9011ebb465.var_41fc4f898c255d37 > 1) {
        wait 0.1;
    }
    wait 0.5;
    end_dialog = 0;
    var_e71a59e62354bd6d = -1;
    if (self.var_7c495f86e82a2621) {
        self.activator setclientomnvar("ui_hide_hud", 1);
    }
    if (var_392205194b959b79) {
        self.activator function_3a5cc3b6ee866c7e(self.position, self.state_index);
    }
    if (isdefined(timer)) {
        self.timeout = timer;
    }
    while (!end_dialog) {
        var_5cd1d0ff865b8b4e = function_4b2a4d126ebeef2f(var_b763c53f8a399479);
        if (var_5cd1d0ff865b8b4e.size < 1) {
            end_dialog = 1;
            continue;
        }
        var_36e52d9011ebb465 ent_flag_set("_dialog_ui_animating");
        var_b7723e8cdd8ddb65 = function_b0a4d1a45e3cc77b(var_5cd1d0ff865b8b4e, var_36e52d9011ebb465, var_b763c53f8a399479);
        if (!isdefined(var_b7723e8cdd8ddb65) || var_b7723e8cdd8ddb65 < 0) {
            break;
        }
        self.var_28ac3afdf36f413d++;
        var_36e52d9011ebb465 notify("dialog_tree_choice_made");
        level notify("dialog_tree_choice_made");
        var_36e52d9011ebb465 ent_flag_waitopen("dialog_wait_for_animation");
        var_14baaf3d63f52771 = self.options[var_b7723e8cdd8ddb65];
        if (isai(var_36e52d9011ebb465)) {
            var_36e52d9011ebb465 stopsounds();
        }
        if (isdefined(var_14baaf3d63f52771.set_flag)) {
            foreach (flag_name in var_14baaf3d63f52771.set_flag) {
                flag_set(flag_name);
            }
        }
        var_36e52d9011ebb465 ent_flag_clear("_dialog_vo_playing");
        var_36e52d9011ebb465 ent_flag_clear("_dialog_anim_playing");
        var_36e52d9011ebb465 ent_flag_clear("_dialog_func_running");
        var_d4109911bd0c278f = ["_dialog_func_running", "_dialog_vo_playing", "_dialog_anim_playing"];
        if (isdefined(var_14baaf3d63f52771.var_e73fa3773646c09f)) {
            var_36e52d9011ebb465 ent_flag_set("_dialog_func_running");
            var_36e52d9011ebb465 childthread function_89a37d041d921c19(var_14baaf3d63f52771.var_e73fa3773646c09f, var_14baaf3d63f52771.var_984d086533e8a003, var_14baaf3d63f52771.var_3bf4d9be6d83fd9);
        }
        if (isdefined(var_14baaf3d63f52771.var_b2be5c0f00bdc222)) {
            var_36e52d9011ebb465 ent_flag_set("_dialog_vo_playing");
            var_d4109911bd0c278f = ["_dialog_func_running", "_dialog_vo_playing"];
            if (var_14baaf3d63f52771.var_6f4f18042c9479e1 < 0) {
                thread function_b57073e1168e630c(var_36e52d9011ebb465, var_14baaf3d63f52771.var_b2be5c0f00bdc222);
            } else {
                thread function_b57073e1168e630c(var_36e52d9011ebb465, var_14baaf3d63f52771.var_b2be5c0f00bdc222[var_14baaf3d63f52771.var_6f4f18042c9479e1]);
                var_14baaf3d63f52771.var_6f4f18042c9479e1 = function_4c99d8252f8b3ae6(var_14baaf3d63f52771.var_6f4f18042c9479e1, var_14baaf3d63f52771.var_b2be5c0f00bdc222.size, var_14baaf3d63f52771.var_9fb9aa3e99cbaaa3);
            }
            if (!isdefined(var_14baaf3d63f52771.var_5ab01cd2ebcf1604)) {
                var_36e52d9011ebb465 thread function_8647b457c8205fe3();
            }
        }
        anim_struct notify("end_dialog_loop_anim");
        var_5ab01cd2ebcf1604 = undefined;
        var_d03b62b68a62fa3f = undefined;
        struct = anim_struct;
        var_358d1badd2acf579 = struct;
        bundle = self.scriptbundle;
        var_d20077db34b4c9f8 = bundle;
        if (isdefined(self.var_ea8cafa6b0eb06c7)) {
            var_d03b62b68a62fa3f = self.var_ea8cafa6b0eb06c7;
        }
        if (isdefined(self.var_ae6302f7f057e26f)) {
            var_5ab01cd2ebcf1604 = function_7dc5dc6ca7fc72c4(self.var_ae6302f7f057e26f, "talk");
            var_d03b62b68a62fa3f = function_7dc5dc6ca7fc72c4(self.var_ae6302f7f057e26f, "dt_idle");
            bundle = function_d66c0bfe054fd887(self.var_ae6302f7f057e26f);
            var_d20077db34b4c9f8 = bundle;
            struct = self.var_78db940d2989f211;
            var_358d1badd2acf579 = struct;
        }
        if (isdefined(var_14baaf3d63f52771.var_5ab01cd2ebcf1604)) {
            var_5ab01cd2ebcf1604 = var_14baaf3d63f52771.var_5ab01cd2ebcf1604;
            if (isdefined(self.scriptbundle)) {
                bundle = self.scriptbundle;
                struct = anim_struct;
            }
        }
        if (isdefined(var_14baaf3d63f52771.var_d03b62b68a62fa3f)) {
            var_d03b62b68a62fa3f = var_14baaf3d63f52771.var_d03b62b68a62fa3f;
            if (isdefined(self.scriptbundle)) {
                var_d20077db34b4c9f8 = self.scriptbundle;
                var_358d1badd2acf579 = anim_struct;
            }
        }
        if (isdefined(var_5ab01cd2ebcf1604) || isdefined(var_d03b62b68a62fa3f)) {
            var_36e52d9011ebb465 ent_flag_set("_dialog_anim_playing");
            if (var_14baaf3d63f52771.var_5da09cbbc19fc673 < 0) {
                thread function_c0ea7ed96cac83c2(var_36e52d9011ebb465, var_5ab01cd2ebcf1604, struct, bundle, var_d03b62b68a62fa3f, var_358d1badd2acf579, var_d20077db34b4c9f8);
            } else {
                thread function_c0ea7ed96cac83c2(var_36e52d9011ebb465, var_14baaf3d63f52771.var_5ab01cd2ebcf1604[var_14baaf3d63f52771.var_5da09cbbc19fc673], struct, self.scriptbundle, var_d03b62b68a62fa3f, var_358d1badd2acf579, var_d20077db34b4c9f8);
                var_14baaf3d63f52771.var_5da09cbbc19fc673 = function_4c99d8252f8b3ae6(var_14baaf3d63f52771.var_5da09cbbc19fc673, var_14baaf3d63f52771.var_5ab01cd2ebcf1604.size, var_14baaf3d63f52771.var_9fb9aa3e99cbaaa3);
            }
        }
        if (istrue(var_14baaf3d63f52771.end_dialog) || self.timeout > 0) {
            end_dialog = 1;
            var_e71a59e62354bd6d = var_b7723e8cdd8ddb65;
            if (istrue(var_14baaf3d63f52771.var_efa1ab49708bcee5)) {
                var_d4109911bd0c278f = ["_dialog_func_running"];
            }
        }
        var_36e52d9011ebb465 function_cba0984334ba3279(var_d4109911bd0c278f);
        if (!end_dialog || var_36e52d9011ebb465.var_41fc4f898c255d37 > 1) {
            var_36e52d9011ebb465 ent_flag_waitopen("_dialog_ui_animating");
        }
        var_36e52d9011ebb465 notify("dialog_tree_response_complete");
        self.activator notify("dialog_tree_response_complete");
        self.options[var_b7723e8cdd8ddb65] function_f644d2dc71f882d3(1);
        function_3b353710664c8e46(var_b7723e8cdd8ddb65);
        waitframe();
        if (var_6a5d78d46f3a9e2) {
            self.var_ae6649775a3f3762 = var_b7723e8cdd8ddb65;
        }
        if (istrue(var_36e52d9011ebb465.end_dialog)) {
            var_36e52d9011ebb465.end_dialog = undefined;
            break;
        }
    }
    if (var_36e52d9011ebb465.var_41fc4f898c255d37 <= 1) {
        self.activator function_cf43a9641fd024af("dialog_tree");
        if (self.var_7c495f86e82a2621) {
            self.activator setclientomnvar("ui_hide_hud", 0);
        }
        var_36e52d9011ebb465.var_ea70e39ddb4a6465 = undefined;
        var_36e52d9011ebb465.var_63de0686e572034c = undefined;
        if (isdefined(self.scriptbundle) && !function_87c6d037813b57c1(var_36e52d9011ebb465.var_25bf3c46b0b8d3c8)) {
            anim_struct scene::stop();
        }
        if (isai(var_36e52d9011ebb465) && self.var_ed0fcbcd5f033f98) {
            var_36e52d9011ebb465 namespace_17a0e830dd8fa113::disablelookatplayer();
        }
        if (isdefined(var_36e52d9011ebb465.var_25bf3c46b0b8d3c8)) {
            thread function_b0728c7b89fee84(var_36e52d9011ebb465, anim_struct, var_36e52d9011ebb465.var_25bf3c46b0b8d3c8);
        }
    }
    if (isdefined(self.exit_func)) {
        var_36e52d9011ebb465 childthread [[ self.exit_func ]]();
    }
    if (var_36e52d9011ebb465.var_41fc4f898c255d37 <= 1) {
        if (!self.allow_movement) {
            if (isdefined(self.var_e746431534339e9c)) {
                var_55ffa1501ecbdce3 = undefined;
                var_6ba5b1152907d9b = self.var_e746431534339e9c.origin;
                ret = self.activator player_trace(var_6ba5b1152907d9b + (0, 0, 24), var_6ba5b1152907d9b - (0, 0, 24), undefined, self.activator, undefined, undefined, 7);
                if (ret["hittype"] != "hittype_none") {
                    var_55ffa1501ecbdce3 = ret["position"];
                } else if (isdefined(self.var_e746431534339e9c.prev_origin)) {
                    var_55ffa1501ecbdce3 = self.var_e746431534339e9c.prev_origin;
                }
                if (isdefined(var_55ffa1501ecbdce3) && distance(self.activator.origin, var_55ffa1501ecbdce3) > 24) {
                    var_55ffa1501ecbdce3 = undefined;
                }
                if (isdefined(var_55ffa1501ecbdce3) && var_55ffa1501ecbdce3 != self.activator.origin) {
                    var_93c0d18ec272ec49 = 0.5;
                    self.var_e746431534339e9c moveto(var_55ffa1501ecbdce3, var_93c0d18ec272ec49, var_93c0d18ec272ec49 * 0.25, var_93c0d18ec272ec49 * 0.5);
                    wait var_93c0d18ec272ec49;
                }
                self.activator function_af4b9b0f0e7c6c42(0.5);
                wait 0.5;
                self.var_e746431534339e9c delete();
                self.var_e746431534339e9c = undefined;
            }
        }
        var_36e52d9011ebb465 ent_flag_clear("_dialog_vo_playing");
        var_36e52d9011ebb465 ent_flag_clear("_dialog_anim_playing");
        var_36e52d9011ebb465 ent_flag_clear("_dialog_func_running");
        if (isdefined(var_36e52d9011ebb465.var_25bf3c46b0b8d3c8)) {
            var_36e52d9011ebb465.var_25bf3c46b0b8d3c8 = undefined;
        }
        self.activator val::reset_all("dialog_tree");
        waitframe();
        if (isai(var_36e52d9011ebb465)) {
            var_36e52d9011ebb465 val::reset_all("dialog_tree");
        }
        self notify("dialog_tree_end");
        var_36e52d9011ebb465 notify("dialog_tree_end");
        self.activator notify("dialog_tree_end");
        flag_clear("dialog_tree_active");
        flag_clear("prompts_disabled");
    }
    var_36e52d9011ebb465.var_41fc4f898c255d37--;
    while (isdefined(var_36e52d9011ebb465.var_41fc4f898c255d37) && var_36e52d9011ebb465.var_41fc4f898c255d37 > 0) {
        wait 0.1;
    }
    return var_e71a59e62354bd6d;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x423a
// Size: 0x23
function function_b284f3de056ef45f() {
    if (self.var_7c495f86e82a2621) {
        self.activator setclientomnvar("ui_hide_hud", 0);
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4265
// Size: 0x10a
function function_3041b446fbb7cebe(var_c67a64c3015ecb45) {
    if (!isdefined(var_c67a64c3015ecb45)) {
        var_c67a64c3015ecb45 = 0;
    }
    var_274e22942d9863f3 = function_4b2a4d126ebeef2f();
    var_e1e5d73643ab3fdd = 0;
    if (var_c67a64c3015ecb45) {
        foreach (var_ed73c23c15816aba in var_274e22942d9863f3) {
            var_31e67aee2e18b4b1 = self.options[var_ed73c23c15816aba].var_9e70d6ccc832341;
            if (isdefined(var_31e67aee2e18b4b1)) {
                foreach (flag in var_31e67aee2e18b4b1) {
                    var_7a1eebb36e91bf52 = tolower(flag);
                    if (issubstr(var_7a1eebb36e91bf52, "forever")) {
                        var_e1e5d73643ab3fdd++;
                        break;
                    }
                }
            }
        }
    }
    return var_274e22942d9863f3.size - var_e1e5d73643ab3fdd;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4378
// Size: 0x22
function function_72b6b41ebf8dd3ef() {
    self.var_36e52d9011ebb465 ent_flag_wait("waiting_on_player_choice");
    waitframe();
    level notify("dialog_tree_option_selected", -1);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43a2
// Size: 0x14
function function_efac0383d0aa5fa0(tree) {
    tree notify("delete");
    return undefined;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x43bf
// Size: 0x28
function private function_ebb58316927b2e(func) {
    ent_flag_set("_dialog_enter_func");
    self [[ func ]]();
    ent_flag_clear("_dialog_enter_func");
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x43ef
// Size: 0xaa
function private function_952cfa1c522b5457(var_36e52d9011ebb465, anim_struct) {
    self.activator endon("death");
    self endon("dialog_tree_end");
    level notify("watch_dt_skips");
    level endon("watch_dt_skips");
    while (true) {
        level waittill("dialog_tree_request_skip");
        if (var_36e52d9011ebb465 ent_flag("_dialog_vo_playing")) {
            if (isdefined(var_36e52d9011ebb465.var_b5399d011f68e3ed)) {
                if (isai(var_36e52d9011ebb465)) {
                    var_36e52d9011ebb465 stop_dialogue();
                } else {
                    var_36e52d9011ebb465 stopsounds();
                }
                var_36e52d9011ebb465.var_b5399d011f68e3ed = undefined;
                var_36e52d9011ebb465 notify("cancel speaking");
            }
        }
        var_36e52d9011ebb465 notify("dialog_tree_cancel_response");
        self notify("dialog_tree_anim_continue");
        wait 0.3;
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x44a1
// Size: 0x1b
function function_5a980cdc85424aa8(sb, str_shot, anim_struct) {
    
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x44c4
// Size: 0x141
function function_b57073e1168e630c(var_36e52d9011ebb465, var_5b729f094c82d3fe) {
    var_36e52d9011ebb465 endon("death");
    var_36e52d9011ebb465 endon("dialog_tree_end");
    waitframe();
    if (!isarray(var_5b729f094c82d3fe)) {
        var_5b729f094c82d3fe = [var_5b729f094c82d3fe];
    }
    for (i = 0; i < var_5b729f094c82d3fe.size; i++) {
        vo_line = var_5b729f094c82d3fe[i];
        if (soundexists(vo_line)) {
            var_36e52d9011ebb465.var_b5399d011f68e3ed = 1;
            if (isai(var_36e52d9011ebb465)) {
                var_36e52d9011ebb465 stop_dialogue();
                waitframe();
                var_36e52d9011ebb465 smart_dialogue(vo_line);
            } else if (!isdefined(var_36e52d9011ebb465) || var_36e52d9011ebb465 == level) {
                self.activator smart_radio_dialogue(vo_line);
            } else {
                var_36e52d9011ebb465 playsoundonentity(vo_line, vo_line + "_complete");
            }
            continue;
        }
        if (isdefined(vo_line) && vo_line != "") {
            /#
                if (var_36e52d9011ebb465 != level && var_36e52d9011ebb465 != level.player) {
                    var_36e52d9011ebb465 thread function_77bcf02459f2ba7(vo_line);
                } else {
                    iprintlnbold(vo_line);
                }
                self.activator waittill_any_timeout_1(1.5, "<dev string:x67>");
            #/
        }
    }
    var_36e52d9011ebb465 notify("dialog_tree_vo_response_complete");
    self notify("dialog_tree_vo_response_complete");
    var_36e52d9011ebb465.var_b5399d011f68e3ed = undefined;
    var_36e52d9011ebb465 ent_flag_clear("_dialog_vo_playing");
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x460d
// Size: 0x45
function private function_896a08d617c4a4e4(var_b61727573a8b842b) {
    assert(isarray(self.options));
    var_97e020544f563db8 = self.options.size;
    self.options[var_97e020544f563db8] = var_b61727573a8b842b;
    return var_97e020544f563db8;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 16, eflags: 0x4
// Checksum 0x0, Offset: 0x465b
// Size: 0x24e
function private function_90cdd85860a9e8df(parent_id, var_c2884c14a260a4d6, var_721440f2ec03fe13, ai_anim, var_228a30311662ac48, end_dialog, set_flag, var_661a368853d6a900, var_176104ebd5b06dab, var_e73fa3773646c09f, var_984d086533e8a003, var_3bf4d9be6d83fd9, important, var_f76e8406f0920af2, var_251b1b5ad40a075d, var_672f1e3cc01453d2) {
    if (!isdefined(end_dialog)) {
        end_dialog = 0;
    }
    if (!isdefined(important)) {
        important = 0;
    }
    if (!isdefined(var_672f1e3cc01453d2)) {
        var_672f1e3cc01453d2 = 1;
    }
    option = spawnstruct();
    option.active = 1;
    option.parent_id = parent_id;
    option.var_885448f843aa6aa3 = var_c2884c14a260a4d6;
    option.var_b2be5c0f00bdc222 = var_721440f2ec03fe13;
    option.var_5ab01cd2ebcf1604 = ai_anim;
    option.var_d03b62b68a62fa3f = var_228a30311662ac48;
    option.end_dialog = end_dialog;
    option.var_2180d498dd0472c2 = 0;
    option.locked = 0;
    if (isdefined(set_flag) && !isarray(set_flag)) {
        set_flag = [set_flag];
    }
    option.set_flag = set_flag;
    if (isdefined(var_176104ebd5b06dab)) {
        option.locked = 1;
        if (isarray(var_176104ebd5b06dab)) {
            option.var_79a2e334ef20037c = var_176104ebd5b06dab;
        } else {
            option.var_79a2e334ef20037c = [var_176104ebd5b06dab];
        }
    }
    if (isdefined(var_661a368853d6a900)) {
        if (isarray(var_661a368853d6a900)) {
            option.var_9e70d6ccc832341 = var_661a368853d6a900;
        } else {
            option.var_9e70d6ccc832341 = [var_661a368853d6a900];
        }
    }
    option.var_e73fa3773646c09f = var_e73fa3773646c09f;
    option.var_984d086533e8a003 = var_984d086533e8a003;
    option.var_3bf4d9be6d83fd9 = var_3bf4d9be6d83fd9;
    option.important = important;
    option.var_6c2ca93aac17e873 = 0;
    option.var_6f4f18042c9479e1 = -1;
    option.var_5da09cbbc19fc673 = -1;
    option.var_f76e8406f0920af2 = var_f76e8406f0920af2;
    option.var_251b1b5ad40a075d = var_251b1b5ad40a075d;
    option.var_672f1e3cc01453d2 = var_672f1e3cc01453d2;
    return option;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x48b2
// Size: 0x5a
function private function_9ca2b445d85472ca() {
    if (self.locked) {
        if (isdefined(self.var_79a2e334ef20037c) && function_a3c4f156926f6627(self.var_79a2e334ef20037c)) {
            return 0;
        }
        if (isdefined(self.var_e4ef57c233595c4c) && function_a3bbe05692652216(self.var_e4ef57c233595c4c)) {
            return 0;
        }
        return 1;
    }
    return 0;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4914
// Size: 0x9e
function private function_f644d2dc71f882d3(var_cef5f1fe5c58455b) {
    if (var_cef5f1fe5c58455b && !isdefined(self.var_43d0b8282bd404df) && !isdefined(self.var_9e70d6ccc832341)) {
        self.active = 0;
        return;
    }
    if (isdefined(self.var_9e70d6ccc832341)) {
        if (self.var_9e70d6ccc832341[0] == "forever") {
            return;
        }
        if (function_a3c4f156926f6627(self.var_9e70d6ccc832341)) {
            self.active = 0;
        }
    }
    if (isdefined(self.var_43d0b8282bd404df) && function_a3bbe05692652216(self.var_43d0b8282bd404df)) {
        self.active = 0;
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x49ba
// Size: 0x5a
function private function_a3c4f156926f6627(flags) {
    foreach (f in flags) {
        if (!flag(f)) {
            return false;
        }
    }
    return true;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4a1d
// Size: 0x5a
function private function_a3bbe05692652216(flags) {
    foreach (f in flags) {
        if (flag(f)) {
            return true;
        }
    }
    return false;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4a80
// Size: 0xf6
function private function_4db1d159e194fef2(var_5cd1d0ff865b8b4e, var_b763c53f8a399479) {
    if (!isdefined(var_b763c53f8a399479)) {
        var_b763c53f8a399479 = 4;
    }
    hudstrings = [];
    for (i = 0; i < var_b763c53f8a399479; i++) {
        if (isdefined(var_5cd1d0ff865b8b4e[i])) {
            option = self.options[var_5cd1d0ff865b8b4e[i]];
            hudstrings[i] = spawnstruct();
            hudstrings[i].important = option.important;
            hudstrings[i].string = option.var_885448f843aa6aa3;
            hudstrings[i].locked = option function_9ca2b445d85472ca() && option.var_6c2ca93aac17e873;
            continue;
        }
        hudstrings[i] = spawnstruct();
        hudstrings[i].important = 0;
        hudstrings[i].string = undefined;
        hudstrings[i].locked = 0;
    }
    return hudstrings;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4b7f
// Size: 0x20
function private function_efa6071d5c0c7cf6(var_97e020544f563db8) {
    if (!isdefined(var_97e020544f563db8)) {
        var_97e020544f563db8 = self.options.size - 1;
    }
    return var_97e020544f563db8;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x4ba8
// Size: 0x57
function private function_89a37d041d921c19(func, param, var_3bf4d9be6d83fd9) {
    self endon("dialog_tree_end");
    if (isdefined(var_3bf4d9be6d83fd9)) {
        childthread function_248fd2c8f84089de(var_3bf4d9be6d83fd9);
    }
    if (!isdefined(param)) {
        self [[ func ]]();
    } else {
        self [[ func ]](param);
    }
    self notify("dtree_cancel_skip_func");
    ent_flag_clear("_dialog_func_running");
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4c07
// Size: 0x27
function private function_248fd2c8f84089de(var_3bf4d9be6d83fd9) {
    self endon("dialog_tree_end");
    self endon("dtree_cancel_skip_func");
    self waittill("dialog_tree_cancel_response");
    self childthread [[ var_3bf4d9be6d83fd9 ]]();
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x4c36
// Size: 0x15d
function function_c0ea7ed96cac83c2(var_36e52d9011ebb465, anims, struct, scriptbundle, var_d03b62b68a62fa3f, var_358d1badd2acf579, var_d20077db34b4c9f8) {
    self endon("dialog_tree_end");
    var_36e52d9011ebb465 endon("dialog_tree_choice_made");
    var_36e52d9011ebb465 endon("dialog_tree_exit_anim");
    if (isdefined(anims)) {
        if (!isarray(anims)) {
            anims = [anims];
        }
        thread function_97c8fd6d796429cd(var_36e52d9011ebb465);
        for (i = 0; i < anims.size; i++) {
            shot_name = anims[i];
            names = strtok(anims[i], ":");
            if (names.size > 1) {
                scriptbundle = names[0];
                shot_name = names[1];
            }
            if (isdefined(scriptbundle) && isdefined(shot_name)) {
                childthread function_dabc19c1b0a4c98c(var_36e52d9011ebb465, shot_name, struct, scriptbundle);
                waittill_any("dialog_tree_anim_done", "dialog_tree_anim_continue", "dialog_tree_vo_response_complete");
            }
        }
    }
    var_36e52d9011ebb465 notify("dialog_tree_scene_response_complete");
    self.var_f2ad955ae5c3dee8 = undefined;
    var_36e52d9011ebb465 ent_flag_clear("_dialog_anim_playing");
    if (isdefined(var_d03b62b68a62fa3f)) {
        names = strtok(var_d03b62b68a62fa3f, ":");
        if (names.size > 1) {
            var_d20077db34b4c9f8 = names[0];
            var_d03b62b68a62fa3f = names[1];
        }
        if (isdefined(var_d20077db34b4c9f8) && isdefined(var_d03b62b68a62fa3f)) {
            var_358d1badd2acf579 thread scene::play(function_27e66e2cf814c5e4(var_36e52d9011ebb465), var_d03b62b68a62fa3f, var_d20077db34b4c9f8);
        }
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4d9b
// Size: 0x3c
function private function_27e66e2cf814c5e4(var_36e52d9011ebb465) {
    var_3fb7720b732e55fb = [var_36e52d9011ebb465];
    if (isdefined(self.var_54e7225e3f7ea0ba)) {
        var_3fb7720b732e55fb = array_combine(var_3fb7720b732e55fb, self.var_54e7225e3f7ea0ba);
    }
    return var_3fb7720b732e55fb;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x4de0
// Size: 0x4d
function private function_dabc19c1b0a4c98c(var_36e52d9011ebb465, shot_name, struct, scriptbundle) {
    self endon("dialog_tree_end");
    self.var_f2ad955ae5c3dee8 = shot_name;
    struct scene::play(function_27e66e2cf814c5e4(var_36e52d9011ebb465), shot_name, scriptbundle);
    self notify("dialog_tree_anim_done");
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4e35
// Size: 0x3e
function private function_97c8fd6d796429cd(var_36e52d9011ebb465) {
    self.activator endon("death");
    var_36e52d9011ebb465 endon("dialog_tree_scene_response_complete");
    level waittill("dialog_tree_show_choices");
    var_36e52d9011ebb465 ent_flag_clear("_dialog_anim_playing");
    var_36e52d9011ebb465 notify("dialog_tree_scene_response_complete");
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4e7b
// Size: 0x30
function private function_6fcfd605093266bb(flagname) {
    if (!ent_flag_exist(flagname)) {
        ent_flag_init(flagname);
        ent_flag_clear(flagname);
        return;
    }
    ent_flag_waitopen(flagname);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4eb3
// Size: 0x1c6
function private function_4b2a4d126ebeef2f(var_c3529918b08e7d50) {
    var_5cd1d0ff865b8b4e = [];
    var_ed73c23c15816aba = 0;
    var_eec81e70a4cde78e = undefined;
    if (!isdefined(var_c3529918b08e7d50)) {
        var_c3529918b08e7d50 = self.options.size;
    }
    while (var_ed73c23c15816aba < self.options.size && (var_5cd1d0ff865b8b4e.size < var_c3529918b08e7d50 || self.var_b11619776bfbfa3a)) {
        option = self.options[var_ed73c23c15816aba];
        if (isdefined(option.var_f76e8406f0920af2) && option.var_f76e8406f0920af2 > 0) {
            if (self.var_28ac3afdf36f413d == 0 && istrue(option.var_672f1e3cc01453d2)) {
                self.options[var_ed73c23c15816aba].active = 1;
                if (isdefined(option.var_251b1b5ad40a075d)) {
                    flag_clear(option.var_251b1b5ad40a075d);
                }
            }
            if (self.var_28ac3afdf36f413d >= option.var_f76e8406f0920af2 && option.active) {
                self.options[var_ed73c23c15816aba].active = 0;
                if (isdefined(option.var_251b1b5ad40a075d)) {
                    flag_set(option.var_251b1b5ad40a075d);
                }
            }
        }
        option function_f644d2dc71f882d3(0);
        if (!option.active || option function_9ca2b445d85472ca() && !option.var_6c2ca93aac17e873) {
            var_ed73c23c15816aba++;
            continue;
        }
        if (option.var_2180d498dd0472c2) {
            var_eec81e70a4cde78e = var_ed73c23c15816aba;
        } else {
            var_5cd1d0ff865b8b4e[var_5cd1d0ff865b8b4e.size] = var_ed73c23c15816aba;
        }
        var_ed73c23c15816aba++;
    }
    if (isdefined(var_eec81e70a4cde78e)) {
        if (var_5cd1d0ff865b8b4e.size < var_c3529918b08e7d50) {
            var_5cd1d0ff865b8b4e[var_5cd1d0ff865b8b4e.size] = var_eec81e70a4cde78e;
        } else {
            var_5cd1d0ff865b8b4e[var_c3529918b08e7d50 - 1] = var_eec81e70a4cde78e;
        }
    }
    return var_5cd1d0ff865b8b4e;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5082
// Size: 0x82
function private function_3b353710664c8e46(parent_id) {
    foreach (option in self.options) {
        if (isdefined(option.parent_id) && option.parent_id == parent_id) {
            option.active = 1;
        }
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x510c
// Size: 0x33
function function_b78240c8809979a3(index) {
    var_6812df4b08b0f7ac = index + 1;
    var_c3bf9c174ed69562 = "^S " + var_6812df4b08b0f7ac + " ^E";
    return var_c3bf9c174ed69562;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5148
// Size: 0x24c
function function_b0a4d1a45e3cc77b(var_5cd1d0ff865b8b4e, var_36e52d9011ebb465, var_b763c53f8a399479) {
    if (!isdefined(var_b763c53f8a399479)) {
        var_b763c53f8a399479 = 4;
    }
    var_65988d9014283c34 = function_4db1d159e194fef2(var_5cd1d0ff865b8b4e, var_b763c53f8a399479);
    index = 0;
    var_274e22942d9863f3 = [];
    foreach (choice in var_65988d9014283c34) {
        if (isdefined(choice.string)) {
            self.activator function_872bbb1fa784b8d8("dialog_tree", "option_" + index, function_6cd0a8e23ff14e13("scripted_widget_dialog_option"));
            fields = [];
            fields["locstring_index"] = function_8c14a8a658013e4e(choice.string);
            fields["important"] = choice.important;
            fields["locked"] = choice function_9ca2b445d85472ca();
            self.activator function_3eec25a52a78f31f("dialog_tree", "option_" + index, fields, 1);
            var_274e22942d9863f3[index] = choice;
            index++;
        }
    }
    if (isdefined(self.timeout) && self.timeout > 0) {
        waittillframeend();
        self.activator thread function_c9f135e486f0e555();
        self.activator namespace_417b627dcd8f5453::function_12c61598be4a16cb(self.timeout, undefined, "dialog_tree_option_selected");
        self.activator function_f4c37324750dc183("coundown_display", self.position[0], self.position[1] - 20, 0, 0, 1);
    }
    player = self.activator;
    assert(isplayer(player));
    var_36e52d9011ebb465 ent_flag_set("waiting_on_player_choice");
    selected_index = level waittill("dialog_tree_option_selected");
    var_36e52d9011ebb465 ent_flag_clear("waiting_on_player_choice");
    player setclientomnvar("dialog_tree_set_skippable", self.skippable);
    if (selected_index < 0) {
        player thread function_530ad7e8e4ec7d2a(var_274e22942d9863f3, var_36e52d9011ebb465, 1);
        return selected_index;
    }
    player thread function_530ad7e8e4ec7d2a(var_274e22942d9863f3, var_36e52d9011ebb465);
    return var_5cd1d0ff865b8b4e[selected_index];
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x539c
// Size: 0x26
function private function_c9f135e486f0e555() {
    self endon("death");
    self endon("dialog_tree_option_selected");
    self waittill("countdown_end");
    self setclientomnvar("dialog_tree_send_current_selection", 1);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x53ca
// Size: 0x2a
function private function_26cc8ab8ee78d07f(value) {
    self notify("dialog_tree_option_selected", value);
    level notify("dialog_tree_option_selected", value);
    self setclientomnvar("dialog_tree_send_current_selection", 0);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x53fc
// Size: 0x13
function private function_e70848b1ace60b2d(value) {
    level notify("dialog_tree_request_skip");
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5417
// Size: 0x126
function function_dc022e76b8f26129(var_274e22942d9863f3) {
    self endon("death");
    self endon("dialog_tree_option_selected");
    self endon("disconnect");
    if (isdefined(var_274e22942d9863f3) && isdefined(var_274e22942d9863f3.size)) {
        level.waitingforresponse = 1;
        var_1642d12b40c181f9 = -1;
        while (level.waitingforresponse) {
            var_7b5323a26daf1c08 = waittill_any_return_1("dialog_tree_kbm_key_selected");
            if (var_274e22942d9863f3.size > 0 && var_7b5323a26daf1c08.var_c8bdb6079955bda2 == 1) {
                var_1642d12b40c181f9 = 0;
                level.waitingforresponse = 0;
            } else if (var_274e22942d9863f3.size > 1 && var_7b5323a26daf1c08.var_c8bdb6079955bda2 == 2) {
                var_1642d12b40c181f9 = 1;
                level.waitingforresponse = 0;
            } else if (var_274e22942d9863f3.size > 2 && var_7b5323a26daf1c08.var_c8bdb6079955bda2 == 3) {
                var_1642d12b40c181f9 = 2;
                level.waitingforresponse = 0;
            } else if (var_274e22942d9863f3.size > 3 && var_7b5323a26daf1c08.var_c8bdb6079955bda2 == 4) {
                var_1642d12b40c181f9 = 3;
                level.waitingforresponse = 0;
            }
            if (!level.waitingforresponse) {
                level notify("dialog_tree_option_selected", var_1642d12b40c181f9);
            }
            waitframe();
        }
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5545
// Size: 0x86
function function_baf288decd65aa7a(var_1c279c0e37beaf14, var_7110a51aa0dfcd6b, var_274e22942d9863f3) {
    var_b488e3faa183f632 = var_1c279c0e37beaf14[0];
    var_b48d954708f24665 = var_7110a51aa0dfcd6b[0];
    var_c97689354f6b1bd2 = var_b48d954708f24665;
    while (var_274e22942d9863f3[var_c97689354f6b1bd2] function_9ca2b445d85472ca()) {
        if (var_b48d954708f24665 < var_b488e3faa183f632) {
            var_c97689354f6b1bd2--;
        } else {
            var_c97689354f6b1bd2++;
        }
        if (var_c97689354f6b1bd2 < 0 || var_c97689354f6b1bd2 >= var_274e22942d9863f3.size) {
            var_c97689354f6b1bd2 = var_b488e3faa183f632;
            break;
        }
    }
    if (var_c97689354f6b1bd2 != var_b488e3faa183f632) {
    }
    return [var_c97689354f6b1bd2, 0];
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x55d4
// Size: 0x52
function function_530ad7e8e4ec7d2a(var_274e22942d9863f3, var_36e52d9011ebb465, var_a1598b373840eea2) {
    if (!isdefined(var_a1598b373840eea2)) {
        var_a1598b373840eea2 = 0;
    }
    if (!var_a1598b373840eea2) {
        var_36e52d9011ebb465 waittill_notify_or_timeout("dialog_tree_response_complete", 1.5);
    }
    function_5df3186604c72b24("dialog_tree");
    var_36e52d9011ebb465 ent_flag_clear("_dialog_ui_animating");
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x562e
// Size: 0x41
function function_3a5cc3b6ee866c7e(position, state_index) {
    function_440f285bc17a2787("dialog_tree", function_6cd0a8e23ff14e13("scripted_widget_dialog_tree"));
    function_f4c37324750dc183("dialog_tree", position[0], position[1], 0, 0, 1);
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5677
// Size: 0x28
function private function_87c6d037813b57c1(player_pos) {
    if (isdefined(player_pos) && isdefined(player_pos.var_d35bbd317ecfb67b)) {
        return 1;
    }
    return 0;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x56a7
// Size: 0x3b
function private function_a10c80dbb1f95f26(anim_struct, var_36e52d9011ebb465) {
    if (!isdefined(anim_struct)) {
        if (isdefined(var_36e52d9011ebb465.var_ea70e39ddb4a6465)) {
            anim_struct = var_36e52d9011ebb465.var_ea70e39ddb4a6465;
        } else {
            anim_struct = var_36e52d9011ebb465;
        }
    }
    return anim_struct;
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x56eb
// Size: 0x147
function private function_3274dd5fa9090931(var_fdf147e36d51ad1b, var_36e52d9011ebb465) {
    var_fdf147e36d51ad1b = self.var_ae6302f7f057e26f;
    struct = self.var_78db940d2989f211;
    player_positions = self.var_2c6249da4d27ca4e;
    if (isdefined(player_positions)) {
        if (!isarray(player_positions)) {
            player_positions = [player_positions];
        }
        foreach (pos in player_positions) {
            bundle = function_d66c0bfe054fd887(var_fdf147e36d51ad1b);
            pos = tolower(pos);
            var_dd3145cec7c4d4ee = function_1d41e14159f8de35(var_fdf147e36d51ad1b, pos);
            idle = function_7dc5dc6ca7fc72c4(var_fdf147e36d51ad1b, "idle");
            dt_idle = function_7dc5dc6ca7fc72c4(var_fdf147e36d51ad1b, "dt_idle");
            assertex(isdefined(var_dd3145cec7c4d4ee), "set_dt_animation_template called with invalid player position name: " + pos);
            function_20c528b5c4f4eac1(undefined, var_dd3145cec7c4d4ee.var_1a9f5b78f5ca6bb2, dt_idle, var_dd3145cec7c4d4ee.var_3dfdecf9e7345212, idle, undefined, undefined, undefined, undefined, undefined, bundle, struct);
        }
        self.var_2c6249da4d27ca4e = undefined;
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x583a
// Size: 0x6e
function function_607273064331d2b8(var_36e52d9011ebb465) {
    if (isdefined(self.var_78db940d2989f211) && !isdefined(self.var_78db940d2989f211.origin)) {
        self.var_78db940d2989f211.origin = var_36e52d9011ebb465.origin;
        self.var_78db940d2989f211.angles = var_36e52d9011ebb465.angles;
    }
}

// Namespace dialog_tree / namespace_ad7be6068a24987a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x58b0
// Size: 0x46
function private function_8647b457c8205fe3() {
    if (isai(self)) {
        self setanim(generic_human%t10_generic_dt_talking_headbob_1_m, 1);
        ent_flag_waitopen("_dialog_vo_playing");
        self setanim(generic_human%t10_generic_dt_talking_headbob_1_m, 0, 1);
    }
}

