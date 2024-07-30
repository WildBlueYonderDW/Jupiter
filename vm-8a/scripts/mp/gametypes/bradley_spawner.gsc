#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\gametypes\dom.gsc;

#namespace bradley_spawner;

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b5
// Size: 0x36
function monitoradd(tank, timeout) {
    tank.script_timeout = timeout;
    level.tanktimeoutlist[level.tanktimeoutlist.size] = tank;
}

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f3
// Size: 0x102
function spawntanks(tankstructs, team) {
    level endon("game_ended");
    wait 0.05;
    foreach (tankSpawn in tankstructs) {
        if (!isdefined(tankSpawn.angles)) {
            tankSpawn.angles = (0, 0, 0);
        }
        refill = ter_op(isdefined(tankSpawn.script_force_count), tankSpawn.script_force_count, 0);
        timeout = ter_op(isdefined(tankSpawn.script_timeout), tankSpawn.script_timeout, 0);
        level thread spawntankandmonitor(tankSpawn.origin, tankSpawn.angles, team, refill, timeout);
    }
}

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fd
// Size: 0x70
function spawntankandmonitor(origin, angles, team, refill, timeout) {
    level endon("game_ended");
    tank = spawntank(origin, angles, team, timeout, 0);
    if (refill) {
        while (true) {
            tank waittill("death");
            wait 3;
            tank = spawntank(origin, angles, team, timeout, 1);
        }
    }
}

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x475
// Size: 0x102
function spawntank(origin, angles, team, timeout, infil) {
    assert(issharedfuncdefined("light_tank", "initSpawnData"), "script_struct_mp_lighttank.gsc wasn't initialized. Does this map have a light tank spawn point compiled in?");
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

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x580
// Size: 0x30d
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
    gametypes = ["cmd", "dom", "war", "arm", "conflict", "risk"];
    gameindex = array_find(gametypes, getgametype());
    if (!isdefined(gameindex)) {
        gameindex = gametypes.size;
    }
    for (i = gameindex; i < gametypes.size; i++) {
        testgametype = gametypes[i];
        if (testgametype == "war") {
            if (level.tankstartspawnallies.size != 0 || level.tankstartspawnaxis.size != 0 || level.tankstartspawnneutral.size != 0) {
                spawnstartingbradleystdm();
                if (level.tankstartspawnneutral.size != 0) {
                    thread kickoffneutralbradleyspawnstdm();
                }
                break;
            }
            continue;
        }
        if (testgametype == "dom") {
            if (level.tankstartspawnalliesdom.size != 0 || level.tankstartspawnaxisdom.size != 0 || level.tankspawndom_a.size != 0 || level.tankspawndom_b.size != 0 || level.tankspawndom_c.size != 0) {
                thread kickoffneutralbradleyspawnsdom();
                break;
            }
            continue;
        }
        if (testgametype == "cmd") {
            if (level.tankstartspawnalliescmd.size != 0 || level.tankstartspawnaxiscmd.size != 0 || level.tankspawncmd_1.size != 0 || level.tankspawncmd_2.size != 0 || level.tankspawncmd_3.size != 0) {
                spawnstartingbradleyscmd();
                break;
            }
        }
    }
}

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x895
// Size: 0x150
function spawnstartingbradleystdm() {
    if (level.tankstartspawnallies.size != 0 && level.tankstartspawnaxis.size != 0) {
        angles = (0, 0, 0);
        if (isdefined(level.tankstartspawnallies[0].angles)) {
            angles = level.tankstartspawnallies[0].angles;
        }
        /#
            println("<dev string:x1c>" + level.tankstartspawnallies[0].origin);
            println("<dev string:x4a>" + angles);
        #/
        thread spawnbradleynoduration(level.tankstartspawnallies[0].origin, angles, "allies");
        angles = (0, 0, 0);
        if (isdefined(level.tankstartspawnaxis[0].angles)) {
            angles = level.tankstartspawnaxis[0].angles;
        }
        /#
            println("<dev string:x78>" + level.tankstartspawnaxis[0].origin);
            println("<dev string:xa4>" + angles);
        #/
        thread spawnbradleynoduration(level.tankstartspawnaxis[0].origin, angles, "axis");
    }
}

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ed
// Size: 0x1a0
function spawnstartingbradleysdom() {
    if (level.tankstartspawnalliesdom.size != 0 && level.tankstartspawnaxisdom.size != 0) {
        var_7e4886c52a1bc723 = (0, 0, 0);
        allyorigin = (0, 0, 0);
        var_76fd430e3623fb30 = (0, 0, 0);
        axisorigin = (0, 0, 0);
        if (isdefined(level.tankstartspawnalliesdom[0].angles)) {
            var_7e4886c52a1bc723 = level.tankstartspawnalliesdom[0].angles;
        }
        allyorigin = level.tankstartspawnalliesdom[0].origin;
        println("<dev string:xd0>" + level.tankstartspawnalliesdom[0].origin);
        if (isdefined(level.tankstartspawnaxisdom[0].angles)) {
            var_76fd430e3623fb30 = level.tankstartspawnaxisdom[0].angles;
        }
        axisorigin = level.tankstartspawnaxisdom[0].origin;
        println("<dev string:x101>" + level.tankstartspawnaxisdom[0].origin);
        if (game["switchedsides"]) {
            thread spawnbradleynoduration(axisorigin, var_76fd430e3623fb30, "allies");
            thread spawnbradleynoduration(allyorigin, var_7e4886c52a1bc723, "axis");
            return;
        }
        thread spawnbradleynoduration(axisorigin, var_76fd430e3623fb30, "axis");
        thread spawnbradleynoduration(allyorigin, var_7e4886c52a1bc723, "allies");
    }
}

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb95
// Size: 0x150
function spawnstartingbradleyscmd() {
    if (level.tankstartspawnalliescmd.size != 0 && level.tankstartspawnaxiscmd.size != 0) {
        angles = (0, 0, 0);
        if (isdefined(level.tankstartspawnalliescmd[0].angles)) {
            angles = level.tankstartspawnalliescmd[0].angles;
        }
        /#
            println("<dev string:x130>" + level.tankstartspawnalliescmd[0].origin);
            println("<dev string:x161>" + angles);
        #/
        thread spawnbradleynoduration(level.tankstartspawnalliescmd[0].origin, angles, "allies");
        angles = (0, 0, 0);
        if (isdefined(level.tankstartspawnaxiscmd[0].angles)) {
            angles = level.tankstartspawnaxiscmd[0].angles;
        }
        /#
            println("<dev string:x192>" + level.tankstartspawnaxiscmd[0].origin);
            println("<dev string:x1c1>" + angles);
        #/
        thread spawnbradleynoduration(level.tankstartspawnaxiscmd[0].origin, angles, "axis");
    }
}

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xced
// Size: 0x114
function kickoffneutralbradleyspawnstdm() {
    level endon("game_ended");
    wait 12;
    tankSpawn = random(level.tankstartspawnneutral);
    angles = (0, 0, 0);
    if (isdefined(tankSpawn.angles)) {
        angles = tankSpawn.angles;
    }
    /#
        println("<dev string:x1f0>" + tankSpawn.origin);
        println("<dev string:x20c>" + angles);
    #/
    thread spawnbradleynoduration(tankSpawn.origin, angles);
    timelimit = gettimelimit();
    timelimitmin = timelimit / 3;
    spawntime = max(timelimitmin, 180);
    spawntime = min(spawntime, 240);
    while (true) {
        wait spawntime;
        if (vehicle_tracking_getgameinstances("light_tank").size < 2) {
            tankSpawn = selectneutralspawn();
            thread spawnbradleynoduration(tankSpawn.origin, tankSpawn.angles);
        }
    }
}

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe09
// Size: 0x8b
function kickoffneutralbradleyspawnsdom() {
    level endon("game_ended");
    wait 60;
    timelimit = gettimelimit();
    timelimitmin = timelimit / 3;
    spawntime = max(timelimitmin, 180);
    spawntime = min(spawntime, 240);
    while (true) {
        wait spawntime;
        if (vehicle_tracking_getgameinstances("light_tank").size < 2) {
            dompt = selectdomspawn();
            if (!isdefined(dompt)) {
                dompt = delayspawnuntilpointcap();
            }
            spawndombradley(dompt);
        }
    }
}

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9c
// Size: 0xc2
function spawndombradley(dompt) {
    if (dompt.objectivekey == "_a") {
        tankSpawn = random(level.tankspawndom_a);
    } else if (dompt.objectivekey == "_b") {
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

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf66
// Size: 0x176
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
            return;
        }
        if (point == 2) {
            if (level.tankspawncmd_2.size != 0) {
                angles = (0, 0, 0);
                tankSpawn = random(level.tankspawncmd_2);
                if (isdefined(tankSpawn.angles)) {
                    angles = tankSpawn.angles;
                }
                thread spawnbradleynoduration(tankSpawn.origin, angles, "allies");
            }
            return;
        }
        if (point == 3) {
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

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e4
// Size: 0x2c
function delayspawnuntilpointcap() {
    level endon("game_ended");
    while (true) {
        wait 3;
        dompt = selectdomspawn();
        if (isdefined(dompt)) {
            return dompt;
        }
    }
}

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1118
// Size: 0x1d
function selectneutralspawn() {
    tankSpawn = random(level.tankstartspawnneutral);
    return tankSpawn;
}

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x113e
// Size: 0x8c
function selectdomspawn() {
    allypoints = scripts\mp\gametypes\dom::getteamdompoints("allies");
    axispoints = scripts\mp\gametypes\dom::getteamdompoints("axis");
    neutralpoints = scripts\mp\gametypes\dom::getteamdompoints("neutral");
    if (allypoints.size == 3 || axispoints.size == 3) {
        return undefined;
    } else if (allypoints.size < axispoints.size) {
        if (allypoints.size == 0) {
            return neutralpoints[0];
        }
        return allypoints[0];
    } else if (allypoints.size > axispoints.size) {
        if (axispoints.size == 0) {
            return neutralpoints[0];
        }
        return axispoints[0];
    }
    return undefined;
}

// Namespace bradley_spawner / scripts\mp\gametypes\bradley_spawner
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d3
// Size: 0xd4
function spawnbradleynoduration(position, angles, team) {
    assert(issharedfuncdefined("light_tank", "initSpawnData"), "script_struct_mp_lighttank.gsc wasn't initialized. Does this map have a light tank spawn point compiled in?");
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

