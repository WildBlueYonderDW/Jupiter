// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\spawnlogic.gsc;
#using script_d17503f56b92539;

#namespace namespace_164d533d51098167;

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x805
// Size: 0x386
function init_spawn_factors() {
    if (!isdefined(level.spawn_closeenemydistsq)) {
        level.spawn_closeenemydistsq = 250000;
    }
    if (!isdefined(level.enemyspawninfluencedistsq)) {
        level.enemyspawninfluencedistsq = 810000;
    }
    registerfactor("preferOptimalTTLOS", undefined, 0, undefined);
    registerfactor("avoidShortTimeToEnemySight", undefined, 0, undefined);
    registerfactor("preferAlliesByDistance", undefined, 0, undefined);
    registerfactor("preferCloseToAlly", undefined, 0, undefined);
    registerfactor("avoidRecentlyUsedByEnemies", undefined, 0, undefined);
    registerfactor("avoidEnemiesByDistance", undefined, 0, undefined);
    registerfactor("avoidEnemyInfluence", undefined, 0, undefined);
    registerfactor("avoidLastDeathLocation", undefined, 0, undefined);
    registerfactor("avoidLastAttackerLocation", undefined, 0, undefined);
    registerfactor("avoidShortTimeToJumpingEnemySight", undefined, 0, undefined);
    registerfactor("avoidVeryShortTimeToJumpingEnemySight", undefined, 0, undefined);
    registerfactor("avoidSameSpawn", undefined, 0, undefined);
    registerfactor("avoidRecentlyUsedByAnyone", undefined, 0, undefined);
    registerfactor("avoidUsedByAnyoneEver", undefined, 0, undefined);
    registerfactor("randomSpawnScore", undefined, 0, undefined);
    registerfactor("preferNearLastTeamSpawn", undefined, 0, undefined);
    registerfactor("preferNearGroupsOfTeamMates", undefined, 0, undefined);
    registerfactor("preferOccupiedLanes", undefined, 0, undefined);
    registerfactor("preferToBalanceLanes", undefined, 0, undefined);
    registerfactor("avoidClosestEnemy", undefined, 0, undefined);
    registerfactor("scriptOnlyTest", &scriptonlytest, 1, [0:"test"]);
    registerfactor("avoidClosestEnemyByDistance", &avoidclosestenemybydistance, 1, [0:"closestEnemyInfluenceDistSq"]);
    registerfactor("preferNearSinglePoint", &prefernearsinglepoint, 1, [0:"singlePointPos", 1:"minDistToSinglePointSq", 2:"maxDistToSinglePointSq", 3:"distRangeToSinglePointSq"]);
    registerfactor("avoidCurrentSpawnTraps", &avoidcurrentspawntraps, 1, undefined);
    registerfactor("preferDomPoints", &preferdompoints, 1, [0:"preferredDomPoints", 1:"secondaryDomPoints"]);
    registerfactor("preferShortestDistToZone", &prefershortestdisttozone, 1, [0:#"hash_80b230f7f3b6e958", 1:#"hash_ff12ea926c094dde"]);
    registerfactor("avoidCloseToZone", &avoidclosetozone, 1, [0:#"hash_80b230f7f3b6e958", 1:#"hash_ccf425b826e8654b"]);
    registerfactor("preferClosePoints", &preferclosepoints, 1, [0:"closestPoints"]);
    registerfactor("avoidRugbyOffsides", &avoidrugbyoffsides, 1, [0:"juggPos", 1:"rugbyFieldDir2D"]);
    registerfactor("oneUseSpawns", &oneusespawns, 1, undefined);
    registerfactor("avoidCloseToDefenderFlag", &avoidclosetodefenderflag, 1, [0:"activeCarrierPosition", 1:"defenderFlagPosition", 2:"avoidDefenderFlagDeadZoneDistSq"]);
    registerfactor("avoidCloseToDefenderFlagSpawn", &avoidclosetodefenderflagspawn, 1, [0:"avoidDefenderFlagDeadZoneDistSq"]);
    registerfactor("avoidFrontlineOffsides", &avoidfrontlineoffsides, 1, undefined);
    registerfactor("preferOptimalFrontlineDist", &preferoptimalfrontlinedist, 1, undefined);
    registerfactor("preferUnoccupiedLanes", &preferunoccupiedlanes, 1, undefined);
    initfrontline();
    callback::add("player_spawned", &on_player_spawned);
    callback::add("player_damaged", &on_player_damaged);
    callback::add("player_death", &on_player_death);
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb92
// Size: 0x6f
function function_28565316737536aa() {
    function_9c933a291dda6e8e("avoidCloseEnemies");
    function_9c933a291dda6e8e("avoidCornerVisibleEnemies");
    function_9c933a291dda6e8e("avoidEnemySpawn");
    function_9c933a291dda6e8e("avoidFullVisibleEnemies");
    function_9c933a291dda6e8e("avoidTelefrag");
    function_9c933a291dda6e8e("considerInfluencePoints");
    function_9c933a291dda6e8e("respectFrontline");
    function_9c933a291dda6e8e("avoidSpawnTrap");
    function_9c933a291dda6e8e("scriptCriticalFactor");
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc08
// Size: 0xbc
function registerfactor(var_7be5a2e10a013091, var_a4e8f07b48bde65e, isscriptonly, paramreflist) {
    if (!isdefined(level.spawnglobals.factors)) {
        level.spawnglobals.factors = [];
    }
    /#
        assertex(!isfactorregistered(var_7be5a2e10a013091), "Attempting to register spawn factor twice: "" + var_7be5a2e10a013091 + """);
    #/
    var_36247ced4a30872 = spawnstruct();
    level.spawnglobals.factors[var_7be5a2e10a013091] = var_36247ced4a30872;
    var_36247ced4a30872.function = var_a4e8f07b48bde65e;
    var_36247ced4a30872.paramreflist = paramreflist;
    var_36247ced4a30872.isscriptonly = isscriptonly;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccb
// Size: 0x6e
function function_9c933a291dda6e8e(var_7be5a2e10a013091) {
    if (!isdefined(level.spawnglobals.var_a9e770068a1e3964)) {
        level.spawnglobals.var_a9e770068a1e3964 = [];
    }
    /#
        assertex(!function_c0ba4b08188a6d33(var_7be5a2e10a013091), "Attempting to register spawn critical factor twice: "" + var_7be5a2e10a013091 + """);
    #/
    level.spawnglobals.var_a9e770068a1e3964[var_7be5a2e10a013091] = 1;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd40
// Size: 0x22
function isfactorregistered(var_7be5a2e10a013091) {
    return isdefined(level.spawnglobals.factors[var_7be5a2e10a013091]);
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd6a
// Size: 0x22
function function_c0ba4b08188a6d33(var_7be5a2e10a013091) {
    return isdefined(level.spawnglobals.var_a9e770068a1e3964[var_7be5a2e10a013091]);
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd94
// Size: 0x48
function isfactorscriptonly(var_7be5a2e10a013091) {
    /#
        assertex(isfactorregistered(var_7be5a2e10a013091), "isFactorScriptOnly() called for unknown spawn factor "" + var_7be5a2e10a013091 + """);
    #/
    return level.spawnglobals.factors[var_7be5a2e10a013091].isscriptonly;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde4
// Size: 0x48
function getfactorfunction(var_7be5a2e10a013091) {
    /#
        assertex(isfactorregistered(var_7be5a2e10a013091), "getFactorFunction() called for unknown spawn factor "" + var_7be5a2e10a013091 + """);
    #/
    return level.spawnglobals.factors[var_7be5a2e10a013091].function;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe34
// Size: 0x48
function getfactorparamreflist(var_7be5a2e10a013091) {
    /#
        assertex(isfactorregistered(var_7be5a2e10a013091), "getFactorParamRefList() called for unknown spawn factor "" + var_7be5a2e10a013091 + """);
    #/
    return level.spawnglobals.factors[var_7be5a2e10a013091].paramreflist;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe84
// Size: 0x21f
function calculatefactorscore(spawnpoint, var_7be5a2e10a013091, weight) {
    if (!isfactorregistered(var_7be5a2e10a013091)) {
        return 0;
    }
    var_a4e8f07b48bde65e = getfactorfunction(var_7be5a2e10a013091);
    var_ff2d79932540d96c = getfactorparamreflist(var_7be5a2e10a013091);
    var_4db3cfd2ea2d7b8f = level.spawnglobals.activespawncontext;
    if (isdefined(var_ff2d79932540d96c)) {
        if (!isdefined(var_4db3cfd2ea2d7b8f.factorparams)) {
            /#
                assertmsg("Spawn Factor "" + var_7be5a2e10a013091 + "" expects a parameter but no parameters were passed to getSpawnpoint()");
            #/
        }
        /#
            var_6797b39a58eb7b6e = [];
            foreach (var_963149f1c7d80f1f in var_ff2d79932540d96c) {
                foreach (var_8437e2a35e8d84c9, var_19b8bfffd5a5cbad in var_4db3cfd2ea2d7b8f.factorparams) {
                    if (var_8437e2a35e8d84c9 == var_963149f1c7d80f1f) {
                        var_6797b39a58eb7b6e[var_963149f1c7d80f1f] = var_19b8bfffd5a5cbad;
                        break;
                    }
                }
                /#
                    assertex(isdefined(var_6797b39a58eb7b6e[var_963149f1c7d80f1f]), "preferNearSinglePoint" + var_7be5a2e10a013091 + "avoidDefenderFlagDeadZoneDistSq" + var_963149f1c7d80f1f + "locale");
                #/
            }
        #/
    }
    score = [[ var_a4e8f07b48bde65e ]](spawnpoint);
    score = clamp(score, 0, 100);
    score = score * weight;
    spawnpoint.totalpossiblescore = spawnpoint.totalpossiblescore + 100 * weight;
    spawnpoint.lastscore[self.team] = spawnpoint.lastscore[self.team] + score;
    spawnpoint.totalscore = spawnpoint.totalscore + score;
    /#
        spawnpoint.var_54cd879162b8b086[var_7be5a2e10a013091] = score;
        spawnpoint.var_6531ac2ff1a37628[var_7be5a2e10a013091] = 100 * weight;
    #/
    return score;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ab
// Size: 0x5b
function critical_factor(var_e2cadc5bf4175e47, spawnpoint) {
    scorefactor = [[ var_e2cadc5bf4175e47 ]](spawnpoint);
    scorefactor = clamp(scorefactor, 0, 100);
    /#
        if (isdefined(spawnpoint.var_b158a46400d7573d)) {
            spawnpoint.var_b158a46400d7573d[spawnpoint.var_b158a46400d7573d.size] = scorefactor;
        }
    #/
    return scorefactor;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110e
// Size: 0x87
function avoidcarepackages(spawnpoint) {
    foreach (carepackage in level.carepackages) {
        if (!isdefined(carepackage)) {
            continue;
        }
        if (distancesquared(spawnpoint.origin, carepackage.origin) < 22500) {
            return 0;
        }
    }
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119d
// Size: 0x114
function avoidbradleys(spawnpoint) {
    if (isdefined(level.bradley)) {
        foreach (bradley in level.bradley.activevehicles["total"]) {
            if (distancesquared(spawnpoint.origin, bradley.origin) < 50625) {
                return 0;
            }
        }
        foreach (bradley in level.bradley.inactivevehicles["total"]) {
            if (distancesquared(spawnpoint.origin, bradley.origin) < 50625) {
                return 0;
            }
        }
    }
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b9
// Size: 0xa6
function function_5fdeed44e6029789(spawnpoint) {
    foreach (grenade in level.grenades) {
        if (!isdefined(grenade) || !grenade isexplosivedangeroustoplayer(self) || istrue(grenade.shouldnotblockspawns)) {
            continue;
        }
        if (distancesquared(spawnpoint.origin, grenade.origin) < 122500) {
            return 0;
        }
    }
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1367
// Size: 0xe1
function function_63d3482ba43b656c(spawnpoint) {
    var_4e5da354865df1fd = level.mines;
    if (isdefined(level.traps) && level.traps.size > 0) {
        var_4e5da354865df1fd = array_combine(var_4e5da354865df1fd, level.traps);
    }
    foreach (explosive in var_4e5da354865df1fd) {
        if (!isdefined(explosive) || !explosive isexplosivedangeroustoplayer(self) || istrue(explosive.shouldnotblockspawns)) {
            continue;
        }
        if (distancesquared(spawnpoint.origin, explosive.origin) < 122500) {
            return 0;
        }
    }
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1450
// Size: 0x94
function isexplosivedangeroustoplayer(player) {
    if (!level.teambased || level.friendlyfire || !isdefined(player.team)) {
        return 1;
    } else {
        var_567fbb57b0fbcaf9 = undefined;
        if (isdefined(self.owner)) {
            if (player == self.owner) {
                return 1;
            }
            var_567fbb57b0fbcaf9 = self.owner.team;
        }
        if (isdefined(var_567fbb57b0fbcaf9)) {
            return (var_567fbb57b0fbcaf9 != player.team);
        } else {
            return 1;
        }
    }
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14eb
// Size: 0x67
function function_5e47ef2aeed10cf1(spawnpoint) {
    enemyteam = "all";
    if (level.teambased) {
        enemyteam = getenemyteams(self.team)[0];
    }
    /#
        assert(spawnpoint.hassightdata[enemyteam]);
    #/
    if (spawnpoint.cornersights[enemyteam] > 0) {
        return 0;
    }
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x155a
// Size: 0x67
function function_22b490a6df990a49(spawnpoint) {
    enemyteam = "all";
    if (level.teambased) {
        enemyteam = getenemyteams(self.team)[0];
    }
    /#
        assert(spawnpoint.hassightdata[enemyteam]);
    #/
    if (spawnpoint.fullsights[enemyteam] > 0) {
        return 0;
    }
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c9
// Size: 0x12c
function function_4546108b3957a698(spawnpoint) {
    var_b0c33d224b825287 = [];
    var_ad5a67fe096d8b1 = [];
    /#
        assert(spawnpoint.hasdistdata);
    #/
    if (level.teambased) {
        var_b0c33d224b825287[0] = getenemyteams(self.team)[0];
    } else {
        var_b0c33d224b825287[var_b0c33d224b825287.size] = "all";
    }
    foreach (enemyteam in var_b0c33d224b825287) {
        if (spawnpoint.totalplayers[enemyteam] == 0) {
            continue;
        }
        var_ad5a67fe096d8b1[var_ad5a67fe096d8b1.size] = enemyteam;
    }
    if (var_ad5a67fe096d8b1.size == 0) {
        return 100;
    }
    foreach (enemyteam in var_ad5a67fe096d8b1) {
        if (spawnpoint.mindistsquared[enemyteam] < level.spawn_closeenemydistsq) {
            return 0;
        }
    }
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16fd
// Size: 0xe
function avoidtelefrag(spawnpoint) {
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1713
// Size: 0x2c
function function_968c2af9d13680e3(spawnpoint) {
    if (isdefined(self.lastspawnpoint) && self.lastspawnpoint == spawnpoint) {
        return 0;
    }
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1747
// Size: 0x78
function function_bcea4ae71a95bddd(spawnpoint) {
    if (isdefined(self.team) && isdefined(spawnpoint.lastspawnteam) && (!level.teambased || spawnpoint.lastspawnteam != self.team)) {
        var_2ffc2ebc035d0c54 = spawnpoint.lastspawntime + 500;
        if (gettime() < var_2ffc2ebc035d0c54) {
            return 0;
        }
    }
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17c7
// Size: 0xab
function function_442824d1095bc118(spawnpoint) {
    var_973ae253acb25d0e = !level.teambased || isdefined(spawnpoint.lastspawnteam) && self.team != spawnpoint.lastspawnteam;
    if (var_973ae253acb25d0e && isdefined(spawnpoint.lastspawntime)) {
        timepassed = gettime() - spawnpoint.lastspawntime;
        spawnpoint.analytics.spawnusedbyenemies = timepassed / 1000;
        if (timepassed > 4000) {
            return 100;
        }
        return (timepassed / 4000 * 100);
    }
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x187a
// Size: 0x68
function function_45dd31709c43b20a(spawnpoint) {
    if (isdefined(spawnpoint.lastspawntime)) {
        timepassed = gettime() - spawnpoint.lastspawntime;
        spawnpoint.analytics.timesincelastspawn = timepassed / 1000;
        if (timepassed > 4000) {
            return 100;
        }
        return (timepassed / 4000 * 100);
    }
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18ea
// Size: 0x5
function function_11609ea550ebe0fa() {
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18f7
// Size: 0x63
function function_97e260aa456c2f73(spawnpoint) {
    if (!isdefined(self.lastdeathpos)) {
        return 100;
    }
    distsq = distancesquared(spawnpoint.origin, self.lastdeathpos);
    if (distsq > 810000) {
        return 100;
    }
    var_6dca750cc7c96662 = distsq / 810000;
    return var_6dca750cc7c96662 * 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1962
// Size: 0x9b
function function_679bed421f1818e4(spawnpoint) {
    if (!isdefined(self.lastattacker) || !isdefined(self.lastattacker.origin)) {
        return 100;
    }
    if (!isreallyalive(self.lastattacker)) {
        return 100;
    }
    distsq = distancesquared(spawnpoint.origin, self.lastattacker.origin);
    if (distsq > 810000) {
        return 100;
    }
    var_6dca750cc7c96662 = distsq / 810000;
    return var_6dca750cc7c96662 * 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a05
// Size: 0x329
function initfrontline() {
    frontlineinfo = getglobalfrontlineinfo();
    if (getdvarint(@"hash_8f796eb7d29945d9", 0) == 1) {
        return;
    }
    var_35f37345312ece32 = [];
    yaw = getdvarfloat(@"hash_f0fc1446b9ab706d", -1);
    if (yaw != -1) {
        frontlineinfo.usinganchors = 1;
        frontlineinfo.anchordir = anglestoforward((0, yaw, 0));
        frontlineinfo.anchorrt = anglestoright((0, yaw, 0));
        if (isdefined(level.mapcenter)) {
            frontlineinfo.primaryanchorpos = (level.mapcenter[0], level.mapcenter[1], 0);
        } else {
            frontlineinfo.primaryanchorpos = (0, 0, 0);
        }
    } else if (istrue(level.testtdmanywhere)) {
        y = getdvarfloat(@"hash_aa7892bb1de8f27d", randomfloatrange(0, 359));
        frontlineinfo.usinganchors = 1;
        frontlineinfo.anchordir = anglestoforward((0, y, 0));
        frontlineinfo.anchorrt = anglestoright((0, y, 0));
        if (isdefined(level.mapcenter)) {
            frontlineinfo.primaryanchorpos = (level.mapcenter[0], level.mapcenter[1], 0);
        }
        level.tdmanywherefrontline = frontlineinfo;
    } else {
        var_35f37345312ece32 = getentarray("mp_frontline_anchor", "classname");
        if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
            var_b5c65d27dfc53f84 = [];
            foreach (ent in var_35f37345312ece32) {
                if (isdefined(ent.script_noteworthy) && ent.script_noteworthy == level.localeid) {
                    var_b5c65d27dfc53f84[var_b5c65d27dfc53f84.size] = ent;
                } else {
                    ent delete();
                }
            }
            var_35f37345312ece32 = var_b5c65d27dfc53f84;
        } else if (var_35f37345312ece32.size != 1) {
            var_2a427a24184b5b49 = [];
            foreach (ent in var_35f37345312ece32) {
                if (!isdefined(ent.script_noteworthy) || !issubstr(ent.script_noteworthy, "locale")) {
                    var_2a427a24184b5b49[var_2a427a24184b5b49.size] = ent;
                } else {
                    ent delete();
                }
            }
            var_35f37345312ece32 = var_2a427a24184b5b49;
        }
        if (var_35f37345312ece32.size != 0) {
            frontlineinfo.usinganchors = 1;
            frontlineinfo.anchordir = anglestoforward(var_35f37345312ece32[0].angles);
            frontlineinfo.primaryanchorpos = (var_35f37345312ece32[0].origin[0], var_35f37345312ece32[0].origin[1], 0);
        }
    }
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d35
// Size: 0x25
function updatefrontline(team) {
    if (!updatefrontlineposition()) {
        return;
    }
    runfrontlinespawntrapchecks(team);
    updatefrontlinedebug();
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d61
// Size: 0x3f7
function updatefrontlineposition() {
    if (!currentspawnlogicsupportsfrontline()) {
        return 0;
    }
    frontlineinfo = getglobalfrontlineinfo();
    curtime = gettime();
    if (!isdefined(frontlineinfo.lastupdatetime)) {
        frontlineinfo.lastupdatetime = curtime;
    } else if (frontlineinfo.isactive["allies"] && frontlineinfo.isactive["axis"]) {
        frontlineinfo.uptime = frontlineinfo.uptime + frontlineinfo.lastupdatetimedelta;
    } else {
        frontlineinfo.downtime = frontlineinfo.downtime + frontlineinfo.lastupdatetimedelta;
    }
    var_f4c2de4526f2e59d = (curtime - frontlineinfo.lastupdatetime) / 1000;
    frontlineinfo.lastupdatetime = curtime;
    frontlineinfo.lastupdatetimedelta = var_f4c2de4526f2e59d;
    alliesaverage = getfrontlineteamcenter("allies");
    if (!isdefined(alliesaverage)) {
        return 0;
    }
    alliesaverage = (alliesaverage[0], alliesaverage[1], 0);
    frontlineinfo.alliesaverage = alliesaverage;
    axisaverage = getfrontlineteamcenter("axis");
    if (!isdefined(axisaverage)) {
        return 0;
    }
    axisaverage = (axisaverage[0], axisaverage[1], 0);
    frontlineinfo.axisaverage = axisaverage;
    if (frontlineinfo.usinganchors) {
        var_e14eabe1e070c9c8 = alliesaverage - frontlineinfo.primaryanchorpos;
        var_5a95892af4420023 = vectordot(frontlineinfo.anchordir, var_e14eabe1e070c9c8);
        projectedalliescenter = frontlineinfo.anchordir * var_5a95892af4420023 + frontlineinfo.primaryanchorpos;
        frontlineinfo.projectedalliescenter = projectedalliescenter;
        var_e14eabe1e070c9c8 = axisaverage - frontlineinfo.primaryanchorpos;
        var_26047c9c4b84b7c4 = vectordot(frontlineinfo.anchordir, var_e14eabe1e070c9c8);
        projectedaxiscenter = frontlineinfo.anchordir * var_26047c9c4b84b7c4 + frontlineinfo.primaryanchorpos;
        frontlineinfo.projectedaxiscenter = projectedaxiscenter;
        var_f257a6c6cafa27d4 = abs(var_5a95892af4420023 - var_26047c9c4b84b7c4);
        if (var_f257a6c6cafa27d4 < 600 && isdefined(frontlineinfo.teamdiffyaw)) {
            frontlineinfo.contested = 1;
        } else {
            frontlineinfo.contested = 0;
            frontlineinfo.midpoint = projectedalliescenter + (projectedaxiscenter - projectedalliescenter) * 0.5;
            frontlinedir = projectedaxiscenter - projectedalliescenter;
            frontlineinfo.teamdiffyaw = vectortoyaw(frontlinedir);
        }
    } else {
        var_3c847766177e2a2c = axisaverage - alliesaverage;
        var_dd247cc43dd18627 = vectortoyaw(var_3c847766177e2a2c);
        frontlineinfo.teamdiffyaw = var_dd247cc43dd18627;
        var_24f96794cbb5cf52 = alliesaverage + var_3c847766177e2a2c * 0.5;
        frontlineinfo.midpoint = var_24f96794cbb5cf52;
    }
    var_f237c6bc0ca5c62c = anglestoforward((0, frontlineinfo.teamdiffyaw, 0));
    spawnpoints = level.spawnpoints;
    spawnpoints = namespace_90f75d3fdf89a43e::checkdynamicspawns(spawnpoints);
    foreach (spawnpoint in spawnpoints) {
        var_7e2df766bce34b1 = frontlineinfo.midpoint - spawnpoint.origin;
        var_4d2d882316198c95 = vectordot(var_7e2df766bce34b1, var_f237c6bc0ca5c62c);
        spawnpoint.frontlineteam = ter_op(var_4d2d882316198c95 > 0, "allies", "axis");
    }
    return 1;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2160
// Size: 0x247
function updatefrontlinedebug() {
    var_d8cce60415de6332 = isdefined(level.matchrecording_logevent) && isdefined(level.matchrecording_generateid);
    analyticslogenabled = namespace_bd0162aedd8c8594::analyticslogenabled();
    if (!var_d8cce60415de6332 && !analyticslogenabled) {
        return;
    }
    frontlineinfo = getglobalfrontlineinfo();
    if (!isdefined(frontlineinfo.logids) && isdefined(level.matchrecording_generateid)) {
        frontlineinfo.logids = [];
        frontlineinfo.logids["alliesCenter"] = [[ level.matchrecording_generateid ]]();
        frontlineinfo.logids["axisCenter"] = [[ level.matchrecording_generateid ]]();
    }
    if (!frontlineinfo.isactive["allies"] && !frontlineinfo.isactive["axis"]) {
        return;
    }
    var_499f398b1ca169d3 = (frontlineinfo.midpoint[0], frontlineinfo.midpoint[1], level.mapcenter[2]);
    var_4e8e12d3c7a4d029 = anglestoright((0, frontlineinfo.teamdiffyaw, 0));
    logfrontlinetomatchrecording(var_499f398b1ca169d3, var_4e8e12d3c7a4d029, frontlineinfo.isactive["allies"], frontlineinfo.isactive["axis"]);
    if (isdefined(level.matchrecording_logevent)) {
        axisaverage = ter_op(frontlineinfo.isactive["axis"], frontlineinfo.axisaverage, (10000, 10000, 10000));
        [[ level.matchrecording_logevent ]](frontlineinfo.logids["axisCenter"], "axis", "ANCHOR", axisaverage[0], axisaverage[1], gettime());
        alliesaverage = ter_op(frontlineinfo.isactive["allies"], frontlineinfo.alliesaverage, (10000, 10000, 10000));
        [[ level.matchrecording_logevent ]](frontlineinfo.logids["alliesCenter"], "allies", "ANCHOR", alliesaverage[0], alliesaverage[1], gettime());
    }
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ae
// Size: 0xd9
function logfrontlinetomatchrecording(midpoint, direction, var_f3c3c5c8db76b4f0, var_dbbd5b5e90b7c2eb) {
    if (isdefined(level.matchrecording_logevent)) {
        var_26eef3c170b9e66 = midpoint + direction * 5000;
        var_26eee3c170b9c33 = midpoint - direction * 5000;
        if (!isdefined(level.matchrecording_frontlinelogid)) {
            level.matchrecording_frontlinelogid = [[ level.matchrecording_generateid ]]();
        }
        var_1cc0a856dbf7d44e = undefined;
        if (var_f3c3c5c8db76b4f0 && var_dbbd5b5e90b7c2eb) {
            var_1cc0a856dbf7d44e = "FRONT_LINE";
        } else {
            var_1cc0a856dbf7d44e = ter_op(var_f3c3c5c8db76b4f0, "FRONT_LINE_ALLIES", "FRONT_LINE_AXIS");
        }
        [[ level.matchrecording_logevent ]](level.matchrecording_frontlinelogid, "allies", var_1cc0a856dbf7d44e, var_26eef3c170b9e66[0], var_26eef3c170b9e66[1], gettime(), undefined, var_26eee3c170b9c33[0], var_26eee3c170b9c33[1]);
    }
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x248e
// Size: 0xbe
function getfrontlineteamcenter(team) {
    players = [];
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isreallyalive(player)) {
            continue;
        }
        if (!player val::get("player_for_spawn_logic")) {
            continue;
        }
        if (player.team == team) {
            players[players.size] = player;
        }
    }
    if (players.size == 0) {
        return undefined;
    }
    var_8fb9617f0786bca7 = getaverageorigin(players);
    return var_8fb9617f0786bca7;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2554
// Size: 0x1c6
function runfrontlinespawntrapchecks(team) {
    if (!currentspawnlogicsupportsfrontline()) {
        return;
    }
    frontlineinfo = getglobalfrontlineinfo();
    frontlineinfo.isactive[team] = 1;
    if (getdvarint(@"hash_db79f8163bfa1586") == 0) {
        return;
    }
    var_a0417b1dddc7acd3 = getdvarint(@"hash_30fb9fe7456a83a4", 0);
    if (var_a0417b1dddc7acd3 == 0) {
        var_a0417b1dddc7acd3 = 4;
    }
    enemyteam = getotherteam(team)[0];
    var_7efd0c35c23e92b4 = 0;
    spawnpoints = level.spawnpoints;
    spawnpoints = namespace_90f75d3fdf89a43e::checkdynamicspawns(spawnpoints);
    foreach (spawnpoint in spawnpoints) {
        if (!isdefined(spawnpoint.frontlineteam) || spawnpoint.frontlineteam != team) {
            continue;
        }
        /#
            assert(spawnpoint.hassightdata[enemyteam]);
        #/
        if (!isdefined(spawnpoint.fullsights) || !isdefined(spawnpoint.fullsights[enemyteam]) || spawnpoint.fullsights[enemyteam] <= 0) {
            var_7efd0c35c23e92b4++;
        }
    }
    var_4a40d7aea77d0271 = var_7efd0c35c23e92b4 / spawnpoints.size;
    if (var_7efd0c35c23e92b4 < var_a0417b1dddc7acd3 || var_4a40d7aea77d0271 < 0) {
        if (var_7efd0c35c23e92b4 < var_a0417b1dddc7acd3) {
            frontlineinfo.disabledreason[team] = 0;
        } else {
            frontlineinfo.disabledreason[team] = 1;
        }
        frontlineinfo.isactive[team] = 0;
    }
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2721
// Size: 0x2b
function currentspawnlogicsupportsfrontline() {
    return istrue(level.spawnglobals.frontlinelogictypes[level.spawnglobals.activespawnlogic]);
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2754
// Size: 0xce
function getglobalfrontlineinfo() {
    if (!isdefined(level.frontlineinfo)) {
        level.frontlineinfo = spawnstruct();
        level.frontlineinfo.isactive = [];
        level.frontlineinfo.isactive["allies"] = 0;
        level.frontlineinfo.isactive["axis"] = 0;
        level.frontlineinfo.uptime = 0;
        level.frontlineinfo.downtime = 0;
        level.frontlineinfo.contested = 0;
        level.frontlineinfo.usinganchors = 0;
    }
    return level.frontlineinfo;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x282a
// Size: 0xaf
function function_847f7e218feb35bb(spawnpoint) {
    /#
        assert(spawnpoint.hasdistdata);
    #/
    if (spawnpoint.totalplayers[self.team] == 0) {
        return 0;
    }
    allyaveragedist = spawnpoint.distsumsquared[self.team] / spawnpoint.totalplayers[self.team];
    allyaveragedist = min(allyaveragedist, 3240000);
    spawnpoint.analytics.allyaveragedist = allyaveragedist;
    var_b64b2f018346f72a = 1 - allyaveragedist / 3240000;
    return var_b64b2f018346f72a * 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28e1
// Size: 0x63
function function_e308442afd51b334(spawnpoint) {
    /#
        assert(spawnpoint.hasdistdata);
    #/
    var_a924b793b93423f3 = min(spawnpoint.mindistsquared[self.team], 3240000);
    var_b64b2f018346f72a = 1 - var_a924b793b93423f3 / 3240000;
    return var_b64b2f018346f72a * 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x294c
// Size: 0x1ed
function function_e495981bf91ab716(spawnpoint) {
    var_b0c33d224b825287 = [];
    var_ad5a67fe096d8b1 = [];
    /#
        assert(spawnpoint.hasdistdata);
    #/
    if (level.teambased) {
        var_b0c33d224b825287[0] = getenemyteams(self.team)[0];
    } else {
        var_b0c33d224b825287[var_b0c33d224b825287.size] = "all";
    }
    foreach (enemyteam in var_b0c33d224b825287) {
        if (spawnpoint.totalplayers[enemyteam] == 0) {
            continue;
        }
        var_ad5a67fe096d8b1[var_ad5a67fe096d8b1.size] = enemyteam;
    }
    if (var_ad5a67fe096d8b1.size == 0) {
        return 100;
    }
    foreach (enemyteam in var_ad5a67fe096d8b1) {
        if (spawnpoint.mindistsquared[enemyteam] < 250000) {
            return 0;
        }
    }
    totaldistance = 0;
    totalenemies = 0;
    foreach (enemyteam in var_ad5a67fe096d8b1) {
        totaldistance = totaldistance + spawnpoint.distsumsquaredcapped[enemyteam];
        totalenemies = totalenemies + spawnpoint.totalplayers[enemyteam];
    }
    var_42e18c11c58f15f1 = totaldistance / totalenemies;
    var_42e18c11c58f15f1 = min(var_42e18c11c58f15f1, 7290000);
    var_b64b2f018346f72a = var_42e18c11c58f15f1 / 7290000;
    spawnpoint.analytics.enemyaveragedist = var_42e18c11c58f15f1;
    return var_b64b2f018346f72a * 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b41
// Size: 0x73
function function_255be0a9b59dfc89(spawnpoint) {
    /#
        assert(spawnpoint.hasdistdata);
    #/
    enemyteam = undefined;
    if (level.teambased) {
        enemyteam = getenemyteams(self.team)[0];
    } else {
        enemyteam = "all";
    }
    if (spawnpoint.mindistsquared[enemyteam] < level.enemyspawninfluencedistsq) {
        return 0;
    }
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bbc
// Size: 0x17a
function function_2d8badc9970dc4bf(spawnpoint) {
    /#
        assert(spawnpoint.hasdistdata);
    #/
    var_b0c33d224b825287 = [];
    var_ad5a67fe096d8b1 = [];
    if (level.teambased) {
        var_b0c33d224b825287[0] = getenemyteams(self.team)[0];
    } else {
        var_b0c33d224b825287[var_b0c33d224b825287.size] = "all";
    }
    foreach (enemyteam in var_b0c33d224b825287) {
        if (spawnpoint.totalplayers[enemyteam] == 0) {
            continue;
        }
        var_ad5a67fe096d8b1[var_ad5a67fe096d8b1.size] = enemyteam;
    }
    if (var_ad5a67fe096d8b1.size == 0) {
        return 100;
    }
    var_4862098ee5021db9 = 0;
    foreach (enemyteam in var_ad5a67fe096d8b1) {
        if (spawnpoint.mindistsquared[enemyteam] < 250000) {
            return 0;
        }
        var_4d932f368b6ffda6 = min(spawnpoint.mindistsquared[enemyteam], 3240000);
        var_b64b2f018346f72a = var_4d932f368b6ffda6 / 3240000;
        var_4862098ee5021db9 = var_4862098ee5021db9 + var_b64b2f018346f72a * 100;
    }
    return var_4862098ee5021db9 / var_ad5a67fe096d8b1.size;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d3e
// Size: 0x133
function avoidclosestenemybydistance(spawnpoint) {
    var_da40d465f5d6c5a6 = level.spawnglobals.activespawncontext.factorparams[#"closestenemyinfluencedistsq"];
    enemyteam = "all";
    if (level.teambased) {
        enemyteam = getenemyteams(self.team)[0];
    }
    closestdist = 0;
    foreach (enemy in level.teamdata[enemyteam]["players"]) {
        distsq = distancesquared(spawnpoint.origin, enemy.origin);
        if (distsq < closestdist) {
            closestdist = distsq;
        }
    }
    if (closestdist < 250000) {
        return 0;
    }
    var_4d932f368b6ffda6 = min(closestdist, var_da40d465f5d6c5a6);
    var_b64b2f018346f72a = var_4d932f368b6ffda6 / var_da40d465f5d6c5a6;
    return var_b64b2f018346f72a * 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e79
// Size: 0x33
function function_5647d0dca50a2d4d(var_a72a53d107c0b04c, var_1e5e6e5f60f12427) {
    var_ba0a9fd614a3f6ee = [];
    var_ba0a9fd614a3f6ee["preferredDomPoints"] = var_a72a53d107c0b04c;
    var_ba0a9fd614a3f6ee["secondaryDomPoints"] = var_1e5e6e5f60f12427;
    return var_ba0a9fd614a3f6ee;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb4
// Size: 0xba
function preferdompoints(spawnpoint) {
    preferreddompoints = level.spawnglobals.activespawncontext.factorparams["preferredDomPoints"];
    secondarydompoints = level.spawnglobals.activespawncontext.factorparams["secondaryDomPoints"];
    scriptdata = spawnpoint.scriptdata;
    if (isdefined(scriptdata.domflagassignments)) {
        if (scriptdata.domflagassignments & preferreddompoints) {
            return 100;
        } else if (scriptdata.domflagassignments & secondarydompoints) {
            return 50;
        }
    }
    return 0;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f76
// Size: 0x89
function preferclosepoints(spawnpoint) {
    closestpoints = level.spawnglobals.activespawncontext.factorparams["closestPoints"];
    foreach (point in closestpoints) {
        if (spawnpoint == point) {
            return 100;
        }
    }
    return 0;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3007
// Size: 0x38
function function_c7a9633168e5110(spawnpoint, team) {
    if (isdefined(spawnpoint.teambase) && spawnpoint.teambase == team) {
        return 100;
    }
    return 0;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3047
// Size: 0xbe
function function_dc410c59b390813b(spawnpoint) {
    enemyteam = "all";
    if (level.teambased) {
        enemyteam = getenemyteams(self.team)[0];
    }
    /#
        assert(spawnpoint.hassightdata[enemyteam]);
    #/
    var_af25ee969f7edd48 = 1 - spawnpoint.maxsightvalue[enemyteam];
    var_cd9f4a27303d749e = namespace_b2d5aa2baf2b5701::getmaxdistancetolos();
    var_1c88bc619924142f = var_af25ee969f7edd48 * var_cd9f4a27303d749e;
    if (var_1c88bc619924142f > 1200) {
        var_b1a0228d2ebc8326 = (var_cd9f4a27303d749e - var_1c88bc619924142f) / (var_cd9f4a27303d749e - 1200);
        return (100 * var_b1a0228d2ebc8326);
    } else {
        var_b1a0228d2ebc8326 = var_1c88bc619924142f / 1200;
        return (100 * var_b1a0228d2ebc8326);
    }
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x310c
// Size: 0x94
function function_ce101e91e4df4ca9(spawnpoint) {
    enemyteam = "all";
    if (level.teambased) {
        enemyteam = getenemyteams(self.team)[0];
    }
    /#
        assert(spawnpoint.hassightdata[enemyteam]);
    #/
    var_af25ee969f7edd48 = 1 - spawnpoint.maxsightvalue[enemyteam];
    spawnpoint.analytics.maxenemysightfraction = var_af25ee969f7edd48;
    return (1 - var_af25ee969f7edd48) * 0 + var_af25ee969f7edd48 * 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31a8
// Size: 0x94
function function_52c5a5db586622c5(spawnpoint) {
    enemyteam = "all";
    if (level.teambased) {
        enemyteam = getenemyteams(self.team)[0];
    }
    /#
        assert(spawnpoint.hassightdata[enemyteam]);
    #/
    var_af25ee969f7edd48 = 1 - spawnpoint.maxjumpsightvalue[enemyteam];
    spawnpoint.analytics.maxjumpingenemysightfraction = var_af25ee969f7edd48;
    return (1 - var_af25ee969f7edd48) * 0 + var_af25ee969f7edd48 * 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3244
// Size: 0x92
function function_1bd88f01ef678809(spawnpoint) {
    enemyteam = "all";
    if (level.teambased) {
        enemyteam = getenemyteams(self.team)[0];
    }
    /#
        assert(spawnpoint.hassightdata[enemyteam]);
    #/
    var_af25ee969f7edd48 = 1 - spawnpoint.maxjumpsightvalue[enemyteam];
    var_6d87052f9222032e = var_af25ee969f7edd48 * namespace_b2d5aa2baf2b5701::getmaxdistancetolos();
    if (var_6d87052f9222032e < 300) {
        return 0;
    } else {
        return 100;
    }
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32dd
// Size: 0x3f
function randomspawnscore(spawnpoint) {
    spawnpoint.analytics.randomscore = randomintrange(0, 99);
    return spawnpoint.analytics.randomscore;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3324
// Size: 0x11
function maxplayerspawninfluencedistsquared(spawnpoint) {
    return 3240000;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x333d
// Size: 0x65
function function_75c03ed937b75b22(entitynum, var_38331ab92460d731, var_eb31d5343c6abc39, closestenemyinfluencedistsq) {
    var_ba0a9fd614a3f6ee = [];
    var_ba0a9fd614a3f6ee[#"hash_80b230f7f3b6e958"] = entitynum;
    var_ba0a9fd614a3f6ee[#"hash_ff12ea926c094dde"] = var_38331ab92460d731;
    var_ba0a9fd614a3f6ee[#"hash_ccf425b826e8654b"] = var_eb31d5343c6abc39;
    var_ba0a9fd614a3f6ee[#"closestenemyinfluencedistsq"] = closestenemyinfluencedistsq;
    return var_ba0a9fd614a3f6ee;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33aa
// Size: 0xa6
function prefershortestdisttozone(spawnpoint) {
    var_4db3cfd2ea2d7b8f = level.spawnglobals.activespawncontext;
    var_653a7e504d42846a = var_4db3cfd2ea2d7b8f.factorparams[#"hash_80b230f7f3b6e958"];
    distsq = spawnpoint.scriptdata.var_c7e3d9e2f0dd4e7[var_653a7e504d42846a];
    var_9799f8752d4ae4bf = var_4db3cfd2ea2d7b8f.factorparams[#"hash_ff12ea926c094dde"];
    percent = 1 - distsq / var_9799f8752d4ae4bf;
    return 100 * percent + 0;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3458
// Size: 0x98
function avoidclosetozone(spawnpoint) {
    var_4db3cfd2ea2d7b8f = level.spawnglobals.activespawncontext;
    var_653a7e504d42846a = var_4db3cfd2ea2d7b8f.factorparams[#"hash_80b230f7f3b6e958"];
    distsq = spawnpoint.scriptdata.var_c7e3d9e2f0dd4e7[var_653a7e504d42846a];
    var_eb31d5343c6abc39 = var_4db3cfd2ea2d7b8f.factorparams[#"hash_ccf425b826e8654b"];
    return ter_op(distsq < var_eb31d5343c6abc39, 0, 100);
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34f8
// Size: 0x91
function function_82fb03c7e6eddf4f(spawnpoint) {
    var_a77c3f8dacea618b = level.spawnglobals.lastteamspawnpoints[self.team];
    if (!isdefined(var_a77c3f8dacea618b)) {
        return 0;
    }
    distsq = distancesquared(var_a77c3f8dacea618b.origin, spawnpoint.origin);
    distsq = int(min(distsq, 9000000));
    percent = 1 - distsq / 9000000;
    return 100 * percent + 0;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3591
// Size: 0x16a
function function_1c2a13eb67207b15(spawnpoint) {
    spawnglobals = level.spawnglobals;
    /#
        assert(isdefined(spawnglobals.hasclusterdata));
    #/
    /#
        assert(isdefined(spawnglobals.teamclusters) && isdefined(spawnglobals.teamclusters[self.team]));
    #/
    var_8471c2246452276d = -1;
    foreach (cluster in spawnglobals.teamclusters[self.team].clusterlist) {
        if (cluster.players.size <= 1) {
            continue;
        }
        distsq = distance2dsquared(cluster.center, spawnpoint.origin);
        if (var_8471c2246452276d < 0 || distsq < var_8471c2246452276d) {
            var_8471c2246452276d = distsq;
        }
    }
    if (var_8471c2246452276d < 0) {
        return 0;
    }
    if (var_8471c2246452276d < 10000) {
        return 100;
    }
    var_8471c2246452276d = int(min(var_8471c2246452276d, 9000000));
    percent = 1 - (var_8471c2246452276d - 10000) / (9000000 - 10000);
    return 100 * percent + 0;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3703
// Size: 0xc7
function function_f450413956d6d6c4(spawnpoint) {
    spawnglobals = level.spawnglobals;
    /#
        assert(isdefined(spawnglobals.haslanedata));
    #/
    /#
        assert(isdefined(spawnglobals.occupiedlanemasks));
    #/
    /#
        assert(isdefined(spawnpoint.lanemask));
    #/
    enemyteam = "all";
    if (level.teambased) {
        enemyteam = getenemyteams(self.team)[0];
    }
    if (!isdefined(spawnglobals.occupiedlanemasks[enemyteam])) {
        return 0;
    }
    if ((spawnpoint.lanemask & spawnglobals.occupiedlanemasks[enemyteam]) != 0) {
        return 100;
    } else {
        return 0;
    }
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37d1
// Size: 0x116
function function_d20f88ca67f03009(spawnpoint) {
    spawnglobals = level.spawnglobals;
    /#
        assert(isdefined(spawnglobals.haslanedata));
    #/
    /#
        assert(isdefined(spawnglobals.occupiedlanemasks));
    #/
    /#
        assert(isdefined(spawnpoint.lanemask));
    #/
    var_ac6ca28a64718193 = namespace_b2d5aa2baf2b5701::getspawnteam(self);
    enemyteam = "all";
    if (level.teambased) {
        enemyteam = getenemyteams(var_ac6ca28a64718193)[0];
    }
    if (!isdefined(spawnglobals.occupiedlanemasks[enemyteam])) {
        return 0;
    }
    var_e5c11a1b96be1d3c = spawnpoint.lanemask & spawnglobals.occupiedlanemasks[enemyteam];
    var_5e132bcebfcc07b2 = isdefined(spawnglobals.occupiedlanemasks[var_ac6ca28a64718193]) && spawnpoint.lanemask & spawnglobals.occupiedlanemasks[var_ac6ca28a64718193];
    if (var_e5c11a1b96be1d3c && !var_5e132bcebfcc07b2) {
        return 100;
    } else {
        return 0;
    }
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38ee
// Size: 0xd
function scriptonlytest(spawnpoint) {
    return 0;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3903
// Size: 0x104
function prefernearsinglepoint(spawnpoint) {
    var_4db3cfd2ea2d7b8f = level.spawnglobals.activespawncontext;
    var_e7c16a7d72e19271 = var_4db3cfd2ea2d7b8f.factorparams["singlePointPos"];
    mindistsq = var_4db3cfd2ea2d7b8f.factorparams["minDistToSinglePointSq"];
    maxdistsq = var_4db3cfd2ea2d7b8f.factorparams["maxDistToSinglePointSq"];
    var_9e3a315d4f55afc6 = var_4db3cfd2ea2d7b8f.factorparams["distRangeToSinglePointSq"];
    /#
        assert(var_9e3a315d4f55afc6 + 0.1 <= maxdistsq - mindistsq && var_9e3a315d4f55afc6 - 0.1 >= maxdistsq - mindistsq);
    #/
    distsq = distance2dsquared(var_e7c16a7d72e19271, spawnpoint.origin);
    if (distsq >= maxdistsq) {
        return 0;
    }
    if (distsq <= mindistsq) {
        return 100;
    }
    var_b1a0228d2ebc8326 = 1 - (distsq - mindistsq) / var_9e3a315d4f55afc6;
    return 100 * var_b1a0228d2ebc8326;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a0f
// Size: 0x61
function avoidcurrentspawntraps(spawnpoint) {
    var_4db3cfd2ea2d7b8f = level.spawnglobals.activespawncontext;
    var_8bb6b9b919c2c19d = function_b9e20b2afd68e3c1(spawnpoint, var_4db3cfd2ea2d7b8f.team);
    var_249e56cba357903c = pow(0.25, var_8bb6b9b919c2c19d);
    return 100 * var_249e56cba357903c;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a78
// Size: 0x23
function function_32368b70c6aa5729(spawnpoint) {
    spawnpoint.scriptdata.var_1a11950b5795681f = [];
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aa2
// Size: 0xa7
function function_158cc75a8c974987(player, var_ba669c07247b5ab0, attacker) {
    if (isdefined(player.var_edfdb2994e4d6040)) {
        return;
    }
    if (isdefined(attacker) && issentient(attacker) && !player namespace_e47104b48662385b::isenemy(attacker)) {
        return;
    }
    if (gettime() - player.lastspawntime > function_a0a31e5b8e6a394d()) {
        return;
    }
    if (isdefined(player.lastspawnpoint)) {
        player.var_edfdb2994e4d6040 = player.lastspawnpoint;
        function_fac896d21fc67e84(player.lastspawnpoint, player.team);
    }
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b50
// Size: 0x115
function function_fac896d21fc67e84(spawnpoint, team) {
    var_4a93a86de50c6977 = gettime();
    if (!istrue(level.teambased)) {
        team = "none";
    }
    scriptdata = level.spawnglobals.spawnpointscriptdata[spawnpoint.index];
    var_1cc5d9e71b667f58 = function_53c4c53197386572(scriptdata.var_1a11950b5795681f[team], undefined);
    if (!isdefined(var_1cc5d9e71b667f58)) {
        var_1cc5d9e71b667f58 = spawnstruct();
        var_1cc5d9e71b667f58.var_7bf1255a3715a632 = var_4a93a86de50c6977;
        var_1cc5d9e71b667f58.var_3b5af4bbbc57de2b = var_4a93a86de50c6977;
        var_1cc5d9e71b667f58.var_c2ca09e1949e8765 = 1;
        scriptdata.var_1a11950b5795681f[team] = var_1cc5d9e71b667f58;
    } else {
        if (var_4a93a86de50c6977 - var_1cc5d9e71b667f58.var_3b5af4bbbc57de2b > function_513d4a1188d51465()) {
            var_1cc5d9e71b667f58.var_7bf1255a3715a632 = var_4a93a86de50c6977;
            var_1cc5d9e71b667f58.var_c2ca09e1949e8765 = 1;
        } else {
            var_1cc5d9e71b667f58.var_c2ca09e1949e8765++;
        }
        var_1cc5d9e71b667f58.var_3b5af4bbbc57de2b = var_4a93a86de50c6977;
    }
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c6c
// Size: 0xaa
function function_b9e20b2afd68e3c1(spawnpoint, team) {
    var_4a93a86de50c6977 = gettime();
    if (!istrue(level.teambased)) {
        team = "none";
    }
    scriptdata = level.spawnglobals.spawnpointscriptdata[spawnpoint.index];
    var_1cc5d9e71b667f58 = function_53c4c53197386572(scriptdata.var_1a11950b5795681f[team], undefined);
    if (isdefined(var_1cc5d9e71b667f58)) {
        if (var_4a93a86de50c6977 - var_1cc5d9e71b667f58.var_3b5af4bbbc57de2b < function_513d4a1188d51465()) {
            return var_1cc5d9e71b667f58.var_c2ca09e1949e8765;
        }
    }
    return 0;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d1e
// Size: 0x3d
function function_a0a31e5b8e6a394d() {
    timems = 2000;
    var_5d42346f7be30e5c = getdvarfloat(@"hash_851a3f508adcd1dd", -1);
    if (var_5d42346f7be30e5c > 0) {
        timems = var_5d42346f7be30e5c * 1000;
    }
    return timems;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d63
// Size: 0x3d
function function_513d4a1188d51465() {
    timems = 6000;
    var_5d42346f7be30e5c = getdvarfloat(@"hash_3b2062ace30035", -1);
    if (var_5d42346f7be30e5c > 0) {
        timems = var_5d42346f7be30e5c * 1000;
    }
    return timems;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3da8
// Size: 0xa4
function avoidrugbyoffsides(spawnpoint) {
    var_4db3cfd2ea2d7b8f = level.spawnglobals.activespawncontext;
    juggpos = var_4db3cfd2ea2d7b8f.factorparams["juggPos"];
    var_3cb9f8eb3125d3b4 = var_4db3cfd2ea2d7b8f.factorparams["rugbyFieldDir2D"];
    var_9c6453d1f660c3dc = (spawnpoint.origin - juggpos) * (1, 1, 0);
    dot = vectordot(var_9c6453d1f660c3dc, var_3cb9f8eb3125d3b4);
    if (dot >= 0) {
        return 0;
    }
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e54
// Size: 0x39
function oneusespawns(spawnpoint) {
    scriptdata = spawnpoint.scriptdata;
    if (istrue(scriptdata.used)) {
        return 0;
    } else {
        return 100;
    }
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e94
// Size: 0x9d
function avoidclosetodefenderflag(spawnpoint, var_b8ad7552ce2e1e5a) {
    var_cc1acf45d269a8ac = undefined;
    var_eb28d9f8d5a7784d = var_b8ad7552ce2e1e5a["activeCarrierPosition"];
    var_c48319e73068aa11 = var_b8ad7552ce2e1e5a["defenderFlagPosition"];
    var_eb31d5343c6abc39 = var_b8ad7552ce2e1e5a["avoidDefenderFlagDeadZoneDistSq"];
    if (isdefined(var_eb28d9f8d5a7784d)) {
        var_cc1acf45d269a8ac = var_eb28d9f8d5a7784d;
    } else if (isdefined(var_c48319e73068aa11)) {
        var_cc1acf45d269a8ac = var_c48319e73068aa11;
    }
    if (isdefined(var_cc1acf45d269a8ac)) {
        var_8336f113929858a6 = distancesquared(var_cc1acf45d269a8ac, spawnpoint.origin);
        return ter_op(var_8336f113929858a6 < var_eb31d5343c6abc39, 0, 100);
    } else {
        return 100;
    }
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f38
// Size: 0x52
function avoidclosetodefenderflagspawn(spawnpoint, var_b8ad7552ce2e1e5a) {
    distsq = spawnpoint.scriptdata.distsqtodefenderfalgstart;
    var_eb31d5343c6abc39 = var_b8ad7552ce2e1e5a["avoidDefenderFlagDeadZoneDistSq"];
    return ter_op(distsq < var_eb31d5343c6abc39, 0, 100);
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f92
// Size: 0xbc
function avoidfrontlineoffsides(spawnpoint) {
    var_4db3cfd2ea2d7b8f = level.spawnglobals.activespawncontext;
    if (!isdefined(var_4db3cfd2ea2d7b8f.factorparams) || !isdefined(level.frontlinedata)) {
        return 100;
    }
    teamforward = var_4db3cfd2ea2d7b8f.factorparams["teamForward"];
    var_8cc8093272818080 = namespace_fab382c89d62fd63::function_8964b48e4eba5797(spawnpoint.origin);
    var_a620cb0e6444887f = vectornormalize(spawnpoint.origin - var_8cc8093272818080);
    dot = vectordot(var_a620cb0e6444887f, teamforward);
    if (dot >= 0) {
        return 0;
    }
    return 100;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4056
// Size: 0xb3
function preferoptimalfrontlinedist(spawnpoint) {
    var_4db3cfd2ea2d7b8f = level.spawnglobals.activespawncontext;
    if (!isdefined(var_4db3cfd2ea2d7b8f.factorparams) || !isdefined(level.frontlinedata)) {
        return 100;
    }
    idealdistsq = var_4db3cfd2ea2d7b8f.factorparams["idealDistSq"];
    var_f6f8270f02b2b9bf = namespace_fab382c89d62fd63::function_99146672ec896efa(spawnpoint.origin);
    percent = clamp(1 - abs(var_f6f8270f02b2b9bf - idealdistsq) / idealdistsq, 0, 1);
    return 100 * percent + 0;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4111
// Size: 0x88
function preferunoccupiedlanes(spawnpoint) {
    var_4db3cfd2ea2d7b8f = level.spawnglobals.activespawncontext;
    var_9799f8752d4ae4bf = 67108864;
    var_f6f8270f02b2b9bf = namespace_fab382c89d62fd63::function_7855eb28c2d21061(spawnpoint.origin, self.team);
    percent = clamp(1 - var_f6f8270f02b2b9bf / var_9799f8752d4ae4bf, 0, 1);
    return 100 * percent + 0;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41a1
// Size: 0x16
function private on_player_spawned(params) {
    self.var_edfdb2994e4d6040 = undefined;
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41be
// Size: 0x20
function private on_player_death(params) {
    function_158cc75a8c974987(self, params, params.attacker);
}

// Namespace namespace_164d533d51098167/namespace_b41002c7afebd276
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41e5
// Size: 0x20
function private on_player_damaged(params) {
    function_158cc75a8c974987(self, params, params.eattacker);
}

