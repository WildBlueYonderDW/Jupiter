// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using script_58be75c518bf0d40;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\utility\script.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\vehicles\vehicle_mines.gsc;
#using script_7ef95bba57dc4b82;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\spawnlogic.gsc;
#using script_736dec95a49487a6;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;

#namespace namespace_92db27f0afac4406;

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x434
// Size: 0x19
function autoexec main() {
    registersharedfunc("equip_butterfly_mine", "init", &function_843dde4bf96b6965);
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x454
// Size: 0x2c
function function_843dde4bf96b6965() {
    minetriggerdata = namespace_739a1beacdad3457::vehicle_mines_getleveldataformine("equip_butterfly_mine", 1);
    minetriggerdata.triggercallback = &function_4751713f978b6416;
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x487
// Size: 0x1af
function function_539f38f444d5b41a(grenade) {
    grenade setotherent(self);
    grenade setcandamage(0);
    grenade hudoutlinedisable();
    grenade setscriptablepartstate("visibility", "show", 0);
    grenade.var_c63a7f2980c7d596 = [];
    grenade.var_698a77ddf33b65d0 = 0;
    ref = namespace_4fb9dddfb8c1a67a::function_7f245729fcb6414d(grenade.weapon_name);
    grenade.var_8bf83d28be4c2d4f = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo(ref);
    if (!isdefined(grenade.var_8bf83d28be4c2d4f.bundle)) {
        /#
            assertmsg("Butterfly Mine needs a bundle.");
        #/
    }
    var_6951cf1f43bc8ebe = self getgunangles();
    var_8011cffb839e8243 = gettime();
    launchvelocity = anglestoforward(var_6951cf1f43bc8ebe) * 500 + anglestoup(var_6951cf1f43bc8ebe) * 0;
    stuckto = grenade waittill("missile_stuck");
    grenade setscriptablepartstate("plant", "active", 0);
    traveltime = (gettime() - var_8011cffb839e8243) / 1000;
    var_ceab23e7a7e95404 = launchvelocity + (0, 0, -800 * traveltime);
    onequipmentplanted(grenade, "equip_butterfly_mine", &function_f1ccd9eaaa39e87c);
    wait(grenade.var_8bf83d28be4c2d4f.bundle.var_13e889d695d426d0);
    grenade function_a1a46255fbfac86c(grenade, var_6951cf1f43bc8ebe, var_ceab23e7a7e95404);
    grenade setscriptablepartstate("launch", "land", 0);
    wait(0.25);
    grenade setscriptablepartstate("visibility", "hide", 0);
    grenade hide();
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63d
// Size: 0x5d
function function_a1a46255fbfac86c(grenade, var_6951cf1f43bc8ebe, var_ceab23e7a7e95404) {
    grenade.var_ec07522d4a88f026 = [];
    grenade function_33f76685d61ffb0(grenade.var_8bf83d28be4c2d4f.bundle.var_e2a7d54c199db889, 3, var_ceab23e7a7e95404, 45, 120, 35, 360, 0);
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a1
// Size: 0x27e
function function_33f76685d61ffb0(var_47a3cfd1f03dea91, var_e39d0ef75da9bc05, var_ceab23e7a7e95404, var_fcf98315fcc13307, var_ec8c077b88a3003e, var_450483a591a06439, var_66049dbda29a511f, var_4d1e3f4a23058445) {
    var_4b65413211af7033 = undefined;
    forward = vectornormalize(var_ceab23e7a7e95404);
    up = anglestoup(self.angles);
    var_4b65413211af7033 = function_5f9ffc69b9bd0ab3(up, forward);
    for (var_461f79a7e3bae49e = 0; var_461f79a7e3bae49e < var_e39d0ef75da9bc05; var_461f79a7e3bae49e++) {
        var_a1e0f56139f09662 = "0" + var_461f79a7e3bae49e;
        var_7dd38127390a8ba9 = self gettagorigin("j_mine_" + var_a1e0f56139f09662, 1);
        if (!isdefined(var_7dd38127390a8ba9)) {
            continue;
        }
        var_4bb748152aa75ddf = vectornormalize(var_7dd38127390a8ba9 - self.origin);
        var_4bb748152aa75ddf = function_70fd9ddef68b9ae3(var_4bb748152aa75ddf, var_7dd38127390a8ba9, 10);
        var_f2da0ac5a61a699e = randomfloatrange(-1, 1) * 5 + var_450483a591a06439;
        var_a1261dd532409e7f = randomfloatrange(-1, 1) * 15;
        var_441fb78a71e1b458 = 360 - var_f2da0ac5a61a699e - var_a1261dd532409e7f;
        var_154ef61b7a7f747a = randomfloatrange(var_fcf98315fcc13307, var_ec8c077b88a3003e);
        var_6951cf1f43bc8ebe = vectortoangles(var_4bb748152aa75ddf) + (var_441fb78a71e1b458, 0, 0);
        var_7061804b4efabe16 = sqrt(800 * var_154ef61b7a7f747a / sin(2 * var_f2da0ac5a61a699e));
        var_b571a1c1c33fc4b = vectornormalize(anglestoforward(var_6951cf1f43bc8ebe));
        var_6e17d9fbf3b64b04 = var_7061804b4efabe16 * var_b571a1c1c33fc4b;
        if (isdefined(self) && isdefined(self.owner)) {
            var_b81b2c0ed28d097 = _launchgrenade(var_47a3cfd1f03dea91, var_7dd38127390a8ba9, var_6e17d9fbf3b64b04, self.var_8bf83d28be4c2d4f.bundle.var_8af7c7441da0d0f6);
            function_6300c632dc21b15a(var_b81b2c0ed28d097, self.owner, self);
            self.var_ec07522d4a88f026[var_461f79a7e3bae49e + var_4d1e3f4a23058445] = var_b81b2c0ed28d097;
            var_b81b2c0ed28d097 thread function_ffa6fec05cb3637a(self.var_8bf83d28be4c2d4f.bundle);
            if (namespace_3c37cb17ade254d::issharedfuncdefined("entity", "trackEntityLimit")) {
                [[ namespace_3c37cb17ade254d::getsharedfunc("entity", "trackEntityLimit") ]](var_b81b2c0ed28d097, self.owner);
                var_b81b2c0ed28d097 thread function_1575acb1c3533196();
                waitframe();
            }
        }
    }
    thread function_ebc941d7484bb7a9();
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x926
// Size: 0x4f
function function_ebc941d7484bb7a9() {
    level endon("game_ended");
    self.owner endon("disconnect");
    thread delaythread(1, &namespace_aad14af462a74d08::function_b0f754c8a379154e, "equip_butterfly_mine", self.owner, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97c
// Size: 0x1dd
function function_70fd9ddef68b9ae3(var_4bb748152aa75ddf, var_7dd38127390a8ba9, var_6bcf02b3fa907d47) {
    var_7c2f0a987752b57e = var_4bb748152aa75ddf;
    var_9e1171a935066689 = (var_4bb748152aa75ddf[0], var_4bb748152aa75ddf[1], 0);
    var_9f6125e568a9cc37 = self.origin + (0, 0, 1);
    var_65f2273b33f07faa = self.origin + (0, 0, 1) + var_9e1171a935066689 * var_6bcf02b3fa907d47;
    var_68e6f05a4ee24dee = physics_createcontents([0:"physicscontents_clipshot", 1:"physicscontents_missileclip", 2:"physicscontents_glass", 3:"physicscontents_vehicle", 4:"physicscontents_characterproxy"]);
    hitents = physics_raycast(var_9f6125e568a9cc37, var_65f2273b33f07faa, var_68e6f05a4ee24dee, undefined, 0, "physicsquery_all");
    i = 0;
    var_e1c117e37f2a0513 = var_9e1171a935066689;
    var_f7d4e3b374ebbcfc = 0;
    while (hitents.size > 0 && i < 3) {
        var_9f6125e568a9cc37 = self.origin + (0, 0, 1);
        var_65f2273b33f07faa = self.origin + (0, 0, 1) + var_e1c117e37f2a0513 * var_6bcf02b3fa907d47;
        var_6221dd5fd704b1dc = physics_raycast(var_9f6125e568a9cc37, var_65f2273b33f07faa, var_68e6f05a4ee24dee, undefined, 0, "physicsquery_all");
        if (hitents.size > 0) {
            if (i == 0) {
                var_e1c117e37f2a0513 = (var_9e1171a935066689[0] * -1, var_9e1171a935066689[1] * -1, 0);
                var_f7d4e3b374ebbcfc = 1;
            } else if (i == 1) {
                var_e1c117e37f2a0513 = (var_9e1171a935066689[0], var_9e1171a935066689[1] * -1, 0);
                var_f7d4e3b374ebbcfc = 1;
            } else if (i == 2) {
                var_e1c117e37f2a0513 = (var_9e1171a935066689[0] * -1, var_9e1171a935066689[1], 0);
                var_f7d4e3b374ebbcfc = 1;
            }
        }
        i++;
    }
    if (istrue(var_f7d4e3b374ebbcfc)) {
        return (var_e1c117e37f2a0513 + (0, 0, var_4bb748152aa75ddf[2]));
    } else {
        return var_7c2f0a987752b57e;
    }
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb60
// Size: 0x364
function function_6300c632dc21b15a(var_2133b29d81649793, owner, var_93083caf1530fefa, lifetimeOverride) {
    var_2133b29d81649793.owner = owner;
    var_2133b29d81649793.team = owner.team;
    var_2133b29d81649793.ownerid = owner getxuid();
    var_2133b29d81649793.health = 99999;
    var_2133b29d81649793.maxhealth = self.var_8bf83d28be4c2d4f.bundle.var_4f6c7074ac33dde7;
    var_2133b29d81649793.lifetime = self.var_8bf83d28be4c2d4f.bundle.var_8af7c7441da0d0f6;
    var_2133b29d81649793.explosionradius = self.var_8bf83d28be4c2d4f.bundle.var_5eea1ec7cb11510e;
    var_2133b29d81649793.var_ed91f3ec33af8c15 = self.var_8bf83d28be4c2d4f.bundle.var_891e3bfe74f59aa0;
    var_2133b29d81649793.var_8516b2bf8f4da6d7 = self.var_8bf83d28be4c2d4f.bundle.var_edb2fd8da69874f2;
    var_2133b29d81649793.equipmentref = "equip_butterfly_mine";
    if (isdefined(lifetimeOverride)) {
        var_2133b29d81649793.lifetime = lifetimeOverride;
    }
    if (isdefined(var_93083caf1530fefa)) {
        var_2133b29d81649793.var_93083caf1530fefa = var_93083caf1530fefa;
    }
    var_2133b29d81649793 enableplayermarks("equipment");
    if (level.teambased) {
        var_2133b29d81649793 filteroutplayermarks(var_2133b29d81649793.owner.team);
    } else {
        var_2133b29d81649793 filteroutplayermarks(var_2133b29d81649793.owner);
    }
    var_2133b29d81649793.damagetaken = 0;
    var_2133b29d81649793 namespace_2a9588dfac284b77::registerspawn(1, &function_435b53c90ec01143);
    var_2133b29d81649793.headiconid = var_2133b29d81649793 namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 2, undefined, undefined, undefined, undefined, 1);
    var_2133b29d81649793 setentityowner(owner);
    var_2133b29d81649793 setotherent(owner);
    var_2133b29d81649793 setcandamage(1);
    entnum = var_2133b29d81649793 getentitynumber();
    level.mines[entnum] = var_2133b29d81649793;
    var_2133b29d81649793 thread namespace_3e725f3cc58bddd3::monitordamage(1, "hitequip", &function_ca00c87cb0a3d308, &function_31cc0ad55f88e7f3);
    namespace_5a51aa78ea0b1b9f::add_emp_ent(var_2133b29d81649793);
    var_2133b29d81649793 namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&function_692167ff37e7ef8);
    if (issharedfuncdefined("emp", "setEMP_Started_Callback")) {
        var_2133b29d81649793 [[ getsharedfunc("emp", "setEMP_Started_Callback") ]](&function_b86eee224cc33fc);
    }
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        var_2133b29d81649793 [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_692167ff37e7ef8);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        var_2133b29d81649793 [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_d2c4655c7d6a3331);
    }
    var_2133b29d81649793.dangerzone = namespace_b2d5aa2baf2b5701::addspawndangerzone(var_2133b29d81649793.origin, namespace_b2d5aa2baf2b5701::getdefaultminedangerzoneradiussize(), 50, var_2133b29d81649793.owner.team, undefined, var_2133b29d81649793.owner, 0, var_2133b29d81649793, 1);
    var_2133b29d81649793 thread function_b540d1d357522929();
    var_2133b29d81649793 setscriptablepartstate("visibility", "show", 0);
    var_2133b29d81649793 namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_f92200134f4ce696);
    var_2133b29d81649793 namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&function_b86eee224cc33fc);
    var_2133b29d81649793 namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&function_d2c4655c7d6a3331);
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecb
// Size: 0x1fe
function function_ffa6fec05cb3637a(bundle) {
    self endon("death");
    self endon("explode");
    level endon("game_ended");
    contents = physics_createcontents([0:"physicscontents_missileclip", 1:"physicscontents_item", 2:"physicscontents_vehicle", 3:"physicscontents_glass", 4:"physicscontents_water"]);
    wait(bundle.var_d96b1862158576e0);
    while (1) {
        self setscriptablepartstate("arm", "active", 0);
        var_f9b008542cd70a05 = self waittill("trigger_grenade");
        /#
            assert(isdefined(var_f9b008542cd70a05));
        #/
        foreach (ent in var_f9b008542cd70a05) {
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
                forward = anglestoforward(self.angles);
                up = anglestoup(self.angles);
                var_2cc97e113610ca14 = self.origin + up * 35;
                ignorelist = [0:self];
                var_e021c2744cc7ed68 = physics_raycast(var_2cc97e113610ca14, ent.origin, contents, ignorelist, 0, "physicsquery_closest", 1);
                if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
                    continue;
                }
                thread function_fb430131c2697d67(ent);
                break;
            }
        }
    }
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d0
// Size: 0x244
function function_fb430131c2697d67(attacker) {
    thread function_56ae4ffb25eb1168(5);
    if (isai(attacker)) {
        if (isplayer(attacker)) {
            attackerid = attacker getxuid();
        } else {
            attackerid = attacker.unique_id;
        }
    } else if (attacker.classname == "script_vehicle") {
        attackerid = attacker.vehiclename;
    } else {
        attackerid = attacker getxuid();
    }
    if (isplayer(attacker)) {
        if (attacker namespace_82dcd1d5ae30ff7::_hasperk("specialty_delaymine")) {
            self setscriptablepartstate("trigger", "active", 0);
        }
    }
    explosivetrigger(attacker, 0);
    if (isdefined(self.var_93083caf1530fefa.var_c63a7f2980c7d596[attackerid])) {
        self.var_93083caf1530fefa.var_c63a7f2980c7d596[attackerid] = self.var_93083caf1530fefa.var_c63a7f2980c7d596[attackerid] + 1;
    } else {
        self.var_93083caf1530fefa.var_c63a7f2980c7d596[attackerid] = 1;
    }
    var_d4f79d3788e388fb = "";
    switch (self.var_93083caf1530fefa.var_c63a7f2980c7d596[attackerid]) {
    case 1:
        var_d4f79d3788e388fb = "fromPlayer";
        break;
    case 2:
        var_d4f79d3788e388fb = "fromPlayerSecond";
        break;
    case 3:
        var_d4f79d3788e388fb = "fromPlayerThird";
        break;
    }
    if (game_utility::function_21322da268e71c19()) {
        var_d4f79d3788e388fb = var_d4f79d3788e388fb + "_hc";
    }
    if (isplayer(attacker)) {
        self.var_93083caf1530fefa.owner updatedamagefeedback("hitequip");
    }
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("explode", var_d4f79d3788e388fb, 0);
    self radiusdamage(self.origin, self.explosionradius, self.var_8516b2bf8f4da6d7, self.var_ed91f3ec33af8c15, attacker, "MOD_EXPLOSIVE", "butterfly_mine_mp");
    namespace_aad14af462a74d08::function_b0f754c8a379154e("equip_butterfly_mine", self.var_93083caf1530fefa.owner, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131b
// Size: 0x1e
function function_4751713f978b6416(vehicle, mine) {
    mine thread function_fb430131c2697d67(vehicle);
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1340
// Size: 0x3a
function function_435b53c90ec01143(attacker) {
    thread function_56ae4ffb25eb1168(5);
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("destroy", "active", 0);
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1381
// Size: 0x33
function function_e7e5214ee3b16fb1() {
    thread function_56ae4ffb25eb1168(1, 1);
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("visibility", "hide", 0);
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bb
// Size: 0x13e
function function_56ae4ffb25eb1168(var_cbf7be4f62a0ddb2, var_6c3c372dfdf70054) {
    self notify("death");
    self setcandamage(0);
    if (isdefined(self.headiconid)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    }
    self.headiconid = undefined;
    if (isdefined(var_6c3c372dfdf70054)) {
        if (istrue(var_6c3c372dfdf70054)) {
            self.exploding = 0;
        }
    } else {
        self.exploding = 1;
    }
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
        self.dangerzone = undefined;
    }
    if (isdefined(self.var_93083caf1530fefa)) {
        if (isdefined(self.var_93083caf1530fefa.var_ec07522d4a88f026)) {
            self.var_93083caf1530fefa.var_ec07522d4a88f026 = array_remove(self.var_93083caf1530fefa.var_ec07522d4a88f026, self);
        }
    }
    cleanupequipment(self getentitynumber());
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait(var_cbf7be4f62a0ddb2);
    }
    namespace_2a9588dfac284b77::deregisterspawn();
    if (isdefined(self.var_93083caf1530fefa)) {
        if (self.var_93083caf1530fefa.var_ec07522d4a88f026.size == 0) {
            self.var_93083caf1530fefa function_f1ccd9eaaa39e87c();
        }
    }
    self delete();
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1500
// Size: 0x74
function function_f1ccd9eaaa39e87c() {
    if (isdefined(self.var_ec07522d4a88f026)) {
        foreach (mine in self.var_ec07522d4a88f026) {
            mine thread function_e7e5214ee3b16fb1();
        }
    }
    namespace_2a9588dfac284b77::deregisterspawn();
    self delete();
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x157b
// Size: 0x74
function function_81ddc6ea59046dcb() {
    if (isdefined(self.var_ec07522d4a88f026)) {
        foreach (mine in self.var_ec07522d4a88f026) {
            mine thread function_435b53c90ec01143();
        }
    }
    namespace_2a9588dfac284b77::deregisterspawn();
    self delete();
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f6
// Size: 0xe3
function function_31cc0ad55f88e7f3(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    meansofdeath = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    if (isbulletdamage(meansofdeath)) {
        if (isdefined(objweapon)) {
            hits = 1;
            if (damage >= namespace_3bbb5a98b932c46f::minegettwohitthreshold()) {
                hits = hits + 1;
            }
            if (namespace_a12dc1d0c8a64946::isfmjdamage(objweapon, meansofdeath)) {
                hits = hits * 2;
            }
            damage = hits * 5;
        }
    } else if (function_76df7cd7c6105e46(meansofdeath)) {
        damage = 1;
    }
    namespace_3bbb5a98b932c46f::equipmenthit(self.owner, attacker, objweapon, meansofdeath);
    return damage;
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e1
// Size: 0x56
function function_76df7cd7c6105e46(meansofdeath) {
    switch (meansofdeath) {
    case #"hash_66cb246f3e55fbe2":
    case #"hash_b1078ff213fddba6":
    case #"hash_c22b13f81bed11f0":
    case #"hash_d8646db4e6ee3658":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x173e
// Size: 0xce
function function_ca00c87cb0a3d308(data) {
    attacker = data.attacker;
    if (isdefined(attacker)) {
        if (namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker)) {
            attacker notify("destroyed_equipment");
            if (!istrue(self.var_93083caf1530fefa.var_698a77ddf33b65d0)) {
                attacker namespace_58a74e7d54b56e8d::givescoreforequipment(self, data.objweapon);
                self.var_93083caf1530fefa.var_698a77ddf33b65d0 = 1;
            }
        }
        if (isbulletdamage(data.meansofdeath) || function_76df7cd7c6105e46(data.meansofdeath)) {
            thread function_92c9dde336b60a46(self.var_93083caf1530fefa, self.origin);
        }
    }
    thread function_435b53c90ec01143();
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1813
// Size: 0x10a
function function_92c9dde336b60a46(var_93083caf1530fefa, var_6f787df1640ddee3) {
    wait(0.35);
    var_99adc79da01c03cb = self;
    var_cf6a004a681e3e4e = 250000;
    var_a00a9c7b1ee599d = 0;
    if (isdefined(var_93083caf1530fefa) && isdefined(var_93083caf1530fefa.var_ec07522d4a88f026)) {
        foreach (mine in var_93083caf1530fefa.var_ec07522d4a88f026) {
            if (!isdefined(mine)) {
                continue;
            }
            if (mine == self) {
                continue;
            }
            var_a2110d248c0d418d = distancesquared(mine.origin, var_6f787df1640ddee3);
            if (var_a2110d248c0d418d < var_cf6a004a681e3e4e) {
                var_99adc79da01c03cb = mine;
                var_cf6a004a681e3e4e = var_a2110d248c0d418d;
                var_a00a9c7b1ee599d = 1;
            }
        }
    }
    if (istrue(var_a00a9c7b1ee599d)) {
        var_99adc79da01c03cb thread function_92c9dde336b60a46(var_93083caf1530fefa, var_99adc79da01c03cb.origin);
        var_99adc79da01c03cb thread function_435b53c90ec01143();
    }
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1924
// Size: 0xa3
function function_692167ff37e7ef8(data) {
    if (!isdefined(self.owner)) {
        return;
    }
    attacker = data.attacker;
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        if (!istrue(self.var_93083caf1530fefa.var_698a77ddf33b65d0)) {
            attacker namespace_58a74e7d54b56e8d::givescoreforequipment(self, undefined, 1);
            self.var_93083caf1530fefa.var_698a77ddf33b65d0 = 1;
        }
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback("");
    }
    thread function_435b53c90ec01143();
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ce
// Size: 0x1e
function function_b540d1d357522929() {
    self endon("death");
    function_1ba54174ee9ab40f();
    if (isdefined(self)) {
        thread function_435b53c90ec01143();
    }
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f3
// Size: 0x40
function function_1ba54174ee9ab40f() {
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    level endon("game_ended");
    while (1) {
        waitframe();
    }
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3a
// Size: 0x1f
function function_1575acb1c3533196() {
    self endon("death");
    self waittill("entity_limit_destroy");
    if (isdefined(self)) {
        thread function_435b53c90ec01143();
    }
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a60
// Size: 0x44
function function_f92200134f4ce696(data) {
    if (istrue(self.var_3621873dccbde4b5)) {
        return 0;
    }
    if (isdefined(data.attacker)) {
        self setentityowner(data.attacker);
    }
    thread function_435b53c90ec01143();
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aab
// Size: 0x3c
function function_b86eee224cc33fc(data) {
    if (isdefined(self) && !istrue(self.var_3621873dccbde4b5)) {
        self.isdisabled = 1;
        self setscriptablepartstate("empd", "active", 0);
    }
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aee
// Size: 0x3b
function function_d2c4655c7d6a3331(data) {
    if (isdefined(self) || !istrue(self.var_3621873dccbde4b5)) {
        self.isdisabled = undefined;
        self setscriptablepartstate("empd", "neutral", 0);
    }
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b30
// Size: 0x3c
function function_5f9ffc69b9bd0ab3(up, forward) {
    right = vectornormalize(vectorcross(forward, up));
    forward = vectorcross(up, right);
    return axistoangles(forward, right, up);
}

// Namespace namespace_92db27f0afac4406/namespace_b96a346cb4f3959c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b74
// Size: 0x19e
function function_e1d976fb5e329d97(var_c0f9139ffd72e62d) {
    if (istrue(self.exploding)) {
        return;
    }
    if (isdefined(self.owner)) {
        if (isdefined(self.var_ec07522d4a88f026)) {
            foreach (var_4d5235cfc004aa2a in self.var_ec07522d4a88f026) {
                var_4d5235cfc004aa2a.owner = self.owner;
                var_4d5235cfc004aa2a.team = self.owner.team;
                var_4d5235cfc004aa2a.ownerid = self.owner getxuid();
                var_4d5235cfc004aa2a setentityowner(self.owner);
                var_4d5235cfc004aa2a setotherent(self.owner);
                if (isdefined(var_4d5235cfc004aa2a.dangerzone)) {
                    namespace_b2d5aa2baf2b5701::removespawndangerzone(var_4d5235cfc004aa2a.dangerzone);
                    var_4d5235cfc004aa2a.dangerzone = undefined;
                }
                var_4d5235cfc004aa2a.dangerzone = namespace_b2d5aa2baf2b5701::addspawndangerzone(var_4d5235cfc004aa2a.origin, namespace_b2d5aa2baf2b5701::getdefaultminedangerzoneradiussize(), 50, var_4d5235cfc004aa2a.owner.team, undefined, var_4d5235cfc004aa2a.owner, 0, var_4d5235cfc004aa2a, 1);
                if (level.teambased) {
                    var_4d5235cfc004aa2a filteroutplayermarks(self.owner.team);
                } else {
                    var_4d5235cfc004aa2a filteroutplayermarks(self.owner);
                }
            }
        }
    }
}

