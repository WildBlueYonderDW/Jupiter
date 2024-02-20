// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_c_ob_activities_bigbounty_cs;

// Namespace mp_jup_st_c_ob_activities_bigbounty_cs/namespace_6bf54ebad9bc411c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x207
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_c_ob_activities_bigbounty_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_c_ob_activities_bigbounty_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_c_ob_activities_bigbounty_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_c_ob_activities_bigbounty_cs/namespace_6bf54ebad9bc411c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27b
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_c_ob_activities_bigbounty_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_c_ob_activities_bigbounty_cs");
}

// Namespace mp_jup_st_c_ob_activities_bigbounty_cs/namespace_6bf54ebad9bc411c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ea
// Size: 0x2689
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30474, 33213, 1303.5), (0, 276.75, 0), "bigbounty_spawn", "C_NORTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30725.5, 31899, 1360), (0, 237.08, 0), "bigbounty_spawn", "C_NORTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31523.5, 40951, 928), (0, 232.58, 0), "bigbounty_spawn", "C_NORTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30318.5, 41205.5, 1192), (0, 153.17, 0), "bigbounty_spawn", "C_NORTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32252, 40432.5, 942), (0, 25.89, 0), "bigbounty_spawn", "C_NORTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32247, 40425.5, 937), (0, 34.51, 0), "bigbounty_spawn", "C_NORTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31043.5, 34515, 1192), (0, 150.94, 0), "bigbounty_spawn", "C_NORTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31045.5, 34518, 1192), (0, 151.27, 0), "bigbounty_spawn", "C_NORTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32181.5, 39886.5, 1181), (0, 66.28, 0), "bigbounty_spawn", "C_NORTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34264.5, 36178, 1080), (0, 140.85, 0), "bigbounty_spawn", "C_NORTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34264.5, 36178, 1080), (0, 143.23, 0), "bigbounty_spawn", "C_NORTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32056, 37070, 1088.5), (0, 66.28, 0), "bigbounty_spawn", "C_NORTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37878, 30530.5, 1764), (0, 182.11, 0), "bigbounty_spawn", "C_NORTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37878, 30530.5, 1764), (0, 182.4, 0), "bigbounty_spawn", "C_NORTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42775.5, 34244.5, 2576), (0, 272.36, 0), "bigbounty_spawn", "C_NORTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30725.5, 31899, 1360), (0, 241.55, 0), "bigbounty_spawn", "C_NORTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43945.5, 32954, 2708), (0, 233.88, 0), "bigbounty_spawn", "C_NORTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42347, 33240.5, 2577), (0, 58.95, 0), "bigbounty_spawn", "C_NORTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38748, 28448.5, 1785), (0, 88.86, 0), "bigbounty_spawn", "C_NORTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38745, 28446.5, 1787), (0, 92.29, 0), "bigbounty_spawn", "C_NORTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28970.5, 33604, 1344), (0, 329.63, 0), "bigbounty_spawn", "C_NORTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28970.5, 33604, 1344), (0, 331.19, 0), "bigbounty_spawn", "C_NORTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33323.5, 27941, 1896), (0, 56.7, 0), "bigbounty_spawn", "C_NORTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33372.5, 27907.5, 1896), (0, 55.62, 0), "bigbounty_spawn", "C_NORTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27693, 35581.5, 1184), (0, 358.2, 0), "bigbounty_spawn", "C_NORTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36839.5, 31745.5, 1772), (0, 333.18, 0), "bigbounty_spawn", "C_NORTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31766.5, 33878, 1224), (0, 31.87, 0), "bigbounty_spawn", "C_NORTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23969, 33939, 1546.5), (0, 258.68, 0), "bigbounty_spawn", "C_NORTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30126.5, 36473, 1100.5), (0, 247.92, 0), "bigbounty_spawn", "C_NORTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29649, 31536, 1344), (0, 236.46, 0), "bigbounty_spawn", "C_NORTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26549, 33346, 1350.5), (0, 331.48, 0), "bigbounty_spawn", "C_NORTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32652.5, 30915.5, 1349), (0, 150.37, 0), "bigbounty_spawn", "C_NORTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36012.5, 27958, 1692), (0, 150.37, 0), "bigbounty_spawn", "C_NORTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39306.5, 27105.5, 1779), (0, 175.63, 0), "bigbounty_spawn", "C_NORTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41343, 29734, 1762), (0, 230.01, 0), "bigbounty_spawn", "C_NORTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29120, 30586, 1256), (0, 241.18, 0), "bigbounty_spawn", "C_NORTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21164, 21780.5, 1646), (0, 242.63, 0), "bigbounty_spawn", "C_SOUTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24030, 27540, 1368), (0, 274.91, 0), "bigbounty_spawn", "C_SOUTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26610.5, 20692, 1352), (0, 89.7, 0), "bigbounty_spawn", "C_SOUTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22532.5, 26648, 1361.5), (0, 343.14, 0), "bigbounty_spawn", "C_SOUTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22532.5, 26648, 1361.5), (0, 343.14, 0), "bigbounty_spawn", "C_SOUTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24030, 27540, 1368), (0, 239.04, 0), "bigbounty_spawn", "C_SOUTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23550.5, 26399.5, 1360), (0, 206.62, 0), "bigbounty_spawn", "C_SOUTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28616.5, 21671, 1351.5), (0, 182.23, 0), "bigbounty_spawn", "C_SOUTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28616.5, 21671, 1351.5), (0, 178.92, 0), "bigbounty_spawn", "C_SOUTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28500, 26447.5, 1399.5), (0, 238.98, 0), "bigbounty_spawn", "C_SOUTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28500, 26447.5, 1399.5), (0, 239.17, 0), "bigbounty_spawn", "C_SOUTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27916, 27194, 1363), (0, 261.19, 0), "bigbounty_spawn", "C_SOUTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24713.5, 23341.5, 1389), (0, 87.16, 0), "bigbounty_spawn", "C_SOUTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24713.5, 23341.5, 1389), (0, 85.71, 0), "bigbounty_spawn", "C_SOUTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25088, 24775, 1668), (0, 211.27, 0), "bigbounty_spawn", "C_SOUTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27948.5, 23318, 1424), (0, 167.7, 0), "bigbounty_spawn", "C_SOUTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27853.5, 23954.5, 1428), (0, 173.89, 0), "bigbounty_spawn", "C_SOUTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27853.5, 23954.5, 1428), (0, 181.05, 0), "bigbounty_spawn", "C_SOUTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31883.5, 23514.5, 1560), (0, 287.9, 0), "bigbounty_spawn", "C_SOUTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31883.5, 23514.5, 1561), (0, 286.45, 0), "bigbounty_spawn", "C_SOUTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31035.5, 22696.5, 1832), (359.99, 41.17, -0.65), "bigbounty_spawn", "C_SOUTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25077.5, 20476.5, 1362.5), (0.64, 121.31, -0.12), "bigbounty_spawn", "C_SOUTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22883, 21136, 1352), (0, 293.51, 0), "bigbounty_spawn", "C_SOUTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22883, 21136, 1352), (0, 88.35, 0), "bigbounty_spawn", "C_SOUTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28723, 21045.5, 1351), (359.35, 312.48, -0.02), "bigbounty_spawn", "C_SOUTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mangler_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25159.5, 21645.5, 1380), (0, 355.85, 0), "bigbounty_spawn", "C_SOUTH", "mangler", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "disciple_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25171.5, 21644.5, 1380), (0, 357.14, 0), "bigbounty_spawn", "C_SOUTH", "disciple", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28148, 18055, 1355.5), (0, 26.14, 0), "bigbounty_spawn", "C_SOUTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26611, 22898, 1350.5), (0, 89.06, 0), "bigbounty_spawn", "C_SOUTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23086.5, 22368.5, 1356), (0, 181.53, 0), "bigbounty_spawn", "C_SOUTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26614, 25537.5, 1354), (0, 181.53, 0), "bigbounty_spawn", "C_SOUTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "mimic_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24113.5, 27969, 1368), (0, 281.7, 0), "bigbounty_spawn", "C_SOUTH", "mimic", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24877.5, 27213.5, 1358), (0, 82.29, 0), "bigbounty_spawn", "C_SOUTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28123.5, 28832, 1322), (0, 236.74, 0), "bigbounty_spawn", "C_SOUTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28962, 25931.5, 1385.5), (0, 257.86, 0), "bigbounty_spawn", "C_SOUTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.groupid = "Spawn";
    s.name = "megabomb_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22532, 28612.5, 1358), (0, 314.02, 0), "bigbounty_spawn", "C_SOUTH", "megabomb", undefined, undefined, (0, 0, 0), (0, 0, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_activities_bigbounty_cs/namespace_6bf54ebad9bc411c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x297a
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_c_ob_activities_bigbounty_cs/namespace_6bf54ebad9bc411c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2984
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_c_ob_activities_bigbounty_cs");
}

