// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_58f20490049af6ac;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_728ffcee8cbf30ee;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_3ff084f114b7f6c9;
#using script_744cad313ed0a87e;
#using script_4948cdf739393d2d;
#using script_371b4c2ab5861e62;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\matchdata.gsc;
#using script_5def7af2a9f04234;

#namespace namespace_9cb8bb5897c3d5b2;

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2374
// Size: 0xdf
function branalytics_init() {
    if (isdefined(level.matchdata_br_onmatchstart)) {
        return;
    }
    if (0) {
        return;
    }
    if (!branalytics_validation()) {
        return;
    }
    registersharedfunc("analytics", "agent_alloc", &function_8e6652060309b9db);
    registersharedfunc("analytics", "agent_spawn", &function_252e45fc60e2a731);
    registersharedfunc("analytics", "agent_killed", &function_e3aef4fcb303cff);
    level.var_d984da21af3906b9 = istrue(level.var_e00997af1f830a38);
    level.matchdata_br_onmatchstart = &onmatchstartbr;
    level.delayedeventtypes = [];
    level.var_47be1d1bb3b425a6 = getdvarint(@"hash_6169803d232444ff", 0);
    if (1) {
        level.var_47be1d1bb3b425a6 = 1;
        analyticsreset();
    }
    level thread function_c523b31dd9dc82d0();
    level thread function_d5db49ed7a7d77c5();
    level thread function_a16656b5f9493d2c();
    level thread function_7635473a21a12dc3();
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x245a
// Size: 0x3e
function function_d54188d94e97379c(info, var_80ed4d4a2aaf5d44) {
    if (isdedicatedserver()) {
        setdvar(@"hash_bd87b6ef2da571db", info);
    }
    if (istrue(var_80ed4d4a2aaf5d44)) {
        logstring("[KEY_MOMENT] " + info);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249f
// Size: 0x198
function function_a16656b5f9493d2c() {
    level endon("game_ended");
    function_d54188d94e97379c("prematch_waiting");
    level waittill("match_start_timer_beginning");
    wait(1);
    function_d54188d94e97379c("prematch_countdown begin", 1);
    while (isdefined(level.matchcountdowntime)) {
        function_d54188d94e97379c("prematch_countdown " + level.matchcountdowntime);
        wait(1);
    }
    function_d54188d94e97379c("prematch_cinematic begin", 1);
    wait(2);
    while (istrue(level.infilcinematicactive)) {
        wait(1);
    }
    function_d54188d94e97379c("prematch_cinematic end", 1);
    wait(1);
    while (1) {
        circleindex = 0;
        aliveplayers = 0;
        var_348a980d5b1b2325 = 0;
        foreach (team in level.teamnamelist) {
            teamplayers = namespace_54d20dd0dd79277f::getteamdata(team, "aliveCount");
            if (teamplayers > 0) {
                aliveplayers = aliveplayers + teamplayers;
                var_348a980d5b1b2325 = var_348a980d5b1b2325 + 1;
            }
        }
        if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex)) {
            circleindex = level.br_circle.circleindex;
        }
        info = "circle=" + circleindex + " alive=" + aliveplayers + " squads=" + var_348a980d5b1b2325;
        function_d54188d94e97379c(info);
        wait(10);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x263e
// Size: 0x20
function function_bd6274fad1216b30() {
    level endon("game_cleanup");
    level waittill("br_ending_start");
    function_d54188d94e97379c("game_ended, watching exfil", 1);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2665
// Size: 0x79
function function_7635473a21a12dc3() {
    level thread function_bd6274fad1216b30();
    level waittill("game_ended");
    function_d54188d94e97379c("game_ended, watching final kill", 1);
    wait(1.5);
    function_d54188d94e97379c("game_ended, watching splash", 1);
    if (isdefined(level.br_ending_delay)) {
        wait(level.br_ending_delay);
    }
    level waittill("round_end_finished");
    function_d54188d94e97379c("game_ended, round_end_finished", 1);
    level waittill("game_cleanup");
    function_d54188d94e97379c("game_ended, game_cleanup", 1);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e5
// Size: 0xec
function function_d5db49ed7a7d77c5() {
    level endon("game_ended");
    if (!isdedicatedserver()) {
        return;
    }
    level waittill("spawn_brStrongholdSpawn");
    wait(30);
    function_aa2a76e5b30b25da("br_peak", 30);
    wait(31);
    maxplayers = getdvarint(@"hash_818c699a5caaee4f", 0);
    playercount = getintorzero(level.players.size);
    if (playercount > maxplayers - 20 || getdvarint(@"hash_cd9d15d61f6e2380", 0) > 0) {
        function_efaab797904d13e8("br_peak", 1);
        wait(2);
    }
    if (getdvarint(@"hash_c7430c22ec75095d", 0) > 0 && isdefined(level.var_b9c50a4fd9223cc7)) {
        logstring("br_endMatchAfterCapture");
        self thread [[ level.var_b9c50a4fd9223cc7 ]](level.brgametype.firstteam, game["end_reason"]["objective_completed"]);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27d8
// Size: 0x3ec
function function_c523b31dd9dc82d0() {
    level endon("game_ended");
    level waittill("prematch_done");
    level.var_d984da21af3906b9 = 1;
    humans = 0;
    bots = 0;
    headless = 0;
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (isbot(player) || istestclient(player)) {
            bots = bots + 1;
            _branalytics_addevent("player_spawned", player getorigin(), 0, "", player);
        } else if (player isplayerheadless()) {
            headless = headless + 1;
            _branalytics_addevent("player_spawned", player getorigin(), 13, "", player);
        } else {
            humans = humans + 1;
            _branalytics_addevent("player_spawned", player getorigin(), 0, "", player);
        }
    }
    logstring("[KEY_MOMENT] Prematch Done");
    logstring("=============================================");
    logstring("bots       = " + bots);
    logstring("headless   = " + headless);
    logstring("humans     = " + humans);
    logstring("=============================================");
    var_4df1e1a017254690 = _branalytics_geteventtimestamp();
    function_bb96ecd805545b2e("prematch_done", (0, 0, 0), 0, int(var_4df1e1a017254690), "", -1);
    var_dfee9dad130c9312 = -3;
    if (isdefined(level.br_level) && isdefined(level.br_level.br_circlecenters)) {
        time = var_4df1e1a017254690;
        var_209967c144016964 = level.br_level.br_circleradii.size;
        multiCircleCount = namespace_bbc79db4c3949a5c::function_d987886bb9de9137();
        _branalytics_addevent("multiCircleCount", (0, 0, 0), multiCircleCount);
        for (circleindex = 0; circleindex < var_209967c144016964 - 1; circleindex++) {
            radius = level.br_level.br_circleradii[circleindex];
            timedelay = level.br_level.br_circledelaytimes[circleindex] * 1000;
            var_3d8565e2775a243c = level.br_level.br_circleclosetimes[circleindex] * 1000;
            if (multiCircleCount > 0) {
                for (i = 0; i < multiCircleCount; i++) {
                    var_dfa00ce7873df6dd = time;
                    origin = level.br_multi_circle.circles[i].var_8ae269616d09dfc5[circleindex];
                    function_bb96ecd805545b2e("circle" + string(i), origin, int(radius), int(var_dfa00ce7873df6dd), "start", var_dfee9dad130c9312 - i);
                    var_dfa00ce7873df6dd = var_dfa00ce7873df6dd + timedelay;
                    function_bb96ecd805545b2e("circle" + string(i), origin, int(radius), int(var_dfa00ce7873df6dd), "close", var_dfee9dad130c9312 - i);
                }
                time = time + timedelay;
                time = time + var_3d8565e2775a243c;
            } else {
                origin = level.br_level.br_circlecenters[circleindex];
                if (isdefined(timedelay) && isdefined(var_3d8565e2775a243c)) {
                    function_bb96ecd805545b2e("circle", origin, int(radius), int(time), "start", var_dfee9dad130c9312);
                    time = time + timedelay;
                    function_bb96ecd805545b2e("circle", origin, int(radius), int(time), "close", var_dfee9dad130c9312);
                    time = time + var_3d8565e2775a243c;
                }
            }
        }
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bcb
// Size: 0x18
function _branalytics_addeventallowed() {
    if (!branalytics_validation()) {
        return 0;
    }
    return istrue(level.var_d984da21af3906b9);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2beb
// Size: 0x14
function _branalytics_geteventtimestamp() {
    time = gettime();
    return time;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c07
// Size: 0xbb
function function_bb96ecd805545b2e(type, origin, state, time, data, entnum) {
    if (!istrue(level.var_d984da21af3906b9)) {
        return;
    }
    if (!isdefined(data) || !isstring(data)) {
        data = "";
    }
    if (1) {
        analyticsaddevent(origin, type, state, time, data, entnum);
    }
    if (0 && type != "breadcrumb") {
        logstring("[GAE]," + time + "," + entnum + "," + origin[0] + "," + origin[1] + "," + type + "," + state + "," + data);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cc9
// Size: 0xb5
function _branalytics_addevent(type, origin, state, data, ent) {
    allowed = _branalytics_addeventallowed();
    if (allowed == 0) {
        return;
    }
    if (!isdefined(origin)) {
        origin = (0, 0, 0);
    }
    if (!isdefined(state)) {
        state = 0;
    }
    if (!isdefined(data)) {
        data = "";
    }
    entnum = -1;
    if (isdefined(ent)) {
        entnum = ent getentitynumber();
    }
    time = _branalytics_geteventtimestamp();
    function_bb96ecd805545b2e(type, origin, state, time, data, entnum);
    if (isdefined(ent)) {
        ent function_f183d915239368b7(time);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d85
// Size: 0x34
function function_a48be354e2f41db9(type, ent) {
    if (!isdefined(ent)) {
        return;
    }
    _branalytics_addevent(type, ent.origin, 0, "", ent);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dc0
// Size: 0x40
function function_eefaa754fc189980(type, ent, state, data) {
    if (!isdefined(ent)) {
        return;
    }
    _branalytics_addevent(type, ent.origin, state, data, ent);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e07
// Size: 0xbe
function _getdeathstatecode(deathtype) {
    if (!isdefined(deathtype)) {
        return -1;
    }
    switch (deathtype) {
    case #"hash_fea1e712b5740278":
        data = 6;
        break;
    case #"hash_1184b43822fe56f0":
        data = 3;
        break;
    case #"hash_c03eabf71149f406":
        data = 5;
        break;
    case #"hash_e97320d8279bef45":
        data = 4;
        break;
    case #"hash_ce250de499ae9603":
        data = 2;
        break;
    case #"hash_a9f265ec10b615d":
        data = 1;
        break;
    case #"hash_e11c1638da4ca83c":
        data = 0;
        break;
    default:
        data = -1;
        break;
    }
    return data;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ecd
// Size: 0x129
function _branalytics_addeventdelayed(type, origin, ent, data) {
    /#
        assert(isdefined(level.delayedeventtypes));
    #/
    /#
        assert(isdefined(type));
    #/
    /#
        assert(isdefined(origin));
    #/
    /#
        assert(isdefined(ent));
    #/
    if (!isdefined(type)) {
        type = "undefined";
    }
    if (!isdefined(origin)) {
        origin = (0, 0, 0);
    }
    if (!isdefined(data)) {
        data = "";
    }
    if (!isdefined(level.delayedeventtypes[type])) {
        level.delayedeventtypes[type] = [];
    }
    evt = spawnstruct();
    evt.type = type;
    evt.origin = origin;
    evt.ent = ent;
    evt.data = data;
    evt.state = 0;
    evt.time = _branalytics_geteventtimestamp();
    var_fcf163e2db91eba2 = level.delayedeventtypes[type].size;
    level.delayedeventtypes[type][var_fcf163e2db91eba2] = evt;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ffd
// Size: 0xc6
function branalytics_seteventdelayedstate(type, ent, state) {
    if (!isdefined(type) || !isdefined(ent) || !isdefined(level.delayedeventtypes) || !isdefined(level.delayedeventtypes[type])) {
        return;
    }
    foreach (evt in level.delayedeventtypes[type]) {
        if (evt.ent == ent) {
            evt.time = _branalytics_geteventtimestamp();
            evt.state = state;
            return;
        }
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30ca
// Size: 0x10
function branalytics_validation() {
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30e2
// Size: 0xad
function branalytics_equipmentuse(player, objweapon, item_type) {
    if (!branalytics_validation()) {
        return;
    }
    equipmentname = objweapon.basename;
    /#
        assert(isstring(equipmentname));
    #/
    eventparams = _branalytics_header(player);
    eventparams[eventparams.size] = "item_name";
    eventparams[eventparams.size] = equipmentname;
    eventparams[eventparams.size] = "item_type";
    eventparams[eventparams.size] = item_type;
    player dlog_recordplayerevent("dlog_event_br_equipment_use", eventparams);
    if (_branalytics_addeventallowed()) {
        _branalytics_addevent("equipment_use", player.origin, 0, equipmentname, player);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3196
// Size: 0x49d
function branalytics_down(attacker, victim, objweapon, deathtype, meansofdeath) {
    if (!branalytics_validation()) {
        return;
    }
    if (isagent(attacker)) {
        if (_branalytics_addeventallowed()) {
            id = attacker getentitynumber();
            function_eefaa754fc189980("down_by_agent", victim, id, deathtype);
        }
        return;
    }
    if (!isent(attacker) || !isplayer(attacker)) {
        var_9c46fc77656f0e4b = "world";
        attacker = victim;
    } else if (isdefined(objweapon)) {
        var_9c46fc77656f0e4b = objweapon.basename;
    } else {
        attacker_weapon = attacker getcurrentweapon();
        var_9c46fc77656f0e4b = attacker_weapon.basename;
    }
    /#
        assert(isstring(var_9c46fc77656f0e4b));
    #/
    victim_weapon = ter_op(namespace_7e17181d03156026::isinlaststand(victim) && isdefined(victim.laststandoldweaponobj), victim.laststandoldweaponobj, victim.lastweaponused);
    var_595b87d05e4a06c4 = "";
    if (isdefined(victim_weapon)) {
        var_595b87d05e4a06c4 = victim_weapon.basename;
    }
    /#
        assert(isstring(var_595b87d05e4a06c4));
    #/
    eventparams = [];
    eventparams[eventparams.size] = "victim";
    eventparams[eventparams.size] = victim;
    var_3577d51e5fd643a0 = _branalytics_header(attacker, "attacker");
    foreach (item in var_3577d51e5fd643a0) {
        eventparams[eventparams.size] = item;
    }
    eventparams[eventparams.size] = "attacker_weapon";
    eventparams[eventparams.size] = var_9c46fc77656f0e4b;
    var_2d618a34e27d5476 = attacker getclientomnvar("ui_br_objective_index");
    if (!isdefined(var_2d618a34e27d5476)) {
        var_1070d193895b35b4 = "none";
    } else {
        var_1070d193895b35b4 = tablelookup("mp/brmissions.csv", 0, var_2d618a34e27d5476, 1);
    }
    eventparams[eventparams.size] = "attacker_active_mission";
    eventparams[eventparams.size] = var_1070d193895b35b4;
    var_e3056d0a98b080f = _branalytics_headerplayer([], victim, "victim");
    foreach (item in var_e3056d0a98b080f) {
        eventparams[eventparams.size] = item;
    }
    eventparams[eventparams.size] = "victim_weapon";
    eventparams[eventparams.size] = var_595b87d05e4a06c4;
    var_2d618a34e27d5476 = victim getclientomnvar("ui_br_objective_index");
    if (!isdefined(var_2d618a34e27d5476)) {
        var_1070d193895b35b4 = "NONE";
    } else {
        var_1070d193895b35b4 = tablelookup("mp/brmissions.csv", 0, var_2d618a34e27d5476, 1);
    }
    eventparams[eventparams.size] = "victim_active_mission";
    eventparams[eventparams.size] = var_1070d193895b35b4;
    eventparams[eventparams.size] = "death_type";
    eventparams[eventparams.size] = deathtype;
    eventparams[eventparams.size] = "means_of_death";
    eventparams[eventparams.size] = meansofdeath;
    teammates = namespace_54d20dd0dd79277f::getfriendlyplayers(victim.team, 1);
    closestdistance = 2147483647;
    foreach (teammate in teammates) {
        if (teammate == victim) {
            continue;
        }
        dist = distance(victim.origin, teammate.origin);
        if (dist < closestdistance || closestdistance == 2147483647) {
            closestdistance = dist;
        }
    }
    eventparams[eventparams.size] = "closest_victim_teammate_distance";
    eventparams[eventparams.size] = int(closestdistance);
    xp_earned = 0;
    if (isdefined(victim.pers["summary"]["xp"])) {
        var_1822f368857bc036 = victim.pers["summary"]["xp"];
        xp_earned = var_1822f368857bc036 - victim.pers["telemetry"].life.var_2148fb703835ec1f;
    }
    eventparams[eventparams.size] = "xp_earned";
    eventparams[eventparams.size] = xp_earned;
    attacker dlog_recordplayerevent("dlog_event_br_down", eventparams);
    if (_branalytics_addeventallowed()) {
        function_eefaa754fc189980("down", victim, _getdeathstatecode(deathtype), var_9c46fc77656f0e4b);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x363a
// Size: 0x124
function branalytics_revive(reviver, revivee) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "revivee";
    eventparams[eventparams.size] = revivee;
    var_852dbfe03d3ee1b8 = _branalytics_header(reviver, "reviver");
    foreach (item in var_852dbfe03d3ee1b8) {
        eventparams[eventparams.size] = item;
    }
    var_90f4fd6ffaa5c31 = _branalytics_headerplayer([], revivee, "revivee");
    foreach (item in var_90f4fd6ffaa5c31) {
        eventparams[eventparams.size] = item;
    }
    reviver dlog_recordplayerevent("dlog_event_br_revive", eventparams);
    if (_branalytics_addeventallowed()) {
        function_a48be354e2f41db9("revive", revivee);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3765
// Size: 0x50
function branalytics_selfrevive(revivee) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = _branalytics_header(revivee, "revivee");
    revivee dlog_recordplayerevent("dlog_event_br_selfrevive", eventparams);
    if (_branalytics_addeventallowed()) {
        function_a48be354e2f41db9("selfRevive", revivee);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params b, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37bc
// Size: 0x2b3
function branalytics_secondwind(revivee, laststandattacker, victim, meansofdeath, weaponname, laststandmeansofdeath, var_a47d4c036f14fc38, var_1450075a920a7dd5, var_c9d5089e35e3ff9e, var_e6ef59bd6dc2938a, var_6b0df23a41285117) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "lastStandAttacker";
    eventparams[eventparams.size] = laststandattacker;
    eventparams[eventparams.size] = "victim";
    eventparams[eventparams.size] = victim;
    var_90f4fd6ffaa5c31 = _branalytics_header(revivee, "revivee");
    foreach (item in var_90f4fd6ffaa5c31) {
        eventparams[eventparams.size] = item;
    }
    var_83ebb50ff7b5cf0e = _branalytics_headerplayer([], laststandattacker, "laststandattacker");
    foreach (item in var_83ebb50ff7b5cf0e) {
        eventparams[eventparams.size] = item;
    }
    var_e3056d0a98b080f = _branalytics_headerplayer([], victim, "victim");
    foreach (item in var_e3056d0a98b080f) {
        eventparams[eventparams.size] = item;
    }
    eventparams[eventparams.size] = "only_cleanup";
    eventparams[eventparams.size] = var_1450075a920a7dd5;
    eventparams[eventparams.size] = "only_downed";
    eventparams[eventparams.size] = var_c9d5089e35e3ff9e;
    eventparams[eventparams.size] = "bled_out";
    eventparams[eventparams.size] = var_e6ef59bd6dc2938a;
    eventparams[eventparams.size] = "downed_seconds";
    eventparams[eventparams.size] = var_6b0df23a41285117;
    if (!isdefined(meansofdeath)) {
        meansofdeath = "";
    }
    eventparams[eventparams.size] = "means_of_death";
    eventparams[eventparams.size] = meansofdeath;
    if (!isdefined(weaponname)) {
        weaponname = "";
    }
    eventparams[eventparams.size] = "weapon_name";
    eventparams[eventparams.size] = weaponname;
    if (!isdefined(laststandmeansofdeath)) {
        laststandmeansofdeath = "";
    }
    eventparams[eventparams.size] = "laststand_means_of_death";
    eventparams[eventparams.size] = laststandmeansofdeath;
    if (!isdefined(var_a47d4c036f14fc38)) {
        var_a47d4c036f14fc38 = "";
    }
    eventparams[eventparams.size] = "laststand_weapon_name";
    eventparams[eventparams.size] = var_a47d4c036f14fc38;
    revivee dlog_recordplayerevent("dlog_event_br_secondwind", eventparams);
    if (_branalytics_addeventallowed()) {
        function_a48be354e2f41db9("secondWind", revivee.origin);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a76
// Size: 0x19
function branalytics_deployallowed() {
    if (!branalytics_validation()) {
        return;
    }
    dlog_recordevent("dlog_event_br_deploy_allowed", []);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a96
// Size: 0x35
function branalytics_deploytriggered(player) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = _branalytics_header(player);
    player dlog_recordplayerevent("dlog_event_br_deploy_triggered", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ad2
// Size: 0x4b
function branalytics_landing(player) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = _branalytics_header(player);
    player dlog_recordplayerevent("dlog_event_br_deploy_land", eventparams);
    if (_branalytics_addeventallowed()) {
        function_a48be354e2f41db9("land", player);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b24
// Size: 0x3a
function branalytics_playercount(playercount) {
    if (!branalytics_validation()) {
        return;
    }
    if (_branalytics_addeventallowed()) {
        _branalytics_addevent("playerCount", (0, 0, 0), 0, playercount);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b65
// Size: 0x9b
function branalytics_lootpickup(player, scriptablename, amount) {
    if (!branalytics_validation()) {
        return;
    }
    /#
        assert(isstring(scriptablename));
    #/
    /#
        assert(isint(amount));
    #/
    eventparams = _branalytics_header(player);
    eventparams[eventparams.size] = "item_name";
    eventparams[eventparams.size] = scriptablename;
    eventparams[eventparams.size] = "amount";
    eventparams[eventparams.size] = amount;
    player dlog_recordplayerevent("dlog_event_br_loot_pickup", eventparams);
    if (_branalytics_addeventallowed()) {
        function_eefaa754fc189980("loot_pickup", player, amount, scriptablename);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c07
// Size: 0xc6
function branalytics_lootdrop(player, itemtype, var_e637ee4faed5d14d, amount) {
    if (!branalytics_validation()) {
        return;
    }
    /#
        assert(isstring(itemtype));
    #/
    var_e637ee4faed5d14d = istrue(var_e637ee4faed5d14d);
    /#
        assert(isint(var_e637ee4faed5d14d));
    #/
    /#
        assert(isint(amount));
    #/
    eventparams = _branalytics_header(player);
    eventparams[eventparams.size] = "item_name";
    eventparams[eventparams.size] = itemtype;
    eventparams[eventparams.size] = "is_drop_from_weapon_switch";
    eventparams[eventparams.size] = var_e637ee4faed5d14d;
    eventparams[eventparams.size] = "amount";
    eventparams[eventparams.size] = amount;
    player dlog_recordplayerevent("dlog_event_br_loot_drop", eventparams);
    if (_branalytics_addeventallowed()) {
        function_eefaa754fc189980("loot_drop", player, amount, itemtype);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd4
// Size: 0x4d
function branalytics_gulagstart(player, type) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = _branalytics_header(player);
    eventparams[eventparams.size] = "type";
    eventparams[eventparams.size] = type;
    player dlog_recordplayerevent("dlog_event_br_gulag_start", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d28
// Size: 0x21d
function branalytics_gulagend(player, type, arena) {
    if (!branalytics_validation()) {
        return;
    }
    eventref = "none";
    var_363eb22fdb336a2a = "none";
    if (isdefined(arena) && namespace_47fd1e79a44628cd::function_175e22055ae274a3("getEventSettings")) {
        event = namespace_47fd1e79a44628cd::function_d4b0eef0a0924094("getEventSettings", arena);
        if (isdefined(event)) {
            eventref = event.ref;
        }
    }
    if (isdefined(arena) && namespace_47fd1e79a44628cd::function_175e22055ae274a3("getNamedArenaSettings")) {
        var_9164ee7939b1917d = namespace_47fd1e79a44628cd::function_d4b0eef0a0924094("getNamedArenaSettings", arena);
        if (isdefined(var_9164ee7939b1917d)) {
            var_363eb22fdb336a2a = var_9164ee7939b1917d.ref;
        }
    }
    eventparams = _branalytics_header(player);
    eventparams[eventparams.size] = "type";
    eventparams[eventparams.size] = type;
    eventparams[eventparams.size] = "event";
    eventparams[eventparams.size] = eventref;
    eventparams[eventparams.size] = "named_arena";
    eventparams[eventparams.size] = var_363eb22fdb336a2a;
    eventparams[eventparams.size] = "primary";
    eventparams[eventparams.size] = isdefined(player.loadoutprimary) ? "" : player.loadoutprimary;
    eventparams[eventparams.size] = "secondary";
    eventparams[eventparams.size] = isdefined(player.loadoutsecondary) ? "" : player.loadoutsecondary;
    eventparams[eventparams.size] = "starting_lethal";
    eventparams[eventparams.size] = isdefined(player.loadoutequipmentprimary) ? "" : player.loadoutequipmentprimary;
    eventparams[eventparams.size] = "starting_tactical";
    eventparams[eventparams.size] = isdefined(player.loadoutequipmentsecondary) ? "" : player.loadoutequipmentsecondary;
    eventparams[eventparams.size] = "pickups";
    eventparams[eventparams.size] = isdefined(player.var_d919d1c70719e664) ? 0 : player.var_d919d1c70719e664;
    player dlog_recordplayerevent("dlog_event_br_gulag_end", eventparams);
    if (_branalytics_addeventallowed()) {
        function_eefaa754fc189980("gulag_end", player, 0, type);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f4c
// Size: 0x3a
function branalytics_respawn(player, var_99d9696812df6304) {
    if (!branalytics_validation()) {
        return;
    }
    if (_branalytics_addeventallowed()) {
        function_eefaa754fc189980("respawn", player, var_99d9696812df6304, "");
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f8d
// Size: 0x3a
function branalytics_disconnect(player, var_8d4194f42fefe406) {
    if (!branalytics_validation()) {
        return;
    }
    if (_branalytics_addeventallowed()) {
        function_eefaa754fc189980("disconnect", player, var_8d4194f42fefe406, "");
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fce
// Size: 0xad
function branalytics_dropbagdeployed(player, var_7bc6be581f50b614, var_add790a95b329400, crate) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = _branalytics_header(player);
    eventparams[eventparams.size] = "drop_x";
    eventparams[eventparams.size] = var_7bc6be581f50b614[0];
    eventparams[eventparams.size] = "drop_y";
    eventparams[eventparams.size] = var_7bc6be581f50b614[1];
    eventparams[eventparams.size] = "drop_z";
    eventparams[eventparams.size] = var_7bc6be581f50b614[2];
    eventparams[eventparams.size] = "spawn_type";
    eventparams[eventparams.size] = var_add790a95b329400;
    player dlog_recordplayerevent("dlog_event_br_dropbag_deployed", eventparams);
    if (_branalytics_addeventallowed()) {
        _branalytics_addeventdelayed("dropkit", var_7bc6be581f50b614, crate, 0);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4082
// Size: 0x95
function branalytics_dropbagused(player, var_7bc6be581f50b614, crate) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = _branalytics_header(player);
    eventparams[eventparams.size] = "drop_x";
    eventparams[eventparams.size] = var_7bc6be581f50b614[0];
    eventparams[eventparams.size] = "drop_y";
    eventparams[eventparams.size] = var_7bc6be581f50b614[1];
    eventparams[eventparams.size] = "drop_z";
    eventparams[eventparams.size] = var_7bc6be581f50b614[2];
    player dlog_recordplayerevent("dlog_event_br_dropbag_used", eventparams);
    if (_branalytics_addeventallowed()) {
        branalytics_seteventdelayedstate("dropkit", crate, 1);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x411e
// Size: 0x8a
function branalytics_dropbagdestroyed(team, var_7bc6be581f50b614) {
    if (!branalytics_validation()) {
        return;
    }
    if (!isdefined(team)) {
        team = "none";
    }
    eventparams = [];
    eventparams[eventparams.size] = "drop_team";
    eventparams[eventparams.size] = team;
    eventparams[eventparams.size] = "drop_x";
    eventparams[eventparams.size] = var_7bc6be581f50b614[0];
    eventparams[eventparams.size] = "drop_y";
    eventparams[eventparams.size] = var_7bc6be581f50b614[1];
    eventparams[eventparams.size] = "drop_z";
    eventparams[eventparams.size] = var_7bc6be581f50b614[2];
    dlog_recordevent("dlog_event_br_dropbag_destroyed", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41af
// Size: 0x4d
function branalytics_circleenter(player, time) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = _branalytics_header(player);
    eventparams[eventparams.size] = "time_spent_outside";
    eventparams[eventparams.size] = time;
    player dlog_recordplayerevent("dlog_event_br_circle_enter", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4203
// Size: 0x4d
function branalytics_circleexit(player, time) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = _branalytics_header(player);
    eventparams[eventparams.size] = "time_spent_inside";
    eventparams[eventparams.size] = time;
    player dlog_recordplayerevent("dlog_event_br_circle_exit", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4257
// Size: 0x3e
function function_14099f0f07c09e69(time) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "time_circle_start_split";
    eventparams[eventparams.size] = time;
    dlog_recordevent("dlog_event_br_multi_circle_start_split", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x429c
// Size: 0x6e
function function_c3ca7338446f4fce(time, playercounts, var_4b6b489dae052a24) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "time_circle_end_split";
    eventparams[eventparams.size] = time;
    eventparams[eventparams.size] = "circle_player_count";
    eventparams[eventparams.size] = playercounts;
    eventparams[eventparams.size] = "circle_team_count";
    eventparams[eventparams.size] = var_4b6b489dae052a24;
    dlog_recordevent("dlog_event_br_multi_circle_end_split", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4311
// Size: 0x6e
function function_77c1c837c38efa21(time, playercounts, var_4b6b489dae052a24) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "time_circle_start_merge";
    eventparams[eventparams.size] = time;
    eventparams[eventparams.size] = "circle_player_count";
    eventparams[eventparams.size] = playercounts;
    eventparams[eventparams.size] = "circle_team_count";
    eventparams[eventparams.size] = var_4b6b489dae052a24;
    dlog_recordevent("dlog_event_br_multi_circle_start_merge", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4386
// Size: 0x3e
function function_4eb4428fe15d7276(time) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "time_circle_end_merge";
    eventparams[eventparams.size] = time;
    dlog_recordevent("dlog_event_br_multi_circle_end_merge", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43cb
// Size: 0x19b
function branalytics_planepath(centerpt, yaw, startpt, endpt) {
    if (!branalytics_validation()) {
        return;
    }
    level waittill("prematch_done");
    dlog_recordevent("dlog_event_br_plane_path", [0:"center_x", 1:centerpt[0], 2:"center_y", 3:centerpt[1], 4:"center_z", 5:centerpt[2], 6:"yaw", 7:yaw, 8:"start_x", 9:startpt[0], 10:"start_y", 11:startpt[1], 12:"start_z", 13:startpt[2], 14:"end_x", 15:endpt[0], 16:"end_y", 17:endpt[1], 18:"end_z", 19:endpt[2]]);
    if (_branalytics_addeventallowed()) {
        var_de802962b74d1a6c = -2;
        var_4df1e1a017254690 = _branalytics_geteventtimestamp();
        var_b1ef50b243ad7d22 = var_4df1e1a017254690 + 35000;
        var_432421c6ec2bfcd9 = distance(startpt, endpt);
        var_20f3bd3ea911bd9d = var_432421c6ec2bfcd9 / namespace_ad389306d44fc6b4::getc130speed() * 1000;
        var_fc296699dfb028f8 = var_b1ef50b243ad7d22;
        var_1abcf37063053d49 = var_fc296699dfb028f8 + var_20f3bd3ea911bd9d;
        function_bb96ecd805545b2e("plane", startpt, 0, int(var_fc296699dfb028f8), "", var_de802962b74d1a6c);
        function_bb96ecd805545b2e("plane", endpt, 0, int(var_1abcf37063053d49), "", var_de802962b74d1a6c);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x456d
// Size: 0x7fd
function branalytics_economy_snapshot(activeplayers) {
    if (!branalytics_validation()) {
        return;
    }
    var_aaa3a2b391a4d25b = [];
    var_a059cab9dfe3d005 = 0;
    var_618fb04d3fecdeba = 0;
    var_61b2ba4d40133c70 = 5000;
    var_e7a8920e2e79427e = 0;
    var_e7cc840e2ea19e6c = 5000;
    foreach (player in activeplayers) {
        if (!isdefined(var_aaa3a2b391a4d25b[player.team])) {
            var_aaa3a2b391a4d25b[player.team] = 0;
        }
        if (isdefined(player.plundercount)) {
            var_a059cab9dfe3d005 = var_a059cab9dfe3d005 + player.plundercount;
            var_aaa3a2b391a4d25b[player.team] = var_aaa3a2b391a4d25b[player.team] + player.plundercount;
            if (player.plundercount > var_618fb04d3fecdeba) {
                var_618fb04d3fecdeba = player.plundercount;
            }
            if (player.plundercount < var_61b2ba4d40133c70) {
                var_61b2ba4d40133c70 = player.plundercount;
            }
        }
        if (var_aaa3a2b391a4d25b[player.team] > var_e7a8920e2e79427e) {
            var_e7a8920e2e79427e = var_aaa3a2b391a4d25b[player.team];
        }
        if (var_aaa3a2b391a4d25b[player.team] < var_e7cc840e2ea19e6c) {
            var_e7cc840e2ea19e6c = var_aaa3a2b391a4d25b[player.team];
        }
    }
    var_53dca488a704d8e7 = int(safedivide(var_a059cab9dfe3d005, activeplayers.size));
    var_8da025f6da65d8d3 = int(safedivide(var_a059cab9dfe3d005, var_aaa3a2b391a4d25b.size));
    eventparams = [];
    eventparams[eventparams.size] = "num_players_alive";
    eventparams[eventparams.size] = function_3fe52b08c657d074(activeplayers.size);
    eventparams[eventparams.size] = "num_teams_alive";
    eventparams[eventparams.size] = function_3fe52b08c657d074(var_aaa3a2b391a4d25b.size);
    eventparams[eventparams.size] = "total_plunder_held";
    eventparams[eventparams.size] = function_dcb7ec4c3306db25(var_a059cab9dfe3d005);
    eventparams[eventparams.size] = "top_player_plunder_held";
    eventparams[eventparams.size] = function_dcaf784c32fdf05b(var_618fb04d3fecdeba);
    eventparams[eventparams.size] = "top_team_total_plunder_held";
    eventparams[eventparams.size] = function_dcaf784c32fdf05b(var_e7a8920e2e79427e);
    eventparams[eventparams.size] = "avg_player_plunder_held";
    eventparams[eventparams.size] = function_dcaf784c32fdf05b(var_53dca488a704d8e7);
    eventparams[eventparams.size] = "avg_team_total_plunder_held";
    eventparams[eventparams.size] = function_dcaf784c32fdf05b(var_8da025f6da65d8d3);
    eventparams[eventparams.size] = "min_player_plunder_held";
    eventparams[eventparams.size] = function_f8cfd7cafbc5981e(var_61b2ba4d40133c70);
    eventparams[eventparams.size] = "min_team_total_plunder_held";
    eventparams[eventparams.size] = function_f8cfd7cafbc5981e(var_e7cc840e2ea19e6c);
    eventparams[eventparams.size] = "plunder_items_picked_up";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_f8cfd7cafbc5981e(level.br_plunder.plunder_items_picked_up);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "plunder_value_picked_up";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_f8d8c3cafbcf8ad0(level.br_plunder.plunder_value_picked_up);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "plunder_items_dropped";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_f8cfd7cafbc5981e(level.br_plunder.plunder_items_dropped);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "plunder_value_dropped";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_f8d8c3cafbcf8ad0(level.br_plunder.plunder_value_dropped);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "plunder_awarded_by_missions_total";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_f8d8c3cafbcf8ad0(level.br_plunder.plunder_awarded_by_missions_total);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "kiosk_spent_total";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_3fe52b08c657d074(level.br_plunder.kiosk_spent_total);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "kiosk_num_purchases";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_3fe52b08c657d074(level.br_plunder.kiosk_num_purchases);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "extraction_balloon_total_value";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_f8cfd7cafbc5981e(level.br_plunder.extraction_balloon_total_plunder);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "extraction_balloon_total_extractions";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_3fe52b08c657d074(level.br_plunder.extraction_balloon_num_completed);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "extraction_helicoptor_total_value";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_dcaf784c32fdf05b(level.br_plunder.extraction_helicoptor_total_plunder);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "extraction_helicoptor_total_extractions";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_3fe52b08c657d074(level.br_plunder.extraction_helicoptor_num_completed);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "ingame_count_uncommon_1";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_f8cfd7cafbc5981e(level.br_plunder.itemsinworld["brloot_plunder_cash_uncommon_1"]);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "ingame_count_uncommon_2";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_f8d8c3cafbcf8ad0(level.br_plunder.itemsinworld["brloot_plunder_cash_uncommon_2"]);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "ingame_count_uncommon_3";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_f8d8c3cafbcf8ad0(level.br_plunder.itemsinworld["brloot_plunder_cash_uncommon_3"]);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "ingame_count_rare_1";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_f8d8c3cafbcf8ad0(level.br_plunder.itemsinworld["brloot_plunder_cash_rare_1"]);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "ingame_count_rare_2";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_f8cfd7cafbc5981e(level.br_plunder.itemsinworld["brloot_plunder_cash_rare_2"]);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "ingame_count_epic_1";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_f8cfd7cafbc5981e(level.br_plunder.itemsinworld["brloot_plunder_cash_epic_1"]);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "ingame_count_epic_2";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_f8cfd7cafbc5981e(level.br_plunder.itemsinworld["brloot_plunder_cash_epic_2"]);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "ingame_count_legendary_1";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_f8cfd7cafbc5981e(level.br_plunder.itemsinworld["brloot_plunder_cash_legendary_1"]);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "count_unopened_chests";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_f8d8c3cafbcf8ad0(level.br_plunder.itemsinworld["br_loot_cache"]);
    } else {
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "count_available_missions";
    if (isdefined(level.br_plunder)) {
        eventparams[eventparams.size] = function_783acbcf408fa927(level.br_plunder.itemsinworld["missionTablets"]);
    } else {
        eventparams[eventparams.size] = 0;
    }
    dlog_recordevent("dlog_event_br_plunder_economy_snapshot", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d71
// Size: 0x9d
function br_getprimaryandsecondaryweapons(player) {
    primaryweaponobj = player getcurrentweapon();
    secondaryweaponobj = undefined;
    if (isdefined(player.primaryweaponobj) && primaryweaponobj != player.primaryweaponobj) {
        secondaryweaponobj = player.primaryweaponobj;
    } else if (isdefined(player.secondaryweaponobj) && primaryweaponobj != player.secondaryweaponobj) {
        secondaryweaponobj = player.secondaryweaponobj;
    }
    return [0:safecheckweapon(primaryweaponobj), 1:safecheckweapon(secondaryweaponobj)];
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e16
// Size: 0x2ee
function branalytics_inventory_snapshot(player, reason) {
    if (!branalytics_validation()) {
        return;
    }
    var_bd5cce7508e151a9 = br_getprimaryandsecondaryweapons(player);
    eventparams = _branalytics_header(player);
    eventparams[eventparams.size] = "reason";
    eventparams[eventparams.size] = reason;
    eventparams[eventparams.size] = "primary_weapon";
    eventparams[eventparams.size] = var_bd5cce7508e151a9[0];
    eventparams[eventparams.size] = "secondary_weapon";
    eventparams[eventparams.size] = var_bd5cce7508e151a9[1];
    eventparams[eventparams.size] = "primary_equipment";
    eventparams[eventparams.size] = safecheckstring(player.equipment["primary"]);
    eventparams[eventparams.size] = "secondary_equipment";
    eventparams[eventparams.size] = safecheckstring(player.equipment["secondary"]);
    eventparams[eventparams.size] = "field_equipment";
    eventparams[eventparams.size] = safecheckstring(player.equipment["super"]);
    eventparams[eventparams.size] = "has_gasmask";
    eventparams[eventparams.size] = isdefined(player.gasmaskequipped) && player.gasmaskequipped == 1;
    eventparams[eventparams.size] = "armor_plates";
    eventparams[eventparams.size] = function_783acbcf408fa927(player namespace_1a507865f681850e::getequipmentslotammo("health"));
    eventparams[eventparams.size] = "plunder_total";
    eventparams[eventparams.size] = function_dcb7ec4c3306db25(player.plundercount);
    eventparams[eventparams.size] = "plunder_banked";
    eventparams[eventparams.size] = function_dcb7ec4c3306db25(player.plunderbanked);
    eventparams[eventparams.size] = "ammo_smg";
    eventparams[eventparams.size] = function_dcaf784c32fdf05b(player.br_ammo["brloot_ammo_919"]);
    eventparams[eventparams.size] = "ammo_ar_lmg";
    eventparams[eventparams.size] = function_dcaf784c32fdf05b(player.br_ammo["brloot_ammo_762"]);
    eventparams[eventparams.size] = "ammo_shotgun";
    eventparams[eventparams.size] = function_dcaf784c32fdf05b(player.br_ammo["brloot_ammo_12g"]);
    eventparams[eventparams.size] = "ammo_sniper";
    eventparams[eventparams.size] = function_dcaf784c32fdf05b(player.br_ammo["brloot_ammo_50cal"]);
    eventparams[eventparams.size] = "ammo_rockets";
    eventparams[eventparams.size] = function_3fe52b08c657d074(player.br_ammo["brloot_ammo_rocket"]);
    loadoutperks = player namespace_3c5a4254f2b957ea::getpersstat("loadoutPerks");
    for (index = 0; index < 2; index++) {
        perkname = "specialty_null";
        perkname = loadoutperks[index];
        eventparams[eventparams.size] = "base_perk_" + index + 1;
        eventparams[eventparams.size] = perkname;
    }
    var_13db3ca1ad2db644 = "specialty_null";
    var_13db3ca1ad2db644 = loadoutperks[2];
    eventparams[eventparams.size] = "bonus_perk";
    eventparams[eventparams.size] = var_13db3ca1ad2db644;
    var_34fdca49e62d81ee = "specialty_null";
    var_34fdca49e62d81ee = loadoutperks[3];
    eventparams[eventparams.size] = "ultimate_perk";
    eventparams[eventparams.size] = var_34fdca49e62d81ee;
    player dlog_recordplayerevent("dlog_event_br_inventory_snapshot", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x510b
// Size: 0x10c
function function_6039c3ffa983858f(player, var_465ab95dd1230bd3, weaponref, var_31553e68a5164e3e) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = _branalytics_header(player);
    eventparams[eventparams.size] = "plunder_spent";
    eventparams[eventparams.size] = var_465ab95dd1230bd3;
    eventparams[eventparams.size] = "player_plunder_after_purchase";
    eventparams[eventparams.size] = player.plundercount;
    eventparams[eventparams.size] = "weapon";
    eventparams[eventparams.size] = safecheckstring(weaponref);
    /#
        assert(-1);
    #/
    /#
        assert(-1);
    #/
    /#
        assert(var_31553e68a5164e3e.size <= 7);
    #/
    for (var_9413831c8d06464c = 0; var_9413831c8d06464c < 7; var_9413831c8d06464c++) {
        eventparams[eventparams.size] = function_996b01cd49d0128d([0:"weapon_attachment_", 1:string(var_9413831c8d06464c)]);
        if (isdefined(var_31553e68a5164e3e[var_9413831c8d06464c])) {
            eventparams[eventparams.size] = safecheckstring(var_31553e68a5164e3e[var_9413831c8d06464c]);
        } else {
            eventparams[eventparams.size] = "none";
        }
    }
    player dlog_recordplayerevent("dlog_event_br_kiosk_purchase_loadout_weapon", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x521e
// Size: 0x174
function branalytics_kiosk_purchaseloadout(player, var_465ab95dd1230bd3, loadoutdata) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = _branalytics_header(player);
    eventparams[eventparams.size] = "plunder_spent";
    eventparams[eventparams.size] = var_465ab95dd1230bd3;
    eventparams[eventparams.size] = "player_plunder_after_purchase";
    eventparams[eventparams.size] = player.plundercount;
    eventparams[eventparams.size] = "primary_weapon";
    eventparams[eventparams.size] = safecheckstring(loadoutdata.loadoutprimaryfullname);
    eventparams[eventparams.size] = "secondary_weapon";
    eventparams[eventparams.size] = safecheckstring(loadoutdata.loadoutsecondaryfullname);
    eventparams[eventparams.size] = "primary_equipment";
    eventparams[eventparams.size] = safecheckstring(loadoutdata.loadoutequipmentprimary);
    eventparams[eventparams.size] = "secondary_equipment";
    eventparams[eventparams.size] = safecheckstring(loadoutdata.loadoutequipmentsecondary);
    eventparams[eventparams.size] = "base_perk_1";
    eventparams[eventparams.size] = safecheckstring(loadoutdata.loadoutperks[0]);
    eventparams[eventparams.size] = "base_perk_2";
    eventparams[eventparams.size] = safecheckstring(loadoutdata.loadoutperks[1]);
    eventparams[eventparams.size] = "bonus_perk";
    eventparams[eventparams.size] = safecheckstring(loadoutdata.var_15f3e6df722fb1cf);
    eventparams[eventparams.size] = "ultimate_perk";
    eventparams[eventparams.size] = safecheckstring(loadoutdata.var_15f3e5df722faf9c);
    player dlog_recordplayerevent("dlog_event_br_kiosk_purchase_loadout", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5399
// Size: 0xbb
function branalytics_kiosk_purchaseitem(player, var_465ab95dd1230bd3, var_75b71e1f4013579e, itemname) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = _branalytics_header(player);
    eventparams[eventparams.size] = "plunder_spent";
    eventparams[eventparams.size] = function_dcaf784c32fdf05b(var_465ab95dd1230bd3);
    eventparams[eventparams.size] = "player_plunder_after_purchase";
    eventparams[eventparams.size] = function_dcaf784c32fdf05b(player.plundercount);
    eventparams[eventparams.size] = "purchase_type";
    eventparams[eventparams.size] = var_75b71e1f4013579e;
    eventparams[eventparams.size] = "item_name";
    eventparams[eventparams.size] = itemname;
    player dlog_recordplayerevent("dlog_event_br_kiosk_purchase_item", eventparams);
    if (_branalytics_addeventallowed()) {
        function_eefaa754fc189980("purchase", player, var_465ab95dd1230bd3, itemname);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x545b
// Size: 0x151
function branalytics_kiosk_menu_event(player, var_a00244f669488912, var_6c457c5f341beb23, var_97aa008efeedd23c) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = _branalytics_header(player, "kiosk_menu_owner");
    eventparams[eventparams.size] = "kiosk_menu_owner_event";
    eventparams[eventparams.size] = var_a00244f669488912;
    eventparams[eventparams.size] = "kiosk_menu_owner_event_param";
    if (isdefined(var_6c457c5f341beb23)) {
        eventparams[eventparams.size] = var_6c457c5f341beb23;
    } else {
        eventparams[eventparams.size] = "none";
    }
    eventparams[eventparams.size] = "kiosk_menu_owner_event_time";
    eventparams[eventparams.size] = gettime() - level.starttime;
    eventparams[eventparams.size] = "kiosk_menu_owner_kiosk";
    if (isdefined(player.br_kiosk)) {
        eventparams[eventparams.size] = player.br_kiosk.index;
    } else {
        eventparams[eventparams.size] = -1;
    }
    eventparams[eventparams.size] = "kiosk_menu_owner_allowed";
    eventparams[eventparams.size] = istrue(player.armorykioskpurchaseallowed);
    eventparams[eventparams.size] = "kiosk_menu_owner_error";
    if (var_a00244f669488912 != "menu_close" && !isdefined(player.br_kiosk)) {
        eventparams[eventparams.size] = "unexpected_undefined_kiosk";
    } else {
        eventparams[eventparams.size] = "none";
    }
    eventparams[eventparams.size] = "kiosk_type";
    if (!isdefined(var_97aa008efeedd23c)) {
        var_97aa008efeedd23c = "standard_kiosk";
    }
    eventparams[eventparams.size] = var_97aa008efeedd23c;
    player dlog_recordplayerevent("dlog_event_br_kiosk_menu_event", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x55b3
// Size: 0x9f
function branalytics_plunder_placed_into_extraction(player, method, location, var_987ebc0a48f683a2) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "extraction_method";
    eventparams[eventparams.size] = method;
    eventparams[eventparams.size] = "plunder_placed_into_extraction";
    eventparams[eventparams.size] = var_987ebc0a48f683a2;
    eventparams[eventparams.size] = "extraction_point_x";
    eventparams[eventparams.size] = location[0];
    eventparams[eventparams.size] = "extraction_point_y";
    eventparams[eventparams.size] = location[1];
    eventparams[eventparams.size] = "extraction_point_z";
    eventparams[eventparams.size] = location[2];
    player dlog_recordplayerevent("dlog_event_br_plunder_placed_into_extraction", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5659
// Size: 0xc6
function branalytics_plunder_extraction_success(num_depositers, var_987ebc0a48f683a2, method, contains_enemy_plunder, var_11f463855416ab73) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "num_depositers";
    eventparams[eventparams.size] = num_depositers;
    eventparams[eventparams.size] = "plunder_extracted";
    eventparams[eventparams.size] = var_987ebc0a48f683a2;
    eventparams[eventparams.size] = "method";
    eventparams[eventparams.size] = method;
    eventparams[eventparams.size] = "contains_enemy_plunder";
    eventparams[eventparams.size] = contains_enemy_plunder;
    eventparams[eventparams.size] = "extraction_origin_x";
    eventparams[eventparams.size] = var_11f463855416ab73[0];
    eventparams[eventparams.size] = "extraction_origin_y";
    eventparams[eventparams.size] = var_11f463855416ab73[1];
    eventparams[eventparams.size] = "extraction_origin_z";
    eventparams[eventparams.size] = var_11f463855416ab73[2];
    dlog_recordevent("dlog_event_br_plunder_extraction_success", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5726
// Size: 0xd6
function branalytics_plunder_extraction_failure(plunder_dropped, method, var_11f463855416ab73, var_dced1621d5483cc2) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "plunder_dropped";
    eventparams[eventparams.size] = plunder_dropped;
    eventparams[eventparams.size] = "method";
    eventparams[eventparams.size] = method;
    eventparams[eventparams.size] = "extraction_origin_x";
    eventparams[eventparams.size] = var_11f463855416ab73[0];
    eventparams[eventparams.size] = "extraction_origin_y";
    eventparams[eventparams.size] = var_11f463855416ab73[1];
    eventparams[eventparams.size] = "extraction_origin_z";
    eventparams[eventparams.size] = var_11f463855416ab73[2];
    eventparams[eventparams.size] = "destruction_origin_x";
    eventparams[eventparams.size] = var_dced1621d5483cc2[0];
    eventparams[eventparams.size] = "destruction_origin_y";
    eventparams[eventparams.size] = var_dced1621d5483cc2[1];
    eventparams[eventparams.size] = "destruction_origin_z";
    eventparams[eventparams.size] = var_dced1621d5483cc2[2];
    dlog_recordevent("dlog_event_br_plunder_extraction_failure", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5803
// Size: 0x74
function branalytics_bonusxp_debugdata(xp, reason) {
    if (!branalytics_validation()) {
        return;
    }
    if (isdefined(self)) {
        xuid = self getxuid() + " " + reason;
    } else {
        xuid = "none " + reason;
    }
    xp = int(xp);
    if (_branalytics_addeventallowed()) {
        _branalytics_addevent("bonusXpDebug", (0, 0, 0), xp, xuid);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x587e
// Size: 0x58
function branalytics_vehiclespawned(vehicle, refname) {
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        return;
    }
    if (!branalytics_validation()) {
        return;
    }
    if (_branalytics_addeventallowed() && isdefined(level.prematchendtime)) {
        _branalytics_addeventdelayed("vehicle", vehicle.origin, vehicle, refname);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58dd
// Size: 0x35
function function_e77f36370162406c(player) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = _branalytics_header(player);
    player dlog_recordplayerevent("dlog_event_br_redeploy_drone_used", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5919
// Size: 0xae
function function_bfc305f32a65dee5(params) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [0:"pos_x", 1:params.pos[0], 2:"pos_y", 3:params.pos[1], 4:"pos_z", 5:params.pos[2], 6:"circle_index", 7:params.circle_index, 8:"was_relocating", 9:params.was_relocating];
    dlog_recordevent("dlog_event_br_redeploy_drone_destroyed", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59ce
// Size: 0x72
function branalytics_inittablets(num_missions, num_missions_active, num_missions_hidden, hide_percent) {
    if (!branalytics_validation()) {
        return;
    }
    dlog_recordevent("dlog_event_br_mission_init", [0:"num_missions", 1:num_missions, 2:"num_missions_active", 3:num_missions_active, 4:"num_missions_hidden", 5:num_missions_hidden, 6:"hide_percent", 7:hide_percent]);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a47
// Size: 0x72
function branalytics_delayedshowtablets(circle_index, show_percent, num_valid, num_shown) {
    if (!branalytics_validation()) {
        return;
    }
    dlog_recordevent("dlog_event_br_mission_repopulate", [0:"circle_index", 1:circle_index, 2:"show_percent", 3:show_percent, 4:"num_valid", 5:num_valid, 6:"num_shown", 7:num_shown]);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ac0
// Size: 0x10b
function branalytics_spawntablet(tablet) {
    if (!branalytics_validation()) {
        return;
    }
    dlog_recordevent("dlog_event_br_mission_spawn", [0:"id", 1:ter_op(isdefined(tablet.index), "" + tablet.index, "invalid"), 2:"type", 3:tablet.type, 4:"origin_x", 5:tablet.origin[0], 6:"origin_y", 7:tablet.origin[1], 8:"origin_z", 9:tablet.origin[2]]);
    if (_branalytics_addeventallowed() && isdefined(tablet.index)) {
        _branalytics_addeventdelayed("mission", tablet.origin, "" + tablet.index, tablet.tablettype);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bd2
// Size: 0xbf
function branalytics_invalidtablet(tablet) {
    if (!branalytics_validation()) {
        return;
    }
    dlog_recordevent("dlog_event_br_mission_invalid", [0:"id", 1:ter_op(isdefined(tablet.index), "" + tablet.index, "invalid"), 2:"type", 3:tablet.type, 4:"origin_x", 5:tablet.origin[0], 6:"origin_y", 7:tablet.origin[1], 8:"origin_z", 9:tablet.origin[2]]);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c98
// Size: 0x17d
function branalytics_missionstart(var_b2b01f6f55f16552, player) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    teammates = namespace_54d20dd0dd79277f::getfriendlyplayers(player.team, 1);
    eventparams = _branalytics_headerplayerposrow(eventparams, teammates);
    eventparams[eventparams.size] = "id";
    eventparams[eventparams.size] = isdefined(var_b2b01f6f55f16552.tablet) && isdefined(var_b2b01f6f55f16552.tablet.index) ? string(var_b2b01f6f55f16552.tablet.index) : "invalid";
    if (isdefined(level.br_circle)) {
        circleindex = getintorzero(level.br_circle.circleindex);
    } else {
        circleindex = -1;
    }
    eventparams[eventparams.size] = "circle_index";
    eventparams[eventparams.size] = circleindex;
    eventparams[eventparams.size] = "type";
    if (getdvarint(@"hash_82bde055b11e6698", 0)) {
        eventparams[eventparams.size] = var_b2b01f6f55f16552.questcategory;
    } else {
        eventparams[eventparams.size] = var_b2b01f6f55f16552.type.ref;
    }
    player dlog_recordplayerevent("dlog_event_br_mission_start", eventparams);
    if (_branalytics_addeventallowed() && isdefined(var_b2b01f6f55f16552.missionid)) {
        branalytics_seteventdelayedstate("mission", var_b2b01f6f55f16552.missionid, -1);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e1c
// Size: 0x1de
function branalytics_missionend(var_b2b01f6f55f16552, var_89eddde3da46bc8d, results, var_ef08909f6cbf35fc) {
    if (!branalytics_validation()) {
        return;
    }
    dlog_recordevent("dlog_event_br_mission_end", [0:"id", 1:ter_op(isdefined(var_b2b01f6f55f16552.missionid), var_b2b01f6f55f16552.missionid, "invalid"), 2:"result", 3:ter_op(isdefined(var_b2b01f6f55f16552.result), var_b2b01f6f55f16552.result, "unknown"), 4:"reward_tier", 5:var_89eddde3da46bc8d, 6:"xp", 7:ter_op(isdefined(results["xp"]), results["xp"], 0), 8:"weapon_xp", 9:ter_op(isdefined(results["weapon_xp"]), results["weapon_xp"], 0), 10:"plunder", 11:ter_op(isdefined(results["plunder"]), results["plunder"], 0), 12:"num_teammates_awarded", 13:ter_op(isdefined(var_ef08909f6cbf35fc), var_ef08909f6cbf35fc, 0), 14:"type", 15:var_b2b01f6f55f16552.questcategory, 16:"end_state", 17:ter_op(isdefined(var_b2b01f6f55f16552.var_4048d341197bbe4b), var_b2b01f6f55f16552.var_4048d341197bbe4b, "invalid")]);
    if (_branalytics_addeventallowed() && isdefined(var_b2b01f6f55f16552.missionid)) {
        if (isdefined(var_b2b01f6f55f16552.result) && var_b2b01f6f55f16552.result == "success") {
            branalytics_seteventdelayedstate("mission", var_b2b01f6f55f16552.missionid, var_89eddde3da46bc8d);
        } else {
            branalytics_seteventdelayedstate("mission", var_b2b01f6f55f16552.missionid, -1);
        }
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6001
// Size: 0x24b
function function_1d6052577cd7738c(teaminfo, endreason, success) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    teammates = namespace_54d20dd0dd79277f::getfriendlyplayers(teaminfo.targetteam, 0);
    teammatecount = teammates.size;
    eventparams[eventparams.size] = "end_reason";
    eventparams[eventparams.size] = endreason;
    eventparams[eventparams.size] = "state_progress";
    eventparams[eventparams.size] = ter_op(istrue(success), 5, teaminfo.state);
    eventparams[eventparams.size] = "collected_beryllium";
    eventparams[eventparams.size] = istrue(teaminfo.var_876be3bc4df3a81d & namespace_6c622b52017c6808::function_2c126de0bdb9bfd5(namespace_6c622b52017c6808::function_6844602f3120e900("ber", 6)));
    eventparams[eventparams.size] = "collected_plutonium";
    eventparams[eventparams.size] = istrue(teaminfo.var_876be3bc4df3a81d & namespace_6c622b52017c6808::function_2c126de0bdb9bfd5(namespace_6c622b52017c6808::function_6844602f3120e900("plu", 6)));
    eventparams[eventparams.size] = "collected_tritium";
    eventparams[eventparams.size] = istrue(teaminfo.var_876be3bc4df3a81d & namespace_6c622b52017c6808::function_2c126de0bdb9bfd5(namespace_6c622b52017c6808::function_6844602f3120e900("tri", 6)));
    eventparams[eventparams.size] = "collected_gallium";
    eventparams[eventparams.size] = istrue(teaminfo.var_876be3bc4df3a81d & namespace_6c622b52017c6808::function_2c126de0bdb9bfd5(namespace_6c622b52017c6808::function_6844602f3120e900("gal", 6)));
    eventparams[eventparams.size] = "collected_deuterium";
    eventparams[eventparams.size] = istrue(teaminfo.var_876be3bc4df3a81d & namespace_6c622b52017c6808::function_2c126de0bdb9bfd5(namespace_6c622b52017c6808::function_6844602f3120e900("deu", 6)));
    eventparams[eventparams.size] = "collected_neptunium";
    eventparams[eventparams.size] = istrue(teaminfo.var_876be3bc4df3a81d & namespace_6c622b52017c6808::function_2c126de0bdb9bfd5(namespace_6c622b52017c6808::function_6844602f3120e900("nep", 6)));
    eventparams[eventparams.size] = "num_teammates";
    eventparams[eventparams.size] = teammatecount;
    foreach (player in teammates) {
        player dlog_recordplayerevent("dlog_event_br_elite_broken_arrow_end", eventparams);
    }
    var_4fd25c3d5a24b069 = istrue(success);
    _branalytics_addevent("elite_broken_arrow_end", (0, 0, 0), var_4fd25c3d5a24b069, endreason);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6253
// Size: 0x60
function function_f3c107faa06dc299(player, timeleft) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "time_until_detonation";
    eventparams[eventparams.size] = timeleft;
    player dlog_recordplayerevent("dlog_event_br_elite_broken_arrow_defuse", eventparams);
    _branalytics_addevent("elite_broken_arrow_defuse", player getorigin(), timeleft, "time_until_detonation", player);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62ba
// Size: 0x9a
function function_f36c99358d254ea9(player, element) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "element_id";
    eventparams[eventparams.size] = element.var_27de1507ed41f01e;
    eventparams[eventparams.size] = "time_from_spawn";
    eventparams[eventparams.size] = gettime() - element.spawntime;
    player dlog_recordplayerevent("dlog_event_br_elite_broken_arrow_element_collect", eventparams);
    _branalytics_addevent("elite_broken_arrow_element_collect", player getorigin(), element.spawntime, element.var_27de1507ed41f01e, player);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x635b
// Size: 0x60
function function_523b126aa6b63c7(player, var_436204fba69d256) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "time_from_bombsite_spawn";
    eventparams[eventparams.size] = var_436204fba69d256;
    player dlog_recordplayerevent("dlog_event_br_elite_broken_arrow_arm", eventparams);
    _branalytics_addevent("elite_broken_arrow_arm", player getorigin(), var_436204fba69d256, "time_from_bombsite_spawn", player);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63c2
// Size: 0x3e
function function_77814c1b523fd8a3(playercount) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "player_count";
    eventparams[eventparams.size] = playercount;
    dlog_recordevent("dlog_event_br_elite_broken_arrow_match_invalid", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6407
// Size: 0x2c
function function_5e512f1540e0e8a3(origin, state) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("initialize_fortress_kiosk", origin, state);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x643a
// Size: 0x36
function function_a82f819fddc8e099(origin, data, player) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("kiosk_unusable_for_player", origin, 0, data, player);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6477
// Size: 0x2c
function function_1fe361a65f4321b1(origin, state) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("remove_kiosk", origin, state);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64aa
// Size: 0x2c
function function_d647f8b91ee72e68(origin, state) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("fortress_rejected", origin, state);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64dd
// Size: 0x2c
function function_cdf333517613e68d(origin, state) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("spawn_blacksite", origin, state);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6510
// Size: 0x2c
function function_a9fe2bed8ed8b965(origin, state) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("spawn_fortress", origin, state);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6543
// Size: 0x2c
function function_ce58220fbd0824be(origin, state) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("unlock_all_blacksite_doors", origin, state);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6576
// Size: 0x2c
function function_31406a57e628c3fe(origin, state) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("unlock_all_fortress_interior_doors", origin, state);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65a9
// Size: 0x2d
function function_aaf1156bacf6654e(origin, data) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("spawn_boss", origin, 0, data);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65dd
// Size: 0x23
function function_5c71b11655c95436(origin) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("unlock_first_blacksite_door", origin);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6607
// Size: 0x23
function function_257618a8537d8d10(origin) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("stronghold_captured", origin);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6631
// Size: 0x2d
function function_2cc353fdc725f4b4(origin, data) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("fortress_loot_zone", origin, 0, data);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6665
// Size: 0x2d
function function_ea157b4b9615b2df(origin, data) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("fortress_undefined_zonebounds", origin, 0, data);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6699
// Size: 0x2d
function function_41082d2a8cf1ee28(origin, data) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("fortress_mismatched_zonebounds", origin, 0, data);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66cd
// Size: 0x3b
function function_3461c9a3dbbccecf(interrogator, state, data) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("interrogation", interrogator getorigin(), state, data, interrogator);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x670f
// Size: 0x37
function function_82b50d847253078f(victim, state) {
    if (!branalytics_validation()) {
        return;
    }
    _branalytics_addevent("interrogation_victim", victim getorigin(), state, "", victim);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x674d
// Size: 0x62
function branalytics_teameliminated(team, teamplacement) {
    if (!branalytics_validation()) {
        return;
    }
    dlog_recordevent("dlog_event_br_team_eliminated", [0:"team", 1:team, 2:"placement", 3:teamplacement, 4:"survival_time", 5:gettime() - level.starttime]);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67b6
// Size: 0x71
function function_cb3b3cbf2d1ac3f3(var_5746d9f038b58234, weaponXP, lifeindex, weaponname, player, type) {
    if (!branalytics_validation()) {
        return;
    }
    var_b4de36cb26159194 = "xp_event";
    /#
        var_b4de36cb26159194 = var_b4de36cb26159194 + "end_reason" + function_3c8848a3a11b2553(type);
    #/
    _branalytics_addevent(var_b4de36cb26159194, (var_5746d9f038b58234, weaponXP, 0), lifeindex, weaponname, player);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x682e
// Size: 0x30
function branalytics_publiceventstarted(eventtype) {
    if (!branalytics_validation()) {
        return;
    }
    dlog_recordevent("dlog_event_br_public_event_start", [0:"type", 1:eventtype]);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6865
// Size: 0x30
function branalytics_publiceventended(eventtype) {
    if (!branalytics_validation()) {
        return;
    }
    dlog_recordevent("dlog_event_br_public_event_end", [0:"type", 1:eventtype]);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x689c
// Size: 0x9a
function _branalytics_header(player, var_44375e4d2a4b781b) {
    /#
        assert(!isdefined(var_44375e4d2a4b781b) || isstring(var_44375e4d2a4b781b));
    #/
    header = [];
    if (!isstring(var_44375e4d2a4b781b)) {
        var_44375e4d2a4b781b = "player";
    }
    header = _branalytics_headerplayer(header, player, var_44375e4d2a4b781b);
    if (isdefined(level.br_circle)) {
        circleindex = getintorzero(level.br_circle.circleindex);
    } else {
        circleindex = -1;
    }
    header[header.size] = "circle_index";
    header[header.size] = circleindex;
    return header;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x693e
// Size: 0x18b
function _branalytics_headerplayer(header, player, var_44375e4d2a4b781b) {
    /#
        assert(isarray(header));
    #/
    /#
        assert(!isdefined(var_44375e4d2a4b781b) || isstring(var_44375e4d2a4b781b));
    #/
    if (!isstring(var_44375e4d2a4b781b)) {
        var_44375e4d2a4b781b = "player";
    }
    /#
        assert(isdefined(player.origin) && isfloat(player.origin[0]));
    #/
    /#
        assert(isdefined(player.origin) && isfloat(player.origin[1]));
    #/
    /#
        assert(isdefined(player.origin) && isfloat(player.origin[2]));
    #/
    /#
        assert(isfloat(getplayerpitch(player)));
    #/
    /#
        assert(isfloat(getplayeryaw(player)));
    #/
    header[header.size] = var_44375e4d2a4b781b + "_x";
    header[header.size] = player.origin[0];
    header[header.size] = var_44375e4d2a4b781b + "_y";
    header[header.size] = player.origin[1];
    header[header.size] = var_44375e4d2a4b781b + "_z";
    header[header.size] = player.origin[2];
    header[header.size] = var_44375e4d2a4b781b + "_pitch";
    header[header.size] = getplayerpitch(player);
    header[header.size] = var_44375e4d2a4b781b + "_yaw";
    header[header.size] = getplayeryaw(player);
    return header;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ad1
// Size: 0x1b4
function _branalytics_headerplayerposrow(params, players) {
    /#
        assert(isarray(params));
    #/
    params[params.size] = "living_player_pos";
    var_916910d71143da1d = [];
    foreach (player in players) {
        /#
            assert(isdefined(player.origin) && isfloat(player.origin[0]));
        #/
        /#
            assert(isdefined(player.origin) && isfloat(player.origin[1]));
        #/
        /#
            assert(isdefined(player.origin) && isfloat(player.origin[2]));
        #/
        /#
            assert(isfloat(getplayerpitch(player)));
        #/
        /#
            assert(isfloat(getplayeryaw(player)));
        #/
        var_916910d71143da1d[var_916910d71143da1d.size] = "x";
        var_916910d71143da1d[var_916910d71143da1d.size] = player.origin[0];
        var_916910d71143da1d[var_916910d71143da1d.size] = "y";
        var_916910d71143da1d[var_916910d71143da1d.size] = player.origin[1];
        var_916910d71143da1d[var_916910d71143da1d.size] = "z";
        var_916910d71143da1d[var_916910d71143da1d.size] = player.origin[2];
        var_916910d71143da1d[var_916910d71143da1d.size] = "pitch";
        var_916910d71143da1d[var_916910d71143da1d.size] = getplayerpitch(player);
        var_916910d71143da1d[var_916910d71143da1d.size] = "yaw";
        var_916910d71143da1d[var_916910d71143da1d.size] = getplayeryaw(player);
    }
    params[params.size] = var_916910d71143da1d;
    return params;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c8d
// Size: 0x1c
function safecheckstring(data) {
    if (isdefined(data)) {
        return data;
    } else {
        return "empty";
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cb0
// Size: 0x26
function safecheckweapon(data) {
    if (isdefined(data)) {
        return data.basename;
    } else {
        return "empty";
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cdd
// Size: 0x37
function function_7069250582d42c1a(data, var_45f5c29db0c1fd9b, var_45d1b89db0996ce5) {
    if (isdefined(var_45f5c29db0c1fd9b)) {
        if (data < var_45f5c29db0c1fd9b) {
            return var_45f5c29db0c1fd9b;
        }
    }
    if (isdefined(var_45d1b89db0996ce5)) {
        if (data > var_45d1b89db0996ce5) {
            return var_45d1b89db0996ce5;
        }
    }
    return data;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d1c
// Size: 0x40
function function_783acbcf408fa927(data) {
    if (isdefined(data) && isnumber(data)) {
        var_e1c5185f7e31054e = -128;
        var_e1a10a5f7e086bcc = 127;
        return function_7069250582d42c1a(data, var_e1c5185f7e31054e, var_e1a10a5f7e086bcc);
    }
    return 0;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d64
// Size: 0x42
function function_f8cfd7cafbc5981e(data) {
    if (isdefined(data) && isnumber(data)) {
        var_e1c5185f7e31054e = -32768;
        var_e1a10a5f7e086bcc = 32767;
        return function_7069250582d42c1a(data, var_e1c5185f7e31054e, var_e1a10a5f7e086bcc);
    }
    return 0;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dae
// Size: 0x42
function function_f8d8c3cafbcf8ad0(data) {
    if (isdefined(data) && isnumber(data)) {
        var_e1c5185f7e31054e = undefined;
        var_e1a10a5f7e086bcc = 2147483647;
        return function_7069250582d42c1a(data, var_e1c5185f7e31054e, var_e1a10a5f7e086bcc);
    }
    return 0;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6df8
// Size: 0x1e
function function_f8cb57cafbc088c7(data) {
    if (isdefined(data) && isnumber(data)) {
        return data;
    }
    return 0;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e1e
// Size: 0x3f
function function_3fe52b08c657d074(data) {
    if (isdefined(data) && isnumber(data)) {
        var_e1c5185f7e31054e = 0;
        var_e1a10a5f7e086bcc = 255;
        return function_7069250582d42c1a(data, var_e1c5185f7e31054e, var_e1a10a5f7e086bcc);
    }
    return 0;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e65
// Size: 0x40
function function_dcaf784c32fdf05b(data) {
    if (isdefined(data) && isnumber(data)) {
        var_e1c5185f7e31054e = 0;
        var_e1a10a5f7e086bcc = 65535;
        return function_7069250582d42c1a(data, var_e1c5185f7e31054e, var_e1a10a5f7e086bcc);
    }
    return 0;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ead
// Size: 0x42
function function_dcb7ec4c3306db25(data) {
    if (isdefined(data) && isnumber(data)) {
        var_e1c5185f7e31054e = 0;
        var_e1a10a5f7e086bcc = 4294967295;
        return function_7069250582d42c1a(data, var_e1c5185f7e31054e, var_e1a10a5f7e086bcc);
    }
    return 0;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6ef7
// Size: 0x1e
function function_dca1e84c32ee9f26(data) {
    if (isdefined(data) && isnumber(data)) {
        return data;
    }
    return 0;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f1d
// Size: 0x2d
function safedivide(data, var_f1563935aeeb5199) {
    if (!isdefined(var_f1563935aeeb5199) || var_f1563935aeeb5199 <= 0) {
        return (data / 1);
    } else {
        return (data / var_f1563935aeeb5199);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f51
// Size: 0x271
function branalytics_endgame() {
    if (_branalytics_addeventallowed()) {
        if (isdefined(level.delayedeventtypes["vehicle"])) {
            foreach (evt in level.delayedeventtypes["vehicle"]) {
                if (!isdefined(evt.ent)) {
                    evt.state = 1;
                } else if (distancesquared(evt.origin, evt.ent.origin) > squared(1000)) {
                    evt.state = 1;
                }
            }
        }
        if (isdefined(level.br_armory_kiosk)) {
            foreach (kiosk in level.br_armory_kiosk.scriptables) {
                state = 0;
                if (istrue(kiosk.visible)) {
                    state = 1;
                }
                time = 0;
                entnum = -1;
                function_bb96ecd805545b2e("kiosk", kiosk.origin, state, time, "", entnum);
            }
        }
        foreach (var_bafef05479604422 in level.delayedeventtypes) {
            foreach (var_ce203d78f57223de in var_bafef05479604422) {
                if (isdefined(var_ce203d78f57223de)) {
                    function_bb96ecd805545b2e(var_ce203d78f57223de.type, var_ce203d78f57223de.origin, var_ce203d78f57223de.state, var_ce203d78f57223de.time, var_ce203d78f57223de.data, -1);
                }
            }
        }
    }
    if (1) {
        analyticswritecsv();
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71c9
// Size: 0x3a
function function_b9c4d225e9548d8b() {
    if (!isdefined(level.prematchendtime)) {
        return 0;
    }
    if (!istrue(level.var_47be1d1bb3b425a6)) {
        return 0;
    }
    if (isplayer(self)) {
        return 1;
    }
    if (isagent(self)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x720b
// Size: 0x190
function function_90d7bfd05ed0fbe9() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("brAnalytics_agent_killed");
    entnum = self getentitynumber();
    state = 0;
    data = "";
    nextstate = 0;
    var_a81180fe2df07c44 = "";
    while (1) {
        wait(30);
        if (!isalive(self)) {
            continue;
        }
        if (isdefined(self.gulag) && self.gulag == 1) {
            continue;
        }
        if (isagent(self)) {
            if (isdefined(self.enemy)) {
                nextstate = self.enemy getentitynumber();
            } else {
                nextstate = 0;
            }
            if (isdefined(self.var_f8bc7ecdd324dd79)) {
                var_a81180fe2df07c44 = self.var_f8bc7ecdd324dd79.behavior;
            } else {
                var_a81180fe2df07c44 = "";
            }
        } else if (isplayer(self)) {
            if (isdefined(self.plundercount)) {
                nextstate = int(self.plundercount);
            }
            if (isdefined(self.team)) {
                var_a81180fe2df07c44 = self.team;
            }
        }
        time = _branalytics_geteventtimestamp();
        if (self.var_d5c444a3fbb7d030 < time - 30 || state != nextstate || data != var_a81180fe2df07c44) {
            self.var_d5c444a3fbb7d030 = time;
            state = nextstate;
            data = var_a81180fe2df07c44;
            function_bb96ecd805545b2e("breadcrumb", self.origin, state, time, data, entnum);
        }
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73a2
// Size: 0x42
function function_f183d915239368b7(time) {
    if (!function_b9c4d225e9548d8b()) {
        return;
    }
    if (!isdefined(self.var_d5c444a3fbb7d030)) {
        self.var_d5c444a3fbb7d030 = time;
        thread function_90d7bfd05ed0fbe9();
    } else {
        self.var_d5c444a3fbb7d030 = time;
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73eb
// Size: 0x2d
function function_8e6652060309b9db(origin, data) {
    if (!_branalytics_addeventallowed()) {
        return;
    }
    _branalytics_addevent("agent_alloc", origin, 0, data);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x741f
// Size: 0x76
function function_252e45fc60e2a731(ent) {
    if (!isdefined(ent) || !_branalytics_addeventallowed()) {
        return;
    }
    state = 0;
    if (isdefined(ent.category) && ent.category == "gulag") {
        state = 1;
    }
    data = ent.agent_type;
    function_eefaa754fc189980("agent_spawn", ent, state, data);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x749c
// Size: 0x1a3
function function_e3aef4fcb303cff(ent, var_8227176423f57171, attacker) {
    if (!isdefined(ent) || !_branalytics_addeventallowed()) {
        return;
    }
    ent notify("brAnalytics_agent_killed");
    if (var_8227176423f57171) {
        var_9c46fc77656f0e4b = "dormancy";
    } else if (!isdefined(attacker) || !(isagent(attacker) || isplayer(attacker)) || !isdefined(attacker.classname) || attacker.classname == "worldspawn" || attacker.classname == "script_vehicle" || attacker.classname == "script_model" || attacker.classname == "misc_turret" || attacker.classname == "misc_samsite" || attacker.classname == "trigger_hurt" || attacker.classname == "trigger_multiple" || attacker.classname == "script_origin") {
        var_9c46fc77656f0e4b = "world";
    } else {
        attacker_weapon = attacker getcurrentweapon();
        var_9c46fc77656f0e4b = attacker_weapon.basename;
    }
    state = 0;
    if (isdefined(var_8227176423f57171) && var_8227176423f57171 == 1) {
        state = 1;
    }
    if (isdefined(level.var_91abb8090412cc15) && var_9c46fc77656f0e4b != "world" && var_9c46fc77656f0e4b != "dormancy") {
        [[ level.var_91abb8090412cc15 ]](ent, attacker);
    }
    function_eefaa754fc189980("agent_down", ent, state, var_9c46fc77656f0e4b);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7646
// Size: 0x2c
function function_5bd0a2d95d2e42a5(origin, state) {
    if (!_branalytics_addeventallowed()) {
        return;
    }
    _branalytics_addevent("stronghold_spawn", origin, state);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7679
// Size: 0x23
function function_f3cff8f31f5cdbf4(origin) {
    if (!_branalytics_addeventallowed()) {
        return;
    }
    _branalytics_addevent("stronghold_despawn", origin);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76a3
// Size: 0xb1
function function_97ec7995c587bf25() {
    if (!getdvarint(@"hash_ec7375cc2a0ca633", 1)) {
        return;
    }
    level.var_536cd4e9de6c69e = [];
    if (!namespace_71073fa38f11492::isbrgametypefuncdefined("onPickupTakenIntoBackpack")) {
        namespace_71073fa38f11492::registerbrgametypefunc("onPickupTakenIntoBackpack", &function_a9c8b07af07f6f06);
    }
    level.var_e17717792ade97b2 = &function_35e00e890dfee7b4;
    level.var_3afacc0c3b10b7fe = &function_cd1564ca587bcd0d;
    level.var_722da533ca224c88 = &function_2d1b322de840d5f1;
    level.var_91abb8090412cc15 = &function_179b94929cc4c682;
    level.var_d127a6a056d31d74 = &function_16a3f35cbab3325a;
    level.var_18889818bace4953 = &function_99571774beb8163b;
    if (namespace_76a219af07c28c13::function_6934349b7823d888()) {
        namespace_76a219af07c28c13::registerTeamAssimilateCallback(&function_d584faafa7c6c60c);
    }
    thread function_c116ff94ef26d3b0();
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x775b
// Size: 0x9b
function function_c116ff94ef26d3b0() {
    level waittill("game_ended");
    if (isdefined(level.var_f1073fbd45b59a06.var_df987907a483df89) && level.var_f1073fbd45b59a06.var_df987907a483df89.size > 0) {
        foreach (fortress in level.var_f1073fbd45b59a06.var_df987907a483df89) {
            fortress function_df74213f854433f9();
        }
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77fd
// Size: 0x25d
function function_16a3f35cbab3325a(player) {
    if (!isplayer(player)) {
        return;
    }
    if (!isdefined(self.fortress)) {
        return;
    }
    if (!player function_82043961042627e2(self.fortress)) {
        return;
    }
    if (isdefined(player.var_2c2f43dd4153f5a) && isdefined(player.var_2c2f43dd4153f5a.fortress)) {
        if (player.var_2c2f43dd4153f5a.fortress == self.fortress) {
            if (istrue(player.var_2c2f43dd4153f5a.var_e6a3b7922938d197)) {
                player.var_2c2f43dd4153f5a.var_e6a3b7922938d197 = 0;
            }
            return;
        } else {
            proxtrigger = player.var_2c2f43dd4153f5a.fortress.var_aac94ce6a0278a36;
            if (isdefined(proxtrigger)) {
                var_f9419ef8d4e4b8c1 = function_7d3c7b86d9efcddb(player, self, proxtrigger);
                if (!isdefined(var_f9419ef8d4e4b8c1) || var_f9419ef8d4e4b8c1 != self) {
                    return;
                }
            }
        }
    } else {
        var_22547840e146c1e = undefined;
        var_eb5819f16ab7d1a6 = undefined;
        foreach (sh in level.var_f1073fbd45b59a06.var_df987907a483df89) {
            if (!isdefined(sh) || !player function_82043961042627e2(sh)) {
                continue;
            }
            dist = undefined;
            if (isdefined(sh.var_e1dd7bed632a13c3) && isdefined(sh.var_e1dd7bed632a13c3.origin)) {
                dist = function_5b8de0654b1464a5(player, sh.var_e1dd7bed632a13c3);
            } else if (isdefined(sh.var_aac94ce6a0278a36) && isdefined(sh.var_aac94ce6a0278a36.origin)) {
                dist = function_5b8de0654b1464a5(player, sh.var_aac94ce6a0278a36);
            }
            if (isdefined(dist) && (!isdefined(var_22547840e146c1e) || dist < var_eb5819f16ab7d1a6)) {
                var_22547840e146c1e = sh;
                var_eb5819f16ab7d1a6 = dist;
            }
        }
        if (isdefined(var_22547840e146c1e)) {
            player function_3a1f84a4281d12f9(var_22547840e146c1e);
        }
        return;
    }
    player function_3a1f84a4281d12f9(self.fortress);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7a61
// Size: 0xff
function private function_3a1f84a4281d12f9(fortress, timestamp) {
    if (isdefined(self.var_9fcd93eb0b17894d) && array_contains(self.var_9fcd93eb0b17894d, fortress)) {
        return;
    }
    if (isdefined(self.var_2c2f43dd4153f5a) && isdefined(self.var_2c2f43dd4153f5a.fortress)) {
        if (self.var_2c2f43dd4153f5a.fortress == fortress) {
            if (istrue(self.var_2c2f43dd4153f5a.var_e6a3b7922938d197)) {
                self.var_2c2f43dd4153f5a.var_e6a3b7922938d197 = 0;
            }
            return;
        } else {
            function_708329f09283076("entered_different_stronghold", 0);
        }
    }
    self.var_2c2f43dd4153f5a = spawnstruct();
    self.var_2c2f43dd4153f5a.fortress = fortress;
    self.var_2c2f43dd4153f5a.var_ae4763248a440471 = 1;
    if (!isdefined(timestamp)) {
        timestamp = gettime();
    }
    fortress function_36fc8bc7e3143858(self, timestamp);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7b67
// Size: 0xfe
function private function_708329f09283076(reason, success, timestamp) {
    if (!isdefined(self.var_2c2f43dd4153f5a) || !isdefined(self.var_2c2f43dd4153f5a.fortress)) {
        return;
    }
    fortress = self.var_2c2f43dd4153f5a.fortress;
    if (istrue(self.var_2c2f43dd4153f5a.var_e6a3b7922938d197)) {
        self.var_2c2f43dd4153f5a.var_e6a3b7922938d197 = 0;
    }
    fortress function_17f1328aa045b61d(self, reason, success, timestamp);
    self.var_2c2f43dd4153f5a = undefined;
    if (isdefined(fortress.var_1b0d1620df6b0cfe[self.team].activeplayers) && fortress.var_1b0d1620df6b0cfe[self.team].activeplayers.size <= 0) {
        fortress function_28e81a288cb740fd(self.team, success);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c6c
// Size: 0x6f
function function_82043961042627e2(fortress) {
    if (!namespace_bd614c3c2275579a::function_397209b257df87a()) {
        return 0;
    }
    if (isdefined(fortress.var_4756733ecc825a2) && fortress.var_4756733ecc825a2 == self.team) {
        return 0;
    }
    if (istrue(fortress.var_933f9685674999fb)) {
        return (istrue(fortress.unlocked) && !istrue(fortress.captured));
    }
    return 1;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ce3
// Size: 0xe9
function function_7d3c7b86d9efcddb(player, var_906f8a71b90df05e, var_906f8971b90dee2b) {
    /#
        assert(isdefined(player));
    #/
    if (!isdefined(var_906f8a71b90df05e)) {
        return var_906f8971b90dee2b;
    } else if (!isdefined(var_906f8971b90dee2b)) {
        return var_906f8a71b90df05e;
    }
    var_585d11c8b1db05fa = ispointinvolume(player.origin, var_906f8a71b90df05e);
    var_585d10c8b1db03c7 = ispointinvolume(player.origin, var_906f8971b90dee2b);
    if (!var_585d11c8b1db05fa) {
        if (!var_585d10c8b1db03c7) {
            return undefined;
        } else {
            return var_906f8971b90dee2b;
        }
    } else if (!var_585d10c8b1db03c7) {
        return var_906f8a71b90df05e;
    }
    var_75837491258e8569 = distance(player.origin, var_906f8a71b90df05e.origin);
    var_4f2883195384eecc = distance(player.origin, var_906f8971b90dee2b.origin);
    if (var_4f2883195384eecc > var_75837491258e8569) {
        return var_906f8a71b90df05e;
    } else if (var_75837491258e8569 > var_4f2883195384eecc) {
        return var_906f8971b90dee2b;
    }
    return undefined;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dd4
// Size: 0x5c
function function_5b8de0654b1464a5(player, volume) {
    if (isdefined(player) && isdefined(player.origin) && isdefined(volume) && isdefined(volume.origin)) {
        return distance(player.origin, volume.origin);
    }
    return undefined;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e38
// Size: 0x7b
function function_99571774beb8163b(player) {
    if (!isplayer(player)) {
        return;
    }
    if (isdefined(player.var_2c2f43dd4153f5a)) {
        if (istrue(player.var_2c2f43dd4153f5a.var_e6a3b7922938d197)) {
            return;
        }
        player.var_2c2f43dd4153f5a.var_e6a3b7922938d197 = 1;
        player.var_2c2f43dd4153f5a.var_414a62fafeb49300 = gettime();
        thread function_e751288a23e6e9ea(player);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eba
// Size: 0xab
function function_e751288a23e6e9ea(player) {
    player endon("stop_timeout");
    player endon("death_or_disconnect");
    while (isdefined(player.var_2c2f43dd4153f5a) && istrue(player.var_2c2f43dd4153f5a.var_e6a3b7922938d197)) {
        currenttime = gettime();
        if (currenttime - player.var_2c2f43dd4153f5a.var_414a62fafeb49300 >= getdvarint(@"hash_f09a64ced68b366e", 5000) && istrue(player.var_2c2f43dd4153f5a.var_e6a3b7922938d197)) {
            function_cf0f7529918e7772(player);
            return;
        }
        wait(0.2);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f6c
// Size: 0x9e
function function_4eb467c8f2a4c7ae(damagedata) {
    victim = damagedata.victim;
    if (isdefined(victim.modifiers) && istrue(victim.modifiers["victiminstronghold"])) {
        var_831b0df5dbb687cf = namespace_9823ee6035594d67::function_c0a211a69f5f8f2f(victim.origin);
        if (isdefined(var_831b0df5dbb687cf)) {
            if (!isdefined(var_831b0df5dbb687cf.var_b5ad6ca10e5301d7)) {
                var_831b0df5dbb687cf.var_b5ad6ca10e5301d7 = 0;
            }
            var_831b0df5dbb687cf.var_b5ad6ca10e5301d7++;
            victim function_708329f09283076("killed", 0);
        }
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8011
// Size: 0x1a
function function_cf0f7529918e7772(player) {
    player function_708329f09283076("timeout", 0);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8032
// Size: 0x79
function function_179b94929cc4c682(ent, attacker) {
    if (!isdefined(ent)) {
        return;
    }
    agentStruct = namespace_14d36171baccf528::agentPers_getAgentPersData(ent, "agentStruct");
    if (isdefined(agentStruct)) {
        fortress = agentStruct.fortress;
        if (isdefined(fortress)) {
            if (!isdefined(fortress.agentskilled)) {
                fortress.agentskilled = 0;
            }
            fortress.agentskilled++;
        }
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80b2
// Size: 0xec
function function_a9c8b07af07f6f06(pickupent) {
    if (namespace_cb965d2f71fefddc::function_2d86ba79a58bb62(pickupent.scriptablename)) {
        fortress = undefined;
        blacksite = undefined;
        if (isdefined(pickupent.instance) && isdefined(pickupent.instance.var_a88417917d64076c) && isdefined(pickupent.instance.blacksite)) {
            fortress = pickupent.instance.var_a88417917d64076c;
            blacksite = pickupent.instance.blacksite;
        } else {
            fortress = pickupent.var_a88417917d64076c;
            blacksite = pickupent.blacksite;
        }
        if (isdefined(fortress)) {
            fortress.var_ea7accbb6edc9b55 = 1;
        }
        if (isdefined(blacksite)) {
            blacksite.var_ea7accbb6edc9b55 = 1;
        }
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81a5
// Size: 0x57
function function_2d1b322de840d5f1(door, player) {
    stronghold = door.fortress;
    if (istrue(stronghold.var_933f9685674999fb) && !isdefined(stronghold.var_606f47fe5a7a935d)) {
        stronghold.var_606f47fe5a7a935d = 1;
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8203
// Size: 0x22b
function function_cd1564ca587bcd0d(teamname, success) {
    if (!isdefined(self.var_ab822267aa74c573)) {
        self.var_ab822267aa74c573 = istrue(success);
    }
    task = self.task;
    teams = function_a86bde7020ad5a77(task);
    if (!isdefined(teams) || teams.size <= 0) {
        teams = [0:teamname];
    }
    foreach (team in teams) {
        if (isdefined(team) && isdefined(self.var_1b0d1620df6b0cfe) && isdefined(self.var_1b0d1620df6b0cfe[team]) && isdefined(self.var_1b0d1620df6b0cfe[team].activeplayers)) {
            teammembers = level.teamdata[team]["players"];
            reason = undefined;
            if (istrue(success) && team == teamname) {
                reason = "mission_success";
            } else if (istrue(success)) {
                reason = "mission_completed_by_another_team";
            } else {
                reason = "mission_failed";
            }
            foreach (player in teammembers) {
                if (istrue(success)) {
                    if (team == teamname || istrue(self.var_933f9685674999fb)) {
                        if (!isdefined(player.var_9fcd93eb0b17894d)) {
                            player.var_9fcd93eb0b17894d = [];
                        }
                        player.var_9fcd93eb0b17894d[player.var_9fcd93eb0b17894d.size] = self;
                    }
                }
                if (!isdefined(self.var_1b0d1620df6b0cfe[team])) {
                    break;
                }
                if (array_contains(self.var_1b0d1620df6b0cfe[team].activeplayers, player)) {
                    player function_708329f09283076(reason, istrue(success) && team == teamname);
                }
            }
        }
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8435
// Size: 0xfe
function function_35e00e890dfee7b4(teamname, success) {
    teammembers = level.teamdata[teamname]["players"];
    reason = undefined;
    if (istrue(success)) {
        reason = "mission_success";
    } else {
        reason = "mission_failed";
    }
    foreach (player in teammembers) {
        if (istrue(success)) {
            if (!isdefined(player.var_9fcd93eb0b17894d)) {
                player.var_9fcd93eb0b17894d = [];
            }
            player.var_9fcd93eb0b17894d[player.var_9fcd93eb0b17894d.size] = self;
        }
        if (array_contains(self.var_1b0d1620df6b0cfe[teamname].activeplayers, player)) {
            player function_708329f09283076(reason, istrue(success));
        }
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x853a
// Size: 0x108
function private function_a86bde7020ad5a77(task) {
    if (isdefined(task.teams) && task.teams.size > 0) {
        return task.teams;
    }
    teams = [];
    foreach (player in level.players) {
        if (!array_contains(teams, player.team) && isdefined(player.var_2c2f43dd4153f5a) && isdefined(player.var_2c2f43dd4153f5a.fortress) && player.var_2c2f43dd4153f5a.fortress.task == task) {
            teams[teams.size] = player.team;
        }
    }
    return teams;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x864a
// Size: 0x175
function private function_d584faafa7c6c60c(player, oldteam, newteam) {
    if (isdefined(player.var_2c2f43dd4153f5a) && isdefined(player.var_2c2f43dd4153f5a.fortress)) {
        fortress = player.var_2c2f43dd4153f5a.fortress;
        if (isdefined(fortress.var_1b0d1620df6b0cfe) && array_contains_key(fortress.var_1b0d1620df6b0cfe, oldteam)) {
            fortress function_17f1328aa045b61d(self, "assimilation", 0, undefined, oldteam);
            if (isdefined(fortress.var_1b0d1620df6b0cfe[oldteam].activeplayers) && fortress.var_1b0d1620df6b0cfe[oldteam].activeplayers.size <= 0) {
                if (isdefined(fortress.var_1b0d1620df6b0cfe[oldteam].var_5f8fc154303502fa) && (fortress.var_1b0d1620df6b0cfe[oldteam].var_5f8fc154303502fa.size > 1 || fortress.var_1b0d1620df6b0cfe[oldteam].var_5f8fc154303502fa.size == 1 && fortress.var_1b0d1620df6b0cfe[oldteam].var_5f8fc154303502fa[0] != player)) {
                    fortress function_28e81a288cb740fd(oldteam, 0);
                } else {
                    fortress.var_1b0d1620df6b0cfe[oldteam] = undefined;
                }
            }
        }
        fortress function_36fc8bc7e3143858(player, undefined, "assimilation");
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x87c6
// Size: 0x28e
function private function_36fc8bc7e3143858(player, timestamp, reason) {
    fortress = self;
    if (!isdefined(fortress.var_1b0d1620df6b0cfe)) {
        fortress.var_1b0d1620df6b0cfe = [];
    }
    fortress function_3a3fa57e7d5a15bc(player.team);
    if (!array_contains(fortress.var_1b0d1620df6b0cfe[player.team].var_5f8fc154303502fa, player)) {
        fortress.var_1b0d1620df6b0cfe[player.team].var_5f8fc154303502fa[fortress.var_1b0d1620df6b0cfe[player.team].var_5f8fc154303502fa.size] = player;
    }
    if (!array_contains(fortress.var_1b0d1620df6b0cfe[player.team].activeplayers, player)) {
        fortress.var_1b0d1620df6b0cfe[player.team].activeplayers[fortress.var_1b0d1620df6b0cfe[player.team].activeplayers.size] = player;
    }
    if (!isdefined(fortress.var_1b0d1620df6b0cfe[player.team].var_93fa0afa04ae392f)) {
        fortress.var_1b0d1620df6b0cfe[player.team].var_93fa0afa04ae392f = [];
    }
    var_11074d7853cc966 = spawnstruct();
    var_11074d7853cc966.unoid = player function_7a32b0201993d7f7();
    var_11074d7853cc966.type = "attempt_enter";
    if (isdefined(reason)) {
        var_11074d7853cc966.reason = reason;
    } else {
        var_11074d7853cc966.reason = "enter_volume";
    }
    if (isdefined(timestamp)) {
        var_11074d7853cc966.timestamp = timestamp;
    } else {
        var_11074d7853cc966.timestamp = gettime();
    }
    if (!isdefined(fortress.var_1b0d1620df6b0cfe[player.team].var_93fa0afa04ae392f)) {
        fortress.var_1b0d1620df6b0cfe[player.team].var_93fa0afa04ae392f = [];
    }
    fortress.var_1b0d1620df6b0cfe[player.team].var_93fa0afa04ae392f[fortress.var_1b0d1620df6b0cfe[player.team].var_93fa0afa04ae392f.size] = var_11074d7853cc966;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a5b
// Size: 0x1d0
function private function_17f1328aa045b61d(player, reason, success, timestamp, team) {
    fortress = self;
    if (!isdefined(team)) {
        team = player.team;
    }
    if (!isdefined(fortress.var_1b0d1620df6b0cfe)) {
        fortress.var_1b0d1620df6b0cfe = [];
    }
    if (!array_contains_key(fortress.var_1b0d1620df6b0cfe, team)) {
        fortress.var_1b0d1620df6b0cfe[team] = spawnstruct();
    }
    if (isdefined(fortress.var_1b0d1620df6b0cfe[team].activeplayers) && array_contains(fortress.var_1b0d1620df6b0cfe[team].activeplayers, player)) {
        fortress.var_1b0d1620df6b0cfe[team].activeplayers = array_remove(fortress.var_1b0d1620df6b0cfe[team].activeplayers, player);
    }
    var_11074d7853cc966 = spawnstruct();
    var_11074d7853cc966.unoid = player function_7a32b0201993d7f7();
    var_11074d7853cc966.type = "attempt_exit";
    var_11074d7853cc966.reason = reason;
    if (isdefined(timestamp)) {
        var_11074d7853cc966.timestamp = timestamp;
    } else {
        var_11074d7853cc966.timestamp = gettime();
    }
    if (!isdefined(fortress.var_1b0d1620df6b0cfe[team].var_93fa0afa04ae392f)) {
        fortress.var_1b0d1620df6b0cfe[team].var_93fa0afa04ae392f = [];
    }
    fortress.var_1b0d1620df6b0cfe[team].var_93fa0afa04ae392f[fortress.var_1b0d1620df6b0cfe[team].var_93fa0afa04ae392f.size] = var_11074d7853cc966;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c32
// Size: 0x10a
function function_3a3fa57e7d5a15bc(team) {
    fortress = self;
    if (!isdefined(fortress.var_1b0d1620df6b0cfe)) {
        fortress.var_1b0d1620df6b0cfe = [];
    }
    if (array_contains_key(fortress.var_1b0d1620df6b0cfe, team)) {
        return;
    }
    var_2838f16e236f9729 = spawnstruct();
    var_2838f16e236f9729.activeplayers = [];
    var_2838f16e236f9729.fortress = string(fortress.name);
    var_2838f16e236f9729.starttime = gettime();
    var_2838f16e236f9729.endtime = undefined;
    var_2838f16e236f9729.team = team;
    var_2838f16e236f9729.var_5f8fc154303502fa = [];
    var_2838f16e236f9729.mission = fortress.task.ref;
    if (isdefined(fortress.var_ab822267aa74c573)) {
        var_2838f16e236f9729.mission = "secondary_objective";
    }
    fortress.var_1b0d1620df6b0cfe[team] = var_2838f16e236f9729;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d43
// Size: 0xf9
function function_28e81a288cb740fd(team, success) {
    /#
        assert(isdefined(team) && array_contains_key(self.var_1b0d1620df6b0cfe, team));
    #/
    if (!isdefined(self.attempts)) {
        self.attempts = 0;
    }
    self.attempts++;
    if (istrue(success)) {
        if (!isdefined(self.successes)) {
            self.successes = 0;
        }
        self.successes++;
    } else {
        if (!isdefined(self.failures)) {
            self.failures = 0;
        }
        self.failures++;
    }
    var_670e5879926b51ef = self.var_1b0d1620df6b0cfe[team];
    var_670e5879926b51ef.endtime = gettime();
    var_670e5879926b51ef.success = success;
    var_670e5879926b51ef.teamsize = namespace_54d20dd0dd79277f::getteamcount(team, 0);
    self.var_1b0d1620df6b0cfe[team] = undefined;
    function_f36fb22c2233a40c(var_670e5879926b51ef);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e43
// Size: 0x1d5
function function_f36fb22c2233a40c(var_af25493332d5ca3a) {
    var_333514ef00dadb65 = [];
    if (isdefined(var_af25493332d5ca3a.var_93fa0afa04ae392f) && var_af25493332d5ca3a.var_93fa0afa04ae392f.size > 0) {
        foreach (var_ce0f3c78f560174f in var_af25493332d5ca3a.var_93fa0afa04ae392f) {
            var_333514ef00dadb65[var_333514ef00dadb65.size] = [0:"event_type", 1:var_ce0f3c78f560174f.type, 2:"reason", 3:var_ce0f3c78f560174f.reason, 4:"timestamp", 5:var_ce0f3c78f560174f.timestamp, 6:"uno_id", 7:var_ce0f3c78f560174f.unoid];
        }
    }
    var_775ff28d397a2b6 = [0:"player_events", 1:var_333514ef00dadb65, 2:"fortress", 3:var_af25493332d5ca3a.fortress, 4:"success", 5:var_af25493332d5ca3a.success, 6:"mission", 7:var_af25493332d5ca3a.mission, 8:"start_time", 9:var_af25493332d5ca3a.starttime, 10:"end_time", 11:var_af25493332d5ca3a.endtime, 12:"team", 13:var_af25493332d5ca3a.team, 14:"team_size", 15:var_af25493332d5ca3a.teamsize, 16:"team_participation_count", 17:var_af25493332d5ca3a.var_5f8fc154303502fa.size];
    dlog_recordevent("dlog_event_br_stronghold_attempt", var_775ff28d397a2b6);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x901f
// Size: 0x21f
function function_8ed813c1b731ca42() {
    player = self;
    playerteam = player.sessionteam;
    if (!isdefined(playerteam)) {
        playerteam = player.team;
    }
    teamsize = namespace_54d20dd0dd79277f::getteamcount(playerteam, 0);
    maxteamsize = namespace_36f464722d326bbe::function_4fb37368ae3585bb();
    if (teamsize > maxteamsize) {
        params = [0:"utc_connect_time_s", 1:player.pers["telemetry"].utc_connect_time_s, 2:"team", 3:playerteam, 4:"join_type", 5:player getjointype(), 6:"skill", 7:player getskill(), 8:"party_id", 9:player getpartyid(), 10:"is_party_host", 11:istrue(level.onlinegame) ? player isfireteamleader() : 0, 12:"was_keyboardmouse", 13:player function_989faa3e2f2d8c47() != 1, 14:"map", 15:level.mapname, 16:"playlist_id", 17:getplaylistid(), 18:"playlist_name", 19:getplaylistname(), 20:"game_type", 21:getgametype(), 22:"sub_game_type", 23:namespace_36f464722d326bbe::function_6c1fce6f6b8779d5(), 24:"connect_index", 25:isdefined(player.pers["telemetry"].connect_index) ? player.pers["telemetry"].connect_index : 0, 26:"lobby_id", 27:isdefined(function_4f9373a1227db35c()) ? function_4f9373a1227db35c() : "", 28:"is_ranked", 29:istrue(level.var_ec2fb549b15ad827) || istrue(level.var_77907d733abe8b63) ? 1 : 0];
        player dlog_recordplayerevent("dlog_event_br_player_oversize_team", params);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9245
// Size: 0x2dd
function function_df74213f854433f9() {
    poi = "unknown";
    var_4cc263f13d4416b1 = "unknown";
    var_f2f70efc26eec1ec = "unknown";
    var_6f9b9b4e74136c02 = namespace_bd614c3c2275579a::function_b7a9796c95aa8e8d();
    attempts = 0;
    successes = 0;
    failures = 0;
    var_b5ad6ca10e5301d7 = 0;
    var_25087194b5e05d51 = 0;
    var_5b9de011a1715b33 = 0;
    var_ab822267aa74c573 = 0;
    var_ea7accbb6edc9b55 = istrue(self.var_ea7accbb6edc9b55);
    unlocked = istrue(self.var_933f9685674999fb) && istrue(self.unlocked);
    if (isdefined(self.poiName)) {
        poi = self.poiName;
    }
    if (isdefined(self.name)) {
        var_4cc263f13d4416b1 = string(self.name);
    }
    if (isdefined(self.origin)) {
        var_f2f70efc26eec1ec = string(self.origin);
    }
    if (isdefined(self.attempts)) {
        attempts = self.attempts;
    }
    if (isdefined(self.successes)) {
        successes = self.successes;
    }
    if (isdefined(self.failures)) {
        failures = self.failures;
    }
    if (isdefined(self.var_b5ad6ca10e5301d7)) {
        var_b5ad6ca10e5301d7 = self.var_b5ad6ca10e5301d7;
    }
    if (isdefined(self.agentskilled)) {
        var_25087194b5e05d51 = self.agentskilled;
    }
    if (isdefined(self.crate) && isdefined(self.crate.var_4261eb2ab67db6f7)) {
        var_5b9de011a1715b33 = self.crate.var_4261eb2ab67db6f7.size;
    }
    if (isdefined(self.var_ab822267aa74c573)) {
        var_ab822267aa74c573 = istrue(self.var_ab822267aa74c573);
    }
    args = [0:"poi", 1:poi, 2:"name", 3:var_4cc263f13d4416b1, 4:"origin", 5:var_f2f70efc26eec1ec, 6:"tier", 7:var_6f9b9b4e74136c02, 8:"is_blacksite", 9:istrue(self.var_933f9685674999fb), 10:"attempts", 11:attempts, 12:"successes", 13:successes, 14:"failures", 15:failures, 16:"player_deaths", 17:var_b5ad6ca10e5301d7, 18:"ai_deaths", 19:var_25087194b5e05d51, 20:"loadouts_taken", 21:var_5b9de011a1715b33, 22:"mission_cleared", 23:var_ab822267aa74c573, 24:"key_picked_up", 25:var_ea7accbb6edc9b55, 26:"blacksite_unlocked", 27:unlocked];
    dlog_recordevent("dlog_event_br_stronghold_data", args);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9529
// Size: 0x236
function initcashtracking() {
    level.cashtypes = [];
    level.cashtypes[level.cashtypes.size] = "loot";
    level.cashtypes[level.cashtypes.size] = "mission";
    level.cashtypes[level.cashtypes.size] = "combat";
    level.cashtypes[level.cashtypes.size] = "cache";
    level.cashtypes[level.cashtypes.size] = "cache_legendary";
    level.cashtypes[level.cashtypes.size] = "cache_scavenger";
    level.cashtypes[level.cashtypes.size] = "cache_secretstash";
    level.cashtypes[level.cashtypes.size] = "reusable_cache";
    level.cashtypes[level.cashtypes.size] = "cache_personal_supply";
    level.cashtypes[level.cashtypes.size] = "loot_chopper";
    level.cashtypes[level.cashtypes.size] = "c130_box";
    level.cashmetrics = [];
    foreach (team in level.teamnamelist) {
        data = spawnstruct();
        data.sources = [];
        data.totaldata = [];
        foreach (type in level.cashtypes) {
            data.sources[type] = 0;
            data.totaldata[type] = 0;
        }
        level.cashmetrics[team] = data;
    }
    level waittill("prematch_done");
    level thread recordinterval();
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9766
// Size: 0x34f
function recordinterval() {
    waittime = 60;
    while (!istrue(level.gameended)) {
        level waittill_notify_or_timeout("game_ended", waittime);
        starttime = gettime();
        var_c3e10a42a81ade25 = namespace_e8a49b70d0769b66::getteamscoreplacements();
        foreach (team in level.teamnamelist) {
            if (!isdefined(team)) {
                continue;
            }
            time = namespace_eb72aa155b5e14e7::gettimefrommatchstart(gettime());
            eventparams = [];
            eventparams[eventparams.size] = "match_complete";
            eventparams[eventparams.size] = 0;
            eventparams[eventparams.size] = "time";
            eventparams[eventparams.size] = time;
            eventparams[eventparams.size] = "team";
            eventparams[eventparams.size] = team;
            eventparams[eventparams.size] = "placement";
            eventparams[eventparams.size] = var_c3e10a42a81ade25[team];
            foreach (type in level.cashtypes) {
                value = level.cashmetrics[team].sources[type];
                eventparams[eventparams.size] = "cash_source_" + type;
                eventparams[eventparams.size] = value;
                level.cashmetrics[team].totaldata[type] = level.cashmetrics[team].totaldata[type] + value;
                level.cashmetrics[team].sources[type] = 0;
            }
            dlog_recordevent("dlog_event_blood_money_interval", eventparams);
            waitframe();
        }
        updatetime = (gettime() - starttime) * 0.001;
        waittime = max(60 - updatetime, 0);
    }
    time = namespace_eb72aa155b5e14e7::gettimefrommatchstart(gettime());
    var_c3e10a42a81ade25 = namespace_e8a49b70d0769b66::getteamscoreplacements();
    foreach (team in level.teamnamelist) {
        eventparams = [];
        eventparams[eventparams.size] = "match_complete";
        eventparams[eventparams.size] = 1;
        eventparams[eventparams.size] = "time";
        eventparams[eventparams.size] = time;
        eventparams[eventparams.size] = "team";
        eventparams[eventparams.size] = team;
        eventparams[eventparams.size] = "placement";
        eventparams[eventparams.size] = var_c3e10a42a81ade25[team];
        foreach (type in level.cashtypes) {
            value = level.cashmetrics[team].totaldata[type];
            eventparams[eventparams.size] = "cash_source_" + type;
            eventparams[eventparams.size] = value;
        }
        dlog_recordevent("dlog_event_blood_money_interval", eventparams);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9abc
// Size: 0x88
function trackcashevent(player, type, amount) {
    if (!isdefined(level.cashmetrics) || !isdefined(player) || !isdefined(player.team)) {
        return;
    }
    team = player.team;
    level.cashmetrics[team].sources[type] = level.cashmetrics[team].sources[type] + amount;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b4b
// Size: 0xb
function onmatchstartbr() {
    thread _onmatchstartbr();
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b5d
// Size: 0x3ff
function _onmatchstartbr() {
    waittillframeend();
    /#
        assert(isstring(level.brgametype.name));
    #/
    /#
        assert(isarray(level.players));
    #/
    var_faf0d2fac3f47583 = level.brgametype.name;
    maxteamsize = getintorzero(level.maxteamsize);
    playercount = getintorzero(level.players.size);
    teamcount = getteamcount();
    var_b287376c626b75b6 = 0;
    foreach (player in level.players) {
        if (isbot(player) || player isplayerheadless()) {
            continue;
        }
        var_b287376c626b75b6++;
    }
    if (isdefined(level.br_armory_kiosk)) {
        var_a3d16ec55b882ccd = getintorzero(level.br_armory_kiosk.teamrevivecost);
    } else {
        var_a3d16ec55b882ccd = 0;
    }
    var_5ceaea1d11f6f7f5 = getintorzero(level.usegulag);
    if (isdefined(level.gulag)) {
        var_f2c958a504a3bd33 = getintorzero(level.gulag.maxuses);
        var_55f22a96a43d437e = getintorzero(level.gulag.numarmorhealth);
        var_41046871e0c8b9a8 = getintorzero(level.gulag.spawnloot);
    } else {
        var_f2c958a504a3bd33 = 0;
        var_55f22a96a43d437e = 0;
        var_41046871e0c8b9a8 = 0;
    }
    var_9d8974ff163f463d = [];
    if (getdvarint(@"hash_90a3dfd557408611", 1) && isdefined(level.questinfo)) {
        foreach (type, info in level.questinfo.tabletinfo) {
            /#
                assert(isstring(type));
            #/
            var_9d8974ff163f463d[var_9d8974ff163f463d.size] = "name";
            var_9d8974ff163f463d[var_9d8974ff163f463d.size] = type;
            isenabled = isdefined(info) && istrue(info.enabled);
            var_9d8974ff163f463d[var_9d8974ff163f463d.size] = "is_enabled";
            var_9d8974ff163f463d[var_9d8974ff163f463d.size] = isenabled;
        }
    }
    playlistid = getintorzero(getplaylistid());
    if (isdefined(level.prematchendtime)) {
        prematchendtime = level.prematchendtime;
    } else {
        prematchendtime = -1;
    }
    frame_duration = function_676cfe2ab64ea758();
    dlog_recordevent("dlog_event_br_server_match_start", [0:"br_mission_type_info", 1:var_9d8974ff163f463d, 2:"map", 3:level.script, 4:"sub_game_type", 5:var_faf0d2fac3f47583, 6:"max_team_size", 7:maxteamsize, 8:"player_count", 9:playercount, 10:"human_player_count", 11:var_b287376c626b75b6, 12:"team_count", 13:teamcount, 14:"kiosk_respawn_cost", 15:var_a3d16ec55b882ccd, 16:"gulag_active", 17:var_5ceaea1d11f6f7f5, 18:"gulag_max_uses", 19:var_f2c958a504a3bd33, 20:"gulag_starting_armor", 21:var_55f22a96a43d437e, 22:"gulag_spawn_loot", 23:var_41046871e0c8b9a8, 24:"prematch_end_time", 25:prematchendtime, 26:"playlist_id", 27:playlistid, 28:"frame_duration", 29:frame_duration]);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f63
// Size: 0x9e
function getteamcount() {
    teamcount = 0;
    foreach (team in level.teamnamelist) {
        teamplayers = namespace_54d20dd0dd79277f::getteamdata(team, "players");
        if (teamplayers.size > 0 || isdefined(level.var_7b37b2193f163b9b) && namespace_54d20dd0dd79277f::getteamdata(team, "UIBotCount") > 0) {
            teamcount++;
        }
    }
    return teamcount;
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa009
// Size: 0x139
function function_afd45555767f3079() {
    if (!branalytics_validation()) {
        return;
    }
    var_c2b11eb497782122 = 0;
    var_b94285d34c4e325 = 0;
    var_2235cd5c616a1881 = 0;
    if (isdefined(level.gulag) && isdefined(level.gulag.arenas)) {
        foreach (arena in level.gulag.arenas) {
            var_c2b11eb497782122 = var_c2b11eb497782122 + function_53c4c53197386572(arena.var_19fe32f41a41c7ff, 0);
            var_b94285d34c4e325 = var_b94285d34c4e325 + function_53c4c53197386572(arena.var_60af67bcaac1aa55, 0);
            var_2235cd5c616a1881 = var_2235cd5c616a1881 + function_53c4c53197386572(arena.var_2235cd5c616a1881, 0);
        }
    }
    eventparams = [];
    eventparams[eventparams.size] = "guards_attacked";
    eventparams[eventparams.size] = var_c2b11eb497782122;
    eventparams[eventparams.size] = "riots_triggered";
    eventparams[eventparams.size] = var_b94285d34c4e325;
    eventparams[eventparams.size] = "riots_completed";
    eventparams[eventparams.size] = var_2235cd5c616a1881;
    dlog_recordevent("dlog_event_br_riot_totals", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa149
// Size: 0xb7
function function_5098ee655afed5d(var_2212b25a680741d1, circleindex, result, participants, leftovers, var_5101b29ac9644518) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "arena";
    eventparams[eventparams.size] = var_2212b25a680741d1;
    eventparams[eventparams.size] = "circle_index";
    eventparams[eventparams.size] = circleindex;
    eventparams[eventparams.size] = "result";
    eventparams[eventparams.size] = result;
    eventparams[eventparams.size] = "participants";
    eventparams[eventparams.size] = participants;
    eventparams[eventparams.size] = "leftovers";
    eventparams[eventparams.size] = leftovers;
    eventparams[eventparams.size] = "released";
    eventparams[eventparams.size] = var_5101b29ac9644518;
    dlog_recordevent("dlog_event_gulagbreak_result", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa207
// Size: 0xae
function function_885c6daf0ece2cf6(result, fail_reason) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "result";
    eventparams[eventparams.size] = result;
    eventparams[eventparams.size] = "fail_reason";
    eventparams[eventparams.size] = fail_reason;
    circleindex = -1;
    if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex)) {
        circleindex = level.br_circle.circleindex;
    }
    eventparams[eventparams.size] = "circle_index";
    eventparams[eventparams.size] = circleindex;
    self dlog_recordplayerevent("dlog_event_reinforcement_flare_use", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0xa2bc
// Size: 0x111
function function_9d458fb3a5d1e86a(var_456a8cdc6ecb54ed, placement, var_bbac576aade31a1e, var_f2982f79dd4f09f2, contracts, valuables, var_30b39e4f74a74528, var_6ed21b763a987591) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "total_squad_cash";
    eventparams[eventparams.size] = int(var_456a8cdc6ecb54ed);
    eventparams[eventparams.size] = "placement";
    eventparams[eventparams.size] = int(placement);
    eventparams[eventparams.size] = "total_cash";
    eventparams[eventparams.size] = int(var_bbac576aade31a1e);
    eventparams[eventparams.size] = "looted_cash";
    eventparams[eventparams.size] = int(var_f2982f79dd4f09f2);
    eventparams[eventparams.size] = "contract_cash";
    eventparams[eventparams.size] = int(contracts);
    eventparams[eventparams.size] = "valuable_cash";
    eventparams[eventparams.size] = int(valuables);
    eventparams[eventparams.size] = "cash_lost_on_death";
    eventparams[eventparams.size] = int(var_30b39e4f74a74528);
    eventparams[eventparams.size] = "cash_lost_on_purchase";
    eventparams[eventparams.size] = int(var_6ed21b763a987591);
    dlog_recordevent("dlog_event_br_plunder_match_totals", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa3d4
// Size: 0x6e
function function_fdd0a4efcd97f3be(axis_contracts_completed, allies_contracts_completed, location) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "axis_contracts_completed";
    eventparams[eventparams.size] = axis_contracts_completed;
    eventparams[eventparams.size] = "allies_contracts_completed";
    eventparams[eventparams.size] = allies_contracts_completed;
    eventparams[eventparams.size] = "location";
    eventparams[eventparams.size] = location;
    dlog_recordevent("dlog_event_br_clash_contracts_completed", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa449
// Size: 0x6e
function function_2f0fb1b1516df8f8(axis_score, allies_score, location) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "axis_score";
    eventparams[eventparams.size] = axis_score;
    eventparams[eventparams.size] = "allies_score";
    eventparams[eventparams.size] = allies_score;
    eventparams[eventparams.size] = "location";
    eventparams[eventparams.size] = location;
    dlog_recordevent("dlog_event_br_clash_team_scores", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa4be
// Size: 0x4d
function function_a5f798c8b2826f4c(player, var_cef4de885b9dfa1) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = _branalytics_header(player);
    eventparams[eventparams.size] = "tree_level";
    eventparams[eventparams.size] = var_cef4de885b9dfa1;
    player dlog_recordplayerevent("dlog_event_br_ff_tree_level_achieved", eventparams);
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa512
// Size: 0x259
function function_eb0f4a619dd99bba(var_46a3a8565ac0c17c, var_f05299e50a2f2cc7, items, index) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "container_type";
    eventparams[eventparams.size] = var_46a3a8565ac0c17c;
    circleindex = -1;
    if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex)) {
        circleindex = level.br_circle.circleindex;
    }
    eventparams[eventparams.size] = "circle_index";
    eventparams[eventparams.size] = circleindex;
    eventparams[eventparams.size] = "cache_position_x";
    eventparams[eventparams.size] = var_f05299e50a2f2cc7[0];
    eventparams[eventparams.size] = "cache_position_y";
    eventparams[eventparams.size] = var_f05299e50a2f2cc7[1];
    eventparams[eventparams.size] = "cache_position_z";
    eventparams[eventparams.size] = var_f05299e50a2f2cc7[2];
    eventparams[eventparams.size] = "container_index";
    eventparams[eventparams.size] = index;
    eventparams[eventparams.size] = "closest_poi";
    eventparams[eventparams.size] = namespace_37f0fb6355a4618a::function_55cf921efa4cbd09(var_f05299e50a2f2cc7);
    self.player dlog_recordplayerevent("dlog_event_cache_container_opened", eventparams);
    foreach (item in items) {
        eventparams = [];
        eventparams[eventparams.size] = "container_type";
        eventparams[eventparams.size] = var_46a3a8565ac0c17c;
        eventparams[eventparams.size] = "container_index";
        eventparams[eventparams.size] = index;
        eventparams[eventparams.size] = "item";
        eventparams[eventparams.size] = item;
        itemcount = undefined;
        if (isstring(item)) {
            itemcount = level.br_pickups.counts[item];
        }
        if (!isdefined(itemcount)) {
            itemcount = 1;
        }
        eventparams[eventparams.size] = "count";
        eventparams[eventparams.size] = itemcount;
        eventparams[eventparams.size] = "type";
        itemtype = undefined;
        if (isstring(item)) {
            itemtype = level.br_pickups.br_itemtype[item];
        } else if (isweapon(item)) {
            itemtype = #"weapon";
        }
        eventparams[eventparams.size] = itemtype;
        self.player dlog_recordplayerevent("dlog_event_cache_container_opened_item", eventparams);
    }
}

// Namespace namespace_9cb8bb5897c3d5b2/namespace_a011fbf6d93f25e5
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa772
// Size: 0xf8
function function_7dcf65411dc17f09(var_84162d3b864ea0c0, var_aa82e6d1b3760575, quantity, var_42623c2865853280, player) {
    if (!branalytics_validation()) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "valuable_name";
    eventparams[eventparams.size] = var_84162d3b864ea0c0;
    eventparams[eventparams.size] = "base_sell_value";
    eventparams[eventparams.size] = var_aa82e6d1b3760575;
    eventparams[eventparams.size] = "quantity";
    eventparams[eventparams.size] = quantity;
    eventparams[eventparams.size] = "cash_total";
    eventparams[eventparams.size] = var_42623c2865853280;
    eventparams[eventparams.size] = "match_time";
    eventparams[eventparams.size] = namespace_36f464722d326bbe::gettimepassed();
    eventparams[eventparams.size] = "closest_poi";
    eventparams[eventparams.size] = namespace_37f0fb6355a4618a::function_55cf921efa4cbd09(player.origin);
    eventparams[eventparams.size] = "player_plunder_count";
    eventparams[eventparams.size] = player.plundercount;
    eventparams[eventparams.size] = "player_plunder_banked";
    eventparams[eventparams.size] = player.plunderbanked;
    player dlog_recordplayerevent("dlog_event_valuable_sold", eventparams);
}

