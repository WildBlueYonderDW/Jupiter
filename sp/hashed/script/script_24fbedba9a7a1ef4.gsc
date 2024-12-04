#using script_371b4c2ab5861e62;
#using script_7c40fa80892a721;
#using scripts\common\debug;
#using scripts\common\utility;
#using scripts\cp_mp\utility\damage_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_collision;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace namespace_965527752cbd4cca;

// Namespace namespace_965527752cbd4cca / namespace_daa149ca485fd50a
// Params 13, eflags: 0x0
// Checksum 0x0, Offset: 0x46b
// Size: 0xe5
function callbacksoldieragentdamaged(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (isdefined(self.var_970170ffd4b081ac)) {
        idamage = self [[ self.var_970170ffd4b081ac ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    }
    if (isdefined(self.callbackdamaged)) {
        [[ self.callbackdamaged ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
        return;
    }
    function_dffac413ed66bcd0(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
}

// Namespace namespace_965527752cbd4cca / namespace_daa149ca485fd50a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x558
// Size: 0x65
function function_34672e1ee2e90cf8(objweapon, idamage) {
    if (!isdefined(objweapon)) {
        return idamage;
    }
    class = weaponclass(objweapon);
    if (isdefined(class) && class == "spread") {
        idamagemax = getdvarint(@"hash_877c52caf0f9aa8c", 35);
        idamage = int(min(idamage, idamagemax));
    }
    return idamage;
}

// Namespace namespace_965527752cbd4cca / namespace_daa149ca485fd50a
// Params 13, eflags: 0x0
// Checksum 0x0, Offset: 0x5c6
// Size: 0xe36
function function_dffac413ed66bcd0(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    evictim = self;
    initial_damage = idamage;
    armordelta = 0;
    helmetdelta = 0;
    shouldoneshot = function_b8c245105cc37f9e(objweapon);
    unmodifieddamage = idamage;
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
    isplayerdamage = isdefined(eattacker) && isplayer(eattacker);
    var_7543d4fe49c53684 = isdefined(eattacker) && isdefined(eattacker.owner) && isplayer(eattacker.owner);
    isplayervehicle = isdefined(eattacker) && isdefined(eattacker.classname) && eattacker.classname == "script_vehicle" && isdefined(eattacker.owner) && isplayer(eattacker.owner);
    isplayervehicledamage = isplayervehicle && smeansofdeath == "MOD_CRUSH";
    if (isdefined(evictim.forcehitlocation)) {
        shitloc = evictim.forcehitlocation;
        evictim.forcehitlocation = undefined;
    }
    if (isplayervehicledamage) {
        rangeauto = getdvarfloat(@"hash_e58868d4f3626e25", 500);
        rangesight = getdvarfloat(@"hash_4ca14712d81d0747", 1500);
        if (isdefined(self.stealth)) {
            if (isdefined(self.stealth.override_damage_auto_range)) {
                rangeauto = self.stealth.override_damage_auto_range;
            } else if (isdefined(level.stealth.override_damage_auto_range)) {
                rangeauto = level.stealth.override_damage_auto_range;
            }
            if (isdefined(self.stealth.override_damage_sight_range)) {
                rangesight = self.stealth.override_damage_sight_range;
            } else if (isdefined(level.stealth.override_damage_sight_range)) {
                rangesight = level.stealth.override_damage_sight_range;
            }
        }
        if (idamage >= self.health) {
            function_aad7a0ea8ac4ca23("ally_killed", self, eattacker.owner, rangeauto, rangesight);
        }
        if (iscp() && soundexists("vehicle_body_hit")) {
            playsoundatpos(self.origin, "vehicle_body_hit");
        }
    }
    if (scripts\engine\utility::issharedfuncdefined("player", "gulagTrackPlayerBulletHitAI")) {
        [[ scripts\engine\utility::getsharedfunc("player", "gulagTrackPlayerBulletHitAI") ]](eattacker, idamage);
    }
    if (smeansofdeath == "MOD_CRUSH" && isdefined(einflictor) && isdefined(einflictor.var_746334c2ac85aacc)) {
        idamage = einflictor.var_746334c2ac85aacc;
    }
    if (getdvarint(@"hash_f40118cb927a0802", 0) == 1) {
        idamage = function_34672e1ee2e90cf8(objweapon, idamage);
    }
    headshot = scripts\cp_mp\utility\damage_utility::isheadshot(shitloc, smeansofdeath, eattacker);
    if (smeansofdeath == "MOD_MELEE") {
        specialmelee = 0;
        if (isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "iw9_me_buzzsaw_mp") {
            specialmelee = 1;
        }
        if (!specialmelee) {
            idamage = int(min(idamage, 135));
        }
    } else if (isdefined(eattacker) && isplayer(eattacker) && isdefined(objweapon) && isdefined(objweapon.basename) && (objweapon.basename == "throwingknife_mp" || objweapon.basename == "throwingknife_cp" || objweapon.basename == "shuriken_mp" || objweapon.basename == "throwstar_mp")) {
        shouldoneshot = istrue(self.var_685390c6753c2cc7);
        var_66efe6ff4098c684 = istrue(self.var_282d867559c07771);
        if (iscp()) {
            var_b656251147d7d40b = isdefined(partname) && scripts\cp_mp\utility\damage_utility::function_b656251147d7d40b(partname);
            if (shouldoneshot || var_66efe6ff4098c684 && (istrue(headshot) || istrue(var_b656251147d7d40b))) {
                idamage = self.health;
            } else if (var_66efe6ff4098c684) {
                idamage = int(self.maxhealth / 2);
            } else {
                idamage = 400;
            }
        } else {
            idamage = ter_op(shouldoneshot, int(max(400, self.health + self.armorhealth)), 400);
            if (var_66efe6ff4098c684) {
                idamage = ter_op(var_66efe6ff4098c684, int(max(400, self.health / 2 + self.armorhealth / 2)), 400);
            }
        }
    }
    if (isexplosivedamagemod(smeansofdeath)) {
        if (issharedfuncdefined("thermobaric_grenade", "thermobaric_additional_explosive_damage")) {
            idamage += [[ getsharedfunc("thermobaric_grenade", "thermobaric_additional_explosive_damage") ]](evictim, eattacker, idamage);
        }
    }
    if (!headshot && isdefined(self.armorhealth) && self.armorhealth > 0 && smeansofdeath != "MOD_CRUSH" && (!isdefined(self.var_f8ecc64162438d76) || !array_contains(self.var_f8ecc64162438d76, einflictor))) {
        __a0 = namespace_f8d3520d3483c1::function_90ce8eb3ddaa4943(eattacker, einflictor, evictim, idamage, objweapon, smeansofdeath, shitloc, idflags, initial_damage, unmodifieddamage);
        var_1da1a66b5c6a06a7 = __a0[1];
        idamage = __a0[0];
        armordelta = var_1da1a66b5c6a06a7;
        if (iscp() && damage_isexplosive(smeansofdeath) && idamage <= 0 && !istrue(self.var_c7b10080abf06d59)) {
            armordelta = self.armorhealth;
            if (idamage <= 0) {
                namespace_f8d3520d3483c1::breakarmor();
                self notify("flashbang", (0, 0, 0), 1, 1, eattacker);
            }
        }
        if (idamage <= 0) {
            idamage = 1;
            self.health += 1;
        }
    }
    if (headshot && smeansofdeath != "MOD_CRUSH" && !scripts\cp_mp\utility\damage_utility::function_cb9ba92488b23c5(objweapon)) {
        hashelmet = istrue(self.helmethealth) && self.helmethealth > 0;
        if (hashelmet) {
            if (istrue(self.var_895dae193cfaac3a)) {
                helmetdelta = idamage;
                namespace_f8d3520d3483c1::function_e71f062243ea8827(idamage, 0, eattacker);
                idamage = 1;
                self.health += 1;
            } else {
                helmetdelta = 1;
                var_798ca175be748e74 = 0;
                if (!istrue(self.var_ef3bfd0243258e2f)) {
                    if (scripts\common\utility::getdamagetype(smeansofdeath) == "splash") {
                        var_798ca175be748e74 = 1;
                    }
                    if ((sweapon.classname == "sniper" || sweapon.classname == "dmr") && idamage > 1000 || sweapon.classname == "turret") {
                        if (self.helmethealth == 1) {
                            var_798ca175be748e74 = 1;
                        }
                        helmetdelta = self.helmethealth;
                    }
                }
                if (isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "iw9_dm_crossbow_mp" && iscp()) {
                    var_798ca175be748e74 = 1;
                    shouldoneshot = 1;
                }
                namespace_f8d3520d3483c1::function_e71f062243ea8827(helmetdelta, 0, eattacker);
                if (!istrue(var_798ca175be748e74)) {
                    idamage = 1;
                    self.health += 1;
                }
            }
        }
    }
    if (armordelta == 0 && helmetdelta == 0 && isbulletdamage(smeansofdeath) && scripts\cp_mp\utility\damage_utility::isheadshot(shitloc, smeansofdeath, eattacker)) {
        idamage = int(max(idamage, self.health));
    }
    if (shouldoneshot) {
        idamage = self.health;
    }
    if (scripts\engine\utility::issharedfuncdefined("relics", "modify_agent_damage")) {
        idamage = self [[ scripts\engine\utility::getsharedfunc("relics", "modify_agent_damage") ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    }
    armorhit = armordelta > 0;
    helmethit = helmetdelta > 0;
    if (armorhit || helmethit) {
        idflags |= 512;
    }
    if (getdvarint(@"hash_df80c6d770ba0231", 1) == 1) {
        var_1da1a66b5c6a06a7 = armordelta + helmetdelta;
        var_986b2e0350629522 = 0;
        iskillstreakweapon = 0;
        if (scripts\engine\utility::issharedfuncdefined("ai_mp_controller", "handleDamageFeedback")) {
            var_974fefea31f1fabe = scripts\engine\utility::getsharedfunc("ai_mp_controller", "handleDamageFeedback");
            [[ var_974fefea31f1fabe ]](einflictor, eattacker, self, idamage, smeansofdeath, objweapon, shitloc, idflags, var_1da1a66b5c6a06a7, var_986b2e0350629522, iskillstreakweapon);
        }
    }
    /#
        scripts\cp_mp\utility\weapon_utility::function_c9e5c511b923a42f(idamage, eattacker, evictim, smeansofdeath, shitloc, einflictor, vpoint, armordelta, undefined, helmetdelta);
    #/
    idamage = int(idamage);
    if (utility::getdamagetype(smeansofdeath) == "splash") {
        idamage *= 2;
    }
    if (istrue(evictim.gulagjailer)) {
        var_2d776dde0a657b53 = idamage + armordelta;
        self function_136d20776df768d2(var_2d776dde0a657b53, eattacker, vdir, vpoint);
        if (isdefined(level.var_c0f958f7943f0cde)) {
            evictim [[ level.var_c0f958f7943f0cde ]](var_2d776dde0a657b53);
        }
    }
    if (isplayerdamage || var_7543d4fe49c53684 || isplayervehicledamage) {
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
                if (scripts\engine\utility::issharedfuncdefined("weaponstats", "threadedSetWeaponStatByName")) {
                    attacker thread [[ scripts\engine\utility::getsharedfunc("weaponstats", "threadedSetWeaponStatByName") ]](var_366b0ecc2f28aead, var_ba9dc00e6d5896dc, "damage", self);
                }
            }
        }
    }
    if (istrue(evictim.agentdamagefeedback)) {
        biskillstreakweapon = 0;
        if (scripts\engine\utility::issharedfuncdefined("killstreak", "isKillstreakWeapon")) {
            biskillstreakweapon = isdefined(objweapon) && [[ scripts\engine\utility::getsharedfunc("killstreak", "isKillstreakWeapon") ]](objweapon.basename);
            if (scripts\engine\utility::issharedfuncdefined("damage", "handleDamageFeedback")) {
                eattacker [[ scripts\engine\utility::getsharedfunc("damage", "handleDamageFeedback") ]](einflictor, eattacker, evictim, idamage, smeansofdeath, objweapon, shitloc, idflags, 0, 0, biskillstreakweapon);
            }
        }
    }
    if (isdefined(sweapon) && !sweapon issilenced()) {
        agentpers_setagentpersdata(self, "lastNonSilencedDamageTime", gettime());
    }
    if (isbulletdamage(smeansofdeath) && isalive(evictim)) {
        function_216c67ab6749137a(evictim, undefined, "wounded");
    }
    if (scripts\engine\utility::issharedfuncdefined("damage", "process_events_and_challenges_on_death")) {
        self [[ scripts\engine\utility::getsharedfunc("damage", "process_events_and_challenges_on_death") ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    }
    /#
        if (getdvarint(@"g_debugdamage") != 0) {
            if (idamage != initial_damage) {
                println("<dev string:x1c>" + idamage);
            }
        }
        if (getdvarint(@"hash_81d89e4abec64203", 0) != 0) {
            dmg_data = [];
            dmg_data["<dev string:x30>"] = einflictor;
            dmg_data["<dev string:x3b>"] = eattacker;
            dmg_data["<dev string:x45>"] = idamage;
            dmg_data["<dev string:x4d>"] = smeansofdeath;
            dmg_data["<dev string:x5b>"] = sweapon;
            dmg_data["<dev string:x63>"] = vpoint;
            dmg_data["<dev string:x6a>"] = vdir;
            dmg_data["<dev string:x6f>"] = shitloc;
            dmg_data["<dev string:x77>"] = objweapon;
            dmg_data["<dev string:x81>"] = partname;
            scripts\common\debug::function_8245dce28f1f395c(dmg_data, initial_damage, 1);
        }
    #/
    if (isdefined(evictim.unittype) && isdefined(level.agent_funcs[evictim.unittype]) && isdefined(level.agent_funcs[evictim.unittype]["on_damaged_finished"])) {
        evictim [[ level.agent_funcs[evictim.unittype]["on_damaged_finished"] ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, 0, modelindex, partname, armorhit);
        return;
    }
    assert(isdefined(level.agent_funcs[evictim.agent_type]["on_damaged_finished"]));
    evictim [[ level.agent_funcs[evictim.agent_type]["on_damaged_finished"] ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, 0, modelindex, partname, armorhit);
}

// Namespace namespace_965527752cbd4cca / namespace_daa149ca485fd50a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1404
// Size: 0x68
function damage_isexplosive(smeansofdeath) {
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
    }
}

// Namespace namespace_965527752cbd4cca / namespace_daa149ca485fd50a
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1474
// Size: 0x250
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
    if (scripts\engine\utility::issharedfuncdefined("threat_bias", "customFriendlyCheck")) {
        return [[ scripts\engine\utility::getsharedfunc("threat_bias", "customFriendlyCheck") ]](agent, attacker, inflictor, meansofdeath);
    }
    return 0;
}

// Namespace namespace_965527752cbd4cca / namespace_daa149ca485fd50a
// Params 13, eflags: 0x0
// Checksum 0x0, Offset: 0x16cd
// Size: 0x1a1
function function_84a1aec445b03580(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    var_86c7c655ad6283d7 = isdefined(smeansofdeath) && smeansofdeath == "MOD_CRUSH" && isdefined(einflictor) && isent(einflictor) && einflictor scripts\cp_mp\vehicles\vehicle::isvehicle() && scripts\cp_mp\vehicles\vehicle_collision::function_6eb1fba746b72f46(einflictor) < 3;
    var_663299b134fb78d = isdefined(self.origin) && isdefined(level.var_f0872e42daf6d4d5) && distancesquared(level.var_f0872e42daf6d4d5, self.origin) < 250000;
    var_abb16a8745308d16 = isplayer(eattacker) && isdefined(sweapon.basename) && sweapon.basename == "iw9_pi_stimpistol_mp" && isbulletdamage(smeansofdeath);
    var_10effa490054d61e = isdefined(self.var_d9134148f9bb887) && isdefined(self.var_f39c6b01b1d95542) && gettime() >= self.var_f39c6b01b1d95542 && gettime() < self.var_d9134148f9bb887;
    return !istrue(self.invulnerable) && !var_86c7c655ad6283d7 && !var_663299b134fb78d && !var_abb16a8745308d16 && !var_10effa490054d61e;
}

// Namespace namespace_965527752cbd4cca / namespace_daa149ca485fd50a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1877
// Size: 0x1c
function function_7d0d24665d72f13c(agent, attacker) {
    function_1920867ddf76810c(agent, 0);
}

// Namespace namespace_965527752cbd4cca / namespace_daa149ca485fd50a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x189b
// Size: 0x13f
function function_59ea6b2f800cb082(agent, attacker) {
    hidebone = "j_helmet_hide";
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
            agent.helmetdamaged = undefined;
            agent.helmetbroken = 1;
            return;
        }
        if (isdefined(level.gamemodebundle) && isdefined(level.gamemodebundle.var_55b13c315ab289c8)) {
            hidebone = level.gamemodebundle.var_55b13c315ab289c8;
        }
        if (agent hastag(agent.headmodel, hidebone)) {
            agent hidepart(hidebone, agent.headmodel);
        }
    }
}

// Namespace namespace_965527752cbd4cca / namespace_daa149ca485fd50a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19e2
// Size: 0xb7
function function_b8c245105cc37f9e(objweapon) {
    shouldoneshot = 0;
    overrideoneshot = getdvarint(@"hash_a5eac9a0f544c3cf", 1);
    if (istrue(overrideoneshot)) {
        if (isdefined(objweapon) && isdefined(objweapon.basename)) {
            agenttier = agentpers_getagentpersdata(self, "tier");
            agentcategory = agentpers_getagentpersdata(self, "category");
            if (isdefined(agentcategory) && agentcategory != "bosses" && isdefined(agenttier)) {
                switch (objweapon.basename) {
                case #"hash_91a48ebfd2d03a40":
                    shouldoneshot = 1;
                    break;
                }
            }
        }
    }
    return shouldoneshot;
}

// Namespace namespace_965527752cbd4cca / namespace_daa149ca485fd50a
// Params 13, eflags: 0x0
// Checksum 0x0, Offset: 0x1aa2
// Size: 0x4ed
function handleriotshielddamage(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (!istrue(self.bhasriotshieldattached)) {
        return false;
    }
    if (isdefined(sweapon) && sweapon.basename == "super_laser_charge_mp") {
        self.forcehitlocation = "none";
        return false;
    }
    weaponbasename = objweapon.basename;
    bthermite = 0;
    if (isdefined(einflictor) && (issubstr(weaponbasename, "thermite") || isdefined(objweapon.magazine) && issubstr(objweapon.magazine, "boltfire") || isdefined(einflictor.weapon_name) && issubstr(einflictor.weapon_name, "incendiary"))) {
        bthermite = 1;
        var_35af7dae0105a3e3 = shitloc == "shield";
        if (var_35af7dae0105a3e3) {
            contents = scripts\engine\trace::create_character_contents();
            dirnormalized = vectornormalize(vdir);
            startpos = vpoint - dirnormalized * 12;
            endpos = vpoint + dirnormalized * 12;
            results = scripts\engine\trace::ray_trace_detail(startpos, endpos, undefined, contents);
            if (results["fraction"] > 0 && results["fraction"] < 1) {
                metopoint = vpoint - self.origin;
                metopoint = (metopoint[0], metopoint[1], 0);
                if (vectordot(metopoint, results["normal"]) < 0) {
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
    } else if (isdefined(einflictor) && issubstr(weaponbasename, "bunkerbuster")) {
        if (shitloc == "shield") {
            einflictor.riotshieldvictim = self;
            einflictor.riotshieldhit = 1;
        }
    }
    if (shitloc == "shield") {
        if (bthermite) {
            /#
                if (getdvarint(@"g_debugdamage") != 0) {
                    println("<dev string:x8a>");
                }
            #/
            return true;
        }
    } else if (shitloc == "none" && isdefined(einflictor)) {
        inflictorparent = einflictor getlinkedparent();
        if (self.bhasthermitestucktoshield && bthermite && isdefined(inflictorparent) && inflictorparent == self) {
            if (!isdefined(self.thermitestucktoshield)) {
                self.thermitestucktoshield = [einflictor];
            } else if (!array_contains(self.thermitestucktoshield, einflictor)) {
                self.thermitestucktoshield[self.thermitestucktoshield.size] = einflictor;
            }
            assert(isdefined(self.thermitestuckpains));
            /#
                if (getdvarint(@"g_debugdamage") != 0) {
                    println("<dev string:xa3>");
                }
            #/
            self.thermitestuckpains++;
            return true;
        } else if (issubstr(weaponbasename, "molotov")) {
            var_289cb9fcbd6aa7c8 = einflictor.origin - self.origin;
            var_8b5b7d7c1e6793de = vectornormalize((var_289cb9fcbd6aa7c8[0], var_289cb9fcbd6aa7c8[1], 0));
            var_289cb9fcbd6aa7c8 = vectornormalize(var_289cb9fcbd6aa7c8);
            if (vectordot(anglestoforward(self.angles), var_8b5b7d7c1e6793de) > 0.5 && -0.98 < var_289cb9fcbd6aa7c8[2] && var_289cb9fcbd6aa7c8[2] < 0.98) {
                /#
                    if (getdvarint(@"g_debugdamage") != 0) {
                        println("<dev string:xc0>");
                    }
                #/
                return true;
            }
        }
    }
    if (smeansofdeath == "MOD_MELEE") {
        if (isdefined(eattacker)) {
            var_392a20ab0d4853fb = vectornormalize(eattacker.origin - self.origin);
        } else {
            var_392a20ab0d4853fb = vectornormalize(vpoint - self.origin);
        }
        meforward = anglestoforward(self.angles);
        if (vectordot(meforward, var_392a20ab0d4853fb) > 0.5) {
            /#
                if (getdvarint(@"g_debugdamage") != 0) {
                    println("<dev string:xe1>");
                }
            #/
            return true;
        }
    }
    return false;
}

