// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_1f97a44d1761c919;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_5307834cd39b435c;
#using scripts\mp\utility\player.gsc;
#using script_5c65d346ac65390c;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\common\vehicle_paths.gsc;

#namespace namespace_39beb6d4ea2b65f4;

// Namespace namespace_39beb6d4ea2b65f4/namespace_acc3d8ec1f00ce29
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de
// Size: 0x60
function init() {
    if (getdvarint(@"hash_81e631c248118cd6", 1) != 1) {
        return;
    }
    level.var_c0e521049f7ae2c9 = getdvarint(@"hash_62ff9f6d45bb6187", 1);
    level.var_82c0cbd2d6453e77 = namespace_dace9d390bc4a290::function_b08e7e3a0b14f76f("veh9_palfa");
    level.var_343e61767f194b9d = getstructarray("palfa_fuel_spawn", "targetname");
}

// Namespace namespace_39beb6d4ea2b65f4/namespace_acc3d8ec1f00ce29
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x245
// Size: 0x3b4
function function_e456f5964ba54d64() {
    if (getdvarint(@"hash_81e631c248118cd6", 1) != 1) {
        return;
    }
    if (!isdefined(level.var_82c0cbd2d6453e77) || level.var_82c0cbd2d6453e77.size == 0 || !isdefined(level.var_343e61767f194b9d) || level.var_343e61767f194b9d.size == 0) {
        return;
    }
    namespace_3c37cb17ade254d::registersharedfunc(23395, "pickedUp", &function_4579ae632e8313bd);
    var_b389b85c70dc3c9b = namespace_1f188a13f7e79610::vehicle_spawn("veh9_palfa", random(level.var_82c0cbd2d6453e77));
    var_b389b85c70dc3c9b.fuel = 0;
    var_b389b85c70dc3c9b.var_7ee6203c5532a9e6 = 1;
    var_b389b85c70dc3c9b.var_a2ba7043631b3392 = 1;
    level.var_84b057f4f76a152a = var_b389b85c70dc3c9b;
    if (namespace_cd0b2d039510b38d::getsubgametype() == "dmz") {
        namespace_d9c77dc2a6fe29c6::enableoobimmunity(var_b389b85c70dc3c9b);
        var_b389b85c70dc3c9b.onstartriding = &function_436c572e13c3c87f;
        var_b389b85c70dc3c9b.onendriding = &function_fce5e8b79cac65b4;
        var_b389b85c70dc3c9b.var_76b2c48898593e9 = &function_4edcaac915edcd2e;
    }
    /#
        if (0) {
            foreach (var_57bfc04b20b55e89 in level.var_343e61767f194b9d) {
                level thread namespace_d028276791d9cff6::drawsphere(var_57bfc04b20b55e89.origin, 300, 10000, (1, 0, 0));
            }
        }
    #/
    level.var_343e61767f194b9d = array_slice(sortbydistance(level.var_343e61767f194b9d, var_b389b85c70dc3c9b.origin), level.var_343e61767f194b9d.size - 3);
    if (isdefined(level.wztrain_info) && isdefined(level.wztrain_info.var_c3604781a9d33a7a) && isdefined(level.wztrain_info.var_c3604781a9d33a7a["cargo_train"]) && isdefined(level.wztrain_info.var_c3604781a9d33a7a["cargo_train"][4]) && isdefined(level.var_7d2577fb3be5a656)) {
        struct = level.var_7d2577fb3be5a656;
        level.var_343e61767f194b9d[randomint(level.var_343e61767f194b9d.size)] = struct;
        struct.var_ce5c1024bca39998 = 1;
    }
    var_a620cb0e6444887f = getdvarint(@"hash_d796f74dcf2618ef", 1);
    foreach (chosen in array_randomize(level.var_343e61767f194b9d)) {
        /#
            if (0) {
                level thread namespace_d028276791d9cff6::drawsphere(chosen.origin, 100, 10000, (0, 1, 0));
            }
        #/
        fuel = spawnscriptable("brloot_gascan_palfa", chosen.origin, chosen.angles);
        if (isdefined(chosen.traincar)) {
            fuel function_6e506f39f121ea8a(chosen.traincar, chosen.origin, chosen.angles);
        }
        fuel.count = 1;
        fuel.var_bbc200bc77c5db2b = 1;
        fuel.var_ce5c1024bca39998 = chosen.var_ce5c1024bca39998;
        namespace_cb965d2f71fefddc::registerscriptableinstance(fuel);
        var_a620cb0e6444887f = var_a620cb0e6444887f - 1;
        if (var_a620cb0e6444887f <= 0) {
            return;
        }
    }
}

// Namespace namespace_39beb6d4ea2b65f4/namespace_acc3d8ec1f00ce29
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x600
// Size: 0x38
function private function_436c572e13c3c87f(player) {
    namespace_d9c77dc2a6fe29c6::enableoobimmunity(player);
    player.var_76b2c48898593e9 = &function_10f36f1f7c586276;
    thread function_14980658c4ae8eaa(player.team);
}

// Namespace namespace_39beb6d4ea2b65f4/namespace_acc3d8ec1f00ce29
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x63f
// Size: 0x32
function private function_14980658c4ae8eaa(team) {
    wait(4);
    if (isdefined(self) && self.fuel <= 0) {
        level thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("palfa_is_grounded", team);
    }
}

