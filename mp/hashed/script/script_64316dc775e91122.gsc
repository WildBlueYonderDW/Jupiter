#using script_2583ee5680cf4736;
#using script_2669878cf5a1b6bc;
#using script_3a4480ba1c5664d0;
#using script_638d701d263ee1ed;
#using script_639bf783929acf9b;
#using script_6bffae1b97f70547;
#using script_860bfdfe82326e3;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\throttle;
#using scripts\engine\utility;
#using scripts\mp\utility\lui_game_event_aggregator;
#using scripts\mp\utility\perk;

#namespace pack_a_punch;

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c6
// Size: 0x126
function init_pap(var_74cdac95bea43e20) {
    /#
        level thread function_3749f024c16fcc43();
    #/
    level.var_28967913115d1fa3 = [];
    level.var_74cdac95bea43e20 = [];
    namespace_4164bc931714b00b::register_script("pack_a_punch", &function_b7481f7bce6ae192);
    level callback::add("player_connect", &function_4fea0f8d04cd5a9f);
    /#
        callback::add("<dev string:x1c>", &function_ac138c84c0432491);
    #/
    callback::add("player_weapon_change", &function_9978ad7acc70bbd0);
    level.var_999ad4260faef0e = ["", "_pack", "_pack", "_pack"];
    level.var_b4d422cd8fbde1ad = 1;
    if (!istrue(level.gamemodebundle.var_7746f48b0ed07126)) {
        level thread function_f2d3dc064699b591();
    } else {
        callback::add("ob_content_process_create_script", &function_f2d3dc064699b591);
    }
    level thread function_4aa535a603fcb16a(var_74cdac95bea43e20);
    registersharedfunc("zombie", "get_pap_level", &get_pap_level);
    level.var_41b1ceff53cc7e4d = throttle::throttle_initialize("pap_disable_camo");
    level callback::add("ob_content_process_create_script", &function_5b6d2196b317fd35);
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f4
// Size: 0x198
function function_5b6d2196b317fd35(params) {
    if (isdefined(level.var_c383b967aa7e551b)) {
        var_81a0a69befe256bd = [];
        var_3c3122af5c02bd7 = getstructarray("content_struct", "variantname");
        foreach (struct in var_3c3122af5c02bd7) {
            if (isdefined(struct.content_key) && struct.content_key == "pap_spawn") {
                var_81a0a69befe256bd = array_add(var_81a0a69befe256bd, struct);
            }
        }
        var_647e08da9152309b = [];
        var_81a0a69befe256bd = array_randomize(var_81a0a69befe256bd);
        foreach (s_pap in var_81a0a69befe256bd) {
            region = namespace_f721fc7d0d2d0f47::get_region(s_pap.origin);
            if (!isdefined(region)) {
                continue;
            }
            regiondifficulty = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(region);
            if (regiondifficulty == "difficulty_hard" || regiondifficulty == "difficulty_darkaether") {
                function_d76a5a37bdc449e3(s_pap);
                var_647e08da9152309b[var_647e08da9152309b.size] = s_pap;
                break;
            }
        }
        var_81a0a69befe256bd = [[ level.var_c383b967aa7e551b ]]("pap", var_81a0a69befe256bd, &function_d76a5a37bdc449e3, var_647e08da9152309b);
        level.var_28967913115d1fa3 = array_combine_unique(level.var_28967913115d1fa3, var_81a0a69befe256bd);
    }
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x894
// Size: 0x13
function private function_d76a5a37bdc449e3(var_cf7a501ac4f86500) {
    var_cf7a501ac4f86500 function_e9a23532607e421b();
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8af
// Size: 0x15
function function_4fea0f8d04cd5a9f(params) {
    self.var_7a6ac8a30c8eef4c = [];
}

/#

    // Namespace pack_a_punch / namespace_a4ff02beedc1bce8
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x8cc
    // Size: 0x168
    function function_ac138c84c0432491(params) {
        self endon("<dev string:x2e>");
        wait 3;
        if (level.var_b4d422cd8fbde1ad) {
            function_6e7290c8ee4f558b("<dev string:x3c>" + self.name + "<dev string:x63>");
            foreach (s_pap in level.var_28967913115d1fa3) {
                function_b23a59dfb4ca49a1(s_pap.name, "<dev string:x68>" + s_pap.name + "<dev string:x7c>" + self.name, &function_d1ffd6e50972869b);
            }
            function_fe953f000498048f();
            function_6e7290c8ee4f558b("<dev string:x81>" + self.name + "<dev string:x63>");
            foreach (s_pap in level.var_28967913115d1fa3) {
                function_b23a59dfb4ca49a1(s_pap.name, "<dev string:xad>" + s_pap.name + "<dev string:x7c>" + self.name, &function_5b1246d4c3b2bae8);
            }
            function_fe953f000498048f();
        }
    }

#/

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa3c
// Size: 0x15b
function function_f46640f2061fa40e() {
    level.var_389f96815631487 = [];
    var_3bdc59ecfc03a38d = function_127acf3af63de42e();
    level.var_389f96815631487["hintstring_only"] = spawnstruct();
    level.var_389f96815631487["hintstring_only"].var_f3201c9531e84083 = var_3bdc59ecfc03a38d.var_b310d95a43d51411;
    level.var_389f96815631487["hintstring_only"].var_40c5fe63017a0028 = var_3bdc59ecfc03a38d.var_b174fd304230ba35;
    level.var_389f96815631487["hintstring_only"].var_f3201d9531e842b6 = var_3bdc59ecfc03a38d.var_b310d65a43d50d78;
    level.var_389f96815631487["hintstring_only"].var_d9a16a76860e6fb5 = var_3bdc59ecfc03a38d.var_3a327e1fbf019eb6;
    level.var_389f96815631487["hintstring_only"].var_f3201e9531e844e9 = var_3bdc59ecfc03a38d.var_b310d75a43d50fab;
    level.var_389f96815631487["hintstring_only"].var_7a6ad8de7cb26202 = var_3bdc59ecfc03a38d.var_1dac12541578526b;
    level.var_389f96815631487["hintstring_only"].var_546f21bbff45af2f = var_3bdc59ecfc03a38d.var_741fb5ba0af7dbec;
    level.var_389f96815631487["hintstring_only"].var_e532cc181ecbb197 = var_3bdc59ecfc03a38d.var_34a3243d4dbe42f2;
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb9f
// Size: 0x45
function function_8ffd6120b9e72251(v_pos) {
    if (isdefined(level.var_780248e36eabf6ef)) {
        var_2fcb35d230365682 = [[ level.var_780248e36eabf6ef ]](v_pos);
    } else {
        var_2fcb35d230365682 = purchasemenu::function_cfd0e1fb13d7e080(#"pap");
    }
    return var_2fcb35d230365682;
}

/#

    // Namespace pack_a_punch / namespace_a4ff02beedc1bce8
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xbed
    // Size: 0xb1
    function function_3749f024c16fcc43() {
        function_6e7290c8ee4f558b("<dev string:xc6>");
        function_a9a864379a098ad6("<dev string:xdd>", "<dev string:xf0>", &function_48d69eea9b7ed244, 1);
        function_a9a864379a098ad6("<dev string:x103>", "<dev string:x11a>", &function_310eb57e9f489403);
        function_a9a864379a098ad6("<dev string:x131>", "<dev string:x147>", &function_6301b4b9186189ec);
        function_a9a864379a098ad6("<dev string:x15d>", "<dev string:x175>", &function_9b340159cdb06093);
        function_fe953f000498048f();
        function_6e7290c8ee4f558b("<dev string:x18d>");
        function_a9a864379a098ad6("<dev string:x131>", "<dev string:x147>", &function_6301b4b9186189ec);
        function_a9a864379a098ad6("<dev string:x15d>", "<dev string:x175>", &function_9b340159cdb06093);
        function_fe953f000498048f();
    }

    // Namespace pack_a_punch / namespace_a4ff02beedc1bce8
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0xca6
    // Size: 0xf5
    function private function_d1ffd6e50972869b(params) {
        s_pap = undefined;
        foreach (s_pap in level.var_28967913115d1fa3) {
            if (s_pap.name == params[0]) {
                foreach (player in level.players) {
                    if (player.name == params[1]) {
                        player.var_5070f05815274d88 = undefined;
                        s_pap.mdl_pap.interact function_c1b2d811be564958(player);
                        return;
                    }
                }
            }
        }
    }

    // Namespace pack_a_punch / namespace_a4ff02beedc1bce8
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0xda3
    // Size: 0xea
    function private function_5b1246d4c3b2bae8(params) {
        s_pap = undefined;
        foreach (s_pap in level.var_28967913115d1fa3) {
            if (s_pap.name == params[0]) {
                foreach (player in level.players) {
                    if (player.name == params[1]) {
                        if (isdefined(player.s_pap_machine)) {
                            player.var_5070f05815274d88 = 1;
                        }
                        return;
                    }
                }
            }
        }
    }

    // Namespace pack_a_punch / namespace_a4ff02beedc1bce8
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xe95
    // Size: 0x88
    function private function_6301b4b9186189ec() {
        foreach (player in level.players) {
            currentweapon = player getcurrentweapon();
            if (player can_pap(currentweapon)) {
                var_5476695cf42091ed = player get_pap_level(currentweapon);
                player pap_weapon(currentweapon, var_5476695cf42091ed);
            }
        }
    }

    // Namespace pack_a_punch / namespace_a4ff02beedc1bce8
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xf25
    // Size: 0x5f
    function private function_9b340159cdb06093() {
        foreach (player in level.players) {
            player function_8a514af6a4020(player getcurrentweapon());
        }
    }

    // Namespace pack_a_punch / namespace_a4ff02beedc1bce8
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xf8c
    // Size: 0x59
    function private function_310eb57e9f489403() {
        foreach (var_429a9d29cea7b27d in level.var_28967913115d1fa3) {
            var_429a9d29cea7b27d enable_pap();
        }
    }

#/

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfed
// Size: 0x95
function function_f2d3dc064699b591(params) {
    level endon("game_ended");
    function_f46640f2061fa40e();
    function_4fc54a99a17b78cb();
    waittillframeend();
    a_destinations = getstructarray("content_destination", "variantname");
    foreach (destination in a_destinations) {
        level thread function_e89cb00407326ff5(destination);
    }
    scripts\mp\utility\lui_game_event_aggregator::registeronluieventcallback(&function_7555b4c311cdf27c);
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x108a
// Size: 0xcd
function function_e89cb00407326ff5(destination) {
    foreach (location in destination.locations) {
        pap_instance = location.instances["pack_a_punch"];
        if (isdefined(pap_instance)) {
            foreach (instance in pap_instance.versions) {
                namespace_4164bc931714b00b::spawn_instance(instance);
            }
        }
    }
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x115f
// Size: 0xb4
function private function_b7481f7bce6ae192(instance) {
    level.var_28967913115d1fa3 = array_combine_unique(level.var_28967913115d1fa3, instance.contentgroups["pap_spawn"]);
    foreach (var_429a9d29cea7b27d in level.var_28967913115d1fa3) {
        var_429a9d29cea7b27d.str_destination = instance.location.destination.targetname;
        var_429a9d29cea7b27d function_e9a23532607e421b(instance);
    }
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x121b
// Size: 0x9b
function function_4aa535a603fcb16a(var_74cdac95bea43e20) {
    if (isdefined(level.weaponmetadata)) {
        var_74cdac95bea43e20 = [];
        foreach (str_weapon_name, s_weapon in level.weaponmetadata) {
            if (istrue(s_weapon.canpap)) {
                var_74cdac95bea43e20[str_weapon_name] = str_weapon_name;
            }
        }
    }
    /#
        if (!isdefined(var_74cdac95bea43e20)) {
            assertmsg("<dev string:x1ac>");
        }
    #/
    level.var_74cdac95bea43e20 = var_74cdac95bea43e20;
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12be
// Size: 0x5e
function function_127acf3af63de42e() {
    assertex(isdefined(level.gamemodebundle.packapunchbundle), "<dev string:x1d5>");
    var_d8f161c6e98cdfa1 = default_to(level.var_ae30f5b886731a98, level.gamemodebundle.packapunchbundle);
    return getscriptbundle("packapunch:" + var_d8f161c6e98cdfa1);
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1325
// Size: 0x28
function function_4fc54a99a17b78cb() {
    s_bundle = function_127acf3af63de42e();
    level.pap_camos = s_bundle.camolist;
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1355
// Size: 0x3c
function function_5e8f96f1bc95aacd() {
    s_bundle = function_127acf3af63de42e();
    if (isdefined(s_bundle.scriptable) && s_bundle.scriptable != "") {
        return true;
    }
    return false;
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x139a
// Size: 0x36e
function function_e9a23532607e421b(instance) {
    if (isdefined(self.mdl_pap)) {
        return;
    }
    s_bundle = function_127acf3af63de42e();
    self.var_2217ae64fad1e = s_bundle.model;
    self.radius = default_to(self.radius, 64);
    level.var_47ea54565556fd68 = default_to(level.var_47ea54565556fd68, 0);
    self.name = default_to(self.targetname, "PAP_" + level.var_47ea54565556fd68);
    level.var_47ea54565556fd68++;
    if (function_5e8f96f1bc95aacd()) {
        var_e89a9a6a3475bd0a = function_127acf3af63de42e().scriptable;
        self.mdl_pap = spawnscriptable(var_e89a9a6a3475bd0a, self.origin, self.angles);
        self.mdl_pap.interact = namespace_5775ad2badedbcaa::function_32645103f7520635(self.mdl_pap, &function_c1b2d811be564958);
        self.mdl_pap.s_pap = self;
        self.mdl_pap.var_2fcb35d230365682 = function_8ffd6120b9e72251(self.mdl_pap.origin);
        thread function_89884a03ad5f622c();
        if (!istrue(s_bundle.var_69e6100b657f07a6)) {
            self.mdl_pap.interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_3b2684b76c1ab98e);
        }
    } else {
        self.mdl_pap = namespace_4164bc931714b00b::spawn_script_model(self, self.var_2217ae64fad1e, 1, 1);
        assertex(self.mdl_pap isscriptable(), "<dev string:x22b>");
        self.mdl_pap.var_2fcb35d230365682 = function_8ffd6120b9e72251(self.mdl_pap.origin);
        self.mdl_pap.var_f18bb191dfec8db9 = createnavobstaclebyent(self.mdl_pap);
    }
    if (!function_5e8f96f1bc95aacd()) {
        if (istrue(s_bundle.var_69e6100b657f07a6)) {
            self.mdl_pap.interact = namespace_5775ad2badedbcaa::register_interact(self.mdl_pap, self.radius, &function_c1b2d811be564958);
            self.mdl_pap.interact namespace_5775ad2badedbcaa::function_9a0883b5a0999dac();
            self.mdl_pap.interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_4572d5e97616f34c);
        } else {
            self.mdl_pap.interact = namespace_5775ad2badedbcaa::register_interact(self.mdl_pap, self.radius, &function_c1b2d811be564958);
            self.mdl_pap.interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_3b2684b76c1ab98e);
        }
        if (self.mdl_pap.interact tagexists("tag_hint")) {
            self.mdl_pap.interact sethinttag("tag_hint");
        }
        self.mdl_pap.interact.s_pap = self;
    }
    if (istrue(self.script_start)) {
        enable_pap(1);
        return;
    }
    disable_pap(1);
    thread function_d0c65b564a1ac22();
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1710
// Size: 0x7c
function private function_89884a03ad5f622c() {
    if (isdefined(self.mdl_pap.var_2fcb35d230365682.var_6c3d26c5e933dcfd)) {
        b_success = self.mdl_pap utility::function_3677f2be30fdd581("region_color", "off");
        waitframe();
        b_success = self.mdl_pap utility::function_3677f2be30fdd581("region_color", self.mdl_pap.var_2fcb35d230365682.var_6c3d26c5e933dcfd);
    }
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1794
// Size: 0x405
function private function_3b2684b76c1ab98e(usable, player) {
    if (isdefined(player) && istrue(player.interactions_disabled)) {
        return {#string:%, #type:"HINT_NOICON"};
    }
    w_current = player getcurrentweapon();
    var_29a8ba8c9dd43fd2 = player get_pap_level(w_current);
    if (!player can_pap(w_current)) {
        return {#string:level.var_389f96815631487["hintstring_only"].var_546f21bbff45af2f, #type:"HINT_NOBUTTON"};
    }
    str_weapon = w_current.displayname;
    var_2fcb35d230365682 = function_8ffd6120b9e72251(usable.origin);
    if (isdefined(var_2fcb35d230365682)) {
        item = purchasemenu::function_904f24ea774b8f6f(var_2fcb35d230365682.ref, var_29a8ba8c9dd43fd2);
        if (isdefined(item)) {
            cost = item.cost;
            currency = item.currency;
            if (player scripts\mp\utility\perk::_hasperk("specialty_exfil_pap_percent_reward")) {
                cost = int(item.cost * level.perkbundles["specialty_exfil_pap_percent_reward"].var_7091af12e157769c);
            }
        } else {
            return {#string:level.var_389f96815631487["hintstring_only"].var_e532cc181ecbb197, #type:"HINT_NOBUTTON"};
        }
    } else {
        return {#string:level.var_389f96815631487["hintstring_only"].var_e532cc181ecbb197, #type:"HINT_NOBUTTON"};
    }
    switch (var_29a8ba8c9dd43fd2) {
    case 0:
        if (player namespace_7dfc6454a70f3f39::function_bcc79745d547a99c(currency, cost)) {
            return {#params:[str_weapon, cost], #string:level.var_389f96815631487["hintstring_only"].var_f3201c9531e84083, #type:"HINT_BUTTON"};
        } else {
            return {#params:[str_weapon, cost], #string:level.var_389f96815631487["hintstring_only"].var_40c5fe63017a0028, #type:"HINT_BUTTON"};
        }
    case 1:
        if (player namespace_7dfc6454a70f3f39::function_bcc79745d547a99c(currency, cost)) {
            return {#params:[str_weapon, cost], #string:level.var_389f96815631487["hintstring_only"].var_f3201d9531e842b6, #type:"HINT_BUTTON"};
        } else {
            return {#params:[str_weapon, cost], #string:level.var_389f96815631487["hintstring_only"].var_d9a16a76860e6fb5, #type:"HINT_BUTTON"};
        }
    case 2:
        if (player namespace_7dfc6454a70f3f39::function_bcc79745d547a99c(currency, cost)) {
            return {#params:[str_weapon, cost], #string:level.var_389f96815631487["hintstring_only"].var_f3201e9531e844e9, #type:"HINT_BUTTON"};
        } else {
            return {#params:[str_weapon, cost], #string:level.var_389f96815631487["hintstring_only"].var_7a6ad8de7cb26202, #type:"HINT_BUTTON"};
        }
        break;
    }
    return {#string:level.var_389f96815631487["hintstring_only"].var_e532cc181ecbb197, #type:"HINT_NOBUTTON"};
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1ba2
// Size: 0x86
function private function_4572d5e97616f34c(usable, player) {
    if (isdefined(player) && isdefined(usable)) {
        if (istrue(player.interactions_disabled)) {
            return {#string:%, #type:"HINT_NOICON"};
        }
        return {#string:%SHARED_HINTSTRINGS/PAP_USE, #type:"HINT_BUTTON"};
    }
    return {#string:%, #type:"HINT_NOICON"};
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c31
// Size: 0x27
function function_d0c65b564a1ac22() {
    if (isdefined(self.script_power)) {
        flag_wait(self.script_power);
    }
    thread enable_pap();
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c60
// Size: 0xc6
function disable_pap(b_immediate) {
    if (isdefined(self.mdl_pap)) {
        if (function_5e8f96f1bc95aacd()) {
            self.mdl_pap utility::function_3677f2be30fdd581("usable", "off");
            foreach (player in level.players) {
                self.mdl_pap disablescriptableplayeruse(player);
            }
        } else {
            self.mdl_pap.interact function_dfb78b3e724ad620(0);
        }
        self.var_cd756b37f6f0e181 = undefined;
        self notify("disable_pap");
    }
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d2e
// Size: 0x8c
function enable_pap(b_immediate) {
    if (isdefined(self.mdl_pap)) {
        self.var_cd756b37f6f0e181 = 1;
        if (istrue(b_immediate)) {
            self.mdl_pap utility::function_3677f2be30fdd581("base", "pap_idle");
            enable_interact();
        } else {
            var_59e5f52828bb5ed = 4.1;
            self.mdl_pap utility::function_3677f2be30fdd581("base", "pap_activate");
            delaythread(var_59e5f52828bb5ed, &enable_interact);
        }
        thread function_5441576d06b2a361();
    }
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc2
// Size: 0x7e
function function_666c0ed7301de9f3(e_linkto, str_tag, v_origin_offset, var_ef082039f7c502cc) {
    if (!isdefined(v_origin_offset)) {
        v_origin_offset = (0, 0, 0);
    }
    if (!isdefined(var_ef082039f7c502cc)) {
        var_ef082039f7c502cc = (0, 0, 0);
    }
    if (isent(self)) {
        if (isdefined(str_tag)) {
            self linkto(e_linkto, str_tag, v_origin_offset, var_ef082039f7c502cc);
        } else {
            self linkto(e_linkto);
        }
        return;
    }
    self scriptablesetparententity(e_linkto, v_origin_offset, var_ef082039f7c502cc);
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e48
// Size: 0x51
function function_a90b4bc92d126cd1(player) {
    if (!isplayer(player)) {
        return false;
    }
    weapon = player getcurrentweapon();
    if (!isdefined(level.var_74cdac95bea43e20[weapon.var_9d7facbe889e667c]) && !namespace_dc2e59577d3a271f::function_6a22621172a35366(weapon)) {
        return false;
    }
    return true;
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea2
// Size: 0x6f
function function_c1b2d811be564958(player) {
    if (!function_a90b4bc92d126cd1(player)) {
        player playsoundtoplayer("ui_zm_core_purchase_deny", player);
        return;
    }
    if (istrue(player.interactions_disabled)) {
        return;
    }
    self.s_pap.var_c80acd5b1945a70f = player;
    player.s_pap_machine = self.s_pap;
    player thread function_9662c40edf345173(self.s_pap);
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f19
// Size: 0x9f
function enable_interact() {
    if (function_5e8f96f1bc95aacd()) {
        self.mdl_pap utility::function_3677f2be30fdd581("usable", "on");
        foreach (player in level.players) {
            self.mdl_pap enablescriptableplayeruse(player);
        }
        return;
    }
    self.mdl_pap.interact function_dfb78b3e724ad620(1);
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc0
// Size: 0x228
function function_7555b4c311cdf27c(channel, menuitemindex) {
    if (isdefined(menuitemindex)) {
        menuitemindex -= 1;
        if (channel == "pap_weaponupgrade_purchase") {
            var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
            if (!isdefined(var_2fcb35d230365682)) {
                return;
            }
            currentweapon = self getcurrentweapon();
            var_3cf65499b595d11b = get_pap_level(currentweapon);
            item = purchasemenu::function_904f24ea774b8f6f(var_2fcb35d230365682.ref, menuitemindex);
            if (!isdefined(item) || var_3cf65499b595d11b != item.tier) {
                self setclientomnvar(var_2fcb35d230365682.var_8b8931f97eef184, 4);
                self setclientomnvar(var_2fcb35d230365682.var_fd0ea8a834fa0398, gettime());
                return;
            }
            if (!istrue(function_6cea50c31fdfd0b9(menuitemindex))) {
                self setclientomnvar(var_2fcb35d230365682.var_8b8931f97eef184, 3);
                self setclientomnvar(var_2fcb35d230365682.var_fd0ea8a834fa0398, gettime());
                return;
            }
            if (can_pap(currentweapon)) {
                function_ac4575f20a9ea183(self.s_pap_machine, var_3cf65499b595d11b, currentweapon, item);
            }
            return;
        }
        if (channel == "pap_ammomod_purchase") {
            var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
            if (!isdefined(var_2fcb35d230365682)) {
                return;
            }
            currentweapon = self getcurrentweapon();
            var_c8f3faec06777d2c = function_d4897d4fc2a76e56(currentweapon);
            item = purchasemenu::function_904f24ea774b8f6f(var_2fcb35d230365682.ref, menuitemindex);
            if (!isdefined(item) || var_c8f3faec06777d2c == item.itemref) {
                self setclientomnvar(var_2fcb35d230365682.var_8b8931f97eef184, 4);
                self setclientomnvar(var_2fcb35d230365682.var_fd0ea8a834fa0398, gettime());
                return;
            }
            if (!istrue(function_6cea50c31fdfd0b9(menuitemindex))) {
                self setclientomnvar(var_2fcb35d230365682.var_8b8931f97eef184, 3);
                self setclientomnvar(var_2fcb35d230365682.var_fd0ea8a834fa0398, gettime());
                return;
            }
            if (namespace_dc2e59577d3a271f::function_6a22621172a35366(currentweapon)) {
                function_29fecb7dd1dd0df2(self.s_pap_machine, currentweapon, item);
            }
            return;
        }
        if (purchasemenu::function_5c9b6f1c3c67dd97(#"pap", channel)) {
            self.var_5070f05815274d88 = 1;
        }
    }
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21f0
// Size: 0x33
function function_54241c8e78e3cd50(weapon) {
    if (!isplayer(self)) {
        return int(0);
    }
    if (namespace_dc2e59577d3a271f::has_ammo_mod(weapon)) {
        return namespace_dc2e59577d3a271f::function_10839073a33f4feb(weapon);
    }
    return int(0);
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x222c
// Size: 0x31
function function_d4897d4fc2a76e56(weapon) {
    if (!isplayer(self)) {
        return "";
    }
    if (namespace_dc2e59577d3a271f::has_ammo_mod(weapon)) {
        return namespace_dc2e59577d3a271f::get_ammo_mod_name(weapon);
    }
    return "";
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2266
// Size: 0xa6
function get_pap_level(weapon) {
    if (!isplayer(self) || !isdefined(self.var_7a6ac8a30c8eef4c) || !isdefined(weapon)) {
        return int(0);
    }
    weapon = weapon getnoaltweapon();
    foreach (papstruct in self.var_7a6ac8a30c8eef4c) {
        if (weapon == papstruct.weapon) {
            return papstruct.n_level;
        }
    }
    return int(0);
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2315
// Size: 0x12
function private function_9978ad7acc70bbd0(params) {
    function_2f370e45d49b5a9d();
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x232f
// Size: 0x3a
function private function_2f370e45d49b5a9d(weapon) {
    weapon = default_to(weapon, self getcurrentweapon());
    var_29a8ba8c9dd43fd2 = get_pap_level(weapon);
    self setclientomnvar("ui_pap_current_level", var_29a8ba8c9dd43fd2);
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2371
// Size: 0x12f
function function_29fecb7dd1dd0df2(s_pap, currentweapon, item) {
    s_pap.mdl_pap utility::function_3677f2be30fdd581("base", "pap_activate");
    self playsoundtoplayer("ui_zm_core_purchase_success", self);
    var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
    cost = 0;
    currency = "essence";
    if (isdefined(item)) {
        cost = item.cost;
        currency = item.currency;
    }
    if (isdefined(level.var_cfd619492cf55b20)) {
        cost = [[ level.var_cfd619492cf55b20 ]]();
    }
    namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(currentweapon, item.itemref);
    self setclientomnvar("ui_pap_current_ammomod", item.itemid);
    namespace_7dfc6454a70f3f39::attempt_purchase(currency, cost, 1, undefined, #"ammomod", item.itemref);
    self setclientomnvar(var_2fcb35d230365682.var_8b8931f97eef184, 1);
    self setclientomnvar(var_2fcb35d230365682.var_fd0ea8a834fa0398, gettime());
    level notify("pap_machine_activated");
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x24a8
// Size: 0x109
function function_2756cd1449650568(weapon, n_level) {
    var_f4d601b2527b35cf = 0;
    weapon = weapon getnoaltweapon();
    foreach (i, papstruct in self.var_7a6ac8a30c8eef4c) {
        if (papstruct.weapon == weapon) {
            var_f4d601b2527b35cf = 1;
            papstruct.n_level = n_level;
            if (!isdefined(n_level)) {
                self.var_7a6ac8a30c8eef4c[i] = undefined;
                self.var_7a6ac8a30c8eef4c = array_remove_index(self.var_7a6ac8a30c8eef4c, i);
            }
        }
    }
    if (!var_f4d601b2527b35cf && isdefined(n_level)) {
        papstruct = spawnstruct();
        papstruct.weapon = weapon;
        papstruct.n_level = n_level;
        self.var_7a6ac8a30c8eef4c = array_add(self.var_7a6ac8a30c8eef4c, papstruct);
    }
    function_2f370e45d49b5a9d(weapon);
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25b9
// Size: 0x1c4
function function_9662c40edf345173(s_pap) {
    self endon("death_or_disconnect");
    self endon("end_open_pap_menu");
    var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
    var_57c182cc0f81b65b = function_127acf3af63de42e().var_69e6100b657f07a6;
    if (istrue(var_57c182cc0f81b65b)) {
        /#
            iprintlnbold(self.name + "<dev string:x267>" + s_pap.name + "<dev string:x272>");
        #/
        w_current = self getcurrentweapon();
        var_3cf65499b595d11b = get_pap_level(w_current);
        var_f8dabd5cffe4bfa2 = function_54241c8e78e3cd50(w_current);
        var_28b67a6edc18367e = var_2fcb35d230365682.ref;
        var_bf1eb50af72af = default_to(var_2fcb35d230365682.id, -1);
        self setclientomnvar("ui_pap_current_level", var_3cf65499b595d11b);
        self setclientomnvar("ui_pap_current_ammomod", var_f8dabd5cffe4bfa2);
        self setclientomnvar("ui_purchasemenu_id", var_bf1eb50af72af);
        self setclientomnvar(var_2fcb35d230365682.var_c7ffb2549ca8ab4b, gettime());
        function_997e20f4d9f30586(1);
        thread function_e1fa842581ec1de5(s_pap);
        return;
    }
    currentweapon = self getcurrentweapon();
    var_3cf65499b595d11b = get_pap_level(currentweapon);
    var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
    item = purchasemenu::function_904f24ea774b8f6f(var_2fcb35d230365682.ref, var_3cf65499b595d11b);
    if (!isdefined(item)) {
        return;
    }
    if (!function_6cea50c31fdfd0b9(var_3cf65499b595d11b) || self ismeleeing()) {
        self playsoundtoplayer("ui_zm_core_purchase_deny", self);
        return;
    }
    if (can_pap(currentweapon)) {
        function_ac4575f20a9ea183(self.s_pap_machine, var_3cf65499b595d11b, currentweapon, item);
    }
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2785
// Size: 0x203
function function_ac4575f20a9ea183(s_pap, var_5476695cf42091ed, currentweapon, item) {
    var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
    var_ab757fcef92af3cb = var_5476695cf42091ed + 1;
    b_success = s_pap.mdl_pap utility::function_3677f2be30fdd581("base", "pap_activate_" + var_ab757fcef92af3cb);
    if (b_success) {
        s_pap thread function_95cc8bee3147df44("pap_activate_" + var_ab757fcef92af3cb);
    } else {
        s_pap.mdl_pap utility::function_3677f2be30fdd581("base", "pap_activate");
        s_pap thread function_95cc8bee3147df44("pap_activate");
    }
    if (isdefined(level.var_f932763b261a721f)) {
        if (![[ level.var_f932763b261a721f ]](self)) {
            self playsoundtoplayer("ui_zm_core_purchase_success", self);
        }
    } else {
        self playsoundtoplayer("ui_zm_core_purchase_success", self);
    }
    cost = 0;
    currency = "essence";
    if (isdefined(item)) {
        cost = item.cost;
        currency = item.currency;
    }
    if (isdefined(level.var_cfd619492cf55b20)) {
        cost = [[ level.var_cfd619492cf55b20 ]]();
    }
    if (scripts\mp\utility\perk::_hasperk("specialty_exfil_pap_percent_reward")) {
        cost = int(cost * level.perkbundles["specialty_exfil_pap_percent_reward"].var_7091af12e157769c);
    }
    pap_weapon(currentweapon, var_5476695cf42091ed, cost);
    namespace_7dfc6454a70f3f39::attempt_purchase(currency, cost, 1, undefined, #"packapunch");
    params = {#var_29a8ba8c9dd43fd2:var_5476695cf42091ed + 1, #cost:cost, #weapon:currentweapon};
    callback::callback("on_pap_machine_purchase", params);
    self setclientomnvar(var_2fcb35d230365682.var_8b8931f97eef184, 1);
    self setclientomnvar(var_2fcb35d230365682.var_fd0ea8a834fa0398, gettime());
    level notify("pap_machine_activated");
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2990
// Size: 0x3e
function function_95cc8bee3147df44(var_b806709d552b38f7) {
    self.mdl_pap endon("death");
    while (self.mdl_pap utility::function_35c178c80fa19cbd("base", var_b806709d552b38f7)) {
        waitframe();
    }
    thread function_89884a03ad5f622c();
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x29d6
// Size: 0xd2
function get_pap_camo(currentweapon, upgradedlevel) {
    pap_camo = undefined;
    var_cdc27fec07c02e7d = currentweapon.basename;
    var_57383025a4257b70 = upgradedlevel - 1;
    if (isarray(level.var_87233c2c2faa12cb) && array_contains(level.var_87233c2c2faa12cb, var_cdc27fec07c02e7d)) {
        pap_camo = undefined;
    } else if (isarray(level.pap_camos) && isdefined(level.pap_camos[var_57383025a4257b70]) && var_57383025a4257b70 < level.pap_camos.size) {
        pap_camo = level.pap_camos[var_57383025a4257b70].camo;
    }
    if (!isdefined(pap_camo) || istrue(self.var_f7d4ae1ceae3077d)) {
        return getweaponcamoname(currentweapon);
    }
    return pap_camo;
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ab1
// Size: 0x22f
function function_5441576d06b2a361() {
    if (!isdefined(self.mdl_pap)) {
        return;
    }
    self endon("disable_pap");
    self.mdl_pap endon("death");
    var_be315f6c9827b6da = 48;
    while (true) {
        throttle::function_f632348cbb773537(level.var_41b1ceff53cc7e4d, self);
        var_727b1c6120940fca = function_143526130b12b2b6(self.origin, var_be315f6c9827b6da);
        if (var_727b1c6120940fca.size == 0) {
            throttle::function_f632348cbb773537(level.var_41b1ceff53cc7e4d, self);
            continue;
        }
        a_players = [];
        foreach (ent in var_727b1c6120940fca) {
            if (isplayer(ent) && isalive(ent)) {
                a_players[a_players.size] = ent;
            }
        }
        var_8ead1b5013893ee7 = 0;
        foreach (player in a_players) {
            if (player ismeleeing() && !istrue(player.var_69103c55b4319619) && scripts\engine\utility::within_fov(player.origin, player.angles, self.origin, cos(70))) {
                player thread function_b8b51ba0ac848253();
                if (istrue(player.var_f7d4ae1ceae3077d)) {
                    player.var_f7d4ae1ceae3077d = undefined;
                    /#
                        iprintlnbold("<dev string:x282>" + player.name);
                    #/
                } else {
                    player.var_f7d4ae1ceae3077d = 1;
                    /#
                        iprintlnbold("<dev string:x2aa>" + player.name);
                    #/
                }
                var_8ead1b5013893ee7 = 1;
            }
        }
        if (var_8ead1b5013893ee7) {
            self.mdl_pap utility::function_3677f2be30fdd581("base", "pap_static");
            wait 0.5;
            self.mdl_pap utility::function_3677f2be30fdd581("base", "pap_activate");
        }
    }
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce8
// Size: 0x21
function function_b8b51ba0ac848253() {
    self endon("disconnect");
    self.var_69103c55b4319619 = 1;
    wait 3;
    self.var_69103c55b4319619 = undefined;
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2d11
// Size: 0x275
function pap_weapon(currentweapon, var_5476695cf42091ed, cost, var_4d10547837384577) {
    var_1de7c3eef64bb0bb = var_5476695cf42091ed + 1;
    w_take = currentweapon getnoaltweapon();
    w_new = function_a0537467c5341047(w_take, var_1de7c3eef64bb0bb);
    var_7d014f270bcc9853 = undefined;
    if (w_take != currentweapon) {
        var_7d014f270bcc9853 = w_new getaltweapon();
    }
    var_3a56a10345d2e89a = w_new.var_9d7facbe889e667c;
    if (isdefined(self.ammo_mod[var_3a56a10345d2e89a])) {
        self.ammo_mod[var_3a56a10345d2e89a].weaponobj = w_new;
    }
    if (var_5476695cf42091ed == 0 || istrue(var_4d10547837384577)) {
        if (!isdefined(self.var_c37e65eb7cc773eb)) {
            self.var_c37e65eb7cc773eb = [];
        }
        self.var_c37e65eb7cc773eb[var_3a56a10345d2e89a] = w_take.camo;
    }
    level notify("pap_used", self, var_1de7c3eef64bb0bb, w_new);
    oldammocount = 0;
    if (getdvarint(@"hash_c4ccc540649a56f0", 0) && istrue(w_take.hasalternate)) {
        var_75a36fc4b9ce8086 = w_take getaltweapon();
        oldammocount = self getweaponammoclip(var_75a36fc4b9ce8086);
    }
    params = spawnstruct();
    params.w_new = w_new;
    params.w_take = w_take;
    params.var_7d014f270bcc9853 = var_7d014f270bcc9853;
    params.var_29a8ba8c9dd43fd2 = var_5476695cf42091ed + 1;
    params.cost = cost;
    callback::callback("zm_packed_weapon", params);
    self takeweapon(w_take);
    self giveweapon(w_new);
    self switchtoweapon(default_to(var_7d014f270bcc9853, w_new));
    self givemaxammo(w_new);
    if (getdvarint(@"hash_c4ccc540649a56f0", 0) && istrue(w_new.hasalternate)) {
        var_941519edf56b651d = w_new getaltweapon();
        if (isdefined(var_941519edf56b651d.underbarrel) && var_941519edf56b651d.underbarrel == "jup_ub_flame_01") {
            if (isdefined(var_941519edf56b651d.underbarrel) && var_941519edf56b651d.underbarrel == "jup_ub_flame_01") {
                self setweaponammoclip(var_941519edf56b651d, oldammocount);
            }
        }
    }
    function_2756cd1449650568(w_new, var_1de7c3eef64bb0bb);
    self notify("weapon_level_changed");
    self setclientomnvar("ui_pap_current_level", var_1de7c3eef64bb0bb);
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f8e
// Size: 0x19b
function function_a0537467c5341047(currentweapon, var_5476695cf42091ed) {
    var_362a3a0a1e485bf6 = function_d4897d4fc2a76e56(currentweapon);
    camo = get_pap_camo(currentweapon, var_5476695cf42091ed);
    reticle = getweaponreticlename(currentweapon);
    if (issubstr(reticle, "scope")) {
        reticle = int(removesubstr(reticle, "scope"));
        if (reticle == 0) {
            reticle = undefined;
        }
    } else if (!isdefined(namespace_e0ee43ef2dddadaa::getreticleindex(reticle))) {
        reticle = undefined;
    }
    variantid = getweaponvariantindex(currentweapon);
    stickers = [currentweapon.stickerslot0, currentweapon.stickerslot1, currentweapon.stickerslot2, currentweapon.stickerslot3, default_to(currentweapon.var_b39ac546cc8621f8, "none")];
    currentattachments = currentweapon.attachments;
    currentattachmentids = currentweapon.attachmentvarindices;
    var_c0173c6249a46538 = function_5672811f81d28777(currentweapon, currentattachments, currentattachmentids, var_5476695cf42091ed);
    var_e27c23a69f06105a = var_c0173c6249a46538[1];
    var_503110dc18b08ab9 = var_c0173c6249a46538[0];
    w_new = namespace_e0ee43ef2dddadaa::buildweapon(currentweapon.basename, var_503110dc18b08ab9, camo, reticle, variantid, var_e27c23a69f06105a, undefined, stickers);
    if (isdefined(var_362a3a0a1e485bf6) && var_362a3a0a1e485bf6 != "") {
        namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(w_new, var_362a3a0a1e485bf6);
    }
    return w_new;
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3132
// Size: 0x13b
function function_5672811f81d28777(weapon, attachments, attachmentids, usedlevel) {
    str_weapon_name = weapon.var_9d7facbe889e667c;
    if (isdefined(level.weaponmetadata) && isdefined(level.weaponmetadata[str_weapon_name])) {
        var_be53b174c615d624 = level.weaponmetadata[str_weapon_name].var_60cd7d2641a6671b;
        var_c2d75e1eaa5db67a = level.weaponmetadata[str_weapon_name].var_9e1e9ec0fd561685;
        assertex(isdefined(var_be53b174c615d624) && isdefined(var_c2d75e1eaa5db67a), "<dev string:x2d3>");
        if (weapon hasattachment("jup_jp35_sn_moscar_bar_blund")) {
            var_c2d75e1eaa5db67a = "zm_sn_moscar_pack_blund";
        }
        if (!array_contains(attachments, var_c2d75e1eaa5db67a) && weapon canuseattachment(var_c2d75e1eaa5db67a)) {
            attachments = array_remove(attachments, var_be53b174c615d624);
            attachments = array_add(attachments, var_c2d75e1eaa5db67a);
            attachmentids[var_c2d75e1eaa5db67a] = 0;
        }
        if (usedlevel > 1) {
            var_c6813356cbede5a1 = var_c2d75e1eaa5db67a + usedlevel;
            if (weapon canuseattachment(var_c6813356cbede5a1)) {
                attachments = array_remove(attachments, var_c2d75e1eaa5db67a);
                attachments = array_add(attachments, var_c6813356cbede5a1);
                attachmentids[var_c6813356cbede5a1] = 0;
            }
        }
    }
    return [attachments, attachmentids];
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3276
// Size: 0x200
function function_8a514af6a4020(weapon) {
    new_weapon = undefined;
    if (isdefined(level.weaponmetadata) && isdefined(weapon.var_9d7facbe889e667c) && isdefined(level.weaponmetadata[weapon.var_9d7facbe889e667c]) && isdefined(level.weaponmetadata[weapon.var_9d7facbe889e667c].var_9e1e9ec0fd561685)) {
        var_60616b825c1aaaec = level.weaponmetadata[weapon.var_9d7facbe889e667c].var_9e1e9ec0fd561685;
        if (weapon hasattachment(var_60616b825c1aaaec)) {
            new_weapon = weapon withoutattachment(var_60616b825c1aaaec);
        }
    }
    if (isdefined(level.pap_camos) && isdefined(weapon.camo) && weapon.camo != "none") {
        foreach (camostruct in level.pap_camos) {
            if (weapon.camo == camostruct.camo) {
                if (isdefined(new_weapon)) {
                    new_weapon = new_weapon withoutcamo();
                } else {
                    new_weapon = weapon withoutcamo();
                }
                break;
            }
        }
    }
    if (isdefined(self.var_c37e65eb7cc773eb)) {
        var_2912941440454da4 = self.var_c37e65eb7cc773eb[weapon.var_9d7facbe889e667c];
        if (isdefined(var_2912941440454da4)) {
            if (isdefined(new_weapon)) {
                new_weapon = new_weapon withcamo(var_2912941440454da4);
            } else {
                new_weapon = weapon withcamo(var_2912941440454da4);
            }
            self.var_c37e65eb7cc773eb[weapon.var_9d7facbe889e667c] = undefined;
        }
    }
    if (isdefined(new_weapon)) {
        self takeweapon(weapon);
        self giveweapon(new_weapon);
        self switchtoweapon(new_weapon);
        function_2756cd1449650568(new_weapon, undefined);
        self notify("weapon_level_changed");
        self setclientomnvar("ui_pap_current_level", 0);
    }
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x347e
// Size: 0x51
function can_pap(weapon) {
    if (!isdefined(weapon)) {
        weapon = self getcurrentweapon();
    }
    if (!isdefined(level.var_74cdac95bea43e20[weapon.var_9d7facbe889e667c])) {
        return false;
    }
    var_3cf65499b595d11b = get_pap_level(weapon);
    if (var_3cf65499b595d11b < 3) {
        return true;
    }
    return false;
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34d8
// Size: 0xb3
function function_6cea50c31fdfd0b9(menuitemindex) {
    var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
    item = purchasemenu::function_904f24ea774b8f6f(var_2fcb35d230365682.ref, menuitemindex);
    cost = 0;
    currency = "essence";
    if (isdefined(item)) {
        cost = item.cost;
        currency = item.currency;
        if (scripts\mp\utility\perk::_hasperk("specialty_exfil_pap_percent_reward")) {
            cost = int(cost * level.perkbundles["specialty_exfil_pap_percent_reward"].var_7091af12e157769c);
        }
    }
    return namespace_7dfc6454a70f3f39::function_bcc79745d547a99c(currency, cost);
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3594
// Size: 0x1ad
function function_e1fa842581ec1de5(s_pap) {
    self notify("opened_pap_menu");
    self endon("opened_pap_menu");
    self endon("disconnect");
    var_2fcb35d230365682 = function_8ffd6120b9e72251(self.origin);
    machine = s_pap.mdl_pap;
    wait 0.75;
    var_cad20162f5a22ba4 = distance2d(machine.origin, self.origin);
    v_start = self.origin;
    var_85e549a4bd66c511 = utility::function_2e9e02e8bda61ef2();
    var_a8b5d0f96d82b5b3 = utility::function_2e9e02e8bda61ef2();
    var_4e92a6b7c0ecead5 = isdefined(var_85e549a4bd66c511) && isdefined(var_a8b5d0f96d82b5b3);
    while (isdefined(machine) && isalive(self) && !istrue(self.inlaststand) && !istrue(namespace_e0ee43ef2dddadaa::iskillstreakweapon(self getcurrentweapon()))) {
        if (!isdefined(machine) || self stancebuttonpressed()) {
            break;
        }
        if (!var_4e92a6b7c0ecead5) {
            if (!(distance2d(machine.origin, self.origin) <= var_cad20162f5a22ba4 || distance2d(self.origin, machine.origin) < 64)) {
                break;
            }
        }
        if (istrue(self.var_5070f05815274d88)) {
            break;
        }
        waitframe();
    }
    if (isdefined(self)) {
        self.var_5070f05815274d88 = undefined;
        self setclientomnvar(var_2fcb35d230365682.var_8b8931f97eef184, 2);
        self setclientomnvar(var_2fcb35d230365682.var_fd0ea8a834fa0398, gettime());
        function_997e20f4d9f30586(0);
        self.s_pap_machine = undefined;
        self notify("end_open_pap_menu");
    }
}

// Namespace pack_a_punch / namespace_a4ff02beedc1bce8
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3749
// Size: 0xae
function private function_997e20f4d9f30586(var_87026d0546b5bf78) {
    if (var_87026d0546b5bf78) {
        val::set("using_pap", "melee", 0);
        val::set("using_pap", "killstreaks", 0);
        val::set("using_pap", "crate_use", 0);
        val::set("using_pap", "equipment_primary", 0);
        val::set("using_pap", "equipment_secondary", 0);
        val::set("using_pap", "offhand_weapons", 0);
        val::set("using_pap", "offhand_throwback", 0);
        val::set("using_pap", "weapon_switch", 0);
        return;
    }
    val::reset_all("using_pap");
}

/#

    // Namespace pack_a_punch / namespace_a4ff02beedc1bce8
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x37ff
    // Size: 0x327
    function private function_48d69eea9b7ed244() {
        var_39239d1f90650b = (0, 0, 4);
        var_e33953429ed350f = 0.25;
        while (true) {
            foreach (s_pap in level.var_28967913115d1fa3) {
                if (!isdefined(s_pap.mdl_pap)) {
                    continue;
                }
                if (!isdefined(s_pap.s_destination)) {
                    if (isdefined(s_pap.str_destination)) {
                        s_pap.s_destination = getstruct(s_pap.str_destination, "<dev string:x322>");
                    } else {
                        s_pap.str_destination = s_pap.name;
                        s_pap.s_destination = s_pap;
                    }
                }
                v_position = s_pap.mdl_pap.origin;
                line(v_position, s_pap.s_destination.origin, (0, 1, 0));
                draw_circle(v_position, 100, (0, 0, 1), 1, 0, 1);
                print3d(s_pap.s_destination.origin, "<dev string:x330>" + s_pap.str_destination, (0, 1, 0), 1, 0.25);
                print3d(v_position - var_39239d1f90650b * 1, "<dev string:x345>" + s_pap.name, (0, 1, 0), 1, 0.25);
                print3d(v_position - var_39239d1f90650b * 2, "<dev string:x353>" + default_to(s_pap.script_power, "<dev string:x363>"), (0, 1, 0), 1, 0.25);
                print3d(v_position - var_39239d1f90650b * 3, "<dev string:x367>" + ter_op(istrue(s_pap.var_cd756b37f6f0e181), "<dev string:x37a>", "<dev string:x381>"), (0, 1, 0), 1, 0.25);
                print3d(v_position - var_39239d1f90650b * 4, "<dev string:x387>" + s_pap.str_destination, (0, 1, 0), 1, 0.25);
                foreach (player in level.players) {
                    if (isdefined(player.s_pap_machine)) {
                        print3d(player.origin, player.name + "<dev string:x398>" + player.s_pap_machine.name, (0, 1, 0), 1, 0.25);
                    }
                }
            }
            waitframe();
        }
    }

#/
