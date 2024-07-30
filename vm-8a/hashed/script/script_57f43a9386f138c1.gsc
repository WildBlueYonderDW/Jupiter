#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_collision.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_dlog.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_compass.gsc;

#namespace namespace_6e2885422769ed48;

// Namespace namespace_6e2885422769ed48 / namespace_124a01010aeb4093
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa
// Size: 0x13
function main() {
    function_c0b3ddc9a6bdcc46("veh9_jltv_cargo", &function_70158a7bb3fb0665);
}

// Namespace namespace_6e2885422769ed48 / namespace_124a01010aeb4093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c5
// Size: 0x65
function private function_70158a7bb3fb0665() {
    if (!function_9697379150687859("veh9_jltv_cargo")) {
        return;
    }
    callbacks = [];
    callbacks["spawn"] = &function_247eed998b5b5c0b;
    callbacks["enterEnd"] = &function_24dfb5aeadd19f3c;
    callbacks["exitEnd"] = &function_c9a25e0722ada0f8;
    callbacks["reenter"] = &function_c9e01ef8817d753c;
    function_8497e7e46b5e397("veh9_jltv_cargo", callbacks);
    function_917ec65924280ade();
}

// Namespace namespace_6e2885422769ed48 / namespace_124a01010aeb4093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x232
// Size: 0x6f
function private function_917ec65924280ade() {
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle("veh9_jltv_cargo", 1);
    var_e2818ad39a3341b4.rotationids[0] = 0;
    var_e2818ad39a3341b4.rotationids[1] = 1;
    var_e2818ad39a3341b4.rotationrefsbyseatandweapon["driver"][function_ae5d72405e841a0a()] = 0;
    var_e2818ad39a3341b4.rotationrefsbyseatandweapon["gunner"][function_ae5d72405e841a0a()] = 1;
}

// Namespace namespace_6e2885422769ed48 / namespace_124a01010aeb4093
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a9
// Size: 0x3a
function private function_ae5d72405e841a0a() {
    mapname = getdvar(@"hash_687fb8f9b7a23245");
    if (iscp() && mapname == "cp_lone") {
        return "iw9_mg_jltv_cp";
    }
    return "iw9_mg_jltv_mp";
}

// Namespace namespace_6e2885422769ed48 / namespace_124a01010aeb4093
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ec
// Size: 0x53
function private function_247eed998b5b5c0b(spawndata, faildata) {
    vehicle = function_bba34cf920370ff4("veh9_jltv_cargo", spawndata, faildata);
    turret = function_7ee2d23e7c9bfa52(vehicle, spawndata);
    vehicle_registerturret(vehicle, turret, makeweapon(function_ae5d72405e841a0a()));
    return vehicle;
}

// Namespace namespace_6e2885422769ed48 / namespace_124a01010aeb4093
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x348
// Size: 0x87
function private function_24dfb5aeadd19f3c(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (istrue(data.success)) {
        thread function_d7d50e8f657a7c25(vehicle, seatid, var_fc7c7a874b43a31a, player, data);
        return;
    }
    if (!istrue(data.playerdisconnect) && !istrue(data.playerdeath)) {
        if (seatid == "gunner") {
            thread vehicle_occupancy_taketurret(player, vehicle, function_ae5d72405e841a0a(), data, 1);
        }
    }
}

// Namespace namespace_6e2885422769ed48 / namespace_124a01010aeb4093
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d7
// Size: 0x81
function private function_d7d50e8f657a7c25(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (seatid == "gunner") {
        level thread vehicle_occupancy_disablefirefortime(player, ter_op(istrue(vehicle.var_ecc491f42aaceaf4), 850, 2200));
        player thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_giveturret(player, vehicle, function_ae5d72405e841a0a());
        vehicle.var_ecc491f42aaceaf4 = 1;
    }
    vehomn_updateomnvarsonseatenter(vehicle, var_fc7c7a874b43a31a, seatid, player);
}

// Namespace namespace_6e2885422769ed48 / namespace_124a01010aeb4093
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x460
// Size: 0x46
function private function_c9a25e0722ada0f8(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (istrue(data.success)) {
        function_41e2ee710223cf99(vehicle, seatid, var_7558f98f3236963d, player, data);
    }
}

// Namespace namespace_6e2885422769ed48 / namespace_124a01010aeb4093
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ae
// Size: 0x12d
function private function_41e2ee710223cf99(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (seatid == "gunner") {
        turret = vehicle_getturretbyweapon(vehicle, function_ae5d72405e841a0a());
        if (!istrue(data.playerdisconnect)) {
            player enableturretdismount();
            player controlturretoff(turret);
            thread vehicle_occupancy_cleardisablefirefortime(player, data.playerdeath);
            if (!istrue(data.playerdeath)) {
                thread vehicle_occupancy_taketurret(player, vehicle, function_ae5d72405e841a0a(), data, 1);
            }
        }
        turret.owner = undefined;
        turret setotherent(undefined);
        turret setentityowner(undefined);
        turret setsentryowner(undefined);
    }
    if (!istrue(data.playerdisconnect)) {
        success = vehicle_occupancy_moveplayertoexit(vehicle, seatid, var_7558f98f3236963d, player, data);
        if (!success) {
            if (issharedfuncdefined("vehicle_occupancy", "handleSuicideFromVehicles")) {
                [[ getsharedfunc("vehicle_occupancy", "handleSuicideFromVehicles") ]](player);
            } else {
                player suicide();
            }
        }
    }
    vehomn_updateomnvarsonseatexit(vehicle, seatid, var_7558f98f3236963d, player);
}

// Namespace namespace_6e2885422769ed48 / namespace_124a01010aeb4093
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5e3
// Size: 0x4e
function private function_c9e01ef8817d753c(vehicle, var_9de41f2ee77c33ba, var_3f68c37bafd38606, player, data) {
    if (isdefined(var_3f68c37bafd38606) && var_3f68c37bafd38606 == "gunner") {
        thread vehicle_occupancy_taketurret(player, vehicle, function_ae5d72405e841a0a(), data, 1);
    }
}

// Namespace namespace_6e2885422769ed48 / namespace_124a01010aeb4093
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x639
// Size: 0xbe
function private function_7ee2d23e7c9bfa52(vehicle, spawndata) {
    turret = spawnturret("misc_turret", vehicle gettagorigin("tag_turret"), function_ae5d72405e841a0a(), 0);
    turret linkto(vehicle, "tag_turret", (0, 0, 0), (0, 0, 0));
    turret setmodel("veh9_mil_lnd_jltv_turret_gun");
    turret setmode("sentry_offline");
    turret setsentryowner(undefined);
    turret makeunusable();
    turret setdefaultdroppitch(0);
    turret setturretmodechangewait(1);
    turret.angles = vehicle.angles;
    turret.vehicle = vehicle;
    return turret;
}

