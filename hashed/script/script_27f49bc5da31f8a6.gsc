// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\common\vehicle_build.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;

#namespace namespace_522dbf6c246fea47;

// Namespace namespace_522dbf6c246fea47/namespace_be4202a391caffc4
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x190
// Size: 0x1f
function autoexec main() {
    level.var_7bf42d565645a485 = 1;
    function_c0b3ddc9a6bdcc46("veh_jup_blima_anim_infil", &function_aece8e9cd30f3540);
}

// Namespace namespace_522dbf6c246fea47/namespace_be4202a391caffc4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b6
// Size: 0x3e
function private function_aece8e9cd30f3540() {
    callbacks = [];
    callbacks["spawn"] = &function_be7c293f00e99691;
    function_8497e7e46b5e397("veh_jup_blima_anim_infil", callbacks);
    if (utility::function_a10967d736dc56e5()) {
        namespace_d8730aa891576e41::build_attach_models(&set_attached_models);
    }
}

// Namespace namespace_522dbf6c246fea47/namespace_be4202a391caffc4
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fb
// Size: 0xbd
function private function_be7c293f00e99691(spawndata, var_ee8da5624236dc89) {
    vehicle = function_bba34cf920370ff4("veh_jup_blima_anim_infil", spawndata, var_ee8da5624236dc89);
    if (!isdefined(vehicle)) {
        return undefined;
    }
    if (istrue(spawndata.var_f16652e1462a3739)) {
        vehicle.unload_hover_offset = 537;
        vehicle.unload_land_offset = 165;
        vehicle.script_badplace = 0;
        vehicle.vehiclesetuprope = 1;
        vehicle vehicle_setspeed(60, 20, 10);
        vehicle.var_22aa4aa0cf0aa6bb = 1;
        vehicle.var_a8f4bb03b366aa80 = 1;
        vehicle.deathfunc = &vehicle_death;
        vehicle namespace_1fbd40990ee60ede::function_a91927df280e94e4();
    }
    return vehicle;
}

// Namespace namespace_522dbf6c246fea47/namespace_be4202a391caffc4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c0
// Size: 0x131
function private set_attached_models() {
    array = [];
    array["TAG_FastRope_LE"] = spawnstruct();
    array["TAG_FastRope_LE"].model = "equipment_fast_rope_wm_01_infil_heli_l";
    array["TAG_FastRope_LE"].tag = "body_animate_jnt";
    array["TAG_FastRope_LE"].idleanim = script_model%iw9_ai_infil_blima_rope_l_idle;
    array["TAG_FastRope_LE"].dropanim = script_model%iw9_ai_infil_blima_rope_l_drop;
    array["TAG_FastRope_RI"] = spawnstruct();
    array["TAG_FastRope_RI"].model = "equipment_fast_rope_wm_01_infil_heli_l";
    array["TAG_FastRope_RI"].tag = "body_animate_jnt";
    array["TAG_FastRope_RI"].idleanim = script_model%iw9_ai_infil_blima_rope_r_idle;
    array["TAG_FastRope_RI"].dropanim = script_model%iw9_ai_infil_blima_rope_r_drop;
    strings = getarraykeys(array);
    for (i = 0; i < strings.size; i++) {
        precachemodel(array[strings[i]].model);
    }
    return array;
}

