// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\scriptable.gsc;
#using script_67fb1233e876ed8;
#using scripts\mp\gametypes\br_functional_poi.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace namespace_bbd71179be099380;

// Namespace namespace_bbd71179be099380/namespace_ba90759e150897e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e9
// Size: 0x1dc
function init() {
    if (!isenabled()) {
        return;
    }
    level.var_ed20ae31a47f989f = spawnstruct();
    level.var_ed20ae31a47f989f.var_9be11ff458712883 = [];
    level.var_ed20ae31a47f989f.var_84c8c837e7a7644d = [];
    level.var_ed20ae31a47f989f.var_1a5aa18908f2d6b1 = [];
    level.var_ed20ae31a47f989f.var_893573278fdd3634 = 0;
    level.var_ed20ae31a47f989f.var_c9beeaf4e87bbf73 = getdvarint(@"hash_541a5f0187a7c428", 0);
    level.var_ed20ae31a47f989f.var_5a8c5ca1df0ae11d = getdvarint(@"hash_f245a26cc1fc582", 0);
    level.var_ed20ae31a47f989f.var_d312de18b3bed3e7 = getdvarint(@"hash_36e4b28f99c3d64c", 0);
    level.var_ed20ae31a47f989f.var_8071261d28324a16 = getdvarfloat(@"hash_423367c04ee7dd39", 1);
    level.var_ed20ae31a47f989f.var_dd0b7f81bf42a5ea = getdvarint(@"hash_779153d042fa9de7", 360);
    level.var_ed20ae31a47f989f.var_70da8bb6903d62dc = &onprematchdone;
    /#
        level.var_ed20ae31a47f989f.var_a0345a183786f074 = &function_790c4dd4cb830412;
    #/
    namespace_17c25f0877bfb620::scriptable_addusedcallback(&scriptable_used);
    namespace_17c25f0877bfb620::scriptable_addautousecallback(&scriptable_used);
    if (getdvarint(@"hash_8823e2f4a428cfc1", 0) && getdvarint(@"hash_89be1a979c1ec008", 0)) {
        namespace_7052decdced06e44::function_4f7660cfd85cd517("broken_atm", &function_e6c1c35181a2870f);
        namespace_7052decdced06e44::function_412f527ef0863f0e("broken_atm", &function_e0b56dfd8b5b7f97);
    }
    level.var_ed20ae31a47f989f.conf_fx["sparks"] = loadfx("vfx/iw8_br/gameplay/vfx_sparks_atm.vfx");
}

