// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_5af9038262d22c96;
#using scripts\smartobjects\utility.gsc;
#using scripts\stealth\manager.gsc;
#using script_35de402efc5acfb3;
#using scripts\stealth\threat_sight.gsc;
#using scripts\stealth\corpse.gsc;
#using scripts\stealth\utility.gsc;

#namespace manager;

// Namespace manager/namespace_42207369e7a21b21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x209
// Size: 0xdf
function main() {
    namespace_277f7d3daf8f1a98::init_smartobjects();
    namespace_833595e973766257::main();
    /#
        assertex(isdefined(level.stealth), "level.stealth should have been defined in scriptsstealthmanager::main()");
    #/
    level.stealth.fnaddeventplaybcs = &namespace_378f8281e2d12ced::addeventplaybcs;
    level.fngetcorpsearrayfunc = &get_corpse_array;
    level.stealth.fngetplayerdrone = &get_player_drone;
    level.var_4fa3c4eb77c24130 = &function_4fa3c4eb77c24130;
    level.var_c5e87dfa7679b0a5 = &function_d3110770982eea0e;
    level thread function_7e4ce548f5795c03();
    set_detect_ranges();
    set_corpse_detect_ranges();
    level thread namespace_76383ca64b36529e::threat_sight_set_enabled(1);
    level thread manager_thread();
    level thread update_stealth_spotted_thread();
    if (namespace_3c37cb17ade254d::issharedfuncdefined("stealth", "init")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("stealth", "init") ]]();
    }
}

// Namespace manager/namespace_42207369e7a21b21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef
// Size: 0x2a
function function_4fa3c4eb77c24130() {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("stealth_enemy", "init")) {
        self [[ namespace_3c37cb17ade254d::getsharedfunc("stealth_enemy", "init") ]]();
    }
}

// Namespace manager/namespace_42207369e7a21b21
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x320
// Size: 0x34
function function_d3110770982eea0e(var_65661ae3a873c9ae) {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("stealth", "spotted_event_handler")) {
        self [[ namespace_3c37cb17ade254d::getsharedfunc("stealth", "spotted_event_handler") ]](var_65661ae3a873c9ae);
    }
}

// Namespace manager/namespace_42207369e7a21b21
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x35b
// Size: 0x54
function empty(param_1, param_2, param_3, param_4, param_5, param_6, var_59a077fa10aa3b9c, var_59a07efa10aa4b01, var_59a07dfa10aa48ce, var_c61a7af2a6570232) {
    
}

// Namespace manager/namespace_42207369e7a21b21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b6
// Size: 0x3
function set_detect_ranges() {
    
}

// Namespace manager/namespace_42207369e7a21b21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c0
// Size: 0x34
function set_corpse_detect_ranges() {
    array["sight_dist"] = 512;
    array["detect_dist"] = 256;
    array["found_dist"] = 128;
    namespace_70203d71cdb728fc::set_corpse_ranges(array);
}

