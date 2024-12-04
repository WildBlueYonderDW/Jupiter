#using script_1db8d0e02a99c5e2;
#using script_354c862768cfe202;
#using script_74502a9e0ef1f19c;
#using script_7ef95bba57dc4b82;
#using scripts\common\utility;
#using scripts\cp\cp_deployablebox;
#using scripts\cp\cp_player_battlechatter;
#using scripts\cp\utility;
#using scripts\cp\utility\player;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\vehicles\vehicle_mines;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace namespace_56cceecd6f498a6c;

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ea
// Size: 0x76
function at_mine_init() {
    while (!isdefined(level.vehicle) || !isdefined(level.vehicle.minetriggerdata)) {
        waitframe();
    }
    var_f16af5a8c61c30ee = scripts\cp_mp\vehicles\vehicle_mines::vehicle_mines_getleveldataformine("equip_at_mine", 1);
    var_f16af5a8c61c30ee.radius = 100;
    var_f16af5a8c61c30ee.triggercallback = &at_mine_vehicle_trigger;
    /#
        setdevdvarifuninitialized(@"hash_e67a08119163320a", 0);
    #/
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x468
// Size: 0x83
function at_mine_use(grenade) {
    self endon("death");
    self endon("disconnect");
    grenade endon("death");
    grenade.grenade_owner_name = self.name;
    thread monitordisownedequipment(self, grenade);
    grenade thread at_mine_watch_game_end();
    grenade setscriptablepartstate("visibility", "show", 0);
    grenade waittill("missile_stuck", stuckto);
    if (isdefined(stuckto)) {
        grenade linkto(stuckto);
    }
    thread at_mine_plant(grenade);
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f3
// Size: 0x1af
function at_mine_plant(grenade) {
    grenade endon("mine_destroyed");
    grenade endon("death");
    if (isplayer(self)) {
        self endon("disconnect");
    }
    if (isplayer(self)) {
        level thread scripts\cp\cp_player_battlechatter::trysaylocalsound(self, #"hash_98bd43c783a97c73");
        grenade setotherent(self);
        grenade setentityowner(self);
    }
    grenade missilethermal();
    grenade missileoutline();
    grenade setnodeploy(1);
    grenade setscriptablepartstate("plant", "active", 0);
    grenade enableplayermarks("equipment");
    if (isplayer(self)) {
        self setscriptablepartstate("equipATMineFXView", "plant", 0);
        onlethalequipmentplanted(grenade, "equip_at_mine", 1);
        thread monitordisownedequipment(self, grenade);
    } else {
        level thread add_to_mine_list(grenade);
    }
    pickup_str = spawnstruct();
    pickup_str.scriptablename = "brloot_offhand_atmine";
    pickup_str.equipname = level.br_pickups.br_equipname[pickup_str.scriptablename];
    pickup_str.maxcount = grenade.owner namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(pickup_str.equipname);
    pickup_str.count = 1;
    pickup_str.origin = grenade.origin;
    grenade thread makeexplosiveusabletag("tag_use", 1, undefined, pickup_str);
    grenade thread minedamagemonitor();
    grenade thread at_mine_watch_detonate();
    grenade thread at_mine_watch_emp();
    grenade thread remotedefusesetup();
    grenade thread remotedetonatethink();
    wait 1;
    grenade thread at_mine_watch_trigger();
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6aa
// Size: 0x5f
function at_mine_explode_from_player_trigger(owner) {
    thread at_mine_delete(1);
    if (isdefined(owner)) {
        self setentityowner(owner);
        self clearscriptabledamageowner();
    }
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("trigger", "neutral", 0);
    self setscriptablepartstate("explode", "fromPlayer", 0);
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x711
// Size: 0x79
function at_mine_explode_from_vehicle_trigger(ent) {
    if (isdefined(ent)) {
        thread at_mine_damage_manually(self.owner, ent);
    }
    thread at_mine_delete(1);
    self setentityowner(self.owner);
    self clearscriptabledamageowner();
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("launch", "neutral", 0);
    self setscriptablepartstate("explode", "fromVehicle", 0);
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x792
// Size: 0x5a
function at_mine_explode_from_notify(attacker) {
    thread at_mine_delete(1);
    self setentityowner(attacker);
    self clearscriptabledamageowner();
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("launch", "neutral", 0);
    self setscriptablepartstate("explode", "fromDamage", 0);
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7f4
// Size: 0x4b
function at_mine_destroy(attacker) {
    thread at_mine_delete(1);
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("launch", "neutral", 0);
    self setscriptablepartstate("destroy", "active", 0);
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x847
// Size: 0xf6
function at_mine_delete(var_cbf7be4f62a0ddb2) {
    self notify("death");
    level.mines[self getentitynumber()] = undefined;
    self setcandamage(0);
    makeexplosiveunusuabletag();
    self.exploding = 1;
    owner = self.owner;
    if (isdefined(self.owner) && isdefined(owner.plantedlethalequip)) {
        owner.plantedlethalequip = array_remove(owner.plantedlethalequip, self);
    }
    if (isdefined(self.dangericonent)) {
        self.dangericonent delete();
    }
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait var_cbf7be4f62a0ddb2;
    }
    level notify("grenade_exploded_during_stealth", self.origin, "at_mine_mp", self.grenade_owner_name);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x945
// Size: 0x5e
function at_mine_create_player_trigger() {
    trigger = spawn("trigger_rotatable_radius", self.origin, 0, 100, 50);
    trigger.angles = self.angles;
    trigger enablelinkto();
    trigger linkto(self);
    trigger hide();
    trigger.mine = self;
    return trigger;
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9ac
// Size: 0xe6
function at_mine_watch_player_trigger(trigger) {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    self.owner endon("disconnect");
    contents = physics_createcontents(["physicscontents_glass", "physicscontents_water", "physicscontents_item", "physicscontents_vehicle", "physicscontents_missileclip"]);
    while (true) {
        trigger waittill("trigger", ent);
        if (!isdefined(ent)) {
            continue;
        }
        if (!isplayer(ent) && !isagent(ent)) {
            continue;
        }
        if (isdefined(ent.vehicle)) {
            continue;
        }
        if (!ent scripts\cp_mp\utility\player_utility::_isalive()) {
            continue;
        }
        if (!istrue(scripts\cp_mp\utility\player_utility::playersareenemies(self.owner, ent))) {
            continue;
        }
        thread at_mine_player_trigger(ent);
    }
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa9a
// Size: 0xfa
function at_mine_player_trigger(ent) {
    self endon("mine_destroyed");
    self endon("death");
    self.owner endon("disconnect");
    self notify("mine_triggered");
    self.triggeredbyplayer = 1;
    makeexplosiveunusuabletag();
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("trigger", "active", 0);
    dangericonent = _launchgrenade("at_mine_ap_mp", self.origin, (0, 0, 0), 100, 1);
    dangericonent linkto(self);
    thread at_mine_cleanup_danger_icon_ent(dangericonent);
    dangericonent.weapon_object = makeweapon("at_mine_ap_mp");
    self.dangericonent = dangericonent;
    graceperiod = 0.1;
    if (isplayer(ent)) {
        graceperiod += 0.5;
    }
    explosivetrigger(ent, graceperiod);
    thread at_mine_watch_flight();
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb9c
// Size: 0x108
function at_mine_watch_trigger() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    while (true) {
        self waittill("trigger_grenade", entarr);
        assert(isdefined(entarr));
        if (istrue(self.isdisabled)) {
            continue;
        }
        foreach (ent in entarr) {
            if (ent.classname == "script_vehicle") {
                if (ent scripts\cp_mp\vehicles\vehicle_mines::vehicle_mines_isfriendlytomine(self)) {
                    continue;
                }
                if (!scripts\cp_mp\vehicles\vehicle_mines::vehicle_mines_shouldvehicletriggermine(ent, self)) {
                    continue;
                }
                scripts\cp_mp\vehicles\vehicle_mines::vehicle_mines_minetrigger(ent, self);
                break;
            }
            if (isagent(ent) || isplayer(ent)) {
                if (isdefined(ent.vehicle)) {
                    continue;
                }
                if (!scripts\cp\utility\player::isreallyalive(ent)) {
                    continue;
                }
                thread at_mine_player_trigger(ent);
                break;
            }
        }
    }
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcac
// Size: 0x481
function at_mine_watch_vehicle_trigger() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    self.owner endon("disconnect");
    var_eb84e55f9641a972 = [(0, 0, 0), (60, 0, 0), (-60, 0, 0)];
    var_530ea3b256eb4800 = 75;
    var_9aa2b3c8a147d8e = var_530ea3b256eb4800 * var_530ea3b256eb4800;
    var_2e9381e1a66202ee = 30;
    var_c4cf8191f6bab561 = [(0, 0, 0), (22, 0, 0), (-22, 0, 0)];
    var_fa65c6b8ad0e1249 = 96;
    var_687d10fcba24910d = var_fa65c6b8ad0e1249 * var_fa65c6b8ad0e1249;
    var_9787897a564d9409 = 15;
    while (true) {
        var_dddc24ba34981c53 = getactivebradleys();
        if (isdefined(var_dddc24ba34981c53)) {
            foreach (bradley in var_dddc24ba34981c53) {
                if (!isdefined(bradley)) {
                    continue;
                }
                if (level.teambased) {
                    if (bradley.team == self.owner.team) {
                        continue;
                    }
                } else if (isdefined(bradley.owner) && bradley.owner == self.owner) {
                    continue;
                }
                axes = anglestoaxis(bradley.angles);
                foreach (offset in var_eb84e55f9641a972) {
                    borigin = bradley.origin;
                    borigin += axes["right"] * offset[0];
                    borigin += axes["forward"] * offset[1];
                    borigin += axes["up"] * offset[2];
                    btwn = self.origin - borigin;
                    var_4504cce2ad14f2b2 = vectordot(btwn, axes["up"]);
                    if (abs(var_4504cce2ad14f2b2) > var_2e9381e1a66202ee) {
                        continue;
                    }
                    var_6602b5e32bb277d4 = btwn - axes["up"] * var_4504cce2ad14f2b2;
                    if (lengthsquared(var_6602b5e32bb277d4) > var_9aa2b3c8a147d8e) {
                        continue;
                    }
                    level thread at_mine_vehicle_trigger(bradley, self);
                    return;
                }
            }
        }
        remotetanks = level.assaultdrones;
        if (isdefined(remotetanks)) {
            foreach (remoteTank in remotetanks) {
                if (!isdefined(remoteTank)) {
                    continue;
                }
                if (!isdefined(remoteTank.streakname) || remoteTank.streakname != "pac_sentry") {
                    continue;
                }
                if (isdefined(remoteTank.owner) && !istrue(scripts\cp_mp\utility\player_utility::playersareenemies(remoteTank.owner, self.owner))) {
                    continue;
                }
                axes = anglestoaxis(remoteTank.angles);
                foreach (offset in var_c4cf8191f6bab561) {
                    var_43c0a159a5f31309 = remoteTank.origin;
                    var_43c0a159a5f31309 += axes["right"] * offset[0];
                    var_43c0a159a5f31309 += axes["forward"] * offset[1];
                    var_43c0a159a5f31309 += axes["up"] * offset[2];
                    btwn = self.origin - var_43c0a159a5f31309;
                    var_4504cce2ad14f2b2 = vectordot(btwn, axes["up"]);
                    if (abs(var_4504cce2ad14f2b2) > var_9787897a564d9409) {
                        continue;
                    }
                    var_6602b5e32bb277d4 = btwn - axes["up"] * var_4504cce2ad14f2b2;
                    if (lengthsquared(var_6602b5e32bb277d4) > var_687d10fcba24910d) {
                        continue;
                    }
                    level thread at_mine_vehicle_trigger(remoteTank, self);
                    return;
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1135
// Size: 0xe5
function getactivebradleys() {
    vehicles = [];
    foreach (vehicle_array in level.vehicle.instances) {
        foreach (vehicle in vehicle_array) {
            vehicles[vehicles.size] = vehicle;
        }
    }
    if (isdefined(level.bradley)) {
        vehicles = array_combine(vehicles, level.bradley.activevehicles["total"]);
    }
    if (vehicles.size == 0) {
        return undefined;
    }
    return vehicles;
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1223
// Size: 0x76
function at_mine_vehicle_trigger(vehicle, mine) {
    mine endon("mine_destroyed");
    mine endon("death");
    mine.owner endon("disconnect");
    mine notify("mine_triggered");
    mine makeexplosiveunusuabletag();
    mine setscriptablepartstate("arm", "neutral", 0);
    mine setscriptablepartstate("trigger", "active", 0);
    wait 0.2;
    mine thread at_mine_explode_from_vehicle_trigger(vehicle);
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12a1
// Size: 0x5b
function at_mine_watch_flight_mover(flighttime) {
    self endon("death");
    self.grenade waittill_any_timeout_2(flighttime, "death", "mine_destroyed");
    if (isdefined(self.grenade)) {
        self moveto(self.origin, 0.05, 0, 0);
    }
    wait 2;
    self delete();
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1304
// Size: 0x243
function at_mine_watch_flight() {
    self endon("mine_destroyed");
    self endon("death");
    flighttime = 0.7;
    if (flighttime > 0) {
        flightdir = (0, 0, 1);
        flightdest = self.origin + flightdir * 64;
        contents = physics_createcontents(["physicscontents_glass", "physicscontents_water", "physicscontents_item", "physicscontents_vehicle", "physicscontents_missileclip"]);
        caststart = self.origin;
        castend = flightdest;
        castresults = physics_raycast(caststart, castend, contents, self, 0, "physicsquery_closest", 1);
        if (isdefined(castresults) && castresults.size > 0) {
            castdist = vectordot(castresults[0]["position"] - caststart, flightdir);
            castdist = max(0, castdist - 1);
            flighttime = 0;
            flightdest = self.origin;
            if (castdist > 0) {
                flighttime = castdist / 64 * 0.7;
                flightdest = self.origin + flightdir * castdist;
            }
        }
        if (flighttime > 0) {
            flighttimeremaining = flighttime;
            flightdeceltime = flighttimeremaining * 0.93;
            flighttimeremaining -= flightdeceltime;
            var_7162ec9dd06a7bb8 = 0;
            if (flighttimeremaining > 0) {
                var_7162ec9dd06a7bb8 = flighttimeremaining * 0;
            }
            mover = spawn("script_model", self.origin);
            mover.angles = vectortoangles(anglestoforward(self.angles) * (1, 1, 0));
            mover setmodel("tag_origin");
            self.mover = mover;
            mover.grenade = self;
            self linkto(mover, "tag_origin", (0, 0, 0), (0, 0, 0));
            mover moveto(flightdest, flighttime, var_7162ec9dd06a7bb8, flightdeceltime);
            mover thread at_mine_watch_flight_mover(flighttime);
            thread at_mine_watch_flight_effects(flighttime);
            wait flighttime;
            thread at_mine_explode_from_player_trigger();
            return;
        }
    }
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x154f
// Size: 0x2b
function at_mine_watch_flight_effects(flighttime) {
    self endon("mine_destroyed");
    self endon("death");
    self setscriptablepartstate("launch", "active", 0);
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1582
// Size: 0x8a
function at_mine_watch_emp() {
    self endon("mine_destroyed");
    self endon("death");
    self.owner endon("disconnect");
    while (true) {
        self waittill("emp_applied", data);
        attacker = data.attacker;
        if (istrue(scripts\cp_mp\utility\player_utility::playersareenemies(self.owner, attacker))) {
            attacker notify("destroyed_equipment");
            if (isplayer(attacker)) {
                attacker namespace_3d3d5211c3029f82::updatedamagefeedback("standard");
            }
            thread at_mine_destroy();
        }
    }
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1614
// Size: 0x59
function at_mine_watch_detonate() {
    self endon("death");
    self.owner endon("disconnect");
    owner = self.owner;
    self waittill("detonateExplosive", attacker);
    if (isdefined(attacker)) {
        thread at_mine_explode_from_notify(attacker);
        return;
    }
    thread at_mine_explode_from_notify(owner);
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1675
// Size: 0x2a
function at_mine_watch_game_end() {
    self endon("mine_destroyed");
    self endon("death");
    level waittill_any_2("game_ended", "bro_shot_start");
    thread at_mine_destroy();
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16a7
// Size: 0x97
function at_mine_damage_manually(attacker, var_1de3e0ea1c8b2aba) {
    var_1de3e0ea1c8b2aba endon("death");
    weapon = makeweapon("at_mine_mp");
    waitframe();
    var_fbff02c9c978437f = 200;
    if (isdefined(var_1de3e0ea1c8b2aba.mine_damage_override)) {
        var_fbff02c9c978437f = var_1de3e0ea1c8b2aba.mine_damage_override;
    }
    if (isdefined(attacker) && isdefined(self)) {
        var_1de3e0ea1c8b2aba dodamage(var_fbff02c9c978437f, self.origin, attacker, self, "MOD_EXPLOSIVE", weapon);
        var_1de3e0ea1c8b2aba notify("damage", var_fbff02c9c978437f, self.origin, attacker, self, "MOD_EXPLOSIVE", weapon);
    }
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1746
// Size: 0x176
function at_mine_modified_damage(victim, inflictor, objweapon, meansofdeath, damage) {
    if (!isdefined(inflictor)) {
        return damage;
    }
    if (meansofdeath != "MOD_EXPLOSIVE") {
        return damage;
    }
    if (!isdefined(objweapon)) {
        return damage;
    }
    if (isnullweapon(objweapon)) {
        return damage;
    }
    if (objweapon.basename != "at_mine_mp" && objweapon.basename != "at_mine_ap_mp") {
        return damage;
    }
    up = anglestoup(inflictor.angles);
    btwn = inflictor.origin - self geteye();
    var_d14eec85ac39c1cb = vectordot(btwn, up);
    if (var_d14eec85ac39c1cb > 60) {
        return 0;
    }
    btwn = self.origin - inflictor.origin;
    var_f4ef78de9cf3220a = vectordot(btwn, up);
    if (var_f4ef78de9cf3220a > 60) {
        return 0;
    }
    if (objweapon.basename == "at_mine_ap_mp" || istrue(inflictor.triggeredbyplayer)) {
        if (var_d14eec85ac39c1cb >= 0) {
            stance = victim getstance();
            if (stance == "prone") {
                damage = int(min(damage, 35));
            } else if (stance == "crouch") {
                damage = int(min(damage, 55));
            }
        }
    }
    return damage;
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18c5
// Size: 0x21
function at_mine_cleanup_danger_icon_ent(dangericonent) {
    dangericonent endon("death");
    self waittill("death");
    dangericonent delete();
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18ee
// Size: 0x43
function remotedetonatethink() {
    level endon("game_ended");
    self.owner endon("disconnect");
    self endon("death");
    while (true) {
        self waittill("remote_detonate", player);
        thread at_mine_explode_from_player_trigger(player);
    }
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1939
// Size: 0x14d
function remotedefusesetup() {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    hintstring = %PERKS/REMOTE_DEFUSE_HINT;
    var_e213cdc03c01a000 = 0;
    self.useobj = createhintobject(self.origin + anglestoup(self.angles) * 7, "HINT_BUTTON", undefined, hintstring, var_e213cdc03c01a000, undefined, "show", 250, 160, 200, 160);
    self.useobj.owner = self.owner;
    self.useobj.team = self.team;
    self.useobj linkto(self);
    foreach (player in level.players) {
        self.useobj disableplayeruse(player);
    }
    thread defusethink();
    thread defuseusemonitoring();
    for (;;) {
        self waittill("defused", player);
        if (isplayer(player)) {
            thread at_mine_explode_from_player_trigger(player);
        }
    }
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8e
// Size: 0xc1
function defuseusemonitoring() {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    while (true) {
        wait 0.1;
        foreach (player in level.players) {
            if (player.team == self.team || !player _hasperk("specialty_remote_defuse")) {
                self.useobj disableplayeruse(player);
                continue;
            }
            self.useobj enableplayeruse(player);
        }
    }
}

// Namespace namespace_56cceecd6f498a6c / scripts\cp\equipment\cp_at_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b57
// Size: 0xef
function defusethink() {
    self endon("restarting_physics");
    usetrigger = self.useobj;
    useent = undefined;
    if (istrue(level.gameended) && !isdefined(usetrigger)) {
        return;
    }
    while (isdefined(self)) {
        usetrigger waittill("trigger", player);
        if (isdefined(self.owner) && player == self.owner) {
            continue;
        }
        player.iscapturingcrate = 1;
        useent = createuseent();
        useent.id = "breach_defuse";
        result = useent useholdthink(player, getdvarfloat(@"hash_923eecb6e8de167e"));
        if (!isdefined(player)) {
            return;
        }
        if (!result) {
            player.iscapturingcrate = 0;
            continue;
        }
        player.iscapturingcrate = 0;
        self notify("defused", player);
    }
}

