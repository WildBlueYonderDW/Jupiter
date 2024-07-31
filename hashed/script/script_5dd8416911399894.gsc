#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\lighting.gsc;

#namespace namespace_75cacbcff85696e3;

// Namespace namespace_75cacbcff85696e3 / namespace_9397dd02cc264592
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d1
// Size: 0x74
function main() {
    thread neon_hide();
    thread open_doors();
    level.gunshipvisionset = "mp_jup_skidrow_alt_killstreak_gunship";
    level.choppervisionset = "mp_jup_skidrow_alt_cruise_color_mp";
    level.var_6d129920246627ba = "mp_jup_skidrow_alt_assault_drone_color_mp";
    level.var_61b254009a0951a6 = "mp_jup_skidrow_alt_assault_drone_color_dark_mp";
    level.var_638c653eda9d1cd3 = "mp_jup_skidrow_alt_cruise_color_mp";
    level.var_81d39c829ea8e68f = "mp_jup_skidrow_alt_cruise_color_mp";
    level.var_49071332a2a99c1e = "mp_jup_skidrow_alt_killstreak_thermal";
}

// Namespace namespace_75cacbcff85696e3 / namespace_9397dd02cc264592
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24d
// Size: 0x8
function function_dc80d32bdcc46d0() {
    wait 0.5;
}

// Namespace namespace_75cacbcff85696e3 / namespace_9397dd02cc264592
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25d
// Size: 0x6c
function neon_hide() {
    wait 0.05;
    neon_hide = getentarray("neon_hide", "targetname");
    foreach (object in neon_hide) {
        object hide();
    }
}

// Namespace namespace_75cacbcff85696e3 / namespace_9397dd02cc264592
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d1
// Size: 0x74
function open_doors() {
    wait 10;
    open_door_left = getentitylessscriptablearray("open_door_left", "script_noteworthy");
    foreach (door in open_door_left) {
        wait 0.1;
        door scriptabledooropen("left");
    }
}

