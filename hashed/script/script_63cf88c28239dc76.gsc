#using scripts\common\utility.gsc;
#using scripts\common\vehicle_build.gsc;

#namespace veh9_suv_overland_2016;

// Namespace veh9_suv_overland_2016 / namespace_6fee7e7a50b955bc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4b4
// Size: 0xb7
function main(model, type, classname) {
    build_template("truckbig", model, type, classname);
    build_localinit(&init_local);
    build_aianims(&setanims, &set_vehicle_anims, "veh9_suv_overland_2016");
    build_unload_groups(&unload_groups);
    huskmodel = "veh9_civ_lnd_suv_overland_2016_vehphys_hsk_sp";
    husktype = "veh9_suv_overland_2016_physics_sp";
    switch (classname) {
    case #"hash_d0633a003f6aa25": 
        huskmodel = "veh9_civ_lnd_suv_overland_2016_tech_vehphys_hsk_sp";
        husktype = "veh9_suv_overland_2016_cage_physics_sp";
        break;
    default: 
        break;
    }
    build_husk(model, huskmodel, husktype);
}

// Namespace veh9_suv_overland_2016 / namespace_6fee7e7a50b955bc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x573
// Size: 0x2d
function init_local() {
    if (utility::issp()) {
        self useanimtree(%vehicles);
    }
    self.script_badplace = 1;
    self.vehicleanimalias = "veh9_suv_overland_2016";
}

// Namespace veh9_suv_overland_2016 / namespace_6fee7e7a50b955bc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a8
// Size: 0x278
function set_vehicle_anims(positions) {
    positions[0].vehicle_getinanim = vehicles%iw9_veh_overland_seat_0_entry_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[1].vehicle_getinanim = vehicles%iw9_veh_overland_seat_1_entry_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[2].vehicle_getinanim = vehicles%iw9_veh_overland_seat_2_entry_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[3].vehicle_getinanim = vehicles%iw9_veh_overland_seat_3_entry_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[0].vehicle_getoutanim = vehicles%iw9_veh_overland_seat_0_exit_idle_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[1].vehicle_getoutanim = vehicles%iw9_veh_overland_seat_1_exit_idle_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[2].vehicle_getoutanim = vehicles%iw9_veh_overland_seat_2_exit_idle_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[3].vehicle_getoutanim = vehicles%iw9_veh_overland_seat_3_exit_idle_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[0].vehicle_getoutanim_combat = vehicles%iw9_veh_overland_seat_0_exit_combat_idle_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[1].vehicle_getoutanim_combat = vehicles%iw9_veh_overland_seat_1_exit_combat_idle_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[2].vehicle_getoutanim_combat = vehicles%iw9_veh_overland_seat_2_exit_combat_idle_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[3].vehicle_getoutanim_combat = vehicles%iw9_veh_overland_seat_3_exit_combat_idle_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[0].vehicle_getoutanim_combat_run = vehicles%iw9_veh_overland_seat_0_exit_combat_run_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[1].vehicle_getoutanim_combat_run = vehicles%iw9_veh_overland_seat_1_exit_combat_run_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[2].vehicle_getoutanim_combat_run = vehicles%iw9_veh_overland_seat_2_exit_combat_run_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    positions[3].vehicle_getoutanim_combat_run = vehicles%iw9_veh_overland_seat_3_exit_combat_run_geo_door;
    positions[0].vehicle_getinanim_clear = 0;
    return positions;
}

// Namespace veh9_suv_overland_2016 / namespace_6fee7e7a50b955bc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x829
// Size: 0x16c
function setanims() {
    positions = [];
    for (i = 0; i < 6; i++) {
        positions[i] = spawnstruct();
    }
    positions[0].sittag = "TAG_SEAT_0";
    positions[1].sittag = "TAG_SEAT_1";
    positions[2].sittag = "TAG_SEAT_2";
    positions[3].sittag = "TAG_SEAT_3";
    positions[4].sittag = "TAG_DETACH";
    positions[5].sittag = "TAG_DETACH";
    positions[0].death_no_ragdoll = 1;
    positions[1].death_no_ragdoll = 1;
    positions[2].death_no_ragdoll = 1;
    positions[3].death_no_ragdoll = 1;
    positions[4].death_no_ragdoll = 1;
    positions[5].death_no_ragdoll = 1;
    positions[0].canshootinvehicle = 0;
    positions[1].canshootinvehicle = 0;
    positions[2].canshootinvehicle = 0;
    positions[3].canshootinvehicle = 0;
    positions[4].canshootinvehicle = 0;
    positions[5].canshootinvehicle = 0;
    return positions;
}

// Namespace veh9_suv_overland_2016 / namespace_6fee7e7a50b955bc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99e
// Size: 0x7f
function unload_groups() {
    unload_groups = [];
    unload_groups["driver"] = [0];
    unload_groups["all"] = [0, 1, 2, 3, 4, 5];
    unload_groups["passengers"] = [1, 2, 3, 4, 5];
    unload_groups["default"] = unload_groups["all"];
    return unload_groups;
}

