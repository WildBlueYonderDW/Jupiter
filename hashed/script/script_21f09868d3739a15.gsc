#using scripts\engine\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\vehicle\vehicle_common.gsc;
#using scripts\asm\soldier\vehicle.gsc;

#namespace namespace_df392a06b5c03994;

// Namespace namespace_df392a06b5c03994 / namespace_457defbc8d30c83b
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x111
// Size: 0xae
function function_b79072899c47456e(a_ai_allies, var_d1f4d0d1fc013b1f, var_80b768f6f5758e24, var_cd8bc43698a828cc, var_352a8978dcbaa34c, var_a4365597f945dcfd, var_7457e67b7a059a97, var_5f615c979fc694e4, var_2bacd2f368c003e9, var_2f4643efe82e3a06) {
    foreach (var_43ae47166002602a in a_ai_allies) {
        thread setup(var_43ae47166002602a, var_d1f4d0d1fc013b1f, var_80b768f6f5758e24, var_cd8bc43698a828cc, var_352a8978dcbaa34c, var_a4365597f945dcfd, var_7457e67b7a059a97, var_5f615c979fc694e4, var_2bacd2f368c003e9, var_2f4643efe82e3a06);
        waitframe();
    }
}

// Namespace namespace_df392a06b5c03994 / namespace_457defbc8d30c83b
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1c7
// Size: 0x115
function setup(var_43ae47166002602a, var_d1f4d0d1fc013b1f, var_80b768f6f5758e24, var_cd8bc43698a828cc, var_352a8978dcbaa34c, var_a4365597f945dcfd, var_7457e67b7a059a97, var_5f615c979fc694e4, var_2bacd2f368c003e9, var_2f4643efe82e3a06) {
    setdvar(@"hash_6fce5c3eda16a53a", 0);
    var_43ae47166002602a notify("terminate_color_wait");
    var_43ae47166002602a notify("buddy_follow_stop");
    var_43ae47166002602a endon("buddy_follow_stop");
    var_43ae47166002602a endon("death");
    var_43ae47166002602a thread function_ff820502f10e71b();
    var_5f615c979fc694e4 = default_to(var_5f615c979fc694e4, 5);
    if (!isdefined(var_d1f4d0d1fc013b1f)) {
        var_d1f4d0d1fc013b1f = "flag_buddy_follow";
        if (!flag_exist(var_d1f4d0d1fc013b1f)) {
            flag_init(var_d1f4d0d1fc013b1f);
        }
        flag_set(var_d1f4d0d1fc013b1f);
    }
    if (!flag_exist(var_d1f4d0d1fc013b1f)) {
        flag_init(var_d1f4d0d1fc013b1f);
    }
    while (true) {
        level flag_wait(var_d1f4d0d1fc013b1f);
        thread function_a73b25993f1f75da(var_43ae47166002602a, var_80b768f6f5758e24, var_cd8bc43698a828cc, var_352a8978dcbaa34c, var_a4365597f945dcfd, var_7457e67b7a059a97, var_2bacd2f368c003e9, var_2f4643efe82e3a06);
        wait var_5f615c979fc694e4;
        level flag_waitopen(var_d1f4d0d1fc013b1f);
        thread disable(var_43ae47166002602a);
        wait var_5f615c979fc694e4;
    }
}

// Namespace namespace_df392a06b5c03994 / namespace_457defbc8d30c83b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e4
// Size: 0x5d
function function_1660f7af3460d5db(a_ai_allies, var_80b768f6f5758e24) {
    foreach (var_43ae47166002602a in a_ai_allies) {
        var_43ae47166002602a function_ac01edbfe5d3d077(var_80b768f6f5758e24);
    }
}

// Namespace namespace_df392a06b5c03994 / namespace_457defbc8d30c83b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x349
// Size: 0x15
function function_ac01edbfe5d3d077(var_80b768f6f5758e24) {
    self.var_80b768f6f5758e24 = var_80b768f6f5758e24;
}

