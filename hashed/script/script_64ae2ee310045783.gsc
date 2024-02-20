// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_seismic_refractor_cs;

// Namespace mp_jup_st_e_ob_seismic_refractor_cs/namespace_d6faaebb6e35dfb7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x212
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_seismic_refractor_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_seismic_refractor_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_seismic_refractor_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_seismic_refractor_cs/namespace_d6faaebb6e35dfb7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x286
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_seismic_refractor_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_seismic_refractor_cs");
}

// Namespace mp_jup_st_e_ob_seismic_refractor_cs/namespace_d6faaebb6e35dfb7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2f5
// Size: 0x73
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_seismic_refractor_cs/namespace_d6faaebb6e35dfb7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36f
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_seismic_refractor_cs/namespace_d6faaebb6e35dfb7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x379
// Size: 0x58
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_SEISMIC_REFRACTOR";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_seismic_refractor_cs/namespace_d6faaebb6e35dfb7
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3d9
// Size: 0x101
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_e_ob_seismic_refractor_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_8ad03b65bbe40304":
        function_b6a0fe0d9d944ab(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_b081a12274000cb9":
        function_7b49d85e4bda2c44(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_79a31bd15a5be30c":
        function_829cec4eebeb6af9(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_503df1308cd100d8":
        function_6b0f4f6f283926bd(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_5f108540989d4c83":
        function_3975bffbed220912(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_596abb4a6858f904":
        function_6412a9e5ecf5ba41(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_4ab766a30a714eee":
        function_a79653f329fcabdd(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_9d365094e6a61798":
        function_cc05a92fc572b91(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_e_ob_seismic_refractor_cs/namespace_d6faaebb6e35dfb7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4e1
// Size: 0x82
function function_b6a0fe0d9d944ab(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "SEISMIC_REFRACTOR_LOWTOWN", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_seismic_refractor_cs/namespace_d6faaebb6e35dfb7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x56a
// Size: 0x93
function function_7b49d85e4bda2c44(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.script_linkto = "1";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4875, 4092, 1303), (0, 0, 0), "SEISMIC_REFRACTOR_OLDTOWN_ROADSIDE", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_seismic_refractor_cs/namespace_d6faaebb6e35dfb7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x604
// Size: 0x93
function function_829cec4eebeb6af9(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.script_linkto = "1";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20063, -9625, 2249), (0, 0, 0), "SEISMIC_REFRACTOR_LOWTOWN_ROADSIDE", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_seismic_refractor_cs/namespace_d6faaebb6e35dfb7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x69e
// Size: 0x93
function function_6b0f4f6f283926bd(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.script_linkto = "1";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1172, -2048, 1662), (0, 0, 0), "SEISMIC_REFRACTOR_OLDTOWN_CITYSIDE", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_seismic_refractor_cs/namespace_d6faaebb6e35dfb7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x738
// Size: 0x93
function function_3975bffbed220912(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.script_linkto = "1";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9840, -6975, 1845.5), (0, 0, 0), "SEISMIC_REFRACTOR_OLDTOWN_FOOTHILL", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_seismic_refractor_cs/namespace_d6faaebb6e35dfb7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7d2
// Size: 0x93
function function_6412a9e5ecf5ba41(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.script_linkto = "1";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3177, 2850, 1449), (0, 0, 0), "SEISMIC_REFRACTOR_OLDTOWN_STAIRWAY", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_seismic_refractor_cs/namespace_d6faaebb6e35dfb7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x86c
// Size: 0x93
function function_a79653f329fcabdd(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.script_linkto = "1";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19055, -611, 1846), (0, 0, 0), "SEISMIC_REFRACTOR_LOWTOWN_RIVERSIDE", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_seismic_refractor_cs/namespace_d6faaebb6e35dfb7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x906
// Size: 0x93
function function_cc05a92fc572b91(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.script_linkto = "1";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (16939, -7746, 1862), (0, 0, 0), "SEISMIC_REFRACTOR_LOWTOWN_SUBURB", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_e_ob_seismic_refractor_cs/namespace_d6faaebb6e35dfb7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a0
// Size: 0xc19
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_seismicrefractor_wb";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_seismic_refractor_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (23645, 1252.5, 2501.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8 = spawnstruct();
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.locationorigin = [0:(23650.5, 1251, 2501)];
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_bce71c163480aae3 = spawnstruct();
    var_5f614235e4cbbd5b.var_bce71c163480aae3.locationorigin = [0:(23646.5, 1251.5, 2501.5)];
    var_5f614235e4cbbd5b.var_bce71c163480aae3.var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.locationorigin = [0:(23650, 1251.5, 2501)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:800];
    var_fdc9acdc19473f08["SEISMIC_REFRACTOR_LOWTOWN"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_seismicrefractor_wb";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_seismic_refractor_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (4875, 4092, 1303);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8 = spawnstruct();
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.locationorigin = [0:(4875, 4092, 1303)];
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_bce71c163480aae3 = spawnstruct();
    var_5f614235e4cbbd5b.var_bce71c163480aae3.locationorigin = [0:(4875, 4092, 1303)];
    var_5f614235e4cbbd5b.var_bce71c163480aae3.var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.locationorigin = [0:(4875, 4092, 1303)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["SEISMIC_REFRACTOR_OLDTOWN_ROADSIDE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_seismicrefractor_wb";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_seismic_refractor_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (20063, -9625, 2249);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8 = spawnstruct();
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.locationorigin = [0:(20063, -9625, 2249)];
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_bce71c163480aae3 = spawnstruct();
    var_5f614235e4cbbd5b.var_bce71c163480aae3.locationorigin = [0:(20063, -9625, 2249)];
    var_5f614235e4cbbd5b.var_bce71c163480aae3.var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.locationorigin = [0:(20063, -9625, 2249)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["SEISMIC_REFRACTOR_LOWTOWN_ROADSIDE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_seismicrefractor_wb";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_seismic_refractor_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (1172, -2048, 1662);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8 = spawnstruct();
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.locationorigin = [0:(1172, -2048, 1662)];
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_bce71c163480aae3 = spawnstruct();
    var_5f614235e4cbbd5b.var_bce71c163480aae3.locationorigin = [0:(1172, -2048, 1662)];
    var_5f614235e4cbbd5b.var_bce71c163480aae3.var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.locationorigin = [0:(1172, -2048, 1662)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["SEISMIC_REFRACTOR_OLDTOWN_CITYSIDE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_seismicrefractor_wb";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_seismic_refractor_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (9840, -6975, 1845.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8 = spawnstruct();
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.locationorigin = [0:(9840, -6975, 1845.5)];
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_bce71c163480aae3 = spawnstruct();
    var_5f614235e4cbbd5b.var_bce71c163480aae3.locationorigin = [0:(9840, -6975, 1845.5)];
    var_5f614235e4cbbd5b.var_bce71c163480aae3.var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.locationorigin = [0:(9840, -6975, 1845.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["SEISMIC_REFRACTOR_OLDTOWN_FOOTHILL"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_seismicrefractor_wb";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_seismic_refractor_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (3177, 2850, 1449);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8 = spawnstruct();
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.locationorigin = [0:(3177, 2850, 1449)];
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_bce71c163480aae3 = spawnstruct();
    var_5f614235e4cbbd5b.var_bce71c163480aae3.locationorigin = [0:(3177, 2850, 1449)];
    var_5f614235e4cbbd5b.var_bce71c163480aae3.var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.locationorigin = [0:(3177, 2850, 1449)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["SEISMIC_REFRACTOR_OLDTOWN_STAIRWAY"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_seismicrefractor_wb";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_seismic_refractor_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (19055, -611, 1846);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8 = spawnstruct();
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.locationorigin = [0:(19055, -611, 1846)];
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_bce71c163480aae3 = spawnstruct();
    var_5f614235e4cbbd5b.var_bce71c163480aae3.locationorigin = [0:(19055, -611, 1873.5)];
    var_5f614235e4cbbd5b.var_bce71c163480aae3.var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.locationorigin = [0:(19055, -611, 1846)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["SEISMIC_REFRACTOR_LOWTOWN_RIVERSIDE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_seismicrefractor_wb";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_e_ob_seismic_refractor_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (16939, -7746, 1862);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8 = spawnstruct();
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.locationorigin = [0:(16939, -7746, 1862)];
    var_5f614235e4cbbd5b.var_9d00568ab750ecf8.var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_bce71c163480aae3 = spawnstruct();
    var_5f614235e4cbbd5b.var_bce71c163480aae3.locationorigin = [0:(16939, -7746, 1862)];
    var_5f614235e4cbbd5b.var_bce71c163480aae3.var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.locationorigin = [0:(16939, -7746, 1862)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["SEISMIC_REFRACTOR_LOWTOWN_SUBURB"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

