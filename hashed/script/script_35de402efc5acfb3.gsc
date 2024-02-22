// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_77c18cdedec620b3;
#using scripts\anim\utility_common.gsc;
#using script_f4e8d02d2f70888;
#using script_433d8f78f7e5fb;
#using script_3212cc02a2700260;
#using script_50eeb9595c6d6e1b;
#using script_5d265b4fca61f070;
#using scripts\asm\asm.gsc;

#namespace battlechatter;

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefd
// Size: 0x7ba
function init_battlechatter() {
    setdvarifuninitialized(@"hash_ab3249fe50b0f590", 1);
    setdvarifuninitialized(@"hash_864d3ab12f741516", 0);
    setdvarifuninitialized(@"hash_44ef18550505e010", 0);
    setdvarifuninitialized(@"hash_350b154807f4d745", 0);
    setdvarifuninitialized(@"hash_4b7858e66804e305", 0);
    setdvarifuninitialized(@"hash_5aea525f549d2546", 0);
    if (isdefined(level.battlechatter) || getdvarint(@"hash_ab3249fe50b0f590") == 0) {
        return;
    }
    level.battlechatter = spawnstruct();
    level.battlechatter.states = [];
    level.battlechatter.delays = [];
    level.battlechatter.names = [];
    level.battlechatter.events = [];
    level.battlechatter.var_ae16228b86a3f433 = [];
    setdvarifuninitialized(@"hash_495535a4877b324d", "off");
    setdvarifuninitialized(@"hash_87dca5163728ce02", "off");
    setdvarifuninitialized(@"hash_ce7cfdf8678edb2", "off");
    setdvarifuninitialized(@"hash_70aaec0e43322fea", "off");
    setdvarifuninitialized(@"hash_6f38327ed1f7340f", "off");
    setdvarifuninitialized(@"hash_702217ae066916b9", "");
    setdvarifuninitialized(@"hash_21778f568437cd09", "");
    setdvarifuninitialized(@"hash_611f04c407c3f644", "off");
    setdvarifuninitialized(@"hash_1c663353dae9fab0", "off");
    setdvarifuninitialized(@"hash_9627c73338f91622", "off");
    setdvarifuninitialized(@"hash_3cb0b3f110a54cf2", "csv");
    setdvarifuninitialized(@"hash_ef12a290c14c553f", "off");
    anim.bcprintfailprefix = "^1***** BCS FAILURE: ";
    anim.bcprintwarnprefix = "^3***** BCS WARNING: ";
    function_bd1704b44a1a730e();
    function_2f7fd2639db2a57b();
    function_2e88374b2f067e46();
    if (function_3cb5da19764baa3() == "T10") {
        function_5430999882251a0c();
    } else if (function_3cb5da19764baa3() == "JUP") {
        function_676ba319b8273e9e();
    }
    if (isdefined(level.var_aa78677d2156e18)) {
        [[ level.var_aa78677d2156e18 ]]();
    }
    function_90826d80aa1736cb("idle", &function_f06007e1f432ce27);
    function_90826d80aa1736cb("investigate", &function_f6c7d545b09f9f0a);
    function_90826d80aa1736cb("hunt", &function_7ce36b78c85185c2);
    function_90826d80aa1736cb("combat", &function_f5154a3d477820d9);
    function_3769e5550bed355b("default", level.var_2957de46170adad1.var_fd6906dc66b503b4, level.var_2957de46170adad1.var_4c433dc943a4b16e);
    function_3769e5550bed355b("idle", level.var_2957de46170adad1.var_fd6906dc66b503b4, level.var_2957de46170adad1.var_4c433dc943a4b16e);
    function_3769e5550bed355b("hunt", level.var_2957de46170adad1.var_ac5d474ffe947f53, level.var_2957de46170adad1.var_8fb4e94454c2b089);
    function_3769e5550bed355b("combat", level.var_2957de46170adad1.var_de220ee05772f786, level.var_2957de46170adad1.var_d4692deec4b3b23c);
    function_7aedd2357aecc5a6("curious", &function_1d268b003b51a5b3);
    function_7aedd2357aecc5a6("announce", &function_91ae298fcc3884c2);
    function_7aedd2357aecc5a6("return_to_idle", &function_e64dbaaae396fbb8);
    function_7aedd2357aecc5a6("enter_hunt", &function_f4671f61a3031990);
    function_7aedd2357aecc5a6("join_combat", &function_881ab22021be3c6b);
    function_7aedd2357aecc5a6("enter_combat", &function_6237814879b07fbf);
    function_7aedd2357aecc5a6("red_alert", &function_3dac2e167dc9be7a);
    foreach (var_81a329728abb79e4 in level.battlechatter.events) {
        var_81a329728abb79e4 deck_shuffle();
    }
    level.var_fb605061a3778884 = function_53c4c53197386572(level.var_fb605061a3778884, 200);
    level.var_fde5b385cc96729a = function_53c4c53197386572(level.var_fde5b385cc96729a, squared(level.var_fb605061a3778884));
    level.var_798aa343368f724e = function_53c4c53197386572(level.var_798aa343368f724e, 650);
    level.var_c1ed820e79e07b7c = function_53c4c53197386572(level.var_c1ed820e79e07b7c, squared(level.var_798aa343368f724e));
    level.var_8893859de4351996 = function_53c4c53197386572(level.var_8893859de4351996, 850);
    level.var_e4b1ac8399c73f44 = function_53c4c53197386572(level.var_e4b1ac8399c73f44, squared(level.var_8893859de4351996));
    level.var_63a73645a8e030ad = function_53c4c53197386572(level.var_63a73645a8e030ad, 1400);
    level.var_defb33e34eb9dee7 = function_53c4c53197386572(level.var_defb33e34eb9dee7, squared(level.var_63a73645a8e030ad));
    setsaveddvar(@"hash_ab202f8049b3210a", level.var_63a73645a8e030ad);
    level.var_587de0e7b537210a = function_53c4c53197386572(level.var_587de0e7b537210a, 2000);
    level.var_b4360cab4806d3a0 = function_53c4c53197386572(level.var_b4360cab4806d3a0, squared(level.var_587de0e7b537210a));
    level.var_dd332b4f1c13f7d5 = function_53c4c53197386572(level.var_dd332b4f1c13f7d5, 300);
    level.var_27a93e38d913ff2f = function_53c4c53197386572(level.var_27a93e38d913ff2f, squared(level.var_dd332b4f1c13f7d5));
    level.var_3c8c2ca8a1d0e8a7 = function_53c4c53197386572(level.var_3c8c2ca8a1d0e8a7, 590);
    level.var_e49b54322cbd63c1 = function_53c4c53197386572(level.var_e49b54322cbd63c1, squared(level.var_3c8c2ca8a1d0e8a7));
    level.var_8b1a7cec63f2e832 = function_53c4c53197386572(level.var_8b1a7cec63f2e832, level.var_798aa343368f724e);
    level.var_b1835eb671fbdac8 = function_53c4c53197386572(level.var_b1835eb671fbdac8, squared(level.var_8b1a7cec63f2e832));
    level.var_1c60ace9b9fff6ff = function_53c4c53197386572(level.var_1c60ace9b9fff6ff, 360);
    level.var_85b48a519a69f1b9 = function_53c4c53197386572(level.var_85b48a519a69f1b9, squared(level.var_1c60ace9b9fff6ff));
    level.var_d809dc9f8a466642 = function_53c4c53197386572(level.var_d809dc9f8a466642, 650);
    level.var_fe8551579a9d6778 = function_53c4c53197386572(level.var_fe8551579a9d6778, squared(level.var_d809dc9f8a466642));
    level.var_8e8e487a64d9aa1b = function_53c4c53197386572(level.var_8e8e487a64d9aa1b, 120);
    level.var_dafa42d7384e9ef5 = 10;
    if (isdefined(anim.squads)) {
        foreach (squad in anim.squads) {
            squad init_squadbattlechatter();
        }
    }
    anim.var_417d31a4284fd63f = &init_squadbattlechatter;
    if (!isdefined(anim.bcs_locations)) {
        function_2faee9e4cf862d61();
    }
    bcs_setup_countryids();
    /#
        thread function_a8c755adb8698257();
    #/
    level thread function_1ea9d53684d11626();
    level thread function_78405469b3060fa();
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16be
// Size: 0x11c7
function private function_2e88374b2f067e46() {
    level.battlechatter.settings["coverme"] = [0:0.1, 1:1, 2:10];
    level.battlechatter.settings["coverfire"] = [0:0.1, 1:1, 2:10];
    level.battlechatter.settings["lost_target"] = [0:0, 1:2, 2:5];
    level.battlechatter.settings["cease_fire"] = [0:0, 1:2, 2:5];
    level.battlechatter.settings["combat_hunt"] = [0:0.9, 1:2, 2:5];
    level.battlechatter.settings["hunt"] = [0:0.9, 1:2, 2:5];
    level.battlechatter.settings["reacquire_push_towards"] = [0:0.4, 1:2, 2:10];
    level.battlechatter.settings["combat_unaware"] = [0:0.9, 1:2, 2:5];
    level.battlechatter.settings["incoming_vehicle_response"] = [0:0, 1:0, 2:20];
    level.battlechatter.settings["_interrupt"] = [0:0.9, 1:0, 2:1];
    level.battlechatter.settings["aquired_target"] = [0:0.5, 1:2, 2:15];
    level.battlechatter.settings["order_attack"] = [0:0.6, 1:2, 2:15];
    level.battlechatter.settings["enemy_direction"] = [0:0, 1:2, 2:15];
    level.battlechatter.settings["getting_cover"] = [0:0.4, 1:2, 2:15];
    level.battlechatter.settings["enemy_getting_cover"] = [0:0.4, 1:2, 2:15];
    level.battlechatter.settings["target_getting_cover"] = [0:0.4, 1:2, 2:15];
    level.battlechatter.settings["ally_exposure"] = [0:0, 1:1, 2:15];
    level.battlechatter.settings["combat_status"] = [0:0, 1:1, 2:15];
    level.battlechatter.settings["enemy_weapon"] = [0:0.3, 1:1, 2:15];
    level.battlechatter.settings["hostile_burst"] = [0:0, 1:1, 2:20];
    level.battlechatter.settings["use_"] = [0:0.2, 1:1, 2:10];
    level.battlechatter.settings["enemy_using_"] = [0:0.3, 1:0.5, 2:10];
    level.battlechatter.settings["grenade_danger"] = [0:0.8, 1:0.5, 2:10];
    level.battlechatter.settings["hurt_by_"] = [0:0.8, 1:0.5, 2:10];
    level.battlechatter.settings["attacking"] = [0:0.5, 1:1, 2:15];
    level.battlechatter.settings["enemy_reloading"] = [0:0.6, 1:1, 2:10];
    level.battlechatter.settings["reloading"] = [0:0.3, 1:1, 2:15];
    level.battlechatter.settings["ammo_status"] = [0:0.1, 1:1, 2:15];
    level.battlechatter.settings["enemy_movement"] = [0:0.3, 1:1, 2:15];
    level.battlechatter.settings["enemy_movement_moving"] = [0:0.2, 1:1, 2:15];
    level.battlechatter.settings["enemy_movement_climbing_up"] = [0:0.2, 1:1, 2:20];
    level.battlechatter.settings["enemy_movement_moving_up"] = [0:0.2, 1:1, 2:20];
    level.battlechatter.settings["ally_movement"] = [0:0, 1:1, 2:15];
    level.battlechatter.settings["killfirm"] = [0:0, 1:2, 2:15];
    level.battlechatter.settings["player_killfirm"] = [0:0, 1:2, 2:30];
    level.battlechatter.settings["casualties"] = [0:0.3, 1:3, 2:15];
    level.battlechatter.settings["casualty"] = [0:0.3, 1:2, 2:15];
    level.battlechatter.settings["friendlyfire"] = [0:1, 1:0, 2:3];
    level.battlechatter.settings["idle_convo"] = [0:0.3, 1:1, 2:60];
    level.battlechatter.settings["idle"] = [0:0.2, 1:1, 2:60];
    level.battlechatter.settings["patrol_curious"] = [0:0.3, 1:0, 2:15];
    level.battlechatter.settings["investigate_start"] = [0:0.5, 1:2, 2:15];
    level.battlechatter.settings["investigate_pos_reached"] = [0:0.5, 1:2, 2:15];
    level.battlechatter.settings["saw_corpse_1"] = [0:0.6, 1:0, 2:10];
    level.battlechatter.settings["saw_corpse_2"] = [0:0.6, 1:0, 2:10];
    level.battlechatter.settings["found_corpse"] = [0:0.8, 1:1, 2:10];
    level.battlechatter.settings["found_corpse_1"] = "found_corpse";
    level.battlechatter.settings["found_corpse_2"] = "found_corpse";
    level.battlechatter.settings["found_corpse_3"] = "found_corpse";
    level.battlechatter.settings["announce_"] = [0:0.8, 1:1, 2:10];
    level.battlechatter.settings["return_to_idle"] = [0:0.2, 1:2, 2:15];
    level.battlechatter.settings["returned_to_idle_pos"] = [0:0.2, 1:2, 2:15];
    level.battlechatter.settings["enter_hunt_1"] = [0:0.9, 1:0.5, 2:10];
    level.battlechatter.settings["enter_hunt_2"] = "enter_hunt_1";
    level.battlechatter.settings["enter_hunt_3"] = "enter_hunt_1";
    level.battlechatter.settings["enter_hunt_4"] = "enter_hunt_1";
    level.battlechatter.settings["enter_hunt_5"] = "enter_hunt_1";
    level.battlechatter.settings["enter_hunt_6"] = "enter_hunt_1";
    level.battlechatter.settings["hunt_ask_found"] = "enter_hunt_1";
    level.battlechatter.settings["hunt_solo"] = "enter_hunt_1";
    level.battlechatter.settings["enter_hunt_followup"] = "enter_hunt_1";
    level.battlechatter.settings["initial_combat"] = [0:0.9, 1:0.5, 2:20];
    level.battlechatter.settings["initial_combat_2"] = "initial_combat";
    level.battlechatter.settings["initial_combat_N"] = "initial_combat";
    level.battlechatter.settings["initial_combat_nonshot_1"] = "initial_combat";
    level.battlechatter.settings["initial_combat_nonshot_2"] = "initial_combat";
    level.battlechatter.settings["initial_combat_nonshot_N"] = "initial_combat";
    level.battlechatter.settings["comb_rs_saw_enemy_on_pos"] = "initial_combat";
    level.battlechatter.settings["comb_rs_saw_enemy_out_pos"] = "initial_combat";
    level.battlechatter.settings["comb_rs_saw_shot_but_enemy_hid"] = "initial_combat";
    level.battlechatter.settings["comb_full_default"] = "initial_combat";
    level.battlechatter.settings["comb_full_unaware_sniper"] = "initial_combat";
    level.battlechatter.settings["comb_full_unaware_lmg"] = "initial_combat";
    level.battlechatter.settings["comb_full_unaware_shotgun"] = "initial_combat";
    level.battlechatter.settings["comb_full_aware_sniper"] = "initial_combat";
    level.battlechatter.settings["comb_full_aware_lmg"] = "initial_combat";
    level.battlechatter.settings["comb_full_aware_shotgun"] = "initial_combat";
    level.battlechatter.settings["comb_fulld_didnt_see_shooting"] = "initial_combat";
    level.battlechatter.settings["comb_fulld_enemy_open"] = "initial_combat";
    level.battlechatter.settings["comb_fulld_enemy_cover"] = "initial_combat";
    level.battlechatter.settings["comb_fulld_enemies_open"] = "initial_combat";
    level.battlechatter.settings["comb_fulld_enemies_cover"] = "initial_combat";
    level.battlechatter.settings["enter_combat"] = [0:0.9, 1:0.5, 2:15];
    level.battlechatter.settings["join_combat"] = [0:0.5, 1:3, 2:15];
    level.battlechatter.settings["losing_target_water"] = [0:0, 1:2, 2:5];
    level.battlechatter.settings["losing_target"] = [0:0.6, 1:2, 2:5];
    level.battlechatter.settings["status_report"] = [0:0.1, 1:1, 2:35];
    level.battlechatter.settings["corpse_status_report"] = [0:0, 1:1, 2:120];
    level.battlechatter.settings["red_alert_1"] = [0:1, 1:5, 2:10];
    level.battlechatter.settings["red_alert_N"] = "red_alert_1";
    level.battlechatter.settings["react_first_combat"] = [0:0.9, 1:0.5, 2:20];
    level.battlechatter.settings["flanked_1"] = [0:1, 1:0, 2:5];
    level.battlechatter.settings["flanked_N"] = "flanked_1";
    level.battlechatter.settings["enemy_sighted_1"] = [0:0.9, 1:0, 2:5];
    level.battlechatter.settings["enemy_sighted_N"] = "enemy_sighted_1";
    level.battlechatter.settings["target_wounded"] = [0:0.2, 1:1, 2:15];
    level.battlechatter.settings["target_unhurt"] = [0:0.2, 1:1, 2:15];
    level.battlechatter.settings["wounded"] = [0:0.2, 1:1, 2:15];
    level.battlechatter.settings["cover_destroyed"] = [0:0.5, 1:0, 2:10];
    var_69f88410d1c9e28b = getdvarint(@"hash_2e9b4d77df5b8514") * 0.001;
    level.battlechatter.settings["lost_target_elapsed_1"] = [0:0.6, 1:0.5, 2:var_69f88410d1c9e28b];
    level.battlechatter.settings["lost_target_elapsed_2"] = [0:0.6, 1:0.5, 2:var_69f88410d1c9e28b];
    level.battlechatter.settings["hunt_initial"] = [0:0.9, 1:0.5, 2:10];
    level.battlechatter.settings["hunt_solo_enter"] = "hunt_initial";
    level.battlechatter.settings["hunt_solo_loop"] = "hunt_initial";
    level.battlechatter.settings["hunt_duo_enter"] = "hunt_initial";
    level.battlechatter.settings["hunt_duo_loop_near"] = "hunt_initial";
    level.battlechatter.settings["hunt_duo_loop_far_1"] = "hunt_initial";
    level.battlechatter.settings["hunt_duo_loop_far_2"] = "hunt_initial";
    level.battlechatter.settings["semtex_stuck"] = [0:0.9, 1:0.5, 2:10];
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x288c
// Size: 0x2f
function private function_676ba319b8273e9e() {
    level.battlechatter.settings["investigate_loop"] = [0:0, 1:2, 2:5];
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x28c2
// Size: 0x3
function private function_5430999882251a0c() {
    
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28cc
// Size: 0x1bb
function function_78405469b3060fa() {
    level endon("battlechatter disabled");
    while (1) {
        var_c2c1ab2c183ff85b = level waittill("bc_notify");
        foreach (data in var_c2c1ab2c183ff85b) {
            if (!isdefined(data.entity)) {
                continue;
            }
            /#
                assert(isdefined(data.category));
            #/
            /#
                if (getdvarint(@"hash_350b154807f4d745")) {
                    if (isdefined(data.subcategory) && data.category != data.subcategory) {
                        text = data.category + "aquired_target" + data.subcategory;
                    } else {
                        text = data.category;
                    }
                    if (issharedfuncdefined("enemy_getting_cover", "enemy_movement")) {
                        data.entity thread [[ getsharedfunc("enemy_getting_cover", "enemy_movement") ]]("found_corpse_3" + data.category, (0, 1, 0), 1, 0.5, (0, 0, 40), 5);
                    }
                }
            #/
            var_73fd6268186223de = function_955ca8d297928838(data);
            if (!var_73fd6268186223de && function_5d6cfae8ba773d66(data.entity, 1, data.category)) {
                var_73fd6268186223de = function_6c731b5fab9c2494(data);
            }
            /#
                function_fdb8454d071bcf5b(data, var_73fd6268186223de);
            #/
        }
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a8e
// Size: 0x5f8
function function_6c731b5fab9c2494(data) {
    /#
        assert(isdefined(data));
    #/
    /#
        assert(isdefined(data.entity));
    #/
    /#
        assert(isdefined(data.category));
    #/
    if (data.entity function_c0da17570a24346c(data.category, data.params)) {
        return 1;
    }
    switch (data.category) {
    case #"hash_4c8ad9f2942ea5b":
        data.entity thread bcs_statechange(data);
        break;
    case #"hash_1044d327487d801a":
    case #"hash_184bba7053cc1c15":
    case #"hash_20cd76d83c2f7487":
        data.entity clear_cooldown("ally_movement");
        data.entity thread function_42c77c7f13a1beb8();
        break;
    case #"hash_d6c61718f24df768":
        data.entity thread function_56e490b1816855eb(data.var_cac102b2d7b66836, data.subcategory);
        break;
    case #"hash_5a5c93f2debb75c":
        data.entity thread function_1ae088b4c06d0525(data.params[1], data.params[2]);
        break;
    case #"hash_3ee703de5a8989c6":
        data.entity thread function_8fa36b2ce712a5bb();
        break;
    case #"hash_eeed4ce2a5de2aa5":
        if (data.subcategory == "losing_target") {
            data.entity thread function_e2d4e5c64d62278e(data.var_cac102b2d7b66836);
        } else if (data.subcategory == "lost_target") {
            data.entity function_93b4f17e4a3474b("lost_target", "ask_target_location");
        } else if (data.subcategory == "cease_fire") {
            data.entity function_93b4f17e4a3474b("cease_fire", "hunt_order_hold");
        } else if (data.subcategory == "lost_target_elapsed") {
            data.entity thread function_da9e3311b63335e1(data.var_cac102b2d7b66836);
        }
        break;
    case #"hash_37bb23543c319104":
        if (data.subcategory == "hunt") {
            data.entity thread function_facb9692c3fba174();
        }
        break;
    case #"hash_bb388ae078895394":
        data.entity thread function_7825e0643a6c5600();
        break;
    case #"hash_3f894d6ee31df868":
        if (data.subcategory == "combat_unaware") {
            data.entity function_93b4f17e4a3474b("combat_unaware", "hunt_reactions");
        }
        break;
    case #"hash_1fe1f9ada345556c":
        if (data.subcategory == "investigateposreached") {
            if (isdefined(data.params[2]) && data.params[2] == "saw_corpse") {
                return;
            }
            data.entity thread function_e46d9fd4c3250863();
        }
        break;
    case #"hash_1879579c479117e0":
        if (data.subcategory == "dodge_vehicle_start") {
            data.entity function_93b4f17e4a3474b("incoming_vehicle_response", random([0:"hunt_reactions", 1:"cmb_reactions"]));
        }
        break;
    case #"hash_124fc72bb55490ec":
        data.entity thread function_c4e2e61a7ce330c0();
        break;
    case #"hash_ecb83a34dd571174":
        data.entity thread function_42c77c7f13a1beb8(data.subcategory);
        break;
    case #"hash_661532715a742ebf":
        data.entity thread function_d8ed6827953bcac2();
        break;
    case #"hash_58018e5cda140b2d":
        data.entity thread function_e906749f6343f822();
        break;
    case #"hash_c718a89b94ffdc2":
        data.entity thread function_4dffa550c687b071();
        break;
    case #"hash_2d1406e602f0875d":
        data.entity thread function_a3b5180187a17623();
        data.entity thread function_3aab8d98361f6ecf();
        break;
    case #"hash_ab2e692ee80521f8":
        data.entity thread function_373aa775ac5f550c(data.subcategory);
        break;
    case #"hash_8f9bb78729a54b2c":
    case #"hash_fbd5bcbb1cbe3154":
        data.entity thread function_a364b61121ab136f(data.var_cac102b2d7b66836);
        break;
    case #"hash_a0721fe4fd9580f5":
        data.entity thread function_f25a368b5b190924(data.subcategory);
        break;
    case #"hash_57203b1e53d3a619":
        if (isalive(data.entity)) {
            data.entity function_93b4f17e4a3474b("wounded", "wounded");
        }
        break;
    case #"hash_7a09a268a01b5f84":
        data.entity thread function_71da86464a72718d();
        break;
    case #"hash_affe6c9db8e997d3":
        data.entity thread function_402ee78fe1df3ace();
        data.entity thread function_771bace1bff17684();
        break;
    case #"hash_278c7959b357bf3e":
        data.entity thread function_45eb140ec25c64a1();
        break;
    default:
        return 0;
        break;
    }
    return 1;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308e
// Size: 0xee
function function_955ca8d297928838(data) {
    /#
        assert(isdefined(data));
    #/
    /#
        assert(isdefined(data.entity));
    #/
    /#
        assert(isdefined(data.category));
    #/
    switch (data.category) {
    case #"hash_631f416c3d8360d4":
        data.entity thread function_656c8ba582163660(data.subcategory, 0);
        break;
    case #"hash_12cb1aa4c57395":
        data.entity thread function_cffa856196d037ae(data.var_cac102b2d7b66836);
        break;
    case #"hash_9a35360cb2dc98e6":
        data.entity thread function_656c8ba582163660(data.subcategory, 1);
        break;
    default:
        return 0;
        break;
    }
    return 1;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3184
// Size: 0x12c
function bcs_statechange(data) {
    previousstate = data.params[0];
    currentstate = data.params[1];
    ai_event = data.params[2];
    var_2a130b858db198cb = function_a07abd440b7a33fe(data.var_cac102b2d7b66836);
    if (previousstate == 4) {
        return;
    }
    if (previousstate == currentstate) {
        return;
    }
    self notify("bcs_stateChange", previousstate);
    switch (currentstate) {
    case 0:
        return function_e64dbaaae396fbb8(previousstate);
    case 1:
        if (var_2a130b858db198cb) {
            return function_23a29830a84af4cf();
            goto LOC_000000ac;
        }
        return function_bbb539fd7c238608();
    case 2:
    LOC_000000ac:
        return function_f4671f61a3031990();
    case 3:
        function_65f8179711192d2b();
        if (previousstate <= 2) {
            self.var_ea9ad73c9a583d4c = gettime();
        }
        if (previousstate < 2) {
            if (var_2a130b858db198cb) {
                return function_64e63285a83e3efe();
            } else {
                return function_80bfded61c19c9cc(previousstate, ai_event);
            }
        } else {
            return function_6237814879b07fbf();
        }
        break;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32b7
// Size: 0x2f
function function_45a69522dd934d18(dist) {
    level.var_587de0e7b537210a = 2048;
    level.var_b4360cab4806d3a0 = squared(level.var_587de0e7b537210a);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32ed
// Size: 0x16
function function_33bdd4ad6aa14edc(overrides) {
    level.var_2957de46170adad1 = overrides;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x330a
// Size: 0xa3
function function_2f7fd2639db2a57b() {
    if (!isdefined(level.var_2957de46170adad1)) {
        level.var_2957de46170adad1 = spawnstruct();
        level.var_2957de46170adad1.var_fd6906dc66b503b4 = 10;
        level.var_2957de46170adad1.var_4c433dc943a4b16e = 16;
        level.var_2957de46170adad1.var_ac5d474ffe947f53 = 4;
        level.var_2957de46170adad1.var_8fb4e94454c2b089 = 12;
        level.var_2957de46170adad1.var_de220ee05772f786 = 1;
        level.var_2957de46170adad1.var_d4692deec4b3b23c = 2;
        return;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33b4
// Size: 0x25
function init_squadbattlechatter() {
    squad = self;
    squad.chatinitialized = 1;
    squad notify("squad chat initialized");
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33e0
// Size: 0xd
function bcsenabled() {
    return isdefined(level.battlechatter);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33f5
// Size: 0xdb
function bcs_setup_voice(voice, countryid, var_46119ee4018a3e10, var_790e7a69f5c40b30, var_4189af81d34b8804, var_10e927a072c477b) {
    if (!isdefined(var_790e7a69f5c40b30)) {
        var_790e7a69f5c40b30 = 0;
    }
    anim.usedids[voice] = [];
    for (i = 0; i < var_46119ee4018a3e10; i++) {
        anim.usedids[voice][i] = spawnstruct();
        anim.usedids[voice][i].count = 0;
        anim.usedids[voice][i].npcid = "" + i + 1;
    }
    anim.countryids[voice] = countryid;
    anim.var_6d557183af1d1db5[countryid] = var_4189af81d34b8804;
    anim.var_7f532a5dc6603698[countryid] = var_10e927a072c477b;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34d7
// Size: 0x101
function function_2faee9e4cf862d61() {
    /#
        assert(!isdefined(anim.bcs_locations));
    #/
    triggers = getentarray("trigger_multiple", "code_classname");
    var_a4162f1221e6a6 = [];
    foreach (trigger in triggers) {
        if (!issubstr(trigger.classname, "trigger_multiple_bcs")) {
            continue;
        }
        var_a4162f1221e6a6[var_a4162f1221e6a6.size] = trigger;
        trigger.location = getsubstr(trigger.classname, 24, trigger.classname.size);
        if (trigger.spawnflags & 1) {
            trigger.islandmark = 1;
        }
    }
    level.battlechatter.var_a4162f1221e6a6 = var_a4162f1221e6a6;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35df
// Size: 0x15
function shutdown_battlechatter() {
    level.battlechatter = undefined;
    level notify("battlechatter disabled");
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35fb
// Size: 0xc6
function function_1ea9d53684d11626() {
    level endon("battlechatter disabled");
    wait(1);
    for (;;) {
        for (;;) {
            if (!isdefined(level.players) || level.players.size < 1) {
                goto LOC_000000c0;
            }
            players = level.players;
            var_b474bf710c850da = 0;
            for (p = 0; p < players.size; p++) {
                player = players[p];
                if (!isdefined(player) || !isalive(player) || !isdefined(player.origin)) {
                    continue;
                }
                if (istrue(player.var_7887f3c24e400953)) {
                    continue;
                }
                player thread function_f46983dffe232870();
                var_b474bf710c850da++;
                if (var_b474bf710c850da >= 5) {
                    var_b474bf710c850da = 0;
                    waitframe();
                }
            }
        LOC_000000c0:
        }
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36c8
// Size: 0x2bd
function function_f46983dffe232870() {
    self endon("death_or_disconnect");
    self.var_7887f3c24e400953 = 1;
    if (!istrue(self.var_90e5f1f12433908a)) {
        thread bcs_initplayer();
        self.var_90e5f1f12433908a = 1;
    }
    var_310236dbf257fbb5 = function_fd9e4cb348a5f283(self.origin, level.var_8893859de4351996);
    var_310236dbf257fbb5 = sortbydistance(var_310236dbf257fbb5, self.origin);
    count = min(var_310236dbf257fbb5.size, 10);
    for (i = 0; i < count; i++) {
        waitframe();
        var_3114816c58d0aa74 = (i + 1) / count;
        if (function_51d76700600cebe3((1 - var_3114816c58d0aa74) * 15)) {
            continue;
        }
        guy = var_310236dbf257fbb5[i];
        if (!isalive(guy) || !isdefined(guy.battlechatter) || istrue(guy.battlechatter.var_91892eb738fd74cd)) {
            continue;
        }
        team = guy.team;
        origin = guy.origin;
        if (!isdefined(team) || !isdefined(origin)) {
            continue;
        }
        if (isdefined(guy.battlechatter.var_e71d143c0a460c23) && gettime() < guy.battlechatter.var_e71d143c0a460c23) {
            /#
                if (getdvarint(@"hash_44ef18550505e010")) {
                    print3d(origin + (0, 0, 80), "enter_hunt_4", (1, 1, 1), 1, 0.3, 1, 1);
                }
            #/
        } else {
            state = guy function_16dce705f14f4b84();
            if (!isdefined(state) || !isdefined(guy.team)) {
                continue;
            }
            if (state == "dead" || guy.team == "neutral") {
                continue;
            }
            if (state == "combat" && guy function_8f59caa9212fcc56()) {
                continue;
            }
            /#
                if (getdvarint(@"hash_44ef18550505e010")) {
                    function_51c8ea07cf76cbd7("comb_full_unaware_shotgun" + "comb_fulld_enemy_cover" + state + "flanked_N" + "cover_destroyed");
                    print3d(origin + (0, 0, 100), "hunt_duo_enter", (1, 1, 1), 1, 0.3, 20, 1);
                }
            #/
            guy thread function_4f4f4b31f8a95d9f(state);
            if (utility::issp()) {
                guy function_af3a6677d4327aae();
            } else {
                guy function_b145367392d5843d();
            }
            break;
        }
    }
    self.var_7887f3c24e400953 = 0;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x398c
// Size: 0x36
function function_8f8de1d6f307f960(var_a434cd7944a162af) {
    return isdefined(var_a434cd7944a162af) && isstring(var_a434cd7944a162af) && function_5b7e9a4c946f3a13(var_a434cd7944a162af, [0:"frag_grenade", 1:"semtex"]);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39ca
// Size: 0x31
function bcs_initplayer() {
    self endon("death");
    self notify("bcs_initPlayer");
    self endon("bcs_initPlayer");
    childthread function_1d7ef730acb50079();
    childthread function_c3307723c588c6e5();
    childthread function_c47965a0917525b3();
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a02
// Size: 0x3d
function function_1d7ef730acb50079() {
    self endon("disconnect");
    while (1) {
        weapon = self waittill("weapon_fired");
        self.last_weapon_fired_time = gettime();
        self.var_23f37822d0802641 = weapon;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a46
// Size: 0x79
function function_c3307723c588c6e5() {
    while (1) {
        grenade = self waittill("grenade_fire");
        if (isdefined(grenade) && isdefined(grenade.weapon_object)) {
            var_fc3f189c0832aec2 = function_c666e714b2411844(grenade.weapon_object);
            if (isdefined(var_fc3f189c0832aec2)) {
                function_216c67ab6749137a(self, undefined, "grenade_throw", var_fc3f189c0832aec2);
                if (function_8f8de1d6f307f960(var_fc3f189c0832aec2)) {
                    function_216c67ab6749137a(self, grenade, "grenade_danger");
                }
            }
        }
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac6
// Size: 0x4e
function function_c47965a0917525b3() {
    while (1) {
        objweapon = missile = self waittill("missile_fire");
        var_fc3f189c0832aec2 = function_c666e714b2411844(objweapon);
        if (isdefined(var_fc3f189c0832aec2)) {
            function_216c67ab6749137a(self, undefined, "use", var_fc3f189c0832aec2);
        }
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b1b
// Size: 0xba
function function_8d7aee019b12c98f() {
    /#
        self endon("lost_target_elapsed");
        self.var_8d7aee019b12c98f = 1;
        while (isdefined(self.origin) && isdefined(level.players[0]) && isdefined(level.players[0].origin)) {
            print3d(self.origin + (0, 0, 60), floor(distance(level.players[0].origin, self.origin)), (1, 1, 1), 1, 0.5, 1, 1);
            waitframe();
        }
        self.var_8d7aee019b12c98f = undefined;
    #/
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bdc
// Size: 0xbf
function function_af3a6677d4327aae(seconds, var_492d858d989a382) {
    if (!isdefined(seconds)) {
        seconds = function_42a6e01190025613(function_16dce705f14f4b84()) / 1000;
    }
    if (!isdefined(self.origin) || !isdefined(self.team)) {
        return function_b145367392d5843d(seconds, var_492d858d989a382);
    }
    foreach (ai in function_fd9e4cb348a5f283(self.origin, level.var_798aa343368f724e, self.team)) {
        ai function_b145367392d5843d(seconds, var_492d858d989a382);
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ca2
// Size: 0x83
function function_b145367392d5843d(seconds, var_492d858d989a382) {
    if (!isdefined(self.battlechatter)) {
        return;
    }
    if (!isdefined(seconds)) {
        var_427b650ba00795 = function_42a6e01190025613(function_16dce705f14f4b84());
    } else {
        var_427b650ba00795 = seconds * 1000;
    }
    self.battlechatter.var_e71d143c0a460c23 = gettime() + var_427b650ba00795;
    if (istrue(var_492d858d989a382)) {
        self.battlechatter.var_3c94d4874d436201 = gettime() + var_427b650ba00795;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2c
// Size: 0x76
function function_3769e5550bed355b(state, min_delay, max_delay) {
    /#
        assertex(isnumber(min_delay), "Min delay must be a number");
    #/
    /#
        assertex(isnumber(max_delay), "Max delay must be a number");
    #/
    /#
        assertex(min_delay <= max_delay, "Min delay must be less than or equal to max delay");
    #/
    level.battlechatter.delays[state] = [0:min_delay, 1:max_delay];
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3da9
// Size: 0x5c
function function_42a6e01190025613(state) {
    range = level.battlechatter.delays[state];
    if (!isdefined(range)) {
        range = level.battlechatter.delays["default"];
    }
    return randomfloatrange(range[0], range[1]) * 1000;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e0d
// Size: 0x56
function function_90826d80aa1736cb(state, func) {
    if (!isdefined(level.battlechatter)) {
        return;
    }
    /#
        assert(isdefined(level.battlechatter.states));
    #/
    level.battlechatter.states[state] = func;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e6a
// Size: 0x9d
function function_4f4f4b31f8a95d9f(state) {
    self endon("death");
    if (!isdefined(level.battlechatter)) {
        return;
    }
    /#
        assert(isdefined(level.battlechatter.states));
    #/
    func = level.battlechatter.states[state];
    if (!isdefined(func)) {
        return;
    }
    self.battlechatter.var_91892eb738fd74cd = 1;
    result = self [[ func ]]();
    self.battlechatter.var_91892eb738fd74cd = undefined;
    return result;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f0f
// Size: 0x10d
function function_bf23e005e136dc90(event_name, sequence, priority, timeout, cooldown, endons) {
    if (!isdefined(level.battlechatter.events[event_name])) {
        level.battlechatter.events[event_name] = create_deck();
    }
    event = spawnstruct();
    event.sequence = sequence;
    event.priority = priority;
    event.timeout = timeout;
    event.cooldown = cooldown;
    event.endons = endons;
    index = level.battlechatter.events[event_name].items.size;
    level.battlechatter.events[event_name].items[index] = event;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4023
// Size: 0x97
function function_7aedd2357aecc5a6(event_name, func) {
    if (!isdefined(level.battlechatter.events[event_name])) {
        level.battlechatter.events[event_name] = create_deck();
    }
    index = level.battlechatter.events[event_name].items.size;
    level.battlechatter.events[event_name].items[index] = func;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x40c1
// Size: 0x129
function function_58d2ed1e4ecae7bb(event_name, var_d93390a0d7e03633) {
    if (!isdefined(level.battlechatter.events)) {
        return;
    }
    if (!isdefined(level.battlechatter.events[event_name])) {
        return;
    }
    var_8ad814eb875ed1c2 = [];
    foreach (index, var_4e26918d4dd88782 in level.battlechatter.events[event_name].items) {
        if (var_4e26918d4dd88782 == var_d93390a0d7e03633) {
            if (level.battlechatter.events[event_name].index > index) {
                level.battlechatter.events[event_name].index--;
            }
        } else {
            var_8ad814eb875ed1c2[var_8ad814eb875ed1c2.size] = var_4e26918d4dd88782;
        }
    }
    level.battlechatter.events[event_name].items = var_8ad814eb875ed1c2;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41f1
// Size: 0xcc
function function_c0da17570a24346c(event_name, params) {
    if (!function_5d6cfae8ba773d66(self)) {
        return 1;
    }
    if (!isdefined(level.battlechatter.events[event_name])) {
        return 0;
    }
    event = level.battlechatter.events[event_name] deck_draw();
    if (isarray(params)) {
        params = array_removeundefined(params);
    }
    if (isfunction(event)) {
        thread call_with_params_script(event, params);
    } else {
        thread function_d54e84a9513b0e45(event_name, event.sequence, event.priority, event.timeout, event.cooldown, event.endons);
    }
    return 1;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42c5
// Size: 0x28
function function_4d19743dba541be4() {
    return [0:"axis", 1:"allies", 2:"neutral", 3:"team3"];
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42f5
// Size: 0x1f
function function_cda75fb378a679eb() {
    return [0:"axis", 1:"allies", 2:"team3"];
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x431c
// Size: 0x16
function getenemyteams() {
    return [0:"axis", 1:"team3"];
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x433a
// Size: 0x16
function function_2b3a4945ae9faf96() {
    return [0:"allies", 1:"neutral"];
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4358
// Size: 0x53
function function_d54e84a9513b0e45(var_c5dc0e000c5b1c69, sequence, priority, timeout, cooldown, endons) {
    var_3a7aea3989ae851a = function_6345913274a2ca6a(var_c5dc0e000c5b1c69, sequence, priority, timeout, cooldown, endons);
    return function_55bf3f231c0283cc(var_3a7aea3989ae851a);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43b3
// Size: 0x8a
function function_93b4f17e4a3474b(var_c5dc0e000c5b1c69, sequence, var_7e4b3bd714b23bc7, endons) {
    if (!isdefined(var_7e4b3bd714b23bc7)) {
        var_7e4b3bd714b23bc7 = level.battlechatter.settings[var_c5dc0e000c5b1c69];
    }
    if (isstring(var_7e4b3bd714b23bc7)) {
        var_7e4b3bd714b23bc7 = level.battlechatter.settings[var_7e4b3bd714b23bc7];
    }
    if (!isdefined(var_7e4b3bd714b23bc7)) {
        /#
            iprintlnbold("bcs_stateChange" + var_c5dc0e000c5b1c69);
        #/
        return;
    }
    return function_d54e84a9513b0e45(var_c5dc0e000c5b1c69, sequence, var_7e4b3bd714b23bc7[0], var_7e4b3bd714b23bc7[1], var_7e4b3bd714b23bc7[2], endons);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4445
// Size: 0x216
function private function_55bf3f231c0283cc(var_3a7aea3989ae851a) {
    var_6ad65a109fc1d39 = undefined;
    speaker = function_53c4c53197386572(self.var_868e98cf48b92cfb, self);
    /#
        if (getdvarint(@"hash_864d3ab12f741516") == 1 || getdvarint(@"hash_864d3ab12f741516") == 2) {
            var_6ad65a109fc1d39 = spawnstruct();
        }
    #/
    if (!istrue(var_3a7aea3989ae851a.forced) && !speaker function_d8462b621401984a(undefined, undefined, var_6ad65a109fc1d39)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516") == 2) {
                function_51c8ea07cf76cbd7("finished_queue_wait" + function_53c4c53197386572(var_3a7aea3989ae851a.name, "'") + "sp" + function_55f43964ccdb5b95(speaker) + "sp" + function_53c4c53197386572(var_6ad65a109fc1d39.text, "executions"));
            }
        #/
        var_3a7aea3989ae851a.finished_or_cancelled = 1;
        var_3a7aea3989ae851a notify("finished_or_cancelled");
        return 0;
    }
    if (isdefined(var_3a7aea3989ae851a.name) && !function_ead4bed232d015ed(var_3a7aea3989ae851a.name)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516") == 2) {
                var_724d97199668ae7e = function_ea8354c6061a8b67(var_3a7aea3989ae851a.name);
                extra = "executions";
                if (var_724d97199668ae7e != var_3a7aea3989ae851a.name) {
                    extra = "bad_guys" + var_724d97199668ae7e;
                }
                function_51c8ea07cf76cbd7("bcs_region" + var_3a7aea3989ae851a.name + "sp" + function_55f43964ccdb5b95(speaker) + extra);
            }
        #/
        var_3a7aea3989ae851a.finished_or_cancelled = 1;
        var_3a7aea3989ae851a notify("finished_or_cancelled");
        return 0;
    }
    if (utility::issp()) {
        speaker function_af3a6677d4327aae();
    } else {
        speaker function_b145367392d5843d();
    }
    speaker function_e23b0906b02cd179(var_3a7aea3989ae851a.name, var_3a7aea3989ae851a.cooldown);
    level.battlechatter notify("chatter_added", var_3a7aea3989ae851a);
    var_3a7aea3989ae851a thread function_ac907769b9d391cb();
    return var_3a7aea3989ae851a;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x4663
// Size: 0x53
function function_b9cc4ff760926456(name, sequence, priority, timeout, cooldown, endons) {
    var_3a7aea3989ae851a = function_6345913274a2ca6a(name, sequence, priority, timeout, cooldown, endons);
    return function_f6e959db9fb34ff3(var_3a7aea3989ae851a);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46be
// Size: 0x1c
function function_f6e959db9fb34ff3(var_3a7aea3989ae851a) {
    function_55bf3f231c0283cc(var_3a7aea3989ae851a);
    function_67445f0a05bfcfad(var_3a7aea3989ae851a);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46e1
// Size: 0x4f
function function_67445f0a05bfcfad(var_3a7aea3989ae851a) {
    if (!isdefined(var_3a7aea3989ae851a) || !isstruct(var_3a7aea3989ae851a)) {
        return;
    }
    if (!istrue(var_3a7aea3989ae851a.finished_or_cancelled)) {
        var_3a7aea3989ae851a waittill("finished_or_cancelled");
    }
    if (isdefined(var_3a7aea3989ae851a.finished)) {
        return var_3a7aea3989ae851a.finished;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4737
// Size: 0x3bb
function function_ac907769b9d391cb() {
    self.finished = 0;
    self.finished_or_cancelled = 0;
    self.speaker.var_44e1869b50a57309 = self.scope;
    self.speaker notify("started_queue_wait", self);
    cancelled = self.var_9a4096e3a9b92412[self.scope] function_f2a79001721945a(self, self.timeout, self.endons);
    self.speaker notify("finished_queue_wait", self);
    if (!istrue(cancelled) && (istrue(self.forced) || function_53c4c53197386572(self.speaker.var_868e98cf48b92cfb, self.speaker) function_d8462b621401984a())) {
        level.battlechatter notify("chatter_started", self);
        self.speaker.var_ec9f57e7698baffb = self.priority;
        foreach (ent in self.var_9a4096e3a9b92412) {
            ent function_797820cad48747ef(self);
        }
        self notify("proceeded");
        while (isdefined(self.finished) && !self.finished) {
            self.finished = function_a9c351ded2cf6ce4();
        }
        if (is_dead_or_dying(self.speaker)) {
            self.speaker stop_dialogue();
            if (isdefined(self.var_b1cc80f4b3875f46)) {
                self.var_6727329a89208345 function_93b4f17e4a3474b(self.name + "_interrupt", self.var_b1cc80f4b3875f46, level.battlechatter.settings["_interrupt"]);
            }
        }
        if (istrue(self.finished)) {
            if (self.name == "idle_convo" || self.name == "idle") {
                self.speaker function_e23b0906b02cd179(self.name, level.var_dafa42d7384e9ef5);
            } else {
                self.speaker function_e23b0906b02cd179(self.name, self.cooldown);
            }
        }
        foreach (ent in self.var_9a4096e3a9b92412) {
            ent remove_vo_data(self);
        }
    } else {
        self notify("proceeded");
        /#
            if (getdvarint(@"hash_864d3ab12f741516") == 2 && self.speaker function_d8462b621401984a()) {
                function_51c8ea07cf76cbd7("north" + function_53c4c53197386572(self.name, "'") + "sp" + function_55f43964ccdb5b95(self.speaker));
            } else if (getdvarint(@"hash_864d3ab12f741516") == 2) {
                function_51c8ea07cf76cbd7("90" + function_53c4c53197386572(self.name, "'") + "sp" + function_55f43964ccdb5b95(self.speaker));
            }
        #/
    }
    function_ab8711048f02259d(self.var_9a4096e3a9b92412);
    self.speaker notify("chatter_finished_or_cancelled", self);
    level.battlechatter notify("chatter_finished_or_cancelled", self);
    self.finished_or_cancelled = 1;
    self notify("finished_or_cancelled");
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4af9
// Size: 0x969
function function_a9c351ded2cf6ce4() {
    var_21aafe7978fb1507 = is_dead_or_dying(self.speaker);
    var_781a30cf8f1d4480 = self.speaker function_73eca19eaeb08e4d();
    if (var_21aafe7978fb1507 || var_781a30cf8f1d4480) {
        if (isdefined(self.var_b1cc80f4b3875f46)) {
            function_66f86d312021d93a();
            self.sequence = self.var_b1cc80f4b3875f46;
            self.index = 0;
            self.var_b1cc80f4b3875f46 = undefined;
        } else {
            /#
                if (getdvarint(@"hash_864d3ab12f741516")) {
                    if (var_21aafe7978fb1507) {
                        function_51c8ea07cf76cbd7("<unknown string>" + function_53c4c53197386572(self.name, "'") + "sp" + function_600b37e8cf3f2de9(self.speaker));
                    } else {
                        function_51c8ea07cf76cbd7("<unknown string>" + function_53c4c53197386572(self.name, "'") + "sp" + function_600b37e8cf3f2de9(self.speaker));
                    }
                }
            #/
            return;
        }
    }
    self.speaker notify("stop_bcs_sequence");
    self.speaker endon("death");
    self.speaker endon("stop_bcs_sequence");
    self.speaker endon("removed from battleChatter");
    var_344578fb5c1f5325 = self.speaker;
    foreach (var_a490edba2726ec98 in self.endons) {
        if (isent(var_a490edba2726ec98) || isstruct(var_a490edba2726ec98)) {
            var_344578fb5c1f5325 = var_a490edba2726ec98;
        } else if (isstring(var_a490edba2726ec98)) {
            var_344578fb5c1f5325 endon(var_a490edba2726ec98);
        }
    }
    if (!isdefined(self.sequence) || !isdefined(self.index)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516")) {
                function_51c8ea07cf76cbd7("<unknown string>" + function_53c4c53197386572(self.name, "'"));
            }
        #/
        return;
    }
    vo_queue = level.var_60df2b6c3887b3eb[self.speaker.team].vo_queue;
    if (vo_queue.size > 0 && vo_queue[0].priority > self.priority) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516")) {
                function_51c8ea07cf76cbd7("<unknown string>" + function_53c4c53197386572(self.name, "'") + "<unknown string>" + self.priority + "<unknown string>" + function_53c4c53197386572(vo_queue[0].name, "'") + "<unknown string>" + vo_queue[0].priority);
            }
        #/
        return;
    }
    if (self.index >= self.sequence.size) {
        return 1;
    }
    self.alias = undefined;
    if (utility::issp()) {
        self.speaker function_af3a6677d4327aae();
    } else {
        self.speaker function_b145367392d5843d();
    }
    segment = self.sequence[self.index];
    self.index++;
    if (isstring(segment)) {
        self.alias = function_5b9db2cb162b207a(segment);
        /#
            self.sequence[self.index - 1] = self.alias;
        #/
        if (!soundexists(self.alias)) {
            if (istrue(self.var_b7b89212841eaa3f)) {
                self.var_b7b89212841eaa3f = undefined;
                return 0;
            }
            /#
                if (getdvarint(@"hash_864d3ab12f741516")) {
                    if (!isdefined(self.speaker.battlechatter.countryid)) {
                        function_51c8ea07cf76cbd7("<unknown string>" + function_53c4c53197386572(self.name, "'") + "<unknown string>" + self.speaker getentitynumber() + "<unknown string>" + function_53c4c53197386572(anim.countryids[self.speaker.voice], "executions") + "<unknown string>" + function_53c4c53197386572(self.speaker.voice, "executions"));
                    } else if (self.alias == "executions") {
                        function_51c8ea07cf76cbd7("<unknown string>" + function_53c4c53197386572(self.name, "'") + "<unknown string>" + self.speaker.battlechatter.countryid + "<unknown string>" + segment + "<unknown string>");
                    } else {
                        function_51c8ea07cf76cbd7("<unknown string>" + function_53c4c53197386572(self.name, "'") + "<unknown string>" + self.alias + "<unknown string>" + "<unknown string>" + self.speaker.battlechatter.countryid + "<unknown string>" + segment + "<unknown string>");
                    }
                }
            #/
            return;
        }
        /#
            if (getdvarint(@"hash_864d3ab12f741516") == 1 || getdvarint(@"hash_864d3ab12f741516") == 2) {
                var_6ad65a109fc1d39 = spawnstruct();
            }
        #/
        if (!istrue(self.forced) && !function_53c4c53197386572(self.speaker.var_868e98cf48b92cfb, self.speaker) function_d8462b621401984a(undefined, undefined, var_6ad65a109fc1d39)) {
            /#
                if (getdvarint(@"hash_864d3ab12f741516")) {
                    function_51c8ea07cf76cbd7("<unknown string>" + function_53c4c53197386572(self.name, "'") + "sp" + function_55f43964ccdb5b95(function_53c4c53197386572(self.speaker.var_868e98cf48b92cfb, self.speaker)) + "sp" + function_53c4c53197386572(var_6ad65a109fc1d39.text));
                }
            #/
            return;
        }
        if (!function_6cf6a58c99522e20(self.var_9a4096e3a9b92412[self.scope].var_261aaf24a09d231d, 1)) {
            /#
                if (getdvarint(@"hash_864d3ab12f741516")) {
                    function_51c8ea07cf76cbd7("<unknown string>" + function_53c4c53197386572(self.name, "'"));
                }
            #/
            return;
        }
        /#
            if (getdvarint(@"hash_864d3ab12f741516") && !istrue(self.var_589023656a9e531)) {
                self.var_589023656a9e531 = 1;
                function_51c8ea07cf76cbd7("<unknown string>" + function_53c4c53197386572(self.name, "'") + "sp" + function_55f43964ccdb5b95(self.owner));
            }
        #/
        finished = self.speaker function_7b52f05da542c2ff(self.alias, self.var_f6e387b9f5a2b39c, self.var_9a4096e3a9b92412[self.scope], self.var_5c1322185369efcd);
        if (!istrue(finished)) {
            /#
                if (getdvarint(@"hash_864d3ab12f741516")) {
                    function_51c8ea07cf76cbd7("<unknown string>" + function_53c4c53197386572(self.name, "'"));
                }
            #/
            return;
        }
        return 0;
    } else if (isnumber(segment)) {
        if (segment <= 0) {
            return 0;
        }
        wait(segment);
        return 0;
    } else if (isent(segment) || isstruct(segment)) {
        result = function_66f86d312021d93a(segment);
        if (isint(result) && result == 0) {
            /#
                if (getdvarint(@"hash_864d3ab12f741516")) {
                    function_51c8ea07cf76cbd7("<unknown string>" + function_53c4c53197386572(self.name, "'"));
                }
            #/
            return;
        } else {
            return 0;
        }
    } else if (isfunction(segment)) {
        result = self [[ segment ]]();
        if (isdefined(result)) {
            if (isint(result) && result == 0) {
                /#
                    if (getdvarint(@"hash_864d3ab12f741516")) {
                        function_51c8ea07cf76cbd7("<unknown string>" + function_53c4c53197386572(self.name, "'") + "<unknown string>" + self.index - 1 + "<unknown string>");
                    }
                #/
                return;
            }
            if (isarray(result)) {
                self.sequence = function_ef4b3df86351aa00(self.sequence, result, self.index);
            } else {
                self.sequence = array_insert(self.sequence, result, self.index);
            }
        }
        return 0;
    } else if (isarray(segment)) {
        self.sequence = function_ef4b3df86351aa00(self.sequence, segment, self.index);
        return 0;
    }
    /#
        if (getdvarint(@"hash_864d3ab12f741516")) {
            function_51c8ea07cf76cbd7("<unknown string>" + self.index + "<unknown string>" + function_53c4c53197386572(self.name, "'"));
        }
    #/
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x546a
// Size: 0x39
function function_51c8ea07cf76cbd7(text, var_73a14d94e40a8d15) {
    /#
        if (isdefined(var_73a14d94e40a8d15)) {
            var_73a14d94e40a8d15.text = text;
            return;
        }
        namespace_d8bd5ac27a00a48d::function_7320cd1e4f724899(text);
        println(text);
    #/
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54aa
// Size: 0x709
function function_a8c755adb8698257() {
    /#
        level endon("<unknown string>");
        player = undefined;
        for (;;) {
            for (;;) {
                if (!getdvarint(@"hash_864d3ab12f741516") || !isdefined(level.battlechatter) || !isdefined(level.var_261aaf24a09d231d)) {
                    goto LOC_00000703;
                }
                var_aaaa8a8df8f5c537 = getdvarint(@"hash_b7c9a158890bce5a", 1920);
                var_ab5696f7e031e1ba = getdvarint(@"hash_9139b4ad2f235c95", 1080);
                var_39c991ead8822d9b = getdvarint(@"hash_b7c9a158890bce5a") / 1920;
                var_3f109f5aaf427a = getdvarint(@"hash_9139b4ad2f235c95") / 1080;
                setdvarifuninitialized(@"hash_91d2bfdbf8875369", 350);
                setdvarifuninitialized(@"hash_91d2bedbf8875136", 250);
                setdvarifuninitialized(@"hash_4fd3148b1459a83", 0.8);
                var_dcebffdb83b0ff93 = getdvarint(@"hash_91d2bfdbf8875369") * var_39c991ead8822d9b;
                var_dcebfedb83b0fd60 = getdvarint(@"hash_91d2bedbf8875136") * var_3f109f5aaf427a;
                var_1499c6e91b1a2b2d = getdvarfloat(@"hash_4fd3148b1459a83") * var_3f109f5aaf427a;
                var_3e55110c18e69a9f = 0;
                for (k = 0; k < level.var_261aaf24a09d231d.size; k++) {
                    if (!istrue(level.var_261aaf24a09d231d[k].var_79498adf23c51e6a)) {
                        continue;
                    }
                    var_3a7aea3989ae851a = level.var_261aaf24a09d231d[k];
                    sequence = var_3a7aea3989ae851a.sequence;
                    if (isdefined(var_3a7aea3989ae851a.name)) {
                        speaker = function_53c4c53197386572(var_3a7aea3989ae851a.speaker.var_868e98cf48b92cfb, var_3a7aea3989ae851a.speaker);
                        if (isstruct(var_3a7aea3989ae851a.speaker) && isdefined(var_3a7aea3989ae851a.speaker.var_868e98cf48b92cfb)) {
                            var_4335520d6c2fe6bc = "<unknown string>" + speaker getentitynumber() + "<unknown string>";
                        } else if (isstruct(var_3a7aea3989ae851a.speaker)) {
                            var_4335520d6c2fe6bc = "<unknown string>" + "<unknown string>" + "<unknown string>";
                        } else {
                            var_4335520d6c2fe6bc = "<unknown string>" + speaker getentitynumber();
                        }
                        var_bd00ebb44a0208e0 = "<unknown string>" + var_4335520d6c2fe6bc + "<unknown string>" + var_3a7aea3989ae851a.name + "<unknown string>";
                        if (!isdefined(speaker.team)) {
                            color = (1, 1, 1);
                        } else {
                            color = ter_op(speaker.team == "<unknown string>", (0.1, 0.9, 0.1), (1, 0.2, 0.2));
                        }
                        pos_y = var_dcebfedb83b0fd60 + var_3e55110c18e69a9f;
                        printtoscreen2d(var_dcebffdb83b0ff93 + 2, pos_y, var_bd00ebb44a0208e0, (0, 0, 0), 1.75 * var_1499c6e91b1a2b2d);
                        printtoscreen2d(var_dcebffdb83b0ff93, pos_y + 2, var_bd00ebb44a0208e0, (0, 0, 0), 1.75 * var_1499c6e91b1a2b2d);
                        printtoscreen2d(var_dcebffdb83b0ff93, pos_y, var_bd00ebb44a0208e0, color, 1.75 * var_1499c6e91b1a2b2d);
                        if (!isdefined(player)) {
                            player = function_47c84e03dcbc5aa7((0, 0, 0));
                        }
                        if (isdefined(player)) {
                            var_ca9c2892a121c317 = mapfloat(0, var_aaaa8a8df8f5c537, 380, -380, var_dcebffdb83b0ff93 * 0.5);
                            var_ca9c2792a121c0e4 = mapfloat(0, var_ab5696f7e031e1ba, -240, 240, pos_y * 0.5);
                            var_796003daa202b1f3 = player function_e4f6daea7b92c762((var_ca9c2892a121c317, var_ca9c2792a121c0e4, 0), 65, 5, 1);
                            line(speaker.origin, var_796003daa202b1f3, color);
                            debugstar(speaker.origin, color, 1, var_4335520d6c2fe6bc);
                        }
                        var_3e55110c18e69a9f = var_3e55110c18e69a9f + 30 * var_1499c6e91b1a2b2d;
                    }
                    for (i = 0; i < sequence.size; i++) {
                        var_67d117e11f6e4cc = undefined;
                        segment = sequence[i];
                        if (isstring(segment)) {
                            if (!isstartstr(segment, "<unknown string>")) {
                                alias = segment;
                            } else {
                                alias = var_3a7aea3989ae851a function_5b9db2cb162b207a(segment);
                                alias = getsubstr(alias, 6, alias.size);
                            }
                            var_67d117e11f6e4cc = "<unknown string>" + ter_op(isdefined(alias), alias, segment);
                        } else if (isnumber(segment)) {
                            var_67d117e11f6e4cc = "<unknown string>" + segment + "<unknown string>";
                        } else if (isent(segment)) {
                            var_8efef5b1e4d79b79 = "<unknown string>" + segment getentitynumber();
                            var_67d117e11f6e4cc = "<unknown string>";
                            if (isdefined(segment.animname)) {
                                var_67d117e11f6e4cc = var_67d117e11f6e4cc + segment.animname + "<unknown string>" + var_8efef5b1e4d79b79 + "<unknown string>";
                            } else {
                                var_67d117e11f6e4cc = var_67d117e11f6e4cc + var_8efef5b1e4d79b79;
                            }
                        } else if (isstruct(segment) && isdefined(segment.var_868e98cf48b92cfb)) {
                            var_8efef5b1e4d79b79 = "<unknown string>" + segment.var_868e98cf48b92cfb getentitynumber();
                            var_67d117e11f6e4cc = "<unknown string>";
                            if (isdefined(segment.var_868e98cf48b92cfb.animname)) {
                                var_67d117e11f6e4cc = var_67d117e11f6e4cc + segment.var_868e98cf48b92cfb.animname + "<unknown string>" + var_8efef5b1e4d79b79 + "<unknown string>";
                            } else {
                                var_67d117e11f6e4cc = var_67d117e11f6e4cc + var_8efef5b1e4d79b79 + "<unknown string>";
                            }
                        } else if (isfunction(segment)) {
                            var_67d117e11f6e4cc = "<unknown string>";
                        }
                        if (isdefined(var_67d117e11f6e4cc)) {
                            var_9ef7c7fe01448dee = i == var_3a7aea3989ae851a.index - 1;
                            color = ter_op(var_9ef7c7fe01448dee, (1, 1, 0), (1, 1, 1));
                            space = ter_op(var_9ef7c7fe01448dee, 32, 25) * var_1499c6e91b1a2b2d;
                            scale = ter_op(var_9ef7c7fe01448dee, 1.85, 1.5) * var_1499c6e91b1a2b2d;
                            printtoscreen2d(var_dcebffdb83b0ff93 + 2, var_dcebfedb83b0fd60 + 2 + var_3e55110c18e69a9f + var_9ef7c7fe01448dee * 10 * var_1499c6e91b1a2b2d, var_67d117e11f6e4cc, (0, 0, 0), scale);
                            printtoscreen2d(var_dcebffdb83b0ff93 + 2, var_dcebfedb83b0fd60 + 2 + var_3e55110c18e69a9f + var_9ef7c7fe01448dee * 10 * var_1499c6e91b1a2b2d, var_67d117e11f6e4cc, (0, 0, 0), scale);
                            printtoscreen2d(var_dcebffdb83b0ff93, var_dcebfedb83b0fd60 + var_3e55110c18e69a9f + var_9ef7c7fe01448dee * 10 * var_1499c6e91b1a2b2d, var_67d117e11f6e4cc, color, scale);
                            var_3e55110c18e69a9f = var_3e55110c18e69a9f + space;
                        }
                    }
                    if (k < level.var_261aaf24a09d231d.size - 1) {
                        printtoscreen2d(var_dcebffdb83b0ff93, var_dcebfedb83b0fd60 + var_3e55110c18e69a9f, "<unknown string>", (1, 1, 1), 1.5 * var_1499c6e91b1a2b2d);
                        var_3e55110c18e69a9f = var_3e55110c18e69a9f + 30 * var_1499c6e91b1a2b2d;
                    }
                }
            LOC_00000703:
            }
        }
    #/
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5bba
// Size: 0x1b8
function private function_6345913274a2ca6a(name, sequence, priority, timeout, cooldown, endons) {
    var_3a7aea3989ae851a = spawnstruct();
    var_3a7aea3989ae851a.name = name;
    var_3a7aea3989ae851a.scope = function_53c4c53197386572(level.battlechatter.scope, "team");
    var_3a7aea3989ae851a.owner = self;
    var_3a7aea3989ae851a.speaker = self;
    var_3a7aea3989ae851a.var_9a4096e3a9b92412 = function_28e38eefd3cc4ab();
    var_3a7aea3989ae851a.var_79498adf23c51e6a = 1;
    if (!isarray(sequence)) {
        sequence = [0:sequence];
    }
    var_3a7aea3989ae851a.index = 0;
    var_3a7aea3989ae851a.sequence = sequence;
    var_3a7aea3989ae851a.forced = isdefined(level.battlechatter) && isdefined(self.battlechatter) && istrue(self.battlechatter.friendlyfire_force) && name == "friendlyfire";
    var_3a7aea3989ae851a.priority = function_53c4c53197386572(priority, 0);
    var_3a7aea3989ae851a.timeout = function_53c4c53197386572(timeout, 1);
    var_3a7aea3989ae851a.cooldown = function_53c4c53197386572(cooldown, 0);
    var_3a7aea3989ae851a.endons = function_53c4c53197386572(endons, []);
    var_3a7aea3989ae851a.var_f6e387b9f5a2b39c = 1;
    if (!isarray(var_3a7aea3989ae851a.endons)) {
        var_3a7aea3989ae851a.endons = [0:var_3a7aea3989ae851a.endons];
    }
    return var_3a7aea3989ae851a;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d7a
// Size: 0x7e
function function_a4ba1099ac49c74(sequence) {
    foreach (segment in sequence) {
        if (isarray(segment)) {
            result = function_a4ba1099ac49c74(segment);
            if (isdefined(result)) {
                return result;
            }
        }
        if (isent(segment)) {
            return segment;
        }
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dff
// Size: 0x7e
function function_c2aafbdbd7ff7b82(sequence) {
    foreach (segment in sequence) {
        if (isarray(segment)) {
            result = function_c2aafbdbd7ff7b82(segment);
            if (isdefined(result)) {
                return result;
            }
        }
        if (isstring(segment)) {
            return segment;
        }
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e84
// Size: 0x2cf
function function_5b9db2cb162b207a(var_a5adf7ca3ddc0cfd) {
    if (isstartstr(var_a5adf7ca3ddc0cfd, "dx_")) {
        return var_a5adf7ca3ddc0cfd;
    }
    if (!isstartstr(var_a5adf7ca3ddc0cfd, "~") && !isstartstr(var_a5adf7ca3ddc0cfd, "c_") && !isstartstr(var_a5adf7ca3ddc0cfd, "s_")) {
        var_a5adf7ca3ddc0cfd = self.speaker function_ac566e2d34bccaa2(var_a5adf7ca3ddc0cfd);
    }
    if (!isdefined(var_a5adf7ca3ddc0cfd)) {
        return "";
    }
    if (isstartstr(var_a5adf7ca3ddc0cfd, "dx_")) {
        return var_a5adf7ca3ddc0cfd;
    }
    if (!isdefined(self.speaker) || !isdefined(self.speaker.battlechatter)) {
        return "";
    }
    var_f75ba7b0d6a4b1cb = strtok(var_a5adf7ca3ddc0cfd, "_");
    char = function_53c4c53197386572(function_8af9f89d6344a3df(self.speaker), "");
    countryid = function_53c4c53197386572(self.speaker.battlechatter.countryid, "");
    if (isdefined(self.speaker.battlechatter.var_96a045a4858e3f20)) {
        countryid = self.speaker.battlechatter.var_96a045a4858e3f20;
    }
    if (var_f75ba7b0d6a4b1cb.size > 2) {
        if (isdefined(countryid)) {
            if (var_f75ba7b0d6a4b1cb[0] == "s") {
                var_f75ba7b0d6a4b1cb[0] = anim.var_7f532a5dc6603698[countryid];
            } else {
                var_f75ba7b0d6a4b1cb[0] = anim.var_6d557183af1d1db5[countryid];
            }
        }
        if (!isdefined(countryid) || !isdefined(var_f75ba7b0d6a4b1cb[0])) {
            if (isstartstr(var_a5adf7ca3ddc0cfd, "c")) {
                var_f75ba7b0d6a4b1cb[0] = "hrbc";
            } else {
                var_f75ba7b0d6a4b1cb[0] = "hrcm";
            }
        }
    }
    switch (var_f75ba7b0d6a4b1cb.size) {
    case 4:
        return ("dx_bc_" + var_f75ba7b0d6a4b1cb[0] + "_" + var_f75ba7b0d6a4b1cb[1] + "_" + char + "_" + var_f75ba7b0d6a4b1cb[2] + "_" + var_f75ba7b0d6a4b1cb[3]);
    case 3:
        return ("dx_bc_" + var_f75ba7b0d6a4b1cb[0] + "_" + var_f75ba7b0d6a4b1cb[1] + "_" + char + "_" + var_f75ba7b0d6a4b1cb[2]);
    case 2:
        return ("dx_bc_" + var_f75ba7b0d6a4b1cb[0] + "_" + char + "_" + var_f75ba7b0d6a4b1cb[1]);
    case 1:
        if (istrue(self.speaker.battlechatter.isleader)) {
            return ("dx_guid" + var_f75ba7b0d6a4b1cb[0]);
            goto LOC_00000278;
        }
        return ("dx_guid" + var_f75ba7b0d6a4b1cb[0] + "_" + char);
    default:
    LOC_00000278:
        /#
            assertmsg("Invalid battlechatter event '" + var_a5adf7ca3ddc0cfd + "'");
        #/
        break;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x615a
// Size: 0x64
function function_a02d91c29d53a43c(var_a5adf7ca3ddc0cfd) {
    if (!isdefined(level.battlechatter.var_642abcb792d36a72)) {
        function_fa9c799417080957();
    }
    if (isdefined(level.battlechatter.var_642abcb792d36a72[var_a5adf7ca3ddc0cfd])) {
        return level.battlechatter.var_642abcb792d36a72[var_a5adf7ca3ddc0cfd] deck_draw();
    } else {
        return var_a5adf7ca3ddc0cfd;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61c5
// Size: 0x18
function function_fa9c799417080957() {
    level.battlechatter.var_642abcb792d36a72 = [];
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61e4
// Size: 0xf6
function function_8af9f89d6344a3df(speaker) {
    if (isdefined(speaker.battlechatter.var_510a786f345dccd9)) {
        return tolower(speaker.battlechatter.var_510a786f345dccd9);
    }
    npcid = function_53c4c53197386572(speaker.battlechatter.npcid, "");
    if (npcid.size == 4) {
        return tolower(npcid);
    }
    countryid = function_53c4c53197386572(speaker.battlechatter.countryid, "");
    if (isdefined(speaker.battlechatter.var_96a045a4858e3f20)) {
        countryid = speaker.battlechatter.var_96a045a4858e3f20;
    }
    if (countryid == "RU") {
        return tolower(countryid + "0" + npcid);
    }
    return tolower(countryid + npcid);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62e2
// Size: 0xa6
function function_c5f095386a46f1e8(type) {
    type = function_53c4c53197386572(type, "stealth");
    switch (type) {
    case #"hash_3d5f49f17b95335c":
        var_543e5b04347ff90c = getdvar(@"hash_495535a4877b324d") != "off";
        return ter_op(var_543e5b04347ff90c, "otn_", "cst_");
    case #"hash_44e999799ff10fce":
        return "vom_";
    default:
        var_543e5b04347ff90c = getdvar(@"hash_87dca5163728ce02") != "off";
        return ter_op(var_543e5b04347ff90c, "otn_", "cbc_");
        break;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x638f
// Size: 0xc7
function function_5cacc2ee536504ae() {
    if (isdefined(level.gamemode)) {
        return level.gamemode;
    }
    mapname = getdvar(@"hash_f644e90eb9a008cf");
    switch (getsubstr(mapname, 0, 3)) {
    case #"hash_2865036c1ee43ae5":
        if (getsubstr(mapname, 0, 6) == "mp_br_") {
            level.gamemode = "br";
        } else {
            level.gamemode = "mp";
        }
        break;
    case #"hash_1a50316c17b5a73b":
        level.gamemode = "cp";
        break;
    default:
        level.gamemode = "sp";
        break;
    }
    return level.gamemode;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x645e
// Size: 0xf0
function getlocation() {
    if (!isdefined(level.battlechatter.var_a4162f1221e6a6)) {
        return;
    }
    var_a4162f1221e6a6 = self getistouchingentities(level.battlechatter.var_a4162f1221e6a6);
    if (var_a4162f1221e6a6.size == 0) {
        return;
    }
    locations = [];
    foreach (trigger in var_a4162f1221e6a6) {
        var_2dab9fb88c214a2e = isdefined(trigger.islandmark) && level.player istouching(trigger);
        if (var_2dab9fb88c214a2e || !isdefined(trigger.location)) {
            continue;
        }
        locations[locations.size] = trigger.location;
    }
    return random(locations);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6556
// Size: 0x1cd
function function_5d6cfae8ba773d66(guy, var_756f032d7218a490, var_5499de48ce486044) {
    if (!isdefined(level.battlechatter) || !isdefined(guy.battlechatter)) {
        /#
            if (istrue(var_756f032d7218a490) && getdvarint(@"hash_864d3ab12f741516") >= 2) {
                function_51c8ea07cf76cbd7("finished_queue_wait" + function_53c4c53197386572(var_5499de48ce486044, "'") + "sp" + function_55f43964ccdb5b95(guy) + "<unknown string>");
            }
        #/
        return 0;
    }
    if (istrue(level.var_91a8c7abdf195c70)) {
        /#
            if (istrue(var_756f032d7218a490) && getdvarint(@"hash_864d3ab12f741516") >= 2) {
                function_51c8ea07cf76cbd7("finished_queue_wait" + function_53c4c53197386572(var_5499de48ce486044, "'") + "sp" + function_55f43964ccdb5b95(guy) + "<unknown string>");
            }
        #/
        return 0;
    }
    if (!istrue(guy.battlechatterallowed)) {
        /#
            if (istrue(var_756f032d7218a490) && getdvarint(@"hash_864d3ab12f741516") >= 2) {
                function_51c8ea07cf76cbd7("finished_queue_wait" + function_53c4c53197386572(var_5499de48ce486044, "'") + "sp" + function_55f43964ccdb5b95(guy) + "<unknown string>");
            }
        #/
        return 0;
    }
    if (isdefined(level.var_edce163bbab4f0ce)) {
        team = function_53c4c53197386572(guy.team, "");
        if (istrue(level.var_edce163bbab4f0ce[team])) {
            /#
                if (istrue(var_756f032d7218a490) && getdvarint(@"hash_864d3ab12f741516") >= 2) {
                    function_51c8ea07cf76cbd7("finished_queue_wait" + function_53c4c53197386572(var_5499de48ce486044, "'") + "sp" + function_55f43964ccdb5b95(guy) + "<unknown string>" + team + "<unknown string>");
                }
            #/
            return 0;
        }
    }
    return 1;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x672b
// Size: 0x3b
function function_73eca19eaeb08e4d() {
    if (!isdefined(self)) {
        return 0;
    }
    if (isai(self)) {
        if (issharedfuncdefined("executions", "is_in_takedown")) {
            return self [[ getsharedfunc("executions", "is_in_takedown") ]]();
        }
    }
    return 0;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x676e
// Size: 0x206
function function_d8462b621401984a(var_f35feae42b2b331, var_9b7f602c247c3953, var_73a14d94e40a8d15, var_4acfa36a6dd8b797) {
    if (is_dead_or_dying(self) || !isdefined(self.team) || !isdefined(self.origin) || !function_5d6cfae8ba773d66(self)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516") == 3 || isdefined(var_73a14d94e40a8d15)) {
                function_51c8ea07cf76cbd7("<unknown string>", var_73a14d94e40a8d15);
            }
        #/
        return 0;
    }
    if (function_73eca19eaeb08e4d()) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516") == 3 || isdefined(var_73a14d94e40a8d15)) {
                function_51c8ea07cf76cbd7("<unknown string>", var_73a14d94e40a8d15);
            }
        #/
    }
    if (isdefined(var_f35feae42b2b331) && function_16dce705f14f4b84() != var_f35feae42b2b331) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516") == 3 || isdefined(var_73a14d94e40a8d15)) {
                function_51c8ea07cf76cbd7("<unknown string>", var_73a14d94e40a8d15);
            }
        #/
        return 0;
    }
    if (isdefined(var_9b7f602c247c3953)) {
        var_4acfa36a6dd8b797 = function_53c4c53197386572(var_4acfa36a6dd8b797, 2);
        if (!self seerecently(var_9b7f602c247c3953, var_4acfa36a6dd8b797)) {
            /#
                if (getdvarint(@"hash_864d3ab12f741516") == 3 || isdefined(var_73a14d94e40a8d15)) {
                    function_51c8ea07cf76cbd7("<unknown string>", var_73a14d94e40a8d15);
                }
            #/
            return 0;
        }
    }
    if (istrue(self.in_melee_death)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516") == 3 || isdefined(var_73a14d94e40a8d15)) {
                function_51c8ea07cf76cbd7("<unknown string>", var_73a14d94e40a8d15);
            }
        #/
        return 0;
    }
    if (istrue(self._animactive) && !istrue(self.battlechatter.var_7be5dbf61ca23f11)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516") == 3 || isdefined(var_73a14d94e40a8d15)) {
                function_51c8ea07cf76cbd7("<unknown string>", var_73a14d94e40a8d15);
            }
        #/
        return 0;
    }
    if (isplayer(self)) {
        return 1;
    }
    if (!function_2aa175082bdb56f5(self.origin, level.var_63a73645a8e030ad).size > 0) {
        /#
            if (isdefined(var_73a14d94e40a8d15)) {
                function_51c8ea07cf76cbd7("<unknown string>", var_73a14d94e40a8d15);
            }
        #/
        return 0;
    }
    return 1;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x697c
// Size: 0x27
function bc_prefix(type) {
    return "dx_" + function_c5f095386a46f1e8(type) + function_8af9f89d6344a3df(self) + "_";
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x69ab
// Size: 0x42
function private function_ea8354c6061a8b67(var_23de3301e42dcefc) {
    var_86f85215d7ed5812 = level.battlechatter.settings[var_23de3301e42dcefc];
    if (isdefined(var_86f85215d7ed5812) && isstring(var_86f85215d7ed5812)) {
        return var_86f85215d7ed5812;
    } else {
        return var_23de3301e42dcefc;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f4
// Size: 0x10c
function function_ead4bed232d015ed(name, players) {
    name = function_ea8354c6061a8b67(name);
    if (!isdefined(players)) {
        if (utility::issp()) {
            players = [0:level.player];
        } else {
            players = function_2aa175082bdb56f5(self.origin, level.var_63a73645a8e030ad);
        }
    }
    foreach (player in players) {
        if (!isdefined(player.var_9d0c877b6e13853e) || !isdefined(player.var_9d0c877b6e13853e[self.team])) {
            continue;
        }
        if (!isdefined(player.var_9d0c877b6e13853e[self.team][name])) {
            continue;
        }
        if (gettime() < player.var_9d0c877b6e13853e[self.team][name]) {
            return 0;
        }
    }
    return 1;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6b08
// Size: 0x3e
function function_161bd3732c0afbce(name, duration, players) {
    name = function_ea8354c6061a8b67(name);
    if (!function_ead4bed232d015ed(name, players)) {
        return 0;
    }
    function_e23b0906b02cd179(name, duration, players);
    return 1;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b4e
// Size: 0x16b
function function_e23b0906b02cd179(name, duration, players) {
    if (!isdefined(name) || !isdefined(duration) || !isdefined(self.origin)) {
        return;
    }
    name = function_ea8354c6061a8b67(name);
    if (!isdefined(players)) {
        if (utility::issp()) {
            players = [0:level.player];
        } else {
            players = function_2aa175082bdb56f5(self.origin, level.var_63a73645a8e030ad);
        }
    }
    foreach (player in players) {
        if (!isdefined(player.var_9d0c877b6e13853e)) {
            player.var_9d0c877b6e13853e = [];
        }
        if (!isdefined(player.var_9d0c877b6e13853e[self.team])) {
            player.var_9d0c877b6e13853e[self.team] = [];
        }
        player.var_9d0c877b6e13853e[self.team][name] = gettime() + duration * 1000;
        if (utility::ismp()) {
            player.var_9d0c877b6e13853e[self.team] = function_ab7df904aa60d433(player.var_9d0c877b6e13853e[self.team], 5);
        }
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cc0
// Size: 0xf3
function clear_cooldown(name) {
    if (!isdefined(name) || !isdefined(self.origin)) {
        return;
    }
    name = function_ea8354c6061a8b67(name);
    if (utility::issp()) {
        players = [0:level.player];
    } else {
        players = function_2aa175082bdb56f5(self.origin, level.var_63a73645a8e030ad);
    }
    foreach (player in players) {
        if (!isdefined(player.var_9d0c877b6e13853e)) {
            continue;
        }
        if (!isdefined(player.var_9d0c877b6e13853e[self.team])) {
            continue;
        }
        player.var_9d0c877b6e13853e[self.team][name] = undefined;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dba
// Size: 0x12f
function function_66f86d312021d93a(var_65e9c81367809607) {
    if (!isdefined(var_65e9c81367809607)) {
        var_65e9c81367809607 = self.var_6727329a89208345;
    }
    if (!isdefined(var_65e9c81367809607)) {
        var_65e9c81367809607 = function_132875639c660348();
    }
    if (isint(var_65e9c81367809607) && var_65e9c81367809607 == 0) {
        return 0;
    }
    foreach (ent in self.var_9a4096e3a9b92412) {
        ent remove_vo_data(self);
    }
    self.var_6727329a89208345 = self.speaker;
    self.speaker = var_65e9c81367809607;
    self.speaker.var_ec9f57e7698baffb = self.priority;
    self.var_9a4096e3a9b92412 = self.speaker function_28e38eefd3cc4ab();
    foreach (ent in self.var_9a4096e3a9b92412) {
        ent function_797820cad48747ef(self);
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ef0
// Size: 0x25
function function_132875639c660348() {
    var_aeb2e2cdc9405f3a = self.speaker function_d8c3c539bc71c7af();
    if (isdefined(var_aeb2e2cdc9405f3a)) {
        return var_aeb2e2cdc9405f3a;
    }
    return 0;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f1d
// Size: 0x25
function function_12014207b3e66976() {
    var_aeb2e2cdc9405f3a = self.speaker getclosestfriendlyspeaker();
    if (isdefined(var_aeb2e2cdc9405f3a)) {
        return var_aeb2e2cdc9405f3a;
    }
    return 0;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f4a
// Size: 0x25
function function_2a9c2c2765055f10() {
    var_aeb2e2cdc9405f3a = self.speaker function_6b500fae7c3e61da();
    if (isdefined(var_aeb2e2cdc9405f3a)) {
        return var_aeb2e2cdc9405f3a;
    }
    return 0;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f77
// Size: 0x25
function function_ce07522e02781160() {
    var_aeb2e2cdc9405f3a = function_573b9ff9ed152518(self.speaker);
    if (isdefined(var_aeb2e2cdc9405f3a)) {
        return var_aeb2e2cdc9405f3a;
    }
    return 0;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fa4
// Size: 0x25
function function_afd322664ba54fa7() {
    var_aeb2e2cdc9405f3a = function_592f13f1a0e078ff(self.speaker);
    if (isdefined(var_aeb2e2cdc9405f3a)) {
        return var_aeb2e2cdc9405f3a;
    }
    return 0;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fd1
// Size: 0xb4
function function_78a4669238a942e8() {
    rank = function_d04239c1e5b61876();
    if (!isdefined(rank)) {
        return getaiarray(self.team);
    }
    var_6fb4ccb6f62e8796 = [];
    foreach (guy in getaiarray(self.team)) {
        if (guy == self) {
            continue;
        }
        var_2f410612188f54ab = guy function_d04239c1e5b61876();
        if (isdefined(var_2f410612188f54ab) && var_2f410612188f54ab < rank) {
            var_6fb4ccb6f62e8796[var_6fb4ccb6f62e8796.size] = guy;
        }
    }
    return var_6fb4ccb6f62e8796;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x708d
// Size: 0xb4
function function_78be0fae168f6d5() {
    rank = function_d04239c1e5b61876();
    if (!isdefined(rank)) {
        return getaiarray(self.team);
    }
    var_c1719142d64ce43 = [];
    foreach (guy in getaiarray(self.team)) {
        if (guy == self) {
            continue;
        }
        var_2f410612188f54ab = guy function_d04239c1e5b61876();
        if (isdefined(var_2f410612188f54ab) && var_2f410612188f54ab > rank) {
            var_c1719142d64ce43[var_c1719142d64ce43.size] = guy;
        }
    }
    return var_c1719142d64ce43;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7149
// Size: 0x35
function function_401ec0642c92d2eb() {
    return ter_op(self.team == "axis" || self.team == "team3", "allies", "bad_guys");
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7186
// Size: 0x69
function function_6e80d82709faefd() {
    npcid = undefined;
    if (isdefined(self.battlechatter)) {
        npcid = self.battlechatter.npcid;
    }
    var_65e9c81367809607 = function_248a7374a1a0605a(self.origin, function_78a4669238a942e8(), npcid);
    if (!isdefined(var_65e9c81367809607)) {
        var_65e9c81367809607 = getclosestfriendlyspeaker(self.team);
    }
    return var_65e9c81367809607;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x71f7
// Size: 0x69
function function_a271b08319ea86ae() {
    npcid = undefined;
    if (isdefined(self.battlechatter)) {
        npcid = self.battlechatter.npcid;
    }
    var_65e9c81367809607 = function_248a7374a1a0605a(self.origin, function_78be0fae168f6d5(), npcid);
    if (!isdefined(var_65e9c81367809607)) {
        var_65e9c81367809607 = getclosestfriendlyspeaker(self.team);
    }
    return var_65e9c81367809607;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7268
// Size: 0x60
function function_6b500fae7c3e61da() {
    npcid = undefined;
    if (isdefined(self.battlechatter)) {
        npcid = self.battlechatter.npcid;
    }
    var_65e9c81367809607 = function_b1ab02cfbfd12e43(function_78a4669238a942e8(), npcid);
    if (!isdefined(var_65e9c81367809607)) {
        var_65e9c81367809607 = function_d8c3c539bc71c7af(self.team);
    }
    return var_65e9c81367809607;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x72d0
// Size: 0x60
function function_e5e9db75fe72e36f() {
    npcid = undefined;
    if (isdefined(self.battlechatter)) {
        npcid = self.battlechatter.npcid;
    }
    var_65e9c81367809607 = function_b1ab02cfbfd12e43(function_78be0fae168f6d5(), npcid);
    if (!isdefined(var_65e9c81367809607)) {
        var_65e9c81367809607 = function_d8c3c539bc71c7af(self.team);
    }
    return var_65e9c81367809607;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7338
// Size: 0xd1
function getclosestfriendlyspeaker(team, var_f35feae42b2b331, var_877945e6d268ba99, maxdist) {
    team = function_53c4c53197386572(team, self.team);
    maxdist = function_53c4c53197386572(maxdist, level.var_798aa343368f724e);
    if (!isdefined(team) || team == "dead") {
        return;
    }
    if (!isdefined(self.origin)) {
        return;
    }
    npcid = undefined;
    if (isdefined(self.battlechatter) && isdefined(self.battlechatter.npcid)) {
        npcid = self.battlechatter.npcid;
    }
    return function_248a7374a1a0605a(self.origin, function_fd9e4cb348a5f283(self.origin, maxdist, team), npcid, var_f35feae42b2b331, var_877945e6d268ba99);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7411
// Size: 0x9c
function function_64bb0212d4b3e7fb(team, var_f35feae42b2b331, var_877945e6d268ba99, maxdist) {
    if (!isdefined(self.enemy) || !isdefined(self.enemy.team)) {
        return;
    }
    team = function_53c4c53197386572(team, self.enemy.team);
    maxdist = function_53c4c53197386572(maxdist, level.var_798aa343368f724e);
    return function_248a7374a1a0605a(self.origin, function_fd9e4cb348a5f283(self.origin, maxdist, team), undefined, var_f35feae42b2b331, var_877945e6d268ba99);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74b5
// Size: 0x90
function function_d8c3c539bc71c7af(team, var_f35feae42b2b331, var_877945e6d268ba99, maxdist) {
    team = function_53c4c53197386572(team, self.team);
    maxdist = function_53c4c53197386572(maxdist, level.var_798aa343368f724e);
    npcid = undefined;
    if (isdefined(self.battlechatter)) {
        npcid = self.battlechatter.npcid;
    }
    return function_b1ab02cfbfd12e43(function_fd9e4cb348a5f283(self.origin, maxdist, team), npcid, var_f35feae42b2b331, var_877945e6d268ba99);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x754d
// Size: 0x9c
function function_8db2aa6f0377958(team, var_f35feae42b2b331, var_877945e6d268ba99, maxdist, var_4acfa36a6dd8b797) {
    if (!isdefined(self.enemy) || !isdefined(self.enemy.team)) {
        return;
    }
    team = function_53c4c53197386572(team, self.enemy.team);
    maxdist = function_53c4c53197386572(maxdist, level.var_798aa343368f724e);
    return function_b1ab02cfbfd12e43(function_fd9e4cb348a5f283(self.origin, maxdist, team), undefined, var_f35feae42b2b331, var_877945e6d268ba99, var_4acfa36a6dd8b797);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75f1
// Size: 0x14d
function function_248a7374a1a0605a(origin, var_76ad5066f013d2c9, var_639eaecd84bddc70, var_f35feae42b2b331, var_877945e6d268ba99) {
    var_8c93298e4787c0f5 = undefined;
    var_a1533963d72d6c08 = undefined;
    var_9b7f602c247c3953 = undefined;
    if (istrue(var_877945e6d268ba99)) {
        var_9b7f602c247c3953 = self;
    }
    foreach (guy in var_76ad5066f013d2c9) {
        if (issentient(self) && guy == self) {
            continue;
        }
        if (guy function_754c9897f3b89964() || !guy function_d8462b621401984a(var_f35feae42b2b331, var_9b7f602c247c3953) || is_equal(guy.battlechatter.npcid, var_639eaecd84bddc70)) {
            continue;
        }
        if (isdefined(guy.battlechatter) && istrue(guy.battlechatter.var_732df8db084ab0c5)) {
            continue;
        }
        distsq = distance2dsquared(guy.origin, origin);
        if (!isdefined(var_8c93298e4787c0f5) || distsq < var_8c93298e4787c0f5) {
            var_8c93298e4787c0f5 = distsq;
            var_a1533963d72d6c08 = guy;
        }
    }
    return var_a1533963d72d6c08;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7746
// Size: 0x171
function function_b1ab02cfbfd12e43(var_76ad5066f013d2c9, var_639eaecd84bddc70, var_f35feae42b2b331, var_877945e6d268ba99, var_4acfa36a6dd8b797) {
    var_11345957ee7529a7 = undefined;
    var_9b7f602c247c3953 = undefined;
    if (istrue(var_877945e6d268ba99)) {
        var_9b7f602c247c3953 = self;
    }
    var_5d59a11b781ae7d1 = isdefined(self) && issentient(self);
    foreach (guy in var_76ad5066f013d2c9) {
        if (var_5d59a11b781ae7d1 && guy == self) {
            continue;
        }
        if (1 && isdefined(guy._blackboard) && isdefined(guy._blackboard.currentvehicle)) {
            continue;
        }
        if (guy function_754c9897f3b89964() || !guy function_d8462b621401984a(var_f35feae42b2b331, var_9b7f602c247c3953, undefined, var_4acfa36a6dd8b797)) {
            continue;
        }
        if (isdefined(guy.battlechatter) && is_equal(guy.battlechatter.npcid, var_639eaecd84bddc70)) {
            continue;
        }
        if (!isdefined(guy.var_e5cf232129f9ec01)) {
            return guy;
        }
        if (!isdefined(var_11345957ee7529a7) || guy.var_e5cf232129f9ec01 < var_11345957ee7529a7.var_e5cf232129f9ec01) {
            var_11345957ee7529a7 = guy;
        }
    }
    return var_11345957ee7529a7;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x78bf
// Size: 0x85
function getspeakers(team) {
    team = function_53c4c53197386572(team, self.team);
    var_76ad5066f013d2c9 = [];
    foreach (guy in getaiarray(team)) {
        if (guy function_d8462b621401984a()) {
            var_76ad5066f013d2c9[var_76ad5066f013d2c9.size] = guy;
        }
    }
    return var_76ad5066f013d2c9;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x794c
// Size: 0x7d
function function_2aa175082bdb56f5(origin, radius) {
    /#
        assert(isdefined(origin) && isdefined(radius));
    #/
    if (utility::issp() && distancesquared(origin, level.player.origin) < squared(radius)) {
        return [0:level.player];
    }
    if (isdefined(level.var_c3d9ceba74248998)) {
        return [[ level.var_c3d9ceba74248998 ]](origin, radius);
    }
    return [];
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79d1
// Size: 0x4d
function function_fd9e4cb348a5f283(origin, radius, team) {
    if (isdefined(level.var_1da0697a602f5a04)) {
        return [[ level.var_1da0697a602f5a04 ]](origin, radius, team);
    }
    if (isdefined(team)) {
        return getaiarrayinradius(origin, radius, team);
    }
    return getaiarrayinradius(origin, radius);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a26
// Size: 0xf9
function function_e457176b043f3f8b(radius) {
    if (!isdefined(self.enemy) || !isdefined(self.enemy.origin) || !isdefined(self.enemy.team)) {
        return [];
    }
    radius = function_53c4c53197386572(radius, level.var_587de0e7b537210a);
    enemies = function_fd9e4cb348a5f283(self.enemy.origin, radius, self.enemy.team);
    if (isdefined(self.team) && self.team != "allies" && self.team != "neutral") {
        players = function_2aa175082bdb56f5(self.enemy.origin, radius);
        enemies = array_combine(enemies, players);
    }
    return enemies;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b27
// Size: 0xdc
function function_74b5af7f20c85724(origin, radius, var_2b4384d19a199121) {
    var_37d7886608227391 = [];
    if (isdefined(var_2b4384d19a199121) && isdefined(origin)) {
        radius = function_53c4c53197386572(radius, level.var_587de0e7b537210a);
        var_8c63e160ff1b629d = function_fd9e4cb348a5f283(origin, radius);
        if (isdefined(var_8c63e160ff1b629d)) {
            foreach (ai in var_8c63e160ff1b629d) {
                if (!isdefined(ai)) {
                    continue;
                }
                if (isdefined(ai.team) && ai.team == var_2b4384d19a199121) {
                    continue;
                }
                var_37d7886608227391 = array_add(var_37d7886608227391, ai);
            }
        }
    }
    return var_37d7886608227391;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c0b
// Size: 0x34
function isnear(target, radius) {
    return distancesquared(target.origin, self.origin) < squared(radius);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7c47
// Size: 0x2e
function function_cd250b4591e6bc01(var_595b006b359c3dde, var_3ab040f5cfcefbbb) {
    if (isdefined(self.voice) && self function_fcbf0a7dbc0c6acb()) {
        return var_3ab040f5cfcefbbb;
    }
    return var_595b006b359c3dde;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c7d
// Size: 0x7f
function function_1609ef297b7a32cf(enemy, var_646a5cd9726e8b01, var_8b254bbef9b6b110, enemies) {
    if (isdefined(self.battlechatter) && is_equal(enemy, self.battlechatter.target)) {
        return var_646a5cd9726e8b01;
    }
    if (!ismp() && !isdefined(enemies)) {
        enemies = function_e457176b043f3f8b();
    }
    if (!ismp() && enemies.size > 1) {
        return var_8b254bbef9b6b110;
    }
    return var_646a5cd9726e8b01;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d04
// Size: 0x4d
function set_target(target) {
    guy = self;
    if (istrue(self.var_79498adf23c51e6a)) {
        guy = self.speaker;
    }
    target = function_53c4c53197386572(target, guy.enemy);
    guy function_11bcc851afaf707(target);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d58
// Size: 0xb
function clear_target() {
    function_11bcc851afaf707(undefined);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d6a
// Size: 0xd7
function function_11bcc851afaf707(target) {
    if (isdefined(self.origin) && isdefined(self.team)) {
        foreach (ally in function_fd9e4cb348a5f283(self.origin, level.var_587de0e7b537210a, self.team)) {
            if (isdefined(ally.battlechatter)) {
                ally.battlechatter.target = target;
            }
        }
    } else if (isdefined(self.battlechatter)) {
        self.battlechatter.target = target;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e48
// Size: 0x14
function function_d6731c6d074dc7d0(params) {
    thread function_87ee4a2ecd6546fc();
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e63
// Size: 0x22a
function function_87ee4a2ecd6546fc() {
    if (!isdefined(level.battlechatter) || !isdefined(self)) {
        return;
    }
    if (!isdefined(self.battlechatter) || !isdefined(self.battlechatter.countryid)) {
        return;
    }
    if (!isdefined(level.var_276311a22caaf5ac)) {
        return;
    }
    corpse = undefined;
    var_3079d1d15a63cc85 = 10;
    var_30d6320d769d3f2c = 1.5;
    countryid = self.battlechatter.countryid;
    name = self.battlechatter.name;
    voice = self.voice;
    team = self.team;
    count = 0;
    while (count < var_3079d1d15a63cc85 && !isdefined(corpse)) {
        array = [[ level.var_276311a22caaf5ac ]](self.origin, level.var_798aa343368f724e);
        foreach (var_969f28bbb67e845e in array) {
            if (var_969f28bbb67e845e.birthtime == gettime() && distancesquared(var_969f28bbb67e845e.origin, self.origin) <= var_30d6320d769d3f2c) {
                corpse = var_969f28bbb67e845e;
                break;
            }
        }
        count++;
        waitframe();
    }
    if (!isdefined(corpse)) {
        return;
    }
    corpse.battlechatter = spawnstruct();
    corpse.battlechatter.countryid = countryid;
    corpse.battlechatter.name = name;
    corpse.voice = voice;
    corpse.battlechatterallowed = 1;
    corpse.team = team;
    if (isdefined(level.stealth)) {
        corpse thread function_bd0f092dbcdea227();
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8094
// Size: 0x15
function function_2e5e8e46d56ce70d(array) {
    return array[randomint(array.size)];
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x80b1
// Size: 0x96
function function_995427fd22bd4928(base, count) {
    if (!isdefined(level.battlechatter.var_ae16228b86a3f433[base])) {
        array = [];
        for (i = 0; i < count; i++) {
            array[i] = base + i;
        }
        level.battlechatter.var_ae16228b86a3f433[base] = create_deck(array, 1, 1, 1);
    }
    return level.battlechatter.var_ae16228b86a3f433[base] deck_draw();
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x814f
// Size: 0x99
function function_d04239c1e5b61876() {
    if (!isdefined(self.airank)) {
        return undefined;
    }
    switch (self.airank) {
    case #"hash_f26abb676d8bacec":
        return 0;
    case #"hash_66b7b438a1ca57c2":
        return 1;
    case #"hash_7f4da8c6011cd2d4":
        return 2;
    case #"hash_1453ef0182122bcb":
        return 3;
    case #"hash_9400db43df3e85c2":
        return 4;
    case #"hash_bcc86315db6ecf35":
        return 5;
    case #"hash_f1891197c342b74b":
        return 6;
    default:
        return undefined;
        break;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81ef
// Size: 0xe9
function function_b6b75579e4dbc957() {
    if (!isdefined(level.battlechatter.var_38d1de6d4017e745)) {
        var_38d1de6d4017e745 = [];
        foreach (ai in getaiarray()) {
            if (isdefined(ai.callsign)) {
                var_38d1de6d4017e745[var_38d1de6d4017e745.size] = ai.callsign;
            }
        }
        if (var_38d1de6d4017e745.size > 0) {
            level.battlechatter.var_38d1de6d4017e745 = create_deck(var_38d1de6d4017e745);
        }
    }
    if (isdefined(level.battlechatter.var_38d1de6d4017e745)) {
        self.callsign = level.battlechatter.var_38d1de6d4017e745 deck_draw();
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82df
// Size: 0x94
function addeventplaybcs(type, name, modifier, delay, var_623f50ce1f43fdb8, force) {
    self endon("death");
    self endon("removed from battleChatter");
    self endon("cancel speaking");
    self endon("stop event play bcs");
    if (!isdefined(modifier)) {
        return;
    }
    if (isdefined(delay)) {
        wait(delay);
    }
    if (name == "state_change") {
        executed = function_c0da17570a24346c(modifier);
    } else {
        executed = function_c0da17570a24346c("announce", [0:modifier, 1:var_623f50ce1f43fdb8]);
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x837a
// Size: 0x4a
function function_2a14e530337dedc3() {
    radio = self.speaker function_52846cd9b5efeafe();
    radio.battlechatter.npcid = "l1r";
    radio.name = "Team Leader (Radio)";
    return radio;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83cc
// Size: 0x314
function function_573b9ff9ed152518(guy, isleader) {
    if (!isdefined(guy)) {
        guy = self.speaker;
    }
    if (!isdefined(guy.voice) || !isdefined(guy.battlechatter)) {
        return;
    }
    radio = spawnstruct();
    radio.var_868e98cf48b92cfb = guy;
    radio.origin = guy.origin;
    radio.var_ed56b39b72558e56 = 1;
    radio.battlechatterallowed = 1;
    radio.team = function_53c4c53197386572(self.team, "allies");
    radio.battlechatter = spawnstruct();
    if (!isdefined(guy.battlechatter.countryid)) {
        guy.battlechatter.countryid = "AQS";
    }
    if (istrue(isleader)) {
        radio.battlechatter.isleader = 1;
        radio.battlechatter.var_37962ca7989c729a = guy.battlechatter.countryid + "_L";
        radio.battlechatter.name = "actual";
        switch (guy.battlechatter.countryid) {
        case #"hash_782a246ccf672edf":
            var_c9a4d98959c0d476 = [0:"pmcl"];
            break;
        case #"hash_8a9636c94e6076d":
            var_c9a4d98959c0d476 = [0:"crtl"];
            break;
        case #"hash_fab89df6bdd4bc00":
            var_c9a4d98959c0d476 = [0:"rusl"];
            break;
        case #"hash_4438aa6cb42c06a3":
            var_c9a4d98959c0d476 = [0:"konl"];
            break;
        case #"hash_8d55d6c9508903d":
            var_c9a4d98959c0d476 = [0:"kgfl"];
        case #"hash_f8933b6c8c234a3c":
        default:
            var_c9a4d98959c0d476 = [0:"aqld"];
            break;
        }
    } else {
        var_c9a4d98959c0d476 = [];
        foreach (var_cf9dfca32af33b39 in anim.usedids[guy.voice]) {
            if (!is_equal(var_cf9dfca32af33b39.npcid, guy.battlechatter.npcid)) {
                var_c9a4d98959c0d476[var_c9a4d98959c0d476.size] = var_cf9dfca32af33b39.npcid;
            }
        }
    }
    radio.battlechatter.countryid = guy.battlechatter.countryid;
    radio.battlechatter.npcid = random(var_c9a4d98959c0d476);
    return radio;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86e8
// Size: 0x15
function function_592f13f1a0e078ff(guy) {
    return function_573b9ff9ed152518(guy, 1);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8705
// Size: 0x106
function getname() {
    if (!isdefined(self.battlechatter) || !isdefined(self.battlechatter.countryid)) {
        return;
    }
    if (!isdefined(self.battlechatter.name)) {
        if (!isdefined(level.battlechatter.names[self.battlechatter.countryid])) {
            function_793f0c4da1ff138f(self.battlechatter.countryid);
            if (!isdefined(level.battlechatter.names[self.battlechatter.countryid])) {
                return;
            }
        }
        self.battlechatter.name = level.battlechatter.names[self.battlechatter.countryid] deck_draw();
    }
    return self.battlechatter.name;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8813
// Size: 0x48
function function_47c84e03dcbc5aa7(origin) {
    if (!isdefined(level.players)) {
        return level.player;
    } else if (level.players.size == 0) {
        return undefined;
    }
    return sortbydistance(level.players, origin)[0];
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8863
// Size: 0xa6
function function_b98b7a9053d0bcb6(origin) {
    if (!isdefined(origin)) {
        origin = self.origin;
    }
    var_6706c5ed8796ca5 = getentarray("bcs_region", "script_noteworthy");
    foreach (trig in var_6706c5ed8796ca5) {
        if (ispointinvolume(origin, trig) && isdefined(trig.targetname)) {
            return trig.targetname;
        }
    }
    return "none";
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8911
// Size: 0x126
function function_16dce705f14f4b84() {
    if (is_dead_or_dying(self)) {
        return "dead";
    }
    if (isdefined(self.battlechatter.var_b7f16ac1d260657a)) {
        result = self.battlechatter.var_b7f16ac1d260657a;
        if (isfunction(result)) {
            result = self [[ result ]]();
        }
        if (isdefined(result)) {
            return result;
        }
    }
    if (!isdefined(level.stealth)) {
        return ter_op(isai(self) && self iscurrentenemyvalid(), "combat", "idle");
    }
    if (isdefined(self.fnisinstealthidle) && [[ self.fnisinstealthidle ]]()) {
        return "idle";
    } else if (isdefined(self.fnisinstealthinvestigate) && [[ self.fnisinstealthinvestigate ]]()) {
        return "investigate";
    } else if (isdefined(self.fnisinstealthhunt) && [[ self.fnisinstealthhunt ]]()) {
        return "hunt";
    } else if (isdefined(self.fnisinstealthcombat) && [[ self.fnisinstealthcombat ]]()) {
        return "combat";
    } else {
        return "unset";
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8a3e
// Size: 0x1c
function addcustombc(array, states, random) {
    
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8a61
// Size: 0x1c
function setcurrentcustombcevent(event, states, looping) {
    
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8a84
// Size: 0x58
function function_5eef3c6f7b003167(state) {
    if (!isdefined(level.battlechatter.var_6d0a11e2e9933ff1) || !isdefined(level.battlechatter.var_6d0a11e2e9933ff1[state])) {
        return 0;
    }
    return level.battlechatter.var_6d0a11e2e9933ff1[state].size > 0;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8ae4
// Size: 0xa6
function function_37569a0bddd31694(state) {
    /#
        assertex(isdefined(level.battlechatter.var_6d0a11e2e9933ff1), " level.battlechatter.customStealth not defined. Set some custom BC first!");
    #/
    index = level.battlechatter.var_6fe645021a23c52f[state];
    sequence = level.battlechatter.var_6d0a11e2e9933ff1[state][index];
    index++;
    if (index >= level.battlechatter.var_6d0a11e2e9933ff1[state].size) {
        level.battlechatter.var_6d0a11e2e9933ff1[state] = [];
    }
    return sequence;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8b92
// Size: 0x155
function function_ac31838f9edde417(array, states, random) {
    if (!isdefined(level.battlechatter.var_6d0a11e2e9933ff1)) {
        level.battlechatter.var_6d0a11e2e9933ff1 = [];
    }
    if (!isarray(states)) {
        states = [0:states];
    }
    foreach (state in states) {
        if (!isdefined(level.battlechatter.var_6d0a11e2e9933ff1[state])) {
            level.battlechatter.var_6d0a11e2e9933ff1[state] = [];
        }
        foreach (sequence in array) {
            size = level.battlechatter.var_6d0a11e2e9933ff1[state].size;
            level.battlechatter.var_6d0a11e2e9933ff1[state][size] = sequence;
        }
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8cee
// Size: 0x59
function getrelativeangles(ent) {
    /#
        assert(isdefined(ent));
    #/
    angles = ent.angles;
    if (!isplayer(ent)) {
        if (isdefined(self.node)) {
            angles = self.node.angles;
        }
    }
    return angles;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d4f
// Size: 0x1e
function sideisleftright(side) {
    return side == "left" || side == "right";
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8d75
// Size: 0xb5
function getdirectionfacingflank(vorigin, vpoint, var_b157227579e704ef) {
    var_7004ba7d94d78df6 = vectortoangles(var_b157227579e704ef);
    var_87617967d6bb7d22 = vectortoangles(vpoint - vorigin);
    angle = var_7004ba7d94d78df6[1] - var_87617967d6bb7d22[1];
    angle = angle + 360;
    angle = int(angle) % 360;
    if (angle > 315 || angle < 45) {
        direction = "front";
    } else if (angle < 135) {
        direction = "right";
    } else if (angle < 225) {
        direction = "rear";
    } else {
        direction = "left";
    }
    return direction;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e32
// Size: 0x11b
function normalizecompassdirection(direction) {
    /#
        assert(isdefined(direction));
    #/
    new = undefined;
    switch (direction) {
    case #"hash_b9ff0a9f617355e4":
        new = "n";
        break;
    case #"hash_b66b59dcd06dfad3":
        new = "nw";
        break;
    case #"hash_a1e9b77432f55b0e":
        new = "w";
        break;
    case #"hash_abed5ad834825ff1":
        new = "sw";
        break;
    case #"hash_fbd39e4f5634905a":
        new = "s";
        break;
    case #"hash_8856b747c93e7793":
        new = "se";
        break;
    case #"hash_22ce3b03c1e51a9c":
        new = "e";
        break;
    case #"hash_493bfd7122639b31":
        new = "ne";
        break;
    case #"hash_c1ae739be788bf38":
        new = "impossible";
        break;
    default:
        /#
            assertmsg("Can't normalize compass direction " + direction);
        #/
        return;
    }
    /#
        assert(isdefined(new));
    #/
    return new;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8f55
// Size: 0x126
function getdirectioncompass(vorigin, vpoint) {
    angles = vectortoangles(vpoint - vorigin);
    angle = angles[1];
    northyaw = getnorthyaw();
    angle = angle - northyaw;
    if (angle < 0) {
        angle = angle + 360;
    } else if (angle > 360) {
        angle = angle - 360;
    }
    if (angle < 22.5 || angle > 337.5) {
        direction = "north";
    } else if (angle < 67.5) {
        direction = "northwest";
    } else if (angle < 112.5) {
        direction = "west";
    } else if (angle < 157.5) {
        direction = "southwest";
    } else if (angle < 202.5) {
        direction = "south";
    } else if (angle < 247.5) {
        direction = "southeast";
    } else if (angle < 292.5) {
        direction = "east";
    } else if (angle < 337.5) {
        direction = "northeast";
    } else {
        direction = "impossible";
    }
    return direction;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9083
// Size: 0x39
function getdistancemeters(source, target) {
    var_e48200809888835a = distance2d(source, target);
    var_344457e8c065948c = 0.0254 * var_e48200809888835a;
    return var_344457e8c065948c;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x90c4
// Size: 0xe7
function getdistancemetersnormalized(source, target) {
    var_344457e8c065948c = getdistancemeters(source, target);
    if (var_344457e8c065948c < 15) {
        return "10";
    } else if (var_344457e8c065948c < 25) {
        return "20";
    } else if (var_344457e8c065948c < 35) {
        return "30";
    } else if (var_344457e8c065948c < 45) {
        return "40";
    } else if (var_344457e8c065948c < 55) {
        return "50";
    } else if (var_344457e8c065948c < 65) {
        return "60";
    } else if (var_344457e8c065948c < 75) {
        return "70";
    } else if (var_344457e8c065948c < 85) {
        return "80";
    } else if (var_344457e8c065948c < 95) {
        return "90";
    } else if (var_344457e8c065948c < 125) {
        return "100";
    } else {
        return undefined;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91b2
// Size: 0x39
function getdistancemiles(source, target) {
    var_e48200809888835a = distance2d(source, target);
    var_59901e5f803747f0 = 1.57828e-05 * var_e48200809888835a;
    return var_59901e5f803747f0;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x91f3
// Size: 0x79
function getdistancemilesnormalized(source, target) {
    var_59901e5f803747f0 = getdistancemiles(source, target);
    if (var_59901e5f803747f0 < 5) {
        return "4";
    } else if (var_59901e5f803747f0 < 6) {
        return "5";
    } else if (var_59901e5f803747f0 < 7) {
        return "6";
    } else if (var_59901e5f803747f0 < 15) {
        return "10";
    } else {
        return "15";
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9273
// Size: 0x73
function getfrontarcclockdirection(direction) {
    /#
        assertex(isdefined(direction));
    #/
    var_83840ec99c2d6f0d = "undefined";
    if (direction == "10" || direction == "11") {
        var_83840ec99c2d6f0d = "10";
    } else if (direction == "12") {
        var_83840ec99c2d6f0d = direction;
    } else if (direction == "1" || direction == "2") {
        var_83840ec99c2d6f0d = "2";
    }
    return var_83840ec99c2d6f0d;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x92ee
// Size: 0x163
function getdirectionfacingclock(var_c99a285cabf7ec7b, var_88daf353e30acf25, targetorigin) {
    forward = anglestoforward(var_c99a285cabf7ec7b);
    var_b157227579e704ef = vectornormalize(forward);
    var_7004ba7d94d78df6 = vectortoangles(var_b157227579e704ef);
    var_87617967d6bb7d22 = vectortoangles(targetorigin - var_88daf353e30acf25);
    angle = var_7004ba7d94d78df6[1] - var_87617967d6bb7d22[1];
    angle = angle + 360;
    angle = int(angle) % 360;
    if (angle > 345 || angle < 15) {
        direction = "12";
    } else if (angle < 45) {
        direction = "1";
    } else if (angle < 75) {
        direction = "2";
    } else if (angle < 105) {
        direction = "3";
    } else if (angle < 135) {
        direction = "4";
    } else if (angle < 165) {
        direction = "5";
    } else if (angle < 195) {
        direction = "6";
    } else if (angle < 225) {
        direction = "7";
    } else if (angle < 255) {
        direction = "8";
    } else if (angle < 285) {
        direction = "9";
    } else if (angle < 315) {
        direction = "10";
    } else {
        direction = "11";
    }
    return direction;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9459
// Size: 0x9f
function getdegreeselevation(var_88daf353e30acf25, targetorigin) {
    var_ce364178f58a5fdd = targetorigin[2] - var_88daf353e30acf25[2];
    dist = distance2d(var_88daf353e30acf25, targetorigin);
    angle = atan(var_ce364178f58a5fdd / dist);
    if (angle < 15 || angle > 65) {
        return angle;
    } else if (angle < 25) {
        return 20;
    } else if (angle < 35) {
        return 30;
    } else if (angle < 45) {
        return 40;
    } else if (angle < 55) {
        return 50;
    } else if (angle < 65) {
        return 60;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x94ff
// Size: 0x1a
function getvectorrightangle(vdir) {
    return (vdir[1], 0 - vdir[0], vdir[2]);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9521
// Size: 0x59
function getvectorarrayaverage(var_52bc30ad1e795fd6) {
    var_3ba2a35d76e9b9e0 = (0, 0, 0);
    for (i = 0; i < var_52bc30ad1e795fd6.size; i++) {
        var_3ba2a35d76e9b9e0 = var_3ba2a35d76e9b9e0 + var_52bc30ad1e795fd6[i];
    }
    return (var_3ba2a35d76e9b9e0[0] / var_52bc30ad1e795fd6.size, var_3ba2a35d76e9b9e0[1] / var_52bc30ad1e795fd6.size, var_3ba2a35d76e9b9e0[2] / var_52bc30ad1e795fd6.size);
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9582
// Size: 0x26
function function_a07abd440b7a33fe(otherent) {
    if (!isdefined(otherent)) {
        return 0;
    }
    if (!istrue(otherent.disguised)) {
        return 0;
    }
    return 1;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x95b0
// Size: 0xc
function function_f0538ea9a819b123(segment) {
    
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x95c3
// Size: 0x28
function set_battlechatter_variable(team, val) {
    level.battlechatter[team] = val;
    update_battlechatter_hud();
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95f2
// Size: 0x1d0
function update_battlechatter_hud() {
    /#
        if (getdvar(@"hash_cd133f0daaf9b3e4", 0) == "<unknown string>") {
            return;
        }
        if (getdvar(@"hash_2f6380dc3031a0fc") != "executions") {
            return;
        }
        if (!isdefined(level.var_ce8915211d5a4041)) {
            x = -50;
            y = 460;
            x_offset = 22;
            hud = newhudelem();
            hud.x = x;
            hud.y = y;
            hud.color = (0.4, 0.55, 0.9);
            level.var_ce8915211d5a4041 = hud;
        }
        if (getdvar(@"hash_1494fa4395c31a69") != "<unknown string>") {
            level.var_ce8915211d5a4041 settext("executions");
            return;
        }
        msg = "<unknown string>";
        count = 0;
        if (isdefined(level.battlechatter)) {
            teams = [];
            teams["<unknown string>"] = level.battlechatter["<unknown string>"];
            teams["<unknown string>"] = level.battlechatter["<unknown string>"];
            foreach (team, val in teams) {
                if (val) {
                    msg = msg + team + "sp";
                    count++;
                }
            }
        } else {
            msg = msg + "<unknown string>";
            count++;
        }
        if (count == 0) {
            msg = msg + "<unknown string>";
        }
        level.var_ce8915211d5a4041 settext(msg);
    #/
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x97c9
// Size: 0x151
function bcprint_info() {
    self endon("death");
    /#
        id = self.battlechatter.npcid;
        if (!isdefined(id)) {
            id = "executions";
        }
        countryid = self.battlechatter.countryid;
        if (!isdefined(countryid)) {
            countryid = "executions";
        }
        while (1) {
            if (battlechatter_canprint()) {
                if (!isdefined(self.battlechatterallowed) || istrue(self.battlechatter_removed)) {
                    print3d(self.origin + (0, 0, 24), "<unknown string>", (1, 0, 1), 1, 0.35, 1);
                } else if (self.battlechatterallowed) {
                    print3d(self.origin + (0, 0, 24), "<unknown string>" + countryid + id, (0, 1, 0), 1, 0.35, 1);
                } else {
                    print3d(self.origin + (0, 0, 24), "<unknown string>" + countryid + id, (1, 0, 0), 1, 0.35, 1);
                }
            }
            waitframe();
        }
    #/
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9921
// Size: 0x3d
function battlechatter_canprint() {
    /#
        if (getdvar(@"hash_611f04c407c3f644") == self.team || getdvar(@"hash_611f04c407c3f644") == "<unknown string>") {
            return 1;
        }
    #/
    return 0;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9966
// Size: 0x3d
function battlechatter_canprintdump() {
    /#
        if (getdvar(@"hash_9627c73338f91622") == self.team || getdvar(@"hash_9627c73338f91622") == "<unknown string>") {
            return 1;
        }
    #/
    return 0;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x99ab
// Size: 0xb1
function battlechatter_print(alias, color) {
    /#
        if (!battlechatter_canprint()) {
            return;
        }
        if (!isdefined(color)) {
            color = "<unknown string>";
        }
        var_3684c173eee24513 = "<unknown string>";
        switch (color) {
        case #"hash_97430f6c58e61cbc":
            var_3684c173eee24513 = "<unknown string>";
            break;
        case #"hash_2ac407c1cd5943a9":
            var_3684c173eee24513 = "<unknown string>";
            break;
        case #"hash_6686d129776d649a":
            var_3684c173eee24513 = "<unknown string>";
            break;
        }
        println(var_3684c173eee24513 + self.origin + "<unknown string>" + self.name + "<unknown string>" + alias);
    #/
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9a63
// Size: 0x1d6
function battlechatter_printdump(alias) {
    /#
        if (!battlechatter_canprintdump()) {
            return;
        }
        var_487c6f7b26da9c53 = getdvar(@"hash_3cb0b3f110a54cf2", "<unknown string>");
        if (var_487c6f7b26da9c53 != "<unknown string>" && var_487c6f7b26da9c53 != "<unknown string>") {
            return;
        }
        var_47f4bea7f4c50ad9 = -1;
        if (isdefined(level.var_529a83d403b4416)) {
            var_47f4bea7f4c50ad9 = (gettime() - level.var_529a83d403b4416) / 1000;
        }
        level.var_529a83d403b4416 = gettime();
        if (var_487c6f7b26da9c53 == "<unknown string>") {
            if (!flag_exist("<unknown string>")) {
                flag_init("<unknown string>");
            }
            if (!isdefined(level.var_b363a2868472ded1)) {
                var_89bb38b8c97a2660 = "<unknown string>" + level.script + "<unknown string>";
                level.var_b363a2868472ded1 = openfile(var_89bb38b8c97a2660, "<unknown string>");
            }
            var_803610ff4054c7eb = getaliastypefromsoundalias(alias);
            var_931fd726c971384e = level.script + "<unknown string>" + self.operatorcustomization.voice + "<unknown string>" + var_803610ff4054c7eb;
            battlechatter_printdumpline(level.var_b363a2868472ded1, var_931fd726c971384e, "<unknown string>");
        } else if (var_487c6f7b26da9c53 == "<unknown string>") {
            if (!flag_exist("<unknown string>")) {
                flag_init("<unknown string>");
            }
            if (!isdefined(level.var_97ef0a827c8a39d1)) {
                var_89bb38b8c97a2660 = "<unknown string>" + level.script + "<unknown string>";
                level.var_97ef0a827c8a39d1 = openfile(var_89bb38b8c97a2660, "<unknown string>");
            }
            var_931fd726c971384e = "<unknown string>" + var_47f4bea7f4c50ad9 + "<unknown string>";
            var_931fd726c971384e = var_931fd726c971384e + alias;
            battlechatter_printdumpline(level.var_97ef0a827c8a39d1, var_931fd726c971384e, "<unknown string>");
        }
    #/
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9c40
// Size: 0x29
function battlechatter_debugprint(alias, color) {
    /#
        battlechatter_print(alias, color);
        thread battlechatter_printdump(alias);
    #/
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9c70
// Size: 0x49
function battlechatter_printdumpline(file, str, var_ed4fb4807f13f624) {
    /#
        if (flag(var_ed4fb4807f13f624)) {
            flag_wait(var_ed4fb4807f13f624);
        }
        flag_set(var_ed4fb4807f13f624);
        fprintln(file, str);
        flag_clear(var_ed4fb4807f13f624);
    #/
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9cc0
// Size: 0xc7
function getaliastypefromsoundalias(alias) {
    if (getsubstr(alias, 0, 6) == "dx_vom") {
        var_803610ff4054c7eb = getsubstr(alias, 7, alias.size);
    } else {
        if (self == anim.player) {
            prefix = self.battlechatter.countryid + "_";
        } else if (getsubstr(alias, 0, 6) == "dx_sbc") {
            prefix = bc_prefix("stealth");
        } else {
            prefix = bc_prefix();
        }
        /#
            assertex(issubstr(alias, prefix), "didn't find expected prefix info in alias '" + alias + "' with substr test of '" + prefix + "'.");
        #/
        var_803610ff4054c7eb = getsubstr(alias, prefix.size, alias.size);
    }
    return var_803610ff4054c7eb;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9d8f
// Size: 0x38
function function_2b9bf190120a5233(seconds) {
    if (isdefined(self.battlechatter)) {
        self.battlechatter.var_3c94d4874d436201 = gettime() + seconds * 1000;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9dce
// Size: 0xbe
function function_8f59caa9212fcc56() {
    if (!function_d8462b621401984a("combat")) {
        return 1;
    }
    if (utility::issp() && !isalive(level.player)) {
        return 1;
    }
    if (!function_45f570789ff9a0fd(3)) {
        if (isdefined(self.battlechatter.var_20e68057b05a543) || !isdefined(self._blackboard)) {
            return 1;
        }
        if (!function_9f810aae92ac7bf1(3)) {
            self.battlechatter.var_20e68057b05a543 = gettime();
        }
        return 1;
    }
    if (!isdefined(self.battlechatter.var_3c94d4874d436201)) {
        return 0;
    }
    return self.battlechatter.var_3c94d4874d436201 > gettime();
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e94
// Size: 0xc7
function function_45f570789ff9a0fd(var_735a70be53a0e4b5, var_877945e6d268ba99) {
    var_877945e6d268ba99 = function_53c4c53197386572(var_877945e6d268ba99, 0);
    if (istrue(self.pacifist) || istrue(self.ignoreall) || istrue(self.dontevershoot)) {
        return 0;
    }
    if (!isdefined(self.enemy) || is_dead_or_dying(self.enemy)) {
        return 0;
    }
    if (!ismp() && var_877945e6d268ba99 && !self seerecently(self.enemy, var_735a70be53a0e4b5)) {
        return 0;
    }
    if (isdefined(self.var_a709fbd9fea148f6) && namespace_bf5a1761a8d1bb07::asm_currentstatehasflag(self.var_a709fbd9fea148f6, "aim")) {
        return 1;
    }
    if (function_9f810aae92ac7bf1(var_735a70be53a0e4b5)) {
        return 1;
    }
    return 0;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f63
// Size: 0x2b
function function_9f810aae92ac7bf1(var_735a70be53a0e4b5) {
    return self._blackboard.var_60dcaa3d3be97ab > gettime() - var_735a70be53a0e4b5 * 1000;
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f96
// Size: 0x74
function function_ab7df904aa60d433(array, var_20f2244c14cd5d6c) {
    var_20f2244c14cd5d6c = function_53c4c53197386572(var_20f2244c14cd5d6c, array.size - 1);
    foreach (key, item in array) {
        if (array.size <= var_20f2244c14cd5d6c) {
            return array;
        }
        array[key] = undefined;
    }
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa011
// Size: 0x2f
function function_ecf957dba5b9cc50() {
    /#
        level endon("<unknown string>");
        level notify("<unknown string>");
        level endon("<unknown string>");
        while (1) {
            waittillframeend();
            function_c3b1c38b7230b341(1);
            waitframe();
        }
    #/
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa047
// Size: 0x14c
function function_c3b1c38b7230b341(var_9712576966b33c8b) {
    /#
        if (!getdvarint(@"hash_4b7858e66804e305")) {
            return;
        }
        offsety = 20;
        var_96e397feed35233a = 50;
        var_96e398feed35256d = 500;
        var_e680527dcb69df5a = (0, 1, 0);
        var_66a5c605656bbab3 = 1;
        var_2a70afa93ebb723b = "<unknown string>";
        printtoscreen2d(var_96e397feed35233a, var_96e398feed35256d, var_2a70afa93ebb723b, var_e680527dcb69df5a, var_66a5c605656bbab3, var_9712576966b33c8b);
        var_96e398feed35256d = var_96e398feed35256d + offsety;
        if (!isdefined(level.var_426f5978d3aea5c2) || function_45fad871d0bee0f2(level.var_426f5978d3aea5c2)) {
            return;
        }
        index = level.var_426f5978d3aea5c2.rear;
        while (index != level.var_426f5978d3aea5c2.front) {
            debug_string = level.var_426f5978d3aea5c2.array[index];
            if (!isdefined(debug_string)) {
                continue;
            }
            printtoscreen2d(var_96e397feed35233a, var_96e398feed35256d, debug_string, var_e680527dcb69df5a, var_66a5c605656bbab3, var_9712576966b33c8b);
            var_96e398feed35256d = var_96e398feed35256d + offsety;
            index--;
            if (index < 0) {
                index = index + level.var_426f5978d3aea5c2.capacity;
            }
        }
    #/
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa19a
// Size: 0x121
function function_fdb8454d071bcf5b(data, executed) {
    /#
        if (!isdefined(data) || !isdefined(data.category)) {
            return;
        }
        if (!isdefined(level.var_426f5978d3aea5c2)) {
            level.var_426f5978d3aea5c2 = function_79c374ab1ca30cc9(20);
            level thread function_ecf957dba5b9cc50();
        }
        debug_string = "<unknown string>" + data.category;
        if (isdefined(data.subcategory)) {
            debug_string = debug_string + "<unknown string>" + data.subcategory;
        }
        debug_string = debug_string + "<unknown string>";
        debug_string = debug_string + "<unknown string>" + istrue(executed) + "<unknown string>";
        debug_string = debug_string + "<unknown string>" + gettime() + "<unknown string>";
        if (level.var_426f5978d3aea5c2.array.size == level.var_426f5978d3aea5c2.capacity) {
            level.var_426f5978d3aea5c2 = function_93def91a50927481(level.var_426f5978d3aea5c2);
        }
        level.var_426f5978d3aea5c2 = function_6cf786a6cf335cb9(level.var_426f5978d3aea5c2, debug_string);
    #/
}

// Namespace battlechatter/namespace_378f8281e2d12ced
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa2c2
// Size: 0x53
function function_55f43964ccdb5b95(var_d58ba359bfb14d3e) {
    /#
        if (isstruct(var_d58ba359bfb14d3e)) {
            if (isdefined(var_d58ba359bfb14d3e.var_868e98cf48b92cfb)) {
                return ("<unknown string>" + function_600b37e8cf3f2de9(var_d58ba359bfb14d3e.var_868e98cf48b92cfb));
            } else {
                return "<unknown string>";
            }
        } else {
            return function_600b37e8cf3f2de9(var_d58ba359bfb14d3e);
        }
    #/
}

