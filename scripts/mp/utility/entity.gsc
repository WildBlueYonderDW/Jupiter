// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace entity;

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a
// Size: 0xd1
function getaverageorigin(ent_array) {
    avg_origin = (0, 0, 0);
    if (!ent_array.size) {
        return undefined;
    }
    foreach (ent in ent_array) {
        avg_origin = avg_origin + ent.origin;
    }
    avg_x = int(avg_origin[0] / ent_array.size);
    avg_y = int(avg_origin[1] / ent_array.size);
    avg_z = int(avg_origin[2] / ent_array.size);
    avg_origin = (avg_x, avg_y, avg_z);
    return avg_origin;
}

// Namespace entity / scripts/mp/utility/entity
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x443
// Size: 0xd4
function touchingbadtrigger() {
    killtriggers = getentarray("trigger_hurt", "classname");
    foreach (trigger in killtriggers) {
        if (self istouching(trigger)) {
            return true;
        }
    }
    radtriggers = getentarray("radiation", "targetname");
    foreach (trigger in radtriggers) {
        if (self istouching(trigger)) {
            return true;
        }
    }
    return false;
}

// Namespace entity / scripts/mp/utility/entity
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51f
// Size: 0x7c
function touchingoobtrigger() {
    if (istrue(self.allowedintrigger)) {
        return false;
    }
    if (!isdefined(level.outofboundstriggers)) {
        return false;
    }
    foreach (trigger in level.outofboundstriggers) {
        if (self istouching(trigger)) {
            return true;
        }
    }
    return false;
}

// Namespace entity / scripts/mp/utility/entity
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a3
// Size: 0x83
function touchingballallowedtrigger() {
    if (!istrue(level.ballallowedtriggers.size)) {
        return false;
    }
    self.allowedintrigger = 0;
    foreach (trigger in level.ballallowedtriggers) {
        if (self istouching(trigger)) {
            self.allowedintrigger = 1;
            return true;
        }
    }
    return false;
}

// Namespace entity / scripts/mp/utility/entity
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x62e
// Size: 0x83
function touchingplayerallowedtrigger() {
    if (!istrue(level.playerallowedtriggers.size)) {
        return false;
    }
    self.allowedintrigger = 0;
    foreach (trigger in level.playerallowedtriggers) {
        if (self istouching(trigger)) {
            self.allowedintrigger = 1;
            return true;
        }
    }
    return false;
}

