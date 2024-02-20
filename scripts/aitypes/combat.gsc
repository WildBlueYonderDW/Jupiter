// mwiii decomp prototype
#using scripts\asm\shared\utility.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_3433ee6b63c7e243;
#using scripts\anim\weaponlist.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\aitypes\squad.gsc;
#using script_10b6724c15a95e8;
#using scripts\common\vehicle_aianim.gsc;
#using scripts\smartobjects\utility.gsc;
#using scripts\engine\trace.gsc;

#namespace combat;

// Namespace combat/namespace_17c3bf83be64b180
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b2
// Size: 0x35
function soldier_init_common() {
    namespace_aebb27832287cd3a::function_136fb87ad4393ef8();
    self.var_d318c0abaf5b25e = 0;
    self.var_6a2525ae2b942b46 = 1.5;
    self function_8bbcaeb23a1512ef("all", 1, "bt");
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ee
// Size: 0x1aa
function function_33ef051afbf024e2(guy) {
    points = [];
    forward = anglestoforward(self.angles);
    left = anglestoleft(self.angles);
    up = anglestoup(self.angles);
    var_d11bf1a777808ccf = 0;
    var_cf861af60ef5e2ec = guy getlinkedparent();
    var_d11bf1a777808ccf = length(var_cf861af60ef5e2ec vehicle_getvelocity());
    var_39c92ff067275632 = anglestoforward(var_cf861af60ef5e2ec.angles);
    var_ae8c9c005807883c = self vehicle_getvelocity();
    var_1fe3b79cf50144b6 = length(var_ae8c9c005807883c);
    var_59c6b9d8325f6109 = vectordot(forward, var_ae8c9c005807883c) < 0;
    if (var_59c6b9d8325f6109) {
        var_1fe3b79cf50144b6 = var_1fe3b79cf50144b6 * -1;
    }
    var_e1d42175c57e7465 = [];
    var_e1d42175c57e7465[0] = (-50, 0, -10);
    foreach (var_45d7c8963b34d98e in var_e1d42175c57e7465) {
        forwardvector = forward * var_45d7c8963b34d98e[0];
        var_f6aa960eff3521cb = left * var_45d7c8963b34d98e[1];
        upvector = up * var_45d7c8963b34d98e[2];
        point = self.origin + forwardvector + var_f6aa960eff3521cb + upvector;
        points[points.size] = point;
    }
    return points;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a0
// Size: 0x5e2
function function_f7d7f5a416ba048f(taskid) {
    if (!getdvarint(@"hash_18f07c17515921ea")) {
        return anim.failure;
    }
    if (!istrue(self.var_a4ec4541434ca606)) {
        return anim.failure;
    }
    vehicle = self._blackboard.currentvehicle;
    if (gettime() < 5000) {
        return anim.failure;
    }
    if (!isdefined(level.player.veh)) {
        return anim.failure;
    }
    player_vehicle = level.player.veh;
    if (isdefined(player_vehicle.var_b0c6c07e072eaade)) {
        return anim.failure;
    }
    if (!isdefined(level.var_e9c7f2ae8af2293b)) {
        level.var_e9c7f2ae8af2293b = 0;
    }
    if (gettime() < level.var_e9c7f2ae8af2293b) {
        return anim.failure;
    }
    if (istrue(self.var_58e8388f04abb64e)) {
        return anim.failure;
    }
    var_71e1dfcb6998d10c = self._blackboard.currentvehicleanimalias;
    var_84cacb9685561983 = string(self._blackboard.var_9176cae5619d7fba);
    var_eabf81b5be8ddb5 = archetypegetrandomalias(var_71e1dfcb6998d10c, "vehicle_jumper_jump", var_84cacb9685561983, asm_isfrantic());
    if (!isdefined(var_eabf81b5be8ddb5)) {
        return anim.failure;
    }
    var_52fc5266dce0c05b = player_vehicle.vehicleanimalias;
    var_90549d1e920415d4 = string(2);
    var_eabf81b5be8ddb5 = archetypegetrandomalias(var_52fc5266dce0c05b, "vehicle_jumper_get_up", var_90549d1e920415d4, asm_isfrantic());
    if (!isdefined(var_eabf81b5be8ddb5)) {
        return anim.failure;
    }
    if (!isalive(player_vehicle)) {
        return anim.failure;
    }
    if (distancesquared(player_vehicle.origin, vehicle.origin) > 40000) {
        return anim.failure;
    }
    if (self.vehicle_position == 0) {
        var_3c883bb046ccbae8 = vehicle.riders.size == 1 || vehicle.health < 25;
        if (!var_3c883bb046ccbae8) {
            return anim.failure;
        }
    }
    var_cbf88131408c3aed = istrue(self._blackboard.var_6a69fa6b0b354c93) && istrue(self.canshootinvehicle);
    var_501e62dddf768fc8 = vectortoangles(player_vehicle.origin - self.origin);
    var_be2f619c49b49ae3 = angleclamp(var_501e62dddf768fc8[1]);
    var_67177e1cf8a6c99f = angleclamp(self.angles[1]);
    angle_diff = angleclamp180(var_be2f619c49b49ae3 - var_67177e1cf8a6c99f);
    if (var_cbf88131408c3aed && abs(angle_diff) > 45) {
        return anim.failure;
    }
    if (!self islinked()) {
        return anim.failure;
    }
    var_f76e63791a19d879 = spawnstruct();
    var_f76e63791a19d879.vehicle = player_vehicle;
    var_f76e63791a19d879.var_a6de8ec9ba768684 = vehicle;
    points = player_vehicle function_33ef051afbf024e2(self);
    var_195256e3fcc08d9a = 99999999;
    foreach (index, point in points) {
        var_c5675affb3e31d81 = distancesquared(point, self.origin);
        if (var_c5675affb3e31d81 <= 57600) {
            var_f76e63791a19d879.index = index;
            var_f76e63791a19d879.point = point;
            var_195256e3fcc08d9a = var_c5675affb3e31d81;
            break;
        }
    }
    if (!isdefined(var_f76e63791a19d879.point)) {
        return anim.failure;
    }
    foreach (rider in vehicle.riders) {
        if (self != rider) {
            var_4f75be2d248978d3 = vehicle.health < 25;
            if (rider.vehicle_position != 0 || var_4f75be2d248978d3) {
                if (distancesquared(var_f76e63791a19d879.point, rider.origin) < var_195256e3fcc08d9a) {
                    return anim.failure;
                }
            }
        }
    }
    var_23d3ac64c943c87f = angleclamp180(player_vehicle.angles[1]);
    angles = vectortoangles(self.origin - var_f76e63791a19d879.point);
    yaw = angleclamp180(angles[1]);
    yaw_diff = angleclamp180(yaw - var_23d3ac64c943c87f);
    if (yaw_diff < 90 - 16 / 2 && yaw_diff > -1 * (90 - 16 / 2) || yaw_diff > 90 + 16 / 2 || yaw_diff < -1 * (90 + 16 / 2)) {
        return anim.failure;
    }
    self.var_f76e63791a19d879 = var_f76e63791a19d879;
    player_vehicle.var_b0c6c07e072eaade = self;
    level.var_e9c7f2ae8af2293b = gettime() + 20000;
    namespace_aebb27832287cd3a::cap_start("vehicle_jumper", player_vehicle.vehicleanimalias);
    vehicle.riders = array_remove(vehicle.riders, self);
    return anim.success;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x98a
// Size: 0x8c
function function_a38ad5564fcafc54(taskid) {
    vehicle = self._blackboard.currentvehicle;
    if (!isdefined(vehicle)) {
        return anim.failure;
    }
    pos = self._blackboard.var_9176cae5619d7fba;
    aianims = namespace_4ff41449ab14a3a0::anim_pos(vehicle, pos);
    if (!istrue(aianims.var_a06d61eb83f02f4)) {
        return anim.failure;
    }
    return anim.success;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa1e
// Size: 0x121
function updateeveryframe_noncombat(taskid) {
    bb_requestweapon(weaponclass(self.primaryweapon));
    whizbyevent = asm_getephemeraleventdata("ai_notify", "bulletwhizby");
    if (isdefined(whizbyevent)) {
        if (!self.disablebulletwhizbyreaction) {
            var_34a49a1027e86ac0 = whizbyevent[0];
            var_af242c2d23f38691 = isdefined(var_34a49a1027e86ac0) && distancesquared(self.origin, var_34a49a1027e86ac0.origin) < 160000;
            if (var_af242c2d23f38691 || cointoss()) {
                self._blackboard.var_9f7c458052d2c805 = gettime() - 50;
            }
        }
    } else {
        var_4b4adf39cfe6c5af = 100;
        if (isdefined(self._blackboard.var_9f7c458052d2c805) && gettime() > self._blackboard.var_9f7c458052d2c805 + var_4b4adf39cfe6c5af) {
            self._blackboard.var_9f7c458052d2c805 = undefined;
        }
    }
    self.looktarget = undefined;
    return anim.success;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb47
// Size: 0x1b
function shouldbefrantic() {
    if (isdefined(self.frantic)) {
        return self.frantic;
    }
    return 0;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6a
// Size: 0x4b
function hasammoinclip() {
    turret = getusedturret();
    if (isdefined(turret)) {
        return 1;
    }
    if (!isdefined(self.weapon)) {
        return 0;
    }
    if (self.bulletsinclip > 0 || istrue(self.disablereload)) {
        return 1;
    }
    return 0;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbbd
// Size: 0x31
function islowonammo(task, params) {
    if (namespace_7843e1029b5c80e::needtoreload(params)) {
        return anim.success;
    }
    return anim.failure;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbf6
// Size: 0x66
function withindistancetoenemy(task, params) {
    if (!isdefined(self.enemy)) {
        return anim.failure;
    }
    if (distancesquared(self.origin, self.enemy.origin) <= params * params) {
        return anim.success;
    }
    return anim.failure;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc64
// Size: 0x64
function mayshoot(task) {
    if (!isdefined(self.weapon)) {
        return anim.failure;
    }
    var_9578a7ed2d4e36ed = shouldshoot();
    if (var_9578a7ed2d4e36ed) {
        var_9578a7ed2d4e36ed = calcgoodshootpos();
    } else {
        self.goodshootpos = undefined;
    }
    if (!var_9578a7ed2d4e36ed) {
        return anim.failure;
    }
    return anim.success;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcd0
// Size: 0x4c
function updatelooktarget(taskid) {
    if (!isdefined(self.looktarget) || self.looktarget != self.enemy) {
        self.looktarget = self.enemy;
    }
    return anim.success;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd24
// Size: 0x18
function shoot_clearconvergence() {
    self._blackboard.shootparams_bconvergeontarget = 0;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd43
// Size: 0x19
function shoot_enableconvergence() {
    self._blackboard.shootparams_bconvergeontarget = 1;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd63
// Size: 0x17
function isaimedataimtarget() {
    return isdefined(self.var_a709fbd9fea148f6) && self aimedataimtarget();
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd82
// Size: 0x39
function hasatleastammo(threshold) {
    if (isnullweapon(self.weapon)) {
        return 0;
    }
    return self.bulletsinclip >= weaponclipsize(self.weapon) * threshold;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdc3
// Size: 0x4f
function reload_cheatammo() {
    clipsize = weaponclipsize(self.weapon);
    self.bulletsinclip = int(clipsize * 0.5);
    self.bulletsinclip = int(clamp(self.bulletsinclip, 0, clipsize));
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe19
// Size: 0x30
function shouldbeajerk() {
    if (!isdefined(level.gameskill)) {
        return 0;
    }
    return level.gameskill == 3 && isplayer(self.enemy);
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe51
// Size: 0x33
function shoulddosemiforvariety(distancesq) {
    choice = randomfloat(1);
    var_824f089b7c5f24be = shoulddosemiprobabilityline(distancesq);
    return choice <= var_824f089b7c5f24be;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8c
// Size: 0x3e
function shoulddosemiprobabilityline(distancetotarget) {
    if (distancetotarget < 2.56e+06) {
        return -1;
    }
    return -0.3 / 6.44e+06 * distancetotarget - -0.3 / 6.44e+06 * 2.56e+06 + 0.5;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed2
// Size: 0x1c
function getusedturret() {
    if (isdefined(self.fngetusedturret)) {
        return [[ self.fngetusedturret ]]();
    }
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef5
// Size: 0xca
function shouldshoot() {
    if (!self aimayshoot()) {
        return 0;
    }
    if (istrue(self._blackboard.partialgestureplaying)) {
        /#
            if (getdvarint(@"hash_3493aa8adc34457e", 0)) {
                print3d(self.origin - (0, 0, 12), "<unknown string>", (1, 0, 0), 1, 0.75);
            }
        #/
        return 0;
    }
    if (self function_53fb16fcb6043bbc()) {
        /#
            if (getdvarint(@"hash_3493aa8adc34457e", 0)) {
                print3d(self.origin - (0, 0, 12), "<unknown string>", (1, 0, 0), 1, 0.75);
            }
        #/
        return 0;
    }
    return 1;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc7
// Size: 0x9b
function calcgoodshootpos() {
    if (self cansee(self.enemy)) {
        if (self canshootenemy()) {
            self.goodshootpos = self.enemy getshootatpos();
            return 1;
        }
    }
    var_9578a7ed2d4e36ed = cansuppressenemy();
    /#
        if (!var_9578a7ed2d4e36ed && getdvarint(@"hash_3493aa8adc34457e", 0)) {
            print3d(self.origin - (0, 0, 12), "<unknown string>", (1, 0, 0), 1, 0.75);
        }
    #/
    return var_9578a7ed2d4e36ed;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x106a
// Size: 0x28d
function isenemyinlowcover(taskid) {
    if (!isdefined(self.enemy) || !issentient(self.enemy)) {
        return anim.failure;
    }
    if (self.var_a97ac004f00c5df9) {
        return anim.failure;
    }
    if (!isdefined(self.enemy.lowcovervolume)) {
        return anim.failure;
    }
    if (!istrue(self.enemy.underlowcover)) {
        return anim.failure;
    }
    if (istrue(self.var_3db4fa492bdd5986)) {
        return anim.failure;
    }
    lastknownpos = self lastknownpos(self.enemy);
    var_9bc7ed05ea9a9090 = 0;
    if (istrue(self.aggressivelowcovermode)) {
        var_fc22138908af2b15 = distancesquared(self.origin, lastknownpos);
        var_95fbb30c0d7a739d = 3600;
        if (isdefined(self.var_c46e0df7e4fc8d94) && self.var_c46e0df7e4fc8d94 > 0) {
            var_95fbb30c0d7a739d = self.var_c46e0df7e4fc8d94 * self.var_c46e0df7e4fc8d94;
        }
        if (var_fc22138908af2b15 < var_95fbb30c0d7a739d) {
            var_9bc7ed05ea9a9090 = 1;
        } else if (distancesquared(self.origin, self.enemy.origin) < var_95fbb30c0d7a739d) {
            var_9bc7ed05ea9a9090 = 1;
        }
    }
    if (!var_9bc7ed05ea9a9090) {
        lastknowntime = self lastknowntime(self.enemy);
        if (lastknowntime <= gettime() - 5000) {
            return anim.failure;
        }
        if (!ispointinvolume(lastknownpos, self.enemy.lowcovervolume)) {
            return anim.failure;
        }
    }
    var_4eda5e21d64652a1 = self.enemy.lowcovervolume get_linked_nodes();
    if (var_4eda5e21d64652a1.size == 0) {
        return anim.failure;
    }
    var_4eda5e21d64652a1 = sortbydistance(var_4eda5e21d64652a1, lastknownpos);
    foreach (node in var_4eda5e21d64652a1) {
        if (isdefined(getnodeowner(node)) && getnodeowner(node) != self) {
            continue;
        }
        self setbtgoalnode(1, node);
        self setbtgoalradius(1, 12);
        return anim.success;
    }
    return anim.failure;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12ff
// Size: 0x9d
function valid_reaction_sound(npcid) {
    switch (npcid) {
    case #"hash_31100bbc01bd3230":
    case #"hash_31100cbc01bd33c3":
    case #"hash_31100fbc01bd387c":
    case #"hash_311010bc01bd3a0f":
    case #"hash_311011bc01bd3ba2":
    case #"hash_311012bc01bd3d35":
    case #"hash_3689ba6c261f7001":
    case #"hash_9009aa6c552a085a":
    case #"hash_fa4482f6bd79a6ac":
    case #"hash_fa4484f6bd79a9d2":
    case #"hash_fa4485f6bd79ab65":
        return 1;
        break;
    }
    return 0;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13a4
// Size: 0x29
function turretrequested(task) {
    if (isdefined(bb_getrequestedturret())) {
        return anim.success;
    }
    return anim.failure;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13d5
// Size: 0xaf
function ifshoulddosmartobject(taskid) {
    var_6c66de307018dfe3 = bb_getrequestedsmartobject();
    if (!isdefined(var_6c66de307018dfe3)) {
        return anim.failure;
    }
    if (isdefined(self.disablesmartobjects)) {
        return anim.failure;
    }
    zdiff = self.origin[2] - var_6c66de307018dfe3.origin[2];
    if (zdiff * zdiff > 5184) {
        return anim.failure;
    }
    if (distance2dsquared(self.origin, var_6c66de307018dfe3.origin) > 225) {
        return anim.failure;
    }
    return anim.success;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x148c
// Size: 0x54
function dosmartobject_init(taskid) {
    bb_requestplaysmartobject();
    if (isdefined(self.var_a41edf45bb0ff97)) {
        self.var_a41edf45bb0ff97 = undefined;
    }
    self.bt.instancedata[taskid] = self.disableautolookat;
    self.disableautolookat = 1;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14e7
// Size: 0x4b
function dosmartobject(taskid) {
    if (self asmephemeraleventfired("smartobject", "finished")) {
        var_6c66de307018dfe3 = bb_getrequestedsmartobject();
        var_6c66de307018dfe3 namespace_277f7d3daf8f1a98::smartobject_setnextuse();
        return anim.success;
    }
    return anim.running;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x153a
// Size: 0x4c
function dosmartobjectterminate(taskid) {
    namespace_277f7d3daf8f1a98::clearsmartobject(bb_getrequestedsmartobject());
    self.disableautolookat = self.bt.instancedata[taskid];
    self.bt.instancedata[taskid] = undefined;
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x158d
// Size: 0x1a4
function low_cover_combat_areas() {
    if (istrue(level.low_cover_combat_setup)) {
        return;
    }
    level.low_cover_combat_setup = 1;
    /#
        setdvarifuninitialized(@"hash_e9e10e8b10abb8b", 0);
    #/
    while (1) {
        var_4a8b1ab1c3ece95d = getentarray("low_cover_area", "targetname");
        foreach (player in level.players) {
            var_73cefd4ae5e1adcd = undefined;
            foreach (vol in var_4a8b1ab1c3ece95d) {
                if (istrue(vol.disabled)) {
                    continue;
                }
                if (ispointinvolume(player.origin, vol)) {
                    var_73cefd4ae5e1adcd = vol;
                    break;
                }
            }
            if (isdefined(player.lowcovervolume) && (!isdefined(var_73cefd4ae5e1adcd) || player.lowcovervolume != var_73cefd4ae5e1adcd)) {
                player notify("left_low_cover");
                player.underlowcover = 0;
            }
            if (isdefined(var_73cefd4ae5e1adcd) && (!isdefined(player.lowcovervolume) || var_73cefd4ae5e1adcd != player.lowcovervolume)) {
                player thread transfer_damage_to_player(var_73cefd4ae5e1adcd);
                player thread player_under_low_cover_monitor(var_73cefd4ae5e1adcd);
            }
            player.lowcovervolume = var_73cefd4ae5e1adcd;
        }
        waitframe();
    }
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1738
// Size: 0x112
function player_under_low_cover_monitor(vol) {
    self endon("left_low_cover");
    self endon("death");
    dotrace = 1;
    if (isdefined(vol.script_trace) && vol.script_trace == 0) {
        dotrace = 0;
    }
    while (1) {
        if (dotrace && !namespace_2a184fc4902783dc::ray_trace_passed(self.origin, self.origin + (0, 0, 60), self)) {
            self.underlowcover = 1;
        } else if (!dotrace && ispointinvolume(self.origin, vol)) {
            self.underlowcover = 1;
        } else {
            self.underlowcover = 0;
        }
        /#
            if (getdvarint(@"hash_e9e10e8b10abb8b") && self.underlowcover) {
                line(self.origin, vol.origin, (1, 1, 1), 1, 0, 3);
            }
        #/
        wait(0.15);
    }
}

// Namespace combat/namespace_17c3bf83be64b180
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1851
// Size: 0x18f
function transfer_damage_to_player(vol) {
    self endon("left_low_cover");
    self endon("death");
    dmg_trig = vol get_linked_ents()[0];
    if (!isdefined(dmg_trig)) {
        return;
    }
    var_17ad3a838dca5866 = 1;
    while (isdefined(dmg_trig)) {
        objweapon = dflags = partname = tagname = modelname = type = point = dir = attacker = amt = dmg_trig waittill("damage");
        if (!isalive(attacker)) {
            continue;
        }
        if (attacker == self) {
            continue;
        }
        if (!self istouching(dmg_trig)) {
            continue;
        }
        if (is_equal(type, "MOD_MELEE")) {
            continue;
        }
        if (issubstr(type, "BULLET")) {
            forward = anglestoforward(attacker gettagangles("tag_flash"));
            normal = vectornormalize(self geteye() - attacker gettagorigin("tag_flash"));
            if (vectordot(forward, normal) < 0.9) {
                continue;
            }
            if (var_17ad3a838dca5866) {
                var_17ad3a838dca5866 = 0;
                wait(2);
                continue;
            }
        }
        self dodamage(amt, attacker.origin, attacker, attacker, type, attacker.weapon);
    }
}

