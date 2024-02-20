// mwiii decomp prototype
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

#namespace namespace_273677ecfb326b82;

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a2
// Size: 0x65
function trophy_init() {
    var_2fc780a60bf174fc = spawnstruct();
    var_2fc780a60bf174fc.tags = [];
    var_2fc780a60bf174fc.tags[0] = "tag_barrel_1";
    var_2fc780a60bf174fc.tags[1] = "tag_barrel_2";
    var_2fc780a60bf174fc.tags[3] = "tag_barrel_3";
    level.trophy = var_2fc780a60bf174fc;
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60e
// Size: 0x202
function function_233602cc27d9fcf8(loc, candamage, ammocount, var_d528bb5c61e19c2f, var_c8251387149387a0) {
    trophy = magicgrenademanual("trophy_mp", loc.origin, (0, 0, 0));
    trophy.var_c5ed7e1af63fb508 = 1;
    trophy.team = "axis";
    if (isdefined(var_c8251387149387a0)) {
        trophy.team = var_c8251387149387a0;
    }
    trophy.owner = trophy;
    loc.trophy = trophy;
    trophy setscriptablepartstate("effects", "activeDeployStart");
    wait(1.25);
    trophy setscriptablepartstate("effects", "activeDeployEnd");
    if (istrue(candamage)) {
        maxhealth = 100;
        if (isdefined(var_d528bb5c61e19c2f)) {
            maxhealth = var_d528bb5c61e19c2f;
        }
        damagefeedback = "hitequip";
        if (namespace_3c37cb17ade254d::issharedfuncdefined("damage", "monitorDamage")) {
            trophy thread [[ namespace_3c37cb17ade254d::getsharedfunc("damage", "monitorDamage") ]](maxhealth, damagefeedback, &trophy_handlefataldamage, &trophy_handledamage, 0);
        }
        trophy thread trophy_destroyonemp();
    }
    if (isdefined(ammocount)) {
        trophy.var_8529009219e1ad48 = ammocount;
    }
    trophy.ammo = trophy.var_8529009219e1ad48;
    trophy.usedcount = 0;
    trophy thread trophy_destroyongameend();
    trophy.explosion = trophy_createexplosion(trophy);
    if (getdvarint(@"hash_a0495fcfca0849aa", 0) != 0) {
        /#
            if (getdvarint(@"hash_2fb6b2a16c2792d0", 0) != 0) {
                trophy thread namespace_832187ad8517bd27::function_281b0f9d6b4c66ad(45, 325, &function_9f13cc66529c6e8f, &namespace_832187ad8517bd27::function_da07fdc88865707a, 1);
            }
        #/
        trophy thread namespace_832187ad8517bd27::function_281b0f9d6b4c66ad(45, 325, &function_9f13cc66529c6e8f, &function_509f8c901a3ae35, 0);
    } else {
        trophy thread trophy_watchprotection(45, 105625, &function_9f13cc66529c6e8f, &function_509f8c901a3ae35);
    }
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x817
// Size: 0x33
function trophy_destroyongameend() {
    self endon("death");
    self.owner endon("disconnect");
    level waittill_any_2("game_ended", "bro_shot_start");
    thread trophy_destroy();
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x851
// Size: 0x4c
function trophy_destroyonemp() {
    self endon("death");
    self.owner endon("disconnect");
    data = self waittill("emp_applied");
    attacker = data.attacker;
    thread trophy_destroy(1);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a4
// Size: 0xa
function trophy_deployanimation() {
    self endon("death");
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8b5
// Size: 0x15
function trophy_remote_destroy(player) {
    trophy_destroy(1);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8d1
// Size: 0x1e
function sweeptrophy() {
    thread trophy_delete(0);
    self setscriptablepartstate("effects", "activeDestroyEnd", 0);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f6
// Size: 0x2c
function trophy_destroy(var_4fac8b8ce36e09f1) {
    thread trophy_delete(0.1, var_4fac8b8ce36e09f1);
    self setscriptablepartstate("effects", "activeDestroyEnd", 0);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x929
// Size: 0x44
function trophy_shutdownanddestroy(var_4fac8b8ce36e09f1) {
    thread trophy_delete(2.6, var_4fac8b8ce36e09f1);
    self setscriptablepartstate("effects", "activeDestroyStart", 0);
    wait(2.5);
    self setscriptablepartstate("effects", "activeDestroyEnd", 0);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x974
// Size: 0x6f
function trophy_delete(var_cbf7be4f62a0ddb2, var_4fac8b8ce36e09f1) {
    self notify("death");
    self setscriptablepartstate("hack_usable", "off");
    self setcandamage(0);
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    self.headiconid = undefined;
    self.exploding = 1;
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait(var_cbf7be4f62a0ddb2);
    }
    namespace_2a9588dfac284b77::deregisterspawn();
    self delete();
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ea
// Size: 0x263
function trophy_watchprotection(var_69e07c42d3e11801, var_5b95596970b49b4, var_b701d494f3ae184f, var_d0b9c256ce9d59f4) {
    self endon("death");
    trophy_castcontents = trophy_castcontents();
    while ([[ var_b701d494f3ae184f ]]()) {
        if (istrue(self.isdisabled)) {
            waitframe();
            continue;
        }
        var_2cc97e113610ca14 = trophy_castorigin(var_69e07c42d3e11801);
        var_c70b9adbc218860a = [];
        var_c70b9adbc218860a[0] = level.grenades;
        var_c70b9adbc218860a[1] = level.missiles;
        var_c70b9adbc218860a[2] = level.mines;
        var_c70b9adbc218860a[3] = level.mortars;
        var_9ac253c93282b297 = namespace_3c37cb17ade254d::array_combine_multiple(var_c70b9adbc218860a);
        foreach (var_1dbabe317739127e in var_9ac253c93282b297) {
            if (!isdefined(var_1dbabe317739127e)) {
                continue;
            }
            if (istrue(var_1dbabe317739127e.exploding)) {
                continue;
            }
            if (var_1dbabe317739127e == self) {
                continue;
            }
            if (trophy_checkignorelist(var_1dbabe317739127e)) {
                continue;
            }
            var_1ba7b2d16dc215e1 = var_1dbabe317739127e.owner;
            if (!isdefined(var_1ba7b2d16dc215e1) && isdefined(var_1dbabe317739127e.vehicle)) {
                var_1ba7b2d16dc215e1 = var_1dbabe317739127e.vehicle.owner;
            }
            if (!isdefined(var_1ba7b2d16dc215e1) && isdefined(var_1dbabe317739127e.weapon_name) && weaponclass(var_1dbabe317739127e.weapon_name) == "grenade") {
                var_1ba7b2d16dc215e1 = getmissileowner(var_1dbabe317739127e);
            }
            var_f31940d93afc41db = 1;
            /#
                if (getdvarint(@"hash_3c6c485214ca7673", 0) == 1) {
                    var_f31940d93afc41db = 0;
                }
            #/
            if (var_f31940d93afc41db) {
                jumpiffalse(isdefined(var_1ba7b2d16dc215e1) && !istrue(namespace_f8065cafc523dba5::playersareenemies(self, var_1ba7b2d16dc215e1))) LOC_000001e4;
            } else {
            LOC_000001e4:
                if (distancesquared(var_1dbabe317739127e.origin, self.origin) > trophy_modifiedprotectiondistsqr(var_1dbabe317739127e, var_5b95596970b49b4)) {
                    continue;
                }
                var_e021c2744cc7ed68 = physics_raycast(var_2cc97e113610ca14, var_1dbabe317739127e.origin, trophy_castcontents, [0:self, 1:var_1dbabe317739127e], 0, "physicsquery_closest");
                if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
                    continue;
                }
                self [[ var_d0b9c256ce9d59f4 ]](var_1dbabe317739127e);
            }
        }
        waitframe();
    }
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc54
// Size: 0xd
function function_9f13cc66529c6e8f() {
    return isdefined(self.owner);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc69
// Size: 0x15
function function_509f8c901a3ae35(var_1dbabe317739127e) {
    thread function_df73a01c76de4b5c(var_1dbabe317739127e);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc85
// Size: 0x68
function private function_ba83e8dc816c34b(var_1dbabe317739127e) {
    var_f081f86b3a475009 = 1;
    if (isdefined(var_1dbabe317739127e) && isdefined(var_1dbabe317739127e.weapon_name)) {
        switch (var_1dbabe317739127e.weapon_name) {
        case #"hash_85ea99fcbe4116a4":
            var_f081f86b3a475009 = 3;
            break;
        case #"hash_5c272c0617caebf0":
            var_f081f86b3a475009 = 3;
            break;
        }
    }
    return var_f081f86b3a475009;
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcf5
// Size: 0xb8
function private function_df73a01c76de4b5c(var_1dbabe317739127e) {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_end");
    if (!isdefined(self.usedcount)) {
        self.usedcount = 0;
    }
    self.usedcount++;
    var_edad871174aa4c18 = var_1dbabe317739127e.origin;
    numshots = function_ba83e8dc816c34b(var_1dbabe317739127e);
    if (self.ammo >= numshots) {
        function_477783276ea16601(var_1dbabe317739127e);
        logtrophysuccesful(var_1dbabe317739127e);
    }
    for (i = 0; i < numshots; i++) {
        childthread function_363a32a7a77c9fe0(var_edad871174aa4c18, i);
        wait(0.2);
    }
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdb4
// Size: 0x10a
function private function_363a32a7a77c9fe0(var_1dbabe317739127e, shotnum) {
    if (self.ammo <= 0) {
        thread trophy_shutdownanddestroy(0);
        return 0;
    }
    var_d7030318ca9e674a = var_1dbabe317739127e;
    if (shotnum > 1) {
        var_d7030318ca9e674a = function_b2e78337c5df1c34(var_d7030318ca9e674a);
    }
    tag = trophy_getbesttag(var_d7030318ca9e674a);
    part = trophy_getpartbytag(tag);
    self setscriptablepartstate(part, "active", 0);
    var_1331aefd6d9a100 = vectortoangles(self gettagorigin(tag) - var_d7030318ca9e674a);
    var_cc29543de9737588 = combineangles(var_1331aefd6d9a100, (-90, 0, 0));
    self.explosion thread trophy_explode(var_d7030318ca9e674a, var_cc29543de9737588);
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

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xec5
// Size: 0x10f
function private function_b2e78337c5df1c34(var_5c1a8852fefebef5) {
    var_f95c4b9d1740f23b = 0.05;
    var_e5006c8cd0e8153a = randomfloatrange(0.9, 1.1);
    var_8413896733593a21 = randomfloatrange(0.9, 1.1);
    var_ab91c9ec1fae3ab8 = randomfloatrange(0.8, 1.2);
    x = var_5c1a8852fefebef5[0];
    y = var_5c1a8852fefebef5[1];
    z = var_5c1a8852fefebef5[2];
    var_b5c4765694e99f2a = x * var_e5006c8cd0e8153a;
    var_7898d81eae47ece1 = y * var_8413896733593a21;
    z_delta = z * var_ab91c9ec1fae3ab8;
    if (abs(x - var_b5c4765694e99f2a) < x * var_f95c4b9d1740f23b) {
        var_b5c4765694e99f2a = var_b5c4765694e99f2a + var_b5c4765694e99f2a * var_f95c4b9d1740f23b;
    }
    if (abs(y - var_7898d81eae47ece1) < y * var_f95c4b9d1740f23b) {
        var_7898d81eae47ece1 = var_7898d81eae47ece1 + var_7898d81eae47ece1 * var_f95c4b9d1740f23b;
    }
    if (abs(z - z_delta) < z * var_f95c4b9d1740f23b) {
        z_delta = z_delta + z_delta * var_f95c4b9d1740f23b;
    }
    return (var_b5c4765694e99f2a, var_7898d81eae47ece1, z_delta);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfdc
// Size: 0x131
function function_477783276ea16601(var_1dbabe317739127e) {
    var_1dbabe317739127e setcandamage(0);
    var_1dbabe317739127e.exploding = 1;
    var_1dbabe317739127e stopsounds();
    attacker = undefined;
    if (isdefined(var_1dbabe317739127e.owner)) {
        attacker = var_1dbabe317739127e.owner;
    }
    var_d7030318ca9e674a = var_1dbabe317739127e.origin;
    var_cc29543de9737588 = var_1dbabe317739127e.angles;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("equipment", "isPlantedEquipment")) {
        if ([[ namespace_3c37cb17ade254d::getsharedfunc("equipment", "isPlantedEquipment") ]](var_1dbabe317739127e)) {
            if (namespace_3c37cb17ade254d::issharedfuncdefined("equipment", "deleteExplosive")) {
                var_1dbabe317739127e [[ namespace_3c37cb17ade254d::getsharedfunc("equipment", "deleteExplosive") ]]();
            }
        } else {
            var_1dbabe317739127e delete();
        }
    } else {
        var_1dbabe317739127e delete();
    }
    self.explosion thread trophy_explode(var_d7030318ca9e674a, var_cc29543de9737588);
    if (!isdefined(self.var_780fcd96e8f599e0)) {
        self.var_780fcd96e8f599e0 = 0;
    }
    self.var_780fcd96e8f599e0++;
    if (isdefined(attacker)) {
        level notify("trophyused", attacker);
        attacker thread namespace_e072c8407b2a861c::updatedamagefeedback("hittrophysystem");
    }
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1114
// Size: 0x1a
function function_8a10502da0ded9ab() {
    self endon("death");
    function_87f41f420ea77fa();
    thread trophy_shutdownanddestroy(0);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1135
// Size: 0xa
function function_87f41f420ea77fa() {
    level endon("game_ended");
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1146
// Size: 0x71
function trophy_handledamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    modifieddamage = damage;
    return modifieddamage;
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11bf
// Size: 0x4b
function trophy_handlefataldamage(data) {
    if (isdefined(data.attacker) && isplayer(data.attacker)) {
        trophy_givepointsfordeath(data.attacker);
    }
    thread trophy_destroy(1);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1211
// Size: 0x26
function trophy_givepointsfordeath(attacker) {
    attacker notify("destroyed_equipment");
    attacker thread namespace_53fc9ddbb516e6e1::function_e800498086e36c29(#"destroyed_equipment");
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x123e
// Size: 0x20
function trophy_applyempcallback(data) {
    data.victim thread function_ef909a912567cbd8(data);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1265
// Size: 0x3e
function function_fa497ea83e7adc8c(data) {
    data.victim trophy_givepointsfordeath(data.attacker);
    data.victim thread trophy_destroy(1);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12aa
// Size: 0x52
function function_ef909a912567cbd8(data) {
    self endon("death");
    self.isdisabled = 1;
    self setscriptablepartstate("empd", "active", 0);
    wait(6);
    self.isdisabled = 0;
    self setscriptablepartstate("empd", "neutral", 0);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1303
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

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ee
// Size: 0x78
function trophy_explode(position, angles) {
    self dontinterpolate();
    self.origin = position;
    self.angles = angles;
    if (istrue(self.explode1available)) {
        self setscriptablepartstate("explode1", "activeDirectional", 0);
        self.explode1available = 0;
    } else {
        self setscriptablepartstate("explode2", "activeDirectional", 0);
        self.explode1available = 1;
    }
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146d
// Size: 0x26
function trophy_castorigin(var_69e07c42d3e11801) {
    return self.origin + anglestoup(self.angles) * var_69e07c42d3e11801;
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x149b
// Size: 0x36
function trophy_castcontents() {
    return physics_createcontents([0:"physicscontents_missileclip", 1:"physicscontents_vehicle", 2:"physicscontents_glass", 3:"physicscontents_water", 4:"physicscontents_item"]);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d9
// Size: 0xba
function trophy_modifiedprotectiondistsqr(var_1dbabe317739127e, var_5b95596970b49b4) {
    if (isdefined(var_1dbabe317739127e.weapon_name) && isdefined(var_1dbabe317739127e.owner)) {
        switch (var_1dbabe317739127e.classname) {
        case #"hash_4af55147c6098215":
            if (211250 > var_5b95596970b49b4) {
                var_5b95596970b49b4 = 211250;
            }
            break;
        case #"hash_8b48887639da2db5":
            if (126750 > var_5b95596970b49b4) {
                var_5b95596970b49b4 = 126750;
            }
            break;
        }
        switch (var_1dbabe317739127e.weapon_name) {
        case #"hash_c500a77b6bb7c5d0":
            if (126750 > var_5b95596970b49b4) {
                var_5b95596970b49b4 = 126750;
            }
            break;
        }
    }
    return var_5b95596970b49b4;
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x159b
// Size: 0x1fe
function trophy_checkignorelist(var_1dbabe317739127e) {
    if (isdefined(var_1dbabe317739127e.bundle)) {
        if (istrue(var_1dbabe317739127e.bundle.var_c3333778ec49a2c)) {
            return 1;
        }
    }
    weaponname = var_1dbabe317739127e.weapon_name;
    if (!isdefined(weaponname) && isdefined(var_1dbabe317739127e.weapon_object)) {
        weaponname = var_1dbabe317739127e.weapon_object.basename;
    }
    if (isdefined(var_1dbabe317739127e.var_835d1cd2262dad74)) {
        return 1;
    }
    if (isdefined(weaponname)) {
        if (iskillstreakweapon(weaponname) && weaponname != "cruise_proj_mp" && weaponname != "chopper_gunner_proj_mp" && !issubstr(weaponname, "missile_turret_proj")) {
            return 1;
        }
        if (isdefined(var_1dbabe317739127e.weapon_object) && weapon::function_6faaa2882e3d2e4e(var_1dbabe317739127e.weapon_object)) {
            return 1;
        }
        switch (weaponname) {
        case #"hash_5e3fa526a48eaaa5":
            if (namespace_3c37cb17ade254d::issharedfuncdefined("equipment", "isPlantedEquipment")) {
                if ([[ namespace_3c37cb17ade254d::getsharedfunc("equipment", "isPlantedEquipment") ]](var_1dbabe317739127e)) {
                    return 1;
                }
            }
            break;
        case #"hash_1a30d3a1753a5b6":
        case #"hash_22f1c67a16accbe":
        case #"hash_34f28162f0f54c6e":
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
            return 1;
            break;
        }
    }
    return 0;
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x17a1
// Size: 0xd6
function trophy_notifytrophytargetowner(var_1dbabe317739127e, var_c1d3b25c841af510, var_6b21ea0780aa76fe) {
    if (!isdefined(var_1dbabe317739127e.owner) || !isplayer(var_1dbabe317739127e.owner)) {
        return;
    }
    var_1dbabe317739127e.owner updatedamagefeedback("hittrophysystem");
    if (isdefined(var_1dbabe317739127e.weapon_name)) {
        switch (var_1dbabe317739127e.weapon_name) {
        case #"hash_5b1e7be1304d43db":
        case #"hash_94c7880dca9ccc3f":
        case #"hash_b23a0686850cd666":
            var_1dbabe317739127e.owner notify("destroyed_by_trophy", var_6b21ea0780aa76fe);
            break;
        }
    }
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x187e
// Size: 0xee
function trophy_getbesttag(position) {
    tags = level.trophy.tags;
    bestdot = undefined;
    var_5d32298b837dff31 = undefined;
    foreach (id, tag in tags) {
        origin = self gettagorigin(tag);
        angles = self gettagangles(tag);
        forward = anglestoforward(angles);
        dot = vectordot(vectornormalize(position - origin), forward);
        if (id == 0 || dot > bestdot) {
            bestdot = dot;
            var_5d32298b837dff31 = tag;
        }
    }
    return var_5d32298b837dff31;
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1974
// Size: 0x81
function trophy_getpartbytag(tag) {
    tags = level.trophy.tags;
    foreach (id, t in tags) {
        if (t == tag) {
            return ("barrel" + id + 1);
        }
    }
    return undefined;
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19fd
// Size: 0x11
function trophy_getdeployanimtime() {
    return getanimlength(scriptables%wm_trophy_system_deploy_landing);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a16
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

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1a5f
// Size: 0xe2
function trophy_modifieddamage(attacker, victim, sweapon, damage, var_6cac94b6632aa667) {
    if (!isdefined(sweapon)) {
        return [0:damage, 1:var_6cac94b6632aa667];
    }
    if (damage == 0) {
        return [0:damage, 1:var_6cac94b6632aa667];
    }
    var_512d1bc7add3eaa3 = undefined;
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        switch (sweapon) {
        case #"hash_5e3fa526a48eaaa5":
        case #"hash_6f08e94ea93bfaf9":
        case #"hash_f085b57dce639767":
            maxhealth = getdvarint(@"hash_b1d561f9a9241e09", 100);
            var_512d1bc7add3eaa3 = 0.66 * maxhealth;
            break;
        }
    }
    var_b85ff186894ba31e = var_6cac94b6632aa667;
    if (isdefined(var_512d1bc7add3eaa3)) {
        var_b85ff186894ba31e = var_512d1bc7add3eaa3 - damage;
    }
    var_b85ff186894ba31e = min(var_b85ff186894ba31e, var_6cac94b6632aa667);
    return [0:damage, 1:var_b85ff186894ba31e];
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b49
// Size: 0x2c
function trophy_cleanuponparentdeath(parent, delay) {
    self endon("death");
    parent waittill("death");
    wait(delay);
    self delete();
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7c
// Size: 0xc1
function logtrophysuccesful(var_1dbabe317739127e) {
    if (!isdefined(var_1dbabe317739127e)) {
        return;
    }
    if (!isdefined(self.deployingplayer)) {
        return;
    }
    if (isdefined(var_1dbabe317739127e.owner) && !isplayer(var_1dbabe317739127e.owner)) {
        return;
    }
    if (isdefined(var_1dbabe317739127e.weapon_object)) {
        weaponname = getweaponrootname(var_1dbabe317739127e.weapon_object);
    } else {
        return;
    }
    if (!isdefined(weaponname)) {
        return;
    }
    dlog_recordevent("dlog_event_trophy_successful", [0:"deploying_player", 1:self.deployingplayer, 2:"grenade_owner", 3:var_1dbabe317739127e.owner, 4:"negated_target", 5:weaponname]);
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c44
// Size: 0x16
function function_b96541d92295c9ca() {
    /#
        thread function_d146ac9c9d0a4f24();
        thread function_a649727b9944afc2();
    #/
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c61
// Size: 0xe
function function_194a2d4a0c7509ea() {
    /#
        self notify("hittrophysystem");
    #/
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c76
// Size: 0x10d
function function_d146ac9c9d0a4f24() {
    /#
        level endon("barrel");
        self endon("<unknown string>");
        self.owner endon("<unknown string>");
        self endon("hittrophysystem");
        var_98346911a72d33e1 = 105625;
        var_6e0ae1d28b9e917d = 126750;
        var_6e0aded28b9e8ae4 = 211250;
        var_98346911a72d33e1 = sqrt(var_98346911a72d33e1);
        var_6e0ae1d28b9e917d = sqrt(var_6e0ae1d28b9e917d);
        var_6e0aded28b9e8ae4 = sqrt(var_6e0aded28b9e8ae4);
        ranges = [];
        ranges[0] = var_98346911a72d33e1;
        ranges[1] = var_6e0ae1d28b9e917d;
        ranges[2] = var_6e0aded28b9e8ae4;
        var_fc62075a9f6e7cab = (1, 0, 0);
        while (1) {
            foreach (range in ranges) {
                sphere(self.origin, range, var_fc62075a9f6e7cab, 0, 1);
            }
            waitframe();
        }
    #/
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d8a
// Size: 0xaf
function function_a649727b9944afc2() {
    /#
        level endon("barrel");
        self endon("<unknown string>");
        self.owner endon("<unknown string>");
        self endon("hittrophysystem");
        self.var_5fddd5317487c6c3 = [];
        var_fc62075a9f6e7cab = (0, 1, 0);
        while (1) {
            foreach (var_8950dc21de5cc6e8 in self.var_5fddd5317487c6c3) {
                sphere(var_8950dc21de5cc6e8, 5, var_fc62075a9f6e7cab, 0, 1);
            }
            waitframe();
        }
    #/
}

// Namespace namespace_273677ecfb326b82/namespace_c4c5d5e9936b287c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e40
// Size: 0x69
function function_1e892f6dd85d5b9c(var_8e101ea21f6c5f4f) {
    /#
        if (isdefined(self.var_5fddd5317487c6c3)) {
            self.var_5fddd5317487c6c3[self.var_5fddd5317487c6c3.size] = var_8e101ea21f6c5f4f.origin;
        } else {
            self.var_5fddd5317487c6c3 = [];
            self.var_5fddd5317487c6c3[self.var_5fddd5317487c6c3.size] = var_8e101ea21f6c5f4f.origin;
        }
    #/
}

