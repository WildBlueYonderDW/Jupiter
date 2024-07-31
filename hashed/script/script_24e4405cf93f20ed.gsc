#using scripts\engine\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_371b4c2ab5861e62;
#using scripts\common\vehicle_code.gsc;
#using scripts\common\vehicle_aianim.gsc;

#namespace utility;

// Namespace utility / namespace_cbe993018617a21d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8
// Size: 0xe
function function_1686ecaabfdc542d() {
    self removecomponent("p2p");
}

// Namespace utility / namespace_cbe993018617a21d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1be
// Size: 0x3e
function function_4808177c29f56fb9() {
    while (!isdefined(self.aidriver)) {
        wait 0.5;
    }
    if (isdefined(self.aidriver)) {
        self.aidriver.var_71c1911e983f326d = &function_baefd5546ede6550;
    }
}

// Namespace utility / namespace_cbe993018617a21d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x204
// Size: 0x44
function function_eee51130cc8dce38() {
    return isdefined(self) && isdefined(self.aidriver) && isdefined(self.aidriver.health) && self.aidriver.health < 1;
}

// Namespace utility / namespace_cbe993018617a21d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x251
// Size: 0x227
function function_8d531048cd1abb65(enemy_veh) {
    if (isdefined(enemy_veh.claimed_pos) && gettime() <= enemy_veh.claimed_pos.claimrelease) {
        return enemy_veh.claimed_pos;
    }
    if (isdefined(enemy_veh.claimed_pos)) {
        enemy_veh.claimed_pos.claimed = undefined;
        enemy_veh.claimed_pos = undefined;
    }
    available_pos = [];
    var_7ebb34cae2c736f2 = undefined;
    level.var_6e5ff6cae14c4081 = array_removeundefined(level.var_6e5ff6cae14c4081);
    level.var_6e5ff6cae14c4081 = array_removedead(level.var_6e5ff6cae14c4081);
    positions = [self.var_3749eb0f11873d37, self.var_5da685db7d347340];
    foreach (pos in positions) {
        if (istrue(pos.blocked)) {
            continue;
        }
        if (isdefined(pos.claimed)) {
            continue;
        }
        closest = getclosest(pos.origin, level.var_6e5ff6cae14c4081);
        if (isdefined(closest) && closest != enemy_veh && !isdefined(closest.claimed_pos) && distancesquared(closest.origin, pos.origin) < distancesquared(enemy_veh.origin, pos.origin)) {
            continue;
        }
        available_pos[available_pos.size] = pos;
    }
    if (available_pos.size) {
        var_7ebb34cae2c736f2 = getclosest(enemy_veh.origin, available_pos);
    } else {
        var_7ebb34cae2c736f2 = self.var_4a35ce0251802293;
    }
    var_7ebb34cae2c736f2.claimed = enemy_veh;
    var_7ebb34cae2c736f2.claimrelease = gettime() + 1000;
    enemy_veh.claimed_pos = var_7ebb34cae2c736f2;
    return var_7ebb34cae2c736f2;
}

// Namespace utility / namespace_cbe993018617a21d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x481
// Size: 0xb3
function function_baefd5546ede6550(idamage, smeansofdeath, sweapon, partname, damageloc) {
    if (isdefined(self._blackboard.currentvehicle)) {
        if (isdefined(self._blackboard.currentvehicle.healthbuffer)) {
            if (self._blackboard.currentvehicle.health - idamage < self._blackboard.currentvehicle.healthbuffer) {
                return true;
            }
        }
    }
    if (isexplosivedamagemod(smeansofdeath)) {
        return false;
    }
    return true;
}

// Namespace utility / namespace_cbe993018617a21d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x53d
// Size: 0x12c
function function_3a2f47ea8b6a51b3(point, num_positions, path_radius) {
    degs_per_pos = 360 / num_positions;
    positions = [];
    fwd = (1, 0, 0);
    for (i = 0; i < 360; i += degs_per_pos) {
        altforward = fwd * path_radius;
        rotated_forward = (cos(i) * altforward[0] - sin(i) * altforward[1], sin(i) * altforward[0] + cos(i) * altforward[1], altforward[2]);
        pos = point + rotated_forward;
        position = spawnstruct();
        position.origin = pos;
        position.origin = getgroundposition(position.origin, 128, 5000, 4000);
        position.origin = getclosestpointonnavmesh(position.origin, "tank_med");
        positions[positions.size] = position;
    }
    return positions;
}