// Namespace namespace_bbd71179be099380/namespace_ba90759e150897e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cc
// Size: 0x2a
function isenabled() {
    if (getdvarint(@"hash_a6b7002b1a7fef73", 0) == 0) {
        return 0;
    }
    if (!istrue(level.br_plunder_enabled)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_bbd71179be099380/namespace_ba90759e150897e3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3fe
// Size: 0xb6
function function_e0b56dfd8b5b7f97(var_cab957adc8d7710f, var_6aaa6a5dcfa4d64d) {
    var_6aaa6a5dcfa4d64d.var_2954ef0ba3ca0371 = level.var_ed20ae31a47f989f.var_893573278fdd3634;
    level.var_ed20ae31a47f989f.var_893573278fdd3634++;
    level.var_ed20ae31a47f989f.var_9be11ff458712883[var_6aaa6a5dcfa4d64d.var_2954ef0ba3ca0371] = [];
    if (!isdefined(level.var_ed20ae31a47f989f.var_863fb512af8a5a97)) {
        level.var_ed20ae31a47f989f.var_863fb512af8a5a97 = [];
    }
    level.var_ed20ae31a47f989f.var_863fb512af8a5a97[var_6aaa6a5dcfa4d64d.var_2954ef0ba3ca0371] = var_6aaa6a5dcfa4d64d;
    return var_6aaa6a5dcfa4d64d;
}

// Namespace namespace_bbd71179be099380/namespace_ba90759e150897e3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4bc
// Size: 0x2f
function function_72758b0b1dc1e468(interval, limit) {
    self setscriptablepartstate("broken_atm", "disabled");
    thread function_443d890d24291fd5(interval, limit);
}

// Namespace namespace_bbd71179be099380/namespace_ba90759e150897e3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4f2
// Size: 0x33
function function_3e992620ba9a364c(var_b512f2c3531420fc, interval, limit) {
    function_e0b56dfd8b5b7f97("broken_atm", var_b512f2c3531420fc);
    var_b512f2c3531420fc function_72758b0b1dc1e468(interval, limit);
}

// Namespace namespace_bbd71179be099380/namespace_ba90759e150897e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x52c
// Size: 0x23
function function_e6c1c35181a2870f(var_cab957adc8d7710f) {
    var_27115cae178779e0 = getentitylessscriptablearray(var_cab957adc8d7710f, "classname");
    return var_27115cae178779e0;
}

// Namespace namespace_bbd71179be099380/namespace_ba90759e150897e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x557
// Size: 0x194
function onprematchdone() {
    if (!isenabled()) {
        return;
    }
    interval = getdvarfloat(@"hash_28e4c03ec51ad158", 5);
    limit = getdvarint(@"hash_76f1fd6cd7e4d0a7", 3);
    if (getdvarint(@"hash_8823e2f4a428cfc1", 0) && getdvarint(@"hash_89be1a979c1ec008", 0)) {
        foreach (var_b512f2c3531420fc in level.var_ed20ae31a47f989f.var_863fb512af8a5a97) {
            if (!isdefined(var_b512f2c3531420fc)) {
                continue;
            }
            var_b512f2c3531420fc function_72758b0b1dc1e468(interval, limit);
        }
    } else {
        atms = function_e6c1c35181a2870f();
        var_de49da8d08d362d4 = int(ceil(atms.size * level.var_ed20ae31a47f989f.var_8071261d28324a16));
        level.var_ed20ae31a47f989f.var_863fb512af8a5a97 = namespace_15111e421d79d07d::_getrandomlocations(atms, var_de49da8d08d362d4);
        foreach (var_b512f2c3531420fc in level.var_ed20ae31a47f989f.var_863fb512af8a5a97) {
            if (!isdefined(var_b512f2c3531420fc)) {
                continue;
            }
            function_3e992620ba9a364c(var_b512f2c3531420fc, interval, limit);
        }
    }
}

// Namespace namespace_bbd71179be099380/namespace_ba90759e150897e3
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6f2
// Size: 0x68
function function_648885bad3260249(pos, angles, interval, limit) {
    if (!isenabled()) {
        return;
    }
    /#
        assert(limit > 0);
    #/
    /#
        assert(interval > 0);
    #/
    var_b512f2c3531420fc = spawnscriptable("broken_atm_scriptable", pos, angles);
    function_3e992620ba9a364c(var_b512f2c3531420fc, interval, limit);
    return var_b512f2c3531420fc;
}

// Namespace namespace_bbd71179be099380/namespace_ba90759e150897e3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x762
// Size: 0x9b9
function function_443d890d24291fd5(interval, limit) {
    level endon("game_ended");
    level endon("force_end");
    var_2006f940c17ea89b = getdvarfloat(@"hash_acea47f92cfde4e", 0);
    if (var_2006f940c17ea89b > 0) {
        wait(var_2006f940c17ea89b);
    }
    self setscriptablepartstate("broken_atm", "visible");
    var_33927d95d36d0798 = self.angles[1];
    var_ef17285813d8af9d = level.var_ed20ae31a47f989f.var_dd0b7f81bf42a5ea;
    var_f638ffb0f773a822 = var_ef17285813d8af9d / limit;
    var_33927d95d36d0798 = var_33927d95d36d0798 - var_ef17285813d8af9d / 2;
    level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371] = [];
    if (limit > 1) {
        currentyaw = var_33927d95d36d0798;
        currentyaw = currentyaw - var_f638ffb0f773a822 / 2;
        if (currentyaw < 0) {
            currentyaw = currentyaw + 360;
        }
        level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371][0] = currentyaw;
        for (i = 0; i < limit; i++) {
            var_ebf05b5978327ec0 = currentyaw + var_f638ffb0f773a822;
            currentyaw = ter_op(var_ebf05b5978327ec0 > 360, var_ebf05b5978327ec0 - 360, var_ebf05b5978327ec0);
            level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371] = array_add(level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371], currentyaw);
        }
    }
    if (function_b55532d2305486b8() && istrue(level.var_16ef52214ac3a63f.moneysiphon.var_2f1ee623e7fc5c8c)) {
        level.var_ed20ae31a47f989f.var_1a5aa18908f2d6b1[self.var_2954ef0ba3ca0371] = [];
        currentyaw = var_33927d95d36d0798;
        currentyaw = currentyaw - var_f638ffb0f773a822;
        if (currentyaw < 0) {
            currentyaw = currentyaw + 360;
        }
        for (i = 0; i < limit; i++) {
            var_ebf05b5978327ec0 = currentyaw + var_f638ffb0f773a822;
            currentyaw = ter_op(var_ebf05b5978327ec0 > 360, var_ebf05b5978327ec0 - 360, var_ebf05b5978327ec0);
            level.var_ed20ae31a47f989f.var_1a5aa18908f2d6b1[self.var_2954ef0ba3ca0371] = array_add(level.var_ed20ae31a47f989f.var_1a5aa18908f2d6b1[self.var_2954ef0ba3ca0371], currentyaw);
        }
    }
    enabled = 1;
    var_ddf23f6435864493 = 0;
    var_9d71e5c92c6bc2c7 = 0;
    while (1) {
        var_bd34286de6dc8ec6 = interval;
        var_c36f5a77e92e0b92 = function_946fffe773a4b030();
        if (var_c36f5a77e92e0b92 && level.var_16ef52214ac3a63f.moneysiphon.var_bb1d98e538185df4 != 0) {
            var_bd34286de6dc8ec6 = level.var_16ef52214ac3a63f.moneysiphon.var_bb1d98e538185df4;
        }
        wait(var_bd34286de6dc8ec6);
        var_2403c90e287805e0 = function_946fffe773a4b030();
        var_ed0deab380d4f7e9 = level.var_ed20ae31a47f989f.var_9be11ff458712883[self.var_2954ef0ba3ca0371].size;
        if (var_2403c90e287805e0 && !var_c36f5a77e92e0b92) {
            if (!enabled) {
                enabled = 1;
            }
            self setscriptablepartstate("broken_atm", "visible_event");
            if (istrue(level.var_16ef52214ac3a63f.moneysiphon.var_2f1ee623e7fc5c8c)) {
                level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371] = array_combine(level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371], level.var_ed20ae31a47f989f.var_1a5aa18908f2d6b1[self.var_2954ef0ba3ca0371]);
            }
        }
        if (!var_2403c90e287805e0 && var_c36f5a77e92e0b92) {
            if (istrue(level.var_16ef52214ac3a63f.moneysiphon.var_2f1ee623e7fc5c8c)) {
                foreach (var_b5694355ae72abbb in level.var_ed20ae31a47f989f.var_1a5aa18908f2d6b1[self.var_2954ef0ba3ca0371]) {
                    level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371] = array_remove(level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371], var_b5694355ae72abbb);
                }
            }
            enabled = 0;
            self setscriptablepartstate("broken_atm", "disabled");
            var_9d71e5c92c6bc2c7 = gettime() + level.var_16ef52214ac3a63f.moneysiphon.var_f9b722c9edce3106 * 1000;
            var_ddf23f6435864493 = level.var_ed20ae31a47f989f.var_c9beeaf4e87bbf73;
            continue;
        }
        if (var_ed0deab380d4f7e9 >= ter_op(var_2403c90e287805e0 && istrue(level.var_16ef52214ac3a63f.moneysiphon.var_2f1ee623e7fc5c8c), limit * 2, limit)) {
            continue;
        }
        if (!var_2403c90e287805e0 && level.var_ed20ae31a47f989f.var_c9beeaf4e87bbf73 > 0 && var_ddf23f6435864493 >= level.var_ed20ae31a47f989f.var_c9beeaf4e87bbf73) {
            if (level.var_ed20ae31a47f989f.var_5a8c5ca1df0ae11d > 0 || level.var_ed20ae31a47f989f.var_d312de18b3bed3e7 > 0) {
                if (var_9d71e5c92c6bc2c7 == 0) {
                    var_445b8e3c7f65e081 = randomintrange(level.var_ed20ae31a47f989f.var_5a8c5ca1df0ae11d, level.var_ed20ae31a47f989f.var_d312de18b3bed3e7);
                    var_9d71e5c92c6bc2c7 = gettime() + var_445b8e3c7f65e081 * 1000;
                    continue;
                } else if (var_9d71e5c92c6bc2c7 < gettime()) {
                    var_9d71e5c92c6bc2c7 = 0;
                    var_ddf23f6435864493 = 0;
                    enabled = 1;
                    self setscriptablepartstate("broken_atm", "visible");
                } else {
                    continue;
                }
            } else {
                return;
            }
        }
        var_6a87e478c76fd4a5 = isdefined(level.br_plunder) && isdefined(level.br_plunder.quantity) && level.br_plunder.quantity.size > 0;
        if (!var_6a87e478c76fd4a5) {
            continue;
        }
        var_3949d58ef57f9f31 = level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371][level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371].size - 1];
        level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371] = array_remove_index(level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371], level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371].size - 1);
        if (function_b55532d2305486b8()) {
            var_f90d0e006a1f717b = ter_op(var_2403c90e287805e0, level.var_16ef52214ac3a63f.moneysiphon.var_e8fb817a73e06aba, getdvarint(@"hash_4483c0761071ff04", 1));
            var_f90d0e006a1f717b = int(clamp(var_f90d0e006a1f717b, 0, level.br_plunder.quantity.size - 1));
            var_9714ddda6a6df159 = ter_op(var_2403c90e287805e0, level.var_16ef52214ac3a63f.moneysiphon.var_9714ddda6a6df159, getdvarint(@"hash_c27965972eaeb818", 50));
        } else {
            var_f90d0e006a1f717b = int(clamp(getdvarint(@"hash_4483c0761071ff04", 1), 0, level.br_plunder.quantity.size - 1));
            var_9714ddda6a6df159 = getdvarint(@"hash_c27965972eaeb818", 50);
        }
        if (istrue(level.bmoovertime) && isdefined(level.overtimecashmultiplier)) {
            var_9714ddda6a6df159 = int(var_9714ddda6a6df159 * level.overtimecashmultiplier);
        }
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles, undefined, var_3949d58ef57f9f31, undefined, undefined, undefined, undefined, undefined, 1);
        pickupent = namespace_cb965d2f71fefddc::spawnpickup(level.br_plunder.names[var_f90d0e006a1f717b], var_cb4fad49263e20c4, var_9714ddda6a6df159, 1);
        var_1ccee23d5b4508e3 = "br_plunder_broken_atm_";
        var_8d02a463027120aa = "cash";
        playsoundatpos(self.origin + (0, 0, 40), var_1ccee23d5b4508e3 + var_8d02a463027120aa);
        if (isdefined(pickupent)) {
            pickupent.var_2954ef0ba3ca0371 = self.var_2954ef0ba3ca0371;
            pickupent.var_3949d58ef57f9f31 = var_3949d58ef57f9f31;
            level.var_ed20ae31a47f989f.var_9be11ff458712883[self.var_2954ef0ba3ca0371] = array_add(level.var_ed20ae31a47f989f.var_9be11ff458712883[self.var_2954ef0ba3ca0371], pickupent);
            var_ddf23f6435864493++;
        }
        if (!var_2403c90e287805e0 && level.var_ed20ae31a47f989f.var_c9beeaf4e87bbf73 > 0 && var_ddf23f6435864493 >= level.var_ed20ae31a47f989f.var_c9beeaf4e87bbf73 && enabled) {
            enabled = 0;
            self setscriptablepartstate("broken_atm", "disabled");
        }
    }
}

