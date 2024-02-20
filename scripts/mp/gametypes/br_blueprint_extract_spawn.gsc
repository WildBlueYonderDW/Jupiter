// mwiii decomp prototype
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_extract_quest.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_79df2a50da8bf4e3;

// Namespace namespace_79df2a50da8bf4e3/namespace_8e13c187e2eade0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111
// Size: 0x17a
function init() {
    level.blueprint_maxpermatch = undefined;
    level.blueprint_chancebase = undefined;
    level.blueprint_chancepercontract = undefined;
    brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    if (brgametype == "plunder" || brgametype == "risk") {
        level.blueprint_maxpermatch = getdvarfloat(@"hash_d8044c322f6b5042", 4);
        level.blueprint_chancebase = getdvarfloat(@"hash_13b736c9ba95d40d", 0.02);
        level.blueprint_chancepercontract = getdvarfloat(@"hash_8a876e2c4b13f819", 0);
    } else {
        level.blueprint_maxpermatch = getdvarfloat(@"hash_412e34085bcd2b1a", 4);
        level.blueprint_chancebase = getdvarfloat(@"hash_aa3250e2ce395b55", 0.02);
        level.blueprint_chancepercontract = getdvarfloat(@"hash_9c3219408286e11", 0);
    }
    level.blueprintextractspawns = 0;
    level.blueprintextractchance = level.blueprint_chancebase;
    level.blueprintcreatingteam = undefined;
    foreach (var_a03d4fe1f134db01 in level.questinfo.unlockables) {
        registerpickupcreatedcallback("brloot_blueprintextract_tablet", &blueprintextract_onpickupcreated);
    }
}

// Namespace namespace_79df2a50da8bf4e3/namespace_8e13c187e2eade0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x292
// Size: 0x8c
function blueprintextract_trygetreward(rewardorigin) {
    if (!blueprintextract_shouldgivereward(rewardorigin)) {
        return undefined;
    }
    if (level.blueprintextractspawns >= level.blueprint_maxpermatch) {
        return undefined;
    }
    var_908ffeb2459e73af = randomfloat(1);
    if (var_908ffeb2459e73af <= level.blueprintextractchance) {
        level.blueprintextractspawns = level.blueprintextractspawns + 1;
        return "brloot_blueprintextract_tablet";
    } else {
        level.blueprintextractchance = level.blueprintextractchance + level.blueprint_chancepercontract;
        return undefined;
    }
}

// Namespace namespace_79df2a50da8bf4e3/namespace_8e13c187e2eade0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x325
// Size: 0xd5
function blueprintextract_shouldgivereward(rewardorigin) {
    if (namespace_d3d40f75bb4e4c32::isanytutorialorbotpracticematch()) {
        return 0;
    }
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        return 0;
    }
    if (istrue(level.bmoovertime)) {
        return 0;
    }
    if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex) && isdefined(level.br_level) && isdefined(level.br_level.br_circleclosetimes)) {
        var_d280129509a08f5a = level.br_circle.circleindex;
        var_f117fdd931ae78a1 = level.br_level.br_circleclosetimes.size - 1;
        if (var_f117fdd931ae78a1 - var_d280129509a08f5a < 4) {
            return 0;
        }
    }
    if (!namespace_20c746953ff716b9::extractlocale_islocaleavailable(rewardorigin)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_79df2a50da8bf4e3/namespace_8e13c187e2eade0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x402
// Size: 0x16
function blueprintextract_beforepickupspawned(team) {
    level.blueprintcreatingteam = team;
}

// Namespace namespace_79df2a50da8bf4e3/namespace_8e13c187e2eade0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41f
// Size: 0x2c
function blueprintextract_onpickupcreated() {
    var_2db7ba1634abc375 = namespace_4bc0ead8d2af3d84::getrandomextractunlockablelootid();
    blueprintextract_setunlockablelootid(var_2db7ba1634abc375);
    thread blueprintextract_createtempobjective();
    thread blueprintextract_cleanupwhennoavailablelocales();
}

// Namespace namespace_79df2a50da8bf4e3/namespace_8e13c187e2eade0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x452
// Size: 0x1f
function blueprintextract_setunlockablelootid(var_26f195548422121e) {
    namespace_cb965d2f71fefddc::loot_setitemcount(self, var_26f195548422121e);
    self.extractunlockablelootid = var_26f195548422121e;
}

// Namespace namespace_79df2a50da8bf4e3/namespace_8e13c187e2eade0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x478
// Size: 0x13b
function blueprintextract_createtempobjective() {
    var_8f90f73d25e925e3 = level.blueprintcreatingteam;
    level.blueprintcreatingteam = undefined;
    if (!isdefined(var_8f90f73d25e925e3)) {
        return;
    }
    objectiveiconid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (objectiveiconid != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objectiveiconid, "invisible", (0, 0, 0), "ui_mp_br_mapmenu_icon_extraction_objective");
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objectiveiconid, 1);
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objectiveiconid, 1);
        foreach (player in getteamdata(var_8f90f73d25e925e3, "players")) {
            if (!player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
                objective_addclienttomask(objectiveiconid, player);
            }
        }
    }
    starttime = gettime();
    while (isdefined(self) && gettime() - starttime < 15000) {
        newpos = self.origin + (0, 0, 10);
        namespace_5a22b6f3a56f7e9b::update_objective_position(objectiveiconid, newpos);
        waitframe();
    }
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(objectiveiconid);
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(objectiveiconid);
}

// Namespace namespace_79df2a50da8bf4e3/namespace_8e13c187e2eade0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ba
// Size: 0x26
function blueprintextract_cleanupwhennoavailablelocales() {
    while (isdefined(self)) {
        if (!namespace_20c746953ff716b9::extractlocale_islocaleavailable(self.origin)) {
            deletescriptableinstance();
            return;
        }
        waitframe();
    }
}