// Namespace utility / namespace_cbe993018617a21d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x672
// Size: 0xde
function function_5fa782ec5794da38(vehicle) {
    vehicleoccupants = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getalloccupants(vehicle);
    vehicle_players = array_intersection(vehicleoccupants, level.players);
    if (vehicle_players.size > 0) {
        return true;
    } else {
        foreach (player in level.players) {
            if (issharedfuncdefined("player", "isInLastStand")) {
                if ([[ getsharedfunc("player", "isInLastStand") ]](player)) {
                    continue;
                }
            }
            if (!isdefined(player.vehicle) && !istrue(player istouching(vehicle))) {
                continue;
            }
            return true;
        }
    }
    return false;
}

// Namespace utility / namespace_cbe993018617a21d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x759
// Size: 0x7d
function function_c06bd2ea8930eebf(org, array) {
    closest = array[0];
    foreach (point in array) {
        if (distancesquared(point, org) > distancesquared(closest, org)) {
            continue;
        }
        closest = point;
    }
    return closest;
}

// Namespace utility / namespace_cbe993018617a21d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7df
// Size: 0x123
function function_aa7f0c3def8f14db(maxdist_sq, var_908ececf1b52292e) {
    var_7296729673615c7 = ter_op(isdefined(maxdist_sq), maxdist_sq, 1073741824);
    player_list = ter_op(isdefined(var_908ececf1b52292e), var_908ececf1b52292e, level.players);
    closest_player = undefined;
    foreach (player in player_list) {
        if (isdefined(level.ignoredbycheck) && [[ level.ignoredbycheck ]](self, player)) {
            continue;
        }
        if (issharedfuncdefined("player", "isInLastStand")) {
            if ([[ getsharedfunc("player", "isInLastStand") ]](player)) {
                continue;
            }
        }
        dist_sqr = distancesquared(self.origin, player.origin);
        if (player scripts\cp_mp\utility\player_utility::_isalive() && dist_sqr < var_7296729673615c7) {
            closest_player = player;
            var_7296729673615c7 = dist_sqr;
        }
    }
    return closest_player;
}

// Namespace utility / namespace_cbe993018617a21d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x90b
// Size: 0x5c
function function_cbc170d40c70cddf(startpos, endpos, speed, convert) {
    dist = distance(startpos, endpos);
    if (istrue(convert)) {
        dist *= 0.0568182;
    }
    moverate = dist / speed;
    return max(moverate, 0.05);
}

// Namespace utility / namespace_cbe993018617a21d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x970
// Size: 0x2b1
function function_7d8f81a94dc08a15(var_de361e39117ae3d1, exittype) {
    level endon("game_ended");
    self endon("death");
    self endon("vehicle_owner_update");
    self notify("path_updated");
    self function_77320e794d35465a("p2p", "manualSpeed", 0);
    self function_77320e794d35465a("p2p", "brakeAtGoal", 1);
    self function_77320e794d35465a("p2p", "goalPoint", self.origin);
    self vehicle_setspeedimmediate(0, 1, 1);
    self vehicle_cleardrivingstate();
    waitframe();
    childthread function_c4d871ccf375fb3b();
    if (istrue(var_de361e39117ae3d1)) {
        thread function_f4a6f33eeca44e04();
    }
    foreach (rider in self.riders) {
        if (isdefined(rider) && isdefined(exittype) && exittype == "combat") {
            rider setstealthstate("combat");
        }
        if (!isdefined(rider) || !isdefined(rider.asmname) || !isdefined(rider._blackboard) || !isdefined(rider._blackboard.var_1745d2b69c72c627) || !isdefined(rider._blackboard.var_9176cae5619d7fba) || !isdefined(rider._blackboard.currentvehicleanimalias)) {
            continue;
        }
        animindex = archetypegetrandomalias(rider._blackboard.currentvehicleanimalias, "get_out_vehicle_combat", rider._blackboard.var_9176cae5619d7fba, 0);
        if (!isdefined(animindex)) {
            continue;
        }
        xanim = animsetgetanimfromindex(rider._blackboard.currentvehicleanimalias, "get_out_vehicle_combat", animindex);
        if (!isdefined(xanim)) {
            continue;
        }
        targetorigin = rider function_a66d296b49cf74bf(self, xanim, rider._blackboard.var_1745d2b69c72c627, self.origin, self.angles, 1);
        if (distance2dsquared(targetorigin, getclosestpointonnavmesh(targetorigin)) > 6400) {
            namespace_14d36171baccf528::agentpers_setagentpersdata(rider, "skipDeathCount", 1);
            rider kill();
        }
    }
    scripts\common\vehicle_code::_vehicle_unload("default");
    if (scripts\common\vehicle_aianim::riders_unloadable("default")) {
        self waittill("unloaded");
    }
    if (isdefined(level.vehicle.var_9442d439c225c3fe)) {
        [[ level.vehicle.var_9442d439c225c3fe ]](self);
    }
}

