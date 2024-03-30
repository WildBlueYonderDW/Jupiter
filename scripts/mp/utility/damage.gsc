// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\dragonsbreath.gsc;
#using script_4bef961309209288;
#using script_7c40fa80892a721;
#using scripts\mp\heavyarmor.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_3583ff375ab3a91e;
#using scripts\engine\trace.gsc;
#using scripts\mp\damage.gsc;
#using script_6a5d3bf7a5b7064a;

#namespace damage;

// Namespace damage / scripts/mp/utility/damage
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x472
// Size: 0x5a
function get_damageable_player(player, playerpos) {
    newent = spawnstruct();
    newent.isplayer = 1;
    newent.isadestructable = 0;
    newent.entity = player;
    newent.damagecenter = playerpos;
    return newent;
}

// Namespace damage / scripts/mp/utility/damage
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d4
// Size: 0x67
function get_damageable_sentry(sentry, sentrypos) {
    newent = spawnstruct();
    newent.isplayer = 0;
    newent.isadestructable = 0;
    newent.issentry = 1;
    newent.entity = sentry;
    newent.damagecenter = sentrypos;
    return newent;
}

// Namespace damage / scripts/mp/utility/damage
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x543
// Size: 0x59
function get_damageable_grenade(grenade, entpos) {
    newent = spawnstruct();
    newent.isplayer = 0;
    newent.isadestructable = 0;
    newent.entity = grenade;
    newent.damagecenter = entpos;
    return newent;
}

// Namespace damage / scripts/mp/utility/damage
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a4
// Size: 0x59
function get_damageable_mine(mine, entpos) {
    newent = spawnstruct();
    newent.isplayer = 0;
    newent.isadestructable = 0;
    newent.entity = mine;
    newent.damagecenter = entpos;
    return newent;
}

// Namespace damage / scripts/mp/utility/damage
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x605
// Size: 0x25
function get_damageable_player_pos(player) {
    return player.origin + (0, 0, 32);
}

// Namespace damage / scripts/mp/utility/damage
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x632
// Size: 0x17
function get_damageable_grenade_pos(grenade) {
    return grenade.origin;
}

// Namespace damage / scripts/mp/utility/damage
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x651
// Size: 0x9c
function istacticaldamage(objweapon, smeansofdeath) {
    if (!isdefined(objweapon)) {
        return 0;
    }
    if (!isdefined(smeansofdeath) || smeansofdeath == "MOD_IMPACT") {
        return 0;
    }
    switch (objweapon.basename) {
    case #"hash_34e7a4cd11aed6bc":
    case #"hash_8d8f8ed9825eca03":
    case #"hash_d059dcc3a7f1308a":
    case #"hash_e3575fdd14663ca9":
        return 1;
    case #"hash_36d0be2b0f1c99e":
    case #"hash_5e3fa526a48eaaa5":
        return 0;
    default:
        return 0;
    }
}

// Namespace damage / scripts/mp/utility/damage
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f4
// Size: 0x60
function function_4766094b15b00a8(weapon, smeansofdeath, attacker) {
    var_27e27c2e96f2389d = 0;
    if (isbulletweapon(weapon)) {
        if (isdefined(attacker) && attacker scripts/cp_mp/utility/player_utility::player_hasperk("specialty_incendiary")) {
            var_27e27c2e96f2389d = 1;
        }
        if (isdefined(weapon) && scripts/cp_mp/dragonsbreath::function_cfd2e1e48edaf93(weapon)) {
            var_27e27c2e96f2389d = 1;
        }
    }
    return var_27e27c2e96f2389d;
}

// Namespace damage / scripts/mp/utility/damage
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75c
// Size: 0x44
function function_e287831520aa308b(weapon, attacker) {
    var_a167b7e09ac43f5e = 0;
    if (isbulletweapon(weapon)) {
        if (isdefined(attacker) && attacker scripts/cp_mp/utility/player_utility::player_hasperk("specialty_explosivebullet")) {
            var_a167b7e09ac43f5e = 1;
        }
    }
    return var_a167b7e09ac43f5e;
}

// Namespace damage / scripts/mp/utility/damage
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a8
// Size: 0x49
function isfmjdamage(weapon, smeansofdeath) {
    isfmj = 0;
    if (isdefined(weapon) && isdefined(smeansofdeath) && isbulletdamage(smeansofdeath)) {
        if (getweaponhasperk(weapon, "specialty_armorpiercing")) {
            isfmj = 1;
        }
    }
    return isfmj;
}

