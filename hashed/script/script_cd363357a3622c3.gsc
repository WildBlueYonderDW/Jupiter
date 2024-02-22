// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_6ad4f9e2f4c6105;
#using script_5fd79768b8941cfb;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gametypes\br_dev.gsc;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace namespace_8d21700b75348f98;

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37d
// Size: 0x2d
function init() {
    function_4eb0bb5b9718da16();
    namespace_17c25f0877bfb620::scriptable_addusedcallback(&train_control_used);
    /#
        namespace_e4c20df2c9115a56::registerhandlecommand(&function_c96d7535862e245c);
    #/
    thread function_6897c2cb1d85fbce();
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b1
// Size: 0x38
function function_4eb0bb5b9718da16() {
    level.wztrain_info.var_164f7d6ed6e374a9 = [];
    level.wztrain_info.var_164f7d6ed6e374a9["cargo_train"] = function_dd750d5096824adf();
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f0
// Size: 0x1e9
function function_6897c2cb1d85fbce() {
    level endon("game_ended");
    waitframe();
    function_e3c620206b7b1178(&function_21d9e76c22c14c60);
    foreach (var_949475d0823bc895, controls in level.wztrain_info.var_164f7d6ed6e374a9) {
        thread function_1ce68ec392d1950a(var_949475d0823bc895);
    }
    flag_wait("wztrain_anim_playing");
    foreach (var_949475d0823bc895, controls in level.wztrain_info.var_164f7d6ed6e374a9) {
        function_bc93036ea42dca0(var_949475d0823bc895);
        var_f1c8827adb8d65b6 = level.wztrain_info.var_c3604781a9d33a7a[var_949475d0823bc895][0].linked_model;
        var_f1c8827adb8d65b6 setscriptablepartstate("train_control_horn", "moving");
        if (var_f1c8827adb8d65b6 getscriptablehaspart("train_part")) {
            var_f1c8827adb8d65b6 setscriptablepartstate("train_part", "moving");
        }
        level thread function_cb3e15ba0b19f1f(controls, level.wztrain_info.var_c3604781a9d33a7a[var_949475d0823bc895]);
    }
    /#
        if (getdvarint(@"hash_2c16009ad16f1d64", 0)) {
            foreach (var_949475d0823bc895, var_75c95b8ce9f4b161 in level.wztrain_info.var_c3604781a9d33a7a) {
                if (!isdefined(level.wztrain_info.var_164f7d6ed6e374a9[var_949475d0823bc895])) {
                    continue;
                }
                var_75c95b8ce9f4b161[0] thread function_3c251653418a4e3d();
                var_75c95b8ce9f4b161[var_75c95b8ce9f4b161.size - 1] thread function_c3f6cedf4261e108();
            }
        }
    #/
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e0
// Size: 0xb5
function function_dd750d5096824adf() {
    controls = spawnstruct();
    controls.var_d0cfc1484a31a31a = getdvarfloat(@"hash_d29dc09dffa5807", 0.208);
    controls.var_34b5b36b72aa61e2 = getdvarfloat(@"hash_f2e7d1767a506f1b", 0.6);
    controls.var_505c60a2fad2e60d = [0:0, 1:0.5];
    controls.var_48aa5e1066cad16f = 1;
    controls.var_af88955a3db74e7b = getdvarint(@"hash_aafd86e488bc3ce5", 1);
    controls.var_5efff1544a2b7a1a = "free";
    controls.var_c10fe7f57dc50f60 = 0;
    return controls;
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x69d
// Size: 0x4d
function private function_1ce68ec392d1950a(var_949475d0823bc895) {
    level endon("game_ended");
    var_9fe9065ceed7d314 = level.wztrain_info.var_c3604781a9d33a7a[var_949475d0823bc895][0];
    while (1) {
        var_9fe9065ceed7d314 waittill("reset_train_controls");
        function_9ed49aceba7a7ae0(var_949475d0823bc895);
    }
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6f1
// Size: 0xcc
function function_7e0ab31db5a32c39(var_949475d0823bc895, var_df2013d99f59c1ae) {
    level endon("game_ended");
    controls = level.wztrain_info.var_164f7d6ed6e374a9[var_949475d0823bc895];
    if (!isdefined(controls)) {
        return;
    }
    now = gettime();
    var_9c31e31440c8df79 = now + var_df2013d99f59c1ae * 1000;
    if (isdefined(controls.var_9c31e31440c8df79) && controls.var_9c31e31440c8df79 > var_9c31e31440c8df79) {
        return;
    }
    controls.var_9c31e31440c8df79 = var_9c31e31440c8df79;
    var_9fe9065ceed7d314 = level.wztrain_info.var_c3604781a9d33a7a[var_949475d0823bc895][0];
    var_9fe9065ceed7d314 notify("train_control_reset_delayed");
    var_9fe9065ceed7d314 endon("train_control_reset_delayed");
    wait(var_df2013d99f59c1ae);
    function_9ed49aceba7a7ae0(var_949475d0823bc895);
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7c4
// Size: 0xca
function function_9ed49aceba7a7ae0(var_949475d0823bc895) {
    controls = level.wztrain_info.var_164f7d6ed6e374a9[var_949475d0823bc895];
    if (!isdefined(controls)) {
        return;
    }
    controls.var_5efff1544a2b7a1a = "free";
    controls.var_c10fe7f57dc50f60 = 0;
    controls.var_48aa5e1066cad16f = 1;
    function_bc93036ea42dca0(var_949475d0823bc895);
    function_6e71ccb81deeb55b(var_949475d0823bc895, controls.var_d0cfc1484a31a31a);
    if (isdefined(controls.var_4116cb12fcdf92cf) && isplayer(controls.var_4116cb12fcdf92cf)) {
        controls.var_4116cb12fcdf92cf function_39b5cec1323e813e(0, 0, 0, 0, 0, 0, 0, 0, 0, "", 0, 1);
        controls.var_4116cb12fcdf92cf = undefined;
    }
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x895
// Size: 0xc5
function function_7e9ea79eb0196f0d(train, state) {
    controls = level.wztrain_info.var_164f7d6ed6e374a9[train];
    if (!isdefined(controls)) {
        return;
    }
    if (controls.var_5efff1544a2b7a1a == state) {
        return;
    }
    controls.var_5efff1544a2b7a1a = state;
    if (getdvarint(@"hash_4eee316904a2408c", 0) == 1) {
        if (state == "free") {
            function_6ec6dbd953660756(train, "dx_br_jpbm_wztr_trco_brdi", 1);
        } else if (state == "engaged") {
            function_6ec6dbd953660756(train, "dx_br_jpbm_wztr_trco_brtr", 1);
        }
    }
    function_6e71ccb81deeb55b(train, controls.var_34b5b36b72aa61e2);
    function_bc93036ea42dca0(train);
    function_21d9e76c22c14c60(train);
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x961
// Size: 0x37a
function train_control_used(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!function_7bafeacef59f5c1(part)) {
        return;
    }
    train = function_7583cb74034d366c(instance);
    if (!isdefined(train)) {
        return;
    }
    controls = level.wztrain_info.var_164f7d6ed6e374a9[train];
    if (!isdefined(controls)) {
        return;
    }
    var_43de87c69d6afdbc = part;
    var_bccc62d5f33dc568 = player;
    result_success = 0;
    player thread function_21c30228852aebeb();
    if (part == "train_control_horn") {
        instance function_e5b02b44240eb902("train_control_horn");
        level thread function_c344e131688312f(train);
        player function_39b5cec1323e813e(0, 0, 1);
        result_success = 1;
    } else if (part == "train_control_brake") {
        if (controls.var_5efff1544a2b7a1a == "engaged") {
            function_7e9ea79eb0196f0d(train, "free");
            if (controls.var_48aa5e1066cad16f != 0) {
                function_10cce231da3f017a(train, "train_accelerate");
            }
        } else {
            function_7e9ea79eb0196f0d(train, "engaged");
            if (controls.var_48aa5e1066cad16f != 0) {
                function_10cce231da3f017a(train, "handbrake_engaged");
            }
        }
        player function_39b5cec1323e813e(0, 0, 0, 1);
        result_success = 1;
    } else if (controls.var_5efff1544a2b7a1a == "engaged") {
        /#
            announcement(train + "train_speed_vfx");
        #/
    } else {
        if (part == "train_control_speed") {
            if (controls.var_48aa5e1066cad16f == 0) {
                controls.var_48aa5e1066cad16f = 1;
                if (getdvarint(@"hash_4eee316904a2408c", 0) == 1) {
                    function_6ec6dbd953660756(train, "dx_br_jpbm_wztr_trco_acce", 1);
                }
                function_10cce231da3f017a(train, "train_accelerate");
            } else {
                controls.var_48aa5e1066cad16f = 0;
                if (getdvarint(@"hash_4eee316904a2408c", 0) == 1) {
                    function_6ec6dbd953660756(train, "dx_br_jpbm_wztr_trco_stop", 1);
                }
                function_10cce231da3f017a(train, "train_brake");
            }
            player function_39b5cec1323e813e(0, 1);
        } else if (part == "train_control_direction") {
            controls.var_c10fe7f57dc50f60 = !controls.var_c10fe7f57dc50f60;
            function_81c2bfe1e0c366a1(train);
            player function_39b5cec1323e813e(1);
        }
        controls.var_48aa5e1066cad16f = abs(controls.var_48aa5e1066cad16f) * ter_op(controls.var_c10fe7f57dc50f60, -1, 1);
        function_6e71ccb81deeb55b(train, controls.var_d0cfc1484a31a31a);
        result_success = 1;
    }
    if (result_success) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("ftue", "player_action")) {
            player [[ namespace_3c37cb17ade254d::getsharedfunc("ftue", "player_action") ]]("br_ftue_train_controls");
        }
    }
    var_740ed0893c883b16 = getdvarfloat(@"hash_a54fa6f96163c9ec", 60);
    if (var_740ed0893c883b16 >= 0 && result_success && function_22210d8bc6894d7f(part)) {
        level thread function_7e0ab31db5a32c39(train, var_740ed0893c883b16);
    }
    controls.var_4116cb12fcdf92cf = player;
    traincar = instance.entity.linked_brush;
    traincar notify("train_control_used", var_43de87c69d6afdbc);
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xce2
// Size: 0x9f
function private function_6e71ccb81deeb55b(var_949475d0823bc895, var_60278bcb8ac1212b) {
    controls = level.wztrain_info.var_164f7d6ed6e374a9[var_949475d0823bc895];
    if (!isdefined(controls)) {
        return;
    }
    var_b3e01b11d76e1db6 = sign(controls.var_48aa5e1066cad16f) * controls.var_505c60a2fad2e60d[int(abs(controls.var_48aa5e1066cad16f))];
    if (controls.var_5efff1544a2b7a1a == "engaged") {
        var_b3e01b11d76e1db6 = 0;
    }
    level thread train_change_speed(var_949475d0823bc895, var_60278bcb8ac1212b, var_b3e01b11d76e1db6);
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd88
// Size: 0xef
function function_21c30228852aebeb() {
    self endon("death_or_disconnect");
    var_a7408dbfed49f3f9 = makeweapon("iw8_ges_plyr_loot_pickup");
    self giveandfireoffhand(var_a7408dbfed49f3f9);
    nearbyplayers = function_143526130b12b2b6(self.origin, 40);
    foreach (player in nearbyplayers) {
        vehicle_allowplayeruse(player, 0);
    }
    wait(1.17);
    foreach (player in nearbyplayers) {
        vehicle_allowplayeruse(player, 1);
    }
    if (self hasweapon(var_a7408dbfed49f3f9)) {
        self takeweapon(var_a7408dbfed49f3f9);
    }
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe7e
// Size: 0x11d
function train_control_speed(train) {
    level endon("game_ended");
    flag_wait("wztrain_anim_playing");
    function_bc93036ea42dca0(train);
    /#
        control = level.wztrain_info.var_164f7d6ed6e374a9[train];
        if (!isdefined(control)) {
            return;
        }
        while (1) {
            wait(1);
            var_b3e01b11d76e1db6 = getdvarfloat(@"hash_d73a064cedac973c", -2);
            if (var_b3e01b11d76e1db6 != -2) {
                var_b3e01b11d76e1db6 = clamp(var_b3e01b11d76e1db6, -1, 1);
                if (!control.var_af88955a3db74e7b) {
                    var_b3e01b11d76e1db6 = max(var_b3e01b11d76e1db6, 0);
                }
                level thread train_change_speed(train, control.var_d0cfc1484a31a31a, var_b3e01b11d76e1db6);
                announcement("<unknown string>" + train + "<unknown string>" + var_b3e01b11d76e1db6);
                setdvar(@"hash_d73a064cedac973c", -2);
            }
            if (getdvarint(@"hash_aa31e3c9a2144a3c", 0) > 0) {
                level thread function_7af6d73425acffca(train);
                setdvar(@"hash_aa31e3c9a2144a3c", 0);
            }
        }
    #/
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xfa2
// Size: 0x246
function train_change_speed(train, var_60278bcb8ac1212b, var_b3e01b11d76e1db6) {
    level endon("game_ended");
    level notify("train_change_speed");
    level endon("train_change_speed");
    var_fe1033cae51778cc = level.wztrain_info.animrate[train];
    var_b2a3f9abcee9d071 = level.wztrain_info.var_b2a3f9abcee9d071[train];
    animtoplay = var_b2a3f9abcee9d071.anim_override;
    var_e26f44acad48ddd1 = level.scr_anim[train][animtoplay];
    if (isarray(var_e26f44acad48ddd1)) {
        var_e26f44acad48ddd1 = level.scr_anim[train][animtoplay][0];
    }
    var_15777982c0909b37 = level.wztrain_info.var_c3604781a9d33a7a[train];
    if (var_fe1033cae51778cc != 0) {
        foreach (traincar in var_15777982c0909b37) {
            temp = traincar.linked_model getlinkedscriptableinstance();
            if (traincar.linked_model getscriptablehaspart("train_speed_vfx")) {
                traincar.linked_model setscriptablepartstate("train_speed_vfx", "slowing");
            }
        }
    }
    while (1) {
        var_fe1033cae51778cc = function_a2865fbe60ae30a8(train, var_60278bcb8ac1212b, var_b3e01b11d76e1db6);
        function_bc93036ea42dca0(train);
        if (var_fe1033cae51778cc == var_b3e01b11d76e1db6) {
            break;
        }
        waitframe();
    }
    var_dfd7cd7e4ca1ca61 = "stopped";
    if (var_fe1033cae51778cc != 0) {
        var_dfd7cd7e4ca1ca61 = "moving";
    }
    foreach (traincar in var_15777982c0909b37) {
        if (traincar.linked_model getscriptablehaspart("train_speed_vfx")) {
            traincar.linked_model setscriptablepartstate("train_speed_vfx", var_dfd7cd7e4ca1ca61);
        }
    }
    function_fa60abd0913d1578(train, var_b3e01b11d76e1db6);
    function_bc93036ea42dca0(train);
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11ef
// Size: 0x295
function function_bc93036ea42dca0(train) {
    var_d1eea60321b43092 = level.wztrain_info.var_c3604781a9d33a7a[train].size - 1;
    var_f1c8827adb8d65b6 = level.wztrain_info.var_c3604781a9d33a7a[train][0].linked_model;
    var_d4bd4a2dc32512f8 = level.wztrain_info.var_c3604781a9d33a7a[train][var_d1eea60321b43092].linked_model;
    controls = level.wztrain_info.var_164f7d6ed6e374a9[train];
    if (!isdefined(controls)) {
        return;
    }
    var_50585dd87b7115ca = controls.var_48aa5e1066cad16f;
    var_e9a4c0a810ecf2d = controls.var_c10fe7f57dc50f60;
    var_10df6f215d4573fb = controls.var_505c60a2fad2e60d.size - 1;
    if (level.wztrain_info.var_8fff939a9d90ecab) {
        if (controls.var_5efff1544a2b7a1a == "locked_gas" && namespace_c5622898120e827f::function_24c5a8d31ae262f(var_f1c8827adb8d65b6.origin)) {
            var_f1c8827adb8d65b6 function_6486de250ce58910("train_control_speed");
        } else if (controls.var_5efff1544a2b7a1a == "engaged") {
            var_f1c8827adb8d65b6 function_e5b02b44240eb902("train_control_speed");
        } else if (var_50585dd87b7115ca != 0) {
            var_f1c8827adb8d65b6 function_ee91d3658ebaf03e("train_control_speed");
        } else {
            var_f1c8827adb8d65b6 function_11d65d952fe2f131("train_control_speed");
        }
        if (controls.var_5efff1544a2b7a1a == "engaged") {
            var_f1c8827adb8d65b6 function_e5b02b44240eb902("train_control_direction");
        } else if (!var_e9a4c0a810ecf2d) {
            var_f1c8827adb8d65b6 function_ee91d3658ebaf03e("train_control_direction");
        } else {
            var_f1c8827adb8d65b6 function_11d65d952fe2f131("train_control_direction");
        }
        if (controls.var_5efff1544a2b7a1a == "locked_gas" && namespace_c5622898120e827f::function_24c5a8d31ae262f(var_f1c8827adb8d65b6.origin)) {
            var_d4bd4a2dc32512f8 function_6486de250ce58910("train_control_brake");
        } else if (controls.var_5efff1544a2b7a1a == "engaged") {
            var_d4bd4a2dc32512f8 function_ee91d3658ebaf03e("train_control_brake");
        } else {
            var_d4bd4a2dc32512f8 function_6166908ef79c21eb("train_control_brake");
        }
    }
    var_52a9cca12dad1d11 = var_f1c8827adb8d65b6 getscriptablepartstate("train_control_horn");
    if (var_52a9cca12dad1d11 != "locked") {
        var_f5639d7afa3d430a = ter_op(var_50585dd87b7115ca != 0, "moving", "stopped");
        var_f1c8827adb8d65b6 setscriptablepartstate("train_control_horn", var_f5639d7afa3d430a);
    }
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x148b
// Size: 0x19
function function_ee91d3658ebaf03e(part) {
    function_8fe9e563b974b56(part, "active");
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14ab
// Size: 0x19
function function_b0b5dbf3a3303a8d(part) {
    function_8fe9e563b974b56(part, "inactive");
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14cb
// Size: 0x19
function function_6166908ef79c21eb(part) {
    function_8fe9e563b974b56(part, "neutral");
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14eb
// Size: 0x19
function function_11d65d952fe2f131(part) {
    function_8fe9e563b974b56(part, "inverted");
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x150b
// Size: 0x19
function function_ae7becf37e2c0913(part) {
    function_8fe9e563b974b56(part, "saturated");
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x152b
// Size: 0x19
function function_e5b02b44240eb902(part) {
    function_8fe9e563b974b56(part, "locked");
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x154b
// Size: 0x19
function function_6486de250ce58910(part) {
    function_8fe9e563b974b56(part, "locked_gas");
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x156b
// Size: 0x39
function function_8fe9e563b974b56(part, state) {
    var_b60a7b508801fee5 = self;
    if (isdefined(var_b60a7b508801fee5) && var_b60a7b508801fee5 getscriptablehaspart(part)) {
        var_b60a7b508801fee5 setscriptablepartstate(part, state);
    }
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x15ab
// Size: 0x189
function private function_21d9e76c22c14c60(var_949475d0823bc895) {
    controls = level.wztrain_info.var_164f7d6ed6e374a9[var_949475d0823bc895];
    if (!isdefined(controls)) {
        return;
    }
    var_15777982c0909b37 = level.wztrain_info.var_c3604781a9d33a7a[var_949475d0823bc895];
    currentspeed = abs(level.wztrain_info.animrate[var_949475d0823bc895]);
    is_moving = currentspeed > 0;
    switch (controls.var_5efff1544a2b7a1a) {
    case #"hash_a8f0b714fb0cb53b":
        var_3fca324665aa201b = "free";
        break;
    case #"hash_457675bf573bc05e":
        var_3fca324665aa201b = ter_op(is_moving, "engaged_moving", "engaged_stopped");
        break;
    case #"hash_1a60086c17c232a3":
        var_3fca324665aa201b = ter_op(is_moving, "cut_moving", "cut_stopped");
        break;
    }
    foreach (traincar in var_15777982c0909b37) {
        if (traincar.linked_model getscriptablehaspart("train_brakes_vfx") && controls.var_5efff1544a2b7a1a != "locked_gas") {
            traincar.linked_model setscriptablepartstate("train_brakes_vfx", var_3fca324665aa201b);
        }
    }
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x173b
// Size: 0x11c
function function_10cce231da3f017a(var_949475d0823bc895, var_ac77449d8723f546) {
    var_15777982c0909b37 = level.wztrain_info.var_c3604781a9d33a7a[var_949475d0823bc895];
    /#
        assertex(isarray(var_15777982c0909b37), "train_scriptable_sounds: car_array is not an array");
    #/
    if (!isarray(level.wztrain_info.var_132b68e7763c2410)) {
        level.wztrain_info.var_132b68e7763c2410 = [];
    }
    var_fab5ed56567693ab = level.wztrain_info.var_132b68e7763c2410[var_949475d0823bc895];
    if (isstring(var_fab5ed56567693ab) && var_fab5ed56567693ab == var_ac77449d8723f546) {
        return;
    } else {
        level.wztrain_info.var_132b68e7763c2410[var_949475d0823bc895] = var_ac77449d8723f546;
    }
    i = 0;
    while (i < var_15777982c0909b37.size) {
        traincar = var_15777982c0909b37[i];
        if (traincar.linked_model getscriptablehaspart("train_control_sfx")) {
            traincar.linked_model setscriptablepartstate("train_control_sfx", var_ac77449d8723f546);
        }
        i = i + 2;
    }
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x185e
// Size: 0x89
function function_c344e131688312f(var_949475d0823bc895) {
    wait(1.2);
    var_fe1033cae51778cc = level.wztrain_info.animrate[var_949475d0823bc895];
    var_f1c8827adb8d65b6 = level.wztrain_info.var_c3604781a9d33a7a[var_949475d0823bc895][0].linked_model;
    var_f5639d7afa3d430a = ter_op(var_fe1033cae51778cc != 0, "moving", "stopped");
    var_f1c8827adb8d65b6 setscriptablepartstate("train_control_horn", var_f5639d7afa3d430a);
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18ee
// Size: 0x30
function function_81c2bfe1e0c366a1(var_949475d0823bc895) {
    function_10cce231da3f017a(var_949475d0823bc895, "train_brake");
    delaythread(3, &function_10cce231da3f017a, var_949475d0823bc895, "train_accelerate");
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1925
// Size: 0x159
function function_cb3e15ba0b19f1f(controls, train) {
    if (!getdvarint(@"hash_424b8a3a18e485d6", 1)) {
        return;
    }
    level endon("game_ended");
    var_e6ab92df6605e9a4 = train[0];
    var_b2a3f9abcee9d071 = level.wztrain_info.var_b2a3f9abcee9d071[var_e6ab92df6605e9a4.var_949475d0823bc895];
    while (!istrue(var_b2a3f9abcee9d071.var_3d65b0f78159fb)) {
        waitframe();
    }
    while (1) {
        var_1c1ca1171e5d6bc2 = var_e6ab92df6605e9a4.linked_model getscriptablepartstate("train_control_speed");
        if (namespace_c5622898120e827f::function_24c5a8d31ae262f(var_e6ab92df6605e9a4.origin)) {
            if (controls.var_48aa5e1066cad16f == 0 || controls.var_5efff1544a2b7a1a == "engaged") {
                function_9ed49aceba7a7ae0(var_e6ab92df6605e9a4.var_949475d0823bc895);
            }
            var_e6ab92df6605e9a4.linked_model function_6486de250ce58910("train_control_speed");
            function_7e9ea79eb0196f0d(var_e6ab92df6605e9a4.var_949475d0823bc895, "locked_gas");
        } else if (var_1c1ca1171e5d6bc2 == "locked_gas") {
            var_e6ab92df6605e9a4.linked_model function_ee91d3658ebaf03e("train_control_speed");
            function_7e9ea79eb0196f0d(var_e6ab92df6605e9a4.var_949475d0823bc895, "free");
        }
        wait(5);
    }
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a85
// Size: 0xc5
function function_7583cb74034d366c(var_3a276adb9db19499) {
    foreach (var_949475d0823bc895, var_d094192279470561 in level.wztrain_info.var_c3604781a9d33a7a) {
        foreach (var_cd77ae761e0782cd in var_d094192279470561) {
            if (var_3a276adb9db19499.entity == var_cd77ae761e0782cd.linked_model) {
                return var_949475d0823bc895;
            }
        }
    }
    return undefined;
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b52
// Size: 0x34
function function_7bafeacef59f5c1(part) {
    return part == "train_control_speed" || part == "train_control_direction" || part == "train_control_horn" || part == "train_control_brake";
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1b8e
// Size: 0x29
function private function_22210d8bc6894d7f(part) {
    return part == "train_control_brake" || part == "train_control_speed" || part == "train_control_direction";
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1bbf
// Size: 0xb0
function private function_c96d7535862e245c(command, args) {
    firstplayer = level.players[0];
    if (!isdefined(firstplayer)) {
        return;
    }
    switch (command) {
    case #"hash_2899e5a679a1e049":
        if (!isdefined(args[0])) {
            break;
        }
        switch (args[0]) {
        case #"hash_1cf09102712cef10":
            if (!isdefined(args[1])) {
                break;
            }
            if (args[1] == "cut" || args[1] == "engaged" || args[1] == "free") {
                function_7e9ea79eb0196f0d("cargo_train", args[1]);
            }
            break;
        }
        break;
    }
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c76
// Size: 0x12f
function function_3c251653418a4e3d() {
    level endon("game_ended");
    var_19eaf2b704a9fa99 = (96, 0, 60);
    var_250d564bc5afa2c2 = (-96, 0, 60);
    var_8e5fb7ac062f72a5 = (0, 0, 60);
    var_2ce41e65c3b440c9 = (0, 1, 0);
    var_b0cdc5bf8cf8ba12 = (1, 0, 0);
    var_9bcaa2cd4b55a075 = (0.5, 0, 1);
    var_d9d3d9d7c84f6e21 = 20;
    while (1) {
        utility::draw_capsule(self localtoworldcoords(var_19eaf2b704a9fa99) + (0, 0, var_d9d3d9d7c84f6e21 * -1), var_d9d3d9d7c84f6e21, var_d9d3d9d7c84f6e21 * 2, (0, 0, 0), var_2ce41e65c3b440c9, 0);
        utility::draw_capsule(self localtoworldcoords(var_250d564bc5afa2c2) + (0, 0, var_d9d3d9d7c84f6e21 * -1), var_d9d3d9d7c84f6e21, var_d9d3d9d7c84f6e21 * 2, (0, 0, 0), var_b0cdc5bf8cf8ba12, 0);
        utility::draw_capsule(self localtoworldcoords(var_8e5fb7ac062f72a5) + (0, 0, var_d9d3d9d7c84f6e21 * -1), var_d9d3d9d7c84f6e21, var_d9d3d9d7c84f6e21 * 2, (0, 0, 0), var_9bcaa2cd4b55a075, 0);
        waitframe();
    }
}

// Namespace namespace_8d21700b75348f98/namespace_5df6997df92bb4a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dac
// Size: 0x7a
function function_c3f6cedf4261e108() {
    level endon("game_ended");
    var_b34c2ff00f78169c = (0, 0, 60);
    var_5686441a1d2fd1ac = (1, 0, 0);
    var_d9d3d9d7c84f6e21 = 20;
    while (1) {
        utility::draw_capsule(self localtoworldcoords(var_b34c2ff00f78169c) + (0, 0, var_d9d3d9d7c84f6e21 * -1), var_d9d3d9d7c84f6e21, var_d9d3d9d7c84f6e21 * 2, (0, 0, 0), var_5686441a1d2fd1ac, 0);
        waitframe();
    }
}

