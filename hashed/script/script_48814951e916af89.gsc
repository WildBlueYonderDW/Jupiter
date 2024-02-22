// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_371b4c2ab5861e62;
#using script_120270bd0a747a35;
#using script_5def7af2a9f04234;
#using script_41ba451876d0900c;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_35de402efc5acfb3;
#using script_2ad704f5066d8674;
#using scripts\mp\damage.gsc;
#using scripts\stealth\utility.gsc;
#using script_24fbedba9a7a1ef4;
#using scripts\mp\mp_agent_damage.gsc;
#using script_47fc06d4bb326007;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\stealth\enemy.gsc;
#using script_15ca41a3fbb0e379;
#using scripts\mp\mp_agent.gsc;
#using script_c11d6400ba31ed7;
#using scripts\mp\weapons.gsc;
#using script_268c4da1ef6a20a8;
#using script_4948cdf739393d2d;
#using script_34874c98ab154f37;
#using script_1c47017ba325709a;
#using script_2bc0b0102f9b7751;
#using script_640cf1641c03e2a0;
#using script_6153e980b3eb0e1b;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\game.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\utility\entity.gsc;
#using script_48814951e916af89;
#using script_7caebc5d4875185;
#using script_53da3333b83b3527;
#using script_1174abedbefe9ada;
#using scripts\mp\utility\dialog.gsc;
#using script_600b944a95c3a7bf;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using script_57d3850a12cf1d8f;
#using scripts\mp\loot.gsc;
#using script_2880c23deadcdd8f;
#using scripts\mp\equipment.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_2391409ef7b431e1;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\killstreaks\airstrike.gsc;
#using scripts\cp_mp\killstreaks\toma_strike.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\stealth\debug.gsc;

#namespace ai_mp_controller;

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df3
// Size: 0x634
function init() {
    if (istrue(level.var_289df80e1ded586f)) {
        return;
    }
    level.var_289df80e1ded586f = 1;
    level.var_bdb4d0cd41b1c39d = getdvarint(@"hash_acf59b5e363165c0", namespace_36f464722d326bbe::isbrstylegametype());
    level.var_3a89274682239c28 = gettime();
    level.var_7318150d8dc474ea = -1;
    namespace_378f8281e2d12ced::init_battlechatter();
    namespace_e60d0883fe817ff2::main();
    level.var_7dc093fb71342953["prone"] = 1200;
    level.var_7dc093fb71342953["crouch"] = 1800;
    level.var_7dc093fb71342953["stand"] = 2400;
    level.var_3b0034eb96b13650["prone"] = 2000;
    level.var_3b0034eb96b13650["crouch"] = 3200;
    level.var_3b0034eb96b13650["stand"] = 6000;
    level.var_8f3f480583606401["prone"] = 1.2;
    level.var_8f3f480583606401["crouch"] = 1.25;
    level.var_8f3f480583606401["stand"] = 1.3;
    level.var_33cf4079b4096eb8 = getdvarint(@"hash_935057b8878ca60c", 1);
    level.var_1bdf3af6b78dc2ca = getdvarint(@"hash_db81671bbb108b36", 2);
    level.var_8912ccad342445f7 = getdvarint(@"hash_f34e4fbaeb441e24", 2048);
    level.var_e38979eb8fd7f7fd = function_ee26a62ef3d1372d(@"hash_e0bf53c6689c5a5c", 45, level.var_62f6f7640e4431e3.var_e38979eb8fd7f7fd);
    level.var_6ba4985b66d62a71 = function_ee26a62ef3d1372d(@"hash_7632dab7786bd590", 33, level.var_62f6f7640e4431e3.var_23274688e75c2144);
    level.var_7eb56682f591ea8d = function_ee26a62ef3d1372d(@"hash_81420364ea25c1ea", 80, level.var_62f6f7640e4431e3.var_f0c2629e2aa93ace);
    level.var_9cf526926a72864c = function_ee26a62ef3d1372d(@"hash_7ace3f07ae09faa9", 17, level.var_62f6f7640e4431e3.var_12ed9627baf65e6d);
    level.var_e2fbc9e65108b1e = function_ee26a62ef3d1372d(@"hash_a3642102f1c5f0af", 75, level.var_62f6f7640e4431e3.var_799e41b0533da323);
    level.var_47aedb539717aea5 = function_ee26a62ef3d1372d(@"hash_ccb7c4b155a770f8", 60, level.var_62f6f7640e4431e3.var_870beb3e28d5013c);
    level.var_4899061e2e21dd13 = function_370c5539313daf66(@"hash_b98593547931ba38", 0.6, level.var_62f6f7640e4431e3.var_408bfdb7015c4ba3);
    level.var_3e6588e7a225a933 = getdvarint(@"hash_9ad5dbdd1dfb3fac", 3);
    level.var_1b4461e4447da676 = 0;
    level.var_58ac9ebcf7b87b73 = 0;
    level.var_2ef1c744d35b6312 = getdvarint(@"hash_bbb1bddaa8b9b5e3", 45);
    level.var_d362d0481275de02 = getdvarint(@"hash_a28fc6fefeca8d04", 30) * 1000;
    level.var_ec80e35c609c1533 = getdvarint(@"hash_8a59524527d46b22", 15);
    level.var_8a7245a12448052f = getdvarint(@"hash_61a7de4b7ed90249", 35);
    level.var_a3a884994e83cdba = getdvarint(@"hash_f7d2f280613a39d", 50);
    level.var_18c5fa4fdebe1971 = getdvarint(@"hash_63dce1152bb58b16", 65);
    level.var_69173c5e957cccff = getdvarint(@"hash_d3907cde9245b595", 1);
    level.var_ef668b618c1c7ec0 = getdvarint(@"hash_fb2f8a1043ba19ae", 3);
    level.var_9c981303803aeab3 = getdvarint(@"hash_c50d996d34978b41", 25);
    level.var_5dcccc815e25c8e2 = getdvarint(@"hash_65c413f748899d7f", 10);
    level.var_96abdb45aee491fc = getdvarint(@"hash_9a629aeb212fa5eb", 10);
    level.var_9d28d5b70aa9f5e4 = &function_9d28d5b70aa9f5e4;
    function_3bdeb9edd6c6f0a();
    function_4799bfbfba0cf995();
    function_b04c0433e8107615();
    aibudget_init();
    function_9a7305ea8ee1e807();
    dialog_init();
    function_346dc7f701823dc();
    function_a09756b37f2e0681();
    function_1e3a27c2e002ca8();
    function_bd14655b29f9a64();
    function_a09c0a759d909dc9();
    level thread function_d2d3ddd52666dcf0();
    level thread function_44b2bad96489df87();
    function_75425e32a1700c73();
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    /#
        if (getdvarint(@"hash_98d02294a9885211", 0) > 0) {
            level thread function_63bc1945791044c9();
        }
        level thread function_576ed049f93d9496();
        level thread function_644e1e38d1b39a41();
        level thread function_5397fa12cf5b1665();
        level thread function_13fa78dbb16429();
        level thread function_e1c5cdebd8e4628a();
    #/
    level thread function_3ee960c1c0c8e4();
    /#
    #/
    registersharedfunc("ai_mp_controller", "agentPers_getAgentPersData", &agentpers_getagentpersdata);
    registersharedfunc("ai_mp_controller", "agentPers_setAgentPersData", &agentpers_setagentpersdata);
    registersharedfunc("ai_mp_controller", "subArea_removeAgentFrom", &subarea_removeagentfrom);
    registersharedfunc("ai_mp_controller", "ai_deregisterAgent", &function_1e5307c0d848a9ca);
    registersharedfunc("ai_mp_controller", "ai_registerAgent", &function_157c2000284999eb);
    registersharedfunc("ai_mp_controller", "priority_removeByDormancyId", &priority_removebydormancyid);
    registersharedfunc("ai_mp_controller", "priority_setByDormancyId", &priority_setbydormancyid);
    registersharedfunc("ai_mp_controller", "subArea_findAndAssignForDormancyID", &subarea_findandassignfordormancyid);
    registersharedfunc("ai_mp_controller", "processAgentSpawned", &processagentspawned);
    registersharedfunc("ai_mp_controller", "behavior_executeBehaviorPackage", &namespace_2000a83505151e5b::behavior_executebehaviorpackage);
    registersharedfunc("ai_mp_controller", "ai_mp_requestSpawnAgent", &ai_mp_requestspawnagent);
    registersharedfunc("ai_mp_controller", "handleDamageFeedback", &namespace_3e725f3cc58bddd3::handledamagefeedback);
    function_2585b1944b7884c0();
    if (getdvarint(@"hash_5a01142d62d08a10", 1) == 1) {
        function_401d0838f4f47c3e(1);
    }
    /#
        if (isdefined(level.var_1a6233bc0d61faf) && getdvarint(@"hash_d1fa0a1f136eadfb", 0) == 1) {
            level thread function_b510c28e573d0be6();
        }
        level thread function_1efa739f9e55871f();
        level thread function_49d965cff987ed32();
    #/
    level thread function_bc423135571b28c1();
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x242e
// Size: 0x80
function function_35bae74232ff8b77(val) {
    /#
        assert(isdefined(val));
    #/
    level.var_bdb4d0cd41b1c39d = val;
    foreach (agent in level.agentarray) {
        if (isdefined(agent)) {
            agent.ignoreall = val;
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24b5
// Size: 0x21
function function_2b36368b8b1b2b30(val) {
    /#
        assert(isdefined(val));
    #/
    level.var_ed524ae7534d93e6 = val;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24dd
// Size: 0xd
function function_3c44b8551d08ac1d() {
    level.var_ed524ae7534d93e6 = undefined;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x24f1
// Size: 0xb0
function private function_3ee960c1c0c8e4() {
    while (!isdefined(level.stealth)) {
        waitframe();
    }
    setsaveddvar(@"hash_ae9c969df88e37e1", 3000);
    setsaveddvar(@"hash_f72ce39dd23b00d1", 3000);
    setsaveddvar(@"hash_cda36d9770cf5189", 128);
    level.stealth.var_792e4b9a380ade11 = 3000;
    level.stealth.var_94f8771062f2161 = 3000;
    level.stealth.var_e2e3c78d7dc88605 = 16384;
    namespace_e124d8b75dab4be0::set_detect_ranges(level.var_7dc093fb71342953, level.var_3b0034eb96b13650, level.var_8f3f480583606401);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a8
// Size: 0x294
function function_bd14655b29f9a64() {
    level.spawnset = [];
    level.var_3b54adcd8ed5b8c0 = [];
    level.var_c0e1de2e14e458bf = "guard";
    if (isdefined(level.var_1a2b600a06ec21f4)) {
        if (isdefined(level.var_1a2b600a06ec21f4.var_6924ab7bf88a3afe)) {
            level.var_bbc459244382ae0f = getdvar(@"hash_63c67beb18bd058d", level.var_1a2b600a06ec21f4.var_6924ab7bf88a3afe);
        }
    }
    if (!isdefined(level.var_bbc459244382ae0f)) {
        level.var_bbc459244382ae0f = getdvar(@"hash_63c67beb18bd058d", "mp/spawnset_tuning_base.csv");
    }
    if (!tableexists(level.var_bbc459244382ae0f)) {
        /#
            println("soldier" + level.var_bbc459244382ae0f + "dmz");
        #/
        return;
    }
    table = level.var_bbc459244382ae0f;
    numrows = tablelookupgetnumrows(table);
    for (i = 0; istrue(i < numrows); i++) {
        var_fcdc7f62624c71ff = tolower(tablelookupbyrow(table, i, 0));
        if (!isdefined(level.spawnset[var_fcdc7f62624c71ff])) {
            level.spawnset[var_fcdc7f62624c71ff] = [];
        }
        aitype = tolower(tablelookupbyrow(table, i, 1));
        var_c3d87e6af7949475 = tablelookupbyrow(table, i, 2);
        if (var_c3d87e6af7949475 == "0") {
            continue;
        }
        if (isdefined(var_c3d87e6af7949475)) {
            if (!isdefined(level.var_3b54adcd8ed5b8c0[var_fcdc7f62624c71ff])) {
                level.var_3b54adcd8ed5b8c0[var_fcdc7f62624c71ff] = [];
            }
            level.var_3b54adcd8ed5b8c0[var_fcdc7f62624c71ff][aitype] = int(var_c3d87e6af7949475);
        }
        level.spawnset[var_fcdc7f62624c71ff][level.spawnset[var_fcdc7f62624c71ff].size] = aitype;
    }
    foreach (index, var_d562339438cec85c in level.var_3b54adcd8ed5b8c0) {
        var_bf63953d990800d2 = 0;
        foreach (chance in var_d562339438cec85c) {
            if (chance != 0) {
                var_bf63953d990800d2 = 1;
            }
        }
        if (!var_bf63953d990800d2) {
            level.var_3b54adcd8ed5b8c0[index] = undefined;
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2843
// Size: 0x7a
function function_9dd14a520edb0764(aitype) {
    if (isdefined(level.var_1a2b600a06ec21f4.var_fe5571ec7d7bbfe6)) {
        if (!issubstr(aitype, "boss")) {
            return 0;
        }
        if (issubstr(aitype, "jugg_minigun")) {
            return istrue(level.var_1a2b600a06ec21f4.var_1a33770ee84f49e6);
        }
        if (issubstr(aitype, "jugg_grenade")) {
            return istrue(level.var_1a2b600a06ec21f4.var_24831563e72cb3cb);
        }
    }
    return 0;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c5
// Size: 0x88
function function_7f1a2e2ebe0c1693(var_1439f86640d42e34, var_7ca24826046f8ee3, nationality) {
    if (!isdefined(var_1439f86640d42e34)) {
        var_1439f86640d42e34 = "ar";
    }
    if (!isdefined(var_7ca24826046f8ee3)) {
        var_7ca24826046f8ee3 = 1;
    }
    if (var_7ca24826046f8ee3 > 3) {
        var_7ca24826046f8ee3 = 3;
    } else if (var_7ca24826046f8ee3 < 1) {
        var_7ca24826046f8ee3 = 1;
    }
    if (!isdefined(nationality)) {
        nationality = function_f851a2f41cffa860();
    }
    if (var_1439f86640d42e34 == "jugg") {
        return ("jup_enemy_mp_" + var_1439f86640d42e34 + "_" + nationality);
    }
    return "jup_enemy_mp_" + var_1439f86640d42e34 + "_tier" + var_7ca24826046f8ee3 + "_" + nationality;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2955
// Size: 0x6f
function private function_1e3a27c2e002ca8() {
    level.agent_funcs["soldier"]["on_damaged"] = &namespace_daa149ca485fd50a::callbacksoldieragentdamaged;
    level.agent_funcs["soldier"]["gametype_on_killed"] = &namespace_329d1a4521cd0e73::callbacksoldieragentgametypekilled;
    level.agent_funcs["juggernaut"]["on_damaged"] = &namespace_1f8384d33bfd1e13::function_1ab798a528080db2;
    level.agent_funcs["juggernaut"]["gametype_on_killed"] = &namespace_329d1a4521cd0e73::callbacksoldieragentgametypekilled;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29cb
// Size: 0x7ae
function ai_mp_requestspawnagent(agenttype, var_caed821d95874bbb, spawnangles, priority, category, subcategory, groupname, team, destination, poiname, var_f891e067b8802c0d, var_5a6a87fa3f95753f, var_5f0c541b305bf851, var_80f4bde7090a4773, var_d9f5556107463bb5, subarea, threatbiasgroup) {
    if (!istrue(level.var_289df80e1ded586f)) {
        return;
    }
    /#
        assert(isdefined(agenttype) && isdefined(var_caed821d95874bbb) && isdefined(priority) && isdefined(category), "ai_mp_requestSpawnAgent: Called without having all of its mandatory params defined");
    #/
    /#
        if (isdefined(poiname) && namespace_37f0fb6355a4618a::function_47d356083884f913()) {
            /#
                assert(namespace_37f0fb6355a4618a::poi_ispoiactive(poiname), "patrolPath_Fortress" + poiname + "poiName");
            #/
        }
    #/
    if (!isdefined(category)) {
        category = "unassigned";
    }
    if (!isdefined(subcategory)) {
        subcategory = "unassigned";
    }
    if (!isdefined(team)) {
        team = namespace_14d36171baccf528::function_30a0d7ca3fae40cc(undefined, agenttype);
    }
    var_97b87477cff57241 = !istrue(var_5a6a87fa3f95753f) && istrue(level.var_fe093e9b2b6c3751) && (!isdefined(var_5f0c541b305bf851) || var_5f0c541b305bf851);
    if (var_97b87477cff57241 && !istrue(var_d9f5556107463bb5)) {
        var_97b87477cff57241 = !namespace_4b0406965e556711::gameflagexists("prematch_done") || namespace_4b0406965e556711::gameflagexists("prematch_done") && !namespace_4b0406965e556711::gameflag("prematch_done");
    }
    if (function_47d356083884f913() && !isdefined(poiname)) {
        poiname = function_6cc445c02b5effac(var_caed821d95874bbb);
    }
    if (!isdefined(subarea)) {
        subarea = function_a44e168e8cced18(var_caed821d95874bbb, poiname);
    }
    var_644d90de7685f75 = function_8c6dbb64c8e1603c(1, category, var_caed821d95874bbb, poiname, var_97b87477cff57241, subarea);
    var_1848056a38b1cca8 = 0;
    if (isdefined(subarea) && !isdefined(subarea.var_f27d7498eb54dd99)) {
        subarea.var_f27d7498eb54dd99 = 0;
    }
    success = 0;
    if (!var_644d90de7685f75) {
        var_57ad1dc40b3000d = function_559886efcd7d1a19(priority, var_caed821d95874bbb, var_97b87477cff57241);
        var_c9cb5ceef8c11eea = var_57ad1dc40b3000d[1];
        success = var_57ad1dc40b3000d[0];
        if (!success) {
            return undefined;
        }
        if (isdefined(subarea)) {
            var_1848056a38b1cca8 = 1;
            subarea.var_f27d7498eb54dd99++;
        }
        if (!var_c9cb5ceef8c11eea) {
            waittillframeend();
        }
    } else if (isdefined(subarea)) {
        var_1848056a38b1cca8 = 1;
        subarea.var_f27d7498eb54dd99++;
    }
    if (istrue(level.var_45ca3cfb9dca4f97)) {
        level thread namespace_d028276791d9cff6::drawsphere(var_caed821d95874bbb, 128, 500, (0, 1, 0));
    }
    if (isdefined(level.var_e354254e70a6b849) && !isdefined(threatbiasgroup)) {
        nationality = function_b71d8f69e7f63ed(agenttype);
        if (isdefined(nationality) && isdefined(level.var_5d6209c724cfeac7) && isdefined(level.var_5d6209c724cfeac7[nationality])) {
            threatbiasgroup = level.var_5d6209c724cfeac7[nationality];
        } else {
            threatbiasgroup = "enemy";
        }
    }
    if (var_97b87477cff57241) {
        level.var_53db9bacadef066d.var_d4053e1a1d2983ce++;
        var_451a9d27d63c746b = function_e2fa9b378bbf03a6(agenttype, var_caed821d95874bbb, spawnangles, priority, category, subcategory, groupname, team, destination, poiname, var_f891e067b8802c0d, undefined, threatbiasgroup);
        processagentspawned(var_451a9d27d63c746b, var_80f4bde7090a4773);
        subarea_findandassignfordormancyid(var_caed821d95874bbb, poiname, destination, var_451a9d27d63c746b);
        priority_setbydormancyid(var_451a9d27d63c746b, priority);
        function_157c2000284999eb(var_451a9d27d63c746b, category, subcategory, poiname);
        if (var_1848056a38b1cca8) {
            subarea.var_f27d7498eb54dd99--;
        }
        if (namespace_3c37cb17ade254d::issharedfuncdefined("analytics", "agent_alloc")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("analytics", "agent_alloc") ]](var_caed821d95874bbb, agenttype);
        }
        return var_451a9d27d63c746b;
    }
    if (level.var_3a89274682239c28 > gettime()) {
        level.var_3a89274682239c28 = level.var_3a89274682239c28 + level.frameduration;
        wait((level.var_3a89274682239c28 - gettime() - level.frameduration) / 1000);
    }
    if (issubstr(agenttype, "riot")) {
        var_f891e067b8802c0d = 1;
    }
    agent = function_eea40a1b6180f90a(agenttype, var_caed821d95874bbb, spawnangles, priority, category, subcategory, groupname, team, destination, poiname, var_f891e067b8802c0d);
    if (!isdefined(agent)) {
        return undefined;
    }
    if (isdefined(threatbiasgroup)) {
        namespace_14d36171baccf528::function_58203c3739d2d0c6(agent, threatbiasgroup);
    }
    if (namespace_d696adde758cbe79::function_7a7aa3b5455f0412(poiname)) {
        agent namespace_6db9b2dcda758664::bt_event_combat();
    }
    if (istrue(var_f891e067b8802c0d)) {
        agent.script_groupname = groupname;
    }
    if (var_1848056a38b1cca8) {
        subarea.var_f27d7498eb54dd99--;
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("analytics", "agent_spawn")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("analytics", "agent_spawn") ]](agent);
    }
    /#
        if (0 && category == "priority_set: Can't be called on undefined agents") {
            thread namespace_d028276791d9cff6::drawsphere(var_caed821d95874bbb, 64, 500, (0, 1, 0));
        }
        namespace_d1a9ca87d78d9813::function_9533653868e59fb6("priority_getAllWithPriority: Can only be called on valid priorities, not: ", "minVehicleSpawns" + priority, category + "loop_sounds" + subcategory, undefined, undefined, undefined, poiname, var_caed821d95874bbb);
        if (!var_644d90de7685f75 && getdvarint(@"hash_bcbe3309344bb6d2", 0) == 1) {
            level thread draw_arrow_time(agent.origin + (0, 0, 250), agent.origin + (0, 0, 5000), (0, 1, 0), 120);
            print3d(agent.origin + (0, 0, 105), "tier1", (0, 1, 0), 1, 0.6, 6000);
            print3d(agent.origin + (0, 0, 90), "tier3_closet" + priority, (0, 1, 0), 1, 0.4, 6000);
            print3d(agent.origin + (0, 0, 80), "team_hundred_ninety_five" + category, (0, 1, 0), 1, 0.4, 6000);
            print3d(agent.origin + (0, 0, 70), "players" + subcategory, (0, 1, 0), 1, 0.4, 6000);
            println(" - " + priority + "generic" + category + "brloot_offhand_concussion" + subcategory);
        }
    #/
    if (level.var_3a89274682239c28 <= gettime()) {
        level.var_3a89274682239c28 = gettime() + level.frameduration;
    }
    /#
        if (gettime() != level.var_7318150d8dc474ea) {
            println("brloot_weapon_sm_augolf_comm");
        }
    #/
    level.var_7318150d8dc474ea = gettime();
    processagentspawned(agent, var_80f4bde7090a4773);
    namespace_14d36171baccf528::function_c26ef480e88413bf(agent, agenttype);
    if (isdefined(agent.grenadeweapon)) {
        agentpers_setagentpersdata(agent, "grenadeType", agent.grenadeweapon.basename);
    }
    if (isdefined(level.var_37dafe68077318f5)) {
        var_a841a48bde055043 = agent.var_57956d515cda7d03 * level.var_37dafe68077318f5;
        agent function_9215ce6fc83759b9(var_a841a48bde055043);
    }
    agent.var_8e3405ac46c40e0f = 1;
    agent.var_d5e499e7fe2c490b = 1;
    agent.var_1544c20e168d97c0 = 12000;
    function_caf96a86ca85140f(agent);
    function_b893eeceef3ac7a(agent);
    agent.var_c8e1b804e2c8f23f = 1000;
    agent.disableescalation = 1;
    return agent;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 11, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3181
// Size: 0x459
function private function_eea40a1b6180f90a(agenttype, var_caed821d95874bbb, spawnangles, priority, category, subcategory, groupname, team, destination, poiname, var_f891e067b8802c0d) {
    if (!isdefined(var_caed821d95874bbb)) {
        return;
    }
    var_94d391b4017fe505 = agenttype;
    if (!string_starts_with(agenttype, "actor_")) {
        var_94d391b4017fe505 = "actor_" + agenttype;
    }
    if (!isdefined(level.agent_definition[var_94d391b4017fe505])) {
        /#
            println("<unknown string>" + agenttype + "<unknown string>");
        #/
        return undefined;
    }
    agent = namespace_34f6a6adabfc542d::spawnnewagentaitype(agenttype, var_caed821d95874bbb, spawnangles, team);
    if (!isdefined(agent)) {
        return undefined;
    }
    agent.baseaccuracy = getdvarfloat(@"hash_8aa5333ca3f377e5", 0.66);
    agent.accuracy = agent.baseaccuracy;
    if (agent.behaviortreeasset != "rusher") {
        agent.pathenemylookahead = 120;
        agent.pathenemyfightdist = 512;
        agent.maxsightdistsqrd = 64000000;
        agent.meleechargedistvsplayer = 50;
    }
    agent pushplayer(1);
    if (!getdvarint(@"hash_cb7e65d3dff416a6", 0)) {
        agent setplayeradvanceduavdot(1);
    }
    if (function_47d356083884f913()) {
        poiname = function_80dd9d6a6bf6bbc1(agent, poiname, destination);
        function_2cb157b29de9dbfa(agent, poiname, destination);
    }
    function_e04dbe0bd8a25be7(agent, function_5cc0c507e92f7b47(poiname));
    agent initplayerscriptvariables(1);
    agent.var_599b158d152c358d = getdvarint(@"hash_45a2b4489e57d085", 0);
    agent.category = category;
    agent.subcategory = subcategory;
    function_157c2000284999eb(agent, category, subcategory);
    function_80136fb230fd0646(agent, priority);
    agent agentpers_setagentpersdata(agent, "weapon", agent.weapon);
    agent agentpers_setagentpersdata(agent, "agenttype", agenttype);
    var_1e78071b55344cd3 = function_fb117f8ce12c38e9(agenttype);
    if (isdefined(var_1e78071b55344cd3) && var_1e78071b55344cd3 > 0) {
        agent namespace_34f6a6adabfc542d::set_agent_health(var_1e78071b55344cd3);
    }
    if (!istrue(level.var_b21aafd3e06b203d)) {
        agent thread function_7e69553f058c867b(agent);
    }
    if (!issubstr(agenttype, "civilian")) {
        if (!istrue(var_f891e067b8802c0d)) {
            function_5d07b6ef455e7876(agent, groupname);
        } else {
            /#
                agent thread function_c1d2c66c8b74b50();
            #/
        }
        if (randomint(100) >= level.var_18c5fa4fdebe1971) {
            agent.var_51642e27c7e7d224 = 1;
        }
        function_1920867ddf76810c(agent, 0);
        agent thread namespace_fe5fbd2b56f035f::addtosquad();
        agent thread namespace_3bbb5a98b932c46f::watchgrenadeusage();
        if (namespace_3c37cb17ade254d::issharedfuncdefined("ai", "dropLootOnAgentDeath")) {
            agent thread [[ namespace_3c37cb17ade254d::getsharedfunc("ai", "dropLootOnAgentDeath") ]](agent, agenttype, groupname);
        }
    }
    agent thread function_7ee4a8954b638ed3(agent);
    var_c7a4725d05bb7f22 = agentpers_getagentpersdata(agent, "tier");
    if (!isdefined(var_c7a4725d05bb7f22)) {
        var_c7a4725d05bb7f22 = "undefined";
    }
    dlog_recordevent("dlog_event_dmz_ai_spawn", [0:"spawn_id", 1:agent.var_8aa9efe6383c1d5a, 2:"ai_pos_x", 3:var_caed821d95874bbb[0], 4:"ai_pos_y", 5:var_caed821d95874bbb[1], 6:"ai_pos_z", 7:var_caed821d95874bbb[2], 8:"ai_type", 9:agenttype, 10:"ai_tier", 11:var_c7a4725d05bb7f22, 12:"ai_status", 13:"unknown", 14:"ai_category", 15:category, 16:"ai_subcat", 17:subcategory, 18:"priority", 19:priority, 20:"ai_weapon_primary", 21:agent.primaryweapon.basename, 22:"ai_weapon_secondary", 23:agent.secondaryweapon.basename, 24:"ai_weapon_grenade", 25:agent.grenadeweapon.basename, 26:"match_time_elapsed", 27:gettime()]);
    return agent;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35e2
// Size: 0x10b
function function_d5bc07eabf352abb(node, poiname, var_fcdc7f62624c71ff, var_1439f86640d42e34, tier, nationality) {
    if (!isdefined(tier)) {
        tier = function_8af522ada68b6477(node, poiname);
    }
    if (!isdefined(nationality)) {
        nationality = function_7722db2014c7dfbd(node, poiname);
    }
    if (!isdefined(var_1439f86640d42e34)) {
        if (!isdefined(node) || !isdefined(node.script_noteworthy)) {
            var_1439f86640d42e34 = function_ed108ff3eb578327(var_fcdc7f62624c71ff, tier);
        } else {
            var_1439f86640d42e34 = function_ca51dd295e82f280(node, tier);
        }
    }
    var_57acedc40b2f974 = function_bd5c9a8459875e7a(var_1439f86640d42e34, tier);
    tier = var_57acedc40b2f974[1];
    var_1439f86640d42e34 = var_57acedc40b2f974[0];
    aitype = function_7f1a2e2ebe0c1693(var_1439f86640d42e34, tier, nationality);
    var_94d391b4017fe505 = aitype;
    if (!string_starts_with(aitype, "actor_")) {
        var_94d391b4017fe505 = "actor_" + aitype;
    }
    if (!isdefined(level.agent_definition[var_94d391b4017fe505])) {
        var_1439f86640d42e34 = function_ed108ff3eb578327("medium_range", tier);
        aitype = function_7f1a2e2ebe0c1693(var_1439f86640d42e34, tier, nationality);
    }
    return aitype;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36f5
// Size: 0x104
function function_ca51dd295e82f280(node, tier) {
    if (!isdefined(node.script_noteworthy)) {
        return function_ed108ff3eb578327(undefined, tier);
    }
    tokens = strtok(tolower(node.script_noteworthy), "_");
    if (tokens.size == 1 || tokens.size == 2 && tokens[1] == "stationary") {
        return function_ed108ff3eb578327(undefined, tier);
    } else if (tolower(tokens[0]) == "spawnset" || tolower(tokens[1]) == "spawnset") {
        var_fcdc7f62624c71ff = function_f213e61932acbb15(node);
        return function_ed108ff3eb578327(var_fcdc7f62624c71ff, tier);
    } else if (tokens.size >= 3 && tokens[1] == "stationary") {
        if (tolower(tokens[2]) == "spawnset") {
            var_fcdc7f62624c71ff = function_f213e61932acbb15(node);
            return function_ed108ff3eb578327(var_fcdc7f62624c71ff, tier);
        } else {
            return tokens[2];
        }
    }
    return tokens[1];
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3801
// Size: 0x7d
function function_bd5c9a8459875e7a(type, tier) {
    if (!isdefined(type) || !isdefined(tier)) {
        return [0:type, 1:tier];
    }
    if (type == "firebug" && tier != 1) {
        return [0:"firebug", 1:1];
    }
    if (type == "strikeunit" && tier != 3) {
        return [0:"ar", 1:1];
    }
    return [0:type, 1:tier];
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3886
// Size: 0x8a
function function_f213e61932acbb15(node) {
    if (!isdefined(node.script_noteworthy)) {
        return;
    }
    tokens = strtok(node.script_noteworthy, "_");
    var_b1378484ac36f0e0 = 15;
    if (tokens[0] == "spawnset") {
        var_b1378484ac36f0e0 = 9;
    } else if (tokens[1] == "stationary") {
        var_b1378484ac36f0e0 = 26;
    }
    return getsubstr(node.script_noteworthy, var_b1378484ac36f0e0, node.script_noteworthy.size);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3918
// Size: 0x2ba
function function_8af522ada68b6477(node, poiname, origin) {
    if (isdefined(node)) {
        if (is_equal(node.poi, level.var_4ff0a3720d67ccf4)) {
            poiname = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(node.origin);
            node.poi = poiname;
        }
        if (istrue(level.var_7a36d824da6087ef)) {
            if (!isdefined(poiname)) {
                poiname = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(node.origin);
            }
            tieroverride = function_6cda15989d9abae0(node.origin, poiname);
            if (isdefined(tieroverride)) {
                return tieroverride;
            }
        }
        if (!isdefined(node.agent_type) || isdefined(node.agent_type) && !issubstr(tolower(node.agent_type), "toptier") && !issubstr(tolower(node.agent_type), "elite")) {
            return 1;
        }
        if (!isdefined(node.var_71ad22c5d093d90b)) {
            var_3a6b42ab825a103e = ter_op(isdefined(origin), origin, node.origin);
            subarea = function_a44e168e8cced18(var_3a6b42ab825a103e, poiname);
            node.var_71ad22c5d093d90b = subarea.var_71ad22c5d093d90b;
            if (!isdefined(poiname) && !isdefined(node.poi)) {
                poiname = subarea.poi;
            }
        }
        if (isdefined(node.var_71ad22c5d093d90b)) {
            var_99461dbf0e248572 = ter_op(isdefined(node.poi), node.poi, poiname);
            if (isdefined(var_99461dbf0e248572) && isdefined(node.var_71ad22c5d093d90b)) {
                tier = level.poi[var_99461dbf0e248572]["subAreas"][node.var_71ad22c5d093d90b].var_7da9883d4168b7f1.var_84ecaeab58167d39;
            } else {
                return 1;
            }
        } else {
            return 1;
        }
        if (!isdefined(tier) || tier != 1 && tier != 2 && tier != 3) {
            tier = 1;
        }
        return tier;
    }
    if (!isdefined(poiname)) {
        if (!isdefined(origin)) {
            /#
                println("<unknown string>");
            #/
            return 1;
        }
        poiname = function_6cc445c02b5effac(origin);
    }
    if (isdefined(poiname)) {
        if (istrue(level.var_7a36d824da6087ef)) {
            tieroverride = function_6cda15989d9abae0(origin, poiname);
            if (isdefined(tieroverride)) {
                return tieroverride;
            }
        }
        tier = function_aa34a142b7664dd1(function_5cc0c507e92f7b47(poiname));
        if (tier != 1 && tier != 2 && tier != 3) {
            tier = 1;
        }
        return tier;
    }
    return 1;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bda
// Size: 0x5c
function function_aa34a142b7664dd1(starlevel) {
    switch (starlevel) {
    case 0:
    case 1:
        return 1;
    case 2:
    case 3:
        return 2;
    case 4:
        return 3;
        break;
    }
    return 1;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c3e
// Size: 0x13a
function function_7722db2014c7dfbd(node, poiname) {
    if (isdefined(node)) {
        if (isdefined(node.nationality)) {
            return node.nationality;
        }
        if (!isdefined(poiname)) {
            if (isdefined(node.poi)) {
                poiname = node.poi;
            } else {
                poiname = function_6cc445c02b5effac(node.origin);
            }
        }
        if (!isdefined(node.var_71ad22c5d093d90b)) {
            node.var_71ad22c5d093d90b = function_a44e168e8cced18(node.origin, poiname).var_71ad22c5d093d90b;
        }
        if (isdefined(node.var_71ad22c5d093d90b)) {
            if (isdefined(level.poi[poiname]["subAreas"][node.var_71ad22c5d093d90b]) && isdefined(level.poi[poiname]["subAreas"][node.var_71ad22c5d093d90b].var_7da9883d4168b7f1)) {
                return level.poi[poiname]["subAreas"][node.var_71ad22c5d093d90b].var_7da9883d4168b7f1.var_a42c3e0e1b2dc645;
            } else {
                return function_f851a2f41cffa860();
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d7f
// Size: 0x65
function function_b71d8f69e7f63ed(agenttype) {
    if (issubstr(agenttype, "_aq")) {
        return "aq";
    } else if (issubstr(agenttype, "_cartel")) {
        return "cartel";
    } else if (issubstr(agenttype, "_merc")) {
        return "merc";
    } else if (issubstr(agenttype, "_ru")) {
        return "ru";
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dec
// Size: 0xe9
function function_cb53e3abd2b63e1d(spawnset, tier) {
    var_6186300af3be06d6 = [];
    var_80bf10a2ded77927 = [];
    foreach (var_a7ecb72624160e3c, var_e75ddf2170309eea in level.var_c7796321c3d97413) {
        if (var_a7ecb72624160e3c == tier) {
            continue;
        }
        var_80bf10a2ded77927 = array_combine(var_80bf10a2ded77927, var_e75ddf2170309eea);
    }
    foreach (aitype in spawnset) {
        if (!array_contains(var_80bf10a2ded77927, aitype)) {
            var_6186300af3be06d6[var_6186300af3be06d6.size] = aitype;
        }
    }
    return var_6186300af3be06d6;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3edd
// Size: 0x190
function function_ed108ff3eb578327(var_fcdc7f62624c71ff, tier) {
    if (!isdefined(var_fcdc7f62624c71ff) || !isdefined(level.spawnset[var_fcdc7f62624c71ff])) {
        var_fcdc7f62624c71ff = level.var_c0e1de2e14e458bf;
    }
    spawnset = level.spawnset[var_fcdc7f62624c71ff];
    if (isdefined(tier)) {
        spawnset = function_cb53e3abd2b63e1d(spawnset, tier);
    }
    if (isdefined(level.var_3b54adcd8ed5b8c0[var_fcdc7f62624c71ff])) {
        var_50f2ee11200531a9 = [];
        foreach (index, var_4cd66e97d14ec4f7 in level.var_3b54adcd8ed5b8c0[var_fcdc7f62624c71ff]) {
            if (array_contains(spawnset, index)) {
                var_50f2ee11200531a9[index] = var_4cd66e97d14ec4f7;
            }
        }
        var_eb6f2e9e793e992e = 0;
        foreach (index, var_4cd66e97d14ec4f7 in var_50f2ee11200531a9) {
            var_eb6f2e9e793e992e = var_eb6f2e9e793e992e + var_4cd66e97d14ec4f7;
        }
        roll = randomint(var_eb6f2e9e793e992e);
        var_db4d4d3dcae5375 = 0;
        foreach (index, var_4cd66e97d14ec4f7 in var_50f2ee11200531a9) {
            var_db4d4d3dcae5375 = var_db4d4d3dcae5375 + var_4cd66e97d14ec4f7;
            if (roll <= var_db4d4d3dcae5375) {
                return index;
            }
        }
    }
    return spawnset[randomint(spawnset.size)];
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4075
// Size: 0x63
function function_59cdfe39e161a336(node) {
    /#
        stealth_group = getdvar(@"hash_a839371d8b7bad64", "<unknown string>");
        if (stealth_group != "<unknown string>") {
            return stealth_group;
        }
    #/
    if (istrue(level.var_6827e5668ebc95c0) && isdefined(node.script_stealthgroup)) {
        return node.script_stealthgroup;
    }
    return undefined;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40e0
// Size: 0xe
function function_6d1e55c48e2c12f() {
    return function_ed108ff3eb578327("guard");
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40f6
// Size: 0x1f
function function_f851a2f41cffa860() {
    if (isdefined(level.var_75041b516b3785c6)) {
        return level.var_75041b516b3785c6;
    }
    return "rus";
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x411d
// Size: 0xc2
function function_346dc7f701823dc(var_5b027beca4df0af8) {
    if (!isdefined(var_5b027beca4df0af8)) {
        if (issubstr(level.mapname, "cruce")) {
            var_5b027beca4df0af8 = "mx";
        } else if (issubstr(level.mapname, "saba")) {
            var_5b027beca4df0af8 = "aq";
        } else if (issubstr(level.mapname, "bio_lab")) {
            var_5b027beca4df0af8 = "biolab";
        } else if (issubstr(level.mapname, "delta")) {
            var_5b027beca4df0af8 = "rus";
        } else if (issubstr(level.mapname, "sealion")) {
            var_5b027beca4df0af8 = "merc";
        } else {
            var_5b027beca4df0af8 = "rus";
        }
    }
    level.var_75041b516b3785c6 = var_5b027beca4df0af8;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41e6
// Size: 0x82
function function_559886efcd7d1a19(priority, var_1a532fbe5a6451e4, var_97b87477cff57241) {
    var_c00a2d6249962fb6 = function_56e8fd646957529c(priority, 0, var_1a532fbe5a6451e4, var_97b87477cff57241);
    var_c9cb5ceef8c11eea = var_c00a2d6249962fb6[1];
    success = var_c00a2d6249962fb6[0];
    if (!success) {
        var_c00a30624996364f = function_56e8fd646957529c(priority, 1, var_1a532fbe5a6451e4, var_97b87477cff57241);
        var_c9cb5ceef8c11eea = var_c00a30624996364f[1];
        success = var_c00a30624996364f[0];
    }
    return [0:success, 1:var_c9cb5ceef8c11eea];
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4270
// Size: 0x492
function private function_56e8fd646957529c(priority, var_51a5a8b593bf4aa1, var_1a532fbe5a6451e4, var_97b87477cff57241) {
    var_cddbf16ffcf0b1e8 = 0;
    var_1992ef28a62e7ce = array_find(level.var_41670c1c65f3d3cf.priorities, priority);
    /#
        assert(isdefined(var_1992ef28a62e7ce), "tryRemoveAI: Given an invalid priority");
    #/
    var_2231df82d7283c43 = 0;
    subarea = function_a44e168e8cced18(var_1a532fbe5a6451e4);
    if (isdefined(subarea)) {
        var_ef017ff00ebc23ce = ter_op(isdefined(subarea.var_f27d7498eb54dd99), subarea.var_f27d7498eb54dd99, 0);
    } else {
        var_ef017ff00ebc23ce = 0;
    }
    if (isdefined(subarea) && isdefined(subarea.var_7da9883d4168b7f1) && isdefined(subarea.var_7da9883d4168b7f1.var_63e6c2f5f608f74e) && isarray(subarea.var_3ebb6024e3f220ca) && subarea.var_3ebb6024e3f220ca.size + 1 + var_ef017ff00ebc23ce <= subarea.var_7da9883d4168b7f1.var_63e6c2f5f608f74e) {
        var_2231df82d7283c43 = 1;
    }
    foreach (var_ee318f2c0c39c1ed in level.var_41670c1c65f3d3cf.var_1d7de2571d2c82a7) {
        if (array_find(level.var_41670c1c65f3d3cf.priorities, var_ee318f2c0c39c1ed) <= var_1992ef28a62e7ce) {
            break;
        }
        var_d3d06e31985486a6 = [];
        if (!istrue(var_97b87477cff57241)) {
            if (isdefined(subarea) && !var_2231df82d7283c43) {
                var_27d81dc45e0b6d94 = [];
                foreach (agent in subarea.var_3ebb6024e3f220ca) {
                    if (isagent(agent)) {
                        agentpriority = agentpers_getagentpersdata(agent, "priority");
                        if (array_find(level.var_41670c1c65f3d3cf.priorities, agentpriority) <= var_1992ef28a62e7ce) {
                            continue;
                        }
                        var_d3d06e31985486a6[var_d3d06e31985486a6.size] = agent;
                    } else if (isint(agent)) {
                        agentpriority = namespace_14d36171baccf528::function_2b0e82156fa6075b(agent).priority;
                        if (agentpriority <= var_1992ef28a62e7ce) {
                            continue;
                        }
                        var_27d81dc45e0b6d94[var_27d81dc45e0b6d94.size] = agent;
                    }
                }
                var_d3d06e31985486a6 = array_combine(var_d3d06e31985486a6, var_27d81dc45e0b6d94);
                if (var_d3d06e31985486a6.size == 0) {
                    return [0:0, 1:undefined];
                }
            } else {
                var_d3d06e31985486a6 = array_randomize(function_44c0059e33f55f00(var_ee318f2c0c39c1ed));
                if (isdefined(subarea)) {
                    var_d3d06e31985486a6 = function_baffa48bbd15cdc6(subarea, var_d3d06e31985486a6);
                }
            }
        } else if (isdefined(subarea) && !var_2231df82d7283c43) {
            foreach (agent in subarea.var_3ebb6024e3f220ca) {
                if (isint(agent)) {
                    agentpriority = namespace_14d36171baccf528::function_2b0e82156fa6075b(agent).priority;
                    if (agentpriority <= var_1992ef28a62e7ce) {
                        continue;
                    }
                    var_d3d06e31985486a6[var_d3d06e31985486a6.size] = agent;
                }
            }
            if (var_d3d06e31985486a6.size == 0) {
                return [0:0, 1:undefined];
            }
        } else {
            var_d3d06e31985486a6 = array_randomize(function_72ae84d7068be83f(var_ee318f2c0c39c1ed));
            if (isdefined(subarea)) {
                var_d3d06e31985486a6 = function_baffa48bbd15cdc6(subarea, var_d3d06e31985486a6);
            }
        }
        foreach (agent in var_d3d06e31985486a6) {
            if (!isagent(agent)) {
                if (isdefined(subarea) && !var_2231df82d7283c43 && !var_97b87477cff57241 && function_e8c0ac958d093ec2() + 1 == function_3813364e2323b789()) {
                    var_6ec0829abbd65125 = function_67224249ba9c2e2e(var_ee318f2c0c39c1ed, 1, var_1a532fbe5a6451e4, subarea);
                    if (!var_6ec0829abbd65125) {
                        return [0:0, 1:undefined];
                    }
                }
                function_4e065f1747aadd51(agent);
                return [0:1, 1:1];
            } else if (agent function_f31bfd56e7806afb(var_51a5a8b593bf4aa1)) {
                agent function_28b90eb2b591003f();
                return [0:1, 1:0];
            }
            var_cddbf16ffcf0b1e8++;
            if (var_cddbf16ffcf0b1e8 % 30 == 0) {
                waitframe();
            }
        }
    }
    return [0:0, 1:undefined];
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x470a
// Size: 0x1b4
function function_67224249ba9c2e2e(priority, var_51a5a8b593bf4aa1, var_1a532fbe5a6451e4, subarea) {
    var_cddbf16ffcf0b1e8 = 0;
    var_1992ef28a62e7ce = array_find(level.var_41670c1c65f3d3cf.priorities, priority);
    /#
        assert(isdefined(var_1992ef28a62e7ce), "tryRemoveAI_spawnedOnlyAnywhere: Given an invalid priority");
    #/
    if (!isdefined(subarea)) {
        subarea = function_a44e168e8cced18(var_1a532fbe5a6451e4);
    }
    foreach (var_ee318f2c0c39c1ed in level.var_41670c1c65f3d3cf.var_1d7de2571d2c82a7) {
        if (array_find(level.var_41670c1c65f3d3cf.priorities, var_ee318f2c0c39c1ed) <= var_1992ef28a62e7ce) {
            break;
        }
        var_d3d06e31985486a6 = array_randomize(function_44c0059e33f55f00(var_ee318f2c0c39c1ed));
        var_d3d06e31985486a6 = function_baffa48bbd15cdc6(subarea, var_d3d06e31985486a6);
        foreach (agent in var_d3d06e31985486a6) {
            if (agent function_f31bfd56e7806afb(var_51a5a8b593bf4aa1)) {
                if (istrue(level.var_45ca3cfb9dca4f97)) {
                    level thread namespace_d028276791d9cff6::drawsphere(agent.origin, 64, 500, (1, 0, 0));
                }
                agent function_28b90eb2b591003f();
                return 1;
            }
            var_cddbf16ffcf0b1e8++;
            if (var_cddbf16ffcf0b1e8 % 30 == 0) {
                waitframe();
            }
        }
    }
    return 0;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48c6
// Size: 0x20b
function function_28b90eb2b591003f() {
    /#
        namespace_d1a9ca87d78d9813::function_9533653868e59fb6("<unknown string>", "minVehicleSpawns" + function_2f6e6bb2b1fe3eea(self), self.category + "loop_sounds" + self.subcategory, undefined, undefined, undefined, agentpers_getagentpersdata(self, "<unknown string>"), self.origin);
        if (getdvarint(@"hash_bcbe3309344bb6d2", 0) == 1) {
            level thread draw_arrow_time(self.origin + (0, 0, 250), self.origin + (0, 0, 5000), (1, 0, 0), 120);
            print3d(self.origin + (0, 0, 105), "<unknown string>", (1, 0, 0), 1, 0.6, 6000);
            print3d(self.origin + (0, 0, 90), "tier3_closet" + function_2f6e6bb2b1fe3eea(self), (1, 0, 0), 1, 0.4, 6000);
            print3d(self.origin + (0, 0, 80), "team_hundred_ninety_five" + self.category, (1, 0, 0), 1, 0.4, 6000);
            print3d(self.origin + (0, 0, 70), "players" + self.subcategory, (1, 0, 0), 1, 0.4, 6000);
            iprintlnbold("<unknown string>" + function_2f6e6bb2b1fe3eea(self) + "generic" + self.category + "brloot_offhand_concussion" + self.subcategory);
        }
    #/
    agentpers_setagentpersdata(self, "skipDeathCount", 1);
    self.nocorpse = 1;
    self kill();
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ad8
// Size: 0x15f
function private function_f31bfd56e7806afb(var_51a5a8b593bf4aa1) {
    if (!isalive(self)) {
        return 0;
    }
    if (self.health < 1) {
        return 0;
    }
    if (istrue(self.dontkilloff)) {
        return 0;
    }
    if (istrue(self.playing_skit)) {
        return 0;
    }
    if (is_specified_unittype("juggernaut")) {
        return 0;
    }
    if (is_riding_vehicle()) {
        return 0;
    }
    if (!istrue(var_51a5a8b593bf4aa1)) {
        if (isdefined(self.enemy) && self canshootenemy()) {
            return 0;
        }
    }
    if (isdefined(self.birthtime) && self.birthtime >= gettime()) {
        return 0;
    }
    if (istrue(var_51a5a8b593bf4aa1)) {
        return 1;
    }
    var_934f2bd9f0e5c04b = get_see_recently_time_overrides();
    if (isdefined(self.group) && istrue(self.group.cqb_module)) {
        var_99189c9718781c5d = 1000000;
    } else {
        var_99189c9718781c5d = 4000000;
    }
    for (i = 0; i < level.players.size; i++) {
        var_678a0776298909d1 = level.players[i];
        if (distancesquared(var_678a0776298909d1.origin, self.origin) < var_99189c9718781c5d) {
            return 0;
        }
        if (self seerecently(var_678a0776298909d1, var_934f2bd9f0e5c04b)) {
            return 0;
        }
    }
    return 1;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c3f
// Size: 0x7e
function get_see_recently_time_overrides() {
    if (isdefined(self.see_recently_override)) {
        return self.see_recently_override;
    } else if (isdefined(self.group)) {
        if (isdefined(self.group.last_seen_time_override)) {
            return self.group.last_seen_time_override;
        } else if (istrue(self.group.cqb_module)) {
            return 2;
        } else {
            return 6;
        }
    } else {
        return 6;
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cc4
// Size: 0xd
function is_riding_vehicle() {
    return isdefined(self.ridingvehicle);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cd9
// Size: 0x73
function function_93add0b65db9f722(function, context) {
    if (!isdefined(level.var_da2aad7af92ce2d0)) {
        level.var_da2aad7af92ce2d0 = [];
    }
    if (!isdefined(context)) {
        context = self;
    }
    info = spawnstruct();
    info.function = function;
    info.context = context;
    level.var_da2aad7af92ce2d0[level.var_da2aad7af92ce2d0.size] = info;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d53
// Size: 0x9a
function function_66a6064fad612bf3(function, context) {
    if (!isdefined(context)) {
        context = self;
    }
    if (isdefined(level.var_da2aad7af92ce2d0)) {
        for (index = 0; index < level.var_da2aad7af92ce2d0.size; index++) {
            if (isdefined(level.var_da2aad7af92ce2d0[index]) && level.var_da2aad7af92ce2d0[index].function == function && level.var_da2aad7af92ce2d0[index].context == context) {
                level.var_da2aad7af92ce2d0[index] = undefined;
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4df4
// Size: 0x8a
function function_be9c6fbd4dc69254(agent, killer) {
    if (isdefined(level.var_da2aad7af92ce2d0)) {
        foreach (info in level.var_da2aad7af92ce2d0) {
            info.context thread [[ info.function ]](agent, killer);
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e85
// Size: 0xb6
function function_49d965cff987ed32() {
    /#
        while (1) {
            waitframe();
            if (getdvarint(@"hash_d054932c3f2f177b", 0) != 0) {
                tier = getdvarint(@"hash_d054932c3f2f177b", 0);
                aitype = function_7f1a2e2ebe0c1693("<unknown string>", tier);
                agent = ai_mp_requestspawnagent(aitype, level.players[0].origin, (0, 0, 0), "<unknown string>", "<unknown string>", "<unknown string>", undefined, undefined, undefined, undefined, 0, 0, 0);
                function_dc01699146e5f9a2(agent);
                setdvar(@"hash_d054932c3f2f177b", 0);
            }
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f42
// Size: 0x9e
function function_d2d3ddd52666dcf0() {
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    function_7b8a64e4ec045a1b();
    brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    if (!namespace_36f464722d326bbe::isbrstylegametype() || brgametype == "dmz" || brgametype == "exgm" || getdvarint(@"hash_61829d18989706cf", 1) == 0) {
        function_ae8293438b86ca23();
        function_b0bb893f94e993b4();
        function_1d0b1e527bd1bd48();
    }
    function_bebc5768175d5170();
    function_1353821e73926c69();
    level.var_f79746dab56dca8c = getstructarray("para_landingSpot", "script_noteworthy");
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fe7
// Size: 0x11a
function function_7b8a64e4ec045a1b() {
    if (!function_47d356083884f913()) {
        return;
    }
    var_78fa8d928a0c292 = [];
    foreach (poiname, poi in level.poi) {
        if (isdefined(poi) && isdefined(poi["subAreas"])) {
            foreach (subarea in poi["subAreas"]) {
                if (isdefined(level.var_7da9883d4168b7f1[poiname]) && isdefined(level.var_7da9883d4168b7f1[poiname][subarea.var_71ad22c5d093d90b])) {
                    subarea.var_7da9883d4168b7f1 = level.var_7da9883d4168b7f1[poiname][subarea.var_71ad22c5d093d90b];
                }
            }
        }
    }
    level.var_7da9883d4168b7f1 = undefined;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5108
// Size: 0x3a7
function function_ae8293438b86ca23() {
    var_c034726a93bbff6e = getstructarray("spawnPackage_mainNode", "script_noteworthy");
    foreach (var_f44bdb70807d60a9 in var_c034726a93bbff6e) {
        if (!isdefined(var_f44bdb70807d60a9.target)) {
            continue;
        }
        if (function_47d356083884f913()) {
            if (!isdefined(var_f44bdb70807d60a9.poi)) {
                var_f44bdb70807d60a9.poi = function_6cc445c02b5effac(var_f44bdb70807d60a9.origin);
            }
            jumpiffalse(!poi_ispoiactive(var_f44bdb70807d60a9.poi) && !istrue(level.var_4cfd75aa6ddde156)) LOC_0000010e;
        } else {
        LOC_0000010e:
            spawnpackage = spawnstruct();
            spawnpackage.origin = var_f44bdb70807d60a9.origin;
            spawnpackage.var_2ef873e30a270bcf = [];
            spawnpackage.var_d7baafc9b07f5094 = [];
            spawnpackage.var_6c25fe44ff159d0e = [];
            poiname = undefined;
            subarea = undefined;
            if (function_47d356083884f913()) {
                poiname = var_f44bdb70807d60a9.poi;
                subarea = function_a44e168e8cced18(var_f44bdb70807d60a9.origin, var_f44bdb70807d60a9.poi);
            }
            if (!isdefined(subarea)) {
                /#
                    if (isdefined(var_f44bdb70807d60a9.poi)) {
                        println("<unknown string>" + var_f44bdb70807d60a9.poi + "<unknown string>");
                    } else {
                        println("<unknown string>");
                    }
                #/
                return;
            } else {
                spawnpackage.var_71ad22c5d093d90b = subarea.var_71ad22c5d093d90b;
                spawnpackage.poi = poiname;
                spawnpackage.nationality = var_f44bdb70807d60a9.nationality;
            }
            var_da8b6c7c8ad40ce1 = getstructarray(var_f44bdb70807d60a9.target, "targetname");
            foreach (node in var_da8b6c7c8ad40ce1) {
                if (isdefined(node.script_noteworthy)) {
                    script_noteworthy = tolower(node.script_noteworthy);
                    node.var_71ad22c5d093d90b = spawnpackage.var_71ad22c5d093d90b;
                    node.poi = poiname;
                    if (issubstr(script_noteworthy, "guard")) {
                        spawnpackage.var_2ef873e30a270bcf[spawnpackage.var_2ef873e30a270bcf.size] = node;
                    } else if (issubstr(script_noteworthy, "patrolstart") || issubstr(script_noteworthy, "patrolpath")) {
                        pathstruct = function_9edcf99159abb0b(node, issubstr(script_noteworthy, "looped"));
                        spawnpackage.var_d7baafc9b07f5094[spawnpackage.var_d7baafc9b07f5094.size] = pathstruct;
                    }
                    if (issubstr(script_noteworthy, "civ")) {
                        spawnpackage.var_6c25fe44ff159d0e[spawnpackage.var_6c25fe44ff159d0e.size] = node;
                    }
                }
            }
            if (isdefined(var_f44bdb70807d60a9.required) && var_f44bdb70807d60a9.required == "1") {
                subarea.var_d276b08c96430bfc[subarea.var_d276b08c96430bfc.size] = spawnpackage;
            } else {
                subarea.var_24a2cd19eed8f75d[subarea.var_24a2cd19eed8f75d.size] = spawnpackage;
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54b6
// Size: 0x124
function function_1d0b1e527bd1bd48() {
    var_c9e457777ce86549 = getstructarray("roofPackage_mainNode", "script_noteworthy");
    foreach (var_51ab38bb8d2e56e0 in var_c9e457777ce86549) {
        if (!isdefined(var_51ab38bb8d2e56e0.target)) {
            continue;
        }
        subarea = undefined;
        if (function_47d356083884f913()) {
            if (!isdefined(var_51ab38bb8d2e56e0.poi)) {
                var_51ab38bb8d2e56e0.poi = function_6cc445c02b5effac(var_51ab38bb8d2e56e0.origin);
            }
            if (!poi_ispoiactive(var_51ab38bb8d2e56e0.poi) && !istrue(level.var_4cfd75aa6ddde156)) {
                continue;
            }
            subarea = function_a44e168e8cced18(var_51ab38bb8d2e56e0.origin, var_51ab38bb8d2e56e0.poi);
        }
        if (!isdefined(subarea)) {
            continue;
        }
        subarea.var_78b67865ef2a33d3 = getstructarray(var_51ab38bb8d2e56e0.target, "targetname");
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55e1
// Size: 0x124
function function_b0bb893f94e993b4() {
    var_89028783941c2cb5 = getstructarray("patrolPackage_mainNode", "script_noteworthy");
    foreach (var_3e7f36981b173d04 in var_89028783941c2cb5) {
        if (!isdefined(var_3e7f36981b173d04.target)) {
            continue;
        }
        subarea = undefined;
        if (function_47d356083884f913()) {
            if (!isdefined(var_3e7f36981b173d04.poi)) {
                var_3e7f36981b173d04.poi = function_6cc445c02b5effac(var_3e7f36981b173d04.origin);
            }
            if (!poi_ispoiactive(var_3e7f36981b173d04.poi) && !istrue(level.var_4cfd75aa6ddde156)) {
                continue;
            }
            subarea = function_a44e168e8cced18(var_3e7f36981b173d04.origin, var_3e7f36981b173d04.poi);
        }
        if (!isdefined(subarea)) {
            continue;
        }
        subarea.var_2976480563de74df = getstructarray(var_3e7f36981b173d04.target, "targetname");
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x570c
// Size: 0x259
function function_f41c155e991af4f9() {
    var_3ebbac089a29e000 = getstructarray("skit_mainNode", "script_noteworthy");
    foreach (var_6ff17f9f9e0ea073 in var_3ebbac089a29e000) {
        var_887d46b1410c42ca = spawnstruct();
        var_887d46b1410c42ca.origin = var_6ff17f9f9e0ea073.origin;
        var_887d46b1410c42ca.var_2ef873e30a270bcf = [];
        var_887d46b1410c42ca.var_d7baafc9b07f5094 = [];
        var_887d46b1410c42ca.var_6c25fe44ff159d0e = [];
        var_da8b6c7c8ad40ce1 = getstructarray(var_6ff17f9f9e0ea073.target, "targetname");
        foreach (node in var_da8b6c7c8ad40ce1) {
            if (isdefined(node.script_noteworthy)) {
                script_noteworthy = tolower(node.script_noteworthy);
                if (issubstr(script_noteworthy, "guard")) {
                    var_887d46b1410c42ca.var_2ef873e30a270bcf[var_887d46b1410c42ca.var_2ef873e30a270bcf.size] = node;
                } else if (script_noteworthy == "patrolstart" || issubstr(script_noteworthy, "patrolpath")) {
                    pathstruct = function_9edcf99159abb0b(node, issubstr(script_noteworthy, "looped"));
                    var_887d46b1410c42ca.var_d7baafc9b07f5094[var_887d46b1410c42ca.var_d7baafc9b07f5094.size] = pathstruct;
                } else if (issubstr(script_noteworthy, "civilian")) {
                    var_887d46b1410c42ca.var_6c25fe44ff159d0e[var_887d46b1410c42ca.var_6c25fe44ff159d0e.size] = node;
                }
            }
        }
        if (function_47d356083884f913()) {
            poiname = var_6ff17f9f9e0ea073.poi;
            subarea = function_a44e168e8cced18(var_6ff17f9f9e0ea073.origin, poiname);
        } else {
            subarea = function_a44e168e8cced18(var_6ff17f9f9e0ea073.origin);
        }
        subarea.var_37c530d20df6bcdb[subarea.var_37c530d20df6bcdb.size] = var_887d46b1410c42ca;
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x596c
// Size: 0x140
function function_bebc5768175d5170() {
    level.patrolpaths = [];
    if (function_47d356083884f913()) {
        function_44739fe1cf82e29a("patrolPaths");
    }
    var_b575289437fb9924 = getstructarray("patrolPath_Fortress", "script_noteworthy");
    var_b575289437fb9924 = array_combine(var_b575289437fb9924, getstructarray("patrolStart", "script_noteworthy"));
    foreach (node in var_b575289437fb9924) {
        pathstruct = function_9edcf99159abb0b(node);
        if (isdefined(pathstruct)) {
            pathstruct.origin = node.origin;
            level.patrolpaths[level.patrolpaths.size] = pathstruct;
            if (function_47d356083884f913()) {
                poiname = node.poi;
                if (!isdefined(node.poi)) {
                    poiname = function_6cc445c02b5effac(node.origin);
                }
                function_d0e7647e5538eb9d(poiname, "patrolPaths", pathstruct);
            }
        }
    }
    if (function_47d356083884f913()) {
        level thread function_7132401e09a9ccc7();
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ab3
// Size: 0x66
function function_7132401e09a9ccc7() {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("fortress", "spawn")) {
        level waittill("infils_ready");
        level.patrolpaths = undefined;
    } else {
        while (!namespace_4b0406965e556711::gameflagexists("prematch_done") || namespace_4b0406965e556711::gameflagexists("prematch_done") && !namespace_4b0406965e556711::gameflag("prematch_done")) {
            waitframe();
        }
        level.patrolpaths = undefined;
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b20
// Size: 0x112
function function_9edcf99159abb0b(node, var_298fcb67e460e16f) {
    path = [];
    index = 0;
    path[index] = node;
    var_4437e81f60b6b5a0 = 0;
    if (!isdefined(path[index].target)) {
        return;
    }
    nextnode = getstruct(path[index].target, "targetname");
    if (!isdefined(nextnode)) {
        return;
    }
    while (1) {
        if (!isdefined(path[index].target)) {
            if (!istrue(var_298fcb67e460e16f)) {
                var_4437e81f60b6b5a0 = 1;
            }
            break;
        }
        nextnode = getstruct(path[index].target, "targetname");
        if (!isdefined(nextnode) || node == nextnode || path[index] == nextnode) {
            break;
        }
        index++;
        path[index] = nextnode;
    }
    pathstruct = spawnstruct();
    pathstruct.path = path;
    pathstruct.claimed = 0;
    pathstruct.var_4437e81f60b6b5a0 = var_4437e81f60b6b5a0;
    return pathstruct;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c3a
// Size: 0x235
function function_1353821e73926c69() {
    level.looseguardnodes = [];
    function_44739fe1cf82e29a("looseGuardNodes");
    level.firstkillfoddernodes = [];
    function_44739fe1cf82e29a("firstKillFodderNodes");
    keys = getarraykeys(level.struct_class_names["script_noteworthy"]);
    foreach (key in keys) {
        if (issubstr(key, "guard")) {
            foreach (node in level.struct_class_names["script_noteworthy"][key]) {
                if (!isdefined(node.targetname)) {
                    if (!isdefined(node.poi)) {
                        node.poi = function_6cc445c02b5effac(node.origin);
                    }
                    if (tolower(key) == "guard" || issubstr(tolower(key), "guard_stationary") || issubstr(tolower(key), "guard_spawnset")) {
                        level.looseguardnodes[level.looseguardnodes.size] = node;
                        function_d0e7647e5538eb9d(node.poi, "looseGuardNodes", node);
                    } else if (issubstr(node.script_noteworthy, "firstKillFodder")) {
                        level.firstkillfoddernodes[level.firstkillfoddernodes.size] = node;
                        function_d0e7647e5538eb9d(node.poi, "firstKillFodderNodes", node);
                    } else if (!isdefined(node.target) && !issubstr(tolower(key), "boss")) {
                        level.looseguardnodes[level.looseguardnodes.size] = node;
                        function_d0e7647e5538eb9d(node.poi, "looseGuardNodes", node);
                    }
                }
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e76
// Size: 0xc7
function function_525668dfdc6f8421() {
    level.var_82e8eb77e9b274e6 = level.looseguardnodes;
    foreach (pathstruct in level.patrolpaths) {
        foreach (node in pathstruct.path) {
            level.var_82e8eb77e9b274e6[level.var_82e8eb77e9b274e6.size] = node;
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f44
// Size: 0x1d8
function function_645bfe3907dcc2a0() {
    level.var_f81cb9ead7b61ac1 = [];
    keys = getarraykeys(level.struct_class_names["script_noteworthy"]);
    foreach (key in keys) {
        if (issubstr(key, "spawn_area")) {
            struct = spawnstruct();
            struct.origin = level.struct_class_names["script_noteworthy"][key][0].origin;
            struct.var_2ef873e30a270bcf = [];
            struct.patrolpaths = [];
            poiname = level.struct_class_names["script_noteworthy"][key][0].poi;
            if (function_47d356083884f913() && isdefined(poiname)) {
                function_44739fe1cf82e29a("subAreas");
                function_d0e7647e5538eb9d(poiname, "subAreas", struct, key);
            } else {
                if (!isdefined(level.var_21d3078030950348)) {
                    level.var_f81cb9ead7b61ac1 = [];
                }
                level.var_f81cb9ead7b61ac1[key] = struct;
            }
        }
    }
    if (function_47d356083884f913()) {
        foreach (poiname, poi in level.poi) {
            function_c1e539c16aeb4bd1(poiname);
        }
    } else if (isdefined(level.var_21d3078030950348) && level.var_f81cb9ead7b61ac1.size > 0) {
        level.var_947cc8c185b0ea9c = 1;
        function_c1e539c16aeb4bd1();
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6123
// Size: 0x345
function function_c1e539c16aeb4bd1(poiname) {
    if (isdefined(poiname)) {
        var_2ef873e30a270bcf = level.poi[poiname]["looseGuardNodes"];
        var_d09aecdb0d855501 = level.poi[poiname]["subAreas"];
    } else {
        var_2ef873e30a270bcf = level.looseguardnodes;
        var_d09aecdb0d855501 = level.var_f81cb9ead7b61ac1;
    }
    if (var_d09aecdb0d855501.size == 0) {
        return;
    }
    foreach (node in var_2ef873e30a270bcf) {
        var_e6fd13e3873e27fc = undefined;
        closestdist = undefined;
        foreach (key, area in var_d09aecdb0d855501) {
            dist = distance2dsquared(node.origin, area.origin);
            if (!isdefined(var_e6fd13e3873e27fc)) {
                var_e6fd13e3873e27fc = key;
                closestdist = dist;
            } else if (dist < closestdist) {
                var_e6fd13e3873e27fc = key;
                closestdist = dist;
            }
        }
        if (isdefined(poiname)) {
            level.poi[poiname]["subAreas"][var_e6fd13e3873e27fc].var_2ef873e30a270bcf[level.poi[poiname]["subAreas"][var_e6fd13e3873e27fc].var_2ef873e30a270bcf.size] = node;
        } else {
            level.var_f81cb9ead7b61ac1[var_e6fd13e3873e27fc].var_2ef873e30a270bcf[level.var_f81cb9ead7b61ac1[var_e6fd13e3873e27fc].var_2ef873e30a270bcf.size] = node;
        }
    }
    if (isdefined(poiname)) {
        patrolpaths = level.poi[poiname]["patrolPaths"];
    } else {
        patrolpaths = level.patrolpaths;
    }
    foreach (pathstruct in patrolpaths) {
        var_e6fd13e3873e27fc = undefined;
        closestdist = undefined;
        foreach (key, area in var_d09aecdb0d855501) {
            dist = distance2dsquared(pathstruct.path[0].origin, area.origin);
            if (!isdefined(var_e6fd13e3873e27fc)) {
                var_e6fd13e3873e27fc = key;
                closestdist = dist;
            } else if (dist < closestdist) {
                var_e6fd13e3873e27fc = key;
                closestdist = dist;
            }
        }
        if (isdefined(poiname)) {
            level.poi[poiname]["subAreas"][var_e6fd13e3873e27fc].patrolpaths[level.poi[poiname]["subAreas"][var_e6fd13e3873e27fc].patrolpaths.size] = pathstruct;
        } else {
            level.var_f81cb9ead7b61ac1[var_e6fd13e3873e27fc].patrolpaths[level.var_f81cb9ead7b61ac1[var_e6fd13e3873e27fc].patrolpaths.size] = pathstruct;
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x646f
// Size: 0x159
function aibudget_init() {
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    waittillframeend();
    level.var_41670c1c65f3d3cf = spawnstruct();
    level.var_41670c1c65f3d3cf.var_25087194b5e05d51 = 0;
    level.var_41670c1c65f3d3cf.var_ef41bd897f02797b = [];
    function_572838690d80d959("everybody");
    function_c05702cc1f931b44();
    if (isdefined(level.var_428703950599c9e9)) {
        [[ level.var_428703950599c9e9 ]]();
    } else {
        namespace_b27abd42d87cb8c0::function_428703950599c9e9();
    }
    level.var_41670c1c65f3d3cf.maxagents = getmaxagents() - 1;
    if (isdefined(level.poi)) {
        level.var_41670c1c65f3d3cf.poi = [];
        foreach (poiname, poi in level.poi) {
            struct = spawnstruct();
            struct.var_25087194b5e05d51 = 0;
            function_b49cde2a52702967(poiname, "everybody");
            level.var_41670c1c65f3d3cf.poi[poiname] = struct;
        }
    }
    flag_set("aiBudget_init");
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65cf
// Size: 0x7f
function function_2fc80954fa70d153() {
    while (!isdefined(level.agentarray)) {
        waitframe();
    }
    while (!isdefined(level.var_41670c1c65f3d3cf)) {
        waitframe();
    }
    while (!isdefined(level.var_41670c1c65f3d3cf.maxagents)) {
        waitframe();
    }
    maxagents = function_3813364e2323b789();
    while (level.agentarray.size < maxagents) {
        waitframe();
    }
    if (function_47d356083884f913()) {
        while (!istrue(level.var_9589c5a19c1a71fc)) {
            waitframe();
        }
    }
    waitframe();
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6655
// Size: 0x35
function function_b1d1e7e3b23e0dfe(var_8dc7c013853f3f4e) {
    /#
        assert(isdefined(level.var_41670c1c65f3d3cf), "aiBudget_registerCategories: You can't call this before aiBudget_init");
    #/
    level.var_4cdd253dc5f7cd32 = var_8dc7c013853f3f4e;
    function_1c161b20f0c6c6b5(var_8dc7c013853f3f4e);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6691
// Size: 0x90
function function_ba4022744dce59f6(category, maxagents) {
    /#
        assert(isdefined(level.var_41670c1c65f3d3cf) && isdefined(level.var_41670c1c65f3d3cf.var_ef41bd897f02797b), "aiBudget_registerCategory: You can't call this before aiBudget_init");
    #/
    /#
        assert(isdefined(category), "category undefined");
    #/
    if (isdefined(maxagents)) {
        level.var_41670c1c65f3d3cf.var_ef41bd897f02797b[category] = maxagents;
    }
    level.var_4cdd253dc5f7cd32 = array_add_safe(level.var_4cdd253dc5f7cd32, category);
    function_572838690d80d959(category);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6728
// Size: 0x100
function function_157c2000284999eb(agent, category, subcategory, poiname) {
    /#
        assert(isdefined(agent), "aiBudget_registerAgent: Agent is undefined");
    #/
    /#
        assert(isdefined(level.var_41670c1c65f3d3cf), "aiBudget_registerAgent: You can't call this before aiBudget_init");
    #/
    /#
        assert(isdefined(agent) && isdefined(category) && isdefined(subcategory), "aiBudget_registerAgent: All params must be defined");
    #/
    if (isagent(agent)) {
        agentpers_setagentpersdata(agent, "category", category);
        agentpers_setagentpersdata(agent, "subcategory", subcategory);
    }
    function_e812b7065161da79(agent, category);
    if (category != "everybody") {
        function_e812b7065161da79(agent, "everybody");
    }
    if (function_47d356083884f913()) {
        if (isagent(agent) && isdefined(agent.poi)) {
            poiname = agent.poi;
        }
        if (!isdefined(poiname)) {
            return;
        }
        function_a0cfb616f44b7907(agent, poiname, category);
        if (category != "everybody") {
            function_a0cfb616f44b7907(agent, poiname, "everybody");
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x682f
// Size: 0x118
function private function_1e5307c0d848a9ca(agent, poiname) {
    if (!isdefined(agent)) {
        return;
    }
    /#
        assert(isdefined(level.var_41670c1c65f3d3cf), "aiBudget_deregisterAgent: You can't call this before aiBudget_init");
    #/
    category = undefined;
    subcategory = undefined;
    if (isagent(agent)) {
        category = agentpers_getagentpersdata(agent, "category");
        subcategory = agentpers_getagentpersdata(agent, "subcategory");
    } else if (isint(agent)) {
        var_7d2909fdc2b71387 = level.var_879053468f168806[agent];
        category = var_7d2909fdc2b71387.category;
        subcategory = var_7d2909fdc2b71387.subcategory;
    }
    /#
        assert(isdefined(category), "aiBudget_deregisterAgent: Didn't find a category for the given agent");
    #/
    /#
        assert(isdefined(subcategory), "aiBudget_deregisterAgent: Didn't find a subcategory for the given agent");
    #/
    function_c36f897d56e28169(agent, category);
    if (category != "everybody") {
        function_c36f897d56e28169(agent, "everybody");
    }
    if (function_47d356083884f913() && isdefined(poiname)) {
        function_d57d61c9f7b4aa77(agent, poiname, category);
        if (category != "everybody") {
            function_d57d61c9f7b4aa77(agent, poiname, "everybody");
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x694e
// Size: 0x3a
function function_9368fb9261e4cd0a(category) {
    /#
        assert(isdefined(level.var_41670c1c65f3d3cf), "aiBudget_totalAgentsInCategory: You can't call this before aiBudget_init");
    #/
    /#
        assert(isdefined(category), "aiBudget_totalAgentsInCategory: Must be called on a defined category");
    #/
    return function_9a83377c98bce82a(category);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6990
// Size: 0x94
function private function_5069c21ddc5c2227(category) {
    /#
        assert(isdefined(level.var_41670c1c65f3d3cf) && isdefined(level.var_41670c1c65f3d3cf.var_ef41bd897f02797b) && isdefined(level.var_41670c1c65f3d3cf.var_ef41bd897f02797b), "aiBudget_agentsAvailableInCategory: You can't call this before aiBudget_init");
    #/
    /#
        assert(isdefined(category), "aiBudget_agentsAvailableInCategory: Must be called on a defined category");
    #/
    var_8728595177092026 = level.var_41670c1c65f3d3cf.var_ef41bd897f02797b[category];
    if (!isdefined(var_8728595177092026)) {
        return undefined;
    }
    return var_8728595177092026 - function_9368fb9261e4cd0a(category);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a2c
// Size: 0x216
function function_8c6dbb64c8e1603c(number, category, origin, poiname, var_97b87477cff57241, subarea) {
    /#
        assert(isdefined(level.var_41670c1c65f3d3cf) && isdefined(level.var_41670c1c65f3d3cf.var_ef41bd897f02797b) && isdefined(level.var_41670c1c65f3d3cf.var_ef41bd897f02797b), "aiBudget_canSpawnNumAgents: You can't call this before aiBudget_init");
    #/
    /#
        assert(isdefined(number), "aiBudget_canSpawnNumAgents: number must be defined");
    #/
    var_868c5168078feacf = !istrue(var_97b87477cff57241) && function_e8c0ac958d093ec2() + number <= function_3813364e2323b789() || istrue(var_97b87477cff57241) && function_b27fe8a834c5edda() + number <= function_3b45c895d8d984ee();
    if (getdvarint(@"hash_a0cb2262bebb424b", 0)) {
        return var_868c5168078feacf;
    }
    var_2231df82d7283c43 = undefined;
    if (function_47d356083884f913()) {
        var_2231df82d7283c43 = 0;
        if (!isdefined(subarea)) {
            subarea = function_a44e168e8cced18(origin, poiname);
        }
        if (isdefined(subarea)) {
            var_ef017ff00ebc23ce = ter_op(isdefined(subarea.var_f27d7498eb54dd99), subarea.var_f27d7498eb54dd99, 0);
        } else {
            var_ef017ff00ebc23ce = 0;
        }
        if (getdvarint(@"hash_9f36593603489c07", 0) == 1) {
            var_2231df82d7283c43 = 1;
        }
        if (isint(number) && isdefined(subarea) && isdefined(subarea.var_7da9883d4168b7f1) && isdefined(subarea.var_7da9883d4168b7f1.var_63e6c2f5f608f74e) && isarray(subarea.var_3ebb6024e3f220ca) && subarea.var_3ebb6024e3f220ca.size + number + var_ef017ff00ebc23ce <= subarea.var_7da9883d4168b7f1.var_63e6c2f5f608f74e) {
            var_2231df82d7283c43 = 1;
        }
    }
    var_74f7067d31b382f9 = undefined;
    if (isdefined(category)) {
        var_74f7067d31b382f9 = function_5069c21ddc5c2227(category);
    }
    var_ff9ff42ed5501237 = !isdefined(var_74f7067d31b382f9) || var_74f7067d31b382f9 >= number;
    return var_868c5168078feacf && var_ff9ff42ed5501237 && (!isdefined(var_2231df82d7283c43) || var_2231df82d7283c43);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c4a
// Size: 0x103
function function_359f24553bdcca92(number, priority) {
    /#
        assert(isdefined(priority) && isdefined(number), "aiBudget_canKillOffNumAgents: All params must be defined");
    #/
    var_944b7bc21500684a = 0;
    var_1992ef28a62e7ce = array_find(level.var_41670c1c65f3d3cf.priorities, priority);
    /#
        assert(isdefined(var_1992ef28a62e7ce), "aiBudget_canKillOffNumAgents: Given an invalid priority");
    #/
    foreach (var_ee318f2c0c39c1ed in level.var_41670c1c65f3d3cf.var_1d7de2571d2c82a7) {
        if (array_find(level.var_41670c1c65f3d3cf.priorities, var_ee318f2c0c39c1ed) <= var_1992ef28a62e7ce) {
            break;
        }
        var_944b7bc21500684a = var_944b7bc21500684a + function_44c0059e33f55f00(var_ee318f2c0c39c1ed).size;
    }
    return function_e8c0ac958d093ec2() + number - var_944b7bc21500684a <= function_3813364e2323b789();
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d55
// Size: 0xd
function function_e884d14c5b07b811() {
    return function_9a83377c98bce82a("everybody");
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d6a
// Size: 0xd
function function_e8c0ac958d093ec2() {
    return function_718d435f9750c1b5("everybody");
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d7f
// Size: 0x76
function function_bd71347864330395(array) {
    if (!isdefined(array)) {
        return function_e8c0ac958d093ec2();
    }
    var_3d2e4b298e935c8d = 0;
    foreach (agent in array) {
        if (isagent(agent)) {
            var_3d2e4b298e935c8d++;
        }
    }
    return var_3d2e4b298e935c8d;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dfd
// Size: 0x16
function function_3813364e2323b789() {
    return level.var_41670c1c65f3d3cf.maxagents;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e1b
// Size: 0x3dd
function function_7ee4a8954b638ed3(agent, var_28173fd6b5a461f) {
    meansofdeath = killer = agent waittill("death");
    agent.var_9e3b0c89066bf153 = 1;
    vehiclekiller = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "vehicleKiller");
    var_8571123198e1b65c = undefined;
    if (isdefined(vehiclekiller)) {
        killer = vehiclekiller;
    }
    if (isdefined(killer) && isplayer(killer)) {
        var_af65abf8cf095694 = "none";
        var_22caf6654438c835 = 0;
        if (isdefined(meansofdeath)) {
            var_af65abf8cf095694 = meansofdeath;
            if (meansofdeath == "MOD_HEAD_SHOT") {
                var_22caf6654438c835 = 1;
            }
        }
        var_19f06b9a4a523b5f = killer getcurrentweapon();
        var_8571123198e1b65c = var_19f06b9a4a523b5f issilenced();
        killer dlog_recordplayerevent("dlog_event_dmz_player_killed_ai", [0:"means_of_death", 1:var_af65abf8cf095694, 2:"playerweapon", 3:var_19f06b9a4a523b5f.basename, 4:"isheadshot", 5:var_22caf6654438c835]);
    }
    var_8227176423f57171 = isdefined(meansofdeath) && meansofdeath == "MOD_DESPAWN";
    poiname = agentpers_getagentpersdata(agent, "poiName");
    subarea = agentpers_getagentpersdata(agent, "subArea");
    if (namespace_3c37cb17ade254d::issharedfuncdefined("analytics", "agent_killed")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("analytics", "agent_killed") ]](agent, var_8227176423f57171, killer);
    }
    if (!istrue(agentpers_getagentpersdata(agent, "skipDeathCount")) && !istrue(var_8227176423f57171)) {
        level.var_41670c1c65f3d3cf.var_25087194b5e05d51++;
        if (function_47d356083884f913() && isdefined(poiname)) {
            level.var_41670c1c65f3d3cf.poi[poiname].var_25087194b5e05d51++;
        }
        function_3daefb936272829f(poiname, agent.origin, gettime(), subarea);
        thread function_be9c6fbd4dc69254(agent, killer);
        agent thread function_cdcce09b74c7cd1b(meansofdeath);
        if (isdefined(var_28173fd6b5a461f)) {
            var_28173fd6b5a461f.var_13235d60c661e10b--;
        }
        team = agentpers_getagentpersdata(agent, "team");
        assignedobjective = agentpers_getagentpersdata(agent, "assignedObjective");
        if (isdefined(assignedobjective)) {
            assignedobjective.var_99669e1e71dbd643[team] = array_remove(assignedobjective.var_99669e1e71dbd643[team], agent);
        }
        agentstruct = agentpers_getagentpersdata(agent, "agentStruct");
        if (isdefined(agentstruct)) {
            if (isdefined(agentstruct.group)) {
                [[ agentstruct.ondeath ]](agent, killer);
            } else if (isdefined(level.var_59cffb78293fe83c) && isdefined(level.var_59cffb78293fe83c.ondeath)) {
                [[ level.var_59cffb78293fe83c.ondeath ]](agent, killer);
            }
        }
    }
    function_1e5307c0d848a9ca(agent, poiname);
    function_691d163cd3f6fd1a(agent);
    if (isdefined(subarea)) {
        subarea_removeagentfrom(agent, subarea);
        if (!istrue(agentpers_getagentpersdata(agent, "skipDeathCount"))) {
            delay = 0;
            lastnonsilenceddamagetime = agentpers_getagentpersdata(self, "lastNonSilencedDamageTime");
            if (istrue(var_8571123198e1b65c) && (!isdefined(lastnonsilenceddamagetime) || isdefined(lastnonsilenceddamagetime) && gettime() - lastnonsilenceddamagetime > level.var_96abdb45aee491fc * 1000)) {
                delay = level.var_5dcccc815e25c8e2;
            }
            level thread function_95c315b1e51bd9c5(subarea, delay);
        }
    }
    cqbnode = agentpers_getagentpersdata(agent, "cqbNode");
    if (isdefined(cqbnode)) {
        function_25190883a02fdef7(cqbnode);
    }
    waittillframeend();
    function_51de6da7b0dcf26f(agent);
    agent.var_9e3b0c89066bf153 = 0;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71ff
// Size: 0x273
function function_1d52040f64b0d854(poiname) {
    idle = 0;
    investigate = 0;
    combat = 0;
    hunt = 0;
    if (isdefined(poiname) && isdefined(level.poi[poiname]) && isdefined(level.poi[poiname]["subAreas"])) {
        foreach (subarea in level.poi[poiname]["subAreas"]) {
            foreach (agent in subarea.var_3ebb6024e3f220ca) {
                if (!isagent(agent)) {
                    idle++;
                } else if (!istrue(agent.stealth_enabled)) {
                    if (isdefined(agent.enemy)) {
                        combat++;
                    } else {
                        idle++;
                    }
                } else if (agent [[ agent.fnisinstealthidle ]]()) {
                    idle++;
                } else if (agent [[ agent.fnisinstealthinvestigate ]]()) {
                    investigate++;
                } else if (agent [[ agent.fnisinstealthcombat ]]()) {
                    combat++;
                } else if (agent [[ agent.fnisinstealthhunt ]]()) {
                    hunt++;
                }
            }
        }
    } else if (isdefined(level.agentarray)) {
        foreach (agent in level.agentarray) {
            if (!isalive(agent)) {
                continue;
            }
            if (agent [[ agent.fnisinstealthidle ]]()) {
                idle++;
            } else if (agent [[ agent.fnisinstealthinvestigate ]]()) {
                investigate++;
            } else if (agent [[ agent.fnisinstealthcombat ]]()) {
                combat++;
            } else if (agent [[ agent.fnisinstealthhunt ]]()) {
                hunt++;
            }
        }
    }
    return [0:idle, 1:investigate, 2:combat, 3:hunt];
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x747a
// Size: 0x4d
function function_bc423135571b28c1() {
    level endon("game_ended");
    while (1) {
        if (getdvarint(@"hash_27877364a9af40a5", 0) == 1) {
            var_fa77d17200596805 = getaicount();
            logstring("Current agent count = " + var_fa77d17200596805);
            wait(30);
        } else {
            wait(1);
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x74ce
// Size: 0x8b
function private function_c05702cc1f931b44() {
    level.var_41670c1c65f3d3cf.priorities = [0:"absolute", 1:"high", 2:"medium", 3:"low", 4:"filler"];
    level.var_41670c1c65f3d3cf.var_1d7de2571d2c82a7 = array_reverse(level.var_41670c1c65f3d3cf.priorities);
    function_1c161b20f0c6c6b5(level.var_41670c1c65f3d3cf.priorities);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7560
// Size: 0x77
function private function_80136fb230fd0646(agent, priority) {
    /#
        assert(isdefined(priority) && array_contains(level.var_41670c1c65f3d3cf.priorities, priority), "priority_set: Can only be called on valid priorities, not: " + priority);
    #/
    /#
        assert(isdefined(agent), "priority_set: Can't be called on undefined agents");
    #/
    agent.priority = priority;
    function_e812b7065161da79(agent, priority);
    agentpers_setagentpersdata(agent, "priority", priority);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x75de
// Size: 0x5c
function private priority_setbydormancyid(var_451a9d27d63c746b, priority) {
    /#
        assert(isdefined(priority) && array_contains(level.var_41670c1c65f3d3cf.priorities, priority), "priority_setByDormancyId: Can only be called on valid priorities, not: " + priority);
    #/
    /#
        assert(isdefined(var_451a9d27d63c746b), "priority_setByDormancyId: Can't be called with no dormancyID");
    #/
    function_e812b7065161da79(var_451a9d27d63c746b, priority);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7641
// Size: 0x66
function private function_691d163cd3f6fd1a(agent) {
    /#
        assert(isdefined(agent), "priority_remove: Can't be called on undefined agents");
    #/
    priority = function_2f6e6bb2b1fe3eea(agent);
    /#
        assert(isdefined(priority) && array_contains(level.var_41670c1c65f3d3cf.priorities, priority), "priority_remove: Can only be called on valid priorities, not: " + priority);
    #/
    function_c36f897d56e28169(agent, priority);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x76ae
// Size: 0x96
function private priority_removebydormancyid(var_451a9d27d63c746b) {
    /#
        assert(isdefined(var_451a9d27d63c746b), "priority_removeByDormancyId: Can't be called with no dormancyID");
    #/
    /#
        assert(isdefined(level.var_879053468f168806[var_451a9d27d63c746b]), "priority_removeByDormancyId: no dormancy info package found for ID " + var_451a9d27d63c746b);
    #/
    priority = function_72d6808216b4d44(level.var_879053468f168806[var_451a9d27d63c746b].priority);
    /#
        assert(isdefined(priority) && array_contains(level.var_41670c1c65f3d3cf.priorities, priority), "priority_remove: Can only be called on valid priorities, not: " + priority);
    #/
    function_c36f897d56e28169(var_451a9d27d63c746b, priority);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x774b
// Size: 0x28
function function_2f6e6bb2b1fe3eea(agent) {
    /#
        assert(isdefined(agent), "priority_get: Can't be called on undefined agents");
    #/
    return agentpers_getagentpersdata(agent, "priority");
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x777b
// Size: 0x42
function function_daeb7849456192a9(priority) {
    /#
        assert(isdefined(priority) && array_contains(level.var_41670c1c65f3d3cf.priorities, priority), "priority_getAllWithPriority: Can only be called on valid priorities, not: " + priority);
    #/
    return function_b4b9401715cf98ea(priority);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77c5
// Size: 0x42
function function_44c0059e33f55f00(priority) {
    /#
        assert(isdefined(priority) && array_contains(level.var_41670c1c65f3d3cf.priorities, priority), "priority_getAllWithPriority: Can only be called on valid priorities, not: " + priority);
    #/
    return function_7eb04ca16d045775(priority);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x780f
// Size: 0x42
function function_72ae84d7068be83f(priority) {
    /#
        assert(isdefined(priority) && array_contains(level.var_41670c1c65f3d3cf.priorities, priority), "priority_getAllWithPriority: Can only be called on valid priorities, not: " + priority);
    #/
    return function_5508ddea3a84df39(priority);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7859
// Size: 0x1c4
function function_13fa78dbb16429() {
    /#
        while (1) {
            if (getdvarint(@"hash_9e9be127028294d2", 0) == 1) {
                agents = utility::function_2d7fd59d039fa69b(level.players[0].origin, 3000, 0);
                foreach (agent in agents) {
                    if (isdefined(agent) && isagent(agent) && isalive(agent)) {
                        print3d(agent.origin + (0, 0, 100), "<unknown string>" + agent.poi, (1, 0, 1), 1, 0.4);
                        print3d(agent.origin + (0, 0, 90), "tier3_closet" + function_2f6e6bb2b1fe3eea(agent), (1, 0, 1), 1, 0.4);
                        print3d(agent.origin + (0, 0, 80), "team_hundred_ninety_five" + agent.category, (1, 0, 1), 1, 0.4);
                        print3d(agent.origin + (0, 0, 70), "players" + agent.subcategory, (1, 0, 1), 1, 0.4);
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a24
// Size: 0xd8
function function_80cd0109b7f5161d() {
    level.var_360542b7ea0d5403 = getdvarint(@"hash_2ac28fc028bd24f6", 1);
    if (isdefined(level.poi)) {
        foreach (poi in level.poi) {
            foreach (subarea in poi["subAreas"]) {
                if (!istrue(subarea.var_1673e56336a38d1b)) {
                    function_567f8f8cd379059c(subarea);
                }
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b03
// Size: 0x21
function function_b4367b762ab15e1f() {
    if (isdefined(level.poi)) {
        function_18076fc4f3fbc0d4();
    } else {
        function_271daff60f7d1de3();
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b2b
// Size: 0x17e
function function_591b22e0ca8a8be1(node, var_a784428198c5658b, var_ba8b04eb4b683e67, priority, category, subcategory, poiname, subarea) {
    if (!isdefined(poiname)) {
        poiname = node.poi;
    }
    if (!isdefined(poiname)) {
        node.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(node.origin);
    }
    aitype = function_d5bc07eabf352abb(node, poiname);
    groupname = function_59cdfe39e161a336(node);
    var_f891e067b8802c0d = function_d77aad1a4fff0114(node);
    agent = ai_mp_requestspawnagent(aitype, node.origin, node.angles, priority, category, subcategory, groupname, undefined, undefined, poiname, var_f891e067b8802c0d, undefined, undefined, node.agent_type, undefined, subarea);
    if (isdefined(agent)) {
        if (isagent(agent)) {
            if (istrue(var_a784428198c5658b)) {
                agent thread function_b11c1964f528574b(agent, var_ba8b04eb4b683e67);
            } else if (isdefined(level.var_1c8cbd78af4920d0)) {
                agent thread [[ level.var_1c8cbd78af4920d0 ]](agent);
            } else {
                agent thread function_9bbf1713a14fa580(agent);
            }
        } else if (isint(agent)) {
            if (istrue(var_a784428198c5658b)) {
                function_d1e130608e4f8487(agent, node.origin, var_ba8b04eb4b683e67);
            } else {
                function_e786aa52b93833eb(agent, node.origin);
            }
        }
    }
    return agent;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cb1
// Size: 0x4c0
function function_3dcf83bcef7081ba(pathstruct, var_7ade8fac6578b011, maxagents, var_f28f3885995a439d, priority, category, subcategory) {
    agents = [];
    path = pathstruct.path;
    angles = (0, 0, 0);
    if (isdefined(path[0].angles)) {
        angles = path[0].angles;
    }
    if (isdefined(path[0].var_7ade8fac6578b011)) {
        var_7ade8fac6578b011 = path[0].var_7ade8fac6578b011;
    }
    if (!isdefined(var_7ade8fac6578b011)) {
        var_7ade8fac6578b011 = 1;
    } else {
        var_7ade8fac6578b011 = int(var_7ade8fac6578b011);
    }
    if (isdefined(path[0].maxagents)) {
        maxagents = path[0].maxagents;
    }
    if (!isdefined(maxagents)) {
        maxagents = 1;
    } else {
        maxagents = int(maxagents);
    }
    numagents = var_7ade8fac6578b011;
    if (var_7ade8fac6578b011 < maxagents) {
        numagents = randomintrange(var_7ade8fac6578b011, maxagents);
    }
    var_10ac129919e367b5 = [];
    var_10ac129919e367b5[0] = path[0].var_26242e8921ae5b22;
    var_10ac129919e367b5[1] = path[0].var_26242d8921ae58ef;
    var_10ac129919e367b5[2] = path[0].var_26242c8921ae56bc;
    var_10ac129919e367b5[3] = path[0].var_26242b8921ae5489;
    var_10ac129919e367b5[4] = path[0].var_26242a8921ae5256;
    var_10ac129919e367b5[5] = path[0].var_2624298921ae5023;
    var_f891e067b8802c0d = function_d77aad1a4fff0114(path[0]);
    groupname = undefined;
    if (isdefined(var_f28f3885995a439d)) {
        groupname = var_f28f3885995a439d.name;
    }
    min = 30;
    max = 31;
    for (i = 0; i < numagents; i++) {
        var_fcdc7f62624c71ff = undefined;
        var_1439f86640d42e34 = undefined;
        if (isdefined(var_10ac129919e367b5[i])) {
            if (issubstr(tolower(var_10ac129919e367b5[i]), "spawnset")) {
                var_fcdc7f62624c71ff = getsubstr(var_10ac129919e367b5[i], 9, var_10ac129919e367b5[i].size);
            } else {
                var_1439f86640d42e34 = var_10ac129919e367b5[i];
            }
        } else {
            var_fcdc7f62624c71ff = "spawnset_patrol_primary";
            if (i > 0) {
                var_fcdc7f62624c71ff = "spawnset_patrol_secondary";
            }
        }
        var_e0386cbfbccbbc5b = spawnstruct();
        var_e0386cbfbccbbc5b.agent_type = path[0].agent_type;
        var_e0386cbfbccbbc5b.poi = path[0].poi;
        var_e0386cbfbccbbc5b.var_71ad22c5d093d90b = path[0].var_71ad22c5d093d90b;
        var_e0386cbfbccbbc5b.origin = path[0].origin;
        var_e0386cbfbccbbc5b.nationality = path[0].nationality;
        var_e0386cbfbccbbc5b.script_noteworthy = ter_op(isdefined(var_10ac129919e367b5[i]), var_10ac129919e367b5[i], var_fcdc7f62624c71ff);
        aitype = function_d5bc07eabf352abb(var_e0386cbfbccbbc5b, path[0].poi, var_fcdc7f62624c71ff, var_1439f86640d42e34);
        angles = (angles[0], randomint(360), angles[2]);
        var_bcfec646853a95c1 = randomfloatrange(min, max) * namespace_3c37cb17ade254d::ter_op(cointoss(), 1, -1);
        var_bcfec546853a938e = randomfloatrange(min, max) * namespace_3c37cb17ade254d::ter_op(cointoss(), 1, -1);
        spawnloc = function_61cbc488b27a6e61(path[0].origin + (var_bcfec646853a95c1, var_bcfec546853a938e, 0));
        agent = ai_mp_requestspawnagent(aitype, spawnloc, angles, priority, category, subcategory, groupname, undefined, undefined, path[0].poi, var_f891e067b8802c0d, undefined, undefined, path[0].agent_type);
        if (isdefined(agent)) {
            agents[i] = agent;
        }
    }
    waitframe();
    var_f646efe73aae53dc = 1;
    foreach (agent in agents) {
        if (isint(agent)) {
            var_f646efe73aae53dc = 0;
            break;
        }
    }
    if (var_f646efe73aae53dc) {
        level thread function_25cc93d439c3033a(agents, pathstruct);
    } else {
        foreach (agent in agents) {
            level thread function_25cc93d439c3033a([0:agent], pathstruct);
        }
    }
    return agents;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8179
// Size: 0x32
function function_d77aad1a4fff0114(node) {
    if (isdefined(node.script_label)) {
        return issubstr(node.script_label, "isCQB");
    }
    return 0;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81b3
// Size: 0x349
function function_18076fc4f3fbc0d4() {
    foreach (poiname, poi in level.poi) {
        if (isdefined(poi["subAreas"]) && poi["subAreas"].size > 0) {
            foreach (subarea in poi["subAreas"]) {
                if (!istrue(subarea.var_1673e56336a38d1b)) {
                    function_b2b01599b30cfe2f(subarea);
                }
            }
            continue;
        } else {
            var_fc617751f654a141 = 0;
            if (function_abbd4595d76ccc5e(poiname, "everybody") < level.poi[poiname]["tuning"].var_74fd03286daecf85) {
                var_fc617751f654a141 = int(level.poi[poiname]["tuning"].var_74fd03286daecf85 - function_abbd4595d76ccc5e(poiname, "everybody"));
            } else {
                return;
            }
            var_d8fdd5b8b53e1735 = int(var_fc617751f654a141 / 2);
            level.poi[poiname]["looseGuardNodes"] = array_randomize(level.poi[poiname]["looseGuardNodes"]);
            foreach (spawnloc in level.poi[poiname]["looseGuardNodes"]) {
                if (namespace_9823ee6035594d67::function_2cde636a73aead3d(spawnloc.origin)) {
                    continue;
                }
                var_a784428198c5658b = issubstr(spawnloc.script_noteworthy, "stationary") || istrue(spawnloc.var_a784428198c5658b);
                agent = function_591b22e0ca8a8be1(spawnloc, var_a784428198c5658b, undefined, "low", "extraGuards", undefined, poiname);
                if (isdefined(agent)) {
                    var_d8fdd5b8b53e1735--;
                    var_fc617751f654a141--;
                    if (var_d8fdd5b8b53e1735 == 0) {
                        break;
                    }
                }
            }
            level.poi[poiname]["patrolPaths"] = array_randomize(level.poi[poiname]["patrolPaths"]);
            foreach (pathstruct in level.poi[poiname]["patrolPaths"]) {
                if (istrue(pathstruct.claimed)) {
                    continue;
                } else {
                    pathstruct.claimed = 1;
                    agents = function_3dcf83bcef7081ba(pathstruct, min(var_fc617751f654a141, level.var_33cf4079b4096eb8), min(var_fc617751f654a141, level.var_1bdf3af6b78dc2ca), undefined, "low", "extraPatrols");
                    if (isdefined(agents)) {
                        var_fc617751f654a141 = var_fc617751f654a141 - agents.size;
                    }
                    if (var_fc617751f654a141 <= 0) {
                        break;
                    }
                }
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8503
// Size: 0x30c
function function_b2b01599b30cfe2f(subarea) {
    var_fc617751f654a141 = 0;
    if (subarea.var_3ebb6024e3f220ca.size < subarea.var_7da9883d4168b7f1.var_74fd03286daecf85) {
        var_fc617751f654a141 = int(subarea.var_7da9883d4168b7f1.var_74fd03286daecf85 - subarea.var_3ebb6024e3f220ca.size);
    } else {
        return;
    }
    var_d8fdd5b8b53e1735 = int(var_fc617751f654a141 / 2);
    level.poi[subarea.poi]["looseGuardNodes"] = array_randomize(level.poi[subarea.poi]["looseGuardNodes"]);
    foreach (spawnloc in level.poi[subarea.poi]["looseGuardNodes"]) {
        if (spawnloc.var_71ad22c5d093d90b != subarea.var_71ad22c5d093d90b) {
            continue;
        }
        if (namespace_9823ee6035594d67::function_2cde636a73aead3d(spawnloc.origin)) {
            continue;
        }
        spawnloc.var_1e9d8e53eeec48a = 1;
        var_a784428198c5658b = issubstr(spawnloc.script_noteworthy, "stationary") || istrue(spawnloc.var_a784428198c5658b);
        agent = function_591b22e0ca8a8be1(spawnloc, var_a784428198c5658b, undefined, "low", "extraGuards", undefined, subarea.poi, subarea);
        if (isdefined(agent)) {
            var_d8fdd5b8b53e1735--;
            var_fc617751f654a141--;
            if (var_d8fdd5b8b53e1735 == 0) {
                break;
            }
        }
    }
    level.poi[subarea.poi]["patrolPaths"] = array_randomize(level.poi[subarea.poi]["patrolPaths"]);
    foreach (pathstruct in level.poi[subarea.poi]["patrolPaths"]) {
        if (pathstruct.var_71ad22c5d093d90b != subarea.var_71ad22c5d093d90b) {
            continue;
        }
        if (istrue(pathstruct.claimed)) {
            continue;
        } else {
            pathstruct.claimed = 1;
            pathstruct.var_1e9d8e53eeec48a = 1;
            agents = function_3dcf83bcef7081ba(pathstruct, min(var_fc617751f654a141, level.var_33cf4079b4096eb8), min(var_fc617751f654a141, level.var_1bdf3af6b78dc2ca), undefined, "low", "extraPatrols");
            if (isdefined(agents)) {
                var_fc617751f654a141 = var_fc617751f654a141 - agents.size;
            }
            if (var_fc617751f654a141 <= 0) {
                break;
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8816
// Size: 0x20c
function function_271daff60f7d1de3() {
    if (istrue(level.var_947cc8c185b0ea9c)) {
        foreach (area in level.var_f81cb9ead7b61ac1) {
            if (!istrue(area.var_1673e56336a38d1b)) {
                function_b2b01599b30cfe2f(area);
            }
        }
        return;
    }
    level.looseguardnodes = array_randomize(level.looseguardnodes);
    for (i = 0; i < getdvarint(@"hash_c70617339b76d58b", 15); i++) {
        if (!isdefined(level.looseguardnodes[i])) {
            continue;
        }
        var_a784428198c5658b = issubstr(level.looseguardnodes[i].script_noteworthy, "stationary") || istrue(level.looseguardnodes[i].var_a784428198c5658b);
        function_591b22e0ca8a8be1(level.looseguardnodes[i], var_a784428198c5658b, undefined, "low", "extraGuards");
    }
    var_3b7047dea3e6835c = getdvarint(@"hash_6091d5bb83af8214", 15);
    var_beec4bcf2979ee14 = 0;
    level.patrolpaths = array_randomize(level.patrolpaths);
    foreach (pathstruct in level.patrolpaths) {
        if (istrue(pathstruct.claimed)) {
            continue;
        } else {
            pathstruct.claimed = 1;
            var_beec4bcf2979ee14++;
            function_3dcf83bcef7081ba(pathstruct, level.var_33cf4079b4096eb8, level.var_1bdf3af6b78dc2ca, undefined, "low", "extraPatrols");
            if (var_beec4bcf2979ee14 >= var_3b7047dea3e6835c) {
                return;
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a29
// Size: 0x1b1
function function_a767dbcb4dd41ce(startpoints) {
    if (!istrue(level.var_289df80e1ded586f)) {
        return;
    }
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    waitframe();
    var_a620cb0e6444887f = getdvarint(@"hash_453f9b238f7679a9", 5);
    spawned = 0;
    foreach (startpoint in startpoints) {
        count = 0;
        if (randomint(100) < 25) {
            count = 2;
        } else if (randomint(100) < 50) {
            count = 1;
        }
        if (count > 0) {
            nodes = function_5649cfac1074189a(count, startpoint);
            foreach (node in nodes) {
                if (isdefined(node) && !istrue(node.used) && (!namespace_37f0fb6355a4618a::function_47d356083884f913() || isdefined(node.poi) && namespace_37f0fb6355a4618a::poi_ispoiactive(node.poi))) {
                    node.script_noteworthy = "guard";
                    function_591b22e0ca8a8be1(node, 1, 1, "low", "firstKillFodder");
                    node.used = 1;
                    spawned++;
                }
            }
        }
        if (spawned >= var_a620cb0e6444887f) {
            break;
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8be1
// Size: 0x53
function function_5649cfac1074189a(num, origin) {
    nodes = level.firstkillfoddernodes;
    level.var_62ba049e99d59e0f = origin;
    nodes = array_sort_with_func(nodes, &function_5db95edac4ad7c26);
    level.var_62ba049e99d59e0f = undefined;
    return array_slice(nodes, 0, num);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c3c
// Size: 0x47
function function_5db95edac4ad7c26(node1, node2) {
    return distance(node1.origin, level.var_62ba049e99d59e0f) < distance(node2.origin, level.var_62ba049e99d59e0f);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8c8b
// Size: 0xc0
function function_636fa0ff324b1b2f() {
    var_fc617751f654a141 = getdvarint(@"hash_74a83bb7bcb5e738", 2);
    level.var_612698c6d5ab4c3b = array_randomize(level.var_612698c6d5ab4c3b);
    var_cdf5b236e13a9cae = random([0:"smg", 1:"shotgun", 2:"sniper"]);
    for (i = 0; i < var_fc617751f654a141; i++) {
        if (isdefined(level.var_612698c6d5ab4c3b[i])) {
            agent = function_591b22e0ca8a8be1(level.var_612698c6d5ab4c3b[i], undefined, undefined, "medium", "elites");
            if (isdefined(agent)) {
                function_2c222aa74d0401f4(agent, var_cdf5b236e13a9cae);
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d52
// Size: 0x1c4
function function_a09c0a759d909dc9() {
    level.var_7da9883d4168b7f1 = [];
    if (!isdefined(level.var_9fab40ed3326f8b)) {
        return;
    }
    if (!function_47d356083884f913()) {
        return;
    }
    function_f9382e7642d4762();
    function_559f1c9cc3c11793();
    if (istrue(level.var_7a36d824da6087ef)) {
        level thread function_454dee65b310ed1c();
    }
    foreach (poiname, poi in level.poi) {
        level.poi[poiname]["tuning"] = spawnstruct();
        var_6409d4f5f62f669c = 0;
        var_74fd03286daecf85 = 0;
        var_63e6c2f5f608f74e = 0;
        if (isdefined(level.var_7da9883d4168b7f1[poiname])) {
            foreach (subarea in level.var_7da9883d4168b7f1[poiname]) {
                var_6409d4f5f62f669c = var_6409d4f5f62f669c + subarea.var_6409d4f5f62f669c;
                var_74fd03286daecf85 = var_74fd03286daecf85 + subarea.var_74fd03286daecf85;
                var_63e6c2f5f608f74e = var_63e6c2f5f608f74e + subarea.var_63e6c2f5f608f74e;
            }
        }
        level.poi[poiname]["tuning"].var_6409d4f5f62f669c = var_6409d4f5f62f669c;
        level.poi[poiname]["tuning"].var_74fd03286daecf85 = var_74fd03286daecf85;
        level.poi[poiname]["tuning"].var_63e6c2f5f608f74e = var_63e6c2f5f608f74e;
    }
    level.var_9589c5a19c1a71fc = 1;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f1d
// Size: 0x3d1
function function_f9382e7642d4762() {
    table = level.var_9fab40ed3326f8b;
    numrows = tablelookupgetnumrows(table);
    for (i = 0; i < numrows; i++) {
        poiname = tablelookupbyrow(table, i, 0);
        if (!isdefined(level.var_7da9883d4168b7f1[poiname])) {
            level.var_7da9883d4168b7f1[poiname] = [];
        }
        var_71ad22c5d093d90b = tolower(tablelookupbyrow(table, i, 1));
        if (issubstr(var_71ad22c5d093d90b, "tieroverride") || var_71ad22c5d093d90b == "minVehicleSpawns") {
            continue;
        } else {
            var_5c5663ebc92bf309 = int(tablelookupbyrow(table, i, 2));
            var_2c6bfd0b6a00fda6 = int(tablelookupbyrow(table, i, 3));
            var_165262bff9d18643 = int(tablelookupbyrow(table, i, 4));
            if (!isdefined(level.var_7da9883d4168b7f1[poiname][var_71ad22c5d093d90b])) {
                level.var_7da9883d4168b7f1[poiname][var_71ad22c5d093d90b] = spawnstruct();
            }
            if (namespace_d696adde758cbe79::function_7a7aa3b5455f0412(poiname)) {
                var_fa93bdf94e856f94 = tablelookupbyrow(table, i, 17);
                if (isdefined(var_fa93bdf94e856f94) && var_fa93bdf94e856f94 != "") {
                    var_9110fd7b0154b211 = int(var_fa93bdf94e856f94);
                } else {
                    var_9110fd7b0154b211 = getdvarfloat(@"hash_5ac522852d2666d5", 2);
                }
                var_5c5663ebc92bf309 = int(var_5c5663ebc92bf309 * var_9110fd7b0154b211);
                var_2c6bfd0b6a00fda6 = int(var_2c6bfd0b6a00fda6 * var_9110fd7b0154b211);
                var_165262bff9d18643 = int(var_165262bff9d18643 * var_9110fd7b0154b211);
            }
            level.var_7da9883d4168b7f1[poiname][var_71ad22c5d093d90b].var_6409d4f5f62f669c = var_5c5663ebc92bf309;
            level.var_7da9883d4168b7f1[poiname][var_71ad22c5d093d90b].var_74fd03286daecf85 = var_2c6bfd0b6a00fda6;
            level.var_7da9883d4168b7f1[poiname][var_71ad22c5d093d90b].var_63e6c2f5f608f74e = var_165262bff9d18643;
            var_f1bab2a8fa8fe3f0 = int(tablelookupbyrow(table, i, 7));
            level.var_7da9883d4168b7f1[poiname][var_71ad22c5d093d90b].var_f1bab2a8fa8fe3f0 = var_f1bab2a8fa8fe3f0;
            var_a42c3e0e1b2dc645 = tablelookupbyrow(table, i, 8);
            if (isdefined(var_a42c3e0e1b2dc645) && var_a42c3e0e1b2dc645 != "") {
                level.var_7da9883d4168b7f1[poiname][var_71ad22c5d093d90b].var_a42c3e0e1b2dc645 = var_a42c3e0e1b2dc645;
            }
            var_cab6f6d27832069a = tablelookupbyrow(table, i, 9);
            if (isdefined(var_cab6f6d27832069a) && var_cab6f6d27832069a != "") {
                level.var_7da9883d4168b7f1[poiname][var_71ad22c5d093d90b].var_cab6f6d27832069a = var_cab6f6d27832069a;
            }
            var_1832752381c598da = tablelookupbyrow(table, i, 13);
            if (isdefined(var_1832752381c598da) && var_1832752381c598da != "") {
                level.var_7da9883d4168b7f1[poiname][var_71ad22c5d093d90b].var_1832752381c598da = int(var_1832752381c598da);
            }
            var_fe9d8027d120b1b6 = tablelookupbyrow(table, i, 14);
            if (isdefined(var_fe9d8027d120b1b6) && var_fe9d8027d120b1b6 != "") {
                level.var_7da9883d4168b7f1[poiname][var_71ad22c5d093d90b].var_fe9d8027d120b1b6 = int(var_fe9d8027d120b1b6);
            }
            var_a766d7c366509879 = tablelookupbyrow(table, i, 15);
            if (isdefined(var_a766d7c366509879) && var_a766d7c366509879 != "") {
                level.var_7da9883d4168b7f1[poiname][var_71ad22c5d093d90b].var_a766d7c366509879 = int(var_a766d7c366509879);
            }
            var_a743e9c3662a7857 = tablelookupbyrow(table, i, 16);
            if (isdefined(var_a743e9c3662a7857) && var_a743e9c3662a7857 != "") {
                level.var_7da9883d4168b7f1[poiname][var_71ad22c5d093d90b].var_a743e9c3662a7857 = int(var_a743e9c3662a7857);
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92f5
// Size: 0x12d
function function_559f1c9cc3c11793() {
    table = level.var_9fab40ed3326f8b;
    numrows = tablelookupgetnumrows(table);
    for (i = 0; i < numrows; i++) {
        poiname = tablelookupbyrow(table, i, 0);
        if (poiname == "minVehicleSpawns") {
            continue;
        }
        if (issubstr(poiname, "tieroverride")) {
            if (!isdefined(level.var_28af753def4ab495)) {
                level.var_28af753def4ab495 = [];
            }
            level.var_28af753def4ab495[poiname] = int(tablelookupbyrow(table, i, 5));
        } else {
            if (!isdefined(level.var_7da9883d4168b7f1[poiname])) {
                level.var_7da9883d4168b7f1[poiname] = [];
            }
            var_71ad22c5d093d90b = tolower(tablelookupbyrow(table, i, 1));
            var_3f6d7e79d3ecd73c = int(tablelookupbyrow(table, i, 5));
            if (!isdefined(level.var_7da9883d4168b7f1[poiname][var_71ad22c5d093d90b])) {
                level.var_7da9883d4168b7f1[poiname][var_71ad22c5d093d90b] = spawnstruct();
            }
            level.var_7da9883d4168b7f1[poiname][var_71ad22c5d093d90b].var_84ecaeab58167d39 = var_3f6d7e79d3ecd73c;
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9429
// Size: 0x53
function function_17f07bed46b1496b(subarea) {
    if (isdefined(subarea) && isdefined(subarea.var_7da9883d4168b7f1) && isdefined(subarea.var_7da9883d4168b7f1.var_84ecaeab58167d39)) {
        return subarea.var_7da9883d4168b7f1.var_84ecaeab58167d39;
    }
    return 1;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9484
// Size: 0x2c
function function_9b6306b0cd33bd79(origin) {
    poiname = function_6cc445c02b5effac(origin);
    return function_17f07bed46b1496b(function_a44e168e8cced18(origin, poiname));
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x94b8
// Size: 0x6f
function function_bed4c95709497a6c(origin, subarea, poiname) {
    if (!isdefined(subarea)) {
        if (!isdefined(origin)) {
            return function_f851a2f41cffa860();
        } else {
            subarea = function_a44e168e8cced18(origin, poiname);
        }
    }
    if (isdefined(subarea.var_7da9883d4168b7f1.var_a42c3e0e1b2dc645)) {
        return subarea.var_7da9883d4168b7f1.var_a42c3e0e1b2dc645;
    }
    return function_f851a2f41cffa860();
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x952f
// Size: 0xd7
function function_454dee65b310ed1c() {
    tieroverridevolumes = function_f159c10d5cf8f0b4("tierOverrideVolume", "targetname");
    foreach (volume in tieroverridevolumes) {
        poiname = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(volume.origin, 0, 1);
        if (!isdefined(poiname)) {
            continue;
        }
        if (!isdefined(level.poi[poiname]["tierOverrideVolumes"])) {
            level.poi[poiname]["tierOverrideVolumes"] = [];
        }
        level.poi[poiname]["tierOverrideVolumes"][level.poi[poiname]["tierOverrideVolumes"].size] = volume;
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x960d
// Size: 0xaf
function function_6cda15989d9abae0(origin, poiname) {
    if (!poi_ispoiactive(poiname)) {
        return;
    }
    if (!isdefined(origin)) {
        return;
    }
    if (isdefined(level.poi[poiname]["tierOverrideVolumes"])) {
        foreach (volume in level.poi[poiname]["tierOverrideVolumes"]) {
            if (ispointinvolume(origin, volume)) {
                return level.var_28af753def4ab495[volume.script_label];
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96c3
// Size: 0x78
function function_a44e168e8cced18(origin, poiname) {
    if (function_47d356083884f913()) {
        if (!isdefined(poiname)) {
            poiname = function_6cc445c02b5effac(origin);
        }
        if (isdefined(poiname) && isdefined(level.poi[poiname]) && isdefined(level.poi[poiname]["subAreas"])) {
            subarea = function_d795b532bedd6431(poiname, origin);
            if (isdefined(subarea)) {
                return subarea;
            }
        }
        return function_6a35e8934f78d810(poiname);
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9742
// Size: 0x96
function function_6a35e8934f78d810(poiname) {
    if (function_47d356083884f913()) {
        if (!isdefined(poiname)) {
            return undefined;
        }
        if (isdefined(level.poi[poiname])) {
            foreach (subarea in level.poi[poiname]["subAreas"]) {
                if (subarea.var_71ad22c5d093d90b == "orphan") {
                    return subarea;
                }
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97df
// Size: 0x87
function function_2cb157b29de9dbfa(agent, poiname, destination) {
    origin = agent.origin;
    if (isdefined(destination)) {
        origin = destination;
    }
    subarea = function_a44e168e8cced18(origin, poiname);
    if (isdefined(subarea)) {
        subarea.var_3ebb6024e3f220ca[subarea.var_3ebb6024e3f220ca.size] = agent;
        agent.subarea = subarea;
        agentpers_setagentpersdata(agent, "subArea", subarea);
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x986d
// Size: 0x85
function subarea_findandassignfordormancyid(origin, poiname, destination, var_451a9d27d63c746b) {
    if (!isdefined(level.var_879053468f168806[var_451a9d27d63c746b])) {
        return;
    }
    if (isdefined(destination)) {
        origin = destination;
    }
    subarea = function_a44e168e8cced18(origin, poiname);
    level.var_879053468f168806[var_451a9d27d63c746b].subarea = subarea;
    if (isdefined(subarea)) {
        subarea.var_3ebb6024e3f220ca[subarea.var_3ebb6024e3f220ca.size] = var_451a9d27d63c746b;
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98f9
// Size: 0x32
function subarea_removeagentfrom(agent, subarea) {
    subarea.var_3ebb6024e3f220ca = function_f3d88b5d7353a90(subarea.var_3ebb6024e3f220ca, agent);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9932
// Size: 0x187
function function_f23bac39c13e1651(poiname) {
    if (function_47d356083884f913()) {
        if (!isdefined(poiname)) {
            return;
        }
        foreach (subarea in level.poi[poiname]["subAreas"]) {
            var_cab6f6d27832069a = subarea.var_7da9883d4168b7f1.var_cab6f6d27832069a;
            if (isdefined(var_cab6f6d27832069a)) {
                continue;
            }
            if (!isdefined(subarea.var_5e5915f98ad5b6ea)) {
                subarea.var_7fd57938f9f24446 = int(subarea.var_7da9883d4168b7f1.var_63e6c2f5f608f74e * level.var_6d6312580311c77c);
                subarea.var_5e5915f98ad5b6ea = subarea.var_7fd57938f9f24446;
            }
            if (istrue(subarea.var_b3a410141a91ba67)) {
                if (subarea.shutdowntime + level.var_64e7362f9d520136 < gettime()) {
                    subarea.var_b3a410141a91ba67 = 0;
                    subarea.var_5e5915f98ad5b6ea = subarea.var_25087194b5e05d51 + subarea.var_7fd57938f9f24446;
                }
            } else if (subarea.var_25087194b5e05d51 >= subarea.var_5e5915f98ad5b6ea) {
                subarea.var_b3a410141a91ba67 = 1;
                subarea.shutdowntime = gettime();
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ac0
// Size: 0x125
function function_baffa48bbd15cdc6(subarea, array) {
    var_de1ef71d45ad3463 = [];
    var_e293f8f41792af61 = [];
    foreach (agent in array) {
        var_d6a935a3a4e7c7d1 = undefined;
        if (!isagent(agent)) {
            origin = level.var_879053468f168806[agent].origin;
            poiname = level.var_879053468f168806[agent].poi;
            var_d6a935a3a4e7c7d1 = function_a44e168e8cced18(origin, poiname);
        } else {
            var_d6a935a3a4e7c7d1 = agentpers_getagentpersdata(agent, "subArea");
        }
        if (!isdefined(var_d6a935a3a4e7c7d1)) {
            continue;
        }
        if (isdefined(subarea) && var_d6a935a3a4e7c7d1 == subarea) {
            var_de1ef71d45ad3463[var_de1ef71d45ad3463.size] = agent;
        } else {
            var_e293f8f41792af61[var_e293f8f41792af61.size] = agent;
        }
    }
    newarray = array_combine(var_de1ef71d45ad3463, var_e293f8f41792af61);
    return newarray;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bed
// Size: 0x1b9
function function_567f8f8cd379059c(subarea) {
    subarea.var_d276b08c96430bfc = array_randomize(subarea.var_d276b08c96430bfc);
    foreach (spawnpackage in subarea.var_d276b08c96430bfc) {
        function_376608277aa1067c(spawnpackage, subarea.var_7da9883d4168b7f1.var_84ecaeab58167d39, undefined, "medium", subarea.poi, subarea);
    }
    function_976521b91d6e7e81(subarea);
    function_e0389c76602a47b5(subarea);
    subarea.var_24a2cd19eed8f75d = array_randomize(subarea.var_24a2cd19eed8f75d);
    var_cc08ce7cbe6143ab = 0;
    var_2a51460b1677ab99 = 1;
    var_fd177c6ecc7e47 = subarea.var_7da9883d4168b7f1.var_f1bab2a8fa8fe3f0;
    if (!isdefined(var_fd177c6ecc7e47)) {
        var_fd177c6ecc7e47 = 1;
    }
    while (subarea.var_3ebb6024e3f220ca.size < subarea.var_7da9883d4168b7f1.var_74fd03286daecf85 && var_2a51460b1677ab99) {
        spawnpackage = subarea.var_24a2cd19eed8f75d[var_cc08ce7cbe6143ab];
        if (isdefined(spawnpackage) && !istrue(spawnpackage.spawned)) {
            agents = function_376608277aa1067c(spawnpackage, subarea.var_7da9883d4168b7f1.var_84ecaeab58167d39, undefined, undefined, subarea.poi, subarea);
            if (isdefined(agents) && agents.size > 0) {
                var_cc08ce7cbe6143ab++;
            }
        } else {
            var_2a51460b1677ab99 = 0;
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9dad
// Size: 0x1c4
function function_976521b91d6e7e81(subarea) {
    if (!isdefined(subarea.var_78b67865ef2a33d3)) {
        return;
    }
    var_f198c878f78dd4ab = 0;
    index = 0;
    subarea.var_78b67865ef2a33d3 = array_randomize(subarea.var_78b67865ef2a33d3);
    if (isdefined(subarea.var_7da9883d4168b7f1.var_1832752381c598da)) {
        while (subarea.var_3ebb6024e3f220ca.size < subarea.var_7da9883d4168b7f1.var_74fd03286daecf85 && var_f198c878f78dd4ab < subarea.var_7da9883d4168b7f1.var_1832752381c598da) {
            spawnloc = subarea.var_78b67865ef2a33d3[index];
            if (!isdefined(spawnloc)) {
                return;
            }
            spawnloc.script_noteworthy = "guard_sniper";
            agent = function_591b22e0ca8a8be1(spawnloc, 0, undefined, "medium", "spawnPackage", undefined, subarea.poi, subarea);
            if (isdefined(agent)) {
                var_f198c878f78dd4ab++;
                index++;
            }
        }
    }
    var_f198c878f78dd4ab = 0;
    if (isdefined(subarea.var_7da9883d4168b7f1.var_fe9d8027d120b1b6)) {
        while (subarea.var_3ebb6024e3f220ca.size < subarea.var_7da9883d4168b7f1.var_74fd03286daecf85 && var_f198c878f78dd4ab < subarea.var_7da9883d4168b7f1.var_fe9d8027d120b1b6) {
            spawnloc = subarea.var_78b67865ef2a33d3[index];
            if (!isdefined(spawnloc)) {
                return;
            }
            spawnloc.script_noteworthy = "guard_rpg";
            agent = function_591b22e0ca8a8be1(spawnloc, 0, undefined, "medium", "spawnPackage", undefined, subarea.poi, subarea);
            if (isdefined(agent)) {
                var_f198c878f78dd4ab++;
                index++;
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f78
// Size: 0x160
function function_e0389c76602a47b5(subarea) {
    if (!isdefined(subarea.var_2976480563de74df)) {
        return;
    }
    if (!isdefined(subarea.var_7da9883d4168b7f1.var_a766d7c366509879) || !isdefined(subarea.var_7da9883d4168b7f1.var_a743e9c3662a7857)) {
        return;
    }
    var_3682d28df3caf8b0 = 0;
    index = 0;
    subarea.var_2976480563de74df = array_randomize(subarea.var_2976480563de74df);
    var_66fe80516790f17d = randomintrange(subarea.var_7da9883d4168b7f1.var_a766d7c366509879, subarea.var_7da9883d4168b7f1.var_a743e9c3662a7857 + 1);
    while (subarea.var_3ebb6024e3f220ca.size < subarea.var_7da9883d4168b7f1.var_74fd03286daecf85 && var_3682d28df3caf8b0 < var_66fe80516790f17d) {
        spawnloc = subarea.var_2976480563de74df[index];
        if (!isdefined(spawnloc)) {
            return;
        }
        var_e0c08758eb0006be = function_9edcf99159abb0b(spawnloc);
        if (!isdefined(var_e0c08758eb0006be)) {
            return;
        }
        var_e0c08758eb0006be.claimed = 1;
        agents = function_3dcf83bcef7081ba(var_e0c08758eb0006be, undefined, undefined, undefined, "medium", "spawnPackage");
        if (isdefined(agents)) {
            var_3682d28df3caf8b0++;
            index++;
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0df
// Size: 0x2ca
function function_376608277aa1067c(spawnpackage, var_84ecaeab58167d39, var_9e82f18de5c8c18b, var_81fee161ed3b0ccd, poiname, subarea) {
    if (istrue(spawnpackage.spawned)) {
        return;
    }
    priority = "low";
    if (isdefined(var_81fee161ed3b0ccd)) {
        priority = var_81fee161ed3b0ccd;
    }
    var_d5234f1ae07f781b = 0;
    spawnpackage.spawned = 1;
    var_709ba5ebd730ffae = [];
    foreach (var_7d5acb0650804b86 in spawnpackage.var_2ef873e30a270bcf) {
        if (isdefined(var_9e82f18de5c8c18b) && var_d5234f1ae07f781b >= var_9e82f18de5c8c18b) {
            return var_d5234f1ae07f781b;
        }
        if (!isdefined(var_7d5acb0650804b86.nationality)) {
            var_7d5acb0650804b86.nationality = spawnpackage.nationality;
        }
        var_a784428198c5658b = issubstr(var_7d5acb0650804b86.script_noteworthy, "stationary");
        agent = function_591b22e0ca8a8be1(var_7d5acb0650804b86, var_a784428198c5658b, undefined, priority, "spawnPackage", undefined, poiname, subarea);
        if (isdefined(agent)) {
            var_d5234f1ae07f781b++;
            var_709ba5ebd730ffae[var_709ba5ebd730ffae.size] = agent;
        }
    }
    foreach (pathstruct in spawnpackage.var_d7baafc9b07f5094) {
        if (isdefined(var_9e82f18de5c8c18b) && var_d5234f1ae07f781b >= var_9e82f18de5c8c18b) {
            return var_d5234f1ae07f781b;
        }
        if (isdefined(pathstruct.path) && isdefined(pathstruct.path[0]) && !isdefined(pathstruct.path[0].nationality)) {
            pathstruct.path[0].nationality = spawnpackage.nationality;
        }
        agents = function_3dcf83bcef7081ba(pathstruct, undefined, undefined, undefined, priority, "spawnPackage");
        if (isdefined(agents)) {
            var_d5234f1ae07f781b = var_d5234f1ae07f781b + agents.size;
            var_709ba5ebd730ffae = array_combine(var_709ba5ebd730ffae, agents);
        }
    }
    if (getdvarint(@"hash_5fc378f6fc9470f7", 0)) {
        foreach (var_e66dd9043bfecc9 in spawnpackage.var_6c25fe44ff159d0e) {
            namespace_c50aac14f506294b::function_5fae75af200a8054(var_e66dd9043bfecc9, undefined, undefined, undefined, undefined, 1, undefined, "low");
        }
    }
    return var_709ba5ebd730ffae;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa3b1
// Size: 0x48
function function_96b95ad2d758c110() {
    if (isdefined(level.var_1a2b600a06ec21f4)) {
        if (istrue(level.var_1a2b600a06ec21f4.var_1a33770ee84f49e6)) {
            return 1;
        } else if (istrue(level.var_1a2b600a06ec21f4.var_24831563e72cb3cb)) {
            return 1;
        }
    }
    return 0;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa401
// Size: 0x28f
function processagentspawned(agent, var_80f4bde7090a4773) {
    if (!isdefined(agent)) {
        return;
    }
    function_ea83c1b372e16f6d(agent, var_80f4bde7090a4773);
    if (isint(agent)) {
        function_58aab2edaec2599f(agent, "processSpawnedDormantAgent", &processspawneddormantagent);
        return;
    }
    tier = 1;
    var_f0eff45e6fd10d70 = 1;
    if (issubstr(agent.agent_type, "jugg")) {
        function_e43f4000cac35ba2(agent);
        subtype = undefined;
        if (issubstr(agent.agent_type, "merc")) {
            subtype = "merc";
        }
        agent namespace_1f8384d33bfd1e13::function_1cbb19fc0caeab00(subtype);
        agent setscriptablepartstate("loop_sounds", "music", 0);
        var_f0eff45e6fd10d70 = 0;
    }
    if (getdvar(@"hash_e65e9a96eb2ff62b", "") == "gwtdm" || !isdefined(level.var_1a2b600a06ec21f4) || istrue(level.var_1a2b600a06ec21f4.var_99eef12e9fe7e8f4)) {
        if (issubstr(agent.agent_type, "tier1")) {
            function_dc01679146e5f53c(agent);
        } else if (issubstr(agent.agent_type, "tier2")) {
            function_dc016a9146e5fbd5(agent);
            tier = 2;
        } else if (issubstr(agent.agent_type, "tier3")) {
            function_dc01699146e5f9a2(agent);
            tier = 3;
        }
    } else if (!issubstr(agent.agent_type, "jugg")) {
        function_d0738ca403de13f2(agent);
    }
    if (issubstr(agent.agent_type, "riotshield")) {
        function_c6ebe7215624d5a2(agent);
        var_f0eff45e6fd10d70 = 0;
    }
    if (isdefined(var_80f4bde7090a4773) && tolower(var_80f4bde7090a4773) == "elite") {
        function_1828f1e20e52b418(agent, tier);
    }
    if (istrue(var_f0eff45e6fd10d70)) {
        agent function_8bbcaeb23a1512ef("all", 1);
        agent function_859a90c664dba240(1);
    }
    var_d0bd037164b77387 = strtok(agent.agent_type, "_");
    tok = var_d0bd037164b77387[3];
    if (isdefined(level.var_9f0b40fbeb9cdde2) && array_contains_key(level.var_9f0b40fbeb9cdde2, tok)) {
        var_64c6ced6d550cd33 = level.var_9f0b40fbeb9cdde2[tok];
        agent function_77b8b5af85f319d8(var_64c6ced6d550cd33);
    }
    if (isdefined(level.var_a3941b9965bdd8d2)) {
        [[ level.var_a3941b9965bdd8d2 ]](agent);
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa697
// Size: 0x30
function function_95c315b1e51bd9c5(subarea, delay) {
    if (!isdefined(subarea)) {
        return;
    }
    if (!isdefined(delay)) {
        delay = 0;
    }
    wait(delay);
    subarea.var_25087194b5e05d51++;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6ce
// Size: 0xc
function processspawneddormantagent(agent) {
    
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa6e1
// Size: 0x16
function set_maxsightdistsquared(value) {
    self.maxsightdistsqrd = value;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6fe
// Size: 0x1b7
function function_d0738ca403de13f2(agent) {
    armor = 0;
    agent.var_685390c6753c2cc7 = 1;
    helmet = undefined;
    if (isdefined(agent.subclass)) {
        if (agent.subclass == "tier1") {
            armor = 200;
            agent.var_7cea08b66b2ad878 = 0;
        } else if (agent.subclass == "tier2") {
            armor = 400;
            agent.var_7cea08b66b2ad878 = 0;
            helmet = 1;
        } else if (agent.subclass == "tier3") {
            armor = 600;
            agent.var_7cea08b66b2ad878 = 0;
            helmet = 3;
        }
        if (agent.subclass == "exgm_captain") {
            var_84ecaeab58167d39 = 1;
            if (isdefined(agent.subarea) && isdefined(agent.subarea.var_32c28e2c26896555)) {
                var_84ecaeab58167d39 = agent.subarea.var_7da9883d4168b7f1.var_84ecaeab58167d39;
            }
            switch (var_84ecaeab58167d39) {
            case 3:
                armor = 600;
                agent.var_7cea08b66b2ad878 = 1;
                break;
            case 2:
                armor = 400;
                agent.var_7cea08b66b2ad878 = 1;
                break;
            case 1:
                armor = 200;
                agent.var_7cea08b66b2ad878 = 1;
                break;
            default:
                break;
            }
        }
    }
    agent function_c37c4f9d687074ff(undefined, undefined, undefined, undefined, undefined, armor, helmet);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8bc
// Size: 0x8d0
function function_4799bfbfba0cf995() {
    /#
        setdvar(@"hash_3c77de36070e314c", 0);
        level.var_ba36989c7e24e4ff = getdvarint(@"hash_b0cde04af6f25f1a", 0);
    #/
    level.var_f5f783a9d656258 = spawnstruct();
    level.var_f5f783a9d656258.var_1e7483d4a9c09e57 = [];
    if (getdvarint(@"hash_be15dbb5db51168a", 0)) {
        level.var_f5f783a9d656258.var_1e7483d4a9c09e57[level.var_f5f783a9d656258.var_1e7483d4a9c09e57.size] = "heli";
    }
    if (getdvarint(@"hash_ef18872f775cbf51", 0)) {
        level.var_f5f783a9d656258.var_1e7483d4a9c09e57[level.var_f5f783a9d656258.var_1e7483d4a9c09e57.size] = "ground";
    }
    if (getdvarint(@"hash_af2a5bcfeab0313a", 0)) {
        level.var_f5f783a9d656258.var_1e7483d4a9c09e57[level.var_f5f783a9d656258.var_1e7483d4a9c09e57.size] = "closet";
    }
    if (getdvarint(@"hash_5ba4da9311ec46d", 0)) {
        level.var_f5f783a9d656258.var_1e7483d4a9c09e57[level.var_f5f783a9d656258.var_1e7483d4a9c09e57.size] = "para";
    }
    if (getdvarint(@"hash_e61c7be770ae9de8", 1)) {
        level.var_f5f783a9d656258.var_1e7483d4a9c09e57[level.var_f5f783a9d656258.var_1e7483d4a9c09e57.size] = "elevator";
    }
    level.var_f5f783a9d656258.var_445e0eedd2ec048b = [];
    if (getdvarint(@"hash_a00601dc39bf335d", 0)) {
        level.var_f5f783a9d656258.var_445e0eedd2ec048b[level.var_f5f783a9d656258.var_445e0eedd2ec048b.size] = "sedan";
    }
    if (getdvarint(@"hash_606c2b2d9e94162d", 0)) {
        level.var_f5f783a9d656258.var_445e0eedd2ec048b[level.var_f5f783a9d656258.var_445e0eedd2ec048b.size] = "overland";
    }
    if (getdvarint(@"hash_a116a13b4ae556c2", 0)) {
        level.var_f5f783a9d656258.var_445e0eedd2ec048b[level.var_f5f783a9d656258.var_445e0eedd2ec048b.size] = "cargo";
    }
    if (getdvarint(@"hash_caad3249a4af6b4b", 0)) {
        level.var_f5f783a9d656258.var_445e0eedd2ec048b[level.var_f5f783a9d656258.var_445e0eedd2ec048b.size] = "techo";
    }
    if (getdvarint(@"hash_c6458de3ac612272", 0)) {
        level.var_f5f783a9d656258.var_445e0eedd2ec048b[level.var_f5f783a9d656258.var_445e0eedd2ec048b.size] = "jltv";
    }
    level.var_f5f783a9d656258.var_8f0798696a41da93 = getdvarint(@"hash_6cf658b24a4f657", 5);
    level.var_f5f783a9d656258.var_533cfe7944a02b81 = getdvarint(@"hash_fa2b8ab8386f3df2", 3);
    level.var_f51af0d7efeddf0f = getdvar(@"hash_a8e4f619345dd4f", "none");
    level.var_f5f783a9d656258.var_1432bd2b78dbed76 = [];
    level.var_f5f783a9d656258.var_1432bd2b78dbed76[0] = [0:"tier1_ground", 1:"tier1_closet"];
    level.var_f5f783a9d656258.var_1432bd2b78dbed76["0_chance"] = [0:50, 1:50];
    level.var_f5f783a9d656258.var_1432bd2b78dbed76[1] = [0:"tier1_ground", 1:"tier1_closet"];
    level.var_f5f783a9d656258.var_1432bd2b78dbed76["1_chance"] = [0:50, 1:50];
    level.var_f5f783a9d656258.var_1432bd2b78dbed76[2] = [0:"tier1_ground", 1:"tier2_ground", 2:"tier2_heli", 3:"tier1_closet"];
    level.var_f5f783a9d656258.var_1432bd2b78dbed76["2_chance"] = [0:10, 1:10, 2:15, 3:40];
    level.var_f5f783a9d656258.var_1432bd2b78dbed76[3] = [0:"tier2_ground", 1:"tier2_heli", 2:"tier2_closet"];
    level.var_f5f783a9d656258.var_1432bd2b78dbed76["3_chance"] = [0:33, 1:44, 2:23];
    level.var_f5f783a9d656258.var_1432bd2b78dbed76[4] = [0:"tier3_ground", 1:"tier3_heli", 2:"tier3_para_c130", 3:"tier3_closet"];
    level.var_f5f783a9d656258.var_1432bd2b78dbed76["4_chance"] = [0:10, 1:10, 2:40, 3:25];
    level.var_f5f783a9d656258.var_2170b8bbbf7fb5d1 = [];
    level.var_f5f783a9d656258.var_2170b8bbbf7fb5d1[1] = [0:"tier1_heli", 1:"tier1_ground", 2:"tier1_closet"];
    level.var_f5f783a9d656258.var_2170b8bbbf7fb5d1["1_chance"] = [0:35, 1:55, 2:10];
    level.var_f5f783a9d656258.var_2170b8bbbf7fb5d1[2] = [0:"tier2_ground", 1:"tier2_heli"];
    level.var_f5f783a9d656258.var_2170b8bbbf7fb5d1["2_chance"] = [0:35, 1:65];
    level.var_f5f783a9d656258.var_2170b8bbbf7fb5d1[3] = [0:"tier3_ground", 1:"tier3_heli", 2:"tier3_para_c130"];
    level.var_f5f783a9d656258.var_2170b8bbbf7fb5d1["3_chance"] = [0:40, 1:60, 2:15];
    level.var_f5f783a9d656258.var_5b02052a040e1210 = [];
    level.var_f5f783a9d656258.var_5b02052a040e1210[0] = "tier1_heli";
    level.var_f5f783a9d656258.var_5b02052a040e1210[1] = "tier1_heli";
    level.var_f5f783a9d656258.var_5b02052a040e1210[2] = "tier2_heli";
    level.var_f5f783a9d656258.var_5b02052a040e1210[3] = "tier2_heli";
    level.var_f5f783a9d656258.var_5b02052a040e1210[4] = "tier3_heli";
    level.var_f5f783a9d656258.var_9ff30f8c5842928f = [];
    level.var_f5f783a9d656258.var_9ff30f8c5842928f[1] = "tier1_heli";
    level.var_f5f783a9d656258.var_9ff30f8c5842928f[2] = "tier2_heli";
    level.var_f5f783a9d656258.var_9ff30f8c5842928f[3] = "tier3_heli";
    level.var_f5f783a9d656258.var_87f044eda76ae14a = [];
    level.var_f5f783a9d656258.var_87f044eda76ae14a["tier1"] = [0:"sedan", 1:"overland"];
    level.var_f5f783a9d656258.var_87f044eda76ae14a["tier2"] = [0:"overland", 1:"cargo"];
    level.var_f5f783a9d656258.var_87f044eda76ae14a["tier3"] = [0:"jltv", 1:"techo"];
    level.var_f5f783a9d656258.var_48d4812167fbb628 = [];
    level.var_f5f783a9d656258.var_48d4812167fbb628["veh9_sedan_hatchback_1985"] = [0:"black"];
    level.var_f5f783a9d656258.var_48d4812167fbb628["veh9_overland_2016"] = [0:"black"];
    level.var_f5f783a9d656258.var_48d4812167fbb628["veh9_mil_cargo_truck"] = [0:"black"];
    level.var_f5f783a9d656258.var_48d4812167fbb628["veh9_jltv"] = [0:"shdw"];
    level.var_28ddeb5728c40aa2 = 1048576;
    level.var_2ceafe81d4233d2b = 7000;
    function_edfc4cc2d317c6c1();
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb193
// Size: 0x2a7
function function_edfc4cc2d317c6c1() {
    if (level.var_f5f783a9d656258.var_1e7483d4a9c09e57.size == 0) {
        return;
    }
    foreach (starlevel, var_794c60ca9377a38d in level.var_f5f783a9d656258.var_1432bd2b78dbed76) {
        var_34d5caa5c1ff84ce = [];
        var_7033eacc35da81a7 = [];
        if (!isint(starlevel)) {
            continue;
        }
        foreach (index, optiontype in var_794c60ca9377a38d) {
            tokens = strtok(optiontype, "_");
            if (!array_contains(level.var_f5f783a9d656258.var_1e7483d4a9c09e57, tokens[1])) {
                var_34d5caa5c1ff84ce[var_34d5caa5c1ff84ce.size] = optiontype;
                var_7033eacc35da81a7[var_7033eacc35da81a7.size] = level.var_f5f783a9d656258.var_1432bd2b78dbed76[starlevel + "_chance"][index];
            }
        }
        level.var_f5f783a9d656258.var_1432bd2b78dbed76[starlevel] = var_34d5caa5c1ff84ce;
        level.var_f5f783a9d656258.var_1432bd2b78dbed76[starlevel + "_chance"] = var_7033eacc35da81a7;
    }
    foreach (var_b8559ece1d5b1862, var_ab614b4f9329340c in level.var_f5f783a9d656258.var_2170b8bbbf7fb5d1) {
        var_34d5caa5c1ff84ce = [];
        var_7033eacc35da81a7 = [];
        if (!isint(var_b8559ece1d5b1862)) {
            continue;
        }
        foreach (index, optiontype in var_ab614b4f9329340c) {
            tokens = strtok(optiontype, "_");
            if (!array_contains(level.var_f5f783a9d656258.var_1e7483d4a9c09e57, tokens[1])) {
                var_34d5caa5c1ff84ce[var_34d5caa5c1ff84ce.size] = optiontype;
                var_7033eacc35da81a7[var_7033eacc35da81a7.size] = level.var_f5f783a9d656258.var_2170b8bbbf7fb5d1[var_b8559ece1d5b1862 + "_chance"][index];
            }
        }
        level.var_f5f783a9d656258.var_2170b8bbbf7fb5d1[var_b8559ece1d5b1862] = var_34d5caa5c1ff84ce;
        level.var_f5f783a9d656258.var_2170b8bbbf7fb5d1[var_b8559ece1d5b1862 + "_chance"] = var_7033eacc35da81a7;
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb441
// Size: 0x4fc
function function_77acc10c4823dd8a(numagents, var_c5e7fce963586ec0, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, var_83c3368707c68e6, goalradius, var_21f24aecb313e479, var_ec862c2c00c7ab5d, nationality) {
    if (!istrue(level.var_289df80e1ded586f)) {
        return;
    }
    if (isdefined(level.radiation) && istrue(level.radiation.var_9badbb469626f6)) {
        return;
    }
    /#
        assert(namespace_4b0406965e556711::gameflagexists("prematch_done") && namespace_4b0406965e556711::gameflag("prematch_done"), "reinforce_requestReinforcements: requesting reinforcements before the prematch is done. Please simply spawn these agents directly.");
    #/
    agents = [];
    if (!isdefined(team)) {
        if (isdefined(level.var_4b195d3dd0024b9c)) {
            team = level.var_4b195d3dd0024b9c;
        } else {
            team = "team_hundred_ninety_five";
        }
    }
    if (!isdefined(var_83c3368707c68e6)) {
        var_83c3368707c68e6 = "Unknown";
    }
    var_f5f783a9d656258 = undefined;
    var_206197e10a7a9e87 = undefined;
    fallback = undefined;
    if (isdefined(var_ec862c2c00c7ab5d)) {
        numagents = var_ec862c2c00c7ab5d.numagents;
        var_83c3368707c68e6 = var_ec862c2c00c7ab5d.var_83c3368707c68e6;
        var_f5f783a9d656258 = [0:var_ec862c2c00c7ab5d.var_83c3368707c68e6];
        var_206197e10a7a9e87 = [0:100];
    } else if (var_83c3368707c68e6 == "Unknown") {
        var_6b9806915982d089 = undefined;
        if (function_47d356083884f913()) {
            if (!isdefined(poiname)) {
                poiname = function_6cc445c02b5effac(var_c5e7fce963586ec0);
            }
            subarea = function_a44e168e8cced18(var_c5e7fce963586ec0, poiname);
            if (isdefined(subarea)) {
                var_6b9806915982d089 = subarea.var_7da9883d4168b7f1.var_84ecaeab58167d39;
            }
        }
        if (isdefined(nationality) && nationality == "merc" && issubstr(level.mapname, "saba")) {
            var_f5f783a9d656258 = [0:"tier1_heli", 1:"tier2_heli", 2:"tier3_heli", 3:"tier3_para_c130", 4:"tier3_closet"];
            var_206197e10a7a9e87 = [0:15, 1:45, 2:25, 3:15, 4:5];
            fallback = "tier1_heli_lbravo";
        } else {
            starlevel = function_5cc0c507e92f7b47(poiname);
            var_f5f783a9d656258 = level.var_f5f783a9d656258.var_1432bd2b78dbed76[starlevel];
            var_206197e10a7a9e87 = level.var_f5f783a9d656258.var_1432bd2b78dbed76[starlevel + "_chance"];
            fallback = level.var_f5f783a9d656258.var_5b02052a040e1210[starlevel];
            if (isdefined(var_6b9806915982d089) && var_6b9806915982d089 > starlevel) {
                var_f5f783a9d656258 = level.var_f5f783a9d656258.var_2170b8bbbf7fb5d1[var_6b9806915982d089];
                var_206197e10a7a9e87 = level.var_f5f783a9d656258.var_2170b8bbbf7fb5d1[var_6b9806915982d089 + "_chance"];
                fallback = level.var_f5f783a9d656258.var_9ff30f8c5842928f[var_6b9806915982d089];
            }
            if (namespace_d696adde758cbe79::function_7a7aa3b5455f0412(poiname)) {
                var_f5f783a9d656258[var_f5f783a9d656258.size] = "tier3_para_c130";
                var_206197e10a7a9e87[var_206197e10a7a9e87.size] = 60;
            }
        }
    }
    if (var_83c3368707c68e6 != "Unknown") {
        agents = function_2f3b04fc531b4115(numagents, var_c5e7fce963586ec0, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, var_83c3368707c68e6, goalradius, var_21f24aecb313e479, var_ec862c2c00c7ab5d, nationality);
    } else {
        while (var_f5f783a9d656258.size > 0 && (!isdefined(agents) || agents.size == 0)) {
            index = function_9b23664358b0ecc2(var_f5f783a9d656258, var_206197e10a7a9e87);
            var_83c3368707c68e6 = var_f5f783a9d656258[index];
            if (!isdefined(var_ec862c2c00c7ab5d)) {
                tier = int(getsubstr(var_83c3368707c68e6, 4, 5));
                var_ec862c2c00c7ab5d = function_ab14d6652e44fda0(numagents, undefined, tier, level.var_c0e1de2e14e458bf);
            }
            agents = function_2f3b04fc531b4115(numagents, var_c5e7fce963586ec0, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, var_83c3368707c68e6, goalradius, var_21f24aecb313e479, var_ec862c2c00c7ab5d, nationality);
            if (!isdefined(agents) || agents.size == 0) {
                var_f5f783a9d656258 = array_remove_index(var_f5f783a9d656258, index);
                var_206197e10a7a9e87 = array_remove_index(var_206197e10a7a9e87, index);
                if (var_f5f783a9d656258.size == 0 && isdefined(fallback)) {
                    if (istrue(level.var_ba36989c7e24e4ff)) {
                        /#
                            println("<unknown string>" + poiname + "<unknown string>");
                        #/
                    }
                    var_f5f783a9d656258 = [0:fallback];
                    var_206197e10a7a9e87 = [0:100];
                    fallback = undefined;
                }
            } else {
                break;
            }
        }
    }
    if (isdefined(agents) && isarray(agents) && agents.size > 0) {
        if (function_47d356083884f913() && !isdefined(poiname) && isdefined(agents[0].poi)) {
            poiname = agents[0].poi;
        }
        function_96b7b6431450dfc0(agents.size, poiname);
        if (isdefined(level.var_d1a95e3c3d6ea9fc)) {
            level thread function_346caf10322931c8(poiname, var_c5e7fce963586ec0);
        }
    }
    if (isdefined(agents) && isdefined(agents[0]) && isai(agents[0])) {
        agents[0].var_83c3368707c68e6 = var_83c3368707c68e6;
    }
    return agents;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb945
// Size: 0x563
function function_2f3b04fc531b4115(numagents, var_c5e7fce963586ec0, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, var_83c3368707c68e6, goalradius, var_21f24aecb313e479, var_ec862c2c00c7ab5d, nationality) {
    agents = undefined;
    vehicle = undefined;
    if (isdefined(nationality)) {
        team = namespace_14d36171baccf528::function_30a0d7ca3fae40cc(nationality);
    }
    if (issubstr(var_83c3368707c68e6, "closet") || var_83c3368707c68e6 == "Monster Closet") {
        agents = function_9ea6eddb437eaca5(numagents, var_c5e7fce963586ec0, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, undefined, undefined, undefined, nationality);
    } else if ((issubstr(var_83c3368707c68e6, "ground") || var_83c3368707c68e6 == "Ground Vehicle") && istrue(level.var_ce783fc59ea392d1)) {
        if (!istrue(level.var_f5f783a9d656258.var_a0aa36163157d746)) {
            level.var_f5f783a9d656258.var_a0aa36163157d746 = 1;
            foreach (index, tier in level.var_f5f783a9d656258.var_87f044eda76ae14a) {
                level.var_f5f783a9d656258.var_87f044eda76ae14a[index] = array_remove_array(tier, level.var_f5f783a9d656258.var_445e0eedd2ec048b);
            }
        }
        if (isdefined(level.var_f51af0d7efeddf0f) && level.var_f51af0d7efeddf0f != "none") {
            vehicleoverride = level.var_f51af0d7efeddf0f;
        } else {
            var_420415ffda562173 = getsubstr(var_83c3368707c68e6, 0, 5);
            if (!isdefined(level.var_f5f783a9d656258.var_87f044eda76ae14a[var_420415ffda562173])) {
                if (isdefined(var_ec862c2c00c7ab5d) && isdefined(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[0]) && isdefined(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[0].tier)) {
                    var_420415ffda562173 = "tier" + var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[0].tier;
                } else {
                    var_420415ffda562173 = "tier" + function_8af522ada68b6477(undefined, poiname, var_c5e7fce963586ec0);
                }
            }
            vehicleoverride = random(level.var_f5f783a9d656258.var_87f044eda76ae14a[var_420415ffda562173]);
        }
        var_ec95d227d54f8c70 = namespace_43bf74a2ee9234c0::function_a5b0665e0a814be6(numagents, var_ec862c2c00c7ab5d, var_c5e7fce963586ec0, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, nationality, vehicleoverride);
        agents = var_ec95d227d54f8c70[1];
        vehicle = var_ec95d227d54f8c70[0];
    } else if ((issubstr(var_83c3368707c68e6, "heli") || var_83c3368707c68e6 == "Helicopter") && istrue(level.var_425df8e23aaef18c)) {
        agents = namespace_7ae25d9e5d5a28ef::function_3779deb97b61a65(numagents, var_c5e7fce963586ec0, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, goalradius, var_21f24aecb313e479, var_ec862c2c00c7ab5d, undefined, undefined, nationality, undefined);
    } else if ((issubstr(var_83c3368707c68e6, "para") || var_83c3368707c68e6 == "Paratroopers") && isdefined(level.parareinforcestruct)) {
        var_7ade8fac6578b011 = level.var_f5f783a9d656258.var_8f0798696a41da93;
        if (namespace_d696adde758cbe79::function_7a7aa3b5455f0412(poiname)) {
            var_7ade8fac6578b011 = level.var_f5f783a9d656258.var_533cfe7944a02b81;
        }
        if (numagents >= var_7ade8fac6578b011) {
            agents = namespace_885300a47c2b51e6::function_55ab9c6da96226e7(numagents, var_c5e7fce963586ec0, 10000, var_ec862c2c00c7ab5d, priority, category, subcategory, team, var_93390a6953905fef, poiname, undefined, undefined, undefined, undefined, undefined, undefined, nationality);
        }
    } else if ((issubstr(var_83c3368707c68e6, "elevator") || var_83c3368707c68e6 == "Elevator") && (istrue(level.var_b212a36bec6cf8da) || isdefined(level.var_265fd51ba245adfd))) {
        agents = namespace_ab6776a0c2e19905::function_892161ab9ad430e3(numagents, var_ec862c2c00c7ab5d, var_c5e7fce963586ec0, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, undefined, undefined, undefined, nationality);
    }
    /#
        if (getdvarint(@"hash_3c77de36070e314c", 0) == 1) {
            if (isdefined(agents) && isdefined(agents[0]) && isalive(agents[0])) {
                startorigin = agents[0].origin;
                if (isdefined(vehicle)) {
                    startorigin = vehicle.origin;
                    level thread function_e060fb3d7177aea7(vehicle, 30);
                } else if (isdefined(agents[0].vehicle)) {
                    startorigin = agents[0].vehicle.origin;
                    level thread function_e060fb3d7177aea7(agents[0].vehicle, 30);
                }
                level thread namespace_d028276791d9cff6::drawsphere(startorigin, 128, 30, (0, 1, 0));
                level thread namespace_f2ffc0540883e1ad::drawline(startorigin, var_c5e7fce963586ec0, 30, (1, 1, 1));
            }
            level thread namespace_d028276791d9cff6::drawsphere(var_c5e7fce963586ec0, 128, 30, (1, 0, 0));
        }
    #/
    data = spawnstruct();
    data.agents = agents;
    data.poi = poiname;
    data.origin = var_c5e7fce963586ec0;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_dmz_on_reinforce", data);
    return agents;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbeb0
// Size: 0xe0
function function_9b23664358b0ecc2(var_f5f783a9d656258, var_206197e10a7a9e87) {
    var_eb6f2e9e793e992e = 0;
    foreach (var_4cd66e97d14ec4f7 in var_206197e10a7a9e87) {
        var_eb6f2e9e793e992e = var_eb6f2e9e793e992e + var_4cd66e97d14ec4f7;
    }
    roll = randomint(var_eb6f2e9e793e992e);
    var_6d85ffdcb29db6ef = 0;
    foreach (index, var_83c3368707c68e6 in var_f5f783a9d656258) {
        var_6d85ffdcb29db6ef = var_6d85ffdcb29db6ef + var_206197e10a7a9e87[index];
        if (roll < var_6d85ffdcb29db6ef) {
            return index;
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf97
// Size: 0x27a
function function_9ea6eddb437eaca5(numagents, var_c5e7fce963586ec0, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, var_180734f7c2a9866f, var_f03b10101d704759, var_fb59c1ab2600d2f6, nationality, var_15383a2c0ba96765) {
    if (isdefined(level.radiation) && istrue(level.radiation.var_9badbb469626f6)) {
        return;
    }
    var_c5e7fce963586ec0 = namespace_2000a83505151e5b::function_d378cc95abab583b(var_c5e7fce963586ec0, poiname);
    var_c5e7fce963586ec0 = function_61cbc488b27a6e61(var_c5e7fce963586ec0);
    if (!isdefined(poiname)) {
        poiname = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(var_c5e7fce963586ec0);
    }
    fortress = function_9c5a68ca1385322e(var_c5e7fce963586ec0, poiname, var_180734f7c2a9866f, var_f03b10101d704759, undefined, var_15383a2c0ba96765);
    if (!isdefined(fortress) || !isdefined(fortress.var_52914617670842a1)) {
        return undefined;
    }
    var_b586c70b173dd02b = fortress.var_52914617670842a1;
    agents = [];
    starlevel = function_5cc0c507e92f7b47(poiname);
    var_fcdc7f62624c71ff = "guard";
    foreach (loc in var_b586c70b173dd02b) {
        loc.script_noteworthy = undefined;
        tier = function_aa34a142b7664dd1(function_5cc0c507e92f7b47(poiname));
        if (tier != 1 && tier != 2 && tier != 3) {
            tier = 1;
        }
        aitype = function_d5bc07eabf352abb(loc, undefined, var_fcdc7f62624c71ff, undefined, tier, nationality);
        agents[agents.size] = ai_mp_requestspawnagent(aitype, loc.origin, loc.angles, "medium", "reinforcements", "closetSpawn", "closetSpawn", team, undefined, poiname);
        if (agents.size >= numagents) {
            break;
        }
    }
    foreach (agent in agents) {
        agent thread function_a5117518725da028(agent, var_c5e7fce963586ec0, var_fb59c1ab2600d2f6, undefined, undefined, 0);
    }
    return agents;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc219
// Size: 0x3a7
function function_9c5a68ca1385322e(origin, poiname, var_5477815d6f43aecf, maxdistfromorigin, var_b1a6a85296574c99, var_15383a2c0ba96765) {
    if (!isdefined(level.var_f1073fbd45b59a06)) {
        return;
    }
    if (!isdefined(level.var_f1073fbd45b59a06.var_7b0fe1ac52dd48e3)) {
        level.var_f1073fbd45b59a06.var_7b0fe1ac52dd48e3 = (getdvarint(@"hash_5f174bbb593ef9f4", 60) + getdvarint(@"hash_623de28f7e6a71a2", 10)) * 1000;
    }
    if (!isdefined(origin)) {
        return;
    }
    if (!isdefined(poiname)) {
        poiname = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(origin);
    }
    if (!isdefined(level.poi) || !isdefined(level.poi[poiname]) || !isdefined(level.poi[poiname]["players"]) || !isdefined(level.poi[poiname]["players"].size)) {
        return;
    }
    if (!isdefined(var_5477815d6f43aecf)) {
        var_5477815d6f43aecf = 2359296;
    } else {
        var_5477815d6f43aecf = var_5477815d6f43aecf * var_5477815d6f43aecf;
    }
    if (!isdefined(maxdistfromorigin)) {
        maxdistfromorigin = 21233664;
    } else {
        maxdistfromorigin = maxdistfromorigin * maxdistfromorigin;
    }
    if (!isdefined(var_b1a6a85296574c99)) {
        var_b1a6a85296574c99 = 1048576;
    } else {
        var_b1a6a85296574c99 = var_b1a6a85296574c99 * var_b1a6a85296574c99;
    }
    var_ce5b743e3b2dd235 = [];
    if (!istrue(var_15383a2c0ba96765)) {
        foreach (fortress in level.var_f1073fbd45b59a06.var_1d7353058ea3a9f1) {
            if (!isdefined(fortress.poi)) {
                fortress.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(fortress.origin);
            }
            if (fortress.poi == poiname) {
                var_ce5b743e3b2dd235[var_ce5b743e3b2dd235.size] = fortress;
            }
        }
    } else {
        var_ce5b743e3b2dd235 = level.var_f1073fbd45b59a06.var_1d7353058ea3a9f1;
    }
    if (var_ce5b743e3b2dd235.size == 0) {
        return undefined;
    }
    var_ce5b743e3b2dd235 = sortbydistance(var_ce5b743e3b2dd235, origin);
    foreach (fortress in var_ce5b743e3b2dd235) {
        var_32363473b223123a = 0;
        if (level.poi[poiname]["players"].size == 0) {
            var_ce5b743e3b2dd235[0].var_842600f7224e9a7a = gettime() + level.var_f1073fbd45b59a06.var_7b0fe1ac52dd48e3;
            return var_ce5b743e3b2dd235[0];
        }
        if (function_fd909d6b5cd7d4d7(fortress)) {
            continue;
        }
        var_8c17b4ef1cf1b7e4 = distance2dsquared(origin, fortress.origin);
        if (var_8c17b4ef1cf1b7e4 < var_b1a6a85296574c99) {
            continue;
        } else if (var_8c17b4ef1cf1b7e4 > maxdistfromorigin) {
            break;
        } else {
            foreach (player in level.poi[poiname]["players"]) {
                var_2e6dbad7fb1fe43b = distance2dsquared(player.origin, fortress.origin);
                if (var_2e6dbad7fb1fe43b < var_5477815d6f43aecf) {
                    var_32363473b223123a = 1;
                } else if (var_32363473b223123a) {
                    break;
                }
            }
        }
        if (!var_32363473b223123a) {
            fortress.var_842600f7224e9a7a = gettime() + level.var_f1073fbd45b59a06.var_7b0fe1ac52dd48e3;
            return fortress;
        }
    }
    return undefined;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5c8
// Size: 0x35
function function_fd909d6b5cd7d4d7(fortress) {
    if (!isdefined(fortress.var_842600f7224e9a7a)) {
        return 0;
    }
    if (fortress.var_842600f7224e9a7a < gettime()) {
        return 0;
    }
    return 1;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc605
// Size: 0xf8
function function_51014d65a15cf0f9() {
    if (getdvarint(@"hash_c121e4a8e6b78c34", 0) == 1) {
        return;
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    level.var_d1a95e3c3d6ea9fc = getdvarint(@"hash_3d859bf85679053c", 200) * 1000;
    level.var_e5fd74b71bdf51fa = [];
    level.var_1171d24dd4142369 = [];
    level.var_64e7362f9d520136 = getdvarint(@"hash_599c5453cd5cd717", 180) * 1000;
    level.var_6d6312580311c77c = getdvarfloat(@"hash_90240383479ef5f3", 1);
    if (function_47d356083884f913()) {
        foreach (poiname, poi in level.poi) {
            level thread function_eaa1254a3231f38e(poiname);
        }
    } else {
        level thread function_30ef4d9086400a2d();
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc704
// Size: 0x205
function function_eaa1254a3231f38e(poiname) {
    if (istrue(namespace_d696adde758cbe79::function_7a7aa3b5455f0412(poiname))) {
        level.var_41670c1c65f3d3cf.poi[poiname].var_5da316fb1c149f28 = 3;
        level.var_41670c1c65f3d3cf.poi[poiname].var_d6ef83d5d956aff0 = 15;
    } else {
        level.var_41670c1c65f3d3cf.poi[poiname].var_5da316fb1c149f28 = getdvarint(@"hash_69535aa7c07dd140", 5);
    }
    level.var_41670c1c65f3d3cf.poi[poiname].var_51baa9a0e1d139d1 = [];
    level.var_41670c1c65f3d3cf.poi[poiname].var_5531002f0448bfaf = [];
    level.var_41670c1c65f3d3cf.poi[poiname].var_3e25b99d959168b9 = [];
    level.var_41670c1c65f3d3cf.poi[poiname].var_8bcd79921ba8147e = 0;
    level.var_41670c1c65f3d3cf.poi[poiname].var_9d2f71782a11c15c = 0;
    if (getdvarint(@"hash_8ec821e080a0b50d", 1) == 1) {
        level.var_e5fd74b71bdf51fa[poiname] = gettime();
        level.var_1171d24dd4142369[poiname] = 0;
    }
    level.var_41670c1c65f3d3cf.poi[poiname].var_a87122636ff072d3 = "Initalizing";
    level thread function_e358232a03764c9b(poiname);
    if (istrue(namespace_d696adde758cbe79::function_7a7aa3b5455f0412(poiname))) {
        var_2acd3064a749d3bd = 1;
    } else {
        var_2acd3064a749d3bd = getdvarint(@"hash_3bb3561ddb301247", 180) + randomintrange(0, 7);
    }
    level.var_41670c1c65f3d3cf.poi[poiname].var_a87122636ff072d3 = "Waiting for Initial Delay of " + var_2acd3064a749d3bd + " seconds.";
    wait(var_2acd3064a749d3bd);
    level thread function_4bcc15a45628da41(poiname);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc910
// Size: 0x2a4
function function_e358232a03764c9b(poiname) {
    level endon("game_ended");
    level endon("dmz_radiation_started");
    var_d2ca218ea05fa7cc = getdvarint(@"hash_5f174bbb593ef9f4", 60);
    var_8e1193fcb0683b6 = level.var_41670c1c65f3d3cf.poi[poiname].var_25087194b5e05d51;
    var_205e40ade16daabf = level.var_41670c1c65f3d3cf.poi[poiname].var_5da316fb1c149f28;
    level.var_41670c1c65f3d3cf.poi[poiname].var_8bcd79921ba8147e = var_8e1193fcb0683b6 + var_205e40ade16daabf;
    var_745537a1e27d4e8 = 0;
    while (1) {
        if (level.var_41670c1c65f3d3cf.poi[poiname].var_25087194b5e05d51 >= level.var_41670c1c65f3d3cf.poi[poiname].var_8bcd79921ba8147e) {
            var_ccfbfa89358d9c83 = 2;
            if (namespace_d696adde758cbe79::function_7a7aa3b5455f0412(poiname)) {
                var_ccfbfa89358d9c83 = 1;
            }
            increment = level.var_41670c1c65f3d3cf.poi[poiname].var_5da316fb1c149f28 + randomintrange(var_ccfbfa89358d9c83 * -1, var_ccfbfa89358d9c83);
            level.var_41670c1c65f3d3cf.poi[poiname].var_8bcd79921ba8147e = level.var_41670c1c65f3d3cf.poi[poiname].var_8bcd79921ba8147e + increment;
            level.var_41670c1c65f3d3cf.poi[poiname].var_51baa9a0e1d139d1[level.var_41670c1c65f3d3cf.poi[poiname].var_51baa9a0e1d139d1.size] = increment;
        }
        if (!namespace_d696adde758cbe79::function_7a7aa3b5455f0412(poiname) && level.var_41670c1c65f3d3cf.poi[poiname].var_25087194b5e05d51 > 0 && level.var_41670c1c65f3d3cf.poi[poiname].var_25087194b5e05d51 != var_745537a1e27d4e8 && level.var_41670c1c65f3d3cf.poi[poiname].var_25087194b5e05d51 % level.var_8a7245a12448052f == 0) {
            var_745537a1e27d4e8 = level.var_41670c1c65f3d3cf.poi[poiname].var_25087194b5e05d51;
            function_374ecacad63bb411(level.var_a3a884994e83cdba, poiname, "Full POI Pause");
        }
        wait(1);
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbbb
// Size: 0x5a6
function function_4bcc15a45628da41(poiname) {
    level endon("game_ended");
    level endon("dmz_radiation_started");
    var_d2ca218ea05fa7cc = getdvarint(@"hash_5f174bbb593ef9f4", 60);
    var_214efd966bf0021d = getdvarint(@"hash_623de28f7e6a71a2", 10);
    while (1) {
        if (level.var_41670c1c65f3d3cf.poi[poiname].var_51baa9a0e1d139d1.size > 0) {
            if (poiname != "saba_S5Reveal" && !istrue(namespace_d696adde758cbe79::function_7a7aa3b5455f0412(poiname))) {
                function_f23bac39c13e1651(poiname);
            }
            var_ec9ee327d559d081 = function_8d4c6890cbea3d1(poiname);
            subarea = var_ec9ee327d559d081[1];
            var_c5e7fce963586ec0 = var_ec9ee327d559d081[0];
            if (isdefined(var_c5e7fce963586ec0)) {
                var_ad55d9b021f40be1 = level.var_41670c1c65f3d3cf.poi[poiname].var_51baa9a0e1d139d1[0];
                level.var_41670c1c65f3d3cf.poi[poiname].var_a87122636ff072d3 = "Queue Activated. Reinforcements requested.";
                if (istrue(namespace_d696adde758cbe79::function_7a7aa3b5455f0412(poiname) && isdefined(level.var_c129fa020d92b91))) {
                    var_ed62176958dae2ec = [];
                    foreach (id in level.var_c129fa020d92b91) {
                        var_ed62176958dae2ec[id] = 0;
                    }
                    foreach (agent in function_7e3f22e620f3f71e(poiname, "everybody")) {
                        if (isagent(agent)) {
                            foreach (id in level.var_c129fa020d92b91) {
                                if (issubstr(agent.agent_type, "_" + id)) {
                                    var_ed62176958dae2ec[id]++;
                                }
                            }
                        } else if (isint(agent)) {
                            var_824705fcb077e8d6 = function_2b0e82156fa6075b(agent);
                            foreach (id in level.var_c129fa020d92b91) {
                                if (issubstr(var_824705fcb077e8d6.aitype, "_" + id)) {
                                    var_ed62176958dae2ec[id]++;
                                }
                            }
                        }
                    }
                    nationality = undefined;
                    foreach (id, count in var_ed62176958dae2ec) {
                        if (!isdefined(nationality)) {
                            nationality = id;
                        }
                        if (count < var_ed62176958dae2ec[nationality]) {
                            nationality = id;
                        }
                    }
                } else {
                    nationality = subarea.var_7da9883d4168b7f1.var_a42c3e0e1b2dc645;
                    if (!isdefined(nationality)) {
                        nationality = level.var_75041b516b3785c6;
                    }
                }
                if (istrue(level.var_ba36989c7e24e4ff)) {
                    /#
                        println("<unknown string>" + poiname + "<unknown string>" + gettime());
                    #/
                }
                var_83c3368707c68e6 = function_f3bb4f4911a1beb2("determineReinforceType", poiname);
                var_c5e7fce963586ec0 = function_53c4c53197386572(function_f3bb4f4911a1beb2("determineReinforceOrigin", poiname, var_83c3368707c68e6), var_c5e7fce963586ec0);
                agents = function_77acc10c4823dd8a(var_ad55d9b021f40be1, var_c5e7fce963586ec0, "medium", "reinforcements", undefined, undefined, undefined, undefined, poiname, var_83c3368707c68e6, undefined, undefined, undefined, nationality);
                if (isdefined(agents) && agents.size > 0) {
                    level.var_41670c1c65f3d3cf.poi[poiname].var_51baa9a0e1d139d1 = array_remove_index(level.var_41670c1c65f3d3cf.poi[poiname].var_51baa9a0e1d139d1, 0);
                    if (isdefined(level.var_41670c1c65f3d3cf.poi[poiname].var_d6ef83d5d956aff0)) {
                        delaytime = level.var_41670c1c65f3d3cf.poi[poiname].var_d6ef83d5d956aff0;
                    } else {
                        delaytime = var_d2ca218ea05fa7cc + randomfloatrange(var_214efd966bf0021d * -1, var_214efd966bf0021d);
                    }
                    if (istrue(level.var_ba36989c7e24e4ff)) {
                        /#
                            println("<unknown string>" + poiname + "<unknown string>" + delaytime);
                        #/
                    }
                    function_374ecacad63bb411(delaytime, poiname, "Success");
                } else {
                    if (istrue(level.var_ba36989c7e24e4ff)) {
                        /#
                            println("<unknown string>" + poiname + "<unknown string>" + 1);
                        #/
                    }
                    level.var_41670c1c65f3d3cf.poi[poiname].var_a87122636ff072d3 = "Request Failed: Will Try Again";
                    function_374ecacad63bb411(1, poiname);
                }
            } else {
                /#
                    println("<unknown string>" + poiname);
                #/
                level thread function_81b32ea3e7797125(poiname, 5, "No good reinforce loc found.");
                function_374ecacad63bb411(5, poiname);
            }
        } else {
            level.var_41670c1c65f3d3cf.poi[poiname].var_a87122636ff072d3 = "Queue Empty";
            function_374ecacad63bb411(1, poiname);
        }
        function_e332d48077f00441(poiname);
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd168
// Size: 0xc2
function function_81b32ea3e7797125(poiname, time, reason) {
    timeremaining = time;
    interval = 0.1;
    if (!isdefined(reason)) {
        reason = "";
    } else {
        reason = reason + " - ";
    }
    while (timeremaining > 0) {
        var_48f1dbf87dd99400 = namespace_9c840bb9f2ecbf00::limitdecimalplaces(timeremaining, 1);
        level.var_41670c1c65f3d3cf.poi[poiname].var_a87122636ff072d3 = reason + "Queue Delay : " + var_48f1dbf87dd99400;
        wait(interval);
        timeremaining = timeremaining - interval;
    }
    level.var_41670c1c65f3d3cf.poi[poiname].var_a87122636ff072d3 = "Delay Complete. New Request Available";
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd231
// Size: 0x1cd
function function_8d4c6890cbea3d1(poiname, var_4a5b97d6bbd597a) {
    if (!isdefined(var_4a5b97d6bbd597a)) {
        var_4a5b97d6bbd597a = 1;
    }
    var_be60021f92d78965 = undefined;
    if (function_47d356083884f913()) {
        if (!isdefined(poiname)) {
            return [0:undefined, 1:undefined];
        }
        var_ec9a5d27d554b3f8 = function_a7f1b9bb31f445f1(poiname);
        subarea = var_ec9a5d27d554b3f8[1];
        origin = var_ec9a5d27d554b3f8[0];
        if (isdefined(origin)) {
            return [0:origin, 1:subarea];
        }
        var_be60021f92d78965 = level.poi[poiname]["subAreas"];
    } else {
        return [0:undefined, 1:undefined];
    }
    var_955568ee845fff79 = [];
    var_c31cd0019ee19fa2 = [];
    foreach (subarea in var_be60021f92d78965) {
        if (istrue(subarea.var_b3a410141a91ba67)) {
            continue;
        }
        if (subarea.var_3ebb6024e3f220ca.size + var_4a5b97d6bbd597a <= subarea.var_7da9883d4168b7f1.var_74fd03286daecf85) {
            var_955568ee845fff79[var_955568ee845fff79.size] = subarea;
        } else if (subarea.var_3ebb6024e3f220ca.size + var_4a5b97d6bbd597a <= subarea.var_7da9883d4168b7f1.var_63e6c2f5f608f74e) {
            var_c31cd0019ee19fa2[var_c31cd0019ee19fa2.size] = subarea;
        }
    }
    if (var_955568ee845fff79.size > 0) {
        var_bb61678dce6ae026 = random(var_955568ee845fff79);
        return [0:function_99b2104c78855a16(var_bb61678dce6ae026), 1:var_bb61678dce6ae026];
    }
    if (var_c31cd0019ee19fa2.size > 0) {
        var_bb61678dce6ae026 = random(var_c31cd0019ee19fa2);
        return [0:function_99b2104c78855a16(var_bb61678dce6ae026), 1:var_bb61678dce6ae026];
    }
    return [0:undefined, 1:undefined];
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd406
// Size: 0x1f9
function function_99b2104c78855a16(subarea) {
    var_d80097c88da19027 = array_combine(level.poi[subarea.poi]["paraReinforceStruct"].var_301d639da97100c9, level.poi[subarea.poi]["heliReinforceStruct"].var_c9464c89a69010e2);
    if (isdefined(level.poi[subarea.poi]["elevatorReinforceLocs"])) {
        var_d80097c88da19027 = array_combine(level.poi[subarea.poi]["elevatorReinforceLocs"]);
    }
    if (subarea.var_71ad22c5d093d90b != "orphan") {
        var_abc2b29e98e397c7 = [];
        foreach (loc in var_d80097c88da19027) {
            var_4b70d7484f56a682 = function_a44e168e8cced18(loc.origin, subarea.poi);
            if (subarea.var_71ad22c5d093d90b == var_4b70d7484f56a682.var_71ad22c5d093d90b) {
                var_abc2b29e98e397c7[var_abc2b29e98e397c7.size] = loc;
            }
        }
        if (var_abc2b29e98e397c7.size == 0) {
            /#
                println("<unknown string>" + subarea.poi + "<unknown string>" + subarea.var_71ad22c5d093d90b);
            #/
            return subarea.trigger.origin;
        }
        return random(var_abc2b29e98e397c7).origin;
    } else {
        if (var_d80097c88da19027.size == 0) {
            /#
                println("<unknown string>" + subarea.poi + "<unknown string>" + subarea.var_71ad22c5d093d90b);
            #/
            return;
        }
        return random(var_d80097c88da19027).origin;
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd606
// Size: 0x1c8
function function_3daefb936272829f(poiname, origin, time, subarea) {
    if (namespace_cd0b2d039510b38d::getsubgametype() != "dmz") {
        return;
    }
    if (!isdefined(poiname) || !isdefined(level.var_41670c1c65f3d3cf.poi[poiname])) {
        return;
    }
    if (!isdefined(level.var_41670c1c65f3d3cf.poi[poiname].var_3e25b99d959168b9)) {
        return;
    }
    if (!isdefined(time)) {
        time = gettime();
    }
    if (isdefined(level.var_41670c1c65f3d3cf.poi[poiname].var_7de558b0868a5d85)) {
        dist = distance2dsquared(origin, level.var_41670c1c65f3d3cf.poi[poiname].var_7de558b0868a5d85.origin);
        if (time - level.var_41670c1c65f3d3cf.poi[poiname].var_7de558b0868a5d85.time < level.var_2ceafe81d4233d2b && dist <= level.var_28ddeb5728c40aa2) {
            return;
        }
    }
    struct = spawnstruct();
    struct.origin = origin;
    struct.time = gettime();
    struct.subarea = subarea;
    level.var_41670c1c65f3d3cf.poi[poiname].var_3e25b99d959168b9[level.var_41670c1c65f3d3cf.poi[poiname].var_3e25b99d959168b9.size] = struct;
    level.var_41670c1c65f3d3cf.poi[poiname].var_7de558b0868a5d85 = struct;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7d5
// Size: 0x193
function function_a7f1b9bb31f445f1(poiname) {
    if (!isdefined(poiname) || !isdefined(level.var_41670c1c65f3d3cf.poi[poiname])) {
        return [0:undefined, 1:undefined];
    }
    currenttime = gettime();
    level.var_41670c1c65f3d3cf.poi[poiname].var_3e25b99d959168b9 = array_randomize(level.var_41670c1c65f3d3cf.poi[poiname].var_3e25b99d959168b9);
    foreach (index, loc in level.var_41670c1c65f3d3cf.poi[poiname].var_3e25b99d959168b9) {
        if (currenttime > loc.time + 45000) {
            level.var_41670c1c65f3d3cf.poi[poiname].var_3e25b99d959168b9[index] = undefined;
        } else {
            origin = loc.origin;
            subarea = loc.subarea;
            level.var_41670c1c65f3d3cf.poi[poiname].var_3e25b99d959168b9[index] = undefined;
            return [0:origin, 1:subarea];
        }
    }
    return [0:undefined, 1:undefined];
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd970
// Size: 0xa1
function function_d4e513ab9aae6aa6(poiname) {
    var_25dd3020969aa0f6 = [];
    foreach (node in level.poi[poiname]["looseGuardNodes"]) {
        if (node.var_71ad22c5d093d90b == "orphan") {
            var_25dd3020969aa0f6[var_25dd3020969aa0f6.size] = node;
        }
    }
    node = random(var_25dd3020969aa0f6);
    if (isdefined(node)) {
        return node.origin;
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda19
// Size: 0x4d
function function_b9d78fce07834c95(var_cf627bf100b5bafc, var_83c3368707c68e6) {
    var_92dfff01879248e6 = spawnstruct();
    var_92dfff01879248e6.numagents = var_cf627bf100b5bafc.size;
    var_92dfff01879248e6.var_dd4f509b9c56c76f = var_cf627bf100b5bafc;
    var_92dfff01879248e6.var_83c3368707c68e6 = var_83c3368707c68e6;
    return var_92dfff01879248e6;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda6e
// Size: 0x6c
function function_de59d7cb310c1aff(type, tier, nationality) {
    request = spawnstruct();
    if (!isdefined(type)) {
        type = function_ed108ff3eb578327(undefined, tier);
    }
    request.type = type;
    if (!isdefined(tier)) {
        tier = 1;
    }
    request.tier = tier;
    request.nationality = nationality;
    return request;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdae2
// Size: 0x8b
function function_ab14d6652e44fda0(var_df3d07ebcf4abe8a, var_b1a6916f4fa58587, tier, var_fcdc7f62624c71ff, var_83c3368707c68e6) {
    var_dd4f509b9c56c76f = [];
    for (i = 0; i < var_df3d07ebcf4abe8a; i++) {
        if (isdefined(var_fcdc7f62624c71ff)) {
            type = function_ed108ff3eb578327(var_fcdc7f62624c71ff, tier);
        } else {
            type = random(var_b1a6916f4fa58587);
        }
        var_dd4f509b9c56c76f[var_dd4f509b9c56c76f.size] = function_de59d7cb310c1aff(type, tier);
    }
    return function_b9d78fce07834c95(var_dd4f509b9c56c76f, var_83c3368707c68e6);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb75
// Size: 0xef
function function_374ecacad63bb411(delaytime, poiname, var_8395c669fc96c418) {
    if (!isdefined(poiname) || !isdefined(level.var_41670c1c65f3d3cf.poi[poiname])) {
        return;
    }
    if (!isdefined(level.var_41670c1c65f3d3cf.poi[poiname].var_5531002f0448bfaf)) {
        return;
    }
    var_86416df79600093c = spawnstruct();
    var_86416df79600093c.delaytime = delaytime;
    var_86416df79600093c.var_8395c669fc96c418 = var_8395c669fc96c418;
    level.var_41670c1c65f3d3cf.poi[poiname].var_5531002f0448bfaf[level.var_41670c1c65f3d3cf.poi[poiname].var_5531002f0448bfaf.size] = var_86416df79600093c;
    level.var_41670c1c65f3d3cf.poi[poiname].var_9d2f71782a11c15c = 1;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc6b
// Size: 0x165
function function_e332d48077f00441(poiname) {
    level endon("game_ended");
    if (!isdefined(poiname) || !isdefined(level.var_41670c1c65f3d3cf.poi[poiname])) {
        return;
    }
    while (level.var_41670c1c65f3d3cf.poi[poiname].var_9d2f71782a11c15c) {
        var_70bcbf0ad5028219 = level.var_41670c1c65f3d3cf.poi[poiname].var_5531002f0448bfaf;
        level.var_41670c1c65f3d3cf.poi[poiname].var_5531002f0448bfaf = [];
        level.var_41670c1c65f3d3cf.poi[poiname].var_9d2f71782a11c15c = 0;
        foreach (var_86416df79600093c in var_70bcbf0ad5028219) {
            if (istrue(level.var_ba36989c7e24e4ff)) {
                /#
                    println("<unknown string>" + poiname + "<unknown string>" + var_86416df79600093c.delaytime);
                #/
            }
            level thread function_81b32ea3e7797125(poiname, var_86416df79600093c.delaytime, var_86416df79600093c.var_8395c669fc96c418);
            wait(var_86416df79600093c.delaytime);
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddd7
// Size: 0x192
function function_346caf10322931c8(poiname, origin) {
    curtime = gettime();
    if (function_47d356083884f913()) {
        if (!isdefined(poiname) || !array_contains(getarraykeys(level.poi), poiname)) {
            poiname = function_6cc445c02b5effac(origin);
        }
        if (!level.var_1171d24dd4142369[poiname] && curtime - level.var_e5fd74b71bdf51fa[poiname] > level.var_d1a95e3c3d6ea9fc) {
            level.var_1171d24dd4142369[poiname] = 1;
            level.var_e5fd74b71bdf51fa[poiname] = curtime;
            var_600052562a9f7fa4 = [];
            foreach (player in level.players) {
                if (isdefined(player.var_da28916e7827af7c) && player.var_da28916e7827af7c == poiname) {
                    var_600052562a9f7fa4[var_600052562a9f7fa4.size] = player;
                }
            }
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("poi_ai_reinforce", var_600052562a9f7fa4);
            level.var_1171d24dd4142369[poiname] = 0;
        }
    } else if (!level.var_1171d24dd4142369 && (!isdefined(level.var_e5fd74b71bdf51fa) || curtime - level.var_e5fd74b71bdf51fa > level.var_d1a95e3c3d6ea9fc)) {
        level.var_1171d24dd4142369 = 1;
        level.var_e5fd74b71bdf51fa = curtime;
        level.var_1171d24dd4142369 = 0;
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf70
// Size: 0x316
function function_353fecd1549f5f42(origin, radius, team, var_20291ae8a5f418f1, var_3e7224d25cb04b6, var_87d4c4075f48ec58, var_3618cbd8ed07704, var_2e2a816782a04d24, var_1b3d1c2f22b62206, targetent) {
    var_b9999a265aa15583 = 0;
    if (!isdefined(team)) {
        team = "team_hundred_ninety_five";
    }
    if (!isdefined(radius)) {
        radius = 1024;
    }
    agents = namespace_235de5057ddc58e0::function_d9ce8fb00f0e5fa1(origin, radius, team);
    var_50f783a5617f8940 = [];
    foreach (agent in agents) {
        if (!isplayer(agent)) {
            var_50f783a5617f8940[var_50f783a5617f8940.size] = agent;
        }
    }
    agents = var_50f783a5617f8940;
    if (!isdefined(var_20291ae8a5f418f1)) {
        var_20291ae8a5f418f1 = 5;
    }
    if (!isdefined(var_3e7224d25cb04b6)) {
        var_3e7224d25cb04b6 = [0:"extraGuards", 1:"extraPatrols", 2:"reinforcements", 3:"firstKillFodder", 4:"spawnPackage"];
    }
    /#
        if (var_b9999a265aa15583) {
            foreach (guy in level.agentarray) {
                guy notify("<unknown string>");
            }
        }
    #/
    agents = sortbydistance(agents, origin);
    var_c5a227521b066bdd = [];
    foreach (agent in agents) {
        if (isplayer(agent)) {
            continue;
        }
        if (issubstr(agent.agent_type, "jugg")) {
            continue;
        }
        if (var_c5a227521b066bdd.size >= var_20291ae8a5f418f1) {
            break;
        }
        if (!istrue(var_2e2a816782a04d24) && istrue(agent.var_9f78b0c726e807ff) || isdefined(agent.vehicle_position) && isint(agent.vehicle_position)) {
            continue;
        }
        if (!(isstring(var_3e7224d25cb04b6) && var_3e7224d25cb04b6 == "all") && !array_contains(var_3e7224d25cb04b6, agent.category)) {
            /#
                if (var_b9999a265aa15583) {
                    agent thread namespace_d028276791d9cff6::drawsphere(agent.origin, 64, 30, (1, 0, 0));
                }
            #/
        } else {
            var_c5a227521b066bdd[var_c5a227521b066bdd.size] = agent;
            agent.var_9f78b0c726e807ff = 1;
            if (!isdefined(var_87d4c4075f48ec58)) {
                var_87d4c4075f48ec58 = 256;
            }
            if (!isdefined(var_3618cbd8ed07704)) {
                var_3618cbd8ed07704 = 512;
            }
            agent thread function_a5117518725da028(agent, origin, var_3618cbd8ed07704, var_87d4c4075f48ec58, undefined, 1, agents, 0, var_1b3d1c2f22b62206, targetent);
            /#
                if (var_b9999a265aa15583) {
                    agent thread function_96570df5c7d02794(agent, origin);
                }
            #/
        }
    }
    return var_c5a227521b066bdd;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0xe28e
// Size: 0x132
function function_6214774e8e021663(numagents, var_c5e7fce963586ec0, priority, category, subcategory, groupname, team, poiname, var_b1a6a85296574c99, maxdistfromorigin) {
    if (!isdefined(var_b1a6a85296574c99)) {
        var_b1a6a85296574c99 = 512;
    }
    if (!isdefined(maxdistfromorigin)) {
        maxdistfromorigin = 1024;
    }
    var_c5e7fce963586ec0 = function_61cbc488b27a6e61(var_c5e7fce963586ec0);
    var_35ba2a054f831d58 = 360 / numagents;
    agents = [];
    starlevel = function_5cc0c507e92f7b47(poiname);
    for (i = 1; i <= numagents; i++) {
        spawnorigin = (0, randomintrange(var_b1a6a85296574c99, maxdistfromorigin), 0);
        spawnorigin = var_c5e7fce963586ec0 + rotatepointaroundvector((0, 0, 1), spawnorigin, var_35ba2a054f831d58 * i);
        spawnorigin = function_61cbc488b27a6e61(spawnorigin);
        aitype = function_d5bc07eabf352abb();
        agents[agents.size] = ai_mp_requestspawnagent(aitype, spawnorigin, (0, 0, 0), priority, category, subcategory, groupname, team, undefined, poiname);
    }
    return agents;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3c8
// Size: 0x100
function function_30ef4d9086400a2d() {
    level.var_41670c1c65f3d3cf.var_5da316fb1c149f28 = getdvarint(@"hash_69535aa7c07dd140", 5);
    level.var_41670c1c65f3d3cf.var_51baa9a0e1d139d1 = [];
    level.var_41670c1c65f3d3cf.var_5531002f0448bfaf = [];
    level.var_41670c1c65f3d3cf.var_9d2f71782a11c15c = 0;
    if (getdvarint(@"hash_8ec821e080a0b50d", 1) == 1) {
        level.var_d1a95e3c3d6ea9fc = getdvarint(@"hash_3d859bf85679053c", 200) * 1000;
        level.var_e5fd74b71bdf51fa = 0;
        level.var_1171d24dd4142369 = 0;
    }
    level.var_a87122636ff072d3 = "Initalizing";
    level thread function_1ddbad36141b379();
    var_2acd3064a749d3bd = getdvarint(@"hash_3bb3561ddb301247", 180);
    level.var_a87122636ff072d3 = "Waiting for Initial Delay of " + var_2acd3064a749d3bd + " seconds.";
    wait(var_2acd3064a749d3bd);
    level thread function_cc76799172c6a0f();
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4cf
// Size: 0x175
function function_1ddbad36141b379() {
    level endon("game_ended");
    level endon("dmz_radiation_started");
    var_d2ca218ea05fa7cc = getdvarint(@"hash_5f174bbb593ef9f4", 60);
    var_8e1193fcb0683b6 = level.var_41670c1c65f3d3cf.var_25087194b5e05d51;
    var_205e40ade16daabf = level.var_41670c1c65f3d3cf.var_5da316fb1c149f28;
    threshold = var_8e1193fcb0683b6 + var_205e40ade16daabf;
    var_745537a1e27d4e8 = 0;
    while (1) {
        if (level.var_41670c1c65f3d3cf.var_25087194b5e05d51 >= threshold) {
            increment = level.var_41670c1c65f3d3cf.var_5da316fb1c149f28 + randomintrange(-2, 2);
            threshold = threshold + increment;
            level.var_41670c1c65f3d3cf.var_51baa9a0e1d139d1[level.var_41670c1c65f3d3cf.var_51baa9a0e1d139d1.size] = increment;
        }
        if (level.var_41670c1c65f3d3cf.var_25087194b5e05d51 > 0 && level.var_41670c1c65f3d3cf.var_25087194b5e05d51 != var_745537a1e27d4e8 && level.var_41670c1c65f3d3cf.var_25087194b5e05d51 % level.var_8a7245a12448052f == 0) {
            var_745537a1e27d4e8 = level.var_41670c1c65f3d3cf.var_25087194b5e05d51;
            function_7bbe6bc34f2e7edf(level.var_a3a884994e83cdba);
        }
        wait(1);
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe64b
// Size: 0x1d1
function function_cc76799172c6a0f() {
    level endon("game_ended");
    level endon("dmz_radiation_started");
    var_d2ca218ea05fa7cc = getdvarint(@"hash_5f174bbb593ef9f4", 60);
    var_214efd966bf0021d = getdvarint(@"hash_623de28f7e6a71a2", 10);
    var_409904714e01634a = undefined;
    while (1) {
        if (level.var_41670c1c65f3d3cf.var_51baa9a0e1d139d1.size > 0) {
            if (!istrue(var_409904714e01634a)) {
                level.var_a87122636ff072d3 = "Queue Activated: Waiting 10-15 secs before request.";
                wait(randomintrange(10, 15));
            }
            success = 0;
            timeout = 10000;
            var_3bb065b9fa6a9d77 = gettime();
            var_ad55d9b021f40be1 = level.var_41670c1c65f3d3cf.var_51baa9a0e1d139d1[0];
            while (!success && var_3bb065b9fa6a9d77 + timeout > gettime()) {
                level.var_a87122636ff072d3 = "Queue Activated. Reinforcements requested.";
                agents = function_77acc10c4823dd8a(var_ad55d9b021f40be1, getrandomnavpoint((0, 0, 0), 10000), "medium", "reinforcements", "maintainPopulation");
                if (isdefined(agents)) {
                    success = 1;
                }
                wait(0.25);
            }
            if (success) {
                level.var_41670c1c65f3d3cf.var_51baa9a0e1d139d1 = array_remove_index(level.var_41670c1c65f3d3cf.var_51baa9a0e1d139d1, 0);
                delaytime = var_d2ca218ea05fa7cc + randomfloatrange(var_214efd966bf0021d * -1, var_214efd966bf0021d);
                level.var_a87122636ff072d3 = "Request Successful: Delay of " + delaytime + " seconds.";
                var_409904714e01634a = 1;
                wait(delaytime);
            }
        } else {
            level.var_a87122636ff072d3 = "Queue Empty";
            var_409904714e01634a = 0;
        }
        function_bfdb4389e23ac40f();
        wait(1);
        function_bfdb4389e23ac40f();
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe823
// Size: 0x4c
function function_7bbe6bc34f2e7edf(delaytime) {
    level.var_41670c1c65f3d3cf.var_5531002f0448bfaf[level.var_41670c1c65f3d3cf.var_5531002f0448bfaf.size] = delaytime;
    level.var_41670c1c65f3d3cf.var_9d2f71782a11c15c = 1;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe876
// Size: 0xdc
function function_bfdb4389e23ac40f() {
    level endon("game_ended");
    while (level.var_41670c1c65f3d3cf.var_9d2f71782a11c15c) {
        var_70bcbf0ad5028219 = level.var_41670c1c65f3d3cf.var_5531002f0448bfaf;
        level.var_41670c1c65f3d3cf.var_5531002f0448bfaf = [];
        level.var_41670c1c65f3d3cf.var_9d2f71782a11c15c = 0;
        foreach (var_86416df79600093c in var_70bcbf0ad5028219) {
            level.var_a87122636ff072d3 = "Queue Paused: Current pause of " + var_86416df79600093c.delaytime + " secs.";
            wait(var_86416df79600093c.delaytime);
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe959
// Size: 0x5b
function function_571151294c1a740b(tier, var_602836e9dcd142f4) {
    while (!isdefined(level.var_f5f783a9d656258) || !isdefined(level.var_f5f783a9d656258.var_87f044eda76ae14a)) {
        waitframe();
    }
    level.var_f5f783a9d656258.var_87f044eda76ae14a["tier" + tier] = var_602836e9dcd142f4;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe9bb
// Size: 0x55
function function_5033963ec182afc1(type, var_602836e9dcd142f4) {
    while (!isdefined(level.var_f5f783a9d656258) || !isdefined(level.var_f5f783a9d656258.var_48d4812167fbb628)) {
        waitframe();
    }
    level.var_f5f783a9d656258.var_48d4812167fbb628[type] = var_602836e9dcd142f4;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xea17
// Size: 0x74
function function_96570df5c7d02794(agent, origin) {
    /#
        agent endon("<unknown string>");
        while (1) {
            thread namespace_d028276791d9cff6::drawsphere(agent.origin, 64, 0.05, (0, 1, 0));
            thread namespace_f2ffc0540883e1ad::drawline(agent.origin, origin, 0.05, (1, 1, 1));
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xea92
// Size: 0x77
function function_8dd097014829eb21() {
    wait(5);
    player = level.players[0];
    follower = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(function_7f1a2e2ebe0c1693("ar"), player.origin, player.angles, "mission", undefined, 1, player.team);
    function_dc01699146e5f9a2(follower);
    if (isdefined(follower)) {
        function_bec44d71336f2d1e(follower, player);
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb10
// Size: 0x52
function function_bec44d71336f2d1e(agent, player) {
    level endon("game_ended");
    agent endon("death");
    while (1) {
        agent function_304da84d9a815c01(player.origin, 128, 1);
        agent namespace_6db9b2dcda758664::bt_set_stealth_state("combat", undefined);
        wait(3);
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeb69
// Size: 0xb3
function function_654314b2d2451989(agent) {
    while (1) {
        var_bcfec646853a95c1 = randomfloatrange(85, 150) * namespace_3c37cb17ade254d::ter_op(randomint(100) > 50, 1, -1);
        var_bcfec546853a938e = randomfloatrange(85, 150) * namespace_3c37cb17ade254d::ter_op(randomint(100) > 50, 1, -1);
        var_b30a6c38cd4fe517 = (agent.origin[0] + var_bcfec646853a95c1, agent.origin[1] + var_bcfec546853a938e, agent.origin[2]);
        agent _setgoalpos(function_61cbc488b27a6e61(var_b30a6c38cd4fe517), 10);
        wait(5);
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec23
// Size: 0x1f1
function function_5d07b6ef455e7876(agent, groupname) {
    if (!isdefined(level.var_455529c46f41b5e9)) {
        level.var_455529c46f41b5e9 = 0;
    }
    if (!isdefined(groupname)) {
        if (isdefined(agent.poi)) {
            groupname = function_d2d6e405db635dc8(agent.poi);
        } else if (function_47d356083884f913()) {
            groupname = function_d2d6e405db635dc8(undefined);
        } else {
            groupname = function_1c52f5ede022affe(agent);
        }
    }
    if (isdefined(agent.group) && isdefined(agent.group.group_name)) {
        agent.script_stealthgroup = agent.group.group_name;
    } else if (isdefined(groupname)) {
        agent.script_stealthgroup = groupname;
    } else {
        if (!isdefined(groupname)) {
            groupname = "group_" + level.var_455529c46f41b5e9;
            level.var_455529c46f41b5e9++;
        }
        agent.script_stealthgroup = groupname;
    }
    if (isdefined(agent.spawnpoint)) {
        if (isdefined(agent.spawnpoint.script_stealthgroup)) {
            agent.script_stealthgroup = agent.spawnpoint.script_stealthgroup;
        }
        if (isdefined(agent.spawnpoint.script_sightrange)) {
            agent.stealth.override_damage_auto_range = int(agent.script_sightrange);
        }
    }
    agent thread namespace_6db9b2dcda758664::main();
    agent thread namespace_42207369e7a21b21::monitor_death_thread(level.stealth.damage_auto_range, level.stealth.damage_sight_range);
    agent.var_ba67494935b9726b = 1;
    agent.stealth.funcs["event_combat"] = &function_21014e3c42bcc249;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee1b
// Size: 0x1f3
function function_d2d6e405db635dc8(poiname, numagents) {
    if (!isdefined(numagents)) {
        numagents = 1;
    }
    if (isdefined(level.poi) && isdefined(poiname) && isdefined(level.poi[poiname])) {
        if (!isdefined(level.poi[poiname]["stealthGroupIndexing"])) {
            level.poi[poiname]["stealthGroupIndexing"] = spawnstruct();
            level.poi[poiname]["stealthGroupIndexing"].var_455529c46f41b5e9 = 1;
            level.poi[poiname]["stealthGroupIndexing"].var_8c2675f7696d48fc = 0;
        }
        if (level.poi[poiname]["stealthGroupIndexing"].var_8c2675f7696d48fc >= 40) {
            level.poi[poiname]["stealthGroupIndexing"].var_455529c46f41b5e9 = level.poi[poiname]["stealthGroupIndexing"].var_455529c46f41b5e9 + 1;
            level.poi[poiname]["stealthGroupIndexing"].var_8c2675f7696d48fc = 0;
        }
        level.poi[poiname]["stealthGroupIndexing"].var_8c2675f7696d48fc = level.poi[poiname]["stealthGroupIndexing"].var_8c2675f7696d48fc + numagents;
        return (poiname + "_" + level.poi[poiname]["stealthGroupIndexing"].var_455529c46f41b5e9);
    } else {
        if (!isdefined(level.var_50bd497eb91dc04a)) {
            level.var_50bd497eb91dc04a = 1;
            level.var_ef80e5300d000127 = 0;
        }
        if (level.var_ef80e5300d000127 >= 40) {
            level.var_50bd497eb91dc04a = level.var_50bd497eb91dc04a + 1;
            level.var_ef80e5300d000127 = 0;
        }
        level.var_ef80e5300d000127 = level.var_ef80e5300d000127 + numagents;
        return ("noProvidedPOIName_" + level.var_50bd497eb91dc04a);
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf015
// Size: 0x130
function function_1c52f5ede022affe(agent) {
    if (!isdefined(level.var_5a4dba9129517d67)) {
        level.var_5a4dba9129517d67 = [];
        level.var_c316383dd3bc8be6 = [];
    }
    if (!isdefined(level.var_5a4dba9129517d67[agent.team])) {
        level.var_5a4dba9129517d67[agent.team] = 1;
        level.var_c316383dd3bc8be6[agent.team] = 0;
    }
    if (level.var_c316383dd3bc8be6[agent.team] >= 4) {
        level.var_5a4dba9129517d67[agent.team] = level.var_5a4dba9129517d67[agent.team] + 1;
        level.var_c316383dd3bc8be6[agent.team] = 0;
    }
    level.var_c316383dd3bc8be6[agent.team] = level.var_c316383dd3bc8be6[agent.team] + 1;
    return "stealthGroup_" + agent.team + "_" + level.var_5a4dba9129517d67[agent.team];
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf14d
// Size: 0x71
function function_c8393014dd7f8ab6() {
    level.default_goalradius = 2048;
    namespace_42207369e7a21b21::main();
    flag_set("level_stealth_initialized");
    if (isdefined(level.var_3eed4e0bc4a30b72)) {
        var_d2126dbdeced47f6 = level.var_3eed4e0bc4a30b72;
    } else {
        var_d2126dbdeced47f6 = "br_saba_aieventlist";
    }
    function_71a28a935629a941(var_d2126dbdeced47f6);
    level.nopathnodes = 1;
    level.brenableagents = 1;
    namespace_310bdaa3cf041c47::init_gameskill();
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1c5
// Size: 0xb7
function function_779b9979fd853e26(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (isdefined(self.var_a4738c70736d3a61)) {
        [[ self.var_a4738c70736d3a61 ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    } else {
        namespace_daa149ca485fd50a::function_dffac413ed66bcd0(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf283
// Size: 0x50
function function_912903818a06c431() {
    agent = ai_mp_requestspawnagent("enemy_mp_jugg_base", (-14, 488, 106), (0, 0, 0), "high", "elites", "debug");
    if (!isdefined(agent)) {
        return;
    }
    function_1828f1e20e52b418(agent);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2da
// Size: 0x68
function function_78759441c259f58a(origin, numagents) {
    if (isdefined(origin)) {
        poiname = function_6cc445c02b5effac(origin);
        return function_d2d6e405db635dc8(poiname, numagents);
    }
    if (!isdefined(level.var_2f98ad635074949a)) {
        level.var_2f98ad635074949a = 1;
    } else {
        level.var_2f98ad635074949a++;
    }
    return "reinforce_" + level.var_2f98ad635074949a;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf34a
// Size: 0x97
function function_8352fd5060043037(origin, radius) {
    if (!isdefined(origin)) {
        return;
    }
    if (!isdefined(radius)) {
        radius = 64;
    }
    pathnodes = getnodesinradius(origin, radius, 0, radius);
    foreach (node in pathnodes) {
        if (node.type == "Begin") {
            destroynavlink(node);
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3e8
// Size: 0x29
function function_c9dad3876b9d8755(agent, var_a938130624194f25) {
    if (!isdefined(agent) || !isdefined(var_a938130624194f25)) {
        return;
    }
    agent function_d493e7fe15e5eaf4(var_a938130624194f25);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf418
// Size: 0x43
function function_f55d225b544277e8(agent, time) {
    if (!isdefined(agent) || !isdefined(time)) {
        return;
    }
    agent.var_cc2849446d443fff = time * 1000;
    agent.var_226535b4da429452 = time * 1000;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf462
// Size: 0x6f
function function_c9b9fe3f7f739586(agent) {
    if (istrue(agent.var_102a9d2cf99ab325)) {
        return;
    }
    agent.var_65771500f49956c1 = 1;
    agent.var_102a9d2cf99ab325 = 1;
    agent attach("hat_child_hadir_gas_mask_wm_br", "j_head");
    function_63a043d47490f90d(agent, "brloot_equip_gasmask", undefined, 0.25, 108);
    agent.var_cd6a3a50f09688b9 = &function_85aea9db068bc292;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4d8
// Size: 0x3b
function function_85aea9db068bc292(agent, attacker) {
    agent detach("hat_child_hadir_gas_mask_wm_br", "j_head");
    agent.var_65771500f49956c1 = 0;
    namespace_daa149ca485fd50a::function_59ea6b2f800cb082(agent, attacker);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf51a
// Size: 0x70
function function_caf96a86ca85140f(agent) {
    if (!namespace_7789f919216d38a2::radiation_isinit()) {
        return;
    }
    if (namespace_7789f919216d38a2::function_485b5a399def53d0(agent.origin) > level.radiation.radius + 1500) {
        return;
    }
    if (isdefined(agent.category) && agent.category == "BOSSES") {
        return;
    }
    function_c9b9fe3f7f739586(agent);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf591
// Size: 0xa6
function function_b893eeceef3ac7a(agent) {
    if (isdefined(level.var_184726567a9f58d8) && isdefined(level.var_808a69414f52f6bc)) {
        if (issubstr(agent.agent_type, "ar") || issubstr(agent.agent_type, "smg") || issubstr(agent.agent_type, "lmg")) {
            var_c7a4725d05bb7f22 = agentpers_getagentpersdata(agent, "tier");
            if (randomfloat(1) <= level.var_184726567a9f58d8 * var_c7a4725d05bb7f22) {
                function_17dcf4b7d0a92bc3(agent);
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf63e
// Size: 0x39
function function_17dcf4b7d0a92bc3(agent) {
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, level.br_lootiteminfo[random(level.var_808a69414f52f6bc)].fullweaponobj);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf67e
// Size: 0x82
function function_e57289d4e2128a53(var_20450ef8c1f7be0d) {
    if (!namespace_7789f919216d38a2::radiation_isinit()) {
        return 0;
    }
    foreach (origin in var_20450ef8c1f7be0d) {
        if (namespace_7789f919216d38a2::function_485b5a399def53d0(origin) < level.radiation.radius + 256) {
            return 1;
        }
    }
    return 0;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf708
// Size: 0x8c
function function_8b178e05801f2daf(path) {
    if (!namespace_7789f919216d38a2::radiation_isinit()) {
        return 0;
    }
    foreach (loc in path) {
        if (namespace_7789f919216d38a2::function_485b5a399def53d0(loc.origin) < level.radiation.radius + 256) {
            return 1;
        }
    }
    return 0;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf79c
// Size: 0x75
function function_75425e32a1700c73() {
    var_6fdc19dbcd9f04d3 = getstructarray("traversal_invalid", "script_noteworthy");
    foreach (loc in var_6fdc19dbcd9f04d3) {
        function_8352fd5060043037(loc.origin);
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf818
// Size: 0x58
function function_af3034a7c69d7edb(team) {
    if (!isdefined(level.var_9f08a58aa6a97f2e)) {
        level.var_9f08a58aa6a97f2e = [];
    }
    level thread function_44b88041adc4a861(team, (0, 0, 0));
    while (!isdefined(level.var_9f08a58aa6a97f2e[team])) {
        waitframe();
    }
    return level.var_9f08a58aa6a97f2e[team];
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf878
// Size: 0x176
function function_44b88041adc4a861(team, var_1f92df5629595bc9) {
    if (isdefined(level.var_9f08a58aa6a97f2e[team])) {
        return;
    }
    level notify("spawn_hidden_agent_" + team);
    level endon("spawn_hidden_agent_" + team);
    namespace_bfef6903bca5845d::function_2fc80954fa70d153();
    aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("ar");
    if (!isdefined(level.agent_definition["actor_" + aitype])) {
        aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("ar", undefined, "ru");
    }
    if (!isdefined(level.agent_definition["actor_" + aitype])) {
        aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("ar", undefined, "merc");
    }
    poi = undefined;
    if (namespace_37f0fb6355a4618a::poi_ispoiactive("bossArea")) {
        poi = "bossArea";
    }
    agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, var_1f92df5629595bc9, (0, 0, 0), "absolute", "reinforcements", "hidden", undefined, team, undefined, poi, 1, undefined, 0);
    if (!isdefined(agent)) {
        return;
    }
    agent.ignoreall = 1;
    agent.dontevershoot = 1;
    agent.var_b582b10663b5b2a9 = 0;
    agent.invulnerable = 1;
    agent.speedscalemult = 0;
    agent forceteleport(var_1f92df5629595bc9, (0, 0, 0));
    agent takeallweapons();
    agent hide();
    level.var_9f08a58aa6a97f2e[team] = agent;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9f5
// Size: 0x15c
function function_44b2bad96489df87() {
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    var_5f6e843fb2c4cb88 = 1;
    if (function_47d356083884f913()) {
        function_44739fe1cf82e29a("stealthVolumeCenters");
    } else {
        level.stealthvolumecenters = [];
        var_5f6e843fb2c4cb88 = 0;
    }
    keys = getarraykeys(level.struct_class_names["script_noteworthy"]);
    foreach (key in keys) {
        if (issubstr(key, "_stealthVolume_")) {
            foreach (node in level.struct_class_names["script_noteworthy"][key]) {
                if (var_5f6e843fb2c4cb88) {
                    poiname = function_6cc445c02b5effac(node.origin, 1, 1);
                    function_d0e7647e5538eb9d(poiname, "stealthVolumeCenters", node);
                } else {
                    level.stealthvolumecenters[level.stealthvolumecenters.size] = node;
                }
            }
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfb58
// Size: 0xb5
function function_e86762be42bb72b0(origin, poiname) {
    if (!isdefined(origin)) {
        return undefined;
    }
    var_a0b3a72bb77aafdd = undefined;
    if (function_47d356083884f913()) {
        if (!isdefined(poiname) || poiname == "bossArea") {
            poiname = function_6cc445c02b5effac(origin);
        }
        var_a0b3a72bb77aafdd = function_1af8a41e4c1252c7(poiname, "stealthVolumeCenters");
    } else {
        if (!isdefined(level.stealthvolumecenters) || level.stealthvolumecenters.size == 0) {
            return undefined;
        }
        var_a0b3a72bb77aafdd = level.stealthvolumecenters;
    }
    if (!isdefined(var_a0b3a72bb77aafdd) || var_a0b3a72bb77aafdd.size == 0) {
        return undefined;
    }
    var_68680cb275f40bf = sortbydistance(var_a0b3a72bb77aafdd, origin);
    return var_68680cb275f40bf[0].script_noteworthy;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc15
// Size: 0x3
function dialog_init() {
    
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfc1f
// Size: 0x9f
function function_454a478e5e1fc4f2(alias, poiname) {
    if (!isdefined(poiname) || !isdefined(level.poi[poiname]) || !isdefined(level.poi[poiname]["players"])) {
        return;
    }
    foreach (player in level.poi[poiname]["players"]) {
        player namespace_944ddf7b8df1b0e3::leaderdialogonplayer(alias);
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcc5
// Size: 0x105
function function_cdcce09b74c7cd1b(meansofdeath) {
    if (istrue(level.var_9d615a366ec2fb6f) || isdefined(meansofdeath) && meansofdeath == "MOD_EXECUTION" || isdefined(self.agentteam) && self.agentteam == "civilian") {
        return;
    }
    rand = randomintrange(1, 8);
    type = "generic";
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
        type = "female";
    }
    if (isagent(self)) {
        if (isdefined(self.team) && self.team == "allies") {
            self playsound(type + "_death_american_" + rand);
        } else {
            self playsound(type + "_death_russian_" + rand);
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfdd1
// Size: 0x2b4
function function_5aee5d819f7dfd1c() {
    if (!isdefined(level.br_pickups)) {
        return;
    }
    level.var_370eed78aa5c01a5 = [];
    level.var_370eed78aa5c01a5["thermite_mp"] = "brloot_offhand_thermite";
    level.var_370eed78aa5c01a5["semtex_mp"] = "brloot_offhand_semtex";
    level.var_370eed78aa5c01a5["frag_grenade_mp"] = "brloot_offhand_frag";
    level.var_370eed78aa5c01a5["molotov_mp"] = "brloot_offhand_molotov";
    level.var_370eed78aa5c01a5["smoke_grenade_mp"] = "brloot_offhand_smoke";
    level.var_370eed78aa5c01a5["concussion_grenade_mp"] = "brloot_offhand_concussion";
    level.var_370eed78aa5c01a5["flash_grenade_mp"] = "brloot_offhand_flash";
    level.var_370eed78aa5c01a5["snapshot_grenade_mp"] = "brloot_offhand_snapshot";
    level.var_370eed78aa5c01a5["gas_mp"] = "brloot_offhand_gas";
    level.var_370eed78aa5c01a5["decoy_grenade_mp"] = "brloot_offhand_decoy";
    level.var_370eed78aa5c01a5["equip_adrenaline"] = "brloot_health_adrenaline";
    level.br_pickups.br_weapontoscriptable["iw9_ar_akilo_mp"] = "brloot_weapon_ar_akilo47_comm";
    level.br_pickups.br_weapontoscriptable["iw9_lm_mkilo3_mp"] = "brloot_weapon_lm_mkilo3_comm";
    level.br_pickups.br_weapontoscriptable["iw9_sh_mbravo_mp"] = "brloot_weapon_sh_romeo870_comm";
    level.br_pickups.br_weapontoscriptable["iw9_sm_mpapa5_mp"] = "brloot_weapon_sm_augolf_comm";
    level.br_pickups.br_weapontoscriptable["iw9_sn_alpha50_mp"] = "brloot_weapon_sn_alpha50_comm";
    level.br_pickups.br_weapontoscriptable["iw9_sm_aviktor_mp"] = "brloot_weapon_sm_uzulu_comm";
    level.br_pickups.br_weapontoscriptable["iw9_dm_mike24_mp"] = "brloot_weapon_sn_mike14_comm";
    level.br_pickups.br_weapontoscriptable["iw9_ar_augolf_mp"] = "brloot_weapon_ar_scharlie_rare";
    level.br_pickups.br_weapontoscriptable["iw9_ar_mike4_mp"] = "brloot_weapon_ar_mike4_epic";
    level.br_pickups.br_weapontoscriptable["iw9_sm_mpapa7_mp"] = "brloot_weapon_sm_mpapa7_epic";
    level.br_pickups.br_weapontoscriptable["iw8_lm_kilo121_mp"] = "brloot_weapon_lm_kilo121_lege";
    level.br_pickups.br_weapontoscriptable["iw9_sh_charlie725_mp"] = "brloot_weapon_sh_charlie725_lege";
    level.br_pickups.br_weapontoscriptable["iw8_sm_uzulu_mpv2"] = "brloot_weapon_sm_uzulu_epic";
    level.br_pickups.br_weapontoscriptable["iw9_la_rpapa7_mp"] = "brloot_weapon_la_rpapa7_rare";
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1008c
// Size: 0x3f
function function_63a043d47490f90d(agent, scriptablename, lootid, dropchance, count) {
    function_8c8c6dbf143ab5b2(agent, function_edabf4238e9d70b5(scriptablename, lootid, undefined, dropchance, count));
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100d2
// Size: 0x72
function function_8c8c6dbf143ab5b2(agent, var_1be58aa13ba9f7da) {
    if (!isdefined(var_1be58aa13ba9f7da.lootid)) {
        var_1be58aa13ba9f7da.lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_1be58aa13ba9f7da.scriptablename);
    }
    forceddrops = function_53c4c53197386572(agentpers_getagentpersdata(agent, "forcedDrops"), []);
    forceddrops[forceddrops.size] = var_1be58aa13ba9f7da;
    agentpers_setagentpersdata(agent, "forcedDrops", forceddrops);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1014b
// Size: 0xc90
function function_82ed67ae79913551(agent, agenttype, groupname) {
    poiname = agent.poi;
    agent notify("endLootDropThread");
    agent endon("endLootDropThread");
    var_9aa01c8bc06a2a47 = agent.var_8aa9efe6383c1d5a;
    droppeditems = [];
    var_286de5b161dd4d9 = [];
    var_8003724ead57ba09 = [];
    var_15b6fbf6b37b61af = [];
    agent.var_d544c62ea2bc64b = [];
    meansofdeath = killer = self waittill("death");
    if (getdvarint(@"hash_307fc239dc43be41", 0)) {
        return;
    }
    if (isdefined(meansofdeath) && meansofdeath == "MOD_DESPAWN") {
        return;
    }
    if (istrue(agent.nocorpse)) {
        return;
    }
    if (!isdefined(level.var_370eed78aa5c01a5)) {
        return;
    }
    var_38a6f3995a34460c = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "skipDeathCount");
    if (istrue(var_38a6f3995a34460c)) {
        return;
    }
    var_e99fb9eaa6b7c3db = 0;
    dropbackpack = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "dropBackpack");
    var_a31a0baedb971fe5 = istrue(var_e99fb9eaa6b7c3db) && (!isdefined(dropbackpack) || istrue(dropbackpack));
    var_63535454f47ff46a = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "weapon");
    killerweapon = undefined;
    var_c100a8c1add8b3 = undefined;
    if (isdefined(killer) && isplayer(killer)) {
        killerweapon = killer getcurrentweapon();
        var_c100a8c1add8b3 = killer getentitynumber();
    }
    agent.contents = [];
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    if (isdefined(level.var_d3fb932f0373554c)) {
        agent [[ level.var_d3fb932f0373554c ]](killer, dropstruct);
    }
    function_a29c2459dec85fde(agent, agenttype, var_63535454f47ff46a, killerweapon, !var_a31a0baedb971fe5, dropstruct);
    function_b66240f19684ff3a(agent, var_c100a8c1add8b3, !var_a31a0baedb971fe5, dropstruct);
    dropweapon = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "dropWeapon");
    shoulddropweapon = !isdefined(dropweapon) || istrue(dropweapon);
    if (isdefined(var_63535454f47ff46a) && shoulddropweapon) {
        weapondroporigin = agent.origin;
        var_885fb70d5302370b = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "weaponDropOrigin");
        if (isdefined(var_885fb70d5302370b)) {
            weapondroporigin = var_885fb70d5302370b;
        }
        maxammo = undefined;
        if (issubstr(var_63535454f47ff46a.basename, "lm_dblmg")) {
            maxammo = 1;
        }
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, weapondroporigin, agent.angles, agent, undefined, undefined, undefined, 1);
        var_ecb05727d56cd9f9 = namespace_d696adde758cbe79::getdefaultweaponammo(var_63535454f47ff46a, maxammo);
        var_35ead47ed0d7507e = var_ecb05727d56cd9f9[2];
        var_4f04b15053655ba = var_ecb05727d56cd9f9[1];
        ammo = var_ecb05727d56cd9f9[0];
        if (namespace_cd0b2d039510b38d::getsubgametype() == "dmz" && ammo < var_63535454f47ff46a.clipsize) {
            ammo = var_63535454f47ff46a.clipsize;
        }
        var_b55314bfaef43c59 = namespace_cb965d2f71fefddc::spawnpickup(var_63535454f47ff46a.basename, var_cb4fad49263e20c4, ammo, undefined, var_63535454f47ff46a, undefined, var_4f04b15053655ba, var_35ead47ed0d7507e);
        if (isdefined(var_b55314bfaef43c59)) {
            var_b55314bfaef43c59 setscriptablepartstate(var_b55314bfaef43c59.type, "dropped");
        }
        var_19f6fbd1c4bec7e9 = namespace_36f464722d326bbe::isbrstylegametype() && dropstruct.dropcount == 1;
        if (var_19f6fbd1c4bec7e9) {
            ammotype = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(var_63535454f47ff46a);
            if (isdefined(ammotype)) {
                var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, weapondroporigin, agent.angles, agent, undefined, undefined, undefined, 1);
                var_e3ab82cffd9e9b66 = int(level.br_pickups.counts[ammotype] * (1 + randomfloat(2)));
                item = namespace_cb965d2f71fefddc::spawnpickup(ammotype, var_cb4fad49263e20c4, var_e3ab82cffd9e9b66);
            }
        }
    }
    forceddrops = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "forcedDrops");
    if (isdefined(forceddrops)) {
        foreach (var_f96a2ea6b07e345c in forceddrops) {
            if (randomfloat(1) <= var_f96a2ea6b07e345c.dropchance) {
                function_305b1ba9c9b7f7b4(!var_a31a0baedb971fe5, var_f96a2ea6b07e345c, agent, dropstruct);
            }
        }
    }
    var_88732a0a3c17be02 = agent.category;
    var_dddf3a91daabebd2 = !issubstr(agenttype, "biolab") && function_15497e2309bc8671(isdefined(var_88732a0a3c17be02) && issubstr(var_88732a0a3c17be02, "fortress"));
    if (var_dddf3a91daabebd2) {
        keyname = ter_op(isdefined(level.var_4450f123bd5cd62e), level.var_4450f123bd5cd62e, "loot_key_fortress");
        if (issubstr(agenttype, "merc")) {
            if (namespace_36f464722d326bbe::function_e21746abaaaf8414()) {
                roll = randomint(100);
                if (roll < level.var_9c981303803aeab3) {
                    keyname = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(0, 1, 1, 0, 0, 0, 1, 0, 20, 60, 20, "sealion");
                }
            } else if (namespace_36f464722d326bbe::function_7ee65fae13124702()) {
                roll = randomint(100);
                if (roll < level.var_9c981303803aeab3) {
                    var_c7a4725d05bb7f22 = agentpers_getagentpersdata(agent, "tier");
                    switch (var_c7a4725d05bb7f22) {
                    case 1:
                        keyname = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(1, 0, 0, 0, 1, 0, 0, 0, 20, 60, 20, "sabacrash");
                        break;
                    case 2:
                        keyname = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(0, 1, 0, 1, 0, 80, 0, 10, 20, 60, 20, "sabacrash");
                        break;
                    case 3:
                        keyname = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(0, 0, 1, 1, 0, 0, 70, 20, 20, 60, 20, "sabacrash");
                        break;
                    default:
                        keyname = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(1, 0, 0, 0, 1, 0, 0, 0, 20, 60, 20, "sabacrash");
                        break;
                    }
                }
            }
        } else if (issubstr(agenttype, "aq")) {
            if (namespace_36f464722d326bbe::function_7ee65fae13124702()) {
                roll = randomint(100);
                if (roll < level.var_9c981303803aeab3) {
                    keyname = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(0, 0, 0, 1, 0, 0, 0, 1, 20, 60, 20);
                }
            }
        } else if (issubstr(agenttype, "cartel")) {
            if (namespace_36f464722d326bbe::function_7ee65fae13124702()) {
                roll = randomint(100);
                if (roll < level.var_9c981303803aeab3) {
                    keyname = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(0, 0, 0, 1, 0, 0, 0, 1, 20, 60, 20);
                }
            }
        } else if (issubstr(agenttype, "ru")) {
            if (namespace_36f464722d326bbe::function_5e0e3a24dbb1fae1()) {
                roll = randomint(100);
                if (roll < level.var_9c981303803aeab3) {
                    keyname = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(0, 0, 0, 1, 0, 0, 0, 1, 20, 60, 20, "delta");
                }
            }
        }
        var_e5fe6c50ec351711 = function_edabf4238e9d70b5(keyname, namespace_38b993c4618e76cd::getlootidfromref(keyname), keyname);
        function_305b1ba9c9b7f7b4(!var_a31a0baedb971fe5, var_e5fe6c50ec351711, agent, dropstruct);
    }
    if (!namespace_3f0ea7483345a2c0::iscontainerempty(agent) && var_a31a0baedb971fe5) {
        dropstruct.var_dfba5a2c3c6f0a07 = dropstruct.var_dfba5a2c3c6f0a07 + 2;
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, agent.origin, agent.angles, agent);
        var_87583859f07b58e3 = namespace_cb965d2f71fefddc::spawnpickup("brloot_backpack", var_cb4fad49263e20c4, 1);
        if (isdefined(var_87583859f07b58e3)) {
            var_87583859f07b58e3.contents = agent.contents;
            var_87583859f07b58e3.var_46a3a8565ac0c17c = 2;
        }
        callback = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "dropCallback");
        if (isdefined(callback)) {
            if (!isdefined(var_87583859f07b58e3)) {
                var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(drop_to_ground(agent.origin));
                var_87583859f07b58e3 = namespace_cb965d2f71fefddc::spawnpickup("brloot_backpack", var_cb4fad49263e20c4, 1);
                var_87583859f07b58e3.contents = agent.contents;
                var_87583859f07b58e3.var_46a3a8565ac0c17c = 2;
            }
            mission = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "mission");
            var_87583859f07b58e3.var_bbc200bc77c5db2b = 1;
            thread [[ callback ]](agent, var_87583859f07b58e3, mission);
        }
        if (isdefined(var_87583859f07b58e3) && isdefined(var_87583859f07b58e3.contents)) {
            foreach (item in var_87583859f07b58e3.contents) {
                if (isdefined(item["lootID"]) && isdefined(item["quantity"])) {
                    var_8003724ead57ba09[var_8003724ead57ba09.size] = item["lootID"];
                    var_15b6fbf6b37b61af[var_15b6fbf6b37b61af.size] = item["quantity"];
                }
            }
        }
    }
    agent.contents = undefined;
    if (getdvarint(@"hash_b79ef01dd49b83d2", 0) || namespace_cd0b2d039510b38d::getsubgametype() == "dmz" || namespace_cd0b2d039510b38d::getsubgametype() == "exgm") {
        if (!isdefined(level.var_45e6a8385ed4f50c)) {
            level.var_45e6a8385ed4f50c = getdvarfloat(@"hash_2cac446c3fbe830f", 0.95);
        }
        if (randomfloat(1) > level.var_45e6a8385ed4f50c && isdefined(agent)) {
            var_c1e53d069ac3a949 = spawnscriptable("vfx_dmz_blood_pool", agent.origin, agent.angles);
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, agent.origin, agent.angles, agent);
            var_a46d287f39a98d69 = namespace_cb965d2f71fefddc::spawnpickup("brloot_dead_agent_radio", var_cb4fad49263e20c4);
            if (isdefined(var_a46d287f39a98d69)) {
                var_a46d287f39a98d69.entitynumber = agent getentitynumber();
                var_a46d287f39a98d69.poi = poiname;
                var_a46d287f39a98d69.droppedteam = agent.agentteam;
                thread namespace_42a686cec336592f::function_fc9a15646315764c(var_a46d287f39a98d69);
            }
        }
    }
    if (isdefined(agent) && poiname == "saba_S5Reveal" && isdefined(level.var_27acc3a1e116209d) && randomfloat(1) < level.var_27acc3a1e116209d) {
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, agent.origin, agent.angles, agent);
        var_fee0552b747a5b17 = namespace_cb965d2f71fefddc::spawnpickup("brloot_reveal_agent_radio", var_cb4fad49263e20c4);
        if (isdefined(var_fee0552b747a5b17)) {
            level thread namespace_42a686cec336592f::function_fc9a15646315764c(var_fee0552b747a5b17);
        }
    }
    if (isdefined(agent.var_d544c62ea2bc64b)) {
        foreach (item in agent.var_d544c62ea2bc64b) {
            if (!isdefined(item.count)) {
                item.count = 1;
            }
            if (isdefined(item.lootid)) {
                droppeditems[droppeditems.size] = item.lootid;
                var_286de5b161dd4d9[var_286de5b161dd4d9.size] = item.count;
            }
        }
    }
    dlog_recordevent("dlog_event_dmz_ai_death", [0:"spawn_id", 1:var_9aa01c8bc06a2a47, 2:"ai_pos_x", 3:agent.origin[0], 4:"ai_pos_y", 5:agent.origin[1], 6:"ai_pos_z", 7:agent.origin[2], 8:"dropped_weapon", 9:ter_op(isdefined(var_63535454f47ff46a), var_63535454f47ff46a.basename, "undefined"), 10:"dropped_pack_contents", 11:var_8003724ead57ba09, 12:"dropped_pack_item_count", 13:var_15b6fbf6b37b61af, 14:"ground_items", 15:droppeditems, 16:"ground_item_count", 17:var_286de5b161dd4d9, 18:"match_time_elapsed", 19:gettime()]);
    agent.var_d544c62ea2bc64b = undefined;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10de2
// Size: 0x1f4
function private function_b66240f19684ff3a(agent, var_c100a8c1add8b3, var_c6d51abe72f8b012, dropstruct) {
    if (!isdefined(var_c100a8c1add8b3)) {
        return 0;
    }
    if (!isdefined(level.var_adbe2e8c944c2f1)) {
        level.var_4fc2ab8a1090c195 = 0;
    }
    if (!isdefined(level.var_aeb6974202e8f2db)) {
        level.var_aeb6974202e8f2db = [];
    }
    if (!isdefined(level.var_aeb6974202e8f2db[var_c100a8c1add8b3])) {
        level.var_aeb6974202e8f2db[var_c100a8c1add8b3] = 1;
    } else {
        level.var_aeb6974202e8f2db[var_c100a8c1add8b3] = level.var_aeb6974202e8f2db[var_c100a8c1add8b3] + 1;
    }
    var_4312b985c2b7c9a1 = getdvarint(@"hash_ed1c109feb095475", 0);
    var_3b73fa3a33104eee = getdvarint(@"hash_2a74dbbdee7b0dda", 5);
    var_5215312348d094a9 = getdvarint(@"hash_cc254e298e64f975", 10);
    var_c1569c52e0e8302c = getdvarint(@"hash_1ce4d184eeef06c8", 20);
    if (var_4312b985c2b7c9a1) {
        var_5298efb8454b371d = level.var_aeb6974202e8f2db[var_c100a8c1add8b3];
        var_526ece09009a248 = undefined;
        if (var_5298efb8454b371d == var_3b73fa3a33104eee) {
            var_526ece09009a248 = function_2958a3067f4af3af("agent_milestone_kills1", level.var_4fc2ab8a1090c195);
        } else if (var_5298efb8454b371d == var_5215312348d094a9) {
            var_526ece09009a248 = function_2958a3067f4af3af("agent_milestone_kills2", level.var_4fc2ab8a1090c195);
        } else if (var_5298efb8454b371d == var_c1569c52e0e8302c) {
            var_526ece09009a248 = function_2958a3067f4af3af("agent_milestone_kills3", level.var_4fc2ab8a1090c195);
        }
        if (isdefined(var_526ece09009a248)) {
            foreach (var_5b63aed4a779b0aa in var_526ece09009a248) {
                function_305b1ba9c9b7f7b4(var_c6d51abe72f8b012, var_5b63aed4a779b0aa, agent, dropstruct);
            }
            level.var_4fc2ab8a1090c195 = level.var_4fc2ab8a1090c195 + 1;
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10fdd
// Size: 0x236
function private function_a29c2459dec85fde(agent, agenttype, var_63535454f47ff46a, killerweapon, var_c6d51abe72f8b012, dropstruct) {
    var_597b60c5387d1344 = function_e266e0dfc04c07a9();
    var_85ad9c82d49013c0 = 0;
    droparmor = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "dropArmor");
    if (!isdefined(droparmor) || istrue(droparmor)) {
        var_dbb496f03bd142a0 = function_bc5d7ff26ad67a45(agent, agenttype);
        if (getdvarint(@"hash_f262cc542053d01c", 0) == 1) {
            function_305b1ba9c9b7f7b4(var_c6d51abe72f8b012, function_4fc5b97f88757e83(var_dbb496f03bd142a0), agent, dropstruct);
            var_85ad9c82d49013c0++;
        } else {
            var_597b60c5387d1344 = function_6b1dc8167c1c7378(var_597b60c5387d1344, var_dbb496f03bd142a0);
        }
    }
    dropgrenade = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "dropGrenade");
    if (!isdefined(dropgrenade) || istrue(dropgrenade)) {
        var_4a354a51b7352ef8 = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "grenadeType");
        if (isdefined(var_4a354a51b7352ef8)) {
            var_597b60c5387d1344 = function_d0f2ec7f450fcb7(var_597b60c5387d1344, var_4a354a51b7352ef8, agent.grenadeammo);
        }
    }
    dropammo = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "dropAmmo");
    if (!isdefined(dropammo) || istrue(dropammo)) {
        var_597b60c5387d1344 = function_4fd2e36bfd98b4c2(var_597b60c5387d1344, var_63535454f47ff46a, killerweapon);
    }
    if (!isdefined(level.var_b9a2a6440daf029)) {
        level.var_b9a2a6440daf029 = getdvarfloat(@"hash_3545ca86ff96cb37", 0.34);
    }
    var_2b4dbedaecf1251d = getdvarint(@"hash_df87d80be0df6f2e", 0);
    if (var_2b4dbedaecf1251d == 0) {
        var_2b4dbedaecf1251d = ter_op(randomfloat(1) > level.var_b9a2a6440daf029, 0, int(ceil(1 / level.var_b9a2a6440daf029)) + ter_op(randomfloat(1) < 0.4, 1, 0));
    }
    while (var_85ad9c82d49013c0 < var_2b4dbedaecf1251d) {
        var_74c58851d21ecff0 = random(var_597b60c5387d1344);
        if (!isdefined(var_74c58851d21ecff0)) {
            break;
        }
        if (randomfloat(1) < var_74c58851d21ecff0.dropchance) {
            function_305b1ba9c9b7f7b4(var_c6d51abe72f8b012, var_74c58851d21ecff0, agent, dropstruct);
            var_85ad9c82d49013c0++;
            var_597b60c5387d1344 = array_remove(var_597b60c5387d1344, var_74c58851d21ecff0);
        }
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1121a
// Size: 0xaf
function private function_79946c09ebe3b406(var_8051a869c25eb076, var_78ebfe48861e28d8) {
    var_c4bbe0143cbb761 = undefined;
    var_a6825f20b535b471 = getscriptcachecontents(var_8051a869c25eb076, var_78ebfe48861e28d8);
    if (isdefined(var_a6825f20b535b471)) {
        var_c4bbe0143cbb761 = [];
        foreach (var_2f44e3b98c77c7cc in var_a6825f20b535b471) {
            var_c4bbe0143cbb761[var_c4bbe0143cbb761.size] = function_edabf4238e9d70b5(var_2f44e3b98c77c7cc, namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_2f44e3b98c77c7cc), var_2f44e3b98c77c7cc, 1, level.br_pickups.counts[var_2f44e3b98c77c7cc]);
        }
    }
    return var_c4bbe0143cbb761;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x112d1
// Size: 0x30
function private function_2958a3067f4af3af(var_8051a869c25eb076, var_78ebfe48861e28d8) {
    var_c4bbe0143cbb761 = function_79946c09ebe3b406(var_8051a869c25eb076, var_78ebfe48861e28d8);
    if (!isdefined(var_c4bbe0143cbb761)) {
        var_c4bbe0143cbb761 = [];
    }
    return var_c4bbe0143cbb761;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11309
// Size: 0x7c
function private function_e266e0dfc04c07a9() {
    if (!isdefined(level.var_8973f9da378e47d)) {
        level.var_8973f9da378e47d = 0;
    }
    var_c4bbe0143cbb761 = function_79946c09ebe3b406("agent_backpack", level.var_8973f9da378e47d);
    if (!isdefined(var_c4bbe0143cbb761)) {
        if (level.var_8973f9da378e47d != 0) {
            level.var_8973f9da378e47d = 0;
            var_c4bbe0143cbb761 = function_e266e0dfc04c07a9();
            return var_c4bbe0143cbb761;
        } else {
            var_c4bbe0143cbb761 = [];
        }
    }
    level.var_8973f9da378e47d = level.var_8973f9da378e47d + 1;
    return var_c4bbe0143cbb761;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1138d
// Size: 0x6f
function private function_d0f2ec7f450fcb7(var_c4bbe0143cbb761, grenadetype, grenadecount) {
    if (grenadecount > 0) {
        grenadecount = int(min(grenadecount, 2));
        var_eacd3effdadd831e = namespace_1a507865f681850e::function_7f245729fcb6414d(grenadetype);
        if (!isdefined(var_eacd3effdadd831e)) {
            return var_c4bbe0143cbb761;
        }
        var_c4bbe0143cbb761[var_c4bbe0143cbb761.size] = function_edabf4238e9d70b5(level.var_370eed78aa5c01a5[grenadetype], namespace_38b993c4618e76cd::getlootidfromref(var_eacd3effdadd831e), var_eacd3effdadd831e, 1, grenadecount);
    }
    return var_c4bbe0143cbb761;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11404
// Size: 0x9e
function private function_4fd2e36bfd98b4c2(var_c4bbe0143cbb761, var_63535454f47ff46a, killerweapon) {
    if (!isdefined(var_63535454f47ff46a)) {
        return var_c4bbe0143cbb761;
    }
    var_f8c397f70608abc = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(var_63535454f47ff46a);
    if (isdefined(killerweapon) && (!isdefined(var_f8c397f70608abc) || cointoss())) {
        var_5aba2fff7e326f4d = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(killerweapon);
        if (isdefined(var_5aba2fff7e326f4d)) {
            var_f8c397f70608abc = var_5aba2fff7e326f4d;
        }
    }
    if (!isdefined(var_f8c397f70608abc)) {
        return var_c4bbe0143cbb761;
    }
    var_c4bbe0143cbb761[var_c4bbe0143cbb761.size] = function_edabf4238e9d70b5(var_f8c397f70608abc, namespace_38b993c4618e76cd::getlootidfromref(var_f8c397f70608abc), var_f8c397f70608abc, 1, level.br_pickups.counts[var_f8c397f70608abc] * 2);
    return var_c4bbe0143cbb761;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x114aa
// Size: 0x21
function private function_6b1dc8167c1c7378(var_c4bbe0143cbb761, var_f7ea2887b1e3535b) {
    var_c4bbe0143cbb761[var_c4bbe0143cbb761.size] = function_4fc5b97f88757e83(var_f7ea2887b1e3535b);
    return var_c4bbe0143cbb761;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x114d3
// Size: 0x2d
function private function_4fc5b97f88757e83(var_f7ea2887b1e3535b) {
    return function_edabf4238e9d70b5("brloot_armor_plate", namespace_38b993c4618e76cd::getlootidfromref("armor_plate"), "armor_plate", 1, var_f7ea2887b1e3535b);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11508
// Size: 0x51
function private function_bc5d7ff26ad67a45(agent, agenttype) {
    tier = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "tier");
    if (issubstr(agenttype, "jugg")) {
        return 3;
    } else if (isdefined(tier) && tier > 1) {
        return 2;
    }
    return 1;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11561
// Size: 0x102
function function_edabf4238e9d70b5(scriptablename, lootid, ref, dropchance, count, var_b926a393855a8b89, var_557507ad5619daca, visibilitycondition, var_69f4f638abf12fbf) {
    struct = spawnstruct();
    struct.scriptablename = scriptablename;
    struct.lootid = lootid;
    struct.ref = ref;
    struct.dropchance = ter_op(isdefined(dropchance), dropchance, 1);
    struct.count = ter_op(isdefined(count), count, 1);
    struct.var_b926a393855a8b89 = var_b926a393855a8b89;
    struct.callback = var_557507ad5619daca;
    struct.visibilitycondition = visibilitycondition;
    struct.var_69f4f638abf12fbf = var_69f4f638abf12fbf;
    struct.var_b30d9f22e554e6ee = function_c7663426fbfda6f3(scriptablename);
    return struct;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1166b
// Size: 0x5f
function private function_c7663426fbfda6f3(scriptablename) {
    isequipment = isdefined(scriptablename) && namespace_d3d40f75bb4e4c32::isequipment(scriptablename);
    isarmor = isdefined(scriptablename) && namespace_d3d40f75bb4e4c32::isarmor(scriptablename);
    isammo = isdefined(scriptablename) && namespace_d3d40f75bb4e4c32::isammo(scriptablename);
    return isequipment || isarmor || isammo;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x116d2
// Size: 0x316
function private function_305b1ba9c9b7f7b4(var_c6d51abe72f8b012, var_1be58aa13ba9f7da, agent, dropstruct) {
    if (!isdefined(level.var_8a7f9029342f8cb9)) {
        level.var_8a7f9029342f8cb9 = [];
    }
    if (istrue(var_1be58aa13ba9f7da.var_b926a393855a8b89)) {
        if (istrue(level.var_8a7f9029342f8cb9[var_1be58aa13ba9f7da.lootid])) {
            return 0;
        } else {
            level.var_8a7f9029342f8cb9[var_1be58aa13ba9f7da.lootid] = 1;
        }
    }
    if (!isdefined(level.var_7c24540cb1744ad9)) {
        level.var_7c24540cb1744ad9 = getdvarint(@"hash_6991420ca3598113", 1);
    }
    var_c6d51abe72f8b012 = var_c6d51abe72f8b012 | (level.var_7c24540cb1744ad9 && istrue(var_1be58aa13ba9f7da.var_b30d9f22e554e6ee));
    var_c6d51abe72f8b012 = var_c6d51abe72f8b012 | getdvarint(@"hash_142657a7943b806a", 0);
    if (var_c6d51abe72f8b012 && isdefined(var_1be58aa13ba9f7da.scriptablename)) {
        count = 1;
        if (isdefined(var_1be58aa13ba9f7da.count)) {
            count = var_1be58aa13ba9f7da.count;
        }
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, agent.origin, agent.angles, agent);
        if (namespace_85cd45b4fe0d86fb::function_3c17a26ce6a4668(var_1be58aa13ba9f7da.lootid)) {
            var_ecabd227d567bfa3 = namespace_85cd45b4fe0d86fb::function_379463a84adb07b4(var_1be58aa13ba9f7da.count);
            var_dab81ead77442a10 = var_ecabd227d567bfa3[2];
            var_59bd51afc73df2cd = var_ecabd227d567bfa3[1];
            itemcount = var_ecabd227d567bfa3[0];
            spawned = namespace_cb965d2f71fefddc::spawnpickup(var_1be58aa13ba9f7da.scriptablename, var_cb4fad49263e20c4, itemcount, 0, undefined, 0, var_59bd51afc73df2cd, var_dab81ead77442a10);
        } else {
            spawned = namespace_cb965d2f71fefddc::spawnpickup(var_1be58aa13ba9f7da.scriptablename, var_cb4fad49263e20c4, count);
        }
        if (isdefined(spawned)) {
            spawned setscriptablepartstate(spawned.type, "dropped");
        }
        if (!isdefined(agent.var_d544c62ea2bc64b)) {
            agent.var_d544c62ea2bc64b = [];
        }
        agent.var_d544c62ea2bc64b[agent.var_d544c62ea2bc64b.size] = var_1be58aa13ba9f7da;
        return 1;
    } else if (!var_c6d51abe72f8b012) {
        var_a6f8d8115e0f1e79 = agent.contents.size;
        agent.contents[var_a6f8d8115e0f1e79] = [];
        agent.contents[var_a6f8d8115e0f1e79]["lootID"] = var_1be58aa13ba9f7da.lootid;
        agent.contents[var_a6f8d8115e0f1e79]["quantity"] = var_1be58aa13ba9f7da.count;
        agent.contents[var_a6f8d8115e0f1e79]["visibilityCondition"] = var_1be58aa13ba9f7da.visibilitycondition;
        if (isdefined(var_1be58aa13ba9f7da.callback)) {
            agent.contents[var_a6f8d8115e0f1e79]["callback"] = var_1be58aa13ba9f7da.callback;
        }
        if (isdefined(var_1be58aa13ba9f7da.var_69f4f638abf12fbf)) {
            namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "dropCallback", var_1be58aa13ba9f7da.var_69f4f638abf12fbf);
        }
        return 0;
    }
    return 0;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x119f0
// Size: 0x95
function private function_15497e2309bc8671(var_f1aef3eefc117534) {
    result = 0;
    var_faf0d2fac3f47583 = namespace_cd0b2d039510b38d::getsubgametype();
    switch (var_faf0d2fac3f47583) {
    case #"hash_cfb0c3041d1bdc10":
    case #"hash_f4afff6c03d92aa0":
        result = function_32dc1e6e351c8b4d(var_f1aef3eefc117534);
        break;
    case #"hash_3c1c1566d7b3b870":
    case #"hash_dddecc2751311914":
    case #"hash_fa21c4f6bd5e3815":
        result = function_58681402ec6c855e(var_f1aef3eefc117534);
        break;
    default:
        return 0;
        break;
    }
    return result;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11a8d
// Size: 0xe7
function private function_32dc1e6e351c8b4d(var_f1aef3eefc117534) {
    if (getdvarint(@"hash_8fbb625100a40644", 1) == 0) {
        return 0;
    }
    if (!isdefined(level.var_fc7f3410261c195)) {
        level.var_fc7f3410261c195 = 1;
    }
    if (!isdefined(level.var_c466cc3233c90122)) {
        level.var_c466cc3233c90122 = function_2234322152162663(level.var_fc7f3410261c195);
    }
    if (istrue(var_f1aef3eefc117534)) {
        level.var_c466cc3233c90122 = level.var_c466cc3233c90122 - 3;
    } else {
        level.var_c466cc3233c90122 = level.var_c466cc3233c90122 - 1;
    }
    if (level.var_c466cc3233c90122 <= 0) {
        if (level.var_fc7f3410261c195 < level.var_ef668b618c1c7ec0) {
            level.var_fc7f3410261c195 = level.var_fc7f3410261c195 + 1;
        }
        level.var_c466cc3233c90122 = function_2234322152162663(level.var_fc7f3410261c195);
        return 1;
    }
    return 0;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11b7c
// Size: 0xd
function private function_58681402ec6c855e(var_f1aef3eefc117534) {
    return 0;
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11b91
// Size: 0x19
function private function_2234322152162663(multiplier) {
    return randomintrange(3 * multiplier, 5 * multiplier);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11bb2
// Size: 0xda
function function_46c2d826ebb9e2cc(owner, origin, radius) {
    owner endon("death");
    streakname = "precision_airstrike";
    animname = level.scr_anim["precision_airstrike"]["airstrike_flyby"];
    var_4c4796c182975686 = getanimlength(animname);
    var_b333ee8fea365230 = var_4c4796c182975686 - 5;
    if (!isdefined(radius)) {
        radius = 0;
    }
    origin = origin + (randomfloatrange(-1 * radius, radius), randomfloatrange(-1 * radius, radius), 0);
    streakinfo = namespace_9abe40d2af041eb2::createstreakinfo(streakname, owner);
    namespace_9abe40d2af041eb2::killstreak_dangernotifyplayersinrange(owner, owner.team, 2048, streakname, origin);
    namespace_203b58a09d020a50::callstrike(owner, origin, undefined, undefined, streakinfo, animname);
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c93
// Size: 0x163
function function_4a618b49270cfd25(owner, origin, radius) {
    owner endon("death");
    streakname = "toma_strike";
    var_a3f9130b1d11dffb = randomintrange(3, 6);
    var_ebfc9454321cb5c3 = 1;
    streakinfo = namespace_9abe40d2af041eb2::createstreakinfo(streakname, owner);
    var_d77253c873d2b420 = anglestoforward(owner.angles);
    ownerforward = anglestoforward(owner.angles);
    var_3c5a1b26c6973c2a = anglestoright(owner.angles);
    if (!isdefined(radius)) {
        radius = 0;
    }
    origin = origin + (randomfloatrange(-1 * radius, radius), randomfloatrange(-1 * radius, radius), 0);
    namespace_9abe40d2af041eb2::killstreak_dangernotifyplayersinrange(owner, owner.team, 2048, streakname, origin);
    for (j = 0; j < var_a3f9130b1d11dffb; j++) {
        var_fa378e997a33a137 = owner namespace_25d6bd23fd862a00::findunobstructedfiringinfo(origin, 1024, var_d77253c873d2b420, ownerforward, var_3c5a1b26c6973c2a);
        owner thread namespace_25d6bd23fd862a00::tomastrike_firestrike(var_ebfc9454321cb5c3, var_fa378e997a33a137, streakinfo);
        timetowait = randomfloatrange(0.25, 1);
        wait(timetowait);
    }
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11dfd
// Size: 0x90
function function_97f7612a16157077(var_a4e4a71852a83d8f, var_ba5196c78dfda051) {
    /#
        var_92db85c8dcf21152 = spawnstruct();
        var_92db85c8dcf21152.spawnorigin = var_a4e4a71852a83d8f.origin;
        var_92db85c8dcf21152.var_1cff9e659279986 = var_a4e4a71852a83d8f.var_c5e7fce963586ec0;
        var_92db85c8dcf21152.var_c89b8b8cc1b9bbd0 = var_a4e4a71852a83d8f.var_4583939a603f7170;
        var_92db85c8dcf21152.var_ba5196c78dfda051 = var_ba5196c78dfda051;
        var_92db85c8dcf21152.var_cefcc72523870811 = 0;
        level.var_a24b3aaa582fe5e3 = var_92db85c8dcf21152;
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e94
// Size: 0x90
function function_63bc1945791044c9() {
    /#
        while (!isdefined(level.struct_class_names)) {
            waitframe();
        }
        wait(1);
        level.var_f43197e4f524c1f7 = getstructarray("<unknown string>", "<unknown string>");
        var_fc617751f654a141 = getdvarint(@"hash_98d02294a9885211", 0);
        for (i = 0; i < var_fc617751f654a141; i++) {
            if (isdefined(level.var_f43197e4f524c1f7[i])) {
                agent = function_a04953ad5de27960(level.var_f43197e4f524c1f7[i]);
            }
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11f2b
// Size: 0x69
function function_a04953ad5de27960(node) {
    /#
        aitype = function_d5bc07eabf352abb(node);
        agent = ai_mp_requestspawnagent(aitype, node.origin, node.angles, "<unknown string>", "<unknown string>", "<unknown string>");
        if (isdefined(agent)) {
            agent thread function_9bbf1713a14fa580(agent);
        }
        return agent;
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11f9b
// Size: 0xdb
function function_316bbc591b24792a() {
    /#
        while (1) {
            foreach (agent in level.agentarray) {
                if (!isalive(agent)) {
                    continue;
                }
                foreach (player in level.players) {
                    if (agent cansee(player)) {
                        println("<unknown string>");
                    } else {
                        var_be2006030ad6e614 = 0;
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1207d
// Size: 0x1c9
function function_bd78689b17ee5ca5(var_354cbd170c838a4e, var_354cbe170c838c81, poiname, var_49a4b116c64a17ed) {
    /#
        printtoscreen2d(var_354cbd170c838a4e, var_354cbe170c838c81, poiname, var_49a4b116c64a17ed, 2);
        printtoscreen2d(var_354cbd170c838a4e, var_354cbe170c838c81 + 20, "<unknown string>", var_49a4b116c64a17ed, 1);
        printtoscreen2d(var_354cbd170c838a4e, var_354cbe170c838c81 + 40, "<unknown string>" + function_abbd4595d76ccc5e(poiname, "<unknown string>"), (0, 0, 1), 1);
        printtoscreen2d(var_354cbd170c838a4e, var_354cbe170c838c81 + 60, "<unknown string>" + function_abbd4595d76ccc5e(poiname, "<unknown string>"), (0, 1, 1), 1);
        printtoscreen2d(var_354cbd170c838a4e, var_354cbe170c838c81 + 80, "<unknown string>" + function_abbd4595d76ccc5e(poiname, "<unknown string>"), (1, 0.5, 0), 1);
        printtoscreen2d(var_354cbd170c838a4e, var_354cbe170c838c81 + 100, "<unknown string>" + function_abbd4595d76ccc5e(poiname, "<unknown string>"), (1, 0, 0), 1);
        printtoscreen2d(var_354cbd170c838a4e, var_354cbe170c838c81 + 120, "<unknown string>" + function_abbd4595d76ccc5e(poiname, "<unknown string>"), (1, 0, 0), 1);
        printtoscreen2d(var_354cbd170c838a4e, var_354cbe170c838c81 + 140, "<unknown string>" + function_abbd4595d76ccc5e(poiname, "<unknown string>"), (0, 1, 0), 1);
        printtoscreen2d(var_354cbd170c838a4e, var_354cbe170c838c81 + 160, "<unknown string>" + function_abbd4595d76ccc5e(poiname, "<unknown string>"), (1, 1, 1), 1);
        printtoscreen2d(var_354cbd170c838a4e, var_354cbe170c838c81 + 180, "<unknown string>" + function_abbd4595d76ccc5e(poiname, "<unknown string>"), (1, 1, 1), 1);
        printtoscreen2d(var_354cbd170c838a4e, var_354cbe170c838c81 + 200, "<unknown string>" + function_abbd4595d76ccc5e(poiname, "<unknown string>"), (0, 0, 1), 1);
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1224d
// Size: 0x5e0
function function_7b85b68e72867306(var_8b878c2e872c4bc3) {
    /#
        var_354cbd170c838a4e = 100;
        var_354cbe170c838c81 = 100;
        var_a2d7918a1c23c968 = [];
        var_a2d7918a1c23c968["<unknown string>"] = "<unknown string>";
        var_a2d7918a1c23c968["<unknown string>"] = "<unknown string>";
        var_a2d7918a1c23c968["<unknown string>"] = "<unknown string>";
        var_a2d7918a1c23c968["<unknown string>"] = "<unknown string>";
        var_a2d7918a1c23c968["<unknown string>"] = "<unknown string>";
        var_a2d7918a1c23c968["<unknown string>"] = "<unknown string>";
        var_a2d7918a1c23c968["<unknown string>"] = "<unknown string>";
        var_a2d7918a1c23c968["<unknown string>"] = "<unknown string>";
        var_a2d7918a1c23c968["priority_set: Can't be called on undefined agents"] = "<unknown string>";
        var_a2d7918a1c23c968["<unknown string>"] = "<unknown string>";
        foreach (poiname in level.var_dbb3dd5ab77ccd48) {
            dvarstring = function_2ef675c13ca1c4af(@"hash_831b14ba4dbdd316", poiname, "<unknown string>");
            if (getdvarint(dvarstring, 0) == 1 || getdvarint(@"hash_6e6e9391065dc426", 0)) {
                /#
                    assertex(isdefined(level.var_41670c1c65f3d3cf.poi[poiname]), poiname + "<unknown string>");
                #/
                if (isdefined(level.var_41670c1c65f3d3cf.poi[poiname])) {
                    if (!var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].outlined) {
                        var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].outlined = 1;
                        foreach (agent in function_7e3f22e620f3f71e(poiname, "<unknown string>")) {
                            if (isalive(agent)) {
                                var_4430b08d5a2d47bf = "<unknown string>";
                                if (isdefined(agent.category) && isdefined(var_a2d7918a1c23c968[agent.category])) {
                                    var_4430b08d5a2d47bf = var_a2d7918a1c23c968[agent.category];
                                } else {
                                    /#
                                        assertmsg("<unknown string>" + poiname + "<unknown string>" + agent.category);
                                    #/
                                }
                                id = namespace_cbd3754a0c69cc63::outlineenableforall(agent, var_4430b08d5a2d47bf, "<unknown string>");
                                if (!isdefined(var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].agents[id])) {
                                    var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].agents[id] = agent;
                                    agent.outlined = 1;
                                }
                            }
                        }
                    } else if (var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].numagents != function_abbd4595d76ccc5e(poiname, "<unknown string>")) {
                        if (var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].numagents < function_abbd4595d76ccc5e(poiname, "<unknown string>")) {
                            foreach (agent in function_7e3f22e620f3f71e(poiname, "<unknown string>")) {
                                if (isalive(agent) && (!isdefined(agent.outlined) || !agent.outlined)) {
                                    var_4430b08d5a2d47bf = "<unknown string>";
                                    if (isdefined(agent.category) && isdefined(var_a2d7918a1c23c968[agent.category])) {
                                        var_4430b08d5a2d47bf = var_a2d7918a1c23c968[agent.category];
                                    } else {
                                        /#
                                            assertmsg("<unknown string>" + poiname + "<unknown string>" + agent.category);
                                        #/
                                    }
                                    id = namespace_cbd3754a0c69cc63::outlineenableforall(agent, var_4430b08d5a2d47bf, "<unknown string>");
                                    if (!isdefined(var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].agents[id])) {
                                        var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].agents[id] = agent;
                                        agent.outlined = 1;
                                    }
                                }
                            }
                        }
                        var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].numagents = function_abbd4595d76ccc5e(poiname, "<unknown string>");
                    }
                }
                if (array_contains(level.var_ab20b3a256911579, poiname)) {
                    var_49a4b116c64a17ed = (1, 0, 0);
                } else {
                    var_49a4b116c64a17ed = (0, 1, 0);
                }
                if (isdefined(level.var_41670c1c65f3d3cf.poi[poiname])) {
                    function_bd78689b17ee5ca5(var_354cbd170c838a4e, var_354cbe170c838c81, poiname, var_49a4b116c64a17ed);
                }
                var_354cbd170c838a4e = var_354cbd170c838a4e + 200;
                if (var_354cbd170c838a4e == 1700) {
                    var_354cbd170c838a4e = 100;
                    var_354cbe170c838c81 = 400;
                }
            } else if (isdefined(level.var_41670c1c65f3d3cf.poi[poiname])) {
                if (getdvarint(dvarstring, 0) == 0 && var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].outlined) {
                    foreach (id, agent in var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].agents) {
                        if (isalive(agent)) {
                            namespace_cbd3754a0c69cc63::outlinedisable(id, agent);
                        }
                        var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].agents[id] = undefined;
                        var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].outlined = 0;
                        agent.outlined = undefined;
                    }
                }
            }
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12834
// Size: 0x14b
function function_116a9a03ed8bebee(var_bf917e6df365587f) {
    /#
        var_bf917e6df365587f.var_bf6f64b1ed5bfb76 = !getdvarint(@"hash_ddc16ff13bb547db", 0);
        if (!var_bf917e6df365587f.var_bf6f64b1ed5bfb76) {
            if (!isdefined(level.agentarray)) {
                return;
            }
            foreach (agent in level.agentarray) {
                if (isalive(agent)) {
                    if (isdefined(agent.outlines) && agent.outlines.size > 0) {
                        continue;
                    }
                    id = namespace_cbd3754a0c69cc63::outlineenableforall(agent, "<unknown string>", "<unknown string>");
                    var_bf917e6df365587f.var_e61277ece16d3144[id] = agent;
                }
            }
        } else {
            foreach (id, agent in var_bf917e6df365587f.var_e61277ece16d3144) {
                if (isalive(agent)) {
                    namespace_cbd3754a0c69cc63::outlinedisable(id, agent);
                }
                var_bf917e6df365587f.var_e61277ece16d3144[id] = undefined;
            }
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12986
// Size: 0x30a
function function_f44f49a345c4a1f0(var_ae626a6e4fde83b2) {
    /#
        if (getdvarint(@"hash_eea0b8db6857e8e1", 0) == 1) {
            if (var_ae626a6e4fde83b2.var_4ed3980e80a4c5c9) {
                var_ae626a6e4fde83b2.var_4ed3980e80a4c5c9 = 0;
                foreach (agent in function_7eb04ca16d045775("<unknown string>")) {
                    if (isalive(agent) && distance(level.player.origin, agent.origin) < getdvarint(@"hash_354e12ea3dd218ff", 5000)) {
                        id = namespace_cbd3754a0c69cc63::outlineenableforall(agent, "<unknown string>", "<unknown string>");
                        if (!isdefined(var_ae626a6e4fde83b2.var_69a1fe96c22ba481[id])) {
                            var_ae626a6e4fde83b2.var_69a1fe96c22ba481[id] = agent;
                        }
                    }
                }
            }
        } else if (!var_ae626a6e4fde83b2.var_4ed3980e80a4c5c9) {
            var_ae626a6e4fde83b2.var_4ed3980e80a4c5c9 = 1;
            foreach (id, agent in var_ae626a6e4fde83b2.var_69a1fe96c22ba481) {
                if (isalive(agent)) {
                    namespace_cbd3754a0c69cc63::outlinedisable(id, agent);
                }
                var_ae626a6e4fde83b2.var_69a1fe96c22ba481[id] = undefined;
            }
        }
        if (getdvarint(@"hash_98991913f1b99ae3", 0) == 1) {
            if (var_ae626a6e4fde83b2.var_5ae85deb34a2b36e) {
                var_ae626a6e4fde83b2.var_5ae85deb34a2b36e = 0;
                foreach (agent in function_7eb04ca16d045775("<unknown string>")) {
                    if (isalive(agent) && agent.category != "<unknown string>" && distance(level.player.origin, agent.origin) < getdvarint(@"hash_354e12ea3dd218ff", 5000)) {
                        id = namespace_cbd3754a0c69cc63::outlineenableforall(agent, "<unknown string>", "<unknown string>");
                        if (!isdefined(var_ae626a6e4fde83b2.var_69a1fe96c22ba481[id])) {
                            var_ae626a6e4fde83b2.var_69a1fe96c22ba481[id] = agent;
                        }
                    }
                }
            }
        } else if (!var_ae626a6e4fde83b2.var_5ae85deb34a2b36e) {
            var_ae626a6e4fde83b2.var_5ae85deb34a2b36e = 1;
            foreach (id, agent in var_ae626a6e4fde83b2.var_69a1fe96c22ba481) {
                if (isalive(agent)) {
                    namespace_cbd3754a0c69cc63::outlinedisable(id, agent);
                }
                var_ae626a6e4fde83b2.var_69a1fe96c22ba481[id] = undefined;
            }
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12c97
// Size: 0x28d
function function_8366a665eecd13aa() {
    /#
        level endon("<unknown string>");
        setdvarifuninitialized(@"hash_6e6e9391065dc426", 0);
        var_8b878c2e872c4bc3 = spawnstruct();
        var_8b878c2e872c4bc3.var_6ad2d5385a612cd5 = [];
        wait(2);
        foreach (poiname in level.var_dbb3dd5ab77ccd48) {
            if (!isdefined(level.var_41670c1c65f3d3cf.poi[poiname])) {
                continue;
            }
            command = "<unknown string>" + poiname + "<unknown string>" + poiname + "<unknown string>";
            adddebugcommand(command);
            var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname] = spawnstruct();
            var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].outlined = 0;
            var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].agents = [];
            var_8b878c2e872c4bc3.var_6ad2d5385a612cd5[poiname].numagents = function_abbd4595d76ccc5e(poiname, "<unknown string>");
            setdvarifuninitialized(function_2ef675c13ca1c4af(@"hash_831b14ba4dbdd316", poiname, "<unknown string>"), 0);
            wait(0.1);
            command = "<unknown string>" + poiname + "<unknown string>" + poiname + "<unknown string>";
            adddebugcommand(command);
            wait(0.1);
            setdvarifuninitialized(function_2ef675c13ca1c4af(@"hash_831b14ba4dbdd316", poiname, "<unknown string>"), 0);
            command = "<unknown string>" + poiname + "<unknown string>" + poiname + "<unknown string>";
            adddebugcommand(command);
            wait(0.1);
            setdvarifuninitialized(function_2ef675c13ca1c4af(@"hash_831b14ba4dbdd316", poiname, "<unknown string>"), 0);
            command = "<unknown string>" + poiname + "<unknown string>" + poiname + "<unknown string>";
            adddebugcommand(command);
            wait(0.1);
            setdvarifuninitialized(function_2ef675c13ca1c4af(@"hash_831b14ba4dbdd316", poiname, "<unknown string>"), 0);
            command = "<unknown string>" + poiname + "<unknown string>" + poiname + "<unknown string>";
            adddebugcommand(command);
            wait(0.1);
            setdvarifuninitialized(function_2ef675c13ca1c4af(@"hash_831b14ba4dbdd316", poiname, "<unknown string>"), 0);
            wait(0.2);
        }
        level thread function_8b97c47b557d1c58();
        level thread function_9fae03fa905ef5ce();
        level thread function_8c74d71ffba1bda8();
        level thread function_389b1801f508c3f0();
        while (1) {
            function_7b85b68e72867306(var_8b878c2e872c4bc3);
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12f2b
// Size: 0xfc
function function_4c9c67fd4525f9fe() {
    /#
        level endon("<unknown string>");
        setdvarifuninitialized(@"hash_eea0b8db6857e8e1", 0);
        setdvarifuninitialized(@"hash_98991913f1b99ae3", 0);
        setdvarifuninitialized(@"hash_ddc16ff13bb547db", 0);
        setdvarifuninitialized(@"hash_eea0b8db6857e8e1", 0);
        setdvarifuninitialized(@"hash_bcbe3309344bb6d2", 0);
        setdvarifuninitialized(@"hash_9e9be127028294d2", 0);
        setdvarifuninitialized(@"hash_354e12ea3dd218ff", 5000);
        var_bf917e6df365587f = spawnstruct();
        var_bf917e6df365587f.var_e61277ece16d3144 = [];
        var_bf917e6df365587f.var_bf6f64b1ed5bfb76 = 1;
        var_ae626a6e4fde83b2 = spawnstruct();
        var_ae626a6e4fde83b2.var_69a1fe96c22ba481 = [];
        var_ae626a6e4fde83b2.var_4ed3980e80a4c5c9 = 1;
        var_ae626a6e4fde83b2.var_5ae85deb34a2b36e = 1;
        while (1) {
            function_116a9a03ed8bebee(var_bf917e6df365587f);
            function_f44f49a345c4a1f0(var_ae626a6e4fde83b2);
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1302e
// Size: 0x14ce
function function_576ed049f93d9496() {
    /#
        level endon("<unknown string>");
        setdevdvar(@"hash_834fda4cebd6161e", 0);
        while (1) {
            if (getdvarint(@"hash_7e32df0ad3c385c1", 0) == 1) {
                setdevdvar(@"hash_c5b31ff1b47a0f69", 0);
                setdevdvar(@"hash_3493aa8adc34457e", 0);
                setdevdvar(@"hash_2b47d7c6e19149b9", 0);
                setdevdvar(@"hash_834fda4cebd6161e", 0);
                setdevdvar(@"hash_7f1d33bb4719a3c2", 0);
                setdevdvar(@"hash_ddc16ff13bb547db", 0);
                setdevdvar(@"hash_eea0b8db6857e8e1", 0);
                setdevdvar(@"hash_98991913f1b99ae3", 0);
                setdevdvar(@"hash_1d8682eb59219492", 0);
                setdevdvar(@"hash_bcbe3309344bb6d2", 0);
                setdevdvar(@"hash_9e9be127028294d2", 0);
                setdevdvar(@"hash_7e32df0ad3c385c1", 0);
                foreach (poiname, poi in level.poi) {
                    setdevdvar(function_2ef675c13ca1c4af(@"hash_831b14ba4dbdd316", poiname, "<unknown string>"), 0);
                }
            }
            var_5a77a5f00881f00c = getdvarint(@"hash_7f1d33bb4719a3c2", 0);
            if (var_5a77a5f00881f00c == 1) {
                if (!istrue(level.var_289df80e1ded586f)) {
                    printtoscreen2d(1000, 100, "<unknown string>", (0, 0, 1), 2.5);
                } else {
                    var_deda4f611cb77e62 = 50;
                    printtoscreen2d(var_deda4f611cb77e62, 54, "<unknown string>" + function_e884d14c5b07b811(), (0, 0, 1), 2.5);
                    var_deda4f611cb77e62 = var_deda4f611cb77e62 + 250;
                    printtoscreen2d(var_deda4f611cb77e62, 50, "<unknown string>" + function_e8c0ac958d093ec2() + "<unknown string>" + level.var_41670c1c65f3d3cf.maxagents, (0, 0, 1), 1.5);
                    var_deda4f611cb77e62 = var_deda4f611cb77e62 + 250;
                    printtoscreen2d(var_deda4f611cb77e62, 50, "<unknown string>" + function_1c0a768a2d940491(), (0, 0, 1), 1.5);
                    var_deda4f611cb77e62 = var_deda4f611cb77e62 + 200;
                    printtoscreen2d(var_deda4f611cb77e62, 50, "<unknown string>" + function_9368fb9261e4cd0a("priority_set: Can't be called on undefined agents"), (0, 0, 1), 1.5);
                    var_deda4f611cb77e62 = var_deda4f611cb77e62 + 200;
                    printtoscreen2d(var_deda4f611cb77e62, 50, "<unknown string>" + function_9368fb9261e4cd0a("<unknown string>"), (0, 0, 1), 1.5);
                    var_deda4f611cb77e62 = var_deda4f611cb77e62 + 200;
                    printtoscreen2d(var_deda4f611cb77e62, 50, "<unknown string>" + level.var_41670c1c65f3d3cf.var_25087194b5e05d51, (0, 0, 1), 1.5);
                    if (function_47d356083884f913()) {
                        printtoscreen2d(var_deda4f611cb77e62 + 300, 50, "<unknown string>" + level.var_dbb3dd5ab77ccd48.size, (0, 0, 1), 1.5);
                        var_3f6841050cf2c2a = 0;
                        x = 50;
                        y = 90;
                        foreach (poiname, poi in level.poi) {
                            if (var_5a77a5f00881f00c == 1 && array_contains(level.var_ab20b3a256911579, poiname)) {
                                continue;
                            }
                            var_fa8640cd2623b8c0 = function_491f405f5622af52(poiname, x, y);
                            if (var_fa8640cd2623b8c0 > var_3f6841050cf2c2a) {
                                var_3f6841050cf2c2a = var_fa8640cd2623b8c0;
                            }
                            x = x + 230;
                            if (x > 1600) {
                                y = y + var_3f6841050cf2c2a * 22;
                                x = 50;
                                var_3f6841050cf2c2a = 0;
                            }
                        }
                    } else {
                        x = 200;
                        pos = 160;
                        pos = pos + 10;
                        printtoscreen2d(x, pos, "<unknown string>", (0, 0, 1), 1);
                        pos = pos + 12;
                        printtoscreen2d(x, pos, "<unknown string>", (0, 0, 1), 1);
                        pos = pos + 12;
                        printtoscreen2d(x, pos, "<unknown string>", (0, 0, 1), 1);
                        pos = pos + 16;
                        foreach (key in function_d20fe6bad41c065c()) {
                            if (key != "<unknown string>") {
                                var_77ff8b45cb9154b8 = key + "<unknown string>";
                                var_24b1a09cf1c83134 = function_718d435f9750c1b5(key);
                                var_1a4b2b4134f5887b = "<unknown string>" + function_9a83377c98bce82a(key);
                                printtoscreen2d(x, pos, var_77ff8b45cb9154b8, (0, 0, 1), 1);
                                var_1fe5b416408707e9 = x + var_77ff8b45cb9154b8.size * 10;
                                printtoscreen2d(var_1fe5b416408707e9, pos, var_24b1a09cf1c83134, (0, 1, 0), 1);
                                var_1fe5b416408707e9 = var_1fe5b416408707e9 + var_24b1a09cf1c83134 * 10;
                                printtoscreen2d(var_1fe5b416408707e9, pos, var_1a4b2b4134f5887b, (0, 0, 1), 1);
                                pos = pos + 20;
                            }
                        }
                        pos = pos + 10;
                        printtoscreen2d(x, pos, "<unknown string>" + level.var_41670c1c65f3d3cf.var_25087194b5e05d51, (0, 0, 1), 1);
                        pos = pos + 12;
                        printtoscreen2d(x, pos, "<unknown string>", (0, 0, 1), 1);
                        pos = pos + 12;
                        printtoscreen2d(x, pos, "<unknown string>" + function_9a83377c98bce82a("<unknown string>") + "<unknown string>" + function_3813364e2323b789(), (0, 0, 1), 1);
                        pos = pos + 12;
                        printtoscreen2d(x, pos, "<unknown string>", (0, 0, 1), 1);
                    }
                }
            }
            if (var_5a77a5f00881f00c == 2) {
                printtoscreen2d(100, 54, "<unknown string>" + function_e884d14c5b07b811() + "<unknown string>" + level.var_41670c1c65f3d3cf.maxagents, (0, 0, 1), 2.5);
                printtoscreen2d(450, 50, "<unknown string>" + function_9368fb9261e4cd0a("priority_set: Can't be called on undefined agents"), (0, 0, 1), 1.5);
                printtoscreen2d(750, 50, "<unknown string>" + function_9368fb9261e4cd0a("<unknown string>"), (0, 0, 1), 1.5);
                printtoscreen2d(1050, 50, "<unknown string>" + level.var_41670c1c65f3d3cf.var_25087194b5e05d51, (0, 0, 1), 1.5);
                if (function_47d356083884f913()) {
                    printtoscreen2d(1300, 50, "<unknown string>" + level.var_dbb3dd5ab77ccd48.size, (0, 0, 1), 1.5);
                    x = 50;
                    y = 90;
                    foreach (poiname, poi in level.poi) {
                        if (array_contains(level.var_ab20b3a256911579, poiname)) {
                            continue;
                        }
                        function_6fb8f59559dfa4a7(poiname, x, y);
                        x = x + 230;
                        if (x > 1600) {
                            y = y + 380;
                            x = 50;
                        }
                    }
                }
            }
            if (var_5a77a5f00881f00c == 5) {
                if (!istrue(level.var_289df80e1ded586f)) {
                    printtoscreen2d(750, 100, "<unknown string>", (0, 0, 1), 2.5);
                } else if (isdefined(level.var_2eb4c3a1badaf4eb)) {
                    if (function_47d356083884f913()) {
                        startx = 150;
                        starty = 100;
                        x = startx;
                        y = starty;
                        foreach (poiname, poi in level.poi) {
                            if (!isdefined(level.var_2eb4c3a1badaf4eb[poiname])) {
                                continue;
                            }
                            pos = y;
                            printtoscreen2d(x, pos, poiname, (0, 0, 1), 2);
                            pos = pos + 12;
                            printtoscreen2d(x, pos, "<unknown string>", (0, 0, 1), 1);
                            pos = pos + 20;
                            color = (0, 1, 0);
                            switch (level.var_2eb4c3a1badaf4eb[poiname].starlevel) {
                            case 1:
                                color = (1, 1, 0);
                                break;
                            case 2:
                                color = (1, 0.75, 0);
                                break;
                            case 3:
                                color = (1, 0.35, 0);
                                break;
                            case 4:
                                color = (1, 0, 0);
                                break;
                            }
                            printtoscreen2d(x, pos, "<unknown string>" + level.var_2eb4c3a1badaf4eb[poiname].starlevel, color, 1.5);
                            pos = pos + 12;
                            printtoscreen2d(x, pos, "<unknown string>", (0, 0, 1), 1);
                            pos = pos + 16;
                            printtoscreen2d(x, pos, "<unknown string>" + level.var_2eb4c3a1badaf4eb[poiname].var_7444b7c0c103ea62, (0, 0, 1), 1);
                            pos = pos + 20;
                            printtoscreen2d(x, pos, "<unknown string>" + level.var_2eb4c3a1badaf4eb[poiname].var_924d5d49fde54cdd, (0, 0, 1), 1);
                            pos = pos + 20;
                            printtoscreen2d(x, pos, "<unknown string>", (0, 0, 1), 1);
                            pos = pos + 20;
                            printtoscreen2d(x, pos, "<unknown string>" + level.var_2eb4c3a1badaf4eb[poiname].var_19d6896c9e881cc4, (0, 0, 1), 1);
                            pos = pos + 20;
                            if (level.var_2eb4c3a1badaf4eb[poiname].starlevel == 4) {
                                var_8584dfebf1c91d05 = 0;
                            } else {
                                var_8584dfebf1c91d05 = level.var_1a6233bc0d61faf.var_b286a53c1d03306d[level.var_2eb4c3a1badaf4eb[poiname].starlevel] - level.var_2eb4c3a1badaf4eb[poiname].var_a93671354b676c18;
                            }
                            printtoscreen2d(x, pos, "<unknown string>" + var_8584dfebf1c91d05, (0, 0, 1), 1);
                            pos = pos + 20;
                            printtoscreen2d(x, pos, "<unknown string>", (0, 0, 1), 1);
                            pos = pos + 20;
                            printtoscreen2d(x, pos, "<unknown string>" + level.var_2eb4c3a1badaf4eb[poiname].var_38951249a8cf8968, (0, 0, 1), 1);
                            pos = pos + 20;
                            printtoscreen2d(x, pos, "<unknown string>" + level.var_2eb4c3a1badaf4eb[poiname].var_fe385543116077b5, (0, 0, 1), 1);
                            pos = pos + 20;
                            printtoscreen2d(x, pos, "<unknown string>" + level.var_2eb4c3a1badaf4eb[poiname].var_55cf9e4f74d2f4c2, (0, 0, 1), 1);
                            pos = pos + 20;
                            printtoscreen2d(x, pos, "<unknown string>" + level.var_2eb4c3a1badaf4eb[poiname].var_356bde2b53efa8cf, (0, 0, 1), 1);
                            x = x + 250;
                            if (x > 1750) {
                                x = startx;
                                starty = starty + 325;
                                y = starty;
                            }
                        }
                    } else {
                        printtoscreen2d(400, 50, "<unknown string>" + level.var_2eb4c3a1badaf4eb.starlevel, (1, 1, 1), 1);
                        printtoscreen2d(400, 70, "<unknown string>" + level.var_2eb4c3a1badaf4eb.var_7444b7c0c103ea62, (1, 1, 1), 1);
                        printtoscreen2d(400, 90, "<unknown string>" + level.var_2eb4c3a1badaf4eb.var_924d5d49fde54cdd, (1, 1, 1), 1);
                        printtoscreen2d(400, 110, "<unknown string>", (1, 1, 1), 1);
                        printtoscreen2d(400, 130, "<unknown string>" + level.var_2eb4c3a1badaf4eb.var_19d6896c9e881cc4, (1, 1, 1), 1);
                        printtoscreen2d(400, 150, "<unknown string>" + level.var_1a6233bc0d61faf.var_b286a53c1d03306d[level.var_2eb4c3a1badaf4eb.starlevel] - level.var_2eb4c3a1badaf4eb.var_a93671354b676c18, (1, 1, 1), 1);
                        printtoscreen2d(400, 170, "<unknown string>", (0, 0, 1), 1);
                        printtoscreen2d(400, 190, "<unknown string>" + level.var_2eb4c3a1badaf4eb.var_38951249a8cf8968, (0, 0, 1), 1);
                        printtoscreen2d(400, 210, "<unknown string>" + level.var_2eb4c3a1badaf4eb.var_fe385543116077b5, (0, 0, 1), 1);
                        printtoscreen2d(400, 230, "<unknown string>" + level.var_2eb4c3a1badaf4eb.var_55cf9e4f74d2f4c2, (0, 0, 1), 1);
                        printtoscreen2d(400, 250, "<unknown string>" + level.var_2eb4c3a1badaf4eb.var_356bde2b53efa8cf, (0, 0, 1), 1);
                    }
                } else {
                    printtoscreen2d(750, 100, "<unknown string>", (0, 0, 1), 2.5);
                }
            }
            if (getdvarint(@"hash_959247ebc7eac6b5", 0) == 1) {
                println("<unknown string>");
                println("<unknown string>");
                println("<unknown string>");
                if (!function_47d356083884f913()) {
                    println("<unknown string>" + function_9a83377c98bce82a("<unknown string>") + "<unknown string>" + level.var_41670c1c65f3d3cf.maxagents);
                    println("<unknown string>" + function_9a83377c98bce82a("<unknown string>"));
                } else {
                    println("<unknown string>" + function_9a83377c98bce82a("<unknown string>") + "<unknown string>" + level.var_41670c1c65f3d3cf.maxagents);
                    var_8e83c63383ada7a5 = getdvarint(@"hash_bd4798a9b7d01479", 8) * level.poi.size;
                    println("<unknown string>" + function_9a83377c98bce82a("<unknown string>") + "<unknown string>" + var_8e83c63383ada7a5);
                }
                println("<unknown string>");
                println("<unknown string>");
                println("<unknown string>");
                setdevdvar(@"hash_959247ebc7eac6b5", 0);
            }
            if (var_5a77a5f00881f00c == 4) {
                if (function_47d356083884f913()) {
                    x = 250;
                    pos = 100;
                    foreach (poiname, poi in level.poi) {
                        printtoscreen2d(x, pos, poiname, (0, 0, 1), 2);
                        pos = pos + 20;
                        if (isdefined(level.var_41670c1c65f3d3cf.poi[poiname].var_8bcd79921ba8147e) && isdefined(level.var_41670c1c65f3d3cf.poi[poiname].var_25087194b5e05d51)) {
                            printtoscreen2d(x, pos, "<unknown string>" + level.var_41670c1c65f3d3cf.poi[poiname].var_8bcd79921ba8147e - level.var_41670c1c65f3d3cf.poi[poiname].var_25087194b5e05d51, (0, 0, 1), 1.2);
                        } else {
                            printtoscreen2d(x, pos, "<unknown string>", (0, 0, 1), 1.2);
                        }
                        pos = pos + 12;
                        printtoscreen2d(x, pos, "<unknown string>", (0, 0, 1), 1);
                        pos = pos + 20;
                        if (!isdefined(level.var_41670c1c65f3d3cf.poi[poiname].var_a87122636ff072d3)) {
                            text = "<unknown string>";
                        } else {
                            text = level.var_41670c1c65f3d3cf.poi[poiname].var_a87122636ff072d3;
                        }
                        printtoscreen2d(x, pos, text, (0, 0, 1), 1);
                        pos = pos + 25;
                        printtoscreen2d(x, pos, "<unknown string>", (0, 0, 1), 1.2);
                        pos = pos + 12;
                        printtoscreen2d(x, pos, "<unknown string>", (0, 0, 1), 1);
                        pos = pos + 20;
                        var_a1aa345c7721c4c7 = "<unknown string>";
                        if (!isdefined(level.var_41670c1c65f3d3cf.poi[poiname].var_51baa9a0e1d139d1) || level.var_41670c1c65f3d3cf.poi[poiname].var_51baa9a0e1d139d1.size == 0) {
                            var_a1aa345c7721c4c7 = "<unknown string>";
                        } else {
                            foreach (numagents in level.var_41670c1c65f3d3cf.poi[poiname].var_51baa9a0e1d139d1) {
                                var_a1aa345c7721c4c7 = var_a1aa345c7721c4c7 + "<unknown string>" + numagents;
                            }
                        }
                        printtoscreen2d(x, pos, var_a1aa345c7721c4c7, (0, 0, 1), 1);
                        pos = pos + 50;
                        if (pos > 1000) {
                            x = x + 450;
                            pos = 100;
                        }
                    }
                } else {
                    pos = 50;
                    printtoscreen2d(700, pos, "<unknown string>", (1, 1, 1), 1);
                    pos = pos + 20;
                    printtoscreen2d(700, pos, "<unknown string>", (1, 1, 1), 1);
                    pos = pos + 20;
                    printtoscreen2d(700, pos, level.var_a87122636ff072d3, (1, 1, 1), 1);
                    pos = pos + 40;
                    printtoscreen2d(700, pos, "<unknown string>", (1, 1, 1), 1);
                    pos = pos + 20;
                    printtoscreen2d(700, pos, "<unknown string>", (1, 1, 1), 1);
                    pos = pos + 20;
                    var_a1aa345c7721c4c7 = "<unknown string>";
                    if (level.var_41670c1c65f3d3cf.var_51baa9a0e1d139d1.size == 0) {
                        var_a1aa345c7721c4c7 = "<unknown string>";
                    } else {
                        foreach (numagents in level.var_41670c1c65f3d3cf.var_51baa9a0e1d139d1) {
                            var_a1aa345c7721c4c7 = var_a1aa345c7721c4c7 + "<unknown string>" + numagents;
                        }
                    }
                    printtoscreen2d(700, pos, var_a1aa345c7721c4c7, (1, 1, 1), 1);
                }
            }
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14503
// Size: 0x2a5
function function_491f405f5622af52(poiname, x, y) {
    /#
        pos = y;
        var_3f6841050cf2c2a = 0;
        var_8fc253422b8213ca = (0, 0, 1);
        var_8634e11f2f20a4b0 = (0, 0, 1);
        if (array_contains(level.var_ab20b3a256911579, poiname)) {
            var_8fc253422b8213ca = (1, 0, 0);
            var_8634e11f2f20a4b0 = (0, 0, 1);
        }
        pos = pos + 10;
        printtoscreen2d(x, pos, "<unknown string>", var_8634e11f2f20a4b0, 1);
        pos = pos + 12;
        printtoscreen2d(x, pos, poiname, var_8634e11f2f20a4b0, 1);
        pos = pos + 12;
        printtoscreen2d(x, pos, "<unknown string>", var_8634e11f2f20a4b0, 1);
        pos = pos + 16;
        var_3f6841050cf2c2a = var_3f6841050cf2c2a + 3;
        foreach (key in function_d7df76a9938f5871(poiname)) {
            if (key != "<unknown string>") {
                var_77ff8b45cb9154b8 = key + "<unknown string>";
                var_24b1a09cf1c83134 = function_bd71347864330395(function_7e3f22e620f3f71e(poiname, key));
                var_1a4b2b4134f5887b = "<unknown string>" + function_abbd4595d76ccc5e(poiname, key);
                printtoscreen2d(x, pos, var_77ff8b45cb9154b8, (0, 0, 1), 1);
                var_1fe5b416408707e9 = x + 150;
                printtoscreen2d(var_1fe5b416408707e9, pos, var_24b1a09cf1c83134, (0, 1, 0), 1);
                var_1fe5b416408707e9 = var_1fe5b416408707e9 + "<unknown string>" + var_24b1a09cf1c83134.size * 10;
                printtoscreen2d(var_1fe5b416408707e9, pos, var_1a4b2b4134f5887b, (0, 0, 1), 1);
                pos = pos + 20;
                var_3f6841050cf2c2a++;
            }
        }
        pos = pos + 10;
        printtoscreen2d(x, pos, "<unknown string>" + level.var_41670c1c65f3d3cf.poi[poiname].var_25087194b5e05d51, var_8634e11f2f20a4b0, 1);
        pos = pos + 12;
        printtoscreen2d(x, pos, "<unknown string>", var_8634e11f2f20a4b0, 1);
        pos = pos + 12;
        printtoscreen2d(x, pos, "<unknown string>" + function_abbd4595d76ccc5e(poiname, "<unknown string>"), var_8634e11f2f20a4b0, 1);
        pos = pos + 12;
        printtoscreen2d(x, pos, "<unknown string>", var_8634e11f2f20a4b0, 1);
        var_3f6841050cf2c2a = var_3f6841050cf2c2a + 4;
        return var_3f6841050cf2c2a;
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x147af
// Size: 0x1c7
function function_6fb8f59559dfa4a7(poiname, x, y) {
    /#
        pos = y;
        poi = level.poi[poiname];
        var_8fc253422b8213ca = (0, 0, 1);
        var_8634e11f2f20a4b0 = (0, 0, 1);
        pos = pos + 10;
        printtoscreen2d(x, pos, "<unknown string>", var_8634e11f2f20a4b0, 1);
        pos = pos + 12;
        printtoscreen2d(x, pos, poiname, var_8634e11f2f20a4b0, 1);
        pos = pos + 12;
        printtoscreen2d(x, pos, "<unknown string>", var_8634e11f2f20a4b0, 1);
        pos = pos + 16;
        foreach (subarea in poi["<unknown string>"]) {
            color = var_8634e11f2f20a4b0;
            var_c95ad9084e859e26 = "<unknown string>";
            if (istrue(subarea.var_b3a410141a91ba67)) {
                color = (1, 0, 0);
                var_c95ad9084e859e26 = "<unknown string>";
            }
            printtoscreen2d(x, pos, subarea.var_71ad22c5d093d90b + "<unknown string>" + subarea.var_3ebb6024e3f220ca.size + "<unknown string>" + var_c95ad9084e859e26, var_8634e11f2f20a4b0, 1);
            pos = pos + 20;
        }
        pos = pos + 12;
        printtoscreen2d(x, pos, "<unknown string>" + function_abbd4595d76ccc5e(poiname, "<unknown string>"), var_8634e11f2f20a4b0, 1);
        pos = pos + 12;
        printtoscreen2d(x, pos, "<unknown string>", var_8634e11f2f20a4b0, 1);
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1497d
// Size: 0x12c
function function_7c858505e467de02() {
    /#
        level endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_65814f5c10de603d", 0) == 1) {
                foreach (area in level.var_f81cb9ead7b61ac1) {
                    thread namespace_d028276791d9cff6::drawsphere(area.origin, 128, 1, (1, 0, 1));
                    if (!isdefined(area.agents)) {
                        continue;
                    }
                    foreach (agent in area.agents) {
                        thread namespace_f2ffc0540883e1ad::drawline(agent.origin, area.origin, 1, (1, 1, 1));
                    }
                }
            }
            wait(1);
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14ab0
// Size: 0x7d4
function function_644e1e38d1b39a41() {
    /#
        level endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_2450e77b0430661c", 0) > 0) {
                if (istrue(level.var_289df80e1ded586f)) {
                    player = level.players[0];
                    team = undefined;
                    if (namespace_36f464722d326bbe::function_42e2dcfd4571b89b()) {
                        if (isdefined(level.var_4b195d3dd0024b9c)) {
                            team = level.var_4b195d3dd0024b9c;
                        } else {
                            team = "<unknown string>";
                        }
                    } else {
                        team = namespace_54d20dd0dd79277f::getenemyteams(player.team)[0];
                    }
                    if (isdefined(player)) {
                        level thread function_27d0336b6b9b60c("<unknown string>", player.origin, team, player);
                    }
                }
                setdevdvar(@"hash_2450e77b0430661c", 0);
            }
            if (getdvarint(@"hash_3812148f43182b8", 0) > 0) {
                if (istrue(level.var_289df80e1ded586f)) {
                    player = level.players[0];
                    if (isdefined(player)) {
                        level thread function_27d0336b6b9b60c("<unknown string>", player.origin, player.team);
                    }
                }
                setdevdvar(@"hash_3812148f43182b8", 0);
            }
            if (getdvarint(@"hash_56e9c6adae23f12b", 0) > 0) {
                if (istrue(level.var_289df80e1ded586f)) {
                    player = level.players[0];
                    team = undefined;
                    if (namespace_36f464722d326bbe::function_42e2dcfd4571b89b()) {
                        if (isdefined(level.var_4b195d3dd0024b9c)) {
                            team = level.var_4b195d3dd0024b9c;
                        } else {
                            team = "<unknown string>";
                        }
                    } else {
                        team = namespace_54d20dd0dd79277f::getenemyteams(player.team)[0];
                    }
                    if (isdefined(player)) {
                        level thread function_27d0336b6b9b60c("<unknown string>", player.origin, team, player);
                    }
                }
                setdevdvar(@"hash_56e9c6adae23f12b", 0);
            }
            if (getdvarint(@"hash_e98cb58666dc372d", 0) > 0) {
                if (istrue(level.var_289df80e1ded586f)) {
                    player = level.players[0];
                    if (isdefined(player)) {
                        level thread function_27d0336b6b9b60c("<unknown string>", player.origin, player.team);
                    }
                }
                setdevdvar(@"hash_e98cb58666dc372d", 0);
            }
            if (getdvarint(@"hash_ab9e351e7bdd4002", 0) > 0) {
                if (istrue(level.var_289df80e1ded586f)) {
                    player = level.players[0];
                    team = undefined;
                    if (namespace_36f464722d326bbe::function_42e2dcfd4571b89b()) {
                        if (isdefined(level.var_4b195d3dd0024b9c)) {
                            team = level.var_4b195d3dd0024b9c;
                        } else {
                            team = "<unknown string>";
                        }
                    } else {
                        team = namespace_54d20dd0dd79277f::getenemyteams(player.team)[0];
                    }
                    if (isdefined(player)) {
                        origin = function_61cbc488b27a6e61(player.origin);
                        level thread function_27d0336b6b9b60c("<unknown string>", origin, team);
                    }
                }
                setdevdvar(@"hash_ab9e351e7bdd4002", 0);
            }
            if (getdvarint(@"hash_534dfd9d53977a3a", 0) > 0) {
                if (istrue(level.var_289df80e1ded586f)) {
                    player = level.players[0];
                    if (isdefined(player)) {
                        origin = function_61cbc488b27a6e61(player.origin);
                        level thread function_27d0336b6b9b60c("<unknown string>", origin, player.team);
                    }
                }
                setdevdvar(@"hash_534dfd9d53977a3a", 0);
            }
            if (getdvarint(@"hash_249d0bd1bced7236", 0) > 0) {
                if (istrue(level.var_289df80e1ded586f)) {
                    player = level.players[0];
                    team = undefined;
                    if (namespace_36f464722d326bbe::function_42e2dcfd4571b89b()) {
                        if (isdefined(level.var_4b195d3dd0024b9c)) {
                            team = level.var_4b195d3dd0024b9c;
                        } else {
                            team = "<unknown string>";
                        }
                    } else {
                        team = namespace_54d20dd0dd79277f::getenemyteams(player.team)[0];
                    }
                    if (isdefined(player)) {
                        origin = function_61cbc488b27a6e61(player.origin);
                        level thread function_27d0336b6b9b60c("<unknown string>", origin, team, player);
                    }
                }
                setdevdvar(@"hash_249d0bd1bced7236", 0);
            }
            if (getdvarint(@"hash_867ce306c3674a56", 0) > 0) {
                if (istrue(level.var_289df80e1ded586f)) {
                    player = level.players[0];
                    if (isdefined(player)) {
                        origin = function_61cbc488b27a6e61(player.origin);
                        team = player.team;
                        level thread function_27d0336b6b9b60c("<unknown string>", origin, team, player);
                    }
                }
                setdevdvar(@"hash_867ce306c3674a56", 0);
            }
            if (getdvarint(@"hash_88ae422170005010", 0) > 0) {
                if (istrue(level.var_289df80e1ded586f)) {
                    player = level.players[0];
                    if (isdefined(player)) {
                        origin = function_61cbc488b27a6e61(player.origin);
                        level thread namespace_bfef6903bca5845d::function_77acc10c4823dd8a(2, origin, "<unknown string>", "<unknown string>", "<unknown string>", undefined, player.team);
                    }
                }
                setdevdvar(@"hash_88ae422170005010", 0);
            }
            if (getdvarint(@"hash_7882eb2f0ed5ba94", 0) > 0) {
                if (istrue(level.var_289df80e1ded586f)) {
                    player = level.players[0];
                    team = undefined;
                    if (namespace_36f464722d326bbe::function_42e2dcfd4571b89b()) {
                        if (isdefined(level.var_4b195d3dd0024b9c)) {
                            team = level.var_4b195d3dd0024b9c;
                        } else {
                            team = "<unknown string>";
                        }
                    } else {
                        team = namespace_54d20dd0dd79277f::getenemyteams(player.team)[0];
                    }
                    if (isdefined(player)) {
                        origin = function_61cbc488b27a6e61(player.origin);
                        level thread namespace_bfef6903bca5845d::function_77acc10c4823dd8a(5, origin, "<unknown string>", "<unknown string>", "<unknown string>", undefined, team);
                    }
                }
                setdevdvar(@"hash_7882eb2f0ed5ba94", 0);
            }
            if (getdvarint(@"hash_dd00a99e0fc8f650", 0) > 0) {
                if (istrue(level.var_289df80e1ded586f)) {
                    player = level.players[0];
                    team = undefined;
                    if (namespace_36f464722d326bbe::function_42e2dcfd4571b89b()) {
                        if (isdefined(level.var_4b195d3dd0024b9c)) {
                            team = level.var_4b195d3dd0024b9c;
                        } else {
                            team = "<unknown string>";
                        }
                    } else {
                        team = namespace_54d20dd0dd79277f::getenemyteams(player.team)[0];
                    }
                    if (isdefined(player)) {
                        level thread function_27d0336b6b9b60c("<unknown string>", player.origin, team, player);
                    }
                }
                setdevdvar(@"hash_dd00a99e0fc8f650", 0);
            }
            if (getdvarint(@"hash_a880595a62e6c674", 0) > 0) {
                if (istrue(level.var_289df80e1ded586f)) {
                    player = level.players[0];
                    if (isdefined(player)) {
                        level thread function_27d0336b6b9b60c("<unknown string>", player.origin, player.team, player);
                    }
                }
                setdevdvar(@"hash_a880595a62e6c674", 0);
            }
            if (getdvarint(@"hash_61fc4efede6cbbe2", 0) > 0) {
                if (istrue(level.var_289df80e1ded586f)) {
                    player = level.players[0];
                    team = undefined;
                    if (namespace_36f464722d326bbe::function_42e2dcfd4571b89b()) {
                        if (isdefined(level.var_4b195d3dd0024b9c)) {
                            team = level.var_4b195d3dd0024b9c;
                        } else {
                            team = "<unknown string>";
                        }
                    } else {
                        team = namespace_54d20dd0dd79277f::getenemyteams(player.team)[0];
                    }
                    if (isdefined(player)) {
                        level thread function_27d0336b6b9b60c("<unknown string>", player.origin, team, player);
                    }
                }
                setdevdvar(@"hash_61fc4efede6cbbe2", 0);
            }
            if (getdvarint(@"hash_f823061619fb9d9a", 0) > 0) {
                if (istrue(level.var_289df80e1ded586f)) {
                    player = level.players[0];
                    if (isdefined(player)) {
                        level thread function_27d0336b6b9b60c("<unknown string>", player.origin, player.team, player);
                    }
                }
                setdevdvar(@"hash_f823061619fb9d9a", 0);
            }
            wait(1);
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1528b
// Size: 0x1bd
function function_27d0336b6b9b60c(type, origin, team, player) {
    /#
        agents = undefined;
        poiname = undefined;
        if (isdefined(player)) {
            poiname = function_6cc445c02b5effac(player.origin);
        }
        switch (type) {
        case #"hash_b111a4547c7d9125":
            agents = function_2f3b04fc531b4115(4, origin, "<unknown string>", "<unknown string>", "<unknown string>", undefined, team, undefined, poiname, type, undefined, undefined, undefined, function_bed4c95709497a6c(origin, undefined, poiname));
            break;
        case #"hash_8d96201d150187de":
            agents = function_2f3b04fc531b4115(4, origin, "<unknown string>", "<unknown string>", "<unknown string>", undefined, team, undefined, poiname, type);
            break;
        case #"hash_f2a2ef6a2b0d207c":
            function_353fecd1549f5f42(origin, 2048, "<unknown string>");
            break;
        case #"hash_c72bb484b209c08b":
            agents = function_2f3b04fc531b4115(5, origin, "<unknown string>", "<unknown string>", "<unknown string>", undefined, team, undefined, poiname, type);
            break;
        case #"hash_f0e5b0c514493855":
            agents = function_2f3b04fc531b4115(4, origin, "<unknown string>", "<unknown string>", "<unknown string>", undefined, team, undefined, poiname, type);
            break;
        case #"hash_8b66cdb7a2b06217":
            agents = function_2f3b04fc531b4115(4, origin, "<unknown string>", "<unknown string>", "<unknown string>", undefined, team, undefined, poiname, type);
            break;
        }
        if (!isdefined(origin)) {
            origin = player.origin;
        }
        if (isdefined(agents) && isarray(agents)) {
            poiname = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(origin);
            function_96b7b6431450dfc0(agents.size, poiname);
            if (isdefined(level.var_d1a95e3c3d6ea9fc)) {
                level thread function_346caf10322931c8(poiname, origin);
            }
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1544f
// Size: 0x806
function function_5397fa12cf5b1665() {
    /#
        level endon("<unknown string>");
        while (1) {
            var_d45c6fe613356b23 = getdvarint(@"hash_1d8682eb59219492", 0);
            if (var_d45c6fe613356b23 == 1) {
                if (function_47d356083884f913()) {
                    foreach (poi in level.poi) {
                        poiname = level.poi["<unknown string>"];
                        var_bef13f1e36d7dcd9 = function_d2ed76e2bedd339e(poiname);
                        if (!isdefined(var_bef13f1e36d7dcd9)) {
                            continue;
                        }
                        thread namespace_d028276791d9cff6::drawsphere(var_bef13f1e36d7dcd9, 512, 1, (0, 1, 0));
                        print3d(var_bef13f1e36d7dcd9 + (0, 0, 552), poiname, (1, 1, 1), 1, 10, 20);
                    }
                }
            }
            if (var_d45c6fe613356b23 == 2) {
                if (function_47d356083884f913()) {
                    foreach (poiname, poi in level.poi) {
                        foreach (subarea in poi["<unknown string>"]) {
                            if (subarea.var_71ad22c5d093d90b != "<unknown string>") {
                                origin = function_ab3b7f9663bc2e89(subarea);
                                if (!isdefined(origin)) {
                                    continue;
                                }
                                thread namespace_d028276791d9cff6::drawsphere(origin, 512, 1, (0, 1, 0));
                                print3d(origin + (0, 0, 550), poiname + "<unknown string>" + subarea.var_71ad22c5d093d90b, (1, 1, 1), 1, 2, 20);
                            }
                        }
                    }
                }
            }
            if (var_d45c6fe613356b23 == 3) {
                if (function_47d356083884f913()) {
                    foreach (poiname, poi in level.poi) {
                        foreach (subarea in poi["<unknown string>"]) {
                            if (subarea.var_71ad22c5d093d90b != "<unknown string>") {
                                foreach (spawnpackage in subarea.var_d276b08c96430bfc) {
                                    function_87edf0678d74d59a(spawnpackage, "<unknown string>", poiname, subarea.var_71ad22c5d093d90b);
                                }
                                foreach (spawnpackage in subarea.var_24a2cd19eed8f75d) {
                                    function_87edf0678d74d59a(spawnpackage, "<unknown string>", poiname, subarea.var_71ad22c5d093d90b);
                                }
                            } else {
                                foreach (spawnpackage in subarea.var_d276b08c96430bfc) {
                                    function_87edf0678d74d59a(spawnpackage, "<unknown string>", poiname, subarea.var_71ad22c5d093d90b);
                                }
                                foreach (spawnpackage in subarea.var_24a2cd19eed8f75d) {
                                    function_87edf0678d74d59a(spawnpackage, "<unknown string>", poiname, subarea.var_71ad22c5d093d90b);
                                }
                            }
                        }
                    }
                }
            }
            if (var_d45c6fe613356b23 == 4) {
                if (function_47d356083884f913()) {
                    foreach (poiname, poi in level.poi) {
                        foreach (node in poi["<unknown string>"]) {
                            size = 32;
                            color = (1, 0, 0);
                            if (istrue(node.var_1e9d8e53eeec48a)) {
                                size = 64;
                                color = (0, 1, 0);
                            }
                            sphere(node.origin, size, color);
                        }
                    }
                }
            }
            if (var_d45c6fe613356b23 == 5) {
                if (function_47d356083884f913()) {
                    foreach (poiname, poi in level.poi) {
                        foreach (pathstruct in level.poi[poiname]["<unknown string>"]) {
                            size = 32;
                            color = (1, 0, 0);
                            if (istrue(pathstruct.var_1e9d8e53eeec48a)) {
                                color = (0, 1, 0);
                            } else if (istrue(pathstruct.var_4b0bad4944a4cbc0)) {
                                color = (0, 0, 1);
                            }
                            for (i = 0; i < pathstruct.path.size; i++) {
                                var_4ff83cffc51fbf4e = pathstruct.path[i];
                                var_4ff83bffc51fbd1b = undefined;
                                sphere(var_4ff83cffc51fbf4e.origin, size, color);
                                if (isdefined(var_4ff83cffc51fbf4e.target)) {
                                    var_4ff83bffc51fbd1b = getstruct(var_4ff83cffc51fbf4e.target, "<unknown string>");
                                }
                                if (isdefined(var_4ff83bffc51fbd1b)) {
                                    line(var_4ff83cffc51fbf4e.origin, var_4ff83bffc51fbd1b.origin, color);
                                } else if (!istrue(pathstruct.var_4437e81f60b6b5a0)) {
                                    line(var_4ff83cffc51fbf4e.origin, pathstruct.path[0].origin, color);
                                }
                            }
                        }
                    }
                }
            }
            if (var_d45c6fe613356b23 == 6) {
                foreach (agent in level.agentarray) {
                    if (isalive(agent)) {
                        str = "<unknown string>" + agent.agent_type;
                        if (isdefined(agent.var_80f4bde7090a4773) && agent.var_80f4bde7090a4773 == "<unknown string>") {
                            str = str + "<unknown string>";
                        }
                        print3d(agent.origin + (0, 0, 100), str, (1, 0, 1), 1, 0.4);
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x15c5c
// Size: 0x40b
function function_87edf0678d74d59a(spawnpackage, type, poiname, var_71ad22c5d093d90b) {
    /#
        color = undefined;
        if (type == "<unknown string>") {
            color = (0, 1, 0);
        } else if (type == "<unknown string>") {
            color = (0, 0, 1);
        } else {
            color = (1, 0, 0);
        }
        sphere(spawnpackage.origin, 64, color);
        print3d(spawnpackage.origin + (0, 0, 104), type, (1, 1, 1), 1, 2, 20);
        if (isdefined(var_71ad22c5d093d90b)) {
            print3d(spawnpackage.origin + (0, 0, 84), var_71ad22c5d093d90b, (1, 1, 1), 1, 1.25, 20);
        }
        if (isdefined(poiname)) {
            print3d(spawnpackage.origin + (0, 0, 64), poiname, (1, 1, 1), 1, 1.25, 20);
        }
        if (isdefined(spawnpackage.var_2ef873e30a270bcf)) {
            foreach (spawnloc in spawnpackage.var_2ef873e30a270bcf) {
                sphere(spawnloc.origin, 32, (1, 1, 0));
                line(spawnpackage.origin, spawnloc.origin, (1, 1, 0));
            }
        }
        if (isdefined(spawnpackage.var_d7baafc9b07f5094)) {
            foreach (pathstruct in spawnpackage.var_d7baafc9b07f5094) {
                line(spawnpackage.origin, pathstruct.path[0].origin, (1, 1, 0));
                for (i = 0; i < pathstruct.path.size; i++) {
                    var_4ff83cffc51fbf4e = pathstruct.path[i];
                    var_4ff83bffc51fbd1b = pathstruct.path[i + 1];
                    sphere(var_4ff83cffc51fbf4e.origin, 32, (1, 0, 1));
                    if (isdefined(var_4ff83bffc51fbd1b)) {
                        line(var_4ff83cffc51fbf4e.origin, var_4ff83bffc51fbd1b.origin, (1, 0, 1));
                    } else if (!istrue(pathstruct.var_4437e81f60b6b5a0)) {
                        line(var_4ff83cffc51fbf4e.origin, pathstruct.path[0].origin, (1, 1, 0));
                    }
                }
            }
        }
        if (isdefined(spawnpackage.var_6c25fe44ff159d0e)) {
            foreach (var_e66dd9043bfecc9 in spawnpackage.var_6c25fe44ff159d0e) {
                sphere(var_e66dd9043bfecc9.origin, 32, (1, 1, 0));
                line(spawnpackage.origin, var_e66dd9043bfecc9.origin, (1, 1, 0));
            }
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1606e
// Size: 0x93
function function_ddedf124ae1bcf7d() {
    /#
        while (1) {
            x = getdvarfloat(@"hash_cde7d84c0f1d8210", -20051);
            y = getdvarfloat(@"hash_cde7d94c0f1d8443", 42445.5);
            z = getdvarfloat(@"hash_cde7da4c0f1d8676", -157.5);
            origin = (x, y, z);
            thread namespace_d028276791d9cff6::drawsphere(origin, 512, 1, (0, 1, 0));
            wait(1);
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16108
// Size: 0xcf
function function_6bbeb23006988aae() {
    /#
        startorigin = (-18414, 20137, -237);
        var_2b750d1a55947c42 = 128;
        var_8ae37bd14130b001 = 128;
        for (i = 0; i < 20; i++) {
            origin = startorigin + (0, var_8ae37bd14130b001 * (i + 1), 0);
            for (j = 0; j < 20; j++) {
                safeorigin = function_61cbc488b27a6e61(origin + (0, 0, 200));
                safeorigin = drop_to_ground(safeorigin);
                ai_mp_requestspawnagent("<unknown string>", safeorigin, undefined, "<unknown string>", "<unknown string>", "<unknown string>");
                origin = origin + (var_2b750d1a55947c42, 0, 0);
            }
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x161de
// Size: 0x91
function function_36dcf4004d9f5399() {
    /#
        while (1) {
            foreach (agent in level.var_dba9ed733f19236c) {
                if (isdefined(agent) && isalive(agent)) {
                    thread namespace_d028276791d9cff6::drawsphere(agent.origin, 32, 1, (0, 1, 0));
                }
            }
            wait(1);
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16276
// Size: 0x82
function function_b510c28e573d0be6() {
    /#
        level endon("<unknown string>");
        while (1) {
            foreach (player in level.players) {
                player setclientomnvar("<unknown string>", function_5cc0c507e92f7b47(player.var_da28916e7827af7c));
            }
            wait(1);
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x162ff
// Size: 0xa5
function function_8e6e8dadb5526ec0() {
    /#
        while (1) {
            foreach (agent in level.agentarray) {
                if (isalive(agent)) {
                    print3d(agent.origin + (0, 0, 64), agent.agent_type, (1, 1, 1), 1, 1.25, 1);
                }
            }
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x163ab
// Size: 0x273
function function_8b97c47b557d1c58() {
    /#
        level endon("<unknown string>");
        while (1) {
            foreach (poiname, poi in level.poi) {
                if (getdvarint(function_2ef675c13ca1c4af(@"hash_831b14ba4dbdd316", poiname, "<unknown string>"), 0) == 1) {
                    foreach (subarea in poi["<unknown string>"]) {
                        if (subarea.var_71ad22c5d093d90b != "<unknown string>") {
                            foreach (spawnpackage in subarea.var_d276b08c96430bfc) {
                                function_87edf0678d74d59a(spawnpackage, "<unknown string>", poiname, subarea.var_71ad22c5d093d90b);
                            }
                            foreach (spawnpackage in subarea.var_24a2cd19eed8f75d) {
                                function_87edf0678d74d59a(spawnpackage, "<unknown string>", poiname, subarea.var_71ad22c5d093d90b);
                            }
                        } else {
                            foreach (spawnpackage in subarea.var_d276b08c96430bfc) {
                                function_87edf0678d74d59a(spawnpackage, "<unknown string>", poiname, subarea.var_71ad22c5d093d90b);
                            }
                            foreach (spawnpackage in subarea.var_24a2cd19eed8f75d) {
                                function_87edf0678d74d59a(spawnpackage, "<unknown string>", poiname, subarea.var_71ad22c5d093d90b);
                            }
                        }
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16625
// Size: 0x134
function function_9fae03fa905ef5ce() {
    /#
        level endon("<unknown string>");
        while (1) {
            foreach (poiname, poi in level.poi) {
                if (getdvarint(function_2ef675c13ca1c4af(@"hash_831b14ba4dbdd316", poiname, "<unknown string>"), 0) == 1) {
                    foreach (node in level.poi[poiname]["<unknown string>"]) {
                        size = 32;
                        color = (1, 0, 0);
                        if (istrue(node.var_1e9d8e53eeec48a)) {
                            size = 64;
                            color = (0, 1, 0);
                        }
                        sphere(node.origin, size, color);
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16760
// Size: 0x21c
function function_8c74d71ffba1bda8() {
    /#
        level endon("<unknown string>");
        while (1) {
            foreach (poiname, poi in level.poi) {
                if (getdvarint(function_2ef675c13ca1c4af(@"hash_831b14ba4dbdd316", poiname, "<unknown string>"), 0) == 1) {
                    foreach (pathstruct in level.poi[poiname]["<unknown string>"]) {
                        size = 32;
                        color = (1, 0, 0);
                        if (istrue(pathstruct.var_1e9d8e53eeec48a)) {
                            color = (0, 1, 0);
                        } else if (istrue(pathstruct.var_4b0bad4944a4cbc0)) {
                            color = (0, 0, 1);
                        }
                        for (i = 0; i < pathstruct.path.size; i++) {
                            var_4ff83cffc51fbf4e = pathstruct.path[i];
                            var_4ff83bffc51fbd1b = undefined;
                            sphere(var_4ff83cffc51fbf4e.origin, size, color);
                            if (isdefined(var_4ff83cffc51fbf4e.target)) {
                                var_4ff83bffc51fbd1b = getstruct(var_4ff83cffc51fbf4e.target, "<unknown string>");
                            }
                            if (isdefined(var_4ff83bffc51fbd1b)) {
                                line(var_4ff83cffc51fbf4e.origin, var_4ff83bffc51fbd1b.origin, color);
                            } else if (!istrue(pathstruct.var_4437e81f60b6b5a0)) {
                                line(var_4ff83cffc51fbf4e.origin, pathstruct.path[0].origin, color);
                            }
                        }
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16983
// Size: 0x15d
function function_389b1801f508c3f0() {
    /#
        level endon("<unknown string>");
        while (1) {
            foreach (poiname, poi in level.poi) {
                if (getdvarint(function_2ef675c13ca1c4af(@"hash_831b14ba4dbdd316", poiname, "<unknown string>"), 0) == 1) {
                    foreach (agent in function_7e3f22e620f3f71e(poiname, "<unknown string>")) {
                        if (isalive(agent)) {
                            str = "<unknown string>" + agent.agent_type;
                            if (isdefined(agent.var_80f4bde7090a4773) && agent.var_80f4bde7090a4773 == "<unknown string>") {
                                str = str + "<unknown string>";
                            }
                            print3d(agent.origin + (0, 0, 100), str, (1, 0, 1), 1, 0.4);
                        }
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16ae7
// Size: 0x90
function function_83e7184f6391c36b() {
    /#
        while (1) {
            sphere(level.players[0].origin, 512, (1, 0, 0));
            sphere(level.players[0].origin, 1024, (0, 1, 0));
            sphere(level.players[0].origin, 2048, (0, 0, 1));
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x16b7e
// Size: 0x99
function function_e060fb3d7177aea7(ent, time, radius, color) {
    /#
        if (!isdefined(ent) && !isdefined(time)) {
            return;
        }
        var_f8a269392b9c9b15 = int(time / level.framedurationseconds);
        if (!isdefined(radius)) {
            radius = 256;
        }
        if (!isdefined(color)) {
            color = (0, 0, 1);
        }
        for (frame = 0; frame < var_f8a269392b9c9b15; frame++) {
            sphere(ent.origin, radius, color);
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16c1e
// Size: 0xdb
function function_e1c5cdebd8e4628a() {
    /#
        level endon("<unknown string>");
        setdevdvarifuninitialized(@"hash_f9e17cb98b253864", 0);
        var_4aedb83e4489153d = 1;
        while (1) {
            if (namespace_91707ccc3e1bf8ff::function_159af129de631d3e() && var_4aedb83e4489153d) {
                var_4aedb83e4489153d = 0;
                setdvar(@"hash_f51f34be092e6691", 1);
                setdvar(@"hash_c5b31ff1b47a0f69", 1);
                setdvar(@"hash_f245a011cef948e0", 1);
                setdvar(@"hash_c7b59c90cd6d06bb", 1);
            }
            if (!namespace_91707ccc3e1bf8ff::function_159af129de631d3e() && !var_4aedb83e4489153d) {
                var_4aedb83e4489153d = 1;
                setdvar(@"hash_f51f34be092e6691", 0);
                setdvar(@"hash_c5b31ff1b47a0f69", 0);
                setdvar(@"hash_f245a011cef948e0", 0);
                setdvar(@"hash_c7b59c90cd6d06bb", 0);
            }
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16d00
// Size: 0x60
function function_c1d2c66c8b74b50() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (namespace_91707ccc3e1bf8ff::function_159af129de631d3e()) {
                count = namespace_91707ccc3e1bf8ff::function_6ed101071f87cd39();
                print3d(self.origin - (0, 0, count * 20), "<unknown string>", (1, 1, 0), 1, 1.25);
            }
            waitframe();
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x16d67
// Size: 0x4e
function function_2ddd97b1f0e64945(player, event, radius) {
    /#
        if (isdefined(radius)) {
            function_afe5cda1a4ed9d11(event, player, player.origin, radius);
        } else {
            function_afe5cda1a4ed9d11(event, player, player.origin);
        }
    #/
}

// Namespace ai_mp_controller/namespace_bfef6903bca5845d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16dbc
// Size: 0xb7
function function_862dc7729fb4914b(var_47bde44b1acec603) {
    /#
        point = getclosestpointonnavmesh(level.players[0].origin + anglestoforward(level.players[0].angles) * 128);
        var_e6874e9b453d7005 = level.players[0] getnearestnode();
        aitype = function_7f1a2e2ebe0c1693(var_47bde44b1acec603);
        boss = ai_mp_requestspawnagent(aitype, point, level.players[0].angles, "<unknown string>", "<unknown string>", undefined, undefined, undefined, undefined, undefined, 0);
    #/
}

