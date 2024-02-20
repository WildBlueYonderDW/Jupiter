// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\gametypes\dom.gsc;

#namespace namespace_e4691dd72735bbc5;

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b5
// Size: 0x37
function monitoradd(tank, timeout) {
    tank.script_timeout = timeout;
    level.tanktimeoutlist[level.tanktimeoutlist.size] = tank;
}

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f3
// Size: 0x103
function spawntanks(var_a85ce59e9fcd4439, team) {
    level endon("game_ended");
    wait(0.05);
    foreach (tankSpawn in var_a85ce59e9fcd4439) {
        if (!isdefined(tankSpawn.angles)) {
            tankSpawn.angles = (0, 0, 0);
        }
        refill = ter_op(isdefined(tankSpawn.script_force_count), tankSpawn.script_force_count, 0);
        timeout = ter_op(isdefined(tankSpawn.script_timeout), tankSpawn.script_timeout, 0);
        level thread spawntankandmonitor(tankSpawn.origin, tankSpawn.angles, team, refill, timeout);
    }
}

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fd
// Size: 0x71
function spawntankandmonitor(origin, angles, team, refill, timeout) {
    level endon("game_ended");
    tank = spawntank(origin, angles, team, timeout, 0);
    if (refill) {
        while (1) {
            tank waittill("death");
            wait(3);
            tank = spawntank(origin, angles, team, timeout, 1);
        }
    }
}

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x475
// Size: 0x103
function spawntank(origin, angles, team, timeout, infil) {
    /#
        assert(issharedfuncdefined("light_tank", "initSpawnData"), "script_struct_mp_lighttank.gsc wasn't initialized. Does this map have a light tank spawn point compiled in?");
    #/
    if (!issharedfuncdefined("light_tank", "initSpawnData")) {
        return;
    }
    spawndata = spawnstruct();
    [[ getsharedfunc("light_tank", "initSpawnData") ]](spawndata);
    spawndata.cantimeout = 0;
    spawndata.spawnmethod = ter_op(istrue(infil), "airdrop_at_position_unsafe", "place_at_position_unsafe");
    spawndata.origin = origin;
    spawndata.angles = angles;
    spawndata.team = team;
    tank = [[ getsharedfunc("light_tank", "tankSpawn") ]](spawndata);
    if (timeout > 0) {
        monitoradd(tank, timeout);
    }
    return tank;
}

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x580
// Size: 0x30e
function inittankspawns() {
    level.tankstartspawnallies = getstructarray("tdm_bradley_allies", "targetname");
    level.tankstartspawnaxis = getstructarray("tdm_bradley_axis", "targetname");
    level.tankstartspawnneutral = getstructarray("tdm_bradley_neutral", "targetname");
    level.tankstartspawnalliesdom = getstructarray("dom_bradley_allies", "targetname");
    level.tankstartspawnaxisdom = getstructarray("dom_bradley_axis", "targetname");
    level.tankspawndom_a = getstructarray("dom_bradley_a", "targetname");
    level.tankspawndom_b = getstructarray("dom_bradley_b", "targetname");
    level.tankspawndom_c = getstructarray("dom_bradley_c", "targetname");
    level.tankstartspawnalliescmd = getstructarray("cmd_bradley_allies", "targetname");
    level.tankstartspawnaxiscmd = getstructarray("cmd_bradley_axis", "targetname");
    level.tankspawncmd_2 = getstructarray("cmd_bradley_2", "targetname");
    level.tankspawncmd_3 = getstructarray("cmd_bradley_3", "targetname");
    level.tankspawncmd_1 = getstructarray("cmd_bradley_1", "targetname");
    if (getdvarint(@"hash_3bfe19e3234d5dff", 0) == 0) {
        return;
    }
    gametypes = [0:"cmd", 1:"dom", 2:"war", 3:"arm", 4:"conflict", 5:"risk"];
    var_8c28012a76120a71 = array_find(gametypes, getgametype());
    if (!isdefined(var_8c28012a76120a71)) {
        var_8c28012a76120a71 = gametypes.size;
    }
    for (i = var_8c28012a76120a71; i < gametypes.size; i++) {
        var_9fb431ae2d7ece3b = gametypes[i];
        if (var_9fb431ae2d7ece3b == "war") {
            if (level.tankstartspawnallies.size != 0 || level.tankstartspawnaxis.size != 0 || level.tankstartspawnneutral.size != 0) {
                spawnstartingbradleystdm();
                if (level.tankstartspawnneutral.size != 0) {
                    thread kickoffneutralbradleyspawnstdm();
                }
                break;
            }
        } else if (var_9fb431ae2d7ece3b == "dom") {
            if (level.tankstartspawnalliesdom.size != 0 || level.tankstartspawnaxisdom.size != 0 || level.tankspawndom_a.size != 0 || level.tankspawndom_b.size != 0 || level.tankspawndom_c.size != 0) {
                thread kickoffneutralbradleyspawnsdom();
                break;
            }
        } else if (var_9fb431ae2d7ece3b == "cmd") {
            if (level.tankstartspawnalliescmd.size != 0 || level.tankstartspawnaxiscmd.size != 0 || level.tankspawncmd_1.size != 0 || level.tankspawncmd_2.size != 0 || level.tankspawncmd_3.size != 0) {
                spawnstartingbradleyscmd();
                break;
            }
        }
    }
}

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x895
// Size: 0x151
function spawnstartingbradleystdm() {
    if (level.tankstartspawnallies.size != 0 && level.tankstartspawnaxis.size != 0) {
        angles = (0, 0, 0);
        if (isdefined(level.tankstartspawnallies[0].angles)) {
            angles = level.tankstartspawnallies[0].angles;
        }
        /#
            println("allies" + level.tankstartspawnallies[0].origin);
            println("<unknown string>" + angles);
        #/
        thread spawnbradleynoduration(level.tankstartspawnallies[0].origin, angles, "allies");
        angles = (0, 0, 0);
        if (isdefined(level.tankstartspawnaxis[0].angles)) {
            angles = level.tankstartspawnaxis[0].angles;
        }
        /#
            println("<unknown string>" + level.tankstartspawnaxis[0].origin);
            println("<unknown string>" + angles);
        #/
        thread spawnbradleynoduration(level.tankstartspawnaxis[0].origin, angles, "axis");
    }
}

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ed
// Size: 0x1a1
function spawnstartingbradleysdom() {
    if (level.tankstartspawnalliesdom.size != 0 && level.tankstartspawnaxisdom.size != 0) {
        var_7e4886c52a1bc723 = (0, 0, 0);
        var_a6c0109970e785cd = (0, 0, 0);
        var_76fd430e3623fb30 = (0, 0, 0);
        var_c0e9f05d2f85a432 = (0, 0, 0);
        if (isdefined(level.tankstartspawnalliesdom[0].angles)) {
            var_7e4886c52a1bc723 = level.tankstartspawnalliesdom[0].angles;
        }
        var_a6c0109970e785cd = level.tankstartspawnalliesdom[0].origin;
        /#
            println("<unknown string>" + level.tankstartspawnalliesdom[0].origin);
        #/
        if (isdefined(level.tankstartspawnaxisdom[0].angles)) {
            var_76fd430e3623fb30 = level.tankstartspawnaxisdom[0].angles;
        }
        var_c0e9f05d2f85a432 = level.tankstartspawnaxisdom[0].origin;
        /#
            println("<unknown string>" + level.tankstartspawnaxisdom[0].origin);
        #/
        if (game["switchedsides"]) {
            thread spawnbradleynoduration(var_c0e9f05d2f85a432, var_76fd430e3623fb30, "allies");
            thread spawnbradleynoduration(var_a6c0109970e785cd, var_7e4886c52a1bc723, "axis");
        } else {
            thread spawnbradleynoduration(var_c0e9f05d2f85a432, var_76fd430e3623fb30, "axis");
            thread spawnbradleynoduration(var_a6c0109970e785cd, var_7e4886c52a1bc723, "allies");
        }
    }
}

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb95
// Size: 0x151
function spawnstartingbradleyscmd() {
    if (level.tankstartspawnalliescmd.size != 0 && level.tankstartspawnaxiscmd.size != 0) {
        angles = (0, 0, 0);
        if (isdefined(level.tankstartspawnalliescmd[0].angles)) {
            angles = level.tankstartspawnalliescmd[0].angles;
        }
        /#
            println("<unknown string>" + level.tankstartspawnalliescmd[0].origin);
            println("<unknown string>" + angles);
        #/
        thread spawnbradleynoduration(level.tankstartspawnalliescmd[0].origin, angles, "allies");
        angles = (0, 0, 0);
        if (isdefined(level.tankstartspawnaxiscmd[0].angles)) {
            angles = level.tankstartspawnaxiscmd[0].angles;
        }
        /#
            println("<unknown string>" + level.tankstartspawnaxiscmd[0].origin);
            println("<unknown string>" + angles);
        #/
        thread spawnbradleynoduration(level.tankstartspawnaxiscmd[0].origin, angles, "axis");
    }
}

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xced
// Size: 0x115
function kickoffneutralbradleyspawnstdm() {
    level endon("game_ended");
    wait(12);
    tankSpawn = random(level.tankstartspawnneutral);
    angles = (0, 0, 0);
    if (isdefined(tankSpawn.angles)) {
        angles = tankSpawn.angles;
    }
    /#
        println("<unknown string>" + tankSpawn.origin);
        println("<unknown string>" + angles);
    #/
    thread spawnbradleynoduration(tankSpawn.origin, angles);
    timelimit = gettimelimit();
    timelimitmin = timelimit / 3;
    spawntime = max(timelimitmin, 180);
    spawntime = min(spawntime, 240);
    while (1) {
        wait(spawntime);
        if (vehicle_tracking_getgameinstances("light_tank").size < 2) {
            tankSpawn = selectneutralspawn();
            thread spawnbradleynoduration(tankSpawn.origin, tankSpawn.angles);
        }
    }
}

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe09
// Size: 0x8c
function kickoffneutralbradleyspawnsdom() {
    level endon("game_ended");
    wait(60);
    timelimit = gettimelimit();
    timelimitmin = timelimit / 3;
    spawntime = max(timelimitmin, 180);
    spawntime = min(spawntime, 240);
    while (1) {
        wait(spawntime);
        if (vehicle_tracking_getgameinstances("light_tank").size < 2) {
            var_892859fb1ae1e343 = selectdomspawn();
            if (!isdefined(var_892859fb1ae1e343)) {
                var_892859fb1ae1e343 = delayspawnuntilpointcap();
            }
            spawndombradley(var_892859fb1ae1e343);
        }
    }
}

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9c
// Size: 0xc3
function spawndombradley(var_892859fb1ae1e343) {
    if (var_892859fb1ae1e343.objectivekey == "_a") {
        tankSpawn = random(level.tankspawndom_a);
    } else if (var_892859fb1ae1e343.objectivekey == "_b") {
        tankSpawn = random(level.tankspawndom_b);
    } else {
        tankSpawn = random(level.tankspawndom_c);
    }
    if (isdefined(tankSpawn)) {
        angles = (0, 0, 0);
        if (isdefined(tankSpawn.angles)) {
            angles = tankSpawn.angles;
        }
        thread spawnbradleynoduration(tankSpawn.origin, angles);
    }
}

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf66
// Size: 0x177
function tryspawnneutralbradleycmd(point) {
    if (vehicle_tracking_getgameinstances("light_tank").size < 2) {
        if (point == 1) {
            if (level.tankspawncmd_1.size != 0) {
                angles = (0, 0, 0);
                tankSpawn = random(level.tankspawncmd_1);
                if (isdefined(tankSpawn.angles)) {
                    angles = tankSpawn.angles;
                }
                thread spawnbradleynoduration(tankSpawn.origin, angles, "allies");
            }
        } else if (point == 2) {
            if (level.tankspawncmd_2.size != 0) {
                angles = (0, 0, 0);
                tankSpawn = random(level.tankspawncmd_2);
                if (isdefined(tankSpawn.angles)) {
                    angles = tankSpawn.angles;
                }
                thread spawnbradleynoduration(tankSpawn.origin, angles, "allies");
            }
        } else if (point == 3) {
            if (level.tankspawncmd_3.size != 0) {
                angles = (0, 0, 0);
                tankSpawn = random(level.tankspawncmd_3);
                if (isdefined(tankSpawn.angles)) {
                    angles = tankSpawn.angles;
                }
                thread spawnbradleynoduration(tankSpawn.origin, angles, "allies");
            }
        }
    }
}

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e4
// Size: 0x2d
function delayspawnuntilpointcap() {
    level endon("game_ended");
    while (1) {
        wait(3);
        var_892859fb1ae1e343 = selectdomspawn();
        if (isdefined(var_892859fb1ae1e343)) {
            return var_892859fb1ae1e343;
        }
    }
}

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1118
// Size: 0x1e
function selectneutralspawn() {
    tankSpawn = random(level.tankstartspawnneutral);
    return tankSpawn;
}

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x113e
// Size: 0x8d
function selectdomspawn() {
    var_81813e4560da38e8 = namespace_6b4b8b8421d203ba::getteamdompoints("allies");
    var_31cd4798ce98e96f = namespace_6b4b8b8421d203ba::getteamdompoints("axis");
    var_9bb266f7bf9b6cbb = namespace_6b4b8b8421d203ba::getteamdompoints("neutral");
    if (var_81813e4560da38e8.size == 3 || var_31cd4798ce98e96f.size == 3) {
        return undefined;
    } else if (var_81813e4560da38e8.size < var_31cd4798ce98e96f.size) {
        if (var_81813e4560da38e8.size == 0) {
            return var_9bb266f7bf9b6cbb[0];
        }
        return var_81813e4560da38e8[0];
    } else if (var_81813e4560da38e8.size > var_31cd4798ce98e96f.size) {
        if (var_31cd4798ce98e96f.size == 0) {
            return var_9bb266f7bf9b6cbb[0];
        }
        return var_31cd4798ce98e96f[0];
    }
    return undefined;
}

// Namespace namespace_e4691dd72735bbc5/namespace_662734e7fa8a8b94
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d3
// Size: 0xd5
function spawnbradleynoduration(position, angles, team) {
    /#
        assert(issharedfuncdefined("light_tank", "initSpawnData"), "script_struct_mp_lighttank.gsc wasn't initialized. Does this map have a light tank spawn point compiled in?");
    #/
    if (!issharedfuncdefined("light_tank", "initSpawnData")) {
        return;
    }
    spawndata = spawnstruct();
    [[ getsharedfunc("light_tank", "initSpawnData") ]](spawndata);
    spawndata.cantimeout = 0;
    spawndata.spawnmethod = "airdrop_at_position";
    spawndata.origin = position;
    spawndata.angles = angles;
    spawndata.team = team;
    tank = [[ getsharedfunc("light_tank", "tankSpawn") ]](spawndata);
}

