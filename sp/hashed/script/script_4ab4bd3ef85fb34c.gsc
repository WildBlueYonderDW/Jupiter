#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\sp\anim.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\sp\utility.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\values.gsc;
#using scripts\common\anim.gsc;
#using script_5d265b4fca61f070;
#using script_32876a523f324870;
#using scripts\sp\player\ally_equipment.gsc;
#using scripts\sp\friendlyfire.gsc;
#using scripts\sp\hud_util.gsc;
#using scripts\sp\starts.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\sp\fakeactor.gsc;
#using scripts\engine\flags.gsc;
#using scripts\sp\door.gsc;
#using scripts\sp\player_death.gsc;
#using scripts\sp\spawner.gsc;
#using script_3433ee6b63c7e243;
#using scripts\sp\analytics.gsc;
#using scripts\asm\juggernaut\juggernaut.gsc;
#using scripts\stealth\enemy.gsc;
#using scripts\sp\scripted_weapon_assignment.gsc;
#using script_7d535542e36d66f9;
#using scripts\stealth\debug.gsc;

#namespace namespace_47819225b08b445d;

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1763
// Size: 0x52
function function_979ad8df021cc9f7(var_a7fe730c4b4ed74a, delay) {
    self endon("death");
    if (level.player getstance() == "prone") {
        say_delayed(delay, var_a7fe730c4b4ed74a);
        return;
    }
    function_712628504215059c();
    say_delayed(delay, var_a7fe730c4b4ed74a);
    function_9b053bd3e7582716();
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17bd
// Size: 0x2e
function function_712628504215059c() {
    if (istrue(self.var_aeab72610c3cd71f)) {
        return;
    }
    self.var_aeab72610c3cd71f = 1;
    self forceplaygestureviewmodel("iw9_vm_ges_radio_shoulder_sp_left", undefined, 1, 0, 1, 0);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17f3
// Size: 0x26
function function_9b053bd3e7582716() {
    if (!istrue(self.var_aeab72610c3cd71f)) {
        return;
    }
    self.var_aeab72610c3cd71f = undefined;
    self stopgestureviewmodel("iw9_vm_ges_radio_shoulder_sp_left");
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1821
// Size: 0x75
function function_a03f2672d2839be1(num_min, num_max) {
    assert(isdefined(num_min));
    assert(isdefined(num_max));
    x = randomfloatrange(num_min, num_max);
    if (randomint(2) == 0) {
        x *= -1;
    }
    y = randomfloatrange(num_min, num_max);
    if (randomint(2) == 0) {
        y *= -1;
    }
    return (x, y, 0);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x189f
// Size: 0x17
function function_6d41ec7b09cd23b6(ent) {
    if (isdefined(ent)) {
        ent delete();
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18be
// Size: 0x133
function function_5407d3d400318b45(var_c7d7563c12d7cb53, var_280504bdb233dce2) {
    if (!isdefined(var_c7d7563c12d7cb53)) {
        var_c7d7563c12d7cb53 = 0;
    }
    if (!isdefined(var_280504bdb233dce2)) {
        var_280504bdb233dce2 = 1;
    }
    self.rifle = function_2e83559564d380f4();
    self.sidearm = function_ee6edd76e38df369();
    if (function_5c40243f3153be01(self.rifle) && !scripts\sp\starts::is_after_start("ambulance_cinematic")) {
        self.rifle = self.rifle getaltweapon();
    }
    give_weapon(self.rifle, 0, 0, 0, var_c7d7563c12d7cb53);
    give_weapon(self.sidearm, 0, 0, 0, var_280504bdb233dce2);
    give_offhand("frag");
    give_offhand("flash");
    self givemaxammo(self.rifle);
    self givemaxammo(self.sidearm);
    if (scripts\sp\starts::is_after_start("infil_stairs") || level.start_point == "concourse_civilian_debug" || level.start_point == "branching_anim_test" || level.start_point == "civ_ballistics_debug") {
        self switchtoweapon(self.rifle);
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19f9
// Size: 0x29
function function_2e83559564d380f4() {
    return make_weapon("iw9_sm_alpha57_sp", ["iw9_minireddot01_tall", "grip_vertshort04", "pgrip_aim_p01"]);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a2b
// Size: 0x32
function function_ee6edd76e38df369() {
    return make_weapon("iw9_pi_golf17_sp", ["pgrip_tac_p24", "iw9_minireddot05_pstl", "mag_pi_large_p24", "bar_pi_light_p24"]);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a66
// Size: 0x87
function function_8af47a1c024d7116(var_fce9cefb34861ca3) {
    foreach (var_5ae205fabcda9ddf in var_fce9cefb34861ca3) {
        self endon(var_5ae205fabcda9ddf);
    }
    self waittill("weapon_switch_pressed");
    while (self isswitchingweapon()) {
        waitframe();
    }
    var_d0bd91dd014debfc = self getcurrentweapon();
    if (!function_5c40243f3153be01(var_d0bd91dd014debfc)) {
        self notify("stop_select_fire_hint");
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1af5
// Size: 0x2c
function isattachmentselectfire(weapon, attachment) {
    basetype = function_7c612ac92ba98dcb(weapon, attachment);
    return basetype == "selectfire";
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2a
// Size: 0x44
function function_5c40243f3153be01(objweapon) {
    attachments = getweaponattachments(objweapon);
    if (istrue(objweapon.hasalternate)) {
        if (isattachmentselectfire(objweapon, objweapon.underbarrel)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b77
// Size: 0x97
function function_65ec687cb4356c31(weapon) {
    foreach (attachment in ["iw9_laserads_intensity4", "laserbox_ads04", "lasercyl_ads04"]) {
        if (weapon canuseattachment(attachment) && !weapon hasattachment(attachment)) {
            new = weapon withattachment(attachment);
            function_17177a175dd8f243(new);
            return;
        }
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c16
// Size: 0x132
function function_4a4895a4576a8fa9() {
    if (!isdefined(level.var_b291373a9335f45)) {
        array = [];
        array["head_sc_m_ahmadzai_civ"] = 1;
        array["head_sc_m_androsov_civ"] = 1;
        array["head_sc_m_sharipov_civ"] = 1;
        array["head_sc_m_vozhyuk_civ"] = 1;
        array["head_sc_m_arakelyan_civ_w_hair"] = 1;
        array["head_sc_m_mrehin_civ"] = 1;
        array["head_sc_m_alameer_civ"] = 1;
        array["head_sc_f_anisimova_civ"] = 1;
        array["head_sc_f_babayeva_civ"] = 1;
        array["head_sc_f_chivikina_civ"] = 1;
        array["head_sc_f_mostafavi_civ"] = 1;
        array["head_sc_m_colvin_civ"] = 1;
        array["head_sp_opforce_grunt_var_03_var_1_civ"] = 1;
        array["head_sc_f_alicea_civ"] = 1;
        array["head_sc_f_wetherbee_civ"] = 1;
        array["head_sc_f_stokes_civ"] = 1;
        array["head_sc_f_daly_civ"] = 1;
        array["head_sc_f_dizon_var_1"] = 1;
        level.var_b291373a9335f45 = array;
    }
    assert(isdefined(level.var_b291373a9335f45[self.headmodel]));
    self detach(self.headmodel);
    var_245e9d48c680af8b = self.headmodel + "_nofacial";
    self attach(var_245e9d48c680af8b);
    self.headmodel = var_245e9d48c680af8b;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d50
// Size: 0xaf
function function_127a31c7d0c84559(radius, team, timeout) {
    if (!isdefined(team)) {
        team = "all";
    }
    assertex(isent(self), "navRepulsorRemoveOnDeath():self is not a valid ent.");
    assertex(isnumber(radius), "navRepulsorRemoveOnDeath():must supply a valid radius for the repulsor");
    if (!isdefined(self.unique_id)) {
        scripts\engine\flags::assign_unique_id();
    }
    repulsor_id = "repulsor_id_" + self.unique_id;
    createnavrepulsor(repulsor_id, 0, self, radius, 1, team);
    if (isdefined(timeout)) {
        waittill_notify_or_timeout("death", timeout);
    } else {
        self waittill("death");
    }
    destroynavrepulsor(repulsor_id);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e07
// Size: 0x1f
function function_447207547d20ae92() {
    assert(isai(self));
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_full";
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e2e
// Size: 0x1f
function function_e59f66b2ecf3471f() {
    assert(isai(self));
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_single";
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e55
// Size: 0x1f
function function_363c08ddb86b8493() {
    assert(isai(self));
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e7c
// Size: 0x21
function function_698286637b54cd38() {
    if (!is_dead_or_dying(self)) {
        self waittill("death");
    }
    wait 0.2;
    utility::autosave_by_name();
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea5
// Size: 0x73
function function_89861b2c7f16638b(spawn_origin, var_172d3acceb228e68, var_921b9d1ab6394420) {
    var_921b9d1ab6394420 = default_to(var_921b9d1ab6394420, 50);
    close_ai = getaiarrayinradius(spawn_origin, var_921b9d1ab6394420, "axis", "neutral");
    close_ai = array_exclude(close_ai, var_172d3acceb228e68);
    if (isdefined(level.var_a4e59630e0e3e8a0)) {
        close_ai = array_exclude(close_ai, level.var_a4e59630e0e3e8a0);
    }
    array_delete(close_ai);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f20
// Size: 0x4b
function function_e487b1f177e4f0f3(node) {
    current = node;
    while (true) {
        if (isdefined(current.target)) {
            current = getstruct(current.target, "targetname");
            continue;
        }
        return current;
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f73
// Size: 0x44
function function_cd8107d772ca6582() {
    self notify("reset_door");
    self notify("entitydeleted");
    self notify("stop_open_ability");
    self notify("ai_opened");
    self notify("unusable");
    self.active = 0;
    self.open_struct scripts\sp\door::remove_open_interact_hint();
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fbf
// Size: 0x40
function function_f3eab8a86f345829() {
    var_daecc7dcfc15b8a6 = self.animsetname == "civilian_react" ? "" : "female";
    self playcontextsound("fb_civ_death", "gender", var_daecc7dcfc15b8a6);
    return true;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2008
// Size: 0xb0
function function_e29483c00b1210fa() {
    self endon("death");
    self endon("disable_proximity_yelling");
    if (!isdefined(level.var_1ec6fb3248c06209)) {
        function_be577c3f4e2d750d();
    }
    gender = self.animsetname == "civilian_react" ? "male" : "female";
    closedist = squared(600);
    while (true) {
        if (distancesquared(self.origin, level.player.origin) < closedist) {
            dialogue::say_self(level.var_1ec6fb3248c06209[gender] utility::deck_draw());
            wait 0.25;
        }
        wait 1;
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20c0
// Size: 0xb2
function function_be577c3f4e2d750d() {
    level.var_1ec6fb3248c06209 = [];
    for (i = 0; i < 2; i++) {
        array = [];
        if (i == 0) {
            index = "male";
            prefix = "civ_panic_male_";
            maxnum = 48;
        } else {
            index = "female";
            prefix = "civ_panic_female_";
            maxnum = 40;
        }
        for (x = 1; x < maxnum; x++) {
            array[array.size] = prefix + x;
        }
        level.var_1ec6fb3248c06209[index] = utility::create_deck(array, 0, 1, 1);
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x217a
// Size: 0x487
function function_975802ac7c0a7333(animname, color, origin, angles, var_cd3272c2f4e893b6, var_5fa0a0a257001530, var_2fcf4828f84024) {
    origin = default_to(origin, (0, 0, 0));
    angles = default_to(angles, (0, 0, 0));
    var_cd3272c2f4e893b6 = default_to(var_cd3272c2f4e893b6, 1);
    var_5fa0a0a257001530 = default_to(var_5fa0a0a257001530, 1);
    if (!isdefined(level.var_c1ce86d0beef55c0)) {
        level.var_c1ce86d0beef55c0 = [];
        level.var_c1ce86d0beef55c0["veh9_civ_lnd_sedan_2009_police"] = create_deck([""]);
        level.var_c1ce86d0beef55c0["veh9_ind_lnd_delivery_box_truck"] = create_deck(["common", "green", "grey", "red", "yellow"]);
        level.var_c1ce86d0beef55c0["veh9_civ_lnd_ralfa"] = create_deck(["black", "green", "gray", ""]);
        level.var_c1ce86d0beef55c0["veh9_civ_lnd_sedan_2009"] = create_deck(["slategray", "green", "blue", ""]);
        level.var_c1ce86d0beef55c0["veh9_civ_lnd_hatch_small_2015"] = create_deck(["black", "green", "blue", ""]);
        level.var_c1ce86d0beef55c0["veh9_civ_lnd_station_wagon"] = create_deck(["black", "green", "blue", ""]);
        level.var_c1ce86d0beef55c0["veh9_civ_lnd_micro_car"] = create_deck(["gray", "orange", "blue", ""]);
        level.var_c1ce86d0beef55c0["veh9_civ_lnd_sedan_hatchback_1985"] = create_deck(["black", "green", "blue", ""]);
        level.var_c1ce86d0beef55c0["veh9_civ_lnd_van_small"] = create_deck(["black", "grey", ""]);
        level.var_c1ce86d0beef55c0["veh9_civ_lnd_secho"] = create_deck(["black", "tan", "blue", ""]);
        level.var_c1ce86d0beef55c0["veh8_civ_lnd_palfa_ambulance_russia"] = create_deck([""]);
        level.var_c1ce86d0beef55c0["veh9_civ_lnd_van_palfa_ambulance_ru"] = create_deck([""]);
        level.var_c1ce86d0beef55c0["veh9_civ_lnd_van_palfa_ambulance_ru_rig"] = create_deck([""]);
    }
    modelname = level.scr_model[animname];
    var_f44a0dd07171743d = level.var_c1ce86d0beef55c0[modelname];
    if (isdefined(color) && !array_contains(var_f44a0dd07171743d, color)) {
        iprintln("Provided color not available for this car (" + animname + ")! Falling back to white.");
        color = "";
    }
    if (!isdefined(color)) {
        assertex(isdefined(level.var_c1ce86d0beef55c0[modelname]), "Trying to spawn an anim vehicle (" + modelname + ") but no color ooptions were provided for it in level.vehicle_color_info!");
        color = level.var_c1ce86d0beef55c0[modelname] deck_draw();
    }
    if (color != "") {
        color += "::";
    }
    var_e89f1b2251c3c6cc = color + modelname;
    newmodel = spawn("script_model", (0, 0, 0));
    newmodel setmodel(var_e89f1b2251c3c6cc);
    newmodel.origin = origin;
    newmodel.angles = angles;
    newmodel.animname = animname;
    newmodel assign_animtree(animname);
    newmodel dontinterpolate();
    newmodel.var_29a771a9ce169522 = modelname;
    if (newmodel tagexists("tag_windshield_front_web")) {
        newmodel hidepart("tag_windshield_front_web");
    }
    if (var_cd3272c2f4e893b6 || var_5fa0a0a257001530) {
        newmodel function_38d0701610b1d412(var_cd3272c2f4e893b6, var_5fa0a0a257001530, var_2fcf4828f84024);
    }
    return newmodel;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x260a
// Size: 0x154
function function_38d0701610b1d412(var_cd3272c2f4e893b6, var_5fa0a0a257001530, var_2fcf4828f84024) {
    if (!var_cd3272c2f4e893b6 && !var_5fa0a0a257001530) {
        return;
    }
    if (!isdefined(var_2fcf4828f84024)) {
        var_2fcf4828f84024 = cointoss();
    }
    if (var_5fa0a0a257001530) {
        var_c4b397a72d2c9996 = cointoss();
    }
    var_d8961128a2461308 = undefined;
    if (var_2fcf4828f84024) {
        var_d8961128a2461308 = getspawner("alpha_civ_spawner_male", "script_noteworthy");
    } else {
        var_d8961128a2461308 = getspawner("alpha_civ_spawner_female", "script_noteworthy");
    }
    self.driver = bodyonlyspawn(var_d8961128a2461308);
    passenger = undefined;
    if (var_5fa0a0a257001530) {
        var_6f3a310aa7c6551c = undefined;
        if (var_c4b397a72d2c9996) {
            var_6f3a310aa7c6551c = getspawner("alpha_civ_spawner_male", "script_noteworthy");
        } else {
            var_6f3a310aa7c6551c = getspawner("alpha_civ_spawner_female", "script_noteworthy");
        }
        passenger = bodyonlyspawn(var_6f3a310aa7c6551c);
    }
    function_8cc165e7ccdbfef2(self.driver, var_2fcf4828f84024, 1);
    if (var_5fa0a0a257001530) {
        function_8cc165e7ccdbfef2(passenger, var_c4b397a72d2c9996, 0);
    }
    if (self.var_29a771a9ce169522 == "veh9_civ_lnd_van_palfa_ambulance_ru") {
        array_call(self.occupants, &setmodel, "body_c_jup_civ_paramedic_01");
        return;
    }
    if (self.var_29a771a9ce169522 == "veh9_civ_lnd_sedan_2009_police") {
        array_call(self.occupants, &setmodel, "body_c_jup_sp_enemy_police_kastovia_01");
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2766
// Size: 0xdd
function function_8cc165e7ccdbfef2(occupant, var_416ad3bfb1dbc22f, var_c1a5d8782ce20b64) {
    if (var_c1a5d8782ce20b64) {
        var_d036e732a654a479 = "_driver";
    } else {
        var_d036e732a654a479 = "_passenger";
    }
    occupant.animname = self.var_29a771a9ce169522 + var_d036e732a654a479;
    if (var_416ad3bfb1dbc22f) {
        occupant.animname += "_male";
    } else {
        occupant.animname += "_female";
    }
    occupant thread function_ea6026cabf9c5424();
    occupant.owner = self;
    occupant thread function_a1cbeb0b29becc97();
    if (!isdefined(self.occupants)) {
        self.occupants = [];
    }
    self.occupants[self.occupants.size] = occupant;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x284b
// Size: 0x52
function function_ea6026cabf9c5424() {
    self endon("death");
    while (true) {
        if (distance2dsquared(level.player.origin, self.origin) > 9000000) {
            function_df6b9be094d7108();
        } else {
            function_482b1e0ebfce89c7();
        }
        wait 0.1;
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28a5
// Size: 0x39
function function_df6b9be094d7108() {
    self.var_7b5aacf93f89f0f2 = default_to(self.var_7b5aacf93f89f0f2, 0);
    if (!self.var_7b5aacf93f89f0f2) {
        self.var_7b5aacf93f89f0f2 = 1;
        self hide();
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28e6
// Size: 0x39
function function_482b1e0ebfce89c7() {
    self.var_7b5aacf93f89f0f2 = default_to(self.var_7b5aacf93f89f0f2, 1);
    if (self.var_7b5aacf93f89f0f2) {
        self.var_7b5aacf93f89f0f2 = 0;
        self show();
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2927
// Size: 0xc5
function function_3bfa72736ef33a98() {
    tags = [];
    tags["tag_exhaust"] = 1;
    tags["tag_engine_exhaust"] = 1;
    self.var_793992d0ed547537 = undefined;
    foreach (var_bb4864cb5efc0dad, tag in tags) {
        if (self tagexists(var_bb4864cb5efc0dad)) {
            self.var_793992d0ed547537 = var_bb4864cb5efc0dad;
            break;
        }
    }
    if (!isdefined(self.var_793992d0ed547537)) {
        println(self.model + "<dev string:x1c>");
        return;
    }
    playfxontag(utility::getfx("vfx_flashback_exhaust_01"), self, self.var_793992d0ed547537);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29f4
// Size: 0x1d
function function_f08f4287924a3f91() {
    stopfxontag(getfx("vfx_flashback_exhaust_01"), self, self.var_793992d0ed547537);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a19
// Size: 0x102
function function_9246165d7c3054cc(targetfov) {
    level notify("new_fov_lerp");
    level endon("new_fov_lerp");
    startfov = getdvarint(@"hash_b38fcf293d1e91a8");
    var_75ecaca4a0b72ac6 = targetfov < startfov;
    var_8d514a16217594f0 = startfov;
    increment = 0.1;
    var_34d19d2ddce7fdad = 0;
    while (true) {
        moving = level.player getnormalizedmovement() != (0, 0, 0);
        if (moving) {
            var_34d19d2ddce7fdad++;
            if (var_34d19d2ddce7fdad >= 1) {
                if (var_75ecaca4a0b72ac6) {
                    var_8d514a16217594f0 -= increment;
                } else {
                    var_8d514a16217594f0 += increment;
                }
                var_8d514a16217594f0 = math::round_float(var_8d514a16217594f0, 1, var_75ecaca4a0b72ac6);
                level.player modifybasefov(var_8d514a16217594f0, 0.1);
                if (abs(targetfov - var_8d514a16217594f0) <= increment) {
                    level.player modifybasefov(targetfov, 0.1);
                    return;
                }
                var_34d19d2ddce7fdad = 0;
            }
        }
        waitframe();
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b23
// Size: 0x3d
function function_15e8419bc7722d0b() {
    function_fbb289d0b3ad4df0();
    self.var_3153bc8dd35b5a45 = self.pathenemyfightdist;
    self.pathenemyfightdist = 10;
    self setthreatbiasgroup("attack_fake_enemy");
    self.dontmelee = 1;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b68
// Size: 0x48
function function_64343406d01681e() {
    self notify("stop_shooting_fake_enemy");
    self.pathenemyfightdist = self.var_3153bc8dd35b5a45;
    self setthreatbiasgroup("axis");
    self.fake_enemy delete();
    self forcethreatupdate();
    self.dontmelee = 0;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bb8
// Size: 0xa4
function function_fbb289d0b3ad4df0() {
    if (isdefined(self.fake_enemy)) {
        return;
    }
    self.fake_enemy = spawn_tag_origin();
    self.fake_enemy setmodel("tag_origin_only_collision");
    self.fake_enemy makeentitysentient("allies");
    set_favoriteenemy(self.fake_enemy);
    self.fake_enemy setthreatbiasgroup("fake_enemy");
    self.fake_enemy notsolid();
    self.fake_enemy.attackeraccuracy = 1.25;
    thread delete_on_death(self.fake_enemy);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c64
// Size: 0x68
function function_c3d4460a352c9317() {
    self notifyonplayercommand("player_moved", "+forward");
    self notifyonplayercommand("player_moved", "+back");
    self notifyonplayercommand("player_moved", "+moveleft");
    self notifyonplayercommand("player_moved", "+moveright");
    waittill_any_timeout(2, "player_moved", "jump_pressed", "stance_pressed", "use_pressed", "attack_pressed");
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cd4
// Size: 0x60
function function_403a13b2ad8b35a8() {
    if (!isdefined(self)) {
        return;
    }
    if (isai(self)) {
        self invisiblenotsolid();
        return;
    }
    if (self.classname == "script_model") {
        self hide();
        return;
    }
    if (self isscriptable()) {
        self.origin -= (0, 0, 200);
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d3c
// Size: 0x5a
function function_98b569ec47e179e7() {
    if (isai(self)) {
        self visiblesolid();
        return;
    }
    if (self.classname == "script_model") {
        self show();
        return;
    }
    if (self isscriptable()) {
        self.origin += (0, 0, 200);
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d9e
// Size: 0x10e
function function_d111c8d7496572c1() {
    chosen = undefined;
    foreach (weapon in level.player.primaryweapons) {
        if (weaponclass(weapon) == "rifle") {
            chosen = weapon;
            break;
        }
    }
    if (!isdefined(chosen)) {
        foreach (weapon in level.player.primaryweapons) {
            if (weaponclass(weapon) == "spread") {
                chosen = weapon;
                break;
            }
        }
    }
    if (!isdefined(chosen)) {
        chosen = make_weapon("iw9_sm_alpha57_sp");
    }
    utility::make_weapon_and_attach(chosen.basename, chosen.attachments, "tag_weapon_right");
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2eb4
// Size: 0x2b
function function_bbe10cdead87303b(var_ddeae6efd613349a, var_aa4265eeb046cbbf) {
    level endon(var_aa4265eeb046cbbf);
    if (flag(var_aa4265eeb046cbbf)) {
        return var_aa4265eeb046cbbf;
    }
    trigger_wait_targetname(var_ddeae6efd613349a);
    return var_ddeae6efd613349a;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ee8
// Size: 0x21
function function_c0036e04e68c5f15() {
    self endon("death");
    self waittill("damage");
    if (self isinscriptedstate()) {
        self stopanimscripted();
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f11
// Size: 0x20
function function_6ff9ea4d902a5f57() {
    self endon("death");
    self waittillmatch("looping anim", "end");
    self notify("looping_anim_done");
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f39
// Size: 0x20
function function_264ea5c38c1ae771() {
    self endon("death");
    self waittillmatch("single anim", "end");
    self notify("single_anim_done");
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f61
// Size: 0x12
function function_87965f65c7c6d305() {
    function_8d4a31dc5a4c61fb(level.var_3df1f4a9966d9c41);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f7b
// Size: 0x12
function function_f7cc38f508d45f76() {
    function_8d4a31dc5a4c61fb(level.var_f23b3e4753f0fb2);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f95
// Size: 0x2d
function function_8d4a31dc5a4c61fb(array) {
    assert(isdefined(array));
    while (array.size) {
        array = function_fdc9d5557c53078e(array);
        wait 0.1;
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fca
// Size: 0x2b
function function_a1cbeb0b29becc97() {
    assert(isdefined(self.owner), "No owner was assigned to self!");
    self.owner utility::delete_on_death(self);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ffd
// Size: 0xd5
function function_fbca877c7dca5b38(node, var_82b8a01bc22f04c4) {
    var_42efe883ec9b02a4 = undefined;
    var_f6122992d3867789 = undefined;
    foreach (xanim in var_82b8a01bc22f04c4) {
        var_8d531170abaf62f3 = getstartorigin(node.origin, node.angles, xanim);
        var_e947878024a38e7a = distance(level.player.origin, var_8d531170abaf62f3);
        if (!isdefined(var_42efe883ec9b02a4)) {
            var_42efe883ec9b02a4 = var_e947878024a38e7a;
            var_f6122992d3867789 = xanim;
            continue;
        }
        if (var_e947878024a38e7a < var_42efe883ec9b02a4) {
            var_42efe883ec9b02a4 = var_e947878024a38e7a;
            var_f6122992d3867789 = xanim;
        }
    }
    return var_f6122992d3867789;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30db
// Size: 0x2f
function function_83e98ae16c293cb6() {
    self endon("stop_interact_wait");
    result = waittill_any_ents_return(self, "trigger", self, "attempt_bash");
    self notify("door_opened", result);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3112
// Size: 0x277
function function_8da3daaa6d7ab1a1(var_b3095c74bd63cdc0, var_27af2468edcf5a95) {
    playerspeed = length(level.player getvelocity());
    blendtime = playerspeed > 45 ? 0.5 : 1;
    var_858203d3d31e76f2 = 0.6;
    if (isdefined(var_b3095c74bd63cdc0)) {
        rightarc = isdefined(var_b3095c74bd63cdc0.rightarc) ? var_b3095c74bd63cdc0.rightarc : 30;
        leftarc = isdefined(var_b3095c74bd63cdc0.leftarc) ? var_b3095c74bd63cdc0.leftarc : 30;
        toparc = isdefined(var_b3095c74bd63cdc0.toparc) ? var_b3095c74bd63cdc0.toparc : 30;
        bottomarc = isdefined(var_b3095c74bd63cdc0.bottomarc) ? var_b3095c74bd63cdc0.bottomarc : 30;
    } else {
        rightarc = 30;
        leftarc = 30;
        toparc = 30;
        bottomarc = 30;
    }
    if (level.player getstance() != "stand") {
        level.player setstance("stand", 1, 0, 0);
        waitframe();
    }
    level.player_rig.allows = ["weapon", "offhand_weapons", "melee", "sprint", "allow_jump", "mantle", "crouch", "prone"];
    level.player val::set_array("player_rig", level.player_rig.allows, 0);
    level.player playerlinktoblend(level.player_rig, "tag_player", blendtime, blendtime * 0.5, blendtime * 0.5);
    level.player delaycall(blendtime, &playerlinktodelta, level.player_rig, "tag_player", 1, 0, 0, 0, 0, 1);
    level.player delaycall(blendtime + 0.5, &lerpviewangleclamp, 1, 0.5, 0.5, rightarc, leftarc, toparc, bottomarc);
    if (!istrue(var_27af2468edcf5a95)) {
        level.player_rig delaycall(var_858203d3d31e76f2 + 0.1, &show);
    }
    wait var_858203d3d31e76f2;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3391
// Size: 0x39
function unlink_player_from_rig() {
    level.player val::function_38f73441260ce622("player_rig", level.player_rig.allows);
    level.player_rig delete();
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33d2
// Size: 0xc6
function function_7b04f9efd0f27d16() {
    if (istrue(level.var_f5e3ffafbcf7a6ff)) {
        assertex(0, "Already running out of bounds logic!");
    }
    level.player thread function_92dcd6b1e8981e72();
    level.var_f5e3ffafbcf7a6ff = 1;
    level.player ent_flag_init("out_of_bounds");
    var_6cf27e73a7ffd43 = getentarray("OutOfBounds", "targetname");
    if (var_6cf27e73a7ffd43.size == 0) {
        iprintln("Trying to track out of bounds with no triggers! Mark out of bounds areas with an \"OutOfBounds\" targetname.");
        return;
    }
    foreach (trigger in var_6cf27e73a7ffd43) {
        trigger thread function_8f2ebae90f61cb99();
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34a0
// Size: 0x220
function function_8f2ebae90f61cb99() {
    self endon("entitydeleted");
    if (isdefined(self.target)) {
        self.failtrigger = getent(self.target, "targetname");
        if (isdefined(self.failtrigger)) {
            self.failtrigger.owner = self;
            self.failtrigger thread function_a1cbeb0b29becc97();
        }
    }
    if (isdefined(self.script_noteworthy)) {
        level.player ent_flag_init("oob_" + self.script_noteworthy);
        thread function_dd4fa73410df3269();
    }
    if (isdefined(self.failtrigger)) {
        self.failtrigger childthread outofbounds_failthread();
    }
    while (true) {
        while (!level.player istouching(self)) {
            waitframe();
        }
        setomnvar("ui_out_of_bounds_countdown", 1);
        var_9aa63484ba2a4363 = gettime();
        level.player ent_flag_set("out_of_bounds");
        if (isdefined(self.script_noteworthy) && level.player ent_flag_exist("oob_" + self.script_noteworthy)) {
            level.player ent_flag_set("oob_" + self.script_noteworthy);
        }
        while (level.player istouching(self)) {
            if (time_has_passed(var_9aa63484ba2a4363, 5)) {
                setomnvar("ui_out_of_bounds_countdown", 0);
                scripts\sp\player_death::set_custom_death_quote(29);
                missionfailedwrapper();
            } else if (time_has_passed(var_9aa63484ba2a4363, 2)) {
                thread display_hint("show_objectives", 3);
            }
            waitframe();
        }
        setomnvar("ui_out_of_bounds_countdown", 0);
        level.player ent_flag_clear("out_of_bounds");
        if (isdefined(self.script_noteworthy) && level.player ent_flag_exist("oob_" + self.script_noteworthy)) {
            level.player ent_flag_clear("oob_" + self.script_noteworthy);
        }
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36c8
// Size: 0x34
function outofbounds_failthread() {
    self endon("death");
    self endon("stop_failthread");
    self waittill("trigger");
    setomnvar("ui_out_of_bounds_countdown", 0);
    scripts\sp\player_death::set_custom_death_quote(29);
    missionfailedwrapper();
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3704
// Size: 0x16
function function_92dcd6b1e8981e72() {
    self waittill("death");
    setomnvar("ui_out_of_bounds_countdown", 0);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3722
// Size: 0x43
function function_dd4fa73410df3269() {
    noteworthy = self.script_noteworthy;
    self waittill("entitydeleted");
    if (level.player ent_flag("oob_" + noteworthy)) {
        setomnvar("ui_out_of_bounds_countdown", 0);
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x376d
// Size: 0x50
function function_e2f14dc89a2fa632(targetname) {
    assert(isstring(targetname));
    trig = getent(targetname, "targetname");
    while (level.player istouching(trig)) {
        waitframe();
    }
    self notify("player_left_trigger_" + targetname);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37c5
// Size: 0x72
function function_76bb2b4d7fbca9f8(var_f2e1cc2b69e69745) {
    if (!isdefined(var_f2e1cc2b69e69745)) {
        var_f2e1cc2b69e69745 = 0;
    }
    self function_b661b022700ba72f("script", 1);
    self function_d5cda8a759cc36bc("cower");
    self waittillmatch("single anim", "end");
    if (is_dead_or_dying(self)) {
        return;
    }
    self._blackboard.var_60b33cf695f1d6ed = var_f2e1cc2b69e69745;
    self asmsetstate(self.asmname, "cower");
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x383f
// Size: 0x6b
function function_e0a9de6b0601ed23(attacker, inflictor, meansofdeath, weaponobj, var_16267440af2bca68) {
    if (!isdefined(var_16267440af2bca68)) {
        var_16267440af2bca68 = 1;
    }
    function_264ea5c38c1ae771();
    if (isdefined(self.magic_bullet_shield) && istrue(var_16267440af2bca68)) {
        stop_magic_bullet_shield();
    }
    if (!is_dead_or_dying(self)) {
        function_e2ca6c74c16376cc(attacker, inflictor, meansofdeath, weaponobj);
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38b2
// Size: 0x1a
function function_87a1690da9ade14(node) {
    function_264ea5c38c1ae771();
    scripts\sp\spawner::go_to_node(node);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x38d4
// Size: 0x7e
function function_b5b7c971ef980a7(guys, anime, tag) {
    assert(isstring(anime));
    if (guys.size < 1) {
        return;
    }
    foreach (guy in guys) {
        thread anim_last_frame_solo(guy, anime);
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x395a
// Size: 0x5c
function function_efc089d7d1b8af28(time, origin, half_size, angles, weight, team) {
    if (!isdefined(time)) {
        time = 10;
    }
    badplace = createnavbadplacebybounds(origin, half_size, angles, weight, team);
    wait time;
    destroynavobstacle(badplace);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39be
// Size: 0x2b
function function_9d3eb4b159acb2c() {
    var_e21c3c6e05a385f7 = getent("volume_outside_alley", "targetname");
    return level.player istouching(var_e21c3c6e05a385f7);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x39f2
// Size: 0x1a4
function spawn_civ(origin, angles, var_416ad3bfb1dbc22f, var_dec279f92c1a767b, var_940f807277213855, var_4fa9418a3eeef614, disable_proximity_yelling) {
    if (!isdefined(origin)) {
        origin = (0, 0, 0);
    }
    if (!isdefined(angles)) {
        angles = (0, 0, 0);
    }
    if (!isdefined(var_416ad3bfb1dbc22f)) {
        var_416ad3bfb1dbc22f = undefined;
    }
    if (!isdefined(var_dec279f92c1a767b)) {
        var_dec279f92c1a767b = 0;
    }
    if (!isdefined(var_940f807277213855)) {
        var_940f807277213855 = 0;
    }
    if (!isdefined(var_4fa9418a3eeef614)) {
        var_4fa9418a3eeef614 = 0;
    }
    if (!isdefined(disable_proximity_yelling)) {
        disable_proximity_yelling = 0;
    }
    if (randomint(100) < 60 || istrue(var_4fa9418a3eeef614)) {
        var_e71691423e47c377 = "actor_jup_civilian_rus_male_flashback_soccerfan";
        var_5d1a3c508b299164 = "actor_jup_civilian_rus_female_flashback_soccerfan";
    } else {
        var_e71691423e47c377 = "actor_jup_civilian_rus_male_flashback";
        var_5d1a3c508b299164 = "actor_jup_civilian_rus_female_flashback";
    }
    classnames = [var_e71691423e47c377, var_5d1a3c508b299164];
    classname = undefined;
    if (!isdefined(var_416ad3bfb1dbc22f)) {
        classname = classnames[randomint(classnames.size)];
    } else if (var_416ad3bfb1dbc22f) {
        classname = var_e71691423e47c377;
    } else {
        classname = var_5d1a3c508b299164;
    }
    guy = undefined;
    if (var_dec279f92c1a767b) {
        guy = dospawnaitype(classname, origin, angles, 1, 0, 1, 1);
    } else {
        guy = spawn_aitype(classname, origin, angles, 1);
    }
    if (isdefined(guy)) {
        guy._blackboard.skiptransition = 1;
        guy function_f7941b6f37af6a94();
        guy thread function_f8f96ba6bf8bf585();
        if (!disable_proximity_yelling) {
            guy thread function_e29483c00b1210fa();
        }
    } else if (var_940f807277213855) {
        assert(0, "Failed to spawn civ!");
    }
    return guy;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b9f
// Size: 0x18
function function_f8f96ba6bf8bf585() {
    self endon("entitydeleted");
    self waittill("death");
    function_f3eab8a86f345829();
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bbf
// Size: 0x15d
function function_6d3328a601ec7b66() {
    if (isdefined(level.shepherd)) {
        level.shepherd delete();
    }
    origin = ter_op(isdefined(self.origin), self.origin, (0, 0, 0));
    angles = ter_op(isdefined(self.angles), self.angles, (0, 0, 0));
    level.shepherd = spawn_aitype("actor_jup_ally_hero_shepherd_bravo", origin, angles, 1, undefined, undefined, "shepherd");
    level.shepherd.script_friendname = "Gen. Shepherd";
    level.shepherd.name = level.shepherd.script_friendname;
    level.shepherd.script_noteworthy = "shepherd";
    level.shepherd utility::function_ab35ae296c8f8609("Gold Eagle Actual");
    level.shepherd.animname = "shepherd";
    level.shepherd magic_bullet_shield(1);
    level.shepherd utility::gun_remove();
    flag_set("shepherd_spawned");
    return level.shepherd;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d25
// Size: 0x23d
function spawn_price(var_c28854ded28e9b4d) {
    if (!isdefined(var_c28854ded28e9b4d)) {
        var_c28854ded28e9b4d = 1;
    }
    if (isdefined(level.price)) {
        level.price delete();
    }
    origin = ter_op(isdefined(self.origin), self.origin, (0, 0, 0));
    angles = ter_op(isdefined(self.angles), self.angles, (0, 0, 0));
    level.price = spawn_aitype("actor_jup_ally_hero_price_bravo", origin, angles, 1, undefined, undefined, "price");
    level.price.script_friendname = "Captain Price";
    level.price.name = level.price.script_friendname;
    level.price utility::function_ab35ae296c8f8609("Bravo 0-6");
    level.price.script_noteworthy = "price";
    level.price set_force_color("b");
    level.price.baseaccuracy = 10;
    level.price.nogrenadereturnthrow = 1;
    if (!isdefined(level.allies)) {
        level.allies = [];
    }
    level.price.animname = "price";
    weapon = function_e518b02ca466d970();
    level.price function_17177a175dd8f243(weapon);
    level.price set_grenadeammo(0);
    if (var_c28854ded28e9b4d) {
        level.price function_c28854ded28e9b4d("tag_stowed_back");
    }
    level.price magic_bullet_shield(1);
    level.allies[level.allies.size] = level.price;
    flag_set("price_spawned");
    function_f1864fb398798ed6(1);
    level.var_74ff7670993d1557 = level.price;
    return level.price;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f6b
// Size: 0x3b
function function_c28854ded28e9b4d(tag) {
    self.var_a79283350c6b5674 = tag;
    self attach(getmodel("halligan"), self.var_a79283350c6b5674);
    self.var_2bef2d79d7610fd3 = 1;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fae
// Size: 0x80
function function_e518b02ca466d970() {
    baseweapon = "iw9_ar_mike4_sp";
    attachments = ["iw9_rec_mike4|1", "stock_ar_p01_mike4|4", "mag_ar_p01|1", "pgrip_p01|2", "selectsemi_mike4", "ammo_556n", "reflex02_tall", "grip_vert02|1", "laserbox_ads01|1", "bar_ar_short_p01_mike4|2"];
    return utility::make_weapon(baseweapon, attachments);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4037
// Size: 0x64
function function_f1864fb398798ed6(bool) {
    flag_wait("price_spawned");
    if (!isdefined(level.var_6356b636336eac83)) {
        level.var_6356b636336eac83 = &function_4ed62766b5bf01b5;
    }
    if (istrue(bool)) {
        level thread namespace_68728a7c04d69134::ally_equipment_backpack(level.price, "ammo_all", 99, 0);
        return;
    }
    level.price namespace_68728a7c04d69134::ally_equipment_remove();
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40a3
// Size: 0x89
function function_4ed62766b5bf01b5() {
    var_461d69757eeecfc2 = 0.2;
    foreach (weapon in level.player.primaryweapons) {
        var_ee77cc99805f523b = level.player getfractionmaxammo(weapon);
        if (var_ee77cc99805f523b < var_461d69757eeecfc2) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4135
// Size: 0x1f1
function function_3e618c3ba27dd834() {
    if (isdefined(level.ghost)) {
        level.ghost delete();
    }
    origin = ter_op(isdefined(self.origin), self.origin, (0, 0, 0));
    angles = ter_op(isdefined(self.angles), self.angles, (0, 0, 0));
    level.ghost = spawn_aitype("actor_jup_ally_hero_ghost_bravo", origin, angles, 1, undefined, undefined, "ghost");
    level.ghost.script_friendname = "Ghost";
    level.ghost.name = level.ghost.script_friendname;
    level.ghost utility::function_ab35ae296c8f8609("Bravo 0-7");
    level.ghost.script_noteworthy = "ghost";
    if (!isdefined(level.allies)) {
        level.allies = [];
    }
    level.ghost.animname = "ghost";
    level.ghost magic_bullet_shield(1);
    level.ghost.secondary = level.ghost.weapon;
    level.ghost script_func("anim_placeweaponon", level.ghost.weapon, "back");
    newprimary = function_b24b6996c5e0351f();
    level.ghost namespace_223959d3e5206cfb::forceuseweapon(newprimary, "primary");
    level.allies[level.allies.size] = level.ghost;
    return level.ghost;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x432f
// Size: 0x5f
function function_b24b6996c5e0351f() {
    return utility::make_weapon("iw9_sn_mromeo_sp", ["ammo_300nm", "bar_sn_p21", "bipod01", "bolt_p21", "mag_sn_large_p21", "pgrip_p21", "rec_mromeo", "stock_sn_heavy_p21", "vzscope_mromeo"]);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4397
// Size: 0x3b
function function_6abf9776eba08eb8(name) {
    ent = spawn_tag_origin();
    ent.name = name;
    ent.team = "Allies";
    return ent;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43db
// Size: 0x2b1
function function_dc2aa213aa5830aa() {
    if (isdefined(level.makarov)) {
        level.makarov delete();
    }
    origin = ter_op(isdefined(self.origin), self.origin, (0, 0, 0));
    angles = ter_op(isdefined(self.angles), self.angles, (0, 0, 0));
    level.makarov = spawn_aitype("actor_" + "jup_enemy_villain_makarov_bravo", origin, angles, 1, undefined, undefined, "makarov");
    level.makarov.script_friendname = "Makarov";
    level.makarov.name = level.makarov.script_friendname;
    level.makarov.script_noteworthy = "makarov";
    level.makarov function_503436a5bb72ad19(1);
    level.makarov function_f142d1442ab9672();
    level.makarov utility::function_1a479cad9c3adbb1(0);
    level.makarov.context_melee_allowed = 0;
    level.makarov.dontmeleeme = 1;
    level.makarov disable_bulletwhizbyreaction();
    level.makarov.ignoreall = 1;
    level.makarov.ignoreme = 1;
    level.makarov.dontevershoot = 1;
    level.makarov.var_b29c3655b12e292d = 0;
    level.makarov.allowstrafe = 0;
    if (starts::is_after_start("ambulance_cinematic")) {
        level.makarov script_func("anim_placeweaponon", level.makarov.sidearm, "none");
    }
    level.makarov gun_remove();
    level.makarov actoraimassistoff();
    level.makarov attach("zip_tie_handcuffs_tag_accessory_left_b", "tag_accessory_left");
    level.makarov.dontgrenademe = 1;
    level.makarov.animname = "makarov";
    level.makarov magic_bullet_shield(1);
    level.makarov utility::set_battlechatter(0);
    flag_set("makarov_spawned");
    return level.makarov;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4695
// Size: 0x189
function function_350377b71c3dfd2e() {
    origin = ter_op(isdefined(self.origin), self.origin, (0, 0, 0));
    angles = ter_op(isdefined(self.angles), self.angles, (0, 0, 0));
    targetname = "redshirt";
    redshirt = spawn_aitype("actor_jup_ally_sas_bravo_ar", origin, angles, 1, undefined, undefined, targetname);
    weapon = make_weapon("iw9_sm_alpha57_sp", ["grip_angled01", "holo01"]);
    redshirt namespace_223959d3e5206cfb::forceuseweapon(weapon, "primary");
    redshirt.script_friendname = "Cpl. Burns";
    redshirt.name = redshirt.script_friendname;
    redshirt.baseaccuracy = 10;
    redshirt.nogrenadereturnthrow = 1;
    redshirt utility::function_ab35ae296c8f8609("Bravo 6-3");
    redshirt set_grenadeammo(0);
    redshirt set_force_color("r");
    redshirt magic_bullet_shield();
    redshirt.animname = targetname;
    redshirt.script_noteworthy = targetname;
    if (!isdefined(level.allies)) {
        level.allies = [];
    }
    level.allies[level.allies.size] = redshirt;
    level.redshirt = redshirt;
    return redshirt;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4827
// Size: 0x15
function function_503436a5bb72ad19(var_58d6035f58a7b43d) {
    self.var_2c5a9a1bbd246ef2 = var_58d6035f58a7b43d;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4844
// Size: 0xb8
function function_17177a175dd8f243(weapon_name) {
    new_weapon = undefined;
    if (isstring(weapon_name)) {
        new_weapon = make_weapon(weapon_name);
    } else if (isweapon(weapon_name)) {
        new_weapon = weapon_name;
    }
    assert(isweapon(new_weapon));
    var_1fd07e0fed049099 = getcompleteweaponname(self.weapon);
    self.weapon = new_weapon;
    self.primaryweapon = new_weapon;
    utility::initweapon(self.weapon);
    self [[ self.fnplaceweaponon ]](self.weapon, "right");
    self.weaponinfo = array_remove_key(self.weaponinfo, var_1fd07e0fed049099);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4904
// Size: 0x1c
function function_293d34b4366acee() {
    if (is_dead_or_dying(self)) {
        return;
    }
    self endon("death");
    self waittill("damage");
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4928
// Size: 0xc6
function function_e7c30095a6cdc3ef(position) {
    if (!isdefined(level.player)) {
        return false;
    }
    var_4d0a3f853f4aba16 = within_fov(level.player geteye(), level.player getplayerangles(), position, cos(getdvarint(@"cg_fov")));
    if (!var_4d0a3f853f4aba16) {
        return false;
    }
    contents = physics_createcontents(["physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_ainosight"]);
    castresult = physics_raycast(level.player geteye(), position, contents, undefined, 0, "physicsquery_closest", 0);
    if (isdefined(castresult) && castresult.size > 0) {
        return false;
    }
    return true;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49f7
// Size: 0x7d
function function_b6a76836508bfa3e() {
    var_44a0133272fb77ad = function_34def08ffb57e4d2();
    headmodel = function_eaf6c8fb8d77a3f8();
    self setmodel(var_44a0133272fb77ad);
    self detach(self.headmodel);
    self.headmodel = headmodel;
    self attach(self.headmodel);
    if (isdefined(self.hatmodel)) {
        self detach(self.hatmodel);
        self.hatmodel = undefined;
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a7c
// Size: 0x59
function function_eaf6c8fb8d77a3f8() {
    models = [];
    models[models.size] = "head_sc_m_sharipov_bg";
    models[models.size] = "head_sc_m_androsov_bg";
    models[models.size] = "head_sc_m_george_bg_civ";
    models[models.size] = "head_sc_m_johnson_var_1";
    models[models.size] = "head_sc_m_vozhyuk_bg_civ";
    var_cb8e2103144ac736 = randomintrange(0, models.size - 1);
    return models[var_cb8e2103144ac736];
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ade
// Size: 0x45
function function_34def08ffb57e4d2() {
    models = [];
    models[models.size] = "civ_amsterdam_male_1_1";
    models[models.size] = "civ_amsterdam_male_2_1";
    models[models.size] = "civ_amsterdam_male_4_1";
    var_cb8e2103144ac736 = randomintrange(0, models.size - 1);
    return models[var_cb8e2103144ac736];
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b2c
// Size: 0x4d
function function_5ded78372fface1e() {
    self notify("stop_open_ability");
    self notify("ai_opened");
    self notify("unusable");
    self.active = 0;
    self.open_struct scripts\sp\door::remove_open_interact_hint();
    scripts\sp\door::clear_navobstacle();
    scripts\sp\door::remove_open_prompts();
    self.bashed_full = 1;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4b81
// Size: 0x33
function function_6db117296b9b05fa(pointa, pointb, distance_squared) {
    if (!isdefined(pointa) || !isdefined(pointb)) {
        return true;
    }
    return distance2dsquared(pointa, pointb) < distance_squared;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4bbd
// Size: 0x33
function function_65afa133b1420920(pointa, pointb, distance_squared) {
    if (!isdefined(pointa) || !isdefined(pointb)) {
        return true;
    }
    return distancesquared(pointa, pointb) < distance_squared;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4bf9
// Size: 0x17
function function_9050c8bfe043b51d(script_noteworthy) {
    return trigger_wait(script_noteworthy, "script_noteworthy");
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c19
// Size: 0x75
function function_8933b56ed3affd76(node) {
    self endon("death");
    compare = undefined;
    if (isdefined(node)) {
        compare = node;
    } else if (isdefined(self.node)) {
        compare = self.node;
    }
    assertex(isdefined(compare), "No node to check!");
    while (distancesquared(self.origin, compare.origin) > 2025) {
        waitframe();
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c96
// Size: 0x51
function function_74908bfd4c865b11() {
    var_3f44baff9648eae3 = 0;
    if (istrue(self.cqbenabled)) {
        utility::disable_cqbwalk();
        var_3f44baff9648eae3 = 1;
    }
    if (istrue(self.sprint)) {
        disable_sprint();
        var_3f44baff9648eae3 = 1;
    }
    if (!istrue(var_3f44baff9648eae3)) {
        utility::clear_demeanor_override();
    }
    utility::clear_movement_speed();
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cef
// Size: 0x22
function function_ba89deba9a62fafb() {
    return int(length(self.velocity) > 30 && !function_fe5fb53651d57aa2());
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d1a
// Size: 0x16
function function_fe5fb53651d57aa2() {
    return is_equal(self.script, "pain");
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d39
// Size: 0x256
function function_9759891d24e704e7(type) {
    switch (type) {
    case #"hash_216115ad006bf4b1":
        set_stayahead_values(1, 130, 15, 0.2);
        set_stayahead_values(2, 100, -50, 0.1);
        set_stayahead_values(3, 60, -100, 0.1);
        set_stayahead_values(4, 35, -200, 0.2);
        break;
    case #"hash_2fe593cfa42f42e3":
        set_stayahead_values(1, 250, -200, 0.2);
        set_stayahead_values(2, 130, -300, 0.1);
        set_stayahead_values(3, 60, -375, 0.1);
        set_stayahead_values(4, 35, -420, 0.2);
        break;
    case #"hash_e8f0758a10ec7618":
        set_stayahead_values(1, 250, 50, 0.2);
        set_stayahead_values(2, 220, -90, 0.1);
        set_stayahead_values(3, 130, -125, 0.1);
        set_stayahead_values(4, 50, -200, 0.2);
        break;
    case #"hash_ef2526e45ef49c87":
        set_stayahead_values(1, 130, -150, 0.1);
        set_stayahead_values(2, 100, -300, 0.1);
        break;
    case #"hash_c71b112fe04823d6":
        set_stayahead_values(1, 300, 50, 0.2);
        set_stayahead_values(2, 250, -90, 0.1);
        set_stayahead_values(3, 180, -150, 0.1);
        set_stayahead_values(4, 140, -225, 0.2);
        break;
    case #"hash_9c8ed152deb360f":
        set_stayahead_values(1, 275, 25, 0.2);
        set_stayahead_values(2, 250, -100, 0.1);
        set_stayahead_values(3, 200, -175, 0.15);
        set_stayahead_values(4, 150, -275, 0.2);
        break;
    case #"hash_bba9a129e145fca9":
        var_7c5448d7e2eaa25c = -100;
        set_stayahead_values(1, 275, var_7c5448d7e2eaa25c);
        set_stayahead_values(2, 250, var_7c5448d7e2eaa25c + -200);
        set_stayahead_values(3, 200, var_7c5448d7e2eaa25c + -400);
        set_stayahead_values(4, 150, var_7c5448d7e2eaa25c + -600);
        break;
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f97
// Size: 0x8a
function function_320fe24554ccda96() {
    var_a00fc997ca8ad1e7 = spawn("script_model", (0, 0, 0));
    var_a00fc997ca8ad1e7 setmodel("body_c_jup_sp_hero_soap_bravo");
    var_a00fc997ca8ad1e7 attach("head_hero_soap_lod");
    var_a00fc997ca8ad1e7.animname = "soap";
    var_a00fc997ca8ad1e7 useanimtree(%generic_human);
    var_a00fc997ca8ad1e7.name = "Sgt. Soap";
    var_a00fc997ca8ad1e7.team = "Allies";
    var_a00fc997ca8ad1e7.callsign = "Bravo 7-1";
    return var_a00fc997ca8ad1e7;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x502a
// Size: 0x4f
function function_6f7d5f2ccbdabc52(bodymodel, headmodel) {
    if (isdefined(bodymodel)) {
        self setmodel(bodymodel);
    }
    if (isdefined(headmodel)) {
        self detach(self.headmodel);
        self.headmodel = headmodel;
        self attach(self.headmodel);
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5081
// Size: 0x17c
function function_99d87f0bb8ac7c26() {
    if (!function_c76fd5e29dc8733a()) {
        return;
    }
    if (isdefined(self.flashlight)) {
        return;
    }
    self.flashlight = spawnstruct();
    self.flashlight.active = 0;
    self.flashlight.disabled = 0;
    self.flashlight.entity = spawn_tag_origin();
    self.flashlight.entity linkto(level.price, "tag_flash", (0, 0, 0), (0, 0, 0), 1);
    self.flashlight.entity dontcastshadows();
    self.flashlight.entity show();
    playfxontag(getfx("vfx_flashback_flashlight_player"), self.flashlight.entity, "tag_origin");
    self.flashlight.active = 1;
    waittill_any("death", "flashlight_off");
    killfxontag(getfx("vfx_flashback_flashlight_player"), self.flashlight.entity, "tag_origin");
    self.flashlight.entity delaycall(0.05, &delete);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5205
// Size: 0x23f
function function_6ed0dee1084e9ab7() {
    if (!function_c76fd5e29dc8733a()) {
        return;
    }
    if (isdefined(level.player.flashlight)) {
        return;
    }
    level.player endon("death");
    level.player.flashlight = spawnstruct();
    level.player.flashlight.active = 0;
    level.player.flashlight.disabled = 0;
    level.player.flashlight.entity = spawn_tag_origin();
    level.player.flashlight.entity linktoplayerview(level.player, "tag_cambone", (8, 6, 0), (0, -5, 0), 1);
    level.player.flashlight.entity dontcastshadows();
    level.player.flashlight.entity show();
    level.player notifyonplayercommand("player_toggleFlashlight", "nightvision");
    level.player notifyonplayercommand("player_toggleFlashlight", "+actionslot " + 2);
    var_1df961b1843d823a = 0.5;
    gesture = "iw9_vm_ges_helmet_light";
    var_1c27f6a8dc60b827 = level.player getgestureanimlength(gesture) - var_1df961b1843d823a;
    while (true) {
        level.player waittill("player_toggleFlashlight");
        if (!function_a7cf7fb51de9f3af()) {
            continue;
        }
        if (function_6e39531cc592cd28()) {
            level.player forceplaygestureviewmodel(gesture, undefined, 0.2, undefined, 1, 0);
        }
        level.player playsound("weap_claymore_pullback");
        level.player playsound("laze_raise");
        wait var_1df961b1843d823a;
        if (function_edba0687176c53c1()) {
            function_2c5ca40bdec6bf41();
        } else {
            function_bbaf0f26376a3b45();
        }
        wait var_1c27f6a8dc60b827;
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x544c
// Size: 0x63
function function_92c8bceb92d62d7() {
    setomnvar("ui_nvg_equipped", 1);
    if (istrue(level.player.flashlight.active)) {
        level.player thread actionslotoverride(2, "hud_icon_equipment_flashlight_off");
        return;
    }
    level.player thread actionslotoverride(2, "hud_icon_equipment_flashlight_on");
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x54b7
// Size: 0x97
function function_143bd083c342d51c(point1, point2, dist) {
    level.player endon("death");
    dist = isdefined(dist) ? dist : 60;
    var_3426af371f511f64 = dist * dist;
    while (true) {
        var_e0f9ee0fce02500b = pointonsegmentnearesttopoint(point1, point2, level.player.origin);
        if (distancesquared(var_e0f9ee0fce02500b, level.player.origin) <= var_3426af371f511f64) {
            return;
        }
        wait 0.3;
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5556
// Size: 0x11
function function_c76fd5e29dc8733a() {
    return istrue(getdvarint(@"hash_a262744b5ef47a55"));
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5570
// Size: 0x94
function function_a7cf7fb51de9f3af() {
    if (function_35320483feab30cf()) {
        return false;
    }
    if (level.player isswitchingweapon()) {
        return false;
    }
    if (level.player isreloading()) {
        return false;
    }
    if (level.player isthrowinggrenade()) {
        return false;
    }
    if (level.player isthrowingbackgrenade()) {
        return false;
    }
    if (level.player islinked()) {
        return false;
    }
    if (level.player issprintsliding()) {
        return false;
    }
    if (level.player function_e5bf22923d0004bc()) {
        return false;
    }
    return true;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x560d
// Size: 0x55
function function_6e39531cc592cd28() {
    if (isnullweapon(level.player getcurrentweapon())) {
        return false;
    }
    if (level.player issprinting()) {
        return false;
    }
    if (level.player issupersprinting()) {
        return false;
    }
    if (!level.player isweaponsenabled()) {
        return false;
    }
    return true;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x566b
// Size: 0x5b
function function_2c5ca40bdec6bf41() {
    killfxontag(getfx("vfx_flashback_flashlight_player"), level.player.flashlight.entity, "tag_origin");
    level.player.flashlight.active = 0;
    function_92c8bceb92d62d7();
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x56ce
// Size: 0x5c
function function_bbaf0f26376a3b45() {
    playfxontag(getfx("vfx_flashback_flashlight_player"), level.player.flashlight.entity, "tag_origin");
    level.player.flashlight.active = 1;
    function_92c8bceb92d62d7();
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5732
// Size: 0x37
function function_35320483feab30cf() {
    return isdefined(level.player.flashlight) && level.player.flashlight.disabled;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5772
// Size: 0x2a
function function_ccbfc45de2cc4d85(boolean) {
    level.player.flashlight.disabled = boolean;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57a4
// Size: 0x37
function function_edba0687176c53c1() {
    return isdefined(level.player.flashlight) && level.player.flashlight.active;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57e4
// Size: 0x37
function function_cd218b2d5f292a7a() {
    return isdefined(level.player.flashlight) && !level.player.flashlight.active;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5824
// Size: 0x3a
function function_ac9e0dd61a369f3d() {
    if (!function_c76fd5e29dc8733a()) {
        return;
    }
    level.player endon("death");
    wait 2.5;
    if (!function_edba0687176c53c1()) {
        level.player notify("player_toggleFlashlight");
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5866
// Size: 0x18
function function_903aa2d02299e3dc() {
    self waittillmatch("single anim", "end");
    self hide();
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5886
// Size: 0xd6
function player_pov_animated(val) {
    if (val) {
        level.player val::set("player_pov_animated", "cinematic_motion", 0);
        utility::function_1ae8f046dee579e0(val);
        level.player lerpfovscalefactor(0, 1);
        level.player cleardamageindicators();
        level.player disableweapons();
        level.player disableweaponswitch();
        return;
    }
    level.player val::reset_all("player_pov_animated");
    utility::function_1ae8f046dee579e0(val);
    level.player function_af4b9b0f0e7c6c42(0.5);
    level.player enableweapons();
    level.player enableweaponswitch();
    level.player lerpfovscalefactor(1, 1);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5964
// Size: 0x2c
function function_f466456cb68bebec(var_a4facbdb28a053df) {
    setomnvar("ui_show_objectives", 1);
    flag_wait(var_a4facbdb28a053df);
    setomnvar("ui_show_objectives", 0);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5998
// Size: 0x26
function function_a2b3c681b581f9a5(time) {
    setomnvar("ui_show_objectives", 1);
    wait time;
    setomnvar("ui_show_objectives", 0);
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59c6
// Size: 0xf2
function function_96ef51c945a57bf7() {
    self endon("death");
    if (!isdefined(self.magic_bullet_shield)) {
        thread magic_bullet_shield(1);
    }
    while (true) {
        self waittill("damage", damage, attacker, null, null, meansofdeath, null, null, null, null, objweapon, null, null, null, inflictor);
        isplayerattacker = is_equal(attacker, level.player);
        isflashed = isweapon(objweapon) && is_equal(objweapon.basename, "flash");
        if (istrue(isplayerattacker)) {
            if (istrue(isflashed)) {
                function_18d89ed474e2ba20();
                level.var_b50962a9f0337ba2 = gettime();
                continue;
            }
            civdeathinstafail();
        }
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ac0
// Size: 0x33e
function injured_dmg_death_logic() {
    self endon("entitydeleted");
    self endon("stop_injured_dmg_death_logic");
    if (!isdefined(self.magic_bullet_shield)) {
        thread magic_bullet_shield(1);
    }
    self.health = 9999;
    var_9a314f2acce7401c = 0;
    self.var_9fc4633f94fe22ee = 0;
    while (!var_9a314f2acce7401c) {
        self waittill("damage", damage, attacker, null, null, meansofdeath, null, null, null, null, objweapon, null, null, null, inflictor);
        if (!isai(self) && isdefined(objweapon)) {
            self.damageweapon = objweapon;
        }
        if (!isai(self) && isdefined(attacker)) {
            self.lastattacker = attacker;
        }
        if (is_equal(meansofdeath, "MOD_IMPACT") && isweapon(objweapon) && is_equal(objweapon.classname, "grenade")) {
            continue;
        }
        isflashed = isweapon(objweapon) && is_equal(objweapon.basename, "flash");
        var_c7839f86371dc123 = isweapon(objweapon) && is_equal(objweapon.basename, "frag");
        waitframe();
        if (istrue(self.var_137740b3477936a3)) {
            continue;
        }
        isplayerattacker = is_equal(attacker, level.player);
        if (istrue(isplayerattacker) && (istrue(var_c7839f86371dc123) || is_equal(meansofdeath, "MOD_GRENADE_SPLASH"))) {
            civdeathinstafail(530);
        }
        if (istrue(isplayerattacker) && istrue(isflashed)) {
            if (istrue(self.var_9fc4633f94fe22ee)) {
                continue;
            }
            function_18d89ed474e2ba20();
            level.var_b50962a9f0337ba2 = gettime();
        }
        var_c66ca565bf0cd3ad = isflashed;
        if (istrue(isplayerattacker) && !var_c66ca565bf0cd3ad) {
            var_c66ca565bf0cd3ad = mydeathaccidental();
        }
        if (istrue(isplayerattacker)) {
            if (isdefined(inflictor) && isdefined(inflictor.code_classname) && inflictor.code_classname == "scriptable") {
                continue;
            }
            if (istrue(self.skip_friendly_fire_check)) {
                continue;
            }
            if (!var_c66ca565bf0cd3ad || istrue(self.var_2dd755c521498bb5)) {
                civdeathinstafail();
                if (!getdvarint(@"hash_16956aedc3a8b7a6")) {
                    return;
                }
            }
            if (isflashed || var_c66ca565bf0cd3ad && !istrue(self.var_c40df04a29c12024)) {
                var_a29f1113e4b0267d = 0;
                if (!isdefined(level.var_6500255cf133afef)) {
                    var_a29f1113e4b0267d = 1;
                } else if (time_has_passed(level.var_6500255cf133afef, 7)) {
                    var_a29f1113e4b0267d = 1;
                }
                if (var_a29f1113e4b0267d) {
                    thread function_7a6c5b7dc4ad10ad();
                    level.var_6500255cf133afef = gettime();
                }
            }
        }
        if (istrue(isplayerattacker) && !isflashed || isai(attacker) && !istrue(self.var_137740b3477936a3)) {
            stop_magic_bullet_shield();
            self dodamage(self.health + 1, self geteye(), self.lastattacker, undefined, meansofdeath);
            var_9a314f2acce7401c = 1;
        }
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e06
// Size: 0x4e
function function_18d89ed474e2ba20() {
    if (!function_73bebd07680d26ed() && !function_d1d49eb192f325c3()) {
        level.civ_only_flash++;
        thread record_civ_only_flash();
        if (level.civ_only_flash > 1 && flag("civ_only_flash")) {
            civdeathinstafail();
            return;
        }
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e5c
// Size: 0x36
function record_civ_only_flash() {
    level notify("record_civ_only_flash");
    level endon("record_civ_only_flash");
    flag_set("civ_only_flash");
    wait 10;
    flag_clear("civ_only_flash");
    level.civ_only_flash = 0;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e9a
// Size: 0x23
function function_73bebd07680d26ed() {
    return isdefined(level.var_7d2f398b2e524791) && gettime() - level.var_7d2f398b2e524791 < 1000;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ec6
// Size: 0x23
function function_d1d49eb192f325c3() {
    return isdefined(level.var_b50962a9f0337ba2) && gettime() - level.var_b50962a9f0337ba2 < 1000;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ef2
// Size: 0x16e
function function_7a6c5b7dc4ad10ad() {
    if (!isdefined(level.player.var_c968bf2d654605a2)) {
        array = ["dx_sp_flas_stcn_pric_youhitacivilian", "dx_sp_flas_stcn_pric_watchforcivilians", "dx_sp_flas_stcn_pric_soap", "dx_sp_flas_stcn_pric_soapthatwasacivilian"];
        level.player.var_c968bf2d654605a2 = utility::create_deck(array, 1, 1);
        array = ["dx_sp_flas_stcn_soap_fuck", "dx_sp_flas_stcn_soap_goddamnit", "dx_sp_flas_stcn_soap_iknow", "dx_sp_flas_stcn_soap_no"];
        level.player.var_cc1319a80aeb18cf = utility::create_deck(array, 1, 1);
    }
    level.var_8c6454a0afea5a5c = default_to(level.var_8c6454a0afea5a5c, 0);
    if (!level.var_8c6454a0afea5a5c) {
        level.var_8c6454a0afea5a5c = 1;
        if (isdefined(level.price) && !level.price function_754c9897f3b89964()) {
            if (!flag("pause_warning_vo")) {
                level.price say(level.player.var_c968bf2d654605a2 utility::deck_draw());
                wait 0.2;
                level.player say(level.player.var_cc1319a80aeb18cf utility::deck_draw());
            }
        }
        level.var_8c6454a0afea5a5c = 0;
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6068
// Size: 0x341
function mydeathaccidental() {
    enemies = getaiarrayinradius(self.origin, 2000, "axis");
    var_540b1f0e6713eb17 = 70;
    foreach (enemy in enemies) {
        var_a54377c4f9622c00 = 20;
        var_d23330c24d31370 = self.origin - enemy.origin;
        var_4f5c95bc8bafbda3 = level.player.origin - enemy.origin;
        var_36dfe66573ae87a5 = anglebetweenvectors(var_d23330c24d31370, var_4f5c95bc8bafbda3);
        /#
            if (getdvarint(@"hash_16956aedc3a8b7a6")) {
                if (var_36dfe66573ae87a5 > var_a54377c4f9622c00) {
                    iprintlnbold("<dev string:x38>");
                } else {
                    iprintlnbold("<dev string:x49>");
                }
                line(enemy.origin, self.origin, (1, 0, 0), 1, 0, 60);
                line(enemy.origin, level.player.origin, (0, 0, 1), 1, 0, 60);
                print3d(enemy.origin, "<dev string:x66>" + var_36dfe66573ae87a5, undefined, undefined, undefined, 60);
            }
        #/
        var_daac9dfb96187f1d = enemy.origin + (0, 0, 40);
        if (in_screen_center(var_daac9dfb96187f1d, var_540b1f0e6713eb17) && player_can_see_ai(level.player, enemy) && distance2dsquared(self.origin, enemy.origin) > 8100 && var_36dfe66573ae87a5 > var_a54377c4f9622c00) {
            /#
                if (getdvarint(@"hash_16956aedc3a8b7a6")) {
                    print3d(self.origin, "<dev string:x6e>" + distance(enemy.origin, self.origin), (0, 1, 0), 1, 0.45, 60, 1);
                    line(enemy.origin, self.origin, (0, 1, 0), 1, 0, 60);
                }
            #/
            return true;
        }
    }
    var_edc0cc13e0cf9b9e = level.player friendlyfire::get_most_recent_dmg_or_death_time();
    var_a39f4bf42d467e06 = gettime() - var_edc0cc13e0cf9b9e;
    if (var_a39f4bf42d467e06 <= function_a3e593a2a94f74b1()) {
        /#
            if (getdvarint(@"hash_16956aedc3a8b7a6")) {
                print3d(self.origin, "<dev string:x82>", (0, 1, 0), 1, 0.45, 60, 1);
            }
        #/
        return true;
    }
    /#
        if (getdvarint(@"hash_16956aedc3a8b7a6")) {
            print3d(self.origin, "<dev string:x95>", (1, 0, 0), 1, 0.6, 60, 1);
        }
    #/
    return false;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x63b2
// Size: 0xa0
function isenemyinfrontofme(enemy, var_3b37ca6ec4d56e75) {
    dir = vectornormalize((enemy.origin - self.origin) * (1, 1, 0));
    dir = vectornormalize((enemy.origin - self gettagorigin("tag_eye")) * (1, 1, 0));
    fwd = anglestoforward(self.angles);
    dot = vectordot(dir, fwd);
    return dot > 0;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x645b
// Size: 0x71
function function_a3e593a2a94f74b1() {
    gameskill = scripts\sp\analytics::get_gameskill_as_string();
    switch (gameskill) {
    case #"hash_2fc8332783e61561":
        return 1000;
    case #"hash_bbbbeacfa1d3f357":
        return 700;
    case #"hash_ceb5b5ffdddbe1ce":
        return 100;
    case #"hash_4d059e78f7f34154":
    case #"hash_c6fc7812335fee70":
        return 0;
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x64d4
// Size: 0x103
function in_screen_center(origin, var_9508c0c70b32eda1) {
    screenpos = level.player worldpointtoscreenpos(origin, getdvarint(@"hash_b38fcf293d1e91a8"));
    var_965692a832999e3 = squared(var_9508c0c70b32eda1);
    if (isdefined(screenpos)) {
        distsqrd = length2dsquared(screenpos);
        /#
            if (getdvarint(@"hash_16956aedc3a8b7a6")) {
                print3d(origin + (0, 0, 55), "<dev string:x9e>" + sqrt(distsqrd), (1, 1, 1), 1, 0.7, 60, 1);
            }
        #/
        if (distsqrd <= var_965692a832999e3) {
            /#
                if (getdvarint(@"hash_16956aedc3a8b7a6")) {
                    line(origin + (0, 0, 25), origin + (0, 0, 1000), (0, 1, 0), 1, 0, 60);
                }
            #/
            return true;
        }
    }
    return false;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x65e0
// Size: 0xcb
function civdeathinstafail(var_737110a53ad00863) {
    if (getdvarint(@"hash_16956aedc3a8b7a6")) {
        /#
            iprintlnbold("<dev string:xb1>");
        #/
        return;
    }
    if (level.missionfailed) {
        return;
    }
    gameskill = scripts\sp\analytics::get_gameskill_as_string();
    switch (gameskill) {
    case #"hash_2fc8332783e61561":
    case #"hash_bbbbeacfa1d3f357":
    case #"hash_ceb5b5ffdddbe1ce":
        quote = 9;
        break;
    case #"hash_4d059e78f7f34154":
    case #"hash_c6fc7812335fee70":
        quote = 30;
        break;
    }
    if (isdefined(var_737110a53ad00863)) {
        assert(isnumber(var_737110a53ad00863));
        quote = var_737110a53ad00863;
    }
    scripts\sp\player_death::set_custom_death_quote(quote);
    missionfailedwrapper();
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x66b3
// Size: 0x14e
function function_66d93860c587390b(gender) {
    if (!isdefined(level.corpses)) {
        level.corpses = [];
    }
    if (!isdefined(level.var_bf6a64ec97429cc6)) {
        function_8f5dcde85768ead();
    }
    var_fa15d01b439ee739 = randomint(100) < 50 ? "actor_jup_civilian_rus_male_flashback" : "actor_jup_civilian_rus_female_flashback";
    if (isdefined(gender)) {
        assert(gender == "male" || gender == "female");
        classname = gender == "male" ? "actor_jup_civilian_rus_male_flashback" : "actor_jup_civilian_rus_female_flashback";
    } else {
        classname = var_fa15d01b439ee739;
    }
    actor = fakeactor::function_d9469562fdbb08bc(classname, self.origin, self.angles);
    actor.origin = scripts\engine\utility::drop_to_ground(self.origin, 10);
    actor.angles = (0, randomint(270), 0);
    waitframe();
    level.corpses[level.corpses.size] = actor;
    xanim = level.var_bf6a64ec97429cc6["deadbody_0" + randomintrange(1, 9)];
    actor setanim(xanim, 1, 0.05, 0);
    actor notsolid();
    waitframe();
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6809
// Size: 0xfb
function function_8f5dcde85768ead() {
    if (isdefined(level.var_bf6a64ec97429cc6)) {
        return;
    }
    level.var_bf6a64ec97429cc6 = [];
    level.var_bf6a64ec97429cc6["deadbody_01"] = generic_human%deadbody_01;
    level.var_bf6a64ec97429cc6["deadbody_02"] = generic_human%deadbody_02;
    level.var_bf6a64ec97429cc6["deadbody_03"] = generic_human%deadbody_03;
    level.var_bf6a64ec97429cc6["deadbody_04"] = generic_human%deadbody_04;
    level.var_bf6a64ec97429cc6["deadbody_05"] = generic_human%deadbody_05;
    level.var_bf6a64ec97429cc6["deadbody_06"] = generic_human%deadbody_06;
    level.var_bf6a64ec97429cc6["deadbody_07"] = generic_human%deadbody_07;
    level.var_bf6a64ec97429cc6["deadbody_08"] = generic_human%deadbody_08;
    level.var_bf6a64ec97429cc6["deadbody_09"] = generic_human%deadbody_09;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x690c
// Size: 0xb7
function function_927c2b2ed0e4ca85(weapon_basename) {
    assert(isai(self));
    fake_weapon = spawn("script_model", (0, 0, 0));
    fake_weapon make_weapon_model(weapon_basename);
    fake_weapon dontinterpolate();
    fake_weapon.origin = self gettagorigin("tag_weapon_left");
    fake_weapon.angles = self gettagangles("tag_weapon_left");
    fake_weapon linkto(self, "tag_weapon_right", (0, 0, 0), (0, 0, 0));
    fake_weapon.owner = self;
    fake_weapon thread function_a1cbeb0b29becc97();
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x69cb
// Size: 0x210
function kill_civs_til_player_sees_me() {
    self endon("death");
    while (self isinscriptedstate()) {
        waitframe();
    }
    self setthreatbiasgroup("kill_civs");
    var_2edc046f1bfd7d8b = 1;
    scripts\asm\juggernaut\juggernaut::enable_casual_killer();
    minspeed = getdvarfloat("ai_enemySpeedScaleMultMin", 0.91);
    maxspeed = getdvarfloat("ai_enemySpeedScaleMultMax", 1.06);
    if (maxspeed <= minspeed) {
        maxspeed = minspeed + 0.01;
    }
    self.speedscalemult = randomfloatrange(minspeed, maxspeed);
    civ_killer_internal();
    /#
        if (getdvarint("<dev string:xbb>")) {
            thread draw_line_from_ent_for_time(self, self.origin + (0, 0, 200), 1, 0, 0, 5);
        }
    #/
    enemy = self.enemy;
    self setthreatbiasgroup("axis");
    self notify("stop_going_to_node");
    scripts\asm\juggernaut\juggernaut::disable_casual_killer();
    self.favoriteenemy = level.player;
    self forcethreatupdate();
    if (istrue(self.ignoreme)) {
        self.ignoreme = 0;
    }
    while (isdefined(self.enemy) && isdefined(enemy) && !isplayer(self.enemy) && self.enemy == enemy) {
        waitframe();
    }
    if (!isdefined(self.enemy)) {
        self getenemyinfo(level.player);
    }
    while (!isdefined(self.enemy)) {
        waitframe();
    }
    while (istrue(self.casualkiller)) {
        waitframe();
    }
    if (isdefined(self.weapon.classname) && self.weapon.classname == "mg") {
        set_movement_speed(randomfloatrange(130, 150));
        self.maxfaceenemydist = 512;
        waitframe();
        charge_enemy(5);
    }
    self.goalradius = 700;
    self notify("civ_killer_end");
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6be3
// Size: 0x19d
function charge_enemy(duration) {
    self endon("death");
    if (isplayer(self.enemy)) {
        enemy = self.enemy;
        self setgoalentity(enemy);
        end = gettime() + duration * 1000;
        self.goalradius = 32;
        self.meleechargedistvsplayer = 400;
        self.meleemaxzdiff = 500;
        self.meleetargetallowedoffmeshdistsq = 225;
        self.meleetryhard = 1;
        while (isalive(self.enemy) && isalive(enemy) && self.enemy == enemy && gettime() < end) {
            /#
                if (getdvarint("<dev string:xbb>")) {
                    print3d(self.origin + (0, 0, 70), "<dev string:xd3>", (1, 1, 1), 1, 0.6, 2, 1);
                }
            #/
            self setgoalentity(enemy);
            disttoenemy = distance2d(self.origin, enemy.origin);
            if (disttoenemy < 150 && abs(self.lookaheaddist - disttoenemy) < 20) {
                break;
            }
            wait 0.1;
        }
    }
    self setgoalpos(self.origin);
    self.meleechargedistvsplayer = 200;
    self.meleemaxzdiff = 36;
    self.meleetargetallowedoffmeshdistsq = undefined;
    self.meleetryhard = undefined;
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d88
// Size: 0x4d3
function civ_killer_internal() {
    self endon("stop_killing_civs");
    var_5017e31206b1e83c = 0;
    var_42e24069bcceeba7 = 60;
    var_6a606a6c2429787f = 0;
    var_18b7329e0dd8c20a = 120;
    var_953480c018035e82 = cos(10);
    var_b8c4582768e52639 = cos(45);
    var_ea9ca0cd29b0a7ac = gettime();
    var_bd33b06019fe7973 = 0;
    while (true) {
        if (isdefined(self.lastattacker) && (isplayer(self.lastattacker) || within_fov(level.player.origin, level.player.angles, self.origin, cos(75)))) {
            break;
        }
        var_8a6800e5cabf00b2 = scripts\engine\trace::ray_trace_passed(level.player geteye(), self geteye(), [level.player, self], scripts\engine\trace::create_contents(1, 1, 0, 1, 0, 1, 0, 1, 1));
        if (distancesquared(self.origin, level.player.origin) <= 90000 && var_8a6800e5cabf00b2) {
            /#
                if (getdvarint("<dev string:xbb>")) {
                    print3d(self.origin + (0, 0, 85), "<dev string:xe3>", (1, 0, 1), 1, 0.25, 40, 1);
                }
            #/
            break;
        }
        if (!istrue(self.ignoreme) && distancesquared(self.origin, level.player.origin) <= 640000 && within_fov(level.player.origin, level.player.angles, self.origin, var_953480c018035e82) && var_8a6800e5cabf00b2) {
            var_5017e31206b1e83c++;
            /#
                if (getdvarint("<dev string:xbb>")) {
                    print3d(self.origin + (0, 0, 85), "<dev string:xfa>" + var_5017e31206b1e83c, (1, 1, 1), 1, 0.25, 1, 1);
                }
            #/
            if (var_5017e31206b1e83c == var_42e24069bcceeba7) {
                break;
            }
            if (!istrue(var_bd33b06019fe7973) && isdefined(level.player.lastweaponfiredtime) && gettime() - level.player.lastweaponfiredtime <= 500) {
                /#
                    if (getdvarint("<dev string:xbb>")) {
                        print3d(self.origin + (0, 0, 95), "<dev string:x10c>", (1, 0, 0), 1, 0.55, 40, 1);
                    }
                #/
                break;
            }
        } else if (!istrue(self.ignoreme) && distancesquared(self.origin, level.player.origin) <= 1440000 && within_fov(level.player.origin, level.player.angles, self.origin, var_b8c4582768e52639) && var_8a6800e5cabf00b2) {
            var_6a606a6c2429787f++;
            /#
                if (getdvarint("<dev string:xbb>")) {
                    print3d(self.origin + (0, 0, 85), "<dev string:x119>" + var_6a606a6c2429787f, (1, 1, 1), 1, 0.25, 1, 1);
                }
            #/
            if (var_6a606a6c2429787f == var_18b7329e0dd8c20a) {
                break;
            } else if (isdefined(self._blackboard) && istrue(self._blackboard.shootparams_starttime) && gettime() - self._blackboard.shootparams_starttime >= 3000) {
                /#
                    if (getdvarint("<dev string:xbb>")) {
                        print3d(self.origin + (0, 0, 95), "<dev string:x12a>", (1, 1, 0), 1, 0.55, 40, 1);
                    }
                #/
                break;
            }
        } else {
            /#
                if (getdvarint("<dev string:xbb>")) {
                    print3d(self.origin + (0, 0, 75), "<dev string:x146>", (1, 0, 0), 1, 0.25, 1, 1);
                }
            #/
            var_bb62c2b47bea42d0 = 0;
        }
        waitframe();
    }
}

// Namespace namespace_47819225b08b445d / namespace_cb688294d98f4fa4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7263
// Size: 0x41
function function_5da13e5444950c67(ents, theflag) {
    if (!flag_exist(theflag)) {
        flag_init(theflag);
    }
    while (ents.size) {
        ents = array_removedead_or_dying(ents, 1);
        waitframe();
    }
    flag_set(theflag);
}

#namespace fake_stealth;

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72ac
// Size: 0x1b9
function fake_stealth(var_b8e45a3a7cc24dd9) {
    /#
        setdvarifuninitialized(@"hash_22b0eb7aa92d7d32", 0);
    #/
    self endon("death");
    self endon("stop_fake_stealth");
    utility::set_battlechatter(0);
    self.var_6a5c7ed86ee99c0f = 1;
    function_ce78fcefc5534fd6(self, level.player, 0);
    add_damage_function(&on_damage);
    if (!isdefined(self.fake_enemy)) {
        self.dontevershoot = 1;
        self.ignoreall = 1;
    }
    if (!istrue(var_b8e45a3a7cc24dd9)) {
        self.proximity_trig = spawn("trigger_radius", self.origin, 0, 80, 60);
        childthread proximity();
    }
    thread function_da6f6072e43603c1();
    childthread function_7b079e7975b0610a();
    if (!flag_exist(self.targetname + "_atacking")) {
        flag_init(self.targetname + "_atacking");
    }
    self builtin [[ level.addaieventlistener_func ]]("projectile_impact");
    self builtin [[ level.addaieventlistener_func ]]("bulletwhizby");
    self builtin [[ level.addaieventlistener_func ]]("gunshot");
    self builtin [[ level.addaieventlistener_func ]]("explosion");
    self builtin [[ level.addaieventlistener_func ]]("gunshot_teammate");
    while (true) {
        self waittill("ai_events", events);
        foreach (event in events) {
            if (function_cbb93915673bd899(event)) {
                thread attack_player();
                return;
            }
        }
    }
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x746d
// Size: 0x80
function proximity() {
    while (true) {
        self.proximity_trig waittill("trigger", who);
        if (is_equal(who, level.player)) {
            if (!function_820ff29c7a8d852b()) {
                wait 2.5;
            }
            if (istrue(self.in_melee_death)) {
                return;
            }
            self aieventlistenerevent("gunshot", level.player, level.player.origin);
        }
    }
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x74f5
// Size: 0x99
function on_damage(amount, attacker, direction_vec, damagelocation, meansofdeath, modelname, tagname, partname, dflags, objweapon) {
    if (is_equal(attacker, level.player)) {
        waitframe();
        if (function_352e1c645501ea0f()) {
            self aieventlistenerevent("gunshot", level.player, level.player.origin);
        }
    }
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7596
// Size: 0xee
function function_cbb93915673bd899(event) {
    if (isdefined(event)) {
        if (isdefined(event.entity) && event.entity == level.player) {
            return true;
        }
        if (is_equal(event.type, "gunshot_teammate") && is_equal(event.entity.team, "axis") && event.entity function_352e1c645501ea0f()) {
            return false;
        }
        if (is_equal(event.entity.team, "axis") && isdefined(event.entity.enemy) && isplayer(event.entity.enemy)) {
            return true;
        }
    }
    return false;
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x768d
// Size: 0x1b4
function attack_player() {
    self endon("death");
    /#
        if (getdvarint(@"hash_22b0eb7aa92d7d32")) {
            print3d(self.origin + (0, 0, 90), "<dev string:x152>", (1, 1, 1), 1, 0.7, 40);
        }
    #/
    if (!isdefined(self.var_6a5c7ed86ee99c0f)) {
        return;
    }
    self.var_6a5c7ed86ee99c0f = undefined;
    self.dontevershoot = 0;
    self.var_2bccfebe0b2b566 = undefined;
    self.forcesixthsense = undefined;
    self.dontattackme = 0;
    self.ignoreall = 0;
    remove_damage_function(&on_damage);
    self notify("stop_fake_shooting");
    function_2fe3222810af45f4(self, level.player);
    self function_9f82c74eb1b7caf9(1);
    if (isdefined(self.fake_enemy)) {
        self.fake_enemy delete();
    }
    self setthreatbiasgroup("axis");
    if (isdefined(self.proximity_trig)) {
        self.proximity_trig delete();
    }
    if (istrue(self.using_goto_node)) {
        self notify("stop_going_to_node");
    }
    if (!function_d5e8d37448f98cbf() && self isinscriptedstate()) {
        wait randomfloat(0.3);
        self stopanimscripted();
    }
    self getenemyinfo(level.player);
    set_favoriteenemy(level.player);
    self.lastenemysightpos = level.player.origin;
    thread close_in_on_player();
    if (istrue(self.sprint)) {
        disable_sprint();
    }
    utility::set_battlechatter(1);
    self notify("stop_fake_stealth");
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7849
// Size: 0x6c
function close_in_on_player() {
    self endon("death");
    self getenemyinfo(level.player);
    self cleargoalvolume();
    self.goalradius = 600 + randomint(150);
    self setgoalentity(level.player);
    while (true) {
        wait 15;
        self.goalradius = max(300, self.goalradius - 100);
    }
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x78bd
// Size: 0xfb
function function_eaa76231b90b51cc() {
    if (!isdefined(self.var_6a5c7ed86ee99c0f)) {
        return;
    }
    self.var_6a5c7ed86ee99c0f = undefined;
    self.dontevershoot = 0;
    self.var_2bccfebe0b2b566 = undefined;
    self.forcesixthsense = undefined;
    self.dontattackme = 0;
    self.ignoreall = 0;
    self notify("stop_fake_shooting");
    if (isdefined(self.fake_enemy)) {
        self.fake_enemy delete();
    }
    self setthreatbiasgroup("axis");
    if (istrue(self.using_goto_node)) {
        self notify("stop_going_to_node");
    }
    if (!function_d5e8d37448f98cbf() && self isinscriptedstate()) {
        self stopanimscripted();
    }
    self.script_stealthgroup = self.targetname;
    scripts\stealth\enemy::main();
    self [[ self.fnsetstealthstate ]]("combat");
    if (isdefined(self.proximity_trig)) {
        self.proximity_trig delete();
    }
    self notify("stop_fake_stealth");
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x79c0
// Size: 0x2c
function function_d5e8d37448f98cbf() {
    if (isalive(self)) {
        if (istrue(self.in_melee_death)) {
            return true;
        }
        if (istrue(self.in_melee)) {
            return true;
        }
    }
    return false;
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x79f5
// Size: 0xc
function function_352e1c645501ea0f() {
    return istrue(self.var_6a5c7ed86ee99c0f);
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a0a
// Size: 0x34
function function_9be1d289369f8e9f() {
    gun = scripts\sp\scripted_weapon_assignment::function_dccb603d3e9a2268("ar", "iw9_ar_mike4_sp", ["iw9_ar_mike4_sp"]);
    namespace_223959d3e5206cfb::forceuseweapon(gun, "primary");
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a46
// Size: 0x98
function function_db82f8ce7bfd4cfb() {
    prefix = "dx_bc_pmcc_enmy_pmc";
    num = randomintrange(1, 6);
    suffix = undefined;
    chance = randomint(100);
    if (chance < 33) {
        suffix = "_wegotbadguys";
    } else if (chance < 66) {
        suffix = "_visualonatarget";
    } else {
        suffix = "_wegotbadguys";
    }
    alias = prefix + num + suffix;
    function_8c1bbaeb5d3fe61a(0.15 + randomfloat(0.6), alias, 1, 0);
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ae6
// Size: 0x2
function function_da6f6072e43603c1() {
    
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7af0
// Size: 0x39
function function_5f6f363af48a609f(attacker) {
    if (isplayer(attacker)) {
        return true;
    }
    if (isai(attacker) && attacker.team == "allies") {
        return true;
    }
    return false;
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7b32
// Size: 0x46
function function_a39b84e9824d953(targetname, guy) {
    if (isalive(guy) && is_equal(targetname, guy.targetname) && isdefined(guy.var_6a5c7ed86ee99c0f)) {
        return true;
    }
    return false;
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b81
// Size: 0x35e
function function_7b079e7975b0610a() {
    var_12841bb548591ab = 3;
    var_eeac85893e8a4243 = var_12841bb548591ab * 20;
    var_9bf36bab3cfb690c = 0;
    red = (1, 0, 0);
    white = (1, 1, 1);
    green = (0, 1, 0);
    color = white;
    lookat = 0;
    can_see = 0;
    frames = 0;
    wait 1.5;
    while (true) {
        if (function_820ff29c7a8d852b()) {
            var_9bf36bab3cfb690c++;
            can_see = 1;
            var_237d5bc06122a730 = int(min(var_9bf36bab3cfb690c, var_eeac85893e8a4243));
            var_7948b622ed1b1265 = math::normalize_value(0, var_eeac85893e8a4243, var_237d5bc06122a730);
            var_7948b622ed1b1265 = math::round_float(var_7948b622ed1b1265, 1, 0);
            /#
                if (getdvarint(@"hash_22b0eb7aa92d7d32")) {
                    print3d(self.origin + (0, 0, 70), var_7948b622ed1b1265, white, 1, 0.7, 1);
                }
            #/
            function_c1d35e4e21d91ca0(self, var_7948b622ed1b1265, level.player);
            color = red;
        } else {
            var_9bf36bab3cfb690c--;
            can_see = 0;
            var_9bf36bab3cfb690c = int(max(var_9bf36bab3cfb690c, 0));
            color = white;
            function_c1d35e4e21d91ca0(self, 0, level.player);
        }
        if (istrue(can_see) && function_dd9a2002a1e0971c()) {
            thread function_5ead310b9d36abc5();
        } else if (!can_see && istrue(self.var_e8b0cb3127dc0a21)) {
            function_a198fcc32b0f164c();
        }
        if (can_see) {
            if (is_equal(self.targetname, "intro_runner")) {
                dist = 1000;
            } else {
                dist = distance(level.player.origin, self.origin);
            }
            var_12841bb548591ab = int(dist / 100);
            var_eeac85893e8a4243 = var_12841bb548591ab * 20;
            /#
                if (getdvarint(@"hash_22b0eb7aa92d7d32")) {
                    print3d(self.origin + (0, 0, 70), var_9bf36bab3cfb690c + "<dev string:x15d>" + var_eeac85893e8a4243, color, 1, 0.7, 1);
                }
            #/
        }
        if (var_9bf36bab3cfb690c >= var_eeac85893e8a4243) {
            /#
                if (getdvarint(@"hash_22b0eb7aa92d7d32")) {
                    print3d(self.origin + (0, 0, 70), "<dev string:x161>", white, 1, 0.7, 40);
                }
            #/
            if (!function_6768c387fe224b2(self, 1) && !self isinscriptedstate()) {
                self.dontevershoot = 0;
                self.dontattackme = 0;
                self.ignoreall = 0;
                if (!function_d5e8d37448f98cbf()) {
                    function_db82f8ce7bfd4cfb();
                }
                waittill_notify_or_timeout_return("weapon_fired", 1.3);
            }
            self aieventlistenerevent("gunshot", level.player, level.player.origin);
            return;
        }
        waitframe();
        frames++;
        if (frames == 30) {
            if (isdefined(self.proximity_trig)) {
                self.proximity_trig.origin = self.origin;
            }
            function_ecf2a28d41191c8f();
            frames = 0;
        }
    }
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ee7
// Size: 0xc9
function function_ecf2a28d41191c8f() {
    guys = getaiarrayinradius(self.origin, 1000, "axis");
    foreach (guy in guys) {
        if (isdefined(guy.stealth) && isdefined(guy.var_fe5ebefa740c7106) && guy.var_fe5ebefa740c7106 == 3 && self cansee(guy, 0)) {
            self aieventlistenerevent("gunshot", level.player, level.player.origin);
        }
    }
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7fb8
// Size: 0x8e
function function_5ead310b9d36abc5() {
    self endon("death");
    if (isdefined(self.fake_enemy)) {
        self.fake_enemy endon("death");
        self.fake_enemy.ignoreme = 1;
    }
    self.dontevershoot = 1;
    wait randomfloatrange(0.3, 0.6) + randomfloatrange(0.4, 0.7);
    self.var_4fa1e6ddf6819f93 = gettime();
    self.var_e8b0cb3127dc0a21 = 1;
    thread namespace_17a0e830dd8fa113::enablelookatplayer(0.5, 1);
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x804e
// Size: 0x3f
function function_a198fcc32b0f164c() {
    namespace_17a0e830dd8fa113::disablelookatplayer();
    if (isdefined(self.fake_enemy)) {
        self.fake_enemy.ignoreme = 0;
    }
    self.dontevershoot = 0;
    self.var_e8b0cb3127dc0a21 = undefined;
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8095
// Size: 0x89
function function_dd9a2002a1e0971c() {
    if (istrue(self.var_e8b0cb3127dc0a21)) {
        return false;
    }
    if (istrue(self.sprint)) {
        return false;
    }
    if (self isinscriptedstate()) {
        return false;
    }
    if (is_equal(self.targetname, "intro_runner")) {
        return false;
    }
    if (!isdefined(self.var_e8b0cb3127dc0a21)) {
        if (isdefined(self.var_4fa1e6ddf6819f93) && gettime() - self.var_4fa1e6ddf6819f93 > 3000) {
            return true;
        }
        if (!isdefined(self.var_4fa1e6ddf6819f93)) {
            return true;
        }
    }
    return false;
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8127
// Size: 0x143
function function_820ff29c7a8d852b() {
    if (level.player.ignoreme || function_d5e8d37448f98cbf()) {
        return 0;
    }
    dist = function_10cf685da2bffeda("hidden", level.player getstance());
    if (!isdefined(dist)) {
        dist = function_7f25c24e04909aca();
    }
    if (distancesquared(self.origin, level.player.origin) < dist * dist) {
        normal = vectornormalize(level.player geteye() - self geteye());
        forward = anglestoforward(self gettagangles("tag_eye"));
        dot = vectordot(forward, normal);
        fov = function_6499ce579643b0e5();
        if (getdvarint(@"hash_22b0eb7aa92d7d32")) {
            function_6b612dc73d8da5e9(fov, dist);
        }
        if (dot >= cos(fov)) {
            return scripts\engine\trace::ray_trace_passed(self geteye(), level.player geteye(), [self, level.player], scripts\engine\trace::create_contents(1, 1, 0, 1, 0, 1));
        }
    }
    return 0;
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8273
// Size: 0x1a
function function_d96c4b7d95d409c5() {
    return is_equal(self.lastattacker, level.player);
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8296
// Size: 0x48
function function_7f25c24e04909aca() {
    switch (level.player getstance()) {
    case #"hash_3fed0cbd303639eb":
        return 800;
    case #"hash_d91940431ed7c605":
        return 400;
    default:
        return 1500;
    }
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x82e6
// Size: 0xa4
function function_6b612dc73d8da5e9(fov, viewdist) {
    /#
        color = (1, 0, 0);
        dot = cos(fov);
        fov_yaw = acos(dot);
        eye_yaw = self gettagangles("<dev string:x16c>")[1];
        start = self gettagorigin("<dev string:x16c>");
        var_8b4c94ee530f045e = 10;
        scripts\stealth\debug::function_ab68b8f1b9191d70(start, -1 * fov_yaw, fov_yaw, (0, eye_yaw, 0), viewdist, 1, var_8b4c94ee530f045e, color);
    #/
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8392
// Size: 0x41
function function_6499ce579643b0e5() {
    if (function_5d3f8c53558f2f6d()) {
        return 40;
    }
    currspeed = length(self.velocity);
    fov = ter_op(currspeed < 100, 65, 30);
    return fov;
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x83dc
// Size: 0x18
function function_5d3f8c53558f2f6d() {
    return self geteye()[2] - self getmuzzlepos()[2] <= 10;
}

// Namespace fake_stealth / namespace_cb688294d98f4fa4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x83fd
// Size: 0xe8
function function_6768c387fe224b2(ai, var_ba17fd8125747175) {
    if (istrue(var_ba17fd8125747175)) {
        var_1cf8717b518b16c5 = ai geteye();
        if (within_fov(level.player.origin, level.player getplayerangles(), var_1cf8717b518b16c5, 0.819152)) {
            trace = capsule_trace(level.player geteye(), var_1cf8717b518b16c5 - (0, 0, 5), 4, 8, (0, 0, 0), level.player, scripts\engine\trace::create_contents(1, 1, 0, 1, 0, 1, 1, 1, 0, 0));
            var_830c1e961a20dd64 = is_equal(trace["entity"], ai);
            return var_830c1e961a20dd64;
        }
        return 0;
    }
    return scripts\anim\utility_common::player_can_see_ai(level.player, ai);
}

