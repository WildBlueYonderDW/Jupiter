// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using script_7c40fa80892a721;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_77c18cdedec620b3;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_collision.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_965527752cbd4cca;

// Namespace namespace_965527752cbd4cca/namespace_daa149ca485fd50a
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f9
// Size: 0xe6
function callbacksoldieragentdamaged(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (isdefined(self.var_970170ffd4b081ac)) {
        idamage = self [[ self.var_970170ffd4b081ac ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    }
    if (isdefined(self.var_a4738c70736d3a61)) {
        [[ self.var_a4738c70736d3a61 ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    } else {
        function_dffac413ed66bcd0(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    }
}

// Namespace namespace_965527752cbd4cca/namespace_daa149ca485fd50a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e6
// Size: 0x66
function function_34672e1ee2e90cf8(objweapon, idamage) {
    if (!isdefined(objweapon)) {
        return idamage;
    }
    class = weaponclass(objweapon);
    if (isdefined(class) && class == "spread") {
        var_54f07fb8741b177d = getdvarint(@"hash_877c52caf0f9aa8c", 35);
        idamage = int(min(idamage, var_54f07fb8741b177d));
    }
    return idamage;
}

// Namespace namespace_965527752cbd4cca/namespace_daa149ca485fd50a
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x654
// Size: 0xec4
function function_dffac413ed66bcd0(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    evictim = self;
    var_a95f61e7118777d1 = idamage;
    var_64d2a3801bd9ad7e = 0;
    var_9285b238a06e0c02 = 0;
    var_5d59d8b177f36f36 = function_b8c245105cc37f9e(objweapon);
    var_69cfd14b4398c458 = idamage;
    if (function_62213f6e7b9da1e7(evictim, eattacker, einflictor, smeansofdeath)) {
        return;
    }
    if (!function_84a1aec445b03580(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon)) {
        return;
    }
    if (handleriotshielddamage(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon)) {
        return;
    }
    if (smeansofdeath == "MOD_TRIGGER_HURT") {
        if (isdefined(eattacker) && eattacker.spawnflags & 2) {
            return;
        }
    }
    var_379485f96865db6d = isdefined(eattacker) && isplayer(eattacker);
    var_7543d4fe49c53684 = isdefined(eattacker) && isdefined(eattacker.owner) && isplayer(eattacker.owner);
    isplayervehicle = isdefined(eattacker) && isdefined(eattacker.classname) && eattacker.classname == "script_vehicle" && isdefined(eattacker.owner) && isplayer(eattacker.owner);
    var_facfecfac4909d65 = isplayervehicle && smeansofdeath == "MOD_CRUSH";
    if (isdefined(evictim.forcehitlocation)) {
        shitloc = evictim.forcehitlocation;
        evictim.forcehitlocation = undefined;
    }
    if (var_facfecfac4909d65) {
        var_448a418e975e9b01 = getdvarfloat(@"hash_e58868d4f3626e25", 500);
        var_6a01daab475b44ab = getdvarfloat(@"hash_4ca14712d81d0747", 1500);
        if (isdefined(self.stealth)) {
            if (isdefined(self.stealth.override_damage_auto_range)) {
                var_448a418e975e9b01 = self.stealth.override_damage_auto_range;
            } else if (isdefined(level.stealth.override_damage_auto_range)) {
                var_448a418e975e9b01 = level.stealth.override_damage_auto_range;
            }
            if (isdefined(self.stealth.override_damage_sight_range)) {
                var_6a01daab475b44ab = self.stealth.override_damage_sight_range;
            } else if (isdefined(level.stealth.override_damage_sight_range)) {
                var_6a01daab475b44ab = level.stealth.override_damage_sight_range;
            }
        }
        if (idamage >= self.health) {
            function_aad7a0ea8ac4ca23("ally_killed", self, eattacker.owner, var_448a418e975e9b01, var_6a01daab475b44ab);
        }
        if (iscp() && soundexists("vehicle_body_hit")) {
            playsoundatpos(self.origin, "vehicle_body_hit");
        }
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "gulagTrackPlayerBulletHitAI")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("player", "gulagTrackPlayerBulletHitAI") ]](eattacker, idamage);
    }
    if (smeansofdeath == "MOD_CRUSH" && isdefined(einflictor) && isdefined(einflictor.var_746334c2ac85aacc)) {
        idamage = einflictor.var_746334c2ac85aacc;
    }
    if (getdvarint(@"hash_f40118cb927a0802", 0) == 1) {
        idamage = function_34672e1ee2e90cf8(objweapon, idamage);
    }
    headshot = namespace_169cd7a8fbc76ee5::isheadshot(shitloc, smeansofdeath, eattacker);
    if (smeansofdeath == "MOD_MELEE") {
        var_1e459a85ae0dd390 = 0;
        if (isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "iw9_me_buzzsaw_mp") {
            var_1e459a85ae0dd390 = 1;
        }
        if (!var_1e459a85ae0dd390) {
            idamage = int(min(idamage, 135));
        }
    } else if (isdefined(eattacker) && isplayer(eattacker) && isdefined(objweapon) && isdefined(objweapon.basename) && (objweapon.basename == "throwingknife_mp" || objweapon.basename == "throwingknife_cp" || objweapon.basename == "shuriken_mp" || objweapon.basename == "throwstar_mp")) {
        var_5d59d8b177f36f36 = istrue(self.var_685390c6753c2cc7);
        var_66efe6ff4098c684 = istrue(self.var_282d867559c07771);
        if (iscp()) {
            var_b656251147d7d40b = isdefined(partname) && namespace_169cd7a8fbc76ee5::function_b656251147d7d40b(partname);
            if (var_5d59d8b177f36f36 || var_66efe6ff4098c684 && (istrue(headshot) || istrue(var_b656251147d7d40b))) {
                idamage = self.health;
            } else if (var_66efe6ff4098c684) {
                idamage = int(self.maxhealth / 2);
            } else {
                idamage = 400;
            }
        } else {
            idamage = ter_op(var_5d59d8b177f36f36, int(max(400, self.health + self.armorhealth)), 400);
            if (var_66efe6ff4098c684) {
                idamage = ter_op(var_66efe6ff4098c684, int(max(400, self.health / 2 + self.armorhealth / 2)), 400);
            }
        }
    }
    if (isexplosivedamagemod(smeansofdeath)) {
        if (issharedfuncdefined("thermobaric_grenade", "thermobaric_additional_explosive_damage")) {
            idamage = idamage + [[ getsharedfunc("thermobaric_grenade", "thermobaric_additional_explosive_damage") ]](evictim, eattacker, idamage);
        }
    }
    if (!headshot && isdefined(self.armorhealth) && self.armorhealth > 0 && smeansofdeath != "MOD_CRUSH" && (!isdefined(self.var_f8ecc64162438d76) || !(isdefined(einflictor) && array_contains(self.var_f8ecc64162438d76, einflictor)))) {
        var_57accdc40b2f50e = namespace_f8d3520d3483c1::function_90ce8eb3ddaa4943(eattacker, einflictor, evictim, idamage, objweapon, smeansofdeath, shitloc, idflags, var_a95f61e7118777d1, var_69cfd14b4398c458);
        var_1da1a66b5c6a06a7 = var_57accdc40b2f50e[1];
        idamage = var_57accdc40b2f50e[0];
        var_64d2a3801bd9ad7e = var_1da1a66b5c6a06a7;
        if (iscp() && function_72f1748ee99c798(smeansofdeath) && idamage <= 0 && !istrue(self.var_c7b10080abf06d59)) {
            var_64d2a3801bd9ad7e = self.armorhealth;
            if (idamage <= 0) {
                namespace_f8d3520d3483c1::breakarmor();
                self notify("flashbang", (0, 0, 0));
            }
        }
        if (idamage <= 0 && var_64d2a3801bd9ad7e > 0) {
            idamage = 1;
            self.health = self.health + 1;
        }
    }
    if (headshot && smeansofdeath != "MOD_CRUSH" && !namespace_169cd7a8fbc76ee5::function_cb9ba92488b23c5(objweapon)) {
        hashelmet = istrue(self.helmethealth) && self.helmethealth > 0;
        if (hashelmet) {
            if (istrue(self.var_895dae193cfaac3a)) {
                var_9285b238a06e0c02 = idamage;
                namespace_f8d3520d3483c1::function_e71f062243ea8827(idamage, 0, eattacker);
                idamage = 1;
                self.health = self.health + 1;
            } else {
                var_9285b238a06e0c02 = 1;
                var_798ca175be748e74 = 0;
                if (!istrue(self.var_ef3bfd0243258e2f)) {
                    if (namespace_448ccf1ca136fbbe::getdamagetype(smeansofdeath) == "splash") {
                        var_798ca175be748e74 = 1;
                    }
                    if ((sweapon.classname == "sniper" || sweapon.classname == "dmr") && idamage > 1000 || sweapon.classname == "turret") {
                        if (self.helmethealth == 1) {
                            var_798ca175be748e74 = 1;
                        }
                        var_9285b238a06e0c02 = self.helmethealth;
                    }
                }
                if (isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "iw9_dm_crossbow_mp" && iscp()) {
                    var_798ca175be748e74 = 1;
                    var_5d59d8b177f36f36 = 1;
                }
                namespace_f8d3520d3483c1::function_e71f062243ea8827(var_9285b238a06e0c02, 0, eattacker);
                if (!istrue(var_798ca175be748e74)) {
                    idamage = 1;
                    self.health = self.health + 1;
                }
            }
        }
    }
    if (var_64d2a3801bd9ad7e == 0 && var_9285b238a06e0c02 == 0 && isbulletdamage(smeansofdeath) && namespace_169cd7a8fbc76ee5::isheadshot(shitloc, smeansofdeath, eattacker)) {
        if (!istrue(self.var_f6275396cb3aa512)) {
            idamage = int(max(idamage, self.health));
        }
    }
    if (var_5d59d8b177f36f36) {
        idamage = self.health;
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("relics", "modify_agent_damage")) {
        idamage = self [[ namespace_3c37cb17ade254d::getsharedfunc("relics", "modify_agent_damage") ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    }
    var_b2883531afa6b83d = var_64d2a3801bd9ad7e > 0;
    var_c99801d3991fa429 = var_9285b238a06e0c02 > 0;
    if (var_b2883531afa6b83d || var_c99801d3991fa429) {
        idflags = idflags | 512;
    }
    if (getdvarint(@"hash_df80c6d770ba0231", 1) == 1) {
        var_1da1a66b5c6a06a7 = var_64d2a3801bd9ad7e + var_9285b238a06e0c02;
        var_986b2e0350629522 = 0;
        iskillstreakweapon = 0;
        if (namespace_3c37cb17ade254d::issharedfuncdefined("ai_mp_controller", "handleDamageFeedback")) {
            var_974fefea31f1fabe = namespace_3c37cb17ade254d::getsharedfunc("ai_mp_controller", "handleDamageFeedback");
            [[ var_974fefea31f1fabe ]](einflictor, eattacker, self, idamage, smeansofdeath, objweapon, shitloc, idflags, var_1da1a66b5c6a06a7, var_986b2e0350629522, iskillstreakweapon);
        }
    }
    /#
        namespace_d325722f2754c2c4::function_c9e5c511b923a42f(idamage, eattacker, evictim, smeansofdeath, shitloc, einflictor, vpoint, var_64d2a3801bd9ad7e, undefined, var_9285b238a06e0c02);
    #/
    idamage = int(idamage);
    if (utility::getdamagetype(smeansofdeath) == "splash" || isdefined(sweapon.basename) && issubstr(sweapon.basename, "thermite_bolt")) {
        idamage = idamage * 2;
    }
    if (istrue(evictim.var_6c66afbc7f2ce4b0)) {
        var_2d776dde0a657b53 = idamage + var_64d2a3801bd9ad7e;
        self function_136d20776df768d2(var_2d776dde0a657b53, eattacker, vdir, vpoint);
        if (isdefined(level.var_c0f958f7943f0cde)) {
            evictim [[ level.var_c0f958f7943f0cde ]](var_2d776dde0a657b53);
        }
    }
    if (var_379485f96865db6d || var_7543d4fe49c53684 || var_facfecfac4909d65) {
        if (isdefined(objweapon)) {
            attacker = eattacker;
            if (var_7543d4fe49c53684) {
                attacker = eattacker.owner;
            }
            attacker.pers["lastDamageTime"] = gettime();
            if (isdefined(level.var_238d7505b0146b84)) {
                [[ level.var_238d7505b0146b84 ]](self, attacker, einflictor, objweapon, idamage, vpoint, vdir, shitloc, timeoffset, smeansofdeath);
            }
            if (issharedfuncdefined("player", "checkHit")) {
                attacker thread [[ getsharedfunc("player", "checkHit") ]](objweapon, evictim, shitloc, idamage);
            }
            if (isplayer(attacker)) {
                var_366b0ecc2f28aead = getcompleteweaponname(objweapon);
                var_ba9dc00e6d5896dc = int(min(idamage, self.health));
                if (namespace_3c37cb17ade254d::issharedfuncdefined("weaponstats", "threadedSetWeaponStatByName")) {
                    attacker thread [[ namespace_3c37cb17ade254d::getsharedfunc("weaponstats", "threadedSetWeaponStatByName") ]](var_366b0ecc2f28aead, var_ba9dc00e6d5896dc, "damage", self);
                }
            }
        }
    }
    if (istrue(evictim.agentdamagefeedback)) {
        var_22602300decb102b = 0;
        if (namespace_3c37cb17ade254d::issharedfuncdefined("killstreak", "isKillstreakWeapon")) {
            var_22602300decb102b = isdefined(objweapon) && [[ namespace_3c37cb17ade254d::getsharedfunc("killstreak", "isKillstreakWeapon") ]](objweapon.basename);
            if (namespace_3c37cb17ade254d::issharedfuncdefined("damage", "handleDamageFeedback")) {
                eattacker [[ namespace_3c37cb17ade254d::getsharedfunc("damage", "handleDamageFeedback") ]](einflictor, eattacker, evictim, idamage, smeansofdeath, objweapon, shitloc, idflags, 0, 0, var_22602300decb102b);
            }
        }
    }
    if (isdefined(sweapon) && !sweapon issilenced()) {
        agentpers_setagentpersdata(self, "lastNonSilencedDamageTime", gettime());
    }
    if (isbulletdamage(smeansofdeath) && isalive(evictim)) {
        function_216c67ab6749137a(evictim, undefined, "wounded");
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("damage", "process_events_and_challenges_on_death")) {
        self [[ namespace_3c37cb17ade254d::getsharedfunc("damage", "process_events_and_challenges_on_death") ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    }
    /#
        if (getdvarint(@"hash_f42eefd3e1b79376") != 0) {
            if (idamage != var_a95f61e7118777d1) {
                println("checkHit" + idamage);
            }
        }
        if (getdvarint(@"hash_81d89e4abec64203", 0) != 0) {
            var_8132f3edc308582c = [];
            var_8132f3edc308582c["j_helmet"] = einflictor;
            var_8132f3edc308582c["incendiary"] = eattacker;
            var_8132f3edc308582c["<unknown string>"] = idamage;
            var_8132f3edc308582c["<unknown string>"] = smeansofdeath;
            var_8132f3edc308582c["<unknown string>"] = sweapon;
            var_8132f3edc308582c["<unknown string>"] = vpoint;
            var_8132f3edc308582c["<unknown string>"] = vdir;
            var_8132f3edc308582c["<unknown string>"] = shitloc;
            var_8132f3edc308582c["<unknown string>"] = objweapon;
            var_8132f3edc308582c["<unknown string>"] = partname;
            namespace_d8bd5ac27a00a48d::function_8245dce28f1f395c(var_8132f3edc308582c, var_a95f61e7118777d1, 1);
        }
    #/
    if (isdefined(evictim.unittype) && isdefined(level.agent_funcs[evictim.unittype]) && isdefined(level.agent_funcs[evictim.unittype]["on_damaged_finished"])) {
        evictim [[ level.agent_funcs[evictim.unittype]["on_damaged_finished"] ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, 0, modelindex, partname, var_b2883531afa6b83d);
    } else {
        if (!isdefined(evictim.agent_type)) {
            /#
                assertmsg("agent_type is not defined for " + evictim + " with classname " + evictim.classname);
            #/
            return;
        }
        if (!isdefined(level.agent_funcs[evictim.agent_type]["on_damaged_finished"])) {
            /#
                assertmsg("on_damage_finished callback is not defined in level.agent_funcs for agent_type " + evictim.agent_type);
            #/
            return;
        }
        evictim [[ level.agent_funcs[evictim.agent_type]["on_damaged_finished"] ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, 0, modelindex, partname, var_b2883531afa6b83d);
    }
}

// Namespace namespace_965527752cbd4cca/namespace_daa149ca485fd50a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151f
// Size: 0x69
function function_72f1748ee99c798(smeansofdeath) {
    if (!isdefined(smeansofdeath)) {
        return 0;
    }
    switch (smeansofdeath) {
    case #"hash_3c20f39c73a1422b":
    case #"hash_571e46e17a3cf2e3":
    case #"hash_66cb246f3e55fbe2":
    case #"hash_a911a1880d996edb":
    case #"hash_c22b13f81bed11f0":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_965527752cbd4cca/namespace_daa149ca485fd50a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158f
// Size: 0x251
function function_62213f6e7b9da1e7(agent, attacker, inflictor, meansofdeath) {
    if (isdefined(attacker) && istrue(attacker.var_eb504fc7e1cfeb4c)) {
        return 0;
    }
    if (isdefined(inflictor) && istrue(inflictor.var_eb504fc7e1cfeb4c)) {
        return 0;
    }
    if (isdefined(attacker) && isdefined(agent) && isdefined(agent.team)) {
        if (isdefined(attacker.team) && attacker.team == agent.team) {
            return 1;
        }
        if (isdefined(attacker.owner) && isdefined(attacker.owner.team) && attacker.owner.team == agent.team) {
            return 1;
        }
        if (isdefined(attacker.vehicle) && isdefined(attacker.vehicle.team) && attacker.vehicle.team == agent.team) {
            return 1;
        }
    }
    if (isdefined(inflictor) && isdefined(agent) && isdefined(agent.team)) {
        if (isdefined(inflictor.team) && inflictor.team == agent.team) {
            return 1;
        }
        if (isdefined(inflictor.owner) && isdefined(inflictor.owner.team) && inflictor.owner.team == agent.team) {
            return 1;
        }
        if (isdefined(inflictor.vehicle) && isdefined(inflictor.vehicle.team) && inflictor.vehicle.team == agent.team) {
            return 1;
        }
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("threat_bias", "customFriendlyCheck")) {
        return [[ namespace_3c37cb17ade254d::getsharedfunc("threat_bias", "customFriendlyCheck") ]](agent, attacker, inflictor, meansofdeath);
    }
    return 0;
}

// Namespace namespace_965527752cbd4cca/namespace_daa149ca485fd50a
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e8
// Size: 0x1d0
function function_84a1aec445b03580(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    var_86c7c655ad6283d7 = isdefined(smeansofdeath) && smeansofdeath == "MOD_CRUSH" && isdefined(einflictor) && isent(einflictor) && einflictor namespace_1f188a13f7e79610::isvehicle();
    if (var_86c7c655ad6283d7) {
        var_1cbb59f0ede148a4 = 3;
        if (istrue(self.var_b222000b9e5e8ce) && isdefined(einflictor.owner)) {
            var_1cbb59f0ede148a4 = 0;
        }
        var_86c7c655ad6283d7 = namespace_f3f7309ba50e9927::function_6eb1fba746b72f46(einflictor) <= var_1cbb59f0ede148a4;
    }
    var_663299b134fb78d = isdefined(self.origin) && isdefined(level.var_f0872e42daf6d4d5) && distancesquared(level.var_f0872e42daf6d4d5, self.origin) < 250000;
    var_abb16a8745308d16 = isplayer(eattacker) && isdefined(sweapon.basename) && sweapon.basename == "iw9_pi_stimpistol_mp" && isbulletdamage(smeansofdeath);
    var_10effa490054d61e = isdefined(self.var_d9134148f9bb887) && isdefined(self.var_f39c6b01b1d95542) && gettime() >= self.var_f39c6b01b1d95542 && gettime() < self.var_d9134148f9bb887;
    return !istrue(self.invulnerable) && !var_86c7c655ad6283d7 && !var_663299b134fb78d && !var_abb16a8745308d16 && !var_10effa490054d61e;
}

// Namespace namespace_965527752cbd4cca/namespace_daa149ca485fd50a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c0
// Size: 0x1d
function function_7d0d24665d72f13c(agent, attacker) {
    function_1920867ddf76810c(agent, 0);
}

// Namespace namespace_965527752cbd4cca/namespace_daa149ca485fd50a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e4
// Size: 0x140
function function_59ea6b2f800cb082(agent, attacker) {
    var_eb360908742e60bb = "j_helmet_hide";
    function_1920867ddf76810c(agent, 0);
    if (agent.subclass == "tier2") {
        fx = getfx("vfx_gameplay_tier2_helmet_pop");
    } else {
        fx = getfx("vfx_gameplay_tier3_helmet_pop");
    }
    playfx(fx, agent gettagorigin("j_helmet"));
    if (!istrue(agent.var_668b72f41e87c75a)) {
        if (istrue(agent.var_895dae193cfaac3a) && !issubstr(agent.agent_type, "merc")) {
            agent setscriptablepartstate("helmet", "off");
            agent.var_250a0d62e13c6e73 = undefined;
            agent.var_3fe8ab9198171c21 = 1;
        } else {
            if (isdefined(level.var_1a2b600a06ec21f4) && isdefined(level.var_1a2b600a06ec21f4.var_55b13c315ab289c8)) {
                var_eb360908742e60bb = level.var_1a2b600a06ec21f4.var_55b13c315ab289c8;
            }
            if (agent hastag(agent.headmodel, var_eb360908742e60bb)) {
                agent hidepart(var_eb360908742e60bb, agent.headmodel);
            }
        }
    }
}

// Namespace namespace_965527752cbd4cca/namespace_daa149ca485fd50a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b2b
// Size: 0xb8
function function_b8c245105cc37f9e(objweapon) {
    var_5d59d8b177f36f36 = 0;
    var_b7057b2bc6bb0b4b = getdvarint(@"hash_a5eac9a0f544c3cf", 1);
    if (istrue(var_b7057b2bc6bb0b4b)) {
        if (isdefined(objweapon) && isdefined(objweapon.basename)) {
            var_c7a4725d05bb7f22 = agentpers_getagentpersdata(self, "tier");
            var_88732a0a3c17be02 = agentpers_getagentpersdata(self, "category");
            if (isdefined(var_88732a0a3c17be02) && var_88732a0a3c17be02 != "bosses" && isdefined(var_c7a4725d05bb7f22)) {
                switch (objweapon.basename) {
                case #"hash_91a48ebfd2d03a40":
                    var_5d59d8b177f36f36 = 1;
                    break;
                }
            }
        }
    }
    return var_5d59d8b177f36f36;
}

// Namespace namespace_965527752cbd4cca/namespace_daa149ca485fd50a
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1beb
// Size: 0x500
function handleriotshielddamage(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (!istrue(self.bhasriotshieldattached)) {
        return 0;
    }
    if (isdefined(sweapon) && sweapon.basename == "super_laser_charge_mp") {
        self.forcehitlocation = "none";
        return 0;
    } else if (isdefined(self.forcehitlocation)) {
        return 0;
    }
    var_5c3f9357f11d2223 = objweapon.basename;
    var_83a06097f54c024b = 0;
    if (isdefined(einflictor) && (issubstr(var_5c3f9357f11d2223, "thermite") || isdefined(objweapon.magazine) && issubstr(objweapon.magazine, "boltfire") || isdefined(einflictor.weapon_name) && issubstr(einflictor.weapon_name, "incendiary"))) {
        var_83a06097f54c024b = 1;
        var_35af7dae0105a3e3 = shitloc == "shield";
        if (var_35af7dae0105a3e3) {
            contents = namespace_2a184fc4902783dc::create_character_contents();
            var_759cadfd4d74bffd = vectornormalize(vdir);
            startpos = vpoint - var_759cadfd4d74bffd * 12;
            endpos = vpoint + var_759cadfd4d74bffd * 12;
            results = namespace_2a184fc4902783dc::ray_trace_detail(startpos, endpos, undefined, contents);
            if (results["fraction"] > 0 && results["fraction"] < 1) {
                var_1b4fd8d84ca96180 = vpoint - self.origin;
                var_1b4fd8d84ca96180 = (var_1b4fd8d84ca96180[0], var_1b4fd8d84ca96180[1], 0);
                if (vectordot(var_1b4fd8d84ca96180, results["normal"]) < 0) {
                    var_35af7dae0105a3e3 = 0;
                }
            } else {
                var_35af7dae0105a3e3 = 0;
            }
        }
        if (var_35af7dae0105a3e3) {
            parent = einflictor getlinkedparent();
            if (isdefined(parent) && parent == self) {
                self.bhasthermitestucktoshield = 1;
                self.thermitestuckpains = 0;
            }
        } else if (shitloc != "none") {
            self.bhasthermitestucktoshield = 0;
            self.thermitestuckpains = undefined;
        }
    } else if (isdefined(einflictor) && issubstr(var_5c3f9357f11d2223, "bunkerbuster")) {
        if (shitloc == "shield") {
            einflictor.var_ce68de48bc529cd2 = self;
            einflictor.var_16ac6fac07eacbc3 = 1;
        }
    }
    if (shitloc == "shield") {
        if (var_83a06097f54c024b) {
            /#
                if (getdvarint(@"hash_f42eefd3e1b79376") != 0) {
                    println("<unknown string>");
                }
            #/
            return 1;
        }
    } else if (shitloc == "none" && isdefined(einflictor)) {
        var_afcdb89d9c3e8439 = einflictor getlinkedparent();
        if (self.bhasthermitestucktoshield && var_83a06097f54c024b && isdefined(var_afcdb89d9c3e8439) && var_afcdb89d9c3e8439 == self) {
            if (!isdefined(self.thermitestucktoshield)) {
                self.thermitestucktoshield = [0:einflictor];
            } else if (!array_contains(self.thermitestucktoshield, einflictor)) {
                self.thermitestucktoshield[self.thermitestucktoshield.size] = einflictor;
            }
            /#
                assert(isdefined(self.thermitestuckpains));
            #/
            /#
                if (getdvarint(@"hash_f42eefd3e1b79376") != 0) {
                    println("<unknown string>");
                }
            #/
            self.thermitestuckpains++;
            return 1;
        } else if (issubstr(var_5c3f9357f11d2223, "molotov")) {
            var_289cb9fcbd6aa7c8 = einflictor.origin - self.origin;
            var_8b5b7d7c1e6793de = vectornormalize((var_289cb9fcbd6aa7c8[0], var_289cb9fcbd6aa7c8[1], 0));
            var_289cb9fcbd6aa7c8 = vectornormalize(var_289cb9fcbd6aa7c8);
            if (vectordot(anglestoforward(self.angles), var_8b5b7d7c1e6793de) > 0.5 && -0.98 < var_289cb9fcbd6aa7c8[2] && var_289cb9fcbd6aa7c8[2] < 0.98) {
                /#
                    if (getdvarint(@"hash_f42eefd3e1b79376") != 0) {
                        println("<unknown string>");
                    }
                #/
                return 1;
            }
        }
    }
    if (smeansofdeath == "MOD_MELEE") {
        if (isdefined(eattacker)) {
            var_392a20ab0d4853fb = vectornormalize(eattacker.origin - self.origin);
        } else {
            var_392a20ab0d4853fb = vectornormalize(vpoint - self.origin);
        }
        var_c4182e9c211ff588 = anglestoforward(self.angles);
        if (vectordot(var_c4182e9c211ff588, var_392a20ab0d4853fb) > 0.5) {
            /#
                if (getdvarint(@"hash_f42eefd3e1b79376") != 0) {
                    println("<unknown string>");
                }
            #/
            return 1;
        }
    }
    return 0;
}

