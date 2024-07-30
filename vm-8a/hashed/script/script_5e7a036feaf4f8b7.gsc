#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\scriptable.gsc;
#using script_67fb1233e876ed8;
#using scripts\mp\gametypes\br_functional_poi.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace namespace_bbd71179be099380;

// Namespace namespace_bbd71179be099380 / namespace_ba90759e150897e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e9
// Size: 0x1db
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
    level.var_ed20ae31a47f989f.spawn_percent = getdvarfloat(@"hash_423367c04ee7dd39", 1);
    level.var_ed20ae31a47f989f.var_dd0b7f81bf42a5ea = getdvarint(@"hash_779153d042fa9de7", 360);
    level.var_ed20ae31a47f989f.var_70da8bb6903d62dc = &onprematchdone;
    /#
        level.var_ed20ae31a47f989f.debug_spawn = &function_790c4dd4cb830412;
    #/
    scripts\engine\scriptable::scriptable_addusedcallback(&scriptable_used);
    scripts\engine\scriptable::scriptable_addautousecallback(&scriptable_used);
    if (getdvarint(@"hash_8823e2f4a428cfc1", 0) && getdvarint(@"hash_89be1a979c1ec008", 0)) {
        namespace_7052decdced06e44::function_4f7660cfd85cd517("broken_atm", &function_e6c1c35181a2870f);
        namespace_7052decdced06e44::function_412f527ef0863f0e("broken_atm", &function_e0b56dfd8b5b7f97);
    }
    level.var_ed20ae31a47f989f.conf_fx["sparks"] = loadfx("vfx/iw8_br/gameplay/vfx_sparks_atm.vfx");
}

// Namespace namespace_bbd71179be099380 / namespace_ba90759e150897e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cc
// Size: 0x29
function isenabled() {
    if (getdvarint(@"hash_a6b7002b1a7fef73", 0) == 0) {
        return false;
    }
    if (!istrue(level.br_plunder_enabled)) {
        return false;
    }
    return true;
}

// Namespace namespace_bbd71179be099380 / namespace_ba90759e150897e3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3fe
// Size: 0xb5
function function_e0b56dfd8b5b7f97(structname, var_6aaa6a5dcfa4d64d) {
    var_6aaa6a5dcfa4d64d.var_2954ef0ba3ca0371 = level.var_ed20ae31a47f989f.var_893573278fdd3634;
    level.var_ed20ae31a47f989f.var_893573278fdd3634++;
    level.var_ed20ae31a47f989f.var_9be11ff458712883[var_6aaa6a5dcfa4d64d.var_2954ef0ba3ca0371] = [];
    if (!isdefined(level.var_ed20ae31a47f989f.var_863fb512af8a5a97)) {
        level.var_ed20ae31a47f989f.var_863fb512af8a5a97 = [];
    }
    level.var_ed20ae31a47f989f.var_863fb512af8a5a97[var_6aaa6a5dcfa4d64d.var_2954ef0ba3ca0371] = var_6aaa6a5dcfa4d64d;
    return var_6aaa6a5dcfa4d64d;
}

// Namespace namespace_bbd71179be099380 / namespace_ba90759e150897e3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4bc
// Size: 0x2e
function function_72758b0b1dc1e468(interval, limit) {
    self setscriptablepartstate("broken_atm", "disabled");
    thread function_443d890d24291fd5(interval, limit);
}

// Namespace namespace_bbd71179be099380 / namespace_ba90759e150897e3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4f2
// Size: 0x32
function function_3e992620ba9a364c(dispenser, interval, limit) {
    function_e0b56dfd8b5b7f97("broken_atm", dispenser);
    dispenser function_72758b0b1dc1e468(interval, limit);
}

// Namespace namespace_bbd71179be099380 / namespace_ba90759e150897e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x52c
// Size: 0x22
function function_e6c1c35181a2870f(structname) {
    allinstances = getentitylessscriptablearray(structname, "classname");
    return allinstances;
}

// Namespace namespace_bbd71179be099380 / namespace_ba90759e150897e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x557
// Size: 0x193
function onprematchdone() {
    if (!isenabled()) {
        return;
    }
    interval = getdvarfloat(@"hash_28e4c03ec51ad158", 5);
    limit = getdvarint(@"hash_76f1fd6cd7e4d0a7", 3);
    if (getdvarint(@"hash_8823e2f4a428cfc1", 0) && getdvarint(@"hash_89be1a979c1ec008", 0)) {
        foreach (dispenser in level.var_ed20ae31a47f989f.var_863fb512af8a5a97) {
            if (!isdefined(dispenser)) {
                continue;
            }
            dispenser function_72758b0b1dc1e468(interval, limit);
        }
        return;
    }
    atms = function_e6c1c35181a2870f();
    var_de49da8d08d362d4 = int(ceil(atms.size * level.var_ed20ae31a47f989f.spawn_percent));
    level.var_ed20ae31a47f989f.var_863fb512af8a5a97 = scripts\mp\gametypes\br_functional_poi::_getrandomlocations(atms, var_de49da8d08d362d4);
    foreach (dispenser in level.var_ed20ae31a47f989f.var_863fb512af8a5a97) {
        if (!isdefined(dispenser)) {
            continue;
        }
        function_3e992620ba9a364c(dispenser, interval, limit);
    }
}

