#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gametypes\br_lootchopper.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\cp_mp\killstreaks\chopper_support.gsc;
#using scripts\mp\utility\teams.gsc;

#namespace namespace_1e78e6063f4018af;

// Namespace namespace_1e78e6063f4018af / namespace_7921f301da16c1ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d3
// Size: 0x16
function init() {
    if (!isdefined(level.loot_choppers)) {
        scripts\mp\gametypes\br_lootchopper::init();
    }
}

// Namespace namespace_1e78e6063f4018af / namespace_7921f301da16c1ba
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2f1
// Size: 0x7fa
function function_3ddb1de0c470a2b2(var_9ca5b7427ae3d1f2, initialtarget, initialorigin, spawn_properties) {
    level.averagealliesz = 0;
    startingposition = initialorigin;
    startingangles = (0, 0, 0);
    spawnvehicletype = "veh_chopper_support_dmz_mp";
    chopper = scripts\cp_mp\vehicles\vehicle_tracking::_spawnhelicopter(undefined, startingposition, startingangles, spawnvehicletype, "veh8_mil_air_palfa_east");
    if (!isdefined(chopper)) {
        return;
    }
    chopper.speed = spawn_properties.speed;
    chopper.accel = spawn_properties.accel;
    chopper.lifetime = getdvarint(@"hash_c9bf362f07c0b844", 9999);
    chopper.team = spawn_properties.team;
    chopper.angles = startingangles;
    chopper.flaresreservecount = getdvarint(@"hash_8bb2d173674d701a", 0);
    chopper.pathstart = startingposition;
    chopper.pathgoal = var_9ca5b7427ae3d1f2.origin;
    chopper.currentaction = undefined;
    chopper.currenttarget = var_9ca5b7427ae3d1f2;
    chopper.heightoffset = (0, 0, getdvarint(@"hash_5e4f7a1dffad4bd0", 750));
    chopper.patrolzone = undefined;
    chopper.patrollocation = undefined;
    chopper.patrolradius = undefined;
    chopper.stage3accradius = 35;
    chopper.crashoffset = chopper.heightoffset[2] - 250;
    chopper.var_4ea882f848e90349 = chopper function_8ae9611b3c0afe3(initialtarget);
    chopper setmaxpitchroll(15, 15);
    chopper vehicle_setspeed(spawn_properties.speed, spawn_properties.accel);
    chopper sethoverparams(50, 5, 2.5);
    chopper setturningability(0.5);
    chopper setyawspeed(100, 25, 25, 0.1);
    chopper setcandamage(1);
    chopper setneargoalnotifydist(768);
    chopper setvehicleteam(chopper.team);
    chopper.currenthealth = getdvarint(@"hash_bb80e65b55c98289", spawn_properties.health);
    chopper.health = spawn_properties.health;
    chopper.maxhealth = getdvarint(@"hash_bb80e65b55c98289", spawn_properties.health);
    chopper scripts\mp\sentientpoolmanager::registersentient("Level_Vehicle", chopper.team);
    chopper scripts\mp\gametypes\br_lootchopper::lootchopper_setupdamagefunctionality();
    chopper setscriptablepartstate("blinking_lights", "on", 0);
    chopper setscriptablepartstate("engine", "on", 0);
    chopper.turretproperties = spawnstruct();
    chopper.turretproperties.ammo = 16;
    chopper.turretproperties.cooldown = 3;
    chopper.turretproperties.var_62c8f81fff6aa072 = 0.1;
    chopper.turretproperties.accuracy = 40;
    chopper.turretproperties.range_squared = 4000000;
    chopper.frontturret = spawnturret("misc_turret", chopper gettagorigin("tag_turret_front"), "chopper_support_turret_mp");
    chopper.frontturret setmodel("veh9_mil_air_heli_ahotel64_turret");
    chopper.frontturret.team = chopper.team;
    chopper.frontturret.angles = chopper.angles;
    chopper.frontturret.turreton = 1;
    chopper.frontturret.name = "front_turret";
    chopper.frontturret.attackingtarget = var_9ca5b7427ae3d1f2;
    chopper.frontturret.vehicleparent = "loot_chopper";
    chopper.frontturret linkto(chopper);
    chopper.frontturret setturretteam(chopper.team);
    chopper.frontturret setturretmodechangewait(0);
    chopper.frontturret setmode("manual");
    chopper.frontturret setdefaultdroppitch(45);
    chopper.frontturret.owner = chopper;
    chopper.frontturret.groundtargetent = spawn("script_model", chopper.origin);
    chopper.frontturret.groundtargetent setmodel("tag_origin");
    chopper.frontturret.groundtargetent dontinterpolate();
    chopper.rearturret = spawnturret("misc_turret", chopper gettagorigin("tag_turret_rear"), "chopper_support_turret_mp");
    chopper.rearturret setmodel("veh9_mil_air_heli_ahotel64_turret");
    chopper.rearturret.team = chopper.team;
    chopper.rearturret.angles = chopper.angles;
    chopper.rearturret.turreton = 1;
    chopper.rearturret.name = "rear_turret";
    chopper.rearturret.attackingtarget = var_9ca5b7427ae3d1f2;
    chopper.rearturret.vehicleparent = "loot_chopper";
    chopper.rearturret linkto(chopper);
    chopper.rearturret setturretteam(chopper.team);
    chopper.rearturret setturretmodechangewait(0);
    chopper.rearturret setmode("manual");
    chopper.rearturret setdefaultdroppitch(45);
    chopper.rearturret.owner = chopper;
    chopper.rearturret.groundtargetent = spawn("script_model", chopper.origin);
    chopper.rearturret.groundtargetent setmodel("tag_origin");
    chopper.rearturret.groundtargetent dontinterpolate();
    chopper.frontturret thread function_506066d551cc9d40();
    chopper.frontturret thread function_3d32e37bdc6f2a62();
    chopper.rearturret thread function_506066d551cc9d40();
    chopper.rearturret thread function_3d32e37bdc6f2a62();
    chopper thread function_d1a7902563ac0855();
    chopper notify("change_movement_type", &function_411442f3099d02ef);
    chopper thread function_2bf53245395de26d();
    level.loot_choppers[level.loot_choppers.size] = chopper;
    chopper.patrolfunc = &function_d1a7902563ac0855;
    chopper.cleanupfunc = &function_f385485bf0b04ed1;
    chopper thread scripts\cp_mp\killstreaks\chopper_support::choppersupport_neargoalsettings();
    if (issharedfuncdefined("flares", "handleIncomingStinger")) {
        chopper thread [[ getsharedfunc("flares", "handleIncomingStinger") ]](&scripts\cp_mp\killstreaks\chopper_support::choppersupport_handlemissiledetection);
    }
    chopper thread scripts\cp_mp\killstreaks\chopper_support::choppersupport_movetolocation(chopper.pathgoal, 1);
    return chopper;
}

