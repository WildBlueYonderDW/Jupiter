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
#using script_64acb6ce534155b7;
#using script_744cad313ed0a87e;
#using script_4f9a55dee6aebc8f;
#using script_4948cdf739393d2d;
#using scripts\mp\hud_message.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace namespace_348001a7426cedd2;

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x486
// Size: 0x114
function function_7aae8cb0d8b0ac6a(data) {
    level.var_7137de4e4fb0399b = spawnstruct();
    level.var_7137de4e4fb0399b.circleradius = getdvarint(@"hash_35e83d2a6cda99b8", 2000);
    level.var_7137de4e4fb0399b.var_bf9c07649959c8cb = getdvarint(@"hash_b3b453252c46e3b0", 1000);
    level.var_7137de4e4fb0399b.var_24972db4c00b613b = level.var_7137de4e4fb0399b.var_bf9c07649959c8cb * level.var_7137de4e4fb0399b.var_bf9c07649959c8cb;
    level.var_7137de4e4fb0399b.var_ed2e5cf91bff3a6f = getdvarfloat(@"hash_75c1cf1a1116077d", 0.65);
    level.var_7137de4e4fb0399b.headicon = "ui_map_icon_boss_juggernaut";
    level.var_7137de4e4fb0399b.var_41659fa814cedceb = getdvarint(@"hash_b22e8fbab2a4e00a", 1);
    data.createfunc = &function_fefd14a6940e2b99;
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a1
// Size: 0x1e3
function function_fefd14a6940e2b99(activity, owner) {
    task = function_5f6d9fd82bdd2d05(activity);
    task.owner = owner;
    owner.task = task;
    task.players = [];
    task.funcs["onInit"] = &function_380918284873494;
    task.funcs["onPlayerAssigned"] = &function_dd6410a59565d135;
    task.funcs["onPlayerJoined"] = &function_5f7cd2f25352a816;
    task.funcs["onPlayerRemoved"] = &function_12a444ed47d9c24d;
    task.funcs["onTeamStart"] = &function_a5870532237f7ad;
    task.funcs["onPlayerExitVolume"] = &function_bb405816fb180a81;
    task.funcs["onPlayerExitTimeout"] = &function_e09f977d133bac40;
    task.funcs["onPlayerReenterVolume"] = &function_a0e410e1941cb7a;
    task.ref = "br_poi";
    task.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.var_40dbdb41f33299f7 = 0;
    task.tier = task.owner namespace_bd614c3c2275579a::function_b7a9796c95aa8e8d();
    if (task.tier == "black") {
        task.mission_index = 20;
        task.mission_complete = 21;
        task.mission_fail = 36;
        task.var_bd764b17d3bf6325 = 0;
    } else {
        task.mission_index = 20;
        task.mission_complete = 21;
        task.mission_fail = 36;
        task.var_bd764b17d3bf6325 = 0;
    }
    return task;
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78c
// Size: 0x90
function function_380918284873494() {
    task = self;
    task.activity.origin = task.owner.origin;
    var_79b9c85900392ad6 = task.owner.var_e1dd7bed632a13c3.origin;
    task.circlecenter = var_79b9c85900392ad6;
    task.circleradius = level.var_7137de4e4fb0399b.circleradius;
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x823
// Size: 0x1cd
function function_dd6410a59565d135(teamname, player) {
    task = self;
    teams = [0:teamname];
    var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
    if (level.var_7137de4e4fb0399b.var_41659fa814cedceb) {
        task namespace_b8f885001f04bb5::function_dd6410a59565d135(teamname, player, 1);
        task.var_54f5e15c58954932.var_3c83e6760ebc0979 = 1;
        task.var_54f5e15c58954932.var_554291b6257ea5d0 = 1;
    }
    namespace_9823ee6035594d67::function_d95dbf57b47734d9(task.owner, 1);
    task thread namespace_244fdc99ed0f5d2b::function_a33c10c0682918bd(task.owner.var_e1dd7bed632a13c3, 9000);
    if (!istrue(task.owner.var_b6b4e335d507b8b4)) {
        task.owner notify("brStronghold_spawnBoss");
        task.owner waittill("brStronghold_spawnedBoss");
    }
    task.target = task.owner.var_837c4b569aa8a376[randomint(task.owner.var_837c4b569aa8a376.size)];
    if (!istrue(task.var_93b326b65f998145)) {
        task.var_93b326b65f998145 = 1;
        task thread function_92efd6eb7ec14081();
        task function_b005a227c7052bab();
        players = [0:player];
        namespace_bd614c3c2275579a::function_ac7dce0a21508d6e("blacksite_jugg_warn", players);
    }
    if (var_aa128e29d7c10074) {
        task thread function_5cbd566bcb47d26e();
        task function_5f7cd2f25352a816(player);
        return;
    }
    task thread function_5cbd566bcb47d26e(player);
    task thread function_682e6a05a3109ea1(player);
    task function_a92867e16c21da22(teamname);
    task function_5f7cd2f25352a816(player);
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f7
// Size: 0x188
function function_5f7cd2f25352a816(player) {
    task = self;
    if (!isdefined(array_find(task.players, player))) {
        size = task.players.size;
        task.players[size] = player;
    }
    if (level.var_7137de4e4fb0399b.var_41659fa814cedceb) {
        namespace_b8f885001f04bb5::function_b380232fafd74325(player, 1);
    }
    var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
    if (var_aa128e29d7c10074) {
        return;
    }
    var_d0cb4e7edbd1a617 = player getclientomnvar("ui_br_stronghold_mission");
    if (isdefined(task.target)) {
        players = task.players;
        if (isdefined(task.players)) {
            if (randomint(100) > 50) {
                namespace_bd614c3c2275579a::function_ac7dce0a21508d6e("blacksite_jugg_defend", players);
            } else {
                namespace_bd614c3c2275579a::function_ac7dce0a21508d6e("blacksite_jugg_engage", players);
            }
        }
    }
    player thread namespace_44abc05161e2e2cb::showsplash("stronghold_operation_person_of_interest");
    wait(4);
    if (!isdefined(player) || !array_contains(task.players, player)) {
        return;
    }
    if (var_d0cb4e7edbd1a617 == player getclientomnvar("ui_br_stronghold_mission")) {
        player setclientomnvar("ui_br_stronghold_mission", task.mission_index);
        if (!istrue(level.var_870abcbf773fbd8c)) {
            player setclientomnvar("ui_br_stronghold_mission_timer", 0);
        } else {
            player setclientomnvar("ui_br_stronghold_mission_timer", task.endtime);
        }
    }
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb86
// Size: 0x84
function function_12a444ed47d9c24d(player) {
    task = self;
    var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
    task.players = array_remove(task.players, player);
    if (var_aa128e29d7c10074) {
        return;
    }
    if (level.var_7137de4e4fb0399b.var_41659fa814cedceb) {
        namespace_b8f885001f04bb5::function_7204f8ab0ccdb640(player, 1);
    }
    player setclientomnvar("ui_br_stronghold_mission", task.mission_fail);
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc11
// Size: 0x1c
function function_a5870532237f7ad(teamname) {
    /#
        assert(1, "Person of Interest is a volume player start stronghold mission only!");
    #/
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc34
// Size: 0x1aa
function function_ad51a965d4943b34(teamname, var_b677bbe2241c4e3f, var_775b616d3bf0bf29, var_dc862207eee24f1) {
    task = self;
    var_6e3c5fd99f4fcfb1 = array_contains(task.teams, teamname);
    var_5f8fc154303502fa = getteamarray(teamname);
    if (!level.var_7137de4e4fb0399b.var_41659fa814cedceb || var_dc862207eee24f1) {
        teaminfo = level.var_1b7407dffe81e6e8.var_a5816a0b9c7279c1[teamname];
        if (isdefined(teaminfo)) {
            teaminfo.var_83abcb9b3a5dbe24 = array_remove(teaminfo.var_83abcb9b3a5dbe24, task.activity.id);
            teaminfo.active = 0;
        }
    }
    foreach (player in var_5f8fc154303502fa) {
        if (namespace_36f464722d326bbe::isaigameparticipant(player)) {
            continue;
        }
        if (var_b677bbe2241c4e3f == task.mission_complete) {
            player thread namespace_44abc05161e2e2cb::showsplash("stronghold_operation_person_of_interest_completed");
            player setclientomnvar("ui_br_stronghold_mission", var_b677bbe2241c4e3f);
        } else {
            var_c02dfd04f86a87ae = player getclientomnvar("ui_br_stronghold_mission");
            if (var_6e3c5fd99f4fcfb1 || var_c02dfd04f86a87ae == 19) {
                if (istrue(var_775b616d3bf0bf29)) {
                    player thread namespace_44abc05161e2e2cb::showsplash("stronghold_operation_person_of_interest_failed");
                }
                player setclientomnvar("ui_br_stronghold_mission", 36);
            }
        }
    }
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde5
// Size: 0x78
function function_bb405816fb180a81(player) {
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

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe64
// Size: 0x84
function function_a0e410e1941cb7a(player) {
    task = self;
    player.var_e09c6ea56555f1ed = undefined;
    var_aa128e29d7c10074 = namespace_36f464722d326bbe::isaigameparticipant(player);
    if (!var_aa128e29d7c10074) {
        player setclientomnvar("ui_br_stronghold_mission", task.mission_index);
        if (!istrue(level.var_870abcbf773fbd8c)) {
            player setclientomnvar("ui_br_stronghold_mission_timer", 0);
        } else {
            player setclientomnvar("ui_br_stronghold_mission_timer", task.endtime);
        }
    }
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeef
// Size: 0x72
function function_e09f977d133bac40(player) {
    task = self;
    task function_12a444ed47d9c24d(player);
    if (level.var_7137de4e4fb0399b.var_41659fa814cedceb) {
        namespace_b8f885001f04bb5::function_7204f8ab0ccdb640(player, 1);
    }
    player.var_e09c6ea56555f1ed = undefined;
    player.var_ed5a962d857703ec = undefined;
    if (isdefined(level.var_fc0e8c2ea4f84613)) {
        task [[ level.var_fc0e8c2ea4f84613 ]](player);
    }
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf68
// Size: 0x28d
function private function_947515fbdc68b22b(teamname, failed, var_dc862207eee24f1) {
    if (!isdefined(failed)) {
        failed = 0;
    }
    if (!isdefined(var_dc862207eee24f1)) {
        var_dc862207eee24f1 = 0;
    }
    task = self;
    task notify("task_ended");
    if (!level.var_7137de4e4fb0399b.var_41659fa814cedceb || var_dc862207eee24f1) {
        namespace_9823ee6035594d67::function_be5a531f97b7c07e(task.owner);
    }
    var_ed264f0df8bf58fb = 0;
    fortress = task.owner;
    teams = task.teams;
    if (isdefined(fortress.var_e2bdca417396359)) {
        teams = array_combine_unique(teams, fortress.var_e2bdca417396359);
    }
    foreach (team in teams) {
        var_641c32466af43f9 = 0;
        if (isdefined(teamname)) {
            var_641c32466af43f9 = team == teamname;
        }
        var_b677bbe2241c4e3f = task.mission_fail;
        if (var_641c32466af43f9) {
            var_ed264f0df8bf58fb = 1;
            var_b677bbe2241c4e3f = task.mission_complete;
        }
        task function_ad51a965d4943b34(team, var_b677bbe2241c4e3f, failed, var_dc862207eee24f1);
    }
    if (isdefined(task.headicon)) {
        deleteheadicon(task.headicon);
    }
    if (!level.var_7137de4e4fb0399b.var_41659fa814cedceb || var_dc862207eee24f1) {
        task.players = [];
        task.teams = [];
        task function_2476daefa3384c5e();
        task function_629ed367d1393020();
        if (!isdefined(failed)) {
            failed = 0;
        }
        task.starttime = undefined;
        if (task.activity.var_b7718b6e41108129.size >= 1 && (var_ed264f0df8bf58fb || failed)) {
            task.owner.var_e1dd7bed632a13c3 notify("activity_ended");
            level.var_1b7407dffe81e6e8.var_83abcb9b3a5dbe24[task.activity.id] = undefined;
            task.activity.var_b7718b6e41108129 = undefined;
        }
    }
    if (isdefined(level.var_3afacc0c3b10b7fe)) {
        task.owner [[ level.var_3afacc0c3b10b7fe ]](teamname, !istrue(failed));
    }
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11fc
// Size: 0xfc
function function_5cbd566bcb47d26e(player) {
    task = self;
    if (!istrue(level.var_870abcbf773fbd8c)) {
        return;
    }
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
    wait(waittime);
    player.var_e09c6ea56555f1ed = undefined;
    player.var_ed5a962d857703ec = undefined;
    task thread function_947515fbdc68b22b(undefined, 1);
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ff
// Size: 0xf4
function function_682e6a05a3109ea1(player) {
    task = self;
    level endon("game_ended");
    task endon("task_ended");
    if (istrue(level.var_cb8bc435cfe43c4c) && istrue(task.owner.var_933f9685674999fb)) {
        return;
    }
    task.owner.var_e1dd7bed632a13c3 endon("deleted");
    task.owner.var_e1dd7bed632a13c3 endon("activity_ended");
    origin = task.activity.origin + (0, 0, 40);
    while (namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(origin) || namespace_bbc79db4c3949a5c::function_a465e3c1371d7dab(origin)) {
        wait(0.5);
    }
    player.var_e09c6ea56555f1ed = undefined;
    player.var_ed5a962d857703ec = undefined;
    task thread function_947515fbdc68b22b(undefined, 1, 1);
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13fb
// Size: 0x1ae
function function_385995505b4fd624(dropstruct, player, fortress) {
    task = self;
    if (!level.var_7137de4e4fb0399b.var_41659fa814cedceb) {
        fortress namespace_bd614c3c2275579a::function_5c26662d5381e975(player, undefined, "directional_uav", 0);
    }
    var_501265b5fe210821 = task.activity.var_723b8f7cb71ceb11;
    foreach (player in getteamdata(player.team, "players")) {
        player namespace_c6ccccd95254983f::playerplunderpickup(var_501265b5fe210821);
        player namespace_c6ccccd95254983f::function_5a2284274d70f7d(1, var_501265b5fe210821);
    }
    teamindex = namespace_3c37cb17ade254d::array_find(level.allteamnamelist, player.team);
    foreach (player in level.players) {
        if (getdvarint(@"hash_90582331a88cc477", 0)) {
            player thread namespace_44abc05161e2e2cb::showsplash("stronghold_complete_no_gamertags_blacksite");
        } else {
            player thread namespace_44abc05161e2e2cb::showsplash("stronghold_complete_blacksite", teamindex);
        }
        namespace_d3d40f75bb4e4c32::brleaderdialogplayer("blacksite_clear", player);
    }
    if (!istrue(fortress.var_933f9685674999fb)) {
        player namespace_bd614c3c2275579a::function_9d216f4cd30f141d(dropstruct, getteamarray(player.team, 0));
    }
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b0
// Size: 0x107
function function_92efd6eb7ec14081() {
    task = self;
    task endon("task_ended");
    task.target waittill("death");
    ent = task.target.lastattacker;
    player = ent;
    if (ent namespace_1f188a13f7e79610::isvehicle() && isdefined(ent.owner)) {
        player = ent.owner;
    }
    isvalidplayer = isdefined(player) && isplayer(player) && isalive(player);
    if (isvalidplayer) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        function_a91d0874afb8a157(dropstruct, task.target, player);
        function_6f6f83ab76483811(task, player);
        task thread function_385995505b4fd624(dropstruct, player, task.owner);
        task thread function_947515fbdc68b22b(player.team);
    } else {
        task thread function_947515fbdc68b22b(undefined, 1);
    }
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16be
// Size: 0xae
function function_b005a227c7052bab() {
    task = self;
    task.headicon = createheadicon(task.target);
    setheadiconenemyimage(task.headicon, level.var_7137de4e4fb0399b.headicon);
    setheadicondrawthroughgeo(task.headicon, 1);
    setheadiconsnaptoedges(task.headicon, 0);
    setheadiconmaxdistance(task.headicon, 2048);
    setheadiconnaturaldistance(task.headicon, 30);
    setheadiconzoffset(task.headicon, 10);
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1773
// Size: 0x203
function function_a91d0874afb8a157(dropstruct, boss, player) {
    var_87d58fdcedcfe1b6 = getdvarint(@"hash_623a5fbf8a2eda3e", 1);
    var_9d966f1ac46cfb6a = getdvarint(@"hash_763d715ff5888239", 0);
    var_6a2e08f957d1b294 = getscriptcachecontents("blacksite_boss_backpack", 0);
    var_df2f68507645906f = [0:"brloot_super_munitionsbox", 1:"brloot_super_armorbox"];
    teammatecount = undefined;
    teammates = namespace_54d20dd0dd79277f::getteamdata(player.team, "players");
    if (isdefined(teammates)) {
        teammatecount = teammates.size;
    }
    if (var_87d58fdcedcfe1b6 >= 0) {
        for (i = 0; i < var_87d58fdcedcfe1b6; i++) {
            randomindex = randomintrange(0, 25);
            var_6a2e08f957d1b294 = getscriptcachecontents("blacksite_boss_backpack", randomindex);
            if (isdefined(teammatecount)) {
                for (i = 0; i < teammatecount; i++) {
                    var_6a2e08f957d1b294[var_6a2e08f957d1b294.size] = var_df2f68507645906f[i % var_df2f68507645906f.size];
                }
            }
            function_a47bc792e66b0fb7(dropstruct, boss, var_6a2e08f957d1b294);
        }
    } else if (isdefined(teammatecount)) {
        for (i = 0; i < teammatecount; i++) {
            randomindex = randomintrange(0, 25);
            var_6a2e08f957d1b294 = getscriptcachecontents("blacksite_boss_backpack", randomindex);
            var_6a2e08f957d1b294[var_6a2e08f957d1b294.size] = var_df2f68507645906f[i % var_df2f68507645906f.size];
            if (!istrue(var_9d966f1ac46cfb6a)) {
                if (array_contains(var_6a2e08f957d1b294, "brloot_killstreak_auav")) {
                    var_6a2e08f957d1b294 = array_remove(var_6a2e08f957d1b294, "brloot_killstreak_auav");
                }
            }
            function_a47bc792e66b0fb7(dropstruct, boss, var_6a2e08f957d1b294);
        }
    } else {
        function_a47bc792e66b0fb7(dropstruct, boss, var_6a2e08f957d1b294);
    }
    if (var_9d966f1ac46cfb6a) {
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, boss.origin, boss.angles, boss);
        spawned = namespace_cb965d2f71fefddc::spawnpickup("brloot_killstreak_auav", var_cb4fad49263e20c4);
        if (isdefined(spawned)) {
            spawned setscriptablepartstate("brloot_killstreak_auav", "dropped");
        }
    }
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x197d
// Size: 0xd6
function function_a47bc792e66b0fb7(dropstruct, boss, var_6a2e08f957d1b294) {
    count = undefined;
    foreach (var_5b63aed4a779b0aa in var_6a2e08f957d1b294) {
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, boss.origin, boss.angles, boss);
        count = level.br_pickups.counts[var_5b63aed4a779b0aa];
        spawned = namespace_cb965d2f71fefddc::spawnpickup(var_5b63aed4a779b0aa, var_cb4fad49263e20c4, count);
        if (isdefined(spawned)) {
            spawned setscriptablepartstate(var_5b63aed4a779b0aa, "dropped");
        }
    }
}

// Namespace namespace_348001a7426cedd2/namespace_d4eb7462ff000665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5a
// Size: 0x1bb
function function_b2616afcad011728(var_642470e1abc1bbf9) {
    if (!isdefined(level.var_153bec2ca80c491a) || level.var_153bec2ca80c491a <= 0) {
        return;
    }
    fortress = namespace_9823ee6035594d67::function_c0a211a69f5f8f2f(var_642470e1abc1bbf9.victim.origin);
    if (!isdefined(fortress)) {
        return;
    }
    if (istrue(fortress.var_933f9685674999fb) && namespace_244fdc99ed0f5d2b::function_a2dcdcd112310e33(self.team, fortress)) {
        task = fortress.task;
        if (isdefined(task) && isdefined(task.target)) {
            if (isdefined(task.players)) {
                players = task.players;
                if (var_642470e1abc1bbf9.victim namespace_a548bd428a566cf3::isplayerinorgoingtogulag()) {
                    players = array_remove(task.players, var_642470e1abc1bbf9.victim);
                }
                var_72ec576edbf14909 = [];
                foreach (player in players) {
                    if (player.team == var_642470e1abc1bbf9.victim.team && player != var_642470e1abc1bbf9.victim) {
                        var_72ec576edbf14909[var_72ec576edbf14909.size] = player;
                    }
                }
                if (players.size > 0) {
                    if (var_72ec576edbf14909.size > 0) {
                        namespace_bd614c3c2275579a::function_ac7dce0a21508d6e("blacksite_jugg_single_kill", players);
                    } else if (var_72ec576edbf14909.size <= 0) {
                        namespace_bd614c3c2275579a::function_ac7dce0a21508d6e("blacksite_jugg_team_kill", players);
                    }
                }
            }
        }
    }
}

