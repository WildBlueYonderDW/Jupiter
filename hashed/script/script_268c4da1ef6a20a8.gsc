// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_48814951e916af89;
#using scripts\mp\flags.gsc;

#namespace dmz_ai;

// Namespace dmz_ai / namespace_b27abd42d87cb8c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f
// Size: 0x9b
function init() {
    if (getdvarfloat(@"hash_3545ca86ff96cb37", 0.34) != 0) {
        scripts/engine/utility::registersharedfunc("ai", "dropLootOnAgentDeath", &namespace_bfef6903bca5845d::function_82ed67ae79913551);
    }
    namespace_bfef6903bca5845d::function_5aee5d819f7dfd1c();
    while (!scripts/mp/flags::gameflagexists("prematch_done")) {
        waitframe();
    }
    scripts/mp/flags::gameflagwait("prematch_done");
    setsaveddvar(@"hash_df03d7ac5b31599", 1);
    function_e00cc8c1c5cc38fb(1);
    function_3875866b3a6d349(1);
    function_4ff17efd15d01d3f(256);
    function_1611d0f6b5f84b9a(700);
    level thread function_3c5c2e3402f0431e();
    level thread function_bbbd3531ab976b5e();
}

// Namespace dmz_ai / namespace_b27abd42d87cb8c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211
// Size: 0x37
function function_3c5c2e3402f0431e() {
    waittime = getdvarint(@"hash_ba0cc4a1f73de4c", 10);
    if (waittime > 0) {
        wait(waittime);
    }
    namespace_bfef6903bca5845d::function_35bae74232ff8b77(0);
    namespace_bfef6903bca5845d::function_2b36368b8b1b2b30(1);
}

// Namespace dmz_ai / namespace_b27abd42d87cb8c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24f
// Size: 0x2d
function function_bbbd3531ab976b5e() {
    waittime = getdvarint(@"hash_e1b4b41af9d69b3b", 15);
    if (waittime > 0) {
        wait(waittime);
    }
    namespace_bfef6903bca5845d::function_3c44b8551d08ac1d();
}

// Namespace dmz_ai / namespace_b27abd42d87cb8c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x283
// Size: 0x9b
function function_428703950599c9e9() {
    namespace_bfef6903bca5845d::function_b1d1e7e3b23e0dfe(["mission", "perfTesting", "fortressGuards", "fortressPatrols", "reinforcements", "elites", "extraGuards", "extraPatrols", "firstKillFodder", "spawnPackage", "civilian", "vehiclePatrol", "bosses", "bossMinions", "convoy_attack", "huntSquad"]);
}

