// mwiii decomp prototype
#using script_3f51a039c4a1a113;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_64acb6ce534155b7;

#namespace namespace_4b4ae171502a234f;

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x158
// Size: 0x1a
function private autoexec __init__system__() {
    system::register(#"hash_9c2a06ad30a24173", undefined, undefined, &post_main);
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x179
// Size: 0x41
function post_main() {
    if (!isdefined(level.brgametype)) {
        return;
    }
    if (getdvarint(@"hash_82bde055b11e6698", 0) || !getdvarint(@"hash_33dfb5a00b144fa9", 1)) {
        return;
    }
    level thread function_fb4e699438b5ab86();
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c1
// Size: 0x2b
function function_fb4e699438b5ab86() {
    level endon("game_ended");
    namespace_3c37cb17ade254d::flag_wait("StartGameTypeCallbackFinished");
    function_ccacfdcc7aa6b6d7();
    setupcallbacks();
    function_b92559336d4290b3();
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f3
// Size: 0xb7
function function_ccacfdcc7aa6b6d7() {
    /#
        /#
            assertex(!isdefined(level.var_81e77c935dfefd11), "<unknown string>");
        #/
    #/
    level.var_81e77c935dfefd11 = spawnstruct();
    level.var_81e77c935dfefd11.var_c25435bfa70e9a13 = [];
    level.var_81e77c935dfefd11.var_35b2cbbda9ebe281 = [];
    level.var_81e77c935dfefd11.var_d8daebc51dd41288 = [];
    level.var_81e77c935dfefd11.waittime = getdvarfloat(@"hash_9170c7bf6eebab04", 5);
    level.var_81e77c935dfefd11.var_e9dd7fb12175053e = getdvarint(@"hash_9f9977b7c37ebb8f", 1);
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b1
// Size: 0x36
function setupcallbacks() {
    namespace_71073fa38f11492::registerbrgametypefunc("contractStart", &oncontractstart);
    namespace_71073fa38f11492::registerbrgametypefunc("contractEnd", &oncontractend);
    namespace_71073fa38f11492::registerbrgametypefunc("giveQuestRewardGroup", &function_d75b66b46e0f7273);
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee
// Size: 0x1d8
function function_b92559336d4290b3() {
    /#
        /#
            assertex(isdefined(level.var_81e77c935dfefd11), "<unknown string>");
        #/
    #/
    if (!isdefined(level.var_81e77c935dfefd11)) {
        return;
    }
    var_9c40921d9034f99b = getdvarint(@"hash_27fa6ed1a82a8436", 4);
    switch (var_9c40921d9034f99b) {
    case 6:
        function_27ba34c8ba00fc4b("elite", [0:"vip", 1:"vip", 2:"vip"], 0);
        break;
    case 5:
        function_27ba34c8ba00fc4b("elite", [0:"elite_resurgence", 1:"elite_resurgence", 2:"elite_resurgence"], 0);
        break;
    case 4:
        function_27ba34c8ba00fc4b("elite", [0:"elite_geiger", 1:"safecracker", 2:"elite_chopper"], 0);
        break;
    case 3:
        function_27ba34c8ba00fc4b("elite", [0:"elite_chopper", 1:"elite_geiger", 2:"safecracker"], 0);
        break;
    case 2:
        function_27ba34c8ba00fc4b("elite", [0:"safecracker", 1:"elite_geiger", 2:"elite_chopper"], 0);
        break;
    case 1:
        function_27ba34c8ba00fc4b("elite", [0:"safecracker", 1:"vip", 2:"elite_chopper"], 0);
        break;
    default:
        function_27ba34c8ba00fc4b("elite", [0:"scavenger", 1:"vip", 2:"intel"], 0);
        break;
    }
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cd
// Size: 0x5c
function function_27ba34c8ba00fc4b(var_aae4896d02056ac3, var_56f390f17fee5add, flags) {
    /#
        /#
            assertex(isdefined(level.var_81e77c935dfefd11), "<unknown string>");
        #/
    #/
    if (!isdefined(level.var_81e77c935dfefd11)) {
        return;
    }
    level.var_81e77c935dfefd11.var_c25435bfa70e9a13[var_aae4896d02056ac3] = var_56f390f17fee5add;
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x530
// Size: 0x1b3
function function_8fb6c06939b794d7(var_aae4896d02056ac3, var_2d9fd7df778267bb, var_f9ef42f2b5483a4f, var_9ded4c314cb8356d, var_645d7335913d50bb, var_aba46302334934ac, var_8f125b44d04fac42) {
    /#
        /#
            assertex(isdefined(level.var_81e77c935dfefd11), "<unknown string>");
        #/
    #/
    if (!isdefined(level.var_81e77c935dfefd11)) {
        return;
    }
    task = self.task;
    if (!isdefined(task)) {
        return;
    }
    array = level.var_81e77c935dfefd11.var_c25435bfa70e9a13[var_aae4896d02056ac3];
    task.var_e6729ba173f5634a = spawnstruct();
    task.var_e6729ba173f5634a.ref = var_aae4896d02056ac3;
    task.var_e6729ba173f5634a.index = -1;
    task.var_e6729ba173f5634a.var_46f432042b3473d8 = array.size;
    task.var_e6729ba173f5634a.dropcount = 0;
    task.var_e6729ba173f5634a.var_3ecdcdbc9f0b5fe0 = var_2d9fd7df778267bb;
    task.var_e6729ba173f5634a.var_ce5b38ccbacff64 = var_f9ef42f2b5483a4f;
    task.var_e6729ba173f5634a.var_d6a940bdd49c18ca = var_9ded4c314cb8356d;
    task.var_e6729ba173f5634a.var_cede041f1b6728e0 = var_645d7335913d50bb;
    task.var_e6729ba173f5634a.var_d75b66b46e0f7273 = var_aba46302334934ac;
    task.var_e6729ba173f5634a.var_6091d72afc11f381 = var_8f125b44d04fac42;
    task.var_e6729ba173f5634a.var_f1556c55fa1774f5 = task;
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ea
// Size: 0x37
function oncontractstart(task, team) {
    if (!isdefined(level.var_81e77c935dfefd11)) {
        return;
    }
    if (function_15130df1ddac6787(task)) {
        level thread function_95241846d4382372(task, team);
    }
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x728
// Size: 0x7f
function oncontractend(task, team, success) {
    if (!isdefined(level.var_81e77c935dfefd11)) {
        return;
    }
    if (function_73689348205a9057(team)) {
        var_e6729ba173f5634a = level.var_81e77c935dfefd11.var_d8daebc51dd41288[team];
        if (task == var_e6729ba173f5634a.var_f1556c55fa1774f5) {
            level thread function_9f181ae293d9b65f(task, team, success);
        } else {
            level thread function_e447c95f657d5325(task, team, success);
        }
    }
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ae
// Size: 0xc2
function function_9f181ae293d9b65f(task, team, success) {
    function_26f3066ca0cd1957(task, team, success);
    var_e6729ba173f5634a = function_c6ec58a3c19cd74d(team);
    /#
        /#
            assertex(isdefined(var_e6729ba173f5634a), "<unknown string>");
        #/
    #/
    if (isdefined(var_e6729ba173f5634a.var_6091d72afc11f381) && isfunction(var_e6729ba173f5634a.var_6091d72afc11f381)) {
        task [[ var_e6729ba173f5634a.var_6091d72afc11f381 ]](team, success);
    }
    level.var_81e77c935dfefd11.var_35b2cbbda9ebe281 = array_remove(level.var_81e77c935dfefd11.var_35b2cbbda9ebe281, var_e6729ba173f5634a);
    level.var_81e77c935dfefd11.var_d8daebc51dd41288[team] = undefined;
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x877
// Size: 0xfa
function function_e447c95f657d5325(task, team, success) {
    level endon("game_ended");
    var_e6729ba173f5634a = function_c6ec58a3c19cd74d(team);
    /#
        /#
            assertex(isdefined(var_e6729ba173f5634a), "<unknown string>");
        #/
    #/
    if (istrue(success)) {
        if (level.var_81e77c935dfefd11.var_e9dd7fb12175053e) {
            reward = var_e6729ba173f5634a waittill("reward_pickup");
            function_3dd1a630275d19af(team);
        }
    }
    level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[team] = undefined;
    level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80 = array_remove(level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80, task);
    if (istrue(success) && var_e6729ba173f5634a.index < var_e6729ba173f5634a.var_46f432042b3473d8 - 1) {
        function_ee4cd3ba8fd7b953(task, team);
    } else {
        function_26f3066ca0cd1957(task, team, success);
    }
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x978
// Size: 0x116
function function_d75b66b46e0f7273(group, team, rewardorigin, rewardangles, rewardscriptable, players) {
    if (!isdefined(level.var_81e77c935dfefd11)) {
        return;
    }
    if (function_73689348205a9057(team)) {
        var_e6729ba173f5634a = function_c6ec58a3c19cd74d(team);
        var_56f390f17fee5add = level.var_81e77c935dfefd11.var_c25435bfa70e9a13[var_e6729ba173f5634a.ref];
        var_1bbeb265ef74bc60 = var_56f390f17fee5add[var_e6729ba173f5634a.index];
        var_fb4895dbd3f68bd7 = function_99b5f579a15f808d(var_1bbeb265ef74bc60);
        var_2f0b8c1f978fd835 = var_fb4895dbd3f68bd7.var_fa69571549e78551;
        if (isdefined(group) && isdefined(var_2f0b8c1f978fd835) && group == var_2f0b8c1f978fd835 && isdefined(var_e6729ba173f5634a.var_d75b66b46e0f7273) && isfunction(var_e6729ba173f5634a.var_d75b66b46e0f7273)) {
            [[ var_e6729ba173f5634a.var_d75b66b46e0f7273 ]](team, rewardorigin, rewardangles);
        }
    }
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa95
// Size: 0x136
function function_95241846d4382372(task, team) {
    level endon("game_ended");
    var_e6729ba173f5634a = task.var_e6729ba173f5634a;
    /#
        /#
            assertex(isdefined(var_e6729ba173f5634a), "<unknown string>");
        #/
    #/
    if (!isdefined(var_e6729ba173f5634a)) {
        return;
    }
    level.var_81e77c935dfefd11.var_35b2cbbda9ebe281[level.var_81e77c935dfefd11.var_35b2cbbda9ebe281.size] = var_e6729ba173f5634a;
    level.var_81e77c935dfefd11.var_d8daebc51dd41288[team] = var_e6729ba173f5634a;
    if (isdefined(var_e6729ba173f5634a.var_3ecdcdbc9f0b5fe0) && isfunction(var_e6729ba173f5634a.var_3ecdcdbc9f0b5fe0)) {
        task [[ var_e6729ba173f5634a.var_3ecdcdbc9f0b5fe0 ]](team);
    }
    if (level.var_81e77c935dfefd11.waittime > 0) {
        wait(level.var_81e77c935dfefd11.waittime);
    }
    level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[team] = undefined;
    level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80 = array_remove(level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80, task);
    function_ee4cd3ba8fd7b953(task, team);
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd2
// Size: 0x158
function function_ee4cd3ba8fd7b953(task, team) {
    var_e6729ba173f5634a = function_c6ec58a3c19cd74d(team);
    /#
        /#
            assertex(isdefined(var_e6729ba173f5634a), "<unknown string>");
        #/
    #/
    if (!isdefined(var_e6729ba173f5634a)) {
        return;
    }
    var_e6729ba173f5634a.index++;
    var_56f390f17fee5add = level.var_81e77c935dfefd11.var_c25435bfa70e9a13[var_e6729ba173f5634a.ref];
    var_1bbeb265ef74bc60 = var_56f390f17fee5add[var_e6729ba173f5634a.index];
    teammates = getteamdata(team, "players");
    player = undefined;
    foreach (teammate in teammates) {
        if (!isdefined(player)) {
            player = teammate;
        }
        if (isalive(teammate) && !isbot(teammate)) {
            player = teammate;
            break;
        }
    }
    if (isdefined(var_e6729ba173f5634a.var_ce5b38ccbacff64) && isfunction(var_e6729ba173f5634a.var_ce5b38ccbacff64)) {
        task [[ var_e6729ba173f5634a.var_ce5b38ccbacff64 ]](team);
    }
    player function_438f067da7cbe893(var_1bbeb265ef74bc60);
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd31
// Size: 0x148
function function_26f3066ca0cd1957(task, team, success) {
    var_e6729ba173f5634a = function_c6ec58a3c19cd74d(team);
    /#
        /#
            assertex(isdefined(var_e6729ba173f5634a), "<unknown string>");
        #/
    #/
    if (!isdefined(var_e6729ba173f5634a)) {
        return;
    }
    var_e6729ba173f5634a.complete = 1;
    var_e6729ba173f5634a.success = success;
    if (isdefined(var_e6729ba173f5634a.var_d6a940bdd49c18ca) && isfunction(var_e6729ba173f5634a.var_d6a940bdd49c18ca)) {
        task [[ var_e6729ba173f5634a.var_d6a940bdd49c18ca ]](team, success);
    }
    if (istrue(success) && isdefined(var_e6729ba173f5634a.var_f1556c55fa1774f5)) {
        level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[team] = var_e6729ba173f5634a.var_f1556c55fa1774f5;
        level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80[level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80.size] = var_e6729ba173f5634a.var_f1556c55fa1774f5;
        if (isdefined(var_e6729ba173f5634a.var_f1556c55fa1774f5.category)) {
            var_5e9b1036a4cae82f = namespace_1eb3c4e0e28fac71::getquesttableindex(var_e6729ba173f5634a.var_f1556c55fa1774f5.category);
            namespace_1eb3c4e0e28fac71::setquestindexteamomnvar(team, var_5e9b1036a4cae82f);
        }
    }
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe80
// Size: 0x96
function function_3dd1a630275d19af(team) {
    if (level.var_81e77c935dfefd11.waittime <= 0) {
        return;
    }
    task = self;
    var_e6729ba173f5634a = function_c6ec58a3c19cd74d(team);
    /#
        /#
            assertex(isdefined(var_e6729ba173f5634a), "<unknown string>");
        #/
    #/
    if (!isdefined(var_e6729ba173f5634a)) {
        return;
    }
    level endon("game_ended");
    if (isdefined(var_e6729ba173f5634a.var_cede041f1b6728e0) && isfunction(var_e6729ba173f5634a.var_cede041f1b6728e0)) {
        task [[ var_e6729ba173f5634a.var_cede041f1b6728e0 ]](team);
    }
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf1d
// Size: 0xae
function function_25b927ee0e8f37eb(var_aae4896d02056ac3) {
    task = self.task;
    if (!isdefined(task) || !isdefined(task.var_e6729ba173f5634a)) {
        return;
    }
    task.var_e6729ba173f5634a.var_e0d1e3a2b6f5323a = [];
    var_56f390f17fee5add = level.var_81e77c935dfefd11.var_c25435bfa70e9a13[var_aae4896d02056ac3];
    var_37fc6be42134952c = undefined;
    var_b9d4bc46132fddac = undefined;
    for (i = 0; i < var_56f390f17fee5add.size; i++) {
        var_1bbeb265ef74bc60 = var_56f390f17fee5add[i];
    }
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd2
// Size: 0x57
function function_438f067da7cbe893(var_1bbeb265ef74bc60) {
    player = self;
    iselite = 1;
    tablet = namespace_1eb3c4e0e28fac71::function_fe5d4d0a6a530b1e(var_1bbeb265ef74bc60, player.origin, player.angles, iselite);
    player namespace_1eb3c4e0e28fac71::function_bb413728bc5231d0(tablet);
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1030
// Size: 0x22
function function_73689348205a9057(team) {
    return isdefined(level.var_81e77c935dfefd11.var_d8daebc51dd41288[team]);
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105a
// Size: 0x18
function function_15130df1ddac6787(task) {
    return isdefined(task.var_e6729ba173f5634a);
}

// Namespace namespace_4b4ae171502a234f/namespace_b11d742e70949af1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107a
// Size: 0x21
function function_c6ec58a3c19cd74d(team) {
    return level.var_81e77c935dfefd11.var_d8daebc51dd41288[team];
}

