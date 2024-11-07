#using scripts\common\vehicle_build.gsc;
#using scripts\common\utility.gsc;

#namespace veh9_sedan_hatchback_1985;

// Namespace veh9_sedan_hatchback_1985 / namespace_8e491b87f98565fb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x75f
// Size: 0x275
function main(model, type, classname) {
    build_template("car", model, type, classname);
    build_localinit(&init_local);
    build_aianims(&setanims, &set_vehicle_anims, "sedan_hatchback_1985");
    build_unload_groups(&unload_groups);
    huskmodel = "veh9_civ_lnd_sedan_hatchback_1985_x_vehphys_hsk_sp";
    level.vehicle.templates.husk["veh9_civ_lnd_sedan_hatchback_1985_vehphys_sp"] = huskmodel;
    level.vehicle.templates.husktype["veh9_civ_lnd_sedan_hatchback_1985_vehphys_sp"] = "veh9_sedan_hatchback_1985_physics_sp";
    build_husk(model, huskmodel, "veh9_sedan_hatchback_1985_physics_sp", 0);
    function_2660787ca33cf457(classname, "tag_door_front_left", ["tag_window_front_left", "tag_mirror_left"]);
    function_2660787ca33cf457(classname, "tag_door_front_right", ["tag_window_front_right", "tag_mirror_right"]);
    function_2660787ca33cf457(classname, "tag_door_back_left", ["tag_window_back_left"]);
    function_2660787ca33cf457(classname, "tag_door_back_right", ["tag_window_back_right"]);
    function_2660787ca33cf457(classname, "tag_wheel_center_front_left", ["tag_hubcap_front_left"]);
    function_2660787ca33cf457(classname, "tag_wheel_center_front_right", ["tag_hubcap_front_right"]);
    function_2660787ca33cf457(classname, "tag_wheel_center_back_left", ["tag_hubcap_back_left"]);
    function_2660787ca33cf457(classname, "tag_wheel_center_back_right", ["tag_hubcap_back_right"]);
    function_2cf37d073c6bde84(classname, "headlight_front_left", "tag_light_front_left", "headlights");
    function_2cf37d073c6bde84(classname, "headlight_front_right", "tag_light_front_right", "headlights");
    function_2cf37d073c6bde84(classname, "taillight_back_left", "tag_light_back_left", "headlights");
    function_2cf37d073c6bde84(classname, "taillight_back_right", "tag_light_back_right", "headlights");
    function_2cf37d073c6bde84(classname, "brakelight_back_left", "tag_light_back_left", "brakelights");
    function_2cf37d073c6bde84(classname, "brakelight_back_right", "tag_light_back_right", "brakelights");
    function_2cf37d073c6bde84(classname, "daylight_front_left", "tag_light_front_left", "daylights");
    function_2cf37d073c6bde84(classname, "daylight_front_right", "tag_light_front_right", "daylights");
    function_2cf37d073c6bde84(classname, "daylight_back_left", "tag_light_back_left", "daylights");
    function_2cf37d073c6bde84(classname, "daylight_back_right", "tag_light_back_right", "daylights");
}

// Namespace veh9_sedan_hatchback_1985 / namespace_8e491b87f98565fb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9dc
// Size: 0x36
function function_a4541bdcd8fbf0d4(model, type, classname) {
    build_template("husk", model, type, classname);
    build_localinit(&init_local);
}

// Namespace veh9_sedan_hatchback_1985 / namespace_8e491b87f98565fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1a
// Size: 0x2d
function init_local() {
    if (utility::issp()) {
        self useanimtree(%vehicles);
    }
    self.script_badplace = 1;
    self.vehicleanimalias = "sedan_hatchback_1985";
}