// Namespace namespace_df392a06b5c03994 / namespace_457defbc8d30c83b
// Params 8, eflags: 0x4
// Checksum 0x0, Offset: 0x366
// Size: 0x7c
function private function_a73b25993f1f75da(var_43ae47166002602a, var_80b768f6f5758e24, var_cd8bc43698a828cc, var_352a8978dcbaa34c, var_a4365597f945dcfd, var_7457e67b7a059a97, var_2bacd2f368c003e9, var_2f4643efe82e3a06) {
    var_43ae47166002602a endon("buddy_follow_stop");
    var_43ae47166002602a endon("death");
    var_43ae47166002602a enable_ai_color();
    waitframe();
    var_43ae47166002602a.fixednode = 0;
    var_43ae47166002602a thread function_a9b3b52ffeb476da(var_80b768f6f5758e24, var_cd8bc43698a828cc, var_352a8978dcbaa34c, var_a4365597f945dcfd, var_7457e67b7a059a97, var_2bacd2f368c003e9, var_2f4643efe82e3a06);
}

// Namespace namespace_df392a06b5c03994 / namespace_457defbc8d30c83b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ea
// Size: 0x29
function disable(var_43ae47166002602a) {
    var_43ae47166002602a endon("buddy_follow_stop");
    var_43ae47166002602a endon("death");
    var_43ae47166002602a notify("buddy_follow_reset_color");
    var_43ae47166002602a enable_ai_color();
}

// Namespace namespace_df392a06b5c03994 / namespace_457defbc8d30c83b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x41b
// Size: 0x1f
function private function_ff820502f10e71b() {
    self endon("death");
    self endon("terminate_color_wait");
    self waittill("buddy_follow_stop");
    enable_ai_color();
}

// Namespace namespace_df392a06b5c03994 / namespace_457defbc8d30c83b
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x442
// Size: 0x2f9
function private function_7b8369bf4c4adb52(var_92014f68e9eb95bb, var_fe84fb5eb432eac6) {
    var_c5942556f6e977e0 = 0.5;
    var_7b8369bf4c4adb52 = level.player.origin;
    var_9717d7e4af0884e7 = level.player ent_flag("stealth_enabled") && isdefined(level.player.stealth) && isdefined(level.player.stealth.combatstate) && (level.player.stealth.combatstate.name == "stealth" || level.player.stealth.combatstate.name == "combat" && level.player.stealth.combatstate.type == "unaware");
    if (istrue(var_9717d7e4af0884e7) && isdefined(self.var_efa08cbe555cb7b7)) {
        var_9f9c9b0fa70acc79 = vectornormalize2(self.var_efa08cbe555cb7b7 - level.player.origin);
        var_8f6f4e75ab8411bb = anglestoforward(level.player.angles);
        var_e8eab8a46dea3197 = 0;
        moving = 1;
        if (vectordot2(var_9f9c9b0fa70acc79, var_8f6f4e75ab8411bb) > var_c5942556f6e977e0) {
            var_e8f4903f044be1ef = vectornormalize(var_9f9c9b0fa70acc79 + var_8f6f4e75ab8411bb);
            var_7b8369bf4c4adb52 = level.player.origin - var_e8f4903f044be1ef * var_92014f68e9eb95bb;
            var_e8eab8a46dea3197 = 1;
        }
        if (!var_e8eab8a46dea3197 || distance(self.origin, var_7b8369bf4c4adb52) > var_fe84fb5eb432eac6) {
            var_6cb48d65c9feac82 = vectornormalize2(level.player.origin - self.origin);
            var_7b8369bf4c4adb52 = level.player.origin - var_6cb48d65c9feac82 * var_92014f68e9eb95bb;
        }
        if (distancesquared(var_7b8369bf4c4adb52, level.player.origin) > distancesquared(self.origin, level.player.origin)) {
            var_7b8369bf4c4adb52 = self.origin;
            moving = 0;
        }
        if (moving) {
            enemies = getaiarrayinradius(var_7b8369bf4c4adb52, var_fe84fb5eb432eac6);
            if (enemies.size > 0) {
                var_7b8369bf4c4adb52 = self.origin;
                moving = 0;
            }
        }
    }
    /#
        if (getdvarint(@"hash_6fce5c3eda16a53a", 0)) {
            sphere(var_7b8369bf4c4adb52, 300, (1, 1, 0), 0, 20);
        }
    #/
    return var_7b8369bf4c4adb52;
}

