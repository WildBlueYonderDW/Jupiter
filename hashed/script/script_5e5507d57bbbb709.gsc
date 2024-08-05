#using scripts\cp\utility.gsc;
#using script_644c18834356d9dc;
#using script_531cb1be084314f7;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using script_14609b809484646e;
#using scripts\engine\scriptable.gsc;
#using script_56ef8d52fe1b48a1;
#using script_116171939929af39;
#using scripts\cp\cp_hud_message.gsc;
#using script_7c40fa80892a721;
#using script_998572ff3c96ee5;
#using script_5e5507d57bbbb709;
#using scripts\cp\cp_checkpoint.gsc;
#using script_600b944a95c3a7bf;
#using scripts\cp\loot_system.gsc;
#using script_66122a002aff5d57;
#using script_12e2fb553ec1605e;
#using script_dcc09902e277b83;
#using script_3bcaa2cbaf54abdd;
#using script_6e09a830fab9468f;
#using script_5f28b06ce18481e6;
#using scripts\cp\cp_player_battlechatter.gsc;
#using script_7ef95bba57dc4b82;

#namespace namespace_208b85e76be8f650;

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70c
// Size: 0x18f
function init() {
    if (getdvar(@"hash_e6afce2cf5cf7515") == "1" || level.createfx_enabled) {
        return;
    }
    level thread function_a0b42c4ad579d92d();
    function_8d0097515bff3b01();
    level.var_208b85e76be8f650 = [];
    level.var_8ea1af22ffe88d13 = getdvarint(@"hash_5c3f154759eb545", 0);
    level.var_50c7b4b50d222c0 = -1;
    level.var_e85fcf89f70a718a = [];
    function_45d0b14e9cb84f7d("kitAssault", &function_9a8f60f7edd5a777, &function_b809060fb006fe63, &function_b5cde7de44edc3ed);
    function_45d0b14e9cb84f7d("kitMedic", &function_9a8f60f7edd5a777, &function_cc637a3dd608f5ee, &function_d3fa6b71dbfb70e4);
    function_45d0b14e9cb84f7d("kitRecon", &function_9a8f60f7edd5a777, &function_fc436569eeecfeb, &function_88e35eb26ea39405);
    level.var_6e1af29ff5ac9eab = create_deck(["kitMedic", "kitAssault", "kitRecon"], 1, 1);
    level namespace_9c383b14c4908e46::function_8ece37593311858a(&function_73d413e8f4d44f51);
    val::group_register("kitSelect", ["crouch", "prone", "usability", "weapon_switch", "supers", "gesture", "killstreaks", "cp_munitions", "offhand_primary_weapons", "fire", "offhand_secondary_weapons", "offhand_weapons", "allow_movement", "allow_jump", "melee"]);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a3
// Size: 0x9d
function function_a0b42c4ad579d92d() {
    level endon("game_ended");
    flag_wait("level_ready_for_script");
    if (!getdvarint(@"hash_6d1717e53049e751", 0)) {
        scripts\engine\scriptable::scriptable_addusedcallbackbypart("cp_kit_select_box", &function_6b01aba37e349764);
        return;
    }
    var_a0342fa7a0730a90 = getentarray("kitSelectBox", "script_noteworthy");
    foreach (var_c13eaee83f7969e4 in var_a0342fa7a0730a90) {
        var_c13eaee83f7969e4 delete();
    }
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x948
// Size: 0x58
function function_8d0097515bff3b01() {
    level.var_3ece19163aadf34e = [];
    for (i = 0; i < 10; i++) {
        var = tablelookupbyrow("cp/kitTierThresholds.csv", i, 1);
        level.var_3ece19163aadf34e[level.var_3ece19163aadf34e.size] = int(var);
    }
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9a8
// Size: 0x6b
function function_45d0b14e9cb84f7d(var_e05e59b00ce25f0f, var_5a9f3515a988dc27, var_c6acfae4e3bf5232, var_7d26fc6ce47a3fd1) {
    struct = spawnstruct();
    struct.var_5a9f3515a988dc27 = var_5a9f3515a988dc27;
    struct.var_c6acfae4e3bf5232 = var_c6acfae4e3bf5232;
    struct.var_2fed50eb767b607b = [];
    level.var_208b85e76be8f650[var_e05e59b00ce25f0f] = struct;
    [[ var_7d26fc6ce47a3fd1 ]]();
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1b
// Size: 0x21c
function function_73d413e8f4d44f51() {
    if (getdvarint(@"hash_d86c1c5277b6aff3", 0)) {
        return;
    }
    /#
        ent_num = "<dev string:x1c>" + self getentitynumber();
        var_cbd3f7020ec784e3 = "<dev string:x1e>" + self.name + "<dev string:x1e>";
        cmd = "<dev string:x20>" + var_cbd3f7020ec784e3 + "<dev string:x37>" + ent_num + "<dev string:x74>";
        addentrytodevgui(cmd);
        var_7fd676df2171ccea = "<dev string:x20>" + var_cbd3f7020ec784e3 + "<dev string:x78>" + ent_num + "<dev string:x74>";
        addentrytodevgui(var_7fd676df2171ccea);
        var_ccfc909803b79aaf = "<dev string:x20>" + var_cbd3f7020ec784e3 + "<dev string:xb0>" + ent_num + "<dev string:x74>";
        addentrytodevgui(var_ccfc909803b79aaf);
        var_9bdce5423e3ded97 = "<dev string:x20>" + var_cbd3f7020ec784e3 + "<dev string:xec>" + ent_num + "<dev string:x74>";
        addentrytodevgui(var_9bdce5423e3ded97);
        var_968fce5e79523a06 = "<dev string:x20>" + var_cbd3f7020ec784e3 + "<dev string:x124>" + ent_num + "<dev string:x74>";
        addentrytodevgui(var_968fce5e79523a06);
    #/
    if (getdvarint(@"hash_cde8f32ae6195947", 0)) {
        var_b77376dd31952275 = function_c6631f3a73e64004();
        rank = 10;
    } else {
        var_b77376dd31952275 = function_cc1ccc9e93b22c24();
        rank = function_ca8c9ff1ff9db6e();
    }
    if (isdefined(var_b77376dd31952275) && var_b77376dd31952275 != "") {
        if (getdvarint(@"hash_a867e9199df5f340", 0)) {
            thread function_b0a067743207e204();
        }
        if (!isdefined(self.equipment)) {
            self.equipment = [];
        }
        namespace_44edfb3e2b433c17::clear_player_class_and_super();
        thread namespace_44edfb3e2b433c17::init_super_for_player("super_default_zm");
        namespace_44edfb3e2b433c17::function_1f8539b231e93107(var_b77376dd31952275);
        thread namespace_44edfb3e2b433c17::update_super_icon(var_b77376dd31952275);
        function_2dbbfd9d03919c32();
        function_5d43ea7662b15991(var_b77376dd31952275);
        function_d1fd02a41dd4beed(rank);
        namespace_162cff1cf88b9bbf::function_f3467e4343b7b3bf(self);
        if (!istrue(self.super_displayed)) {
            self.super_displayed = 1;
        }
        self [[ level.var_208b85e76be8f650[var_b77376dd31952275].var_5a9f3515a988dc27 ]](rank);
    }
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc3f
// Size: 0x28b
function function_b0a067743207e204() {
    if (getdvarint(@"hash_6978b3f150582c40", 1)) {
        level endon("game_ended");
        self endon("disconnect");
        if (istrue(level.var_8ea1af22ffe88d13) && isdefined(self.pers) && isdefined(self.pers["kit"]) && self.pers["kit"] != "kitNone") {
            return;
        }
        self.var_7269deeba689cd65 = 1;
        if (!istrue(self.var_eaa61b501c84602e)) {
            self waittill("spawned_player");
            ent_flag_wait("player_spawned_with_loadout");
        }
        while (self isparachuting() || self isinfreefall() || !self isonground() && !self isswimming() || self isswimunderwater()) {
            waitframe();
        }
        self notifyonplayercommand("assault", "+usereload");
        self notifyonplayercommand("assault", "+activate");
        self notifyonplayercommand("medic", "-smoke");
        self notifyonplayercommand("recon", "+weapnext");
        thread scripts\cp\cp_hud_message::tutorialprint(%COOP_GAME_PLAY/KITS_TUTORIAL_HINT, 6000);
        val::group_set("kitSelect", 0);
        scripts\cp\utility::freezecontrolswrapper(1);
        disable_backpack_inventory(1);
        var_9db8f59efabb5566 = 0;
        var_197515363c80fa40 = 1;
        while (var_9db8f59efabb5566 < var_197515363c80fa40) {
            result = waittill_any_return_3("assault", "medic", "recon");
            self playlocalsound("weap_ammo_pickup");
            function_abe664c11f9d4b73();
            switch (result) {
            case #"hash_d4f05e450448c3ec": 
                function_c3cb4bdae301d5b4("kitAssault");
                break;
            case #"hash_5d3f25d7f9aa109": 
                self.pers["override_self_revive_checkpoint"] = 1;
                function_c3cb4bdae301d5b4("kitMedic");
                break;
            case #"hash_9617cc9a55eccdd4": 
                function_c3cb4bdae301d5b4("kitRecon");
                break;
            }
            var_9db8f59efabb5566++;
        }
        scripts\cp\utility::freezecontrolswrapper(0);
        val::group_reset("kitSelect");
        disable_backpack_inventory(0);
        self notifyonplayercommandremove("use", "+usereload");
        self notifyonplayercommandremove("use", "+activate");
        self notifyonplayercommandremove("stance", "+stance");
        self notifyonplayercommandremove("swap_weapon", "+weapnext");
        self notify("clear_tutorial_messages");
        self clearhudtutorialmessage();
        self.var_7269deeba689cd65 = undefined;
        rank = 10;
    }
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xed2
// Size: 0x129
function function_c3cb4bdae301d5b4(var_6f37cc057cc7abd7, var_a1f585e5e3a34cd5, var_48db175a7e02aa53, var_7afb17fcc1a24160) {
    var_63cdcd704dde8c06 = self getclientomnvar("ui_super_progress") * 1000;
    function_abe664c11f9d4b73(1);
    if (!isdefined(var_a1f585e5e3a34cd5)) {
        var_a1f585e5e3a34cd5 = 0;
    }
    function_5d43ea7662b15991(var_6f37cc057cc7abd7);
    rank = function_ca8c9ff1ff9db6e(var_6f37cc057cc7abd7, var_7afb17fcc1a24160);
    function_d1fd02a41dd4beed(rank + var_a1f585e5e3a34cd5);
    namespace_44edfb3e2b433c17::clear_player_class_and_super();
    namespace_44edfb3e2b433c17::function_1f8539b231e93107(var_6f37cc057cc7abd7);
    self.super_progress = var_63cdcd704dde8c06;
    self setclientomnvar("ui_super_progress", self.super_progress);
    self setclientomnvar("cp_super_fired", 1);
    entity_num = self getentitynumber();
    namespace_162cff1cf88b9bbf::function_f3467e4343b7b3bf(self);
    self.disable_super = 0;
    thread namespace_44edfb3e2b433c17::update_super_icon(var_6f37cc057cc7abd7);
    if (self.super_progress > 998) {
        namespace_44edfb3e2b433c17::display_super_ready_splash();
    }
    self.var_48db175a7e02aa53 = var_48db175a7e02aa53;
    self [[ level.var_208b85e76be8f650[var_6f37cc057cc7abd7].var_5a9f3515a988dc27 ]](function_ca8c9ff1ff9db6e(undefined, var_7afb17fcc1a24160));
    namespace_f8d3520d3483c1::setarmoromnvars();
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1003
// Size: 0x63
function function_abe664c11f9d4b73(var_55f9f0077c3f0cc7) {
    var_b77376dd31952275 = function_cab56589fd214c7e();
    if (!isdefined(var_b77376dd31952275) || var_b77376dd31952275 != "kitNone") {
        if (isdefined(var_b77376dd31952275)) {
            self [[ level.var_208b85e76be8f650[var_b77376dd31952275].var_c6acfae4e3bf5232 ]]();
        }
        if (!istrue(var_55f9f0077c3f0cc7)) {
            function_5d43ea7662b15991("kitNone");
        }
    }
    function_85f298a56d597983();
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x106e
// Size: 0x56
function function_cc1ccc9e93b22c24() {
    if (!isdefined(self.pers["kit"])) {
        var_b77376dd31952275 = self getplayerdata("cp", "progression", "playerKit", "currentKit");
        if (isdefined(var_b77376dd31952275)) {
            return var_b77376dd31952275;
        }
        return "kitMedic";
    }
    return self.pers["kit"];
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10cd
// Size: 0x34
function function_c6631f3a73e64004() {
    if (!isdefined(self.pers["kit"])) {
        return level.var_6e1af29ff5ac9eab deck_draw();
    }
    return self.pers["kit"];
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x110a
// Size: 0x16
function function_5bdd1bea0ed10416(var_e05e59b00ce25f0f) {
    return level.var_208b85e76be8f650[var_e05e59b00ce25f0f];
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1129
// Size: 0xd8
function function_752e4abf5dd0ffbf(var_e05e59b00ce25f0f, rank, var_1fd55d8aa62db0ea, param1, param2) {
    var_698900c6211cc03c = function_5bdd1bea0ed10416(var_e05e59b00ce25f0f);
    if (isdefined(var_698900c6211cc03c) && isdefined(var_698900c6211cc03c.var_2fed50eb767b607b)) {
        struct = spawnstruct();
        struct.var_1fd55d8aa62db0ea = var_1fd55d8aa62db0ea;
        struct.param1 = param1;
        struct.param2 = param2;
        if (!isdefined(var_698900c6211cc03c.var_2fed50eb767b607b[rank])) {
            var_698900c6211cc03c.var_2fed50eb767b607b[rank] = [];
        }
        size = var_698900c6211cc03c.var_2fed50eb767b607b[rank].size;
        var_698900c6211cc03c.var_2fed50eb767b607b[rank][size] = struct;
    }
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1209
// Size: 0xc
function function_c4fd5298f57f111() {
    return isdefined(self.var_698900c6211cc03c);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x121e
// Size: 0x1a
function function_6fca2e13ace44fbd() {
    if (function_c4fd5298f57f111()) {
        return self.var_698900c6211cc03c;
    }
    return undefined;
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1240
// Size: 0x24
function function_cab56589fd214c7e() {
    if (function_c4fd5298f57f111()) {
        return self.var_698900c6211cc03c.kit;
    }
    return undefined;
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x126c
// Size: 0x24
function function_7b2a99b6a0ec3642() {
    if (function_c4fd5298f57f111()) {
        return self.var_698900c6211cc03c.var_50a1492d3aaabb79;
    }
    return undefined;
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1298
// Size: 0x47
function function_2dbbfd9d03919c32() {
    struct = spawnstruct();
    struct.kit = "";
    struct.rank = 0;
    struct.var_50a1492d3aaabb79 = [];
    self.var_698900c6211cc03c = struct;
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12e7
// Size: 0x58
function function_5d43ea7662b15991(kit) {
    self.var_698900c6211cc03c.kit = kit;
    self.pers["kit"] = kit;
    if (kit == "kitNone") {
        return;
    }
    self setplayerdata("cp", "progression", "playerKit", "currentKit", kit);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1347
// Size: 0x51
function function_d1fd02a41dd4beed(rank) {
    /#
        self.var_698900c6211cc03c.rank = rank;
    #/
    var_7bd982b079077285 = function_e39ac4b1f5dca89b();
    self setplayerdata("cp", "progression", "playerKit", "kitTiers", var_7bd982b079077285, rank);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13a0
// Size: 0x6b
function function_9d47d4e65a0d8124(var_884f54b50e2552f9) {
    if (!isdefined(var_884f54b50e2552f9)) {
        var_4b49758599569d84 = namespace_6652f29dded2b69b::function_9f35ebf8db17e8d9(function_cc1ccc9e93b22c24());
    } else {
        var_4b49758599569d84 = namespace_6652f29dded2b69b::function_9f35ebf8db17e8d9(var_884f54b50e2552f9);
    }
    for (i = 0; i < level.var_3ece19163aadf34e.size; i++) {
        if (var_4b49758599569d84 >= level.var_3ece19163aadf34e[i]) {
            continue;
        }
        return i;
    }
    return 10;
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1414
// Size: 0x53
function function_e39ac4b1f5dca89b() {
    kit = function_cc1ccc9e93b22c24();
    switch (kit) {
    case #"hash_36cdfbfaeba9a21a": 
        return "assaultTier";
    case #"hash_f7803221ec64d903": 
        return "medicTier";
    case #"hash_2b0e6b98c99852f2": 
        return "reconTier";
    }
    return undefined;
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1470
// Size: 0x44
function function_ca8c9ff1ff9db6e(var_884f54b50e2552f9, var_7afb17fcc1a24160) {
    /#
        if (isdefined(self.var_698900c6211cc03c) && istrue(var_7afb17fcc1a24160)) {
            return self.var_698900c6211cc03c.rank;
        }
    #/
    return namespace_1f50a6a7107e9381::function_9d47d4e65a0d8124(var_884f54b50e2552f9);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14bd
// Size: 0x61
function function_524b29e68c474a9d(perk_name) {
    self.var_698900c6211cc03c.var_50a1492d3aaabb79 = function_6d6af8144a5131f1(self.var_698900c6211cc03c.var_50a1492d3aaabb79, perk_name);
    if (issharedfuncdefined("perk", "givePerk")) {
        self [[ getsharedfunc("perk", "givePerk") ]](perk_name);
    }
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1526
// Size: 0xae
function function_629fc96f1bbf9884(result, instance) {
    if (result == 0) {
        return;
    }
    var_17a208de8e7cd188 = "";
    switch (result) {
    case 1: 
        var_17a208de8e7cd188 = "kitAssault";
        break;
    case 2: 
        self.pers["override_self_revive_checkpoint"] = 1;
        var_17a208de8e7cd188 = "kitMedic";
        break;
    case 3: 
        var_17a208de8e7cd188 = "kitRecon";
        break;
    }
    function_c3cb4bdae301d5b4(var_17a208de8e7cd188, undefined, 1);
    if (isdefined(result) && result > 0 && result <= 3) {
        function_544e73b4ae5d3735(instance);
    }
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15dc
// Size: 0x20
function function_544e73b4ae5d3735(instance) {
    instance.disabled_use_for[self getentitynumber()] = 1;
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1604
// Size: 0xc3
function function_6b01aba37e349764(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    self endon("disconnect");
    level endon("game_ended");
    if (isdefined(instance.disabled_use_for) && istrue(instance.disabled_use_for[player getentitynumber()])) {
        player thread scripts\cp\utility::hint_prompt("cant_use_kit_select_again", 1, 2);
        return;
    }
    player openmenu("CPKitSelect");
    player freezecontrols(1);
    player thread function_32983028a7e81ab3("luinotifyserver");
    result = player waittill("exit_kit_select");
    player function_629fc96f1bbf9884(result, instance);
    player freezecontrols(0);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16d0
// Size: 0x6d
function function_32983028a7e81ab3(actionnotify) {
    self endon("exit_kit_select");
    while (true) {
        param1, param2 = self waittill(actionnotify);
        if (actionnotify == "luinotifyserver") {
            if (param1 != "kit_select") {
                if (param1 == "kit_menu_closed") {
                    self notify("exit_kit_select", param2);
                    break;
                }
                continue;
            }
        }
        self notify("exit_kit_select", param2);
        break;
    }
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1745
// Size: 0x73
function function_3b92ce1d90f10a43(player, scriptablename, var_43fb3d97abb79854, countoverride, fromkiosk, droppurchased, var_db943473454f6ea6) {
    player endon("disconnect");
    if (!istrue(self.var_eaa61b501c84602e)) {
        self waittill("spawned_player");
        ent_flag_wait("player_spawned_with_loadout");
    }
    namespace_bc7b29dcc022d887::br_forcegivecustompickupitem(player, scriptablename, var_43fb3d97abb79854, countoverride, fromkiosk, droppurchased, var_db943473454f6ea6);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x17c0
// Size: 0x33b
function function_4a1fd54affdaa367(killstreak_name, var_ba94bd87c4bc896a, replace_existing, var_76e8f75ad48a3817, var_fdbe3e771645f346, backpackequip, pickupent) {
    self endon("disconnect");
    if (!istrue(var_ba94bd87c4bc896a) && !istrue(self.var_eaa61b501c84602e)) {
        self waittill("spawned_player");
        ent_flag_wait("player_spawned_with_loadout");
    }
    if (!isdefined(self.var_48db175a7e02aa53)) {
        self.var_48db175a7e02aa53 = 0;
    }
    if (istrue(var_76e8f75ad48a3817) && !istrue(self.var_48db175a7e02aa53)) {
        checkpoint = scripts\cp\cp_checkpoint::function_9eed75023a958c18();
        if (isdefined(checkpoint) && checkpoint != "") {
            return;
        }
    }
    var_67ac588b82b6e3c9 = 0;
    if (istrue(replace_existing)) {
        if (istrue(var_67ac588b82b6e3c9)) {
            if (isdefined(self.munition_slots)) {
                munitions = self.munition_slots;
                foreach (var_a7f7342abaca0e34 in munitions) {
                    if (isdefined(var_a7f7342abaca0e34.ref) && var_a7f7342abaca0e34.ref == killstreak_name) {
                        return;
                    }
                }
            }
        } else {
            munitions = self.munition_slots;
            foreach (var_a7f7342abaca0e34 in munitions) {
                if (isdefined(var_a7f7342abaca0e34.ref) && var_a7f7342abaca0e34.ref == killstreak_name) {
                    return;
                }
            }
        }
    }
    if (isdefined(backpackequip) && backpackequip) {
        ref = function_9ee17a338bde061b(killstreak_name);
        lootid = namespace_38b993c4618e76cd::getlootidfromref(ref);
        namespace_bc7b29dcc022d887::function_6f39f9916649ac48(lootid, 1);
    }
    var_6e1ec6f2c0ee6b2c = undefined;
    total_slots = self getplayerdata("cp", "inventorySlots", "totalSlots");
    if (total_slots < 4) {
        var_6e1ec6f2c0ee6b2c = total_slots;
    } else {
        var_6e1ec6f2c0ee6b2c = self.dpad_selection_index - 1;
    }
    if (scripts\cp\loot_system::is_empty_or_none(0)) {
        var_6e1ec6f2c0ee6b2c = 0;
    } else if (function_240f7f4e57340e8f()) {
        if (level.noinventory) {
            ref = self.munition_slots[0].ref;
            namespace_6250b14b3f614101::function_21779eb63ee9edb0(namespace_38b993c4618e76cd::function_b88cfb4893ceedac(ref), undefined, undefined, 1, undefined, undefined, 3, undefined, pickupent);
        } else {
            ref = namespace_94359011b63230a6::function_9ee17a338bde061b(self.munition_slots[0].ref);
            namespace_6250b14b3f614101::addItemToBackpackByRef(ref, "killstreak", 1);
        }
        lootid = namespace_38b993c4618e76cd::getlootidfromref(ref);
        level.var_50c7b4b50d222c0++;
        level.var_e85fcf89f70a718a[level.var_50c7b4b50d222c0] = lootid;
        remove_munition(0, self.munition_slots[0].ref);
        var_6e1ec6f2c0ee6b2c = 0;
    } else {
        scripts\cp\utility::hint_prompt("munition_slots_full", 1, 2);
        return 0;
    }
    scripts\cp\loot_system::try_give_munition_to_slot(killstreak_name, var_6e1ec6f2c0ee6b2c);
    if (!istrue(var_fdbe3e771645f346)) {
        thread namespace_751288259782653c::function_7da7bd24b280d295();
    }
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b03
// Size: 0x20c
function function_4b1cba62d1e11ff7(var_d9b267fbab31c914) {
    if (!isdefined(var_d9b267fbab31c914)) {
        current_rank = function_ca8c9ff1ff9db6e();
    } else {
        current_rank = var_d9b267fbab31c914;
        function_d1fd02a41dd4beed(var_d9b267fbab31c914);
    }
    var_d95570ee57aa059a = function_5bdd1bea0ed10416(function_cab56589fd214c7e());
    for (i = 1; i <= current_rank; i++) {
        if (isdefined(var_d95570ee57aa059a.var_2fed50eb767b607b[i])) {
            for (j = 0; j < var_d95570ee57aa059a.var_2fed50eb767b607b[i].size; j++) {
                if (isdefined(var_d95570ee57aa059a.var_2fed50eb767b607b[i][j].param1) && isdefined(var_d95570ee57aa059a.var_2fed50eb767b607b[i][j].param2)) {
                    param1 = var_d95570ee57aa059a.var_2fed50eb767b607b[i][j].param1;
                    param2 = var_d95570ee57aa059a.var_2fed50eb767b607b[i][j].param2;
                    self [[ var_d95570ee57aa059a.var_2fed50eb767b607b[i][j].var_1fd55d8aa62db0ea ]](param1, param2);
                    continue;
                }
                if (isdefined(var_d95570ee57aa059a.var_2fed50eb767b607b[i][j].param1)) {
                    param1 = var_d95570ee57aa059a.var_2fed50eb767b607b[i][j].param1;
                    self [[ var_d95570ee57aa059a.var_2fed50eb767b607b[i][j].var_1fd55d8aa62db0ea ]](param1);
                    continue;
                }
                if (isdefined(var_d95570ee57aa059a.var_2fed50eb767b607b[i][j].param2)) {
                    param2 = var_d95570ee57aa059a.var_2fed50eb767b607b[i][j].param2;
                    self [[ var_d95570ee57aa059a.var_2fed50eb767b607b[i][j].var_1fd55d8aa62db0ea ]](param2);
                    continue;
                }
                self [[ var_d95570ee57aa059a.var_2fed50eb767b607b[i][j].var_1fd55d8aa62db0ea ]]();
            }
        }
    }
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d17
// Size: 0x79
function function_b5cde7de44edc3ed() {
    function_752e4abf5dd0ffbf("kitAssault", 1, &function_4edbe9015e9d9db9);
    function_752e4abf5dd0ffbf("kitAssault", 1, &function_de0a1791020ffab7);
    function_752e4abf5dd0ffbf("kitAssault", 3, &function_2d374978bbe91095);
    function_752e4abf5dd0ffbf("kitAssault", 5, &function_524b29e68c474a9d, "specialty_fastreload");
    function_752e4abf5dd0ffbf("kitAssault", 7, &function_d9a2d7048746d025);
    function_752e4abf5dd0ffbf("kitAssault", 10, &function_c896ad3e605a6807);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d98
// Size: 0xc6
function function_88e35eb26ea39405() {
    function_752e4abf5dd0ffbf("kitRecon", 1, &function_cb75c83d0c8a3a1a);
    function_752e4abf5dd0ffbf("kitRecon", 1, &function_524b29e68c474a9d, "specialty_pitcher");
    function_752e4abf5dd0ffbf("kitRecon", 1, &function_524b29e68c474a9d, "specialty_missileprediction");
    function_752e4abf5dd0ffbf("kitRecon", 3, &function_6bad71dd9c815118);
    function_752e4abf5dd0ffbf("kitRecon", 3, &function_5c191edc29023e9a);
    function_752e4abf5dd0ffbf("kitRecon", 5, &function_524b29e68c474a9d, "specialty_restock");
    function_752e4abf5dd0ffbf("kitRecon", 7, &function_524b29e68c474a9d, "specialty_extra_tactical");
    function_752e4abf5dd0ffbf("kitRecon", 7, &function_524b29e68c474a9d, "specialty_extra_deadly");
    function_752e4abf5dd0ffbf("kitRecon", 10, &function_a6f8f16be96637ec);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e66
// Size: 0x7e
function function_d3fa6b71dbfb70e4() {
    function_752e4abf5dd0ffbf("kitMedic", 1, &function_9b85f157df1ddf00);
    function_752e4abf5dd0ffbf("kitMedic", 1, &function_524b29e68c474a9d, "specialty_quick_revive");
    function_752e4abf5dd0ffbf("kitMedic", 3, &function_aad0f192d3283e7d);
    function_752e4abf5dd0ffbf("kitMedic", 5, &function_cb70876971fe7047);
    function_752e4abf5dd0ffbf("kitMedic", 7, &function_524b29e68c474a9d, "specialty_supersprint_enhanced");
    function_752e4abf5dd0ffbf("kitMedic", 10, &function_9f254ea2de3f9f5f);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1eec
// Size: 0x13
function function_9a8f60f7edd5a777(rank) {
    function_4b1cba62d1e11ff7(rank);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f07
// Size: 0x57
function function_fc436569eeecfeb() {
    function_79cd95da38030c14();
    var_6f5c14dd461605b4 = ["brloot_offhand_binoculars", "brloot_offhand_heartbeatsensor", "brloot_offhand_snapshot"];
    function_dcd93712b7924616(var_6f5c14dd461605b4);
    function_85f298a56d597983();
    function_76634baec9299866("cluster_spike");
    function_76634baec9299866("sentry");
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f66
// Size: 0x5f
function function_cc637a3dd608f5ee() {
    var_6f5c14dd461605b4 = ["brloot_health_adrenaline"];
    var_6f5c14dd461605b4 = ["brloot_offhand_claymore", "brloot_offhand_atmine"];
    function_dcd93712b7924616(var_6f5c14dd461605b4);
    function_d5672d0b0bf9c5ed();
    function_76634baec9299866("assault_drone");
    function_85f298a56d597983();
    namespace_ce29426d87a9df99::function_f5037ba4a5399b63(undefined, 1);
    function_79cd95da38030c14();
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fcd
// Size: 0x71
function function_b809060fb006fe63() {
    var_6f5c14dd461605b4 = ["brloot_health_adrenaline"];
    function_dcd93712b7924616(var_6f5c14dd461605b4);
    function_85f298a56d597983();
    function_79cd95da38030c14();
    self.hasplatepouch = 0;
    self setclientomnvar("ui_br_has_plate_pouch", 0);
    platecount = namespace_f8d3520d3483c1::function_600f6cf462e983f();
    if (platecount >= 4) {
        namespace_f8d3520d3483c1::function_774133dc8df0ccd5(3);
    }
    function_76634baec9299866("assault_suit");
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2046
// Size: 0x16
function function_d5672d0b0bf9c5ed() {
    if (istrue(self.hasselfrevivetoken)) {
        namespace_6250b14b3f614101::removeselfrevivetoken();
    }
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2064
// Size: 0x76
function function_79cd95da38030c14() {
    self setclientomnvar("ui_field_upgrade_icon", 0);
    self.super_progress = 0;
    self setclientomnvar("ui_super_progress", self.super_progress);
    self setclientomnvar("cp_super_fired", 0);
    entity_num = self getentitynumber();
    namespace_6c67e93a4c487d83::setcoopplayerdata_for_everyone("EoGPlayer", entity_num, "playerRole", "none");
    namespace_44edfb3e2b433c17::function_674934b4db05639a(undefined);
    self.disable_super = 1;
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20e2
// Size: 0x35
function function_76634baec9299866(killstreak_name) {
    var_e6b96cf88b444fa2 = namespace_94359011b63230a6::function_346cde477a4fef90(killstreak_name);
    if (isdefined(var_e6b96cf88b444fa2)) {
        thread namespace_94359011b63230a6::remove_munition(var_e6b96cf88b444fa2, killstreak_name);
        scripts\cp\utility::function_98f7ca3781dac77c(self, killstreak_name);
    }
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x211f
// Size: 0x58
function function_85f298a56d597983() {
    perks = function_7b2a99b6a0ec3642();
    if (isdefined(perks) && perks.size > 0) {
        for (i = 0; i < perks.size; i++) {
            namespace_c4cab616edf9b2b9::function_bc0b60676ef3d606(perks[i]);
        }
    }
    self.var_698900c6211cc03c.var_50a1492d3aaabb79 = [];
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x217f
// Size: 0x79
function function_dcd93712b7924616(var_6f5c14dd461605b4) {
    foreach (equipment_name in var_6f5c14dd461605b4) {
        var_1ff41a59e586a8f6 = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(equipment_name);
        var_b1d08a268f49bb60 = namespace_bc7b29dcc022d887::getTotalItemCountInBag(var_1ff41a59e586a8f6);
        namespace_bc7b29dcc022d887::function_6f39f9916649ac48(var_1ff41a59e586a8f6, var_b1d08a268f49bb60);
    }
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2200
// Size: 0x14
function function_cb70876971fe7047() {
    thread function_4a1fd54affdaa367("assault_drone", undefined, 1, 1);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x221c
// Size: 0x14
function function_6bad71dd9c815118() {
    thread function_4a1fd54affdaa367("cluster_spike", undefined, 1, 1);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2238
// Size: 0x14
function function_5c191edc29023e9a() {
    thread function_4a1fd54affdaa367("sentry", undefined, 1, 1);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2254
// Size: 0x14
function function_2d374978bbe91095() {
    thread function_4a1fd54affdaa367("assault_suit", undefined, 1, 1);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2270
// Size: 0xe
function function_b0fa6dd6b3535ac3() {
    namespace_44edfb3e2b433c17::function_674934b4db05639a(&namespace_aa50c3a113d96b64::function_905b7bada6fd91cb);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2286
// Size: 0x1c
function function_4edbe9015e9d9db9() {
    self.var_a7e974288e869605 = "iw8_armor_marker_cp";
    namespace_44edfb3e2b433c17::function_674934b4db05639a(&function_b0b1d13fefe14cd2);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22aa
// Size: 0x20
function function_b0b1d13fefe14cd2() {
    thread namespace_94359011b63230a6::give_deployable_crate(self.var_a7e974288e869605);
    thread scripts\cp\cp_player_battlechatter::function_204aeba40a2aa027("super_armor_drop");
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22d2
// Size: 0xe
function function_9b85f157df1ddf00() {
    namespace_44edfb3e2b433c17::function_674934b4db05639a(&namespace_ce29426d87a9df99::function_321c7891711e583f);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22e8
// Size: 0xe
function function_cb75c83d0c8a3a1a() {
    namespace_44edfb3e2b433c17::function_674934b4db05639a(&namespace_44edfb3e2b433c17::function_832d0277ebcade25);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22fe
// Size: 0x2e
function function_a6f8f16be96637ec() {
    thread function_3b92ce1d90f10a43(self, "brloot_offhand_binoculars", 1, 1, 0, 0, 1);
    thread function_3b92ce1d90f10a43(self, "brloot_offhand_heartbeatsensor", 1, 1, 0, 0, 1);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2334
// Size: 0x39
function function_9f254ea2de3f9f5f() {
    var_b1d08a268f49bb60 = 2;
    thread function_3b92ce1d90f10a43(self, "brloot_offhand_claymore", 1, var_b1d08a268f49bb60, 0, 0, 1);
    thread function_3b92ce1d90f10a43(self, "brloot_offhand_atmine", 1, var_b1d08a268f49bb60, 0, 0, 1);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2375
// Size: 0x1b
function function_d9a2d7048746d025() {
    self.hasplatepouch = 1;
    self setclientomnvar("ui_br_has_plate_pouch", 1);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2398
// Size: 0x24
function function_c896ad3e605a6807() {
    var_742c00f7a44f0da1 = 2;
    thread function_3b92ce1d90f10a43(self, "brloot_health_adrenaline", 1, var_742c00f7a44f0da1, 0, 0, 1);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23c4
// Size: 0x98
function function_aad0f192d3283e7d() {
    checkpoint = scripts\cp\cp_checkpoint::function_9eed75023a958c18();
    if (!isdefined(checkpoint) || checkpoint == "" || istrue(self.pers["override_self_revive_checkpoint"])) {
        self.pers["has_revive_token"] = undefined;
        self.pers["override_self_revive_checkpoint"] = undefined;
    }
    if ((istrue(self.pers["has_revive_token"]) || !isdefined(self.pers["has_revive_token"])) && !istrue(self.pers["dropped_initial_revive_token"])) {
        namespace_6250b14b3f614101::takerevivepickup();
    }
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2464
// Size: 0xe
function function_de0a1791020ffab7() {
    function_524b29e68c474a9d("specialty_extra_armor");
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x247a
// Size: 0x2
function function_4fd9b1fc1595a0d6() {
    
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2484
// Size: 0x2
function function_9ead8327db60741d() {
    
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x248e
// Size: 0xe
function function_a2d01b1b2cae74a0() {
    function_524b29e68c474a9d("specialty_increased_armor_health");
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24a4
// Size: 0x2
function function_ed63fce898dc9a95() {
    
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24ae
// Size: 0x65
function function_df71d6671cdffe96() {
    self endon("disconnect");
    self waittill("spawned_player");
    ent_flag_wait("player_spawned_with_loadout");
    var_918c7d3ed87ea3e8 = namespace_4fb9dddfb8c1a67a::getequipmentslotammo("primary");
    var_dca226ee1d93a538 = namespace_4fb9dddfb8c1a67a::getequipmentslotammo("secondary");
    namespace_4fb9dddfb8c1a67a::setequipmentslotammo("primary", 5);
    namespace_4fb9dddfb8c1a67a::setequipmentslotammo("secondary", 5);
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x251b
// Size: 0x2
function give_scout_drone() {
    
}

// Namespace namespace_208b85e76be8f650 / namespace_1f50a6a7107e9381
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2525
// Size: 0x2
function blank() {
    
}

