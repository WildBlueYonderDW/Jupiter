// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3f8889c16399185c;
#using scripts\mp\gametypes\br_ending.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_6ad351ebd5a33280;

#namespace namespace_8c2e78a6b4c1c6fd;

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca8
// Size: 0x105f
function function_d32f459ab9f5e7af() {
    /#
        setdevdvarifuninitialized(@"hash_cf55e0f95935f5af", 1);
        setdevdvarifuninitialized(@"hash_ad33abd04b38d2fa", "interrogator");
        setdevdvarifuninitialized(@"hash_ad33aad04b38d0c7", "interrogator");
        setdevdvarifuninitialized(@"hash_ad33a9d04b38ce94", "interrogator");
        setdevdvarifuninitialized(@"hash_ad33a8d04b38cc61", "interrogator");
        setdevdvarifuninitialized(@"hash_ad33a7d04b38ca2e", "interrogator");
        setdevdvarifuninitialized(@"hash_ad33a6d04b38c7fb", "interrogator");
    #/
    accoladelist = getscriptbundle(%"hash_2e2c8e9902bd7702");
    level.var_e3fca817c22e740d = [];
    if (isdefined(accoladelist)) {
        if (isdefined(accoladelist.var_ed69fdc32e48c4ea)) {
            foreach (id, entry in accoladelist.var_ed69fdc32e48c4ea) {
                if (isnumber(id) && isdefined(entry)) {
                    ref = entry.var_6627cd540343e11d;
                    if (!isdefined(level.var_e3fca817c22e740d[ref])) {
                        level.var_e3fca817c22e740d[ref] = id;
                    } else {
                        /#
                            assert(!isdefined(level.var_e3fca817c22e740d[ref]));
                        #/
                    }
                }
            }
        } else {
            /#
                assertex(isdefined(accoladelist.var_ed69fdc32e48c4ea), "br_accolades/accolades_init_sceneSystem: accoladeList.brexfilaccolades is undefined");
            #/
        }
    } else {
        /#
            assertex(isdefined(accoladelist), "br_accolades/accolades_init_sceneSystem: accoladeList is undefined");
        #/
    }
    level.var_bcf7be5c24905ab9 = [];
    level.var_5477e9d7bbf824bf = [];
    function_389e9b1947ae8a9d();
    function_5368e57349c65cd6();
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_assassin_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"executionKills", 1:"meleeKills"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 1;
    function_fa624b8c032afcf7("assassin", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_assists_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"assists"];
    params.maxvalue = 8;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("assists", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_bigguns_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"killstreakKills"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 1;
    function_fa624b8c032afcf7("bigguns", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_breacher_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"stoppingPowerKills", 1:"bossAgentKills"];
    for (i = 1; i <= 3; i++) {
        params.var_f873b3d73f52abbf[params.var_f873b3d73f52abbf.size] = "tier" + i + "NormalAgentKills";
        params.var_f873b3d73f52abbf[params.var_f873b3d73f52abbf.size] = "tier" + i + "EliteAgentKills";
    }
    params.maxvalue = 16;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("breacher", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_commando_scene";
    params.var_c0e23eeb5d47ec83 = &function_f0496b6c16117c3f;
    params.var_fde59c56d8b89b3b = &function_755ff55065755233;
    /#
        params.var_d6d8da4bfd3935ba = &function_b12f9d6b95f241d0;
    #/
    params.maxvalue = 13;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("commando", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_ghost_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"deadSilenceKills", 1:"throwingKnifeKills", 2:"killstreakCUAVAssists", 3:"silencedKills"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 1;
    function_1ef76151d5fb5218("ghost", "killstreakCUAVAssists", 0.5);
    function_fa624b8c032afcf7("ghost", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_interrogator_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"interrogations"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("interrogator", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_killer_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"kills"];
    params.maxvalue = 18;
    params.floor = 1;
    params.scale = 2;
    function_fa624b8c032afcf7("killer", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_machinist_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"smokesUsed", 1:"flashbangHits", 2:"trophySystemHits", 3:"empDroneHits", 4:"gasHits", 5:"stunHits", 6:"decoyHits", 7:"deployableCoverUsed", 8:"shockStickHits"];
    params.maxvalue = 11;
    params.floor = 1;
    params.scale = 0;
    function_1ef76151d5fb5218("machinist", "decoyHits", 0.1);
    function_1ef76151d5fb5218("machinist", "deployableCoverUsed", 0.1);
    function_1ef76151d5fb5218("machinist", "shockStickHits", 0.1);
    function_fa624b8c032afcf7("machinist", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_marksman_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"headshots", 1:"totalMultikills", 2:"penetrationKills"];
    params.maxvalue = 9;
    params.floor = 1;
    params.scale = 1;
    function_fa624b8c032afcf7("marksman", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_medic_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"rescues", 1:"kioskRevives"];
    params.maxvalue = 6;
    params.floor = 1;
    params.scale = 1;
    function_fa624b8c032afcf7("medic", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_moneybags_scene";
    params.var_c0e23eeb5d47ec83 = &function_8d32528bf59f4d60;
    params.var_fde59c56d8b89b3b = &function_a1d32055df3b7000;
    /#
        params.var_d6d8da4bfd3935ba = &function_f9cb44b2fa2cb71;
    #/
    params.var_f873b3d73f52abbf = [0:"highestPurchaseCost"];
    params.maxvalue = 5000;
    params.floor = 20;
    params.scale = 2;
    function_fa624b8c032afcf7("moneybags", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_pyro_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"fragKills", 1:"molotovKills", 2:"launcherKills", 3:"semtexKills", 4:"thermiteKills"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("pyro", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_scavenger_scene";
    params.var_c0e23eeb5d47ec83 = &function_56c0ae4c11e6ecc3;
    params.var_fde59c56d8b89b3b = &function_c8209fbd2f8c013;
    /#
        params.var_d6d8da4bfd3935ba = &function_4fd5f112e483ad54;
    #/
    params.maxvalue = 22;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("scavenger", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_scout_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"reconDroneMarks", 1:"killstreakUAVAssists", 2:"killstreakAUAVAssists", 3:"binocularMarks", 4:"snapshotHits", 5:"tacCamMarks"];
    params.maxvalue = 7;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("scout", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_sniper_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"longshotKills"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 1;
    function_fa624b8c032afcf7("sniper", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_supplier_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"munitionsBoxUsed", 1:"armorBoxUsed"];
    params.maxvalue = 9;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("supplier", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_survivor_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"damageHealed", 1:"gulagWins", 2:"rescued", 3:"revivedFromKiosk"];
    params.maxvalue = 59;
    params.floor = 1;
    params.scale = 2;
    function_1ef76151d5fb5218("survivor", "damageHealed", 0.1);
    function_fa624b8c032afcf7("survivor", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_teamobjectives_scene";
    params.var_c0e23eeb5d47ec83 = &function_b9d90f8e9bf917b0;
    params.var_fde59c56d8b89b3b = &function_bd072f91ee4831b0;
    /#
        params.var_d6d8da4bfd3935ba = &function_9c146e27d6a5e7e1;
    #/
    params.var_f873b3d73f52abbf = [0:"blacksitesCaptured", 1:"strongholdsCaptured"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("teamobjectives", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_trapper_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [0:"claymoreKills", 1:"c4Kills", 2:"proximityMineKills"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("trapper", params);
    if (namespace_d92c3c983abee514::can_play_ending()) {
        level.var_e3ac672a3513883f = &function_2cbdf94f9506ad4f;
        level.var_c3edd7b8c279a3e = &function_3e06f1c56df58044;
    }
    /#
        if (getdvarint(@"hash_cc732c73e93ea9d7", 0)) {
            thread function_ebad1c4b67a19a0e();
        }
    #/
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d0e
// Size: 0x6f1
function function_dd857d7c2bd2f1bd() {
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_deadweight_scene";
    params.var_c0e23eeb5d47ec83 = &function_93ffafa2252e5dff;
    params.var_fde59c56d8b89b3b = &function_6381c928faf6229f;
    /#
        params.var_d6d8da4bfd3935ba = &function_5ec9e0597a47f590;
    #/
    params.var_f873b3d73f52abbf = [0:"deaths"];
    params.maxvalue = 1;
    params.floor = 0.001;
    params.scale = 2;
    function_fa624b8c032afcf7("deadweight", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_highachiever_cool_scene";
    params.var_c0e23eeb5d47ec83 = &function_f546b635aa8b84d2;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [];
    params.maxvalue = 8;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("highachiever_cool", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_highachiever_cooler_scene";
    params.var_c0e23eeb5d47ec83 = &function_f546b635aa8b84d2;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [];
    params.maxvalue = 8;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("highachiever_cooler", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_highachiever_coolest_scene";
    params.var_c0e23eeb5d47ec83 = &function_f546b635aa8b84d2;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [];
    params.maxvalue = 8;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("highachiever_coolest", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_immortal_scene";
    params.var_c0e23eeb5d47ec83 = &function_47ad2469e6be0500;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_4a6f9f6476301391;
    #/
    params.var_f873b3d73f52abbf = [0:"deaths"];
    function_fa624b8c032afcf7("immortal", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_medalist_cool_scene";
    params.var_c0e23eeb5d47ec83 = &function_f3f8f37d12315948;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [];
    params.maxvalue = 8;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("medalist_cool", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_medalist_cooler_scene";
    params.var_c0e23eeb5d47ec83 = &function_f3f8f37d12315948;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [];
    params.maxvalue = 8;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("medalist_cooler", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_medalist_coolest_scene";
    params.var_c0e23eeb5d47ec83 = &function_f3f8f37d12315948;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [];
    params.maxvalue = 8;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("medalist_coolest", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_pacifist_scene";
    params.var_c0e23eeb5d47ec83 = &function_e1271ea633c42ecc;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_176d8f69d69ec84d;
    #/
    params.var_f873b3d73f52abbf = [0:"kills", 1:"assists"];
    params.maxvalue = 100;
    params.floor = 0;
    params.scale = 0;
    function_fa624b8c032afcf7("pacifist", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_tryhard_cool_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [];
    function_fa624b8c032afcf7("tryhard_cool", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_tryhard_cooler_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [];
    function_fa624b8c032afcf7("tryhard_cooler", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_tryhard_coolest_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [];
    function_fa624b8c032afcf7("tryhard_coolest", params);
    params = spawnstruct();
    params.var_e25d1d189177a7c = "jup_wz_acc_weakestlink_scene";
    params.var_c0e23eeb5d47ec83 = &function_b13f6a12712eaa29;
    params.var_fde59c56d8b89b3b = &function_3f5a0a838086d8dd;
    /#
        params.var_d6d8da4bfd3935ba = &function_6ab412e6faa588ea;
    #/
    params.var_f873b3d73f52abbf = [];
    function_fa624b8c032afcf7("weakestlink", params);
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2406
// Size: 0x67
function private function_389e9b1947ae8a9d() {
    level.var_9a2fe47bbb5d6729 = [0:"weakestlink", 1:"tryhard_cool", 2:"tryhard_cooler", 3:"tryhard_coolest", 4:"medalist_cool", 5:"medalist_cooler", 6:"medalist_coolest", 7:"highachiever_cool", 8:"highachiever_cooler", 9:"highachiever_coolest"];
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2474
// Size: 0x55
function private function_5368e57349c65cd6() {
    level.var_d1c6ce2aca9c7b81 = [];
    var_aed700f334c599e9 = strtok(getdvar(@"hash_b534c88be1278728", ""), " ");
    if (var_aed700f334c599e9.size > 0) {
        level.var_d1c6ce2aca9c7b81 = array_combine_unique(level.var_d1c6ce2aca9c7b81, var_aed700f334c599e9);
    }
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d0
// Size: 0x6f
function function_fa624b8c032afcf7(ref, var_cd37ce775909957b) {
    /#
        assert(isdefined(ref));
    #/
    /#
        assert(!isdefined(level.var_bcf7be5c24905ab9[ref]));
    #/
    /#
        assert(isdefined(var_cd37ce775909957b));
    #/
    /#
        assert(isdefined(var_cd37ce775909957b.var_c0e23eeb5d47ec83));
    #/
    var_cd37ce775909957b.name = ref;
    level.var_bcf7be5c24905ab9[ref] = var_cd37ce775909957b;
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2546
// Size: 0xd6
function function_2cbdf94f9506ad4f() {
    level endon("game_ended");
    self endon("disconnect");
    foreach (entry in level.var_bcf7be5c24905ab9) {
        if (isdefined(entry.var_f873b3d73f52abbf) && entry.var_f873b3d73f52abbf.size > 0) {
            foreach (var_88421f8dbfe8efe8 in entry.var_f873b3d73f52abbf) {
                namespace_3c5a4254f2b957ea::initpersstat(var_88421f8dbfe8efe8);
            }
        }
    }
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2623
// Size: 0x2b
function function_1ef76151d5fb5218(accolade, stat, mod) {
    level.var_5477e9d7bbf824bf[accolade][stat] = mod;
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2655
// Size: 0x5c
function function_5417d27691d41344(accolade, stat) {
    if (!isdefined(level.var_5477e9d7bbf824bf) || !array_contains_key(level.var_5477e9d7bbf824bf, accolade) || !array_contains_key(level.var_5477e9d7bbf824bf[accolade], stat)) {
        return 1;
    }
    return level.var_5477e9d7bbf824bf[accolade][stat];
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x26b9
// Size: 0x240
function private function_93ffafa2252e5dff(ref, params) {
    /#
        assert(isdefined(namespace_3c5a4254f2b957ea::getpersstat("deaths")));
    #/
    playerrank = getrank() + 1;
    teammates = namespace_54d20dd0dd79277f::getteamdata(self.team, "players");
    if (teammates.size < 2 || playerrank < 54) {
        var_2d25f333132cb770 = 0;
        self.var_fb37db009207fe1a[ref] = var_2d25f333132cb770;
        self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, var_2d25f333132cb770);
        return;
    }
    var_a8246df77b7223c5 = getpersstat("kills");
    var_eadd6177b72846af = getpersstat("deaths");
    var_da061d04c729beee = getpersstat("score");
    var_58764218a0e3e17 = -1;
    foreach (player in teammates) {
        if (player == self) {
            continue;
        }
        var_2c82554a0dbc1fc0 = player getpersstat("kills");
        var_dac30488172f99fc = player getpersstat("deaths");
        if (var_2c82554a0dbc1fc0 <= var_a8246df77b7223c5 || var_dac30488172f99fc >= var_eadd6177b72846af) {
            var_2d25f333132cb770 = 0;
            var_58764218a0e3e17 = -1;
            break;
        }
        var_5ece8e35961b674f = player getpersstat("score");
        if (var_58764218a0e3e17 == -1 || var_5ece8e35961b674f < var_58764218a0e3e17) {
            var_58764218a0e3e17 = var_5ece8e35961b674f;
        }
    }
    if (var_58764218a0e3e17 > 0) {
        var_81d57b941144b81c = getdvarfloat(@"hash_be569afee6af87f5", 0.2);
        var_fd506798b992cd0a = var_58764218a0e3e17 * var_81d57b941144b81c;
        var_32d1e481486eb81e = (var_da061d04c729beee - var_fd506798b992cd0a) / (var_58764218a0e3e17 - var_fd506798b992cd0a);
        var_2d25f333132cb770 = clamp(1 - var_32d1e481486eb81e, 0.001, 1);
    } else {
        var_2d25f333132cb770 = 0;
    }
    self.var_fb37db009207fe1a[ref] = var_2d25f333132cb770;
    self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, var_2d25f333132cb770);
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2900
// Size: 0x66
function private function_47ad2469e6be0500(ref, params) {
    var_2d25f333132cb770 = 0;
    /#
        assert(isdefined(namespace_3c5a4254f2b957ea::getpersstat("deaths")));
    #/
    if (namespace_3c5a4254f2b957ea::getpersstat("deaths") == 0) {
        var_2d25f333132cb770 = 0.8;
    }
    self.var_fb37db009207fe1a[ref] = var_2d25f333132cb770;
    self.var_769c9edd0782e95d[ref] = var_2d25f333132cb770;
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x296d
// Size: 0xd1
function private function_8d32528bf59f4d60(ref, params) {
    var_2d25f333132cb770 = 0;
    if (isdefined(self.plundercount)) {
        var_2d25f333132cb770 = var_2d25f333132cb770 + self.plundercount * function_5417d27691d41344(ref, "plunderCount");
    }
    if (isdefined(params)) {
        foreach (param in params) {
            if (isdefined(namespace_3c5a4254f2b957ea::getpersstat(param))) {
                var_2d25f333132cb770 = var_2d25f333132cb770 + namespace_3c5a4254f2b957ea::getpersstat(param) * function_5417d27691d41344(ref, param);
            }
        }
    }
    self.var_fb37db009207fe1a[ref] = var_2d25f333132cb770;
    self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, var_2d25f333132cb770);
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a45
// Size: 0x341
function private function_f3f8f37d12315948(ref, params) {
    totalwins = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "wins_chapter");
    if (totalwins < 1) {
        self.var_fb37db009207fe1a[ref] = 0;
        self.var_769c9edd0782e95d[ref] = 0;
        return;
    }
    var_ee260594656c54c8 = 0;
    var_7c101d635120f263 = 0;
    var_3af2acb530669c50 = 0;
    var_70c87880c6071612 = 0;
    var_73de12f95c6f33d6 = 0;
    var_3f2b0541de1978de = 0;
    var_a9c0c2f18a5358f3 = namespace_3c5a4254f2b957ea::getpersstat("kills");
    var_772439d13e37bec8 = namespace_3c5a4254f2b957ea::getpersstat("rescues");
    var_2d4667ed50f088d1 = namespace_3c5a4254f2b957ea::getpersstat("assists");
    var_182500d535e340cd = namespace_3c5a4254f2b957ea::getpersstat("contracts");
    var_f1ee44eb651c64ef = namespace_3c5a4254f2b957ea::getpersstat("kioskRevives");
    var_d197acf3fc856feb = 0;
    var_d5e91959bdcb8093 = "";
    var_5e7fd99bc2d17e16 = "";
    switch (ref) {
    case #"hash_1d132230c198824":
        var_ee260594656c54c8 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "kills_rolling");
        var_7c101d635120f263 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "revives_rolling");
        var_3af2acb530669c50 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "assist_rolling");
        var_70c87880c6071612 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "contracts_rolling");
        var_73de12f95c6f33d6 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "respawns_rolling");
        var_5e7fd99bc2d17e16 = "_rolling";
        var_3f2b0541de1978de = 0.8;
        break;
    case #"hash_37f4d05731e98df3":
        var_ee260594656c54c8 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "kills_seasonal");
        var_7c101d635120f263 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "revives_seasonal");
        var_3af2acb530669c50 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "assist_seasonal");
        var_70c87880c6071612 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "contracts_seasonal");
        var_73de12f95c6f33d6 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "respawns_seasonal");
        var_5e7fd99bc2d17e16 = "_seasonal";
        var_3f2b0541de1978de = 0.85;
        break;
    case #"hash_ffee7a4392a7837c":
        var_ee260594656c54c8 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "kills_chapter");
        var_7c101d635120f263 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "revives_chapter");
        var_3af2acb530669c50 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "assist_chapter");
        var_70c87880c6071612 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "contracts_chapter");
        var_73de12f95c6f33d6 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "respawns_chapter");
        var_5e7fd99bc2d17e16 = "_chapter";
        var_3f2b0541de1978de = 0.9;
        break;
    }
    var_2d25f333132cb770 = 0;
    if (var_ee260594656c54c8 < var_a9c0c2f18a5358f3 && var_a9c0c2f18a5358f3 >= 6) {
        var_2d25f333132cb770 = var_3f2b0541de1978de;
        var_d5e91959bdcb8093 = "pb_kill";
        var_d197acf3fc856feb = var_a9c0c2f18a5358f3;
    } else if (var_7c101d635120f263 < var_772439d13e37bec8 && var_772439d13e37bec8 >= 6) {
        var_2d25f333132cb770 = var_3f2b0541de1978de;
        var_d5e91959bdcb8093 = "pb_revive";
        var_d197acf3fc856feb = var_772439d13e37bec8;
    } else if (var_3af2acb530669c50 < var_2d4667ed50f088d1 && var_2d4667ed50f088d1 >= 6) {
        var_2d25f333132cb770 = var_3f2b0541de1978de;
        var_d5e91959bdcb8093 = "pb_assist";
        var_d197acf3fc856feb = var_2d4667ed50f088d1;
    } else if (var_70c87880c6071612 < var_182500d535e340cd && var_182500d535e340cd >= 4) {
        var_2d25f333132cb770 = var_3f2b0541de1978de;
        var_d5e91959bdcb8093 = "pb_contract";
        var_d197acf3fc856feb = var_182500d535e340cd;
    } else if (var_73de12f95c6f33d6 < var_f1ee44eb651c64ef && var_f1ee44eb651c64ef >= 4) {
        var_2d25f333132cb770 = var_3f2b0541de1978de;
        var_d5e91959bdcb8093 = "pb_return";
        var_d197acf3fc856feb = var_f1ee44eb651c64ef;
    }
    function_cab1aa0020df0892(ref, var_2d25f333132cb770, var_d5e91959bdcb8093 + var_5e7fd99bc2d17e16, var_d197acf3fc856feb);
    self.var_fb37db009207fe1a[ref] = var_2d25f333132cb770;
    self.var_769c9edd0782e95d[ref] = var_2d25f333132cb770;
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d8d
// Size: 0x882
function private function_f546b635aa8b84d2(ref, params) {
    totalwins = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "wins_chapter");
    if (totalwins < 1) {
        self.var_fb37db009207fe1a[ref] = 0;
        self.var_769c9edd0782e95d[ref] = 0;
        return;
    }
    if (!isdefined(level.var_4fb0509d0e36fc92)) {
        level.var_4fb0509d0e36fc92 = [];
        level.var_4fb0509d0e36fc92["kills"] = 0;
        level.var_4fb0509d0e36fc92["rescues"] = 0;
        level.var_4fb0509d0e36fc92["assists"] = 0;
        level.var_4fb0509d0e36fc92["contracts"] = 0;
        level.var_4fb0509d0e36fc92["kioskRevives"] = 0;
        foreach (var_38cdaf0dae057e30 in level.teamdata[self.team]["players"]) {
            var_106cf76d8750f19a = var_38cdaf0dae057e30 namespace_3c5a4254f2b957ea::getpersstat("kills");
            var_f9fc433dd15f49c5 = var_38cdaf0dae057e30 namespace_3c5a4254f2b957ea::getpersstat("rescues");
            var_be60efbb0abe57ca = var_38cdaf0dae057e30 namespace_3c5a4254f2b957ea::getpersstat("assists");
            var_b65ffc5d0c6d8cac = var_38cdaf0dae057e30 namespace_3c5a4254f2b957ea::getpersstat("contracts");
            var_573269d8d8e208a0 = var_38cdaf0dae057e30 namespace_3c5a4254f2b957ea::getpersstat("kioskRevives");
            if (var_106cf76d8750f19a > level.var_4fb0509d0e36fc92["kills"]) {
                level.var_4fb0509d0e36fc92["kills"] = var_106cf76d8750f19a;
            }
            if (var_f9fc433dd15f49c5 > level.var_4fb0509d0e36fc92["rescues"]) {
                level.var_4fb0509d0e36fc92["rescues"] = var_f9fc433dd15f49c5;
            }
            if (var_be60efbb0abe57ca > level.var_4fb0509d0e36fc92["assists"]) {
                level.var_4fb0509d0e36fc92["assists"] = var_be60efbb0abe57ca;
            }
            if (var_b65ffc5d0c6d8cac > level.var_4fb0509d0e36fc92["contracts"]) {
                level.var_4fb0509d0e36fc92["contracts"] = var_b65ffc5d0c6d8cac;
            }
            if (var_573269d8d8e208a0 > level.var_4fb0509d0e36fc92["kioskRevives"]) {
                level.var_4fb0509d0e36fc92["kioskRevives"] = var_573269d8d8e208a0;
            }
        }
    }
    var_ee260594656c54c8 = 0;
    var_7c101d635120f263 = 0;
    var_3af2acb530669c50 = 0;
    var_70c87880c6071612 = 0;
    var_73de12f95c6f33d6 = 0;
    var_55998bcd4d629adf = 0;
    var_502bf7c3ae2036b5 = 0;
    var_a884dca72212123b = 0;
    var_c407f28ad630af2b = 0;
    var_a9c0c2f18a5358f3 = namespace_3c5a4254f2b957ea::getpersstat("kills");
    var_772439d13e37bec8 = namespace_3c5a4254f2b957ea::getpersstat("rescues");
    var_2d4667ed50f088d1 = namespace_3c5a4254f2b957ea::getpersstat("assists");
    var_182500d535e340cd = namespace_3c5a4254f2b957ea::getpersstat("contracts");
    var_f1ee44eb651c64ef = namespace_3c5a4254f2b957ea::getpersstat("kioskRevives");
    var_6bcbf586f8637281 = 0;
    var_7d3ee998e1a71a64 = 0;
    var_18649738426bd478 = 0;
    var_18718c384279d0cc = 0;
    var_3f2b0541de1978de = 0;
    var_d197acf3fc856feb = 0;
    var_d5e91959bdcb8093 = "";
    var_5e7fd99bc2d17e16 = "";
    switch (ref) {
    case #"hash_cefd45a5f0651582":
        if (isdefined(level.var_c192bb3f79de7dbf)) {
            var_ee260594656c54c8 = level.var_c192bb3f79de7dbf["kills_rolling"];
            var_7c101d635120f263 = level.var_c192bb3f79de7dbf["revives_rolling"];
            var_3af2acb530669c50 = level.var_c192bb3f79de7dbf["assist_rolling"];
            var_70c87880c6071612 = level.var_c192bb3f79de7dbf["contracts_rolling"];
            var_73de12f95c6f33d6 = level.var_c192bb3f79de7dbf["respawns_rolling"];
            var_55998bcd4d629adf = level.var_c192bb3f79de7dbf["wins_rolling"];
            var_502bf7c3ae2036b5 = level.var_c192bb3f79de7dbf["top5_rolling"];
            var_a884dca72212123b = level.var_c192bb3f79de7dbf["top10_rolling"];
            var_c407f28ad630af2b = level.var_c192bb3f79de7dbf["top25_rolling"];
        }
        var_6bcbf586f8637281 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "wins_rolling") + 1;
        var_7d3ee998e1a71a64 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top5_rolling") + 1;
        var_18649738426bd478 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top10_rolling") + 1;
        var_18718c384279d0cc = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top25_rolling") + 1;
        var_3f2b0541de1978de = 0.95;
        var_5e7fd99bc2d17e16 = "_rolling";
        break;
    case #"hash_67540269f1b46075":
        if (isdefined(level.var_c192bb3f79de7dbf)) {
            var_ee260594656c54c8 = level.var_c192bb3f79de7dbf["kills_seasonal"];
            var_7c101d635120f263 = level.var_c192bb3f79de7dbf["revives_seasonal"];
            var_3af2acb530669c50 = level.var_c192bb3f79de7dbf["assist_seasonal"];
            var_70c87880c6071612 = level.var_c192bb3f79de7dbf["contracts_seasonal"];
            var_73de12f95c6f33d6 = level.var_c192bb3f79de7dbf["respawns_seasonal"];
            var_55998bcd4d629adf = level.var_c192bb3f79de7dbf["wins_seasonal"];
            var_502bf7c3ae2036b5 = level.var_c192bb3f79de7dbf["top5_seasonal"];
            var_a884dca72212123b = level.var_c192bb3f79de7dbf["top10_seasonal"];
            var_c407f28ad630af2b = level.var_c192bb3f79de7dbf["top25_seasonal"];
        }
        var_6bcbf586f8637281 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "wins_seasonal") + 1;
        var_7d3ee998e1a71a64 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top5_seasonal") + 1;
        var_18649738426bd478 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top10_seasonal") + 1;
        var_18718c384279d0cc = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top25_seasonal") + 1;
        var_3f2b0541de1978de = 0.98;
        var_5e7fd99bc2d17e16 = "_seasonal";
        break;
    case #"hash_5d9ccfc77ef0e622":
        if (isdefined(level.var_c192bb3f79de7dbf)) {
            var_ee260594656c54c8 = level.var_c192bb3f79de7dbf["kills_chapter"];
            var_7c101d635120f263 = level.var_c192bb3f79de7dbf["revives_chapter"];
            var_3af2acb530669c50 = level.var_c192bb3f79de7dbf["assist_chapter"];
            var_70c87880c6071612 = level.var_c192bb3f79de7dbf["contracts_chapter"];
            var_73de12f95c6f33d6 = level.var_c192bb3f79de7dbf["respawns_chapter"];
            var_55998bcd4d629adf = level.var_c192bb3f79de7dbf["wins_chapter"];
            var_502bf7c3ae2036b5 = level.var_c192bb3f79de7dbf["top5_chapter"];
            var_a884dca72212123b = level.var_c192bb3f79de7dbf["top10_chapter"];
            var_c407f28ad630af2b = level.var_c192bb3f79de7dbf["top25_chapter"];
        }
        var_6bcbf586f8637281 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "wins_chapter") + 1;
        var_7d3ee998e1a71a64 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top5_chapter") + 1;
        var_18649738426bd478 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top10_chapter") + 1;
        var_18718c384279d0cc = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top25_chapter") + 1;
        var_3f2b0541de1978de = 1;
        var_5e7fd99bc2d17e16 = "_chapter";
        break;
    }
    var_2d25f333132cb770 = 0;
    if (var_55998bcd4d629adf < var_6bcbf586f8637281 && var_6bcbf586f8637281 >= 4) {
        var_2d25f333132cb770 = var_3f2b0541de1978de;
        var_d5e91959bdcb8093 = "mb_first";
        var_d197acf3fc856feb = var_6bcbf586f8637281;
    } else if (var_502bf7c3ae2036b5 < var_7d3ee998e1a71a64 && var_7d3ee998e1a71a64 >= 4) {
        var_2d25f333132cb770 = var_3f2b0541de1978de;
        var_d5e91959bdcb8093 = "mb_top20";
        var_d197acf3fc856feb = var_7d3ee998e1a71a64;
    } else if (var_a884dca72212123b < var_18649738426bd478 && var_18649738426bd478 >= 4) {
        var_2d25f333132cb770 = var_3f2b0541de1978de;
        var_d5e91959bdcb8093 = "mb_top20";
        var_d197acf3fc856feb = var_18649738426bd478;
    } else if (var_c407f28ad630af2b < var_18718c384279d0cc && var_18718c384279d0cc >= 4) {
        var_2d25f333132cb770 = var_3f2b0541de1978de;
        var_d5e91959bdcb8093 = "mb_top20";
        var_d197acf3fc856feb = var_18718c384279d0cc;
    } else if (var_ee260594656c54c8 < var_a9c0c2f18a5358f3 && var_a9c0c2f18a5358f3 >= 6 && var_ee260594656c54c8 >= level.var_4fb0509d0e36fc92["kills"]) {
        var_2d25f333132cb770 = var_3f2b0541de1978de;
        var_d5e91959bdcb8093 = "mb_kill";
        var_d197acf3fc856feb = var_a9c0c2f18a5358f3;
    } else if (var_7c101d635120f263 < var_772439d13e37bec8 && var_772439d13e37bec8 >= 6 && var_7c101d635120f263 >= level.var_4fb0509d0e36fc92["rescues"]) {
        var_2d25f333132cb770 = var_3f2b0541de1978de;
        var_d5e91959bdcb8093 = "mb_revive";
        var_d197acf3fc856feb = var_772439d13e37bec8;
    } else if (var_3af2acb530669c50 < var_2d4667ed50f088d1 && var_2d4667ed50f088d1 >= 6 && var_3af2acb530669c50 >= level.var_4fb0509d0e36fc92["assists"]) {
        var_2d25f333132cb770 = var_3f2b0541de1978de;
        var_d5e91959bdcb8093 = "mb_assist";
        var_d197acf3fc856feb = var_2d4667ed50f088d1;
    } else if (var_70c87880c6071612 < var_182500d535e340cd && var_182500d535e340cd >= 4 && var_70c87880c6071612 >= level.var_4fb0509d0e36fc92["contracts"]) {
        var_2d25f333132cb770 = var_3f2b0541de1978de;
        var_d5e91959bdcb8093 = "mb_contract";
        var_d197acf3fc856feb = var_182500d535e340cd;
    } else if (var_73de12f95c6f33d6 < var_f1ee44eb651c64ef && var_f1ee44eb651c64ef >= 4 && var_73de12f95c6f33d6 >= level.var_4fb0509d0e36fc92["kioskRevives"]) {
        var_2d25f333132cb770 = var_3f2b0541de1978de;
        var_d5e91959bdcb8093 = "mb_return";
        var_d197acf3fc856feb = var_f1ee44eb651c64ef;
    }
    function_cab1aa0020df0892(ref, var_2d25f333132cb770, var_d5e91959bdcb8093 + var_5e7fd99bc2d17e16, var_d197acf3fc856feb);
    self.var_fb37db009207fe1a[ref] = var_2d25f333132cb770;
    self.var_769c9edd0782e95d[ref] = var_2d25f333132cb770;
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3616
// Size: 0x97
function private function_cab1aa0020df0892(ref, var_b10d719ae11ce06, var_80fc16598ac7497a, var_d197acf3fc856feb) {
    if (var_b10d719ae11ce06 > 0 && !function_fc64178f71375137(level.var_d1c6ce2aca9c7b81, ref)) {
        if (isdefined(self.var_f090ccb984435bbc)) {
            if (self.var_d254e61d5b0ee746 < var_b10d719ae11ce06) {
                self.var_f090ccb984435bbc = var_80fc16598ac7497a;
                self.var_d254e61d5b0ee746 = var_b10d719ae11ce06;
                self.var_5e71ee49d0cc6534 = var_d197acf3fc856feb;
            }
        } else {
            self.var_f090ccb984435bbc = var_80fc16598ac7497a;
            self.var_d254e61d5b0ee746 = var_b10d719ae11ce06;
            self.var_5e71ee49d0cc6534 = var_d197acf3fc856feb;
        }
    }
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x36b4
// Size: 0x78
function private function_e1271ea633c42ecc(ref, params) {
    totalkills = namespace_3c5a4254f2b957ea::getpersstat("kills");
    var_74ba9cc277cbe543 = namespace_3c5a4254f2b957ea::getpersstat("assists");
    var_2d25f333132cb770 = 100 - 100 * totalkills + 3 * var_74ba9cc277cbe543;
    self.var_fb37db009207fe1a[ref] = var_2d25f333132cb770;
    self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, var_2d25f333132cb770);
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3733
// Size: 0xd1
function function_56c0ae4c11e6ecc3(ref, params) {
    var_2d25f333132cb770 = 0;
    if (isdefined(self.lootcachesopened)) {
        var_2d25f333132cb770 = var_2d25f333132cb770 + self.lootcachesopened * function_5417d27691d41344(ref, "lootCachesOpened");
    }
    if (isdefined(params)) {
        foreach (param in params) {
            if (isdefined(namespace_3c5a4254f2b957ea::getpersstat(param))) {
                var_2d25f333132cb770 = var_2d25f333132cb770 + namespace_3c5a4254f2b957ea::getpersstat(param) * function_5417d27691d41344(ref, param);
            }
        }
    }
    self.var_fb37db009207fe1a[ref] = var_2d25f333132cb770;
    self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, var_2d25f333132cb770);
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x380b
// Size: 0xd1
function private function_b9d90f8e9bf917b0(ref, params) {
    var_2d25f333132cb770 = 0;
    if (isdefined(self.brmissionscompleted)) {
        var_2d25f333132cb770 = var_2d25f333132cb770 + self.brmissionscompleted * function_5417d27691d41344(ref, "brMissionsCompleted");
    }
    if (isdefined(params)) {
        foreach (param in params) {
            if (isdefined(namespace_3c5a4254f2b957ea::getpersstat(param))) {
                var_2d25f333132cb770 = var_2d25f333132cb770 + namespace_3c5a4254f2b957ea::getpersstat(param) * function_5417d27691d41344(ref, param);
            }
        }
    }
    self.var_fb37db009207fe1a[ref] = var_2d25f333132cb770;
    self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, var_2d25f333132cb770);
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x38e3
// Size: 0x36
function private function_a72f9ae578e162e8(ref, params) {
    self.var_fb37db009207fe1a[ref] = -1;
    self.var_769c9edd0782e95d[ref] = -1;
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3920
// Size: 0x158
function private function_9bbbefe6a0debd2b(ref, value) {
    data = level.var_bcf7be5c24905ab9[ref];
    if (!isdefined(data.floor) || value < data.floor) {
        return -1;
    } else if (isdefined(data.maxvalue) && value > data.maxvalue) {
        value = data.maxvalue;
    }
    if (isdefined(data.maxvalue)) {
        if (isdefined(data.minvalue)) {
            minvalue = data.minvalue;
        } else if (isdefined(data.scale) && data.scale == 1) {
            minvalue = data.maxvalue * -0.1;
        } else {
            minvalue = 0;
        }
        /#
            assert(data.maxvalue > minvalue);
        #/
        value = float(value - minvalue) / float(data.maxvalue - minvalue);
    }
    if (isdefined(data.scale) && data.scale == 2) {
        value = pow(value, 1.2);
    }
    return value;
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a80
// Size: 0xba
function function_b13f6a12712eaa29(ref, var_b6988561ffd1f3ad) {
    /#
        assert(isdefined(var_b6988561ffd1f3ad));
    #/
    var_2d25f333132cb770 = 0;
    foreach (var_2e62e8c3b2b312ec in var_b6988561ffd1f3ad) {
        val = namespace_3c5a4254f2b957ea::getpersstat(var_2e62e8c3b2b312ec);
        if (isdefined(val)) {
            var_2d25f333132cb770 = var_2d25f333132cb770 + val * function_5417d27691d41344(ref, var_2e62e8c3b2b312ec);
        }
    }
    self.var_fb37db009207fe1a[ref] = var_2d25f333132cb770;
    self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, var_2d25f333132cb770);
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3b41
// Size: 0x15a
function private function_f0496b6c16117c3f(ref, params) {
    totalkills = 0;
    var_bb164e4df36286b4 = [0:"pistolKills", 1:"shotgunKills", 2:"smgKills", 3:"arKills", 4:"lmgKills", 5:"sniperKills"];
    var_4510b799408d140d = [0:"longshotKills", 1:"pointBlankKills"];
    foreach (var_7a2fa5a4563b3fec in var_bb164e4df36286b4) {
        val = namespace_3c5a4254f2b957ea::getpersstat(var_7a2fa5a4563b3fec);
        if (isdefined(val)) {
            totalkills = totalkills + val;
        }
    }
    foreach (var_7a2fa5a4563b3fec in var_4510b799408d140d) {
        val = namespace_3c5a4254f2b957ea::getpersstat(var_7a2fa5a4563b3fec);
        if (isdefined(val)) {
            totalkills = totalkills - val;
        }
    }
    self.var_fb37db009207fe1a[ref] = totalkills;
    self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, totalkills);
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ca2
// Size: 0x53
function private function_6381c928faf6229f(ref, params) {
    var_272fbf55066e6ea0 = [];
    if (isdefined(self.timesdowned)) {
        var_272fbf55066e6ea0["timesDowned"] = self.timesdowned;
    } else {
        var_272fbf55066e6ea0["timesDowned"] = 0;
    }
    return function_a0c339eeaf1dadb5(ref, params, var_272fbf55066e6ea0);
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cfd
// Size: 0x53
function private function_a1d32055df3b7000(ref, params) {
    var_272fbf55066e6ea0 = [];
    if (isdefined(self.plundercount)) {
        var_272fbf55066e6ea0["plunderCount"] = self.plundercount;
    } else {
        var_272fbf55066e6ea0["plunderCount"] = 0;
    }
    return function_a0c339eeaf1dadb5(ref, params, var_272fbf55066e6ea0);
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d58
// Size: 0x53
function function_c8209fbd2f8c013(ref, params) {
    var_272fbf55066e6ea0 = [];
    if (isdefined(self.lootcachesopened)) {
        var_272fbf55066e6ea0["lootCachesOpened"] = self.lootcachesopened;
    } else {
        var_272fbf55066e6ea0["lootCachesOpened"] = 0;
    }
    return function_a0c339eeaf1dadb5(ref, params, var_272fbf55066e6ea0);
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3db3
// Size: 0x53
function private function_bd072f91ee4831b0(ref, params) {
    var_272fbf55066e6ea0 = [];
    if (isdefined(self.brmissionscompleted)) {
        var_272fbf55066e6ea0["brMissionsCompleted"] = self.brmissionscompleted;
    } else {
        var_272fbf55066e6ea0["brMissionsCompleted"] = 0;
    }
    return function_a0c339eeaf1dadb5(ref, params, var_272fbf55066e6ea0);
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3e0e
// Size: 0x157
function private function_755ff55065755233(ref, params) {
    totalkills = 0;
    var_bb164e4df36286b4 = [0:"pistolKills", 1:"shotgunKills", 2:"smgKills", 3:"arKills", 4:"lmgKills", 5:"sniperKills"];
    var_4510b799408d140d = [0:"longshotKills", 1:"pointBlankKills"];
    foreach (var_7a2fa5a4563b3fec in var_bb164e4df36286b4) {
        val = namespace_3c5a4254f2b957ea::getpersstat(var_7a2fa5a4563b3fec);
        if (isdefined(val)) {
            totalkills = totalkills + val;
        }
    }
    foreach (var_7a2fa5a4563b3fec in var_4510b799408d140d) {
        val = namespace_3c5a4254f2b957ea::getpersstat(var_7a2fa5a4563b3fec);
        if (isdefined(val)) {
            totalkills = totalkills - val;
        }
    }
    var_272fbf55066e6ea0 = [];
    var_272fbf55066e6ea0["midRangeKills"] = totalkills;
    return function_a0c339eeaf1dadb5(ref, params, var_272fbf55066e6ea0);
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f6d
// Size: 0x1c
function function_3f5a0a838086d8dd(ref, params) {
    return function_a0c339eeaf1dadb5(ref, params);
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f91
// Size: 0x19c
function private function_a0c339eeaf1dadb5(ref, var_b894efc634f2a9d8, var_272fbf55066e6ea0) {
    data = spawnstruct();
    data.ref = ref;
    data.var_d924ef641d26ea9b = [];
    var_2d25f333132cb770 = 0;
    if (isdefined(var_b894efc634f2a9d8)) {
        foreach (stat in var_b894efc634f2a9d8) {
            value = 0;
            var_86a1d4655bea5502 = 0;
            if (isdefined(namespace_3c5a4254f2b957ea::getpersstat(stat))) {
                value = namespace_3c5a4254f2b957ea::getpersstat(stat);
                var_86a1d4655bea5502 = value * function_5417d27691d41344(ref, stat);
                var_2d25f333132cb770 = var_2d25f333132cb770 + var_86a1d4655bea5502;
            }
            data.var_d924ef641d26ea9b[stat][0] = value;
            data.var_d924ef641d26ea9b[stat][1] = var_86a1d4655bea5502;
        }
    }
    if (isdefined(var_272fbf55066e6ea0)) {
        foreach (stat, value in var_272fbf55066e6ea0) {
            if (isdefined(value)) {
                var_86a1d4655bea5502 = value * function_5417d27691d41344(ref, stat);
                var_2d25f333132cb770 = var_2d25f333132cb770 + var_86a1d4655bea5502;
                data.var_d924ef641d26ea9b[stat][0] = value;
                data.var_d924ef641d26ea9b[stat][1] = var_86a1d4655bea5502;
            }
        }
    }
    data.value = var_2d25f333132cb770;
    data.scaledvalue = function_9bbbefe6a0debd2b(ref, var_2d25f333132cb770);
    return data;
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4135
// Size: 0x214
function function_97113d2008e3d1f6() {
    accolades = [];
    foreach (ref, entry in level.var_bcf7be5c24905ab9) {
        /#
            assert(isdefined(entry.var_fde59c56d8b89b3b));
        #/
        data = self [[ entry.var_fde59c56d8b89b3b ]](ref, entry.var_f873b3d73f52abbf);
        var_1384d9221443f717 = spawnstruct();
        var_1384d9221443f717.ref = ref;
        value = 0;
        scaledvalue = 0;
        if (isdefined(data.value)) {
            value = max(data.value, value);
        }
        if (isdefined(data.scaledvalue)) {
            scaledvalue = max(data.scaledvalue, scaledvalue);
        }
        var_1384d9221443f717.value = value;
        var_1384d9221443f717.scaledvalue = scaledvalue;
        var_9659c2342b30ad90 = [];
        foreach (var_eefc75b18c870027, entry in data.var_d924ef641d26ea9b) {
            var_2287f0525564de07 = 0;
            var_882e5ffb508915f1 = 0;
            if (isdefined(entry) && entry.size >= 2) {
                if (isdefined(entry[0])) {
                    var_2287f0525564de07 = max(0, entry[0]);
                }
                if (isdefined(entry[1])) {
                    var_882e5ffb508915f1 = max(0, entry[1]);
                }
            }
            var_9659c2342b30ad90[var_9659c2342b30ad90.size] = [0:"stat", 1:var_eefc75b18c870027, 2:"value", 3:var_2287f0525564de07, 4:"scaledvalue", 5:var_882e5ffb508915f1];
        }
        var_1384d9221443f717.stats = var_9659c2342b30ad90;
        accolades[accolades.size] = var_1384d9221443f717;
    }
    return accolades;
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4351
// Size: 0xc6
function function_3e06f1c56df58044() {
    data = function_97113d2008e3d1f6();
    foreach (accolade in data) {
        self dlog_recordplayerevent("dlog_event_br_accolade_data", [0:"stats", 1:accolade.stats, 2:"accolade", 3:accolade.ref, 4:"value", 5:accolade.value, 6:"scaledvalue", 7:accolade.scaledvalue]);
    }
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x441e
// Size: 0x63b
function function_74497a0f417e329f(winners) {
    winners = array_removeundefined(winners);
    foreach (player in winners) {
        if (!isplayer(player)) {
            continue;
        }
        player.var_ae06891211af23ba = undefined;
        player.var_ae7b07ff9d949509 = [];
        player.var_fb37db009207fe1a = [];
        player.var_769c9edd0782e95d = [];
    }
    foreach (ref, entry in level.var_bcf7be5c24905ab9) {
        /#
            assert(isdefined(entry.var_c0e23eeb5d47ec83));
        #/
        foreach (player in winners) {
            if (!isplayer(player)) {
                continue;
            }
            /#
                assert(!isdefined(player.var_fb37db009207fe1a[ref]));
            #/
            /#
                assert(!isdefined(player.var_769c9edd0782e95d[ref]));
            #/
            player [[ entry.var_c0e23eeb5d47ec83 ]](ref, entry.var_f873b3d73f52abbf);
        }
    }
    foreach (ref, entry in level.var_bcf7be5c24905ab9) {
        var_ec1019cff3d1c77f = 0;
        bestplayer = undefined;
        foreach (player in winners) {
            if (!isplayer(player)) {
                continue;
            }
            if (player.var_fb37db009207fe1a[ref] > var_ec1019cff3d1c77f && player.var_769c9edd0782e95d[ref] >= 0) {
                bestplayer = player;
                var_ec1019cff3d1c77f = player.var_fb37db009207fe1a[ref];
            }
        }
        foreach (player in winners) {
            if (!isplayer(player)) {
                continue;
            }
            if (player.var_769c9edd0782e95d[ref] >= 0 && player.var_fb37db009207fe1a[ref] == var_ec1019cff3d1c77f) {
                player.var_ae7b07ff9d949509[player.var_ae7b07ff9d949509.size] = ref;
            }
        }
    }
    var_e722466d58c00cc1 = [];
    foreach (player in winners) {
        if (!isplayer(player)) {
            continue;
        }
        var_402228b4154edac = function_6a7a8a710f348991(player);
        if (!isdefined(var_402228b4154edac)) {
            var_3513c54632ecb882 = -1;
            foreach (ref in player.var_ae7b07ff9d949509) {
                if (function_fc64178f71375137(level.var_d1c6ce2aca9c7b81, ref)) {
                    continue;
                }
                if (array_contains(var_e722466d58c00cc1, ref)) {
                    continue;
                }
                if (player.var_769c9edd0782e95d[ref] > var_3513c54632ecb882) {
                    var_3513c54632ecb882 = player.var_769c9edd0782e95d[ref];
                    var_402228b4154edac = ref;
                }
            }
        }
        if (isdefined(var_402228b4154edac)) {
            player.var_ae06891211af23ba = var_402228b4154edac;
            var_e722466d58c00cc1[var_e722466d58c00cc1.size] = var_402228b4154edac;
        }
    }
    var_cf83385f8a939f54 = [0:"survivor", 1:"scout", 2:"scavenger", 3:"ghost"];
    var_cf83385f8a939f54 = array_randomize(var_cf83385f8a939f54);
    var_cf83385f8a939f54 = array_combine(var_cf83385f8a939f54, [0:"killer", 1:"breacher", 2:"moneybags"]);
    for (i = var_cf83385f8a939f54.size - 1; i >= 0; i--) {
        var_ad43ca064f182c3e = var_cf83385f8a939f54[i];
        if (array_contains(var_e722466d58c00cc1, var_ad43ca064f182c3e)) {
            var_cf83385f8a939f54 = array_remove_index(var_cf83385f8a939f54, i);
        }
    }
    var_44d5a2614eed724e = 0;
    foreach (player in winners) {
        if (!isplayer(player)) {
            continue;
        }
        var_3e04fa138ec067f5 = 0;
        if (!isdefined(player.var_ae06891211af23ba)) {
            /#
                assert(var_44d5a2614eed724e < var_cf83385f8a939f54.size);
            #/
            player.var_ae06891211af23ba = var_cf83385f8a939f54[var_44d5a2614eed724e];
            var_3e04fa138ec067f5 = 1;
            var_44d5a2614eed724e++;
            var_e722466d58c00cc1[var_e722466d58c00cc1.size] = var_cf83385f8a939f54[var_44d5a2614eed724e];
        }
        var_688f5beee0172bbb = player.var_fb37db009207fe1a[player.var_ae06891211af23ba];
        var_86a1d4655bea5502 = player.var_769c9edd0782e95d[player.var_ae06891211af23ba];
        if (!isdefined(var_688f5beee0172bbb)) {
            var_688f5beee0172bbb = 0;
        }
        if (!isdefined(var_86a1d4655bea5502)) {
            var_86a1d4655bea5502 = 0;
        }
        player dlog_recordplayerevent("dlog_event_br_winner_accolade_data", [0:"accolade", 1:player.var_ae06891211af23ba, 2:"is_participation_trophy", 3:var_3e04fa138ec067f5, 4:"value", 5:float(var_688f5beee0172bbb), 6:"scaled_value", 7:float(var_86a1d4655bea5502)]);
        player.var_ae7b07ff9d949509 = undefined;
        player.var_fb37db009207fe1a = undefined;
        player.var_769c9edd0782e95d = undefined;
    }
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a60
// Size: 0x33
function private function_8c70e1b5fb997d3a(winners) {
    for (i = 0; i < winners.size; i++) {
        if (isplayer(winners[i])) {
            return i;
        }
    }
    return undefined;
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a9b
// Size: 0x64
function private function_95416c93789582a9(winners, index) {
    /#
        assert(index < winners.size);
    #/
    /#
        assert(isplayer(winners[index]));
    #/
    var_8e5aa8521f3435e = (index + 1) % winners.size;
    while (var_8e5aa8521f3435e != index) {
        if (isplayer(winners[var_8e5aa8521f3435e])) {
            return var_8e5aa8521f3435e;
        }
        var_8e5aa8521f3435e = (index + 1) % winners.size;
    }
    return var_8e5aa8521f3435e;
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b07
// Size: 0x591
function private function_6a7a8a710f348991(player) {
    /#
        var_8f2db317ebf49ac6 = getdvar(@"hash_7aa741226ec758e3", "interrogator");
        if (isdefined(level.var_bcf7be5c24905ab9[var_8f2db317ebf49ac6])) {
            return var_8f2db317ebf49ac6;
        }
        stringlist = strtok(getdvar(@"hash_b217b1fd0c1301e2", "interrogator"), "jup_wz_acc_killer_scene");
        if (stringlist.size > 2) {
            var_8f2db317ebf49ac6 = stringlist[0];
            if (isdefined(level.var_bcf7be5c24905ab9[var_8f2db317ebf49ac6])) {
                stringref = stringlist[1];
                var_d197acf3fc856feb = int(stringlist[2]);
                if (!isnumber(var_d197acf3fc856feb)) {
                    var_d197acf3fc856feb = 0;
                }
                player function_cab1aa0020df0892(var_8f2db317ebf49ac6, 999, stringref, var_d197acf3fc856feb);
                return var_8f2db317ebf49ac6;
            }
        }
    #/
    if (isdefined(player.var_769c9edd0782e95d["highachiever_coolest"]) && player.var_769c9edd0782e95d["highachiever_coolest"] > 0 && !function_fc64178f71375137(level.var_d1c6ce2aca9c7b81, "highachiever_coolest")) {
        return "highachiever_coolest";
    } else if (isdefined(player.var_769c9edd0782e95d["highachiever_cooler"]) && player.var_769c9edd0782e95d["highachiever_cooler"] > 0 && !function_fc64178f71375137(level.var_d1c6ce2aca9c7b81, "highachiever_cooler")) {
        return "highachiever_cooler";
    } else if (isdefined(player.var_769c9edd0782e95d["highachiever_cool"]) && player.var_769c9edd0782e95d["highachiever_cool"] > 0 && !function_fc64178f71375137(level.var_d1c6ce2aca9c7b81, "highachiever_cool")) {
        return "highachiever_cool";
    } else if (isdefined(player.var_769c9edd0782e95d["medalist_coolest"]) && player.var_769c9edd0782e95d["medalist_coolest"] > 0 && !function_fc64178f71375137(level.var_d1c6ce2aca9c7b81, "medalist_coolest")) {
        return "medalist_coolest";
    } else if (isdefined(player.var_769c9edd0782e95d["medalist_cooler"]) && player.var_769c9edd0782e95d["medalist_cooler"] > 0 && !function_fc64178f71375137(level.var_d1c6ce2aca9c7b81, "medalist_cooler")) {
        return "medalist_cooler";
    } else if (isdefined(player.var_769c9edd0782e95d["medalist_cool"]) && player.var_769c9edd0782e95d["medalist_cool"] > 0 && !function_fc64178f71375137(level.var_d1c6ce2aca9c7b81, "medalist_cool")) {
        return "medalist_cool";
    }
    var_2556a6fc8fab9b93 = 0;
    foreach (ref, entry in level.var_bcf7be5c24905ab9) {
        if (function_fc64178f71375137(level.var_9a2fe47bbb5d6729, ref)) {
            continue;
        }
        if (isdefined(player.var_769c9edd0782e95d[ref]) && player.var_769c9edd0782e95d[ref] >= 0.75) {
            var_2556a6fc8fab9b93++;
        }
    }
    if (var_2556a6fc8fab9b93 >= 7 && isdefined(level.var_bcf7be5c24905ab9["tryhard_coolest"]) && !function_fc64178f71375137(level.var_d1c6ce2aca9c7b81, "tryhard_coolest")) {
        return "tryhard_coolest";
    } else if (var_2556a6fc8fab9b93 >= 5 && isdefined(level.var_bcf7be5c24905ab9["tryhard_cooler"]) && !function_fc64178f71375137(level.var_d1c6ce2aca9c7b81, "tryhard_cooler")) {
        return "tryhard_cooler";
    } else if (var_2556a6fc8fab9b93 >= 3 && isdefined(level.var_bcf7be5c24905ab9["tryhard_cool"]) && !function_fc64178f71375137(level.var_d1c6ce2aca9c7b81, "tryhard_cool")) {
        return "tryhard_cool";
    }
    var_502e863aedfa7526 = getdvarfloat(@"hash_9c40aa930664958a", 0.25);
    var_1a6f71684f56f371 = 1;
    var_a8246df77b7223c5 = player getpersstat("kills");
    teammates = namespace_54d20dd0dd79277f::getteamdata(player.team, "players");
    foreach (var_8da93a53a38a3242 in teammates) {
        if (player == var_8da93a53a38a3242) {
            continue;
        }
        var_2c82554a0dbc1fc0 = var_8da93a53a38a3242 getpersstat("kills");
        if (var_a8246df77b7223c5 >= var_2c82554a0dbc1fc0) {
            var_1a6f71684f56f371 = 0;
        }
    }
    playerrank = player getrank() + 1;
    if (teammates.size < 2 || playerrank < 54) {
        var_1a6f71684f56f371 = 0;
    }
    foreach (ref, entry in level.var_bcf7be5c24905ab9) {
        if (function_fc64178f71375137(level.var_9a2fe47bbb5d6729, ref)) {
            continue;
        }
        if (isdefined(player.var_769c9edd0782e95d[ref]) && player.var_769c9edd0782e95d[ref] >= var_502e863aedfa7526) {
            var_1a6f71684f56f371 = 0;
            break;
        }
    }
    if (var_1a6f71684f56f371 && isdefined(level.var_bcf7be5c24905ab9["weakestlink"]) && !function_fc64178f71375137(level.var_d1c6ce2aca9c7b81, "weakestlink")) {
        return "weakestlink";
    }
    return undefined;
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50a0
// Size: 0x46d
function function_5864d7eeac0e9ac(winners, var_7fa848e5b3bbc437, var_807fea2fc7e90adc) {
    level.var_6b11625abe5346b0 = [];
    if (isdefined(var_807fea2fc7e90adc)) {
        foreach (idx, winner in winners) {
            if (!isplayer(winner) || winner iscodcaster()) {
                continue;
            }
            if (isdefined(var_807fea2fc7e90adc[idx]) && var_807fea2fc7e90adc[idx] != "" && isdefined(level.var_bcf7be5c24905ab9[var_807fea2fc7e90adc[idx]])) {
                var_16a81c74ce61860e = spawnstruct();
                var_16a81c74ce61860e.ref = var_807fea2fc7e90adc[idx];
                var_16a81c74ce61860e.player = winner;
                level.var_6b11625abe5346b0[level.var_6b11625abe5346b0.size] = var_16a81c74ce61860e;
            } else {
                /#
                    assert(isdefined(winner.var_ae06891211af23ba));
                #/
                var_16a81c74ce61860e = spawnstruct();
                var_16a81c74ce61860e.ref = winner.var_ae06891211af23ba;
                var_16a81c74ce61860e.player = winner;
                level.var_6b11625abe5346b0[level.var_6b11625abe5346b0.size] = var_16a81c74ce61860e;
            }
        }
        return;
    }
    /#
        if (getdvarint(@"hash_dc744c8d367adc1a", 0)) {
            foreach (ref, entry in level.var_bcf7be5c24905ab9) {
                var_16a81c74ce61860e = spawnstruct();
                var_16a81c74ce61860e.ref = ref;
                var_16a81c74ce61860e.player = level.players[0];
                level.var_6b11625abe5346b0[level.var_6b11625abe5346b0.size] = var_16a81c74ce61860e;
            }
            return;
        }
    #/
    switch (var_7fa848e5b3bbc437) {
    case 0:
        
    case 1:
        foreach (player in winners) {
            if (!isplayer(player) || player iscodcaster()) {
                continue;
            }
            /#
                assert(isdefined(player.var_ae06891211af23ba));
            #/
            var_16a81c74ce61860e = spawnstruct();
            var_16a81c74ce61860e.ref = player.var_ae06891211af23ba;
            var_16a81c74ce61860e.player = player;
            level.var_6b11625abe5346b0[level.var_6b11625abe5346b0.size] = var_16a81c74ce61860e;
        }
        break;
    case 2:
        var_362f690d4cbfc6f3 = array_randomize(level.var_bcf7be5c24905ab9);
        var_1a76078d68ffcf56 = function_8c70e1b5fb997d3a(winners);
        if (isdefined(var_1a76078d68ffcf56)) {
            foreach (ref, entry in var_362f690d4cbfc6f3) {
                var_16a81c74ce61860e = spawnstruct();
                var_16a81c74ce61860e.ref = ref;
                var_16a81c74ce61860e.player = winners[var_1a76078d68ffcf56];
                var_1a76078d68ffcf56 = function_95416c93789582a9(winners, var_1a76078d68ffcf56);
                level.var_6b11625abe5346b0[level.var_6b11625abe5346b0.size] = var_16a81c74ce61860e;
            }
        }
        break;
    case 3:
        var_81b900917ca1358e = array_randomize(level.var_bcf7be5c24905ab9);
        index = 0;
        foreach (player in winners) {
            if (!isplayer(player) || player iscodcaster()) {
                continue;
            }
            var_16a81c74ce61860e = spawnstruct();
            var_16a81c74ce61860e.ref = function_5162a2aaad39b2c7(var_81b900917ca1358e, index);
            var_16a81c74ce61860e.player = player;
            level.var_6b11625abe5346b0[level.var_6b11625abe5346b0.size] = var_16a81c74ce61860e;
            index++;
        }
        break;
    default:
        return;
    }
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5514
// Size: 0x2fd
function function_ebad1c4b67a19a0e() {
    /#
        level endon("killer");
        while (1) {
            dvar = function_2ef675c13ca1c4af(@"hash_3f0db1f9a7328433");
            dvarvalue = getdvar(dvar, "interrogator");
            if (isdefined(dvarvalue) && dvarvalue != "interrogator") {
                setdvar(dvar, "interrogator");
                player = function_dde7b9704a90774d(dvarvalue);
                if (!isdefined(player) && dvarvalue == 1) {
                    player = level.players[0];
                }
                if (isdefined(player)) {
                    foreach (ref, entry in level.var_bcf7be5c24905ab9) {
                        player function_bc603bc1a49d95ea(ref);
                    }
                }
            }
            dvar = function_2ef675c13ca1c4af(@"hash_e3d738ab702f7f92");
            dvarvalue = getdvar(dvar, "interrogator");
            if (isdefined(dvarvalue) && dvarvalue != "interrogator") {
                setdvar(dvar, "interrogator");
                player = function_dde7b9704a90774d(dvarvalue);
                if (!isdefined(player) && dvarvalue == 1) {
                    player = level.players[0];
                }
                if (isdefined(player)) {
                    foreach (ref, entry in level.var_bcf7be5c24905ab9) {
                        player function_2ec70b5bd640dbe2(ref);
                    }
                }
            }
            dvar = function_2ef675c13ca1c4af(@"hash_4ceb5a58a8157672");
            dvarvalue = getdvar(dvar, "interrogator");
            if (isdefined(dvarvalue) && dvarvalue != "interrogator") {
                setdvar(dvar, "interrogator");
                var_daae224a0246ce8e = strtok(dvarvalue, "jup_wz_acc_killer_scene");
                if (var_daae224a0246ce8e.size == 2) {
                    player = function_dde7b9704a90774d(var_daae224a0246ce8e[0]);
                    var_b37316fae4667b00 = var_daae224a0246ce8e[1];
                } else if (var_daae224a0246ce8e.size == 1) {
                    player = level.players[0];
                    var_b37316fae4667b00 = var_daae224a0246ce8e[0];
                } else {
                    continue;
                }
                if (array_contains_key(level.var_bcf7be5c24905ab9, var_b37316fae4667b00)) {
                    player function_bc603bc1a49d95ea(var_b37316fae4667b00);
                }
            }
            dvar = function_2ef675c13ca1c4af(@"hash_5e93c048f094d7bf");
            dvarvalue = getdvar(dvar, "interrogator");
            if (isdefined(dvarvalue) && dvarvalue != "interrogator") {
                setdvar(dvar, "interrogator");
                var_daae224a0246ce8e = strtok(dvarvalue, "jup_wz_acc_killer_scene");
                if (var_daae224a0246ce8e.size == 2) {
                    player = function_dde7b9704a90774d(var_daae224a0246ce8e[0]);
                    var_b37316fae4667b00 = var_daae224a0246ce8e[1];
                } else if (var_daae224a0246ce8e.size == 1) {
                    player = level.players[0];
                    var_b37316fae4667b00 = var_daae224a0246ce8e[0];
                } else {
                    continue;
                }
                if (array_contains_key(level.var_bcf7be5c24905ab9, var_b37316fae4667b00)) {
                    player function_2ec70b5bd640dbe2(var_b37316fae4667b00);
                }
            }
            wait(1);
        }
    #/
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5818
// Size: 0x96
function private function_dde7b9704a90774d(playername) {
    /#
        if (!isdefined(playername) || !isdefined(level.players) || level.players.size <= 0) {
            return undefined;
        }
        foreach (player in level.players) {
            if (player.name == playername) {
                return player;
            }
        }
        return undefined;
    #/
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x58b5
// Size: 0xcd
function private function_bc603bc1a49d95ea(ref) {
    /#
        if (!isdefined(ref) || !array_contains_key(level.var_bcf7be5c24905ab9, ref)) {
            return;
        }
        entry = level.var_bcf7be5c24905ab9[ref];
        /#
            assert(isdefined(entry.var_c0e23eeb5d47ec83));
        #/
        self [[ entry.var_c0e23eeb5d47ec83 ]](ref, entry.var_f873b3d73f52abbf);
        print("machinist" + self.name + "semtexKills" + ref + "jup_wz_acc_scavenger_scene" + self.var_fb37db009207fe1a[ref] + "jup_wz_acc_scout_scene" + self.var_769c9edd0782e95d[ref] + "killstreakUAVAssists");
        self.var_fb37db009207fe1a[ref] = undefined;
        self.var_769c9edd0782e95d[ref] = undefined;
    #/
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5989
// Size: 0x55
function private function_2ec70b5bd640dbe2(ref) {
    /#
        entry = level.var_bcf7be5c24905ab9[ref];
        /#
            assert(isdefined(entry.var_d6d8da4bfd3935ba));
        #/
        self [[ entry.var_d6d8da4bfd3935ba ]](ref, entry.var_f873b3d73f52abbf);
    #/
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x59e5
// Size: 0xbf
function private function_5ec9e0597a47f590(ref, params) {
    /#
        var_2d25f333132cb770 = 0;
        var_cb865f93adb30293 = [];
        /#
            assert(isdefined(namespace_3c5a4254f2b957ea::getpersstat("binocularMarks")));
        #/
        timesdowned = ter_op(isdefined(self.timesdowned), self.timesdowned, 0);
        var_cb865f93adb30293["binocularMarks"] = namespace_3c5a4254f2b957ea::getpersstat("binocularMarks");
        var_cb865f93adb30293["jup_wz_acc_supplier_scene"] = timesdowned;
        var_2d25f333132cb770 = timesdowned + namespace_3c5a4254f2b957ea::getpersstat("binocularMarks") * 3;
        var_cb865f93adb30293["strongholdsCaptured"] = var_2d25f333132cb770;
        var_cb865f93adb30293["trapper"] = max(0, function_9bbbefe6a0debd2b(ref, var_2d25f333132cb770));
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    #/
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x5aab
// Size: 0x89
function private function_4a6f9f6476301391(ref, params) {
    /#
        var_2d25f333132cb770 = 0;
        var_cb865f93adb30293 = [];
        /#
            assert(isdefined(namespace_3c5a4254f2b957ea::getpersstat("binocularMarks")));
        #/
        var_cb865f93adb30293["binocularMarks"] = namespace_3c5a4254f2b957ea::getpersstat("binocularMarks");
        if (namespace_3c5a4254f2b957ea::getpersstat("binocularMarks") == 0) {
            var_2d25f333132cb770 = 0.8;
        }
        var_cb865f93adb30293["strongholdsCaptured"] = var_2d25f333132cb770;
        var_cb865f93adb30293["trapper"] = var_2d25f333132cb770;
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    #/
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x5b3b
// Size: 0x140
function private function_f9cb44b2fa2cb71(ref, params) {
    /#
        var_2d25f333132cb770 = 0;
        var_cb865f93adb30293 = [];
        if (isdefined(self.plundercount)) {
            var_86a1d4655bea5502 = self.plundercount * function_5417d27691d41344(ref, "medalist_cool");
            var_2d25f333132cb770 = var_2d25f333132cb770 + var_86a1d4655bea5502;
            var_cb865f93adb30293["medalist_cool"] = "interrogator" + self.plundercount + "jup_wz_acc_scout_scene" + var_86a1d4655bea5502 + "killstreakUAVAssists";
        }
        if (isdefined(params)) {
            foreach (param in params) {
                if (isdefined(namespace_3c5a4254f2b957ea::getpersstat(param))) {
                    var_86a1d4655bea5502 = namespace_3c5a4254f2b957ea::getpersstat(param) * function_5417d27691d41344(ref, param);
                    var_2d25f333132cb770 = var_2d25f333132cb770 + var_86a1d4655bea5502;
                    var_cb865f93adb30293[param] = "interrogator" + namespace_3c5a4254f2b957ea::getpersstat(param) + "jup_wz_acc_scout_scene" + var_86a1d4655bea5502 + "killstreakUAVAssists";
                }
            }
        }
        var_cb865f93adb30293["strongholdsCaptured"] = var_2d25f333132cb770;
        var_cb865f93adb30293["trapper"] = max(0, function_9bbbefe6a0debd2b(ref, var_2d25f333132cb770));
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    #/
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x5c82
// Size: 0x87
function private function_176d8f69d69ec84d(ref, params) {
    /#
        var_cb865f93adb30293 = [];
        totalkills = namespace_3c5a4254f2b957ea::getpersstat("jup_wz_acc_weakestlink_scene");
        var_74ba9cc277cbe543 = namespace_3c5a4254f2b957ea::getpersstat("players");
        var_2d25f333132cb770 = 30 - 2 * totalkills + 30 - var_74ba9cc277cbe543;
        var_cb865f93adb30293["strongholdsCaptured"] = var_2d25f333132cb770;
        var_cb865f93adb30293["trapper"] = function_9bbbefe6a0debd2b(var_2d25f333132cb770);
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    #/
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5d10
// Size: 0x140
function function_4fd5f112e483ad54(ref, params) {
    /#
        var_2d25f333132cb770 = 0;
        var_cb865f93adb30293 = [];
        if (isdefined(self.lootcachesopened)) {
            var_86a1d4655bea5502 = self.lootcachesopened * function_5417d27691d41344(ref, "contracts_rolling");
            var_2d25f333132cb770 = var_2d25f333132cb770 + var_86a1d4655bea5502;
            var_cb865f93adb30293["contracts_rolling"] = "interrogator" + self.lootcachesopened + "jup_wz_acc_scout_scene" + var_86a1d4655bea5502 + "killstreakUAVAssists";
        }
        if (isdefined(params)) {
            foreach (param in params) {
                if (isdefined(namespace_3c5a4254f2b957ea::getpersstat(param))) {
                    var_86a1d4655bea5502 = namespace_3c5a4254f2b957ea::getpersstat(param) * function_5417d27691d41344(ref, param);
                    var_2d25f333132cb770 = var_2d25f333132cb770 + var_86a1d4655bea5502;
                    var_cb865f93adb30293[param] = "interrogator" + namespace_3c5a4254f2b957ea::getpersstat(param) + "jup_wz_acc_scout_scene" + var_86a1d4655bea5502 + "killstreakUAVAssists";
                }
            }
        }
        var_cb865f93adb30293["strongholdsCaptured"] = var_2d25f333132cb770;
        var_cb865f93adb30293["trapper"] = max(0, function_9bbbefe6a0debd2b(ref, var_2d25f333132cb770));
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    #/
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x5e57
// Size: 0x140
function private function_9c146e27d6a5e7e1(ref, params) {
    /#
        var_2d25f333132cb770 = 0;
        var_cb865f93adb30293 = [];
        if (isdefined(self.brmissionscompleted)) {
            var_86a1d4655bea5502 = self.brmissionscompleted * function_5417d27691d41344(ref, "pb_assist");
            var_2d25f333132cb770 = var_2d25f333132cb770 + var_86a1d4655bea5502;
            var_cb865f93adb30293["pb_assist"] = "interrogator" + self.brmissionscompleted + "jup_wz_acc_scout_scene" + var_86a1d4655bea5502 + "killstreakUAVAssists";
        }
        if (isdefined(params)) {
            foreach (param in params) {
                if (isdefined(namespace_3c5a4254f2b957ea::getpersstat(param))) {
                    var_86a1d4655bea5502 = namespace_3c5a4254f2b957ea::getpersstat(param) * function_5417d27691d41344(ref, param);
                    var_2d25f333132cb770 = var_2d25f333132cb770 + var_86a1d4655bea5502;
                    var_cb865f93adb30293[param] = "interrogator" + namespace_3c5a4254f2b957ea::getpersstat(param) + "jup_wz_acc_scout_scene" + var_86a1d4655bea5502 + "killstreakUAVAssists";
                }
            }
        }
        var_cb865f93adb30293["strongholdsCaptured"] = var_2d25f333132cb770;
        var_cb865f93adb30293["trapper"] = max(0, function_9bbbefe6a0debd2b(ref, var_2d25f333132cb770));
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    #/
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x5f9e
// Size: 0x17d
function private function_b12f9d6b95f241d0(ref, params) {
    /#
        totalkills = 0;
        var_cb865f93adb30293 = [];
        var_bb164e4df36286b4 = [0:"mb_return", 1:"stat", 2:"<unknown string>", 3:"<unknown string>", 4:"<unknown string>", 5:"<unknown string>"];
        var_4510b799408d140d = [0:"<unknown string>", 1:"<unknown string>"];
        foreach (var_7a2fa5a4563b3fec in var_bb164e4df36286b4) {
            val = namespace_3c5a4254f2b957ea::getpersstat(var_7a2fa5a4563b3fec);
            if (isdefined(val)) {
                totalkills = totalkills + val;
                var_cb865f93adb30293[var_7a2fa5a4563b3fec] = val;
            }
        }
        foreach (var_7a2fa5a4563b3fec in var_4510b799408d140d) {
            val = namespace_3c5a4254f2b957ea::getpersstat(var_7a2fa5a4563b3fec);
            if (isdefined(val)) {
                totalkills = totalkills - val;
                var_cb865f93adb30293[var_7a2fa5a4563b3fec] = -1 * val;
            }
        }
        var_cb865f93adb30293["strongholdsCaptured"] = totalkills;
        var_cb865f93adb30293["trapper"] = max(0, function_9bbbefe6a0debd2b(ref, totalkills));
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    #/
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6122
// Size: 0xf0
function function_6ab412e6faa588ea(ref, var_b6988561ffd1f3ad) {
    /#
        var_2d25f333132cb770 = 0;
        var_cb865f93adb30293 = [];
        if (isdefined(var_b6988561ffd1f3ad)) {
            foreach (param in var_b6988561ffd1f3ad) {
                if (isdefined(namespace_3c5a4254f2b957ea::getpersstat(param))) {
                    var_86a1d4655bea5502 = namespace_3c5a4254f2b957ea::getpersstat(param) * function_5417d27691d41344(ref, param);
                    var_2d25f333132cb770 = var_2d25f333132cb770 + var_86a1d4655bea5502;
                    var_cb865f93adb30293[param] = "interrogator" + namespace_3c5a4254f2b957ea::getpersstat(param) + "jup_wz_acc_scout_scene" + var_86a1d4655bea5502 + "killstreakUAVAssists";
                }
            }
        }
        var_cb865f93adb30293["strongholdsCaptured"] = var_2d25f333132cb770;
        var_cb865f93adb30293["trapper"] = max(0, function_9bbbefe6a0debd2b(ref, var_2d25f333132cb770));
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    #/
}

// Namespace namespace_8c2e78a6b4c1c6fd/namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x6219
// Size: 0xb1
function private function_7a384e4d0599485c(ref, var_cb865f93adb30293) {
    /#
        debugstr = "<unknown string>" + self.name + "semtexKills" + ref + "jup_wz_acc_scavenger_scene";
        if (isdefined(var_cb865f93adb30293) && var_cb865f93adb30293.size > 0) {
            foreach (key, value in var_cb865f93adb30293) {
                debugstr = debugstr + "<unknown string>" + key + "<unknown string>" + value + "jup_wz_acc_scavenger_scene";
            }
        }
        print(debugstr);
    #/
}

