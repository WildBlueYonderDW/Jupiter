// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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
    if (isdefined(level.var_62f6f7640e4431e3.var_466145510d447d04)) {
        level.spawnglobals.var_466145510d447d04 = getspawnbucketfromstring(level.var_62f6f7640e4431e3.var_466145510d447d04);
    }
    level.var_dec2781e0b09018c = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_use_safe_fallback_spawns"), 0) == 1;
    level thread spawnpointupdate();
    level thread namespace_36f464722d326bbe::function_e8d365de417a3e14();
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
    namespace_b41002c7afebd276::init_spawn_factors();
    namespace_b41002c7afebd276::function_28565316737536aa();
    level.disablebuddyspawn = !istrue(getmatchrulesdata("commonOption", "buddySpawnEnabled"));
    loadspawnlogicweights();
    lanetriggers = getentarray("trigger_multiple_mp_spawn_lane", "classname");
    level.spawnglobals.lanetriggers = lanetriggers;
    foreach (index, var_8e574dae649f764d in level.spawnglobals.lanetriggers) {
        var_8e574dae649f764d.index = index;
        var_8e574dae649f764d.indexflag = 1 << index;
    }
    ignoretriggers = getentarray("trigger_multiple_mp_spawn_ignore", "classname");
    foreach (var_e05174eb75e5f721 in ignoretriggers) {
        makeenterexittrigger(var_e05174eb75e5f721, &ignoretriggerenter, &ignoretriggerexit);
    }
    function_5d5b3e315998583b();
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16db
// Size: 0x89
function function_e2cbae3344485f14(type, setname, var_474c126f25186d39, var_94ec027babd4d45, var_eef6ea650f5518d4) {
    spawntype = {var_bcf811ed79e3c085:[], type:type};
    spawntype.var_bcf811ed79e3c085[0] = setname;
    spawntype.var_bcf811ed79e3c085[1] = var_474c126f25186d39;
    spawntype.var_bcf811ed79e3c085[2] = var_94ec027babd4d45;
    spawntype.func = var_eef6ea650f5518d4;
    return spawntype;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176c
// Size: 0xaf
function function_5d5b3e315998583b() {
    level.spawnglobals.spawntypes = [];
    level.spawnglobals.spawntypes[0] = function_e2cbae3344485f14(0, "primary", "primary_attackers", "primary_defenders", &function_9328a9c1fc8d2043);
    level.spawnglobals.spawntypes[1] = function_e2cbae3344485f14(1, "start", "start_attackers", "start_defenders", &function_f4882bf77adf2d71);
    level.spawnglobals.spawntypes[2] = function_e2cbae3344485f14(2, "fallback", "fallback_attackers", "fallback_defenders", &function_9328a9c1fc8d2043);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1822
// Size: 0xc
function codecallbackhandler_spawnpointprecalc(team) {
    
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1835
// Size: 0x15f
function codecallbackhandler_spawnpointscore(spawnpoint, team) {
    var_4db3cfd2ea2d7b8f = level.spawnglobals.activespawncontext;
    /#
        assertex(isdefined(var_4db3cfd2ea2d7b8f), "GetSpawnpointForPlayer() called while there is no active spawn query context, script logic cannot run");
    #/
    var_584994fab4a8712b = level.spawnglobals;
    var_638d9cd5c072165c = 0;
    spawnpoint.scriptdata = level.spawnglobals.spawnpointscriptdata[spawnpoint.index];
    /#
        assertex(isdefined(spawnpoint.scriptdata), "Spawn Logic Error: No script data found for a spawnpoint. Was spawnpoint never registered?");
    #/
    foreach (var_c05389572bacde83, var_265d3f5274b6106f in var_584994fab4a8712b.activescriptfactors) {
        var_4f72e56648b22650 = 0;
        if (isdefined(var_265d3f5274b6106f.paramreflist)) {
            /#
                function_d344bbcacf5e4d96(var_c05389572bacde83, var_265d3f5274b6106f, var_4db3cfd2ea2d7b8f);
            #/
        }
        var_4f72e56648b22650 = [[ var_265d3f5274b6106f.func ]](spawnpoint);
        /#
            assert(var_4f72e56648b22650 >= 0 && var_4f72e56648b22650 <= 100);
        #/
        var_638d9cd5c072165c = var_638d9cd5c072165c + var_4f72e56648b22650 * var_265d3f5274b6106f.weight;
    }
    return var_638d9cd5c072165c;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199c
// Size: 0x43
function codecallbackhandler_spawnpointcritscore(spawnpoint, team) {
    /#
        if (getdvarint(@"hash_88da8d1aa9e42678") > 0) {
            return "setActiveSpawnLogic() attempting to use spawn logic but that type was not found in the gametype asset";
        }
    #/
    bucket = namespace_90f75d3fdf89a43e::criticalfactors_callback(spawnpoint);
    return bucket;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e7
// Size: 0x726
function getspawnpoint(var_1a329a914f290661, spawnteam, var_566fa37091337572, fallbackspawnset, var_a22bad5fe6fbf86d, var_629e5fe2f6b337fa) {
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
        level.var_53043465614ec8f8 = var_566fa37091337572;
        level.var_b5bad5601a066c66 = fallbackspawnset;
    #/
    var_4db3cfd2ea2d7b8f = createspawnquerycontext(var_1a329a914f290661, spawnteam, var_629e5fe2f6b337fa);
    setactivespawnquerycontext(var_4db3cfd2ea2d7b8f);
    if (isdefined(var_566fa37091337572)) {
        /#
            assertex(getspawnsetsize(var_566fa37091337572) > 0, "getSpawnpoint() called on an empty spawn set. Is the map missing the correct spawn point type?");
        #/
        activatespawnset(var_566fa37091337572, 1);
    }
    /#
        if (namespace_cd0b2d039510b38d::getgametype() != "frontline" && namespace_cd0b2d039510b38d::getgametype() != "Undefined spawn factor asset in GameTypeBundle for index " && namespace_cd0b2d039510b38d::getgametype() != "playerspawnfactorset:" && namespace_cd0b2d039510b38d::getgametype() != "mp/spawnweights_jup4" && namespace_cd0b2d039510b38d::getgametype() != "Unknown Factor Type "") {
            namespace_e6eafa63d63ab54d::function_847de9fd3b2ff0da(var_566fa37091337572, fallbackspawnset);
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
            if (namespace_cd0b2d039510b38d::getgametype() != "frontline" && namespace_cd0b2d039510b38d::getgametype() != "Undefined spawn factor asset in GameTypeBundle for index " && namespace_cd0b2d039510b38d::getgametype() != "playerspawnfactorset:" && namespace_cd0b2d039510b38d::getgametype() != "mp/spawnweights_jup4") {
                namespace_e6eafa63d63ab54d::function_847de9fd3b2ff0da(var_566fa37091337572, fallbackspawnset, 1);
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
        var_c242207ef2f146cc = namespace_90f75d3fdf89a43e::findbuddyspawn();
        if (isdefined(var_c242207ef2f146cc)) {
            /#
                if (getdvarint(@"hash_f3b498670cb45729", 0) != 0) {
                    if (!isdefined(level.var_952af294bfd228a7["Normal"])) {
                        level.var_952af294bfd228a7["Normal"] = [];
                    }
                    level.var_952af294bfd228a7["Normal"][level.var_952af294bfd228a7["Normal"].size] = var_c242207ef2f146cc;
                }
            #/
            var_c242207ef2f146cc.bucket = 3;
            var_c242207ef2f146cc.usingfallback = usingfallback;
            var_c242207ef2f146cc.threatsight = var_29aed5db4bb4c839;
            var_c242207ef2f146cc.damagemod = var_c4dc16cc4cc64978;
            return var_c242207ef2f146cc;
        }
    }
    if (bestspawnpoint.bucket >= 2) {
        if (istrue(level.var_dec2781e0b09018c) && !istrue(var_1a329a914f290661.var_5849bdd2ad415eec)) {
            var_1a329a914f290661.var_5849bdd2ad415eec = 1;
            var_c42b8ff1d20c40fa = level.spawnglobals.activespawnlogic;
            var_81169ab9145e4c70 = level.spawnglobals.var_ec3926d151bc9b3d;
            var_5d44bb0d0e2c6c7a = getdvar(@"hash_c2e2232e83d7f64f", "AwayFromEnemies");
            var_138964eab0e4f2f0 = getdvar(@"hash_f8b577d6d5572673", "Crit_Default");
            setactivespawnlogic(var_5d44bb0d0e2c6c7a, var_138964eab0e4f2f0);
            bestspawnpoint = getspawnpoint(var_1a329a914f290661, spawnteam, var_566fa37091337572, fallbackspawnset, var_a22bad5fe6fbf86d, var_629e5fe2f6b337fa);
            setactivespawnlogic(var_c42b8ff1d20c40fa, var_81169ab9145e4c70);
            var_1a329a914f290661.var_5849bdd2ad415eec = undefined;
        }
        var_cf9bd39bcb455a12 = getdvarint(@"hash_32e4dc28cdff8ad3", 0) != 1;
        if (var_a22bad5fe6fbf86d >= 3 && !var_cf9bd39bcb455a12) {
            var_c242207ef2f146cc = namespace_90f75d3fdf89a43e::findbuddyspawn();
            if (isdefined(var_c242207ef2f146cc)) {
                namespace_90f75d3fdf89a43e::logbadspawn("Using buddy spawn", var_1a329a914f290661);
                /#
                    if (getdvarint(@"hash_f3b498670cb45729", 0) != 0) {
                        if (!isdefined(level.var_952af294bfd228a7["threatsight"])) {
                            level.var_952af294bfd228a7["threatsight"] = [];
                        }
                        level.var_952af294bfd228a7["threatsight"][level.var_952af294bfd228a7["threatsight"].size] = var_c242207ef2f146cc;
                    }
                #/
                var_c242207ef2f146cc.bucket = 3;
                var_c242207ef2f146cc.usingfallback = usingfallback;
                var_c242207ef2f146cc.threatsight = var_29aed5db4bb4c839;
                var_c242207ef2f146cc.damagemod = var_c4dc16cc4cc64978;
                return var_c242207ef2f146cc;
            }
            namespace_90f75d3fdf89a43e::logbadspawn("CANNOT BUDDY SPAWN! Using bad code spawn", var_1a329a914f290661);
        }
    }
    if (bestspawnpoint.bucket > 2 && var_a22bad5fe6fbf86d >= 4) {
        if (isdefined(bestspawnpoint.bucket) && bestspawnpoint.bucket == 5) {
            bestspawnpoint = undefined;
        }
        if (!isdefined(bestspawnpoint)) {
            var_b46d2a4b62c02cfe = namespace_b2d5aa2baf2b5701::getteamspawnpoints(var_1a329a914f290661.team);
            bestspawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_random(var_b46d2a4b62c02cfe);
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
    if (!istrue(level.disablespawncamera) && !istrue(var_1a329a914f290661.skipspawncamera) && bestspawnpoint.bucket >= 2 && bestspawnpoint.threatsight < 300) {
        var_1a329a914f290661.shouldgetnewspawnpoint = 1;
    }
    return bestspawnpoint;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2115
// Size: 0x9a
function createspawnquerycontext(var_1a329a914f290661, team, factorparams) {
    var_4db3cfd2ea2d7b8f = spawnstruct();
    var_4db3cfd2ea2d7b8f.player = var_1a329a914f290661;
    var_4db3cfd2ea2d7b8f.team = team;
    var_4db3cfd2ea2d7b8f.time = gettime();
    var_4db3cfd2ea2d7b8f.factorparams = factorparams;
    if (level.teambased) {
        var_4db3cfd2ea2d7b8f.enemyteam = getenemyteams(team)[0];
    } else {
        var_4db3cfd2ea2d7b8f.enemyteam = "none";
    }
    return var_4db3cfd2ea2d7b8f;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b7
// Size: 0x21
function setactivespawnquerycontext(var_4db3cfd2ea2d7b8f) {
    level.spawnglobals.activespawncontext = var_4db3cfd2ea2d7b8f;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21df
// Size: 0x16
function getactivespawnquerycontext() {
    return level.spawnglobals.activespawncontext;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21fd
// Size: 0x16
function clearactivespawnquerycontext() {
    level.spawnglobals.activespawncontext = undefined;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x221a
// Size: 0x1a
function trackhostmigrationend() {
    while (1) {
        self waittill("host_migration_end");
        deactivateallspawnsets();
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x223b
// Size: 0x66
function clearcodefactors() {
    foreach (var_c05389572bacde83, var_36247ced4a30872 in level.spawnglobals.factors) {
        registerspawnfactor(var_c05389572bacde83, 0);
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22a8
// Size: 0xd8
function registercodefactors(var_a9e383f55738b673) {
    if (function_bff229a11ecd1e34()) {
        foreach (struct in var_a9e383f55738b673) {
            registerspawnfactor(struct.var_ccbba16287668f0a, struct.weight);
        }
    } else {
        foreach (var_ccbba16287668f0a, weight in var_a9e383f55738b673) {
            registerspawnfactor(var_ccbba16287668f0a, weight);
        }
    }
    registerspawnfactor("script", 1);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2387
// Size: 0x62
function function_182c52d5da69684d() {
    foreach (var_c05389572bacde83, unused in level.spawnglobals.var_a9e770068a1e3964) {
        function_1e485a1145b721c5(var_c05389572bacde83, 0);
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f0
// Size: 0x62
function function_3237e56ca7621667(var_92f8972c415555a) {
    foreach (var_ccbba16287668f0a in var_92f8972c415555a) {
        function_1e485a1145b721c5(var_ccbba16287668f0a.var_ccbba16287668f0a);
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2459
// Size: 0x3a
function function_8ac9620f8251ef84(var_ab190eba6c313055) {
    if (!isdefined(level.spawnglobals.activespawnlogic)) {
        return 0;
    }
    return level.spawnglobals.activespawnlogic == var_ab190eba6c313055;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249b
// Size: 0x5f0
function setactivespawnlogic(var_ab190eba6c313055, var_64fec856bc253947, var_7d25b12691ee7cc1) {
    if (!istrue(var_7d25b12691ee7cc1)) {
        var_94534b11bbbcfcb5 = getdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_spawnlogic_override"), "");
        if (isdefined(var_94534b11bbbcfcb5) && var_94534b11bbbcfcb5 != "") {
            var_ab190eba6c313055 = var_94534b11bbbcfcb5;
        }
        var_f7b8f7147b718401 = getdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_spawnlogic_crit_override"), "");
        if (isdefined(var_f7b8f7147b718401) && var_f7b8f7147b718401 != "") {
            var_64fec856bc253947 = var_f7b8f7147b718401;
        }
    }
    /#
        var_cf9920abd4823ebd = function_bff229a11ecd1e34();
        level.var_e9d31890c07ffffc = "CODE spawn logic enabled" + var_cf9920abd4823ebd + "mp_rescue_spawn_defender";
        if (var_cf9920abd4823ebd) {
            foreach (set in level.spawnglobals.var_8c5be78fb206a3a6) {
                level.var_e9d31890c07ffffc = level.var_e9d31890c07ffffc + "mp_sd_spawn_defender" + function_3c8848a3a11b2553(set.alias) + "Attacker Spawn was unable to find " + function_3c8848a3a11b2553(function_53c4c53197386572(set.var_3daecc1c13f040c2, "<unknown string>")) + "<unknown string>" + function_3c8848a3a11b2553(function_53c4c53197386572(set.var_a098c0af3ab5e704, "<unknown string>")) + "<unknown string>";
            }
        }
        level.var_e9d31890c07ffffc = level.var_e9d31890c07ffffc + "<unknown string>" + function_3c8848a3a11b2553(var_ab190eba6c313055) + "<unknown string>" + function_53c4c53197386572(var_64fec856bc253947, "<unknown string>") + "<unknown string>" + function_53c4c53197386572(var_7d25b12691ee7cc1, "<unknown string>") + "<unknown string>";
        level.var_e9d31890c07ffffc = level.var_e9d31890c07ffffc + "<unknown string>" + istrue(level.teambased) + "mp_rescue_spawn_defender";
        function_6d8d81caf145f097(level.var_e9d31890c07ffffc);
    #/
    var_584994fab4a8712b = level.spawnglobals;
    var_584994fab4a8712b.logicvariantid = 0;
    var_584994fab4a8712b.activespawnlogic = var_ab190eba6c313055;
    var_584994fab4a8712b.var_ec3926d151bc9b3d = var_64fec856bc253947;
    var_584994fab4a8712b.activescriptfactors = [];
    if (function_bff229a11ecd1e34()) {
        /#
            assertex(isdefined(var_584994fab4a8712b.var_4c3494e7bacb24a[var_584994fab4a8712b.activespawnlogic]), "setActiveSpawnLogic() attempting to use spawn logic but that type was not found in the gametype asset");
        #/
        foreach (var_ccbba16287668f0a in var_584994fab4a8712b.var_4c3494e7bacb24a[var_ab190eba6c313055].var_158f23d937e6defc.factors) {
            var_c05389572bacde83 = var_ccbba16287668f0a.var_ccbba16287668f0a;
            if (namespace_b41002c7afebd276::isfactorregistered(var_c05389572bacde83) && namespace_b41002c7afebd276::isfactorscriptonly(var_c05389572bacde83)) {
                var_265d3f5274b6106f = spawnstruct();
                var_265d3f5274b6106f.func = namespace_b41002c7afebd276::getfactorfunction(var_c05389572bacde83);
                var_265d3f5274b6106f.paramreflist = namespace_b41002c7afebd276::getfactorparamreflist(var_c05389572bacde83);
                var_265d3f5274b6106f.weight = var_ccbba16287668f0a.weight;
                var_584994fab4a8712b.activescriptfactors[var_c05389572bacde83] = var_265d3f5274b6106f;
            }
        }
    } else {
        /#
            assertex(isdefined(var_584994fab4a8712b.spawnfactorweights[var_584994fab4a8712b.activespawnlogic]), "setActiveSpawnLogic() attempting to use spawn logic "" + var_ab190eba6c313055 + "" but that type was not found in spawnWeights.csv");
        #/
        foreach (var_c05389572bacde83, weight in var_584994fab4a8712b.spawnfactorweights[var_ab190eba6c313055]) {
            if (namespace_b41002c7afebd276::isfactorregistered(var_c05389572bacde83) && namespace_b41002c7afebd276::isfactorscriptonly(var_c05389572bacde83)) {
                var_265d3f5274b6106f = spawnstruct();
                var_265d3f5274b6106f.func = namespace_b41002c7afebd276::getfactorfunction(var_c05389572bacde83);
                var_265d3f5274b6106f.paramreflist = namespace_b41002c7afebd276::getfactorparamreflist(var_c05389572bacde83);
                var_265d3f5274b6106f.weight = weight;
                var_584994fab4a8712b.activescriptfactors[var_c05389572bacde83] = var_265d3f5274b6106f;
            }
        }
    }
    clearcodefactors();
    if (function_bff229a11ecd1e34()) {
        registercodefactors(var_584994fab4a8712b.var_4c3494e7bacb24a[var_ab190eba6c313055].var_158f23d937e6defc.factors);
    } else {
        registercodefactors(var_584994fab4a8712b.spawnfactorweights[var_ab190eba6c313055]);
    }
    function_182c52d5da69684d();
    if (function_bff229a11ecd1e34()) {
        function_3237e56ca7621667(var_584994fab4a8712b.var_4c3494e7bacb24a[var_ab190eba6c313055].var_a9e770068a1e3964.factors);
        if (function_3e631ca44718151f("respectFrontline")) {
            frontlineinfo = namespace_b41002c7afebd276::getglobalfrontlineinfo();
            if (isdefined(frontlineinfo) && isdefined(frontlineinfo.anchordir) && isdefined(frontlineinfo.primaryanchorpos)) {
                enablefrontlinecriticalfactor(frontlineinfo.anchordir, frontlineinfo.primaryanchorpos);
            } else {
                enablefrontlinecriticalfactor();
            }
        }
    } else {
        function_60120f0efc69fc63();
        if (istrue(var_584994fab4a8712b.criticalfactortypes[var_64fec856bc253947]["frontline"])) {
            frontlineinfo = namespace_b41002c7afebd276::getglobalfrontlineinfo();
            if (isdefined(frontlineinfo) && isdefined(frontlineinfo.anchordir) && isdefined(frontlineinfo.primaryanchorpos)) {
                enablefrontlinecriticalfactor(frontlineinfo.anchordir, frontlineinfo.primaryanchorpos);
            } else {
                enablefrontlinecriticalfactor();
            }
            goto LOC_000005d0;
        }
    LOC_000005d0:
    }
LOC_000005d0:
    if (level.teambased) {
        registerspawnteamsmode(1);
    } else {
        registerspawnteamsmode(0);
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a92
// Size: 0x37
function function_84e52176cce3bd6b(var_6170ec00c4bc9b5b, var_5b57669a18c87628) {
    if (!isdefined(var_5b57669a18c87628)) {
        return 0;
    }
    if (var_5b57669a18c87628 == "") {
        return 0;
    }
    if (isdefined(var_6170ec00c4bc9b5b) && var_6170ec00c4bc9b5b == var_5b57669a18c87628) {
        return 0;
    }
    return 1;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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
        foreach (index, set in level.var_62f6f7640e4431e3.var_7b4496518c2be4e7) {
            var_26adf74a25d00f6b = 1;
            if (isdefined(set.alias)) {
                alias = function_1823ff50bb28148d(set.alias);
            } else {
                /#
                    assertmsg("Undefined spawn factor alias in GameTypeBundle for index " + index);
                #/
                var_26adf74a25d00f6b = var_26adf74a25d00f6b & 0;
            }
            var_2729f482a310e236 = spawnstruct();
            if (isdefined(set.var_3daecc1c13f040c2) && set.var_3daecc1c13f040c2 != %"") {
                var_2729f482a310e236.var_158f23d937e6defc = getscriptbundle(set.var_3daecc1c13f040c2);
            } else {
                /#
                    assertmsg("Undefined spawn factor asset in GameTypeBundle for index " + index);
                #/
                var_26adf74a25d00f6b = var_26adf74a25d00f6b & 0;
            }
            if (isdefined(set.var_a098c0af3ab5e704) && set.var_a098c0af3ab5e704 != %"") {
                var_2729f482a310e236.var_a9e770068a1e3964 = getscriptbundle(set.var_a098c0af3ab5e704);
            } else {
                /#
                    assertmsg("Invalid critical factor asset in GameTypeBundle for index " + index);
                #/
                var_26adf74a25d00f6b = var_26adf74a25d00f6b & 0;
            }
            if (var_26adf74a25d00f6b) {
                level.spawnglobals.var_4c3494e7bacb24a[alias] = var_2729f482a310e236;
                /#
                    level.spawnglobals.var_8c5be78fb206a3a6[alias] = set;
                #/
            }
        }
        if (isdefined(level.var_55f7ec9f66f3468d) && isdefined(level.var_55f7ec9f66f3468d.var_f60bfe56c8ed82cc) && level.var_55f7ec9f66f3468d.var_f60bfe56c8ed82cc.size > 0) {
            foreach (override in level.var_55f7ec9f66f3468d.var_f60bfe56c8ed82cc) {
                if (function_84e52176cce3bd6b(level.var_62f6f7640e4431e3.var_ae4a67201759ddbe, override.var_fef4eff75abb3e1b)) {
                    continue;
                }
                /#
                    assertex(isdefined(override.alias), "Spawn overrides must contain a valid alias name in the mapinfo.");
                #/
                /#
                    assertex(isdefined(override.var_3daecc1c13f040c2), "Spawn overrides must contain a valid PlayerSpawnFactorSet scriptbundle name in the mapinfo.");
                #/
                /#
                    assertex(isdefined(override.var_a098c0af3ab5e704), "Spawn overrides must contain a valid PlayerSpawnCriticalFactorSet scriptbundle name in the mapinfo.");
                #/
                alias = function_1823ff50bb28148d(override.alias);
                if (isdefined(level.spawnglobals.var_4c3494e7bacb24a[alias])) {
                    if (isdefined(override.var_3daecc1c13f040c2) && override.var_3daecc1c13f040c2 != %"") {
                        level.spawnglobals.var_4c3494e7bacb24a[alias].var_158f23d937e6defc = getscriptbundle("playerspawnfactorset:" + override.var_3daecc1c13f040c2);
                    } else {
                        /#
                            assertmsg("Invalid spawn factor override in mapInfo for alias " + override.alias);
                        #/
                    }
                    if (isdefined(override.var_a098c0af3ab5e704) && override.var_a098c0af3ab5e704 != %"") {
                        level.spawnglobals.var_4c3494e7bacb24a[alias].var_a9e770068a1e3964 = getscriptbundle("playerspawncriticalfactorset:" + override.var_a098c0af3ab5e704);
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
    while (1) {
        row++;
        var_883b09c13233feb = tablelookupbyrow(var_10554cc50f831d91, row, 0);
        if (!isdefined(var_883b09c13233feb) || var_883b09c13233feb == "") {
            break;
        }
        var_ccbba16287668f0a = tablelookupbyrow(var_10554cc50f831d91, row, 2);
        /#
            assertex(isdefined(var_ccbba16287668f0a) && var_ccbba16287668f0a != "", "Could not read factor for spawn logic type "" + var_883b09c13233feb + """);
        #/
        var_368b494836d546ea = tablelookupbyrow(var_10554cc50f831d91, row, 1);
        /#
            assertex(isdefined(var_368b494836d546ea) && var_368b494836d546ea != "", "Could not read factorType for spawn logic type "" + var_883b09c13233feb + """);
        #/
        /#
            assertex(var_368b494836d546ea == "Normal" || var_368b494836d546ea == "Critical", "Unknown Factor Type "" + var_368b494836d546ea + "" for factor "" + var_ccbba16287668f0a + "" of type "" + var_883b09c13233feb + """);
        #/
        if (var_368b494836d546ea == "Normal") {
            if (!isdefined(level.spawnglobals.spawnfactorweights[var_883b09c13233feb])) {
                level.spawnglobals.spawnfactorweights[var_883b09c13233feb] = [];
            }
            /#
                assertex(!isdefined(level.spawnglobals.spawnfactorweights[var_883b09c13233feb][var_ccbba16287668f0a]), "spawnweights.csv has factor "" + var_ccbba16287668f0a + "" defined twice for "" + var_883b09c13233feb + """);
            #/
            weight = tablelookupbyrow(var_10554cc50f831d91, row, 3);
            /#
                assertex(isdefined(weight) && weight != "", "Could not read weight for spawn logic type "" + var_883b09c13233feb + """);
            #/
            weight = float(weight);
            level.spawnglobals.spawnfactorweights[var_883b09c13233feb][var_ccbba16287668f0a] = weight;
        } else {
            if (!isdefined(level.spawnglobals.criticalfactortypes[var_883b09c13233feb])) {
                level.spawnglobals.criticalfactortypes[var_883b09c13233feb] = [];
            }
            /#
                assertex(!isdefined(level.spawnglobals.criticalfactortypes[var_883b09c13233feb][var_ccbba16287668f0a]), "spawnweights.csv has factor "" + var_ccbba16287668f0a + "" defined twice for "" + var_883b09c13233feb + """);
            #/
            level.spawnglobals.criticalfactortypes[var_883b09c13233feb][var_ccbba16287668f0a] = 1;
        }
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3282
// Size: 0x164
function scorespawnpoint(spawnpoint) {
    /#
        assertex(isdefined(level.spawnglobals.activespawnlogic), "Attempting to get a spawn point, but setActiveSpawnLogic() has not been called.");
    #/
    if (function_bff229a11ecd1e34()) {
        foreach (var_ccbba16287668f0a, weight in level.spawnglobals.var_4c3494e7bacb24a[level.spawnglobals.activespawnlogic].var_158f23d937e6defc.factors) {
            namespace_b41002c7afebd276::calculatefactorscore(spawnpoint, var_ccbba16287668f0a, weight);
        }
    } else {
        foreach (var_ccbba16287668f0a, weight in level.spawnglobals.spawnfactorweights[level.spawnglobals.activespawnlogic]) {
            namespace_b41002c7afebd276::calculatefactorscore(spawnpoint, var_ccbba16287668f0a, weight);
        }
    }
    /#
        var_9f9c381ae9df11a9 = getdvarint(@"hash_6e7192ebd1ebfe8", -1);
        if (var_9f9c381ae9df11a9 == spawnpoint.index || var_9f9c381ae9df11a9 == -2) {
            function_4c2c5ecea9fd1e73(spawnpoint);
        }
    #/
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33ed
// Size: 0x7e
function isfactorinuse(var_7be5a2e10a013091) {
    if (function_bff229a11ecd1e34()) {
        return isdefined(level.spawnglobals.var_4c3494e7bacb24a[level.spawnglobals.activespawnlogic].var_158f23d937e6defc.factors[var_7be5a2e10a013091]);
    }
    return isdefined(level.spawnglobals.spawnfactorweights[level.spawnglobals.activespawnlogic][var_7be5a2e10a013091]);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3473
// Size: 0x9f
function function_3e631ca44718151f(var_7be5a2e10a013091) {
    foreach (var_ccbba16287668f0a in level.spawnglobals.var_4c3494e7bacb24a[level.spawnglobals.activespawnlogic].var_a9e770068a1e3964.factors) {
        if (var_ccbba16287668f0a.var_ccbba16287668f0a == var_7be5a2e10a013091) {
            return 1;
        }
    }
    return 0;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x351a
// Size: 0xc
function function_7d00c6d6c09f3be3() {
    return level.startspawnpoints;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x352e
// Size: 0x223
function function_386623fc65375fa8(var_ff1aa7a587aea124, spawnpointname, var_e88e1be231eb03b) {
    spawnpoints = [];
    if (isdefined(level.modifiedspawnpoints)) {
        for (index = 0; index < var_ff1aa7a587aea124.size; index++) {
            if (checkmodifiedspawnpoint(var_ff1aa7a587aea124[index])) {
                continue;
            }
            spawnpoints[spawnpoints.size] = var_ff1aa7a587aea124[index];
        }
    } else {
        spawnpoints = var_ff1aa7a587aea124;
    }
    if (!spawnpoints.size) {
        if (!istrue(var_e88e1be231eb03b)) {
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
            foreach (var_cf29aff039bc8abe in spawnpoints) {
                if (spawnpoint == var_cf29aff039bc8abe) {
                    continue;
                }
                var_a4237dca130ab969 = vectornormalize(var_cf29aff039bc8abe.origin - spawnpoint.origin);
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3759
// Size: 0x38
function addstartspawnpoints(spawnpointname, var_e88e1be231eb03b, team) {
    var_ff1aa7a587aea124 = getspawnpointarray(spawnpointname);
    function_386623fc65375fa8(var_ff1aa7a587aea124, spawnpointname, var_e88e1be231eb03b);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3798
// Size: 0x95
function function_f4882bf77adf2d71(var_6170ec00c4bc9b5b, var_9e9bd2d16bf2b7e5, team, var_e88e1be231eb03b, isfallback) {
    if (!isdefined(var_e88e1be231eb03b)) {
        var_e88e1be231eb03b = 0;
    }
    if (!isdefined(isfallback)) {
        isfallback = 0;
    }
    var_ff1aa7a587aea124 = getspawnpointarray("mp_spawn_point", var_6170ec00c4bc9b5b, var_9e9bd2d16bf2b7e5);
    var_fd22d9e60c032271 = function_a73407f802d46a1c("mp_spawn_point", var_6170ec00c4bc9b5b, var_9e9bd2d16bf2b7e5);
    spawnpoints = function_386623fc65375fa8(var_ff1aa7a587aea124, var_fd22d9e60c032271, var_e88e1be231eb03b);
    if (spawnpoints.size) {
        registerspawnpoints(team, spawnpoints, isfallback);
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3834
// Size: 0x6f
function addspawnpoints(team, spawnpointname, var_d5690ac669bf0ff, isfallback) {
    if (!isdefined(var_d5690ac669bf0ff)) {
        var_d5690ac669bf0ff = 0;
    }
    if (!isdefined(isfallback)) {
        isfallback = 0;
    }
    var_efa35ded043e4a0f = getspawnpointarray(spawnpointname);
    if (!var_efa35ded043e4a0f.size) {
        /#
            assertex(var_d5690ac669bf0ff, "^1Error: No " + spawnpointname + " spawnpoints found in level!");
        #/
        return;
    }
    registerspawnpoints(team, var_efa35ded043e4a0f, isfallback);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38aa
// Size: 0x89
function function_9328a9c1fc8d2043(var_6170ec00c4bc9b5b, var_9e9bd2d16bf2b7e5, team, var_d5690ac669bf0ff, isfallback) {
    if (!isdefined(var_d5690ac669bf0ff)) {
        var_d5690ac669bf0ff = 0;
    }
    if (!isdefined(isfallback)) {
        isfallback = 0;
    }
    var_efa35ded043e4a0f = getspawnpointarray("mp_spawn_point", var_6170ec00c4bc9b5b, var_9e9bd2d16bf2b7e5);
    if (!var_efa35ded043e4a0f.size) {
        /#
            assertex(var_d5690ac669bf0ff, "^1Error: No " + function_a73407f802d46a1c("mp_spawn_point", var_6170ec00c4bc9b5b, var_9e9bd2d16bf2b7e5) + " spawnpoints found in level!");
        #/
        return;
    }
    registerspawnpoints(team, var_efa35ded043e4a0f, isfallback);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x393a
// Size: 0x134
function registerspawnpoints(team, var_efa35ded043e4a0f, isfallback) {
    if (!isdefined(level.spawnpoints)) {
        level.spawnpoints = [];
    }
    if (!isdefined(level.teamspawnpoints[team])) {
        level.teamspawnpoints[team] = [];
    }
    if (!isdefined(level.teamfallbackspawnpoints[team])) {
        level.teamfallbackspawnpoints[team] = [];
    }
    foreach (spawnpoint in var_efa35ded043e4a0f) {
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
        } else {
            level.teamspawnpoints[team][level.teamspawnpoints[team].size] = spawnpoint;
        }
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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
    var_fbcabd62b8f66eb8 = physics_createcontents([0:"physicscontents_missileclip", 1:"physicscontents_clipshot"]);
    hits = physics_raycast(spawnpoint.sighttracepoint, spawnpoint.sighttracepoint + (0, 0, 1024), var_fbcabd62b8f66eb8, [], 0, "physicsquery_any");
    if (hits > 0) {
        startpoint = spawnpoint.sighttracepoint + spawnpoint.forward * 100;
        hits = physics_raycast(startpoint, spawnpoint.sighttracepoint + (0, 0, 1024), var_fbcabd62b8f66eb8, [], 0, "physicsquery_any");
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
    foreach (var_8e574dae649f764d in level.spawnglobals.lanetriggers) {
        if (ispointinvolume(spawnpoint.origin, var_8e574dae649f764d)) {
            spawnpoint.lanemask = spawnpoint.lanemask | var_8e574dae649f764d.indexflag;
            spawnpoint.lanes[spawnpoint.lanes.size] = var_8e574dae649f764d.index;
        }
    }
    initspawnpointvalues(spawnpoint);
    loginitialspawnposition(spawnpoint);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d9a
// Size: 0x47
function function_a73407f802d46a1c(classname, key, value) {
    var_fd22d9e60c032271 = classname;
    if (isdefined(key) && isdefined(value)) {
        var_fd22d9e60c032271 = var_fd22d9e60c032271 + "." + key + "." + value;
    }
    return var_fd22d9e60c032271;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3de9
// Size: 0x13c
function function_32d25b070a9516de(var_b46d2a4b62c02cfe) {
    returnarray = [];
    if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
        var_df08a16a5e6579c3 = level.localeid;
        foreach (spawnpoint in var_b46d2a4b62c02cfe) {
            if (checkmodifiedspawnpoint(spawnpoint)) {
                continue;
            }
            if (isdefined(spawnpoint.script_noteworthy) && spawnpoint.script_noteworthy == var_df08a16a5e6579c3) {
                returnarray[returnarray.size] = spawnpoint;
            }
        }
        if (returnarray.size == 0) {
            returnarray = var_b46d2a4b62c02cfe;
        }
    } else {
        foreach (spawnpoint in var_b46d2a4b62c02cfe) {
            if (checkmodifiedspawnpoint(spawnpoint)) {
                continue;
            }
            if (isdefined(spawnpoint.script_noteworthy)) {
                jumpiffalse(issubstr(spawnpoint.script_noteworthy, "locale")) LOC_0000011f;
            } else {
            LOC_0000011f:
                returnarray[returnarray.size] = spawnpoint;
            }
        }
    }
    return returnarray;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f2d
// Size: 0xa0
function getspawnpointarray(classname, key, value) {
    if (!isdefined(level.spawnpointarray)) {
        level.spawnpointarray = [];
    }
    var_fd22d9e60c032271 = function_a73407f802d46a1c(classname, key, value);
    if (!isdefined(level.spawnpointarray[var_fd22d9e60c032271])) {
        var_fc32063c5b6bd8a8 = [];
        if (isdefined(key) && isdefined(value)) {
            var_fc32063c5b6bd8a8 = getspawnarray(classname, key, value);
        } else {
            var_fc32063c5b6bd8a8 = getspawnarray(classname);
        }
        level.spawnpointarray[var_fd22d9e60c032271] = function_32d25b070a9516de(var_fc32063c5b6bd8a8);
    }
    return level.spawnpointarray[var_fd22d9e60c032271];
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fd5
// Size: 0x21
function function_5cb7f8468d3b9fe0(key, value) {
    return getspawnpointarray("mp_spawn_point", key, value);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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
    dlog_recordevent("mp_spawn_event", [0:"score", 1:spawnpoint.score, 2:"threatsight", 3:spawnpoint.threatsight, 4:"totalscore", 5:spawnpoint.totalscore, 6:"spawnx", 7:spawnpoint.origin[0], 8:"spawny", 9:spawnpoint.origin[1], 10:"spawnz", 11:spawnpoint.origin[2]]);
    logcodefrontlineupdate(spawnpoint);
    return spawnpoint;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x413a
// Size: 0xbb
function logcodefrontlineupdate(spawnpoint) {
    if (namespace_dd65bffb586a92ba::matchrecording_isenabled()) {
        if (istrue(spawnpoint.frontlineenabled)) {
            var_86af21ba2c8d7509 = ter_op(self.team == "allies", spawnpoint.frontlineused, 1);
            var_53360ee7221c1a96 = ter_op(self.team == "axis", spawnpoint.frontlineused, 1);
            frontlinedir = rotatevector(spawnpoint.frontlinedir, (0, 90, 0));
            namespace_b41002c7afebd276::logfrontlinetomatchrecording(spawnpoint.frontlinepos, frontlinedir, var_86af21ba2c8d7509, var_53360ee7221c1a96);
        }
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41fc
// Size: 0xa4
function getspawnpoint_random(spawnpoints) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    var_3299c5ebf747a6b9 = undefined;
    spawnpoints = namespace_90f75d3fdf89a43e::checkdynamicspawns(spawnpoints);
    spawnpoints = array_randomize(spawnpoints);
    foreach (spawnpoint in spawnpoints) {
        var_3299c5ebf747a6b9 = spawnpoint;
        if (canspawn(var_3299c5ebf747a6b9.origin) && !positionwouldtelefrag(var_3299c5ebf747a6b9.origin)) {
            break;
        }
    }
    return var_3299c5ebf747a6b9;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42a8
// Size: 0xd8
function getspawnpoint_startspawn(spawnpoints, var_728d3544ba462895) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    bestspawn = undefined;
    spawnpoints = namespace_90f75d3fdf89a43e::checkdynamicspawns(spawnpoints);
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
        if (istrue(var_728d3544ba462895)) {
            return undefined;
        }
        bestspawn = getspawnpoint_random(spawnpoints);
    }
    if (isdefined(bestspawn)) {
        bestspawn.selected = 1;
    }
    return bestspawn;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4388
// Size: 0x29
function trackcarepackages() {
    while (1) {
        level.carepackages = getentarray("care_package", "targetname");
        wait(0.05);
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43b8
// Size: 0x17
function getteamspawnpoints(team) {
    return level.teamspawnpoints[team];
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43d7
// Size: 0x17
function getteamfallbackspawnpoints(team) {
    return level.teamfallbackspawnpoints[team];
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43f6
// Size: 0x2a
function ispathdataavailable() {
    if (!isdefined(level.pathdataavailable)) {
        level.pathdataavailable = getnodecount() > 150;
    }
    return level.pathdataavailable;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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
        var_26b37e5ae3600917 = [];
        if (level.spawnpoints.size == 0) {
            error("Spawn System Failure. No Spawnpoints found.");
        }
        for (index = 0; index < level.spawnpoints.size; index++) {
            for (innerindex = 0; innerindex < level.spawnpoints[index].radiuspathnodes.size; innerindex++) {
                var_26b37e5ae3600917[var_26b37e5ae3600917.size] = level.spawnpoints[index].radiuspathnodes[innerindex];
            }
        }
        cachespawnpathnodesincode(var_26b37e5ae3600917);
    }
    /#
        while (1) {
            level.forcebuddyspawn = getdvarint(@"hash_3c88de2237eb6f6d") > 0;
            wait(0.25);
        }
    #/
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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
            jumpiftrue(character val::get("player_for_spawn_logic")) LOC_00000099;
        } else {
        LOC_00000099:
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
    }
    return var_d4d7a55bc1e8f68e;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4763
// Size: 0x13
function addspawnviewer(entity) {
    entity registerentityspawnviewer();
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x477d
// Size: 0x13
function removespawnviewer(entity) {
    entity clearentityspawnviewer();
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4797
// Size: 0x68
function addspawndangerzone(pos, radius, height, var_ac6ca28a64718193, lifetime, playerowner, var_d4a6ace0dec22bae, parentent, var_41171640c23ae1c1, var_e5aaf9c36f430309) {
    return influencepoint_add(pos, radius, height, var_ac6ca28a64718193, lifetime, playerowner, var_d4a6ace0dec22bae, parentent, var_41171640c23ae1c1, var_e5aaf9c36f430309);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4807
// Size: 0x14
function removespawndangerzone(handle) {
    influencepoint_remove(handle);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4822
// Size: 0x13
function isspawndangerzonealive(handle) {
    return influencepoint_isscripthandlevalid(handle);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x483d
// Size: 0x6
function getdefaultminedangerzoneradiussize() {
    return 350;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x484b
// Size: 0x10e
function influencepoint_add(pos, radius, height, var_ac6ca28a64718193, lifetime, playerowner, var_f0022422dc721463, parentent, var_41171640c23ae1c1, var_e5aaf9c36f430309) {
    if (!isdefined(var_ac6ca28a64718193) && isdefined(playerowner)) {
        var_ac6ca28a64718193 = playerowner.team;
    }
    var_4c1c66d3cc3c8ace = undefined;
    if (isdefined(playerowner)) {
        if (isdefined(var_f0022422dc721463)) {
            var_4c1c66d3cc3c8ace = createspawninfluencepoint(pos, radius, height, var_ac6ca28a64718193, playerowner, var_f0022422dc721463);
        } else {
            var_4c1c66d3cc3c8ace = createspawninfluencepoint(pos, radius, height, var_ac6ca28a64718193, playerowner);
        }
    } else {
        var_4c1c66d3cc3c8ace = createspawninfluencepoint(pos, radius, height, var_ac6ca28a64718193);
    }
    /#
        assertex(isdefined(var_4c1c66d3cc3c8ace), "CreateSpawnInfluencePoint() failed to create influence point");
    #/
    if (!isdefined(var_4c1c66d3cc3c8ace)) {
        return;
    }
    var_cd3f75cf2cd67808 = influencepoint_getnewscripthandle(var_4c1c66d3cc3c8ace);
    /#
        assert(influencepoint_isscripthandlevalid(var_cd3f75cf2cd67808));
    #/
    if (!istrue(var_e5aaf9c36f430309)) {
        thread influencepoint_cleanupthink(var_cd3f75cf2cd67808, &removespawndangerzone, parentent, lifetime, var_41171640c23ae1c1);
    }
    return var_cd3f75cf2cd67808;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4961
// Size: 0x42
function influencepoint_remove(var_cd3f75cf2cd67808) {
    /#
        assertex(influencepoint_isscripthandlevalid(var_cd3f75cf2cd67808), "Attempting to remove a spawn influence point that has already been removed");
    #/
    var_4c1c66d3cc3c8ace = influencepoint_getcodehandlefromscripthandle(var_cd3f75cf2cd67808);
    destroyspawninfluencepoint(var_4c1c66d3cc3c8ace);
    influencepoint_invalidatescripthandlesforcodehandle(var_4c1c66d3cc3c8ace);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49aa
// Size: 0x7d
function influencepoint_getnewscripthandle(var_4c1c66d3cc3c8ace) {
    spawnglobals = level.spawnglobals;
    /#
        assert(var_4c1c66d3cc3c8ace < 65536 - 1);
    #/
    if (!isdefined(spawnglobals.influencenodealloccounts[var_4c1c66d3cc3c8ace])) {
        spawnglobals.influencenodealloccounts[var_4c1c66d3cc3c8ace] = 0;
    }
    var_b20e482710bf4419 = spawnglobals.influencenodealloccounts[var_4c1c66d3cc3c8ace];
    var_cd3f75cf2cd67808 = var_b20e482710bf4419 << 16 | var_4c1c66d3cc3c8ace;
    return var_cd3f75cf2cd67808;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a2f
// Size: 0x65
function influencepoint_invalidatescripthandlesforcodehandle(var_4c1c66d3cc3c8ace) {
    spawnglobals = level.spawnglobals;
    spawnglobals.influencenodealloccounts[var_4c1c66d3cc3c8ace]++;
    var_b20e482710bf4419 = spawnglobals.influencenodealloccounts[var_4c1c66d3cc3c8ace];
    if (var_b20e482710bf4419 >= 65536 - 1) {
        var_b20e482710bf4419 = 0;
        spawnglobals.influencenodealloccounts[var_4c1c66d3cc3c8ace] = 0;
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a9b
// Size: 0x16
function influencepoint_getcodehandlefromscripthandle(var_cd3f75cf2cd67808) {
    return var_cd3f75cf2cd67808 & 65536 - 1;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ab9
// Size: 0x10
function influencepoint_getalloccountfromscripthandle(var_cd3f75cf2cd67808) {
    return var_cd3f75cf2cd67808 >> 16;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ad1
// Size: 0x65
function influencepoint_isscripthandlevalid(var_cd3f75cf2cd67808) {
    spawnglobals = level.spawnglobals;
    var_80420be8a5b2f86b = influencepoint_getalloccountfromscripthandle(var_cd3f75cf2cd67808);
    var_4c1c66d3cc3c8ace = influencepoint_getcodehandlefromscripthandle(var_cd3f75cf2cd67808);
    var_b20e482710bf4419 = spawnglobals.influencenodealloccounts[var_4c1c66d3cc3c8ace];
    return isdefined(var_b20e482710bf4419) && var_80420be8a5b2f86b == var_b20e482710bf4419;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b3e
// Size: 0xa2
function influencepoint_cleanupthink(handle, var_3ba354cea9bb25d9, owner, lifetime, removeondeath) {
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
    [[ var_3ba354cea9bb25d9 ]](handle);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4be7
// Size: 0x195
function updatespawnviewers() {
    level.spawnviewers = getactiveplayerlist();
    /#
        level.spawnviewersupdatetime = gettime();
        thread function_9ab26c0d48173ab1();
    #/
    foreach (var_ff3fe241243b175b in level.spawnviewers) {
        var_ff3fe241243b175b.spawnviewpathnodes = undefined;
    }
    foreach (turret in level.turrets) {
        if (!isdefined(turret)) {
            continue;
        }
        turret.spawnlogicteam = getspawnteam(turret);
        level.spawnviewers[level.spawnviewers.size] = turret;
        turret.spawnviewpathnodes = undefined;
    }
    foreach (var_dc473b03215bf865 in level.ugvs) {
        if (!isdefined(var_dc473b03215bf865)) {
            continue;
        }
        var_dc473b03215bf865.spawnlogicteam = getspawnteam(var_dc473b03215bf865);
        level.spawnviewers[level.spawnviewers.size] = var_dc473b03215bf865;
        var_dc473b03215bf865.spawnviewpathnodes = undefined;
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d83
// Size: 0x20
function arespawnviewersvalid() {
    return isdefined(level.spawnviewersupdatetime) && level.spawnviewersupdatetime == gettime();
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4dab
// Size: 0x11
function function_9ab26c0d48173ab1() {
    /#
        waitframe();
        level.spawnviewers = undefined;
    #/
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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
            var_9fabc939f9e112ab = 3;
            if (level.teambased) {
                var_2784aea6e45300de = 1;
                var_17111b33f4f70359 = 1;
                if (team == "allies") {
                    /#
                        assert(spawnpoint.hassightdata["allies"]);
                    #/
                    var_2784aea6e45300de = spawnpoint.logspawndisabled["allies"] == 0;
                    var_a0804401f03be2f4 = isdefined(spawnpoint.loggedstate) && (spawnpoint.loggedstate == 0 || spawnpoint.loggedstate == 2);
                    var_17111b33f4f70359 = ter_op(isdefined(spawnpoint.loggedstate), var_a0804401f03be2f4, 0);
                } else {
                    /#
                        assert(spawnpoint.hassightdata["axis"]);
                    #/
                    var_17111b33f4f70359 = spawnpoint.logspawndisabled["axis"] == 0;
                    var_9c34cf8271074603 = isdefined(spawnpoint.loggedstate) && (spawnpoint.loggedstate == 0 || spawnpoint.loggedstate == 1);
                    var_2784aea6e45300de = ter_op(isdefined(spawnpoint.loggedstate), var_9c34cf8271074603, 0);
                }
                if (var_2784aea6e45300de && var_17111b33f4f70359) {
                    var_9fabc939f9e112ab = 0;
                } else if (var_2784aea6e45300de) {
                    var_9fabc939f9e112ab = 1;
                } else if (var_17111b33f4f70359) {
                    var_9fabc939f9e112ab = 2;
                }
            } else {
                /#
                    assert(spawnpoint.hassightdata["all"]);
                #/
                var_9fabc939f9e112ab = ter_op(spawnpoint.fullsights["all"] == 0, 0, 3);
            }
            if (!isdefined(spawnpoint.loggedstate) || spawnpoint.loggedstate != var_9fabc939f9e112ab) {
                [[ level.matchrecording_logevent ]](spawnpoint.logid, "allies", "SPAWN_ENTITY", spawnpoint.origin[0], spawnpoint.origin[1], gettime(), var_9fabc939f9e112ab);
                spawnpoint.loggedstate = var_9fabc939f9e112ab;
            }
        }
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x513c
// Size: 0x1ae
function spawnpointdistanceupdate(spawnpoint) {
    /#
        assert(arespawnviewersvalid());
    #/
    if (isdefined(spawnpoint) && isdefined(spawnpoint.mindistsquared)) {
        foreach (player in level.spawnviewers) {
            var_8336f113929858a6 = distancesquared(player.origin, spawnpoint.origin);
            if (isdefined(spawnpoint.mindistsquared[player.spawnlogicteam])) {
                if (var_8336f113929858a6 < spawnpoint.mindistsquared[player.spawnlogicteam]) {
                    spawnpoint.mindistsquared[player.spawnlogicteam] = var_8336f113929858a6;
                }
                if (player.spawnlogicteam == "spectator") {
                    continue;
                }
                spawnpoint.distsumsquared[player.spawnlogicteam] = spawnpoint.distsumsquared[player.spawnlogicteam] + var_8336f113929858a6;
                spawnpoint.distsumsquaredcapped[player.spawnlogicteam] = spawnpoint.distsumsquaredcapped[player.spawnlogicteam] + min(var_8336f113929858a6, namespace_b41002c7afebd276::maxplayerspawninfluencedistsquared());
                spawnpoint.totalplayers[player.spawnlogicteam]++;
            }
        }
        spawnpoint.hasdistdata = 1;
    } else {
        /#
            assertmsg("SpawnPoint is undefined for SpawnPointDistanceUpdate");
        #/
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x532f
// Size: 0x24
function initspawnpointvalues(spawnpoint) {
    clearspawnpointsightdata(spawnpoint);
    clearspawnpointdistancedata(spawnpoint);
    function_32368b70c6aa5729(spawnpoint);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x535a
// Size: 0x7e
function clearspawnpointsightdata(spawnpoint) {
    if (level.teambased) {
        foreach (teamname in level.teamnamelist) {
            clearteamspawnpointsightdata(spawnpoint, teamname);
        }
    } else {
        clearteamspawnpointsightdata(spawnpoint, "all");
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53df
// Size: 0xc
function setupplayerspawnsightdata(player) {
    
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53f2
// Size: 0x7e
function clearspawnpointdistancedata(spawnpoint) {
    if (level.teambased) {
        foreach (teamname in level.teamnamelist) {
            clearteamspawnpointdistancedata(spawnpoint, teamname);
        }
    } else {
        clearteamspawnpointdistancedata(spawnpoint, "all");
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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
        var_d9b5bdd7ca5a54a3 = ent.origin + (0, 0, 50);
        var_b800ab5aa521d39b = 0;
        if (!var_b800ab5aa521d39b) {
            var_b800ab5aa521d39b = spawnsighttrace(spawnpoint, spawnpoint.sighttracepoint, var_d9b5bdd7ca5a54a3);
        }
        if (!var_b800ab5aa521d39b) {
            continue;
        }
        if (var_b800ab5aa521d39b > 0.95) {
            spawnpoint.fullsights[team]++;
        } else {
            spawnpoint.cornersights[team]++;
        }
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59bf
// Size: 0x7b
function findboxcenter(mins, maxs) {
    center = (0, 0, 0);
    var_53453e9c96325450 = getstruct("map_center_override", "targetname");
    if (isdefined(var_53453e9c96325450)) {
        center = var_53453e9c96325450.origin;
    } else {
        center = maxs - mins;
        center = (center[0] / 2, center[1] / 2, center[2] / 2) + mins;
    }
    return center;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a42
// Size: 0x7a
function setmapcenterfordev() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    namespace_b2d5aa2baf2b5701::expandspawnpointbounds("mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::expandspawnpointbounds("mp_tdm_spawn_axis_start");
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ac3
// Size: 0x7e
function shoulduseteamstartspawn() {
    if (getdvarint(@"hash_8ba7b3d0520775da", 0) == 1) {
        return 1;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done") && isdefined(game["infil"]) && !namespace_4b0406965e556711::gameflag("infil_started")) {
        return 1;
    }
    if (istrue(level.disableteamstartspawns)) {
        return 0;
    }
    return level.ingraceperiod && (!isdefined(level.numkills) || level.numkills == 0);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b49
// Size: 0x54
function getpathsighttestnodes(pos, var_87f843aa78393347) {
    if (var_87f843aa78393347) {
        mindist = 0;
        maxdist = getclosenoderadiusdist();
    } else {
        mindist = getclosenoderadiusdist();
        maxdist = 250;
    }
    return getnodesinradius(pos, maxdist, mindist, 512, "path");
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ba5
// Size: 0x6a
function getradiuspathsighttestnodes(pos) {
    var_d76b59299a263fe5 = [];
    var_495808766414483d = getclosestnodeinsight(pos);
    if (isdefined(var_495808766414483d)) {
        var_d76b59299a263fe5[0] = var_495808766414483d;
    }
    if (!isdefined(var_495808766414483d)) {
        var_d76b59299a263fe5 = getnodesinradius(pos, getclosenoderadiusdist(), 0, 256, "path");
        if (var_d76b59299a263fe5.size == 0) {
            var_d76b59299a263fe5 = getnodesinradius(pos, 250, 0, 256, "path");
        }
    }
    return var_d76b59299a263fe5;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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
    var_b800ab5aa521d39b = undefined;
    var_8ad95653a95ea1c3 = undefined;
    lowerlimitfullsights = level.spawnglobals.lowerlimitfullsights;
    lowerlimitcornersights = level.spawnglobals.lowerlimitcornersights;
    /#
        assert(arespawnviewersvalid());
    #/
    foreach (var_ff3fe241243b175b in level.spawnviewers) {
        if (level.teambased && var_ff3fe241243b175b.spawnlogicteam != enemyteam) {
            continue;
        }
        if (spawnpoint.fullsights[var_ff3fe241243b175b.spawnlogicteam]) {
            break;
        }
        if (!isdefined(var_ff3fe241243b175b.spawnviewpathnodes)) {
            var_ff3fe241243b175b.spawnviewpathnodes = var_ff3fe241243b175b getnearnodelistforspawncheck(getfarnoderadiusdist());
            if (!isdefined(var_ff3fe241243b175b.spawnviewpathnodes) || var_ff3fe241243b175b.spawnviewpathnodes.size == 0) {
                /#
                    var_ff3fe241243b175b.var_cba3632b3172a989 = 1;
                #/
                if (isdefined(level.matchrecording_logeventmsg) && isplayer(var_ff3fe241243b175b)) {
                    if (!isdefined(var_ff3fe241243b175b.lastpathnodewarningtime) || var_ff3fe241243b175b.lastpathnodewarningtime != gettime()) {
                        [[ level.matchrecording_logeventmsg ]]("LOG_GENERIC_MESSAGE", gettime(), "WARNING: Could not use TTLOS data for player " + var_ff3fe241243b175b.name);
                        var_ff3fe241243b175b.lastpathnodewarningtime = gettime();
                    }
                }
            }
        }
        if (isdefined(var_ff3fe241243b175b.spawnviewpathnodes) && var_ff3fe241243b175b.spawnviewpathnodes.size > 0) {
            var_cb4cc05929650738 = _precomputedlosdatatest(var_ff3fe241243b175b, spawnpoint);
            var_b800ab5aa521d39b = var_cb4cc05929650738[0];
            var_8ad95653a95ea1c3 = var_cb4cc05929650738[1];
        }
        if (!isdefined(var_b800ab5aa521d39b)) {
            tracepos = undefined;
            if (isplayer(var_ff3fe241243b175b)) {
                tracepos = var_ff3fe241243b175b geteye();
            } else {
                tracepos = var_ff3fe241243b175b.origin + (0, 0, 50);
            }
            var_b800ab5aa521d39b = directlineofsighttest(spawnpoint, var_ff3fe241243b175b, tracepos);
            var_8ad95653a95ea1c3 = var_b800ab5aa521d39b;
        }
        if (!isdefined(spawnpoint.maxsightvalue[var_ff3fe241243b175b.spawnlogicteam]) || var_b800ab5aa521d39b > spawnpoint.maxsightvalue[var_ff3fe241243b175b.spawnlogicteam]) {
            spawnpoint.maxsightvalue[var_ff3fe241243b175b.spawnlogicteam] = var_b800ab5aa521d39b;
        }
        if (isdefined(var_8ad95653a95ea1c3) && isplayer(var_ff3fe241243b175b)) {
            if (!isdefined(spawnpoint.maxjumpsightvalue[var_ff3fe241243b175b.spawnlogicteam]) || var_8ad95653a95ea1c3 > spawnpoint.maxjumpsightvalue[var_ff3fe241243b175b.spawnlogicteam]) {
                spawnpoint.maxjumpsightvalue[var_ff3fe241243b175b.spawnlogicteam] = var_8ad95653a95ea1c3;
            }
        }
        if (var_b800ab5aa521d39b > lowerlimitfullsights) {
            spawnpoint.fullsights[var_ff3fe241243b175b.spawnlogicteam]++;
            spawnpoint.logspawndisabled[var_ff3fe241243b175b.spawnlogicteam]++;
        } else if (var_b800ab5aa521d39b > lowerlimitcornersights) {
            spawnpoint.cornersights[var_ff3fe241243b175b.spawnlogicteam]++;
        }
    }
    spawnpoint.hassightdata[enemyteam] = 1;
    logspawnpointsightupdate(spawnpoint, enemyteam);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x600e
// Size: 0x69
function _precomputedlosdatatest(var_ff3fe241243b175b, spawnpoint) {
    var_cb4cc05929650738 = checkttlosoverrides(var_ff3fe241243b175b, spawnpoint);
    if (!isdefined(var_cb4cc05929650738)) {
        if (checkttlosdeverrors(var_ff3fe241243b175b, spawnpoint)) {
            return [0:1, 1:1];
        }
        var_cb4cc05929650738 = precomputedlosdatatest(var_ff3fe241243b175b.spawnviewpathnodes, spawnpoint.radiuspathnodes);
    }
    return var_cb4cc05929650738;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x607f
// Size: 0xf6
function checkttlosdeverrors(var_ff3fe241243b175b, spawnpoint) {
    /#
        var_67243b08ecf2e214 = undefined;
        if (!isdefined(var_ff3fe241243b175b.spawnviewpathnodes) || var_ff3fe241243b175b.spawnviewpathnodes.size == 0) {
            var_4f2dbc4104804300 = ter_op(isplayer(var_ff3fe241243b175b), var_ff3fe241243b175b.name, "<unknown string>");
            var_67243b08ecf2e214 = "<unknown string>" + var_4f2dbc4104804300 + "<unknown string>";
        } else if (!isdefined(spawnpoint.radiuspathnodes) || spawnpoint.radiuspathnodes.size == 0) {
            var_67243b08ecf2e214 = "<unknown string>" + spawnpoint.origin;
        }
        if (isdefined(var_67243b08ecf2e214)) {
            if (!isdefined(level.var_e660628db2a340a5) || gettime() - level.var_e660628db2a340a5 > 1000) {
                level.var_e660628db2a340a5 = gettime();
                iprintlnbold(var_67243b08ecf2e214);
            }
            return 1;
        }
    #/
    return 0;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x617d
// Size: 0x139
function checkttlosoverrides(var_ff3fe241243b175b, spawnpoint) {
    if (!isdefined(level.spawnglobals.ttlosoverrides)) {
        return;
    }
    foreach (var_865d8e40722512eb in var_ff3fe241243b175b.spawnviewpathnodes) {
        var_24ed8518f6fc6e6 = var_865d8e40722512eb getnodenumber();
        if (isdefined(level.spawnglobals.ttlosoverrides[var_24ed8518f6fc6e6])) {
            foreach (var_c229d93c0bb4f8e8 in spawnpoint.radiuspathnodes) {
                var_7643b53b09bbf1d5 = var_c229d93c0bb4f8e8 getnodenumber();
                if (isdefined(level.spawnglobals.ttlosoverrides[var_24ed8518f6fc6e6][var_7643b53b09bbf1d5])) {
                    return level.spawnglobals.ttlosoverrides[var_24ed8518f6fc6e6][var_7643b53b09bbf1d5];
                }
            }
        }
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x62bd
// Size: 0x116
function addttlosoverride(var_61ee54cd86f22f08, var_61ee57cd86f235a1, var_48c0bd41cc10dfd8, var_84c277514873a859) {
    level endon("game_ended");
    while (1) {
        if (isdefined(level.spawnglobals)) {
            break;
        }
        waitframe();
    }
    if (!isdefined(level.spawnglobals.ttlosoverrides)) {
        level.spawnglobals.ttlosoverrides = [];
    }
    if (!isdefined(level.spawnglobals.ttlosoverrides[var_61ee54cd86f22f08])) {
        level.spawnglobals.ttlosoverrides[var_61ee54cd86f22f08] = [];
    }
    level.spawnglobals.ttlosoverrides[var_61ee54cd86f22f08][var_61ee57cd86f235a1] = [0:var_48c0bd41cc10dfd8, 1:var_84c277514873a859];
    if (!isdefined(level.spawnglobals.ttlosoverrides[var_61ee57cd86f235a1])) {
        level.spawnglobals.ttlosoverrides[var_61ee57cd86f235a1] = [];
    }
    level.spawnglobals.ttlosoverrides[var_61ee57cd86f235a1][var_61ee54cd86f22f08] = [0:var_48c0bd41cc10dfd8, 1:var_84c277514873a859];
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63da
// Size: 0x5
function getclosenoderadiusdist() {
    return 130;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63e7
// Size: 0x5
function getfarnoderadiusdist() {
    return 250;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63f4
// Size: 0xee
function directlineofsighttest(spawnpoint, var_ff3fe241243b175b, tracepos) {
    var_e880af5898ec6fd1 = spawnpoint.sighttracepoint;
    var_4e18bf6f5eeee2f0 = tracepos;
    contents = physics_createcontents([0:"physicscontents_ainosight"]);
    var_aa517194e54f048b = physics_raycast(var_e880af5898ec6fd1, var_4e18bf6f5eeee2f0, contents, var_ff3fe241243b175b, 0, "physicsquery_any");
    /#
        if (getdvarint(@"hash_be68e4c2bcc0ac4c", 0) != 0 || getdvarint(@"hash_9d60ff019dc50c22", 0) != 0) {
            line(var_e880af5898ec6fd1, var_4e18bf6f5eeee2f0 - (0, 0, 16), ter_op(var_aa517194e54f048b, (1, 0, 0), (0, 1, 0)), 1, 0, 15);
        }
    #/
    return ter_op(var_aa517194e54f048b, 0, 1);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64ea
// Size: 0x6
function getmaxdistancetolos() {
    return 2550;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64f8
// Size: 0x79
function checkttlosloaded() {
    if (namespace_b2d5aa2baf2b5701::shoulduseprecomputedlos() && !namespace_b2d5aa2baf2b5701::isttlosdataavailable()) {
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6578
// Size: 0x2d
function shoulduseprecomputedlos() {
    return getdvarint(@"hash_d7358339b14a448f", 0) == 1 && !isdefined(level.disableprecomputedlos) && !generatinglosdata();
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65ad
// Size: 0x14
function generatinglosdata() {
    return getdvarint(@"hash_74cacae425805743", 0) > 0;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65c9
// Size: 0x8
function isttlosdataavailable() {
    return getislosdatafileloaded();
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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
        } else {
            [[ level.matchrecording_logeventmsg ]]("LOG_GENERIC_MESSAGE", gettime(), "Spawn Logic: None");
        }
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6768
// Size: 0x18
function isfallbackspawn(spawnpoint) {
    return istrue(spawnpoint.isfallback);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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
    while (1) {
        if (!shoulduseprecomputedlos()) {
            break;
        }
        logextraspawn("allies", var_527d4e1d1288232e);
        wait(0.5);
        logextraspawn("axis", var_9c8bbf6433e08edf);
        wait(0.5);
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x691e
// Size: 0x18
function clearlastteamspawns() {
    level.spawnglobals.lastteamspawnpoints = [];
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x693d
// Size: 0x52
function getoriginidentifierstring(spawnpoint) {
    return int(spawnpoint.origin[0]) + " " + int(spawnpoint.origin[1]) + " " + int(spawnpoint.origin[2]);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6997
// Size: 0x38
function getoriginidentifierstringnoz(spawnpoint) {
    return int(spawnpoint.origin[0]) + " " + int(spawnpoint.origin[1]);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69d7
// Size: 0x2b4
function checkmodifiedspawnpoint(spawnpoint) {
    if (!isdefined(level.modifiedspawnpoints)) {
        return 0;
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
    foreach (location, var_fea786092376efc8 in level.modifiedspawnpoints) {
        foreach (classname, var_44d182ff9a64635b in var_fea786092376efc8) {
            if (spawnpoint.classname != classname) {
                continue;
            }
            foreach (var_1e93f7232a9d345a, radius in var_44d182ff9a64635b) {
                if (var_1e93f7232a9d345a == "removeradius") {
                    locstring = strtok(location, " ");
                    x = int(locstring[0]);
                    y = int(locstring[1]);
                    z = 0;
                    if (isdefined(locstring[2])) {
                        z = function_53c4c53197386572(int(locstring[2]), 0);
                    }
                    origin = (x, y, z);
                    if (isdefined(locstring[2])) {
                        if (distance(spawnpoint.origin, origin) < radius) {
                            return 1;
                        }
                    } else if (distance2d(spawnpoint.origin, origin) < radius) {
                        return 1;
                    }
                }
            }
        }
    }
    if (!isdefined(var_6d071bf9627c7f96)) {
        return 0;
    }
    if (istrue(var_6d071bf9627c7f96["remove"])) {
        return 1;
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
    return 0;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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
        var_1c3554fbec9a21e5 = createcluster(player);
        container.clusterlist[container.clusterlist.size] = var_1c3554fbec9a21e5;
    }
    mergeclusterlist(container);
    return container;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d75
// Size: 0x46
function createcluster(player) {
    cluster = spawnstruct();
    cluster.center = player.origin;
    cluster.players = [0:player];
    return cluster;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dc3
// Size: 0x25c
function mergeclusterlist(container) {
    var_541b5a167c77648c = undefined;
    var_541b5d167c776b25 = undefined;
    var_14f82e0d331bcd8b = undefined;
    nearestdistsq = -1;
    for (var_a7b44bd189368a72 = 0; var_a7b44bd189368a72 < container.clusterlist.size; var_a7b44bd189368a72++) {
        var_58f60ca818998af0 = container.clusterlist[var_a7b44bd189368a72];
        for (var_a7b44ad18936883f = var_a7b44bd189368a72 + 1; var_a7b44ad18936883f < container.clusterlist.size; var_a7b44ad18936883f++) {
            var_58f60fa818999189 = container.clusterlist[var_a7b44ad18936883f];
            distsq = distance2dsquared(var_58f60ca818998af0.center, var_58f60fa818999189.center);
            if (distsq > 640000) {
                continue;
            }
            if (nearestdistsq < 0 || distsq < nearestdistsq) {
                nearestdistsq = distsq;
                var_541b5a167c77648c = var_58f60ca818998af0;
                var_541b5d167c776b25 = var_58f60fa818999189;
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7026
// Size: 0x31
function ignoretriggerenter(player, trigger) {
    if (!isplayer(player)) {
        return;
    }
    player val::set("spawnIgnoreTrigger", "player_for_spawn_logic", 0);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x705e
// Size: 0x2b
function ignoretriggerexit(player, trigger) {
    if (!isplayer(player)) {
        return;
    }
    player val::function_c9d0b43701bdba00("spawnIgnoreTrigger");
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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
        break;
    }
    /#
        assertmsg("Unknown Spawn Bucket Name");
    #/
    return 2;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7116
// Size: 0x62
function enablespawnpointlist(spawnpoints) {
    foreach (spawnpoint in spawnpoints) {
        enablespawnpointbyindex(spawnpoint.index);
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x717f
// Size: 0x62
function disablespawnpointlist(spawnpoints) {
    foreach (spawnpoint in spawnpoints) {
        disablespawnpointbyindex(spawnpoint.index);
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x71e8
// Size: 0x21
function function_fd739ec45329729e(id) {
    return level.var_584994fab4a8712b.spawnsetlists[id];
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7211
// Size: 0x95
function registerspawnset(id, spawnpoints) {
    var_584994fab4a8712b = level.spawnglobals;
    /#
        assertex(isdefined(var_584994fab4a8712b), "registerSpawnSet() called too early -- call in/after StartGameType() of gamemode.");
    #/
    /#
        assertex(!isdefined(var_584994fab4a8712b.spawnsets[id]), "Trying to register a spawn set with a name that is already used");
    #/
    var_584994fab4a8712b.spawnsets[id] = spawnpoints;
    if (isarray(spawnpoints)) {
        var_584994fab4a8712b.spawnsetlists[id] = spawnpoints;
    } else {
        var_584994fab4a8712b.spawnsetlists[id] = getspawnpointarray(spawnpoints);
    }
    return id;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72ae
// Size: 0x30
function function_8390bf8c3b74466a(id) {
    /#
        var_584994fab4a8712b = level.spawnglobals;
        var_584994fab4a8712b.spawnsets[id] = undefined;
    #/
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72e5
// Size: 0xe2
function activatespawnset(id, exclusive) {
    var_584994fab4a8712b = level.spawnglobals;
    /#
        assertex(isdefined(var_584994fab4a8712b), "registerSpawnSet() called too early -- call in/after StartGameType() of gamemode.");
    #/
    if (istrue(exclusive)) {
        if (var_584994fab4a8712b.activespawnsets.size == 1 && isdefined(var_584994fab4a8712b.activespawnsets[id])) {
            return;
        }
        deactivateallspawnsets();
    } else if (isdefined(var_584994fab4a8712b.activespawnsets[id])) {
        return;
    }
    spawnset = var_584994fab4a8712b.spawnsets[id];
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
    var_584994fab4a8712b.activespawnsets[id] = 1;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x73ce
// Size: 0xeb
function deactivatespawnset(id) {
    var_584994fab4a8712b = level.spawnglobals;
    /#
        assertex(isdefined(var_584994fab4a8712b), "deactivateSpawnSet() called too early -- call in/after StartGameType() of gamemode.");
    #/
    var_fecf52449f0d8583 = [];
    foreach (key, value in var_584994fab4a8712b.activespawnsets) {
        if (key != id) {
            var_fecf52449f0d8583[key] = 1;
        } else {
            spawnset = var_584994fab4a8712b.spawnsets[id];
            if (isarray(spawnset)) {
                disablespawnpointlist(spawnset);
            } else {
                /#
                    assert(isstring(spawnset));
                #/
                disablespawnpointsbyclassname(spawnset);
            }
        }
    }
    var_584994fab4a8712b.activespawnsets = var_fecf52449f0d8583;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74c0
// Size: 0x1e
function deactivateallspawnsets() {
    level.spawnglobals.activespawnsets = [];
    disablespawnpoints();
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74e5
// Size: 0x22
function getspawnsetsize(id) {
    return level.spawnglobals.spawnsetlists[id].size;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x750f
// Size: 0x41
function getrandomspawnpointfromset(id) {
    var_584994fab4a8712b = level.spawnglobals;
    return var_584994fab4a8712b.spawnsetlists[id][randomint(var_584994fab4a8712b.spawnsetlists[id].size)];
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7558
// Size: 0x96
function getrandomspawnpointfromactivesets() {
    var_90be334c1c37268a = getarraykeys(level.spawnglobals.activespawnsets);
    var_ffed3098c31f4403 = undefined;
    while (!isdefined(var_ffed3098c31f4403) && var_90be334c1c37268a.size > 0) {
        var_ffed3098c31f4403 = random(var_90be334c1c37268a);
        if (getspawnsetsize(var_ffed3098c31f4403) <= 0) {
            var_90be334c1c37268a = array_remove(var_90be334c1c37268a, var_ffed3098c31f4403);
            var_ffed3098c31f4403 = undefined;
        }
    }
    return level.spawnglobals.spawnsetlists[var_ffed3098c31f4403][randomint(level.spawnglobals.spawnsetlists[var_ffed3098c31f4403].size)];
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x75f6
// Size: 0x186
function updatedebughud() {
    /#
        var_e582e1172dddb3dd = 0;
        while (1) {
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7783
// Size: 0xd8
function function_4c2c5ecea9fd1e73(spawnpoint) {
    /#
        println("<unknown string>" + spawnpoint.index + "<unknown string>");
        println("<unknown string>" + spawnpoint.totalscore);
        println("<unknown string>" + spawnpoint.totalpossiblescore);
        foreach (var_7be5a2e10a013091, score in spawnpoint.var_54cd879162b8b086) {
            println("<unknown string>" + var_7be5a2e10a013091 + "<unknown string>" + score + "<unknown string>" + spawnpoint.var_6531ac2ff1a37628[var_7be5a2e10a013091] + "<unknown string>");
        }
    #/
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7862
// Size: 0x62
function function_50a59d95bac1964e() {
    /#
        foreach (spawnpoint in level.spawnpoints) {
            initspawnpointvalues(spawnpoint);
        }
        namespace_90f75d3fdf89a43e::resetperupdatespawnglobals();
    #/
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x78cb
// Size: 0x12a
function function_d344bbcacf5e4d96(var_c05389572bacde83, var_265d3f5274b6106f, var_4db3cfd2ea2d7b8f) {
    /#
        if (!isdefined(var_4db3cfd2ea2d7b8f.factorparams)) {
            /#
                assertmsg("<unknown string>" + function_3c8848a3a11b2553(var_c05389572bacde83) + "<unknown string>");
            #/
        }
        var_6797b39a58eb7b6e = [];
        foreach (var_963149f1c7d80f1f in var_265d3f5274b6106f.paramreflist) {
            foreach (var_8437e2a35e8d84c9, var_19b8bfffd5a5cbad in var_4db3cfd2ea2d7b8f.factorparams) {
                if (var_8437e2a35e8d84c9 == var_963149f1c7d80f1f) {
                    var_6797b39a58eb7b6e[var_963149f1c7d80f1f] = var_19b8bfffd5a5cbad;
                    break;
                }
            }
            /#
                assertex(isdefined(var_6797b39a58eb7b6e[var_963149f1c7d80f1f]), "<unknown string>" + var_c05389572bacde83 + "<unknown string>" + function_3c8848a3a11b2553(var_963149f1c7d80f1f) + "<unknown string>");
            #/
        }
    #/
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a82
// Size: 0x1e5
function addscriptedspawnpoints(var_223764ad899d9fee) {
    if (!isdefined(level.scriptedspawnpointarray)) {
        level.scriptedspawnpointarray = [];
    }
    foreach (var_caa4c2f24c7b89ac in var_223764ad899d9fee) {
        classname = var_caa4c2f24c7b89ac.classname;
        origin = var_caa4c2f24c7b89ac.origin;
        angles = var_caa4c2f24c7b89ac.angles;
        if (isdefined(var_caa4c2f24c7b89ac.target)) {
            target = var_caa4c2f24c7b89ac.target;
        } else {
            target = "";
        }
        if (isdefined(var_caa4c2f24c7b89ac.script_noteworthy)) {
            script_noteworthy = var_caa4c2f24c7b89ac.script_noteworthy;
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c6e
// Size: 0x159
function scriptedspawnpointsonmigration() {
    level notify("scriptedSpawnpointsOnMigration");
    level endon("scriptedSpawnpointsOnMigration");
    /#
        assert(isdefined(level.scriptedspawnpointarray));
    #/
    while (1) {
        level waittill("host_migration_begin");
        foreach (var_46a778b6f75c012c in level.scriptedspawnpointarray) {
            foreach (var_caa4c2f24c7b89ac in var_46a778b6f75c012c) {
                if (isdefined(var_caa4c2f24c7b89ac.target)) {
                    target = var_caa4c2f24c7b89ac.target;
                } else {
                    target = "";
                }
                if (isdefined(var_caa4c2f24c7b89ac.script_noteworthy)) {
                    script_noteworthy = var_caa4c2f24c7b89ac.script_noteworthy;
                } else {
                    script_noteworthy = "";
                }
                index = registerscriptedspawnpoints(var_caa4c2f24c7b89ac.classname, var_caa4c2f24c7b89ac.origin, var_caa4c2f24c7b89ac.angles, target, script_noteworthy);
            }
        }
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dce
// Size: 0x46
function function_bff229a11ecd1e34() {
    if (isdefined(level.var_62f6f7640e4431e3) && isdefined(level.var_62f6f7640e4431e3.var_7b4496518c2be4e7) && level.var_62f6f7640e4431e3.var_7b4496518c2be4e7.size > 0) {
        return 1;
    }
    return 0;
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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
    var_57407b8c8af4084e = function_ce51e08dcc037220(getstructarray(var_25ff9cceff399d80, "script_noteworthy"), undefined, "Attacker Spawn was unable to find " + var_25ff9cceff399d80 + " in the Battle Maps create script data");
    if (isdefined(var_57407b8c8af4084e)) {
        foreach (attacker in var_57407b8c8af4084e) {
            spawns[spawns.size] = createscriptedspawnpoint(var_87226a6b58a1aa22, attacker.origin, attacker.angles);
        }
    }
    var_232cf6a958a9f5ca = function_ce51e08dcc037220(getstructarray(var_e1fac4e807047e1c, "script_noteworthy"), undefined, "Defender Spawn was unable to find " + var_e1fac4e807047e1c + " in the Battle Maps create script data");
    if (isdefined(var_232cf6a958a9f5ca)) {
        foreach (defender in var_232cf6a958a9f5ca) {
            spawns[spawns.size] = createscriptedspawnpoint(var_40d7195435a4e5be, defender.origin, defender.angles);
        }
    }
    if (spawns.size > 0) {
        addscriptedspawnpoints(spawns);
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
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

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x816a
// Size: 0x128
function function_85f6a1797c330b26(var_6170ec00c4bc9b5b, spawntype, var_946aef1c8521958b, var_23774b6ec7f05bdf, var_e1b01ae359d000dd) {
    if (!isdefined(var_e1b01ae359d000dd)) {
        var_e1b01ae359d000dd = 0;
    }
    /#
        assert(isdefined(level.spawnglobals.spawntypes[spawntype]));
    #/
    var_1321a74e5ce40775 = level.spawnglobals.spawntypes[spawntype];
    isfallback = spawntype == 2;
    [[ var_1321a74e5ce40775.func ]](var_6170ec00c4bc9b5b, var_946aef1c8521958b, game["attackers"], var_e1b01ae359d000dd, isfallback);
    [[ var_1321a74e5ce40775.func ]](var_6170ec00c4bc9b5b, var_23774b6ec7f05bdf, game["defenders"], var_e1b01ae359d000dd, isfallback);
    if (var_946aef1c8521958b == var_23774b6ec7f05bdf) {
        registerspawnset(var_1321a74e5ce40775.var_bcf811ed79e3c085[0], getspawnpointarray("mp_spawn_point", var_6170ec00c4bc9b5b, var_946aef1c8521958b));
    } else {
        registerspawnset(var_1321a74e5ce40775.var_bcf811ed79e3c085[1], getspawnpointarray("mp_spawn_point", var_6170ec00c4bc9b5b, var_946aef1c8521958b));
        registerspawnset(var_1321a74e5ce40775.var_bcf811ed79e3c085[2], getspawnpointarray("mp_spawn_point", var_6170ec00c4bc9b5b, var_23774b6ec7f05bdf));
    }
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8299
// Size: 0x64
function function_d070732c2441ebef(var_6170ec00c4bc9b5b, var_7da9bc666c7997cd, var_91135223744ac3ad, start_attacker, start_defender, fallback_attacker, fallback_defender) {
    function_85f6a1797c330b26(var_6170ec00c4bc9b5b, 1, start_attacker, start_defender);
    function_85f6a1797c330b26(var_6170ec00c4bc9b5b, 0, var_7da9bc666c7997cd, var_91135223744ac3ad);
    function_85f6a1797c330b26(var_6170ec00c4bc9b5b, 2, fallback_attacker, fallback_defender, 1);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8304
// Size: 0x39
function function_afe4709b818e7c9e(var_6170ec00c4bc9b5b) {
    function_d070732c2441ebef(var_6170ec00c4bc9b5b, "spawn", "spawn", "start_attacker", "start_defender", "fallback", "fallback");
    function_48ed29b53fd72775();
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8344
// Size: 0x4f
function function_542d0780ea7c537d(var_1a329a914f290661, spawnteam, var_629e5fe2f6b337fa) {
    if (spawnteam == game["attackers"]) {
        return getspawnpoint(self, spawnteam, "start_attackers", "start_attackers", var_629e5fe2f6b337fa);
    }
    return getspawnpoint(self, spawnteam, "start_defenders", "start_defenders", var_629e5fe2f6b337fa);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x839b
// Size: 0xad
function function_768bb924a0a3b2e9(var_cbf22c9edb76e72d, team, var_8a0fca89b6c1a093, var_363d9492f84cd9e5) {
    if (!isdefined(level.spawnglobals.var_f36d416bc6168362)) {
        level.spawnglobals.var_f36d416bc6168362 = [];
    }
    if (!isdefined(level.spawnglobals.var_f36d416bc6168362[var_cbf22c9edb76e72d])) {
        level.spawnglobals.var_f36d416bc6168362[var_cbf22c9edb76e72d] = [];
    }
    level.spawnglobals.var_f36d416bc6168362[var_cbf22c9edb76e72d][team] = {fallback:var_363d9492f84cd9e5, primary:var_8a0fca89b6c1a093};
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x844f
// Size: 0x6f
function function_48ed29b53fd72775() {
    function_768bb924a0a3b2e9("start", game["attackers"], "start_attackers", undefined);
    function_768bb924a0a3b2e9("start", game["defenders"], "start_defenders", undefined);
    function_768bb924a0a3b2e9("default", game["attackers"], "primary", "fallback");
    function_768bb924a0a3b2e9("default", game["defenders"], "primary", "fallback");
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84c5
// Size: 0x6f
function function_437beaf209334ce2() {
    function_768bb924a0a3b2e9("start", game["attackers"], "start_attackers", undefined);
    function_768bb924a0a3b2e9("start", game["defenders"], "start_defenders", undefined);
    function_768bb924a0a3b2e9("default", game["attackers"], "primary_attackers", "fallback_attackers");
    function_768bb924a0a3b2e9("default", game["defenders"], "primary_defenders", "fallback_defenders");
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x853b
// Size: 0xcd
function function_8be1c339876506b9(ent, var_cbf22c9edb76e72d, team, params) {
    /#
        assert(isdefined(level.spawnglobals.var_f36d416bc6168362));
    #/
    /#
        assert(isdefined(level.spawnglobals.var_f36d416bc6168362[var_cbf22c9edb76e72d]));
    #/
    /#
        assert(isdefined(level.spawnglobals.var_f36d416bc6168362[var_cbf22c9edb76e72d][team]));
    #/
    return getspawnpoint(ent, team, level.spawnglobals.var_f36d416bc6168362[var_cbf22c9edb76e72d][team].primary, level.spawnglobals.var_f36d416bc6168362[var_cbf22c9edb76e72d][team].fallback, undefined, params);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8610
// Size: 0x88
function getspawnpointforplayer(player, params) {
    var_cbf22c9edb76e72d = "default";
    var_f6cf8482a6f0b335 = #"default";
    if (shoulduseteamstartspawn()) {
        var_cbf22c9edb76e72d = "start";
        var_f6cf8482a6f0b335 = #"start";
    }
    if (function_bff229a11ecd1e34()) {
        if (!function_8ac9620f8251ef84(var_f6cf8482a6f0b335)) {
            setactivespawnlogic(var_f6cf8482a6f0b335);
        }
    }
    return function_8be1c339876506b9(player, var_cbf22c9edb76e72d, player.pers["team"], params);
}

// Namespace spawnlogic/namespace_b2d5aa2baf2b5701
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86a0
// Size: 0x51
function function_b17bf43316b9fb08(var_6170ec00c4bc9b5b, var_9e9bd2d16bf2b7e5) {
    if (!isdefined(var_9e9bd2d16bf2b7e5)) {
        var_9e9bd2d16bf2b7e5 = "spawn";
    }
    /#
        if (getdvarint(@"hash_4dc85278508b1ec3", 0) != 0) {
            return 0;
        }
    #/
    var_c3d3bd79b9a86217 = namespace_b2d5aa2baf2b5701::function_5cb7f8468d3b9fe0(var_6170ec00c4bc9b5b, var_9e9bd2d16bf2b7e5);
    return var_c3d3bd79b9a86217.size != 0;
}

