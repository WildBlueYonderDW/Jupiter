// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\trigger.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\spawnfactor.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\dev.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\matchrecording.gsc;
#using scripts\mp\flags.gsc;

#namespace spawnlogic;

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1281
// Size: 0x453
function init() {
    level.spawnglobals = spawnstruct();
    if (isanymlgmatch()) {
        level.killstreakspawnshielddelayms = 0;
    } else {
        level.killstreakspawnshielddelayms = 4000;
    }
    level.forcebuddyspawn = 0;
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    level.mapcenter = findboxcenter(level.spawnmins, level.spawnmaxs);
    level.numplayerswaitingtospawn = 0;
    level.numplayerswaitingtoenterkillcam = 0;
    level.players = [];
    level.playersbyentitynumber = [];
    level.participants = [];
    level.characters = [];
    level.spawnpointarray = [];
    level.grenades = [];
    level.missiles = [];
    level.carepackages = [];
    level.helis = [];
    level.turrets = [];
    level.tanks = [];
    level.scramblers = [];
    level.ugvs = [];
    level.playerkillstreaks = [];
    level.spawnglobals.lowerlimitfullsights = getdvarfloat(@"hash_ba77e8f37223f218");
    level.spawnglobals.lowerlimitcornersights = getdvarfloat(@"hash_f055530a90c953bc");
    level.spawnglobals.lastteamspawnpoints = [];
    level.spawnglobals.lastbadspawntime = [];
    level.spawnglobals.influencenodealloccounts = [];
    level.spawnglobals.spawnsets = [];
    level.spawnglobals.activespawnsets = [];
    level.spawnglobals.spawnsetlists = [];
    level.spawnglobals.spawnpointscriptdata = [];
    if (isdefined(level.gametypebundle.var_466145510d447d04)) {
        level.spawnglobals.var_466145510d447d04 = getspawnbucketfromstring(level.gametypebundle.var_466145510d447d04);
    }
    level.var_dec2781e0b09018c = getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_use_safe_fallback_spawns"), 0) == 1;
    level thread spawnpointupdate();
    level thread scripts/cp_mp/utility/game_utility::trackprojectiles();
    level thread trackhostmigrationend();
    level thread trackcarepackages();
    thread printstartupdebugmessages();
    level thread logextraspawninfothink();
    /#
        level thread updatedebughud();
    #/
    for (i = 0; i < level.teamnamelist.size; i++) {
        level.teamspawnpoints[level.teamnamelist[i]] = [];
        level.teamfallbackspawnpoints[level.teamnamelist[i]] = [];
    }
    scripts/mp/spawnfactor::init_spawn_factors();
    scripts/mp/spawnfactor::function_28565316737536aa();
    level.disablebuddyspawn = !istrue(getmatchrulesdata("commonOption", "buddySpawnEnabled"));
    loadspawnlogicweights();
    lanetriggers = getentarray("trigger_multiple_mp_spawn_lane", "classname");
    level.spawnglobals.lanetriggers = lanetriggers;
    foreach (index, lanetrigger in level.spawnglobals.lanetriggers) {
        lanetrigger.index = index;
        lanetrigger.indexflag = 1 << index;
    }
    ignoretriggers = getentarray("trigger_multiple_mp_spawn_ignore", "classname");
    foreach (ignoretrigger in ignoretriggers) {
        makeenterexittrigger(ignoretrigger, &ignoretriggerenter, &ignoretriggerexit);
    }
    initspawntypes();
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16db
// Size: 0x89
function function_e2cbae3344485f14(type, setname, var_474c126f25186d39, var_94ec027babd4d45, type_func) {
    spawntype = {setnames:[], type:type};
    spawntype.setnames[0] = setname;
    spawntype.setnames[1] = var_474c126f25186d39;
    spawntype.setnames[2] = var_94ec027babd4d45;
    spawntype.func = type_func;
    return spawntype;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176c
// Size: 0xaf
function initspawntypes() {
    level.spawnglobals.spawntypes = [];
    level.spawnglobals.spawntypes[0] = function_e2cbae3344485f14(0, "primary", "primary_attackers", "primary_defenders", &function_9328a9c1fc8d2043);
    level.spawnglobals.spawntypes[1] = function_e2cbae3344485f14(1, "start", "start_attackers", "start_defenders", &function_f4882bf77adf2d71);
    level.spawnglobals.spawntypes[2] = function_e2cbae3344485f14(2, "fallback", "fallback_attackers", "fallback_defenders", &function_9328a9c1fc8d2043);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1822
// Size: 0xc
function codecallbackhandler_spawnpointprecalc(team) {
    
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1835
// Size: 0x15f
function codecallbackhandler_spawnpointscore(spawnpoint, team) {
    spawncontext = level.spawnglobals.activespawncontext;
    /#
        assertex(isdefined(spawncontext), "GetSpawnpointForPlayer() called while there is no active spawn query context, script logic cannot run");
    #/
    globals = level.spawnglobals;
    var_638d9cd5c072165c = 0;
    spawnpoint.scriptdata = level.spawnglobals.spawnpointscriptdata[spawnpoint.index];
    /#
        assertex(isdefined(spawnpoint.scriptdata), "Spawn Logic Error: No script data found for a spawnpoint. Was spawnpoint never registered?");
    #/
    foreach (factorref, factorstruct in globals.activescriptfactors) {
        factorscore = 0;
        if (isdefined(factorstruct.paramreflist)) {
            /#
                function_d344bbcacf5e4d96(factorref, factorstruct, spawncontext);
            #/
        }
        factorscore = [[ factorstruct.func ]](spawnpoint);
        /#
            assert(factorscore >= 0 && factorscore <= 100);
        #/
        var_638d9cd5c072165c = var_638d9cd5c072165c + factorscore * factorstruct.weight;
    }
    return var_638d9cd5c072165c;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199c
// Size: 0x43
function codecallbackhandler_spawnpointcritscore(spawnpoint, team) {
    /#
        if (getdvarint(@"hash_88da8d1aa9e42678") > 0) {
            return "setActiveSpawnLogic() attempting to use spawn logic but that type was not found in the gametype asset";
        }
    #/
    bucket = scripts/mp/spawnscoring::criticalfactors_callback(spawnpoint);
    return bucket;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e7
// Size: 0x726
function getspawnpoint(spawningplayer, spawnteam, spawnpointset, fallbackspawnset, var_a22bad5fe6fbf86d, spawnparams) {
    if (!isdefined(var_a22bad5fe6fbf86d)) {
        if (isdefined(level.spawnglobals.var_466145510d447d04)) {
            var_a22bad5fe6fbf86d = level.spawnglobals.var_466145510d447d04;
        } else {
            var_a22bad5fe6fbf86d = 3;
        }
    }
    /#
        if (getdvarint(@"hash_f3b498670cb45729", 0) != 0) {
            if (!isdefined(level.var_952af294bfd228a7)) {
                level.var_952af294bfd228a7 = [];
            }
        }
    #/
    /#
        level.var_53043465614ec8f8 = spawnpointset;
        level.var_b5bad5601a066c66 = fallbackspawnset;
    #/
    spawncontext = createspawnquerycontext(spawningplayer, spawnteam, spawnparams);
    setactivespawnquerycontext(spawncontext);
    if (isdefined(spawnpointset)) {
        /#
            assertex(getspawnsetsize(spawnpointset) > 0, "getSpawnpoint() called on an empty spawn set. Is the map missing the correct spawn point type?");
        #/
        activatespawnset(spawnpointset, 1);
    }
    /#
        if (scripts/mp/utility/game::getgametype() != "frontline" && scripts/mp/utility/game::getgametype() != "Undefined spawn factor asset in GameTypeBundle for index " && scripts/mp/utility/game::getgametype() != "playerspawnfactorset:" && scripts/mp/utility/game::getgametype() != "mp/spawnweights_jup4" && scripts/mp/utility/game::getgametype() != "Unknown Factor Type "") {
            scripts/mp/dev::function_847de9fd3b2ff0da(spawnpointset, fallbackspawnset);
        }
    #/
    bestspawnpoint = getspawnpointfromcode();
    bestspawnpoint.usingfallback = 0;
    usingfallback = bestspawnpoint.usingfallback;
    var_29aed5db4bb4c839 = bestspawnpoint.threatsight;
    var_c4dc16cc4cc64978 = bestspawnpoint.damagemod;
    if (getdvarint(@"hash_6a75d12a6ac65fb3", 0) == 1 || istrue(level.var_e886c825dc0634c0)) {
        fallbackspawnset = undefined;
    }
    if (isdefined(fallbackspawnset) && getspawnsetsize(fallbackspawnset) > 0 && bestspawnpoint.bucket >= 2) {
        activatespawnset(fallbackspawnset, 1);
        /#
            if (scripts/mp/utility/game::getgametype() != "frontline" && scripts/mp/utility/game::getgametype() != "Undefined spawn factor asset in GameTypeBundle for index " && scripts/mp/utility/game::getgametype() != "playerspawnfactorset:" && scripts/mp/utility/game::getgametype() != "mp/spawnweights_jup4") {
                scripts/mp/dev::function_847de9fd3b2ff0da(spawnpointset, fallbackspawnset, 1);
            }
        #/
        var_cdcf9f48fa2d305a = getspawnpointfromcode();
        if (isdefined(var_cdcf9f48fa2d305a) && (var_cdcf9f48fa2d305a.bucket < bestspawnpoint.bucket || var_cdcf9f48fa2d305a.totalscore > bestspawnpoint.totalscore)) {
            bestspawnpoint = var_cdcf9f48fa2d305a;
            bestspawnpoint.usingfallback = 1;
            usingfallback = bestspawnpoint.usingfallback;
            var_29aed5db4bb4c839 = bestspawnpoint.threatsight;
            var_c4dc16cc4cc64978 = bestspawnpoint.damagemod;
        }
    }
    if (level.forcebuddyspawn) {
        buddyspawnpoint = scripts/mp/spawnscoring::findbuddyspawn();
        if (isdefined(buddyspawnpoint)) {
            /#
                if (getdvarint(@"hash_f3b498670cb45729", 0) != 0) {
                    if (!isdefined(level.var_952af294bfd228a7["Normal"])) {
                        level.var_952af294bfd228a7["Normal"] = [];
                    }
                    level.var_952af294bfd228a7["Normal"][level.var_952af294bfd228a7["Normal"].size] = buddyspawnpoint;
                }
            #/
            buddyspawnpoint.bucket = 3;
            buddyspawnpoint.usingfallback = usingfallback;
            buddyspawnpoint.threatsight = var_29aed5db4bb4c839;
            buddyspawnpoint.damagemod = var_c4dc16cc4cc64978;
            return buddyspawnpoint;
        }
    }
    if (bestspawnpoint.bucket >= 2) {
        if (istrue(level.var_dec2781e0b09018c) && !istrue(spawningplayer.var_5849bdd2ad415eec)) {
            spawningplayer.var_5849bdd2ad415eec = 1;
            previouslogic = level.spawnglobals.activespawnlogic;
            previouscrit = level.spawnglobals.var_ec3926d151bc9b3d;
            safelogic = getdvar(@"hash_c2e2232e83d7f64f", "AwayFromEnemies");
            safecrit = getdvar(@"hash_f8b577d6d5572673", "Crit_Default");
            setactivespawnlogic(safelogic, safecrit);
            bestspawnpoint = getspawnpoint(spawningplayer, spawnteam, spawnpointset, fallbackspawnset, var_a22bad5fe6fbf86d, spawnparams);
            setactivespawnlogic(previouslogic, previouscrit);
            spawningplayer.var_5849bdd2ad415eec = undefined;
        }
        var_cf9bd39bcb455a12 = getdvarint(@"hash_32e4dc28cdff8ad3", 0) != 1;
        if (var_a22bad5fe6fbf86d >= 3 && !var_cf9bd39bcb455a12) {
            buddyspawnpoint = scripts/mp/spawnscoring::findbuddyspawn();
            if (isdefined(buddyspawnpoint)) {
                scripts/mp/spawnscoring::logbadspawn("Using buddy spawn", spawningplayer);
                /#
                    if (getdvarint(@"hash_f3b498670cb45729", 0) != 0) {
                        if (!isdefined(level.var_952af294bfd228a7["threatsight"])) {
                            level.var_952af294bfd228a7["threatsight"] = [];
                        }
                        level.var_952af294bfd228a7["threatsight"][level.var_952af294bfd228a7["threatsight"].size] = buddyspawnpoint;
                    }
                #/
                buddyspawnpoint.bucket = 3;
                buddyspawnpoint.usingfallback = usingfallback;
                buddyspawnpoint.threatsight = var_29aed5db4bb4c839;
                buddyspawnpoint.damagemod = var_c4dc16cc4cc64978;
                return buddyspawnpoint;
            }
            scripts/mp/spawnscoring::logbadspawn("CANNOT BUDDY SPAWN! Using bad code spawn", spawningplayer);
        }
    }
    if (bestspawnpoint.bucket > 2 && var_a22bad5fe6fbf86d >= 4) {
        if (isdefined(bestspawnpoint.bucket) && bestspawnpoint.bucket == 5) {
            bestspawnpoint = undefined;
        }
        if (!isdefined(bestspawnpoint)) {
            spawnpointlist = scripts/mp/spawnlogic::getteamspawnpoints(spawningplayer.team);
            bestspawnpoint = scripts/mp/spawnlogic::getspawnpoint_random(spawnpointlist);
        }
        if (!isdefined(bestspawnpoint)) {
            bestspawnpoint = getrandomspawnpointfromactivesets();
        }
        if (isdefined(bestspawnpoint)) {
            bestspawnpoint.bucket = 4;
        }
    }
    if (bestspawnpoint.bucket > var_a22bad5fe6fbf86d) {
        /#
            if (getdvarint(@"hash_f3b498670cb45729", 0) != 0) {
                if (!isdefined(level.var_952af294bfd228a7["game_ended"])) {
                    level.var_952af294bfd228a7["game_ended"] = 0;
                }
                level.var_952af294bfd228a7["game_ended"]++;
            }
        #/
        return undefined;
    }
    /#
        if (getdvarint(@"hash_f3b498670cb45729", 0) != 0) {
            if (!isdefined(level.var_952af294bfd228a7[bestspawnpoint.bucket])) {
                level.var_952af294bfd228a7[bestspawnpoint.bucket] = [];
            }
            level.var_952af294bfd228a7[bestspawnpoint.bucket][level.var_952af294bfd228a7[bestspawnpoint.bucket].size] = bestspawnpoint;
        }
    #/
    if (!istrue(level.disablespawncamera) && !istrue(spawningplayer.skipspawncamera) && bestspawnpoint.bucket >= 2 && bestspawnpoint.threatsight < 300) {
        spawningplayer.shouldgetnewspawnpoint = 1;
    }
    return bestspawnpoint;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2115
// Size: 0x9a
function createspawnquerycontext(spawningplayer, team, factorparams) {
    spawncontext = spawnstruct();
    spawncontext.player = spawningplayer;
    spawncontext.team = team;
    spawncontext.time = gettime();
    spawncontext.factorparams = factorparams;
    if (level.teambased) {
        spawncontext.enemyteam = getenemyteams(team)[0];
    } else {
        spawncontext.enemyteam = "none";
    }
    return spawncontext;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b7
// Size: 0x21
function setactivespawnquerycontext(spawncontext) {
    level.spawnglobals.activespawncontext = spawncontext;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21df
// Size: 0x16
function getactivespawnquerycontext() {
    return level.spawnglobals.activespawncontext;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21fd
// Size: 0x16
function clearactivespawnquerycontext() {
    level.spawnglobals.activespawncontext = undefined;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x221a
// Size: 0x1a
function trackhostmigrationend() {
    while (true) {
        self waittill("host_migration_end");
        deactivateallspawnsets();
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x223b
// Size: 0x66
function clearcodefactors() {
    foreach (factorref, factorinfo in level.spawnglobals.factors) {
        registerspawnfactor(factorref, 0);
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22a8
// Size: 0xd8
function registercodefactors(factorweights) {
    if (function_bff229a11ecd1e34()) {
        foreach (struct in factorweights) {
            registerspawnfactor(struct.factor, struct.weight);
        }
    } else {
        foreach (factor, weight in factorweights) {
            registerspawnfactor(factor, weight);
        }
    }
    registerspawnfactor("script", 1);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2387
// Size: 0x62
function function_182c52d5da69684d() {
    foreach (factorref, unused in level.spawnglobals.criticalfactors) {
        function_1e485a1145b721c5(factorref, 0);
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f0
// Size: 0x62
function function_3237e56ca7621667(enabledfactors) {
    foreach (factor in enabledfactors) {
        function_1e485a1145b721c5(factor.factor);
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2459
// Size: 0x3a
function isactivespawnlogic(logictype) {
    if (!isdefined(level.spawnglobals.activespawnlogic)) {
        return false;
    }
    return level.spawnglobals.activespawnlogic == logictype;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249b
// Size: 0x5f0
function setactivespawnlogic(logictype, criticalfactortype, var_7d25b12691ee7cc1) {
    if (!istrue(var_7d25b12691ee7cc1)) {
        logicoverride = getdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_spawnlogic_override"), "");
        if (isdefined(logicoverride) && logicoverride != "") {
            logictype = logicoverride;
        }
        critoverride = getdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_spawnlogic_crit_override"), "");
        if (isdefined(critoverride) && critoverride != "") {
            criticalfactortype = critoverride;
        }
    }
    /#
        newdata = function_bff229a11ecd1e34();
        level.var_e9d31890c07ffffc = "CODE spawn logic enabled" + newdata + "mp_rescue_spawn_defender";
        if (newdata) {
            foreach (set in level.spawnglobals.var_8c5be78fb206a3a6) {
                level.var_e9d31890c07ffffc = level.var_e9d31890c07ffffc + "mp_sd_spawn_defender" + function_3c8848a3a11b2553(set.alias) + "Attacker Spawn was unable to find " + function_3c8848a3a11b2553(default_to(set.factorbundle, "<unknown string>")) + "<unknown string>" + function_3c8848a3a11b2553(default_to(set.criticalbundle, "<unknown string>")) + "<unknown string>";
            }
        }
        level.var_e9d31890c07ffffc = level.var_e9d31890c07ffffc + "<unknown string>" + function_3c8848a3a11b2553(logictype) + "<unknown string>" + default_to(criticalfactortype, "<unknown string>") + "<unknown string>" + default_to(var_7d25b12691ee7cc1, "<unknown string>") + "<unknown string>";
        level.var_e9d31890c07ffffc = level.var_e9d31890c07ffffc + "<unknown string>" + istrue(level.teambased) + "mp_rescue_spawn_defender";
        function_6d8d81caf145f097(level.var_e9d31890c07ffffc);
    #/
    globals = level.spawnglobals;
    globals.logicvariantid = 0;
    globals.activespawnlogic = logictype;
    globals.var_ec3926d151bc9b3d = criticalfactortype;
    globals.activescriptfactors = [];
    if (function_bff229a11ecd1e34()) {
        /#
            assertex(isdefined(globals.var_4c3494e7bacb24a[globals.activespawnlogic]), "setActiveSpawnLogic() attempting to use spawn logic but that type was not found in the gametype asset");
        #/
        foreach (factor in globals.var_4c3494e7bacb24a[logictype].spawnfactors.factors) {
            factorref = factor.factor;
            if (scripts/mp/spawnfactor::isfactorregistered(factorref) && scripts/mp/spawnfactor::isfactorscriptonly(factorref)) {
                factorstruct = spawnstruct();
                factorstruct.func = scripts/mp/spawnfactor::getfactorfunction(factorref);
                factorstruct.paramreflist = scripts/mp/spawnfactor::getfactorparamreflist(factorref);
                factorstruct.weight = factor.weight;
                globals.activescriptfactors[factorref] = factorstruct;
            }
        }
    } else {
        /#
            assertex(isdefined(globals.spawnfactorweights[globals.activespawnlogic]), "setActiveSpawnLogic() attempting to use spawn logic "" + logictype + "" but that type was not found in spawnWeights.csv");
        #/
        foreach (factorref, weight in globals.spawnfactorweights[logictype]) {
            if (scripts/mp/spawnfactor::isfactorregistered(factorref) && scripts/mp/spawnfactor::isfactorscriptonly(factorref)) {
                factorstruct = spawnstruct();
                factorstruct.func = scripts/mp/spawnfactor::getfactorfunction(factorref);
                factorstruct.paramreflist = scripts/mp/spawnfactor::getfactorparamreflist(factorref);
                factorstruct.weight = weight;
                globals.activescriptfactors[factorref] = factorstruct;
            }
        }
    }
    clearcodefactors();
    if (function_bff229a11ecd1e34()) {
        registercodefactors(globals.var_4c3494e7bacb24a[logictype].spawnfactors.factors);
    } else {
        registercodefactors(globals.spawnfactorweights[logictype]);
    }
    function_182c52d5da69684d();
    if (function_bff229a11ecd1e34()) {
        function_3237e56ca7621667(globals.var_4c3494e7bacb24a[logictype].criticalfactors.factors);
        if (function_3e631ca44718151f("respectFrontline")) {
            frontlineinfo = scripts/mp/spawnfactor::getglobalfrontlineinfo();
            if (isdefined(frontlineinfo) && isdefined(frontlineinfo.anchordir) && isdefined(frontlineinfo.primaryanchorpos)) {
                enablefrontlinecriticalfactor(frontlineinfo.anchordir, frontlineinfo.primaryanchorpos);
            } else {
                enablefrontlinecriticalfactor();
            }
        }
    } else {
        function_60120f0efc69fc63();
        if (istrue(globals.criticalfactortypes[criticalfactortype]["frontline"])) {
            frontlineinfo = scripts/mp/spawnfactor::getglobalfrontlineinfo();
            if (isdefined(frontlineinfo) && isdefined(frontlineinfo.anchordir) && isdefined(frontlineinfo.primaryanchorpos)) {
                enablefrontlinecriticalfactor(frontlineinfo.anchordir, frontlineinfo.primaryanchorpos);
            } else {
                enablefrontlinecriticalfactor();
            }
        }
    }
    if (level.teambased) {
        registerspawnteamsmode(1);
        return;
    }
    registerspawnteamsmode(0);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a92
// Size: 0x37
function function_84e52176cce3bd6b(spawnkey, overridekey) {
    if (!isdefined(overridekey)) {
        return false;
    }
    if (overridekey == "") {
        return false;
    }
    if (isdefined(spawnkey) && spawnkey == overridekey) {
        return false;
    }
    return true;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ad1
// Size: 0x7aa
function loadspawnlogicweights() {
    /#
        assertex(!isdefined(level.spawnglobals.spawnfactorweights), "loadSpawnLogicWeights() called twice in one game");
    #/
    level.spawnglobals.spawnfactorweights = [];
    level.spawnglobals.criticalfactortypes = [];
    level.spawnglobals.var_4c3494e7bacb24a = [];
    /#
        level.spawnglobals.var_8c5be78fb206a3a6 = [];
    #/
    if (function_bff229a11ecd1e34()) {
        foreach (index, set in level.gametypebundle.var_7b4496518c2be4e7) {
            validset = 1;
            if (isdefined(set.alias)) {
                alias = function_1823ff50bb28148d(set.alias);
            } else {
                /#
                    assertmsg("Undefined spawn factor alias in GameTypeBundle for index " + index);
                #/
                validset = validset & 0;
            }
            setstruct = spawnstruct();
            if (isdefined(set.factorbundle) && set.factorbundle != %"") {
                setstruct.spawnfactors = getscriptbundle(set.factorbundle);
            } else {
                /#
                    assertmsg("Undefined spawn factor asset in GameTypeBundle for index " + index);
                #/
                validset = validset & 0;
            }
            if (isdefined(set.criticalbundle) && set.criticalbundle != %"") {
                setstruct.criticalfactors = getscriptbundle(set.criticalbundle);
            } else {
                /#
                    assertmsg("Invalid critical factor asset in GameTypeBundle for index " + index);
                #/
                validset = validset & 0;
            }
            if (validset) {
                level.spawnglobals.var_4c3494e7bacb24a[alias] = setstruct;
                /#
                    level.spawnglobals.var_8c5be78fb206a3a6[alias] = set;
                #/
            }
        }
        if (isdefined(level.mapbundle) && isdefined(level.mapbundle.var_f60bfe56c8ed82cc) && level.mapbundle.var_f60bfe56c8ed82cc.size > 0) {
            foreach (override in level.mapbundle.var_f60bfe56c8ed82cc) {
                if (function_84e52176cce3bd6b(level.gametypebundle.var_ae4a67201759ddbe, override.gametypefactorkey)) {
                    continue;
                }
                /#
                    assertex(isdefined(override.alias), "Spawn overrides must contain a valid alias name in the mapinfo.");
                #/
                /#
                    assertex(isdefined(override.factorbundle), "Spawn overrides must contain a valid PlayerSpawnFactorSet scriptbundle name in the mapinfo.");
                #/
                /#
                    assertex(isdefined(override.criticalbundle), "Spawn overrides must contain a valid PlayerSpawnCriticalFactorSet scriptbundle name in the mapinfo.");
                #/
                alias = function_1823ff50bb28148d(override.alias);
                if (isdefined(level.spawnglobals.var_4c3494e7bacb24a[alias])) {
                    if (isdefined(override.factorbundle) && override.factorbundle != %"") {
                        level.spawnglobals.var_4c3494e7bacb24a[alias].spawnfactors = getscriptbundle("playerspawnfactorset:" + override.factorbundle);
                    } else {
                        /#
                            assertmsg("Invalid spawn factor override in mapInfo for alias " + override.alias);
                        #/
                    }
                    if (isdefined(override.criticalbundle) && override.criticalbundle != %"") {
                        level.spawnglobals.var_4c3494e7bacb24a[alias].criticalfactors = getscriptbundle("playerspawncriticalfactorset:" + override.criticalbundle);
                    } else {
                        /#
                            assertmsg("Invalid critical factor override in mapInfo for alias " + override.alias);
                        #/
                    }
                    /#
                        level.spawnglobals.var_8c5be78fb206a3a6[alias] = override;
                    #/
                    break;
                }
            }
        }
        return;
    }
    if (getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        var_10554cc50f831d91 = "mp/spawnweights_t10.csv";
    } else {
        var_10554cc50f831d91 = "mp/spawnweights.csv";
    }
    var_d5c6e7c6d04dd7ee = getdvarint(@"hash_f110558bf1921a5c", 0);
    if (var_d5c6e7c6d04dd7ee > 0) {
        level.disablebuddyspawn = 1;
        switch (var_d5c6e7c6d04dd7ee) {
        case 0:
            break;
        case 1:
            var_10554cc50f831d91 = "mp/spawnweights_jup1";
            break;
        case 2:
            var_10554cc50f831d91 = "mp/spawnweights_jup2";
            break;
        case 3:
            var_10554cc50f831d91 = "mp/spawnweights_jup3";
            break;
        case 4:
            var_10554cc50f831d91 = "mp/spawnweights_jup4";
            break;
        case 5:
            var_10554cc50f831d91 = "mp/spawnweights_jup5";
            break;
        default:
            break;
        }
    }
    row = -1;
    while (true) {
        row++;
        var_883b09c13233feb = tablelookupbyrow(var_10554cc50f831d91, row, 0);
        if (!isdefined(var_883b09c13233feb) || var_883b09c13233feb == "") {
            break;
        }
        factor = tablelookupbyrow(var_10554cc50f831d91, row, 2);
        /#
            assertex(isdefined(factor) && factor != "", "Could not read factor for spawn logic type "" + var_883b09c13233feb + """);
        #/
        factortype = tablelookupbyrow(var_10554cc50f831d91, row, 1);
        /#
            assertex(isdefined(factortype) && factortype != "", "Could not read factorType for spawn logic type "" + var_883b09c13233feb + """);
        #/
        /#
            assertex(factortype == "Normal" || factortype == "Critical", "Unknown Factor Type "" + factortype + "" for factor "" + factor + "" of type "" + var_883b09c13233feb + """);
        #/
        if (factortype == "Normal") {
            if (!isdefined(level.spawnglobals.spawnfactorweights[var_883b09c13233feb])) {
                level.spawnglobals.spawnfactorweights[var_883b09c13233feb] = [];
            }
            /#
                assertex(!isdefined(level.spawnglobals.spawnfactorweights[var_883b09c13233feb][factor]), "spawnweights.csv has factor "" + factor + "" defined twice for "" + var_883b09c13233feb + """);
            #/
            weight = tablelookupbyrow(var_10554cc50f831d91, row, 3);
            /#
                assertex(isdefined(weight) && weight != "", "Could not read weight for spawn logic type "" + var_883b09c13233feb + """);
            #/
            weight = float(weight);
            level.spawnglobals.spawnfactorweights[var_883b09c13233feb][factor] = weight;
            continue;
        }
        if (!isdefined(level.spawnglobals.criticalfactortypes[var_883b09c13233feb])) {
            level.spawnglobals.criticalfactortypes[var_883b09c13233feb] = [];
        }
        /#
            assertex(!isdefined(level.spawnglobals.criticalfactortypes[var_883b09c13233feb][factor]), "spawnweights.csv has factor "" + factor + "" defined twice for "" + var_883b09c13233feb + """);
        #/
        level.spawnglobals.criticalfactortypes[var_883b09c13233feb][factor] = 1;
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3282
// Size: 0x164
function scorespawnpoint(spawnpoint) {
    /#
        assertex(isdefined(level.spawnglobals.activespawnlogic), "Attempting to get a spawn point, but setActiveSpawnLogic() has not been called.");
    #/
    if (function_bff229a11ecd1e34()) {
        foreach (factor, weight in level.spawnglobals.var_4c3494e7bacb24a[level.spawnglobals.activespawnlogic].spawnfactors.factors) {
            scripts/mp/spawnfactor::calculatefactorscore(spawnpoint, factor, weight);
        }
    } else {
        foreach (factor, weight in level.spawnglobals.spawnfactorweights[level.spawnglobals.activespawnlogic]) {
            scripts/mp/spawnfactor::calculatefactorscore(spawnpoint, factor, weight);
        }
    }
    /#
        debugdvar = getdvarint(@"hash_6e7192ebd1ebfe8", -1);
        if (debugdvar == spawnpoint.index || debugdvar == -2) {
            function_4c2c5ecea9fd1e73(spawnpoint);
        }
    #/
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33ed
// Size: 0x7e
function isfactorinuse(factorname) {
    if (function_bff229a11ecd1e34()) {
        return isdefined(level.spawnglobals.var_4c3494e7bacb24a[level.spawnglobals.activespawnlogic].spawnfactors.factors[factorname]);
    }
    return isdefined(level.spawnglobals.spawnfactorweights[level.spawnglobals.activespawnlogic][factorname]);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3473
// Size: 0x9f
function function_3e631ca44718151f(factorname) {
    foreach (factor in level.spawnglobals.var_4c3494e7bacb24a[level.spawnglobals.activespawnlogic].criticalfactors.factors) {
        if (factor.factor == factorname) {
            return true;
        }
    }
    return false;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x351a
// Size: 0xc
function getstartspawnpoints() {
    return level.startspawnpoints;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x352e
// Size: 0x223
function function_386623fc65375fa8(spawnpointents, spawnpointname, allowempty) {
    spawnpoints = [];
    if (isdefined(level.modifiedspawnpoints)) {
        for (index = 0; index < spawnpointents.size; index++) {
            if (checkmodifiedspawnpoint(spawnpointents[index])) {
                continue;
            }
            spawnpoints[spawnpoints.size] = spawnpointents[index];
        }
    } else {
        spawnpoints = spawnpointents;
    }
    if (!spawnpoints.size) {
        if (!istrue(allowempty)) {
            /#
                assertmsg("^1Error: No " + spawnpointname + " spawnpoints found in level!");
            #/
        }
        return [];
    }
    if (!isdefined(level.startspawnpoints)) {
        level.startspawnpoints = [];
    }
    for (index = 0; index < spawnpoints.size; index++) {
        spawnpoints[index] spawnpointinit();
        spawnpoints[index].selected = 0;
        spawnpoints[index].infront = 0;
        level.startspawnpoints[level.startspawnpoints.size] = spawnpoints[index];
    }
    if (level.teambased) {
        foreach (spawnpoint in spawnpoints) {
            spawnpoint.infront = 1;
            forwarddir = anglestoforward(spawnpoint.angles);
            foreach (adjacentspawn in spawnpoints) {
                if (spawnpoint == adjacentspawn) {
                    continue;
                }
                var_a4237dca130ab969 = vectornormalize(adjacentspawn.origin - spawnpoint.origin);
                var_3d7c180940df1bef = vectordot(forwarddir, var_a4237dca130ab969);
                if (var_3d7c180940df1bef > 0.86) {
                    spawnpoint.infront = 0;
                    break;
                }
            }
        }
    }
    return spawnpoints;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3759
// Size: 0x38
function addstartspawnpoints(spawnpointname, allowempty, team) {
    spawnpointents = getspawnpointarray(spawnpointname);
    function_386623fc65375fa8(spawnpointents, spawnpointname, allowempty);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3798
// Size: 0x95
function function_f4882bf77adf2d71(spawnkey, spawnvalue, team, allowempty, isfallback) {
    if (!isdefined(allowempty)) {
        allowempty = 0;
    }
    if (!isdefined(isfallback)) {
        isfallback = 0;
    }
    spawnpointents = getspawnpointarray("mp_spawn_point", spawnkey, spawnvalue);
    arraykey = getspawnpointarraykey("mp_spawn_point", spawnkey, spawnvalue);
    spawnpoints = function_386623fc65375fa8(spawnpointents, arraykey, allowempty);
    if (spawnpoints.size) {
        registerspawnpoints(team, spawnpoints, isfallback);
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3834
// Size: 0x6f
function addspawnpoints(team, spawnpointname, issetoptional, isfallback) {
    if (!isdefined(issetoptional)) {
        issetoptional = 0;
    }
    if (!isdefined(isfallback)) {
        isfallback = 0;
    }
    newspawnpoints = getspawnpointarray(spawnpointname);
    if (!newspawnpoints.size) {
        /#
            assertex(issetoptional, "^1Error: No " + spawnpointname + " spawnpoints found in level!");
        #/
        return;
    }
    registerspawnpoints(team, newspawnpoints, isfallback);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38aa
// Size: 0x89
function function_9328a9c1fc8d2043(spawnkey, spawnvalue, team, issetoptional, isfallback) {
    if (!isdefined(issetoptional)) {
        issetoptional = 0;
    }
    if (!isdefined(isfallback)) {
        isfallback = 0;
    }
    newspawnpoints = getspawnpointarray("mp_spawn_point", spawnkey, spawnvalue);
    if (!newspawnpoints.size) {
        /#
            assertex(issetoptional, "^1Error: No " + getspawnpointarraykey("mp_spawn_point", spawnkey, spawnvalue) + " spawnpoints found in level!");
        #/
        return;
    }
    registerspawnpoints(team, newspawnpoints, isfallback);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x393a
// Size: 0x134
function registerspawnpoints(team, newspawnpoints, isfallback) {
    if (!isdefined(level.spawnpoints)) {
        level.spawnpoints = [];
    }
    if (!isdefined(level.teamspawnpoints[team])) {
        level.teamspawnpoints[team] = [];
    }
    if (!isdefined(level.teamfallbackspawnpoints[team])) {
        level.teamfallbackspawnpoints[team] = [];
    }
    foreach (spawnpoint in newspawnpoints) {
        if (checkmodifiedspawnpoint(spawnpoint)) {
            continue;
        }
        if (!isdefined(spawnpoint.inited)) {
            spawnpoint spawnpointinit();
            level.spawnpoints[level.spawnpoints.size] = spawnpoint;
        }
        if (istrue(isfallback)) {
            level.teamfallbackspawnpoints[team][level.teamfallbackspawnpoints[team].size] = spawnpoint;
            spawnpoint.isfallback = 1;
            continue;
        }
        level.teamspawnpoints[team][level.teamspawnpoints[team].size] = spawnpoint;
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a75
// Size: 0x31e
function spawnpointinit() {
    spawnpoint = self;
    spawnpoint.scriptdata = spawnstruct();
    level.spawnglobals.spawnpointscriptdata[spawnpoint.index] = spawnpoint.scriptdata;
    level.spawnmins = expandmins(level.spawnmins, spawnpoint.origin);
    level.spawnmaxs = expandmaxs(level.spawnmaxs, spawnpoint.origin);
    spawnpoint.forward = anglestoforward(spawnpoint.angles);
    spawnpoint.sighttracepoint = spawnpoint.origin + (0, 0, 50);
    spawnpoint.lastspawntime = gettime();
    spawnpoint.outside = 1;
    spawnpoint.inited = 1;
    spawnpoint.alternates = [];
    spawnpoint.lastscore = [];
    tracecontents = physics_createcontents(["physicscontents_missileclip", "physicscontents_clipshot"]);
    hits = physics_raycast(spawnpoint.sighttracepoint, spawnpoint.sighttracepoint + (0, 0, 1024), tracecontents, [], 0, "physicsquery_any");
    if (hits > 0) {
        startpoint = spawnpoint.sighttracepoint + spawnpoint.forward * 100;
        hits = physics_raycast(startpoint, spawnpoint.sighttracepoint + (0, 0, 1024), tracecontents, [], 0, "physicsquery_any");
        if (hits > 0) {
            spawnpoint.outside = 0;
        }
    }
    if (shoulduseprecomputedlos() || generatinglosdata()) {
        spawnpoint.radiuspathnodes = getradiuspathsighttestnodes(spawnpoint.origin);
        /#
            if (spawnpoint.radiuspathnodes.size <= 0) {
                println("<unknown string>" + spawnpoint.index + "<unknown string>");
            }
        #/
    }
    spawnpoint.lanemask = 0;
    spawnpoint.lanes = [];
    foreach (lanetrigger in level.spawnglobals.lanetriggers) {
        if (ispointinvolume(spawnpoint.origin, lanetrigger)) {
            spawnpoint.lanemask = spawnpoint.lanemask | lanetrigger.indexflag;
            spawnpoint.lanes[spawnpoint.lanes.size] = lanetrigger.index;
        }
    }
    initspawnpointvalues(spawnpoint);
    loginitialspawnposition(spawnpoint);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d9a
// Size: 0x47
function getspawnpointarraykey(classname, key, value) {
    arraykey = classname;
    if (isdefined(key) && isdefined(value)) {
        arraykey = arraykey + "." + key + "." + value;
    }
    return arraykey;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3de9
// Size: 0x13c
function function_32d25b070a9516de(spawnpointlist) {
    returnarray = [];
    if (isdefined(scripts/cp_mp/utility/game_utility::getlocaleid())) {
        targetnoteworthy = level.localeid;
        foreach (spawnpoint in spawnpointlist) {
            if (checkmodifiedspawnpoint(spawnpoint)) {
                continue;
            }
            if (isdefined(spawnpoint.script_noteworthy) && spawnpoint.script_noteworthy == targetnoteworthy) {
                returnarray[returnarray.size] = spawnpoint;
            }
        }
        if (returnarray.size == 0) {
            returnarray = spawnpointlist;
        }
    } else {
        foreach (spawnpoint in spawnpointlist) {
            if (checkmodifiedspawnpoint(spawnpoint)) {
                continue;
            }
            if (isdefined(spawnpoint.script_noteworthy)) {
                if (issubstr(spawnpoint.script_noteworthy, "locale")) {
                    continue;
                }
            }
            returnarray[returnarray.size] = spawnpoint;
        }
    }
    return returnarray;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f2d
// Size: 0xa0
function getspawnpointarray(classname, key, value) {
    if (!isdefined(level.spawnpointarray)) {
        level.spawnpointarray = [];
    }
    arraykey = getspawnpointarraykey(classname, key, value);
    if (!isdefined(level.spawnpointarray[arraykey])) {
        var_fc32063c5b6bd8a8 = [];
        if (isdefined(key) && isdefined(value)) {
            var_fc32063c5b6bd8a8 = getspawnarray(classname, key, value);
        } else {
            var_fc32063c5b6bd8a8 = getspawnarray(classname);
        }
        level.spawnpointarray[arraykey] = function_32d25b070a9516de(var_fc32063c5b6bd8a8);
    }
    return level.spawnpointarray[arraykey];
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fd5
// Size: 0x21
function function_5cb7f8468d3b9fe0(key, value) {
    return getspawnpointarray("mp_spawn_point", key, value);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ffe
// Size: 0x134
function getspawnpointfromcode() {
    spawnpoint = self getspawnpointforplayer();
    if (isdefined(spawnpoint)) {
        spawnpoint.bucket = getspawnbucketfromstring(spawnpoint.score);
        spawnpoint.isbadspawn = spawnpoint.score == "bad";
    } else {
        spawnpoint = spawnstruct();
        spawnpoint.bucket = 5;
        spawnpoint.isbadspawn = 1;
        /#
            assertmsg("No spawn point returned from code");
        #/
    }
    dlog_recordevent("mp_spawn_event", ["score", spawnpoint.score, "threatsight", spawnpoint.threatsight, "totalscore", spawnpoint.totalscore, "spawnx", spawnpoint.origin[0], "spawny", spawnpoint.origin[1], "spawnz", spawnpoint.origin[2]]);
    logcodefrontlineupdate(spawnpoint);
    return spawnpoint;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x413a
// Size: 0xbb
function logcodefrontlineupdate(spawnpoint) {
    if (scripts/mp/matchrecording::matchrecording_isenabled()) {
        if (istrue(spawnpoint.frontlineenabled)) {
            var_86af21ba2c8d7509 = ter_op(self.team == "allies", spawnpoint.frontlineused, 1);
            var_53360ee7221c1a96 = ter_op(self.team == "axis", spawnpoint.frontlineused, 1);
            frontlinedir = rotatevector(spawnpoint.frontlinedir, (0, 90, 0));
            scripts/mp/spawnfactor::logfrontlinetomatchrecording(spawnpoint.frontlinepos, frontlinedir, var_86af21ba2c8d7509, var_53360ee7221c1a96);
        }
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41fc
// Size: 0xa4
function getspawnpoint_random(spawnpoints) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    randomspawnpoint = undefined;
    spawnpoints = scripts/mp/spawnscoring::checkdynamicspawns(spawnpoints);
    spawnpoints = array_randomize(spawnpoints);
    foreach (spawnpoint in spawnpoints) {
        randomspawnpoint = spawnpoint;
        if (canspawn(randomspawnpoint.origin) && !positionwouldtelefrag(randomspawnpoint.origin)) {
            break;
        }
    }
    return randomspawnpoint;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42a8
// Size: 0xd8
function getspawnpoint_startspawn(spawnpoints, onlyunselected) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    bestspawn = undefined;
    spawnpoints = scripts/mp/spawnscoring::checkdynamicspawns(spawnpoints);
    foreach (spawnpoint in spawnpoints) {
        if (!isdefined(spawnpoint.selected)) {
            continue;
        }
        if (spawnpoint.selected) {
            continue;
        }
        if (spawnpoint.infront) {
            bestspawn = spawnpoint;
            break;
        }
        bestspawn = spawnpoint;
    }
    if (!isdefined(bestspawn)) {
        if (istrue(onlyunselected)) {
            return undefined;
        }
        bestspawn = getspawnpoint_random(spawnpoints);
    }
    if (isdefined(bestspawn)) {
        bestspawn.selected = 1;
    }
    return bestspawn;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4388
// Size: 0x29
function trackcarepackages() {
    while (true) {
        level.carepackages = getentarray("care_package", "targetname");
        wait(0.05);
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43b8
// Size: 0x17
function getteamspawnpoints(team) {
    return level.teamspawnpoints[team];
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43d7
// Size: 0x17
function getteamfallbackspawnpoints(team) {
    return level.teamfallbackspawnpoints[team];
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43f6
// Size: 0x2a
function ispathdataavailable() {
    if (!isdefined(level.pathdataavailable)) {
        level.pathdataavailable = getnodecount() > 150;
    }
    return level.pathdataavailable;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4428
// Size: 0x1e8
function spawnpointupdate() {
    while (!isdefined(level.spawnpoints) || level.spawnpoints.size == 0) {
        waitframe();
    }
    /#
        setdevdvarifuninitialized(@"hash_3c88de2237eb6f6d", "<unknown string>");
    #/
    var_e26a5c5b0c618e49 = generatinglosdata();
    if (shoulduseprecomputedlos() || var_e26a5c5b0c618e49) {
        if (var_e26a5c5b0c618e49) {
            wait(1);
            allentities = getentarray();
            foreach (entity in allentities) {
                if (isdefined(entity.classname) && entity.classname == "script_brushmodel" && entity.spawnflags & 1) {
                    entity connectpaths();
                }
                if (isdefined(entity.targetname) && entity.targetname == "dynamic_door") {
                    entity delete();
                }
            }
            waitframe();
        }
        spawnpointnodes = [];
        if (level.spawnpoints.size == 0) {
            error("Spawn System Failure. No Spawnpoints found.");
        }
        for (index = 0; index < level.spawnpoints.size; index++) {
            for (innerindex = 0; innerindex < level.spawnpoints[index].radiuspathnodes.size; innerindex++) {
                spawnpointnodes[spawnpointnodes.size] = level.spawnpoints[index].radiuspathnodes[innerindex];
            }
        }
        cachespawnpathnodesincode(spawnpointnodes);
    }
    /#
        while (true) {
            level.forcebuddyspawn = getdvarint(@"hash_3c88de2237eb6f6d") > 0;
            wait(0.25);
        }
    #/
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4617
// Size: 0x144
function getactiveplayerlist() {
    var_d4d7a55bc1e8f68e = [];
    foreach (character in level.characters) {
        if (!isreallyalive(character)) {
            continue;
        }
        if (isplayer(character)) {
            if (character.sessionstate != "playing") {
                continue;
            }
            if (!character val::get("player_for_spawn_logic")) {
                continue;
            }
        }
        character.spawnlogicteam = getspawnteam(character);
        if (character.spawnlogicteam == "spectator") {
            continue;
        }
        if (isagent(character) && character.agent_type == "seeker") {
            continue;
        }
        spawnlogictraceheight = getplayertraceheight(character);
        spawntracelocation = character geteye();
        spawntracelocation = (spawntracelocation[0], spawntracelocation[1], character.origin[2] + spawnlogictraceheight);
        character.spawnlogictraceheight = spawnlogictraceheight;
        character.spawntracelocation = spawntracelocation;
        var_d4d7a55bc1e8f68e[var_d4d7a55bc1e8f68e.size] = character;
    }
    return var_d4d7a55bc1e8f68e;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4763
// Size: 0x13
function addspawnviewer(entity) {
    entity registerentityspawnviewer();
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x477d
// Size: 0x13
function removespawnviewer(entity) {
    entity clearentityspawnviewer();
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4797
// Size: 0x68
function addspawndangerzone(pos, radius, height, friendlyteam, lifetime, playerowner, var_d4a6ace0dec22bae, parentent, var_41171640c23ae1c1, manualcleanup) {
    return influencepoint_add(pos, radius, height, friendlyteam, lifetime, playerowner, var_d4a6ace0dec22bae, parentent, var_41171640c23ae1c1, manualcleanup);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4807
// Size: 0x14
function removespawndangerzone(handle) {
    influencepoint_remove(handle);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4822
// Size: 0x13
function isspawndangerzonealive(handle) {
    return influencepoint_isscripthandlevalid(handle);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x483d
// Size: 0x6
function getdefaultminedangerzoneradiussize() {
    return 350;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x484b
// Size: 0x10e
function influencepoint_add(pos, radius, height, friendlyteam, lifetime, playerowner, var_f0022422dc721463, parentent, var_41171640c23ae1c1, manualcleanup) {
    if (!isdefined(friendlyteam) && isdefined(playerowner)) {
        friendlyteam = playerowner.team;
    }
    codehandle = undefined;
    if (isdefined(playerowner)) {
        if (isdefined(var_f0022422dc721463)) {
            codehandle = createspawninfluencepoint(pos, radius, height, friendlyteam, playerowner, var_f0022422dc721463);
        } else {
            codehandle = createspawninfluencepoint(pos, radius, height, friendlyteam, playerowner);
        }
    } else {
        codehandle = createspawninfluencepoint(pos, radius, height, friendlyteam);
    }
    /#
        assertex(isdefined(codehandle), "CreateSpawnInfluencePoint() failed to create influence point");
    #/
    if (!isdefined(codehandle)) {
        return;
    }
    scripthandle = influencepoint_getnewscripthandle(codehandle);
    /#
        assert(influencepoint_isscripthandlevalid(scripthandle));
    #/
    if (!istrue(manualcleanup)) {
        thread influencepoint_cleanupthink(scripthandle, &removespawndangerzone, parentent, lifetime, var_41171640c23ae1c1);
    }
    return scripthandle;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4961
// Size: 0x42
function influencepoint_remove(scripthandle) {
    /#
        assertex(influencepoint_isscripthandlevalid(scripthandle), "Attempting to remove a spawn influence point that has already been removed");
    #/
    codehandle = influencepoint_getcodehandlefromscripthandle(scripthandle);
    destroyspawninfluencepoint(codehandle);
    influencepoint_invalidatescripthandlesforcodehandle(codehandle);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49aa
// Size: 0x7d
function influencepoint_getnewscripthandle(codehandle) {
    spawnglobals = level.spawnglobals;
    /#
        assert(codehandle < 65536 - 1);
    #/
    if (!isdefined(spawnglobals.influencenodealloccounts[codehandle])) {
        spawnglobals.influencenodealloccounts[codehandle] = 0;
    }
    alloccount = spawnglobals.influencenodealloccounts[codehandle];
    scripthandle = alloccount << 16 | codehandle;
    return scripthandle;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a2f
// Size: 0x65
function influencepoint_invalidatescripthandlesforcodehandle(codehandle) {
    spawnglobals = level.spawnglobals;
    spawnglobals.influencenodealloccounts[codehandle]++;
    alloccount = spawnglobals.influencenodealloccounts[codehandle];
    if (alloccount >= 65536 - 1) {
        alloccount = 0;
        spawnglobals.influencenodealloccounts[codehandle] = 0;
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a9b
// Size: 0x16
function influencepoint_getcodehandlefromscripthandle(scripthandle) {
    return scripthandle & 65536 - 1;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ab9
// Size: 0x10
function influencepoint_getalloccountfromscripthandle(scripthandle) {
    return scripthandle >> 16;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ad1
// Size: 0x65
function influencepoint_isscripthandlevalid(scripthandle) {
    spawnglobals = level.spawnglobals;
    var_80420be8a5b2f86b = influencepoint_getalloccountfromscripthandle(scripthandle);
    codehandle = influencepoint_getcodehandlefromscripthandle(scripthandle);
    alloccount = spawnglobals.influencenodealloccounts[codehandle];
    return isdefined(alloccount) && var_80420be8a5b2f86b == alloccount;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b3e
// Size: 0xa2
function influencepoint_cleanupthink(handle, removalfunc, owner, lifetime, removeondeath) {
    level endon("game_ended");
    endons = [];
    if (isdefined(removeondeath)) {
        endons[endons.size] = "death";
    }
    /#
        assertex(isdefined(owner) || endons.size == 0, "spawnInfluencePoint set to remove on a notify, but has no owner");
    #/
    if (isdefined(lifetime)) {
        if (endons.size > 0) {
            owner waittill_any_in_array_or_timeout_no_endon_death(endons, lifetime);
        } else {
            wait(lifetime);
        }
    } else if (isdefined(owner)) {
        owner waittill_any_in_array_return(endons);
    }
    if (!influencepoint_isscripthandlevalid(handle)) {
        return;
    }
    [[ removalfunc ]](handle);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4be7
// Size: 0x195
function updatespawnviewers() {
    level.spawnviewers = getactiveplayerlist();
    /#
        level.spawnviewersupdatetime = gettime();
        thread function_9ab26c0d48173ab1();
    #/
    foreach (viewer in level.spawnviewers) {
        viewer.spawnviewpathnodes = undefined;
    }
    foreach (turret in level.turrets) {
        if (!isdefined(turret)) {
            continue;
        }
        turret.spawnlogicteam = getspawnteam(turret);
        level.spawnviewers[level.spawnviewers.size] = turret;
        turret.spawnviewpathnodes = undefined;
    }
    foreach (ugv in level.ugvs) {
        if (!isdefined(ugv)) {
            continue;
        }
        ugv.spawnlogicteam = getspawnteam(ugv);
        level.spawnviewers[level.spawnviewers.size] = ugv;
        ugv.spawnviewpathnodes = undefined;
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d83
// Size: 0x20
function arespawnviewersvalid() {
    return isdefined(level.spawnviewersupdatetime) && level.spawnviewersupdatetime == gettime();
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4dab
// Size: 0x11
function function_9ab26c0d48173ab1() {
    /#
        waitframe();
        level.spawnviewers = undefined;
    #/
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dc3
// Size: 0x28f
function logspawnpointsightupdate(spawnpoint, team) {
    if (istrue(spawnpoint.buddyspawn) || istrue(spawnpoint.isdynamicspawn)) {
        return;
    }
    if (isdefined(level.matchrecording_logevent)) {
        if (isdefined(level.matchrecording_generateid) && !isdefined(spawnpoint.logid)) {
            spawnpoint.logid = [[ level.matchrecording_generateid ]]();
        }
        if (isdefined(spawnpoint.logid)) {
            statevalue = 3;
            if (level.teambased) {
                allieson = 1;
                axison = 1;
                if (team == "allies") {
                    /#
                        assert(spawnpoint.hassightdata["allies"]);
                    #/
                    allieson = spawnpoint.logspawndisabled["allies"] == 0;
                    var_a0804401f03be2f4 = isdefined(spawnpoint.loggedstate) && (spawnpoint.loggedstate == 0 || spawnpoint.loggedstate == 2);
                    axison = ter_op(isdefined(spawnpoint.loggedstate), var_a0804401f03be2f4, 0);
                } else {
                    /#
                        assert(spawnpoint.hassightdata["axis"]);
                    #/
                    axison = spawnpoint.logspawndisabled["axis"] == 0;
                    var_9c34cf8271074603 = isdefined(spawnpoint.loggedstate) && (spawnpoint.loggedstate == 0 || spawnpoint.loggedstate == 1);
                    allieson = ter_op(isdefined(spawnpoint.loggedstate), var_9c34cf8271074603, 0);
                }
                if (allieson && axison) {
                    statevalue = 0;
                } else if (allieson) {
                    statevalue = 1;
                } else if (axison) {
                    statevalue = 2;
                }
            } else {
                /#
                    assert(spawnpoint.hassightdata["all"]);
                #/
                statevalue = ter_op(spawnpoint.fullsights["all"] == 0, 0, 3);
            }
            if (!isdefined(spawnpoint.loggedstate) || spawnpoint.loggedstate != statevalue) {
                [[ level.matchrecording_logevent ]](spawnpoint.logid, "allies", "SPAWN_ENTITY", spawnpoint.origin[0], spawnpoint.origin[1], gettime(), statevalue);
                spawnpoint.loggedstate = statevalue;
            }
        }
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5059
// Size: 0xdc
function loginitialspawnposition(spawnpoint) {
    if (istrue(spawnpoint.buddyspawn) || istrue(spawnpoint.isdynamicspawn)) {
        return;
    }
    if (isdefined(level.matchrecording_logevent)) {
        if (isdefined(level.matchrecording_generateid) && !isdefined(spawnpoint.logid)) {
            spawnpoint.logid = [[ level.matchrecording_generateid ]]();
        }
        if (isdefined(spawnpoint.logid) && !isdefined(spawnpoint.didinitiallog)) {
            [[ level.matchrecording_logevent ]](spawnpoint.logid, "allies", "SPAWN_ENTITY", spawnpoint.origin[0], spawnpoint.origin[1], gettime(), 0);
            spawnpoint.didinitiallog = 1;
        }
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x513c
// Size: 0x1ae
function spawnpointdistanceupdate(spawnpoint) {
    /#
        assert(arespawnviewersvalid());
    #/
    if (isdefined(spawnpoint) && isdefined(spawnpoint.mindistsquared)) {
        foreach (player in level.spawnviewers) {
            distsquared = distancesquared(player.origin, spawnpoint.origin);
            if (isdefined(spawnpoint.mindistsquared[player.spawnlogicteam])) {
                if (distsquared < spawnpoint.mindistsquared[player.spawnlogicteam]) {
                    spawnpoint.mindistsquared[player.spawnlogicteam] = distsquared;
                }
                if (player.spawnlogicteam == "spectator") {
                    continue;
                }
                spawnpoint.distsumsquared[player.spawnlogicteam] = spawnpoint.distsumsquared[player.spawnlogicteam] + distsquared;
                spawnpoint.distsumsquaredcapped[player.spawnlogicteam] = spawnpoint.distsumsquaredcapped[player.spawnlogicteam] + min(distsquared, scripts/mp/spawnfactor::maxplayerspawninfluencedistsquared());
                spawnpoint.totalplayers[player.spawnlogicteam]++;
            }
        }
        spawnpoint.hasdistdata = 1;
        return;
    }
    /#
        assertmsg("SpawnPoint is undefined for SpawnPointDistanceUpdate");
    #/
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52f1
// Size: 0x36
function getspawnteam(ent) {
    team = "all";
    if (level.teambased) {
        team = ent.team;
    }
    return team;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x532f
// Size: 0x24
function initspawnpointvalues(spawnpoint) {
    clearspawnpointsightdata(spawnpoint);
    clearspawnpointdistancedata(spawnpoint);
    function_32368b70c6aa5729(spawnpoint);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x535a
// Size: 0x7e
function clearspawnpointsightdata(spawnpoint) {
    if (level.teambased) {
        foreach (teamname in level.teamnamelist) {
            clearteamspawnpointsightdata(spawnpoint, teamname);
        }
        return;
    }
    clearteamspawnpointsightdata(spawnpoint, "all");
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53df
// Size: 0xc
function setupplayerspawnsightdata(player) {
    
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53f2
// Size: 0x7e
function clearspawnpointdistancedata(spawnpoint) {
    if (level.teambased) {
        foreach (teamname in level.teamnamelist) {
            clearteamspawnpointdistancedata(spawnpoint, teamname);
        }
        return;
    }
    clearteamspawnpointdistancedata(spawnpoint, "all");
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5477
// Size: 0x76
function clearteamspawnpointsightdata(spawnpoint, team) {
    spawnpoint.hassightdata[team] = 0;
    spawnpoint.fullsights[team] = 0;
    spawnpoint.cornersights[team] = 0;
    spawnpoint.logspawndisabled[team] = 0;
    spawnpoint.maxsightvalue[team] = 0;
    spawnpoint.maxjumpsightvalue[team] = 0;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54f4
// Size: 0x61
function clearteamspawnpointdistancedata(spawnpoint, team) {
    spawnpoint.hasdistdata = 0;
    spawnpoint.distsumsquared[team] = 0;
    spawnpoint.distsumsquaredcapped[team] = 0;
    spawnpoint.mindistsquared[team] = 9999999;
    spawnpoint.totalplayers[team] = 0;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x555c
// Size: 0x4e
function getplayertraceheight(player, var_de6e84bcd0dd9094) {
    if (isdefined(var_de6e84bcd0dd9094) && var_de6e84bcd0dd9094) {
        return 64;
    }
    stance = player getstance();
    if (stance == "stand") {
        return 64;
    }
    if (stance == "crouch") {
        return 44;
    }
    return 32;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x55b2
// Size: 0x114
function additionalsighttraceentities(spawnpoint, entarray) {
    foreach (ent in entarray) {
        if (!isdefined(ent)) {
            continue;
        }
        team = getspawnteam(ent);
        if (spawnpoint.fullsights[team]) {
            continue;
        }
        spawnpoint.hassightdata[team] = 1;
        enttracepoint = ent.origin + (0, 0, 50);
        sightvalue = 0;
        if (!sightvalue) {
            sightvalue = spawnsighttrace(spawnpoint, spawnpoint.sighttracepoint, enttracepoint);
        }
        if (!sightvalue) {
            continue;
        }
        if (sightvalue > 0.95) {
            spawnpoint.fullsights[team]++;
            continue;
        }
        spawnpoint.cornersights[team]++;
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56cd
// Size: 0x173
function finalizespawnpointchoice(spawnpoint) {
    if (!isplayer(self)) {
        return;
    }
    time = gettime();
    self.lastspawnpoint = spawnpoint;
    self.lastspawntime = time;
    spawnpoint.lastspawntime = time;
    spawnpoint.lastspawnteam = self.team;
    if (!isdefined(spawnpoint.bucket)) {
        self finalizespawnpointchoiceforplayer(spawnpoint.index);
    } else {
        if (!isdefined(spawnpoint.usingfallback)) {
            spawnpoint.usingfallback = 0;
        }
        if (!isdefined(spawnpoint.threatsight)) {
            spawnpoint.threatsight = -1;
        }
        if (!isdefined(spawnpoint.damagemod)) {
            spawnpoint.damagemod = -1;
        }
        self finalizespawnpointchoiceforplayer(spawnpoint.index, spawnpoint.bucket, spawnpoint.usingfallback, spawnpoint.threatsight, spawnpoint.damagemod);
    }
    scriptdata = level.spawnglobals.spawnpointscriptdata[spawnpoint.index];
    if (isdefined(scriptdata)) {
        scriptdata.used = 1;
    }
    level.spawnglobals.lastteamspawnpoints[self.team] = spawnpoint;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5847
// Size: 0x81
function expandspawnpointbounds(classname) {
    spawnpoints = getspawnpointarray(classname);
    for (index = 0; index < spawnpoints.size; index++) {
        level.spawnmins = expandmins(level.spawnmins, spawnpoints[index].origin);
        level.spawnmaxs = expandmaxs(level.spawnmaxs, spawnpoints[index].origin);
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58cf
// Size: 0x7f
function expandmins(mins, point) {
    if (mins == (0, 0, 0) && isdefined(point)) {
        mins = point;
    } else {
        if (mins[0] > point[0]) {
            mins = (point[0], mins[1], mins[2]);
        }
        if (mins[1] > point[1]) {
            mins = (mins[0], point[1], mins[2]);
        }
        if (mins[2] > point[2]) {
            mins = (mins[0], mins[1], point[2]);
        }
    }
    return mins;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5956
// Size: 0x61
function expandmaxs(maxs, point) {
    if (maxs[0] < point[0]) {
        maxs = (point[0], maxs[1], maxs[2]);
    }
    if (maxs[1] < point[1]) {
        maxs = (maxs[0], point[1], maxs[2]);
    }
    if (maxs[2] < point[2]) {
        maxs = (maxs[0], maxs[1], point[2]);
    }
    return maxs;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59bf
// Size: 0x7b
function findboxcenter(mins, maxs) {
    center = (0, 0, 0);
    centeroverride = getstruct("map_center_override", "targetname");
    if (isdefined(centeroverride)) {
        center = centeroverride.origin;
    } else {
        center = maxs - mins;
        center = (center[0] / 2, center[1] / 2, center[2] / 2) + mins;
    }
    return center;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a42
// Size: 0x7a
function setmapcenterfordev() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    scripts/mp/spawnlogic::expandspawnpointbounds("mp_tdm_spawn_allies_start");
    scripts/mp/spawnlogic::expandspawnpointbounds("mp_tdm_spawn_axis_start");
    level.mapcenter = scripts/mp/spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ac3
// Size: 0x7e
function shoulduseteamstartspawn() {
    if (getdvarint(@"hash_8ba7b3d0520775da", 0) == 1) {
        return true;
    }
    if (!scripts/mp/flags::gameflag("prematch_done") && isdefined(game["infil"]) && !scripts/mp/flags::gameflag("infil_started")) {
        return true;
    }
    if (istrue(level.disableteamstartspawns)) {
        return false;
    }
    return level.ingraceperiod && (!isdefined(level.numkills) || level.numkills == 0);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b49
// Size: 0x54
function getpathsighttestnodes(pos, bclose) {
    if (bclose) {
        mindist = 0;
        maxdist = getclosenoderadiusdist();
    } else {
        mindist = getclosenoderadiusdist();
        maxdist = 250;
    }
    return getnodesinradius(pos, maxdist, mindist, 512, "path");
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ba5
// Size: 0x6a
function getradiuspathsighttestnodes(pos) {
    nodelist = [];
    singlenode = getclosestnodeinsight(pos);
    if (isdefined(singlenode)) {
        nodelist[0] = singlenode;
    }
    if (!isdefined(singlenode)) {
        nodelist = getnodesinradius(pos, getclosenoderadiusdist(), 0, 256, "path");
        if (nodelist.size == 0) {
            nodelist = getnodesinradius(pos, 250, 0, 256, "path");
        }
    }
    return nodelist;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c17
// Size: 0x3f0
function evaluateprecomputedlos(spawnpoint, team) {
    checkttlosloaded();
    enemyteam = "all";
    if (level.teambased) {
        enemyteam = getenemyteams(team)[0];
    }
    if (!shoulduseprecomputedlos()) {
        spawnpoint.hassightdata[enemyteam] = 1;
        return;
    }
    /#
        assert(isttlosdataavailable());
    #/
    lowerlimitfullsights = 0.95;
    lowerlimitcornersights = 0;
    sightvalue = undefined;
    var_8ad95653a95ea1c3 = undefined;
    lowerlimitfullsights = level.spawnglobals.lowerlimitfullsights;
    lowerlimitcornersights = level.spawnglobals.lowerlimitcornersights;
    /#
        assert(arespawnviewersvalid());
    #/
    foreach (viewer in level.spawnviewers) {
        if (level.teambased && viewer.spawnlogicteam != enemyteam) {
            continue;
        }
        if (spawnpoint.fullsights[viewer.spawnlogicteam]) {
            break;
        }
        if (!isdefined(viewer.spawnviewpathnodes)) {
            viewer.spawnviewpathnodes = viewer getnearnodelistforspawncheck(getfarnoderadiusdist());
            if (!isdefined(viewer.spawnviewpathnodes) || viewer.spawnviewpathnodes.size == 0) {
                /#
                    viewer.var_cba3632b3172a989 = 1;
                #/
                if (isdefined(level.matchrecording_logeventmsg) && isplayer(viewer)) {
                    if (!isdefined(viewer.lastpathnodewarningtime) || viewer.lastpathnodewarningtime != gettime()) {
                        [[ level.matchrecording_logeventmsg ]]("LOG_GENERIC_MESSAGE", gettime(), "WARNING: Could not use TTLOS data for player " + viewer.name);
                        viewer.lastpathnodewarningtime = gettime();
                    }
                }
            }
        }
        if (isdefined(viewer.spawnviewpathnodes) && viewer.spawnviewpathnodes.size > 0) {
            sightvalues = _precomputedlosdatatest(viewer, spawnpoint);
            sightvalue = sightvalues[0];
            var_8ad95653a95ea1c3 = sightvalues[1];
        }
        if (!isdefined(sightvalue)) {
            tracepos = undefined;
            if (isplayer(viewer)) {
                tracepos = viewer geteye();
            } else {
                tracepos = viewer.origin + (0, 0, 50);
            }
            sightvalue = directlineofsighttest(spawnpoint, viewer, tracepos);
            var_8ad95653a95ea1c3 = sightvalue;
        }
        if (!isdefined(spawnpoint.maxsightvalue[viewer.spawnlogicteam]) || sightvalue > spawnpoint.maxsightvalue[viewer.spawnlogicteam]) {
            spawnpoint.maxsightvalue[viewer.spawnlogicteam] = sightvalue;
        }
        if (isdefined(var_8ad95653a95ea1c3) && isplayer(viewer)) {
            if (!isdefined(spawnpoint.maxjumpsightvalue[viewer.spawnlogicteam]) || var_8ad95653a95ea1c3 > spawnpoint.maxjumpsightvalue[viewer.spawnlogicteam]) {
                spawnpoint.maxjumpsightvalue[viewer.spawnlogicteam] = var_8ad95653a95ea1c3;
            }
        }
        if (sightvalue > lowerlimitfullsights) {
            spawnpoint.fullsights[viewer.spawnlogicteam]++;
            spawnpoint.logspawndisabled[viewer.spawnlogicteam]++;
            continue;
        }
        if (sightvalue > lowerlimitcornersights) {
            spawnpoint.cornersights[viewer.spawnlogicteam]++;
        }
    }
    spawnpoint.hassightdata[enemyteam] = 1;
    logspawnpointsightupdate(spawnpoint, enemyteam);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x600e
// Size: 0x69
function _precomputedlosdatatest(viewer, spawnpoint) {
    sightvalues = checkttlosoverrides(viewer, spawnpoint);
    if (!isdefined(sightvalues)) {
        if (checkttlosdeverrors(viewer, spawnpoint)) {
            return [1, 1];
        }
        sightvalues = precomputedlosdatatest(viewer.spawnviewpathnodes, spawnpoint.radiuspathnodes);
    }
    return sightvalues;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x607f
// Size: 0xf6
function checkttlosdeverrors(viewer, spawnpoint) {
    /#
        errormessage = undefined;
        if (!isdefined(viewer.spawnviewpathnodes) || viewer.spawnviewpathnodes.size == 0) {
            var_4f2dbc4104804300 = ter_op(isplayer(viewer), viewer.name, "<unknown string>");
            errormessage = "<unknown string>" + var_4f2dbc4104804300 + "<unknown string>";
        } else if (!isdefined(spawnpoint.radiuspathnodes) || spawnpoint.radiuspathnodes.size == 0) {
            errormessage = "<unknown string>" + spawnpoint.origin;
        }
        if (isdefined(errormessage)) {
            if (!isdefined(level.var_e660628db2a340a5) || gettime() - level.var_e660628db2a340a5 > 1000) {
                level.var_e660628db2a340a5 = gettime();
                iprintlnbold(errormessage);
            }
            return true;
        }
    #/
    return false;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x617d
// Size: 0x139
function checkttlosoverrides(viewer, spawnpoint) {
    if (!isdefined(level.spawnglobals.ttlosoverrides)) {
        return;
    }
    foreach (var_865d8e40722512eb in viewer.spawnviewpathnodes) {
        var_24ed8518f6fc6e6 = var_865d8e40722512eb getnodenumber();
        if (isdefined(level.spawnglobals.ttlosoverrides[var_24ed8518f6fc6e6])) {
            foreach (spawnnode in spawnpoint.radiuspathnodes) {
                var_7643b53b09bbf1d5 = spawnnode getnodenumber();
                if (isdefined(level.spawnglobals.ttlosoverrides[var_24ed8518f6fc6e6][var_7643b53b09bbf1d5])) {
                    return level.spawnglobals.ttlosoverrides[var_24ed8518f6fc6e6][var_7643b53b09bbf1d5];
                }
            }
        }
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x62bd
// Size: 0x116
function addttlosoverride(nodea, nodeb, var_48c0bd41cc10dfd8, var_84c277514873a859) {
    level endon("game_ended");
    while (true) {
        if (isdefined(level.spawnglobals)) {
            break;
        }
        waitframe();
    }
    if (!isdefined(level.spawnglobals.ttlosoverrides)) {
        level.spawnglobals.ttlosoverrides = [];
    }
    if (!isdefined(level.spawnglobals.ttlosoverrides[nodea])) {
        level.spawnglobals.ttlosoverrides[nodea] = [];
    }
    level.spawnglobals.ttlosoverrides[nodea][nodeb] = [var_48c0bd41cc10dfd8, var_84c277514873a859];
    if (!isdefined(level.spawnglobals.ttlosoverrides[nodeb])) {
        level.spawnglobals.ttlosoverrides[nodeb] = [];
    }
    level.spawnglobals.ttlosoverrides[nodeb][nodea] = [var_48c0bd41cc10dfd8, var_84c277514873a859];
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63da
// Size: 0x5
function getclosenoderadiusdist() {
    return 130;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63e7
// Size: 0x5
function getfarnoderadiusdist() {
    return 250;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63f4
// Size: 0xee
function directlineofsighttest(spawnpoint, viewer, tracepos) {
    raystart = spawnpoint.sighttracepoint;
    rayend = tracepos;
    contents = physics_createcontents(["physicscontents_ainosight"]);
    castresult = physics_raycast(raystart, rayend, contents, viewer, 0, "physicsquery_any");
    /#
        if (getdvarint(@"hash_be68e4c2bcc0ac4c", 0) != 0 || getdvarint(@"hash_9d60ff019dc50c22", 0) != 0) {
            line(raystart, rayend - (0, 0, 16), ter_op(castresult, (1, 0, 0), (0, 1, 0)), 1, 0, 15);
        }
    #/
    return ter_op(castresult, 0, 1);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64ea
// Size: 0x6
function getmaxdistancetolos() {
    return 2550;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64f8
// Size: 0x79
function checkttlosloaded() {
    if (scripts/mp/spawnlogic::shoulduseprecomputedlos() && !scripts/mp/spawnlogic::isttlosdataavailable()) {
        if (isdefined(level.matchrecording_logeventmsg)) {
            [[ level.matchrecording_logeventmsg ]]("LOG_GENERIC_MESSAGE", gettime(), "ERROR: TTLOS System disabled! Could not access visDistData");
        }
        if (!isdefined(level.hasshownvisdistdataerror)) {
            /#
                assertex(isdefined(level.ttlos_suppressasserts), "Attempting to spawn a player using TTLOS data, but VisDistData file isn't loaded!");
            #/
            level.hasshownvisdistdataerror = 1;
        }
        level.disableprecomputedlos = 1;
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6578
// Size: 0x2d
function shoulduseprecomputedlos() {
    return getdvarint(@"hash_d7358339b14a448f", 0) == 1 && !isdefined(level.disableprecomputedlos) && !generatinglosdata();
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65ad
// Size: 0x14
function generatinglosdata() {
    return getdvarint(@"hash_74cacae425805743", 0) > 0;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65c9
// Size: 0x8
function isttlosdataavailable() {
    return getislosdatafileloaded();
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65d9
// Size: 0x188
function printstartupdebugmessages() {
    level waittill("prematch_done");
    if (getdvarint(@"hash_ff689af941dd10a1", 0) == 1 && isdefined(level.players)) {
        foreach (player in level.players) {
            if (player ishost()) {
                if (!shoulduseprecomputedlos()) {
                    player iprintlnbold("TTLOS FAILED TO LOAD!");
                }
                break;
            }
        }
    }
    if (isdefined(level.matchrecording_logeventmsg)) {
        [[ level.matchrecording_logeventmsg ]]("LOG_GENERIC_MESSAGE", gettime(), "Spawn Script Version #" + 6);
        if (shoulduseprecomputedlos()) {
            [[ level.matchrecording_logeventmsg ]]("LOG_GENERIC_MESSAGE", gettime(), "Attempting to use TTLOS Spawning Data...");
        } else {
            [[ level.matchrecording_logeventmsg ]]("LOG_GENERIC_MESSAGE", gettime(), "No TTLOS Data! Not using TTLOS");
        }
        [[ level.matchrecording_logeventmsg ]]("LOG_GENERIC_MESSAGE", gettime(), "CODE spawn logic enabled");
        if (isdefined(level.spawnglobals.activespawnlogic)) {
            [[ level.matchrecording_logeventmsg ]]("LOG_GENERIC_MESSAGE", gettime(), "Spawn Logic: " + level.spawnglobals.activespawnlogic);
            return;
        }
        [[ level.matchrecording_logeventmsg ]]("LOG_GENERIC_MESSAGE", gettime(), "Spawn Logic: None");
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6768
// Size: 0x18
function isfallbackspawn(spawnpoint) {
    return istrue(spawnpoint.isfallback);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6788
// Size: 0x9a
function logextraspawninfothink() {
    if (getdvarint(@"hash_aa3f054d34fa39b9", 0) != 1) {
        return;
    }
    level waittill("prematch_done");
    var_527d4e1d1288232e = undefined;
    var_9c8bbf6433e08edf = undefined;
    if (isdefined(level.matchrecording_generateid)) {
        var_527d4e1d1288232e = [[ level.matchrecording_generateid ]]();
        var_9c8bbf6433e08edf = [[ level.matchrecording_generateid ]]();
    }
    while (true) {
        if (!shoulduseprecomputedlos()) {
            break;
        }
        logextraspawn("allies", var_527d4e1d1288232e);
        wait(0.5);
        logextraspawn("axis", var_9c8bbf6433e08edf);
        wait(0.5);
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6829
// Size: 0xee
function logextraspawn(team, logid) {
    var_a02b612b94f6f669 = spawnstruct();
    var_a02b612b94f6f669.team = team;
    var_a02b612b94f6f669.pers = [];
    var_a02b612b94f6f669.pers["team"] = team;
    var_a02b612b94f6f669.disablespawnwarnings = 1;
    var_a02b612b94f6f669.isdynamicspawn = 1;
    bestspawn = var_a02b612b94f6f669 [[ level.getspawnpoint ]]();
    if (isdefined(level.matchrecording_logevent) && isdefined(bestspawn) && isdefined(logid)) {
        eventname = ter_op(team == "allies", "BEST_SPAWN_ALLIES", "BEST_SPAWN_AXIS");
        [[ level.matchrecording_logevent ]](logid, team, eventname, bestspawn.origin[0], bestspawn.origin[1], gettime());
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x691e
// Size: 0x18
function clearlastteamspawns() {
    level.spawnglobals.lastteamspawnpoints = [];
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x693d
// Size: 0x52
function getoriginidentifierstring(spawnpoint) {
    return int(spawnpoint.origin[0]) + " " + int(spawnpoint.origin[1]) + " " + int(spawnpoint.origin[2]);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6997
// Size: 0x38
function getoriginidentifierstringnoz(spawnpoint) {
    return int(spawnpoint.origin[0]) + " " + int(spawnpoint.origin[1]);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69d7
// Size: 0x2b4
function checkmodifiedspawnpoint(spawnpoint) {
    if (!isdefined(level.modifiedspawnpoints)) {
        return false;
    }
    var_6d071bf9627c7f96 = undefined;
    originstring = getoriginidentifierstring(spawnpoint);
    if (isdefined(level.modifiedspawnpoints[originstring])) {
        var_6d071bf9627c7f96 = level.modifiedspawnpoints[originstring][spawnpoint.classname];
    }
    if (!isdefined(var_6d071bf9627c7f96)) {
        originstring = getoriginidentifierstringnoz(spawnpoint);
        if (isdefined(level.modifiedspawnpoints[originstring])) {
            var_6d071bf9627c7f96 = level.modifiedspawnpoints[originstring][spawnpoint.classname];
        }
    }
    foreach (location, classnamedata in level.modifiedspawnpoints) {
        foreach (classname, removaldata in classnamedata) {
            if (spawnpoint.classname != classname) {
                continue;
            }
            foreach (modifystring, radius in removaldata) {
                if (modifystring == "removeradius") {
                    locstring = strtok(location, " ");
                    x = int(locstring[0]);
                    y = int(locstring[1]);
                    z = 0;
                    if (isdefined(locstring[2])) {
                        z = default_to(int(locstring[2]), 0);
                    }
                    origin = (x, y, z);
                    if (isdefined(locstring[2])) {
                        if (distance(spawnpoint.origin, origin) < radius) {
                            return true;
                        }
                        continue;
                    }
                    if (distance2d(spawnpoint.origin, origin) < radius) {
                        return true;
                    }
                }
            }
        }
    }
    if (!isdefined(var_6d071bf9627c7f96)) {
        return false;
    }
    if (istrue(var_6d071bf9627c7f96["remove"])) {
        return true;
    }
    if (isdefined(var_6d071bf9627c7f96["origin"])) {
        spawnpoint.origin = var_6d071bf9627c7f96["origin"];
    }
    if (isdefined(var_6d071bf9627c7f96["angles"])) {
        spawnpoint.angles = var_6d071bf9627c7f96["angles"];
    }
    if (istrue(var_6d071bf9627c7f96["no_alternates"])) {
        spawnpoint.noalternates = 1;
    }
    return false;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c93
// Size: 0xda
function calculateteamclusters(team) {
    container = spawnstruct();
    container.clusterlist = [];
    foreach (player in level.players) {
        if (!isreallyalive(player) || player.team != team || !player val::get("player_for_spawn_logic")) {
            continue;
        }
        newcluster = createcluster(player);
        container.clusterlist[container.clusterlist.size] = newcluster;
    }
    mergeclusterlist(container);
    return container;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d75
// Size: 0x46
function createcluster(player) {
    cluster = spawnstruct();
    cluster.center = player.origin;
    cluster.players = [player];
    return cluster;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dc3
// Size: 0x25c
function mergeclusterlist(container) {
    var_541b5a167c77648c = undefined;
    var_541b5d167c776b25 = undefined;
    var_14f82e0d331bcd8b = undefined;
    nearestdistsq = -1;
    for (var_a7b44bd189368a72 = 0; var_a7b44bd189368a72 < container.clusterlist.size; var_a7b44bd189368a72++) {
        clustera = container.clusterlist[var_a7b44bd189368a72];
        for (var_a7b44ad18936883f = var_a7b44bd189368a72 + 1; var_a7b44ad18936883f < container.clusterlist.size; var_a7b44ad18936883f++) {
            clusterb = container.clusterlist[var_a7b44ad18936883f];
            distsq = distance2dsquared(clustera.center, clusterb.center);
            if (distsq > 640000) {
                continue;
            }
            if (nearestdistsq < 0 || distsq < nearestdistsq) {
                nearestdistsq = distsq;
                var_541b5a167c77648c = clustera;
                var_541b5d167c776b25 = clusterb;
                var_14f82e0d331bcd8b = var_a7b44ad18936883f;
            }
        }
    }
    if (isdefined(var_541b5a167c77648c) && isdefined(var_541b5d167c776b25)) {
        foreach (player in var_541b5d167c776b25.players) {
            var_541b5a167c77648c.players[var_541b5a167c77648c.players.size] = player;
        }
        var_b7e9316956e86d04 = (0, 0, 0);
        foreach (player in var_541b5a167c77648c.players) {
            var_b7e9316956e86d04 = var_b7e9316956e86d04 + player.origin;
        }
        var_b7e9316956e86d04 = var_b7e9316956e86d04 / var_541b5a167c77648c.players.size;
        var_541b5a167c77648c.center = var_b7e9316956e86d04;
        lastindex = container.clusterlist.size - 1;
        container.clusterlist[var_14f82e0d331bcd8b] = container.clusterlist[lastindex];
        container.clusterlist[lastindex] = undefined;
        mergeclusterlist(container);
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7026
// Size: 0x31
function ignoretriggerenter(player, trigger) {
    if (!isplayer(player)) {
        return;
    }
    player val::set("spawnIgnoreTrigger", "player_for_spawn_logic", 0);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x705e
// Size: 0x2b
function ignoretriggerexit(player, trigger) {
    if (!isplayer(player)) {
        return;
    }
    player val::reset_all("spawnIgnoreTrigger");
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7090
// Size: 0x7e
function getspawnbucketfromstring(var_cbf572b044ed12e0) {
    switch (var_cbf572b044ed12e0) {
    case #"hash_8d30f90f19b8f838":
        return 0;
    case #"hash_fa2adbf6bd65180f":
        return 1;
    case #"hash_21256f6c1b235f58":
        return 2;
    case #"hash_68377d7877ae1c3":
        return 3;
    case #"hash_82dd7c3e206217c2":
        return 4;
    case #"hash_b612ae5499914631":
        return 5;
    }
    /#
        assertmsg("Unknown Spawn Bucket Name");
    #/
    return 2;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7116
// Size: 0x62
function enablespawnpointlist(spawnpoints) {
    foreach (spawnpoint in spawnpoints) {
        enablespawnpointbyindex(spawnpoint.index);
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x717f
// Size: 0x62
function disablespawnpointlist(spawnpoints) {
    foreach (spawnpoint in spawnpoints) {
        disablespawnpointbyindex(spawnpoint.index);
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x71e8
// Size: 0x21
function function_fd739ec45329729e(id) {
    return level.globals.spawnsetlists[id];
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7211
// Size: 0x95
function registerspawnset(id, spawnpoints) {
    globals = level.spawnglobals;
    /#
        assertex(isdefined(globals), "registerSpawnSet() called too early -- call in/after StartGameType() of gamemode.");
    #/
    /#
        assertex(!isdefined(globals.spawnsets[id]), "Trying to register a spawn set with a name that is already used");
    #/
    globals.spawnsets[id] = spawnpoints;
    if (isarray(spawnpoints)) {
        globals.spawnsetlists[id] = spawnpoints;
    } else {
        globals.spawnsetlists[id] = getspawnpointarray(spawnpoints);
    }
    return id;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72ae
// Size: 0x30
function function_8390bf8c3b74466a(id) {
    /#
        globals = level.spawnglobals;
        globals.spawnsets[id] = undefined;
    #/
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72e5
// Size: 0xe2
function activatespawnset(id, exclusive) {
    globals = level.spawnglobals;
    /#
        assertex(isdefined(globals), "registerSpawnSet() called too early -- call in/after StartGameType() of gamemode.");
    #/
    if (istrue(exclusive)) {
        if (globals.activespawnsets.size == 1 && isdefined(globals.activespawnsets[id])) {
            return;
        }
        deactivateallspawnsets();
    } else if (isdefined(globals.activespawnsets[id])) {
        return;
    }
    spawnset = globals.spawnsets[id];
    /#
        assertex(isdefined(spawnset), "activateSpawnSet() can't find spawnSet with ID " + id);
    #/
    if (isarray(spawnset)) {
        enablespawnpointlist(spawnset);
    } else {
        /#
            assert(isstring(spawnset));
        #/
        enablespawnpointsbyclassname(spawnset);
    }
    globals.activespawnsets[id] = 1;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x73ce
// Size: 0xeb
function deactivatespawnset(id) {
    globals = level.spawnglobals;
    /#
        assertex(isdefined(globals), "deactivateSpawnSet() called too early -- call in/after StartGameType() of gamemode.");
    #/
    var_fecf52449f0d8583 = [];
    foreach (key, value in globals.activespawnsets) {
        if (key != id) {
            var_fecf52449f0d8583[key] = 1;
            continue;
        }
        spawnset = globals.spawnsets[id];
        if (isarray(spawnset)) {
            disablespawnpointlist(spawnset);
            continue;
        }
        /#
            assert(isstring(spawnset));
        #/
        disablespawnpointsbyclassname(spawnset);
    }
    globals.activespawnsets = var_fecf52449f0d8583;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74c0
// Size: 0x1e
function deactivateallspawnsets() {
    level.spawnglobals.activespawnsets = [];
    disablespawnpoints();
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74e5
// Size: 0x22
function getspawnsetsize(id) {
    return level.spawnglobals.spawnsetlists[id].size;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x750f
// Size: 0x41
function getrandomspawnpointfromset(id) {
    globals = level.spawnglobals;
    return globals.spawnsetlists[id][randomint(globals.spawnsetlists[id].size)];
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7558
// Size: 0x96
function getrandomspawnpointfromactivesets() {
    var_90be334c1c37268a = getarraykeys(level.spawnglobals.activespawnsets);
    for (var_ffed3098c31f4403 = undefined; !isdefined(var_ffed3098c31f4403) && var_90be334c1c37268a.size > 0; var_ffed3098c31f4403 = undefined) {
        var_ffed3098c31f4403 = random(var_90be334c1c37268a);
        if (getspawnsetsize(var_ffed3098c31f4403) <= 0) {
            var_90be334c1c37268a = array_remove(var_90be334c1c37268a, var_ffed3098c31f4403);
        }
    }
    return level.spawnglobals.spawnsetlists[var_ffed3098c31f4403][randomint(level.spawnglobals.spawnsetlists[var_ffed3098c31f4403].size)];
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x75f6
// Size: 0x186
function updatedebughud() {
    /#
        var_e582e1172dddb3dd = 0;
        while (true) {
            if (getdvarint(@"hash_2889bd5801e0ce5a", 0) != 0) {
                printtoscreen2d(1425, 875, "<unknown string>", (0, 1, 0), 2);
                if (shoulduseprecomputedlos()) {
                    printtoscreen2d(1425, 900, "<unknown string>", (0, 1, 0), 2);
                } else {
                    printtoscreen2d(1425, 900, "<unknown string>", (1, 0, 0), 2);
                }
            }
            foreach (player in level.players) {
                var_6fec14662c9a94b9 = isdefined(player.var_cba3632b3172a989) && player.var_cba3632b3172a989;
                var_6d453b4d602809fa = isdefined(player.var_40148273e8ddc816) && player.var_40148273e8ddc816;
                if (var_6fec14662c9a94b9 != var_6d453b4d602809fa) {
                    player.var_40148273e8ddc816 = var_6fec14662c9a94b9;
                    if (var_6fec14662c9a94b9) {
                        iprintlnbold("<unknown string>" + player.origin);
                    }
                }
                if (var_6fec14662c9a94b9) {
                    printtoscreen2d(1425, 925, "<unknown string>", (1, 0, 0), 2);
                }
            }
            waitframe();
        }
    #/
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7783
// Size: 0xd8
function function_4c2c5ecea9fd1e73(spawnpoint) {
    /#
        println("<unknown string>" + spawnpoint.index + "<unknown string>");
        println("<unknown string>" + spawnpoint.totalscore);
        println("<unknown string>" + spawnpoint.totalpossiblescore);
        foreach (factorname, score in spawnpoint.debugscoredata) {
            println("<unknown string>" + factorname + "<unknown string>" + score + "<unknown string>" + spawnpoint.var_6531ac2ff1a37628[factorname] + "<unknown string>");
        }
    #/
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7862
// Size: 0x62
function function_50a59d95bac1964e() {
    /#
        foreach (spawnpoint in level.spawnpoints) {
            initspawnpointvalues(spawnpoint);
        }
        scripts/mp/spawnscoring::resetperupdatespawnglobals();
    #/
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x78cb
// Size: 0x12a
function function_d344bbcacf5e4d96(factorref, factorstruct, spawncontext) {
    /#
        if (!isdefined(spawncontext.factorparams)) {
            /#
                assertmsg("<unknown string>" + function_3c8848a3a11b2553(factorref) + "<unknown string>");
            #/
        }
        outputparams = [];
        foreach (paramref in factorstruct.paramreflist) {
            foreach (var_8437e2a35e8d84c9, var_19b8bfffd5a5cbad in spawncontext.factorparams) {
                if (var_8437e2a35e8d84c9 == paramref) {
                    outputparams[paramref] = var_19b8bfffd5a5cbad;
                    break;
                }
            }
            /#
                assertex(isdefined(outputparams[paramref]), "<unknown string>" + factorref + "<unknown string>" + function_3c8848a3a11b2553(paramref) + "<unknown string>");
            #/
        }
    #/
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79fc
// Size: 0x7e
function createscriptedspawnpoint(classname, origin, angles, target, script_noteworthy) {
    spawnpoint = spawnstruct();
    spawnpoint.classname = classname;
    spawnpoint.origin = origin;
    spawnpoint.angles = angles;
    spawnpoint.target = target;
    spawnpoint.script_noteworthy = script_noteworthy;
    return spawnpoint;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a82
// Size: 0x1e5
function addscriptedspawnpoints(var_223764ad899d9fee) {
    if (!isdefined(level.scriptedspawnpointarray)) {
        level.scriptedspawnpointarray = [];
    }
    foreach (scriptedspawnpoint in var_223764ad899d9fee) {
        classname = scriptedspawnpoint.classname;
        origin = scriptedspawnpoint.origin;
        angles = scriptedspawnpoint.angles;
        if (isdefined(scriptedspawnpoint.target)) {
            target = scriptedspawnpoint.target;
        } else {
            target = "";
        }
        if (isdefined(scriptedspawnpoint.script_noteworthy)) {
            script_noteworthy = scriptedspawnpoint.script_noteworthy;
        } else {
            script_noteworthy = "";
        }
        if (!isdefined(level.scriptedspawnpointarray[classname])) {
            level.scriptedspawnpointarray[classname] = [];
        }
        var_f1a1172ed4e53a5d = spawnstruct();
        var_f1a1172ed4e53a5d.classname = classname;
        var_f1a1172ed4e53a5d.origin = origin;
        var_f1a1172ed4e53a5d.angles = angles;
        index = registerscriptedspawnpoints(classname, origin, angles, target, script_noteworthy);
        if (!isdefined(index) || index < 0) {
            continue;
        }
        var_f1a1172ed4e53a5d.index = index;
        if (target != "") {
            var_f1a1172ed4e53a5d.target = target;
        }
        if (script_noteworthy != "") {
            var_f1a1172ed4e53a5d.script_noteworthy = script_noteworthy;
        }
        level.scriptedspawnpointarray[classname][level.scriptedspawnpointarray[classname].size] = var_f1a1172ed4e53a5d;
    }
    level thread scriptedspawnpointsonmigration();
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c6e
// Size: 0x159
function scriptedspawnpointsonmigration() {
    level notify("scriptedSpawnpointsOnMigration");
    level endon("scriptedSpawnpointsOnMigration");
    /#
        assert(isdefined(level.scriptedspawnpointarray));
    #/
    while (true) {
        level waittill("host_migration_begin");
        foreach (var_46a778b6f75c012c in level.scriptedspawnpointarray) {
            foreach (scriptedspawnpoint in var_46a778b6f75c012c) {
                if (isdefined(scriptedspawnpoint.target)) {
                    target = scriptedspawnpoint.target;
                } else {
                    target = "";
                }
                if (isdefined(scriptedspawnpoint.script_noteworthy)) {
                    script_noteworthy = scriptedspawnpoint.script_noteworthy;
                } else {
                    script_noteworthy = "";
                }
                index = registerscriptedspawnpoints(scriptedspawnpoint.classname, scriptedspawnpoint.origin, scriptedspawnpoint.angles, target, script_noteworthy);
            }
        }
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dce
// Size: 0x46
function function_bff229a11ecd1e34() {
    if (isdefined(level.gametypebundle) && isdefined(level.gametypebundle.var_7b4496518c2be4e7) && level.gametypebundle.var_7b4496518c2be4e7.size > 0) {
        return true;
    }
    return false;
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e1c
// Size: 0x1ee
function function_5d5267daeda595(var_25ff9cceff399d80, var_e1fac4e807047e1c) {
    var_87226a6b58a1aa22 = "";
    var_40d7195435a4e5be = "";
    switch (getgametype()) {
    case #"hash_ec086b911c1011ec":
        var_87226a6b58a1aa22 = "mp_rescue_spawn_attacker";
        var_40d7195435a4e5be = "mp_rescue_spawn_defender";
        break;
    case #"hash_fa50b0f6bd82e972":
        var_87226a6b58a1aa22 = "mp_sd_spawn_attacker";
        var_40d7195435a4e5be = "mp_sd_spawn_defender";
        break;
    case #"hash_eb5e5f470e0c1dc2":
        var_87226a6b58a1aa22 = "mp_cyber_spawn_allies";
        var_40d7195435a4e5be = "mp_cyber_spawn_axis";
        break;
    }
    spawns = [];
    attackerspawns = function_ce51e08dcc037220(getstructarray(var_25ff9cceff399d80, "script_noteworthy"), undefined, "Attacker Spawn was unable to find " + var_25ff9cceff399d80 + " in the Battle Maps create script data");
    if (isdefined(attackerspawns)) {
        foreach (attacker in attackerspawns) {
            spawns[spawns.size] = createscriptedspawnpoint(var_87226a6b58a1aa22, attacker.origin, attacker.angles);
        }
    }
    defenderspawns = function_ce51e08dcc037220(getstructarray(var_e1fac4e807047e1c, "script_noteworthy"), undefined, "Defender Spawn was unable to find " + var_e1fac4e807047e1c + " in the Battle Maps create script data");
    if (isdefined(defenderspawns)) {
        foreach (defender in defenderspawns) {
            spawns[spawns.size] = createscriptedspawnpoint(var_40d7195435a4e5be, defender.origin, defender.angles);
        }
    }
    if (spawns.size > 0) {
        addscriptedspawnpoints(spawns);
    }
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8011
// Size: 0x152
function function_9a3bef3ffef9c904(var_a65640524cb6c8dd) {
    var_25ff9cceff399d80 = "";
    var_e1fac4e807047e1c = "";
    level.var_f1c340dae77ca15d = var_a65640524cb6c8dd;
    switch (getgametype()) {
    case #"hash_ec086b911c1011ec":
        if (isdefined(level.var_d27f667e6320d465)) {
            var_25ff9cceff399d80 = level.var_d27f667e6320d465.var_a1dee46f5965dafb;
            var_e1fac4e807047e1c = level.var_d27f667e6320d465.var_199b24846b757ebd;
        } else {
            var_25ff9cceff399d80 = "hr_allied_spawn";
            var_e1fac4e807047e1c = "hr_axis_spawn";
        }
        break;
    case #"hash_fa50b0f6bd82e972":
        if (isdefined(level.var_d27f667e6320d465)) {
            var_25ff9cceff399d80 = level.var_d27f667e6320d465.var_8680ea7b41bdf4dc;
            var_e1fac4e807047e1c = level.var_d27f667e6320d465.var_388abe281afcd6f6;
        } else {
            var_25ff9cceff399d80 = "sd_allied_spawn";
            var_e1fac4e807047e1c = "sd_axis_spawn";
        }
        break;
    case #"hash_eb5e5f470e0c1dc2":
        if (isdefined(level.var_d27f667e6320d465)) {
            var_25ff9cceff399d80 = level.var_d27f667e6320d465.var_ea715da3ce810864;
            var_e1fac4e807047e1c = level.var_d27f667e6320d465.var_8907b8ecb4694aae;
        } else {
            var_25ff9cceff399d80 = "cyber_allied_spawn";
            var_e1fac4e807047e1c = "cyber_axis_spawn";
        }
        break;
    }
    function_5d5267daeda595(var_25ff9cceff399d80, var_e1fac4e807047e1c);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x816a
// Size: 0x128
function initspawnlist(spawnkey, spawntype, attackervalue, defendervalue, isoptional) {
    if (!isdefined(isoptional)) {
        isoptional = 0;
    }
    /#
        assert(isdefined(level.spawnglobals.spawntypes[spawntype]));
    #/
    var_1321a74e5ce40775 = level.spawnglobals.spawntypes[spawntype];
    isfallback = spawntype == 2;
    [[ var_1321a74e5ce40775.func ]](spawnkey, attackervalue, game["attackers"], isoptional, isfallback);
    [[ var_1321a74e5ce40775.func ]](spawnkey, defendervalue, game["defenders"], isoptional, isfallback);
    if (attackervalue == defendervalue) {
        registerspawnset(var_1321a74e5ce40775.setnames[0], getspawnpointarray("mp_spawn_point", spawnkey, attackervalue));
        return;
    }
    registerspawnset(var_1321a74e5ce40775.setnames[1], getspawnpointarray("mp_spawn_point", spawnkey, attackervalue));
    registerspawnset(var_1321a74e5ce40775.setnames[2], getspawnpointarray("mp_spawn_point", spawnkey, defendervalue));
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8299
// Size: 0x64
function initspawnlists(spawnkey, primary_attacker, primary_defender, start_attacker, start_defender, fallback_attacker, fallback_defender) {
    initspawnlist(spawnkey, 1, start_attacker, start_defender);
    initspawnlist(spawnkey, 0, primary_attacker, primary_defender);
    initspawnlist(spawnkey, 2, fallback_attacker, fallback_defender, 1);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8304
// Size: 0x39
function function_afe4709b818e7c9e(spawnkey) {
    initspawnlists(spawnkey, "spawn", "spawn", "start_attacker", "start_defender", "fallback", "fallback");
    function_48ed29b53fd72775();
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8344
// Size: 0x4f
function function_542d0780ea7c537d(spawningplayer, spawnteam, spawnparams) {
    if (spawnteam == game["attackers"]) {
        return getspawnpoint(self, spawnteam, "start_attackers", "start_attackers", spawnparams);
    }
    return getspawnpoint(self, spawnteam, "start_defenders", "start_defenders", spawnparams);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x839b
// Size: 0xad
function function_768bb924a0a3b2e9(pair, team, primaryset, fallbackset) {
    if (!isdefined(level.spawnglobals.var_f36d416bc6168362)) {
        level.spawnglobals.var_f36d416bc6168362 = [];
    }
    if (!isdefined(level.spawnglobals.var_f36d416bc6168362[pair])) {
        level.spawnglobals.var_f36d416bc6168362[pair] = [];
    }
    level.spawnglobals.var_f36d416bc6168362[pair][team] = {fallback:fallbackset, primary:primaryset};
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x844f
// Size: 0x6f
function function_48ed29b53fd72775() {
    function_768bb924a0a3b2e9("start", game["attackers"], "start_attackers", undefined);
    function_768bb924a0a3b2e9("start", game["defenders"], "start_defenders", undefined);
    function_768bb924a0a3b2e9("default", game["attackers"], "primary", "fallback");
    function_768bb924a0a3b2e9("default", game["defenders"], "primary", "fallback");
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84c5
// Size: 0x6f
function function_437beaf209334ce2() {
    function_768bb924a0a3b2e9("start", game["attackers"], "start_attackers", undefined);
    function_768bb924a0a3b2e9("start", game["defenders"], "start_defenders", undefined);
    function_768bb924a0a3b2e9("default", game["attackers"], "primary_attackers", "fallback_attackers");
    function_768bb924a0a3b2e9("default", game["defenders"], "primary_defenders", "fallback_defenders");
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x853b
// Size: 0xcd
function function_8be1c339876506b9(ent, pair, team, params) {
    /#
        assert(isdefined(level.spawnglobals.var_f36d416bc6168362));
    #/
    /#
        assert(isdefined(level.spawnglobals.var_f36d416bc6168362[pair]));
    #/
    /#
        assert(isdefined(level.spawnglobals.var_f36d416bc6168362[pair][team]));
    #/
    return getspawnpoint(ent, team, level.spawnglobals.var_f36d416bc6168362[pair][team].primary, level.spawnglobals.var_f36d416bc6168362[pair][team].fallback, undefined, params);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8610
// Size: 0x88
function getspawnpointforplayer(player, params) {
    pair = "default";
    factor_set = #"default";
    if (shoulduseteamstartspawn()) {
        pair = "start";
        factor_set = #"start";
    }
    if (function_bff229a11ecd1e34()) {
        if (!isactivespawnlogic(factor_set)) {
            setactivespawnlogic(factor_set);
        }
    }
    return function_8be1c339876506b9(player, pair, player.pers["team"], params);
}

// Namespace spawnlogic / scripts/mp/spawnlogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86a0
// Size: 0x51
function function_b17bf43316b9fb08(spawnkey, spawnvalue) {
    if (!isdefined(spawnvalue)) {
        spawnvalue = "spawn";
    }
    /#
        if (getdvarint(@"hash_4dc85278508b1ec3", 0) != 0) {
            return false;
        }
    #/
    var_c3d3bd79b9a86217 = scripts/mp/spawnlogic::function_5cb7f8468d3b9fe0(spawnkey, spawnvalue);
    return var_c3d3bd79b9a86217.size != 0;
}

