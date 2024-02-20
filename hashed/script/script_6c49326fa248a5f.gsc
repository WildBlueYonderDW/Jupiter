// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_ambient_biomes_cs;

// Namespace mp_jup_st_b_ob_ambient_biomes_cs/namespace_c670458343d549
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_ambient_biomes_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_ambient_biomes_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_ambient_biomes_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_ambient_biomes_cs/namespace_c670458343d549
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x145
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_ambient_biomes_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_ambient_biomes_cs");
}

// Namespace mp_jup_st_b_ob_ambient_biomes_cs/namespace_c670458343d549
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4
// Size: 0xa36
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-555.66, 36884.8, 1272.17), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1700);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3493.12, 37419.7, 1651.04), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2400);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6143.26, 37701.9, 1520.07), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2400);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1548.74, 35897.2, 1443.11), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1895.03, 37644.9, 1497.26), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-5802.97, 35583.7, 1334.14), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-5811.97, 37297.8, 1357.38), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7716.38, 36042.8, 1713.66), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9499.99, 36724.7, 1275.66), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11361.1, 36042.9, 1670.79), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4205.37, 33464.7, 1357.2), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1762.45, 33407.6, 1450.1), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1333.22, 33101.4, 1200.1), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5217.87, 32447.2, 1212.15), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9065.73, 32596.6, 1570.52), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7897.15, 30736.3, 1347.14), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3270.28, 34077.7, 1449.91), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2737.47, 31374, 1232.91), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14766.8, 32291.8, 1154.1), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14120.5, 29974.5, 1203.1), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13050.8, 27687.7, 1178.1), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-7937.99, 28692.4, 1159.28), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 3500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-870.98, 25131.5, 1133.29), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 5000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4916.22, 23264.6, 1304.89), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 5000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6096.35, 23742.4, 1428.18), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3966.01, 29723, 1286.5), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8873.11, 25639, 1212.5), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (12620.3, 24184, 991.49), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (12132.5, 22142.9, 985.67), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11704.7, 20708.7, 974.68), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-754.32, 18695.8, 1264.68), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3590.32, 36707.7, 1836.86), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-7548, 36435, 1533), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2000);
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_ambient_biomes_cs/namespace_c670458343d549
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf1
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

