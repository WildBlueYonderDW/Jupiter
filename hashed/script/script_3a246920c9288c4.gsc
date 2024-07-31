#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_2669878cf5a1b6bc;
#using script_5762ac2f22202ba2;
#using scripts\mp\equipment\trophy_system.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace scripted_trophy;

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6cb
// Size: 0x65
function trophy_init() {
    levelstruct = spawnstruct();
    levelstruct.tags = [];
    levelstruct.tags[0] = "tag_barrel_1";
    levelstruct.tags[1] = "tag_barrel_2";
    levelstruct.tags[3] = "tag_barrel_3";
    level.trophy = levelstruct;
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x738
// Size: 0x200
function trophy_create(loc, candamage, ammocount, maxhealthoverride, teamoverride) {
    trophy = magicgrenademanual("trophy_mp", loc.origin, (0, 0, 0));
    trophy.var_c5ed7e1af63fb508 = 1;
    trophy.team = "axis";
    if (isdefined(teamoverride)) {
        trophy.team = teamoverride;
    }
    trophy.owner = trophy;
    loc.trophy = trophy;
    trophy setscriptablepartstate("effects", "activeDeployStart");
    wait 1.25;
    trophy setscriptablepartstate("effects", "activeDeployEnd");
    if (istrue(candamage)) {
        maxhealth = 100;
        if (isdefined(maxhealthoverride)) {
            maxhealth = maxhealthoverride;
        }
        damagefeedback = "hitequip";
        if (scripts\engine\utility::issharedfuncdefined("damage", "monitorDamage")) {
            trophy thread [[ scripts\engine\utility::getsharedfunc("damage", "monitorDamage") ]](maxhealth, damagefeedback, &trophy_handlefataldamage, &trophy_handledamage, 0);
        }
        trophy thread trophy_destroyonemp();
    }
    if (isdefined(ammocount)) {
        trophy.max_ammo = ammocount;
    }
    trophy.ammo = trophy.max_ammo;
    trophy.usedcount = 0;
    trophy thread trophy_destroyongameend();
    trophy.explosion = trophy_createexplosion(trophy);
    if (getdvarint(@"hash_a0495fcfca0849aa", 0) != 0) {
        /#
            if (getdvarint(@"hash_2fb6b2a16c2792d0", 0) != 0) {
                trophy thread scripts\mp\equipment\trophy_system::function_281b0f9d6b4c66ad(45, 325, &function_9f13cc66529c6e8f, &scripts\mp\equipment\trophy_system::function_da07fdc88865707a, 1);
            }
        #/
        trophy thread scripts\mp\equipment\trophy_system::function_281b0f9d6b4c66ad(45, 325, &function_9f13cc66529c6e8f, &function_509f8c901a3ae35, 0);
        return;
    }
    trophy thread trophy_watchprotection(45, 105625, &function_9f13cc66529c6e8f, &function_509f8c901a3ae35);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x940
// Size: 0x32
function trophy_destroyongameend() {
    self endon("death");
    self.owner endon("disconnect");
    level waittill_any_2("game_ended", "bro_shot_start");
    thread trophy_destroy();
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x97a
// Size: 0x4b
function trophy_destroyonemp() {
    self endon("death");
    self.owner endon("disconnect");
    data = self waittill("emp_applied");
    attacker = data.attacker;
    thread trophy_destroy(1);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9cd
// Size: 0x9
function trophy_deployanimation() {
    self endon("death");
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9de
// Size: 0x14
function trophy_remote_destroy(player) {
    trophy_destroy(1);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9fa
// Size: 0x1d
function sweeptrophy() {
    thread trophy_delete(0);
    self setscriptablepartstate("effects", "activeDestroyEnd", 0);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa1f
// Size: 0x2b
function trophy_destroy(wasdestroyed) {
    thread trophy_delete(0.1, wasdestroyed);
    self setscriptablepartstate("effects", "activeDestroyEnd", 0);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa52
// Size: 0x43
function trophy_shutdownanddestroy(wasdestroyed) {
    thread trophy_delete(2.6, wasdestroyed);
    self setscriptablepartstate("effects", "activeDestroyStart", 0);
    wait 2.5;
    self setscriptablepartstate("effects", "activeDestroyEnd", 0);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa9d
// Size: 0x6e
function trophy_delete(var_cbf7be4f62a0ddb2, wasdestroyed) {
    self notify("death");
    self setscriptablepartstate("hack_usable", "off");
    self setcandamage(0);
    scripts\cp_mp\entityheadicons::setheadicon_deleteicon(self.headiconid);
    self.headiconid = undefined;
    self.exploding = 1;
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait var_cbf7be4f62a0ddb2;
    }
    scripts\cp_mp\ent_manager::deregisterspawn();
    self delete();
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb13
// Size: 0x25a
function trophy_watchprotection(protectionoffset, protectiondistsqr, var_b701d494f3ae184f, var_d0b9c256ce9d59f4) {
    self endon("death");
    trophy_castcontents = trophy_castcontents();
    while ([[ var_b701d494f3ae184f ]]()) {
        if (istrue(self.isdisabled)) {
            waitframe();
            continue;
        }
        castorigin = trophy_castorigin(protectionoffset);
        var_c70b9adbc218860a = [];
        var_c70b9adbc218860a[0] = level.grenades;
        var_c70b9adbc218860a[1] = level.missiles;
        var_c70b9adbc218860a[2] = level.mines;
        var_c70b9adbc218860a[3] = level.mortars;
        trophytargets = scripts\engine\utility::array_combine_multiple(var_c70b9adbc218860a);
        foreach (trophytarget in trophytargets) {
            if (!isdefined(trophytarget)) {
                continue;
            }
            if (istrue(trophytarget.exploding)) {
                continue;
            }
            if (trophytarget == self) {
                continue;
            }
            if (trophy_checkignorelist(trophytarget)) {
                continue;
            }
            var_1ba7b2d16dc215e1 = trophytarget.owner;
            if (!isdefined(var_1ba7b2d16dc215e1) && isdefined(trophytarget.vehicle)) {
                var_1ba7b2d16dc215e1 = trophytarget.vehicle.owner;
            }
            if (!isdefined(var_1ba7b2d16dc215e1) && isdefined(trophytarget.weapon_name) && weaponclass(trophytarget.weapon_name) == "grenade") {
                var_1ba7b2d16dc215e1 = getmissileowner(trophytarget);
            }
            var_f31940d93afc41db = 1;
            /#
                if (getdvarint(@"hash_3c6c485214ca7673", 0) == 1) {
                    var_f31940d93afc41db = 0;
                }
            #/
            if (var_f31940d93afc41db) {
                if (isdefined(var_1ba7b2d16dc215e1) && !istrue(scripts\cp_mp\utility\player_utility::playersareenemies(self, var_1ba7b2d16dc215e1))) {
                    continue;
                }
            }
            if (distancesquared(trophytarget.origin, self.origin) > trophy_modifiedprotectiondistsqr(trophytarget, protectiondistsqr)) {
                continue;
            }
            castresults = physics_raycast(castorigin, trophytarget.origin, trophy_castcontents, [self, trophytarget], 0, "physicsquery_closest");
            if (isdefined(castresults) && castresults.size > 0) {
                continue;
            }
            self [[ var_d0b9c256ce9d59f4 ]](trophytarget);
        }
        waitframe();
    }
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd75
// Size: 0xc
function function_9f13cc66529c6e8f() {
    return isdefined(self.owner);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd8a
// Size: 0x14
function function_509f8c901a3ae35(trophytarget) {
    thread function_df73a01c76de4b5c(trophytarget);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xda6
// Size: 0x68
function private function_ba83e8dc816c34b(trophytarget) {
    outnum = 1;
    if (isdefined(trophytarget) && isdefined(trophytarget.weapon_name)) {
        switch (trophytarget.weapon_name) {
        case #"hash_85ea99fcbe4116a4": 
            outnum = 3;
            break;
        case #"hash_5c272c0617caebf0": 
            outnum = 3;
            break;
        }
    }
    return outnum;
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xe17
// Size: 0xb6
function private function_df73a01c76de4b5c(trophytarget) {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_end");
    if (!isdefined(self.usedcount)) {
        self.usedcount = 0;
    }
    self.usedcount++;
    var_edad871174aa4c18 = trophytarget.origin;
    numshots = function_ba83e8dc816c34b(trophytarget);
    if (self.ammo >= numshots) {
        function_477783276ea16601(trophytarget);
        logtrophysuccesful(trophytarget);
    }
    for (i = 0; i < numshots; i++) {
        childthread function_363a32a7a77c9fe0(var_edad871174aa4c18, i);
        wait 0.2;
    }
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xed5
// Size: 0x106
function private function_363a32a7a77c9fe0(trophytarget, shotnum) {
    if (self.ammo <= 0) {
        thread trophy_shutdownanddestroy(0);
        return 0;
    }
    explorigin = trophytarget;
    if (shotnum > 1) {
        explorigin = function_b2e78337c5df1c34(explorigin);
    }
    tag = trophy_getbesttag(explorigin);
    part = trophy_getpartbytag(tag);
    self setscriptablepartstate(part, "active", 0);
    var_1331aefd6d9a100 = vectortoangles(self gettagorigin(tag) - explorigin);
    var_cc29543de9737588 = combineangles(var_1331aefd6d9a100, (-90, 0, 0));
    self.explosion thread trophy_explode(explorigin, var_cc29543de9737588);
    self.ammo--;
    /#
        if (getdvarint(@"hash_20d714b15057681f", 0) == 1) {
            self.ammo = 10;
        }
    #/
    if (self.ammo <= 0) {
        thread trophy_shutdownanddestroy(0);
    }
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xfe3
// Size: 0x106
function private function_b2e78337c5df1c34(var_5c1a8852fefebef5) {
    var_f95c4b9d1740f23b = 0.05;
    x_scatter = randomfloatrange(0.9, 1.1);
    y_scatter = randomfloatrange(0.9, 1.1);
    z_scatter = randomfloatrange(0.8, 1.2);
    x = var_5c1a8852fefebef5[0];
    y = var_5c1a8852fefebef5[1];
    z = var_5c1a8852fefebef5[2];
    x_delta = x * x_scatter;
    y_delta = y * y_scatter;
    z_delta = z * z_scatter;
    if (abs(x - x_delta) < x * var_f95c4b9d1740f23b) {
        x_delta += x_delta * var_f95c4b9d1740f23b;
    }
    if (abs(y - y_delta) < y * var_f95c4b9d1740f23b) {
        y_delta += y_delta * var_f95c4b9d1740f23b;
    }
    if (abs(z - z_delta) < z * var_f95c4b9d1740f23b) {
        z_delta += z_delta * var_f95c4b9d1740f23b;
    }
    return (x_delta, y_delta, z_delta);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10f2
// Size: 0x12f
function function_477783276ea16601(trophytarget) {
    trophytarget setcandamage(0);
    trophytarget.exploding = 1;
    trophytarget stopsounds();
    attacker = undefined;
    if (isdefined(trophytarget.owner)) {
        attacker = trophytarget.owner;
    }
    explorigin = trophytarget.origin;
    var_cc29543de9737588 = trophytarget.angles;
    if (scripts\engine\utility::issharedfuncdefined("equipment", "isPlantedEquipment")) {
        if ([[ scripts\engine\utility::getsharedfunc("equipment", "isPlantedEquipment") ]](trophytarget)) {
            if (scripts\engine\utility::issharedfuncdefined("equipment", "deleteExplosive")) {
                trophytarget [[ scripts\engine\utility::getsharedfunc("equipment", "deleteExplosive") ]]();
            }
        } else {
            trophytarget delete();
        }
    } else {
        trophytarget delete();
    }
    self.explosion thread trophy_explode(explorigin, var_cc29543de9737588);
    if (!isdefined(self.var_780fcd96e8f599e0)) {
        self.var_780fcd96e8f599e0 = 0;
    }
    self.var_780fcd96e8f599e0++;
    if (isdefined(attacker)) {
        level notify("trophyused", attacker);
        attacker thread namespace_e072c8407b2a861c::updatedamagefeedback("hittrophysystem");
    }
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1229
// Size: 0x19
function trophy_watchgameended() {
    self endon("death");
    function_87f41f420ea77fa();
    thread trophy_shutdownanddestroy(0);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x124a
// Size: 0x9
function function_87f41f420ea77fa() {
    level endon("game_ended");
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x125b
// Size: 0x6d
function trophy_handledamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    modifieddamage = damage;
    return modifieddamage;
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12d1
// Size: 0x4a
function trophy_handlefataldamage(data) {
    if (isdefined(data.attacker) && isplayer(data.attacker)) {
        trophy_givepointsfordeath(data.attacker);
    }
    thread trophy_destroy(1);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1323
// Size: 0x25
function trophy_givepointsfordeath(attacker) {
    attacker notify("destroyed_equipment");
    attacker thread namespace_53fc9ddbb516e6e1::function_e800498086e36c29(#"destroyed_equipment");
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1350
// Size: 0x1f
function trophy_applyempcallback(data) {
    data.victim thread trophy_disable(data);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1377
// Size: 0x3d
function function_fa497ea83e7adc8c(data) {
    data.victim trophy_givepointsfordeath(data.attacker);
    data.victim thread trophy_destroy(1);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13bc
// Size: 0x51
function trophy_disable(data) {
    self endon("death");
    self.isdisabled = 1;
    self setscriptablepartstate("empd", "active", 0);
    wait 6;
    self.isdisabled = 0;
    self setscriptablepartstate("empd", "neutral", 0);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1415
// Size: 0xe3
function trophy_createexplosion(trophy) {
    explosion = spawn("script_model", trophy.origin);
    explosion.killcament = trophy;
    explosion.owner = trophy.owner;
    explosion.team = trophy.team;
    explosion.equipmentref = trophy.equipmentref;
    explosion.weapon_name = trophy.weapon_name;
    explosion setotherent(explosion.owner);
    explosion setentityowner(explosion.owner);
    explosion setmodel("trophy_system_mp_explode");
    explosion.explode1available = 1;
    explosion thread trophy_cleanuponparentdeath(trophy, 0.1);
    return explosion;
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1501
// Size: 0x77
function trophy_explode(position, angles) {
    self dontinterpolate();
    self.origin = position;
    self.angles = angles;
    if (istrue(self.explode1available)) {
        self setscriptablepartstate("explode1", "activeDirectional", 0);
        self.explode1available = 0;
        return;
    }
    self setscriptablepartstate("explode2", "activeDirectional", 0);
    self.explode1available = 1;
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1580
// Size: 0x25
function trophy_castorigin(protectionoffset) {
    return self.origin + anglestoup(self.angles) * protectionoffset;
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15ae
// Size: 0x35
function trophy_castcontents() {
    return physics_createcontents(["physicscontents_missileclip", "physicscontents_vehicle", "physicscontents_glass", "physicscontents_water", "physicscontents_item"]);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15ec
// Size: 0xb9
function trophy_modifiedprotectiondistsqr(trophytarget, protectiondistsqr) {
    if (isdefined(trophytarget.weapon_name) && isdefined(trophytarget.owner)) {
        switch (trophytarget.classname) {
        case #"hash_4af55147c6098215": 
            if (211250 > protectiondistsqr) {
                protectiondistsqr = 211250;
            }
            break;
        case #"hash_8b48887639da2db5": 
            if (126750 > protectiondistsqr) {
                protectiondistsqr = 126750;
            }
            break;
        }
        switch (trophytarget.weapon_name) {
        case #"hash_c500a77b6bb7c5d0": 
            if (126750 > protectiondistsqr) {
                protectiondistsqr = 126750;
            }
            break;
        }
    }
    return protectiondistsqr;
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16ae
// Size: 0x20a
function trophy_checkignorelist(trophytarget) {
    if (isdefined(trophytarget.bundle)) {
        if (istrue(trophytarget.bundle.var_c3333778ec49a2c)) {
            return true;
        }
    }
    weaponname = trophytarget.weapon_name;
    if (!isdefined(weaponname) && isdefined(trophytarget.weapon_object)) {
        weaponname = trophytarget.weapon_object.basename;
    }
    if (isdefined(trophytarget.var_835d1cd2262dad74)) {
        return true;
    }
    if (isdefined(weaponname)) {
        if (iskillstreakweapon(weaponname) && weaponname != "cruise_proj_mp" && weaponname != "chopper_gunner_proj_mp" && !issubstr(weaponname, "missile_turret_proj")) {
            return true;
        }
        if (isdefined(trophytarget.weapon_object) && weapon::iswonderweapon(trophytarget.weapon_object)) {
            return true;
        }
        switch (weaponname) {
        case #"hash_5e3fa526a48eaaa5": 
            if (scripts\engine\utility::issharedfuncdefined("equipment", "isPlantedEquipment")) {
                if ([[ scripts\engine\utility::getsharedfunc("equipment", "isPlantedEquipment") ]](trophytarget)) {
                    return true;
                }
            }
            break;
        case #"hash_1a30d3a1753a5b6":
        case #"hash_22f1c67a16accbe":
        case #"hash_34f28162f0f54c6e":
        case #"hash_51a6d4a5612754d2":
        case #"hash_523f0c8fe1ead306":
        case #"hash_53d34fb712dd4235":
        case #"hash_571e95536d9682a1":
        case #"hash_5be4c94863c15240":
        case #"hash_5cc52f4b3d579bc3":
        case #"hash_617feab345ee4f01":
        case #"hash_829141045b36cf1c":
        case #"hash_83ef591efa62a73b":
        case #"hash_badacfdae124cc01":
        case #"hash_c4b9b21ecac2ced4":
        case #"hash_cce14c95e4764532":
        case #"hash_e4aed4089cbf3bc9":
        case #"hash_ef5768c3c9f00e10":
        case #"hash_ffdabdde3cb352ca": 
            return true;
        }
    }
    return false;
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x18c1
// Size: 0xd5
function trophy_notifytrophytargetowner(trophytarget, trophyweaponname, trophyowner) {
    if (!isdefined(trophytarget.owner) || !isplayer(trophytarget.owner)) {
        return;
    }
    trophytarget.owner updatedamagefeedback("hittrophysystem");
    if (isdefined(trophytarget.weapon_name)) {
        switch (trophytarget.weapon_name) {
        case #"hash_5b1e7be1304d43db":
        case #"hash_94c7880dca9ccc3f":
        case #"hash_b23a0686850cd666": 
            trophytarget.owner notify("destroyed_by_trophy", trophyowner, trophyweaponname, trophytarget.weapon_name, trophytarget.origin, trophytarget.angles);
            break;
        }
    }
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x199e
// Size: 0xe5
function trophy_getbesttag(position) {
    tags = level.trophy.tags;
    bestdot = undefined;
    besttag = undefined;
    foreach (id, tag in tags) {
        origin = self gettagorigin(tag);
        angles = self gettagangles(tag);
        forward = anglestoforward(angles);
        dot = vectordot(vectornormalize(position - origin), forward);
        if (id == 0 || dot > bestdot) {
            bestdot = dot;
            besttag = tag;
        }
    }
    return besttag;
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8c
// Size: 0x7e
function trophy_getpartbytag(tag) {
    tags = level.trophy.tags;
    foreach (id, t in tags) {
        if (t == tag) {
            return ("barrel" + id + 1);
        }
    }
    return undefined;
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b13
// Size: 0x10
function trophy_getdeployanimtime() {
    return getanimlength(scriptables%wm_trophy_system_deploy_landing);
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2c
// Size: 0x42
function trophy_givedamagefeedback(attacker) {
    damagefeedback = "";
    if (istrue(self.hasruggedeqp)) {
        damagefeedback = "hitequip";
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback(damagefeedback);
    }
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1b76
// Size: 0xe0
function trophy_modifieddamage(attacker, victim, sweapon, damage, damageadd) {
    if (!isdefined(sweapon)) {
        return [damage, damageadd];
    }
    if (damage == 0) {
        return [damage, damageadd];
    }
    damageclamp = undefined;
    if (scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
        switch (sweapon) {
        case #"hash_5e3fa526a48eaaa5":
        case #"hash_6f08e94ea93bfaf9":
        case #"hash_f085b57dce639767": 
            maxhealth = getdvarint(@"scr_player_maxhealth", 100);
            damageclamp = 0.66 * maxhealth;
            break;
        }
    }
    var_b85ff186894ba31e = damageadd;
    if (isdefined(damageclamp)) {
        var_b85ff186894ba31e = damageclamp - damage;
    }
    var_b85ff186894ba31e = min(var_b85ff186894ba31e, damageadd);
    return [damage, var_b85ff186894ba31e];
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c5f
// Size: 0x2b
function trophy_cleanuponparentdeath(parent, delay) {
    self endon("death");
    parent waittill("death");
    wait delay;
    self delete();
}

// Namespace scripted_trophy / namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c92
// Size: 0xc1
function logtrophysuccesful(trophytarget) {
    if (!isdefined(trophytarget)) {
        return;
    }
    if (!isdefined(self.deployingplayer)) {
        return;
    }
    if (isdefined(trophytarget.owner) && !isplayer(trophytarget.owner)) {
        return;
    }
    if (isdefined(trophytarget.weapon_object)) {
        weaponname = getweaponrootname(trophytarget.weapon_object);
    } else {
        return;
    }
    if (!isdefined(weaponname)) {
        return;
    }
    dlog_recordevent("dlog_event_trophy_successful", ["deploying_player", self.deployingplayer, "grenade_owner", trophytarget.owner, "negated_target", weaponname]);
}

/#

    // Namespace scripted_trophy / namespace_c4c5d5e9936b287c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d5b
    // Size: 0x15
    function function_b96541d92295c9ca() {
        thread function_d146ac9c9d0a4f24();
        thread function_a649727b9944afc2();
    }

    // Namespace scripted_trophy / namespace_c4c5d5e9936b287c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d78
    // Size: 0xd
    function function_194a2d4a0c7509ea() {
        self notify("<dev string:x1c>");
    }

    // Namespace scripted_trophy / namespace_c4c5d5e9936b287c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d8d
    // Size: 0x106
    function function_d146ac9c9d0a4f24() {
        level endon("<dev string:x31>");
        self endon("<dev string:x3d>");
        self.owner endon("<dev string:x46>");
        self endon("<dev string:x1c>");
        baserange = 105625;
        var_6e0ae1d28b9e917d = 126750;
        var_6e0aded28b9e8ae4 = 211250;
        baserange = sqrt(baserange);
        var_6e0ae1d28b9e917d = sqrt(var_6e0ae1d28b9e917d);
        var_6e0aded28b9e8ae4 = sqrt(var_6e0aded28b9e8ae4);
        ranges = [];
        ranges[0] = baserange;
        ranges[1] = var_6e0ae1d28b9e917d;
        ranges[2] = var_6e0aded28b9e8ae4;
        spherecolor = (1, 0, 0);
        while (true) {
            foreach (range in ranges) {
                sphere(self.origin, range, spherecolor, 0, 1);
            }
            waitframe();
        }
    }

    // Namespace scripted_trophy / namespace_c4c5d5e9936b287c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e9b
    // Size: 0xac
    function function_a649727b9944afc2() {
        level endon("<dev string:x31>");
        self endon("<dev string:x3d>");
        self.owner endon("<dev string:x46>");
        self endon("<dev string:x1c>");
        self.var_5fddd5317487c6c3 = [];
        spherecolor = (0, 1, 0);
        while (true) {
            foreach (var_8950dc21de5cc6e8 in self.var_5fddd5317487c6c3) {
                sphere(var_8950dc21de5cc6e8, 5, spherecolor, 0, 1);
            }
            waitframe();
        }
    }

    // Namespace scripted_trophy / namespace_c4c5d5e9936b287c
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f4f
    // Size: 0x68
    function function_1e892f6dd85d5b9c(inent) {
        if (isdefined(self.var_5fddd5317487c6c3)) {
            self.var_5fddd5317487c6c3[self.var_5fddd5317487c6c3.size] = inent.origin;
            return;
        }
        self.var_5fddd5317487c6c3 = [];
        self.var_5fddd5317487c6c3[self.var_5fddd5317487c6c3.size] = inent.origin;
    }

#/
