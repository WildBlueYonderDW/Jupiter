#using script_1c47017ba325709a;
#using script_2b736eb3fdd9b328;
#using script_48814951e916af89;
#using script_4bac13d511590220;
#using scripts\common\utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\engine\utility;
#using scripts\mp\flags;
#using scripts\mp\poi;
#using scripts\mp\utility\player;
#using scripts\mp\utility\sound;
#using scripts\mp\utility\teams;

#namespace namespace_57e5dd82a72e648a;

// Namespace namespace_57e5dd82a72e648a / namespace_e5a48e48e132c025
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x235
// Size: 0x1d6
function function_2e887982267d85a8() {
    scripts\mp\flags::function_1240434f4201ac9d("vehicle_patrol_paths_selected");
    level.convoyattack = spawnstruct();
    level.convoyattack.enabled = getdvarint(@"hash_39c37258ca05357b", 0);
    if (!level.convoyattack.enabled) {
        return;
    }
    level.convoyattack.speed = getdvarfloat(@"hash_ffe88a9964ee8cda", 20);
    level.convoyattack.var_19b2f27954f6434e = getdvarint(@"hash_1e2146029acd559", 4);
    level.convoyattack.var_14ec3f04478a5448 = getdvarint(@"hash_ec74918dfb1e85e7", 6);
    level.var_4b11054eaa9aa4ec = [];
    foreach (i, p in level.var_9e7adb59a0cb3e3d) {
        p.origin = p.path[0].origin;
        level.var_4b11054eaa9aa4ec[level.var_4b11054eaa9aa4ec.size] = p;
    }
    level.var_4b11054eaa9aa4ec = array_randomize(level.var_4b11054eaa9aa4ec);
    numtospawn = randomintrange(level.convoyattack.var_19b2f27954f6434e, level.convoyattack.var_14ec3f04478a5448 + 1);
    for (i = 0; i < numtospawn; i++) {
        patrolstruct = spawnstruct();
        patrolstruct thread function_c089b1c94e960517(level.var_4b11054eaa9aa4ec[i]);
    }
}

// Namespace namespace_57e5dd82a72e648a / namespace_e5a48e48e132c025
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x413
// Size: 0x1c6
function function_c089b1c94e960517(patrolpath) {
    if (!isdefined(patrolpath)) {
        return;
    }
    if (!scripts\cp_mp\vehicles\vehicle::function_fa537f1ab52a76d1("veh9_mil_cargo_truck")) {
        return;
    }
    self.node = patrolpath;
    self.caches = [];
    self.node.initai = 1;
    self.node.spawntype = "GAME_MODE";
    self.node.team = "team_hundred_ninety_five";
    self.node.showheadicon = 1;
    self.node.direction = 1;
    self.node.index = 0;
    self.vehicle = function_96b8ab6bf1035b06();
    thread function_3878e6cb9cf4e33f();
    self.vehicle namespace_9246f10206f50768::function_1da2c31423c2676a(level.convoyattack.speed);
    self.vehicle function_77320e794d35465a("p2p", "brakeAtGoal", 0);
    self.vehicle function_77320e794d35465a("p2p", "goalThreshold", level.convoyattack.speed * 4);
    self.vehicle function_77320e794d35465a("p2p", "steeringMultiplier", 2.5);
    self.vehicle function_77320e794d35465a("p2p", "stuckTime", 4);
    self.vehicle.pathdata = self.node;
    self.vehicle thread namespace_9246f10206f50768::function_c3889abf5cd6abbf(self.node, level.convoyattack.speed);
}

// Namespace namespace_57e5dd82a72e648a / namespace_e5a48e48e132c025
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e1
// Size: 0xf4
function function_3878e6cb9cf4e33f() {
    self.vehicle waittill("death");
    self.husk = self.vehicle scripts\cp_mp\vehicles\vehicle::function_12f5a0e2344c10c5();
    if (isdefined(self.husk)) {
        foreach (cache in self.caches) {
            self.husk function_7f20e60880a9bfdd(cache);
        }
        function_71b01f0d4ec1f90d();
        self.husk waittill("death");
    }
    foreach (cache in self.caches) {
        cache freescriptable();
    }
}

