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

// Namespace manager / namespace_42207369e7a21b21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x209
// Size: 0xdf
function main() {
    scripts/smartobjects/utility::init_smartobjects();
    scripts/stealth/manager::main();
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
    level thread scripts/stealth/threat_sight::threat_sight_set_enabled(1);
    level thread manager_thread();
    level thread update_stealth_spotted_thread();
    if (scripts/engine/utility::issharedfuncdefined("stealth", "init")) {
        [[ scripts/engine/utility::getsharedfunc("stealth", "init") ]]();
    }
}

// Namespace manager / namespace_42207369e7a21b21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef
// Size: 0x2a
function function_4fa3c4eb77c24130() {
    if (scripts/engine/utility::issharedfuncdefined("stealth_enemy", "init")) {
        self [[ scripts/engine/utility::getsharedfunc("stealth_enemy", "init") ]]();
    }
}

// Namespace manager / namespace_42207369e7a21b21
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x320
// Size: 0x34
function function_d3110770982eea0e(bspotted) {
    if (scripts/engine/utility::issharedfuncdefined("stealth", "spotted_event_handler")) {
        self [[ scripts/engine/utility::getsharedfunc("stealth", "spotted_event_handler") ]](bspotted);
    }
}

// Namespace manager / namespace_42207369e7a21b21
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x35b
// Size: 0x54
function empty(param_1, param_2, param_3, param_4, param_5, param_6, param_7, param_8, param_9, param_10) {
    
}

// Namespace manager / namespace_42207369e7a21b21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b6
// Size: 0x3
function set_detect_ranges() {
    
}

// Namespace manager / namespace_42207369e7a21b21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c0
// Size: 0x34
function set_corpse_detect_ranges() {
    array["sight_dist"] = 512;
    array["detect_dist"] = 256;
    array["found_dist"] = 128;
    scripts/stealth/corpse::set_corpse_ranges(array);
}

// Namespace manager / namespace_42207369e7a21b21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fb
// Size: 0x352
function function_7e4ce548f5795c03() {
    while (!isdefined(level.stealth)) {
        waitframe();
    }
    hiddenranges["prone"] = 1000;
    hiddenranges["crouch"] = 2000;
    hiddenranges["stand"] = getdvarint(@"hash_113e6612d6e3bb87", 2750);
    var_b6b642cbeff52b88["prone"] = 150;
    var_b6b642cbeff52b88["crouch"] = 350;
    var_b6b642cbeff52b88["stand"] = 600;
    hiddenranges["shadow_prone"] = 0.05;
    hiddenranges["shadow_crouch"] = 0.05;
    hiddenranges["shadow_stand"] = 0.3;
    spottedranges["prone"] = 1500;
    spottedranges["crouch"] = 2500;
    spottedranges["stand"] = getdvarint(@"hash_4689de43493d4968", 3250);
    var_d0f35fc0a5c3df79["prone"] = 250;
    var_d0f35fc0a5c3df79["crouch"] = 1000;
    var_d0f35fc0a5c3df79["stand"] = 1800;
    spottedranges["shadow_prone"] = 0.01;
    spottedranges["shadow_crouch"] = 0.02;
    spottedranges["shadow_stand"] = 0.38;
    var_8f3f480583606401["prone"] = 1.1;
    var_8f3f480583606401["crouch"] = 1.15;
    var_8f3f480583606401["stand"] = 1.2;
    var_fac370d058479827["prone"] = 0;
    var_fac370d058479827["crouch"] = 0;
    var_fac370d058479827["stand"] = 0;
    var_fb574b7959625bf0["prone"] = 0;
    var_fb574b7959625bf0["crouch"] = 0;
    var_fb574b7959625bf0["stand"] = 0;
    scripts/stealth/utility::set_detect_ranges(hiddenranges, spottedranges, var_8f3f480583606401);
    scripts/stealth/utility::set_min_detect_range_darkness(var_b6b642cbeff52b88, var_d0f35fc0a5c3df79);
    scripts/stealth/utility::function_f3883fe06a11269(var_fac370d058479827, var_fb574b7959625bf0);
    if (!isdefined(level.gamemodebundle) || istrue(level.gamemodebundle.var_f8c2703e1020ada0)) {
        event_distances["spotted"]["explosion"] = getdvarint(@"hash_a164303e1057f68b", 3000);
        event_distances["hidden"]["explosion"] = getdvarint(@"hash_4ff0d45555734622", 2500);
        event_distances["spotted"]["gunshot"] = getdvarint(@"hash_816440654797aa4e", 2500);
        event_distances["hidden"]["gunshot"] = getdvarint(@"hash_af518075d89400d", 2500);
        event_distances["spotted"]["gunshot_teammate"] = getdvarint(@"hash_57ad54b68036f52a", 2500);
        event_distances["hidden"]["gunshot_teammate"] = getdvarint(@"hash_ec133bcfe15d64f9", 2500);
        event_distances["spotted"]["footstep"] = 128;
        event_distances["hidden"]["footstep"] = getdvarint(@"hash_5110fbb11d551c74", 64);
        event_distances["spotted"]["footstep_walk"] = 512;
        event_distances["hidden"]["footstep_walk"] = getdvarint(@"hash_9300acad842264a5", 256);
        event_distances["spotted"]["footstep_sprint"] = 768;
        event_distances["hidden"]["footstep_sprint"] = getdvarint(@"hash_42b014df24f71fa", 512);
        scripts/stealth/manager::set_custom_distances(event_distances);
    }
    if (isdefined(level.var_2921e9fc2c12207c)) {
        [[ level.var_2921e9fc2c12207c ]]();
    }
}

