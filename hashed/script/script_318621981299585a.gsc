// mwiii decomp prototype
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
#using script_3314add7998ab13;
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

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5db
// Size: 0x104
function function_7aae8cb0d8b0ac6a(data) {
    level.var_86260c6231072e89 = spawnstruct();
    level.var_86260c6231072e89.circleradius = getdvarint(@"hash_ed78eecb63877c7c", 2000);
    level.var_86260c6231072e89.var_bf9c07649959c8cb = getdvarint(@"hash_b482aff66d7abae4", 1000);
    level.var_86260c6231072e89.var_24972db4c00b613b = level.var_86260c6231072e89.var_bf9c07649959c8cb * level.var_86260c6231072e89.var_bf9c07649959c8cb;
    level.var_86260c6231072e89.var_ed2e5cf91bff3a6f = getdvarfloat(@"hash_3e60557305f8da61", 0.65);
    data.createfunc = &function_fefd14a6940e2b99;
    if (!isdefined(level._effect["bomb_squad_explosion"])) {
        level._effect["bomb_squad_explosion"] = loadfx("vfx/iw8_mp/gamemode/vfx_search_bombsite_destroy.vfx");
    }
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e6
// Size: 0x1e1
function function_fefd14a6940e2b99(activity, owner) {
    task = function_5f6d9fd82bdd2d05(activity);
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
    task.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.var_40dbdb41f33299f7 = 0;
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

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cf
// Size: 0x9b
function function_b883ad642cd900d6() {
    task = self;
    task.activity.origin = task.owner.origin;
    var_79b9c85900392ad6 = task.owner.var_e1dd7bed632a13c3.origin;
    task.circlecenter = var_79b9c85900392ad6;
    task.circleradius = level.var_86260c6231072e89.circleradius;
    task.originalteam = undefined;
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x971
// Size: 0xff
function function_dd6410a59565d135(teamname, player) {
    task = self;
    teams = [0:teamname];
    var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
    task.owner namespace_bd614c3c2275579a::function_dacf98a6e7acadeb(player, player.team);
    namespace_9823ee6035594d67::function_d95dbf57b47734d9(task.owner, 1);
    task thread namespace_244fdc99ed0f5d2b::function_a33c10c0682918bd(task.owner.var_e1dd7bed632a13c3, 9000);
    if (!isdefined(task.var_e438697ddbdc708c)) {
        task.var_e438697ddbdc708c = [];
    }
    if (task.var_e438697ddbdc708c.size < 1) {
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

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa77
// Size: 0x157
function function_54fac7db1349c874(player) {
    task = self;
    if (!isdefined(array_find(task.players, player))) {
        size = task.players.size;
        task.players[size] = player;
    }
    var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
    if (var_aa128e29d7c10074) {
        return;
    }
    var_d0cb4e7edbd1a617 = player getclientomnvar("ui_br_stronghold_mission");
    player thread namespace_44abc05161e2e2cb::showsplash("stronghold_operation_bomb_disposal");
    wait(4);
    if (!isdefined(player) || !array_contains(task.players, player)) {
        return;
    }
    if (var_d0cb4e7edbd1a617 == player getclientomnvar("ui_br_stronghold_mission")) {
        player setclientomnvar("ui_br_stronghold_mission", task.mission_index);
        player setclientomnvar("ui_br_stronghold_mission_timer", task.endtime);
    }
    namespace_d3d40f75bb4e4c32::brleaderdialogplayer("br_mission_bomb_assigned", player);
    if (!isdefined(task.originalteam)) {
        task.originalteam = player.team;
    }
    for (i = 0; i < task.var_e438697ddbdc708c.size; i++) {
        task.var_e438697ddbdc708c[i] enableplayeruse(player);
    }
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd5
// Size: 0x9b
function function_1d932423d5491347(player) {
    task = self;
    var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
    task.players = array_remove(task.players, player);
    if (var_aa128e29d7c10074) {
        return;
    }
    player setclientomnvar("ui_br_stronghold_mission", task.mission_fail);
    for (i = 0; i < task.var_e438697ddbdc708c.size; i++) {
        task.var_e438697ddbdc708c[i] disableplayeruse(player);
    }
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc77
// Size: 0x1c
function function_7fef8fe4178f164f(teamname) {
    /#
        assert(1, "Bomb Squad is a volume player start stronghold mission only!");
    #/
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9a
// Size: 0x1ca
function function_19809ae1667b5c7a(teamname, var_b677bbe2241c4e3f, detonated) {
    task = self;
    teamplayers = task namespace_244fdc99ed0f5d2b::function_ad20469c1815a7c7(teamname, 0);
    var_5f8fc154303502fa = task namespace_244fdc99ed0f5d2b::function_ad20469c1815a7c7(teamname, 1);
    task function_629ed367d1393020();
    level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname].var_83abcb9b3a5dbe24 = array_remove(level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname].var_83abcb9b3a5dbe24, task.activity.id);
    task.teams = array_remove(task.teams, teamname);
    level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname].active = 0;
    foreach (player in var_5f8fc154303502fa) {
        task.players = array_remove(task.players, player);
        if (namespace_36f464722d326bbe::isaigameparticipant(player)) {
            continue;
        }
        player setclientomnvar("ui_br_stronghold_mission", var_b677bbe2241c4e3f);
        if (var_b677bbe2241c4e3f == task.mission_complete) {
            player thread namespace_44abc05161e2e2cb::showsplash("stronghold_operation_bomb_disposal_completed");
        } else {
            if (istrue(detonated)) {
                player thread namespace_44abc05161e2e2cb::showsplash("stronghold_operation_bomb_disposal_failed");
            } else {
                player thread namespace_44abc05161e2e2cb::showsplash("stronghold_operation_bomb_disposal_poached");
            }
            player setclientomnvar("ui_br_stronghold_mission", 0);
        }
    }
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6b
// Size: 0x78
function function_6118e2119e160883(player) {
    task = self;
    player.var_e09c6ea56555f1ed = 1;
    var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
    if (!var_aa128e29d7c10074) {
        player setclientomnvar("ui_br_stronghold_mission", task.var_bd764b17d3bf6325);
    }
    var_f7a155995ad81eec = gettime() + 9000;
    if (!var_aa128e29d7c10074) {
        player setclientomnvar("ui_br_stronghold_mission_timer", var_f7a155995ad81eec);
    }
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeea
// Size: 0x67
function function_ee2041010cee0afc(player) {
    task = self;
    player.var_e09c6ea56555f1ed = undefined;
    var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
    if (!var_aa128e29d7c10074) {
        player setclientomnvar("ui_br_stronghold_mission", task.mission_index);
        player setclientomnvar("ui_br_stronghold_mission_timer", task.endtime);
    }
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf58
// Size: 0x52
function function_e09f977d133bac40(player) {
    task = self;
    task function_1d932423d5491347(player);
    player.var_e09c6ea56555f1ed = undefined;
    player.var_ed5a962d857703ec = undefined;
    if (isdefined(level.var_fc0e8c2ea4f84613)) {
        task [[ level.var_fc0e8c2ea4f84613 ]](player);
    }
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfb1
// Size: 0x230
function private function_2344407dc24ee69(teamname, detonated) {
    task = self;
    task notify("task_ended");
    namespace_9823ee6035594d67::function_be5a531f97b7c07e(task.owner);
    if (isdefined(level.var_3afacc0c3b10b7fe)) {
        task.owner [[ level.var_3afacc0c3b10b7fe ]](teamname, !istrue(detonated));
    }
    var_ed264f0df8bf58fb = 0;
    foreach (team in task.teams) {
        var_641c32466af43f9 = 0;
        if (isdefined(teamname) && isdefined(team)) {
            var_641c32466af43f9 = team == teamname;
        }
        var_b677bbe2241c4e3f = task.mission_fail;
        if (var_641c32466af43f9) {
            var_ed264f0df8bf58fb = 1;
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
    if (isdefined(task.activity) && isdefined(task.activity.var_b7718b6e41108129) && task.activity.var_b7718b6e41108129.size >= 1 && (var_ed264f0df8bf58fb || detonated)) {
        task.owner.var_e1dd7bed632a13c3 notify("activity_ended");
        level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[task.activity.id] = undefined;
        task.activity.var_b7718b6e41108129 = undefined;
    }
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11e8
// Size: 0xd0
function private function_7d5530038bb0f3ad(instance, player, var_eeb138fae3842a92) {
    success = function_2a647bf074af9087(player, var_eeb138fae3842a92);
    if (success) {
        function_e14909a9c0b08d64(player, var_eeb138fae3842a92);
        if (instance.var_e438697ddbdc708c.size <= 0) {
            dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
            instance function_2344407dc24ee69(player.team);
            function_6f6f83ab76483811(instance, player);
            instance.owner function_4f1a578f63d4ed56(dropstruct, player);
            player namespace_bd614c3c2275579a::function_9d216f4cd30f141d(dropstruct, getteamarray(player.team, 0), instance.originalteam);
        }
    } else {
        if (!isdefined(var_eeb138fae3842a92)) {
            return;
        }
        function_e14909a9c0b08d64(player, var_eeb138fae3842a92);
        instance thread function_ba7471068b9cf103(var_eeb138fae3842a92);
    }
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12bf
// Size: 0x13c
function private function_2a647bf074af9087(player, var_eeb138fae3842a92) {
    task = self;
    item = makeweapon("briefcase_bomb_mp");
    player namespace_df5cfdbe6e2d3812::_giveweapon(item, undefined, undefined, 0);
    player setweaponammostock(item, 0);
    player setweaponammoclip(item, 0);
    player thread namespace_19b4203b51d56488::switchtouseweapon(item, 1);
    timepassed = 0;
    while (timepassed < 3 && gettime() < task.endtime) {
        if (!isalive(player) || isinlaststand(player) || isdefined(player.var_2ca0dac193d83c1) && player.var_2ca0dac193d83c1 || player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
            player namespace_df5cfdbe6e2d3812::getridofweapon("briefcase_bomb_mp");
            return 0;
        }
        timepassed = timepassed + level.framedurationseconds;
        waitframe();
    }
    if (isdefined(player) && isreallyalive(player)) {
        player namespace_df5cfdbe6e2d3812::getridofweapon("briefcase_bomb_mp");
        if (gettime() < task.endtime) {
            task.var_e438697ddbdc708c = array_remove(task.var_e438697ddbdc708c, var_eeb138fae3842a92);
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1403
// Size: 0x15d
function function_e9abe9c2bf9878f0() {
    task = self;
    caches = getlootscriptablearrayinradius("br_loot_cache", undefined, task.circlecenter, task.circleradius);
    if (!isdefined(caches)) {
        return undefined;
    }
    caches = array_randomize(caches);
    var_6e7f9ed0bf7f726 = [0:0.1, 1:0.3, 2:0.5, 3:0.7, 4:0.9];
    cache = task function_a77cbe5355057772(caches, var_6e7f9ed0bf7f726, 0);
    if (!isdefined(cache)) {
        var_6e7f9ed0bf7f726 = [0:0.1, 1:0.3, 2:0.5, 3:0.7, 4:0.9, 5:1];
        cache = task function_a77cbe5355057772(caches, var_6e7f9ed0bf7f726, 0);
        /#
            assert(isdefined(cache), "BOMB SQUAD: No cache could found or freed");
        #/
        task thread function_2344407dc24ee69(undefined, 1);
    }
    cache.task = task;
    task.cache = cache;
    cache.contents = [];
    cache function_35768a5b1ebba1a0();
    cache.contents[1]["quantity"] = 50;
    cache.contents[1]["lootID"] = 8395;
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1567
// Size: 0x12a
function function_a77cbe5355057772(locations, var_e83038f37b2b5870, var_8a0186f902bafaef) {
    task = self;
    if (!isdefined(var_8a0186f902bafaef)) {
        var_8a0186f902bafaef = 0;
    }
    foreach (var_11065b20b77735a3 in var_e83038f37b2b5870) {
        foreach (node in locations) {
            if (istrue(node.inuse) && !var_8a0186f902bafaef) {
                continue;
            }
            dist = distance2d(node.origin, task.circlecenter);
            if (dist < task.circleradius * var_11065b20b77735a3) {
                if (var_8a0186f902bafaef) {
                    node.inuse = 0;
                    node freescriptable();
                }
                return node;
            }
        }
    }
    return undefined;
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1699
// Size: 0x55
function function_35768a5b1ebba1a0() {
    cache = self;
    cache.contents[0]["quantity"] = 1;
    cache.contents[0]["lootID"] = 8608;
    cache.contents[0]["callback"] = &function_7d5530038bb0f3ad;
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f5
// Size: 0x120
function function_5cbd566bcb47d26e() {
    task = self;
    if (istrue(task.var_6dfd52fc458dd6a0)) {
        return;
    }
    level endon("game_ended");
    task endon("task_ended");
    task.owner.var_e1dd7bed632a13c3 endon("deleted");
    task.owner.var_e1dd7bed632a13c3 endon("activity_ended");
    waittime = task.owner.var_cab871d72c8eb111[0];
    task.var_6dfd52fc458dd6a0 = 1;
    task.starttime = gettime();
    task.endtime = task.starttime + waittime * 1000;
    task thread function_c98c343e42951ea2(task.endtime, 3000);
    wait(waittime);
    for (i = 0; i < task.var_e438697ddbdc708c.size; i++) {
        task function_1991fd659fa220ba(task.var_e438697ddbdc708c[i]);
    }
    task thread function_2344407dc24ee69(undefined, 1);
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181c
// Size: 0x18f
function function_c98c343e42951ea2(var_f28399727742eb23, offset) {
    task = self;
    level endon("game_ended");
    self endon("task_ended");
    currenttime = gettime();
    var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
    while (var_c301d652d9a73075 > 0 && isdefined(task.var_eeb138fae3842a92)) {
        currenttime = gettime();
        var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
        if (var_c301d652d9a73075 <= 7000 + offset) {
            if (var_c301d652d9a73075 <= 250) {
                if (soundexists("breach_warning_beep_05")) {
                    task.var_eeb138fae3842a92 playsound("breach_warning_beep_05");
                }
            } else if (var_c301d652d9a73075 <= 750) {
                if (soundexists("breach_warning_beep_04")) {
                    task.var_eeb138fae3842a92 playsound("breach_warning_beep_04");
                }
            } else if (var_c301d652d9a73075 <= 1500) {
                if (soundexists("breach_warning_beep_03")) {
                    task.var_eeb138fae3842a92 playsound("breach_warning_beep_03");
                }
            } else if (soundexists("breach_warning_beep_02")) {
                task.var_eeb138fae3842a92 playsound("breach_warning_beep_02");
            }
            wait(0.25);
        } else if (var_c301d652d9a73075 <= 15000 + offset) {
            if (soundexists("breach_warning_beep_02")) {
                task.var_eeb138fae3842a92 playsound("breach_warning_beep_02");
            }
            wait(0.5);
        } else {
            if (soundexists("breach_warning_beep_01")) {
                task.var_eeb138fae3842a92 playsound("breach_warning_beep_01");
            }
            wait(1);
        }
    }
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b2
// Size: 0xea
function function_682e6a05a3109ea1(var_eeb138fae3842a92) {
    task = self;
    level endon("game_ended");
    task endon("task_ended");
    task.owner.var_e1dd7bed632a13c3 endon("deleted");
    task.owner.var_e1dd7bed632a13c3 endon("activity_ended");
    if (!isdefined(var_eeb138fae3842a92)) {
        return;
    }
    if (istrue(var_eeb138fae3842a92.var_d7be9c77ce31b93d)) {
        return;
    }
    origin = var_eeb138fae3842a92.origin + (0, 0, 40);
    var_eeb138fae3842a92.var_d7be9c77ce31b93d = 1;
    waitframe();
    waittillframeend();
    while (namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(origin) || namespace_bbc79db4c3949a5c::function_a465e3c1371d7dab(origin)) {
        wait(0.5);
    }
    task function_1991fd659fa220ba(var_eeb138fae3842a92);
    if (task.var_e438697ddbdc708c.size <= 0) {
        task thread function_2344407dc24ee69(undefined, 1);
    }
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa4
// Size: 0x1f0
function function_1991fd659fa220ba(var_eeb138fae3842a92) {
    task = self;
    origin = var_eeb138fae3842a92.origin + (0, 0, 80);
    physicsexplosionsphere(origin, task.circleradius, task.circleradius / 2, 400);
    var_eeb138fae3842a92 radiusdamage(origin, 1024, 700, 100, var_eeb138fae3842a92, "MOD_EXPLOSIVE", "c4_mp");
    playsoundatpos(origin, "exp_bombsite_lr");
    playfx(level._effect["bomb_squad_explosion"], origin);
    shellshock_artilleryearthquake(origin, undefined, 3.5, task.circleradius);
    if (isdefined(var_eeb138fae3842a92.visuals) && isdefined(var_eeb138fae3842a92.visuals[0])) {
        var_eeb138fae3842a92.visuals[0] delete();
    }
    var_eeb138fae3842a92 delete();
    foreach (player in task.players) {
        if (!isdefined(player)) {
            continue;
        }
        var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
        if (var_aa128e29d7c10074) {
            continue;
        }
        player thread applyflash(player, 1);
        player.var_e09c6ea56555f1ed = undefined;
        player.var_ed5a962d857703ec = undefined;
    }
    if (isdefined(var_eeb138fae3842a92)) {
        task.var_e438697ddbdc708c = array_remove(task.var_e438697ddbdc708c, var_eeb138fae3842a92);
    } else if (isdefined(task.var_e438697ddbdc708c) && isdefined(task.var_e438697ddbdc708c.size) && task.var_e438697ddbdc708c.size <= 1) {
        task.var_e438697ddbdc708c = [];
    }
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c9b
// Size: 0x41
function function_4f1a578f63d4ed56(dropstruct, player) {
    fortress = self;
    fortress namespace_bd614c3c2275579a::function_5c26662d5381e975(player, undefined, undefined, 1);
    function_84348b61e96b6c3c(dropstruct, player, fortress.crate);
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ce3
// Size: 0x1b9
function function_36b22d1548152da8(var_c3e0e015de4435fd) {
    task = self;
    if (isdefined(task.owner) && isdefined(task.owner.crate)) {
        success = function_1fb399bcaeb556a1(task.owner.crate.origin, var_c3e0e015de4435fd);
        /#
            assertex(success, "brTask_bomb_squad: No valid bomb plant locations found!");
        #/
        if (!istrue(success)) {
            logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, task.owner) + " : Failed to plant bomb.");
            return;
        }
        return;
    }
    task.var_336a7187172ce931 = undefined;
    if (task.owner.elites.size > 0) {
        task.var_336a7187172ce931 = task.owner.elites;
    } else if (task.owner.var_2ef873e30a270bcf.size > 0) {
        task.var_336a7187172ce931 = task.owner.var_2ef873e30a270bcf;
    }
    while (task.var_e438697ddbdc708c.size < 1) {
        success = task function_ffde3ee5ae09d317(task.var_e438697ddbdc708c.size);
        /#
            assertex(success, "brTask_bomb_squad: No valid bomb plant locations found!");
        #/
        if (!istrue(success)) {
            logstring("BR STRONGHOLD " + array_find(level.var_f1073fbd45b59a06.var_df987907a483df89, task.owner) + " : Failed to plant bomb.");
            return;
        }
    }
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea3
// Size: 0xb3
function function_17608c84bbcddd1c(var_a68180faaebb813b) {
    task = self;
    var_6e7f9ed0bf7f726 = [0:0.1, 1:0.3, 2:0.5, 3:0.7, 4:0.9];
    foreach (var_11065b20b77735a3 in var_6e7f9ed0bf7f726) {
        success = function_7df1f88002cc047e(var_a68180faaebb813b, var_11065b20b77735a3);
        if (istrue(success)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f5e
// Size: 0x87
function function_7df1f88002cc047e(var_a68180faaebb813b, var_11065b20b77735a3) {
    task = self;
    safeorigin = undefined;
    for (attempts = 0; attempts < 10; attempts++) {
        safeorigin = task.circlecenter + randomonunitsphere() * task.circleradius * var_11065b20b77735a3;
        safeorigin = getclosestpointonnavmesh(safeorigin);
        if (function_31ffdca84c5aa051(safeorigin)) {
            task function_60f28d93d054020e(safeorigin, var_a68180faaebb813b);
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fed
// Size: 0x1e
function function_31ffdca84c5aa051(point) {
    if (isdefined(point)) {
        if (ispointonnavmesh(point)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2013
// Size: 0x1cc
function function_60f28d93d054020e(safeorigin, var_a68180faaebb813b, var_f9cbff5134da960b, var_c3e0e015de4435fd) {
    task = self;
    var_eeb138fae3842a92 = undefined;
    var_9b7391dbe8e49ae7 = undefined;
    var_6d2552e5d036e732 = "offhand_2h_wm_briefcase_bomb_v0";
    if (istrue(var_c3e0e015de4435fd) && isdefined(task.var_e438697ddbdc708c) && isdefined(task.var_e438697ddbdc708c[var_a68180faaebb813b])) {
        var_eeb138fae3842a92 = task.var_e438697ddbdc708c[var_a68180faaebb813b];
    }
    offset = (0, 0, 22);
    safeorigin = safeorigin + offset;
    if (!istrue(var_c3e0e015de4435fd) || !isdefined(var_eeb138fae3842a92)) {
        var_eeb138fae3842a92 = spawn("script_model", safeorigin);
        var_9b7391dbe8e49ae7 = 1;
    }
    var_eeb138fae3842a92.origin = safeorigin;
    if (isdefined(var_f9cbff5134da960b)) {
        var_6d2552e5d036e732 = "tag_origin";
        var_eeb138fae3842a92.startorigin = safeorigin;
    }
    if (!istrue(var_c3e0e015de4435fd) || istrue(var_9b7391dbe8e49ae7)) {
        var_eeb138fae3842a92 setmodel(var_6d2552e5d036e732);
        var_eeb138fae3842a92.visuals = [];
        var_eeb138fae3842a92.visuals[0] = spawn("script_model", var_eeb138fae3842a92.origin);
        var_eeb138fae3842a92.visuals[0] setmodel("tag_origin");
        var_eeb138fae3842a92.trigger = spawnstruct();
        var_eeb138fae3842a92.objidnum = -1;
        task.var_e438697ddbdc708c[var_a68180faaebb813b] = var_eeb138fae3842a92;
    }
    var_eeb138fae3842a92.curorigin = var_eeb138fae3842a92.origin;
    var_eeb138fae3842a92.safeorigin = var_eeb138fae3842a92.origin;
    var_eeb138fae3842a92 namespace_19b4203b51d56488::setdropped(undefined, undefined);
    task thread function_682e6a05a3109ea1(var_eeb138fae3842a92);
    task thread function_ba7471068b9cf103(var_eeb138fae3842a92);
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21e6
// Size: 0x4c
function private function_ba62e3f440dc0288(player) {
    bomb = makeweapon("briefcase_bomb_mp");
    player namespace_df5cfdbe6e2d3812::_giveweapon(bomb, undefined, undefined, 0);
    player setweaponammostock(bomb, 0);
    player setweaponammoclip(bomb, 0);
    player thread namespace_19b4203b51d56488::switchtouseweapon(bomb, 1);
    return bomb;
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x223a
// Size: 0x112
function private function_ba7471068b9cf103(var_eeb138fae3842a92) {
    task = self;
    var_eeb138fae3842a92 makeusable();
    var_eeb138fae3842a92 disableplayeruseforallplayers();
    foreach (player in task.players) {
        var_eeb138fae3842a92 enableplayeruse(player);
    }
    var_eeb138fae3842a92 sethintstring("MP_DMZ_MISSIONS/DMZ_DESTROY_SAM_SAMSITE_DEFUSE_HINT");
    var_eeb138fae3842a92 sethinticon("ui_map_icon_obj_sh_bomb_defuse");
    var_eeb138fae3842a92 sethintdisplayrange(1024);
    var_eeb138fae3842a92 setuserange(90);
    var_eeb138fae3842a92 setcursorhint("HINT_BUTTON");
    var_eeb138fae3842a92 sethintdisplayfov(120);
    var_eeb138fae3842a92 setusefov(120);
    var_eeb138fae3842a92 sethintrequiresholding(1);
    var_eeb138fae3842a92 setuseholdduration("duration_short");
    task.var_eeb138fae3842a92 = var_eeb138fae3842a92;
    player = var_eeb138fae3842a92 waittill("trigger");
    function_ba62e3f440dc0288(player);
    var_eeb138fae3842a92 hide();
    var_eeb138fae3842a92 makeunusable();
    function_7d5530038bb0f3ad(task, player, var_eeb138fae3842a92);
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2353
// Size: 0x9c
function private function_e14909a9c0b08d64(player, var_eeb138fae3842a92) {
    droporigin = player.origin;
    if (isdefined(var_eeb138fae3842a92.startorigin)) {
        droporigin = var_eeb138fae3842a92.startorigin;
        var_eeb138fae3842a92 show();
        var_eeb138fae3842a92.trigger.origin = droporigin;
    } else {
        safeorigin = getclosestpointonnavmesh(droporigin);
        var_eeb138fae3842a92.origin = safeorigin;
        var_eeb138fae3842a92.trigger.origin = safeorigin;
    }
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f6
// Size: 0xa2
function function_ffde3ee5ae09d317(var_a68180faaebb813b) {
    task = self;
    if (!isdefined(task.var_336a7187172ce931)) {
        return 0;
    }
    var_bac262a232c827c2 = task.var_336a7187172ce931[randomint(task.var_336a7187172ce931.size)];
    safeorigin = getclosestpointonnavmesh(var_bac262a232c827c2.origin);
    if (function_31ffdca84c5aa051(safeorigin)) {
        task function_60f28d93d054020e(safeorigin, var_a68180faaebb813b);
        task.var_336a7187172ce931 = array_remove(task.var_336a7187172ce931, var_bac262a232c827c2);
        return 1;
    }
    return 0;
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a0
// Size: 0x53
function function_1fb399bcaeb556a1(origin, var_c3e0e015de4435fd) {
    task = self;
    if (!isdefined(origin)) {
        return 0;
    }
    safeorigin = getclosestpointonnavmesh(origin);
    if (function_31ffdca84c5aa051(safeorigin)) {
        task function_60f28d93d054020e(safeorigin, 0, 1, var_c3e0e015de4435fd);
        return 1;
    }
    return 0;
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24fb
// Size: 0x1d6
function function_84348b61e96b6c3c(dropstruct, player, crate) {
    var_557e3ae920e08a75 = getdvarint(@"hash_3174d9a2553a5fa7", 1);
    var_75ea56ac509fed3b = getscriptcachecontents("bomb_defuse_reward", 0);
    var_df2f68507645906f = [0:"brloot_super_munitionsbox", 1:"brloot_super_armorbox"];
    teammatecount = undefined;
    teammates = namespace_54d20dd0dd79277f::getsquadmates(player.team, player.var_ff97225579de16a, 0);
    if (isdefined(teammates)) {
        teammatecount = teammates.size;
    }
    if (var_557e3ae920e08a75 >= 0) {
        for (i = 0; i < var_557e3ae920e08a75; i++) {
            randomindex = randomintrange(0, 25);
            var_75ea56ac509fed3b = getscriptcachecontents("bomb_defuse_reward", randomindex);
            function_38bf039a4df5d1ac(dropstruct, player, crate, var_75ea56ac509fed3b);
        }
    } else if (isdefined(teammatecount)) {
        for (i = 0; i < teammatecount; i++) {
            randomindex = randomintrange(0, 25);
            var_75ea56ac509fed3b = getscriptcachecontents("bomb_defuse_reward", randomindex);
            var_75ea56ac509fed3b[var_75ea56ac509fed3b.size] = var_df2f68507645906f[i % var_df2f68507645906f.size];
            function_38bf039a4df5d1ac(dropstruct, player, crate, var_75ea56ac509fed3b);
        }
    } else {
        function_38bf039a4df5d1ac(dropstruct, player, crate, var_75ea56ac509fed3b);
    }
    if (getdvarint(@"hash_81e631c248118cd6", 1) != 1) {
        return;
    } else {
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
        count = level.br_pickups.counts["brloot_gascan_palfa"];
        spawned = namespace_cb965d2f71fefddc::spawnpickup("brloot_gascan_palfa", var_cb4fad49263e20c4, count);
    }
}

// Namespace namespace_b797504d70db7f41/namespace_c96c5decac69fc6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26d8
// Size: 0x117
function function_38bf039a4df5d1ac(dropstruct, player, crate, var_75ea56ac509fed3b) {
    if (isdefined(crate) && getdvarint(@"hash_13c3754911cca521", 1)) {
        crate.itemsdropped = 0;
        crate namespace_1b7e64f50cca9321::lootspawnitemlist(dropstruct, var_75ea56ac509fed3b, 1, player);
        return;
    }
    count = undefined;
    foreach (var_5b63aed4a779b0aa in var_75ea56ac509fed3b) {
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
        count = level.br_pickups.counts[var_5b63aed4a779b0aa];
        spawned = namespace_cb965d2f71fefddc::spawnpickup(var_5b63aed4a779b0aa, var_cb4fad49263e20c4, count);
        if (isdefined(spawned)) {
            spawned setscriptablepartstate(var_5b63aed4a779b0aa, "dropped");
        }
    }
}

