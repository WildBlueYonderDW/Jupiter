// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_compass.gsc;
#using script_279d83e79f5bb757;
#using scripts\common\vehicle_code.gsc;
#using scripts\cp_mp\vehicles\vehicle_mines.gsc;
#using scripts\cp_mp\vehicles\vehicle_dlog.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_collision.gsc;
#using scripts\cp_mp\vehicles\customization\battle_tracks.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\common\vehicle_build.gsc;
#using script_736dec95a49487a6;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\engine\flags.gsc;
#using script_371b4c2ab5861e62;
#using script_16ea1b94f0f381b3;
#using scripts\common\vehicle_paths.gsc;
#using scripts\common\vehicle_aianim.gsc;
#using scripts\vehicle\vehicle_common.gsc;
#using scripts\common\ai.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_24e4405cf93f20ed;
#using scripts\cp_mp\challenges.gsc;

#namespace vehicle;

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2a
// Size: 0x2bb
function vehicle_init() {
    if (getdvarint(@"hash_e6afce2cf5cf7515", 0)) {
        return;
    }
    if (getdvarint(@"hash_742caa13b3c2e685")) {
        return;
    }
    if (!isdefined(level.vehicle)) {
        level.vehicle = spawnstruct();
    }
    level.vehicle.vehicledata = [];
    level.vehicle.onVehicleSpawned = &onVehicleSpawned;
    /#
        namespace_3c37cb17ade254d::issharedfuncdefined("driver_can_fire", " on vehicle ", 1);
    #/
    [[ namespace_3c37cb17ade254d::getsharedfunc("vehicle", "init") ]]();
    if (getdvarint(@"hash_a464cb031c16ee87") > 0) {
        level.var_7bf42d565645a485 = 1;
    }
    if (getdvarint(@"hash_50e5feed8f9f6f56", 0) == 1) {
        level.var_1b4da6b781c9dfbd = 1;
    }
    var_2fb2947eb2d22b23 = getscriptbundlenames("vehiclebundle");
    if (var_2fb2947eb2d22b23.size > 0) {
        level.var_7bf42d565645a485 = 1;
    }
    namespace_b479ac682b93cd92::vehicle_setuplevelvariables();
    if (istrue(level.var_7bf42d565645a485)) {
        namespace_141c4634b6ea7b27::vehicle_interact_init();
        namespace_1fbd40990ee60ede::vehicle_occupancy_init();
        namespace_f64231d5b7a2c3c4::vehicle_tracking_init();
        namespace_739a1beacdad3457::vehicle_mines_init();
        namespace_5a0f3ca265d3a4c8::vehicle_damage_init();
        namespace_dace9d390bc4a290::vehicle_spawn_init();
        namespace_d28769d7bb5c026b::vehicle_dlog_init();
        namespace_2a495135d56d95b7::vehicle_compass_init();
        namespace_84cff6185e39aa66::vehomn_init();
        namespace_f3f7309ba50e9927::vehicle_collision_init();
        namespace_6c0d09f1e6fc2bc5::function_620aa345ac2f9963();
        level thread function_466cdec791b7edfe();
        level thread function_5ff2c834ca229322();
        namespace_7f0bcee5d45a1dea::add("player_connect", &function_4b1cc40cc7b8441e);
        if (isdefined(level.var_54ce42fa004dde04)) {
            foreach (func in level.var_54ce42fa004dde04) {
                [[ func ]]();
            }
        }
        foreach (bundlename in var_2fb2947eb2d22b23) {
            bundle = getscriptbundle(bundlename);
            if (isdefined(bundle.ref) && istrue(bundle.var_9bd9d5b96d91c1c3)) {
                function_8497e7e46b5e397(bundle.ref);
            }
        }
        level.var_54c8acfd634a416c = 1;
    } else {
        namespace_f64231d5b7a2c3c4::vehicle_tracking_init();
        namespace_739a1beacdad3457::vehicle_mines_init();
        namespace_5a0f3ca265d3a4c8::vehicle_damage_init();
        namespace_dace9d390bc4a290::vehicle_spawn_init();
        namespace_2a495135d56d95b7::vehicle_compass_init();
        namespace_84cff6185e39aa66::vehomn_init();
    }
    flag_set("vehicle_init_complete");
    flag_set("vehicle_init_done");
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ec
// Size: 0x5f
function function_c0b3ddc9a6bdcc46(vehicleRef, func) {
    level.var_7bf42d565645a485 = 1;
    if (function_38f50decb5603d7(vehicleRef)) {
        return;
    }
    if (!isdefined(level.var_54ce42fa004dde04)) {
        level.var_54ce42fa004dde04 = [];
    }
    level.var_54ce42fa004dde04[vehicleRef] = func;
    if (istrue(level.var_54c8acfd634a416c)) {
        [[ func ]]();
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1152
// Size: 0x26
function function_38f50decb5603d7(vehicleRef) {
    return isdefined(level.var_54ce42fa004dde04) && isdefined(level.var_54ce42fa004dde04[vehicleRef]);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1180
// Size: 0x62
function function_66ab4fb2175555e1(vehicleRef) {
    if (!isdefined(level.var_b3585d083f213844)) {
        level.var_b3585d083f213844 = [];
    }
    level.var_b3585d083f213844[vehicleRef] = 1;
    if (function_38f50decb5603d7(vehicleRef) && istrue(level.var_54c8acfd634a416c) && !function_fa537f1ab52a76d1(vehicleRef)) {
        [[ level.var_54ce42fa004dde04[vehicleRef] ]]();
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e9
// Size: 0x42
function function_9697379150687859(vehicleRef) {
    return istrue(level.var_1b4da6b781c9dfbd) || isdefined(level.var_b3585d083f213844) && istrue(level.var_b3585d083f213844[vehicleRef]) || function_b08e7e3a0b14f76f(vehicleRef).size > 0;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1233
// Size: 0xf1
function onVehicleSpawned() {
    params = spawnstruct();
    params.vehicle = self;
    namespace_7f0bcee5d45a1dea::callback("on_vehicle_spawned", params);
    vehiclebundle = self.var_ca4a4dd2f8495667;
    if (!isdefined(vehiclebundle)) {
        return;
    }
    vehicleRef = vehiclebundle.ref;
    if (!isdefined(vehicleRef) || !function_fa537f1ab52a76d1(vehicleRef)) {
        return;
    }
    if (issharedfuncdefined(vehicleRef, "spawn")) {
        return;
    }
    level callback::callback("onVehicleSpawned", params);
    spawndata = spawnstruct();
    spawndata.origin = self.origin;
    spawndata.angles = self.angles;
    spawndata.spawntype = "LEVEL";
    spawndata.var_f16652e1462a3739 = 1;
    function_bba34cf920370ff4(vehicleRef, spawndata, undefined, self);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132b
// Size: 0x86
function function_466cdec791b7edfe() {
    while (!isnavmeshloaded()) {
        waitframe();
    }
    waitframe();
    foreach (layer in [0:"vehicle_large", 1:"vehicle_med", 2:"soldier"]) {
        if (isnavmeshloaded(layer)) {
            level.var_2814a8f25a392eaa = layer;
            break;
        }
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b8
// Size: 0x17a
function function_5ff2c834ca229322() {
    while (1) {
        var_44f1c37d516c2acb = level waittill("vehicle_integrity_failure");
        foreach (var_32955835d1dbc4dc in var_44f1c37d516c2acb) {
            var_f35bc3914dd968e3 = var_32955835d1dbc4dc[0];
            reason = var_32955835d1dbc4dc[1];
            /#
                entitynum = var_f35bc3914dd968e3 getentitynumber();
                iprintln("top" + entitynum + "husk_spawn" + function_53c4c53197386572(var_f35bc3914dd968e3.vehiclename, "vehicle_update") + "inflictor" + reason);
            #/
            if (var_f35bc3914dd968e3 function_2a503318e000e11d()) {
                /#
                    iprintln("veh_jup_razorback" + var_f35bc3914dd968e3.streakinfo.streakname + "nacnac_left" + var_f35bc3914dd968e3.vehiclename);
                #/
                var_b1e2dc0593d7ca82 = var_f35bc3914dd968e3.var_3098bbcd22d0e052;
                if (isdefined(var_b1e2dc0593d7ca82)) {
                    var_f35bc3914dd968e3 thread [[ var_b1e2dc0593d7ca82.var_2efc43f3f9071bc7 ]](reason);
                }
            } else if (var_f35bc3914dd968e3 isvehicle()) {
                var_f35bc3914dd968e3.var_a8f4bb03b366aa80 = 1;
                if (istrue(var_f35bc3914dd968e3.var_1693991455559c14)) {
                    vehicle_death(var_f35bc3914dd968e3);
                } else {
                    var_f35bc3914dd968e3 vehicle_explode();
                }
            } else {
                var_f35bc3914dd968e3 delete();
            }
        }
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1539
// Size: 0x14
function function_4b1cc40cc7b8441e(params) {
    thread function_973cff70a385b03();
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1554
// Size: 0x2d
function function_973cff70a385b03() {
    self endon("disconnect");
    while (1) {
        waittill_any_2("ascender_attached", "ascender_detached");
        thread vehicle_preventplayercollisiondamagefortimeafterexit(undefined, self);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1588
// Size: 0xd
function isvehicle() {
    return isdefined(self.vehiclename);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x159d
// Size: 0x67
function function_794b5f886cced2d0() {
    if (isdefined(self) && isvehicle()) {
        ref = function_d93ec4635290febd();
        if (isdefined(ref) && function_89dc39dc11f3988c(ref)) {
            return (isdefined(function_29b4292c92443328(ref).interact) && istrue(function_29b4292c92443328(ref).interact.var_591de85cd0986f8d));
        }
    }
    return 0;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160c
// Size: 0x21
function function_a164fb69837475d5() {
    return isdefined(self) && isdefined(self.var_abd157413ac4e022) && isdefined(self.var_91e81ceb674fdd8c);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1635
// Size: 0x81
function function_160ef1c877c69ab1(player, vehicle, turret, tag) {
    player.var_abd157413ac4e022 = vehicle;
    player.var_91e81ceb674fdd8c = turret;
    player.var_e9a71c27fef1b65a = tag;
    if (!isdefined(vehicle.var_3a442282fb9074e1)) {
        vehicle.var_3a442282fb9074e1 = [];
    }
    vehicle.var_3a442282fb9074e1[vehicle.var_3a442282fb9074e1.size] = player;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16bd
// Size: 0x58
function function_4d2324450a951b2b(player, vehicle) {
    if (isdefined(player)) {
        player.var_abd157413ac4e022 = undefined;
        player.var_91e81ceb674fdd8c = undefined;
        player.var_e9a71c27fef1b65a = undefined;
    }
    vehicle.var_3a442282fb9074e1 = array_remove(vehicle.var_3a442282fb9074e1, player);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171c
// Size: 0x4d
function exitExternalTurret() {
    if (!function_a164fb69837475d5()) {
        return;
    }
    ref = self.var_abd157413ac4e022 function_d93ec4635290febd();
    if (!isdefined(ref)) {
        return;
    }
    self.var_91e81ceb674fdd8c function_f3bb4f4911a1beb2(ref, "exitExternalTurret", self, self.var_abd157413ac4e022);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1770
// Size: 0x21
function isvehicledestroyed() {
    /#
        assertex(isvehicle(), "isVehicleDestroyed() called on a non-vehicle entity.");
    #/
    return istrue(self.isdestroyed);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1799
// Size: 0x25
function function_62ccfb7ea15a4520() {
    return isvehicle() && !isdefined(self.owner) && isdefined(self.var_566868292ee2a1b);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c6
// Size: 0x30
function vehiclecanfly() {
    var_e2818ad39a3341b4 = vehicle_getleveldataforvehicle(self.vehiclename);
    if (isdefined(var_e2818ad39a3341b4)) {
        return istrue(var_e2818ad39a3341b4.canfly);
    }
    return undefined;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17fe
// Size: 0xaf
function function_9502aa416ccd1247() {
    if (self vehicle_isphysveh() && self function_784f000d59e38105()) {
        return !self function_76fa53e72547ff02();
    }
    if (!self function_76fa53e72547ff02()) {
        return 0;
    }
    data = vehicle_getleveldataforvehicle(function_d93ec4635290febd());
    if (isdefined(data) && isdefined(data.interact) && self vehicle_isphysveh()) {
        var_96629ab4f22a62ce = function_53c4c53197386572(data.interact.var_710719bc8c0e95d1, 20);
        if (isdefined(self.var_f2b4d0e8470f108b)) {
            var_96629ab4f22a62ce = var_96629ab4f22a62ce - 2 * self.var_f2b4d0e8470f108b.size;
        }
        return (self function_100d3bf35fca6a7f() > var_96629ab4f22a62ce);
    }
    return 0;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b5
// Size: 0xd
function function_b7148a3bfc4defb2() {
    return istrue(self.var_b7148a3bfc4defb2);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ca
// Size: 0x2d
function function_7c62ca52f72901a1() {
    var_e2818ad39a3341b4 = vehicle_getleveldataforvehicle(function_d93ec4635290febd());
    if (isdefined(var_e2818ad39a3341b4)) {
        return istrue(var_e2818ad39a3341b4.var_941d95491d4d4817);
    }
    return 0;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ff
// Size: 0x23
function function_2a503318e000e11d() {
    if (isdefined(self) && namespace_1f188a13f7e79610::isvehicle()) {
        if (isdefined(self.streakinfo)) {
            return 1;
        }
    }
    return 0;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192a
// Size: 0x14
function function_e0187e3c57f0f72e() {
    return !vehiclecanfly() && !function_7c62ca52f72901a1();
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1946
// Size: 0x6c
function vehicle_getleveldataforvehicle(vehicleRef, create) {
    if (istrue(create) && !function_89dc39dc11f3988c(vehicleRef)) {
        level.var_a0b2c978ca57ffc5[vehicleRef] = spawnstruct();
    } else if (!function_89dc39dc11f3988c(vehicleRef)) {
        /#
            assertex(isdefined(level.vehicle), "vehicle_getLevelDataForVehicle called before vehicle_init.");
        #/
    }
    if (function_89dc39dc11f3988c(vehicleRef)) {
        return function_29b4292c92443328(vehicleRef);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b9
// Size: 0xb4
function function_8497e7e46b5e397(vehicleRef, callbacks) {
    if (isdefined(callbacks)) {
        foreach (key, func in callbacks) {
            registersharedfunc(vehicleRef, key, func);
        }
    }
    function_35a03f008736204d(vehicleRef);
    function_2ae5eae26e26efe9(vehicleRef);
    if (issharedfuncdefined(vehicleRef, "init")) {
        [[ getsharedfunc(vehicleRef, "init") ]]();
    }
    if (issharedfuncdefined(vehicleRef, "initLate")) {
        [[ getsharedfunc(vehicleRef, "initLate") ]]();
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a74
// Size: 0xcb
function private function_35a03f008736204d(vehicleRef) {
    if (!isdefined(level.var_a0b2c978ca57ffc5)) {
        level.var_a0b2c978ca57ffc5 = [];
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        bundlename = vehicleRef + "_br";
        scriptbundle = getscriptbundle("vehiclebundle:" + bundlename);
        if (!isdefined(scriptbundle)) {
            bundlename = vehicleRef + "_mp";
            scriptbundle = getscriptbundle("vehiclebundle:" + bundlename);
        }
        level.var_a0b2c978ca57ffc5[vehicleRef] = scriptbundle;
    } else {
        bundlename = vehicleRef + ter_op(!iscp(), "_mp", "_cp");
        level.var_a0b2c978ca57ffc5[vehicleRef] = getscriptbundle("vehiclebundle:" + bundlename);
    }
    /#
        assert(function_89dc39dc11f3988c(vehicleRef), "vehicle_registerData: Didn't find any loaded script bundles with the name: " + bundlename);
    #/
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b46
// Size: 0x24b2
function private function_2ae5eae26e26efe9(vehicleRef) {
    data = function_29b4292c92443328(vehicleRef);
    if (isdefined(data.var_14090bc312dbf6c8) && isdefined(data.var_14090bc312dbf6c8.vfx)) {
        level._effect[vehicleRef + "_explosion"] = loadfx(data.var_14090bc312dbf6c8.vfx);
    }
    if (isdefined(data.var_14090bc312dbf6c8) && isdefined(data.var_14090bc312dbf6c8.scriptable) && data.var_14090bc312dbf6c8.scriptable == "") {
        data.var_14090bc312dbf6c8.scriptable = undefined;
    }
    if (isdefined(data.var_eb61d7c4087c9207) && isdefined(data.var_eb61d7c4087c9207.scriptable) && data.var_eb61d7c4087c9207.scriptable == "") {
        data.var_eb61d7c4087c9207.scriptable = undefined;
    }
    if (istrue(data.var_fb41d1ca75009bf0.var_f2cf04c055fd760e) && isdefined(data.var_fb41d1ca75009bf0.ref) && isdefined(data.var_eb61d7c4087c9207) && isdefined(data.var_eb61d7c4087c9207.vfx)) {
        level._effect[data.var_fb41d1ca75009bf0.ref + "_explosion"] = loadfx(data.var_eb61d7c4087c9207.vfx);
    }
    if (isdefined(data.compositemodel) && data.compositemodel != "") {
        data.model = data.compositemodel;
    }
    data.compositemodel = undefined;
    if (isdefined(data.var_fb41d1ca75009bf0.compositemodel) && data.var_fb41d1ca75009bf0.compositemodel != "") {
        data.var_fb41d1ca75009bf0.model = data.var_fb41d1ca75009bf0.compositemodel;
    }
    data.var_fb41d1ca75009bf0.compositemodel = undefined;
    if (isdefined(data.ai.compositemodel) && data.ai.compositemodel != "") {
        data.ai.model = data.ai.compositemodel;
    }
    data.ai.compositemodel = undefined;
    data.occupancy.exitoffsets = [];
    data.occupancy.exitdirections = [];
    foreach (exit in data.var_39a64a5e09c1284a) {
        data.occupancy.exitoffsets[exit.ref] = (function_53c4c53197386572(exit.offset.x, 0), function_53c4c53197386572(exit.offset.y, 0), function_53c4c53197386572(exit.offset.z, 0));
        data.occupancy.exitdirections[exit.ref] = exit.direction;
    }
    data.var_39a64a5e09c1284a = undefined;
    data.occupancy.seatdata = [];
    foreach (seatdata in data.seats) {
        data.occupancy.seatdata[seatdata.ref] = seatdata;
    }
    data.seatswitcharray = [];
    foreach (index, var_e634bc0732415d0c in data.seats) {
        data.seatswitcharray[index] = var_e634bc0732415d0c.ref;
    }
    data.occupancy.seatids = [];
    data.occupancy.id = data.id;
    data.id = undefined;
    foreach (seatid, seatdata in data.occupancy.seatdata) {
        if (seatdata.restrictions == "driver_can_fire" || seatdata.restrictions == "turret_passenger") {
            seatdata.var_4c78bdf78d543129 = 1;
        }
        switch (seatdata.restrictions) {
        case #"hash_b19724c2fdfb9d3f":
            seatdata.restrictions = vehicle_occupancy_getdriverrestrictions();
            break;
        case #"hash_bc3a9fa5d9ee1d33":
            seatdata.restrictions = function_b9cc4ad5c15d3cee();
            break;
        case #"hash_f7f9964a5172a48a":
            seatdata.restrictions = vehicle_occupancy_getcombatpassengerrestrictions();
            break;
        case #"hash_5890abf34002e520":
            seatdata.restrictions = vehicle_occupancy_getturretpassengerrestrictions();
            break;
        case #"hash_1c8b46d9f8c121d1":
            seatdata.restrictions = vehicle_occupancy_getpassivepassengerrestrictions();
            break;
        }
        if (seatdata.animtag == "tag_turret") {
            seatdata.animtag = undefined;
        }
        seatdata.seatswitcharray = vehicle_occupancy_generateseatswitcharray(seatid, data.seatswitcharray);
        seatdata.damagemodifier = function_53c4c53197386572(seatdata.damagemodifier, 0);
        seatdata.var_dcfc487f4ef1103c = function_53c4c53197386572(seatdata.var_dcfc487f4ef1103c, 0);
        if (seatdata.var_dcfc487f4ef1103c < 0) {
            seatdata.var_dcfc487f4ef1103c = undefined;
        }
        if (isdefined(seatdata.turretweapon) && seatdata.turretweapon != "") {
            seatdata.turretobjweapon = makeweapon(seatdata.turretweapon);
        }
        data.occupancy.seatids[seatid] = function_53c4c53197386572(seatdata.var_3e99c59055b3de67, 0);
    }
    if (data.occupancy.var_c08d88c04569a00b == "no_roof_exit") {
        data.occupancy.var_c08d88c04569a00b = undefined;
    }
    data.seats = undefined;
    data.spawn.abandonedtimeoutcallback = &vehicle_spawn_abandonedtimeoutcallback;
    if (isdefined(data.var_cd5ab16b94bc2745) && data.var_cd5ab16b94bc2745 == "") {
        data.var_cd5ab16b94bc2745 = undefined;
    }
    foreach (mtx in data.mtx) {
        if (isdefined(mtx.var_9c6d62e1c42be80a) && mtx.var_9c6d62e1c42be80a.size > 0) {
            map = [];
            foreach (var_1ae3a63ed6578d45 in mtx.var_9c6d62e1c42be80a) {
                map[var_1ae3a63ed6578d45.weapon] = var_1ae3a63ed6578d45.var_fe99f86a708e76ef;
            }
            mtx.var_9c6d62e1c42be80a = map;
        } else {
            mtx.var_9c6d62e1c42be80a = undefined;
        }
    }
    data.damage.weapon = data.weapon;
    data.damage.visualpercents = [];
    data.damage.visualcallbacks = [];
    data.damage.visualclearcallbacks = [];
    data.damage.damagestatedata = [];
    data.damage.var_aab9695c92b0ed96 = [];
    vehicle_damage_registerdefaultstates(vehicleRef);
    vehicle_damage_applytabletovehicle(vehicleRef);
    vehicle_damage_setvehiclehitdamagedata(vehicleRef, data.damage.var_f5d36c635cc8546b);
    vehicle_damage_setdeathcallback(vehicleRef, &vehicle_explode);
    vehicle_damage_setweaponhitdamagedata(data.damage.weapon, data.damage.var_c3b0005f41b92649);
    data.var_85ccbd4bc4b4b792 = 0;
    function_1f39191797c711b6(vehicleRef, data.damage.var_10175926aeb1591e);
    if (istrue(data.var_fb41d1ca75009bf0.var_f2cf04c055fd760e)) {
        vehicle_damage_setvehiclehitdamagedata(data.var_fb41d1ca75009bf0.ref, data.damage.var_f5d36c635cc8546b);
        if (isdefined(data.var_fb41d1ca75009bf0.weapon)) {
            vehicle_damage_setweaponhitdamagedata(data.var_fb41d1ca75009bf0.weapon, data.damage.var_c3b0005f41b92649);
        }
        if (!iscp()) {
            vehicle_damage_setdeathcallback(data.var_fb41d1ca75009bf0.ref, &vehicle_explode);
        }
    } else {
        data.var_eb61d7c4087c9207 = undefined;
    }
    data.interact.lights = [];
    foreach (light in data.lights) {
        data.interact.lights[light.tag] = light;
    }
    data.lights = undefined;
    data.damage.var_9d70f02394c136da = [];
    data.damage.var_ccfde1208ef2964b = [];
    foreach (var_bafa22fcdefff511 in data.var_aab9695c92b0ed96) {
        if (!istrue(var_bafa22fcdefff511.enabled)) {
            continue;
        }
        if (istrue(var_bafa22fcdefff511.var_231adcae1ae30c4)) {
            data.damage.var_9d70f02394c136da[var_bafa22fcdefff511.var_da9f4cd603f44758] = var_bafa22fcdefff511;
        }
        if (istrue(var_bafa22fcdefff511.var_6b48cb7fdf031749)) {
            data.damage.var_ccfde1208ef2964b[var_bafa22fcdefff511.var_da9f4cd603f44758] = var_bafa22fcdefff511;
        }
        switch (var_bafa22fcdefff511.ref) {
        case #"hash_30ccbada37699a25":
        case #"hash_42b5a3e3285842cd":
        case #"hash_504ea34262e6d686":
        case #"hash_5a0d6719dbc731d7":
        case #"hash_b1f7d5cd648c98d8":
        case #"hash_c0bd12509f7ca46a":
        case #"hash_e1eacaf3ea9bdac4":
        case #"hash_ef7c0c9fb26d257b":
            var_bafa22fcdefff511.var_7cbffe9de982bcad = function_e84a5f30606d3a09(var_bafa22fcdefff511.ref, "_wheel");
            break;
        case #"hash_299ca2ec66573f5f":
        case #"hash_3ad9dee1b2383dd0":
        case #"hash_429f675878e8e042":
        case #"hash_93cd8ed9ef8f8301":
        case #"hash_976b632eaa0990c2":
        case #"hash_aa711d7fc645b3e3":
        case #"hash_c366ad8b46c80b09":
        case #"hash_dbc0e96da272c41c":
        case #"hash_fcd5dc0af3e2a581":
            data.occupancy.var_c0ac99d7d5e195a4 = 1;
            var_bafa22fcdefff511.var_49cf4824f012bfea = function_e84a5f30606d3a09(var_bafa22fcdefff511.ref, "_door");
            break;
        case #"hash_1c7226690cdd4ebb":
        case #"hash_7759f2094c4eae28":
        case #"hash_7fa614aa388c793c":
        case #"hash_84b307d5d860ef65":
        case #"hash_ccec2206c85cd572":
        case #"hash_e6e515a681eb15e5":
        case #"hash_ebde6181acd770f2":
        case #"hash_f8f7e8f9ac33a0d7":
        case #"hash_fa41893bbe9474bd":
            var_199b7eb356c9d5a9 = function_e84a5f30606d3a09(var_bafa22fcdefff511.ref, "_window");
            jumpiffalse(isdefined(data.occupancy.seatdata[var_199b7eb356c9d5a9])) LOC_00000e24;
            data.occupancy.seatdata[var_199b7eb356c9d5a9].var_9a3db3c861da8d62 = var_bafa22fcdefff511.var_da9f4cd603f44758;
        case #"hash_a8e647d4b09dea3f":
        LOC_00000e24:
            var_bafa22fcdefff511.var_9eb2af3a3212b936 = var_bafa22fcdefff511.ref;
            break;
        case #"hash_d582c3286e5c390f":
            /#
                assert(isdefined(data.interact.lights[var_bafa22fcdefff511.var_da9f4cd603f44758]), "vehicle_processData: Didn't find light data for the light " + var_bafa22fcdefff511.ref + " on vehicle " + vehicleRef);
            #/
            break;
        }
        var_bafa22fcdefff511.ref = undefined;
        if (isdefined(var_bafa22fcdefff511.var_7cbffe9de982bcad)) {
            switch (var_bafa22fcdefff511.var_7cbffe9de982bcad) {
            case #"hash_19baa7ca5b52f06a":
                var_bafa22fcdefff511.var_b4fccc158c681073 = &function_4b3ef3d76f7e39b6;
                break;
            case #"hash_60b26be014fd7337":
                var_bafa22fcdefff511.var_b4fccc158c681073 = &function_d4c899afe6cbf533;
                break;
            case #"hash_67ed6be3637f19ed":
                var_bafa22fcdefff511.var_b4fccc158c681073 = &function_1c35d2bee2c14d7b;
                break;
            case #"hash_227fe4df4167aa26":
                var_bafa22fcdefff511.var_b4fccc158c681073 = &function_2e20b5a5d4f70228;
                break;
            case #"hash_f0704f57a0dd2250":
                var_bafa22fcdefff511.var_b4fccc158c681073 = &function_79b9f63570444468;
                break;
            case #"hash_cbd67f63f80e6245":
                var_bafa22fcdefff511.var_b4fccc158c681073 = &function_4c7a8d0b6c6c16cd;
                break;
            case #"hash_711797dce2a722a3":
                var_bafa22fcdefff511.var_b4fccc158c681073 = &function_1cbe55c0515820b5;
                break;
            case #"hash_6ade103971ce6e2c":
                var_bafa22fcdefff511.var_b4fccc158c681073 = &function_6469ea91038491e2;
                break;
            }
        }
        data.damage.var_aab9695c92b0ed96[var_bafa22fcdefff511.var_da9f4cd603f44758] = var_bafa22fcdefff511;
        namespace_dbbb37eb352edf96::function_9039b650ffb212c8(var_bafa22fcdefff511.var_da9f4cd603f44758);
    }
    data.var_aab9695c92b0ed96 = undefined;
    data.damage.frontextents = function_53c4c53197386572(data.damage.var_9cc800babf1f05af.front, 0);
    data.damage.backextents = function_53c4c53197386572(data.damage.var_9cc800babf1f05af.back, 0);
    data.damage.leftextents = function_53c4c53197386572(data.damage.var_9cc800babf1f05af.left, 0);
    data.damage.rightextents = function_53c4c53197386572(data.damage.var_9cc800babf1f05af.right, 0);
    data.damage.bottomextents = function_53c4c53197386572(data.damage.var_9cc800babf1f05af.bottom, 0);
    data.damage.loscheckoffset = (function_53c4c53197386572(data.damage.var_8e266d8413972567.x, 0), function_53c4c53197386572(data.damage.var_8e266d8413972567.y, 0), function_53c4c53197386572(data.damage.var_8e266d8413972567.z, 0));
    data.damage.var_8e266d8413972567 = undefined;
    data.damage.var_9cc800babf1f05af = undefined;
    if (istrue(data.damage.var_98277a386e38941f)) {
        data.damage.var_c0d2f358f2e54245.front = function_53c4c53197386572(data.damage.var_c0d2f358f2e54245.front, 0);
        data.damage.var_c0d2f358f2e54245.back = function_53c4c53197386572(data.damage.var_c0d2f358f2e54245.back, 0);
        data.damage.var_c0d2f358f2e54245.left = function_53c4c53197386572(data.damage.var_c0d2f358f2e54245.left, 0);
        data.damage.var_c0d2f358f2e54245.right = function_53c4c53197386572(data.damage.var_c0d2f358f2e54245.right, 0);
        data.damage.var_c0d2f358f2e54245.top = function_53c4c53197386572(data.damage.var_c0d2f358f2e54245.top, 0);
        data.damage.var_c0d2f358f2e54245.bottom = function_53c4c53197386572(data.damage.var_c0d2f358f2e54245.bottom, 0);
    } else {
        data.damage.var_c0d2f358f2e54245 = undefined;
    }
    data.occupancy.exitextents["front"] = function_53c4c53197386572(data.exitextents.front, 0);
    data.occupancy.exitextents["back"] = function_53c4c53197386572(data.exitextents.back, 0);
    data.occupancy.exitextents["left"] = function_53c4c53197386572(data.exitextents.left, 0);
    data.occupancy.exitextents["right"] = function_53c4c53197386572(data.exitextents.right, 0);
    data.occupancy.exitextents["top"] = function_53c4c53197386572(data.exitextents.top, 0);
    data.occupancy.exitextents["bottom"] = function_53c4c53197386572(data.exitextents.bottom, 0);
    data.exitextents = undefined;
    data.interact.var_ed5c39e0b1ef815c = [];
    data.interact.pointdata = [];
    function_3e11a192d07b42ea(vehicleRef, "single", data.seatswitcharray);
    level.vehicle.oob.outoftimecallbacks[vehicleRef] = &vehicle_explode;
    data.occupancy.data = [];
    data.occupancy.rotationids = [];
    data.occupancy.warningbits = [];
    data.occupancy.warningstartcallbacks = [];
    data.occupancy.warningendcallbacks = [];
    data.occupancy.warningclearcallbacks = [];
    data.occupancy.rotationrefsbyseatandweapon = [];
    data.occupancy.warningbits["burningDown"] = 1;
    data.occupancy.warningbits["missileLocking"] = 2;
    data.occupancy.warningbits["missileIncoming"] = 4;
    data.occupancy.warningbits["movementDisabled"] = 3;
    data.occupancy.warningbits["outOfFuel"] = 6;
    data.occupancy.warningbits["lowFuel"] = 5;
    data.occupancy.warningbits["BunkerBusterAttached"] = 7;
    data.occupancy.warningbits["shockStickAttached"] = 8;
    data.occupancy.warningbits["DDoSed"] = 9;
    data.occupancy.warningbits["locked"] = 10;
    if (utility::function_a10967d736dc56e5() && istrue(data.ai.var_289df80e1ded586f)) {
        /#
            assert(isdefined(data.ai.classname) && data.ai.classname != "", "You must specify a classname if this vehicle supports AI: " + vehicleRef);
        #/
        /#
            assert(isdefined(data.ai.vehicleanimalias) && data.ai.vehicleanimalias != "", "You must specify a vehicleAnimAlias if this vehicle supports AI: " + vehicleRef);
        #/
        unload_groups = [];
        unload_groups["default"] = [];
        unload_groups["all"] = [];
        foreach (index, seatdata in data.var_f4eae2a1481b7dd3) {
            if (isdefined(seatdata.vehicle_getinanim) && isdefined(seatdata.vehicle_getinanim.id)) {
                seatdata.vehicle_getinanim = seatdata.vehicle_getinanim.id;
            } else {
                seatdata.vehicle_getinanim = undefined;
            }
            if (isdefined(seatdata.vehicle_getoutanim) && isdefined(seatdata.vehicle_getoutanim.id)) {
                seatdata.vehicle_getoutanim = seatdata.vehicle_getoutanim.id;
            } else {
                seatdata.vehicle_getoutanim = undefined;
            }
            if (isdefined(seatdata.vehicle_getoutanim_combat) && isdefined(seatdata.vehicle_getoutanim_combat.id)) {
                seatdata.vehicle_getoutanim_combat = seatdata.vehicle_getoutanim_combat.id;
            } else {
                seatdata.vehicle_getoutanim_combat = undefined;
            }
            if (isdefined(seatdata.vehicle_getoutanim_combat_run) && isdefined(seatdata.vehicle_getoutanim_combat_run.id)) {
                seatdata.vehicle_getoutanim_combat_run = seatdata.vehicle_getoutanim_combat_run.id;
            } else {
                seatdata.vehicle_getoutanim_combat_run = undefined;
            }
            if (isdefined(seatdata.linkoffset)) {
                x = function_53c4c53197386572(seatdata.linkoffset.x, 0);
                y = function_53c4c53197386572(seatdata.linkoffset.y, 0);
                z = function_53c4c53197386572(seatdata.linkoffset.z, 0);
                if (x != 0 || y != 0 || z != 0) {
                    seatdata.linkoffset = (x, y, z);
                } else {
                    seatdata.linkoffset = undefined;
                }
            }
            if (isdefined(seatdata.var_3630ffa8edafef8)) {
                pitch = function_53c4c53197386572(seatdata.var_3630ffa8edafef8.x, 0);
                yaw = function_53c4c53197386572(seatdata.var_3630ffa8edafef8.y, 0);
                roll = function_53c4c53197386572(seatdata.var_3630ffa8edafef8.z, 0);
                if (pitch != 0 || yaw != 0 || roll != 0) {
                    seatdata.var_3630ffa8edafef8 = (pitch, yaw, roll);
                } else {
                    seatdata.var_3630ffa8edafef8 = undefined;
                }
            }
            if (isdefined(seatdata.linkoffset) && !isdefined(seatdata.var_3630ffa8edafef8)) {
                seatdata.var_3630ffa8edafef8 = (0, 0, 0);
            }
            if (isdefined(data.var_7c19cae9edc84d70) && isdefined(data.var_7c19cae9edc84d70[index])) {
                var_62b78f0013665ce9 = data.var_7c19cae9edc84d70[index];
                if (isdefined(var_62b78f0013665ce9.idle) && isdefined(var_62b78f0013665ce9.idle.id)) {
                    seatdata.idle = var_62b78f0013665ce9.idle.id;
                }
                if (isdefined(var_62b78f0013665ce9.getin) && isdefined(var_62b78f0013665ce9.getin.id)) {
                    seatdata.getin = var_62b78f0013665ce9.getin.id;
                }
                if (isdefined(var_62b78f0013665ce9.getout) && isdefined(var_62b78f0013665ce9.getout.id)) {
                    seatdata.getout = var_62b78f0013665ce9.getout.id;
                }
                if (isdefined(var_62b78f0013665ce9.death) && isdefined(var_62b78f0013665ce9.death.id)) {
                    seatdata.death = var_62b78f0013665ce9.death.id;
                }
                if (isdefined(var_62b78f0013665ce9.ragdoll_fall_anim) && isdefined(var_62b78f0013665ce9.ragdoll_fall_anim.id)) {
                    seatdata.ragdoll_fall_anim = var_62b78f0013665ce9.ragdoll_fall_anim.id;
                }
                if (isdefined(var_62b78f0013665ce9.idle_anim) && var_62b78f0013665ce9.idle_anim != "") {
                    seatdata.idle_anim = var_62b78f0013665ce9.idle_anim;
                }
            }
            if (!istrue(seatdata.do_not_unload)) {
                unload_groups["default"][unload_groups["default"].size] = index;
                unload_groups["all"][unload_groups["all"].size] = index;
            }
        }
        foreach (var_7e219b890204c40d in data.unloadgroups) {
            unload_groups[var_7e219b890204c40d.name] = [];
            foreach (index, seatdata in var_7e219b890204c40d.seats) {
                unload_groups[var_7e219b890204c40d.name][unload_groups[var_7e219b890204c40d.name].size] = seatdata.seatindex;
            }
        }
        data.unloadgroups = undefined;
        data.var_7c19cae9edc84d70 = undefined;
        var_5dec33f9548f94d6 = [];
        if (isdefined(data.var_230c9a6c41607d0d)) {
            foreach (var_c76d4efe76e23739 in data.var_230c9a6c41607d0d) {
                var_5dec33f9548f94d6[var_c76d4efe76e23739.var_5e862f586eeb6fa1] = spawnstruct();
                if (isdefined(var_c76d4efe76e23739.model)) {
                    var_5dec33f9548f94d6[var_c76d4efe76e23739.var_5e862f586eeb6fa1].model = var_c76d4efe76e23739.model;
                }
                if (isdefined(var_c76d4efe76e23739.tag)) {
                    var_5dec33f9548f94d6[var_c76d4efe76e23739.var_5e862f586eeb6fa1].tag = var_c76d4efe76e23739.tag;
                }
                if (isdefined(var_c76d4efe76e23739.idleanim) && isdefined(var_c76d4efe76e23739.idleanim.id)) {
                    var_5dec33f9548f94d6[var_c76d4efe76e23739.var_5e862f586eeb6fa1].idleanim = var_c76d4efe76e23739.idleanim.id;
                }
                if (isdefined(var_c76d4efe76e23739.dropanim) && isdefined(var_c76d4efe76e23739.dropanim.id)) {
                    var_5dec33f9548f94d6[var_c76d4efe76e23739.var_5e862f586eeb6fa1].dropanim = var_c76d4efe76e23739.dropanim.id;
                }
                if (isdefined(var_c76d4efe76e23739.dropusestraceorigin)) {
                    var_5dec33f9548f94d6[var_c76d4efe76e23739.var_5e862f586eeb6fa1].dropusestraceorigin = var_c76d4efe76e23739.dropusestraceorigin;
                }
            }
        }
        data.var_230c9a6c41607d0d = undefined;
        namespace_d8730aa891576e41::build_template(data.ai.var_cdb848190a1b2f99, data.model, data.vehicle, data.ai.classname);
        namespace_d8730aa891576e41::function_a82f8a25ad7e6b3f(data.var_f4eae2a1481b7dd3, data.ai.vehicleanimalias);
        namespace_d8730aa891576e41::function_ab7252da140c8fe7(unload_groups);
        if (var_5dec33f9548f94d6.size > 0) {
            namespace_d8730aa891576e41::function_423e10816a23372f(var_5dec33f9548f94d6);
        }
    }
    if (istrue(data.airdrop.var_e01db00d1ccb42ea)) {
        effect = loadfx(data.airdrop.vfx);
        level._effect[vehicleRef + "_land"] = effect;
        data.airdrop.effect = effect;
        data.airdrop.var_e25d1d189177a7c = vehicleRef + "_drop";
        level.scr_animtree["ac130"] = data.airdrop.var_d6dbd39dbd5ab5fc.animtree.id;
        level.scr_anim["ac130"][data.airdrop.var_e25d1d189177a7c] = data.airdrop.var_d6dbd39dbd5ab5fc.animname.id;
        level.scr_animtree["parachute"] = data.airdrop.var_6a32dee944eb39ad.animtree.id;
        level.scr_anim["parachute"][data.airdrop.var_e25d1d189177a7c] = data.airdrop.var_6a32dee944eb39ad.animname.id;
        level.scr_animtree[vehicleRef] = data.airdrop.var_96a21e181f0221f5.animtree.id;
        level.scr_anim[vehicleRef][data.airdrop.var_e25d1d189177a7c] = data.airdrop.var_96a21e181f0221f5.animname.id;
        if (isdefined(data.airdrop.var_b39c395cd7efe672) && isdefined(data.airdrop.var_b39c395cd7efe672.animname) && isdefined(data.airdrop.var_b39c395cd7efe672.animname.id)) {
            data.airdrop.var_150b11a4da8461bc = vehicleRef + "_follow_up";
            level.scr_anim[vehicleRef][data.airdrop.var_150b11a4da8461bc] = data.airdrop.var_b39c395cd7efe672.animname.id;
        }
        data.airdrop.var_d6dbd39dbd5ab5fc = undefined;
        data.airdrop.var_6a32dee944eb39ad = undefined;
        data.airdrop.var_96a21e181f0221f5 = undefined;
        data.airdrop.var_b39c395cd7efe672 = undefined;
    } else {
        data.airdrop = undefined;
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fff
// Size: 0x33
function function_29b4292c92443328(vehicleRef) {
    if (function_89dc39dc11f3988c(vehicleRef)) {
        return level.var_a0b2c978ca57ffc5[vehicleRef];
    } else {
        /#
            assertmsg("vehicle_getData: Attempted to get script bundle data for a vehicle that doesn't have it registered");
        #/
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4039
// Size: 0x26
function function_89dc39dc11f3988c(vehicleRef) {
    return isdefined(level.var_a0b2c978ca57ffc5) && isdefined(level.var_a0b2c978ca57ffc5[vehicleRef]);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4067
// Size: 0x13
function function_fa537f1ab52a76d1(vehicleRef) {
    return function_89dc39dc11f3988c(vehicleRef);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4082
// Size: 0x52
function vehicle_spawn(vehicleRef, spawndata, var_ee8da5624236dc89, vehicle) {
    if (issharedfuncdefined(vehicleRef, "spawn")) {
        return [[ getsharedfunc(vehicleRef, "spawn") ]](spawndata, var_ee8da5624236dc89);
    } else {
        return function_bba34cf920370ff4(vehicleRef, spawndata, var_ee8da5624236dc89, vehicle);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40db
// Size: 0x22f
function function_bba34cf920370ff4(vehicleRef, spawndata, var_ee8da5624236dc89, vehicle) {
    if (!function_fa537f1ab52a76d1(vehicleRef)) {
        /#
            if (istrue(level.var_4e89ea3291f12198)) {
                println("<unknown string>" + vehicleRef);
            }
        #/
        return undefined;
    } else {
        /#
            if (istrue(level.var_4e89ea3291f12198)) {
                println("<unknown string>" + vehicleRef);
            }
        #/
    }
    vehicledata = function_29b4292c92443328(vehicleRef);
    spawndata = function_37480e9c9c701cf2(vehicleRef, spawndata);
    if (isdefined(vehicle)) {
        vehicle.targetname = spawndata.targetname;
        spawndata.vehicletype = vehicle.vehicletype;
        vehicle.spawndata = spawndata;
    } else {
        vehicle = _spawnvehicle(spawndata, var_ee8da5624236dc89);
        if (!isdefined(vehicle)) {
            return undefined;
        }
    }
    vehicle_create(vehicle, vehicleRef, spawndata);
    vehicle.objweapon = makeweapon(function_7aaa7ae503292f43(vehicleRef));
    vehicle_compass_registerinstance(vehicle);
    vehicle_createlate(vehicle, spawndata);
    vehicle thread function_4a387c035eb677d0(istrue(vehicledata.var_941d95491d4d4817));
    if (!istrue(vehicledata.interact.var_c57febc7e53e3276)) {
        vehicle thread vehicle_watchflipped();
    }
    vehicle thread namespace_b479ac682b93cd92::function_c2b5282b537a56bc();
    if (istrue(vehicledata.var_941d95491d4d4817)) {
        vehicle function_481c2a63f2ba3332(-1, function_53c4c53197386572(level.var_df44f8cc05382071, 100));
    } else if (!vehicle function_784f000d59e38105()) {
        vehicle thread function_1b69321ff9937fc5();
    }
    if (issharedfuncdefined(vehicleRef, "create")) {
        [[ getsharedfunc(vehicleRef, "create") ]](vehicle);
    }
    if (utility::function_a10967d736dc56e5() && istrue(vehicledata.ai.var_289df80e1ded586f) && istrue(spawndata.var_f16652e1462a3739)) {
        vehicle function_810dfd134e9a7a04(vehicledata);
    }
    /#
        if (istrue(level.var_4e89ea3291f12198)) {
            println("<unknown string>" + vehicleRef);
        }
    #/
    if (issharedfuncdefined(vehicleRef, "onStartRiding") && issharedfuncdefined(vehicleRef, "onEndRiding")) {
        vehicle thread function_34d70aa8129b0d74();
    }
    return vehicle;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4312
// Size: 0x2f7
function function_fffe750fce66784(vehicleRef, spawndata, var_ee8da5624236dc89, var_dee73a1fa79b1b6d, donotwatchabandoned, mtx) {
    if (!function_fa537f1ab52a76d1(vehicleRef) || !istrue(function_29b4292c92443328(vehicleRef).var_fb41d1ca75009bf0.var_f2cf04c055fd760e)) {
        return undefined;
    }
    data = function_29b4292c92443328(vehicleRef);
    var_64a02a3ba94254d = data.var_fb41d1ca75009bf0.ref;
    spawndata = function_1cc780d5cac1e7cd(vehicleRef, spawndata, var_dee73a1fa79b1b6d);
    var_fb41d1ca75009bf0 = _spawnvehicle(spawndata, var_ee8da5624236dc89);
    if (!isdefined(var_fb41d1ca75009bf0)) {
        return undefined;
    }
    var_fb41d1ca75009bf0.var_b7148a3bfc4defb2 = 1;
    var_fb41d1ca75009bf0.var_5e7ed8e7a332998a = vehicleRef;
    vehicle_create(var_fb41d1ca75009bf0, var_64a02a3ba94254d, spawndata);
    var_fb41d1ca75009bf0.objweapon = makeweapon(function_6c17abf5c5d88ca(vehicleRef));
    var_fb41d1ca75009bf0.var_6dc04302da1a9d03 = spawndata.var_6dc04302da1a9d03;
    vehicle_createlate(var_fb41d1ca75009bf0, spawndata);
    if (issharedfuncdefined(var_64a02a3ba94254d, "create")) {
        [[ getsharedfunc(var_64a02a3ba94254d, "create") ]](var_fb41d1ca75009bf0);
    }
    var_fb41d1ca75009bf0 thread vehicle_spawn_watchabandoned();
    var_78ebf58592491d35 = function_89cda5ba9bfc8d56(vehicleRef);
    var_e85ce9ca904d8dfc = undefined;
    if (isdefined(mtx)) {
        var_fb41d1ca75009bf0.mtx = mtx;
        if (isdefined(mtx.var_c3606975ab404c5c) && mtx.var_c3606975ab404c5c != "") {
            var_e85ce9ca904d8dfc = mtx.var_c3606975ab404c5c;
        }
    }
    if (isdefined(var_78ebf58592491d35)) {
        foreach (struct in var_78ebf58592491d35) {
            if (isdefined(var_e85ce9ca904d8dfc) && var_fb41d1ca75009bf0 getscriptableparthasstate(struct.var_1fb6b56a662df98, var_e85ce9ca904d8dfc)) {
                var_fb41d1ca75009bf0 setscriptablepartstate(struct.var_1fb6b56a662df98, var_e85ce9ca904d8dfc);
            } else {
                var_fb41d1ca75009bf0 setscriptablepartstate(struct.var_1fb6b56a662df98, "on");
            }
        }
    }
    var_a7d11025c5cd54ec = function_aade62c6cf163888(vehicleRef);
    if (isdefined(var_a7d11025c5cd54ec)) {
        var_fb41d1ca75009bf0 function_e4fe23e19f4bf900(var_a7d11025c5cd54ec);
    }
    var_fb41d1ca75009bf0 function_cf63db12f07abf78(vehicleRef, var_fb41d1ca75009bf0.var_aab9695c92b0ed96);
    var_fb41d1ca75009bf0 namespace_b479ac682b93cd92::vehicle_huskLaunch(undefined, vehicleRef, spawndata, data.damage.var_d59ddc542fb76578);
    var_fb41d1ca75009bf0 function_1cd1ee312fd03bb4(1);
    var_fb41d1ca75009bf0 vehicleshowonminimap(0);
    if (var_fb41d1ca75009bf0 vehicle_isphysveh()) {
        var_fb41d1ca75009bf0 vehphys_crash();
        if (!var_fb41d1ca75009bf0 namespace_1f188a13f7e79610::function_7c62ca52f72901a1() && var_fb41d1ca75009bf0 function_76fa53e72547ff02()) {
            var_fb41d1ca75009bf0 function_b0af0dd0f9b4fddf(0);
        }
    } else {
        var_fb41d1ca75009bf0 namespace_1fbd40990ee60ede::function_887b4e2cbe3ab92c();
    }
    return var_fb41d1ca75009bf0;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4611
// Size: 0x2e
function function_d93ec4635290febd() {
    /#
        assert(isvehicle());
    #/
    if (function_b7148a3bfc4defb2()) {
        return self.var_5e7ed8e7a332998a;
    }
    return self.vehiclename;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4647
// Size: 0x1f
function function_9005b7fc076293f8() {
    if (isdefined(level.var_a0b2c978ca57ffc5)) {
        return getarraykeys(level.var_a0b2c978ca57ffc5);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x466d
// Size: 0x408
function vehicle_create(vehicle, vehicleRef, spawndata) {
    vehicle.vehiclename = vehicleRef;
    vehicle.maxhealth = function_53c4c53197386572(namespace_5a0f3ca265d3a4c8::vehicle_damage_getmaxhealth(vehicle, vehicleRef), 2147483647);
    vehicle.health = vehicle.maxhealth;
    vehicle.var_22aa4aa0cf0aa6bb = spawndata.var_22aa4aa0cf0aa6bb;
    vehicle setnodeploy(1);
    vehicle makeunusable();
    vehicle namespace_1fbd40990ee60ede::function_887b4e2cbe3ab92c();
    if (!vehicle function_b7148a3bfc4defb2()) {
        vehicledata = function_29b4292c92443328(vehicleRef);
        if (istrue(vehicledata.canfly)) {
            vehicle.isheli = 1;
        }
        vehicle namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_78fa8a2ff553f7c8);
        vehicle namespace_b6b4a3ac458ab6e2::function_aa823a31304ed981(&function_b92c4e2d8733661);
        vehicle namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&vehicle_empstartcallback);
        vehicle namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&vehicle_empclearcallback);
        if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
            vehicle [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_cdee8a729cb75935);
        }
        if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
            vehicle [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_200ff7f502669b34);
        }
    }
    if (vehicle vehicle_isphysveh()) {
        vehicle function_9a5e0e2d6d715bb1(!vehicle function_b7148a3bfc4defb2() && istrue(vehicledata.interact.var_18f075aaf63a3da));
    }
    if (!istrue(spawndata.var_f16652e1462a3739) && vehicle vehicle_isphysveh() && vehicle function_76fa53e72547ff02()) {
        vehicle function_65aa053c077c003a(1);
    }
    if (isdefined(spawndata.owner)) {
        namespace_1fbd40990ee60ede::vehicle_occupancy_setoriginalowner(vehicle, spawndata.owner);
    }
    if (isdefined(spawndata.team)) {
        namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(vehicle, spawndata.team);
    } else {
        namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(vehicle, "neutral");
    }
    if (isdefined(spawndata.mtx)) {
        namespace_1f188a13f7e79610::function_4201160d49c885a7(vehicle, function_19d89390ee87e7c2(vehicleRef, spawndata.mtx));
    }
    namespace_d325722f2754c2c4::setlockedoncallback(vehicle, &vehicle_lockedoncallback);
    namespace_d325722f2754c2c4::setlockedonremovedcallback(vehicle, &vehicle_lockedonremovedcallback);
    namespace_d325722f2754c2c4::setincomingcallback(vehicle, &vehicle_incomingcallback);
    namespace_d325722f2754c2c4::setincomingremovedcallback(vehicle, &vehicle_incomingremovedcallback);
    namespace_d325722f2754c2c4::function_53fd22613ea65204(vehicle, &function_a2d1400bcf46869a);
    namespace_d325722f2754c2c4::function_b55a664e824540d2(vehicle, &function_a2d1400bcf46869a);
    namespace_1fbd40990ee60ede::vehicle_occupancy_registerinstance(vehicle);
    namespace_141c4634b6ea7b27::function_a203f8033eeb57f1(vehicleRef, vehicle);
    vehicle namespace_2ca3a93161121e96::assign_unique_id();
    var_620e3a366fb95fcf = isdefined(level.var_620e3a366fb95fcf) && level.var_620e3a366fb95fcf;
    var_b6ffe24870282af2 = isdefined(vehicle.spawndata.var_b6ffe24870282af2) && vehicle.spawndata.var_b6ffe24870282af2;
    if ((function_a10967d736dc56e5() || isnavmeshloaded()) && !var_620e3a366fb95fcf && !var_b6ffe24870282af2) {
        if (istrue(vehicle.isheli) && !istrue(spawndata.var_f16652e1462a3739)) {
            vehicle thread namespace_b479ac682b93cd92::vehicle_ai_avoidance_heli();
        } else if (!istrue(vehicle.isheli)) {
            vehicle thread namespace_b479ac682b93cd92::vehicle_ai_avoidance_logic();
        }
    }
    if ((!iscp() || !istrue(spawndata.disableusabilityatspawn)) && !vehicle function_b7148a3bfc4defb2()) {
        namespace_141c4634b6ea7b27::vehicle_interact_registerinstance(vehicle);
    }
    function_f3bb4f4911a1beb2("vehicle", "create", vehicle, spawndata);
    /#
        function_f3bb4f4911a1beb2("<unknown string>", "<unknown string>", spawndata.vehicletype, vehicleRef, undefined, spawndata.modelname, spawndata.targetname, undefined, undefined, spawndata.origin);
    #/
    thread vehicle_update(vehicle);
    thread namespace_f3f7309ba50e9927::vehicle_collision_updateinstance(vehicle);
    /#
        if (getdvarint(@"hash_9824088677b15053", 0) == 1) {
            vehicle thread function_b4896044b6e0d565();
        }
    #/
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a7c
// Size: 0x80
function vehicle_createlate(vehicle, spawndata) {
    vehicle namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage(1);
    namespace_5a0f3ca265d3a4c8::function_268e0e5863858dcf(vehicle, spawndata);
    namespace_f64231d5b7a2c3c4::vehicle_tracking_registerinstance(vehicle, spawndata.owner, spawndata.team);
    namespace_d28769d7bb5c026b::vehicle_dlog_spawnevent(vehicle, spawndata.spawntype);
    if (issharedfuncdefined("vehicle", "createLate")) {
        [[ getsharedfunc("vehicle", "createLate") ]](vehicle, spawndata);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b03
// Size: 0x7b
function vehicle_explode(data, immediate) {
    callback::callback("vehicle_explode");
    if (isvehicledestroyed()) {
        return;
    }
    if (issharedfuncdefined(self.vehiclename, "explode")) {
        [[ getsharedfunc(self.vehiclename, "explode") ]](data, immediate);
    } else if (function_b7148a3bfc4defb2()) {
        function_e3ff0a92ad2bf58d(data, immediate);
    } else {
        function_9672da471530b44a(data, immediate);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b85
// Size: 0x5d
function function_f7af4d1c91ca6e2f() {
    self function_6a325f91941ed47c("p2p");
    self vehicle_cleardrivingstate();
    self function_247ad6a91f6a4ffe(0);
    while (1) {
        attacker = amount = self waittill("damage");
        if (isplayer(attacker)) {
            continue;
        }
        break;
    }
    vehicle_explode(undefined, 1);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4be9
// Size: 0x4c
function function_e3ff0a92ad2bf58d(data, immediate) {
    if (isvehicledestroyed()) {
        return;
    }
    vehicle_damage_clearvisuals(undefined, undefined, 1);
    self setscriptablepartstate("visibility", "hide", 0);
    thread vehicle_death(self);
    thread function_d0df49de517ded03();
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c3c
// Size: 0x118
function function_9672da471530b44a(data, immediate) {
    if (isvehicledestroyed()) {
        return;
    }
    if (!isdefined(data)) {
        data = spawnstruct();
        data.inflictor = self;
        data.objweapon = function_7aaa7ae503292f43(self.vehiclename);
        data.meansofdeath = "MOD_EXPLOSIVE";
    }
    vehicle_damage_ondeathscore(data);
    function_afe012d734bd72c7(data);
    vehicle_occupancy_killoccupants(self, data);
    thread vehicle_death(self, data);
    thread function_d0df49de517ded03();
    if (isdefined(data.attacker)) {
        var_ee8ef5ba92ab121d = namespace_141c4634b6ea7b27::vehicle_interact_getleveldataforvehicle(function_d93ec4635290febd()).var_ee8ef5ba92ab121d;
        if (!isdefined(var_ee8ef5ba92ab121d) || var_ee8ef5ba92ab121d == "") {
            var_ee8ef5ba92ab121d = "generic";
        }
        if (issharedfuncdefined("sound", "trySayLocalSound")) {
            level thread [[ getsharedfunc("sound", "trySayLocalSound") ]](data.attacker, function_2ef675c13ca1c4af(#"hash_748c50aa6182ec4b", var_ee8ef5ba92ab121d));
        }
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d5b
// Size: 0x33c
function vehicle_death(vehicle, damagedata) {
    if (vehicle isvehicledestroyed()) {
        return;
    }
    vehicleRef = vehicle function_d93ec4635290febd();
    var_f2cf04c055fd760e = istrue(function_29b4292c92443328(vehicleRef).var_fb41d1ca75009bf0.var_f2cf04c055fd760e);
    if (vehicle function_b7148a3bfc4defb2()) {
        namespace_5a0f3ca265d3a4c8::function_ec4b6f058d183338(vehicle);
    }
    var_dee73a1fa79b1b6d = vehicle.vehicletype;
    mtx = vehicle.mtx;
    killer = undefined;
    if (isdefined(damagedata)) {
        killer = damagedata.attacker;
    }
    vehicle vehicle_deletenextframe(vehicle, killer);
    if (issharedfuncdefined(vehicleRef, "delete")) {
        vehicle [[ getsharedfunc(vehicleRef, "delete") ]](vehicle);
    }
    if (issharedfuncdefined(vehicleRef, "onEndRiding") && isdefined(vehicle.var_8784c427b1af24a6)) {
        onEndRiding = getsharedfunc(vehicleRef, "onEndRiding");
        foreach (player in vehicle.var_8784c427b1af24a6) {
            if (isdefined(player)) {
                vehicle [[ onEndRiding ]](player);
            }
        }
    }
    oldspawndata = namespace_f64231d5b7a2c3c4::getvehiclespawndata(vehicle);
    if (isdefined(oldspawndata) && istrue(oldspawndata.var_f16652e1462a3739)) {
        if (isdefined(self.riders)) {
            foreach (g in self.riders) {
                if (isdefined(damagedata) && isdefined(damagedata.attacker) && isplayer(damagedata.attacker)) {
                    namespace_14d36171baccf528::agentPers_setAgentPersData(g, "vehicleKiller", damagedata.attacker);
                    damagedata.attacker thread namespace_53fc9ddbb516e6e1::function_e800498086e36c29(#"kill", damagedata.objweapon, undefined, undefined, g, undefined, undefined, 1, undefined, 1);
                }
            }
        }
        vehicle namespace_3bb9da687f15383d::delete_riders();
    }
    waitframe();
    spawndata = undefined;
    if (var_f2cf04c055fd760e && !istrue(vehicle.var_a8f4bb03b366aa80)) {
        spawndata = vehicle function_75ce57f81b582b38(vehicle, vehicleRef);
    }
    vehicle vehicle_deletenextframelate(vehicle);
    var_fb41d1ca75009bf0 = undefined;
    if (!vehicle function_b7148a3bfc4defb2() && var_f2cf04c055fd760e && !istrue(vehicle.var_a8f4bb03b366aa80)) {
        var_fb41d1ca75009bf0 = function_fffe750fce66784(vehicleRef, spawndata, undefined, var_dee73a1fa79b1b6d, vehicle.donotwatchabandoned, mtx);
    }
    if (isdefined(var_fb41d1ca75009bf0)) {
        oldspawndata notify("husk_spawn", var_fb41d1ca75009bf0);
    } else {
        oldspawndata notify("husk_failed");
    }
    if (isdefined(vehicle.reactivearmorexplosion)) {
        vehicle.reactivearmorexplosion delete();
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x509e
// Size: 0x47
function function_12f5a0e2344c10c5() {
    /#
        assert(isdefined(self) && isdefined(self.spawndata));
    #/
    self.spawndata endon("husk_failed");
    var_fb41d1ca75009bf0 = self.spawndata waittill("husk_spawn");
    return var_fb41d1ca75009bf0;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x50ed
// Size: 0x224
function private vehicle_deletenextframe(vehicle, killer) {
    if (istrue(vehicle.isdestroyed)) {
        return;
    }
    vehicle notify("death", killer);
    vehicle.isdestroyed = 1;
    var_13b6736eaafaa9e4 = getdvarint(@"hash_6f41bda368c6075f", 0);
    if (var_13b6736eaafaa9e4) {
        if (isdefined(vehicle.var_5bc44078588a197f)) {
            foreach (turret in vehicle.var_5bc44078588a197f) {
                if (isdefined(turret)) {
                    turret unlink();
                    turret notify("kill_turret");
                }
            }
            vehicle.var_5bc44078588a197f = undefined;
        }
    }
    if (vehicle_spawn_gamemodesupportsrespawn() && !istrue(vehicle.var_22aa4aa0cf0aa6bb)) {
        ref = vehicle function_d93ec4635290febd();
        var_f2cf04c055fd760e = istrue(function_29b4292c92443328(ref).var_fb41d1ca75009bf0.var_f2cf04c055fd760e);
        if ((vehicle function_b7148a3bfc4defb2() || !var_f2cf04c055fd760e || istrue(vehicle.var_a8f4bb03b366aa80)) && issharedfuncdefined(ref, "onDeathRespawn")) {
            vehicle thread [[ getsharedfunc(ref, "onDeathRespawn") ]]();
        } else if (vehicle function_b7148a3bfc4defb2()) {
            vehicle thread function_fa044e2304e9e1a4();
        } else if (!var_f2cf04c055fd760e || istrue(vehicle.var_a8f4bb03b366aa80)) {
            vehicle thread function_284795e4a9e3762c();
        }
    }
    vehicle namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage(0);
    vehicle setnonstick(1);
    namespace_d325722f2754c2c4::clearlockedon(vehicle);
    vehicle namespace_5a51aa78ea0b1b9f::clear_emp(1);
    namespace_2a495135d56d95b7::vehicle_compass_hide(vehicle);
    namespace_5a0f3ca265d3a4c8::vehicle_damage_deregisterinstance(vehicle);
    namespace_141c4634b6ea7b27::vehicle_interact_deregisterinstance(vehicle);
    namespace_f64231d5b7a2c3c4::vehicle_tracking_deregisterinstance(vehicle);
    namespace_6c0d09f1e6fc2bc5::battle_tracks_stopbattletrackstoalloccupants(vehicle);
    if (issharedfuncdefined("vehicle", "deleteNextFrame")) {
        [[ getsharedfunc("vehicle", "deleteNextFrame") ]](vehicle);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5318
// Size: 0xac
function vehicle_deletenextframelate(vehicle) {
    if (!isdefined(vehicle)) {
        return;
    }
    namespace_1fbd40990ee60ede::vehicle_occupancy_deregisterinstance(vehicle);
    if (issharedfuncdefined("vehicle", "deleteNextFrameLate")) {
        [[ getsharedfunc("vehicle", "deleteNextFrameLate") ]](vehicle);
    }
    turrets = vehicle_getturrets(vehicle);
    if (isdefined(turrets)) {
        foreach (turret in turrets) {
            turret delete();
        }
    }
    namespace_f64231d5b7a2c3c4::_deletevehicle(vehicle);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53cb
// Size: 0x93
function function_afe012d734bd72c7(data) {
    vehicleRef = function_d93ec4635290febd();
    if (isdefined(vehicleRef) && isdefined(data)) {
        vehicledata = vehicle_damage_getleveldataforvehicle(vehicleRef);
        if (isdefined(vehicledata) && isdefined(vehicledata.var_45c7e4f315c93c29) && istrue(vehicledata.var_45c7e4f315c93c29) && issharedfuncdefined("killstreak", "processScrapAssist")) {
            self thread [[ getsharedfunc("killstreak", "processScrapAssist") ]](data.attacker);
        }
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5465
// Size: 0x188
function vehicle_update(vehicle) {
    vehicle notify("vehicle_update");
    vehicle endon("vehicle_update");
    level endon("game_ended");
    /#
        namespace_7f5956e577370452::function_82b422f2ec92a2b7(vehicle.vehiclename, vehicle);
    #/
    if (vehicle function_b7148a3bfc4defb2()) {
        return;
    }
    var_bd169af9b46727ef = istrue(namespace_84cff6185e39aa66::vehomn_getleveldataforvehicle(vehicle function_d93ec4635290febd()).var_bd169af9b46727ef);
    var_79a9bb156a8ef2bf = isdefined(vehicle.mtx) && isdefined(vehicle.mtx.vehicletrail) && vehicle.mtx.vehicletrail != "";
    canfly = vehicle namespace_1f188a13f7e79610::vehiclecanfly();
    var_79f057db79dd500 = issharedfuncdefined(vehicle.vehiclename, "update");
    updatefunc = undefined;
    if (var_79f057db79dd500) {
        updatefunc = getsharedfunc(vehicle.vehiclename, "update");
    }
    if (!var_bd169af9b46727ef && !var_79a9bb156a8ef2bf && !var_79f057db79dd500) {
        return;
    }
    while (isdefined(vehicle) && !istrue(vehicle.isdestroyed)) {
        if (var_bd169af9b46727ef) {
            namespace_84cff6185e39aa66::vehomn_updateomnvarsperframe(vehicle);
        }
        if (var_79a9bb156a8ef2bf) {
            var_79a9bb156a8ef2bf = vehicle_checktrailvfx(vehicle, canfly);
            if (!var_79a9bb156a8ef2bf && !var_bd169af9b46727ef && !var_79f057db79dd500) {
                return;
            }
        }
        if (var_79f057db79dd500) {
            data = spawnstruct();
            vehicle [[ updatefunc ]](data);
        }
        waitframe();
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55f4
// Size: 0x1a5
function vehicle_checktrailvfx(vehicle, canfly) {
    /#
        assert(isdefined(vehicle.mtx) && isdefined(vehicle.mtx.vehicletrail));
    #/
    trail = vehicle.mtx.vehicletrail;
    if (isdefined(vehicle.mtx.var_87cc39e9260d5bcf)) {
        var_3dacbf7b6cb2caf5 = vehicle.mtx.var_87cc39e9260d5bcf;
    } else {
        var_3dacbf7b6cb2caf5 = 1;
    }
    if (isdefined(vehicle.velocity)) {
        velocity = vehicle.velocity;
        speed = length(vehicle.velocity);
    } else {
        velocity = vehicle vehicle_getvelocity();
        speed = vehicle vehicle_getspeed();
    }
    forward = anglestoforward(vehicle.angles);
    state = vehicle getscriptablepartstate("trail");
    if (state == "disabled") {
        return 0;
    }
    if (canfly && isdefined(vehicle_occupancy_getdriver(vehicle))) {
        newstate = trail;
    } else if (speed > var_3dacbf7b6cb2caf5 && vectordot(velocity, forward) >= 0) {
        newstate = trail;
    } else {
        newstate = trail + "_idle";
    }
    if (state == newstate) {
        return 1;
    }
    if (vehicle getscriptableparthasstate("trail", newstate)) {
        vehicle setscriptablepartstate("trail", newstate);
    }
    return 1;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57a1
// Size: 0xe7
function vehicle_registerturret(vehicle, entity, objweapon, var_d112d057a062ee5e) {
    if (!isdefined(entity.objweapon)) {
        entity.objweapon = objweapon;
    }
    if (!isdefined(vehicle.turrets)) {
        vehicle.turrets = [];
    }
    weaponname = undefined;
    if (isstring(objweapon)) {
        weaponname = objweapon;
    } else {
        weaponname = objweapon.basename;
    }
    vehicle.turrets[weaponname] = entity;
    childoutlineents = vehicle.childoutlineents;
    if (!isdefined(childoutlineents)) {
        childoutlineents = [0:vehicle];
    }
    if (!array_contains(childoutlineents, entity)) {
        childoutlineents = array_add(childoutlineents, entity);
    }
    vehicle.childoutlineents = childoutlineents;
    if (istrue(var_d112d057a062ee5e)) {
        thread vehicle_trackturretprojectile(vehicle, entity);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x588f
// Size: 0xb0
function vehicle_deregisterturret(vehicle, objweapon) {
    if (!isdefined(vehicle.turrets)) {
        return;
    }
    weaponname = undefined;
    if (isstring(objweapon)) {
        weaponname = objweapon;
    } else {
        weaponname = objweapon.basename;
    }
    entity = vehicle.turrets[weaponname];
    vehicle.turrets[weaponname] = undefined;
    if (isdefined(entity)) {
        childoutlineents = vehicle.childoutlineents;
        if (isdefined(childoutlineents)) {
            childoutlineents = array_remove(childoutlineents, entity);
            vehicle.childoutlineents = childoutlineents;
        }
        entity notify("vehicle_trackTurretProjectile");
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5946
// Size: 0x5a
function vehicle_getturretbyweapon(vehicle, objweapon) {
    if (!isdefined(vehicle.turrets)) {
        return undefined;
    }
    weaponname = undefined;
    if (isstring(objweapon)) {
        weaponname = objweapon;
    } else {
        weaponname = objweapon.basename;
    }
    return vehicle.turrets[weaponname];
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59a8
// Size: 0x35
function vehicle_getturrets(vehicle) {
    turrets = [];
    if (isdefined(vehicle.turrets)) {
        turrets = vehicle.turrets;
    }
    return turrets;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59e5
// Size: 0x57
function vehicle_trackturretprojectile(vehicle, entity) {
    entity endon("death");
    entity notify("vehicle_trackTurretProjectile");
    entity endon("vehicle_trackTurretProjectile");
    while (1) {
        missile = entity waittill("missile_fire");
        if (isdefined(missile)) {
            missile.vehicle = vehicle;
        }
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a43
// Size: 0xcd
function vehicle_isfriendlytoplayer(vehicle, player) {
    if (namespace_1fbd40990ee60ede::vehicle_occupancy_instanceisregistered(vehicle)) {
        return namespace_1fbd40990ee60ede::vehicle_occupancy_isfriendlytoplayer(vehicle, player);
    } else if (level.teambased) {
        team = vehicle.team;
        if (!isdefined(team) || team == "neutral") {
            if (isdefined(vehicle.owner)) {
                vehicle.team = vehicle.owner.team;
            }
        }
        if (!isdefined(team)) {
            return 0;
        }
        return (vehicle.team == player.team);
    } else {
        return (isdefined(vehicle.owner) && vehicle.owner == player);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b17
// Size: 0xcd
function vehicle_isenemytoplayer(vehicle, player) {
    if (namespace_1fbd40990ee60ede::vehicle_occupancy_instanceisregistered(vehicle)) {
        return namespace_1fbd40990ee60ede::vehicle_occupancy_isenemytoplayer(vehicle, player);
    } else if (level.teambased) {
        team = vehicle.team;
        if (!isdefined(team) || team == "neutral") {
            if (isdefined(vehicle.owner)) {
                vehicle.team = vehicle.owner.team;
            }
        }
        if (!isdefined(team)) {
            return 0;
        }
        return (vehicle.team != player.team);
    } else {
        return (isdefined(vehicle.owner) && vehicle.owner != player);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5beb
// Size: 0x7a
function vehicle_isneutraltoplayer(vehicle, player) {
    if (namespace_1fbd40990ee60ede::vehicle_occupancy_instanceisregistered(vehicle)) {
        return namespace_1fbd40990ee60ede::vehicle_occupancy_isneutraltoplayer(vehicle, player);
    } else if (level.teambased) {
        return ((!isdefined(vehicle.team) || vehicle.team == "neutral") && !isdefined(vehicle.owner));
    } else {
        return !isdefined(vehicle.owner);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c6c
// Size: 0x56
function vehicle_isfriendlytoteam(vehicle, team) {
    if (namespace_1fbd40990ee60ede::vehicle_occupancy_instanceisregistered(vehicle)) {
        return namespace_1fbd40990ee60ede::vehicle_occupancy_isfriendlytoteam(vehicle, team);
    } else {
        if (level.teambased) {
            return (isdefined(vehicle.team) && vehicle.team == team);
        }
        return undefined;
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5cc9
// Size: 0x56
function vehicle_isenemytoteam(vehicle, team) {
    if (namespace_1fbd40990ee60ede::vehicle_occupancy_instanceisregistered(vehicle)) {
        return namespace_1fbd40990ee60ede::vehicle_occupancy_isenemytoteam(vehicle, team);
    } else {
        if (level.teambased) {
            return (isdefined(vehicle.team) && vehicle.team != team);
        }
        return undefined;
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5d26
// Size: 0x5b
function vehicle_isneutraltoteam(vehicle, team) {
    if (namespace_1fbd40990ee60ede::vehicle_occupancy_instanceisregistered(vehicle)) {
        return namespace_1fbd40990ee60ede::vehicle_occupancy_isneutraltoteam(vehicle, team);
    } else {
        if (level.teambased) {
            return (!isdefined(vehicle.team) || vehicle.team == "neutral");
        }
        return undefined;
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d88
// Size: 0x53
function vehicle_getteamfriendlyto(vehicle) {
    if (namespace_1fbd40990ee60ede::vehicle_occupancy_instanceisregistered(vehicle)) {
        return namespace_1fbd40990ee60ede::vehicle_occupancy_getteamfriendlyto(vehicle);
    } else {
        if (isdefined(vehicle.team) && vehicle.team != "neutral") {
            return vehicle.team;
        }
        return undefined;
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5de2
// Size: 0x13b
function vehicle_docollisiondamagetoplayer(vehicle, player, force) {
    isenemy = vehicle_occupancy_isenemytoplayer(vehicle, player);
    if (istrue(force) || isenemy) {
        var_ade894a502513a02 = istrue(player.inlaststand);
        var_fcdf19e3cdd29669 = player.health;
        if (isdefined(vehicle.objweapon)) {
            level.var_52f65a03eff3d1a2 = "MOD_EXPLOSIVE";
        }
        attacker = undefined;
        if (!isenemy) {
            attacker = player;
        } else if (isdefined(vehicle.streakinfo)) {
            attacker = function_53c4c53197386572(vehicle.owner, player);
        } else {
            attacker = function_53c4c53197386572(namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(vehicle), player);
        }
        player dodamage(1000, vehicle.origin, attacker, vehicle, "MOD_CRUSH", vehicle.objweapon);
        level.var_52f65a03eff3d1a2 = undefined;
        if (!isalive(player)) {
            return 1;
        }
        if (!var_ade894a502513a02 && istrue(player.inlaststand)) {
            return 1;
        }
        if (var_fcdf19e3cdd29669 > player.health) {
            return 1;
        }
    }
    return 0;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f25
// Size: 0x72
function vehicle_preventplayercollisiondamagefortimeafterexit(vehicle, player) {
    player endon("disconnect");
    player notify("vehicle_preventPlayerCollisionDamageForTimeAfterExit");
    player endon("vehicle_preventPlayerCollisionDamageForTimeAfterExit");
    player.vehiclecollisionignorearray = [];
    player.vehiclecollisionignorearray["inflictor"] = vehicle;
    player.vehiclecollisionignorearray["meansOfDeath"] = "MOD_CRUSH";
    vehicle_preventplayercollisiondamagefortimeafterexitinternal(player);
    thread vehicle_clearpreventplayercollisiondamagefortimeafterexit(player);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f9e
// Size: 0x7e
function vehicle_preventplayercollisiondamagefortimeafterexitinternal(player) {
    player endon("death");
    if (isdefined(level.vehicle) && isdefined(level.vehicle.occupancy) && isdefined(level.vehicle.occupancy.var_772978c4701134fc)) {
        wait(level.vehicle.occupancy.var_772978c4701134fc);
    } else {
        wait(4);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6023
// Size: 0x1f
function vehicle_clearpreventplayercollisiondamagefortimeafterexit(player) {
    player notify("vehicle_preventPlayerCollisionDamageForTimeAfterExit");
    player.vehiclecollisionignorearray = undefined;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6049
// Size: 0x84
function vehicle_playershouldignorecollisiondamage(inflictor, victim, meansofdeath, objweapon) {
    if (!isdefined(victim.vehiclecollisionignorearray)) {
        return 0;
    }
    if (!isdefined(inflictor)) {
        return 0;
    }
    if (isdefined(victim.vehiclecollisionignorearray["inflictor"]) && inflictor != victim.vehiclecollisionignorearray["inflictor"]) {
        return 0;
    }
    if (meansofdeath != victim.vehiclecollisionignorearray["meansOfDeath"]) {
        return 0;
    }
    return 1;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60d5
// Size: 0x247
function vehicle_isRubbingAgainstVehicle(inflictor, victim, smeansofdeath) {
    if (!isdefined(smeansofdeath) || smeansofdeath != "MOD_CRUSH") {
        return 0;
    }
    if (!isdefined(victim) || !isdefined(victim.origin)) {
        return 0;
    }
    if (!isdefined(inflictor) || !isdefined(inflictor.origin) || !isdefined(inflictor.angles)) {
        return 0;
    }
    if (!inflictor isvehicle() || inflictor.vehiclename == "cargo_train" || !isent(inflictor)) {
        return 0;
    }
    vehicleRef = inflictor function_d93ec4635290febd();
    if (!function_89dc39dc11f3988c(vehicleRef)) {
        return 0;
    }
    data = function_29b4292c92443328(vehicleRef);
    if (istrue(data.canfly) || istrue(data.var_941d95491d4d4817)) {
        return 0;
    }
    if (!isdefined(data.occupancy) || !isdefined(data.occupancy.exitextents)) {
        return 0;
    }
    if (!inflictor vehicle_isonground()) {
        return 0;
    }
    if (inflictor vehicle_getspeed() < 1) {
        return 0;
    }
    extents = data.occupancy.exitextents;
    if (!isdefined(extents["front"]) || !isdefined(extents["back"])) {
        return 0;
    }
    forward = anglestoforward(inflictor.angles);
    moving = inflictor vehicle_getvelocity();
    var_8423818ecf85a883 = math::anglebetweenvectors(forward, moving);
    var_801901a9fb6cdc30 = undefined;
    if (var_8423818ecf85a883 < 45) {
        var_801901a9fb6cdc30 = 1;
    } else if (var_8423818ecf85a883 > 135) {
        var_801901a9fb6cdc30 = 0;
    } else {
        return 0;
    }
    var_ea3b9640a6ad3c8e = coordtransformtranspose(victim.origin, inflictor.origin, inflictor.angles);
    if (var_801901a9fb6cdc30 && var_ea3b9640a6ad3c8e[0] < extents["front"] - 30) {
        return 1;
    }
    if (!var_801901a9fb6cdc30 && var_ea3b9640a6ad3c8e[0] > -1 * (extents["back"] - 30)) {
        return 1;
    }
    return 0;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6324
// Size: 0x5c
function function_4687f4da72911323(var_642470e1abc1bbf9) {
    if (!isdefined(var_642470e1abc1bbf9.meansofdeath) || var_642470e1abc1bbf9.meansofdeath != "MOD_CRUSH") {
        return 0;
    }
    if (!isdefined(var_642470e1abc1bbf9.inflictor) || !var_642470e1abc1bbf9.inflictor isvehicle()) {
        return 0;
    }
    return 1;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6388
// Size: 0x5a
function function_107efd42d596b2d3(var_642470e1abc1bbf9) {
    return isdismembermentenabled() && !istrue(var_642470e1abc1bbf9.victim.liveRagdoll) && istrue(var_642470e1abc1bbf9.inflictor.isheli) && var_642470e1abc1bbf9.damage == 999999;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63ea
// Size: 0x65
function vehicle_playerkilledbycollision(var_642470e1abc1bbf9) {
    if (!function_4687f4da72911323(var_642470e1abc1bbf9)) {
        return;
    }
    if (function_107efd42d596b2d3(var_642470e1abc1bbf9)) {
        thread vehicle_playerkilledfx(var_642470e1abc1bbf9.victim);
    } else {
        playsoundatpos(var_642470e1abc1bbf9.victim.origin + (0, 0, 18), "vehicle_body_hit");
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6456
// Size: 0x113
function vehicle_playerkilledfx(victim) {
    var_13f57e11d55f32d4 = 35;
    victim.nocorpse = 1;
    playsoundatpos(victim.origin + (0, 0, 18), "vehicle_body_hit");
    players = getdismembermentlist();
    if (players.size < var_13f57e11d55f32d4) {
        fxent = spawn("script_model", victim gettagorigin("j_mainroot"));
        fxent.angles = victim.angles;
        fxent setmodel("iw9_player_death_fx");
        fxent setscriptablepartstate("effects", "gib", 0);
        foreach (player in players) {
            fxent hidefromplayer(player);
        }
        wait(0.5);
        fxent delete();
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6570
// Size: 0x137
function function_1b69321ff9937fc5() {
    level endon("game_ended");
    self endon("death");
    ref = function_d93ec4635290febd();
    istank = ref == "light_tank" || ref == "veh9_cougar" || ref == "veh_jup_razorback";
    interactdata = namespace_141c4634b6ea7b27::vehicle_interact_getleveldataforvehicle(ref);
    var_f9f7db3dd47e1280 = interactdata.var_f9f7db3dd47e1280;
    while (1) {
        self waittill("floating");
        while (self function_100d3bf35fca6a7f() > 0.01) {
            endtime = gettime() + 1000 * var_f9f7db3dd47e1280;
            while (1) {
                waitframe();
                if (!function_9502aa416ccd1247()) {
                    break;
                }
                if (gettime() >= endtime) {
                    break;
                }
            }
            if (function_9502aa416ccd1247()) {
                self.flipped = 1;
                if (self vehicle_isphysveh()) {
                    self function_b0af0dd0f9b4fddf(0);
                }
                namespace_1fbd40990ee60ede::vehicle_occupancy_allowspawninto(self, 0);
                namespace_141c4634b6ea7b27::vehicle_interact_allowvehicleuse(self, 0);
                namespace_1fbd40990ee60ede::vehicle_occupancy_allowmovement(self, 0);
                if (!istank) {
                    wait(5);
                }
                namespace_1fbd40990ee60ede::vehicle_occupancy_ejectalloccupants(self);
                namespace_1fbd40990ee60ede::function_d0092c44c5588870();
                wait(ter_op(istank, 10, 25));
                thread function_357783d7c1d96273();
                return;
            }
        }
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66ae
// Size: 0x6d
function function_4a387c035eb677d0(var_941d95491d4d4817) {
    level endon("game_ended");
    self endon("death");
    self waittill("veh_submerged");
    self.flipped = 1;
    namespace_1fbd40990ee60ede::vehicle_occupancy_allowspawninto(self, 0);
    namespace_141c4634b6ea7b27::vehicle_interact_allowvehicleuse(self, 0);
    namespace_1fbd40990ee60ede::vehicle_occupancy_allowmovement(self, 0);
    if (!var_941d95491d4d4817) {
        wait(1);
    }
    namespace_1fbd40990ee60ede::vehicle_occupancy_ejectalloccupants(self);
    namespace_1fbd40990ee60ede::function_d0092c44c5588870();
    if (!var_941d95491d4d4817) {
        wait(15);
    }
    thread function_357783d7c1d96273();
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6722
// Size: 0x23d
function vehicle_watchflipped() {
    self endon("death");
    self endon("flipped_end");
    level endon("game_ended");
    ref = function_d93ec4635290febd();
    var_6397176a090f7aca = undefined;
    if (issharedfuncdefined(ref, "flippedStart")) {
        var_6397176a090f7aca = getsharedfunc(ref, "flippedStart");
    }
    var_267aaef67672447f = &vehicle_flippedendcallback;
    if (issharedfuncdefined(ref, "flippedEnd")) {
        var_267aaef67672447f = getsharedfunc(ref, "flippedEnd");
    }
    data = vehicle_interact_getleveldataforvehicle(ref);
    var_ba70a83be9b6b59c = data.var_ba70a83be9b6b59c;
    var_b1fc50342f9a99dd = data.var_b1fc50342f9a99dd;
    var_6ef53048a884f4e0 = 0;
    starttime = undefined;
    endtime = undefined;
    while (1) {
        wait(1);
        var_d1d371436301d73 = 0;
        angle = namespace_d3f3cb0a543667c1::anglebetweenvectorsunit((0, 0, 1), anglestoup(self.angles));
        if (angle > var_b1fc50342f9a99dd) {
            var_d1d371436301d73 = 1;
            starttime = undefined;
        } else if (angle > var_ba70a83be9b6b59c) {
            if (!isdefined(starttime)) {
                starttime = gettime() + 3000;
            }
            if (gettime() > starttime) {
                var_d1d371436301d73 = 1;
                starttime = undefined;
            }
        } else {
            if (var_6ef53048a884f4e0) {
                namespace_1fbd40990ee60ede::vehicle_occupancy_allowspawninto(self, 1);
                namespace_141c4634b6ea7b27::vehicle_interact_allowvehicleuse(self, 1);
                var_6ef53048a884f4e0 = 0;
            }
            var_d1d371436301d73 = 0;
            starttime = undefined;
        }
        if (var_d1d371436301d73) {
            if (isdefined(var_6397176a090f7aca)) {
                thread [[ var_6397176a090f7aca ]](self);
            }
            if (!var_6ef53048a884f4e0) {
                namespace_1fbd40990ee60ede::vehicle_occupancy_allowspawninto(self, 0);
                namespace_141c4634b6ea7b27::vehicle_interact_allowvehicleuse(self, 0);
                var_6ef53048a884f4e0 = 1;
            }
            if (getdvarint(@"hash_ce3ffd0926397091", 0) == 1) {
                namespace_1fbd40990ee60ede::vehicle_occupancy_ejectalloccupants(self);
            }
            timedout = 0;
            endtime = gettime() + 3000;
            while (1) {
                waitframe();
                angle = namespace_d3f3cb0a543667c1::anglebetweenvectorsunit((0, 0, 1), anglestoup(self.angles));
                if (angle <= var_ba70a83be9b6b59c) {
                    break;
                }
                if (gettime() >= endtime) {
                    timedout = 1;
                    break;
                }
            }
            endtime = undefined;
            if (isdefined(var_267aaef67672447f)) {
                thread [[ var_267aaef67672447f ]](self, timedout);
            }
        }
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6966
// Size: 0x3f
function vehicle_flippedendcallback(vehicle, timedout) {
    if (timedout && !istrue(vehicle.flipped)) {
        vehicle.flipped = 1;
        vehicle thread function_357783d7c1d96273();
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x69ac
// Size: 0x61
function vehicle_deletecollmapvehicles() {
    level notify("vehicle_deleteCollmapVehicles");
    level endon("vehicle_deleteCollmapVehicles");
    wait(1);
    vehicles = getentarray("delete_me", "targetname");
    if (isdefined(vehicles) && vehicles.size > 0) {
        for (i = vehicles.size - 1; i >= 0; i--) {
            vehicles[i] delete();
        }
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a14
// Size: 0x13e
function function_78fa8a2ff553f7c8(data) {
    vehicle = data.victim;
    if (istrue(vehicle.var_12bfb031c0a0efd8) || istrue(vehicle.var_4970cb0edef7623b)) {
        return;
    }
    vehicle.var_12bfb031c0a0efd8 = 1;
    if (isdefined(data) && isdefined(data.attacker)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ namespace_3c37cb17ade254d::getsharedfunc("player", "doScoreEvent") ]]("emped_vehicle");
        }
    }
    occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(vehicle, 0);
    namespace_84cff6185e39aa66::vehomn_showwarning("shockStickAttached", occupants, vehicle.vehiclename);
    vehicle.var_70ec04f736523dd0 = vehicle vehicle_gettopspeedforward();
    vehicle.var_abdfbc385c923e9f = vehicle vehicle_gettopspeedreverse();
    vehicle vehicle_settopspeedforward(10);
    vehicle vehicle_settopspeedreverse(10);
    if (vehicle vehiclecanfly()) {
        pilot = vehicle_occupancy_getdriver(vehicle);
        if (isdefined(pilot)) {
            pilot notify("shoot_flare");
        }
    }
    vehicle utility::function_3677f2be30fdd581("haywire", "on");
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b59
// Size: 0xcf
function function_b92c4e2d8733661(data) {
    vehicle = data.victim;
    if (!isdefined(vehicle) || istrue(vehicle.var_4970cb0edef7623b)) {
        return;
    }
    vehicle.var_12bfb031c0a0efd8 = 0;
    occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(vehicle, 0);
    namespace_84cff6185e39aa66::vehomn_hidewarning("shockStickAttached", occupants, vehicle.vehiclename);
    var_93d37decdfe9be3d = vehicle vehicle_gettopspeedforward(1);
    var_9fef0f6069126b26 = vehicle vehicle_gettopspeedreverse(1);
    vehicle.var_70ec04f736523dd0 = undefined;
    vehicle.var_abdfbc385c923e9f = undefined;
    vehicle vehicle_settopspeedforward(var_93d37decdfe9be3d);
    vehicle vehicle_settopspeedreverse(var_9fef0f6069126b26);
    vehicle utility::function_3677f2be30fdd581("haywire", "off");
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c2f
// Size: 0x89
function vehicle_lockedoncallback() {
    occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self, 0);
    namespace_84cff6185e39aa66::vehomn_showwarning("missileLocking", occupants, self.vehiclename);
    foreach (occupant in occupants) {
        occupant stoplocalsound("veh_warning_missile_locking");
        occupant playlocalsound("veh_warning_missile_locking");
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cbf
// Size: 0x7d
function vehicle_lockedonremovedcallback() {
    occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self, 0);
    namespace_84cff6185e39aa66::vehomn_hidewarning("missileLocking", occupants, self.vehiclename);
    foreach (occupant in occupants) {
        occupant stoplocalsound("veh_warning_missile_locking");
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d43
// Size: 0xe7
function function_a2d1400bcf46869a() {
    var_47f2a8ec0ef5ed2 = istrue(self.var_15c05fe1c0f6de03);
    var_ac7254614112a03c = 0;
    if (isdefined(self.var_f2f04bcc448fab3a)) {
        foreach (team in self.var_f2f04bcc448fab3a) {
            if (!namespace_1f188a13f7e79610::vehicle_isfriendlytoteam(self, team)) {
                var_ac7254614112a03c = 1;
                break;
            }
        }
    }
    if (var_47f2a8ec0ef5ed2 == var_ac7254614112a03c) {
        return;
    }
    self.var_15c05fe1c0f6de03 = var_ac7254614112a03c;
    occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self, 0);
    if (var_ac7254614112a03c) {
        namespace_84cff6185e39aa66::vehomn_showwarning("BunkerBusterAttached", occupants, self.vehiclename);
    } else {
        namespace_84cff6185e39aa66::vehomn_hidewarning("BunkerBusterAttached", occupants, self.vehiclename);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e31
// Size: 0x89
function vehicle_incomingcallback() {
    occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self, 0);
    namespace_84cff6185e39aa66::vehomn_showwarning("missileIncoming", occupants, self.vehiclename);
    foreach (occupant in occupants) {
        occupant stoplocalsound("veh_warning_missile_incoming");
        occupant playlocalsound("veh_warning_missile_incoming");
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ec1
// Size: 0x7d
function vehicle_incomingremovedcallback() {
    occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self, 0);
    namespace_84cff6185e39aa66::vehomn_hidewarning("missileIncoming", occupants, self.vehiclename);
    foreach (occupant in occupants) {
        occupant stoplocalsound("veh_warning_missile_incoming");
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f45
// Size: 0xc0
function vehicle_empstartcallback(data) {
    if (issharedfuncdefined("emp", "onVehicleEMPed")) {
        self [[ getsharedfunc("emp", "onVehicleEMPed") ]](data);
    }
    if (isdefined(self.var_b31f13a4e30b5aa5)) {
        self.var_285a0756c95a7a5 = 1;
    }
    self.var_ec76ffdbe2f37c5b = 1;
    utility::function_3677f2be30fdd581("ddos", "disabled");
    if (getdvarint(@"hash_10320e52e3e9ab5c", 0) == 0) {
        occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self, 0);
        namespace_84cff6185e39aa66::vehomn_showwarning("DDoSed", occupants, self.vehiclename);
    }
    namespace_1fbd40990ee60ede::vehicle_occupancy_allowmovement(self, 0, 0, self.var_64c5a4a6f78c0674);
    namespace_1fbd40990ee60ede::function_a1a583c3cc871645(0);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x700c
// Size: 0x92
function vehicle_empclearcallback(var_fcef8d217a441961) {
    if (!var_fcef8d217a441961) {
        utility::function_3677f2be30fdd581("ddos", "neutral");
    }
    if (isdefined(self.var_b31f13a4e30b5aa5)) {
        self.var_285a0756c95a7a5 = undefined;
    }
    self.var_ec76ffdbe2f37c5b = undefined;
    if (getdvarint(@"hash_10320e52e3e9ab5c", 0) == 0) {
        occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self, 0);
        namespace_84cff6185e39aa66::vehomn_hidewarning("DDoSed", occupants, self.vehiclename);
    }
    namespace_1fbd40990ee60ede::vehicle_occupancy_allowmovement(self, 1);
    namespace_1fbd40990ee60ede::function_a1a583c3cc871645(1);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70a5
// Size: 0x12b
function function_cdee8a729cb75935(data) {
    if (issharedfuncdefined("emp", "onVehicleEMPed")) {
        self [[ getsharedfunc("emp", "onVehicleEMPed") ]](data);
    }
    if (isdefined(self.var_b31f13a4e30b5aa5)) {
        self.var_285a0756c95a7a5 = 1;
    }
    self.var_ec76ffdbe2f37c5b = 1;
    if (getdvarint(@"hash_10320e52e3e9ab5c", 0) == 0) {
        occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self, 0);
        foreach (occupant in occupants) {
            if (!isdefined(occupant.var_3570f4b5b40c02e4)) {
                occupant thread namespace_5a51aa78ea0b1b9f::play_emp_scramble(4);
                occupant.var_3570f4b5b40c02e4 = 1;
            }
        }
    }
    namespace_1fbd40990ee60ede::vehicle_occupancy_allowmovement(self, 0, 0, self.var_64c5a4a6f78c0674);
    if (self.vehiclename == "veh_jup_razorback" || self.vehiclename == "veh9_cougar") {
        namespace_1fbd40990ee60ede::function_a1a583c3cc871645(0);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71d7
// Size: 0x65
function function_200ff7f502669b34(data) {
    if (isdefined(self.var_b31f13a4e30b5aa5)) {
        self.var_285a0756c95a7a5 = undefined;
    }
    self.var_ec76ffdbe2f37c5b = undefined;
    namespace_1fbd40990ee60ede::vehicle_occupancy_allowmovement(self, 1);
    if (self.vehiclename == "veh_jup_razorback" || self.vehiclename == "veh9_cougar") {
        namespace_1fbd40990ee60ede::function_a1a583c3cc871645(1);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7243
// Size: 0xc6
function function_810dfd134e9a7a04(vehicledata) {
    if (ent_flag("ai_initted")) {
        return;
    }
    self.script_badplace = 1;
    ent_flag_init("unloaded");
    ent_flag_init("loaded");
    ent_flag_init("landed");
    self.riders = [];
    self.unloadque = [];
    self.unload_group = "default";
    self.fastroperig = [];
    self.vehicleanimalias = vehicledata.ai.vehicleanimalias;
    self.classname_mp = vehicledata.ai.classname;
    thread namespace_4ff41449ab14a3a0::handle_attached_guys();
    ent_flag_set("ai_initted");
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7310
// Size: 0x62
function function_95022424d8b0dc1c(vehicleRef) {
    if (!function_89dc39dc11f3988c(vehicleRef)) {
        return 0;
    }
    data = function_29b4292c92443328(vehicleRef);
    if (!isdefined(data.ai) || !istrue(data.ai.var_289df80e1ded586f)) {
        return 0;
    }
    return data.var_f4eae2a1481b7dd3.size;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x737a
// Size: 0xab
function function_f92faaaf5c5077c6(riders, spawninvehicle, var_420ba29d9efc4756) {
    vehicleRef = function_d93ec4635290febd();
    /#
        assert(utility::function_a10967d736dc56e5() && istrue(function_29b4292c92443328(vehicleRef).ai.var_289df80e1ded586f), "vehicle_loadAI: You can't load AI into a vehicle that doesn't support it");
    #/
    if (!ent_flag("ai_initted")) {
        function_810dfd134e9a7a04(function_29b4292c92443328(vehicleRef));
    }
    if (issharedfuncdefined(vehicleRef, "loadAI")) {
        [[ getsharedfunc(vehicleRef, "loadAI") ]](riders, spawninvehicle, var_420ba29d9efc4756);
    } else {
        function_19e0f5686d59b76f(riders, spawninvehicle, var_420ba29d9efc4756);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x742c
// Size: 0x382
function function_19e0f5686d59b76f(riders, spawninvehicle, var_420ba29d9efc4756) {
    if (!isdefined(spawninvehicle)) {
        spawninvehicle = 0;
    }
    namespace_1fbd40990ee60ede::function_9e710c9f3a15ffda();
    thread function_f77e18d192719ac();
    vehicledata = function_29b4292c92443328(function_d93ec4635290febd());
    turrets = [];
    foreach (turret in vehicle_getturrets(self)) {
        turrets[turrets.size] = turret;
    }
    foreach (index, rider in riders) {
        if (!isdefined(rider) || !isdefined(rider._blackboard)) {
            function_ed7bbd7e1327b7fb(rider);
        } else {
            var_b87e69df003b39f5 = namespace_4ff41449ab14a3a0::get_availablepositions();
            if (isdefined(rider.spawner) && isdefined(rider.spawner.script_startingposition)) {
                rider.script_startingposition = int(rider.spawner.script_startingposition);
            } else if (!isdefined(rider.script_startingposition)) {
                rider.script_startingposition = index;
                if (isdefined(rider.spawner)) {
                    rider.spawner.script_startingposition = index;
                }
            }
            pos = namespace_4ff41449ab14a3a0::choose_vehicle_position(rider, var_b87e69df003b39f5, 0);
            rider.vehicle_position = pos.vehicle_position;
            anim_pos = namespace_4ff41449ab14a3a0::anim_pos(self, pos.vehicle_position);
            rider thread namespace_fbfdc656dd3cbd79::entervehicle(self, spawninvehicle, pos, anim_pos);
            thread function_36581eab345137d4(rider);
            self.riders[self.riders.size] = rider;
            rider.ridingvehicle = self;
            rider.vehicle = self;
            if (isdefined(anim_pos.bhasgunwhileriding) && !anim_pos.bhasgunwhileriding) {
                rider namespace_6205bc7c5e394598::gun_remove();
            }
            if (isdefined(rider.team) && pos.vehicle_position == 0) {
                self.var_fe321e008e65c319 = rider;
                namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(self, rider.team);
                if (!istrue(var_420ba29d9efc4756)) {
                    rider thread function_35f4a61ce36d99bb(self);
                }
            } else if (isdefined(vehicledata.var_f4eae2a1481b7dd3[pos.vehicle_position]) && istrue(vehicledata.var_f4eae2a1481b7dd3[pos.vehicle_position].mgturret) && turrets.size > 0) {
                if (!isdefined(self.mgturret)) {
                    self.mgturret = [];
                }
                turret = turrets[self.mgturret.size];
                if (!isdefined(turret)) {
                    /#
                        assert("AI " + rider getentitynumber() + " is trying to get into a turret but all turrets are full. This is likely caused by an incorrect setup, or calling get_in on the same vehicle multiple times.");
                    #/
                } else {
                    self.mgturret[self.mgturret.size] = turret;
                    turret setturretteam(rider.team);
                    rider namespace_28edc79fcf2fe234::bb_requestturret(turret);
                }
            }
        }
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x77b5
// Size: 0xc6
function private function_ed7bbd7e1327b7fb(rider) {
    /#
        if (!isdefined(rider)) {
            println("<unknown string>");
        } else if (!isdefined(rider._blackboard)) {
            println("<unknown string>");
        }
        if (isdefined(rider) && isdefined(rider.origin)) {
            println("<unknown string>" + rider.origin);
        }
        if (isdefined(rider)) {
            category = namespace_14d36171baccf528::agentPers_getAgentPersData(rider, "<unknown string>");
            subcategory = namespace_14d36171baccf528::agentPers_getAgentPersData(rider, "<unknown string>");
            println("<unknown string>" + function_53c4c53197386572(category, "vehicle_update") + "<unknown string>" + function_53c4c53197386572(subcategory, "vehicle_update"));
        }
    #/
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7882
// Size: 0x41
function private function_36581eab345137d4(rider) {
    self endon("death");
    self endon("unloaded");
    rider waittill("death");
    if (!isdefined(self)) {
        return;
    }
    self.riders = array_remove(self.riders, rider);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x78ca
// Size: 0x13
function private function_f77e18d192719ac() {
    self waittill("death");
    thread namespace_b479ac682b93cd92::vehicle_killriders();
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x78e4
// Size: 0xb8
function private function_35f4a61ce36d99bb(vehicle) {
    vehicle endon("unloaded");
    vehicle endon("death");
    vehicle endon("vehicle_OnDriverDeath_early");
    self waittill("death");
    vehicle notify("driverdeath");
    if (isdefined(vehicle) && isalive(vehicle) && isdefined(vehicle.var_3816d927b2610b20)) {
        vehicle thread [[ vehicle.var_3816d927b2610b20 ]]();
        return;
    }
    if (istrue(vehicle.isheli)) {
        if (istrue(vehicle.var_e6036cc5fe1c5c9e)) {
            vehicle thread namespace_1f188a13f7e79610::function_f7af4d1c91ca6e2f();
        } else {
            wait(1.5);
            vehicle thread namespace_1f188a13f7e79610::vehicle_explode(undefined, 1);
        }
    } else if (istrue(vehicle.var_6e156be4871c1abd)) {
        vehicle thread namespace_cbe993018617a21d::function_fb7e5919765650ea();
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79a3
// Size: 0xed
function function_1cd6d75165ecbc48() {
    if (getdvarint(@"hash_742caa13b3c2e685")) {
        return undefined;
    }
    if (isagent(self)) {
        return undefined;
    }
    vehiclecustomization = spawnstruct();
    vehiclecustomization.var_94b01ac7cdddf04d = [];
    vehiclecustomization.skins = [];
    var_ac35fe7145852ee1 = function_3cb5da19764baa3();
    foreach (ref, data in level.var_a0b2c978ca57ffc5) {
        var_39fb4f123cb0ff0 = namespace_1f188a13f7e79610::function_86f6f784630b11fb(ref);
        if (!isdefined(var_39fb4f123cb0ff0)) {
            continue;
        }
        vehiclecustomization.skins[ref] = function_4d5b0a0260555dcd(var_39fb4f123cb0ff0);
        vehiclecustomization.var_94b01ac7cdddf04d[ref] = getvehicleplayerhorn(var_39fb4f123cb0ff0);
    }
    return vehiclecustomization;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7a98
// Size: 0x84
function private function_4d5b0a0260555dcd(data) {
    if (!isdefined(data) || !isdefined(data.mtx) || data.mtx.size == 0) {
        return undefined;
    }
    id = self getplayerdata(level.loadoutsgroup, "customizationSetup", "vehicleCustomization", data.ref, "camo");
    id = id - 1;
    if (isdefined(id)) {
        return data.mtx[id];
    }
    return undefined;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7b24
// Size: 0xa0
function private getvehicleplayerhorn(data) {
    if (!isdefined(data) || !isdefined(data.var_94b01ac7cdddf04d) || data.var_94b01ac7cdddf04d.size == 0) {
        return undefined;
    }
    id = self getplayerdata(level.loadoutsgroup, "customizationSetup", "vehicleCustomization", data.ref, "horn");
    id = id - 1;
    if (isdefined(id) && isdefined(data.var_94b01ac7cdddf04d[id])) {
        return data.var_94b01ac7cdddf04d[id].alias;
    }
    return undefined;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bcc
// Size: 0x172
function function_471cde1983a05f66(player, vehicleRef) {
    mtx = undefined;
    if (isdefined(player.vehiclecustomization) && isdefined(player.vehiclecustomization.skins) && isdefined(player.vehiclecustomization.skins[vehicleRef])) {
        mtx = player.vehiclecustomization.skins[vehicleRef];
    } else if (getdvarint(@"hash_42c1e6eb518bf4fc", 0) == 1 && cointoss()) {
        data = function_29b4292c92443328(vehicleRef);
        if (isdefined(data) && isdefined(data.mtx) && data.mtx.size > 0) {
            mtx = random(data.mtx);
        }
    } else if (getdvarint(@"hash_d0405b9fee9d9869", -1) > -1) {
        var_41a3450f3fbfff13 = getdvarint(@"hash_d0405b9fee9d9869", -1);
        data = function_29b4292c92443328(vehicleRef);
        if (isdefined(data) && isdefined(data.mtx) && data.mtx.size > 0 && var_41a3450f3fbfff13 < data.mtx.size) {
            mtx = data.mtx[var_41a3450f3fbfff13];
        }
    }
    return mtx;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d46
// Size: 0x197
function function_4201160d49c885a7(vehicle, mtx) {
    if (!isdefined(mtx)) {
        return;
    }
    vehicle.mtx = mtx;
    vehicle function_788d3c14d6b4ba6b(mtx.ref);
    if (isdefined(mtx.var_fe99f86a708e76ef) || isdefined(mtx.var_9c6d62e1c42be80a)) {
        foreach (weapon, turret in vehicle_getturrets(vehicle)) {
            if (isdefined(mtx.var_9c6d62e1c42be80a) && isdefined(mtx.var_9c6d62e1c42be80a[weapon])) {
                turret setvehicleturretcamo(mtx.var_9c6d62e1c42be80a[weapon]);
            } else if (isdefined(mtx.var_fe99f86a708e76ef)) {
                turret setvehicleturretcamo(mtx.var_fe99f86a708e76ef);
            }
        }
    }
    if (isdefined(mtx.vehicletrail) && mtx.vehicletrail != "") {
        vehicle thread namespace_1f188a13f7e79610::vehicle_update(vehicle);
    }
    if (isdefined(mtx.idlestate)) {
        vehicle function_3677f2be30fdd581("mtx", mtx.idlestate);
    }
    if (isdefined(mtx.var_52a9cca12dad1d11)) {
        vehicle thread function_e9c362d34ccc190b(mtx.var_52a9cca12dad1d11);
    }
    if (isdefined(mtx.var_c1af5f3094ddb62d)) {
        vehicle thread function_4327f95b5d3f8fb3(mtx.var_c1af5f3094ddb62d);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ee4
// Size: 0x46
function private function_e9c362d34ccc190b(var_52a9cca12dad1d11) {
    self notify("watch_horn");
    self endon("watch_horn");
    self endon("death");
    level endon("game_ended");
    while (1) {
        self waittill("vehicle_horn");
        function_3677f2be30fdd581("mtx", var_52a9cca12dad1d11);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7f31
// Size: 0x4f
function private function_4327f95b5d3f8fb3(var_c1af5f3094ddb62d) {
    self notify("watch_hitAndRun");
    self endon("watch_hitAndRun");
    self endon("death");
    level endon("game_ended");
    while (1) {
        waittill_any_2("vehicle_killed_player", "vehicle_downed_player");
        function_3677f2be30fdd581("mtx", var_c1af5f3094ddb62d);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7f87
// Size: 0xbe
function private function_19d89390ee87e7c2(vehicleRef, var_b687f9c1ef7e6a28) {
    if (!isdefined(var_b687f9c1ef7e6a28) || !isdefined(vehicleRef)) {
        return;
    }
    data = namespace_1f188a13f7e79610::function_86f6f784630b11fb(vehicleRef);
    if (!isdefined(data) || !isdefined(data.mtx)) {
        return;
    }
    var_962ef6817910ec78 = undefined;
    foreach (struct in data.mtx) {
        if (is_equal(var_b687f9c1ef7e6a28, struct.ref)) {
            return struct;
        }
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x804c
// Size: 0x1c8
function function_86f6f784630b11fb(vehicleRef, options) {
    data = namespace_1f188a13f7e79610::function_29b4292c92443328(vehicleRef);
    if (isdefined(data) && isdefined(data.var_cd5ab16b94bc2745)) {
        vehicleRef = data.var_cd5ab16b94bc2745;
        if (!namespace_1f188a13f7e79610::function_89dc39dc11f3988c(vehicleRef)) {
            if (!isdefined(level.var_c7fee21d5d5e1a1c)) {
                level.var_c7fee21d5d5e1a1c = [];
            }
            if (isdefined(level.var_c7fee21d5d5e1a1c[vehicleRef])) {
                data = level.var_c7fee21d5d5e1a1c[vehicleRef];
            } else {
                bundlename = vehicleRef + ter_op(!iscp(), "_mp", "_cp");
                data = function_50f8a8f765bad85e(function_2ef675c13ca1c4af(%"vehiclebundle:", bundlename), [0:#"ref", 1:#"vehicle", 2:#"interact", 3:#"hash_30599e7b3d259869", 4:#"mtx"]);
                level.var_c7fee21d5d5e1a1c[vehicleRef] = data;
            }
        } else {
            data = namespace_1f188a13f7e79610::function_29b4292c92443328(vehicleRef);
        }
    }
    if (!isdefined(data) || !isdefined(data.vehicle) || !isdefined(data.interact)) {
        return undefined;
    }
    if (istrue(data.interact.var_6be1425a9ea8586d) && !istrue(data.var_b01f9533413e14ec)) {
        return undefined;
    }
    if ((!isdefined(data.var_94b01ac7cdddf04d) || data.var_94b01ac7cdddf04d.size == 0) && (!isdefined(data.mtx) || data.mtx.size == 0) && !istrue(data.var_539862aa827974a3)) {
        return undefined;
    }
    return data;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x821c
// Size: 0x192
function function_fdf45700cfcd0c05(var_b687f9c1ef7e6a28, var_739afe679c067588, var_3d7e6a383446a00d) {
    /#
        vehiclecustomization = spawnstruct();
        vehiclecustomization.var_94b01ac7cdddf04d = [];
        vehiclecustomization.skins = [];
        var_962ef6817910ec78 = undefined;
        if (isdefined(var_b687f9c1ef7e6a28) && isint(var_b687f9c1ef7e6a28)) {
            var_962ef6817910ec78 = var_b687f9c1ef7e6a28;
        }
        foreach (ref, data in level.var_a0b2c978ca57ffc5) {
            data = namespace_1f188a13f7e79610::function_86f6f784630b11fb(ref);
            if (isdefined(var_b687f9c1ef7e6a28) && isstring(var_b687f9c1ef7e6a28) && isdefined(data) && isdefined(data.mtx)) {
                var_962ef6817910ec78 = undefined;
                foreach (index, struct in data.mtx) {
                    if (is_equal(var_b687f9c1ef7e6a28, struct.ref)) {
                        var_962ef6817910ec78 = index;
                        break;
                    }
                }
            }
            if (isdefined(var_962ef6817910ec78)) {
                vehiclecustomization.skins[ref] = function_82a41d4c091810a6(data, var_962ef6817910ec78);
            }
            if (isdefined(var_739afe679c067588)) {
                vehiclecustomization.var_94b01ac7cdddf04d[ref] = function_cdb95758906af97e(data, var_739afe679c067588);
            }
        }
        return vehiclecustomization;
    #/
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x83b5
// Size: 0x59
function function_82a41d4c091810a6(data, var_962ef6817910ec78) {
    /#
        if (isagent(self)) {
            return undefined;
        }
        if (isdefined(data) && isdefined(data.mtx) && isdefined(data.mtx[var_962ef6817910ec78])) {
            return data.mtx[var_962ef6817910ec78];
        }
        return undefined;
    #/
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8415
// Size: 0x58
function function_cdb95758906af97e(data, var_739afe679c067588) {
    /#
        if (isdefined(data) && isdefined(data.var_94b01ac7cdddf04d) && isdefined(data.var_94b01ac7cdddf04d[var_739afe679c067588])) {
            return data.var_94b01ac7cdddf04d[var_739afe679c067588].alias;
        }
        return undefined;
    #/
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8474
// Size: 0x116
function function_1e24abef827f0807() {
    if (getdvarint(@"hash_b1e5a269c62e79c7", 1) == 0) {
        return;
    }
    ref = function_d93ec4635290febd();
    if (!isdefined(ref) || !function_89dc39dc11f3988c(ref)) {
        return;
    }
    data = function_29b4292c92443328(ref);
    if (!isdefined(data) || !isdefined(data.var_8f2c463c6016ce59)) {
        return;
    }
    self endon("death");
    childthread function_45585d05c17c31aa();
    while (1) {
        var_add0f0b19cf87473 = self waittill("trick_in");
        if (!isdefined(vehicle_occupancy_getdriver(self))) {
            continue;
        }
        if (isdefined(self.var_1fb1c203624107a7[var_add0f0b19cf87473]) && self.var_1fb1c203624107a7[var_add0f0b19cf87473] == gettime()) {
            continue;
        }
        if (!isdefined(data.var_8f2c463c6016ce59[var_add0f0b19cf87473])) {
            /#
                assertmsg("Trick: "" + var_add0f0b19cf87473 + "" has no scoring data in the vehicle bundle!");
            #/
            continue;
        }
        hash = function_1823ff50bb28148d(var_add0f0b19cf87473);
        childthread function_436b3366f1d5b495(var_add0f0b19cf87473, data.var_8f2c463c6016ce59[var_add0f0b19cf87473], hash);
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8591
// Size: 0x28d
function private function_436b3366f1d5b495(var_add0f0b19cf87473, var_37879fc7b1cc0618, hash) {
    self notify(var_add0f0b19cf87473 + "_rewarding");
    self endon(var_add0f0b19cf87473 + "_rewarding");
    self endon(var_add0f0b19cf87473 + "_ended");
    var_f5429dc7523f92f8 = function_f3bb4f4911a1beb2("rank", "getScoreInfoXP", hash);
    wait(var_37879fc7b1cc0618.delay);
    player = vehicle_occupancy_getdriver(self);
    if (!isdefined(player)) {
        return;
    }
    player namespace_aad14af462a74d08::function_5c3aa65db46763ff(self, var_add0f0b19cf87473);
    if (var_add0f0b19cf87473 == "frontflip" || var_add0f0b19cf87473 == "backflip" || var_add0f0b19cf87473 == "nacnac_left" || var_add0f0b19cf87473 == "nacnac_right" || var_add0f0b19cf87473 == "superman") {
        player namespace_aad14af462a74d08::function_5c3aa65db46763ff(self, "any_air_trick");
    }
    if (!isdefined(self.var_ddfbc5f492fb65c6)) {
        self.var_ddfbc5f492fb65c6 = [];
    }
    index = array_find(self.var_ddfbc5f492fb65c6, var_add0f0b19cf87473);
    var_e101b88d6655f13b = 1;
    if (isdefined(index)) {
        switch (index) {
        case 0:
            var_e101b88d6655f13b = 0.2;
            break;
        case 1:
            var_e101b88d6655f13b = 0.4;
            break;
        case 2:
            var_e101b88d6655f13b = 0.6;
            break;
        case 3:
            var_e101b88d6655f13b = 0.8;
            break;
        }
    }
    var_f5429dc7523f92f8 = var_f5429dc7523f92f8 * var_e101b88d6655f13b;
    self.var_ddfbc5f492fb65c6 = array_remove(self.var_ddfbc5f492fb65c6, var_add0f0b19cf87473);
    self.var_ddfbc5f492fb65c6 = array_insert(self.var_ddfbc5f492fb65c6, var_add0f0b19cf87473, 0);
    if (isdefined(self.var_8bb6b9b919c2c19d) && self.var_8bb6b9b919c2c19d != var_add0f0b19cf87473) {
        player function_95f73e34041bee68(#"hash_6d65a58e1de667e1", function_f3bb4f4911a1beb2("rank", "getScoreInfoXP", #"hash_6d65a58e1de667e1"));
    }
    thread watchCombo(var_add0f0b19cf87473);
    if (var_37879fc7b1cc0618.type == "reward_points_once") {
        player function_95f73e34041bee68(hash, int(var_f5429dc7523f92f8));
    } else {
        decay = 1;
        while (isdefined(player)) {
            xp = int(max(1, round(var_f5429dc7523f92f8 * decay)));
            player function_95f73e34041bee68(hash, xp);
            decay = decay - 0.2;
            if (decay < 0.1) {
                return;
            }
            wait(0.5);
            player = vehicle_occupancy_getdriver(self);
        }
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8825
// Size: 0x54
function private function_95f73e34041bee68(event, xp) {
    function_f3bb4f4911a1beb2("rank", "displayScoreEventPoints", xp, event);
    function_f3bb4f4911a1beb2("rank", "killEventTextPopup", event, 1);
    function_f3bb4f4911a1beb2("rank", "giveRankXP", event, xp, undefined, 1, undefined, 1);
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8880
// Size: 0x43
function private function_45585d05c17c31aa() {
    self.var_1fb1c203624107a7 = [];
    while (1) {
        var_add0f0b19cf87473 = self waittill("trick_out");
        self notify(var_add0f0b19cf87473 + "_ended");
        self.var_1fb1c203624107a7[var_add0f0b19cf87473] = gettime();
    }
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88ca
// Size: 0xb0
function private watchCombo(var_add0f0b19cf87473) {
    if (self getwheelsurface(0) != "none" && self getwheelsurface(1) != "none") {
        return;
    }
    self.var_8bb6b9b919c2c19d = var_add0f0b19cf87473;
    self notify("watchCombo");
    self endon("watchCombo");
    self endon("death");
    var_f0a619cde9b0ce82 = 0;
    while (1) {
        if (self getwheelsurface(0) != "none" && self getwheelsurface(1) != "none") {
            var_f0a619cde9b0ce82 = var_f0a619cde9b0ce82 + level.framedurationseconds;
        } else {
            var_f0a619cde9b0ce82 = 0;
        }
        if (var_f0a619cde9b0ce82 >= 0.25) {
            break;
        }
        waitframe();
    }
    self.var_8bb6b9b919c2c19d = undefined;
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8981
// Size: 0x52
function function_84134697aff9fc9a() {
    /#
        if (istrue(self.inlaststand)) {
            return 0;
        }
        if (isdefined(self.vehicle)) {
            return 0;
        }
        if (self isinexecutionattack() || self isinexecutionvictim()) {
            return 0;
        }
        if (!namespace_f8065cafc523dba5::_isalive()) {
            return 0;
        }
        if (namespace_448ccf1ca136fbbe::isusingremote()) {
            return 0;
        }
        return 1;
    #/
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x89da
// Size: 0x62
function function_84033ce50b8afce2(vehicleRef, spawndata) {
    /#
        if (vehicleRef == "<unknown string>") {
            spawndata.spawnmethod = "<unknown string>";
            spawndata.cantimeout = 0;
        }
        vehicle = namespace_1f188a13f7e79610::vehicle_spawn(vehicleRef, spawndata);
        return [0:vehicle, 1:"<unknown string>"];
    #/
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8a43
// Size: 0x16f
function function_276beb60c7f60d1e(vehicleRef) {
    /#
        if (!function_84134697aff9fc9a()) {
            return;
        }
        spawnposition = self.origin + (0, 0, 100);
        spawnangles = self.angles * (0, 1, 0);
        vehicle = undefined;
        seatid = undefined;
        spawndata = spawnstruct();
        spawndata.origin = spawnposition;
        spawndata.angles = spawnangles;
        spawndata.spawntype = "<unknown string>";
        var_c00e3462499a34f2 = function_84033ce50b8afce2(vehicleRef, spawndata);
        seatid = var_c00e3462499a34f2[1];
        vehicle = var_c00e3462499a34f2[0];
        if (isdefined(vehicle) && vehicleRef != "<unknown string>" && vehicleRef != "<unknown string>" && vehicleRef != "<unknown string>" && vehicleRef != "<unknown string>" && vehicleRef != "<unknown string>") {
            /#
                assertex(isdefined(seatid), "<unknown string>");
            #/
            thread namespace_1fbd40990ee60ede::vehicle_occupancy_enter(vehicle, seatid, self, undefined, 1);
        } else if (!isdefined(vehicle)) {
            iprintln("<unknown string>");
        }
        if (vehicleRef == "<unknown string>" || vehicleRef == "<unknown string>" || vehicleRef == "<unknown string>") {
            vehicle namespace_1fbd40990ee60ede::function_a91927df280e94e4();
        }
        return vehicle;
    #/
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8bb9
// Size: 0x7b
function function_5ccd46f74af245d8(vehicleRef) {
    /#
        instances = namespace_f64231d5b7a2c3c4::vehicle_tracking_getgameinstances(vehicleRef);
        if (isdefined(instances) && instances.size > 0) {
            foreach (instance in instances) {
                instance namespace_1f188a13f7e79610::vehicle_explode();
            }
        }
    #/
}

// Namespace vehicle/namespace_1f188a13f7e79610
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8c3b
// Size: 0x1a
function function_b4896044b6e0d565() {
    /#
        wait(1);
        self setscriptablepartstate("<unknown string>", "<unknown string>");
    #/
}

