#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\engine\throttle.gsc;
#using scripts\common\devgui.gsc;
#using scripts\mp\supers.gsc;
#using script_38db8bccc9eb301f;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\engine\trace.gsc;
#using script_686729055b66c6e4;

#namespace namespace_5908209abe7c5e93;

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x529
// Size: 0x1dc
function init() {
    scripts\mp\supers::function_53110a12409d01da("super_tesla_storm", undefined, undefined, &function_eaafe219c8e1fa28, &function_e31e11062aaa65ac, undefined);
    level.var_7bfa3c5f73da5baf = throttle_initialize("super_tesla_storm", 2);
    level.var_cefdddd8f58fdf8e = throttle_initialize("super_tesla_storm_fx", 2);
    level.var_d44f0d0578ed449a = [];
    /#
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_a2fe753948998c89("<dev string:x35>", "<dev string:x49>");
        function_a2fe753948998c89("<dev string:x79>", "<dev string:x90>");
        function_a9a864379a098ad6("<dev string:xc4>", "<dev string:xed>", &function_60fccb021222ec4c, 1);
        function_fe953f000498048f();
    #/
    var_560629baa3f0b971 = namespace_e23f629a8349dfaf::function_e7b6474ebd683537("super_tesla_storm", "teslaStormBeamPlayerfx");
    var_93fe9106fec59358 = namespace_e23f629a8349dfaf::function_e7b6474ebd683537("super_tesla_storm", "teslaStormBeamAIfx");
    level._effect["tesla_storm_beam_effect"] = loadfx(default_to(var_560629baa3f0b971, ""));
    level._effect["tesla_storm_beam_ai_effect"] = loadfx(default_to(var_93fe9106fec59358, ""));
    callback::add("on_ai_killed", &on_ai_killed);
    callback::add("on_zombie_ai_damaged", &on_zombie_ai_damaged);
    supertable = getscriptbundle(level.supertable);
    foreach (super in supertable.super_list) {
        if (super.ref == "super_tesla_storm") {
            level.var_f04301db8ca5ecfa["super_tesla_storm"] = getscriptbundle("super:" + super.bundle);
            break;
        }
    }
}

/#

    // Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x70d
    // Size: 0x19a
    function function_60fccb021222ec4c() {
        var_eb5dfd5a5629cdcf = namespace_e23f629a8349dfaf::function_e7b6474ebd683537("<dev string:x103>", "<dev string:x118>");
        var_e1922afab23ca6c6 = namespace_e23f629a8349dfaf::function_e7b6474ebd683537("<dev string:x103>", "<dev string:x12e>");
        while (true) {
            foreach (player in level.players) {
                if (player ent_flag("<dev string:x148>")) {
                    cylinder(player.origin, player.origin + (0, 0, 72), var_eb5dfd5a5629cdcf, (1, 0, 0));
                    continue;
                }
                if (player ent_flag("<dev string:x163>")) {
                    cylinder(player.origin, player.origin + (0, 0, 72), var_eb5dfd5a5629cdcf, (1, 0, 0));
                    cylinder(player.origin, player.origin + (0, 0, 72), var_e1922afab23ca6c6, (0.5, 0, 1));
                    printtoscreen2d(325, 250, "<dev string:x179>" + var_eb5dfd5a5629cdcf, (1, 0, 0), 2);
                    printtoscreen2d(325, 300, "<dev string:x18e>" + var_e1922afab23ca6c6, (0.5, 0, 1), 2);
                }
            }
            waitframe();
        }
    }

