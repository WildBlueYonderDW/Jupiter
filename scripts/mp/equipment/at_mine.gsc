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
#using script_5f903436642211af;
#using scripts\mp\equipment_interact.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\equipment\claymore.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\utility\points.gsc;

#namespace at_mine;

// Namespace at_mine/namespace_3953fa5589223b8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42f
// Size: 0x4d
function at_mine_init() {
    var_f16af5a8c61c30ee = namespace_739a1beacdad3457::vehicle_mines_getleveldataformine("equip_at_mine", 1);
    var_f16af5a8c61c30ee.radius = 100;
    var_f16af5a8c61c30ee.triggercallback = &at_mine_vehicle_trigger;
    /#
        setdevdvarifuninitialized(@"hash_e67a08119163320a", 0);
    #/
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x483
// Size: 0x260
function at_mine_use(grenade) {
    self endon("disconnect");
    grenade endon("death");
    if (_hasperk("specialty_rugged_eqp")) {
        grenade.hasruggedeqp = 1;
    }
    grenade namespace_2a9588dfac284b77::registerspawn(2, &deletemine);
    thread namespace_3bbb5a98b932c46f::monitordisownedgrenade(self, grenade);
    grenade thread at_mine_watch_game_end();
    var_f99216cee573ea7e = spawnstruct();
    var_f99216cee573ea7e.throwspeedforward = 100;
    var_f99216cee573ea7e.throwspeedup = -50;
    var_f99216cee573ea7e.castdivisions = 3;
    var_f99216cee573ea7e.castmaxtime = 0.5;
    var_f99216cee573ea7e.castdetail = 1;
    var_f99216cee573ea7e.plantmaxtime = 0.5;
    var_f99216cee573ea7e.plantmaxroll = 15;
    var_f99216cee573ea7e.plantmindistbeloweye = 12;
    var_f99216cee573ea7e.plantmaxdistbelowownerfeet = 20;
    var_f99216cee573ea7e.plantmindisteyetofeet = 45;
    var_f99216cee573ea7e.plantnormalcos = 0.342;
    grenade setscriptablepartstate("visibility", "show", 0);
    data = spawnstruct();
    data.endonstring = "mine_destroyed";
    data.skipdeath = 1;
    grenade thread namespace_d7b023c7eb3949d0::handle_moving_platform_touch(data);
    normal = position = velocity = surfacetype = hitent = stuckto = grenade waittill("missile_stuck");
    if (isdefined(level.var_ca4e08767cbdae12)) {
        var_425925a45729deae = grenade [[ level.var_ca4e08767cbdae12 ]]();
        if (!var_425925a45729deae) {
            namespace_44abc05161e2e2cb::showerrormessage("EQUIPMENT/PLANT_FAILED");
            namespace_1a507865f681850e::incrementequipmentslotammo("primary");
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

// Namespace at_mine/namespace_3953fa5589223b8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ea
// Size: 0xa0
function is_train_ent(hitent) {
    if (isdefined(level.wztrain_info)) {
        foreach (ent in level.wztrain_info.train_array) {
            if (ent == hitent) {
                return 1;
            } else if (isdefined(ent.linked_model) && ent.linked_model == hitent) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x792
// Size: 0x6f
function at_mine_update_danger_zone() {
    if (istrue(level.dangerzoneskipequipment)) {
        return;
    }
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
    }
    self.dangerzone = namespace_b2d5aa2baf2b5701::addspawndangerzone(self.origin, namespace_b2d5aa2baf2b5701::getdefaultminedangerzoneradiussize(), 72, self.owner.team, undefined, self.owner, 0, self, 1);
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x808
// Size: 0x36
function function_427845ab37c184cd() {
    self endon("mine_destroyed");
    self endon("death");
    self waittill("missile_water_impact");
    self setscriptablepartstate("floats", "show", 0);
    self.var_b4331a150334bf61 = 1;
}

// Namespace at_mine/namespace_3953fa5589223b8
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
    grenade namespace_6d9917c3dc05dbe9::registersentient("Lethal_Static", grenade.owner, 1);
    grenade thread minedamagemonitor();
    grenade thread at_mine_watch_detonate();
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&at_mine_empapplied);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_97f28317850da77d);
    }
    grenade namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&at_mine_empapplied);
    grenade namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_83d4163604fc28e3);
    grenade function_49197cd063a740ea(&at_mine_destroy);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread namespace_272931699e2fe8e9::function_5c07037726ae5001(grenade);
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
    grenade thread namespace_43a68cf8c122ab9::remoteinteractsetup(&at_mine_explode_from_player_trigger, 1, 1);
    grenade setscriptablepartstate("arm", "active", 0);
    grenade thread at_mine_watch_trigger();
    if (!(getdvar(@"hash_e65e9a96eb2ff62b", "") == "mines")) {
        grenade thread makeexplosiveusabletag("tag_use", 1);
        thread namespace_3bbb5a98b932c46f::outlineequipmentforowner(grenade);
    }
    var_5ae5e6cd7f0cc727 = 2;
    grenade.headiconid = grenade namespace_7bdde15c3500a23f::setheadicon_factionimage(0, var_5ae5e6cd7f0cc727, undefined, undefined, undefined, 0.1, 1);
}

// Namespace at_mine/namespace_3953fa5589223b8
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

// Namespace at_mine/namespace_3953fa5589223b8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7c
// Size: 0x80
function at_mine_explode_from_vehicle_trigger(vehicle) {
    level endon("game_ended");
    thread at_mine_explode_from_vehicle_trigger_internal();
    if (isdefined(vehicle)) {
        vehicle dodamage(200, self.origin, self.owner, self, "MOD_EXPLOSIVE", makeweapon("at_mine_mp"));
        ignoredamageid = vehicle namespace_a12dc1d0c8a64946::non_player_add_ignore_damage_signature(self.owner, makeweapon("at_mine_mp"), self, "MOD_EXPLOSIVE");
        waitframe();
        vehicle namespace_a12dc1d0c8a64946::non_player_remove_ignore_damage_signature(ignoredamageid);
    }
}

// Namespace at_mine/namespace_3953fa5589223b8
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

// Namespace at_mine/namespace_3953fa5589223b8
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

// Namespace at_mine/namespace_3953fa5589223b8
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

// Namespace at_mine/namespace_3953fa5589223b8
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
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    self.headiconid = undefined;
    self.exploding = 1;
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
        self.dangerzone = undefined;
    }
    if (isdefined(self.owner)) {
        self.owner removeequip(self);
    }
    if (isdefined(self.dangericonent)) {
        self.dangericonent delete();
    }
    var_e478ac91af0e92cb = self getlinkedchildren();
    if (isdefined(var_e478ac91af0e92cb)) {
        foreach (child in var_e478ac91af0e92cb) {
            if (isdefined(child) && isdefined(child.equipmentref) && child.equipmentref == "equip_claymore" && !istrue(child.exploding)) {
                child thread namespace_8c5b266f689b1e0b::claymore_destroy();
            }
        }
    }
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait(var_cbf7be4f62a0ddb2);
    }
    namespace_2a9588dfac284b77::deregisterspawn();
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec8
// Size: 0x75
function at_mine_movingplatform_update() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    self.attachedvelocity = (0, 0, 0);
    update_interval = 0.2;
    while (1) {
        old_origin = self.origin;
        wait(update_interval);
        self.attachedvelocity = 1 / update_interval * (self.origin - old_origin);
    }
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf44
// Size: 0x38
function is_at_mine_moving(mine) {
    return isdefined(mine) && isdefined(mine.attachedvelocity) && length2dsquared(mine.attachedvelocity) > 0.01;
}