// Namespace manager/namespace_42207369e7a21b21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fb
// Size: 0x352
function function_7e4ce548f5795c03() {
    while (!isdefined(level.stealth)) {
        waitframe();
    }
    var_7dc093fb71342953["prone"] = 1000;
    var_7dc093fb71342953["crouch"] = 2000;
    var_7dc093fb71342953["stand"] = getdvarint(@"hash_113e6612d6e3bb87", 2750);
    var_b6b642cbeff52b88["prone"] = 150;
    var_b6b642cbeff52b88["crouch"] = 350;
    var_b6b642cbeff52b88["stand"] = 600;
    var_7dc093fb71342953["shadow_prone"] = 0.05;
    var_7dc093fb71342953["shadow_crouch"] = 0.05;
    var_7dc093fb71342953["shadow_stand"] = 0.3;
    var_3b0034eb96b13650["prone"] = 1500;
    var_3b0034eb96b13650["crouch"] = 2500;
    var_3b0034eb96b13650["stand"] = getdvarint(@"hash_4689de43493d4968", 3250);
    var_d0f35fc0a5c3df79["prone"] = 250;
    var_d0f35fc0a5c3df79["crouch"] = 1000;
    var_d0f35fc0a5c3df79["stand"] = 1800;
    var_3b0034eb96b13650["shadow_prone"] = 0.01;
    var_3b0034eb96b13650["shadow_crouch"] = 0.02;
    var_3b0034eb96b13650["shadow_stand"] = 0.38;
    var_8f3f480583606401["prone"] = 1.1;
    var_8f3f480583606401["crouch"] = 1.15;
    var_8f3f480583606401["stand"] = 1.2;
    var_fac370d058479827["prone"] = 0;
    var_fac370d058479827["crouch"] = 0;
    var_fac370d058479827["stand"] = 0;
    var_fb574b7959625bf0["prone"] = 0;
    var_fb574b7959625bf0["crouch"] = 0;
    var_fb574b7959625bf0["stand"] = 0;
    namespace_e124d8b75dab4be0::set_detect_ranges(var_7dc093fb71342953, var_3b0034eb96b13650, var_8f3f480583606401);
    namespace_e124d8b75dab4be0::set_min_detect_range_darkness(var_b6b642cbeff52b88, var_d0f35fc0a5c3df79);
    namespace_e124d8b75dab4be0::function_f3883fe06a11269(var_fac370d058479827, var_fb574b7959625bf0);
    if (!isdefined(level.var_1a2b600a06ec21f4) || istrue(level.var_1a2b600a06ec21f4.var_f8c2703e1020ada0)) {
        var_4e4f703e8ea149c["spotted"]["explosion"] = getdvarint(@"hash_a164303e1057f68b", 3000);
        var_4e4f703e8ea149c["hidden"]["explosion"] = getdvarint(@"hash_4ff0d45555734622", 2500);
        var_4e4f703e8ea149c["spotted"]["gunshot"] = getdvarint(@"hash_816440654797aa4e", 2500);
        var_4e4f703e8ea149c["hidden"]["gunshot"] = getdvarint(@"hash_af518075d89400d", 2500);
        var_4e4f703e8ea149c["spotted"]["gunshot_teammate"] = getdvarint(@"hash_57ad54b68036f52a", 2500);
        var_4e4f703e8ea149c["hidden"]["gunshot_teammate"] = getdvarint(@"hash_ec133bcfe15d64f9", 2500);
        var_4e4f703e8ea149c["spotted"]["footstep"] = 128;
        var_4e4f703e8ea149c["hidden"]["footstep"] = getdvarint(@"hash_5110fbb11d551c74", 64);
        var_4e4f703e8ea149c["spotted"]["footstep_walk"] = 512;
        var_4e4f703e8ea149c["hidden"]["footstep_walk"] = getdvarint(@"hash_9300acad842264a5", 256);
        var_4e4f703e8ea149c["spotted"]["footstep_sprint"] = 768;
        var_4e4f703e8ea149c["hidden"]["footstep_sprint"] = getdvarint(@"hash_42b014df24f71fa", 512);
        namespace_833595e973766257::set_custom_distances(var_4e4f703e8ea149c);
    }
    if (isdefined(level.var_2921e9fc2c12207c)) {
        [[ level.var_2921e9fc2c12207c ]]();
    }
}

// Namespace manager/namespace_42207369e7a21b21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x754
// Size: 0x73
function manager_thread() {
    while (1) {
        flag_wait("stealth_enabled");
        threat_sight_set_dvar(1);
        flag_wait("stealth_spotted");
        if (!flag("stealth_enabled")) {
            continue;
        }
        namespace_833595e973766257::event_change("spotted");
        flag_waitopen("stealth_spotted");
        if (!flag("stealth_enabled")) {
            continue;
        }
        namespace_833595e973766257::event_change("hidden");
        waittillframeend();
    }
}

// Namespace manager/namespace_42207369e7a21b21
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ce
// Size: 0x2a
function threat_sight_set_dvar(enabled) {
    if (enabled && !function_7a21aa652f0613b0()) {
        return;
    }
    setdvar(@"hash_a9f8dfe902285d4a", enabled);
}

