#using scripts\engine\utility.gsc;
#using scripts\engine\dev.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\carriable.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_dev.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\laststand.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\gametypes\br_utility.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using script_7933519955f32c4e;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\gametypes\br_vehicles.gsc;
#using scripts\mp\gametypes\br_functional_poi.gsc;
#using scripts\cp_mp\auto_ascender.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\equipment\molotov.gsc;
#using scripts\mp\javelin.gsc;
#using script_3aacf02225ca0da5;
#using script_64acb6ce534155b7;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\juggernaut.gsc;
#using script_3aa8e63a56e3416;
#using script_5bc60484d17fa95c;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using scripts\mp\gametypes\br_vip_quest.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\inventory_utility.gsc;

#namespace namespace_3db0584c4c3b350b;

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb54
// Size: 0x4a
function init() {
    /#
        setdvarifuninitialized(@"hash_87e38fca685cec1d", 1);
    #/
    if (getdvarint(@"hash_87e38fca685cec1d", 0)) {
        scripts\mp\gametypes\br_dev::registerhandlecommand(&function_dd5235ea93f4af20);
        thread scripts\mp\gametypes\br_dev::commandwatcher(@"hash_97cda940cb7bd182", &scripts\mp\gametypes\br_dev::handlecommand);
    }
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xba6
// Size: 0x43
function function_dd5235ea93f4af20(command, args) {
    switch (command) {
    case #"hash_fa50c0f6bd8302a2": 
        thread devscriptedtests(args);
        break;
    default: 
        break;
    }
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbf1
// Size: 0x96
function devscriptedtests(args) {
    level notify("devScriptedTests");
    level endon("devScriptedTests");
    host = gethost(args);
    if (!isdefined(host)) {
        return;
    }
    function_d721ba3a92dffd4c();
    function_8032016446156bad();
    resetplayers();
    resetcircles();
    var_57accdc40b2f50e = spawnteams(args);
    enemyteammates = var_57accdc40b2f50e[1];
    hostteammates = var_57accdc40b2f50e[0];
    host iprintlnbold("Test ready");
    wait 2;
    runtests(args, host, hostteammates, enemyteammates);
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc8f
// Size: 0x86
function getspawnlocations() {
    if (scripts\cp_mp\utility\game_utility::isdonetskmap()) {
        spawnlocations = [scripts\mp\gametypes\br::createspawnlocation((-21500, 46200, -300), 0, 6000), scripts\mp\gametypes\br::createspawnlocation((51000, -39000, 1401), 0, 4000), scripts\mp\gametypes\br::createspawnlocation((32000, 40000, 767), 0, 5500), scripts\mp\gametypes\br::createspawnlocation((23000, -15000, -158), 0, 6000)];
        return spawnlocations;
    }
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd1d
// Size: 0x1c1
function function_d721ba3a92dffd4c() {
    if (istrue(level.usegulag)) {
        foreach (arena in level.gulag.arenas) {
            arena.matches = [];
        }
        level.gulag.arenas = sortbydistance(level.gulag.arenas, level.mapcorners[0].origin);
        level.gulag.maxuses = -1;
        level.gulag.timelimit = 15;
        setdvar(@"hash_1ff83f4f24656c5b", 15);
        setdvar(@"hash_e5f703a38f6e8043", 95);
        setdvar(@"hash_8bdee07fa09e810a", -1);
        setdvar(@"hash_e43719f8cb449c07", 0);
        setdvar(@"hash_98b297a8680cbdc2", 0);
        if (isdefined(level.gulag) && istrue(level.gulag.shutdown)) {
            foreach (arena in level.gulag.arenas) {
                arena.shutdown = undefined;
            }
            level.gulag.shutdown = undefined;
        }
    }
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xee6
// Size: 0xc9
function function_8032016446156bad() {
    scripts\mp\flags::gameflagset("prematch_done");
    level notify("prematch_over");
    level notify("cancel_public_event");
    setomnvar("ui_prematch_period", 0);
    level.maxteamsize = 3;
    level.br_prematchstarted = 1;
    level.teammaxfill = 1;
    level.disablespawning = 0;
    level.ignorescoring = 0;
    level.allowprematchdamage = 1;
    level.ingraceperiod = 0;
    setdvar(@"hash_c2de8ca6dc8512c1", 1);
    setdvar(@"hash_faf1db5754891b2d", 150);
    setdvar(@"hash_cb2d56d085e5a9b9", 150);
    setdvar(@"hash_2c879521333c4987", 0);
    level.var_c3a1ed2db43ce5a = 3;
    scripts\mp\spawnlogic::function_182c52d5da69684d();
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb7
// Size: 0x15f
function resetplayers() {
    foreach (player in level.players) {
        if (player isplayerheadless()) {
            player allowmovement(0);
            player allowfire(0);
            player allowmelee(0);
        }
        player function_df49f9975e17b225(undefined);
        player.gulag = undefined;
        player.jailed = undefined;
        player.gulagarena = undefined;
        player.wasingulag = undefined;
        player.playertospectate = undefined;
        player.nextplayertospectate = undefined;
        player.gulagloser = undefined;
        player.gulaguses = undefined;
        player.longgulagstream = undefined;
        player.gulagholding = undefined;
        player.var_4af73ce40a5d8572 = undefined;
        player notify("gulag_end");
        player notify("last_stand_start");
        player scripts\mp\laststand::finishreviveplayer("self_revive_success", player);
        player setstance("stand");
        player setallstreamloaddist(0);
        player.setspawnpoint = undefined;
        optparams = spawnstruct();
        optparams.var_fb551788da0fc531 = 0;
        player scripts\mp\gametypes\br_gulag::playerrespawngulagcleanup(optparams);
        player scripts\mp\gametypes\br_gulag::playergulagarenaready();
    }
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x111e
// Size: 0xa1
function resetcircles() {
    if (isdefined(level.br_circle.safecircleent)) {
        level.br_circle.dangercircleui.hidden = 1;
        level.br_circle.dangercircleent.hidden = 1;
        level.br_circle.safecircleui.hidden = 1;
        level.br_circle.safecircleent.hidden = 1;
        level notify("update_circle_hide");
    }
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11c7
// Size: 0x248
function spawnteams(args) {
    host = gethost(args);
    spawnlocations = getspawnlocations();
    if (!isdefined(level.devspectateloc)) {
        level.devspectateloc = [];
    }
    var_e2d2256d6f8ba785 = level.var_c3a1ed2db43ce5a - 1;
    count = 0;
    level.var_e1e5bac199d37317 = [];
    for (i = 0; i < level.teamnamelist.size; i++) {
        team = level.teamnamelist[i];
        if (team != host.team) {
            level.var_e1e5bac199d37317[count] = team;
            count++;
            if (count >= var_e2d2256d6f8ba785) {
                break;
            }
        }
    }
    reviveteam(host, host.team);
    for (i = 0; i < var_e2d2256d6f8ba785; i++) {
        reviveteam(host, level.var_e1e5bac199d37317[i]);
    }
    level.var_84931945e7b207 = getteamspawnbots(host, host.team);
    level.var_cc15d00c0dfbf14e = [];
    for (i = 0; i < var_e2d2256d6f8ba785; i++) {
        level.var_cc15d00c0dfbf14e[i] = getteamspawnbots(host, level.var_e1e5bac199d37317[i]);
    }
    for (i = 0; i < level.var_84931945e7b207.size; i++) {
        player1 = level.var_84931945e7b207[i];
        spawnorigin = player1.origin;
        if (isdefined(spawnlocations)) {
            spawnorigin = spawnlocations[i].origin;
        }
        player1 playerteleporttoloc(spawnorigin, 0);
        for (slotindex = 0; slotindex < var_e2d2256d6f8ba785; slotindex++) {
            nextplayer = level.var_cc15d00c0dfbf14e[slotindex][i];
            nextplayer playerteleporttoloc(spawnorigin, slotindex + 1);
        }
    }
    level.disablespawning = 1;
    totalplayers = getlivingplayers();
    level.totalplayers = totalplayers.size;
    return [level.var_84931945e7b207, level.var_cc15d00c0dfbf14e];
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1418
// Size: 0xcf
function playerteleporttoloc(spawnorigin, posindex) {
    if (self isplayerheadless()) {
        self allowmovement(0);
        self allowfire(0);
        self allowmelee(0);
    }
    entnum = self getentitynumber();
    if (isdefined(level.devspectateloc[entnum])) {
        spawnorigin = level.devspectateloc[entnum];
    } else {
        dir = anglestoforward((0, 0, 0));
        spawnorigin += dir * posindex * 50;
        spawnorigin = getgroundposition(spawnorigin, 15, 100);
    }
    self setorigin(spawnorigin);
    self setplayerangles((0, 0, 0));
    if (!isdefined(level.devspectateloc[entnum])) {
        level.devspectateloc[entnum] = spawnorigin;
    }
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14ef
// Size: 0x15b
function reviveteam(host, team) {
    teammates = level.teamdata[team]["players"];
    revivedplayers = 0;
    foreach (player in teammates) {
        if (!isalive(player) || player.sessionstate != "playing") {
            entnum = player getentitynumber();
            if (isdefined(level.devspectateloc[entnum])) {
                player.forcespawnangles = (0, 0, 0);
                player.forcespawnorigin = level.devspectateloc[entnum];
            } else {
                player.forcespawnangles = player.angles;
                player.forcespawnorigin = player.origin;
            }
            player spawnclientdevtest(0);
            revivedplayers = 1;
        }
        if (istrue(player.br_iseliminated)) {
            scripts\mp\gametypes\br_utility::unmarkplayeraseliminated(player);
        }
    }
    if (revivedplayers) {
        host iprintlnbold("Reviving Team: " + team);
        wait 1;
    }
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1652
// Size: 0x10a
function getteamspawnbots(host, team) {
    numtospawn = 0;
    if (level.teamdata[team]["teamCount"] < level.maxteamsize) {
        numtospawn = level.maxteamsize - level.teamdata[team]["teamCount"];
    }
    if (numtospawn > 0) {
        level.modespawnclient = &spawnclientdevtest;
        addbots(numtospawn, team);
        host iprintlnbold("Spawning Team: " + team);
        timeout = gettime() + 10000;
        while (gettime() < timeout && level.teamdata[team]["aliveCount"] < level.maxteamsize) {
            waitframe();
        }
        level.modespawnclient = &scripts\mp\gametypes\br::spawnclientbr;
    }
    assert(level.teamdata[team]["<dev string:x1c>"].size == level.maxteamsize);
    return level.teamdata[team]["alivePlayers"];
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1765
// Size: 0xe0
function botcallback() {
    team = self.bot_team;
    players = level.teamdata[team]["players"];
    for (i = 0; i < level.maxteamsize; i++) {
        validindex = 1;
        foreach (player in players) {
            if (self == player) {
                continue;
            }
            if (isdefined(player.var_3f78c6a0862f9e25) && player.var_3f78c6a0862f9e25 == i) {
                validindex = 0;
                break;
            }
        }
        if (validindex) {
            self.var_3f78c6a0862f9e25 = i;
            break;
        }
    }
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x184d
// Size: 0x53
function addbots(numbots, team) {
    if (!isdefined(team)) {
        team = "autoassign";
    }
    level thread [[ level.bot_funcs["bots_spawn"] ]](numbots, team, &botcallback);
    if (level.matchmakingmatch) {
        setmatchdata("hasBots", 1);
    }
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18a8
// Size: 0xb5
function spawnclientdevtest(revivespawn) {
    self.class = scripts\mp\gametypes\br::pickprematchrandomloadout();
    self.pers["class"] = self.class;
    scripts\mp\playerlogic::spawnplayer(undefined, 0);
    self freezecontrols(1);
    waitframe();
    self skydive_setdeploymentstatus(0);
    self skydive_setbasejumpingstatus(0);
    var_4de859b9228e5cfd = !self isplayerheadless();
    if (var_4de859b9228e5cfd) {
        while (isalive(self) && isdefined(self.weaponlist) && !self hasloadedviewweapons(self.weaponlist)) {
            waitframe();
        }
    }
    self notify("brWaitAndSpawnClientComplete");
    self.waitingtospawn = 0;
    self freezecontrols(0);
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1965
// Size: 0x15
function function_df49f9975e17b225(value) {
    self.br_infilstarted = value;
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1982
// Size: 0x2b
function disconnectbot(botplayer) {
    assert(isbot(botplayer));
    kick(botplayer getentitynumber(), "EXE/PLAYERKICKED_BOT_BALANCE");
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19b5
// Size: 0x92
function killplayer(victim, var_25012cdc0dfdc53f) {
    enemy = var_25012cdc0dfdc53f;
    if (isarray(var_25012cdc0dfdc53f)) {
        enemy = getnearbyaliveplayer(victim.origin, var_25012cdc0dfdc53f);
    }
    victim dodamage(500, enemy.origin, enemy, undefined, "MOD_EXPLOSIVE", enemy getcurrentprimaryweapon());
    wait 1;
    while (isalive(victim)) {
        victim dodamage(500, enemy.origin, enemy, undefined, "MOD_EXPLOSIVE", enemy getcurrentprimaryweapon());
        waitframe();
    }
    return enemy;
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a50
// Size: 0xac
function killplayerinstant(victim, var_25012cdc0dfdc53f, keeplaststand) {
    enemy = var_25012cdc0dfdc53f;
    if (isarray(var_25012cdc0dfdc53f)) {
        enemy = getnearbyaliveplayer(victim.origin, var_25012cdc0dfdc53f);
    }
    if (!isdefined(enemy)) {
        enemy = victim;
    }
    if (!istrue(keeplaststand) && victim scripts\mp\utility\perk::_hasperk("specialty_pistoldeath")) {
        victim scripts\mp\utility\perk::removeperk("specialty_pistoldeath");
    }
    while (isalive(victim)) {
        victim dodamage(500, enemy.origin, enemy, undefined, "MOD_EXPLOSIVE", enemy getcurrentprimaryweapon());
        if (!isalive(victim)) {
            break;
        }
        waitframe();
    }
    return enemy;
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b05
// Size: 0x9b
function putinlaststand(player, var_25012cdc0dfdc53f) {
    enemy = var_25012cdc0dfdc53f;
    if (isarray(var_25012cdc0dfdc53f)) {
        enemy = getnearbyaliveplayer(player.origin, var_25012cdc0dfdc53f);
    }
    if (!isdefined(enemy)) {
        enemy = player;
    }
    if (!player scripts\mp\utility\perk::_hasperk("specialty_pistoldeath")) {
        player scripts\mp\utility\perk::giveperk("specialty_pistoldeath");
    }
    while (!istrue(player.inlaststand)) {
        player dodamage(30, enemy.origin, enemy, undefined, "MOD_EXPLOSIVE", enemy getcurrentprimaryweapon());
        wait 0.1;
    }
    return enemy;
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ba9
// Size: 0x2aa
function scriptcircleat(origin, radius) {
    if (!isdefined(level.br_circle.safecircleent)) {
        thread scripts\mp\gametypes\br_circle::runcircles(1);
        level.br_circle thread scripts\mp\gametypes\br_circle::circledamagetick();
    }
    waitframe();
    level notify("CirclePeekCleanup");
    circleindex = 1;
    level.br_circle.starttime = gettime();
    level.br_circle.circleindex = circleindex;
    var_f007ce073dc3c519 = circleindex == 0;
    var_6b890e6be7982efb = circleindex == level.br_level.br_circleclosetimes.size - 1;
    prewaittime = level.br_level.br_circledelaytimes[circleindex];
    closetime = level.br_level.br_circleclosetimes[circleindex];
    targetradius = level.br_level.br_circleradii[circleindex + 1];
    setomnvar("ui_br_circle_num", circleindex + 1);
    level.br_circle.centertarget = origin;
    level.br_circle.safecircleent.origin = origin;
    level.br_circle.dangercircleui.hidden = 0;
    level.br_circle.dangercircleent.hidden = 0;
    level.br_circle.safecircleui.hidden = 0;
    level.br_circle.safecircleent.hidden = 0;
    level notify("update_circle_hide");
    level.br_circle.safecircleui.origin = level.br_circle.safecircleent.origin;
    level.br_circle.dangercircleui.origin = origin + (0, 0, radius);
    scripts\mp\gametypes\br_circle::setstaticuicircles(999, level.br_circle.safecircleui, level.br_circle.dangercircleui, var_6b890e6be7982efb);
    level notify("br_circle_set");
    waitframe();
    level notify("br_circle_started");
    level.br_circle.dangercircleent brcirclemoveto(origin[0], origin[1], radius, 1);
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5b
// Size: 0x2b
function setnumteams(args, numteams) {
    if (numteams <= 0) {
        return;
    }
    level.var_c3a1ed2db43ce5a = numteams;
    return spawnteams(args);
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e8f
// Size: 0x9c
function getnearbyaliveplayer(org, players) {
    players = array_removeundefined(players);
    players = sortbydistance(players, org);
    if (isalive(players[0])) {
        dist = distance2dsquared(org, players[0].origin);
        if (dist < 40000) {
            return players[0];
        }
    }
    aliveplayer = undefined;
    for (i = 1; i < players.size; i++) {
        player = players[i];
        if (isalive(player)) {
            aliveplayer = player;
            break;
        }
    }
    return aliveplayer;
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f34
// Size: 0x61
function argshave(args, token) {
    foreach (arg in args) {
        if (arg == token) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f9e
// Size: 0x14a
function gethost(args) {
    if (isdefined(level.devspectatetesthost)) {
        return level.devspectatetesthost;
    }
    host = scripts\mp\gamelogic::gethostplayer();
    if (argshave(args, "clientHost")) {
        foreach (player in level.players) {
            if (!isai(player) && !player isplayerheadless() && (!isdefined(host) || player != host)) {
                host = player;
                break;
            }
        }
    } else if (!isdefined(host)) {
        foreach (player in level.players) {
            if (!isai(player) && !player isplayerheadless()) {
                level.devspectatetesthost = player;
                host = player;
                break;
            }
        }
    } else {
        level.maxteamsize = 3;
    }
    if (!isdefined(level.devspectatetesthost)) {
        level.devspectatetesthost = host;
    }
    return host;
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20f1
// Size: 0x76
function playerstartrecondronewait() {
    pickupent = spawnstruct();
    pickupent.scriptablename = "brloot_killstreak_recondrone";
    pickupent.count = 1;
    scripts\mp\gametypes\br_pickups::takesuperpickup(pickupent);
    wait 1;
    superweapon = makeweapon("super_default_mp");
    scripts\mp\supers::trysuperusebegin(superweapon);
    while (self getcurrentprimaryweapon().basename != "ks_remote_drone_mp") {
        waitframe();
    }
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x216f
// Size: 0x1c
function waitandsuicide(delaytime, player) {
    wait delaytime;
    player suicide();
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2193
// Size: 0x68
function onprematchstarted2() {
    level notify("onPrematchFadeDoneClear");
    level thread onprematchfadedone2();
    c130pathstruct = undefined;
    if (!istrue(level.br_infils_disabled)) {
        c130pathstruct = scripts\mp\gametypes\br_c130::createtestc130path();
    }
    waitframe();
    level.br_c130spawndone = 0;
    level.br_latejoininfilready = 0;
    namespace_973962356ce55fee::beginbrc130playeraniminfilsequence(c130pathstruct, "player");
    level thread scripts\mp\gametypes\br_c130::waittoplayinfildialog();
    level notify("infils_ready");
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2203
// Size: 0x185
function onprematchfadedone2() {
    var_36648016ce75e753 = 1.4;
    level endon("onPrematchFadeDoneClear");
    if (!isdefined(level.spectatetestonprematchfadedone)) {
        level.spectatetestonprematchfadedone = 1;
        return;
    }
    scripts\mp\flags::gameflagwait("prematch_fade_done");
    level thread scripts\mp\gametypes\br::resetalldoors(var_36648016ce75e753 * 1.5);
    level thread scripts\cp_mp\calloutmarkerping::calloutmarkerping_removeallcalloutsforallplayers(1);
    level thread scripts\mp\gametypes\br_vehicles::brvehicleonprematchstarted();
    level thread scripts\mp\gametypes\br_functional_poi::onprematchdone();
    scripts\mp\gametypes\br::cleanupmolotovs();
    scripts\mp\gametypes\br_vehicles::emptyallvehicles();
    foreach (player in level.players) {
        player scripts\mp\gametypes\br::setplayerprematchallows();
        player thread scripts\mp\gametypes\br_pickups::resetplayerinventory();
        if (istrue(player.hasspawned)) {
            if (istrue(player.usingascender)) {
                player scripts\cp_mp\auto_ascender::ascenderinstantstop();
            }
            player thread scripts\mp\weapons::deleteplacedequipment();
        }
    }
    foreach (player in level.players) {
        if (isdefined(player.burninginfo)) {
            player scripts\mp\equipment\molotov::molotov_clear_burning();
        }
        player scripts\mp\javelin::javelin_forceclear();
    }
    level notify("prematch_cleanup");
    if (!istrue(level.br_circle_disabled)) {
        level thread scripts\mp\gametypes\br_circle::runcircles(1);
    }
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2390
// Size: 0x216
function function_53aa698b2205a4c3(player, scriptablename, spawnpos) {
    if (!isdefined(spawnpos)) {
        spawnpos = player.origin + anglestoforward(player.angles) * 100 + (0, 0, 12);
    }
    initialcount = 0;
    if (isdefined(level.br_pickups.counts[scriptablename])) {
        initialcount = level.br_pickups.counts[scriptablename];
    }
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(spawnpos);
    item = spawnpickup(scriptablename, dropinfo, initialcount);
    if (isweaponcase(scriptablename)) {
        namespace_a8b2b88699fc40fb::function_3e7ee85cb0d3504c(item);
    }
    if (isquesttablet(scriptablename)) {
        namespace_1eb3c4e0e28fac71::function_8a25384bacdd7b79(item, scriptablename);
    }
    if (isdefined(item)) {
        contents = scripts\engine\trace::create_contents(0, 1, 0, 0, 0, 1, 1, 0, 0);
        ignorelist = [];
        caststart = item.origin + (0, 0, 50);
        castend = caststart + (0, 0, -200);
        traceresult = scripts\engine\trace::ray_trace(caststart, castend, ignorelist, contents);
        if (isdefined(traceresult["entity"]) && isdefined(traceresult["entity"].targetname) && traceresult["entity"].targetname == "train_wz") {
            trainent = traceresult["entity"];
            localorigin = rotatevectorinverted(item.origin - trainent.origin, trainent.angles);
            localangles = combineangles(invertangles(trainent.angles), item.angles);
            item utility::function_6e506f39f121ea8a(trainent, localorigin, localangles);
        }
    }
    return item;
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x25af
// Size: 0x3959
function runtests(args, host, hostteammates, enemyteammates) {
    if (argshave(args, "killcam1") || argshave(args, "killchain") || argshave(args, "disconnect1") || argshave(args, "disconnect2") || argshave(args, "disconnect3")) {
        killplayer(host, enemyteammates[0]);
        if (argshave(args, "disconnect2")) {
            while (host.sessionstate != "intermission") {
                waitframe();
            }
            while (host.sessionstate == "intermission") {
                waitframe();
            }
        } else if (argshave(args, "disconnect3")) {
            while (host.sessionstate != "intermission") {
                waitframe();
            }
            wait 0.5;
        } else {
            scripts\mp\gametypes\br_spectate::waittillspectating(host);
            wait 3;
            if (argshave(args, "disconnect1")) {
                host iprintlnbold("Waiting");
                wait 10;
            }
        }
    }
    if (argshave(args, "disconnect1") || argshave(args, "disconnect2") || argshave(args, "disconnect3")) {
        playertospectate = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer();
        disconnectbot(playertospectate);
    }
    if (argshave(args, "killchain")) {
        for (playertospectate = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer(); !isdefined(playertospectate); playertospectate = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer()) {
            waitframe();
        }
        killplayer(playertospectate, enemyteammates[0]);
        scripts\mp\gametypes\br_spectate::waittillspectating(host);
        wait 3;
    }
    if (argshave(args, "killchain")) {
        for (playertospectate = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer(); !isdefined(playertospectate); playertospectate = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer()) {
            waitframe();
        }
        killplayer(playertospectate, enemyteammates[0]);
        scripts\mp\gametypes\br_spectate::waittillspectating(host);
        wait 3;
    }
    if (argshave(args, "killchain")) {
        for (playertospectate = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer(); !isdefined(playertospectate); playertospectate = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer()) {
            waitframe();
        }
        killplayer(playertospectate, enemyteammates[1]);
        scripts\mp\gametypes\br_spectate::waittillspectating(host);
        wait 3;
    }
    if (argshave(args, "killchain")) {
        for (playertospectate = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer(); !isdefined(playertospectate); playertospectate = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer()) {
            waitframe();
        }
        killplayer(playertospectate, enemyteammates[1]);
        scripts\mp\gametypes\br_spectate::waittillspectating(host);
        wait 3;
    }
    if (argshave(args, "killchain")) {
        for (playertospectate = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer(); !isdefined(playertospectate); playertospectate = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer()) {
            waitframe();
        }
        killplayer(playertospectate, enemyteammates[1]);
        scripts\mp\gametypes\br_spectate::waittillspectating(host);
        wait 3;
    }
    if (argshave(args, "gulag1")) {
        foreach (player in hostteammates) {
            if (player != host) {
                player function_df49f9975e17b225(1);
                killplayer(player, enemyteammates[0]);
            }
        }
        wait 10;
        killplayer(host, enemyteammates[0]);
    }
    if (argshave(args, "gulag2") || argshave(args, "gulag3")) {
        killplayer(host, enemyteammates[0]);
        host waittill("killcam_ended");
        wait 2;
        foreach (player in hostteammates) {
            if (player != host) {
                player function_df49f9975e17b225(1);
                killplayer(player, enemyteammates[0]);
            }
        }
        while (!isdefined(host getspectatingplayer())) {
            waitframe();
        }
        friendly = host getspectatingplayer();
        friendly function_df49f9975e17b225(1);
        wait 1;
        foreach (player in enemyteammates[0]) {
            player function_df49f9975e17b225(1);
            killplayer(player, enemyteammates[1]);
        }
        while (!istrue(friendly.gulagarena)) {
            waitframe();
        }
        wait 5;
        if (argshave(args, "gulag2")) {
            setspawnpoint = spawnstruct();
            setspawnpoint.playerspawnpos = (26474, -16709, -162);
            setspawnpoint.playerspawnangles = (85, 135, 0);
            friendly.setspawnpoint = setspawnpoint;
            foreach (player in enemyteammates[0]) {
                if (istrue(player.gulagarena)) {
                    player function_df49f9975e17b225(1);
                    killplayer(player, enemyteammates[1]);
                    break;
                }
            }
            while (!friendly islinked()) {
                waitframe();
            }
            while (friendly islinked()) {
                waitframe();
            }
            waitframe();
            playerangles = friendly getplayerangles();
            friendly setplayerangles((85, playerangles[1], 0));
        } else {
            killplayer(friendly, enemyteammates[1]);
        }
    }
    if (argshave(args, "gulag4")) {
        host function_df49f9975e17b225(1);
        enemy = killplayer(host, enemyteammates[0]);
        enemy function_df49f9975e17b225(1);
        killplayer(enemy, hostteammates);
    }
    if (argshave(args, "gulaggulag")) {
        first = getdvarint(@"hash_ad0ddaf795b2ef1a", 0);
        second = getdvarint(@"hash_ad0dd9f795b2ece7", 5);
        setdvar(@"hash_e5f703a38f6e8043", 9999);
        setdvar(@"hash_8bdee07fa09e810a", first);
        host function_df49f9975e17b225(1);
        enemy = killplayer(host, enemyteammates[0]);
        setdvar(@"hash_8bdee07fa09e810a", second);
        foreach (player in hostteammates) {
            if (player != host) {
                player function_df49f9975e17b225(1);
                killplayer(player, enemyteammates[0]);
            }
        }
        setdvar(@"hash_8bdee07fa09e810a", first);
        enemy function_df49f9975e17b225(1);
        killplayer(enemy, enemyteammates[1]);
        while (!istrue(host.gulagarena) && !istrue(enemy.gulagarena)) {
            waitframe();
        }
        wait 5;
        killplayer(host, enemy);
        setdvar(@"hash_e5f703a38f6e8043", 90);
    }
    if (argshave(args, "killkill")) {
        enemy = enemyteammates[0][0];
        foreach (player in hostteammates) {
            if (player != host) {
                killplayer(player, enemy);
            }
        }
        killplayer(enemy, host);
        wait 10;
        killplayer(host, enemy);
    }
    if (argshave(args, "killcam2")) {
        enemy = killplayer(host, enemyteammates[0]);
        wait 3;
        killplayer(host.nextplayertospectate, enemyteammates[0]);
    }
    if (argshave(args, "gulag5") || argshave(args, "gulag6")) {
        nothost = undefined;
        foreach (player in hostteammates) {
            if (!isdefined(nothost) && player != host) {
                nothost = player;
                continue;
            }
            killplayer(player, enemyteammates[0]);
            scripts\mp\gametypes\br_spectate::waittillspectating(player);
        }
        nothost function_df49f9975e17b225(1);
        if (argshave(args, "gulag6")) {
            setdvar(@"hash_e5f703a38f6e8043", 9999);
            first = getdvarint(@"hash_ad0ddaf795b2ef1a", 5);
            setdvar(@"hash_8bdee07fa09e810a", first);
            nothost.longgulagstream = 1;
        }
        killplayer(nothost, enemyteammates[0]);
    }
    if (argshave(args, "gulag7")) {
        killplayer(host, enemyteammates[0]);
        host waittill("killcam_ended");
        wait 2;
        gulagplayer = undefined;
        foreach (player in hostteammates) {
            if (player != host) {
                player function_df49f9975e17b225(1);
                gulagplayer = player;
                gulagplayer scripts\mp\gametypes\br_gulag::initplayerjail();
                break;
            }
        }
        while (!isdefined(host getspectatingplayer())) {
            waitframe();
        }
        wait 1;
        gulagenemy = undefined;
        foreach (player in enemyteammates[0]) {
            player function_df49f9975e17b225(1);
            gulagenemy = player;
            killplayer(player, enemyteammates[1]);
            break;
        }
        while (!istrue(gulagplayer.gulagarena) && !istrue(gulagenemy.gulagarena)) {
            waitframe();
        }
        wait 5;
        setdvar(@"hash_e43719f8cb449c07", 1);
        killplayer(gulagenemy, gulagplayer);
        while (host getspectatingplayer() != gulagplayer) {
            println("<dev string:x2c>");
            wait 1;
        }
        wait 5;
        setdvar(@"hash_e43719f8cb449c07", 0);
    }
    if (argshave(args, "gulag8")) {
        level.gulag.timelimit = 3;
        setdvar(@"hash_1ff83f4f24656c5b", 3);
        setdvar(@"hash_e5f703a38f6e8043", -1);
        killplayer(host, enemyteammates[0]);
        host waittill("killcam_ended");
        wait 2;
        gulagplayer = undefined;
        foreach (player in hostteammates) {
            if (player != host) {
                player function_df49f9975e17b225(1);
                gulagplayer = player;
                gulagplayer scripts\mp\gametypes\br_gulag::initplayerjail();
                break;
            }
        }
        while (!isdefined(host getspectatingplayer())) {
            waitframe();
        }
        while (host getspectatingplayer() != gulagplayer) {
            iprintlnbold("Switch to spectating gulag player");
            waitframe();
        }
        wait 1;
        gulagenemy = undefined;
        foreach (player in enemyteammates[0]) {
            player function_df49f9975e17b225(1);
            gulagenemy = player;
            killplayer(player, enemyteammates[1]);
            break;
        }
    }
    if (argshave(args, "gulag9")) {
        host function_df49f9975e17b225(1);
        enemy = killplayer(host, enemyteammates[0]);
        enemy function_df49f9975e17b225(1);
        killplayer(enemy, hostteammates);
        foreach (player in hostteammates) {
            if (player != host) {
                killplayer(player, enemyteammates[0]);
            }
        }
        foreach (player in enemyteammates[0]) {
            if (player != enemy) {
                killplayer(player, enemyteammates[1]);
            }
        }
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait 5;
        setdvar(@"hash_e43719f8cb449c07", 1);
        setdvar(@"hash_2c879521333c4987", 3);
        killplayer(host, enemy);
        wait 9;
        setdvar(@"hash_e43719f8cb449c07", 0);
        setdvar(@"hash_2c879521333c4987", 0);
    }
    if (argshave(args, "gulag10")) {
        var_57b48ef0392ddd42 = enemyteammates[0][0];
        var_57b48ef0392ddd42 function_df49f9975e17b225(1);
        killplayer(var_57b48ef0392ddd42, enemyteammates[1]);
        var_57b48df0392ddb0f = enemyteammates[1][0];
        var_57b48df0392ddb0f function_df49f9975e17b225(1);
        killplayer(var_57b48df0392ddb0f, enemyteammates[0]);
        wait 1;
        var_57b896f03931e4b1 = host;
        var_57b896f03931e4b1 function_df49f9975e17b225(1);
        killplayer(var_57b896f03931e4b1, enemyteammates[0]);
        var_57b893f03931de18 = enemyteammates[0][1];
        var_57b893f03931de18 function_df49f9975e17b225(1);
        killplayer(var_57b893f03931de18, enemyteammates[1]);
        while (!istrue(var_57b48ef0392ddd42.gulagarena) || !istrue(var_57b48df0392ddb0f.gulagarena) || !istrue(var_57b896f03931e4b1.jailed) || !istrue(var_57b893f03931de18.jailed)) {
            waitframe();
        }
        setdvar(@"hash_98b297a8680cbdc2", 1);
        playerc = enemyteammates[1][1];
        playerc function_df49f9975e17b225(1);
        killplayer(playerc, enemyteammates[0]);
        wait 1;
        while (istrue(playerc.gulagloading)) {
            waitframe();
        }
        scripts\mp\gametypes\br_gulag::shutdowngulag("circle_index", 0);
        wait 1;
        disconnectbot(playerc);
        wait 3;
        setdvar(@"hash_98b297a8680cbdc2", 0);
    }
    if (argshave(args, "gulag11")) {
        host function_df49f9975e17b225(1);
        putinlaststand(host, enemyteammates[1]);
        wait 1;
        scripts\mp\gametypes\br_gulag::shutdowngulag("circle_index", 0);
        wait 1;
        host scripts\mp\laststand::finishreviveplayer("self_revive_success", host);
        wait 5;
        killplayer(host, enemyteammates[0]);
    }
    if (argshave(args, "twooneframe")) {
        foreach (player in hostteammates) {
            if (player != host) {
                killplayer(player, enemyteammates[0]);
                break;
            }
        }
        wait 5;
        foreach (player in hostteammates) {
            if (isalive(player)) {
                killplayerinstant(player, enemyteammates[0]);
            }
        }
    }
    if (argshave(args, "suicide")) {
        foreach (player in hostteammates) {
            if (player != host) {
                killplayer(player, enemyteammates[0]);
            }
        }
        wait 5;
        if (host scripts\mp\utility\perk::_hasperk("specialty_pistoldeath")) {
            host scripts\mp\utility\perk::removeperk("specialty_pistoldeath");
        }
        host suicide();
    }
    if (argshave(args, "team")) {
        foreach (player in hostteammates) {
            if (player != host) {
                killplayerinstant(player, enemyteammates[0]);
            }
        }
    }
    if (argshave(args, "moving")) {
        killplayerinstant(host, enemyteammates[0]);
        while (!isdefined(host.playertospectate)) {
            waitframe();
        }
        player = host.playertospectate;
        dir = anglestoforward(player.angles);
        amount = getdvarint(@"hash_347466495c6777db", 5);
        for (spectatingplayer = host getspectatingplayer(); !isdefined(spectatingplayer); spectatingplayer = host getspectatingplayer()) {
            nextorg = player.origin + dir * amount;
            player setorigin(nextorg);
            waitframe();
        }
    }
    if (argshave(args, "heli1") || argshave(args, "heli2")) {
        friendly = undefined;
        foreach (player in hostteammates) {
            if (player != host) {
                if (!isdefined(friendly)) {
                    friendly = player;
                    continue;
                }
                killplayerinstant(player, enemyteammates[0]);
            }
        }
        wait 1;
        killplayerinstant(host, enemyteammates[0]);
        scripts\mp\gametypes\br_spectate::waittillspectating(host);
        wait 1;
        keys = getarraykeys(level.vehicle.instances["little_bird"]);
        heli = level.vehicle.instances["little_bird"][keys[0]];
        instance = heli getlinkedscriptableinstance();
        friendly setorigin(heli.origin);
        wait 1;
        scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_scriptableused(instance, "single", "vehicle_use", friendly, 0);
        if (argshave(args, "heli2")) {
            wait 3;
            disconnectbot(friendly);
        }
    }
    if (argshave(args, "water")) {
        host setorigin((28252, -32627, -415));
    }
    if (argshave(args, "disconnectswitch1")) {
        killplayerinstant(host, enemyteammates[0]);
        scripts\mp\gametypes\br_spectate::waittillspectating(host);
        friendly = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer();
        while (!host buttonpressed("BUTTON_RSHLDR")) {
            waitframe();
        }
        friendly2 = undefined;
        foreach (player in hostteammates) {
            if (player != host && player != friendly) {
                friendly2 = player;
                break;
            }
        }
        wait 0.5;
        disconnectbot(friendly2);
    }
    if (argshave(args, "disconnectswitch2")) {
        killplayerinstant(host, enemyteammates[0]);
        scripts\mp\gametypes\br_spectate::waittillspectating(host);
        friendly = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer();
        while (!host buttonpressed("BUTTON_RSHLDR")) {
            waitframe();
        }
        wait 0.5;
        disconnectbot(friendly);
    }
    if (argshave(args, "endspectate")) {
        level.br_infils_disabled = 1;
        /#
            setdevdvar(@"hash_7a1447160ba151fe", 1);
        #/
        setdvar(@"hash_faf1db5754891b2d", 2);
        level.gulag.maxuses = 0;
        wait 1;
        killplayerinstant(host, enemyteammates[0]);
        scripts\mp\gametypes\br_spectate::waittillspectating(host);
        wait 2;
        foreach (player in hostteammates) {
            if (player != host) {
                killplayerinstant(player, enemyteammates[0]);
            }
        }
        scripts\mp\gametypes\br_spectate::waittillspectating(host);
        wait 2;
        enemy = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer();
        killplayerinstant(enemy, enemyteammates[1]);
        scripts\mp\gametypes\br_spectate::waittillspectating(host);
        wait 2;
        enemy = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer();
        killplayerinstant(enemy, enemyteammates[1]);
        scripts\mp\gametypes\br_spectate::waittillspectating(host);
        wait 2;
        enemy = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer();
        killplayerinstant(enemy, enemyteammates[1]);
        scripts\mp\gametypes\br_spectate::waittillspectating(host);
        wait 2;
    }
    if (argshave(args, "teamwipe1")) {
        setdvar(@"hash_2c879521333c4987", 5);
        foreach (player in hostteammates) {
            if (player != host) {
                killplayerinstant(player, enemyteammates[0]);
            }
        }
        wait getdvarfloat(@"hash_b436ad5a39cb1f59", 5);
        enemy = killplayerinstant(host, enemyteammates[0]);
        wait getdvarfloat(@"hash_1f5ea86d19b61851", 13);
        killplayerinstant(enemy, enemyteammates[1]);
    }
    if (argshave(args, "deathswitch1")) {
        setdvar(@"hash_2c879521333c4987", 5);
        killplayerinstant(host, enemyteammates[0]);
        scripts\mp\gametypes\br_spectate::waittillspectating(host);
        friendly = host scripts\mp\gametypes\br_spectate::playergetspectatingplayer();
        while (!host buttonpressed("BUTTON_RSHLDR")) {
            waitframe();
        }
        friendly2 = undefined;
        foreach (player in hostteammates) {
            if (player != host && player != friendly) {
                friendly2 = player;
                break;
            }
        }
        wait 0.5;
        killplayerinstant(friendly2, enemyteammates[0]);
    }
    if (argshave(args, "squadwidget")) {
        setdvar(@"hash_e5f703a38f6e8043", 9999);
        setdvar(@"hash_2c879521333c4987", 3);
        foreach (player in hostteammates) {
            if (player != host) {
                disconnectbot(player);
            }
        }
        wait 5;
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        enemy1 function_df49f9975e17b225(1);
        killplayerinstant(enemy1, host);
        wait getdvarfloat(@"hash_32c6816aee4fdb27", 4);
        killplayerinstant(host, enemy2);
    }
    if (argshave(args, "killall")) {
        level.overrideingraceperiod = 1;
        lastplayer = hostteammates[1];
        foreach (player in hostteammates) {
            if (player != lastplayer) {
                killplayerinstant(player, enemyteammates[0]);
            }
        }
        foreach (player in enemyteammates[0]) {
            killplayerinstant(player, enemyteammates[1]);
        }
        foreach (player in enemyteammates[1]) {
            killplayerinstant(player, enemyteammates[0]);
        }
        wait 10;
        disconnectbot(lastplayer);
        level.overrideingraceperiod = undefined;
    }
    if (argshave(args, "moneykill")) {
        foreach (player in hostteammates) {
            if (player != host) {
                player scripts\mp\gametypes\br_plunder::playersetplundercount(45);
                player function_df49f9975e17b225(1);
                killplayerinstant(player, enemyteammates[0]);
            }
        }
        wait 5;
        killplayerinstant(host, enemyteammates[0]);
    }
    if (argshave(args, "buyback1")) {
        scriptcircleat(host.origin, 500);
        setdvar(@"hash_e5f703a38f6e8043", -1);
        playera = host;
        playera function_df49f9975e17b225(1);
        killplayer(playera, enemyteammates[1]);
        enemya = enemyteammates[1][0];
        enemya function_df49f9975e17b225(1);
        killplayer(enemya, enemyteammates[1]);
        while (!istrue(playera.gulagarena)) {
            waitframe();
        }
        wait 5;
        killplayerinstant(playera, []);
        while (!isdefined(playera getspectatingplayer())) {
            waitframe();
        }
        playerb = playera getspectatingplayer();
        playerb function_df49f9975e17b225(1);
        playerc = undefined;
        foreach (player in hostteammates) {
            if (player != playera && player != playerb) {
                playerc = player;
                break;
            }
        }
        playerc scripts\mp\gametypes\br_plunder::playersetplundercount(45);
        killplayer(playerb, enemyteammates[1]);
        while (!istrue(playerb.jailed)) {
            waitframe();
        }
        while (!isdefined(playera getspectatingplayer()) || playera getspectatingplayer() != playerb) {
            waitframe();
        }
        enemyb = enemyteammates[1][1];
        enemyb function_df49f9975e17b225(1);
        killplayer(enemyb, enemyteammates[1]);
        while (!istrue(playerb.gulagarena)) {
            waitframe();
        }
        wait 5;
        setdvar(@"hash_2c879521333c4987", 3);
        killplayerinstant(playerb, []);
        playerc scripts\mp\gametypes\br_pickups::addrespawntoken(1);
        playera thread scripts\mp\gametypes\br_gulag::playergulagautowin("devtest", playerc, 0);
    }
    if (argshave(args, "teamwipe2")) {
        killplayerinstant(host, enemyteammates[0]);
        host waittill("killcam_ended");
        wait 2;
        count = 0;
        foreach (player in hostteammates) {
            if (player != host) {
                if (count > 0) {
                    player scripts\mp\gametypes\br_plunder::playersetplundercount(45);
                    player function_df49f9975e17b225(1);
                }
                killplayerinstant(player, enemyteammates[1]);
                count++;
                wait 5;
            }
        }
    }
    if (argshave(args, "gulag11")) {
        host function_df49f9975e17b225(1);
        putinlaststand(host, enemyteammates[1]);
        wait 1;
        scripts\mp\gametypes\br_gulag::shutdowngulag("circle_index", 0);
        wait 1;
        host scripts\mp\laststand::finishreviveplayer("self_revive_success", host);
        wait 5;
        killplayer(host, enemyteammates[0]);
    }
    if (argshave(args, "infilDeath")) {
        thread waitandsuicide(getdvarint(@"hash_80d1406b579aaa79", 1), hostteammates[1]);
        onprematchstarted2();
        level waittill("br_c130_left_bounds");
        wait 2;
        hostteammates[2] function_df49f9975e17b225(0);
        killplayerinstant(hostteammates[2], enemyteammates[0]);
        wait 5;
        host function_df49f9975e17b225(0);
        killplayerinstant(host, enemyteammates[0]);
    }
    if (argshave(args, "reconGulag1")) {
        setdvar(@"hash_faf1db5754891b2d", 9);
        wait 5;
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[1][0];
        disconnectbot(enemyteammates[0][2]);
        disconnectbot(enemyteammates[0][1]);
        disconnectbot(enemyteammates[1][2]);
        disconnectbot(enemyteammates[1][1]);
        disconnectbot(hostteammates[2]);
        disconnectbot(hostteammates[1]);
        wait 1;
        host playerstartrecondronewait();
        enemy1 function_df49f9975e17b225(1);
        killplayerinstant(enemy1, enemy2);
        wait 7;
        host function_df49f9975e17b225(1);
        if (!host scripts\mp\utility\perk::_hasperk("specialty_pistoldeath")) {
            host scripts\mp\utility\perk::giveperk("specialty_pistoldeath");
        }
        killplayerinstant(host, enemy2, 1);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait 5;
        killplayerinstant(enemy1, host);
    }
    if (argshave(args, "reconGulag2")) {
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        friendly1 = hostteammates[1];
        friendly2 = hostteammates[2];
        if (friendly1 == host) {
            friendly1 = hostteammates[0];
        } else if (friendly2 == host) {
            friendly2 = hostteammates[0];
        }
        disconnectbot(enemyteammates[0][2]);
        disconnectbot(enemyteammates[1][2]);
        disconnectbot(enemyteammates[1][1]);
        disconnectbot(enemyteammates[1][0]);
        killplayerinstant(friendly2, enemy1);
        wait 1;
        friendly1 playerstartrecondronewait();
        wait 2;
        killplayerinstant(host, enemy1);
        host waittill("killcam_ended");
        wait 3;
        enemy2 function_df49f9975e17b225(1);
        killplayerinstant(enemy2, friendly1);
        friendly1 function_df49f9975e17b225(1);
        if (!friendly1 scripts\mp\utility\perk::_hasperk("specialty_pistoldeath")) {
            friendly1 scripts\mp\utility\perk::giveperk("specialty_pistoldeath");
        }
        killplayerinstant(friendly1, enemy1, 1);
        while (!istrue(friendly1.gulagarena)) {
            waitframe();
        }
        wait 5;
        killplayerinstant(friendly1, enemy2);
    }
    if (argshave(args, "endGameTwoDie")) {
        setdvar(@"hash_faf1db5754891b2d", 8);
        wait 5;
        scripts\mp\gametypes\br_gulag::shutdowngulag("circle_index", 0);
        enemy1 = enemyteammates[0][0];
        friendly1 = hostteammates[1];
        friendly2 = hostteammates[2];
        if (friendly1 == host) {
            friendly1 = hostteammates[0];
        } else if (friendly2 == host) {
            friendly2 = hostteammates[0];
        }
        killplayerinstant(enemyteammates[0][2], host);
        killplayerinstant(enemyteammates[0][1], host);
        killplayerinstant(enemyteammates[1][2], host);
        killplayerinstant(enemyteammates[1][1], host);
        killplayerinstant(enemyteammates[1][0], host);
        killplayerinstant(friendly1, enemy1);
        killplayerinstant(friendly2, enemy1);
        wait 3;
        host scripts\mp\juggernaut::jugg_makejuggernaut(level.juggksglobals.config);
        wait 3;
        enemy1 dodamage(999, enemy1.origin, enemy1, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
        while (isalive(host)) {
            host dodamage(999, host.origin, host, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
            waitframe();
        }
    }
    if (argshave(args, "infiniteLoot")) {
        setomnvar("scriptable_loot_hide", 0);
        startorigin = host.origin;
        startangles = host.angles;
        curxoffset = 0;
        curyoffset = 0;
        for (var_338deefd32d7ae30 = 0; true; var_338deefd32d7ae30 = 0) {
            dropinfo = getitemdropinfo(startorigin + (curxoffset, curyoffset, 0), startangles);
            spawnpickup("brloot_self_revive", dropinfo);
            var_338deefd32d7ae30++;
            curxoffset += 10;
            if (curxoffset > 5000) {
                curxoffset = 0;
                curyoffset += 10;
                if (curyoffset > 100) {
                    curyoffset = 0;
                }
            }
            if (var_338deefd32d7ae30 > 8) {
                waitframe();
            }
        }
    }
    if (argshave(args, "tempTeamTest")) {
        enemy1 = enemyteammates[0][0];
        enemy1 hudoutlineenableforclient(host, "defaulthudoutline");
        host.var_b5091efefe8e436b = "axis";
        enemy1.var_b5091efefe8e436b = "axis";
    }
    if (argshave(args, "gulag22a")) {
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        enemy3 = enemyteammates[1][0];
        host function_df49f9975e17b225(1);
        enemy1 function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        enemy3 function_df49f9975e17b225(1);
        killplayer(host, enemyteammates[0]);
        killplayer(enemy1, enemyteammates[1]);
        killplayer(enemy2, enemyteammates[1]);
        killplayer(enemy3, enemyteammates[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait 10;
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        gulagenemy = enemy1;
        if (teammate == enemy1) {
            gulagenemy = enemy2;
        }
        killplayer(host, gulagenemy);
        wait getdvarint(@"hash_f4becbcb52fb0332", 2);
        disconnectbot(teammate);
    }
    if (argshave(args, "gulag22b")) {
        setdvar(@"hash_8bdee07fa09e810a", 0);
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        enemy3 = enemyteammates[1][0];
        host function_df49f9975e17b225(1);
        enemy1 function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        var_70189b6a231df8d6 = hostteammates[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = hostteammates[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        friendlyjail = hostteammates[1];
        if (friendlyjail == host || friendlyjail == var_70189b6a231df8d6) {
            friendlyjail = hostteammates[2];
        }
        friendlyjail function_df49f9975e17b225(1);
        killplayer(host, enemyteammates[0]);
        killplayer(var_70189b6a231df8d6, enemyteammates[0]);
        killplayer(enemy1, enemyteammates[1]);
        killplayer(enemy2, enemyteammates[1]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait 12;
        killplayer(friendlyjail, enemy3);
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        gulagenemy = enemy1;
        if (teammate == enemy1) {
            gulagenemy = enemy2;
        }
        killplayer(host, gulagenemy);
        while (!isdefined(host getspectatingplayer()) || host getspectatingplayer() != teammate) {
            waitframe();
        }
        wait getdvarint(@"hash_c12d58979b7c7ca8", 3);
        assert(teammate == var_70189b6a231df8d6);
        killplayer(teammate, enemy1);
        while (!isdefined(host getspectatingplayer()) || host getspectatingplayer() != friendlyjail) {
            waitframe();
        }
        var_df2fbb13c226be75 = "timeout";
        if (namespace_eb17b46cdcb98eea::function_1980065ce4dc067b()) {
            var_df2fbb13c226be75 = "br_twotwo_gulag_win_jail_timeout";
        }
        thread scripts\mp\gametypes\br_gulag::gulagvictory(friendlyjail.arena, friendlyjail, 1, 0, var_df2fbb13c226be75);
    }
    if (argshave(args, "gulag22c")) {
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        enemy3 = enemyteammates[1][0];
        host function_df49f9975e17b225(1);
        enemy1 function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        enemy3 function_df49f9975e17b225(1);
        killplayer(host, enemyteammates[0]);
        killplayer(enemy1, enemyteammates[1]);
        killplayer(enemy2, enemyteammates[1]);
        killplayer(enemy3, enemyteammates[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait 10;
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        gulagenemy = enemy1;
        if (teammate == enemy1) {
            gulagenemy = enemy2;
        }
        killplayer(host, gulagenemy);
        killplayer(teammate, gulagenemy);
        setdvar(@"hash_9e78730ec3baa38c", 0.1);
        eventdata = level.br_pe_data[3];
        eventdata.active = 1;
        scripts\mp\gametypes\br_publicevents::activateevent(eventdata);
    }
    if (argshave(args, "gulag22d")) {
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        var_70189b6a231df8d6 = hostteammates[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = hostteammates[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        enemy1 function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        killplayer(enemy1, enemyteammates[1]);
        killplayer(enemy2, enemyteammates[1]);
        killplayer(host, enemyteammates[0]);
        killplayer(var_70189b6a231df8d6, enemyteammates[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait 10;
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        var_24b7d6dc16777f00 = enemy1;
        if (teammate == enemy1) {
            var_24b7d6dc16777f00 = enemy2;
        }
        killplayer(host, var_24b7d6dc16777f00);
        killplayer(teammate, var_24b7d6dc16777f00);
        wait 10;
        setdvar(@"hash_9e78730ec3baa38c", 0.1);
        eventdata = level.br_pe_data[3];
        eventdata.active = 1;
        scripts\mp\gametypes\br_publicevents::activateevent(eventdata);
    }
    if (argshave(args, "gulag22e")) {
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        var_70189b6a231df8d6 = hostteammates[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = hostteammates[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        friendly2 = hostteammates[2];
        if (friendly2 == host) {
            friendly2 = hostteammates[1];
        }
        friendly2 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        enemy1 function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        killplayer(enemy1, enemyteammates[1]);
        killplayer(enemy2, enemyteammates[1]);
        killplayer(host, enemyteammates[0]);
        killplayer(var_70189b6a231df8d6, enemyteammates[0]);
        wait 1;
        killplayer(friendly2, enemyteammates[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait 10;
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        killplayer(enemy1, host);
        killplayer(enemy2, host);
    }
    if (argshave(args, "gulag22f")) {
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        var_70189b6a231df8d6 = hostteammates[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = hostteammates[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        friendly2 = hostteammates[2];
        if (friendly2 == host) {
            friendly2 = hostteammates[1];
        }
        friendly2 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        enemy1 function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        killplayer(enemy1, enemyteammates[1]);
        killplayer(enemy2, enemyteammates[1]);
        killplayer(host, enemyteammates[0]);
        killplayer(var_70189b6a231df8d6, enemyteammates[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait 5;
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        host iprintlnbold("END ARENA");
        host.arena notify("matchEnded");
        host.arena notify("fight_over_early");
        thread scripts\mp\gametypes\br_gulag::handleendarena(host.arena, undefined, 1, 1, "debug", friendly2);
        wait 10;
        host iprintlnbold("Kill Players");
        killplayer(enemy1, host);
        killplayer(enemy2, host);
    }
    if (argshave(args, "gulag22g")) {
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        enemy3 = enemyteammates[0][2];
        var_70189b6a231df8d6 = hostteammates[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = hostteammates[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        friendly2 = hostteammates[2];
        if (friendly2 == host) {
            friendly2 = hostteammates[1];
        }
        friendly2 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        enemy1 function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        killplayer(enemy1, enemyteammates[1]);
        killplayer(enemy2, enemyteammates[1]);
        killplayer(host, enemyteammates[0]);
        killplayer(var_70189b6a231df8d6, enemyteammates[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait getdvarint(@"hash_f4becbcb52fb0332", 12);
        if (getdvarint(@"hash_197c9f3caaa6312b", 0)) {
            killplayer(host, enemyteammates[0]);
            killplayer(var_70189b6a231df8d6, enemyteammates[0]);
            wait getdvarfloat(@"hash_3a9d30277e079900", 0);
        } else if (getdvarint(@"hash_b3434b6b4b7df9fb", 0)) {
            killplayer(host, enemyteammates[0]);
            wait getdvarfloat(@"hash_3a9d30277e079900", 0);
        }
        arena = host.arena;
        if (getdvarint(@"hash_fb8d8ca747bf8b29", 0)) {
            scripts\mp\gametypes\br_vip_quest::vip_respawnplayer(host, friendly2, "debug");
            scripts\mp\gametypes\br_vip_quest::vip_respawnplayer(var_70189b6a231df8d6, friendly2, "debug");
        } else {
            scripts\mp\gametypes\br_vip_quest::vip_respawnplayer(enemy1, enemy3, "debug");
            scripts\mp\gametypes\br_vip_quest::vip_respawnplayer(enemy1, enemy3, "debug");
        }
    }
    if (argshave(args, "gulag22h")) {
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        enemy3 = enemyteammates[0][2];
        var_70189b6a231df8d6 = hostteammates[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = hostteammates[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        friendly2 = hostteammates[2];
        if (friendly2 == host) {
            friendly2 = hostteammates[1];
        }
        friendly2 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        enemy1 function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        killplayer(enemy1, enemyteammates[1]);
        killplayer(enemy2, enemyteammates[1]);
        killplayer(host, enemyteammates[0]);
        killplayer(var_70189b6a231df8d6, enemyteammates[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait getdvarint(@"hash_f4becbcb52fb0332", 12);
        if (getdvarint(@"hash_197c9f3caaa6312b", 0)) {
            killplayer(host, enemyteammates[0]);
            killplayer(var_70189b6a231df8d6, enemyteammates[0]);
            wait getdvarfloat(@"hash_3a9d30277e079900", 0);
        } else if (getdvarint(@"hash_b3434b6b4b7df9fb", 1)) {
            killplayer(host, enemyteammates[0]);
            wait getdvarfloat(@"hash_3a9d30277e079900", 1);
        }
        arena = host.arena;
        if (getdvarint(@"hash_fb8d8ca747bf8b29", 1)) {
            scripts\mp\gametypes\br_vip_quest::vip_respawnplayer(host, friendly2, "debug");
            scripts\mp\gametypes\br_vip_quest::vip_respawnplayer(var_70189b6a231df8d6, friendly2, "debug");
        } else {
            scripts\mp\gametypes\br_vip_quest::vip_respawnplayer(enemy1, enemy3, "debug");
            scripts\mp\gametypes\br_vip_quest::vip_respawnplayer(enemy1, enemy3, "debug");
        }
    }
    if (argshave(args, "gulag22i")) {
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        enemy3 = enemyteammates[0][2];
        var_70189b6a231df8d6 = hostteammates[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = hostteammates[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        friendly2 = hostteammates[2];
        if (friendly2 == host) {
            friendly2 = hostteammates[1];
        }
        friendly2 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        enemy1 function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        killplayer(enemy1, enemyteammates[1]);
        killplayer(enemy2, enemyteammates[1]);
        killplayer(host, enemyteammates[0]);
        killplayer(var_70189b6a231df8d6, enemyteammates[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait getdvarint(@"hash_f4becbcb52fb0332", 5);
        disconnectbot(var_70189b6a231df8d6);
        disconnectbot(enemy1);
        disconnectbot(enemy2);
    }
    if (argshave(args, "gulag22j")) {
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        enemy3 = enemyteammates[0][2];
        enemya = enemyteammates[1][0];
        enemyb = enemyteammates[1][1];
        enemyc = enemyteammates[1][2];
        var_70189b6a231df8d6 = hostteammates[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = hostteammates[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        friendly2 = hostteammates[2];
        if (friendly2 == host) {
            friendly2 = hostteammates[1];
        }
        friendly2 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        enemy1 function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        enemy3 function_df49f9975e17b225(1);
        enemya function_df49f9975e17b225(1);
        enemyb function_df49f9975e17b225(1);
        enemyc function_df49f9975e17b225(1);
        killplayer(enemy1, host);
        killplayer(enemy2, host);
        killplayer(enemya, host);
        killplayer(enemyb, host);
        while (!istrue(enemy1.gulagarena)) {
            waitframe();
        }
        wait getdvarint(@"hash_f4becbcb52fb0332", 1);
        killplayer(host, enemy1);
        killplayer(var_70189b6a231df8d6, enemy1);
        killplayer(enemy3, host);
        killplayer(enemyc, host);
        while (!istrue(host.jailed) || !istrue(var_70189b6a231df8d6.jailed) || !istrue(enemy3.jailed) || !istrue(enemyc.jailed)) {
            waitframe();
        }
        scripts\mp\gametypes\br_gulag::shutdowngulag("debug", 0);
    }
    if (argshave(args, "gulag22k")) {
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        var_70189b6a231df8d6 = hostteammates[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = hostteammates[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        friendly2 = hostteammates[2];
        if (friendly2 == host) {
            friendly2 = hostteammates[1];
        }
        friendly2 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        enemy1 function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        killplayer(enemy1, enemyteammates[1]);
        killplayer(enemy2, enemyteammates[1]);
        killplayer(host, enemyteammates[0]);
        killplayer(var_70189b6a231df8d6, enemyteammates[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait 12;
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        killplayer(var_70189b6a231df8d6, host);
        killplayer(enemy2, host);
    }
    if (argshave(args, "jailbreakRespawn")) {
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        friendly1 = hostteammates[0];
        if (friendly1 == host) {
            friendly1 = hostteammates[1];
        }
        friendly2 = hostteammates[2];
        if (friendly2 == host) {
            friendly2 = hostteammates[1];
        }
        friendly2 function_df49f9975e17b225(1);
        killplayer(host, enemyteammates[1]);
        killplayer(friendly1, enemyteammates[1]);
        killplayer(friendly2, enemyteammates[0]);
        wait getdvarint(@"hash_3a9d33277e079f99", 10);
        setdvar(@"hash_9e78730ec3baa38c", 0.1);
        eventdata = level.br_pe_data[3];
        eventdata.active = 1;
        scripts\mp\gametypes\br_publicevents::activateevent(eventdata);
    }
    if (argshave(args, "gulag22l")) {
        var_c012bf62499f5c7a = setnumteams(args, 4);
        enemyteammates = var_c012bf62499f5c7a[1];
        hostteammates = var_c012bf62499f5c7a[0];
        playera = host;
        playerb = enemyteammates[0][0];
        playerc = enemyteammates[1][0];
        playerd = enemyteammates[2][0];
        playere = enemyteammates[2][1];
        friendly1 = hostteammates[0];
        if (friendly1 == host) {
            friendly1 = hostteammates[1];
        }
        friendly2 = hostteammates[2];
        if (friendly2 == host) {
            friendly2 = hostteammates[1];
        }
        playera function_df49f9975e17b225(1);
        playerb function_df49f9975e17b225(1);
        playerc function_df49f9975e17b225(0);
        playerd function_df49f9975e17b225(1);
        playere function_df49f9975e17b225(1);
        killplayer(playera, enemyteammates[1]);
        killplayer(playerb, enemyteammates[1]);
        killplayer(playerd, enemyteammates[0]);
        killplayer(playere, enemyteammates[0]);
        disconnectbot(friendly1);
        disconnectbot(friendly2);
        disconnectbot(enemyteammates[1][1]);
        disconnectbot(enemyteammates[1][2]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        assert(teammate == playerb);
        wait 10;
        arena = host.arena;
        killplayer(playera, playerd);
        wait 3;
        killplayer(playerc, enemyteammates[2][2]);
        while (!isdefined(arena.var_707537a8904aa962) || arena.var_707537a8904aa962.size == 0) {
            waitframe();
        }
        jailer = arena.var_707537a8904aa962[0];
        wait 3;
        while (isalive(jailer)) {
            jailer dodamage(jailer.health, playerb.origin, playerb, playerb, "MOD_RIFLE_BULLET", playerb getcurrentprimaryweapon());
        }
        while (!isalive(playera)) {
            waitframe();
        }
        wait 3;
        playera function_df49f9975e17b225(0);
        killplayer(playera, playerd);
    }
    if (argshave(args, "gulag22m")) {
        var_bfe236624969d2f2 = setnumteams(args, 4);
        enemyteammates = var_bfe236624969d2f2[1];
        hostteammates = var_bfe236624969d2f2[0];
        playera = host;
        playerb = enemyteammates[0][0];
        playerc = enemyteammates[1][0];
        playerd = enemyteammates[1][1];
        friendly1 = hostteammates[0];
        if (friendly1 == host) {
            friendly1 = hostteammates[1];
        }
        friendly2 = hostteammates[2];
        if (friendly2 == host) {
            friendly2 = hostteammates[1];
        }
        playera function_df49f9975e17b225(1);
        playerb function_df49f9975e17b225(1);
        playerc function_df49f9975e17b225(1);
        playerd function_df49f9975e17b225(1);
        killplayer(playera, enemyteammates[1]);
        killplayer(playerb, enemyteammates[1]);
        killplayer(playerc, enemyteammates[0]);
        killplayer(playerd, enemyteammates[0]);
        disconnectbot(friendly1);
        disconnectbot(friendly2);
        disconnectbot(enemyteammates[0][1]);
        disconnectbot(enemyteammates[0][2]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        assert(teammate == playerb);
        wait 10;
        arena = host.arena;
        killplayer(playerb, playerd);
        wait 3;
        killplayer(playera, playerd);
    }
    if (argshave(args, "endGameTeam")) {
        level.br_infils_disabled = 1;
        setdvar(@"hash_faf1db5754891b2d", 8);
        wait 5;
        scripts\mp\gametypes\br_gulag::shutdowngulag("circle_index", 0);
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        friendly1 = hostteammates[1];
        friendly2 = hostteammates[2];
        if (friendly1 == host) {
            friendly1 = hostteammates[0];
        } else if (friendly2 == host) {
            friendly2 = hostteammates[0];
        }
        killplayerinstant(enemy2, host);
        wait 1;
        killplayerinstant(friendly1, enemy1);
        wait 1;
        killplayerinstant(friendly2, enemy1);
        wait 1;
        killplayerinstant(host, enemy1);
    }
    if (argshave(args, "riotBackSeat")) {
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        friendly1 = hostteammates[1];
        friendly2 = hostteammates[2];
        if (friendly1 == host) {
            friendly1 = hostteammates[0];
        } else if (friendly2 == host) {
            friendly2 = hostteammates[0];
        }
        if (!isdefined(level.var_bce6d38bf86a8328)) {
            seatid = undefined;
            spawndata = spawnstruct();
            spawndata.origin = (250, -1900, 130);
            spawndata.angles = (0, 0, 0);
            spawndata.spawntype = "DEVGUI";
            level.var_bce6d38bf86a8328 = scripts\cp_mp\vehicles\vehicle::vehicle_spawn("veh9_jltv", spawndata);
            wait 1;
            thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_enter(level.var_bce6d38bf86a8328, "driver", friendly1, undefined, 1);
            thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_enter(level.var_bce6d38bf86a8328, "front_right", friendly2, undefined, 1);
        }
        setomnvar("scriptable_loot_hide", 0);
        host takeallweapons();
        host function_d5d7db93c58f96b7("iw9_me_riotshield_mp");
        host function_d5d7db93c58f96b7("iw9_me_tonfa_mp");
    }
    if (argshave(args, "interrogateKill")) {
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        friendly1 = hostteammates[1];
        friendly2 = hostteammates[2];
        if (friendly1 == host) {
            friendly1 = hostteammates[0];
        } else if (friendly2 == host) {
            friendly2 = hostteammates[0];
        }
        putinlaststand(enemy1, host);
        while (!istrue(host.var_93018d510a589832)) {
            waitframe();
        }
        wait getdvarfloat(@"hash_f4becbcb52fb0332", 3.5);
        killplayerinstant(enemy1, friendly1);
    }
    if (argshave(args, "helmet_test")) {
        wait 1;
        var_90b785bcb1d9abf7 = host.maxarmorhealth;
        if (isdefined(args[1])) {
            var_90b785bcb1d9abf7 = int(args[1]);
        }
        foreach (enemyteam in enemyteammates) {
            foreach (targetenemy in enemyteam) {
                targetenemy namespace_f8d3520d3483c1::setArmorHealth(var_90b785bcb1d9abf7);
                helmet = function_53aa698b2205a4c3(targetenemy, "brloot_equip_reinforced_helmet");
                scripts\mp\gametypes\br_pickups::lootused(helmet, helmet.type, "visible", targetenemy);
                waitframe();
            }
        }
    }
    if (argshave(args, "eod_test")) {
        /#
            level thread scripts\mp\gametypes\br_dev::function_2729e9ab8a4ec44e();
        #/
        enemy1 = enemyteammates[0][0];
        enemy2 = enemyteammates[0][1];
        friendly1 = hostteammates[1];
        friendly2 = hostteammates[2];
        if (friendly1 == host) {
            friendly1 = hostteammates[0];
        } else if (friendly2 == host) {
            friendly2 = hostteammates[0];
        }
        var_3a09c5274d12ec10 = anglestoleft(host.angles);
        neworg = host.origin + var_3a09c5274d12ec10 * 200;
        while (true) {
            enemy1 namespace_f8d3520d3483c1::setArmorHealth(host.maxarmorhealth);
            enemy1 scripts\mp\utility\perk::giveperk("specialty_eod");
            enemy1 setorigin(neworg);
            enemy1 waittill("death");
            wait 3;
            enemy1 spawnclientdevtest(0);
            if (istrue(enemy1.br_iseliminated)) {
                scripts\mp\gametypes\br_utility::unmarkplayeraseliminated(enemy1);
            }
        }
    }
    if (argshave(args, "maxloot") || argshave(args, "maxlootforce")) {
        setomnvar("scriptable_loot_hide", 0);
        numtospawn = level.br_pickups.scriptablesmax - level.br_pickups.scriptables.size;
        if (argshave(args, "maxlootforce")) {
            numtospawn = level.br_pickups.scriptablesmax;
        }
        if (numtospawn == 0) {
            return;
        }
        if (!isdefined(level.var_7494af60dff9dc61) || argshave(args, "maxlootforce")) {
            level.var_7494af60dff9dc61 = 0;
        } else {
            level.var_7494af60dff9dc61 += 30;
        }
        for (i = 0; i < numtospawn; i++) {
            function_53aa698b2205a4c3(host, "brloot_self_revive", host.origin + i * (30, 0, 0) + (0, level.var_7494af60dff9dc61, 0));
        }
    }
    if (argshave(args, "ui_squad_widget_test")) {
        wait 2;
        enemy1 = enemyteammates[0][0];
        friendly1 = hostteammates[1];
        friendly2 = hostteammates[2];
        enemy1 function_df49f9975e17b225(1);
        friendly1 function_df49f9975e17b225(1);
        friendly2 function_df49f9975e17b225(1);
        for (i = 0; i < 11; i++) {
            friendly1 scripts\mp\gametypes\br_pickups::br_forcegivecustompickupitem(friendly1, "brloot_armor_plate", 1);
            friendly2 scripts\mp\gametypes\br_pickups::br_forcegivecustompickupitem(friendly2, "brloot_armor_plate", 1);
            wait 0.25;
        }
        friendly1 scripts\mp\gametypes\br_pickups::br_forcegivecustompickupitem(friendly1, "brloot_equip_gasmask", 1);
        friendly2 scripts\mp\gametypes\br_pickups::br_forcegivecustompickupitem(friendly2, "brloot_equip_gasmask_durable", 1);
        wait 1;
        friendly1 scripts\mp\killstreaks\killstreaks::awardkillstreak("uav", "other");
        friendly2 scripts\mp\killstreaks\killstreaks::awardkillstreak("precision_airstrike", "other");
        wait 1;
        friendly1 scripts\mp\gametypes\br_pickups::addrespawntoken(1);
        friendly2 scripts\mp\gametypes\br_pickups::addrespawntoken(1);
        wait 1;
        friendly1 scripts\mp\gametypes\br_pickups::function_127474f04c3a06b5(1);
        friendly2 scripts\mp\gametypes\br_pickups::function_127474f04c3a06b5(1);
        wait 3;
        killplayer(friendly1, enemy1);
        if (!isdefined(level.var_bce6d38bf86a8328)) {
            seatid = undefined;
            spawndata = spawnstruct();
            spawndata.origin = (250, -1900, 130);
            spawndata.angles = (0, 0, 0);
            spawndata.spawntype = "DEVGUI";
            level.var_bce6d38bf86a8328 = scripts\cp_mp\vehicles\vehicle::vehicle_spawn("veh9_jltv", spawndata);
            wait 1;
            thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_enter(level.var_bce6d38bf86a8328, "driver", friendly2, undefined, 1);
        }
    }
}

// Namespace namespace_3db0584c4c3b350b / namespace_ed19ace3eeb2e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f10
// Size: 0xb9
function function_d5d7db93c58f96b7(var_148a924a1aa2ca69) {
    weapnew = getweaponrootname(var_148a924a1aa2ca69);
    if (!function_89497fa763d431c0(weapnew)) {
        level.weaponmapdata[weapnew] = spawnstruct();
        level.weaponmapdata[weapnew].assetname = var_148a924a1aa2ca69;
        level.weaponmapdata[weapnew].group = "weapon_assault";
    }
    variant = -1;
    var_11a1fa68aeb971c0 = scripts\cp_mp\utility\game_utility::function_d2d2b803a7b741a4();
    var_c88b10f789adf8eb = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(weapnew, undefined, undefined, variant, undefined, undefined, var_11a1fa68aeb971c0);
    if (self hasweapon(var_c88b10f789adf8eb)) {
        scripts\cp_mp\utility\inventory_utility::_takeweapon(var_c88b10f789adf8eb);
    }
    self giveweapon(var_c88b10f789adf8eb);
    return var_c88b10f789adf8eb;
}

