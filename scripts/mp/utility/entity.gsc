// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace entity;

// Namespace entity/namespace_235de5057ddc58e0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a
// Size: 0xd1
function getaverageorigin(ent_array) {
    var_d8de9486a89d3332 = (0, 0, 0);
    if (!ent_array.size) {
        return undefined;
    }
    foreach (ent in ent_array) {
        var_d8de9486a89d3332 = var_d8de9486a89d3332 + ent.origin;
    }
    var_16c3b0338e3e0298 = int(var_d8de9486a89d3332[0] / ent_array.size);
    var_16c3b1338e3e04cb = int(var_d8de9486a89d3332[1] / ent_array.size);
    var_16c3b2338e3e06fe = int(var_d8de9486a89d3332[2] / ent_array.size);
    var_d8de9486a89d3332 = (var_16c3b0338e3e0298, var_16c3b1338e3e04cb, var_16c3b2338e3e06fe);
    return var_d8de9486a89d3332;
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x443
// Size: 0xd4
function touchingbadtrigger() {
    var_62a9e105632784d0 = getentarray("trigger_hurt", "classname");
    foreach (trigger in var_62a9e105632784d0) {
        if (self istouching(trigger)) {
            return 1;
        }
    }
    radtriggers = getentarray("radiation", "targetname");
    foreach (trigger in radtriggers) {
        if (self istouching(trigger)) {
            return 1;
        }
    }
    return 0;
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51f
// Size: 0x7c
function touchingoobtrigger() {
    if (istrue(self.allowedintrigger)) {
        return 0;
    }
    if (!isdefined(level.outofboundstriggers)) {
        return 0;
    }
    foreach (trigger in level.outofboundstriggers) {
        if (self istouching(trigger)) {
            return 1;
        }
    }
    return 0;
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a3
// Size: 0x83
function touchingballallowedtrigger() {
    if (!istrue(level.ballallowedtriggers.size)) {
        return 0;
    }
    self.allowedintrigger = 0;
    foreach (trigger in level.ballallowedtriggers) {
        if (self istouching(trigger)) {
            self.allowedintrigger = 1;
            return 1;
        }
    }
    return 0;
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x62e
// Size: 0x83
function touchingplayerallowedtrigger() {
    if (!istrue(level.playerallowedtriggers.size)) {
        return 0;
    }
    self.allowedintrigger = 0;
    foreach (trigger in level.playerallowedtriggers) {
        if (self istouching(trigger)) {
            self.allowedintrigger = 1;
            return 1;
        }
    }
    return 0;
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6b9
// Size: 0xbc
function findisfacing(ent1, ent2, tolerance) {
    var_5762b77f73eda7c0 = cos(tolerance);
    var_4911f9a2a7f63e01 = anglestoforward(ent1.angles);
    var_39166b57b87f75d = ent2.origin - ent1.origin;
    var_4911f9a2a7f63e01 = var_4911f9a2a7f63e01 * (1, 1, 0);
    var_39166b57b87f75d = var_39166b57b87f75d * (1, 1, 0);
    var_39166b57b87f75d = vectornormalize(var_39166b57b87f75d);
    var_4911f9a2a7f63e01 = vectornormalize(var_4911f9a2a7f63e01);
    var_466e87ce09ca407b = vectordot(var_39166b57b87f75d, var_4911f9a2a7f63e01);
    if (var_466e87ce09ca407b >= var_5762b77f73eda7c0) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77c
// Size: 0x37
function isaiteamparticipant(ent) {
    if (isagent(ent) && ent.agent_teamparticipant == 1) {
        return 1;
    }
    if (isbot(ent)) {
        return 1;
    }
    return 0;
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bb
// Size: 0x26
function isteamparticipant(ent) {
    if (isaiteamparticipant(ent)) {
        return 1;
    }
    if (isplayer(ent)) {
        return 1;
    }
    return 0;
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e9
// Size: 0x39
function isvalidteamtarget(attacker, victimteam, target) {
    return isdefined(target.team) && target.team == victimteam;
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82a
// Size: 0x1e
function isvalidffatarget(attacker, victimteam, target) {
    return 1;
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x850
// Size: 0x77
function getlinknamenodes() {
    array = [];
    if (isdefined(self.script_linkto)) {
        var_b11f91c17feeab8f = strtok(self.script_linkto, " ");
        for (i = 0; i < var_b11f91c17feeab8f.size; i++) {
            ent = getnode(var_b11f91c17feeab8f[i], "script_linkname");
            if (isdefined(ent)) {
                array[array.size] = ent;
            }
        }
    }
    return array;
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cf
// Size: 0x34
function function_d9ce8fb00f0e5fa1(origin, radius, var_beb392bbb338d308, var_24ee99fa6d091c2a) {
    return getentitiesinradius(origin, radius, var_beb392bbb338d308, var_24ee99fa6d091c2a, namespace_2a184fc4902783dc::create_character_contents());
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90b
// Size: 0x217
function getentitiesinradius(origin, radius, var_beb392bbb338d308, var_24ee99fa6d091c2a, var_d1bdd6b42771114c) {
    if (radius <= 0) {
        return [];
    }
    var_2649564eba242b56 = undefined;
    if (isdefined(var_24ee99fa6d091c2a)) {
        if (isarray(var_24ee99fa6d091c2a)) {
            var_2649564eba242b56 = var_24ee99fa6d091c2a;
        } else {
            var_2649564eba242b56 = [0:var_24ee99fa6d091c2a];
        }
    }
    results = physics_querypoint(origin, radius, var_d1bdd6b42771114c, var_2649564eba242b56, "physicsquery_all");
    var_815aae0bd650b698 = [];
    if (!isdefined(var_beb392bbb338d308)) {
        foreach (result in results) {
            e = result["entity"];
            if (isdefined(e)) {
                var_815aae0bd650b698[var_815aae0bd650b698.size] = e;
            }
        }
    } else {
        foreach (result in results) {
            e = result["entity"];
            if (isdefined(e) && isdefined(e.team) && e.team == var_beb392bbb338d308) {
                var_815aae0bd650b698[var_815aae0bd650b698.size] = e;
            }
        }
    }
    /#
        if (getdvarint(@"hash_9bb67ce9f0ab24e0", 0) > 0) {
            var_a3f2a72292d7314 = 60;
            sphere(origin, radius, (1, 1, 1), 0, var_a3f2a72292d7314);
            foreach (entity in var_815aae0bd650b698) {
                sphere(entity.origin, 10, (1, 0, 0), 1, var_a3f2a72292d7314);
            }
        }
    #/
    return var_815aae0bd650b698;
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xb2a
// Size: 0x187
function watchentitiesinradius(var_40ea85aa56fccdc4, var_4063cdc9b79e33f2, var_ecea6cda97e5f7ae, var_26e2ca9b2ad77b37, var_9dc460b17444614f) {
    self endon("disconnect");
    self endon("end_entities_in_radius");
    level endon("game_ended");
    while (1) {
        if (!isdefined(self)) {
            return;
        }
        var_a018e61307a26f1a = undefined;
        if (var_9dc460b17444614f) {
            var_a018e61307a26f1a = getplayersinradius(self.origin, var_40ea85aa56fccdc4);
        } else {
            var_a018e61307a26f1a = getentitiesinradius(self.origin, var_40ea85aa56fccdc4);
        }
        if (var_a018e61307a26f1a.size > 0) {
            if (!var_26e2ca9b2ad77b37) {
                self notify(var_4063cdc9b79e33f2, var_a018e61307a26f1a);
            } else {
                entities = [];
                foreach (var_52c2589580ae5782 in var_a018e61307a26f1a) {
                    sourceposition = self getorigin();
                    targetposition = ter_op(var_9dc460b17444614f, var_52c2589580ae5782 geteye(), var_52c2589580ae5782.origin);
                    var_68e6f05a4ee24dee = physics_createcontents([0:"physicscontents_vehicleclip", 1:"physicscontents_item", 2:"physicscontents_ainoshoot"]);
                    var_97db5d48f2509e02 = physics_raycast(sourceposition, targetposition, var_68e6f05a4ee24dee, undefined, 0, "physicsquery_closest");
                    if (var_97db5d48f2509e02.size <= 0) {
                        entities[entities.size] = var_52c2589580ae5782;
                    }
                }
                self notify(var_4063cdc9b79e33f2, entities);
            }
        }
        wait(var_ecea6cda97e5f7ae);
    }
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb8
// Size: 0xb
function cancelentitiesinradius() {
    self notify("end_entities_in_radius");
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xcca
// Size: 0x10f
function placeequipmentfailed(weapon, var_dacca504f8875146, position, angles) {
    /#
        assert(isdefined(var_dacca504f8875146) && isdefined(position) || !isdefined(var_dacca504f8875146) && !isdefined(position));
    #/
    self playlocalsound("scavenger_pack_pickup");
    if (istrue(var_dacca504f8875146)) {
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
        if (isplayer(self) && namespace_f8065cafc523dba5::_isalive()) {
            self iprintlnbold("Placement Failed");
        }
        break;
    }
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde0
// Size: 0x1d
function placeequipmentfailedinit() {
    level._effect["placeEquipmentFailed"] = loadfx("vfx/iw7/_requests/mp/vfx_generic_equipment_exp.vfx");
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe04
// Size: 0x16
function placeequipmentfailedcleanup(fxent) {
    wait(2);
    fxent delete();
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe21
// Size: 0x18
function isspidergrenade(ent) {
    return istrue(ent.isspidergrenade);
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe41
// Size: 0x77
function issupertrophy(ent) {
    entnum = ent getentitynumber();
    if (!isdefined(level.supertrophy)) {
        return 0;
    }
    if (!isdefined(level.supertrophy.trophies)) {
        return 0;
    }
    if (!isdefined(level.supertrophy.trophies[entnum])) {
        return 0;
    }
    return level.supertrophy.trophies[entnum] == ent;
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xec0
// Size: 0x4a
function ismicroturret(ent) {
    entnum = ent getentitynumber();
    if (!isdefined(level.microturrets)) {
        return 0;
    }
    if (!isdefined(level.microturrets[entnum])) {
        return 0;
    }
    return level.microturrets[entnum] == ent;
}

// Namespace entity/namespace_235de5057ddc58e0
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
    var_8ab8eb8def8ac7ac = ent.streakinfo.streakname == "chopper_gunner";
    return var_8ab8eb8def8ac7ac;
}

// Namespace entity/namespace_235de5057ddc58e0
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
    var_8ab8eb8def8ac7ac = ent.streakinfo.streakname == "chopper_support";
    return var_8ab8eb8def8ac7ac;
}

// Namespace entity/namespace_235de5057ddc58e0
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

// Namespace entity/namespace_235de5057ddc58e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1047
// Size: 0x98
function isuav(ent) {
    if (!isdefined(ent.streakinfo)) {
        return 0;
    }
    if (!isdefined(ent.streakinfo.streakname)) {
        return 0;
    }
    if (ent.streakinfo.streakname == "uav" || ent.streakinfo.streakname == "counter_uav" || ent.streakinfo.streakname == "directional_uav") {
        return 1;
    }
    return 0;
}

// Namespace entity/namespace_235de5057ddc58e0
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

// Namespace entity/namespace_235de5057ddc58e0
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
    var_15d89ecd7562a1e7 = ent.streakinfo.streakname == "radar_drone_escort" || ent.streakinfo.streakname == "radar_drone_recon";
    return var_15d89ecd7562a1e7;
}

// Namespace entity/namespace_235de5057ddc58e0
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
    var_152be1bda3c25940 = ent.streakinfo.streakname == "scrambler_drone_guard" || ent.streakinfo.streakname == "counter_uav";
    return var_152be1bda3c25940;
}

// Namespace entity/namespace_235de5057ddc58e0
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
    var_15d89ecd7562a1e7 = ent.streakinfo.streakname == "radar_drone_overwatch";
    return var_15d89ecd7562a1e7;
}

// Namespace entity/namespace_235de5057ddc58e0
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
    var_15d89ecd7562a1e7 = ent.streakinfo.streakname == "assault_drone";
    return var_15d89ecd7562a1e7;
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1328
// Size: 0x2d
function isturret(ent) {
    return isdefined(ent.classname) && ent.classname == "misc_turret";
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135d
// Size: 0x18
function isdronepackage(ent) {
    return isdefined(ent.cratetype);
}

// Namespace entity/namespace_235de5057ddc58e0
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

// Namespace entity/namespace_235de5057ddc58e0
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

// Namespace entity/namespace_235de5057ddc58e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1411
// Size: 0x8c
function register_physics_collisions() {
    self endon("death");
    self endon("stop_phys_sounds");
    while (1) {
        ent = impulse = normal = position = flag1 = flag0 = body1 = body0 = self waittill("collision");
        level notify("physSnd", self);
    }
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a4
// Size: 0xb7
function global_physics_sound_monitor() {
    level notify("physics_monitor");
    level endon("physics_monitor");
    while (1) {
        var_b941baeebca428d = impulse = normal = position = flag1 = flag0 = body1 = body0 = var_c92ef281c1d335fc = level waittill("physSnd");
        if (isdefined(var_c92ef281c1d335fc) && isdefined(var_c92ef281c1d335fc.phys_sound_func)) {
            level thread [[ var_c92ef281c1d335fc.phys_sound_func ]](var_c92ef281c1d335fc, body0, body1, flag0, flag1, position, normal, impulse, var_b941baeebca428d);
        }
    }
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1562
// Size: 0x21
function register_physics_collision_func(entity, var_9bc7c47cbf86e43d) {
    entity.phys_sound_func = var_9bc7c47cbf86e43d;
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158a
// Size: 0x18
function istouchingboundstrigger(ent) {
    return istrue(ent.alreadytouchingtrigger);
}

// Namespace entity/namespace_235de5057ddc58e0
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

// Namespace entity/namespace_235de5057ddc58e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1646
// Size: 0x22
function deleteonplayerdeathdisconnect(player) {
    self endon("death");
    player waittill("death_or_disconnect");
    self delete();
}

// Namespace entity/namespace_235de5057ddc58e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x166f
// Size: 0x12
function deleteatframeend() {
    self endon("death");
    waittillframeend();
    self delete();
}

