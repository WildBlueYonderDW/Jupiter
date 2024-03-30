// mwiii decomp prototype
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;

#namespace namespace_b5ab7539f1c4a823;

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x113
// Size: 0x5f
function function_ce9d634e565ef6de(vehicles) {
    if (!isdefined(vehicles)) {
        return;
    }
    foreach (vehicle in vehicles) {
        function_791c40715c757bd9(vehicle);
    }
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x179
// Size: 0x13e
function function_791c40715c757bd9(vehicle) {
    if (!isdefined(vehicle)) {
        return;
    }
    if (isdefined(vehicle.spawnfunction) && isdefined(vehicle.spawnposition) && isdefined(vehicle.spawnrotation)) {
        vehicle.vehicleentity = [[ vehicle.spawnfunction ]](vehicle.spawnposition, vehicle.spawnrotation);
    }
    if (isdefined(vehicle.vehicleentity)) {
        if (isdefined(vehicle.spawndestroyed)) {
            vehicle.vehicleentity function_b9a4d29f4bc73806();
        }
        if (isdefined(vehicle.initialdamage)) {
            vehicle.vehicleentity dodamage(vehicle.vehicleentity.health * vehicle.initialdamage, vehicle.spawnposition);
        }
        if (isdefined(vehicle.vfxdata)) {
            vehicle.vfx = spawnscriptable(vehicle.vfxdata[0], vehicle.vfxdata[1], vehicle.vfxdata[2]);
        }
        vehicle thread function_71a45813be39078e();
    }
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2be
// Size: 0x44
function private function_71a45813be39078e() {
    while (isdefined(self.vehicleentity)) {
        wait(1);
    }
    if (isdefined(self.vfx)) {
        self.vfx.origin = (0, 0, 0);
    }
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x309
// Size: 0x92
function function_1bc8a302d36b9ab8(position, rotation) {
    if (!function_fa537f1ab52a76d1("atv")) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    /#
        println("<unknown string>");
    #/
    spawndata = spawnstruct();
    faildata = spawnstruct();
    spawndata.origin = position;
    spawndata.angles = rotation;
    vehicle = vehicle_spawn("atv", spawndata, faildata);
    return vehicle;
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3a3
// Size: 0x92
function function_7faf4fc46a309ce4(position, rotation) {
    if (!function_fa537f1ab52a76d1("little_bird")) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    /#
        println("<unknown string>");
    #/
    spawndata = spawnstruct();
    faildata = spawnstruct();
    spawndata.origin = position;
    spawndata.angles = rotation;
    vehicle = vehicle_spawn("little_bird", spawndata, faildata);
    return vehicle;
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x43d
// Size: 0x92
function function_441b0847b091c73f(position, rotation) {
    if (!function_fa537f1ab52a76d1("tac_rover")) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    /#
        println("<unknown string>");
    #/
    spawndata = spawnstruct();
    faildata = spawnstruct();
    spawndata.origin = position;
    spawndata.angles = rotation;
    vehicle = vehicle_spawn("tac_rover", spawndata, faildata);
    return vehicle;
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4d7
// Size: 0x92
function function_c446faece0456afc(position, rotation) {
    if (!function_fa537f1ab52a76d1("veh9_mil_cargo_truck")) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    /#
        println("<unknown string>");
    #/
    spawndata = spawnstruct();
    faildata = spawnstruct();
    spawndata.origin = position;
    spawndata.angles = rotation;
    vehicle = vehicle_spawn("veh9_mil_cargo_truck", spawndata, faildata);
    return vehicle;
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x571
// Size: 0xa3
function function_9758acff14ae878e(position, rotation) {
    if (!function_fa537f1ab52a76d1("veh9_suv_1996")) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    /#
        println("<unknown string>");
    #/
    spawndata = spawnstruct();
    faildata = spawnstruct();
    spawndata.origin = position;
    spawndata.angles = rotation;
    spawndata.vehicletype = "suv_1996_spawn";
    vehicle = vehicle_spawn("veh9_suv_1996", spawndata, faildata);
    return vehicle;
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x61c
// Size: 0x83
function function_944743524ecaea3(position, speed, acceleration, yaw, hovering) {
    if (!isdefined(self) || !isdefined(position) || !isdefined(speed) || !isdefined(acceleration)) {
        return;
    }
    self vehicle_turnengineon();
    self vehicle_setspeed(speed, acceleration);
    if (isdefined(hovering)) {
        self sethoverparams(hovering[0], hovering[1], hovering[2]);
    }
    self setvehgoalpos(position, 1);
    if (isdefined(yaw)) {
        self setgoalyaw(yaw);
    }
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a6
// Size: 0x36
function function_b9a4d29f4bc73806(callback) {
    if (!isdefined(self)) {
        return;
    }
    self dodamage(self.health, self.origin);
    if (isdefined(callback)) {
        self thread [[ callback ]]();
    }
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e3
// Size: 0x1b
function function_4d84a1c381ece6c0(callback) {
    if (!isdefined(self)) {
        return;
    }
    thread function_63a435765cc08(callback);
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x705
// Size: 0x3a
function private function_63a435765cc08(callback) {
    initialhealth = self.health;
    while (self.health >= initialhealth) {
        waitframe();
    }
    function_b9a4d29f4bc73806(callback);
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x746
// Size: 0x24
function function_11cc5dbd12cb9f9e(position, speed) {
    if (!isdefined(self)) {
        return;
    }
    thread function_446ed0697b1b25a2(position, speed);
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x771
// Size: 0x73
function private function_446ed0697b1b25a2(position, speed) {
    if (!isdefined(speed)) {
        speed = 40;
    }
    if (self vehicle_isphysveh()) {
        self vehphys_crash();
    }
    self vehicle_setspeed(speed, 15, 10);
    self setvehgoalpos(position, 0);
    if (soundexists("hind_helicopter_dying_loop")) {
        self playloopsound("hind_helicopter_dying_loop");
    }
    thread function_35da48c2e41c32f7();
    self waittill("death");
    self notify("vehicle_crashDone");
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7eb
// Size: 0x62
function private function_35da48c2e41c32f7() {
    self endon("vehicle_crashDone");
    self clearlookatent();
    self setmaxpitchroll(60, 90);
    self setyawspeed(700, 200, 200);
    for (;;) {
        if (!isdefined(self)) {
            return;
        }
        irand = randomintrange(140, 170);
        self settargetyaw(self.angles[1] + irand);
        wait(0.5);
    }
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x854
// Size: 0x1e
function function_ee15cb02c86edc6e(vehicle) {
    /#
        assert(isdefined(vehicle));
    #/
    return vehicle_occupancy_getdriver(vehicle);
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x87a
// Size: 0x92
function function_cb90a442bf4d8100(modifier) {
    if (!isdefined(self) || !isvehicle()) {
        return;
    }
    switch (modifier) {
    case #"hash_bdb6392e8750d9b0":
        vehicle_damage_setpremoddamagecallback(self.vehiclename, &function_1e94e45fcb25f69a);
        break;
    case #"hash_db653a4972b3c13b":
        vehicle_damage_setpremoddamagecallback(self.vehiclename, &function_7f608c6951fd341d);
        break;
    default:
        vehicle_damage_setpremoddamagecallback(self.vehiclename, &function_7f608c6951fd341d);
        break;
    }
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x913
// Size: 0x33
function function_1e94e45fcb25f69a(data) {
    if (data.inflictor == level.player) {
        data.damage = 0;
    }
    return true;
}

// Namespace namespace_b5ab7539f1c4a823 / namespace_9e27347da4069f42
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94e
// Size: 0xd
function function_7f608c6951fd341d(data) {
    return false;
}