// Namespace at_mine/namespace_3953fa5589223b8
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
    while (1) {
        var_f9b008542cd70a05 = self waittill("trigger_grenade");
        /#
            assert(isdefined(var_f9b008542cd70a05));
        #/
        if (istrue(self.isdisabled)) {
            continue;
        }
        foreach (ent in var_f9b008542cd70a05) {
            if (!isdefined(ent) || !isdefined(ent.classname)) {
                continue;
            }
            if (ent.classname == "script_vehicle") {
                if (ent namespace_739a1beacdad3457::vehicle_mines_isfriendlytomine(self)) {
                    continue;
                }
                if (!namespace_739a1beacdad3457::vehicle_mines_shouldvehicletriggermine(ent, self)) {
                    continue;
                }
                namespace_739a1beacdad3457::vehicle_mines_minetrigger(ent, self);
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

// Namespace at_mine/namespace_3953fa5589223b8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10bc
// Size: 0x95
function function_d9f2aec6c4f8ed31() {
    /#
        self endon("game_ended");
        self endon("physicscontents_water");
        self endon("prone");
        var_ec0c4e7c490c12d5 = self.owner;
        if (!isplayer(var_ec0c4e7c490c12d5)) {
            return;
        }
        var_ec0c4e7c490c12d5 notifyonplayercommand("<unknown string>", "<unknown string>");
        var_ec0c4e7c490c12d5 notifyonplayercommand("<unknown string>", "<unknown string>");
        while (1) {
            var_ec0c4e7c490c12d5 waittill("<unknown string>");
            var_46ed5a32178f9dd7 = getdvarint(@"hash_e67a08119163320a", 0);
            if (!var_46ed5a32178f9dd7) {
                continue;
            }
            thread at_mine_player_trigger(var_ec0c4e7c490c12d5);
        }
    #/
}

// Namespace at_mine/namespace_3953fa5589223b8
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

// Namespace at_mine/namespace_3953fa5589223b8
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

// Namespace at_mine/namespace_3953fa5589223b8
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

// Namespace at_mine/namespace_3953fa5589223b8
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

// Namespace at_mine/namespace_3953fa5589223b8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133c
// Size: 0xb
function deletemine() {
    at_mine_delete(0);
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x134e
// Size: 0x294
function at_mine_watch_flight() {
    self endon("mine_destroyed");
    self endon("death");
    flighttime = 0.8;
    if (flighttime > 0) {
        flightdir = (0, 0, 1);
        var_497ee714438fc27b = self.origin + flightdir * 64;
        contents = physics_createcontents([0:"physicscontents_glass", 1:"physicscontents_water", 2:"physicscontents_item", 3:"physicscontents_vehicle", 4:"physicscontents_missileclip"]);
        ignorelist = namespace_ff64cf6a607bc089::get_mine_ignore_list();
        caststart = self.origin;
        castend = var_497ee714438fc27b;
        var_e021c2744cc7ed68 = physics_raycast(caststart, castend, contents, ignorelist, 0, "physicsquery_closest", 1);
        if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
            var_64b62cb5dc1e7af6 = vectordot(var_e021c2744cc7ed68[0]["position"] - caststart, flightdir);
            var_64b62cb5dc1e7af6 = max(0, var_64b62cb5dc1e7af6 - 1);
            flighttime = 0;
            var_497ee714438fc27b = self.origin;
            if (var_64b62cb5dc1e7af6 > 0) {
                flighttime = var_64b62cb5dc1e7af6 / 64 * 0.8;
                var_497ee714438fc27b = self.origin + flightdir * var_64b62cb5dc1e7af6;
            }
        }
        if (is_at_mine_moving(self)) {
            var_497ee714438fc27b = var_497ee714438fc27b + self.attachedvelocity * flighttime;
        }
        if (flighttime > 0) {
            var_3c08499beed332ce = flighttime;
            var_fc211cb9f7ae83cd = var_3c08499beed332ce * 0.81;
            if (is_at_mine_moving(self)) {
                var_fc211cb9f7ae83cd = var_fc211cb9f7ae83cd * 0.25;
            }
            var_3c08499beed332ce = var_3c08499beed332ce - var_fc211cb9f7ae83cd;
            var_7162ec9dd06a7bb8 = 0;
            if (var_3c08499beed332ce > 0) {
                var_7162ec9dd06a7bb8 = var_3c08499beed332ce * 0;
            }
            mover = spawn("script_model", self.origin);
            mover.angles = vectortoangles(anglestoforward(self.angles) * (1, 1, 0));
            mover setmodel("tag_origin");
            self.mover = mover;
            mover.grenade = self;
            self linkto(mover, "tag_origin", (0, 0, 0), (0, 0, 0));
            mover moveto(var_497ee714438fc27b, flighttime, var_7162ec9dd06a7bb8, var_fc211cb9f7ae83cd);
            mover thread at_mine_watch_flight_mover(flighttime);
            function_9e0f9db6ce29a5a9();
            childthread namespace_ff64cf6a607bc089::watch_flight_collision();
            waittill_any_timeout_1(flighttime, "collision_with_platform");
            thread at_mine_explode_from_player_trigger();
            return;
        }
    }
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e9
// Size: 0x35
function function_9e0f9db6ce29a5a9() {
    var_6ecc08067178676f = "land";
    if (istrue(self.var_b4331a150334bf61)) {
        var_6ecc08067178676f = "water";
    }
    self setscriptablepartstate("launch", var_6ecc08067178676f, 0);
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1625
// Size: 0x69
function at_mine_empapplied(data) {
    attacker = data.attacker;
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker namespace_58a74e7d54b56e8d::givescoreforequipment(self, undefined, 1);
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback("");
    }
    thread function_416f3f7ada048ff9(attacker);
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1695
// Size: 0x66
function function_83d4163604fc28e3(data) {
    attacker = data.attacker;
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker namespace_58a74e7d54b56e8d::givescoreforequipment(self);
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback("");
    }
    self notify("detonateExplosive", attacker);
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1702
// Size: 0x57
function at_mine_watch_detonate() {
    self endon("death");
    attacker = self waittill("detonateExplosive");
    if (isdefined(attacker)) {
        thread at_mine_explode_from_notify(attacker);
    } else if (isdefined(self.owner)) {
        thread at_mine_explode_from_notify(self.owner);
    } else {
        thread at_mine_destroy();
    }
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1760
// Size: 0x2b
function at_mine_watch_game_end() {
    self endon("mine_destroyed");
    self endon("death");
    level waittill_any_2("game_ended", "bro_shot_start");
    thread at_mine_destroy();
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1792
// Size: 0x71
function at_mine_damage_vehicle_manually(vehicle) {
    vehicle dodamage(200, self.origin, self.owner, self, "MOD_EXPLOSIVE", makeweapon("at_mine_mp"));
    ignoredamageid = vehicle namespace_a12dc1d0c8a64946::non_player_add_ignore_damage_signature(self.owner, makeweapon("at_mine_mp"), self, "MOD_EXPLOSIVE");
    waitframe();
    if (isdefined(vehicle)) {
        vehicle namespace_a12dc1d0c8a64946::non_player_remove_ignore_damage_signature(ignoredamageid);
    }
}

// Namespace at_mine/namespace_3953fa5589223b8
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
    var_340d59422336e85a = inflictor.origin - self geteye();
    var_d14eec85ac39c1cb = vectordot(var_340d59422336e85a, up);
    if (var_d14eec85ac39c1cb > 60) {
        return 0;
    }
    var_340d59422336e85a = self.origin - inflictor.origin;
    var_f4ef78de9cf3220a = vectordot(var_340d59422336e85a, up);
    if (var_f4ef78de9cf3220a > 60) {
        return 0;
    }
    if (objweapon.basename == "at_mine_ap_mp" || istrue(inflictor.triggeredbyplayer)) {
        if (var_d14eec85ac39c1cb >= 0) {
            if (isdefined(level.gametype) && level.gametype == "br") {
                var_ba53fea232b95f20 = 75;
                var_395702f102833bee = 100;
            } else {
                var_ba53fea232b95f20 = 35;
                var_395702f102833bee = 35;
            }
            stance = victim getstance();
            if (stance == "prone" || self isswimming()) {
                damage = int(min(damage, var_ba53fea232b95f20));
            } else if (stance == "crouch" || self issprintsliding()) {
                damage = int(min(damage, var_395702f102833bee));
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

// Namespace at_mine/namespace_3953fa5589223b8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a1c
// Size: 0x22
function at_mine_cleanup_danger_icon_ent(dangericonent) {
    dangericonent endon("death");
    self waittill("death");
    dangericonent delete();
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a45
// Size: 0x80
function at_mine_onownerchanged(var_c0f9139ffd72e62d) {
    self setscriptablepartstate("hacked", "active", 0);
    at_mine_update_danger_zone();
    sentientpool = self.sentientpool;
    namespace_6d9917c3dc05dbe9::unregistersentient(self.sentientpool, self.sentientpoolindex);
    namespace_6d9917c3dc05dbe9::registersentient(sentientpool, self.owner, 1);
    thread monitordisownedequipment(self.owner, self);
    thread outlineequipmentforowner(self);
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1acc
// Size: 0x7b
function function_416f3f7ada048ff9(attacker) {
    self endon("death");
    attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_61a2d32e72064a0f");
    self.isdisabled = 1;
    self setscriptablepartstate("empd", "active", 0);
    if (!istrue(self.owner.var_65219c911f198c95)) {
        wait(6);
        self.isdisabled = 0;
        self setscriptablepartstate("empd", "neutral", 0);
    }
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4e
// Size: 0x28
function function_97f28317850da77d(data) {
    self.isdisabled = 0;
    self setscriptablepartstate("empd", "neutral", 0);
}

// Namespace at_mine/namespace_3953fa5589223b8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7d
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

