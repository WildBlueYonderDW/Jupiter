// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_371b4c2ab5861e62;
#using scripts\common\vehicle_code.gsc;
#using scripts\common\vehicle_aianim.gsc;

#namespace utility;

// Namespace utility/namespace_cbe993018617a21d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x155
// Size: 0xf
function function_1686ecaabfdc542d() {
    self function_6a325f91941ed47c("p2p");
}

// Namespace utility/namespace_cbe993018617a21d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b
// Size: 0x3f
function function_4808177c29f56fb9() {
    while (!isdefined(self.var_fe321e008e65c319)) {
        wait(0.5);
    }
    if (isdefined(self.var_fe321e008e65c319)) {
        self.var_fe321e008e65c319.var_71c1911e983f326d = &function_baefd5546ede6550;
    }
}

// Namespace utility/namespace_cbe993018617a21d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1
// Size: 0x45
function function_eee51130cc8dce38() {
    return isdefined(self) && isdefined(self.var_fe321e008e65c319) && isdefined(self.var_fe321e008e65c319.health) && self.var_fe321e008e65c319.health < 1;
}

// Namespace utility/namespace_cbe993018617a21d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe
// Size: 0x22d
function function_8d531048cd1abb65(var_434a337ab1f41dc7) {
    if (isdefined(var_434a337ab1f41dc7.var_e350601f68faf4e7) && gettime() <= var_434a337ab1f41dc7.var_e350601f68faf4e7.var_19798821f69bdb90) {
        return var_434a337ab1f41dc7.var_e350601f68faf4e7;
    }
    if (isdefined(var_434a337ab1f41dc7.var_e350601f68faf4e7)) {
        var_434a337ab1f41dc7.var_e350601f68faf4e7.claimed = undefined;
        var_434a337ab1f41dc7.var_e350601f68faf4e7 = undefined;
    }
    var_440924cde2bd48ed = [];
    var_7ebb34cae2c736f2 = undefined;
    level.var_6e5ff6cae14c4081 = array_removeundefined(level.var_6e5ff6cae14c4081);
    level.var_6e5ff6cae14c4081 = array_removedead(level.var_6e5ff6cae14c4081);
    positions = [0:self.var_3749eb0f11873d37, 1:self.var_5da685db7d347340];
    foreach (pos in positions) {
        if (istrue(pos.blocked)) {
            continue;
        }
        if (isdefined(pos.claimed)) {
            continue;
        }
        closest = getclosest(pos.origin, level.var_6e5ff6cae14c4081);
        if (isdefined(closest) && closest != var_434a337ab1f41dc7 && !isdefined(closest.var_e350601f68faf4e7) && distancesquared(closest.origin, pos.origin) < distancesquared(var_434a337ab1f41dc7.origin, pos.origin)) {
            continue;
        }
        var_440924cde2bd48ed[var_440924cde2bd48ed.size] = pos;
    }
    if (var_440924cde2bd48ed.size) {
        var_7ebb34cae2c736f2 = getclosest(var_434a337ab1f41dc7.origin, var_440924cde2bd48ed);
    } else {
        var_7ebb34cae2c736f2 = self.var_4a35ce0251802293;
    }
    var_7ebb34cae2c736f2.claimed = var_434a337ab1f41dc7;
    var_7ebb34cae2c736f2.var_19798821f69bdb90 = gettime() + 1000;
    var_434a337ab1f41dc7.var_e350601f68faf4e7 = var_7ebb34cae2c736f2;
    return var_7ebb34cae2c736f2;
}

// Namespace utility/namespace_cbe993018617a21d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x433
// Size: 0xb4
function function_baefd5546ede6550(idamage, smeansofdeath, sweapon, partname, var_b17964b5da7540ea) {
    if (isdefined(self._blackboard.currentvehicle)) {
        if (isdefined(self._blackboard.currentvehicle.healthbuffer)) {
            if (self._blackboard.currentvehicle.health - idamage < self._blackboard.currentvehicle.healthbuffer) {
                return 1;
            }
        }
    }
    if (isexplosivedamagemod(smeansofdeath)) {
        return 0;
    }
    return 1;
}

// Namespace utility/namespace_cbe993018617a21d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ef
// Size: 0x133
function function_3a2f47ea8b6a51b3(point, num_positions, var_9973f603063c1fed) {
    degs_per_pos = 360 / num_positions;
    positions = [];
    fwd = (1, 0, 0);
    i = 0;
    while (i < 360) {
        altforward = fwd * var_9973f603063c1fed;
        rotated_forward = (cos(i) * altforward[0] - sin(i) * altforward[1], sin(i) * altforward[0] + cos(i) * altforward[1], altforward[2]);
        pos = point + rotated_forward;
        position = spawnstruct();
        position.origin = pos;
        position.origin = getgroundposition(position.origin, 128, 5000, 4000);
        position.origin = getclosestpointonnavmesh(position.origin, "tank_med");
        positions[positions.size] = position;
        i = i + degs_per_pos;
    }
    return positions;
}

// Namespace utility/namespace_cbe993018617a21d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x62a
// Size: 0xe2
function function_5fa782ec5794da38(vehicle) {
    vehicleoccupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(vehicle);
    var_e54346e77d062fbe = array_intersection(vehicleoccupants, level.players);
    if (var_e54346e77d062fbe.size > 0) {
        return 1;
    } else {
        foreach (player in level.players) {
            if (issharedfuncdefined("player", "isInLastStand")) {
                jumpiffalse([[ getsharedfunc("player", "isInLastStand") ]](player)) LOC_000000ab;
            } else {
            LOC_000000ab:
                if (!isdefined(player.vehicle) && !istrue(player istouching(vehicle))) {
                    continue;
                }
                return 1;
            }
        }
    }
    return 0;
}

