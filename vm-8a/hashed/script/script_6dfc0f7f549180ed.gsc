#using scripts\engine\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using script_721ee99d7a8f9168;

#namespace namespace_1f456ca67a596eec;

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x263
// Size: 0x13
function autoexec main() {
    function_c0b3ddc9a6bdcc46("veh_jup_jltv_mg", &function_36f3aa21fcac5b21);
}

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27e
// Size: 0x34
function function_41840e7c1272c050(veh_spawner) {
    veh_spawner.spawnmethod = "airdrop_at_position_unsafe";
    vehicle = scripts\cp_mp\vehicles\vehicle::vehicle_spawn("veh_jup_jltv_mg", veh_spawner);
    return vehicle;
}

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2bb
// Size: 0x72
function private function_36f3aa21fcac5b21() {
    if (!function_9697379150687859("veh_jup_jltv_mg")) {
        return;
    }
    callbacks = [];
    callbacks["spawn"] = &function_d2a84209a50b34d2;
    callbacks["enterEnd"] = &function_7abe06772f227330;
    callbacks["exitEnd"] = &function_2fdd0e40db525024;
    callbacks["reenter"] = &function_4b1ad3b1d7810658;
    callbacks["spawnPostAirdrop"] = &function_83972c0fabc82c9f;
    function_8497e7e46b5e397("veh_jup_jltv_mg", callbacks);
    function_f2a24ca61d1563a();
}

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x335
// Size: 0x19d
function private function_d2a84209a50b34d2(spawndata, faildata) {
    spawnposition = undefined;
    spawnangles = undefined;
    if (!isdefined(spawndata)) {
        spawndata = spawnstruct();
    }
    if (!isdefined(spawndata.spawnmethod)) {
        spawndata.spawnmethod = "place_at_position_unsafe";
    }
    isairdrop = issubstr(spawndata.spawnmethod, "airdrop_");
    assertex(isdefined(spawndata) && (isdefined(spawndata.origin) || spawndata.spawnmethod == "airdrop_from_player"), "spawnData.origin must be defined.");
    spawnposition = spawndata.origin;
    spawnangles = spawndata.angles;
    if (isdefined(spawndata.owner) && istrue(spawndata.faceawayfromowner)) {
        between = spawnposition - spawndata.owner.origin;
        if (length2dsquared(between) > 0) {
            spawnangles = vectortoangles(spawnposition - spawndata.owner.origin);
        } else {
            spawnangles = spawndata.owner getplayerangles(1);
        }
    }
    if (!isdefined(spawnangles)) {
        spawnangles = (0, randomint(360), 0);
    } else {
        spawnangles *= (0, 1, 0);
    }
    vehicle = undefined;
    if (isairdrop) {
        vehicle = function_4c41d739b1eb8cd0(spawnposition, spawnangles, spawndata, faildata);
    } else {
        vehicle = function_62204f70106947a6(spawnposition, spawnangles, spawndata, faildata);
    }
    return vehicle;
}

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4db
// Size: 0x56
function private function_4c41d739b1eb8cd0(position, angles, spawndata, faildata) {
    spawndata.origin = position;
    spawndata.angles = angles;
    vehicle = namespace_801fa17f47560d76::function_66c684fea143fbfd("veh_jup_jltv_mg", spawndata, faildata);
    return vehicle;
}

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x53a
// Size: 0x9f
function private function_62204f70106947a6(spawnposition, spawnangles, spawndata, faildata) {
    oldorigin = spawndata.origin;
    oldangles = spawndata.angles;
    spawndata.origin = spawnposition;
    spawndata.angles = spawnangles;
    vehicle = function_83972c0fabc82c9f(spawndata, faildata);
    spawndata.origin = oldorigin;
    spawndata.angles = oldangles;
    if (!isdefined(vehicle)) {
        return undefined;
    }
    return vehicle;
}

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5e2
// Size: 0x99
function private function_83972c0fabc82c9f(spawndata, faildata) {
    vehicle = function_bba34cf920370ff4("veh_jup_jltv_mg", spawndata, faildata);
    turret_weapon = function_edcae4b27a6f7abe();
    turret = function_9e1cb0f4ea79f09e(vehicle, spawndata, turret_weapon);
    vehicle_registerturret(vehicle, turret, makeweapon(turret_weapon));
    if (utility::iscp()) {
        vehicle.var_7ee6203c5532a9e6 = 1;
        vehicle.vehicle_specific_onentervehicle = &function_d09b279cd811f266;
        vehicle.vehicle_specific_onexitvehicle = &function_e1f107025762fca4;
    }
    return vehicle;
}

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x684
// Size: 0x6f
function private function_f2a24ca61d1563a() {
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle("veh_jup_jltv_mg", 1);
    var_e2818ad39a3341b4.rotationids[0] = 0;
    var_e2818ad39a3341b4.rotationids[1] = 1;
    var_e2818ad39a3341b4.rotationrefsbyseatandweapon["driver"][function_edcae4b27a6f7abe()] = 0;
    var_e2818ad39a3341b4.rotationrefsbyseatandweapon["gunner"][function_edcae4b27a6f7abe()] = 1;
}

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6fb
// Size: 0x59
function private function_edcae4b27a6f7abe() {
    mapname = getdvar(@"hash_687fb8f9b7a23245");
    if (utility::iscp()) {
        if (mapname == "cp_lone") {
            return "iw9_mg_jltv_cp";
        } else if (is_equal(level.gametype, "dungeons")) {
            return "jup_mg_jltv_dungeons_cp";
        }
    }
    return "jup_mg_jltv_mp";
}

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x75d
// Size: 0x93
function private function_7abe06772f227330(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (istrue(data.success)) {
        thread function_2aa52f506944ea71(vehicle, seatid, var_fc7c7a874b43a31a, player, data);
        return;
    }
    if (!istrue(data.playerdisconnect) && !istrue(data.playerdeath)) {
        if (seatid == "gunner") {
            turret_weapon = function_edcae4b27a6f7abe();
            thread vehicle_occupancy_taketurret(player, vehicle, turret_weapon, data, 1);
        }
    }
}

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7f8
// Size: 0x8d
function private function_2aa52f506944ea71(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (seatid == "gunner") {
        level thread vehicle_occupancy_disablefirefortime(player, ter_op(istrue(vehicle.var_ecc491f42aaceaf4), 850, 2200));
        turret_weapon = function_edcae4b27a6f7abe();
        player thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_giveturret(player, vehicle, turret_weapon);
        vehicle.var_ecc491f42aaceaf4 = 1;
    }
    vehomn_updateomnvarsonseatenter(vehicle, var_fc7c7a874b43a31a, seatid, player);
}

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88d
// Size: 0x46
function private function_2fdd0e40db525024(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (istrue(data.success)) {
        function_3d7fcd7f8aa45e0d(vehicle, seatid, var_7558f98f3236963d, player, data);
    }
}

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8db
// Size: 0x137
function private function_3d7fcd7f8aa45e0d(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (seatid == "gunner") {
        turret_weapon = function_edcae4b27a6f7abe();
        turret = vehicle_getturretbyweapon(vehicle, turret_weapon);
        if (!istrue(data.playerdisconnect)) {
            player enableturretdismount();
            player controlturretoff(turret);
            thread vehicle_occupancy_cleardisablefirefortime(player, data.playerdeath);
            if (!istrue(data.playerdeath)) {
                thread vehicle_occupancy_taketurret(player, vehicle, turret_weapon, data, 1);
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

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa1a
// Size: 0x5a
function private function_4b1ad3b1d7810658(vehicle, var_9de41f2ee77c33ba, var_3f68c37bafd38606, player, data) {
    if (isdefined(var_3f68c37bafd38606) && var_3f68c37bafd38606 == "gunner") {
        turret_weapon = function_edcae4b27a6f7abe();
        thread vehicle_occupancy_taketurret(player, vehicle, turret_weapon, data, 1);
    }
}

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa7c
// Size: 0x128
function private function_9e1cb0f4ea79f09e(vehicle, spawndata, turretweapon) {
    turret = spawnturret("misc_turret", vehicle gettagorigin("tag_turret"), turretweapon, 0);
    turret linkto(vehicle, "tag_turret", (0, 0, 0), (0, 0, 0));
    if (issubstr(spawndata.modelname, "::")) {
        tokens = strtok(spawndata.modelname, "::");
        override = tokens[0];
        modelname = override + "::" + "veh9_mil_lnd_jltv_turret_gun_mtx";
    } else {
        modelname = "veh9_mil_lnd_jltv_turret_gun_mtx";
    }
    turret setmodel(modelname);
    turret setmode("sentry_offline");
    turret setsentryowner(undefined);
    turret makeunusable();
    turret setdefaultdroppitch(0);
    turret setturretmodechangewait(1);
    turret.angles = vehicle.angles;
    turret.vehicle = vehicle;
    return turret;
}

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbad
// Size: 0x91
function private function_d09b279cd811f266(vehicle, var_7558f98f3236963d, player, data) {
    if (istrue(vehicle.door_open)) {
        vehicle vehicleplayanim(mp_vehicles_always_loaded%reb_com_veh8_techo_fl_door_close);
        vehicle.door_open = undefined;
    }
    if (istrue(level.var_d39df167f3a996b0)) {
        vehicle setscriptablepartstate("lights", "on");
    }
    if (isdefined(vehicle.var_f24cc3beef01650c)) {
        vehicle.var_1ab6b61153087915 = vehicle.var_f24cc3beef01650c;
    }
}

// Namespace namespace_1f456ca67a596eec / namespace_706b2d22847d9775
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc46
// Size: 0x48
function private function_e1f107025762fca4(vehicle, var_7558f98f3236963d, player, data) {
    if (!istrue(data.playerdisconnect)) {
        player.isdrivingvehicle = undefined;
    }
    vehicle.var_1ab6b61153087915 = undefined;
}

