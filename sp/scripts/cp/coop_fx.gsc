#namespace namespace_fb3289075dee0727;

// Namespace namespace_fb3289075dee0727 / scripts\cp\coop_fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45c
// Size: 0x9
function main() {
    init_fx();
}

// Namespace namespace_fb3289075dee0727 / scripts\cp\coop_fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46d
// Size: 0x188
function init_fx() {
    level._effect["vfx_scrnfx_tocam_slidedust_m"] = loadfx("vfx/core/screen/vfx_scrnfx_tocam_slidedust_m");
    level._effect["vfx_mortar_explosion"] = loadfx("vfx/iw8/weap/_explo/mortar/vfx_mortar_explosion_bm.vfx");
    level._effect["vfx_mortar_marker"] = loadfx("vfx/iw8_cp/vfx_mortar_marker_target.vfx");
    level._effect["vfx_blima_explosion"] = loadfx("vfx/iw8/core/blima/vfx_blima_explosion.vfx");
    level._effect["vfx_cp_nuke_core_expose_vapor"] = loadfx("vfx/iw8_cp/prop/vfx_cp_nuke_core_expose_vapor.vfx");
    level._effect["vfx_cp_fulton_backpack_expell"] = loadfx("vfx/iw8_cp/prop/vfx_cp_fulton_backpack_expell.vfx");
    level._effect["vfx_cp_fulton_grp_door"] = loadfx("vfx/iw8_cp/prop/vfx_cp_fulton_grp_door.vfx");
    level._effect["vfx_cp_fulton_grp_expell"] = loadfx("vfx/iw8_cp/prop/vfx_cp_fulton_grp_expell.vfx");
    level._effect["vehicle_explosion"] = loadfx("vfx/core/expl/small_vehicle_explosion_new.vfx");
    level._effect["smoke_trail"] = loadfx("vfx/core/smktrail/smoke_trail_white_heli.vfx");
    level._effect["aerial_explosion"] = loadfx("vfx/core/expl/aerial_explosion.vfx");
    level._effect["chopper_sparks"] = loadfx("vfx/iw8_cp/level/cp_stk_faridah/vfx_chopper_sparks.vfx");
    level._effect["blima_rocket_flash"] = loadfx("vfx/iw8/core/lbravo/vfx_lbravo_rocket_pod_launch.vfx");
    level._effect["vehicle_flares"] = loadfx("vfx/iw8_mp/killstreak/vfx_apache_angel_flares.vfx");
    level._effect["helidown_rpghit"] = loadfx("vfx/iw8_cp/chopper/vfx_chopper_air_explosion.vfx");
}

