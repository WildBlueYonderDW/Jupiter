// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\common\vehicle.gsc;
#using script_3b64eb40368c1450;
#using scripts\engine\sp\utility.gsc;
#using scripts\stealth\group.gsc;
#using scripts\common\ai.gsc;
#using script_3433ee6b63c7e243;

#namespace scripted_melee;

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa90
// Size: 0x1da
function main() {
    if (!isdefined(level.scripted_melee)) {
        level.scripted_melee = spawnstruct();
    }
    if (istrue(level.scripted_melee.enabled) || istrue(level.scripted_melee.disabled)) {
        return;
    }
    if (getdvarint(@"hash_e9e247c60cd8800a")) {
        iprintlnbold("SCRIPTED MELEE ACTIVE!");
    }
    level.scripted_melee.enabled = 1;
    level.scripted_melee.var_950da684eae1c18a = &main;
    level.scripted_melee.var_a7013f4bc7f81aff = &function_c4dc31621d524849;
    /#
        setdvarifuninitialized(@"hash_e9e247c60cd8800a", 0);
    #/
    /#
        setdvarifuninitialized(@"hash_81840c8f9813a6d3", 0);
    #/
    /#
        setdvarifuninitialized(@"hash_301100a436cfdb2c", 0);
    #/
    setdvarifuninitialized(@"hash_af4553a66846825b", 1);
    setsaveddvar(@"hash_3b07e69e1cd8b041", 100);
    setsaveddvar(@"hash_579c12ad813fa4a8", 640);
    setsaveddvar(@"hash_5e6c29a5c2de1adf", 384);
    if (!isdefined(level.scripted_melee.var_7bc18d5686145f5f) || !level.scripted_melee.var_7bc18d5686145f5f) {
        precache();
    }
    if (!issp()) {
        while (level.players.size < 1) {
            waitframe();
        }
    }
    foreach (player in level.players) {
        player thread function_2f2fcb2d8afaff5e();
    }
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc71
// Size: 0x14a
function precache() {
    level.scripted_melee.var_dc0788366a9acb40 = "tag_player";
    level._effect["vfx_scriptedmelee_stab"] = loadfx("vfx/iw8/weap/_knife/vfx_contextmele_neckstab_med_ch2.vfx");
    level._effect["vfx_wnd_throat_stab"] = loadfx("vfx/iw9/level/wounded/vfx_wnd_throat_stab");
    level._effect["vfx_vm_sp_undershoulder_stab"] = loadfx("vfx/iw9/level/wounded/vfx_vm_sp_undershoulder_stab");
    level._effect["vfx_vm_sp_throat_stab"] = loadfx("vfx/iw9/level/wounded/vfx_vm_sp_throat_stab");
    level._effect["vfx_vm_sp_chest_stab_01"] = loadfx("vfx/iw9/level/wounded/vfx_vm_sp_chest_stab_01");
    level._effect["vfx_vm_sp_chest_stab_ri_01"] = loadfx("vfx/iw9/level/wounded/vfx_vm_sp_chest_stab_ri_01");
    level._effect["vfx_vm_sp_stab_neck_back_ri_01"] = loadfx("vfx/iw9/level/wounded/vfx_vm_sp_stab_neck_back_ri_01");
    if (utility::issp()) {
        namespace_a8bfa6bedd2a9d2b::add_hint_string("scripted_melee_takedown", "SCRIPTED_MELEE/TAKEDOWN", &function_ec9009fa379356c, 2);
        level.player.var_b16e3ec6b657e398 = 0;
    }
    precachemodel("axis_guide_simple");
    precachemodel("att_vm_p33_me_tac_knife01_v0");
    [[ level.scripted_melee.var_1fc4fd3ef975e8c8 ]]();
    level.scripted_melee.var_7bc18d5686145f5f = 1;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xdc2
// Size: 0x7f
function private function_ec9009fa379356c() {
    if (!getdvarint(@"hash_af4553a66846825b")) {
        level.player.var_b16e3ec6b657e398 = 0;
        return 1;
    }
    if (!level.player isscriptedmeleeactive()) {
        level.player.var_b16e3ec6b657e398 = 0;
        return 1;
    }
    if (!level.player function_bac81c2c3a5bebe0()) {
        level.player.var_b16e3ec6b657e398 = 0;
        return 1;
    }
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xe49
// Size: 0x87
function private function_2f2fcb2d8afaff5e() {
    level notify("scripted_melee_stop");
    level endon("scripted_melee_stop");
    if (!isdefined(self.scripted_melee_player_rig)) {
        self [[ level.scripted_melee.var_2ec260ca66f2378 ]]();
    }
    self.scripted_melee_player_rig notsolid();
    self.scripted_melee_player_rig hide();
    self notifyonplayercommand("player_scripted_melee", "+melee_zoom");
    thread function_47a1953e498454b4();
    thread function_4122323699a9de19();
    debug_print("scripted_melee enabled: " + gettime());
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xed7
// Size: 0x3a
function private function_c4dc31621d524849() {
    level notify("scripted_melee_stop");
    level.scripted_melee.enabled = 0;
    scripted_melee_active(0);
    debug_print("scripted_melee disabled: " + gettime());
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xf18
// Size: 0xa1
function private scripted_melee_active(bool) {
    if (bool) {
        if (!self isscriptedmeleeactive()) {
            debug_print("scripted melee code active " + gettime());
            self setscriptedmeleeactive(bool);
        }
        if (utility::issp()) {
            if (self function_bac81c2c3a5bebe0() && !self.var_b16e3ec6b657e398) {
                thread namespace_a8bfa6bedd2a9d2b::display_hint_forced("scripted_melee_takedown");
                self.var_b16e3ec6b657e398 = 1;
            }
        }
    } else {
        self function_dbf8692a4c239dcf();
        self.var_b16e3ec6b657e398 = 0;
        if (self isscriptedmeleeactive()) {
            debug_print("scripted melee code INactive " + gettime());
            self setscriptedmeleeactive(bool);
        }
    }
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfc0
// Size: 0x65
function private function_5ed0667faa731a14() {
    level endon("scripted_melee_stop");
    self notifyonplayercommand("player_scripted_melee", "+melee_zoom");
    while (1) {
        count = 0;
        self waittill("player_scripted_melee");
        scripted_melee_active(1);
        for (;;) {
            for (;;) {
                if (self meleebuttonpressed()) {
                    count = count + 1;
                }
                if (count == 12) {
                    self notify("player_scripted_melee_hold");
                    break;
                }
            }
        }
    }
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x102c
// Size: 0x14b
function private function_47a1953e498454b4() {
    thread function_f31eef930ee6169f();
    level endon("scripted_melee_stop");
    for (;;) {
        for (;;) {
            if (istrue(self.in_melee_death) || !val::get("melee") || isdefined(self.hasriotshieldequipped) && self.hasriotshieldequipped || self isuseavailable()) {
                scripted_melee_active(0);
            } else {
                self.var_a13eda80c7c29501 = undefined;
                self.var_eab23f9eeb595c1e = undefined;
                var_5a3e4e5298c7d61f = undefined;
                self.var_a13eda80c7c29501 = function_631805963060a8e4();
                if (isdefined(self.var_a13eda80c7c29501)) {
                    self.var_eab23f9eeb595c1e = function_77967a9ef882f668(self.var_a13eda80c7c29501);
                    if (isdefined(self.var_eab23f9eeb595c1e)) {
                        var_5a3e4e5298c7d61f = function_56e9e1d5fdd332d8(self.var_a13eda80c7c29501, self.var_eab23f9eeb595c1e);
                    }
                    if (isdefined(var_5a3e4e5298c7d61f)) {
                        if (utility::issp()) {
                            self function_7739eda9dbac25ac(self.var_a13eda80c7c29501, undefined, undefined, var_5a3e4e5298c7d61f);
                        } else {
                            self function_7739eda9dbac25ac(self.var_a13eda80c7c29501, (0, 0, 1), (0, 0, 1), var_5a3e4e5298c7d61f);
                        }
                        scripted_melee_active(1);
                    } else {
                        scripted_melee_active(0);
                    }
                } else {
                    scripted_melee_active(0);
                }
            }
        }
    }
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x117e
// Size: 0x81
function private function_f31eef930ee6169f() {
    /#
        assert(isplayer(self));
    #/
    player = self;
    while (1) {
        weapon = player waittill("weapon_change");
        if (isdefined(weapon) && isdefined(weapon.type) && weapon.type == "riotshield") {
            player.hasriotshieldequipped = 1;
        } else {
            player.hasriotshieldequipped = 0;
        }
    }
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1206
// Size: 0x15b
function private function_631805963060a8e4() {
    level endon("scripted_melee_stop");
    self [[ level.scripted_melee.var_efaa5d51e08521eb ]]();
    victim = self getscriptedmeleetarget();
    if (!isdefined(victim) || !function_c0b5a507e4d35634(self, victim)) {
        return undefined;
    }
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a") && isdefined(victim) && utility::issp()) {
            var_3bcb9afd267ea786 = victim gettagorigin("melee");
            victimorigin = victim gettagorigin("animScene");
            dir = vectornormalize(var_3bcb9afd267ea786 - self.origin);
            dot = vectordot(dir, anglestoright(victim gettagangles("melee")));
            debug_print3d(var_3bcb9afd267ea786, "front" + abs(dot), (1, 1, 1), 1, 0.05, 1);
            debug_line(var_3bcb9afd267ea786, var_3bcb9afd267ea786 + anglestoright(victim gettagangles("melee")) * 60, (1, 1, 1), 1, 0, 1);
            debug_line(victimorigin, victimorigin + anglestoforward(victim gettagangles("animScene")) * 60, (1, 1, 1), 1, 0, 1);
        }
    #/
    return victim;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1369
// Size: 0x418
function private function_56e9e1d5fdd332d8(victim, direction) {
    var_c5c849d37bd876b6 = undefined;
    var_4da2fa57dbc26 = undefined;
    while (1) {
        if (isdefined(victim.var_f145d382dca7f7ee) && array_contains(victim.var_f145d382dca7f7ee, direction) && (isdefined(victim.scripted_melee) && isdefined(victim.scripted_melee.var_5e0a4f882198a116[direction]) || isdefined(level.scripted_melee.var_5e0a4f882198a116[direction])) && !isdefined(var_4da2fa57dbc26)) {
            if (isdefined(victim.scripted_melee.var_5e0a4f882198a116[direction])) {
                array = victim.scripted_melee.var_5e0a4f882198a116[direction];
            } else {
                array = level.scripted_melee.var_5e0a4f882198a116[direction];
            }
            if (array.size == 1) {
                if (function_7ef5bfcbb7a7d366(array[0]["rules"], victim)) {
                    break;
                }
                debug_print3d(victim.origin, "Skipping override direction, " + direction + ". " + array[0]["animScene"] + " doesn't pass the rules!", (1, 0, 0), 1, 0.1, 1, "line2");
                var_4da2fa57dbc26 = 1;
                continue;
            }
            break;
        } else if (isdefined(level.var_f145d382dca7f7ee) && array_contains(level.var_f145d382dca7f7ee, direction) && isdefined(level.scripted_melee.var_5e0a4f882198a116[direction]) && !isdefined(var_c5c849d37bd876b6)) {
            array = level.scripted_melee.var_5e0a4f882198a116[direction];
            if (array.size == 1) {
                if (function_7ef5bfcbb7a7d366(array[0]["rules"], victim)) {
                    break;
                }
                debug_print3d(victim.origin, "Skipping override direction, " + direction + ". " + array[0]["animScene"] + " doesn't pass the rules!", (1, 0, 0), 1, 0.1, 1, "line2");
                var_c5c849d37bd876b6 = 1;
                continue;
            }
            break;
        } else {
            if (!isdefined(level.scripted_melee.anims[direction])) {
                return undefined;
            }
            array = level.scripted_melee.anims[direction];
            break;
        }
    }
    var_5abf35eba9e29a41 = [];
    for (i = 0; i < array.size; i++) {
        if (function_7ef5bfcbb7a7d366(array[i]["rules"], victim)) {
            var_5abf35eba9e29a41 = array_add(var_5abf35eba9e29a41, array[i]["animScene"]);
        }
    }
    if (var_5abf35eba9e29a41.size > 0) {
        var_fabf3a6fdd01a7b2 = [0:0];
        foreach (i, animscene in var_5abf35eba9e29a41) {
            var_fabf3a6fdd01a7b2[i] = spawnstruct();
            var_fabf3a6fdd01a7b2[i].animation = getanim_from_animname(animscene, "scripted_melee_player_rig");
            var_fabf3a6fdd01a7b2[i].var_83e122372160d16a = animscene;
            var_fabf3a6fdd01a7b2[i].var_b9bcc917d46972b = 0.35;
        }
        if (var_fabf3a6fdd01a7b2.size > 4) {
            debug_print("Array too large, reducing!  Size: " + var_fabf3a6fdd01a7b2.size);
            var_fabf3a6fdd01a7b2 = array_slice(var_fabf3a6fdd01a7b2, 0, 4);
        }
        /#
            for (i = 0; i < var_fabf3a6fdd01a7b2.size; i++) {
                debug_print3d(victim.origin, "scripted_melee" + var_fabf3a6fdd01a7b2[i].var_83e122372160d16a, (0, 1, 0), 1, 0.1, 1, "scripted_melee_anim_ended_longest" + i + 2);
            }
        #/
        return var_fabf3a6fdd01a7b2;
    }
    debug_print3d(victim.origin, "NO animScene FOUND!", (1, 0, 0), 1, 0.1, 1, "line2");
    return undefined;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1789
// Size: 0x2fc
function private function_77967a9ef882f668(victim) {
    level endon("scripted_melee_stop");
    tagpos = victim gettagorigin("tag_origin", 1);
    tagangles = victim gettagangles("tag_origin", 1);
    if (!isdefined(tagpos) || !isdefined(tagangles)) {
        return undefined;
    }
    var_2a49ad1cae501ce3 = anglestoright(tagangles);
    var_b4e1754d236c2278 = anglestoforward(tagangles);
    var_2353ca8656f77e04 = self.origin - tagpos;
    var_2353ca8656f77e04 = (var_2353ca8656f77e04[0], var_2353ca8656f77e04[1], 0);
    var_2353ca8656f77e04 = vectornormalize(var_2353ca8656f77e04);
    var_efc688fb667ef281 = abs(vectordot(var_b4e1754d236c2278, (0, 0, 1)));
    if (var_efc688fb667ef281 > 0.7) {
        var_b4e1754d236c2278 = vectornormalize((var_2a49ad1cae501ce3[0], var_2a49ad1cae501ce3[1], 0));
    } else {
        var_b4e1754d236c2278 = vectornormalize((var_b4e1754d236c2278[0], var_b4e1754d236c2278[1], 0));
    }
    var_9780f353e61a7ba3 = anglestoforward(victim.angles);
    if (vectordot(var_2353ca8656f77e04, var_9780f353e61a7ba3) > vectordot(var_b4e1754d236c2278, var_9780f353e61a7ba3)) {
        var_b4e1754d236c2278 = var_9780f353e61a7ba3;
    }
    var_2a49ad1cae501ce3 = vectorcross(var_b4e1754d236c2278, (0, 0, 1));
    dot = vectordot(var_b4e1754d236c2278, var_2353ca8656f77e04);
    var_ed451f0ea36c48c6 = vectordot(var_2a49ad1cae501ce3, var_2353ca8656f77e04);
    if (isdefined(victim.var_d7167e2d68ae05a3)) {
        var_e5228e274c9db3ce = victim.var_d7167e2d68ae05a3;
    } else {
        var_e5228e274c9db3ce = -0.5;
    }
    if (dot < var_e5228e274c9db3ce) {
        if (isalive(victim)) {
            debug_print3d(victim.origin, "direction: back dot: " + dot + " threat: " + victim getthreatsight(self), (0, 1, 0), 1, 0.1, 1, "line1");
        }
        return "back";
    } else if (dot > 0.6) {
        if (isalive(victim)) {
            debug_print3d(victim.origin, "direction: front dot: " + dot + " threat: " + victim getthreatsight(self), (0, 1, 0), 1, 0.1, 1, "line1");
        }
        return "front";
    } else if (var_ed451f0ea36c48c6 > 0) {
        if (isalive(victim)) {
            debug_print3d(victim.origin, "direction: right dot: " + dot + " threat: " + victim getthreatsight(self), (0, 1, 0), 1, 0.1, 1, "line1");
        }
        return "right";
    } else {
        if (isalive(victim)) {
            debug_print3d(victim.origin, "direction: left dot: " + dot + " threat: " + victim getthreatsight(self), (0, 1, 0), 1, 0.1, 1, "line1");
        }
        return "left";
    }
    return undefined;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1a8d
// Size: 0x92
function private function_4122323699a9de19() {
    level endon("scripted_melee_stop");
    while (1) {
        animscene = angles_offset = origin_offset = var_51e0b68e2cd1ede6 = var_5b88fd6cc81411a4 = var_7bb9e2e4ffd90fda = victim = self waittill("animscripted_predicted_entry");
        if (self isuseinprogress()) {
            continue;
        }
        if (self isuseavailable()) {
            continue;
        }
        victim thread function_497214b31d3bc138(self, animscene);
        utility::function_6d2d330fc885914c();
    }
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1b26
// Size: 0x147
function private function_44fe9739a4d6d1db(attacker) {
    if (!isdefined(level.stealth)) {
        return;
    }
    var_601d79340374bc27 = level.stealth.damage_auto_range;
    var_576f233d91cc27ff = level.stealth.damage_sight_range;
    if (isdefined(self.stealth) && isdefined(self.stealth.override_damage_auto_range)) {
        var_601d79340374bc27 = self.stealth.override_damage_auto_range;
    } else if (isdefined(level.stealth.override_damage_auto_range)) {
        var_601d79340374bc27 = level.stealth.override_damage_auto_range;
    }
    if (isdefined(self.stealth) && isdefined(self.stealth.override_damage_sight_range)) {
        var_576f233d91cc27ff = self.stealth.override_damage_sight_range;
    } else if (isdefined(level.stealth.override_damage_sight_range)) {
        var_576f233d91cc27ff = level.stealth.override_damage_sight_range;
    }
    if (isdefined(var_601d79340374bc27) && isdefined(var_576f233d91cc27ff)) {
        function_aad7a0ea8ac4ca23("combat", self, attacker, var_601d79340374bc27, var_576f233d91cc27ff, "scripted_melee");
    }
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1c74
// Size: 0x85b
function private function_497214b31d3bc138(attacker, animscene) {
    self notify("scripted_melee_start");
    if (!issp()) {
        self kill();
        return;
    }
    self.var_540e3c006ce71d3a = attacker;
    if (isdefined(self.stealth) && !istrue(self.keepstealthoncontextmelee)) {
        ent_flag_clear("stealth_enabled");
    }
    self notify("end_patrol");
    self function_ea63241a4d3092c4();
    if (isdefined(level.var_a5407b03b3e5f39f) && isdefined(self findoverridearchetype("animscript"))) {
        self [[ level.var_a5407b03b3e5f39f.var_55050a7cebe72181 ]]();
        waittillframeend();
    }
    marina_hack = marina_hack(animscene, self);
    var_a30ff6d320cc665e = spawn_tag_origin();
    if (!istrue(marina_hack)) {
        var_a30ff6d320cc665e function_5cffe82f5e70231b(1);
    }
    level.scripted_melee.var_a30ff6d320cc665e = var_a30ff6d320cc665e;
    parent = self getlinkedparent();
    if (isdefined(attacker.var_e3e345b123304389)) {
        parent = attacker.var_e3e345b123304389;
    }
    anim_stopanimscripted();
    set_scripted_node_angles(attacker, var_a30ff6d320cc665e);
    var_a30ff6d320cc665e thread function_9bb1020c719e33b6();
    var_a30ff6d320cc665e function_ebf301224750c8b8((0, 1, 1), 1000, 10);
    debug_print3d(self.origin, "victim melee pos: " + attacker.var_eab23f9eeb595c1e, (0, 1, 1), 1, 0.1, 1000);
    debug_line(attacker.origin, self.origin, (0, 1, 1), 1, 0, 1000);
    debug_circle(self.origin, 16, (0, 1, 1), 1, 1, 1000);
    debug_print("^1Scripted Melee Kill from direction: " + attacker.var_eab23f9eeb595c1e);
    attacker.in_melee_death = 1;
    self.var_678f0dd40099ae4d = self.maxsightdistsqrd;
    self.var_efac77944f03c86d = self.newenemyreactiondistsq;
    self.var_cf5f0ea142f70aa7 = self.battlechatterallowed;
    self.var_52c3b2d2140576d1 = self.allowdeath;
    self.var_57cc235f96b8eb06 = self.animname;
    self.in_melee_death = 1;
    self.allowantigrav = 0;
    self.dontmelee = 1;
    self.maxsightdistsqrd = 1;
    self.fixednode = 0;
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.newenemyreactiondistsq = 0;
    self.allowdeath = 0;
    self.a.disablepain = 1;
    self.allowpain = 0;
    self.battlechatterallowed = 0;
    self.animname = "generic";
    self.remove_from_animloop = 1;
    victimlives = function_c52bbcaf5686cfe1(animscene, self);
    startstance = function_9a787e5f1371b0cc(animscene, self);
    endstance = function_9232cbcaaf33d60f(animscene, self);
    if (isdefined(self.script_stealthgroup) && !victimlives) {
        namespace_e5c9a7258a3d79cb::group_removefrompod(self);
    }
    if (isdefined(self) && isalive(self) && !isdefined(self.delayeddeath) && !self.var_a97ac004f00c5df9) {
        thread namespace_6205bc7c5e394598::magic_bullet_shield();
    }
    if (isdefined(self) || isalive(self)) {
        attacker [[ level.scripted_melee.var_3522908002cc5af ]]();
        var_a30ff6d320cc665e anim_first_frame_solo(attacker.scripted_melee_player_rig, animscene);
        waitframe();
        /#
            if (getdvarint(@"hash_e9e247c60cd8800a")) {
                var_2067fc2d9114eb90 = attacker getcollision("longest melee anim finished");
                attacker.scripted_melee_player_rig thread function_4e0638157c0b38d1();
                debug_print3d(attacker.scripted_melee_player_rig gettagorigin(level.scripted_melee.var_dc0788366a9acb40), "rule_CanScriptedMeleeVictim failed" + gettime(), (1, 0, 0), 1, 0.1, 1000);
                debug_line(attacker.scripted_melee_player_rig gettagorigin(level.scripted_melee.var_dc0788366a9acb40), attacker.scripted_melee_player_rig.origin + anglestoforward(attacker.scripted_melee_player_rig.angles) * 100, (1, 0, 0), 1, 0, 1000);
                debug_circle(attacker.scripted_melee_player_rig gettagorigin(level.scripted_melee.var_dc0788366a9acb40), var_2067fc2d9114eb90.capsule_radius, (1, 0, 0), 1, 1, 1000);
            }
        #/
        usepistol = function_b9063e2baeb9f696(animscene, self);
        meleeweapon = spawn("script_model", attacker.origin);
        if (isdefined(attacker.var_2cd5923c5934a055)) {
            meleeweapon setmodel(attacker.var_2cd5923c5934a055);
        } else if (istrue(usepistol) && isdefined(attacker.var_ef760821473d9172)) {
            meleeweapon utility::make_weapon_model(attacker.var_ef760821473d9172.basename, attacker.var_ef760821473d9172.attachments);
            attacker.scripted_melee_player_rig.var_ef760821473d9172 = meleeweapon;
        } else {
            meleeweapon setmodel("att_vm_p33_me_tac_knife01_v0");
        }
        boneoverride = function_2d06346ead46f1bc(animscene, self);
        meleeweapon notsolid();
        meleeweapon linkto(attacker.scripted_melee_player_rig, boneoverride, (0, 0, 0), (0, 0, 0));
        if (!victimlives) {
            delaythread(5, &death_safety, self);
        }
        self notify("scripted_melee_anim_started");
        attacker notify("scripted_melee_anim_started");
        attacker function_1c96db6d76c91865(self, var_a30ff6d320cc665e, animscene, startstance);
        if (isdefined(parent)) {
            debug_print("scripted melee linking anim_ent to parent");
            var_a30ff6d320cc665e linkto(parent);
        }
        self linkto(var_a30ff6d320cc665e);
        attacker.scripted_melee_player_rig linkto(var_a30ff6d320cc665e);
        attacker lerpfovscalefactor(0, 0.25);
        var_f4c85a3af01b0120 = getanimlength(getanim(animscene));
        var_4120f65e56b5e799 = getanimlength(attacker.scripted_melee_player_rig getanim(animscene));
        if (var_f4c85a3af01b0120 > var_4120f65e56b5e799) {
            attacker thread notify_delay("scripted_melee_anim_ended_longest", var_f4c85a3af01b0120);
            level delaythread(var_f4c85a3af01b0120, &function_63f4a98a99979090, var_a30ff6d320cc665e);
            delaythread(var_f4c85a3af01b0120 / 4, &function_44fe9739a4d6d1db, attacker);
        } else {
            attacker thread notify_delay("scripted_melee_anim_ended_longest", var_4120f65e56b5e799);
            level delaythread(var_4120f65e56b5e799, &function_63f4a98a99979090, var_a30ff6d320cc665e);
            delaythread(var_4120f65e56b5e799 / 4, &function_44fe9739a4d6d1db, attacker);
        }
        thread notify_delay("scripted_melee_anim_ended_victim", var_f4c85a3af01b0120);
        attacker thread notify_delay("scripted_melee_anim_ended", var_4120f65e56b5e799);
        var_ac6d99d19393f2d3 = 1;
        attacker delaycall(var_4120f65e56b5e799 - var_ac6d99d19393f2d3, &lerpfovscalefactor, 1, var_ac6d99d19393f2d3);
        self notify("damage", 0);
        thread function_121362cf4a7ef895(parent, victimlives);
        attacker thread function_8cff6477a8994cc0(meleeweapon, startstance, endstance);
        var_a30ff6d320cc665e thread anim_single([0:self, 1:attacker.scripted_melee_player_rig], animscene);
        if (!istrue(marina_hack)) {
            attacker.scripted_melee_player_rig namespace_bc4a4b9456315863::function_1cb661b457551a3(0);
            delaycall(0.05, &function_5e69fa9cfa2546ec, 15, 18, 37, function_1445e54b6c662c7(), [0:attacker, 1:attacker.scripted_melee_player_rig], 1);
            attacker.scripted_melee_player_rig delaycall(0.05, &function_5e69fa9cfa2546ec, 15, 18, 37, function_1445e54b6c662c7(), [0:attacker, 1:self], 1);
        }
    }
    attacker waittill("scripted_melee_anim_ended_longest");
    debug_print("longest melee anim finished");
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x24d6
// Size: 0x15a
function private function_121362cf4a7ef895(parent, victimlives) {
    self endon("death");
    level endon("scripted_melee_stop");
    self waittill("scripted_melee_anim_ended_victim");
    if (!victimlives) {
        [[ level.scripted_melee.var_fbd8726770c4c39 ]](self);
        [[ level.scripted_melee.var_8a66fb76621b9c84 ]](self);
    } else {
        self.in_melee_death = 0;
        self.allowantigrav = 1;
        self.dontmelee = 0;
        self.maxsightdistsqrd = self.var_678f0dd40099ae4d;
        self.fixednode = 0;
        self.ignoreme = 0;
        self.ignoreall = 0;
        self.newenemyreactiondistsq = self.var_efac77944f03c86d;
        self.a.disablepain = 0;
        self.allowpain = 1;
        self.battlechatterallowed = self.var_cf5f0ea142f70aa7;
        self.remove_from_animloop = undefined;
        self.allowdeath = self.var_52c3b2d2140576d1;
        self.animname = self.var_57cc235f96b8eb06;
        self.var_874f796e29ad7410 = gettime();
        self setgoalpos(self.origin);
        self clearpath();
        if (isdefined(parent)) {
            self linkto(parent);
        }
    }
    self notify("scripted_melee_anim_ended");
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2637
// Size: 0x154
function private function_8cff6477a8994cc0(meleeweapon, startstance, endstance) {
    self endon("death");
    self waittill("scripted_melee_anim_ended");
    meleeweapon delete();
    self.scripted_melee_player_rig hide();
    if (isdefined(self.scripted_melee_player_rig.var_ef760821473d9172)) {
        self.scripted_melee_player_rig.var_ef760821473d9172 = undefined;
    }
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            var_2067fc2d9114eb90 = self getcollision("longest melee anim finished");
            debug_print3d(self.origin + (0, 0, -2), "comp" + gettime(), (1, 1, 0), 1, 0.1, 1000);
            debug_circle(self.origin, var_2067fc2d9114eb90.capsule_radius, (1, 1, 0), 1, 1, 1000);
        }
    #/
    release_player_from_viewmodel_anim(endstance);
    self [[ level.scripted_melee.var_16a2ad3bccc62bb5 ]]();
    self.scripted_melee_player_rig hide();
    self.in_melee_death = 0;
    self.scripted_melee_player_rig namespace_bc4a4b9456315863::function_1cb661b457551a3(1, self, 0.35);
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2792
// Size: 0x65
function function_7ef5bfcbb7a7d366(rules, victim) {
    foreach (rule in rules) {
        if (![[ rule ]](self, victim)) {
            return 0;
        }
    }
    return 1;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27ff
// Size: 0x7c
function function_e5433a928bc95cca() {
    rules = [0:&function_ba9cf1dce2684e06, 1:&function_f2042b6b16526371, 2:&function_f9be8d51b4d903a7, 3:&function_8afeadea083eab3b, 4:&function_1905df1811ca29ec, 5:&function_1b73b9dda428e8ec, 6:&function_a99c9e98b8c36ed0, 7:&function_d3c20c23028ba3ea, 8:&function_7383baaf0f1f2a19, 9:&function_1213c4af15671c7b, 10:&function_3f33052faf524462, 11:&function_185b2e98556d16d7];
    return rules;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2883
// Size: 0x1f
function function_b767805ca0e381e() {
    rules = utility::function_33bea9fcd7e7d254([0:&function_c592df6ec4469c4c]);
    return rules;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28aa
// Size: 0x28
function function_a3356321f4375b10() {
    rules = utility::function_33bea9fcd7e7d254([0:&function_71a6ec3371d375d, 1:&function_c592df6ec4469c4c]);
    return rules;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28da
// Size: 0x1f
function function_279a32b2cdce2b2b() {
    rules = utility::function_33bea9fcd7e7d254([0:&function_71a6ec3371d375d]);
    return rules;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2901
// Size: 0x28
function function_65931e2cbca86748() {
    rules = utility::function_33bea9fcd7e7d254([0:&function_652f03ce87e99355, 1:&function_c592df6ec4469c4c]);
    return rules;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2931
// Size: 0x1f
function function_fa7cc1ad28b01833() {
    rules = utility::function_33bea9fcd7e7d254([0:&function_652f03ce87e99355]);
    return rules;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2958
// Size: 0x1f
function function_9d501e35f4127f85() {
    rules = utility::function_33bea9fcd7e7d254([0:&function_5e854e2a4da4f3ff]);
    return rules;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x297f
// Size: 0x1f
function function_7e355057c5e32c56() {
    rules = utility::function_33bea9fcd7e7d254([0:&function_12baf7c107264c30]);
    return rules;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29a6
// Size: 0x28
function function_199c2718c1a3385f() {
    rules = utility::function_33bea9fcd7e7d254([0:&function_dc5bfb7ce71c284, 1:&function_c592df6ec4469c4c]);
    return rules;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29d6
// Size: 0x1f
function function_fdfbaa517a1c4018() {
    rules = utility::function_33bea9fcd7e7d254([0:&function_dc5bfb7ce71c284]);
    return rules;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x29fd
// Size: 0x2d
function function_c0b5a507e4d35634(player, victim) {
    if (!isplayer(victim)) {
        return 1;
    }
    debug_print("rule_NotIsPlayer failed");
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a32
// Size: 0x2d
function function_ba9cf1dce2684e06(player, victim) {
    if (!player ismeleeing()) {
        return 1;
    }
    debug_print("rule_PlayerNotMeleeing failed");
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a67
// Size: 0x2d
function function_f2042b6b16526371(player, victim) {
    if (isalive(victim)) {
        return 1;
    }
    debug_print("rule_IsAlive failed");
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a9c
// Size: 0x2e
function function_1b73b9dda428e8ec(player, victim) {
    if (!victim doinglongdeath()) {
        return 1;
    }
    debug_print("rule_NotDoingLongDeath failed");
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ad2
// Size: 0x42
function function_f9be8d51b4d903a7(player, victim) {
    if (isdefined(victim.var_1a479cad9c3adbb1) && !victim.var_1a479cad9c3adbb1) {
        debug_print("rule_CanScriptedMeleeVictim failed");
        return 0;
    }
    return 1;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b1c
// Size: 0x38
function function_185b2e98556d16d7(player, victim) {
    var_d6beb1d081d9a959 = victim getlinkedparent();
    if (isdefined(var_d6beb1d081d9a959)) {
        if (var_d6beb1d081d9a959 isvehicle()) {
            return 0;
        }
    }
    return 1;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b5c
// Size: 0x54
function function_8afeadea083eab3b(player, victim) {
    if (!issp()) {
        return 1;
    }
    if (isdefined(victim.animtree) && victim.animtree == "generic_human") {
        return 1;
    }
    debug_print("rule_HasCorrectAnimtree failed");
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2bb8
// Size: 0x6a
function function_1905df1811ca29ec(player, victim) {
    if (isdefined(victim.unittype)) {
        switch (victim.unittype) {
        case #"hash_1403dfb5d1265ddc":
        case #"hash_4ad475e6e15635bd":
        case #"hash_f4a90c6c03d32ee9":
            debug_print("rule_IsValidUnitType failed");
            return 0;
            break;
        }
    }
    return 1;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c2a
// Size: 0x14
function function_bb4d4e9eef766c87(player, victim) {
    
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c45
// Size: 0x14
function function_76d0cdc4bd023d56(player, victim) {
    
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c60
// Size: 0x53
function function_5e854e2a4da4f3ff(player, victim) {
    if (isdefined(victim.fnisinstealthcombat) && victim [[ victim.fnisinstealthcombat ]]()) {
        return 0;
    }
    var_3d4b09d94df0885a = function_910a912f327b8d34(player);
    if (var_3d4b09d94df0885a < 1) {
        return 1;
    }
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2cbb
// Size: 0x29
function function_12baf7c107264c30(player, victim) {
    debug_print("rule_IsNotStealth failed");
    return !function_5e854e2a4da4f3ff(player, victim);
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2cec
// Size: 0x16e
function function_d3c20c23028ba3ea(player, victim) {
    weapons = player getweaponslistall();
    var_48aa5d980e9b010 = [0:"rifle", 1:"sniper", 2:"mg", 3:"smg", 4:"spread", 5:"pistol", 6:"rocketlauncher"];
    var_be8dfb8f9ba78b96 = [0:"throwingknife"];
    foreach (weapon in weapons) {
        if (isdefined(weapon.classname) && array_contains(var_48aa5d980e9b010, weapon.classname)) {
            return 1;
        }
    }
    foreach (weapon in weapons) {
        if (isdefined(weapon.classname) && array_contains(var_be8dfb8f9ba78b96, weapon.classname)) {
            if (player getweaponammostock(weapon) > 0) {
                return 1;
            } else {
                continue;
            }
        }
    }
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e62
// Size: 0x2e
function function_71a6ec3371d375d(player, victim) {
    if (!isdefined(player)) {
        return 0;
    }
    if (player getstance() == "stand") {
        return 1;
    }
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e98
// Size: 0x2e
function function_652f03ce87e99355(player, victim) {
    if (!isdefined(player)) {
        return 0;
    }
    if (player getstance() == "crouch") {
        return 1;
    }
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ece
// Size: 0xbf
function function_dc5bfb7ce71c284(player, victim) {
    player.var_ef760821473d9172 = undefined;
    if (!isdefined(player)) {
        return 0;
    }
    weapons = player getweaponslistprimaries();
    if (!isdefined(weapons)) {
        return 0;
    }
    foreach (weapon in weapons) {
        if (weapon.basename == "iw9_pi_golf17_sp" && function_8205eef398b56d03(weapon)) {
            player.var_ef760821473d9172 = weapon;
            return 1;
        }
    }
    debug_print("failed, player doesn't have iw9_pi_golf17_sp");
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f95
// Size: 0x12d
function function_8205eef398b56d03(weapon) {
    var_51dbe1a1c3d8bf04 = function_6527364c1ecca6c6(weapon.basename);
    var_a90071fdf6c09431 = array_remove_array(weapon.attachments, var_51dbe1a1c3d8bf04);
    foreach (attachment in var_a90071fdf6c09431) {
        if (issubstr(attachment, "silen")) {
            debug_print("failed, pistol has silencer: " + attachment);
            return 0;
        } else if (issubstr(attachment, "comp")) {
            debug_print("failed, pistol has comp: " + attachment);
            return 0;
        } else if (issubstr(attachment, "flash")) {
            debug_print("failed, pistol has flash: " + attachment);
            return 0;
        } else if (issubstr(attachment, "stock")) {
            debug_print("failed, pistol has stock: " + attachment);
            return 0;
        } else if (issubstr(attachment, "bar")) {
            debug_print("failed, pistol has barrel: " + attachment);
            return 0;
        }
    }
    return 1;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x30ca
// Size: 0x4c
function function_a99c9e98b8c36ed0(player, victim) {
    diff = abs(victim.origin[2] - player.origin[2]);
    if (diff >= 20) {
        return 0;
    }
    return 1;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x311e
// Size: 0x27
function function_7383baaf0f1f2a19(player, victim) {
    if (player getstance() != "prone") {
        return 1;
    }
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x314d
// Size: 0x27
function function_1213c4af15671c7b(player, victim) {
    if (!istrue(victim.var_2c1a52b48212191b)) {
        return 1;
    }
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x317c
// Size: 0x27
function function_3f33052faf524462(player, victim) {
    if (!istrue(victim.var_a97ac004f00c5df9)) {
        return 1;
    }
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x31ab
// Size: 0x27
function function_c592df6ec4469c4c(player, victim) {
    if (!istrue(victim.bhasriotshieldattached)) {
        return 1;
    }
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x31da
// Size: 0x13
function private function_63f4a98a99979090(var_a30ff6d320cc665e) {
    var_a30ff6d320cc665e delete();
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x31f4
// Size: 0x4e
function private notify_delay(var_89d1ffd39df87556, fdelay) {
    /#
        assert(isdefined(self));
    #/
    /#
        assert(isdefined(var_89d1ffd39df87556));
    #/
    /#
        assert(isdefined(fdelay));
    #/
    self endon("death");
    if (fdelay > 0) {
        wait(fdelay);
    }
    if (!isdefined(self)) {
        return;
    }
    self notify(var_89d1ffd39df87556);
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3249
// Size: 0x34
function private anim_stopanimscripted() {
    self stopanimscripted();
    self notify("stop_loop");
    self notify("single anim", "end");
    self notify("looping anim", "end");
    self notify("stop_animmode");
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3284
// Size: 0x1ab
function set_scripted_node_angles(attacker, var_a165f8affea867ac) {
    switch (attacker.var_eab23f9eeb595c1e) {
    case #"hash_4b8799075d3a89b8":
        var_a165f8affea867ac.angles = vectortoangles((attacker.origin[0], attacker.origin[1], 0) - (self.origin[0], self.origin[1], 0));
        break;
    case #"hash_c9b3133a17a3b2d0":
        var_a165f8affea867ac.angles = vectortoangles((attacker.origin[0], attacker.origin[1], 0) - (self.origin[0], self.origin[1], 0)) + (0, -90, 0);
        break;
    case #"hash_96815ce4f2a3dbc5":
        var_a165f8affea867ac.angles = vectortoangles((attacker.origin[0], attacker.origin[1], 0) - (self.origin[0], self.origin[1], 0)) + (0, 90, 0);
        break;
    case #"hash_5163a22eb8c03302":
        var_a165f8affea867ac.angles = vectortoangles((self.origin[0], self.origin[1], 0) - (attacker.origin[0], attacker.origin[1], 0));
        break;
    default:
        break;
    }
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3436
// Size: 0x3f
function private death_safety(guy) {
    if (isdefined(guy)) {
        if (isalive(guy)) {
            if (isdefined(guy.magic_bullet_shield)) {
                guy namespace_6205bc7c5e394598::stop_magic_bullet_shield();
            }
            /#
                println("weapon");
            #/
        }
    }
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x347c
// Size: 0x1ad
function function_d8f48ab0dfd5ef51(guy) {
    if (!isdefined(guy)) {
        return;
    }
    if (!isalive(guy)) {
        return;
    }
    guy.skipdeathanim = 1;
    guy pushplayer(0);
    if (isdefined(level.var_36c5a68428425d34) && isdefined(level.var_7b5d9e727929565f)) {
        if (guy [[ level.var_36c5a68428425d34 ]]()) {
            guy [[ level.var_7b5d9e727929565f ]]();
        }
    }
    guy namespace_223959d3e5206cfb::dropallaiweapons();
    if (isdefined(self.var_1bab8712529eb3c2) && isdefined(self.fnstealthflashlightdetach) && self.var_1bab8712529eb3c2) {
        self [[ self.fnstealthflashlightdetach ]]();
    }
    guy.allowdeath = 1;
    guy.diequietly = 1;
    guy.var_f543095c3ca1b743 = 1;
    if (isdefined(guy.magic_bullet_shield)) {
        guy namespace_6205bc7c5e394598::stop_magic_bullet_shield();
    }
    if (isdefined(guy.damageshield)) {
        guy.damageshield = 0;
    }
    if (isdefined(guy.stealth) && !istrue(level.stealth.var_8d8a17b5c4438254)) {
        guy.stealth.override_damage_auto_range = 60;
    }
    debug_print("do death via note");
    guy kill((0, 0, 0), guy.var_540e3c006ce71d3a, guy.var_540e3c006ce71d3a, "MOD_MELEE");
    if (!istrue(guy.var_91c24157247ef2fc)) {
        guy.var_540e3c006ce71d3a.var_4187711225445340 = guy.origin;
    }
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3630
// Size: 0xc
function function_497a27b31d43d6af(guy) {
    
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3643
// Size: 0xc8
function function_ebea6b350af8fb8d(guy) {
    if (isdefined(level.player.var_ef760821473d9172) && isdefined(guy.var_ef760821473d9172)) {
        startpos = guy.var_ef760821473d9172 gettagorigin("tag_flash", 1);
        magicbullet(level.player.var_ef760821473d9172, startpos, startpos + anglestoforward(guy.var_ef760821473d9172.angles) * 12);
        debug_line(startpos, startpos + anglestoforward(guy.var_ef760821473d9172.angles) * 12, (1, 0, 0), 1, 0, 1000);
    }
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3712
// Size: 0xff
function private release_player_from_viewmodel_anim(endstance) {
    self [[ level.scripted_melee.playerlinkeduselinkedvelocity ]](0);
    self function_af4b9b0f0e7c6c42(0.2);
    self freezecontrols(0);
    self freezelookcontrols(0);
    val::function_c9d0b43701bdba00("scripted_melee");
    if (isdefined(endstance)) {
        if (endstance == "prone") {
            self setstance(endstance, 1, 1, 1);
            up = anglestoup(self.angles);
            new_origin = drop_to_ground(self.origin + up * self getplayerviewheight(self.var_ef6be8803be11754), 0, -60, up);
            self setorigin(new_origin, 1);
        } else {
            self setstance(endstance);
        }
    } else {
        self setstance(self.var_ef6be8803be11754);
    }
    if (isdefined(self.var_fc0b0e5bdda97c8c)) {
        setsaveddvar(@"hash_863a2044d629615", self.var_fc0b0e5bdda97c8c);
    }
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x3818
// Size: 0x28b
function private function_1c96db6d76c91865(victim, var_a165f8affea867ac, animscene, startstance) {
    prepare_player_for_viewmodel_anim(startstance);
    var_d58d17e0a32ce60b = getstartangles(var_a165f8affea867ac.origin, var_a165f8affea867ac.angles, victim getanim(animscene));
    debug_line(victim.origin, victim.origin + anglestoforward(victim.angles) * 36, (0, 1, 0), 1, 0, 1000);
    debug_line(victim.origin, victim.origin + anglestoforward(var_d58d17e0a32ce60b) * 36, (1, 0, 1), 1, 0, 1000);
    thread function_ebf301224750c8b8((0, 1, 0), 1000, 10);
    debug_print3d(self.origin, "pre melee pos: " + gettime(), (0, 1, 0), 1, 0.1, 1000);
    debug_line(self.origin, self.origin + anglestoforward(self getplayerangles(1)) * 100, (0, 1, 0), 1, 0, 1000);
    blend_time = 0.35;
    var_710129ac48bc62c4 = victim spawn_tag_origin();
    victim linktoblendtotag(var_710129ac48bc62c4, "tag_origin");
    var_710129ac48bc62c4 rotateto(var_d58d17e0a32ce60b, blend_time, 0.1);
    self.scripted_melee_player_rig aligntag(level.scripted_melee.var_dc0788366a9acb40, self.origin, self.angles);
    marina_hack = marina_hack(animscene, victim);
    if (istrue(marina_hack)) {
        self playerlinktoblend(self.scripted_melee_player_rig, level.scripted_melee.var_dc0788366a9acb40, 0.35, 0.15, 0, 1, 1);
    } else {
        self playerlinktoblend(self.scripted_melee_player_rig, level.scripted_melee.var_dc0788366a9acb40, 0.35, 0.15, 0, 0, 1);
    }
    self [[ level.scripted_melee.playerlinkeduselinkedvelocity ]](1);
    var_710129ac48bc62c4 delete();
    self.scripted_melee_player_rig show();
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3aaa
// Size: 0xdf
function private prepare_player_for_viewmodel_anim(startstance) {
    self.var_ef6be8803be11754 = self getstance();
    if (self isswimming()) {
        self.var_fc0b0e5bdda97c8c = getdvar(@"hash_863a2044d629615");
        setsaveddvar(@"hash_863a2044d629615", 40);
        stance = "crouch";
    } else {
        self.var_fc0b0e5bdda97c8c = undefined;
        stance = "stand";
        if (isdefined(startstance)) {
            stance = startstance;
        }
    }
    self setstance(stance, 0, 1, 1);
    thread freeze_controls_when_standing(stance);
    self freezelookcontrols(1);
    val::set("scripted_melee", "weapon", 0);
    val::set("scripted_melee", "melee", 0);
    val::set("scripted_melee", "prone", 0);
    val::set("scripted_melee", "crouch", 0);
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3b90
// Size: 0x32
function private freeze_controls_when_standing(stance) {
    self endon("death");
    level endon("scripted_melee_stop");
    while (self getstance() != stance) {
        waitframe();
    }
    self freezecontrols(1);
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3bc9
// Size: 0x39
function private function_1445e54b6c662c7() {
    contents = [0:"physicscontents_solid", 1:"physicscontents_playerclip", 2:"physicscontents_characterproxy", 3:"physicscontents_glass"];
    return physics_createcontents(contents);
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3c0a
// Size: 0x300
function private function_c52bbcaf5686cfe1(animscene, victim) {
    if (isdefined(level.scripted_melee.var_5e0a4f882198a116)) {
        foreach (key in getarraykeys(level.scripted_melee.var_5e0a4f882198a116)) {
            array = level.scripted_melee.var_5e0a4f882198a116[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animscene) {
                    return array[i]["victimLives"];
                }
            }
        }
    }
    if (isdefined(self.scripted_melee) && isdefined(self.scripted_melee.var_5e0a4f882198a116)) {
        foreach (key in getarraykeys(self.scripted_melee.var_5e0a4f882198a116)) {
            array = self.scripted_melee.var_5e0a4f882198a116[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animscene) {
                    return array[i]["victimLives"];
                }
            }
        }
    }
    foreach (key in getarraykeys(level.scripted_melee.anims)) {
        array = level.scripted_melee.anims[key];
        for (i = 0; i < array.size; i++) {
            if (array[i]["animScene"] == animscene) {
                return array[i]["victimLives"];
            }
        }
    }
    if (isdefined(victim) && isdefined(victim.scripted_melee) && isdefined(victim.scripted_melee.var_5e0a4f882198a116)) {
        foreach (key in getarraykeys(victim.scripted_melee.var_5e0a4f882198a116)) {
            array = victim.scripted_melee.var_5e0a4f882198a116[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animscene) {
                    return array[i]["victimLives"];
                }
            }
        }
    }
    return 0;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3f12
// Size: 0x237
function private function_9a787e5f1371b0cc(animscene, victim) {
    if (isdefined(level.scripted_melee.var_5e0a4f882198a116)) {
        foreach (key in getarraykeys(level.scripted_melee.var_5e0a4f882198a116)) {
            array = level.scripted_melee.var_5e0a4f882198a116[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animscene) {
                    return array[i]["startStance"];
                }
            }
        }
    }
    foreach (key in getarraykeys(level.scripted_melee.anims)) {
        array = level.scripted_melee.anims[key];
        for (i = 0; i < array.size; i++) {
            if (array[i]["animScene"] == animscene) {
                return array[i]["startStance"];
            }
        }
    }
    if (isdefined(victim) && isdefined(victim.scripted_melee) && isdefined(victim.scripted_melee.var_5e0a4f882198a116)) {
        foreach (key in getarraykeys(victim.scripted_melee.var_5e0a4f882198a116)) {
            array = victim.scripted_melee.var_5e0a4f882198a116[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animscene) {
                    return array[i]["startStance"];
                }
            }
        }
    }
    return undefined;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4151
// Size: 0x237
function private function_9232cbcaaf33d60f(animscene, victim) {
    if (isdefined(level.scripted_melee.var_5e0a4f882198a116)) {
        foreach (key in getarraykeys(level.scripted_melee.var_5e0a4f882198a116)) {
            array = level.scripted_melee.var_5e0a4f882198a116[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animscene) {
                    return array[i]["endStance"];
                }
            }
        }
    }
    foreach (key in getarraykeys(level.scripted_melee.anims)) {
        array = level.scripted_melee.anims[key];
        for (i = 0; i < array.size; i++) {
            if (array[i]["animScene"] == animscene) {
                return array[i]["endStance"];
            }
        }
    }
    if (isdefined(victim) && isdefined(victim.scripted_melee) && isdefined(victim.scripted_melee.var_5e0a4f882198a116)) {
        foreach (key in getarraykeys(victim.scripted_melee.var_5e0a4f882198a116)) {
            array = victim.scripted_melee.var_5e0a4f882198a116[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animscene) {
                    return array[i]["endStance"];
                }
            }
        }
    }
    return undefined;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4390
// Size: 0x237
function private function_b9063e2baeb9f696(animscene, victim) {
    if (isdefined(level.scripted_melee.var_5e0a4f882198a116)) {
        foreach (key in getarraykeys(level.scripted_melee.var_5e0a4f882198a116)) {
            array = level.scripted_melee.var_5e0a4f882198a116[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animscene) {
                    return array[i]["usePistol"];
                }
            }
        }
    }
    foreach (key in getarraykeys(level.scripted_melee.anims)) {
        array = level.scripted_melee.anims[key];
        for (i = 0; i < array.size; i++) {
            if (array[i]["animScene"] == animscene) {
                return array[i]["usePistol"];
            }
        }
    }
    if (isdefined(victim) && isdefined(victim.scripted_melee) && isdefined(victim.scripted_melee.var_5e0a4f882198a116)) {
        foreach (key in getarraykeys(victim.scripted_melee.var_5e0a4f882198a116)) {
            array = victim.scripted_melee.var_5e0a4f882198a116[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animscene) {
                    return array[i]["usePistol"];
                }
            }
        }
    }
    return undefined;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x45cf
// Size: 0x23b
function private function_2d06346ead46f1bc(animscene, victim) {
    if (isdefined(level.scripted_melee.var_5e0a4f882198a116)) {
        foreach (key in getarraykeys(level.scripted_melee.var_5e0a4f882198a116)) {
            array = level.scripted_melee.var_5e0a4f882198a116[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animscene) {
                    return array[i]["boneOverride"];
                }
            }
        }
    }
    foreach (key in getarraykeys(level.scripted_melee.anims)) {
        array = level.scripted_melee.anims[key];
        for (i = 0; i < array.size; i++) {
            if (array[i]["animScene"] == animscene) {
                return array[i]["boneOverride"];
            }
        }
    }
    if (isdefined(victim) && isdefined(victim.scripted_melee) && isdefined(victim.scripted_melee.var_5e0a4f882198a116)) {
        foreach (key in getarraykeys(victim.scripted_melee.var_5e0a4f882198a116)) {
            array = victim.scripted_melee.var_5e0a4f882198a116[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animscene) {
                    return array[i]["boneOverride"];
                }
            }
        }
    }
    return "TAG_ACCESSORY_RIGHT";
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4812
// Size: 0x237
function private marina_hack(animscene, victim) {
    if (isdefined(level.scripted_melee.var_5e0a4f882198a116)) {
        foreach (key in getarraykeys(level.scripted_melee.var_5e0a4f882198a116)) {
            array = level.scripted_melee.var_5e0a4f882198a116[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animscene) {
                    return array[i]["marina_hack"];
                }
            }
        }
    }
    foreach (key in getarraykeys(level.scripted_melee.anims)) {
        array = level.scripted_melee.anims[key];
        for (i = 0; i < array.size; i++) {
            if (array[i]["animScene"] == animscene) {
                return array[i]["marina_hack"];
            }
        }
    }
    if (isdefined(victim) && isdefined(victim.scripted_melee) && isdefined(victim.scripted_melee.var_5e0a4f882198a116)) {
        foreach (key in getarraykeys(victim.scripted_melee.var_5e0a4f882198a116)) {
            array = victim.scripted_melee.var_5e0a4f882198a116[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animscene) {
                    return array[i]["marina_hack"];
                }
            }
        }
    }
    return undefined;
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a51
// Size: 0x7c
function function_7eaecc1fbfd9ad25(player) {
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            self endon("<unknown string>");
            self notify("<unknown string>");
            self endon("<unknown string>");
            while (1) {
                player debug_print3d(self.origin + (0, 0, 70), "<unknown string>", (0.1, 0.1, 1), 1, 0.1, 1, undefined);
                wait(1);
            }
        }
    #/
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x4ad4
// Size: 0x54
function private debug_line(start, end, color, alpha, depthtest, duration) {
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            line(start, end, color, alpha, depthtest, duration);
        }
    #/
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b2f
// Size: 0x27
function debug_print(text) {
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            iprintln(text);
        }
    #/
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 7, eflags: 0x4
// Checksum 0x0, Offset: 0x4b5d
// Size: 0x198
function private debug_print3d(origin, text, color, alpha, scale, duration, offset) {
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            if (!isdefined(offset)) {
                offset = (0, 0, 0);
            } else {
                var_2067fc2d9114eb90 = self getcollision(self getstance());
                switch (offset) {
                case #"hash_984692889a47282":
                    offset = (0, 0, 10) + (0, 0, var_2067fc2d9114eb90.capsule_midpoint_height);
                    break;
                case #"hash_984682889a470ef":
                    offset = (0, 0, 8) + (0, 0, var_2067fc2d9114eb90.capsule_midpoint_height);
                    break;
                case #"hash_984672889a46f5c":
                    offset = (0, 0, 6) + (0, 0, var_2067fc2d9114eb90.capsule_midpoint_height);
                    break;
                case #"hash_984662889a46dc9":
                    offset = (0, 0, 4) + (0, 0, var_2067fc2d9114eb90.capsule_midpoint_height);
                    break;
                case #"hash_984652889a46c36":
                    offset = (0, 0, 2) + (0, 0, var_2067fc2d9114eb90.capsule_midpoint_height);
                    break;
                default:
                    offset = (0, 0, 0);
                    break;
                }
            }
            print3d(origin + offset, text, color, alpha, scale, duration, 1);
        }
    #/
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x4cfc
// Size: 0x55
function private debug_circle(center, radius, color, alpha, depthtest, duration) {
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            draw_circle(center, radius, color, alpha, depthtest, duration);
        }
    #/
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x4d58
// Size: 0x4b
function private debug_sphere(origin, radius, color, depthtest, duration) {
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            sphere(origin, radius, color, depthtest, duration);
        }
    #/
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x4daa
// Size: 0x3a
function private function_ebf301224750c8b8(color, duration, size) {
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            draw_ent_axis(color, duration, size);
        }
    #/
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x4deb
// Size: 0x89
function private debug_arrow(start, end, color, duration) {
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            angles = vectortoangles(start - end);
            forward = anglestoforward(angles);
            debug_line(start, end, color, 1, 0, duration);
            debug_line(start, start + forward * 1, (1, 0, 0), 1, 0, duration);
        }
    #/
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4e7b
// Size: 0x74
function private function_4e0638157c0b38d1() {
    /#
        if (getdvarint(@"hash_81840c8f9813a6d3")) {
            self endon("<unknown string>");
            level endon("<unknown string>");
            while (1) {
                debug_arrow(self gettagorigin("<unknown string>"), self gettagorigin("<unknown string>") + anglestoforward(self gettagangles("<unknown string>")) * 10, (0.25, 0.25, 1), 1000);
                wait(0.1);
            }
        }
    #/
}

// Namespace scripted_melee/namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4ef6
// Size: 0x44
function private function_9bb1020c719e33b6() {
    /#
        if (getdvarint(@"hash_81840c8f9813a6d3")) {
            self endon("<unknown string>");
            for (;;) {
                debug_sphere(self.origin, 4, (1, 1, 1), 0, 1);
                waitframe();
            }
        }
    #/
}

