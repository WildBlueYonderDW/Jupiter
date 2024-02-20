// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_639bf783929acf9b;
#using script_7b2517368c79e5bc;
#using script_860bfdfe82326e3;
#using script_2583ee5680cf4736;
#using script_443d99fe707f1d9f;
#using scripts\mp\weapons.gsc;
#using script_2669878cf5a1b6bc;

#namespace wallbuy;

// Namespace wallbuy/namespace_a7b2869544232202
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ef
// Size: 0x141
function function_c540b0eec3efbd34(var_9280820d730cbb33) {
    flag_init("wallbuy_ready");
    level.var_ac94bcc5062b5017 = getscriptbundle("wallbuy:" + level.var_1a2b600a06ec21f4.var_ac94bcc5062b5017);
    namespace_4164bc931714b00b::function_72f3dd0512f43c96("wallbuy", &function_d7cd77868ae1e1cf);
    level.var_c8e039bf171c3584 = function_53c4c53197386572(level.var_96c4059aa2eabfb8["wallbuy_settings"].var_13d48225bc483f59, "essence");
    level.var_47f8c4345e50b425 = function_53c4c53197386572(level.var_96c4059aa2eabfb8["wallbuy_settings"].var_2e57b9b53a463b3b, 1000);
    level.var_9280820d730cbb33 = [];
    level function_e2b981c1ea3f16bb(var_9280820d730cbb33);
    /#
        level thread function_3b908ba6fc40daf4();
    #/
    level._effect["vfx_wallbuy_reveal_xlg"] = loadfx(function_53c4c53197386572(level.var_ac94bcc5062b5017.var_2a2ce972227ade52, "vfx/jup/ob/gameplay/zm/vfx_wallbuy_reveal_xlg.vfx"));
    if (!istrue(level.var_1a2b600a06ec21f4.var_7746f48b0ed07126)) {
        level thread function_fc548d70e78f7672();
    } else {
        level callback::add("ob_content_process_create_script", &function_817c8799aa3c100b);
    }
    level callback::add("on_round_end", &on_round_end);
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x737
// Size: 0x30
function function_3b908ba6fc40daf4() {
    /#
        function_6e7290c8ee4f558b("base");
        function_a9a864379a098ad6("SHARED_HINTSTRINGS/WALLBUY_HINT_PURPLE_ESSENCE", "<unknown string>", &function_b5a3a7840d51404a, 0);
        function_fe953f000498048f();
    #/
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76e
// Size: 0xa0
function function_fc548d70e78f7672() {
    level endon("game_ended");
    waittillframeend();
    wait(1);
    level namespace_3c37cb17ade254d::flag_wait("StartGameTypeCallbackFinished");
    var_e10b8f561af1621c = getstructarray("content_destination", "variantname");
    if (isdefined(var_e10b8f561af1621c) && var_e10b8f561af1621c.size > 0) {
        foreach (destination in var_e10b8f561af1621c) {
            level function_ebf02b0dd91b2553(destination);
        }
    }
    flag_set("wallbuy_ready");
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x815
// Size: 0xd3
function function_ebf02b0dd91b2553(destination) {
    foreach (location in destination.locations) {
        wallbuy = location.instances["wallbuy"];
        if (isdefined(wallbuy)) {
            foreach (instance in wallbuy.var_67b2b78e28eaa758) {
                namespace_4164bc931714b00b::function_7e2984b7610f3616(instance);
            }
        }
    }
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ef
// Size: 0x160
function function_817c8799aa3c100b(var_d27680ff86693f5c) {
    level.var_9018e49e6fa42f08 = [];
    var_3c3122af5c02bd7 = getstructarray("content_struct", "variantname");
    var_fa6d1b1ae29d0e32 = [];
    foreach (struct in var_3c3122af5c02bd7) {
        if (!isdefined(struct.var_2dda78d4f81fa52f) && isdefined(struct.content_key) && struct.content_key == "wallbuy_spawn") {
            var_fa6d1b1ae29d0e32[var_fa6d1b1ae29d0e32.size] = struct;
        }
    }
    if (isdefined(level.var_c383b967aa7e551b)) {
        var_fa6d1b1ae29d0e32 = [[ level.var_c383b967aa7e551b ]]("wallbuy", var_fa6d1b1ae29d0e32);
    }
    foreach (struct in var_fa6d1b1ae29d0e32) {
        var_4f61861824d8fa0c = function_502812469b62f7e9(struct);
        level.var_9018e49e6fa42f08 = array_add(level.var_9018e49e6fa42f08, var_4f61861824d8fa0c);
    }
    callback::callback("ob_wallbuys_create_script_done");
    flag_set("wallbuy_ready");
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa56
// Size: 0x9e
function function_d7cd77868ae1e1cf(struct) {
    /#
        assert(isstruct(struct), "no struct on spawn wallbuy");
    #/
    if (isdefined(level.var_2a4098e63ea03444)) {
        return;
    }
    spawn_points = struct.var_305e36cbb51f88ce["wallbuy_spawn"];
    if (isdefined(spawn_points)) {
        foreach (point in spawn_points) {
            point function_502812469b62f7e9(point, undefined);
        }
    }
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafb
// Size: 0xa7
function function_e2b981c1ea3f16bb(var_9280820d730cbb33) {
    if (isdefined(level.var_96c4059aa2eabfb8)) {
        var_9280820d730cbb33 = [];
        foreach (str_weapon_name, s_weapon in level.var_96c4059aa2eabfb8) {
            if (isstruct(s_weapon) && isdefined(s_weapon.var_3f8c2b14fee7c570)) {
                var_9280820d730cbb33[str_weapon_name] = s_weapon;
            }
        }
    }
    /#
        if (!isdefined(var_9280820d730cbb33)) {
            /#
                assertmsg("<unknown string>");
            #/
        }
    #/
    level.var_9280820d730cbb33 = var_9280820d730cbb33;
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba9
// Size: 0x18a
function function_81deca73d6175a9f(point, var_be38caf5ebf5f190) {
    defaultweapon = "ob_jup_item_weapon_ar_bromeo805";
    var_73069b4add1e8094 = "difficulty_undefined";
    if (!isdefined(var_be38caf5ebf5f190)) {
        if (isfunction(level.var_8241e0d86017df29)) {
            var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](point);
        }
    } else {
        var_73069b4add1e8094 = var_be38caf5ebf5f190;
    }
    if (var_73069b4add1e8094 != "difficulty_undefined" && isdefined(level.var_ac94bcc5062b5017.var_cdf4932cd16b6e4a)) {
        var_4a5bbe8944462821 = 0;
        switch (var_73069b4add1e8094) {
        case #"hash_7bb2cd766703d463":
            var_4a5bbe8944462821 = level.var_ac94bcc5062b5017.var_ed65d59790f580ff;
            break;
        case #"hash_af83e47edfa8900a":
            var_4a5bbe8944462821 = level.var_ac94bcc5062b5017.var_418e7db783eb7192;
            break;
        case #"hash_5343b465e56ec9a4":
            var_4a5bbe8944462821 = level.var_ac94bcc5062b5017.var_54091de8661b6114;
            break;
        default:
            var_4a5bbe8944462821 = level.var_ac94bcc5062b5017.var_54091de8661b6114;
            break;
        }
        if (isdefined(var_4a5bbe8944462821)) {
            var_d2b6ab469c785a9c = function_bc2f4857c90f5344(var_4a5bbe8944462821, 1);
            var_50c7ac5966675b5f = getscriptbundle("itemspawnentry:" + var_d2b6ab469c785a9c[0]);
            if (isdefined(var_50c7ac5966675b5f) && isdefined(var_50c7ac5966675b5f.baseweapon)) {
                return var_50c7ac5966675b5f.baseweapon;
            }
            return defaultweapon;
        }
    }
    /#
        println("<unknown string>");
    #/
    return defaultweapon;
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3b
// Size: 0xbf
function function_17f886f2f83d4aee(var_ceab0569f6f2612b, weapon_name) {
    difficulty = undefined;
    switch (weapon_name) {
    case #"hash_b2e10c40219f4a4e":
        return [0:weapon_name, 1:1];
        break;
    case #"hash_effd2298700f0b22":
        return [0:weapon_name, 1:1, 2:"difficulty_easy"];
        break;
    case #"hash_b2671eb78c100817":
        return [0:weapon_name, 1:1, 2:"difficulty_normal"];
        break;
    case #"hash_b0f23a91ee977869":
        return [0:weapon_name, 1:1, 2:"difficulty_hard"];
        break;
    }
    return [0:weapon_name, 1:0];
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe02
// Size: 0x63
function function_8bcac17d9bd3492b(var_ceab0569f6f2612b, weapon_name) {
    var_203e174ed8dba57f = function_17f886f2f83d4aee(var_ceab0569f6f2612b, weapon_name);
    weapon_name = var_203e174ed8dba57f[0];
    var_60b4527dfd61e530 = var_203e174ed8dba57f[1];
    var_fc4ffac4746eb217 = var_203e174ed8dba57f[2];
    if (var_60b4527dfd61e530) {
        weapon_name = function_81deca73d6175a9f(var_ceab0569f6f2612b.origin, var_fc4ffac4746eb217);
    }
    return weapon_name;
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6d
// Size: 0x241
function function_502812469b62f7e9(var_ceab0569f6f2612b, var_3a42d378176ca3cf) {
    weapon_name = var_ceab0569f6f2612b.script_noteworthy;
    weapon_name = function_8bcac17d9bd3492b(var_ceab0569f6f2612b, weapon_name);
    if (!isdefined(weapon_name)) {
        /#
            assert("wallbuy needs script_noteworthy with weapon name");
        #/
    }
    weapon = makeweapon(weapon_name);
    var_88260bb1ed608124 = weapon.var_9d7facbe889e667c;
    scriptablename = function_5075f6a4731236e6(var_88260bb1ed608124);
    if (isdefined(scriptablename)) {
        rarity = var_ceab0569f6f2612b function_832a1fa43c4f3c7a();
        if (isdefined(var_3a42d378176ca3cf)) {
            rarity = var_3a42d378176ca3cf;
        }
        var_47f8c4345e50b425 = function_86989ab07942c980(var_88260bb1ed608124, rarity);
        wallbuy_weapon = function_ad4352ac1dfd7c59(var_88260bb1ed608124);
        var_6db60abdb1e9e33f = function_3683d3c5ee60fb1e(var_88260bb1ed608124);
        var_2dda78d4f81fa52f = spawnscriptable(scriptablename, var_ceab0569f6f2612b.origin, var_ceab0569f6f2612b.angles);
        switch (rarity) {
        case #"hash_883ff07272b4f9c":
            var_2dda78d4f81fa52f setscriptablepartstate("wallbuy", "green");
            break;
        case #"hash_778bb52ecd08072d":
            var_2dda78d4f81fa52f setscriptablepartstate("wallbuy", "blue");
            break;
        case #"hash_598a30e44f53045f":
            var_2dda78d4f81fa52f setscriptablepartstate("wallbuy", "purple");
            break;
        case #"hash_35bb3bd014c77f4b":
            var_2dda78d4f81fa52f setscriptablepartstate("wallbuy", "orange");
            break;
        default:
            var_2dda78d4f81fa52f setscriptablepartstate("wallbuy", "base");
            break;
        }
        var_2dda78d4f81fa52f = namespace_5775ad2badedbcaa::function_32645103f7520635(var_2dda78d4f81fa52f, &function_6a2e5e2579f83b94);
        var_2dda78d4f81fa52f namespace_5775ad2badedbcaa::function_9a0883b5a0999dac();
        var_2dda78d4f81fa52f namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_46baa6f0b88523d2);
        var_2dda78d4f81fa52f.cost = var_47f8c4345e50b425;
        var_2dda78d4f81fa52f.weapon = wallbuy_weapon;
        var_2dda78d4f81fa52f.weapon_name = weapon_name;
        var_2dda78d4f81fa52f.rarity = rarity;
        var_2dda78d4f81fa52f.var_91839babd32261f4 = scriptablename;
        var_2dda78d4f81fa52f.var_74ddc601a0fcaaa2 = var_6db60abdb1e9e33f;
        var_2dda78d4f81fa52f.var_88260bb1ed608124 = var_88260bb1ed608124;
        var_ceab0569f6f2612b.var_2dda78d4f81fa52f = var_2dda78d4f81fa52f;
        return var_ceab0569f6f2612b;
    }
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b5
// Size: 0x3f9
function function_46baa6f0b88523d2(usable, player) {
    if (istrue(player.var_214d8a7c520784a9)) {
        return {string:"", type:"HINT_NOBUTTON"};
    }
    if (istrue(player.interactions_disabled)) {
        return {string:"", type:"HINT_NOBUTTON"};
    }
    if (isweapon(player.var_36940c335e7cc50c) && player getcurrentweapon() == player.var_36940c335e7cc50c) {
        return {string:"SHARED_HINTSTRINGS/WALLBUY_HINT_TERTIARY_DISABLED", type:"HINT_NOBUTTON"};
    }
    var_f0e83ac26bc083a4 = usable.weapon;
    var_f0e83ac26bc083a4 = makeweapon(var_f0e83ac26bc083a4);
    var_f0e83ac26bc083a4 = var_f0e83ac26bc083a4.displayname;
    var_5fff11338b8b1585 = usable.cost;
    var_4b12ab7ac323679b = usable.rarity;
    var_90db1e8c5882545f = player currency::function_15975e20bbd2c824("essence");
    if (var_90db1e8c5882545f < var_5fff11338b8b1585) {
        switch (var_4b12ab7ac323679b) {
        case #"hash_1393412d7401c646":
            return {params:[0:var_5fff11338b8b1585, 1:var_f0e83ac26bc083a4], string:"SHARED_HINTSTRINGS/WALLBUY_HINT_WHITE_ESSENCE_NOT_ENOUGH", type:"HINT_BUTTON"};
            break;
        case #"hash_883ff07272b4f9c":
            return {params:[0:var_5fff11338b8b1585, 1:var_f0e83ac26bc083a4], string:"SHARED_HINTSTRINGS/WALLBUY_HINT_GREEN_ESSENCE_NOT_ENOUGH", type:"HINT_BUTTON"};
            break;
        case #"hash_778bb52ecd08072d":
            return {params:[0:var_5fff11338b8b1585, 1:var_f0e83ac26bc083a4], string:"SHARED_HINTSTRINGS/WALLBUY_HINT_BLUE_ESSENCE_NOT_ENOUGH", type:"HINT_BUTTON"};
            break;
        case #"hash_598a30e44f53045f":
            return {params:[0:var_5fff11338b8b1585, 1:var_f0e83ac26bc083a4], string:"SHARED_HINTSTRINGS/WALLBUY_HINT_PURPLE_ESSENCE_NOT_ENOUGH", type:"HINT_BUTTON"};
            break;
        case #"hash_35bb3bd014c77f4b":
            return {params:[0:var_5fff11338b8b1585, 1:var_f0e83ac26bc083a4], string:"SHARED_HINTSTRINGS/WALLBUY_HINT_ORANGE_ESSENCE_NOT_ENOUGH", type:"HINT_BUTTON"};
            break;
        }
    } else {
        switch (var_4b12ab7ac323679b) {
        case #"hash_1393412d7401c646":
            return {params:[0:var_5fff11338b8b1585, 1:var_f0e83ac26bc083a4], string:"SHARED_HINTSTRINGS/WALLBUY_HINT_WHITE_ESSENCE", type:"HINT_BUTTON"};
            break;
        case #"hash_883ff07272b4f9c":
            return {params:[0:var_5fff11338b8b1585, 1:var_f0e83ac26bc083a4], string:"SHARED_HINTSTRINGS/WALLBUY_HINT_GREEN_ESSENCE", type:"HINT_BUTTON"};
            break;
        case #"hash_778bb52ecd08072d":
            return {params:[0:var_5fff11338b8b1585, 1:var_f0e83ac26bc083a4], string:"SHARED_HINTSTRINGS/WALLBUY_HINT_BLUE_ESSENCE", type:"HINT_BUTTON"};
            break;
        case #"hash_598a30e44f53045f":
            return {params:[0:var_5fff11338b8b1585, 1:var_f0e83ac26bc083a4], string:"SHARED_HINTSTRINGS/WALLBUY_HINT_PURPLE_ESSENCE", type:"HINT_BUTTON"};
            break;
        case #"hash_35bb3bd014c77f4b":
            return {params:[0:var_5fff11338b8b1585, 1:var_f0e83ac26bc083a4], string:"SHARED_HINTSTRINGS/WALLBUY_HINT_ORANGE_ESSENCE", type:"HINT_BUTTON"};
            break;
        }
    }
    return {params:[0:var_5fff11338b8b1585, 1:var_f0e83ac26bc083a4], string:"SHARED_HINTSTRINGS/WALLBUY_HINT_WHITE_ESSENCE", type:"HINT_BUTTON"};
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b6
// Size: 0x3e
function function_832a1fa43c4f3c7a() {
    if (isdefined(self.script_string) && self.script_string != "") {
        return self.script_string;
    }
    rarity = "white";
    return rarity;
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fc
// Size: 0x51
function function_3683d3c5ee60fb1e(weapon_name) {
    if (isdefined(weapon_name) && isdefined(level.var_9280820d730cbb33[weapon_name]) && isdefined(level.var_9280820d730cbb33[weapon_name].var_74ddc601a0fcaaa2)) {
        return level.var_9280820d730cbb33[weapon_name].var_74ddc601a0fcaaa2;
    }
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1554
// Size: 0x51
function function_ad4352ac1dfd7c59(weapon_name) {
    if (isdefined(weapon_name) && isdefined(level.var_9280820d730cbb33[weapon_name]) && isdefined(level.var_9280820d730cbb33[weapon_name].weapon)) {
        return level.var_9280820d730cbb33[weapon_name].weapon;
    }
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ac
// Size: 0x81
function function_5075f6a4731236e6(weapon_name) {
    /#
        if (isdefined(weapon_name) && !isdefined(level.var_9280820d730cbb33[weapon_name])) {
            println("<unknown string>" + function_3c8848a3a11b2553(weapon_name) + "<unknown string>");
        }
    #/
    if (isdefined(weapon_name) && isdefined(level.var_9280820d730cbb33[weapon_name]) && isdefined(level.var_9280820d730cbb33[weapon_name].var_3f8c2b14fee7c570)) {
        return level.var_9280820d730cbb33[weapon_name].var_3f8c2b14fee7c570;
    }
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1634
// Size: 0x262
function function_86989ab07942c980(var_88260bb1ed608124, rarity) {
    cost = level.var_47f8c4345e50b425;
    if (isdefined(level.var_9280820d730cbb33) && isdefined(level.var_9280820d730cbb33[var_88260bb1ed608124])) {
        if (isdefined(level.var_9280820d730cbb33[var_88260bb1ed608124].var_814d114cd3786973)) {
            cost = level.var_9280820d730cbb33[var_88260bb1ed608124].var_814d114cd3786973;
        }
        switch (rarity) {
        case #"hash_883ff07272b4f9c":
            if (isdefined(level.var_9280820d730cbb33[var_88260bb1ed608124].var_32c129d7629dfd37)) {
                cost = level.var_9280820d730cbb33[var_88260bb1ed608124].var_32c129d7629dfd37;
            } else {
                cost = cost + 500;
            }
            break;
        case #"hash_778bb52ecd08072d":
            if (isdefined(level.var_9280820d730cbb33[var_88260bb1ed608124].var_2ad1686ad07dbc22)) {
                cost = level.var_9280820d730cbb33[var_88260bb1ed608124].var_2ad1686ad07dbc22;
            } else {
                cost = cost + 1500;
            }
            break;
        case #"hash_598a30e44f53045f":
            if (isdefined(level.var_9280820d730cbb33[var_88260bb1ed608124].var_bc634e28ac5febd8)) {
                cost = level.var_9280820d730cbb33[var_88260bb1ed608124].var_bc634e28ac5febd8;
            } else {
                cost = cost + 2500;
            }
            break;
        case #"hash_35bb3bd014c77f4b":
            if (isdefined(level.var_9280820d730cbb33[var_88260bb1ed608124].var_422e0abbedb57cc8)) {
                cost = level.var_9280820d730cbb33[var_88260bb1ed608124].var_422e0abbedb57cc8;
            } else {
                cost = cost + 3500;
            }
            break;
        default:
            if (isdefined(level.var_9280820d730cbb33[var_88260bb1ed608124].var_814d114cd3786973)) {
                cost = level.var_9280820d730cbb33[var_88260bb1ed608124].var_814d114cd3786973;
            } else {
                cost = 1000;
            }
            break;
        }
    } else {
        switch (rarity) {
        case #"hash_883ff07272b4f9c":
            cost = cost + 500;
            break;
        case #"hash_778bb52ecd08072d":
            cost = cost + 1500;
            break;
        case #"hash_598a30e44f53045f":
            cost = cost + 2500;
            break;
        case #"hash_35bb3bd014c77f4b":
            cost = cost + 3500;
            break;
        default:
            cost = 1000;
            break;
        }
    }
    return cost;
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x189e
// Size: 0x44b
function function_6a2e5e2579f83b94(player) {
    if (!isplayer(player) || !isdefined(self.cost) || !isdefined(self.weapon_name)) {
        /#
            assert("either non player tried to use wallbuy, or a required field on wallbuy is not defined");
        #/
        return;
    }
    if (istrue(player.var_214d8a7c520784a9)) {
        return;
    }
    if (istrue(player.interactions_disabled)) {
        return;
    }
    if (isweapon(player.var_36940c335e7cc50c) && player getcurrentweapon() == player.var_36940c335e7cc50c) {
        return;
    }
    if (player function_301addb53c1df990(level.var_c8e039bf171c3584, self.cost, undefined, undefined, #"wallbuy", self.weapon_name)) {
        if (!isdefined(self.gunmodel)) {
            gunmodel = function_c26e1057f3dfbc52(self.weapon_name, self.origin, (self.angles[0], self.angles[1] - 180, self.angles[2]));
            self.gunmodel = gunmodel;
            var_a49f3378e7b03e7b = (0, -5, 0);
            var_ce61d73cfdee619d = gunmodel localtoworldcoords(var_a49f3378e7b03e7b);
            gunmodel notsolid();
            var_5ce5bf640ea164d = (0, 0.5, 0);
            var_d993a04208646bdc = 1;
            var_7715b1e71c503182 = gunmodel localtoworldcoords(var_5ce5bf640ea164d);
            gunmodel.origin = var_ce61d73cfdee619d;
            gunmodel moveto(var_7715b1e71c503182, var_d993a04208646bdc);
        }
        if (isdefined(self.var_74ddc601a0fcaaa2)) {
            var_84255b4b28279219 = self.var_74ddc601a0fcaaa2;
            if (isdefined(self.rarity) && self.rarity != "white") {
                var_84255b4b28279219 = var_84255b4b28279219 + "_" + self.rarity;
            }
            var_c1c3ecdd33dec5b7 = getscriptbundle("itemspawnentry:" + var_84255b4b28279219);
            var_bf2d5e2704ee3910 = var_c1c3ecdd33dec5b7.scriptable;
            var_636981592f381ebf = spawnstruct();
            var_636981592f381ebf.weaponobj = namespace_b4f2af6fa775d9b::function_777497d9d98fa0b8(var_c1c3ecdd33dec5b7);
            clipammo = 0;
            stockammo = 0;
            if (isdefined(var_636981592f381ebf.weaponobj)) {
                clipammo = weaponclipsize(var_636981592f381ebf.weaponobj);
                stockammo = weaponmaxammo(var_636981592f381ebf.weaponobj);
            } else {
                clipammo = weaponclipsize(self.weapon);
                stockammo = weaponmaxammo(self.weapon);
            }
            var_636981592f381ebf.count = function_7209c8cd4b2e3afd(clipammo);
            var_636981592f381ebf.var_5a57e79ae8d5ae67 = stockammo;
            var_72672cd81ec1093d = player function_7f6f62ba8dfd0da0(var_c1c3ecdd33dec5b7, var_636981592f381ebf);
            if (isarray(var_72672cd81ec1093d) && isdefined(var_72672cd81ec1093d[1]) && isweapon(var_72672cd81ec1093d[1])) {
                var_72672cd81ec1093d = var_72672cd81ec1093d[1];
            }
        } else {
            if (getdvarint(@"hash_b56cc9f1a82d6fd1")) {
                num_attachments = function_7fa5860a8e414317(self.rarity);
                var_72672cd81ec1093d = namespace_3bbb5a98b932c46f::function_71dc088dc384ef8d(self.weapon_name, num_attachments, 1);
            } else {
                var_72672cd81ec1093d = namespace_e0ee43ef2dddadaa::buildweapon(self.weapon_name);
            }
            player.droppeddeathweapon = undefined;
            player namespace_3bbb5a98b932c46f::dropweaponfordeath(undefined, "");
            player.droppeddeathweapon = undefined;
            player giveweapon(var_72672cd81ec1093d);
            player setweaponammoclip(var_72672cd81ec1093d, weaponclipsize(var_72672cd81ec1093d));
            player setweaponammostock(var_72672cd81ec1093d, weaponmaxammo(var_72672cd81ec1093d));
            player switchtoweaponimmediate(var_72672cd81ec1093d);
        }
        playsoundatpos(self.origin, "evt_zm_core_wallbuy_purchase");
        params = spawnstruct();
        params.objweapon = var_72672cd81ec1093d;
        params.cost = self.cost;
        params.rarity = self.rarity;
        params.lootid = function_2c836ad05e5f634c(var_c1c3ecdd33dec5b7.ref);
        player callback::callback("wallbuy_purchase", params);
    }
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cf0
// Size: 0x81
function function_7fa5860a8e414317(rarity) {
    num_attachments = 0;
    switch (rarity) {
    case #"hash_1393412d7401c646":
        num_attachments = 1;
        break;
    case #"hash_883ff07272b4f9c":
        num_attachments = 2;
        break;
    case #"hash_778bb52ecd08072d":
        num_attachments = 3;
        break;
    case #"hash_598a30e44f53045f":
        num_attachments = 4;
        break;
    case #"hash_35bb3bd014c77f4b":
        num_attachments = 5;
        break;
    }
    return num_attachments;
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d79
// Size: 0x186
function function_b5a3a7840d51404a() {
    /#
        foreach (instance in level.var_a1c29f4029327195.var_e6c053e28858ae8b["<unknown string>"]) {
            foreach (wallbuy_spawn in instance.var_305e36cbb51f88ce["<unknown string>"]) {
                if (isdefined(wallbuy_spawn.var_2dda78d4f81fa52f)) {
                    var_44cdb891d87e41ef = "<unknown string>";
                    if (isdefined(wallbuy_spawn.var_2dda78d4f81fa52f.rarity)) {
                        switch (wallbuy_spawn.var_2dda78d4f81fa52f.rarity) {
                        case #"hash_1393412d7401c646":
                            var_44cdb891d87e41ef = "<unknown string>";
                            break;
                        case #"hash_883ff07272b4f9c":
                            var_44cdb891d87e41ef = "<unknown string>";
                            break;
                        case #"hash_778bb52ecd08072d":
                            var_44cdb891d87e41ef = "<unknown string>";
                            break;
                        case #"hash_598a30e44f53045f":
                            var_44cdb891d87e41ef = "<unknown string>";
                            break;
                        case #"hash_35bb3bd014c77f4b":
                            var_44cdb891d87e41ef = "<unknown string>";
                            break;
                        }
                    }
                    wallbuy_spawn function_e898734a6a951c57(wallbuy_spawn, var_44cdb891d87e41ef);
                    waitframe();
                }
            }
        }
    #/
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f06
// Size: 0x2b5
function function_e898734a6a951c57(var_ceab0569f6f2612b, rarity) {
    /#
        /#
            assert(isdefined(var_ceab0569f6f2612b.var_2dda78d4f81fa52f));
        #/
    #/
    playfx(getfx("vfx_wallbuy_reveal_xlg"), var_ceab0569f6f2612b.origin);
    switch (rarity) {
    case #"hash_883ff07272b4f9c":
        cost = function_86989ab07942c980(var_ceab0569f6f2612b.var_2dda78d4f81fa52f.var_88260bb1ed608124, "green");
        var_ceab0569f6f2612b.var_2dda78d4f81fa52f.cost = cost;
        var_ceab0569f6f2612b.var_2dda78d4f81fa52f.rarity = "green";
        var_ceab0569f6f2612b.var_2dda78d4f81fa52f setscriptablepartstate("wallbuy", "green");
        break;
    case #"hash_778bb52ecd08072d":
        cost = function_86989ab07942c980(var_ceab0569f6f2612b.var_2dda78d4f81fa52f.var_88260bb1ed608124, "blue");
        var_ceab0569f6f2612b.var_2dda78d4f81fa52f.cost = cost;
        var_ceab0569f6f2612b.var_2dda78d4f81fa52f.rarity = "blue";
        var_ceab0569f6f2612b.var_2dda78d4f81fa52f setscriptablepartstate("wallbuy", "blue");
        break;
    case #"hash_598a30e44f53045f":
        cost = function_86989ab07942c980(var_ceab0569f6f2612b.var_2dda78d4f81fa52f.var_88260bb1ed608124, "purple");
        var_ceab0569f6f2612b.var_2dda78d4f81fa52f.cost = cost;
        var_ceab0569f6f2612b.var_2dda78d4f81fa52f.rarity = "purple";
        var_ceab0569f6f2612b.var_2dda78d4f81fa52f setscriptablepartstate("wallbuy", "purple");
        break;
    case #"hash_35bb3bd014c77f4b":
        cost = function_86989ab07942c980(var_ceab0569f6f2612b.var_2dda78d4f81fa52f.var_88260bb1ed608124, "orange");
        var_ceab0569f6f2612b.var_2dda78d4f81fa52f.cost = cost;
        var_ceab0569f6f2612b.var_2dda78d4f81fa52f.rarity = "orange";
        var_ceab0569f6f2612b.var_2dda78d4f81fa52f setscriptablepartstate("wallbuy", "orange");
        break;
    default:
        cost = function_86989ab07942c980(var_ceab0569f6f2612b.var_2dda78d4f81fa52f.var_88260bb1ed608124, "white");
        var_ceab0569f6f2612b.var_2dda78d4f81fa52f.cost = cost;
        var_ceab0569f6f2612b.var_2dda78d4f81fa52f setscriptablepartstate("wallbuy", "base");
        break;
    }
}

// Namespace wallbuy/namespace_a7b2869544232202
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c2
// Size: 0x76a
function on_round_end(params) {
    if (!isdefined(level.var_a1c29f4029327195.var_e6c053e28858ae8b["wallbuy"])) {
        return;
    }
    if (level.round_number % 5 == 0) {
        round_number = level.round_number;
        foreach (instance in level.var_a1c29f4029327195.var_e6c053e28858ae8b["wallbuy"]) {
            if (isdefined(instance.var_305e36cbb51f88ce) && instance.var_305e36cbb51f88ce.size > 0) {
                foreach (wallbuy_spawn in instance.var_305e36cbb51f88ce["wallbuy_spawn"]) {
                    if (isdefined(wallbuy_spawn.var_2dda78d4f81fa52f) && isdefined(wallbuy_spawn.var_2dda78d4f81fa52f.rarity) && wallbuy_spawn.var_2dda78d4f81fa52f.rarity != "orange") {
                        n_chance = 0;
                        switch (round_number) {
                        case 5:
                            if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "blue") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_bb25eb01f6acca96, 8);
                            } else if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "purple") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_b87a6e25da817d60, 6);
                            } else {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_2d12668ccc083233, 23);
                            }
                            break;
                        case 10:
                            if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "blue") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_413ff3517e14bd56, 10);
                            } else if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "purple") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_36cf253f8ad9ef94, 7);
                            } else {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_27bb22a4b619553d, 45);
                            }
                            break;
                        case 15:
                            if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "blue") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_413ff8517e14c855, 19);
                            } else if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "purple") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_36cf223f8ad9e8fb, 9);
                            } else {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_27bb1da4b6194a3e, 74);
                            }
                            break;
                        case 20:
                            if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "blue") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_413b8d517e0fe72d, 44);
                            } else if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "purple") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_36dc973f8ae8fecf, 9);
                            } else {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_27bf88a4b61e2b66, 84);
                            }
                            break;
                        case 25:
                            if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "blue") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_413b88517e0fdc2e, 73);
                            } else if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "purple") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_36dc923f8ae8f3d0, 18);
                            } else {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_27bf8da4b61e3665, 95);
                            }
                            break;
                        case 30:
                            if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "blue") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_413707517e0acaa4, 90);
                            } else if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "purple") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_36d8113f8ae3e246, 43);
                            } else {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_27c40ea4b62347ef, 100);
                            }
                            break;
                        case 35:
                            if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "blue") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_413704517e0ac40b, 100);
                            } else if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "purple") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_36d8163f8ae3ed45, 63);
                            } else {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_27c409a4b6233cf0, 100);
                            }
                            break;
                        case 40:
                        default:
                            if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "blue") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_413301517e06c79b, 100);
                            } else if (wallbuy_spawn.var_2dda78d4f81fa52f.rarity == "purple") {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_36c2133f8acbb379, 90);
                            } else {
                                n_chance = function_53c4c53197386572(level.var_ac94bcc5062b5017.var_27a584a4b601f990, 100);
                            }
                            break;
                        }
                        if (function_51d76700600cebe3(n_chance)) {
                            switch (wallbuy_spawn.var_2dda78d4f81fa52f.rarity) {
                            case #"hash_1393412d7401c646":
                                var_57a00eab7e9d8871 = "green";
                                break;
                            case #"hash_883ff07272b4f9c":
                                var_57a00eab7e9d8871 = "blue";
                                break;
                            case #"hash_778bb52ecd08072d":
                                var_57a00eab7e9d8871 = "purple";
                                break;
                            case #"hash_598a30e44f53045f":
                            default:
                                var_57a00eab7e9d8871 = "orange";
                                break;
                            }
                            function_e898734a6a951c57(wallbuy_spawn, var_57a00eab7e9d8871);
                            waitframe();
                        }
                    }
                }
            }
        }
    }
}