// Namespace namespace_df392a06b5c03994 / namespace_457defbc8d30c83b
// Params 7, eflags: 0x4
// Checksum 0x0, Offset: 0x744
// Size: 0x93f
function private function_a9b3b52ffeb476da(var_80b768f6f5758e24, var_cd8bc43698a828cc, var_352a8978dcbaa34c, var_a4365597f945dcfd, var_7457e67b7a059a97, var_2bacd2f368c003e9, var_2f4643efe82e3a06) {
    self endon("buddy_follow_stop");
    self endon("death");
    self endon("buddy_follow_reset_color");
    if (!isdefined(var_cd8bc43698a828cc)) {
        var_cd8bc43698a828cc = 300;
    }
    if (!isdefined(var_352a8978dcbaa34c)) {
        var_352a8978dcbaa34c = 500;
    }
    if (!isdefined(var_a4365597f945dcfd)) {
        var_a4365597f945dcfd = 100;
    }
    if (!isdefined(var_2bacd2f368c003e9)) {
        var_2bacd2f368c003e9 = 500;
    }
    if (!isdefined(var_2f4643efe82e3a06)) {
        var_2f4643efe82e3a06 = 500;
    }
    if (isdefined(var_80b768f6f5758e24)) {
        self.var_efa08cbe555cb7b7 = var_80b768f6f5758e24;
    } else {
        self.var_efa08cbe555cb7b7 = undefined;
    }
    set_goal_radius(var_cd8bc43698a828cc);
    var_31b07a6da1f527dd = var_cd8bc43698a828cc * var_cd8bc43698a828cc;
    var_96d01425dddb9157 = var_352a8978dcbaa34c * var_352a8978dcbaa34c;
    var_483ce96ebcb45635 = var_2bacd2f368c003e9 * var_2bacd2f368c003e9;
    var_f7f875896c86568b = var_2f4643efe82e3a06 * var_2f4643efe82e3a06;
    var_73e27a81a22f4ae = var_a4365597f945dcfd * var_a4365597f945dcfd;
    self.var_bbc91b82b805637b = 0;
    childthread function_4d76760fa4973094(2, 300, var_2bacd2f368c003e9);
    /#
        childthread function_b2e2745e9fab4f1c(var_a4365597f945dcfd);
    #/
    node = undefined;
    while (true) {
        if (isnotinvehicle()) {
            var_fe84fb5eb432eac6 = var_cd8bc43698a828cc;
            var_4dbbca3f9a168ae0 = var_31b07a6da1f527dd;
            var_64c8bd1651cd31a7 = var_96d01425dddb9157;
            var_2cd8ca365c32ca56 = level.player ent_flag("stealth_enabled") && isdefined(level.player.stealth) && isdefined(level.player.stealth.combatstate) && level.player.stealth.combatstate.name == "stealth";
            if (istrue(var_2cd8ca365c32ca56) && isdefined(self.var_efa08cbe555cb7b7)) {
            }
            /#
                if (!isdefined(node)) {
                    self.status = "<dev string:x1c>";
                }
            #/
            node = undefined;
            var_9defb6028e9d42fb = function_7b8369bf4c4adb52(var_2bacd2f368c003e9, var_fe84fb5eb432eac6);
            a_nodes = getnodesinradius(var_9defb6028e9d42fb, var_fe84fb5eb432eac6, 16);
            if (isdefined(self.var_efa08cbe555cb7b7)) {
                a_nodes = sortbydistance(a_nodes, self.var_efa08cbe555cb7b7);
                if (istrue(var_2cd8ca365c32ca56)) {
                    a_nodes = array_reverse(a_nodes);
                }
            }
            var_37a68002a667c6ec = 0;
            while (!isdefined(node) && var_37a68002a667c6ec < 10 && isnotinvehicle()) {
                if (isdefined(self.var_efa08cbe555cb7b7)) {
                    /#
                        if (getdvarint(@"hash_6fce5c3eda16a53a", 0)) {
                            print3d(self.var_efa08cbe555cb7b7, "<dev string:x22>", (1, 0, 0), 1, 1, 100);
                        }
                    #/
                    /#
                        if (getdvarint(@"hash_6fce5c3eda16a53a", 0)) {
                            foreach (node in a_nodes) {
                                print3d(node.origin, "<dev string:x22>", (0, 0, 1), 1, 1, 100);
                            }
                        }
                    #/
                    node = a_nodes[0];
                    i = 0;
                    while (isnotinvehicle() && isdefined(node) && i < a_nodes.size) {
                        var_435b9e05bc66894a = 0;
                        if (isdefined(node.script_noteworthy) && isdefined(var_7457e67b7a059a97)) {
                            var_cc46cae885d1e678 = strtok(node.script_noteworthy, ",");
                            if (var_cc46cae885d1e678.size > 0) {
                                foreach (str_script_noteworthy in var_cc46cae885d1e678) {
                                    if (str_script_noteworthy == var_7457e67b7a059a97) {
                                        var_435b9e05bc66894a = 1;
                                        break;
                                    }
                                }
                            }
                        }
                        if (!var_435b9e05bc66894a) {
                            if (!isnodeoccupied(node)) {
                                break;
                            } else if (isnodeoccupied(node) && isdefined(getnodeowner(node)) && getnodeowner(node) == self) {
                                break;
                            }
                        }
                        i++;
                        node = a_nodes[i];
                        waitframe();
                    }
                    /#
                        if (isdefined(node) && getdvarint(@"hash_6fce5c3eda16a53a", 0)) {
                            print3d(node.origin + (0, 0, 32), "<dev string:x22>", (1, 0, 0), 1, 1, 100);
                        }
                    #/
                } else if (var_37a68002a667c6ec < 7.14286) {
                    node = self findbestcovernode(undefined, undefined, var_9defb6028e9d42fb);
                } else {
                    node = self findbestcovernode(undefined, 1, var_9defb6028e9d42fb, 1);
                }
                var_37a68002a667c6ec++;
                if (!isdefined(node) || distance2dsquared(level.player getorigin(), node.origin) > var_4dbbca3f9a168ae0) {
                    /#
                        if (isdefined(node) && getdvarint(@"hash_6fce5c3eda16a53a", 0)) {
                            sphere(node.origin, 6, (1, 0, 0), 0, 20);
                            line(node.origin, self.origin, (1, 0, 0), 1, 0, 20);
                        }
                    #/
                    node = undefined;
                    self.claimed_node = undefined;
                    wait 0.25;
                    /#
                        if (!self.var_bbc91b82b805637b) {
                            self.status = "<dev string:x24>";
                        }
                    #/
                }
            }
            if (isdefined(node)) {
                var_25b85621d09fb28d = 0;
                if (!isdefined(self.claimed_node)) {
                    var_25b85621d09fb28d = 1;
                } else if (isdefined(self.claimed_node) && self.claimed_node != node && isdefined(self.var_efa08cbe555cb7b7)) {
                    var_1f7db3d1ecf47809 = distance2dsquared(self.claimed_node.origin, self.var_efa08cbe555cb7b7);
                    var_4718912dae61fdc0 = distance2dsquared(node.origin, self.var_efa08cbe555cb7b7);
                    var_cdd232e6e1878821 = distance2dsquared(level.player getorigin(), self.origin);
                    var_12cbabcc3f1a53d2 = var_1f7db3d1ecf47809 - var_4718912dae61fdc0;
                    if (var_73e27a81a22f4ae < var_12cbabcc3f1a53d2 || var_cdd232e6e1878821 > var_64c8bd1651cd31a7) {
                        var_25b85621d09fb28d = 1;
                    }
                }
                if (var_25b85621d09fb28d) {
                    /#
                        self.status = "<dev string:x2c>";
                    #/
                    self.claimed_node = node;
                    self.var_bbc91b82b805637b = 0;
                    self.keepclaimednode = 0;
                    set_goal_node(node);
                }
                /#
                    if (getdvarint(@"hash_6fce5c3eda16a53a", 0)) {
                        sphere(node.origin, 8, (1, 1, 1), 0, 440);
                        line(node.origin, self.origin, (1, 1, 1), 1, 0, 140);
                    }
                #/
                if (isdefined(self.var_efa08cbe555cb7b7)) {
                    while (isnotinvehicle() && isdefined(self.var_efa08cbe555cb7b7)) {
                        var_8f80da667ab5b34e = distance2dsquared(self.origin, self.var_efa08cbe555cb7b7) + var_73e27a81a22f4ae;
                        var_77f7ed9eb6ed7dbd = distance2dsquared(level.player getorigin(), self.var_efa08cbe555cb7b7);
                        level.var_8f80da667ab5b34e = var_8f80da667ab5b34e;
                        level.var_77f7ed9eb6ed7dbd = var_77f7ed9eb6ed7dbd;
                        if (istrue(var_2cd8ca365c32ca56) && !(level.player ent_flag("stealth_enabled") && isdefined(level.player.stealth.combatstate) && level.player.stealth.combatstate.name == "stealth")) {
                            break;
                        }
                        if (var_8f80da667ab5b34e > var_77f7ed9eb6ed7dbd) {
                            break;
                        }
                        var_cdd232e6e1878821 = distance2dsquared(level.player getorigin(), self.origin);
                        if (var_cdd232e6e1878821 > var_64c8bd1651cd31a7) {
                            break;
                        }
                        waitframe();
                    }
                } else {
                    while (isnotinvehicle() && distance2dsquared(level.player getorigin(), self.origin) + var_73e27a81a22f4ae < var_4dbbca3f9a168ae0) {
                        if (istrue(var_2cd8ca365c32ca56) && !(level.player ent_flag("stealth_enabled") && isdefined(level.player.stealth.combatstate) && level.player.stealth.combatstate.name == "stealth")) {
                            break;
                        }
                        waitframe();
                    }
                }
            } else {
                /#
                    self.status = "<dev string:x2f>";
                #/
                self.var_bbc91b82b805637b = 1;
            }
        }
        waitframe();
    }
}