// Namespace utility/namespace_cbe993018617a21d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x714
// Size: 0x80
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

// Namespace utility/namespace_cbe993018617a21d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x79c
// Size: 0x129
function function_aa7f0c3def8f14db(var_45e808dc306d0926, var_908ececf1b52292e) {
    var_7296729673615c7 = ter_op(isdefined(var_45e808dc306d0926), var_45e808dc306d0926, 1073741824);
    var_2a29b237dcc66fe5 = ter_op(isdefined(var_908ececf1b52292e), var_908ececf1b52292e, level.players);
    closest_player = undefined;
    foreach (player in var_2a29b237dcc66fe5) {
        if (isdefined(level.ignoredbycheck) && [[ level.ignoredbycheck ]](self, player)) {
            continue;
        }
        if (issharedfuncdefined("player", "isInLastStand")) {
            jumpiffalse([[ getsharedfunc("player", "isInLastStand") ]](player)) LOC_000000e1;
        } else {
        LOC_000000e1:
            var_a9b6b677f6d0a010 = distancesquared(self.origin, player.origin);
            if (player namespace_f8065cafc523dba5::_isalive() && var_a9b6b677f6d0a010 < var_7296729673615c7) {
                closest_player = player;
                var_7296729673615c7 = var_a9b6b677f6d0a010;
            }
        }
    }
    return closest_player;
}

// Namespace utility/namespace_cbe993018617a21d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cd
// Size: 0x5d
function function_cbc170d40c70cddf(startpos, endpos, speed, convert) {
    dist = distance(startpos, endpos);
    if (istrue(convert)) {
        dist = dist * 0.0568182;
    }
    var_58824a41b5315792 = dist / speed;
    return max(var_58824a41b5315792, 0.05);
}

// Namespace utility/namespace_cbe993018617a21d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x932
// Size: 0x2b6
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
            namespace_14d36171baccf528::function_350cf0db9f5e0cbe(rider, "skipDeathCount", 1);
            rider kill();
        }
    }
    namespace_b479ac682b93cd92::_vehicle_unload("default");
    if (namespace_4ff41449ab14a3a0::riders_unloadable("default")) {
        self waittill("unloaded");
    }
    if (isdefined(level.vehicle.var_9442d439c225c3fe)) {
        [[ level.vehicle.var_9442d439c225c3fe ]](self);
    }
}

// Namespace utility/namespace_cbe993018617a21d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbef
// Size: 0xa5
function function_a66d296b49cf74bf(vehicle, vehicleanim, var_cbfbb4efa1348391, var_7661fce9997cc9a4, vehicleangles, var_47b4bdc915cff70d) {
    tagorigin = vehicle gettagorigin(var_cbfbb4efa1348391);
    tagangles = vehicle gettagangles(var_cbfbb4efa1348391);
    startorigin = getstartorigin(tagorigin, tagangles, vehicleanim);
    startangles = getstartangles(tagorigin, tagangles, vehicleanim);
    movedelta = getmovedelta(vehicleanim, 0, var_47b4bdc915cff70d);
    return rotatevector(movedelta, startangles) + startorigin;
}

// Namespace utility/namespace_cbe993018617a21d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9c
// Size: 0x1b
function function_c4d871ccf375fb3b() {
    while (self vehicle_getspeed() > 0) {
        waitframe();
    }
    self function_65aa053c077c003a(1);
}

// Namespace utility/namespace_cbe993018617a21d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbe
// Size: 0x1d
function function_f4a6f33eeca44e04() {
    self endon("death");
    function_8a5e6a7db939e7b3();
    self function_6a325f91941ed47c("p2p");
}

// Namespace utility/namespace_cbe993018617a21d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xce2
// Size: 0x19
function private function_8a5e6a7db939e7b3() {
    self endon("vehicle_owner_update");
    while (self vehicle_getspeed() > 0) {
        waitframe();
    }
}

// Namespace utility/namespace_cbe993018617a21d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd02
// Size: 0x5c
function function_fb7e5919765650ea() {
    self endon("death");
    if (istrue(self.unloading)) {
        return;
    }
    self.unloading = 1;
    riders = self.riders;
    function_5d3dd28d4c5af8b2(riders);
    function_7d8f81a94dc08a15(1);
    namespace_1fbd40990ee60ede::function_887b4e2cbe3ab92c();
    namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(self, "neutral");
}

// Namespace utility/namespace_cbe993018617a21d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd65
// Size: 0x100
function function_5d3dd28d4c5af8b2(riders) {
    foreach (rider in riders) {
        if (isdefined(rider.var_58cc857ee7806cbf)) {
            rider.nocorpse = rider.var_58cc857ee7806cbf;
        } else {
            rider.nocorpse = undefined;
        }
        if (isdefined(rider.var_dfdac8cffa760661)) {
            rider.dropweapon = rider.var_dfdac8cffa760661;
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

// Namespace utility/namespace_cbe993018617a21d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe6c
// Size: 0xf1
function function_64d2d74ab85e00bb(riders) {
    foreach (rider in riders) {
        if (isdefined(rider.dropweapon)) {
            rider.var_dfdac8cffa760661 = rider.dropweapon;
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

