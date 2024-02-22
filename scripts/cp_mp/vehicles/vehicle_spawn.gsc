// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;

#namespace vehicle_spawn;

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f3
// Size: 0xcd
function vehicle_spawn_getleveldataforvehicle(vehicleref, create) {
    if (istrue(create) && (!function_89dc39dc11f3988c(vehicleref) || !isdefined(function_29b4292c92443328(vehicleref).spawn))) {
        data = undefined;
        if (!function_89dc39dc11f3988c(vehicleref)) {
            data = spawnstruct();
        } else {
            data = function_29b4292c92443328(vehicleref);
        }
        data.spawn = spawnstruct();
        data.spawn.maxinstancecount = 0;
        data.spawn.priority = 50;
        level.var_a0b2c978ca57ffc5[vehicleref] = data;
    }
    if (function_89dc39dc11f3988c(vehicleref)) {
        return function_29b4292c92443328(vehicleref).spawn;
    }
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c7
// Size: 0x1b3
function function_37480e9c9c701cf2(vehicleref, spawndata) {
    if (!isdefined(spawndata.angles)) {
        spawndata.angles = (0, 0, 0);
    }
    /#
        function_756a8f3f002a11aa(spawndata);
    #/
    var_e2818ad39a3341b4 = vehicle_getleveldataforvehicle(vehicleref);
    spawndata.targetname = vehicleref;
    if (isdefined(var_e2818ad39a3341b4.vehicle)) {
        spawndata.vehicletype = var_e2818ad39a3341b4.vehicle;
    }
    if (isdefined(spawndata.vehicleoverride)) {
        spawndata.vehicletype = spawndata.vehicleoverride;
    }
    model = var_e2818ad39a3341b4.model;
    if (istrue(spawndata.var_f16652e1462a3739) && isdefined(var_e2818ad39a3341b4.ai.model)) {
        model = var_e2818ad39a3341b4.ai.model;
    }
    if (isdefined(spawndata.var_14cde247ac3313a4)) {
        spawndata.modelname = spawndata.var_14cde247ac3313a4 + "::" + model;
    } else if (isdefined(var_e2818ad39a3341b4.var_14cde247ac3313a4) && var_e2818ad39a3341b4.var_14cde247ac3313a4 != "") {
        spawndata.modelname = var_e2818ad39a3341b4.var_14cde247ac3313a4 + "::" + model;
    } else {
        spawndata.modelname = model;
    }
    if (isdefined(spawndata.var_3474b4e818850c46)) {
        spawndata.modelname = spawndata.var_3474b4e818850c46;
    }
    return spawndata;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x782
// Size: 0x1c1
function function_1cc780d5cac1e7cd(vehicleref, spawndata, var_dee73a1fa79b1b6d) {
    if (!isdefined(spawndata.angles)) {
        spawndata.angles = (0, 0, 0);
    }
    /#
        function_756a8f3f002a11aa(spawndata);
    #/
    var_e2818ad39a3341b4 = vehicle_getleveldataforvehicle(vehicleref);
    spawndata.targetname = var_e2818ad39a3341b4.var_fb41d1ca75009bf0.ref;
    spawndata.vehicletype = ter_op(isdefined(var_e2818ad39a3341b4.var_fb41d1ca75009bf0.vehicle), var_e2818ad39a3341b4.var_fb41d1ca75009bf0.vehicle, var_e2818ad39a3341b4.vehicle);
    var_51776e06c27e19de = var_e2818ad39a3341b4.var_fb41d1ca75009bf0.model;
    if (istrue(var_e2818ad39a3341b4.var_fb41d1ca75009bf0.var_45c781fb466d2281)) {
        if (isdefined(spawndata.var_14cde247ac3313a4)) {
            spawndata.modelname = spawndata.var_14cde247ac3313a4 + "::" + var_51776e06c27e19de;
        } else if (isdefined(var_e2818ad39a3341b4.var_14cde247ac3313a4) && var_e2818ad39a3341b4.var_14cde247ac3313a4 != "") {
            spawndata.modelname = var_e2818ad39a3341b4.var_14cde247ac3313a4 + "::" + var_51776e06c27e19de;
        } else {
            spawndata.modelname = var_51776e06c27e19de;
        }
    } else {
        spawndata.modelname = var_51776e06c27e19de;
    }
    if (!isdefined(spawndata.vehicletype)) {
        spawndata.vehicletype = var_dee73a1fa79b1b6d;
    }
    spawndata.var_131ea86b569e731 = 0;
    return spawndata;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94b
// Size: 0x184
function function_75ce57f81b582b38(vehicle, vehicleref) {
    var_e2818ad39a3341b4 = vehicle_getleveldataforvehicle(vehicleref);
    spawndata = spawnstruct();
    spawndata.origin = vehicle.origin;
    spawndata.angles = vehicle.angles;
    spawndata.initialvelocity = anglestoup(vehicle.angles) * var_e2818ad39a3341b4.var_fb41d1ca75009bf0.var_71df88882a7ec721;
    spawndata.var_ec2df2acaf230179 = vehicleref;
    spawndata.var_64a02a3ba94254d = var_e2818ad39a3341b4.var_fb41d1ca75009bf0.var_64a02a3ba94254d;
    spawndata.var_aab9695c92b0ed96 = namespace_5a0f3ca265d3a4c8::function_7a5070220fc8ce9e(vehicleref, vehicle.var_aab9695c92b0ed96);
    spawndata.var_6dc04302da1a9d03 = getvehiclespawndata(vehicle);
    spawndata.var_22aa4aa0cf0aa6bb = vehicle.var_22aa4aa0cf0aa6bb;
    if (isdefined(spawndata.var_6dc04302da1a9d03)) {
        spawndata.var_14cde247ac3313a4 = spawndata.var_6dc04302da1a9d03.var_14cde247ac3313a4;
    }
    if (vehicle vehicle_getspeed() > var_e2818ad39a3341b4.var_fb41d1ca75009bf0.var_5c46723e5c84c4b6) {
        spawndata.initialvelocity = vehicle vehicle_getvelocity() * var_e2818ad39a3341b4.var_fb41d1ca75009bf0.var_c1a04b9d422db491;
    }
    return spawndata;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad7
// Size: 0x1e1
function vehicle_spawn_canspawnvehicle(vehicleref, owner, team, spawntype) {
    /#
        if (istrue(level.var_4e89ea3291f12198)) {
            println("alterRespawnData" + vehicleref);
        }
    #/
    if (canspawnvehicle()) {
        /#
            issharedfuncdefined("<unknown string>", "<unknown string>", 1);
        #/
        if ([[ getsharedfunc("vehicle_spawn", "canSpawnVehicle") ]](vehicleref)) {
            if (isdefined(vehicleref)) {
                if (!vehicle_tracking_instancesarelimited(vehicleref) || !vehicle_tracking_atinstancelimit(vehicleref, owner, team, spawntype)) {
                    var_e2818ad39a3341b4 = vehicle_spawn_getleveldataforvehicle(vehicleref);
                    if (isdefined(var_e2818ad39a3341b4)) {
                        if (istrue(level.ignorevehicletypeinstancelimit) || !isdefined(var_e2818ad39a3341b4.maxinstancecount) || vehicle_tracking_getgameinstances(vehicleref).size < var_e2818ad39a3341b4.maxinstancecount) {
                            if (isdefined(var_e2818ad39a3341b4.canspawncallback)) {
                                return [[ var_e2818ad39a3341b4.canspawncallback ]](owner, team);
                            } else {
                                return 1;
                            }
                        } else {
                            /#
                                if (istrue(level.var_4e89ea3291f12198)) {
                                    println("<unknown string>" + vehicleref);
                                }
                            #/
                        }
                    } else {
                        /#
                            if (istrue(level.var_4e89ea3291f12198)) {
                                println("<unknown string>" + vehicleref);
                            }
                        #/
                    }
                } else {
                    /#
                        if (istrue(level.var_4e89ea3291f12198)) {
                            println("<unknown string>" + vehicleref);
                        }
                    #/
                }
            } else {
                /#
                    if (istrue(level.var_4e89ea3291f12198)) {
                        println("<unknown string>");
                    }
                #/
            }
        } else {
            /#
                if (istrue(level.var_4e89ea3291f12198)) {
                    println("<unknown string>" + vehicleref);
                }
            #/
        }
    } else {
        /#
            if (istrue(level.var_4e89ea3291f12198)) {
                println("<unknown string>" + vehicleref + "<unknown string>" + getvehiclecount() + "<unknown string>" + level.maxvehiclecount);
            }
        #/
    }
    return 0;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc0
// Size: 0x252
function function_25d4b673539659a1() {
    while (!level.var_54c8acfd634a416c) {
        waitframe();
    }
    var_c9ed6663f76bec8a = [];
    foreach (data in level.var_a0b2c978ca57ffc5) {
        if (!isdefined(data.spawn) || !isdefined(data.spawn.var_32b659cdf8f93ae2)) {
            continue;
        }
        var_c9ed6663f76bec8a[data.spawn.var_32b659cdf8f93ae2] = data;
    }
    points = [];
    structs = [];
    foreach (targetname, data in var_c9ed6663f76bec8a) {
        structs = array_combine(structs, getstructarray(targetname, "targetname"));
    }
    foreach (struct in structs) {
        if (!isdefined(struct.script_noteworthy)) {
            continue;
        }
        num = -1;
        switch (tolower(struct.script_noteworthy)) {
        case #"hash_31103fbc01bd840c":
            num = 0;
            break;
        case #"hash_311042bc01bd88c5":
            num = 1;
            break;
        case #"hash_311041bc01bd8732":
            num = 2;
            break;
        case #"hash_31103cbc01bd7f53":
            num = 3;
            break;
        case #"hash_31103bbc01bd7dc0":
            num = 4;
            break;
        }
        if (num == -1) {
            continue;
        }
        points[num] = [0:var_c9ed6663f76bec8a[struct.targetname].ref, 1:struct.origin, 2:struct.angles, 3:struct.script_team];
    }
    return points;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xf1a
// Size: 0xeb
function function_9f3ee4972dec5b57(vehicleref, origin, angles, targetname, vehicletype, script_noteworthy) {
    if (!isdefined(vehicleref) || !isdefined(origin)) {
        /#
            assertmsg("Attempted to create a vehicle spawn struct with an undefined vehicle ref or origin");
        #/
        return;
    }
    if (!isdefined(targetname)) {
        targetname = function_348b69ec4082ceba(vehicleref);
    }
    if (!isdefined(vehicletype)) {
        vehicletype = function_8fb5b3da3ad4d628(vehicleref);
    }
    if (!isdefined(targetname) || !isdefined(vehicletype)) {
        /#
            assertmsg("Attempted to create a vehicle spawn struct for " + vehicleref + " but we didn't find a targetname / vehicle type. It's probably not loaded");
        #/
        return;
    }
    struct = spawnstruct();
    struct.origin = origin;
    struct.angles = angles;
    struct.targetname = targetname;
    struct.vehicletype = vehicletype;
    struct.script_noteworthy = script_noteworthy;
    function_1f6c1a9b7564dc61(struct);
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100c
// Size: 0x5e
function function_b08e7e3a0b14f76f(vehicleref) {
    targetname = function_348b69ec4082ceba(vehicleref);
    if (!isdefined(targetname)) {
        return [];
    }
    structs = getstructarray(targetname, "targetname");
    if (structs.size > 0) {
        structs = vehicle_spawn_removespawnstructswithflag(structs);
        if (structs.size > 1) {
            structs = array_randomize(structs);
        }
    }
    return structs;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1072
// Size: 0x4d
function function_5a6b4f3358f3e3cc(vehicleref) {
    targetname = function_348b69ec4082ceba(vehicleref);
    if (!isdefined(targetname)) {
        return [];
    }
    structs = getstructarray(targetname, "targetname");
    if (structs.size > 0) {
        structs = vehicle_spawn_removespawnstructswithflag(structs);
    }
    return structs;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c7
// Size: 0x76
function function_348b69ec4082ceba(vehicleref) {
    if (!function_38f50decb5603d7(vehicleref)) {
        return undefined;
    }
    if (!function_89dc39dc11f3988c(vehicleref)) {
        return function_6a36b14e6b79459("vehiclebundle:" + vehicleref + ter_op(!iscp(), "_mp", "_cp"), #"targetname");
    } else {
        data = function_29b4292c92443328(vehicleref);
        if (isdefined(data)) {
            return data.targetname;
        }
    }
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1144
// Size: 0x76
function function_8fb5b3da3ad4d628(vehicleref) {
    if (!function_38f50decb5603d7(vehicleref)) {
        return undefined;
    }
    if (!function_89dc39dc11f3988c(vehicleref)) {
        return function_6a36b14e6b79459("vehiclebundle:" + vehicleref + ter_op(!iscp(), "_mp", "_cp"), #"vehicle");
    } else {
        data = function_29b4292c92443328(vehicleref);
        if (isdefined(data)) {
            return data.vehicle;
        }
    }
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c1
// Size: 0xad
function vehicle_spawn_removespawnstructswithflag(var_bfe291b401a9bf2a) {
    if (getdvarint(@"hash_d451d5012c6af909", 0) == 1) {
        return var_bfe291b401a9bf2a;
    }
    var_6aa95e939196db86 = 1 >> 0;
    var_42b00a533d5e71fc = [];
    foreach (struct in var_bfe291b401a9bf2a) {
        if (isdefined(struct.spawnflags) && struct.spawnflags & var_6aa95e939196db86) {
            continue;
        }
        var_42b00a533d5e71fc[var_42b00a533d5e71fc.size] = struct;
    }
    return var_42b00a533d5e71fc;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1276
// Size: 0x2e
function vehicle_spawn_gamemodesupportsrespawn() {
    if (utility::iscp()) {
        defaultvalue = 0;
    } else {
        defaultvalue = 1;
    }
    return getdvarint(@"hash_bd25469fa7e9f44f", defaultvalue);
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ac
// Size: 0x1c3
function vehicle_spawn_init() {
    /#
        assertex(isdefined(level.vehicle), "vehicle_spawn_init() called before vehicle_init().");
    #/
    /#
        assertex(!isdefined(level.vehicle.spawn), "vehicle_spawn_init() should only be called once.");
    #/
    leveldata = spawnstruct();
    level.vehicle.spawn = leveldata;
    leveldata.databyref = [];
    leveldata.spawnfromstructsdelayornotify = 5;
    if (isusingmatchrulesdata()) {
        leveldata.var_4edf33a79425c582 = function_53c4c53197386572(getmatchrulesdata("commonOption", "vehicleRespawnDelay"), 0);
        leveldata.var_cc97f9614c876576 = function_53c4c53197386572(getmatchrulesdata("commonOption", "vehicleAbandonedTimeout"), 0);
    } else {
        leveldata.var_4edf33a79425c582 = 0;
        leveldata.var_cc97f9614c876576 = 0;
    }
    leveldata.respawndelayoverride = getdvarint(@"hash_1f347fd0c3d771a2", 0);
    leveldata.abandonedtimeoutoverride = getdvarint(@"hash_e547fe8dfe1679f6", 0);
    leveldata.respawndelay = getdvarint(@"hash_8fdbbb498db9480a", 60);
    leveldata.abandonedtimeoutdelay = getdvarint(@"hash_36374c04e23480b6", 30);
    /#
        level.var_4e89ea3291f12198 = getdvarint(@"hash_528ed37a0fec0b6d", 0) == 1;
    #/
    vehicle_spawn_initspawnclearance();
    /#
        issharedfuncdefined("<unknown string>", "<unknown string>", 1);
    #/
    [[ getsharedfunc("vehicle_spawn", "init") ]]();
    vehicle_spawn_initlate();
    level.ignorevehicletypeinstancelimit = getdvarint(@"hash_37f76437c65cd04e", 1);
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1476
// Size: 0x29
function vehicle_spawn_initlate() {
    if (issharedfuncdefined("vehicle_spawn", "initLate")) {
        [[ getsharedfunc("vehicle_spawn", "initLate") ]]();
    }
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14a6
// Size: 0x2b
function vehicle_spawn_spawnfromstructscomparefunc(var_336fd2a2db40c0ee, var_336fd1a2db40bebb) {
    return var_336fd2a2db40c0ee.priority >= var_336fd1a2db40bebb.priority;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d9
// Size: 0x50
function vehicle_spawn_getleveldata() {
    /#
        assertex(isdefined(level.vehicle), "vehicle_spawn_getLevelData() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.spawn), "vehicle_spawn_getLevelData() called before vehicle_spawn_init().");
    #/
    return level.vehicle.spawn;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1531
// Size: 0xeb
function vehicle_spawn_isvehiclespawnstruct() {
    targetname = self.targetname;
    if (isdefined(targetname)) {
        switch (targetname) {
        case #"hash_6814f5e14262cd1":
        case #"hash_1479e2073c83cda2":
        case #"hash_1be85ecd6eb9915e":
        case #"hash_257440848fa1e781":
        case #"hash_297027751cd2c948":
        case #"hash_5976269dab51a932":
        case #"hash_5b97d59c5aa200ba":
        case #"hash_5c5417975c844e03":
        case #"hash_8d97f13aa572972d":
        case #"hash_9fae9f2b4d8960b5":
        case #"hash_b970b9f69d11cd68":
        case #"hash_c30f8ac20d6114ae":
        case #"hash_ce76a6942e01af7b":
        case #"hash_e0700813f3933328":
        case #"hash_f248c9f68e2ba5bb":
            return 1;
        default:
            return 0;
            break;
        }
    }
    return 0;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1624
// Size: 0x21
function vehicle_spawn_initspawnclearance() {
    leveldata = vehicle_spawn_getleveldata();
    leveldata.clearancecheckminradii = [];
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164c
// Size: 0x2d3
function vehicle_spawn_checkspawnclearance(position, vehicleref, var_c3fbb6661b91750f, var_4aaf9f2ce5798f37, var_71434c5acf1c3551) {
    leveldata = vehicle_spawn_getleveldata();
    var_1bfa1d374486da61 = 200;
    var_c473eeeb53ba4f3c = 200;
    var_e2818ad39a3341b4 = vehicle_spawn_getleveldataforvehicle(vehicleref);
    /#
        assertex(isdefined(var_e2818ad39a3341b4), "vehicle_spawn_checkSpawnClearance called with an invalid vehicle ref.");
    #/
    minradius = var_e2818ad39a3341b4.clearancecheckradius;
    if (!isdefined(minradius)) {
        minradius = leveldata.clearancecheckminradii[vehicleref];
    }
    /#
        assertex(isdefined(minradius), "Could not find a clearanceCheckMinRadius for " + vehicleref + ".");
    #/
    if (isdefined(var_e2818ad39a3341b4.clearancecheckradius)) {
        var_1bfa1d374486da61 = var_e2818ad39a3341b4.clearancecheckradius;
    }
    if (isdefined(var_e2818ad39a3341b4.clearancecheckheight)) {
        var_c473eeeb53ba4f3c = var_e2818ad39a3341b4.clearancecheckheight;
    }
    if (isdefined(var_71434c5acf1c3551)) {
        position = position + (0, 0, var_71434c5acf1c3551);
    }
    var_b65b7aeab526e1ac = (var_1bfa1d374486da61, var_1bfa1d374486da61, var_c473eeeb53ba4f3c);
    var_80745cf3e2877df5 = position - var_b65b7aeab526e1ac;
    var_809746f3e2ad954b = position + var_b65b7aeab526e1ac;
    contents = var_c3fbb6661b91750f;
    if (!isdefined(contents)) {
        contents = physics_createcontents([0:"physicscontents_vehicle"]);
    }
    ignorelist = var_4aaf9f2ce5798f37;
    if (!isdefined(ignorelist)) {
        ignorelist = [];
        ignorelist[ignorelist.size] = vehicle_tracking_getgameinstances("emp_drone");
        ignorelist[ignorelist.size] = vehicle_tracking_getgameinstances("cruise_predator");
        if (isdefined(level.supportdrones)) {
            ignorelist[ignorelist.size] = level.supportdrones;
        }
        ignorelist = namespace_3c37cb17ade254d::array_combine_multiple(ignorelist);
    }
    vehicles = physics_aabbbroadphasequery(var_80745cf3e2877df5, var_809746f3e2ad954b, contents, ignorelist);
    if (isdefined(vehicles) && vehicles.size > 0) {
        foreach (vehicle in vehicles) {
            if (isdefined(vehicle.vehiclename)) {
                var_deca1b39a5edfa25 = vehicle_spawn_getleveldataforvehicle(vehicle.vehiclename);
                var_bb076e4ca88a53ec = undefined;
                if (isdefined(var_deca1b39a5edfa25)) {
                    var_bb076e4ca88a53ec = var_deca1b39a5edfa25.clearancecheckradius;
                }
                if (!isdefined(var_bb076e4ca88a53ec)) {
                    var_bb076e4ca88a53ec = leveldata.clearancecheckminradii[vehicle.vehiclename];
                }
                if (!isdefined(var_bb076e4ca88a53ec)) {
                    continue;
                }
                var_87733e27a41d9ef9 = pow(minradius + var_bb076e4ca88a53ec, 2);
                if (isdefined(var_87733e27a41d9ef9) && var_87733e27a41d9ef9 < distance2dsquared(vehicle.origin, position)) {
                    continue;
                }
                return 0;
            }
        }
    }
    return 1;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1927
// Size: 0x59
function vehicle_spawn_setclearancecheckminradius(ref, minradius) {
    leveldata = vehicle_spawn_getleveldata();
    var_e2818ad39a3341b4 = vehicle_spawn_getleveldataforvehicle(ref);
    if (isdefined(var_e2818ad39a3341b4)) {
        var_e2818ad39a3341b4.clearancecheckradius = minradius;
        return;
    }
    leveldata.clearancecheckminradii[ref] = minradius;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1987
// Size: 0x14
function function_b09e91c2e808dbcd(spawndata, var_ee8da5624236dc89) {
    
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a3
// Size: 0xb
function function_fa044e2304e9e1a4() {
    thread function_fc6ead687e73f25f();
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b5
// Size: 0x52
function function_fc6ead687e73f25f() {
    spawndata = spawnstruct();
    copyvehiclespawndata(self.var_6dc04302da1a9d03, spawndata);
    var_ee8da5624236dc89 = spawnstruct();
    vehicle = vehicle_spawn_waitandrespawn(spawndata.targetname, spawndata, var_ee8da5624236dc89);
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a0e
// Size: 0xb
function function_284795e4a9e3762c() {
    thread function_9a5d0431afaf5b80();
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a20
// Size: 0x76
function function_9a5d0431afaf5b80() {
    oldspawndata = getvehiclespawndata(self);
    if (isdefined(oldspawndata.var_6dc04302da1a9d03)) {
        oldspawndata = oldspawndata.var_6dc04302da1a9d03;
    }
    spawndata = spawnstruct();
    copyvehiclespawndata(oldspawndata, spawndata);
    var_ee8da5624236dc89 = spawnstruct();
    vehicle = vehicle_spawn_waitandrespawn(self.vehiclename, spawndata, var_ee8da5624236dc89);
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a9d
// Size: 0x169
function vehicle_spawn_waitandrespawn(ref, spawndata, var_ee8da5624236dc89) {
    level endon("game_ended");
    level endon("cancel_pending_vehicle_respawns");
    var_e2818ad39a3341b4 = vehicle_spawn_getleveldataforvehicle(ref);
    if (!isdefined(var_e2818ad39a3341b4)) {
        return;
    }
    leveldata = vehicle_spawn_getleveldata();
    delay = undefined;
    if (leveldata.respawndelayoverride != 0) {
        delay = leveldata.respawndelayoverride;
    } else if (leveldata.var_4edf33a79425c582 != 0) {
        delay = leveldata.var_4edf33a79425c582;
    } else if (isdefined(var_e2818ad39a3341b4.respawndelay)) {
        delay = var_e2818ad39a3341b4.respawndelay;
    } else {
        delay = leveldata.respawndelay;
    }
    if (delay >= 1) {
        if (delay >= 9999) {
            return undefined;
        }
    } else {
        delay = 1;
    }
    while (1) {
        wait(delay);
        if (vehicle_spawn_canspawnvehicle(ref)) {
            if (issharedfuncdefined(ref, "alterRespawnData")) {
                spawndata = [[ getsharedfunc(ref, "alterRespawnData") ]](spawndata);
            }
            var_c65c40f752ce7d39 = 1;
            if (!var_c65c40f752ce7d39 || vehicle_spawn_checkspawnclearance(spawndata.origin, ref)) {
                vehicle = namespace_1f188a13f7e79610::vehicle_spawn(ref, spawndata, var_ee8da5624236dc89);
                if (!isdefined(vehicle)) {
                    continue;
                }
                return vehicle;
            }
        }
        delay = 5;
    }
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c0d
// Size: 0x1a
function vehicle_spawn_preventrespawn(vehicle) {
    vehicle.var_22aa4aa0cf0aa6bb = 1;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c2e
// Size: 0xb
function vehicle_spawn_cancelpendingrespawns() {
    level notify("cancel_pending_vehicle_respawns");
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c40
// Size: 0x96
function function_6c65df1f40e10037() {
    if (istrue(self.donotwatchabandoned)) {
        return;
    }
    if (istrue(self.isdestroyed)) {
        return;
    }
    if (self.occupants.size > 0) {
        return;
    }
    if (isdefined(self.var_3a442282fb9074e1) && self.var_3a442282fb9074e1.size > 0) {
        return;
    }
    if (isdefined(self.var_8784c427b1af24a6) && self.var_8784c427b1af24a6.size > 0) {
        return;
    }
    self endon("death");
    self endon("stop_watching_abandoned");
    wait(60);
    if (namespace_36f464722d326bbe::getgametype() == "wm") {
        return;
    } else {
        namespace_1fbd40990ee60ede::function_887b4e2cbe3ab92c();
    }
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cdd
// Size: 0x8f
function vehicle_spawn_gamemodesupportsabandonedtimeout(var_5e1984dbb5848080) {
    defaultvalue = 1;
    if (utility::ismp() && namespace_36f464722d326bbe::isbrstylegametype()) {
        defaultvalue = 0;
    }
    if (utility::iscp() && level.gametype != "cp_survival") {
        defaultvalue = 0;
    }
    if (var_5e1984dbb5848080 && istrue(level.var_45496c9df00f2bd4)) {
        defaultvalue = 1;
    }
    dvar = ter_op(var_5e1984dbb5848080, @"hash_1d79ef11c80ba28f", @"hash_aa11765fde7e66f6");
    return getdvarint(dvar, defaultvalue);
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d74
// Size: 0x1b0
function vehicle_spawn_watchabandoned() {
    var_5e1984dbb5848080 = function_b7148a3bfc4defb2();
    if (!namespace_dace9d390bc4a290::vehicle_spawn_gamemodesupportsabandonedtimeout(var_5e1984dbb5848080)) {
        return;
    }
    if (istrue(self.var_7e5374c9fb7f2bd8)) {
        return;
    }
    if (self.occupants.size > 0) {
        return;
    }
    if (isdefined(self.var_3a442282fb9074e1) && self.var_3a442282fb9074e1.size > 0) {
        return;
    }
    if (isdefined(self.var_8784c427b1af24a6) && self.var_8784c427b1af24a6.size > 0) {
        return;
    }
    if (istrue(self.isdestroyed)) {
        return;
    }
    if (istrue(self.donotwatchabandoned)) {
        return;
    }
    var_e2818ad39a3341b4 = vehicle_spawn_getleveldataforvehicle(function_d93ec4635290febd());
    if (!isdefined(var_e2818ad39a3341b4)) {
        return;
    }
    if (!isdefined(var_e2818ad39a3341b4.abandonedtimeoutcallback)) {
        return;
    }
    self.var_7e5374c9fb7f2bd8 = 1;
    self endon("death");
    self endon("stop_watching_abandoned");
    leveldata = vehicle_spawn_getleveldata();
    delay = undefined;
    if (leveldata.abandonedtimeoutoverride != 0 && !var_5e1984dbb5848080) {
        delay = leveldata.abandonedtimeoutoverride;
    } else if (leveldata.var_cc97f9614c876576 != 0 && !var_5e1984dbb5848080) {
        delay = leveldata.var_cc97f9614c876576;
    } else if (isdefined(var_e2818ad39a3341b4.abandonedtimeoutdelay) && !var_5e1984dbb5848080) {
        delay = var_e2818ad39a3341b4.abandonedtimeoutdelay;
    } else {
        delay = leveldata.abandonedtimeoutdelay;
    }
    if (namespace_1f188a13f7e79610::function_7c62ca52f72901a1() && self vehicle_isonground()) {
        delay = delay * 0.3;
    }
    if (delay >= 1) {
        if (delay >= 9999) {
            return;
        }
    } else {
        delay = 1;
    }
    wait(delay);
    thread vehicle_spawn_abandonedtimeout();
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f2b
// Size: 0x15
function vehicle_spawn_stopwatchingabandoned() {
    self notify("stop_watching_abandoned");
    self.var_7e5374c9fb7f2bd8 = undefined;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f47
// Size: 0x3c
function vehicle_spawn_abandonedtimeout() {
    vehicle_spawn_stopwatchingabandoned();
    self.donotwatchabandoned = 1;
    var_e2818ad39a3341b4 = vehicle_spawn_getleveldataforvehicle(function_d93ec4635290febd());
    self thread [[ var_e2818ad39a3341b4.abandonedtimeoutcallback ]]();
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f8a
// Size: 0x1d
function function_357783d7c1d96273() {
    vehicle_spawn_stopwatchingabandoned();
    self.donotwatchabandoned = 1;
    thread vehicle_spawn_abandonedtimeoutcallback();
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fae
// Size: 0x67
function vehicle_spawn_abandonedtimeoutcallback() {
    damagestate = namespace_5a0f3ca265d3a4c8::vehicle_damage_getstate();
    if (damagestate != "heavy") {
        var_4e49623dc4538a67 = namespace_5a0f3ca265d3a4c8::vehicle_damage_getheavystatemaxhealth(self);
        if (isdefined(var_4e49623dc4538a67)) {
            self.health = int(min(var_4e49623dc4538a67, self.health));
            namespace_84cff6185e39aa66::vehomn_updateomnvarsondamage(self);
        }
        namespace_5a0f3ca265d3a4c8::vehicle_damage_setstate("heavy", damagestate);
    }
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x201c
// Size: 0x1d
function function_17bb29fece7da497(vehicleref) {
    return vehicle_spawn_getleveldataforvehicle(vehicleref).timeoutonabandoneddelay;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2041
// Size: 0x63
function function_aade62c6cf163888(vehicleref) {
    data = function_29b4292c92443328(vehicleref);
    if (isdefined(data.var_fb41d1ca75009bf0) && istrue(data.var_fb41d1ca75009bf0.var_f2cf04c055fd760e)) {
        return function_29b4292c92443328(vehicleref).var_fb41d1ca75009bf0.var_a7d11025c5cd54ec;
    }
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ab
// Size: 0x1d
function function_89cda5ba9bfc8d56(vehicleref) {
    return function_29b4292c92443328(vehicleref).var_99b969de33fe3be4;
}

// Namespace vehicle_spawn/namespace_dace9d390bc4a290
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20d0
// Size: 0xbc
function vehicle_spawn_initdev() {
    /#
        setdevdvarifuninitialized(@"hash_d451d5012c6af909", 0);
        setdevdvarifuninitialized(@"hash_36aaf7d3b773c77a", "<unknown string>");
        setdevdvarifuninitialized(@"hash_29ad65e1f5a10c7d", "<unknown string>");
        setdevdvarifuninitialized(@"hash_37b6962333b896f9", "<unknown string>");
        setdevdvarifuninitialized(@"hash_c6bdc7ccd09be1d9", "<unknown string>");
        setdevdvarifuninitialized(@"hash_9ec4150c7e03e3ee", "<unknown string>");
        setdevdvarifuninitialized(@"hash_1f347fd0c3d771a2", 0);
        setdevdvarifuninitialized(@"hash_8fdbbb498db9480a", 60);
        setdevdvarifuninitialized(@"hash_e547fe8dfe1679f6", 0);
        setdevdvarifuninitialized(@"hash_36374c04e23480b6", 30);
    #/
}

