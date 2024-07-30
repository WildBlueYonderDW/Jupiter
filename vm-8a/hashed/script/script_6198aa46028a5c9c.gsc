#using scripts\engine\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_41387eecc35b88bf;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_185660037b9236c1;
#using script_4fdefae8b7bcdf73;
#using script_5753ba9c28794a65;
#using script_3ab210ea917601e7;
#using script_6617e2f2bb62b52b;
#using script_46c7c73b1a7e4773;
#using script_9880b9dc28bc25e;
#using scripts\engine\scriptable.gsc;
#using script_440a6f7f2d90cc3c;
#using script_7edf952f8921aa6b;
#using script_1174abedbefe9ada;
#using script_638d701d263ee1ed;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_a62705cb078ec0a;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\utility\scriptable_door_utility.gsc;
#using script_2f2628d802eb2807;
#using script_772861646614d63a;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_4e6e58ab5d96c2b0;
#using scripts\mp\objidpoolmanager.gsc;
#using script_6c4e8cea70bf4b6d;
#using scripts\mp\ai_behavior.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;

#namespace namespace_7b4c61760c2a90db;

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81d
// Size: 0x198
function function_89a7a8b0101530ec() {
    if (!isdefined(level._effect["cargo_pallet_destruction"])) {
        level._effect["cargo_pallet_destruction"] = loadfx("vfx/iw9/veh/scriptables/death/vfx_veh_cargo_dest.vfx");
    }
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("door_metal_roller_01", &function_4df410d9f7d447b7);
    namespace_b1af0fcaf4ad16d6::function_3e3a73f1039ca16d();
    setdvar(@"hash_3061dc07aba9108", 0);
    game["dialog"]["dmz_mission_vehicledrive_accept"] = "dx_br_dmzo_cost_ovld_aivd";
    game["dialog"]["dmz_mission_vehicledrive_open_door"] = "dx_br_dmzo_cost_ovld_vdad";
    game["dialog"]["dmz_mission_vehicledrive_extract_inbound"] = "dx_br_dmzo_cost_ovld_vdar";
    game["dialog"]["dmz_mission_vehicledrive_destination"] = "dx_br_dmzo_cost_ovld_vhdd";
    game["dialog"]["dmz_mission_vehicledrive_assigned"] = "dx_br_dmzo_cost_ovld_vhda";
    function_89384091f7a2dbd("REV_OB_VEHICLE_DRIVE", 0, &function_ea1f3e8ff1234996);
    function_89384091f7a2dbd("REV_OB_VEHICLE_DRIVE", 1, &function_142d4e0177a0ef1e);
    function_89384091f7a2dbd("REV_OB_VEHICLE_DRIVE", 2, &function_48814026e195ab4a);
    function_89384091f7a2dbd("REV_OB_VEHICLE_DRIVE", 3, &function_6211630e2529bb45);
    function_89384091f7a2dbd("REV_OB_VEHICLE_DRIVE", 4, &function_8b3610ecb17001dd);
    function_89384091f7a2dbd("REV_OB_VEHICLE_DRIVE", 5, &function_ed9ca3ba76fec8a9);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_a83dac517db5f281, "REV_OB_VEHICLE_DRIVE");
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_17b2cc1534fba628, "REV_OB_VEHICLE_DRIVE");
    function_8b5b2a3392fc7e2a("PlayerAbandon", &function_540f9b357f3b5419, "REV_OB_VEHICLE_DRIVE");
    if (!isdefined(level.var_4b99074f042decf6)) {
        namespace_dd16d65e824b8e9::function_b5e57408c7878df7(&on_ai_damage);
        level.var_4b99074f042decf6 = 1;
    }
    /#
        thread debug_spawnvehicle();
    #/
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bd
// Size: 0xc0a
function function_ea1f3e8ff1234996() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    if (!isdefined(level.var_8d5ea37eafa7b186)) {
        destinations = getstructarray("dmz_vehicledrive_end", "targetname");
        level.var_8d5ea37eafa7b186 = [];
        foreach (node in destinations) {
            if (!namespace_7789f919216d38a2::function_cdcab1374db7f007(node.origin)) {
                level.var_8d5ea37eafa7b186[level.var_8d5ea37eafa7b186.size] = node;
            }
        }
    }
    if (!isdefined(level.var_77aa416377054823)) {
        level.var_77aa416377054823 = getstructarray("heli_reinforceNode", "script_noteworthy");
    }
    var_45c17c8bd7095cc4 = function_b9c4aa88ad97ee68(self);
    self.variant_definition = var_45c17c8bd7095cc4;
    variant_structs = getstructarray(self.varianttag, "target");
    foreach (struct in variant_structs) {
        if (isdefined(struct.targetname) && struct.targetname == "dmz_vehicledrive_start") {
            vehicle_node = spawnstruct();
            vehicle_node.angles = struct.angles;
            vehicle_node.origin = struct.origin;
            self.start = vehicle_node;
            continue;
        }
        if (isdefined(struct.targetname) && struct.targetname == "vehicledrive_guard") {
            self.guard_spawn = struct;
            continue;
        }
        if (isdefined(struct.targetname) && struct.targetname == "vehicledrive_horde") {
            self.var_36109cad1c671585 = struct;
        }
    }
    if (!isdefined(self.start)) {
        function_4bc22996edea81f1(self);
    }
    garagedoors = [];
    blockers = [];
    locked_struct = undefined;
    var_320a6d29110cf41 = getentitylessscriptablearray("vehicle_drive_garage", "target", self.start.origin, 1000);
    foreach (component in var_320a6d29110cf41) {
        if (isdefined(component.targetname) && component.targetname == "door_contract_garage") {
            garagedoors[garagedoors.size] = component;
            continue;
        }
        if (isdefined(component.targetname) && component.targetname == "door_contract_blocker") {
            blockers[blockers.size] = component;
        }
    }
    var_726f847c1c7b1101 = getstructarray("door_contract_lock", "targetname");
    locked_struct = getclosest(self.start.origin, var_726f847c1c7b1101);
    self.garagedoors = garagedoors;
    self.var_1e561c2a5961a32b = blockers;
    self.locked_struct = locked_struct;
    self.difficulty_region = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(self.start.origin);
    if (self.difficulty_region == "difficulty_undefined") {
        self.difficulty_region = "difficulty_easy";
    }
    self.var_6aa7c8ac075eca43 = ["difficulty_darkaether", "difficulty_hard", "difficulty_normal"];
    self.var_29b19a8b7cde9972 = ["difficulty_normal", "difficulty_easy"];
    switch (self.difficulty_region) {
    case #"hash_651f76c0ad6741ec": 
        self.var_ac6b2d59d59a746 = 6;
        break;
    case #"hash_5343b465e56ec9a4": 
        self.var_ac6b2d59d59a746 = 6;
        break;
    case #"hash_af83e47edfa8900a": 
        self.var_ac6b2d59d59a746 = 4;
        break;
    case #"hash_7bb2cd766703d463":
    default: 
        self.var_ac6b2d59d59a746 = 0;
        break;
    }
    mindist = 25000;
    maxdist = 50000;
    destinations = get_array_of_closest(self.start.origin, level.var_8d5ea37eafa7b186, undefined, undefined, maxdist, mindist);
    if (destinations.size > 0) {
        destinations = array_randomize(destinations);
        foreach (dest in destinations) {
            if (!istrue(dest.inuse) && self.difficulty_region == namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(dest.origin)) {
                if (self.difficulty_region == "difficulty_hard" || self.difficulty_region == "difficulty_darkaether") {
                    self.end = dest;
                    dest.inuse = 1;
                    break;
                }
                halfway = (dest.origin + self.start.origin) / 2;
                if (namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(halfway) != "difficulty_hard") {
                    self.end = dest;
                    dest.inuse = 1;
                    break;
                }
            }
        }
    }
    if (!isdefined(self.end)) {
        var_a1e859971e19804 = 10000;
        destinations = get_array_of_closest(self.start.origin, level.var_8d5ea37eafa7b186, undefined, undefined, maxdist + var_a1e859971e19804, mindist - var_a1e859971e19804);
        destinations = array_randomize(destinations);
        foreach (dest in destinations) {
            if (!istrue(dest.inuse) && self.difficulty_region == namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(dest.origin)) {
                if (self.difficulty_region == "difficulty_hard" || self.difficulty_region == "difficulty_darkaether") {
                    self.end = dest;
                    dest.inuse = 1;
                    break;
                }
                halfway = (dest.origin + self.start.origin) / 2;
                if (namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(halfway) != "difficulty_hard") {
                    self.end = dest;
                    dest.inuse = 1;
                    break;
                }
            }
        }
    }
    if (!isdefined(self.end)) {
        println("<dev string:x1c>");
        function_4bc22996edea81f1(self);
        return;
    }
    if (!scripts\cp_mp\vehicles\vehicle::function_fa537f1ab52a76d1("veh9_jltv_mg")) {
        println("<dev string:x54>");
        function_4bc22996edea81f1(self);
        return;
    }
    self.vehicle = namespace_168c086126cfa488::function_cecaa2fcd2694301(self.start);
    self.vehicle.var_70ec04f736523dd0 = self.vehicle vehicle_gettopspeedforward();
    self.vehicle.var_abdfbc385c923e9f = self.vehicle vehicle_gettopspeedreverse();
    self.vehicle vehicleshowonminimap(0);
    self.vehicle.godmode = 1;
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_makeunusable(self.vehicle);
    if (getdvarint(@"hash_59e2ffb228fec3cd", 1)) {
        if (isdefined(garagedoors) && garagedoors.size > 0) {
            foreach (door in garagedoors) {
                door.activityinstance = self;
                door.navblocker = createnavobstaclebybounds(door.origin, (10, 100, 10), door.angles);
                door setscriptablepartstate("door_metal_roller_01", "close");
            }
        } else {
            assertmsg("Vehicle_drive setup missing garage door at " + self.start.origin);
        }
        self.keypads = [];
        sum_vector = (0, 0, 0);
        num_doors = 0;
        foreach (door in self.garagedoors) {
            sum_vector += door.origin;
            num_doors++;
        }
        midpoint = sum_vector / num_doors;
        keypad = utility::spawn_model("me_electrical_garage_numpad_01", midpoint + anglestoforward(self.garagedoors[0].angles) * 12, self.garagedoors[0].angles);
        self.keypads[self.keypads.size] = keypad;
        closestdoor = get_array_of_closest(self.var_36109cad1c671585.origin, self.garagedoors)[0];
        self.var_844b455ad4ce728d = closestdoor;
        closestkeypad = get_array_of_closest(self.var_36109cad1c671585.origin, self.keypads)[0];
        self.mainkeypad = closestkeypad;
        blockerradius = 1000;
        foreach (blocker in self.var_1e561c2a5961a32b) {
            blocker setscriptablepartstate("state", "visible");
        }
        doors = scripts\cp_mp\utility\scriptable_door_utility::scriptable_door_get_in_radius(self.locked_struct.origin, 75, 75);
        foreach (door in doors) {
            door scriptabledoorfreeze(1);
            self.locked_door = door;
        }
    }
    self.numagents = 0;
    if (array_contains(self.var_29b19a8b7cde9972, self.difficulty_region)) {
        thread function_a5a63a280536f55a();
    } else {
        thread function_143ec7d8f393908();
    }
    if (array_contains(self.var_6aa7c8ac075eca43, self.difficulty_region)) {
        thread function_3c6fe51637e28c8b();
    } else {
        thread function_b9d827c2633029c1();
    }
    var_37f4f6505381d02a = 1;
    if (istrue(var_37f4f6505381d02a)) {
        self.helidata = namespace_d38b9642992c29b5::function_e09936350b8d90fe();
    } else {
        self.helidata = namespace_2b263a10299a0a3a::function_e09936350b8d90fe();
    }
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x15cf
// Size: 0x4b
function function_e9f69242052c116f(start, end, min, max) {
    if (!isdefined(start) || !isdefined(end)) {
        return false;
    }
    return distancesquared(start, end) <= max * max && distancesquared(start, end) >= min * min;
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1623
// Size: 0x662
function function_142d4e0177a0ef1e() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.on_mission = namespace_838b439602b3acc7::function_f578373042c34e16(16625, "quest_s0a2t1_delivery_start", self.var_6c29f2fdb0054bbe);
    if (!self.on_mission) {
        namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_vehicledrive_start_land");
    }
    foreach (player in self.var_6c29f2fdb0054bbe) {
        params = spawnstruct();
        params.player = player;
        callback::callback("cargo_delivery_started", params);
    }
    function_8abb1c0b2f4039fa(self.var_6c29f2fdb0054bbe[0], 1);
    if (getdvarint(@"hash_59e2ffb228fec3cd", 1)) {
        foreach (door in self.garagedoors) {
            door setscriptablepartstate("door_metal_roller_01", "locked");
            foreach (player in level.players) {
                door disablescriptableplayeruse(player);
            }
            foreach (player in self.var_6c29f2fdb0054bbe) {
                door enablescriptableplayeruse(player);
            }
        }
    }
    thread function_a251d6ea3edb0aab();
    thread function_ef438efc54d8342c();
    if (getdvarint(@"hash_59e2ffb228fec3cd", 1)) {
        self waittill("vehicledrive_doorOpened");
    }
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_makeusable(self.vehicle);
    self.vehicle vehicleshowonminimap(1);
    self.vehicle.godmode = 0;
    self.vehicle ent_flag_init(self.type);
    thread function_81bd74d7532c3ed1();
    areaorigin = self.vehicle.origin;
    var_29d8a3a92f9037d8 = undefined;
    while (!isdefined(var_29d8a3a92f9037d8) || !array_contains(self.var_6c29f2fdb0054bbe, var_29d8a3a92f9037d8)) {
        if (!(isdefined(self.vehicle) && isdefined(self.vehicle.vehiclename))) {
            if (self.on_mission) {
                foreach (player in self.var_6c29f2fdb0054bbe) {
                    function_4a508fcbbea05afd(player);
                }
            }
            endactivity(self, 0);
            return;
        }
        var_29d8a3a92f9037d8 = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver(self.vehicle, 1);
        wait 0.1;
    }
    attractor_offsets = [(135, 0, 0), (-125, 0, 0), (0, 50, 0), (0, -50, 0), (60, 50, 0), (60, -50, 0), (-60, 50, 0), (-60, -50, 0)];
    self.vehicle.attractor = add_attractor(self.vehicle, 2, 1250, 1, undefined, &function_9831eb0c155ca235);
    thread namespace_b3f32c8cb80b8124::function_e73a92bbeb2ae323();
    scripts\mp\objidpoolmanager::update_objective_position(self.var_b494362af9b72fd3, self.end.origin + (0, 0, 60));
    self thread [[ self.helidata.var_e0fd93cddc4b8912 ]]();
    while (isdefined(self.vehicle) && distance2dsquared(self.vehicle.origin, areaorigin) < 9000000) {
        wait 0.1;
    }
    self.teams = [self.var_6c29f2fdb0054bbe[0].team];
    self.enemyheli = self [[ self.helidata.spawnheli ]](self.vehicle);
    self.enemyheli.var_1e0eb63ecb3f1e2 = 1;
    self.enemyheli.var_177d31bd38d64887 = 1;
    self.vehicle.var_a21a9516d1dede9e = var_29d8a3a92f9037d8.team;
    self.vehicle makeentitysentient(self.vehicle.var_a21a9516d1dede9e);
    self.vehicle makeentitynomeleetarget();
    thread function_a18c5b6a48e36898();
    wait 2;
    function_1281c7fff9456e18("vehicle_drive_enemyheliinbound");
    scripts\engine\utility::waittill_any_3("payload_delivered", "payload_destroyed", "payload_stolen");
    if (self.payloaddelivered && !self.on_mission) {
        namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_vehicledrive_success");
    }
    if (!self.payloaddelivered && self.on_mission) {
        foreach (player in self.var_6c29f2fdb0054bbe) {
            function_4a508fcbbea05afd(player);
        }
    }
    if (isdefined(self) && isdefined(self.vehicle) && istrue(self.payloaddelivered)) {
        self.vehicle ent_flag_init("cargo_delivered");
    }
    endactivity(self, self.payloaddelivered);
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8d
// Size: 0x5c
function function_ce5af2f09a72177a(offsets, axes) {
    x_axis = axes["forward"];
    y_axis = axes["right"];
    z_axis = axes["up"];
    return offsets[0] * x_axis + offsets[1] * y_axis + offsets[2] * z_axis;
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cf2
// Size: 0xfd
function function_48814026e195ab4a() {
    self endon("instance_destroyed");
    if (isdefined(self.vehicle) && isdefined(self.vehicle.var_70ec04f736523dd0) && isdefined(self.vehicle.var_abdfbc385c923e9f)) {
        self.vehicle vehicle_settopspeedforward(self.vehicle.var_70ec04f736523dd0);
        self.vehicle vehicle_settopspeedreverse(self.vehicle.var_abdfbc385c923e9f);
    }
    namespace_f2c68794a1018c9d::function_629ed367d1393020();
    self.end.inuse = 0;
    if (isdefined(self.enemyheli)) {
        self.enemyheli thread [[ self.helidata.flyaway ]]();
    }
    if (isdefined(self.extractheli)) {
        self.extractheli.readytoleave = 1;
    }
    function_29c112cff2b3d3b();
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df7
// Size: 0x123
function function_6211630e2529bb45() {
    function_29c112cff2b3d3b();
    if (isdefined(self.keypads)) {
        if (isdefined(self.mainkeypad.attractor)) {
            remove_attractor(self.mainkeypad.attractor);
        }
        foreach (keypad in self.keypads) {
            keypad delete();
        }
    }
    if (isdefined(self.var_1e561c2a5961a32b)) {
        foreach (blocker in self.var_1e561c2a5961a32b) {
            blocker setscriptablepartstate("state", "hidden");
        }
    }
    if (isdefined(self.locked_door)) {
        self.locked_door scriptabledoorfreeze(0);
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f22
// Size: 0x4c
function function_8b3610ecb17001dd() {
    if (isdefined(self.vehicle)) {
        return self.vehicle.origin;
    }
    if (isdefined(self.start)) {
        return self.start.origin;
    }
    return undefined;
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f76
// Size: 0x8e
function function_ed9ca3ba76fec8a9() {
    offset = (-100, 250, 0);
    reward_struct = spawnstruct();
    reward_struct.origin = getclosestpointonnavmesh(self.end.origin + function_ce5af2f09a72177a(offset, anglestoaxis(self.vehicle.angles)));
    reward_struct.angles = self.end.angles;
    return reward_struct;
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200d
// Size: 0xc7
function function_a83dac517db5f281(info_struct) {
    if (getdvarint(@"hash_59e2ffb228fec3cd", 1)) {
        foreach (player in info_struct.playerlist) {
            foreach (door in self.garagedoors) {
                door enablescriptablepartplayeruse("door_metal_roller_01", player);
            }
        }
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20dc
// Size: 0xc7
function function_17b2cc1534fba628(info_struct) {
    if (getdvarint(@"hash_59e2ffb228fec3cd", 1)) {
        foreach (player in info_struct.playerlist) {
            foreach (door in self.garagedoors) {
                door disablescriptablepartplayeruse("door_metal_roller_01", player);
            }
        }
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ab
// Size: 0x68
function function_540f9b357f3b5419(var_b381b0883bcd4847) {
    wait 0.2;
    foreach (player in var_b381b0883bcd4847.playerlist) {
        function_4a508fcbbea05afd(player);
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x221b
// Size: 0x25
function private function_4a508fcbbea05afd(player) {
    if (function_5acc35fc66331385(player, 16625)) {
        player ent_flag_clear("quest_s0a2t1_delivery_start");
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2248
// Size: 0x75
function function_4df410d9f7d447b7(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    instance setscriptablepartstate("door_metal_roller_01", "opening");
    destroynavobstacle(instance.navblocker);
    instance.open = 1;
    instance.activityinstance notify("vehicledrive_doorOpened");
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22c5
// Size: 0xda
function function_ef438efc54d8342c() {
    level endon("game_ended");
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (true) {
        foreach (player in self.var_6c29f2fdb0054bbe) {
            dist = distance2dsquared(player.origin, self.start.origin);
            if (dist < 6250000) {
                function_1281c7fff9456e18("vehicle_drive_inthearea");
                if (getdvarint(@"hash_59e2ffb228fec3cd", 1)) {
                    thread function_ef4391fc54d83ac5();
                    thread function_ef4390fc54d83892();
                }
                return;
            }
        }
        wait 1;
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23a7
// Size: 0xb7
function function_ef4391fc54d83ac5() {
    level endon("game_ended");
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (true) {
        foreach (player in self.var_6c29f2fdb0054bbe) {
            dist = distance2dsquared(player.origin, self.var_844b455ad4ce728d.origin);
            if (dist < 562500) {
                function_1281c7fff9456e18("vehicle_drive_neardoor");
                return;
            }
        }
        wait 1;
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2466
// Size: 0xb3
function function_ef4390fc54d83892() {
    level endon("game_ended");
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (true) {
        foreach (player in self.var_6c29f2fdb0054bbe) {
            dist = distance2dsquared(player.origin, self.var_844b455ad4ce728d.origin);
            if (dist < 90000) {
                self notify("vehicle_drive_players_nearing_door");
                return;
            }
        }
        wait 1;
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2521
// Size: 0x71
function function_a5a63a280536f55a() {
    requestid = function_f8ccadcd850da124("ai_encounter:enc_ob_vehicle_drive_guard", self.guard_spawn.origin, 100, 1, 0, 1, 0);
    if (isdefined(requestid)) {
        function_d37068aac7785c04(requestid, self.difficulty_region, 1);
        function_d37068aac7785c04(requestid, "inside", 1);
        function_ce9c21523336cdbc(requestid, &function_4e923844edd8a83b, [self, 1]);
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x259a
// Size: 0x70
function function_b9d827c2633029c1() {
    requestid = function_f8ccadcd850da124("ai_encounter:enc_ob_vehicle_drive_guard", self.var_36109cad1c671585.origin, 100, 1, 0, 1, 0);
    if (isdefined(requestid)) {
        function_d37068aac7785c04(requestid, self.difficulty_region, 1);
        function_d37068aac7785c04(requestid, "outside", 1);
        function_ce9c21523336cdbc(requestid, &function_4e923844edd8a83b, [self, 0]);
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2612
// Size: 0x233
function function_3c6fe51637e28c8b() {
    level endon("game_ended");
    self.vehicle endon("death");
    self endon("activity_ended");
    self endon("instance_destroyed");
    requestid = function_f8ccadcd850da124("ai_encounter:enc_ob_vehicle_drive_horde", self.var_36109cad1c671585.origin, 75, 1, 0, 1, 2);
    if (isdefined(requestid)) {
        function_d37068aac7785c04(requestid, self.difficulty_region, 1);
        function_d37068aac7785c04(requestid, "outside", 1);
    }
    if (isdefined(self.mainkeypad)) {
        self.mainkeypad.attractor = add_attractor(self.mainkeypad, 0, 750, 1, undefined, &function_9831eb0c155ca235);
        slot_offset = 320 / self.var_ac6b2d59d59a746;
        attractor_slots = [];
        for (i = 0; i < self.var_ac6b2d59d59a746 / 2; i++) {
            slot = spawnstruct();
            slot.origin = self.mainkeypad.origin + anglestoright(self.mainkeypad.angles) * 1 * (i + 1) * slot_offset + anglestoforward(self.mainkeypad.angles) * 15;
            attractor_slots[attractor_slots.size] = slot;
            slot = spawnstruct();
            slot.origin = self.mainkeypad.origin + anglestoright(self.mainkeypad.angles) * -1 * (i + 1) * slot_offset + anglestoforward(self.mainkeypad.angles) * 15;
            attractor_slots[attractor_slots.size] = slot;
        }
        function_357609ca7ca5486e(self.mainkeypad.attractor, attractor_slots);
        self waittill("vehicle_drive_players_nearing_door");
        if (isdefined(self.mainkeypad.attractor)) {
            remove_attractor(self.mainkeypad.attractor);
        }
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x284d
// Size: 0x59
function function_143ec7d8f393908() {
    requestid = function_f8ccadcd850da124("ai_encounter:enc_ob_vehicle_drive_horde", self.guard_spawn.origin, 75, 1, 0, 1, 2);
    if (isdefined(requestid)) {
        function_d37068aac7785c04(requestid, self.difficulty_region, 1);
        function_d37068aac7785c04(requestid, "inside", 1);
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28ae
// Size: 0xdd
function function_2171d1c800d2fcc() {
    level endon("game_ended");
    self.vehicle endon("death");
    self endon("activity_ended");
    self endon("instance_destroyed");
    wait 2;
    requestid = function_f8ccadcd850da124("ai_encounter:enc_ob_vehicle_drive_horde", self.end.origin, 75, 1, 0, 1, 0);
    if (isdefined(requestid)) {
        function_d37068aac7785c04(requestid, self.difficulty_region, 1);
        function_d37068aac7785c04(requestid, "destination", 1);
    }
    self.extractheli.attractor = add_attractor(self.extractheli.crate, 0, 500, 1, undefined, &function_9831eb0c155ca235);
    self waittill("players_nearing_destination");
    remove_attractor(self.extractheli.attractor);
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2993
// Size: 0x4a
function on_ai_damage(params) {
    if (istrue(self.var_fb9da5edf45a45f0)) {
        if (isdefined(self.attractor)) {
            if (isplayer(params.eattacker)) {
                remove_attractor(self.attractor);
            }
        }
    }
    return -1;
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29e6
// Size: 0xdc
function function_4e923844edd8a83b(requestid, userdata, agent, data) {
    activity = userdata[0];
    is_inside = userdata[1];
    agent endon("death");
    activity endon("activity_ended");
    activity endon("instance_destroyed");
    if (isalive(agent)) {
        activity thread function_a777d8a622ce1c65(agent);
        thread scripts\mp\ai_behavior::function_b11c1964f528574b(agent);
        activity.numagents += 1;
        if (istrue(is_inside)) {
            var_c271aeefe95b89d1 = 16;
            agent scripts\mp\ai_behavior::function_c6930ac29fe6ff53(var_c271aeefe95b89d1);
            agent setthreatbiasgroup("ignored_by_zombies");
            activity waittill("vehicledrive_doorOpened");
            var_29c6b2f7b7278f50 = 64;
            agent scripts\mp\ai_behavior::function_c6930ac29fe6ff53(var_29c6b2f7b7278f50);
            agent setthreatbiasgroup("team_hundred_ninety");
        }
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aca
// Size: 0x36
function function_a777d8a622ce1c65(agent) {
    self endon("activity_ended");
    self endon("instance_destroyed");
    agent waittill("death");
    self.numagents -= 1;
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b08
// Size: 0x63
function function_9831eb0c155ca235(attractor, zombie) {
    if (isdefined(zombie.var_941802a0997e0c42)) {
        return false;
    }
    if (isdefined(zombie.enemy)) {
        return false;
    }
    if (isalive(zombie) && isdefined(attractor)) {
        zombie.var_fb9da5edf45a45f0 = 1;
        zombie.attractor = attractor;
        return true;
    }
    return false;
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b74
// Size: 0x69
function function_81bd74d7532c3ed1() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.vehicle endon("death");
    while (true) {
        wait 1;
        if (self.vehicle.health < self.vehicle.maxhealth / 4) {
            function_1281c7fff9456e18("vehicle_drive_lowhealth");
            break;
        }
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2be5
// Size: 0x53
function function_a251d6ea3edb0aab() {
    level endon("game_ended");
    self endon("payload_delivered");
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.vehicle waittill("death");
    function_29c112cff2b3d3b();
    function_1281c7fff9456e18("vehicle_drive_destroyed");
    self.payloaddelivered = 0;
    self notify("payload_destroyed");
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c40
// Size: 0xbd
function function_dc76880e71e194bd() {
    level endon("game_ended");
    self endon("payload_delivered");
    self.vehicle endon("death");
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (true) {
        if (isdefined(self.vehicle) && isdefined(self.vehicle.occupants)) {
            driver = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver(self.vehicle, 1);
            if (isdefined(driver) && !array_contains(self.var_6c29f2fdb0054bbe, driver)) {
                self.payloaddelivered = 0;
                self notify("payload_stolen");
                function_1281c7fff9456e18("vehicle_drive_stolen", self.var_6c29f2fdb0054bbe);
                return;
            }
        }
        wait 1;
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d05
// Size: 0x381
function function_a18c5b6a48e36898() {
    level endon("game_ended");
    self.vehicle endon("death");
    self endon("activity_ended");
    self endon("instance_destroyed");
    var_23cd6d769cd06450 = 0;
    var_76eedae3beeb3cd6 = 0;
    sqdist = squared(int(100));
    heliflyaway = 0;
    while (true) {
        wait 0.1;
        if (!isdefined(self.vehicle) || !isdefined(self.vehicle.payload)) {
            if (isdefined(self.extractheli)) {
                self.extractheli.readytoleave = 1;
                self.extractheli notify("ready_to_leave");
            }
            if (isdefined(self.enemyheli)) {
                self.enemyheli thread [[ self.helidata.flyaway ]]();
                heliflyaway = 1;
            }
            return;
        }
        curdist = distancesquared(self.vehicle.payload.origin, self.end.origin);
        if (curdist <= sqdist) {
            break;
        }
        if (isdefined(self.enemyheli) && !heliflyaway && distancesquared(self.vehicle.origin, self.end.origin) <= 20250000) {
            self.enemyheli thread [[ self.helidata.flyaway ]]();
            heliflyaway = 1;
        }
        if (!var_23cd6d769cd06450 && curdist <= 400000000) {
            players = getteamdata(self.vehicle.var_a21a9516d1dede9e, "players");
            if (isdefined(players) && players.size) {
                self.extractheli = players[0] namespace_b1af0fcaf4ad16d6::function_5a081e065a93bd08(self.end.origin, (0, 0, 80), 1);
            }
            var_23cd6d769cd06450 = 1;
            thread function_2171d1c800d2fcc();
        }
        if (var_23cd6d769cd06450 && curdist <= 36000000 && !var_76eedae3beeb3cd6) {
            var_76eedae3beeb3cd6 = 1;
            nearby_zombies = getaiarrayinradius(self.end.origin, 750, "team_two_hundred");
            if (nearby_zombies.size < 10) {
                function_1281c7fff9456e18("vehicle_drive_extractinbound_lowdanger");
            } else {
                function_1281c7fff9456e18("vehicle_drive_extractinbound");
            }
        }
        if (curdist <= 2250000) {
            self notify("players_nearing_destination");
        }
    }
    self.vehicle.payload notsolid();
    waitframe();
    self.vehicle.payload unlink();
    self.vehicle.payload linkto(self.extractheli.crate, "tag_origin", (0, 0, -110), (0, 0, 0));
    self.payloaddelivered = 1;
    self notify("payload_delivered");
    self.extractheli.readytoleave = 1;
    self.extractheli notify("ready_to_leave");
    self.extractheli.crate playsoundonmovingent("mp_dmz_cargo_delivery_hook");
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308e
// Size: 0xba
function function_29c112cff2b3d3b() {
    if (isdefined(self.vehicle)) {
        if (isdefined(self.vehicle.attractor)) {
            remove_attractor(self.vehicle.attractor);
        }
        if (isdefined(self.vehicle.attractor_slots)) {
            foreach (slot in self.vehicle.attractor_slots) {
                if (isdefined(slot)) {
                    slot delete();
                }
            }
        }
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3150
// Size: 0x75
function function_fcbb7fe348451251() {
    self.var_b494362af9b72fd3 = function_36a95c9de2ace25a("ob_vehicle_drive_marker", 0, 1);
    scripts\mp\objidpoolmanager::update_objective_position(self.var_b494362af9b72fd3, self.start.origin + (0, 0, 60));
    namespace_c669075cf56436f4::function_6f02ac608d44fdbf(self.var_b494362af9b72fd3, 0, 1);
    self waittill("activity_ended");
    namespace_c669075cf56436f4::function_765b706dc170e214(self.var_b494362af9b72fd3);
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x31cd
// Size: 0x170
function function_c37023c94938fcdb(var_1bd1cc823b281c6e, objectivemarkerid) {
    generalsettings = var_1bd1cc823b281c6e.generalsettings;
    minimapsettings = var_1bd1cc823b281c6e.minimapsettings;
    var_4b16eeed74027f36 = var_1bd1cc823b281c6e.var_4b16eeed74027f36;
    compasssettings = var_1bd1cc823b281c6e.compasssettings;
    hudsettings = var_1bd1cc823b281c6e.hudsettings;
    objective_icon(objectivemarkerid, generalsettings.var_63d1b5b543ef6387);
    objective_state(objectivemarkerid, generalsettings.state);
    function_5fd2627c5ce186db(objectivemarkerid, generalsettings.isoptional);
    objective_setownerteam(objectivemarkerid, generalsettings.ownerteam);
    if (isdefined(generalsettings.var_670c323f7450e31c)) {
        var_670c323f7450e31c = (0, 0, 0);
        var_22fcb4a5ea0d8ffd = generalsettings.var_670c323f7450e31c;
        var_a1308c95bb637c66 = strtok(var_22fcb4a5ea0d8ffd, " ");
        if (var_a1308c95bb637c66.size == 4) {
            var_670c323f7450e31c = (float(var_a1308c95bb637c66[0]) * 255, float(var_a1308c95bb637c66[1]) * 255, float(var_a1308c95bb637c66[2]) * 255);
        }
        function_11cbcb8303075da(objectivemarkerid, int(var_670c323f7450e31c[0]), int(var_670c323f7450e31c[1]), int(var_670c323f7450e31c[2]));
    }
}

// Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3345
// Size: 0x63
function function_8abb1c0b2f4039fa(var_27e49251bb3376ea, shouldping) {
    wait 2.4;
    thread function_fcbb7fe348451251();
    if (isdefined(var_27e49251bb3376ea) && istrue(shouldping)) {
        wait 2;
        var_27e49251bb3376ea scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout(11, self.start.origin + (0, 0, 60), self.var_b494362af9b72fd3);
    }
}

/#

    // Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x33b0
    // Size: 0x16
    function function_cb0d87f458c74334() {
        return getstructarray("<dev string:x98>", "<dev string:xaf>");
    }

    // Namespace namespace_7b4c61760c2a90db / namespace_32479521133923de
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x33ce
    // Size: 0x174
    function debug_spawnvehicle() {
        while (true) {
            if (getdvarint(@"hash_361e499f400fee2a", 0)) {
                setdvar(@"hash_361e499f400fee2a", 0);
                node = spawnstruct();
                node.origin = level.players[0].origin + anglestoforward(level.players[0].angles) * 500 + (0, 0, 200);
                node.angles = level.players[0].angles;
                namespace_168c086126cfa488::function_cecaa2fcd2694301(node);
            }
            if (getdvarint(@"hash_e04153469eda5d1d", 0)) {
                setdvar(@"hash_e04153469eda5d1d", 0);
                node = spawnstruct();
                node.origin = level.players[0].origin + anglestoforward(level.players[0].angles) * 500 + (0, 0, 200);
                node.angles = level.players[0].angles;
                node namespace_b1af0fcaf4ad16d6::function_5a081e065a93bd08(node.origin, (0, 0, 20));
            }
            wait 1;
        }
    }

#/