// Namespace damage / scripts/mp/utility/damage
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f9
// Size: 0x38
function function_73d1d5d600a0cbc3(smeansofdeath, attacker) {
    if (!isdefined(attacker) || !isplayer(attacker)) {
        return false;
    }
    return isbulletdamage(smeansofdeath) && attacker namespace_ed60dc1153ae1c06::function_1da49fb6441f8ab2();
}

// Namespace damage / scripts/mp/utility/damage
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x839
// Size: 0x8e
function function_3201a1bc3ff0e482(attacker, victim, smeansofdeath, idflags) {
    var_30d384da73217e13 = function_73d1d5d600a0cbc3(smeansofdeath, attacker);
    if (istrue(var_30d384da73217e13)) {
        if (isplayer(victim) || isagent(victim)) {
            if (namespace_f8d3520d3483c1::isbulletpenetration(idflags)) {
                return true;
            }
            if (isdefined(victim.vehicle)) {
                return true;
            }
            if (victim namespace_f8d3520d3483c1::hasarmor()) {
                return true;
            }
            if (istrue(victim.isjuggernaut)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace damage / scripts/mp/utility/damage
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8cf
// Size: 0x153
function islethalmeleeweapon(attacker, victim, objweapon, smeansofdeath) {
    if (smeansofdeath != "MOD_MELEE") {
        return false;
    }
    if (!isdefined(victim) || !isplayer(victim)) {
        return false;
    }
    if (victim scripts/mp/heavyarmor::hasheavyarmor()) {
        return false;
    }
    if (!val::get("one_hit_melee_victim")) {
        return false;
    }
    if (isfistsonly(objweapon.basename)) {
        return false;
    }
    if (ismeleeoverrideweapon(objweapon)) {
        return true;
    }
    if (isknifeonly(objweapon.basename)) {
        return true;
    }
    if (isballweapon(objweapon)) {
        return true;
    }
    if (objweapon.basename == "iw8_defibrillator_mp") {
        return true;
    }
    if (isaxeweapon(objweapon.basename) && attacker getweaponammoclip(objweapon) > 0) {
        return true;
    }
    foreach (attachment in objweapon.attachments) {
        if (string_starts_with(attachment, "bayonet") || string_starts_with(attachment, "tacknife")) {
            return true;
        }
    }
    return false;
}

// Namespace damage / scripts/mp/utility/damage
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2a
// Size: 0x237
function attackerishittingteam(victim, attacker) {
    if (isdefined(attacker) && isdefined(attacker.owner)) {
        if (victim == attacker.owner && isdefined(attacker.streakinfo) && isdefined(attacker.streakinfo.streakname) && function_8728f7cf8c005a0(attacker.streakinfo.streakname)) {
            return 1;
        }
        attacker = attacker.owner;
    }
    if (!level.teambased) {
        return 0;
    }
    if (!isdefined(attacker) || !isdefined(victim)) {
        return 0;
    }
    if (!isdefined(victim.team) || !isdefined(attacker.team)) {
        return 0;
    }
    if (victim == attacker) {
        return 0;
    }
    if (scripts/cp_mp/utility/game_utility::isinfectedgametype() && victim.pers["team"] == attacker.team && isdefined(attacker.teamchangedthisframe)) {
        return 0;
    }
    if (scripts/cp_mp/utility/game_utility::isinfectedgametype() && victim.pers["team"] != attacker.team && isdefined(attacker.teamchangedthisframe)) {
        return 1;
    }
    if (isdefined(attacker.scrambled) && attacker.scrambled) {
        return 0;
    }
    if (isplayerproxyagent(victim, attacker)) {
        return 0;
    }
    if (isagent(victim) && istrue(victim.skipfriendlyfire)) {
        return 0;
    }
    if (isagent(victim) && isdefined(victim.owner) && victim.owner == attacker) {
        return 0;
    }
    if (namespace_ad49798629176e96::function_c210e62f0b64cfb1(attacker, victim)) {
        return 0;
    }
    if (victim.team == attacker.team) {
        return 1;
    }
    if (namespace_ad49798629176e96::function_9efae38238e4df66(attacker, victim)) {
        return 1;
    }
    if (function_7cc9753f2f84e883(attacker, victim)) {
        return 1;
    }
    return 0;
}

// Namespace damage / scripts/mp/utility/damage
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc68
// Size: 0x6b
function function_7cc9753f2f84e883(eattacker, victim) {
    return isdefined(eattacker) && isdefined(victim) && isplayer(eattacker) && isplayer(victim) && isdefined(eattacker.var_3e8aeb2a9e8d86d6) && isdefined(victim.var_3e8aeb2a9e8d86d6) && eattacker.var_3e8aeb2a9e8d86d6 == victim.var_3e8aeb2a9e8d86d6;
}

// Namespace damage / scripts/mp/utility/damage
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdb
// Size: 0x38
function _validateattacker(eattacker) {
    if (isagent(eattacker)) {
        if (!istrue(eattacker.isactive)) {
            return undefined;
        }
        if (!isdefined(eattacker.classname)) {
            return undefined;
        }
    }
    return eattacker;
}

// Namespace damage / scripts/mp/utility/damage
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1b
// Size: 0x19
function _validatevictim(victim) {
    if (!victim scripts/cp_mp/utility/player_utility::_isalive()) {
        return undefined;
    }
    return victim;
}

// Namespace damage / scripts/mp/utility/damage
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3c
// Size: 0x114
function damage_should_ignore_blast_shield(attacker, victim, objweapon, smeansofdeath, inflictor, hitloc) {
    if (smeansofdeath == "MOD_GRENADE") {
        return true;
    }
    if (smeansofdeath == "MOD_PROJECTILE") {
        return true;
    }
    if ((smeansofdeath == "MOD_FIRE" || isexplosivedamagemod(smeansofdeath)) == 0) {
        return true;
    }
    if (smeansofdeath == "MOD_EXPLOSIVE_BULLET" && (!isdefined(hitloc) || hitloc != "none")) {
        return true;
    }
    if (isdefined(attacker) && attacker == victim && !istrue(victim.var_567daf189be4de79)) {
        return true;
    }
    data = scripts/cp_mp/utility/damage_utility::packdamagedata(attacker, victim, undefined, objweapon, smeansofdeath, inflictor);
    if (victim scripts/cp_mp/utility/damage_utility::isstuckdamage(data)) {
        return true;
    }
    if (weaponignoresblastshield(objweapon, hitloc)) {
        return true;
    }
    if (scripts/cp_mp/utility/game_utility::isbrstylegametype() && isdefined(victim) && istrue(victim.isjuggernaut) && isdefined(inflictor) && isdefined(inflictor.vehiclename)) {
        return true;
    }
    return false;
}

// Namespace damage / scripts/mp/utility/damage
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xe58
// Size: 0x4b
function _radiusdamage(origin, range, maxdamage, mindamage, attacker, meansofdeath, weapon) {
    self radiusdamage(origin, range, maxdamage, mindamage, attacker, meansofdeath, weapon);
}

// Namespace damage / scripts/mp/utility/damage
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeaa
// Size: 0x27e
function radiusplayerdamage(origin, minradius, maxradius, mindamage, maxdamage, attacker, inflictor, meansofdeath, weaponname, ignoreattacker) {
    /#
        assert(isdefined(origin) && isdefined(minradius) && isdefined(maxradius) && isdefined(mindamage) && isdefined(maxdamage) && isdefined(attacker) && isdefined(meansofdeath));
    #/
    if (!isdefined(ignoreattacker)) {
        ignoreattacker = 0;
    }
    var_f145a993614d298f = scripts/engine/trace::create_character_contents();
    castcontents = scripts/engine/trace::create_contents(0, 1, 1, 0, 1, 0);
    ignorelist = [];
    foreach (character in level.characters) {
        if (!isdefined(character)) {
            continue;
        }
        if (!character scripts/cp_mp/utility/player_utility::_isalive()) {
            ignorelist[ignorelist.size] = character;
            continue;
        }
        if (ignoreattacker && character == attacker) {
            ignorelist[ignorelist.size] = character;
            continue;
        }
        if (level.teambased && character.team == attacker.team) {
            ignorelist[ignorelist.size] = character;
        }
    }
    var_45724690f28d7899 = physics_querypoint(attacker.origin, maxradius, var_f145a993614d298f, ignorelist, "physicsquery_all");
    if (isdefined(var_45724690f28d7899) && var_45724690f28d7899.size > 0) {
        for (i = 0; i < var_45724690f28d7899.size; i++) {
            ent = var_45724690f28d7899[i]["entity"];
            dist = var_45724690f28d7899[i]["distance"];
            point = var_45724690f28d7899[i]["position"];
            if (!isdefined(ent)) {
                continue;
            }
            castresults = physics_raycast(origin, point, castcontents, undefined, 0, "physicsquery_closest");
            if (isdefined(castresults) && castresults.size > 0) {
                continue;
            }
            distratio = max(dist, minradius) / maxradius;
            damage = mindamage + (maxdamage - mindamage) * distratio;
            ent dodamage(damage, origin, attacker, inflictor, meansofdeath, weaponname);
        }
    }
}

// Namespace damage / scripts/mp/utility/damage
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x112f
// Size: 0x1e
function hashealthshield(player) {
    return isdefined(player) && isdefined(player.healthshield);
}

// Namespace damage / scripts/mp/utility/damage
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1155
// Size: 0x34
function gethealthshielddamage(damage) {
    /#
        assertex(isdefined(self.healthshieldmod), "Health Shield mod value is not defined, please make sure to assign a value to self.healthShieldMod using setHealthShield()");
    #/
    return int(damage * self.healthshieldmod);
}

// Namespace damage / scripts/mp/utility/damage
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1191
// Size: 0x69
function sethealthshield(shieldvalue) {
    self.healthshield = 1;
    if (!isdefined(self.healthshieldmod)) {
        self.healthshieldmod = 1;
    }
    shieldvalue = int(clamp(shieldvalue, 0, 100));
    var_34985a43c94f1829 = (100 - shieldvalue) / 100;
    if (var_34985a43c94f1829 < self.healthshieldmod) {
        self.healthshieldmod = var_34985a43c94f1829;
    }
}

// Namespace damage / scripts/mp/utility/damage
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1201
// Size: 0x17
function clearhealthshield() {
    self.healthshield = undefined;
    self.healthshieldmod = undefined;
}

// Namespace damage / scripts/mp/utility/damage
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121f
// Size: 0xb6
function _suicide(checkremote, var_1044662d97e67562) {
    if (self.sessionstate != "playing") {
        /#
            println("remote_turret");
        #/
        return;
    }
    if (playershoulddofauxdeath(checkremote) && !isdefined(self.fauxdead)) {
        thread scripts/mp/damage::playerkilled_internal(self, self, self, 10000, 0, "MOD_SUICIDE", nullweapon(), (0, 0, 0), "none", 0, 1116, 1);
        return;
    }
    if (!playershoulddofauxdeath(checkremote) && !isdefined(self.fauxdead) && (!isdefined(self.vehicle) || istrue(var_1044662d97e67562))) {
        self suicide();
    }
}

// Namespace damage / scripts/mp/utility/damage
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12dc
// Size: 0x28
function suicide_on_end_remote() {
    self endon("death");
    self endon("disconnect");
    level endon("game_ended");
    self waittill("stopped_using_remote");
    thread suicide_on_alive();
}

// Namespace damage / scripts/mp/utility/damage
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130b
// Size: 0x49
function suicide_on_alive() {
    self endon("disconnect");
    level endon("game_ended");
    self notify("suicide_on_alive");
    self endon("suicide_on_alive");
    while (!isreallyalive(self) || self.sessionstate != "playing") {
        waitframe();
    }
    _suicide();
}

// Namespace damage / scripts/mp/utility/damage
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135b
// Size: 0x73
function playershoulddofauxdeath(checkremote) {
    if (!isdefined(checkremote)) {
        checkremote = 1;
    }
    if (istrue(self.isusingcamera)) {
        return false;
    }
    if (istrue(checkremote) && isusingremote() && !islifelimited()) {
        if (self.usingremote != "remote_turret") {
            return true;
        }
    }
    if (isdefined(level.modeshoulddofauxdeathfunc) && self [[ level.modeshoulddofauxdeathfunc ]]()) {
        return true;
    }
    return false;
}

// Namespace damage / scripts/mp/utility/damage
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d6
// Size: 0x2a
function isprojectiledamage(meansofdeath) {
    projdamage = "MOD_PROJECTILE MOD_IMPACT MOD_GRENADE MOD_HEAD_SHOT";
    if (issubstr(projdamage, meansofdeath)) {
        return true;
    }
    return false;
}

// Namespace damage / scripts/mp/utility/damage
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1408
// Size: 0xf6
function non_player_log_attacker_data(data, attacker) {
    if (data.damage == 0) {
        return;
    }
    if (!isdefined(attacker)) {
        attacker = data.attacker;
    }
    if (!isdefined(attacker) || !isplayer(attacker)) {
        inflictor = data.inflictor;
        if (isdefined(inflictor)) {
            if (isplayer(inflictor)) {
                attacker = inflictor;
            } else {
                attacker = inflictor.owner;
            }
        } else {
            attacker = undefined;
        }
    }
    if (!isdefined(attacker) || !isplayer(attacker)) {
        return;
    }
    if (isdefined(self.owner)) {
        if (!scripts/cp_mp/utility/player_utility::playersareenemies(self.owner, attacker)) {
            return;
        }
    } else if (level.teambased && isdefined(self.team) && self.team == attacker.team) {
        return;
    }
    non_player_add_attacker_data(data, attacker);
}

// Namespace damage / scripts/mp/utility/damage
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1505
// Size: 0x12a
function non_player_add_attacker_data(data, attacker) {
    if (!isdefined(attacker)) {
        attacker = data.attacker;
    }
    firsttimedamaged = undefined;
    attackerdata = non_player_get_attacker_data(attacker);
    if (!isdefined(attackerdata)) {
        attackerdata = non_player_get_attacker_data(attacker, 1);
        firsttimedamaged = gettime();
    }
    attackerdata.damage = attackerdata.damage + data.damage;
    attackerdata.objweapon = data.objweapon;
    attackerdata.point = data.point;
    attackerdata.direction = data.direction_vec;
    attackerdata.partname = data.partname;
    attackerdata.meansofdeath = data.meansofdeath;
    attackerdata.firsttimedamaged = ter_op(isdefined(firsttimedamaged), firsttimedamaged, attackerdata.firsttimedamaged);
    attackerdata namespace_4887422e77f3514e::updatefirsttimedamaged();
    attackerdata.lasttimedamaged = gettime();
}

// Namespace damage / scripts/mp/utility/damage
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1636
// Size: 0x147
function non_player_get_attacker_data(attacker, create) {
    attackerdata = undefined;
    if (!isdefined(self.attackerdata) && istrue(create)) {
        self.attackerdata = [];
    }
    if (isdefined(self.attackerdata)) {
        guid = attacker.guid;
        if (isdefined(guid)) {
            attackerdata = self.attackerdata[guid];
            if (isdefined(attackerdata)) {
                if (attackerdata.isvalid || level.teambased && attacker.team != attackerdata.team) {
                    attackerdata = undefined;
                    self.attackerdata[guid] = undefined;
                }
            }
            if (!isdefined(attackerdata) && istrue(create)) {
                attackerdata = spawnstruct();
                attackerdata.attacker = attacker;
                attackerdata.team = attacker.team;
                attackerdata.guid = guid;
                attackerdata.isvalid = 1;
                attackerdata.damage = 0;
                attackerdata.hitcount = 0;
                attackerdata.firsttimehit = gettime();
                self.attackerdata[guid] = attackerdata;
            }
        }
    }
    return attackerdata;
}

// Namespace damage / scripts/mp/utility/damage
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1785
// Size: 0xd
function non_player_clear_attacker_data() {
    self.attackerdata = undefined;
}

// Namespace damage / scripts/mp/utility/damage
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1799
// Size: 0x151
function non_player_should_ignore_damage(attacker, objweapon, inflictor, meansofdeath) {
    if (non_player_should_ignore_damage_signature(attacker, objweapon, inflictor, meansofdeath)) {
        return true;
    }
    if (isdefined(objweapon.basename)) {
        if (meansofdeath != "MOD_MELEE") {
            switch (objweapon.basename) {
            case #"hash_405f9521b5ee8402":
            case #"hash_807ae3204119bd41":
                return true;
            }
        }
        if (meansofdeath == "MOD_IMPACT") {
            switch (objweapon.basename) {
            case #"hash_435258fc47768fa7":
            case #"hash_4b87af60037f526f":
            case #"hash_4c7de5619284e175":
            case #"hash_56ee829cc162271a":
            case #"hash_5e8f81314553dd36":
            case #"hash_6a2e4f9c54756dc7":
            case #"hash_d6565ec12efca627":
                return true;
            }
        } else {
            switch (objweapon.basename) {
            case #"hash_34e7a4cd11aed6bc":
            case #"hash_aec9c140fca96664":
            case #"hash_b2a8e1829f433bd7":
            case #"hash_c7ce3f77814f7950":
            case #"hash_cac2107b8e726d9d":
            case #"hash_d072a0adddda0068":
                return true;
            }
        }
    }
    return false;
}

// Namespace damage / scripts/mp/utility/damage
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f2
// Size: 0x128
function non_player_add_ignore_damage_signature(attacker, objweapon, inflictor, meansofdeath) {
    if (!isdefined(self.ignoredamageid)) {
        self.ignoredamageid = 0;
    }
    if (!isdefined(self.ignoredamagesignatures)) {
        self.ignoredamagesignatures = [];
    }
    id = self.ignoredamageid;
    self.ignoredamageid++;
    if (isdefined(objweapon) && isstring(objweapon)) {
        objweapon = makeweapon(objweapon);
    }
    signature = spawnstruct();
    signature.id = id;
    signature.attacker = attacker;
    signature.objweapon = objweapon;
    signature.inflictor = inflictor;
    signature.meansofdeath = meansofdeath;
    signature.checkattacker = isdefined(attacker);
    signature.checkobjweapon = isdefined(objweapon) && !isnullweapon(objweapon);
    signature.checkinflictor = isdefined(inflictor);
    signature.checkmeansofdeath = isdefined(meansofdeath);
    self.ignoredamagesignatures[id] = signature;
    return id;
}

// Namespace damage / scripts/mp/utility/damage
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a22
// Size: 0x25
function non_player_remove_ignore_damage_signature(id) {
    if (!isdefined(self.ignoredamagesignatures)) {
        return;
    }
    self.ignoredamagesignatures[id] = undefined;
}

// Namespace damage / scripts/mp/utility/damage
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a4e
// Size: 0xd
function non_player_clear_ignore_damage_signatures() {
    self.ignoredamagesignatures = undefined;
}

// Namespace damage / scripts/mp/utility/damage
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a62
// Size: 0x1c1
function non_player_should_ignore_damage_signature(attacker, objweapon, inflictor, meansofdeath) {
    if (!isdefined(self.ignoredamagesignatures)) {
        return false;
    }
    if (isdefined(objweapon) && isstring(objweapon)) {
        objweapon = makeweapon(objweapon);
    }
    foreach (signature in self.ignoredamagesignatures) {
        if (!isdefined(signature)) {
            return false;
        }
        if (signature.checkattacker) {
            if (!isdefined(signature.attacker)) {
                non_player_remove_ignore_damage_signature(signature.id);
                continue;
            } else if (!isdefined(attacker)) {
                continue;
            } else if (attacker != signature.attacker) {
                continue;
            }
        }
        if (signature.checkobjweapon) {
            if (!isdefined(objweapon) || isnullweapon(objweapon)) {
                continue;
            } else if (objweapon.basename != signature.objweapon.basename) {
                continue;
            }
        }
        if (signature.checkinflictor) {
            if (!isdefined(signature.inflictor)) {
                non_player_remove_ignore_damage_signature(signature.id);
                continue;
            } else if (!isdefined(inflictor)) {
                continue;
            } else if (inflictor != signature.inflictor) {
                continue;
            }
        }
        if (signature.checkmeansofdeath) {
            if (!isdefined(meansofdeath)) {
                continue;
            } else if (meansofdeath != signature.meansofdeath) {
                continue;
            }
        }
        return true;
    }
    return false;
}

// Namespace damage / scripts/mp/utility/damage
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c2b
// Size: 0x75
function islauncherdirectimpactdamage(objweapon, meansofdeath, var_68d17572ef704fa8) {
    if (objweapon.type != "projectile") {
        return false;
    }
    if (istrue(var_68d17572ef704fa8) && objweapon.isalternate && isdefined(objweapon.underbarrel)) {
        return false;
    }
    return meansofdeath == "MOD_IMPACT" || meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_GRENADE";
}

