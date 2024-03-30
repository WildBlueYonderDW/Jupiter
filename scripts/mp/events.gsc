// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_247745a526421ba7;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\potg.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\player_frame_update_aggregator.gsc;
#using scripts\mp\events.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\hud_message.gsc;
#using script_15eddb0fac236a22;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\potg_events.gsc;
#using script_6a5d3bf7a5b7064a;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\dragonsbreath.gsc;
#using scripts\cp_mp\crossbow.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using script_7c40fa80892a721;
#using script_4948cdf739393d2d;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using script_728ffcee8cbf30ee;
#using scripts\mp\flags.gsc;
#using script_1cf2ed809496bf4e;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\equipment\snapshot_grenade.gsc;
#using script_548072087c9fd504;
#using scripts\mp\gametypes\br_challenges.gsc;
#using scripts\mp\persistence.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\gametypes\br_analytics.gsc;
#using script_45f403e1732217d3;
#using scripts\mp\equipment.gsc;

#namespace events;

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x242f
// Size: 0x5e4
function events_init() {
    bundle = undefined;
    registersharedfunc("score", "getHighestScoringPlayer", &scripts/mp/gamescore::gethighestscoringplayer);
    if (isdefined(level.gametypebundle)) {
        bundlename = level.gametypebundle.scoreeventlist;
        if (isstring(bundlename)) {
            level.scoreeventlist = bundlename;
            bundle = getscriptbundle(hashcat(%"scoreeventlist:", bundlename));
        }
    }
    if (!isdefined(bundle)) {
        bundle = function_15fd33eb83ce9723();
    }
    level.var_27dcaf9644646944 = #"display_xp";
    if (isdefined(bundle)) {
        if (istrue(bundle.var_78b5ec940aab35e4)) {
            level.var_27dcaf9644646944 = #"display_score";
        }
        level.var_488d247ae51e8eeb = istrue(bundle.var_488d247ae51e8eeb);
        level.var_393c8c75a6a52875 = istrue(bundle.var_393c8c75a6a52875);
        function_22bff45fcf920417(bundle.var_a5f886642fea5345);
        function_18a7c22094077fe9(bundle.var_719a7b2ee809800a);
        foreach (entry in bundle.var_954e1637c0fe6111) {
            function_e1fb4dfa1db65ce2(entry);
        }
        foreach (entry in bundle.var_a45b64683777600d) {
            function_51e853369bc3f0bf(entry);
        }
        foreach (entry in bundle.var_2820c891e54b9ac0) {
            function_51e853369bc3f0bf(entry);
        }
        foreach (entry in bundle.var_24a4cf263452716) {
            function_51e853369bc3f0bf(entry);
        }
        foreach (entry in bundle.var_64f120e8e17d6a6) {
            function_51e853369bc3f0bf(entry);
        }
        foreach (entry in bundle.var_60c4cdc67f3daa88) {
            function_51e853369bc3f0bf(entry);
        }
        foreach (entry in bundle.var_c865e015a35e7213) {
            function_51e853369bc3f0bf(entry);
        }
        foreach (entry in bundle.var_df30271d78b67bc4) {
            function_51e853369bc3f0bf(entry);
        }
        foreach (entry in bundle.var_4d8678eb66db4dee) {
            function_51e853369bc3f0bf(entry);
        }
        foreach (entry in bundle.var_dc9d1000672be9fc) {
            function_51e853369bc3f0bf(entry);
        }
        foreach (entry in bundle.var_22d3e4c7f898ce16) {
            function_51e853369bc3f0bf(entry);
        }
        foreach (entry in bundle.var_8cb7d576afcbade5) {
            function_51e853369bc3f0bf(entry);
        }
        foreach (entry in bundle.var_bc38d83854c4c304) {
            function_51e853369bc3f0bf(entry);
        }
    }
    registersharedfunc("event", "predatorMissileImpact", &predatormissileimpact);
    registersharedfunc("event", "largeVehicleExplosion", &largevehicleexplosion);
    registersharedfunc("event", "vehicleKilled", &vehiclekilled);
    registersharedfunc("event", "missileFired", &missilefired);
    level._effect["money"] = loadfx("vfx/props/cash_player_drop");
    level.numkills = 0;
    level thread onplayerconnect();
    level thread monitorhealed();
    if (!runleanthreadmode()) {
        scripts/mp/utility/spawn_event_aggregator::registeronplayerspawncallback(&onplayerspawn);
        scripts/mp/utility/player_frame_update_aggregator::registerplayerframeupdatecallback(&monitoradstime);
        scripts/mp/utility/player_frame_update_aggregator::registerplayerframeupdatecallback(&scripts/mp/events::events_monitorslideupdate);
    }
    scripts/mp/utility/player_frame_update_aggregator::registerplayerframeupdatecallback(&updatestancetracking);
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1a
// Size: 0x17b
function function_15fd33eb83ce9723() {
    game_type = getgametype();
    if (!isdefined(game_type)) {
        game_type = scripts/cp_mp/utility/game_utility::getgametype();
    }
    if (game_type == "brtdm_mgl") {
        game_type = "brtdm";
    }
    scriptbundlename = "score_event_list_" + game_type;
    if (isanymlgmatch()) {
        if (level.var_ec2fb549b15ad827) {
            scriptbundlename = "score_event_list_leagueplay_" + game_type;
        } else {
            scriptbundlename = "score_event_list_cdl_" + game_type;
        }
    }
    if (getdvarint(@"hash_a464cb031c16ee87") > 0) {
        scriptbundlename = scriptbundlename + "_t10_mp";
    } else if (getdvarint(@"hash_3a8bbf8d767fb421") > 0) {
        scriptbundlename = scriptbundlename + "_iw9_mp_dmz_biolab";
    } else if (getdvarint(@"hash_aae99dd3b5ad1a77") > 0) {
        scriptbundlename = scriptbundlename + "_iw9_mp_dmz_biobunker";
    } else if (scripts/cp_mp/utility/game_utility::function_6c1fce6f6b8779d5() == "resurgence") {
        scriptbundlename = scriptbundlename + "_iw9_mp_resurgence";
    } else if (scripts/cp_mp/utility/game_utility::function_6c1fce6f6b8779d5() == "zonecontrol") {
        scriptbundlename = scriptbundlename + "_iw9_mp_zonecontrol";
    } else if (scripts/cp_mp/utility/game_utility::function_6c1fce6f6b8779d5() == "champion") {
        scriptbundlename = "score_event_list_br_mgl_mp_champion";
    } else if (game_type == "conflict") {
        scriptbundlename = "score_event_list_conflict_mgl_mp";
    } else {
        scriptbundlename = scriptbundlename + "_iw9_mp";
        /#
            utility::scriptbundlewarning("", scriptbundlename);
        #/
    }
    level.scoreeventlist = scriptbundlename;
    bundle = getscriptbundle("scoreeventlist:" + scriptbundlename);
    /#
        assert(isdefined(bundle), "Score Event Bundle required for game type: " + game_type);
    #/
    return bundle;
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b9d
// Size: 0x80
function function_e1fb4dfa1db65ce2(entry) {
    if (!isdefined(entry)) {
        return;
    }
    ref = entry.ref;
    if (!isdefined(ref) || ref == "") {
        return;
    }
    scripts/mp/rank::registerscoreinfomultiplier(ref, entry.multiplier);
    group = default_to(entry.group, "unassigned");
    scripts/mp/rank::registerscoreinfo(ref, #"group", group);
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c24
// Size: 0x2bf
function function_51e853369bc3f0bf(entry) {
    if (!isdefined(entry)) {
        return;
    }
    ref = entry.ref;
    if (!isdefined(ref) || ref == "") {
        return;
    }
    score = default_to(entry.score, 0);
    xp = default_to(entry.xp, 0);
    var_e705ea298dacd4e2 = default_to(entry.var_e705ea298dacd4e2, 0);
    var_21d1ad1e97cbbf15 = default_to(entry.var_21d1ad1e97cbbf15, 0);
    if (istrue(entry.var_ea8529d33b9e81aa)) {
        scripts/mp/rank::registerscoreinfo(ref, #"hash_6dd3d93bbf03abc6", 1);
    }
    if (!istrue(entry.forceinit)) {
        if (score == 0 && xp == 0 && var_21d1ad1e97cbbf15 == 0) {
            return;
        }
        /#
            assert(score >= 0);
        #/
        /#
            assert(xp >= 0);
        #/
    }
    scripts/mp/rank::registerscoreinfo(ref, #"value", score);
    scripts/mp/rank::registerscoreinfo(ref, #"xp", xp);
    scripts/mp/rank::registerscoreinfo(ref, #"hash_afa3cfee9cf8b4c6", var_e705ea298dacd4e2);
    scripts/mp/rank::registerscoreinfo(ref, #"hash_98fbaf2f45d2fc09", var_21d1ad1e97cbbf15);
    scripts/mp/supers::function_4d75a970580a253c(ref, entry.superpoints);
    var_eef8a3f0dcf96328 = function_73e183e02834309d(entry.splashbundle);
    if (!var_eef8a3f0dcf96328) {
        function_3931df10145eac22(ref, scripts/mp/hud_message::getsplashtablename());
    }
    group = default_to(entry.group, "unassigned");
    scripts/mp/rank::registerscoreinfo(ref, #"group", group);
    if (!istrue(entry.nobonus)) {
        scripts/mp/rank::registerscoreinfo(ref, #"allowbonus", 1);
    }
    if (istrue(entry.var_5b5911eca3f2426f)) {
        scripts/mp/rank::registerscoreinfo(ref, #"hash_582866801a05178b", 1);
    }
    if (level.var_393c8c75a6a52875) {
        if (istrue(entry.var_20e41be47c76d7ed)) {
            scripts/mp/rank::registerscoreinfo(ref, #"hash_e98734bda1c5c091", 1);
        }
    }
    if (var_eef8a3f0dcf96328) {
        var_8cde9a095cf42d8f = function_2336488258354fbc(#"scriptbundle_splash", entry.splashbundle);
        /#
            assertex(isdefined(var_8cde9a095cf42d8f), "Net const string id is undefined for an existing splash bundle: " + function_3c8848a3a11b2553(entry.splashbundle));
        #/
        if (isdefined(var_8cde9a095cf42d8f)) {
            scripts/mp/rank::registerscoreinfo(ref, #"hash_9ef9bbcd1edc198b", var_8cde9a095cf42d8f);
            function_cbf4b04a2e7f02ae(ref, entry.splashbundle);
        }
    }
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eea
// Size: 0xd3
function function_3931df10145eac22(ref, splashtablename) {
    var_2c6153492a7defb2 = tablelookuprownum(splashtablename, 0, ref);
    if (var_2c6153492a7defb2 < 0) {
        return;
    }
    scripts/mp/rank::registerscoreinfo(ref, #"hash_edd89bb2cc2d506", var_2c6153492a7defb2);
    text = tablelookup(splashtablename, 0, ref, 2);
    if (isstring(text) && text != "") {
        scripts/mp/rank::registerscoreinfo(ref, #"hastext", 1);
    }
    priority = int(tablelookup(splashtablename, 0, ref, 13));
    scripts/mp/rank::registerscoreinfo(ref, #"priority", priority);
    var_43297beee133b22 = int(tablelookup(splashtablename, 0, ref, 14));
    scripts/mp/rank::registerscoreinfo(ref, #"alwaysshowsplash");
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fc4
// Size: 0xd2
function function_cbf4b04a2e7f02ae(ref, var_5a45f9068b4f316) {
    /#
        assert(function_73e183e02834309d(var_5a45f9068b4f316));
    #/
    if (!function_73e183e02834309d(var_5a45f9068b4f316)) {
        return;
    }
    splashbundle = getscriptbundle(var_5a45f9068b4f316);
    /#
        assert(isstruct(splashbundle));
    #/
    if (!isstruct(splashbundle)) {
        return;
    }
    if (isdefined(splashbundle.shortname)) {
        scripts/mp/rank::registerscoreinfo(ref, #"hastext", 1);
    }
    if (isdefined(splashbundle.priority)) {
        scripts/mp/rank::registerscoreinfo(ref, #"priority", splashbundle.priority);
    }
    if (!level.var_488d247ae51e8eeb) {
        if (istrue(splashbundle.alwaysshowsplash)) {
            scripts/mp/rank::registerscoreinfo(ref, #"alwaysshowsplash", 1);
        }
    }
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x309d
// Size: 0x17
function onplayerspawn() {
    self.jumpcur = 0;
    self.mantlecur = 0;
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30bb
// Size: 0x13a
function onplayerconnect() {
    for (;;) {
        player = level waittill("connected");
        if (!lpcfeaturegated()) {
            player.killedplayers = [];
            player.killedby = [];
        }
        player.lastkilledby = undefined;
        player.greatestuniqueplayerkills = 0;
        player.recentkillcount = 0;
        player.var_5431d89a36b0936 = 0;
        player.recentdefendcount = 0;
        player.recentassaultcount = 0;
        player.lastkilltime = 0;
        player.prevlastkilltime = 0;
        player.lastkilldogtime = 0;
        if (!isdefined(player.pers["lethalEquipmentKillMask"])) {
            player.pers["lethalEquipmentKillMask"] = 0;
        }
        player.objectiveachievementkillcount = 0;
        player.damagedplayers = [];
        player initslidemonitor();
        player initmonitoradstime();
        player thread monitorreload();
        player thread monitorweaponpickup();
        player thread namespace_6b49ddb858f34366::function_e6dddb660c52817();
        player thread function_3403058663ef4843();
        player.lastweaponchangetime = 0;
        player initstancetracking();
    }
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31fc
// Size: 0x50
function damagedplayer(victim, damage) {
    if (damage < 50 && damage > 10) {
        level thread scripts/mp/battlechatter_mp::saytoself(self, "plr_damaged_light", undefined, 0.1);
        return;
    }
    level thread scripts/mp/battlechatter_mp::saytoself(self, "plr_damaged_heavy", undefined, 0.1);
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3253
// Size: 0x1d
function playerworlddeath(attacker, meansofdeath) {
    scripts/mp/potg_events::playerworlddeath(attacker, meansofdeath);
}

// Namespace events / scripts/mp/events
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3277
// Size: 0x150
function killedplayernotifysys(killid, victim, objweapon, meansofdeath) {
    self endon("disconnect");
    level endon("game_ended");
    self notify("killedPlayerNotify");
    self endon("killedPlayerNotify");
    if (!isdefined(self.killsinaframecount)) {
        self.killsinaframecount = 0;
    }
    self.killsinaframecount++;
    if (weaponclass(objweapon) == "spread") {
        if (!isdefined(self.shotgunkillsinaframecount)) {
            self.shotgunkillsinaframecount = 1;
        } else {
            self.shotgunkillsinaframecount++;
            if (self.shotgunkillsinaframecount >= 2) {
                shotguncollateral(self.shotgunkillsinaframecount);
            }
        }
    } else if (meansofdeath == "MOD_PISTOL_BULLET" || meansofdeath == "MOD_RIFLE_BULLET" || meansofdeath == "MOD_HEAD_SHOT") {
        if (!isdefined(self.bulletkillsinaframecount)) {
            self.bulletkillsinaframecount = 1;
        } else {
            self.bulletkillsinaframecount++;
            if (self.bulletkillsinaframecount >= 2) {
                collateral(self.bulletkillsinaframecount);
            }
        }
    }
    waittillframeend();
    thread notifykilledplayer(killid, victim, objweapon, meansofdeath, self.killsinaframecount);
    self.killsinaframecount = 0;
    self.bulletkillsinaframecount = 0;
    self.shotgunkillsinaframecount = 0;
}

// Namespace events / scripts/mp/events
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33ce
// Size: 0x83
function notifykilledplayer(killid, victim, objweapon, meansofdeath, numkills) {
    /#
        assertex(isdefined(objweapon), "notifyKilledPlayer() passed undefined weapon");
    #/
    weaponname = undefined;
    if (isweapon(objweapon)) {
        weaponname = getcompleteweaponname(objweapon);
    } else {
        weaponname = objweapon;
    }
    for (i = 0; i < numkills; i++) {
        self notify("got_a_kill", victim);
        waitframe();
    }
}

// Namespace events / scripts/mp/events
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3458
// Size: 0x6c
function attackerisinflictor(attacker, inflictor, objweapon, meansofdeath) {
    sameent = 1;
    if (isdefined(inflictor)) {
        if (isdefined(inflictor.owner)) {
            sameent = inflictor.owner == attacker;
        } else if (attackerisinflictorforradiusexplosiveweapon(objweapon, inflictor, meansofdeath)) {
        } else {
            sameent = inflictor == attacker;
        }
    }
    return sameent;
}

// Namespace events / scripts/mp/events
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34cc
// Size: 0x79
function attackerisinflictorforradiusexplosiveweapon(objweapon, inflictor, meansofdeath) {
    var_ec001adf7f355eff = 0;
    if (isdefined(objweapon) && isdefined(inflictor.classname) && inflictor.classname == "worldspawn" && meansofdeath == "MOD_EXPLOSIVE") {
        rootweapon = getweaponrootname(objweapon);
        var_ec001adf7f355eff = rootweapon == "iw9_dm_crossbow";
    }
    return var_ec001adf7f355eff;
}

// Namespace events / scripts/mp/events
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x354d
// Size: 0x32d
function function_e6f3a66a2cd9d802(victim, objweapon, meansofdeath, curtime, weapongroup) {
    if (weapongroup == "other" || weapongroup == "weapon_projectile") {
        return 0;
    }
    if (meansofdeath == "MOD_MELEE" || meansofdeath == "MOD_EXPLOSIVE") {
        return 0;
    }
    if (namespace_4887422e77f3514e::function_549fbfada3618987()) {
        /#
            assert(isdefined(level.var_1736de83d797adc0));
        #/
        selfvalid = 0;
        elsevalid = 0;
        foreach (guid, attackerdata in victim.attackerdata) {
            if (guid == self.guid) {
                if (curtime == attackerdata.firsttimedamaged) {
                    selfvalid = 1;
                } else {
                    break;
                }
                continue;
            }
            if (isdefined(attackerdata.lasttimedamaged) && curtime - attackerdata.lasttimedamaged < level.var_1736de83d797adc0) {
                elsevalid = 1;
                break;
            }
        }
        return (selfvalid && !elsevalid);
    }
    if (isdefined(victim.attackers) && victim.attackers.size == 1 && isdefined(victim.guid) && !isdefined(victim.attackers[victim.guid])) {
        /#
            if (!isdefined(victim.attackers[self.guid])) {
                println("got_a_kill" + getcompleteweaponname(objweapon));
                println("mask2" + meansofdeath);
                println("assault" + self.guid + "avenger" + self.name + "silencedkill");
                i = 0;
                foreach (key, value in victim.attackers) {
                    println("detectedimpairedkill" + i + "victim_sprinting" + key + "avenger" + value.name + "silencedkill");
                    i++;
                }
            }
        #/
        /#
            assertex(isdefined(victim.attackers[self.guid]), "See console log for details");
        #/
        if (isdefined(victim.attackerdata[self.guid].hitcount) && victim.attackerdata[self.guid].hitcount > 1 && scripts/mp/utility/weapon::isakimbo(objweapon)) {
            return 0;
        }
        return (curtime == victim.attackerdata[self.guid].firsttimedamaged);
    }
    return 0;
}

// Namespace events / scripts/mp/events
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3881
// Size: 0x3f4a
function function_b7f154368abbe463(victim, objweapon, meansofdeath, inflictor, deathdata) {
    self.modifiers = [];
    self.modifiers["mask"] = 0;
    self.modifiers["mask2"] = 0;
    self.modifiers["mask3"] = 0;
    self.modifiers["attachment_flags"] = 0;
    self.modifiers["hit_loc"] = 0;
    curtime = gettime();
    weapongroup = getweapongroup(objweapon);
    var_366b0ecc2f28aead = isweapon(objweapon) ? getcompleteweaponname(objweapon) : "";
    victimguid = victim.guid;
    if (!iskillstreakweapon(objweapon) && !_hasperk("specialty_explosivebullets")) {
        attackerisinflictor = attackerisinflictor(self, inflictor, objweapon, meansofdeath);
        if (isdefined(victim.attackerposition)) {
            attackerposition = victim.attackerposition;
        } else {
            attackerposition = self.origin;
        }
        var_a2c3fea3986af52a = anglestoforward(self getplayerangles());
        var_146f31f6b6666ca7 = victim.origin - attackerposition;
        var_9669ee24872dd095 = vectornormalize(var_146f31f6b6666ca7);
        var_72705a221874f8a9 = vectordot(var_a2c3fea3986af52a, var_9669ee24872dd095);
        attackervelocity = self getvelocity();
        var_63d7d6bf10076ecb = vectornormalize(attackervelocity);
        var_776dafcc4fadbc14 = vectordot(var_a2c3fea3986af52a, var_63d7d6bf10076ecb);
        var_414d20858ffe7335 = length2dsquared(attackervelocity);
        if (isdefined(attackervelocity)) {
            if (attackervelocity[0] != 0 || attackervelocity[1] != 0 || attackervelocity[2] != 0) {
                self.modifiers["moving_kill"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"moving_kill"));
            }
        }
        isbulletdamage = isbulletdamage(meansofdeath);
        ismeleedamage = ismeleedamage(meansofdeath);
        if ((isbulletdamage || ismeleedamage) && isdefined(var_776dafcc4fadbc14) && isdefined(var_414d20858ffe7335)) {
            if (abs(var_776dafcc4fadbc14) < 0.8 && var_414d20858ffe7335 > 50) {
                self.modifiers["strafing_kill"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"strafing_kill"));
            }
        }
        if (meansofdeath == "MOD_EXECUTION") {
            self.modifiers["execution"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"execution"));
            killdist = math::round_float(distance(attackerposition, victim.origin) / 39.37, 2);
            namespace_6b49ddb858f34366::function_822c6ec14dbe6941(killdist);
        }
        if (level.numkills == 0) {
            self.modifiers["firstblood"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"firstblood"));
        }
        if (!isdefined(objweapon) || !isdefined(objweapon.basename) || objweapon.basename == "none") {
            return;
        }
        if (function_e6f3a66a2cd9d802(victim, objweapon, meansofdeath, curtime, weapongroup)) {
            self.modifiers["oneshotkill"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_603a0dde50c94e47"));
        }
        if (isdefined(self.lastinsmoketime) && self.lastinsmoketime + 5000 > gettime() || isdefined(victim.lastinsmoketime) && victim.lastinsmoketime + 5000 > gettime()) {
            self.modifiers["insmoke"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"enemyinsmoke"));
        }
        if (scripts/mp/utility/game::runleanthreadmode()) {
            if (scripts/cp_mp/utility/killstreak_utility::teamhasuav_ignorecuav(victim.team)) {
                self.modifiers["enemyHasUAV"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_9a860a2c838066cd"));
            }
        } else if (scripts/cp_mp/utility/killstreak_utility::teamhasuav(victim.team)) {
            self.modifiers["enemyHasUAV"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_9a860a2c838066cd"));
        }
        if (isdefined(victim.stuckbygrenadeowner) && victim.stuckbygrenadeowner == self) {
            self.modifiers["grenadestuck"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"grenadestuck"));
        }
        if (isassaulting(victim)) {
            self.modifiers["assault"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"assaulting"));
            incrementobjectiveachievementkill();
        }
        if (isdefending(victim)) {
            self.modifiers["defender"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"defending"));
            incrementobjectiveachievementkill();
        }
        if (meansofdeath == "MOD_MELEE") {
            self.modifiers["melee"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"melee"));
            if (weapongroup != "weapon_melee" && weapongroup != "weapon_melee2") {
                self.modifiers["gunbutt"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"gunbutt"));
            }
        }
        heldoffhand = victim getheldoffhand();
        if (function_f581838ce4328f7a(heldoffhand) == "frag_grenade" || heldoffhand.basename == "cluster_grenade_mp") {
            self.modifiers["cooking"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"cooking"));
        }
        if (istrue(deathdata.assistedsuicide)) {
            self.modifiers["assistedsuicide"] = 1;
        }
        if (self.pers["cur_death_streak"] > 3) {
            self.modifiers["comeback"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"comeback"));
        }
        if (meansofdeath != "MOD_GRENADE" && (meansofdeath == "MOD_HEAD_SHOT" || function_632bdd4591097aef(deathdata.hitloc) || isxmike109explosiveheadshot(objweapon, deathdata) || function_d355d90bab289087(objweapon, deathdata))) {
            self.modifiers["headshot"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"headshot"));
        }
        if (isdefined(self.wasti) && self.wasti && curtime - self.spawntime <= 5000) {
            self.modifiers["jackintheboxkill"] = 1;
        }
        if (!isreallyalive(self) && isdefined(self.deathtime)) {
            timesincelastdeath = gettime() - self.deathtime;
            if (timesincelastdeath < 1500 && timesincelastdeath > 0) {
                self.modifiers["posthumous"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"posthumous"));
            }
        }
        if (level.teambased && isdefined(victim.lastkilltime) && curtime - victim.lastkilltime < 1500) {
            if (isdefined(victim.lastkilledplayer) && victim.lastkilledplayer != self) {
                self.modifiers["avenger"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"avenger"));
            }
        }
        if (isbackkill(self, victim, meansofdeath)) {
            self.modifiers["backstab"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"backstab"));
        }
        if (!istrue(self isnightvisionon())) {
            self.modifiers["withoutnvgs"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"withoutnvgs"));
        }
        if (attackerisinflictor) {
            var_3c709d201f0772ad = getshotdistancetype(self, objweapon, meansofdeath, attackerposition, victim);
            killdist = math::round_float(distance(attackerposition, victim.origin) / 39.37, 2);
            namespace_6b49ddb858f34366::function_822c6ec14dbe6941(killdist);
            switch (var_3c709d201f0772ad) {
            case #"hash_e1ae7daca67ccc55":
                self.modifiers["pointblank"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"shortrange"));
                break;
            case #"hash_bbddd8225d923d3":
                self.modifiers["longshot"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"longrange"));
                self setclientomnvar("ui_longshot_dist", killdist);
                self setclientomnvar("ui_longshot_special", islongshotspecial(attackerposition, victim, objweapon));
                break;
            case #"hash_4364fa08acd17954":
                self.modifiers["longshot"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"longrange"));
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_72a2c2883e780324"));
                self.modifiers["very_longshot"] = 1;
                self setclientomnvar("ui_longshot_dist", killdist);
                self setclientomnvar("ui_longshot_special", islongshotspecial(attackerposition, victim, objweapon));
                break;
            }
            if (istrue(self.focus) || isdefined(self.focuslasttime) && isdefined(self.lastshotfiredtime) && self.lastshotfiredtime == self.focuslasttime && curtime - self.focuslasttime <= 6000) {
                self.modifiers["holdingbreath"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"holdbreath"));
            }
            if (scripts/mp/class::isweaponsilenced(objweapon)) {
                self.modifiers["silencedkill"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"silenced"));
            }
            if (victim scripts/mp/weapons::isstunnedorblinded()) {
                self.modifiers["victimimpairedkill"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_c7bef9ff3af2dead"));
                self.modifiers["detectedimpairedkill"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_9a9737f7fd4326f"));
            }
            if (istrue(victim.ishaywire)) {
                self.modifiers["victim_haywire"] = 1;
                self.modifiers["mask3"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask3"], function_e2ff8f4b4e94f723(#"hash_7f94e61c1787fc14", #"victim_haywire"));
            }
            if (isdetected(self, victim)) {
                self.modifiers["detectedimpairedkill"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_9a9737f7fd4326f"));
            }
            if (isdefined(deathdata.damageflags) && deathdata.damageflags & 8 && !(deathdata.damageflags & 16384)) {
                self.modifiers["coverkill"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"cover_kill"));
            }
            if (scripts/mp/weapons::grenadeheldatdeath()) {
                self.modifiers["clutchkill"] = 1;
            }
            if (issurvivorkill(self)) {
                self.modifiers["low_health_kill"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"lowhealth"));
            }
            if (!self isonground()) {
                self.modifiers["airborne"] = 1;
            }
            if (!victim isonground()) {
                self.modifiers["victim_airborne"] = 1;
            }
            if (isdefined(victim.var_69a9151e7de440f1)) {
                self.modifiers["victim_has_dmz_bounty"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"victim_has_dmz_bounty"));
            }
            if (self playermount() >= 0.5) {
                self.modifiers["mounted"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"mounted"));
            }
            if (self ishanging()) {
                self.modifiers["ledgehanging"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"ledgehanging"));
            }
            if (isbulletdamage) {
                self.modifiers["bullet_damage"] = 1;
                var_3483795b0a68eb95 = self getweaponammoclip(objweapon);
                if (var_3483795b0a68eb95 <= 0) {
                    self.modifiers["last_bullet_kill"] = 1;
                    self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"lastbullet"));
                }
                var_ff3b6faa21cbea11 = objweapon.isauto;
                var_31a90ef4f5a008a8 = objweapon.issemiauto;
                burstfirecount = objweapon.burstcount;
                if (isdefined(var_ff3b6faa21cbea11) && istrue(var_ff3b6faa21cbea11)) {
                    self.modifiers["full_auto_kill"] = 1;
                    self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"full_auto_kill"));
                }
                if (isdefined(var_31a90ef4f5a008a8) && istrue(var_31a90ef4f5a008a8)) {
                    self.modifiers["semi_auto_kill"] = 1;
                    self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"semi_auto_kill"));
                }
                if (isdefined(burstfirecount) && burstfirecount > 0) {
                    self.modifiers["burst_kill"] = 1;
                    self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"burst_kill"));
                }
                if (isplayerads()) {
                    var_4da4661d6f703308 = self function_c603bed3b1c8d11(self.currentprimaryweapon);
                    if (var_4da4661d6f703308) {
                        self.modifiers["tac_stance"] = 1;
                        self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_3d20b9f56f230af1"));
                    } else {
                        self.modifiers["ads"] = 1;
                        self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"ads"));
                    }
                } else {
                    self.modifiers["hipfire"] = 1;
                    self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hipfire"));
                }
            }
            if (victim issprinting()) {
                self.modifiers["victim_sprinting"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"victimsprinting"));
            }
            if (level.teambased) {
                players = getfriendlyplayers(self.team, 1);
                foreach (player in players) {
                    if (player == self) {
                        continue;
                    }
                    if (distancesquared(self.origin, player.origin) < 90000) {
                        self.modifiers["buddy_kill"] = 1;
                        break;
                    }
                }
            }
            if (scripts/mp/weapons::isstunnedorblinded()) {
                self.modifiers["impaired"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"enemystunned"));
            }
            if (isdefined(self.tookweaponfrom) && isdefined(self.tookweaponfrom[var_366b0ecc2f28aead]) && self.tookweaponfrom[var_366b0ecc2f28aead] == victim) {
                self.modifiers["backfire"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"backfire"));
            }
        } else if (weapongroup == "weapon_projectile") {
            if (isdefined(inflictor) && isdefined(inflictor.adsfire)) {
                if (inflictor.adsfire) {
                    self.modifiers["ads"] = 1;
                    self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"ads"));
                } else {
                    self.modifiers["hipfire"] = 1;
                    self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hipfire"));
                }
            }
        }
        vehicle = scripts/cp_mp/utility/player_utility::getvehicle(1);
        if (isdefined(vehicle)) {
            self.modifiers["in_vehicle"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"invehicle"));
            if (vehicle scripts/common/vehicle::ishelicopter()) {
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"from_helicopter"));
            } else if (vehicle.vehiclename == "veh9_mil_lnd_mrap") {
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_dbaf3685f1412e50"));
                modifiers2 = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_dbaf3685f1412e50"));
            }
        }
        if (victim function_9cc921a57ff4deb5() || victim isonzipline()) {
            self.modifiers["victim_on_zipline"] = 1;
            self.modifiers["mask3"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask3"], function_e2ff8f4b4e94f723(#"hash_7f94e61c1787fc14", #"victim_on_zipline"));
        }
        if (!victim isonground() && !victim iswallrunning() && !self isonground() && !self iswallrunning()) {
            if (attackerisinflictor) {
                self.modifiers["air_to_air_kill"] = 1;
            }
        } else {
            if (attackerisinflictor) {
                if (self iswallrunning()) {
                    self.modifiers["wallkill"] = 1;
                } else if (function_78dbf8d8bcbed882(self, meansofdeath, victim)) {
                    self.modifiers["jumpkill"] = 1;
                    self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"jumpkill"));
                } else if (events_issliding()) {
                    self.modifiers["slidekill"] = 1;
                    self.modifiers["sliding"] = 1;
                    self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"slide"));
                } else if (self isonladder()) {
                    self.modifiers["onladder"] = 1;
                    self.modifiers["mask3"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask3"], function_e2ff8f4b4e94f723(#"hash_7f94e61c1787fc14", #"onladder"));
                }
                if (!isdefined(vehicle)) {
                    stance = self getstance();
                    switch (stance) {
                    case #"hash_c6775c88e38f7803":
                        self.modifiers["standing_kill"] = 1;
                        self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"standing"));
                        break;
                    case #"hash_d91940431ed7c605":
                        self.modifiers["prone_kill"] = 1;
                        self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"prone"));
                        break;
                    case #"hash_3fed0cbd303639eb":
                        self.modifiers["crouch_kill"] = 1;
                        self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"crouch"));
                        break;
                    }
                }
            }
            if (victim iswallrunning()) {
                self.modifiers["killonwall"] = 1;
            } else if (isskeetshooter(self, objweapon, meansofdeath, attackerposition, victim)) {
                self.modifiers["killinair"] = 1;
            }
        }
        if (isdefined(victim.streakdata)) {
            foreach (streakinfo in victim.streakdata.streaks) {
                costdiff = streakinfo.currentcost - victim.streakpoints;
                if (costdiff > 0 && costdiff <= 1) {
                    self.modifiers["buzzkill"] = victim.pers["cur_kill_streak"];
                    self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"buzzkill"));
                    break;
                }
            }
        }
        if (!runleanthreadmode()) {
            if (level.teambased) {
                var_4cb03cedeb6f7b81 = 0;
                enemies = getenemyplayers(self.team);
                foreach (enemy in enemies) {
                    if (enemy.score > 0) {
                        var_4cb03cedeb6f7b81 = 1;
                        break;
                    }
                }
                if (var_4cb03cedeb6f7b81) {
                    if (is_enemy_highest_score(victim, enemies)) {
                        self.modifiers["kingslayer"] = 1;
                        self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"kingslayer"));
                    }
                }
            } else {
                var_4cb03cedeb6f7b81 = 0;
                foreach (enemy in level.players) {
                    if (enemy.score > 0) {
                        var_4cb03cedeb6f7b81 = 1;
                        break;
                    }
                }
                if (var_4cb03cedeb6f7b81) {
                    if (is_enemy_highest_score(victim, level.players)) {
                        self.modifiers["kingslayer"] = 1;
                        self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"kingslayer"));
                    }
                }
            }
        }
        if (isdefined(inflictor) && istrue(inflictor.isequipment) && meansofdeath == "MOD_IMPACT" && !isthrowingknife(objweapon)) {
            self.modifiers["item_impact"] = 1;
        }
        if (islauncherdirectimpactdamage(objweapon, meansofdeath)) {
            self.modifiers["launcher_impact"] = 1;
        }
        if (islauncherdirectimpactdamage(objweapon, meansofdeath, 1)) {
            self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"launcher_impact"));
        }
        if (var_72705a221874f8a9 >= 0.6428) {
            self.modifiers["victim_in_standard_view"] = 1;
        }
        if (isdefined(self.lastadsstarttime) && curtime - self.lastadsstarttime <= 500 && (weapongroup == "weapon_sniper" || weapongroup == "weapon_dmr")) {
            self.modifiers["quickscope"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"quickscope"));
        }
        if (isdefined(self.lastweaponchangetime) && curtime - self.lastweaponchangetime <= 2500) {
            self.modifiers["weapon_change_kill"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"weaponswap"));
        }
        if (isdefined(self.tookweaponfrom) && isdefined(self.tookweaponfrom[var_366b0ecc2f28aead]) && self.tookweaponfrom[var_366b0ecc2f28aead].team != self.team) {
            self.modifiers["weapon_pickup_kill"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_30a2422996add07a"));
        }
        if (isdefined(self.lastreloadtime) && curtime - self.lastreloadtime <= 5000) {
            self.modifiers["reload_kill"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"recentreload"));
        }
        if (isdefined(self.var_887efc1f015b6a78) && curtime - self.var_887efc1f015b6a78 <= 5000) {
            self.modifiers["after_sprint_kill"] = 1;
            self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"after_sprint_kill"));
        }
        if (istrue(victim.isdefusing)) {
            self.modifiers["killed_defuser"] = 1;
        }
        if (istrue(victim.isplanting)) {
            self.modifiers["killed_planter"] = 1;
        }
        if (iscacsecondaryweapon(objweapon) || _hasperk("specialty_munitions_2") && isdefined(self.secondaryweaponobj) && objweapon == self.secondaryweaponobj) {
            self.modifiers["secondary_weapon"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"usingsecondaryweapon"));
        }
        if (isinlaststand(self)) {
            self.modifiers["last_stand"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"laststand"));
        }
        if (isinlaststand(victim) || istrue(deathdata.brvictiminlaststand)) {
            self.modifiers["victim_last_stand"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"victimlaststand"));
        }
        inradiation = istrue(scripts/engine/utility::function_f3bb4f4911a1beb2("radiation", "radiation_isInRadiation", victim.origin)) || istrue(scripts/engine/utility::function_f3bb4f4911a1beb2("biobunker_radiation", "isInBiobunkerRadiationVolume", victim.origin));
        if (istrue(inradiation)) {
            self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_bdb8870aac1e8299"));
        }
        var_e27987bea6bad0d6 = istrue(scripts/engine/utility::function_f3bb4f4911a1beb2("radiation", "radiation_isInRadiation", self.origin)) || istrue(scripts/engine/utility::function_f3bb4f4911a1beb2("biobunker_radiation", "isInBiobunkerRadiationVolume", self.origin));
        if (istrue(var_e27987bea6bad0d6)) {
            self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"in_radiation"));
        }
        platform = self getmovingplatformparent();
        if (isdefined(platform) && platform scripts/cp_mp/vehicles/vehicle::isvehicle() && istrue(platform.isheli)) {
            self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"from_helicopter"));
            ref = platform scripts/cp_mp/vehicles/vehicle::function_d93ec4635290febd();
            if (ref == "veh9_palfa") {
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_71e5f339792a9ef6"));
            }
        }
        if (victim scripts/cp_mp/utility/player_utility::isinvehicle() || isdefined(victim.lastvehicle)) {
            self.modifiers["victim_in_vehicle"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"victiminvehicle"));
        }
        if (self function_a7de57196f4b5d16()) {
            self.modifiers["vehiclelean"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"vehiclelean"));
            if (vehicle scripts/cp_mp/vehicles/vehicle::function_d93ec4635290febd() == "veh9_sedan_hatchback_1985") {
                self.modifiers["vehiclelean_sedan"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"vehiclelean_sedan"));
            }
        }
        if (meansofdeath == "MOD_PISTOL_BULLET" || meansofdeath == "MOD_RIFLE_BULLET" || meansofdeath == "MOD_HEAD_SHOT" || weaponclass(objweapon) == "spread") {
            thread watchForMoreBulletKillsInAFrameAE();
            if (!isdefined(self.var_39a4aa8a028cb36e)) {
                self.var_39a4aa8a028cb36e = 1;
            } else {
                self.var_39a4aa8a028cb36e++;
                if (self.var_39a4aa8a028cb36e >= 2) {
                    function_c5f08330d9923476(self.var_39a4aa8a028cb36e);
                }
            }
        }
        if (isdefined(meansofdeath)) {
            switch (meansofdeath) {
            case #"hash_d8646db4e6ee3658":
                self.modifiers["fire_damage"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"fire"));
                break;
            case #"hash_b1078ff213fddba6":
                self.modifiers["impact_damage"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"equipmentimpact"));
                break;
            case #"hash_abb1587cdc6def23":
                self.modifiers["crush_damage"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"crush"));
                break;
            default:
                break;
            }
        }
        if (isdefined(objweapon.basename) && issubstr(objweapon.basename, "molotov") || issubstr(objweapon.basename, "thermite") || scripts/cp_mp/dragonsbreath::isdragonsbreathweapon(objweapon) || scripts/cp_mp/crossbow::function_fc87aff67fb01e6f(objweapon)) {
            self.modifiers["fire_damage"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"fire"));
        }
        if (istrue(victim.gulagjailer)) {
            self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_df17df92939ae42d"));
        }
        for (moverparent = self; true; moverparent = newparent) {
            if ((isplayer(moverparent) || isactor(moverparent)) && !moverparent islinked()) {
                newparent = moverparent getmovingplatformparent(1);
            } else {
                newparent = moverparent getlinkedparent();
            }
            if (!isdefined(newparent)) {
                break;
            }
        }
        if (isdefined(moverparent) && moverparent scripts/cp_mp/vehicles/vehicle::isvehicle() && (!isdefined(vehicle) || moverparent != vehicle)) {
            ref = scripts/cp_mp/utility/train_utility::function_e58b746157089c68(moverparent);
            if (isdefined(ref) && (ref == "cargo_train" || ref == "br_passenger_train")) {
                self.modifiers["ontrain"] = 1;
                if (ref == "cargo_train") {
                    self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_7d4ca6b82b853a92"));
                } else if (ref == "br_passenger_train") {
                    self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_8345a13afbaa0f66"));
                }
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"ontrain"));
            } else {
                self.modifiers["vehiclesurf"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"vehiclesurf"));
                if (moverparent.classname == "script_vehicle" && moverparent vehicle_getspeed() > 25) {
                    self.modifiers["infastvehicle"] = 1;
                    self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"infastvehicle"));
                }
            }
        }
        if (isdefined(inflictor) && isdefined(inflictor.equipmentref)) {
            if (inflictor.equipmentref == "equip_c4" || inflictor.equipmentref == "equip_claymore") {
                stuckto = inflictor getlinkedparent();
                if (isdefined(stuckto) && isdefined(stuckto.helperdronetype) && stuckto.helperdronetype == "radar_drone_recon") {
                    self.modifiers["recon_drone_explosive"] = 1;
                    self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"recondroneexplosive"));
                    if (level.challengesallowed && isdefined(stuckto.owner)) {
                        self.recondroneteammate = stuckto.owner;
                    }
                } else if (isdefined(stuckto) && stuckto scripts/cp_mp/vehicles/vehicle::isvehicle()) {
                    self.modifiers["vehicle_explosive"] = 1;
                    self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"vehicleexplosive"));
                    if (stuckto scripts/common/vehicle::ishelicopter()) {
                        self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"helicopter_explosive"));
                    }
                }
            }
        }
        if (isvehicleweapon(objweapon) && meansofdeath == "MOD_EXPLOSIVE") {
            self.modifiers["vehicle_explosive"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"vehicleexplosive"));
            if (function_858ed945747dfb28(objweapon)) {
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"helicopter_explosive"));
            }
        }
        if (namespace_f8d3520d3483c1::hasarmor()) {
            self.modifiers["wearingarmor"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"wearingarmor"));
        }
        if (namespace_f8d3520d3483c1::function_9bca5c1d23a3e0b3()) {
            self.modifiers["fullarmor"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"fullarmor"));
        }
        var_831b0df5dbb687cf = namespace_9823ee6035594d67::function_c0a211a69f5f8f2f(victim.origin);
        if (isdefined(var_831b0df5dbb687cf) && !namespace_9823ee6035594d67::function_4ec4f39a2e1745f2(var_831b0df5dbb687cf)) {
            self.modifiers["victiminstronghold"] = 1;
            self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"victiminstronghold"));
            if (namespace_9823ee6035594d67::function_771f278c8c749a28(var_831b0df5dbb687cf)) {
                self.modifiers["victiminlockedstronghold"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"victiminlockedstronghold"));
            }
        }
        if (scripts/mp/gametypes/br_public::isplayeringulag()) {
            self.modifiers["in_gulag"] = 1;
            self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"in_gulag"));
        }
        if (isdefined(victim.origin)) {
            if (isdefined(level.var_a68dcd3b5a82712d)) {
                foreach (struct in level.var_a68dcd3b5a82712d) {
                    dist = distance2d(struct.origin, victim.origin);
                    if (dist <= struct.radius) {
                        self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_ebe31a17688c2e8c"));
                    }
                }
            }
            if (isdefined(level.activetowers) && isdefined(self.team)) {
                foreach (instance in level.activetowers) {
                    if (isdefined(instance.activeteam) && instance.activeteam == self.team) {
                        dist = distance2d(instance.origin, victim.origin);
                        if (dist <= level.var_6acf91bbf5273e8f) {
                            self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_761c8b5df6d221f"));
                        }
                    }
                }
            }
        }
        usingsuppressor = objweapon issilenced();
        if (istrue(usingsuppressor)) {
            self.modifiers["attachment_flags"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"suppressor"));
        }
        if (isdefined(objweapon.scope)) {
            var_7a4444efa68407fa = objweapon.scope;
            basetype = function_7c612ac92ba98dcb(objweapon, var_7a4444efa68407fa);
            if (basetype == "ironsdefault") {
                self.modifiers["attachment_flags"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"irons"));
            } else if (basetype == "reflex" || basetype == "minireflex") {
                self.modifiers["attachment_flags"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"reflex"));
            } else if (basetype == "hybrid") {
                self.modifiers["attachment_flags"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"hybrid"));
            } else if (basetype == "acog") {
                self.modifiers["attachment_flags"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"acog"));
            } else if (basetype == "holo") {
                self.modifiers["attachment_flags"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"holo"));
            }
            if (function_ec9cd761df1a3271(objweapon, var_7a4444efa68407fa)) {
                self.modifiers["attachment_flags"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"thermal"));
            }
        }
        if (isdefined(objweapon) && isdefined(self.team)) {
            team = scripts/mp/gametypes/br_weapons::function_1a561e5ef2eca63a(self, objweapon);
            if (isdefined(team) && team != self.team) {
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_13530691b902b58"));
            }
        }
        if (meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH") {
            if (isdefined(inflictor.threwback) && inflictor.threwback) {
                self.modifiers["throwback_grenade_kill"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"throwback_grenade"));
            }
        }
        if (meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH") {
            if (isdefined(inflictor.iscooked) && inflictor.iscooked) {
                self.modifiers["with_cooked_grenade_kill"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_5b4eb501eaf86d4e"));
            }
        }
        if (isdefined(victim.damagedplayers)) {
            foreach (guid, damagetime in victim.damagedplayers) {
                if (isdefined(guid) && guid == self.guid && isdefined(damagetime) && curtime - damagetime < 15000) {
                    self.modifiers["damager_kill"] = 1;
                    self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_d5f7402ac6e6fc0c"));
                }
            }
        }
        if (level.teambased) {
            if (isdefined(victim.damagedplayers)) {
                enemies = teams::getenemyplayers(self.team);
                foreach (guid, damagetime in victim.damagedplayers) {
                    victimisenemy = 0;
                    foreach (enemy in enemies) {
                        if (guid == enemy.guid) {
                            victimisenemy = 1;
                            break;
                        }
                    }
                    if (isdefined(guid) && guid != self.guid && victimisenemy == 0 && isdefined(damagetime) && curtime - damagetime < 15000) {
                        self.modifiers["team_damager_kill"] = 1;
                        self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_fbf026161c1d9738"));
                    }
                }
            }
        }
        zoomlevel = self playergetzoomfov();
        if (isdefined(zoomlevel) && zoomlevel <= 22) {
            self.modifiers["extreme_magnification_kill"] = 1;
            self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"extreme_magnification_kill"));
        }
        function_245eb5b8f095001b(objweapon, meansofdeath, inflictor);
    }
    if (istrue(objweapon.isalternate)) {
        self.modifiers["isaltmode"] = 1;
        self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"isaltmode"));
    }
    if (isdefined(self.lastkilledby) && self.lastkilledby == victim) {
        self.modifiers["revenge"] = 1;
        self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"revenge"));
    }
    nemesis = getnemesis();
    if (nemesis.size > 0) {
        foreach (guid in nemesis) {
            if (victimguid == guid) {
                self.modifiers["killedNemesis"] = 1;
                self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"nemesis"));
                break;
            }
        }
    }
    if (self isswimming()) {
        self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"swimming"));
        if (self isswimunderwater()) {
            self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"underwater"));
        }
    }
    if (isagent(victim)) {
        if (victim getthreatsight(self) < 1) {
            self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"unaware"));
        }
    }
    hitloc = 0;
    if (scripts/cp_mp/utility/damage_utility::validshotcheck(meansofdeath, self)) {
        switch (deathdata.hitloc) {
        case #"hash_db653a4972b3c13b":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"none");
            break;
        case #"hash_8a1772f5f912c880":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"helmet");
            break;
        case #"hash_b107b5547c755d23":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"head");
            break;
        case #"hash_92bbfe494d03d772":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"neck");
            break;
        case #"hash_24df6c1a53c03c53":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"upper_torso");
            break;
        case #"hash_51d5d0b9add9cc5a":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"left_upper_arm");
            break;
        case #"hash_d42e71cd9f1e822f":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"right_upper_arm");
            break;
        case #"hash_a7980c387477e7bb":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"left_lower_arm");
            break;
        case #"hash_5d5aac570f6fd382":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"right_lower_arm");
            break;
        case #"hash_da51cc36a471058":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"left_hand");
            break;
        case #"hash_da2f35145aa58933":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"right_hand");
            break;
        case #"hash_810a7426c8bac3ac":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"left_upper_leg");
            break;
        case #"hash_1cbc508a2fe01b79":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"right_upper_leg");
            break;
        case #"hash_7b36142458a6c2d5":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"left_lower_leg");
            break;
        case #"hash_a638fec9040cfcf4":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"right_lower_leg");
            break;
        case #"hash_168c74e879f0ba11":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"left_foot");
            break;
        case #"hash_9536712388e65bce":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"right_foot");
            break;
        case #"hash_fb5b5e6c07253005":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"gun");
            break;
        case #"hash_b2116949ba13eb10":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"shield");
            break;
        case #"hash_25789111b74943b4":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"armor");
            break;
        case #"hash_df21ff8a0b282215":
            hitloc = function_e2ff8f4b4e94f723(#"hit_loc", #"soft");
            break;
        }
    }
    self.modifiers["hit_loc"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["hit_loc"], hitloc);
    if (istrue(self.var_859654e0445a36d9)) {
        self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"holding_hostage"));
    }
    if (self function_b02c8e799779bc10(victim getentitynumber())) {
        self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"pinged"));
    }
    if (weapongroup == "other") {
        checklethalequipmentachievement(objweapon);
    }
}

