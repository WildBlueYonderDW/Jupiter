#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace namespace_1d412d516148e9b4;

// Namespace namespace_1d412d516148e9b4 / namespace_db65270d1872d5f7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x237
// Size: 0x4f
function init(height) {
    path = function_a5f9d701bf1aac23();
    level thread function_338f95c30204fc42(path);
    scripts\cp_mp\vehicles\vehicle::vehicle_forceinit("veh_jup_space_shipment_transport");
    level thread function_56940da4beb24898(path, height);
    callback::add("player_vehicle_exit", &function_49cfeec2947a199c);
}

// Namespace namespace_1d412d516148e9b4 / namespace_db65270d1872d5f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28e
// Size: 0xad
function function_a5f9d701bf1aac23() {
    scale = 0.65;
    path = [];
    path[path.size] = (8316.63, 9678.09, 5329.13);
    path[path.size] = (-3815.93, 11578, 5171.54);
    path[path.size] = (-6805.27, -605.689, 5329.13);
    path[path.size] = (6337.73, -1139.24, 5329.13);
    path[path.size] = (9428.3, 2970.4, 5257.93);
    for (i = 0; i < path.size; i++) {
        path[i] = path[i] * scale;
        path[i] = (path[i][0], path[i][1], 6000);
    }
    return path;
}

// Namespace namespace_1d412d516148e9b4 / namespace_db65270d1872d5f7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x344
// Size: 0x5f
function function_49cfeec2947a199c(params) {
    vehicle = params.vehicle;
    if (!is_equal(vehicle.targetname, "veh_jup_space_shipment_transport")) {
        return;
    }
    if (!vehicle hascomponent("p2p")) {
        vehicle addcomponent("p2p");
    }
    vehicle thread wander_map();
}

// Namespace namespace_1d412d516148e9b4 / namespace_db65270d1872d5f7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ab
// Size: 0x4c
function function_338f95c30204fc42(path) {
    while (true) {
        for (i = 0; i < path.size; i++) {
            /#
                sphere(path[i], 32, (1, 1, 1), 0, 1);
            #/
        }
        waitframe();
    }
}

// Namespace namespace_1d412d516148e9b4 / namespace_db65270d1872d5f7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3ff
// Size: 0x174
function function_56940da4beb24898(path, height) {
    while (!isdefined(level.var_a0b2c978ca57ffc5)) {
        waitframe();
    }
    if (!scripts\cp_mp\vehicles\vehicle::function_fa537f1ab52a76d1("veh_jup_space_shipment_transport")) {
        waitframe();
    }
    if (matchmakinggame()) {
        scripts\mp\flags::gameflagwait("infil_animatic_complete");
    }
    spawndata = spawnstruct();
    origin = (path[0][0], path[0][1], height);
    spawndata.origin = origin;
    spawndata.angles = vectortoangles(path[1] - path[0]);
    spawndata.spawntype = "DEVGUI";
    spawndata.var_cae20238ee346e02 = 1;
    vehicle = scripts\cp_mp\vehicles\vehicle::vehicle_spawn("veh_jup_space_shipment_transport", spawndata);
    vehicle.nullownerdamagefunc = &function_ffd405aecfd3d5b3;
    /#
        level thread function_d8ebb244badd9649(vehicle);
    #/
    reflection_probe = getentarray("space_shipment_probes", "targetname");
    foreach (probe in reflection_probe) {
        probe unlink();
        probe linkto(vehicle);
    }
    vehicle thread function_a3ecc821dbd5e9ed(path, height);
    vehicle thread function_b118477b9178fbfb();
    vehicle thread wander_map();
}

// Namespace namespace_1d412d516148e9b4 / namespace_db65270d1872d5f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57b
// Size: 0x176
function wander_map() {
    vehicle = self;
    vehicle notify("wander_map");
    vehicle endon("wander_map");
    path = function_a5f9d701bf1aac23();
    maxspeed = 400;
    vehicle addcomponent("p2p");
    while (true) {
        foreach (i, location in path) {
            if (i == 0) {
                continue;
            }
            if (!isdefined(vehicle)) {
                break;
            }
            /#
                line(vehicle.origin, location, (0, 1, 0), 1, 0, 250);
            #/
            vehicle setscriptablepartstate("single", "vehicle_use");
            vehicle function_77320e794d35465a("p2p", "gasToStopMovement", 0);
            vehicle function_77320e794d35465a("p2p", "manualSpeed", maxspeed);
            vehicle function_77320e794d35465a("p2p", "brake", 0.1);
            vehicle function_77320e794d35465a("p2p", "goalPoint", location);
            vehicle function_77320e794d35465a("p2p", "goalAngles", flat_angle(vectortoangles(location - vehicle.origin)));
            vehicle function_77320e794d35465a("p2p", "goalThreshold", 1000);
            vehicle waittill_any_3("goal", "near_goal");
        }
        waitframe();
    }
}

// Namespace namespace_1d412d516148e9b4 / namespace_db65270d1872d5f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f9
// Size: 0xff
function function_b118477b9178fbfb() {
    vehicle = self;
    vehicle endon("entitydeleted");
    for (i = 0; i < 3; i++) {
        origin = vehicle gettagorigin("tag_loot_0" + i + 1) + (0, 0, 32);
        angles = vehicle gettagangles("tag_loot_0" + i + 1);
        instance = spawnscriptable("br_loot_cache_lege", origin, angles);
        scripts\mp\gametypes\br_pickups::registerscriptableinstance(instance);
        localorigin = rotatevectorinverted(origin - vehicle.origin, vehicle.angles);
        localangles = combineangles(invertangles(vehicle.angles), angles);
        instance scriptablesetparententity(vehicle, localorigin, localangles);
        instance setscriptablepartstate("body", "closed_usable");
        instance thread function_e6b94ee7f1f923e0(vehicle);
    }
}

// Namespace namespace_1d412d516148e9b4 / namespace_db65270d1872d5f7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x800
// Size: 0x47
function function_e45e3cc2d3e7ebf9(vehicle) {
    while (true) {
        origin = vehicle gettagorigin("tag_loot_01");
        /#
            sphere(origin, 16, (1, 1, 1), 0, 1);
        #/
        waitframe();
    }
}

// Namespace namespace_1d412d516148e9b4 / namespace_db65270d1872d5f7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x84f
// Size: 0x3c
function function_a3ecc821dbd5e9ed(path, height) {
    while (true) {
        if (!isdefined(level.player)) {
            waitframe();
            continue;
        }
        if (!isdefined(self)) {
            function_56940da4beb24898(path, height);
            return;
        }
        waitframe();
    }
}

/#

    // Namespace namespace_1d412d516148e9b4 / namespace_db65270d1872d5f7
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x893
    // Size: 0x69
    function function_d8ebb244badd9649(vehicle) {
        level notify("<dev string:x1c>");
        level endon("<dev string:x1c>");
        while (isdefined(vehicle)) {
            if (getdvarint(@"hash_2fdf021822704f83", 0)) {
                level.players[0] setorigin(vehicle gettagorigin("<dev string:x3b>"));
                setdvar(@"hash_2fdf021822704f83", 0);
            }
            wait 0.2;
        }
    }

#/

// Namespace namespace_1d412d516148e9b4 / namespace_db65270d1872d5f7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x904
// Size: 0x1b
function function_e6b94ee7f1f923e0(vehicle) {
    while (isdefined(vehicle)) {
        waitframe();
    }
    self freescriptable();
}

// Namespace namespace_1d412d516148e9b4 / namespace_db65270d1872d5f7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x927
// Size: 0xd
function function_ffd405aecfd3d5b3(attacker) {
    return true;
}

