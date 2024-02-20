// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_48814951e916af89;
#using script_6c4e8cea70bf4b6d;
#using script_3314add7998ab13;
#using scripts\mp\flags.gsc;
#using script_64acb6ce534155b7;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_4bac13d511590220;
#using script_5def7af2a9f04234;
#using script_1c47017ba325709a;
#using script_2b736eb3fdd9b328;

#namespace namespace_38f7228a0bb0b8a8;

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1
// Size: 0x117
function function_80d68c9701e1aea5(data) {
    namespace_4b0406965e556711::function_1240434f4201ac9d("vehicle_patrol_paths_selected");
    level.var_35d525d711de1b7 = spawnstruct();
    level.var_35d525d711de1b7.speed = getdvarfloat(@"hash_ffe88a9964ee8cda", 20);
    level.var_35d525d711de1b7.var_3fa7196496d9308b = getdvarint(@"hash_ceaf6d7a5f1db16e", 1);
    level.var_4b11054eaa9aa4ec = [];
    foreach (p in level.var_9e7adb59a0cb3e3d) {
        p.origin = p.path[0].origin;
        level.var_4b11054eaa9aa4ec[level.var_4b11054eaa9aa4ec.size] = p;
    }
    function_b713f2d39b34540f(data, &function_f04c99751cdc9e0c, level.var_4b11054eaa9aa4ec);
}

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bf
// Size: 0xec
function function_f04c99751cdc9e0c(activity, node) {
    task = function_5f6d9fd82bdd2d05(activity);
    task.funcs["onInit"] = &function_db3d241c0c7aad79;
    task.funcs["onTeamAssigned"] = &function_2c9f290c95b69f86;
    task.funcs["onPlayerJoined"] = &function_51d145a2e76e5a7b;
    task.funcs["onPlayerRemoved"] = &function_a7933ef4399591a;
    task.funcs["onTeamStart"] = &function_75070f6092d4f6e;
    task.funcs["onCancel"] = &function_d7edc7ea0b792a79;
    task.node = node;
    task.ref = "dmz_convoy_attack";
    task.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    return task;
}

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b3
// Size: 0x254
function function_db3d241c0c7aad79() {
    if (!isdefined(self.node)) {
        return;
    }
    function_c847bfd52c064289(self.node.origin + (0, 0, 60));
    if (!namespace_1f188a13f7e79610::function_fa537f1ab52a76d1("veh9_jltv_mg")) {
        task_ended();
        return;
    }
    self.activity.origin = self.node.origin;
    self.caches = [];
    self.node.var_f16652e1462a3739 = 1;
    self.node.spawntype = "GAME_MODE";
    self.node.team = "team_hundred_ninety_five";
    self.node.showheadicon = 1;
    if (istrue(level.var_35d525d711de1b7.var_3fa7196496d9308b)) {
        self.vehicle = function_d54ed88824a6416e();
    } else {
        self.vehicle = function_5751a98afbcc56bd();
    }
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(self.icon, self.vehicle);
    thread function_6fb25f6b9a58b347();
    self.vehicle namespace_9246f10206f50768::function_1da2c31423c2676a(level.var_35d525d711de1b7.speed);
    self.node.direction = 1;
    self.node.index = 0;
    self.vehicle function_77320e794d35465a("p2p", "brakeAtGoal", 0);
    self.vehicle function_77320e794d35465a("p2p", "goalThreshold", level.var_35d525d711de1b7.speed * 4);
    self.vehicle function_77320e794d35465a("p2p", "steeringMultiplier", 2.5);
    self.vehicle function_77320e794d35465a("p2p", "stuckTime", 4);
    self.vehicle.pathdata = self.node;
    self.vehicle thread namespace_9246f10206f50768::function_c3889abf5cd6abbf(self.node, level.var_35d525d711de1b7.speed);
}

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70e
// Size: 0xc
function function_51d145a2e76e5a7b(player) {
    
}

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x721
// Size: 0xc
function function_a7933ef4399591a(player) {
    
}

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x734
// Size: 0xc
function function_d7edc7ea0b792a79(team) {
    
}

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x747
// Size: 0x19
function function_2c9f290c95b69f86(team) {
    function_1759acfd39bb5edf("dmz_convoy_attack_assigned", team);
}

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x767
// Size: 0xc
function function_75070f6092d4f6e(team) {
    
}

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77a
// Size: 0xa
function function_8250fd658e3aae32() {
    function_629ed367d1393020();
}

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78b
// Size: 0x49
function function_4377e070100de7ec() {
    function_8250fd658e3aae32();
    if (isdefined(self.teams[0])) {
        function_cd4f277cf0d6a560(self.teams[0]);
        function_1759acfd39bb5edf("dmz_convoy_attack_success", self.teams[0]);
    }
    task_ended();
}

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7db
// Size: 0x29
function function_6fb25f6b9a58b347() {
    self endon("task_ended");
    self.vehicle waittill("death");
    function_30dea07ecda5db65();
    thread function_4377e070100de7ec();
}

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80b
// Size: 0x16b
function function_5751a98afbcc56bd() {
    vehicle = namespace_1f188a13f7e79610::vehicle_spawn("veh9_jltv_mg", self.node);
    vehicle.var_7ee6203c5532a9e6 = 1;
    vehicle.task = self;
    vehicle.var_eb504fc7e1cfeb4c = 1;
    var_171f90b9c4c76d44 = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(self.node.origin, 0, 1);
    var_b4d3f717373af2bb = namespace_43bf74a2ee9234c0::function_236a093e8a0ec040("veh9_jltv_mg");
    spawners = namespace_43bf74a2ee9234c0::function_f260b1cef943f1ab("veh9_jltv_mg", 4, var_b4d3f717373af2bb, self.node.origin, var_171f90b9c4c76d44, "absolute");
    riders = namespace_43bf74a2ee9234c0::function_4ad6c25d6754f697(spawners, 4, undefined, "absolute", "convoy_attack", "convoy_attack", "team_hundred_ninety_five", undefined, "veh9_jltv_mg");
    if (riders.size > 0) {
        foreach (rider in riders) {
            rider.var_c7845d939c783cef = 1;
        }
    }
    if (isdefined(riders[1])) {
        riders[1] setstealthstate("combat");
    }
    vehicle namespace_1f188a13f7e79610::function_f92faaaf5c5077c6(riders, 1, 1);
    return vehicle;
}

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97e
// Size: 0x9c
function function_859ffd6bdcf262a7(offset, angles) {
    var_a7d7579a649f51e7 = coordtransform(offset, self.origin, self.angles);
    var_eeabf9578a5f3207 = combineangles(self.angles, angles);
    cache = spawnscriptable("br_loot_cache_convoy_attack", var_a7d7579a649f51e7, angles);
    cache scriptablesetparententity(self, offset, angles);
    self.task.caches[self.task.caches.size] = cache;
}

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa21
// Size: 0x1a7
function function_d54ed88824a6416e() {
    vehicle = namespace_1f188a13f7e79610::vehicle_spawn("veh9_mil_cargo_truck", self.node);
    vehicle.var_7ee6203c5532a9e6 = 1;
    vehicle.task = self;
    vehicle.var_eb504fc7e1cfeb4c = 1;
    var_171f90b9c4c76d44 = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(self.node.origin, 0, 1);
    var_b4d3f717373af2bb = namespace_43bf74a2ee9234c0::function_236a093e8a0ec040("veh9_mil_cargo_truck");
    spawners = namespace_43bf74a2ee9234c0::function_f260b1cef943f1ab("veh9_mil_cargo_truck", 7, var_b4d3f717373af2bb, self.node.origin, var_171f90b9c4c76d44, "absolute");
    riders = namespace_43bf74a2ee9234c0::function_4ad6c25d6754f697(spawners, 7, undefined, "absolute", "convoy_attack", "convoy_attack", "team_hundred_ninety_five", undefined, "veh9_mil_cargo_truck_convoy_attack");
    if (riders.size > 0) {
        vehicle thread function_d9592f915ec62177(riders[0]);
        foreach (rider in riders) {
            rider.var_c7845d939c783cef = 1;
        }
    }
    vehicle namespace_1f188a13f7e79610::function_f92faaaf5c5077c6(riders, 1, 1);
    vehicle function_859ffd6bdcf262a7((33, 23, 10), (0, 90, 0));
    vehicle function_859ffd6bdcf262a7((33, -23, 10), (0, 90, 0));
    return vehicle;
}

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd0
// Size: 0x7a
function function_30dea07ecda5db65() {
    if (istrue(self.var_ae2f44687c8afa77)) {
        return;
    }
    self.var_ae2f44687c8afa77 = 1;
    foreach (cache in self.caches) {
        cache setscriptablepartstate("body", "closed_usable");
    }
}

// Namespace namespace_38f7228a0bb0b8a8/namespace_a3ac717bde4bea03
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc51
// Size: 0x44
function private function_d9592f915ec62177(driver) {
    self endon("death");
    self endon("unloaded");
    driver waittill("death");
    if (!isdefined(self)) {
        return;
    }
    self.task function_30dea07ecda5db65();
    namespace_d2c35aa0ab3fe2d2::function_ab0ee2215eb51dd5("combat");
}

