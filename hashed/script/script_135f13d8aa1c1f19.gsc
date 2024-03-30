// mwiii decomp prototype
#using scripts\common\system.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_64acb6ce534155b7;

#namespace quest_chain;

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x158
// Size: 0x1a
function private autoexec __init__system__() {
    system::register(#"quest_chain", undefined, undefined, &post_main);
}

// Namespace quest_chain / namespace_b11d742e70949af1
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
    level thread initinternal();
}

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c1
// Size: 0x2b
function initinternal() {
    level endon("game_ended");
    scripts/engine/utility::flag_wait("StartGameTypeCallbackFinished");
    function_ccacfdcc7aa6b6d7();
    setupcallbacks();
    function_b92559336d4290b3();
}

// Namespace quest_chain / namespace_b11d742e70949af1
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
    level.var_81e77c935dfefd11.activechains = [];
    level.var_81e77c935dfefd11.teaminstances = [];
    level.var_81e77c935dfefd11.waittime = getdvarfloat(@"hash_9170c7bf6eebab04", 5);
    level.var_81e77c935dfefd11.var_e9dd7fb12175053e = getdvarint(@"hash_9f9977b7c37ebb8f", 1);
}

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b1
// Size: 0x36
function setupcallbacks() {
    scripts/mp/gametypes/br_gametypes::registerbrgametypefunc("contractStart", &oncontractstart);
    scripts/mp/gametypes/br_gametypes::registerbrgametypefunc("contractEnd", &oncontractend);
    scripts/mp/gametypes/br_gametypes::registerbrgametypefunc("giveQuestRewardGroup", &function_d75b66b46e0f7273);
}

// Namespace quest_chain / namespace_b11d742e70949af1
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
        registerquestchain("elite", ["vip", "vip", "vip"], 0);
        break;
    case 5:
        registerquestchain("elite", ["elite_resurgence", "elite_resurgence", "elite_resurgence"], 0);
        break;
    case 4:
        registerquestchain("elite", ["elite_geiger", "safecracker", "elite_chopper"], 0);
        break;
    case 3:
        registerquestchain("elite", ["elite_chopper", "elite_geiger", "safecracker"], 0);
        break;
    case 2:
        registerquestchain("elite", ["safecracker", "elite_geiger", "elite_chopper"], 0);
        break;
    case 1:
        registerquestchain("elite", ["safecracker", "vip", "elite_chopper"], 0);
        break;
    default:
        registerquestchain("elite", ["scavenger", "vip", "intel"], 0);
        break;
    }
}

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cd
// Size: 0x5c
function registerquestchain(var_aae4896d02056ac3, var_56f390f17fee5add, flags) {
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

// Namespace quest_chain / namespace_b11d742e70949af1
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
    task.questchain = spawnstruct();
    task.questchain.ref = var_aae4896d02056ac3;
    task.questchain.index = -1;
    task.questchain.len = array.size;
    task.questchain.dropcount = 0;
    task.questchain.var_3ecdcdbc9f0b5fe0 = var_2d9fd7df778267bb;
    task.questchain.var_ce5b38ccbacff64 = var_f9ef42f2b5483a4f;
    task.questchain.var_d6a940bdd49c18ca = var_9ded4c314cb8356d;
    task.questchain.var_cede041f1b6728e0 = var_645d7335913d50bb;
    task.questchain.var_d75b66b46e0f7273 = var_aba46302334934ac;
    task.questchain.var_6091d72afc11f381 = var_8f125b44d04fac42;
    task.questchain.startertask = task;
}

