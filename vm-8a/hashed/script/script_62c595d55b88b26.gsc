#using scripts\engine\utility.gsc;
#using script_3f8889c16399185c;
#using scripts\mp\gametypes\br_ending.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_6ad351ebd5a33280;

#namespace namespace_8c2e78a6b4c1c6fd;

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca8
// Size: 0x105e
function function_d32f459ab9f5e7af() {
    /#
        setdevdvarifuninitialized(@"hash_cf55e0f95935f5af", 1);
        setdevdvarifuninitialized(@"hash_ad33abd04b38d2fa", "<dev string:x1c>");
        setdevdvarifuninitialized(@"hash_ad33aad04b38d0c7", "<dev string:x1c>");
        setdevdvarifuninitialized(@"hash_ad33a9d04b38ce94", "<dev string:x1c>");
        setdevdvarifuninitialized(@"hash_ad33a8d04b38cc61", "<dev string:x1c>");
        setdevdvarifuninitialized(@"hash_ad33a7d04b38ca2e", "<dev string:x1c>");
        setdevdvarifuninitialized(@"hash_ad33a6d04b38c7fb", "<dev string:x1c>");
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
                        continue;
                    }
                    assert(!isdefined(level.var_e3fca817c22e740d[ref]));
                }
            }
        } else {
            assertex(isdefined(accoladelist.var_ed69fdc32e48c4ea), "br_accolades/accolades_init_sceneSystem: accoladeList.brexfilaccolades is undefined");
        }
    } else {
        assertex(isdefined(accoladelist), "br_accolades/accolades_init_sceneSystem: accoladeList is undefined");
    }
    level.var_bcf7be5c24905ab9 = [];
    level.var_5477e9d7bbf824bf = [];
    function_389e9b1947ae8a9d();
    function_5368e57349c65cd6();
    params = spawnstruct();
    params.scenename = "jup_wz_acc_assassin_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["executionKills", "meleeKills"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 1;
    function_fa624b8c032afcf7("assassin", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_assists_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["assists"];
    params.maxvalue = 8;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("assists", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_bigguns_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["killstreakKills"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 1;
    function_fa624b8c032afcf7("bigguns", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_breacher_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["stoppingPowerKills", "bossAgentKills"];
    for (i = 1; i <= 3; i++) {
        params.scoreparams[params.scoreparams.size] = "tier" + i + "NormalAgentKills";
        params.scoreparams[params.scoreparams.size] = "tier" + i + "EliteAgentKills";
    }
    params.maxvalue = 16;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("breacher", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_commando_scene";
    params.scorefunc = &function_f0496b6c16117c3f;
    params.datafunc = &function_755ff55065755233;
    /#
        params.debugfunc = &function_b12f9d6b95f241d0;
    #/
    params.maxvalue = 13;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("commando", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_ghost_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["deadSilenceKills", "throwingKnifeKills", "killstreakCUAVAssists", "silencedKills"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 1;
    function_1ef76151d5fb5218("ghost", "killstreakCUAVAssists", 0.5);
    function_fa624b8c032afcf7("ghost", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_interrogator_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["interrogations"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("interrogator", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_killer_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["kills"];
    params.maxvalue = 18;
    params.floor = 1;
    params.scale = 2;
    function_fa624b8c032afcf7("killer", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_machinist_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["smokesUsed", "flashbangHits", "trophySystemHits", "empDroneHits", "gasHits", "stunHits", "decoyHits", "deployableCoverUsed", "shockStickHits"];
    params.maxvalue = 11;
    params.floor = 1;
    params.scale = 0;
    function_1ef76151d5fb5218("machinist", "decoyHits", 0.1);
    function_1ef76151d5fb5218("machinist", "deployableCoverUsed", 0.1);
    function_1ef76151d5fb5218("machinist", "shockStickHits", 0.1);
    function_fa624b8c032afcf7("machinist", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_marksman_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["headshots", "totalMultikills", "penetrationKills"];
    params.maxvalue = 9;
    params.floor = 1;
    params.scale = 1;
    function_fa624b8c032afcf7("marksman", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_medic_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["rescues", "kioskRevives"];
    params.maxvalue = 6;
    params.floor = 1;
    params.scale = 1;
    function_fa624b8c032afcf7("medic", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_moneybags_scene";
    params.scorefunc = &function_8d32528bf59f4d60;
    params.datafunc = &function_a1d32055df3b7000;
    /#
        params.debugfunc = &function_f9cb44b2fa2cb71;
    #/
    params.scoreparams = ["highestPurchaseCost"];
    params.maxvalue = 5000;
    params.floor = 20;
    params.scale = 2;
    function_fa624b8c032afcf7("moneybags", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_pyro_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["fragKills", "molotovKills", "launcherKills", "semtexKills", "thermiteKills"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("pyro", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_scavenger_scene";
    params.scorefunc = &function_56c0ae4c11e6ecc3;
    params.datafunc = &function_c8209fbd2f8c013;
    /#
        params.debugfunc = &function_4fd5f112e483ad54;
    #/
    params.maxvalue = 22;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("scavenger", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_scout_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["reconDroneMarks", "killstreakUAVAssists", "killstreakAUAVAssists", "binocularMarks", "snapshotHits", "tacCamMarks"];
    params.maxvalue = 7;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("scout", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_sniper_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["longshotKills"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 1;
    function_fa624b8c032afcf7("sniper", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_supplier_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["munitionsBoxUsed", "armorBoxUsed"];
    params.maxvalue = 9;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("supplier", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_survivor_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["damageHealed", "gulagWins", "rescued", "revivedFromKiosk"];
    params.maxvalue = 59;
    params.floor = 1;
    params.scale = 2;
    function_1ef76151d5fb5218("survivor", "damageHealed", 0.1);
    function_fa624b8c032afcf7("survivor", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_teamobjectives_scene";
    params.scorefunc = &function_b9d90f8e9bf917b0;
    params.datafunc = &function_bd072f91ee4831b0;
    /#
        params.debugfunc = &function_9c146e27d6a5e7e1;
    #/
    params.scoreparams = ["blacksitesCaptured", "strongholdsCaptured"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("teamobjectives", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_trapper_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = ["claymoreKills", "c4Kills", "proximityMineKills"];
    params.maxvalue = 5;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("trapper", params);
    if (scripts\mp\gametypes\br_ending::can_play_ending()) {
        level.var_e3ac672a3513883f = &function_2cbdf94f9506ad4f;
        level.var_c3edd7b8c279a3e = &function_3e06f1c56df58044;
    }
    /#
        if (getdvarint(@"hash_cc732c73e93ea9d7", 0)) {
            thread function_ebad1c4b67a19a0e();
        }
    #/
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d0e
// Size: 0x6f0
function function_dd857d7c2bd2f1bd() {
    params = spawnstruct();
    params.scenename = "jup_wz_acc_deadweight_scene";
    params.scorefunc = &function_93ffafa2252e5dff;
    params.datafunc = &function_6381c928faf6229f;
    /#
        params.debugfunc = &function_5ec9e0597a47f590;
    #/
    params.scoreparams = ["deaths"];
    params.maxvalue = 1;
    params.floor = 0.001;
    params.scale = 2;
    function_fa624b8c032afcf7("deadweight", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_highachiever_cool_scene";
    params.scorefunc = &function_f546b635aa8b84d2;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = [];
    params.maxvalue = 8;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("highachiever_cool", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_highachiever_cooler_scene";
    params.scorefunc = &function_f546b635aa8b84d2;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = [];
    params.maxvalue = 8;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("highachiever_cooler", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_highachiever_coolest_scene";
    params.scorefunc = &function_f546b635aa8b84d2;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = [];
    params.maxvalue = 8;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("highachiever_coolest", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_immortal_scene";
    params.scorefunc = &function_47ad2469e6be0500;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_4a6f9f6476301391;
    #/
    params.scoreparams = ["deaths"];
    function_fa624b8c032afcf7("immortal", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_medalist_cool_scene";
    params.scorefunc = &function_f3f8f37d12315948;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = [];
    params.maxvalue = 8;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("medalist_cool", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_medalist_cooler_scene";
    params.scorefunc = &function_f3f8f37d12315948;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = [];
    params.maxvalue = 8;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("medalist_cooler", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_medalist_coolest_scene";
    params.scorefunc = &function_f3f8f37d12315948;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = [];
    params.maxvalue = 8;
    params.floor = 1;
    params.scale = 0;
    function_fa624b8c032afcf7("medalist_coolest", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_pacifist_scene";
    params.scorefunc = &function_e1271ea633c42ecc;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_176d8f69d69ec84d;
    #/
    params.scoreparams = ["kills", "assists"];
    params.maxvalue = 100;
    params.floor = 0;
    params.scale = 0;
    function_fa624b8c032afcf7("pacifist", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_tryhard_cool_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = [];
    function_fa624b8c032afcf7("tryhard_cool", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_tryhard_cooler_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = [];
    function_fa624b8c032afcf7("tryhard_cooler", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_tryhard_coolest_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = [];
    function_fa624b8c032afcf7("tryhard_coolest", params);
    params = spawnstruct();
    params.scenename = "jup_wz_acc_weakestlink_scene";
    params.scorefunc = &function_b13f6a12712eaa29;
    params.datafunc = &function_3f5a0a838086d8dd;
    /#
        params.debugfunc = &function_6ab412e6faa588ea;
    #/
    params.scoreparams = [];
    function_fa624b8c032afcf7("weakestlink", params);
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2406
// Size: 0x66
function private function_389e9b1947ae8a9d() {
    level.var_9a2fe47bbb5d6729 = ["weakestlink", "tryhard_cool", "tryhard_cooler", "tryhard_coolest", "medalist_cool", "medalist_cooler", "medalist_coolest", "highachiever_cool", "highachiever_cooler", "highachiever_coolest"];
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2474
// Size: 0x54
function private function_5368e57349c65cd6() {
    level.var_d1c6ce2aca9c7b81 = [];
    var_aed700f334c599e9 = strtok(getdvar(@"hash_b534c88be1278728", ""), " ");
    if (var_aed700f334c599e9.size > 0) {
        level.var_d1c6ce2aca9c7b81 = array_combine_unique(level.var_d1c6ce2aca9c7b81, var_aed700f334c599e9);
    }
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d0
// Size: 0x6e
function function_fa624b8c032afcf7(ref, paramstruct) {
    assert(isdefined(ref));
    assert(!isdefined(level.var_bcf7be5c24905ab9[ref]));
    assert(isdefined(paramstruct));
    assert(isdefined(paramstruct.scorefunc));
    paramstruct.name = ref;
    level.var_bcf7be5c24905ab9[ref] = paramstruct;
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2546
// Size: 0xd5
function function_2cbdf94f9506ad4f() {
    level endon("game_ended");
    self endon("disconnect");
    foreach (entry in level.var_bcf7be5c24905ab9) {
        if (isdefined(entry.scoreparams) && entry.scoreparams.size > 0) {
            foreach (persval in entry.scoreparams) {
                scripts\mp\utility\stats::initpersstat(persval);
            }
        }
    }
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2623
// Size: 0x2a
function function_1ef76151d5fb5218(accolade, stat, mod) {
    level.var_5477e9d7bbf824bf[accolade][stat] = mod;
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2655
// Size: 0x5b
function function_5417d27691d41344(accolade, stat) {
    if (!isdefined(level.var_5477e9d7bbf824bf) || !array_contains_key(level.var_5477e9d7bbf824bf, accolade) || !array_contains_key(level.var_5477e9d7bbf824bf[accolade], stat)) {
        return 1;
    }
    return level.var_5477e9d7bbf824bf[accolade][stat];
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x26b9
// Size: 0x23f
function private function_93ffafa2252e5dff(ref, params) {
    assert(isdefined(scripts\mp\utility\stats::getpersstat("deaths")));
    playerrank = getrank() + 1;
    teammates = scripts\mp\utility\teams::getteamdata(self.team, "players");
    if (teammates.size < 2 || playerrank < 54) {
        totalval = 0;
        self.var_fb37db009207fe1a[ref] = totalval;
        self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, totalval);
        return;
    }
    localkills = getpersstat("kills");
    localdeaths = getpersstat("deaths");
    localscore = getpersstat("score");
    secondbestscore = -1;
    foreach (player in teammates) {
        if (player == self) {
            continue;
        }
        pkills = player getpersstat("kills");
        pdeaths = player getpersstat("deaths");
        if (pkills <= localkills || pdeaths >= localdeaths) {
            totalval = 0;
            secondbestscore = -1;
            break;
        }
        pscore = player getpersstat("score");
        if (secondbestscore == -1 || pscore < secondbestscore) {
            secondbestscore = pscore;
        }
    }
    if (secondbestscore > 0) {
        var_81d57b941144b81c = getdvarfloat(@"hash_be569afee6af87f5", 0.2);
        var_fd506798b992cd0a = secondbestscore * var_81d57b941144b81c;
        var_32d1e481486eb81e = (localscore - var_fd506798b992cd0a) / (secondbestscore - var_fd506798b992cd0a);
        totalval = clamp(1 - var_32d1e481486eb81e, 0.001, 1);
    } else {
        totalval = 0;
    }
    self.var_fb37db009207fe1a[ref] = totalval;
    self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, totalval);
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2900
// Size: 0x65
function private function_47ad2469e6be0500(ref, params) {
    totalval = 0;
    assert(isdefined(scripts\mp\utility\stats::getpersstat("deaths")));
    if (scripts\mp\utility\stats::getpersstat("deaths") == 0) {
        totalval = 0.8;
    }
    self.var_fb37db009207fe1a[ref] = totalval;
    self.var_769c9edd0782e95d[ref] = totalval;
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x296d
// Size: 0xd0
function private function_8d32528bf59f4d60(ref, params) {
    totalval = 0;
    if (isdefined(self.plundercount)) {
        totalval += self.plundercount * function_5417d27691d41344(ref, "plunderCount");
    }
    if (isdefined(params)) {
        foreach (param in params) {
            if (isdefined(scripts\mp\utility\stats::getpersstat(param))) {
                totalval += scripts\mp\utility\stats::getpersstat(param) * function_5417d27691d41344(ref, param);
            }
        }
    }
    self.var_fb37db009207fe1a[ref] = totalval;
    self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, totalval);
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a45
// Size: 0x340
function private function_f3f8f37d12315948(ref, params) {
    totalwins = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "wins_chapter");
    if (totalwins < 1) {
        self.var_fb37db009207fe1a[ref] = 0;
        self.var_769c9edd0782e95d[ref] = 0;
        return;
    }
    highestkills = 0;
    highestrevives = 0;
    highestassist = 0;
    highestcontracts = 0;
    highestrespawns = 0;
    successscore = 0;
    currentkills = scripts\mp\utility\stats::getpersstat("kills");
    currentrevives = scripts\mp\utility\stats::getpersstat("rescues");
    currentassist = scripts\mp\utility\stats::getpersstat("assists");
    currentcontracts = scripts\mp\utility\stats::getpersstat("contracts");
    currentrespawns = scripts\mp\utility\stats::getpersstat("kioskRevives");
    textvalue = 0;
    recordname = "";
    var_5e7fd99bc2d17e16 = "";
    switch (ref) {
    case #"hash_1d132230c198824": 
        highestkills = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "kills_rolling");
        highestrevives = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "revives_rolling");
        highestassist = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "assist_rolling");
        highestcontracts = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "contracts_rolling");
        highestrespawns = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "respawns_rolling");
        var_5e7fd99bc2d17e16 = "_rolling";
        successscore = 0.8;
        break;
    case #"hash_37f4d05731e98df3": 
        highestkills = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "kills_seasonal");
        highestrevives = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "revives_seasonal");
        highestassist = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "assist_seasonal");
        highestcontracts = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "contracts_seasonal");
        highestrespawns = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "respawns_seasonal");
        var_5e7fd99bc2d17e16 = "_seasonal";
        successscore = 0.85;
        break;
    case #"hash_ffee7a4392a7837c": 
        highestkills = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "kills_chapter");
        highestrevives = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "revives_chapter");
        highestassist = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "assist_chapter");
        highestcontracts = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "contracts_chapter");
        highestrespawns = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "respawns_chapter");
        var_5e7fd99bc2d17e16 = "_chapter";
        successscore = 0.9;
        break;
    }
    totalval = 0;
    if (highestkills < currentkills && currentkills >= 6) {
        totalval = successscore;
        recordname = "pb_kill";
        textvalue = currentkills;
    } else if (highestrevives < currentrevives && currentrevives >= 6) {
        totalval = successscore;
        recordname = "pb_revive";
        textvalue = currentrevives;
    } else if (highestassist < currentassist && currentassist >= 6) {
        totalval = successscore;
        recordname = "pb_assist";
        textvalue = currentassist;
    } else if (highestcontracts < currentcontracts && currentcontracts >= 4) {
        totalval = successscore;
        recordname = "pb_contract";
        textvalue = currentcontracts;
    } else if (highestrespawns < currentrespawns && currentrespawns >= 4) {
        totalval = successscore;
        recordname = "pb_return";
        textvalue = currentrespawns;
    }
    function_cab1aa0020df0892(ref, totalval, recordname + var_5e7fd99bc2d17e16, textvalue);
    self.var_fb37db009207fe1a[ref] = totalval;
    self.var_769c9edd0782e95d[ref] = totalval;
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d8d
// Size: 0x881
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
        foreach (teamate in level.teamdata[self.team]["players"]) {
            temkills = teamate scripts\mp\utility\stats::getpersstat("kills");
            temrevives = teamate scripts\mp\utility\stats::getpersstat("rescues");
            temassist = teamate scripts\mp\utility\stats::getpersstat("assists");
            temcontracts = teamate scripts\mp\utility\stats::getpersstat("contracts");
            temrespawns = teamate scripts\mp\utility\stats::getpersstat("kioskRevives");
            if (temkills > level.var_4fb0509d0e36fc92["kills"]) {
                level.var_4fb0509d0e36fc92["kills"] = temkills;
            }
            if (temrevives > level.var_4fb0509d0e36fc92["rescues"]) {
                level.var_4fb0509d0e36fc92["rescues"] = temrevives;
            }
            if (temassist > level.var_4fb0509d0e36fc92["assists"]) {
                level.var_4fb0509d0e36fc92["assists"] = temassist;
            }
            if (temcontracts > level.var_4fb0509d0e36fc92["contracts"]) {
                level.var_4fb0509d0e36fc92["contracts"] = temcontracts;
            }
            if (temrespawns > level.var_4fb0509d0e36fc92["kioskRevives"]) {
                level.var_4fb0509d0e36fc92["kioskRevives"] = temrespawns;
            }
        }
    }
    highestkills = 0;
    highestrevives = 0;
    highestassist = 0;
    highestcontracts = 0;
    highestrespawns = 0;
    winrate = 0;
    top5rate = 0;
    top10rate = 0;
    top25rate = 0;
    currentkills = scripts\mp\utility\stats::getpersstat("kills");
    currentrevives = scripts\mp\utility\stats::getpersstat("rescues");
    currentassist = scripts\mp\utility\stats::getpersstat("assists");
    currentcontracts = scripts\mp\utility\stats::getpersstat("contracts");
    currentrespawns = scripts\mp\utility\stats::getpersstat("kioskRevives");
    currentwins = 0;
    currenttop5 = 0;
    currenttop10 = 0;
    currenttop25 = 0;
    successscore = 0;
    textvalue = 0;
    recordname = "";
    var_5e7fd99bc2d17e16 = "";
    switch (ref) {
    case #"hash_cefd45a5f0651582": 
        if (isdefined(level.var_c192bb3f79de7dbf)) {
            highestkills = level.var_c192bb3f79de7dbf["kills_rolling"];
            highestrevives = level.var_c192bb3f79de7dbf["revives_rolling"];
            highestassist = level.var_c192bb3f79de7dbf["assist_rolling"];
            highestcontracts = level.var_c192bb3f79de7dbf["contracts_rolling"];
            highestrespawns = level.var_c192bb3f79de7dbf["respawns_rolling"];
            winrate = level.var_c192bb3f79de7dbf["wins_rolling"];
            top5rate = level.var_c192bb3f79de7dbf["top5_rolling"];
            top10rate = level.var_c192bb3f79de7dbf["top10_rolling"];
            top25rate = level.var_c192bb3f79de7dbf["top25_rolling"];
        }
        currentwins = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "wins_rolling") + 1;
        currenttop5 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top5_rolling") + 1;
        currenttop10 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top10_rolling") + 1;
        currenttop25 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top25_rolling") + 1;
        successscore = 0.95;
        var_5e7fd99bc2d17e16 = "_rolling";
        break;
    case #"hash_67540269f1b46075": 
        if (isdefined(level.var_c192bb3f79de7dbf)) {
            highestkills = level.var_c192bb3f79de7dbf["kills_seasonal"];
            highestrevives = level.var_c192bb3f79de7dbf["revives_seasonal"];
            highestassist = level.var_c192bb3f79de7dbf["assist_seasonal"];
            highestcontracts = level.var_c192bb3f79de7dbf["contracts_seasonal"];
            highestrespawns = level.var_c192bb3f79de7dbf["respawns_seasonal"];
            winrate = level.var_c192bb3f79de7dbf["wins_seasonal"];
            top5rate = level.var_c192bb3f79de7dbf["top5_seasonal"];
            top10rate = level.var_c192bb3f79de7dbf["top10_seasonal"];
            top25rate = level.var_c192bb3f79de7dbf["top25_seasonal"];
        }
        currentwins = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "wins_seasonal") + 1;
        currenttop5 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top5_seasonal") + 1;
        currenttop10 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top10_seasonal") + 1;
        currenttop25 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top25_seasonal") + 1;
        successscore = 0.98;
        var_5e7fd99bc2d17e16 = "_seasonal";
        break;
    case #"hash_5d9ccfc77ef0e622": 
        if (isdefined(level.var_c192bb3f79de7dbf)) {
            highestkills = level.var_c192bb3f79de7dbf["kills_chapter"];
            highestrevives = level.var_c192bb3f79de7dbf["revives_chapter"];
            highestassist = level.var_c192bb3f79de7dbf["assist_chapter"];
            highestcontracts = level.var_c192bb3f79de7dbf["contracts_chapter"];
            highestrespawns = level.var_c192bb3f79de7dbf["respawns_chapter"];
            winrate = level.var_c192bb3f79de7dbf["wins_chapter"];
            top5rate = level.var_c192bb3f79de7dbf["top5_chapter"];
            top10rate = level.var_c192bb3f79de7dbf["top10_chapter"];
            top25rate = level.var_c192bb3f79de7dbf["top25_chapter"];
        }
        currentwins = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "wins_chapter") + 1;
        currenttop5 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top5_chapter") + 1;
        currenttop10 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top10_chapter") + 1;
        currenttop25 = namespace_8885c19c053dcb46::function_cfab25659633eefc(self, "top25_chapter") + 1;
        successscore = 1;
        var_5e7fd99bc2d17e16 = "_chapter";
        break;
    }
    totalval = 0;
    if (winrate < currentwins && currentwins >= 4) {
        totalval = successscore;
        recordname = "mb_first";
        textvalue = currentwins;
    } else if (top5rate < currenttop5 && currenttop5 >= 4) {
        totalval = successscore;
        recordname = "mb_top20";
        textvalue = currenttop5;
    } else if (top10rate < currenttop10 && currenttop10 >= 4) {
        totalval = successscore;
        recordname = "mb_top20";
        textvalue = currenttop10;
    } else if (top25rate < currenttop25 && currenttop25 >= 4) {
        totalval = successscore;
        recordname = "mb_top20";
        textvalue = currenttop25;
    } else if (highestkills < currentkills && currentkills >= 6 && highestkills >= level.var_4fb0509d0e36fc92["kills"]) {
        totalval = successscore;
        recordname = "mb_kill";
        textvalue = currentkills;
    } else if (highestrevives < currentrevives && currentrevives >= 6 && highestrevives >= level.var_4fb0509d0e36fc92["rescues"]) {
        totalval = successscore;
        recordname = "mb_revive";
        textvalue = currentrevives;
    } else if (highestassist < currentassist && currentassist >= 6 && highestassist >= level.var_4fb0509d0e36fc92["assists"]) {
        totalval = successscore;
        recordname = "mb_assist";
        textvalue = currentassist;
    } else if (highestcontracts < currentcontracts && currentcontracts >= 4 && highestcontracts >= level.var_4fb0509d0e36fc92["contracts"]) {
        totalval = successscore;
        recordname = "mb_contract";
        textvalue = currentcontracts;
    } else if (highestrespawns < currentrespawns && currentrespawns >= 4 && highestrespawns >= level.var_4fb0509d0e36fc92["kioskRevives"]) {
        totalval = successscore;
        recordname = "mb_return";
        textvalue = currentrespawns;
    }
    function_cab1aa0020df0892(ref, totalval, recordname + var_5e7fd99bc2d17e16, textvalue);
    self.var_fb37db009207fe1a[ref] = totalval;
    self.var_769c9edd0782e95d[ref] = totalval;
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3616
// Size: 0x96
function private function_cab1aa0020df0892(ref, scorevalue, overridename, textvalue) {
    if (scorevalue > 0 && !arraycontains(level.var_d1c6ce2aca9c7b81, ref)) {
        if (isdefined(self.var_f090ccb984435bbc)) {
            if (self.var_d254e61d5b0ee746 < scorevalue) {
                self.var_f090ccb984435bbc = overridename;
                self.var_d254e61d5b0ee746 = scorevalue;
                self.var_5e71ee49d0cc6534 = textvalue;
            }
            return;
        }
        self.var_f090ccb984435bbc = overridename;
        self.var_d254e61d5b0ee746 = scorevalue;
        self.var_5e71ee49d0cc6534 = textvalue;
    }
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x36b4
// Size: 0x77
function private function_e1271ea633c42ecc(ref, params) {
    totalkills = scripts\mp\utility\stats::getpersstat("kills");
    var_74ba9cc277cbe543 = scripts\mp\utility\stats::getpersstat("assists");
    totalval = 100 - 100 * totalkills + 3 * var_74ba9cc277cbe543;
    self.var_fb37db009207fe1a[ref] = totalval;
    self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, totalval);
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3733
// Size: 0xd0
function function_56c0ae4c11e6ecc3(ref, params) {
    totalval = 0;
    if (isdefined(self.lootcachesopened)) {
        totalval += self.lootcachesopened * function_5417d27691d41344(ref, "lootCachesOpened");
    }
    if (isdefined(params)) {
        foreach (param in params) {
            if (isdefined(scripts\mp\utility\stats::getpersstat(param))) {
                totalval += scripts\mp\utility\stats::getpersstat(param) * function_5417d27691d41344(ref, param);
            }
        }
    }
    self.var_fb37db009207fe1a[ref] = totalval;
    self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, totalval);
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x380b
// Size: 0xd0
function private function_b9d90f8e9bf917b0(ref, params) {
    totalval = 0;
    if (isdefined(self.brmissionscompleted)) {
        totalval += self.brmissionscompleted * function_5417d27691d41344(ref, "brMissionsCompleted");
    }
    if (isdefined(params)) {
        foreach (param in params) {
            if (isdefined(scripts\mp\utility\stats::getpersstat(param))) {
                totalval += scripts\mp\utility\stats::getpersstat(param) * function_5417d27691d41344(ref, param);
            }
        }
    }
    self.var_fb37db009207fe1a[ref] = totalval;
    self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, totalval);
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x38e3
// Size: 0x35
function private function_a72f9ae578e162e8(ref, params) {
    self.var_fb37db009207fe1a[ref] = -1;
    self.var_769c9edd0782e95d[ref] = -1;
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3920
// Size: 0x157
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
        assert(data.maxvalue > minvalue);
        value = float(value - minvalue) / float(data.maxvalue - minvalue);
    }
    if (isdefined(data.scale) && data.scale == 2) {
        value = pow(value, 1.2);
    }
    return value;
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a80
// Size: 0xb9
function function_b13f6a12712eaa29(ref, data_points) {
    assert(isdefined(data_points));
    totalval = 0;
    foreach (data_point in data_points) {
        val = scripts\mp\utility\stats::getpersstat(data_point);
        if (isdefined(val)) {
            totalval += val * function_5417d27691d41344(ref, data_point);
        }
    }
    self.var_fb37db009207fe1a[ref] = totalval;
    self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, totalval);
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3b41
// Size: 0x159
function private function_f0496b6c16117c3f(ref, params) {
    totalkills = 0;
    addcategories = ["pistolKills", "shotgunKills", "smgKills", "arKills", "lmgKills", "sniperKills"];
    subtractcategories = ["longshotKills", "pointBlankKills"];
    foreach (statref in addcategories) {
        val = scripts\mp\utility\stats::getpersstat(statref);
        if (isdefined(val)) {
            totalkills += val;
        }
    }
    foreach (statref in subtractcategories) {
        val = scripts\mp\utility\stats::getpersstat(statref);
        if (isdefined(val)) {
            totalkills -= val;
        }
    }
    self.var_fb37db009207fe1a[ref] = totalkills;
    self.var_769c9edd0782e95d[ref] = function_9bbbefe6a0debd2b(ref, totalkills);
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ca2
// Size: 0x52
function private function_6381c928faf6229f(ref, params) {
    otherstats = [];
    if (isdefined(self.timesdowned)) {
        otherstats["timesDowned"] = self.timesdowned;
    } else {
        otherstats["timesDowned"] = 0;
    }
    return function_a0c339eeaf1dadb5(ref, params, otherstats);
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cfd
// Size: 0x52
function private function_a1d32055df3b7000(ref, params) {
    otherstats = [];
    if (isdefined(self.plundercount)) {
        otherstats["plunderCount"] = self.plundercount;
    } else {
        otherstats["plunderCount"] = 0;
    }
    return function_a0c339eeaf1dadb5(ref, params, otherstats);
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d58
// Size: 0x52
function function_c8209fbd2f8c013(ref, params) {
    otherstats = [];
    if (isdefined(self.lootcachesopened)) {
        otherstats["lootCachesOpened"] = self.lootcachesopened;
    } else {
        otherstats["lootCachesOpened"] = 0;
    }
    return function_a0c339eeaf1dadb5(ref, params, otherstats);
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3db3
// Size: 0x52
function private function_bd072f91ee4831b0(ref, params) {
    otherstats = [];
    if (isdefined(self.brmissionscompleted)) {
        otherstats["brMissionsCompleted"] = self.brmissionscompleted;
    } else {
        otherstats["brMissionsCompleted"] = 0;
    }
    return function_a0c339eeaf1dadb5(ref, params, otherstats);
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3e0e
// Size: 0x156
function private function_755ff55065755233(ref, params) {
    totalkills = 0;
    addcategories = ["pistolKills", "shotgunKills", "smgKills", "arKills", "lmgKills", "sniperKills"];
    subtractcategories = ["longshotKills", "pointBlankKills"];
    foreach (statref in addcategories) {
        val = scripts\mp\utility\stats::getpersstat(statref);
        if (isdefined(val)) {
            totalkills += val;
        }
    }
    foreach (statref in subtractcategories) {
        val = scripts\mp\utility\stats::getpersstat(statref);
        if (isdefined(val)) {
            totalkills -= val;
        }
    }
    otherstats = [];
    otherstats["midRangeKills"] = totalkills;
    return function_a0c339eeaf1dadb5(ref, params, otherstats);
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f6d
// Size: 0x1b
function function_3f5a0a838086d8dd(ref, params) {
    return function_a0c339eeaf1dadb5(ref, params);
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f91
// Size: 0x19b
function private function_a0c339eeaf1dadb5(ref, persstats, otherstats) {
    data = spawnstruct();
    data.ref = ref;
    data.statdata = [];
    totalval = 0;
    if (isdefined(persstats)) {
        foreach (stat in persstats) {
            value = 0;
            scaledval = 0;
            if (isdefined(scripts\mp\utility\stats::getpersstat(stat))) {
                value = scripts\mp\utility\stats::getpersstat(stat);
                scaledval = value * function_5417d27691d41344(ref, stat);
                totalval += scaledval;
            }
            data.statdata[stat][0] = value;
            data.statdata[stat][1] = scaledval;
        }
    }
    if (isdefined(otherstats)) {
        foreach (stat, value in otherstats) {
            if (isdefined(value)) {
                scaledval = value * function_5417d27691d41344(ref, stat);
                totalval += scaledval;
                data.statdata[stat][0] = value;
                data.statdata[stat][1] = scaledval;
            }
        }
    }
    data.value = totalval;
    data.scaledvalue = function_9bbbefe6a0debd2b(ref, totalval);
    return data;
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4135
// Size: 0x213
function function_97113d2008e3d1f6() {
    accolades = [];
    foreach (ref, entry in level.var_bcf7be5c24905ab9) {
        assert(isdefined(entry.datafunc));
        data = self [[ entry.datafunc ]](ref, entry.scoreparams);
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
        foreach (sref, entry in data.statdata) {
            svalue = 0;
            var_882e5ffb508915f1 = 0;
            if (isdefined(entry) && entry.size >= 2) {
                if (isdefined(entry[0])) {
                    svalue = max(0, entry[0]);
                }
                if (isdefined(entry[1])) {
                    var_882e5ffb508915f1 = max(0, entry[1]);
                }
            }
            var_9659c2342b30ad90[var_9659c2342b30ad90.size] = ["stat", sref, "value", svalue, "scaledvalue", var_882e5ffb508915f1];
        }
        var_1384d9221443f717.stats = var_9659c2342b30ad90;
        accolades[accolades.size] = var_1384d9221443f717;
    }
    return accolades;
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4351
// Size: 0xc5
function function_3e06f1c56df58044() {
    data = function_97113d2008e3d1f6();
    foreach (accolade in data) {
        self dlog_recordplayerevent("dlog_event_br_accolade_data", ["stats", accolade.stats, "accolade", accolade.ref, "value", accolade.value, "scaledvalue", accolade.scaledvalue]);
    }
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x441e
// Size: 0x63a
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
        assert(isdefined(entry.scorefunc));
        foreach (player in winners) {
            if (!isplayer(player)) {
                continue;
            }
            assert(!isdefined(player.var_fb37db009207fe1a[ref]));
            assert(!isdefined(player.var_769c9edd0782e95d[ref]));
            player [[ entry.scorefunc ]](ref, entry.scoreparams);
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
        bestref = function_6a7a8a710f348991(player);
        if (!isdefined(bestref)) {
            var_3513c54632ecb882 = -1;
            foreach (ref in player.var_ae7b07ff9d949509) {
                if (arraycontains(level.var_d1c6ce2aca9c7b81, ref)) {
                    continue;
                }
                if (array_contains(var_e722466d58c00cc1, ref)) {
                    continue;
                }
                if (player.var_769c9edd0782e95d[ref] > var_3513c54632ecb882) {
                    var_3513c54632ecb882 = player.var_769c9edd0782e95d[ref];
                    bestref = ref;
                }
            }
        }
        if (isdefined(bestref)) {
            player.var_ae06891211af23ba = bestref;
            var_e722466d58c00cc1[var_e722466d58c00cc1.size] = bestref;
        }
    }
    var_cf83385f8a939f54 = ["survivor", "scout", "scavenger", "ghost"];
    var_cf83385f8a939f54 = array_randomize(var_cf83385f8a939f54);
    var_cf83385f8a939f54 = array_combine(var_cf83385f8a939f54, ["killer", "breacher", "moneybags"]);
    for (i = var_cf83385f8a939f54.size - 1; i >= 0; i--) {
        testref = var_cf83385f8a939f54[i];
        if (array_contains(var_e722466d58c00cc1, testref)) {
            var_cf83385f8a939f54 = array_remove_index(var_cf83385f8a939f54, i);
        }
    }
    awardindex = 0;
    foreach (player in winners) {
        if (!isplayer(player)) {
            continue;
        }
        var_3e04fa138ec067f5 = 0;
        if (!isdefined(player.var_ae06891211af23ba)) {
            assert(awardindex < var_cf83385f8a939f54.size);
            player.var_ae06891211af23ba = var_cf83385f8a939f54[awardindex];
            var_3e04fa138ec067f5 = 1;
            awardindex++;
            var_e722466d58c00cc1[var_e722466d58c00cc1.size] = var_cf83385f8a939f54[awardindex];
        }
        var_688f5beee0172bbb = player.var_fb37db009207fe1a[player.var_ae06891211af23ba];
        scaledval = player.var_769c9edd0782e95d[player.var_ae06891211af23ba];
        if (!isdefined(var_688f5beee0172bbb)) {
            var_688f5beee0172bbb = 0;
        }
        if (!isdefined(scaledval)) {
            scaledval = 0;
        }
        player dlog_recordplayerevent("dlog_event_br_winner_accolade_data", ["accolade", player.var_ae06891211af23ba, "is_participation_trophy", var_3e04fa138ec067f5, "value", float(var_688f5beee0172bbb), "scaled_value", float(scaledval)]);
        player.var_ae7b07ff9d949509 = undefined;
        player.var_fb37db009207fe1a = undefined;
        player.var_769c9edd0782e95d = undefined;
    }
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a60
// Size: 0x32
function private function_8c70e1b5fb997d3a(winners) {
    for (i = 0; i < winners.size; i++) {
        if (isplayer(winners[i])) {
            return i;
        }
    }
    return undefined;
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a9b
// Size: 0x63
function private function_95416c93789582a9(winners, index) {
    assert(index < winners.size);
    assert(isplayer(winners[index]));
    for (tryindex = (index + 1) % winners.size; tryindex != index; tryindex = (index + 1) % winners.size) {
        if (isplayer(winners[tryindex])) {
            return tryindex;
        }
    }
    return tryindex;
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b07
// Size: 0x590
function private function_6a7a8a710f348991(player) {
    /#
        var_8f2db317ebf49ac6 = getdvar(@"hash_7aa741226ec758e3", "<dev string:x1c>");
        if (isdefined(level.var_bcf7be5c24905ab9[var_8f2db317ebf49ac6])) {
            return var_8f2db317ebf49ac6;
        }
        stringlist = strtok(getdvar(@"hash_b217b1fd0c1301e2", "<dev string:x1c>"), "<dev string:x1d>");
        if (stringlist.size > 2) {
            var_8f2db317ebf49ac6 = stringlist[0];
            if (isdefined(level.var_bcf7be5c24905ab9[var_8f2db317ebf49ac6])) {
                stringref = stringlist[1];
                textvalue = int(stringlist[2]);
                if (!isnumber(textvalue)) {
                    textvalue = 0;
                }
                player function_cab1aa0020df0892(var_8f2db317ebf49ac6, 999, stringref, textvalue);
                return var_8f2db317ebf49ac6;
            }
        }
    #/
    if (isdefined(player.var_769c9edd0782e95d["highachiever_coolest"]) && player.var_769c9edd0782e95d["highachiever_coolest"] > 0 && !arraycontains(level.var_d1c6ce2aca9c7b81, "highachiever_coolest")) {
        return "highachiever_coolest";
    } else if (isdefined(player.var_769c9edd0782e95d["highachiever_cooler"]) && player.var_769c9edd0782e95d["highachiever_cooler"] > 0 && !arraycontains(level.var_d1c6ce2aca9c7b81, "highachiever_cooler")) {
        return "highachiever_cooler";
    } else if (isdefined(player.var_769c9edd0782e95d["highachiever_cool"]) && player.var_769c9edd0782e95d["highachiever_cool"] > 0 && !arraycontains(level.var_d1c6ce2aca9c7b81, "highachiever_cool")) {
        return "highachiever_cool";
    } else if (isdefined(player.var_769c9edd0782e95d["medalist_coolest"]) && player.var_769c9edd0782e95d["medalist_coolest"] > 0 && !arraycontains(level.var_d1c6ce2aca9c7b81, "medalist_coolest")) {
        return "medalist_coolest";
    } else if (isdefined(player.var_769c9edd0782e95d["medalist_cooler"]) && player.var_769c9edd0782e95d["medalist_cooler"] > 0 && !arraycontains(level.var_d1c6ce2aca9c7b81, "medalist_cooler")) {
        return "medalist_cooler";
    } else if (isdefined(player.var_769c9edd0782e95d["medalist_cool"]) && player.var_769c9edd0782e95d["medalist_cool"] > 0 && !arraycontains(level.var_d1c6ce2aca9c7b81, "medalist_cool")) {
        return "medalist_cool";
    }
    var_2556a6fc8fab9b93 = 0;
    foreach (ref, entry in level.var_bcf7be5c24905ab9) {
        if (arraycontains(level.var_9a2fe47bbb5d6729, ref)) {
            continue;
        }
        if (isdefined(player.var_769c9edd0782e95d[ref]) && player.var_769c9edd0782e95d[ref] >= 0.75) {
            var_2556a6fc8fab9b93++;
        }
    }
    if (var_2556a6fc8fab9b93 >= 7 && isdefined(level.var_bcf7be5c24905ab9["tryhard_coolest"]) && !arraycontains(level.var_d1c6ce2aca9c7b81, "tryhard_coolest")) {
        return "tryhard_coolest";
    } else if (var_2556a6fc8fab9b93 >= 5 && isdefined(level.var_bcf7be5c24905ab9["tryhard_cooler"]) && !arraycontains(level.var_d1c6ce2aca9c7b81, "tryhard_cooler")) {
        return "tryhard_cooler";
    } else if (var_2556a6fc8fab9b93 >= 3 && isdefined(level.var_bcf7be5c24905ab9["tryhard_cool"]) && !arraycontains(level.var_d1c6ce2aca9c7b81, "tryhard_cool")) {
        return "tryhard_cool";
    }
    var_502e863aedfa7526 = getdvarfloat(@"hash_9c40aa930664958a", 0.25);
    var_1a6f71684f56f371 = 1;
    localkills = player getpersstat("kills");
    teammates = scripts\mp\utility\teams::getteamdata(player.team, "players");
    foreach (var_8da93a53a38a3242 in teammates) {
        if (player == var_8da93a53a38a3242) {
            continue;
        }
        pkills = var_8da93a53a38a3242 getpersstat("kills");
        if (localkills >= pkills) {
            var_1a6f71684f56f371 = 0;
        }
    }
    playerrank = player getrank() + 1;
    if (teammates.size < 2 || playerrank < 54) {
        var_1a6f71684f56f371 = 0;
    }
    foreach (ref, entry in level.var_bcf7be5c24905ab9) {
        if (arraycontains(level.var_9a2fe47bbb5d6729, ref)) {
            continue;
        }
        if (isdefined(player.var_769c9edd0782e95d[ref]) && player.var_769c9edd0782e95d[ref] >= var_502e863aedfa7526) {
            var_1a6f71684f56f371 = 0;
            break;
        }
    }
    if (var_1a6f71684f56f371 && isdefined(level.var_bcf7be5c24905ab9["weakestlink"]) && !arraycontains(level.var_d1c6ce2aca9c7b81, "weakestlink")) {
        return "weakestlink";
    }
    return undefined;
}

// Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50a0
// Size: 0x46c
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
                continue;
            }
            assert(isdefined(winner.var_ae06891211af23ba));
            var_16a81c74ce61860e = spawnstruct();
            var_16a81c74ce61860e.ref = winner.var_ae06891211af23ba;
            var_16a81c74ce61860e.player = winner;
            level.var_6b11625abe5346b0[level.var_6b11625abe5346b0.size] = var_16a81c74ce61860e;
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
        return;
    case 1: 
        foreach (player in winners) {
            if (!isplayer(player) || player iscodcaster()) {
                continue;
            }
            assert(isdefined(player.var_ae06891211af23ba));
            var_16a81c74ce61860e = spawnstruct();
            var_16a81c74ce61860e.ref = player.var_ae06891211af23ba;
            var_16a81c74ce61860e.player = player;
            level.var_6b11625abe5346b0[level.var_6b11625abe5346b0.size] = var_16a81c74ce61860e;
        }
        break;
    case 2: 
        var_362f690d4cbfc6f3 = array_randomize(level.var_bcf7be5c24905ab9);
        winnerindex = function_8c70e1b5fb997d3a(winners);
        if (isdefined(winnerindex)) {
            foreach (ref, entry in var_362f690d4cbfc6f3) {
                var_16a81c74ce61860e = spawnstruct();
                var_16a81c74ce61860e.ref = ref;
                var_16a81c74ce61860e.player = winners[winnerindex];
                winnerindex = function_95416c93789582a9(winners, winnerindex);
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
            var_16a81c74ce61860e.ref = getarraykey(var_81b900917ca1358e, index);
            var_16a81c74ce61860e.player = player;
            level.var_6b11625abe5346b0[level.var_6b11625abe5346b0.size] = var_16a81c74ce61860e;
            index++;
        }
        break;
    default: 
        return;
    }
}

/#

    // Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5514
    // Size: 0x2fc
    function function_ebad1c4b67a19a0e() {
        level endon("<dev string:x1f>");
        while (true) {
            dvar = hashcat(@"hash_3f0db1f9a7328433");
            dvarvalue = getdvar(dvar, "<dev string:x1c>");
            if (isdefined(dvarvalue) && dvarvalue != "<dev string:x1c>") {
                setdvar(dvar, "<dev string:x1c>");
                player = getplayerinstance(dvarvalue);
                if (!isdefined(player) && dvarvalue == 1) {
                    player = level.players[0];
                }
                if (isdefined(player)) {
                    foreach (ref, entry in level.var_bcf7be5c24905ab9) {
                        player function_bc603bc1a49d95ea(ref);
                    }
                }
            }
            dvar = hashcat(@"hash_e3d738ab702f7f92");
            dvarvalue = getdvar(dvar, "<dev string:x1c>");
            if (isdefined(dvarvalue) && dvarvalue != "<dev string:x1c>") {
                setdvar(dvar, "<dev string:x1c>");
                player = getplayerinstance(dvarvalue);
                if (!isdefined(player) && dvarvalue == 1) {
                    player = level.players[0];
                }
                if (isdefined(player)) {
                    foreach (ref, entry in level.var_bcf7be5c24905ab9) {
                        player function_2ec70b5bd640dbe2(ref);
                    }
                }
            }
            dvar = hashcat(@"hash_4ceb5a58a8157672");
            dvarvalue = getdvar(dvar, "<dev string:x1c>");
            if (isdefined(dvarvalue) && dvarvalue != "<dev string:x1c>") {
                setdvar(dvar, "<dev string:x1c>");
                splitval = strtok(dvarvalue, "<dev string:x1d>");
                if (splitval.size == 2) {
                    player = getplayerinstance(splitval[0]);
                    var_b37316fae4667b00 = splitval[1];
                } else if (splitval.size == 1) {
                    player = level.players[0];
                    var_b37316fae4667b00 = splitval[0];
                } else {
                    continue;
                }
                if (array_contains_key(level.var_bcf7be5c24905ab9, var_b37316fae4667b00)) {
                    player function_bc603bc1a49d95ea(var_b37316fae4667b00);
                }
            }
            dvar = hashcat(@"hash_5e93c048f094d7bf");
            dvarvalue = getdvar(dvar, "<dev string:x1c>");
            if (isdefined(dvarvalue) && dvarvalue != "<dev string:x1c>") {
                setdvar(dvar, "<dev string:x1c>");
                splitval = strtok(dvarvalue, "<dev string:x1d>");
                if (splitval.size == 2) {
                    player = getplayerinstance(splitval[0]);
                    var_b37316fae4667b00 = splitval[1];
                } else if (splitval.size == 1) {
                    player = level.players[0];
                    var_b37316fae4667b00 = splitval[0];
                } else {
                    continue;
                }
                if (array_contains_key(level.var_bcf7be5c24905ab9, var_b37316fae4667b00)) {
                    player function_2ec70b5bd640dbe2(var_b37316fae4667b00);
                }
            }
            wait 1;
        }
    }

    // Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x5818
    // Size: 0x95
    function private getplayerinstance(playername) {
        if (!isdefined(playername) || !isdefined(level.players) || level.players.size <= 0) {
            return undefined;
        }
        foreach (player in level.players) {
            if (player.name == playername) {
                return player;
            }
        }
        return undefined;
    }

    // Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x58b5
    // Size: 0xcc
    function private function_bc603bc1a49d95ea(ref) {
        if (!isdefined(ref) || !array_contains_key(level.var_bcf7be5c24905ab9, ref)) {
            return;
        }
        entry = level.var_bcf7be5c24905ab9[ref];
        assert(isdefined(entry.scorefunc));
        self [[ entry.scorefunc ]](ref, entry.scoreparams);
        print("<dev string:x2a>" + self.name + "<dev string:x3b>" + ref + "<dev string:x3e>" + self.var_fb37db009207fe1a[ref] + "<dev string:x40>" + self.var_769c9edd0782e95d[ref] + "<dev string:x42>");
        self.var_fb37db009207fe1a[ref] = undefined;
        self.var_769c9edd0782e95d[ref] = undefined;
    }

    // Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x5989
    // Size: 0x54
    function private function_2ec70b5bd640dbe2(ref) {
        entry = level.var_bcf7be5c24905ab9[ref];
        assert(isdefined(entry.debugfunc));
        self [[ entry.debugfunc ]](ref, entry.scoreparams);
    }

    // Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x59e5
    // Size: 0xbe
    function private function_5ec9e0597a47f590(ref, params) {
        totalval = 0;
        var_cb865f93adb30293 = [];
        assert(isdefined(scripts\mp\utility\stats::getpersstat("<dev string:x44>")));
        timesdowned = ter_op(isdefined(self.timesdowned), self.timesdowned, 0);
        var_cb865f93adb30293["<dev string:x44>"] = scripts\mp\utility\stats::getpersstat("<dev string:x44>");
        var_cb865f93adb30293["<dev string:x4b>"] = timesdowned;
        totalval = timesdowned + scripts\mp\utility\stats::getpersstat("<dev string:x44>") * 3;
        var_cb865f93adb30293["<dev string:x57>"] = totalval;
        var_cb865f93adb30293["<dev string:x5d>"] = max(0, function_9bbbefe6a0debd2b(ref, totalval));
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    }

    // Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x5aab
    // Size: 0x88
    function private function_4a6f9f6476301391(ref, params) {
        totalval = 0;
        var_cb865f93adb30293 = [];
        assert(isdefined(scripts\mp\utility\stats::getpersstat("<dev string:x44>")));
        var_cb865f93adb30293["<dev string:x44>"] = scripts\mp\utility\stats::getpersstat("<dev string:x44>");
        if (scripts\mp\utility\stats::getpersstat("<dev string:x44>") == 0) {
            totalval = 0.8;
        }
        var_cb865f93adb30293["<dev string:x57>"] = totalval;
        var_cb865f93adb30293["<dev string:x5d>"] = totalval;
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    }

    // Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x5b3b
    // Size: 0x13f
    function private function_f9cb44b2fa2cb71(ref, params) {
        totalval = 0;
        var_cb865f93adb30293 = [];
        if (isdefined(self.plundercount)) {
            scaledval = self.plundercount * function_5417d27691d41344(ref, "<dev string:x6a>");
            totalval += scaledval;
            var_cb865f93adb30293["<dev string:x6a>"] = "<dev string:x1c>" + self.plundercount + "<dev string:x40>" + scaledval + "<dev string:x42>";
        }
        if (isdefined(params)) {
            foreach (param in params) {
                if (isdefined(scripts\mp\utility\stats::getpersstat(param))) {
                    scaledval = scripts\mp\utility\stats::getpersstat(param) * function_5417d27691d41344(ref, param);
                    totalval += scaledval;
                    var_cb865f93adb30293[param] = "<dev string:x1c>" + scripts\mp\utility\stats::getpersstat(param) + "<dev string:x40>" + scaledval + "<dev string:x42>";
                }
            }
        }
        var_cb865f93adb30293["<dev string:x57>"] = totalval;
        var_cb865f93adb30293["<dev string:x5d>"] = max(0, function_9bbbefe6a0debd2b(ref, totalval));
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    }

    // Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x5c82
    // Size: 0x86
    function private function_176d8f69d69ec84d(ref, params) {
        var_cb865f93adb30293 = [];
        totalkills = scripts\mp\utility\stats::getpersstat("<dev string:x77>");
        var_74ba9cc277cbe543 = scripts\mp\utility\stats::getpersstat("<dev string:x7d>");
        totalval = 30 - 2 * totalkills + 30 - var_74ba9cc277cbe543;
        var_cb865f93adb30293["<dev string:x57>"] = totalval;
        var_cb865f93adb30293["<dev string:x5d>"] = function_9bbbefe6a0debd2b(totalval);
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    }

    // Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x5d10
    // Size: 0x13f
    function function_4fd5f112e483ad54(ref, params) {
        totalval = 0;
        var_cb865f93adb30293 = [];
        if (isdefined(self.lootcachesopened)) {
            scaledval = self.lootcachesopened * function_5417d27691d41344(ref, "<dev string:x85>");
            totalval += scaledval;
            var_cb865f93adb30293["<dev string:x85>"] = "<dev string:x1c>" + self.lootcachesopened + "<dev string:x40>" + scaledval + "<dev string:x42>";
        }
        if (isdefined(params)) {
            foreach (param in params) {
                if (isdefined(scripts\mp\utility\stats::getpersstat(param))) {
                    scaledval = scripts\mp\utility\stats::getpersstat(param) * function_5417d27691d41344(ref, param);
                    totalval += scaledval;
                    var_cb865f93adb30293[param] = "<dev string:x1c>" + scripts\mp\utility\stats::getpersstat(param) + "<dev string:x40>" + scaledval + "<dev string:x42>";
                }
            }
        }
        var_cb865f93adb30293["<dev string:x57>"] = totalval;
        var_cb865f93adb30293["<dev string:x5d>"] = max(0, function_9bbbefe6a0debd2b(ref, totalval));
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    }

    // Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x5e57
    // Size: 0x13f
    function private function_9c146e27d6a5e7e1(ref, params) {
        totalval = 0;
        var_cb865f93adb30293 = [];
        if (isdefined(self.brmissionscompleted)) {
            scaledval = self.brmissionscompleted * function_5417d27691d41344(ref, "<dev string:x96>");
            totalval += scaledval;
            var_cb865f93adb30293["<dev string:x96>"] = "<dev string:x1c>" + self.brmissionscompleted + "<dev string:x40>" + scaledval + "<dev string:x42>";
        }
        if (isdefined(params)) {
            foreach (param in params) {
                if (isdefined(scripts\mp\utility\stats::getpersstat(param))) {
                    scaledval = scripts\mp\utility\stats::getpersstat(param) * function_5417d27691d41344(ref, param);
                    totalval += scaledval;
                    var_cb865f93adb30293[param] = "<dev string:x1c>" + scripts\mp\utility\stats::getpersstat(param) + "<dev string:x40>" + scaledval + "<dev string:x42>";
                }
            }
        }
        var_cb865f93adb30293["<dev string:x57>"] = totalval;
        var_cb865f93adb30293["<dev string:x5d>"] = max(0, function_9bbbefe6a0debd2b(ref, totalval));
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    }

    // Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x5f9e
    // Size: 0x17c
    function private function_b12f9d6b95f241d0(ref, params) {
        totalkills = 0;
        var_cb865f93adb30293 = [];
        addcategories = ["<dev string:xaa>", "<dev string:xb6>", "<dev string:xc3>", "<dev string:xcc>", "<dev string:xd4>", "<dev string:xdd>"];
        subtractcategories = ["<dev string:xe9>", "<dev string:xf7>"];
        foreach (statref in addcategories) {
            val = scripts\mp\utility\stats::getpersstat(statref);
            if (isdefined(val)) {
                totalkills += val;
                var_cb865f93adb30293[statref] = val;
            }
        }
        foreach (statref in subtractcategories) {
            val = scripts\mp\utility\stats::getpersstat(statref);
            if (isdefined(val)) {
                totalkills -= val;
                var_cb865f93adb30293[statref] = -1 * val;
            }
        }
        var_cb865f93adb30293["<dev string:x57>"] = totalkills;
        var_cb865f93adb30293["<dev string:x5d>"] = max(0, function_9bbbefe6a0debd2b(ref, totalkills));
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    }

    // Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x6122
    // Size: 0xef
    function function_6ab412e6faa588ea(ref, data_points) {
        totalval = 0;
        var_cb865f93adb30293 = [];
        if (isdefined(data_points)) {
            foreach (param in data_points) {
                if (isdefined(scripts\mp\utility\stats::getpersstat(param))) {
                    scaledval = scripts\mp\utility\stats::getpersstat(param) * function_5417d27691d41344(ref, param);
                    totalval += scaledval;
                    var_cb865f93adb30293[param] = "<dev string:x1c>" + scripts\mp\utility\stats::getpersstat(param) + "<dev string:x40>" + scaledval + "<dev string:x42>";
                }
            }
        }
        var_cb865f93adb30293["<dev string:x57>"] = totalval;
        var_cb865f93adb30293["<dev string:x5d>"] = max(0, function_9bbbefe6a0debd2b(ref, totalval));
        function_7a384e4d0599485c(ref, var_cb865f93adb30293);
    }

    // Namespace namespace_8c2e78a6b4c1c6fd / namespace_ab7fb53f62c7ae2e
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x6219
    // Size: 0xb0
    function private function_7a384e4d0599485c(ref, var_cb865f93adb30293) {
        debugstr = "<dev string:x107>" + self.name + "<dev string:x3b>" + ref + "<dev string:x3e>";
        if (isdefined(var_cb865f93adb30293) && var_cb865f93adb30293.size > 0) {
            foreach (key, value in var_cb865f93adb30293) {
                debugstr += "<dev string:x121>" + key + "<dev string:x123>" + value + "<dev string:x3e>";
            }
        }
        print(debugstr);
    }

#/