// Namespace namespace_df392a06b5c03994 / namespace_457defbc8d30c83b
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x108b
// Size: 0x11c
function private function_4d76760fa4973094(refreshtime, var_74fdc175d10c4b46, var_92014f68e9eb95bb) {
    if (!isdefined(var_74fdc175d10c4b46)) {
        var_74fdc175d10c4b46 = 128;
    }
    if (isdefined(level.var_da112e44cbc8ba86)) {
        var_74fdc175d10c4b46 = level.var_da112e44cbc8ba86;
    }
    var_de95bf48b4a3b6eb = var_74fdc175d10c4b46 * var_74fdc175d10c4b46;
    while (true) {
        if (isnotinvehicle() && self.var_bbc91b82b805637b) {
            v_player_origin = function_7b8369bf4c4adb52(var_92014f68e9eb95bb, var_74fdc175d10c4b46);
            if (distance2dsquared(self.origin, v_player_origin) > var_de95bf48b4a3b6eb) {
                var_1944e85ba80d8c3f = randomfloatrange(v_player_origin[0] - var_74fdc175d10c4b46, v_player_origin[0] + var_74fdc175d10c4b46);
                var_1944e75ba80d8a0c = randomfloatrange(v_player_origin[1] - var_74fdc175d10c4b46, v_player_origin[1] + var_74fdc175d10c4b46);
                var_1944ea5ba80d90a5 = v_player_origin[2];
                goal_pos = scripts\engine\utility::drop_to_ground((var_1944e85ba80d8c3f, var_1944e75ba80d8a0c, var_1944ea5ba80d90a5));
                set_goal_pos(goal_pos);
                /#
                    self.status = "<dev string:x33>";
                #/
            }
            wait refreshtime;
            self.var_bbc91b82b805637b = 0;
            continue;
        }
        waitframe();
    }
}