// Namespace manager / namespace_42207369e7a21b21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x754
// Size: 0x73
function manager_thread() {
    while (true) {
        flag_wait("stealth_enabled");
        threat_sight_set_dvar(1);
        flag_wait("stealth_spotted");
        if (!flag("stealth_enabled")) {
            continue;
        }
        scripts/stealth/manager::event_change("spotted");
        flag_waitopen("stealth_spotted");
        if (!flag("stealth_enabled")) {
            continue;
        }
        scripts/stealth/manager::event_change("hidden");
        waittillframeend();
    }
}

// Namespace manager / namespace_42207369e7a21b21
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ce
// Size: 0x2a
function threat_sight_set_dvar(enabled) {
    if (enabled && !function_7a21aa652f0613b0()) {
        return;
    }
    setdvar(@"hash_a9f8dfe902285d4a", enabled);
}

// Namespace manager / namespace_42207369e7a21b21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ff
// Size: 0x1e1
function update_stealth_spotted_thread() {
    waitframe();
    wasspotted = 0;
    while (true) {
        bspotted = scripts/stealth/manager::anyone_in_combat();
        if (bspotted) {
            if (!wasspotted && isdefined(level.stealth.stealth_spotted_delay) && level.stealth.stealth_spotted_delay > 0) {
                wait(level.stealth.stealth_spotted_delay);
                if (!scripts/stealth/manager::anyone_in_combat()) {
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
                        var_f950051ecb0cd613 = player scripts/stealth/utility::get_group_flagname("stealth_spotted");
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
                    var_f950051ecb0cd613 = player scripts/stealth/utility::get_group_flagname("stealth_spotted");
                    flag_clear(var_f950051ecb0cd613);
                }
            }
        }
        wasspotted = bspotted;
        waitframe();
    }
}

// Namespace manager / namespace_42207369e7a21b21
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

// Namespace manager / namespace_42207369e7a21b21
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa3
// Size: 0x1cb
function monitor_death_thread(rangeauto, rangesight) {
    other = undefined;
    team = self.team;
    if (isdefined(self.stealth.override_damage_auto_range)) {
        rangeauto = self.stealth.override_damage_auto_range;
    } else if (isdefined(level.stealth.override_damage_auto_range)) {
        rangeauto = level.stealth.override_damage_auto_range;
    }
    if (isdefined(self.stealth.override_damage_sight_range)) {
        rangesight = self.stealth.override_damage_sight_range;
    } else if (isdefined(level.stealth.override_damage_sight_range)) {
        rangesight = level.stealth.override_damage_sight_range;
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
        function_aad7a0ea8ac4ca23("ally_killed", self, other, rangeauto, rangesight);
    }
}

// Namespace manager / namespace_42207369e7a21b21
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

