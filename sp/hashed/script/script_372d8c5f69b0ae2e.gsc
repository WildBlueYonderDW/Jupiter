#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\common\values.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\stealth\group.gsc;
#using scripts\common\ai.gsc;
#using script_3433ee6b63c7e243;

#namespace scripted_melee;

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa90
// Size: 0x1d5
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
    level.scripted_melee.fnenable = &main;
    level.scripted_melee.fndisable = &function_c4dc31621d524849;
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
    if (!isdefined(level.scripted_melee.has_precached) || !level.scripted_melee.has_precached) {
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

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc6d
// Size: 0x149
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
        scripts\engine\sp\utility::add_hint_string("scripted_melee_takedown", %SCRIPTED_MELEE/TAKEDOWN, &function_ec9009fa379356c, 2);
        level.player.var_b16e3ec6b657e398 = 0;
    }
    precachemodel("axis_guide_simple");
    precachemodel("att_vm_p33_me_tac_knife01_v0");
    [[ level.scripted_melee.var_1fc4fd3ef975e8c8 ]]();
    level.scripted_melee.has_precached = 1;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xdbe
// Size: 0x7e
function private function_ec9009fa379356c() {
    if (!getdvarint(@"hash_af4553a66846825b")) {
        level.player.var_b16e3ec6b657e398 = 0;
        return true;
    }
    if (!level.player isscriptedmeleeactive()) {
        level.player.var_b16e3ec6b657e398 = 0;
        return true;
    }
    if (!level.player function_bac81c2c3a5bebe0()) {
        level.player.var_b16e3ec6b657e398 = 0;
        return true;
    }
    return false;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xe45
// Size: 0x86
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

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xed3
// Size: 0x39
function private function_c4dc31621d524849() {
    level notify("scripted_melee_stop");
    level.scripted_melee.enabled = 0;
    scripted_melee_active(0);
    debug_print("scripted_melee disabled: " + gettime());
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xf14
// Size: 0xa0
function private scripted_melee_active(bool) {
    if (bool) {
        if (!self isscriptedmeleeactive()) {
            debug_print("scripted melee code active " + gettime());
            self setscriptedmeleeactive(bool);
        }
        if (utility::issp()) {
            if (self function_bac81c2c3a5bebe0() && !self.var_b16e3ec6b657e398) {
                thread scripts\engine\sp\utility::display_hint_forced("scripted_melee_takedown");
                self.var_b16e3ec6b657e398 = 1;
            }
        }
        return;
    }
    self function_dbf8692a4c239dcf();
    self.var_b16e3ec6b657e398 = 0;
    if (self isscriptedmeleeactive()) {
        debug_print("scripted melee code INactive " + gettime());
        self setscriptedmeleeactive(bool);
    }
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfbc
// Size: 0x64
function private function_5ed0667faa731a14() {
    level endon("scripted_melee_stop");
    self notifyonplayercommand("player_scripted_melee", "+melee_zoom");
    while (true) {
        count = 0;
        self waittill("player_scripted_melee");
        scripted_melee_active(1);
        for (;;) {
            if (self meleebuttonpressed()) {
                count += 1;
            }
            if (count == 12) {
                self notify("player_scripted_melee_hold");
                break;
            }
            waitframe();
        }
    }
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1028
// Size: 0x14a
function private function_47a1953e498454b4() {
    thread function_f31eef930ee6169f();
    level endon("scripted_melee_stop");
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
        waitframe();
    }
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x117a
// Size: 0x80
function private function_f31eef930ee6169f() {
    assert(isplayer(self));
    player = self;
    while (true) {
        player waittill("weapon_change", weapon);
        if (isdefined(weapon) && isdefined(weapon.type) && weapon.type == "riotshield") {
            player.hasriotshieldequipped = 1;
            continue;
        }
        player.hasriotshieldequipped = 0;
    }
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1202
// Size: 0x15a
function private function_631805963060a8e4() {
    level endon("scripted_melee_stop");
    self [[ level.scripted_melee.var_efaa5d51e08521eb ]]();
    victim = self getscriptedmeleetarget();
    if (!isdefined(victim) || !function_c0b5a507e4d35634(self, victim)) {
        return undefined;
    }
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a") && isdefined(victim) && utility::issp()) {
            victimeye = victim gettagorigin("<dev string:x1c>");
            victimorigin = victim gettagorigin("<dev string:x23>");
            dir = vectornormalize(victimeye - self.origin);
            dot = vectordot(dir, anglestoright(victim gettagangles("<dev string:x1c>")));
            debug_print3d(victimeye, "<dev string:x2e>" + abs(dot), (1, 1, 1), 1, 0.05, 1);
            debug_line(victimeye, victimeye + anglestoright(victim gettagangles("<dev string:x1c>")) * 60, (1, 1, 1), 1, 0, 1);
            debug_line(victimorigin, victimorigin + anglestoforward(victim gettagangles("<dev string:x23>")) * 60, (1, 1, 1), 1, 0, 1);
        }
    #/
    return victim;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1365
// Size: 0x413
function private function_56e9e1d5fdd332d8(victim, direction) {
    var_c5c849d37bd876b6 = undefined;
    var_4da2fa57dbc26 = undefined;
    while (true) {
        if (isdefined(victim.var_f145d382dca7f7ee) && array_contains(victim.var_f145d382dca7f7ee, direction) && (isdefined(victim.scripted_melee) && isdefined(victim.scripted_melee.anims_override[direction]) || isdefined(level.scripted_melee.anims_override[direction])) && !isdefined(var_4da2fa57dbc26)) {
            if (isdefined(victim.scripted_melee.anims_override[direction])) {
                array = victim.scripted_melee.anims_override[direction];
            } else {
                array = level.scripted_melee.anims_override[direction];
            }
            if (array.size == 1) {
                if (rules_process(array[0]["rules"], victim)) {
                    break;
                }
                debug_print3d(victim.origin, "Skipping override direction, " + direction + ". " + array[0]["animScene"] + " doesn't pass the rules!", (1, 0, 0), 1, 0.1, 1, "line2");
                var_4da2fa57dbc26 = 1;
                continue;
            }
            break;
        }
        if (isdefined(level.var_f145d382dca7f7ee) && array_contains(level.var_f145d382dca7f7ee, direction) && isdefined(level.scripted_melee.anims_override[direction]) && !isdefined(var_c5c849d37bd876b6)) {
            array = level.scripted_melee.anims_override[direction];
            if (array.size == 1) {
                if (rules_process(array[0]["rules"], victim)) {
                    break;
                }
                debug_print3d(victim.origin, "Skipping override direction, " + direction + ". " + array[0]["animScene"] + " doesn't pass the rules!", (1, 0, 0), 1, 0.1, 1, "line2");
                var_c5c849d37bd876b6 = 1;
                continue;
            }
            break;
        }
        if (!isdefined(level.scripted_melee.anims[direction])) {
            return undefined;
        }
        array = level.scripted_melee.anims[direction];
        break;
    }
    var_5abf35eba9e29a41 = [];
    for (i = 0; i < array.size; i++) {
        if (rules_process(array[i]["rules"], victim)) {
            var_5abf35eba9e29a41 = array_add(var_5abf35eba9e29a41, array[i]["animScene"]);
        }
    }
    if (var_5abf35eba9e29a41.size > 0) {
        var_fabf3a6fdd01a7b2 = [0];
        foreach (i, animScene in var_5abf35eba9e29a41) {
            var_fabf3a6fdd01a7b2[i] = spawnstruct();
            var_fabf3a6fdd01a7b2[i].animation = getanim_from_animname(animScene, "scripted_melee_player_rig");
            var_fabf3a6fdd01a7b2[i].script_key = animScene;
            var_fabf3a6fdd01a7b2[i].var_b9bcc917d46972b = 0.35;
        }
        if (var_fabf3a6fdd01a7b2.size > 4) {
            debug_print("Array too large, reducing!  Size: " + var_fabf3a6fdd01a7b2.size);
            var_fabf3a6fdd01a7b2 = array_slice(var_fabf3a6fdd01a7b2, 0, 4);
        }
        /#
            for (i = 0; i < var_fabf3a6fdd01a7b2.size; i++) {
                debug_print3d(victim.origin, "<dev string:x34>" + var_fabf3a6fdd01a7b2[i].script_key, (0, 1, 0), 1, 0.1, 1, "<dev string:x40>" + i + 2);
            }
        #/
        return var_fabf3a6fdd01a7b2;
    }
    debug_print3d(victim.origin, "NO animScene FOUND!", (1, 0, 0), 1, 0.1, 1, "line2");
    return undefined;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1781
// Size: 0x2fb
function private function_77967a9ef882f668(victim) {
    level endon("scripted_melee_stop");
    tagpos = victim gettagorigin("tag_origin", 1);
    tagangles = victim gettagangles("tag_origin", 1);
    if (!isdefined(tagpos) || !isdefined(tagangles)) {
        return undefined;
    }
    tagright = anglestoright(tagangles);
    tagfwd = anglestoforward(tagangles);
    var_2353ca8656f77e04 = self.origin - tagpos;
    var_2353ca8656f77e04 = (var_2353ca8656f77e04[0], var_2353ca8656f77e04[1], 0);
    var_2353ca8656f77e04 = vectornormalize(var_2353ca8656f77e04);
    dotup = abs(vectordot(tagfwd, (0, 0, 1)));
    if (dotup > 0.7) {
        tagfwd = vectornormalize((tagright[0], tagright[1], 0));
    } else {
        tagfwd = vectornormalize((tagfwd[0], tagfwd[1], 0));
    }
    entfwd = anglestoforward(victim.angles);
    if (vectordot(var_2353ca8656f77e04, entfwd) > vectordot(tagfwd, entfwd)) {
        tagfwd = entfwd;
    }
    tagright = vectorcross(tagfwd, (0, 0, 1));
    dot = vectordot(tagfwd, var_2353ca8656f77e04);
    dotright = vectordot(tagright, var_2353ca8656f77e04);
    if (isdefined(victim.var_d7167e2d68ae05a3)) {
        back_dot = victim.var_d7167e2d68ae05a3;
    } else {
        back_dot = -0.5;
    }
    if (dot < back_dot) {
        if (isalive(victim)) {
            debug_print3d(victim.origin, "direction: back dot: " + dot + " threat: " + victim getthreatsight(self), (0, 1, 0), 1, 0.1, 1, "line1");
        }
        return "back";
    } else if (dot > 0.6) {
        if (isalive(victim)) {
            debug_print3d(victim.origin, "direction: front dot: " + dot + " threat: " + victim getthreatsight(self), (0, 1, 0), 1, 0.1, 1, "line1");
        }
        return "front";
    } else if (dotright > 0) {
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

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1a85
// Size: 0x91
function private function_4122323699a9de19() {
    level endon("scripted_melee_stop");
    while (true) {
        self waittill("animscripted_predicted_entry", victim, victim_parent, victim_origin, var_51e0b68e2cd1ede6, origin_offset, angles_offset, animScene);
        if (self isuseinprogress()) {
            continue;
        }
        if (self isuseavailable()) {
            continue;
        }
        victim thread function_497214b31d3bc138(self, animScene);
        utility::function_6d2d330fc885914c();
    }
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1b1e
// Size: 0x146
function private function_44fe9739a4d6d1db(attacker) {
    if (!isdefined(level.stealth)) {
        return;
    }
    autorange = level.stealth.damage_auto_range;
    sightrange = level.stealth.damage_sight_range;
    if (isdefined(self.stealth) && isdefined(self.stealth.override_damage_auto_range)) {
        autorange = self.stealth.override_damage_auto_range;
    } else if (isdefined(level.stealth.override_damage_auto_range)) {
        autorange = level.stealth.override_damage_auto_range;
    }
    if (isdefined(self.stealth) && isdefined(self.stealth.override_damage_sight_range)) {
        sightrange = self.stealth.override_damage_sight_range;
    } else if (isdefined(level.stealth.override_damage_sight_range)) {
        sightrange = level.stealth.override_damage_sight_range;
    }
    if (isdefined(autorange) && isdefined(sightrange)) {
        function_aad7a0ea8ac4ca23("combat", self, attacker, autorange, sightrange, "scripted_melee");
    }
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1c6c
// Size: 0x85a
function private function_497214b31d3bc138(attacker, animScene) {
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
    self leaveinteraction();
    if (isdefined(level.cap) && isdefined(self findoverridearchetype("animscript"))) {
        self [[ level.cap.fnexit ]]();
        waittillframeend();
    }
    marina_hack = marina_hack(animScene, self);
    anim_ent = spawn_tag_origin();
    if (!istrue(marina_hack)) {
        anim_ent function_5cffe82f5e70231b(1);
    }
    level.scripted_melee.anim_ent = anim_ent;
    parent = self getlinkedparent();
    if (isdefined(attacker.var_e3e345b123304389)) {
        parent = attacker.var_e3e345b123304389;
    }
    anim_stopanimscripted();
    set_scripted_node_angles(attacker, anim_ent);
    anim_ent thread function_9bb1020c719e33b6();
    anim_ent function_ebf301224750c8b8((0, 1, 1), 1000, 10);
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
    victimLives = victim_lives(animScene, self);
    startStance = start_stance(animScene, self);
    endStance = end_stance(animScene, self);
    if (isdefined(self.script_stealthgroup) && !victimLives) {
        scripts\stealth\group::group_removefrompod(self);
    }
    if (isdefined(self) && isalive(self) && !isdefined(self.delayeddeath) && !self.in_melee) {
        thread scripts\common\ai::magic_bullet_shield();
    }
    if (isdefined(self) || isalive(self)) {
        attacker [[ level.scripted_melee.var_3522908002cc5af ]]();
        anim_ent anim_first_frame_solo(attacker.scripted_melee_player_rig, animScene);
        waitframe();
        /#
            if (getdvarint(@"hash_e9e247c60cd8800a")) {
                collision_info = attacker getcollision("<dev string:x45>");
                attacker.scripted_melee_player_rig thread function_4e0638157c0b38d1();
                debug_print3d(attacker.scripted_melee_player_rig gettagorigin(level.scripted_melee.var_dc0788366a9acb40), "<dev string:x4b>" + gettime(), (1, 0, 0), 1, 0.1, 1000);
                debug_line(attacker.scripted_melee_player_rig gettagorigin(level.scripted_melee.var_dc0788366a9acb40), attacker.scripted_melee_player_rig.origin + anglestoforward(attacker.scripted_melee_player_rig.angles) * 100, (1, 0, 0), 1, 0, 1000);
                debug_circle(attacker.scripted_melee_player_rig gettagorigin(level.scripted_melee.var_dc0788366a9acb40), collision_info.capsule_radius, (1, 0, 0), 1, 1, 1000);
            }
        #/
        usePistol = use_pistol(animScene, self);
        meleeweapon = spawn("script_model", attacker.origin);
        if (isdefined(attacker.var_2cd5923c5934a055)) {
            meleeweapon setmodel(attacker.var_2cd5923c5934a055);
        } else if (istrue(usePistol) && isdefined(attacker.var_ef760821473d9172)) {
            meleeweapon utility::make_weapon_model(attacker.var_ef760821473d9172.basename, attacker.var_ef760821473d9172.attachments);
            attacker.scripted_melee_player_rig.var_ef760821473d9172 = meleeweapon;
        } else {
            meleeweapon setmodel("att_vm_p33_me_tac_knife01_v0");
        }
        boneOverride = bone_override(animScene, self);
        meleeweapon notsolid();
        meleeweapon linkto(attacker.scripted_melee_player_rig, boneOverride, (0, 0, 0), (0, 0, 0));
        if (!victimLives) {
            delaythread(5, &death_safety, self);
        }
        self notify("scripted_melee_anim_started");
        attacker notify("scripted_melee_anim_started");
        attacker function_1c96db6d76c91865(self, anim_ent, animScene, startStance);
        if (isdefined(parent)) {
            debug_print("scripted melee linking anim_ent to parent");
            anim_ent linkto(parent);
        }
        self linkto(anim_ent);
        attacker.scripted_melee_player_rig linkto(anim_ent);
        attacker lerpfovscalefactor(0, 0.25);
        var_f4c85a3af01b0120 = getanimlength(getanim(animScene));
        var_4120f65e56b5e799 = getanimlength(attacker.scripted_melee_player_rig getanim(animScene));
        if (var_f4c85a3af01b0120 > var_4120f65e56b5e799) {
            attacker thread notify_delay("scripted_melee_anim_ended_longest", var_f4c85a3af01b0120);
            level delaythread(var_f4c85a3af01b0120, &function_63f4a98a99979090, anim_ent);
            delaythread(var_f4c85a3af01b0120 / 4, &function_44fe9739a4d6d1db, attacker);
        } else {
            attacker thread notify_delay("scripted_melee_anim_ended_longest", var_4120f65e56b5e799);
            level delaythread(var_4120f65e56b5e799, &function_63f4a98a99979090, anim_ent);
            delaythread(var_4120f65e56b5e799 / 4, &function_44fe9739a4d6d1db, attacker);
        }
        thread notify_delay("scripted_melee_anim_ended_victim", var_f4c85a3af01b0120);
        attacker thread notify_delay("scripted_melee_anim_ended", var_4120f65e56b5e799);
        var_ac6d99d19393f2d3 = 1;
        attacker delaycall(var_4120f65e56b5e799 - var_ac6d99d19393f2d3, &lerpfovscalefactor, 1, var_ac6d99d19393f2d3);
        self notify("damage", 0, attacker, undefined, undefined, "MOD_MELEE");
        thread function_121362cf4a7ef895(parent, victimLives);
        attacker thread function_8cff6477a8994cc0(meleeweapon, startStance, endStance);
        anim_ent thread anim_single([self, attacker.scripted_melee_player_rig], animScene);
        if (!istrue(marina_hack)) {
            attacker.scripted_melee_player_rig scripts\common\anim::function_1cb661b457551a3(0);
            delaycall(0.05, &function_5e69fa9cfa2546ec, 15, 18, 37, function_1445e54b6c662c7(), [attacker, attacker.scripted_melee_player_rig], 1);
            attacker.scripted_melee_player_rig delaycall(0.05, &function_5e69fa9cfa2546ec, 15, 18, 37, function_1445e54b6c662c7(), [attacker, self], 1);
        }
    }
    attacker waittill("scripted_melee_anim_ended_longest");
    debug_print("longest melee anim finished");
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x24ce
// Size: 0x159
function private function_121362cf4a7ef895(parent, victimLives) {
    self endon("death");
    level endon("scripted_melee_stop");
    self waittill("scripted_melee_anim_ended_victim");
    if (!victimLives) {
        [[ level.scripted_melee.fndeath ]](self);
        [[ level.scripted_melee.fnragdoll ]](self);
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

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x262f
// Size: 0x153
function private function_8cff6477a8994cc0(meleeweapon, startStance, endStance) {
    self endon("death");
    self waittill("scripted_melee_anim_ended");
    meleeweapon delete();
    self.scripted_melee_player_rig hide();
    if (isdefined(self.scripted_melee_player_rig.var_ef760821473d9172)) {
        self.scripted_melee_player_rig.var_ef760821473d9172 = undefined;
    }
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            collision_info = self getcollision("<dev string:x45>");
            debug_print3d(self.origin + (0, 0, -2), "<dev string:x5e>" + gettime(), (1, 1, 0), 1, 0.1, 1000);
            debug_circle(self.origin, collision_info.capsule_radius, (1, 1, 0), 1, 1, 1000);
        }
    #/
    release_player_from_viewmodel_anim(endStance);
    self [[ level.scripted_melee.var_16a2ad3bccc62bb5 ]]();
    self.scripted_melee_player_rig hide();
    self.in_melee_death = 0;
    self.scripted_melee_player_rig scripts\common\anim::function_1cb661b457551a3(1, self, 0.35);
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x278a
// Size: 0x60
function rules_process(rules, victim) {
    foreach (rule in rules) {
        if (![[ rule ]](self, victim)) {
            return false;
        }
    }
    return true;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27f3
// Size: 0x7b
function rules_default() {
    rules = [&function_ba9cf1dce2684e06, &rule_isalive, &function_f9be8d51b4d903a7, &function_8afeadea083eab3b, &function_1905df1811ca29ec, &function_1b73b9dda428e8ec, &rule_heightdiff, &function_d3c20c23028ba3ea, &function_7383baaf0f1f2a19, &function_1213c4af15671c7b, &function_3f33052faf524462, &function_185b2e98556d16d7];
    return rules;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2877
// Size: 0x1e
function function_b767805ca0e381e() {
    rules = utility::function_33bea9fcd7e7d254([&function_c592df6ec4469c4c]);
    return rules;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x289e
// Size: 0x27
function function_a3356321f4375b10() {
    rules = utility::function_33bea9fcd7e7d254([&function_71a6ec3371d375d, &function_c592df6ec4469c4c]);
    return rules;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28ce
// Size: 0x1e
function function_279a32b2cdce2b2b() {
    rules = utility::function_33bea9fcd7e7d254([&function_71a6ec3371d375d]);
    return rules;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28f5
// Size: 0x27
function function_65931e2cbca86748() {
    rules = utility::function_33bea9fcd7e7d254([&function_652f03ce87e99355, &function_c592df6ec4469c4c]);
    return rules;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2925
// Size: 0x1e
function function_fa7cc1ad28b01833() {
    rules = utility::function_33bea9fcd7e7d254([&function_652f03ce87e99355]);
    return rules;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x294c
// Size: 0x1e
function function_9d501e35f4127f85() {
    rules = utility::function_33bea9fcd7e7d254([&function_5e854e2a4da4f3ff]);
    return rules;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2973
// Size: 0x1e
function function_7e355057c5e32c56() {
    rules = utility::function_33bea9fcd7e7d254([&function_12baf7c107264c30]);
    return rules;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x299a
// Size: 0x27
function function_199c2718c1a3385f() {
    rules = utility::function_33bea9fcd7e7d254([&function_dc5bfb7ce71c284, &function_c592df6ec4469c4c]);
    return rules;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29ca
// Size: 0x1e
function function_fdfbaa517a1c4018() {
    rules = utility::function_33bea9fcd7e7d254([&function_dc5bfb7ce71c284]);
    return rules;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x29f1
// Size: 0x2c
function function_c0b5a507e4d35634(player, victim) {
    if (!isplayer(victim)) {
        return true;
    }
    debug_print("rule_NotIsPlayer failed");
    return false;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a26
// Size: 0x2c
function function_ba9cf1dce2684e06(player, victim) {
    if (!player ismeleeing()) {
        return true;
    }
    debug_print("rule_PlayerNotMeleeing failed");
    return false;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a5b
// Size: 0x2c
function rule_isalive(player, victim) {
    if (isalive(victim)) {
        return true;
    }
    debug_print("rule_IsAlive failed");
    return false;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a90
// Size: 0x2d
function function_1b73b9dda428e8ec(player, victim) {
    if (!victim doinglongdeath()) {
        return true;
    }
    debug_print("rule_NotDoingLongDeath failed");
    return false;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ac6
// Size: 0x41
function function_f9be8d51b4d903a7(player, victim) {
    if (isdefined(victim.var_1a479cad9c3adbb1) && !victim.var_1a479cad9c3adbb1) {
        debug_print("rule_CanScriptedMeleeVictim failed");
        return false;
    }
    return true;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b10
// Size: 0x37
function function_185b2e98556d16d7(player, victim) {
    victimparent = victim getlinkedparent();
    if (isdefined(victimparent)) {
        if (victimparent isvehicle()) {
            return false;
        }
    }
    return true;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b50
// Size: 0x53
function function_8afeadea083eab3b(player, victim) {
    if (!issp()) {
        return true;
    }
    if (isdefined(victim.animtree) && victim.animtree == "generic_human") {
        return true;
    }
    debug_print("rule_HasCorrectAnimtree failed");
    return false;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2bac
// Size: 0x69
function function_1905df1811ca29ec(player, victim) {
    if (isdefined(victim.unittype)) {
        switch (victim.unittype) {
        case #"hash_1403dfb5d1265ddc":
        case #"hash_4ad475e6e15635bd":
        case #"hash_f4a90c6c03d32ee9":
            debug_print("rule_IsValidUnitType failed");
            return false;
        }
    }
    return true;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c1e
// Size: 0x13
function function_bb4d4e9eef766c87(player, victim) {
    
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c39
// Size: 0x13
function function_76d0cdc4bd023d56(player, victim) {
    
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c54
// Size: 0x52
function function_5e854e2a4da4f3ff(player, victim) {
    if (isdefined(victim.fnisinstealthcombat) && victim [[ victim.fnisinstealthcombat ]]()) {
        return false;
    }
    var_3d4b09d94df0885a = function_910a912f327b8d34(player);
    if (var_3d4b09d94df0885a < 1) {
        return true;
    }
    return false;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2caf
// Size: 0x28
function function_12baf7c107264c30(player, victim) {
    debug_print("rule_IsNotStealth failed");
    return !function_5e854e2a4da4f3ff(player, victim);
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce0
// Size: 0x165
function function_d3c20c23028ba3ea(player, victim) {
    weapons = player getweaponslistall();
    var_48aa5d980e9b010 = ["rifle", "sniper", "mg", "smg", "spread", "pistol", "rocketlauncher"];
    var_be8dfb8f9ba78b96 = ["throwingknife"];
    foreach (weapon in weapons) {
        if (isdefined(weapon.classname) && array_contains(var_48aa5d980e9b010, weapon.classname)) {
            return true;
        }
    }
    foreach (weapon in weapons) {
        if (isdefined(weapon.classname) && array_contains(var_be8dfb8f9ba78b96, weapon.classname)) {
            if (player getweaponammostock(weapon) > 0) {
                return true;
            }
        }
    }
    return false;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e4e
// Size: 0x2d
function function_71a6ec3371d375d(player, victim) {
    if (!isdefined(player)) {
        return false;
    }
    if (player getstance() == "stand") {
        return true;
    }
    return false;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e84
// Size: 0x2d
function function_652f03ce87e99355(player, victim) {
    if (!isdefined(player)) {
        return false;
    }
    if (player getstance() == "crouch") {
        return true;
    }
    return false;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2eba
// Size: 0xba
function function_dc5bfb7ce71c284(player, victim) {
    player.var_ef760821473d9172 = undefined;
    if (!isdefined(player)) {
        return false;
    }
    weapons = player getweaponslistprimaries();
    if (!isdefined(weapons)) {
        return false;
    }
    foreach (weapon in weapons) {
        if (weapon.basename == "iw9_pi_golf17_sp" && function_8205eef398b56d03(weapon)) {
            player.var_ef760821473d9172 = weapon;
            return true;
        }
    }
    debug_print("failed, player doesn't have iw9_pi_golf17_sp");
    return false;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f7d
// Size: 0x128
function function_8205eef398b56d03(weapon) {
    var_51dbe1a1c3d8bf04 = function_6527364c1ecca6c6(weapon.basename);
    var_a90071fdf6c09431 = array_remove_array(weapon.attachments, var_51dbe1a1c3d8bf04);
    foreach (attachment in var_a90071fdf6c09431) {
        if (issubstr(attachment, "silen")) {
            debug_print("failed, pistol has silencer: " + attachment);
            return false;
        }
        if (issubstr(attachment, "comp")) {
            debug_print("failed, pistol has comp: " + attachment);
            return false;
        }
        if (issubstr(attachment, "flash")) {
            debug_print("failed, pistol has flash: " + attachment);
            return false;
        }
        if (issubstr(attachment, "stock")) {
            debug_print("failed, pistol has stock: " + attachment);
            return false;
        }
        if (issubstr(attachment, "bar")) {
            debug_print("failed, pistol has barrel: " + attachment);
            return false;
        }
    }
    return true;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x30ae
// Size: 0x4b
function rule_heightdiff(player, victim) {
    diff = abs(victim.origin[2] - player.origin[2]);
    if (diff >= 20) {
        return false;
    }
    return true;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3102
// Size: 0x26
function function_7383baaf0f1f2a19(player, victim) {
    if (player getstance() != "prone") {
        return true;
    }
    return false;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3131
// Size: 0x26
function function_1213c4af15671c7b(player, victim) {
    if (!istrue(victim.var_2c1a52b48212191b)) {
        return true;
    }
    return false;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3160
// Size: 0x26
function function_3f33052faf524462(player, victim) {
    if (!istrue(victim.in_melee)) {
        return true;
    }
    return false;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x318f
// Size: 0x26
function function_c592df6ec4469c4c(player, victim) {
    if (!istrue(victim.bhasriotshieldattached)) {
        return true;
    }
    return false;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x31be
// Size: 0x12
function private function_63f4a98a99979090(anim_ent) {
    anim_ent delete();
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x31d8
// Size: 0x4d
function private notify_delay(snotifystring, fdelay) {
    assert(isdefined(self));
    assert(isdefined(snotifystring));
    assert(isdefined(fdelay));
    self endon("death");
    if (fdelay > 0) {
        wait fdelay;
    }
    if (!isdefined(self)) {
        return;
    }
    self notify(snotifystring);
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x322d
// Size: 0x33
function private anim_stopanimscripted() {
    self stopanimscripted();
    self notify("stop_loop");
    self notify("single anim", "end");
    self notify("looping anim", "end");
    self notify("stop_animmode");
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3268
// Size: 0x1aa
function set_scripted_node_angles(attacker, scripted_node) {
    switch (attacker.var_eab23f9eeb595c1e) {
    case #"hash_4b8799075d3a89b8":
        scripted_node.angles = vectortoangles((attacker.origin[0], attacker.origin[1], 0) - (self.origin[0], self.origin[1], 0));
        break;
    case #"hash_c9b3133a17a3b2d0":
        scripted_node.angles = vectortoangles((attacker.origin[0], attacker.origin[1], 0) - (self.origin[0], self.origin[1], 0)) + (0, -90, 0);
        break;
    case #"hash_96815ce4f2a3dbc5":
        scripted_node.angles = vectortoangles((attacker.origin[0], attacker.origin[1], 0) - (self.origin[0], self.origin[1], 0)) + (0, 90, 0);
        break;
    case #"hash_5163a22eb8c03302":
        scripted_node.angles = vectortoangles((self.origin[0], self.origin[1], 0) - (attacker.origin[0], attacker.origin[1], 0));
        break;
    default:
        break;
    }
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x341a
// Size: 0x3e
function private death_safety(guy) {
    if (isdefined(guy)) {
        if (isalive(guy)) {
            if (isdefined(guy.magic_bullet_shield)) {
                guy scripts\common\ai::stop_magic_bullet_shield();
            }
            println("<dev string:x6f>");
        }
    }
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3460
// Size: 0x1ac
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
        guy scripts\common\ai::stop_magic_bullet_shield();
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

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3614
// Size: 0xb
function function_497a27b31d43d6af(guy) {
    
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3627
// Size: 0xc7
function function_ebea6b350af8fb8d(guy) {
    if (isdefined(level.player.var_ef760821473d9172) && isdefined(guy.var_ef760821473d9172)) {
        startpos = guy.var_ef760821473d9172 gettagorigin("tag_flash", 1);
        magicbullet(level.player.var_ef760821473d9172, startpos, startpos + anglestoforward(guy.var_ef760821473d9172.angles) * 12);
        debug_line(startpos, startpos + anglestoforward(guy.var_ef760821473d9172.angles) * 12, (1, 0, 0), 1, 0, 1000);
    }
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x36f6
// Size: 0xfe
function private release_player_from_viewmodel_anim(endStance) {
    self [[ level.scripted_melee.playerlinkeduselinkedvelocity ]](0);
    self function_af4b9b0f0e7c6c42(0.2);
    self freezecontrols(0);
    self freezelookcontrols(0);
    val::reset_all("scripted_melee");
    if (isdefined(endStance)) {
        if (endStance == "prone") {
            self setstance(endStance, 1, 1, 1);
            up = anglestoup(self.angles);
            new_origin = drop_to_ground(self.origin + up * self getplayerviewheight(self.var_ef6be8803be11754), 0, -60, up);
            self setorigin(new_origin, 1);
        } else {
            self setstance(endStance);
        }
    } else {
        self setstance(self.var_ef6be8803be11754);
    }
    if (isdefined(self.var_fc0b0e5bdda97c8c)) {
        setsaveddvar(@"hash_863a2044d629615", self.var_fc0b0e5bdda97c8c);
    }
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x37fc
// Size: 0x28a
function private function_1c96db6d76c91865(victim, scripted_node, animScene, startStance) {
    prepare_player_for_viewmodel_anim(startStance);
    var_d58d17e0a32ce60b = getstartangles(scripted_node.origin, scripted_node.angles, victim getanim(animScene));
    debug_line(victim.origin, victim.origin + anglestoforward(victim.angles) * 36, (0, 1, 0), 1, 0, 1000);
    debug_line(victim.origin, victim.origin + anglestoforward(var_d58d17e0a32ce60b) * 36, (1, 0, 1), 1, 0, 1000);
    thread function_ebf301224750c8b8((0, 1, 0), 1000, 10);
    debug_print3d(self.origin, "pre melee pos: " + gettime(), (0, 1, 0), 1, 0.1, 1000);
    debug_line(self.origin, self.origin + anglestoforward(self getplayerangles(1)) * 100, (0, 1, 0), 1, 0, 1000);
    blend_time = 0.35;
    rot_ent = victim spawn_tag_origin();
    victim linktoblendtotag(rot_ent, "tag_origin");
    rot_ent rotateto(var_d58d17e0a32ce60b, blend_time, 0.1);
    self.scripted_melee_player_rig aligntag(level.scripted_melee.var_dc0788366a9acb40, self.origin, self.angles);
    marina_hack = marina_hack(animScene, victim);
    if (istrue(marina_hack)) {
        self playerlinktoblend(self.scripted_melee_player_rig, level.scripted_melee.var_dc0788366a9acb40, 0.35, 0.15, 0, 1, 1);
    } else {
        self playerlinktoblend(self.scripted_melee_player_rig, level.scripted_melee.var_dc0788366a9acb40, 0.35, 0.15, 0, 0, 1);
    }
    self [[ level.scripted_melee.playerlinkeduselinkedvelocity ]](1);
    rot_ent delete();
    self.scripted_melee_player_rig show();
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3a8e
// Size: 0xde
function private prepare_player_for_viewmodel_anim(startStance) {
    self.var_ef6be8803be11754 = self getstance();
    if (self isswimming()) {
        self.var_fc0b0e5bdda97c8c = getdvar(@"hash_863a2044d629615");
        setsaveddvar(@"hash_863a2044d629615", 40);
        stance = "crouch";
    } else {
        self.var_fc0b0e5bdda97c8c = undefined;
        stance = "stand";
        if (isdefined(startStance)) {
            stance = startStance;
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

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3b74
// Size: 0x31
function private freeze_controls_when_standing(stance) {
    self endon("death");
    level endon("scripted_melee_stop");
    while (self getstance() != stance) {
        waitframe();
    }
    self freezecontrols(1);
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3bad
// Size: 0x38
function private function_1445e54b6c662c7() {
    contents = ["physicscontents_solid", "physicscontents_playerclip", "physicscontents_characterproxy", "physicscontents_glass"];
    return physics_createcontents(contents);
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3bee
// Size: 0x2ef
function private victim_lives(animScene, victim) {
    if (isdefined(level.scripted_melee.anims_override)) {
        foreach (key in getarraykeys(level.scripted_melee.anims_override)) {
            array = level.scripted_melee.anims_override[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animScene) {
                    return array[i]["victimLives"];
                }
            }
        }
    }
    if (isdefined(self.scripted_melee) && isdefined(self.scripted_melee.anims_override)) {
        foreach (key in getarraykeys(self.scripted_melee.anims_override)) {
            array = self.scripted_melee.anims_override[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animScene) {
                    return array[i]["victimLives"];
                }
            }
        }
    }
    foreach (key in getarraykeys(level.scripted_melee.anims)) {
        array = level.scripted_melee.anims[key];
        for (i = 0; i < array.size; i++) {
            if (array[i]["animScene"] == animScene) {
                return array[i]["victimLives"];
            }
        }
    }
    if (isdefined(victim) && isdefined(victim.scripted_melee) && isdefined(victim.scripted_melee.anims_override)) {
        foreach (key in getarraykeys(victim.scripted_melee.anims_override)) {
            array = victim.scripted_melee.anims_override[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animScene) {
                    return array[i]["victimLives"];
                }
            }
        }
    }
    return 0;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3ee6
// Size: 0x22a
function private start_stance(animScene, victim) {
    if (isdefined(level.scripted_melee.anims_override)) {
        foreach (key in getarraykeys(level.scripted_melee.anims_override)) {
            array = level.scripted_melee.anims_override[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animScene) {
                    return array[i]["startStance"];
                }
            }
        }
    }
    foreach (key in getarraykeys(level.scripted_melee.anims)) {
        array = level.scripted_melee.anims[key];
        for (i = 0; i < array.size; i++) {
            if (array[i]["animScene"] == animScene) {
                return array[i]["startStance"];
            }
        }
    }
    if (isdefined(victim) && isdefined(victim.scripted_melee) && isdefined(victim.scripted_melee.anims_override)) {
        foreach (key in getarraykeys(victim.scripted_melee.anims_override)) {
            array = victim.scripted_melee.anims_override[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animScene) {
                    return array[i]["startStance"];
                }
            }
        }
    }
    return undefined;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4119
// Size: 0x22a
function private end_stance(animScene, victim) {
    if (isdefined(level.scripted_melee.anims_override)) {
        foreach (key in getarraykeys(level.scripted_melee.anims_override)) {
            array = level.scripted_melee.anims_override[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animScene) {
                    return array[i]["endStance"];
                }
            }
        }
    }
    foreach (key in getarraykeys(level.scripted_melee.anims)) {
        array = level.scripted_melee.anims[key];
        for (i = 0; i < array.size; i++) {
            if (array[i]["animScene"] == animScene) {
                return array[i]["endStance"];
            }
        }
    }
    if (isdefined(victim) && isdefined(victim.scripted_melee) && isdefined(victim.scripted_melee.anims_override)) {
        foreach (key in getarraykeys(victim.scripted_melee.anims_override)) {
            array = victim.scripted_melee.anims_override[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animScene) {
                    return array[i]["endStance"];
                }
            }
        }
    }
    return undefined;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x434c
// Size: 0x22a
function private use_pistol(animScene, victim) {
    if (isdefined(level.scripted_melee.anims_override)) {
        foreach (key in getarraykeys(level.scripted_melee.anims_override)) {
            array = level.scripted_melee.anims_override[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animScene) {
                    return array[i]["usePistol"];
                }
            }
        }
    }
    foreach (key in getarraykeys(level.scripted_melee.anims)) {
        array = level.scripted_melee.anims[key];
        for (i = 0; i < array.size; i++) {
            if (array[i]["animScene"] == animScene) {
                return array[i]["usePistol"];
            }
        }
    }
    if (isdefined(victim) && isdefined(victim.scripted_melee) && isdefined(victim.scripted_melee.anims_override)) {
        foreach (key in getarraykeys(victim.scripted_melee.anims_override)) {
            array = victim.scripted_melee.anims_override[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animScene) {
                    return array[i]["usePistol"];
                }
            }
        }
    }
    return undefined;
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x457f
// Size: 0x22e
function private bone_override(animScene, victim) {
    if (isdefined(level.scripted_melee.anims_override)) {
        foreach (key in getarraykeys(level.scripted_melee.anims_override)) {
            array = level.scripted_melee.anims_override[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animScene) {
                    return array[i]["boneOverride"];
                }
            }
        }
    }
    foreach (key in getarraykeys(level.scripted_melee.anims)) {
        array = level.scripted_melee.anims[key];
        for (i = 0; i < array.size; i++) {
            if (array[i]["animScene"] == animScene) {
                return array[i]["boneOverride"];
            }
        }
    }
    if (isdefined(victim) && isdefined(victim.scripted_melee) && isdefined(victim.scripted_melee.anims_override)) {
        foreach (key in getarraykeys(victim.scripted_melee.anims_override)) {
            array = victim.scripted_melee.anims_override[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animScene) {
                    return array[i]["boneOverride"];
                }
            }
        }
    }
    return "TAG_ACCESSORY_RIGHT";
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x47b6
// Size: 0x22a
function private marina_hack(animScene, victim) {
    if (isdefined(level.scripted_melee.anims_override)) {
        foreach (key in getarraykeys(level.scripted_melee.anims_override)) {
            array = level.scripted_melee.anims_override[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animScene) {
                    return array[i]["marina_hack"];
                }
            }
        }
    }
    foreach (key in getarraykeys(level.scripted_melee.anims)) {
        array = level.scripted_melee.anims[key];
        for (i = 0; i < array.size; i++) {
            if (array[i]["animScene"] == animScene) {
                return array[i]["marina_hack"];
            }
        }
    }
    if (isdefined(victim) && isdefined(victim.scripted_melee) && isdefined(victim.scripted_melee.anims_override)) {
        foreach (key in getarraykeys(victim.scripted_melee.anims_override)) {
            array = victim.scripted_melee.anims_override[key];
            for (i = 0; i < array.size; i++) {
                if (array[i]["animScene"] == animScene) {
                    return array[i]["marina_hack"];
                }
            }
        }
    }
    return undefined;
}

/#

    // Namespace scripted_melee / namespace_db6d5eb4a31b23a
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x49e9
    // Size: 0x7b
    function function_7eaecc1fbfd9ad25(player) {
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            self endon("<dev string:xc0>");
            self notify("<dev string:xc6>");
            self endon("<dev string:xc6>");
            while (true) {
                player debug_print3d(self.origin + (0, 0, 70), "<dev string:xe0>", (0.1, 0.1, 1), 1, 0.1, 1, undefined);
                wait 1;
            }
        }
    }

#/

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x4a6c
// Size: 0x53
function private debug_line(start, end, color, alpha, depthtest, duration) {
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            line(start, end, color, alpha, depthtest, duration);
        }
    #/
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ac7
// Size: 0x26
function debug_print(text) {
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            iprintln(text);
        }
    #/
}

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 7, eflags: 0x4
// Checksum 0x0, Offset: 0x4af5
// Size: 0x197
function private debug_print3d(origin, text, color, alpha, scale, duration, offset) {
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            if (!isdefined(offset)) {
                offset = (0, 0, 0);
            } else {
                collision_info = self getcollision(self getstance());
                switch (offset) {
                case #"hash_984692889a47282":
                    offset = (0, 0, 10) + (0, 0, collision_info.capsule_midpoint_height);
                    break;
                case #"hash_984682889a470ef":
                    offset = (0, 0, 8) + (0, 0, collision_info.capsule_midpoint_height);
                    break;
                case #"hash_984672889a46f5c":
                    offset = (0, 0, 6) + (0, 0, collision_info.capsule_midpoint_height);
                    break;
                case #"hash_984662889a46dc9":
                    offset = (0, 0, 4) + (0, 0, collision_info.capsule_midpoint_height);
                    break;
                case #"hash_984652889a46c36":
                    offset = (0, 0, 2) + (0, 0, collision_info.capsule_midpoint_height);
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

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x4c94
// Size: 0x54
function private debug_circle(center, radius, color, alpha, depthtest, duration) {
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            draw_circle(center, radius, color, alpha, depthtest, duration);
        }
    #/
}

/#

    // Namespace scripted_melee / namespace_db6d5eb4a31b23a
    // Params 5, eflags: 0x4
    // Checksum 0x0, Offset: 0x4cf0
    // Size: 0x4a
    function private debug_sphere(origin, radius, color, depthtest, duration) {
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            sphere(origin, radius, color, depthtest, duration);
        }
    }

#/

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x4d42
// Size: 0x39
function private function_ebf301224750c8b8(color, duration, size) {
    /#
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            draw_ent_axis(color, duration, size);
        }
    #/
}

/#

    // Namespace scripted_melee / namespace_db6d5eb4a31b23a
    // Params 4, eflags: 0x4
    // Checksum 0x0, Offset: 0x4d83
    // Size: 0x88
    function private debug_arrow(start, end, color, duration) {
        if (getdvarint(@"hash_e9e247c60cd8800a")) {
            angles = vectortoangles(start - end);
            forward = anglestoforward(angles);
            debug_line(start, end, color, 1, 0, duration);
            debug_line(start, start + forward * 1, (1, 0, 0), 1, 0, duration);
        }
    }

    // Namespace scripted_melee / namespace_db6d5eb4a31b23a
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x4e13
    // Size: 0x73
    function private function_4e0638157c0b38d1() {
        if (getdvarint(@"hash_81840c8f9813a6d3")) {
            self endon("<dev string:xc0>");
            level endon("<dev string:x11c>");
            while (true) {
                debug_arrow(self gettagorigin("<dev string:x12f>"), self gettagorigin("<dev string:x12f>") + anglestoforward(self gettagangles("<dev string:x12f>")) * 10, (0.25, 0.25, 1), 1000);
                wait 0.1;
            }
        }
    }

#/

// Namespace scripted_melee / namespace_db6d5eb4a31b23a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4e8e
// Size: 0x43
function private function_9bb1020c719e33b6() {
    /#
        if (getdvarint(@"hash_81840c8f9813a6d3")) {
            self endon("<dev string:xc0>");
            for (;;) {
                debug_sphere(self.origin, 4, (1, 1, 1), 0, 1);
                waitframe();
            }
        }
    #/
}

