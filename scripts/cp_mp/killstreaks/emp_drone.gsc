// mwiii decomp prototype
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_16ea1b94f0f381b3;
#using script_4c770a9a4ad7659c;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace emp_drone;

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x588
// Size: 0x29
function init() {
    if (issharedfuncdefined("emp_drone", "init")) {
        [[ getsharedfunc("emp_drone", "init") ]]();
    }
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b8
// Size: 0x2d
function empdrone_beginsuper() {
    self endon("death_or_disconnect");
    self endon("reconDroneEnded");
    self endon("reconDroneUnset");
    if (!namespace_f64231d5b7a2c3c4::reservevehicle()) {
        return 0;
    }
    thread empdrone_superusethink();
    return 1;
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ed
// Size: 0xc4
function empdrone_superusethink() {
    streakinfo = createstreakinfo("emp_drone", self);
    result = empdrone_tryuse(streakinfo);
    if (!result) {
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
    }
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

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b8
// Size: 0x73
function empdrone_tryuse(streakinfo) {
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweapontabletdeploy(streakinfo, &empdrone_weapongiven);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    thread empdrone_rundrone(streakinfo);
    return 1;
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x733
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

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d8
// Size: 0xe
function empdrone_weapongiven(streakinfo) {
    return 1;
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ee
// Size: 0x11a
function empdrone_rundrone(streakinfo) {
    self endon("disconnect");
    level endon("game_ended");
    self disablephysicaldepthoffieldscripting();
    val::set("empDrone", "fire", 0);
    val::set("empDrone", "melee", 0);
    val::set("empDrone", "weapon_switch", 0);
    val::set("empDrone", "usability", 0);
    val::set("empDrone", "gesture", 0);
    drone = empdrone_createdrone(streakinfo);
    drone.iscontrolled = 1;
    drone.usedcount = 0;
    drone.superid = level.superglobals.staticsuperdata["super_emp_drone"].id;
    self controlslinkto(drone);
    self cameralinkto(drone, "tag_origin");
    self setplayerangles(drone.angles);
    self painvisionoff();
    killstreak_savenvgstate();
    self setclientomnvar("ui_emp_drone_overlay", 1);
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90f
// Size: 0x2bf
function empdrone_createdrone(streakinfo) {
    var_45306a38c5430b1a = empdrone_findstartposition();
    forwardangles = vectortoangles(var_45306a38c5430b1a.targetpos - var_45306a38c5430b1a.startpos);
    namespace_f64231d5b7a2c3c4::clearvehiclereservation();
    spawndata = spawnstruct();
    spawndata.origin = var_45306a38c5430b1a.startpos;
    spawndata.angles = forwardangles;
    spawndata.modelname = "veh8_ind_air_bombing_drone";
    spawndata.vehicletype = "rcplane_physics_mp";
    spawndata.targetname = "rcplane";
    spawndata.cannotbesuspended = 1;
    var_ee8da5624236dc89 = spawnstruct();
    drone = namespace_f64231d5b7a2c3c4::_spawnvehicle(spawndata, var_ee8da5624236dc89);
    if (!isdefined(drone)) {
        /#
            thread namespace_3c37cb17ade254d::error("killstreak");
        #/
        return;
    }
    drone setotherent(self);
    drone setentityowner(self);
    drone.owner = self;
    drone.ownerid = self getentitynumber();
    drone.team = self.team;
    drone.streakinfo = streakinfo;
    drone setcandamage(1);
    if (issharedfuncdefined("killstreak", "killstreakMakeVehicle")) {
        drone [[ getsharedfunc("killstreak", "killstreakMakeVehicle") ]](streakinfo.streakname);
    }
    if (issharedfuncdefined("killstreak", "killstreakSetPreModDamageCallback")) {
        drone [[ getsharedfunc("killstreak", "killstreakSetPreModDamageCallback") ]](streakinfo.streakname);
    }
    if (issharedfuncdefined("killstreak", "killstreakSetPostModDamageCallback")) {
        drone [[ getsharedfunc("killstreak", "killstreakSetPostModDamageCallback") ]](streakinfo.streakname);
    }
    if (issharedfuncdefined("killstreak", "killstreakSetDeathCallback")) {
        drone [[ getsharedfunc("killstreak", "killstreakSetDeathCallback") ]](streakinfo.streakname, &empdrone_handledeathdamage);
    }
    namespace_f64231d5b7a2c3c4::vehicle_tracking_registerinstance(drone, drone.vehiclename);
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        drone [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](streakinfo.streakname, "Killstreak_Air", self, 0, 1, 25);
    }
    self notifyonplayercommand("emp_drone_detonate", "+attack");
    drone playloopsound("iw8_rc_plane_engine");
    drone thread empdrone_timeoutthink();
    drone thread empdrone_collidethink();
    drone thread empdrone_watchearlyexit();
    drone thread empdrone_watchdetonate();
    drone namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&empdrone_empapplied);
    return drone;
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd6
// Size: 0xcd
function empdrone_findstartposition() {
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    heightoffset = (0, 0, 600);
    if (isdefined(var_5fa1e1697a302583)) {
        var_d274915779774224 = var_5fa1e1697a302583.origin[2] + -100;
        heightoffset = (0, 0, var_d274915779774224);
    }
    forwardvector = anglestoforward(self.angles);
    var_8a88744ab78f625f = heightoffset + self.origin;
    startpos = var_8a88744ab78f625f - forwardvector * 4000;
    targetpos = var_8a88744ab78f625f;
    struct = spawnstruct();
    struct.startpos = startpos;
    struct.targetpos = targetpos;
    return struct;
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcab
// Size: 0x77
function empdrone_timeoutthink() {
    level endon("game_ended");
    self.owner endon("disconnect");
    self endon("death");
    timeout = 20;
    while (timeout > 0) {
        self.owner setclientomnvar("ui_killstreak_countdown", gettime() + int(timeout * 1000));
        timeout = timeout - 0.05;
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.05);
    }
    thread empdrone_destroy();
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd29
// Size: 0x91
function empdrone_collidethink() {
    level endon("game_ended");
    self.owner endon("disconnect");
    self endon("death");
    self vehphys_enablecollisioncallback(1);
    ent = impulse = normal = position = flag1 = flag0 = body1 = body0 = self waittill("collision");
    thread empdrone_explode();
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc1
// Size: 0x3f
function empdrone_watchdetonate() {
    level endon("game_ended");
    self.owner endon("disconnect");
    self endon("death");
    self endon("emp_drone_exited");
    self.owner waittill("emp_drone_detonate");
    thread empdrone_explode();
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe07
// Size: 0x74
function empdrone_watchearlyexit() {
    level endon("game_ended");
    self.owner endon("disconnect");
    self endon("death");
    self endon("emp_drone_exited");
    if (issharedfuncdefined("killstreak", "allowRideKillstreakPlayerExit")) {
        self thread [[ getsharedfunc("killstreak", "allowRideKillstreakPlayerExit") ]]("death");
    }
    self waittill("killstreakExit");
    self setotherent(undefined);
    self setentityowner(undefined);
    thread empdrone_exit();
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe82
// Size: 0x31
function empdrone_handledeathdamage(data) {
    attacker = data.attacker;
    empdrone_givepointsfordeath(attacker);
    empdrone_destroy();
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeba
// Size: 0x55
function empdrone_explode() {
    self playsound("iw8_rc_plane_engine_exp");
    forward = anglestoforward(self.angles);
    playfx(level._effects["vfx/iw8_mp/perk/vfx_emp_drone_exp_fieldupgrades.vfx"], self.origin, forward);
    empdrone_explodeemp();
    empdrone_delete();
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf16
// Size: 0x4e
function empdrone_destroy() {
    self playsound("recondrone_damaged");
    forward = anglestoforward(self.angles);
    playfx(level._effects["vfx/iw8_mp/perk/vfx_emp_drone_airexp.vfx"], self.origin, forward);
    empdrone_delete();
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6b
// Size: 0x14
function empdrone_exit() {
    self.owner empdrone_returnplayer(self);
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf86
// Size: 0x74
function empdrone_delete() {
    self.owner empdrone_returnplayer(self);
    if (issharedfuncdefined("dlog", "fieldUpgradeExpired")) {
        self thread [[ getsharedfunc("dlog", "fieldUpgradeExpired") ]](self.owner, self.superid, self.usedcount, 0);
    }
    self stoploopsound("iw8_rc_plane_engine");
    namespace_f64231d5b7a2c3c4::vehicle_tracking_deregisterinstance(self);
    namespace_f64231d5b7a2c3c4::_deletevehicle(self);
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1001
// Size: 0xb0
function empdrone_returnplayer(drone) {
    if (!istrue(drone.iscontrolled)) {
        return;
    }
    level callback::callback("killstreak_finish_use", {streakinfo:drone.streakinfo});
    self painvisionon();
    killstreak_restorenvgstate();
    self controlsunlink();
    self cameraunlink(drone);
    empdrone_clearomnvars();
    val::function_c9d0b43701bdba00("empDrone");
    drone stoploopsound("iw8_rc_plane_engine");
    self notifyonplayercommandremove("emp_drone_detonate", "+frag");
    drone.iscontrolled = undefined;
    drone.streakinfo notify("killstreak_finished_with_deploy_weapon");
    drone notify("emp_drone_exited");
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b8
// Size: 0x10
function empdrone_clearomnvars() {
    self setclientomnvar("ui_emp_drone_overlay", 0);
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10cf
// Size: 0x31
function empdrone_empapplied(data) {
    attacker = data.attacker;
    empdrone_givepointsfordeath(attacker);
    empdrone_destroy();
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1107
// Size: 0x55
function empdrone_givepointsfordeath(attacker) {
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        if (issharedfuncdefined("player", "doScoreEvent")) {
            attacker thread [[ getsharedfunc("player", "doScoreEvent") ]]("destroyed_equipment");
        }
    }
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1163
// Size: 0x2d4
function empdrone_explodeemp() {
    var_adb14ff6edfb13e3 = makeweapon("emp_drone_non_player_mp");
    var_6a96cebaf12d3691 = makeweapon("emp_drone_non_player_direct_mp");
    ents = function_107fdcaa299cfa40(self.origin, 768);
    foreach (ent in ents) {
        if (ent == self) {
            continue;
        }
        entowner = ent.owner;
        if (isdefined(entowner)) {
            jumpiffalse(entowner != self.owner && !namespace_f8065cafc523dba5::playersareenemies(self.owner, entowner)) LOC_00000111;
        } else {
        LOC_00000111:
            distsqr = distancesquared(self.origin, ent.origin);
            weapon = ter_op(distsqr > 4096, var_adb14ff6edfb13e3, var_6a96cebaf12d3691);
            ent dodamage(1, self.origin, self.owner, self, "MOD_EXPLOSIVE", weapon);
            data = packdamagedata(self.owner, ent, 1, weapon, "MOD_EXPLOSIVE", self, self.origin);
            thread empdrone_applyemp(data);
            if (issharedfuncdefined("pers", "incPersStat")) {
                self.owner [[ getsharedfunc("pers", "incPersStat") ]]("empDroneHits", 1);
            }
            self.usedcount++;
        }
    }
    playerweapon = makeweapon("emp_drone_player_mp");
    radiusdamage(self.origin, 64, 60, 1, self.owner, "MOD_EXPLOSIVE", playerweapon);
    players = function_883458a342af3041(self.origin, 768);
    foreach (player in players) {
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
}

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x143e
// Size: 0x1ac
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

// Namespace emp_drone/namespace_5b16930b9511d4ed
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f1
// Size: 0x5b
function empdrone_empendearly(data, duration) {
    data.victim endon("death_or_disconnect");
    level endon("game_ended");
    result = waittill_notify_or_timeout_return("emp_cleared", duration);
    if (result != "emp_cleared") {
        data.empremoved = 1;
    }
}

