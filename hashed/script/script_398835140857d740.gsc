// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_639bf783929acf9b;
#using script_7e4d332e911e1b90;
#using script_38eb8f4be20d54f4;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\player.gsc;

#namespace zombie_perks;

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x558
// Size: 0xe5
function function_fafc515c560fe4a5() {
    level._custom_perks = [];
    level.var_fb9e36084218c7cd = [];
    level.var_d27638e3b575cad1 = [];
    var_3c9791817c16170c = 1;
    foreach (ref, bundle in level.var_a1ad2758fcbd2f5e) {
        if (istrue(bundle.var_782f53f2d95f0194)) {
            level.var_d27638e3b575cad1[ref] = var_3c9791817c16170c;
            var_3c9791817c16170c++;
        }
    }
    level.var_e2cfbd4132b67bb9 = 1;
    namespace_3c37cb17ade254d::registersharedfunc("zombie_perks", "has_zombie_perk", &has_perk);
    callback::add("player_connect", &function_e96c0612e2d3b323);
    callback::add("player_spawned", &function_6935a6121f60fefb);
    level function_37c9042a45291641();
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x644
// Size: 0x25d
function register_perk_basic_info(str_perk, str_alias, n_perk_cost, str_hint_string, var_378b8fa4cbad01e3, w_perk_bottle_weapon, var_e89a9a6a3475bd0a, var_e3d5b979024de96, var_6e91b48935b6d44f, var_de61bccad0dcc303, var_f209168e865e2517) {
    /#
        assert(isdefined(str_perk), "str_perk is a required argument for register_perk_basic_info!");
    #/
    /#
        assert(isdefined(str_alias), "str_alias is a required argument for register_perk_basic_info!");
    #/
    /#
        assert(isdefined(n_perk_cost), "n_perk_cost is a required argument for register_perk_basic_info!");
    #/
    /#
        assert(isdefined(str_hint_string), "str_hint_string is a required argument for register_perk_basic_info!");
    #/
    /#
        assert(isdefined(var_378b8fa4cbad01e3), "str_hint_string_not_enough is a required argument for register_perk_basic_info!");
    #/
    /#
        assert(isdefined(w_perk_bottle_weapon), "w_perk_bottle_weapon is a required argument for register_perk_basic_info!");
    #/
    /#
        assert(isdefined(var_e89a9a6a3475bd0a), "str_scriptable is a required argument for register_perk_basic_info!");
    #/
    /#
        assert(isdefined(var_e3d5b979024de96), "str_perk_root is a required argument for register_perk_basic_info!");
    #/
    _register_undefined_perk(str_perk);
    level.var_a2e80fb79bc0de74 = function_53c4c53197386572(level.var_a2e80fb79bc0de74, []);
    level._custom_perks[str_perk].alias = str_alias;
    level._custom_perks[str_perk].cost = n_perk_cost;
    level._custom_perks[str_perk].hint_string = str_hint_string;
    level._custom_perks[str_perk].var_2e1ef6ec4d3bd5bb = var_378b8fa4cbad01e3;
    level._custom_perks[str_perk].perk_bottle_weapon = w_perk_bottle_weapon;
    level._custom_perks[str_perk].var_e89a9a6a3475bd0a = var_e89a9a6a3475bd0a;
    level._custom_perks[str_perk].var_e3d5b979024de96 = var_e3d5b979024de96;
    level._custom_perks[str_perk].var_6e91b48935b6d44f = var_6e91b48935b6d44f;
    level._custom_perks[str_perk].var_de61bccad0dcc303 = var_de61bccad0dcc303;
    level._custom_perks[str_perk].var_f209168e865e2517 = var_f209168e865e2517;
    level.var_a2e80fb79bc0de74 = array_add(level.var_a2e80fb79bc0de74, str_perk);
    level.var_88699039491fddc2 = function_53c4c53197386572(level.var_88699039491fddc2, []);
    level.var_88699039491fddc2 = function_6d6af8144a5131f1(level.var_88699039491fddc2, str_perk);
    level.var_c24be1403a243389 = function_53c4c53197386572(level.var_c24be1403a243389, []);
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a8
// Size: 0x72
function register_perk_threads(str_perk, func_give_player_perk, func_take_player_perk) {
    /#
        assert(isdefined(str_perk), "str_perk is a required argument for register_perk_threads!");
    #/
    /#
        assert(isdefined(func_give_player_perk), "func_give_player_perk is a required argument for register_perk_threads!");
    #/
    _register_undefined_perk(str_perk);
    level._custom_perks[str_perk].player_thread_give = func_give_player_perk;
    level._custom_perks[str_perk].player_thread_take = func_take_player_perk;
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x921
// Size: 0x169
function function_f3a23df892bf82f6(var_18a7e443a83e6708, var_1df6de077e30f8c2, var_fe59c44529c721a0, func_give_player_perk, func_take_player_perk, var_de61bccad0dcc303, var_f209168e865e2517) {
    flag_wait("StartGameTypeCallbackFinished");
    /#
        assert(isarray(level.var_a1ad2758fcbd2f5e, "Perk Bundles should be initialized before enabling perks."));
    #/
    var_1036048ad7fae159 = level.var_a1ad2758fcbd2f5e[var_18a7e443a83e6708];
    var_3890e1bc334f0bee = var_18a7e443a83e6708;
    if (var_1df6de077e30f8c2 == "essence") {
        str_hint = var_1036048ad7fae159.var_dece435b3b667200;
        var_811b03f65b47c4eb = var_1036048ad7fae159.var_1cf2a8f5b7889a0d;
    } else {
        str_hint = var_1036048ad7fae159.var_c3d159a56e59c87f;
        var_811b03f65b47c4eb = var_1036048ad7fae159.var_c3d159a56e59c87f;
    }
    var_84e0adf6b525665c = function_53c4c53197386572(var_1036048ad7fae159.var_c70f3f3a7f26b274, undefined);
    var_dbd9316d7df681b = function_53c4c53197386572(var_fe59c44529c721a0, var_1036048ad7fae159.var_94619674d83d9e85);
    var_f767f108d547a3b0 = function_53c4c53197386572(var_de61bccad0dcc303, 1);
    register_perk_basic_info(var_3890e1bc334f0bee, var_1036048ad7fae159.var_8e766728aefc1bff, var_dbd9316d7df681b, str_hint, var_811b03f65b47c4eb, var_1036048ad7fae159.var_26793ea89948adb, var_1036048ad7fae159.var_50ff10282e5fb08f, var_3890e1bc334f0bee, var_84e0adf6b525665c, var_f767f108d547a3b0, var_f209168e865e2517);
    register_perk_threads(var_3890e1bc334f0bee, func_give_player_perk, func_take_player_perk);
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa91
// Size: 0x45
function _register_undefined_perk(str_perk) {
    level._custom_perks = function_53c4c53197386572(level._custom_perks, []);
    if (!isdefined(level._custom_perks[str_perk])) {
        level._custom_perks[str_perk] = spawnstruct();
    }
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xadd
// Size: 0x42
function function_e96c0612e2d3b323(params) {
    self.var_acdb20d37fc0213f = [];
    self.perks_active = [];
    self.var_615c836de78b97b0 = 0;
    j = 0;
    /#
        level thread function_e4d3cdf382f6b0b3();
    #/
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb26
// Size: 0x14b
function function_6935a6121f60fefb(params) {
    /#
        if (level._custom_perks.size) {
            self endon("cer_zm_vm_ges_001");
            var_3352bf952cfc182a = self.name;
            keys = getarraykeys(level._custom_perks);
            foreach (key in keys) {
                function_6e7290c8ee4f558b("ui_bleedout_progress" + var_3352bf952cfc182a + "<unknown string>");
                function_b23a59dfb4ca49a1("<unknown string>" + key, "<unknown string>" + key + "<unknown string>" + var_3352bf952cfc182a, &function_d6df8a69866fa55d);
                function_b23a59dfb4ca49a1("<unknown string>" + key, "<unknown string>" + key + "<unknown string>" + var_3352bf952cfc182a, &function_edb352d1101bc34f);
                function_fe953f000498048f();
            }
            function_6e7290c8ee4f558b("ui_bleedout_progress" + var_3352bf952cfc182a + "<unknown string>");
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_4395673d0d4ae3c6);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_33e402afcb6d2c04);
            function_fe953f000498048f();
        }
    #/
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc78
// Size: 0x174
function give_perk(perk, bought) {
    self.num_perks = function_53c4c53197386572(self.num_perks, 0);
    self.num_perks++;
    self.var_6c26dc18308753c2[perk] = 1;
    if (istrue(bought)) {
        thread give_perk_presentation(perk);
        self notify("perk_bought", perk);
    }
    var_f209168e865e2517 = isdefined(level._custom_perks[perk]) && istrue(level._custom_perks[perk].var_f209168e865e2517);
    self setperk(perk, var_f209168e865e2517);
    if (isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].player_thread_give)) {
        self thread [[ level._custom_perks[perk].player_thread_give ]]();
    }
    if (!isdefined(self.perks_active)) {
        self.perks_active = [];
    }
    self.perks_active = array_add(self.perks_active, perk);
    function_1f957407227bb410();
    self notify("perk_acquired");
    params = spawnstruct();
    params.var_b256730ecb362423 = perk;
    callback::callback("zm_perk_obtained", params);
    if (istrue(level.var_e2cfbd4132b67bb9) && self.num_perks <= 3) {
        thread function_886e9c6f3a5ab9bb(perk);
    } else {
        thread perk_think(perk);
    }
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf3
// Size: 0x11b
function perk_think(perk) {
    self endon("disconnect");
    perk_str = perk + "_stop";
    result = waittill_any_return_4("fake_death", "death", perk_str);
    var_f209168e865e2517 = isdefined(level._custom_perks[perk]) && istrue(level._custom_perks[perk].var_f209168e865e2517);
    self unsetperk(perk, var_f209168e865e2517);
    self.num_perks--;
    self.var_6c26dc18308753c2[perk] = undefined;
    self.perks_active = array_remove(self.perks_active, perk);
    function_1f957407227bb410();
    if (isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].player_thread_take)) {
        self thread [[ level._custom_perks[perk].player_thread_take ]](0, perk_str, result, -1);
    }
    if (isdefined(level.var_a51d9b07af5d7d77)) {
        self [[ level.var_a51d9b07af5d7d77 ]](perk);
    }
    self notify("extra_perk_lost");
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf15
// Size: 0x41
function give_perk_presentation(perk) {
    self endon("player_downed");
    self endon("disconnect");
    self endon("end_game");
    self endon("perk_abort_drinking");
    thread function_aca2962451f93f78(perk);
    if (istrue(level.var_a1e71a5993ec79c8)) {
        goto LOC_0000003f;
    }
LOC_0000003f:
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5d
// Size: 0x13
function function_aca2962451f93f78(perk) {
    self endon("death");
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf77
// Size: 0x111
function function_886e9c6f3a5ab9bb(perk) {
    self endon("disconnect");
    perk_str = perk + "_stop";
    waittill_any_return_4("fake_death", "death", perk_str);
    waitframe();
    var_f209168e865e2517 = isdefined(level._custom_perks[perk]) && istrue(level._custom_perks[perk].var_f209168e865e2517);
    self unsetperk(perk, var_f209168e865e2517);
    self.num_perks--;
    self.var_6c26dc18308753c2[perk] = undefined;
    self.perks_active = array_remove(self.perks_active, perk);
    function_1f957407227bb410();
    if (isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].player_thread_take)) {
        self thread [[ level._custom_perks[perk].player_thread_take ]](0, perk_str, -1);
    }
    if (isdefined(level.var_a51d9b07af5d7d77)) {
        self [[ level.var_a51d9b07af5d7d77 ]](perk);
    }
    self notify("extra_perk_lost");
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108f
// Size: 0x32
function has_perk(perkname) {
    perks = self.var_6c26dc18308753c2;
    if (!isdefined(perks)) {
        return 0;
    }
    if (isdefined(perks[perkname])) {
        return 1;
    }
    return 0;
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c9
// Size: 0xaa
function function_cdb669c56d86f5c4(var_2398867c16e7d267) {
    var_b83a817904c64a0b = function_47a5564594564627();
    var_c3eb7dafd2328539 = function_ad6e85c9533ac466();
    if (isarray(var_c3eb7dafd2328539)) {
        var_b83a817904c64a0b = array_remove_array(var_b83a817904c64a0b, var_c3eb7dafd2328539);
    }
    if (isarray(var_2398867c16e7d267)) {
        var_b83a817904c64a0b = array_remove_array(var_b83a817904c64a0b, var_2398867c16e7d267);
    }
    random_perk = function_b01d83652396cbb0(var_b83a817904c64a0b);
    if (isdefined(random_perk)) {
        gesture = function_53c4c53197386572(level._custom_perks[random_perk].perk_bottle_weapon, "cer_zm_vm_ges_001");
        thread function_fe9f92094d839eaf(gesture);
        give_perk(random_perk);
        return random_perk;
    }
    return undefined;
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117b
// Size: 0x49
function function_fe9f92094d839eaf(gesture) {
    self endon("death");
    if (istrue(namespace_e0ee43ef2dddadaa::iskillstreakweapon(self getcurrentweapon()))) {
        self enableoffhandweapons();
        waitframe();
        thread function_b5216a6d7bd17210(gesture, 1);
        waitframe();
        self disableoffhandweapons();
        return;
    }
    function_b5216a6d7bd17210(gesture, 1);
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11cb
// Size: 0x7b
function function_47a5564594564627() {
    var_29eaf15edd1cfdd4 = [];
    foreach (key, perk in level._custom_perks) {
        if (key != "specialty_choice") {
            var_29eaf15edd1cfdd4 = array_add(var_29eaf15edd1cfdd4, perk.var_e3d5b979024de96);
        }
    }
    return var_29eaf15edd1cfdd4;
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124e
// Size: 0x3c
function function_b01d83652396cbb0(var_29eaf15edd1cfdd4) {
    /#
        assert(isarray(var_29eaf15edd1cfdd4), "perks_str_array is not valid");
    #/
    if (var_29eaf15edd1cfdd4.size == 0) {
        return undefined;
    }
    perk = random(var_29eaf15edd1cfdd4);
    return perk;
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1292
// Size: 0x71
function function_ad6e85c9533ac466() {
    var_29eaf15edd1cfdd4 = [];
    foreach (perk in self.perks_active) {
        if (perk != "specialty_choice") {
            var_29eaf15edd1cfdd4 = array_add(var_29eaf15edd1cfdd4, perk);
        }
    }
    return var_29eaf15edd1cfdd4;
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130b
// Size: 0x8f
function function_ab7a3ff9f75e4867(var_5ef4401adf60da76) {
    bundle = level.var_a1ad2758fcbd2f5e[var_5ef4401adf60da76];
    var_ee3332dc909b7d6b = bundle.var_73aea5f005919dfb;
    foreach (perk in var_ee3332dc909b7d6b) {
        namespace_82dcd1d5ae30ff7::giveperk(perk.var_43596460393338e5);
    }
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a1
// Size: 0x8f
function function_fe0d28e6f0008329(var_5ef4401adf60da76) {
    bundle = level.var_a1ad2758fcbd2f5e[var_5ef4401adf60da76];
    var_ee3332dc909b7d6b = bundle.var_73aea5f005919dfb;
    foreach (perk in var_ee3332dc909b7d6b) {
        namespace_82dcd1d5ae30ff7::removeperk(perk.var_43596460393338e5);
    }
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1437
// Size: 0x51
function function_b1e24c0eaeadfac7() {
    cost = level.var_62f6f7640e4431e3.var_df5e6a3d7e67d4de;
    if (isdefined(self.perks_active)) {
        cost = cost + self.perks_active.size * level.var_62f6f7640e4431e3.var_d8a6002d5eaba519;
    }
    return cost;
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1490
// Size: 0x25
function register_lost_perk_override(func_override) {
    level.var_fb9e36084218c7cd = array_add(level.var_fb9e36084218c7cd, func_override);
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14bc
// Size: 0x71
function lost_perk_override(perk) {
    if (!namespace_7e17181d03156026::isinlaststand(self)) {
        return 0;
    }
    foreach (var_d5c77caf08eb4580 in level.var_fb9e36084218c7cd) {
        if (self [[ var_d5c77caf08eb4580 ]](perk)) {
            return 1;
        }
    }
    return 0;
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1535
// Size: 0x12d
function function_1f957407227bb410() {
    if (isdefined(self.perks_active)) {
        var_f3cda99d875b71bd = [0:0, 1:0, 2:0];
        var_ea58090612b7ef72 = [0:0, 1:0, 2:0];
        var_7946c8c2b3d24745 = 32 - 1;
        perkindex = 0;
        foreach (perk in self.perks_active) {
            var_91b1c677982419e8 = level.var_d27638e3b575cad1[perk];
            if (!isdefined(var_91b1c677982419e8)) {
                continue;
            }
            var_d861f893072a477e = int(perkindex / 6);
            var_f3cda99d875b71bd[var_d861f893072a477e] = var_f3cda99d875b71bd[var_d861f893072a477e] + ((var_91b1c677982419e8 & var_7946c8c2b3d24745) << var_ea58090612b7ef72[var_d861f893072a477e]);
            var_ea58090612b7ef72[var_d861f893072a477e] = var_ea58090612b7ef72[var_d861f893072a477e] + 5;
            perkindex++;
        }
        self setclientomnvar("ui_active_perks_1", var_f3cda99d875b71bd[0]);
        self setclientomnvar("ui_active_perks_2", var_f3cda99d875b71bd[1]);
        self setclientomnvar("ui_active_perks_3", var_f3cda99d875b71bd[2]);
    }
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1669
// Size: 0x2a
function function_c3fda966e9a355c1() {
    self setclientomnvar("ui_active_perks_1", 0);
    self setclientomnvar("ui_active_perks_2", 0);
    self setclientomnvar("ui_active_perks_3", 0);
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169a
// Size: 0xac
function function_df76bc163c4ea0a9(params) {
    if (isdefined(params.progress)) {
        self setclientomnvar("ui_bleedout_progress", params.progress);
        if (istrue(level.var_62f6f7640e4431e3.var_ec7a9ca55193be5e)) {
            if (params.progress < 0.25) {
                self.var_8259418ae21ea504 = 3;
            } else if (params.progress < 0.5) {
                self.var_8259418ae21ea504 = 2;
            } else if (params.progress < 0.75) {
                self.var_8259418ae21ea504 = 1;
            }
        }
    }
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174d
// Size: 0xb7
function function_8df3a882ad56636(params) {
    self endon("disconnect");
    if (istrue(level.var_62f6f7640e4431e3.var_ec7a9ca55193be5e)) {
        perks = function_ad6e85c9533ac466();
        if (perks.size > 0 && perks.size <= 3) {
            n_index = perks.size - 1;
            take_perk(perks[n_index]);
        }
        if (perks.size > 0 && perks.size > 3) {
            for (i = perks.size; i > 3; i--) {
                self notify(perks[i - 1] + "_stop");
            }
        }
        self.var_8259418ae21ea504 = 0;
    }
    waitframe();
    self setclientomnvar("ui_laststand_visibility", 1);
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x180b
// Size: 0xa6
function function_1617ba608cb9b50c(params) {
    self setclientomnvar("ui_laststand_visibility", 0);
    if (istrue(level.var_62f6f7640e4431e3.var_ec7a9ca55193be5e)) {
        if (isdefined(self.var_8259418ae21ea504) && self.var_8259418ae21ea504 > 0) {
            perks = function_ad6e85c9533ac466();
            num_perks = perks.size;
            var_abd05eac3931616a = 3 - self.var_8259418ae21ea504;
            for (i = num_perks; i > var_abd05eac3931616a; i--) {
                take_perk(perks[i - 1]);
            }
        }
    }
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b8
// Size: 0x20
function function_9c2682b7c1e353d3(params) {
    function_c3fda966e9a355c1();
    self setclientomnvar("ui_laststand_visibility", 0);
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18df
// Size: 0x47
function function_37c9042a45291641() {
    callback::add("player_laststand", &function_8df3a882ad56636);
    callback::add("player_revived", &function_1617ba608cb9b50c);
    callback::add("player_death", &function_9c2682b7c1e353d3);
    callback::add("bleedout_tick", &function_df76bc163c4ea0a9);
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192d
// Size: 0x22
function take_perk(str_perk) {
    str_notify = str_perk + "_stop";
    self notify(str_notify);
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1956
// Size: 0x58
function function_fd9a6fb7a67bcf3e(str_perk) {
    if (has_perk(str_perk)) {
        return 0;
    }
    gesture = function_53c4c53197386572(level._custom_perks[str_perk].perk_bottle_weapon, "cer_zm_vm_ges_001");
    thread function_fe9f92094d839eaf(gesture);
    give_perk(str_perk, 1);
    return 1;
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19b6
// Size: 0xfc
function function_e4d3cdf382f6b0b3() {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        var_cdd4ba2fddec6485 = 275;
        var_267d795ee5eeee70 = 1295;
        var_e5cfcafbce32a497 = 12;
        var_88d8f05016945d4d = 30;
        while (1) {
            if (!isdefined(level.players)) {
                waitframe();
                continue;
            }
            foreach (n_index, player in level.players) {
                if (!isdefined(player.health)) {
                    continue;
                }
                n_health = player.health;
                printtoscreen2d(var_cdd4ba2fddec6485, var_88d8f05016945d4d * n_index + var_267d795ee5eeee70 + var_e5cfcafbce32a497 * 0, n_health, (1, 0, 0), 1);
            }
            waitframe();
        }
    #/
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab9
// Size: 0x7d
function function_d6df8a69866fa55d(a_params, play_gesture) {
    /#
        play_gesture = function_53c4c53197386572(play_gesture, 1);
        str_perk = a_params[0];
        player = function_b3818ef99e063667(a_params[1]);
        if (player has_perk(str_perk)) {
            return;
        }
        if (play_gesture) {
            player thread function_fe9f92094d839eaf(level._custom_perks[str_perk].perk_bottle_weapon);
        }
        player give_perk(str_perk, 0);
    #/
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b3d
// Size: 0x48
function function_edb352d1101bc34f(a_params) {
    /#
        str_perk = a_params[0];
        str_notify = str_perk + "<unknown string>";
        player = function_b3818ef99e063667(a_params[1]);
        player notify(str_notify);
    #/
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b8c
// Size: 0x9a
function function_4395673d0d4ae3c6(a_params) {
    /#
        player = function_b3818ef99e063667(a_params[0]);
        keys = getarraykeys(level._custom_perks);
        foreach (key in keys) {
            if (player has_perk(key)) {
                continue;
            }
            player give_perk(key, 0);
            waitframe();
        }
    #/
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c2d
// Size: 0x97
function function_33e402afcb6d2c04(a_params) {
    /#
        player = function_b3818ef99e063667(a_params[0]);
        keys = getarraykeys(level._custom_perks);
        foreach (key in keys) {
            str_notify = key + "<unknown string>";
            player notify(str_notify);
        }
    #/
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ccb
// Size: 0xf
function function_dbc961776f2f056a(a_params) {
    /#
    #/
}

// Namespace zombie_perks/namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ce1
// Size: 0x90
function function_b3818ef99e063667(str_name) {
    /#
        foreach (player in level.players) {
            if (player.name == str_name) {
                return player;
            } else if (isbot(player)) {
                if (issubstr(player.name, str_name)) {
                    return player;
                }
            }
        }
    #/
}

