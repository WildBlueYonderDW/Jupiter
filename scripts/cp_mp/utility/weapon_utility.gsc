// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;

#namespace namespace_45ecbe78f599af72;

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ca
// Size: 0x6a
function _magicbullet(objweapon, start, end, owner, var_2dd9a5ae31ca66c1) {
    /#
        assertex(!isstring(objweapon), "_magicBullet() called with a string instead of a weapon object.");
    #/
    missile = magicbullet(objweapon, start, end, owner, var_2dd9a5ae31ca66c1);
    if (isdefined(missile) && isdefined(owner)) {
        missile setotherent(owner);
    }
    return missile;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63c
// Size: 0xa8
function islockonlauncher(objweapon) {
    var_149a0fe48b2f9247 = undefined;
    basename = undefined;
    if (isstring(objweapon)) {
        basename = objweapon;
    } else {
        basename = objweapon.basename;
    }
    switch (basename) {
    case #"hash_13a265ac820ea0df":
    case #"hash_3e782fd775b72022":
    case #"hash_5c272c0617caebf0":
    case #"hash_5cbb3a1a84d47f1d":
    case #"hash_6b9700922cc910a9":
    case #"hash_a9e31b8ffd42a67b":
        var_149a0fe48b2f9247 = 1;
        break;
    default:
        var_149a0fe48b2f9247 = 0;
        break;
    }
    return var_149a0fe48b2f9247;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ec
// Size: 0xf6
function addlockedon(entity, attacker) {
    if (!isdefined(entity.islockedon)) {
        entity.islockedon = 0;
        entity.attackerslockedon = [];
    }
    if (entity.islockedon == 0) {
        if (isdefined(entity.lockedoncallback)) {
            entity thread [[ entity.lockedoncallback ]]();
        }
    }
    if (isdefined(attacker)) {
        /#
            assertex(!isdefined(attacker.entlockedonto), "addLockedOn called on an attacker that is already locked on to another entity.");
        #/
        attacker.entlockedonto = entity;
        /#
            assertex(!isdefined(entity.attackerslockedon[attacker getentitynumber()]), "addLockedOn called on an attacker that is already locked on to THIS entity.");
        #/
        entity.attackerslockedon[attacker getentitynumber()] = attacker;
        if (isplayer(attacker)) {
            attacker function_f3bb4f4911a1beb2("game", "clearSpawnProtection");
        }
    }
    entity.islockedon++;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e9
// Size: 0xb7
function removelockedon(entity, attacker) {
    if (!isdefined(entity.islockedon)) {
        return;
    }
    /#
        assert(islockedonto(entity), "removeLockedOn called on an entity that is not locked onto.");
    #/
    if (entity.islockedon == 1) {
        if (isdefined(entity.lockedonremovedcallback)) {
            entity thread [[ entity.lockedonremovedcallback ]]();
        }
    }
    if (isdefined(attacker)) {
        if (isdefined(attacker.entlockedonto) && attacker.entlockedonto == entity) {
            attacker.entlockedonto = undefined;
        }
        entity.attackerslockedon[attacker getentitynumber()] = undefined;
    }
    entity.islockedon--;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a7
// Size: 0x21
function setlockedoncallback(entity, lockedoncallback) {
    entity.lockedoncallback = lockedoncallback;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cf
// Size: 0x21
function setlockedonremovedcallback(entity, lockedonremovedcallback) {
    entity.lockedonremovedcallback = lockedonremovedcallback;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f7
// Size: 0x132
function clearlockedon(entity) {
    entity notify("clearLockedOn");
    if (islockedonto(entity)) {
        if (isdefined(entity.lockedonremovedcallback)) {
            entity thread [[ entity.lockedonremovedcallback ]]();
        }
        foreach (attacker in entity.attackerslockedon) {
            if (isdefined(attacker)) {
                if (isdefined(attacker.entlockedonto) && attacker.entlockedonto == entity) {
                    attacker.entlockedonto = undefined;
                }
            }
        }
    }
    entity.islockedon = undefined;
    entity.attackerslockedon = undefined;
    entity.lockedoncallback = undefined;
    entity.lockedonremovedcallback = undefined;
    if (hasincoming(entity)) {
        if (isdefined(entity.incomingremovedcallback)) {
            entity thread [[ entity.incomingremovedcallback ]]();
        }
    }
    entity.hasincoming = undefined;
    entity.incomingcallback = undefined;
    entity.incomingremovedcallback = undefined;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa30
// Size: 0x34
function clearlockedonondisconnect(player) {
    if (isdefined(self.entlockedonto)) {
        removelockedon(self.entlockedonto, self);
    }
    self.entlockedonto = undefined;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6b
// Size: 0x29
function islockedonto(entity) {
    return isdefined(entity.islockedon) && entity.islockedon > 0;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9c
// Size: 0x6d
function function_97db16de04046c2b(inflictor, victim, var_1189bd7fbe2861f8) {
    if (isdefined(inflictor)) {
        if (isdefined(inflictor.equipmentref) && isdefined(var_1189bd7fbe2861f8) && inflictor.equipmentref != var_1189bd7fbe2861f8) {
            return 0;
        }
        if (isdefined(inflictor.stuckto) && inflictor.stuckto == victim) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb11
// Size: 0x16
function function_605b121f1fadd46c(allowed) {
    self.var_605b121f1fadd46c = allowed;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2e
// Size: 0x1c
function function_acc627f597d5b2cf() {
    if (isdefined(self.var_605b121f1fadd46c)) {
        return self.var_605b121f1fadd46c;
    }
    return 1;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb52
// Size: 0x2a
function function_f18dbd353f3e1570(entity) {
    return isdefined(entity.var_f2f04bcc448fab3a) && entity.var_f2f04bcc448fab3a.size > 0;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb84
// Size: 0x21
function function_53fd22613ea65204(entity, var_5ec2da3d1d27e716) {
    entity.var_5ec2da3d1d27e716 = var_5ec2da3d1d27e716;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbac
// Size: 0x21
function function_b55a664e824540d2(entity, var_218d5fb97d94f2c) {
    entity.var_218d5fb97d94f2c = var_218d5fb97d94f2c;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd4
// Size: 0x69
function function_69d45a21a6d4e9f8(entity, ownerteam) {
    if (!isdefined(entity.var_f2f04bcc448fab3a)) {
        entity.var_f2f04bcc448fab3a = [];
    }
    entity.var_f2f04bcc448fab3a[entity.var_f2f04bcc448fab3a.size] = ownerteam;
    if (isdefined(entity.var_5ec2da3d1d27e716)) {
        entity thread [[ entity.var_5ec2da3d1d27e716 ]]();
    }
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc44
// Size: 0x117
function function_28e583bfecc38a25(entity, ownerteam) {
    if (!isdefined(entity.var_f2f04bcc448fab3a)) {
        return;
    }
    /#
        assert(function_f18dbd353f3e1570(entity), "removeBunkerBusterAttached called on an entity that does not have bunkerbusters attached.");
    #/
    teams = entity.var_f2f04bcc448fab3a;
    entity.var_f2f04bcc448fab3a = [];
    removed = 0;
    foreach (team in teams) {
        if (!removed && team == ownerteam) {
            removed = 1;
        } else {
            entity.var_f2f04bcc448fab3a[entity.var_f2f04bcc448fab3a.size] = team;
        }
    }
    if (entity.var_f2f04bcc448fab3a.size == 0) {
        entity.var_f2f04bcc448fab3a = undefined;
    }
    if (isdefined(entity.var_218d5fb97d94f2c)) {
        entity thread [[ entity.var_218d5fb97d94f2c ]]();
    }
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd62
// Size: 0x63
function addincoming(entity) {
    if (!isdefined(entity.hasincoming)) {
        entity.hasincoming = 0;
    }
    if (entity.hasincoming == 0) {
        if (isdefined(entity.incomingcallback)) {
            entity thread [[ entity.incomingcallback ]]();
        }
    }
    entity.hasincoming++;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcc
// Size: 0x6d
function removeincoming(entity) {
    if (!isdefined(entity.hasincoming)) {
        return;
    }
    /#
        assert(hasincoming(entity), "removeIncoming called on an entity that does not have incoming.");
    #/
    if (entity.hasincoming == 1) {
        if (isdefined(entity.incomingremovedcallback)) {
            entity thread [[ entity.incomingremovedcallback ]]();
        }
    }
    entity.hasincoming--;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe40
// Size: 0x10a
function function_f19f8b4cf085ecbd(objweapon) {
    self endon("death");
    self endon("disconnect");
    var_f24845eeaeedc946 = namespace_e0ee43ef2dddadaa::getgrenadeinpullback();
    if (isdefined(var_f24845eeaeedc946) && !isnullweapon(var_f24845eeaeedc946)) {
        return 0;
    }
    /#
        assert(isweapon(objweapon), "giveAndFireOffhandReliable() requires a weapon object");
    #/
    if (!isweapon(objweapon)) {
        if (isstring(objweapon)) {
            objweapon = makeweapon(objweapon);
        }
    }
    if (!isweapon(objweapon)) {
        self notify("giveAndFireOffhandReliableFailed", objweapon);
        return 0;
    }
    self giveandfireoffhand(objweapon);
    if (!self hasweapon(objweapon)) {
        self notify("giveAndFireOffhandReliableFailed", objweapon);
        return 0;
    }
    result = spawnstruct();
    result childthread function_8ea8b6459d144947(self, objweapon);
    result childthread function_158897145d2efb26(self, objweapon);
    result waittill("race_start");
    waittillframeend();
    result notify("race_end");
    if (istrue(result.success)) {
        self notify("giveAndFireOffhandReliableSucceeded", objweapon);
        return 1;
    } else if (istrue(result.failure)) {
        self notify("giveAndFireOffhandReliableFailed", objweapon);
        return 0;
    }
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf51
// Size: 0x39
function function_8ea8b6459d144947(player, objweapon) {
    self endon("race_end");
    player waittillmatch("offhand_fired", objweapon);
    self.success = 1;
    self notify("race_start");
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf91
// Size: 0x72
function function_158897145d2efb26(player, objweapon) {
    self endon("race_end");
    timeelapsed = 0;
    while (player hasweapon(objweapon) && timeelapsed < 5) {
        waitframe();
        timeelapsed = timeelapsed + level.framedurationseconds;
    }
    if (player hasweapon(objweapon)) {
        player takeweapon(objweapon);
    }
    self.failure = 1;
    self notify("race_start");
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100a
// Size: 0x21
function setincomingcallback(entity, incomingcallback) {
    entity.incomingcallback = incomingcallback;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1032
// Size: 0x21
function setincomingremovedcallback(entity, incomingremovedcallback) {
    entity.incomingremovedcallback = incomingremovedcallback;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105a
// Size: 0x29
function hasincoming(entity) {
    return isdefined(entity.hasincoming) && entity.hasincoming > 0;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108b
// Size: 0x52
function watchtargetlockedontobyprojectile(target, projectile) {
    target endon("clearLockedOn");
    addlockedon(target);
    addincoming(target);
    projectile waittill_any_2("death", "clearTargetLockedOntoByProjectile");
    if (isdefined(target)) {
        removelockedon(target);
        removeincoming(target);
    }
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e4
// Size: 0x14
function clearprojectilelockedon(projectile) {
    projectile notify("clearTargetLockedOntoByProjectile");
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ff
// Size: 0x2ea
function dropweaponfordeathlaunch(item, var_cf4209c200f8bbf4, damage, angles) {
    if (item physics_getnumbodies() == 0) {
        return;
    }
    if (!isdefined(angles)) {
        angles = self.angles;
    }
    if (!isdefined(damage)) {
        damage = 0;
    }
    var_198b31bba82c76d5 = math::normalize_value(0, 200, damage);
    if (isdefined(var_cf4209c200f8bbf4) && var_cf4209c200f8bbf4 == "weapon_melee2") {
        var_4148f5f633bfcf19 = randomfloatrange(25, 100);
        var_5de19bfa9bb86f0c = randomfloatrange(75, 175);
        var_b8a13f3af0cbe01b = math::factor_value(450, 800, var_198b31bba82c76d5);
        var_eac2b0512d0b1c55 = math::factor_value(-7 / 6, -5 / 6, var_198b31bba82c76d5);
        var_8282854ec42283a2 = math::factor_value(0.125, 0.183333, var_198b31bba82c76d5);
    } else if (isdefined(var_cf4209c200f8bbf4) && var_cf4209c200f8bbf4 == "weapon_pistol") {
        var_4148f5f633bfcf19 = randomfloatrange(100, 200);
        var_5de19bfa9bb86f0c = randomfloatrange(150, 250);
        var_b8a13f3af0cbe01b = math::factor_value(950, 1300, var_198b31bba82c76d5);
        var_eac2b0512d0b1c55 = math::factor_value(-7 / 4, -5 / 4, var_198b31bba82c76d5);
        var_8282854ec42283a2 = math::factor_value(0.5625, 0.825, var_198b31bba82c76d5);
    } else {
        var_4148f5f633bfcf19 = randomfloatrange(150, 350);
        var_5de19bfa9bb86f0c = randomfloatrange(150, 250);
        var_b8a13f3af0cbe01b = math::factor_value(950, 1300, var_198b31bba82c76d5);
        var_eac2b0512d0b1c55 = math::factor_value(-7, -5, var_198b31bba82c76d5);
        var_8282854ec42283a2 = math::factor_value(0.75, 1.1, var_198b31bba82c76d5);
    }
    if (cointoss()) {
        var_5de19bfa9bb86f0c = var_5de19bfa9bb86f0c * -1;
    }
    if (!isdefined(item)) {
        /#
            println("_");
        #/
        return;
    }
    var_2e3a4c6faf317522 = item physics_getentitycenterofmass();
    if (isdefined(var_2e3a4c6faf317522)) {
        var_2e3a4c6faf317522 = var_2e3a4c6faf317522["unscaled"];
    } else {
        var_2e3a4c6faf317522 = item.origin;
    }
    launchvelocity = (0, 0, 0);
    launchvelocity = launchvelocity + anglestoforward(angles) * var_4148f5f633bfcf19;
    launchvelocity = launchvelocity + anglestoright(angles) * var_5de19bfa9bb86f0c;
    launchvelocity = launchvelocity + anglestoup(angles) * var_b8a13f3af0cbe01b;
    var_9cbcd63169ebe6b9 = item gettagangles("tag_flash", 1);
    if (!isdefined(var_9cbcd63169ebe6b9)) {
        var_9cbcd63169ebe6b9 = item.angles;
    }
    if (cointoss()) {
        var_8282854ec42283a2 = var_8282854ec42283a2 * -1;
    }
    var_51c1b45046e1647c = var_2e3a4c6faf317522;
    var_51c1b45046e1647c = var_51c1b45046e1647c + anglestoforward(var_9cbcd63169ebe6b9) * var_eac2b0512d0b1c55;
    var_51c1b45046e1647c = var_51c1b45046e1647c + anglestoright(var_9cbcd63169ebe6b9) * var_8282854ec42283a2;
    logprint("PhysicsLaunchServerItem");
    logprint("item.classname = " + item.classname);
    logprint("launchOrigin   = " + var_51c1b45046e1647c);
    logprint("launchVelocity = " + launchvelocity);
    item physicslaunchserveritem(var_51c1b45046e1647c, launchvelocity);
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f0
// Size: 0xf3
function isbulletweapon(weapon) {
    if (!isdefined(weapon)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return 0;
    }
    if (isweapon(weapon) && isnullweapon(weapon)) {
        return 0;
    }
    if (isstring(weapon) && weapon == "none") {
        return 0;
    }
    if (isriotshield(weapon) || isknifeonly(weapon)) {
        return 0;
    }
    if (isdefined(weapon.inventorytype) && weapon.inventorytype == "model_only") {
        return 0;
    }
    switch (weaponclass(weapon)) {
    case #"hash_690c0d6a821b42e":
    case #"hash_6191aaef9f922f96":
    case #"hash_719417cb1de832b6":
    case #"hash_8cdaf2e4ecfe5b51":
    case #"hash_900cb96c552c5e8e":
    case #"hash_fa24dff6bd60a12d":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ea
// Size: 0xd6
function function_102d677621400199(weapon) {
    if (!isdefined(weapon)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return 0;
    }
    if (isweapon(weapon) && isnullweapon(weapon)) {
        return 0;
    }
    if (isstring(weapon) && weapon == "none") {
        return 0;
    }
    if (isriotshield(weapon) || isknifeonly(weapon)) {
        return 0;
    }
    if (isdefined(weapon.inventorytype) && weapon.inventorytype == "model_only") {
        return 0;
    }
    if (!isdefined(weapon.basename)) {
        return 0;
    }
    var_496432274d3ca31e = strtok(weapon.basename, "_");
    if (isdefined(var_496432274d3ca31e) && array_contains(var_496432274d3ca31e, "la")) {
        return 1;
    }
    return 0;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c8
// Size: 0xc2
function function_38642db3c423bcdc(weapon) {
    if (getdvarint(@"hash_86c5f9dae77ee49e", 1) == 0) {
        return 0;
    }
    var_1bae199ae2509f57 = [0:"riotshield", 1:"iw9_me_riotshield_mp", 2:"iw9_la_juliet_mp", 3:"iw9_la_gromeo_mp", 4:"iw9_me_sword01_mp"];
    if (isweapon(weapon) && isnullweapon(weapon)) {
        return 0;
    }
    if (isstring(weapon) && weapon == "none") {
        return 0;
    }
    var_3f481ef57656312c = weapon.basename;
    for (i = 0; i < var_1bae199ae2509f57.size; i++) {
        if (var_1bae199ae2509f57[i] == var_3f481ef57656312c) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1692
// Size: 0x43
function isriotshield(weapon) {
    if (isweapon(weapon) && isnullweapon(weapon)) {
        return 0;
    }
    if (isstring(weapon) && weapon == "none") {
        return 0;
    }
    return weapontype(weapon) == "riotshield";
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16dd
// Size: 0x51
function isknifeonly(weapon) {
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon);
    isknife = namespace_e0ee43ef2dddadaa::function_b8811a0fc04e4b9d(rootname, #"isknife", 0);
    return isknife || rootname == "iw9_me_knife" || rootname == "jup_jp23_me_knife";
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1736
// Size: 0x8a
function function_cfac6d60b7a14ab9(weapon) {
    if (!isdefined(weapon) || !isdefined(weapon.basename)) {
        return 0;
    }
    basename = weapon.basename;
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon);
    var_727d88e47223b87d = namespace_e0ee43ef2dddadaa::function_b8811a0fc04e4b9d(rootname, #"hash_dde08416ce76e9f9", 0);
    return var_727d88e47223b87d || basename == "iw9_me_knife_mp" || basename == "iw9_knifestab_mp" || basename == "iw9_me_sword01_mp";
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c8
// Size: 0x51
function saveweaponstates() {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("weapons", "saveToggleScopeStates")) {
        self [[ namespace_3c37cb17ade254d::getsharedfunc("weapons", "saveToggleScopeStates") ]]();
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("weapons", "saveAltStates")) {
        self [[ namespace_3c37cb17ade254d::getsharedfunc("weapons", "saveAltStates") ]]();
    }
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1820
// Size: 0x68
function restoreweaponstates(lastweaponobj) {
    if (self isalternatemode(lastweaponobj)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("weapons", "updateSavedAltState")) {
            lastweaponobj = self [[ namespace_3c37cb17ade254d::getsharedfunc("weapons", "updateSavedAltState") ]](lastweaponobj);
        }
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("weapons", "updateToggleScopeState")) {
        self [[ namespace_3c37cb17ade254d::getsharedfunc("weapons", "updateToggleScopeState") ]](lastweaponobj);
    }
    return lastweaponobj;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1890
// Size: 0x1ce
function function_c9e5c511b923a42f(idamage, attacker, victim, smeansofdeath, shitloc, inflictor, vpoint, var_1da1a66b5c6a06a7, var_986b2e0350629522, var_25359c8e0b5022a5) {
    if (isdefined(level.var_b39eda08d7912835)) {
        var_78b43647bc863f62 = "";
        if (isexplosivedamagemod(smeansofdeath) && isdefined(victim.origin)) {
            var_dd2fc1bd72af4b7d = vpoint;
            if (isdefined(inflictor) && isdefined(inflictor.origin)) {
                var_dd2fc1bd72af4b7d = inflictor.origin;
            }
            var_78b43647bc863f62 = " EXPL_DIST: " + int(distance(var_dd2fc1bd72af4b7d, victim.origin));
        } else if (isdefined(vpoint)) {
            var_78b43647bc863f62 = " DIST:" + int(distance(attacker.origin, vpoint));
        }
        var_fb25ff31e4e88929 = "";
        if (isdefined(var_1da1a66b5c6a06a7) && var_1da1a66b5c6a06a7 > 0) {
            var_fb25ff31e4e88929 = " ArmorDmg: " + var_1da1a66b5c6a06a7;
        } else if (isdefined(var_986b2e0350629522) && var_986b2e0350629522 > 0) {
            var_fb25ff31e4e88929 = " ArmorDmg: " + var_986b2e0350629522;
        }
        var_9eaea3d379e435ad = "";
        if (isdefined(var_25359c8e0b5022a5) && var_25359c8e0b5022a5 > 0) {
            var_9eaea3d379e435ad = " HelmetDmg: " + var_25359c8e0b5022a5;
        }
        var_383d064abe36a06a = ter_op(isai(victim), "AI-", "Plyr-");
        iprintln(var_383d064abe36a06a + "DMG:" + idamage + " LOC:" + shitloc + " HEALTH: " + victim.health + "/" + victim.maxhealth + var_78b43647bc863f62 + var_fb25ff31e4e88929 + var_9eaea3d379e435ad);
    }
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a65
// Size: 0x30
function function_eeaa22f0cd1ff845(var_c094db262ce4dfa0) {
    attachments = function_6527364c1ecca6c6(var_c094db262ce4dfa0);
    weaponobj = makeweapon(var_c094db262ce4dfa0, attachments);
    return weaponobj;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a9d
// Size: 0x32
function function_8cda2444c7d142df() {
    if (isagent(self)) {
        var_e993250a341e26ae = "ai_" + self getentitynumber();
    } else {
        var_e993250a341e26ae = self.guid;
    }
    return var_e993250a341e26ae;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad7
// Size: 0x95
function function_49967318fbd12317(objweapon, var_76b470a332915556) {
    if (!isdefined(level.var_b5224f533f8fffb0)) {
        level.var_b5224f533f8fffb0 = [];
    }
    if (!array_contains_key(level.var_b5224f533f8fffb0, objweapon.basename)) {
        var_cd63361c3d62090d = [];
        level.var_b5224f533f8fffb0[objweapon.basename] = var_cd63361c3d62090d;
    }
    level.var_b5224f533f8fffb0[objweapon.basename][self.guid] = var_76b470a332915556;
    thread function_820fe7d9e7ec7c65(objweapon);
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b73
// Size: 0x7b
function function_820fe7d9e7ec7c65(objweapon) {
    note = "removeWeaponParent_" + objweapon.basename;
    self notify(note);
    self endon(note);
    uniqueid = self.guid;
    wait(5);
    level.var_b5224f533f8fffb0[objweapon.basename] = array_remove_key(level.var_b5224f533f8fffb0[objweapon.basename], uniqueid);
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf5
// Size: 0xb4
function function_1e3102980c3a4cc1(objweapon) {
    weaponname = undefined;
    if (isweapon(objweapon)) {
        weaponname = objweapon.basename;
    } else {
        /#
            assert(isstring(objweapon));
        #/
        weaponname = objweapon;
    }
    if (!isdefined(weaponname)) {
        return objweapon;
    }
    if (isdefined(level.var_b5224f533f8fffb0) && array_contains_key(level.var_b5224f533f8fffb0, weaponname)) {
        /#
            if (!isdefined(level.var_b5224f533f8fffb0[weaponname][self.guid])) {
                /#
                    assertmsg("<unknown string>" + weaponname + "<unknown string>");
                #/
            }
        #/
        return level.var_b5224f533f8fffb0[weaponname][self.guid];
    }
    return objweapon;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb1
// Size: 0x52
function function_f0cf737b5d0ccda5(weapon) {
    weapname = getweaponbasename(weapon);
    result = issubstr(weapname, "sword01") || issubstr(weapname, "kamas") || issubstr(weapname, "pickaxe");
    return result;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d0b
// Size: 0x90
function function_a3fc7ebc9fc3e9a3(eattacker, victim, idflags) {
    hand = function_88e9e2299bd29fd1(idflags);
    victimentnum = function_d77e6b2580f74622(victim);
    if (isdefined(eattacker.pelletweaponvictimids) && isdefined(eattacker.pelletweaponvictimids[hand]) && isdefined(eattacker.pelletweaponvictimids[hand][victimentnum])) {
        return eattacker.pelletweaponvictimids[hand][victimentnum].var_7981f7d372990a2b;
    }
    return 0;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1da3
// Size: 0x23
function function_88e9e2299bd29fd1(idflags) {
    if (idflags & 2048) {
        return "lHandWeap";
    } else {
        return "rHandWeap";
    }
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dcd
// Size: 0x18
function function_d77e6b2580f74622(victim) {
    return "" + victim getentitynumber();
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ded
// Size: 0x12f
function function_1113fc99a0327d7d(eattacker, victim, idflags, idamage) {
    hand = function_88e9e2299bd29fd1(idflags);
    victimentnum = function_d77e6b2580f74622(victim);
    if (!isdefined(eattacker.pelletweaponvictimids) || !isdefined(eattacker.pelletweaponvictimids[hand]) || !isdefined(eattacker.pelletweaponvictimids[hand][victimentnum])) {
        return idamage;
    }
    var_52f16f4c9cdbf165 = eattacker.pelletweaponvictimids[hand][victimentnum].var_52f16f4c9cdbf165;
    var_9bb59738d095536e = eattacker.pelletweaponvictimids[hand][victimentnum].var_9bb59738d095536e;
    if (var_9bb59738d095536e < var_52f16f4c9cdbf165) {
        idamage = clamp(idamage, 0, var_52f16f4c9cdbf165 - eattacker.pelletweaponvictimids[hand][victimentnum].var_9bb59738d095536e);
        eattacker.pelletweaponvictimids[hand][victimentnum].var_9bb59738d095536e = eattacker.pelletweaponvictimids[hand][victimentnum].var_9bb59738d095536e + idamage;
        return idamage;
    } else {
        return 0;
    }
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f23
// Size: 0x9c
function function_ad15087050f05b04(eattacker, victim, idflags, idamage) {
    hand = function_88e9e2299bd29fd1(idflags);
    victimentnum = function_d77e6b2580f74622(victim);
    if (!isdefined(eattacker.pelletweaponvictimids) || !isdefined(eattacker.pelletweaponvictimids[hand]) || !isdefined(eattacker.pelletweaponvictimids[hand][victimentnum])) {
        return;
    }
    eattacker.pelletweaponvictimids[hand][victimentnum].pelletdmgpassed[0] = idamage;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc6
// Size: 0xb5
function function_9665cbeba4d776f7(eattacker, victim, idflags, amount) {
    hand = function_88e9e2299bd29fd1(idflags);
    victimentnum = function_d77e6b2580f74622(victim);
    if (!isdefined(eattacker.pelletweaponvictimids) || !isdefined(eattacker.pelletweaponvictimids[hand]) || !isdefined(eattacker.pelletweaponvictimids[hand][victimentnum])) {
        return 0;
    }
    eattacker.pelletweaponvictimids[hand][victimentnum].var_9bb59738d095536e = eattacker.pelletweaponvictimids[hand][victimentnum].var_9bb59738d095536e + amount;
}

// Namespace namespace_45ecbe78f599af72/namespace_d325722f2754c2c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2082
// Size: 0x23
function cleanupconcussionstun(time) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    wait(time);
    utility::setplayerunstunned();
}

