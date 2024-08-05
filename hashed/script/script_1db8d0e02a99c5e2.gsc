#using scripts\engine\utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\cp\cp_deployablebox.gsc;
#using script_74502a9e0ef1f19c;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\engine\math.gsc;
#using scripts\cp\equipment\cp_adrenaline.gsc;
#using script_7ef95bba57dc4b82;
#using script_66122a002aff5d57;
#using script_600b944a95c3a7bf;
#using script_531cb1be084314f7;

#namespace equipment;

// Namespace equipment / namespace_47366e00aa4211f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x794
// Size: 0x46
function equipment_init(globals) {
    globals.callbacks["equip_adrenaline"]["onFired"] = &scripts\cp\equipment\cp_adrenaline::onequipmentfired;
    globals.callbacks["equip_adrenaline"]["onTake"] = &scripts\cp\equipment\cp_adrenaline::onequipmenttaken;
    return globals;
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x7e3
// Size: 0x44a
function get_sticky_grenade_destination(grenade, gunangles, speedforward, speedup, fusetime, data) {
    assertex(speedforward != 0 && speedup != 0, "get_sticky_grenade_destination() speedForward and speedUp cannot both be zero.");
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
        data.ignorelist = [grenade, grenade.owner];
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
    assertex(data.maxtime > 0, "get_sticky_grenade_destination() .maxTime must be greater than zero.");
    assertex(data.divisions > 0, "get_sticky_grenade_destination() .divisions must be greater than zero.");
    steptime = data.maxtime / data.divisions;
    times[0] = 0;
    positions[0] = grenade.origin;
    var_cbe776efc22487c7 = data.divisions;
    dirforward = anglestoforward(gunangles);
    dirup = (0, 0, 1);
    vel = dirforward * speedforward + dirup * speedup;
    var_71b049ff6296dc2f = dirup * vectordot(dirup, vel);
    var_60cecc5d1218a89e = vel - var_71b049ff6296dc2f;
    for (i = 1; i < data.divisions; i++) {
        prevtime = times[i - 1];
        prevposition = positions[i - 1];
        nexttime = i * steptime;
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
            prevtodest = prevposition - data.destination;
            var_59d191507790c7c9 = vectordot(var_35ebf7955ec217cf, prevtodest);
            var_fb921beb20aa928d = clamp(var_59d191507790c7c9 / var_5805327f64d62d38, 0, 1);
            data.destinationtime = prevtime + steptime * var_fb921beb20aa928d;
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

// Namespace equipment / namespace_47366e00aa4211f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc36
// Size: 0xa5
function get_grenade_cast_contents(includeplayers) {
    contents = undefined;
    if (istrue(includeplayers)) {
        contents = physics_createcontents(["physicscontents_missileclip", "physicscontents_item", "physicscontents_vehicle", "physicscontents_solid", "physicscontents_glass", "physicscontents_water", "physicscontents_characterproxy"]);
    } else {
        contents = physics_createcontents(["physicscontents_missileclip", "physicscontents_item", "physicscontents_vehicle", "physicscontents_solid", "physicscontents_glass", "physicscontents_water"]);
    }
    return contents;
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xce4
// Size: 0x5b9
function plant(grenade, data) {
    self endon("death");
    self endon("disconnect");
    grenade endon("death");
    assertex(isdefined(grenade), "plant() called with undefined grenade.");
    assertex(isdefined(data), "plant() called with undefined data.");
    assertex(isdefined(data.throwspeedforward), "plant() called with undefined data.throwSpeedForward.");
    assertex(isdefined(data.throwspeedup), "plant() called with undefined data.throwSpeedUp.");
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
    linkedparent = data.notifyentity;
    stuck = data.notifyhit;
    angles = undefined;
    if (!istrue(stuck)) {
        position = data.calcorigin;
        normal = data.calcnormal;
        linkedparent = data.calcentity;
        stuck = data.calchit;
        if (istrue(stuck) && isdefined(linkedparent) && linkedparent getnonstick()) {
            stuck = undefined;
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
        ignorelist = [grenade, self];
        caststart = grenade.releaseownerorigin;
        castend = caststart + (0, 0, -1 * data.plantmaxdistbelowownerfeet);
        results = physics_raycast(caststart, castend, contents, ignorelist, 1, "physicsquery_closest", 1);
        if (isdefined(results) && results.size > 0) {
            position = results[0]["position"];
            normal = results[0]["normal"];
            if (isdefined(normal) && vectordot(normal, (0, 0, 1)) < data.plantnormalcos) {
                return false;
            }
            var_28b3f77bb0070f33 = grenade.releaseownerangles * (0, 1, 0);
            if (isdefined(normal)) {
                angles = vectortoanglessafe(anglestoforward(var_28b3f77bb0070f33), normal);
                angles = plant_clamp_angles(angles, data);
            } else {
                angles = var_28b3f77bb0070f33;
            }
            position += anglestoup(angles) * data.plantoffsetz;
            linkedparent = results[0]["entity"];
            grenade dontinterpolate();
            grenade.origin = position;
            grenade.angles = angles;
            /#
            #/
        } else {
            return false;
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
        position += anglestoup(angles) * data.plantoffsetz;
        grenade dontinterpolate();
        grenade.origin = position;
        grenade.angles = angles;
        /#
        #/
    }
    if (isdefined(linkedparent)) {
        grenade linkto(linkedparent);
    }
    return true;
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x12a6
// Size: 0x43
function private plant_watch_stuck(grenade, data) {
    childthread plant_watch_stuck_notify(grenade, data);
    childthread plant_watch_stuck_calculate(grenade, data);
    childthread plant_watch_stuck_timeout(grenade, data);
    data waittill("start_race");
    waittillframeend();
    data notify("end_race");
    return data;
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x12f2
// Size: 0x7e
function private plant_watch_stuck_notify(grenade, data) {
    data endon("end_race");
    stuckto = grenade waittill("missile_stuck");
    data.notifyorigin = grenade.origin;
    data.notifyangles = grenade.angles;
    data.notifyentity = stuckto;
    data.notifyhit = 1;
    data notify("start_race");
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1378
// Size: 0xb4
function private plant_watch_stuck_calculate(grenade, data) {
    data endon("end_race");
    data = get_sticky_grenade_destination(grenade, grenade.releaseownerangles, data.throwspeedforward, data.throwspeedup, data.castmaxtime, data);
    data.calcorigin = data.destination;
    data.calcnormal = data.destinationnormal;
    data.calcentity = data.destinationentity;
    data.calchit = data.destinationhit;
    data notify("start_race");
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1434
// Size: 0x2e
function private plant_watch_stuck_timeout(grenade, data) {
    data endon("end_race");
    wait data.plantmaxtime;
    data notify("start_race");
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x146a
// Size: 0x95
function private plant_clamp_angles(angles, data) {
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

// Namespace equipment / namespace_47366e00aa4211f4
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1508
// Size: 0x1d9
function makeexplosiveusabletag(tagname, isgrenade, var_23c5cd24079aaa6, var_9b12648b9f250b9c) {
    self endon("death");
    self endon("makeExplosiveUnusable");
    owner = self.owner;
    weaponname = self.weapon_name;
    equipmentref = namespace_4fb9dddfb8c1a67a::function_7f245729fcb6414d(weaponname);
    if (!isdefined(isgrenade)) {
        isgrenade = 0;
    }
    setselfusable(owner);
    if (isgrenade) {
        self enablemissilehint(1);
    } else {
        self setcursorhint("HINT_NOICON");
    }
    self sethinttag(tagname);
    self setuserange(72);
    setexplosiveusablehintstring(self.weapon_name);
    childthread notusableforjoiningplayers(owner);
    extra = 0;
    if (isdefined(var_23c5cd24079aaa6)) {
        extra = var_23c5cd24079aaa6;
    }
    while (true) {
        self waittillmatch("trigger", owner);
        if (isdefined(var_9b12648b9f250b9c)) {
            if (scripts\cp\utility::function_240f7f4e57340e8f()) {
                success = namespace_6250b14b3f614101::function_b5f5576a0017c089(var_9b12648b9f250b9c, undefined, owner, 0);
                if (!istrue(success)) {
                    continue;
                } else {
                    self notify("pickup_equipment_success");
                }
            } else {
                owner namespace_6250b14b3f614101::takeequipmentpickup(var_9b12648b9f250b9c);
            }
        } else if (!self.owner namespace_4fb9dddfb8c1a67a::hasequipment(equipmentref)) {
            self.owner thread namespace_4fb9dddfb8c1a67a::giveequipment(equipmentref, "primary");
            self.owner namespace_4fb9dddfb8c1a67a::setequipmentammo(equipmentref, extra);
        }
        owner playlocalsound("grenade_pickup");
        owner notify("pickup_equipment", weaponname);
        if (!isdefined(var_9b12648b9f250b9c)) {
            if (isdefined(equipmentref) && self.owner namespace_4fb9dddfb8c1a67a::hasequipment(equipmentref)) {
                self.owner namespace_4fb9dddfb8c1a67a::incrementequipmentammo(equipmentref, 1);
            }
        }
        if (isdefined(self.useobj)) {
            self.useobj delete();
        }
        thread deleteexplosive();
        return;
    }
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16e9
// Size: 0xdd
function setexplosiveusablehintstring(weaponname) {
    if (!isdefined(weaponname)) {
        return;
    }
    switch (weaponname) {
    case #"hash_56ee829cc162271a":
    case #"hash_a6444ed2a144f878":
    case #"hash_c45a15aa87087124":
    case #"hash_c46d19aa871781fa": 
        self sethintstring(%EQUIPMENT_HINTS/PICKUP_C4);
        break;
    case #"hash_5e8f81314553dd36": 
        self sethintstring(%EQUIPMENT_HINTS/PICKUP_AT_MINE);
        break;
    case #"hash_432644fc4753dde9":
    case #"hash_435258fc47768fa7":
    case #"hash_6a2e4f9c54756dc7": 
        self sethintstring(%EQUIPMENT_HINTS/PICKUP_CLAYMORE);
        break;
    case #"hash_cac2107b8e726d9d": 
        self sethintstring(%EQUIPMENT_HINTS/PICKUP_GAS_GRENADE);
        break;
    case #"hash_5e3fa526a48eaaa5": 
        self sethintstring(%EQUIPMENT_HINTS/PICKUP_TROPHY);
        break;
    }
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17ce
// Size: 0xcb
function function_d0e0b1a0dc489379() {
    if (isdefined(level.var_c4ea99fa46d27c12)) {
        foreach (claymore in level.var_c4ea99fa46d27c12) {
            if (isdefined(claymore.disablefunc)) {
                claymore [[ claymore.disablefunc ]]();
            }
        }
    }
    if (isdefined(level.var_804a2874c0323da7)) {
        foreach (claymore in level.var_804a2874c0323da7) {
            claymore notify("detonateExplosive");
        }
    }
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18a1
// Size: 0x12
function hasequipment(ref) {
    return namespace_4fb9dddfb8c1a67a::hasequipment(ref);
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18bc
// Size: 0x12
function getequipmentreffromweapon(objweapon) {
    return namespace_4fb9dddfb8c1a67a::getequipmentreffromweapon(objweapon);
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18d7
// Size: 0x12
function getequipmentammo(ref) {
    return namespace_4fb9dddfb8c1a67a::getequipmentammo(ref);
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18f2
// Size: 0x20
function getequipmenttableinfo(ref) {
    return level.equipment.table[ref];
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x191b
// Size: 0x1b
function setequipmentammo(ref, amount) {
    return namespace_4fb9dddfb8c1a67a::setequipmentammo(ref, amount);
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x193f
// Size: 0x7b
function function_9a74538158afcdf0(ref) {
    lootid = namespace_38b993c4618e76cd::getlootidfromref(ref);
    var_4cbbe0c2ac1a4cd4 = -1;
    while (namespace_4fb9dddfb8c1a67a::getequipmentammo(ref) < namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(ref) && isdefined(var_4cbbe0c2ac1a4cd4)) {
        var_4cbbe0c2ac1a4cd4 = namespace_bc7b29dcc022d887::function_821bfba97b1251ac(lootid);
        if (isdefined(var_4cbbe0c2ac1a4cd4)) {
            namespace_bc7b29dcc022d887::function_db1dd76061352e5b(var_4cbbe0c2ac1a4cd4, 1);
            ammo = namespace_4fb9dddfb8c1a67a::getequipmentammo(ref) + 1;
            namespace_4fb9dddfb8c1a67a::setequipmentammo(ref, ammo);
        }
    }
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19c2
// Size: 0x128
function function_e0ef70f764b4a4c7(hacker) {
    player = hacker;
    if (isdefined(hacker.owner) && hacker.equipmentref == "equip_capture_bot") {
        player = hacker.owner;
    }
    if (isdefined(self.var_11e2b1aee679c522)) {
        self [[ self.var_11e2b1aee679c522 ]](player);
        return;
    }
    self setscriptablepartstate("hacked", "active", 0);
    namespace_4fb9dddfb8c1a67a::hackequipment(hacker);
    self setscriptablepartstate("arm", "neutral", 0);
    self notify("hacked");
    if (!isdefined(self.equipmentref)) {
        return;
    }
    if (istrue(self.var_7f7645497083ef2b)) {
        return;
    }
    var_f79f311c1ed5a958 = function_4fd4273c8a15ac00(self.equipmentref);
    if (var_f79f311c1ed5a958 != "") {
        dropinfo = namespace_6250b14b3f614101::getitemdropinfo(self.origin, self.angles);
        item = namespace_6250b14b3f614101::spawnpickup(var_f79f311c1ed5a958, dropinfo);
        if (isdefined(self.disablefunc)) {
            self [[ self.disablefunc ]]();
        }
    }
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1af2
// Size: 0x101
function function_4fd4273c8a15ac00(equipmentref) {
    var_f79f311c1ed5a958 = "";
    switch (equipmentref) {
    case #"hash_8c7819f0a3fbd1e0": 
        var_f79f311c1ed5a958 = "brloot_offhand_frag";
        break;
    case #"hash_f0907f858c134cb4": 
        var_f79f311c1ed5a958 = "brloot_offhand_semtex";
        break;
    case #"hash_142a787e36d7d7ce": 
        var_f79f311c1ed5a958 = "brloot_offhand_molotov";
        break;
    case #"hash_2354208d9af64220": 
        var_f79f311c1ed5a958 = "brloot_offhand_claymore";
        break;
    case #"hash_9ba0a6ff6081954e": 
        var_f79f311c1ed5a958 = "brloot_offhand_throwingknife";
        break;
    case #"hash_acc752b9cde2ff4f": 
        var_f79f311c1ed5a958 = "brloot_offhand_throwingknife_fire";
        break;
    case #"hash_184d8c620fb78060": 
        var_f79f311c1ed5a958 = "brloot_offhand_shockstick";
        break;
    case #"hash_4320d77f90725183": 
        var_f79f311c1ed5a958 = "brloot_offhand_c4";
        break;
    case #"hash_de4641ddbc44a7ba": 
        var_f79f311c1ed5a958 = "brloot_offhand_thermite";
        break;
    case #"hash_3995658e01f4fac1": 
        var_f79f311c1ed5a958 = "brloot_offhand_atmine";
        break;
    }
    return var_f79f311c1ed5a958;
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bfc
// Size: 0x94
function _toggletabletallows(var_da3010af8f6be463) {
    if (isalive(self)) {
        if (var_da3010af8f6be463) {
            val::set("tablet", "allow_movement", 0);
            val::set("tablet", "allow_jump", 0);
            val::set("tablet", "usability", 0);
            val::set("tablet", "melee", 0);
            val::set("tablet", "offhand_weapons", 0);
            val::set("tablet", "freezecontrols_allowlook", 1);
            return;
        }
        val::reset_all("tablet");
    }
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c98
// Size: 0x29
function _cleanuptabletallows() {
    level endon("game_ended");
    self endon("disconnect");
    waittill_any_3("death", "tabletPutAway");
    _toggletabletallows(0);
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc9
// Size: 0x3d
function _cancelputawayonuseend(streakinfo) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    streakinfo endon("deploy_weapon_switch_ended");
    while (true) {
        if (!self usebuttonpressed()) {
            break;
        }
        waitframe();
    }
    self notify("cancel_all_killstreak_deployments");
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0e
// Size: 0xa4
function function_7c70dc615da72c51() {
    if (!isdefined(self.equipment)) {
        return;
    }
    var_3d6404612a600581 = [];
    foreach (equipment in self.equipment) {
        var_2eb625d9eaaa9671 = spawnstruct();
        var_2eb625d9eaaa9671.equipment = equipment;
        var_2eb625d9eaaa9671.count = namespace_4fb9dddfb8c1a67a::getequipmentammo(equipment);
        var_3d6404612a600581[slot] = var_2eb625d9eaaa9671;
    }
    self.var_911ca765f697742a = var_3d6404612a600581;
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dba
// Size: 0x99
function function_2dd3214261e60026() {
    if (isdefined(self.var_911ca765f697742a)) {
        namespace_4fb9dddfb8c1a67a::clearallequipment();
        foreach (data in self.var_911ca765f697742a) {
            namespace_4fb9dddfb8c1a67a::giveequipment(data.equipment, slot);
            namespace_4fb9dddfb8c1a67a::setequipmentammo(data.equipment, data.count);
        }
        self.var_911ca765f697742a = undefined;
    }
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5b
// Size: 0x59
function function_a6c819e1c09a2472() {
    foreach (equipment in self.equipment) {
        if (function_6cb0b5230400c66(equipment)) {
            return false;
        }
    }
    return true;
}

// Namespace equipment / namespace_47366e00aa4211f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ebd
// Size: 0x25
function function_6cb0b5230400c66(equipment_name) {
    return namespace_4fb9dddfb8c1a67a::hasequipment(equipment_name) && namespace_4fb9dddfb8c1a67a::getequipmentammo(equipment_name) < namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(equipment_name);
}

