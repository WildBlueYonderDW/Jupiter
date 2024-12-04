#using scripts\common\lighting;
#using scripts\common\utility;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace namespace_fe993148497a87d3;

// Namespace namespace_fe993148497a87d3 / scripts\mp\maps\mp_jup_skidrow\mp_jup_skidrow_lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bd
// Size: 0x66
function main() {
    thread neon_hide();
    thread open_doors();
    level.gunshipvisionset = "mp_jup_skidrow_killstreak_gunship";
    level.var_6d129920246627ba = "mp_jup_skidrow_assault_drone_color_mp";
    level.var_61b254009a0951a6 = "mp_jup_skidrow_assault_drone_color_dark_mp";
    level.var_638c653eda9d1cd3 = "mp_jup_skidrow_cruise_color_mp";
    level.var_81d39c829ea8e68f = "mp_jup_skidrow_cruise_color_mp";
    level.var_49071332a2a99c1e = "mp_jup_skidrow_killstreak_thermal";
}

// Namespace namespace_fe993148497a87d3 / scripts\mp\maps\mp_jup_skidrow\mp_jup_skidrow_lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22b
// Size: 0x8
function lighting_dvars() {
    wait 0.5;
}

// Namespace namespace_fe993148497a87d3 / scripts\mp\maps\mp_jup_skidrow\mp_jup_skidrow_lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23b
// Size: 0x6c
function neon_hide() {
    wait 0.05;
    neon_hide = getentarray("neon_hide", "targetname");
    foreach (object in neon_hide) {
        object hide();
    }
}

// Namespace namespace_fe993148497a87d3 / scripts\mp\maps\mp_jup_skidrow\mp_jup_skidrow_lighting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2af
// Size: 0x74
function open_doors() {
    wait 10;
    open_door_left = getentitylessscriptablearray("open_door_left", "script_noteworthy");
    foreach (door in open_door_left) {
        wait 0.1;
        door scriptabledooropen("left");
    }
}