// Namespace quest_chain / namespace_b11d742e70949af1
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

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x728
// Size: 0x7f
function oncontractend(task, team, success) {
    if (!isdefined(level.var_81e77c935dfefd11)) {
        return;
    }
    if (function_73689348205a9057(team)) {
        questchain = level.var_81e77c935dfefd11.teaminstances[team];
        if (task == questchain.startertask) {
            level thread function_9f181ae293d9b65f(task, team, success);
            return;
        }
        level thread function_e447c95f657d5325(task, team, success);
    }
}

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ae
// Size: 0xc2
function function_9f181ae293d9b65f(task, team, success) {
    function_26f3066ca0cd1957(task, team, success);
    questchain = function_c6ec58a3c19cd74d(team);
    /#
        /#
            assertex(isdefined(questchain), "<unknown string>");
        #/
    #/
    if (isdefined(questchain.var_6091d72afc11f381) && isfunction(questchain.var_6091d72afc11f381)) {
        task [[ questchain.var_6091d72afc11f381 ]](team, success);
    }
    level.var_81e77c935dfefd11.activechains = array_remove(level.var_81e77c935dfefd11.activechains, questchain);
    level.var_81e77c935dfefd11.teaminstances[team] = undefined;
}

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x877
// Size: 0xfa
function function_e447c95f657d5325(task, team, success) {
    level endon("game_ended");
    questchain = function_c6ec58a3c19cd74d(team);
    /#
        /#
            assertex(isdefined(questchain), "<unknown string>");
        #/
    #/
    if (istrue(success)) {
        if (level.var_81e77c935dfefd11.var_e9dd7fb12175053e) {
            reward = questchain waittill("reward_pickup");
            function_3dd1a630275d19af(team);
        }
    }
    level.contractmanager.var_b6fae9c9655c73bf[team] = undefined;
    level.contractmanager.currenttasks = array_remove(level.contractmanager.currenttasks, task);
    if (istrue(success) && questchain.index < questchain.len - 1) {
        function_ee4cd3ba8fd7b953(task, team);
        return;
    }
    function_26f3066ca0cd1957(task, team, success);
}

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x978
// Size: 0x116
function function_d75b66b46e0f7273(group, team, rewardorigin, rewardangles, rewardscriptable, players) {
    if (!isdefined(level.var_81e77c935dfefd11)) {
        return;
    }
    if (function_73689348205a9057(team)) {
        questchain = function_c6ec58a3c19cd74d(team);
        var_56f390f17fee5add = level.var_81e77c935dfefd11.var_c25435bfa70e9a13[questchain.ref];
        contractref = var_56f390f17fee5add[questchain.index];
        contractbundle = function_99b5f579a15f808d(contractref);
        groupref = contractbundle.rewardgroup;
        if (isdefined(group) && isdefined(groupref) && group == groupref && isdefined(questchain.var_d75b66b46e0f7273) && isfunction(questchain.var_d75b66b46e0f7273)) {
            [[ questchain.var_d75b66b46e0f7273 ]](team, rewardorigin, rewardangles);
        }
    }
}

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa95
// Size: 0x136
function function_95241846d4382372(task, team) {
    level endon("game_ended");
    questchain = task.questchain;
    /#
        /#
            assertex(isdefined(questchain), "<unknown string>");
        #/
    #/
    if (!isdefined(questchain)) {
        return;
    }
    level.var_81e77c935dfefd11.activechains[level.var_81e77c935dfefd11.activechains.size] = questchain;
    level.var_81e77c935dfefd11.teaminstances[team] = questchain;
    if (isdefined(questchain.var_3ecdcdbc9f0b5fe0) && isfunction(questchain.var_3ecdcdbc9f0b5fe0)) {
        task [[ questchain.var_3ecdcdbc9f0b5fe0 ]](team);
    }
    if (level.var_81e77c935dfefd11.waittime > 0) {
        wait(level.var_81e77c935dfefd11.waittime);
    }
    level.contractmanager.var_b6fae9c9655c73bf[team] = undefined;
    level.contractmanager.currenttasks = array_remove(level.contractmanager.currenttasks, task);
    function_ee4cd3ba8fd7b953(task, team);
}

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd2
// Size: 0x158
function function_ee4cd3ba8fd7b953(task, team) {
    questchain = function_c6ec58a3c19cd74d(team);
    /#
        /#
            assertex(isdefined(questchain), "<unknown string>");
        #/
    #/
    if (!isdefined(questchain)) {
        return;
    }
    questchain.index++;
    var_56f390f17fee5add = level.var_81e77c935dfefd11.var_c25435bfa70e9a13[questchain.ref];
    contractref = var_56f390f17fee5add[questchain.index];
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
    if (isdefined(questchain.var_ce5b38ccbacff64) && isfunction(questchain.var_ce5b38ccbacff64)) {
        task [[ questchain.var_ce5b38ccbacff64 ]](team);
    }
    player function_438f067da7cbe893(contractref);
}

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd31
// Size: 0x148
function function_26f3066ca0cd1957(task, team, success) {
    questchain = function_c6ec58a3c19cd74d(team);
    /#
        /#
            assertex(isdefined(questchain), "<unknown string>");
        #/
    #/
    if (!isdefined(questchain)) {
        return;
    }
    questchain.complete = 1;
    questchain.success = success;
    if (isdefined(questchain.var_d6a940bdd49c18ca) && isfunction(questchain.var_d6a940bdd49c18ca)) {
        task [[ questchain.var_d6a940bdd49c18ca ]](team, success);
    }
    if (istrue(success) && isdefined(questchain.startertask)) {
        level.contractmanager.var_b6fae9c9655c73bf[team] = questchain.startertask;
        level.contractmanager.currenttasks[level.contractmanager.currenttasks.size] = questchain.startertask;
        if (isdefined(questchain.startertask.category)) {
            questindex = namespace_1eb3c4e0e28fac71::getquesttableindex(questchain.startertask.category);
            namespace_1eb3c4e0e28fac71::setquestindexteamomnvar(team, questindex);
        }
    }
}

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe80
// Size: 0x96
function function_3dd1a630275d19af(team) {
    if (level.var_81e77c935dfefd11.waittime <= 0) {
        return;
    }
    task = self;
    questchain = function_c6ec58a3c19cd74d(team);
    /#
        /#
            assertex(isdefined(questchain), "<unknown string>");
        #/
    #/
    if (!isdefined(questchain)) {
        return;
    }
    level endon("game_ended");
    if (isdefined(questchain.var_cede041f1b6728e0) && isfunction(questchain.var_cede041f1b6728e0)) {
        task [[ questchain.var_cede041f1b6728e0 ]](team);
    }
}

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf1d
// Size: 0xae
function function_25b927ee0e8f37eb(var_aae4896d02056ac3) {
    task = self.task;
    if (!isdefined(task) || !isdefined(task.questchain)) {
        return;
    }
    task.questchain.tablets = [];
    var_56f390f17fee5add = level.var_81e77c935dfefd11.var_c25435bfa70e9a13[var_aae4896d02056ac3];
    nexttablet = undefined;
    prevtablet = undefined;
    for (i = 0; i < var_56f390f17fee5add.size; i++) {
        contractref = var_56f390f17fee5add[i];
    }
}

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd2
// Size: 0x57
function function_438f067da7cbe893(contractref) {
    player = self;
    iselite = 1;
    tablet = namespace_1eb3c4e0e28fac71::function_fe5d4d0a6a530b1e(contractref, player.origin, player.angles, iselite);
    player namespace_1eb3c4e0e28fac71::function_bb413728bc5231d0(tablet);
}

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1030
// Size: 0x22
function function_73689348205a9057(team) {
    return isdefined(level.var_81e77c935dfefd11.teaminstances[team]);
}

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105a
// Size: 0x18
function function_15130df1ddac6787(task) {
    return isdefined(task.questchain);
}

// Namespace quest_chain / namespace_b11d742e70949af1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107a
// Size: 0x21
function function_c6ec58a3c19cd74d(team) {
    return level.var_81e77c935dfefd11.teaminstances[team];
}