// Namespace namespace_bbd71179be099380 / namespace_ba90759e150897e3
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6f2
// Size: 0x67
function function_648885bad3260249(pos, angles, interval, limit) {
    if (!isenabled()) {
        return;
    }
    assert(limit > 0);
    assert(interval > 0);
    dispenser = spawnscriptable("broken_atm_scriptable", pos, angles);
    function_3e992620ba9a364c(dispenser, interval, limit);
    return dispenser;
}

// Namespace namespace_bbd71179be099380 / namespace_ba90759e150897e3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x762
// Size: 0x9b8
function function_443d890d24291fd5(interval, limit) {
    level endon("game_ended");
    level endon("force_end");
    var_2006f940c17ea89b = getdvarfloat(@"hash_acea47f92cfde4e", 0);
    if (var_2006f940c17ea89b > 0) {
        wait var_2006f940c17ea89b;
    }
    self setscriptablepartstate("broken_atm", "visible");
    startingyaw = self.angles[1];
    var_ef17285813d8af9d = level.var_ed20ae31a47f989f.var_dd0b7f81bf42a5ea;
    var_f638ffb0f773a822 = var_ef17285813d8af9d / limit;
    startingyaw -= var_ef17285813d8af9d / 2;
    level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371] = [];
    if (limit > 1) {
        currentyaw = startingyaw;
        currentyaw -= var_f638ffb0f773a822 / 2;
        if (currentyaw < 0) {
            currentyaw += 360;
        }
        level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371][0] = currentyaw;
        for (i = 0; i < limit; i++) {
            newyaw = currentyaw + var_f638ffb0f773a822;
            currentyaw = ter_op(newyaw > 360, newyaw - 360, newyaw);
            level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371] = array_add(level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371], currentyaw);
        }
    }
    if (function_b55532d2305486b8() && istrue(level.var_16ef52214ac3a63f.moneysiphon.var_2f1ee623e7fc5c8c)) {
        level.var_ed20ae31a47f989f.var_1a5aa18908f2d6b1[self.var_2954ef0ba3ca0371] = [];
        currentyaw = startingyaw;
        currentyaw -= var_f638ffb0f773a822;
        if (currentyaw < 0) {
            currentyaw += 360;
        }
        for (i = 0; i < limit; i++) {
            newyaw = currentyaw + var_f638ffb0f773a822;
            currentyaw = ter_op(newyaw > 360, newyaw - 360, newyaw);
            level.var_ed20ae31a47f989f.var_1a5aa18908f2d6b1[self.var_2954ef0ba3ca0371] = array_add(level.var_ed20ae31a47f989f.var_1a5aa18908f2d6b1[self.var_2954ef0ba3ca0371], currentyaw);
        }
    }
    enabled = 1;
    instancesspawned = 0;
    nextrestart = 0;
    while (true) {
        var_bd34286de6dc8ec6 = interval;
        var_c36f5a77e92e0b92 = function_946fffe773a4b030();
        if (var_c36f5a77e92e0b92 && level.var_16ef52214ac3a63f.moneysiphon.depositinterval != 0) {
            var_bd34286de6dc8ec6 = level.var_16ef52214ac3a63f.moneysiphon.depositinterval;
        }
        wait var_bd34286de6dc8ec6;
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
                foreach (bonusyaw in level.var_ed20ae31a47f989f.var_1a5aa18908f2d6b1[self.var_2954ef0ba3ca0371]) {
                    level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371] = array_remove(level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371], bonusyaw);
                }
            }
            enabled = 0;
            self setscriptablepartstate("broken_atm", "disabled");
            nextrestart = gettime() + level.var_16ef52214ac3a63f.moneysiphon.var_f9b722c9edce3106 * 1000;
            instancesspawned = level.var_ed20ae31a47f989f.var_c9beeaf4e87bbf73;
            continue;
        }
        if (var_ed0deab380d4f7e9 >= ter_op(var_2403c90e287805e0 && istrue(level.var_16ef52214ac3a63f.moneysiphon.var_2f1ee623e7fc5c8c), limit * 2, limit)) {
            continue;
        }
        if (!var_2403c90e287805e0 && level.var_ed20ae31a47f989f.var_c9beeaf4e87bbf73 > 0 && instancesspawned >= level.var_ed20ae31a47f989f.var_c9beeaf4e87bbf73) {
            if (level.var_ed20ae31a47f989f.var_5a8c5ca1df0ae11d > 0 || level.var_ed20ae31a47f989f.var_d312de18b3bed3e7 > 0) {
                if (nextrestart == 0) {
                    randomdelay = randomintrange(level.var_ed20ae31a47f989f.var_5a8c5ca1df0ae11d, level.var_ed20ae31a47f989f.var_d312de18b3bed3e7);
                    nextrestart = gettime() + randomdelay * 1000;
                    continue;
                } else if (nextrestart < gettime()) {
                    nextrestart = 0;
                    instancesspawned = 0;
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
        yawused = level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371][level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371].size - 1];
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
        dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
        dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, self.origin, self.angles, undefined, yawused, undefined, undefined, undefined, undefined, undefined, 1);
        pickupent = scripts\mp\gametypes\br_pickups::spawnpickup(level.br_plunder.names[var_f90d0e006a1f717b], dropinfo, var_9714ddda6a6df159, 1);
        var_1ccee23d5b4508e3 = "br_plunder_broken_atm_";
        currencytype = "cash";
        playsoundatpos(self.origin + (0, 0, 40), var_1ccee23d5b4508e3 + currencytype);
        if (isdefined(pickupent)) {
            pickupent.var_2954ef0ba3ca0371 = self.var_2954ef0ba3ca0371;
            pickupent.yawused = yawused;
            level.var_ed20ae31a47f989f.var_9be11ff458712883[self.var_2954ef0ba3ca0371] = array_add(level.var_ed20ae31a47f989f.var_9be11ff458712883[self.var_2954ef0ba3ca0371], pickupent);
            instancesspawned++;
        }
        if (!var_2403c90e287805e0 && level.var_ed20ae31a47f989f.var_c9beeaf4e87bbf73 > 0 && instancesspawned >= level.var_ed20ae31a47f989f.var_c9beeaf4e87bbf73 && enabled) {
            enabled = 0;
            self setscriptablepartstate("broken_atm", "disabled");
        }
    }
}

