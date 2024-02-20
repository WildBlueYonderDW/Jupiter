// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using script_72ef6b9f0cf1f55a;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_16ea1b94f0f381b3;
#using script_3214e6fcdce468a7;

#namespace powerups;

// Namespace powerups/namespace_55af56d47545b2f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d2
// Size: 0x94
function init_powerups(var_751ff6b802605de7, var_931062a9b77a0c65) {
    level flag_set("drop_powerups");
    root = function_ecdae672c660149e();
    root.active_powerups = [];
    root.powerups = [];
    root.var_19254faddf0e586c = 0;
    root.var_eaf13acb539829eb = [];
    root.var_211f18c4ee5c760f = [];
    level thread function_4d4c49885e6b2490(var_751ff6b802605de7, var_931062a9b77a0c65);
    utility::registersharedfunc("powerups", "dropPowerup", &powerup_drop);
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x56d
// Size: 0x4f3
function private function_4d4c49885e6b2490(var_751ff6b802605de7, var_931062a9b77a0c65) {
    wait(1);
    root = function_ecdae672c660149e();
    var_80a668917844846 = function_e6f547b7f0a996ed();
    list_index = 0;
    foreach (var_610934571c352e02 in var_80a668917844846.var_e840d2102b599fb8) {
        if (isdefined(var_610934571c352e02.ref) && isdefined(var_610934571c352e02.bundle)) {
            var_2fa928445372d72 = getscriptbundle("powerup:" + var_610934571c352e02.bundle);
            root.powerups[var_610934571c352e02.ref] = var_2fa928445372d72;
            root.var_eaf13acb539829eb[var_610934571c352e02.ref] = list_index;
            if (istrue(var_610934571c352e02.var_cc9e5dd3893defb)) {
                root.var_211f18c4ee5c760f[root.var_211f18c4ee5c760f.size] = var_610934571c352e02.ref;
            }
        }
        list_index++;
    }
    root.var_211f18c4ee5c760f = array_randomize(root.var_211f18c4ee5c760f);
    function_5b0b83c04b92d1fa("drop_event_incremental_number_per_player", var_80a668917844846.drop_event_incremental_number_per_player);
    if (isarray(var_80a668917844846.var_652fff0810f34100)) {
        drop_event_ranges = [];
        foreach (range in var_80a668917844846.var_652fff0810f34100) {
            range_struct = spawnstruct();
            range_struct.n_players = range.var_46a3cdbf1d0f72c4;
            range_struct.n_min = range.min;
            range_struct.n_max = range.max;
            range_struct.var_9bf1ae0273911662 = range.var_7cce2df0592b4cf;
            range_struct.str_label = range.var_2e51bf4d86f6803c;
            drop_event_ranges[drop_event_ranges.size] = range_struct;
        }
        function_5b0b83c04b92d1fa("drop_event_ranges", drop_event_ranges);
    }
    function_5b0b83c04b92d1fa("drop_height_offset", function_53c4c53197386572(var_80a668917844846.drop_height_offset, 0));
    function_5b0b83c04b92d1fa("model_drop_delay_max", function_53c4c53197386572(var_80a668917844846.model_drop_delay_max, 0));
    function_5b0b83c04b92d1fa("model_drop_delay_min", function_53c4c53197386572(var_80a668917844846.model_drop_delay_min, 0));
    function_5b0b83c04b92d1fa("model_drop_delay_distance_outer", function_53c4c53197386572(var_80a668917844846.model_drop_delay_distance_outer, 0));
    function_5b0b83c04b92d1fa("model_drop_delay_distance_inner", function_53c4c53197386572(var_80a668917844846.model_drop_delay_distance_inner, 0));
    function_5b0b83c04b92d1fa("intro_vfx_label", var_80a668917844846.intro_vfx_label);
    function_5b0b83c04b92d1fa("intro_vfx_duration", var_80a668917844846.intro_vfx_duration);
    function_5b0b83c04b92d1fa("idle_vfx_label", var_80a668917844846.idle_vfx_label);
    function_5b0b83c04b92d1fa("grabbed_vfx_label", var_80a668917844846.grabbed_vfx_label);
    function_5b0b83c04b92d1fa("grabbed_vfx_duration", var_80a668917844846.grabbed_vfx_duration);
    root.var_3c8193fca198f526 = getdvarint(@"hash_c33094fc634b0af", var_80a668917844846.showsplash) == 1;
    var_19aff13734d0248d = function_5b0b83c04b92d1fa("powerup_ammo_spacing_min", int(function_53c4c53197386572(var_80a668917844846.var_67c7338208a813a2, 0)));
    var_198cdb3734a9ac73 = function_5b0b83c04b92d1fa("powerup_ammo_spacing_max", int(function_53c4c53197386572(var_80a668917844846.var_67a41d8208819b88, 0)));
    if (var_198cdb3734a9ac73 != 0 || var_19aff13734d0248d != 0) {
        if (var_198cdb3734a9ac73 > var_19aff13734d0248d) {
            root.var_34d5d13b703a35c9 = function_1652f8a8050283bd(var_19aff13734d0248d, var_198cdb3734a9ac73);
        } else {
            /#
                assertmsg("Make sure Ammo Spacing Max is greater than Min in " + root.var_8487d1e9569b89de);
            #/
        }
    }
    if (isarray(root.var_4add5bc41afc8ae)) {
        foreach (struct in root.var_4add5bc41afc8ae) {
            _register(struct.str_powerup, struct.func_grab_powerup, struct.func_should_drop_with_regular_powerups, struct.var_58a4e1d475eb979b);
        }
        root.var_4add5bc41afc8ae = undefined;
    }
    if (isdefined(var_931062a9b77a0c65)) {
        level [[ var_931062a9b77a0c65 ]]();
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa67
// Size: 0x1a
function function_8ca4b49ee68720bf(event) {
    level callback::add(event, &function_320c6c17c3136d0a);
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa88
// Size: 0x153
function function_e6f547b7f0a996ed() {
    root = function_ecdae672c660149e();
    if (!isdefined(root.var_a61c20c83f255666)) {
        if (isdefined(level.var_a77c94576da6cab0)) {
            var_a77c94576da6cab0 = "poweruplist:" + level.var_a77c94576da6cab0;
            root.var_8487d1e9569b89de = level.var_a77c94576da6cab0;
        } else {
            var_a77c94576da6cab0 = undefined;
            if (isdefined(level.var_62f6f7640e4431e3) && isdefined(level.var_62f6f7640e4431e3.var_e840d2102b599fb8)) {
                var_a77c94576da6cab0 = "poweruplist:" + level.var_62f6f7640e4431e3.var_e840d2102b599fb8;
                root.var_8487d1e9569b89de = level.var_62f6f7640e4431e3.var_e840d2102b599fb8;
            } else if (isdefined(level.var_1a2b600a06ec21f4) && isdefined(level.var_1a2b600a06ec21f4.var_e840d2102b599fb8)) {
                var_a77c94576da6cab0 = "poweruplist:" + level.var_1a2b600a06ec21f4.var_e840d2102b599fb8;
                root.var_8487d1e9569b89de = level.var_1a2b600a06ec21f4.var_e840d2102b599fb8;
            }
            /#
                assertex(isdefined(var_a77c94576da6cab0), "Define a Powerup List in the gamemodebundle asset for this mode or override level.str_powerup_list in script");
            #/
        }
        root.var_a61c20c83f255666 = getscriptbundle(var_a77c94576da6cab0);
    }
    return root.var_a61c20c83f255666;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe3
// Size: 0x73
function register_powerup(str_powerup, func_grab_powerup, func_should_drop_with_regular_powerups, var_58a4e1d475eb979b) {
    root = function_ecdae672c660149e();
    if (isarray(root.powerups) && root.powerups.size > 0) {
        _register(str_powerup, func_grab_powerup, func_should_drop_with_regular_powerups, var_58a4e1d475eb979b);
    } else {
        function_854b2d27ee860e0e(str_powerup, func_grab_powerup, func_should_drop_with_regular_powerups, var_58a4e1d475eb979b);
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5d
// Size: 0x9c
function _register(str_powerup, func_grab_powerup, func_should_drop_with_regular_powerups, var_58a4e1d475eb979b) {
    root = function_ecdae672c660149e();
    if (isdefined(root.powerups[str_powerup])) {
        root.powerups[str_powerup].func_grab_powerup = func_grab_powerup;
        root.powerups[str_powerup].func_should_drop_with_regular_powerups = function_53c4c53197386572(func_should_drop_with_regular_powerups, &func_should_always_drop);
        root.powerups[str_powerup].var_58a4e1d475eb979b = var_58a4e1d475eb979b;
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd00
// Size: 0xb3
function function_854b2d27ee860e0e(str_powerup, func_grab_powerup, func_should_drop_with_regular_powerups, var_58a4e1d475eb979b) {
    root = function_ecdae672c660149e();
    if (!isarray(root.var_4add5bc41afc8ae)) {
        root.var_4add5bc41afc8ae = [];
    }
    struct = spawnstruct();
    struct.str_powerup = str_powerup;
    struct.func_grab_powerup = func_grab_powerup;
    struct.func_should_drop_with_regular_powerups = func_should_drop_with_regular_powerups;
    struct.var_58a4e1d475eb979b = var_58a4e1d475eb979b;
    root.var_4add5bc41afc8ae[root.var_4add5bc41afc8ae.size] = struct;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdba
// Size: 0x53
function function_57c783cba2592db1(str_powerup, var_4d44d70760d7ad71) {
    /#
        assert(isplayer(self));
    #/
    player = self;
    var_2fa928445372d72 = function_519d44e54a9b8ae5(str_powerup);
    player thread [[ var_2fa928445372d72.func_grab_powerup ]](str_powerup, var_4d44d70760d7ad71);
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe14
// Size: 0x1e
function function_a7f6960c623182d2(str_powerup) {
    return istrue(function_519d44e54a9b8ae5(str_powerup).var_87bfb9b44387c5c8);
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3a
// Size: 0x2a
function function_c414330b83d2e427(str_powerup) {
    return !function_a7f6960c623182d2(str_powerup) && istrue(function_519d44e54a9b8ae5(str_powerup).var_7af5681aad466bb);
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6c
// Size: 0x34
function function_896f9300bcde23c2(str_powerup) {
    var_d59b2ba810fedb8c = function_519d44e54a9b8ae5(str_powerup).var_11a46abceed0ee1c;
    if (isfloat(var_d59b2ba810fedb8c)) {
        return var_d59b2ba810fedb8c;
    }
    return 0;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea8
// Size: 0x1e
function function_519d44e54a9b8ae5(str_powerup) {
    return function_ecdae672c660149e().powerups[str_powerup];
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xece
// Size: 0x199
function function_a56a8b17eae57b09(str_powerup, powerup_origin) {
    root = function_ecdae672c660149e();
    a_players = [];
    if (function_a7f6960c623182d2(str_powerup)) {
        a_players = array_add(a_players, self);
    } else if (function_c414330b83d2e427(str_powerup)) {
        a_players = level.players;
    } else if (isdefined(root.var_d476bc08981505b4)) {
        a_players = self [[ root.var_d476bc08981505b4 ]]();
    } else {
        foreach (player in level.players) {
            if (isalive(player) && self.team == player.team) {
                a_players = array_add(a_players, player);
            }
        }
    }
    var_b903d65110aca6e = [];
    var_e920c25b027ffdde = function_896f9300bcde23c2(str_powerup);
    if (isdefined(powerup_origin) && var_e920c25b027ffdde > 0) {
        foreach (player in a_players) {
            if (distancesquared(player.origin, powerup_origin) <= squared(var_e920c25b027ffdde)) {
                var_b903d65110aca6e = array_add(var_b903d65110aca6e, player);
            }
        }
    } else {
        var_b903d65110aca6e = a_players;
    }
    return var_b903d65110aca6e;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x106f
// Size: 0x11c
function function_d4be622286a198(str_powerup, v_spawn_pos, v_spawn_angles) {
    level endon("game_ended");
    e_powerup = powerup_drop(str_powerup, v_spawn_pos, -1, 0);
    if (isdefined(e_powerup)) {
        e_powerup.angles = v_spawn_angles;
        e_powerup.var_ff03752b3593aed8.angles = v_spawn_angles;
        e_powerup setmodel("jup_zm_powerup_vfx");
        contents = trace::create_contents(0, 1, 0, 0, 0, 1, 1, 0, 0);
        v_up = anglestoup(e_powerup.angles);
        caststart = e_powerup.origin + v_up * 32;
        castend = caststart + v_up * -100;
        traceresult = trace::ray_trace(caststart, castend, [], contents);
        if (isdefined(traceresult["entity"])) {
            e_powerup linkto(traceresult["entity"]);
            e_powerup.var_ff03752b3593aed8 linkto(traceresult["entity"]);
        }
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1192
// Size: 0x4e
function function_c38c89a662ac4f51(str_powerup, origin) {
    if (!isdefined(origin)) {
        /#
            assertmsg("Powerup drop origin is not defined!");
        #/
        return;
    }
    offset = (0, 0, function_edeba0070ca0709e("drop_height_offset"));
    level thread powerup_drop(str_powerup, origin + offset);
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e7
// Size: 0x1aa
function powerup_drop(str_powerup, v_spawn_pos, var_cfca9abfbb48775e, var_31a30ed92b3baeec) {
    if (!isdefined(var_31a30ed92b3baeec)) {
        var_31a30ed92b3baeec = 1;
    }
    self endon("powerup_grabbed");
    self endon("death");
    root = function_ecdae672c660149e();
    var_2fa928445372d72 = function_519d44e54a9b8ae5(str_powerup);
    e_powerup = spawn("script_model", v_spawn_pos);
    e_powerup setmodel("tag_origin");
    e_powerup function_52bb753b67c409bd(var_2fa928445372d72.model, 1);
    e_powerup.str_powerup = str_powerup;
    function_afb7ebfa593cc2d5(str_powerup);
    offset = (0, 0, function_edeba0070ca0709e("drop_height_offset"));
    if (var_31a30ed92b3baeec) {
        groundent = e_powerup thread function_ff48fa45d1f0c4e1(offset);
        groundent = e_powerup.var_ff03752b3593aed8 function_ff48fa45d1f0c4e1(offset);
        e_powerup thread powerup_wobble(e_powerup.var_ff03752b3593aed8, groundent);
    }
    e_powerup thread powerup_timeout(var_cfca9abfbb48775e);
    e_powerup thread function_3470b420d25e6256();
    root.active_powerups = array_add(root.active_powerups, e_powerup);
    level notify("powerup_dropped", e_powerup);
    if (isdefined(root.var_a7e2bcd566109582)) {
        foreach (var_ce253278f5783484 in root.var_a7e2bcd566109582) {
            level [[ var_ce253278f5783484 ]](e_powerup);
        }
    }
    return e_powerup;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1399
// Size: 0xe7
function function_ff48fa45d1f0c4e1(offset) {
    if (!isdefined(offset)) {
        offset = (0, 0, 0);
    }
    var_12baea29dc62088 = function_2e9e02e8bda61ef2();
    if (isdefined(var_12baea29dc62088) && isdefined(var_12baea29dc62088.groundent) && isdefined(var_12baea29dc62088.var_ea3b9640a6ad3c8e) && isdefined(var_12baea29dc62088.localangles)) {
        if (isdefined(self.var_bf8e5f003146af44)) {
            self.var_bf8e5f003146af44 linkto(var_12baea29dc62088.groundent, "", var_12baea29dc62088.var_ea3b9640a6ad3c8e, var_12baea29dc62088.localangles);
        } else {
            self linkto(var_12baea29dc62088.groundent, "", var_12baea29dc62088.var_ea3b9640a6ad3c8e + offset, var_12baea29dc62088.localangles);
        }
        return var_12baea29dc62088.groundent;
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1488
// Size: 0x53
function function_6941afdf7d54f58c(func_callback) {
    root = function_ecdae672c660149e();
    if (!isdefined(root.var_a7e2bcd566109582)) {
        root.var_a7e2bcd566109582 = [];
    }
    root.var_a7e2bcd566109582[root.var_a7e2bcd566109582.size] = func_callback;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e2
// Size: 0x7d
function function_afb7ebfa593cc2d5(str_powerup) {
    root = function_ecdae672c660149e();
    if (isdefined(root.var_34d5d13b703a35c9)) {
        if (str_powerup == "full_ammo") {
            root.var_34d5d13b703a35c9 = function_1652f8a8050283bd(function_edeba0070ca0709e("powerup_ammo_spacing_min"), function_edeba0070ca0709e("powerup_ammo_spacing_max"));
        } else if (root.var_34d5d13b703a35c9 > 0) {
            root.var_34d5d13b703a35c9--;
        }
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1566
// Size: 0x116
function powerup_wobble(ent_model, groundent) {
    self endon("powerup_grabbed");
    self endon("powerup_timedout");
    self endon("death");
    var_8e193cc0472c28c = function_519d44e54a9b8ae5(self.str_powerup);
    if (istrue(var_8e193cc0472c28c.var_4b1dd9ec52ba79a3)) {
        return;
    }
    while (isdefined(ent_model)) {
        waittime = randomfloatrange(2.5, 5);
        yaw = randomint(360);
        if (yaw > 300) {
            yaw = 300;
        } else if (yaw < 60) {
            yaw = 60;
        }
        yaw = ent_model.angles[1] + yaw;
        new_angles = (-60 + randomint(120), yaw, -45 + randomint(90));
        if (isdefined(groundent)) {
            ent_model rotateto(new_angles, waittime, waittime * 0.5, waittime * 0.5);
        } else {
            ent_model rotateto(new_angles, waittime, waittime * 0.5, waittime * 0.5);
        }
        wait(randomfloat(waittime - 0.1));
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1683
// Size: 0xe4
function powerup_timeout(var_5ed2ffb8d01c0e35) {
    if (isdefined(var_5ed2ffb8d01c0e35) && var_5ed2ffb8d01c0e35 < 0) {
        return;
    }
    var_8e193cc0472c28c = function_519d44e54a9b8ae5(self.str_powerup);
    var_5ed2ffb8d01c0e35 = function_53c4c53197386572(var_5ed2ffb8d01c0e35, var_8e193cc0472c28c.var_7f552635d01b5fd5);
    self endon("powerup_grabbed");
    self endon("death");
    self endon("powerup_reset");
    var_f7cf84896619aedc = 10;
    var_e4416a8eb368fdd7 = max(0, var_5ed2ffb8d01c0e35 - var_f7cf84896619aedc);
    wait(var_e4416a8eb368fdd7);
    thread hide_and_show(&function_8dd76aac9c877310, &powerup_show);
    wait(var_f7cf84896619aedc);
    self notify("powerup_timedout");
    if (self.var_ff03752b3593aed8 isscriptable() && self.var_ff03752b3593aed8 getscriptablehaspart("sound")) {
        self.var_ff03752b3593aed8 setscriptablepartstate("sound", "timed_out");
    }
    thread function_98041907892dbd80();
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176e
// Size: 0xb3
function function_8dd76aac9c877310() {
    if (isdefined(self)) {
        self hide();
    }
    if (isdefined(self.var_ff03752b3593aed8)) {
        if (self.var_ff03752b3593aed8 isscriptable() && self.var_ff03752b3593aed8 getscriptablehaspart("blink")) {
            self.var_ff03752b3593aed8 setscriptablepartstate("blink", "blink_hide");
        } else if (self.var_ff03752b3593aed8 isscriptable() && self.var_ff03752b3593aed8 getscriptablehaspart("idle")) {
            self.var_ff03752b3593aed8 setscriptablepartstate("idle", "hide");
        } else {
            self.var_ff03752b3593aed8 hide();
        }
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1828
// Size: 0xdd
function powerup_show(var_bce144cbc1e37b8e) {
    if (isdefined(self)) {
        self show();
    }
    if (isdefined(self.var_ff03752b3593aed8)) {
        if (self.var_ff03752b3593aed8 isscriptable() && self.var_ff03752b3593aed8 getscriptablehaspart("blink")) {
            if (istrue(var_bce144cbc1e37b8e)) {
                self.var_ff03752b3593aed8 setscriptablepartstate("blink", "blink_show");
            } else {
                self.var_ff03752b3593aed8 setscriptablepartstate("blink", "blink_show_with_audio");
            }
        } else if (self.var_ff03752b3593aed8 isscriptable() && self.var_ff03752b3593aed8 getscriptablehaspart("idle")) {
            self.var_ff03752b3593aed8 setscriptablepartstate("idle", "show");
        } else {
            self.var_ff03752b3593aed8 show();
        }
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190c
// Size: 0x83
function hide_and_show(hide_func, show_func) {
    self endon("death");
    var_bce144cbc1e37b8e = 0;
    for (i = 0; i < 40; i++) {
        if (i % 2) {
            self [[ show_func ]](var_bce144cbc1e37b8e);
        } else {
            self [[ hide_func ]]();
        }
        if (i < 16) {
            wait(0.5);
        } else if (i < 24) {
            var_bce144cbc1e37b8e = 1;
            wait(0.25);
        } else {
            var_bce144cbc1e37b8e = 1;
            wait(0.1);
        }
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1996
// Size: 0x76
function powerup_delete() {
    if (isdefined(self.e_trigger)) {
        self.e_trigger delete();
    }
    if (isdefined(self.var_ff03752b3593aed8)) {
        self.var_ff03752b3593aed8 delete();
    }
    root = function_ecdae672c660149e();
    if (isdefined(self)) {
        root.active_powerups = array_remove(root.active_powerups, self);
        self delete();
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a13
// Size: 0x317
function function_3470b420d25e6256() {
    self endon("death");
    root = function_ecdae672c660149e();
    var_2fa928445372d72 = function_519d44e54a9b8ae5(self.str_powerup);
    offset = (0, 0, function_edeba0070ca0709e("drop_height_offset"));
    origin = self.origin - offset;
    self.e_trigger = spawn("trigger_radius", origin, 0, 32, 72);
    self.e_trigger enablelinkto();
    self.e_trigger linkto(self);
    while (1) {
        ent = self.e_trigger waittill("trigger");
        player = ent;
        if (isdefined(root.var_5cdeaceda00983a3)) {
            player = ent [[ root.var_5cdeaceda00983a3 ]]();
        }
        if (!istrue(var_2fa928445372d72.var_f9f899d9e6df9373) && !isplayer(player)) {
            continue;
        }
        if (!istrue(var_2fa928445372d72.var_872243630fdf0168) && istrue(player.inlaststand)) {
            continue;
        }
        if (isdefined(self.var_ff03752b3593aed8)) {
            if (self.var_ff03752b3593aed8 isscriptable() && self.var_ff03752b3593aed8 getscriptablehaspart("sound")) {
                self.var_ff03752b3593aed8 setscriptablepartstate("sound", "pickup");
            }
        }
        var_269d8af30921f43d = player function_a56a8b17eae57b09(self.str_powerup, self.origin);
        foreach (var_2624004be9669cc0 in var_269d8af30921f43d) {
            var_2624004be9669cc0 function_c664a2459d6f3eaa("sndevent_powerup_" + self.str_powerup, var_2624004be9669cc0);
        }
        if (isdefined(var_2fa928445372d72.var_c5a9d2297ea16382)) {
            a_players = player function_a56a8b17eae57b09(self.str_powerup, self.origin);
            foreach (var_2624004be9669cc0 in a_players) {
                if (isalive(var_2624004be9669cc0)) {
                    var_2624004be9669cc0 namespace_53fc9ddbb516e6e1::function_2ad34da25e5bdd45(var_2fa928445372d72.var_c5a9d2297ea16382, var_2624004be9669cc0);
                }
            }
        }
        /#
            if (isdefined(player.name)) {
                iprintlnbold(self.str_powerup + "tag_origin" + player.name);
            }
        #/
        level callback::callback(#"hash_1ec8b300d7a86b43", {player:player, powerup:self});
        player function_57c783cba2592db1(self.str_powerup, self);
        player namespace_53fc9ddbb516e6e1::function_990cf49669e49965();
        self notify("powerup_grabbed", player);
        thread function_98041907892dbd80(1);
        return;
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d31
// Size: 0xbe
function get_next_powerup() {
    root = function_ecdae672c660149e();
    /#
        if (isdefined(level.var_7f2e8af1175e5aa5)) {
            str_powerup = level.var_7f2e8af1175e5aa5;
            level.var_7f2e8af1175e5aa5 = undefined;
            return str_powerup;
        }
    #/
    if (isdefined(level.var_37858f4d4dbe2433)) {
        str_powerup = level.var_37858f4d4dbe2433;
        level.var_37858f4d4dbe2433 = undefined;
    } else {
        str_powerup = root.var_211f18c4ee5c760f[root.var_19254faddf0e586c];
        root.var_19254faddf0e586c++;
        if (root.var_19254faddf0e586c >= root.var_211f18c4ee5c760f.size) {
            root.var_19254faddf0e586c = 0;
            function_39a01e773f00003();
        }
    }
    return str_powerup;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df7
// Size: 0x31
function function_39a01e773f00003() {
    root = function_ecdae672c660149e();
    root.var_211f18c4ee5c760f = array_randomize(root.var_211f18c4ee5c760f);
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e2f
// Size: 0x5
function func_should_always_drop() {
    return 1;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e3c
// Size: 0x4
function func_should_never_drop() {
    return 0;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e48
// Size: 0x14c
function function_320c6c17c3136d0a(params) {
    if (!function_76ccbdb9c3d32f22()) {
        return;
    }
    if (istrue(self.no_powerups)) {
        return;
    }
    root = function_ecdae672c660149e();
    if (isdefined(root.var_4e1cce72cf8d8f63)) {
        if (!self [[ root.var_4e1cce72cf8d8f63 ]](params)) {
            return;
        }
    }
    var_c9844d4eb04faec9 = isai(self) ? self.var_f182de6049d1ab48 : self.origin;
    if (!isdefined(level.var_2a474bda8984ac2a)) {
        level.var_2a474bda8984ac2a = function_e4c99b0f178ffb98("powerup_drop", 1, level.framedurationseconds);
    }
    var_8ed8f695a88af352 = spawnstruct();
    function_f632348cbb773537(level.var_2a474bda8984ac2a, var_8ed8f695a88af352);
    var_cdcc412515151986 = 1;
    if (isdefined(root.var_29e4cb253683279f)) {
        params.etarget = self;
        var_cdcc412515151986 = level [[ root.var_29e4cb253683279f ]](params);
    }
    if (var_cdcc412515151986) {
        var_d01a68d4c8274caf = undefined;
        var_d01a68d4c8274caf = function_3f65dbe307c93086();
        if (isdefined(var_d01a68d4c8274caf)) {
            offset = (0, 0, function_edeba0070ca0709e("drop_height_offset"));
            level thread powerup_drop(var_d01a68d4c8274caf, var_c9844d4eb04faec9 + offset);
        }
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f9b
// Size: 0xbc
function function_3f65dbe307c93086() {
    level endon("game_ended");
    root = function_ecdae672c660149e();
    /#
        if (isdefined(level.var_7f2e8af1175e5aa5)) {
            str_powerup = level.var_7f2e8af1175e5aa5;
            level.var_7f2e8af1175e5aa5 = undefined;
            return str_powerup;
        }
    #/
    for (var_f8ab93ea0d4f6fcc = root.var_211f18c4ee5c760f.size * 2; var_f8ab93ea0d4f6fcc > 0; var_f8ab93ea0d4f6fcc--) {
        str_powerup = get_next_powerup();
        var_8e193cc0472c28c = function_519d44e54a9b8ae5(str_powerup);
        if (!isdefined(var_8e193cc0472c28c.func_should_drop_with_regular_powerups)) {
            return str_powerup;
        }
        is_available = [[ var_8e193cc0472c28c.func_should_drop_with_regular_powerups ]]();
        if (istrue(is_available)) {
            return str_powerup;
        }
    }
    return undefined;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x205f
// Size: 0x1e
function function_8edb8c0ed499f61e(var_b963bd568903c6d) {
    function_ecdae672c660149e().var_7d478c526f5d7a85 = var_b963bd568903c6d;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2084
// Size: 0x31
function private function_76ccbdb9c3d32f22() {
    root = function_ecdae672c660149e();
    if (isdefined(root.var_7d478c526f5d7a85)) {
        return root.var_7d478c526f5d7a85;
    }
    return 1;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20bd
// Size: 0x3c
function function_5b0b83c04b92d1fa(zvar, value) {
    if (!isdefined(value)) {
        return undefined;
    }
    root = function_ecdae672c660149e();
    root.var_cbdbd30a8ab88456[zvar] = value;
    return value;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2101
// Size: 0x2a
function function_edeba0070ca0709e(zvar) {
    root = function_ecdae672c660149e();
    return root.var_cbdbd30a8ab88456[zvar];
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2133
// Size: 0x8a
function function_87ee9b2ac9dac707(str_powerup, var_5ed2ffb8d01c0e35) {
    self endon("powerup_hud_show_" + str_powerup);
    self endon("disconnect");
    root = function_ecdae672c660149e();
    self [[ root.var_b0d3396c2b9e78d4 ]](self.var_e2d9965430ae7f24[str_powerup], var_5ed2ffb8d01c0e35);
    self.var_a0e1c0f50ca3ef0f[self.var_e2d9965430ae7f24[str_powerup].index] = undefined;
    self.var_e2d9965430ae7f24[str_powerup] = undefined;
    self [[ root.var_5a4c4a84060b59da ]](str_powerup);
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c4
// Size: 0x1a0
function function_587ecc90909a8c38(str_powerup) {
    self notify("powerup_hud_show_" + str_powerup);
    self endon("powerup_hud_show_" + str_powerup);
    self endon("disconnect");
    root = function_ecdae672c660149e();
    if (!isdefined(self.var_e2d9965430ae7f24)) {
        self.var_e2d9965430ae7f24 = [];
    }
    if (!isdefined(self.var_e2d9965430ae7f24[str_powerup])) {
        self.var_e2d9965430ae7f24[str_powerup] = spawnstruct();
    }
    if (!isdefined(self.var_a0e1c0f50ca3ef0f)) {
        self.var_a0e1c0f50ca3ef0f = [];
    }
    var_7c2d7ebd88556657 = function_e6f547b7f0a996ed();
    var_486ef34a9f4d1717 = var_7c2d7ebd88556657.var_e840d2102b599fb8;
    powerupindex = 0;
    var_e06622fd678941f3 = 0;
    for (i = 0; i < var_486ef34a9f4d1717.size; i++) {
        var_f8358178900f0d5f = isdefined(self.var_a0e1c0f50ca3ef0f[i]);
        var_8952024062b19822 = var_f8358178900f0d5f && self.var_a0e1c0f50ca3ef0f[i] == str_powerup;
        if (!var_f8358178900f0d5f || var_8952024062b19822) {
            if (!var_e06622fd678941f3) {
                powerupindex = i;
                var_e06622fd678941f3 = 1;
            } else {
                self.var_a0e1c0f50ca3ef0f[i] = undefined;
            }
        }
    }
    self.var_e2d9965430ae7f24[str_powerup].str_powerup = str_powerup;
    self.var_e2d9965430ae7f24[str_powerup].start = gettime();
    self.var_e2d9965430ae7f24[str_powerup].index = powerupindex;
    self.var_a0e1c0f50ca3ef0f[powerupindex] = str_powerup;
    return self.var_e2d9965430ae7f24[str_powerup];
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x236c
// Size: 0x271
function function_e91cc9367bcb7f1a(var_14254f0bfa23268d, var_5ed2ffb8d01c0e35) {
    /#
        assert(isplayer(self));
    #/
    root = function_ecdae672c660149e();
    var_486ef34a9f4d1717 = function_e6f547b7f0a996ed();
    /#
        assertex(isdefined(root.var_eaf13acb539829eb[var_14254f0bfa23268d.str_powerup]), "The hud_powerup, " + var_14254f0bfa23268d.str_powerup + ", does not exist in the powerup list. Please check the poweruplist asset in APE for that powerup ref.");
    #/
    player = self;
    index = var_14254f0bfa23268d.index;
    var_e66f8bc0f155720f = var_486ef34a9f4d1717.var_5a95e049dbbdc1ec;
    refname = "hud_powerup_" + var_14254f0bfa23268d.str_powerup;
    isactive = player function_ada0825249682644(refname);
    if (var_5ed2ffb8d01c0e35 > 0 && isdefined(var_e66f8bc0f155720f) && var_e66f8bc0f155720f != "") {
        state = function_53c4c53197386572(var_486ef34a9f4d1717.var_fec1fa2e735d7499, "");
        var_f765538941d0eccd = function_f845164fd6027e79(var_486ef34a9f4d1717.var_99a990e9f5ea961c);
        var_949530d3a6b789b3 = function_863b22a1564f8eb(var_486ef34a9f4d1717.var_40a95d7bb8872fa2);
        var_93ad9d99a27ac228 = function_53c4c53197386572(var_486ef34a9f4d1717.var_fde517927a257ba7, 0);
        var_93ad9e99a27ac45b = function_53c4c53197386572(var_486ef34a9f4d1717.var_fde516927a257974, 0);
        stepx = function_53c4c53197386572(var_486ef34a9f4d1717.var_3a83b92e9fcd024a, 0);
        var_63f43f469b885ec6 = function_53c4c53197386572(var_486ef34a9f4d1717.var_3a83ba2e9fcd047d, 0);
        if (!isactive) {
            player function_90de31b2cbef19f9(refname, var_e66f8bc0f155720f);
            player function_d28fa5295a04d555(refname, state);
        }
        var_8d076e93bc8ccd99 = [];
        var_8d076e93bc8ccd99["bundle_index"] = root.var_eaf13acb539829eb[var_14254f0bfa23268d.str_powerup];
        var_8d076e93bc8ccd99["time"] = var_5ed2ffb8d01c0e35;
        player function_14a0ee2aaf9128c3(refname, var_8d076e93bc8ccd99, 0);
        player function_f4c37324750dc183(refname, var_93ad9d99a27ac228 + index * stepx, var_93ad9e99a27ac45b + index * var_63f43f469b885ec6, var_f765538941d0eccd, var_949530d3a6b789b3);
    } else if (isactive) {
        player function_d28fa5295a04d555(refname, "hide");
        wait(1.5);
        player function_fb3c9a259f146781(refname);
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25e4
// Size: 0x175
function function_aa5cdd71af797058(var_14254f0bfa23268d, var_5ed2ffb8d01c0e35) {
    /#
        assert(isplayer(self));
    #/
    root = function_ecdae672c660149e();
    var_486ef34a9f4d1717 = function_e6f547b7f0a996ed();
    /#
        assertex(isdefined(root.var_eaf13acb539829eb[var_14254f0bfa23268d.str_powerup]), "The hud_powerup, " + var_14254f0bfa23268d.str_powerup + ", does not exist in the powerup list. Please check the poweruplist asset in APE for that powerup ref.");
    #/
    player = self;
    index = root.var_eaf13acb539829eb[var_14254f0bfa23268d.str_powerup];
    var_e66f8bc0f155720f = var_486ef34a9f4d1717.var_509cf6c285b05999;
    refname = "hud_powerup_vignette";
    isactive = player function_ada0825249682644(refname);
    if (var_5ed2ffb8d01c0e35 > 0 && isdefined(var_e66f8bc0f155720f) && var_e66f8bc0f155720f != "") {
        state = function_53c4c53197386572(var_486ef34a9f4d1717.var_31bc54db39a319a2, "");
        param = function_53c4c53197386572(var_486ef34a9f4d1717.var_193b808b8bdb874e, "");
        if (!isactive) {
            player function_90de31b2cbef19f9(refname, var_e66f8bc0f155720f);
            player function_d28fa5295a04d555(refname, state);
            player function_af4f62f0f944a8f1(refname, param);
        }
    } else if (isactive) {
        player function_fb3c9a259f146781(refname);
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2760
// Size: 0xd7
function function_5bfe254c7e9aa4db() {
    if (!isdefined(self.var_a0e1c0f50ca3ef0f)) {
        return;
    }
    var_486ef34a9f4d1717 = function_e6f547b7f0a996ed();
    for (i = 0; i < self.var_a0e1c0f50ca3ef0f.size; i++) {
        self.var_a0e1c0f50ca3ef0f[i] = undefined;
    }
    foreach (powerup in var_486ef34a9f4d1717.var_e840d2102b599fb8) {
        refname = "hud_powerup_" + powerup.ref;
        isactive = namespace_6917e6eed10cfc44::function_ada0825249682644(refname);
        if (isactive) {
            namespace_6917e6eed10cfc44::function_fb3c9a259f146781(refname);
        }
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x283e
// Size: 0x141
function function_52bb753b67c409bd(model_name, var_f77ed8ae404fb650) {
    self endon("powerup_grabbed");
    self endon("death");
    var_8d1bce370082e068 = function_edeba0070ca0709e("intro_vfx_label");
    var_3d0000bc842db347 = istrue(var_f77ed8ae404fb650) && isdefined(var_8d1bce370082e068) && fxexists(var_8d1bce370082e068);
    if (var_3d0000bc842db347) {
        function_5b0773c04b8eb8f3(var_8d1bce370082e068);
        wait(function_edeba0070ca0709e("intro_vfx_duration"));
    }
    function_5b0773c04b8eb8f3(function_edeba0070ca0709e("idle_vfx_label"));
    var_fc149047aeda3124 = function_fb089abb8dac6216();
    wait(var_fc149047aeda3124);
    self.var_ff03752b3593aed8 = spawn("script_model", self.origin);
    self.var_ff03752b3593aed8 setmodel(model_name);
    if (self.var_ff03752b3593aed8 isscriptable() && self.var_ff03752b3593aed8 getscriptablehaspart("idle")) {
        self.var_ff03752b3593aed8 setscriptablepartstate("idle", "show");
    }
    if (self.var_ff03752b3593aed8 isscriptable() && self.var_ff03752b3593aed8 getscriptablehaspart("sound")) {
        self.var_ff03752b3593aed8 setscriptablepartstate("sound", "spawn");
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2986
// Size: 0xdb
function function_98041907892dbd80(b_play_fx) {
    self endon("death");
    if (isdefined(self.e_trigger)) {
        self.e_trigger delete();
    }
    if (self.var_ff03752b3593aed8 isscriptable() && self.var_ff03752b3593aed8 getscriptablehaspart("idle")) {
        self.var_ff03752b3593aed8 setscriptablepartstate("idle", "hide");
    } else {
        self.var_ff03752b3593aed8 hide();
    }
    var_890cc8766d6305 = function_edeba0070ca0709e("grabbed_vfx_label");
    var_26bf64b63e12ec04 = istrue(b_play_fx) && isdefined(var_890cc8766d6305) && fxexists(var_890cc8766d6305);
    if (var_26bf64b63e12ec04) {
        function_5b0773c04b8eb8f3(var_890cc8766d6305);
        wait(function_edeba0070ca0709e("grabbed_vfx_duration"));
    }
    wait(0.05);
    powerup_delete();
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a68
// Size: 0x3e
function function_5b0773c04b8eb8f3(str_fx_name) {
    if (!isdefined(self)) {
        return;
    }
    if (!fxexists(str_fx_name)) {
        return;
    }
    str_fx = getfx(str_fx_name);
    function_19a5fed2ac84ab0a();
    function_d20c2da6a20af84(str_fx);
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aad
// Size: 0x2f
function function_19a5fed2ac84ab0a() {
    if (isdefined(self.n_powerup_fx)) {
        stopfxontag(self.n_powerup_fx, self, "tag_origin");
        self.n_powerup_fx = undefined;
    }
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ae3
// Size: 0x21
function function_d20c2da6a20af84(str_fx) {
    self.n_powerup_fx = playfxontag(str_fx, self, "tag_origin");
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b0b
// Size: 0x50
function function_e419d148895ea689(powerup_name) {
    lifetime = function_ecdae672c660149e().powerups[powerup_name].var_f862e718db266e0a;
    if (isdefined(level.var_6680bed8f52bbd1c)) {
        lifetime = self [[ level.var_6680bed8f52bbd1c ]](lifetime);
    }
    return lifetime;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b63
// Size: 0xf7
function private function_fb089abb8dac6216() {
    root = function_ecdae672c660149e();
    delay_min = function_edeba0070ca0709e("model_drop_delay_min");
    delay_max = function_edeba0070ca0709e("model_drop_delay_max");
    var_831b878dd6035ee6 = function_edeba0070ca0709e("model_drop_delay_distance_outer");
    var_c1c64a2ce4ac014d = function_edeba0070ca0709e("model_drop_delay_distance_inner");
    if (istrue(root.var_a43bd6a1b5aa5858)) {
        return delay_min;
    }
    e_player = getclosest(self.origin, level.players);
    if (!isdefined(e_player)) {
        return delay_max;
    }
    n_distance = distance(e_player.origin, self.origin);
    if (n_distance > var_831b878dd6035ee6) {
        return delay_min;
    } else if (n_distance < var_c1c64a2ce4ac014d) {
        return delay_max;
    }
    n_delay = mapfloat(var_c1c64a2ce4ac014d, var_831b878dd6035ee6, delay_max, delay_min, n_distance);
    return n_delay;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c62
// Size: 0x1e
function function_1652f8a8050283bd(var_a24595ceea8d9a67, var_9c82af4273cc1f01) {
    return randomintrange(var_a24595ceea8d9a67, var_9c82af4273cc1f01 + 1);
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c88
// Size: 0x27
function function_ecdae672c660149e() {
    if (!isdefined(level.var_8534f8d8b880d159)) {
        level.var_8534f8d8b880d159 = spawnstruct();
    }
    return level.var_8534f8d8b880d159;
}

// Namespace powerups/namespace_55af56d47545b2f7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cb7
// Size: 0xbe
function function_e2b8eeccc951133f(a_params) {
    /#
        var_580aba0d7d779ed2 = isdefined(a_params[1]) ? int(a_params[1]) : 1;
        str_powerup = a_params[0];
        root = function_ecdae672c660149e();
        if (var_580aba0d7d779ed2) {
            offset = (0, 0, function_edeba0070ca0709e(", does not exist in the powerup list. Please check the poweruplist asset in APE for that powerup ref."));
            v_spawn_pos = namespace_b032b0cc17b10064::function_9b4c82dba041b23d() + offset - (0, 0, 8);
            if (isdefined(v_spawn_pos) && isdefined(function_519d44e54a9b8ae5(str_powerup))) {
                e_powerup = namespace_2b1145f62aa835b8::function_f4927f5a7aa5c6ab(str_powerup, v_spawn_pos);
            }
        } else {
            level.var_7f2e8af1175e5aa5 = str_powerup;
        }
    #/
}