// Namespace manager/namespace_42207369e7a21b21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ff
// Size: 0x1e1
function update_stealth_spotted_thread() {
    waitframe();
    var_5560c6a46094816f = 0;
    while (1) {
        var_65661ae3a873c9ae = namespace_833595e973766257::anyone_in_combat();
        if (var_65661ae3a873c9ae) {
            if (!var_5560c6a46094816f && isdefined(level.stealth.stealth_spotted_delay) && level.stealth.stealth_spotted_delay > 0) {
                wait(level.stealth.stealth_spotted_delay);
                if (!namespace_833595e973766257::anyone_in_combat()) {
                    waitframe();
                    continue;
                }
            }
            if (!flag("stealth_spotted")) {
                flag_set("stealth_spotted");
                foreach (player in level.players) {
                    if (isdefined(player.stealth)) {
                        if (isdefined(level.var_c5e87dfa7679b0a5)) {
                            player [[ level.var_c5e87dfa7679b0a5 ]](1);
                        }
                        var_f950051ecb0cd613 = player namespace_e124d8b75dab4be0::get_group_flagname("stealth_spotted");
                        flag_set(var_f950051ecb0cd613);
                    }
                }
            }
        } else if (flag("stealth_spotted")) {
            flag_clear("stealth_spotted");
            foreach (player in level.players) {
                if (isdefined(player.stealth)) {
                    if (isdefined(level.var_c5e87dfa7679b0a5)) {
                        player [[ level.var_c5e87dfa7679b0a5 ]](0);
                    }
                    var_f950051ecb0cd613 = player namespace_e124d8b75dab4be0::get_group_flagname("stealth_spotted");
                    flag_clear(var_f950051ecb0cd613);
                }
            }
        }
        var_5560c6a46094816f = var_65661ae3a873c9ae;
        waitframe();
    }
}

// Namespace manager/namespace_42207369e7a21b21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e7
// Size: 0xb4
function get_corpse_array() {
    if (!isdefined(level.stealth.corpses)) {
        return [];
    }
    foreach (i, v in level.stealth.corpses) {
        if (!isdefined(level.stealth.corpses[i])) {
            level.stealth.corpses[i] = undefined;
        }
    }
    return level.stealth.corpses;
}

// Namespace manager/namespace_42207369e7a21b21
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa3
// Size: 0x1cb
function monitor_death_thread(var_448a418e975e9b01, var_6a01daab475b44ab) {
    other = undefined;
    team = self.team;
    if (isdefined(self.stealth.override_damage_auto_range)) {
        var_448a418e975e9b01 = self.stealth.override_damage_auto_range;
    } else if (isdefined(level.stealth.override_damage_auto_range)) {
        var_448a418e975e9b01 = level.stealth.override_damage_auto_range;
    }
    if (isdefined(self.stealth.override_damage_sight_range)) {
        var_6a01daab475b44ab = self.stealth.override_damage_sight_range;
    } else if (isdefined(level.stealth.override_damage_sight_range)) {
        var_6a01daab475b44ab = level.stealth.override_damage_sight_range;
    }
    self waittill("death");
    body = self getcorpseentity();
    if (isdefined(body)) {
        level.stealth.corpses[body getentitynumber()] = body;
    }
    if (!isdefined(self.lastattacker)) {
        return;
    }
    other = self.lastattacker;
    if (!isplayer(other) && (!isdefined(other.owner) || !isplayer(other.owner))) {
        return;
    }
    if (isdefined(other.owner)) {
        other = other.owner;
    }
    if (!isdefined(other.team) || other.team == team) {
        return;
    }
    if (function_f0aa68306165f368(self.damagemod)) {
        function_aad7a0ea8ac4ca23("ally_killed", self, other, var_448a418e975e9b01, var_6a01daab475b44ab);
    }
}

// Namespace manager/namespace_42207369e7a21b21
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc75
// Size: 0x43
function get_player_drone(player) {
    if (isdefined(player.scout_drone)) {
        return player.scout_drone;
    }
    if (isdefined(player.emp_drone)) {
        return player.emp_drone;
    }
    return undefined;
}

