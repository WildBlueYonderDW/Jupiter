// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\equipment\claymore.gsc;
#using scripts\mp\equipment\at_mine.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\killstreaks\airstrike.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\mp\mp_agent.gsc;
#using scripts\stealth\enemy.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_736dec95a49487a6;
#using scripts\mp\equipment_interact.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using script_60e3273df6b5f7d1;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using script_2304453c69e996e2;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\targetmarkergroups.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\common\vehicle_paths.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_220d0eb95a8fab7d;
#using scripts\common\anim.gsc;
#using script_4c770a9a4ad7659c;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\debug.gsc;
#using script_3214e6fcdce468a7;

#namespace namespace_17b45e55cf344cda;

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbbd
// Size: 0x6
function function_946f326db0ef7292() {
    /#
    #/
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbca
// Size: 0x14a
function function_5881a353a471bd02(aitype, position, angles, team, tier, groupname) {
    if (aitype == "civ") {
        var_2d0885860b423236 = "jup_ob_civ_base";
        team = "civilian";
    } else {
        if (isdefined(team) == 0) {
            team = "team_hundred_ninety";
        }
        if (!isdefined(aitype)) {
            aitype = "grunt";
        }
        if (!isdefined(tier)) {
            tier = 1;
        }
        if (aitype == "zombie") {
            var_2d0885860b423236 = "jup_spawner_" + aitype + "_base";
        } else if (aitype == "armored_zombie") {
            var_2d0885860b423236 = "jup_spawner_" + "zombie_base_armored_heavy";
        } else if (team == "allies") {
            var_2d0885860b423236 = "jup_ob_ally_" + aitype + "_base";
        } else {
            var_2d0885860b423236 = "jup_ob_enemy_" + aitype;
        }
    }
    agent = namespace_39b39f93ee3db0c2::spawnnewagentaitype(var_2d0885860b423236, position, angles, team);
    if (isdefined(agent)) {
        if (isdefined(groupname) && aitype != "civ" && aitype != "zombie") {
            function_233776aa4bd0a7d9(agent, groupname);
        }
        if (isdefined(agent)) {
            agent.aitype = aitype;
        }
        if (!threatbiasgroupexists(team)) {
            createthreatbiasgroup(team);
        }
        agent setthreatbiasgroup(team);
    }
    return agent;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1c
// Size: 0x43
function function_233776aa4bd0a7d9(agent, groupname) {
    if (isdefined(agent) && isdefined(groupname)) {
        agent.script_stealthgroup = groupname;
        agent.var_ba67494935b9726b = 1;
        agent thread enemy::main();
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd66
// Size: 0x6
function function_d45ce3fa8102856f() {
    /#
    #/
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd73
// Size: 0xef
function function_daee52aa53ad6314(center, radius) {
    var_5a48fe65d507ab4e = getaiarrayinradius(center, radius);
    var_a36d07aa1a1297cd = [];
    foreach (ai in var_5a48fe65d507ab4e) {
        if (!function_39e79a17581dee4f(ai, var_a36d07aa1a1297cd, 256)) {
            marker = spawnscriptable("ob_zombie_cleanup_marker", ai.origin);
            marker setscriptablepartstate("target", "on");
            scriptable::scriptable_addnotifycallback("detonate", &function_aff11e45f0c38fd3);
            var_a36d07aa1a1297cd[var_a36d07aa1a1297cd.size] = ai.origin;
            wait(randomfloatrange(0.15, 0.25));
        }
    }
    wait(1);
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe69
// Size: 0x44
function function_aff11e45f0c38fd3(instance, note, param, var_535d9c3fdddab5a9) {
    radiusdamage(instance.origin, 356, 1000, 800, undefined, "MOD_EXPLOSIVE");
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb4
// Size: 0x7b
function function_39e79a17581dee4f(ai, var_a36d07aa1a1297cd, radius) {
    foreach (var_4ff883d23a46d56 in var_a36d07aa1a1297cd) {
        if (utility::ispointinsidecircle(ai.origin, var_4ff883d23a46d56, radius)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf37
// Size: 0x6
function function_81acda909e814ff9() {
    /#
    #/
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf44
// Size: 0x53
function function_908ec13fb4d6cede(pos, badplace_id, owner, var_c88c81279416b9c3, angles, var_13ffa40ce803332f) {
    if (istrue(var_13ffa40ce803332f)) {
        return function_44bbc99cebecdc82(pos, badplace_id, owner, var_c88c81279416b9c3, angles);
    } else {
        return function_2388b5efd8f6d998(pos, badplace_id, owner, var_c88c81279416b9c3);
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9e
// Size: 0x13a
function function_2388b5efd8f6d998(pos, badplace_id, owner, var_c88c81279416b9c3) {
    mine = magicgrenademanual("at_mine_mp", pos + (0, 0, 15), (0, 0, 1));
    normal = position = velocity = surfacetype = hitent = stuckto = mine waittill("missile_stuck");
    if (isdefined(badplace_id)) {
        mine thread function_fb4d0220951a9b41(badplace_id);
    }
    if (isdefined(owner)) {
        mine.owner = owner;
    }
    mine.team = "team_hundred_ninety";
    mine.var_da8c001e4207fe06 = function_53c4c53197386572(var_c88c81279416b9c3, 150);
    mine setscriptablepartstate("visibility", "show", 0);
    mine setscriptablepartstate("floats", "hide", 0);
    mine thread at_mine::at_mine_watch_game_end();
    if (isdefined(stuckto)) {
        mine linkto(stuckto);
    }
    level thread function_fe3c4d4dd27683a0(mine, surfacetype);
    return mine;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e0
// Size: 0xec
function function_44bbc99cebecdc82(pos, badplace_id, owner, var_c88c81279416b9c3, angles) {
    if (!isdefined(angles)) {
        angles = (0, 0, 1);
    }
    mine = spawnscriptable("equip_claymore_ob", pos + (0, 0, 4), angles);
    mine.bundle = getscriptbundle(%"hash_6cc09ff20508d547");
    if (isdefined(badplace_id)) {
        mine thread function_fb4d0220951a9b41(badplace_id);
    }
    if (isdefined(owner)) {
        mine.owner = owner;
    }
    mine.team = "team_hundred_ninety";
    mine.var_da8c001e4207fe06 = function_53c4c53197386572(var_c88c81279416b9c3, 150);
    mine setscriptablepartstate("visibility", "show", 0);
    mine thread claymore::function_773e48f8d031510e();
    level thread function_fe3c4d4dd27683a0(mine);
    return mine;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d4
// Size: 0x233
function function_fe3c4d4dd27683a0(grenade, surfacetype) {
    grenade endon("mine_destroyed");
    grenade endon("death");
    grenade setscriptablepartstate("plant", "active", 0);
    if (isent(grenade)) {
        grenade missilethermal();
        grenade missileoutline();
        grenade setnodeploy(1);
        grenade enableplayermarks("equipment");
        grenade.equipmentref = "equip_at_mine";
        grenade.deletefunc = &at_mine::at_mine_delete;
        level.mines[grenade getentitynumber()] = grenade;
    } else {
        grenade.equipmentref = "equip_claymore_mp";
        grenade.deletefunc = &claymore::claymore_delete;
        grenade.weapon_name = "claymore_mp";
        level.var_8106ad57bb892525[grenade.index] = grenade;
    }
    grenade.planted = 1;
    grenade notify("mine_planted");
    if (isent(grenade)) {
        grenade namespace_26be03d9c56f9498::registersentient("Lethal_Static", "team_hundred_ninety", 1);
        grenade thread weapons::minedamagemonitor();
        grenade thread at_mine::at_mine_watch_detonate();
        grenade emp_debuff::set_apply_emp_callback(&at_mine::at_mine_empapplied);
        grenade haywire::function_172d848d58051fdf(&at_mine::function_83d4163604fc28e3);
        wait(0.75);
        if (istrue(grenade.touchedmovingplatform)) {
            grenade thread at_mine::at_mine_movingplatform_update();
        }
        wait(0.75);
        grenade thread equipment_interact::remoteinteractsetup(&at_mine::at_mine_explode_from_player_trigger, 1, 1);
    } else {
        grenade emp_debuff::set_apply_emp_callback(&claymore::claymore_empapplied);
        grenade haywire::function_172d848d58051fdf(&claymore::function_4373872960a2d51a);
    }
    grenade setscriptablepartstate("arm", "active", 0);
    grenade thread function_ceabda5bfd6f58e5();
    if (isent(grenade)) {
        grenade thread at_mine::at_mine_watch_trigger();
        grenade.weapon_name = "at_mine_mp";
        grenade thread weapons::makeexplosiveusabletag("tag_use", 1);
        var_5ae5e6cd7f0cc727 = 2;
        grenade.headiconid = grenade entityheadicons::setheadicon_factionimage(0, var_5ae5e6cd7f0cc727, undefined, undefined, undefined, 0.1, 1);
    } else {
        grenade thread claymore::claymore_watchfortrigger();
        grenade thread claymore::claymore_explodeonnotify();
        grenade.weapon_name = "claymore_mp";
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140e
// Size: 0x13c
function function_ceabda5bfd6f58e5() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    while (1) {
        players = sortbydistancecullbyradius(level.players, self.origin, self.var_da8c001e4207fe06);
        zombies = getaiarrayinradius(self.origin, 100, "team_two_hundred");
        vehicles = vehicle_getarrayinradius(self.origin, 300);
        if (vehicles.size > 0) {
            foreach (vehicle in vehicles) {
                if (isdefined(vehicle.team) && (vehicle.team == "team_hundred_ninety" || vehicle.team == "neutral")) {
                    vehicles = utility::array_remove(vehicles, vehicle);
                }
            }
        }
        ents = utility::array_combine(players, vehicles, zombies);
        if (ents.size > 0) {
            self notify("trigger_grenade", ents);
        }
        waitframe();
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1551
// Size: 0x35
function function_fb4d0220951a9b41(badplace_id) {
    badplace_cylinder(badplace_id, 0, self.origin, 100, 100, "team_hundred_ninety");
    self waittill("death");
    badplace_delete(badplace_id);
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158d
// Size: 0x7b
function function_cd2b3e5bab3edee3(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    if (eattacker.classname != "worldspawn") {
        instance notify("detonateExplosive", eattacker);
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x160f
// Size: 0x6
function function_b98fc11e18f21812() {
    /#
    #/
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161c
// Size: 0x6d
function function_586d4d82f07e0d09(struct) {
    if (!isdefined(level.aiSentryTurrets)) {
        ai_sentry_turret::init();
    }
    sentry = function_9c8190123c567b0a(struct);
    sentry setturretteam("team_hundred_ninety");
    level.aiSentryTurrets.var_a4cd5b9ae4a509f4 = array_add(level.aiSentryTurrets.var_a4cd5b9ae4a509f4, sentry);
    return sentry;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1691
// Size: 0x3aa
function function_64d1082e50f1eed() {
    if (getdvarint(@"hash_72b30f1696eedd3f", 1) == 1 && isdefined(level.sentrysettings["ai_sentry_turret"])) {
        level.sentrysettings["ai_sentry_turret"].health = getdvarint(@"hash_85190757115145bb", 99999);
        level.sentrysettings["ai_sentry_turret"].maxhealth = getdvarint(@"hash_36397d237d9e8cc4", 650);
        level.sentrysettings["ai_sentry_turret"].burstmin = getdvarint(@"hash_a46feb5e2592f0f2", 20);
        level.sentrysettings["ai_sentry_turret"].burstmax = getdvarint(@"hash_a44cf55e256cbf38", 60);
        level.sentrysettings["ai_sentry_turret"].pausemin = getdvarfloat(@"hash_e20bff747c64b106", 0.15);
        level.sentrysettings["ai_sentry_turret"].pausemax = getdvarfloat(@"hash_e22f11747c8b2054", 0.35);
        level.sentrysettings["ai_sentry_turret"].lockstrength = getdvarint(@"hash_ceced053aef1994e", 2);
        level.sentrysettings["ai_sentry_turret"].spinuptime = getdvarfloat(@"hash_b61a77e4372e219c", 1.3);
        level.sentrysettings["ai_sentry_turret"].overheattime = getdvarfloat(@"hash_dcf790014985321b", 8);
        level.sentrysettings["ai_sentry_turret"].cooldowntime = getdvarfloat(@"hash_fc469fa788fee5e8", 0.3);
        level.sentrysettings["ai_sentry_turret"].var_aa507124549d7490 = getdvarint(@"hash_820588da04a51de4", 4);
        level.sentrysettings["ai_sentry_turret"].var_87d927a08cbfdf3f = getdvarint(@"hash_72f2a62608ca10c1", 1.5);
        level.sentrysettings["ai_sentry_turret"].leftarc = getdvarint(@"hash_a3e7f06749d721bf", 95);
        level.sentrysettings["ai_sentry_turret"].rightarc = getdvarint(@"hash_736ea137340a907e", 95);
        level.sentrysettings["ai_sentry_turret"].var_947af351ce904aa5 = getdvarint(@"hash_65eca82be2c24432", 7562500);
        level.sentrysettings["ai_sentry_turret"].fxtime = getdvarfloat(@"hash_531ad70a9ffe2109", 0.3);
        level.sentrysettings["ai_sentry_turret"].var_951af53d31931d09 = getdvarint(@"hash_8f07c50eccf99ef6", 1024);
        level.sentrysettings["ai_sentry_turret"].weaponinfo = getdvar(@"hash_179a9b0ce9e8095", "jup_sentry_turret_ob_merc");
        level.sentrysettings["ai_sentry_turret"].fov = 0.7;
        level.sentrysettings["ai_sentry_turret"].var_5ab58e3971c817b5 = 1;
        level.sentrysettings["ai_sentry_turret"].var_c3fbb6661b91750f = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 0, 1, 0, 1, 1);
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a42
// Size: 0x455
function function_9c8190123c567b0a(var_b5deff62ba0378ca) {
    if (getdvarint(@"hash_70d8cba45c5014ec", 1) == 0) {
        return;
    }
    config = level.sentrysettings["ai_sentry_turret"];
    turret = spawnturret("misc_turret", var_b5deff62ba0378ca.origin, config.weaponinfo);
    turret.angles = var_b5deff62ba0378ca.angles;
    turret.health = 9999;
    turret.maxhealth = config.maxhealth;
    turret.ammocount = config.ammo;
    turret.timeout = config.timeout;
    turret.momentum = 0;
    turret.heatlevel = 0;
    turret.overheated = 0;
    turret.cooldownwaittime = 0.1;
    turret.sentrytype = "ai_sentry_turret";
    turret.owningteam = "team_hundred_ninety";
    turret.team = "team_hundred_ninety";
    turret.var_526f1dcf41e8b261 = 10;
    turret setmodel(config.modelbaseground);
    turret setturretteam(turret.owningteam);
    turret setcandamage(1);
    turret makeunusable();
    turret setnodeploy(1);
    turret setdefaultdroppitch(0);
    turret setautorotationdelay(0.5);
    turret maketurretinoperable();
    leftarc = float(utility::ter_op(isdefined(var_b5deff62ba0378ca.leftarc), var_b5deff62ba0378ca.leftarc, config.leftarc));
    turret.leftarc = leftarc;
    turret setleftarc(leftarc);
    rightarc = float(utility::ter_op(isdefined(var_b5deff62ba0378ca.rightarc), var_b5deff62ba0378ca.rightarc, config.rightarc));
    turret.rightarc = rightarc;
    turret setrightarc(rightarc);
    turret setbottomarc(50);
    turret settoparc(60);
    turret setconvergencetime(1, "pitch");
    turret setconvergencetime(1, "yaw");
    turret setconvergenceheightpercent(0.9);
    turret setdefaultdroppitch(-89);
    turret setturretmodechangewait(1);
    turret emp_debuff::allow_emp(0);
    turret laseron();
    turret.colmodel = spawn("script_model", turret.origin);
    turret.colmodel.team = turret.team;
    turret.colmodel.owner = turret.owner;
    turret.colmodel setmodel("weapon_vm_mg_sentry_turret_invis_base");
    turret.colmodel dontinterpolate();
    turret.colmodel hide();
    turret thread damage::monitordamage(turret.maxhealth, "hitequip", &ai_sentry_turret::function_4424088da3075b69, &ai_sentry_turret::function_cb32fe838a62170f, 1);
    turret thread function_56363d515ef943c1();
    turret thread function_c0a261d161b4dd1c();
    turret thread ai_sentry_turret::function_9e099b94cb9fc336();
    turret thread ai_sentry_turret::function_352e4c58083275a4();
    turret.turreton = 1;
    turret setmode(config.sentrymodeon);
    turret.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"hash_64adf440d81ca99");
    turret.var_534e788bc498be9f = getscriptbundle(%"hash_7e85af1641d03e8e");
    turret.subclass = turret.var_534e788bc498be9f.name;
    turret val::set("turret", "show_healthbar", 1);
    turret.var_1e0eb63ecb3f1e2 = 1;
    turret.max_fake_health = turret.maxhealth;
    turret thread function_af7beda981d9cee9();
    turret.var_4919d15787f01154 = 1;
    return turret;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e9f
// Size: 0x4b
function function_af7beda981d9cee9() {
    self endon("death");
    self endon("kill_turret");
    while (1) {
        currenthealth = self.maxhealth - self.damagetaken;
        if (currenthealth < 0) {
            currenthealth = 0;
        }
        self.fake_health = currenthealth;
        waitframe();
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef1
// Size: 0x17b
function function_56363d515ef943c1() {
    var_4fac8b8ce36e09f1 = var_b2797481a55c620 = self waittill("kill_turret");
    ai_sentry_turret::function_caea36dc6c3ce373("destroyed");
    self setturretowner(undefined);
    if (!istrue(var_b2797481a55c620)) {
        self playsound("sentry_explode_smoke");
        self setscriptablepartstate("shutdown", "on");
        hostmigration::hostmigration_waitlongdurationwithpause(2);
        self setscriptablepartstate("explode", "regular");
    } else {
        self setscriptablepartstate("explode", "violent");
    }
    self playsound("mp_equip_destroyed");
    if (isdefined(self.colmodel)) {
        self.colmodel delete();
    }
    if (isdefined(self.minimapid)) {
        if (utility::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ utility::getsharedfunc("game", "returnObjectiveID") ]](self.minimapid);
        }
        self.minimapid = undefined;
    }
    wait(0.2);
    if (isdefined(level.aiSentryTurrets.var_a4cd5b9ae4a509f4) && isdefined(level.aiSentryTurrets.var_a4cd5b9ae4a509f4) && array_contains(level.aiSentryTurrets.var_a4cd5b9ae4a509f4, self)) {
        level.aiSentryTurrets.var_a4cd5b9ae4a509f4 = array_remove(level.aiSentryTurrets.var_a4cd5b9ae4a509f4, self);
    }
    self delete();
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2073
// Size: 0x92
function function_c0a261d161b4dd1c() {
    self endon("death");
    config = level.sentrysettings[self.sentrytype];
    while (1) {
        if (!istrue(self.turreton) || istrue(self.turretdisabled)) {
            waitframe();
            continue;
        }
        self.besttarget = function_4b64d4acff121845();
        var_1b951c4e47ba5c35 = 1;
        if (isdefined(self.besttarget)) {
            function_8caa40a2fd7e6a50();
        }
        hostmigration::hostmigration_waitlongdurationwithpause(config.cooldowntime);
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x210c
// Size: 0xc3
function function_8caa40a2fd7e6a50() {
    config = level.sentrysettings[self.sentrytype];
    while (istrue(self.turreton) && !istrue(self.stopfiring) && function_f55fc6874dd01aab(self.besttarget)) {
        self settargetentity(self.besttarget);
        if (isplayer(self.besttarget)) {
            var_6e7b6acdc197a7ec = config.var_6265b628c3ed1103;
        } else {
            var_6e7b6acdc197a7ec = config.var_87d927a08cbfdf3f;
        }
        ai_sentry_turret::function_ba7df6eeacb835f6(config.var_aa507124549d7490, self.besttarget);
        hostmigration::hostmigration_waitlongdurationwithpause(var_6e7b6acdc197a7ec);
        self cleartargetentity();
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21d6
// Size: 0x15a
function function_4b64d4acff121845() {
    config = level.sentrysettings[self.sentrytype];
    var_951af53d31931d09 = config.var_951af53d31931d09;
    var_52edc18a611b938d = var_951af53d31931d09 * var_951af53d31931d09;
    startpoint = self gettagorigin(config.var_d7a3afc17fe9204b);
    startangles = self gettagangles(config.var_d7a3afc17fe9204b);
    var_49530ff6e6c6aba = function_b1eef70090b5b7b5(startpoint, var_951af53d31931d09, function_869ccb4e3451b8c6([0:"etype_player"]), [0:self]);
    var_e6679a25bc803627 = function_b1eef70090b5b7b5(startpoint, var_951af53d31931d09, function_869ccb4e3451b8c6([0:"etype_ai"]), [0:self], "team_two_hundred");
    var_b80dbedf22c6d394 = utility::array_combine(var_49530ff6e6c6aba, var_e6679a25bc803627);
    var_b80dbedf22c6d394 = sortbydistance(var_b80dbedf22c6d394, startpoint);
    besttarget = undefined;
    var_db0d5bf7eafe4a31 = int(min(var_b80dbedf22c6d394.size, 10));
    for (i = 0; i < var_db0d5bf7eafe4a31; i++) {
        var_e85a3b23195a0fe0 = function_3b490bffc9fa2a31(var_b80dbedf22c6d394[i], startpoint, startangles);
        if (!istrue(var_e85a3b23195a0fe0)) {
            continue;
        }
        besttarget = var_b80dbedf22c6d394[i];
        break;
    }
    return besttarget;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2338
// Size: 0x17d
function function_415f497bef802ee0(potentialtarget, var_4a28cbd22bc628e3) {
    config = level.sentrysettings[self.sentrytype];
    var_7e7a5a3c0a297a0b = [0:"tag_origin", 1:"j_mainroot", 2:"j_head"];
    targetdata = spawnstruct();
    targetdata.canseetarget = 0;
    if (!isdefined(var_4a28cbd22bc628e3)) {
        var_4a28cbd22bc628e3 = self gettagorigin(config.var_d7a3afc17fe9204b);
    }
    foreach (point in var_7e7a5a3c0a297a0b) {
        var_46685b2352074cdf = potentialtarget.origin;
        if (point != "tag_origin") {
            var_46685b2352074cdf = potentialtarget gettagorigin(point);
        }
        targetdata.canseetarget = namespace_2a184fc4902783dc::ray_trace_passed(var_4a28cbd22bc628e3, var_46685b2352074cdf, self, config.var_c3fbb6661b91750f);
        if (istrue(targetdata.canseetarget)) {
            if (isdefined(config) && istrue(config.var_5ab58e3971c817b5)) {
                targetdata.var_29a1beecc195bb8b = point;
                if (targetdata.var_29a1beecc195bb8b != "tag_origin") {
                    self function_77f987d8e20e9bfd(1);
                } else {
                    self function_77f987d8e20e9bfd(0);
                }
            }
            break;
        }
    }
    return targetdata;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24bd
// Size: 0xed
function function_820f16ab7cad7ea7(potentialtarget, var_4a28cbd22bc628e3, var_b24c8788a162225d, var_a6c20b9563f43f6c, fov) {
    config = level.sentrysettings[self.sentrytype];
    if (!isdefined(var_4a28cbd22bc628e3)) {
        var_4a28cbd22bc628e3 = self gettagorigin(config.var_d7a3afc17fe9204b);
    }
    if (!isdefined(var_b24c8788a162225d)) {
        var_b24c8788a162225d = self gettagangles(config.var_d7a3afc17fe9204b);
    }
    var_e64fafcae9d86c2 = potentialtarget.origin;
    if (isdefined(var_a6c20b9563f43f6c)) {
        var_e64fafcae9d86c2 = potentialtarget gettagorigin(var_a6c20b9563f43f6c);
    }
    var_6a4277ff9e64049f = vectornormalize(var_e64fafcae9d86c2 - var_4a28cbd22bc628e3);
    dotproduct = vectordot(anglestoforward(var_b24c8788a162225d), var_6a4277ff9e64049f);
    if (!isdefined(fov)) {
        fov = function_53c4c53197386572(config.fov, 0.5);
    }
    return dotproduct > fov;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25b2
// Size: 0x17f
function function_3b490bffc9fa2a31(potentialtarget, var_b2e01461f59ea16f, var_2c222234bd539297, var_6b908fc596bfe005) {
    if (!isdefined(potentialtarget) || !isalive(potentialtarget)) {
        return 0;
    }
    if (istrue(potentialtarget.notarget)) {
        return 0;
    }
    if (istrue(potentialtarget.inlaststand)) {
        return 0;
    }
    if (isplayer(potentialtarget)) {
        var_9f7bcc20d78cddde = potentialtarget getthreatbiasgroup();
        if (var_9f7bcc20d78cddde == "ignored_by_mercs") {
            return 0;
        }
    }
    if (istrue(var_6b908fc596bfe005)) {
        config = level.sentrysettings[self.sentrytype];
        maxrangesq = config.var_951af53d31931d09 * config.var_951af53d31931d09;
        if (distancesquared(var_b2e01461f59ea16f, potentialtarget.origin) > maxrangesq) {
            return 0;
        }
    }
    if (!function_820f16ab7cad7ea7(potentialtarget, var_b2e01461f59ea16f, var_2c222234bd539297, undefined, 0)) {
        return 0;
    }
    targetdata = function_415f497bef802ee0(potentialtarget, var_b2e01461f59ea16f);
    if (!istrue(targetdata.canseetarget)) {
        return 0;
    }
    if (isdefined(targetdata.var_29a1beecc195bb8b) && targetdata.var_29a1beecc195bb8b != "tag_origin" && !function_820f16ab7cad7ea7(potentialtarget, var_b2e01461f59ea16f, var_2c222234bd539297, targetdata.var_29a1beecc195bb8b)) {
        return 0;
    }
    if (isplayer(potentialtarget) && self.team == potentialtarget.team) {
        return 0;
    }
    return 1;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2739
// Size: 0x74
function function_f55fc6874dd01aab(besttarget) {
    config = level.sentrysettings[self.sentrytype];
    startpoint = self gettagorigin(config.var_d7a3afc17fe9204b);
    startangles = self gettagangles(config.var_d7a3afc17fe9204b);
    if (!function_3b490bffc9fa2a31(besttarget, startpoint, startangles, 1)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27b5
// Size: 0x6
function function_2580ac9dba62467a() {
    /#
    #/
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27c2
// Size: 0x30
function function_e13d4385ead80da4(start_node, owner) {
    drone = function_4646999c098f761d(start_node, owner);
    drone namespace_c908de38bcdbd93d::function_c96e4b15db766b84();
    return drone;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27fa
// Size: 0x111
function function_4646999c098f761d(start_node, owner) {
    spawndata = spawnstruct();
    spawndata.origin = start_node.origin;
    spawndata.angles = start_node.angles;
    spawndata.targetname = start_node.targetname;
    spawndata.vehicletype = "veh_jup_ai_recon_drone_mp";
    spawndata.modelname = "veh9_mil_air_cuniform_mp";
    spawndata.owner = owner;
    drone = namespace_cfae3bfa0fa8d1dd::_spawnhelicopter(undefined, spawndata.origin, spawndata.angles, spawndata.vehicletype, spawndata.modelname);
    if (!isdefined(level.supportdrones)) {
        level.supportdrones = [];
    }
    level.supportdrones = utility::array_add(level.supportdrones, drone);
    function_dfaadf89ced637c4(drone, owner, self);
    return drone;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2913
// Size: 0x4df
function function_dfaadf89ced637c4(drone, owner, var_e6013eac45290cab) {
    drone.health = 150;
    drone.maxhealth = 150;
    drone.currenthealth = 150;
    drone.hitstokill = 3;
    drone.damagetaken = 0;
    drone.speed = 45;
    drone.accel = 20;
    drone.decel = 20;
    drone.team = "team_hundred_ninety";
    drone setvehicleteam(drone.team);
    drone.helperdronetype = "scrambler_drone_guard";
    drone.stunned = 0;
    drone.inactive = 0;
    drone.ispiloted = 0;
    if (isdefined(owner)) {
        drone.owner = owner;
        drone setotherent(owner);
    }
    drone enableaimassist();
    drone setnodeploy(1);
    drone.vehiclename = "jup_ai_recon_drone";
    drone.streakname = "jup_ai_recon_drone";
    drone.attract_strength = 10000;
    drone.attract_range = 150;
    drone.attractor = missile_createattractorent(drone, drone.attract_strength, drone.attract_range);
    drone vehicle_invoketriggers(1);
    drone vehicle_breakglass(1);
    drone vehicle_setspeed(drone.speed, drone.accel, drone.decel);
    drone setyawspeedbyname("faster");
    drone setneargoalnotifydist(64);
    drone setmaxpitchroll(25, 50);
    drone sethoverparams(130, 10, 5);
    drone setturningability(1);
    drone setdroneturnparams(50, 1.3, 30, 20);
    drone.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"hash_476f48d0f96b746f");
    drone.var_534e788bc498be9f = getscriptbundle(%"hash_64bc95f99bee27d3");
    drone.subclass = drone.var_534e788bc498be9f.name;
    drone namespace_26be03d9c56f9498::registersentient("Lethal_Moving", self);
    drone setcandamage(1);
    if (utility::issharedfuncdefined("vehicle_damage", "setVehicleHitDamageData")) {
        [[ utility::getsharedfunc("vehicle_damage", "setVehicleHitDamageData") ]](drone.streakname, 1);
    }
    if (utility::issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ utility::getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]]("emp_grenade_mp", 1, 1, drone.streakname);
    }
    if (utility::issharedfuncdefined("killstreak", "killstreakSetPostModDamageCallback")) {
        drone [[ utility::getsharedfunc("killstreak", "killstreakSetPostModDamageCallback") ]](drone.streakname, &helper_drone::function_caf721cb23374e2b);
    }
    level.vehicles.damagecallbacks.deathcallbacks[drone.streakname] = &function_b15f4b2947295667;
    if (!isdefined(drone.var_a7cfe37c95fb9196)) {
        drone.var_a7cfe37c95fb9196 = [];
        drone.currentdamagestate = 0;
    }
    drone.var_a7cfe37c95fb9196[1] = spawnstruct();
    drone.var_a7cfe37c95fb9196[1].damageamount = drone.maxhealth * 0.75;
    drone.var_a7cfe37c95fb9196[1].var_d3cbdf6df967d53b = &helper_drone::function_f6914d06b20aee20;
    drone.var_a7cfe37c95fb9196[2] = spawnstruct();
    drone.var_a7cfe37c95fb9196[2].damageamount = drone.maxhealth * 0.5;
    drone.var_a7cfe37c95fb9196[2].var_d3cbdf6df967d53b = &helper_drone::function_3ad98c4f7524b525;
    drone.var_a7cfe37c95fb9196[3] = spawnstruct();
    drone.var_a7cfe37c95fb9196[3].damageamount = drone.maxhealth * 0.25;
    drone.var_a7cfe37c95fb9196[3].var_d3cbdf6df967d53b = &helper_drone::function_e68a206899cafbe5;
    helper_drone::init_helper_drone_anim();
    namespace_3bbb5a98b932c46f::function_e00b77a9cb4d8322(drone);
    drone thread function_f6b8c4b836026e10();
    drone thread function_38dff9ddaf2e7bd2(var_e6013eac45290cab);
    drone thread function_9760fe79ece4d639();
    drone setscriptablepartstate("lights", "on", 0);
    drone setscriptablepartstate("glint", "on", 0);
    drone setscriptablepartstate("engine", "on", 0);
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2df9
// Size: 0x31
function function_f6b8c4b836026e10() {
    self endon("death");
    self endon("leaving");
    self endon("explode");
    level waittill_any_2("bro_shot_start", "game_ended");
    function_b15f4b2947295667();
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e31
// Size: 0x71
function function_b15f4b2947295667(data) {
    if (!isdefined(self) || istrue(self.isdestroyed)) {
        return;
    }
    if (isdefined(data)) {
        thread function_655249500e8f380f(data);
    } else {
        thread function_cb78493f84fd68e3(1);
    }
    params = spawnstruct();
    params.player = data.attacker;
    callback::callback("on_merc_camp_recon_destroyed", params);
    return 0;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eaa
// Size: 0x21b
function function_655249500e8f380f(data) {
    if (!isdefined(self) || istrue(self.isdestroyed)) {
        return;
    }
    self.isdestroyed = 1;
    self.var_d31453e33d3e34ca = 1;
    if (istrue(self.var_8316e01be4051639)) {
        self.var_8316e01be4051639 = 0;
    }
    var_ecb39c9eecbd70ad = 3000;
    contents = trace::create_contents(0, 1, 1, 0, 0, 1, 0, 0, 0);
    castend = self.origin + anglestoup(self.angles) * var_ecb39c9eecbd70ad * -1 + (randomintrange(-500, 500), 0, randomintrange(-500, 500));
    trace = trace::ray_trace(self.origin, castend, [0:self]);
    target_origin = trace["position"] + trace["normal"] * 5;
    maxvelocity = getdvarfloat(@"hash_44e62153228221f", 30.2);
    acceleration = getdvarfloat(@"hash_cdb03278c6d17e78", 13.8);
    var_acdfcbf564707132 = getdvarfloat(@"hash_ed85baf3072c3fff", 17.2);
    var_f9ca3f557a387549 = getdvarfloat(@"hash_3f6d20d42a18063b", 2500);
    distance = distance(target_origin, self.origin);
    falltime = sqrt(2 * distance / acceleration);
    falltime = min(falltime, 2) - 0.2;
    self vehicle_setspeed(maxvelocity, acceleration, var_acdfcbf564707132);
    self setvehgoalpos(target_origin, 0);
    thread helper_drone::function_9bfdff1ee5a47652();
    time = 0;
    while (1) {
        if (distancesquared(self.origin, target_origin) <= var_f9ca3f557a387549 || time >= falltime) {
            function_91af2a9f0b3f524a(data);
            break;
        }
        time = time + level.framedurationseconds;
        waitframe();
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30cc
// Size: 0x86
function function_91af2a9f0b3f524a(data) {
    if (isdefined(data.inflictor) && isdefined(data.inflictor.stuckto)) {
        data.inflictor notify("forceDeath");
    }
    if (isdefined(self.var_75bb433488d96804)) {
        self.owner cameraunlink();
        self.var_75bb433488d96804 delete();
        self.var_75bb433488d96804 = undefined;
    }
    thread function_cb78493f84fd68e3(1);
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3159
// Size: 0x146
function function_cb78493f84fd68e3(var_4fac8b8ce36e09f1, var_d9b2677826930bf7, var_28d4a6f776c18b73, var_bd21744eb1b623fe) {
    self.isdestroyed = 1;
    namespace_3bbb5a98b932c46f::function_1a33bd42949ccbda(self);
    if (isdefined(self.targetmarkergroup)) {
        namespace_81810d22a17382b6::targetmarkergroup_off(self.targetmarkergroup);
        self.targetmarkergroup = undefined;
    }
    if (isdefined(self.minimapid)) {
        namespace_6c8a837ec98fe0b8::returnobjectiveid(self.minimapid);
        self.minimapid = undefined;
    }
    helper_drone::helperdrone_endscramblereffect();
    if (utility::issharedfuncdefined("game", "clearOOB")) {
        [[ utility::getsharedfunc("game", "clearOOB") ]](self, 1);
    }
    if (isent(self)) {
        var_8f7dde4490939b87 = "on";
        if (istrue(self.inwater)) {
            if (self getscriptableparthasstate("explode", "water")) {
                var_8f7dde4490939b87 = "water";
            }
        }
        self setscriptablepartstate("explode", var_8f7dde4490939b87, 0);
    }
    self playsound("radar_drone_explode");
    emp_debuff::clear_emp(1);
    helper_drone::function_24085a0230958938();
    emp_debuff::allow_emp(0);
    self notify("explode");
    wait(0.2);
    function_2a63be2c71898d9a(self.helperdronetype, var_4fac8b8ce36e09f1);
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32a6
// Size: 0x158
function function_2a63be2c71898d9a(var_7c344645cc98e70d, var_4fac8b8ce36e09f1, var_f88fb7783beaa918, var_53385b6be5f6c52f) {
    if (isdefined(self.radar)) {
        self.radar delete();
    }
    self.ispiloted = undefined;
    self.var_8316e01be4051639 = undefined;
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    if (isdefined(self.playersfx)) {
        self.playersfx delete();
    }
    if (isdefined(self.scrambler)) {
        self.scrambler delete();
    }
    if (isdefined(self.enemyobjid)) {
        namespace_6c8a837ec98fe0b8::returnobjectiveid(self.enemyobjid);
    }
    if (isdefined(self.pulsedarts) && self.pulsedarts.size > 0) {
        foreach (var_334e9887a767ef7 in self.pulsedarts) {
            var_334e9887a767ef7 notify("death");
        }
    }
    level.supportdrones = utility::array_remove(level.supportdrones, self);
    namespace_cfae3bfa0fa8d1dd::_deletevehicle(self);
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3405
// Size: 0x6e
function function_38dff9ddaf2e7bd2(var_e6013eac45290cab) {
    if (isdefined(var_e6013eac45290cab)) {
        var_e6013eac45290cab endon("activity_ended");
    }
    if (isdefined(self.vehicle_spawner) && isdefined(self.vehicle_spawner.target)) {
        first_node = utility::getstruct(self.vehicle_spawner.target, "targetname");
        vehicle_paths::vehicle_paths_helicopter(first_node);
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x347a
// Size: 0xe5
function function_c168464cf44d71bd(drone) {
    self endon("disconnect");
    var_2512a36a90854dbc = 2547216;
    while (1) {
        var_d781f30b07e268a8 = 0;
        if (!isdefined(drone) || !namespace_e47104b48662385b::_isalive()) {
            var_d781f30b07e268a8 = 1;
        } else if (istrue(drone.isdestroyed)) {
            var_d781f30b07e268a8 = 1;
        } else {
            var_3bf809e113ae4c12 = distancesquared(drone.origin, self.origin);
            if (var_3bf809e113ae4c12 > var_2512a36a90854dbc) {
                var_d781f30b07e268a8 = 1;
            }
            /#
                if (getdvarint(@"hash_f4f53baf41c812ab", 0)) {
                    level thread namespace_d028276791d9cff6::drawsphere(drone.origin, 1596, 0.5, (1, 0, 0));
                }
            #/
        }
        if (var_d781f30b07e268a8) {
            namespace_5a51aa78ea0b1b9f::stop_scramble(5, 0);
            return;
        }
        wait(0.5);
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3566
// Size: 0x1cd
function function_9760fe79ece4d639() {
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("drop");
    self endon("scramble_super_finished");
    var_4efaf0d84225539 = 1;
    self.var_32efb854df6d5296 = 1536;
    self.var_88f72d2c0421f8b1 = [];
    while (1) {
        /#
            if (getdvarint(@"hash_f4f53baf41c812ab", 0)) {
                level thread namespace_d028276791d9cff6::drawsphere(self.origin, 1536, 0.5, (0, 1, 0));
            }
        #/
        var_3548b8680990ee75 = utility::playersinsphere(self.origin, 1536);
        foreach (var_bd3fbe9af6f9064b in var_3548b8680990ee75) {
            var_780166328e815d00 = 0;
            if (utility::issharedfuncdefined("perk", "hasPerk")) {
                var_780166328e815d00 = var_bd3fbe9af6f9064b [[ utility::getsharedfunc("perk", "hasPerk") ]]("specialty_scrambler_resist");
            }
            if (isdefined(var_bd3fbe9af6f9064b)) {
                if (var_bd3fbe9af6f9064b namespace_e47104b48662385b::_isalive() && !var_780166328e815d00) {
                    if (var_bd3fbe9af6f9064b utility::isusingremote()) {
                        continue;
                    }
                    if (istrue(self.isdestroyed)) {
                        continue;
                    }
                    if (var_bd3fbe9af6f9064b namespace_5a51aa78ea0b1b9f::function_396e8b70241f9f10(5, 0)) {
                        continue;
                    }
                    var_bd3fbe9af6f9064b namespace_5a51aa78ea0b1b9f::play_scramble(5, 0);
                    var_bd3fbe9af6f9064b thread function_c168464cf44d71bd(self);
                } else if (isdefined(var_bd3fbe9af6f9064b.scrambledby) && var_bd3fbe9af6f9064b.scrambledby.size > 0 && array_contains(var_bd3fbe9af6f9064b.scrambledby, self)) {
                    var_bd3fbe9af6f9064b notify("scramble_off" + self getentitynumber());
                }
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x373a
// Size: 0x6
function function_608f03a0f2daa24f() {
    /#
    #/
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3747
// Size: 0xff
function function_9ba09e46a2d4da1a(var_333f9a5c25ef5bcb, var_962d421f44aea5c4, var_870887331bb48f13, var_38ea163268665f20) {
    level endon("game_ended");
    self endon("activity_ended");
    var_962d421f44aea5c4 = utility::function_53c4c53197386572(var_962d421f44aea5c4, 384);
    var_870887331bb48f13 = utility::function_53c4c53197386572(var_870887331bb48f13, 3);
    var_38ea163268665f20 = utility::function_53c4c53197386572(var_38ea163268665f20, 96);
    var_240aac519c686e9a = function_cdd9002a084e6c1e(var_333f9a5c25ef5bcb);
    var_983e69b99e987ea9 = function_70cd8263e1bec0a2(var_962d421f44aea5c4, var_870887331bb48f13, var_38ea163268665f20, "inner", var_240aac519c686e9a, var_333f9a5c25ef5bcb);
    if (var_983e69b99e987ea9.size > 0) {
        foreach (var_6a3f4ad90373bd65 in var_983e69b99e987ea9) {
            level thread function_a23d210f99139c27(var_240aac519c686e9a, var_333f9a5c25ef5bcb + var_6a3f4ad90373bd65);
            wait(randomfloatrange(0.5, 1.5));
        }
    } else {
        iprintln("CLUSTER BOMB cancelled - could not find good offset points");
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x384d
// Size: 0xcd
function function_cdd9002a084e6c1e(var_333f9a5c25ef5bcb) {
    var_27cbebbadd0ca7bf = 0;
    var_240aac519c686e9a = undefined;
    var_5fa1e1697a302583 = namespace_2b1145f62aa835b8::function_b00fe2fecfa420d0();
    heightoffset = 10000;
    if (isdefined(var_5fa1e1697a302583)) {
        heightoffset = var_5fa1e1697a302583.origin[2] + 4000;
    }
    var_9806e3c29658cc34 = var_333f9a5c25ef5bcb + (0, 0, heightoffset);
    while (var_27cbebbadd0ca7bf < 360) {
        forwardvector = anglestoforward((0, var_27cbebbadd0ca7bf, 0));
        var_240aac519c686e9a = var_9806e3c29658cc34 - forwardvector * 3000;
        trace = trace::ray_trace(var_240aac519c686e9a, var_333f9a5c25ef5bcb);
        if (trace["fraction"] > 0.9) {
            break;
        }
        var_27cbebbadd0ca7bf = var_27cbebbadd0ca7bf + 45;
        wait(0.1);
    }
    return var_240aac519c686e9a;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3922
// Size: 0x4f
function function_a23d210f99139c27(var_240aac519c686e9a, var_c1525227d6dba863) {
    var_15a5fc549c9adc1d = namespace_2b1145f62aa835b8::function_300f8bd96a4461ff(makeweapon("hellstorm_cluster_bomb_proj_mp"), var_240aac519c686e9a, var_c1525227d6dba863);
    var_15a5fc549c9adc1d waittill("death");
    namespace_2b1145f62aa835b8::function_7a0d2d9d94d820ae(var_c1525227d6dba863, 1);
    playsoundatpos(var_c1525227d6dba863, "iw9_cruise_missile_exp");
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3978
// Size: 0x1c5
function function_70cd8263e1bec0a2(n_radius, var_b1d6b2204994be96, var_665830328a562bb0, var_e3411605e0481be9, var_22ca4a7ff2116e86, v_center) {
    level endon("game_ended");
    self endon("activity_ended");
    var_48741615b8bd5e9d = [];
    var_e3411605e0481be9 = utility::function_53c4c53197386572(var_e3411605e0481be9, "random");
    var_22ca4a7ff2116e86 = utility::function_53c4c53197386572(var_22ca4a7ff2116e86, 0);
    var_43828ce9347dba61 = undefined;
    if (isdefined(var_665830328a562bb0)) {
        var_43828ce9347dba61 = var_665830328a562bb0 * var_665830328a562bb0;
    }
    maxtime = var_b1d6b2204994be96 * 0.5;
    starttime = gettime();
    var_9e8fc8654556c662 = undefined;
    var_9e8fc9654556c895 = undefined;
    while (var_48741615b8bd5e9d.size < var_b1d6b2204994be96) {
        elapsedtime = gettime() - starttime;
        if (utility::function_c89ed1840c8d0f0f(elapsedtime) > maxtime) {
            break;
        }
        offset_x = function_c2211ba6e4c34e44(n_radius, var_e3411605e0481be9, var_9e8fc8654556c662);
        offset_y = function_c2211ba6e4c34e44(n_radius, var_e3411605e0481be9, var_9e8fc9654556c895);
        if (istrue(var_9e8fc8654556c662) && istrue(var_9e8fc9654556c895)) {
            var_9e8fc8654556c662 = undefined;
            var_9e8fc9654556c895 = undefined;
        } else if (utility::cointoss()) {
            var_9e8fc8654556c662 = 1;
        } else {
            var_9e8fc9654556c895 = 1;
        }
        var_f797ad5fe71035ea = (offset_x, offset_y, 0);
        var_e9a0f10796b5bdee = 1;
        if (isdefined(var_43828ce9347dba61) && var_48741615b8bd5e9d.size > 0) {
            var_e9a0f10796b5bdee = function_92baead0f0cab344(var_f797ad5fe71035ea, var_48741615b8bd5e9d, var_43828ce9347dba61);
        }
        if (isvector(var_22ca4a7ff2116e86)) {
            var_238356dafb4a6602 = var_22ca4a7ff2116e86;
            var_e9a0f10796b5bdee = function_3f5cad871311cee1(var_f797ad5fe71035ea + v_center, var_238356dafb4a6602);
            waitframe();
        } else if (istrue(var_22ca4a7ff2116e86)) {
            var_e9a0f10796b5bdee = function_3f5cad871311cee1(var_f797ad5fe71035ea + v_center);
            waitframe();
        }
        if (istrue(var_e9a0f10796b5bdee)) {
            var_48741615b8bd5e9d[var_48741615b8bd5e9d.size] = var_f797ad5fe71035ea;
        }
        waitframe();
    }
    return var_48741615b8bd5e9d;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b45
// Size: 0xa9
function function_c2211ba6e4c34e44(n_radius, var_e3411605e0481be9, var_862e1b1897ab0185) {
    if (var_e3411605e0481be9 == "inner") {
        rand = randomfloatrange(0, 1);
        dist = squared(rand) * n_radius;
    } else if (var_e3411605e0481be9 == "outer") {
        rand = randomfloatrange(0, 1);
        var_efbfa53ebb76f919 = squared(rand) * n_radius;
        dist = n_radius - var_efbfa53ebb76f919;
    } else {
        dist = randomfloatrange(0, n_radius);
    }
    if (istrue(var_862e1b1897ab0185)) {
        dist = dist * -1;
    } else {
        dist = utility::ter_op(utility::cointoss(), dist * -1, dist);
    }
    return dist;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bf6
// Size: 0x72
function function_92baead0f0cab344(var_f797ad5fe71035ea, var_48741615b8bd5e9d, var_43828ce9347dba61) {
    foreach (v_offset in var_48741615b8bd5e9d) {
        if (utility::distance_2d_squared(v_offset, var_f797ad5fe71035ea) > var_43828ce9347dba61) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c70
// Size: 0x51
function function_3f5cad871311cee1(var_f797ad5fe71035ea, var_238356dafb4a6602) {
    if (!isdefined(var_238356dafb4a6602)) {
        var_238356dafb4a6602 = var_f797ad5fe71035ea + (0, 0, 6000);
    }
    trace = trace::ray_trace(var_238356dafb4a6602, var_f797ad5fe71035ea);
    if (trace["fraction"] > 0.9) {
        return 1;
    }
    return 0;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cc9
// Size: 0x6
function function_b5a086a266d3796e() {
    /#
    #/
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd6
// Size: 0x1ad
function function_4a9c0f41ba33e74d(var_bf1435b0e035ceab, var_63b4846a36f20c84, var_27bcf7d12b103ac3, var_299355110e3b3670, yaw) {
    level endon("game_ended");
    self endon("activity_ended");
    var_63b4846a36f20c84 = utility::function_53c4c53197386572(var_63b4846a36f20c84, "precision_airstrike");
    var_299355110e3b3670 = utility::function_53c4c53197386572(var_299355110e3b3670, 1);
    if (var_63b4846a36f20c84 == "quest_airstrike") {
        var_63b4846a36f20c84 = "fuel_airstrike";
    } else if (var_63b4846a36f20c84 != "multi_airstrike" || !isdefined(var_27bcf7d12b103ac3)) {
        var_27bcf7d12b103ac3 = 2;
    }
    streakinfo = spawnstruct();
    streakinfo.streakname = var_63b4846a36f20c84;
    if (!isdefined(streakinfo.shots_fired)) {
        streakinfo.shots_fired = 0;
    }
    level.airstrikesettings[streakinfo.streakname].modelbase = "veh8_mil_air_alfa10_east";
    streakinfo.owner = level.players[0];
    animname = level.scr_anim[streakinfo.streakname]["airstrike_flyby"];
    if (utility::issharedfuncdefined("killstreak", "dangerNotifyPlayersInRange")) {
        streakinfo.owner [[ utility::getsharedfunc("killstreak", "dangerNotifyPlayersInRange") ]](var_bf1435b0e035ceab, 1000, streakinfo.streakname);
    }
    /#
        iprintlnbold("plant");
    #/
    for (i = 0; i < var_27bcf7d12b103ac3; i++) {
        level thread function_dcd01bce8a255040(streakinfo.owner, var_bf1435b0e035ceab, yaw, undefined, streakinfo, animname, undefined, var_299355110e3b3670);
        wait(randomfloatrange(2, 4));
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e8a
// Size: 0x1e4
function function_dcd01bce8a255040(owner, var_6e7c70b904418daa, yaw, var_97195d51c4c2b14e, streakinfo, animname, airstrikeid, var_299355110e3b3670) {
    var_361663d437db22f5 = 0;
    var_5fa1e1697a302583 = namespace_8319cdbe938cd234::getkillstreakairstrikeheightent();
    planehalfdistance = 24000;
    var_23122e7b902f2ea9 = 6500;
    planeflyheight = 2500;
    var_361663d437db22f5 = 1500;
    if (isdefined(var_5fa1e1697a302583)) {
        planeflyheight = var_5fa1e1697a302583.origin[2];
    }
    /#
        var_5ceb15b939485b52 = getdvarint(@"hash_698613e6c8c52243", 0);
        planeflyheight = planeflyheight + var_5ceb15b939485b52;
    #/
    var_361663d437db22f5 = airstrike::getexplodedistance(planeflyheight);
    direction = undefined;
    var_505331ad630bbc6b = undefined;
    if (isdefined(yaw)) {
        direction = (0, yaw, 0);
    } else {
        direction = airstrike::callstrike_findoptimaldirection(owner, var_6e7c70b904418daa, planeflyheight, planehalfdistance);
        var_505331ad630bbc6b = 1;
    }
    flightpath = airstrike::getflightpath(var_6e7c70b904418daa, direction, planehalfdistance, var_5fa1e1697a302583, planeflyheight, var_23122e7b902f2ea9, var_361663d437db22f5, streakinfo.streakname, var_505331ad630bbc6b);
    if (streakinfo.streakname == "precision_airstrike") {
        for (i = 0; i < 2; i++) {
            planeflyheight = planeflyheight + randomintrange(200, 300);
            level thread function_9c4eb1316ad8cdd9(var_6e7c70b904418daa, flightpath["startPoint"], flightpath["endPoint"], planeflyheight, var_97195d51c4c2b14e, streakinfo, animname, owner, airstrikeid, var_299355110e3b3670);
            wait(3);
        }
    } else {
        if (streakinfo.streakname == "multi_airstrike") {
            planeflyheight = planeflyheight + randomintrange(200, 300);
        }
        level thread function_9c4eb1316ad8cdd9(var_6e7c70b904418daa, flightpath["startPoint"], flightpath["endPoint"], planeflyheight, var_97195d51c4c2b14e, streakinfo, animname, owner, airstrikeid, var_299355110e3b3670);
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4075
// Size: 0x6c5
function function_9c4eb1316ad8cdd9(targetsite, var_6d29e82378e59e76, var_98255165b50d8173, planeflyheight, var_97195d51c4c2b14e, streakinfo, animname, owner, airstrikeid, var_299355110e3b3670) {
    if (!isdefined(owner)) {
        return;
    }
    owner endon("disconnect");
    level endon("game_ended");
    config = level.airstrikesettings[streakinfo.streakname];
    var_4c4796c182975686 = getanimlength(animname);
    var_7b00721e9d1ef2a0 = utility::get_notetrack_time(animname, "attack");
    var_3a69e5fc82079ce3 = targetsite + (0, 0, planeflyheight);
    var_7789cda8c1e3128e = vectortoangles(var_98255165b50d8173 - var_6d29e82378e59e76);
    planemodel = config.modelbase;
    if (namespace_e47104b48662385b::getplayersuperfaction(owner) && isdefined(config.modelbasealt)) {
        planemodel = config.modelbasealt;
    }
    plane = spawn("script_model", var_3a69e5fc82079ce3);
    plane setmodel(planemodel);
    plane.angles = var_7789cda8c1e3128e;
    plane.flightdir = anglestoforward(var_7789cda8c1e3128e);
    plane.flightheight = planeflyheight;
    plane.owner = owner;
    var_94ef028c9129ecf9 = istrue(level.isx1ops) && isdefined(level.x1ops) && level.x1ops == 6;
    plane.team = "team_hundred_ninety";
    plane.lifeid = streakinfo.lifeid;
    plane.streakinfo = streakinfo;
    plane.airstrikeid = airstrikeid;
    plane setotherent(owner);
    plane scriptmoveroutline();
    plane scriptmoverthermal();
    plane scriptmoverplane();
    if (utility::issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        plane [[ utility::getsharedfunc("killstreak", "addToActiveKillstreakList") ]](streakinfo.streakname, "Killstreak_Air", owner, 0, 1, 100);
    }
    if (utility::issharedfuncdefined("br", "challengeEvaluator")) {
        var_cd37ce775909957b = spawnstruct();
        var_cd37ce775909957b.plane = plane;
        var_cd37ce775909957b.targetsite = targetsite;
        owner [[ utility::getsharedfunc("br", "challengeEvaluator") ]]("br_mastery_pointBlank_airstrike", var_cd37ce775909957b);
    }
    var_9604a2586b0a302c = "icon_minimap_airstrike";
    if (streakinfo.streakname == "fuel_airstrike") {
        var_9604a2586b0a302c = "icon_minimap_fuelairstrike";
    }
    if (utility::issharedfuncdefined("game", "createObjective")) {
        plane.minimapid = plane [[ utility::getsharedfunc("game", "createObjective") ]](var_9604a2586b0a302c, plane.team, undefined, 1, 1);
    }
    var_fafbda0eba9c0aab = var_7b00721e9d1ef2a0 - 0.75;
    var_3a20f9101e50025f = 0.05;
    var_3a020e101e2ddead = var_fafbda0eba9c0aab;
    var_7c39d972e849c204 = 8.596;
    if (streakinfo.streakname == "fuel_airstrike") {
        var_fafbda0eba9c0aab = var_7b00721e9d1ef2a0 + 1;
    }
    var_e4d26f59db05025a = config.var_c80e3ea2a37a7182;
    if (!isdefined(var_e4d26f59db05025a)) {
        var_e4d26f59db05025a = "ks_airstrike_mp";
    }
    plane thread airstrike::airstrike_delayplayscriptable(0.05);
    level thread airstrike::airstrike_playplaneattackfx(plane, var_fafbda0eba9c0aab, streakinfo);
    level thread airstrike::airstrike_playflyfx(plane, var_e4d26f59db05025a, var_6d29e82378e59e76, anglestoforward(var_7789cda8c1e3128e), var_3a20f9101e50025f, var_3a020e101e2ddead, var_7c39d972e849c204, var_4c4796c182975686, streakinfo);
    plane.bulletpoint = spawn("script_model", plane.origin);
    var_9b269e46fcfe3bdd = "ks_airstrike_target_mp";
    if (istrue(var_299355110e3b3670)) {
        var_9b269e46fcfe3bdd = "ks_airstrike_target_ob_ai";
    }
    plane.bulletpoint setmodel(var_9b269e46fcfe3bdd);
    plane.bulletpoint setentityowner(owner);
    plane.bulletpoint.weapon_name = "artillery_mp";
    plane.bulletpoint.streakinfo = streakinfo;
    plane.bulletpoint.angles = plane.angles;
    plane.bulletpoint dontinterpolate();
    plane.animname = streakinfo.streakname;
    plane animation::setanimtree();
    plane.scenenode = spawn("script_model", var_3a69e5fc82079ce3);
    plane.scenenode.angles = plane.angles;
    plane.scenenode setmodel("tag_origin");
    /#
        var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
        if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
            plane thread airstrike::function_fc41f67ef33c00b0(var_6d29e82378e59e76, var_98255165b50d8173, (1, 1, 1), 20);
            plane thread airstrike::function_aca0ec4cab6e6319(planeflyheight, targetsite);
        }
    #/
    if (streakinfo.streakname == "precision_airstrike" || streakinfo.streakname == "multi_airstrike") {
        level thread airstrike::callstrike_precisionbulleteffect(plane, var_fafbda0eba9c0aab, var_4c4796c182975686, targetsite, owner);
    } else if (streakinfo.streakname == "fuel_airstrike") {
        level thread function_7a04fd48da58db97(plane, var_fafbda0eba9c0aab, var_4c4796c182975686, targetsite, owner);
    }
    plane.scenenode animation::anim_single_solo(plane, "airstrike_flyby");
    if (isdefined(plane.minimapid)) {
        if (utility::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ utility::getsharedfunc("game", "returnObjectiveID") ]](plane.minimapid);
        }
    }
    plane notify("delete");
    if (isdefined(plane.turrettarget)) {
        plane.turrettarget delete();
    }
    if (isdefined(plane.bulletpoint)) {
        plane.bulletpoint delete();
        if (isdefined(plane.bulletpoint.killcament)) {
            plane.bulletpoint.killcament delete();
        }
    }
    if (isdefined(plane.scenenode)) {
        plane.scenenode delete();
    }
    if (isdefined(plane)) {
        plane delete();
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4741
// Size: 0x50d
function function_7a04fd48da58db97(plane, launchtime, var_1f57bfcfb8ae4433, damagepos, owner) {
    plane endon("death");
    planedir = plane.flightdir;
    var_205f7a849fbb6b3d = damagepos + (0, 0, plane.flightheight + 750);
    var_7440286a44028fba = var_205f7a849fbb6b3d - planedir * 15000;
    var_29893615de503cf5 = var_205f7a849fbb6b3d - planedir * 1000;
    var_315162f2d4f72593 = var_205f7a849fbb6b3d - planedir * 500;
    var_f6f6dedd96f2c531 = istrue(level.isx1ops) && isdefined(level.x1ops) && level.x1ops == 6;
    killcament = undefined;
    if (!var_f6f6dedd96f2c531) {
        killcament = spawn("script_model", var_7440286a44028fba);
        killcament thread airstrike::airstrike_killcammove(launchtime - 3, var_29893615de503cf5, var_315162f2d4f72593);
    }
    hostmigration::hostmigration_waitlongdurationwithpause(launchtime);
    if (!isdefined(owner)) {
        return;
    }
    if (utility::issharedfuncdefined("airstrike", "addSpawnDangerZone")) {
        [[ utility::getsharedfunc("airstrike", "addSpawnDangerZone") ]](damagepos, 650, 650, owner.team, var_1f57bfcfb8ae4433, owner, 1);
    }
    /#
        var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
        if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
            sphere(damagepos, 100, (1, 1, 1), 0, 500);
        }
    #/
    var_785f5b52f245a2b6 = damagepos + (0, 0, 2500);
    var_bd794eef2b14c4b3 = damagepos - (0, 0, 10000);
    var_3b8c153f4d5d7f16 = trace::ray_trace(var_785f5b52f245a2b6, var_bd794eef2b14c4b3, undefined, trace::create_contents(0, 1, 0, 1, 0, 1, 0));
    var_604b31efa39e3f47 = var_3b8c153f4d5d7f16["position"];
    var_2c0b75362bf153c5 = var_3b8c153f4d5d7f16["normal"];
    var_4e79f74d11612f28 = var_604b31efa39e3f47 + var_2c0b75362bf153c5 * 10;
    /#
        var_671b9cb2b0e5d795 = getdvarint(@"hash_920f0586653a26d4", 0);
        if (isdefined(var_671b9cb2b0e5d795) && var_671b9cb2b0e5d795) {
            line(var_785f5b52f245a2b6, var_4e79f74d11612f28, (1, 0, 0), 1, 0, 1000);
            line(var_4e79f74d11612f28, var_4e79f74d11612f28 + var_2c0b75362bf153c5 * 50, (0, 1, 0), 1, 0, 500);
            sphere(var_4e79f74d11612f28, 50, (1, 0, 0), 0, 500);
        }
    #/
    var_c6188da3ad302049 = var_4e79f74d11612f28 + (0, 0, 800);
    var_6033a7638fe1342f = spawn("script_model", var_c6188da3ad302049);
    var_6033a7638fe1342f.angles = plane.angles;
    var_6033a7638fe1342f.streakinfo = plane.streakinfo;
    var_6033a7638fe1342f setmodel("ks_fuelstrike_mp");
    var_6033a7638fe1342f setentityowner(owner);
    if (!var_f6f6dedd96f2c531) {
        var_6033a7638fe1342f.killcament = killcament;
    }
    var_f9f79f4923d00e6e = spawn("script_model", var_4e79f74d11612f28);
    var_f9f79f4923d00e6e.angles = plane.angles;
    var_f9f79f4923d00e6e.streakinfo = plane.streakinfo;
    var_f9f79f4923d00e6e setmodel("ks_fuelstrike_mp");
    var_f9f79f4923d00e6e setentityowner(owner);
    if (!var_f6f6dedd96f2c531) {
        var_f9f79f4923d00e6e.killcament = killcament;
    }
    var_f9f79f4923d00e6e setscriptablepartstate("releaseVFX", "on", 0);
    var_6033a7638fe1342f setscriptablepartstate("releaseSFX", "on", 0);
    wait(1.3);
    var_f9f79f4923d00e6e setscriptablepartstate("explode", "on", 0);
    var_b9d5783a4f34efbc = [0:var_6033a7638fe1342f, 1:var_f9f79f4923d00e6e];
    var_33f031d062a32623 = trace::create_contents(0, 1, 1, 1, 0, 1, 1, 1, 0);
    var_3bd841437dfaa8d7 = airstrike::function_15d7e8b275b8b57b(var_4e79f74d11612f28, 750, owner, var_c6188da3ad302049, var_b9d5783a4f34efbc, var_33f031d062a32623);
    var_a7340ccd3ad168f9 = makeweapon("fuelstrike_proj_mp");
    var_f7f7bac8e05e89d1 = 0.8;
    plane thread airstrike::function_e5a6aaaa22532637(var_6033a7638fe1342f, var_f9f79f4923d00e6e, var_f7f7bac8e05e89d1);
    level notify("airstrike_explode");
    /#
        owner thread airstrike::function_9018ff93eb75a769(var_f7f7bac8e05e89d1, var_f9f79f4923d00e6e);
    #/
    foreach (enemy in var_3bd841437dfaa8d7) {
        enemy thread airstrike::function_3c8dfe97ac9ad7c7(owner, var_f7f7bac8e05e89d1, var_6033a7638fe1342f, var_f9f79f4923d00e6e, var_a7340ccd3ad168f9);
        enemy thread function_ddb0e63aad9c9a77(90, var_f9f79f4923d00e6e.origin, owner, var_f9f79f4923d00e6e, "MOD_EXPLOSIVE", var_a7340ccd3ad168f9, var_f7f7bac8e05e89d1);
    }
    level thread airstrike::delaydeletefxents(var_6033a7638fe1342f, var_f9f79f4923d00e6e);
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c55
// Size: 0x98
function function_ddb0e63aad9c9a77(damageamount, damageorigin, attacker, inflictor, meansofdeath, weapon, var_f7f7bac8e05e89d1) {
    self endon("death_or_disconnect");
    if (isdefined(var_f7f7bac8e05e89d1) && var_f7f7bac8e05e89d1 > 0) {
        wait(var_f7f7bac8e05e89d1);
    }
    if (isdefined(level.quest_airstrike)) {
        if (isdefined(self)) {
            namespace_f6b8dbdf5c7eed7::function_f632348cbb773537(level.var_70ec6a3c1cc881e1, self);
        }
        if (isdefined(self)) {
            self dodamage(damageamount, damageorigin, self, inflictor, meansofdeath, weapon);
        }
    } else {
        self dodamage(damageamount, damageorigin, attacker, inflictor, meansofdeath, weapon);
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cf4
// Size: 0x6
function function_57871434ec204550() {
    /#
    #/
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d01
// Size: 0x3c
function function_e9158c9e8c391f25(var_e81f8493680c60b7, var_76d252d441dca6eb) {
    var_59379c8437e3e7cd = utility::getstructarray(var_e81f8493680c60b7, "targetname");
    if (var_59379c8437e3e7cd.size == 0) {
        return var_59379c8437e3e7cd;
    }
    return function_cf24aec050c0e5f8(var_59379c8437e3e7cd, var_76d252d441dca6eb);
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d45
// Size: 0x17b
function function_cf24aec050c0e5f8(var_59379c8437e3e7cd, var_76d252d441dca6eb) {
    if (isdefined(var_76d252d441dca6eb)) {
        var_76d252d441dca6eb = int(min(var_76d252d441dca6eb, var_59379c8437e3e7cd.size));
        if (var_76d252d441dca6eb < var_59379c8437e3e7cd.size) {
            var_59379c8437e3e7cd = utility::array_randomize(var_59379c8437e3e7cd);
            var_59379c8437e3e7cd = utility::array_slice(var_59379c8437e3e7cd, 0, var_76d252d441dca6eb);
        }
    }
    var_4a21f2ea02343335 = 5;
    for (index = 0; index < var_59379c8437e3e7cd.size; index++) {
        if (index % var_4a21f2ea02343335 == 0) {
            waitframe();
        }
        cover = var_59379c8437e3e7cd[index];
        if (isdefined(cover.target)) {
            scriptable = getentitylessscriptablearray(cover.target, "targetname");
            if (isdefined(scriptable[0])) {
                cover.scriptable = scriptable[0];
                cover.scriptable setscriptablepartstate("state", "visible");
            }
            var_5a289139fcc24145 = 1;
            if (isdefined(cover.script_parameters) && cover.script_parameters == "no_nodes") {
                var_5a289139fcc24145 = 0;
            }
            if (var_5a289139fcc24145) {
                cover.a_nodes = getnodearray(cover.target, "targetname");
                waitframe();
                if (isarray(cover.a_nodes) && cover.a_nodes.size > 0) {
                    cover thread function_15dfa2c4da409db();
                } else {
                    cover thread function_3c71b9114c8f5840();
                }
            }
        }
    }
    return var_59379c8437e3e7cd;
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ec8
// Size: 0x58
function private function_15dfa2c4da409db() {
    waitframe();
    foreach (var_386c209c4be9e91 in self.a_nodes) {
        var_386c209c4be9e91 connectnode();
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f27
// Size: 0x147
function private function_3c71b9114c8f5840() {
    waitframe();
    self.a_nodes = [];
    var_b1b5e6b1e4e92cb6 = [];
    if (isdefined(self.script_label)) {
        var_b1b5e6b1e4e92cb6 = function_d686fcec0db715b(self.script_label);
    } else if (isdefined(self.scriptable)) {
        var_b1b5e6b1e4e92cb6 = function_d686fcec0db715b(self.scriptable.model);
    }
    foreach (data in var_b1b5e6b1e4e92cb6) {
        self.angles = utility::function_53c4c53197386572(self.angles, (0, 0, 0));
        var_5b5833a876268d06 = coordtransform(data[0], self.origin, self.angles);
        var_5f9d612a4f14589c = self.angles + data[1];
        nd = spawncovernode(var_5b5833a876268d06, var_5f9d612a4f14589c, data[2]);
        if (isdefined(nd)) {
            nd connectnode();
            self.a_nodes = utility::function_6d6af8144a5131f1(self.a_nodes, nd);
        }
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5075
// Size: 0x128
function function_486b0f579d5b6dae(cover) {
    var_5e4e328292277d18 = [];
    if (isstring(cover)) {
        var_5e4e328292277d18 = utility::getstructarray(cover, "targetname");
    }
    if (isarray(cover)) {
        var_5e4e328292277d18 = cover;
    } else {
        return;
    }
    foreach (struct in var_5e4e328292277d18) {
        if (isdefined(struct.scriptable)) {
            struct.scriptable setscriptablepartstate("state", "hidden");
        }
        if (isdefined(struct.a_nodes)) {
            foreach (nd in struct.a_nodes) {
                nd disconnectnode();
                if (nd function_4e6288d290958f94()) {
                    despawncovernode(nd);
                }
            }
        }
    }
}

// Namespace namespace_17b45e55cf344cda/namespace_64135de19550f047
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x51a4
// Size: 0x1941
function private function_d686fcec0db715b(str_model) {
    var_b1b5e6b1e4e92cb6 = [];
    switch (str_model) {
    case #"hash_c7e0aaf6e7799aea":
        var_b1b5e6b1e4e92cb6[0] = [0:(-20, 28, 16), 1:(0, 270, 0), 2:"Cover Crouch"];
        var_b1b5e6b1e4e92cb6[1] = [0:(20, 28, 16), 1:(0, 270, 0), 2:"Cover Crouch"];
        var_b1b5e6b1e4e92cb6[2] = [0:(20, -28, 16), 1:(0, 90, 0), 2:"Cover Crouch"];
        var_b1b5e6b1e4e92cb6[3] = [0:(-20, -28, 16), 1:(0, 90, 0), 2:"Cover Crouch"];
        break;
    case #"hash_3e533e8173a68e96":
        var_b1b5e6b1e4e92cb6[0] = [0:(-34, 0, 16), 1:(0, 0, 0), 2:"Cover Crouch"];
        var_b1b5e6b1e4e92cb6[1] = [0:(0, 34, 16), 1:(0, 270, 0), 2:"Cover Crouch"];
        var_b1b5e6b1e4e92cb6[2] = [0:(34, 0, 16), 1:(0, 180, 0), 2:"Cover Crouch"];
        var_b1b5e6b1e4e92cb6[3] = [0:(0, -34, 16), 1:(0, 90, 0), 2:"Cover Crouch"];
        break;
    case #"hash_9e5db913883995d":
        var_b1b5e6b1e4e92cb6[0] = [0:(16, 46, 16), 1:(0, 270, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[1] = [0:(46, 16, 16), 1:(0, 180, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[2] = [0:(-46, 16, 16), 1:(0, 360, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[3] = [0:(46, -16, 16), 1:(0, 180, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[4] = [0:(-16, 46, 16), 1:(0, 360, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[5] = [0:(-46, -16, 16), 1:(0, 360, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[6] = [0:(16, -46, 16), 1:(0, 90, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[7] = [0:(-16, -46, 16), 1:(0, 90, 0), 2:"Cover Left"];
        break;
    case #"hash_2051917927d8a8fe":
        var_b1b5e6b1e4e92cb6[0] = [0:(-40, 0, 16), 1:(0, 360, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[1] = [0:(40, 0, 16), 1:(0, 180, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[2] = [0:(0, 42, 16), 1:(0, 270, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[3] = [0:(0, -44, 16), 1:(0, 90, 0), 2:"Cover Stand"];
        break;
    case #"hash_9f8ac821a3fbb851":
        var_b1b5e6b1e4e92cb6[0] = [0:(16, 48, 16), 1:(0, 270, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[1] = [0:(48, 16, 16), 1:(0, 180, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[2] = [0:(-48, 16, 16), 1:(0, 360, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[3] = [0:(48, -16, 16), 1:(0, 180, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[4] = [0:(-16, 48, 16), 1:(0, 270, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[5] = [0:(-48, -16, 16), 1:(0, 360, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[6] = [0:(16, -48, 16), 1:(0, 90, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[7] = [0:(-16, -48, 16), 1:(0, 90, 0), 2:"Cover Left"];
        break;
    case #"hash_385896730ddac9b":
        var_b1b5e6b1e4e92cb6[0] = [0:(-20, 82, 16), 1:(0, 270, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[1] = [0:(52, 48, 16), 1:(0, 180, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[2] = [0:(-52, 8, 16), 1:(0, 0, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[3] = [0:(20, -86, 16), 1:(0, 90, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[4] = [0:(18, 82, 16), 1:(0, 270, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[5] = [0:(-52, -52, 16), 1:(0, 0, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[6] = [0:(52, -52, 16), 1:(0, 180, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[7] = [0:(-18, -86, 16), 1:(0, 90, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[8] = [0:(52, -8, 16), 1:(0, 180, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[9] = [0:(-52, 48, 16), 1:(0, 0, 0), 2:"Cover Left"];
        break;
    case #"hash_671b50e68da4e3dc":
        var_b1b5e6b1e4e92cb6[0] = [0:(46, -54, 16), 1:(0, 90, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[1] = [0:(-2, -52, 16), 1:(0, 90, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[2] = [0:(-46, -54, 16), 1:(0, 90, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[3] = [0:(-78, -20, 16), 1:(0, 360, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[4] = [0:(-78, 20, 16), 1:(0, 360, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[5] = [0:(-46, 54, 16), 1:(0, 270, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[6] = [0:(-2, 52, 16), 1:(0, 270, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[7] = [0:(46, 54, 16), 1:(0, 270, 0), 2:"Cover Left"];
        break;
    case #"hash_35b74b199651346c":
        var_b1b5e6b1e4e92cb6[0] = [0:(-50, 58, 16), 1:(0, 0, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[1] = [0:(-50, -58, 16), 1:(0, 0, 0), 2:"Cover Right"];
        break;
    case #"hash_44f7243fb4c2f7d6":
        var_b1b5e6b1e4e92cb6[0] = [0:(0, -22, 16), 1:(0, 90, 0), 2:"Cover Crouch"];
        var_b1b5e6b1e4e92cb6[1] = [0:(0, 22, 16), 1:(0, 270, 0), 2:"Cover Crouch"];
        break;
    case #"hash_7d2b4f6c6cb085ac":
        var_b1b5e6b1e4e92cb6[0] = [0:(50, 0, 16), 1:(0, 180, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[1] = [0:(0, -44, 16), 1:(0, 90, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[2] = [0:(-50, 0, 16), 1:(0, 0, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[3] = [0:(0, 46, 16), 1:(0, 270, 0), 2:"Cover Stand"];
        break;
    case #"hash_df78bf717608a1dd":
        var_b1b5e6b1e4e92cb6[0] = [0:(44, -36, 16), 1:(0, 180, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[1] = [0:(44, 28, 16), 1:(0, 180, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[2] = [0:(14, 60, 16), 1:(0, 270, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[3] = [0:(-10, 60, 16), 1:(0, 270, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[4] = [0:(-40, 28, 16), 1:(0, 0, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[5] = [0:(-40, -36, 16), 1:(0, 0, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[6] = [0:(-10, -68, 16), 1:(0, 90, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[7] = [0:(14, -68, 16), 1:(0, 90, 0), 2:"Cover Right"];
        break;
    case #"hash_d7c559d4de79bc25":
        var_b1b5e6b1e4e92cb6[0] = [0:(-34, 16, 16), 1:(0, 0, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[1] = [0:(-34, -18, 16), 1:(0, 0, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[2] = [0:(0, -50, 16), 1:(0, 90, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[3] = [0:(34, -18, 16), 1:(0, 180, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[4] = [0:(34, 16, 16), 1:(0, 180, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[5] = [0:(0, 48, 16), 1:(0, 270, 0), 2:"Cover Stand"];
        break;
    case #"hash_2dbfafe10b0dc6fb":
        var_b1b5e6b1e4e92cb6[0] = [0:(-86, 18, 16), 1:(0, 0, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[1] = [0:(-86, -16, 16), 1:(0, 0, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[2] = [0:(-54, -48, 16), 1:(0, 90, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[3] = [0:(10, -32, 16), 1:(0, 90, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[4] = [0:(42, -46, 16), 1:(0, 90, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[5] = [0:(74, -14, 16), 1:(0, 180, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[6] = [0:(72, 14, 16), 1:(0, 180, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[7] = [0:(42, 46, 16), 1:(0, 270, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[8] = [0:(10, 34, 16), 1:(0, 270, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[9] = [0:(-54, 50, 16), 1:(0, 270, 0), 2:"Cover Right"];
        break;
    case #"hash_72a2a68ca2987825":
        var_b1b5e6b1e4e92cb6[0] = [0:(-42, 36, 16), 1:(0, 38, 0), 2:"Cover Crouch"];
        var_b1b5e6b1e4e92cb6[1] = [0:(-26, 2, 16), 1:(0, 0, 0), 2:"Cover Crouch"];
        var_b1b5e6b1e4e92cb6[2] = [0:(-40, -36, 16), 1:(0, 308, 0), 2:"Cover Crouch"];
        var_b1b5e6b1e4e92cb6[3] = [0:(-2, -66, 16), 1:(0, 136, 0), 2:"Cover Crouch"];
        var_b1b5e6b1e4e92cb6[4] = [0:(24, 2, 16), 1:(0, 180, 0), 2:"Cover Crouch"];
        var_b1b5e6b1e4e92cb6[5] = [0:(6, 62, 16), 1:(0, 215, 0), 2:"Cover Crouch"];
        break;
    case #"hash_8db5a88b741a577e":
        var_b1b5e6b1e4e92cb6[0] = [0:(-44, 0, 16), 1:(0, 0, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[1] = [0:(-16, -40, 16), 1:(0, 90, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[2] = [0:(16, -40, 16), 1:(0, 90, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[3] = [0:(44, 0, 16), 1:(0, 180, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[4] = [0:(16, 40, 16), 1:(0, 270, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[5] = [0:(-16, 40, 16), 1:(0, 270, 0), 2:"Cover Right"];
        break;
    case #"hash_abd3702bcd5c566d":
        var_b1b5e6b1e4e92cb6[0] = [0:(-32, 0, 16), 1:(0, 0, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[1] = [0:(0, -32, 16), 1:(0, 90, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[2] = [0:(32, 0, 16), 1:(0, 180, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[3] = [0:(0, 32, 16), 1:(0, 270, 0), 2:"Cover Stand"];
        break;
    case #"hash_1b9f4f0b9db8b629":
        var_b1b5e6b1e4e92cb6[0] = [0:(-98, 16, 16), 1:(0, 0, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[1] = [0:(-98, -16, 16), 1:(0, 0, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[2] = [0:(-60, -50, 16), 1:(0, 90, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[3] = [0:(52, -46, 16), 1:(0, 90, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[4] = [0:(92, -16, 16), 1:(0, 180, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[5] = [0:(92, 16, 16), 1:(0, 180, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[6] = [0:(50, 52, 16), 1:(0, 270, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[7] = [0:(-62, 48, 16), 1:(0, 270, 0), 2:"Cover Stand"];
        break;
    case #"hash_9788f6a3e338ad4e":
        var_b1b5e6b1e4e92cb6[0] = [0:(-136, 30, 16), 1:(0, 0, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[1] = [0:(-136, -24, 16), 1:(0, 0, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[2] = [0:(-102, -60, 16), 1:(0, 90, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[3] = [0:(-52, -60, 16), 1:(0, 90, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[4] = [0:(96, -60, 16), 1:(0, 90, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[5] = [0:(134, -24, 16), 1:(0, 180, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[6] = [0:(136, 28, 16), 1:(0, 180, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[7] = [0:(100, 64, 16), 1:(0, 270, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[8] = [0:(-52, 64, 16), 1:(0, 270, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[9] = [0:(-102, 64, 16), 1:(0, 270, 0), 2:"Cover Right"];
        break;
    case #"hash_7be737f2812cfd50":
        var_b1b5e6b1e4e92cb6[0] = [0:(-36, 10, 16), 1:(0, 0, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[1] = [0:(-36, -10, 16), 1:(0, 0, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[2] = [0:(0, -40, 16), 1:(0, 90, 0), 2:"Cover Multi"];
        var_b1b5e6b1e4e92cb6[3] = [0:(34, -10, 16), 1:(0, 180, 0), 2:"Cover Left"];
        var_b1b5e6b1e4e92cb6[4] = [0:(34, 10, 16), 1:(0, 180, 0), 2:"Cover Right"];
        var_b1b5e6b1e4e92cb6[5] = [0:(0, 40, 16), 1:(0, 270, 0), 2:"Cover Multi"];
        break;
    case #"hash_9fc5b4fdb662e731":
        var_b1b5e6b1e4e92cb6[0] = [0:(-36, 20, 16), 1:(0, 0, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[1] = [0:(-36, -20, 16), 1:(0, 0, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[2] = [0:(0, -52, 16), 1:(0, 90, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[3] = [0:(34, -20, 16), 1:(0, 180, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[4] = [0:(34, 20, 16), 1:(0, 180, 0), 2:"Cover Stand"];
        var_b1b5e6b1e4e92cb6[5] = [0:(0, 54, 16), 1:(0, 270, 0), 2:"Cover Stand"];
        break;
    case #"hash_d44cb989edc40ab3":
        var_b1b5e6b1e4e92cb6[0] = [0:(0, 0, 16), 1:(0, 0, 0), 2:"Exposed"];
    default:
        break;
    }
    return var_b1b5e6b1e4e92cb6;
}

