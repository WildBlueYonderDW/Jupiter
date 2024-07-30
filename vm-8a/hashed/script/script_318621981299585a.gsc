#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_6c4e8cea70bf4b6d;
#using scripts\mp\gametypes\activity_manager.gsc;
#using scripts\mp\equipment\flash_grenade.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using script_64acb6ce534155b7;
#using script_744cad313ed0a87e;
#using script_4948cdf739393d2d;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\gameobjects.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_lootcache.gsc;

#namespace namespace_b797504d70db7f41;

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5db
// Size: 0x103
function function_7aae8cb0d8b0ac6a(data) {
    level.bombprops = spawnstruct();
    level.bombprops.circleradius = getdvarint(@"hash_ed78eecb63877c7c", 2000);
    level.bombprops.pointradius = getdvarint(@"hash_b482aff66d7abae4", 1000);
    level.bombprops.pointradiussq = level.bombprops.pointradius * level.bombprops.pointradius;
    level.bombprops.var_ed2e5cf91bff3a6f = getdvarfloat(@"hash_3e60557305f8da61", 0.65);
    data.createfunc = &function_fefd14a6940e2b99;
    if (!isdefined(level._effect["bomb_squad_explosion"])) {
        level._effect["bomb_squad_explosion"] = loadfx("vfx/iw8_mp/gamemode/vfx_search_bombsite_destroy.vfx");
    }
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e6
// Size: 0x1e0
function function_fefd14a6940e2b99(activity, owner) {
    task = task_create(activity);
    task.owner = owner;
    owner.task = task;
    task.players = [];
    task.funcs["onInit"] = &function_b883ad642cd900d6;
    task.funcs["onPlayerAssigned"] = &function_dd6410a59565d135;
    task.funcs["onPlayerJoined"] = &function_54fac7db1349c874;
    task.funcs["onPlayerRemoved"] = &function_1d932423d5491347;
    task.funcs["onTeamStart"] = &function_7fef8fe4178f164f;
    task.funcs["onPlayerExitVolume"] = &function_6118e2119e160883;
    task.funcs["onPlayerExitTimeout"] = &function_e09f977d133bac40;
    task.funcs["onPlayerReenterVolume"] = &function_ee2041010cee0afc;
    task.ref = "br_bomb";
    task.refindex = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.spawntrap = 0;
    task.tier = task.owner namespace_bd614c3c2275579a::function_b7a9796c95aa8e8d();
    if (task.tier == "black") {
        task.mission_index = 17;
        task.mission_complete = 18;
        task.mission_fail = 0;
        task.var_bd764b17d3bf6325 = 0;
    } else {
        task.mission_index = 17;
        task.mission_complete = 18;
        task.mission_fail = 0;
        task.var_bd764b17d3bf6325 = 0;
    }
    return task;
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cf
// Size: 0x9a
function function_b883ad642cd900d6() {
    task = self;
    task.activity.origin = task.owner.origin;
    circlelocation = task.owner.missiontrigger.origin;
    task.circlecenter = circlelocation;
    task.circleradius = level.bombprops.circleradius;
    task.originalteam = undefined;
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x971
// Size: 0xfe
function function_dd6410a59565d135(teamname, player) {
    task = self;
    teams = [teamname];
    var_aa128e29d7c10074 = scripts\cp_mp\utility\game_utility::isaigameparticipant(player);
    task.owner namespace_bd614c3c2275579a::function_dacf98a6e7acadeb(player, player.team);
    namespace_9823ee6035594d67::function_d95dbf57b47734d9(task.owner, 1);
    task thread scripts\mp\gametypes\activity_manager::function_a33c10c0682918bd(task.owner.missiontrigger, 9000);
    if (!isdefined(task.plantedbombs)) {
        task.plantedbombs = [];
    }
    if (task.plantedbombs.size < 1) {
        task thread function_36b22d1548152da8();
    }
    if (var_aa128e29d7c10074) {
        task thread function_5cbd566bcb47d26e();
        task function_54fac7db1349c874(player);
        return;
    }
    task thread function_5cbd566bcb47d26e();
    task function_a92867e16c21da22(teamname);
    task function_54fac7db1349c874(player);
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa77
// Size: 0x156
function function_54fac7db1349c874(player) {
    task = self;
    if (!isdefined(array_find(task.players, player))) {
        size = task.players.size;
        task.players[size] = player;
    }
    var_aa128e29d7c10074 = scripts\cp_mp\utility\game_utility::isaigameparticipant(player);
    if (var_aa128e29d7c10074) {
        return;
    }
    var_d0cb4e7edbd1a617 = player getclientomnvar("ui_br_stronghold_mission");
    player thread scripts\mp\hud_message::showsplash("stronghold_operation_bomb_disposal");
    wait 4;
    if (!isdefined(player) || !array_contains(task.players, player)) {
        return;
    }
    if (var_d0cb4e7edbd1a617 == player getclientomnvar("ui_br_stronghold_mission")) {
        player setclientomnvar("ui_br_stronghold_mission", task.mission_index);
        player setclientomnvar("ui_br_stronghold_mission_timer", task.endtime);
    }
    scripts\mp\gametypes\br_public::brleaderdialogplayer("br_mission_bomb_assigned", player);
    if (!isdefined(task.originalteam)) {
        task.originalteam = player.team;
    }
    for (i = 0; i < task.plantedbombs.size; i++) {
        task.plantedbombs[i] enableplayeruse(player);
    }
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd5
// Size: 0x9a
function function_1d932423d5491347(player) {
    task = self;
    var_aa128e29d7c10074 = scripts\cp_mp\utility\game_utility::isaigameparticipant(player);
    task.players = array_remove(task.players, player);
    if (var_aa128e29d7c10074) {
        return;
    }
    player setclientomnvar("ui_br_stronghold_mission", task.mission_fail);
    for (i = 0; i < task.plantedbombs.size; i++) {
        task.plantedbombs[i] disableplayeruse(player);
    }
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc77
// Size: 0x1b
function function_7fef8fe4178f164f(teamname) {
    assert(1, "Bomb Squad is a volume player start stronghold mission only!");
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9a
// Size: 0x1c9
function function_19809ae1667b5c7a(teamname, var_b677bbe2241c4e3f, detonated) {
    task = self;
    teamplayers = task scripts\mp\gametypes\activity_manager::function_ad20469c1815a7c7(teamname, 0);
    var_5f8fc154303502fa = task scripts\mp\gametypes\activity_manager::function_ad20469c1815a7c7(teamname, 1);
    task function_629ed367d1393020();
    level.var_1b7407dffe81e6e8.teamsinfo[teamname].activities = array_remove(level.var_1b7407dffe81e6e8.teamsinfo[teamname].activities, task.activity.id);
    task.teams = array_remove(task.teams, teamname);
    level.var_1b7407dffe81e6e8.teamsinfo[teamname].active = 0;
    foreach (player in var_5f8fc154303502fa) {
        task.players = array_remove(task.players, player);
        if (scripts\cp_mp\utility\game_utility::isaigameparticipant(player)) {
            continue;
        }
        player setclientomnvar("ui_br_stronghold_mission", var_b677bbe2241c4e3f);
        if (var_b677bbe2241c4e3f == task.mission_complete) {
            player thread scripts\mp\hud_message::showsplash("stronghold_operation_bomb_disposal_completed");
            continue;
        }
        if (istrue(detonated)) {
            player thread scripts\mp\hud_message::showsplash("stronghold_operation_bomb_disposal_failed");
        } else {
            player thread scripts\mp\hud_message::showsplash("stronghold_operation_bomb_disposal_poached");
        }
        player setclientomnvar("ui_br_stronghold_mission", 0);
    }
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6b
// Size: 0x77
function function_6118e2119e160883(player) {
    task = self;
    player.var_e09c6ea56555f1ed = 1;
    var_aa128e29d7c10074 = scripts\cp_mp\utility\game_utility::isaigameparticipant(player);
    if (!var_aa128e29d7c10074) {
        player setclientomnvar("ui_br_stronghold_mission", task.var_bd764b17d3bf6325);
    }
    exittimeout = gettime() + 9000;
    if (!var_aa128e29d7c10074) {
        player setclientomnvar("ui_br_stronghold_mission_timer", exittimeout);
    }
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeea
// Size: 0x66
function function_ee2041010cee0afc(player) {
    task = self;
    player.var_e09c6ea56555f1ed = undefined;
    var_aa128e29d7c10074 = scripts\cp_mp\utility\game_utility::isaigameparticipant(player);
    if (!var_aa128e29d7c10074) {
        player setclientomnvar("ui_br_stronghold_mission", task.mission_index);
        player setclientomnvar("ui_br_stronghold_mission_timer", task.endtime);
    }
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf58
// Size: 0x51
function function_e09f977d133bac40(player) {
    task = self;
    task function_1d932423d5491347(player);
    player.var_e09c6ea56555f1ed = undefined;
    player.var_ed5a962d857703ec = undefined;
    if (isdefined(level.var_fc0e8c2ea4f84613)) {
        task [[ level.var_fc0e8c2ea4f84613 ]](player);
    }
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfb1
// Size: 0x22f
function private function_2344407dc24ee69(teamname, detonated) {
    task = self;
    task notify("task_ended");
    namespace_9823ee6035594d67::function_be5a531f97b7c07e(task.owner);
    if (isdefined(level.var_3afacc0c3b10b7fe)) {
        task.owner [[ level.var_3afacc0c3b10b7fe ]](teamname, !istrue(detonated));
    }
    deletetask = 0;
    foreach (team in task.teams) {
        teamcompleted = 0;
        if (isdefined(teamname) && isdefined(team)) {
            teamcompleted = team == teamname;
        }
        var_b677bbe2241c4e3f = task.mission_fail;
        if (teamcompleted) {
            deletetask = 1;
            var_b677bbe2241c4e3f = task.mission_complete;
        }
        task function_19809ae1667b5c7a(team, var_b677bbe2241c4e3f, detonated);
    }
    if (istrue(detonated)) {
        task.owner.crate thread namespace_bd614c3c2275579a::function_faa1ecbc7f0bed85(undefined, 0, 1, 1, 0);
        if (istrue(level.var_4ad06d80f390745e)) {
            thread namespace_bd614c3c2275579a::function_182cb0e167ad745a(task.owner, "high", level.var_6565786392240cdf, 0, 1);
        }
    }
    if (!isdefined(detonated)) {
        detonated = 0;
    }
    task.starttime = undefined;
    if (isdefined(task.activity) && isdefined(task.activity.tasks) && task.activity.tasks.size >= 1 && (deletetask || detonated)) {
        task.owner.missiontrigger notify("activity_ended");
        level.var_1b7407dffe81e6e8.activities[task.activity.id] = undefined;
        task.activity.tasks = undefined;
    }
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11e8
// Size: 0xcf
function private function_7d5530038bb0f3ad(instance, player, bombent) {
    success = function_2a647bf074af9087(player, bombent);
    if (success) {
        function_e14909a9c0b08d64(player, bombent);
        if (instance.plantedbombs.size <= 0) {
            dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
            instance function_2344407dc24ee69(player.team);
            function_6f6f83ab76483811(instance, player);
            instance.owner function_4f1a578f63d4ed56(dropstruct, player);
            player namespace_bd614c3c2275579a::function_9d216f4cd30f141d(dropstruct, getteamarray(player.team, 0), instance.originalteam);
        }
        return;
    }
    if (!isdefined(bombent)) {
        return;
    }
    function_e14909a9c0b08d64(player, bombent);
    instance thread function_ba7471068b9cf103(bombent);
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12bf
// Size: 0x13b
function private function_2a647bf074af9087(player, bombent) {
    task = self;
    item = makeweapon("briefcase_bomb_mp");
    player scripts\cp_mp\utility\inventory_utility::_giveweapon(item, undefined, undefined, 0);
    player setweaponammostock(item, 0);
    player setweaponammoclip(item, 0);
    player thread scripts\mp\gameobjects::switchtouseweapon(item, 1);
    timepassed = 0;
    while (timepassed < 3 && gettime() < task.endtime) {
        if (!isalive(player) || isinlaststand(player) || isdefined(player.var_2ca0dac193d83c1) && player.var_2ca0dac193d83c1 || player scripts\mp\gametypes\br_public::isplayeringulag()) {
            player scripts\cp_mp\utility\inventory_utility::getridofweapon("briefcase_bomb_mp");
            return false;
        }
        timepassed += level.framedurationseconds;
        waitframe();
    }
    if (isdefined(player) && isreallyalive(player)) {
        player scripts\cp_mp\utility\inventory_utility::getridofweapon("briefcase_bomb_mp");
        if (gettime() < task.endtime) {
            task.plantedbombs = array_remove(task.plantedbombs, bombent);
            return true;
        }
    }
    return false;
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1403
// Size: 0x15c
function function_e9abe9c2bf9878f0() {
    task = self;
    caches = getlootscriptablearrayinradius("br_loot_cache", undefined, task.circlecenter, task.circleradius);
    if (!isdefined(caches)) {
        return undefined;
    }
    caches = array_randomize(caches);
    scalars = [0.1, 0.3, 0.5, 0.7, 0.9];
    cache = task function_a77cbe5355057772(caches, scalars, 0);
    if (!isdefined(cache)) {
        scalars = [0.1, 0.3, 0.5, 0.7, 0.9, 1];
        cache = task function_a77cbe5355057772(caches, scalars, 0);
        assert(isdefined(cache), "BOMB SQUAD: No cache could found or freed");
        task thread function_2344407dc24ee69(undefined, 1);
    }
    cache.task = task;
    task.cache = cache;
    cache.contents = [];
    cache function_35768a5b1ebba1a0();
    cache.contents[1]["quantity"] = 50;
    cache.contents[1]["lootID"] = 8395;
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1567
// Size: 0x129
function function_a77cbe5355057772(locations, var_e83038f37b2b5870, ignoreinuse) {
    task = self;
    if (!isdefined(ignoreinuse)) {
        ignoreinuse = 0;
    }
    foreach (radiusscalar in var_e83038f37b2b5870) {
        foreach (node in locations) {
            if (istrue(node.inuse) && !ignoreinuse) {
                continue;
            }
            dist = distance2d(node.origin, task.circlecenter);
            if (dist < task.circleradius * radiusscalar) {
                if (ignoreinuse) {
                    node.inuse = 0;
                    node freescriptable();
                }
                return node;
            }
        }
    }
    return undefined;
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1699
// Size: 0x54
function function_35768a5b1ebba1a0() {
    cache = self;
    cache.contents[0]["quantity"] = 1;
    cache.contents[0]["lootID"] = 8608;
    cache.contents[0]["callback"] = &function_7d5530038bb0f3ad;
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f5
// Size: 0x11f
function function_5cbd566bcb47d26e() {
    task = self;
    if (istrue(task.ticking)) {
        return;
    }
    level endon("game_ended");
    task endon("task_ended");
    task.owner.missiontrigger endon("deleted");
    task.owner.missiontrigger endon("activity_ended");
    waittime = task.owner.var_cab871d72c8eb111[0];
    task.ticking = 1;
    task.starttime = gettime();
    task.endtime = task.starttime + waittime * 1000;
    task thread function_c98c343e42951ea2(task.endtime, 3000);
    wait waittime;
    for (i = 0; i < task.plantedbombs.size; i++) {
        task function_1991fd659fa220ba(task.plantedbombs[i]);
    }
    task thread function_2344407dc24ee69(undefined, 1);
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181c
// Size: 0x18e
function function_c98c343e42951ea2(bombendtime, offset) {
    task = self;
    level endon("game_ended");
    self endon("task_ended");
    currenttime = gettime();
    var_c301d652d9a73075 = bombendtime - currenttime;
    while (var_c301d652d9a73075 > 0 && isdefined(task.bombent)) {
        currenttime = gettime();
        var_c301d652d9a73075 = bombendtime - currenttime;
        if (var_c301d652d9a73075 <= 7000 + offset) {
            if (var_c301d652d9a73075 <= 250) {
                if (soundexists("breach_warning_beep_05")) {
                    task.bombent playsound("breach_warning_beep_05");
                }
            } else if (var_c301d652d9a73075 <= 750) {
                if (soundexists("breach_warning_beep_04")) {
                    task.bombent playsound("breach_warning_beep_04");
                }
            } else if (var_c301d652d9a73075 <= 1500) {
                if (soundexists("breach_warning_beep_03")) {
                    task.bombent playsound("breach_warning_beep_03");
                }
            } else if (soundexists("breach_warning_beep_02")) {
                task.bombent playsound("breach_warning_beep_02");
            }
            wait 0.25;
            continue;
        }
        if (var_c301d652d9a73075 <= 15000 + offset) {
            if (soundexists("breach_warning_beep_02")) {
                task.bombent playsound("breach_warning_beep_02");
            }
            wait 0.5;
            continue;
        }
        if (soundexists("breach_warning_beep_01")) {
            task.bombent playsound("breach_warning_beep_01");
        }
        wait 1;
    }
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b2
// Size: 0xe9
function function_682e6a05a3109ea1(bombent) {
    task = self;
    level endon("game_ended");
    task endon("task_ended");
    task.owner.missiontrigger endon("deleted");
    task.owner.missiontrigger endon("activity_ended");
    if (!isdefined(bombent)) {
        return;
    }
    if (istrue(bombent.gaswatch)) {
        return;
    }
    origin = bombent.origin + (0, 0, 40);
    bombent.gaswatch = 1;
    waitframe();
    waittillframeend();
    while (namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(origin) || namespace_bbc79db4c3949a5c::function_a465e3c1371d7dab(origin)) {
        wait 0.5;
    }
    task function_1991fd659fa220ba(bombent);
    if (task.plantedbombs.size <= 0) {
        task thread function_2344407dc24ee69(undefined, 1);
    }
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa4
// Size: 0x1ef
function function_1991fd659fa220ba(bombent) {
    task = self;
    origin = bombent.origin + (0, 0, 80);
    physicsexplosionsphere(origin, task.circleradius, task.circleradius / 2, 400);
    bombent radiusdamage(origin, 1024, 700, 100, bombent, "MOD_EXPLOSIVE", "c4_mp");
    playsoundatpos(origin, "exp_bombsite_lr");
    playfx(level._effect["bomb_squad_explosion"], origin);
    shellshock_artilleryearthquake(origin, undefined, 3.5, task.circleradius);
    if (isdefined(bombent.visuals) && isdefined(bombent.visuals[0])) {
        bombent.visuals[0] delete();
    }
    bombent delete();
    foreach (player in task.players) {
        if (!isdefined(player)) {
            continue;
        }
        var_aa128e29d7c10074 = scripts\cp_mp\utility\game_utility::isaigameparticipant(player);
        if (var_aa128e29d7c10074) {
            continue;
        }
        player thread applyflash(player, 1);
        player.var_e09c6ea56555f1ed = undefined;
        player.var_ed5a962d857703ec = undefined;
    }
    if (isdefined(bombent)) {
        task.plantedbombs = array_remove(task.plantedbombs, bombent);
        return;
    }
    if (isdefined(task.plantedbombs) && isdefined(task.plantedbombs.size) && task.plantedbombs.size <= 1) {
        task.plantedbombs = [];
    }
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c9b
// Size: 0x40
function function_4f1a578f63d4ed56(dropstruct, player) {
    fortress = self;
    fortress namespace_bd614c3c2275579a::function_5c26662d5381e975(player, undefined, undefined, 1);
    function_84348b61e96b6c3c(dropstruct, player, fortress.crate);
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ce3
// Size: 0x1b8
function function_36b22d1548152da8(skipspawn) {
    task = self;
    if (isdefined(task.owner) && isdefined(task.owner.crate)) {
        success = function_1fb399bcaeb556a1(task.owner.crate.origin, skipspawn);
        assertex(success, "brTask_bomb_squad: No valid bomb plant locations found!");
        if (!istrue(success)) {
            logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, task.owner) + " : Failed to plant bomb.");
            return;
        }
        return;
    }
    task.availablenodes = undefined;
    if (task.owner.elites.size > 0) {
        task.availablenodes = task.owner.elites;
    } else if (task.owner.guardnodes.size > 0) {
        task.availablenodes = task.owner.guardnodes;
    }
    while (task.plantedbombs.size < 1) {
        success = task function_ffde3ee5ae09d317(task.plantedbombs.size);
        assertex(success, "brTask_bomb_squad: No valid bomb plant locations found!");
        if (!istrue(success)) {
            logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, task.owner) + " : Failed to plant bomb.");
            return;
        }
    }
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea3
// Size: 0xb2
function function_17608c84bbcddd1c(bombnum) {
    task = self;
    scalars = [0.1, 0.3, 0.5, 0.7, 0.9];
    foreach (radiusscalar in scalars) {
        success = function_7df1f88002cc047e(bombnum, radiusscalar);
        if (istrue(success)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f5e
// Size: 0x86
function function_7df1f88002cc047e(bombnum, radiusscalar) {
    task = self;
    safeorigin = undefined;
    for (attempts = 0; attempts < 10; attempts++) {
        safeorigin = task.circlecenter + randomonunitsphere() * task.circleradius * radiusscalar;
        safeorigin = getclosestpointonnavmesh(safeorigin);
        if (function_31ffdca84c5aa051(safeorigin)) {
            task function_60f28d93d054020e(safeorigin, bombnum);
            return true;
        }
    }
    return false;
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fed
// Size: 0x1d
function function_31ffdca84c5aa051(point) {
    if (isdefined(point)) {
        if (ispointonnavmesh(point)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2013
// Size: 0x1cb
function function_60f28d93d054020e(safeorigin, bombnum, originoverride, skipspawn) {
    task = self;
    bombent = undefined;
    fullspawn = undefined;
    bombmodel = "offhand_2h_wm_briefcase_bomb_v0";
    if (istrue(skipspawn) && isdefined(task.plantedbombs) && isdefined(task.plantedbombs[bombnum])) {
        bombent = task.plantedbombs[bombnum];
    }
    offset = (0, 0, 22);
    safeorigin += offset;
    if (!istrue(skipspawn) || !isdefined(bombent)) {
        bombent = spawn("script_model", safeorigin);
        fullspawn = 1;
    }
    bombent.origin = safeorigin;
    if (isdefined(originoverride)) {
        bombmodel = "tag_origin";
        bombent.startorigin = safeorigin;
    }
    if (!istrue(skipspawn) || istrue(fullspawn)) {
        bombent setmodel(bombmodel);
        bombent.visuals = [];
        bombent.visuals[0] = spawn("script_model", bombent.origin);
        bombent.visuals[0] setmodel("tag_origin");
        bombent.trigger = spawnstruct();
        bombent.objidnum = -1;
        task.plantedbombs[bombnum] = bombent;
    }
    bombent.curorigin = bombent.origin;
    bombent.safeorigin = bombent.origin;
    bombent scripts\mp\gameobjects::setdropped(undefined, undefined);
    task thread function_682e6a05a3109ea1(bombent);
    task thread function_ba7471068b9cf103(bombent);
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21e6
// Size: 0x4b
function private function_ba62e3f440dc0288(player) {
    bomb = makeweapon("briefcase_bomb_mp");
    player scripts\cp_mp\utility\inventory_utility::_giveweapon(bomb, undefined, undefined, 0);
    player setweaponammostock(bomb, 0);
    player setweaponammoclip(bomb, 0);
    player thread scripts\mp\gameobjects::switchtouseweapon(bomb, 1);
    return bomb;
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x223a
// Size: 0x111
function private function_ba7471068b9cf103(bombent) {
    task = self;
    bombent makeusable();
    bombent disableplayeruseforallplayers();
    foreach (player in task.players) {
        bombent enableplayeruse(player);
    }
    bombent sethintstring(%MP_DMZ_MISSIONS/DMZ_DESTROY_SAM_SAMSITE_DEFUSE_HINT);
    bombent sethinticon("ui_map_icon_obj_sh_bomb_defuse");
    bombent sethintdisplayrange(1024);
    bombent setuserange(90);
    bombent setcursorhint("HINT_BUTTON");
    bombent sethintdisplayfov(120);
    bombent setusefov(120);
    bombent sethintrequiresholding(1);
    bombent setuseholdduration("duration_short");
    task.bombent = bombent;
    player = bombent waittill("trigger");
    function_ba62e3f440dc0288(player);
    bombent hide();
    bombent makeunusable();
    function_7d5530038bb0f3ad(task, player, bombent);
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2353
// Size: 0x9b
function private function_e14909a9c0b08d64(player, bombent) {
    droporigin = player.origin;
    if (isdefined(bombent.startorigin)) {
        droporigin = bombent.startorigin;
        bombent show();
        bombent.trigger.origin = droporigin;
        return;
    }
    safeorigin = getclosestpointonnavmesh(droporigin);
    bombent.origin = safeorigin;
    bombent.trigger.origin = safeorigin;
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f6
// Size: 0xa1
function function_ffde3ee5ae09d317(bombnum) {
    task = self;
    if (!isdefined(task.availablenodes)) {
        return false;
    }
    var_bac262a232c827c2 = task.availablenodes[randomint(task.availablenodes.size)];
    safeorigin = getclosestpointonnavmesh(var_bac262a232c827c2.origin);
    if (function_31ffdca84c5aa051(safeorigin)) {
        task function_60f28d93d054020e(safeorigin, bombnum);
        task.availablenodes = array_remove(task.availablenodes, var_bac262a232c827c2);
        return true;
    }
    return false;
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a0
// Size: 0x52
function function_1fb399bcaeb556a1(origin, skipspawn) {
    task = self;
    if (!isdefined(origin)) {
        return false;
    }
    safeorigin = getclosestpointonnavmesh(origin);
    if (function_31ffdca84c5aa051(safeorigin)) {
        task function_60f28d93d054020e(safeorigin, 0, 1, skipspawn);
        return true;
    }
    return false;
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24fb
// Size: 0x1d5
function function_84348b61e96b6c3c(dropstruct, player, crate) {
    var_557e3ae920e08a75 = getdvarint(@"hash_3174d9a2553a5fa7", 1);
    lootdrops = getscriptcachecontents("bomb_defuse_reward", 0);
    var_df2f68507645906f = ["brloot_super_munitionsbox", "brloot_super_armorbox"];
    teammatecount = undefined;
    teammates = scripts\mp\utility\teams::getsquadmates(player.team, player.sessionsquadid, 0);
    if (isdefined(teammates)) {
        teammatecount = teammates.size;
    }
    if (var_557e3ae920e08a75 >= 0) {
        for (i = 0; i < var_557e3ae920e08a75; i++) {
            randomindex = randomintrange(0, 25);
            lootdrops = getscriptcachecontents("bomb_defuse_reward", randomindex);
            function_38bf039a4df5d1ac(dropstruct, player, crate, lootdrops);
        }
    } else if (isdefined(teammatecount)) {
        for (i = 0; i < teammatecount; i++) {
            randomindex = randomintrange(0, 25);
            lootdrops = getscriptcachecontents("bomb_defuse_reward", randomindex);
            lootdrops[lootdrops.size] = var_df2f68507645906f[i % var_df2f68507645906f.size];
            function_38bf039a4df5d1ac(dropstruct, player, crate, lootdrops);
        }
    } else {
        function_38bf039a4df5d1ac(dropstruct, player, crate, lootdrops);
    }
    if (getdvarint(@"hash_81e631c248118cd6", 1) != 1) {
        return;
    }
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
    count = level.br_pickups.counts["brloot_gascan_palfa"];
    spawned = scripts\mp\gametypes\br_pickups::spawnpickup("brloot_gascan_palfa", dropinfo, count);
}

// Namespace namespace_b797504d70db7f41 / namespace_c96c5decac69fc6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26d8
// Size: 0x116
function function_38bf039a4df5d1ac(dropstruct, player, crate, lootdrops) {
    if (isdefined(crate) && getdvarint(@"hash_13c3754911cca521", 1)) {
        crate.itemsdropped = 0;
        crate scripts\mp\gametypes\br_lootcache::lootspawnitemlist(dropstruct, lootdrops, 1, player);
        return;
    }
    count = undefined;
    foreach (lootdrop in lootdrops) {
        dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
        count = level.br_pickups.counts[lootdrop];
        spawned = scripts\mp\gametypes\br_pickups::spawnpickup(lootdrop, dropinfo, count);
        if (isdefined(spawned)) {
            spawned setscriptablepartstate(lootdrop, "dropped");
        }
    }
}

