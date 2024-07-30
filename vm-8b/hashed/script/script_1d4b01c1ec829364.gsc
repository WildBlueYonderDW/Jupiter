#using scripts\engine\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_48814951e916af89;
#using scripts\mp\ai_behavior.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using scripts\engine\trace.gsc;
#using script_600b944a95c3a7bf;
#using scripts\mp\flags.gsc;
#using scripts\mp\gameobjects.gsc;
#using script_2f4866552f0ba818;
#using script_371b4c2ab5861e62;
#using script_64acb6ce534155b7;
#using scripts\mp\playerlogic.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\spawnselection.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using script_7c40fa80892a721;

#namespace namespace_1a51bfb381ca99d3;

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44b
// Size: 0x25
function function_aa0d1f90dcc5d366() {
    level.br_armory_kiosk = spawnstruct();
    level.br_armory_kiosk.scriptables = [];
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x478
// Size: 0x9b
function function_d23c7c1add9fb181() {
    closestobj = undefined;
    closestdist = undefined;
    foreach (objective in level.objectives) {
        dist = distancesquared(self.origin, objective.curorigin);
        if (!isdefined(closestobj) || dist < closestdist) {
            closestobj = objective;
            closestdist = dist;
        }
    }
    return closestobj;
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51c
// Size: 0xa18
function function_1629419647b0f862() {
    level.var_1e17e3480b1d264d = 1;
    level.armoronweaponswitchlongpress = 1;
    level.var_44334833e57b459b = 1;
    scripts\mp\gametypes\br_armory_kiosk::init();
    level.var_6beff7b631ab7e18 = &function_6beff7b631ab7e18;
    level.var_3c8e175d92be01ea = &function_8529632b1fdb55a6;
    level.modifyvehicledamage = &modifyvehicledamage;
    level.var_468b95f3865fa8d3 = &function_468b95f3865fa8d3;
    level.var_95344ec32aa27f24 = getdvarfloat(@"hash_fd13071a3ec6f158", 0.85);
    level.var_953451c32aa285bd = getdvarfloat(@"hash_fd130a1a3ec6f7f1", 0.7);
    level.var_38931344c1be4d04 = getdvarint(@"hash_8062b21f870de073", 12);
    upgrades = [];
    upgrade = spawnstruct();
    upgrade.ref = "research_upgrade_uav";
    upgrade.purchased = 0;
    upgrade.var_98eafcae335d563a = 1;
    upgrade.persistentpurchase = 1;
    upgrade.purchasecount = 0;
    upgrade.var_492dba79acaac7e0 = 10;
    upgrades[upgrade.ref] = upgrade;
    upgrade = spawnstruct();
    upgrade.ref = "research_upgrade_vehicle";
    upgrade.purchased = 0;
    upgrade.var_98eafcae335d563a = 1;
    upgrade.persistentpurchase = 1;
    upgrade.purchasecount = 0;
    upgrade.var_492dba79acaac7e0 = 10;
    upgrades[upgrade.ref] = upgrade;
    upgrade = spawnstruct();
    upgrade.ref = "research_upgrade_defense";
    upgrade.purchased = 0;
    upgrade.var_98eafcae335d563a = 1;
    upgrade.persistentpurchase = 1;
    upgrade.purchasecount = 0;
    upgrade.var_492dba79acaac7e0 = 10;
    upgrades[upgrade.ref] = upgrade;
    upgrade = spawnstruct();
    upgrade.ref = "uav_ping";
    upgrade.purchased = 0;
    upgrade.var_98eafcae335d563a = 1;
    upgrade.persistentpurchase = 1;
    upgrade.purchasecount = 0;
    upgrade.var_492dba79acaac7e0 = 10;
    upgrades[upgrade.ref] = upgrade;
    upgrade = spawnstruct();
    upgrade.ref = "uav_ping_radius";
    upgrade.purchased = 0;
    upgrade.var_98eafcae335d563a = 1;
    upgrade.persistentpurchase = 1;
    upgrade.purchasecount = 0;
    upgrade.var_492dba79acaac7e0 = 10;
    upgrades[upgrade.ref] = upgrade;
    upgrade = spawnstruct();
    upgrade.ref = "uav_ping_duration";
    upgrade.purchased = 0;
    upgrade.var_98eafcae335d563a = 1;
    upgrade.persistentpurchase = 1;
    upgrade.purchasecount = 0;
    upgrade.var_492dba79acaac7e0 = 10;
    upgrades[upgrade.ref] = upgrade;
    upgrade = spawnstruct();
    upgrade.ref = "uav_ping_global";
    upgrade.purchased = 0;
    upgrade.var_98eafcae335d563a = 1;
    upgrade.persistentpurchase = 1;
    upgrade.purchasecount = 0;
    upgrade.var_492dba79acaac7e0 = 10;
    upgrades[upgrade.ref] = upgrade;
    var_4df9c45025851e63 = [];
    upgrade = spawnstruct();
    upgrade.ref = "defense_spawn_armor_tier_1";
    upgrade.purchased = 0;
    upgrade.var_98eafcae335d563a = 0;
    upgrade.persistentpurchase = 1;
    upgrade.purchasecount = 0;
    upgrade.var_492dba79acaac7e0 = 10;
    var_4df9c45025851e63[upgrade.ref] = upgrade;
    upgrade = spawnstruct();
    upgrade.ref = "defense_spawn_armor_tier_2";
    upgrade.purchased = 0;
    upgrade.var_98eafcae335d563a = 0;
    upgrade.persistentpurchase = 1;
    upgrade.purchasecount = 0;
    upgrade.var_492dba79acaac7e0 = 10;
    var_4df9c45025851e63[upgrade.ref] = upgrade;
    upgrade = spawnstruct();
    upgrade.ref = "defense_spawn_plate_tier_1";
    upgrade.purchased = 0;
    upgrade.var_98eafcae335d563a = 0;
    upgrade.persistentpurchase = 1;
    upgrade.purchasecount = 0;
    upgrade.var_492dba79acaac7e0 = 10;
    var_4df9c45025851e63[upgrade.ref] = upgrade;
    upgrade = spawnstruct();
    upgrade.ref = "defense_spawn_plate_tier_2";
    upgrade.purchased = 0;
    upgrade.var_98eafcae335d563a = 0;
    upgrade.persistentpurchase = 1;
    upgrade.purchasecount = 0;
    upgrade.var_492dba79acaac7e0 = 10;
    var_4df9c45025851e63[upgrade.ref] = upgrade;
    upgrade = spawnstruct();
    upgrade.ref = "vehicle_defense_tier_1";
    upgrade.purchased = 0;
    upgrade.var_98eafcae335d563a = 0;
    upgrade.persistentpurchase = 1;
    upgrade.purchasecount = 0;
    upgrade.var_492dba79acaac7e0 = 10;
    var_4df9c45025851e63[upgrade.ref] = upgrade;
    upgrade = spawnstruct();
    upgrade.ref = "vehicle_defense_tier_2";
    upgrade.purchased = 0;
    upgrade.var_98eafcae335d563a = 0;
    upgrade.persistentpurchase = 1;
    upgrade.purchasecount = 0;
    upgrade.var_492dba79acaac7e0 = 10;
    var_4df9c45025851e63[upgrade.ref] = upgrade;
    upgrade = spawnstruct();
    upgrade.ref = "vehicle_apc_improved_ammo";
    upgrade.purchased = 0;
    upgrade.var_98eafcae335d563a = 0;
    upgrade.persistentpurchase = 1;
    upgrade.purchasecount = 0;
    upgrade.var_492dba79acaac7e0 = 10;
    var_4df9c45025851e63[upgrade.ref] = upgrade;
    level.var_73e72117ada9cce6 = getdvarfloat(@"hash_a19bc7851e3c41b6", level.flagcapturetime * 2);
    level.buystations = [];
    level.var_f2afbe97539d175d = [];
    foreach (team in level.teamnamelist) {
        level.var_f2afbe97539d175d[team] = [];
    }
    tracecontents = scripts\engine\trace::create_default_contents(1);
    while (level.objectives.size == 0) {
        waitframe();
    }
    var_198c1217542d88cd = [];
    radiantstations = getstructarray("buystation_loc", "targetname");
    foreach (ent in radiantstations) {
        var_198c1217542d88cd[ent.script_label] = ent;
    }
    foreach (key, objective in level.objectives) {
        groundorigin = (0, 0, 0);
        spawnangles = (0, 0, 0);
        if (isdefined(var_198c1217542d88cd[key])) {
            groundorigin = var_198c1217542d88cd[key].origin;
            spawnangles = var_198c1217542d88cd[key].angles;
        } else {
            groundorigin = drop_to_ground(objective.curorigin + anglestoforward(objective.trigger.angles) * 50, 50, -200, undefined, tracecontents);
            spawnangles = objective.trigger.angles;
        }
        buystation = spawnscriptable("br_plunder_box", groundorigin, spawnangles);
        buystation.objectivekey = key;
        level.buystations[key] = buystation;
        buystation setscriptablepartstate("br_plunder_box", "visible");
        buystation.var_5cfa621ebf61d8aa = 0;
        upgradestatus = spawnstruct();
        upgradestatus.tier = 0;
        upgradestatus.upgrades = upgrades;
        foreach (team in level.teamnamelist) {
            level.var_f2afbe97539d175d[team][key] = upgradestatus;
        }
    }
    upgradestatus = spawnstruct();
    upgradestatus.upgrades = var_4df9c45025851e63;
    foreach (team in level.teamnamelist) {
        level.var_f2afbe97539d175d[team]["global"] = upgradestatus;
    }
    level thread function_c800466f69dfc582();
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf3c
// Size: 0xf6
function function_6beff7b631ab7e18(instance, player) {
    if (istrue(instance.var_5cfa621ebf61d8aa) || istrue(level.var_8e9daba162280a8e)) {
        player setclientomnvar("ui_buystation_override", namespace_38b993c4618e76cd::function_54b046aa3ba2678a("personalOnly"));
    }
    var_f4802cadf5f79275 = getdvar(hashcat(@"hash_de61cd75a31ab28", instance.objectivekey), "");
    if (var_f4802cadf5f79275 != "") {
        var_47df3a792140c443 = namespace_38b993c4618e76cd::function_54b046aa3ba2678a(var_f4802cadf5f79275 + "_tier_" + level.var_f2afbe97539d175d[player.team][instance.objectivekey].tier);
        if (!isdefined(var_47df3a792140c443)) {
            var_47df3a792140c443 = namespace_38b993c4618e76cd::function_54b046aa3ba2678a(var_f4802cadf5f79275);
        }
        if (isdefined(var_47df3a792140c443)) {
            player setclientomnvar("ui_buystation_override", var_47df3a792140c443);
        }
    }
    player function_e29957adfbe3c040(instance.objectivekey);
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x103a
// Size: 0x2b7
function function_e29957adfbe3c040(objectivekey) {
    var_5c9ddcf56d36f133 = 0;
    if (istrue(level.var_f2afbe97539d175d[self.team][objectivekey].upgrades["uav_ping"].purchased)) {
        var_5c9ddcf56d36f133 += 1;
    }
    if (istrue(level.var_f2afbe97539d175d[self.team][objectivekey].upgrades["uav_ping_radius"].purchased)) {
        var_5c9ddcf56d36f133 += 2;
    }
    if (istrue(level.var_f2afbe97539d175d[self.team][objectivekey].upgrades["uav_ping_duration"].purchased)) {
        var_5c9ddcf56d36f133 += 4;
    }
    if (istrue(level.var_f2afbe97539d175d[self.team][objectivekey].upgrades["uav_ping_global"].purchased)) {
        var_5c9ddcf56d36f133 += 8;
    }
    if (istrue(level.var_f2afbe97539d175d[self.team]["global"].upgrades["defense_spawn_armor_tier_1"].purchased)) {
        var_5c9ddcf56d36f133 += 16;
    }
    if (istrue(level.var_f2afbe97539d175d[self.team]["global"].upgrades["defense_spawn_armor_tier_2"].purchased)) {
        var_5c9ddcf56d36f133 += 32;
    }
    if (istrue(level.var_f2afbe97539d175d[self.team]["global"].upgrades["defense_spawn_plate_tier_1"].purchased)) {
        var_5c9ddcf56d36f133 += 64;
    }
    if (istrue(level.var_f2afbe97539d175d[self.team]["global"].upgrades["defense_spawn_plate_tier_2"].purchased)) {
        var_5c9ddcf56d36f133 += 128;
    }
    if (istrue(level.var_f2afbe97539d175d[self.team]["global"].upgrades["vehicle_defense_tier_1"].purchased)) {
        var_5c9ddcf56d36f133 += 256;
    }
    if (istrue(level.var_f2afbe97539d175d[self.team]["global"].upgrades["vehicle_defense_tier_2"].purchased)) {
        var_5c9ddcf56d36f133 += 512;
    }
    if (istrue(level.var_f2afbe97539d175d[self.team]["global"].upgrades["vehicle_apc_improved_ammo"].purchased)) {
        var_5c9ddcf56d36f133 += 1024;
    }
    self setclientomnvar("ui_upgrade_status", var_5c9ddcf56d36f133);
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12f9
// Size: 0xbc
function function_c800466f69dfc582() {
    scripts\mp\flags::gameflagwait("prematch_done");
    if (istrue(level.var_7f5be0207e7457b1)) {
        return;
    }
    foreach (key, buystation in level.buystations) {
        foreach (team in level.teamnamelist) {
            buystation function_8d03978a31faba3a(key, team);
        }
    }
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13bd
// Size: 0xa6
function function_6ed651811c936a22() {
    if (!istrue(level.var_44334833e57b459b)) {
        return;
    }
    if (istrue(level.var_7f5be0207e7457b1)) {
        return;
    }
    foreach (key, buystation in level.buystations) {
        ownerteam = level.objectives[key] scripts\mp\gameobjects::getownerteam();
        if (self.team == ownerteam) {
            buystation enablescriptableplayeruse(self);
            continue;
        }
        buystation disablescriptableplayeruse(self);
    }
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x146b
// Size: 0xc4
function function_e8a6e840ef663c81(key, team) {
    if (!istrue(level.var_44334833e57b459b)) {
        return;
    }
    if (istrue(level.var_7f5be0207e7457b1)) {
        return;
    }
    if (!isdefined(team) || !isgameplayteam(team)) {
        return;
    }
    foreach (player in level.players) {
        if (player.team == team) {
            level.buystations[key] enablescriptableplayeruse(player);
            continue;
        }
        level.buystations[key] disablescriptableplayeruse(player);
    }
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1537
// Size: 0x9f
function function_8d03978a31faba3a(key, team) {
    if (!istrue(level.var_44334833e57b459b)) {
        return;
    }
    if (!isdefined(team) || !isgameplayteam(team)) {
        return;
    }
    players = getteamdata(team, "players");
    foreach (player in players) {
        level.buystations[key] disablescriptableplayeruse(player);
    }
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15de
// Size: 0xa1
function function_4de8052758f986f3(objectivekey, team, ref) {
    if (!istrue(level.var_44334833e57b459b)) {
        return 0;
    }
    if (array_contains_key(level.var_f2afbe97539d175d[team]["global"].upgrades, ref)) {
        upgradedata = level.var_f2afbe97539d175d[team]["global"].upgrades[ref];
    } else {
        upgradedata = level.var_f2afbe97539d175d[team][objectivekey].upgrades[ref];
    }
    return upgradedata.purchased;
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1688
// Size: 0x71
function function_3ce1055115edcbbb(player, ref) {
    if (!istrue(level.var_44334833e57b459b)) {
        return false;
    }
    objective = player function_d23c7c1add9fb181();
    if (objective.ownerteam != player.team) {
        return false;
    }
    applypurchase(objective.objectivekey, player.team, ref);
    return true;
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1702
// Size: 0x2c5
function applypurchase(objectivekey, team, ref) {
    if (!istrue(level.var_44334833e57b459b)) {
        return;
    }
    if (array_contains_key(level.var_f2afbe97539d175d[team]["global"].upgrades, ref)) {
        objectivekey = "global";
    }
    upgradedata = level.var_f2afbe97539d175d[team][objectivekey].upgrades[ref];
    if (isdefined(upgradedata) && upgradedata.purchased == 0) {
        upgradedata.purchasecount++;
        self iprintlnbold("Upgrade contribution " + upgradedata.purchasecount + "/" + upgradedata.var_492dba79acaac7e0);
        if (upgradedata.purchasecount == upgradedata.var_492dba79acaac7e0) {
            upgradedata.purchased = 1;
            switch (ref) {
            case #"hash_9789620b82d8908c":
            case #"hash_f0fd4758cf2900f0":
            case #"hash_f4fe496941705c28": 
                upgradedata.purchased = 0;
                upgradedata.purchasecount = 0;
                level.var_f2afbe97539d175d[team][objectivekey].tier++;
                break;
            }
        } else {
            return;
        }
    }
    switch (ref) {
    case #"hash_e4154ddbab061c63": 
        level.objectives[objectivekey] scripts\mp\gameobjects::setusetime(level.var_73e72117ada9cce6);
        objective_setstate(level.objectives[objectivekey].objidnum, 1);
        break;
    case #"hash_bb639a6ed9e9b88a": 
        function_805aa14814fe1ff2(objectivekey, team);
        break;
    case #"hash_6235851dae0eeca8": 
        level.objectives[objectivekey] thread function_c929fb023d29de5e(team);
        break;
    case #"hash_fd8da3bdddb8e1c2": 
        namespace_317764fb96da42b0::function_e7ad80f4a663b94b(objectivekey, 5, team);
        break;
    case #"hash_dda8890cb35ca0bf": 
        groupname = function_78759441c259f58a();
        agent = ai_mp_requestspawnagent("enemy_mp_jugg_base", level.objectives[objectivekey].trigger.origin, (0, 0, 0), "absolute", "everybody", "jugg", groupname, team);
        namespace_14d36171baccf528::function_1828f1e20e52b418(agent);
        agent thread function_b11c1964f528574b(agent);
        break;
    case #"hash_6c0c806bbf705a0c": 
        break;
    case #"hash_9789620b82d8908c":
    case #"hash_f0fd4758cf2900f0":
    case #"hash_f4fe496941705c28": 
        level.buystations[objectivekey] thread function_ada6203de7e0ad2f();
        break;
    }
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19cf
// Size: 0x31
function function_ada6203de7e0ad2f() {
    self setscriptablepartstate("br_plunder_box", "disabled");
    wait 1;
    self setscriptablepartstate("br_plunder_box", "opening");
    scripts\mp\gametypes\br_armory_kiosk::kioskfixupproneplayers();
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a08
// Size: 0xa2
function function_6e2299d954003d6c(team, objectivekey) {
    if (!istrue(level.var_44334833e57b459b)) {
        return;
    }
    foreach (ref, upgrade in level.var_f2afbe97539d175d[team][objectivekey].upgrades) {
        if (upgrade.purchased && upgrade.persistentpurchase) {
            applypurchase(team, objectivekey, ref);
        }
    }
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab2
// Size: 0x85
function function_666a2979def5d705(team, objectivekey) {
    if (!istrue(level.var_44334833e57b459b)) {
        return;
    }
    foreach (ref, upgrade in level.var_f2afbe97539d175d[team][objectivekey].upgrades) {
        removeupgrade(team, objectivekey, ref);
    }
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b3f
// Size: 0x17a
function removeupgrade(team, objectivekey, ref) {
    if (!istrue(level.var_44334833e57b459b)) {
        return;
    }
    upgrade = level.var_f2afbe97539d175d[team][objectivekey].upgrades[ref];
    if (!upgrade.var_98eafcae335d563a || upgrade.persistentpurchase) {
        return;
    }
    level.var_f2afbe97539d175d[team][objectivekey].upgrades[ref] = 0;
    switch (ref) {
    case #"hash_e4154ddbab061c63": 
        level.objectives[objectivekey] scripts\mp\gameobjects::setusetime(level.flagcapturetime);
        objective_setstate(level.objectives[objectivekey].objidnum, 0);
        break;
    case #"hash_bb639a6ed9e9b88a": 
        foreach (team in level.teamnamelist) {
            function_87215631aacdabe9(objectivekey, team);
        }
        break;
    case #"hash_6235851dae0eeca8": 
        level.objectives[objectivekey] thread disableUAVPing();
        break;
    case #"hash_6c0c806bbf705a0c":
    case #"hash_dda8890cb35ca0bf":
    case #"hash_fd8da3bdddb8e1c2": 
        break;
    }
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc1
// Size: 0xb0
function function_805aa14814fe1ff2(key, team) {
    if (!istrue(level.var_44334833e57b459b)) {
        return;
    }
    if (!isdefined(team) || !isgameplayteam(team)) {
        return;
    }
    level.var_f08df4288eee30f5[key] show();
    players = getteamdata(team, "players");
    foreach (player in players) {
        level.var_f08df4288eee30f5[key] enablescriptableplayeruse(player);
    }
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d79
// Size: 0xb0
function function_87215631aacdabe9(key, team) {
    if (!istrue(level.var_44334833e57b459b)) {
        return;
    }
    if (!isdefined(team) || !isgameplayteam(team)) {
        return;
    }
    level.var_f08df4288eee30f5[key] hide();
    players = getteamdata(team, "players");
    foreach (player in players) {
        level.var_f08df4288eee30f5[key] disablescriptableplayeruse(player);
    }
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e31
// Size: 0x1ce
function function_c929fb023d29de5e(team) {
    if (!istrue(level.var_44334833e57b459b)) {
        return;
    }
    if (!isdefined(team) || !isgameplayteam(team)) {
        return;
    }
    self endon("disableUAVPing");
    while (true) {
        radius = ter_op(istrue(level.var_f2afbe97539d175d[team][self.objectivekey].upgrades["uav_ping_radius"].purchased), getdvarint(@"hash_6bbb6d984ba826b4", 3000), getdvarint(@"hash_bbf08a38c88577", 1000));
        duration = ter_op(istrue(level.var_f2afbe97539d175d[team][self.objectivekey].upgrades["uav_ping_duration"].purchased), getdvarfloat(@"hash_d3e12b5a75c3aada", 2), getdvarfloat(@"hash_e34e9ea29b7cc0a9", 4));
        if (istrue(level.var_f2afbe97539d175d[team][self.objectivekey].upgrades["uav_ping_global"].purchased)) {
            foreach (objective in level.objectives) {
                if (objective.ownerteam == team) {
                    triggerportableradarpingteam(objective.curorigin, team, radius, int(duration * 1000));
                }
            }
        } else {
            triggerportableradarpingteam(self.curorigin, team, radius, int(duration * 1000));
        }
        wait duration;
    }
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2007
// Size: 0x18
function disableUAVPing() {
    if (!istrue(level.var_44334833e57b459b)) {
        return;
    }
    self notify("disableUAVPing");
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2027
// Size: 0x146
function function_efbc646224fda4fa() {
    level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare(self.origin, "revive");
    spawnheight = getdvarfloat(@"hash_3db53fbbad853ffc", 8000);
    spawnorigin = self.origin;
    spawnorigin += (0, 0, spawnheight);
    var_ad4dd16f29e24b77 = 0;
    var_dfab0807d83a77fe = 0.5;
    thread scripts\mp\playerlogic::managerespawnfade(var_ad4dd16f29e24b77, var_dfab0807d83a77fe);
    if (var_ad4dd16f29e24b77 > 0) {
        self waittill("fadeDown_complete");
    }
    facingorigin = (level.mapcorners[0].origin + level.mapcorners[1].origin) * 0.5;
    toselection = facingorigin - spawnorigin;
    spawnangles = vectortoangles(vectornormalize(toselection));
    self setorigin(spawnorigin);
    self setplayerangles(spawnangles);
    if (level.parachutecancutautodeploy) {
        self skydive_cutautodeployon();
    } else {
        self skydive_cutautodeployoff();
    }
    if (level.parachutecancutparachute) {
        self skydive_cutparachuteon();
    } else {
        self skydive_cutparachuteoff();
    }
    thread scripts\cp_mp\parachute::startfreefall(level.parachutedeploydelay, 0, undefined, undefined, 1);
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2175
// Size: 0x20d
function function_5a1699b27399a21e() {
    level endon("game_ended");
    teamscore = undefined;
    otherteamscore = undefined;
    level waittill("prematch_done");
    level thread scripts\mp\spawnselection::updatefobindanger();
    while (!level.gameended) {
        wait getdvarint(@"hash_ac8e27080e51148b", 20);
        scripts\mp\hostmigration::waittillhostmigrationdone();
        domflags = getowneddomflags();
        if (!isdefined(level.cashtick)) {
            level.cashtick = [];
        }
        foreach (entry in level.teamnamelist) {
            level.cashtick[entry] = 0;
        }
        if (domflags.size) {
            for (i = 1; i < domflags.size; i++) {
                domflag = domflags[i];
                flagscore = gettime() - domflag.capturetime;
                for (j = i - 1; j >= 0 && flagscore > gettime() - domflags[j].capturetime; j--) {
                    domflags[j + 1] = domflags[j];
                }
                domflags[j + 1] = domflag;
            }
            foreach (domflag in domflags) {
                team = domflag scripts\mp\gameobjects::getownerteam();
                assert(scripts\mp\utility\teams::isgameplayteam(team));
                var_fee716687dd29378 = scripts\mp\gametypes\obj_dom::getteamflagcount(team);
                if (var_fee716687dd29378 >= level.flagsrequiredtoscore) {
                    level.cashtick[team] = level.cashtick[team] + level.var_1f42dab41eff5cb2;
                }
            }
        }
        updatecash();
    }
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x238a
// Size: 0xc3
function updatecash() {
    foreach (entry in level.teamnamelist) {
        if (level.cashtick[entry] > 0) {
            foreach (player in scripts\mp\utility\teams::getteamdata(entry, "players")) {
                player [[ level.var_9c1e3c18b99409e9 ]](level.cashtick[entry]);
            }
        }
    }
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2455
// Size: 0x80
function getowneddomflags() {
    domflags = [];
    foreach (domflag in level.objectives) {
        if (domflag scripts\mp\gameobjects::getownerteam() != "neutral" && isdefined(domflag.capturetime)) {
            domflags[domflags.size] = domflag;
        }
    }
    return domflags;
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24de
// Size: 0x150
function function_8529632b1fdb55a6(player) {
    armorvalue = undefined;
    var_10fd8ed3fed0e0ae = undefined;
    if (istrue(level.var_f2afbe97539d175d[player.team]["global"].upgrades["defense_spawn_armor_tier_2"].purchased)) {
        armorvalue = player.maxarmorhealth;
    } else if (istrue(level.var_f2afbe97539d175d[player.team]["global"].upgrades["defense_spawn_armor_tier_1"].purchased)) {
        armorvalue = level.spawnarmor + level.var_4b78859bacc88808;
    }
    if (istrue(level.var_f2afbe97539d175d[player.team]["global"].upgrades["defense_spawn_plate_tier_2"].purchased)) {
        var_10fd8ed3fed0e0ae = namespace_f8d3520d3483c1::function_47320a25b8ee003();
    } else if (istrue(level.var_f2afbe97539d175d[player.team]["global"].upgrades["defense_spawn_plate_tier_1"].purchased)) {
        var_10fd8ed3fed0e0ae = level.spawnarmorplates + 1;
    }
    return [armorvalue, var_10fd8ed3fed0e0ae];
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2637
// Size: 0x123
function modifyvehicledamage(data) {
    switch (data.victim.vehiclename) {
    case #"hash_41afa3eacdeba917":
    case #"hash_7c54070d9b704f70": 
        if (istrue(level.var_f2afbe97539d175d[data.victim.team]["global"].upgrades["vehicle_defense_tier_2"].purchased)) {
            data.damage = int(data.damage * level.var_953451c32aa285bd);
        } else if (istrue(level.var_f2afbe97539d175d[data.victim.team]["global"].upgrades["vehicle_defense_tier_1"].purchased)) {
            data.damage = int(data.damage * level.var_95344ec32aa27f24);
        }
        break;
    }
    return data.damage;
}

// Namespace namespace_1a51bfb381ca99d3 / namespace_18dd16563a37da34
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2763
// Size: 0x4f
function function_468b95f3865fa8d3(vehicle) {
    if (istrue(level.var_f2afbe97539d175d[vehicle.team]["global"].upgrades["vehicle_apc_improved_ammo"].purchased)) {
        return level.var_38931344c1be4d04;
    }
    return undefined;
}

