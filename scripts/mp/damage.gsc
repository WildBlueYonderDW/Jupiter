// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\mp\riotshield.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using scripts\mp\perks\weaponpassives.gsc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using script_2669878cf5a1b6bc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\dragonsbreath.gsc;
#using script_7c40fa80892a721;
#using script_b0385bb45379222;
#using script_46fdf7b12c5f5620;
#using scripts\mp\flags.gsc;
#using script_55e6a436b6b3048c;
#using script_556b8aeaa691317f;
#using scripts\mp\cranked.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\cp_mp\crossbow.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_52d91cb28006a5bd;
#using scripts\cp_mp\equipment\throwing_knife.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\potg_events.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_19fd5b5d73d44c18;
#using scripts\mp\shellshock.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\perks\perk_mark_targets.gsc;
#using script_5bc60484d17fa95c;
#using scripts\mp\class.gsc;
#using scripts\mp\gametypes\br_jugg_common.gsc;
#using scripts\mp\perks\headgear.gsc;
#using scripts\mp\equipment\trophy_system.gsc;
#using scripts\mp\heavyarmor.gsc;
#using scripts\mp\lightarmor.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\juggernaut.gsc;
#using script_6a5d3bf7a5b7064a;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\mp\equipment\claymore.gsc;
#using scripts\mp\equipment\at_mine.gsc;
#using script_10ad6174c8938599;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\events.gsc;
#using script_15eddb0fac236a22;
#using script_4a6760982b403bad;
#using scripts\cp_mp\execution.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\outline.gsc;
#using scripts\mp\equipment\molotov.gsc;
#using scripts\mp\equipment\throwing_knife_mp.gsc;
#using scripts\cp_mp\pet_watch.gsc;
#using scripts\mp\equipment\nvg.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\equipment\wristrocket.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\laststand.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\bounty.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\outofbounds.gsc;
#using script_cbb0697de4c5728;
#using scripts\mp\gameobjects.gsc;
#using script_77c18cdedec620b3;
#using scripts\mp\deathicons.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_3583ff375ab3a91e;
#using scripts\mp\killcam.gsc;
#using scripts\mp\final_killcam.gsc;
#using scripts\mp\spawncamera.gsc;
#using scripts\mp\teams.gsc;
#using script_548072087c9fd504;
#using scripts\mp\weaponrank.gsc;
#using scripts\mp\equipment\binoculars.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\gametypes\br_plunder.gsc;
#using script_74b851b7aa1ef32d;
#using scripts\cp_mp\gestures.gsc;
#using script_600b944a95c3a7bf;
#using script_67015c88c47ec4f8;
#using script_372301af73968cb;
#using script_6cb0280f7aa7d3cd;
#using script_6e2bb9330396afcb;
#using script_63634d9fa080435a;
#using scripts\mp\damage.gsc;
#using script_14d3930854cb398c;
#using script_189b67b2735b981d;
#using scripts\cp_mp\entityheadicons.gsc;
#using script_6d68cfdf0836123c;

#namespace damage;

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 16, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e7
// Size: 0x1140
function callback_playerdamage_internal(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, var_b0fc59ff15058522, var_be4285b26ed99ab1) {
    if (isdefined(eattacker) && isdefined(eattacker.classname) && eattacker.classname == "worldspawn") {
        eattacker = undefined;
    }
    if (isdefined(eattacker) && isdefined(eattacker.gunner)) {
        eattacker = eattacker.gunner;
    }
    if (getdvarint(@"hash_c36efcba0f21f379", 0) == 1 && isdefined(objweapon)) {
        var_7956cc8a3f6e983d = weapon::getweaponrootname(objweapon.basename);
        var_904c82687ddfeb02 = namespace_38b993c4618e76cd::function_a50b607d2500dda5(var_7956cc8a3f6e983d);
        var_b2a4bce10dbbb085 = namespace_38b993c4618e76cd::function_20be2251dd0a8076(var_904c82687ddfeb02);
        var_eaa882d1344e713 = var_904c82687ddfeb02 == 39598 && level.gametype == "gold_gun" && istrue(eattacker.raygun);
        if (var_b2a4bce10dbbb085 && !var_eaa882d1344e713) {
            victim = eattacker;
        }
    }
    if (istrue(victim.plotarmor)) {
        function_403e958ecd04f255(victim, "isTrue( victim.plotArmor )");
        return;
    }
    if (isdefined(victim.takedamage) && victim.takedamage == 0) {
        return;
    }
    if (player::isinlaststand(victim) && istrue(level.var_c53947782c7460f6)) {
        var_5f8fa6dbaf5f0e27 = istrue(level.var_9039ba619a4ab3e1) && smeansofdeath == "MOD_FALLING";
        var_5f8fa6dbaf5f0e27 = var_5f8fa6dbaf5f0e27 | (istrue(level.var_b0830df5265878d5) && isplayer(eattacker));
        if (!var_5f8fa6dbaf5f0e27) {
            function_403e958ecd04f255(victim, "isInLastStand( victim ) && IsTrue( level.laststand_always_disable_damage )");
            return;
        }
    }
    if (namespace_24e240b9cee9d3b9::function_f79445ae166c7150(eattacker, victim) || namespace_5c7433352e1f5cc7::function_7b08c98431abda40(eattacker, victim)) {
        function_403e958ecd04f255(victim, "isInLastStand( victim ) && IsTrue( level.laststand_always_disable_damage )");
        return;
    }
    /#
        if (getdvarint(@"hash_62a47106347dc9c3", 0) == 1) {
            function_403e958ecd04f255(victim, "weapon_shotgun");
            return;
        }
        if (isdefined(victim.team)) {
            var_a993c42adf98794d = getdvarint(function_2ef675c13ca1c4af(@"hash_cc6c5774be41ec78", utility::string(victim.team)), 0) != 0;
            if (var_a993c42adf98794d) {
                function_403e958ecd04f255(victim, "hits");
                return;
            }
        }
        if (getdvarint(@"hash_45dd70c0ac1afda2", 0) != 0) {
            victim finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, 0);
            function_403e958ecd04f255(victim, "on_damaged_finished");
            return;
        }
    #/
    if (getdvarint(@"hash_b372945583547be6", 0) && isplayer(eattacker) && isplayer(victim) && eattacker != victim) {
        function_403e958ecd04f255(victim, "scr_dmz_pve_enabled 1");
        return;
    }
    if (istrue(victim.inlaststand) && istrue(level.laststandrequiresmelee) && smeansofdeath != "MOD_MELEE") {
        function_403e958ecd04f255(victim, "istrue( victim.inLastStand ) && istrue( level.lastStandRequiresMelee ) && sMeansOfDeath != MOD_MELEE");
        return;
    }
    var_fcdf19e3cdd29669 = victim.health;
    if (idflags & 16 && shitloc != "shield") {
        function_403e958ecd04f255(victim, "iDFlags & DFLAGS_STUN");
        return;
    }
    var_fc92d300e26e37a0 = filterdamage(einflictor, eattacker, victim, idamage, smeansofdeath, objweapon, shitloc);
    if (isdefined(var_fc92d300e26e37a0)) {
        function_403e958ecd04f255(victim, "filterDamage true, " + var_fc92d300e26e37a0);
        return;
    }
    attackerishittingteammate = attackerishittingteam(victim, eattacker);
    iskillstreakweapon = isdefined(objweapon) && weapon::iskillstreakweapon(objweapon.basename);
    if (!istrue(level.allowprematchdamage)) {
        if (istrue(game["inLiveLobby"]) || !flags::gameflag("prematch_done") || istrue(level.infilcinematicactive)) {
            handledamagefeedback(einflictor, eattacker, victim, 0, smeansofdeath, objweapon, shitloc, idflags, 1, 1, iskillstreakweapon);
            function_403e958ecd04f255(victim, "!istrue( level.allowPrematchDamage ) in prematch still");
            return;
        }
    }
    if (isdefined(level.var_2ceb2474be1c597e) && [[ level.var_2ceb2474be1c597e ]](einflictor, eattacker, victim, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, var_b0fc59ff15058522, var_be4285b26ed99ab1)) {
        return;
    }
    var_f754ceb1e24b2acd = isplayer(victim) && victim function_fc05ebabfbf10e33() && smeansofdeath != "MOD_MEATSHIELD";
    if (istrue(var_f754ceb1e24b2acd)) {
        var_3418f54f3481ca60 = victim function_3be2afc5f1b4cd2d();
        if (attackerishittingteam(var_3418f54f3481ca60, eattacker)) {
            return;
        }
        if (smeansofdeath == "MOD_EXPLOSIVE" || smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_GRENADE_SPLASH") {
            idamage = int(idamage * getdvarfloat(@"hash_1dee446fa0921f47", 1));
        }
        victim namespace_7dc1ccf5f3dd5fdb::function_afdf3e6cbe0522d7(idamage, 0);
        eattacker handledamagefeedback(einflictor, eattacker, victim, idamage, smeansofdeath, objweapon, shitloc, idflags, 0, 0, iskillstreakweapon);
        var_6a7bec5bae7edfed = victim function_3be2afc5f1b4cd2d();
        if (!isdefined(var_6a7bec5bae7edfed)) {
            return;
        }
        idamage = 1;
        var_6a7bec5bae7edfed finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, undefined, 0);
        return;
    }
    var_5120869216e5bbbe = isplayer(victim) && victim function_a237aba99cf26050() && smeansofdeath == "MOD_FALLING";
    if (istrue(var_5120869216e5bbbe)) {
        var_5e64a8df23fb6063 = victim function_3be2afc5f1b4cd2d();
        if (isdefined(var_5e64a8df23fb6063) && isplayer(var_5e64a8df23fb6063)) {
            var_a6bb61971108293a = victim.health <= idamage;
            var_8cd906397bfa5efa = idamage / var_5e64a8df23fb6063.maxhealth * var_5e64a8df23fb6063.var_423a9f9e23833f65;
            var_5e64a8df23fb6063 namespace_7dc1ccf5f3dd5fdb::function_afdf3e6cbe0522d7(var_8cd906397bfa5efa, var_a6bb61971108293a);
        }
    }
    var_1a52fb785a04c793 = isdefined(einflictor) && einflictor vehicle::isvehicle() && !iskillstreakweapon && smeansofdeath == "MOD_EXPLOSIVE";
    if (attackerishittingteammate && !var_1a52fb785a04c793) {
        idamage = handlefriendlyfiredamage(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, iskillstreakweapon);
        if (idamage == 0) {
            function_403e958ecd04f255(victim, "handleFriendlyFireDamage damage == 0");
            return;
        }
    }
    if (istrue(super_stimpistol::function_c61ee6d60763e771()) && istrue(super_stimpistol::function_76ca0b3d8b2555ca(objweapon)) && utility::isbulletdamage(smeansofdeath)) {
        idamage = 0;
        function_403e958ecd04f255(victim, "super_stimPistol_getHostileRevivesEnabled() && super_stimPistol_isStimPistol() && isBulletDamage()");
        return;
    }
    if (istrue(victim.spawnprotection) || victim function_f1dcadc8f7c3477c()) {
        var_d0d4ae57019e885d = smeansofdeath == "MOD_TRIGGER_HURT" || isdefined(eattacker) && isdefined(eattacker.classname) && eattacker.classname == "trigger_hurt";
        var_228c3b335149221a = smeansofdeath == "MOD_FALLING";
        var_84e1133e7f895003 = smeansofdeath == "MOD_SUICIDE";
        if (!var_d0d4ae57019e885d && !var_228c3b335149221a && !var_84e1133e7f895003) {
            handledamagefeedback(einflictor, eattacker, victim, 0, smeansofdeath, objweapon, shitloc, idflags, 1, 1, iskillstreakweapon);
            function_403e958ecd04f255(victim, "( istrue( victim.spawnProtection ) || victim IsLastStandInvulnerable() ) && !wasHurtTrigger && !wasFallDamage");
            return;
        }
    }
    if (isdefined(eattacker) && istrue(eattacker.cranked)) {
        eattacker thread cranked::oncrankedhit(victim);
    }
    if (isdefined(eattacker) && isdefined(eattacker.classname) && eattacker.classname == "script_origin" && isdefined(eattacker.type) && eattacker.type == "soft_landing") {
        function_403e958ecd04f255(victim, "eAttacker.classname == script_origin && eAttacker.type == soft_landing");
        return;
    }
    var_d35e82fc5aa0aa84 = 1;
    if (isdefined(var_be4285b26ed99ab1) && var_be4285b26ed99ab1 > 0) {
        var_d35e82fc5aa0aa84 = idamage / var_be4285b26ed99ab1;
    }
    idflags = idflags | 4;
    if (isspreadweapon(objweapon) && namespace_25ead30c6ed027fb::validshotcheck(smeansofdeath, eattacker)) {
        if (namespace_23227899dfba5895::isdragonsbreathweapon(objweapon) && (weapon::getweapongroup(objweapon) == "weapon_shotgun" || istrue(objweapon.isalternate) || function_f30a6d3194f97c09(objweapon, "specialty_incendiary_alt"))) {
            victim thread dragonsbreathhitloccollection(shitloc, eattacker, objweapon);
        }
        idamage = spreadshotdamagemod(victim, eattacker, objweapon, idamage, idflags);
        if (idamage == 0) {
            function_403e958ecd04f255(victim, "isSpreadWeapon() && spreadShotDamageMod() iDamage == 0");
            return;
        }
    }
    var_5c3f9357f11d2223 = objweapon.basename;
    if (!isdefined(var_5c3f9357f11d2223)) {
        /#
            assertmsg("Damage.gsc - Callback_PlayerDamage_internal: objWeapon.baseName is undefined");
        #/
    }
    equiptype = getequipmenttype(objweapon);
    if (isdefined(equiptype)) {
        if (equiptype == "lethal") {
            idamage = lethalequipmentdamagemod(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon);
        } else {
            if (equiptype == "equipment_other") {
                goto LOC_00000a45;
            }
            if (equiptype == "tactical") {
            LOC_00000a45:
            }
        LOC_00000a45:
        }
    LOC_00000a45:
        damagedata = namespace_25ead30c6ed027fb::packdamagedata(eattacker, victim, idamage, objweapon, smeansofdeath, einflictor, vpoint, vdir, undefined, undefined, partname, undefined, idflags, undefined, shitloc);
        result = equipment::equiponplayerdamaged(damagedata);
        if (isdefined(result) && result == 0) {
            function_403e958ecd04f255(victim, "IsDefined( getEquipmentType ) && equipOnPlayerDamaged() == false");
            return;
        }
    }
    if (victim game_utility::ismatchstartprotected()) {
        var_e0815ed56506a6a3 = isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "minefield_mp";
        wassuicide = smeansofdeath == "MOD_SUICIDE";
        if (!var_e0815ed56506a6a3 && !wassuicide) {
            var_54a24336cc9a143d = istrue(objweapon.isalternate);
            if (isdefined(equiptype) && !weapon::isthrowingknife(var_5c3f9357f11d2223) || var_54a24336cc9a143d || smeansofdeath == "MOD_EXPLOSIVE") {
                var_54a88b0118510e9f = int(max(victim.health / 5, 1));
                if (idamage >= var_54a88b0118510e9f) {
                    idamage = var_54a88b0118510e9f;
                }
            }
        }
    }
    weaptype = weapon::getweapontype(var_5c3f9357f11d2223);
    if (isdefined(weaptype) && weaptype == "killstreak") {
        idamage = killstreakdamagefilter(eattacker, victim, idamage, objweapon, smeansofdeath);
        if (idamage == 0) {
            function_403e958ecd04f255(victim, "getWeaponType() == killstreak && iDamage == 0");
            return;
        }
        if (isdefined(level.gunshipplayer) && isdefined(eattacker) && level.gunshipplayer == eattacker) {
            level notify("ai_pain", victim);
        }
    }
    if (smeansofdeath == "MOD_CRUSH" && isdefined(eattacker) && isdefined(eattacker.streakname) && eattacker.streakname == "emp_drone") {
        idamage = 0;
    }
    idamage = handleriotshieldhits(einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, iskillstreakweapon);
    var_57accdc40b2f50e = modifydamagegeneral(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime, var_be4285b26ed99ab1, partname);
    var_1da1a66b5c6a06a7 = var_57accdc40b2f50e[1];
    idamage = var_57accdc40b2f50e[0];
    var_57acddc40b2f741 = function_694d74d8b5ac556f(eattacker, idamage, var_1da1a66b5c6a06a7, smeansofdeath, objweapon, victim);
    var_1da1a66b5c6a06a7 = var_57acddc40b2f741[1];
    idamage = var_57acddc40b2f741[0];
    if (idamage == 0 && var_1da1a66b5c6a06a7 == 0) {
        function_403e958ecd04f255(victim, "iDamage == 0 && lightArmorDamage == 0");
        return;
    }
    if (namespace_23227899dfba5895::isdragonsbreathweapon(objweapon) && !isspreadweapon(objweapon)) {
        victim thread function_c206c109a26f598(idamage + var_1da1a66b5c6a06a7, eattacker, objweapon, shitloc);
    } else if (crossbow::function_fc87aff67fb01e6f(objweapon)) {
        victim thread function_5a05899bb304a6d4(shitloc, namespace_3544bf049e15c786::function_42b0dfeb350f6ea5());
    }
    if (!istrue(victim.donotmodifydamage)) {
        var_619984a4a37b8423 = cac_modified_damage(victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, einflictor, 0, idflags, iskillstreakweapon, var_d35e82fc5aa0aa84);
        idamage = var_619984a4a37b8423[0];
        var_986b2e0350629522 = var_619984a4a37b8423[1];
        var_b2883531afa6b83d = var_1da1a66b5c6a06a7 != 0 || var_986b2e0350629522 != 0;
        shitloc = var_619984a4a37b8423[2];
    } else {
        var_986b2e0350629522 = 0;
        var_b2883531afa6b83d = 0;
    }
    if (!istrue(level.var_6ef7df34c802c174) && iskilltradedamage(eattacker, victim, idamage, smeansofdeath, objweapon, var_b0fc59ff15058522)) {
        function_403e958ecd04f255(victim, "isKillTradeDamage()");
        return;
    }
    if (isdefined(victim.forcehitlocation)) {
        shitloc = victim.forcehitlocation;
        victim.forcehitlocation = undefined;
    }
    if (isplayer(eattacker) && (var_5c3f9357f11d2223 == "smoke_grenade_mp" || weapon::isthrowingknife(var_5c3f9357f11d2223))) {
        eattacker thread gamelogic::threadedsetweaponstatbyname(var_5c3f9357f11d2223, 1, "hits");
    }
    var_b4c09bd8d141ed77 = vdir;
    if (isdefined(idflags) && idflags & 256 && idamage < self.health) {
        var_b4c09bd8d141ed77 = victim.origin - eattacker.origin;
    }
    if (isenvironmentalscriptableinflictor(einflictor)) {
        idamage = 0;
    }
    if (isplayer(eattacker)) {
        if (armor::armorvest_washit(eattacker) || helmet_washit(eattacker)) {
            if (idamage < victim.health) {
                idflags = idflags | 512;
            }
        }
        if (armor::armorvest_wasbroke(eattacker) || helmet_wasbroke(eattacker)) {
            if (idamage < victim.health) {
                idflags = idflags | 1024;
            }
        }
    }
    if (isdefined(level.onplayerdamaged_func)) {
        if (![[ level.onplayerdamaged_func ]](smeansofdeath)) {
            function_403e958ecd04f255(victim, "[[level.onPlayerDamaged_func]] == false");
            return;
        }
    }
    if (isdefined(einflictor) && isdefined(objweapon)) {
        if (isdefined(einflictor.equipmentref) && istrue(einflictor.equipmentref == "equip_throwstar")) {
            idamage = throwstar::function_db4bbcfe23f19148(einflictor, victim, idamage, partname);
        }
        if (isdefined(einflictor.var_ab13877362519a4f) && istrue(einflictor.var_ab13877362519a4f) && (istrue(einflictor.equipmentref == "equip_throwing_knife") || istrue(einflictor.equipmentref == "equip_shuriken") || istrue(einflictor.equipmentref == "equip_throwstar"))) {
            idamage = throwing_knife::function_3d8b0933df7505fd(victim);
        }
    }
    if (isdefined(eattacker) && eattacker _hasperk("specialty_super_strength") && smeansofdeath == "MOD_MELEE") {
        idamage = victim.maxhealth;
    }
    if (isdefined(level.var_5cb687ba43fb7102)) {
        foreach (func in level.var_5cb687ba43fb7102) {
            n_damage = self [[ func ]](einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime);
            if (isdefined(n_damage)) {
                idamage = n_damage;
            }
        }
    }
    if (isdefined(eattacker) && isplayer(eattacker) && isdefined(eattacker.var_91ff03702332cc07)) {
        eattacker.var_91ff03702332cc07 = eattacker.var_91ff03702332cc07 + idamage;
    }
    if (isdefined(victim) && isplayer(victim) && !function_483cc81bff18273b(victim)) {
        victim.var_489f22c08f63bc0f = victim.var_489f22c08f63bc0f + idamage;
    }
    if (isdefined(level.var_517ae1797c9e1995)) {
        idamage = [[ level.var_517ae1797c9e1995 ]](einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon);
    }
    if (idamage >= 150 && isdefined(smeansofdeath) && smeansofdeath == "MOD_MELEE") {
        var_f1c9098f9acad294 = getdvarint(@"hash_6138625068b37f1", 0);
        var_884c40b361d66a39 = getdvarint(@"hash_65b74a71a96e27ea", 0);
        if (var_f1c9098f9acad294 == 1) {
            idamage = 135;
            newdamage = getdvarint(@"hash_fd334bd8d3ee773", 0);
            if (newdamage > 0) {
                idamage = newdamage;
            }
            if (var_884c40b361d66a39 && isbehindmeleevictim(eattacker, victim)) {
                idamage = 150;
            }
        }
    }
    preplayerdamaged(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, vpoint, var_b4c09bd8d141ed77, shitloc, psoffsettime, modelindex, partname, var_1da1a66b5c6a06a7);
    victim finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, var_b4c09bd8d141ed77, shitloc, psoffsettime, modelindex, partname, var_b2883531afa6b83d);
    postplayerdamaged(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, vpoint, var_b4c09bd8d141ed77, shitloc, psoffsettime, modelindex, partname, var_1da1a66b5c6a06a7, var_986b2e0350629522, var_fcdf19e3cdd29669, iskillstreakweapon);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x442f
// Size: 0xea
function dragonsbreathhitloccollection(hitloc, eattacker, objweapon) {
    self notify("newDragonsBreathHitLoc");
    self endon("newDragonsBreathHitLoc");
    self endon("disconnect");
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.dragonsbreathdamage)) {
        self.dragonsbreathdamage = namespace_23227899dfba5895::function_df4e9a1e313ea352();
    }
    self.dragonsbreathdamage.newhitlocs = utility::array_add(self.dragonsbreathdamage.newhitlocs, hitloc);
    waittillframeend();
    newhitlocs = [];
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.dragonsbreathdamage)) {
        newhitlocs = self.dragonsbreathdamage.newhitlocs;
        self.dragonsbreathdamage.newhitlocs = [];
    }
    if (isreallyalive(self)) {
        namespace_23227899dfba5895::function_6dc8c5de229e86ff(newhitlocs, eattacker, objweapon);
    } else {
        namespace_23227899dfba5895::function_56a694363da738ac();
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4520
// Size: 0x40f
function preplayerdamaged(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, var_1da1a66b5c6a06a7) {
    if (function_483cc81bff18273b(victim)) {
        return;
    }
    originaldamage = idamage;
    victim.lastweaponused = victim getcurrentweapon();
    victim.wasaimingdownsightsondamage = victim player::isplayerads();
    if (function_2f5049bbe3c5e733(objweapon, smeansofdeath)) {
        if (getdvarint(@"hash_432df71393030be5", 0) == 1) {
            victim thread function_49d8cc008e5f6722(eattacker, victim, idflags);
        }
        if (isplayer(eattacker)) {
            eattacker setclientomnvar("autofire_hit_notify", gettime());
        }
    }
    if (isai(self)) {
        /#
            assert(isdefined(level.bot_funcs) && isdefined(level.bot_funcs["on_damaged"]));
        #/
        self [[ level.bot_funcs["on_damaged"] ]](eattacker, idamage, smeansofdeath, objweapon, einflictor, shitloc, vpoint, var_1da1a66b5c6a06a7);
    }
    if (isdefined(einflictor) && isdefined(einflictor.streakinfo) && isdefined(einflictor.streakinfo.hits)) {
        einflictor.streakinfo.hits++;
    }
    if (isdefined(objweapon) && objweapon.basename == "bunkerbuster_round_mp") {
        if (isdefined(einflictor) && isdefined(victim)) {
            var_84ca13f5a0250278 = distance(einflictor.origin, victim.origin);
            eattacker dlog_recordplayerevent("dlog_event_mp_bunkerbuster_expl_dist_to_enemy", [0:"victim", 1:victim, 2:"distance", 3:var_84ca13f5a0250278], 0);
        }
    }
    namespace_30a6d7a07831c1e2::bulletoutlinecheck(eattacker, victim, objweapon.basename, smeansofdeath);
    if (smeansofdeath == "MOD_FALLING") {
        victim thread emitfalldamage(idamage);
    }
    logattacker(victim, eattacker, einflictor, objweapon, idamage, vpoint, vdir, shitloc, psoffsettime, smeansofdeath, var_1da1a66b5c6a06a7);
    if (isdefined(einflictor) && isdefined(einflictor.owner) && isdefined(einflictor.owner.team) && einflictor.owner.team != victim.team) {
        victim.lastdamagewasfromenemy = 1;
    } else {
        victim.lastdamagewasfromenemy = isdefined(eattacker) && eattacker != victim;
    }
    if (victim.lastdamagewasfromenemy) {
        timestamp = gettime();
        if (isdefined(eattacker)) {
            eattacker.damagedplayers[victim.guid] = timestamp;
            eattacker.var_c826ab9d43c24233 = timestamp;
        }
        victim.lastdamagedtime = timestamp;
    }
    var_b94cd1b61321122a = 0;
    if (isdefined(victim) && isdefined(victim.currentprimaryweapon)) {
        var_b94cd1b61321122a = victim function_c603bed3b1c8d11(victim.currentprimaryweapon, 0);
    }
    victim.var_ddae1352e36165f6 = var_b94cd1b61321122a;
    victim thread namespace_bc0fc4dcb86d0ecb::onplayerdamaged(eattacker, victim, smeansofdeath);
    victim thread challenges::playerdamaged(einflictor, eattacker, idamage, smeansofdeath, objweapon, shitloc);
    if (isdefined(eattacker) && idamage != 0) {
        eattacker notify("victim_damaged", victim);
    }
    if (isdefined(level.preplayerdamaged)) {
        victim thread [[ level.preplayerdamaged ]](einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname);
    }
    /#
        assertex(originaldamage == idamage, "Damage modified in prePlayerDamaged(). This does nothing, damage has already been applied");
    #/
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4936
// Size: 0x57
function function_2f5049bbe3c5e733(objweapon, meansofdeath) {
    var_f2c2804490dd2160 = isdefined(objweapon) && (weapontype(objweapon) == "bullet" || weapontype(objweapon) == "projectile");
    return game_utility::function_ba5574c7f287c587() && (var_f2c2804490dd2160 || meansofdeath == "MOD_MELEE");
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4995
// Size: 0xa2c
function postplayerdamaged(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, var_1da1a66b5c6a06a7, var_986b2e0350629522, var_fcdf19e3cdd29669, iskillstreakweapon) {
    originaldamage = idamage;
    var_34459eb0ef220c40 = utility::isbulletdamage(smeansofdeath);
    if (getdvarint(@"hash_fb388f508f5527e3", 0) == 1 && isdefined(eattacker) && isdefined(eattacker.origin)) {
        victim function_95874c67f460495f(eattacker.origin);
    }
    if (istrue(victim.var_808d06ddfc93a4e4)) {
        victim battlerage::function_903a8abde1f77240();
    }
    if (istrue(victim.disguised) && isdefined(eattacker)) {
        victim namespace_e0526929a9f43046::function_15e7a42c79a6b4f6(idamage, eattacker);
    }
    if (idamage > 10 && isdefined(einflictor) && !victim utility::isusingremote() && isplayer(victim)) {
        if (isplayer(einflictor) && smeansofdeath == "MOD_MELEE") {
            if (isalive(victim) && !victim killstreak::isjuggernaut() && !game_utility::isBRStyleGameType()) {
                victim thread meleestagger(eattacker);
                victim.hitwithmeleetime = gettime();
            }
            einflictor thread shellshock::bloodmeleeeffect(objweapon);
            victim playrumbleonentity("defaultweapon_melee");
            einflictor playrumbleonentity("defaultweapon_melee");
        }
    }
    if (isagent(self)) {
        if (killstreak::iscontrollingproxyagent()) {
            if (idamage >= self.health) {
                idamage = self.health - 1;
            } else {
                var_366b0ecc2f28aead = getcompleteweaponname(objweapon);
                self [[ namespace_cb97214c768c4dbd::agentfunc("on_damaged_finished") ]](einflictor, eattacker, idamage, idflags, smeansofdeath, var_366b0ecc2f28aead, vpoint, vdir, shitloc, psoffsettime);
            }
        } else {
            var_366b0ecc2f28aead = getcompleteweaponname(objweapon);
            self [[ namespace_cb97214c768c4dbd::agentfunc("on_damaged_finished") ]](einflictor, eattacker, idamage, idflags, smeansofdeath, var_366b0ecc2f28aead, vpoint, vdir, shitloc, psoffsettime);
        }
    } else {
        challenges::function_4ab6f9fba6bb9cc5(self, idamage, var_1da1a66b5c6a06a7);
    }
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587() && isplayer(eattacker)) {
        namespace_aad14af462a74d08::function_f4d8c689aaf296e5(eattacker, objweapon, idamage, var_1da1a66b5c6a06a7);
    }
    handledamagefeedback(einflictor, eattacker, victim, idamage, smeansofdeath, objweapon, shitloc, idflags, var_1da1a66b5c6a06a7, var_986b2e0350629522, iskillstreakweapon, partname);
    function_18525950b3caba30(idamage, eattacker, smeansofdeath, vpoint, var_1da1a66b5c6a06a7, objweapon);
    if (var_34459eb0ef220c40) {
        victim thread namespace_20260f65229aa888::adddamagetaken(eattacker, objweapon, idamage);
    }
    if (isagent(eattacker) && isdefined(eattacker) && eattacker namespace_e47104b48662385b::_isalive() && eattacker != victim) {
        victim thread namespace_20260f65229aa888::addrecentattacker(eattacker);
    }
    if (isdefined(victim) && victim namespace_e47104b48662385b::_isalive()) {
        if (victim.health < 30) {
            victim thread namespace_20260f65229aa888::hurtbadlywait();
        }
        if (isdefined(eattacker) && eattacker != victim && isexplosivedamagemod(smeansofdeath)) {
            var_a5269902cd18ca05 = isdefined(objweapon) && objweapon.basename == "safe_c4_mp";
            var_46a8bb92aa6c8d0e = isdefined(objweapon) && objweapon.basename == "gas_mp";
            if (!isdefined(objweapon) || !var_46a8bb92aa6c8d0e && !var_a5269902cd18ca05) {
                level thread namespace_20260f65229aa888::trysaylocalsound(victim, #"hash_cafa7ad7442c35d5", undefined, 0.5);
            }
        }
    }
    gamelogic::sethasdonecombat(victim, 1);
    if (isdefined(eattacker) && eattacker != victim) {
        level.usestartspawns = 0;
    }
    if (isplayer(eattacker) && isdefined(eattacker namespace_3c5a4254f2b957ea::getpersstat("participation"))) {
        eattacker namespace_3c5a4254f2b957ea::incpersstat("participation", 1);
    } else if (isplayer(eattacker)) {
        eattacker.pers["participation"] = 1;
    }
    /#
        namespace_45ecbe78f599af72::function_c9e5c511b923a42f(idamage, eattacker, victim, smeansofdeath, shitloc, einflictor, vpoint, var_1da1a66b5c6a06a7, var_986b2e0350629522);
    #/
    if (isdefined(level.cinematic_replay_recording) && isplayer(einflictor)) {
        var_4169c6a89b43f49 = spawnstruct();
        var_4169c6a89b43f49.victim = victim;
        var_4169c6a89b43f49.vpoint = vpoint;
        var_4169c6a89b43f49.vdir = vdir;
        var_4169c6a89b43f49.objweapon = objweapon;
        var_4169c6a89b43f49.kill = !isalive(victim);
        einflictor.hitrecord[einflictor.hitrecord.size] = var_4169c6a89b43f49;
    }
    if (isdefined(level.matchrecording_logeventmsg) && isplayer(victim) && isdefined(einflictor) && isplayer(einflictor) && var_34459eb0ef220c40) {
        if (var_fcdf19e3cdd29669 == victim.maxhealth && victim.health != self.maxhealth) {
            victim.engagementstarttime = gettime();
        }
    }
    if (allowdamageflash(eattacker, victim, objweapon, smeansofdeath, idamage)) {
        victim showuidamageflash();
    }
    if (isdefined(eattacker) && idamage > 0) {
        if (eattacker perk::_hasperk("specialty_delayhealing")) {
            eattacker thread namespace_70e675ecd54f03da::marktarget_run(victim, objweapon, smeansofdeath);
        }
        if (isshrapnelsource(objweapon, smeansofdeath) && isreallyalive(victim) && eattacker != victim) {
            if (isdefined(eattacker.var_a3376181eed3ffac)) {
                var_8d7328510c2d577e = eattacker.var_a3376181eed3ffac;
                var_43f20ac8f8c9340b = (level.healthregendelay + var_8d7328510c2d577e) * 1000;
                var_cd49b265a29f4b38 = (var_43f20ac8f8c9340b / level.healthregendelay * 1000 - 1) / -1;
                namespace_54a2eae43eaa8bf5::function_5457f0107a845374("explosive_delay_perk", var_cd49b265a29f4b38, var_43f20ac8f8c9340b);
            }
            if (istrue(eattacker.var_11554e20eb10a6dd)) {
                eattacker thread namespace_30a6d7a07831c1e2::function_dd4a053345e159c2(victim);
            }
        }
        if (var_34459eb0ef220c40 || objweapon.basename == "throwstar_mp") {
            if (function_1f2e4ff84140d164(objweapon, eattacker) && namespace_25ead30c6ed027fb::islowerbodyshot(shitloc, smeansofdeath, eattacker) && !victim _hasperk("specialty_dauntless")) {
                eattacker thread namespace_30a6d7a07831c1e2::ammodisabling_run(victim, objweapon.basename == "throwstar_mp");
            }
            if (eattacker function_c38aa07aff945ff7(vdir, victim)) {
                eattacker thread function_fbd5b90ec07c28c4(victim);
            }
        }
        if (isplayer(victim)) {
            if (super_stimpistol::function_76ca0b3d8b2555ca(objweapon) && utility::isbulletdamage(smeansofdeath) || eattacker perk::_hasperk("specialty_shrapnel") && isshrapnelsource(objweapon, smeansofdeath)) {
                victim.lastshrapneltime = gettime();
            }
        }
    }
    if (isdefined(level.onplayerdamaged)) {
        victim thread [[ level.onplayerdamaged ]](einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, var_fcdf19e3cdd29669, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, var_1da1a66b5c6a06a7);
    }
    namespace_fd8ff6a1c9b4f3c7::function_d1e4826b0a4db6ee(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, var_fcdf19e3cdd29669, vpoint, vdir, shitloc, psoffsettime, modelindex, partname);
    if (game_utility::function_6493ec89ae923684()) {
        level notify("post_player_damaged", einflictor);
    }
    if (player::isreallyalive(victim)) {
        switch (smeansofdeath) {
        case #"hash_3c20f39c73a1422b":
        case #"hash_571e46e17a3cf2e3":
        case #"hash_66cb246f3e55fbe2":
        case #"hash_a911a1880d996edb":
        case #"hash_c22b13f81bed11f0":
            victim stats::incpersstat("explosionsSurvived", 1);
            if (getdvarint(@"hash_cf6378092db0d69c", 0) == 1) {
                if (isdefined(einflictor)) {
                    var_acd8faa0e7dde1b2 = function_347074f909e9dea5(einflictor, objweapon);
                    if (var_acd8faa0e7dde1b2[0] == 1) {
                        victim thread function_bf56dbd2a1035901(var_acd8faa0e7dde1b2.size);
                    }
                }
            }
            break;
        }
    } else {
        if (isdefined(victim) && isdefined(einflictor) && namespace_14ec1bc880a07c3b::function_eae0802093a7e5f5(einflictor)) {
            if (isdefined(einflictor.var_a5d118f040f60db0)) {
                victim function_b3bbb3a877d45df6(einflictor.var_a5d118f040f60db0);
            }
        }
        if (isdefined(idflags) && isdefined(8) && idflags & 8 && isdefined(16384) && !(idflags & 16384)) {
            if (eattacker game_utility::onlinestatsenabled()) {
                wallbangs = eattacker namespace_26e1361ab951ec6b::getplayerstat("combatStats", "wallbangs") + 1;
                eattacker namespace_26e1361ab951ec6b::setplayerstatbuffered(wallbangs, "combatStats", "wallbangs");
            }
            eattacker stats::incpersstat("penetrationKills", 1);
            eattacker stats::incpersstat("wallbangs", 1);
        }
    }
    if (namespace_d36e6800233f4f97::function_cfe304859f30e747("gulagTrackPlayerBulletHitPlayer")) {
        namespace_d36e6800233f4f97::function_3cceb052d780fef1("gulagTrackPlayerBulletHitPlayer", eattacker);
    }
    if (isplayer(victim) && isplayer(eattacker)) {
        if (var_34459eb0ef220c40 && eattacker _hasperk("specialty_combat_scout")) {
            attackerdamage = istrue(idamage > 0 || var_1da1a66b5c6a06a7 > 0 || var_986b2e0350629522 > 0);
            victim thread function_84c8fc967497800(eattacker, attackerdamage, objweapon);
        }
    }
    /#
        assertex(originaldamage == idamage, "Damage modified in postPlayerDamaged(). This does nothing, damage has already been applied");
    #/
    var_d27680ff86693f5c = {var_1da1a66b5c6a06a7:var_1da1a66b5c6a06a7, partname:partname, shitloc:shitloc, vdir:vdir, vpoint:vpoint, objweapon:objweapon, smeansofdeath:smeansofdeath, idflags:idflags, idamage:idamage, einflictor:einflictor, eattacker:eattacker, victim:victim};
    callback::callback("player_damaged", var_d27680ff86693f5c);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53c8
// Size: 0x36
function function_1f2e4ff84140d164(objweapon, eattacker) {
    if (objweapon hasattachment("ammomod_slow") || eattacker perk::_hasperk("specialty_wounding")) {
        return 1;
    }
    return 0;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5406
// Size: 0xff
function private function_347074f909e9dea5(einflictor, objweapon) {
    if (isdefined(einflictor.equipmentref)) {
        var_9b83efba8bfecc3f = equipment::getequipmenttableinfo(einflictor.equipmentref);
        if (isdefined(var_9b83efba8bfecc3f) && var_9b83efba8bfecc3f.defaultslot == "primary") {
            return [0:1];
        }
    }
    if (isdefined(objweapon)) {
        if (weapon::iskillstreakweapon(objweapon)) {
            return [0:1, 1:1];
        }
        switch (objweapon.basename) {
        case #"hash_13a265ac820ea0df":
        case #"hash_3e782fd775b72022":
        case #"hash_5c272c0617caebf0":
        case #"hash_5cbb3a1a84d47f1d":
        case #"hash_6b9700922cc910a9":
        case #"hash_a9e31b8ffd42a67b":
        case #"hash_e704ecf8710c6f57":
        case #"hash_f55c20924061bd15":
            return [0:1];
            break;
        }
    }
    return [0:0];
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x550d
// Size: 0x75
function private function_bf56dbd2a1035901(var_ea3f6e5c800c0e9c, var_af9644f18eb1d154, velocity) {
    self endon("death_or_disconnect");
    if (!istrue(self.var_9e3bdda27a519a9f)) {
        self setcamerathirdperson(1);
    }
    if (istrue(var_af9644f18eb1d154)) {
        self function_babd8af3054d8abe("torso_upper", velocity);
        wait(3);
    } else {
        self function_360874d9808f0724();
        wait(utility::ter_op(var_ea3f6e5c800c0e9c == 2, 5, 3));
    }
    class::function_c5ce8711741e44b8();
    self function_d87e1768229d0e3e();
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5589
// Size: 0x90
function meleestagger_anglesviewattack(victim, attacker) {
    vdir = anglestoforward((0, victim getplayerangles()[1], 0));
    var_6f2237e4477ca77d = vectornormalize((attacker.origin[0], attacker.origin[1], 0) - (victim.origin[0], victim.origin[1], 0));
    return math::anglebetweenvectorssigned(vdir, var_6f2237e4477ca77d, (0, 0, 1));
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5621
// Size: 0x7a
function isshrapnelsource(objweapon, meansofdeath) {
    if (!isdefined(objweapon) || isnullweapon(objweapon)) {
        return 0;
    }
    if (!isexplosivedamagemod(meansofdeath)) {
        return 0;
    }
    if (weapon::iskillstreakweapon(objweapon)) {
        return 0;
    }
    if (weapon::isvehicleweapon(objweapon)) {
        return 0;
    }
    if (weapon::isgamemodeweapon(objweapon)) {
        return 0;
    }
    var_11d2f075e9a0e643 = weapon::getequipmenttype(objweapon);
    if (isdefined(var_11d2f075e9a0e643)) {
        if (var_11d2f075e9a0e643 != "lethal") {
            return 0;
        }
    }
    return 1;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56a3
// Size: 0x203
function meleestagger(attacker) {
    self endon("death_or_disconnect");
    var_989ea0994c0bafe0 = getdvarfloat(@"hash_5bf99b34984d4d30");
    var_c0d3d09fb36a355e = getdvarfloat(@"hash_6c326257f3d446e8");
    var_e501fdb86740b153 = self getviewkickscale();
    if (isdefined(level.gamemodeoverridemeleeviewkickscale)) {
        self setviewkickscale(utility::ter_op(attacker perk::_hasperk("specialty_hardmelee"), level.gamemodeoverridemeleeviewkickscale * 2, level.gamemodeoverridemeleeviewkickscale));
    } else {
        self setviewkickscale(utility::ter_op(attacker perk::_hasperk("specialty_hardmelee"), 3, 1.5));
    }
    duration = utility::ter_op(attacker perk::_hasperk("specialty_hardmelee"), var_989ea0994c0bafe0 * 1.5, var_989ea0994c0bafe0);
    namespace_cc0f9da8a00806f6::_shellshock("melee_mp", "damage", duration, 0, 0);
    yaw = 0;
    if (isdefined(attacker) && attacker namespace_e47104b48662385b::_isalive()) {
        angle = meleestagger_anglesviewattack(self, attacker);
        if (angle < 15) {
            yaw = 10;
        } else if (angle > -15) {
            yaw = -10;
        }
    }
    pitchscale = utility::ter_op(attacker perk::_hasperk("specialty_hardmelee"), 1.5, 1);
    self setplayerangles(self getplayerangles() + (-8 * pitchscale, yaw, 0));
    thread meleedofroutine(attacker);
    self earthquakeforplayer(0.35, 0.2, self.origin, 400);
    self playrumbleonpositionforclient("plr_rumble_4_mp", self.origin);
    self setclientomnvar("ui_hud_shake", 1);
    wait(0.05);
    self setviewkickscale(var_e501fdb86740b153);
    duration = utility::ter_op(attacker perk::_hasperk("specialty_hardmelee"), var_c0d3d09fb36a355e * 1.5, var_c0d3d09fb36a355e);
    namespace_cc0f9da8a00806f6::_shellshock("melee_mp_after", "damage", duration, 0, 0);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58ad
// Size: 0xfb
function meleedofroutine(attacker) {
    self notify("resetMeleeDOF");
    self endon("resetMeleeDOF");
    self endon("death_or_disconnect");
    nearstart = 1;
    nearend = 2;
    farstart = 350;
    farend = 1024;
    self setdepthoffield(nearstart, nearend, farstart, farend, 10, 9);
    var_989ea0994c0bafe0 = getdvarfloat(@"hash_5bf99b34984d4d30");
    wait(utility::ter_op(attacker perk::_hasperk("specialty_hardmelee"), var_989ea0994c0bafe0 * 3, var_989ea0994c0bafe0));
    while (farend > 350) {
        nearstart = clamp(nearstart - 100, 0, 10000);
        nearend = clamp(nearend - 100, 0, 10000);
        farstart = clamp(farstart - 100, 0, 10000);
        farend = clamp(farend - 100, 0, 10000);
        self setdepthoffield(nearstart, nearend, farstart, farend, 10, 9);
        wait(0.05);
    }
    player::setdof_default();
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59af
// Size: 0x24
function monitormeleeoverlay(overlay) {
    utility::waittill_any_timeout_1(2, "death_or_disconnect");
    overlay destroy();
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59da
// Size: 0x5c
function allowdamageflash(attacker, victim, objweapon, meansofdeath, damage) {
    if (isagent(victim)) {
        return 0;
    }
    if (function_816434396dce13f(victim)) {
        return 0;
    }
    if (damage == 0) {
        return 0;
    }
    if (suppressdamageflash(attacker, victim, objweapon, meansofdeath, damage)) {
        return 0;
    }
    return 1;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a3e
// Size: 0x32
function suppressdamageflash(attacker, victim, objweapon, meansofdeath, damage) {
    if (isdefined(objweapon)) {
    }
    return 0;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x5a78
// Size: 0x80
function weaponignoresbrarmor(attacker, victim, damage, objweapon, smeansofdeath, inflictor, shitloc) {
    var_5c3f9357f11d2223 = objweapon.basename;
    if (isdefined(var_5c3f9357f11d2223) && var_5c3f9357f11d2223 == "danger_circle_br") {
        return 1;
    }
    if (smeansofdeath == "MOD_EXECUTION") {
        return 1;
    }
    if (smeansofdeath == "MOD_FALLING") {
        return 1;
    }
    return 0;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b00
// Size: 0x19
function function_7b2f2a8a9aa41d44(var_5c3f9357f11d2223) {
    return isdefined(var_5c3f9357f11d2223) && var_5c3f9357f11d2223 == "danger_circle_br";
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params d, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b21
// Size: 0x877
function cac_modified_damage(victim, attacker, damage, smeansofdeath, objweapon, var_96586eec2364c35b, var_483b72bbc1109ab2, shitloc, inflictor, query, idflags, iskillstreakweapon, var_d35e82fc5aa0aa84) {
    /#
        assert(isplayer(victim) || isagent(victim));
    #/
    /#
        assert(function_483cc81bff18273b(victim) || isdefined(victim.team));
    #/
    victim notify("damage_begin", attacker);
    if (!isdefined(var_d35e82fc5aa0aa84)) {
        var_d35e82fc5aa0aa84 = 1;
    }
    var_6cac94b6632aa667 = 0;
    var_986b2e0350629522 = 0;
    var_7820f81ee1adf7b9 = victim armor::hasarmor();
    var_c258168e026adb0f = victim armor::hashelmet();
    if (isplayer(attacker)) {
        helmet_clearhit(attacker);
        helmet_clearbroke(attacker);
    }
    if (utility::isbulletdamage(smeansofdeath)) {
        var_5c3f9357f11d2223 = objweapon.basename;
        headshot = namespace_25ead30c6ed027fb::isheadshot(shitloc, smeansofdeath, attacker);
        var_26df8fb7ad0299c0 = namespace_25ead30c6ed027fb::istorsoshot(shitloc, smeansofdeath, attacker);
        if (isdefined(objweapon) && weapon::iscacprimaryorsecondary(var_5c3f9357f11d2223)) {
            if (isbehindmeleevictim(attacker, victim) && isplayer(victim)) {
                level thread namespace_20260f65229aa888::saytoself(victim, "plr_hit_back", undefined, 0.1);
            }
        }
        if (isdefined(idflags) && idflags & 256) {
            if (var_5c3f9357f11d2223 != "none" && !weapon::issuperweapon(var_5c3f9357f11d2223)) {
                damage = damage * 0.4;
            }
        }
        if (isplayer(attacker) && attacker perk::_hasperk("specialty_paint_pro") && !istrue(iskillstreakweapon)) {
            victim thread namespace_30a6d7a07831c1e2::setpainted(attacker);
        }
        if (weapon::isminigunweapon(var_5c3f9357f11d2223) && game_utility::isBRStyleGameType()) {
            damage = damage * namespace_702c7cf141169c57::getminigundamagescale();
        }
        hitarmorvest = var_26df8fb7ad0299c0 && victim perk::_hasperk("specialty_armorvest");
        var_946cdaf05db4eca7 = headshot && var_c258168e026adb0f;
        hithelmet = headshot && istrue(victim.hasheadgear);
        var_287ab4d602b23a2a = istrue(attacker.lastcrossbowhadstoppingpower) && weapon::getweaponrootname(objweapon) == "iw9_dm_crossbow";
        var_2b1f3da5885ae9eb = attacker perk::_hasperk("specialty_bulletdamage") || var_287ab4d602b23a2a;
        armorpiercing = isfmjdamage(objweapon, smeansofdeath);
        if (var_946cdaf05db4eca7 && !istrue(victim.inlaststand)) {
            var_ae95568a563d5912 = weaponclass(objweapon);
            var_ac4a1f6f548136ea = 0;
            if (var_ae95568a563d5912 == "sniper" || var_ae95568a563d5912 == "dmr") {
                var_ac4a1f6f548136ea = 1;
            }
            var_f74a43b699b0afd2 = victim armor::damagehelmet(damage, var_ac4a1f6f548136ea, var_483b72bbc1109ab2);
            damage = damage * var_f74a43b699b0afd2;
        }
        if (var_2b1f3da5885ae9eb && hitarmorvest) {
            armor::armorvest_sethit(attacker);
        } else if (var_2b1f3da5885ae9eb && damage > 0) {
            if (damage <= 0) {
                /#
                    assertmsg("applyStoppingPower() passed damage <= 0. Damage must be a positive.");
                #/
            } else {
                var_cf48c2b5f099e09a = applystoppingpower(objweapon, shitloc, smeansofdeath, attacker, damage, 100);
                var_6cac94b6632aa667 = var_6cac94b6632aa667 + var_cf48c2b5f099e09a - damage;
            }
        } else if (hitarmorvest && !istrue(victim.tookvesthit) && !armorpiercing) {
            victim.tookvesthit = 1;
            var_cf48c2b5f099e09a = adjustbulletstokill(damage, 100, level.armorvestbulletdelta);
            var_6cac94b6632aa667 = var_6cac94b6632aa667 + var_cf48c2b5f099e09a - damage;
            helmet_sethit(attacker);
        } else if (hithelmet && !armorpiercing) {
            damagemod = headgear::getdamagemod();
            maxdamage = headgear::getmaxdamage();
            damagehelmet = int(clamp(damage * damagemod, 1, maxdamage));
            if (victim.health > 1) {
                damagehelmet = int(min(victim.health - 1, damagehelmet));
            }
            var_a97d0ca28da74569 = damage - damagehelmet;
            var_6cac94b6632aa667 = var_6cac94b6632aa667 - var_a97d0ca28da74569;
            victim notify("headgear_save");
            helmet_sethit(attacker);
        }
        if (isdefined(attacker) && isdefined(attacker.vehicleparent) && attacker.vehicleparent == "loot_chopper") {
            damage = int(damage / 3);
        }
        if (istrue(victim.var_e0672fbe459f5193)) {
            if (damage >= victim.health) {
                victim.health = int(clamp(damage + 1, 1, victim.maxhealth));
            }
        }
        if (attacker perk::_hasperk("specialty_headhunter") && headshot) {
            if (var_d35e82fc5aa0aa84 <= 1) {
                damage = damage + 10;
            } else {
                disttovictim = distance(attacker.origin, victim.origin);
                if (disttovictim < level.var_a7b25d0a3d5b8f1e) {
                    damage = damage + 20 * var_d35e82fc5aa0aa84;
                } else if (disttovictim < level.var_a7b25d0a3d5b8f1e) {
                    damage = damage + 15 * var_d35e82fc5aa0aa84;
                } else {
                    damage = damage + 10 * var_d35e82fc5aa0aa84;
                }
            }
        }
    } else if (smeansofdeath == "MOD_FALLING") {
        if (perk::_hasperk("specialty_falldamage")) {
            idamage = 0;
        }
    }
    var_d089499e6152ef2c = trophy_system::trophy_modifieddamage(attacker, victim, objweapon.basename, damage, var_6cac94b6632aa667);
    damage = var_d089499e6152ef2c[0];
    var_6cac94b6632aa667 = var_d089499e6152ef2c[1];
    if (victim heavyarmor::hasheavyarmor()) {
        var_d089499e6152ef2c = heavyarmor::heavyarmormodifydamage(victim, attacker, damage, var_6cac94b6632aa667, smeansofdeath, objweapon.basename, var_96586eec2364c35b, var_483b72bbc1109ab2, shitloc, inflictor, query);
        var_986b2e0350629522 = var_d089499e6152ef2c[0] > 0;
        damage = var_d089499e6152ef2c[1];
        var_6cac94b6632aa667 = var_d089499e6152ef2c[2];
    }
    if (lightarmor::haslightarmor(victim)) {
        var_d089499e6152ef2c = lightarmor::lightarmor_modifydamage(victim, attacker, damage, var_6cac94b6632aa667, smeansofdeath, objweapon.basename, var_96586eec2364c35b, var_483b72bbc1109ab2, shitloc, inflictor, query);
        var_1da1a66b5c6a06a7 = var_d089499e6152ef2c[0] > 0;
        damage = var_d089499e6152ef2c[1];
        var_6cac94b6632aa667 = var_d089499e6152ef2c[2];
    }
    if (isplayer(attacker)) {
        var_1bd99d39b987c15e = victim armor::hasarmor();
        var_3cfc0e54103a3f72 = victim armor::hashelmet();
        if (var_7820f81ee1adf7b9 && !var_1bd99d39b987c15e) {
            armor::armorvest_setbroke(attacker);
        }
        if (var_c258168e026adb0f && !var_3cfc0e54103a3f72) {
            helmet_setbroke(attacker);
        }
    }
    if (hashealthshield(victim)) {
        damage = victim gethealthshielddamage(damage);
    }
    var_7a63e4284c138381 = smeansofdeath == "MOD_FALLING" && damage >= victim.maxhealth;
    var_ff20188c5460f129 = isdefined(inflictor) && (isdefined(inflictor.stuckto) && inflictor.stuckto == victim || isdefined(inflictor.stuckenemyentity) && inflictor.stuckenemyentity == victim);
    if (istrue(victim.inlaststand) && !var_7a63e4284c138381) {
        if (var_ff20188c5460f129 && (objweapon.basename == "semtex_mp" || objweapon.basename == "bunkerbuster_not_burrowed_mp")) {
            goto LOC_000007d8;
        }
        damage = int(ceil(damage * getmatchrulesdata("commonOption", "lastStandDamageTakenScalar")));
    LOC_000007d8:
    }
LOC_000007d8:
    if (damage <= 1) {
        damage = int(ceil(clamp(damage, 0, 1)));
    } else {
        damage = int(damage + var_6cac94b6632aa667);
    }
    if (victim killstreak::isjuggernaut()) {
        damage = modify_juggernaut_damage(victim, attacker, damage, smeansofdeath, objweapon, var_96586eec2364c35b, var_483b72bbc1109ab2, shitloc, inflictor, query, idflags, iskillstreakweapon);
        if (damage >= self.health && istrue(self.var_9c1941d3bc009d2e)) {
            self.var_9c1941d3bc009d2e = 0;
            thread namespace_68f1873625691c6::jugg_removejuggernaut();
            damage = 0;
        }
    }
    return [0:damage, 1:var_986b2e0350629522, 2:shitloc];
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63a0
// Size: 0xe4
function modify_blast_shield_damage(damage, attacker, victim, var_463424d8c7b063d4) {
    if (isdefined(var_463424d8c7b063d4)) {
        var_2d0e5379ab68da90 = int(min(victim.var_81c247612e9c90c3, var_463424d8c7b063d4 * damage));
        victim.var_81c247612e9c90c3 = victim.var_81c247612e9c90c3 - var_2d0e5379ab68da90;
        victim notify("blast_shield_damaged", victim.var_81c247612e9c90c3);
        if (victim.var_81c247612e9c90c3 <= 0) {
            victim namespace_30a6d7a07831c1e2::function_2e7374f107a12700();
        }
        return (damage - var_2d0e5379ab68da90);
    }
    var_24096f38c6718c4c = level.blastshieldmod;
    var_1422fd8555ab8bf0 = level.blastshieldclamp;
    var_46381c94b0138dc7 = int(damage * var_24096f38c6718c4c);
    if (attacker != victim) {
        var_46381c94b0138dc7 = clamp(var_46381c94b0138dc7, 0, var_1422fd8555ab8bf0);
    }
    return var_46381c94b0138dc7;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x648c
// Size: 0x505
function modify_juggernaut_damage(victim, attacker, damage, smeansofdeath, objweapon, var_96586eec2364c35b, var_483b72bbc1109ab2, shitloc, inflictor, query, idflags, iskillstreakweapon) {
    var_ae95568a563d5912 = weaponclass(objweapon);
    damagescale = 1;
    if (isdefined(attacker) && attacker killstreak::isjuggernaut() && game_utility::isBRStyleGameType()) {
        damagescale = namespace_702c7cf141169c57::getjuggdamagescale();
    } else if (game_utility::function_21322da268e71c19()) {
        damagescale = 1.25;
    }
    if (utility::isbulletdamage(smeansofdeath)) {
        var_b4a7d8cd8c4fb7da = isdefined(inflictor) && (isdefined(inflictor.stuckto) && inflictor.stuckto == victim || isdefined(inflictor.stuckenemyentity) && inflictor.stuckenemyentity == victim);
        switch (var_ae95568a563d5912) {
        case #"hash_719417cb1de832b6":
        case #"hash_900cb96c552c5e8e":
            damage = min(15, damage);
            break;
        case #"hash_8cdaf2e4ecfe5b51":
        case #"hash_fa24dff6bd60a12d":
            if (weapon::isminigunweapon(objweapon.basename)) {
                damage = min(50, damage);
            } else {
                damage = min(20, damage);
            }
            break;
        case #"hash_690c0d6a821b42e":
            damage = min(25, damage);
            break;
        case #"hash_6191aaef9f922f96":
            break;
        case #"hash_e224d0b635d0dadd":
            if (var_b4a7d8cd8c4fb7da) {
                damage = int(self.maxhealth * 0.05);
            }
            break;
        default:
            damage = min(15, damage);
            break;
        }
        damage = handleapdamage(objweapon, smeansofdeath, damage, attacker);
    } else if (isexplosivedamagemod(smeansofdeath)) {
        damage = function_10268164ab1bcc31(damage, objweapon, attacker);
        weaponref = objweapon.basename;
        var_b4a7d8cd8c4fb7da = isdefined(inflictor) && (isdefined(inflictor.stuckto) && inflictor.stuckto == victim || isdefined(inflictor.stuckenemyentity) && inflictor.stuckenemyentity == victim);
        switch (weaponref) {
        case #"hash_996849dc6e47c18f":
            damage = damage * 0.25;
            break;
        case #"hash_e4dc94c459367249":
            damage = damage * 1.5;
            break;
        case #"hash_4b87af60037f526f":
            if (istrue(var_b4a7d8cd8c4fb7da)) {
                damage = int(self.maxhealth * 0.1);
            }
            break;
        case #"hash_ab3485fa6834de47":
            if (istrue(var_b4a7d8cd8c4fb7da)) {
                damage = int(self.maxhealth * 0.011);
            }
            break;
        }
    } else if (utility::isfiredamage(smeansofdeath)) {
        weaponref = objweapon.basename;
        var_b4a7d8cd8c4fb7da = isdefined(inflictor) && (isdefined(inflictor.stuckto) && inflictor.stuckto == victim || isdefined(inflictor.stuckenemyentity) && inflictor.stuckenemyentity == victim);
        switch (weaponref) {
        case #"hash_8fd6158eb96a1f15":
        case #"hash_b2a8e1829f433bd7":
            if (istrue(var_b4a7d8cd8c4fb7da)) {
                damage = int(self.maxhealth * 0.023);
            }
            break;
        }
        damage = function_5e4aa8d548cc604e(damage, objweapon, attacker, smeansofdeath);
    } else if (utility::function_f1d312f6935bc2d2(smeansofdeath)) {
        switch (var_ae95568a563d5912) {
        case #"hash_e224d0b635d0dadd":
            damage = min(10, damage);
            break;
        case #"hash_2ab98cab4066a74e":
            damage = min(100, damage);
            break;
        }
    } else if (utility::function_f86569fc5d5dc60f(inflictor, smeansofdeath)) {
        if (!isdefined(victim.var_59651a2893429638)) {
            victim.var_59651a2893429638 = 0;
        }
        damage = min(50, damage);
        victim.var_59651a2893429638++;
        if (victim.var_59651a2893429638 >= 30) {
            var_57ad0dc40b2fdda = vehicle_occupancy::function_9d86fd9a89cd2702(victim, inflictor, victim.origin, 1);
            newdir = var_57ad0dc40b2fdda[1];
            newpos = var_57ad0dc40b2fdda[0];
            if (isdefined(newpos)) {
                victim setorigin(newpos);
                victim.var_59651a2893429638 = undefined;
            }
        }
    }
    damage = int(damage * damagescale);
    if (isdefined(self.var_a23031c04df01bf)) {
        victim [[ self.var_a23031c04df01bf ]](damage, shitloc, smeansofdeath, attacker);
    }
    /#
        victim thread function_1b7b7da2e72eeffe(attacker, damage, smeansofdeath, objweapon);
    #/
    return damage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6999
// Size: 0x1a2
function modifydestructibledamage(damage, inflictor, objweapon) {
    if (!isdefined(inflictor)) {
        return damage;
    }
    if (!isnullweapon(objweapon)) {
        return damage;
    }
    if (!isdefined(inflictor.code_classname) || inflictor.code_classname != "scriptable") {
        return damage;
    }
    classname = inflictor.classname;
    if (isdefined(classname) && isstartstr(classname, "scriptable_")) {
        classname = getsubstr(classname, 11, classname.size);
        classnames = [0:"uk_gas_tank_thin_cylinder", 1:"uk_misc_fuel_jug", 2:"uk_fire_extinguisher", 3:"uk_misc_fuel_jug", 4:"decor_barrels_gameplay_flammable", 5:"un_propane_gas_tank", 6:"machinery_oxygen_generator_tank", 7:"sol_barrel", 8:"box_wooden_grenade", 9:"container_gas_tank", 10:"decor_propane_tank", 11:"equipment_propane_burner_stove", 12:"equipment_propane_tank", 13:"misc_propane_rocket", 14:"oil_drum", 15:"rp_propane_tank", 16:"misc_exterior_oxygen_barrel"];
        foreach (var_ae9cfb330e2cd21 in classnames) {
            if (isstartstr(classname, var_ae9cfb330e2cd21)) {
                if (game_utility::isanymlgmatch()) {
                    return 0;
                } else {
                    return int(min(damage, 60));
                }
            }
        }
    }
    return damage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b43
// Size: 0x98
function iskilltradedamage(eattacker, victim, idamage, smeansofdeath, objweapon, var_b0fc59ff15058522) {
    if (isdefined(eattacker) && isplayer(eattacker) && (!isalive(eattacker) || player::function_d7afe062ef51bd77(eattacker))) {
        if (istrue(var_b0fc59ff15058522) && isspreadweapon(objweapon)) {
            return 1;
        } else if (idamage >= victim.health) {
            if (smeansofdeath == "MOD_MELEE") {
                return 1;
            } else if (istrue(var_b0fc59ff15058522)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6be3
// Size: 0x29
function isspreadweapon(objweapon) {
    return isdefined(objweapon) && isdefined(weaponclass(objweapon)) && weaponclass(objweapon) == "spread";
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c14
// Size: 0x60
function function_2be5b08ed39d6a54(eattacker, victim, objweapon) {
    if (objweapon.basename == "semtex_bolt_splash_mp" && isdefined(victim.var_ea445bb2097eaa16) && isdefined(eattacker) && utility::array_contains(victim.var_ea445bb2097eaa16, eattacker)) {
        return 1;
    }
    return 0;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c7c
// Size: 0x67
function issmallsplashdamage(objweapon) {
    if (objweapon.basename == "semtex_xmike109_splash_mp" || objweapon.basename == "thermite_xmike109_radius_mp" || objweapon.basename == "semtex_bolt_splash_mp" || objweapon.basename == "thermite_bolt_radius_mp") {
        return 1;
    } else {
        return 0;
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cea
// Size: 0x369
function spreadshotdamagemod(victim, eattacker, objweapon, idamage, idflags) {
    if (isdefined(eattacker) && isdefined(victim)) {
        hand = function_88e9e2299bd29fd1(idflags);
        victimentnum = function_d77e6b2580f74622(victim);
        time = gettime();
        if (!isdefined(eattacker.pelletweaponvictimids)) {
            eattacker.pelletweaponvictimids = [];
        }
        foreach (var_ad11aa18430d8799, var_25762ef6bb7ced23 in eattacker.pelletweaponvictimids) {
            foreach (var_48b7b944a7a02b2c, var_3a99d1cafe4a4bac in var_25762ef6bb7ced23) {
                if ((time - var_3a99d1cafe4a4bac.time) / 1000 > 0.1) {
                    eattacker.pelletweaponvictimids[var_ad11aa18430d8799] = utility::array_remove_key(eattacker.pelletweaponvictimids[var_ad11aa18430d8799], var_48b7b944a7a02b2c);
                    if (eattacker.pelletweaponvictimids[var_ad11aa18430d8799].size == 0) {
                        eattacker.pelletweaponvictimids = utility::array_remove_key(eattacker.pelletweaponvictimids, var_ad11aa18430d8799);
                    }
                }
            }
        }
        if (!isdefined(eattacker.pelletweaponvictimids[hand])) {
            eattacker.pelletweaponvictimids[hand] = [];
        }
        if (!isdefined(eattacker.pelletweaponvictimids[hand][victimentnum])) {
            eattacker.pelletweaponvictimids[hand][victimentnum] = function_c415d83582aad1e4(eattacker, objweapon, time);
        }
        eattacker.pelletweaponvictimids[hand][victimentnum].var_7981f7d372990a2b = 0;
        eattacker.pelletweaponvictimids[hand][victimentnum].pelletdmgpassed = array_sort_with_func(eattacker.pelletweaponvictimids[hand][victimentnum].pelletdmgpassed, &is_lower);
        if (eattacker.pelletweaponvictimids[hand][victimentnum].pelletdmgpassed.size >= eattacker.pelletweaponvictimids[hand][victimentnum].var_33ac4c9665be6910) {
            if (idamage > eattacker.pelletweaponvictimids[hand][victimentnum].pelletdmgpassed[0]) {
                var_85d9d85f3ad5012a = idamage - eattacker.pelletweaponvictimids[hand][victimentnum].pelletdmgpassed[0];
                eattacker.pelletweaponvictimids[hand][victimentnum].pelletdmgpassed[0] = idamage;
                eattacker.pelletweaponvictimids[hand][victimentnum].var_7981f7d372990a2b = 1;
                idamage = var_85d9d85f3ad5012a;
            } else {
                return 0;
            }
        } else {
            eattacker.pelletweaponvictimids[hand][victimentnum].pelletdmgpassed = array_insert(eattacker.pelletweaponvictimids[hand][victimentnum].pelletdmgpassed, idamage, 0);
        }
        idamage = function_1113fc99a0327d7d(eattacker, victim, idflags, idamage);
    }
    return idamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x705b
// Size: 0xbb
function function_c415d83582aad1e4(eattacker, objweapon, time) {
    struct = spawnstruct();
    struct.time = time;
    struct.pelletdmgpassed = [];
    struct.var_9bb59738d095536e = 0;
    struct.var_33ac4c9665be6910 = getspreadpelletspershot(eattacker, objweapon);
    if (objweapon hasattachment("trigger_heavy_p14")) {
        struct.var_52f16f4c9cdbf165 = 300;
    } else if (function_a062727999a72d2f(objweapon.basename)) {
        struct.var_52f16f4c9cdbf165 = 120;
    } else {
        struct.var_52f16f4c9cdbf165 = 200;
    }
    return struct;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x711e
// Size: 0x17
function is_lower(a, b) {
    return a < b;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x713d
// Size: 0xd0
function getspreadpelletspershot(eattacker, objweapon) {
    rootname = weapon::getweaponrootname(objweapon.basename);
    if (rootname == "iw9_sh_charlie725" || rootname == "iw9_pi_swhiskey" || rootname == "jup_jp16_sh_recho870") {
        if (eattacker isdualwielding()) {
            return 2;
        }
        if (objweapon hasattachment("bar_sh_short_p14")) {
            return 3;
        }
        ads = eattacker playerads() > 0.5;
        var_c1bce78a815cb59f = 0;
        if (rootname == "jup_jp16_sh_recho870") {
            var_c1bce78a815cb59f = eattacker function_c603bed3b1c8d11(objweapon, 0);
        }
        if (ads || var_c1bce78a815cb59f) {
            return 4;
        } else {
            return 3;
        }
    } else if (objweapon hasattachment("jup_ammo_410g_ball")) {
        return 2;
    } else {
        return 4;
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7214
// Size: 0x2d
function helmet_washit(attacker) {
    return isdefined(attacker.hithelmet) && gettime() == attacker.hithelmet;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7249
// Size: 0x1d
function helmet_sethit(attacker) {
    attacker.hithelmet = gettime();
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x726d
// Size: 0x17
function helmet_clearhit(attacker) {
    attacker.hithelmet = undefined;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x728b
// Size: 0x2d
function helmet_wasbroke(attacker) {
    return isdefined(attacker.brokehelmet) && gettime() == attacker.brokehelmet;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72c0
// Size: 0x1d
function helmet_setbroke(attacker) {
    attacker.brokehelmet = gettime();
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72e4
// Size: 0x17
function helmet_clearbroke(attacker) {
    attacker.brokehelmet = undefined;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7302
// Size: 0xab
function applystoppingpower(objweapon, shitloc, smeansofdeath, attacker, damage, maxhealth) {
    maxhealth = tweakables::gettweakablevalue("player", "maxhealth");
    var_641b46c4c2f9a12f = getbulletstokill(maxhealth, damage);
    if (var_641b46c4c2f9a12f == 2) {
        if (stoppingpowercanonehitkill(objweapon, shitloc, smeansofdeath, attacker)) {
            return maxhealth;
        } else {
            return (0.9 * maxhealth);
        }
    }
    var_585a576d50c69137 = -1;
    if (var_641b46c4c2f9a12f >= 7) {
        var_585a576d50c69137 = -3;
    } else if (var_641b46c4c2f9a12f >= 5) {
        var_585a576d50c69137 = -2;
    }
    return adjustbulletstokill(damage, maxhealth, var_585a576d50c69137);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73b5
// Size: 0x1e7
function stoppingpowercanonehitkill(objweapon, shitloc, smeansofdeath, attacker) {
    var_49e6ef3edadd524e = weapon::getweaponrootname(objweapon);
    var_8f7990d96df8ba76 = weaponclass(objweapon);
    if (var_49e6ef3edadd524e == "iw9_dm_crossbow") {
        return 1;
    } else if (var_8f7990d96df8ba76 == "sniper") {
        switch (var_49e6ef3edadd524e) {
        case #"hash_6bc7a937030008a":
        case #"hash_fbeff8fdb669137d":
            if (namespace_25ead30c6ed027fb::istorsouppershot(shitloc, smeansofdeath, attacker) || namespace_25ead30c6ed027fb::isheadshot(shitloc, smeansofdeath, attacker)) {
                return 1;
            }
            break;
        case #"hash_1f3b9e13f5e1433c":
        case #"hash_3bab3553abce2fd1":
        case #"hash_ec99e7d11ddb9eea":
            if (namespace_25ead30c6ed027fb::istorsoshot(shitloc, smeansofdeath, attacker) || namespace_25ead30c6ed027fb::isheadshot(shitloc, smeansofdeath, attacker)) {
                return 1;
            }
            break;
        default:
            if (namespace_25ead30c6ed027fb::isupperbodyshot(shitloc, smeansofdeath, attacker) || namespace_25ead30c6ed027fb::isheadshot(shitloc, smeansofdeath, attacker)) {
                return 1;
            }
            break;
        }
    } else if (var_8f7990d96df8ba76 == "pistol") {
        switch (var_49e6ef3edadd524e) {
        case #"hash_bf2d3ffce9ef56d1":
        case #"hash_daf5a16da560ec6d":
            if (namespace_25ead30c6ed027fb::istorsouppershot(shitloc, smeansofdeath, attacker) || namespace_25ead30c6ed027fb::isheadshot(shitloc, smeansofdeath, attacker)) {
                return 1;
            }
            break;
        }
    } else if (var_8f7990d96df8ba76 == "rifle") {
        switch (var_49e6ef3edadd524e) {
        case #"hash_3a523c4bbb66256a":
        case #"hash_5a18d10b44f6c48c":
            if (namespace_25ead30c6ed027fb::isheadshot(shitloc, smeansofdeath, attacker)) {
                return 1;
            }
            break;
        }
        ammotype = getweaponammopoolname(objweapon);
        if (ammotype == %"hash_a9efef52b466ad3" || ammotype == %"hash_6aa606a18241ad16") {
            if (namespace_25ead30c6ed027fb::istorsouppershot(shitloc, smeansofdeath, attacker) || namespace_25ead30c6ed027fb::isheadshot(shitloc, smeansofdeath, attacker)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75a4
// Size: 0x16d
function adjustbulletstokill(damage, maxhealth, delta) {
    damage = int(damage);
    delta = int(delta);
    if (delta == 0) {
        return damage;
    }
    if (damage <= 0) {
        /#
            assertmsg("adjustBulletsToKill() passed damage <= 0. Damage must be a positive for the adjust to work.");
        #/
        return damage;
    }
    var_59d4cbb2ee26e823 = getbulletstokill(maxhealth, damage);
    var_8242953f0e099baf = var_59d4cbb2ee26e823 + delta;
    if (var_8242953f0e099baf <= 0) {
        damage = damage * 1.4;
    } else if (var_8242953f0e099baf == 1) {
        damage = int(max(maxhealth, damage * 1.4));
    } else {
        var_febf29b2b2d803fa = utility::ter_op(damage > maxhealth, maxhealth, damage);
        percent = 0;
        if (var_59d4cbb2ee26e823 == 1) {
            percent = 0.9;
        } else {
            var_69489bad55e2b1a7 = int(ceil(maxhealth / (var_59d4cbb2ee26e823 - 1)));
            var_99ca83094b92bb05 = int(ceil(maxhealth / var_59d4cbb2ee26e823));
            percent = (var_febf29b2b2d803fa - var_99ca83094b92bb05) / (var_69489bad55e2b1a7 - var_99ca83094b92bb05);
        }
        var_6606d7544e8b2f6b = int(ceil(maxhealth / (var_8242953f0e099baf - 1)));
        var_e06a97413f959bb1 = int(ceil(maxhealth / var_8242953f0e099baf));
        damage = int((var_6606d7544e8b2f6b - var_e06a97413f959bb1) * percent + var_e06a97413f959bb1);
    }
    return damage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7719
// Size: 0x21
function getbulletstokill(maxhealth, damage) {
    return int(ceil(maxhealth / damage));
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7742
// Size: 0x8d
function isbehindmeleevictim(attacker, victim) {
    var_b3e4c19e4d37bea0 = vectornormalize((victim.origin[0], victim.origin[1], 0) - (attacker.origin[0], attacker.origin[1], 0));
    var_7a049b761920208 = anglestoforward((0, victim.angles[1], 0));
    return vectordot(var_b3e4c19e4d37bea0, var_7a049b761920208) > 0.4;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77d7
// Size: 0xc2
function killstreakdamagefilter(eattacker, victim, idamage, objweapon, smeansofdeath) {
    var_b4d4d1947da73e65 = 0;
    if (isdefined(level.gamemodespawnprotectedcallback)) {
        var_b4d4d1947da73e65 = [[ level.gamemodespawnprotectedcallback ]](eattacker, victim, idamage, objweapon, smeansofdeath);
    }
    if (victim game_utility::isspawnprotected() || istrue(var_b4d4d1947da73e65)) {
        var_54a88b0118510e9f = int(max(victim.health / 4, 1));
        if (idamage >= var_54a88b0118510e9f && weapon::iskillstreakweapon(objweapon.basename) && !weapon::weaponbypassspawnprotection(objweapon) && smeansofdeath != "MOD_MELEE") {
            idamage = var_54a88b0118510e9f;
        }
    }
    return idamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78a1
// Size: 0xee
function function_b1493282af6c1334(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname) {
    var_b51ab50e109ad01a = 0;
    if (isdefined(objweapon)) {
        switch (objweapon.basename) {
        case #"hash_db653a4972b3c13b":
            if (isdefined(einflictor) && entity::isdronepackage(einflictor)) {
                var_b51ab50e109ad01a = 1;
            }
            break;
        case #"hash_1eb643f396ea8577":
        case #"hash_1ed1da8a2c218aa7":
        case #"hash_507c24a8f53354fe":
        case #"hash_5e3fa526a48eaaa5":
            var_b51ab50e109ad01a = 1;
            break;
        }
    }
    return var_b51ab50e109ad01a;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7997
// Size: 0x8c5
function handlefriendlyfiredamage(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, iskillstreakweapon) {
    if (isdefined(einflictor) && !isplayer(einflictor)) {
        if (!isdefined(eattacker)) {
            if (isdefined(einflictor.owner)) {
                eattacker = einflictor.owner;
            }
        } else if (!isplayer(eattacker)) {
            if (isdefined(einflictor.owner)) {
                eattacker = einflictor.owner;
            } else if (isdefined(eattacker.owner)) {
                eattacker = eattacker.owner;
            }
        }
    }
    if (isdefined(objweapon)) {
        if (utility::isbulletdamage(smeansofdeath) && (weapon::iscacprimaryweapon(objweapon.basename) || weapon::iscacsecondaryweapon(objweapon.basename)) && !super_stimpistol::function_76ca0b3d8b2555ca(objweapon)) {
            level thread namespace_20260f65229aa888::trysaylocalsound(victim, #"hash_2a23c8694884293e", undefined, 0.25);
        }
        if (super_stimpistol::function_76ca0b3d8b2555ca(objweapon)) {
            return 0;
        }
    }
    if (game_utility::function_21322da268e71c19()) {
        if (isdefined(idflags) && idflags & 256 && utility::isbulletdamage(smeansofdeath)) {
            idamage = int(idamage * 0.2);
        }
    }
    if (level.friendlyfire != 0) {
        if (level.maxallowedteamkills == -1) {
            var_685cac64e1726643 = 0;
        } else {
            var_685cac64e1726643 = istrue(victim.isffprotectedaction) || istrue(victim.isdefusing) || istrue(victim.isplanting);
        }
        var_c7f72fff4c765948 = isfriendlyfireprotectedperiod(eattacker);
        if (var_685cac64e1726643 || var_c7f72fff4c765948) {
            idamage = int(idamage * 0.5);
            if (idamage < 1) {
                idamage = 1;
            }
            if (idamage > victim.health) {
                idamage = victim.health;
            }
            eattacker.lastdamagewasfromenemy = 0;
            if (isdefined(eattacker namespace_3c5a4254f2b957ea::getpersstat("teamdamage"))) {
                eattacker stats::incpersstat("teamdamage", idamage);
            }
            damageattacker(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname);
            return 0;
        }
    }
    if (level.friendlyfire == 0 || !isplayer(eattacker) && level.friendlyfire != 1) {
        if (function_7cc9753f2f84e883(eattacker, victim)) {
            eattacker handledamagefeedback(einflictor, eattacker, victim, idamage, smeansofdeath, objweapon, shitloc, idflags, 0, 0, iskillstreakweapon);
        }
        return 0;
    } else if (level.friendlyfire == 1) {
        if (idamage < 1) {
            idamage = 1;
        }
        victim.lastdamagewasfromenemy = 0;
        if (isspreadweapon(objweapon) && namespace_25ead30c6ed027fb::validshotcheck(smeansofdeath, eattacker)) {
            if (namespace_23227899dfba5895::isdragonsbreathweapon(objweapon) && (weapon::getweapongroup(objweapon) == "weapon_shotgun" || istrue(objweapon.isalternate))) {
                victim thread dragonsbreathhitloccollection(shitloc, eattacker, objweapon);
            }
        }
        logfriendlyfire(victim, eattacker, idamage, smeansofdeath);
        victim finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname);
        eattacker handledamagefeedback(einflictor, eattacker, victim, idamage, smeansofdeath, objweapon, shitloc, idflags, 0, 0, iskillstreakweapon);
        return 0;
    } else if (level.friendlyfire == 2) {
        idamage = int(idamage * 0.5);
        if (idamage < 1) {
            idamage = 1;
        }
        eattacker.lastdamagewasfromenemy = 0;
        if (!function_b1493282af6c1334(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname)) {
            damageattacker(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname);
        }
        return 0;
    } else if (level.friendlyfire == 3) {
        idamage = int(idamage * 0.5);
        if (idamage < 1) {
            idamage = 1;
        }
        victim.lastdamagewasfromenemy = 0;
        eattacker.lastdamagewasfromenemy = 0;
        if (isspreadweapon(objweapon) && namespace_25ead30c6ed027fb::validshotcheck(smeansofdeath, eattacker)) {
            if (namespace_23227899dfba5895::isdragonsbreathweapon(objweapon) && (weapon::getweapongroup(objweapon) == "weapon_shotgun" || istrue(objweapon.isalternate))) {
                victim thread dragonsbreathhitloccollection(shitloc, eattacker, objweapon);
            }
        }
        logfriendlyfire(victim, eattacker, idamage, smeansofdeath);
        victim finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname);
        if (!function_b1493282af6c1334(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname)) {
            damageattacker(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname);
        }
        eattacker handledamagefeedback(einflictor, eattacker, victim, idamage, smeansofdeath, objweapon, shitloc, idflags, 0, 0, iskillstreakweapon);
        return 0;
    } else if (level.friendlyfire == 4) {
        var_399ac373783533b5 = !function_b1493282af6c1334(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname);
        if (var_399ac373783533b5 && isdefined(eattacker namespace_3c5a4254f2b957ea::getpersstat("teamdamage")) && self.team == eattacker.team) {
            teamdamage = int(idamage);
            if (idamage > victim.health) {
                teamdamage = victim.health;
            }
            var_ee03b1094657a1ca = !istrue(eattacker.pers["didHitFFPunishLimit"]) && iskillstreakweapon;
            if (!var_ee03b1094657a1ca) {
                eattacker stats::incpersstat("teamdamage", teamdamage);
            }
            var_490bde8509585600 = isdefined(level.var_843399bee19793fe) && level.var_843399bee19793fe > 0;
            if (var_490bde8509585600 && istrue(eattacker.pers["didHitFFPunishLimit"])) {
                eattacker hud_message::showerrormessage("MP/FRIENDLY_FIRE_KICK_WARNING");
                if (eattacker.pers["teamdamage"] - eattacker.pers["totalFFDamageDoneBeforePunish"] >= level.var_843399bee19793fe) {
                    if (!istrue(eattacker.pers["didHitFFKickLimit"])) {
                        eattacker.pers["didHitFFKickLimit"] = 1;
                    } else if (istrue(eattacker.connected)) {
                        kick(eattacker getentitynumber(), "EXE/PLAYERKICKED_TEAMKILLS");
                        return 0;
                    }
                }
            } else if (isdefined(level.var_dc3c7c5627a11e5e) && level.var_dc3c7c5627a11e5e > 0) {
                if (!istrue(eattacker.var_321f6ff131ffbb72) && eattacker.pers["teamdamage"] >= level.var_dc3c7c5627a11e5e) {
                    eattacker.var_321f6ff131ffbb72 = 1;
                    eattacker hud_message::showerrormessage("MP/FRIENDLY_FIRE_WILL_NOT");
                }
            }
        }
        var_554d89e1b2d5128b = isdefined(level.var_6706aad138cbc31d) && level.var_6706aad138cbc31d > 0;
        var_189a3d91f762202b = isdefined(eattacker.pers["teamkills"]) && eattacker.pers["teamkills"] >= level.maxallowedteamkills;
        if (!var_189a3d91f762202b && var_554d89e1b2d5128b) {
            var_189a3d91f762202b = isdefined(eattacker.pers["teamdamage"]) && eattacker.pers["teamdamage"] >= level.var_6706aad138cbc31d;
        }
        if (var_189a3d91f762202b && var_399ac373783533b5) {
            idamage = int(idamage * 0.5);
            if (idamage < 1) {
                idamage = 1;
            }
            eattacker.lastdamagewasfromenemy = 0;
            damageattacker(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname);
            if (!istrue(eattacker.pers["didHitFFPunishLimit"])) {
                eattacker.pers["didHitFFPunishLimit"] = 1;
                eattacker.pers["totalFFDamageDoneBeforePunish"] = eattacker.pers["teamdamage"];
            }
            return 0;
        }
    }
    return idamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8264
// Size: 0xcf
function isfriendlyfireprotectedperiod(attacker) {
    if (isdefined(level.gametype) && level.gametype == "havoc") {
        return 0;
    }
    if (game_utility::isanymlgmatch() && !istrue(level.var_ec2fb549b15ad827)) {
        return 0;
    }
    if (level.ingraceperiod) {
        return 1;
    }
    if (isdefined(attacker) && isdefined(attacker.pers) && isdefined(attacker.pers["teamkills"]) && attacker.pers["teamkills"] > 1 && game_utility::gettimepassed() < level.graceperiod * 1000 + 8000 + attacker.pers["teamkills"] * 1000) {
        return 1;
    }
    return 0;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x833b
// Size: 0xb5
function damageattacker(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname) {
    if (eattacker namespace_e47104b48662385b::_isalive()) {
        eattacker.friendlydamage = 1;
        eattacker finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname);
        eattacker.friendlydamage = undefined;
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83f7
// Size: 0x29
function mlghitlocrequiresclamp(shitloc) {
    return shitloc == "head" || shitloc == "helmet" || shitloc == "neck";
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8428
// Size: 0xd6
function mlgmodifyheadshotdamage(eattacker, idamage, smeansofdeath, objweapon, shitloc) {
    if (game_utility::isanymlgmatch() && isdefined(eattacker) && isplayer(eattacker) && !isnullweapon(objweapon) && weapon::isprimaryweapon(objweapon) && utility::isbulletdamage(smeansofdeath) && mlghitlocrequiresclamp(shitloc)) {
        switch (objweapon.classname) {
        case #"hash_719417cb1de832b6":
        case #"hash_8cdaf2e4ecfe5b51":
        case #"hash_900cb96c552c5e8e":
        case #"hash_fa24dff6bd60a12d":
            idamage = int(clamp(idamage, 0, objweapon.maxdamage * 1.3));
            break;
        }
    }
    return idamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8506
// Size: 0x161
function modifyfalldamage(victim, idamage, idflags, smeansofdeath) {
    modifieddamage = idamage;
    if (isdefined(smeansofdeath) && smeansofdeath == "MOD_FALLING") {
        if (istrue(victim.var_2cd6a0d57bdd5b1a)) {
            modifieddamage = 0;
        } else if (victim namespace_a2f809133c566621::isjuggernaut() || getdvarint(@"hash_f1b2bd0a1fa58a73", 0)) {
            modifieddamage = victim juggernaut::jugg_modifyfalldamage();
        } else if (victim namespace_1f2efdb89e5f3a6e::function_95adb84c5ca51c36() || istrue(self.var_b6aa5954bf6a457a)) {
            modifieddamage = victim namespace_1f2efdb89e5f3a6e::function_3a307fd8eb4f27eb();
        } else if (idflags & 32768 && modifieddamage >= victim.health) {
            modifieddamage = victim.health - 1;
        } else if (modifieddamage < victim.maxhealth) {
            modifieddamage = modifieddamage / victim.maxhealth * modifieddamage / victim.maxhealth * victim.maxhealth;
            thread namespace_646e434ccdd09379::function_2ca98396c7f5cc85(modifieddamage);
            if (istrue(self.var_808d06ddfc93a4e4)) {
                if (isdefined(level.var_6ca69a7226d8f8b5)) {
                    modifieddamage = modifieddamage * level.var_6ca69a7226d8f8b5;
                } else {
                    modifieddamage = 0;
                }
            } else if (modifieddamage >= victim.health) {
                modifieddamage = victim.health - 1;
            }
        }
    }
    return modifieddamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x866f
// Size: 0xb4
function modifyvehicletoplayerdamage(einflictor, eattacker, victim, idamage, smeansofdeath) {
    modifieddamage = idamage;
    if (isdefined(einflictor) && einflictor vehicle::isvehicle()) {
        if (victim killstreak::isjuggernaut()) {
            modifieddamage = victim juggernaut::jugg_modifyvehicletoplayerdamage(idamage, smeansofdeath);
        }
        if (getdvarint(@"hash_ec8cd89141ead8d9", 0) == 1) {
            velocity = einflictor vehicle_getvelocity();
            modifieddamage = victim.health - 1;
            if (victim.health > 0) {
                victim thread function_bf56dbd2a1035901(undefined, 1, velocity);
            }
        }
    }
    return modifieddamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x872b
// Size: 0x75
function function_53b212d296370f7(victim, idamage, idflags, shitloc, smeansofdeath, eattacker, objweapon) {
    modifieddamage = idamage;
    vehicle = victim namespace_e47104b48662385b::getvehicle();
    if (isdefined(vehicle)) {
        modifieddamage = vehicle_damage::function_9cac3af67ee6b40a(vehicle, victim, idamage, idflags, shitloc, smeansofdeath, eattacker, objweapon);
    }
    return modifieddamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87a8
// Size: 0x7b
function modifycrushdamage(einflictor, eattacker, victim, idamage, smeansofdeath) {
    modifieddamage = idamage;
    if (isdefined(smeansofdeath) && smeansofdeath == "MOD_CRUSH") {
        if (isdefined(einflictor) && isdefined(eattacker) && einflictor == eattacker && eattacker killstreak::isjuggernaut() && victim killstreak::isjuggernaut()) {
            modifieddamage = victim juggernaut::jugg_modifyherodroptoplayerdamage(idamage);
        }
    }
    return modifieddamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x882b
// Size: 0x97
function function_754e680a5b56b39e(eattacker, victim, objweapon, smeansofdeath, idamage, var_be4285b26ed99ab1) {
    modifieddamage = idamage;
    if (isdefined(eattacker) && isdefined(smeansofdeath) && isdefined(objweapon)) {
        if (namespace_23227899dfba5895::function_cfd2e1e48edaf93(objweapon)) {
            objweapon = eattacker namespace_45ecbe78f599af72::function_1e3102980c3a4cc1(objweapon);
            if (!isspreadweapon(objweapon)) {
                var_ad6e07429cabf92b = victim.health;
                modifieddamage = var_be4285b26ed99ab1;
                if (modifieddamage >= var_ad6e07429cabf92b) {
                    modifieddamage = var_ad6e07429cabf92b - 1;
                }
            }
        }
    }
    return modifieddamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88ca
// Size: 0xd9
function function_2aa2c49ee1702368(eattacker, victim, objweapon, smeansofdeath, idamage, var_be4285b26ed99ab1, einflictor) {
    if (!game_utility::function_21322da268e71c19()) {
        return idamage;
    }
    data = namespace_25ead30c6ed027fb::packdamagedata(eattacker, victim, idamage, objweapon, smeansofdeath, einflictor);
    if (victim namespace_25ead30c6ed027fb::isstuckdamagekill(data)) {
        return idamage;
    }
    if (victim killstreak::isjuggernaut()) {
        return idamage;
    }
    equiptype = weapon::getequipmenttype(objweapon);
    if (isdefined(equiptype)) {
        if (equiptype == "lethal") {
            idamage = function_88c7467b96144afd(objweapon, idamage);
        } else {
            if (equiptype == "equipment_other") {
                goto LOC_000000c1;
            }
            if (equiptype == "tactical") {
            LOC_000000c1:
            }
        LOC_000000c1:
        }
    LOC_000000c1:
    }
LOC_000000c1:
    if (utility::isbulletdamage(smeansofdeath)) {
        idamage = function_18b0510fbca05ff7(objweapon, idamage);
    }
    return idamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x89ab
// Size: 0x76
function private function_88c7467b96144afd(objweapon, damage) {
    var_3eb952b99f137248 = @"hash_303dbc969fd35e79";
    if (isdefined(objweapon.basename)) {
        dvarstring = function_2ef675c13ca1c4af(var_3eb952b99f137248, objweapon.basename);
        var_b4be57645c0cf041 = self.maxhealth / 150;
        damage = damage * getdvarfloat(dvarstring, var_b4be57645c0cf041);
    }
    return damage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a29
// Size: 0xc7
function private function_18b0510fbca05ff7(objweapon, damage) {
    var_3eb952b99f137248 = @"hash_303dbc969fd35e79";
    if (isdefined(objweapon.classname)) {
        dvarstring = function_2ef675c13ca1c4af(var_3eb952b99f137248, objweapon.classname);
        damageratio = getdvarfloat(dvarstring, 0);
        damage = damage * utility::ter_op(damageratio == 0, 1, damageratio);
    }
    if (isdefined(objweapon.basename)) {
        dvarstring = function_2ef675c13ca1c4af(var_3eb952b99f137248, objweapon.basename);
        damageratio = getdvarfloat(dvarstring, 0);
        damage = damage * utility::ter_op(damageratio == 0, 1, damageratio);
    }
    return damage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8af8
// Size: 0x367
function function_49f3d4de0e352093(inflictor, attacker, victim, objweapon, smeansofdeath, idamage, var_be4285b26ed99ab1, shitloc) {
    modifieddamage = idamage;
    iskillstreakweapon = istrue(weapon::iskillstreakweapon(objweapon));
    var_c51482faace41c59 = issubstr(objweapon.basename, "frag_grenade");
    if (var_c51482faace41c59) {
        /#
            assert(smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_IMPACT", "Unexpected means of death found with Frag Grenade: " + smeansofdeath);
        #/
    }
    if (isexplosivedamagemod(smeansofdeath)) {
        if (isplayer(attacker)) {
            if (attacker != victim && attacker perk::_hasperk("specialty_paint") && !iskillstreakweapon) {
                victim thread namespace_30a6d7a07831c1e2::setpainted(attacker);
            }
        }
        modifieddamage = modifydestructibledamage(modifieddamage, inflictor, objweapon);
        modifieddamage = claymore::claymore_modifieddamage(victim, objweapon, inflictor, smeansofdeath, modifieddamage);
        modifieddamage = at_mine::at_mine_modified_damage(victim, inflictor, objweapon, smeansofdeath, modifieddamage);
        modifieddamage = cluster_spike::function_723aa6329b751bc7(victim, inflictor, objweapon, smeansofdeath, modifieddamage);
        if (issharedfuncdefined(#"hash_3e1f3a354ee4ffcb", #"modifydamage", 1)) {
            modifieddamage = [[ getsharedfunc(#"hash_3e1f3a354ee4ffcb", #"modifydamage") ]](victim, inflictor, objweapon, smeansofdeath, modifieddamage);
        }
        if (isdefined(objweapon) && isdefined(objweapon.basename)) {
            switch (objweapon.basename) {
            case #"hash_34e7a4cd11aed6bc":
            case #"hash_d072a0adddda0068":
                if (isdefined(victim) && modifieddamage >= victim.health) {
                    if (isdefined(attacker)) {
                        attacker damagefeedback::updatedamagefeedback("");
                    }
                    modifieddamage = 0;
                }
                break;
            case #"hash_7f7c5fcf3fba0bea":
                modifieddamage = 0;
                break;
            }
        }
        var_c7fe40d41a2e7963 = function_fc64178f71375137(victim.loadoutperks, "specialty_eod_vest");
        if (issharedfuncdefined("thermobaric_grenade", "thermobaric_additional_explosive_damage")) {
            modifieddamage = modifieddamage + [[ getsharedfunc("thermobaric_grenade", "thermobaric_additional_explosive_damage") ]](victim, attacker, modifieddamage);
        }
        if (isplayer(attacker) && weaponinheritsperks(objweapon) && attacker perk::_hasperk("specialty_explosivedamage") && victim perk::_hasperk("specialty_blastshield")) {
            goto LOC_00000340;
        }
        if (isplayer(attacker) && weaponinheritsperks(objweapon) && !iskillstreakweapon && attacker perk::_hasperk("specialty_explosivedamage")) {
            modifieddamage = modifieddamage + modifieddamage * level.explosivedamagemod;
        } else if ((var_c7fe40d41a2e7963 || victim perk::_hasperk("specialty_blastshield")) && !damage_should_ignore_blast_shield(attacker, victim, objweapon, smeansofdeath, inflictor, shitloc)) {
            if (var_c7fe40d41a2e7963) {
                /#
                    assert(victim perk::_hasperk("specialty_blastshield"), "Victim has EOD Vest perk, but not specialty_blastshield");
                #/
            }
            var_46381c94b0138dc7 = modify_blast_shield_damage(modifieddamage, attacker, victim, victim.var_8cbe63a199e19de);
            victim perks::activatePerk("specialty_eod");
            modifieddamage = modifieddamage - modifieddamage - var_46381c94b0138dc7;
        LOC_00000340:
        }
    LOC_00000340:
        if (isdefined(level.lethaldelay) && !equipment::lethaldelaypassed()) {
            modifieddamage = modifieddamage * level.graceperiodgrenademod;
        }
    }
    return modifieddamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e67
// Size: 0xb5
function function_112ee98a4faca19a(inflictor, attacker, victim, objweapon, smeansofdeath, idamage, var_be4285b26ed99ab1, shitloc) {
    modifieddamage = idamage;
    if (smeansofdeath == "MOD_FIRE") {
        if (victim perk::_hasperk("specialty_blastshield") && !damage_should_ignore_blast_shield(attacker, victim, objweapon, smeansofdeath, inflictor, shitloc)) {
            var_46381c94b0138dc7 = modify_blast_shield_damage(modifieddamage, attacker, victim, victim.var_fb1106d94cc95901);
            victim perks::activatePerk("specialty_eod");
            modifieddamage = modifieddamage - modifieddamage - var_46381c94b0138dc7;
        }
    }
    return modifieddamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f24
// Size: 0x2ef
function function_7e8906e2dab3d41e(inflictor, attacker, victim, objweapon, smeansofdeath, idamage, var_be4285b26ed99ab1, shitloc) {
    modifieddamage = idamage;
    if (isdefined(objweapon) && isdefined(smeansofdeath) && victim _hasperk("specialty_super_protection")) {
        weaponref = objweapon.basename;
        var_ae95568a563d5912 = weaponclass(objweapon);
        var_b4a7d8cd8c4fb7da = isdefined(inflictor) && (isdefined(inflictor.stuckto) && inflictor.stuckto == victim || isdefined(inflictor.stuckenemyentity) && inflictor.stuckenemyentity == victim);
        if (isdefined(weaponref) && isdefined(var_ae95568a563d5912)) {
            if (isbulletdamage(smeansofdeath)) {
                switch (var_ae95568a563d5912) {
                case #"hash_e224d0b635d0dadd":
                    if (istrue(var_b4a7d8cd8c4fb7da)) {
                        modifieddamage = min(1, idamage);
                    }
                    break;
                }
            } else if (function_f1d312f6935bc2d2(smeansofdeath)) {
                if (isdefined(var_ae95568a563d5912)) {
                    switch (var_ae95568a563d5912) {
                    case #"hash_2ab98cab4066a74e":
                        modifieddamage = min(self.maxhealth, idamage);
                        break;
                    }
                }
            } else if (isexplosivedamagemod(smeansofdeath)) {
                switch (weaponref) {
                case #"hash_ab3485fa6834de47":
                    if (istrue(var_b4a7d8cd8c4fb7da)) {
                        modifieddamage = min(5, idamage);
                    }
                    break;
                }
            } else if (isfiredamage(smeansofdeath)) {
                var_b4a7d8cd8c4fb7da = isdefined(inflictor) && (isdefined(inflictor.stuckto) && inflictor.stuckto == victim || isdefined(inflictor.stuckenemyentity) && inflictor.stuckenemyentity == victim);
                switch (weaponref) {
                case #"hash_4c7de5619284e175":
                case #"hash_8fd6158eb96a1f15":
                case #"hash_b2a8e1829f433bd7":
                    if (istrue(var_b4a7d8cd8c4fb7da)) {
                        modifieddamage = min(5, idamage);
                    }
                    break;
                }
            }
        }
        if (modifieddamage > 0) {
            if (isagent(attacker)) {
                goto LOC_00000270;
            }
            modifier = getdvarfloat(@"hash_82cc9b0ec1f12017", 0);
            modifieddamage = int(modifieddamage * modifier);
            if (modifieddamage == 0) {
                attacker damagefeedback::updatedamagefeedback("hitnobulletdamage_wm", 0, 0, undefined, 1);
            }
        }
    }
    if (isdefined(objweapon) && isdefined(smeansofdeath) && smeansofdeath != "MOD_FALLING" && modifieddamage < victim.maxhealth && victim _hasperk("specialty_battlerage_reduce_damage")) {
        modifieddamage = int(modifieddamage * getdvarfloat(@"hash_1bd8b2e40fb683f9", 0.9));
    }
    return modifieddamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x921b
// Size: 0x3fd
function modifydamagegeneral(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime, var_be4285b26ed99ab1, partname) {
    var_69cfd14b4398c458 = idamage;
    idamage = mlgmodifyheadshotdamage(eattacker, idamage, smeansofdeath, objweapon, shitloc);
    idamage = modifyfalldamage(victim, idamage, idflags, smeansofdeath);
    idamage = modifyvehicletoplayerdamage(einflictor, eattacker, victim, idamage, smeansofdeath);
    idamage = function_53b212d296370f7(victim, idamage, idflags, shitloc, smeansofdeath, eattacker, objweapon);
    idamage = modifycrushdamage(einflictor, eattacker, victim, idamage, smeansofdeath);
    idamage = function_754e680a5b56b39e(eattacker, victim, objweapon, smeansofdeath, idamage, var_be4285b26ed99ab1);
    idamage = function_2aa2c49ee1702368(eattacker, victim, objweapon, smeansofdeath, idamage, var_be4285b26ed99ab1, einflictor);
    idamage = function_49f3d4de0e352093(einflictor, eattacker, victim, objweapon, smeansofdeath, idamage, var_be4285b26ed99ab1, shitloc);
    idamage = function_112ee98a4faca19a(einflictor, eattacker, victim, objweapon, smeansofdeath, idamage, var_be4285b26ed99ab1, shitloc);
    idamage = function_7e8906e2dab3d41e(einflictor, eattacker, victim, objweapon, smeansofdeath, idamage, var_be4285b26ed99ab1, shitloc);
    if (isdefined(level.modifyplayerdamage)) {
        idamage = int([[ level.modifyplayerdamage ]](einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1));
    }
    var_57ac5dc40b2e5a9 = armor::function_90ce8eb3ddaa4943(eattacker, einflictor, victim, idamage, objweapon, smeansofdeath, shitloc, idflags, var_be4285b26ed99ab1, var_69cfd14b4398c458, partname);
    var_1da1a66b5c6a06a7 = var_57ac5dc40b2e5a9[1];
    idamage = var_57ac5dc40b2e5a9[0];
    if (var_1da1a66b5c6a06a7 > 0 && isplayer(eattacker)) {
        if (shouldrecorddamagestats(eattacker)) {
            eattacker stats::incpersstat("damage", var_1da1a66b5c6a06a7);
            eattacker namespace_969918091e5d9483::function_d16498b27251da56(1, var_1da1a66b5c6a06a7);
            if (isdefined(eattacker namespace_3c5a4254f2b957ea::getpersstat("friendlyDamageDone")) && victim.team == eattacker.team) {
                eattacker stats::incpersstat("friendlyDamageDone", var_1da1a66b5c6a06a7);
            }
        } else if (isdefined(level.onattackerdamagenottracked)) {
            eattacker [[ level.onattackerdamagenottracked ]](var_1da1a66b5c6a06a7);
        }
    }
    if (smeansofdeath == "MOD_EXPLOSIVE_BULLET" && idamage != 1) {
        idamage = idamage * getdvarfloat(@"hash_a881f1ebdab09002");
        idamage = int(idamage);
    }
    if (smeansofdeath == "MOD_IMPACT" && idamage != 1) {
        if (istrue(objweapon.isalternate) && weapons::isattachmentgrenadelauncher(objweapon.underbarrel)) {
            velocity = einflictor getmissilevelocity();
            speed = length(velocity);
            if (speed < 400) {
                idamage = 10;
            }
        }
    }
    if (objweapon.basename == "iw9_dm_crossbow_mp" && isdefined(victim.inlaststand) && istrue(victim.inlaststand)) {
        idamage = victim.health;
        var_edf5c78dc8518f2d = getdvarfloat(@"hash_a3a7191f4314591f", 0);
        if (var_edf5c78dc8518f2d > 0) {
            idamage = idamage * var_edf5c78dc8518f2d;
        }
    }
    if (!isdefined(victim.donotmodifydamage)) {
        idamage = int(idamage * victim namespace_25ead30c6ed027fb::getdamagemodifiertotal(einflictor, eattacker, victim, idamage, smeansofdeath, objweapon, shitloc));
    }
    if (isdefined(eattacker) && isdefined(eattacker.var_888410f22da94ad0) && istrue(eattacker.var_888410f22da94ad0)) {
        idamage = idamage * 0.5;
    }
    if (namespace_25ead30c6ed027fb::isheadshot(shitloc, smeansofdeath, eattacker)) {
        smeansofdeath = "MOD_HEAD_SHOT";
    }
    if (tweakables::gettweakablevalue("game", "onlyheadshots") || tweakables::gettweakablevalue("game", "one_tap_headshot")) {
        if (smeansofdeath == "MOD_HEAD_SHOT") {
            idamage = 150;
        }
    }
    return [0:idamage, 1:var_1da1a66b5c6a06a7];
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9620
// Size: 0x4f6
function handleriotshieldhits(einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, iskillstreakweapon) {
    if (shitloc != "shield") {
        return idamage;
    }
    if (isdefined(objweapon) && objweapon.basename == "super_laser_charge_mp") {
        victim.forcehitlocation = "none";
        return idamage;
    }
    data = namespace_25ead30c6ed027fb::packdamagedata(eattacker, victim, idamage, objweapon, smeansofdeath, einflictor, vpoint, vdir, undefined, undefined, undefined, idflags);
    var_638af1e086448f2f = istrue(victim.ignoreriotshieldxp);
    isenemy = istrue(namespace_e47104b48662385b::playersareenemies(victim, eattacker));
    if (getdvarint(@"hash_79392ae6dcfba9e9", 0)) {
        isfriendly = isfriendlyfire(victim, eattacker);
        var_df49e818dfac7dba = isdefined(victim) && (isdefined(eattacker) && eattacker == victim || isdefined(eattacker.owner) && eattacker.owner == victim);
        if (isenemy || isfriendly && (game_utility::function_21322da268e71c19() || var_df49e818dfac7dba)) {
            if (function_cd066c9463ad28c5(objweapon, smeansofdeath)) {
                victim.var_5c11205f47af8b92 = gettime();
            }
        }
    }
    if (isdefined(victim.owner)) {
        victim = victim.owner;
        if (eattacker == victim) {
            return 0;
        }
    }
    if (smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET" || smeansofdeath == "MOD_EXPLOSIVE_BULLET") {
        if (isplayer(eattacker)) {
            eattacker.lastattackedshieldplayer = victim;
            eattacker.lastattackedshieldtime = gettime();
        }
        victim notify("shield_blocked");
        if (weapon::isenvironmentweapon(objweapon.basename)) {
            shielddamage = 25;
        } else {
            var_619984a4a37b8423 = cac_modified_damage(victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, einflictor, 0, idflags);
            shielddamage = var_619984a4a37b8423[0];
            var_986b2e0350629522 = var_619984a4a37b8423[1];
            shitloc = var_619984a4a37b8423[2];
        }
        victim stats::incpersstat("riotShieldDamageAbsorbed", shielddamage);
        if (isplayer(eattacker) && isdefined(victim.rearguardattackers)) {
            idx = eattacker getentitynumber();
            if (!isdefined(victim.rearguardattackers[idx])) {
                victim.rearguardattackers[idx] = shielddamage;
            } else {
                victim.rearguardattackers[idx] = victim.rearguardattackers[idx] + shielddamage;
            }
        }
        if (var_638af1e086448f2f) {
            return 0;
        }
        if (!weapon::isenvironmentweapon(objweapon.basename) || utility::cointoss()) {
            victim.shieldbullethits++;
        }
        if (victim.shieldbullethits >= level.riotshieldxpbullets && isenemy) {
            var_244c8b1a0fd7b3f2 = 1;
            if (self.recentshieldxp > 4) {
                var_244c8b1a0fd7b3f2 = 1 / self.recentshieldxp;
            }
            basepoints = rank::getscoreinfovalue(#"shield_damage");
            victim thread points::doScoreEvent(#"shield_damage", victim.currentweapon, basepoints * var_244c8b1a0fd7b3f2);
            victim thread giverecentshieldxp();
            victim.shieldbullethits = 0;
        }
    }
    var_33e2d54d8812e8ce = isdefined(einflictor) && isdefined(einflictor.stuckenemyentity) && einflictor.stuckenemyentity == victim;
    var_232d7ef9f0f8baa8 = victim function_3f6d1c80aac1b91();
    if (idflags & 32) {
        victim.forcehitlocation = "none";
        if (!(idflags & 64)) {
            victim stats::incpersstat("riotShieldDamageAbsorbed", idamage);
            idamage = 0;
        }
    } else if (idflags & 128) {
        victim.forcehitlocation = "none";
        if (victim namespace_25ead30c6ed027fb::isstuckdamagekill(data)) {
            idamage = victim.maxhealth;
        }
    } else if (isdefined(eattacker) && istrue(eattacker.var_7e1971e4a9ec2cdc)) {
        return 0;
    } else if (isdefined(var_232d7ef9f0f8baa8) && var_232d7ef9f0f8baa8.var_8296392555ef410c > 0) {
        victim.forcehitlocation = "none";
        idamage = int(idamage * var_232d7ef9f0f8baa8.var_8296392555ef410c);
    } else {
        return 0;
    }
    if (smeansofdeath == "MOD_MELEE" && namespace_45ecbe78f599af72::isriotshield(objweapon.basename)) {
        victim stunplayer(0);
    }
    return idamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b1e
// Size: 0x286
function filterdamage(einflictor, eattacker, victim, idamage, smeansofdeath, objweapon, shitloc) {
    if (!idamage) {
        return "!iDamage";
    }
    if (isdefined(level.hostmigrationtimer)) {
        return "level.hostMigrationTimer";
    }
    eattacker = _validateattacker(eattacker);
    if (!isdefined(eattacker) && smeansofdeath != "MOD_FALLING" && !(isdefined(einflictor) && isdefined(einflictor.team) && einflictor.team == "team_hundred_ninety")) {
        return "invalid attacker";
    }
    victim = _validatevictim(victim);
    if (!isdefined(victim)) {
        return "invalidVictim";
    }
    if (isdefined(eattacker) && eattacker == victim && smeansofdeath == "MOD_EXPLOSIVE_BULLET") {
        return "Bullet Splash Protection";
    }
    if (game["state"] == "postgame") {
        return "game[ state ] == postgame";
    }
    if (isdefined(victim.sessionteam) && victim.sessionteam == "spectator") {
        return "victim.sessionteam == spectator";
    }
    if (isdefined(eattacker) && (isdefined(victim.damageBlockedTeam) && victim.damageBlockedTeam == eattacker.team || isdefined(eattacker.damageBlockedTeam) && eattacker.damageBlockedTeam == victim.team)) {
        if (isdefined(eattacker)) {
            if (isdefined(victim.damageBlockedTeam) && victim.damageBlockedTeam == eattacker.team || isdefined(eattacker.damageBlockedTeam) && eattacker.damageBlockedTeam == victim.team) {
                return "damageBlockedTeam";
            }
        }
    }
    if (tweakables::gettweakablevalue("game", "onlyheadshots")) {
        if (shitloc != "head" && shitloc != "helmet") {
            if (smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET" || smeansofdeath == "MOD_EXPLOSIVE_BULLET") {
                return "getTweakableValue( game, onlyheadshots )";
            }
        }
    }
    if (function_2be5b08ed39d6a54(eattacker, victim, objweapon)) {
        return "crossbow semtex splash damage on stuckto victim";
    }
    if (smeansofdeath == "MOD_CRUSH" && isdefined(einflictor) && einflictor vehicle::isvehicle() && victim namespace_e47104b48662385b::isinvehicle()) {
        return "hitByVehicleWhileInVehicle";
    }
    if (vehicle::vehicle_playershouldignorecollisiondamage(einflictor, victim, smeansofdeath, objweapon)) {
        return "vehicle_playerShouldIgnoreCollisionDamage";
    }
    if (vehicle::vehicle_isRubbingAgainstVehicle(einflictor, victim, smeansofdeath)) {
        return "vehicle_isRubbingAgainstVehicle";
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params b, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9dab
// Size: 0x29d
function logattacker(victim, eattacker, einflictor, objweapon, idamage, vpoint, vdir, shitloc, psoffsettime, smeansofdeath, var_1da1a66b5c6a06a7) {
    if (isdefined(smeansofdeath) && smeansofdeath == "MOD_FALLING") {
        eattacker = victim;
    }
    if (isdefined(eattacker) && (isplayer(eattacker) || isagent(eattacker))) {
        addattacker(victim, eattacker, einflictor, objweapon, idamage, vpoint, vdir, shitloc, psoffsettime, smeansofdeath, var_1da1a66b5c6a06a7);
    }
    if (isdefined(eattacker) && !isplayer(eattacker) && isdefined(eattacker.owner) && (!isdefined(eattacker.scrambled) || !eattacker.scrambled)) {
        addattacker(victim, eattacker.owner, einflictor, objweapon, idamage, vpoint, vdir, shitloc, psoffsettime, smeansofdeath, var_1da1a66b5c6a06a7);
    } else if (isdefined(eattacker) && !isplayer(eattacker) && isdefined(eattacker.secondowner) && isdefined(eattacker.scrambled) && eattacker.scrambled) {
        addattacker(victim, eattacker.secondowner, einflictor, objweapon, idamage, vpoint, vdir, shitloc, psoffsettime, smeansofdeath, var_1da1a66b5c6a06a7);
    }
    if (isdefined(einflictor) && isdefined(einflictor.owner)) {
        var_aeae22d243e7af66 = isdefined(einflictor.owner.team) && einflictor.owner.team != victim.team || level.friendlyfire == 1;
        if (var_aeae22d243e7af66 && isdefined(einflictor.owner.guid) && !isdefined(self.attackerdata[einflictor.owner.guid])) {
            addattacker(victim, einflictor.owner, einflictor, objweapon, idamage, vpoint, vdir, shitloc, psoffsettime, smeansofdeath, var_1da1a66b5c6a06a7);
        }
    }
    if (isdefined(eattacker) && isplayer(eattacker) && isdefined(objweapon) && eattacker != victim) {
        eattacker thread weapons::checkhit(objweapon, victim, shitloc, idamage);
        eattacker thread events::damagedplayer(self, idamage);
        victim.attackerposition = eattacker.origin;
    } else {
        victim.attackerposition = undefined;
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa04f
// Size: 0x1bd
function logattackerkillstreak(victim, idamage, eattacker, vdir, vpoint, smeansofdeath, modelname, tagname, partname, idflags, sweapon) {
    if (isdefined(eattacker) && isplayer(eattacker)) {
        addattackerkillstreak(victim, idamage, eattacker, vdir, vpoint, smeansofdeath, modelname, tagname, partname, idflags, sweapon);
    }
    if (isdefined(eattacker) && !isplayer(eattacker) && isdefined(eattacker.owner) && isplayer(eattacker.owner) && (!isdefined(eattacker.scrambled) || !eattacker.scrambled)) {
        eattacker = eattacker.owner;
        addattackerkillstreak(victim, idamage, eattacker, vdir, vpoint, smeansofdeath, modelname, tagname, partname, idflags, sweapon);
    } else if (isdefined(eattacker) && !isplayer(eattacker) && isdefined(eattacker.secondowner) && isplayer(eattacker.secondowner) && isdefined(eattacker.scrambled) && eattacker.scrambled) {
        eattacker = eattacker.secondowner;
        addattackerkillstreak(victim, idamage, eattacker, vdir, vpoint, smeansofdeath, modelname, tagname, partname, idflags, sweapon);
    }
    if (isdefined(eattacker) && isplayer(eattacker) && isdefined(sweapon) && eattacker != victim) {
        victim.attackerposition = eattacker.origin;
    } else {
        victim.attackerposition = undefined;
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa213
// Size: 0x353
function loggrenadedata(einflictor, eattacker, victim, idamage, smeansofdeath, objweapon) {
    if ((issubstr(smeansofdeath, "MOD_EXPLOSIVE") || issubstr(smeansofdeath, "MOD_PROJECTILE")) && isdefined(einflictor) && isdefined(eattacker)) {
        var_366b0ecc2f28aead = getcompleteweaponname(objweapon);
        victim.explosiveinfo = [];
        victim.explosiveinfo["damageTime"] = gettime();
        victim.explosiveinfo["damageId"] = einflictor getentitynumber();
        victim.explosiveinfo["returnToSender"] = 0;
        victim.explosiveinfo["counterKill"] = 0;
        victim.explosiveinfo["chainKill"] = 0;
        victim.explosiveinfo["cookedKill"] = 0;
        victim.explosiveinfo["throwbackKill"] = 0;
        victim.explosiveinfo["suicideGrenadeKill"] = 0;
        victim.explosiveinfo["weapon"] = var_366b0ecc2f28aead;
        isfrag = issubstr(objweapon.basename, "frag_");
        if (eattacker != victim) {
            if ((issubstr(objweapon.basename, "c4_") || issubstr(objweapon.basename, "proximity_explosive_") || issubstr(objweapon.basename, "claymore_")) && isdefined(einflictor.owner)) {
                victim.explosiveinfo["returnToSender"] = einflictor.owner == victim;
                victim.explosiveinfo["counterKill"] = isdefined(einflictor.wasdamaged);
                victim.explosiveinfo["chainKill"] = isdefined(einflictor.waschained);
                victim.explosiveinfo["bulletPenetrationKill"] = isdefined(einflictor.wasdamagedfrombulletpenetration);
                victim.explosiveinfo["cookedKill"] = 0;
            }
            if (isdefined(eattacker.lastgrenadesuicidetime) && eattacker.lastgrenadesuicidetime >= gettime() - 50 && isfrag) {
                victim.explosiveinfo["suicideGrenadeKill"] = 1;
            }
        }
        if (isfrag) {
            victim.explosiveinfo["cookedKill"] = isdefined(einflictor.iscooked);
            victim.explosiveinfo["throwbackKill"] = isdefined(einflictor.threwback);
        }
        victim.explosiveinfo["stickKill"] = isdefined(einflictor.isstuck) && einflictor.isstuck == "enemy";
        victim.explosiveinfo["stickFriendlyKill"] = isdefined(einflictor.isstuck) && einflictor.isstuck == "friendly";
        if (isplayer(eattacker) && eattacker != self && game_utility::getgametype() != "aliens") {
            updateinflictorstat(einflictor, eattacker, var_366b0ecc2f28aead);
        }
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa56d
// Size: 0xbb5
function handledamagefeedback(einflictor, eattacker, victim, idamage, smeansofdeath, objweapon, shitloc, idflags, var_1da1a66b5c6a06a7, var_986b2e0350629522, iskillstreakweapon, partname) {
    if (function_483cc81bff18273b(eattacker) || function_483cc81bff18273b(victim)) {
        return;
    }
    if (isdefined(victim.handledamagefeedback)) {
        [[ victim.handledamagefeedback ]](einflictor, eattacker, victim, idamage, smeansofdeath, objweapon, shitloc, idflags, var_1da1a66b5c6a06a7, var_986b2e0350629522, iskillstreakweapon);
        return;
    }
    var_168973eaf883aea1 = isdefined(eattacker) && isdefined(eattacker.classname) && !isdefined(eattacker.gunner) && (eattacker.classname == "script_vehicle" || eattacker.classname == "misc_turret" || eattacker.classname == "script_model");
    if (var_168973eaf883aea1 && isdefined(eattacker.gunner)) {
        var_91ebb035a259e76a = eattacker.gunner;
    } else if (isdefined(eattacker) && isdefined(eattacker.owner)) {
        var_91ebb035a259e76a = eattacker.owner;
    } else {
        var_91ebb035a259e76a = eattacker;
    }
    var_cdcedb142f61b43e = "standard";
    if (isdefined(var_91ebb035a259e76a) && var_91ebb035a259e76a != victim && idamage + var_1da1a66b5c6a06a7 + var_986b2e0350629522 > 0 && (!isdefined(shitloc) || shitloc != "shield")) {
        var_4ffe32f42d51a763 = !victim namespace_e47104b48662385b::_isalive() || isagent(victim) && idamage >= victim.health;
        var_b44e627d6a911f55 = game_utility::function_fa7bfcc1d68b7b73();
        var_dc726e8cc0b003a3 = isdefined(victim.var_bed158a6dfac230d) && victim.var_bed158a6dfac230d > 2;
        var_a2ffd9894fd368c5 = isdefined(victim.var_4045f099f3da4bd) && victim.var_4045f099f3da4bd == "brloot_plate_carrier_tempered";
        var_ccf879b038e4391 = idamage + var_1da1a66b5c6a06a7 + var_986b2e0350629522;
        var_135003274a4cc703 = 0;
        if (istrue(var_dc726e8cc0b003a3) && isdefined(victim.armorhealth)) {
            var_135003274a4cc703 = victim.armorhealth + var_ccf879b038e4391 >= 150;
        }
        if (isplayer(eattacker) && function_3201a1bc3ff0e482(eattacker, victim, smeansofdeath, idflags)) {
            var_cdcedb142f61b43e = "hitsuppression";
        } else if (victim perk::_hasperk("specialty_pistoldeath") && isdefined(victim.inlaststand) && victim.inlaststand == 1 && !victim.hasshownlaststandicon) {
            victim.hasshownlaststandicon = 1;
            var_cdcedb142f61b43e = "hitlaststand";
        } else if (!isagent(victim) && victim function_f1dcadc8f7c3477c()) {
            var_cdcedb142f61b43e = "hitlaststand";
        } else if (istrue(victim.isjuggernaut)) {
            if (istrue(victim.isjuggernautrecon)) {
                var_cdcedb142f61b43e = "hitjuggernautrecon";
            } else {
                var_cdcedb142f61b43e = "hitjuggernaut";
            }
        } else if (isplayer(victim) && istrue(victim function_fc05ebabfbf10e33())) {
            var_cdcedb142f61b43e = "hitarmorheavy";
        } else if (victim heavyarmor::hasheavyarmor() || victim heavyarmor::hasheavyarmorinvulnerability()) {
            var_cdcedb142f61b43e = "hitarmorheavy";
        } else if (idflags & 16) {
            var_cdcedb142f61b43e = "stun";
        } else if (hashealthshield(victim)) {
            var_cdcedb142f61b43e = "hitarmorlight";
        } else if (armor::armorvest_wasbroke(var_91ebb035a259e76a)) {
            var_cdcedb142f61b43e = "hitarmorlightbreak";
            if (var_dc726e8cc0b003a3 && !var_b44e627d6a911f55) {
                var_cdcedb142f61b43e = "hitarmormaxplatebreak";
            }
            if (var_a2ffd9894fd368c5 && !var_b44e627d6a911f55) {
                var_cdcedb142f61b43e = "hitarmortemperedbreak";
            }
        } else if (victim perk::_hasperk("specialty_durability")) {
            var_cdcedb142f61b43e = "hitdurability";
        } else if (function_7cc9753f2f84e883(eattacker, victim) || victim game_utility::isspawnprotected() && iskillstreakweapon && !weapon::weaponbypassspawnprotection(objweapon)) {
            var_cdcedb142f61b43e = "hitspawnprotect";
        } else if (helmet_wasbroke(var_91ebb035a259e76a)) {
            var_cdcedb142f61b43e = "hithelmetlightbreak";
        } else if (armor::armorvest_washit(var_91ebb035a259e76a)) {
            var_cdcedb142f61b43e = "hitarmorlight";
            if ((getdvarint(@"hash_2f7767a2a092ce1a", 0) || !getdvarint(@"hash_f786619a1f55409f", 0)) && var_dc726e8cc0b003a3 && !var_b44e627d6a911f55) {
                var_cdcedb142f61b43e = "hitarmorlightmaxlevel";
            }
            if (var_a2ffd9894fd368c5 && !var_b44e627d6a911f55) {
                var_cdcedb142f61b43e = "hitarmorlighttempered";
            }
        } else if (helmet_washit(var_91ebb035a259e76a)) {
            var_cdcedb142f61b43e = "hithelmetlight";
        } else if (var_1da1a66b5c6a06a7 > 0) {
            var_cdcedb142f61b43e = "hitarmorlight";
        } else if (victim _hasperk("specialty_regen_delay_reduced")) {
            var_cdcedb142f61b43e = "hitquickfix";
        } else if (istrue(victim.var_808d06ddfc93a4e4)) {
            var_cdcedb142f61b43e = "hitbattlerage";
        } else if (function_bd90db337f1ae0d4(victim, var_91ebb035a259e76a)) {
            function_675990374e11b0f7(victim, var_91ebb035a259e76a);
            var_cdcedb142f61b43e = "hitresolute";
        } else if (istacticaldamage(objweapon, smeansofdeath) && victim perk::_hasperk("specialty_stun_resistance")) {
            var_cdcedb142f61b43e = "hittacresist";
        } else if (victim perk::_hasperk("specialty_blastshield") && !damage_should_ignore_blast_shield(eattacker, victim, objweapon, smeansofdeath, einflictor, shitloc)) {
            var_cdcedb142f61b43e = "hitblastshield";
        } else if (istrue(victim.adrenalinepoweractive)) {
            var_cdcedb142f61b43e = "hitadrenaline";
        } else if (isdefined(objweapon) && objweapon.basename == "sound_veil_mp") {
            var_cdcedb142f61b43e = "hitsoundveil";
        } else if (getdvarint(@"hash_1db87c3b655b5645", 0) == 1) {
            var_cdcedb142f61b43e = "hithealth";
        }
        eattacker game_utility::clearSpawnProtection();
        bulletdamage = utility::isbulletdamage(smeansofdeath);
        var_b98146816886d3c4 = utility::ter_op(bulletdamage && weapon::isprimaryweapon(objweapon), "standardspread", "standard");
        if (istrue(level.var_3ff7c73209fcf59d)) {
            if (bulletdamage && istrue(victim.var_38841d8e75a06ab3) || isexplosivedamagemod(smeansofdeath) && istrue(victim.var_ce34e72182b33556)) {
                var_cdcedb142f61b43e = "hitskydiveprotection";
            }
        }
        armorbreak = 0;
        if (var_cdcedb142f61b43e == "hitarmorlightbreak" || var_cdcedb142f61b43e == "hitarmormaxplatebreak" || var_cdcedb142f61b43e == "hitarmortemperedbreak") {
            armorbreak = 1;
            if (var_a2ffd9894fd368c5) {
                var_b98146816886d3c4 = "temperedarmorbreak";
                if (istrue(var_b44e627d6a911f55) && !istrue(var_135003274a4cc703)) {
                    var_b98146816886d3c4 = utility::ter_op(var_b98146816886d3c4 == "standardspread", "standardspreadarmorbreak", "standardarmorbreak");
                }
            } else if (var_dc726e8cc0b003a3) {
                var_b98146816886d3c4 = "threeplatearmorbreak";
                if (istrue(var_b44e627d6a911f55) && !istrue(var_135003274a4cc703)) {
                    var_b98146816886d3c4 = utility::ter_op(var_b98146816886d3c4 == "standardspread", "standardspreadarmorbreak", "standardarmorbreak");
                }
            } else if (var_b98146816886d3c4 == "standardspread") {
                var_b98146816886d3c4 = "standardspreadarmorbreak";
            } else {
                var_b98146816886d3c4 = "standardarmorbreak";
            }
        } else if (var_cdcedb142f61b43e == "hitarmorlight" || var_cdcedb142f61b43e == "hitarmorlightmaxlevel" || var_cdcedb142f61b43e == "hitarmorlighttempered") {
            if (var_a2ffd9894fd368c5) {
                var_b98146816886d3c4 = "temperedarmor";
                if (istrue(var_b44e627d6a911f55) && !istrue(var_135003274a4cc703)) {
                    var_b98146816886d3c4 = utility::ter_op(var_b98146816886d3c4 == "standardspread", "standardspreadarmor", "standardarmor");
                }
            } else if (var_dc726e8cc0b003a3) {
                var_b98146816886d3c4 = "threeplatearmor";
                if (istrue(var_b44e627d6a911f55) && !istrue(var_135003274a4cc703)) {
                    var_b98146816886d3c4 = utility::ter_op(var_b98146816886d3c4 == "standardspread", "standardspreadarmor", "standardarmor");
                }
            } else if (var_b98146816886d3c4 == "standardspread") {
                var_b98146816886d3c4 = "standardspreadarmor";
            } else {
                var_b98146816886d3c4 = "standardarmor";
            }
        } else if (var_cdcedb142f61b43e == "hitblastshield" && victim perk::_hasperk("specialty_flak_jacket")) {
            var_b98146816886d3c4 = "hitflakjacket";
        }
        headshot = !isspreadweapon(objweapon) && namespace_25ead30c6ed027fb::isheadshot(shitloc, smeansofdeath, eattacker);
        if (weapon::function_160a992c78bdf589(objweapon) && namespace_25ead30c6ed027fb::function_b656251147d7d40b(partname)) {
            headshot = 1;
        }
        if (eattacker perk::_hasperk("specialty_headhunter") && headshot) {
            var_cdcedb142f61b43e = "hitheadhunter";
        }
        var_14b8f2eeba6a3e78 = 1;
        var_62cf84636d4cef2c = smeansofdeath == "MOD_MELEE";
        victimentnum = "" + victim getentitynumber();
        if (var_4ffe32f42d51a763 && isdefined(victim.body)) {
            var_249fca7089cd498f = victim.body getentitynumber();
        } else {
            var_249fca7089cd498f = victim getentitynumber();
        }
        var_65cb04ee667315bc = 0;
        if (!armorbreak && isspreadweapon(objweapon) && isdefined(var_91ebb035a259e76a.pelletweaponvictimids)) {
            foreach (var_4663bfaed1a30ec9 in var_91ebb035a259e76a.pelletweaponvictimids) {
                if (isdefined(var_4663bfaed1a30ec9[victimentnum]) && var_4663bfaed1a30ec9[victimentnum].pelletdmgpassed.size > 1) {
                    var_65cb04ee667315bc = 1;
                }
            }
        }
        if (!weapon::iskillstreakweapon(objweapon) && isplayer(var_91ebb035a259e76a)) {
            if (isspreadweapon(objweapon)) {
                goto LOC_000009d4;
            }
            if (bulletdamage || function_102d677621400199(objweapon)) {
                var_91ebb035a259e76a namespace_3c5a4254f2b957ea::initpersstat("shotsBulletHit");
                var_5f7f853e0aeb4d24 = 0;
                if (1) {
                    goto LOC_00000a98;
                }
                if (function_102d677621400199(objweapon) || isspreadweapon(objweapon)) {
                    var_5c3f9357f11d2223 = objweapon.basename;
                    if (!isdefined(var_5c3f9357f11d2223)) {
                        var_5f7f853e0aeb4d24 = 1;
                    } else {
                        if (!isdefined(var_91ebb035a259e76a.lasthittime[objweapon.basename])) {
                            var_91ebb035a259e76a.lasthittime[objweapon.basename] = 0;
                        }
                        if (var_91ebb035a259e76a.lasthittime[objweapon.basename] == gettime()) {
                            var_5f7f853e0aeb4d24 = 1;
                        } else {
                            var_91ebb035a259e76a.lasthittime[objweapon.basename] = gettime();
                        LOC_00000a98:
                        }
                    LOC_00000a98:
                    }
                LOC_00000a98:
                }
            LOC_00000a98:
                if (!var_5f7f853e0aeb4d24) {
                    var_91ebb035a259e76a namespace_3c5a4254f2b957ea::incpersstat("shotsBulletHit", 1);
                    var_91ebb035a259e76a thread namespace_6b49ddb858f34366::function_298b6dd0b26f13bd();
                    var_91ebb035a259e76a thread namespace_6b49ddb858f34366::function_2efd6926efd58b49(1);
                }
            }
        }
        if (!var_62cf84636d4cef2c && var_65cb04ee667315bc) {
            if (var_4ffe32f42d51a763 || armorbreak) {
                var_62cf84636d4cef2c = 1;
            } else {
                var_14b8f2eeba6a3e78 = 0;
            }
        }
        if (var_14b8f2eeba6a3e78) {
            var_203066c6662e1f2d = undefined;
            if (getdvarint(@"hash_2909726ff0e12a7d", 0) == 1 && isdefined(level.var_1a2b600a06ec21f4) && istrue(level.var_1a2b600a06ec21f4.var_e76a5e57e1ff6b9b)) {
                var_203066c6662e1f2d = spawnstruct();
                if (isplayer(victim) || isagent(victim)) {
                    var_203066c6662e1f2d.var_bce5d209227a00cb = player::isinlaststand(victim);
                    var_203066c6662e1f2d.isfriendly = isfriendlyfire(victim, var_91ebb035a259e76a);
                    if (bulletdamage && weapon::isprimaryweapon(objweapon)) {
                        var_b98146816886d3c4 = 1;
                    } else {
                        var_b98146816886d3c4 = 2;
                    }
                }
            }
            var_f7ea2887b1e3535b = armor::function_77b7145c92102847(victim armor::function_ac266fc218266d08() + var_1da1a66b5c6a06a7);
            var_91ebb035a259e76a damagefeedback::updatedamagefeedback(var_cdcedb142f61b43e, var_4ffe32f42d51a763, headshot, var_b98146816886d3c4, var_62cf84636d4cef2c, undefined, var_249fca7089cd498f, var_f7ea2887b1e3535b, var_203066c6662e1f2d);
        }
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb129
// Size: 0x41
function function_18525950b3caba30(idamage, eattacker, smeansofdeath, vpoint, var_1da1a66b5c6a06a7, objweapon) {
    namespace_646e434ccdd09379::damageeffects(idamage, eattacker, smeansofdeath, vpoint, var_1da1a66b5c6a06a7, objweapon);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb171
// Size: 0x22f
function lethalequipmentdamagemod(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon) {
    data = namespace_25ead30c6ed027fb::packdamagedata(eattacker, victim, idamage, objweapon, smeansofdeath, einflictor, undefined, undefined, undefined, undefined, undefined, idflags);
    if (isdefined(einflictor) && isdefined(einflictor.damagedby)) {
        eattacker = einflictor.damagedby;
    }
    if (victim namespace_25ead30c6ed027fb::isstuckdamagekill(data)) {
        if (victim killstreak::isjuggernaut()) {
            idamage = min(300, idamage);
        } else if (isdefined(victim.var_8790c077c95db752)) {
            idamage = victim.maxhealth + victim.var_8790c077c95db752;
        } else {
            idamage = victim.maxhealth;
        }
    }
    if (isdefined(smeansofdeath) && smeansofdeath != "MOD_IMPACT") {
        if (isdefined(eattacker) && victim != eattacker && isdefined(einflictor) && isdefined(einflictor.classname) && einflictor.classname == "grenade" && victim.lastspawntime + 3500 > gettime() && isdefined(victim.lastspawnpoint) && distance(einflictor.origin, victim.lastspawnpoint.origin) < 500) {
            idamage = 0;
        }
    }
    if (isdefined(eattacker) && isplayer(eattacker)) {
        loggrenadedata(einflictor, eattacker, victim, idamage, smeansofdeath, objweapon);
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.weaponname = weapon::getweaponrootname(objweapon);
        var_7e2c53b0bcf117d9.fullweaponname = getcompleteweaponname(objweapon);
        var_7e2c53b0bcf117d9.statname = "damage";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = min(victim.health, idamage);
        var_7e2c53b0bcf117d9.variantid = -1;
        var_7e2c53b0bcf117d9.weaponobj = objweapon;
        eattacker namespace_c45ac99c4997e722::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    }
    return idamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3a8
// Size: 0x208
function playerkilled_initdeathdata(inflictor, attacker, victim, damage, damageflags, meansofdeath, objweapon, direction_vec, hitloc, psoffsettime, deathanimduration, isfauxdeath) {
    var_642470e1abc1bbf9 = namespace_25ead30c6ed027fb::packdamagedata(attacker, victim, damage, objweapon, meansofdeath, inflictor, undefined, direction_vec, undefined, undefined, undefined, undefined, damageflags);
    var_642470e1abc1bbf9.hitloc = hitloc;
    var_642470e1abc1bbf9.psoffsettime = psoffsettime;
    var_642470e1abc1bbf9.deathanimduration = deathanimduration;
    var_642470e1abc1bbf9.isfauxdeath = isfauxdeath;
    if (meansofdeath == "MOD_EXECUTION") {
        var_642470e1abc1bbf9.executionref = execution::execution_getrefbyplayer(attacker);
    }
    var_642470e1abc1bbf9.dokillcam = 0;
    var_642470e1abc1bbf9.dofinalkillcam = 1;
    var_642470e1abc1bbf9.killcamentity = undefined;
    var_642470e1abc1bbf9.killcamentityindex = -1;
    var_642470e1abc1bbf9.killcamentitystarttime = 0;
    var_642470e1abc1bbf9.inflictoragentinfo = undefined;
    var_642470e1abc1bbf9.killcamentstickstovictim = undefined;
    var_642470e1abc1bbf9.isfriendlyfire = undefined;
    var_642470e1abc1bbf9.primaryweapon = undefined;
    var_642470e1abc1bbf9.lifeid = undefined;
    var_642470e1abc1bbf9.attackerentnum = undefined;
    var_642470e1abc1bbf9.iskillstreakweapon = undefined;
    var_642470e1abc1bbf9.var_bfcdebee0e8a3189 = undefined;
    var_642470e1abc1bbf9.weaponfullstring = undefined;
    var_642470e1abc1bbf9.isnukekill = 0;
    var_642470e1abc1bbf9.deathscenetimesec = getdvarfloat(@"hash_ac849f1ec300d19c", 1.75);
    var_642470e1abc1bbf9.deathscenetimems = int(var_642470e1abc1bbf9.deathscenetimesec * 1000);
    var_642470e1abc1bbf9.deathtime = gettime();
    var_642470e1abc1bbf9.brvictiminlaststand = undefined;
    var_642470e1abc1bbf9.var_f83c15acb64c91b7 = isdefined(victim) && istrue(victim.var_f83c15acb64c91b7);
    return var_642470e1abc1bbf9;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5b8
// Size: 0x238
function playerkilled_parameterfixup(var_642470e1abc1bbf9) {
    /#
        assert(var_642470e1abc1bbf9.victim.sessionteam != "spectator");
    #/
    if (isdefined(var_642470e1abc1bbf9.inflictor) && istrue(var_642470e1abc1bbf9.inflictor.var_26fb072855fd4772)) {
        var_642470e1abc1bbf9.meansofdeath = "MOD_CRUSH";
        var_642470e1abc1bbf9.attacker = var_642470e1abc1bbf9.inflictor;
        var_642470e1abc1bbf9.attacker.team = game_utility::getotherteam(var_642470e1abc1bbf9.victim.team)[0];
    }
    if (var_642470e1abc1bbf9.victim == var_642470e1abc1bbf9.attacker && var_642470e1abc1bbf9.meansofdeath == "MOD_CRUSH") {
        var_642470e1abc1bbf9.meansofdeath = "MOD_SUICIDE";
    }
    if (var_642470e1abc1bbf9.objweapon.basename == "none") {
        if (isdefined(var_642470e1abc1bbf9.inflictor) && isdefined(var_642470e1abc1bbf9.inflictor.baseweapon)) {
            var_642470e1abc1bbf9.objweapon.basename = var_642470e1abc1bbf9.inflictor.baseweapon;
        }
    }
    var_642470e1abc1bbf9.victim playerkilled_fixupattacker(var_642470e1abc1bbf9);
    if (namespace_25ead30c6ed027fb::isheadshot(var_642470e1abc1bbf9.hitloc, var_642470e1abc1bbf9.meansofdeath, var_642470e1abc1bbf9.attacker)) {
        var_642470e1abc1bbf9.meansofdeath = "MOD_HEAD_SHOT";
    }
    if (var_642470e1abc1bbf9.isfauxdeath) {
        var_642470e1abc1bbf9.dokillcam = 0;
        var_642470e1abc1bbf9.deathanimduration = var_642470e1abc1bbf9.victim playerforcedeathanim(var_642470e1abc1bbf9.inflictor, var_642470e1abc1bbf9.meansofdeath, var_642470e1abc1bbf9.objweapon, var_642470e1abc1bbf9.hitloc, var_642470e1abc1bbf9.direction_vec);
    }
    /#
        function_af3ebb9d1ecd18e7(var_642470e1abc1bbf9);
    #/
    /#
        function_18c42af5777dcd9f(var_642470e1abc1bbf9);
    #/
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7f7
// Size: 0xb88
function playerkilled_fixupattacker(var_642470e1abc1bbf9) {
    var_642470e1abc1bbf9.attacker = _validateattacker(var_642470e1abc1bbf9.attacker);
    if (isdefined(var_642470e1abc1bbf9.inflictor) && istrue(var_642470e1abc1bbf9.inflictor.var_26fb072855fd4772)) {
        if (isdefined(level.var_b6e3760a75368efc)) {
            var_642470e1abc1bbf9.attacker = [[ level.var_b6e3760a75368efc ]](var_642470e1abc1bbf9.inflictor, var_642470e1abc1bbf9.victim);
        }
    }
    assistedsuicide = 0;
    if (!isdefined(var_642470e1abc1bbf9.attacker)) {
        assistedsuicide = 1;
    } else if (isdefined(var_642470e1abc1bbf9.attacker.classname) && (var_642470e1abc1bbf9.attacker.classname == "trigger_hurt" || var_642470e1abc1bbf9.attacker.classname == "worldspawn")) {
        assistedsuicide = 1;
    } else if (var_642470e1abc1bbf9.attacker == var_642470e1abc1bbf9.victim) {
        assistedsuicide = 1;
        if (var_642470e1abc1bbf9.meansofdeath == "MOD_SUICIDE") {
            logattacker(var_642470e1abc1bbf9.victim, var_642470e1abc1bbf9.attacker, var_642470e1abc1bbf9.inflictor, var_642470e1abc1bbf9.objweapon, var_642470e1abc1bbf9.damage, undefined, undefined, var_642470e1abc1bbf9.hitloc, var_642470e1abc1bbf9.psoffsettime, var_642470e1abc1bbf9.meansofdeath, 0);
        }
    }
    if (assistedsuicide) {
        bestplayer = undefined;
        if (isdefined(var_642470e1abc1bbf9.victim.attackers) && self.attackers.size > 0) {
            foreach (player in var_642470e1abc1bbf9.victim.attackers) {
                if (!isdefined(player)) {
                    continue;
                }
                if (!isdefined(var_642470e1abc1bbf9.victim)) {
                    continue;
                }
                if (!isdefined(_validateattacker(player))) {
                    continue;
                }
                if (!isdefined(player.guid)) {
                    continue;
                }
                if (!isdefined(var_642470e1abc1bbf9.victim.attackerdata)) {
                    continue;
                }
                if (!isdefined(var_642470e1abc1bbf9.victim.attackerdata[player.guid])) {
                    continue;
                }
                if (!isdefined(var_642470e1abc1bbf9.victim.attackerdata[player.guid].damage)) {
                    continue;
                }
                if (player == var_642470e1abc1bbf9.victim || level.teambased && player.team == var_642470e1abc1bbf9.victim.team) {
                    continue;
                }
                if (var_642470e1abc1bbf9.victim.attackerdata[player.guid].damage > 1 && !isdefined(bestplayer)) {
                    bestplayer = player;
                } else if (isdefined(bestplayer) && var_642470e1abc1bbf9.victim.attackerdata[player.guid].damage > var_642470e1abc1bbf9.victim.attackerdata[bestplayer.guid].damage) {
                    bestplayer = player;
                }
            }
        }
        if (!isdefined(bestplayer)) {
            if (isdefined(var_642470e1abc1bbf9.victim.debuffedbyplayers) && var_642470e1abc1bbf9.victim.debuffedbyplayers.size > 0) {
                var_f6f171fa9c145f8 = [0:"chargemode_mp", 1:"cryo_mine_mp", 2:"concussion_grenade_mp", 3:"super_trophy_mp", 4:"blackout_grenade_mp", 5:"power_spider_grenade_mp", 6:"emp_grenade_mp"];
                foreach (var_65928e4c6195a5b in var_f6f171fa9c145f8) {
                    var_a676df5d3d80a259 = gamescore::getdebuffattackersbyweapon(var_642470e1abc1bbf9.victim, var_65928e4c6195a5b);
                    if (var_a676df5d3d80a259.size > 0) {
                        for (i = var_a676df5d3d80a259.size - 1; i >= 0; i--) {
                            var_e0573162d646b530 = var_a676df5d3d80a259[i];
                            if (!isdefined(_validateattacker(var_e0573162d646b530))) {
                                continue;
                            }
                            if (!istrue(namespace_e47104b48662385b::playersareenemies(var_e0573162d646b530, var_642470e1abc1bbf9.victim))) {
                                continue;
                            }
                            bestplayer = var_e0573162d646b530;
                            if (!isdefined(var_642470e1abc1bbf9.victim.attackerdata) || !isdefined(var_642470e1abc1bbf9.victim.attackerdata[bestplayer.guid])) {
                                addattacker(var_642470e1abc1bbf9.victim, bestplayer, undefined, makeweapon(var_65928e4c6195a5b), 0, undefined, undefined, undefined, undefined, "MOD_EXPLOSIVE");
                            }
                            break;
                        }
                    }
                    if (isdefined(bestplayer)) {
                        break;
                    }
                }
            }
        }
        if (isdefined(bestplayer)) {
            var_642470e1abc1bbf9.attacker = bestplayer;
            var_642470e1abc1bbf9.attacker.assistedsuicide = 1;
            var_642470e1abc1bbf9.objweapon = var_642470e1abc1bbf9.victim.attackerdata[bestplayer.guid].objweapon;
            var_642470e1abc1bbf9.direction_vec = var_642470e1abc1bbf9.victim.attackerdata[bestplayer.guid].vdir;
            var_642470e1abc1bbf9.hitloc = var_642470e1abc1bbf9.victim.attackerdata[bestplayer.guid].shitloc;
            var_642470e1abc1bbf9.psoffsettime = var_642470e1abc1bbf9.victim.attackerdata[bestplayer.guid].psoffsettime;
            var_642470e1abc1bbf9.meansofdeath = var_642470e1abc1bbf9.victim.attackerdata[bestplayer.guid].smeansofdeath;
            var_642470e1abc1bbf9.damage = var_642470e1abc1bbf9.victim.attackerdata[bestplayer.guid].damage;
            if (istrue(var_642470e1abc1bbf9.victim.squadwiped) && isdefined(var_642470e1abc1bbf9.victim.attackerdata[bestplayer.guid].inflictor)) {
                var_642470e1abc1bbf9.inflictor = var_642470e1abc1bbf9.victim.attackerdata[bestplayer.guid].inflictor;
            }
            var_642470e1abc1bbf9.assistedsuicide = 1;
        } else if (!isdefined(var_642470e1abc1bbf9.attacker.team) || var_642470e1abc1bbf9.attacker.team == "neutral") {
            var_642470e1abc1bbf9.attacker = var_642470e1abc1bbf9.victim;
        }
    }
    if (isdefined(var_642470e1abc1bbf9.attacker) && isdefined(var_642470e1abc1bbf9.attacker.code_classname)) {
        if (var_642470e1abc1bbf9.attacker.code_classname == "script_vehicle" && isdefined(var_642470e1abc1bbf9.attacker.owner)) {
            var_642470e1abc1bbf9.attacker = var_642470e1abc1bbf9.attacker.owner;
        }
        if (var_642470e1abc1bbf9.attacker.code_classname == "misc_turret" && isdefined(var_642470e1abc1bbf9.attacker.owner)) {
            if (isdefined(var_642470e1abc1bbf9.attacker.vehicle)) {
                var_642470e1abc1bbf9.attacker.vehicle notify("killedPlayer", var_642470e1abc1bbf9.victim);
            }
            var_642470e1abc1bbf9.attacker = var_642470e1abc1bbf9.attacker.owner;
        }
        if (isagent(var_642470e1abc1bbf9.attacker)) {
            if (isdefined(var_642470e1abc1bbf9.attacker.owner)) {
                var_642470e1abc1bbf9.attacker = var_642470e1abc1bbf9.attacker.owner;
            }
        }
        if (var_642470e1abc1bbf9.attacker.code_classname == "script_model" && isdefined(var_642470e1abc1bbf9.attacker.owner)) {
            var_642470e1abc1bbf9.attacker = var_642470e1abc1bbf9.attacker.owner;
            if (!isfriendlyfire(var_642470e1abc1bbf9.victim, var_642470e1abc1bbf9.attacker) && var_642470e1abc1bbf9.attacker != var_642470e1abc1bbf9.victim) {
                var_642470e1abc1bbf9.attacker notify("crushed_enemy");
            }
        }
    }
    if (isdefined(var_642470e1abc1bbf9.inflictor) && !isplayer(var_642470e1abc1bbf9.inflictor)) {
        if (!isdefined(var_642470e1abc1bbf9.attacker)) {
            if (isdefined(var_642470e1abc1bbf9.inflictor.owner)) {
                var_642470e1abc1bbf9.attacker = var_642470e1abc1bbf9.inflictor.owner;
            }
        } else if (!isplayer(var_642470e1abc1bbf9.attacker)) {
            if (isdefined(var_642470e1abc1bbf9.inflictor.owner)) {
                var_642470e1abc1bbf9.attacker = var_642470e1abc1bbf9.inflictor.owner;
            }
        }
    }
    if (isdefined(var_642470e1abc1bbf9.attacker) && var_642470e1abc1bbf9.attacker != var_642470e1abc1bbf9.victim) {
        if (isdefined(var_642470e1abc1bbf9.inflictor) && var_642470e1abc1bbf9.inflictor == var_642470e1abc1bbf9.victim) {
            var_642470e1abc1bbf9.inflictor = var_642470e1abc1bbf9.attacker;
        }
    }
    if (isdefined(var_642470e1abc1bbf9.inflictor) && isdefined(var_642470e1abc1bbf9.inflictor.var_9328ded553f15d2b) && !istrue(namespace_e47104b48662385b::playersareenemies(var_642470e1abc1bbf9.victim, var_642470e1abc1bbf9.inflictor.var_9328ded553f15d2b))) {
        var_642470e1abc1bbf9.attacker = self;
    }
    var_642470e1abc1bbf9.attacker.assistedsuicide = 0;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc386
// Size: 0x2a6
function playerkilled_precalc(var_642470e1abc1bbf9) {
    attacker = var_642470e1abc1bbf9.attacker;
    victim = var_642470e1abc1bbf9.victim;
    inflictor = var_642470e1abc1bbf9.inflictor;
    objweapon = var_642470e1abc1bbf9.objweapon;
    victim.perkoutlined = 0;
    victim.deathspectatepos = undefined;
    victim.deathtime = var_642470e1abc1bbf9.deathtime;
    victim.attacker = attacker;
    victim.lastdeathpos = victim.origin;
    victim.lastdeathangles = victim getplayerangles();
    if (!isbot(victim)) {
        victim thread namespace_4925be476a433a59::function_221ea9f08eaf2346();
    }
    if (isdefined(inflictor) && !isplayer(inflictor) && isdefined(inflictor.primaryweapon)) {
        var_642470e1abc1bbf9.primaryweapon = inflictor.primaryweapon;
    } else if (isdefined(attacker) && isplayer(attacker) && !isnullweapon(attacker getcurrentprimaryweapon())) {
        var_642470e1abc1bbf9.primaryweapon = getcompleteweaponname(attacker getcurrentprimaryweapon());
    } else if (objweapon.isalternate) {
        var_642470e1abc1bbf9.primaryweapon = objweapon.basename;
    } else {
        var_642470e1abc1bbf9.primaryweapon = undefined;
    }
    var_642470e1abc1bbf9.lifeid = victim.matchdatalifeindex;
    if (!isdefined(var_642470e1abc1bbf9.lifeid)) {
        var_642470e1abc1bbf9.lifeid = level.maxlives - 1;
    }
    if (game_utility::isgameparticipant(attacker)) {
        var_642470e1abc1bbf9.attackerentnum = attacker getentitynumber();
    } else {
        var_642470e1abc1bbf9.attackerentnum = -1;
    }
    var_642470e1abc1bbf9.iskillstreakweapon = weapon::iskillstreakweapon(objweapon.basename);
    var_642470e1abc1bbf9.weaponfullstring = getcompleteweaponname(objweapon);
    var_642470e1abc1bbf9.var_bfcdebee0e8a3189 = isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "bomb_site_mp";
    var_642470e1abc1bbf9.isfriendlyfire = isfriendlyfire(victim, attacker);
    var_642470e1abc1bbf9.isnukekill = objweapon.basename == "nuke_mp";
    var_642470e1abc1bbf9.brvictiminlaststand = player::isinlaststand(victim);
    /#
        function_f9249bb06eb48092(var_642470e1abc1bbf9);
    #/
    /#
        function_af3ebb9d1ecd18e7(var_642470e1abc1bbf9);
    #/
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc633
// Size: 0xe15
function playerkilled_sharedlogic_early(var_642470e1abc1bbf9) {
    attacker = var_642470e1abc1bbf9.attacker;
    victim = var_642470e1abc1bbf9.victim;
    inflictor = var_642470e1abc1bbf9.inflictor;
    objweapon = var_642470e1abc1bbf9.objweapon;
    damage = var_642470e1abc1bbf9.damage;
    meansofdeath = var_642470e1abc1bbf9.meansofdeath;
    isfauxdeath = var_642470e1abc1bbf9.isfauxdeath;
    hitloc = var_642470e1abc1bbf9.hitloc;
    direction_vec = var_642470e1abc1bbf9.direction_vec;
    victim notify("killed_player");
    outline::outlinedisableinternalall(victim);
    victim showuidamageflash();
    victim setblurforplayer(0, 0);
    victim namespace_df478cc572a311d3::molotov_clear_fx();
    victim namespace_3bbb5a98b932c46f::function_6b4a68dbdae21499();
    if (!game_utility::runleanthreadmode()) {
        print::printgameaction("death", victim);
    }
    victim launchshield(damage, meansofdeath);
    victim riotshield::riotshield_clear();
    if (isdefined(attacker.petwatch) && attacker != victim) {
        attacker namespace_883b0db1d686c37e::addkillcharge();
        if (meansofdeath == "MOD_EXECUTION") {
            attacker namespace_883b0db1d686c37e::addexecutioncharge();
        } else if (victim playerkilled_washitbyvehicle(meansofdeath, inflictor)) {
            attacker namespace_883b0db1d686c37e::addvehicularmanslaughtercharge();
        }
    }
    if (meansofdeath == "MOD_EXECUTION") {
        attacker stats::incpersstat("executionKills", 1);
        level thread namespace_20260f65229aa888::trysaylocalsound(attacker, #"hash_197b54b4d0e467b7", undefined, 1);
    }
    if (victim namespace_3e725f3cc58bddd3::playerkilled_washitbyvehicle(meansofdeath, inflictor)) {
        inflictor notify("vehicle_killed_player");
    }
    var_647f0cec5589b0ca = victim getcurrentweapon();
    if (!victim weapon::iskillstreakweapon(var_647f0cec5589b0ca)) {
        weapons::savetogglescopestates();
        weapons::savealtstates();
    }
    victim nvg::savenvgstate();
    inventory::handleweaponchangecallbacksondeath();
    if (!isfauxdeath) {
        if (vehicle_occupancy::vehicle_occupancy_occupantisvehicledriver(victim)) {
            if (isdefined(victim.vehicle)) {
                victim.vehicle notify("player_killed_no_faux_death");
            }
        }
    } else {
        victim.fauxdead = 1;
        victim sethidenameplate(1);
        self notify("death");
        self notify("death_or_disconnect");
    }
    perks::updateactiveperks(inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc, direction_vec);
    supers::updateactivesupers(inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc, direction_vec);
    namespace_c65b32cc99e6bc3c::wristrocketcooksuicideexplodecheck(inflictor, attacker, victim, meansofdeath, objweapon);
    if (meansofdeath != "MOD_HEAD_SHOT" && !var_642470e1abc1bbf9.isnukekill) {
        if (isdefined(level.custom_death_sound)) {
            [[ level.custom_death_sound ]](victim, meansofdeath, inflictor);
        } else if (meansofdeath != "MOD_MELEE") {
            victim sound::playdeathsound(meansofdeath);
        }
    }
    if (isdefined(level.custom_death_effect)) {
        [[ level.custom_death_effect ]](victim, meansofdeath, inflictor);
    }
    if (meansofdeath != "MOD_SUICIDE" && (game_utility::isaigameparticipant(victim) || game_utility::isaigameparticipant(attacker)) && isdefined(level.bot_funcs) && isdefined(level.bot_funcs["get_attacker_ent"])) {
        var_e2b86dd732390777 = [[ level.bot_funcs["get_attacker_ent"] ]](attacker, inflictor);
        if (isdefined(var_e2b86dd732390777)) {
            if (game_utility::isaigameparticipant(victim) && !isagent(victim)) {
                /#
                    assert(!isdefined(var_e2b86dd732390777.classname) || var_e2b86dd732390777.classname != "worldspawn" && var_e2b86dd732390777.classname != "trigger_hurt");
                #/
                victim botmemoryevent("death", var_642470e1abc1bbf9.weaponfullstring, var_e2b86dd732390777.origin, victim.origin, var_e2b86dd732390777);
            }
            if (game_utility::isaigameparticipant(attacker) && !isagent(attacker)) {
                var_6b82b9183bb9b5df = 1;
                if (isdefined(var_e2b86dd732390777.classname) && (var_e2b86dd732390777.classname == "script_vehicle" && isdefined(var_e2b86dd732390777.helitype) || var_e2b86dd732390777.classname == "rocket" || var_e2b86dd732390777.classname == "misc_turret")) {
                    var_6b82b9183bb9b5df = 0;
                }
                if (var_6b82b9183bb9b5df) {
                    attacker botmemoryevent("kill", var_642470e1abc1bbf9.weaponfullstring, var_e2b86dd732390777.origin, victim.origin, victim);
                }
            }
        }
    }
    if ((game_utility::isteamreviveenabled() || game_utility::isBRStyleGameType() || victim perk::_hasperk("specialty_survivor")) && flags::gameflag("prematch_done") && !istrue(victim.hvtnorevive) && istrue(victim.inlaststand)) {
        laststand::ondeath(var_642470e1abc1bbf9);
    }
    laststand::function_d393166ea9eab059(var_642470e1abc1bbf9);
    if (game_utility::isteamreviveenabled() && flags::gameflag("prematch_done") && !istrue(victim.switching_teams)) {
        if (meansofdeath == "MOD_FALLING" && victim teamRevive::isvalidrevivetriggerspawnposition()) {
            victim teamRevive::setvalidreviveposition();
        }
        var_85a40249b07be68e = istrue(self.isjuggernaut) && isdefined(self.juggcontext);
        if (isdefined(level.var_a12ec32a24e1a367)) {
            [[ level.var_a12ec32a24e1a367 ]](victim);
        }
        if (!var_85a40249b07be68e) {
            respawnitems = victim class::respawnitems_saveplayeritemstostruct();
        } else {
            respawnitems = self.juggcontext;
        }
        victim class::respawnitems_assignrespawnitems(respawnitems);
    }
    if (utility::issharedfuncdefined("game", "isBRStyleGameType")) {
        if ([[ utility::getsharedfunc("game", "isBRStyleGameType") ]]()) {
            victim challenges::stopchallengetimer("alive_in_gas");
            victim challenges::stopchallengetimer("alive_not_downed");
            if (istrue(level.br_prematchstarted) && !namespace_a548bd428a566cf3::isplayeringulag()) {
                namespace_9cb8bb5897c3d5b2::branalytics_inventory_snapshot(self, "player_death");
            }
        }
    }
    var_87f4e7d1a685aec1 = victim killstreak::iscontrollingproxyagent() ? victim.playerproxyagent : victim;
    if (attacker perk::_hasperk("specialty_scavenger")) {
        var_87f4e7d1a685aec1 thread weapons::dropscavengerfordeath(attacker, var_642470e1abc1bbf9.meansofdeath);
    }
    if (getdvarint(@"hash_5afa341109e3a9f4", 0)) {
        var_87f4e7d1a685aec1 thread weapons::function_7e895e1c85354e17(attacker, var_642470e1abc1bbf9.meansofdeath);
    }
    var_87f4e7d1a685aec1 [[ level.weapondropfunction ]](attacker, meansofdeath, undefined, damage);
    if (!isfauxdeath) {
        if (isplayer(attacker)) {
            victim setclientomnvar("ui_killcam_killedby_id", attacker getentitynumber());
            victim setclientomnvar("ui_killcam_killedby_health_ratio", int(clamp(var_642470e1abc1bbf9.attacker.health / var_642470e1abc1bbf9.attacker.maxhealth * 127, 0, 127)));
        } else if (attacker.classname == "trigger_hurt" || attacker.classname == "worldspawn") {
            victim setclientomnvar("ui_killcam_killedby_id", victim getentitynumber());
        } else {
            victim setclientomnvar("ui_killcam_killedby_id", -1);
        }
        newstate = "dead";
        if (istrue(self.liveRagdoll)) {
            newstate = "playing_but_spectating";
        } else if (istrue(level.var_b7ad06255200033c)) {
            newstate = "spectator";
        }
        victim player::updatesessionstate(newstate);
    }
    var_63c3344d9c1f9816 = istrue(victim.fauxdead) && istrue(victim.switching_teams);
    if (!var_63c3344d9c1f9816) {
        if (!isdefined(level.modemayconsiderplayerdead) || [[ level.modemayconsiderplayerdead ]](victim)) {
            victim namespace_66c176d3c67cc0c2::removefromalivecount(undefined, "playerKilled");
        }
    }
    if (!isdefined(victim.switching_teams)) {
        if (!istrue(level.ignorescoring) && !var_642470e1abc1bbf9.isfriendlyfire) {
            if (!namespace_36f464722d326bbe::function_d04af493b6e718ac()) {
                victim namespace_26e1361ab951ec6b::addtoplayerstat(1, "combatStats", "deaths");
            }
            if (victim namespace_3c5a4254f2b957ea::getpersstat("deaths") < 999) {
                victim stats::incpersstat("deaths", 1);
                victim.deaths = victim stats::getpersstat("deaths");
                victim persistence::statsetchild("round", "deaths", victim.deaths, level.ignorekdrstats);
            }
        }
    }
    var_4115733aaa384eea = meansofdeath;
    if (isdefined(var_642470e1abc1bbf9.idflags) && var_642470e1abc1bbf9.idflags & 8 && !(var_642470e1abc1bbf9.idflags & 16384)) {
        if (isdefined(attacker.bulletkillsinaframecount) && attacker.bulletkillsinaframecount == 0) {
            var_4115733aaa384eea = "MOD_PENETRATION";
            if (isplayer(attacker)) {
                attacker thread points::givexpwithtext(#"hash_86e6ab76a75129c7");
            }
        }
    } else if (objweapon.basename == "semtex_xmike109_mp" && var_642470e1abc1bbf9.hitloc == "head" || var_642470e1abc1bbf9.hitloc == "helmet") {
        var_4115733aaa384eea = "MOD_HEAD_SHOT";
    }
    if (isdefined(var_642470e1abc1bbf9.inflictor) && istrue(var_642470e1abc1bbf9.inflictor.iswztrain)) {
        var_4115733aaa384eea = "MOD_CRUSH";
    }
    if (game_utility::isBRStyleGameType()) {
        var_f86da5d91524e369 = [];
        if (isdefined(level.var_c5877dbe60fddbf6)) {
            var_f86da5d91524e369 = level.var_c5877dbe60fddbf6;
        }
        if (isdefined(victim)) {
            victimteam = teams::getfriendlyplayers(victim.team, 0);
            if (isdefined(victimteam)) {
                var_f86da5d91524e369 = utility::array_combine(var_f86da5d91524e369, victimteam);
            }
        }
        if (isdefined(attacker) && isplayer(attacker)) {
            attackerteam = teams::getfriendlyplayers(attacker.team, 0);
            if (isdefined(attackerteam) && victim.team != attacker.team) {
                var_f86da5d91524e369 = utility::array_combine(var_f86da5d91524e369, attackerteam);
            }
        }
        if (var_f86da5d91524e369.size > 0) {
            var_d7f5ef4a14230875 = utility::ter_op(vehicle::function_4687f4da72911323(var_642470e1abc1bbf9), "MOD_EXPLOSIVE", var_4115733aaa384eea);
            obituary(victim, attacker, objweapon, var_d7f5ef4a14230875, var_f86da5d91524e369);
        }
    } else {
        var_aae3f6afd894e63a = objweapon;
        if (isdefined(var_4115733aaa384eea) && var_4115733aaa384eea == "MOD_EXPLOSIVE" && (!isdefined(var_aae3f6afd894e63a) || isnullweapon(var_aae3f6afd894e63a))) {
            var_aae3f6afd894e63a = makeweapon("obit_explosive");
        }
        var_d7f5ef4a14230875 = utility::ter_op(vehicle::function_4687f4da72911323(var_642470e1abc1bbf9), "MOD_EXPLOSIVE", var_4115733aaa384eea);
        obituary(victim, attacker, var_aae3f6afd894e63a, var_d7f5ef4a14230875);
    }
    victim updatedeathdetails(victim.attackers, victim.attackerdata, attacker);
    victim.lastbounty = bounty::playergetbountypoints();
    victim bounty::playerresetbountypoints();
    victim bounty::playerresetbountystreak();
    victim thread supers::handledeath(attacker);
    victim namespace_20260f65229aa888::onplayerkilled(inflictor, attacker, damage, meansofdeath, objweapon, var_642470e1abc1bbf9.direction_vec, var_642470e1abc1bbf9.hitloc, var_642470e1abc1bbf9.psoffsettime, var_642470e1abc1bbf9.deathanimduration, var_642470e1abc1bbf9.lifeid);
    victim thread [[ level.onplayerkilledcommon ]](inflictor, attacker, damage, meansofdeath, objweapon, var_642470e1abc1bbf9.direction_vec, var_642470e1abc1bbf9.hitloc, var_642470e1abc1bbf9.psoffsettime, var_642470e1abc1bbf9.deathanimduration, var_642470e1abc1bbf9.lifeid, weapon::iskillstreakweapon(var_647f0cec5589b0ca));
    if (isai(victim) && isdefined(level.bot_funcs) && isdefined(level.bot_funcs["on_killed"])) {
        victim thread [[ level.bot_funcs["on_killed"] ]](inflictor, attacker, damage, meansofdeath, var_642470e1abc1bbf9.weaponfullstring, var_642470e1abc1bbf9.direction_vec, var_642470e1abc1bbf9.hitloc, var_642470e1abc1bbf9.psoffsettime, var_642470e1abc1bbf9.deathanimduration, var_642470e1abc1bbf9.lifeid);
    }
    var_d34b50843aa65c42 = (var_642470e1abc1bbf9.deathtime - victim.spawntime) / 1000;
    if (isdefined(victim namespace_3c5a4254f2b957ea::getpersstat("shortestLife"))) {
        if (victim namespace_3c5a4254f2b957ea::getpersstat("shortestLife") == 0 || var_d34b50843aa65c42 < victim namespace_3c5a4254f2b957ea::getpersstat("shortestLife")) {
            victim.pers["shortestLife"] = var_d34b50843aa65c42;
        }
    }
    if (isdefined(victim namespace_3c5a4254f2b957ea::getpersstat("shortestLife"))) {
        if (victim namespace_3c5a4254f2b957ea::getpersstat("longestLife") == 0 || var_d34b50843aa65c42 > namespace_3c5a4254f2b957ea::getpersstat("longestLife")) {
            victim.pers["longestLife"] = var_d34b50843aa65c42;
        }
    }
    /#
        function_f9249bb06eb48092(var_642470e1abc1bbf9);
    #/
    /#
        function_af3ebb9d1ecd18e7(var_642470e1abc1bbf9);
    #/
    if (game_utility::function_ba5574c7f287c587()) {
        var_16c2d930984f2fef = self isreloading();
        if (var_16c2d930984f2fef) {
            var_5814d27874b48e54 = spawnstruct();
            var_5814d27874b48e54.player = self;
            var_5814d27874b48e54.var_c739ba1eb6635b73 = getsystemtimeinmicroseconds();
            var_5814d27874b48e54.var_c198f7ca473378fb = "DEATH";
            namespace_c45ac99c4997e722::function_80820d6d364c1836("callback_on_reload_cancel", var_5814d27874b48e54);
        }
        if (isdefined(attacker) && isdefined(attacker.team)) {
            level notify("kill_player_" + attacker.team, attacker);
        }
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd44f
// Size: 0x3eb
function playerkilled_logkill(var_642470e1abc1bbf9) {
    attacker = var_642470e1abc1bbf9.attacker;
    victim = var_642470e1abc1bbf9.victim;
    inflictor = var_642470e1abc1bbf9.inflictor;
    objweapon = var_642470e1abc1bbf9.objweapon;
    weaponfullstring = var_642470e1abc1bbf9.weaponfullstring;
    meansofdeath = var_642470e1abc1bbf9.meansofdeath;
    lifeid = var_642470e1abc1bbf9.lifeid;
    victim utility::trycall(level.clientmatchdata_logplayerdeath, attacker);
    namespace_c45ac99c4997e722::function_80820d6d364c1836("callback_player_death", var_642470e1abc1bbf9);
    victim analyticslog::logevent_path();
    victim analyticslog::logevent_playerdeath(attacker, meansofdeath, weaponfullstring);
    attacker analyticslog::logevent_playerkill(victim, meansofdeath, weaponfullstring);
    if (isdefined(attacker) && isplayer(attacker)) {
    }
    if (isplayer(attacker) && attacker != self && (!level.teambased || level.teambased && self.team != attacker.team)) {
        var_d4b54dc4008c298c = victim.lastdroppableweaponobj;
        if (isdefined(var_d4b54dc4008c298c) && isdefined(inflictor)) {
            var_d4b54dc4008c298c = mapweapon(var_d4b54dc4008c298c, inflictor);
            var_b2b6cafcdb2218d2 = getcompleteweaponname(var_d4b54dc4008c298c);
            if (var_b2b6cafcdb2218d2.size > 0 && meansofdeath.size > 0) {
                thread namespace_d576b6dc7cef9c62::trackleaderboarddeathstats(attacker, victim, var_b2b6cafcdb2218d2, meansofdeath);
            }
        }
        if (weaponfullstring.size > 0 && meansofdeath.size > 0) {
            thread namespace_d576b6dc7cef9c62::trackattackerleaderboarddeathstats(attacker, victim, weaponfullstring, meansofdeath);
        }
    } else if (isagent(attacker) && attacker != self && (!level.teambased || level.teambased && self.team != attacker.team)) {
        var_d4b54dc4008c298c = victim.lastdroppableweaponobj;
        var_d4b54dc4008c298c = weapon::mapweapon(var_d4b54dc4008c298c, inflictor);
        var_b2b6cafcdb2218d2 = getcompleteweaponname(var_d4b54dc4008c298c);
        victim thread gamelogic::threadedsetweaponstatbyname(var_b2b6cafcdb2218d2, 1, "deaths", attacker);
    }
    if (isdefined(level.matchrecording_logeventmsg) && isdefined(inflictor) && isplayer(inflictor) && utility::isbulletdamage(meansofdeath)) {
        var_b450825c6bf90c22 = inflictor.origin - victim.origin;
        var_a25e56f3ab389dbc = vectornormalize((var_b450825c6bf90c22[0], var_b450825c6bf90c22[1], 0));
        playerdir = anglestoforward(victim.angles);
        var_71082de84d50d735 = vectornormalize((playerdir[0], playerdir[1], 0));
        var_eec27afb6560632a = clamp(var_71082de84d50d735[0] * var_a25e56f3ab389dbc[0] + var_71082de84d50d735[1] * var_a25e56f3ab389dbc[1], -1, 1);
        angle = acos(var_eec27afb6560632a);
        if (!isdefined(victim.sidekillcount)) {
            victim.sidekillcount = 0;
        }
        if (angle > 75) {
            victim.sidekillcount++;
        }
        engagementtime = 0;
        if (isdefined(victim.engagementstarttime)) {
            engagementtime = gettime() - victim.engagementstarttime;
        }
        if (!isdefined(victim.engagementtime)) {
            victim.engagementtime = 0;
            victim.engagementcount = 0;
        }
        victim.engagementtime = victim.engagementtime + engagementtime;
        victim.engagementcount++;
        victim.engagementstarttime = undefined;
    }
    updatecombatrecordkillstats(attacker, victim, meansofdeath, objweapon);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd841
// Size: 0x10a
function playerkilled_finddeathtype(var_642470e1abc1bbf9) {
    attacker = var_642470e1abc1bbf9.attacker;
    victim = var_642470e1abc1bbf9.victim;
    inflictor = var_642470e1abc1bbf9.inflictor;
    meansofdeath = var_642470e1abc1bbf9.meansofdeath;
    if (victim isswitchingteams()) {
        return "deathType_switchingTeams";
    } else if (!isplayer(attacker) || isplayer(attacker) && meansofdeath == "MOD_FALLING") {
        return "deathType_worldDeath";
    } else if (attacker == victim || !namespace_e47104b48662385b::playersareenemies(attacker, victim) && entity::isdronepackage(inflictor)) {
        return "deathType_suicide";
    } else if (var_642470e1abc1bbf9.isfriendlyfire && !var_642470e1abc1bbf9.isnukekill) {
        return "deathType_friendlyFire";
    } else if (istrue(victim.inlaststand)) {
        return "deathType_inLastStand";
    } else {
        return "deathType_normal";
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd952
// Size: 0x1e4
function playerkilled_handledeathtype(var_642470e1abc1bbf9) {
    victim = var_642470e1abc1bbf9.victim;
    var_642470e1abc1bbf9.deathtype = playerkilled_finddeathtype(var_642470e1abc1bbf9);
    isfauxdeath = istrue(var_642470e1abc1bbf9.isfauxdeath);
    if (!isfauxdeath || getdvarint(@"hash_896b182fbfa8d9de", 0)) {
        victim notify("player_fatal_death");
    }
    switch (var_642470e1abc1bbf9.deathtype) {
    case #"hash_fea1e712b5740278":
        handleteamchangedeath();
        break;
    case #"hash_1184b43822fe56f0":
        handleworlddeath(var_642470e1abc1bbf9, var_642470e1abc1bbf9.attacker, var_642470e1abc1bbf9.lifeid, var_642470e1abc1bbf9.meansofdeath, var_642470e1abc1bbf9.hitloc);
        break;
    case #"hash_c03eabf71149f406":
        handlesuicidedeath(var_642470e1abc1bbf9.meansofdeath, var_642470e1abc1bbf9.hitloc);
        break;
    case #"hash_e97320d8279bef45":
        handlefriendlyfiredeath(var_642470e1abc1bbf9);
        break;
    case #"hash_ce250de499ae9603":
        handleinlaststanddeath(var_642470e1abc1bbf9);
        break;
    case #"hash_a9f265ec10b615d":
        handlenormaldeath(var_642470e1abc1bbf9.lifeid, var_642470e1abc1bbf9.attacker, var_642470e1abc1bbf9.inflictor, var_642470e1abc1bbf9.objweapon, var_642470e1abc1bbf9.meansofdeath, victim, var_642470e1abc1bbf9.iskillstreakweapon, var_642470e1abc1bbf9);
        break;
    default:
        /#
            assertmsg("Unhandled DeathType "" + var_642470e1abc1bbf9.deathtype + """);
        #/
        break;
    }
    function_8be77b53bcbd6d2d(var_642470e1abc1bbf9.attacker, 0);
    /#
        function_f9249bb06eb48092(var_642470e1abc1bbf9);
    #/
    /#
        function_af3ebb9d1ecd18e7(var_642470e1abc1bbf9);
    #/
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb3d
// Size: 0x21f
function playerkilled_sharedlogic_late(var_642470e1abc1bbf9) {
    playerkilled_handlecorpse(var_642470e1abc1bbf9);
    outofbounds::clearoob(self, 1);
    setdeathtimerlength(var_642470e1abc1bbf9);
    attacker = var_642470e1abc1bbf9.attacker;
    if (isdefined(attacker.owner)) {
        attacker = attacker.owner;
    }
    if (!isplayer(attacker)) {
        var_642470e1abc1bbf9.dokillcam = 0;
        var_642470e1abc1bbf9.dofinalkillcam = 0;
    }
    if (level.killcam || level.finalkillcamenabled) {
        playerkilled_killcamsetup(var_642470e1abc1bbf9);
    }
    if (game_utility::isBRStyleGameType()) {
        namespace_9cb8bb5897c3d5b2::branalytics_down(var_642470e1abc1bbf9.attacker, var_642470e1abc1bbf9.victim, var_642470e1abc1bbf9.objweapon, var_642470e1abc1bbf9.deathtype, var_642470e1abc1bbf9.meansofdeath);
    }
    thread challenges::ondeath(var_642470e1abc1bbf9.inflictor, var_642470e1abc1bbf9.attacker, var_642470e1abc1bbf9.damage, var_642470e1abc1bbf9.damageflags, var_642470e1abc1bbf9.meansofdeath, var_642470e1abc1bbf9.objweapon, var_642470e1abc1bbf9.hitloc, var_642470e1abc1bbf9.attacker.modifiers);
    if (!game_utility::runleanthreadmode() || getdvarint(@"hash_ee4a7c4b0cf8c75b", 1)) {
        playerkilled_logkill(var_642470e1abc1bbf9);
    }
    if (isdefined(level.var_cc2c79de99db62c) && level.var_cc2c79de99db62c) {
        namespace_969918091e5d9483::function_94c8f3722d550646();
        level.var_cc2c79de99db62c = 0;
    }
    namespace_e2785bb1da360f91::function_eceb462b367e4b04(var_642470e1abc1bbf9);
    callback::callback("player_death", var_642470e1abc1bbf9);
    if (function_6b9f8406e6153597()) {
        if (isdefined(attacker) && isplayer(attacker)) {
            attacker function_410078bd7a6f4a1(1);
        }
        if (isdefined(var_642470e1abc1bbf9.victim) && isplayer(var_642470e1abc1bbf9.victim)) {
            var_642470e1abc1bbf9.victim function_410078bd7a6f4a1(2);
        }
    }
    /#
        function_f9249bb06eb48092(var_642470e1abc1bbf9);
    #/
    /#
        function_af3ebb9d1ecd18e7(var_642470e1abc1bbf9);
    #/
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd63
// Size: 0x58c
function playerkilled_handlecorpse(var_642470e1abc1bbf9) {
    attacker = var_642470e1abc1bbf9.attacker;
    victim = var_642470e1abc1bbf9.victim;
    inflictor = var_642470e1abc1bbf9.inflictor;
    meansofdeath = var_642470e1abc1bbf9.meansofdeath;
    objweapon = var_642470e1abc1bbf9.objweapon;
    isfauxdeath = var_642470e1abc1bbf9.isfauxdeath;
    hitloc = var_642470e1abc1bbf9.hitloc;
    var_f5b166094dc876c1 = 0;
    if (isdefined(victim.carryobject) && !isfauxdeath) {
        victim notify("drop_called");
        victim.carryobject thread gameobjects::setdropped();
    }
    if (game_utility::isteamreviveenabled() && !outofbounds::isoob(self) && flags::gameflag("prematch_done") && level.teambased) {
        if (istrue(level.var_2a91b79384531432)) {
            level callback::callback("on_revive_trigger_requested", var_642470e1abc1bbf9);
        } else {
            level thread teamRevive::spawnrevivetrigger(victim, attacker, "new_trigger_spawned", meansofdeath);
        }
    }
    vehicle::vehicle_playerkilledbycollision(var_642470e1abc1bbf9);
    if (!isdefined(self.nocorpse) && !istrue(victim.skipcorpse)) {
        if (istrue(self.liveRagdoll)) {
            victim.body = victim;
        } else {
            victim.body = victim cloneplayer(var_642470e1abc1bbf9.deathanimduration, attacker);
            victim.body.targetname = "player_corpse";
        }
        /#
            debug::function_57f3a2089db4a571(victim.body);
        #/
    }
    if (!isdefined(self.nocorpse) && !istrue(victim.skipcorpse) && isdefined(victim.body)) {
        if (!isdefined(victim.switching_teams)) {
            if (isdefined(attacker) && isplayer(attacker)) {
                thread deathicons::adddeathicon(attacker, victim.body, victim, victim.team, 5);
            }
            var_e707f0032fa7b4bb = [];
            var_b8f254d4fd3f46a2 = [];
            foreach (index, player in level.players) {
                if (isdefined(victim)) {
                    if (istrue(namespace_e47104b48662385b::playersareenemies(player, victim)) && player perk::_hasperk("specialty_kill_report")) {
                        var_e707f0032fa7b4bb[index] = player;
                    } else if (player iscodcaster()) {
                        var_b8f254d4fd3f46a2[index] = player;
                    }
                }
            }
            if (var_e707f0032fa7b4bb.size > 0 || var_b8f254d4fd3f46a2.size > 0) {
                thread deathicons::addenemydeathicon(victim.body, victim, var_e707f0032fa7b4bb, var_b8f254d4fd3f46a2, getdvarfloat(@"hash_77d5a9878cbf3172"), 1);
            }
        }
        if (!istrue(self.liveRagdoll)) {
            if (var_642470e1abc1bbf9.isnukekill) {
            }
            if (var_642470e1abc1bbf9.isfauxdeath) {
                victim namespace_f8065cafc523dba5::function_a593971d75d82113();
                victim namespace_f8065cafc523dba5::function_379bb555405c16bb("damage::PlayerKilled_handleCorpse()");
                victim setsolid(0);
            }
            victim thread _startragdoll(var_642470e1abc1bbf9.victim.body, var_642470e1abc1bbf9.meansofdeath, var_642470e1abc1bbf9.inflictor);
        }
        victim thread callcorpsetablefuncs();
        if (!istrue(var_642470e1abc1bbf9.assistedsuicide)) {
            if (namespace_36f464722d326bbe::isBRStyleGameType()) {
                if (getsubgametype() == "dmz" && istrue(self.liveRagdoll)) {
                    var_f5b166094dc876c1 = 1;
                } else if (isdefined(level.pleaForHelp)) {
                    var_f5b166094dc876c1 = !istrue(namespace_51790b5acb47a506::function_bfdfd3c9ba0cc7cb(victim));
                } else {
                    var_f5b166094dc876c1 = 1;
                }
            } else {
                var_f5b166094dc876c1 = 1;
            }
        }
        if (istrue(var_f5b166094dc876c1)) {
            victim namespace_46e942396566f2da::function_1dd3a521ea9ecf27(attacker, objweapon, meansofdeath, hitloc, inflictor, var_642470e1abc1bbf9.executionref);
        }
    } else if (!istrue(self.liveRagdoll)) {
        if (isdefined(victim.nocorpse) && !istrue(victim.skipcorpse)) {
            victim.body = victim cloneplayer(var_642470e1abc1bbf9.deathanimduration);
            victim.body hide(1);
        }
    }
    if (!istrue(game["isLaunchChunk"])) {
        victim.streaktype = class::loadout_getplayerstreaktype(victim.streaktype);
        var_3e4944bceee5519 = namespace_8319cdbe938cd234::function_9f1dc821e9a8506();
        if (killstreaks::streaktyperesetsondeath(victim.streaktype)) {
            if (!level.casualscorestreaks && !victim perk::_hasperk("specialty_support_killstreaks") && !var_3e4944bceee5519) {
                victim killstreaks::resetstreakpoints();
                victim killstreaks::resetstreakavailability();
            } else if (level.casualscorestreaks && !var_3e4944bceee5519) {
                var_885ad6b3c9d47759 = killstreaks::checkcasualstreaksreset();
                if (var_885ad6b3c9d47759) {
                    victim killstreaks::resetstreakpoints();
                    victim killstreaks::resetstreakavailability();
                }
            } else if (var_3e4944bceee5519) {
                if (getdvarint(@"hash_9e63e7a9c6f6ee4c", 1) == 1) {
                    victim killstreaks::function_21e35dd4600c80a7();
                }
                victim killstreaks::function_e90a1856110e006a(attacker);
                victim killstreaks::resetstreakavailability();
            }
        }
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2f6
// Size: 0x312
function _startragdoll(corpse, meansofdeath, inflictor) {
    if (!isdefined(corpse)) {
        return;
    }
    corpse endon("death");
    deathanim = corpse getcorpseanim();
    animduration = 0;
    if (animisleaf(deathanim)) {
        animduration = getanimlength(deathanim);
    }
    startdelay = undefined;
    vehicle = namespace_e47104b48662385b::getvehicle();
    var_b9e330c2bda52fb5 = playerkilled_washitbyvehicle(meansofdeath, inflictor);
    var_6126d8436c986baf = undefined;
    var_4030c4ad220257f2 = animhasnotetrack(deathanim, "delete_corpse");
    var_41736ebfc0d6434c = animhasnotetrack(deathanim, "delete_corpse_delayed");
    noragdoll = animhasnotetrack(deathanim, "no_ragdoll");
    var_ce8bcdf49c43b6d0 = animhasnotetrack(deathanim, "start_ragdoll");
    if (isdefined(vehicle) || isdefined(self.var_e9a71c27fef1b65a) && isdefined(self.var_abd157413ac4e022)) {
        if (isdefined(vehicle)) {
            var_6126d8436c986baf = vehicle_occupancy::vehicle_occupancy_getoccupantseat(vehicle, self);
        } else {
            vehicle = self.var_abd157413ac4e022;
            var_6126d8436c986baf = self.var_e9a71c27fef1b65a;
        }
        if (noragdoll || var_ce8bcdf49c43b6d0) {
            vehicle_occupancy::vehicle_occupancy_linkseatcorpse(corpse, vehicle, var_6126d8436c986baf);
            corpse setcorpsefalling(0);
            corpse.linktooriginandangles = vehicle_occupancy::vehicle_occupancy_linktooriginandangles(vehicle, var_6126d8436c986baf);
        }
        if (var_4030c4ad220257f2 || var_41736ebfc0d6434c || noragdoll || var_ce8bcdf49c43b6d0) {
            var_f9e25038fed22bf0 = !noragdoll && !var_ce8bcdf49c43b6d0 || isdefined(self.var_abd157413ac4e022);
            duration = utility::ter_op(var_41736ebfc0d6434c, animduration, animduration + 3);
            thread playerkilled_deletecorpseoutofvehicle(corpse, vehicle, var_6126d8436c986baf, duration, var_f9e25038fed22bf0);
        }
    }
    if (meansofdeath != "mod_execution" && !noragdoll) {
        startdelay = 0;
        if (var_ce8bcdf49c43b6d0 && animduration > 0) {
            var_9296f7895c90c8ed = getnotetracktimes(deathanim, "start_ragdoll")[0];
            startdelay = var_9296f7895c90c8ed * animduration;
        }
        if (var_b9e330c2bda52fb5) {
            startdelay = 0;
        }
    }
    if (isdefined(startdelay)) {
        wait(startdelay);
        if (!isdefined(corpse)) {
            return;
        }
        if (isdefined(vehicle)) {
            corpse thread _unlinkcorpsefromvehicle(vehicle, var_6126d8436c986baf, var_4030c4ad220257f2, var_41736ebfc0d6434c, startdelay, animduration);
            corpse notify("cancel_delete_corpse");
            vehicle_occupancy::vehicle_occupancy_clearseatcorpse(corpse, vehicle, var_6126d8436c986baf);
        } else {
            if (!corpse isragdoll()) {
                if (var_b9e330c2bda52fb5) {
                    corpse startragdollfromvehiclehit(inflictor);
                } else {
                    corpse startragdoll();
                }
            }
            if (isdefined(level.var_83ed94a4c034a642)) {
                self thread [[ level.var_83ed94a4c034a642 ]](corpse, animduration);
            } else {
                var_c00a326249963ab5 = function_cd0171313cca081();
                var_cff2e3774745e3dd = var_c00a326249963ab5[1];
                var_b2afba0be4e4e55 = var_c00a326249963ab5[0];
                if (isdefined(var_b2afba0be4e4e55) && isdefined(var_cff2e3774745e3dd)) {
                    corpse thread function_c837dcc441a2d51b(var_b2afba0be4e4e55, var_cff2e3774745e3dd);
                } else {
                    corpse thread _donewithcorpse(var_4030c4ad220257f2, var_41736ebfc0d6434c, startdelay, animduration);
                }
            }
        }
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe60f
// Size: 0x86
function _donewithcorpse(var_4030c4ad220257f2, var_41736ebfc0d6434c, startdelay, animduration) {
    corpse = self;
    if (var_4030c4ad220257f2 || var_41736ebfc0d6434c) {
        deletedelay = animduration;
        if (var_41736ebfc0d6434c) {
            animduration = animduration + 3;
        }
        if (isdefined(startdelay)) {
            deletedelay = deletedelay - startdelay;
        }
        wait(deletedelay);
        if (!isdefined(corpse)) {
            return;
        }
        corpse delete();
    } else if (!game_utility::isteamreviveenabled() && !isagent(self)) {
        corpse setplayercorpsedone();
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe69c
// Size: 0x4f
function function_c837dcc441a2d51b(var_b2afba0be4e4e55, var_cff2e3774745e3dd) {
    corpse = self;
    level endon("game_ended");
    if (isdefined(var_b2afba0be4e4e55) && isdefined(var_cff2e3774745e3dd) && var_cff2e3774745e3dd > 0) {
        corpse utility::waittill_notify_or_timeout(var_b2afba0be4e4e55, var_cff2e3774745e3dd);
    }
    if (isdefined(corpse)) {
        corpse delete();
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6f2
// Size: 0x97
function function_cd0171313cca081() {
    player = self;
    if (isdefined(level.var_d40354696b3b8b2)) {
        return player [[ level.var_d40354696b3b8b2 ]]();
    } else if (istrue(player.gulag)) {
        arena = namespace_de6eb888abbe38e1::function_2f4344abdc200e43(player);
        if (!isdefined(arena) || !isdefined(arena.time)) {
            return [0:undefined, 1:undefined];
        } else {
            return [0:"corpse_manually_deleted", 1:arena.time];
        }
    }
    return [0:undefined, 1:undefined];
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe791
// Size: 0x18e
function _unlinkcorpsefromvehicle(vehicle, var_6126d8436c986baf, var_4030c4ad220257f2, var_41736ebfc0d6434c, startdelay, animduration) {
    corpse = self;
    var_78235dcdec40f390 = getdvarint(@"hash_7c902421e1883986", 1);
    var_14615b298620c411 = !var_78235dcdec40f390;
    var_9d6e760e37be3ed1 = getdvarint(@"hash_c041b4135b55d8b7", 1);
    if (var_78235dcdec40f390) {
        if (!corpse isragdoll()) {
            corpse startragdoll(var_9d6e760e37be3ed1);
        }
    }
    waittime = getdvarfloat(@"hash_7d1401b6075479ac", 0.1);
    if (waittime > 0) {
        wait(waittime);
    }
    if (isdefined(corpse)) {
        if (isdefined(corpse.linktooriginandangles) && isdefined(vehicle)) {
            originoffset = (0, 0, 0);
            linktooriginandangles = vehicle_occupancy::vehicle_occupancy_linktooriginandangles(vehicle, var_6126d8436c986baf);
            originoffset = linktooriginandangles.origin - corpse.linktooriginandangles.origin;
            var_a4f5fb62ba3a113b = corpse.origin + originoffset;
            var_a918f1be2147ec75 = linktooriginandangles.angles;
            corpse trajectoryupdateoriginandangles(var_a4f5fb62ba3a113b, var_a918f1be2147ec75);
        }
        corpse unlink();
        if (var_14615b298620c411) {
            corpse startragdoll(var_9d6e760e37be3ed1);
        }
        corpse thread _donewithcorpse(var_4030c4ad220257f2, var_41736ebfc0d6434c, startdelay, animduration);
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe926
// Size: 0x5f
function playerkilled_deletecorpseoutofvehicle(corpse, vehicle, seatid, duration, var_f9e25038fed22bf0) {
    corpse endon("death");
    corpse endon("cancel_delete_corpse");
    vehicle_occupancy::vehicle_occupancy_assignseatcorpse(corpse, vehicle, seatid, var_f9e25038fed22bf0);
    vehicle utility::waittill_any_timeout_1(duration, "death");
    if (isdefined(corpse)) {
        corpse delete();
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe98c
// Size: 0x35
function playerkilled_washitbyvehicle(meansofdeath, inflictor) {
    if (meansofdeath != "MOD_CRUSH") {
        return 0;
    }
    if (!isdefined(inflictor)) {
        return 0;
    }
    if (!inflictor vehicle::isvehicle()) {
        return 0;
    }
    return 1;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9c9
// Size: 0x3de
function playerkilled_killcamsetup(var_642470e1abc1bbf9) {
    attacker = var_642470e1abc1bbf9.attacker;
    victim = var_642470e1abc1bbf9.victim;
    inflictor = var_642470e1abc1bbf9.inflictor;
    meansofdeath = var_642470e1abc1bbf9.meansofdeath;
    objweapon = var_642470e1abc1bbf9.objweapon;
    executionref = var_642470e1abc1bbf9.executionref;
    if (isdefined(attacker) && istrue(attacker.assistedsuicide) || level.teambased && isdefined(attacker) && utility::is_equal(attacker.team, victim.team) || istrue(level.var_c2111af4e4ece485)) {
        var_642470e1abc1bbf9.dokillcam = 0;
        var_642470e1abc1bbf9.dofinalkillcam = 0;
    }
    if (!isdefined(var_642470e1abc1bbf9.killcamentity)) {
        var_642470e1abc1bbf9.killcamentity = victim killcam::getkillcamentity(attacker, inflictor, objweapon, meansofdeath);
    }
    if (isdefined(var_642470e1abc1bbf9.killcamentity)) {
        var_642470e1abc1bbf9.killcamentityindex = var_642470e1abc1bbf9.killcamentity getentitynumber();
        var_642470e1abc1bbf9.killcamentitystarttime = var_642470e1abc1bbf9.killcamentity.birthtime;
        if (!isdefined(var_642470e1abc1bbf9.killcamentitystarttime)) {
            var_642470e1abc1bbf9.killcamentitystarttime = 0;
        }
    }
    /#
        if (getdvarint(@"hash_fc512bc1308e1801") != 0) {
            var_642470e1abc1bbf9.dokillcam = 1;
        }
    #/
    if (isdefined(inflictor) && istrue(var_642470e1abc1bbf9.inflictor.var_26fb072855fd4772)) {
        var_642470e1abc1bbf9.dokillcam = 1;
    }
    if (var_642470e1abc1bbf9.dokillcam) {
        victim killcam::prekillcamnotify(attacker);
        if (isdefined(inflictor) && isagent(inflictor)) {
            var_642470e1abc1bbf9.inflictoragentinfo = spawnstruct();
            var_642470e1abc1bbf9.inflictoragentinfo.agent_type = inflictor.agent_type;
            var_642470e1abc1bbf9.inflictoragentinfo.lastspawntime = inflictor.lastspawntime;
        }
    }
    var_642470e1abc1bbf9.killcamentstickstovictim = meansofdeath == "MOD_IMPACT" || meansofdeath == "MOD_HEAD_SHOT" && isdefined(inflictor) || meansofdeath == "MOD_GRENADE" || isdefined(victim) && isdefined(victim.stuckbygrenade) && isdefined(inflictor) && victim.stuckbygrenade == inflictor || objweapon.basename == "throwingknifec4_mp";
    if (!var_642470e1abc1bbf9.iskillstreakweapon || function_1a9394eb58e66a9b(objweapon)) {
        killcam::setkillcamnormalweaponomnvars(objweapon, meansofdeath, inflictor, executionref, attacker);
    }
    var_ed6248b2a7a7a508 = isdefined(attacker) && isdefined(attacker.classname) && attacker.classname != "trigger_hurt" && attacker.classname != "worldspawn" && attacker != victim;
    if (level.recordfinalkillcam && var_642470e1abc1bbf9.dofinalkillcam) {
        if (!istrue(level.disable_killcam) && meansofdeath != "MOD_SUICIDE" && var_ed6248b2a7a7a508) {
            final_killcam::recordfinalkillcam(5, victim, attacker, var_642470e1abc1bbf9.attackerentnum, inflictor, var_642470e1abc1bbf9.killcamentityindex, var_642470e1abc1bbf9.killcamentitystarttime, var_642470e1abc1bbf9.killcamentstickstovictim, objweapon, var_642470e1abc1bbf9.psoffsettime, meansofdeath);
        }
    }
    /#
        function_f9249bb06eb48092(var_642470e1abc1bbf9);
    #/
    /#
        function_af3ebb9d1ecd18e7(var_642470e1abc1bbf9);
    #/
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xedae
// Size: 0x11c
function playerkilled_deathscene(var_642470e1abc1bbf9) {
    victim = var_642470e1abc1bbf9.victim;
    victim endon("spawned");
    if (victim namespace_dc51de4e8cbd07b::function_581a8fc6f76d525d()) {
        victim namespace_dc51de4e8cbd07b::function_cdff2f0b5dcf3aa1();
    }
    if (!var_642470e1abc1bbf9.isfauxdeath) {
        if (!isdefined(victim.respawntimerstarttime)) {
            victim.respawntimerstarttime = gettime() + var_642470e1abc1bbf9.deathscenetimems;
        }
        wait(var_642470e1abc1bbf9.deathscenetimesec);
        if (var_642470e1abc1bbf9.dokillcam) {
            var_e9e21d7db272a441 = final_killcam::skipkillcamduringdeathtimer(0.5);
            var_642470e1abc1bbf9.dokillcam = isdefined(var_e9e21d7db272a441) && !var_e9e21d7db272a441;
        }
        if (isdefined(victim)) {
            victim notify("death_delay_finished");
            if (getdvarint(@"hash_8d86e6b3c30bfbf1", 1) == 1 && !namespace_36f464722d326bbe::isBRStyleGameType()) {
                victim thread namespace_99ac021a7547cae3::function_5c5f27d13e5eb129();
            }
        }
    } else if (!isdefined(victim.respawntimerstarttime)) {
        victim.respawntimerstarttime = gettime();
    }
    /#
        function_f9249bb06eb48092(var_642470e1abc1bbf9);
    #/
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeed1
// Size: 0x438
function playerkilled_killcam(var_7ce346cc7a54d100) {
    var_642470e1abc1bbf9 = var_7ce346cc7a54d100;
    if (!isdefined(var_642470e1abc1bbf9.victim)) {
        return;
    }
    deathtime = var_642470e1abc1bbf9.victim.deathtime;
    if (getdvarint(@"hash_98f5c716d594181b", 1) && isdefined(var_642470e1abc1bbf9.victim.laststanddowneddata)) {
        var_642470e1abc1bbf9 = var_642470e1abc1bbf9.victim.laststanddowneddata;
        var_642470e1abc1bbf9.victim.laststanddowneddata = undefined;
        var_642470e1abc1bbf9.dokillcam = var_7ce346cc7a54d100.dokillcam && isplayer(var_642470e1abc1bbf9.attacker);
        deathtime = var_642470e1abc1bbf9.deathtime;
    }
    if (!isdefined(deathtime)) {
        return;
    }
    var_642470e1abc1bbf9.victim endon("spawned");
    victim = var_642470e1abc1bbf9.victim;
    attacker = var_642470e1abc1bbf9.attacker;
    postdeathdelay = (gettime() - deathtime) / 1000;
    if (isdefined(level.modevalidatekillcam)) {
        [[ level.modevalidatekillcam ]](var_642470e1abc1bbf9);
    }
    if (!istrue(victim.cancelkillcam) && var_642470e1abc1bbf9.dokillcam && level.killcam && game["state"] == "playing" && !victim isusingremote() && !level.showingfinalkillcam && !istrue(level.var_904aa57b8b22090c)) {
        timeuntilspawn = namespace_66c176d3c67cc0c2::timeuntilspawn(1);
        var_2ec157fffde08fd7 = [];
        if (isdefined(attacker.perks)) {
            foreach (key, index in attacker.perks) {
                var_2ec157fffde08fd7[var_2ec157fffde08fd7.size] = key;
            }
        } else if (isdefined(attacker.pers)) {
            foreach (var_ca5ad0c2334c4a6c in [0:"loadoutStandardPerks", 1:"loadoutExtraPerks"]) {
                if (array_contains_key(attacker.pers, var_ca5ad0c2334c4a6c)) {
                    foreach (perk in attacker.pers[var_ca5ad0c2334c4a6c]) {
                        if (perk != "" && perk != "none" && perk != "specialty_null" && !array_contains(var_2ec157fffde08fd7, perk)) {
                            var_2ec157fffde08fd7[var_2ec157fffde08fd7.size] = perk;
                        }
                    }
                }
            }
        }
        if (!istrue(level.disablecopycatloadout)) {
            victim thread startcopycatoption(attacker);
        }
        skippable = 1;
        victim killcam::killcam(var_642470e1abc1bbf9.inflictor, var_642470e1abc1bbf9.inflictoragentinfo, var_642470e1abc1bbf9.attackerentnum, var_642470e1abc1bbf9.killcamentityindex, var_642470e1abc1bbf9.killcamentitystarttime, undefined, var_642470e1abc1bbf9.killcamentstickstovictim, var_642470e1abc1bbf9.objweapon, postdeathdelay, var_642470e1abc1bbf9.psoffsettime, timeuntilspawn, gamelogic::timeuntilroundend(), attacker, victim, var_642470e1abc1bbf9.meansofdeath, var_2ec157fffde08fd7, skippable);
        if (isdefined(victim) && !istrue(level.disablecopycatloadout)) {
            victim thread stopcopycatoption();
        }
        if (isdefined(level.onpostkillcamcallback)) {
            [[ level.onpostkillcamcallback ]]();
        }
    }
    if (isdefined(victim)) {
        victim.var_7c813e50ff75be27 = 0;
    }
    /#
        function_f9249bb06eb48092(var_7ce346cc7a54d100);
    #/
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf310
// Size: 0x108
function playerkilled_spawn(var_642470e1abc1bbf9) {
    victim = var_642470e1abc1bbf9.victim;
    if (!isdefined(victim)) {
        return;
    }
    if (isdefined(level.modeplayerkilledspawn) && [[ level.modeplayerkilledspawn ]](var_642470e1abc1bbf9, 1)) {
        return;
    }
    if (istrue(victim.liveRagdoll)) {
        return;
    }
    victim endon("spawned");
    victim endon("disconnect");
    attacker = var_642470e1abc1bbf9.attacker;
    victim resetplayervariables();
    victim resetplayeromnvarsonspawn();
    if (isdefined(attacker)) {
        victim.lastattacker = attacker;
    } else {
        victim.lastattacker = undefined;
    }
    victim.wantsafespawn = 0;
    if (game["state"] != "playing") {
        if (!level.showingfinalkillcam) {
            victim player::updatesessionstate("dead");
            victim player::clearkillcamstate();
        }
        return;
    }
    if (class::isvalidclass(victim.class)) {
        victim thread namespace_66c176d3c67cc0c2::spawnclient();
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf41f
// Size: 0xe3
function playerkilled_internal(inflictor, attacker, victim, damage, damageflags, meansofdeath, objweapon, direction_vec, hitloc, psoffsettime, deathanimduration, isfauxdeath) {
    victim endon("spawned");
    if (game["state"] == "postgame") {
        return;
    }
    var_642470e1abc1bbf9 = victim playerkilled_initdeathdata(inflictor, attacker, victim, damage, damageflags, meansofdeath, objweapon, direction_vec, hitloc, psoffsettime, deathanimduration, isfauxdeath);
    playerkilled_parameterfixup(var_642470e1abc1bbf9);
    playerkilled_precalc(var_642470e1abc1bbf9);
    playerkilled_sharedlogic_early(var_642470e1abc1bbf9);
    playerkilled_handledeathtype(var_642470e1abc1bbf9);
    playerkilled_sharedlogic_late(var_642470e1abc1bbf9);
    playerkilled_deathscene(var_642470e1abc1bbf9);
    playerkilled_killcam(var_642470e1abc1bbf9);
    playerkilled_spawn(var_642470e1abc1bbf9);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf509
// Size: 0x14
function isswitchingteams() {
    if (isdefined(self.switching_teams)) {
        return 1;
    }
    return 0;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf525
// Size: 0x46
function isteamswitchbalanced() {
    playercounts = teams::countplayers();
    playercounts[self.leaving_team]--;
    playercounts[self.joining_team]++;
    return playercounts[self.joining_team] - playercounts[self.leaving_team] < 2;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf573
// Size: 0x6b
function isfriendlyfire(victim, attacker) {
    if (!level.teambased) {
        return 0;
    }
    if (!isdefined(attacker)) {
        return 0;
    }
    if (!isplayer(attacker) && !isdefined(attacker.team)) {
        return 0;
    }
    if (victim.team != attacker.team) {
        return 0;
    }
    if (victim == attacker) {
        return 0;
    }
    return 1;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf5e6
// Size: 0x21
function killedself(attacker) {
    if (!isplayer(attacker)) {
        return 0;
    }
    if (attacker != self) {
        return 0;
    }
    return 1;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf60f
// Size: 0x83
function handleteamchangedeath() {
    if (!level.teambased) {
        return;
    }
    /#
        assert(self.leaving_team != self.joining_team);
    #/
    if (self.joining_team == "spectator" || !isteamswitchbalanced()) {
        namespace_26e1361ab951ec6b::addtoplayerstat(1, "combatStats", "suicides");
        stats::incpersstat("suicides", 1);
    }
    if (isdefined(level.onteamchangedeath)) {
        [[ level.onteamchangedeath ]](self);
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf699
// Size: 0x1a2
function handleworlddeath(var_642470e1abc1bbf9, attacker, lifeid, smeansofdeath, shitloc) {
    victim = var_642470e1abc1bbf9.victim;
    victim.deathspectatepos = victim.origin;
    if (!isdefined(attacker)) {
        return;
    }
    events::playerworlddeath(attacker, smeansofdeath);
    if (!isdefined(attacker.team) || attacker.team == "neutral" || attacker == victim) {
        handlesuicidedeath(smeansofdeath, shitloc);
        return;
    }
    /#
        assert(isagent(attacker) || teams::isgameplayteam(attacker.team) || teams::function_44a6f98cc3c0f5f4(attacker.team));
    #/
    if (level.teambased && attacker.team != self.team || !level.teambased) {
        if (isdefined(level.onnormaldeath) && (isplayer(attacker) || isagent(attacker)) && attacker.team != "spectator" || isdefined(attacker.var_acb55a437c3145c0)) {
            if (!level.gameended) {
                [[ level.onnormaldeath ]](self, attacker, lifeid, smeansofdeath);
            }
        }
    }
    if (isagent(attacker) || teams::function_44a6f98cc3c0f5f4(attacker.team)) {
        var_642470e1abc1bbf9.dokillcam = 1;
        thread handlenormaldeath_sounds(attacker, victim, smeansofdeath);
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf842
// Size: 0xfa
function handlesuicidedeath(smeansofdeath, shitloc) {
    namespace_26e1361ab951ec6b::addtoplayerstat(1, "combatStats", "suicides");
    stats::incpersstat("suicides", 1);
    namespace_969918091e5d9483::function_5a82c337b996baa5(6, 0);
    scoresub = tweakables::gettweakablevalue("game", "suicidepointloss");
    gamescore::_setplayerscore(self, gamescore::_getplayerscore(self) - scoresub);
    if (weapons::grenadeheldatdeath() && smeansofdeath == "MOD_SUICIDE" && shitloc == "none") {
        self.lastgrenadesuicidetime = gettime();
    }
    if (isdefined(level.onsuicidedeath)) {
        [[ level.onsuicidedeath ]](self);
    }
    if (isdefined(level.var_90420335f9a84867)) {
        self [[ level.var_90420335f9a84867 ]](undefined, 0);
    }
    self.suicidespawndelay = 1;
    if (isdefined(self.friendlydamage)) {
        self.friendlyfiredeath = 1;
    }
    thread function_4e8bd2bd787c0dda(smeansofdeath);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf943
// Size: 0x281
function handlefriendlyfiredeath(var_642470e1abc1bbf9) {
    attacker = var_642470e1abc1bbf9.attacker;
    victim = var_642470e1abc1bbf9.victim;
    meansofdeath = var_642470e1abc1bbf9.meansofdeath;
    var_f03e984a6fb59137 = 0;
    if (meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH") {
        var_da0825016d12704e = function_1823ff50bb28148d(game_utility::function_60bf8d82001fc22c());
        if (var_da0825016d12704e == #"control" || var_da0825016d12704e == #"koth") {
            if (isdefined(victim.isonobjective) && istrue(victim.isonobjective)) {
                var_f03e984a6fb59137 = 1;
            }
        }
    } else if (istrue(var_642470e1abc1bbf9.iskillstreakweapon)) {
        var_f03e984a6fb59137 = 1;
    }
    if (istrue(var_642470e1abc1bbf9.var_bfcdebee0e8a3189)) {
        return;
    }
    if (var_f03e984a6fb59137 && attacker.pers["teamkills"] < level.maxallowedteamkills) {
        return;
    }
    attacker thread rank::scoreeventpopup(#"teamkill");
    attacker.pers["teamkills"] = attacker.pers["teamkills"] + 1;
    victim namespace_969918091e5d9483::function_5a82c337b996baa5(6, 0);
    if (tweakables::gettweakablevalue("team", "teamkillpointloss")) {
        scoresub = rank::getscoreinfovalue(#"kill");
        gamescore::_setplayerscore(attacker, gamescore::_getplayerscore(attacker) - scoresub);
    }
    if (level.maxallowedteamkills < 0) {
        return;
    }
    teamkilldelay = attacker namespace_66c176d3c67cc0c2::teamkilldelay();
    if (teamkilldelay > 0) {
        attacker.pers["teamKillPunish"] = 1;
        attacker notify("team_kill_punish");
        if (attacker utility::isusingremote()) {
            attacker thread suicide_on_end_remote();
        } else {
            attacker thread suicide_on_alive();
        }
    }
    if (level.friendlyfire == 4) {
        if (!istrue(attacker.pers["hitFFLimit"]) && attacker.pers["teamkills"] >= level.maxallowedteamkills) {
            attacker.pers["hitFFLimit"] = 1;
            attacker hud_message::showerrormessage("MP/FRIENDLY_FIRE_PUNISH_SWITCH");
        } else if (istrue(level.var_7d731c7dcbefbf3d)) {
            attacker hud_message::showerrormessage("MP/FRIENDLY_FIRE_WILL_NOT");
        }
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbcb
// Size: 0x364
function handleinlaststanddeath(var_642470e1abc1bbf9) {
    /#
        if (isbot(var_642470e1abc1bbf9.victim) && getdvarint(@"hash_e125675f281d4f47", 0) == 1) {
            var_642470e1abc1bbf9.dokillcam = 0;
            return;
        }
    #/
    if (istrue(level.var_1a2b600a06ec21f4.var_198508771f0592a9)) {
        attacker = self.laststandattacker;
        inflictor = self.laststanddowneddata.inflictor;
        objweapon = self.laststanddowneddata.objweapon;
        meansofdeath = self.laststanddowneddata.meansofdeath;
        if (!isdefined(inflictor)) {
            inflictor = self.laststanddowneddata.var_bfcfdc8956ad23b0;
        }
        if (isdefined(self.attackers)) {
            foreach (var_7694fc472af9f89d in self.attackers) {
                if (var_7694fc472af9f89d == attacker) {
                    continue;
                } else if (!isdefined(var_7694fc472af9f89d.modifiers)) {
                    var_7694fc472af9f89d.modifiers = [];
                }
            }
        }
        handlenormaldeath(var_642470e1abc1bbf9.lifeid, attacker, inflictor, objweapon, meansofdeath, self, var_642470e1abc1bbf9.iskillstreakweapon, var_642470e1abc1bbf9, 0);
    } else {
        if (!istrue(var_642470e1abc1bbf9.victim.disable_killcam)) {
            var_642470e1abc1bbf9.dokillcam = 1;
        }
        if (!var_642470e1abc1bbf9.iskillstreakweapon) {
            var_642470e1abc1bbf9.attacker thread points::function_e3e3e81453fd788b(#"hash_4b2faaeab2b30db", var_642470e1abc1bbf9.objweapon, var_642470e1abc1bbf9.victim);
        }
        if (isdefined(self.laststandattacker)) {
            self.laststandattacker playerincrementscoreboardkills();
        }
        var_24244b97c44b0386 = undefined;
        if (isdefined(self.laststandattacker) && var_642470e1abc1bbf9.attacker != self.laststandattacker) {
            var_24244b97c44b0386 = 1;
            thread challenges::onplayerkilled(self.laststandattacker, self.laststandattacker, 0, var_642470e1abc1bbf9.damageflags, self.laststandmeansofdeath, self.laststandweaponobj, var_642470e1abc1bbf9.hitloc, self.laststandattackermodifiers);
            if (isdefined(level.var_90420335f9a84867)) {
                self [[ level.var_90420335f9a84867 ]](self.laststandattacker, 0);
            }
            self.laststandattacker thread rank::scoreeventpopup(#"kill_confirmed");
        }
        var_b9c265f657115663 = 0;
        if (istrue(var_24244b97c44b0386)) {
            var_b9c265f657115663 = 1;
        }
        handlenormaldeath(var_642470e1abc1bbf9.lifeid, var_642470e1abc1bbf9.attacker, var_642470e1abc1bbf9.inflictor, var_642470e1abc1bbf9.objweapon, var_642470e1abc1bbf9.meansofdeath, self, var_642470e1abc1bbf9.iskillstreakweapon, var_642470e1abc1bbf9, 1, var_b9c265f657115663);
    }
    self.laststandattacker = undefined;
    self.laststandmeansofdeath = undefined;
    self.laststandweaponobj = undefined;
    self.laststandattackermodifiers = undefined;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff36
// Size: 0x3f
function function_11ea8154fd8726c5(var_306f84215cfc4820) {
    if (!isdefined(var_306f84215cfc4820)) {
        return "";
    }
    var_f1758d2a7814ab9b = function_5deea0be9aafcdd4(var_306f84215cfc4820);
    if (isdefined(var_f1758d2a7814ab9b) && var_f1758d2a7814ab9b != "") {
        return var_f1758d2a7814ab9b;
    }
    return "";
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff7d
// Size: 0x3bb
function handlenormaldeath_sounds(attacker, victim, smeansofdeath, einflictor, var_10e1ef8c47f876d8, var_306f84215cfc4820) {
    var_e08e0d086a79892b = 0;
    ent = victim;
    if (!isdefined(attacker.lastkillalertsoundtime)) {
        attacker.lastkillalertsoundtime = gettime();
        var_e08e0d086a79892b = 1;
    } else if (gettime() > attacker.lastkillalertsoundtime + 700) {
        attacker.lastkillalertsoundtime = gettime();
        var_e08e0d086a79892b = 1;
    }
    var_31920aa482f41ae8 = !game_utility::function_b2c4b42f9236924() || getdvarint(@"hash_c2989c398361dbb3", 0) != 0;
    var_e7d4a41e01c7228c = game_utility::function_b2c4b42f9236924() && getdvarint(@"hash_58f2c5b698828174", 0) != 0;
    if (function_80ade967129c9845()) {
        goto LOC_000002c7;
    }
    if (isagent(attacker)) {
        if (!utility::isbulletdamage(smeansofdeath) || isdefined(einflictor) && attacker != einflictor) {
            goto LOC_0000017f;
        }
        if (smeansofdeath == "MOD_HEAD_SHOT") {
            ent playsoundtoplayer("bullet_impact_headshot_plr", victim);
            ent playsoundtoteam("bullet_impact_headshot_npc", victim.team, victim);
        } else {
            ent playsoundtoteam("mp_hit_alert_final_npc", victim.team);
        LOC_0000017f:
        }
    LOC_0000017f:
    } else if (!utility::isbulletdamage(smeansofdeath) || isdefined(einflictor) && attacker != einflictor) {
        if (var_e08e0d086a79892b) {
            if (smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH") {
                var_90e6bc3a37537c77 = "mp_kill_alert" + function_11ea8154fd8726c5(var_306f84215cfc4820);
                ent playsoundtoplayer(var_90e6bc3a37537c77, attacker);
            } else {
                ent playsoundtoplayer("mp_kill_alert_quiet", attacker);
            }
        }
    } else if (smeansofdeath == "MOD_HEAD_SHOT" && var_31920aa482f41ae8) {
        ent playsoundtoplayer("bullet_impact_headshot_plr", victim);
        ent playsoundtoplayer("bullet_impact_headshot", attacker);
        if (var_e08e0d086a79892b) {
            var_90e6bc3a37537c77 = "mp_headshot_alert" + function_11ea8154fd8726c5(var_306f84215cfc4820);
            ent playsoundtoplayer(var_90e6bc3a37537c77, attacker);
        }
        ent playsoundtoteam("bullet_impact_headshot_npc", victim.team, victim);
        ent playsoundtoteam("bullet_impact_headshot_npc", attacker.team, attacker);
    } else {
        ent playsoundtoteam("mp_hit_alert_final_npc", victim.team);
        ent playsoundtoteam("mp_hit_alert_final_npc", attacker.team, attacker);
        if (var_e08e0d086a79892b) {
            var_506b055e36391339 = utility::ter_op(var_e7d4a41e01c7228c, "mp_kill_alert_quiet", "mp_kill_alert");
            if (!var_e7d4a41e01c7228c) {
                var_506b055e36391339 = var_506b055e36391339 + function_11ea8154fd8726c5(var_306f84215cfc4820);
            }
            ent playsoundtoplayer(var_506b055e36391339, attacker);
        LOC_000002c7:
        }
    LOC_000002c7:
    }
LOC_000002c7:
    if (isplayer(victim)) {
        if (smeansofdeath != "MOD_EXECUTION" && (smeansofdeath == "MOD_MELEE" || smeansofdeath == "MOD_FALLING" || smeansofdeath == "MOD_TRIGGER_HURT" || smeansofdeath == "MOD_SUICIDE")) {
            victim playlocalsound("deaths_door_death_quiet");
        } else if (smeansofdeath != "MOD_EXECUTION") {
            victim playlocalsound("deaths_door_death");
        }
        victim setentitysoundcontext("deaths_door", "", 0.1);
        victim namespace_4887422e77f3514e::function_a2b4e6088394bade(2);
        victim notify("deaths_door_exit");
        victim.deathsdoor = 0;
        if (getdvarint(@"hash_4392ab54b296ef96", 0) != 0) {
            if (function_950c8234f03299d4()) {
                if (isdefined(var_10e1ef8c47f876d8) && var_10e1ef8c47f876d8 != "") {
                    victim playlocalsound(var_10e1ef8c47f876d8);
                }
            } else {
                /#
                    function_5013853947770621(#"hash_e4a6063613016089");
                #/
            }
        }
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1033f
// Size: 0xa2
function function_4e8bd2bd787c0dda(smeansofdeath) {
    if (isplayer(self)) {
        if (smeansofdeath != "MOD_EXECUTION" && (smeansofdeath == "MOD_MELEE" || smeansofdeath == "MOD_FALLING" || smeansofdeath == "MOD_TRIGGER_HURT" || smeansofdeath == "MOD_SUICIDE")) {
            self playlocalsound("deaths_door_death_quiet");
        } else if (smeansofdeath != "MOD_EXECUTION") {
            self playlocalsound("deaths_door_death");
        }
        self setentitysoundcontext("deaths_door", "", 0.1);
        thread namespace_4887422e77f3514e::function_a2b4e6088394bade(2);
        self notify("deaths_door_exit");
        self.deathsdoor = 0;
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x103e8
// Size: 0xd
function function_80ade967129c9845() {
    return istrue(level.var_57ece26e490ad8c4);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x103fd
// Size: 0x17e7
function handlenormaldeath(lifeid, attacker, einflictor, objweapon, smeansofdeath, victim, iskillstreakweapon, var_642470e1abc1bbf9, var_c7944407e05a6f77, var_b9c265f657115663) {
    if (smeansofdeath == "MOD_GRENADE" && einflictor == attacker) {
        addattacker(victim, attacker, einflictor, objweapon, var_642470e1abc1bbf9.damage, (0, 0, 0), var_642470e1abc1bbf9.direction_vec, var_642470e1abc1bbf9.hitloc, var_642470e1abc1bbf9.psoffsettime, smeansofdeath);
    }
    var_642470e1abc1bbf9.dokillcam = 1;
    if (isai(victim) && isdefined(level.bot_funcs) && isdefined(level.bot_funcs["should_do_killcam"])) {
        var_642470e1abc1bbf9.dokillcam = victim [[ level.bot_funcs["should_do_killcam"] ]]();
    }
    if (istrue(level.disable_killcam) || istrue(victim.disable_killcam)) {
        var_642470e1abc1bbf9.dokillcam = 0;
    }
    attacker thread events::killedplayer(lifeid, self, objweapon, smeansofdeath, einflictor, var_642470e1abc1bbf9);
    if (isbulletdamage(smeansofdeath) || ismeleedamage(smeansofdeath) || function_102d677621400199(objweapon)) {
        attacker thread namespace_4925be476a433a59::function_4552872977024e34(victim);
    }
    if (!istrue(level.disablestattracking)) {
        self.var_f215f63a4834bb72 = isdefined(self.lastattackedshieldplayer) && isdefined(self.lastattackedshieldtime) && self.lastattackedshieldplayer != attacker;
        victim thread namespace_aad14af462a74d08::onplayerkilled(einflictor, attacker, var_642470e1abc1bbf9.damage, var_642470e1abc1bbf9.damageflags, smeansofdeath, objweapon, var_642470e1abc1bbf9.hitloc, attacker.modifiers);
        if (isdefined(level.var_90420335f9a84867)) {
            self [[ level.var_90420335f9a84867 ]](attacker, istrue(var_b9c265f657115663));
        }
        namespace_b919c4be206d3c80::function_6f792f70ffe4cd4d(attacker, victim);
        victim.pers["cur_death_streak"]++;
        if (smeansofdeath == "MOD_HEAD_SHOT") {
            attacker namespace_26e1361ab951ec6b::addtoplayerstat(1, "combatStats", "headshots");
            attacker stats::incpersstat("headshots", 1);
            attacker.headshots = attacker stats::getpersstat("headshots");
            attacker thread namespace_4925be476a433a59::function_f1b4726896f5c0c9();
            attacker thread namespace_4925be476a433a59::function_a4bd960925ab1205();
            switch (weaponclass(objweapon.basename)) {
            case #"hash_8cdaf2e4ecfe5b51":
                attacker stats::incpersstat("arHeadshots", 1);
                break;
            case #"hash_900cb96c552c5e8e":
                attacker stats::incpersstat("smgHeadshots", 1);
                break;
            case #"hash_690c0d6a821b42e":
                attacker stats::incpersstat("shotgunHeadshots", 1);
                break;
            case #"hash_fa24dff6bd60a12d":
                attacker stats::incpersstat("lmgHeadshots", 1);
                break;
            case #"hash_6191aaef9f922f96":
                attacker stats::incpersstat("sniperHeadshots", 1);
                break;
            case #"hash_61e969dacaaf9881":
                attacker stats::incpersstat("launcherHeadshots", 1);
                break;
            case #"hash_719417cb1de832b6":
                attacker stats::incpersstat("pistolHeadshots", 1);
                break;
            }
        }
        if (isdefined(einflictor) && istrue(einflictor.isequipment)) {
            switch (einflictor.equipmentref) {
            case #"hash_8c7819f0a3fbd1e0":
                attacker stats::incpersstat("fragKills", 1);
                break;
            case #"hash_f0907f858c134cb4":
                attacker stats::incpersstat("semtexKills", 1);
                break;
            case #"hash_142a787e36d7d7ce":
                attacker stats::incpersstat("molotovKills", 1);
                break;
            case #"hash_2354208d9af64220":
                attacker stats::incpersstat("claymoreKills", 1);
                break;
            case #"hash_184d8c620fb78060":
            case #"hash_9ba0a6ff6081954e":
            case #"hash_acc752b9cde2ff4f":
                attacker stats::incpersstat("throwingKnifeKills", 1);
                attacker namespace_883b0db1d686c37e::addthrowingknifecharge();
                break;
            case #"hash_4320d77f90725183":
                attacker stats::incpersstat("c4Kills", 1);
                break;
            case #"hash_de4641ddbc44a7ba":
                attacker stats::incpersstat("thermiteKills", 1);
                break;
            case #"hash_3995658e01f4fac1":
                attacker stats::incpersstat("proximityMineKills", 1);
                break;
            }
        }
    }
    if (isdefined(einflictor) && istrue(einflictor.var_26fb072855fd4772)) {
        return;
    }
    var_10e1ef8c47f876d8 = function_57803ce293ce78c4(objweapon.basename);
    thread handlenormaldeath_sounds(attacker, victim, smeansofdeath, einflictor, var_10e1ef8c47f876d8, objweapon);
    var_d2db6cb7f6d5d36d = attacker;
    if (isdefined(attacker.commanding_bot)) {
        var_d2db6cb7f6d5d36d = attacker.commanding_bot;
    }
    if (!istrue(var_c7944407e05a6f77) && !isfriendlyfire(victim, attacker)) {
        attacker function_213650502f1ed86f(victim);
    }
    if (!istrue(level.disablestattracking)) {
        namespace_969918091e5d9483::function_5a82c337b996baa5(6, 0);
        if (isplayer(attacker) && !namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon.basename)) {
            attacker namespace_969918091e5d9483::function_1882f80b14421089(6, 1);
            consecutiveKills = attacker.var_1a34ed8eb5c6e9c[6];
            if (!(consecutiveKills % 5)) {
                if (!game_utility::isBRStyleGameType()) {
                    namespace_31d46e80f376f2f7::function_7d42d3f8dd68280c(13, attacker.team, attacker getentitynumber(), consecutiveKills);
                }
            }
        }
    }
    if (!istrue(var_d2db6cb7f6d5d36d.pers["ignoreWeaponMatchBonus"]) && (weapon::iscacprimaryweapon(objweapon) || weapon::iscacsecondaryweapon(objweapon))) {
        if (!isdefined(var_d2db6cb7f6d5d36d.pers["weaponMatchBonusKills"])) {
            var_d2db6cb7f6d5d36d.pers["weaponMatchBonusKills"] = 1;
        } else {
            var_d2db6cb7f6d5d36d.pers["weaponMatchBonusKills"]++;
        }
        if (var_d2db6cb7f6d5d36d.pers["weaponMatchBonusKills"] > weaponrank::getgametypekillspermatchmaximum()) {
            var_d2db6cb7f6d5d36d.pers["ignoreWeaponMatchBonus"] = 1;
            var_d2db6cb7f6d5d36d.pers["weaponMatchBonusKills"] = undefined;
            var_d2db6cb7f6d5d36d.pers["killsPerWeapon"] = undefined;
        } else {
            if (!isdefined(var_d2db6cb7f6d5d36d.pers["killsPerWeapon"])) {
                var_d2db6cb7f6d5d36d.pers["killsPerWeapon"] = [];
            }
            rootname = weapon::getweaponrootname(objweapon);
            var_b590dd50c4fe1f77 = 0;
            foreach (var_5dc27a5bf459c504, data in var_d2db6cb7f6d5d36d.pers["killsPerWeapon"]) {
                if (var_5dc27a5bf459c504 == rootname) {
                    data.killcount++;
                    var_b590dd50c4fe1f77 = 1;
                    break;
                }
            }
            if (!var_b590dd50c4fe1f77) {
                data = spawnstruct();
                data.killcount = 1;
                data.basename = objweapon.basename;
                data.orderindex = var_d2db6cb7f6d5d36d.pers["killsPerWeapon"].size;
                var_d2db6cb7f6d5d36d.pers["killsPerWeapon"][rootname] = data;
            }
        }
    }
    var_90ab65120e5446c7 = attacker.pers["cur_kill_streak"];
    if (!istrue(level.ignorescoring) && (isalive(attacker) || isdefined(attacker.streaktype) && attacker.streaktype == "support")) {
        if (smeansofdeath == "MOD_MELEE" && !attacker killstreak::isjuggernaut() || attacker killstreak::killshouldaddtokillstreak(objweapon)) {
            attacker registerkill(objweapon, smeansofdeath, 1, iskillstreakweapon);
        }
        if (attacker.pers["cur_kill_streak"] > attacker stats::getpersstat("longestStreak")) {
            attacker.pers["longestStreak"] = attacker.pers["cur_kill_streak"];
        }
    }
    attacker.pers["cur_death_streak"] = 0;
    if (!game_utility::runleanthreadmode()) {
        if (!istrue(level.ignorescoring) && attacker.pers["cur_kill_streak"] > attacker persistence::statgetchild("round", "killStreak")) {
            attacker persistence::statsetchild("round", "killStreak", attacker.pers["cur_kill_streak"]);
        }
        if (!istrue(level.ignorescoring) && attacker game_utility::onlinestatsenabled()) {
            if (attacker.pers["cur_kill_streak"] > attacker.bestlifetimekillstreak) {
                attacker namespace_26e1361ab951ec6b::setplayerstat(attacker.pers["cur_kill_streak"], "bestStats", "killStreak");
                attacker.bestlifetimekillstreak = attacker.pers["cur_kill_streak"];
            }
        }
    }
    if (istrue(level.var_1a2b600a06ec21f4.var_198508771f0592a9)) {
        attacker function_1306e8a08ab7bbab(victim, objweapon, einflictor, iskillstreakweapon);
    } else if (!istrue(iskillstreakweapon) && !weapon::iskillstreakvehicleinflictor(einflictor) || points::isforcekillstreakprogressweapon(objweapon)) {
        attacker thread events::killeventtextpopup(#"kill", 0);
        var_4d407fe4bf2c6305 = undefined;
        if (game_utility::isBRStyleGameType() && !flags::gameflag("prematch_done")) {
            var_4d407fe4bf2c6305 = 100;
        }
        var_4b5a99c16abfdfb1 = undefined;
        if (istrue(level.var_f60a3be40c34023d)) {
            var_4b5a99c16abfdfb1 = getdvarint(@"hash_defd7006efde9127", 100);
        }
        attacker thread points::doScoreEvent(#"kill", objweapon, var_4d407fe4bf2c6305, var_4b5a99c16abfdfb1, victim);
        attacker bounty::bountyincreasestreak();
        attacker bounty::bountycollect(victim.lastbounty, victim.origin);
    }
    scoresub = tweakables::gettweakablevalue("game", "deathpointloss");
    if (isdefined(level.gunshipplayer) && level.gunshipplayer == attacker) {
        level notify("ai_killed", self);
    }
    gamescore::_setplayerscore(self, gamescore::_getplayerscore(self) - scoresub);
    level notify("player_got_killstreak_" + attacker.pers["cur_kill_streak"], attacker);
    attacker notify("killed_enemy");
    if (isdefined(level.onnormaldeath) && isdefined(attacker.pers) && attacker.pers["team"] != "spectator" && !istrue(level.ignorescoring)) {
        [[ level.onnormaldeath ]](self, attacker, lifeid, smeansofdeath, objweapon, iskillstreakweapon);
    }
    if (!attacker utility::isusingremote()) {
        weaponlist = victim getweaponslistprimaries();
        var_5d4277e0c084de15 = 0;
        foreach (weapon in weaponlist) {
            if (weaponclass(weapon.basename) == "sniper") {
                var_5d4277e0c084de15 = 1;
                break;
            }
        }
        if (var_5d4277e0c084de15) {
            level thread namespace_20260f65229aa888::trysaylocalsound(attacker, #"hash_2ee580bbe139941a", undefined, 0.75);
        } else {
            level thread namespace_20260f65229aa888::trysaylocalsound(attacker, #"hash_29c83d721f765ab4", undefined, 0.75);
        }
    }
    var_5a127424b8df87b6 = undefined;
    switch (victim.loadoutarchetype) {
    case #"hash_98ff6f21872f18e0":
        var_5a127424b8df87b6 = "plr_killfirm_warfighter";
        break;
    }
    if (isdefined(var_5a127424b8df87b6)) {
        level thread namespace_20260f65229aa888::saytoself(attacker, var_5a127424b8df87b6, "plr_killfirm_generic", 0.75);
    }
    if (istrue(self.var_f215f63a4834bb72) && !istrue(level.disablestattracking)) {
        var_6d6b794a7b5386a0 = getdvarint(@"hash_89c66b6f125f4f6", 2500);
        if (var_642470e1abc1bbf9.deathtime - self.lastattackedshieldtime < var_6d6b794a7b5386a0) {
            self.lastattackedshieldplayer thread gamescore::processshieldassist(self);
        } else if (isalive(self.lastattackedshieldplayer) && var_642470e1abc1bbf9.deathtime - self.lastattackedshieldtime < 5000) {
            forwardvec = vectornormalize(anglestoforward(self.angles));
            var_5a1dae383f6c2bde = vectornormalize(self.lastattackedshieldplayer.origin - self.origin);
            if (vectordot(var_5a1dae383f6c2bde, forwardvec) > 0.925) {
                self.lastattackedshieldplayer thread gamescore::processshieldassist(self);
            } else {
                self.lastattackedshieldplayer namespace_e8a49b70d0769b66::function_5a687b65c904b197(attacker, self, attacker.team);
            }
        } else {
            self.lastattackedshieldplayer namespace_e8a49b70d0769b66::function_5a687b65c904b197(attacker, self, attacker.team);
        }
    }
    if (!game_utility::runleanthreadmode()) {
        gamescore::awardbuffdebuffassists(attacker, self);
    }
    var_986a03ff4ba86052 = 1;
    if (!istrue(level.disablestattracking) && isdefined(self.attackers)) {
        var_ae089731ca00d639 = 0;
        if (istrue(level.var_1a2b600a06ec21f4.var_198508771f0592a9)) {
            var_ae089731ca00d639 = level.var_1a2b600a06ec21f4.var_ae089731ca00d639 * 1000;
        }
        foreach (player in self.attackers) {
            if (isdefined(level.assists_disabled)) {
                continue;
            }
            if (!isdefined(_validateattacker(player))) {
                continue;
            }
            if (player == attacker) {
                continue;
            }
            if (self == player) {
                continue;
            }
            attackerdata = self.attackerdata[player.guid];
            /#
                assert(isdefined(attackerdata));
            #/
            assistweapon = attackerdata.objweapon;
            if (istrue(level.var_1a2b600a06ec21f4.var_198508771f0592a9)) {
                if (istrue(self.inlaststand)) {
                    if (attackerdata.lasttimedamaged < self.laststandstarttime) {
                        var_5a52fa5c572f20b5 = self.laststandstarttime - attackerdata.lasttimedamaged;
                        if (var_5a52fa5c572f20b5 > var_ae089731ca00d639) {
                            continue;
                        }
                    }
                    goto LOC_00000fee;
                }
                var_5a52fa5c572f20b5 = var_642470e1abc1bbf9.deathtime - attackerdata.lasttimedamaged;
                jumpiffalse(var_5a52fa5c572f20b5 > var_ae089731ca00d639) LOC_00000fee;
            } else {
            LOC_00000fee:
                if (!(istrue(var_b9c265f657115663) && isdefined(self.laststandattacker) && player == self.laststandattacker)) {
                    var_54351d786449ee9e = 0;
                    if (isdefined(attackerdata.damage)) {
                        if (attackerdata.damage >= 70) {
                            var_54351d786449ee9e = 2;
                        } else if (attackerdata.damage >= 35) {
                            var_54351d786449ee9e = 1;
                        }
                    }
                    player thread gamescore::processassist(self, assistweapon, var_54351d786449ee9e);
                }
                var_986a03ff4ba86052 = 0;
                if (isdefined(player.super)) {
                    if (player.super.staticdata.ref == "super_battlerage") {
                        player battlerage::function_3f783a5aca22152d();
                    }
                }
                if (!isdefined(player.equipment)) {
                    player.equipment = [];
                }
                if (isdefined(player.equipment["secondary"]) && player.equipment["secondary"] == "equip_battlerage") {
                    if (istrue(player.var_808d06ddfc93a4e4)) {
                        player battlerage::function_9e87f6624dd929f1();
                    }
                }
                if (player perk::_hasperk("specialty_boom")) {
                    victim thread namespace_30a6d7a07831c1e2::setboominternal(player);
                }
            }
        }
    }
    if (isdefined(attacker.pers["soloKills"]) && var_986a03ff4ba86052 && attacker.team != victim.team) {
        attacker stats::incpersstat("soloKills", 1);
    }
    if (isdefined(self.markedbyboomperk) && !istrue(level.disablestattracking)) {
        foreach (player in level.players) {
            if (player.team == self.team) {
                continue;
            }
            if (utility::array_contains(self.attackers, player)) {
                continue;
            }
            if (utility::array_contains_key(self.markedbyboomperk, player player::getuniqueid())) {
                player thread gamescore::processassist(self, objweapon);
            }
        }
    }
    if (level.teambased) {
        if (isdefined(attacker.team) && isdefined(level.uavmodels) && isdefined(level.uavmodels[attacker.team]) && level.uavmodels[attacker.team].size > 0) {
            var_543ee40d273786c8 = [];
            foreach (uav in level.uavmodels[attacker.team]) {
                if (isdefined(uav) && isdefined(uav.owner) && uav.owner != attacker && !utility::array_contains(var_543ee40d273786c8, uav.uavtype)) {
                    eventname = function_2ef675c13ca1c4af(function_1823ff50bb28148d(uav.uavtype), "_assist");
                    var_91185ff4a2e16a72 = undefined;
                    if (!isdefined(uav.assistsgiven)) {
                        uav.assistsgiven = 0;
                    }
                    var_ccfe1eb50c191e67 = utility::ter_op(uav.uavtype == "directional_uav", 15, 10);
                    if (uav.assistsgiven < var_ccfe1eb50c191e67) {
                        uav.owner thread points::doScoreEvent(eventname, undefined, var_91185ff4a2e16a72, undefined, undefined, undefined, undefined, undefined, uav.streakinfo);
                    } else {
                        uav.owner thread points::givexpwithtext(eventname, var_91185ff4a2e16a72);
                    }
                    uav.assistsgiven++;
                    switch (uav.uavtype) {
                    case #"hash_634b246c3da5c56f":
                        uav.owner stats::incpersstat("killstreakUAVAssists", 1);
                        break;
                    case #"hash_10e585c25e7e9f60":
                        uav.owner stats::incpersstat("killstreakCUAVAssists", 1);
                        break;
                    case #"hash_e171e5b86ef0a4cc":
                        uav.owner stats::incpersstat("killstreakAUAVAssists", 1);
                        break;
                    }
                    var_543ee40d273786c8[var_543ee40d273786c8.size] = uav.uavtype;
                    challenges::processuavassist(uav.owner, uav.uavtype);
                    uav.owner script::bufferednotify("update_uav_assist_buffered");
                    uav.owner combatrecordkillstreakstat(uav.uavtype);
                }
            }
        }
        if (isdefined(level.supportdrones) && level.supportdrones.size > 0) {
            foreach (drone in level.supportdrones) {
                if (level.teambased && drone.team == attacker.team && drone.owner != attacker) {
                    if (isdefined(drone.enemiesmarked) && isdefined(drone.enemiesmarked[self getentitynumber()])) {
                        drone.owner thread points::doScoreEvent(function_2ef675c13ca1c4af(function_1823ff50bb28148d(drone.streakinfo.streakname), "_assist"));
                    }
                }
                if (drone.helperdronetype == "scrambler_drone_guard") {
                    if (level.teambased && drone.team == attacker.team && drone.owner != attacker) {
                        eventname = function_2ef675c13ca1c4af(function_1823ff50bb28148d(drone.streakinfo.streakname), "_assist");
                        if (!isdefined(drone.assistsgiven)) {
                            drone.assistsgiven = 0;
                        }
                        if (drone.assistsgiven < 10) {
                            drone.owner thread points::doScoreEvent(eventname, undefined, undefined, undefined, undefined, undefined, undefined, undefined, drone.streakinfo);
                        } else {
                            drone.owner thread points::givexpwithtext(eventname);
                        }
                        drone.assistsgiven++;
                        drone.owner stats::incpersstat("killstreakCUAVAssists", 1);
                    }
                }
            }
        }
        binoculars::binoculars_giveassistpoints(attacker, self);
        if (isdefined(attacker.team) && isdefined(level.activewpzones) && level.activewpzones.size > 0) {
            var_b16682794bb72308 = level.activewpzones[0];
            var_bfb78b87a67e2eb9 = var_b16682794bb72308.owner;
            var_a9be838ef5e091ef = var_b16682794bb72308.team;
            if (attacker.team == var_a9be838ef5e091ef && attacker != var_bfb78b87a67e2eb9) {
                if (istrue(victim.wpdisorient) || istrue(victim.wpburning)) {
                    eventname = #"hash_213b00973af47f5e";
                    if (!isdefined(var_b16682794bb72308.assistsgiven)) {
                        var_b16682794bb72308.assistsgiven = 0;
                    }
                    if (var_b16682794bb72308.assistsgiven < 15) {
                        var_bfb78b87a67e2eb9 thread points::doScoreEvent(eventname, undefined, undefined, undefined, undefined, undefined, undefined, undefined, var_b16682794bb72308.streakinfo);
                    } else {
                        var_bfb78b87a67e2eb9 thread points::givexpwithtext(eventname);
                    }
                    var_b16682794bb72308.assistsgiven++;
                    var_bfb78b87a67e2eb9 stats::incpersstat("killstreakWhitePhosphorousKillsAssists", 1);
                }
            }
        }
    }
    if (isplayer(attacker)) {
        function_b908a35b0981168e();
        if (!function_e42efe66fa95ca55()) {
            attacker setclientomnvar("ui_killed_player", self getentitynumber());
            attacker setclientomnvar("ui_killed_player_notify", var_642470e1abc1bbf9.deathtime);
        }
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11beb
// Size: 0x73
function function_213650502f1ed86f(victim) {
    var_d2db6cb7f6d5d36d = self;
    if (!istrue(level.ignorescoring)) {
        var_d2db6cb7f6d5d36d playerincrementscoreboardkills();
        if (isbehindmeleevictim(var_d2db6cb7f6d5d36d, victim)) {
            var_d2db6cb7f6d5d36d incpersstat("killsFromBehind", 1);
            victim incpersstat("deathsFromBehind", 1);
        }
    } else if (isdefined(level.prematchaddkillfunc)) {
        var_d2db6cb7f6d5d36d [[ level.prematchaddkillfunc ]]();
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c65
// Size: 0x8c
function playerincrementscoreboardkills() {
    var_d2db6cb7f6d5d36d = self;
    if (!namespace_36f464722d326bbe::function_d04af493b6e718ac()) {
        var_d2db6cb7f6d5d36d namespace_26e1361ab951ec6b::addtoplayerstat(1, "combatStats", "kills");
    }
    if (var_d2db6cb7f6d5d36d stats::getpersstat("kills") < 14999) {
        var_d2db6cb7f6d5d36d stats::incpersstat("kills", 1);
        var_d2db6cb7f6d5d36d.kills = var_d2db6cb7f6d5d36d stats::getpersstat("kills");
        var_d2db6cb7f6d5d36d persistence::statsetchild("round", "kills", var_d2db6cb7f6d5d36d.kills, level.ignorekdrstats);
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11cf8
// Size: 0x1c3
function function_1306e8a08ab7bbab(victim, objweapon, einflictor, iskillstreakweapon) {
    if (istrue(einflictor.isequipment)) {
        /#
            assertex(isdefined(einflictor.equipmentref), "Using equipment with undefined equipmentRef");
        #/
        var_85a1e8b6a105e2bb = level.equipment.table[einflictor.equipmentref].bundle;
        scoreevent = var_85a1e8b6a105e2bb.var_9676cbc72225d61c;
        if (isdefined(scoreevent)) {
            thread points::doScoreEvent(scoreevent, objweapon, undefined, undefined, victim);
            return;
        }
    } else if (istrue(einflictor.issuper)) {
        /#
            assertex(isdefined(einflictor.equipmentref), "Using super with undefined equipmentRef");
        #/
        var_19c643069b108770 = level.superglobals.staticsuperdata["super_" + einflictor.equipmentref].bundle;
        scoreevent = var_19c643069b108770.var_9676cbc72225d61c;
        if (isdefined(scoreevent)) {
            thread points::doScoreEvent(scoreevent, objweapon, undefined, undefined, victim);
            return;
        }
    } else if (istrue(iskillstreakweapon)) {
        /#
            assertex(isdefined(einflictor.streakinfo), "Using scorestreak with undefined streakInfo");
        #/
        var_cbab602e6919aad7 = level.var_b23156d776b1d85.var_38f2a11237246ac[einflictor.streakinfo.streakname];
        scoreevent = var_cbab602e6919aad7.var_9676cbc72225d61c;
        if (isdefined(scoreevent)) {
            thread points::doScoreEvent(scoreevent, objweapon, undefined, undefined, victim);
            return;
        }
    }
    thread points::doScoreEvent(#"hash_49ee3d646e1fd20f", objweapon, undefined, undefined, victim);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ec2
// Size: 0x6b
function callback_playerkilled(inflictor, attacker, damage, damageflags, meansofdeath, objweapon, direction_vec, hitloc, psoffsettime, deathanimduration) {
    playerkilled_internal(inflictor, attacker, self, damage, damageflags, meansofdeath, objweapon, direction_vec, hitloc, psoffsettime, deathanimduration, 0);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f34
// Size: 0x48
function launchshield(damage, meansofdeath) {
    if (riotshield::riotshield_hasweapon()) {
        if (isdefined(self.riotshieldmodel)) {
            riotshield::riotshield_detach(1);
        }
        if (isdefined(self.riotshieldmodelstowed)) {
            riotshield::riotshield_detach(0);
        }
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f83
// Size: 0x5f
function resetplayervariables() {
    self.switching_teams = undefined;
    self.joining_team = undefined;
    self.leaving_team = undefined;
    self.pers["cur_kill_streak"] = 0;
    thread namespace_6b49ddb858f34366::function_d8eb5fb3b35ed1a1();
    self.killcountthislife = 0;
    self.laststandattacker = undefined;
    self.laststandattackermodifiers = undefined;
    gameobjects::detachusemodels();
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11fe9
// Size: 0x24
function resetplayeromnvarsonspawn() {
    namespace_66c176d3c67cc0c2::resetuiomnvarscommon();
    self setclientomnvar("ui_life_kill_count", 0);
    self setclientomnvar("ui_shrapnel_overlay", 0);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x12014
// Size: 0x43a
function hitlocdebug(attacker, victim, damage, hitloc, dflags) {
    colors = [];
    colors[0] = 2;
    colors[1] = 3;
    colors[2] = 5;
    colors[3] = 7;
    if (!getdvarint(@"hash_8662c4d785d46fd6")) {
        return;
    }
    if (!isdefined(attacker.hitlocinited)) {
        for (i = 0; i < 6; i++) {
            attacker setclientdvar(function_2ef675c13ca1c4af(@"hash_3dd1dde9508849d5", utility::string(i)), "");
        }
        attacker.hitlocinited = 1;
    }
    if (level.splitscreen || !isplayer(attacker)) {
        return;
    }
    var_f2f77b9518946235 = 6;
    if (!isdefined(attacker.damageinfo)) {
        attacker.damageinfo = [];
        for (i = 0; i < var_f2f77b9518946235; i++) {
            attacker.damageinfo[i] = spawnstruct();
            attacker.damageinfo[i].damage = 0;
            attacker.damageinfo[i].hitloc = "";
            attacker.damageinfo[i].bp = 0;
            attacker.damageinfo[i].colorindex = 0;
        }
        attacker.damageinfocolorindex = 0;
        attacker.damageinfovictim = undefined;
    }
    for (i = var_f2f77b9518946235 - 1; i > 0; i--) {
        attacker.damageinfo[i].damage = attacker.damageinfo[i - 1].damage;
        attacker.damageinfo[i].hitloc = attacker.damageinfo[i - 1].hitloc;
        attacker.damageinfo[i].bp = attacker.damageinfo[i - 1].bp;
        attacker.damageinfo[i].colorindex = attacker.damageinfo[i - 1].colorindex;
    }
    attacker.damageinfo[0].damage = damage;
    attacker.damageinfo[0].hitloc = hitloc;
    attacker.damageinfo[0].bp = dflags & 8;
    if (isdefined(attacker.damageinfovictim) && attacker.damageinfovictim != victim) {
        attacker.damageinfocolorindex++;
        if (attacker.damageinfocolorindex == colors.size) {
            attacker.damageinfocolorindex = 0;
        }
    }
    attacker.damageinfovictim = victim;
    attacker.damageinfo[0].colorindex = attacker.damageinfocolorindex;
    for (i = 0; i < var_f2f77b9518946235; i++) {
        color = "^" + colors[attacker.damageinfo[i].colorindex];
        if (attacker.damageinfo[i].hitloc != "") {
            val = color + attacker.damageinfo[i].hitloc;
            if (attacker.damageinfo[i].bp) {
                val = val + " (BP)";
            }
            attacker setclientdvar(function_2ef675c13ca1c4af(@"hash_3dd1dde9508849d5", utility::string(i)), val);
        }
        attacker setclientdvar(function_2ef675c13ca1c4af(@"hash_9df3a18be699b19d", utility::string(i)), color + attacker.damageinfo[i].damage);
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12455
// Size: 0x33
function giverecentshieldxp() {
    self endon("death_or_disconnect");
    self notify("giveRecentShieldXP");
    self endon("giveRecentShieldXP");
    self.recentshieldxp++;
    wait(20);
    self.recentshieldxp = 0;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1248f
// Size: 0x71
function updateinflictorstat(einflictor, eattacker, sweapon, otherent) {
    if (!isdefined(einflictor) || !isdefined(einflictor.alreadyhit) || !einflictor.alreadyhit || !weapon::issinglehitweapon(sweapon)) {
        gamelogic::setinflictorstat(einflictor, eattacker, sweapon);
    }
    if (isdefined(einflictor)) {
        einflictor.alreadyhit = 1;
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12507
// Size: 0x5f9
function addattacker(victim, eattacker, einflictor, objweapon, idamage, vpoint, vdir, shitloc, psoffsettime, smeansofdeath, var_1da1a66b5c6a06a7) {
    if (!isdefined(eattacker.guid) && (isagent(eattacker) || isplayer(eattacker))) {
        eattacker.guid = eattacker namespace_7e17181d03156026::getuniqueid();
    }
    if (!isdefined(eattacker.guid)) {
        return;
    }
    if (!isdefined(victim.attackerdata)) {
        victim.attackerdata = [];
    }
    currenttime = gettime();
    if (!isdefined(victim.attackerdata[eattacker.guid])) {
        victim.attackers[eattacker.guid] = eattacker;
        victim.attackerdata[eattacker.guid] = spawnstruct();
        victim.attackerdata[eattacker.guid].damage = 0;
        victim.attackerdata[eattacker.guid].var_d69d6cc16d8b71fb = 0;
        victim.attackerdata[eattacker.guid].attackerent = eattacker;
        victim.attackerdata[eattacker.guid].firsttimedamaged = currenttime;
        victim.attackerdata[eattacker.guid].hitcount = 0;
    }
    attackerdata = victim.attackerdata[eattacker.guid];
    if (isdefined(level.var_b5224f533f8fffb0) && isdefined(level.var_b5224f533f8fffb0[objweapon.basename]) && isdefined(level.var_b5224f533f8fffb0[objweapon.basename][eattacker.guid])) {
        objweapon = level.var_b5224f533f8fffb0[objweapon.basename][eattacker.guid];
    }
    if (iscacprimaryweapon(objweapon) && !iscacsecondaryweapon(objweapon)) {
        attackerdata.diddamagewithprimary = 1;
    }
    if (isdefined(smeansofdeath) && smeansofdeath != "MOD_MELEE") {
        attackerdata.didnonmeleedamage = 1;
    }
    var_11d2f075e9a0e643 = weapon::getequipmenttype(objweapon);
    if (isdefined(var_11d2f075e9a0e643)) {
        if (var_11d2f075e9a0e643 == "lethal") {
            attackerdata.diddamagewithlethalequipment = 1;
        }
        if (var_11d2f075e9a0e643 == "tactical") {
            attackerdata.diddamagewithtacticalequipment = 1;
        }
    }
    idamage = function_53c4c53197386572(idamage, 0);
    var_1da1a66b5c6a06a7 = function_53c4c53197386572(var_1da1a66b5c6a06a7, 0);
    if (isdefined(smeansofdeath) && smeansofdeath == "MOD_SUICIDE") {
        totalhealth = victim.maxhealth + function_53c4c53197386572(victim.armorhealth, 0) + var_1da1a66b5c6a06a7;
    } else {
        totalhealth = victim.health + function_53c4c53197386572(victim.armorhealth, 0) + var_1da1a66b5c6a06a7;
    }
    totaldamage = idamage + var_1da1a66b5c6a06a7;
    var_d69d6cc16d8b71fb = ter_op(totaldamage > totalhealth, totalhealth, totaldamage);
    attackerdata namespace_4887422e77f3514e::function_f74c4c476c9489f6();
    attackerdata.hitcount++;
    attackerdata.damage = attackerdata.damage + totaldamage;
    attackerdata.var_d69d6cc16d8b71fb = attackerdata.var_d69d6cc16d8b71fb + var_d69d6cc16d8b71fb;
    attackerdata.objweapon = objweapon;
    attackerdata.vpoint = vpoint;
    attackerdata.vdir = vdir;
    attackerdata.shitloc = shitloc;
    attackerdata.psoffsettime = psoffsettime;
    attackerdata.smeansofdeath = smeansofdeath;
    attackerdata.attackerent = eattacker;
    attackerdata.lasttimedamaged = currenttime;
    attackerdata.inflictor = einflictor;
    attackerdata.var_4ce88b2dfe0bfa52 = istrue(victim.var_4ce88b2dfe0bfa52);
    if (!isdefined(attackerdata.var_282f568e901445ce)) {
        attackerdata.var_282f568e901445ce = [];
    }
    var_22de319bdc95fea2 = "none";
    var_1189bd7fbe2861f8 = namespace_1a507865f681850e::getequipmentreffromweapon(objweapon);
    if (isdefined(var_1189bd7fbe2861f8)) {
        var_22de319bdc95fea2 = var_1189bd7fbe2861f8;
    } else if (namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon)) {
        var_22de319bdc95fea2 = namespace_a2f809133c566621::getkillstreaknamefromweapon(objweapon);
    } else if (isdefined(smeansofdeath) && (smeansofdeath == "MOD_FALLING" || smeansofdeath == "MOD_CRUSH" || smeansofdeath == "MOD_MELEE" || smeansofdeath == "MOD_EXECUTION")) {
        var_22de319bdc95fea2 = smeansofdeath;
    } else if (istrue(victim.islaststandbleedoutdmg) || istrue(victim.var_1cae08f4d3d931c1) || istrue(victim.var_4ce88b2dfe0bfa52)) {
        var_22de319bdc95fea2 = "BLEED_TICK";
    } else if (isdefined(smeansofdeath) && smeansofdeath == "MOD_EXPLOSIVE" && isdefined(einflictor) && einflictor.code_classname == "scriptable") {
        var_22de319bdc95fea2 = "ENV_EXPLOSIVE";
    } else if (namespace_68e641469fde3fa7::isbombsiteweapon(objweapon)) {
        var_22de319bdc95fea2 = "BOMB_SITE";
    } else if (istrue(victim.var_93532ea94accabdb)) {
        var_22de319bdc95fea2 = "OOB";
    } else if (isdefined(objweapon.basename)) {
        var_22de319bdc95fea2 = objweapon.basename;
    }
    if (!isdefined(attackerdata.var_282f568e901445ce[var_22de319bdc95fea2])) {
        attackerdata.var_282f568e901445ce[var_22de319bdc95fea2] = 1;
    }
    attackerdata.var_8519cf56b38d717d = var_22de319bdc95fea2;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b07
// Size: 0x299
function addattackerkillstreak(victim, idamage, eattacker, vdir, vpoint, smeansofdeath, modelname, tagname, partname, idflags, sweapon) {
    if (!isdefined(victim.attackerdata)) {
        victim.attackerdata = [];
    }
    if (!isdefined(victim.attackerdata[eattacker.guid])) {
        victim.attackers[eattacker.guid] = eattacker;
        victim.attackerdata[eattacker.guid] = spawnstruct();
        victim.attackerdata[eattacker.guid].damage = 0;
        victim.attackerdata[eattacker.guid].attackerent = eattacker;
        victim.attackerdata[eattacker.guid].firsttimedamaged = gettime();
        victim.attackerdata[eattacker.guid].hitcount = 1;
    }
    victim.attackerdata[eattacker.guid] namespace_4887422e77f3514e::function_f74c4c476c9489f6();
    victim.attackerdata[eattacker.guid].damage = victim.attackerdata[eattacker.guid].damage + idamage;
    victim.attackerdata[eattacker.guid].vpoint = vpoint;
    victim.attackerdata[eattacker.guid].vdir = vdir;
    victim.attackerdata[eattacker.guid].partname = partname;
    victim.attackerdata[eattacker.guid].smeansofdeath = smeansofdeath;
    victim.attackerdata[eattacker.guid].attackerent = eattacker;
    victim.attackerdata[eattacker.guid].lasttimedamaged = gettime();
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12da7
// Size: 0x17
function resetattackerlist() {
    self.attackers = [];
    self.attackerdata = [];
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params f, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12dc5
// Size: 0xc2
function callback_playerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, var_b0fc59ff15058522, var_be4285b26ed99ab1) {
    var_8f8788fae5311b0a = gettime();
    callback_playerdamage_internal(einflictor, eattacker, self, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, var_b0fc59ff15058522, var_be4285b26ed99ab1);
    /#
        assertex(var_8f8788fae5311b0a == gettime(), "Damage internal callback happened over multiple frames");
    #/
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e8e
// Size: 0x1df
function function_f9237ec4a57b0ff9(eattacker, var_ba9dc00e6d5896dc, idamage, var_d7bc24cd73dfc712, objweapon, shitloc) {
    if (shouldrecorddamagestats(eattacker)) {
        eattacker stats::incpersstat("damage", var_ba9dc00e6d5896dc);
        if (isdefined(eattacker namespace_3c5a4254f2b957ea::getpersstat("friendlyDamageDone")) && self.team == eattacker.team) {
            eattacker stats::incpersstat("friendlyDamageDone", var_ba9dc00e6d5896dc);
        }
        if (!isdefined(eattacker.damagethisround)) {
            eattacker.damagethisround = var_ba9dc00e6d5896dc;
        } else {
            eattacker.damagethisround = eattacker.damagethisround + var_ba9dc00e6d5896dc;
        }
        if (eattacker != self && self.team != eattacker.team) {
            eattacker namespace_969918091e5d9483::function_d16498b27251da56(1, var_ba9dc00e6d5896dc);
            fullweaponname = getcompleteweaponname(objweapon);
            var_a1d4e7d5ef9da660 = min(self.health, idamage);
            eattacker thread gamelogic::threadedsetweaponstatbyname(fullweaponname, var_a1d4e7d5ef9da660, "damage", self);
        }
        if (shitloc == "head" && isdefined(eattacker namespace_3c5a4254f2b957ea::getpersstat("shotsHitHead"))) {
            eattacker stats::incpersstat("shotsHitHead", 1);
        }
        eattacker utility::trycall(level.matchdata_logweaponstat, weapon::getweaponrootname(objweapon), "damage", min(self.health, idamage), -1);
        weaponobj = weapon::mapweapon(objweapon);
        sweapon = getcompleteweaponname(weaponobj);
        eattacker thread gamelogic::threadedsetweaponstatbyname(sweapon, var_ba9dc00e6d5896dc, "damage_dealt");
    } else if (isdefined(level.onattackerdamagenottracked)) {
        eattacker [[ level.onattackerdamagenottracked ]](var_ba9dc00e6d5896dc);
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13074
// Size: 0x791
function finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, var_b2883531afa6b83d, flinch) {
    idamage = int(idamage);
    var_ba9dc00e6d5896dc = int(min(idamage, self.health));
    if (isdefined(eattacker) && isplayer(eattacker) && !function_483cc81bff18273b(eattacker)) {
        if (eattacker != self) {
            eattacker thread namespace_4925be476a433a59::function_e08012bdba393c79(objweapon, var_ba9dc00e6d5896dc);
            eattacker thread namespace_4925be476a433a59::function_f9b01f503cdbfd7d(var_ba9dc00e6d5896dc);
        }
        function_f9237ec4a57b0ff9(eattacker, var_ba9dc00e6d5896dc, idamage, var_d7bc24cd73dfc712, objweapon, shitloc);
    } else if (isdefined(einflictor) && einflictor vehicle::isvehicle()) {
        vehicle = einflictor;
        if (isdefined(vehicle.owner) && isplayer(vehicle.owner)) {
            function_f9237ec4a57b0ff9(vehicle.owner, var_ba9dc00e6d5896dc, idamage, var_d7bc24cd73dfc712, objweapon, shitloc);
        }
    }
    if (isplayer(self)) {
        thread namespace_4925be476a433a59::function_99b3339dca12abde(var_ba9dc00e6d5896dc);
    }
    if (isplayer(self) && shouldrecorddamagestats(self) && !function_483cc81bff18273b(self)) {
        weaponobj = self.lastdroppableweaponobj;
        weaponobj = weapon::mapweapon(weaponobj);
        sweapon = getcompleteweaponname(weaponobj);
        stats::incpersstat("damageTaken", var_ba9dc00e6d5896dc);
        thread gamelogic::threadedsetweaponstatbyname(sweapon, 1, "hit_markers_taken");
        thread gamelogic::threadedsetweaponstatbyname(sweapon, var_ba9dc00e6d5896dc, "damage_taken");
    }
    if (isdefined(einflictor) && isdefined(einflictor.streakinfo) && isdefined(einflictor.streakinfo.damage)) {
        einflictor.streakinfo.damage = einflictor.streakinfo.damage + idamage;
    }
    if (playershoulddofauxdeath() && idamage >= self.health && !(idflags & 16) && allowfauxdeath()) {
        if (!isdefined(vdir)) {
            vdir = (0, 0, 0);
        }
        if (!isdefined(eattacker)) {
            eattacker = self;
        }
        if (!isdefined(einflictor)) {
            einflictor = eattacker;
        }
        playerkilled_internal(einflictor, eattacker, self, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, 0, 1);
    } else {
        if (isdefined(self.var_5c11205f47af8b92)) {
            var_289c10e1777afae0 = idamage >= self.health;
            var_f0a50955d3420be9 = gettime() - self.var_5c11205f47af8b92 <= 1000 && riotshield::riotshield_hasweapon() && function_cd066c9463ad28c5(objweapon, smeansofdeath);
            var_ed364fc58a359515 = !utility::isusingremote();
            if (var_289c10e1777afae0 && var_f0a50955d3420be9 && var_ed364fc58a359515) {
                /#
                    iprintln("torso_upper" + self.name);
                #/
                self suicide();
                function_403e958ecd04f255(self, "forcing suicide on riot shield player");
                return;
            }
        }
        if (!callback_killingblow(einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime)) {
            function_403e958ecd04f255(self, "Callback_KillingBlow == false");
            return;
        }
        if (!isalive(self)) {
            function_403e958ecd04f255(self, "!IsAlive");
            return;
        }
        if (isplayer(self)) {
            if (!isdefined(partname)) {
                partname = "";
            }
            if (!isdefined(var_b2883531afa6b83d)) {
                var_b2883531afa6b83d = 0;
            }
            if (shoulduseexplosiveindicator(smeansofdeath)) {
                idflags = idflags | 256;
            }
            if (!isdefined(flinch)) {
                var_e9a18bdaf2a766e9 = smeansofdeath == "MOD_TRIGGER_HURT" && isdefined(self.islaststandbleedoutdmg);
                var_759752d90b530740 = smeansofdeath == "MOD_TRIGGER_HURT" && isdefined(objweapon) && objweapon.basename == "danger_circle_br";
                flinch = !var_e9a18bdaf2a766e9 && !var_759752d90b530740;
            }
            if (isdefined(eattacker) && isplayer(eattacker) && eattacker != self) {
                if (!isdefined(eattacker.var_198b774c93c48891)) {
                    eattacker.var_198b774c93c48891 = gettime();
                }
            }
            if (!isdefined(self.var_9691e7d8cde294f2)) {
                self.var_9691e7d8cde294f2 = gettime();
            }
            var_ed39daa6a02d755d = idamage >= self.health && !laststand::function_27d0ea02ed3cc35f(einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, 500);
            if (game_utility::isteamreviveenabled() && istrue(level.liveRagdollRevive) && var_ed39daa6a02d755d && (!istrue(level.var_46c429e667d32f63) || istrue(teams::getteamdata(self.team, "noRespawns")))) {
                if (istrue(self.inlaststand)) {
                    self laststandrevive();
                }
                self notify("enter_live_ragdoll");
                idamage = self.health - 1;
                /#
                    println("EXE/PLAYERKICKED_TEAMKILLS" + gettime() + "havoc" + self.name + "neck" + self.health + "suicideGrenadeKill" + idamage + "specialty_pistoldeath");
                #/
                self finishplayerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime, 0, modelindex, partname, var_b2883531afa6b83d, flinch, var_d7bc24cd73dfc712);
                /#
                    println("EXE/PLAYERKICKED_TEAMKILLS" + gettime() + "havoc" + self.name + "hitarmormaxplatebreak" + self.health + "kill");
                #/
                if (isdefined(einflictor) && isdefined(eattacker)) {
                    self function_aa7cfaf65f9b354(einflictor, eattacker);
                }
                player::_freezecontrols(1, undefined, "liveRagdoll");
                self sethidenameplate(1);
                self.healthregendisabled = 1;
                self.liveRagdoll = 1;
                self function_6b4c8718bc36d1ef(1);
                self function_e4ccd01fb7ec7a6f(1);
                self function_360874d9808f0724();
                class::function_c5ce8711741e44b8();
                if (!isdefined(einflictor) && !isdefined(eattacker)) {
                    einflictor = self;
                    eattacker = self;
                }
                thread playerkilled_internal(einflictor, eattacker, self, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, 500, 0);
                if (getdvarint(@"hash_8dab2b41a06260c6", 0) == 1) {
                    self notify("death");
                    self notify("death_or_disconnect");
                    if (game_utility::function_ba5574c7f287c587()) {
                        var_16c2d930984f2fef = self isreloading();
                        if (var_16c2d930984f2fef) {
                            var_5814d27874b48e54 = spawnstruct();
                            var_5814d27874b48e54.player = self;
                            var_5814d27874b48e54.var_c739ba1eb6635b73 = getsystemtimeinmicroseconds();
                            var_5814d27874b48e54.var_c198f7ca473378fb = "DEATH";
                            namespace_c45ac99c4997e722::function_80820d6d364c1836("callback_on_reload_cancel", var_5814d27874b48e54);
                        }
                    }
                }
            } else if (istrue(level.ob_pvpve) && !istrue(self.liveRagdoll) && var_ed39daa6a02d755d) {
                self notify("last_stand_bleedout");
            } else {
                self finishplayerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime, 0, modelindex, partname, var_b2883531afa6b83d, flinch, var_d7bc24cd73dfc712);
            }
        }
    }
    if (smeansofdeath == "MOD_EXPLOSIVE_BULLET") {
        namespace_cc0f9da8a00806f6::_shellshock("damage_mp", "damage", getdvarfloat(@"hash_6dc396ffe00e3bf6"), 0, 0);
    }
    damageshellshockandrumble(einflictor, objweapon, smeansofdeath, idamage, idflags, eattacker);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1380c
// Size: 0x34
function shoulduseexplosiveindicator(smeansofdeath) {
    return smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_EXPLOSIVE" || smeansofdeath == "MOD_FIRE";
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13848
// Size: 0x57
function callback_playerimpaled(eattacker, objweapon, var_f98a651c69c13cba, vpoint, vdir, shitloc, var_920ff4456ce9a2fc, var_19f6f25777706f34) {
    thread weapons::impale(eattacker, self, objweapon, var_f98a651c69c13cba, vpoint, vdir, shitloc, var_920ff4456ce9a2fc, var_19f6f25777706f34);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138a6
// Size: 0x24
function allowfauxdeath() {
    if (!isdefined(level.allowfauxdeath)) {
        level.allowfauxdeath = 1;
    }
    return level.allowfauxdeath;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138d2
// Size: 0x80c
function callback_playerlaststand(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration) {
    var_6d8f177c77496430 = isforcedlaststand(self, einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc);
    var_4a823a0c8e9adbb7 = laststand::function_27d0ea02ed3cc35f(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration);
    if (!var_6d8f177c77496430 && !var_4a823a0c8e9adbb7) {
        return 0;
    }
    if (isdefined(attacker) && isplayer(attacker) && attacker != self && !istrue(attacker.gulag) && !istrue(level.var_fdb13ccd60afe05c)) {
        attacker thread hud_message::showsplash("br_enemy_downed", undefined, self);
    }
    if (isdefined(level.parachuteprelaststandfunc)) {
        self [[ level.parachuteprelaststandfunc ]]();
    }
    if (self isskydiving()) {
        self skydive_interrupt();
    }
    lifeid = self.matchdatalifeindex;
    if (!isdefined(lifeid)) {
        lifeid = level.maxlives - 1;
    }
    if (game_utility::isBRStyleGameType()) {
        if (!isdefined(self.var_b20aa75935d85708)) {
            self.var_b20aa75935d85708 = 0;
        }
        self.var_b20aa75935d85708++;
    }
    var_5b5deaccb6cc0f8a = 0;
    if (isdefined(attacker) && !(isdefined(attacker.classname) && attacker.classname == "worldspawn")) {
        if (isdefined(attacker.var_e7b48b5121285edd)) {
            attacker [[ attacker.var_e7b48b5121285edd ]](self);
        }
        if (!isplayer(attacker)) {
            if (isdefined(attacker.owner) && isplayer(attacker.owner)) {
                attacker = attacker.owner;
            } else if (isdefined(einflictor) && isdefined(einflictor.owner) && isplayer(einflictor.owner)) {
                attacker = einflictor.owner;
            }
        }
        var_642470e1abc1bbf9 = playerkilled_initdeathdata(einflictor, attacker, self, idamage, 0, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, 0);
        playerkilled_parameterfixup(var_642470e1abc1bbf9);
        playerkilled_precalc(var_642470e1abc1bbf9);
        var_642470e1abc1bbf9.laststandkill = 1;
        self.playergoingintols = 1;
        if (isplayer(attacker) && attacker != self) {
            self.laststandattacker = attacker;
            self.laststandmeansofdeath = var_642470e1abc1bbf9.meansofdeath;
            self.laststandweaponobj = objweapon;
            attacker thread events::function_b7f154368abbe463(self, objweapon, smeansofdeath, einflictor, var_642470e1abc1bbf9);
            self.laststandattackermodifiers = attacker.modifiers;
        }
        self.lastbounty = bounty::playergetbountypoints();
        bounty::playerresetbountypoints();
        bounty::playerresetbountystreak();
        var_642470e1abc1bbf9.isfriendlyfire = isfriendlyfire(self, attacker);
        if (getdvarint(@"hash_98f5c716d594181b", 1)) {
            self.laststanddowneddata = var_642470e1abc1bbf9;
        }
        if (istrue(level.var_1a2b600a06ec21f4.var_198508771f0592a9)) {
            self.laststanddowneddata = var_642470e1abc1bbf9;
            var_5771a98dbf346253 = istrue(einflictor.isequipment);
            var_a8f54da1cfb1dea0 = istrue(einflictor.issuper);
            if (var_5771a98dbf346253 || var_a8f54da1cfb1dea0) {
                var_bfcfdc8956ad23b0 = spawnstruct();
                var_bfcfdc8956ad23b0.isequipment = var_5771a98dbf346253;
                var_bfcfdc8956ad23b0.issuper = var_a8f54da1cfb1dea0;
                var_bfcfdc8956ad23b0.equipmentref = einflictor.equipmentref;
                self.laststanddowneddata.var_bfcfdc8956ad23b0 = var_bfcfdc8956ad23b0;
            }
        }
        if (!var_642470e1abc1bbf9.isfriendlyfire && attacker != self) {
            var_5b5deaccb6cc0f8a = 1;
            if (game_utility::isBRStyleGameType()) {
                if (isplayer(attacker) && attacker != self) {
                    if (!isbot(self)) {
                        attacker thread namespace_6b49ddb858f34366::function_ac584dc244d416b1();
                    }
                    attacker namespace_a548bd428a566cf3::incrementplayersdownedstat();
                    attacker thread rank::scoreeventpopup(#"downed");
                    killstreakweaponname = killstreak::getkillstreaknamefromweapon(objweapon);
                    if (isdefined(killstreakweaponname)) {
                        if (isdefined(attacker.var_3efdaabc0f66846d)) {
                            attacker.var_3efdaabc0f66846d++;
                        }
                    }
                    if (attacker ispcplayer() && flags::gameflag("prematch_done")) {
                        attacker setclientomnvar("nVidiaHighlights_events", 24);
                    }
                }
                if (attacker != self) {
                    brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
                    if (brgametype != "plunder" && brgametype != "risk" && brgametype != "kingslayer" && brgametype != "rumble_mgl" && level.teamdata[self.team]["alivePlayers"].size > 0 && isplayer(attacker)) {
                        var_f86da5d91524e369 = [];
                        if (isdefined(level.var_c5877dbe60fddbf6)) {
                            var_f86da5d91524e369 = level.var_c5877dbe60fddbf6;
                        }
                        var_f86da5d91524e369 = array_combine(var_f86da5d91524e369, level.teamdata[attacker.team]["alivePlayers"]);
                        obituary(self, attacker, objweapon, "MOD_DOWN", var_f86da5d91524e369);
                    }
                    overlord::function_d87d5deb069bf8e5("squad_down_enemy", level.teamdata[self.team]["alivePlayers"]);
                } else {
                    overlord::function_d87d5deb069bf8e5("squad_down_self", level.teamdata[self.team]["alivePlayers"]);
                }
                if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex) && namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() != "rumble_mgl") {
                    circle = min(max(1, level.br_circle.circleindex), 6);
                    event = function_2ef675c13ca1c4af(#"br_downEnemy_circle_", utility::string(circle));
                    if (rank::function_377a94f711d96927(event)) {
                        attacker thread points::doScoreEvent(event, objweapon);
                    }
                }
            }
        }
    }
    brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    if (brgametype == "plunder" || brgametype == "risk") {
        br_plunder::plunder_allowallrepositoryuseforplayer(self, 0, 1);
    }
    if (game_utility::isBRStyleGameType()) {
        namespace_9cb8bb5897c3d5b2::branalytics_down(attacker, self, objweapon, "downed", smeansofdeath);
        if (smeansofdeath == "MOD_CRUSH" && isdefined(einflictor.classname) && einflictor.classname == "script_vehicle") {
            playsoundatpos(self.origin + (0, 0, 18), "vehicle_body_hit");
        }
    }
    if (namespace_a548bd428a566cf3::isBrPracticeMode()) {
        if (isdefined(attacker) && isplayer(attacker) && !isbot(attacker)) {
            attacker notify("enemy_in_laststand");
        }
    }
    if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "champion") {
        if (isdefined(attacker) && isdefined(attacker.team)) {
            level notify("down_enemy_laststand_" + attacker.team, attacker);
        }
    }
    if (isdefined(level.checkforlaststandwipe)) {
        if ([[ level.checkforlaststandwipe ]](self)) {
            self.playergoingintols = 0;
            return 0;
        }
    }
    if (isdefined(level.var_2d3ee92902ba30fa)) {
        self thread [[ level.var_2d3ee92902ba30fa ]]();
    } else {
        thread laststand::laststandthink();
    }
    if (isplayer(self)) {
        namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "player_knocked_down");
        if (isplayer(attacker)) {
            namespace_27c74152ccb91331::function_55b08d6d71b41402(attacker, "knocked_down_enemy");
        }
    }
    if (namespace_3e725f3cc58bddd3::playerkilled_washitbyvehicle(smeansofdeath, einflictor)) {
        einflictor notify("vehicle_downed_player");
    }
    if (var_5b5deaccb6cc0f8a && isdefined(attacker.guid)) {
        function_b908a35b0981168e(1);
        function_8be77b53bcbd6d2d(attacker, 1);
    }
    return 1;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140e6
// Size: 0x10d
function function_b908a35b0981168e(isdowned) {
    if (getdvarint(@"hash_3352584db9b5ae7b", 1) == 0) {
        return;
    }
    if (istrue(self.var_7744df488b629b5)) {
        return;
    }
    attackercount = 0;
    foreach (data in self.attackerdata) {
        if (data.attackerent == self) {
            continue;
        }
        attackercount++;
    }
    attackercount = int(clamp(attackercount, 0, 15));
    self setclientomnvar("ui_num_attackers", attackercount);
    self.var_7744df488b629b5 = 1;
    if (attackercount > 1) {
        thread namespace_62c556437da28f50::scoreeventpopup(#"hash_59943f6a740f581b");
    } else if (istrue(isdowned)) {
        if (getdvarint(@"hash_a188996b14552063", 0) == 1) {
            thread namespace_62c556437da28f50::scoreeventpopup(#"hash_f954fa77f78fca21");
        }
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141fa
// Size: 0x11d
function isforcedlaststand(victim, einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc) {
    var_6d8f177c77496430 = 0;
    /#
        var_61468d0f2f1e6cb7 = getdvarint(@"hash_9564fda23c9d6dbd", 0);
        if (var_61468d0f2f1e6cb7) {
            return 1;
        }
    #/
    if (istrue(level.var_78184ec36f669844) && isbot(victim)) {
        return 1;
    }
    if (game_utility::isBRStyleGameType()) {
        if (namespace_a548bd428a566cf3::istutorial()) {
            return 1;
        }
        if (!flags::gameflagexists("prematch_done") || flags::gameflag("prematch_done")) {
            if (smeansofdeath == "MOD_FALLING" && !istrue(self.gulagarena) && !istrue(self.inlaststand)) {
                var_6d8f177c77496430 = 1;
            }
        }
    }
    if (istrue(self.killstreaklaststand) && isdefined(level.killstreak_laststand_func)) {
        var_6d8f177c77496430 = 1;
    }
    if (istrue(level.var_c8dbb5a3e916546f)) {
        var_6d8f177c77496430 = 1;
    }
    return var_6d8f177c77496430;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1431f
// Size: 0x101
function gethitlocheight(shitloc) {
    switch (shitloc) {
    case #"hash_8a1772f5f912c880":
    case #"hash_92bbfe494d03d772":
    case #"hash_b107b5547c755d23":
        return 60;
    case #"hash_da51cc36a471058":
    case #"hash_51d5d0b9add9cc5a":
    case #"hash_5d5aac570f6fd382":
    case #"hash_a7980c387477e7bb":
    case #"hash_b275b50677dcf6cb":
    case #"hash_d42e71cd9f1e822f":
    case #"hash_da2f35145aa58933":
    case #"hash_fb5b5e6c07253005":
        return 48;
    case #"hash_fbb61fc356f3c75e":
        return 40;
    case #"hash_1cbc508a2fe01b79":
    case #"hash_810a7426c8bac3ac":
        return 32;
    case #"hash_7b36142458a6c2d5":
    case #"hash_a638fec9040cfcf4":
        return 10;
    case #"hash_168c74e879f0ba11":
    case #"hash_9536712388e65bce":
        return 5;
        break;
    }
    return 48;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14428
// Size: 0xb2
function damageshellshockandrumble(einflictor, objweapon, smeansofdeath, idamage, idflags, eattacker) {
    thread namespace_3bbb5a98b932c46f::onweapondamage(einflictor, objweapon, smeansofdeath, idamage, eattacker);
    if (!isai(self) && utility::getdamagetype(smeansofdeath) != "bullet") {
        self playrumbleonentity("damage_heavy");
        if (isdefined(einflictor) && isdefined(einflictor.var_9c675043198097a3)) {
            self [[ einflictor.var_9c675043198097a3 ]](einflictor);
        } else if (!game_utility::isBRStyleGameType() && smeansofdeath == "MOD_TRIGGER_HURT") {
            self playsoundtoplayer("trigger_hurt_impact_plr", self);
        }
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144e1
// Size: 0x56
function callback_killingblow(einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime) {
    return 1;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1453f
// Size: 0xd9
function function_49d8cc008e5f6722(eattacker, victim, idflags) {
    eattacker endon("disconnect");
    victim endon("disconnect");
    if (getdvarint(@"hash_fa43f14297cc7d79", 0) == 1) {
        if (idflags & 512) {
            var_6acb3cd9c5bb74e9 = "outline_nodepth_cyan";
        } else if (istrue(victim.inlaststand)) {
            var_6acb3cd9c5bb74e9 = "outline_nodepth_red";
        } else {
            var_6acb3cd9c5bb74e9 = "outline_nodepth_orange";
        }
    } else {
        var_6acb3cd9c5bb74e9 = "outline_nodepth_trans_white";
    }
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        if (!isplayer(eattacker) && isdefined(eattacker.owner)) {
            eattacker = eattacker.owner;
        }
    }
    victim namespace_b903a23a81915f18::hudoutline_enable_internal(eattacker, "damage", var_6acb3cd9c5bb74e9);
    wait(0.2);
    victim outline::function_32dfa50c47325abe(eattacker, "damage", 1);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1461f
// Size: 0x21
function emitfalldamage(idamage) {
    physicsexplosionsphere(self.origin, 64, 64, 1);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14647
// Size: 0x256
function gamemodemodifyplayerdamage(einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1) {
    if (isdefined(eattacker) && isplayer(eattacker) && isalive(eattacker)) {
        if (level.matchrules_damagemultiplier) {
            idamage = idamage * level.matchrules_damagemultiplier;
        }
        if (level.matchrules_vampirism) {
            eattacker.health = int(min(float(eattacker.maxhealth), min(eattacker.health + idamage, float(eattacker.health + 20))));
            eattacker notify("vampirism");
        }
        if (game_utility::function_21322da268e71c19() && utility::isbulletdamage(smeansofdeath) && !isspreadweapon(objweapon)) {
            switch (shitloc) {
            case #"hash_8a1772f5f912c880":
            case #"hash_92bbfe494d03d772":
            case #"hash_b107b5547c755d23":
                if (!victim killstreak::isjuggernaut()) {
                    idamage = victim.maxhealth;
                    if (isdefined(victim.var_8790c077c95db752)) {
                        idamage = idamage + victim.var_8790c077c95db752;
                    }
                }
                break;
            default:
                break;
            }
        }
        if (istrue(game["isLaunchChunk"])) {
            if (game["launchChunkRuleSet"] == 0 || game["launchChunkRuleSet"] == 3) {
                if (!isbot(victim)) {
                    if (smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET" || smeansofdeath == "MOD_HEAD_SHOT") {
                        var_e87fbcd39de22d1b = 80;
                        if (!isplayer(eattacker) || !isplayer(victim)) {
                            return 0;
                        }
                        var_cb116ac8aa94ce55 = victim getplayerangles();
                        var_524b19d2034e1406 = eattacker getplayerangles();
                        anglediff = angleclamp180(var_cb116ac8aa94ce55[1] - var_524b19d2034e1406[1]);
                        if (abs(anglediff) < var_e87fbcd39de22d1b) {
                            idamage = idamage * 0.3;
                        }
                    }
                }
            }
        }
    }
    return idamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x148a5
// Size: 0x7b
function registerkill(objweapon, smeansofdeath, var_82a240a652326f8, iskillstreakweapon) {
    self.killcountthislife++;
    namespace_3c5a4254f2b957ea::incpersstat("cur_kill_streak", 1);
    thread namespace_6b49ddb858f34366::function_d8eb5fb3b35ed1a1();
    if (function_e42efe66fa95ca55()) {
        return;
    }
    killcountthislife = int(min(self.killcountthislife, 255));
    self setclientomnvar("ui_life_kill_count", killcountthislife);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14927
// Size: 0xd
function function_e42efe66fa95ca55() {
    return istrue(level.var_e42efe66fa95ca55);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1493c
// Size: 0x1d7
function monitordamage(maxhealth, damagefeedback, var_c5d89c3a1224b118, var_d7b6456018542238, var_a1823ac1157568db, rumble, var_22435c27e2916650) {
    self endon("death");
    level endon("game_ended");
    self endon("monitorDamageEnd");
    if (!isdefined(rumble)) {
        rumble = 0;
    }
    self setcandamage(1);
    self.health = 2147483647;
    self.maxhealth = maxhealth;
    if (!isdefined(self.damagetaken) || istrue(var_22435c27e2916650)) {
        self.damagetaken = 0;
    }
    if (!isdefined(var_a1823ac1157568db)) {
        var_a1823ac1157568db = 0;
    }
    running = 1;
    while (running) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        objweapon = weapon::mapweapon(objweapon, inflictor);
        if (rumble) {
            self playrumbleonentity("damage_light");
        }
        if (var_a1823ac1157568db) {
            weaponname = "none";
            if (isdefined(objweapon)) {
                weaponname = getcompleteweaponname(objweapon);
            }
            logattackerkillstreak(self, damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, weaponname);
        }
        running = monitordamageoneshot(damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, inflictor, damagefeedback, var_c5d89c3a1224b118, var_d7b6456018542238, var_a1823ac1157568db);
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b1a
// Size: 0x45
function monitordamageend() {
    self notify("monitorDamageEnd");
    self.damagetaken = undefined;
    self.attackers = undefined;
    self.wasdamaged = undefined;
    self.wasdamagedfrombulletpenetration = undefined;
    self.wasdamagedfrombulletricochet = undefined;
    self setcandamage(0);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b66
// Size: 0x27e
function monitordamageoneshot(damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, inflictor, damagefeedback, var_c5d89c3a1224b118, var_d7b6456018542238, var_a1823ac1157568db) {
    if (!isdefined(self)) {
        return 0;
    }
    if (isdefined(attacker) && isdefined(attacker.owner)) {
        attacker = attacker.owner;
    }
    if (isdefined(attacker) && !game_utility::isgameparticipant(attacker)) {
        return 1;
    }
    if (isdefined(attacker) && !namespace_3bbb5a98b932c46f::friendlyfirecheck(self.owner, attacker)) {
        if (isdefined(self.equipmentref) && self.equipmentref == "equip_tac_cover") {
            goto LOC_0000010c;
        }
        return 1;
    LOC_0000010c:
    }
LOC_0000010c:
    modifieddamage = damage;
    if (!istrue(self.skipignoredamage) && non_player_should_ignore_damage(attacker, objweapon, inflictor, meansofdeath)) {
        return 1;
    }
    if (isdefined(objweapon)) {
        damagedata = namespace_25ead30c6ed027fb::packdamagedata(attacker, self, damage, objweapon, meansofdeath, inflictor, point, direction_vec, modelname, partname, tagname, idflags);
        if (!isdefined(var_d7b6456018542238)) {
            var_d7b6456018542238 = &modifydamage;
        }
        modifieddamage = self [[ var_d7b6456018542238 ]](damagedata);
    }
    if (modifieddamage <= 0) {
        return 1;
    }
    self.wasdamaged = 1;
    self.damagetaken = self.damagetaken + int(modifieddamage);
    self.health = 2147483647;
    if (isdefined(idflags) && idflags & 8) {
        self.wasdamagedfrombulletpenetration = 1;
    }
    if (isdefined(idflags) && idflags & 256) {
        self.wasdamagedfrombulletricochet = 1;
    }
    if (istrue(var_a1823ac1157568db)) {
        killstreaks::killstreakhit(attacker, objweapon, self, meansofdeath, modifieddamage);
    }
    if (isdefined(attacker)) {
        if (isplayer(attacker)) {
            attacker damagefeedback::updatedamagefeedback(damagefeedback);
            if (isreallyalive(attacker)) {
                attacker namespace_cd0b2d039510b38d::clearSpawnProtection();
            }
        }
    }
    if (self.damagetaken >= self.maxhealth) {
        damagedata = namespace_25ead30c6ed027fb::packdamagedata(attacker, self, damage, objweapon, meansofdeath, inflictor, point, direction_vec, modelname, partname, tagname, idflags);
        thread equipmentdestroyed(inflictor, attacker, damage, idflags, undefined, objweapon, undefined, attacker.modifiers);
        self thread [[ var_c5d89c3a1224b118 ]](damagedata);
        return 0;
    }
    return 1;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14dec
// Size: 0xd1
function modifydamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflag = data.idflag;
    if (isdefined(idflag) && idflag && 256) {
        modifieddamage = 0.6 * damage;
    } else {
        modifieddamage = damage;
    }
    modifieddamage = handleempdamage(objweapon, type, modifieddamage);
    modifieddamage = handlemissiledamage(objweapon, type, modifieddamage);
    modifieddamage = handlegrenadedamage(objweapon, type, modifieddamage);
    modifieddamage = handleapdamage(objweapon, type, modifieddamage, attacker);
    return modifieddamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ec5
// Size: 0x107
function handlemissiledamage(objweapon, meansofdeath, damage) {
    var_adad6640398c7b3a = damage;
    switch (objweapon.basename) {
    case #"hash_13a265ac820ea0df":
    case #"hash_1ed1da8a2c218aa7":
    case #"hash_1ee2bbd1bc80ea9a":
    case #"hash_3e782fd775b72022":
    case #"hash_4f9064f9a7a4b7d1":
    case #"hash_5c272c0617caebf0":
    case #"hash_5cbb3a1a84d47f1d":
    case #"hash_6b9700922cc910a9":
    case #"hash_a9e31b8ffd42a67b":
    case #"hash_e704ecf8710c6f57":
    case #"hash_f55c20924061bd15":
    case #"hash_fe08358bc8f9a34a":
        self.largeprojectiledamage = 1;
        var_adad6640398c7b3a = self.maxhealth + 1;
        break;
    case #"hash_8d402b4aee106399":
        self.largeprojectiledamage = 0;
        var_adad6640398c7b3a = var_adad6640398c7b3a * 2;
        break;
    }
    return var_adad6640398c7b3a;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fd4
// Size: 0xa5
function handlegrenadedamage(objweapon, damagetype, modifieddamage) {
    if (isexplosivedamagemod(damagetype)) {
        var_49e6ef3edadd524e = function_f581838ce4328f7a(objweapon);
        switch (var_49e6ef3edadd524e) {
        case #"hash_fa1e80f6bd5b8e72":
            modifieddamage = modifieddamage * 3;
            break;
        case #"hash_5d11ac1131cddab1":
        case #"hash_7c03088193266bc4":
        case #"hash_eeb591a8f50a5869":
            modifieddamage = modifieddamage * 4;
            break;
        default:
            if (objweapon.isalternate) {
                modifieddamage = modifieddamage * 3;
            }
            break;
        }
    }
    return modifieddamage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15081
// Size: 0x1d
function handleempdamage(objweapon, meansofdeath, damage) {
    return damage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150a6
// Size: 0xaf
function handleapdamage(objweapon, meansofdeath, damage, attacker, victim) {
    modifier = 1;
    armorpiercingmod = level.armorpiercingmod - 1;
    if (isfmjdamage(objweapon, meansofdeath)) {
        if (!isdefined(victim) || !isplayer(victim)) {
            modifier = modifier + armorpiercingmod;
        }
    }
    var_f08f2b140236ebf2 = armorpiercingmod + 0.5;
    if (function_73d1d5d600a0cbc3(meansofdeath, attacker)) {
        modifier = modifier + var_f08f2b140236ebf2;
        attacker namespace_40cd4a4db2010f22::function_693d12aa2c1c02c5(1, "suppressionRoundHit");
    }
    return int(damage * modifier);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1515d
// Size: 0x50
function function_c599a0001ca06dc9(objweapon, smeansofdeath, damage, var_be4285b26ed99ab1) {
    if (!isfmjdamage(objweapon, smeansofdeath)) {
        return damage;
    }
    var_527bb875e0d92d99 = 0;
    if (damage / var_be4285b26ed99ab1 < var_527bb875e0d92d99) {
        damage = int(var_be4285b26ed99ab1 * var_527bb875e0d92d99);
    }
    return damage;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151b5
// Size: 0x53
function function_5e4aa8d548cc604e(damage, objweapon, attacker, meansofdeath) {
    modifier = 1;
    if (function_4766094b15b00a8(objweapon, meansofdeath, attacker)) {
        modifier = level.var_3395494b137909bb;
    }
    return int(damage * modifier);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15210
// Size: 0x4a
function function_10268164ab1bcc31(damage, objweapon, attacker) {
    modifier = 1;
    if (function_e287831520aa308b(objweapon, attacker)) {
        modifier = level.var_3395494b137909bb;
    }
    return int(damage * modifier);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15262
// Size: 0x50
function function_71a1605c1a9bddd7(objweapon, meansofdeath, damage, attacker, victim) {
    if (!namespace_68e641469fde3fa7::isakimbo(objweapon)) {
        return damage;
    }
    modifier = 1;
    return int(damage * modifier);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152ba
// Size: 0x57
function handleshotgundamage(objweapon, meansofdeath, damage) {
    if (!isdefined(objweapon)) {
        return damage;
    }
    if (objweapon.basename == "none") {
        return damage;
    }
    if (weaponclass(objweapon) != "spread") {
        return damage;
    }
    return int(min(150, damage));
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x15319
// Size: 0xad
function onkillstreakdamaged(killstreakname, attacker, weapon, damage) {
    var_2d113e958c753976 = undefined;
    if (isdefined(attacker) && isdefined(self.owner)) {
        if (isdefined(attacker.owner) && isplayer(attacker.owner)) {
            attacker = attacker.owner;
        }
        if (isplayer(attacker) && self.owner namespace_e47104b48662385b::isenemy(attacker)) {
            var_2d113e958c753976 = attacker;
        }
    }
    if (isdefined(var_2d113e958c753976)) {
        thread challenges::killstreakdamaged(killstreakname, self.owner, var_2d113e958c753976, weapon, damage);
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x153cd
// Size: 0x1a2
function onkillstreakkilled(killstreakname, attacker, objweapon, damagetype, damage, scorepopupname, leaderdialog, var_6342e2da1dc12454, var_dc695757f69ed065) {
    var_40ea91e2825fa07a = 0;
    var_2d113e958c753976 = undefined;
    if (isdefined(attacker) && isdefined(self.owner)) {
        if (isdefined(attacker.owner) && isplayer(attacker.owner)) {
            attacker = attacker.owner;
        }
        if (issentient(self.owner) && issentient(attacker)) {
            if (!isalliedsentient(self.owner, attacker)) {
                var_2d113e958c753976 = attacker;
            }
        } else if (self.owner namespace_e47104b48662385b::isenemy(attacker)) {
            var_2d113e958c753976 = attacker;
        }
    }
    if (isdefined(var_2d113e958c753976)) {
        if (isdefined(level.var_ce95c7540070f7d0)) {
            [[ level.var_ce95c7540070f7d0 ]](killstreakname, self.team, var_2d113e958c753976);
        }
        if (isdefined(var_6342e2da1dc12454)) {
            var_2d113e958c753976 namespace_20260f65229aa888::killstreakdestroyed(killstreakname);
        }
        thread events::killedkillstreak(killstreakname, var_2d113e958c753976, objweapon);
        thread challenges::killstreakkilled(killstreakname, self.owner, self, var_2d113e958c753976, damage, damagetype, objweapon, scorepopupname);
        gestures::processcalloutdeath(self, var_2d113e958c753976);
        var_40ea91e2825fa07a = 1;
    }
    thread events::processscrapassist(var_2d113e958c753976);
    if (isdefined(self.owner) && isdefined(leaderdialog)) {
        self.owner namespace_8319cdbe938cd234::function_8959c1606f65e65(killstreakname, leaderdialog);
    }
    if (!istrue(var_dc695757f69ed065)) {
        self notify("death");
    }
    return var_40ea91e2825fa07a;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15577
// Size: 0x18a
function updatedeathdetails(var_fb0ece5f482aff3e, attackerdata, killer) {
    attackercount = 0;
    if (isdefined(killer) && isplayer(killer) && isdefined(killer.health)) {
        if (!killer namespace_e47104b48662385b::_isalive()) {
            self setclientomnvar("ui_death_details_enemy_health", 0);
        } else {
            self setclientomnvar("ui_death_details_enemy_health", int(clamp(killer.health, 0, killer.maxhealth)) / killer.maxhealth);
        }
    } else {
        self setclientomnvar("ui_death_details_enemy_health", -1);
    }
    if (isdefined(var_fb0ece5f482aff3e) && isdefined(attackerdata)) {
        foreach (guid, attacker in var_fb0ece5f482aff3e) {
            if (!isplayer(attacker)) {
                continue;
            }
            var_3010362406c84dcf = attacker getentitynumber();
            self setclientomnvar("ui_death_details_attacker_" + attackercount, var_3010362406c84dcf);
            self setclientomnvar("ui_death_details_hits_" + attackercount, int(min(attackerdata[guid].hitcount, 10)));
            attackercount++;
            if (attackercount >= 4) {
                break;
            }
        }
    }
    for (var_ed391f2e5d37dc2a = attackercount; var_ed391f2e5d37dc2a < 4; var_ed391f2e5d37dc2a++) {
        self setclientomnvar("ui_death_details_attacker_" + var_ed391f2e5d37dc2a, -1);
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15708
// Size: 0xa4
function setdeathtimerlength(var_642470e1abc1bbf9) {
    victim = var_642470e1abc1bbf9.victim;
    var_d8d2129eff08b4b1 = 0;
    if (victim namespace_66c176d3c67cc0c2::mayspawn() && !level.disablespawncamera) {
        timeuntilspawn = namespace_66c176d3c67cc0c2::timeuntilspawn(1);
        var_906a882502dd814a = 2.25;
        var_b5c34c3bc6c7e65 = 1;
        timeuntilspawn = max(timeuntilspawn + var_b5c34c3bc6c7e65, var_906a882502dd814a);
        var_d8d2129eff08b4b1 = timeuntilspawn + var_642470e1abc1bbf9.deathscenetimesec;
    }
    victim.death_timer_length = int(var_d8d2129eff08b4b1 * 10);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x157b3
// Size: 0x132
function getindexfromhitloc(shitloc) {
    switch (shitloc) {
    case #"hash_b275b50677dcf6cb":
        return 0;
    case #"hash_fbb61fc356f3c75e":
        return 1;
    case #"hash_8a1772f5f912c880":
        return 2;
    case #"hash_b107b5547c755d23":
        return 3;
    case #"hash_92bbfe494d03d772":
        return 4;
    case #"hash_51d5d0b9add9cc5a":
        return 5;
    case #"hash_a7980c387477e7bb":
        return 6;
    case #"hash_da51cc36a471058":
        return 7;
    case #"hash_d42e71cd9f1e822f":
        return 8;
    case #"hash_5d5aac570f6fd382":
        return 9;
    case #"hash_da2f35145aa58933":
        return 10;
    case #"hash_810a7426c8bac3ac":
        return 11;
    case #"hash_7b36142458a6c2d5":
        return 12;
    case #"hash_168c74e879f0ba11":
        return 13;
    case #"hash_1cbc508a2fe01b79":
        return 14;
    case #"hash_a638fec9040cfcf4":
        return 15;
    case #"hash_9536712388e65bce":
        return 16;
    case #"hash_fb5b5e6c07253005":
        return 17;
    case #"hash_db653a4972b3c13b":
        return 18;
        break;
    }
    return 0;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158ed
// Size: 0x18
function showuidamageflash() {
    self setclientomnvar("ui_damage_event", self.damageeventcount);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1590c
// Size: 0x15d
function updatecombatrecordkillstats(attacker, victim, meansofdeath, objweapon) {
    if (!canrecordcombatrecordstats()) {
        return;
    }
    if (isdefined(attacker) && isplayer(attacker) && attacker != victim) {
        if (isdefined(objweapon)) {
            var_11d2f075e9a0e643 = weapon::getequipmenttype(objweapon);
            if (isdefined(var_11d2f075e9a0e643) && var_11d2f075e9a0e643 == "lethal") {
                equipment = namespace_1a507865f681850e::getequipmentreffromweapon(objweapon);
                if (!isdefined(equipment)) {
                    /#
                        assertmsg("damage - updateCombatRecordKillStats was unable to getEquipmentRefFromWeapon with objWeapon" + objweapon.basename);
                    #/
                    equipment = "";
                }
                if (equipment == "equip_throwing_knife_fire" || equipment == "equip_throwing_knife_electric" || equipment == "equip_shuriken") {
                    equipment = "equip_throwing_knife";
                }
                if (equipment == "equip_pball") {
                    equipment = "equip_snowball";
                }
                attacker combatrecordlethalkill(equipment);
            } else {
                killstreak = killstreak::getkillstreaknamefromweapon(objweapon);
                if (isdefined(killstreak)) {
                    if (isenumvaluevalid(level.var_5d69837cf4db0407, "LethalScorestreakStatItems", killstreak)) {
                        attacker combatrecordkillstreakstat(killstreak);
                    }
                }
                if (istrue(attacker.personalradaractive)) {
                    attacker combatrecordtacticalstat("power_periphVis");
                }
                if (istrue(attacker.adrenalinepoweractive)) {
                    attacker combatrecordtacticalstat("equip_adrenaline");
                }
            }
        }
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a70
// Size: 0xfa
function combatrecordequipmentused(weapon) {
    if (!stats::canrecordcombatrecordstats()) {
        return;
    }
    var_4918b66cebc7fbe7 = equipment::isequipmentlethal(weapon);
    if (weapon == "equip_throwing_knife_fire" || weapon == "equip_throwing_knife_electric" || weapon == "equip_shuriken") {
        weapon = "equip_throwing_knife";
    }
    if (weapon == "equip_pball") {
        weapon = "equip_snowball";
    }
    if (var_4918b66cebc7fbe7) {
        oldvalue = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "lethalStats", weapon, "uses");
        self setplayerdata(level.var_5d69837cf4db0407, "playerStats", "lethalStats", weapon, "uses", oldvalue + 1);
    } else {
        oldvalue = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "tacticalStats", weapon, "uses");
        self setplayerdata(level.var_5d69837cf4db0407, "playerStats", "tacticalStats", weapon, "uses", oldvalue + 1);
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b71
// Size: 0x64
function combatrecordlethalkill(weapon) {
    if (!canrecordcombatrecordstats()) {
        return;
    }
    oldvalue = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "lethalStats", weapon, "kills");
    self setplayerdata(level.var_5d69837cf4db0407, "playerStats", "lethalStats", weapon, "kills", oldvalue + 1);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15bdc
// Size: 0x7f
function combatrecordtacticalstat(weapon, var_d2194902e87613eb) {
    if (!stats::canrecordcombatrecordstats() || isagent(self)) {
        return;
    }
    if (!isdefined(var_d2194902e87613eb)) {
        var_d2194902e87613eb = 1;
    }
    oldvalue = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "tacticalStats", weapon, "extraStat1");
    self setplayerdata(level.var_5d69837cf4db0407, "playerStats", "tacticalStats", weapon, "extraStat1", oldvalue + var_d2194902e87613eb);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c62
// Size: 0x74
function combatrecordkillstreakstat(streakname) {
    if (!stats::canrecordcombatrecordstats()) {
        return;
    }
    var_b326f2fc8716b6d8 = stats::getstreakrecordtype(streakname);
    if (!isdefined(var_b326f2fc8716b6d8)) {
        return;
    }
    oldvalue = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", var_b326f2fc8716b6d8, streakname, "extraStat1");
    self setplayerdata(level.var_5d69837cf4db0407, "playerStats", var_b326f2fc8716b6d8, streakname, "extraStat1", oldvalue + 1);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15cdd
// Size: 0x6a
function enqueuecorpsetablefunc(var_cc4f2e0388379546, func) {
    if (!isdefined(self.corpsetablefuncs)) {
        self.corpsetablefuncs = [];
        self.corpsetablefunccounts = [];
    }
    if (!isdefined(self.corpsetablefuncs[var_cc4f2e0388379546])) {
        self.corpsetablefuncs[var_cc4f2e0388379546] = func;
        self.corpsetablefunccounts[var_cc4f2e0388379546] = 0;
    }
    self.corpsetablefunccounts[var_cc4f2e0388379546]++;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d4e
// Size: 0x5c
function dequeuecorpsetablefunc(var_cc4f2e0388379546) {
    if (!isdefined(self.corpsetablefuncs)) {
        return;
    }
    if (!isdefined(self.corpsetablefuncs[var_cc4f2e0388379546])) {
        return;
    }
    self.corpsetablefunccounts[var_cc4f2e0388379546]--;
    if (self.corpsetablefunccounts[var_cc4f2e0388379546] <= 0) {
        self.corpsetablefuncs[var_cc4f2e0388379546] = undefined;
        self.corpsetablefunccounts[var_cc4f2e0388379546] = undefined;
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15db1
// Size: 0x81
function callcorpsetablefuncs() {
    if (!isdefined(self.corpsetablefuncs)) {
        return;
    }
    var_3741ea5b9fb53ec3 = self.body;
    foreach (func in self.corpsetablefuncs) {
        self thread [[ func ]](var_3741ea5b9fb53ec3);
    }
    thread clearcorpsetablefuncs();
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e39
// Size: 0x1f
function clearcorpsetablefuncs() {
    self notify("clearCorpsetableFuncs");
    self.corpsetablefuncs = undefined;
    self.corpsetablefunccounts = undefined;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e5f
// Size: 0x5e
function startcopycatoption(attacker) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("stop_copy_cat_option");
    if (!isdefined(attacker) || !isplayer(attacker) || isbot(self)) {
        return;
    }
    while (self copyloadoutbuttonpressed()) {
        waitframe();
    }
    while (!self copyloadoutbuttonpressed()) {
        waitframe();
    }
    class::copyclassfornextlife(attacker);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ec4
// Size: 0xb
function stopcopycatoption() {
    self notify("stop_copy_cat_option");
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ed6
// Size: 0x69
function isenvironmentalscriptableinflictor(einflictor) {
    var_619c67271783522f = 0;
    if (isdefined(einflictor) && isdefined(einflictor.code_classname) && einflictor.code_classname == "scriptable") {
        switch (einflictor.classname) {
        case #"hash_807fe3702cfc611f":
            var_619c67271783522f = 1;
            break;
        }
    }
    return var_619c67271783522f;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f47
// Size: 0x5b
function shouldrecorddamagestats(player) {
    /#
        assertex(isplayer(player), "Parameter of shouldRecordDamageStats should be of player type.");
    #/
    if (function_483cc81bff18273b(player)) {
        return 0;
    }
    if (istrue(level.disabledamagestattracking)) {
        return 0;
    }
    if (isdefined(level.disabledamagestattrackingfunc) && ![[ level.disabledamagestattrackingfunc ]](player)) {
        return 0;
    }
    return 1;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15faa
// Size: 0x143
function logfriendlyfire(player, attacker, damage, method) {
    if (!isdefined(player) || !isdefined(attacker) || !isdefined(method)) {
        return;
    }
    var_da8c4c2cb070b775 = damage >= player.health;
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.weaponname = weapon::getweaponrootname(attacker.currentweapon);
    var_7e2c53b0bcf117d9.fullweaponname = getcompleteweaponname(attacker.currentweapon);
    var_7e2c53b0bcf117d9.statname = "friendly_fire_damage";
    var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = int(min(damage, player.health));
    var_7e2c53b0bcf117d9.variantid = -1;
    var_7e2c53b0bcf117d9.weaponobj = attacker.currentweapon;
    attacker namespace_c45ac99c4997e722::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
    player dlog_recordplayerevent("dlog_event_friendly_fire", [0:"attacker", 1:attacker, 2:"damage", 3:damage, 4:"is_fatal_damage", 5:var_da8c4c2cb070b775, 6:"damage_method", 7:method]);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160f4
// Size: 0x1fa
function function_694d74d8b5ac556f(eattacker, idamage, var_1da1a66b5c6a06a7, smeansofdeath, objweapon, victim) {
    if (!isscriptedagent(eattacker) || eattacker.unittype == "zombie") {
        return [0:idamage, 1:var_1da1a66b5c6a06a7];
    }
    if (smeansofdeath == "MOD_EXECUTION" || smeansofdeath == "MOD_DOWN") {
        return [0:idamage, 1:var_1da1a66b5c6a06a7];
    }
    maxdamage = undefined;
    if (isdefined(level.var_ed524ae7534d93e6)) {
        maxdamage = level.var_ed524ae7534d93e6;
    } else if (isdefined(level.var_e38979eb8fd7f7fd) && level.var_e38979eb8fd7f7fd != -1) {
        class = weaponclass(objweapon);
        switch (class) {
        case #"hash_8cdaf2e4ecfe5b51":
        case #"hash_fa24dff6bd60a12d":
            maxdamage = level.var_6ba4985b66d62a71;
            break;
        case #"hash_6191aaef9f922f96":
            maxdamage = level.var_7eb56682f591ea8d;
            break;
        case #"hash_690c0d6a821b42e":
            maxdamage = level.var_9cf526926a72864c;
            break;
        default:
            if (isexplosivedamagemod(smeansofdeath)) {
                maxdamage = level.var_47aedb539717aea5;
            } else if (smeansofdeath == "MOD_MELEE") {
                maxdamage = level.var_e2fbc9e65108b1e;
            } else {
                maxdamage = level.var_e38979eb8fd7f7fd;
            }
            break;
        }
    }
    if (isdefined(maxdamage)) {
        invehicle = namespace_e47104b48662385b::isinvehicle();
        if (invehicle && isdefined(level.var_4899061e2e21dd13) && level.var_4899061e2e21dd13 != -1) {
            maxdamage = int(maxdamage * level.var_4899061e2e21dd13);
        }
        if (var_1da1a66b5c6a06a7 >= maxdamage) {
            var_1da1a66b5c6a06a7 = maxdamage;
            idamage = 0;
        } else {
            maxdamage = maxdamage - var_1da1a66b5c6a06a7;
            if (idamage > maxdamage) {
                idamage = maxdamage;
            }
        }
    }
    return [0:idamage, 1:var_1da1a66b5c6a06a7];
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162f6
// Size: 0x5f
function function_fe5ee0f83d4109eb(einflictor, attacker, smeansofdeath, objweapon) {
    if (isdefined(attacker) && attacker == self) {
        return 1;
    }
    if (isdefined(smeansofdeath) && (smeansofdeath == "MOD_TRIGGER_HURT" || smeansofdeath == "MOD_SUICIDE")) {
        return 1;
    }
    if (entity::isdronepackage(einflictor)) {
        return 1;
    }
    return 0;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1635d
// Size: 0x5b
function function_e07d55b45fc82ae0(einflictor, attacker) {
    if (!isdefined(attacker)) {
        return 0;
    }
    if (!isplayer(attacker) && !isdefined(attacker.team)) {
        return 0;
    }
    if (self.team != attacker.team) {
        return 0;
    }
    if (self == attacker) {
        return 0;
    }
    return 1;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163c0
// Size: 0xb2
function function_cd066c9463ad28c5(objweapon, smeansofdeath) {
    if (!isdefined(objweapon)) {
        return 0;
    }
    if (!isdefined(objweapon.basename)) {
        return 0;
    }
    var_f91bacb796f4fde4 = 0;
    switch (objweapon.basename) {
    case #"hash_4e86f50e99575707":
    case #"hash_507c24a8f53354fe":
    case #"hash_9d164ab536ac5b47":
    case #"hash_b2f452f9e4afa176":
    case #"hash_f89fb49cf58b70a5":
        var_f91bacb796f4fde4 = 1;
        break;
    default:
        if (isdefined(smeansofdeath) && smeansofdeath == "MOD_EXPLOSIVE_BULLET") {
            var_f91bacb796f4fde4 = 1;
        }
        break;
    }
    return var_f91bacb796f4fde4;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1647a
// Size: 0x82
function function_a062727999a72d2f(weaponname) {
    var_f8c0529126c5fb04 = [0:"iw9_sh_vecho_mp", 1:"iw9_pi_swhiskey_mp", 2:"iw9_sh_tsierra12_mp"];
    foreach (i in var_f8c0529126c5fb04) {
        if (i == weaponname) {
            return 1;
        }
    }
    return 0;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16504
// Size: 0x56
function function_403e958ecd04f255(victim, reason) {
    if (getdvarint(@"hash_a658b504ac40c111", 1) == 1) {
        logprint("[DamageEarlyOut] Victim Client " + victim getentitynumber() + " '" + victim.name + "' - Reason: " + reason);
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16561
// Size: 0x6d0
function function_8be77b53bcbd6d2d(attacker, type) {
    if (getdvarint(@"hash_8484954d9812dec1", 1) == 0) {
    }
    if (!isdefined(self.attackerdata)) {
        return;
    }
    if (isdefined(attacker) && isdefined(attacker.guid) && isdefined(self.attackerdata[attacker.guid])) {
        if (type == 0) {
            self.attackerdata[attacker.guid].killedby = 1;
        } else if (type == 1) {
            self.attackerdata[attacker.guid].var_76207f194a157fb5 = 1;
        }
    }
    var_d614b27c91dfd5f9 = [];
    if (isdefined(attacker) && isdefined(attacker.guid) && isdefined(self.attackerdata[attacker.guid])) {
        var_d614b27c91dfd5f9[0] = self.attackerdata[attacker.guid];
    }
    currenttime = gettime();
    var_4c2335db73179a86 = getdvarfloat(@"hash_568c61c9cb10a05a", 20) * 1000;
    var_27759d6e184c86e1 = getdvarint(@"hash_10925a6ddd9190c1", 0) == 0;
    while (1) {
        var_21aa6f16d3025af6 = undefined;
        var_753e95a387880b4f = undefined;
        foreach (attackerdata in self.attackerdata) {
            if (array_contains(var_d614b27c91dfd5f9, attackerdata)) {
                continue;
            }
            if (var_27759d6e184c86e1 && istrue(attackerdata.var_4ce88b2dfe0bfa52)) {
                continue;
            }
            elapsedtime = attackerdata.lasttimedamaged - currenttime;
            if (abs(elapsedtime) > var_4c2335db73179a86) {
                continue;
            }
            if (!isdefined(var_753e95a387880b4f) || var_753e95a387880b4f > elapsedtime) {
                var_21aa6f16d3025af6 = attackerdata;
                var_753e95a387880b4f = elapsedtime;
            }
        }
        if (isdefined(var_21aa6f16d3025af6)) {
            var_d614b27c91dfd5f9[var_d614b27c91dfd5f9.size] = var_21aa6f16d3025af6;
        } else {
            break;
        }
    }
    var_c41dadd6f0b10385 = 0;
    for (index = 0; index < 6; index++) {
        if (index < var_d614b27c91dfd5f9.size) {
            data = var_d614b27c91dfd5f9[index];
            lootid = namespace_e0ee43ef2dddadaa::function_9c331f88be5a1478(data.objweapon);
            if (lootid == 0) {
                var_1189bd7fbe2861f8 = namespace_1a507865f681850e::getequipmentreffromweapon(data.objweapon);
                if (isdefined(var_1189bd7fbe2861f8)) {
                    lootid = namespace_38b993c4618e76cd::function_a50b607d2500dda5(var_1189bd7fbe2861f8);
                } else if (namespace_e0ee43ef2dddadaa::iskillstreakweapon(data.objweapon)) {
                    killstreakname = namespace_a2f809133c566621::getkillstreaknamefromweapon(data.objweapon);
                    lootid = namespace_38b993c4618e76cd::function_a50b607d2500dda5(killstreakname);
                } else if (isdefined(data.objweapon.basename)) {
                    lootid = namespace_38b993c4618e76cd::function_a50b607d2500dda5(data.objweapon.basename);
                }
            }
            attackerent = function_53c4c53197386572(data.attackerent, undefined);
            lootid = int(clamp(function_53c4c53197386572(lootid, 0), 0, 2147483647));
            var_9d0080ba4b9a0226 = function_53c4c53197386572(data.var_282f568e901445ce.size > 1, 0);
            damage = int(clamp(function_53c4c53197386572(data.var_d69d6cc16d8b71fb, 0), 0, 1023));
            hitcount = int(clamp(function_53c4c53197386572(data.hitcount, 0), 0, 255));
            var_76207f194a157fb5 = function_53c4c53197386572(istrue(data.var_76207f194a157fb5), 0);
            killedby = function_53c4c53197386572(istrue(data.killedby), 0);
            friendly = function_53c4c53197386572(namespace_f8065cafc523dba5::isfriendly(self.team, data.attackerent), 0);
            var_f5e1c7e19d1f681c = 0;
            if (isdefined(data.var_8519cf56b38d717d)) {
                switch (data.var_8519cf56b38d717d) {
                case #"hash_b15027ffbdc0ecb":
                    var_f5e1c7e19d1f681c = 1;
                    break;
                case #"hash_f91d639d29feb858":
                    var_f5e1c7e19d1f681c = 2;
                    break;
                case #"hash_e4fbf0b31ced1661":
                    var_f5e1c7e19d1f681c = 3;
                    break;
                case #"hash_91d0b5d30ea06560":
                    var_f5e1c7e19d1f681c = 4;
                    break;
                case #"hash_daa7ba4e87e42b9":
                    var_f5e1c7e19d1f681c = 5;
                    break;
                case #"hash_abb1587cdc6def23":
                    var_f5e1c7e19d1f681c = 6;
                    break;
                case #"hash_a5123f4d02745600":
                    var_f5e1c7e19d1f681c = 7;
                    break;
                case #"hash_61e42661ac27b9f2":
                    var_f5e1c7e19d1f681c = 8;
                    break;
                case #"hash_24cf9a6ca3404493":
                    var_f5e1c7e19d1f681c = 9;
                    break;
                default:
                    var_f5e1c7e19d1f681c = 10;
                    if (isdefined(data.smeansofdeath) && data.smeansofdeath == "MOD_SUICIDE") {
                        var_f5e1c7e19d1f681c = 9;
                    }
                    break;
                }
            }
            self setclientomnvar("ui_combat_report_attacker_" + index, attackerent);
            self setclientomnvar("ui_combat_report_weapon_lootid_" + index, lootid);
            self setclientomnvar("ui_combat_report_multi_weapon_" + index, var_9d0080ba4b9a0226);
            self setclientomnvar("ui_combat_report_damage_" + index, damage);
            self setclientomnvar("ui_combat_report_hits_" + index, hitcount);
            self setclientomnvar("ui_combat_report_downedby_" + index, var_76207f194a157fb5);
            self setclientomnvar("ui_combat_report_killedby_" + index, killedby);
            self setclientomnvar("ui_combat_report_friendly_" + index, friendly);
            self setclientomnvar("ui_combat_report_damage_type_override_" + index, var_f5e1c7e19d1f681c);
        } else {
            self setclientomnvar("ui_combat_report_attacker_" + index, undefined);
            self setclientomnvar("ui_combat_report_weapon_lootid_" + index, 0);
            self setclientomnvar("ui_combat_report_multi_weapon_" + index, 0);
            self setclientomnvar("ui_combat_report_damage_" + index, 0);
            self setclientomnvar("ui_combat_report_hits_" + index, 0);
            self setclientomnvar("ui_combat_report_downedby_" + index, 0);
            self setclientomnvar("ui_combat_report_killedby_" + index, 0);
            self setclientomnvar("ui_combat_report_friendly_" + index, 0);
            self setclientomnvar("ui_combat_report_damage_type_override_" + index, 0);
        }
    }
    var_768fe1af4dda51ad = function_53c4c53197386572(var_d614b27c91dfd5f9.size, 0);
    var_768fe1af4dda51ad = int(clamp(var_768fe1af4dda51ad, 0, 6));
    self setclientomnvar("ui_combat_report_num_attackers", var_768fe1af4dda51ad);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c38
// Size: 0x190
function function_84c8fc967497800(attacker, attackerdamage, attackerweapon) {
    victim = self;
    if (!istrue(attackerdamage)) {
        return;
    }
    if (!isreallyalive(victim) || victim isplayeringulag()) {
        return;
    }
    attackerteam = namespace_54d20dd0dd79277f::getteamdata(attacker.team, "alivePlayers");
    if (!isdefined(attackerteam)) {
        return;
    }
    if (victim _hasperk("specialty_covert_ops")) {
        attacker thread function_b3e014b644ff0edb(2);
    } else {
        foreach (player in attackerteam) {
            if (!isdefined(player.var_6745f7e4484f1a55)) {
                continue;
            }
            if (player.var_6745f7e4484f1a55 == victim) {
                return;
            }
        }
        attacker notify("combatscout_targetSwitch");
        var_c3255c35acfc668c = function_f7060d6be77fc6a2(attacker.origin, victim.origin);
        victim function_87dfbd72f4fdd76f(attacker, int(5), var_c3255c35acfc668c);
        currenttime = gettime();
        if (!isdefined(attacker.var_d0a7a6015ed83b19) || currenttime > attacker.var_d0a7a6015ed83b19 + 1500) {
            attacker playlocalsound("recon_drone_marked_owner");
            attacker.var_d0a7a6015ed83b19 = gettime();
        }
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16dcf
// Size: 0x1bd
function function_87dfbd72f4fdd76f(attacker, var_b6b08a6a6f96b5c4, var_c3255c35acfc668c) {
    victim = self;
    level endon("game_ended");
    victim endon("disconnect");
    var_5283d6ed761e8022 = var_b6b08a6a6f96b5c4 * 1000;
    if (!isdefined(var_c3255c35acfc668c)) {
        var_c3255c35acfc668c = getdvarint(@"hash_1330d41fefd75985", 1);
    }
    switch (var_c3255c35acfc668c) {
    case 3:
        var_b6b08a6a6f96b5c4 = int(var_b6b08a6a6f96b5c4 * 1.6);
        var_5283d6ed761e8022 = int(var_5283d6ed761e8022 * 1.6);
        break;
    case 2:
        var_b6b08a6a6f96b5c4 = int(var_b6b08a6a6f96b5c4 * 1);
        var_5283d6ed761e8022 = int(var_5283d6ed761e8022 * 1);
        break;
    case 1:
    default:
        var_b6b08a6a6f96b5c4 = int(var_b6b08a6a6f96b5c4 * 0.75);
        var_5283d6ed761e8022 = int(var_5283d6ed761e8022 * 0.75);
        break;
    }
    icon = victim thread namespace_7bdde15c3500a23f::setheadicon_singleimage(attacker.team, "hud_icon_new_marked", 8, 1, 5000, 500, undefined, 1, 1);
    currenttime = gettime();
    if (!isdefined(victim.var_70ec5815eb1aa3f2) || currenttime > victim.var_70ec5815eb1aa3f2 + 1500) {
        victim namespace_893ac0cf28c5af44::function_fa08d1d78cf5cb01();
        victim playlocalsound("recon_drone_spotted_plr");
        victim.var_70ec5815eb1aa3f2 = gettime();
    }
    victim thread function_c712df451114149d(attacker, icon, var_b6b08a6a6f96b5c4);
    triggerportableradarpingteam(victim.origin, attacker.team, 40, var_5283d6ed761e8022);
    /#
        iprintln("ui_killcam_killedby_health_ratio" + var_c3255c35acfc668c + "new_trigger_spawned" + var_b6b08a6a6f96b5c4);
    #/
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f93
// Size: 0x75
function function_c712df451114149d(attacker, icon, waittime) {
    victim = self;
    level endon("game_ended");
    victim endon("disconnect");
    attacker.var_6745f7e4484f1a55 = victim;
    waittill_any_ents_or_timeout_return(waittime, victim, "death", attacker, "combatscout_targetSwitch");
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(icon);
    attacker.var_6745f7e4484f1a55 = undefined;
    attacker.var_d0a7a6015ed83b19 = undefined;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1700f
// Size: 0x6d
function function_f7060d6be77fc6a2(var_4ec83c6262d70534, var_d58995fcdb46b749) {
    dist = distance2d(var_4ec83c6262d70534, var_d58995fcdb46b749);
    /#
        iprintln("start_ragdoll" + dist);
    #/
    if (dist >= 0 && dist <= 2000) {
        return 1;
    } else if (dist > 2000 && dist <= 4000) {
        return 2;
    } else if (dist > 4000) {
        return 3;
    }
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17083
// Size: 0x76
function function_b3e014b644ff0edb(time) {
    attacker = self;
    level endon("game_ended");
    attacker endon("disconnect");
    if (isdefined(attacker.var_b9fc1ffc6b388cf5)) {
        return;
    }
    if (!isdefined(time)) {
        time = 1;
    }
    attacker.var_b9fc1ffc6b388cf5 = 1;
    attacker iprintlnbold("KILLSTREAKS_HINTS/RECON_NO_MARK");
    self playlocalsound("uin_jup_br_perk_combat_scout_marking_resist", self);
    wait(time);
    attacker.var_b9fc1ffc6b388cf5 = undefined;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17100
// Size: 0x9b
function function_fbd5b90ec07c28c4(victim) {
    victim endon("death_or_disconnect");
    level endon("game_ended");
    if (isdefined(victim.var_529eb36595b1d4bf)) {
        return;
    } else {
        victim.var_529eb36595b1d4bf = -0.1;
    }
    victim shellshock("chargemode_mp", 0.7);
    victim weapons::updatemovespeedscale();
    victim val::set("bulletDamageMeleeSlow", "sprint", 0);
    utility::waittill_any_timeout_1(0.7, "death");
    victim val::function_c9d0b43701bdba00("bulletDamageMeleeSlow");
    victim.var_529eb36595b1d4bf = undefined;
    victim weapons::updatemovespeedscale();
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171a2
// Size: 0x7d
function function_c38aa07aff945ff7(vdir, victim) {
    if (getdvarint(@"hash_73b7043bcd71993a", 0) && weapon::ismeleeonly(victim.currentweapon)) {
        if (vectordot(vdir, anglestoforward(victim.angles)) < 0 && distance2dsquared(self.origin, victim.origin) < 562500) {
            return 1;
        }
    }
    return 0;
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17227
// Size: 0x4c
function function_3e0f845008bbd48d(func_damage_override) {
    /#
        assert(isdefined(func_damage_override), "func_damage_override is a required argument for register_scripted_damage_override_func!");
    #/
    if (!isdefined(level.var_5cb687ba43fb7102)) {
        level.var_5cb687ba43fb7102 = [];
    }
    level.var_5cb687ba43fb7102 = utility::function_6d6af8144a5131f1(level.var_5cb687ba43fb7102, func_damage_override);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1727a
// Size: 0x37
function function_ba85b91abfec02d8(func) {
    if (!isarray(level.var_5cb687ba43fb7102)) {
        return;
    }
    level.var_5cb687ba43fb7102 = utility::array_remove(level.var_5cb687ba43fb7102, func);
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x172b8
// Size: 0x178
function function_18c42af5777dcd9f(var_642470e1abc1bbf9) {
    /#
        var_642470e1abc1bbf9.var_28cd1e201ecd8281 = [];
        var_642470e1abc1bbf9.var_28cd1e201ecd8281["should_do_killcam"] = var_642470e1abc1bbf9.attacker;
        var_642470e1abc1bbf9.var_28cd1e201ecd8281["pistolHeadshots"] = var_642470e1abc1bbf9.victim;
        var_642470e1abc1bbf9.var_28cd1e201ecd8281["thermiteKills"] = var_642470e1abc1bbf9.damage;
        var_642470e1abc1bbf9.var_28cd1e201ecd8281["longestStreak"] = var_642470e1abc1bbf9.objweapon;
        var_642470e1abc1bbf9.var_28cd1e201ecd8281["secondary"] = var_642470e1abc1bbf9.meansofdeath;
        var_642470e1abc1bbf9.var_28cd1e201ecd8281["ui_killed_player_notify"] = var_642470e1abc1bbf9.inflictor;
        var_642470e1abc1bbf9.var_28cd1e201ecd8281["^"] = var_642470e1abc1bbf9.direction_vec;
        var_642470e1abc1bbf9.var_28cd1e201ecd8281["Callback_KillingBlow == false"] = var_642470e1abc1bbf9.damageflags;
        var_642470e1abc1bbf9.var_28cd1e201ecd8281["rumble_mgl"] = var_642470e1abc1bbf9.hitloc;
        var_642470e1abc1bbf9.var_28cd1e201ecd8281["enemy_in_laststand"] = var_642470e1abc1bbf9.psoffsettime;
        var_642470e1abc1bbf9.var_28cd1e201ecd8281["vampirism"] = var_642470e1abc1bbf9.deathanimduration;
        var_642470e1abc1bbf9.var_28cd1e201ecd8281["uses"] = var_642470e1abc1bbf9.isfauxdeath;
    #/
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17437
// Size: 0x213
function function_f9249bb06eb48092(var_642470e1abc1bbf9) {
    /#
        /#
            assertex(var_642470e1abc1bbf9.var_28cd1e201ecd8281["should_do_killcam"] == var_642470e1abc1bbf9.attacker, "dlog_event_friendly_fire");
        #/
        /#
            assertex(var_642470e1abc1bbf9.var_28cd1e201ecd8281["pistolHeadshots"] == var_642470e1abc1bbf9.victim, "<unknown string>");
        #/
        /#
            assertex(var_642470e1abc1bbf9.var_28cd1e201ecd8281["thermiteKills"] == var_642470e1abc1bbf9.damage, "<unknown string>");
        #/
        /#
            assertex(var_642470e1abc1bbf9.var_28cd1e201ecd8281["longestStreak"] == var_642470e1abc1bbf9.objweapon, "<unknown string>");
        #/
        /#
            assertex(var_642470e1abc1bbf9.var_28cd1e201ecd8281["secondary"] == var_642470e1abc1bbf9.meansofdeath, "<unknown string>");
        #/
        /#
            assertex(var_642470e1abc1bbf9.var_28cd1e201ecd8281["ui_killed_player_notify"] == var_642470e1abc1bbf9.inflictor, "<unknown string>");
        #/
        /#
            assertex(var_642470e1abc1bbf9.var_28cd1e201ecd8281["^"] == var_642470e1abc1bbf9.direction_vec, "<unknown string>");
        #/
        /#
            assertex(var_642470e1abc1bbf9.var_28cd1e201ecd8281["Callback_KillingBlow == false"] == var_642470e1abc1bbf9.damageflags, "<unknown string>");
        #/
        /#
            assertex(var_642470e1abc1bbf9.var_28cd1e201ecd8281["rumble_mgl"] == var_642470e1abc1bbf9.hitloc, "<unknown string>");
        #/
        /#
            assertex(var_642470e1abc1bbf9.var_28cd1e201ecd8281["enemy_in_laststand"] == var_642470e1abc1bbf9.psoffsettime, "<unknown string>");
        #/
        /#
            assertex(var_642470e1abc1bbf9.var_28cd1e201ecd8281["vampirism"] == var_642470e1abc1bbf9.deathanimduration, "<unknown string>");
        #/
        /#
            assertex(var_642470e1abc1bbf9.var_28cd1e201ecd8281["uses"] == var_642470e1abc1bbf9.isfauxdeath, "<unknown string>");
        #/
    #/
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17651
// Size: 0x2e
function function_af3ebb9d1ecd18e7(var_642470e1abc1bbf9) {
    /#
        /#
            assertex(var_642470e1abc1bbf9.deathtime == gettime(), "<unknown string>");
        #/
    #/
}

// Namespace damage/namespace_3e725f3cc58bddd3
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x17686
// Size: 0xfd
function function_1b7b7da2e72eeffe(attacker, var_650e1916e052d2c7, smeansofdeath, objweapon) {
    /#
        self endon("<unknown string>");
        if (!isdefined(self.var_e6c94d7b9dc402ee)) {
            self.var_e6c94d7b9dc402ee = var_650e1916e052d2c7;
        } else {
            self.var_e6c94d7b9dc402ee = self.var_e6c94d7b9dc402ee + var_650e1916e052d2c7;
        }
        self notify("<unknown string>");
        self endon("<unknown string>");
        if (isdefined(attacker.owner)) {
            attacker = attacker.owner;
        }
        utility::waittill_any_timeout_1(2, "<unknown string>");
        var_81abac435f94f75c = self.var_e6c94d7b9dc402ee;
        self.var_e6c94d7b9dc402ee = undefined;
        if (!isdefined(objweapon) || isdefined(objweapon) && !isdefined(objweapon.basename)) {
            return;
        }
        if (!isdefined(attacker)) {
            return;
        }
        iprintlnbold("<unknown string>" + var_81abac435f94f75c + "<unknown string>" + smeansofdeath + "<unknown string>" + objweapon.basename);
    #/
}

