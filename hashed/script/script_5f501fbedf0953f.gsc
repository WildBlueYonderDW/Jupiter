// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using script_3ab210ea917601e7;
#using script_220d0eb95a8fab7d;
#using script_5753ba9c28794a65;
#using scripts\engine\scriptable.gsc;
#using script_5d8202968463a21d;
#using script_4c770a9a4ad7659c;
#using script_7956d56c4922bd1;
#using script_185660037b9236c1;
#using scripts\mp\utility\player.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\common\vehicle_aianim.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\common\vehicle_paths.gsc;
#using scripts\mp\mp_agent.gsc;

#namespace namespace_acac8960cc6d8d64;

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f6
// Size: 0x21e
function function_21672171040d6aae() {
    var_45c17c8bd7095cc4 = namespace_c8e2077fca5ac679::function_b9c4aa88ad97ee68(self);
    self.var_3fe5574cd4504d62 = [];
    self.var_70b5f128bfa2986e = [];
    self.var_9009411bf4edf20b = [];
    self.var_d9a91303aea799de = undefined;
    self.s_center = getstruct(self.var_626b45032e1892da, "targetname");
    self.var_d9a91303aea799de = function_b71aa24dbd5946e1();
    /#
        assertex(isdefined(self.var_d9a91303aea799de), "Could not find a convoy spline start node");
    #/
    function_e6b1206e1d6c42a3(var_45c17c8bd7095cc4);
    if (!isdefined(self.s_center)) {
        /#
            assertmsg("Armored Convoy - could not find a struct with targetname " + self.var_626b45032e1892da + ", bailing out");
        #/
        return;
    }
    self.var_7f5ba3a22b83fd6c = "sg_" + self.var_626b45032e1892da;
    if (!isdefined(function_dbc2d928c8e424d9(self.var_7f5ba3a22b83fd6c))) {
        function_ff39fd6d3d8e4d65(self.var_7f5ba3a22b83fd6c);
    }
    /#
        iprintln("vehicle_down" + self.var_626b45032e1892da);
    #/
    namespace_d886885225a713a7::function_3e33031646de23b0(self);
    var_f5cf1bbc195a61ab = undefined;
    self.var_55ee9d0a3adac4b9 = 0;
    self.var_802faecbf11b260c = 0;
    self.var_4e0002675594e13f = [];
    self.var_269a59bcee49ce1 = self.defaultspeed;
    function_2dac62aa2032b9b1("SpatialZoneContainerGroup_ActivityInstance_AwarenessZone", &function_586d9c599add1552);
    self.var_4e0002675594e13f = function_181fd18526171d6b(var_f5cf1bbc195a61ab);
    self.var_3fe5574cd4504d62 = array_combine(self.var_3fe5574cd4504d62, self.var_4e0002675594e13f);
    self.var_55ee9d0a3adac4b9 = self.var_3fe5574cd4504d62.size;
    self.var_4e0002675594e13f = array_sort_by_script_index(self.var_4e0002675594e13f);
    foreach (var_2b15ca08e0fc7b0 in self.var_4e0002675594e13f) {
        var_2b15ca08e0fc7b0 thread function_f0f07d0530132d6b(self);
    }
    thread armored_convoy_vehicle_update_spacing();
    namespace_68dc261109a9503f::function_b6fc2c96b463c007(self);
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1b
// Size: 0x324
function function_e6b1206e1d6c42a3(var_28af8e747331e08d) {
    if (issharedfuncdefined("armored_convoy_activity", "CustomParseParams")) {
        function_f3bb4f4911a1beb2("armored_convoy_activity", "CustomParseParams", var_28af8e747331e08d);
    }
    self.var_152b8f126af5871d = function_53c4c53197386572(var_28af8e747331e08d.var_536a9f2a20a58592, "team_hundred_ninety");
    self.var_a88f463a398aac97 = function_53c4c53197386572(var_28af8e747331e08d.var_a88f463a398aac97, 12);
    self.var_75de3484c8881f00 = function_53c4c53197386572(var_28af8e747331e08d.var_75de3484c8881f00, 16);
    self.highSpeed = function_53c4c53197386572(var_28af8e747331e08d.highSpeed, 25);
    self.var_fd39c5fc94cbe2de = function_53c4c53197386572(var_28af8e747331e08d.var_fd39c5fc94cbe2de, 35);
    self.var_66ddec9f303229cc = function_53c4c53197386572(var_28af8e747331e08d.var_66ddec9f303229cc, "ob_jup_items_activity_armoredconvoy_green");
    self.var_21873f8a5b64ae45 = function_53c4c53197386572(var_28af8e747331e08d.var_21873f8a5b64ae45, "ob_jup_items_activity_armoredconvoy_yellow");
    self.var_cb2499e4e9d175a2 = function_53c4c53197386572(var_28af8e747331e08d.var_cb2499e4e9d175a2, "ob_loot_cache_convoy_01");
    self.var_e63f28f54dc0a813 = istrue(var_28af8e747331e08d.var_e63f28f54dc0a813);
    self.var_4f77d28d75ebd61c = var_28af8e747331e08d.var_4f77d28d75ebd61c;
    self.var_5b51d831ec08f404 = 0;
    if (issharedfuncdefined("armored_convoy_activity", "GetMaxVehicles")) {
        self.var_5b51d831ec08f404 = function_f3bb4f4911a1beb2("armored_convoy_activity", "GetMaxVehicles");
    }
    if (isdefined(var_28af8e747331e08d)) {
        switch (var_28af8e747331e08d.defaultspeed) {
        case #"hash_3019364f12fc7058":
            self.defaultspeed = self.var_a88f463a398aac97;
            break;
        case #"hash_17bcce6c9cdcaab9":
            self.defaultspeed = self.var_75de3484c8881f00;
            break;
        case #"hash_4fda5219ac1d2d5d":
            self.defaultspeed = self.highSpeed;
            break;
        default:
            self.defaultspeed = self.var_a88f463a398aac97;
            break;
        }
        self.var_a5aa6c6f1908df45 = [];
        for (i = 0; i < self.var_5b51d831ec08f404; i++) {
            var_4f2425b7983137b0 = "ai_encounter:armored_convoy_rider_enc_soldier";
            if (issharedfuncdefined("armored_convoy_activity", "GetRiderEncounterFromIndex")) {
                var_4f2425b7983137b0 = function_f3bb4f4911a1beb2("armored_convoy_activity", "GetRiderEncounterFromIndex", i);
            }
            vehicleRef = "veh_jup_pickup_2014";
            if (issharedfuncdefined("armored_convoy_activity", "GetVehicleRefFromIndex")) {
                vehicleRef = function_f3bb4f4911a1beb2("armored_convoy_activity", "GetVehicleRefFromIndex", i);
            }
            self.var_a5aa6c6f1908df45[i] = spawnstruct();
            self.var_a5aa6c6f1908df45[i].var_4f2425b7983137b0 = var_4f2425b7983137b0;
            self.var_a5aa6c6f1908df45[i].vehicleRef = vehicleRef;
        }
        if (self.var_a5aa6c6f1908df45.size > 0) {
            self.var_5b51d831ec08f404 = self.var_a5aa6c6f1908df45.size;
        }
    } else {
        self.defaultspeed = self.var_a88f463a398aac97;
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf46
// Size: 0x1b
function function_c4da40d7e3056ed6() {
    thread function_e9c3e6397f1be2c4();
    thread function_aaf6792b4f3ff726();
    thread function_130f27dbf7b9d56b();
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf68
// Size: 0x87
function function_1f2529d9fe2f4432() {
    foreach (var_aa2e9d0ffa461472 in self.var_1c1e93b32ed347a7) {
        if (isdefined(function_9a39e23c3c52c2af(var_aa2e9d0ffa461472.var_542f8d001288419d))) {
            function_adcc96a7d541aa36(var_aa2e9d0ffa461472.var_542f8d001288419d, 1);
        }
    }
    thread namespace_34bf641998024ddb::function_a26e39e03a0d6739();
    thread function_ee03881506b0073d();
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff6
// Size: 0xc9
function function_ee03881506b0073d() {
    if (isdefined(self.var_9009411bf4edf20b)) {
        foreach (var_f1b5986844dc9bbe in self.var_9009411bf4edf20b) {
            var_f1b5986844dc9bbe thread function_c7ac73247f7cda();
        }
    }
    if (isdefined(self.var_3fe5574cd4504d62)) {
        foreach (vehicle in self.var_3fe5574cd4504d62) {
            vehicle thread function_4df7515bfada9f28();
        }
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10c6
// Size: 0x4b
function private function_c7ac73247f7cda() {
    self notify("armored_convoy_crate_cleanup_singleton");
    self endon("armored_convoy_crate_cleanup_singleton");
    while (isdefined(self)) {
        players = namespace_7e17181d03156026::getplayersinradius(self.origin, 6000);
        if (players.size == 0) {
            self freescriptable();
            break;
        }
        wait(30);
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1118
// Size: 0x59
function private function_4df7515bfada9f28() {
    self notify("armored_convoy_vehicle_cleanup_singleton");
    self endon("armored_convoy_vehicle_cleanup_singleton");
    self endon("death");
    self endon("entitydeleted");
    while (isdefined(self)) {
        players = namespace_7e17181d03156026::getplayersinradius(self.origin, 6000);
        if (players.size == 0) {
            self delete();
            break;
        }
        wait(30);
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1178
// Size: 0x77
function function_5b846516c4a7f320() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    centerpoint = undefined;
    if (isdefined(self.var_3fe5574cd4504d62) && self.var_3fe5574cd4504d62.size > 0) {
        vehicle = self.var_3fe5574cd4504d62[0];
        if (isdefined(vehicle) && isalive(vehicle)) {
            centerpoint = self.var_3fe5574cd4504d62[0].origin;
        }
    }
    return centerpoint;
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f7
// Size: 0x175
function function_130f27dbf7b9d56b() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    ai_array = self.var_70b5f128bfa2986e;
    while (1) {
        ai_array = array_removedead_or_dying(ai_array);
        if (ai_array.size <= 3) {
            break;
        }
        wait(1);
    }
    foreach (veh in self.var_3fe5574cd4504d62) {
        params = spawnstruct();
        params.var_2f5d509d7b71ce9a = self;
        params.players = self.var_6c29f2fdb0054bbe;
        veh callback::callback("veh_on_convoy_ended", params);
    }
    var_411b413335aa6535 = function_fdc9d5557c53078e(self.var_3fe5574cd4504d62);
    if (isdefined(var_411b413335aa6535) && var_411b413335aa6535.size > 0) {
        if (issharedfuncdefined("armored_convoy_activity", "PlayVehDestroyedVO")) {
            function_f3bb4f4911a1beb2("armored_convoy_activity", "PlayVehDestroyedVO", self, 1);
        } else {
            thread namespace_277c27ef297ef569::function_1281c7fff9456e18("activity_armored_convoy_vehicles_remain_broadcast");
        }
    } else if (issharedfuncdefined("armored_convoy_activity", "PlayVehDestroyedVO")) {
        function_f3bb4f4911a1beb2("armored_convoy_activity", "PlayVehDestroyedVO", self);
    } else {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("activity_armored_convoy_vehicles_destroyed_broadcast");
    }
    waitframe();
    namespace_68dc261109a9503f::function_612d18fdbc979c0b(self, 1);
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1373
// Size: 0x1a1
function private function_aaf6792b4f3ff726() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self endon("under_attack");
    self endon("vehicle_down");
    self endon("player_spotted");
    self endon("armored_convoy_stuck");
    while (!istrue(self.var_de6f66d8d51587f1)) {
        array = self.var_3fe5574cd4504d62;
        foreach (member in array) {
            if (isdefined(member)) {
                players = namespace_7e17181d03156026::getplayersinradius(member.origin, 1500);
                if (players.size > 0) {
                    foreach (player in players) {
                        if (!player.notarget) {
                            b_trace_passed = namespace_2a184fc4902783dc::ray_trace_passed(player geteye(), member.origin + (0, 0, 30), [0:player, 1:member]);
                            if (b_trace_passed == 1) {
                                if (issharedfuncdefined("armored_convoy_activity", "PlayEngageVO")) {
                                    function_f3bb4f4911a1beb2("armored_convoy_activity", "PlayEngageVO", self, 1);
                                } else {
                                    thread namespace_277c27ef297ef569::function_1281c7fff9456e18("activity_armored_convoy_engage_enemy_broadcast");
                                }
                                self notify("player_spotted");
                                break;
                            }
                        }
                    }
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x151b
// Size: 0x1d0
function private function_233138b73388d497() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self endon("under_attack");
    self endon("vehicle_down");
    self endon("player_spotted");
    self endon("armored_convoy_stuck");
    while (!istrue(self.var_de6f66d8d51587f1)) {
        foreach (vehicle in self.var_3fe5574cd4504d62) {
            if (isdefined(vehicle)) {
                if (!isdefined(vehicle.lastposition)) {
                    vehicle.lastposition = vehicle.origin;
                    vehicle.stucktime = 0;
                } else {
                    var_5c665308435be945 = vehicle.lastposition - vehicle.origin;
                    difference = length2d(var_5c665308435be945);
                    if (difference < 1) {
                        vehicle.stucktime = vehicle.stucktime + 0.05;
                    } else {
                        vehicle.stucktime = 0;
                    }
                    /#
                        var_2c40e29836434cbe = getdvarint(@"hash_67411f60c7ab4996", 0) > 0;
                        if (var_2c40e29836434cbe && vehicle.stucktime > 0) {
                            print3d(vehicle getcentroid() + (0, 0, 100), "Error - Unsupported Vehicle Ref: " + vehicle.stucktime, (1, 1, 0), 1, 1, 1, 0);
                        }
                    #/
                    if (vehicle.stucktime > 8) {
                        self notify("armored_convoy_stuck");
                    }
                    vehicle.lastposition = vehicle.origin;
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16f2
// Size: 0xbf
function private function_e9c3e6397f1be2c4() {
    waittill_any_4("vehicle_down", "player_spotted", "under_attack", "armored_convoy_stuck");
    a_vehicles = self.var_3fe5574cd4504d62;
    self.var_de6f66d8d51587f1 = 1;
    foreach (vehicle in a_vehicles) {
        if (!istrue(vehicle.var_1c8191fe69482997)) {
            vehicle notify("engage");
            vehicle thread function_9cdfbab7600978aa(self);
        }
        n_wait = randomfloatrange(0.5, 1.1);
        wait(n_wait);
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17b8
// Size: 0x123
function private function_73ebd648f533a034(var_e6013eac45290cab) {
    self function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(0));
    self vehicle_setspeedimmediate(0, 1, 1);
    self vehicle_cleardrivingstate();
    if (self function_1e8542a707a8002("p2p")) {
        self function_6a325f91941ed47c("p2p");
    }
    if (self function_1e8542a707a8002("path")) {
        self function_6a325f91941ed47c("path");
    }
    if (self function_1e8542a707a8002("animator")) {
        self function_6a325f91941ed47c("animator");
    }
    self function_65aa053c077c003a(1);
    waitframe();
    function_6590c1e6e798dd19();
    self waittill("unloaded");
    self.var_aa4804cc1bc59e93 = undefined;
    self.var_1c8191fe69482997 = 1;
    namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(self, "neutral");
    self setscriptablepartstate("single", "vehicle_use");
    self function_9cab25983e27246();
    self function_65aa053c077c003a(0);
    if (istrue(var_e6013eac45290cab.var_e63f28f54dc0a813)) {
        function_2169641d6a403864(self.var_542f8d001288419d);
        function_adcc96a7d541aa36(self.var_542f8d001288419d, 0);
    }
    var_e6013eac45290cab.var_21f1863c6d44d936[self.var_542f8d001288419d] = undefined;
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18e2
// Size: 0x169
function private function_9cdfbab7600978aa(var_e6013eac45290cab) {
    crash_speed = self vehicle_getspeed();
    var_a2f66384003c0a2d = randomfloatrange(150, 225);
    var_db10d04161fa51e4 = randomfloatrange(15, 30);
    var_1c62d0e257e145bc = ter_op(cointoss(), -1 * var_db10d04161fa51e4, var_db10d04161fa51e4);
    var_f6189601c0d7c456 = (var_a2f66384003c0a2d, 0, 0);
    var_c04b96ca79816f15 = self.angles + (0, var_1c62d0e257e145bc, 0);
    var_177288c8ce36d9e5 = self.origin + rotatevector(var_f6189601c0d7c456, var_c04b96ca79816f15);
    var_177288c8ce36d9e5 = getgroundposition(var_177288c8ce36d9e5, 128);
    self notify("path_updated");
    self stoppath();
    self function_6a325f91941ed47c("path");
    waitframe();
    self function_77320e794d35465a("p2p", "throttleSpeedFarBelow", 1);
    self function_77320e794d35465a("p2p", "throttleSpeedFarAbove", 4);
    self function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(crash_speed));
    self function_77320e794d35465a("p2p", "goalPoint", var_177288c8ce36d9e5);
    self function_77320e794d35465a("p2p", "goalThreshold", 50);
    self function_77320e794d35465a("p2p", "brakeAtGoal", 1);
    waittill_any_timeout_3(2, "goal", "near_goal", "path_blocked");
    function_73ebd648f533a034(var_e6013eac45290cab);
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a52
// Size: 0x54b
function function_181fd18526171d6b(var_cffe525bfe66cdca, var_59d52445d26e52ea) {
    vehiclearray = [];
    var_c002553dc300019 = self.var_5b51d831ec08f404;
    spawndata = spawnstruct();
    spawndata.angles = self.var_d9a91303aea799de.angles;
    spawndata.team = self.var_152b8f126af5871d;
    spawndata.var_f16652e1462a3739 = 1;
    spawndata.var_22aa4aa0cf0aa6bb = 1;
    var_6bd96c159ce40893 = vectornormalize(anglestoforward(self.var_d9a91303aea799de.angles) * (1, 1, 0));
    var_664c124b2a280ddc = 640;
    var_67c9742ae410b71c = [0:"veh_jup_pickup_2014"];
    self.var_bd437e647db702f9 = function_53c4c53197386572(var_59d52445d26e52ea, random(var_67c9742ae410b71c));
    self.var_1c1e93b32ed347a7 = [];
    for (index = 0; index < var_c002553dc300019; index++) {
        var_26e8177cafb3f245 = randomfloatrange(10, 35);
        var_92ffab909b4632c6 = var_664c124b2a280ddc + var_26e8177cafb3f245;
        spawndata.origin = self.var_d9a91303aea799de.origin - var_6bd96c159ce40893 * (index + 1) * var_92ffab909b4632c6 + (0, 0, 100);
        vehicle = undefined;
        self.var_1c1e93b32ed347a7[index] = spawnstruct();
        vehicle = vehicle_spawn(self.var_a5aa6c6f1908df45[index].vehicleRef, spawndata);
        /#
            assertex(isdefined(vehicle), "Did not spawn a valid vehicle!");
        #/
        vehicle.riders = [];
        vehicle.unloadque = [];
        vehicle.unload_group = "all";
        switch (self.var_a5aa6c6f1908df45[index].vehicleRef) {
        case #"hash_d63b8f48fb92540d":
            classname_mp = "script_vehicle_veh9_jltv_mg_ai";
            var_38f563e00311ee1b = "veh9_jltv";
            break;
        case #"hash_d212f4961f28eb58":
            classname_mp = "script_vehicle_veh9_jltv_mg_ai";
            var_38f563e00311ee1b = "veh9_jltv";
            break;
        case #"hash_885f51af68244d3":
            classname_mp = "script_vehicle_veh_jup_suv_1996";
            var_38f563e00311ee1b = "suv_1996";
            break;
        case #"hash_cb367b51338c9d6":
            classname_mp = "script_vehicle_veh9_techo_rebel_armor_ai";
            var_38f563e00311ee1b = "veh9_tech_armor_pickup";
            break;
        case #"hash_c9d9aa17e7c175a5":
            classname_mp = "script_vehicle_veh_jup_pickup_2014";
            var_38f563e00311ee1b = "fullsized_pickup_2014";
            break;
        default:
            /#
                assertmsg("Error - Unsupported Vehicle Ref: " + self.var_a5aa6c6f1908df45[index].vehicleRef);
            #/
            break;
        }
        vehicle.classname_mp = classname_mp;
        vehicle.vehicleanimalias = var_38f563e00311ee1b;
        vehicle ent_flag_init("armored_convoy_spawned");
        vehicle setscriptablepartstate("single", "vehicle_unusable");
        vehicle namespace_4ff41449ab14a3a0::handle_attached_guys();
        function_1f7a69bd7ab10e0(self, self.var_1c1e93b32ed347a7[index], spawndata.origin, index, vehicle);
        /#
            assertex(self.var_1c1e93b32ed347a7[index].var_656d7611b22ce21.size > 0, "Did not spawn any AI");
        #/
        vehicledata = function_29b4292c92443328(self.var_a5aa6c6f1908df45[index].vehicleRef);
        if (self.var_1c1e93b32ed347a7[index].var_656d7611b22ce21.size > vehicledata.var_f4eae2a1481b7dd3.size) {
            errormsg = "Error - AI encounter " + self.var_a5aa6c6f1908df45[index].var_4f2425b7983137b0;
            errormsg = errormsg + " spawned " + self.var_1c1e93b32ed347a7[index].var_656d7611b22ce21.size;
            errormsg = errormsg + " riders, but vehicle " + self.var_a5aa6c6f1908df45[index].vehicleRef;
            errormsg = errormsg + " has only " + vehicledata.var_f4eae2a1481b7dd3.size + " seats!";
            /#
                assertmsg(errormsg);
            #/
        }
        vehicle.script_index = index;
        vehicle.var_4bf69deb94b39f24 = 0;
        vehicle.var_aa4804cc1bc59e93 = 1;
        if (istrue(self.var_4f77d28d75ebd61c)) {
            vehicle.var_408e9e761c8463c5 = 1;
        }
        vehicle.var_1c8191fe69482997 = 0;
        namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(vehicle, "team_hundred_ninety");
        if (issharedfuncdefined("armored_convoy_activity", "SpawnLootCache")) {
            vehicle.var_36b81911e31bb387 = function_f3bb4f4911a1beb2("armored_convoy_activity", "SpawnLootCache", vehicle);
        }
        vehicle function_df8142211bdf35cf();
        vehicle thread function_50c2476a67740c1e(self);
        vehicle thread function_803602cd4c0c0edd(self);
        vehicle thread function_9f8f728b60e7418c(self);
        thread function_f0675d4a690011d6(vehicle);
        vehiclearray = array_add(vehiclearray, vehicle);
        waitframe();
    }
    if (issharedfuncdefined("ob_quest_missions", "onConvoyActive")) {
        [[ getsharedfunc("ob_quest_missions", "onConvoyActive") ]](self);
    }
    return vehiclearray;
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fa5
// Size: 0x15a
function function_b71aa24dbd5946e1() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    var_943cc5715729091c = self.s_center namespace_cd0b2d039510b38d::get_linked_vehicle_nodes();
    var_943cc5715729091c = array_randomize(var_943cc5715729091c);
    foreach (startnode in var_943cc5715729091c) {
        player = getclosest(startnode.origin, level.players, 1500);
        if (isdefined(player)) {
            continue;
        }
        players = namespace_7e17181d03156026::getplayersinradius(startnode.origin, 3000);
        if (players.size == 0) {
            return startnode;
        } else {
            foreach (player in players) {
                b_trace_passed = namespace_2a184fc4902783dc::ray_trace_passed(player geteye(), startnode.origin + (0, 0, 30), [0:player]);
                if (b_trace_passed == 0) {
                    return startnode;
                }
            }
        }
    }
    return random(var_943cc5715729091c);
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2107
// Size: 0x84
function function_9f8f728b60e7418c(var_e6013eac45290cab) {
    var_e6013eac45290cab endon("activity_ended");
    var_e6013eac45290cab endon("instance_destroyed");
    self endon("death");
    self endon("entitydeleted");
    self endon("unloaded");
    while (!isdefined(self.driver)) {
        /#
            iprintln("armored_convoy_spawned");
        #/
        waitframe();
    }
    msg = waittill_any_ents_return(self.driver, "death", self, "damage_heavy");
    self notify("leavepath_unload");
    thread function_1e9c7b94e0a76915(var_e6013eac45290cab);
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2192
// Size: 0x1f0
function function_50c2476a67740c1e(var_e6013eac45290cab) {
    var_e6013eac45290cab endon("activity_ended");
    var_e6013eac45290cab endon("instance_destroyed");
    self endon("death");
    self endon("entitydeleted");
    self endon("leavepath_unload");
    self endon("engage");
    var_6c932832156cd885 = [];
    n_distance = 16000000;
    while (!istrue(var_e6013eac45290cab.var_de6f66d8d51587f1)) {
        if (istrue(self.isdestroyed)) {
            return;
        }
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = amount = self waittill("damage");
        var_f97f93d8023b0981 = namespace_5a0f3ca265d3a4c8::vehicle_damage_getstate();
        if (isdefined(attacker) && isplayer(attacker) && distancesquared(self.origin, attacker.origin) <= n_distance) {
            var_e6013eac45290cab notify("under_attack");
            if (issharedfuncdefined("armored_convoy_activity", "PlayEngageVO")) {
                function_f3bb4f4911a1beb2("armored_convoy_activity", "PlayEngageVO", var_e6013eac45290cab);
            } else {
                var_e6013eac45290cab thread namespace_277c27ef297ef569::function_1281c7fff9456e18("activity_armored_convoy_engage_player_broadcast");
            }
            break;
        }
        if (isdefined(var_f97f93d8023b0981) && var_f97f93d8023b0981 == "heavy") {
            self notify("damage_heavy");
            if (issharedfuncdefined("armored_convoy_activity", "PlayEngageVO")) {
                function_f3bb4f4911a1beb2("armored_convoy_activity", "PlayEngageVO", var_e6013eac45290cab);
            } else {
                var_e6013eac45290cab thread namespace_277c27ef297ef569::function_1281c7fff9456e18("activity_armored_convoy_engage_player_broadcast");
            }
            break;
        }
        waitframe();
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2389
// Size: 0x37
function function_803602cd4c0c0edd(var_e6013eac45290cab) {
    self endon("entitydeleted");
    self waittill("death");
    earthquake(0.5, 1, self.origin, 1500);
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c7
// Size: 0xfd
function function_6590c1e6e798dd19() {
    foreach (rider in self.riders) {
        if (!is_dead_or_dying(rider)) {
            turret = rider getturret();
            if (isdefined(turret)) {
                if (flag("stealth_enabled") && isdefined(rider.stealth) && istrue(rider.stealth_enabled)) {
                    rider setstealthstate("combat");
                }
            } else {
                rider thread function_264e36ce6f3574f7(self.origin);
                thread namespace_4ff41449ab14a3a0::guy_unload(rider, rider.vehicle_position);
            }
            n_wait = randomfloatrange(0.2, 0.3);
            wait(n_wait);
        }
    }
    wait(1);
    self notify("unloaded");
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24cb
// Size: 0x2b7
function function_1e9c7b94e0a76915(var_e6013eac45290cab) {
    var_e6013eac45290cab endon("activity_ended");
    var_e6013eac45290cab endon("instance_destroyed");
    self endon("death");
    self endon("entitydeleted");
    self endon("unloaded");
    var_ae3861d2a0ef3c19 = 0;
    if (isdefined(self.script_index) && self.script_index == var_e6013eac45290cab.var_4e0002675594e13f.size - 1) {
        var_ae3861d2a0ef3c19 = 1;
    }
    if (var_e6013eac45290cab.var_269a59bcee49ce1 == var_e6013eac45290cab.var_75de3484c8881f00) {
        crash_speed = var_e6013eac45290cab.highSpeed;
        var_a2f66384003c0a2d = 512;
    } else if (var_e6013eac45290cab.var_269a59bcee49ce1 == var_e6013eac45290cab.highSpeed) {
        crash_speed = var_e6013eac45290cab.var_fd39c5fc94cbe2de;
        var_a2f66384003c0a2d = 768;
    } else {
        crash_speed = var_e6013eac45290cab.var_75de3484c8881f00;
        var_a2f66384003c0a2d = 384;
    }
    /#
        iprintln("gasToStopMovement");
    #/
    var_db10d04161fa51e4 = randomfloatrange(25, 35);
    var_1c62d0e257e145bc = ter_op(cointoss(), -1 * var_db10d04161fa51e4, var_db10d04161fa51e4);
    var_f6189601c0d7c456 = (var_a2f66384003c0a2d, 0, 0);
    var_c04b96ca79816f15 = self.angles + (0, var_1c62d0e257e145bc, 0);
    var_177288c8ce36d9e5 = self.origin + rotatevector(var_f6189601c0d7c456, var_c04b96ca79816f15);
    var_177288c8ce36d9e5 = getgroundposition(var_177288c8ce36d9e5, 128);
    self notify("path_updated");
    self stoppath();
    self function_6a325f91941ed47c("path");
    waitframe();
    self function_77320e794d35465a("p2p", "throttleSpeedFarBelow", 2);
    self function_77320e794d35465a("p2p", "throttleSpeedFarAbove", 8);
    self function_77320e794d35465a("p2p", "automaticFast", 1);
    self function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(crash_speed));
    self function_77320e794d35465a("p2p", "goalPoint", var_177288c8ce36d9e5);
    self function_77320e794d35465a("p2p", "goalThreshold", 50);
    self function_77320e794d35465a("p2p", "brakeAtGoal", 1);
    waittill_any_timeout_3(5, "goal", "near_goal", "path_blocked");
    self function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(0));
    waitframe();
    var_e6013eac45290cab notify("vehicle_down");
    function_6590c1e6e798dd19();
    namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(self, "neutral");
    if (istrue(var_e6013eac45290cab.var_e63f28f54dc0a813)) {
        function_2169641d6a403864(self.var_542f8d001288419d);
        function_adcc96a7d541aa36(self.var_542f8d001288419d, 1);
    }
    var_e6013eac45290cab.var_21f1863c6d44d936[self.var_542f8d001288419d] = undefined;
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2789
// Size: 0x5c
function function_264e36ce6f3574f7(vehicle_origin) {
    self endon("death");
    self waittill("unload");
    if (flag("stealth_enabled") && isdefined(self.stealth) && istrue(self.stealth_enabled)) {
        self setstealthstate("combat");
    }
    self setgoalpos(vehicle_origin, 750);
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27ec
// Size: 0x1ea
function function_df8142211bdf35cf(var_5f487a4ba2d7c5a, var_b0246e4215beae7f, var_784030f0b32d0f1d) {
    var_5f487a4ba2d7c5a = ter_op(isdefined(var_5f487a4ba2d7c5a), var_5f487a4ba2d7c5a, 1);
    var_b0246e4215beae7f = ter_op(isdefined(var_b0246e4215beae7f), var_b0246e4215beae7f, 1);
    var_784030f0b32d0f1d = ter_op(isdefined(var_784030f0b32d0f1d), var_784030f0b32d0f1d, 0);
    if (var_5f487a4ba2d7c5a) {
        if (!self function_1e8542a707a8002("p2p")) {
            self function_d2e41c7603ba7697("p2p");
        }
    }
    if (var_b0246e4215beae7f) {
        if (!self function_1e8542a707a8002("path")) {
            self function_d2e41c7603ba7697("path");
        }
    }
    if (var_784030f0b32d0f1d) {
        if (!self function_1e8542a707a8002("animator")) {
            self function_d2e41c7603ba7697("animator");
        }
    }
    if (self function_1e8542a707a8002("p2p")) {
        self function_77320e794d35465a("p2p", "checkStuck", 0);
        self function_77320e794d35465a("p2p", "brakeAtGoal", 1);
        self function_77320e794d35465a("p2p", "automaticNormal", 1);
        self function_77320e794d35465a("p2p", "brakeOnGoalGasbrake", 1);
        self function_77320e794d35465a("p2p", "goalPoint", self.origin);
        self function_77320e794d35465a("p2p", "goalThreshold", 200);
        self function_77320e794d35465a("p2p", "throttleSpeedClose", 1);
        self function_77320e794d35465a("p2p", "throttleSpeedThreshold", 1);
        self function_77320e794d35465a("p2p", "automaticFastTopspeedFraction", 1);
        self function_77320e794d35465a("p2p", "throttleSpeedFarBelow", 1);
        self function_77320e794d35465a("p2p", "throttleSpeedFarAbove", 4);
        self function_77320e794d35465a("p2p", "throttleSpeedClose", 2);
        self function_77320e794d35465a("p2p", "gasToStopMovement", 0.9);
        self function_77320e794d35465a("p2p", "steeringMultiplier", 2);
    }
    if (self function_1e8542a707a8002("path")) {
        self function_77320e794d35465a("path", "radiusToStep", 300);
    }
    self.dontunloadonend = 1;
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29dd
// Size: 0x1f7
function function_1f7a69bd7ab10e0(var_e6013eac45290cab, var_1c1e93b32ed347a7, origin, vehicleindex, vehicle) {
    /#
        assertex(vehicleindex >= 0 && vehicleindex < var_e6013eac45290cab.var_a5aa6c6f1908df45.size, "Error - Tried to spawn rider with an invalid vehicle index!");
    #/
    var_1c1e93b32ed347a7.var_542f8d001288419d = var_e6013eac45290cab function_f8ccadcd850da124(var_e6013eac45290cab.var_a5aa6c6f1908df45[vehicleindex].var_4f2425b7983137b0, origin, 128, 1, 0, 1, 2);
    vehicle.var_542f8d001288419d = var_1c1e93b32ed347a7.var_542f8d001288419d;
    function_b0a68315f80cb547(var_1c1e93b32ed347a7.var_542f8d001288419d, vehicle);
    /#
        if (isdefined(self.var_71ad773e63984917)) {
            function_d37068aac7785c04(var_1c1e93b32ed347a7.var_542f8d001288419d, self.var_71ad773e63984917, 1);
        }
    #/
    if (!isdefined(var_1c1e93b32ed347a7.var_23d7f39376f24475)) {
        var_1c1e93b32ed347a7.var_656d7611b22ce21 = [];
    }
    if (isdefined(var_1c1e93b32ed347a7.var_542f8d001288419d)) {
        var_e6013eac45290cab function_ce9c21523336cdbc(var_1c1e93b32ed347a7.var_542f8d001288419d, &function_6e72efeedb40de3b, var_1c1e93b32ed347a7);
        function_adcc96a7d541aa36(var_1c1e93b32ed347a7.var_542f8d001288419d, 0);
        data = function_9a39e23c3c52c2af(var_1c1e93b32ed347a7.var_542f8d001288419d);
        while (data.status < 4) {
            waitframe();
            data = function_9a39e23c3c52c2af(var_1c1e93b32ed347a7.var_542f8d001288419d);
        }
        foreach (agent in var_1c1e93b32ed347a7.var_656d7611b22ce21) {
            agent thread function_617a1b569134ba77(var_e6013eac45290cab);
            var_e6013eac45290cab thread function_f0675d4a690011d6(agent);
            var_e6013eac45290cab.var_70b5f128bfa2986e = array_add(var_e6013eac45290cab.var_70b5f128bfa2986e, agent);
        }
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bdb
// Size: 0x6c
function function_6e72efeedb40de3b(requestid, userdata, agent, data) {
    agent endon("death");
    if (isalive(agent)) {
        var_1c1e93b32ed347a7 = userdata;
        agent.vehiclerunexit = 1;
        var_1c1e93b32ed347a7.var_656d7611b22ce21 = array_add(var_1c1e93b32ed347a7.var_656d7611b22ce21, agent);
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2c4e
// Size: 0x8c
function private checkVehicleNormalizedPosition(var_9725f4c59af66e38) {
    level notify("checkVehicleNormalizedPosition");
    level endon("checkVehicleNormalizedPosition");
    self endon("death");
    var_ee5cb423d0aa1a6c = function_a40878ba7a8db979(var_9725f4c59af66e38);
    duration = 5000;
    while (1) {
        wait(1);
        var_aaa997376889525e = self function_2493bc9a09ce3063();
        /#
            print3d(self.origin, "Error - Unsupported Vehicle Ref: " + var_aaa997376889525e / var_ee5cb423d0aa1a6c, (1, 1, 1), 1, 1, duration, 1);
        #/
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ce1
// Size: 0x98
function function_f0f07d0530132d6b(var_e6013eac45290cab) {
    self endon("death");
    var_e6013eac45290cab endon("activity_ended");
    var_e6013eac45290cab endon("instance_destroyed");
    var_bafa08df5cbc8dbd = var_e6013eac45290cab.var_d9a91303aea799de;
    nodeindex = function_a7deee59f923760f(var_bafa08df5cbc8dbd.targetname, "targetname");
    waitframe();
    if (isdefined(self)) {
        self function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(var_e6013eac45290cab.var_269a59bcee49ce1));
        self function_77320e794d35465a("path", "radiantId", nodeindex);
        self vehicle_turnengineon();
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d80
// Size: 0xd5
function function_57cb82ad7a3ea8e4(speed, var_47377dd95777e070) {
    var_47377dd95777e070 = function_53c4c53197386572(var_47377dd95777e070, 1);
    if (var_47377dd95777e070 == 1) {
        vehicles = self.var_4e0002675594e13f;
    } else {
        vehicles = self.var_3fe5574cd4504d62;
    }
    foreach (vehicle in vehicles) {
        self.var_269a59bcee49ce1 = speed;
        if (vehicle function_1e8542a707a8002("p2p")) {
            vehicle function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(speed));
            vehicle.var_c8ede22a39f49745 = speed;
        } else {
            vehicle vehicle_setspeed(speed);
        }
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e5c
// Size: 0x663
function private armored_convoy_vehicle_update_spacing() {
    self notify("armored_convoy_vehicle_update_spacing");
    self endon("armored_convoy_vehicle_update_spacing");
    self endon("activity_ended");
    self endon("instance_destroyed");
    self endon("player_spotted");
    self endon("under_attack");
    self endon("unloaded");
    self endon("armored_convoy_stuck");
    /#
        assert(isdefined(self.var_3fe5574cd4504d62));
    #/
    /#
        assert(isdefined(self.var_4e0002675594e13f));
    #/
    /#
        assert(isdefined(self.var_269a59bcee49ce1));
    #/
    thread function_233138b73388d497();
    while (isdefined(self.var_4e0002675594e13f) && self.var_4e0002675594e13f.size > 1) {
        self.var_3fe5574cd4504d62 = array_removedead(self.var_3fe5574cd4504d62);
        self.var_4e0002675594e13f = array_removedead(self.var_4e0002675594e13f);
        var_4b1a1ec87d5ac862 = self.var_4e0002675594e13f;
        /#
            var_2c40e29836434cbe = getdvarint(@"hash_67411f60c7ab4996", 0) > 0;
            if (var_2c40e29836434cbe) {
                for (index = 0; index < var_4b1a1ec87d5ac862.size; index++) {
                    print3d(var_4b1a1ec87d5ac862[index].origin, "Error - Unsupported Vehicle Ref: " + var_4b1a1ec87d5ac862[index].veh_speed + "<unknown string>" + self.var_269a59bcee49ce1, (1, 1, 1), 1, 1, 1, 1);
                }
            }
        #/
        var_f6df7509780987e0 = isdefined(var_4b1a1ec87d5ac862[0].var_1b21155ab4273297) && var_4b1a1ec87d5ac862[0].var_1b21155ab4273297 < 2250000;
        if (self.var_269a59bcee49ce1 == 0 || var_4b1a1ec87d5ac862[0].veh_speed < self.var_269a59bcee49ce1 * 0.8 || var_f6df7509780987e0) {
            if (var_f6df7509780987e0) {
                for (index = 0; index < var_4b1a1ec87d5ac862.size; index++) {
                    if (isdefined(var_4b1a1ec87d5ac862[index].var_c8ede22a39f49745) && var_4b1a1ec87d5ac862[index].var_c8ede22a39f49745 > self.var_269a59bcee49ce1) {
                        var_4b1a1ec87d5ac862[index] function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(self.var_269a59bcee49ce1));
                        var_4b1a1ec87d5ac862[index].var_c8ede22a39f49745 = self.var_269a59bcee49ce1;
                    }
                }
            }
            waitframe();
            continue;
        }
        var_2d13391dada5876e = [];
        offsetdistance = 640;
        var_aed6fa7a3c542a21 = [];
        for (index = 0; index < var_4b1a1ec87d5ac862.size; index++) {
            if (index > 0) {
                var_9297cc7cfef5f31d = var_4b1a1ec87d5ac862[index - 1].origin;
                var_f32eb2fd73bea758 = vectornormalize(anglestoforward(var_4b1a1ec87d5ac862[index - 1].angles * (0, 1, 0)));
                var_2d13391dada5876e[var_2d13391dada5876e.size] = var_9297cc7cfef5f31d - var_f32eb2fd73bea758 * offsetdistance;
                var_9513d9c2bb98dcdc = var_4b1a1ec87d5ac862[index].origin - var_9297cc7cfef5f31d;
                var_da85e0b1ec9b0c7c = function_c1aa7c066ec92ca5(var_9513d9c2bb98dcdc, var_f32eb2fd73bea758, 0);
                var_aed6fa7a3c542a21[var_aed6fa7a3c542a21.size] = var_9297cc7cfef5f31d + var_f32eb2fd73bea758 * var_da85e0b1ec9b0c7c;
            } else {
                var_2d13391dada5876e[var_2d13391dada5876e.size] = var_4b1a1ec87d5ac862[index].origin;
                var_aed6fa7a3c542a21[var_aed6fa7a3c542a21.size] = var_4b1a1ec87d5ac862[index].origin;
            }
        }
        if (var_2d13391dada5876e.size > 1) {
            /#
                var_2c40e29836434cbe = getdvarint(@"hash_67411f60c7ab4996", 0) > 0;
                if (var_2c40e29836434cbe) {
                    for (index = 1; index < var_2d13391dada5876e.size; index++) {
                        color = (1, 0.5, 0.1);
                        line(var_4b1a1ec87d5ac862[index - 1].origin, var_2d13391dada5876e[index], color, 1, 0, 1);
                        sphere(var_2d13391dada5876e[index], 10, color, 0, 1);
                    }
                }
            #/
            for (index = 1; index < var_aed6fa7a3c542a21.size; index++) {
                var_f32eb2fd73bea758 = vectornormalize(anglestoforward(var_4b1a1ec87d5ac862[index - 1].angles * (0, 1, 0)));
                var_631c4aecaed3137c = vectornormalize(var_aed6fa7a3c542a21[index] - var_2d13391dada5876e[index]);
                var_9a295e6abb51c7b3 = function_c1aa7c066ec92ca5(var_631c4aecaed3137c, var_f32eb2fd73bea758, 0);
                var_efaa9ab3c88c72d8 = vectornormalize(anglestoforward(var_4b1a1ec87d5ac862[index].angles * (0, 1, 0)));
                var_4a6c7f0ef6a2a647 = function_c1aa7c066ec92ca5(var_efaa9ab3c88c72d8, var_f32eb2fd73bea758, 0);
                if (var_4a6c7f0ef6a2a647 > 0) {
                    if (var_9a295e6abb51c7b3 > cos(45)) {
                        newspeed = self.var_269a59bcee49ce1 * 0.9;
                        if (index > 1 && isdefined(var_4b1a1ec87d5ac862[index - 1].var_c8ede22a39f49745)) {
                            newspeed = var_4b1a1ec87d5ac862[index - 1].var_c8ede22a39f49745 * 0.9;
                        }
                        var_4b1a1ec87d5ac862[index] function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(newspeed));
                        var_4b1a1ec87d5ac862[index].var_c8ede22a39f49745 = newspeed;
                    } else if (!var_f6df7509780987e0) {
                        newspeed = self.var_269a59bcee49ce1 * 1.1;
                        var_4b1a1ec87d5ac862[index] function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(newspeed));
                        var_4b1a1ec87d5ac862[index].var_c8ede22a39f49745 = newspeed;
                    }
                } else if (!var_f6df7509780987e0) {
                    var_752bd535848b768 = distance2dsquared(var_4b1a1ec87d5ac862[index - 1].origin, var_4b1a1ec87d5ac862[index].origin);
                    if (var_752bd535848b768 > 1000000) {
                        newspeed = self.var_269a59bcee49ce1 * 1.1;
                        var_4b1a1ec87d5ac862[index] function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(newspeed));
                        var_4b1a1ec87d5ac862[index].var_c8ede22a39f49745 = newspeed;
                    }
                }
                /#
                    var_2c40e29836434cbe = getdvarint(@"hash_67411f60c7ab4996", 0) > 0;
                    if (var_2c40e29836434cbe) {
                        color = (1, 0.75, 0.8);
                        if (var_9a295e6abb51c7b3 > cos(45)) {
                            color = (0, 1, 0);
                        }
                        line(var_aed6fa7a3c542a21[index], var_4b1a1ec87d5ac862[index].origin, color, 1, 0, 1);
                        if (var_4a6c7f0ef6a2a647 > 0) {
                            sphere(var_aed6fa7a3c542a21[index], 8, color, 0, 1);
                        }
                    }
                #/
            }
        }
        waitframe();
    }
    self notify("all_vehicles_destroyed");
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34c6
// Size: 0x69
function function_617a1b569134ba77(var_e6013eac45290cab) {
    self endon("death");
    var_e6013eac45290cab endon("activity_ended");
    var_e6013eac45290cab endon("instance_destroyed");
    while (1) {
        if (isdefined(self.enemy) && array_contains(level.players, self.enemy)) {
            function_bbdcd857d0c2a65e(var_e6013eac45290cab, self.enemy);
        }
        wait(1);
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3536
// Size: 0x38
function function_7aa120c6895b1b0(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3575
// Size: 0x48
function function_53ecaed01e5352a0(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    if (issharedfuncdefined("armored_convoy_activity", "PlayApproachConvoyVO")) {
        function_f3bb4f4911a1beb2("armored_convoy_activity", "OnPlayerLeftActivity", self, var_b381b0883bcd4847);
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35c4
// Size: 0xb2
function function_586d9c599add1552(var_d6bfa53c531546d6) {
    activity_type = namespace_4fda5d7358015a06::function_de53ed8e35d0ed7a(self);
    if (isdefined(activity_type) && activity_type == "REV_OB_ARMORED_CONVOY") {
        if (istrue(var_d6bfa53c531546d6.var_7f9b2cc8a7bdb61e) && istrue(var_d6bfa53c531546d6.var_ebdc26444cd57171) && !istrue(self.var_de6f66d8d51587f1)) {
            var_2a29b237dcc66fe5 = [];
            var_2a29b237dcc66fe5 = array_add(var_2a29b237dcc66fe5, var_d6bfa53c531546d6.player);
            if (issharedfuncdefined("armored_convoy_activity", "PlayApproachConvoyVO")) {
                function_f3bb4f4911a1beb2("armored_convoy_activity", "PlayApproachConvoyVO", self, var_2a29b237dcc66fe5);
            } else {
                thread namespace_277c27ef297ef569::function_1281c7fff9456e18("activity_armored_convoy_approach_broadcast", var_2a29b237dcc66fe5);
            }
        }
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x367d
// Size: 0x118
function function_219e012faa65219d(var_28af8e747331e08d) {
    if (isdefined(var_28af8e747331e08d)) {
        self.var_157fa22c13019614 = spawnstruct();
        self.var_157fa22c13019614.var_5b51d831ec08f404 = function_53c4c53197386572(var_28af8e747331e08d.var_4b1a1ec87d5ac862.size, 0);
        self.var_157fa22c13019614.var_3db6b5c3b43da1d9 = [];
        self.var_157fa22c13019614.var_3dd0478a928f84d = [];
        for (i = 0; i < var_28af8e747331e08d.var_4b1a1ec87d5ac862.size; i++) {
            self.var_157fa22c13019614.var_3db6b5c3b43da1d9[i] = "ai_encounter:" + var_28af8e747331e08d.var_4b1a1ec87d5ac862[i].var_cf0d4d8cc5ac99a4.var_4f2425b7983137b0;
            self.var_157fa22c13019614.var_3dd0478a928f84d[i] = var_28af8e747331e08d.var_4b1a1ec87d5ac862[i].var_cf0d4d8cc5ac99a4.vehicle;
        }
    } else {
        /#
            assertmsg("Invalid Convoy Parameters, invalid convoy activity!!");
        #/
    }
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x379c
// Size: 0x16
function function_c7989b2ed75d1228() {
    return self.var_157fa22c13019614.var_5b51d831ec08f404;
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37ba
// Size: 0x53
function function_a23b8410030b26d0(vehicleposition) {
    /#
        assertex(vehicleposition >= 0 && vehicleposition < self.var_157fa22c13019614.var_5b51d831ec08f404, "Error - invalid vehicle position " + vehicleposition + "!!");
    #/
    return self.var_157fa22c13019614.var_3db6b5c3b43da1d9[vehicleposition];
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3815
// Size: 0x53
function function_2c9ad04639e71614(vehicleposition) {
    /#
        assertex(vehicleposition >= 0 && vehicleposition < self.var_157fa22c13019614.var_5b51d831ec08f404, "Error - invalid vehicle position " + vehicleposition + "!!");
    #/
    return self.var_157fa22c13019614.var_3dd0478a928f84d[vehicleposition];
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3870
// Size: 0xc
function function_5840644662c74a48(vehicle) {
    
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3883
// Size: 0xd
function function_e6f128a1e529f457() {
    /#
        function_bc8d978e7b0a418c();
    #/
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3897
// Size: 0x127
function private function_f47128cc3cb77caf(targetname) {
    /#
        playerforward = anglestoforward(level.players[0].angles);
        spawndata = spawnstruct();
        spawndata.origin = level.players[0].origin + playerforward * 500 + (0, 0, 300);
        spawndata.angles = level.players[0].angles;
        spawndata.team = self.var_152b8f126af5871d;
        spawndata.var_f16652e1462a3739 = 1;
        vehicledata = function_29b4292c92443328(targetname);
        vehicle = vehicle_spawn(targetname, spawndata);
        vehicle namespace_b479ac682b93cd92::vehicle_disable_navobstacles();
        vehicle thread script_func("<unknown string>");
        if (!isdefined(level.var_1903d60d80d1ce1c)) {
            level.var_1903d60d80d1ce1c = [];
        }
        level.var_1903d60d80d1ce1c[level.var_1903d60d80d1ce1c.size] = vehicle;
        return vehicle;
    #/
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x39c5
// Size: 0x1b6
function private function_b61f675503083701(var_b0246e4215beae7f, var_784030f0b32d0f1d) {
    /#
        var_b0246e4215beae7f = ter_op(isdefined(var_b0246e4215beae7f), var_b0246e4215beae7f, 0);
        var_784030f0b32d0f1d = ter_op(isdefined(var_784030f0b32d0f1d), var_784030f0b32d0f1d, 0);
        if (!self function_1e8542a707a8002("<unknown string>")) {
            self function_d2e41c7603ba7697("<unknown string>");
        }
        if (var_b0246e4215beae7f) {
            if (!self function_1e8542a707a8002("<unknown string>")) {
                self function_d2e41c7603ba7697("<unknown string>");
            }
        }
        if (var_784030f0b32d0f1d) {
            if (!self function_1e8542a707a8002("<unknown string>")) {
                self function_d2e41c7603ba7697("<unknown string>");
            }
        }
        self function_77320e794d35465a("<unknown string>", "<unknown string>", 0);
        self function_77320e794d35465a("<unknown string>", "<unknown string>", 1);
        self function_77320e794d35465a("<unknown string>", "<unknown string>", 1);
        self function_77320e794d35465a("<unknown string>", "<unknown string>", 1);
        self function_77320e794d35465a("<unknown string>", "<unknown string>", self.origin);
        self function_77320e794d35465a("<unknown string>", "<unknown string>", 200);
        self function_77320e794d35465a("<unknown string>", "<unknown string>", 1);
        self function_77320e794d35465a("<unknown string>", "<unknown string>", 1);
        self function_77320e794d35465a("<unknown string>", "<unknown string>", 1);
        self function_77320e794d35465a("<unknown string>", "<unknown string>", 1);
        self function_77320e794d35465a("<unknown string>", "<unknown string>", 4);
        self function_77320e794d35465a("<unknown string>", "<unknown string>", 2);
        self function_77320e794d35465a("<unknown string>", "<unknown string>", 0.9);
        self function_77320e794d35465a("<unknown string>", "<unknown string>", 2);
        self function_77320e794d35465a("<unknown string>", "<unknown string>", 300);
        self.stopping = 0;
    #/
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x3b82
// Size: 0x52
function private function_215e10bf17f98702(startpos, endpos, speed) {
    /#
        segmentlength = distance(startpos, endpos);
        var_58824a41b5315792 = segmentlength / speed;
        if (var_58824a41b5315792 < 0.05) {
            var_58824a41b5315792 = 0.05;
        }
        return var_58824a41b5315792;
    #/
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3bdb
// Size: 0x90
function private function_a646f25304f0c578(var_7db6235a7408e42f, var_bfe90410fad38aaa) {
    /#
        durations = [];
        /#
            assert(var_7db6235a7408e42f.size <= 48);
        #/
        if (var_7db6235a7408e42f.size >= 2) {
            for (index = 0; index < var_7db6235a7408e42f.size - 1; index++) {
                currentpoint = var_7db6235a7408e42f[index];
                nextpoint = var_7db6235a7408e42f[index + 1];
                durations[durations.size] = function_215e10bf17f98702(currentpoint, nextpoint, var_bfe90410fad38aaa);
            }
            durations[durations.size] = durations[durations.size - 1];
        }
        return durations;
    #/
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3c72
// Size: 0x32d
function private function_cd400918a8463816(params) {
    /#
        if (!isdefined(level.var_1903d60d80d1ce1c)) {
            return;
        }
        level.var_1903d60d80d1ce1c = function_fdc9d5557c53078e(level.var_1903d60d80d1ce1c);
        if (level.var_1903d60d80d1ce1c.size == 0) {
            return;
        }
        vehicle = level.var_1903d60d80d1ce1c[0];
        startlocation = vehicle.origin;
        var_2804c4cc3533f9b9 = level.players[0].origin;
        if (istrue(params[1] == "<unknown string>")) {
            playerangles = level.players[0] getplayerangles();
            playerforward = anglestoforward(playerangles);
            var_dc0ff8be42bd3dc2 = level.players[0] geteye();
            var_eaf9b788aaffbaa8 = var_dc0ff8be42bd3dc2 + playerforward * 5000;
            traceresults = namespace_2a184fc4902783dc::ray_trace(var_dc0ff8be42bd3dc2, var_eaf9b788aaffbaa8, level.players[0]);
            if (isdefined(traceresults)) {
                navmeshposition = getclosestpointonnavmesh(traceresults["<unknown string>"], level.var_56c51d0b8c3270ca);
                /#
                    color = (1, 0.65, 0);
                    duration = 200;
                    sphere(traceresults["<unknown string>"], 5, color, 0, duration);
                    line(navmeshposition, traceresults["<unknown string>"], color, 1, 0, duration);
                #/
                var_2804c4cc3533f9b9 = navmeshposition;
            }
        }
        var_efaa9ab3c88c72d8 = anglestoforward(vehicle.angles);
        var_34bb55fbc59c2e1d = isnavmeshloaded("<unknown string>");
        var_a8c9b5fffa6387d = isnavmeshloaded("<unknown string>");
        var_eefdc14dd5275fd0 = ter_op(var_34bb55fbc59c2e1d, "<unknown string>", ter_op(var_a8c9b5fffa6387d, "<unknown string>", undefined));
        var_c2202bf0909145b5 = ter_op(istrue(params[0] == "<unknown string>"), 2, 1);
        var_7db6235a7408e42f = vehicle function_187aaba5fbba21d0(startlocation, var_2804c4cc3533f9b9, 50, 200, 100, var_efaa9ab3c88c72d8, (0, 0, 0), 300, 0.4, 0, 1, var_eefdc14dd5275fd0, 0, var_c2202bf0909145b5);
        var_88125f10d2b34aa3 = 30;
        var_bfe90410fad38aaa = mph_to_ips(var_88125f10d2b34aa3);
        vehicle function_77320e794d35465a("<unknown string>", "<unknown string>", var_bfe90410fad38aaa);
        if (isdefined(var_7db6235a7408e42f)) {
            if (istrue(params[0] == "<unknown string>")) {
                if (var_7db6235a7408e42f.size >= 48) {
                    var_7db6235a7408e42f = array_slice(var_7db6235a7408e42f, 0, 47);
                }
                var_f70515e8a2d1ba64 = function_a646f25304f0c578(var_7db6235a7408e42f, var_bfe90410fad38aaa);
                var_48eb4234a3b0316d = function_6e313dda90fb035f(var_7db6235a7408e42f, var_f70515e8a2d1ba64);
                vehicle function_77320e794d35465a("<unknown string>", "<unknown string>", var_48eb4234a3b0316d);
            }
            vehicle thread namespace_3bb9da687f15383d::function_68d5232181fec390(var_7db6235a7408e42f, ter_op(isdefined(var_eefdc14dd5275fd0), (1, 1, 1), (1, 0, 0)));
        }
        vehicle thread namespace_3bb9da687f15383d::checkVehicleNavSplineStuck();
        vehicle thread namespace_3bb9da687f15383d::checkVehicleNavSplineInterrupted();
    #/
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3fa6
// Size: 0xdc
function private function_1ab5e4e5878bd5e9(vehicleRef) {
    /#
        adddebugcommand("<unknown string>");
        vehicle = function_f47128cc3cb77caf(vehicleRef[0]);
        playerforward = anglestoforward(level.players[0].angles);
        var_e5f14caf05dbb3b9 = level.players[0].origin + playerforward * 500 + (0, 0, 300);
        var_2e14085090a6e938 = vectorcross(playerforward, (0, 0, 1));
        startangles = axistoangles(playerforward, var_2e14085090a6e938, (0, 0, 1));
        vehicle vehicle_teleport(var_e5f14caf05dbb3b9, startangles);
        wait(1);
        vehicle function_b61f675503083701(1);
        return vehicle;
    #/
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4089
// Size: 0x113
function private function_a496584181f051a9(var_a1b8a5cb8f76d032) {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        /#
            assert(var_a1b8a5cb8f76d032 > 0);
        #/
        self.riders = [];
        self.unloadque = [];
        self.unload_group = "<unknown string>";
        var_efaa9ab3c88c72d8 = anglestoforward(self.angles);
        namespace_4ff41449ab14a3a0::handle_attached_guys();
        namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(self, "<unknown string>");
        for (seatindex = var_a1b8a5cb8f76d032; seatindex >= 0; seatindex--) {
            spawnlocation = self.origin + var_efaa9ab3c88c72d8 * seatindex * 100 + (0, 0, 200);
            agent = namespace_34f6a6adabfc542d::spawnnewagentaitype("<unknown string>", spawnlocation, self.angles, "<unknown string>", "<unknown string>");
            if (isdefined(agent)) {
                agent.script_startingposition = seatindex;
                thread namespace_4ff41449ab14a3a0::guy_enter(agent);
                agent.vehiclerunexit = 1;
            }
            wait(0.5);
        }
    #/
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x41a3
// Size: 0x2e
function private function_2393c0027c00179a(vehicleRef) {
    /#
        vehicle = function_1ab5e4e5878bd5e9(vehicleRef);
        vehicle thread function_a496584181f051a9(5);
        return vehicle;
    #/
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x41d8
// Size: 0x7d
function private function_bbfa6f6f2d68f325(vehicleRef) {
    /#
        vehicle = function_2393c0027c00179a(vehicleRef);
        var_34bb55fbc59c2e1d = isnavmeshloaded("<unknown string>");
        var_a8c9b5fffa6387d = isnavmeshloaded("<unknown string>");
        var_eefdc14dd5275fd0 = ter_op(var_34bb55fbc59c2e1d, "<unknown string>", ter_op(var_a8c9b5fffa6387d, "<unknown string>", undefined));
        vehicle thread namespace_3bb9da687f15383d::vehicleNavSplineSimpleFollowBehavior(15, var_eefdc14dd5275fd0, 1);
    #/
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x425c
// Size: 0x38
function private function_76624b2b3e4db74f() {
    /#
        if (!isdefined(level.var_620e3a366fb95fcf)) {
            level.var_620e3a366fb95fcf = 0;
        }
        level.var_620e3a366fb95fcf = ter_op(level.var_620e3a366fb95fcf, 0, 1);
    #/
}

// Namespace namespace_acac8960cc6d8d64/namespace_16464fbff4c4f003
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x429b
// Size: 0x118
function private function_bc8d978e7b0a418c() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_df648211d66cd3dd("<unknown string>", "<unknown string>");
        function_df648211d66cd3dd("<unknown string>", "<unknown string>");
        function_df648211d66cd3dd("<unknown string>", "<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_76624b2b3e4db74f);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_1ab5e4e5878bd5e9);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_2393c0027c00179a);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_bbfa6f6f2d68f325);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + 0 + "<unknown string>" + 0, &function_cd400918a8463816);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + 1 + "<unknown string>" + 0, &function_cd400918a8463816);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + 0 + "<unknown string>" + 1, &function_cd400918a8463816);
        function_fe953f000498048f();
    #/
}

