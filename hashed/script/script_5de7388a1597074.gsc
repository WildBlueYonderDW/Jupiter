#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_activities_merc_camp_cs;

// Namespace mp_jup_st_d_ob_activities_merc_camp_cs / namespace_ac00199d6d32cb26
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xba4
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_activities_merc_camp_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_activities_merc_camp_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_activities_merc_camp_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_activities_merc_camp_cs / namespace_ac00199d6d32cb26
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc19
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_activities_merc_camp_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_d_ob_activities_merc_camp_cs / namespace_ac00199d6d32cb26
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc88
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_activities_merc_camp_cs / namespace_ac00199d6d32cb26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd0
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_activities_merc_camp_cs / namespace_ac00199d6d32cb26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcda
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_d_ob_activities_merc_camp_cs / namespace_ac00199d6d32cb26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcf0
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_MERC_CAMP";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_merccamp";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_d_ob_activities_merc_camp_cs / namespace_ac00199d6d32cb26
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd62
// Size: 0xb5
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_d_ob_activities_merc_camp_cs";
    }
    switch (instancename) {
    case #"hash_6fa1c8b8142e4117": 
        function_f817c33f2fce2dde(fe, us, cf);
        break;
    case #"hash_d25df3308d538498": 
        function_289c168c03d8d817(fe, us, cf);
        break;
    case #"hash_3eb209fb05c4abe7": 
        function_5b1a9670b888b838(fe, us, cf);
        break;
    case #"hash_d4ce4b7dd4247c28": 
        function_f6ab8acea4c2889d(fe, us, cf);
        break;
    case #"hash_9e5e32e159a2ea91": 
        function_a5a276bd79dc2d4c(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_d_ob_activities_merc_camp_cs / namespace_ac00199d6d32cb26
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe1f
// Size: 0xb5a
function function_f817c33f2fce2dde(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-20583.5, 9611.55, 2086.8), (0, 304.2, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-21896, 9746.98, 3124.5), (0, 326, 0), "cspf_6_auto4083391488485030228", "cspf_6_auto9447605490912904959", undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-21384.5, 9257, 3053.37), (0, 326, 0), "cspf_6_auto7201613505402091767", "cspf_6_auto3783550848260135067", undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-20540, 8938.9, 2834.08), (0, 326, 0), "cspf_6_auto3783550848260135067", "cspf_6_auto13962214274957235052", undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-20296.7, 8998.24, 2750.46), (0, 326, 0), "cspf_6_auto13962214274957235052", "cspf_6_auto16059422449051524660", undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-20145.5, 9211.54, 2723.11), (0, 326, 0), "cspf_6_auto16059422449051524660", "cspf_6_auto11862971305325856403", undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-19867.6, 10246.3, 2702.5), (0, 326, 0), "cspf_6_auto11862971305325856403", "cspf_6_auto3792151636373267269", undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-21751.5, 9417.63, 3070.71), (0, 326, 0), "cspf_6_auto9447605490912904959", "cspf_6_auto7201613505402091767", undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-19970.6, 10490.9, 2711.22), (0, 326, 0), "cspf_6_auto3792151636373267269", "cspf_6_auto12781699879214592843", undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-20331.8, 10687.5, 2679.55), (0, 326, 0), "cspf_6_auto12781699879214592843", "cspf_6_auto17346345730363931021", undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-21499.2, 11039.3, 2936.37), (0, 326, 0), "cspf_6_auto17346345730363931021", "cspf_6_auto15504358837640195292", undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-21892.3, 10979.7, 2943.49), (0, 326, 0), "cspf_6_auto15504358837640195292", "cspf_6_auto4007996796115617819", undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-21984.8, 10759.4, 2979.85), (0, 326, 0), "cspf_6_auto4007996796115617819", "cspf_6_auto4083391488485030228", undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-20951.7, 10492, 2196.35), (0, 304.2, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "center";
    fe [[ f ]](s, us, cf, (-21085.6, 10094.2, 2275), (0, 0, 0), "MERC_CAMP_D_HILL", undefined, "merc_camp_d_hill", "link_merc_camp_d_hill", undefined, (0, 0, 0), (0, 0, 0), 900);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone";
    fe [[ f ]](s, us, cf, (-21643.5, 9316.96, 3052.94), (0, 340.32, 0), "s_merc_camp_drone", "cspf_6_auto7201613505402091767", undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-20102.6, 10404.9, 2031.81), (0, 304.2, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "guard";
    fe [[ f ]](s, us, cf, (-21074.7, 10090.2, 2275), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "sentry";
    fe [[ f ]](s, us, cf, (-21619.2, 10038.6, 2466.37), (0, 356.51, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-20535.8, 10088, 2192.41), (0, 315.1, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-21132.8, 10092.4, 2275), (0, 333.3, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    fe [[ f ]](s, us, cf, (-20021.5, 10188.3, 2045.03), (13.31, 347.51, -5.78), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-21636, 10799.8, 2275.73), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-21368.7, 9726.17, 2279.04), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_hill", (0, 0, 0), (0, 0, 0), 100);
}

// Namespace mp_jup_st_d_ob_activities_merc_camp_cs / namespace_ac00199d6d32cb26
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1981
// Size: 0xbcf
function function_289c168c03d8d817(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-28091.7, 14901.3, 1160.64), (0, 304.2, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-28016.7, 13711.2, 1160.7), (0, 304.2, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-27598.2, 13796.9, 1632.81), (0, 326, 0), "cspf_7_auto17055362152160036857", "cspf_7_auto7473717592040181328", undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-27279.2, 15238.8, 1637.03), (0, 326, 0), "cspf_7_auto7473717592040181328", "cspf_7_auto10730327857254148773", undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-27344, 15490.5, 1634.6), (0, 326, 0), "cspf_7_auto10730327857254148773", "cspf_7_auto5349930708629560310", undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-27520.9, 15627.3, 1634.14), (0, 326, 0), "cspf_7_auto5349930708629560310", "cspf_7_auto14568677178699681923", undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-28031.9, 15724, 1602.77), (0, 326, 0), "cspf_7_auto14568677178699681923", "cspf_7_auto14136660643879148361", undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-27701.7, 13643.1, 1636.34), (0, 326, 0), "cspf_7_auto15942216574360039948", "cspf_7_auto17055362152160036857", undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-28198.6, 15639.5, 1610.74), (0, 326, 0), "cspf_7_auto14136660643879148361", "cspf_7_auto661273920470859075", undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-28340.7, 15489.1, 1614.8), (0, 326, 0), "cspf_7_auto661273920470859075", "cspf_7_auto13709379658563290564", undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-28726.6, 13935.4, 1601.48), (0, 326, 0), "cspf_7_auto13709379658563290564", "cspf_7_auto9168037034536970486", undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-28686, 13745.4, 1613.47), (0, 326, 0), "cspf_7_auto9168037034536970486", "cspf_7_auto7082731101560595050", undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-28527, 13669.8, 1631.63), (0, 326, 0), "cspf_7_auto7082731101560595050", "cspf_7_auto11809139333991842835", undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-27890.8, 13589.2, 1639.66), (0, 326, 0), "cspf_7_auto11809139333991842835", "cspf_7_auto15942216574360039948", undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-28134.1, 14024.3, 1155.98), (0, 304.2, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "center";
    fe [[ f ]](s, us, cf, (-27992.9, 14869.8, 1161.19), (0, 0, 0), "MERC_CAMP_D_NORTH_PARKING", undefined, "merc_camp_d_north_parking", "link_merc_camp_d_north_parking", undefined, (0, 0, 0), (0, 0, 0), 900);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone";
    fe [[ f ]](s, us, cf, (-27604.3, 13632, 1634.85), (0, 82.17, 0), "s_merc_camp_drone", "cspf_7_auto17055362152160036857", undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "sentry";
    fe [[ f ]](s, us, cf, (-28262.9, 15463.8, 1151.59), (0, 107.88, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-27792.2, 15472, 1171.61), (0, 304.2, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "guard";
    fe [[ f ]](s, us, cf, (-27999.7, 14863.5, 1161.15), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-27354.3, 15398, 1161.71), (0, 315.1, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-27278.4, 15002.8, 1158.78), (0, 333.3, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    fe [[ f ]](s, us, cf, (-27829.8, 14854.2, 1161.65), (0, 348.5, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-27298.7, 14478.1, 1153.36), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-28537.3, 15076.6, 1123.15), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_north_parking", (0, 0, 0), (0, 0, 0), 100);
}

// Namespace mp_jup_st_d_ob_activities_merc_camp_cs / namespace_ac00199d6d32cb26
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2558
// Size: 0xb5e
function function_5b1a9670b888b838(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-30832.6, 2523.37, 1569.6), (0, 326, 0), "cspf_8_auto9585884602300416924", "cspf_8_auto15642280533771984670", undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-30750.6, 2756.17, 1569.6), (0, 326, 0), "cspf_8_auto15642280533771984670", "cspf_8_auto4105246802780339620", undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-30991.1, 4082.32, 1569.6), (0, 326, 0), "cspf_8_auto4105246802780339620", "cspf_8_auto3348699766067271905", undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-31117.8, 4245.46, 1569.6), (0, 326, 0), "cspf_8_auto3348699766067271905", "cspf_8_auto9333937791819252449", undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-31347.3, 4287.11, 1569.6), (0, 326, 0), "cspf_8_auto9333937791819252449", "cspf_8_auto11088858371319519716", undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-31992.7, 4142.6, 1569.6), (0, 326, 0), "cspf_8_auto11088858371319519716", "cspf_8_auto9118861600521253499", undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-32215.9, 4042.26, 1569.6), (0, 326, 0), "cspf_8_auto9118861600521253499", "cspf_8_auto13081827926085811788", undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-31058.5, 2374.27, 1569.6), (0, 326, 0), "cspf_8_auto13875631069627530442", "cspf_8_auto9585884602300416924", undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-32379.5, 3794.1, 1569.59), (0, 326, 0), "cspf_8_auto13081827926085811788", "cspf_8_auto14312991636224660728", undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-32189.2, 2579.1, 1568.07), (0, 326, 0), "cspf_8_auto14312991636224660728", "cspf_8_auto2568068300437767279", undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-32014.5, 2367.35, 1569.59), (0, 326, 0), "cspf_8_auto2568068300437767279", "cspf_8_auto8665248898639517058", undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-31751.8, 2273.34, 1569.59), (0, 326, 0), "cspf_8_auto8665248898639517058", "cspf_8_auto13875631069627530442", undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-31319.5, 4133.63, 959.98), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-31157, 3195.73, 968), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-31521.6, 3534.68, 968), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-31280.8, 3651.18, 968), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-32003.5, 4269.87, 959.98), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-32855.4, 3213.59, 959.98), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-32905.7, 3429.73, 968), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "center";
    fe [[ f ]](s, us, cf, (-31536, 3610.91, 968), (0, 0, 0), "MERC_CAMP_D_WAREHOUSE", undefined, "merc_camp_d_warehouse", "link_merc_camp_d_warehouse", undefined, (0, 0, 0), (0, 0, 0), 900);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone";
    fe [[ f ]](s, us, cf, (-31253.2, 2329.67, 1569.6), (0, 13.65, 0), "s_merc_camp_drone", "cspf_8_auto13875631069627530442", undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-31963.6, 2033.73, 959.98), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "guard";
    fe [[ f ]](s, us, cf, (-31534.1, 3612.69, 968), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-32220.2, 2611.41, 958.46), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_warehouse", (0, 0, 0), (0, 0, 0), 100);
}