// Namespace namespace_1e78e6063f4018af / namespace_7921f301da16c1ba
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaf4
// Size: 0x49
function function_8ae9611b3c0afe3(player) {
    squadmates = scripts\mp\utility\teams::getsquadmates(player.team);
    if (!isdefined(squadmates)) {
        if (isplayer(player)) {
            return player;
        }
        assertmsg("<dev string:x1c>");
        return undefined;
    }
    return squadmates;
}

// Namespace namespace_1e78e6063f4018af / namespace_7921f301da16c1ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb46
// Size: 0x91
function function_42dadb2852b23ab() {
    new_target = undefined;
    if (!isdefined(self.var_4ea882f848e90349) || self.var_4ea882f848e90349.size <= 0) {
        return undefined;
    }
    foreach (target in self.var_4ea882f848e90349) {
        if (isdefined(target) && target != self.currenttarget) {
            new_target = target;
        }
    }
    return new_target;
}

// Namespace namespace_1e78e6063f4018af / namespace_7921f301da16c1ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe0
// Size: 0xa7
function function_fbf24cb95dbac64d() {
    potential_targets = self.var_4ea882f848e90349;
    foreach (target in self.var_4ea882f848e90349) {
        if (isdefined(target)) {
            if (distance2dsquared(self.origin, target.origin) > self.turretproperties.range_squared) {
                potential_targets = array_remove(potential_targets, target);
            }
        }
    }
    return random(potential_targets);
}

// Namespace namespace_1e78e6063f4018af / namespace_7921f301da16c1ba
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc90
// Size: 0x3b
function function_d1a7902563ac0855(initialpatrol) {
    level endon("game_ended");
    self endon("death");
    while (true) {
        self waittill("change_movement_type", movement_thread);
        self thread [[ movement_thread ]]();
    }
}

// Namespace namespace_1e78e6063f4018af / namespace_7921f301da16c1ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd3
// Size: 0x75
function function_411442f3099d02ef() {
    level endon("game_ended");
    self endon("death");
    self endon("change_movement_type");
    self endon("leaving");
    while (true) {
        wait 4;
        if (!isdefined(self.currenttarget)) {
            self notify("change_target", function_42dadb2852b23ab());
        }
        if (!isdefined(self.var_4ea882f848e90349) || self.var_4ea882f848e90349.size <= 0) {
            return;
        }
        scripts\cp_mp\killstreaks\chopper_support::choppersupport_movetolocation(self.currenttarget, 1);
    }
}

