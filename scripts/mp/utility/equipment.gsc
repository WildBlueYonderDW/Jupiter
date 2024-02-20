// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\debug.gsc;

#namespace equipment;

// Namespace equipment/namespace_ff64cf6a607bc089
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x343
// Size: 0x10f
function get_mine_ignore_list() {
    ignorelist = [0:self];
    if (isdefined(level.dynamicladders)) {
        foreach (struct in level.dynamicladders) {
            ignorelist[ignorelist.size] = struct.ents[0];
        }
    }
    linkedents = self getlinkedchildren(1);
    if (!isdefined(linkedents)) {
        linkedents = [];
    }
    linkedents[linkedents.size] = self getlinkedparent();
    foreach (linkedent in linkedents) {
        if (isdefined(linkedent) && linkedent.classname == "grenade") {
            ignorelist[ignorelist.size] = linkedent;
        }
    }
    return ignorelist;
}

// Namespace equipment/namespace_ff64cf6a607bc089
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45a
// Size: 0x44b
function get_sticky_grenade_destination(grenade, var_f432e8f2c3b65bad, var_76831d64528b6d31, var_8df3ff6d9db28011, fusetime, data) {
    /#
        assertex(var_76831d64528b6d31 != 0 && var_8df3ff6d9db28011 != 0, "get_sticky_grenade_destination() speedForward and speedUp cannot both be zero.");
    #/
    grenade endon("death");
    if (!isdefined(data)) {
        data = spawnstruct();
    }
    if (!isdefined(data.contents)) {
        data.contents = get_grenade_cast_contents();
    }
    if (!isdefined(data.divisions)) {
        data.divisions = 5;
    }
    if (!isdefined(data.amortize)) {
        data.amortize = 1;
    }
    if (!isdefined(data.ignorelist)) {
        data.ignorelist = [0:grenade, 1:grenade.owner];
    }
    if (!isdefined(data.ignorclutter)) {
        data.ignoreclutter = 1;
    }
    if (!isdefined(fusetime)) {
        fusetime = 10;
    }
    if (!isdefined(data.maxtime)) {
        data.maxtime = fusetime - fusetime * grenade.tickpercent;
    }
    /#
        assertex(data.maxtime > 0, "get_sticky_grenade_destination() .maxTime must be greater than zero.");
    #/
    /#
        assertex(data.divisions > 0, "get_sticky_grenade_destination() .divisions must be greater than zero.");
    #/
    var_46bccf24774ba912 = data.maxtime / data.divisions;
    times[0] = 0;
    positions[0] = grenade.origin;
    var_cbe776efc22487c7 = data.divisions;
    dirforward = anglestoforward(var_f432e8f2c3b65bad);
    var_6dea3f838287bded = (0, 0, 1);
    vel = dirforward * var_76831d64528b6d31 + var_6dea3f838287bded * var_8df3ff6d9db28011;
    var_71b049ff6296dc2f = var_6dea3f838287bded * vectordot(var_6dea3f838287bded, vel);
    var_60cecc5d1218a89e = vel - var_71b049ff6296dc2f;
    for (i = 1; i < data.divisions; i++) {
        prevtime = times[i - 1];
        prevposition = positions[i - 1];
        nexttime = i * var_46bccf24774ba912;
        var_3e6b57d717b688d8 = var_60cecc5d1218a89e * nexttime;
        var_46de56d5eb869951 = var_71b049ff6296dc2f * nexttime + 0.5 * (0, 0, -800) * nexttime * nexttime;
        nextposition = positions[0] + var_3e6b57d717b688d8 + var_46de56d5eb869951;
        times[i] = nexttime;
        positions[i] = nextposition;
        results = physics_raycast(prevposition, nextposition, data.contents, data.ignorelist, 1, "physicsquery_closest", data.ignoreclutter);
        if (isdefined(results) && results.size > 0) {
            /#
                var_cbe776efc22487c7 = i;
            #/
            data.destination = results[0]["position"];
            data.destinationnormal = results[0]["normal"];
            data.destinationentity = results[0]["entity"];
            data.destinationhit = 1;
            var_ec7b20b1054d5d98 = nextposition - prevposition;
            var_5805327f64d62d38 = length(var_ec7b20b1054d5d98);
            var_35ebf7955ec217cf = var_ec7b20b1054d5d98 / var_5805327f64d62d38;
            var_75c0b9c719a5fc05 = prevposition - data.destination;
            var_59d191507790c7c9 = vectordot(var_35ebf7955ec217cf, var_75c0b9c719a5fc05);
            var_fb921beb20aa928d = clamp(var_59d191507790c7c9 / var_5805327f64d62d38, 0, 1);
            data.destinationtime = prevtime + var_46bccf24774ba912 * var_fb921beb20aa928d;
            break;
        } else if (i == data.divisions - 1) {
            data.destination = nextposition;
            break;
        }
        if (data.amortize) {
            waitframe();
        }
    }
    /#
    #/
    return data;
}