// Namespace namespace_bbd71179be099380 / namespace_ba90759e150897e3
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1122
// Size: 0xa9
function scriptable_used(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (isdefined(instance.var_2954ef0ba3ca0371)) {
        if (isdefined(level.br_plunder) && isdefined(level.br_plunder.plunderlimit) && isdefined(player) && isdefined(player.plundercount) && player.plundercount >= level.br_plunder.plunderlimit) {
            return;
        }
        instance function_2cac9989e2b5559a();
    }
}

// Namespace namespace_bbd71179be099380 / namespace_ba90759e150897e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11d3
// Size: 0x16
function function_8e782ccfa7a41da6() {
    if (isdefined(self.var_2954ef0ba3ca0371)) {
        function_2cac9989e2b5559a();
    }
}

// Namespace namespace_bbd71179be099380 / namespace_ba90759e150897e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11f1
// Size: 0x155
function function_2cac9989e2b5559a() {
    if (isdefined(self.var_2954ef0ba3ca0371)) {
        if (isdefined(self.yawused)) {
            if (!array_contains(level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371], self.yawused)) {
                if (!isdefined(level.var_ed20ae31a47f989f.var_1a5aa18908f2d6b1[self.var_2954ef0ba3ca0371]) || function_946fffe773a4b030() || !array_contains(level.var_ed20ae31a47f989f.var_1a5aa18908f2d6b1[self.var_2954ef0ba3ca0371], self.yawused)) {
                    level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371] = array_add_safe(level.var_ed20ae31a47f989f.var_84c8c837e7a7644d[self.var_2954ef0ba3ca0371], self.yawused);
                }
            }
        } else {
            assertmsg("br_plunder_dispenser Error, every instance of Plunder should include a valid yawUsed value");
        }
        level.var_ed20ae31a47f989f.var_9be11ff458712883[self.var_2954ef0ba3ca0371] = array_remove(level.var_ed20ae31a47f989f.var_9be11ff458712883[self.var_2954ef0ba3ca0371], self);
        return;
    }
    assertmsg("br_plunder_dispenser Error, can't remove without a valid dispenserId");
}

// Namespace namespace_bbd71179be099380 / namespace_ba90759e150897e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x134e
// Size: 0x2a
function function_946fffe773a4b030() {
    return function_b55532d2305486b8() && istrue(level.var_16ef52214ac3a63f.moneysiphon.active);
}

// Namespace namespace_bbd71179be099380 / namespace_ba90759e150897e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1381
// Size: 0x24
function function_b55532d2305486b8() {
    return isdefined(level.var_16ef52214ac3a63f) && isdefined(level.var_16ef52214ac3a63f.moneysiphon);
}

/#

    // Namespace namespace_bbd71179be099380 / namespace_ba90759e150897e3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13ae
    // Size: 0xf4
    function function_790c4dd4cb830412() {
        foreach (player in level.players) {
            if (!isbot(player) && isalive(player)) {
                spawnpos = player.origin + anglestoforward(player.angles) * 150 + (0, 0, getdvarfloat(@"hash_a34d9d1a7a237bb0", 5));
                interval = getdvarfloat(@"hash_28e4c03ec51ad158", 5);
                limit = getdvarint(@"hash_76f1fd6cd7e4d0a7", 3);
                function_648885bad3260249(spawnpos, (0, 0, 0), interval, limit);
            }
        }
    }

#/