/#

    // Namespace namespace_df392a06b5c03994 / namespace_457defbc8d30c83b
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x11af
    // Size: 0x18a
    function private function_b2e2745e9fab4f1c(var_a4365597f945dcfd) {
        self.status = "<dev string:x36>";
        while (true) {
            if (getdvarint(@"hash_6fce5c3eda16a53a", 0)) {
                if (isdefined(self.var_efa08cbe555cb7b7)) {
                    if (!isdefined(level.var_8f80da667ab5b34e)) {
                        var_8f80da667ab5b34e = distance2d(self.origin, self.var_efa08cbe555cb7b7) + var_a4365597f945dcfd;
                    } else {
                        var_8f80da667ab5b34e = sqrt(level.var_8f80da667ab5b34e);
                    }
                    if (!isdefined(level.var_77f7ed9eb6ed7dbd)) {
                        var_77f7ed9eb6ed7dbd = distance2d(level.player getorigin(), self.var_efa08cbe555cb7b7);
                    } else {
                        var_77f7ed9eb6ed7dbd = sqrt(level.var_77f7ed9eb6ed7dbd);
                    }
                    print3d(self.origin + (0, 0, 68), self.status + "<dev string:x38>" + var_8f80da667ab5b34e + "<dev string:x38>" + var_77f7ed9eb6ed7dbd, (0, 0, 0), 1, 0.5);
                } else {
                    dist = int(distance2d(level.player getorigin(), self.origin));
                    print3d(self.origin + (0, 0, 68), self.status + "<dev string:x38>" + dist, (0, 0, 0), 1, 0.5);
                }
            }
            waitframe();
        }
    }

#/