// Namespace utility / namespace_cbe993018617a21d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xc29
// Size: 0xa1
function function_a66d296b49cf74bf(vehicle, vehicleanim, vehicletag, vehiclelocation, vehicleangles, var_47b4bdc915cff70d) {
    tagorigin = vehicle gettagorigin(vehicletag);
    tagangles = vehicle gettagangles(vehicletag);
    startorigin = getstartorigin(tagorigin, tagangles, vehicleanim);
    startangles = getstartangles(tagorigin, tagangles, vehicleanim);
    movedelta = getmovedelta(vehicleanim, 0, var_47b4bdc915cff70d);
    return rotatevector(movedelta, startangles) + startorigin;
}

// Namespace utility / namespace_cbe993018617a21d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd3
// Size: 0x1a
function function_c4d871ccf375fb3b() {
    while (self vehicle_getspeed() > 0) {
        waitframe();
    }
    self function_65aa053c077c003a(1);
}

// Namespace utility / namespace_cbe993018617a21d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcf5
// Size: 0x1c
function function_f4a6f33eeca44e04() {
    self endon("death");
    function_8a5e6a7db939e7b3();
    self removecomponent("p2p");
}

// Namespace utility / namespace_cbe993018617a21d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd19
// Size: 0x18
function private function_8a5e6a7db939e7b3() {
    self endon("vehicle_owner_update");
    while (self vehicle_getspeed() > 0) {
        waitframe();
    }
}

// Namespace utility / namespace_cbe993018617a21d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd39
// Size: 0x5c
function unloadvehicle() {
    self endon("death");
    if (istrue(self.unloading)) {
        return;
    }
    self.unloading = 1;
    riders = self.riders;
    function_5d3dd28d4c5af8b2(riders);
    function_7d8f81a94dc08a15(1);
    scripts\cp_mp\vehicles\vehicle_occupancy::function_887b4e2cbe3ab92c();
    scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_setteam(self, "neutral");
}

// Namespace utility / namespace_cbe993018617a21d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd9d
// Size: 0xfe
function function_5d3dd28d4c5af8b2(riders) {
    foreach (rider in riders) {
        if (isdefined(rider.og_nocorpse)) {
            rider.nocorpse = rider.og_nocorpse;
        } else {
            rider.nocorpse = undefined;
        }
        if (isdefined(rider.og_dropweapon)) {
            rider.dropweapon = rider.og_dropweapon;
        }
        if (isdefined(rider.var_6fad0be819fd216c)) {
            rider.var_ad799295a6692b29 = rider.var_6fad0be819fd216c;
        }
        if (isdefined(rider.var_942b19d1f934dbcd)) {
            rider.var_d932f46857d6d61 = rider.var_942b19d1f934dbcd;
        }
        rider function_5847240c0f9900f2(1);
    }
}

// Namespace utility / namespace_cbe993018617a21d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xea3
// Size: 0xef
function function_64d2d74ab85e00bb(riders) {
    foreach (rider in riders) {
        if (isdefined(rider.dropweapon)) {
            rider.og_dropweapon = rider.dropweapon;
        }
        rider.dropweapon = 0;
        if (isdefined(rider.var_ad799295a6692b29)) {
            rider.var_6fad0be819fd216c = rider.var_ad799295a6692b29;
        }
        rider.var_ad799295a6692b29 = 1;
        if (isdefined(rider.var_d932f46857d6d61)) {
            rider.var_fa586c70f3f42da = rider.var_d932f46857d6d61;
        }
        rider.var_d932f46857d6d61 = undefined;
        rider function_5847240c0f9900f2(0);
    }
}

