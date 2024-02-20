// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs;

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs/namespace_3d5b99ceb1f529f8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x188
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs/namespace_3d5b99ceb1f529f8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs");
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs/namespace_3d5b99ceb1f529f8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x26b
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs/namespace_3d5b99ceb1f529f8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b2
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs/namespace_3d5b99ceb1f529f8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bc
// Size: 0x58
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ESCORT_ZOMBIES";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs/namespace_3d5b99ceb1f529f8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x31c
// Size: 0x52
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_3657d39239c45827":
        function_8887d7e962667822(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs/namespace_3d5b99ceb1f529f8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x375
// Size: 0x196
function function_8887d7e962667822(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5363, -8641, 2001), (0, 198, 0), "s_escort_zombies_oldtown", undefined, "escort_oldtown", undefined, undefined, (0, 0, 0));
    s = s();
    s.vehicletype = "veh9_mil_lnd_atv_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5363, -8641, 1963), (0, 198, 0), "atv_spawn", undefined, "escort_oldtown", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5378, -8636, 1975), (0, 288, 0), "escort_package", undefined, "escort_oldtown", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5411, -8625, 1963), (0, 17, 0), "interact_escort", undefined, "escort_oldtown", undefined, undefined, (0, 0, 0));
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1674, -8508, 2833.72), (0, 225, 0), "s_escort_zombies_oldtown_reward", undefined, undefined, undefined, undefined, (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs/namespace_3d5b99ceb1f529f8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x512
// Size: 0xa8
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_objectives_oldtown_zombies_escort_cs";
    var_5f614235e4cbbd5b.locationorigin = [0:(5293, -8660, 1955.29)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1500];
    var_fdc9acdc19473f08["ESCORT_ZOMBIES_OLDTOWN"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