// Namespace equipment/namespace_ff64cf6a607bc089
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ad
// Size: 0x94
function get_grenade_cast_contents(var_aafb624f1dd4f653) {
    contents = undefined;
    if (istrue(var_aafb624f1dd4f653)) {
        contents = physics_createcontents([0:"physicscontents_missileclip", 1:"physicscontents_item", 2:"physicscontents_vehicle", 3:"physicscontents_glass", 4:"physicscontents_water", 5:"physicscontents_characterproxy"]);
    } else {
        contents = physics_createcontents([0:"physicscontents_missileclip", 1:"physicscontents_item", 2:"physicscontents_vehicle", 3:"physicscontents_glass", 4:"physicscontents_water"]);
    }
    return contents;
}

// Namespace equipment/namespace_ff64cf6a607bc089
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x949
// Size: 0x61f
function plant(grenade, data) {
    self endon("death_or_disconnect");
    grenade endon("death");
    /#
        assertex(isdefined(grenade), "plant() called with undefined grenade.");
    #/
    /#
        assertex(isdefined(data), "plant() called with undefined data.");
    #/
    /#
        assertex(isdefined(data.throwspeedforward), "plant() called with undefined data.throwSpeedForward.");
    #/
    /#
        assertex(isdefined(data.throwspeedup), "plant() called with undefined data.throwSpeedUp.");
    #/
    grenade.releasegrenadeorigin = grenade.origin;
    grenade.releaseownerorigin = self.origin;
    grenade.releaseownereye = self geteye();
    grenade.releaseownerangles = self getgunangles();
    if (!isdefined(data.plantmaxtime)) {
        data.plantmaxtime = 0.5;
    }
    if (!isdefined(data.plantmaxroll)) {
        data.plantmaxroll = 0;
    }
    if (!isdefined(data.plantmindistbeloweye)) {
        data.plantmindistbeloweye = 12;
    }
    if (!isdefined(data.plantmaxdistbelowownerfeet)) {
        data.plantmaxdistbelowownerfeet = 20;
    }
    if (!isdefined(data.plantmindisteyetofeet)) {
        data.plantmindisteyetofeet = 45;
    }
    if (!isdefined(data.plantnormalcos)) {
        data.plantnormalcos = 0.342;
    }
    if (!isdefined(data.plantoffsetz)) {
        data.plantoffsetz = 1;
    }
    plant_watch_stuck(grenade, data);
    var_6eb1ccfdf22d82b7 = 0;
    position = data.notifyorigin;
    normal = data.notifynormal;
    var_bf8e5f003146af44 = data.notifyentity;
    stuck = data.notifyhit;
    angles = undefined;
    if (!istrue(stuck)) {
        position = data.calcorigin;
        normal = data.calcnormal;
        var_bf8e5f003146af44 = data.calcentity;
        stuck = data.calchit;
        if (istrue(stuck) && isdefined(var_bf8e5f003146af44) && var_bf8e5f003146af44 getnonstick()) {
            stuck = undefined;
        }
        contents = get_grenade_cast_contents(0);
        ignorelist = [0:grenade];
        caststart = self geteye() - (0, 0, 30);
        castend = caststart + anglestoforward(self getplayerangles(1)) * 20;
        results = physics_raycast(caststart, castend, contents, ignorelist, 0, "physicsquery_closest", 1);
        if (isdefined(results) && results.size > 0) {
            stuck = 0;
        }
    } else {
        angles = plant_clamp_angles(grenade.angles, data);
    }
    if (istrue(stuck)) {
        if (isdefined(normal) && vectordot(normal, (0, 0, 1)) < data.plantnormalcos) {
            var_6eb1ccfdf22d82b7 = 1;
        } else {
            var_f4ef78de9cf3220a = vectordot(grenade.releaseownerorigin - position, (0, 0, 1));
            if (var_f4ef78de9cf3220a > 0) {
                if (var_f4ef78de9cf3220a > data.plantmaxdistbelowownerfeet) {
                    var_6eb1ccfdf22d82b7 = 1;
                }
            } else {
                var_89cc128c05b322d1 = vectordot(grenade.releaseownereye - grenade.releaseownerorigin, (0, 0, 1));
                if (var_89cc128c05b322d1 > data.plantmindisteyetofeet) {
                    var_ab4db4e369e3fb13 = vectordot(grenade.releaseownereye - position, (0, 0, 1));
                    if (var_ab4db4e369e3fb13 >= 0) {
                        if (var_ab4db4e369e3fb13 < data.plantmindistbeloweye) {
                            var_6eb1ccfdf22d82b7 = 1;
                        }
                    } else {
                        var_6eb1ccfdf22d82b7 = 1;
                    }
                }
            }
        }
    } else {
        var_6eb1ccfdf22d82b7 = 1;
    }
    if (var_6eb1ccfdf22d82b7) {
        contents = data.castcontents;
        if (!isdefined(contents)) {
            contents = get_grenade_cast_contents();
        }
        ignorelist = [0:grenade];
        caststart = grenade.releaseownerorigin + (0, 0, 1);
        castend = caststart + (0, 0, -1 * data.plantmaxdistbelowownerfeet);
        results = physics_raycast(caststart, castend, contents, ignorelist, 1, "physicsquery_closest", 1);
        if (isdefined(results) && results.size > 0) {
            position = results[0]["position"];
            normal = results[0]["normal"];
            if (isdefined(normal) && vectordot(normal, (0, 0, 1)) < data.plantnormalcos) {
                return 0;
            }
            var_28b3f77bb0070f33 = grenade.releaseownerangles * (0, 1, 0);
            if (isdefined(normal)) {
                angles = vectortoanglessafe(anglestoforward(var_28b3f77bb0070f33), normal);
                angles = plant_clamp_angles(angles, data);
            } else {
                angles = var_28b3f77bb0070f33;
            }
            position = position + anglestoup(angles) * data.plantoffsetz;
            var_bf8e5f003146af44 = results[0]["entity"];
            grenade dontinterpolate();
            grenade.origin = position;
            grenade.angles = angles;
            /#
            #/
        } else {
            return 0;
        }
    } else {
        if (!isdefined(angles)) {
            var_28b3f77bb0070f33 = grenade.releaseownerangles * (0, 1, 0);
            if (isdefined(normal)) {
                angles = vectortoanglessafe(anglestoforward(var_28b3f77bb0070f33), normal);
                angles = plant_clamp_angles(angles, data);
            } else {
                angles = var_28b3f77bb0070f33;
            }
        }
        position = position + anglestoup(angles) * data.plantoffsetz;
        grenade dontinterpolate();
        grenade.origin = position;
        grenade.angles = angles;
        /#
        #/
    }
    if (isdefined(var_bf8e5f003146af44)) {
        grenade linkto(var_bf8e5f003146af44);
    }
    return 1;
}