// Namespace namespace_39beb6d4ea2b65f4/namespace_acc3d8ec1f00ce29
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x678
// Size: 0x33
function private function_fce5e8b79cac65b4(player) {
    if (isdefined(player)) {
        player.var_76b2c48898593e9 = undefined;
        if (!istrue(player.extracted)) {
            namespace_d9c77dc2a6fe29c6::disableoobimmunity(player);
        }
    }
}

// Namespace namespace_39beb6d4ea2b65f4/namespace_acc3d8ec1f00ce29
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6b2
// Size: 0x2b
function private function_4579ae632e8313bd(scriptable, player) {
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("palfa_fuel_use", player.team);
}

// Namespace namespace_39beb6d4ea2b65f4/namespace_acc3d8ec1f00ce29
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e4
// Size: 0xc2
function function_354bd1ba3062243d() {
    if (istrue(level.var_43834c3a158b5eff)) {
        return;
    }
    level.var_43834c3a158b5eff = 1;
    if (!isdefined(level.var_84b057f4f76a152a) || level.var_84b057f4f76a152a.fuel <= 0) {
        /#
            assertmsg("PALFA refueled despite being undefined");
        #/
        return;
    }
    if (namespace_cd0b2d039510b38d::getsubgametype() == "dmz") {
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("palfa_refueled", self.team);
        level.var_84b057f4f76a152a thread function_b5f1b07a91e21eb9();
    }
    mtx = namespace_1f188a13f7e79610::function_471cde1983a05f66(self, "veh9_palfa");
    namespace_1f188a13f7e79610::function_4201160d49c885a7(level.var_84b057f4f76a152a, mtx);
    level.var_84b057f4f76a152a.var_7ee6203c5532a9e6 = undefined;
}

// Namespace namespace_39beb6d4ea2b65f4/namespace_acc3d8ec1f00ce29
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ad
// Size: 0x2c
function private function_b5f1b07a91e21eb9() {
    self endon("death");
    wait(60);
    occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self);
    namespace_446fc987a980892f::function_d87d5deb069bf8e5("palfa_flying_reminder", occupants);
}

// Namespace namespace_39beb6d4ea2b65f4/namespace_acc3d8ec1f00ce29
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7e0
// Size: 0x1c
function private function_10f36f1f7c586276(occupant) {
    function_4edcaac915edcd2e(level.var_84b057f4f76a152a);
}

// Namespace namespace_39beb6d4ea2b65f4/namespace_acc3d8ec1f00ce29
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x803
// Size: 0x363
function private function_4edcaac915edcd2e(heli) {
    if (istrue(level.var_32e5e1538fbe1d9d)) {
        return;
    }
    level.var_32e5e1538fbe1d9d = 1;
    var_309c0a11484cc0db = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(heli);
    namespace_25b25d188ef778c4::function_e7994a561be9b933(var_309c0a11484cc0db);
    heli.var_90acdd32579dcb16 = 1;
    vehicles = vehicle_getarrayinradius(heli.origin, 500, 500);
    foreach (vehicle in vehicles) {
        foreach (occupant in vehicle.occupants) {
            if (isplayer(occupant) && namespace_7e17181d03156026::isreallyalive(occupant)) {
                var_309c0a11484cc0db = function_6d6af8144a5131f1(var_309c0a11484cc0db, occupant);
            }
        }
        if (!istrue(vehicle.var_90acdd32579dcb16)) {
            level thread namespace_1f188a13f7e79610::vehicle_death(vehicle);
        }
    }
    heli.var_94cf3a68b99ae841 = 1;
    heli notify("exfil_path_started");
    info = namespace_e8fceb5cf6e8cdf8::function_730c660d9fc6808e(var_309c0a11484cc0db, 0, 0, 0, 1);
    namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("chopper_exfil", "exfil_players", var_309c0a11484cc0db, info);
    namespace_1fbd40990ee60ede::vehicle_occupancy_ejectalloccupants(heli);
    waitframe();
    struct = spawnstruct();
    struct.origin = heli.origin;
    struct.angles = heli.angles;
    mtx = heli.mtx;
    namespace_1f188a13f7e79610::vehicle_death(heli);
    var_2425bc48c64278cd = namespace_1f188a13f7e79610::vehicle_spawn("veh9_palfa", struct);
    namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(var_2425bc48c64278cd);
    var_2425bc48c64278cd namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage(0);
    var_2425bc48c64278cd function_247ad6a91f6a4ffe(1);
    namespace_1f188a13f7e79610::function_4201160d49c885a7(var_2425bc48c64278cd, mtx);
    path = namespace_e8fceb5cf6e8cdf8::function_1093b8f392744e3b(var_2425bc48c64278cd, var_2425bc48c64278cd.origin + (0, 0, 1000) + 5000 * anglestoforward(var_2425bc48c64278cd.angles), level.var_251923794d7ecf20.heliheight, 0);
    path.origin = struct.origin;
    path.angles = struct.angles;
    var_2425bc48c64278cd thread namespace_3bb9da687f15383d::vehicle_paths_helicopter(path);
    /#
        if (0) {
            pathnode = path;
            while (isdefined(pathnode)) {
                prev = pathnode.origin;
                sphere(pathnode.origin, 200, (0, 0, 1), 0, 10000);
                pathnode = pathnode.target;
                if (isdefined(pathnode)) {
                    line(pathnode.origin, prev, (0, 0, 1), 1, 0, 10000);
                }
            }
        }
    #/
    var_2425bc48c64278cd.var_1693991455559c14 = 1;
    var_2425bc48c64278cd endon("death");
    wait(15);
    level thread namespace_1f188a13f7e79610::vehicle_death(var_2425bc48c64278cd);
}

