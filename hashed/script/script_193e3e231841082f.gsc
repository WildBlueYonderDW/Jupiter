// mwiii decomp prototype
#using scripts\engine\trace.gsc;
#using scripts\engine\throttle.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using script_429c2a03090c1ea1;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\engine\math.gsc;
#using script_7edf952f8921aa6b;
#using scripts\common\values.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\asm\asm.gsc;
#using script_19c169a442d5975a;
#using script_bd0d3e8f9ff5c11;
#using script_52f2d330c7a21cb6;

#namespace zombie_deathworm;

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x595
// Size: 0x18
function function_ccb525d44a15f2b9(params) {
    /#
        level thread function_ab3d258d6bf6aaa7();
    #/
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b4
// Size: 0x141
function function_d526daad5a463daf() {
    self.var_81de213f1930ca23 = [];
    self.var_2cebab130caf24b1 = 0;
    self.var_f42116fb6fbbdebb = undefined;
    self.var_dccee8fd50aac81 = undefined;
    self.var_68e8dc012f0a8a41 = 0;
    self.var_a8507398e666dfbd = throttle::throttle_initialize("worm_unburrow_spot", 1, level.framedurationseconds);
    self.var_464a40f4e8a81fc1 = 2;
    function_7f9eb46a76d2fa8b(1);
    self.var_df44b12ecad5b6d3 = [];
    self.var_7aeae37022a80dc2 = spawn("script_model", self.origin);
    self.var_7aeae37022a80dc2 setmodel(self.zombieaisettings.var_e58a65b7a8f5973c.undergroundmodel);
    self.var_7aeae37022a80dc2 utility::function_3677f2be30fdd581("dust_kickup", "off");
    thread utility::delete_on_death(self.var_7aeae37022a80dc2);
    self.var_2106ea80ca9c0b15 = spawn("script_model", self.origin);
    thread utility::delete_on_death(self.var_2106ea80ca9c0b15);
    callback::add("on_zombie_ai_killed", &on_death);
    asm::asm_setstate("emerge");
    thread function_2723759398817801();
    /#
        function_affdcaeb23533028();
    #/
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fc
// Size: 0x4c
function function_2723759398817801() {
    self endon("death");
    scripts/engine/utility::flag_wait("scriptables_ready");
    waitframe();
    state = asm::asm_getcurrentstate(self.asmname);
    if (state == "emerge") {
        utility::function_3ab9164ef76940fd("audio", "emerge");
    }
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x74f
// Size: 0x13a
function startunderground(asmname, statename, params) {
    /#
        function_8acdeae54b5a9492("swallow_in_air");
    #/
    utility::ent_flag_set("is_underground");
    self setscriptablepartstate("ambient_audio", "off");
    function_3ab9164ef76940fd("base", "off");
    self.var_464a40f4e8a81fc1 = 2;
    if (isai(self.enemy)) {
        self.var_464a40f4e8a81fc1 = 0;
    } else if (isplayer(self.enemy)) {
        self.var_464a40f4e8a81fc1 = 1;
    }
    function_7f9eb46a76d2fa8b(0);
    self.var_2cebab130caf24b1 = gettime();
    self.var_f42116fb6fbbdebb = undefined;
    self.var_dccee8fd50aac81 = undefined;
    self.var_68e8dc012f0a8a41 = 0;
    closest_tacpoint = findclosesttacpoint(self.origin);
    if (isdefined(closest_tacpoint)) {
        self.var_28e5a71792b91a61 = closest_tacpoint.roomindex;
    }
    thread function_945018c01016d9ce();
    thread function_4b0fbbaee39f7489(self.var_7aeae37022a80dc2);
    function_fb98b0b95868ad35();
    thread function_dd196c8614532a7e();
    self invisiblenotsolid();
    self hide();
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x890
// Size: 0x36
function shouldemerge(asmname, statename, tostatename, params) {
    if (utility::ent_flag("can_emerge")) {
        return true;
    }
    return false;
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8ce
// Size: 0x36
function function_4d2b6d209876339b(asmname, statename, tostatename, params) {
    if (utility::ent_flag("can_emerge_attack")) {
        return true;
    }
    return false;
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x90c
// Size: 0x45
function function_c3360a05244c8c0a(asmname, statename, tostatename, params) {
    if (utility::ent_flag("can_emerge_attack") && utility::ent_flag("can_emerge_attack_swallow")) {
        return true;
    }
    return false;
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x959
// Size: 0x158
function startemerge(asmname, statename, params) {
    /#
        function_8acdeae54b5a9492("j_inner_jaw");
    #/
    self.var_81de213f1930ca23 = utility::function_fdc9d5557c53078e(self.var_81de213f1930ca23);
    function_7f9eb46a76d2fa8b(1);
    self visiblenotsolid();
    function_3ab9164ef76940fd("base", "on");
    utility::delaycall(0.5, &visiblesolid);
    self show();
    self.turnrate = getdvarfloat(@"hash_3ee5b89399c33924", 0.2);
    utility::ent_flag_clear("can_emerge");
    utility::ent_flag_clear("can_emerge_attack");
    utility::ent_flag_clear("can_emerge_attack_swallow");
    self notify("start_emerge");
    self.var_7aeae37022a80dc2 utility::ent_flag_clear("is_underground");
    if (isdefined(self.var_7aeae37022a80dc2)) {
        target_location = self.var_7aeae37022a80dc2.origin;
        var_6f4a73407aac16be = target_location - self.origin;
        var_cb570cda36540130 = vectortoyaw(var_6f4a73407aac16be);
        self forceteleport(target_location, (0, var_cb570cda36540130, 0));
    }
    thread function_a6371e9770dd7912();
    thread utility::thread_on_notify("emerge_from_ground", &function_c1ce555e3408ec71, undefined, undefined, self, self, "leave_underground");
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xab8
// Size: 0x108
function leaveunderground(asmname, statename, params) {
    stop_healing();
    self visiblesolid();
    self show();
    utility::ent_flag_clear("can_emerge");
    utility::ent_flag_clear("can_emerge_attack");
    utility::ent_flag_clear("can_emerge_attack_swallow");
    utility::ent_flag_clear("is_underground");
    utility::ent_flag_clear("return_home");
    utility::ent_flag_clear("chase_directly");
    self.var_df44b12ecad5b6d3 = [];
    self.var_aa9ea14cf354838f = self.health / self.maxhealth;
    var_de7821bc51ab43a0 = [[ self.var_8f1d8328f7a9091b ]]();
    cooldown = getdvarint(@"hash_c9e4cfd3227d2cbf", 40000);
    if (var_de7821bc51ab43a0 >= 13) {
        cooldown = int(cooldown * 0.25);
    }
    ai::function_3e5ce428974325fb("burrow_cooldown", cooldown);
    self function_3e89eb3d8e3f1811("in_burrow", 0);
    self notify("leave_underground");
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbc7
// Size: 0x186
function private function_c1ce555e3408ec71() {
    thread utility::thread_on_notify("release_target_from_mouth", &function_432128e123e154c5, undefined, undefined, self, self, "leave_underground");
    state = asm::asm_getcurrentstate(self.asmname);
    if (state == "emerge_attack_swallow") {
        function_3ab9164ef76940fd("audio", "emerge_sharkbite");
    } else if (state == "emerge" || state == "emerge_attack") {
        function_3ab9164ef76940fd("audio", "emerge");
    }
    self setscriptablepartstate("ambient_audio", "ambient_aboveground");
    self.var_7aeae37022a80dc2 setscriptablepartstate("ambient_audio", "off");
    if (isdefined(self.var_2106ea80ca9c0b15)) {
        self.var_2106ea80ca9c0b15 thread liftoff_ent(self);
        thread utility::thread_on_notify("swallow_in_air", &function_ce14c9b1ee64525f, undefined, undefined, self, self, "leave_underground");
    }
    players = function_883458a342af3041(self.origin, 500);
    foreach (player in players) {
        if (distance2dsquared(player.origin, self.origin) > squared(200)) {
            function_ce10f8b3e9257046(player, self.origin);
        }
    }
    /#
        function_8acdeae54b5a9492("base_off");
    #/
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd54
// Size: 0xe2
function private function_432128e123e154c5() {
    foreach (var_9ec3101004a66e6c in self.var_81de213f1930ca23) {
        if (!isalive(var_9ec3101004a66e6c) || utility::is_equal(var_9ec3101004a66e6c.aicategory, "boss")) {
            continue;
        }
        if (!isai(var_9ec3101004a66e6c)) {
            continue;
        }
        if (!utility::is_equal(var_9ec3101004a66e6c.aicategory, "special") && !utility::is_equal(var_9ec3101004a66e6c.aicategory, "elite")) {
            continue;
        }
        var_9ec3101004a66e6c kill(var_9ec3101004a66e6c.origin, self, self, "MOD_MELEE");
    }
    /#
        function_8acdeae54b5a9492("rumble_zombie_deathworm_dust_heavy");
    #/
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3d
// Size: 0x2c2
function function_814d919be8390cd3() {
    if (self.var_81de213f1930ca23.size <= 0) {
        return;
    }
    head_pos = self gettagorigin("j_head");
    aim_pos = self.origin + anglestoforward(self.angles) * getdvarfloat(@"hash_87762a25acc5544a", 1200);
    var_672f4d16501914f3 = 2000;
    var_99e2ea797619de3 = vectornormalize(aim_pos - head_pos);
    var_d30aaa447c4855a4 = 50;
    self visiblenotsolid();
    thread function_84a8667ab38fe6cd();
    b_launched = 0;
    foreach (var_9ec3101004a66e6c in self.var_81de213f1930ca23) {
        if (!isalive(var_9ec3101004a66e6c) || utility::is_equal(var_9ec3101004a66e6c.aicategory, "boss")) {
            continue;
        }
        if (isplayer(var_9ec3101004a66e6c)) {
            var_9ec3101004a66e6c utility::function_3ab9164ef76940fd("deathwormVFX", "spitout");
            var_9ec3101004a66e6c vision_utility::function_9a92ae402e209ecc("zm_jup_death_worm", 0.05);
            var_9ec3101004a66e6c val::reset("ai_worm_grab", "freezecontrols");
            var_9ec3101004a66e6c function_af4b9b0f0e7c6c42(0.2, 1, 1, 1, 1);
            var_9ec3101004a66e6c knockback(var_99e2ea797619de3, var_672f4d16501914f3);
            var_9ec3101004a66e6c showlegs();
            var_9ec3101004a66e6c.var_bdeecf4a8259041c = undefined;
            if (istrue(var_9ec3101004a66e6c.var_77d308e18c6ce14)) {
                var_9ec3101004a66e6c.var_77d308e18c6ce14 = undefined;
                var_9ec3101004a66e6c setcamerathirdperson(1);
            }
            function_624b4095d6b9aa67(var_9ec3101004a66e6c);
            var_9ec3101004a66e6c thread function_18b9e51f238bd95a(var_9ec3101004a66e6c, self);
            var_9ec3101004a66e6c skydive_interrupt();
        } else if (isai(var_9ec3101004a66e6c)) {
            if (isdefined(var_9ec3101004a66e6c.var_8998b4ac2687fb35)) {
                var_9ec3101004a66e6c unlink();
                var_9ec3101004a66e6c [[ var_9ec3101004a66e6c.var_8998b4ac2687fb35 ]](aim_pos, 7500);
            } else {
                var_9ec3101004a66e6c kill(var_9ec3101004a66e6c.origin, self, self, "MOD_MELEE");
                corpse = var_9ec3101004a66e6c getcorpseentity();
                if (isdefined(corpse)) {
                    corpse startragdollfromimpact("torso_lower", anglestoforward(self.angles) * var_672f4d16501914f3 * var_d30aaa447c4855a4);
                }
            }
        }
        b_launched = 1;
        var_9ec3101004a66e6c utility::ent_flag_clear("in_worm_mouth");
        self.var_81de213f1930ca23 = utility::array_remove(self.var_81de213f1930ca23, var_9ec3101004a66e6c);
        /#
            if (function_1ec53e871d501656()) {
                function_8acdeae54b5a9492("<unknown string>", aim_pos);
                line(head_pos, aim_pos, (1, 0, 0));
            }
        #/
    }
    if (istrue(b_launched)) {
        function_3677f2be30fdd581("mouth_gibbed", "mouth_gibbed_fire_on");
    }
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1106
// Size: 0x13
function private on_death(params) {
    function_814d919be8390cd3();
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1120
// Size: 0x14
function private function_84a8667ab38fe6cd() {
    self endon("death");
    wait(1);
    self visiblesolid();
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x113b
// Size: 0x2ca
function private function_a6371e9770dd7912() {
    self endon("death");
    self endon("release_target_from_mouth");
    self endon("leave_underground");
    var_9c6db806dd3ca34e = 0.75;
    head_pos = self gettagorigin("tag_fx_mouth");
    grenades = function_b1eef70090b5b7b5(head_pos, 400, function_869ccb4e3451b8c6(["etype_missile"]), []);
    if (isdefined(grenades)) {
        foreach (grenade in grenades) {
            if (isdefined(grenade) && !is_equal(grenade.classname, "rocket")) {
                grenade linkto(self, "j_inner_jaw");
            }
        }
    }
    while (true) {
        head_pos = self gettagorigin("tag_fx_mouth");
        potential_targets = function_143526130b12b2b6(head_pos, 200);
        foreach (target in potential_targets) {
            if (target == self) {
                continue;
            }
            if (target utility::ent_flag("in_worm_mouth")) {
                continue;
            }
            if (isai(target) && distancesquared(target.origin, head_pos) > squared(200 * var_9c6db806dd3ca34e)) {
                /#
                    function_8acdeae54b5a9492("<unknown string>" + target getentitynumber() + "<unknown string>", target.origin + (0, 0, 70));
                #/
                continue;
            }
            if (isplayer(target) && !array_contains(self.var_df44b12ecad5b6d3, target)) {
                if (!target utility::ent_flag("knockback_by_unburrow")) {
                    target utility::ent_flag_set("knockback_by_unburrow");
                    target thread utility::ent_flag_clear_delayed("knockback_by_unburrow", 6);
                    target dodamage(250, head_pos, self, self, "MOD_IMPACT", undefined, undefined, undefined, 65536);
                    target setorigin(target.origin + (0, 0, 50), 1);
                    target knockback((0, 0, 1) + anglestoforward(self.origin) * 0.2, getdvarfloat(@"hash_55af88022caa829b", 1000));
                }
                continue;
            }
            if (isai(target)) {
                function_bea202648c100e56(target, self.origin, 250);
            }
        }
        /#
            if (function_1ec53e871d501656()) {
                sphere(head_pos, 200, (1, 0, 0));
            }
        #/
        waitframe();
    }
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x140c
// Size: 0x10e
function private function_bd315b0ebd63273c(var_59bd8f4656f0af80) {
    players = playersincylinder(var_59bd8f4656f0af80, 200, undefined, 200);
    /#
        if (function_1ec53e871d501656()) {
            cylinder(var_59bd8f4656f0af80, var_59bd8f4656f0af80 + (0, 0, 200), 200);
            sphere(var_59bd8f4656f0af80, 200, (1, 0, 0));
            function_8acdeae54b5a9492("<unknown string>", var_59bd8f4656f0af80);
        }
    #/
    if (players.size <= 0) {
        return [];
    }
    return_players = [];
    foreach (player in players) {
        if (!istrue(self.var_fa1a1806d30a40e1) && isdefined(player.armorhealth) && player.armorhealth > 0) {
            continue;
        }
        if (player.health <= 250) {
            return_players[return_players.size] = player;
        }
    }
    return return_players;
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1522
// Size: 0x169
function private function_ce14c9b1ee64525f() {
    if (isdefined(self.var_2106ea80ca9c0b15) && isdefined(self.var_2106ea80ca9c0b15.players)) {
        foreach (target in self.var_2106ea80ca9c0b15.players) {
            target val::set("ai_worm_grab", "freezecontrols");
            target dodamage(30, self.origin, self, self, "MOD_IMPACT", undefined, undefined, undefined, 65536);
            swallowed = function_bea202648c100e56(target, self.origin, 250);
            if (!swallowed) {
                target unlink();
                target setorigin(target.origin + (0, 0, 50), 1);
                target knockback((0, 0, 1), getdvarfloat(@"hash_55af88022caa829b", 1000));
                target val::reset("ai_worm_grab", "freezecontrols");
                target dodamage(250, self.origin, self, self, "MOD_IMPACT", undefined, undefined, undefined, 65536);
            }
        }
        self.var_2106ea80ca9c0b15.players = [];
    }
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1692
// Size: 0x3cb
function private liftoff_ent(worm) {
    self endon("death");
    self notify("liftoff_ent");
    self endon("liftoff_ent");
    worm endon("swallow_in_air");
    player = undefined;
    self.angles = (0, 0, 0);
    foreach (target in worm.var_df44b12ecad5b6d3) {
        if (!target utility::ent_flag("damaged_by_unburrow")) {
            target utility::ent_flag_set("damaged_by_unburrow");
            target thread utility::ent_flag_clear_delayed("damaged_by_unburrow", 6);
            if (isdefined(worm.var_2106ea80ca9c0b15)) {
                if (!isdefined(worm.var_2106ea80ca9c0b15.players)) {
                    worm.var_2106ea80ca9c0b15.players = [];
                }
                worm.var_2106ea80ca9c0b15.players[worm.var_2106ea80ca9c0b15.players.size] = target;
                target skydive_beginfreefall();
                target skydive_setdeploymentstatus(0);
                target playsoundevent("sndevent_death_worm_swallow_hit_plr");
                self.angles = (90, target.angles[1], 0);
                target playerlinktoblend(worm.var_2106ea80ca9c0b15, undefined, 1.1, 0.2, 0.2, 0, 1);
                target val::set("ai_worm_grab", "freezecontrols");
            }
            if (target.armorhealth > 0) {
                target dodamage(250, worm.origin, worm, worm, "MOD_IMPACT", undefined, undefined, undefined, 65536);
            }
            target dodamage(1, worm.origin, worm, worm, "MOD_IMPACT");
        }
        player = target;
    }
    start_pos = worm gettagorigin("tag_fx_mouth");
    start_pos = start_pos + anglestoforward(worm.angles) * getdvarfloat(@"hash_145e04bf9bf831c", 190);
    self.origin = start_pos;
    var_c7a18a7dc266d872 = getdvarfloat(@"hash_7880d7d53a7c6738", 3250) * level.framedurationseconds;
    up_speed = var_c7a18a7dc266d872;
    vertical_slowdown = getdvarfloat(@"hash_9d41e6f6c42ede2c", 150) * level.framedurationseconds;
    var_9cc57e7e41fdec35 = 0;
    while (true) {
        self.origin = self.origin + (0, 0, up_speed);
        self.angles = (self.angles[0], function_804deea7a479c83b(self.angles[1], worm.angles[1] + 180, 90 * level.framedurationseconds), self.angles[2]);
        up_speed = up_speed - vertical_slowdown;
        if (!var_9cc57e7e41fdec35 && up_speed < 0) {
            var_9cc57e7e41fdec35 = 1;
            foreach (target in worm.var_df44b12ecad5b6d3) {
                target unlink();
                target val::set("ai_worm_grab", "freezecontrols", 1);
            }
        }
        /#
            function_8acdeae54b5a9492("<unknown string>", self.origin);
            sphere(self.origin, 10, (1, 0, 0));
        #/
        waitframe();
    }
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a64
// Size: 0x213
function function_bea202648c100e56(target, head_pos, damage) {
    swallowed = 0;
    if (isplayer(target)) {
        if (target.health <= damage && target.armorhealth <= 0 && !target islinked()) {
            swallowed = 1;
        }
    } else if (isai(target)) {
        if (!target.damageshield) {
            swallowed = 1;
        }
    }
    if (swallowed) {
        target utility::ent_flag_set("in_worm_mouth");
        self.var_81de213f1930ca23 = utility::array_add(self.var_81de213f1930ca23, target);
        function_3ab9164ef76940fd("mouth_gibbed", "mouth_gibbed_on");
        if (isplayer(target)) {
            player_vehicle = target function_f3bb4f4911a1beb2("vehicle", "getVehicle");
            if (isdefined(player_vehicle)) {
                seatid = target function_f3bb4f4911a1beb2("vehicle", "vehicle_occupancy_getOccupantSeat", player_vehicle, target);
                target thread function_f3bb4f4911a1beb2("vehicle", "vehicle_occupancy_exit", player_vehicle, seatid, target, undefined, 1);
            }
            target skydive_interrupt();
            target setstance("crouch", 1, 1);
            target val::set("ai_worm_grab", "freezecontrols", 1);
            target thread function_b68e275f34628faf(self);
            target hidelegs();
            target.var_bdeecf4a8259041c = 1;
            if (target GetCameraThirdPerson()) {
                target.var_77d308e18c6ce14 = 1;
                target setcamerathirdperson(0);
            }
            target utility::function_3ab9164ef76940fd("deathwormVFX", "swallowed");
            target namespace_6c72573a48881070::function_27a921508cb04613("zm_jup_death_worm", 0.05);
            function_624b4095d6b9aa67(target, 1);
        } else if (isai(target)) {
            target linktoblendtotag(self, "j_inner_jaw", 0);
            target utility::function_3ab9164ef76940fd("base", "base_off");
        }
    }
    /#
        function_8acdeae54b5a9492("<unknown string>" + target getentitynumber() + "<unknown string>", target.origin + (0, 0, 70));
    #/
    return swallowed;
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c7f
// Size: 0x51
function private function_b68e275f34628faf(worm) {
    worm endon("death");
    self endon("death");
    wait(0.1);
    up_angle = getdvarfloat(@"hash_4339234d5690eaf8", 20);
    self playerlinkto(worm, "tag_fx_mouth_inner_player", 1, 0, 0, up_angle, -1 * up_angle);
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cd7
// Size: 0xf8
function private function_18b9e51f238bd95a(player, worm) {
    player endon("death");
    worm endon("death");
    var_65180a691a09fa96 = level.var_9039ba619a4ab3e1;
    level.var_9039ba619a4ab3e1 = 0;
    while (isalive(player) && !player isonground()) {
        if (player isparachuting()) {
            player skydive_setdeploymentstatus(1);
            player val::reset("ai_worm_grab", "freezecontrols");
            level.var_9039ba619a4ab3e1 = var_65180a691a09fa96;
            return;
        }
        waitframe();
    }
    if (isalive(player) && player isonground()) {
        function_624b4095d6b9aa67(player);
        if (!istrue(player.inlaststand)) {
            player dodamage(250, worm.origin, worm, worm, "MOD_IMPACT", undefined, undefined, undefined, 65536);
        }
        player skydive_setdeploymentstatus(1);
        player val::reset("ai_worm_grab", "freezecontrols");
    }
    level.var_9039ba619a4ab3e1 = var_65180a691a09fa96;
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1dd6
// Size: 0x53
function private function_624b4095d6b9aa67(player, is_longer) {
    player playrumbleonentity(istrue(is_longer) ? "heavy_3s" : "heavy_1s");
    player earthquakeforplayer(0.5, istrue(is_longer) ? 3 : 1, player.origin, 500);
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e30
// Size: 0x11e
function private function_7f9eb46a76d2fa8b(is_enabled) {
    if (istrue(is_enabled)) {
        utility::ent_flag_set("perfect_awareness");
        self function_65cdab0fc78aba8f(self.origin, 2000);
        self removeaieventlistener("gunshot");
        self removeaieventlistener("footstep_sprint");
        self removeaieventlistener("gunshot_impact");
        self removeaieventlistener("explosion");
        self removeaieventlistener("decoy_grenade");
        /#
            if (function_1ec53e871d501656()) {
                utility::draw_circle(self.origin, 2000, (1, 0, 0), 1, 1, 5);
                function_8acdeae54b5a9492("<unknown string>", function_7b4daaf9179c9cee());
            }
        #/
        return;
    }
    utility::ent_flag_clear("perfect_awareness");
    self function_9322f3cb1cd4111a();
    self clearenemy();
    self addaieventlistener("gunshot");
    self addaieventlistener("footstep_sprint");
    self addaieventlistener("gunshot_impact");
    self addaieventlistener("explosion");
    self addaieventlistener("decoy_grenade");
    /#
        function_8acdeae54b5a9492("<unknown string>", function_7b4daaf9179c9cee());
    #/
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f55
// Size: 0x21d
function private function_80b969fbbf253b0() {
    alive_percentage = [[ self.var_c54a21ea717fe8a5 ]]();
    var_d8670c5c18962430 = isplayer(self.var_f42116fb6fbbdebb) && self.var_f42116fb6fbbdebb issprinting();
    var_af08fb14eca24b3b = isdefined(self.var_f42116fb6fbbdebb) && gettime() < self.var_68e8dc012f0a8a41;
    var_592c0dbe2e253a1a = isplayer(self.var_f42116fb6fbbdebb) && istrue(self.var_fa1a1806d30a40e1) && alive_percentage > 0.5 && self.var_f8adf1aaec88d636 > 3;
    target_pos = undefined;
    var_343e4908d0df33cc = undefined;
    if (isdefined(level.var_e0b07114267e08bb) && level.var_e0b07114267e08bb.size > 0) {
        var_482e60ae80cab949 = utility::getclosest(self.origin, level.var_e0b07114267e08bb);
        if (isdefined(var_482e60ae80cab949) && function_11afde23727cd866(var_482e60ae80cab949.origin)) {
            var_343e4908d0df33cc = var_482e60ae80cab949;
        }
    }
    if (isdefined(var_343e4908d0df33cc)) {
        target_pos = var_343e4908d0df33cc.origin;
        self.var_dccee8fd50aac81 = target_pos;
        /#
            function_8acdeae54b5a9492("<unknown string>", target_pos);
        #/
    } else if (var_d8670c5c18962430 || var_af08fb14eca24b3b || var_592c0dbe2e253a1a) {
        var_1fcc0b320595edf = function_11afde23727cd866(self.var_f42116fb6fbbdebb.origin);
        if (var_1fcc0b320595edf) {
            target_pos = self.var_f42116fb6fbbdebb.origin;
            self.var_dccee8fd50aac81 = target_pos;
            /#
                function_8acdeae54b5a9492("<unknown string>", target_pos);
            #/
        }
    }
    if (!isdefined(target_pos) && isvector(self.var_dccee8fd50aac81)) {
        target_pos = self.var_dccee8fd50aac81;
        /#
            function_8acdeae54b5a9492("<unknown string>", target_pos);
        #/
    }
    if (!isdefined(target_pos)) {
        return undefined;
    }
    var_831198d90cf1bdf4 = getclosestpointonnavmesh(target_pos);
    if (!isdefined(var_831198d90cf1bdf4)) {
        /#
            function_8acdeae54b5a9492("<unknown string>", var_831198d90cf1bdf4);
        #/
        return undefined;
    }
    return var_831198d90cf1bdf4;
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x217a
// Size: 0x373
function private function_945018c01016d9ce() {
    self endon("death");
    while (utility::ent_flag("is_underground")) {
        events = self waittill("ai_events");
        if (utility::ent_flag("ignore_events")) {
            waitframe();
            continue;
        }
        foreach (event in events) {
            if (issentient(event.entity) && (event.entity.ignoreme || event.entity.notarget)) {
                continue;
            }
            chase_pos = event.origin;
            if (event.type == "gunshot_impact") {
                var_cc922509accb4b58 = 2000;
                if (distance2dsquared(event.entity.origin, self.origin) < squared(var_cc922509accb4b58)) {
                    chase_pos = event.entity.origin;
                }
            }
            var_1fcc0b320595edf = function_11afde23727cd866(chase_pos);
            if (!var_1fcc0b320595edf) {
                if (ent_flag("chasing_directly")) {
                    continue;
                }
                throttle::function_f632348cbb773537(self.var_a8507398e666dfbd, self);
                var_febcd74f9b8d2e66 = function_7f1964deaf730144(chase_pos, getdvarfloat(@"hash_5eb7fc0533e937ba", 500), self.var_28e5a71792b91a61, 1);
                /#
                    var_6d9b6150b31df8a = function_972570f45c9b09bc(var_febcd74f9b8d2e66);
                    function_8acdeae54b5a9492("<unknown string>" + var_6d9b6150b31df8a, var_febcd74f9b8d2e66.origin + (0, 0, 40));
                #/
                if (function_1cdd35ae61fe41d3(var_febcd74f9b8d2e66, 1)) {
                    chase_pos = var_febcd74f9b8d2e66.origin;
                } else {
                    chase_pos = function_7b4daaf9179c9cee();
                }
            } else {
                ent_flag_set("chasing_directly");
            }
            if (event.type == "gunshot") {
                function_370709234f11708d(event.entity, undefined, chase_pos);
                /#
                    function_8acdeae54b5a9492("<unknown string>", event.entity.origin);
                #/
                continue;
            }
            if (event.type == "footstep_sprint") {
                function_370709234f11708d(event.entity, getdvarfloat(@"hash_c5c4bd7b0332e15", 500), chase_pos);
                /#
                    function_8acdeae54b5a9492("<unknown string>", event.entity.origin);
                #/
                continue;
            }
            if (event.type == "gunshot_impact") {
                function_8789d22720f0612(chase_pos);
                /#
                    function_8acdeae54b5a9492("<unknown string>", event.origin);
                #/
                continue;
            }
            if (event.type == "explosion") {
                function_8789d22720f0612(chase_pos);
                /#
                    function_8acdeae54b5a9492("<unknown string>", event.origin);
                #/
                continue;
            }
            if (event.type == "decoy_grenade") {
                function_8789d22720f0612(chase_pos);
                /#
                    function_8acdeae54b5a9492("<unknown string>", event.origin);
                #/
            }
        }
    }
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x24f4
// Size: 0x93
function private function_11afde23727cd866(pos) {
    var_1fcc0b320595edf = 1;
    closest_tacpoint = findclosesttacpoint(pos);
    if (isdefined(closest_tacpoint)) {
        dist = distance(pos, closest_tacpoint.origin);
        if (dist < 200) {
            var_1fcc0b320595edf = function_1cdd35ae61fe41d3(closest_tacpoint, 0);
        } else {
            var_1fcc0b320595edf = 1;
        }
    }
    if (var_1fcc0b320595edf) {
        if (function_95d12d803b1f13bb(pos)) {
            var_1fcc0b320595edf = 0;
            /#
                function_8acdeae54b5a9492("<unknown string>", pos + (0, 0, 40));
            #/
        }
    }
    return var_1fcc0b320595edf;
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x258f
// Size: 0x292
function private function_1cdd35ae61fe41d3(tacpoint, var_12b128467439a5b6) {
    var_8289fd24bc653ce6 = 1;
    if (isdefined(self.var_28e5a71792b91a61) && self.var_28e5a71792b91a61 != tacpoint.roomindex) {
        var_8289fd24bc653ce6 = 0;
        /#
            function_8acdeae54b5a9492("<unknown string>", tacpoint.origin + (0, 0, 20));
        #/
    } else {
        tacpoint_exposure = function_972570f45c9b09bc(tacpoint);
        if (tacpoint_exposure < (isdefined(self.zombieaisettings.var_e58a65b7a8f5973c.var_b93d09dcea4e24f5) ? self.zombieaisettings.var_e58a65b7a8f5973c.var_b93d09dcea4e24f5 : 0.5)) {
            var_8289fd24bc653ce6 = 0;
            /#
                function_8acdeae54b5a9492("<unknown string>" + tacpoint_exposure, tacpoint.origin + (0, 0, 20));
            #/
        } else {
            var_e5c33c3e7f358a71 = function_5e2c6953b8312bd6(tacpoint);
            if (var_e5c33c3e7f358a71 <= 300) {
                var_8289fd24bc653ce6 = 0;
                /#
                    function_8acdeae54b5a9492("<unknown string>" + var_e5c33c3e7f358a71, tacpoint.origin + (0, 0, 20));
                #/
            }
        }
    }
    if (var_8289fd24bc653ce6 && istrue(var_12b128467439a5b6)) {
        if (function_95d12d803b1f13bb(tacpoint.origin)) {
            var_8289fd24bc653ce6 = 0;
            /#
                function_8acdeae54b5a9492("<unknown string>", tacpoint.origin + (0, 0, 20));
            #/
        }
    }
    if (var_8289fd24bc653ce6) {
        var_6b7e31b44601a90b = 300;
        drop_height = 100;
        for (angle = 0; angle < 360; angle = angle + 120) {
            forward = anglestoforward((0, angle, 0));
            var_bbc8b087a12bb00 = tacpoint.origin + forward * var_6b7e31b44601a90b;
            ground_pos = drop_to_ground(var_bbc8b087a12bb00, 200, drop_height * -1);
            /#
                if (function_1ec53e871d501656()) {
                    if (isdefined(ground_pos)) {
                        line(var_bbc8b087a12bb00, ground_pos, (1, 1, 0));
                        line(ground_pos, var_bbc8b087a12bb00 + (0, 0, drop_height * -1), (1, 0, 0));
                    }
                }
            #/
            if (!isdefined(ground_pos) || ground_pos == var_bbc8b087a12bb00 || ground_pos == var_bbc8b087a12bb00 + (0, 0, drop_height * -1)) {
                var_8289fd24bc653ce6 = 0;
                /#
                    function_8acdeae54b5a9492("<unknown string>", var_bbc8b087a12bb00);
                #/
                break;
            }
        }
    }
    return var_8289fd24bc653ce6;
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2829
// Size: 0x10d
function private function_370709234f11708d(ent, var_bf32f518568f490d, target_pos) {
    /#
        /#
            assert(isdefined(target_pos));
        #/
    #/
    var_d08e5dd64fddbb4e = isdefined(self.var_68e8dc012f0a8a41) && gettime() < self.var_68e8dc012f0a8a41 && isdefined(self.var_f42116fb6fbbdebb);
    if (var_d08e5dd64fddbb4e) {
        if (distancesquared(self.var_f42116fb6fbbdebb.origin, self.origin) < distancesquared(ent.origin, self.origin)) {
            /#
                function_8acdeae54b5a9492("<unknown string>", ent.origin + (0, 0, 20));
            #/
            return;
        }
    }
    self.var_7aeae37022a80dc2 setscriptablepartstate("chase_audio", "chase");
    self.var_f42116fb6fbbdebb = ent;
    self.var_dccee8fd50aac81 = target_pos;
    if (isdefined(var_bf32f518568f490d)) {
        self.var_68e8dc012f0a8a41 = gettime() + var_bf32f518568f490d;
    }
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x293d
// Size: 0x3d
function private function_8789d22720f0612(pos) {
    /#
        /#
            assert(isdefined(pos));
        #/
    #/
    self.var_dccee8fd50aac81 = pos;
    self.var_7aeae37022a80dc2 setscriptablepartstate("chase_audio", "chase");
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2981
// Size: 0x9b
function private function_ce10f8b3e9257046(player, damage_point) {
    knockback_magnitude = 1800;
    knock_dir = player.origin - damage_point - (0, 0, 100);
    player knockback_flat(knock_dir, knockback_magnitude);
    player playrumbleonentity("heavy_1s");
    player earthquakeforplayer(0.5, 1, player.origin, 500);
    player dodamage(60, self.origin, self, self, "MOD_IMPACT", undefined, undefined, undefined, 65536);
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a23
// Size: 0x3a
function private function_fb98b0b95868ad35() {
    underground_ent = self.var_7aeae37022a80dc2;
    underground_ent setscriptablepartstate("ambient_audio", "on");
    thread function_49df9cf9b86f53cd(underground_ent);
    thread function_e35cf2862b8a6c(underground_ent);
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a64
// Size: 0x7a
function private function_49df9cf9b86f53cd(underground_ent) {
    self endon("death");
    underground_ent endon("death");
    self endon("start_emerge");
    underground_ent.origin = self.origin;
    underground_ent utility::function_3ab9164ef76940fd("dust_kickup", "dust_light");
    wait(0.25);
    underground_ent utility::function_3ab9164ef76940fd("dust_kickup", "off");
    wait(5);
    function_7f9eb46a76d2fa8b(0);
    wait(55);
    ent_flag_set("return_home");
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ae5
// Size: 0x8f4
function private function_e35cf2862b8a6c(underground_ent) {
    self endon("death");
    underground_ent endon("death");
    base_speed = getdvarfloat(@"hash_9232b53fc181491b", 20);
    max_speed = getdvarfloat(@"hash_534fcc249dc33a8e", 60);
    current_speed = base_speed;
    current_yaw = self.angles[2];
    underground_ent.current_depth = 1;
    self.var_d491b94b8454d40e = 0;
    is_injured = self.health < self.maxhealth * 0.5;
    var_c33772e93cc31586 = is_injured ? getdvarfloat(@"hash_78e585c859d13a37", 0.5) : getdvarfloat(@"hash_78e585c859d13a37", 1);
    alive_percentage = [[ self.var_c54a21ea717fe8a5 ]]();
    if (getdvarfloat(@"hash_6f56a8007c2ae785", -1) > 0) {
        var_fb06aaca63a89a5b = getdvarfloat(@"hash_6f56a8007c2ae785", -1);
    } else if (alive_percentage > 0.5 && self.var_f8adf1aaec88d636 > 3) {
        var_fb06aaca63a89a5b = 2;
    } else if (is_injured || self.var_1b51c793abb7dbe6 <= 0) {
        var_fb06aaca63a89a5b = 5;
    } else {
        var_fb06aaca63a89a5b = 10;
    }
    utility::ent_flag_set("ignore_events");
    thread utility::ent_flag_clear_delayed("ignore_events", var_fb06aaca63a89a5b);
    wait(var_c33772e93cc31586);
    var_86b0b600e702b22f = 1;
    has_target = 0;
    while (utility::ent_flag("is_underground")) {
        var_3f2d5c250e1d0845 = function_80b969fbbf253b0();
        if (isdefined(var_3f2d5c250e1d0845)) {
            if (!has_target) {
                has_target = 1;
                underground_ent.current_depth = 1;
                pause_time = getdvarfloat(@"hash_103d12cb4e26ffcb", 1);
                if (distance2dsquared(var_3f2d5c250e1d0845, self.origin) < 500) {
                    pause_time = pause_time * 0.5;
                }
                earthquake(0.5, 0.75, underground_ent.origin, 3000);
                wait(pause_time);
                current_yaw = vectortoyaw(var_3f2d5c250e1d0845 - underground_ent.origin);
                continue;
            }
            function_69ded3e9c71cefdf(1);
            underground_ent.current_depth = 0;
            var_9bdc682b3f231fc7 = distance2d(underground_ent.origin, var_3f2d5c250e1d0845);
            chase_intensity = 1 - clamp(math::remap(var_9bdc682b3f231fc7, 200, 1000, 0, 1), 0, 1);
            /#
                function_8acdeae54b5a9492("<unknown string>" + chase_intensity + "<unknown string>" + var_9bdc682b3f231fc7, underground_ent.origin + (0, 0, 80));
            #/
            var_86b0b600e702b22f = 8 + chase_intensity * 12;
            current_yaw = math::function_c5b0d1646ebc8eb3(underground_ent.origin, var_3f2d5c250e1d0845, var_86b0b600e702b22f, current_yaw);
            angles = (0, current_yaw, 0);
            forward_vec = anglestoforward(angles);
            var_64ba0f4ba0ad408b = math::lerp(base_speed, max_speed, 0.75);
            current_speed = math::lerp(var_64ba0f4ba0ad408b, max_speed, chase_intensity);
            underground_ent.origin = underground_ent.origin + forward_vec * current_speed;
            underground_ent.angles = angles;
            var_9bdc682b3f231fc7 = distance2d(underground_ent.origin, var_3f2d5c250e1d0845);
            if (var_9bdc682b3f231fc7 < 250) {
                underground_ent.origin = var_3f2d5c250e1d0845;
                utility::ent_flag_set("can_emerge");
                utility::ent_flag_set("can_emerge_attack");
                var_df44b12ecad5b6d3 = function_bd315b0ebd63273c(var_3f2d5c250e1d0845);
                if (var_df44b12ecad5b6d3.size > 0) {
                    utility::ent_flag_set("can_emerge_attack_swallow");
                    self.var_df44b12ecad5b6d3 = var_df44b12ecad5b6d3;
                }
                break;
            }
        } else if (should_heal() || function_70a65bfe53197f0d()) {
            underground_ent.current_depth = 0.5;
            home_pos = function_7b4daaf9179c9cee();
            var_9bdc682b3f231fc7 = distance2d(underground_ent.origin, home_pos);
            if (var_9bdc682b3f231fc7 < 100) {
                underground_ent.origin = home_pos;
                if (should_heal()) {
                    function_69ded3e9c71cefdf(2);
                    if (!utility::ent_flag("healing")) {
                        utility::ent_flag_set("healing");
                        thread heal_update();
                        self visiblenotsolid();
                    }
                    targets_nearby = self function_53a66d3a98238538(underground_ent.origin, 1000, 1);
                    if (targets_nearby.size > 0) {
                        utility::ent_flag_set("can_emerge");
                        break;
                    }
                } else {
                    utility::ent_flag_set("can_emerge");
                }
            } else {
                current_yaw = math::function_c5b0d1646ebc8eb3(underground_ent.origin, home_pos, 10, current_yaw);
                forward_vec = anglestoforward((0, current_yaw, 0));
                current_speed = base_speed;
                underground_ent.origin = underground_ent.origin + forward_vec * current_speed;
            }
        } else if (function_70a65bfe53197f0d()) {
        } else {
            function_69ded3e9c71cefdf(3);
            var_bbb5ae90e0d2763c = getdvarfloat(@"hash_b76c567afef49143", 0.05);
            var_fdd8f39b21c1276c = getdvarfloat(@"hash_1f58bf41db502871", 2);
            var_855123015fd0a885 = getdvarfloat(@"hash_426bdc9deb50e6a2", 3);
            var_63fa055edecf2f46 = sin(gettime() * var_bbb5ae90e0d2763c);
            /#
                function_8acdeae54b5a9492("<unknown string>" + var_63fa055edecf2f46, underground_ent.origin + (0, 0, 80));
            #/
            var_c884413fcb21c8b5 = underground_ent.origin - function_7b4daaf9179c9cee();
            var_69a5f8db3521d341 = -1 * var_c884413fcb21c8b5;
            forward_vec = anglestoforward((0, current_yaw, 0));
            var_e769acd0c61ec10 = vectordot(vectornormalize(var_c884413fcb21c8b5), forward_vec) > -0.5;
            var_860b5139127152df = distance2d(underground_ent.origin, function_7b4daaf9179c9cee());
            var_fe4586b3ec1a118b = math::remap(var_860b5139127152df, 0, 2000, 0, 1);
            /#
                if (var_e769acd0c61ec10) {
                    function_8acdeae54b5a9492("<unknown string>" + var_fe4586b3ec1a118b, underground_ent.origin + (0, 0, 120));
                }
            #/
            var_86b0b600e702b22f = var_855123015fd0a885;
            if (var_fe4586b3ec1a118b > 0.75) {
                if (var_e769acd0c61ec10) {
                    var_86b0b600e702b22f = var_86b0b600e702b22f + var_fe4586b3ec1a118b * var_fdd8f39b21c1276c;
                    var_78a80ebf1df6da5b = math::function_1c46b3e291eff242(var_69a5f8db3521d341, forward_vec);
                    var_63fa055edecf2f46 = abs(var_63fa055edecf2f46) * (var_78a80ebf1df6da5b ? -1 : 1);
                }
            }
            var_86b0b600e702b22f = var_86b0b600e702b22f * var_63fa055edecf2f46;
            current_yaw = current_yaw + var_86b0b600e702b22f;
            forward_vec = anglestoforward((0, current_yaw, 0));
            var_fbdf92a2bff84016 = getdvarfloat(@"hash_3b38a28674d7a6fd", 0.05);
            depth_percent = (sin(gettime() * var_fbdf92a2bff84016) + 1) * 0.5;
            underground_ent.current_depth = math::remap(depth_percent, 0, 1, 0.2, 1);
            var_7b4d99409bf93f11 = 0;
            if (self.var_464a40f4e8a81fc1 != 2) {
                var_7b4d99409bf93f11 = 0.3;
            }
            var_95a33d1ae1eefcbf = math::remap(depth_percent, 0, 1, 0, var_7b4d99409bf93f11) * (max_speed - base_speed);
            current_speed = base_speed + var_95a33d1ae1eefcbf;
            underground_ent.origin = underground_ent.origin + forward_vec * current_speed;
        }
        drop_limit = 200;
        surface_position = utility::drop_to_ground(underground_ent.origin, drop_limit, -100);
        if (isdefined(surface_position)) {
            if (surface_position[2] < underground_ent.origin[2] - drop_limit + 10) {
                /#
                    if (function_1ec53e871d501656()) {
                        utility::draw_arrow(underground_ent.origin, surface_position, (0, 0, 1));
                        sphere(surface_position, 10, (1, 1, 0));
                        function_8acdeae54b5a9492("<unknown string>", surface_position);
                        println("<unknown string>");
                    }
                #/
                underground_ent.origin = function_7b4daaf9179c9cee();
                self forceteleport(function_7b4daaf9179c9cee(), self.angles);
            } else {
                /#
                    if (function_1ec53e871d501656()) {
                        utility::draw_arrow(underground_ent.origin, surface_position, (1, 0, 0));
                        sphere(surface_position, 10, (1, 0, 0));
                    }
                #/
                underground_ent.origin = surface_position;
                self forceteleport(surface_position, self.angles);
            }
        }
        waitframe();
    }
    underground_ent.var_513cca62f64f0db6 = undefined;
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x33e0
// Size: 0x39
function private function_69ded3e9c71cefdf(state) {
    if (self.var_d491b94b8454d40e != state) {
        if (utility::ent_flag("healing")) {
            stop_healing();
        }
    }
    self.var_d491b94b8454d40e = state;
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3420
// Size: 0x360
function private function_4b0fbbaee39f7489(underground_ent) {
    self endon("death");
    underground_ent endon("death");
    underground_ent.current_depth = 0;
    var_4dd212342f29af57 = 0.5;
    while (utility::ent_flag("is_underground")) {
        players = namespace_2b1145f62aa835b8::function_883458a342af3041(underground_ent.origin, 3000);
        if (utility::ent_flag("healing")) {
            underground_ent utility::function_3ab9164ef76940fd("dust_kickup", "healing");
            earthquake(0.15, var_4dd212342f29af57, underground_ent.origin, 3000);
            foreach (player in players) {
                player playrumbleonpositionforclient("rumble_zombie_deathworm_dust_light", underground_ent.origin);
            }
        } else if (underground_ent.current_depth < 0.2) {
            underground_ent utility::function_3ab9164ef76940fd("dust_kickup", "dust_heavy");
            earthquake(0.25, var_4dd212342f29af57, underground_ent.origin, 3000);
            foreach (player in players) {
                player playrumbleonpositionforclient("rumble_zombie_deathworm_dust_heavy", underground_ent.origin);
            }
        } else if (underground_ent.current_depth < 0.3) {
            underground_ent utility::function_3ab9164ef76940fd("dust_kickup", "dust_medium");
            earthquake(0.2, var_4dd212342f29af57, underground_ent.origin, 3000);
            foreach (player in players) {
                player playrumbleonpositionforclient("rumble_zombie_deathworm_dust_medium", underground_ent.origin);
            }
        } else if (underground_ent.current_depth < 0.95) {
            underground_ent utility::function_3ab9164ef76940fd("dust_kickup", "dust_light");
            earthquake(0.175, var_4dd212342f29af57, underground_ent.origin, 3000);
            foreach (player in players) {
                player playrumbleonpositionforclient("rumble_zombie_deathworm_dust_light", underground_ent.origin);
            }
        } else {
            underground_ent utility::function_3ab9164ef76940fd("dust_kickup", "off");
            underground_ent utility::function_3ab9164ef76940fd("dust_kickup_audio", "off");
        }
        /#
            function_8acdeae54b5a9492("<unknown string>" + underground_ent.current_depth, underground_ent.origin + (0, 0, 160));
        #/
        wait(var_4dd212342f29af57 * 0.5);
    }
    underground_ent utility::function_3ab9164ef76940fd("dust_kickup", "off");
    underground_ent utility::function_3ab9164ef76940fd("dust_kickup_audio", "off");
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3787
// Size: 0x80
function private should_heal() {
    if (self.var_464a40f4e8a81fc1 != 2) {
        return false;
    }
    if (self.health > self.maxhealth * 0.99) {
        return false;
    }
    var_9de837d50c0d4071 = function_2af099045fef3cc9();
    var_76a7d2aa9f5a35d0 = var_9de837d50c0d4071.size;
    health_cap = int(self.maxhealth / 6 * var_76a7d2aa9f5a35d0);
    if (self.health >= health_cap) {
        return false;
    }
    return true;
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x380f
// Size: 0x1a1
function private heal_update() {
    self endon("death");
    while (utility::ent_flag("healing")) {
        missing_health = self.maxhealth - self.health;
        var_ecb9a1ffec52e528 = int(max(missing_health * 0.025, self.maxhealth * 0.01));
        var_9de837d50c0d4071 = function_2af099045fef3cc9();
        var_76a7d2aa9f5a35d0 = var_9de837d50c0d4071.size;
        health_cap = self.maxhealth / 6 * var_76a7d2aa9f5a35d0;
        var_bda5255252a8e4b6 = min(health_cap - self.health, var_ecb9a1ffec52e528);
        self.health = self.health + int(var_bda5255252a8e4b6);
        var_893df864e876028c = undefined;
        var_49ee16ffaf45b38b = undefined;
        foreach (gill in var_9de837d50c0d4071) {
            health = metabone::function_8c1f2f897dfe5982(gill, "open");
            if (!isdefined(var_49ee16ffaf45b38b) || health <= var_49ee16ffaf45b38b) {
                var_49ee16ffaf45b38b = health;
                var_893df864e876028c = gill;
            }
        }
        var_608a36194d4662a1 = self.var_90cec1dffd2daa94 - var_49ee16ffaf45b38b;
        /#
            /#
                assert(var_608a36194d4662a1 >= 0);
            #/
        #/
        metabone::function_3d2875316eed616d(var_893df864e876028c, min(var_608a36194d4662a1, int(var_bda5255252a8e4b6)), "open");
        wait(1);
    }
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x39b7
// Size: 0x26
function private function_70a65bfe53197f0d() {
    if (self.var_464a40f4e8a81fc1 == 2) {
        return false;
    }
    if (ent_flag("return_home")) {
        return true;
    }
    return false;
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x39e5
// Size: 0x27
function private stop_healing() {
    utility::ent_flag_clear("healing");
    utility::function_3ab9164ef76940fd("healing", "off");
    self invisiblenotsolid();
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a13
// Size: 0xa5
function function_affdcaeb23533028() {
    /#
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_63b466a9d511f482);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_dfb388f8dab8c071);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_4516e2377c60aa32);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_4516e2377c60aa32);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_4516e2377c60aa32);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_4516e2377c60aa32);
        devgui::function_fe953f000498048f();
        thread draw_underground();
    #/
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3abf
// Size: 0x46
function private function_63b466a9d511f482() {
    /#
        deathworm = zombie_utils::function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
        if (!isdefined(deathworm)) {
            return;
        }
        deathworm function_3e89eb3d8e3f1811("<unknown string>", 1);
    #/
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3b0c
// Size: 0x18
function private function_1ec53e871d501656() {
    /#
        return getdvarint(@"hash_9fd387aebcb22387", 0) > 0;
    #/
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3b2b
// Size: 0xdf
function private function_4516e2377c60aa32(params) {
    /#
        worm = zombie_utils::function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
        if (!isdefined(worm)) {
            return;
        }
        state_index = int(params[0]);
        if (state_index == 0) {
            worm.var_7aeae37022a80dc2 utility::function_3677f2be30fdd581("<unknown string>", "<unknown string>");
        }
        if (state_index == 1) {
            worm.var_7aeae37022a80dc2 utility::function_3677f2be30fdd581("<unknown string>", "<unknown string>");
        }
        if (state_index == 2) {
            worm.var_7aeae37022a80dc2 utility::function_3677f2be30fdd581("<unknown string>", "<unknown string>");
        }
        if (state_index == 3) {
            worm.var_7aeae37022a80dc2 utility::function_3677f2be30fdd581("<unknown string>", "<unknown string>");
        }
    #/
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3c11
// Size: 0x1b
function private function_dfb388f8dab8c071() {
    /#
        devgui::function_2fb888667001fc39("<unknown string>", @"hash_9fd387aebcb22387");
    #/
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3c33
// Size: 0x6e
function private function_8acdeae54b5a9492(text, pos) {
    /#
        if (!isai(self) && !isdefined(pos)) {
            return;
        }
        if (function_1ec53e871d501656()) {
            pos = isdefined(pos) ? pos : self.origin + (0, 0, 70);
            print3d(pos, "<unknown string>" + text, (1, 0, 0));
        }
    #/
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3ca8
// Size: 0xa7
function private draw_underground() {
    /#
        self endon("<unknown string>");
        while (true) {
            if (!function_1ec53e871d501656()) {
                waitframe();
                continue;
            }
            worm = self;
            if (isdefined(worm)) {
                var_48f627463d405084 = (1, 0.2, 0.2);
                sphere(worm.var_7aeae37022a80dc2.origin, 30, var_48f627463d405084, 1, 1);
                print3d(worm.var_7aeae37022a80dc2.origin + (0, 0, -10), "<unknown string>", var_48f627463d405084, 0.8, 0.5);
            }
            waitframe();
        }
    #/
}

// Namespace zombie_deathworm / namespace_eacfeb05dca5f969
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3d56
// Size: 0x271
function private function_ab3d258d6bf6aaa7() {
    /#
        self endon("<unknown string>");
        while (true) {
            if (!function_1ec53e871d501656()) {
                waitframe();
                continue;
            }
            if (isdefined(level.players) && level.players.size > 0 && isalive(level.players[0])) {
                closest_tacpoint = findclosesttacpoint(level.players[0].origin);
                if (isdefined(closest_tacpoint)) {
                    color = function_1cdd35ae61fe41d3(closest_tacpoint, 0) ? (0, 1, 0) : (1, 0, 0);
                    printtoscreen2d(400, 400, "<unknown string>" + function_972570f45c9b09bc(closest_tacpoint), color);
                    printtoscreen2d(400, 450, "<unknown string>" + function_5e2c6953b8312bd6(closest_tacpoint), color);
                    if (distance(level.players[0].origin, closest_tacpoint.origin) > 200) {
                        var_641be59c6d0a32a1 = function_95d12d803b1f13bb(level.players[0].origin);
                        printtoscreen2d(400, 500, "<unknown string>" + (var_641be59c6d0a32a1 ? "<unknown string>" : "<unknown string>"), var_641be59c6d0a32a1 ? (0, 1, 0) : (1, 0, 0));
                    }
                }
                roomindex = undefined;
                worm = zombie_utils::function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
                if (isdefined(worm) && isdefined(worm.var_28e5a71792b91a61)) {
                    roomindex = worm.var_28e5a71792b91a61;
                }
                if (isdefined(roomindex)) {
                    tacpoint = function_7f1964deaf730144(level.players[0].origin, getdvarfloat(@"hash_5eb7fc0533e937ba", 500), roomindex, 1);
                    if (isdefined(tacpoint)) {
                        color = function_1cdd35ae61fe41d3(tacpoint, 0) ? (0, 1, 0) : (1, 0, 0);
                        sphere(tacpoint.origin, 20, color);
                        print3d(tacpoint.origin, "<unknown string>" + function_972570f45c9b09bc(tacpoint), color);
                    }
                }
            }
            waitframe();
        }
    #/
}