// Namespace equipment/namespace_ff64cf6a607bc089
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf70
// Size: 0x44
function plant_watch_stuck(grenade, data) {
    childthread plant_watch_stuck_notify(grenade, data);
    childthread plant_watch_stuck_calculate(grenade, data);
    childthread plant_watch_stuck_timeout(grenade, data);
    data waittill("start_race");
    waittillframeend();
    data notify("end_race");
    return data;
}

// Namespace equipment/namespace_ff64cf6a607bc089
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbc
// Size: 0x7f
function plant_watch_stuck_notify(grenade, data) {
    data endon("end_race");
    stuckto = grenade waittill("missile_stuck");
    data.notifyorigin = grenade.origin;
    data.notifyangles = grenade.angles;
    data.notifyentity = stuckto;
    data.notifyhit = 1;
    data notify("start_race");
}

// Namespace equipment/namespace_ff64cf6a607bc089
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1042
// Size: 0xad
function plant_watch_stuck_calculate(grenade, data) {
    data endon("end_race");
    data = get_sticky_grenade_destination(grenade, grenade.releaseownerangles, data.throwspeedforward, data.throwspeedup, data.castmaxtime, data);
    data.calcorigin = data.destination;
    data.calcnormal = data.destinationnormal;
    data.calcentity = data.destinationentity;
    data.calchit = data.destinationhit;
}

// Namespace equipment/namespace_ff64cf6a607bc089
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f6
// Size: 0x2f
function plant_watch_stuck_timeout(grenade, data) {
    data endon("end_race");
    wait(data.plantmaxtime);
    data notify("start_race");
}

// Namespace equipment/namespace_ff64cf6a607bc089
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x112c
// Size: 0x96
function plant_clamp_angles(angles, data) {
    pitch = 0;
    yaw = angles[1];
    roll = ter_op(data.plantmaxroll != 0, angles[2], 0);
    if (roll != 0) {
        if (roll > 0) {
            roll = clamp(angles[2], 0, data.plantmaxroll);
        } else {
            roll = clamp(angles[2], -1 * data.plantmaxroll, 0);
        }
    }
    return (pitch, yaw, roll);
}

// Namespace equipment/namespace_ff64cf6a607bc089
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ca
// Size: 0x63
function watch_flight_collision() {
    original_pos = self.origin;
    while (1) {
        platform = self waittill("touching_platform");
        if (isdefined(platform) && self istouching(platform) && self.origin[2] - original_pos[2] > 12) {
            self notify("collision_with_platform");
            return;
        }
    }
}