// Namespace events / scripts/mp/events
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77d2
// Size: 0x2d
function function_245eb5b8f095001b(objweapon, meansofdeath, inflictor) {
    function_cfa5eaed45133b7(inflictor, objweapon);
    function_a7168c7ec3eb917a(objweapon);
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7806
// Size: 0x2a4
function function_cfa5eaed45133b7(inflictor, objweapon) {
    if (issharedfuncdefined("weapons", "recommendedStatusBySeason")) {
        var_2420b2d3569c0c6 = [[ utility::getsharedfunc("weapons", "recommendedStatusBySeason") ]](objweapon, inflictor);
        if (isdefined(var_2420b2d3569c0c6)) {
            if (var_2420b2d3569c0c6[0]) {
                self.modifiers["recommended_season_0"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"recommended_season_0"));
            }
            if (var_2420b2d3569c0c6[1]) {
                self.modifiers["recommended_season_1"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"recommended_season_1"));
            }
            if (var_2420b2d3569c0c6[2]) {
                self.modifiers["recommended_season_2"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"recommended_season_2"));
            }
            if (var_2420b2d3569c0c6[3]) {
                self.modifiers["recommended_season_3"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"recommended_season_3"));
            }
            if (var_2420b2d3569c0c6[4]) {
                self.modifiers["recommended_season_4"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"recommended_season_4"));
            }
            if (var_2420b2d3569c0c6[5]) {
                self.modifiers["recommended_season_5"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"recommended_season_5"));
            }
            if (var_2420b2d3569c0c6[6]) {
                self.modifiers["recommended_season_6"] = 1;
                self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"recommended_season_6"));
            }
        }
    }
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ab1
// Size: 0x4c6
function function_a7168c7ec3eb917a(objweapon) {
    if (isdefined(objweapon.attachments)) {
        var_a7b01beb1843361a = 0;
        foreach (attachment in objweapon.attachments) {
            attachmentscriptbundle = getscriptbundle(hashcat(%"hash_3c2c9813bb16552f", attachment));
            if (isdefined(attachmentscriptbundle)) {
                if (attachmentscriptbundle.var_f0e7c0926c0962e5) {
                    self.modifiers["weapon_has_AMP"] = 1;
                    self.modifiers["attachment_flags"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"amp"));
                }
                if (attachmentscriptbundle.category == "CONVERSIONKIT") {
                    self.modifiers["weapon_has_conversionkit"] = 1;
                    self.modifiers["attachment_flags"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"CONVERSIONKIT"));
                }
                if (attachmentscriptbundle.category == "OPTIC" || issubstr(attachment, "scope")) {
                    self.modifiers["weapon_has_scope"] = 1;
                    self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_efa8718cf03a1110"));
                }
                if (isdefined(attachmentscriptbundle.baseref) && (issubstr(attachmentscriptbundle.baseref, "ub_gl") || issubstr(attachmentscriptbundle.baseref, "ub_sh") || issubstr(attachmentscriptbundle.baseref, "ub_flame") || issubstr(attachmentscriptbundle.baseref, "ub_saw"))) {
                    if (isdefined(objweapon.classname) && (objweapon.classname == "grenade" || objweapon.classname == "spread" || objweapon.classname == "projectile")) {
                        self.modifiers["weapon_has_underbarrel"] = 1;
                        self.modifiers["attachment_flags"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"underbarrel"));
                    }
                }
                if (isdefined(attachmentscriptbundle.baseref) && issubstr(attachmentscriptbundle.baseref, "akimbo")) {
                    self.modifiers["weapon_has_akimbo"] = 1;
                    self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"akimbo"));
                }
                if (isdefined(attachmentscriptbundle.baseref) && issubstr(attachmentscriptbundle.baseref, "ammo") && isdefined(attachmentscriptbundle.category) && attachmentscriptbundle.category == "GUNPERK") {
                    self.modifiers["weapon_has_alternate_ammo"] = 1;
                    self.modifiers["mask3"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask3"], function_e2ff8f4b4e94f723(#"hash_7f94e61c1787fc14", #"hash_f9b754255057f953"));
                }
                if (attachmentscriptbundle.category != "RECEIVER" && attachmentscriptbundle.category != "NONE") {
                    var_a7b01beb1843361a++;
                }
            }
        }
        if (var_a7b01beb1843361a >= 5) {
            self.modifiers["fully_loaded_kill"] = 1;
            self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"fully_loaded_kill"));
        }
        if (var_a7b01beb1843361a == 0) {
            self.modifiers["barebones_kill"] = 1;
            self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"barebones_kill"));
        }
    }
}

