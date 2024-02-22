// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gameobjects.gsc;
#using script_3d2770dc09c1243;

#namespace accolades;

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce0
// Size: 0x1309
function init() {
    level.accolades = [];
    if (!isdefined(level.var_48154008716f7116)) {
        level.var_48154008716f7116 = getdvarint(@"hash_609906ade74f653e", 0);
    }
    registeraccolade("adsKills", [0:"adsKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("hipfireKills", [0:"hipfireKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("lowerRankedKills", [0:"lowerRankedKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("higherRankedKills", [0:"higherRankedKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("highestRankedKills", [0:"highestRankedKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("reloads", [0:"reloads"], 0, 0, undefined, undefined, undefined);
    registeraccolade("weaponPickups", [0:"weaponPickups"], 0, 0, undefined, undefined, undefined);
    registeraccolade("shotsFired", [0:"shotsFired"], 0, 0, undefined, undefined, undefined);
    registeraccolade("classChanges", [0:"classChanges"], 0, 0, &isclasschoiceallowed, undefined, undefined);
    registeraccolade("headshots", [0:"headshots"], 0, 0, undefined, undefined, undefined);
    registeraccolade("timeWatchingKillcams", [0:"timeWatchingKillcams"], 0, 0, &arekillcamsenabled, undefined, undefined);
    registeraccolade("skippedKillcams", [0:"skippedKillcams"], 0, 0, &arekillcamsenabled, undefined, undefined);
    registeraccolade("longestStreak", [0:"longestStreak"], 0, 0, undefined, undefined, undefined);
    registeraccolade("mostKills", [0:"kills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("leastKills", [0:"kills"], 0, 1, undefined, undefined, &scoreminimum);
    registeraccolade("mostAssists", [0:"assists"], 0, 0, undefined, undefined, undefined);
    registeraccolade("leastAssists", [0:"assists"], 0, 1, undefined, undefined, &scoreminimum);
    registeraccolade("mostDeaths", [0:"deaths"], 0, 0, undefined, undefined, undefined);
    registeraccolade("leastDeaths", [0:"deaths"], 0, 1, undefined, undefined, &scoreminimum);
    registeraccolade("suicides", [0:"suicides"], 0, 0, undefined, undefined, undefined);
    registeraccolade("noKillsWithDeath", [0:"kills", 1:"deaths"], 0, 0, undefined, undefined, &nokillswithdeath_evaluate);
    registeraccolade("noKillNoDeath", [0:"kills", 1:"deaths"], 0, 0, undefined, undefined, &nokillnodeath_evaluate);
    registeraccolade("noKill10Deaths", [0:"kills", 1:"deaths"], 0, 0, undefined, undefined, &nokill10deaths_evaluate);
    registeraccolade("mostKillsLeastDeaths", [0:"kills", 1:"deaths"], 0, 0, undefined, undefined, &mostkillsleastdeaths_evaluate);
    registeraccolade("mostKillsMostHeadshots", [0:"kills", 1:"headshots"], 0, 0, undefined, undefined, &mostkillsmostheadshots_evaluate);
    registeraccolade("mostKillsLongestStreak", [0:"kills", 1:"longestStreak"], 0, 0, undefined, undefined, &mostkillslongeststreak_evaluate);
    registeraccolade("kills10NoDeaths", [0:"kills", 1:"deaths"], 0, 0, undefined, undefined, &kills10nodeaths_evaluate);
    registeraccolade("deathsFromBehind", [0:"deathsFromBehind"], 0, 0, undefined, undefined, undefined);
    registeraccolade("killsFromBehind", [0:"killsFromBehind"], 0, 0, undefined, undefined, undefined);
    registeraccolade("noDeathsFromBehind", [0:"deathsFromBehind"], 0, 1, undefined, undefined, &nodeathsfrombehind_evaluate);
    registeraccolade("shortestLife", [0:"shortestLife"], 0, 0, undefined, undefined, &scoreminimum);
    registeraccolade("longestLife", [0:"longestLife"], 0, 0, undefined, undefined, undefined);
    registeraccolade("damageDealt", [0:"damage"], 0, 0, undefined, undefined, undefined);
    registeraccolade("damageTaken", [0:"damageTaken"], 0, 0, undefined, undefined, undefined);
    registeraccolade("highestMultikill", [0:"highestMultikill"], 0, 0, undefined, undefined, undefined);
    registeraccolade("mostMultikills", [0:"mostMultikills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("revives", [0:"revives"], 0, 0, &isreviveenabled, undefined, undefined);
    registeraccolade("penetrationKills", [0:"penetrationKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("revengeKills", [0:"revengeKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("avengerKills", [0:"avengerKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("defenderKills", [0:"defenderKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("longshotKills", [0:"longshotKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("pointBlankKills", [0:"pointBlankKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("oneShotOneKills", [0:"oneShotOneKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("executionKills", [0:"executionKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("comebackKills", [0:"comebackKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("explosionsSurvived", [0:"explosionsSurvived"], 0, 0, undefined, undefined, undefined);
    registeraccolade("killEnemyTeam", [0:"killEnemyTeam"], 0, 0, &iscorempgametype, undefined, undefined);
    registeraccolade("timeCrouched", [0:"timeCrouched"], 0, 0, &isnotleanthreadmode, undefined, undefined);
    registeraccolade("timeProne", [0:"timeProne"], 0, 0, &isnotleanthreadmode, undefined, undefined);
    registeraccolade("distanceTravelled", [0:"totalDistTraveled"], 0, 0, &isnotleanthreadmode, undefined, undefined);
    registeraccolade("highestAvgAltitude", [0:"averageAltitude", 1:"averageAltitudeCount"], 0, 0, &isnotleanthreadmode, undefined, &highestavgaltitude_evaluate);
    registeraccolade("lowestAvgAltitude", [0:"averageAltitude", 1:"averageAltitudeCount"], 0, 0, &isnotleanthreadmode, undefined, &lowestavgaltitude_evaluate);
    registeraccolade("meleeKills", [0:"meleeKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("pistolKills", [0:"pistolKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("launcherKills", [0:"launcherKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("shotgunKills", [0:"shotgunKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("smgKills", [0:"smgKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("arKills", [0:"arKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("lmgKills", [0:"lmgKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("sniperKills", [0:"sniperKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("pistolHeadshots", [0:"pistolHeadshots"], 0, 0, undefined, undefined, undefined);
    registeraccolade("launcherHeadshots", [0:"launcherHeadshots"], 0, 0, undefined, undefined, undefined);
    registeraccolade("shotgunHeadshots", [0:"shotgunHeadshots"], 0, 0, undefined, undefined, undefined);
    registeraccolade("smgHeadshots", [0:"smgHeadshots"], 0, 0, undefined, undefined, undefined);
    registeraccolade("arHeadshots", [0:"arHeadshots"], 0, 0, undefined, undefined, undefined);
    registeraccolade("lmgHeadshots", [0:"lmgHeadshots"], 0, 0, undefined, undefined, undefined);
    registeraccolade("sniperHeadshots", [0:"sniperHeadshots"], 0, 0, undefined, undefined, undefined);
    registeraccolade("meleeDeaths", [0:"meleeDeaths"], 0, 0, undefined, undefined, undefined);
    registeraccolade("pistolPeaths", [0:"pistolPeaths"], 0, 0, undefined, undefined, undefined);
    registeraccolade("launcherDeaths", [0:"launcherDeaths"], 0, 0, undefined, undefined, undefined);
    registeraccolade("shotgunDeaths", [0:"shotgunDeaths"], 0, 0, undefined, undefined, undefined);
    registeraccolade("smgDeaths", [0:"smgDeaths"], 0, 0, undefined, undefined, undefined);
    registeraccolade("arDeaths", [0:"arDeaths"], 0, 0, undefined, undefined, undefined);
    registeraccolade("lmgDeaths", [0:"lmgDeaths"], 0, 0, undefined, undefined, undefined);
    registeraccolade("sniperDeaths", [0:"sniperDeaths"], 0, 0, undefined, undefined, undefined);
    registeraccolade("riotShieldDamageAbsorbed", [0:"riotShieldDamageAbsorbed"], 0, 0, undefined, undefined, undefined);
    registeraccolade("killstreakPersonalUAVKills", [0:"killstreakPersonalUAVKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakShieldTurretKills", [0:"killstreakShieldTurretKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakUAVAssists", [0:"killstreakUAVAssists"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakCUAVAssists", [0:"killstreakCUAVAssists"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakCarePackageUsed", [0:"killstreakCarePackageUsed"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakCluserStrikeKills", [0:"killstreakCluserStrikeKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakCruiseMissileKills", [0:"killstreakCruiseMissileKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakAirstrikeKills", [0:"killstreakAirstrikeKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakTankKills", [0:"killstreakTankKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakSentryGunKills", [0:"killstreakSentryGunKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakWheelsonKills", [0:"killstreakWheelsonKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakEmergencyAirdropUsed", [0:"killstreakEmergencyAirdropUsed"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakVTOLJetKills", [0:"killstreakVTOLJetKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakWhitePhosphorousKillsAssists", [0:"killstreakWhitePhosphorousKillsAssists"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakChopperGunnerKills", [0:"killstreakChopperGunnerKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakChopperSupportKills", [0:"killstreakChopperSupportKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakGunshipKills", [0:"killstreakGunshipKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakAUAVAssists", [0:"killstreakAUAVAssists"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakJuggernautKills", [0:"killstreakJuggernautKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakKills", [0:"killstreakKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakAirKills", [0:"killstreakAirKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakGroundKills", [0:"killstreakGroundKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("destroyedKillstreaks", [0:"destroyedKillstreaks"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("killstreakRemoteTurretKills", [0:"killstreakRemoteTurretKills"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("fragKills", [0:"fragKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("semtexKills", [0:"semtexKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("molotovKills", [0:"molotovKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("claymoreKills", [0:"claymoreKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("throwingKnifeKills", [0:"throwingKnifeKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("c4LethalKills", [0:"c4Kills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("thermiteKills", [0:"thermiteKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("proximityMineKills", [0:"proximityMineKills"], 0, 0, undefined, undefined, undefined);
    registeraccolade("flashbangHits", [0:"flashbangHits"], 0, 0, undefined, undefined, undefined);
    registeraccolade("smokesUsed", [0:"smokesUsed"], 0, 0, undefined, undefined, undefined);
    registeraccolade("stunHits", [0:"stunHits"], 0, 0, undefined, undefined, undefined);
    registeraccolade("stimDamageHealed", [0:"stimDamageHealed"], 0, 0, undefined, undefined, undefined);
    registeraccolade("decoyHits", [0:"decoyHits"], 0, 0, undefined, undefined, undefined);
    registeraccolade("gasHits", [0:"gasHits"], 0, 0, undefined, undefined, undefined);
    registeraccolade("snapshotHits", [0:"snapshotHits"], 0, 0, undefined, undefined, undefined);
    registeraccolade("trackerGrenadeHits", [0:"trackerGrenadeHits"], 0, 0, undefined, undefined, undefined);
    registeraccolade("butterflyMineHits", [0:"butterflyMineHits"], 0, 0, undefined, undefined, undefined);
    registeraccolade("thermobaricGrenadeHits", [0:"thermobaricGrenadeHits"], 0, 0, undefined, undefined, undefined);
    registeraccolade("ammoBoxUsed", [0:"ammoBoxUsed"], 0, 0, &arefieldupgradesallowed, undefined, undefined);
    registeraccolade("reconDroneMarks", [0:"reconDroneMarks"], 0, 0, &arefieldupgradesallowed, undefined, undefined);
    registeraccolade("empDroneHits", [0:"empDroneHits"], 0, 0, &arefieldupgradesallowed, undefined, undefined);
    registeraccolade("stoppingPowerKills", [0:"stoppingPowerKills"], 0, 0, &arefieldupgradesallowed, undefined, undefined);
    registeraccolade("trophySystemHits", [0:"trophySystemHits"], 0, 0, &arefieldupgradesallowed, undefined, undefined);
    registeraccolade("deadSilenceKills", [0:"deadSilenceKills"], 0, 0, &arefieldupgradesallowed, undefined, undefined);
    registeraccolade("tacticalInsertionSpawns", [0:"tacticalInsertionSpawns"], 0, 0, &arefieldupgradesallowed, undefined, undefined);
    registeraccolade("deployableCoverUsed", [0:"deployableCoverUsed"], 0, 0, &arefieldupgradesallowed, undefined, undefined);
    registeraccolade("munitionsBoxUsed", [0:"munitionsBoxUsed"], 0, 0, &arefieldupgradesallowed, undefined, undefined);
    registeraccolade("blastshieldBoxUsed", [0:"blastshieldBoxUsed"], 0, 0, &arefieldupgradesallowed, undefined, undefined);
    registeraccolade("selfReviveBoxUsed", [0:"selfReviveBoxUsed"], 0, 0, &arefieldupgradesallowed, undefined, undefined);
    registeraccolade("defends", [0:"defends"], 0, 0, &isobjectivegametype, undefined, undefined);
    registeraccolade("assaults", [0:"assaults"], 0, 0, &isobjectivegametype, undefined, undefined);
    registeraccolade("pickups", [0:"pickups"], 0, 0, &iscarrygametype, undefined, undefined);
    registeraccolade("captures", [0:"captures"], 0, 0, &iscapturegametype, undefined, undefined);
    registeraccolade("returns", [0:"returns"], 0, 0, &isctf, undefined, undefined);
    registeraccolade("carrierKills", [0:"carrierKills"], 0, 0, &iscarrygametype, undefined, undefined);
    registeraccolade("bombPlanted", [0:"plants"], 0, 0, &isbombgametype, undefined, undefined);
    registeraccolade("bombDefused", [0:"defuses"], 0, 0, &isbombgametype, undefined, undefined);
    registeraccolade("bombDetonated", [0:"destructions"], 0, 0, &isbombgametype, undefined, undefined);
    registeraccolade("clutch", [0:"clutch"], 0, 0, &islifelimited, undefined, undefined);
    registeraccolade("clutchRevives", [0:"clutchRevives"], 0, 0, &isreviveenabled, undefined, undefined);
    registeraccolade("tagsCaptured", [0:"confirmed"], 0, 0, &aretagsenabled, undefined, undefined);
    registeraccolade("tagsDenied", [0:"denied"], 0, 0, &aretagsenabled, undefined, undefined);
    registeraccolade("tagsMegaBanked", [0:"tagsMegaBanked"], 0, 0, &isgrind, undefined, undefined);
    registeraccolade("tagsLargestBank", [0:"tagsLargestBank"], 0, 0, &isgrind, undefined, undefined);
    registeraccolade("firstInfected", [0:"firstInfected"], 0, 0, &isinfected, undefined, undefined);
    registeraccolade("survivorKills", [0:"killsAsSurvivor"], 0, 0, &isinfected, undefined, undefined);
    registeraccolade("infectedKills", [0:"killsAsInfected"], 0, 0, &isinfected, undefined, undefined);
    registeraccolade("lastSurvivor", [0:"lastSurvivor"], 0, 0, &isinfected, undefined, undefined);
    registeraccolade("setbacks", [0:"setbacks"], 0, 0, &isgungame, undefined, undefined);
    registeraccolade("longestTimeSpentOnWeapon", [0:"longestTimeSpentOnWeapon"], 0, 0, &isgungame, undefined, undefined);
    registeraccolade("carepackagesCaptured", [0:"carepackagesCaptured"], 0, 0, &arekillstreaksallowed, undefined, undefined);
    registeraccolade("spawnSelectSquad", [0:"spawnSelectSquad"], 0, 0, &isspawnselectionenabled, undefined, undefined);
    registeraccolade("spawnSelectVehicle", [0:"spawnSelectVehicle"], 0, 0, &isspawnselectionenabled, undefined, undefined);
    registeraccolade("spawnSelectFlag", [0:"spawnSelectFlag"], 0, 0, &isspawnselectionenabled, undefined, undefined);
    registeraccolade("spawnSelectBase", [0:"spawnSelectBase"], 0, 0, &isspawnselectionenabled, undefined, undefined);
    registeraccolade("timesSelectedAsSquadLeader", [0:"timesSelectedAsSquadLeader"], 0, 0, &isspawnselectionenabled, undefined, undefined);
    registeraccolade("timeSpentAsDriver", [0:"timeSpentAsDriver"], 0, 0, &arevehiclesenabled, undefined, undefined);
    registeraccolade("timeSpentAsPassenger", [0:"timeSpentAsPassenger"], 0, 0, &arevehiclesenabled, undefined, undefined);
    registeraccolade("distanceTraveledInVehicle", [0:"distanceTraveledInVehicle"], 0, 0, &arevehiclesenabled, undefined, undefined);
    registeraccolade("timeOnPoint", [0:"objTime"], 0, 0, &ishardpoint, undefined, undefined);
    registeraccolade("armorBoxUsed", [0:"armorBoxUsed"], 0, 0, &arefieldupgradesallowed, undefined, undefined);
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ff0
// Size: 0xe2
function registeraccolade(ref, datapoints, priority, var_b9056cc2c7e5783e, validatefunc, updatefunc, evaluatefunc) {
    /#
        assertex(!isdefined(level.accolades[ref]), "Accolade with a ref of " + ref + " already exists!");
    #/
    data = spawnstruct();
    data.datapoints = datapoints;
    data.priority = priority;
    data.intialvalueisvalid = var_b9056cc2c7e5783e;
    data.evaluatefunc = evaluatefunc;
    data.winners = [];
    data.isactive = !isdefined(validatefunc) || [[ validatefunc ]]();
    level.accolades[ref] = data;
    if (isdefined(updatefunc)) {
        level thread [[ updatefunc ]]();
    }
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d9
// Size: 0xe2
function applyaccoladestructtoplayerpers() {
    if (!level.rankedmatch) {
        return;
    }
    foreach (ref, accolade in level.accolades) {
        self setplayerdata(level.var_5d69837cf4db0407, "playerStats", "matchAccolades", ref, 0);
        if (!isdefined(accolade.datapoints)) {
            continue;
        }
        foreach (var_74b0293d336b519d in accolade.datapoints) {
            initpersstat(var_74b0293d336b519d);
        }
    }
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c2
// Size: 0x314
function evaluateallaccolades() {
    if (!istrue(level.challengesallowed)) {
        return;
    }
    if (istrue(level.var_48154008716f7116)) {
        return;
    }
    foreach (ref, accolade in level.accolades) {
        if (!accolade.isactive) {
            continue;
        }
        level evaluateaccolade(ref);
    }
    foreach (ref, accolade in level.accolades) {
        if (!accolade.isactive) {
            continue;
        }
        foreach (winner in accolade.winners) {
            if (!isdefined(winner)) {
                continue;
            }
            oldval = winner getplayerdata(level.var_5d69837cf4db0407, "playerStats", "accoladeStats", ref);
            winner setplayerdata(level.var_5d69837cf4db0407, "playerStats", "accoladeStats", ref, oldval + 1);
            winner setplayerdata(level.var_5d69837cf4db0407, "playerStats", "matchAccolades", ref, 1);
        }
    }
    /#
        println("mostKillsLongestStreak");
        println("killstreakWhitePhosphorousKillsAssists");
        println("mostKillsLongestStreak");
        foreach (ref, accolade in level.accolades) {
            if (!accolade.isactive) {
                continue;
            }
            println(ref);
            foreach (winner in accolade.winners) {
                var_c2d1738d79d98c15 = 0;
                if (isdefined(level.accolades[ref].evaluatefunc)) {
                    var_c2d1738d79d98c15 = winner [[ level.accolades[ref].evaluatefunc ]](ref);
                } else {
                    /#
                        assertex(level.accolades[ref].datapoints.size == 1, "carepackagesCaptured" + ref + "timeOnPoint");
                    #/
                    var_c2d1738d79d98c15 = winner namespace_3c5a4254f2b957ea::getpersstat(level.accolades[ref].datapoints[0]);
                }
                println("<unknown string>" + var_c2d1738d79d98c15 + "<unknown string>" + winner.name);
            }
            println("<unknown string>");
        }
    #/
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24dd
// Size: 0x1bc
function evaluateaccolade(ref) {
    highestvalue = undefined;
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        var_c2d1738d79d98c15 = player namespace_3c5a4254f2b957ea::getpersstat(ref);
        if (isdefined(level.accolades[ref].evaluatefunc)) {
            var_c2d1738d79d98c15 = player [[ level.accolades[ref].evaluatefunc ]](ref);
        } else {
            /#
                assertex(level.accolades[ref].datapoints.size == 1, "Accolade " + ref + " has more than 1 dataPoint with no evaluateFunc defined!");
            #/
            var_c2d1738d79d98c15 = player namespace_3c5a4254f2b957ea::getpersstat(level.accolades[ref].datapoints[0]);
        }
        if (!isdefined(var_c2d1738d79d98c15) || !level.accolades[ref].intialvalueisvalid && var_c2d1738d79d98c15 == 0) {
            continue;
        }
        if (!isdefined(highestvalue) || var_c2d1738d79d98c15 > highestvalue) {
            highestvalue = var_c2d1738d79d98c15;
            level.accolades[ref].winners = [];
            level.accolades[ref].winners[level.accolades[ref].winners.size] = player;
        } else if (var_c2d1738d79d98c15 == highestvalue) {
            level.accolades[ref].winners[level.accolades[ref].winners.size] = player;
        }
    }
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26a0
// Size: 0xd
function arekillcamsenabled() {
    return istrue(level.killcam);
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26b5
// Size: 0xa
function isnotleanthreadmode() {
    return !runleanthreadmode();
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26c7
// Size: 0x15
function isclasschoiceallowed() {
    gameflagwait("infil_setup_complete");
    return allowclasschoice();
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e4
// Size: 0xd
function isreviveenabled() {
    return istrue(level.numrevives);
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26f9
// Size: 0xa
function iscorempgametype() {
    return !namespace_36f464722d326bbe::isbrstylegametype();
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270b
// Size: 0xd
function arekillstreaksallowed() {
    return istrue(level.allowkillstreaks);
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2720
// Size: 0xd
function arefieldupgradesallowed() {
    return istrue(level.allowsupers);
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2735
// Size: 0x29
function isobjectivegametype() {
    return getgametype() != "war" && getgametype() != "dm" && !namespace_36f464722d326bbe::isbrstylegametype();
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2766
// Size: 0x9
function isbombgametype() {
    return namespace_19b4203b51d56488::isbombmode();
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2777
// Size: 0x39
function iscarrygametype() {
    if (namespace_19b4203b51d56488::isbombmode()) {
        return 1;
    }
    switch (getgametype()) {
    case #"hash_1a5d186c17c00d3c":
    case #"hash_3a17de6e294210d2":
        return 1;
        break;
    }
    return 0;
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27b8
// Size: 0x99
function iscapturegametype() {
    switch (getgametype()) {
    case #"hash_ca6516c10db2c95":
    case #"hash_53825b446469ac4c":
    case #"hash_5e78ea9021845d4a":
    case #"hash_5ff8e011d5b9d1c8":
    case #"hash_6efb0f59a62300fb":
    case #"hash_7f9c384a34cc392f":
    case #"hash_dd5b900f435d3f36":
    case #"hash_ec24570718a340f5":
    case #"hash_ec72fd25bbbac99e":
    case #"hash_f4a9126c03d3385b":
    case #"hash_fa34c5f6bd6d4432":
        return 1;
        break;
    }
    return 0;
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2859
// Size: 0xf
function isctf() {
    return getgametype() == "ctf";
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2870
// Size: 0xd
function isspawnselectionenabled() {
    return istrue(level.usespawnselection);
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2885
// Size: 0xd
function aretagsenabled() {
    return istrue(level.dogtagsenabled);
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x289a
// Size: 0xf
function isgrind() {
    return getgametype() == "grind";
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28b1
// Size: 0x9
function isinfected() {
    return namespace_36f464722d326bbe::function_2536e99eb6586f8f();
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c2
// Size: 0xf
function isgungame() {
    return getgametype() == "gun";
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28d9
// Size: 0x2f
function ishardpoint() {
    return getgametype() == "koth" || getgametype() == "koth_horde" || getgametype() == "grnd";
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2910
// Size: 0x1d
function arevehiclesenabled() {
    if (namespace_ef54497d29a56093::function_5a60778277d6ae4b()) {
        return 0;
    }
    return getmatchrulesdata("commonOption", "allowVehicles");
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2935
// Size: 0x5b
function scoreminimum(ref) {
    /#
        assertex(level.accolades[ref].datapoints.size == 1, "scoreMinimum " + ref + " has more than 1 dataPoint defined!");
    #/
    return namespace_3c5a4254f2b957ea::getpersstat(level.accolades[ref].datapoints[0]) * -1;
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2998
// Size: 0x31
function nokillswithdeath_evaluate(ref) {
    if (namespace_3c5a4254f2b957ea::getpersstat("kills") == 0 && namespace_3c5a4254f2b957ea::getpersstat("deaths") > 0) {
        return 1;
    }
    return 0;
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29d1
// Size: 0x31
function nokillnodeath_evaluate(ref) {
    if (namespace_3c5a4254f2b957ea::getpersstat("kills") == 0 && namespace_3c5a4254f2b957ea::getpersstat("deaths") == 0) {
        return 1;
    }
    return 0;
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a0a
// Size: 0x32
function nokill10deaths_evaluate(ref) {
    if (namespace_3c5a4254f2b957ea::getpersstat("kills") == 0 && namespace_3c5a4254f2b957ea::getpersstat("deaths") >= 10) {
        return 1;
    }
    return 0;
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a44
// Size: 0x6f
function mostkillsleastdeaths_evaluate(ref) {
    check1 = array_contains(level.accolades["mostKills"].winners, self);
    check2 = array_contains(level.accolades["leastDeaths"].winners, self);
    if (check1 && check2) {
        return 1;
    }
    return 0;
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2abb
// Size: 0x6f
function mostkillsmostheadshots_evaluate(ref) {
    check1 = array_contains(level.accolades["mostKills"].winners, self);
    check2 = array_contains(level.accolades["headshots"].winners, self);
    if (check1 && check2) {
        return 1;
    }
    return 0;
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b32
// Size: 0x6f
function mostkillslongeststreak_evaluate(ref) {
    check1 = array_contains(level.accolades["mostKills"].winners, self);
    check2 = array_contains(level.accolades["longestStreak"].winners, self);
    if (check1 && check2) {
        return 1;
    }
    return 0;
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ba9
// Size: 0x32
function kills10nodeaths_evaluate(ref) {
    if (namespace_3c5a4254f2b957ea::getpersstat("kills") >= 10 && namespace_3c5a4254f2b957ea::getpersstat("deaths") == 0) {
        return 1;
    }
    return 0;
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2be3
// Size: 0x3e
function nodeathsfrombehind_evaluate(ref) {
    if (isdefined(self.pers) && isdefined(namespace_3c5a4254f2b957ea::getpersstat("deathsFromBehind")) && namespace_3c5a4254f2b957ea::getpersstat("deathsFromBehind") == 10) {
        return 1;
    }
    return 0;
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c29
// Size: 0x39
function highestavgaltitude_evaluate(ref) {
    if (namespace_3c5a4254f2b957ea::getpersstat("averageAltitudeCount") > 0) {
        return (namespace_3c5a4254f2b957ea::getpersstat("averageAltitude") / namespace_3c5a4254f2b957ea::getpersstat("averageAltitudeCount"));
    } else {
        return 0;
    }
}

// Namespace accolades/namespace_801bcc0d4eadf9a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c69
// Size: 0x3c
function lowestavgaltitude_evaluate(ref) {
    if (namespace_3c5a4254f2b957ea::getpersstat("averageAltitudeCount") > 0) {
        return (namespace_3c5a4254f2b957ea::getpersstat("averageAltitude") / namespace_3c5a4254f2b957ea::getpersstat("averageAltitudeCount") * -1);
    } else {
        return 0;
    }
}