// Namespace entity / scripts/mp/utility/entity
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6b9
// Size: 0xbc
function findisfacing(ent1, ent2, tolerance) {
    facingcosine = cos(tolerance);
    ent1forwardvector = anglestoforward(ent1.angles);
    var_39166b57b87f75d = ent2.origin - ent1.origin;
    ent1forwardvector = ent1forwardvector * (1, 1, 0);
    var_39166b57b87f75d = var_39166b57b87f75d * (1, 1, 0);
    var_39166b57b87f75d = vectornormalize(var_39166b57b87f75d);
    ent1forwardvector = vectornormalize(ent1forwardvector);
    targetcosine = vectordot(var_39166b57b87f75d, ent1forwardvector);
    if (targetcosine >= facingcosine) {
        return 1;
    }
    return 0;
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77c
// Size: 0x37
function isaiteamparticipant(ent) {
    if (isagent(ent) && ent.agent_teamparticipant == 1) {
        return true;
    }
    if (isbot(ent)) {
        return true;
    }
    return false;
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bb
// Size: 0x26
function isteamparticipant(ent) {
    if (isaiteamparticipant(ent)) {
        return true;
    }
    if (isplayer(ent)) {
        return true;
    }
    return false;
}

// Namespace entity / scripts/mp/utility/entity
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e9
// Size: 0x39
function isvalidteamtarget(attacker, victimteam, target) {
    return isdefined(target.team) && target.team == victimteam;
}

// Namespace entity / scripts/mp/utility/entity
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82a
// Size: 0x1e
function isvalidffatarget(attacker, victimteam, target) {
    return true;
}

// Namespace entity / scripts/mp/utility/entity
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x850
// Size: 0x77
function getlinknamenodes() {
    array = [];
    if (isdefined(self.script_linkto)) {
        linknames = strtok(self.script_linkto, " ");
        for (i = 0; i < linknames.size; i++) {
            ent = getnode(linknames[i], "script_linkname");
            if (isdefined(ent)) {
                array[array.size] = ent;
            }
        }
    }
    return array;
}

// Namespace entity / scripts/mp/utility/entity
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cf
// Size: 0x34
function function_d9ce8fb00f0e5fa1(origin, radius, desiredteam, excludeent) {
    return getentitiesinradius(origin, radius, desiredteam, excludeent, scripts/engine/trace::create_character_contents());
}

// Namespace entity / scripts/mp/utility/entity
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90b
// Size: 0x217
function getentitiesinradius(origin, radius, desiredteam, excludeent, physicscontents) {
    if (radius <= 0) {
        return [];
    }
    excludearray = undefined;
    if (isdefined(excludeent)) {
        if (isarray(excludeent)) {
            excludearray = excludeent;
        } else {
            excludearray = [excludeent];
        }
    }
    results = physics_querypoint(origin, radius, physicscontents, excludearray, "physicsquery_all");
    filteredresults = [];
    if (!isdefined(desiredteam)) {
        foreach (result in results) {
            e = result["entity"];
            if (isdefined(e)) {
                filteredresults[filteredresults.size] = e;
            }
        }
    } else {
        foreach (result in results) {
            e = result["entity"];
            if (isdefined(e) && isdefined(e.team) && e.team == desiredteam) {
                filteredresults[filteredresults.size] = e;
            }
        }
    }
    /#
        if (getdvarint(@"hash_9bb67ce9f0ab24e0", 0) > 0) {
            debugduration = 60;
            sphere(origin, radius, (1, 1, 1), 0, debugduration);
            foreach (entity in filteredresults) {
                sphere(entity.origin, 10, (1, 0, 0), 1, debugduration);
            }
        }
    #/
    return filteredresults;
}

// Namespace entity / scripts/mp/utility/entity
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xb2a
// Size: 0x187
function watchentitiesinradius(radiusrange, triggernotify, var_ecea6cda97e5f7ae, checkvisibility, playersonly) {
    self endon("disconnect");
    self endon("end_entities_in_radius");
    level endon("game_ended");
    while (true) {
        if (!isdefined(self)) {
            return;
        }
        entitiesfound = undefined;
        if (playersonly) {
            entitiesfound = getplayersinradius(self.origin, radiusrange);
        } else {
            entitiesfound = getentitiesinradius(self.origin, radiusrange);
        }
        if (entitiesfound.size > 0) {
            if (!checkvisibility) {
                self notify(triggernotify, entitiesfound);
            } else {
                entities = [];
                foreach (entityfound in entitiesfound) {
                    sourceposition = self getorigin();
                    targetposition = ter_op(playersonly, entityfound geteye(), entityfound.origin);
                    var_68e6f05a4ee24dee = physics_createcontents(["physicscontents_vehicleclip", "physicscontents_item", "physicscontents_ainoshoot"]);
                    var_97db5d48f2509e02 = physics_raycast(sourceposition, targetposition, var_68e6f05a4ee24dee, undefined, 0, "physicsquery_closest");
                    if (var_97db5d48f2509e02.size <= 0) {
                        entities[entities.size] = entityfound;
                    }
                }
                self notify(triggernotify, entities);
            }
        }
        wait(var_ecea6cda97e5f7ae);
    }
}

// Namespace entity / scripts/mp/utility/entity
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb8
// Size: 0xb
function cancelentitiesinradius() {
    self notify("end_entities_in_radius");
}

// Namespace entity / scripts/mp/utility/entity
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xcca
// Size: 0x10f
function placeequipmentfailed(weapon, showfx, position, angles) {
    /#
        assert(isdefined(showfx) && isdefined(position) || !isdefined(showfx) && !isdefined(position));
    #/
    self playlocalsound("scavenger_pack_pickup");
    if (istrue(showfx)) {
        fxent = undefined;
        if (isdefined(angles)) {
            fxent = spawnfxforclient(getfx("placeEquipmentFailed"), position, self, anglestoforward(angles), anglestoup(angles));
        } else {
            fxent = spawnfxforclient(getfx("placeEquipmentFailed"), position, self);
        }
        triggerfx(fxent);
        thread placeequipmentfailedcleanup(fxent);
    }
    switch (weapon) {
    case #"hash_36d0be2b0f1c99e":
    case #"hash_523f0c8fe1ead306":
    case #"hash_5e3fa526a48eaaa5":
    case #"hash_d059dcc3a7f1308a":
    case #"hash_eec4a41906598dfc":
        if (isplayer(self) && scripts/cp_mp/utility/player_utility::_isalive()) {
            self iprintlnbold("Placement Failed");
        }
        break;
    }
}

// Namespace entity / scripts/mp/utility/entity
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde0
// Size: 0x1d
function placeequipmentfailedinit() {
    level._effect["placeEquipmentFailed"] = loadfx("vfx/iw7/_requests/mp/vfx_generic_equipment_exp.vfx");
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe04
// Size: 0x16
function placeequipmentfailedcleanup(fxent) {
    wait(2);
    fxent delete();
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe21
// Size: 0x18
function isspidergrenade(ent) {
    return istrue(ent.isspidergrenade);
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe41
// Size: 0x77
function issupertrophy(ent) {
    entnum = ent getentitynumber();
    if (!isdefined(level.supertrophy)) {
        return false;
    }
    if (!isdefined(level.supertrophy.trophies)) {
        return false;
    }
    if (!isdefined(level.supertrophy.trophies[entnum])) {
        return false;
    }
    return level.supertrophy.trophies[entnum] == ent;
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xec0
// Size: 0x4a
function ismicroturret(ent) {
    entnum = ent getentitynumber();
    if (!isdefined(level.microturrets)) {
        return false;
    }
    if (!isdefined(level.microturrets[entnum])) {
        return false;
    }
    return level.microturrets[entnum] == ent;
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf12
// Size: 0x5f
function ischoppergunner(ent) {
    if (!isdefined(ent.streakinfo)) {
        return 0;
    }
    if (!isdefined(ent.streakinfo.streakname)) {
        return 0;
    }
    ischopper = ent.streakinfo.streakname == "chopper_gunner";
    return ischopper;
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf79
// Size: 0x5f
function issupporthelo(ent) {
    if (!isdefined(ent.streakinfo)) {
        return 0;
    }
    if (!isdefined(ent.streakinfo.streakname)) {
        return 0;
    }
    ischopper = ent.streakinfo.streakname == "chopper_support";
    return ischopper;
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe0
// Size: 0x5f
function isclusterstrike(ent) {
    if (!isdefined(ent.streakinfo)) {
        return 0;
    }
    if (!isdefined(ent.streakinfo.streakname)) {
        return 0;
    }
    var_30c3ced8e8637755 = ent.streakinfo.streakname == "toma_strike";
    return var_30c3ced8e8637755;
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1047
// Size: 0x98
function isuav(ent) {
    if (!isdefined(ent.streakinfo)) {
        return false;
    }
    if (!isdefined(ent.streakinfo.streakname)) {
        return false;
    }
    if (ent.streakinfo.streakname == "uav" || ent.streakinfo.streakname == "counter_uav" || ent.streakinfo.streakname == "directional_uav") {
        return true;
    }
    return false;
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e7
// Size: 0x5f
function isgunship(ent) {
    if (!isdefined(ent.streakinfo)) {
        return 0;
    }
    if (!isdefined(ent.streakinfo.streakname)) {
        return 0;
    }
    var_f930e97582eaea73 = ent.streakinfo.streakname == "gunship";
    return var_f930e97582eaea73;
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114e
// Size: 0x7e
function isradardrone(ent) {
    if (!isdefined(ent.streakinfo)) {
        return 0;
    }
    if (!isdefined(ent.streakinfo.streakname)) {
        return 0;
    }
    isradar = ent.streakinfo.streakname == "radar_drone_escort" || ent.streakinfo.streakname == "radar_drone_recon";
    return isradar;
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d4
// Size: 0x7e
function isscramblerdrone(ent) {
    if (!isdefined(ent.streakinfo)) {
        return 0;
    }
    if (!isdefined(ent.streakinfo.streakname)) {
        return 0;
    }
    isscrambler = ent.streakinfo.streakname == "scrambler_drone_guard" || ent.streakinfo.streakname == "counter_uav";
    return isscrambler;
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x125a
// Size: 0x5f
function isradarhelicopter(ent) {
    if (!isdefined(ent.streakinfo)) {
        return 0;
    }
    if (!isdefined(ent.streakinfo.streakname)) {
        return 0;
    }
    isradar = ent.streakinfo.streakname == "radar_drone_overwatch";
    return isradar;
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c1
// Size: 0x5f
function isassaultdrone(ent) {
    if (!isdefined(ent.streakinfo)) {
        return 0;
    }
    if (!isdefined(ent.streakinfo.streakname)) {
        return 0;
    }
    isradar = ent.streakinfo.streakname == "assault_drone";
    return isradar;
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1328
// Size: 0x2d
function isturret(ent) {
    return isdefined(ent.classname) && ent.classname == "misc_turret";
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135d
// Size: 0x18
function isdronepackage(ent) {
    return isdefined(ent.cratetype);
}

// Namespace entity / scripts/mp/utility/entity
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137d
// Size: 0x3b
function _enableequipdeployvfx() {
    if (!isdefined(self.enabledequipdeployvfx)) {
        self.enabledequipdeployvfx = 0;
    }
    if (self.enabledequipdeployvfx == 0) {
        self enableequipdeployvfx(1);
    }
    self.enabledequipdeployvfx++;
}

// Namespace entity / scripts/mp/utility/entity
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bf
// Size: 0x4b
function _disableequipdeployvfx() {
    /#
        assert(isdefined(self.enabledequipdeployvfx) && self.enabledequipdeployvfx > 0, "_disableEquipDeployVFX called when vfx are disabled.");
    #/
    if (self.enabledequipdeployvfx == 1) {
        self enableequipdeployvfx(0);
    }
    self.enabledequipdeployvfx--;
}

// Namespace entity / scripts/mp/utility/entity
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1411
// Size: 0x8c
function register_physics_collisions() {
    self endon("death");
    self endon("stop_phys_sounds");
    while (true) {
        body0, body1, flag0, flag1, position, normal, impulse, ent = self waittill("collision");
        level notify("physSnd", self);
    }
}

// Namespace entity / scripts/mp/utility/entity
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a4
// Size: 0xb7
function global_physics_sound_monitor() {
    level notify("physics_monitor");
    level endon("physics_monitor");
    while (true) {
        var_c92ef281c1d335fc, body0, body1, flag0, flag1, position, normal, impulse, var_b941baeebca428d = level waittill("physSnd");
        if (isdefined(var_c92ef281c1d335fc) && isdefined(var_c92ef281c1d335fc.phys_sound_func)) {
            level thread [[ var_c92ef281c1d335fc.phys_sound_func ]](var_c92ef281c1d335fc, body0, body1, flag0, flag1, position, normal, impulse, var_b941baeebca428d);
        }
    }
}

// Namespace entity / scripts/mp/utility/entity
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1562
// Size: 0x21
function register_physics_collision_func(entity, function_name) {
    entity.phys_sound_func = function_name;
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158a
// Size: 0x18
function istouchingboundstrigger(ent) {
    return istrue(ent.alreadytouchingtrigger);
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15aa
// Size: 0x94
function istouchingboundsnullify(ent) {
    var_5c40098b82789b9 = 0;
    if (isdefined(level.outofboundstriggerpatches) && level.outofboundstriggerpatches.size > 0) {
        foreach (patch in level.outofboundstriggerpatches) {
            if (ent istouching(patch)) {
                var_5c40098b82789b9 = 1;
                break;
            }
        }
    }
    return var_5c40098b82789b9;
}

// Namespace entity / scripts/mp/utility/entity
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1646
// Size: 0x22
function deleteonplayerdeathdisconnect(player) {
    self endon("death");
    player waittill("death_or_disconnect");
    self delete();
}

// Namespace entity / scripts/mp/utility/entity
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x166f
// Size: 0x12
function deleteatframeend() {
    self endon("death");
    waittillframeend();
    self delete();
}

