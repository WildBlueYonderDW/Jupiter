// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_1ac43e8fef913902;

// Namespace namespace_1ac43e8fef913902/namespace_90b872e9b61df82b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x183
// Size: 0x23b
function runequipmentping(ignore, var_8b226fa0a4438980) {
    if (!istrue(level.equipmentpingactive)) {
        return;
    }
    self endon("death");
    self.owner endon("disconnect");
    owner = self.owner;
    var_7fb1b202d80fb091 = level.uavsettings["uav_3dping"];
    if (!isdefined(var_8b226fa0a4438980)) {
        var_8b226fa0a4438980 = 0;
    }
    self.equipping_lastpingtime = var_8b226fa0a4438980;
    if (owner _hasperk("specialty_equipment_ping")) {
        while (1) {
            var_8064f574a628c5ee = 0;
            if (gettime() >= self.equipping_lastpingtime + 3000) {
                pingplayers = utility::playersincylinder(self.origin, 300);
                foreach (player in pingplayers) {
                    if (!isreallyalive(player)) {
                        continue;
                    }
                    if (!owner namespace_f8065cafc523dba5::isenemy(player)) {
                        continue;
                    }
                    if (player _hasperk("specialty_location_marking")) {
                        continue;
                    }
                    if (isdefined(player.outlined)) {
                        continue;
                    }
                    var_fb1bc5065b2468d8 = array_add(level.players, self);
                    if (isdefined(ignore)) {
                        var_fb1bc5065b2468d8 = array_add(var_fb1bc5065b2468d8, ignore);
                    }
                    originoffset = self.origin + anglestoup(self.angles) * 10;
                    if (ray_trace_passed(originoffset, player gettagorigin("j_head"), var_fb1bc5065b2468d8)) {
                        if (!player _hasperk("specialty_gpsjammer")) {
                            owner thread markasrelaysource(player);
                        }
                        var_8064f574a628c5ee = 1;
                    }
                }
                if (var_8064f574a628c5ee) {
                    if (!istrue(self.eyespyalerted)) {
                        self.eyespyalerted = 1;
                    }
                    playfxontagforclients(var_7fb1b202d80fb091.fxid_ping, self, "tag_origin", owner);
                    self playsoundtoplayer("ghost_senses_ping", owner);
                    triggerportableradarping(self.origin, owner, 400, 800);
                    wait(3);
                }
            }
            waitframe();
        }
    }
}

// Namespace namespace_1ac43e8fef913902/namespace_90b872e9b61df82b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c5
// Size: 0x91
function markdangerzoneonminimap(target, equipment) {
    target endon("death_or_disconnect");
    if (!isdefined(target) || !isreallyalive(target)) {
        return;
    }
    thread markasrelaysource(target);
    objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(10);
    if (objid == -1) {
        return;
    }
    namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "active", equipment.origin, "cb_compassping_eqp_ping", "icon_large");
    namespace_5a22b6f3a56f7e9b::objective_playermask_single(objid, self);
    target thread watchfordeath(objid);
    wait(3);
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(objid);
}

// Namespace namespace_1ac43e8fef913902/namespace_90b872e9b61df82b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45d
// Size: 0x1c
function watchfordeath(objid) {
    self waittill("death_or_disconnect");
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(objid);
}

// Namespace namespace_1ac43e8fef913902/namespace_90b872e9b61df82b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x480
// Size: 0x8d
function markasrelaysource(otherplayer) {
    level endon("game_ended");
    self endon("disconnect");
    idx = otherplayer getentitynumber();
    if (!isdefined(self.relaysource)) {
        self.relaysource = [];
    } else if (isdefined(self.relaysource[idx])) {
        self notify("markAsRelaySource");
        self endon("markAsRelaySource");
    }
    self.relaysource[idx] = 1;
    otherplayer waittill_any_timeout_1(10, "death_or_disconnect");
    self.relaysource[idx] = 0;
}

