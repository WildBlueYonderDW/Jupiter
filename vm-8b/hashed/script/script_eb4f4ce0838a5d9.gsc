#using scripts\engine\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;

#namespace namespace_b4019be8e42ae860;

// Namespace namespace_b4019be8e42ae860 / namespace_9ceb27f81903c8ef
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x167
// Size: 0x1e
function autoexec main() {
    level.var_7bf42d565645a485 = 1;
    function_c0b3ddc9a6bdcc46("veh_jup_truck_tech_hmg", &function_81e164465100fa5d);
}

// Namespace namespace_b4019be8e42ae860 / namespace_9ceb27f81903c8ef
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x18d
// Size: 0x66
function private function_81e164465100fa5d() {
    if (!function_9697379150687859("veh_jup_truck_tech_hmg")) {
        return;
    }
    callbacks = [];
    callbacks["spawn"] = &jup_truck_tech_hmg_spawn;
    callbacks["enterEnd"] = &function_f25c1f55c0d22f24;
    callbacks["exitEnd"] = &function_b0bb9044b3840240;
    callbacks["reenter"] = &function_6a5cfd38b688e3a4;
    function_8497e7e46b5e397("veh_jup_truck_tech_hmg", callbacks);
    function_b484da4e03cd75e6();
}

// Namespace namespace_b4019be8e42ae860 / namespace_9ceb27f81903c8ef
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1fb
// Size: 0x82
function private jup_truck_tech_hmg_spawn(spawndata, faildata) {
    function_d603d07c7e71284c(spawndata);
    vehicle = function_bba34cf920370ff4("veh_jup_truck_tech_hmg", spawndata, faildata);
    spawndata.var_14cde247ac3313a4 = "green";
    turret_weapon = function_8b14981dadeee9bc();
    turret = function_7d1a850ac1a81925(vehicle, turret_weapon, spawndata, "tag_turret_attach", "veh_jup_mil_tech_turret_hmg");
    vehicle_registerturret(vehicle, turret, makeweapon(turret_weapon));
    return vehicle;
}

// Namespace namespace_b4019be8e42ae860 / namespace_9ceb27f81903c8ef
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x286
// Size: 0x6d
function private function_d603d07c7e71284c(spawndata) {
    if (isdefined(spawndata.var_14cde247ac3313a4)) {
        switch (spawndata.var_14cde247ac3313a4) {
        case #"hash_22ce3b03c1e51a9c": 
            spawndata.var_14cde247ac3313a4 = "tan";
            break;
        case #"hash_a1e9b77432f55b0e": 
            spawndata.var_14cde247ac3313a4 = "green";
            break;
        }
    }
}

// Namespace namespace_b4019be8e42ae860 / namespace_9ceb27f81903c8ef
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2fb
// Size: 0x52
function private function_b484da4e03cd75e6() {
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle("veh_jup_truck_tech_hmg", 1);
    var_e2818ad39a3341b4.rotationids[0] = 0;
    var_e2818ad39a3341b4.rotationrefsbyseatandweapon["gunner"][function_8b14981dadeee9bc()] = 0;
    var_e2818ad39a3341b4.var_bd169af9b46727ef = 1;
}

// Namespace namespace_b4019be8e42ae860 / namespace_9ceb27f81903c8ef
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x355
// Size: 0x94
function private function_f25c1f55c0d22f24(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (istrue(data.success)) {
        thread function_2dc902a61faa1d0d(vehicle, seatid, var_fc7c7a874b43a31a, player, data);
        return;
    }
    if (!istrue(data.playerdisconnect) && !istrue(data.playerdeath)) {
        if (seatid == "gunner") {
            turret_weapon = function_8b14981dadeee9bc();
            thread vehicle_occupancy_taketurret(player, vehicle, turret_weapon, data, 1);
        }
    }
}

// Namespace namespace_b4019be8e42ae860 / namespace_9ceb27f81903c8ef
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x3f1
// Size: 0x63
function private function_2dc902a61faa1d0d(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (seatid == "gunner") {
        turret_weapon = function_8b14981dadeee9bc();
        player function_d764f933c0054e16(vehicle, turret_weapon, 850, 2200);
    }
    function_5004590331017d88(vehicle, seatid, var_fc7c7a874b43a31a, player, data);
}

// Namespace namespace_b4019be8e42ae860 / namespace_9ceb27f81903c8ef
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x45c
// Size: 0x46
function private function_b0bb9044b3840240(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (istrue(data.success)) {
        function_2c2ed55a7befefc1(vehicle, seatid, var_7558f98f3236963d, player, data);
    }
}

// Namespace namespace_b4019be8e42ae860 / namespace_9ceb27f81903c8ef
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x4aa
// Size: 0x5e
function private function_2c2ed55a7befefc1(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (seatid == "gunner") {
        turret_weapon = function_8b14981dadeee9bc();
        player function_99ec1e87f279f082(data, vehicle, turret_weapon);
    }
    function_cb4191526e56163c(vehicle, seatid, var_7558f98f3236963d, player, data);
}

// Namespace namespace_b4019be8e42ae860 / namespace_9ceb27f81903c8ef
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x510
// Size: 0x5b
function private function_6a5cfd38b688e3a4(vehicle, var_9de41f2ee77c33ba, var_3f68c37bafd38606, player, data) {
    if (isdefined(var_3f68c37bafd38606) && var_3f68c37bafd38606 == "gunner") {
        turret_weapon = function_8b14981dadeee9bc();
        thread vehicle_occupancy_taketurret(player, vehicle, turret_weapon, data, 1);
    }
}

// Namespace namespace_b4019be8e42ae860 / namespace_9ceb27f81903c8ef
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x573
// Size: 0x38
function private function_8b14981dadeee9bc() {
    turretweapon = function_2e58e7b01554419a("veh_jup_truck_tech_hmg", "gunner");
    if (isdefined(turretweapon)) {
        return turretweapon.basename;
    }
    return "";
}

