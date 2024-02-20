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

#namespace namespace_e60bb0f12c163721;

// Namespace namespace_e60bb0f12c163721/namespace_2399e05def999e4c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x266
// Size: 0x191
function vehicle_mp_init() {
    namespace_3c37cb17ade254d::registersharedfunc("vehicle", "create", &vehicle_mp_create);
    namespace_3c37cb17ade254d::registersharedfunc("vehicle", "createLate", &vehicle_mp_createlate);
    namespace_3c37cb17ade254d::registersharedfunc("vehicle", "deleteNextFrame", &vehicle_mp_deletenextframe);
    namespace_3c37cb17ade254d::registersharedfunc("vehicle", "deleteNextFrameLate", &vehicle_mp_deletenextframelate);
    namespace_3c37cb17ade254d::registersharedfunc("vehicle", "createHint", &namespace_19b4203b51d56488::createhintobject);
    namespace_3c37cb17ade254d::registersharedfunc("vehicle_interact", "init", &namespace_868e4fea34a42d09::vehicle_interact_mp_init);
    namespace_3c37cb17ade254d::registersharedfunc("vehicle_occupancy", "init", &namespace_8a7917956d758aea::vehicle_occupancy_mp_init);
    namespace_3c37cb17ade254d::registersharedfunc("vehicle_mines", "init", &namespace_69bbb30e9ccdb9f9::vehicle_mines_mp_init);
    namespace_3c37cb17ade254d::registersharedfunc("vehicle_spawn", "init", &namespace_cff1154e5f566ff4::vehicle_spawn_mp_init);
    namespace_3c37cb17ade254d::registersharedfunc("vehicle_compass", "init", &namespace_597c42ba275de1::vehicle_compass_mp_init);
    namespace_3c37cb17ade254d::registersharedfunc("vehicle_damage", "init", &namespace_f5e82d5f0a0bebc4::vehicle_damage_mp_init);
    namespace_3c37cb17ade254d::registersharedfunc("vehicle_upgrade", "init", &namespace_a4b43c1cf86c6fe5::_runpurchasemenu);
    namespace_3c37cb17ade254d::registersharedfunc("vehicle_trophy", "init", &namespace_832187ad8517bd27::trophy_watchprotection);
    namespace_3c37cb17ade254d::registersharedfunc("vehicle_trophyDestroyTarget", "init", &namespace_832187ad8517bd27::function_477783276ea16601);
    namespace_3c37cb17ade254d::registersharedfunc("vehicle_trophyCreateExplosion", "init", &namespace_832187ad8517bd27::trophy_createexplosion);
    namespace_3c37cb17ade254d::registersharedfunc("vehicle_trophyExplode", "init", &namespace_832187ad8517bd27::trophy_explode);
    namespace_3c37cb17ade254d::registersharedfunc("light_tank", "init", &namespace_d8996def0b815fdf::light_tank_mp_init);
    namespace_ad22b9cf6a2b30d::init();
    namespace_1cad239ed01de62d::vehicle_oob_mp_init();
    /#
        function_e36283a0d7dc082c();
    #/
}

// Namespace namespace_e60bb0f12c163721/namespace_2399e05def999e4c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fe
// Size: 0x5f
function vehicle_mp_create(vehicle, spawndata) {
    vehicle.maxhealth = namespace_5a0f3ca265d3a4c8::vehicle_damage_getmaxhealth(vehicle);
    vehicle.health = vehicle.maxhealth;
    namespace_d9c77dc2a6fe29c6::registerentforoob(vehicle, "vehicle");
    vehicle enableplayermarks("killstreak");
    namespace_8a7917956d758aea::vehicle_occupancy_mp_updatemarkfilter(vehicle);
}

// Namespace namespace_e60bb0f12c163721/namespace_2399e05def999e4c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x464
// Size: 0x14
function vehicle_mp_createlate(vehicle, spawndata) {
    
}

// Namespace namespace_e60bb0f12c163721/namespace_2399e05def999e4c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47f
// Size: 0x16
function vehicle_mp_deletenextframe(vehicle) {
    namespace_d9c77dc2a6fe29c6::clearoob(vehicle, 1);
}

// Namespace namespace_e60bb0f12c163721/namespace_2399e05def999e4c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49c
// Size: 0xc
function vehicle_mp_deletenextframelate(vehicle) {
    
}

// Namespace namespace_e60bb0f12c163721/namespace_2399e05def999e4c
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
        break;
    }
}

// Namespace namespace_e60bb0f12c163721/namespace_2399e05def999e4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52e
// Size: 0xe
function function_e36283a0d7dc082c() {
    /#
        thread function_8154c406e557eba0();
    #/
}

// Namespace namespace_e60bb0f12c163721/namespace_2399e05def999e4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x543
// Size: 0x33
function function_8154c406e557eba0() {
    /#
        while (1) {
            if (getdvarint(@"hash_f29bd33b293b2675", 0) != 0) {
                function_a6a8c67dda2a3121();
            }
            wait(level.framedurationseconds);
        }
    #/
}

// Namespace namespace_e60bb0f12c163721/namespace_2399e05def999e4c
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
            thread namespace_f2ffc0540883e1ad::drawsphere(point, 2, level.framedurationseconds, (1, 1, 1));
        }
    #/
}