// Namespace mp_jup_st_d_ob_activities_merc_camp_cs / namespace_ac00199d6d32cb26
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x30be
// Size: 0xbd1
function function_f6ab8acea4c2889d(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-31601, 7004.25, 959.98), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-32660.6, 6881, 959.98), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-32776.8, 6282.32, 959.98), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-31678.7, 6594.85, 959.98), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-32357.5, 6122.28, 959.98), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-32390, 7531.41, 961.11), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-32331.3, 7367.61, 1056.8), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-31128.6, 7652.95, 1469.38), (0, 326, 0), "cspf_9_auto125604900986666223", "cspf_9_auto6076786987755883658", undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-32017, 6809.95, 959.98), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-31400.4, 7727.1, 1470.22), (0, 326, 0), "cspf_9_auto6076786987755883658", "cspf_9_auto9038558317073205554", undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-30977.8, 7516.98, 1466.96), (0, 326, 0), "cspf_9_auto13875631069627530442", "cspf_9_auto125604900986666223", undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-30904.5, 6996.25, 1466.87), (0, 326, 0), "cspf_9_auto10603419170609549145", "cspf_9_auto13875631069627530442", undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-30974.5, 6709.17, 1466.95), (0, 326, 0), "cspf_9_auto991390144713129798", "cspf_9_auto10603419170609549145", undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-31174, 6572.14, 1466.95), (0, 326, 0), "cspf_9_auto9496870637307940035", "cspf_9_auto991390144713129798", undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-32805, 6331.36, 1466.95), (0, 326, 0), "cspf_9_auto12488836001853555067", "cspf_9_auto9496870637307940035", undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-33052.6, 6405.79, 1466.95), (0, 326, 0), "cspf_9_auto2926617129600061805", "cspf_9_auto12488836001853555067", undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-33169.2, 6690.93, 1466.95), (0, 326, 0), "cspf_9_auto10368997444766160790", "cspf_9_auto2926617129600061805", undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-33272.8, 7261.98, 1466.95), (0, 326, 0), "cspf_9_auto5102613096257016778", "cspf_9_auto10368997444766160790", undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-33136.6, 7476.36, 1466.95), (0, 326, 0), "cspf_9_auto1535503698121891025", "cspf_9_auto5102613096257016778", undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-32898.3, 7511.6, 1466.95), (0, 326, 0), "cspf_9_auto9038558317073205554", "cspf_9_auto1535503698121891025", undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "center";
    fe [[ f ]](s, us, cf, (-32068.3, 6721.1, 959.98), (0, 0, 0), "MERC_CAMP_D_CONTAINERS", undefined, "merc_camp_d_containers", "link_merc_camp_d_containers", undefined, (0, 0, 0), (0, 0, 0), 900);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone";
    fe [[ f ]](s, us, cf, (-30948, 7351.08, 1466.95), (0, 103.41, 0), "s_merc_camp_drone", "cspf_9_auto13875631069627530442", undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "guard";
    fe [[ f ]](s, us, cf, (-32068.5, 6720.8, 959.98), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    fe [[ f ]](s, us, cf, (-31222.9, 7699.97, 960.16), (0, 91.04, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-31108, 6546.51, 959.99), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_containers", (0, 0, 0), (0, 0, 0), 100);
}

// Namespace mp_jup_st_d_ob_activities_merc_camp_cs / namespace_ac00199d6d32cb26
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3c97
// Size: 0xa72
function function_a5a276bd79dc2d4c(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-27606.9, -2532.66, 2153.27), (0, 326, 0), "cspf_10_auto2536719597098081908", "cspf_10_auto1442137948255042709", undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-27699.8, -2386.07, 2153.27), (0, 326, 0), "cspf_10_auto1442137948255042709", "cspf_10_auto125604900986666223", undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-27889.9, -2329.72, 2153.27), (0, 326, 0), "cspf_10_auto125604900986666223", "cspf_10_auto6076786987755883658", undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-28042.8, -2359.28, 2153.27), (0, 326, 0), "cspf_10_auto6076786987755883658", "cspf_10_auto9585884602300416924", undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-28140, -2475.5, 2153.27), (0, 326, 0), "cspf_10_auto9585884602300416924", "cspf_10_auto3793004734103907928", undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-28147.4, -2626.01, 2153.27), (0, 326, 0), "cspf_10_auto3793004734103907928", "cspf_10_auto9447605490912904959", undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-27545.2, -5992.04, 2153.27), (0, 326, 0), "cspf_10_auto9447605490912904959", "cspf_10_auto7201613505402091767", undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-27441.8, -6090.53, 2153.27), (0, 326, 0), "cspf_10_auto7201613505402091767", "cspf_10_auto833625361052942237", undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-27303.9, -6164.19, 2153.27), (0, 326, 0), "cspf_10_auto833625361052942237", "cspf_10_auto10732228055917393818", undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-27113.7, -6135.71, 2153.27), (0, 326, 0), "cspf_10_auto10732228055917393818", "cspf_10_auto6168494388824901211", undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-27010.7, -6028.18, 2153.27), (0, 326, 0), "cspf_10_auto6168494388824901211", "cspf_10_auto13875631069627530442", undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    fe [[ f ]](s, us, cf, (-26965.2, -5877.15, 2153.27), (0, 326, 0), "cspf_10_auto13875631069627530442", "cspf_10_auto2536719597098081908", undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-27188.3, -4897.67, 1732), (0, 304.2, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "center";
    fe [[ f ]](s, us, cf, (-27481.5, -3741.56, 1732), (0, 0, 0), "MERC_CAMP_D_BRIDGE", undefined, "merc_camp_d_bridge", "link_merc_camp_d_bridge", undefined, (0, 0, 0), (0, 0, 0), 900);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone";
    fe [[ f ]](s, us, cf, (-26949.2, -5929.2, 2153.27), (0, 103.41, 0), "s_merc_camp_drone", "cspf_10_auto13875631069627530442", undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "sentry";
    fe [[ f ]](s, us, cf, (-27502.2, -3680.7, 1732), (0, 187.65, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-27377.7, -5752.16, 1736), (0, 304.2, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "guard";
    fe [[ f ]](s, us, cf, (-27482.1, -3743.15, 1732), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-27358.5, -3964.66, 1732), (0, 315.1, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-27582.5, -3526.48, 1732), (0, 333.3, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-28024.9, -2331.06, 1729.79), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_merc_camp_cs";
    s.name = "mine";
    fe [[ f ]](s, us, cf, (-27694, -2626.47, 1736), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_d_bridge", (0, 0, 0), (0, 0, 0), 100);
}

// Namespace mp_jup_st_d_ob_activities_merc_camp_cs / namespace_ac00199d6d32cb26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4711
// Size: 0xa9a
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_merccamp";
    instancestruct.cf = "mp_jup_st_d_ob_activities_merc_camp_cs";
    instancestruct.scriptstructorigin = (-21066.2, 10100.8, 2275);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(-21074.9, 10090.9, 2275)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [1900];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [(-21074.9, 10090.9, 2275)];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationradius = [1900];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(-21074.9, 10090.9, 2275)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [1200];
    instancestruct.locationorigin = [(-21074.9, 10090.9, 2275)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [1700];
    activityinstances["MERC_CAMP_D_HILL"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_merccamp";
    instancestruct.cf = "mp_jup_st_d_ob_activities_merc_camp_cs";
    instancestruct.scriptstructorigin = (-27779.6, 14958.8, 1160.59);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(-27996.8, 14864.9, 1161.17)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [2100];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [(-27996.8, 14864.9, 1161.17)];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationradius = [2000];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(-27996.8, 14864.9, 1161.17)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [1300];
    instancestruct.locationorigin = [(-27996.8, 14864.9, 1161.17)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [1800];
    activityinstances["MERC_CAMP_D_NORTH_PARKING"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_merccamp";
    instancestruct.cf = "mp_jup_st_d_ob_activities_merc_camp_cs";
    instancestruct.scriptstructorigin = (-31631.6, 3544.61, 968);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(-31361.7, 3381.62, 968)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [1900];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [(-31361.7, 3381.62, 968)];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationradius = [2000];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(-31361.7, 3381.62, 968)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [1200];
    instancestruct.locationorigin = [(-31361.7, 3381.62, 968)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [1700];
    activityinstances["MERC_CAMP_D_WAREHOUSE"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_merccamp";
    instancestruct.cf = "mp_jup_st_d_ob_activities_merc_camp_cs";
    instancestruct.scriptstructorigin = (-32078.1, 6718.78, 959.98);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(-32084.7, 6949.84, 959.98)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [1900];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [(-32084.7, 6949.84, 959.98)];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationradius = [1900];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(-32084.7, 6949.84, 959.98)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [1200];
    instancestruct.locationorigin = [(-32084.7, 6949.84, 959.98)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [1700];
    activityinstances["MERC_CAMP_D_CONTAINERS"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_merccamp";
    instancestruct.cf = "mp_jup_st_d_ob_activities_merc_camp_cs";
    instancestruct.scriptstructorigin = (-27486.8, -3746.22, 1732);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(-27573.1, -4178.08, 1732)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [2500];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [(-27652.4, -3875.17, 1732)];
    instancestruct.var_5b156d1fa702b37f["ai_exclusion_radius"].locationradius = [2000];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(-27573.1, -4178.08, 1732)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [2000];
    instancestruct.locationorigin = [(-27573.1, -4178.08, 1732)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [2500];
    activityinstances["MERC_CAMP_D_BRIDGE"] = instancestruct;
    return activityinstances;
}