// Namespace mp_jup_st_c_ob_activities_bigbounty_cs/namespace_6bf54ebad9bc411c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x299a
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_BIGBOUNTY";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_bigbounty";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_c_ob_activities_bigbounty_cs/namespace_6bf54ebad9bc411c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a0b
// Size: 0x9d
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_4c7659274c466ba7":
        function_8cd799132e0d5d08(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_7be0196303eaf1da":
        function_89a763120bd2d7(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_662265b9066b58fe":
        function_30dfab0d592ee8d3(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_c86d8631b810093":
        function_eced6c05f659966(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_c_ob_activities_bigbounty_cs/namespace_6bf54ebad9bc411c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aaf
// Size: 0x112
function function_8cd799132e0d5d08(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "BIGBOUNTY_C_NORTH_TABLE", "BIGBOUNTY_C_NORTH_TABLE", undefined, undefined, (29906.5, 39658.5, 1152.5), (0, 187.46, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "bigbounty_region", "BIGBOUNTY_C_NORTH_TABLE", "C_NORTH", undefined, undefined, (29906.5, 39658.5, 1152.5), (0, 187.46, 0));
}

// Namespace mp_jup_st_c_ob_activities_bigbounty_cs/namespace_6bf54ebad9bc411c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bc8
// Size: 0x112
function function_89a763120bd2d7(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "BIGBOUNTY_C_NORTH_SERVER", "BIGBOUNTY_C_NORTH_SERVER", undefined, undefined, (36767, 31556.5, 1805), (0, 258.64, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "bigbounty_region", "BIGBOUNTY_C_NORTH_SERVER", "C_NORTH", undefined, undefined, (36767, 31556.5, 1805), (0, 258.64, 0));
}

// Namespace mp_jup_st_c_ob_activities_bigbounty_cs/namespace_6bf54ebad9bc411c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ce1
// Size: 0x112
function function_30dfab0d592ee8d3(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "BIGBOUNTY_C_SOUTH_DESK", "BIGBOUNTY_C_SOUTH_DESK", undefined, undefined, (22763, 27863, 1393), (0, 7.88, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "bigbounty_region", "BIGBOUNTY_C_SOUTH_DESK", "C_SOUTH", undefined, undefined, (22763, 27863, 1393), (0, 7.88, 0));
}

// Namespace mp_jup_st_c_ob_activities_bigbounty_cs/namespace_6bf54ebad9bc411c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dfa
// Size: 0x112
function function_eced6c05f659966(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "BIGBOUNTY_C_SOUTH_JAIL", "BIGBOUNTY_C_SOUTH_JAIL", undefined, undefined, (27702, 23099.5, 1467), (0, 107.24, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "bigbounty_region", "BIGBOUNTY_C_SOUTH_JAIL", "C_SOUTH", undefined, undefined, (27702, 23099.5, 1467), (0, 107.24, 0));
}

// Namespace mp_jup_st_c_ob_activities_bigbounty_cs/namespace_6bf54ebad9bc411c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f13
// Size: 0x361
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_bigbounty";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (29906.5, 39658.5, 1152.5);
    var_5f614235e4cbbd5b.locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(29906.5, 39658.5, 1152.5)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 187.46, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["BIGBOUNTY_C_NORTH_TABLE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_bigbounty";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (36767, 31556.5, 1805);
    var_5f614235e4cbbd5b.locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(36767, 31556.5, 1805)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 258.64, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["BIGBOUNTY_C_NORTH_SERVER"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_bigbounty";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (22763, 27863, 1393);
    var_5f614235e4cbbd5b.locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(22763, 27863, 1393)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 7.88, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["BIGBOUNTY_C_SOUTH_DESK"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_bigbounty";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_bigbounty_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (27702, 23099.5, 1467);
    var_5f614235e4cbbd5b.locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(27702, 23099.5, 1467)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 107.24, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["BIGBOUNTY_C_SOUTH_JAIL"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

