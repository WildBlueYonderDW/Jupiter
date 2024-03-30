// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\perk.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\vehicles\vehicle_mines.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\movers.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_736dec95a49487a6;
#using scripts\common\elevators.gsc;
#using scripts\mp\equipment_interact.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\equipment\claymore.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\utility\points.gsc;

#namespace at_mine;

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42f
// Size: 0x4d
function at_mine_init() {
    var_f16af5a8c61c30ee = scripts/cp_mp/vehicles/vehicle_mines::vehicle_mines_getleveldataformine("equip_at_mine", 1);
    var_f16af5a8c61c30ee.radius = 100;
    var_f16af5a8c61c30ee.triggercallback = &at_mine_vehicle_trigger;
    /#
        setdevdvarifuninitialized(@"hash_e67a08119163320a", 0);
    #/
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x483
// Size: 0x260
function at_mine_use(grenade) {
    self endon("disconnect");
    grenade endon("death");
    if (_hasperk("specialty_rugged_eqp")) {
        grenade.hasruggedeqp = 1;
    }
    grenade scripts/cp_mp/ent_manager::registerspawn(2, &deletemine);
    thread scripts/mp/weapons::monitordisownedgrenade(self, grenade);
    grenade thread at_mine_watch_game_end();
    plantdata = spawnstruct();
    plantdata.throwspeedforward = 100;
    plantdata.throwspeedup = -50;
    plantdata.castdivisions = 3;
    plantdata.castmaxtime = 0.5;
    plantdata.castdetail = 1;
    plantdata.plantmaxtime = 0.5;
    plantdata.plantmaxroll = 15;
    plantdata.plantmindistbeloweye = 12;
    plantdata.plantmaxdistbelowownerfeet = 20;
    plantdata.plantmindisteyetofeet = 45;
    plantdata.plantnormalcos = 0.342;
    grenade setscriptablepartstate("visibility", "show", 0);
    data = spawnstruct();
    data.endonstring = "mine_destroyed";
    data.skipdeath = 1;
    grenade thread scripts/mp/movers::handle_moving_platform_touch(data);
    stuckto, hitent, surfacetype, velocity, position, normal = grenade waittill("missile_stuck");
    if (isdefined(level.var_ca4e08767cbdae12)) {
        canplant = grenade [[ level.var_ca4e08767cbdae12 ]]();
        if (!canplant) {
            scripts/mp/hud_message::showerrormessage("EQUIPMENT/PLANT_FAILED");
            scripts/mp/equipment::incrementequipmentslotammo("primary");
            grenade delete();
            return;
        }
    }
    if (isdefined(stuckto)) {
        if (isent(stuckto) && is_train_ent(stuckto)) {
            grenade.origin = grenade.origin + (0, 0, 1.6);
            data.var_49cb2c45d3230ed8 = 1;
            grenade function_7e73001e97fe87b9(1);
        }
        grenade linkto(stuckto);
    }
    thread at_mine_plant(grenade, surfacetype);
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ea
// Size: 0xa0
function is_train_ent(hitent) {
    if (isdefined(level.wztrain_info)) {
        foreach (ent in level.wztrain_info.train_array) {
            if (ent == hitent) {
                return true;
            }
            if (isdefined(ent.linked_model) && ent.linked_model == hitent) {
                return true;
            }
        }
    }
    return false;
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x792
// Size: 0x6f
function at_mine_update_danger_zone() {
    if (istrue(level.dangerzoneskipequipment)) {
        return;
    }
    if (isdefined(self.dangerzone)) {
        scripts/mp/spawnlogic::removespawndangerzone(self.dangerzone);
    }
    self.dangerzone = scripts/mp/spawnlogic::addspawndangerzone(self.origin, scripts/mp/spawnlogic::getdefaultminedangerzoneradiussize(), 72, self.owner.team, undefined, self.owner, 0, self, 1);
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x808
// Size: 0x36
function function_427845ab37c184cd() {
    self endon("mine_destroyed");
    self endon("death");
    self waittill("missile_water_impact");
    self setscriptablepartstate("floats", "show", 0);
    self.hitwater = 1;
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x845
// Size: 0x2ac
function at_mine_plant(grenade, surfacetype) {
    grenade endon("mine_destroyed");
    grenade endon("death");
    grenade setotherent(self);
    grenade setentityowner(self);
    grenade missilethermal();
    if (!istrue(grenade.var_40e5b4307cb6229c)) {
        grenade missileoutline();
    }
    grenade setnodeploy(1);
    grenade setscriptablepartstate("plant", "active", 0);
    self setscriptablepartstate("equipATMineFXView", "plant", 0);
    onequipmentplanted(grenade, "equip_at_mine", &at_mine_delete, isagent(self));
    thread monitordisownedequipment(self, grenade);
    grenade scripts/mp/sentientpoolmanager::registersentient("Lethal_Static", grenade.owner, 1);
    grenade thread minedamagemonitor();
    grenade thread at_mine_watch_detonate();
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&at_mine_empapplied);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_97f28317850da77d);
    }
    grenade scripts/cp_mp/emp_debuff::set_apply_emp_callback(&at_mine_empapplied);
    grenade namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_83d4163604fc28e3);
    grenade function_49197cd063a740ea(&at_mine_destroy);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread scripts/common/elevators::function_5c07037726ae5001(grenade);
        }
    }
    grenade at_mine_update_danger_zone();
    armtime = 1.5;
    if (isdefined(grenade.armtime)) {
        armtime = grenade.armtime;
    }
    wait(armtime / 2);
    if (istrue(grenade.touchedmovingplatform)) {
        grenade thread at_mine_movingplatform_update();
    }
    wait(armtime / 2);
    grenade thread scripts/mp/equipment_interact::remoteinteractsetup(&at_mine_explode_from_player_trigger, 1, 1);
    grenade setscriptablepartstate("arm", "active", 0);
    grenade thread at_mine_watch_trigger();
    if (!(getdvar(@"hash_e65e9a96eb2ff62b", "") == "mines")) {
        grenade thread makeexplosiveusabletag("tag_use", 1);
        thread scripts/mp/weapons::outlineequipmentforowner(grenade);
    }
    iconoffset = 2;
    grenade.headiconid = grenade scripts/cp_mp/entityheadicons::setheadicon_factionimage(0, iconoffset, undefined, undefined, undefined, 0.1, 1);
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf8
// Size: 0x7d
function at_mine_explode_from_player_trigger(owner) {
    thread at_mine_delete(5);
    if (!isdefined(owner)) {
        owner = self.owner;
    }
    self setentityowner(owner);
    self clearscriptabledamageowner();
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("trigger", "neutral", 0);
    self setscriptablepartstate("explode", "fromPlayer", 0);
    self setscriptablepartstate("hacked", "neutral", 0);
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7c
// Size: 0x80
function at_mine_explode_from_vehicle_trigger(vehicle) {
    level endon("game_ended");
    thread at_mine_explode_from_vehicle_trigger_internal();
    if (isdefined(vehicle)) {
        vehicle dodamage(200, self.origin, self.owner, self, "MOD_EXPLOSIVE", makeweapon("at_mine_mp"));
        ignoredamageid = vehicle scripts/mp/utility/damage::non_player_add_ignore_damage_signature(self.owner, makeweapon("at_mine_mp"), self, "MOD_EXPLOSIVE");
        waitframe();
        vehicle scripts/mp/utility/damage::non_player_remove_ignore_damage_signature(ignoredamageid);
    }
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc03
// Size: 0x5a
function at_mine_explode_from_vehicle_trigger_internal() {
    thread at_mine_delete(5);
    self setentityowner(self.owner);
    self clearscriptabledamageowner();
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("launch", "neutral", 0);
    self setscriptablepartstate("explode", "fromVehicle", 0);
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc64
// Size: 0x5b
function at_mine_explode_from_notify(attacker) {
    thread at_mine_delete(5);
    self setentityowner(attacker);
    self clearscriptabledamageowner();
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("launch", "neutral", 0);
    self setscriptablepartstate("explode", "fromDamage", 0);
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc6
// Size: 0x53
function at_mine_destroy(attacker) {
    self endon("death");
    thread at_mine_delete(5);
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("launch", "neutral", 0);
    self setscriptablepartstate("destroy", "active", 0);
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd20
// Size: 0x1a1
function at_mine_delete(var_cbf7be4f62a0ddb2) {
    if (istrue(self.isdestroyed) || !isdefined(self)) {
        return;
    }
    self.isdestroyed = 1;
    self notify("death");
    level.mines[self getentitynumber()] = undefined;
    self setscriptablepartstate("hack_usable", "off");
    self setcandamage(0);
    makeexplosiveunusuabletag();
    scripts/cp_mp/entityheadicons::setheadicon_deleteicon(self.headiconid);
    self.headiconid = undefined;
    self.exploding = 1;
    if (isdefined(self.dangerzone)) {
        scripts/mp/spawnlogic::removespawndangerzone(self.dangerzone);
        self.dangerzone = undefined;
    }
    if (isdefined(self.owner)) {
        self.owner removeequip(self);
    }
    if (isdefined(self.dangericonent)) {
        self.dangericonent delete();
    }
    linkedchildren = self getlinkedchildren();
    if (isdefined(linkedchildren)) {
        foreach (child in linkedchildren) {
            if (isdefined(child) && isdefined(child.equipmentref) && child.equipmentref == "equip_claymore" && !istrue(child.exploding)) {
                child thread scripts/mp/equipment/claymore::claymore_destroy();
            }
        }
    }
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait(var_cbf7be4f62a0ddb2);
    }
    scripts/cp_mp/ent_manager::deregisterspawn();
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec8
// Size: 0x75
function at_mine_movingplatform_update() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    self.attachedvelocity = (0, 0, 0);
    update_interval = 0.2;
    while (true) {
        old_origin = self.origin;
        wait(update_interval);
        self.attachedvelocity = 1 / update_interval * (self.origin - old_origin);
    }
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf44
// Size: 0x38
function is_at_mine_moving(mine) {
    return isdefined(mine) && isdefined(mine.attachedvelocity) && length2dsquared(mine.attachedvelocity) > 0.01;
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf84
// Size: 0x131
function at_mine_watch_trigger() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    /#
        thread function_d9f2aec6c4f8ed31();
    #/
    while (true) {
        entarr = self waittill("trigger_grenade");
        /#
            assert(isdefined(entarr));
        #/
        if (istrue(self.isdisabled)) {
            continue;
        }
        foreach (ent in entarr) {
            if (!isdefined(ent) || !isdefined(ent.classname)) {
                continue;
            }
            if (ent.classname == "script_vehicle") {
                if (ent scripts/cp_mp/vehicles/vehicle_mines::vehicle_mines_isfriendlytomine(self)) {
                    continue;
                }
                if (!scripts/cp_mp/vehicles/vehicle_mines::vehicle_mines_shouldvehicletriggermine(ent, self)) {
                    continue;
                }
                scripts/cp_mp/vehicles/vehicle_mines::vehicle_mines_minetrigger(ent, self);
                break;
            }
            if (isagent(ent) || isplayer(ent)) {
                if (isdefined(ent.vehicle)) {
                    continue;
                }
                if (!isreallyalive(ent)) {
                    continue;
                }
                thread at_mine_player_trigger(ent);
                break;
            }
        }
    }
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10bc
// Size: 0x95
function function_d9f2aec6c4f8ed31() {
    /#
        self endon("game_ended");
        self endon("physicscontents_water");
        self endon("prone");
        mineowner = self.owner;
        if (!isplayer(mineowner)) {
            return;
        }
        mineowner notifyonplayercommand("<unknown string>", "<unknown string>");
        mineowner notifyonplayercommand("<unknown string>", "<unknown string>");
        while (true) {
            mineowner waittill("<unknown string>");
            debuglaunch = getdvarint(@"hash_e67a08119163320a", 0);
            if (!debuglaunch) {
                continue;
            }
            thread at_mine_player_trigger(mineowner);
        }
    #/
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1158
// Size: 0x7b
function at_mine_player_trigger(ent) {
    self endon("mine_destroyed");
    self endon("death");
    self notify("mine_triggered");
    self.triggeredbyplayer = 1;
    makeexplosiveunusuabletag();
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("trigger", "active", 0);
    function_9b1b9f121a84a4a1("at_mine_ap_mp", 100);
    explosivetrigger(ent, 0.1);
    thread at_mine_watch_flight();
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11da
// Size: 0x6c
function function_9b1b9f121a84a4a1(var_5db09cf670b9ec64, fusetime) {
    dangericonent = _launchgrenade(var_5db09cf670b9ec64, self.origin, (0, 0, 0), fusetime, 1);
    dangericonent linkto(self);
    thread at_mine_cleanup_danger_icon_ent(dangericonent);
    dangericonent.weapon_object = makeweapon(var_5db09cf670b9ec64);
    self.dangericonent = dangericonent;
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124d
// Size: 0x77
function at_mine_vehicle_trigger(vehicle, mine) {
    mine endon("mine_destroyed");
    mine endon("death");
    mine.owner endon("disconnect");
    mine notify("mine_triggered");
    mine makeexplosiveunusuabletag();
    mine setscriptablepartstate("arm", "neutral", 0);
    mine setscriptablepartstate("trigger", "active", 0);
    wait(0.2);
    mine thread at_mine_explode_from_vehicle_trigger(vehicle);
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12cb
// Size: 0x6a
function at_mine_watch_flight_mover(flighttime) {
    self endon("death");
    self.grenade waittill_any_timeout_2(flighttime, "death", "mine_destroyed");
    if (isdefined(self.grenade)) {
        self moveto(self.origin, 0.05, 0, 0);
    }
    while (isdefined(self.grenade)) {
        waitframe();
    }
    self delete();
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133c
// Size: 0xb
function deletemine() {
    at_mine_delete(0);
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x134e
// Size: 0x294
function at_mine_watch_flight() {
    self endon("mine_destroyed");
    self endon("death");
    flighttime = 0.8;
    if (flighttime > 0) {
        flightdir = (0, 0, 1);
        flightdest = self.origin + flightdir * 64;
        contents = physics_createcontents(["physicscontents_glass", "physicscontents_water", "physicscontents_item", "physicscontents_vehicle", "physicscontents_missileclip"]);
        ignorelist = scripts/mp/utility/equipment::get_mine_ignore_list();
        caststart = self.origin;
        castend = flightdest;
        castresults = physics_raycast(caststart, castend, contents, ignorelist, 0, "physicsquery_closest", 1);
        if (isdefined(castresults) && castresults.size > 0) {
            castdist = vectordot(castresults[0]["position"] - caststart, flightdir);
            castdist = max(0, castdist - 1);
            flighttime = 0;
            flightdest = self.origin;
            if (castdist > 0) {
                flighttime = castdist / 64 * 0.8;
                flightdest = self.origin + flightdir * castdist;
            }
        }
        if (is_at_mine_moving(self)) {
            flightdest = flightdest + self.attachedvelocity * flighttime;
        }
        if (flighttime > 0) {
            flighttimeremaining = flighttime;
            flightdeceltime = flighttimeremaining * 0.81;
            if (is_at_mine_moving(self)) {
                flightdeceltime = flightdeceltime * 0.25;
            }
            flighttimeremaining = flighttimeremaining - flightdeceltime;
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
            function_9e0f9db6ce29a5a9();
            childthread scripts/mp/utility/equipment::watch_flight_collision();
            waittill_any_timeout_1(flighttime, "collision_with_platform");
            thread at_mine_explode_from_player_trigger();
            return;
        }
    }
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e9
// Size: 0x35
function function_9e0f9db6ce29a5a9() {
    launchstate = "land";
    if (istrue(self.hitwater)) {
        launchstate = "water";
    }
    self setscriptablepartstate("launch", launchstate, 0);
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1625
// Size: 0x69
function at_mine_empapplied(data) {
    attacker = data.attacker;
    if (istrue(scripts/cp_mp/utility/player_utility::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker scripts/mp/killstreaks/killstreaks::givescoreforequipment(self, undefined, 1);
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback("");
    }
    thread function_416f3f7ada048ff9(attacker);
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1695
// Size: 0x66
function function_83d4163604fc28e3(data) {
    attacker = data.attacker;
    if (istrue(scripts/cp_mp/utility/player_utility::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker scripts/mp/killstreaks/killstreaks::givescoreforequipment(self);
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback("");
    }
    self notify("detonateExplosive", attacker);
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1702
// Size: 0x57
function at_mine_watch_detonate() {
    self endon("death");
    attacker = self waittill("detonateExplosive");
    if (isdefined(attacker)) {
        thread at_mine_explode_from_notify(attacker);
        return;
    }
    if (isdefined(self.owner)) {
        thread at_mine_explode_from_notify(self.owner);
        return;
    }
    thread at_mine_destroy();
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1760
// Size: 0x2b
function at_mine_watch_game_end() {
    self endon("mine_destroyed");
    self endon("death");
    level waittill_any_2("game_ended", "bro_shot_start");
    thread at_mine_destroy();
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1792
// Size: 0x71
function at_mine_damage_vehicle_manually(vehicle) {
    vehicle dodamage(200, self.origin, self.owner, self, "MOD_EXPLOSIVE", makeweapon("at_mine_mp"));
    ignoredamageid = vehicle scripts/mp/utility/damage::non_player_add_ignore_damage_signature(self.owner, makeweapon("at_mine_mp"), self, "MOD_EXPLOSIVE");
    waitframe();
    if (isdefined(vehicle)) {
        vehicle scripts/mp/utility/damage::non_player_remove_ignore_damage_signature(ignoredamageid);
    }
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x180a
// Size: 0x20a
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
            if (isdefined(level.gametype) && level.gametype == "br") {
                proneclamp = 75;
                crouchclamp = 100;
            } else {
                proneclamp = 35;
                crouchclamp = 35;
            }
            stance = victim getstance();
            if (stance == "prone" || self isswimming()) {
                damage = int(min(damage, proneclamp));
            } else if (stance == "crouch" || self issprintsliding()) {
                damage = int(min(damage, crouchclamp));
            }
        }
    }
    if (isdefined(victim) && victim function_e5bf22923d0004bc()) {
        if (damage >= victim.health) {
            damage = victim.health - 1;
        }
    }
    return damage;
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a1c
// Size: 0x22
function at_mine_cleanup_danger_icon_ent(dangericonent) {
    dangericonent endon("death");
    self waittill("death");
    dangericonent delete();
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a45
// Size: 0x80
function at_mine_onownerchanged(oldowner) {
    self setscriptablepartstate("hacked", "active", 0);
    at_mine_update_danger_zone();
    sentientpool = self.sentientpool;
    scripts/mp/sentientpoolmanager::unregistersentient(self.sentientpool, self.sentientpoolindex);
    scripts/mp/sentientpoolmanager::registersentient(sentientpool, self.owner, 1);
    thread monitordisownedequipment(self.owner, self);
    thread outlineequipmentforowner(self);
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1acc
// Size: 0x7b
function function_416f3f7ada048ff9(attacker) {
    self endon("death");
    attacker thread scripts/mp/utility/points::doScoreEvent(#"hash_61a2d32e72064a0f");
    self.isdisabled = 1;
    self setscriptablepartstate("empd", "active", 0);
    if (!istrue(self.owner.ksempd)) {
        wait(6);
        self.isdisabled = 0;
        self setscriptablepartstate("empd", "neutral", 0);
    }
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4e
// Size: 0x28
function function_97f28317850da77d(data) {
    self.isdisabled = 0;
    self setscriptablepartstate("empd", "neutral", 0);
}

// Namespace at_mine / scripts/mp/equipment/at_mine
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7d
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

