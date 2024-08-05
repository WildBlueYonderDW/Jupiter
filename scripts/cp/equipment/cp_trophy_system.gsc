#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using script_74502a9e0ef1f19c;
#using scripts\cp\utility.gsc;
#using scripts\cp\cp_deployablebox.gsc;
#using script_1db8d0e02a99c5e2;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_7ef95bba57dc4b82;
#using script_354c862768cfe202;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_be787b38fa646463;

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b6
// Size: 0x78
function trophy_init() {
    levelstruct = spawnstruct();
    levelstruct.tags = [];
    levelstruct.tags[0] = "j_projectile_01_base";
    levelstruct.tags[1] = "j_projectile_02_base";
    levelstruct.tags[2] = "j_projectile_03_base";
    levelstruct.tags[3] = "j_projectile_04_base";
    level.trophy = levelstruct;
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x536
// Size: 0x14f
function trophy_used(grenade) {
    grenade endon("death");
    self endon("disconnect");
    thread monitordisownedequipment(self, grenade);
    stuckto = grenade waittill("missile_stuck");
    grenade setotherent(self);
    grenade setnodeploy(1);
    grenade.usedcount = 0;
    var_307667d0142f2035 = _hasperk("specialty_rugged_eqp");
    if (var_307667d0142f2035) {
        grenade.hasruggedeqp = 1;
    }
    grenade.ammo = trophy_removestored();
    if (!isdefined(grenade.ammo)) {
        grenade.ammo = 2;
    }
    ontacticalequipmentplanted(grenade, "equip_trophy");
    thread monitordisownedequipment(self, grenade);
    grenade.explosion = trophy_createexplosion(grenade);
    maxhealth = ter_op(var_307667d0142f2035, 200, 100);
    damagefeedback = ter_op(var_307667d0142f2035, "hitequip", "");
    grenade thread namespace_a0628d6954815ef8::monitordamage(maxhealth, damagefeedback, &trophy_handlefataldamage, &trophy_handledamage, 0);
    grenade thread trophy_destroyonemp();
    grenade thread trophy_destroyongameend();
    grenade thread trophy_watchprotection();
    grenade missilethermal();
    grenade missileoutline();
    grenade thread trophy_deploysequence();
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x68d
// Size: 0x63
function trophy_destroy(usedelay) {
    usedelay = istrue(usedelay);
    var_cbf7be4f62a0ddb2 = 0.1;
    if (usedelay) {
        var_cbf7be4f62a0ddb2 += 0.5;
    }
    thread trophy_delete(var_cbf7be4f62a0ddb2);
    self setscriptablepartstate("effects", "activeDestroyStart", 0);
    if (usedelay) {
        wait 0.5;
    }
    self setscriptablepartstate("effects", "activeDestroyEnd", 0);
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f8
// Size: 0x151
function trophy_delete(var_cbf7be4f62a0ddb2) {
    self notify("death");
    level.mines[self getentitynumber()] = undefined;
    self setcandamage(0);
    if (!istrue(self.issuper)) {
        self makeunusable();
        makeexplosiveunusuabletag();
    }
    self.exploding = 1;
    owner = self.owner;
    if (isdefined(self.owner) && !istrue(self.issuper)) {
        if (scripts\engine\utility::issharedfuncdefined("challenges", "onFieldUpgradeEnd")) {
            owner [[ scripts\engine\utility::getsharedfunc("challenges", "onFieldUpgradeEnd") ]]("super_trophy", self.usedcount);
        }
        owner.plantedtacticalequip = array_remove(owner.plantedtacticalequip, self);
        owner notify("trophy_update", 0);
    } else if (isdefined(self.owner)) {
        if (scripts\engine\utility::issharedfuncdefined("challenges", "onFieldUpgradeEnd")) {
            owner [[ scripts\engine\utility::getsharedfunc("challenges", "onFieldUpgradeEnd") ]]("super_trophy", self.usedcount);
        }
        owner.activesupertrophies = array_remove(owner.activesupertrophies, self);
        owner notify("trophy_update", 0);
    }
    wait var_cbf7be4f62a0ddb2;
    self delete();
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x851
// Size: 0x31
function trophy_deploysequence() {
    self endon("death");
    self setscriptablepartstate("effects", "activeDeployStart");
    wait 1.25;
    self setscriptablepartstate("effects", "activeDeployEnd");
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88a
// Size: 0x269
function trophy_watchprotection() {
    self endon("death");
    self.owner endon("disconnect");
    if (!isdefined(level.grenades)) {
        level.grenades = [];
    }
    if (!isdefined(level.missiles)) {
        level.missiles = [];
    }
    if (!isdefined(level.mines)) {
        level.mines = [];
    }
    if (!isdefined(level.mortars)) {
        level.mortars = [];
    }
    trophy_castcontents = trophy_castcontents();
    while (true) {
        castorigin = trophy_castorigin();
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
            if (isdefined(var_1ba7b2d16dc215e1) && !istrue(scripts\cp_mp\utility\player_utility::playersareenemies(self.owner, var_1ba7b2d16dc215e1))) {
                continue;
            }
            if (distancesquared(trophytarget.origin, self.origin) > trophy_modifiedprotectiondistsqr(trophytarget, 65536)) {
                continue;
            }
            castresults = physics_raycast(castorigin, trophytarget.origin, trophy_castcontents, [self, trophytarget], 0, "physicsquery_closest");
            if (isdefined(castresults) && castresults.size > 0) {
                continue;
            }
            trophy_protectionsuccessful(trophytarget);
        }
        waitframe();
    }
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xafb
// Size: 0xff
function trophy_protectionsuccessful(trophytarget) {
    trophytarget setcandamage(0);
    trophytarget.exploding = 1;
    trophytarget stopsounds();
    trophy_startcooldownlist(trophytarget);
    trophy_notifytrophytargetowner(trophytarget, "trophy_cp", self.owner);
    explorigin = trophytarget.origin;
    var_cc29543de9737588 = trophytarget.angles;
    if (isplantedequipment(trophytarget)) {
        trophytarget deleteexplosive();
    } else {
        trophytarget delete();
    }
    tag = trophy_getbesttag(explorigin);
    part = trophy_getpartbytag(tag);
    self setscriptablepartstate(part, "active", 0);
    self.explosion thread trophy_explode(explorigin, var_cc29543de9737588);
    self.usedcount++;
    self.ammo--;
    if (self.ammo <= 0) {
        thread trophy_destroy(1);
    }
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc02
// Size: 0x70
function trophy_handledamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    modifieddamage = damage;
    return modifieddamage;
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc7b
// Size: 0x31
function trophy_handlefataldamage(data) {
    attacker = data.attacker;
    trophy_givepointsfordeath(attacker);
    thread trophy_destroy();
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb4
// Size: 0x5b
function trophy_destroyonemp() {
    self endon("death");
    self.owner endon("disconnect");
    data = self waittill("emp_applied");
    attacker = data.attacker;
    trophy_givepointsfordeath(attacker);
    trophy_givedamagefeedback(attacker);
    thread trophy_destroy(1);
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd17
// Size: 0x32
function trophy_destroyongameend() {
    self endon("death");
    self.owner endon("disconnect");
    level waittill_any_2("game_ended", "bro_shot_start");
    thread trophy_destroy();
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd51
// Size: 0x32
function trophy_pickup() {
    if (self.owner namespace_4fb9dddfb8c1a67a::hasequipment("equip_trophy")) {
        self.owner trophy_addstored(self.ammo);
    }
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd8b
// Size: 0xf0
function trophy_createexplosion(trophy) {
    explosion = spawn("script_model", trophy.origin);
    explosion.killcament = trophy;
    explosion.owner = trophy.owner;
    explosion.team = trophy.team;
    explosion.equipmentref = trophy.equipmentref;
    explosion.weapon_name = trophy.weapon_name;
    explosion setotherent(explosion.owner);
    explosion setentityowner(explosion.owner);
    explosion setmodel("trophy_system_cp_explode");
    explosion.explode1available = 1;
    explosion.explode2available = 1;
    explosion thread trophy_cleanuponparentdeath(trophy, 0.1);
    return explosion;
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe84
// Size: 0x81
function trophy_explode(position, angles) {
    self dontinterpolate();
    self.origin = position;
    self.angles = angles;
    if (self.explode1available) {
        self setscriptablepartstate("explode1", "activeDirectional", 0);
        self.explode1available = 0;
        return;
    }
    if (self.explode2available) {
        self setscriptablepartstate("explode2", "activeDirectional", 0);
        self.explode1available = 0;
    }
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf0d
// Size: 0x1d
function trophy_castorigin() {
    return self.origin + anglestoup(self.angles) * 45;
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf33
// Size: 0x35
function trophy_castcontents() {
    return physics_createcontents(["physicscontents_missileclip", "physicscontents_vehicle", "physicscontents_glass", "physicscontents_water", "physicscontents_item"]);
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf71
// Size: 0xfe
function trophy_modifiedprotectiondistsqr(trophytarget, protectiondistsqr) {
    if (isdefined(trophytarget.weapon_name) && isdefined(trophytarget.owner)) {
        switch (trophytarget.weapon_name) {
        case #"hash_5b1e7be1304d43db":
        case #"hash_94c7880dca9ccc3f":
        case #"hash_b23a0686850cd666": 
            if (147456 > protectiondistsqr) {
                protectiondistsqr = 147456;
            }
            break;
        case #"hash_3e782fd775b72022":
        case #"hash_5cbb3a1a84d47f1d":
        case #"hash_6b9700922cc910a9":
        case #"hash_a05def7072d4e828":
        case #"hash_a9e31b8ffd42a67b":
        case #"hash_b5e9f2d6fac1a505":
        case #"hash_b833f98278746f9b":
        case #"hash_e704ecf8710c6f57":
        case #"hash_f55c20924061bd15": 
            if (65536 > protectiondistsqr) {
                protectiondistsqr = 65536;
            }
            break;
        }
    }
    return protectiondistsqr;
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1078
// Size: 0xe9
function trophy_checkignorelist(trophytarget) {
    weaponname = trophytarget.weapon_name;
    if (!isdefined(weaponname) && isdefined(trophytarget.weapon_object)) {
        weaponname = trophytarget.weapon_object.basename;
    }
    if (isdefined(weaponname)) {
        if (iskillstreakweapon(weaponname)) {
            return true;
        }
        switch (weaponname) {
        case #"hash_5e1fa926a475190b":
        case #"hash_5e3fa526a48eaaa5": 
            if (isplantedequipment(trophytarget)) {
                return true;
            }
            break;
        case #"hash_34f28162f0f54c6e":
        case #"hash_523f0c8fe1ead306":
        case #"hash_571e95536d9682a1":
        case #"hash_5cc52f4b3d579bc3":
        case #"hash_badacfdae124cc01":
        case #"hash_cce14c95e4764532":
        case #"hash_ffdabdde3cb352ca": 
            return true;
        }
    }
    return false;
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x116a
// Size: 0x1f
function trophy_startcooldownlist(trophytarget) {
    if (getdvarint(@"hash_75adf709a3fa32eb", 0) > 0) {
    }
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1191
// Size: 0xd6
function trophy_notifytrophytargetowner(trophytarget, trophyweaponname, trophyowner) {
    if (!isdefined(trophytarget.owner) || !isplayer(trophytarget.owner)) {
        return;
    }
    trophytarget.owner thread namespace_3d3d5211c3029f82::updatedamagefeedback("hittrophysystem");
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

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x126f
// Size: 0xe9
function trophy_getbesttag(position) {
    tags = level.trophy.tags;
    bestdot = undefined;
    besttag = undefined;
    foreach (tag in tags) {
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

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1361
// Size: 0x7c
function trophy_getpartbytag(tag) {
    tags = level.trophy.tags;
    foreach (t in tags) {
        if (t == tag) {
            return ("protect" + id + 1);
        }
    }
    return undefined;
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13e6
// Size: 0xb
function trophy_givepointsfordeath(attacker) {
    
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13f9
// Size: 0x41
function trophy_givedamagefeedback(attacker) {
    damagefeedback = "";
    if (istrue(self.hasruggedeqp)) {
        damagefeedback = "hitequip";
    }
    if (isplayer(attacker)) {
        attacker namespace_3d3d5211c3029f82::updatedamagefeedback(damagefeedback);
    }
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1442
// Size: 0x55
function trophy_addstored(ammo) {
    if (!isdefined(self.trophies)) {
        self.trophies = [];
    }
    if (self.trophies.size < trophy_maxstored()) {
        if (!isdefined(ammo)) {
            ammo = 2;
        }
        self.trophies[self.trophies.size] = ammo;
    }
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x149f
// Size: 0x5b
function trophy_removestored() {
    if (isdefined(self.trophies) && self.trophies.size > 0) {
        trophy = self.trophies[self.trophies.size - 1];
        self.trophies[self.trophies.size - 1] = undefined;
        return trophy;
    }
    return undefined;
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1503
// Size: 0xc
function trophy_clearstored() {
    self.trophies = undefined;
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1517
// Size: 0x2e
function trophy_populatestored() {
    maxcharges = 4;
    for (i = 0; i < maxcharges; i++) {
        trophy_addstored();
    }
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x154d
// Size: 0x4
function trophy_maxstored() {
    return 4;
}

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x155a
// Size: 0xed
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
        case #"hash_5e1fa926a475190b":
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

// Namespace namespace_be787b38fa646463 / scripts\cp\equipment\cp_trophy_system
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1650
// Size: 0x2b
function trophy_cleanuponparentdeath(parent, delay) {
    self endon("death");
    parent waittill("death");
    wait delay;
    self delete();
}