#/

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8af
// Size: 0x12
function private on_ai_killed(params) {
    function_1903dd479223c9fb();
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8c9
// Size: 0x136
function private on_zombie_ai_damaged(params) {
    var_b3eb4a96e1ad0e55 = ent_flag("tesla_storm_stunned") && isdefined(params.smeansofdeath) && params.smeansofdeath == "MOD_ELEMENTAL_ELEC";
    var_9e7795a9ae08f88 = isdefined(self.aicategory) && self.aicategory == "normal";
    var_c9cf75a62b586281 = isdefined(self.var_3e84854a738e628d) && isdefined(self.var_7fb81e56992abf97);
    if (var_b3eb4a96e1ad0e55 && var_9e7795a9ae08f88 && var_c9cf75a62b586281 && self.health <= self.maxhealth * 0.3 && percent_chance(50)) {
        if (!self [[ self.var_7fb81e56992abf97 ]]()) {
            var_56c7b916ef354784 = params.idamage >= self.health;
            if (self getscriptablehaspart("shocked_tesla_storm") && self getscriptableparthasstate("shocked_tesla_storm", "shocked_tesla_storm_on_headless")) {
                self [[ self.var_3e84854a738e628d ]](var_56c7b916ef354784);
                utility::function_3677f2be30fdd581("shocked_tesla_storm", "shocked_tesla_storm_on_headless");
            }
        }
    }
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa07
// Size: 0xa3
function function_eaafe219c8e1fa28() {
    if (isdefined(level.var_f04301db8ca5ecfa["super_tesla_storm"])) {
        var_ec828c6c57ea3295 = level.var_f04301db8ca5ecfa["super_tesla_storm"].offhandweapon;
        deploysuccess = namespace_e23f629a8349dfaf::function_75abcff430ed00b7(var_ec828c6c57ea3295);
        if (deploysuccess) {
            self setscriptablepartstate("wand_fx", "wand_on_tesla_storm", 0);
            var_eb5dfd5a5629cdcf = namespace_e23f629a8349dfaf::function_e7b6474ebd683537("super_tesla_storm", "teslaStormAIRadius");
            var_e1922afab23ca6c6 = namespace_e23f629a8349dfaf::function_e7b6474ebd683537("super_tesla_storm", "teslaStormPlayerRadius");
            thread tesla_storm_active(var_e1922afab23ca6c6, var_eb5dfd5a5629cdcf);
            return true;
        }
    }
    return false;
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xab3
// Size: 0x34
function function_e31e11062aaa65ac(fromdeath, attacker) {
    self notify("end_tesla_storm");
    ent_flag_clear("field_upgrade_in_use");
    ent_flag_clear("tesla_storm_active");
    return false;
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaf0
// Size: 0x166
function tesla_storm_active(var_61b130868b617cf5, var_8817869a853f24fe) {
    self endon("disconnect");
    ent_flag_init("field_upgrade_in_use");
    ent_flag_set("field_upgrade_in_use");
    ent_flag_init("tesla_storm_active");
    ent_flag_set("tesla_storm_active");
    n_duration = level.superglobals.staticsuperdata["super_tesla_storm"].usetime;
    thread function_aa9d24b8ec786896(n_duration);
    function_f38c399e832aae26(self);
    while (function_ad4e767f4485c481() && n_duration > 0) {
        foreach (player in level.players) {
            if (player == self || player ent_flag("tesla_storm_active") || player function_70ff86b1940a1125(self)) {
                continue;
            }
            if (function_22bb60afafe8a645(player, var_61b130868b617cf5)) {
                thread function_e6276fcf3e3cc1e(player, var_61b130868b617cf5, var_8817869a853f24fe);
            }
        }
        function_307d7e90b63d7031(var_8817869a853f24fe, var_61b130868b617cf5);
        n_duration -= level.framedurationseconds;
        waitframe();
    }
    if (isdefined(self)) {
        function_9165b55668d825eb(self);
        thread function_db47c95690861424();
        ent_flag_clear("field_upgrade_in_use");
        ent_flag_clear("tesla_storm_active");
    }
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc5e
// Size: 0x88
function function_e6276fcf3e3cc1e(player, var_61b130868b617cf5, var_8817869a853f24fe) {
    player notify("end_tesla_storm_buff");
    player endon("end_tesla_storm_buff");
    player ent_flag_set("tesla_storm_buff_active");
    player thread function_a292ce93f7775a6e(self);
    player function_f38c399e832aae26(self);
    while (function_22bb60afafe8a645(player, var_61b130868b617cf5)) {
        player function_307d7e90b63d7031(var_8817869a853f24fe, var_61b130868b617cf5);
        waitframe();
    }
    if (isdefined(player)) {
        player function_9165b55668d825eb(self);
        player ent_flag_clear("tesla_storm_buff_active");
        player thread function_318bb16d83ba3f78(self);
    }
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xcee
// Size: 0x54
function private function_f38c399e832aae26(player_source) {
    if (!isdefined(self.var_65097d77b7fff3fb)) {
        self.var_65097d77b7fff3fb = [];
    }
    self.var_65097d77b7fff3fb = array_removeundefined(self.var_65097d77b7fff3fb);
    self.var_65097d77b7fff3fb = array_insert(self.var_65097d77b7fff3fb, player_source, 0);
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd4a
// Size: 0x53
function private function_9165b55668d825eb(player_source) {
    if (!isdefined(self.var_65097d77b7fff3fb)) {
        self.var_65097d77b7fff3fb = [];
    }
    self.var_65097d77b7fff3fb = array_removeundefined(self.var_65097d77b7fff3fb);
    self.var_65097d77b7fff3fb = array_remove(self.var_65097d77b7fff3fb, player_source);
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xda5
// Size: 0x4a
function private function_70ff86b1940a1125(player_source) {
    if (!isdefined(self.var_65097d77b7fff3fb)) {
        self.var_65097d77b7fff3fb = [];
    }
    self.var_65097d77b7fff3fb = array_removeundefined(self.var_65097d77b7fff3fb);
    return array_contains(self.var_65097d77b7fff3fb, player_source);
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdf8
// Size: 0x58
function function_ad4e767f4485c481(var_26f2ac018b0958b0) {
    if (!isdefined(var_26f2ac018b0958b0)) {
        var_26f2ac018b0958b0 = 0;
    }
    if (isalive(self) && !scripts\cp_mp\utility\player_utility::isinvehicle() && !scripts\mp\utility\player::isinlaststand(self)) {
        if (ent_flag("tesla_storm_active") || var_26f2ac018b0958b0 && ent_flag("tesla_storm_buff_active")) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe59
// Size: 0x10f
function function_22bb60afafe8a645(player, var_61b130868b617cf5) {
    if (!isdefined(player) || !isdefined(self)) {
        return false;
    }
    var_8efc437d85d0c4ac = ent_flag("tesla_storm_active");
    var_1fe36ca441b8efc3 = !isalive(self) || !isalive(player);
    var_e187658a8524adb5 = scripts\cp_mp\utility\player_utility::isinvehicle() || player scripts\cp_mp\utility\player_utility::isinvehicle();
    var_306adad59fdbff59 = scripts\mp\utility\player::isinlaststand(self) || player scripts\mp\utility\player::isinlaststand(player);
    if (var_8efc437d85d0c4ac && !var_1fe36ca441b8efc3 && !var_e187658a8524adb5 && !var_306adad59fdbff59) {
        var_b31fb2da4f8b0ec0 = self gettagorigin("j_spineupper");
        var_b31fb5da4f8b1559 = player gettagorigin("j_spineupper");
        b_player_in_range = distancesquared(var_b31fb2da4f8b0ec0, var_b31fb5da4f8b1559) < var_61b130868b617cf5 * var_61b130868b617cf5;
        if (b_player_in_range) {
            contents = scripts\engine\trace::create_solid_ai_contents(1);
            if (scripts\engine\trace::ray_trace_passed(var_b31fb2da4f8b0ec0, var_b31fb5da4f8b1559, player, contents)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xf71
// Size: 0x27c
function function_b87dece1e881ebd4(ai, player_source, var_8817869a853f24fe, var_61b130868b617cf5) {
    if (!isdefined(self) || !isdefined(self)) {
        return false;
    }
    var_29a9b9c7b2aa49ae = self.team != ai.team;
    var_8efc437d85d0c4ac = ent_flag("tesla_storm_active") || ent_flag("tesla_storm_buff_active");
    var_3b4a9e3620ff652d = !isalive(self) || !isalive(ai);
    var_3321660450f67a3 = is_equal(ai.type, "zombie") || is_equal(ai.unittype, "soldier");
    var_f1fab5121c5e72a2 = ai ent_flag("tesla_storm_stunned");
    if (!var_f1fab5121c5e72a2 && var_29a9b9c7b2aa49ae && var_8efc437d85d0c4ac && !var_3b4a9e3620ff652d && var_3321660450f67a3 && function_ad4e767f4485c481(1)) {
        var_b31fb2da4f8b0ec0 = self gettagorigin("j_spineupper");
        var_b31fb5da4f8b1559 = ai gettagorigin(ai function_a55cde442b9c8e8e());
        b_in_range = distancesquared(var_b31fb2da4f8b0ec0, var_b31fb5da4f8b1559) <= var_8817869a853f24fe * var_8817869a853f24fe;
        contents = scripts\engine\trace::create_solid_ai_contents(1);
        if (b_in_range && scripts\engine\trace::ray_trace_passed(var_b31fb2da4f8b0ec0, var_b31fb5da4f8b1559, ai, contents)) {
            return true;
        }
    }
    if (player_source ent_flag("tesla_storm_active") && !player_source ent_flag("tesla_storm_buff_active")) {
        var_9907d14293e5472f = get_array_of_closest(player_source.origin, level.players, undefined, undefined, var_61b130868b617cf5);
        foreach (player_buff in var_9907d14293e5472f) {
            if (player_buff == player_source || !player_buff ent_flag("tesla_storm_buff_active")) {
                continue;
            }
            v_start_pos = player_source gettagorigin("j_spineupper");
            v_end_pos = player_buff gettagorigin("j_spineupper");
            v_enemy = ai gettagorigin(ai function_a55cde442b9c8e8e());
            if (math::segmentvssphere(v_start_pos, v_end_pos, v_enemy, 25)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11f6
// Size: 0x144
function function_307d7e90b63d7031(var_8817869a853f24fe, var_61b130868b617cf5) {
    a_enemies = getaiarrayinradius(self.origin, var_61b130868b617cf5);
    foreach (ai in a_enemies) {
        if (function_b87dece1e881ebd4(ai, self, var_8817869a853f24fe, var_61b130868b617cf5)) {
            ai thread function_2bc9a9876c907913(self.var_65097d77b7fff3fb[0]);
            var_4e2166efa43cd4bb = get_array_of_closest(ai.origin, a_enemies, undefined, undefined, var_61b130868b617cf5);
            foreach (ai_closest in var_4e2166efa43cd4bb) {
                if (ai == ai_closest || !isalive(ai_closest)) {
                    continue;
                }
                if (ai_closest ent_flag("tesla_storm_stunned")) {
                    if (!isdefined(ai.var_848e4d039d397c94)) {
                        ai function_4a2690ec43d8b180(ai_closest);
                        break;
                    }
                    continue;
                }
                ai_closest function_1903dd479223c9fb();
            }
        }
    }
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1342
// Size: 0x607
function function_2bc9a9876c907913(player_source) {
    self endon("death");
    if (!isdefined(level.superglobals.staticsuperdata["super_tesla_storm"].var_1c581f6024dba939)) {
        level.superglobals.staticsuperdata["super_tesla_storm"].var_1c581f6024dba939 = default_to(namespace_e23f629a8349dfaf::function_e7b6474ebd683537("super_tesla_storm", "teslaStormDamagePctNormal"), 0);
    }
    if (!isdefined(level.superglobals.staticsuperdata["super_tesla_storm"].var_a910712b81495e1)) {
        level.superglobals.staticsuperdata["super_tesla_storm"].var_a910712b81495e1 = default_to(namespace_e23f629a8349dfaf::function_e7b6474ebd683537("super_tesla_storm", "teslaStormDamagePctSpecial"), 0);
    }
    if (!isdefined(level.superglobals.staticsuperdata["super_tesla_storm"].var_6e60f2dbdd5d2e1)) {
        level.superglobals.staticsuperdata["super_tesla_storm"].var_6e60f2dbdd5d2e1 = default_to(namespace_e23f629a8349dfaf::function_e7b6474ebd683537("super_tesla_storm", "teslaStormDamagePctElite"), 0);
    }
    if (!isdefined(level.superglobals.staticsuperdata["super_tesla_storm"].var_3f0ce078ff232b3)) {
        level.superglobals.staticsuperdata["super_tesla_storm"].var_3f0ce078ff232b3 = default_to(namespace_e23f629a8349dfaf::function_e7b6474ebd683537("super_tesla_storm", "teslaStormDamagePctBoss"), 0);
    }
    var_a0bdbc30358765b1 = self.maxhealth * level.superglobals.staticsuperdata["super_tesla_storm"].var_1c581f6024dba939;
    var_a60b455c583001b6 = 0;
    var_56a913a32aa54cf5 = 1;
    if (isdefined(self.aicategory)) {
        switch (self.aicategory) {
        case #"hash_84fcf5e68d7230b2":
            var_a0bdbc30358765b1 = self.maxhealth * level.superglobals.staticsuperdata["super_tesla_storm"].var_1c581f6024dba939;
            var_a60b455c583001b6 = 1;
            break;
        case #"hash_8c089e813083e510":
            var_a0bdbc30358765b1 = self.maxhealth * level.superglobals.staticsuperdata["super_tesla_storm"].var_a910712b81495e1;
            var_a60b455c583001b6 = 0;
            break;
        case #"hash_7b0e2f2ed84f34":
            var_a0bdbc30358765b1 = self.maxhealth * level.superglobals.staticsuperdata["super_tesla_storm"].var_6e60f2dbdd5d2e1;
            var_a60b455c583001b6 = 0;
            break;
        case #"hash_7e8a002ed096276c":
            var_a0bdbc30358765b1 = self.maxhealth * level.superglobals.staticsuperdata["super_tesla_storm"].var_3f0ce078ff232b3;
            var_a60b455c583001b6 = 0;
            break;
        }
    }
    if (isdefined(var_a0bdbc30358765b1) && isalive(player_source)) {
        if (var_a0bdbc30358765b1 > 0) {
            ent_flag_set("tesla_storm_stunned");
            function_f632348cbb773537(level.var_7bfa3c5f73da5baf, self);
            if (var_a60b455c583001b6) {
                namespace_ed7c38f3847343dc::function_2e4d3c67e63f83ac(var_56a913a32aa54cf5);
            }
        }
        var_c06695a5e6f3cd3b = is_equal(self.unittype, "soldier");
        sweapon = "none";
        if (isdefined(level.weaponmetadata[%"tesla_storm"])) {
            if (!isdefined(level.weaponmetadata[%"tesla_storm"].weaponobj)) {
                sweapon = makeweapon(level.weaponmetadata[%"tesla_storm"].weapon);
                level.weaponmetadata[%"tesla_storm"].weaponobj = sweapon;
            } else {
                sweapon = level.weaponmetadata[%"tesla_storm"].weaponobj;
            }
        }
        if (var_c06695a5e6f3cd3b) {
            var_56a913a32aa54cf5 = 0.2;
            firstshock = gettime() > self._blackboard.var_dc51d4ea36da3ae1 + function_a5b14435e3229bed(1);
            self._blackboard.var_dc51d4ea36da3ae1 = gettime();
            if (self asmhaspainstate(self.asmname) && firstshock) {
                self asmevalpaintransition(self.asmname);
            }
            if (isdefined(self.subclass) && issubstr(self.subclass, "warlord")) {
                var_a0bdbc30358765b1 = self.maxhealth * level.superglobals.staticsuperdata["super_tesla_storm"].var_6e60f2dbdd5d2e1;
            }
            var_a0bdbc30358765b1 = int(var_a0bdbc30358765b1 / 5);
        }
        self dodamage(var_a0bdbc30358765b1, self gettagorigin(function_a55cde442b9c8e8e()), player_source, player_source, "MOD_ELEMENTAL_ELEC", sweapon, "torso_upper", undefined, 65536);
        params = {#sweapon:sweapon, #eattacker:player_source, #damage:var_a0bdbc30358765b1};
        callback::callback("on_tesla_storm_stunned", params);
        if (var_a0bdbc30358765b1 > 0) {
            if (var_c06695a5e6f3cd3b) {
                utility::function_3677f2be30fdd581("shockStickVfx", "vfx_start");
                self.ishaywire = 1;
            } else if (isdefined(self.var_7fb81e56992abf97) && self [[ self.var_7fb81e56992abf97 ]]()) {
                utility::function_3677f2be30fdd581("shocked_tesla_storm", "shocked_tesla_storm_on_headless");
            } else {
                utility::function_3677f2be30fdd581("shocked_tesla_storm", "shocked_tesla_storm_on");
            }
            wait var_56a913a32aa54cf5;
            if (var_c06695a5e6f3cd3b) {
                utility::function_3677f2be30fdd581("shockStickVfx", "off");
                self.ishaywire = undefined;
            } else {
                utility::function_3677f2be30fdd581("shocked_tesla_storm", "shocked_tesla_storm_off");
            }
        }
    }
    ent_flag_clear("tesla_storm_stunned");
    function_1903dd479223c9fb();
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1951
// Size: 0x41
function function_a55cde442b9c8e8e() {
    str_tag = "tag_origin";
    if (self tagexists("j_spineupper")) {
        str_tag = "j_spineupper";
    } else if (self tagexists("j_spine4")) {
        str_tag = "j_spine4";
    }
    return str_tag;
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x199b
// Size: 0x2d
function function_aa9d24b8ec786896(n_duration) {
    self endon("death_or_disconnect");
    thread function_ded4364d70ee2403(n_duration);
    self setscriptablepartstate("tesla_storm_source_fx", "super_fx_on", 0);
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19d0
// Size: 0x2c
function function_a292ce93f7775a6e(player_source) {
    self endon("death_or_disconnect");
    self setscriptablepartstate("tesla_storm_teammate_fx", "super_fx_on", 0);
    function_4a2690ec43d8b180(player_source);
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a04
// Size: 0x4c
function function_ded4364d70ee2403(n_duration) {
    if (!isdefined(n_duration)) {
        return;
    }
    self endon("death_or_disconnect");
    self notify("applyFOVPresentation");
    self endon("applyFOVPresentation");
    self lerpfovbypreset("zombiedefault");
    waittill_any_timeout_no_endon_death_1(n_duration, "super_use_finished");
    self lerpfovbypreset("default_2seconds");
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a58
// Size: 0x1b
function function_db47c95690861424() {
    self endon("disconnect");
    self setscriptablepartstate("tesla_storm_source_fx", "super_fx_deactivate", 0);
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a7b
// Size: 0x2b
function function_318bb16d83ba3f78(player_source) {
    self endon("disconnect");
    function_1903dd479223c9fb();
    self setscriptablepartstate("tesla_storm_teammate_fx", "super_fx_deactivate", 0);
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1aae
// Size: 0xc4
function function_4a2690ec43d8b180(e_target) {
    if (!isdefined(self.var_848e4d039d397c94)) {
        if (isplayer(self)) {
            self.var_848e4d039d397c94 = playfxontagsbetweenclients(getfx("tesla_storm_beam_effect"), self, "j_spineupper", e_target, "j_spineupper");
            return;
        }
        if (isai(self) && level.var_d44f0d0578ed449a.size < 8) {
            self.var_848e4d039d397c94 = playfxontagsbetweenclients(getfx("tesla_storm_beam_ai_effect"), self, function_a55cde442b9c8e8e(), e_target, e_target function_a55cde442b9c8e8e());
            level.var_d44f0d0578ed449a = array_removeundefined(level.var_d44f0d0578ed449a);
            level.var_d44f0d0578ed449a = array_add(level.var_d44f0d0578ed449a, self.var_848e4d039d397c94);
        }
    }
}

// Namespace namespace_5908209abe7c5e93 / namespace_771aa7cc1ddd631
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b7a
// Size: 0x48
function function_1903dd479223c9fb() {
    if (isdefined(self.var_848e4d039d397c94)) {
        if (isai(self)) {
            level.var_d44f0d0578ed449a = array_remove(level.var_d44f0d0578ed449a, self.var_848e4d039d397c94);
        }
        self.var_848e4d039d397c94 delete();
    }
}

