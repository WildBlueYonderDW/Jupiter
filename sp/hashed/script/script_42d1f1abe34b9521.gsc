#using scripts\common\utility.gsc;
#using scripts\common\vehicle_build.gsc;

#namespace namespace_a2f029a5b54d59b9;

// Namespace namespace_a2f029a5b54d59b9 / namespace_9e3ba786e684094d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x428
// Size: 0x1be
function main(model, type, classname) {
    build_template("car", model, type, classname);
    build_localinit(&init_local);
    build_aianims(&setanims, &set_vehicle_anims, "techo");
    build_unload_groups(&unload_groups);
    build_husk(model, "veh9_civ_lnd_sedan_2009_vehphys_hsk_sp", "veh9_sedan_2009_physics_sp");
    function_2660787ca33cf457(classname, "tag_door_front_left", ["tag_window_front_left", "tag_mirror_left"]);
    function_2660787ca33cf457(classname, "tag_door_front_right", ["tag_window_front_right", "tag_mirror_right"]);
    function_2660787ca33cf457(classname, "tag_door_back_left", ["tag_window_back_left"]);
    function_2660787ca33cf457(classname, "tag_door_back_right", ["tag_window_back_right"]);
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

// Namespace namespace_a2f029a5b54d59b9 / namespace_9e3ba786e684094d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ee
// Size: 0x2d
function init_local() {
    if (utility::issp()) {
        self useanimtree(%vehicles);
    }
    self.script_badplace = 1;
    self.vehicleanimalias = "techo";
}

// Namespace namespace_a2f029a5b54d59b9 / namespace_9e3ba786e684094d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x623
// Size: 0x148
function set_vehicle_anims(positions) {
    positions[0].vehicle_getoutanim = vehicles%reb_com_veh8_techo_fl_door_open;
    positions[0].vehicle_getoutanim_clear = 0;
    positions[1].vehicle_getoutanim = vehicles%reb_com_veh8_techo_fr_door_open;
    positions[1].vehicle_getoutanim_clear = 0;
    positions[2].vehicle_getoutanim = vehicles%reb_com_veh8_techo_bl_door_open;
    positions[2].vehicle_getoutanim_clear = 0;
    positions[3].vehicle_getoutanim = vehicles%reb_com_veh8_techo_br_door_open;
    positions[3].vehicle_getoutanim_clear = 0;
    positions[0].vehicle_getinanim = vehicles%reb_com_veh8_techo_fl_door_close;
    positions[0].vehicle_getinanim_clear = 0;
    positions[1].vehicle_getinanim = vehicles%reb_com_veh8_techo_fr_door_close;
    positions[1].vehicle_getinanim_clear = 0;
    positions[2].vehicle_getinanim = vehicles%reb_com_veh8_techo_bl_door_close;
    positions[2].vehicle_getinanim_clear = 0;
    positions[3].vehicle_getinanim = vehicles%reb_com_veh8_techo_br_door_close;
    positions[3].vehicle_getinanim_clear = 0;
    return positions;
}

// Namespace namespace_a2f029a5b54d59b9 / namespace_9e3ba786e684094d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x774
// Size: 0x111
function setanims() {
    positions = [];
    for (i = 0; i < 4; i++) {
        positions[i] = spawnstruct();
    }
    positions[0].bhasgunwhileriding = 0;
    positions[0].sittag = "TAG_SEAT_0";
    positions[1].sittag = "TAG_SEAT_1";
    positions[2].sittag = "TAG_SEAT_2";
    positions[3].sittag = "TAG_SEAT_3";
    positions[0].death_no_ragdoll = 1;
    positions[1].death_no_ragdoll = 1;
    positions[2].death_no_ragdoll = 1;
    positions[3].death_no_ragdoll = 1;
    positions[0].canshootinvehicle = 0;
    positions[1].canshootinvehicle = 0;
    positions[2].canshootinvehicle = 0;
    positions[3].canshootinvehicle = 0;
    return positions;
}

// Namespace namespace_a2f029a5b54d59b9 / namespace_9e3ba786e684094d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88e
// Size: 0x67
function unload_groups() {
    unload_groups = [];
    unload_groups["driver"] = [0];
    unload_groups["all"] = [0, 1, 2, 3];
    unload_groups["passengers"] = [1, 2, 3];
    unload_groups["default"] = unload_groups["all"];
    return unload_groups;
}

