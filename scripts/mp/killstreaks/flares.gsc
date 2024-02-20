// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;

#namespace flares;

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25f
// Size: 0x28
function flares_monitor(var_f7324548b947a802) {
    self.flaresreservecount = var_f7324548b947a802;
    self.flareslive = [];
    thread ks_laserguidedmissile_handleincoming();
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28e
// Size: 0x5d
function flares_playfx(var_74da9c68920ff387, var_5991f0e5da9f9bd5) {
    var_23e275144756d0 = "tag_origin";
    if (!isdefined(var_74da9c68920ff387)) {
        var_74da9c68920ff387 = "vehicle_flares";
    }
    if (isdefined(var_5991f0e5da9f9bd5)) {
        var_23e275144756d0 = var_5991f0e5da9f9bd5;
    }
    playsoundatpos(self gettagorigin(var_23e275144756d0), "ks_apache_flares");
    playfxontag(level._effect[var_74da9c68920ff387], self, var_23e275144756d0);
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f2
// Size: 0x88
function flares_deploy() {
    flare = spawn("script_origin", self.origin + (0, 0, -256));
    flare.angles = self.angles;
    flare movegravity((0, 0, -1), 5);
    self.flareslive[self.flareslive.size] = flare;
    flare thread flares_deleteaftertime(5, 2, self);
    return flare;
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x382
// Size: 0x72
function flares_deleteaftertime(var_c80c23cecbcf334f, var_66f0721fc5bc2eb5, vehicle) {
    /#
        assertex(!isdefined(var_66f0721fc5bc2eb5) || var_66f0721fc5bc2eb5 < var_c80c23cecbcf334f, "flares_deleteAfterTime() delayDelete should never be greater than delayStopTracking.");
    #/
    if (isdefined(var_66f0721fc5bc2eb5) && isdefined(vehicle)) {
        var_c80c23cecbcf334f = var_c80c23cecbcf334f - var_66f0721fc5bc2eb5;
        wait(var_66f0721fc5bc2eb5);
        if (isdefined(vehicle)) {
            vehicle.flareslive = array_remove(vehicle.flareslive, self);
        }
    }
    wait(var_c80c23cecbcf334f);
    self delete();
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fb
// Size: 0x17
function flares_getnumleft(vehicle) {
    return vehicle.flaresreservecount;
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41a
// Size: 0x33
function flares_areavailable(vehicle) {
    flares_cleanflareslivearray(vehicle);
    return vehicle.flaresreservecount > 0 || vehicle.flareslive.size > 0;
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x455
// Size: 0x4b
function flares_getflarereserve(vehicle) {
    /#
        assertex(vehicle.flaresreservecount > 0, "flares_getFlareReserve() called on vehicle without any flares in reserve.");
    #/
    flares_reducereserves(vehicle);
    vehicle thread flares_playfx();
    flare = vehicle flares_deploy();
    return flare;
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a8
// Size: 0x29
function flares_cleanflareslivearray(vehicle) {
    vehicle.flareslive = array_removeundefined(vehicle.flareslive);
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d8
// Size: 0x4f
function flares_getflarelive(vehicle) {
    flares_cleanflareslivearray(vehicle);
    flare = undefined;
    if (vehicle.flareslive.size > 0) {
        flare = vehicle.flareslive[vehicle.flareslive.size - 1];
    }
    return flare;
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52f
// Size: 0xe2
function ks_laserguidedmissile_handleincoming() {
    level endon("game_ended");
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    self endon("helicopter_done");
    while (flares_areavailable(self)) {
        target = missiles = player = level waittill("laserGuidedMissiles_incoming");
        if (!isdefined(target) || target != self) {
            continue;
        }
        if (!isarray(missiles)) {
            missiles = [0:missiles];
        }
        foreach (missile in missiles) {
            if (isvalidmissile(missile)) {
                level thread ks_laserguidedmissile_monitorproximity(missile, player, player.team, target);
            }
        }
    }
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x618
// Size: 0xc3
function ks_laserguidedmissile_monitorproximity(missile, player, team, target) {
    target endon("death");
    missile endon("death");
    missile endon("missile_targetChanged");
    while (flares_areavailable(target)) {
        if (!isdefined(target) || !isvalidmissile(missile)) {
            break;
        }
        center = target getpointinbounds(0, 0, 0);
        if (distancesquared(missile.origin, center) < 4000000) {
            flare = flares_getflarelive(target);
            if (!isdefined(flare)) {
                flare = flares_getflarereserve(target);
            }
            clearprojectilelockedon(missile);
            missile missile_settargetent(flare);
            missile notify("missile_pairedWithFlare");
            break;
        }
        waitframe();
    }
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e2
// Size: 0x9e
function flares_handleincomingsam(var_ca4dc074041b22cd) {
    level endon("game_ended");
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    self endon("helicopter_done");
    for (;;) {
        var_d1636a91c31cf68f = var_a512aa80ea6bf396 = player = level waittill("sam_fired");
        if (!isdefined(var_d1636a91c31cf68f) || var_d1636a91c31cf68f != self) {
            continue;
        }
        if (isdefined(var_ca4dc074041b22cd)) {
            level thread [[ var_ca4dc074041b22cd ]](player, player.team, var_d1636a91c31cf68f, var_a512aa80ea6bf396);
        } else {
            level thread flares_watchsamproximity(player, player.team, var_d1636a91c31cf68f, var_a512aa80ea6bf396);
        }
    }
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x787
// Size: 0x12b
function flares_watchsamproximity(player, var_82fd3ee8fbace30e, missiletarget, var_a512aa80ea6bf396) {
    level endon("game_ended");
    missiletarget endon("death");
    while (1) {
        center = missiletarget getpointinbounds(0, 0, 0);
        curdist = [];
        for (i = 0; i < var_a512aa80ea6bf396.size; i++) {
            if (isdefined(var_a512aa80ea6bf396[i])) {
                curdist[i] = distance(var_a512aa80ea6bf396[i].origin, center);
            }
        }
        for (i = 0; i < curdist.size; i++) {
            if (isdefined(curdist[i])) {
                if (curdist[i] < 4000 && missiletarget.flaresreservecount > 0) {
                    flares_reducereserves(missiletarget);
                    missiletarget thread flares_playfx();
                    newtarget = missiletarget flares_deploy();
                    for (j = 0; j < var_a512aa80ea6bf396.size; j++) {
                        if (isdefined(var_a512aa80ea6bf396[j])) {
                            clearprojectilelockedon(var_a512aa80ea6bf396[j]);
                            var_a512aa80ea6bf396[j] missile_settargetent(newtarget);
                            var_a512aa80ea6bf396[j] notify("missile_pairedWithFlare");
                        }
                    }
                    return;
                }
            }
        }
        waitframe();
    }
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b9
// Size: 0xbd
function flares_handleincomingstinger(var_ca4dc074041b22cd, var_cf2f5e8de06279b3) {
    level endon("game_ended");
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    self endon("helicopter_done");
    if (!isdefined(self.flareslive)) {
        self.flareslive = [];
    }
    for (;;) {
        var_d1636a91c31cf68f = missile = player = level waittill("stinger_fired");
        if (!isdefined(var_d1636a91c31cf68f) || var_d1636a91c31cf68f != self) {
            continue;
        }
        if (isdefined(var_ca4dc074041b22cd)) {
            missile thread [[ var_ca4dc074041b22cd ]](player, player.team, var_d1636a91c31cf68f, var_cf2f5e8de06279b3);
        } else {
            missile thread flares_watchstingerproximity(player, player.team, var_d1636a91c31cf68f, var_cf2f5e8de06279b3);
        }
    }
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97d
// Size: 0xc1
function flares_watchstingerproximity(player, var_82fd3ee8fbace30e, missiletarget, var_5991f0e5da9f9bd5) {
    self endon("death");
    while (1) {
        if (!isdefined(missiletarget)) {
            break;
        }
        center = missiletarget getpointinbounds(0, 0, 0);
        curdist = distance(self.origin, center);
        if (curdist < 4000 && missiletarget.flaresreservecount > 0) {
            flares_reducereserves(missiletarget);
            missiletarget thread flares_playfx(undefined, var_5991f0e5da9f9bd5);
            newtarget = missiletarget flares_deploy();
            clearprojectilelockedon(self);
            self missile_settargetent(newtarget);
            self notify("missile_pairedWithFlare");
            return;
        }
        waitframe();
    }
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa45
// Size: 0x48
function flares_reducereserves(var_a8ff4810541ba06e) {
    var_a8ff4810541ba06e.flaresreservecount--;
    if (isdefined(var_a8ff4810541ba06e.owner)) {
        var_a8ff4810541ba06e.owner setclientomnvar("ui_killstreak_flares", var_a8ff4810541ba06e.flaresreservecount);
    }
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa94
// Size: 0x61
function ks_setup_manual_flares(var_57b8afe291ab835, button_action, var_b1b8f942e50d3620, var_1ec886f1b7540ead) {
    self.flaresreservecount = var_57b8afe291ab835;
    self.flareslive = [];
    if (isdefined(var_b1b8f942e50d3620)) {
        self.owner setclientomnvar(var_b1b8f942e50d3620, var_57b8afe291ab835);
    }
    thread ks_manualflares_watchuse(button_action, var_b1b8f942e50d3620);
    thread ks_manualflares_handleincoming(var_1ec886f1b7540ead);
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafc
// Size: 0xe1
function ks_manualflares_watchuse(button_action, var_c10415b6394096cc) {
    level endon("game_ended");
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    self endon("helicopter_done");
    if (!isai(self.owner)) {
        self.owner notifyonplayercommand("manual_flare_popped", button_action);
    }
    while (flares_getnumleft(self)) {
        self.owner waittill("manual_flare_popped");
        flare = flares_getflarereserve(self);
        if (isdefined(flare) && isdefined(self.owner) && !isai(self.owner)) {
            self.owner playlocalsound("ks_ac130_flares");
            if (isdefined(var_c10415b6394096cc)) {
                self.owner setclientomnvar(var_c10415b6394096cc, flares_getnumleft(self));
            }
        }
    }
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe4
// Size: 0x15b
function ks_manualflares_handleincoming(var_c10415b6394096cc) {
    level endon("game_ended");
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    self endon("helicopter_done");
    while (flares_areavailable(self)) {
        missiles = self waittill("targeted_by_incoming_missile");
        if (!isdefined(missiles)) {
            continue;
        }
        self.owner thread ks_watch_death_stop_sound(self, "missile_incoming");
        if (isdefined(var_c10415b6394096cc)) {
            var_53b34aadf7b8e731 = vectornormalize(missiles[0].origin - self.origin);
            var_f2fd2ff92f5325ba = vectornormalize(anglestoright(self.angles));
            vec_dot = vectordot(var_53b34aadf7b8e731, var_f2fd2ff92f5325ba);
            var_ece37f0d164606d3 = 1;
            if (vec_dot > 0) {
                var_ece37f0d164606d3 = 2;
            } else if (vec_dot < 0) {
                var_ece37f0d164606d3 = 3;
            }
            self.owner setclientomnvar(var_c10415b6394096cc, var_ece37f0d164606d3);
        }
        foreach (missile in missiles) {
            if (isvalidmissile(missile)) {
                thread ks_manualflares_monitorproximity(missile);
            }
        }
    }
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd46
// Size: 0xaa
function ks_manualflares_monitorproximity(missile) {
    self endon("death");
    missile endon("death");
    while (1) {
        if (!isdefined(self) || !isvalidmissile(missile)) {
            break;
        }
        center = self getpointinbounds(0, 0, 0);
        if (distancesquared(missile.origin, center) < 4000000) {
            flare = flares_getflarelive(self);
            if (isdefined(flare)) {
                clearprojectilelockedon(missile);
                missile missile_settargetent(flare);
                missile notify("missile_pairedWithFlare");
                self.owner stoplocalsound("missile_incoming");
                break;
            }
        }
        waitframe();
    }
}

// Namespace flares/namespace_dc0d47ddf0ead8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf7
// Size: 0x2b
function ks_watch_death_stop_sound(vehicle, sound) {
    self endon("disconnect");
    vehicle waittill("death");
    self stoplocalsound(sound);
}

