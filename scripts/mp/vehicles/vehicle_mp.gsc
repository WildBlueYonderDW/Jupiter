// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\vehicles\vehicle_interact_mp.gsc;
#using scripts\mp\vehicles\vehicle_occupancy_mp.gsc;
#using scripts\mp\vehicles\vehicle_mines_mp.gsc;
#using scripts\mp\vehicles\vehicle_spawn_mp.gsc;
#using scripts\mp\vehicles\vehicle_compass_mp.gsc;
#using scripts\mp\vehicles\vehicle_damage_mp.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using scripts\mp\equipment\trophy_system.gsc;
#using scripts\mp\vehicles\light_tank_mp.gsc;
#using scripts\mp\vehicles\damage.gsc;
#using scripts\mp\vehicles\vehicle_oob_mp.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;

#namespace vehicle_mp;

// Namespace vehicle_mp / scripts/mp/vehicles/vehicle_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x266
// Size: 0x191
function vehicle_mp_init() {
    scripts/engine/utility::registersharedfunc("vehicle", "create", &vehicle_mp_create);
    scripts/engine/utility::registersharedfunc("vehicle", "createLate", &vehicle_mp_createlate);
    scripts/engine/utility::registersharedfunc("vehicle", "deleteNextFrame", &vehicle_mp_deletenextframe);
    scripts/engine/utility::registersharedfunc("vehicle", "deleteNextFrameLate", &vehicle_mp_deletenextframelate);
    scripts/engine/utility::registersharedfunc("vehicle", "createHint", &scripts/mp/gameobjects::createhintobject);
    scripts/engine/utility::registersharedfunc("vehicle_interact", "init", &scripts/mp/vehicles/vehicle_interact_mp::vehicle_interact_mp_init);
    scripts/engine/utility::registersharedfunc("vehicle_occupancy", "init", &scripts/mp/vehicles/vehicle_occupancy_mp::vehicle_occupancy_mp_init);
    scripts/engine/utility::registersharedfunc("vehicle_mines", "init", &scripts/mp/vehicles/vehicle_mines_mp::vehicle_mines_mp_init);
    scripts/engine/utility::registersharedfunc("vehicle_spawn", "init", &scripts/mp/vehicles/vehicle_spawn_mp::vehicle_spawn_mp_init);
    scripts/engine/utility::registersharedfunc("vehicle_compass", "init", &scripts/mp/vehicles/vehicle_compass_mp::vehicle_compass_mp_init);
    scripts/engine/utility::registersharedfunc("vehicle_damage", "init", &scripts/mp/vehicles/vehicle_damage_mp::vehicle_damage_mp_init);
    scripts/engine/utility::registersharedfunc("vehicle_upgrade", "init", &scripts/mp/gametypes/br_armory_kiosk::_runpurchasemenu);
    scripts/engine/utility::registersharedfunc("vehicle_trophy", "init", &scripts/mp/equipment/trophy_system::trophy_watchprotection);
    scripts/engine/utility::registersharedfunc("vehicle_trophyDestroyTarget", "init", &scripts/mp/equipment/trophy_system::function_477783276ea16601);
    scripts/engine/utility::registersharedfunc("vehicle_trophyCreateExplosion", "init", &scripts/mp/equipment/trophy_system::trophy_createexplosion);
    scripts/engine/utility::registersharedfunc("vehicle_trophyExplode", "init", &scripts/mp/equipment/trophy_system::trophy_explode);
    scripts/engine/utility::registersharedfunc("light_tank", "init", &scripts/mp/vehicles/light_tank_mp::light_tank_mp_init);
    scripts/mp/vehicles/damage::init();
    scripts/mp/vehicles/vehicle_oob_mp::vehicle_oob_mp_init();
    /#
        function_e36283a0d7dc082c();
    #/
}

// Namespace vehicle_mp / scripts/mp/vehicles/vehicle_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fe
// Size: 0x5f
function vehicle_mp_create(vehicle, spawndata) {
    vehicle.maxhealth = scripts/cp_mp/vehicles/vehicle_damage::vehicle_damage_getmaxhealth(vehicle);
    vehicle.health = vehicle.maxhealth;
    scripts/mp/outofbounds::registerentforoob(vehicle, "vehicle");
    vehicle enableplayermarks("killstreak");
    scripts/mp/vehicles/vehicle_occupancy_mp::vehicle_occupancy_mp_updatemarkfilter(vehicle);
}

// Namespace vehicle_mp / scripts/mp/vehicles/vehicle_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x464
// Size: 0x14
function vehicle_mp_createlate(vehicle, spawndata) {
    
}

// Namespace vehicle_mp / scripts/mp/vehicles/vehicle_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47f
// Size: 0x16
function vehicle_mp_deletenextframe(vehicle) {
    scripts/mp/outofbounds::clearoob(vehicle, 1);
}

// Namespace vehicle_mp / scripts/mp/vehicles/vehicle_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49c
// Size: 0xc
function vehicle_mp_deletenextframelate(vehicle) {
    
}

// Namespace vehicle_mp / scripts/mp/vehicles/vehicle_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4af
// Size: 0x78
function function_dd9423aa2b333df5(vehicle) {
    if (!isdefined(vehicle) || !isdefined(vehicle.vehiclename)) {
        return 0;
    }
    switch (vehicle.vehiclename) {
    case #"hash_228830c793bd36cb":
    case #"hash_cbbafedb48ea9aea":
    case #"hash_d589a6a019e9defe":
    case #"hash_f690b9139a2baa7e":
        return 1;
    default:
        return 0;
    }
}

// Namespace vehicle_mp / scripts/mp/vehicles/vehicle_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52e
// Size: 0xe
function function_e36283a0d7dc082c() {
    /#
        thread function_8154c406e557eba0();
    #/
}

// Namespace vehicle_mp / scripts/mp/vehicles/vehicle_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x543
// Size: 0x33
function function_8154c406e557eba0() {
    /#
        while (true) {
            if (getdvarint(@"hash_f29bd33b293b2675", 0) != 0) {
                function_a6a8c67dda2a3121();
            }
            wait(level.framedurationseconds);
        }
    #/
}

// Namespace vehicle_mp / scripts/mp/vehicles/vehicle_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57d
// Size: 0x108
function function_a6a8c67dda2a3121() {
    /#
        vehicles = getentarray("<unknown string>", "<unknown string>");
        foreach (vehicle in vehicles) {
            point = vehicle.origin;
            point = point + anglestoforward(vehicle.angles) * getdvarint(@"hash_a765ffa626d484ef", 0);
            point = point + anglestoright(vehicle.angles) * getdvarint(@"hash_46a8210687b62330", 0);
            point = point + anglestoup(vehicle.angles) * getdvarint(@"hash_29007f0daffa3caf", 0);
            thread scripts/cp_mp/utility/debug_utility::drawsphere(point, 2, level.framedurationseconds, (1, 1, 1));
        }
    #/
}

