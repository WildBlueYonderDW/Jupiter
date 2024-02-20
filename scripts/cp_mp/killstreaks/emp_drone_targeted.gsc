// mwiii decomp prototype
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;

#namespace emp_drone_targeted;

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f8
// Size: 0x4c
function init() {
    if (issharedfuncdefined("emp_drone_targeted", "init")) {
        [[ getsharedfunc("emp_drone_targeted", "init") ]]();
    }
    /#
        setdevdvarifuninitialized(@"hash_9a501fd816a448b6", 0);
        setdevdvarifuninitialized(@"hash_8bfee5c0dec14aca", 0);
    #/
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64b
// Size: 0x22
function empdrone_beginsuper() {
    self endon("death_or_disconnect");
    self endon("reconDroneEnded");
    self endon("reconDroneUnset");
    thread empdrone_superusethink();
    return 1;
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x675
// Size: 0xc7
function empdrone_superusethink() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    streakinfo = createstreakinfo("emp_drone", self);
    result = empdrone_tryuse(streakinfo);
    wait(0.05);
    if (result) {
        if (issharedfuncdefined("supers", "superUseFinished")) {
            [[ getsharedfunc("supers", "superUseFinished") ]]();
        }
        if (issharedfuncdefined("sound", "trySayLocalSound")) {
            level thread [[ getsharedfunc("sound", "trySayLocalSound") ]](self, #"hash_d661aea88fc83c08");
        }
    } else if (issharedfuncdefined("supers", "superUseFinished")) {
        [[ getsharedfunc("supers", "superUseFinished") ]](1);
    }
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x743
// Size: 0xc
function empdrone_tryuse(streakinfo) {
    
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x756
// Size: 0x9e
function empdrone_equipment_wrapper(ref, slot, objweapon) {
    if (issharedfuncdefined("equipment", "takeEquipment")) {
        self [[ getsharedfunc("equipment", "takeEquipment") ]](slot);
    }
    streakinfo = createstreakinfo("emp_drone", self);
    used = empdrone_tryuse(streakinfo);
    if (!used) {
        if (issharedfuncdefined("equipment", "giveEquipment")) {
            self [[ getsharedfunc("equipment", "giveEquipment") ]]("equip_empdrone", slot);
        }
    }
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7fb
// Size: 0x3f
function empdrone_weapongiven(streakinfo) {
    if (issharedfuncdefined("empDroneTargeted", "startMapSelectSequence")) {
        self [[ getsharedfunc("empDroneTargeted", "startMapSelectSequence") ]](0, 0, undefined, 3);
    } else {
        return 0;
    }
    return 1;
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x842
// Size: 0x269
function empdrone_createdrone(streakinfo, targetpos) {
    self endon("disconnect");
    level endon("game_ended");
    var_460f06fb83940b20 = empdrone_calculatepositions(targetpos);
    drone = namespace_d325722f2754c2c4::_magicbullet(makeweapon("emp_drone_proj_mp"), var_460f06fb83940b20.startpos, var_460f06fb83940b20.targetpos, self);
    /#
        if (getdvarint(@"hash_8bfee5c0dec14aca", 0) != 0) {
            sphere(drone.origin, 25, (0, 1, 0), 0, 2000);
        }
    #/
    drone setentityowner(self);
    drone.owner = self;
    drone.ownerid = self getentitynumber();
    drone.team = self.team;
    drone.streakinfo = streakinfo;
    drone.usedcount = 0;
    drone.superid = level.superglobals.staticsuperdata["super_emp_drone"].id;
    drone hidepart("j_propeller");
    playfxontag(getfx("vfx/iw8/level/safehouse/vfx_safehouse_finale_drone_wingtip_red_lit.vfx"), drone, "tag_origin");
    playfxontag(getfx("vfx/iw8/level/safehouse/vfx_safehouse_finale_drone_contrails.vfx"), drone, "tag_origin");
    playfxontag(getfx("vfx/iw8/level/safehouse/vfx_safehouse_finale_drone_heat_dist.vfx"), drone, "tag_origin");
    playfxontag(getfx("vfx/iw8_mp/killstreak/vfx_rc_plane_rotor.vfx"), drone, "j_propeller");
    if (issharedfuncdefined("empDroneTargeted", "monitorDamage")) {
        drone thread [[ getsharedfunc("empDroneTargeted", "monitorDamage") ]](25, "hitequip", &empdrone_handledeathdamage, undefined, 0);
    }
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        drone [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](streakinfo.streakname, "Killstreak_Air", self, 0, 1, 25);
    }
    drone playloopsound("iw8_rc_plane_engine");
    drone thread empdrone_timeoutthink();
    drone thread empdrone_gameendedthink();
    drone thread empdrone_collidethink();
    if (getdvarint(@"hash_9a501fd816a448b6", 0) == 0) {
        drone thread empdrone_divebombthink(var_460f06fb83940b20);
    } else {
        drone thread empdrone_killstreaktargetthink(var_460f06fb83940b20);
    }
    drone namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&empdrone_empapplied);
    self function_fd165588822885f4(drone);
    return drone;
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab3
// Size: 0x224
function empdrone_calculatepositions(targetpos) {
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    heightoffset = (0, 0, 1500);
    if (isdefined(var_5fa1e1697a302583)) {
        var_d274915779774224 = var_5fa1e1697a302583.origin[2] + -1500;
        heightoffset = (0, 0, var_d274915779774224);
    }
    forwardvector = anglestoforward(self.angles);
    startpos = undefined;
    var_5b36d1353e9a2b32 = 0;
    angledelta = 0;
    var_e26ff636f4ed6943 = 0;
    while (1) {
        var_b298af09b1a0ddd = rotatevector(forwardvector, (0, angledelta, 0));
        var_8a88744ab78f625f = heightoffset + targetpos;
        startpos = var_8a88744ab78f625f - var_b298af09b1a0ddd * 4500;
        var_dcb2a748d623de32 = 1500 * (0, 0, 1);
        startpos = startpos + var_dcb2a748d623de32;
        var_1bfa180c6fdd09dd = physics_createcontents([0:"physicscontents_glass", 1:"physicscontents_vehicleclip", 2:"physicscontents_missileclip", 3:"physicscontents_clipshot"]);
        var_5b36d1353e9a2b32 = ray_trace_passed(startpos, var_8a88744ab78f625f, undefined, var_1bfa180c6fdd09dd);
        var_e26ff636f4ed6943++;
        if (var_5b36d1353e9a2b32) {
            /#
                if (getdvarint(@"hash_8bfee5c0dec14aca", 0) != 0) {
                    line(startpos, var_8a88744ab78f625f, (0, 1, 0), 1, 0, 2000);
                }
            #/
            break;
        }
        /#
            if (getdvarint(@"hash_8bfee5c0dec14aca", 0) != 0) {
                line(startpos, var_8a88744ab78f625f, (1, 0, 0), 1, 0, 2000);
            }
        #/
        if (var_e26ff636f4ed6943 >= 13) {
            break;
        }
        wait(0.05);
        angledelta = angledelta + 55.3;
    }
    divebombpos = vectornormalize(startpos - var_8a88744ab78f625f) * 1000 + var_8a88744ab78f625f;
    struct = spawnstruct();
    struct.startpos = startpos;
    struct.divebombpos = divebombpos;
    struct.targetpos = targetpos;
    return struct;
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdf
// Size: 0x55
function empdrone_timeoutthink() {
    level endon("game_ended");
    self.owner endon("disconnect");
    self endon("death");
    currenttime = gettime() * 0.001;
    timeouttime = currenttime + 20;
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(timeouttime);
    thread empdrone_destroy();
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3b
// Size: 0x33
function empdrone_gameendedthink() {
    self.owner endon("disconnect");
    self endon("death");
    level waittill_any_2("game_ended", "prematch_cleanup");
    thread empdrone_destroy();
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd75
// Size: 0x69
function empdrone_collidethink() {
    level endon("game_ended");
    self.owner endon("disconnect");
    self endon("death");
    self waittill("missile_stuck");
    /#
        if (getdvarint(@"hash_8bfee5c0dec14aca", 0) != 0) {
            sphere(self.origin, 25, (1, 0, 0), 0, 2000);
        }
    #/
    thread empdrone_explode();
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde5
// Size: 0x140
function empdrone_divebombthink(var_460f06fb83940b20) {
    level endon("game_ended");
    self.owner endon("disconnect");
    self endon("death");
    self missile_settargetpos(var_460f06fb83940b20.divebombpos);
    closeenough = 50;
    while (distancesquared(var_460f06fb83940b20.divebombpos, self.origin) > closeenough * closeenough) {
        wait(0.05);
    }
    forwardvector = anglestoforward(self.angles);
    dist = distance(var_460f06fb83940b20.targetpos, self.origin);
    var_e62541575739decf = self.origin + forwardvector * dist;
    starttime = gettime();
    var_6c469f968a8bfe3e = 0;
    var_736ad6f118478397 = 0;
    while (1) {
        wait(0.05);
        var_6c469f968a8bfe3e = (gettime() - starttime) / 1300;
        var_6c469f968a8bfe3e = clamp(var_6c469f968a8bfe3e, 0, 1);
        relativepoint = var_e62541575739decf * (1 - var_6c469f968a8bfe3e) + var_460f06fb83940b20.targetpos * var_6c469f968a8bfe3e;
        self missile_settargetpos(relativepoint);
    }
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2c
// Size: 0xc
function empdrone_killstreaktargetthink(var_460f06fb83940b20) {
    
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3f
// Size: 0x2b
function empdrone_handledeathdamage(attacker, weapon, damagetype) {
    empdrone_givepointsfordeath(attacker);
    empdrone_destroy();
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf71
// Size: 0x51
function empdrone_explode() {
    self playsound("iw8_rc_plane_engine_exp");
    forward = anglestoforward(self.angles);
    playfx(getfx("vfx/iw8_mp/perk/vfx_emp_drone_exp_fieldupgrades.vfx"), self.origin, forward);
    empdrone_explodeemp();
    empdrone_delete();
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc9
// Size: 0x4a
function empdrone_destroy() {
    self playsound("recondrone_damaged");
    forward = anglestoforward(self.angles);
    playfx(getfx("vfx/iw8_mp/perk/vfx_emp_drone_airexp.vfx"), self.origin, forward);
    empdrone_delete();
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101a
// Size: 0x97
function empdrone_delete() {
    self stoploopsound("iw8_rc_plane_engine");
    if (issharedfuncdefined("challenges", "onFieldUpgradeEnd")) {
        self.owner [[ getsharedfunc("challenges", "onFieldUpgradeEnd") ]]("super_emp_drone", self.usedcount);
    }
    if (issharedfuncdefined("dlog", "fieldUpgradeExpired")) {
        self thread [[ getsharedfunc("dlog", "fieldUpgradeExpired") ]](self.owner, self.superid, self.usedcount, 0);
    }
    self delete();
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b8
// Size: 0x31
function empdrone_empapplied(data) {
    attacker = data.attacker;
    empdrone_givepointsfordeath(attacker);
    empdrone_destroy();
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f0
// Size: 0x55
function empdrone_givepointsfordeath(attacker) {
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        if (issharedfuncdefined("player", "doScoreEvent")) {
            attacker thread [[ getsharedfunc("player", "doScoreEvent") ]]("destroyed_equipment");
        }
    }
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114c
// Size: 0x466
function empdrone_explodeemp() {
    var_adb14ff6edfb13e3 = makeweapon("emp_drone_non_player_mp");
    var_6a96cebaf12d3691 = makeweapon("emp_drone_non_player_direct_mp");
    var_9644d3f7dc618eab = [];
    ents = function_107fdcaa299cfa40(self.origin, 800);
    foreach (ent in ents) {
        if (ent == self) {
            continue;
        }
        entowner = ent.owner;
        if (isdefined(entowner)) {
            jumpiffalse(entowner != self.owner && !namespace_f8065cafc523dba5::playersareenemies(self.owner, entowner)) LOC_0000016e;
        } else {
        LOC_0000016e:
            isvehicle = ent namespace_1f188a13f7e79610::isvehicle();
            var_609019899015ed5d = namespace_1fbd40990ee60ede::vehicle_occupancy_instanceisregistered(ent);
            if (isvehicle && var_609019899015ed5d) {
                occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(ent);
                foreach (occupant in occupants) {
                    var_9644d3f7dc618eab[var_9644d3f7dc618eab.size] = occupant;
                }
            }
            distsqr = distancesquared(self.origin, ent.origin);
            weapon = ter_op(distsqr > 6400, var_adb14ff6edfb13e3, var_6a96cebaf12d3691);
            ent dodamage(1, self.origin, self.owner, self, "MOD_EXPLOSIVE", weapon);
            data = packdamagedata(self.owner, ent, 1, weapon, "MOD_EXPLOSIVE", self, self.origin);
            thread empdrone_applyemp(data);
        }
    }
    playerweapon = makeweapon("emp_drone_player_mp");
    self radiusdamage(self.origin, 80, 120, 80, self.owner, "MOD_EXPLOSIVE", playerweapon);
    players = utility::playersinsphere(self.origin, 800);
    players = array_combine_unique(players, var_9644d3f7dc618eab);
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!player can_be_empd()) {
            continue;
        }
        if (player != self.owner && !namespace_f8065cafc523dba5::playersareenemies(self.owner, player)) {
            continue;
        }
        player dodamage(1, self.origin, self.owner, self, "MOD_EXPLOSIVE", playerweapon);
        data = packdamagedata(self.owner, player, 1, playerweapon, "MOD_EXPLOSIVE", self, self.origin);
        thread empdrone_applyemp(data);
    }
    var_7ef2f0c3237ead8c = playersinsphere(self.origin, 2000);
    var_7ef2f0c3237ead8c = array_combine_unique(var_7ef2f0c3237ead8c, var_9644d3f7dc618eab);
    foreach (player in var_7ef2f0c3237ead8c) {
        if (!isdefined(player)) {
            continue;
        }
        if (player == self.owner) {
            continue;
        }
        player earthquakeforplayer(0.3, 1, self.origin, 2000);
        player setclientomnvar("ui_hud_shake", 1);
        player playrumbleonpositionforclient("artillery_rumble_light", self.origin);
    }
    self.owner earthquakeforplayer(0.2, 1, self.owner.origin, 2000);
    self.owner setclientomnvar("ui_hud_shake", 1);
    self.owner playrumbleonpositionforclient("artillery_rumble_light", self.origin);
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b9
// Size: 0x220
function empdrone_applyemp(data) {
    apply_emp_struct(data);
    duration = 8;
    if (isplayer(data.victim)) {
        if (issharedfuncdefined("perk", "hasPerk")) {
            if (data.victim != self.owner && data.victim [[ getsharedfunc("perk", "hasPerk") ]]("specialty_emp_resist")) {
                duration = 2;
                if (issharedfuncdefined("damage", "updateDamageFeedback")) {
                    self.owner [[ getsharedfunc("damage", "updateDamageFeedback") ]]("hittacresist");
                }
            }
        }
        if (issharedfuncdefined("gamescore", "trackDebuffAssist")) {
            [[ getsharedfunc("gamescore", "trackDebuffAssist") ]](data.attacker, data.victim, data.objweapon.basename);
        }
    }
    if (issharedfuncdefined("pers", "incPersStat")) {
        self.owner [[ getsharedfunc("pers", "incPersStat") ]]("empDroneHits", 1);
    }
    if (issharedfuncdefined("supers", "combatRecordSuperMisc")) {
        self.owner [[ getsharedfunc("supers", "combatRecordSuperMisc") ]]("super_emp_drone");
    }
    self.usedcount++;
    empdrone_empendearly(data, duration);
    if (isdefined(data.victim)) {
        data.victim remove_emp();
        if (isdefined(data.attacker) && isplayer(data.victim)) {
            if (issharedfuncdefined("gamescore", "untrackDebuffAssist")) {
                [[ getsharedfunc("gamescore", "untrackDebuffAssist") ]](data.attacker, data.victim, data.objweapon.basename);
            }
        }
    }
}

// Namespace emp_drone_targeted/namespace_3ebc55488bf8fe66
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e0
// Size: 0x5b
function empdrone_empendearly(data, duration) {
    data.victim endon("death_or_disconnect");
    level endon("game_ended");
    result = waittill_notify_or_timeout_return("emp_cleared", duration);
    if (result != "emp_cleared") {
        data.empremoved = 1;
    }
}