// Namespace namespace_57e5dd82a72e648a / namespace_e5a48e48e132c025
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6dd
// Size: 0xb4
function function_f1323c29e2c131af(offset, angles) {
    worldpos = coordtransform(offset, self.origin, self.angles);
    var_eeabf9578a5f3207 = combineangles(self.angles, angles);
    cache = spawnscriptable("br_loot_cache_convoy_attack", worldpos, angles);
    cache scriptablesetparententity(self, offset, angles);
    cache.offset = offset;
    cache.linkangles = angles;
    self.patrolstruct.caches[self.patrolstruct.caches.size] = cache;
}

// Namespace namespace_57e5dd82a72e648a / namespace_e5a48e48e132c025
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x799
// Size: 0x30
function function_7f20e60880a9bfdd(cache) {
    cache scriptableclearparententity();
    cache scriptablesetparententity(self, cache.offset, cache.linkangles);
}

// Namespace namespace_57e5dd82a72e648a / namespace_e5a48e48e132c025
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d1
// Size: 0x236
function function_96b8ab6bf1035b06() {
    poiname = scripts\mp\poi::function_6cc445c02b5effac(self.node.origin, 0, 1);
    agenttypes = namespace_43bf74a2ee9234c0::function_236a093e8a0ec040("veh9_mil_cargo_truck");
    spawners = namespace_43bf74a2ee9234c0::function_f260b1cef943f1ab("veh9_mil_cargo_truck", 7, agenttypes, self.node.origin, poiname, "absolute");
    riders = namespace_43bf74a2ee9234c0::function_4ad6c25d6754f697(spawners, 7, undefined, "high", "convoy_attack", "convoy_attack", "team_hundred_ninety_five", undefined, "veh9_mil_cargo_truck_convoy_attack");
    if (riders.size > 0) {
        foreach (rider in riders) {
            rider.var_c7845d939c783cef = 1;
        }
    }
    spawndata = spawnstruct();
    spawndata.origin = self.node.origin;
    spawndata.angles = (0, 0, 0);
    spawndata.spawntype = "GAME_MODE";
    spawndata.team = "team_hundred_ninety_five";
    spawndata.showheadicon = 1;
    spawndata.initai = 1;
    faildata = spawnstruct();
    vehicle = scripts\cp_mp\vehicles\vehicle::vehicle_spawn("veh9_mil_cargo_truck", spawndata, faildata);
    vehicle.var_7ee6203c5532a9e6 = 1;
    vehicle.patrolstruct = self;
    vehicle.var_eb504fc7e1cfeb4c = 1;
    if (riders.size > 0) {
        vehicle thread function_15cf713dcbf2c97f(riders[0]);
    }
    waitframe();
    vehicle scripts\cp_mp\vehicles\vehicle::function_f92faaaf5c5077c6(riders, 1, 1);
    vehicle function_f1323c29e2c131af((33, 23, 10), (0, 90, 0));
    vehicle function_f1323c29e2c131af((33, -23, 10), (0, 90, 0));
    return vehicle;
}

// Namespace namespace_57e5dd82a72e648a / namespace_e5a48e48e132c025
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa10
// Size: 0x78
function function_71b01f0d4ec1f90d() {
    if (istrue(self.openedcaches)) {
        return;
    }
    self.openedcaches = 1;
    foreach (cache in self.caches) {
        cache setscriptablepartstate("body", "closed_usable");
    }
}

// Namespace namespace_57e5dd82a72e648a / namespace_e5a48e48e132c025
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa90
// Size: 0x43
function function_15cf713dcbf2c97f(driver) {
    self endon("death");
    self endon("unloaded");
    driver waittill("death");
    if (!isdefined(self)) {
        return;
    }
    self.patrolstruct function_71b01f0d4ec1f90d();
    namespace_d2c35aa0ab3fe2d2::function_ab0ee2215eb51dd5("combat");
}