// Namespace events / scripts/mp/events
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f7e
// Size: 0x1405
function killedplayer(killid, victim, objweapon, meansofdeath, inflictor, deathdata) {
    curtime = gettime();
    objweapon = function_1e3102980c3a4cc1(objweapon);
    function_b7f154368abbe463(victim, objweapon, meansofdeath, inflictor, deathdata);
    if (istrue(victim.islaststandbleedoutdmg) && isdefined(victim.laststandattackermodifiers)) {
        self.modifiers = victim.laststandattackermodifiers;
    }
    checkkillstreakkillevents(objweapon, meansofdeath, inflictor);
    thread checkfinalkillachievements(victim);
    victimguid = victim.guid;
    myguid = self.guid;
    var_366b0ecc2f28aead = getcompleteweaponname(objweapon);
    iskillstreakweapon = istrue(deathdata.iskillstreakweapon) || scripts/mp/utility/killstreak::isjuggernaut();
    thread killedplayernotifysys(killid, victim, objweapon, meansofdeath);
    thread updaterecentkills(killid, victim, objweapon, var_366b0ecc2f28aead, iskillstreakweapon);
    thread updatec4vehiclemultkill(meansofdeath, inflictor);
    thread updateghostridekills();
    thread updatequadfeedcounter(self, killid, iskillstreakweapon);
    self.prevlastkilltime = self.lastkilltime;
    self.lastkilltime = curtime;
    self.lastkilledplayer = victim;
    self.lastkillvictimpos = victim.origin;
    if (!isdefined(level.numkills)) {
        level.numkills = 0;
    } else {
        level.numkills++;
    }
    if (self.deaths > 0) {
        kdr = self.kills / self.deaths;
        if (kdr > 3) {
            level thread scripts/mp/battlechatter_mp::saytoself(self, "plr_kd_high", undefined, 0.75);
        }
    } else if (self.kills > 5) {
        level thread scripts/mp/battlechatter_mp::saytoself(self, "plr_kd_high", undefined, 0.75);
    }
    if (istrue(self.laststanding)) {
        incpersstat("clutch", 1);
    }
    self.damagedplayers[victimguid] = undefined;
    weapongroup = getweapongroup(objweapon.basename);
    hvtKill(victim);
    if (istrue(self.modifiers["firstblood"])) {
        firstblood(killid);
    }
    if (istrue(self.modifiers["execution"])) {
        execution(killid);
    }
    if (namespace_6c622b52017c6808::function_8ef404291ea37583(victim)) {
        namespace_6c622b52017c6808::function_e01bc5dba2da7d6a(victim);
    }
    if (!iskillstreakweapon(objweapon.basename) && !_hasperk("specialty_explosivebullets")) {
        if (objweapon.basename == "none" && meansofdeath != "MOD_EXECUTION") {
            return 0;
        }
        attackerisinflictor = attackerisinflictor(self, inflictor, objweapon, meansofdeath);
        if (istrue(self.modifiers["oneshotkill"])) {
            thread scripts/mp/utility/points::doScoreEvent(#"one_shot_kill");
            incpersstat("oneShotOneKills", 1);
        }
        if (istrue(self.modifiers["gunbutt"])) {
            thread scripts/mp/utility/points::doScoreEvent(#"gun_butt");
        }
        if (meansofdeath == "MOD_MELEE") {
            if (objweapon.basename == "iw9_me_fists_mp") {
                thread scripts/mp/utility/points::doScoreEvent(#"fist_kill");
            }
        }
        if (istrue(self.modifiers["assistedsuicide"])) {
            assistedsuicide(killid, objweapon);
        }
        if (istrue(self.modifiers["comeback"])) {
            comeback(killid);
        }
        if (istrue(self.modifiers["headshot"])) {
            level thread scripts/mp/battlechatter_mp::saytoself(self, "plr_killfirm_headshot", undefined, 0.75);
            headshot(killid);
        }
        if (isdefined(self.vehicle) && isdefined(self.vehicle.combo)) {
            thread scripts/mp/utility/points::doScoreEvent(#"combo");
        }
        if (istrue(self.modifiers["posthumous"])) {
            postdeathkill(killid);
        }
        if (!isreallyalive(self) && isdefined(self.deathtime)) {
            timesincelastdeath = gettime() - self.deathtime;
            if (issimultaneouskillenabled()) {
                if (timesincelastdeath == 0 && isdefined(self.lastattacker) && self.lastattacker == victim) {
                    thread scripts/mp/utility/points::doScoreEvent(#"hash_992baa42f95d6a55", undefined, undefined, undefined, undefined, 1);
                    victim thread scripts/mp/utility/points::doScoreEvent(#"hash_992baa42f95d6a55", undefined, undefined, undefined, undefined, 1);
                }
            }
        }
        if (istrue(self.modifiers["avenger"])) {
            avengedplayer(killid, victim.lastkilledplayer);
        }
        var_5737b6f741a2cfd9 = undefined;
        if (victim isinexecutionattack()) {
            var_c962a2c5d41d3887 = utility::playersnear(victim.origin, 300);
            foreach (player in var_c962a2c5d41d3887) {
                if (player.team == self.team && player isinexecutionvictim()) {
                    var_5737b6f741a2cfd9 = player.guid;
                    defendedplayer(killid, player.guid);
                    break;
                }
            }
        }
        foreach (guid, damagetime in victim.damagedplayers) {
            if (guid == self.guid || guid == victim.guid) {
                continue;
            }
            if (isdefined(var_5737b6f741a2cfd9) && guid == var_5737b6f741a2cfd9) {
                continue;
            }
            if (level.teambased && curtime - damagetime < 1750) {
                defendedplayer(killid, guid);
            }
        }
        if (istrue(self.modifiers["pointblank"])) {
            thread pointblank(killid);
        }
        if (istrue(self.modifiers["longshot"])) {
            thread longshot(killid);
        }
        if (istrue(self.modifiers["very_longshot"])) {
            thread very_longshot(killid);
        }
        if (istrue(self.modifiers["backstab"])) {
            if (objweapon.basename == "iw8_knife_mp") {
                thread scripts/mp/utility/points::doScoreEvent(#"backstab");
            }
        }
        if (istrue(self.modifiers["silencedKill"])) {
            incpersstat("silencedKills", 1);
        }
        if (attackerisinflictor) {
            switch (weaponclass(objweapon.basename)) {
            case #"hash_8cdaf2e4ecfe5b51":
                incpersstat("arKills", 1);
                victim incpersstat("arDeaths", 1);
                if (meansofdeath == "MOD_HEAD_SHOT") {
                    incpersstat("arHeadshots", 1);
                }
                break;
            case #"hash_900cb96c552c5e8e":
                incpersstat("smgKills", 1);
                victim incpersstat("smgDeaths", 1);
                if (meansofdeath == "MOD_HEAD_SHOT") {
                    incpersstat("smgHeadshots", 1);
                }
                break;
            case #"hash_690c0d6a821b42e":
                incpersstat("shotgunKills", 1);
                victim incpersstat("shotgunDeaths", 1);
                if (meansofdeath == "MOD_HEAD_SHOT") {
                    incpersstat("shotgunHeadshots", 1);
                }
                break;
            case #"hash_fa24dff6bd60a12d":
                incpersstat("lmgKills", 1);
                victim incpersstat("lmgDeaths", 1);
                if (meansofdeath == "MOD_HEAD_SHOT") {
                    incpersstat("lmgHeadshots", 1);
                }
                break;
            case #"hash_6191aaef9f922f96":
                incpersstat("sniperKills", 1);
                victim incpersstat("sniperDeaths", 1);
                if (meansofdeath == "MOD_HEAD_SHOT") {
                    incpersstat("sniperHeadshots", 1);
                }
                break;
            case #"hash_61e969dacaaf9881":
                incpersstat("launcherKills", 1);
                victim incpersstat("launcherDeaths", 1);
                if (meansofdeath == "MOD_HEAD_SHOT") {
                    incpersstat("launcherHeadshots", 1);
                }
                break;
            case #"hash_719417cb1de832b6":
                incpersstat("pistolKills", 1);
                victim incpersstat("pistolPeaths", 1);
                if (meansofdeath == "MOD_HEAD_SHOT") {
                    incpersstat("pistolHeadshots", 1);
                }
                break;
            }
            if (meansofdeath == "MOD_MELEE") {
                incpersstat("meleeKills", 1);
                victim incpersstat("meleeDeaths", 1);
            }
            if (isdefined(level.supportdrones) && level.supportdrones.size > 0) {
                foreach (drone in level.supportdrones) {
                    if (drone.owner == self && drone.helperdronetype == "radar_drone_overwatch") {
                        drone.owner incpersstat("killstreakPersonalUAVKills", 1);
                        break;
                    }
                }
            }
            if (istrue(self.modifiers["low_health_kill"])) {
                thread doScoreEvent(#"low_health_kill");
                level thread scripts/mp/battlechatter_mp::trysaylocalsound(self, #"hash_2f4fcdb5f53af5ca", undefined, 1);
            }
            if (istrue(self.modifiers["ads"])) {
                incpersstat("adsKills", 1);
            } else if (istrue(self.modifiers["tac_stance"])) {
                incpersstat("tacStanceKills", 1);
            } else if (istrue(self.modifiers["hipfire"])) {
                incpersstat("hipfireKills", 1);
            }
            if (self ismantling()) {
                mantlekill();
            }
            if (istrue(self.modifiers["backfire"])) {
                backfire();
            }
        }
        if (istrue(self.modifiers["air_to_air_kill"])) {
            thread doScoreEvent(#"air_to_air_kill");
        }
        if (istrue(self.modifiers["wallkill"])) {
            thread doScoreEvent(#"wallrun_kill");
        }
        if (istrue(self.modifiers["jumpkill"])) {
            thread doScoreEvent(#"air_kill");
        }
        if (istrue(self.modifiers["sliding"])) {
            thread doScoreEvent(#"slide_kill");
        }
        if (istrue(self.modifiers["killonwall"])) {
            thread doScoreEvent(#"hash_a7776242889bf154");
        }
        if (istrue(self.modifiers["killinair"])) {
            thread doScoreEvent(#"hash_37c5d5f71008db1d");
        }
        if (istrue(self.modifiers["buzzkill"])) {
            buzzkill(killid, victim);
        }
        if (istrue(self.modifiers["impaired"])) {
            impairedkill();
        }
        if (istrue(self.var_bbcc5ab53663340a)) {
            thread points::doScoreEvent(#"hash_ff9169060550f017");
        }
        if (isdefined(victim.stuckbygrenade)) {
            level thread scripts/mp/battlechatter_mp::saytoself(self, "plr_killfirm_semtex", undefined, 0.75);
        }
        if (isthrowingknife(objweapon.basename)) {
            thread scripts/mp/utility/points::doScoreEvent(#"throwingknife_kill");
        }
        if (isdefined(getgametype()) && getgametype() == "arena") {
            if (issnowball(objweapon.basename)) {
                if (function_6acbd7091f4b88ea(objweapon.basename)) {
                    thread scripts/mp/utility/points::doScoreEvent(#"hash_82764141db0ed88b");
                }
            }
            if (isdefined(victim.equipment) && isdefined(victim.equipment["primary"])) {
                if (victim.equipment["primary"] == "equip_pball") {
                    thread scripts/mp/utility/points::doScoreEvent(#"hash_39405074c551a796");
                }
            }
        }
        if (isdefined(getgametype()) && getgametype() == "gold_gun") {
            if (function_ef71b0d20683d9aa(objweapon.basename)) {
                thread scripts/mp/utility/points::doScoreEvent(#"hash_2e26e029be55081f");
            }
            if (isdefined(victim.loadoutprimary)) {
                if (function_ef71b0d20683d9aa(victim.loadoutprimary)) {
                    thread scripts/mp/utility/points::doScoreEvent(#"hash_efced04ec930c90a");
                }
            }
            level notify("gold_gun_kill_evaluated");
        }
        if (isdefined(victim.var_99e82fcc9b77ec71) && victim.var_99e82fcc9b77ec71 > 0) {
            thread scripts/mp/utility/points::doScoreEvent(#"hash_d3c08c3f6954453c");
        }
        if (istrue(self.var_2bb368acf8b4df7d)) {
            thread scripts/mp/utility/points::doScoreEvent(#"hash_ff01718cba9cb661");
        }
        if (istrue(victim.var_b9976aacfe15a7ba) || victim getscriptablepartstate("superpowers_aura", 1) == "on") {
            thread scripts/mp/utility/points::doScoreEvent(#"hash_dd4c110c01e2b46f");
        }
        if (scripts/mp/gamescore::isdebuffedbyweaponandplayer(self, victim, "decoy_grenade_mp")) {
            scripts/mp/rank::scoreeventpopup(#"hash_b2f4241375a3dc69");
        }
        if (istrue(self.modifiers["kingslayer"]) && getgametype() != "ballmode") {
            kingslayer(killid, victim);
            if (getgametype() == "gun" && meansofdeath == "MOD_MELEE") {
                thread scripts/mp/utility/points::doScoreEvent(#"hash_fe6243d280c9e5cf");
            }
        }
        if (self.score < victim.score) {
            incpersstat("higherRankedKills", 1);
        } else {
            incpersstat("lowerRankedKills", 1);
        }
        cur_kill_streak = self.pers["cur_kill_streak"] + 1;
        streaknum = 5;
        if (level.gametype == "arm" || level.gametype == "conflict" || level.gametype == "risk" || level.gametype == "brtdm" || level.gametype == "brtdm_mgl") {
            streaknum = 10;
        }
        if (istrue(level.gamemodebundle.var_198508771f0592a9)) {
            if (cur_kill_streak > 1 && cur_kill_streak <= 30) {
                thread scripts/mp/utility/points::doScoreEvent(hashcat(#"streak_x", cur_kill_streak));
            } else if (cur_kill_streak > 30) {
                thread scripts/mp/utility/points::doScoreEvent(#"hash_86fd5c5b91e07690");
            }
        } else {
            if (!(cur_kill_streak % streaknum)) {
                if (!isdefined(self.lastkillsplash) || cur_kill_streak != self.lastkillsplash) {
                    thread teamplayercardsplash("callout_kill_streaking", self, undefined, cur_kill_streak);
                    self.lastkillsplash = cur_kill_streak;
                }
                if (cur_kill_streak <= 30) {
                    thread scripts/mp/utility/points::doScoreEvent(hashcat(#"streak_", cur_kill_streak));
                }
            }
            if (cur_kill_streak > 30) {
                thread scripts/mp/utility/points::doScoreEvent(#"streak_max");
            }
        }
        if (istrue(self.modifiers["item_impact"])) {
            thread scripts/mp/utility/points::doScoreEvent(#"item_impact");
        }
        if (istrue(self.modifiers["launcher_impact"])) {
            directimpactkill();
        }
        if (getgametypenumlives() >= 1) {
            if (victim.pers["lives"] == 0) {
                thread scripts/mp/utility/points::doScoreEvent(#"hash_c1f0ec4c332c192", undefined, undefined, undefined, victim);
            }
            var_7774f401143eeccf = trygetlastpotentiallivingplayer();
            if (isdefined(var_7774f401143eeccf) && var_7774f401143eeccf == self) {
                thread scripts/mp/utility/points::doScoreEvent(#"hash_a3e7ebf904a38850", undefined, undefined, undefined, victim);
            }
        }
        if (scripts/cp_mp/utility/game_utility::isbrstylegametype() && scripts/mp/flags::gameflag("prematch_done")) {
            if (self ispcplayer()) {
                self setclientomnvar("nVidiaHighlights_events", 25);
            }
            if (victim ispcplayer()) {
                victim setclientomnvar("nVidiaHighlights_events", 26);
            }
        }
        checksuperkillevents(victim, inflictor, objweapon, meansofdeath, var_366b0ecc2f28aead);
        checksupershutdownevents(victim, objweapon, meansofdeath);
    } else if (iskillstreakweapon(objweapon.basename) || issuperweapon(objweapon.basename)) {
        if (issubstr(objweapon.basename, "laser_charge")) {
            thread scripts/mp/utility/points::doScoreEvent(#"hash_413b3cb404019d7a");
        }
    }
    tookdamage = 0;
    if (isdefined(victim.damagedplayers) && victim.damagedplayers.size != 0) {
        for (i = 0; i < victim.damagedplayers.size; i++) {
            damagedplayer = getarraykey(victim.damagedplayers, i);
            if (isdefined(inflictor) && is_equal(damagedplayer, inflictor.guid)) {
                tookdamage = 1;
                break;
            }
        }
    }
    if (!tookdamage) {
        cleanKill();
    }
    if (istrue(self.modifiers["revenge"])) {
        self.lastkilledby = undefined;
        revenge(killid, victim);
    }
    if (!lpcfeaturegated()) {
        if (!isdefined(self.killedplayers[victimguid])) {
            self.killedplayers[victimguid] = 0;
        }
        if (!isdefined(victim.killedby[myguid])) {
            victim.killedby[myguid] = 0;
        }
        self.killedplayers[victimguid]++;
        victim.killedby[myguid]++;
    }
    victim.lastkilledby = self;
    if (!lpcfeaturegated() && !level.multiteambased) {
        enemycount = 0;
        if (level.teambased) {
            enemycount = getenemycount(self.team);
        } else {
            enemycount = level.players.size - 1;
        }
        if (enemycount > 3 && self.killedplayers.size == enemycount) {
            currentcount = 0;
            if (isdefined(self.pers["killEnemyTeam"])) {
                currentcount = self.pers["killEnemyTeam"];
            }
            shouldprogress = 1;
            foreach (player, killcount in self.killedplayers) {
                if (killcount <= currentcount) {
                    shouldprogress = 0;
                    break;
                }
            }
            if (shouldprogress) {
                killentireenemyteam(killid);
            }
        }
    }
    if (!victim isusingremote()) {
        victim thread setdof_killer();
    }
    victim namespace_861236fa8235a2ba::function_a22d831b624cccd2();
    bufferednotify("kill_event_buffered", victim, var_366b0ecc2f28aead, meansofdeath, self.modifiers);
    thread scripts/mp/potg_events::onplayerkilled(self, inflictor, victim, meansofdeath, objweapon, deathdata.psoffsettime);
    thread function_f0c7425bd5a7050(victim, meansofdeath);
}

// Namespace events / scripts/mp/events
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x938a
// Size: 0x605
function checkkillstreakkillevents(objweapon, meansofdeath, inflictor) {
    iskillstreak = isdefined(objweapon) && iskillstreakweapon(objweapon.basename) || iskillstreakvehicleinflictor(inflictor) || inflictor scripts/mp/utility/killstreak::isjuggernaut();
    forcekillstreak = isforcekillstreakprogressweapon(objweapon);
    if (iskillstreak && !forcekillstreak) {
        if (isdefined(inflictor) && isdefined(inflictor.streakinfo)) {
            cankillchain = 1;
            if (isdefined(inflictor.streakinfo.mpstreaksysteminfo)) {
                lifeidearned = inflictor.streakinfo.mpstreaksysteminfo.streaklifeid;
                lifeidcurrent = self.lifeid;
                if (!isdefined(lifeidearned) || lifeidearned != lifeidcurrent) {
                    cankillchain = 0;
                }
                if (inflictor.streakinfo.mpstreaksysteminfo.ownerxuid != self getxuid()) {
                    cankillchain = 0;
                }
            }
            if (isdefined(inflictor.streakinfo.streakname)) {
                givemidmatch = 0;
                isair = 0;
                isground = 0;
                killstreakname = inflictor.streakinfo.streakname;
                switch (killstreakname) {
                case #"hash_e477c24ee18bb2f6":
                    incpersstat("killstreakTankKills", 1);
                    givemidmatch = 1;
                    isground = 1;
                    break;
                case #"hash_349713b5ad494dda":
                    incpersstat("killstreakChopperGunnerKills", 1);
                    givemidmatch = 1;
                    isair = 1;
                    break;
                case #"hash_691f39dddd9116b8":
                    incpersstat("killstreakChopperSupportKills", 1);
                    givemidmatch = 1;
                    isair = 1;
                    break;
                case #"hash_28d0236400e33fd0":
                    incpersstat("killstreakCruiseMissileKills", 1);
                    givemidmatch = 1;
                    isair = 1;
                    break;
                case #"hash_4220be38a5f150b8":
                    givemidmatch = 1;
                    break;
                case #"hash_413c38e72fe8b5bf":
                    incpersstat("killstreakGunshipKills", 1);
                    givemidmatch = 1;
                    isair = 1;
                    break;
                case #"hash_bf2f9adbd2b41d5":
                    incpersstat("killstreakVTOLJetKills", 1);
                    givemidmatch = 1;
                    isair = 1;
                    break;
                case #"hash_4ad475e6e15635bd":
                    incpersstat("killstreakJuggernautKills", 1);
                    givemidmatch = 1;
                    isground = 1;
                    break;
                case #"hash_cd0a0403551fc411":
                    givemidmatch = 1;
                    isground = 1;
                    break;
                case #"hash_52d9b7ed584bec3e":
                    incpersstat("killstreakShieldTurretKills", 1);
                    givemidmatch = 1;
                    isground = 1;
                    break;
                case #"hash_62810d05099e0103":
                    givemidmatch = 1;
                    break;
                case #"hash_cf0ef5bef19a311b":
                    incpersstat("killstreakWheelsonKills", 1);
                    givemidmatch = 1;
                    isground = 1;
                    break;
                case #"hash_8c766d6477287bb6":
                    incpersstat("killstreakAirstrikeKills", 1);
                    givemidmatch = 1;
                    isair = 1;
                    break;
                case #"hash_4d5aa76e8707f47b":
                    incpersstat("killstreakSentryGunKills", 1);
                    givemidmatch = 1;
                    isground = 1;
                    break;
                case #"hash_ab5712e297cd430e":
                    incpersstat("killstreakRemoteTurretKills", 1);
                    givemidmatch = 1;
                    isground = 1;
                    break;
                case #"hash_b4ac3581c343a029":
                    incpersstat("killstreakCluserStrikeKills", 1);
                    givemidmatch = 1;
                    isair = 1;
                    break;
                case #"hash_e6bea339d3cbd3e8":
                    incpersstat("killstreakWhitePhosphorousKillsAssists", 1);
                    givemidmatch = 1;
                    isair = 1;
                    break;
                case #"hash_9e36e3bd3a9dd00d":
                    givemidmatch = 1;
                    isair = 1;
                    break;
                case #"hash_7a687f6a4d685110":
                    incpersstat("killstreakSwitchbladeDroneKills", 1);
                    givemidmatch = 1;
                    isair = 1;
                    break;
                case #"hash_a1031216158c7882":
                    incpersstat("killstreakLoiteringMunitionKills", 1);
                    givemidmatch = 1;
                    isair = 1;
                    break;
                case #"hash_472d8b6c2f51a9c8":
                    incpersstat("killstreakIMSKills", 1);
                    givemidmatch = 1;
                    isground = 1;
                    break;
                default:
                    if (!isdefined(level.var_5ef21d1318acecea)) {
                        level.var_5ef21d1318acecea = spawnstruct();
                        level.var_5ef21d1318acecea.iskillstreakkill = 1;
                    }
                    if (!istrue(level.gamemodebundle.var_198508771f0592a9)) {
                        thread doScoreEvent(#"hash_1387a1180e68dc64", objweapon, undefined, undefined, undefined, undefined, undefined, undefined, inflictor.streakinfo, undefined, level.var_5ef21d1318acecea);
                    }
                    break;
                }
                if (isdefined(inflictor.streakinfo.kills)) {
                    inflictor.streakinfo.kills++;
                }
                incpersstat("killstreakKills", 1);
                if (isair) {
                    incpersstat("killstreakAirKills", 1);
                }
                if (isground) {
                    incpersstat("killstreakGroundKills", 1);
                }
                if (givemidmatch) {
                    event = hashcat(#"ss_kill_", killstreakname);
                    pointsoverride = undefined;
                    if (cankillchain && _hasperk("specialty_chain_killstreaks")) {
                        pointsoverride = scripts/mp/rank::getscoreinfovalue(event);
                    }
                    dontwait = 1;
                    if (!isdefined(level.var_5ef21d1318acecea)) {
                        level.var_5ef21d1318acecea = spawnstruct();
                        level.var_5ef21d1318acecea.iskillstreakkill = 1;
                    }
                    thread scripts/mp/utility/points::doScoreEvent(event, objweapon, pointsoverride, undefined, undefined, dontwait, undefined, cankillchain, inflictor.streakinfo, undefined, level.var_5ef21d1318acecea);
                }
                level thread scripts/mp/battlechatter_mp::saytoself(self, "plr_killfirm_killstreak", undefined, 0.75);
            }
        }
    }
}

// Namespace events / scripts/mp/events
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9996
// Size: 0xa6
function function_3e2ff5954aacaa33(objweapon, meansofdeath, inflictor) {
    if ((iskillstreakweapon(objweapon.basename) || iskillstreakvehicleinflictor(inflictor)) && !isforcekillstreakprogressweapon(objweapon) && isdefined(inflictor) && isdefined(inflictor.streakinfo) && isdefined(inflictor.streakinfo.streakname) && isdefined(inflictor.streakinfo.kills)) {
        inflictor.streakinfo.kills++;
    }
}

// Namespace events / scripts/mp/events
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a43
// Size: 0xfc
function checksuperkillevents(victim, inflictor, objweapon, meansofdeath, var_366b0ecc2f28aead) {
    superinuse = scripts/mp/supers::issuperinuse();
    superref = scripts/mp/supers::getcurrentsuperref();
    super = scripts/mp/supers::getcurrentsuper();
    superweapon = issuperweapon(objweapon.basename);
    score_ref = undefined;
    if (!isdefined(superref)) {
        return;
    }
    if (superweapon) {
        thread killedplayerwithsuperweapon(victim, inflictor, objweapon, meansofdeath, var_366b0ecc2f28aead);
        if (meansofdeath != "MOD_MELEE") {
            bufferednotify("super_kill_buffered");
        }
    }
    var_7d701a3f18f52454 = 0;
    if (isdefined(superref)) {
        if (var_7d701a3f18f52454) {
            thread superkill(superref, meansofdeath);
            scripts/mp/supers::combatrecordsuperkill(superref);
            if (isdefined(score_ref)) {
                thread doScoreEvent(score_ref);
            }
            bufferednotify("super_kill_buffered");
        }
    }
}

// Namespace events / scripts/mp/events
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b46
// Size: 0x68
function checksupershutdownevents(victim, objweapon, meansofdeath) {
    var_727e0f6c828adf76 = victim scripts/mp/supers::issuperinuse();
    var_8550e94c928e5cdd = victim scripts/mp/supers::getcurrentsuperref();
    victimsuper = victim scripts/mp/supers::getcurrentsuper();
    if (!isdefined(var_8550e94c928e5cdd)) {
        return;
    }
    if (var_727e0f6c828adf76 == 1) {
        thread supershutdown(victim);
    }
}

// Namespace events / scripts/mp/events
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bb5
// Size: 0xa5
function killedplayerwithsuperweapon(victim, inflictor, objweapon, meansofdeath, var_366b0ecc2f28aead) {
    superref = scripts/mp/supers::getsuperrefforsuperweapon(objweapon);
    var_398a9d42af1d5e5f = self.recentkillsperweapon[var_366b0ecc2f28aead];
    if (isdefined(var_398a9d42af1d5e5f) && var_398a9d42af1d5e5f > 0 && var_398a9d42af1d5e5f % 2 == 0) {
        superkill(superref, meansofdeath);
    } else {
        var_f5f7b5e4219a0145 = scripts/mp/supers::getcurrentsuper();
        var_f5f7b5e4219a0145.numkills++;
    }
    scripts/cp_mp/challenges::updatesuperweaponkills(objweapon, inflictor);
    scripts/mp/supers::combatrecordsuperkill(superref);
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c61
// Size: 0xd8
function superkill(superref, meansofdeath) {
    var_fe600a5ea17dd64d = scripts/mp/supers::getrootsuperref(superref);
    medalref = hashcat(#"super_kill_", var_fe600a5ea17dd64d);
    if (scripts/mp/rank::function_377a94f711d96927(medalref)) {
        if (!isdefined(level.var_b4e942edb1952ca1)) {
            level.var_b4e942edb1952ca1 = spawnstruct();
            level.var_b4e942edb1952ca1.var_3a13c58c2a354968 = 1;
        }
        thread scripts/mp/utility/points::doScoreEvent(medalref, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, level.var_b4e942edb1952ca1);
    }
    var_f5f7b5e4219a0145 = scripts/mp/supers::getcurrentsuper();
    var_f5f7b5e4219a0145.numkills++;
    scripts/cp_mp/challenges::updatesuperkills(superref, meansofdeath, var_f5f7b5e4219a0145.numkills);
    self.modifiers["super_kill_medal"] = superref;
}

// Namespace events / scripts/mp/events
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d40
// Size: 0xb9
function killedkillstreak(killstreakname, killer, objweapon) {
    awardname = hashcat(#"kill_ss_", killstreakname);
    if (isdefined(objweapon) && weaponclass(objweapon) != "rocketlauncher" && objweapon.basename != "iw8_la_kgolf_mp") {
        objweapon = undefined;
    }
    eventinfo = spawnstruct();
    eventinfo.isdestroyedkillstreak = 1;
    killer thread scripts/mp/utility/points::doScoreEvent(awardname, objweapon, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, eventinfo);
    killer incpersstat("destroyedKillstreaks", 1);
    level thread scripts/mp/battlechatter_mp::saytoself(killer, "plr_killstreak_destroy", undefined, 0.75);
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e00
// Size: 0x7d
function processscrapassist(killer) {
    var_abfd7751a2d536a5 = scripts/mp/killstreaks/killstreaks::getscrapassistplayers(killer);
    foreach (player in var_abfd7751a2d536a5) {
        if (!isdefined(player)) {
            continue;
        }
        player thread doScoreEvent(#"hash_2009f98b7647c4a4");
    }
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e84
// Size: 0x88
function is_enemy_highest_score(enemy, enemies) {
    if (!isdefined(enemy.score)) {
        return false;
    }
    foreach (e in enemies) {
        if (e.score > enemy.score) {
            return false;
        }
    }
    return true;
}

// Namespace events / scripts/mp/events
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f14
// Size: 0x219
function getshotdistancetype(attacker, objweapon, meansofdeath, attackerposition, victim) {
    if (isalive(attacker) && meansofdeath != "MOD_MELEE" && !attacker isusingremote() && (isprimaryweapon(objweapon) || iscacsecondaryweapon(objweapon) || isthrowingknife(objweapon)) && !iskillstreakweapon(objweapon.basename) && !istrue(attacker.assistedsuicide)) {
        killdistsq = distancesquared(attackerposition, victim.origin);
        if (killdistsq < 9216) {
            return "pointblank";
        }
        if (killdistsq > 4000000) {
            return "very_longshot";
        }
        var_a77e978567103b98 = getweapongroup(objweapon.basename);
        longshotdist = undefined;
        switch (var_a77e978567103b98) {
        case #"hash_34340d457a63e7f1":
            longshotdist = 800;
            break;
        case #"hash_ab10f9c080fe4faf":
        case #"hash_c9c190665b9c4a1d":
            longshotdist = 1200;
            break;
        case #"hash_bef5ec0b3e197ae":
        case #"hash_47368bc0d2ef1565":
        case #"hash_8af0086b038622b5":
        case #"hash_dd616da0b395a0b0":
            if (objweapon.basename == "iw9_dm_crossbow_mp") {
                longshotdist = 1200;
            } else {
                longshotdist = 1500;
            }
            break;
        case #"hash_46b22b021532342e":
        case #"hash_c095d67337b1f5a1":
            longshotdist = 2000;
            break;
        case #"hash_16cf6289ab06bd30":
            longshotdist = 500;
            break;
        case #"hash_9d18adab1b65a661":
            longshotdist = 1200;
            break;
        case #"hash_f4cd588fc5c3d2d5":
            longshotdist = 1969;
            break;
        default:
            longshotdist = 1536;
            break;
        }
        longshotdistsq = longshotdist * longshotdist;
        if (killdistsq > longshotdistsq) {
            return "longshot";
        }
    }
    return "none";
}

// Namespace events / scripts/mp/events
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa135
// Size: 0x14b
function islongshotspecial(attackerposition, victim, objweapon) {
    killdistsq = distancesquared(attackerposition, victim.origin);
    var_a77e978567103b98 = getweapongroup(objweapon.basename);
    longshotdist = undefined;
    switch (var_a77e978567103b98) {
    case #"hash_34340d457a63e7f1":
        longshotdist = 1500;
        break;
    case #"hash_ab10f9c080fe4faf":
    case #"hash_c9c190665b9c4a1d":
        longshotdist = 2000;
        break;
    case #"hash_47368bc0d2ef1565":
        longshotdist = 4000;
        break;
    case #"hash_bef5ec0b3e197ae":
    case #"hash_8af0086b038622b5":
    case #"hash_dd616da0b395a0b0":
        longshotdist = 3000;
        break;
    case #"hash_46b22b021532342e":
    case #"hash_c095d67337b1f5a1":
        longshotdist = 8000;
        break;
    case #"hash_16cf6289ab06bd30":
        longshotdist = 1000;
        break;
    case #"hash_9d18adab1b65a661":
        longshotdist = 4000;
        break;
    default:
        longshotdist = 4000;
        break;
    }
    longshotdistsq = longshotdist * longshotdist;
    return killdistsq > longshotdistsq;
}

// Namespace events / scripts/mp/events
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xa288
// Size: 0x78
function isdeathfromabove(attacker, objweapon, meansofdeath, attackerposition, victim) {
    if (isalive(attacker) && attacker isjumping() && isbulletdamage(meansofdeath)) {
        deltaheight = attacker.origin[2] - victim.origin[2];
        return (deltaheight > 60);
    }
    return false;
}

// Namespace events / scripts/mp/events
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa308
// Size: 0x42
function function_78dbf8d8bcbed882(attacker, meansofdeath, victim) {
    if (isalive(attacker) && attacker isjumping() && isbulletdamage(meansofdeath)) {
        return 1;
    }
    return 0;
}

// Namespace events / scripts/mp/events
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa351
// Size: 0x47
function isskeetshooter(attacker, objweapon, meansofdeath, attackerposition, victim) {
    return isalive(attacker) && victim isjumping() && isbulletdamage(meansofdeath);
}

// Namespace events / scripts/mp/events
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3a0
// Size: 0xaa
function isbackkill(attacker, victim, meansofdeath) {
    if (!isplayer(attacker) || !isplayer(victim)) {
        return false;
    }
    if (meansofdeath != "MOD_RIFLE_BULLET" && meansofdeath != "MOD_PISTOL_BULLET" && meansofdeath != "MOD_MELEE" && meansofdeath != "MOD_HEAD_SHOT") {
        return false;
    }
    var_cb116ac8aa94ce55 = victim getplayerangles();
    var_524b19d2034e1406 = attacker getplayerangles();
    anglediff = angleclamp180(var_cb116ac8aa94ce55[1] - var_524b19d2034e1406[1]);
    if (abs(anglediff) < 80) {
        return true;
    }
    return false;
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa452
// Size: 0x3a
function issurvivorkill(player) {
    return player.health > 0 && player.health < player.maxhealth * 0.5;
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa494
// Size: 0xa2
function isdetected(attacker, victim) {
    issnapshotted = isdefined(victim.lastsnapshotgrenadetime) && victim.lastsnapshotgrenadetime + scripts/mp/equipment/snapshot_grenade::function_905247d1b30c84f1() > gettime();
    var_bc1d14d99eaa6485 = isdefined(attacker.radarstrength) && attacker.radarstrength > 3 && !victim _hasperk("specialty_br_ghost");
    var_abee336ea25765c6 = istrue(victim.var_abee336ea25765c6);
    return issnapshotted || var_bc1d14d99eaa6485 || var_abee336ea25765c6;
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa53e
// Size: 0x2f
function proximityassist(killid) {
    self.modifiers["proximityAssist"] = 1;
    thread doScoreEvent(#"proximityassist");
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa574
// Size: 0x2f
function proximitykill(killid) {
    self.modifiers["proximityKill"] = 1;
    thread doScoreEvent(#"proximitykill");
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5aa
// Size: 0x42
function longshot(killid) {
    thread utility::trycall(level.matchdata_logattackerkillevent, killid, "longshot");
    incpersstat("longshotKills", 1);
    thread scripts/mp/utility/points::doScoreEvent(#"longshot");
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5f3
// Size: 0x22
function very_longshot(killid) {
    level thread scripts/mp/battlechatter_mp::trysaylocalsound(self, #"hash_3454d945dd7a9a2", undefined, 1);
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa61c
// Size: 0x42
function pointblank(killid) {
    thread utility::trycall(level.matchdata_logattackerkillevent, killid, "pointblank");
    thread scripts/mp/utility/points::doScoreEvent(#"pointblank");
    incpersstat("pointBlankKills", 1);
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa665
// Size: 0x46
function headshot(killid) {
    thread utility::trycall(level.matchdata_logattackerkillevent, killid, "headshot");
    thread scripts/mp/utility/points::doScoreEvent(#"headshot");
    thread killeventtextpopup(#"headshot", 0);
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6b2
// Size: 0x4a
function avengedplayer(killid, lastvictim) {
    thread utility::trycall(level.matchdata_logattackerkillevent, killid, "avenger");
    incpersstat("avengerKills", 1);
    thread scripts/mp/utility/points::doScoreEvent(#"avenger");
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa703
// Size: 0x3d
function assistedsuicide(killid, objweapon) {
    thread utility::trycall(level.matchdata_logattackerkillevent, killid, "assistedsuicide");
    thread scripts/mp/utility/points::doScoreEvent(#"assistedsuicide", objweapon);
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa747
// Size: 0x72
function defendedplayer(killid, guid) {
    thread utility::trycall(level.matchdata_logattackerkillevent, killid, "defender");
    incpersstat("defenderKills", 1);
    thread killeventtextpopup(#"save_teammate", 0);
    thread scripts/mp/utility/points::doScoreEvent(#"save_teammate");
    level thread scripts/mp/battlechatter_mp::trysaylocalsound(self, #"hash_a84b87147883e407", undefined, 1);
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7c0
// Size: 0x34
function postdeathkill(killid) {
    thread utility::trycall(level.matchdata_logattackerkillevent, killid, "posthumous");
    thread scripts/mp/utility/points::doScoreEvent(#"posthumous");
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7fb
// Size: 0x8a
function revenge(killid, victim) {
    thread utility::trycall(level.matchdata_logattackerkillevent, killid, "revenge");
    incpersstat("revengeKills", 1);
    thread scripts/mp/utility/points::doScoreEvent(#"revenge");
    level thread scripts/mp/battlechatter_mp::trysaylocalsound(self, #"hash_c85e7a0886653e4", undefined, 1);
    playfx(getfx("money"), victim.origin + (0, 0, 64));
}

// Namespace events / scripts/mp/events
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa88c
// Size: 0x2a5
function multikill(killid, killcount, var_c95c893c15217527, var_5af31c1555eb14b1, iskillstreakweapon) {
    /#
        assert(killcount > 1);
    #/
    if (!isdefined(self.currentmultikill)) {
        self.currentmultikill = killcount;
    }
    if (killcount < self.currentmultikill) {
        return;
    }
    self notify("multiKill");
    self endon("multiKill");
    self endon("disconnect");
    waitframe();
    award = undefined;
    teamsplash = undefined;
    switch (killcount) {
    case 2:
        award = #"double";
        break;
    case 3:
        award = #"triple";
        teamsplash = "callout_3xkill";
        break;
    case 4:
        award = #"four";
        teamsplash = "callout_4xkill";
        break;
    case 5:
        award = #"five";
        teamsplash = "callout_5xkill";
        break;
    case 6:
        award = #"six";
        teamsplash = "callout_6xkill";
        break;
    case 7:
        award = #"seven";
        teamsplash = "callout_7xkill";
        break;
    case 8:
        award = #"eight";
        teamsplash = "callout_8xkill";
        break;
    default:
        award = #"multi";
        teamsplash = "callout_9xkill";
        break;
    }
    if (isdefined(self.pers["totalMultikills"])) {
        incpersstat("totalMultikills", 1);
    }
    if (isdefined(self.pers["highestMultikill"]) && killcount > self.pers["highestMultikill"]) {
        self.pers["highestMultikill"] = killcount;
        scripts/mp/codcasterclientmatchdata::function_7ee466e81b1afc12(10, killcount);
    }
    thread utility::trycall(level.matchdata_logmultikill, killid, killcount);
    if (isdefined(award)) {
        var_5af31c1555eb14b1 = istrue(var_5af31c1555eb14b1);
        thread killeventtextpopup(award, isdefined(var_c95c893c15217527) ? var_c95c893c15217527 : 1, var_5af31c1555eb14b1);
        if (!var_5af31c1555eb14b1) {
            self.currentmultikill = killcount;
            scripts/cp_mp/challenges::function_e6ba0866eca5b87b(self, iskillstreakweapon);
            if (istrue(iskillstreakweapon)) {
                eventinfo = {var_f02e60455d9ce50f:iskillstreakweapon};
                thread scripts/mp/utility/points::doScoreEvent(award, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, eventinfo);
            } else {
                thread scripts/mp/utility/points::doScoreEvent(award);
            }
        }
    }
    if (isdefined(teamsplash)) {
        if (!var_5af31c1555eb14b1) {
            if (scripts/cp_mp/utility/game_utility::function_22cd3d64fdb05892()) {
                return;
            }
            thread teamplayercardsplash(teamsplash, self);
        }
    }
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab38
// Size: 0x63
function firstblood(killid) {
    if (!scripts/cp_mp/utility/game_utility::isbrstylegametype()) {
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(11, self.team, self getentitynumber());
    }
    thread utility::trycall(level.matchdata_logattackerkillevent, killid, "firstblood");
    thread teamplayercardsplash("callout_firstblood", self);
    thread scripts/mp/utility/points::doScoreEvent(#"firstblood");
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaba2
// Size: 0x6a
function hvtKill(victim) {
    if (isdefined(victim.bountyobject)) {
        self.modifiers["hvtKill"] = 1;
        self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_9a466248c901ec58"));
    }
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac13
// Size: 0x6a
function buzzkill(killid, victim) {
    thread utility::trycall(level.matchdata_logattackerkillevent, killid, "buzzkill");
    thread scripts/mp/utility/points::doScoreEvent(#"buzzkill");
    if (scripts/cp_mp/utility/killstreak_utility::function_9f1dc821e9a8506() && getdvarint(@"hash_ee6087278c7605f6", 1) == 1) {
        thread scripts/mp/killstreaks/killstreaks::function_ee6caf8414e3b231("buzzkill", victim);
    }
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac84
// Size: 0x14
function impairedkill() {
    thread scripts/mp/utility/points::doScoreEvent(#"stunned_kill");
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac9f
// Size: 0x42
function comeback(killid) {
    thread utility::trycall(level.matchdata_logattackerkillevent, killid, "comeback");
    thread scripts/mp/utility/points::doScoreEvent(#"comeback");
    incpersstat("comebackKills", 1);
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xace8
// Size: 0xbb
function supershutdown(victim) {
    var_fe600a5ea17dd64d = scripts/mp/supers::getrootsuperref(victim.super.staticdata.ref);
    self.modifiers["superShutdown"] = victim.super.staticdata.ref;
    medalref = hashcat(#"hash_499e8b2730bb3818", var_fe600a5ea17dd64d);
    switch (var_fe600a5ea17dd64d) {
    case #"hash_438c49412523936e":
        medalref = #"hash_b21113802f70845a";
        break;
    }
    if (scripts/mp/rank::function_377a94f711d96927(medalref)) {
        thread scripts/mp/utility/points::doScoreEvent(medalref);
    }
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xadaa
// Size: 0x5f
function collateral(numkills) {
    if (numkills == 2) {
        level thread scripts/mp/battlechatter_mp::saytoself(self, "plr_killfirm_twofer", undefined, 0.75);
        thread scripts/mp/utility/points::doScoreEvent(#"hash_8368a43e439d8a67");
    }
    if (numkills == 3) {
        level thread scripts/mp/battlechatter_mp::saytoself(self, "plr_killfirm_threefer", undefined, 0.75);
    }
    thread scripts/mp/potg_events::collateral(self, numkills);
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae10
// Size: 0x16
function shotguncollateral(numkills) {
    thread scripts/mp/potg_events::shotguncollateral(self, numkills);
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae2d
// Size: 0x14
function mantlekill() {
    thread scripts/mp/utility/points::doScoreEvent(#"mantle_kill");
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae48
// Size: 0x14
function backfire() {
    thread scripts/mp/utility/points::doScoreEvent(#"backfire");
}

// Namespace events / scripts/mp/events
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae63
// Size: 0xb5
function quadfeed(killid, struct, iskillstreakweapon) {
    self.modifiers["quadfeed"] = 1;
    self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"quadfeed"));
    eventinfo = {var_f02e60455d9ce50f:iskillstreakweapon};
    thread scripts/mp/utility/points::doScoreEvent(#"quad_feed", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, eventinfo);
    thread scripts/mp/potg_events::quadfeed(self, struct.starttime, gettime());
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf1f
// Size: 0x69
function killentireenemyteam(killid) {
    self.modifiers["killEnemyTeam"] = 1;
    self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"killEnemyTeam"));
    incpersstat("killEnemyTeam", 1);
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf8f
// Size: 0x61
function kingslayer(killid, victim) {
    thread scripts/mp/utility/points::doScoreEvent(#"hash_b25fda74d611ddf2");
    incpersstat("highestRankedKills", 1);
    if (scripts/cp_mp/utility/killstreak_utility::function_9f1dc821e9a8506() && getdvarint(@"hash_ee6087278c7605f6", 1) == 1) {
        thread scripts/mp/killstreaks/killstreaks::function_ee6caf8414e3b231("kingslayer", victim);
    }
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaff7
// Size: 0x1d
function directimpactkill(killid) {
    thread scripts/mp/utility/points::doScoreEvent(#"hash_e13c7899c2eed171");
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb01b
// Size: 0x5b
function tripledefenderkill(killid) {
    self.modifiers["tripledefenderkill"] = 1;
    self.modifiers["mask"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"defender"));
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb07d
// Size: 0x2b
function execution(killid) {
    incpersstat("executions", 1);
    thread doScoreEvent(#"execution");
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0af
// Size: 0x52
function cleanKill() {
    self.modifiers["cleanKill"] = 1;
    self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"clean_kill"));
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb108
// Size: 0xa5
function disconnected() {
    myguid = self.guid;
    if (!lpcfeaturegated()) {
        for (entry = 0; entry < level.players.size; entry++) {
            if (isdefined(level.players[entry].killedplayers[myguid])) {
                level.players[entry].killedplayers[myguid] = undefined;
            }
            if (isdefined(level.players[entry].killedby[myguid])) {
                level.players[entry].killedby[myguid] = undefined;
            }
        }
    }
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1b4
// Size: 0x43
function monitorhealed() {
    if (scripts/mp/rank::function_377a94f711d96927("healed") == 0) {
        return;
    }
    level endon("end_game");
    for (;;) {
        player = level waittill("healed");
        player thread doScoreEvent(#"healed");
    }
}

// Namespace events / scripts/mp/events
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1fe
// Size: 0x277
function updaterecentkills(killid, victim, objweapon, var_366b0ecc2f28aead, iskillstreakweapon) {
    self endon("disconnect");
    level endon("game_ended");
    self notify("updateRecentKills");
    self endon("updateRecentKills");
    self.recentkillcount++;
    if (isdefending(victim)) {
        self.recentdefendcount++;
        if (isnumbermultipleof(self.recentdefendcount, 2)) {
            thread scripts/mp/utility/points::doScoreEvent(#"hash_5f9fc734692af8d7");
        }
    }
    if (isassaulting(victim)) {
        self.recentassaultcount++;
        if (isnumbermultipleof(self.recentassaultcount, 3)) {
            tripledefenderkill(killid);
        }
    }
    if (!isdefined(self.recentkillsperweapon)) {
        self.recentkillsperweapon = [];
    }
    if (!isdefined(self.recentkillsperweapon[var_366b0ecc2f28aead])) {
        self.recentkillsperweapon[var_366b0ecc2f28aead] = 1;
    } else {
        self.recentkillsperweapon[var_366b0ecc2f28aead]++;
    }
    weaponinfo = getequipmenttype(objweapon);
    if (isdefined(weaponinfo) && weaponinfo == "lethal" && !isthrowingknife(objweapon)) {
        level thread scripts/mp/battlechatter_mp::saytoself(self, "plr_killfirm_grenade", undefined, 0.75);
        level thread scripts/mp/battlechatter_mp::saytoself(self, "plr_killfirm_amf", undefined, 0.75);
        if (self.recentkillsperweapon[var_366b0ecc2f28aead] > 0 && self.recentkillsperweapon[var_366b0ecc2f28aead] % 2 == 0) {
            thread scripts/mp/utility/points::doScoreEvent(#"grenade_double");
        }
    }
    bufferednotify("update_rapid_kill_buffered", self.recentkillcount, var_366b0ecc2f28aead);
    if (!isdefined(self.recentkillcount)) {
        self.recentkillcount = 0;
    }
    if (self.recentkillcount > 1) {
        thread multikill(killid, self.recentkillcount, 0, undefined, iskillstreakweapon);
    }
    wait(4);
    if (self.recentkillcount > 1) {
        thread multikill(killid, self.recentkillcount, 1, 1, iskillstreakweapon);
        if (self.recentkillcount > 2) {
            if (!scripts/cp_mp/utility/game_utility::isbrstylegametype()) {
                namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(12, self.team, self getentitynumber(), self.recentkillcount);
            }
        }
    }
    incpersstat("mostMultikills", 1);
    self.currentmultikill = 0;
    self.recentkillcount = 0;
    self.recentdefendcount = 0;
    self.recentkillsperweapon = undefined;
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb47c
// Size: 0x4b
function updatec4vehiclemultkill(meansofdeath, inflictor) {
    paramstruct = spawnstruct();
    paramstruct.meansofdeath = meansofdeath;
    paramstruct.inflictor = inflictor;
    scripts/mp/gametypes/br_challenges::challengeevaluator("br_mastery_c4VehicleMultKill", paramstruct);
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4ce
// Size: 0x2e
function updateghostridekills() {
    paramstruct = spawnstruct();
    paramstruct.maderecentkill = 1;
    scripts/mp/gametypes/br_challenges::challengeevaluator("br_mastery_ghostRideWhip", paramstruct);
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb503
// Size: 0x63
function monitorcratejacking() {
    level endon("end_game");
    self endon("disconnect");
    for (;;) {
        cratetype, owner = self waittill("hijacker");
        thread scripts/mp/utility/points::doScoreEvent(#"hash_519e0923d0608694");
        splashname = "hijacked_airdrop";
        if (isdefined(owner)) {
            owner scripts/mp/hud_message::showsplash(splashname, undefined, self);
        }
    }
}

// Namespace events / scripts/mp/events
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb56d
// Size: 0x10b
function updatequadfeedcounter(attacker, killid, iskillstreakweapon) {
    if (isdefined(level.quadfeedinfo) && gettime() - level.quadfeedinfo.starttime > 10000) {
        level.quadfeedinfo = undefined;
    }
    if (!isdefined(level.quadfeedinfo) || level.quadfeedinfo.player != attacker) {
        struct = spawnstruct();
        struct.player = attacker;
        struct.starttime = gettime();
        struct.feedcount = 1;
        level.quadfeedinfo = struct;
        return;
    }
    struct = level.quadfeedinfo;
    struct.feedcount++;
    if (struct.feedcount == 4) {
        struct.player quadfeed(killid, struct, iskillstreakweapon);
        level.quadfeedinfo = undefined;
    }
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb67f
// Size: 0x35
function initslidemonitor() {
    self.eventswassliding = self issprintsliding();
    self.eventsslideendtime = undefined;
    self.var_487218883ba859bb = self issprinting();
    self.var_887efc1f015b6a78 = undefined;
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6bb
// Size: 0xba
function events_monitorslideupdate() {
    if (isreallyalive(self)) {
        eventsissliding = self issprintsliding();
        if (istrue(self.eventswassliding) && !eventsissliding) {
            self.eventsslideendtime = gettime();
            scripts/mp/potg::processevent("recent_slide");
        }
        self.eventswassliding = eventsissliding;
        eventsissprinting = self issprinting();
        if (istrue(self.var_487218883ba859bb) && !eventsissprinting) {
            self.var_887efc1f015b6a78 = gettime();
        }
        self.var_487218883ba859bb = eventsissprinting;
        return;
    }
    self.eventswassliding = 0;
    self.eventsslideendtime = undefined;
    self.var_487218883ba859bb = 0;
    self.var_887efc1f015b6a78 = undefined;
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb77c
// Size: 0x3c
function events_issliding() {
    if (self issprintsliding()) {
        return true;
    }
    events_monitorslideupdate();
    if (isdefined(self.eventsslideendtime)) {
        if (gettime() - self.eventsslideendtime <= 150) {
            return true;
        }
    }
    return false;
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7c0
// Size: 0x1c
function initmonitoradstime() {
    self.wasads = isplayerads();
    self.lastadsstarttime = 0;
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7e3
// Size: 0x62
function monitoradstime() {
    if (isplayerads()) {
        if (!self.wasads) {
            self.lastadsstarttime = gettime();
            self.wasads = 1;
            self clearsoundsubmix("hit_indicator_hipfire");
        }
        return;
    }
    if (self.wasads) {
        self setsoundsubmix("hit_indicator_hipfire");
    }
    self.wasads = 0;
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb84c
// Size: 0x78
function monitorreload() {
    level endon("game_ended");
    self endon("disconnect");
    self.lastreloadtime = 0;
    while (true) {
        self waittill("reload");
        objweapon = self getcurrentweapon();
        scripts/cp_mp/challenges::function_b4b8d881af22f7bd(self, objweapon);
        self.lastreloadtime = gettime();
        incpersstat("reloads", 1);
        if (isdefined(self.var_c78bf6b063fc5789)) {
            self.var_c78bf6b063fc5789 = 0;
        }
    }
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8cb
// Size: 0x3b
function function_3403058663ef4843() {
    level endon("game_ended");
    self endon("disconnect");
    while (true) {
        self waittill("end_firing");
        wait(1);
        if (isdefined(self.var_79a1a1fe9f3bf357)) {
            self.var_79a1a1fe9f3bf357 = 0;
        }
    }
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb90d
// Size: 0x28
function monitorweaponpickup() {
    level endon("game_ended");
    self endon("disconnect");
    while (true) {
        self waittill("weapon_pickup");
        function_7731a04537766917();
    }
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb93c
// Size: 0x39
function monitorweaponswitch() {
    level endon("game_ended");
    self endon("disconnect");
    self.lastweaponchangetime = 0;
    while (true) {
        self waittill("weapon_change");
        self.lastweaponchangetime = gettime();
    }
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb97c
// Size: 0x11
function updateweaponchangetime() {
    self.lastweaponchangetime = gettime();
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb994
// Size: 0x4f
function initstancetracking() {
    self.laststance = self getstance();
    self.laststancetimes = [];
    self.laststancetimes["prone"] = 0;
    self.laststancetimes["crouch"] = 0;
    self.laststancetimes["stand"] = 0;
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9ea
// Size: 0x24d
function updatestancetracking() {
    if (!isalive(self)) {
        return;
    }
    mantleprev = self.mantlecur;
    self.mantlecur = self ismantling();
    if (!istrue(mantleprev) && self.mantlecur) {
        scripts/mp/potg::processevent("recent_mantle");
    }
    jumpprev = self.jumpcur;
    self.jumpcur = self isjumping();
    if (!istrue(jumpprev) && self.jumpcur) {
        scripts/mp/potg::processevent("recent_jump");
    }
    dtpprev = self.dtpcur;
    self.dtpcur = self function_c36cfe1c6acaef46();
    if (!istrue(dtpprev) && self.dtpcur) {
        thread supineCorkscrew();
    }
    stance = self getstance();
    if (stance != self.laststance) {
        scripts/mp/potg_events::playerstancechanged(stance);
        if (self.laststance == "crouch") {
            starttime = self.pers["lastStanceChangeTime"];
            time = (gettime() - starttime) / 1000;
            incpersstat("timeCrouched", time);
        }
        if (self.laststance == "prone") {
            starttime = self.pers["lastStanceChangeTime"];
            time = (gettime() - starttime) / 1000;
            incpersstat("timeProne", time);
        }
        self.pers["lastStanceChangeTime"] = gettime();
        if (!isdefined(self.pers["stanceTracking"])) {
            self.pers["stanceTracking"] = [];
            self.pers["stanceTracking"]["prone"] = 0;
            self.pers["stanceTracking"]["crouch"] = 0;
            self.pers["stanceTracking"]["stand"] = 0;
        }
        if (stance == "prone" || stance == "crouch" || stance == "stand") {
            self.pers["stanceTracking"][stance]++;
        }
    }
    self.laststancetimes[stance] = gettime();
    self.laststance = stance;
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc3e
// Size: 0x135
function supineCorkscrew() {
    self notify("supineCorkscrew");
    self endon("supineCorkscrew");
    self endon("death_or_disconnect");
    if (!potg::function_acab8b716476b589()) {
        return;
    }
    if (!isdefined(level.gametypebundle.var_7b8c8e7087d2e518)) {
        return;
    }
    attacker = self;
    yawprev = attacker.angles[1];
    yawcurr = attacker.angles[1];
    anglescumulative = 0;
    while (istrue(attacker.dtpcur)) {
        if (!istrue(attacker.var_bbcc5ab53663340a)) {
            yawprev = yawcurr;
            yawcurr = attacker.angles[1];
            angledelta = angleclamp180(yawcurr - yawprev);
            anglescumulative = anglescumulative + angledelta;
            if (abs(anglescumulative) >= level.gametypebundle.var_7b8c8e7087d2e518) {
                attacker.var_bbcc5ab53663340a = 1;
            }
        }
        waitframe();
    }
    if (isdefined(level.gametypebundle.var_f609acb8d6f7eddb)) {
        wait(level.gametypebundle.var_f609acb8d6f7eddb);
    }
    attacker.var_bbcc5ab53663340a = 0;
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd7a
// Size: 0x14
function predatormissileimpact(impactpos) {
    scripts/mp/potg_events::predatormissileimpact(impactpos);
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd95
// Size: 0x14
function largevehicleexplosion(explosionpos) {
    scripts/mp/potg_events::largevehicleexplosion(explosionpos);
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdb0
// Size: 0x14
function vehiclekilled(damagedata) {
    scripts/mp/potg_events::vehiclekilled(damagedata);
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdcb
// Size: 0x15
function missilefired(missile) {
    thread trackmissile(missile);
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbde7
// Size: 0xe5
function trackmissile(missile) {
    level endon("game_ended");
    missile endon("death");
    missile endon("entitydeleted");
    missile.whizbyplayers = [];
    while (true) {
        whizbyplayers = utility::playersnear(missile.origin, 220);
        foreach (player in whizbyplayers) {
            if (isdefined(missile.owner) && player == missile.owner) {
                continue;
            }
            missilewhizby(player, missile);
            missile.whizbyplayers[player.guid] = 1;
        }
        wait(0.1);
    }
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbed3
// Size: 0x1c
function missilewhizby(player, missile) {
    scripts/mp/potg_events::missilewhizby(player);
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbef6
// Size: 0x39c
function bombdefused(defuser, defusesite) {
    var_8f8dc78c3242728b = 0;
    if (getgametypenumlives() >= 1) {
        liveplayers = getpotentiallivingplayers();
        if (liveplayers.size == 1 && liveplayers[0] == defuser) {
            var_8f8dc78c3242728b = 1;
        }
    }
    enemiesnearby = 0;
    if (!var_8f8dc78c3242728b && getgametype() != "dd") {
        playersnearby = getplayersinradius(defuser.origin, 600);
        foreach (player in playersnearby) {
            if (player.team != defuser.team) {
                enemiesnearby = 1;
                break;
            }
        }
    }
    defusesite = isdefined(defusesite.objectivekey) ? defusesite.objectivekey : undefined;
    if (isdefined(level.bombowner) && level.bombowner.bombplantedtime + 3000 + level.defusetime * 1000 > gettime() && isreallyalive(level.bombowner)) {
        defuser thread scripts/mp/rank::scoreeventpopup(#"ninja_defuse", defusesite);
        defuser thread scripts/mp/hud_message::showsplash("ninja_defuse", scripts/mp/rank::getscoreinfovalue(#"defuse"));
        if (getgametype() != "dd") {
            enemiesnearby = 1;
        }
    } else {
        defuser thread scripts/mp/hud_message::showsplash("emp_defuse", scripts/mp/rank::getscoreinfovalue(#"defuse"));
        defuser thread scripts/mp/rank::scoreeventpopup(#"defuse", defusesite);
    }
    if (var_8f8dc78c3242728b) {
        defuser thread scripts/mp/utility/points::doScoreEvent(#"hash_b723ef4352e748d0", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, {extraparam:defusesite});
    } else {
        defuser thread scripts/mp/utility/points::doScoreEvent(#"hash_d42f3a6d11e62127", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, {extraparam:defusesite});
    }
    defuser incpersstat("defuses", 1);
    defuser scripts/mp/persistence::statsetchild("round", "defuses", defuser.pers["defuses"]);
    defuser scripts/mp/codcasterclientmatchdata::function_48544e365f4f5648(2, 1);
    if (isdefined(defuser.pers["sneakDefuses"])) {
        var_5e88abb83d46a357 = scripts/mp/utility/teams::getenemyplayers(defuser.team, 1).size > 0;
        if (var_5e88abb83d46a357) {
            defuser incpersstat("sneakDefuses", 1);
        }
    }
    if (getgametype() != "sr") {
        defuser setextrascore1(defuser.pers["defuses"]);
    }
    if (isplayer(defuser)) {
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = defuser;
        var_7e2c53b0bcf117d9.eventname = "defuse";
        var_7e2c53b0bcf117d9.position = defuser.origin;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
    }
    if (var_8f8dc78c3242728b) {
        logannouncement(defuser, undefined, "Bomb Defused", defuser.origin, "last_alive");
    } else {
        logannouncement(defuser, undefined, "Bomb Defused", defuser.origin);
    }
    scripts/mp/potg_events::bombdefused(defuser, var_8f8dc78c3242728b, enemiesnearby);
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc299
// Size: 0x36
function revivedplayer(reviver, revivee) {
    if (reviver == revivee) {
        return;
    }
    scripts/mp/potg_events::revivedplayer(reviver, revivee);
    if (scripts/cp_mp/utility/game_utility::isbrstylegametype()) {
        scripts/mp/gametypes/br_analytics::branalytics_revive(reviver, revivee);
    }
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2d6
// Size: 0x32
function doorused(player, opening) {
    scripts/mp/potg_events::doorused(player, opening);
    if (opening) {
        player.lastdooropentime = gettime();
    }
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc30f
// Size: 0x24
function shothit() {
    scripts/mp/utility/stats::initpersstat("shotsHit");
    scripts/mp/utility/stats::incpersstat("shotsHit", 1);
    scripts/mp/potg_events::shothit();
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc33a
// Size: 0x1d
function shotmissed(totalshots, hitshots) {
    scripts/mp/potg_events::shotmissed(totalshots, hitshots);
}

// Namespace events / scripts/mp/events
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc35e
// Size: 0x238
function function_2fca19675eb69f1a(victim, shitloc, idamage) {
    if (isagent(victim) || !isdefined(victim.clientid)) {
        return;
    }
    if (isdefined(self.combatinstances) && isdefined(self.combatinstances[victim.clientid])) {
        if (isdefined(self.combatinstances[victim.clientid].var_d7cb4d5d8b4f8e2e)) {
            if (self.combatinstances[victim.clientid].var_d7cb4d5d8b4f8e2e + 10000 > gettime()) {
                if (isdefined(self.currentweapon) && isdefined(self.currentweapon.basename)) {
                    if (isdefined(self.primaryweaponobj) && isdefined(self.primaryweaponobj.basename) && self.currentweapon.basename == self.primaryweaponobj.basename) {
                        if (function_632bdd4591097aef(shitloc)) {
                            self.combatinstances[victim.clientid].primaryheadshots++;
                        }
                        self.combatinstances[victim.clientid].totalshots++;
                    } else if (isdefined(self.secondaryweaponobj) && isdefined(self.secondaryweaponobj.basename) && self.currentweapon.basename == self.secondaryweaponobj.basename) {
                        if (function_632bdd4591097aef(shitloc)) {
                            self.combatinstances[victim.clientid].secondaryheadshots++;
                        }
                        self.combatinstances[victim.clientid].secondaryshots++;
                    }
                }
                self.combatinstances[victim.clientid].var_d7cb4d5d8b4f8e2e = gettime();
                return;
            }
        }
    }
    function_c5f7e38f739b35a1(victim, shitloc, idamage);
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc59d
// Size: 0x1ae
function function_cf1cfbbec7d07d44(totalshots, missedshots) {
    if (!isdefined(self.combatinstances)) {
        return;
    }
    if (self.combatinstances.size > 0) {
        foreach (instance in self.combatinstances) {
            if (!isdefined(self.currentweapon) || !isdefined(self.currentweapon.basename)) {
                continue;
            }
            if (isdefined(self.primaryweaponobj) && isdefined(self.primaryweaponobj.basename) && self.currentweapon.basename == self.primaryweaponobj.basename) {
                instance.shotsmissed = instance.shotsmissed + missedshots;
                instance.totalshots = instance.totalshots + totalshots;
                continue;
            }
            if (isdefined(self.secondaryweaponobj) && isdefined(self.secondaryweaponobj.basename) && self.currentweapon.basename == self.secondaryweaponobj.basename) {
                instance.secondaryshots = instance.secondaryshots + missedshots;
                instance.secondaryshotsmissed = instance.secondaryshotsmissed + totalshots;
            }
        }
    }
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc752
// Size: 0x30
function function_f3096708aa63946f(a, b) {
    if (isdefined(a) && isdefined(b)) {
        return distance(a, b);
    }
    return -1;
}

// Namespace events / scripts/mp/events
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc789
// Size: 0x306
function function_c5f7e38f739b35a1(victim, shitloc, idamage) {
    struct = spawnstruct();
    struct.victimid = victim.clientid;
    struct.victimorigin = ter_op(isdefined(victim.origin), victim.origin, (0, 0, 0));
    struct.combatstarttime = gettime();
    struct.var_d7cb4d5d8b4f8e2e = gettime();
    struct.attackerweapon = self.primaryweaponobj.basename;
    struct.attackersecondary = isdefined(self.secondaryweaponobj) ? self.secondaryweaponobj.basename : undefined;
    if (isdefined(self.secondaryweaponobj) && isdefined(self.secondaryweaponobj.basename)) {
        struct.attackersecondary = self.secondaryweaponobj.basename;
    } else {
        struct.attackersecondary = undefined;
    }
    struct.victimweapon = victim.currentweapon.basename;
    struct.distancestart = function_f3096708aa63946f(self.origin, victim.origin);
    struct.totalshots = 0;
    struct.shotsmissed = 0;
    struct.secondaryshots = 0;
    struct.secondaryshotsmissed = 0;
    struct.victiminitialhealth = victim.health + idamage;
    struct.primaryheadshots = 0;
    struct.secondaryheadshots = 0;
    struct.var_61944d23e1fcf1c2 = self.primaryweapon;
    struct.var_ab9be282f142f11a = self.secondaryweapon;
    struct.var_56aeae6c53565509 = self.primaryweaponobj;
    struct.var_8f7cffaea5dcdff1 = self.secondaryweaponobj;
    if (self.currentweapon.basename == self.primaryweaponobj.basename) {
        struct.totalshots = 1;
        if (function_632bdd4591097aef(shitloc)) {
            struct.primaryheadshots = 1;
        }
    } else if (isdefined(self.secondaryweaponobj) && self.currentweapon.basename == self.secondaryweaponobj.basename) {
        struct.secondaryshots = 1;
        if (function_632bdd4591097aef(shitloc)) {
            struct.secondaryheadshots = 1;
        }
    }
    self.combatinstances[victim.clientid] = struct;
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca96
// Size: 0x966
function function_f0c7425bd5a7050(victim, meansofdeath) {
    waittillframeend();
    if (!isdefined(self.combatinstances)) {
        return;
    }
    foreach (instance in self.combatinstances) {
        if (instance.victimid == victim.clientid) {
            if (instance.totalshots > 0) {
                if (instance.shotsmissed == 0) {
                    var_5813d1e9fe8e86e4 = 100;
                } else {
                    var_5813d1e9fe8e86e4 = int(clamp((1 - instance.shotsmissed / instance.totalshots) * 100, 0, 100));
                }
            } else {
                var_5813d1e9fe8e86e4 = 0;
            }
            if (instance.secondaryshots > 0) {
                if (instance.secondaryshotsmissed == 0) {
                    var_56dccc97e40a858e = 100;
                } else {
                    var_56dccc97e40a858e = int(clamp((1 - instance.secondaryshotsmissed / instance.secondaryshots) * 100, 0, 100));
                }
            } else {
                var_56dccc97e40a858e = 0;
            }
            combatduration = (gettime() - instance.combatstarttime) / 1000;
            primarytuning = namespace_e77194a0203f683::function_b4ed203552f83bca(instance.var_56aeae6c53565509);
            secondarytuning = namespace_e77194a0203f683::function_b4ed203552f83bca(instance.var_8f7cffaea5dcdff1);
            self dlog_recordplayerevent("dlog_event_mp_combat_instance", ["victim", victim, "combat_duration", combatduration, "attacker_weapon_primary", instance.attackerweapon, "attacker_accuracy_primary", var_5813d1e9fe8e86e4, "victim_weapon", instance.victimweapon, "distance_start", instance.distancestart, "distance_final", function_f3096708aa63946f(self.origin, victim.origin), "attacker_weapon_secondary", instance.attackersecondary, "attacker_accuracy_secondary", var_56dccc97e40a858e, "total_shots_primary", instance.totalshots, "total_shots_secondary", instance.secondaryshots, "victim_initial_health", float(instance.victiminitialhealth), "attacker_headshots_primary", instance.primaryheadshots, "attacker_headshots_secondary", instance.secondaryheadshots, "primary_weapon_receiver", primarytuning.weapon_receiver, "primary_weapon_front_piece", primarytuning.weapon_front_piece, "primary_weapon_back_piece", primarytuning.weapon_back_piece, "primary_weapon_magazine", primarytuning.weapon_magazine, "primary_weapon_optic", primarytuning.weapon_optic, "primary_weapon_underbarrel", primarytuning.weapon_underbarrel, "primary_weapon_modifier", primarytuning.weapon_modifier, "primary_weapon_muzzle", primarytuning.weapon_muzzle, "primary_weapon_rear_grip", primarytuning.weapon_rear_grip, "primary_weapon_trigger", primarytuning.weapon_trigger, "primary_weapon_extra", primarytuning.weapon_extra, "primary_lid_receiver", primarytuning.lid_receiver, "primary_lid_front_piece", primarytuning.lid_front_piece, "primary_lid_back_piece", primarytuning.lid_back_piece, "primary_lid_magazine", primarytuning.lid_magazine, "primary_lid_optic", primarytuning.lid_optic, "primary_lid_underbarrel", primarytuning.lid_underbarrel, "primary_lid_modifier", primarytuning.lid_modifier, "primary_lid_muzzle", primarytuning.lid_muzzle, "primary_lid_rear_grip", primarytuning.lid_rear_grip, "primary_lid_trigger", primarytuning.lid_trigger, "primary_lid_extra", primarytuning.lid_extra, "primary_tv_receiver", primarytuning.tv_receiver, "primary_tv_front_piece", primarytuning.tv_front_piece, "primary_tv_back_piece", primarytuning.tv_back_piece, "primary_tv_magazine", primarytuning.tv_magazine, "primary_tv_optic", primarytuning.tv_optic, "primary_tv_underbarrel", primarytuning.tv_underbarrel, "primary_tv_modifier", primarytuning.tv_modifier, "primary_tv_muzzle", primarytuning.tv_muzzle, "primary_tv_rear_grip", primarytuning.tv_rear_grip, "primary_tv_trigger", primarytuning.tv_trigger, "primary_tv_extra", primarytuning.tv_extra, "primary_is_bp_tuned", primarytuning.tuned, "secondary_weapon_receiver", secondarytuning.weapon_receiver, "secondary_weapon_front_piece", secondarytuning.weapon_front_piece, "secondary_weapon_back_piece", secondarytuning.weapon_back_piece, "secondary_weapon_magazine", secondarytuning.weapon_magazine, "secondary_weapon_optic", secondarytuning.weapon_optic, "secondary_weapon_underbarrel", secondarytuning.weapon_underbarrel, "secondary_weapon_modifier", secondarytuning.weapon_modifier, "secondary_weapon_muzzle", secondarytuning.weapon_muzzle, "secondary_weapon_rear_grip", secondarytuning.weapon_rear_grip, "secondary_weapon_trigger", secondarytuning.weapon_trigger, "secondary_weapon_extra", secondarytuning.weapon_extra, "secondary_lid_receiver", secondarytuning.lid_receiver, "secondary_lid_front_piece", secondarytuning.lid_front_piece, "secondary_lid_back_piece", secondarytuning.lid_back_piece, "secondary_lid_magazine", secondarytuning.lid_magazine, "secondary_lid_optic", secondarytuning.lid_optic, "secondary_lid_underbarrel", secondarytuning.lid_underbarrel, "secondary_lid_modifier", secondarytuning.lid_modifier, "secondary_lid_muzzle", secondarytuning.lid_muzzle, "secondary_lid_rear_grip", secondarytuning.lid_rear_grip, "secondary_lid_trigger", secondarytuning.lid_trigger, "secondary_lid_extra", secondarytuning.lid_extra, "secondary_tv_receiver", secondarytuning.tv_receiver, "secondary_tv_front_piece", secondarytuning.tv_front_piece, "secondary_tv_back_piece", secondarytuning.tv_back_piece, "secondary_tv_magazine", secondarytuning.tv_magazine, "secondary_tv_optic", secondarytuning.tv_optic, "secondary_tv_underbarrel", secondarytuning.tv_underbarrel, "secondary_tv_modifier", secondarytuning.tv_modifier, "secondary_tv_muzzle", secondarytuning.tv_muzzle, "secondary_tv_rear_grip", secondarytuning.tv_rear_grip, "secondary_tv_trigger", secondarytuning.tv_trigger, "secondary_tv_extra", secondarytuning.tv_extra, "secondary_is_bp_tuned", secondarytuning.tuned]);
            instance.var_d7cb4d5d8b4f8e2e = undefined;
            break;
        }
    }
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd403
// Size: 0x2f
function function_632bdd4591097aef(shitloc) {
    return isdefined(shitloc) && (shitloc == "head" || shitloc == "helmet" || shitloc == "neck");
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd43a
// Size: 0xd
function function_7731a04537766917() {
    self.combatinstances = undefined;
}

// Namespace events / scripts/mp/events
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd44e
// Size: 0x26f
function killeventtextpopup(scoreeventref, showassplash, dontshowscoreevent, extraparam) {
    if (function_16aa7ce5efacbccb()) {
        return;
    }
    if (!isdefined(self)) {
        demoforcesre("killEventTextPopup called with invalid self");
        return;
    }
    self endon("death_or_disconnect");
    showassplash = istrue(showassplash);
    if (!scoreeventhastext(scoreeventref) && !showassplash) {
        return;
    }
    if (!isdefined(self.killeventqueue)) {
        self.killeventqueue = [];
    }
    foreach (event in self.killeventqueue) {
        if (event.scoreeventref == scoreeventref) {
            return;
        }
    }
    splashdata = spawnstruct();
    splashdata.scoreeventref = scoreeventref;
    splashdata.showassplash = showassplash;
    splashdata.priority = scripts/mp/rank::getscoreeventpriority(scoreeventref);
    splashdata.alwaysshowsplash = scripts/mp/rank::scoreeventalwaysshowassplash(scoreeventref);
    splashdata.processedsplash = 0;
    splashdata.processedscoreevent = 0;
    splashdata.dontshowscoreevent = istrue(dontshowscoreevent);
    splashdata.extraparam = extraparam;
    var_60a14cf75591146d = !splashdata.dontshowscoreevent;
    if (var_60a14cf75591146d && splashdata.alwaysshowsplash && istrue(level.var_393c8c75a6a52875)) {
        var_d14dfa9f36e616f2 = function_e3dfd7e570749681(scoreeventref);
        if (var_d14dfa9f36e616f2 && !istrue(getscoreinfocategory(scoreeventref, #"hash_e98734bda1c5c091"))) {
            splashdata.dontshowscoreevent = 1;
        }
    }
    self.killeventqueue[self.killeventqueue.size] = splashdata;
    self notify("killEventTextPopup");
    self endon("killEventTextPopup");
    waitframe();
    if (!isdefined(self.splashpriorityqueue)) {
        self.splashpriorityqueue = [];
    }
    foreach (event in self.killeventqueue) {
        insertbypriority(event);
    }
    self.killeventqueue = undefined;
    thread processsplashpriorityqueue();
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6c4
// Size: 0x22a
function processsplashpriorityqueue() {
    self notify("processSplashPriorityQueue");
    self endon("processSplashPriorityQueue");
    if (!isdefined(self.splashpriorityqueue)) {
        return;
    }
    splashallowed = !istrue(level.removekilleventsplash);
    /#
        foreach (event in self.splashpriorityqueue) {
            if (splashallowed && istrue(event.showassplash) && event.alwaysshowsplash) {
                println("wallkill" + function_3c8848a3a11b2553(event.scoreeventref));
            }
            println("cur_kill_streak" + function_3c8848a3a11b2553(event.scoreeventref));
        }
    #/
    foreach (event in self.splashpriorityqueue) {
        if (event.processedsplash) {
            continue;
        }
        if (splashallowed && istrue(event.showassplash) && event.alwaysshowsplash) {
            thread scripts/mp/hud_message::showsplash(event.scoreeventref);
        }
        event.processedsplash = 1;
    }
    foreach (event in self.splashpriorityqueue) {
        if (event.processedscoreevent || event.dontshowscoreevent) {
            continue;
        }
        thread scripts/mp/rank::scoreeventpopup(event.scoreeventref, event.extraparam);
        event.processedscoreevent = 1;
        wait(getdvarfloat(@"hash_1eb32d180bc7cff8", 0.25));
    }
    self.splashpriorityqueue = undefined;
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8f5
// Size: 0x110
function insertbypriority(splashdata) {
    if (self.splashpriorityqueue.size == 0) {
        self.splashpriorityqueue[self.splashpriorityqueue.size] = splashdata;
        return;
    }
    foreach (event in self.splashpriorityqueue) {
        if (event.scoreeventref == splashdata.scoreeventref) {
            return;
        }
    }
    for (i = 0; i < self.splashpriorityqueue.size; i++) {
        if (splashdata.priority > self.splashpriorityqueue[i].priority) {
            self.splashpriorityqueue = array_insert(self.splashpriorityqueue, splashdata, i);
            return;
        }
    }
    self.splashpriorityqueue[self.splashpriorityqueue.size] = splashdata;
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda0c
// Size: 0x9c
function getnemesis() {
    nemesis = [];
    if (!lpcfeaturegated() && isdefined(self.killedby)) {
        highestkillcount = 0;
        foreach (guid, killcount in self.killedby) {
            if (killcount > highestkillcount) {
                nemesis = [];
                nemesis[nemesis.size] = guid;
            }
            if (killcount == highestkillcount) {
                nemesis[nemesis.size] = guid;
            }
        }
    }
    return nemesis;
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdab0
// Size: 0x76
function isxmike109explosiveheadshot(objweapon, deathdata) {
    if (isdefined(objweapon) && getweaponrootname(objweapon.basename) == "iw8_sn_xmike109" && isdefined(deathdata.hitloc) && (deathdata.hitloc == "head" || deathdata.hitloc == "helmet")) {
        return 1;
    }
    return 0;
}

// Namespace events / scripts/mp/events
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb2d
// Size: 0x38
function function_d355d90bab289087(objweapon, deathdata) {
    if (function_160a992c78bdf589(objweapon) && isdefined(deathdata) && istrue(deathdata.var_f83c15acb64c91b7)) {
        return true;
    }
    return false;
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb6d
// Size: 0x132
function checklethalequipmentachievement(objweapon) {
    /#
        assertex(isdefined(level.lethal_equipmentmaskoffsets), "checkLethalEquipmentAchievement() called without level.lethal_equipmentMaskOffsets map being defined first.");
    #/
    if (!level.challengesallowed) {
        return;
    }
    equipref = scripts/mp/equipment::getequipmentreffromweapon(objweapon);
    if (!isdefined(equipref) || !isdefined(level.lethal_equipmentmaskoffsets[equipref])) {
        return;
    }
    if (self.pers["lethalEquipmentKillMask"] & level.lethal_equipmentmaskoffsets[equipref]) {
        return;
    } else {
        self.pers["lethalEquipmentKillMask"] = self.pers["lethalEquipmentKillMask"] | level.lethal_equipmentmaskoffsets[equipref];
    }
    var_ddacadd2126887bd = 0;
    foreach (offset in level.lethal_equipmentmaskoffsets) {
        if (self.pers["lethalEquipmentKillMask"] & offset) {
            var_ddacadd2126887bd++;
            if (var_ddacadd2126887bd >= 6) {
                self reportchallengeuserevent("collect_item", "lethal_achievement");
                break;
            }
        }
    }
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdca6
// Size: 0xa0
function incrementobjectiveachievementkill() {
    if (!level.challengesallowed) {
        return;
    }
    if (self.objectiveachievementkillcount == -1) {
        return;
    }
    self.objectiveachievementkillcount++;
    var_5eadae570201e028 = undefined;
    switch (level.mapname) {
    case #"hash_9de262a7132ec180":
    case #"hash_dd0468a72c625fe3":
        var_5eadae570201e028 = 50;
        break;
    default:
        var_5eadae570201e028 = 30;
        break;
    }
    if (self.objectiveachievementkillcount >= var_5eadae570201e028) {
        self reportchallengeuserevent("collect_item", "objective_player_achievement");
        self.objectiveachievementkillcount = -1;
    }
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd4d
// Size: 0x108
function checkfinalkillachievements(victim) {
    self endon("disconnect");
    var_b8ab57b5fee4c51f = 0;
    var_d3683388e46c971c = 0;
    if (!level.challengesallowed || !isdefined(victim)) {
        self.recondroneteammate = undefined;
        return;
    }
    if (isplayer(victim) && isdefined(self.recondroneteammate)) {
        if (istrue(self.modifiers["recon_drone_explosive"])) {
            var_b8ab57b5fee4c51f = 1;
        }
    }
    if (scripts/cp_mp/utility/game_utility::isbrstylegametype()) {
        if (istrue(self.modifiers["execution"])) {
            var_d3683388e46c971c = 1;
        }
    }
    level waittill_any_timeout_1(1, "game_ended");
    if (level.gameended) {
        if (var_b8ab57b5fee4c51f) {
            self reportchallengeuserevent("collect_item", "recon_drone_achievement");
            if (isdefined(self.recondroneteammate)) {
                self.recondroneteammate reportchallengeuserevent("collect_item", "recon_drone_achievement");
            }
        }
        if (var_d3683388e46c971c) {
            scripts/mp/gametypes/br_challenges::challengeevaluator("br_mastery_roundKillExecute", undefined);
        }
    }
    self.recondroneteammate = undefined;
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde5c
// Size: 0x25
function function_16aa7ce5efacbccb() {
    /#
        if (getdvarint(@"hash_6735e9fcb3e821b9", 0)) {
            return 1;
        }
    #/
    return istrue(level.var_16aa7ce5efacbccb);
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde89
// Size: 0x15
function function_4a4d0d400fd59760() {
    level callback::add("on_ai_killed", &on_ai_killed);
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdea5
// Size: 0x202
function on_ai_killed(sparams) {
    if (!isdefined(sparams.eattacker)) {
        return;
    }
    if (isdefined(sparams.eattacker.vehicletype)) {
        sparams.eattacker = sparams.eattacker getvehicleowner();
    } else if (isdefined(sparams.eattacker.owner) && isplayer(sparams.eattacker.owner)) {
        sparams.eattacker = sparams.eattacker.owner;
    }
    if (!isplayer(sparams.eattacker)) {
        return;
    }
    victim = self;
    typestring = "";
    if (!isdefined(self.var_aaf0465944b061ed)) {
        return;
    }
    var_813307117c9bea44 = self.var_aaf0465944b061ed;
    if (!function_d03495fe6418377b(var_813307117c9bea44)) {
        /#
            assertex(1, var_813307117c9bea44);
        #/
        var_813307117c9bea44 = function_1823ff50bb28148d(var_813307117c9bea44);
    }
    if (isdefined(level.var_9871526022516e0b)) {
        [[ level.var_9871526022516e0b ]](victim, sparams.eattacker, sparams.einflictor, sparams.smeansofdeath, sparams.sweapon, sparams.shitloc, typestring, var_813307117c9bea44);
        return;
    }
    points = scripts/mp/rank::getscoreinfovalue(var_813307117c9bea44);
    xp = scripts/mp/rank::getscoreinfoxp(var_813307117c9bea44);
    sparams.eattacker killeventtextpopup(var_813307117c9bea44, 0, 0);
    if (points > 0) {
        sparams.eattacker scripts/mp/gamescore::giveplayerscore(var_813307117c9bea44, points, self, undefined);
        sparams.eattacker displayscoreeventpoints(points, var_813307117c9bea44);
    }
    if (xp > 0) {
        sparams.eattacker scripts/mp/rank::giverankxp(var_813307117c9bea44, xp, sparams.sweapon, 1, 0);
    }
}

// Namespace events / scripts/mp/events
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0ae
// Size: 0x2b
function watchForMoreBulletKillsInAFrameAE() {
    self endon("disconnect");
    level endon("game_ended");
    self notify("watchForMoreBulletKillsInAFrameAE");
    self endon("watchForMoreBulletKillsInAFrameAE");
    waittillframeend();
    self.var_39a4aa8a028cb36e = 0;
}

// Namespace events / scripts/mp/events
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0e0
// Size: 0x50
function function_c5f08330d9923476(numkills) {
    if (numkills == 2) {
        self.modifiers["mask2"] = scripts/cp_mp/challenges::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_8368a43e439d8a67"));
    }
}

