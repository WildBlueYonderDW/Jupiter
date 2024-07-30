#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_639bf783929acf9b;
#using script_7e4d332e911e1b90;
#using scripts\common\devgui.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\player.gsc;

#namespace zombie_perks;

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f5
// Size: 0xe2
function init_perks() {
    level._custom_perks = [];
    level.var_fb9e36084218c7cd = [];
    level.var_d27638e3b575cad1 = [];
    zmperkindex = 1;
    foreach (ref, bundle in level.perkbundles) {
        if (istrue(bundle.zombiesperk)) {
            level.var_d27638e3b575cad1[ref] = zmperkindex;
            zmperkindex++;
        }
    }
    level.var_e2cfbd4132b67bb9 = 1;
    scripts\engine\utility::registersharedfunc("zombie_perks", "has_zombie_perk", &has_perk);
    callback::add("player_connect", &function_e96c0612e2d3b323);
    callback::add("player_spawned", &function_6935a6121f60fefb);
    level function_37c9042a45291641();
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x3df
// Size: 0x25c
function register_perk_basic_info(str_perk, str_alias, n_perk_cost, str_hint_string, var_378b8fa4cbad01e3, w_perk_bottle_weapon, var_e89a9a6a3475bd0a, var_e3d5b979024de96, var_6e91b48935b6d44f, var_de61bccad0dcc303, var_f209168e865e2517) {
    assert(isdefined(str_perk), "<dev string:x1c>");
    assert(isdefined(str_alias), "<dev string:x5d>");
    assert(isdefined(n_perk_cost), "<dev string:x9f>");
    assert(isdefined(str_hint_string), "<dev string:xe3>");
    assert(isdefined(var_378b8fa4cbad01e3), "<dev string:x12b>");
    assert(isdefined(w_perk_bottle_weapon), "<dev string:x17e>");
    assert(isdefined(var_e89a9a6a3475bd0a), "<dev string:x1cb>");
    assert(isdefined(var_e3d5b979024de96), "<dev string:x212>");
    _register_undefined_perk(str_perk);
    level.var_a2e80fb79bc0de74 = default_to(level.var_a2e80fb79bc0de74, []);
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
    level.var_88699039491fddc2 = default_to(level.var_88699039491fddc2, []);
    level.var_88699039491fddc2 = function_6d6af8144a5131f1(level.var_88699039491fddc2, str_perk);
    level.var_c24be1403a243389 = default_to(level.var_c24be1403a243389, []);
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x643
// Size: 0x71
function register_perk_threads(str_perk, func_give_player_perk, func_take_player_perk) {
    assert(isdefined(str_perk), "<dev string:x258>");
    assert(isdefined(func_give_player_perk), "<dev string:x296>");
    _register_undefined_perk(str_perk);
    level._custom_perks[str_perk].player_thread_give = func_give_player_perk;
    level._custom_perks[str_perk].player_thread_take = func_take_player_perk;
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x6bc
// Size: 0x163
function function_f3a23df892bf82f6(var_18a7e443a83e6708, str_currency, var_fe59c44529c721a0, func_give_player_perk, func_take_player_perk, var_de61bccad0dcc303, var_f209168e865e2517) {
    flag_wait("StartGameTypeCallbackFinished");
    assert(isarray(level.perkbundles, "<dev string:x2e1>"));
    perkbundle = level.perkbundles[var_18a7e443a83e6708];
    root_perk = var_18a7e443a83e6708;
    if (str_currency == "essence") {
        str_hint = perkbundle.var_dece435b3b667200;
        var_811b03f65b47c4eb = perkbundle.var_1cf2a8f5b7889a0d;
    } else {
        str_hint = perkbundle.var_c3d159a56e59c87f;
        var_811b03f65b47c4eb = perkbundle.var_c3d159a56e59c87f;
    }
    var_84e0adf6b525665c = default_to(perkbundle.var_c70f3f3a7f26b274, undefined);
    var_dbd9316d7df681b = default_to(var_fe59c44529c721a0, perkbundle.var_94619674d83d9e85);
    var_f767f108d547a3b0 = default_to(var_de61bccad0dcc303, 1);
    register_perk_basic_info(root_perk, perkbundle.var_8e766728aefc1bff, var_dbd9316d7df681b, str_hint, var_811b03f65b47c4eb, perkbundle.var_26793ea89948adb, perkbundle.var_50ff10282e5fb08f, root_perk, var_84e0adf6b525665c, var_f767f108d547a3b0, var_f209168e865e2517);
    register_perk_threads(root_perk, func_give_player_perk, func_take_player_perk);
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x827
// Size: 0x44
function _register_undefined_perk(str_perk) {
    level._custom_perks = default_to(level._custom_perks, []);
    if (!isdefined(level._custom_perks[str_perk])) {
        level._custom_perks[str_perk] = spawnstruct();
    }
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x873
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

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8bd
// Size: 0x147
function function_6935a6121f60fefb(params) {
    /#
        if (level._custom_perks.size) {
            self endon("<dev string:x31e>");
            var_3352bf952cfc182a = self.name;
            keys = getarraykeys(level._custom_perks);
            foreach (key in keys) {
                function_6e7290c8ee4f558b("<dev string:x327>" + var_3352bf952cfc182a + "<dev string:x337>");
                function_b23a59dfb4ca49a1("<dev string:x33c>" + key, "<dev string:x34a>" + key + "<dev string:x35e>" + var_3352bf952cfc182a, &function_d6df8a69866fa55d);
                function_b23a59dfb4ca49a1("<dev string:x363>" + key, "<dev string:x371>" + key + "<dev string:x35e>" + var_3352bf952cfc182a, &function_edb352d1101bc34f);
                function_fe953f000498048f();
            }
            function_6e7290c8ee4f558b("<dev string:x327>" + var_3352bf952cfc182a + "<dev string:x337>");
            function_b23a59dfb4ca49a1("<dev string:x385>", "<dev string:x3a1>" + var_3352bf952cfc182a + "<dev string:x35e>", &function_4395673d0d4ae3c6);
            function_b23a59dfb4ca49a1("<dev string:x3ba>", "<dev string:x3d6>" + var_3352bf952cfc182a + "<dev string:x35e>", &function_33e402afcb6d2c04);
            function_fe953f000498048f();
        }
    #/
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa0c
// Size: 0x173
function give_perk(perk, bought) {
    self.num_perks = default_to(self.num_perks, 0);
    self.num_perks++;
    self.a_perks[perk] = 1;
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
    params.specialtyperk = perk;
    callback::callback("zm_perk_obtained", params);
    if (istrue(level.var_e2cfbd4132b67bb9) && self.num_perks <= 3) {
        thread function_886e9c6f3a5ab9bb(perk);
        return;
    }
    thread perk_think(perk);
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb87
// Size: 0x119
function perk_think(perk) {
    self endon("disconnect");
    perk_str = perk + "_stop";
    result = waittill_any_return_4("fake_death", "death", perk_str);
    var_f209168e865e2517 = isdefined(level._custom_perks[perk]) && istrue(level._custom_perks[perk].var_f209168e865e2517);
    self unsetperk(perk, var_f209168e865e2517);
    self.num_perks--;
    self.a_perks[perk] = undefined;
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

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xca8
// Size: 0x40
function give_perk_presentation(perk) {
    self endon("player_downed");
    self endon("disconnect");
    self endon("end_game");
    self endon("perk_abort_drinking");
    thread function_aca2962451f93f78(perk);
    if (istrue(level.var_a1e71a5993ec79c8)) {
    }
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcf0
// Size: 0x12
function function_aca2962451f93f78(perk) {
    self endon("death");
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd0a
// Size: 0x110
function function_886e9c6f3a5ab9bb(perk) {
    self endon("disconnect");
    perk_str = perk + "_stop";
    waittill_any_return_4("fake_death", "death", perk_str);
    waitframe();
    var_f209168e865e2517 = isdefined(level._custom_perks[perk]) && istrue(level._custom_perks[perk].var_f209168e865e2517);
    self unsetperk(perk, var_f209168e865e2517);
    self.num_perks--;
    self.a_perks[perk] = undefined;
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

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe22
// Size: 0x32
function has_perk(perkname) {
    perks = self.a_perks;
    if (!isdefined(perks)) {
        return false;
    }
    if (isdefined(perks[perkname])) {
        return true;
    }
    return false;
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe5d
// Size: 0xa7
function function_cdb669c56d86f5c4(var_2398867c16e7d267) {
    valid_perks = function_47a5564594564627();
    active_perks = function_ad6e85c9533ac466();
    if (isarray(active_perks)) {
        valid_perks = array_remove_array(valid_perks, active_perks);
    }
    if (isarray(var_2398867c16e7d267)) {
        valid_perks = array_remove_array(valid_perks, var_2398867c16e7d267);
    }
    random_perk = function_b01d83652396cbb0(valid_perks);
    if (isdefined(random_perk)) {
        gesture = default_to(level._custom_perks[random_perk].perk_bottle_weapon, "cer_zm_vm_ges_001");
        thread function_fe9f92094d839eaf(gesture);
        give_perk(random_perk);
        return random_perk;
    }
    return undefined;
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf0d
// Size: 0x48
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

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf5d
// Size: 0x78
function function_47a5564594564627() {
    var_29eaf15edd1cfdd4 = [];
    foreach (key, perk in level._custom_perks) {
        if (key != "specialty_choice") {
            var_29eaf15edd1cfdd4 = array_add(var_29eaf15edd1cfdd4, perk.var_e3d5b979024de96);
        }
    }
    return var_29eaf15edd1cfdd4;
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfde
// Size: 0x3c
function function_b01d83652396cbb0(var_29eaf15edd1cfdd4) {
    assert(isarray(var_29eaf15edd1cfdd4), "<dev string:x3ef>");
    if (var_29eaf15edd1cfdd4.size == 0) {
        return undefined;
    }
    perk = random(var_29eaf15edd1cfdd4);
    return perk;
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1023
// Size: 0x6e
function function_ad6e85c9533ac466() {
    var_29eaf15edd1cfdd4 = [];
    foreach (perk in self.perks_active) {
        if (perk != "specialty_choice") {
            var_29eaf15edd1cfdd4 = array_add(var_29eaf15edd1cfdd4, perk);
        }
    }
    return var_29eaf15edd1cfdd4;
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x109a
// Size: 0x8b
function function_ab7a3ff9f75e4867(var_5ef4401adf60da76) {
    bundle = level.perkbundles[var_5ef4401adf60da76];
    extra_perks = bundle.zombiesextraperks;
    foreach (perk in extra_perks) {
        scripts\mp\utility\perk::giveperk(perk.extraperk);
    }
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x112d
// Size: 0x8b
function function_fe0d28e6f0008329(var_5ef4401adf60da76) {
    bundle = level.perkbundles[var_5ef4401adf60da76];
    extra_perks = bundle.zombiesextraperks;
    foreach (perk in extra_perks) {
        scripts\mp\utility\perk::removeperk(perk.extraperk);
    }
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11c0
// Size: 0x81
function function_b1e24c0eaeadfac7() {
    cost = level.gametypebundle.var_df5e6a3d7e67d4de;
    if (isdefined(self.perks_active)) {
        cost += self.perks_active.size * level.gametypebundle.var_d8a6002d5eaba519;
    }
    if (scripts\mp\utility\perk::_hasperk("specialty_exfil_perk_percent_reward")) {
        cost = int(cost * level.perkbundles["specialty_exfil_perk_percent_reward"].var_7a8b971bedec7699);
    }
    return cost;
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x124a
// Size: 0x24
function register_lost_perk_override(func_override) {
    level.var_fb9e36084218c7cd = array_add(level.var_fb9e36084218c7cd, func_override);
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1276
// Size: 0x6f
function lost_perk_override(perk) {
    if (!scripts\mp\utility\player::isinlaststand(self)) {
        return false;
    }
    foreach (var_d5c77caf08eb4580 in level.var_fb9e36084218c7cd) {
        if (self [[ var_d5c77caf08eb4580 ]](perk)) {
            return true;
        }
    }
    return false;
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12ee
// Size: 0x125
function function_1f957407227bb410() {
    if (isdefined(self.perks_active)) {
        packeddata = [0, 0, 0];
        var_ea58090612b7ef72 = [0, 0, 0];
        perkmax = 32 - 1;
        perkindex = 0;
        foreach (perk in self.perks_active) {
            var_91b1c677982419e8 = level.var_d27638e3b575cad1[perk];
            if (!isdefined(var_91b1c677982419e8)) {
                continue;
            }
            var_d861f893072a477e = int(perkindex / 6);
            packeddata[var_d861f893072a477e] = packeddata[var_d861f893072a477e] + ((var_91b1c677982419e8 & perkmax) << var_ea58090612b7ef72[var_d861f893072a477e]);
            var_ea58090612b7ef72[var_d861f893072a477e] = var_ea58090612b7ef72[var_d861f893072a477e] + 5;
            perkindex++;
        }
        self setclientomnvar("ui_active_perks_1", packeddata[0]);
        self setclientomnvar("ui_active_perks_2", packeddata[1]);
        self setclientomnvar("ui_active_perks_3", packeddata[2]);
    }
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x141b
// Size: 0x29
function function_c3fda966e9a355c1() {
    self setclientomnvar("ui_active_perks_1", 0);
    self setclientomnvar("ui_active_perks_2", 0);
    self setclientomnvar("ui_active_perks_3", 0);
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x144c
// Size: 0xab
function function_df76bc163c4ea0a9(params) {
    if (isdefined(params.progress)) {
        self setclientomnvar("ui_bleedout_progress", params.progress);
        if (istrue(level.gametypebundle.var_ec7a9ca55193be5e)) {
            if (params.progress < 0.25) {
                self.var_8259418ae21ea504 = 3;
                return;
            }
            if (params.progress < 0.5) {
                self.var_8259418ae21ea504 = 2;
                return;
            }
            if (params.progress < 0.75) {
                self.var_8259418ae21ea504 = 1;
            }
        }
    }
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14ff
// Size: 0xb5
function function_8df3a882ad56636(params) {
    self endon("disconnect");
    if (istrue(level.gametypebundle.var_ec7a9ca55193be5e)) {
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

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15bc
// Size: 0xa3
function function_1617ba608cb9b50c(params) {
    self setclientomnvar("ui_laststand_visibility", 0);
    if (istrue(level.gametypebundle.var_ec7a9ca55193be5e)) {
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

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1667
// Size: 0x1f
function function_9c2682b7c1e353d3(params) {
    function_c3fda966e9a355c1();
    self setclientomnvar("ui_laststand_visibility", 0);
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168e
// Size: 0x46
function function_37c9042a45291641() {
    callback::add("player_laststand", &function_8df3a882ad56636);
    callback::add("player_revived", &function_1617ba608cb9b50c);
    callback::add("player_death", &function_9c2682b7c1e353d3);
    callback::add("bleedout_tick", &function_df76bc163c4ea0a9);
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16dc
// Size: 0x22
function take_perk(str_perk) {
    str_notify = str_perk + "_stop";
    self notify(str_notify);
}

// Namespace zombie_perks / namespace_876b4362ef613d7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1706
// Size: 0x58
function function_fd9a6fb7a67bcf3e(str_perk) {
    if (has_perk(str_perk)) {
        return false;
    }
    gesture = default_to(level._custom_perks[str_perk].perk_bottle_weapon, "cer_zm_vm_ges_001");
    thread function_fe9f92094d839eaf(gesture);
    give_perk(str_perk, 1);
    return true;
}

/#

    // Namespace zombie_perks / namespace_876b4362ef613d7a
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1767
    // Size: 0xf5
    function function_e4d3cdf382f6b0b3() {
        level notify("<dev string:x40f>");
        level endon("<dev string:x40f>");
        var_cdd4ba2fddec6485 = 275;
        var_267d795ee5eeee70 = 1295;
        var_e5cfcafbce32a497 = 12;
        var_88d8f05016945d4d = 30;
        while (true) {
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
    }

    // Namespace zombie_perks / namespace_876b4362ef613d7a
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1864
    // Size: 0x7c
    function function_d6df8a69866fa55d(a_params, play_gesture) {
        play_gesture = default_to(play_gesture, 1);
        str_perk = a_params[0];
        player = function_b3818ef99e063667(a_params[1]);
        if (player has_perk(str_perk)) {
            return;
        }
        if (play_gesture) {
            player thread function_fe9f92094d839eaf(level._custom_perks[str_perk].perk_bottle_weapon);
        }
        player give_perk(str_perk, 0);
    }

    // Namespace zombie_perks / namespace_876b4362ef613d7a
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x18e8
    // Size: 0x46
    function function_edb352d1101bc34f(a_params) {
        str_perk = a_params[0];
        str_notify = str_perk + "<dev string:x436>";
        player = function_b3818ef99e063667(a_params[1]);
        player notify(str_notify);
    }

    // Namespace zombie_perks / namespace_876b4362ef613d7a
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1936
    // Size: 0x96
    function function_4395673d0d4ae3c6(a_params) {
        player = function_b3818ef99e063667(a_params[0]);
        keys = getarraykeys(level._custom_perks);
        foreach (key in keys) {
            if (player has_perk(key)) {
                continue;
            }
            player give_perk(key, 0);
            waitframe();
        }
    }

    // Namespace zombie_perks / namespace_876b4362ef613d7a
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x19d4
    // Size: 0x92
    function function_33e402afcb6d2c04(a_params) {
        player = function_b3818ef99e063667(a_params[0]);
        keys = getarraykeys(level._custom_perks);
        foreach (key in keys) {
            str_notify = key + "<dev string:x436>";
            player notify(str_notify);
        }
    }

    // Namespace zombie_perks / namespace_876b4362ef613d7a
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a6e
    // Size: 0xe
    function function_dbc961776f2f056a(a_params) {
        
    }

    // Namespace zombie_perks / namespace_876b4362ef613d7a
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a84
    // Size: 0x8e
    function function_b3818ef99e063667(str_name) {
        foreach (player in level.players) {
            if (player.name == str_name) {
                return player;
            }
            if (isbot(player)) {
                if (issubstr(player.name, str_name)) {
                    return player;
                }
            }
        }
    }

#/