// Namespace namespace_bbd71179be099380/namespace_ba90759e150897e3
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1122
// Size: 0xaa
function scriptable_used(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (isdefined(instance.var_2954ef0ba3ca0371)) {
        if (isdefined(level.br_plunder) && isdefined(level.br_plunder.plunderlimit) && isdefined(player) && isdefined(player.plundercount) && player.plundercount >= level.br_plunder.plunderlimit) {
            return;
        }
        instance function_2cac9989e2b5559a();
    }
}

// Namespace namespace_bbd71179be099380/namespace_ba90759e150897e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11d3
// Size: 0x17
function function_8e782ccfa7a41da6() {
    if (isdefined(self.var_2954ef0ba3ca0371)) {
        function_2cac9989e2b5559a();
    }
}

// Namespace namespace_bbd71179be099380/namespace_ba90759e150897e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11f1
// Size: 0x156
function function_2cac9989e2b5559a() {
    if (isdefined(self.var_2954ef0ba3ca0371)) {
        if (isdefined(self.var_3949d58ef57f9f31)) {
            if (!array_contains(level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371], self.var_3949d58ef57f9f31)) {
                if (!isdefined(level.var_ed20ae31a47f989f.var_1a5aa18908f2d6b1[self.var_2954ef0ba3ca0371]) || function_946fffe773a4b030() || !array_contains(level.var_ed20ae31a47f989f.var_1a5aa18908f2d6b1[self.var_2954ef0ba3ca0371], self.var_3949d58ef57f9f31)) {
                    level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371] = array_add_safe(level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371], self.var_3949d58ef57f9f31);
                }
            }
        } else {
            /#
                assertmsg("br_plunder_dispenser Error, every instance of Plunder should include a valid yawUsed value");
            #/
        }
        level.var_ed20ae31a47f989f.var_9be11ff458712883[self.var_2954ef0ba3ca0371] = array_remove(level.var_ed20ae31a47f989f.var_9be11ff458712883[self.var_2954ef0ba3ca0371], self);
    } else {
        /#
            assertmsg("br_plunder_dispenser Error, can't remove without a valid dispenserId");
        #/
    }
}

// Namespace namespace_bbd71179be099380/namespace_ba90759e150897e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x134e
// Size: 0x2b
function function_946fffe773a4b030() {
    return function_b55532d2305486b8() && istrue(level.var_16ef52214ac3a63f.moneysiphon.active);
}

// Namespace namespace_bbd71179be099380/namespace_ba90759e150897e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1381
// Size: 0x25
function function_b55532d2305486b8() {
    return isdefined(level.var_16ef52214ac3a63f) && isdefined(level.var_16ef52214ac3a63f.moneysiphon);
}

// Namespace namespace_bbd71179be099380/namespace_ba90759e150897e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13ae
// Size: 0xf5
function function_790c4dd4cb830412() {
    /#
        foreach (player in level.players) {
            if (!isbot(player) && isalive(player)) {
                spawnpos = player.origin + anglestoforward(player.angles) * 150 + (0, 0, getdvarfloat(@"hash_a34d9d1a7a237bb0", 5));
                interval = getdvarfloat(@"hash_28e4c03ec51ad158", 5);
                limit = getdvarint(@"hash_76f1fd6cd7e4d0a7", 3);
                function_648885bad3260249(spawnpos, (0, 0, 0), interval, limit);
            }
        }
    #/
}

