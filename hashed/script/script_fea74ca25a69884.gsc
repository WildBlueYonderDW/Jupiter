// mwiii decomp prototype
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
#using script_a34750d17473c49;
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
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\juggernaut.gsc;
#using script_3aa8e63a56e3416;
#using script_5bc60484d17fa95c;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using scripts\mp\gametypes\br_vip_quest.gsc;

#namespace namespace_3db0584c4c3b350b;

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ce
// Size: 0x4b
function init() {
    /#
        setdvarifuninitialized(@"hash_87e38fca685cec1d", 1);
    #/
    if (getdvarint(@"hash_87e38fca685cec1d", 0)) {
        namespace_e4c20df2c9115a56::registerhandlecommand(&function_dd5235ea93f4af20);
        thread namespace_e4c20df2c9115a56::commandwatcher(@"hash_97cda940cb7bd182", &namespace_e4c20df2c9115a56::handlecommand);
    }
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x820
// Size: 0x44
function function_dd5235ea93f4af20(command, args) {
    switch (command) {
    case #"hash_fa50c0f6bd8302a2":
        thread devscriptedtests(args);
        break;
    default:
        break;
    }
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86b
// Size: 0x99
function devscriptedtests(args) {
    level notify("devScriptedTests");
    level endon("devScriptedTests");
    host = gethost(args);
    if (!isdefined(host)) {
        return;
    }
    function_d721ba3a92dffd4c();
    function_8032016446156bad();
    function_26e60c051f1c9ba6();
    function_a77dc072d0e3be59();
    var_57accdc40b2f50e = spawnteams(args);
    var_5d192b4c08040010 = var_57accdc40b2f50e[1];
    var_92b132654e85cbc4 = var_57accdc40b2f50e[0];
    host iprintlnbold("Test ready");
    wait(2);
    function_77a10f0eec39cb4f(args, host, var_92b132654e85cbc4, var_5d192b4c08040010);
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90b
// Size: 0x86
function function_b59fcddf8ee2d0ba() {
    if (namespace_36f464722d326bbe::isdonetskmap()) {
        spawnlocations = [0:namespace_d20f8ef223912e12::createspawnlocation((-21500, 46200, -300), 0, 6000), 1:namespace_d20f8ef223912e12::createspawnlocation((51000, -39000, 1401), 0, 4000), 2:namespace_d20f8ef223912e12::createspawnlocation((32000, 40000, 767), 0, 5500), 3:namespace_d20f8ef223912e12::createspawnlocation((23000, -15000, -158), 0, 6000)];
        return spawnlocations;
    }
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x998
// Size: 0x1c5
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

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb64
// Size: 0xca
function function_8032016446156bad() {
    namespace_4b0406965e556711::gameflagset("prematch_done");
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
    namespace_b2d5aa2baf2b5701::function_182c52d5da69684d();
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc35
// Size: 0x162
function function_26e60c051f1c9ba6() {
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
        player namespace_10260b963310d30e::finishreviveplayer("self_revive_success", player);
        player setstance("stand");
        player setallstreamloaddist(0);
        player.setspawnpoint = undefined;
        var_9fdc1f9e4fc628e4 = spawnstruct();
        var_9fdc1f9e4fc628e4.var_fb551788da0fc531 = 0;
        player namespace_47fd1e79a44628cd::playerrespawngulagcleanup(var_9fdc1f9e4fc628e4);
        player namespace_47fd1e79a44628cd::playergulagarenaready();
    }
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9e
// Size: 0xa2
function function_a77dc072d0e3be59() {
    if (isdefined(level.br_circle.safecircleent)) {
        level.br_circle.dangercircleui.hidden = 1;
        level.br_circle.dangercircleent.hidden = 1;
        level.br_circle.safecircleui.hidden = 1;
        level.br_circle.safecircleent.hidden = 1;
        level notify("update_circle_hide");
    }
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe47
// Size: 0x252
function spawnteams(args) {
    host = gethost(args);
    spawnlocations = function_b59fcddf8ee2d0ba();
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
        for (var_e1d097c517c3af5b = 0; var_e1d097c517c3af5b < var_e2d2256d6f8ba785; var_e1d097c517c3af5b++) {
            var_b16a2ed5e620b451 = level.var_cc15d00c0dfbf14e[var_e1d097c517c3af5b][i];
            var_b16a2ed5e620b451 playerteleporttoloc(spawnorigin, var_e1d097c517c3af5b + 1);
        }
    }
    level.disablespawning = 1;
    totalplayers = getlivingplayers();
    level.totalplayers = totalplayers.size;
    return [0:level.var_84931945e7b207, 1:level.var_cc15d00c0dfbf14e];
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a1
// Size: 0xd0
function playerteleporttoloc(spawnorigin, var_dcef536353ea980b) {
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
        spawnorigin = spawnorigin + dir * var_dcef536353ea980b * 50;
        spawnorigin = getgroundposition(spawnorigin, 15, 100);
    }
    self setorigin(spawnorigin);
    self setplayerangles((0, 0, 0));
    if (!isdefined(level.devspectateloc[entnum])) {
        level.devspectateloc[entnum] = spawnorigin;
    }
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1178
// Size: 0x160
function reviveteam(host, team) {
    teammates = level.teamdata[team]["players"];
    var_e89fb3807c5150ca = 0;
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
            var_e89fb3807c5150ca = 1;
        }
        if (istrue(player.br_iseliminated)) {
            namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(player);
        }
    }
    if (var_e89fb3807c5150ca) {
        host iprintlnbold("Reviving Team: " + team);
        wait(1);
    }
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12df
// Size: 0x10b
function getteamspawnbots(host, team) {
    var_fc617751f654a141 = 0;
    if (level.teamdata[team]["teamCount"] < level.maxteamsize) {
        var_fc617751f654a141 = level.maxteamsize - level.teamdata[team]["teamCount"];
    }
    if (var_fc617751f654a141 > 0) {
        level.modespawnclient = &spawnclientdevtest;
        addbots(var_fc617751f654a141, team);
        host iprintlnbold("Spawning Team: " + team);
        timeout = gettime() + 10000;
        while (gettime() < timeout && level.teamdata[team]["aliveCount"] < level.maxteamsize) {
            waitframe();
        }
        level.modespawnclient = &namespace_d20f8ef223912e12::spawnclientbr;
    }
    /#
        assert(level.teamdata[team]["alivePlayers"].size == level.maxteamsize);
    #/
    return level.teamdata[team]["alivePlayers"];
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f2
// Size: 0xe6
function function_46c357e31a65af85() {
    team = self.bot_team;
    players = level.teamdata[team]["players"];
    for (i = 0; i < level.maxteamsize; i++) {
        var_46ad8d2ae6655343 = 1;
        foreach (player in players) {
            if (self == player) {
                continue;
            }
            if (isdefined(player.var_3f78c6a0862f9e25) && player.var_3f78c6a0862f9e25 == i) {
                var_46ad8d2ae6655343 = 0;
                break;
            }
        }
        if (var_46ad8d2ae6655343) {
            self.var_3f78c6a0862f9e25 = i;
            break;
        }
    }
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14df
// Size: 0x54
function addbots(numbots, team) {
    if (!isdefined(team)) {
        team = "autoassign";
    }
    level thread [[ level.bot_funcs["bots_spawn"] ]](numbots, team, &function_46c357e31a65af85);
    if (level.matchmakingmatch) {
        setmatchdata("hasBots", 1);
    }
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x153a
// Size: 0xb5
function spawnclientdevtest(var_9156b53bcf7ce573) {
    self.class = namespace_d20f8ef223912e12::pickprematchrandomloadout();
    self.pers["class"] = self.class;
    namespace_99ac021a7547cae3::spawnplayer(undefined, 0);
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

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f6
// Size: 0x16
function function_df49f9975e17b225(value) {
    self.br_infilstarted = value;
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1613
// Size: 0x2c
function function_645de575b455626c(var_c2012867b496a7cb) {
    /#
        assert(isbot(var_c2012867b496a7cb));
    #/
    kick(var_c2012867b496a7cb getentitynumber(), "EXE/PLAYERKICKED_BOT_BALANCE");
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1646
// Size: 0x92
function killplayer(victim, var_25012cdc0dfdc53f) {
    enemy = var_25012cdc0dfdc53f;
    if (isarray(var_25012cdc0dfdc53f)) {
        enemy = getnearbyaliveplayer(victim.origin, var_25012cdc0dfdc53f);
    }
    victim dodamage(500, enemy.origin, enemy, undefined, "MOD_EXPLOSIVE", enemy getcurrentprimaryweapon());
    wait(1);
    while (isalive(victim)) {
        victim dodamage(500, enemy.origin, enemy, undefined, "MOD_EXPLOSIVE", enemy getcurrentprimaryweapon());
        waitframe();
    }
    return enemy;
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e0
// Size: 0xac
function killplayerinstant(victim, var_25012cdc0dfdc53f, var_e953bcc50c294ae4) {
    enemy = var_25012cdc0dfdc53f;
    if (isarray(var_25012cdc0dfdc53f)) {
        enemy = getnearbyaliveplayer(victim.origin, var_25012cdc0dfdc53f);
    }
    if (!isdefined(enemy)) {
        enemy = victim;
    }
    if (!istrue(var_e953bcc50c294ae4) && victim namespace_82dcd1d5ae30ff7::_hasperk("specialty_pistoldeath")) {
        victim namespace_82dcd1d5ae30ff7::removeperk("specialty_pistoldeath");
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

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1794
// Size: 0x9b
function putinlaststand(player, var_25012cdc0dfdc53f) {
    enemy = var_25012cdc0dfdc53f;
    if (isarray(var_25012cdc0dfdc53f)) {
        enemy = getnearbyaliveplayer(player.origin, var_25012cdc0dfdc53f);
    }
    if (!isdefined(enemy)) {
        enemy = player;
    }
    if (!player namespace_82dcd1d5ae30ff7::_hasperk("specialty_pistoldeath")) {
        player namespace_82dcd1d5ae30ff7::giveperk("specialty_pistoldeath");
    }
    while (!istrue(player.inlaststand)) {
        player dodamage(30, enemy.origin, enemy, undefined, "MOD_EXPLOSIVE", enemy getcurrentprimaryweapon());
        wait(0.1);
    }
    return enemy;
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1837
// Size: 0x2af
function scriptcircleat(origin, radius) {
    if (!isdefined(level.br_circle.safecircleent)) {
        thread namespace_c5622898120e827f::runcircles(1);
        level.br_circle thread namespace_c5622898120e827f::circledamagetick();
    }
    waitframe();
    level notify("CirclePeekCleanup");
    circleindex = 1;
    level.br_circle.starttime = gettime();
    level.br_circle.circleindex = circleindex;
    var_f007ce073dc3c519 = circleindex == 0;
    var_6b890e6be7982efb = circleindex == level.br_level.br_circleclosetimes.size - 1;
    var_c3d4caa5cb4132e6 = level.br_level.br_circledelaytimes[circleindex];
    closetime = level.br_level.br_circleclosetimes[circleindex];
    var_154ef61b7a7f747a = level.br_level.br_circleradii[circleindex + 1];
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
    namespace_c5622898120e827f::setstaticuicircles(999, level.br_circle.safecircleui, level.br_circle.dangercircleui, var_6b890e6be7982efb);
    level notify("br_circle_set");
    waitframe();
    level notify("br_circle_started");
    level.br_circle.dangercircleent brcirclemoveto(origin[0], origin[1], radius, 1);
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aed
// Size: 0x2c
function function_2ea11e29fb71e2ad(args, numteams) {
    if (numteams <= 0) {
        return;
    }
    level.var_c3a1ed2db43ce5a = numteams;
    return spawnteams(args);
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b21
// Size: 0x9f
function getnearbyaliveplayer(org, players) {
    players = array_removeundefined(players);
    players = sortbydistance(players, org);
    if (isalive(players[0])) {
        dist = distance2dsquared(org, players[0].origin);
        if (dist < 40000) {
            return players[0];
        }
    }
    var_2ec9f2281965d86b = undefined;
    for (i = 1; i < players.size; i++) {
        player = players[i];
        if (isalive(player)) {
            var_2ec9f2281965d86b = player;
            break;
        }
    }
    return var_2ec9f2281965d86b;
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bc8
// Size: 0x63
function argshave(args, token) {
    foreach (arg in args) {
        if (arg == token) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c33
// Size: 0x14f
function gethost(args) {
    if (isdefined(level.devspectatetesthost)) {
        return level.devspectatetesthost;
    }
    host = namespace_d576b6dc7cef9c62::gethostplayer();
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

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d8a
// Size: 0x77
function playerstartrecondronewait() {
    pickupent = spawnstruct();
    pickupent.scriptablename = "brloot_killstreak_recondrone";
    pickupent.count = 1;
    namespace_cb965d2f71fefddc::takesuperpickup(pickupent);
    wait(1);
    var_641083e829d5514c = makeweapon("super_default_mp");
    namespace_85d036cb78063c4a::trysuperusebegin(var_641083e829d5514c);
    while (self getcurrentprimaryweapon().basename != "ks_remote_drone_mp") {
        waitframe();
    }
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e08
// Size: 0x1d
function waitandsuicide(delaytime, player) {
    wait(delaytime);
    player suicide();
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e2c
// Size: 0x68
function onprematchstarted2() {
    level notify("onPrematchFadeDoneClear");
    level thread onprematchfadedone2();
    c130pathstruct = undefined;
    if (!istrue(level.br_infils_disabled)) {
        c130pathstruct = namespace_ad389306d44fc6b4::createtestc130path();
    }
    waitframe();
    level.br_c130spawndone = 0;
    level.br_latejoininfilready = 0;
    namespace_973962356ce55fee::beginbrc130playeraniminfilsequence(c130pathstruct, "player");
    level thread namespace_ad389306d44fc6b4::waittoplayinfildialog();
    level notify("infils_ready");
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e9b
// Size: 0x18a
function onprematchfadedone2() {
    var_36648016ce75e753 = 1.4;
    level endon("onPrematchFadeDoneClear");
    if (!isdefined(level.spectatetestonprematchfadedone)) {
        level.spectatetestonprematchfadedone = 1;
        return;
    }
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    level thread namespace_d20f8ef223912e12::resetalldoors(var_36648016ce75e753 * 1.5);
    level thread namespace_ede58c1e66c2c280::calloutmarkerping_removeallcalloutsforallplayers(1);
    level thread namespace_15d3019056d1bcea::brvehicleonprematchstarted();
    level thread namespace_15111e421d79d07d::onprematchdone();
    namespace_d20f8ef223912e12::cleanupmolotovs();
    namespace_15d3019056d1bcea::emptyallvehicles();
    foreach (player in level.players) {
        player namespace_d20f8ef223912e12::setplayerprematchallows();
        player thread namespace_cb965d2f71fefddc::resetplayerinventory();
        if (istrue(player.hasspawned)) {
            if (istrue(player.usingascender)) {
                player namespace_c851aa543ccfe72f::ascenderinstantstop();
            }
            player thread namespace_3bbb5a98b932c46f::deleteplacedequipment();
        }
    }
    foreach (player in level.players) {
        if (isdefined(player.burninginfo)) {
            player namespace_df478cc572a311d3::molotov_clear_burning();
        }
        player namespace_484d135e1e3717ed::javelin_forceclear();
    }
    level notify("prematch_cleanup");
    if (!istrue(level.br_circle_disabled)) {
        level thread namespace_c5622898120e827f::runcircles(1);
    }
}

// Namespace namespace_3db0584c4c3b350b/namespace_ed19ace3eeb2e4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x202c
// Size: 0x3359
function function_77a10f0eec39cb4f(args, host, var_92b132654e85cbc4, var_5d192b4c08040010) {
    if (argshave(args, "killcam1") || argshave(args, "killchain") || argshave(args, "disconnect1") || argshave(args, "disconnect2") || argshave(args, "disconnect3")) {
        killplayer(host, var_5d192b4c08040010[0]);
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
            wait(0.5);
        } else {
            namespace_a9c534dc7832aba4::waittillspectating(host);
            wait(3);
            if (argshave(args, "disconnect1")) {
                host iprintlnbold("Waiting");
                wait(10);
            }
        }
    }
    if (argshave(args, "disconnect1") || argshave(args, "disconnect2") || argshave(args, "disconnect3")) {
        playertospectate = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        function_645de575b455626c(playertospectate);
    }
    if (argshave(args, "killchain")) {
        playertospectate = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        while (!isdefined(playertospectate)) {
            waitframe();
            playertospectate = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        }
        killplayer(playertospectate, var_5d192b4c08040010[0]);
        namespace_a9c534dc7832aba4::waittillspectating(host);
        wait(3);
    }
    if (argshave(args, "killchain")) {
        playertospectate = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        while (!isdefined(playertospectate)) {
            waitframe();
            playertospectate = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        }
        killplayer(playertospectate, var_5d192b4c08040010[0]);
        namespace_a9c534dc7832aba4::waittillspectating(host);
        wait(3);
    }
    if (argshave(args, "killchain")) {
        playertospectate = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        while (!isdefined(playertospectate)) {
            waitframe();
            playertospectate = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        }
        killplayer(playertospectate, var_5d192b4c08040010[1]);
        namespace_a9c534dc7832aba4::waittillspectating(host);
        wait(3);
    }
    if (argshave(args, "killchain")) {
        playertospectate = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        while (!isdefined(playertospectate)) {
            waitframe();
            playertospectate = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        }
        killplayer(playertospectate, var_5d192b4c08040010[1]);
        namespace_a9c534dc7832aba4::waittillspectating(host);
        wait(3);
    }
    if (argshave(args, "killchain")) {
        playertospectate = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        while (!isdefined(playertospectate)) {
            waitframe();
            playertospectate = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        }
        killplayer(playertospectate, var_5d192b4c08040010[1]);
        namespace_a9c534dc7832aba4::waittillspectating(host);
        wait(3);
    }
    if (argshave(args, "gulag1")) {
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                player function_df49f9975e17b225(1);
                killplayer(player, var_5d192b4c08040010[0]);
            }
        }
        wait(10);
        killplayer(host, var_5d192b4c08040010[0]);
    }
    if (argshave(args, "gulag2") || argshave(args, "gulag3")) {
        killplayer(host, var_5d192b4c08040010[0]);
        host waittill("killcam_ended");
        wait(2);
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                player function_df49f9975e17b225(1);
                killplayer(player, var_5d192b4c08040010[0]);
            }
        }
        while (!isdefined(host getspectatingplayer())) {
            waitframe();
        }
        friendly = host getspectatingplayer();
        friendly function_df49f9975e17b225(1);
        wait(1);
        foreach (player in var_5d192b4c08040010[0]) {
            player function_df49f9975e17b225(1);
            killplayer(player, var_5d192b4c08040010[1]);
        }
        while (!istrue(friendly.gulagarena)) {
            waitframe();
        }
        wait(5);
        if (argshave(args, "gulag2")) {
            setspawnpoint = spawnstruct();
            setspawnpoint.playerspawnpos = (26474, -16709, -162);
            setspawnpoint.playerspawnangles = (85, 135, 0);
            friendly.setspawnpoint = setspawnpoint;
            foreach (player in var_5d192b4c08040010[0]) {
                if (istrue(player.gulagarena)) {
                    player function_df49f9975e17b225(1);
                    killplayer(player, var_5d192b4c08040010[1]);
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
            killplayer(friendly, var_5d192b4c08040010[1]);
        }
    }
    if (argshave(args, "gulag4")) {
        host function_df49f9975e17b225(1);
        enemy = killplayer(host, var_5d192b4c08040010[0]);
        enemy function_df49f9975e17b225(1);
        killplayer(enemy, var_92b132654e85cbc4);
    }
    if (argshave(args, "gulaggulag")) {
        first = getdvarint(@"hash_ad0ddaf795b2ef1a", 0);
        second = getdvarint(@"hash_ad0dd9f795b2ece7", 5);
        setdvar(@"hash_e5f703a38f6e8043", 9999);
        setdvar(@"hash_8bdee07fa09e810a", first);
        host function_df49f9975e17b225(1);
        enemy = killplayer(host, var_5d192b4c08040010[0]);
        setdvar(@"hash_8bdee07fa09e810a", second);
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                player function_df49f9975e17b225(1);
                killplayer(player, var_5d192b4c08040010[0]);
            }
        }
        setdvar(@"hash_8bdee07fa09e810a", first);
        enemy function_df49f9975e17b225(1);
        killplayer(enemy, var_5d192b4c08040010[1]);
        while (!istrue(host.gulagarena) && !istrue(enemy.gulagarena)) {
            waitframe();
        }
        wait(5);
        killplayer(host, enemy);
        setdvar(@"hash_e5f703a38f6e8043", 90);
    }
    if (argshave(args, "killkill")) {
        enemy = var_5d192b4c08040010[0][0];
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                killplayer(player, enemy);
            }
        }
        killplayer(enemy, host);
        wait(10);
        killplayer(host, enemy);
    }
    if (argshave(args, "killcam2")) {
        enemy = killplayer(host, var_5d192b4c08040010[0]);
        wait(3);
        killplayer(host.nextplayertospectate, var_5d192b4c08040010[0]);
    }
    if (argshave(args, "gulag5") || argshave(args, "gulag6")) {
        var_71a8e3c80df475a0 = undefined;
        foreach (player in var_92b132654e85cbc4) {
            if (!isdefined(var_71a8e3c80df475a0) && player != host) {
                var_71a8e3c80df475a0 = player;
            } else {
                killplayer(player, var_5d192b4c08040010[0]);
                namespace_a9c534dc7832aba4::waittillspectating(player);
            }
        }
        var_71a8e3c80df475a0 function_df49f9975e17b225(1);
        if (argshave(args, "gulag6")) {
            setdvar(@"hash_e5f703a38f6e8043", 9999);
            first = getdvarint(@"hash_ad0ddaf795b2ef1a", 5);
            setdvar(@"hash_8bdee07fa09e810a", first);
            var_71a8e3c80df475a0.longgulagstream = 1;
        }
        killplayer(var_71a8e3c80df475a0, var_5d192b4c08040010[0]);
    }
    if (argshave(args, "gulag7")) {
        killplayer(host, var_5d192b4c08040010[0]);
        host waittill("killcam_ended");
        wait(2);
        var_435b226327d6361a = undefined;
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                player function_df49f9975e17b225(1);
                var_435b226327d6361a = player;
                var_435b226327d6361a namespace_47fd1e79a44628cd::initplayerjail();
                break;
            }
        }
        while (!isdefined(host getspectatingplayer())) {
            waitframe();
        }
        wait(1);
        var_9af272f7c0618531 = undefined;
        foreach (player in var_5d192b4c08040010[0]) {
            player function_df49f9975e17b225(1);
            var_9af272f7c0618531 = player;
            killplayer(player, var_5d192b4c08040010[1]);
            break;
        }
        while (!istrue(var_435b226327d6361a.gulagarena) && !istrue(var_9af272f7c0618531.gulagarena)) {
            waitframe();
        }
        wait(5);
        setdvar(@"hash_e43719f8cb449c07", 1);
        killplayer(var_9af272f7c0618531, var_435b226327d6361a);
        while (host getspectatingplayer() != var_435b226327d6361a) {
            /#
                println("br_circle_set");
            #/
            wait(1);
        }
        wait(5);
        setdvar(@"hash_e43719f8cb449c07", 0);
    }
    if (argshave(args, "gulag8")) {
        level.gulag.timelimit = 3;
        setdvar(@"hash_1ff83f4f24656c5b", 3);
        setdvar(@"hash_e5f703a38f6e8043", -1);
        killplayer(host, var_5d192b4c08040010[0]);
        host waittill("killcam_ended");
        wait(2);
        var_435b226327d6361a = undefined;
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                player function_df49f9975e17b225(1);
                var_435b226327d6361a = player;
                var_435b226327d6361a namespace_47fd1e79a44628cd::initplayerjail();
                break;
            }
        }
        while (!isdefined(host getspectatingplayer())) {
            waitframe();
        }
        while (host getspectatingplayer() != var_435b226327d6361a) {
            iprintlnbold("Switch to spectating gulag player");
            waitframe();
        }
        wait(1);
        var_9af272f7c0618531 = undefined;
        foreach (player in var_5d192b4c08040010[0]) {
            player function_df49f9975e17b225(1);
            var_9af272f7c0618531 = player;
            killplayer(player, var_5d192b4c08040010[1]);
            break;
        }
    }
    if (argshave(args, "gulag9")) {
        host function_df49f9975e17b225(1);
        enemy = killplayer(host, var_5d192b4c08040010[0]);
        enemy function_df49f9975e17b225(1);
        killplayer(enemy, var_92b132654e85cbc4);
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                killplayer(player, var_5d192b4c08040010[0]);
            }
        }
        foreach (player in var_5d192b4c08040010[0]) {
            if (player != enemy) {
                killplayer(player, var_5d192b4c08040010[1]);
            }
        }
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait(5);
        setdvar(@"hash_e43719f8cb449c07", 1);
        setdvar(@"hash_2c879521333c4987", 3);
        killplayer(host, enemy);
        wait(9);
        setdvar(@"hash_e43719f8cb449c07", 0);
        setdvar(@"hash_2c879521333c4987", 0);
    }
    if (argshave(args, "gulag10")) {
        var_57b48ef0392ddd42 = var_5d192b4c08040010[0][0];
        var_57b48ef0392ddd42 function_df49f9975e17b225(1);
        killplayer(var_57b48ef0392ddd42, var_5d192b4c08040010[1]);
        var_57b48df0392ddb0f = var_5d192b4c08040010[1][0];
        var_57b48df0392ddb0f function_df49f9975e17b225(1);
        killplayer(var_57b48df0392ddb0f, var_5d192b4c08040010[0]);
        wait(1);
        var_57b896f03931e4b1 = host;
        var_57b896f03931e4b1 function_df49f9975e17b225(1);
        killplayer(var_57b896f03931e4b1, var_5d192b4c08040010[0]);
        var_57b893f03931de18 = var_5d192b4c08040010[0][1];
        var_57b893f03931de18 function_df49f9975e17b225(1);
        killplayer(var_57b893f03931de18, var_5d192b4c08040010[1]);
        while (!istrue(var_57b48ef0392ddd42.gulagarena) || !istrue(var_57b48df0392ddb0f.gulagarena) || !istrue(var_57b896f03931e4b1.jailed) || !istrue(var_57b893f03931de18.jailed)) {
            waitframe();
        }
        setdvar(@"hash_98b297a8680cbdc2", 1);
        var_52a4b4a1649783ed = var_5d192b4c08040010[1][1];
        var_52a4b4a1649783ed function_df49f9975e17b225(1);
        killplayer(var_52a4b4a1649783ed, var_5d192b4c08040010[0]);
        wait(1);
        while (istrue(var_52a4b4a1649783ed.gulagloading)) {
            waitframe();
        }
        namespace_47fd1e79a44628cd::shutdowngulag("circle_index", 0);
        wait(1);
        function_645de575b455626c(var_52a4b4a1649783ed);
        wait(3);
        setdvar(@"hash_98b297a8680cbdc2", 0);
    }
    if (argshave(args, "gulag11")) {
        host function_df49f9975e17b225(1);
        putinlaststand(host, var_5d192b4c08040010[1]);
        wait(1);
        namespace_47fd1e79a44628cd::shutdowngulag("circle_index", 0);
        wait(1);
        host namespace_10260b963310d30e::finishreviveplayer("self_revive_success", host);
        wait(5);
        killplayer(host, var_5d192b4c08040010[0]);
    }
    if (argshave(args, "twooneframe")) {
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                killplayer(player, var_5d192b4c08040010[0]);
                break;
            }
        }
        wait(5);
        foreach (player in var_92b132654e85cbc4) {
            if (isalive(player)) {
                killplayerinstant(player, var_5d192b4c08040010[0]);
            }
        }
    }
    if (argshave(args, "suicide")) {
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                killplayer(player, var_5d192b4c08040010[0]);
            }
        }
        wait(5);
        if (host namespace_82dcd1d5ae30ff7::_hasperk("specialty_pistoldeath")) {
            host namespace_82dcd1d5ae30ff7::removeperk("specialty_pistoldeath");
        }
        host suicide();
    }
    if (argshave(args, "team")) {
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                killplayerinstant(player, var_5d192b4c08040010[0]);
            }
        }
    }
    if (argshave(args, "moving")) {
        killplayerinstant(host, var_5d192b4c08040010[0]);
        while (!isdefined(host.playertospectate)) {
            waitframe();
        }
        player = host.playertospectate;
        dir = anglestoforward(player.angles);
        amount = getdvarint(@"hash_347466495c6777db", 5);
        var_13c5603d4beea2fc = host getspectatingplayer();
        while (!isdefined(var_13c5603d4beea2fc)) {
            var_e4a58e54d20994f2 = player.origin + dir * amount;
            player setorigin(var_e4a58e54d20994f2);
            waitframe();
            var_13c5603d4beea2fc = host getspectatingplayer();
        }
    }
    if (argshave(args, "heli1") || argshave(args, "heli2")) {
        friendly = undefined;
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                if (!isdefined(friendly)) {
                    friendly = player;
                } else {
                    killplayerinstant(player, var_5d192b4c08040010[0]);
                }
            }
        }
        wait(1);
        killplayerinstant(host, var_5d192b4c08040010[0]);
        namespace_a9c534dc7832aba4::waittillspectating(host);
        wait(1);
        keys = getarraykeys(level.vehicle.instances["little_bird"]);
        heli = level.vehicle.instances["little_bird"][keys[0]];
        instance = heli getlinkedscriptableinstance();
        friendly setorigin(heli.origin);
        wait(1);
        namespace_141c4634b6ea7b27::vehicle_interact_scriptableused(instance, "single", "vehicle_use", friendly, 0);
        if (argshave(args, "heli2")) {
            wait(3);
            function_645de575b455626c(friendly);
        }
    }
    if (argshave(args, "water")) {
        host setorigin((28252, -32627, -415));
    }
    if (argshave(args, "disconnectswitch1")) {
        killplayerinstant(host, var_5d192b4c08040010[0]);
        namespace_a9c534dc7832aba4::waittillspectating(host);
        friendly = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        while (!host buttonpressed("BUTTON_RSHLDR")) {
            waitframe();
        }
        var_4995442795b82170 = undefined;
        foreach (player in var_92b132654e85cbc4) {
            if (player != host && player != friendly) {
                var_4995442795b82170 = player;
                break;
            }
        }
        wait(0.5);
        function_645de575b455626c(var_4995442795b82170);
    }
    if (argshave(args, "disconnectswitch2")) {
        killplayerinstant(host, var_5d192b4c08040010[0]);
        namespace_a9c534dc7832aba4::waittillspectating(host);
        friendly = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        while (!host buttonpressed("BUTTON_RSHLDR")) {
            waitframe();
        }
        wait(0.5);
        function_645de575b455626c(friendly);
    }
    if (argshave(args, "endspectate")) {
        level.br_infils_disabled = 1;
        /#
            setdevdvar(@"hash_7a1447160ba151fe", 1);
        #/
        setdvar(@"hash_faf1db5754891b2d", 2);
        level.gulag.maxuses = 0;
        wait(1);
        killplayerinstant(host, var_5d192b4c08040010[0]);
        namespace_a9c534dc7832aba4::waittillspectating(host);
        wait(2);
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                killplayerinstant(player, var_5d192b4c08040010[0]);
            }
        }
        namespace_a9c534dc7832aba4::waittillspectating(host);
        wait(2);
        enemy = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        killplayerinstant(enemy, var_5d192b4c08040010[1]);
        namespace_a9c534dc7832aba4::waittillspectating(host);
        wait(2);
        enemy = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        killplayerinstant(enemy, var_5d192b4c08040010[1]);
        namespace_a9c534dc7832aba4::waittillspectating(host);
        wait(2);
        enemy = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        killplayerinstant(enemy, var_5d192b4c08040010[1]);
        namespace_a9c534dc7832aba4::waittillspectating(host);
        wait(2);
    }
    if (argshave(args, "teamwipe1")) {
        setdvar(@"hash_2c879521333c4987", 5);
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                killplayerinstant(player, var_5d192b4c08040010[0]);
            }
        }
        wait(getdvarfloat(@"hash_b436ad5a39cb1f59", 5));
        enemy = killplayerinstant(host, var_5d192b4c08040010[0]);
        wait(getdvarfloat(@"hash_1f5ea86d19b61851", 13));
        killplayerinstant(enemy, var_5d192b4c08040010[1]);
    }
    if (argshave(args, "deathswitch1")) {
        setdvar(@"hash_2c879521333c4987", 5);
        killplayerinstant(host, var_5d192b4c08040010[0]);
        namespace_a9c534dc7832aba4::waittillspectating(host);
        friendly = host namespace_a9c534dc7832aba4::playergetspectatingplayer();
        while (!host buttonpressed("BUTTON_RSHLDR")) {
            waitframe();
        }
        var_4995442795b82170 = undefined;
        foreach (player in var_92b132654e85cbc4) {
            if (player != host && player != friendly) {
                var_4995442795b82170 = player;
                break;
            }
        }
        wait(0.5);
        killplayerinstant(var_4995442795b82170, var_5d192b4c08040010[0]);
    }
    if (argshave(args, "squadwidget")) {
        setdvar(@"hash_e5f703a38f6e8043", 9999);
        setdvar(@"hash_2c879521333c4987", 3);
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                function_645de575b455626c(player);
            }
        }
        wait(5);
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[0][1];
        var_90465ae4437c9aba function_df49f9975e17b225(1);
        killplayerinstant(var_90465ae4437c9aba, host);
        wait(getdvarfloat(@"hash_32c6816aee4fdb27", 4));
        killplayerinstant(host, enemy2);
    }
    if (argshave(args, "killall")) {
        level.overrideingraceperiod = 1;
        lastplayer = var_92b132654e85cbc4[1];
        foreach (player in var_92b132654e85cbc4) {
            if (player != lastplayer) {
                killplayerinstant(player, var_5d192b4c08040010[0]);
            }
        }
        foreach (player in var_5d192b4c08040010[0]) {
            killplayerinstant(player, var_5d192b4c08040010[1]);
        }
        foreach (player in var_5d192b4c08040010[1]) {
            killplayerinstant(player, var_5d192b4c08040010[0]);
        }
        wait(10);
        function_645de575b455626c(lastplayer);
        level.overrideingraceperiod = undefined;
    }
    if (argshave(args, "moneykill")) {
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                player namespace_c6ccccd95254983f::playersetplundercount(45);
                player function_df49f9975e17b225(1);
                killplayerinstant(player, var_5d192b4c08040010[0]);
            }
        }
        wait(5);
        killplayerinstant(host, var_5d192b4c08040010[0]);
    }
    if (argshave(args, "buyback1")) {
        scriptcircleat(host.origin, 500);
        setdvar(@"hash_e5f703a38f6e8043", -1);
        var_52a4b2a164977f87 = host;
        var_52a4b2a164977f87 function_df49f9975e17b225(1);
        killplayer(var_52a4b2a164977f87, var_5d192b4c08040010[1]);
        var_90460ae4437beaca = var_5d192b4c08040010[1][0];
        var_90460ae4437beaca function_df49f9975e17b225(1);
        killplayer(var_90460ae4437beaca, var_5d192b4c08040010[1]);
        while (!istrue(var_52a4b2a164977f87.gulagarena)) {
            waitframe();
        }
        wait(5);
        killplayerinstant(var_52a4b2a164977f87, []);
        while (!isdefined(var_52a4b2a164977f87 getspectatingplayer())) {
            waitframe();
        }
        var_52a4b3a1649781ba = var_52a4b2a164977f87 getspectatingplayer();
        var_52a4b3a1649781ba function_df49f9975e17b225(1);
        var_52a4b4a1649783ed = undefined;
        foreach (player in var_92b132654e85cbc4) {
            if (player != var_52a4b2a164977f87 && player != var_52a4b3a1649781ba) {
                var_52a4b4a1649783ed = player;
                break;
            }
        }
        var_52a4b4a1649783ed namespace_c6ccccd95254983f::playersetplundercount(45);
        killplayer(var_52a4b3a1649781ba, var_5d192b4c08040010[1]);
        while (!istrue(var_52a4b3a1649781ba.jailed)) {
            waitframe();
        }
        while (!isdefined(var_52a4b2a164977f87 getspectatingplayer()) || var_52a4b2a164977f87 getspectatingplayer() != var_52a4b3a1649781ba) {
            waitframe();
        }
        var_904609e4437be897 = var_5d192b4c08040010[1][1];
        var_904609e4437be897 function_df49f9975e17b225(1);
        killplayer(var_904609e4437be897, var_5d192b4c08040010[1]);
        while (!istrue(var_52a4b3a1649781ba.gulagarena)) {
            waitframe();
        }
        wait(5);
        setdvar(@"hash_2c879521333c4987", 3);
        killplayerinstant(var_52a4b3a1649781ba, []);
        var_52a4b4a1649783ed namespace_cb965d2f71fefddc::addrespawntoken(1);
        var_52a4b2a164977f87 thread namespace_47fd1e79a44628cd::playergulagautowin(var_52a4b4a1649783ed, 0);
    }
    if (argshave(args, "teamwipe2")) {
        killplayerinstant(host, var_5d192b4c08040010[0]);
        host waittill("killcam_ended");
        wait(2);
        count = 0;
        foreach (player in var_92b132654e85cbc4) {
            if (player != host) {
                if (count > 0) {
                    player namespace_c6ccccd95254983f::playersetplundercount(45);
                    player function_df49f9975e17b225(1);
                }
                killplayerinstant(player, var_5d192b4c08040010[1]);
                count++;
                wait(5);
            }
        }
    }
    if (argshave(args, "gulag11")) {
        host function_df49f9975e17b225(1);
        putinlaststand(host, var_5d192b4c08040010[1]);
        wait(1);
        namespace_47fd1e79a44628cd::shutdowngulag("circle_index", 0);
        wait(1);
        host namespace_10260b963310d30e::finishreviveplayer("self_revive_success", host);
        wait(5);
        killplayer(host, var_5d192b4c08040010[0]);
    }
    if (argshave(args, "infilDeath")) {
        thread waitandsuicide(getdvarint(@"hash_80d1406b579aaa79", 1), var_92b132654e85cbc4[1]);
        onprematchstarted2();
        level waittill("br_c130_left_bounds");
        wait(2);
        var_92b132654e85cbc4[2] function_df49f9975e17b225(0);
        killplayerinstant(var_92b132654e85cbc4[2], var_5d192b4c08040010[0]);
        wait(5);
        host function_df49f9975e17b225(0);
        killplayerinstant(host, var_5d192b4c08040010[0]);
    }
    if (argshave(args, "reconGulag1")) {
        setdvar(@"hash_faf1db5754891b2d", 9);
        wait(5);
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[1][0];
        function_645de575b455626c(var_5d192b4c08040010[0][2]);
        function_645de575b455626c(var_5d192b4c08040010[0][1]);
        function_645de575b455626c(var_5d192b4c08040010[1][2]);
        function_645de575b455626c(var_5d192b4c08040010[1][1]);
        function_645de575b455626c(var_92b132654e85cbc4[2]);
        function_645de575b455626c(var_92b132654e85cbc4[1]);
        wait(1);
        host playerstartrecondronewait();
        var_90465ae4437c9aba function_df49f9975e17b225(1);
        killplayerinstant(var_90465ae4437c9aba, enemy2);
        wait(7);
        host function_df49f9975e17b225(1);
        if (!host namespace_82dcd1d5ae30ff7::_hasperk("specialty_pistoldeath")) {
            host namespace_82dcd1d5ae30ff7::giveperk("specialty_pistoldeath");
        }
        killplayerinstant(host, enemy2, 1);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait(5);
        killplayerinstant(var_90465ae4437c9aba, host);
    }
    if (argshave(args, "reconGulag2")) {
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[0][1];
        var_4995472795b82809 = var_92b132654e85cbc4[1];
        var_4995442795b82170 = var_92b132654e85cbc4[2];
        if (var_4995472795b82809 == host) {
            var_4995472795b82809 = var_92b132654e85cbc4[0];
        } else if (var_4995442795b82170 == host) {
            var_4995442795b82170 = var_92b132654e85cbc4[0];
        }
        function_645de575b455626c(var_5d192b4c08040010[0][2]);
        function_645de575b455626c(var_5d192b4c08040010[1][2]);
        function_645de575b455626c(var_5d192b4c08040010[1][1]);
        function_645de575b455626c(var_5d192b4c08040010[1][0]);
        killplayerinstant(var_4995442795b82170, var_90465ae4437c9aba);
        wait(1);
        var_4995472795b82809 playerstartrecondronewait();
        wait(2);
        killplayerinstant(host, var_90465ae4437c9aba);
        host waittill("killcam_ended");
        wait(3);
        enemy2 function_df49f9975e17b225(1);
        killplayerinstant(enemy2, var_4995472795b82809);
        var_4995472795b82809 function_df49f9975e17b225(1);
        if (!var_4995472795b82809 namespace_82dcd1d5ae30ff7::_hasperk("specialty_pistoldeath")) {
            var_4995472795b82809 namespace_82dcd1d5ae30ff7::giveperk("specialty_pistoldeath");
        }
        killplayerinstant(var_4995472795b82809, var_90465ae4437c9aba, 1);
        while (!istrue(var_4995472795b82809.gulagarena)) {
            waitframe();
        }
        wait(5);
        killplayerinstant(var_4995472795b82809, enemy2);
    }
    if (argshave(args, "endGameTwoDie")) {
        setdvar(@"hash_faf1db5754891b2d", 8);
        wait(5);
        namespace_47fd1e79a44628cd::shutdowngulag("circle_index", 0);
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        var_4995472795b82809 = var_92b132654e85cbc4[1];
        var_4995442795b82170 = var_92b132654e85cbc4[2];
        if (var_4995472795b82809 == host) {
            var_4995472795b82809 = var_92b132654e85cbc4[0];
        } else if (var_4995442795b82170 == host) {
            var_4995442795b82170 = var_92b132654e85cbc4[0];
        }
        killplayerinstant(var_5d192b4c08040010[0][2], host);
        killplayerinstant(var_5d192b4c08040010[0][1], host);
        killplayerinstant(var_5d192b4c08040010[1][2], host);
        killplayerinstant(var_5d192b4c08040010[1][1], host);
        killplayerinstant(var_5d192b4c08040010[1][0], host);
        killplayerinstant(var_4995472795b82809, var_90465ae4437c9aba);
        killplayerinstant(var_4995442795b82170, var_90465ae4437c9aba);
        wait(3);
        host namespace_68f1873625691c6::jugg_makejuggernaut(level.juggksglobals.config);
        wait(3);
        var_90465ae4437c9aba dodamage(999, var_90465ae4437c9aba.origin, var_90465ae4437c9aba, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
        while (isalive(host)) {
            host dodamage(999, host.origin, host, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
            waitframe();
        }
    }
    if (argshave(args, "infiniteLoot")) {
        setomnvar("scriptable_loot_hide", 0);
        startorigin = host.origin;
        startangles = host.angles;
        var_cde7f7f943b0f728 = 0;
        var_2e3d43d19bbe802b = 0;
        var_338deefd32d7ae30 = 0;
        while (1) {
            var_cb4fad49263e20c4 = getitemdropinfo(startorigin + (var_cde7f7f943b0f728, var_2e3d43d19bbe802b, 0), startangles);
            spawnpickup("brloot_self_revive", var_cb4fad49263e20c4);
            var_338deefd32d7ae30++;
            var_cde7f7f943b0f728 = var_cde7f7f943b0f728 + 10;
            if (var_cde7f7f943b0f728 > 5000) {
                var_cde7f7f943b0f728 = 0;
                var_2e3d43d19bbe802b = var_2e3d43d19bbe802b + 10;
                if (var_2e3d43d19bbe802b > 100) {
                    var_2e3d43d19bbe802b = 0;
                }
            }
            if (var_338deefd32d7ae30 > 8) {
                waitframe();
                var_338deefd32d7ae30 = 0;
            }
        }
    }
    if (argshave(args, "tempTeamTest")) {
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        var_90465ae4437c9aba hudoutlineenableforclient(host, "defaulthudoutline");
        host.var_b5091efefe8e436b = "axis";
        var_90465ae4437c9aba.var_b5091efefe8e436b = "axis";
    }
    if (argshave(args, "gulag22a")) {
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[0][1];
        var_904658e4437c9654 = var_5d192b4c08040010[1][0];
        host function_df49f9975e17b225(1);
        var_90465ae4437c9aba function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        var_904658e4437c9654 function_df49f9975e17b225(1);
        killplayer(host, var_5d192b4c08040010[0]);
        killplayer(var_90465ae4437c9aba, var_5d192b4c08040010[1]);
        killplayer(enemy2, var_5d192b4c08040010[1]);
        killplayer(var_904658e4437c9654, var_5d192b4c08040010[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait(10);
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        var_9af272f7c0618531 = var_90465ae4437c9aba;
        if (teammate == var_90465ae4437c9aba) {
            var_9af272f7c0618531 = enemy2;
        }
        killplayer(host, var_9af272f7c0618531);
        wait(getdvarint(@"hash_f4becbcb52fb0332", 2));
        function_645de575b455626c(teammate);
    }
    if (argshave(args, "gulag22b")) {
        setdvar(@"hash_8bdee07fa09e810a", 0);
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[0][1];
        var_904658e4437c9654 = var_5d192b4c08040010[1][0];
        host function_df49f9975e17b225(1);
        var_90465ae4437c9aba function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        var_70189b6a231df8d6 = var_92b132654e85cbc4[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = var_92b132654e85cbc4[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        var_b03f2c4ab975486e = var_92b132654e85cbc4[1];
        if (var_b03f2c4ab975486e == host || var_b03f2c4ab975486e == var_70189b6a231df8d6) {
            var_b03f2c4ab975486e = var_92b132654e85cbc4[2];
        }
        var_b03f2c4ab975486e function_df49f9975e17b225(1);
        killplayer(host, var_5d192b4c08040010[0]);
        killplayer(var_70189b6a231df8d6, var_5d192b4c08040010[0]);
        killplayer(var_90465ae4437c9aba, var_5d192b4c08040010[1]);
        killplayer(enemy2, var_5d192b4c08040010[1]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait(12);
        killplayer(var_b03f2c4ab975486e, var_904658e4437c9654);
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        var_9af272f7c0618531 = var_90465ae4437c9aba;
        if (teammate == var_90465ae4437c9aba) {
            var_9af272f7c0618531 = enemy2;
        }
        killplayer(host, var_9af272f7c0618531);
        while (!isdefined(host getspectatingplayer()) || host getspectatingplayer() != teammate) {
            waitframe();
        }
        wait(getdvarint(@"hash_c12d58979b7c7ca8", 3));
        /#
            assert(teammate == var_70189b6a231df8d6);
        #/
        killplayer(teammate, var_90465ae4437c9aba);
        while (!isdefined(host getspectatingplayer()) || host getspectatingplayer() != var_b03f2c4ab975486e) {
            waitframe();
        }
        var_df2fbb13c226be75 = "timeout";
        if (namespace_eb17b46cdcb98eea::function_1980065ce4dc067b()) {
            var_df2fbb13c226be75 = "br_twotwo_gulag_win_jail_timeout";
        }
        thread namespace_47fd1e79a44628cd::gulagvictory(var_b03f2c4ab975486e.arena, var_b03f2c4ab975486e, 1, 0, var_df2fbb13c226be75);
    }
    if (argshave(args, "gulag22c")) {
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[0][1];
        var_904658e4437c9654 = var_5d192b4c08040010[1][0];
        host function_df49f9975e17b225(1);
        var_90465ae4437c9aba function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        var_904658e4437c9654 function_df49f9975e17b225(1);
        killplayer(host, var_5d192b4c08040010[0]);
        killplayer(var_90465ae4437c9aba, var_5d192b4c08040010[1]);
        killplayer(enemy2, var_5d192b4c08040010[1]);
        killplayer(var_904658e4437c9654, var_5d192b4c08040010[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait(10);
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        var_9af272f7c0618531 = var_90465ae4437c9aba;
        if (teammate == var_90465ae4437c9aba) {
            var_9af272f7c0618531 = enemy2;
        }
        killplayer(host, var_9af272f7c0618531);
        killplayer(teammate, var_9af272f7c0618531);
        setdvar(@"hash_9e78730ec3baa38c", 0.1);
        eventdata = level.br_pe_data[3];
        eventdata.active = 1;
        namespace_d76af9f804655767::function_145e3d3099bb97c4(eventdata);
    }
    if (argshave(args, "gulag22d")) {
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[0][1];
        var_70189b6a231df8d6 = var_92b132654e85cbc4[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = var_92b132654e85cbc4[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        var_90465ae4437c9aba function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        killplayer(var_90465ae4437c9aba, var_5d192b4c08040010[1]);
        killplayer(enemy2, var_5d192b4c08040010[1]);
        killplayer(host, var_5d192b4c08040010[0]);
        killplayer(var_70189b6a231df8d6, var_5d192b4c08040010[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait(10);
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        var_24b7d6dc16777f00 = var_90465ae4437c9aba;
        if (teammate == var_90465ae4437c9aba) {
            var_24b7d6dc16777f00 = enemy2;
        }
        killplayer(host, var_24b7d6dc16777f00);
        killplayer(teammate, var_24b7d6dc16777f00);
        wait(10);
        setdvar(@"hash_9e78730ec3baa38c", 0.1);
        eventdata = level.br_pe_data[3];
        eventdata.active = 1;
        namespace_d76af9f804655767::function_145e3d3099bb97c4(eventdata);
    }
    if (argshave(args, "gulag22e")) {
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[0][1];
        var_70189b6a231df8d6 = var_92b132654e85cbc4[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = var_92b132654e85cbc4[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        var_4995442795b82170 = var_92b132654e85cbc4[2];
        if (var_4995442795b82170 == host) {
            var_4995442795b82170 = var_92b132654e85cbc4[1];
        }
        var_4995442795b82170 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        var_90465ae4437c9aba function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        killplayer(var_90465ae4437c9aba, var_5d192b4c08040010[1]);
        killplayer(enemy2, var_5d192b4c08040010[1]);
        killplayer(host, var_5d192b4c08040010[0]);
        killplayer(var_70189b6a231df8d6, var_5d192b4c08040010[0]);
        wait(1);
        killplayer(var_4995442795b82170, var_5d192b4c08040010[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait(10);
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        killplayer(var_90465ae4437c9aba, host);
        killplayer(enemy2, host);
    }
    if (argshave(args, "gulag22f")) {
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[0][1];
        var_70189b6a231df8d6 = var_92b132654e85cbc4[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = var_92b132654e85cbc4[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        var_4995442795b82170 = var_92b132654e85cbc4[2];
        if (var_4995442795b82170 == host) {
            var_4995442795b82170 = var_92b132654e85cbc4[1];
        }
        var_4995442795b82170 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        var_90465ae4437c9aba function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        killplayer(var_90465ae4437c9aba, var_5d192b4c08040010[1]);
        killplayer(enemy2, var_5d192b4c08040010[1]);
        killplayer(host, var_5d192b4c08040010[0]);
        killplayer(var_70189b6a231df8d6, var_5d192b4c08040010[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait(5);
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        host iprintlnbold("END ARENA");
        host.arena notify("matchEnded");
        host.arena notify("fight_over_early");
        thread namespace_47fd1e79a44628cd::handleendarena(host.arena, undefined, 1, 1, "debug", var_4995442795b82170);
        wait(10);
        host iprintlnbold("Kill Players");
        killplayer(var_90465ae4437c9aba, host);
        killplayer(enemy2, host);
    }
    if (argshave(args, "gulag22g")) {
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[0][1];
        var_904658e4437c9654 = var_5d192b4c08040010[0][2];
        var_70189b6a231df8d6 = var_92b132654e85cbc4[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = var_92b132654e85cbc4[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        var_4995442795b82170 = var_92b132654e85cbc4[2];
        if (var_4995442795b82170 == host) {
            var_4995442795b82170 = var_92b132654e85cbc4[1];
        }
        var_4995442795b82170 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        var_90465ae4437c9aba function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        killplayer(var_90465ae4437c9aba, var_5d192b4c08040010[1]);
        killplayer(enemy2, var_5d192b4c08040010[1]);
        killplayer(host, var_5d192b4c08040010[0]);
        killplayer(var_70189b6a231df8d6, var_5d192b4c08040010[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait(getdvarint(@"hash_f4becbcb52fb0332", 12));
        if (getdvarint(@"hash_197c9f3caaa6312b", 0)) {
            killplayer(host, var_5d192b4c08040010[0]);
            killplayer(var_70189b6a231df8d6, var_5d192b4c08040010[0]);
            wait(getdvarfloat(@"hash_3a9d30277e079900", 0));
        } else if (getdvarint(@"hash_b3434b6b4b7df9fb", 0)) {
            killplayer(host, var_5d192b4c08040010[0]);
            wait(getdvarfloat(@"hash_3a9d30277e079900", 0));
        }
        arena = host.arena;
        if (getdvarint(@"hash_fb8d8ca747bf8b29", 0)) {
            namespace_b5b2280a66414fff::vip_respawnplayer(host, var_4995442795b82170, "debug");
            namespace_b5b2280a66414fff::vip_respawnplayer(var_70189b6a231df8d6, var_4995442795b82170, "debug");
        } else {
            namespace_b5b2280a66414fff::vip_respawnplayer(var_90465ae4437c9aba, var_904658e4437c9654, "debug");
            namespace_b5b2280a66414fff::vip_respawnplayer(var_90465ae4437c9aba, var_904658e4437c9654, "debug");
        }
    }
    if (argshave(args, "gulag22h")) {
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[0][1];
        var_904658e4437c9654 = var_5d192b4c08040010[0][2];
        var_70189b6a231df8d6 = var_92b132654e85cbc4[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = var_92b132654e85cbc4[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        var_4995442795b82170 = var_92b132654e85cbc4[2];
        if (var_4995442795b82170 == host) {
            var_4995442795b82170 = var_92b132654e85cbc4[1];
        }
        var_4995442795b82170 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        var_90465ae4437c9aba function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        killplayer(var_90465ae4437c9aba, var_5d192b4c08040010[1]);
        killplayer(enemy2, var_5d192b4c08040010[1]);
        killplayer(host, var_5d192b4c08040010[0]);
        killplayer(var_70189b6a231df8d6, var_5d192b4c08040010[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait(getdvarint(@"hash_f4becbcb52fb0332", 12));
        if (getdvarint(@"hash_197c9f3caaa6312b", 0)) {
            killplayer(host, var_5d192b4c08040010[0]);
            killplayer(var_70189b6a231df8d6, var_5d192b4c08040010[0]);
            wait(getdvarfloat(@"hash_3a9d30277e079900", 0));
        } else if (getdvarint(@"hash_b3434b6b4b7df9fb", 1)) {
            killplayer(host, var_5d192b4c08040010[0]);
            wait(getdvarfloat(@"hash_3a9d30277e079900", 1));
        }
        arena = host.arena;
        if (getdvarint(@"hash_fb8d8ca747bf8b29", 1)) {
            namespace_b5b2280a66414fff::vip_respawnplayer(host, var_4995442795b82170, "debug");
            namespace_b5b2280a66414fff::vip_respawnplayer(var_70189b6a231df8d6, var_4995442795b82170, "debug");
        } else {
            namespace_b5b2280a66414fff::vip_respawnplayer(var_90465ae4437c9aba, var_904658e4437c9654, "debug");
            namespace_b5b2280a66414fff::vip_respawnplayer(var_90465ae4437c9aba, var_904658e4437c9654, "debug");
        }
    }
    if (argshave(args, "gulag22i")) {
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[0][1];
        var_904658e4437c9654 = var_5d192b4c08040010[0][2];
        var_70189b6a231df8d6 = var_92b132654e85cbc4[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = var_92b132654e85cbc4[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        var_4995442795b82170 = var_92b132654e85cbc4[2];
        if (var_4995442795b82170 == host) {
            var_4995442795b82170 = var_92b132654e85cbc4[1];
        }
        var_4995442795b82170 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        var_90465ae4437c9aba function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        killplayer(var_90465ae4437c9aba, var_5d192b4c08040010[1]);
        killplayer(enemy2, var_5d192b4c08040010[1]);
        killplayer(host, var_5d192b4c08040010[0]);
        killplayer(var_70189b6a231df8d6, var_5d192b4c08040010[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait(getdvarint(@"hash_f4becbcb52fb0332", 5));
        function_645de575b455626c(var_70189b6a231df8d6);
        function_645de575b455626c(var_90465ae4437c9aba);
        function_645de575b455626c(enemy2);
    }
    if (argshave(args, "gulag22j")) {
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[0][1];
        var_904658e4437c9654 = var_5d192b4c08040010[0][2];
        var_90460ae4437beaca = var_5d192b4c08040010[1][0];
        var_904609e4437be897 = var_5d192b4c08040010[1][1];
        var_904608e4437be664 = var_5d192b4c08040010[1][2];
        var_70189b6a231df8d6 = var_92b132654e85cbc4[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = var_92b132654e85cbc4[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        var_4995442795b82170 = var_92b132654e85cbc4[2];
        if (var_4995442795b82170 == host) {
            var_4995442795b82170 = var_92b132654e85cbc4[1];
        }
        var_4995442795b82170 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        var_90465ae4437c9aba function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        var_904658e4437c9654 function_df49f9975e17b225(1);
        var_90460ae4437beaca function_df49f9975e17b225(1);
        var_904609e4437be897 function_df49f9975e17b225(1);
        var_904608e4437be664 function_df49f9975e17b225(1);
        killplayer(var_90465ae4437c9aba, host);
        killplayer(enemy2, host);
        killplayer(var_90460ae4437beaca, host);
        killplayer(var_904609e4437be897, host);
        while (!istrue(var_90465ae4437c9aba.gulagarena)) {
            waitframe();
        }
        wait(getdvarint(@"hash_f4becbcb52fb0332", 1));
        killplayer(host, var_90465ae4437c9aba);
        killplayer(var_70189b6a231df8d6, var_90465ae4437c9aba);
        killplayer(var_904658e4437c9654, host);
        killplayer(var_904608e4437be664, host);
        while (!istrue(host.jailed) || !istrue(var_70189b6a231df8d6.jailed) || !istrue(var_904658e4437c9654.jailed) || !istrue(var_904608e4437be664.jailed)) {
            waitframe();
        }
        namespace_47fd1e79a44628cd::shutdowngulag("debug", 0);
    }
    if (argshave(args, "gulag22k")) {
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[0][1];
        var_70189b6a231df8d6 = var_92b132654e85cbc4[0];
        if (var_70189b6a231df8d6 == host) {
            var_70189b6a231df8d6 = var_92b132654e85cbc4[1];
        }
        var_70189b6a231df8d6 function_df49f9975e17b225(1);
        var_4995442795b82170 = var_92b132654e85cbc4[2];
        if (var_4995442795b82170 == host) {
            var_4995442795b82170 = var_92b132654e85cbc4[1];
        }
        var_4995442795b82170 function_df49f9975e17b225(1);
        host function_df49f9975e17b225(1);
        var_90465ae4437c9aba function_df49f9975e17b225(1);
        enemy2 function_df49f9975e17b225(1);
        killplayer(var_90465ae4437c9aba, var_5d192b4c08040010[1]);
        killplayer(enemy2, var_5d192b4c08040010[1]);
        killplayer(host, var_5d192b4c08040010[0]);
        killplayer(var_70189b6a231df8d6, var_5d192b4c08040010[0]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        wait(12);
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        killplayer(var_70189b6a231df8d6, host);
        killplayer(enemy2, host);
    }
    if (argshave(args, "jailbreakRespawn")) {
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[0][1];
        var_4995472795b82809 = var_92b132654e85cbc4[0];
        if (var_4995472795b82809 == host) {
            var_4995472795b82809 = var_92b132654e85cbc4[1];
        }
        var_4995442795b82170 = var_92b132654e85cbc4[2];
        if (var_4995442795b82170 == host) {
            var_4995442795b82170 = var_92b132654e85cbc4[1];
        }
        var_4995442795b82170 function_df49f9975e17b225(1);
        killplayer(host, var_5d192b4c08040010[1]);
        killplayer(var_4995472795b82809, var_5d192b4c08040010[1]);
        killplayer(var_4995442795b82170, var_5d192b4c08040010[0]);
        wait(getdvarint(@"hash_3a9d33277e079f99", 10));
        setdvar(@"hash_9e78730ec3baa38c", 0.1);
        eventdata = level.br_pe_data[3];
        eventdata.active = 1;
        namespace_d76af9f804655767::function_145e3d3099bb97c4(eventdata);
    }
    if (argshave(args, "gulag22l")) {
        var_c012bf62499f5c7a = function_2ea11e29fb71e2ad(args, 4);
        var_5d192b4c08040010 = var_c012bf62499f5c7a[1];
        var_92b132654e85cbc4 = var_c012bf62499f5c7a[0];
        var_52a4b2a164977f87 = host;
        var_52a4b3a1649781ba = var_5d192b4c08040010[0][0];
        var_52a4b4a1649783ed = var_5d192b4c08040010[1][0];
        var_52a4ada164977488 = var_5d192b4c08040010[2][0];
        var_52a4aea1649776bb = var_5d192b4c08040010[2][1];
        var_4995472795b82809 = var_92b132654e85cbc4[0];
        if (var_4995472795b82809 == host) {
            var_4995472795b82809 = var_92b132654e85cbc4[1];
        }
        var_4995442795b82170 = var_92b132654e85cbc4[2];
        if (var_4995442795b82170 == host) {
            var_4995442795b82170 = var_92b132654e85cbc4[1];
        }
        var_52a4b2a164977f87 function_df49f9975e17b225(1);
        var_52a4b3a1649781ba function_df49f9975e17b225(1);
        var_52a4b4a1649783ed function_df49f9975e17b225(0);
        var_52a4ada164977488 function_df49f9975e17b225(1);
        var_52a4aea1649776bb function_df49f9975e17b225(1);
        killplayer(var_52a4b2a164977f87, var_5d192b4c08040010[1]);
        killplayer(var_52a4b3a1649781ba, var_5d192b4c08040010[1]);
        killplayer(var_52a4ada164977488, var_5d192b4c08040010[0]);
        killplayer(var_52a4aea1649776bb, var_5d192b4c08040010[0]);
        function_645de575b455626c(var_4995472795b82809);
        function_645de575b455626c(var_4995442795b82170);
        function_645de575b455626c(var_5d192b4c08040010[1][1]);
        function_645de575b455626c(var_5d192b4c08040010[1][2]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        /#
            assert(teammate == var_52a4b3a1649781ba);
        #/
        wait(10);
        arena = host.arena;
        killplayer(var_52a4b2a164977f87, var_52a4ada164977488);
        wait(3);
        killplayer(var_52a4b4a1649783ed, var_5d192b4c08040010[2][2]);
        while (!isdefined(arena.var_707537a8904aa962) || arena.var_707537a8904aa962.size == 0) {
            waitframe();
        }
        var_fb8418425dc67596 = arena.var_707537a8904aa962[0];
        wait(3);
        while (isalive(var_fb8418425dc67596)) {
            var_fb8418425dc67596 dodamage(var_fb8418425dc67596.health, var_52a4b3a1649781ba.origin, var_52a4b3a1649781ba, var_52a4b3a1649781ba, "MOD_RIFLE_BULLET", var_52a4b3a1649781ba getcurrentprimaryweapon());
        }
        while (!isalive(var_52a4b2a164977f87)) {
            waitframe();
        }
        wait(3);
        var_52a4b2a164977f87 function_df49f9975e17b225(0);
        killplayer(var_52a4b2a164977f87, var_52a4ada164977488);
    }
    if (argshave(args, "gulag22m")) {
        var_bfe236624969d2f2 = function_2ea11e29fb71e2ad(args, 4);
        var_5d192b4c08040010 = var_bfe236624969d2f2[1];
        var_92b132654e85cbc4 = var_bfe236624969d2f2[0];
        var_52a4b2a164977f87 = host;
        var_52a4b3a1649781ba = var_5d192b4c08040010[0][0];
        var_52a4b4a1649783ed = var_5d192b4c08040010[1][0];
        var_52a4ada164977488 = var_5d192b4c08040010[1][1];
        var_4995472795b82809 = var_92b132654e85cbc4[0];
        if (var_4995472795b82809 == host) {
            var_4995472795b82809 = var_92b132654e85cbc4[1];
        }
        var_4995442795b82170 = var_92b132654e85cbc4[2];
        if (var_4995442795b82170 == host) {
            var_4995442795b82170 = var_92b132654e85cbc4[1];
        }
        var_52a4b2a164977f87 function_df49f9975e17b225(1);
        var_52a4b3a1649781ba function_df49f9975e17b225(1);
        var_52a4b4a1649783ed function_df49f9975e17b225(1);
        var_52a4ada164977488 function_df49f9975e17b225(1);
        killplayer(var_52a4b2a164977f87, var_5d192b4c08040010[1]);
        killplayer(var_52a4b3a1649781ba, var_5d192b4c08040010[1]);
        killplayer(var_52a4b4a1649783ed, var_5d192b4c08040010[0]);
        killplayer(var_52a4ada164977488, var_5d192b4c08040010[0]);
        function_645de575b455626c(var_4995472795b82809);
        function_645de575b455626c(var_4995442795b82170);
        function_645de575b455626c(var_5d192b4c08040010[0][1]);
        function_645de575b455626c(var_5d192b4c08040010[0][2]);
        while (!istrue(host.gulagarena)) {
            waitframe();
        }
        teammate = namespace_6ea7652ec407cc80::function_1bd32287885bb933(host);
        /#
            assert(teammate == var_52a4b3a1649781ba);
        #/
        wait(10);
        arena = host.arena;
        killplayer(var_52a4b3a1649781ba, var_52a4ada164977488);
        wait(3);
        killplayer(var_52a4b2a164977f87, var_52a4ada164977488);
    }
    if (argshave(args, "endGameTeam")) {
        level.br_infils_disabled = 1;
        setdvar(@"hash_faf1db5754891b2d", 8);
        wait(5);
        namespace_47fd1e79a44628cd::shutdowngulag("circle_index", 0);
        var_90465ae4437c9aba = var_5d192b4c08040010[0][0];
        enemy2 = var_5d192b4c08040010[0][1];
        var_4995472795b82809 = var_92b132654e85cbc4[1];
        var_4995442795b82170 = var_92b132654e85cbc4[2];
        if (var_4995472795b82809 == host) {
            var_4995472795b82809 = var_92b132654e85cbc4[0];
        } else if (var_4995442795b82170 == host) {
            var_4995442795b82170 = var_92b132654e85cbc4[0];
        }
        killplayerinstant(enemy2, host);
        wait(1);
        killplayerinstant(var_4995472795b82809, var_90465ae4437c9aba);
        wait(1);
        killplayerinstant(var_4995442795b82170, var_90465ae4437c9aba);
        wait(1);
        killplayerinstant(host, var_90465ae4437c9aba);
    }
}