// Namespace namespace_1e78e6063f4018af / namespace_7921f301da16c1ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd50
// Size: 0x2a
function function_2daa88ea0f1f76cc() {
    level endon("game_ended");
    self endon("death");
    self endon("change_movement_type");
    while (true) {
        wait randomfloat(1);
    }
}

// Namespace namespace_1e78e6063f4018af / namespace_7921f301da16c1ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd82
// Size: 0x18c
function function_3d32e37bdc6f2a62() {
    level endon("game_ended");
    self.owner endon("death");
    self.owner endon("leaving");
    waitframe();
    self.oncooldown = 0;
    self.ammo = self.owner.turretproperties.ammo;
    if (!isdefined(self.owner.var_4ea882f848e90349) || self.owner.var_4ea882f848e90349.size <= 0) {
        return;
    }
    self.owner scripts\cp_mp\killstreaks\chopper_support::choppersupport_setcurrenttarget(self, self.owner.var_4ea882f848e90349[0]);
    while (true) {
        if (!isdefined(self.owner.currenttarget)) {
            self.attackingtarget = self.owner function_fbf24cb95dbac64d();
            if (!isdefined(self.attackingtarget)) {
                break;
            }
        }
        if (!self.oncooldown && distance2dsquared(self.owner.currenttarget.origin, self.origin) < self.owner.turretproperties.range_squared) {
            self.oncooldown = 1;
            thread function_c143e844e211d111(self.ammo, self.owner.turretproperties.var_62c8f81fff6aa072);
        }
        waitframe();
    }
}

// Namespace namespace_1e78e6063f4018af / namespace_7921f301da16c1ba
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf16
// Size: 0x209
function function_c143e844e211d111(var_2719d06acda987d7, var_50980dd85d7f48fa) {
    level endon("game_ended");
    self.owner endon("death");
    self.owner endon("leaving");
    shotsfired = 0;
    while (shotsfired < var_2719d06acda987d7) {
        self.attackingtarget = self.owner function_fbf24cb95dbac64d();
        if (!isdefined(self.attackingtarget)) {
            return;
        }
        self.groundtargetent.origin = self.attackingtarget.origin;
        x = self.groundtargetent.origin[0];
        y = self.groundtargetent.origin[1];
        z = self.groundtargetent.origin[2];
        var_4d47b039a2f83b87 = ter_op(randomint(10) > 5, -1, 1);
        var_4d47af39a2f83954 = ter_op(randomint(10) > 5, -1, 1);
        x_offset = randomfloat(1) * self.owner.turretproperties.accuracy * var_4d47b039a2f83b87 + x;
        y_offset = randomfloat(1) * self.owner.turretproperties.accuracy * var_4d47af39a2f83954 + y;
        self.groundtargetent.origin += (x_offset, y_offset, z);
        self shootturret("tag_flash");
        shotsfired += 1;
        wait var_50980dd85d7f48fa;
    }
    wait self.owner.turretproperties.cooldown;
    self.oncooldown = 0;
}

// Namespace namespace_1e78e6063f4018af / namespace_7921f301da16c1ba
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1127
// Size: 0xe1
function function_506066d551cc9d40(giventarget) {
    level endon("game_ended");
    self.owner endon("death");
    self.owner endon("leaving");
    self.attackingtarget = self.owner.var_4ea882f848e90349[0];
    self.owner setlookatent(self.attackingtarget);
    while (true) {
        if (!isdefined(self.owner.var_4ea882f848e90349) || self.owner.var_4ea882f848e90349.size <= 0) {
            return;
        }
        self.groundtargetent.origin = self.owner.currenttarget.origin + (0, 0, 32);
        waitframe();
    }
}

// Namespace namespace_1e78e6063f4018af / namespace_7921f301da16c1ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1210
// Size: 0x4b
function function_2bf53245395de26d() {
    level endon("game_ended");
    self endon("death");
    while (true) {
        self waittill("change_target", new_target);
        if (!isdefined(new_target)) {
            self notify("change_movement_behavior", &function_2daa88ea0f1f76cc);
            continue;
        }
        self.currenttarget = new_target;
    }
}

// Namespace namespace_1e78e6063f4018af / namespace_7921f301da16c1ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1263
// Size: 0x9
function function_f385485bf0b04ed1() {
    scripts\mp\gametypes\br_lootchopper::lootchopper_cleanup();
}

