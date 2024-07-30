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
#using scripts\common\cap.gsc;
#using scripts\common\vehicle_aianim.gsc;
#using scripts\smartobjects\utility.gsc;
#using scripts\engine\trace.gsc;

#namespace combat;

// Namespace combat / scripts\aitypes\combat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x226
// Size: 0x34
function soldier_init_common() {
    scripts\common\cap::init_cap();
    self.var_d318c0abaf5b25e = 0;
    self.var_6a2525ae2b942b46 = 1.5;
    self function_8bbcaeb23a1512ef("all", 1, "bt");
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x262
// Size: 0x199
function function_33ef051afbf024e2(guy) {
    points = [];
    forward = anglestoforward(self.angles);
    left = anglestoleft(self.angles);
    up = anglestoup(self.angles);
    guyspeed = 0;
    guyvehicle = guy getlinkedparent();
    guyspeed = length(guyvehicle vehicle_getvelocity());
    var_39c92ff067275632 = anglestoforward(guyvehicle.angles);
    selfvelocity = self vehicle_getvelocity();
    selfspeed = length(selfvelocity);
    isreverse = vectordot(forward, selfvelocity) < 0;
    if (isreverse) {
        selfspeed *= -1;
    }
    var_e1d42175c57e7465 = [];
    var_e1d42175c57e7465[0] = (-50, 0, -10);
    foreach (offsetdata in var_e1d42175c57e7465) {
        forwardvector = forward * offsetdata[0];
        leftvector = left * offsetdata[1];
        upvector = up * offsetdata[2];
        point = self.origin + forwardvector + leftvector + upvector;
        points[points.size] = point;
    }
    return points;
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x404
// Size: 0x5c7
function vehiclejump(taskid) {
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
    animresult = archetypegetrandomalias(var_71e1dfcb6998d10c, "vehicle_jumper_jump", var_84cacb9685561983, asm_isfrantic());
    if (!isdefined(animresult)) {
        return anim.failure;
    }
    var_52fc5266dce0c05b = player_vehicle.vehicleanimalias;
    var_90549d1e920415d4 = string(2);
    animresult = archetypegetrandomalias(var_52fc5266dce0c05b, "vehicle_jumper_get_up", var_90549d1e920415d4, asm_isfrantic());
    if (!isdefined(animresult)) {
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
    facing_yaw = angleclamp(self.angles[1]);
    angle_diff = angleclamp180(var_be2f619c49b49ae3 - facing_yaw);
    if (var_cbf88131408c3aed && abs(angle_diff) > 45) {
        return anim.failure;
    }
    if (!self islinked()) {
        return anim.failure;
    }
    jumpdata = spawnstruct();
    jumpdata.vehicle = player_vehicle;
    jumpdata.prevvehicle = vehicle;
    points = player_vehicle function_33ef051afbf024e2(self);
    var_195256e3fcc08d9a = 99999999;
    foreach (index, point in points) {
        var_c5675affb3e31d81 = distancesquared(point, self.origin);
        if (var_c5675affb3e31d81 <= 57600) {
            jumpdata.index = index;
            jumpdata.point = point;
            var_195256e3fcc08d9a = var_c5675affb3e31d81;
            break;
        }
    }
    if (!isdefined(jumpdata.point)) {
        return anim.failure;
    }
    foreach (rider in vehicle.riders) {
        if (self != rider) {
            var_4f75be2d248978d3 = vehicle.health < 25;
            if (rider.vehicle_position != 0 || var_4f75be2d248978d3) {
                if (distancesquared(jumpdata.point, rider.origin) < var_195256e3fcc08d9a) {
                    return anim.failure;
                }
            }
        }
    }
    vehicle_yaw = angleclamp180(player_vehicle.angles[1]);
    angles = vectortoangles(self.origin - jumpdata.point);
    yaw = angleclamp180(angles[1]);
    yaw_diff = angleclamp180(yaw - vehicle_yaw);
    if (yaw_diff < 90 - 16 / 2 && yaw_diff > -1 * (90 - 16 / 2) || yaw_diff > 90 + 16 / 2 || yaw_diff < -1 * (90 + 16 / 2)) {
        return anim.failure;
    }
    self.jumpdata = jumpdata;
    player_vehicle.var_b0c6c07e072eaade = self;
    level.var_e9c7f2ae8af2293b = gettime() + 20000;
    scripts\common\cap::cap_start("vehicle_jumper", player_vehicle.vehicleanimalias);
    vehicle.riders = array_remove(vehicle.riders, self);
    return anim.success;
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9d4
// Size: 0x8a
function function_a38ad5564fcafc54(taskid) {
    vehicle = self._blackboard.currentvehicle;
    if (!isdefined(vehicle)) {
        return anim.failure;
    }
    pos = self._blackboard.var_9176cae5619d7fba;
    aianims = scripts\common\vehicle_aianim::anim_pos(vehicle, pos);
    if (!istrue(aianims.var_a06d61eb83f02f4)) {
        return anim.failure;
    }
    return anim.success;
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa67
// Size: 0x11e
function updateeveryframe_noncombat(taskid) {
    bb_requestweapon(weaponclass(self.primaryweapon));
    whizbyevent = asm_getephemeraleventdata("ai_notify", "bulletwhizby");
    if (isdefined(whizbyevent)) {
        if (!self.disablebulletwhizbyreaction) {
            var_34a49a1027e86ac0 = whizbyevent[0];
            enemynear = isdefined(var_34a49a1027e86ac0) && distancesquared(self.origin, var_34a49a1027e86ac0.origin) < 160000;
            if (enemynear || cointoss()) {
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

// Namespace combat / scripts\aitypes\combat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb8e
// Size: 0x1a
function shouldbefrantic() {
    if (isdefined(self.frantic)) {
        return self.frantic;
    }
    return 0;
}

// Namespace combat / scripts\aitypes\combat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbb1
// Size: 0x4b
function hasammoinclip() {
    turret = getusedturret();
    if (isdefined(turret)) {
        return true;
    }
    if (!isdefined(self.weapon)) {
        return false;
    }
    if (self.bulletsinclip > 0 || istrue(self.disablereload)) {
        return true;
    }
    return false;
}

// Namespace combat / scripts\aitypes\combat
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc05
// Size: 0x30
function islowonammo(task, params) {
    if (scripts\anim\utility_common::needtoreload(params)) {
        return anim.success;
    }
    return anim.failure;
}

// Namespace combat / scripts\aitypes\combat
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc3e
// Size: 0x65
function withindistancetoenemy(task, params) {
    if (!isdefined(self.enemy)) {
        return anim.failure;
    }
    if (distancesquared(self.origin, self.enemy.origin) <= params * params) {
        return anim.success;
    }
    return anim.failure;
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcac
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

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd19
// Size: 0x4b
function updatelooktarget(taskid) {
    if (!isdefined(self.looktarget) || self.looktarget != self.enemy) {
        self.looktarget = self.enemy;
    }
    return anim.success;
}

// Namespace combat / scripts\aitypes\combat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd6d
// Size: 0x17
function shoot_clearconvergence() {
    self._blackboard.shootparams_bconvergeontarget = 0;
}

// Namespace combat / scripts\aitypes\combat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd8c
// Size: 0x18
function shoot_enableconvergence() {
    self._blackboard.shootparams_bconvergeontarget = 1;
}

// Namespace combat / scripts\aitypes\combat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdac
// Size: 0x16
function isaimedataimtarget() {
    return isdefined(self.var_a709fbd9fea148f6) && self aimedataimtarget();
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdcb
// Size: 0x38
function hasatleastammo(threshold) {
    if (isnullweapon(self.weapon)) {
        return false;
    }
    return self.bulletsinclip >= weaponclipsize(self.weapon) * threshold;
}

// Namespace combat / scripts\aitypes\combat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe0c
// Size: 0x4f
function reload_cheatammo() {
    clipsize = weaponclipsize(self.weapon);
    self.bulletsinclip = int(clipsize * 0.5);
    self.bulletsinclip = int(clamp(self.bulletsinclip, 0, clipsize));
}

// Namespace combat / scripts\aitypes\combat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe63
// Size: 0x2f
function shouldbeajerk() {
    if (!isdefined(level.gameskill)) {
        return false;
    }
    return level.gameskill == 3 && isplayer(self.enemy);
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe9b
// Size: 0x32
function shoulddosemiforvariety(distancesq) {
    choice = randomfloat(1);
    var_824f089b7c5f24be = shoulddosemiprobabilityline(distancesq);
    return choice <= var_824f089b7c5f24be;
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xed6
// Size: 0x3d
function shoulddosemiprobabilityline(distancetotarget) {
    if (distancetotarget < 2.56e+06) {
        return -1;
    }
    return -0.3 / 6.44e+06 * distancetotarget - -0.3 / 6.44e+06 * 2.56e+06 + 0.5;
}

// Namespace combat / scripts\aitypes\combat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf1c
// Size: 0x1b
function getusedturret() {
    if (isdefined(self.fngetusedturret)) {
        return [[ self.fngetusedturret ]]();
    }
}

// Namespace combat / scripts\aitypes\combat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf3f
// Size: 0xc9
function shouldshoot() {
    if (!self aimayshoot()) {
        return false;
    }
    if (istrue(self._blackboard.partialgestureplaying)) {
        /#
            if (getdvarint(@"hash_3493aa8adc34457e", 0)) {
                print3d(self.origin - (0, 0, 12), "<dev string:x1c>", (1, 0, 0), 1, 0.75);
            }
        #/
        return false;
    }
    if (self function_53fb16fcb6043bbc()) {
        /#
            if (getdvarint(@"hash_3493aa8adc34457e", 0)) {
                print3d(self.origin - (0, 0, 12), "<dev string:x29>", (1, 0, 0), 1, 0.75);
            }
        #/
        return false;
    }
    return true;
}

// Namespace combat / scripts\aitypes\combat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1011
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
            print3d(self.origin - (0, 0, 12), "<dev string:x42>", (1, 0, 0), 1, 0.75);
        }
    #/
    return var_9578a7ed2d4e36ed;
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10b5
// Size: 0x285
function isenemyinlowcover(taskid) {
    if (!isdefined(self.enemy) || !issentient(self.enemy)) {
        return anim.failure;
    }
    if (self.in_melee) {
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
    linkednodes = self.enemy.lowcovervolume get_linked_nodes();
    if (linkednodes.size == 0) {
        return anim.failure;
    }
    linkednodes = sortbydistance(linkednodes, lastknownpos);
    foreach (node in linkednodes) {
        if (isdefined(getnodeowner(node)) && getnodeowner(node) != self) {
            continue;
        }
        self setbtgoalnode(1, node);
        self setbtgoalradius(1, 12);
        return anim.success;
    }
    return anim.failure;
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1343
// Size: 0x9c
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
        return true;
    }
    return false;
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13e8
// Size: 0x28
function turretrequested(task) {
    if (isdefined(bb_getrequestedturret())) {
        return anim.success;
    }
    return anim.failure;
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1419
// Size: 0xae
function ifshoulddosmartobject(taskid) {
    smartobj = bb_getrequestedsmartobject();
    if (!isdefined(smartobj)) {
        return anim.failure;
    }
    if (isdefined(self.disablesmartobjects)) {
        return anim.failure;
    }
    zdiff = self.origin[2] - smartobj.origin[2];
    if (zdiff * zdiff > 5184) {
        return anim.failure;
    }
    if (distance2dsquared(self.origin, smartobj.origin) > 225) {
        return anim.failure;
    }
    return anim.success;
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14d0
// Size: 0x53
function dosmartobject_init(taskid) {
    bb_requestplaysmartobject();
    if (isdefined(self.var_a41edf45bb0ff97)) {
        self.var_a41edf45bb0ff97 = undefined;
    }
    self.bt.instancedata[taskid] = self.disableautolookat;
    self.disableautolookat = 1;
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x152b
// Size: 0x4b
function dosmartobject(taskid) {
    if (self asmephemeraleventfired("smartobject", "finished")) {
        smartobj = bb_getrequestedsmartobject();
        smartobj scripts\smartobjects\utility::smartobject_setnextuse();
        return anim.success;
    }
    return anim.running;
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x157f
// Size: 0x4b
function dosmartobjectterminate(taskid) {
    scripts\smartobjects\utility::clearsmartobject(bb_getrequestedsmartobject());
    self.disableautolookat = self.bt.instancedata[taskid];
    self.bt.instancedata[taskid] = undefined;
}

// Namespace combat / scripts\aitypes\combat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15d2
// Size: 0x19d
function low_cover_combat_areas() {
    if (istrue(level.low_cover_combat_setup)) {
        return;
    }
    level.low_cover_combat_setup = 1;
    /#
        setdvarifuninitialized(@"hash_e9e10e8b10abb8b", 0);
    #/
    while (true) {
        lowareas = getentarray("low_cover_area", "targetname");
        foreach (player in level.players) {
            covervol = undefined;
            foreach (vol in lowareas) {
                if (istrue(vol.disabled)) {
                    continue;
                }
                if (ispointinvolume(player.origin, vol)) {
                    covervol = vol;
                    break;
                }
            }
            if (isdefined(player.lowcovervolume) && (!isdefined(covervol) || player.lowcovervolume != covervol)) {
                player notify("left_low_cover");
                player.underlowcover = 0;
            }
            if (isdefined(covervol) && (!isdefined(player.lowcovervolume) || covervol != player.lowcovervolume)) {
                player thread transfer_damage_to_player(covervol);
                player thread player_under_low_cover_monitor(covervol);
            }
            player.lowcovervolume = covervol;
        }
        waitframe();
    }
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1777
// Size: 0x112
function player_under_low_cover_monitor(vol) {
    self endon("left_low_cover");
    self endon("death");
    dotrace = 1;
    if (isdefined(vol.script_trace) && vol.script_trace == 0) {
        dotrace = 0;
    }
    while (true) {
        if (dotrace && !scripts\engine\trace::ray_trace_passed(self.origin, self.origin + (0, 0, 60), self)) {
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
        wait 0.15;
    }
}

// Namespace combat / scripts\aitypes\combat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1891
// Size: 0x182
function transfer_damage_to_player(vol) {
    self endon("left_low_cover");
    self endon("death");
    dmg_trig = vol get_linked_ents()[0];
    if (!isdefined(dmg_trig)) {
        return;
    }
    first_shot = 1;
    while (isdefined(dmg_trig)) {
        amt, attacker, dir, point, type, modelname, tagname, partname, dflags, objweapon = dmg_trig waittill("damage");
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
            if (first_shot) {
                first_shot = 0;
                wait 2;
                continue;
            }
        }
        self dodamage(amt, attacker.origin, attacker, attacker, type, attacker.weapon);
    }
}

