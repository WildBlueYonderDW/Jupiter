#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_1ac43e8fef913902;

// Namespace namespace_1ac43e8fef913902 / scripts\mp\perks\perk_equipmentping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0
// Size: 0x233
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
        while (true) {
            shouldping = 0;
            if (gettime() >= self.equipping_lastpingtime + 3000) {
                pingplayers = utility::playersincylinder(self.origin, 300);
                foreach (player in pingplayers) {
                    if (!isreallyalive(player)) {
                        continue;
                    }
                    if (!owner scripts\cp_mp\utility\player_utility::isenemy(player)) {
                        continue;
                    }
                    if (player _hasperk("specialty_location_marking")) {
                        continue;
                    }
                    if (isdefined(player.outlined)) {
                        continue;
                    }
                    contentignore = array_add(level.players, self);
                    if (isdefined(ignore)) {
                        contentignore = array_add(contentignore, ignore);
                    }
                    originoffset = self.origin + anglestoup(self.angles) * 10;
                    if (ray_trace_passed(originoffset, player gettagorigin("j_head"), contentignore)) {
                        if (!player _hasperk("specialty_gpsjammer")) {
                            owner thread markasrelaysource(player);
                        }
                        shouldping = 1;
                    }
                }
                if (shouldping) {
                    if (!istrue(self.eyespyalerted)) {
                        self.eyespyalerted = 1;
                    }
                    playfxontagforclients(var_7fb1b202d80fb091.fxid_ping, self, "tag_origin", owner);
                    self playsoundtoplayer("ghost_senses_ping", owner);
                    triggerportableradarping(self.origin, owner, 400, 800);
                    wait 3;
                }
            }
            waitframe();
        }
    }
}

// Namespace namespace_1ac43e8fef913902 / scripts\mp\perks\perk_equipmentping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x40b
// Size: 0x91
function markdangerzoneonminimap(target, equipment) {
    target endon("death_or_disconnect");
    if (!isdefined(target) || !isreallyalive(target)) {
        return;
    }
    thread markasrelaysource(target);
    objid = scripts\mp\objidpoolmanager::requestobjectiveid(10);
    if (objid == -1) {
        return;
    }
    scripts\mp\objidpoolmanager::objective_add_objective(objid, "active", equipment.origin, "cb_compassping_eqp_ping", "icon_large");
    scripts\mp\objidpoolmanager::objective_playermask_single(objid, self);
    target thread watchfordeath(objid);
    wait 3;
    scripts\mp\objidpoolmanager::returnobjectiveid(objid);
}

// Namespace namespace_1ac43e8fef913902 / scripts\mp\perks\perk_equipmentping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a4
// Size: 0x1b
function watchfordeath(objid) {
    self waittill("death_or_disconnect");
    scripts\mp\objidpoolmanager::returnobjectiveid(objid);
}

// Namespace namespace_1ac43e8fef913902 / scripts\mp\perks\perk_equipmentping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c7
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

