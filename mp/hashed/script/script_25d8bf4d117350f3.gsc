#using script_1f97a44d1761c919;
#using script_22f1701e151b9d12;
#using script_3c30ef2503c2a953;
#using script_4fa7e9e11630166c;
#using script_711820027508efbb;
#using scripts\common\callbacks;
#using scripts\cp_mp\utility\debug_utility;
#using scripts\engine\utility;
#using scripts\mp\flags;
#using scripts\mp\mp_agent;
#using scripts\mp\objidpoolmanager;

#namespace namespace_10816918163162;

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x447
// Size: 0x12c
function function_58176ae2f61825a8() {
    level flag_wait("ai_spawn_director_initialized");
    scripts\mp\flags::gameflagwait("prematch_done");
    level.var_d23aeb1751c691a3 = [];
    level.var_1509c2e9eb38fea3 = [];
    level.var_5926e65ed5e4e5f8 = [];
    level.var_7331656f47ade43f = namespace_614554f86e52695c::function_930897c0d1a7eb24("enc_toc_rescue_inside");
    level.var_93b887bd4bbdf9e3 = namespace_614554f86e52695c::function_930897c0d1a7eb24("enc_toc_rescue_defend");
    assert(isdefined(level.var_7331656f47ade43f), "<dev string:x1c>");
    assert(isdefined(level.var_93b887bd4bbdf9e3), "<dev string:x60>");
    if (!isdefined(level.var_7331656f47ade43f) || !isdefined(level.var_93b887bd4bbdf9e3)) {
        return;
    }
    function_f0cc0f2e6e1d085e(level.var_7331656f47ade43f, &function_3a3634d428236cb6);
    function_bc5315dc37ae4cf(level.var_93b887bd4bbdf9e3, &function_c05065e628cbd604);
    level thread function_1a529ef6a18ffe76();
    function_4edc29577f7e3d27();
    function_fc38783a3da0bc71(level.var_7331656f47ade43f, 1);
    if (getdvarint(@"hash_dc2e92cfc46a05c2", 0)) {
        function_fc38783a3da0bc71(level.var_93b887bd4bbdf9e3, 1);
    }
    function_f66b9a343a32f313();
    level thread function_a802ed3ab73c2c37();
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57b
// Size: 0x3f
function function_e7fbcc8e485e01de() {
    wait 1;
    function_d5109375e2029bee();
    level.var_fe5c2634af4ea573 = "QUEST_0_RIFT_S2_RESCUEINTRO";
    namespace_68270f885c7fd3ef::function_9306d91e52ec93e1(level.var_fe5c2634af4ea573);
    namespace_446fc987a980892f::playconversation("s2_soldiers_truce", level.players);
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5c2
// Size: 0x1c
function function_3a3634d428236cb6(requestid, userdata) {
    level thread function_3ded3136b512013c();
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e6
// Size: 0x2a
function function_3ded3136b512013c() {
    while (true) {
        if (istrue(level.var_70ac71107500c644)) {
            break;
        }
        waitframe();
    }
    function_a39e9894083f4513(level.var_7331656f47ade43f);
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x618
// Size: 0xaf
function function_1a529ef6a18ffe76() {
    trigger = function_f159c10d5cf8f0b4("enc_toc_rescue_inside_trigger", "targetname");
    if (!isarray(trigger) || trigger.size <= 0 || trigger.size > 1) {
        assert(isarray(trigger), "<dev string:xa4>");
        assert(trigger.size > 0, "<dev string:xa4>");
        assert(trigger.size <= 1, "<dev string:x125>");
    }
    trigger = trigger[0];
    while (true) {
        trigger waittill("trigger", ent);
        if (isplayer(ent) && isalive(ent)) {
            level.var_70ac71107500c644 = 1;
            return;
        }
    }
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6cf
// Size: 0x1d
function function_c05065e628cbd604(requestid, userdata) {
    return istrue(level.var_8b32fbd513ff5438);
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f5
// Size: 0x91
function function_4edc29577f7e3d27() {
    triggervolumes = function_f159c10d5cf8f0b4("enc_toc_rescue_begin_defend_trigger", "targetname");
    if (!isdefined(triggervolumes) || !isarray(triggervolumes) || triggervolumes.size <= 0) {
        assert(0, "<dev string:x1a6>");
        return;
    }
    foreach (trigger in triggervolumes) {
        level thread function_b31a883b4154eb6d(trigger);
    }
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x78e
// Size: 0x11d
function function_b31a883b4154eb6d(trigger) {
    level endon("toc_rescue_defend_begin_trigger_entered");
    while (true) {
        trigger waittill("trigger", ent);
        if (isplayer(ent) && isalive(ent)) {
            level.var_8b32fbd513ff5438 = 1;
            if (isdefined(level.var_d23aeb1751c691a3)) {
                foreach (soldier in level.var_d23aeb1751c691a3) {
                    if (isdefined(soldier) && isalive(soldier)) {
                        soldier.ignoreme = 0;
                    }
                }
            }
            function_606642b946a01237("ambient_blocker_to_rescue", level.var_d23aeb1751c691a3[0].origin, 1000, 0);
            if (getdvarint(@"hash_dc2e92cfc46a05c2", 0)) {
                level thread function_51268e6989b69634();
                level thread function_e9cd27cd39ef516c();
            } else {
                level thread function_907a00c8fa552ad2();
            }
            level notify("toc_rescue_defend_begin_trigger_entered");
            return;
        }
        waitframe();
    }
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b3
// Size: 0x155
function function_51268e6989b69634() {
    var_e4d1678cede76da0 = 60;
    if (getdvarint(@"hash_e8937d06187b99ba", 0) > 0) {
        var_e4d1678cede76da0 = getdvarint(@"hash_e8937d06187b99ba", 0);
    }
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_RIFT_S2_RESCUEINTRO_PROTECT", level.players);
    namespace_446fc987a980892f::playevent("s2_toc_defend_start", level.players);
    var_54c33b5d87aa331b = 0;
    var_7deea9939acda793 = 0;
    var_3261caffadadb678 = var_e4d1678cede76da0 / 100;
    totaltime = var_e4d1678cede76da0;
    var_c94020ad2f1227be = 0;
    while (var_c94020ad2f1227be <= 100) {
        wait var_3261caffadadb678;
        var_c94020ad2f1227be++;
        foreach (player in level.players) {
            player setclientomnvar("ui_br_objective_param", var_c94020ad2f1227be);
        }
        if (var_c94020ad2f1227be >= 80 && !istrue(var_7deea9939acda793)) {
            function_18790a3cb3f88db7(level.var_93b887bd4bbdf9e3);
            var_7deea9939acda793 = 1;
        }
        if (var_c94020ad2f1227be >= 95 && !istrue(var_54c33b5d87aa331b)) {
            level thread update_soldier_goals();
            var_54c33b5d87aa331b = 1;
        }
    }
    player setclientomnvar("ui_br_objective_param", 100);
    function_907a00c8fa552ad2();
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa10
// Size: 0x181
function function_907a00c8fa552ad2() {
    level.toc_rescued = 1;
    level thread update_soldier_goals();
    namespace_446fc987a980892f::playconversation("s2_acv_escort", level.players);
    namespace_262d6474998a2356::function_b8b15f7f0820954e(level.activeplayers);
    wait 0.5;
    level.var_fe5c2634af4ea573 = "QUEST_0_RIFT_S2_ESCORT_INTRO";
    namespace_68270f885c7fd3ef::function_9306d91e52ec93e1(level.var_fe5c2634af4ea573);
    flag_set("toc_rescued");
    level notify("toc_rescued");
    objectivename = "regroup_acv_icon";
    level.var_378ba68d7497e1d8[objectivename] = requestobjectiveid();
    objective_add_objective(level.var_378ba68d7497e1d8[objectivename], "current", level.var_59a5ab1b4256bb79.origin + (0, 0, 100), "jup_ui_map_icon_obj_toc");
    update_objective_setbackground(level.var_378ba68d7497e1d8[objectivename], 1);
    objective_addalltomask(level.var_378ba68d7497e1d8[objectivename]);
    objective_playermask_showtoall(level.var_378ba68d7497e1d8[objectivename]);
    if (isdefined(level.var_5926e65ed5e4e5f8) && isarray(level.var_5926e65ed5e4e5f8)) {
        for (i = 0; i < level.var_5926e65ed5e4e5f8.size; i++) {
            objectivename = level.var_5926e65ed5e4e5f8[i].objectivename;
            if (isdefined(level.var_378ba68d7497e1d8[objectivename])) {
                returnreservedobjectiveid(level.var_378ba68d7497e1d8[objectivename]);
            }
        }
    }
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb99
// Size: 0xdb
function update_soldier_goals() {
    level notify("update_soldier_goals");
    level endon("update_soldier_goals");
    level endon("game_ended");
    while (level.var_d23aeb1751c691a3.size > 0) {
        newgoalpos = level.var_59a5ab1b4256bb79.origin + anglestoforward(level.var_59a5ab1b4256bb79.angles) * 600;
        foreach (soldier in level.var_d23aeb1751c691a3) {
            if (isdefined(soldier) && isalive(soldier)) {
                soldier setgoalpos(newgoalpos);
                soldier.goalradius = 100;
            }
        }
        wait 0.1;
    }
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc7c
// Size: 0x97
function function_e9cd27cd39ef516c() {
    level endon("toc_rescued");
    while (true) {
        encounterdata = function_9a39e23c3c52c2af(level.var_93b887bd4bbdf9e3);
        if (!isdefined(encounterdata)) {
            continue;
        }
        foreach (zombie in encounterdata.ai) {
            zombie function_65cdab0fc78aba8f(zombie.origin, 2000);
        }
        wait 10;
    }
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd1b
// Size: 0x1df
function function_f66b9a343a32f313() {
    agentteam = "axis";
    if (isdefined(level.players[0])) {
        agentteam = level.players[0].team;
    }
    var_78f9bae8363cd1 = getstructarray("toc_rescue_soldier_spawn_building_1", "targetname");
    if (!isdefined(var_78f9bae8363cd1)) {
        assert(0, "<dev string:x223>");
        return;
    }
    for (i = 0; i < var_78f9bae8363cd1.size; i++) {
        spawnorigin = var_78f9bae8363cd1[i].origin;
        spawnangles = var_78f9bae8363cd1[i].angles;
        agent = undefined;
        if (i % 2 == 0) {
            agent = scripts\mp\mp_agent::spawnnewagentaitype("jup_ob_enemy_basic_soldier_short", spawnorigin, spawnangles, agentteam);
        } else {
            agent = scripts\mp\mp_agent::spawnnewagentaitype("jup_ob_enemy_basic_soldier_long", spawnorigin, spawnangles, agentteam);
        }
        if (isdefined(agent)) {
            agent setgoalpos(agent.origin);
            agent.goalradius = 4;
            agent.ignoreme = 1;
            agent.iscompanion = 1;
            level.var_d23aeb1751c691a3[level.var_d23aeb1751c691a3.size] = agent;
            level.var_1509c2e9eb38fea3[level.var_1509c2e9eb38fea3.size] = agent;
        }
    }
    foreach (soldier in level.var_d23aeb1751c691a3) {
        soldier.maxhealth += 10000;
        soldier.health = soldier.maxhealth;
        soldier thread function_15a14065386e8a7a();
    }
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf02
// Size: 0xfb
function function_d5109375e2029bee() {
    var_5c12e410e4da75fe = getstruct("toc_soldier_rescue_objective_building_1", "targetname");
    level.var_5926e65ed5e4e5f8[0] = var_5c12e410e4da75fe;
    for (i = 0; i < level.var_5926e65ed5e4e5f8.size; i++) {
        objectivename = "toc_rescue_objective_" + i;
        level.var_5926e65ed5e4e5f8[i].objectivename = objectivename;
        level.var_378ba68d7497e1d8[objectivename] = requestobjectiveid();
        objective_add_objective(level.var_378ba68d7497e1d8[objectivename], "current", level.var_5926e65ed5e4e5f8[i].origin + (0, 0, 40), "jup_ui_map_icon_obj_toc");
        update_objective_setbackground(level.var_378ba68d7497e1d8[objectivename], 1);
        objective_addalltomask(level.var_378ba68d7497e1d8[objectivename]);
        objective_playermask_showtoall(level.var_378ba68d7497e1d8[objectivename]);
    }
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1005
// Size: 0x74
function function_1e4a06136f0a738e() {
    if (!isdefined(level.var_d23aeb1751c691a3) || !isarray(level.var_d23aeb1751c691a3)) {
        return;
    }
    while (level.var_d23aeb1751c691a3.size > 0 && !istrue(level.toc_rescued)) {
        level.var_d23aeb1751c691a3 = function_fdc9d5557c53078e(level.var_d23aeb1751c691a3);
        level.var_1509c2e9eb38fea3 = function_fdc9d5557c53078e(level.var_1509c2e9eb38fea3);
        waitframe();
    }
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1081
// Size: 0xd5
function function_a802ed3ab73c2c37() {
    level endon("game_ended");
    var_60de69d206774bb8 = getstruct("toc_rescue_lone_zombie_spawnpoint", "targetname");
    level.var_249beb6047a3e92c = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_base", var_60de69d206774bb8.origin + (0, 0, 30), var_60de69d206774bb8.angles, "team_two_hundred");
    while (!istrue(level.var_70ac71107500c644)) {
        if (!isdefined(level.var_249beb6047a3e92c) || !isalive(level.var_249beb6047a3e92c)) {
            level.var_249beb6047a3e92c = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_base", var_60de69d206774bb8.origin + (0, 0, 30), var_60de69d206774bb8.angles, "team_two_hundred");
        }
        wait 0.5;
    }
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x115e
// Size: 0x69
function debug_zombie_location() {
    level notify("debug_zombie_location");
    level endon("debug_zombie_location");
    while (isdefined(level.var_249beb6047a3e92c) && isalive(level.var_249beb6047a3e92c)) {
        level thread scripts\cp_mp\utility\debug_utility::drawsphere(level.var_249beb6047a3e92c.origin, 25, 0.1, (0, 1, 0));
        wait 0.1;
    }
}

// Namespace namespace_10816918163162 / namespace_b311bec7b243be6d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11cf
// Size: 0xd0
function function_15a14065386e8a7a() {
    level endon("game_ended");
    offset = (0, 0, 40);
    while (!istrue(level.var_70ac71107500c644) && !istrue(level.var_8b32fbd513ff5438)) {
        if (isdefined(level.var_249beb6047a3e92c) && isalive(level.var_249beb6047a3e92c) && self.weapon.basename != "none") {
            magicbullet(self.weapon.basename, self.origin + offset, level.var_249beb6047a3e92c.origin + offset, self, self);
        }
        duration = randomfloatrange(0.2, 2);
        wait duration;
    }
}