// Namespace veh9_sedan_hatchback_1985 / namespace_8e491b87f98565fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa4f
// Size: 0x284
function set_vehicle_anims(positions) {
    positions[0].vehicle_getinanim = vehicles%iw9_veh_sedan_1985_seat_0_entry_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[1].vehicle_getinanim = vehicles%iw9_veh_sedan_1985_seat_1_entry_geo_door;
    positions[1].vehicle_getinanim_clear = 0;
    positions[2].vehicle_getinanim = vehicles%iw9_veh_sedan_1985_seat_2_entry_geo_door;
    positions[2].vehicle_getinanim_clear = 0;
    positions[3].vehicle_getinanim = vehicles%iw9_veh_sedan_1985_seat_3_entry_geo_door;
    positions[3].vehicle_getinanim_clear = 0;
    positions[0].vehicle_getoutanim = vehicles%iw9_veh_sedan_1985_seat_0_exit_patrol_idle_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[1].vehicle_getoutanim = vehicles%iw9_veh_sedan_1985_seat_1_exit_patrol_idle_geo_door;
    positions[1].vehicle_getinanim_clear = 0;
    positions[2].vehicle_getoutanim = vehicles%iw9_veh_sedan_1985_seat_2_exit_patrol_idle_geo_door;
    positions[2].vehicle_getinanim_clear = 0;
    positions[3].vehicle_getoutanim = vehicles%iw9_veh_sedan_1985_seat_3_exit_patrol_idle_geo_door;
    positions[3].vehicle_getinanim_clear = 0;
    positions[0].vehicle_getoutanim_combat = vehicles%iw9_veh_sedan_1985_seat_0_exit_combat_idle_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[1].vehicle_getoutanim_combat = vehicles%iw9_veh_sedan_1985_seat_1_exit_combat_idle_geo_door;
    positions[1].vehicle_getinanim_clear = 0;
    positions[2].vehicle_getoutanim_combat = vehicles%iw9_veh_sedan_1985_seat_2_exit_combat_idle_geo_door;
    positions[2].vehicle_getinanim_clear = 0;
    positions[3].vehicle_getoutanim_combat = vehicles%iw9_veh_sedan_1985_seat_3_exit_combat_idle_geo_door;
    positions[3].vehicle_getinanim_clear = 0;
    positions[0].vehicle_getoutanim_combat_run = vehicles%iw9_veh_sedan_1985_seat_0_exit_combat_run_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[1].vehicle_getoutanim_combat_run = vehicles%iw9_veh_sedan_1985_seat_1_exit_combat_run_geo_door;
    positions[1].vehicle_getinanim_clear = 0;
    positions[2].vehicle_getoutanim_combat_run = vehicles%iw9_veh_sedan_1985_seat_2_exit_combat_run_geo_door;
    positions[2].vehicle_getinanim_clear = 0;
    positions[3].vehicle_getoutanim_combat_run = vehicles%iw9_veh_sedan_1985_seat_3_exit_combat_run_geo_door;
    positions[3].vehicle_getinanim_clear = 0;
    return positions;
}

// Namespace veh9_sedan_hatchback_1985 / namespace_8e491b87f98565fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcdc
// Size: 0x1d5
function setanims() {
    positions = [];
    for (i = 0; i < 4; i++) {
        positions[i] = spawnstruct();
    }
    positions[0].bhasgunwhileriding = 0;
    positions[0].sittag = "TAG_SEAT_WM_0";
    positions[1].sittag = "TAG_SEAT_WM_1";
    positions[2].sittag = "TAG_SEAT_WM_2";
    positions[3].sittag = "TAG_SEAT_WM_3";
    positions[0].death_no_ragdoll = 1;
    positions[1].death_no_ragdoll = 1;
    positions[2].death_no_ragdoll = 1;
    positions[3].death_no_ragdoll = 1;
    positions[0].canshootinvehicle = 1;
    positions[1].canshootinvehicle = 1;
    positions[2].canshootinvehicle = 1;
    positions[3].canshootinvehicle = 1;
    positions[0].death_impulse = 0;
    positions[1].death_impulse = 1;
    positions[2].death_impulse = 1;
    positions[3].death_impulse = 1;
    positions[0].var_bcd0a0afd54c6491 = 0;
    positions[1].var_bcd0a0afd54c6491 = 0;
    positions[2].var_bcd0a0afd54c6491 = 0;
    positions[3].var_bcd0a0afd54c6491 = 0;
    positions[0].var_70aa9eaf339ddb20 = 0;
    positions[1].var_70aa9eaf339ddb20 = 0;
    positions[2].var_70aa9eaf339ddb20 = 0;
    positions[3].var_70aa9eaf339ddb20 = 0;
    return positions;
}

// Namespace veh9_sedan_hatchback_1985 / namespace_8e491b87f98565fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeba
// Size: 0x67
function unload_groups() {
    unload_groups = [];
    unload_groups["driver"] = [0];
    unload_groups["all"] = [0, 1, 2, 3];
    unload_groups["passengers"] = [1, 2, 3];
    unload_groups["default"] = unload_groups["all"];
    return unload_groups;
}

