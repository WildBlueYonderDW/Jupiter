#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_e043e6db317d6d71;

// Namespace namespace_e043e6db317d6d71 / namespace_6bb2e038a2adbe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15a
// Size: 0x9
function main() {
    function_959babe1a25e784e();
}

// Namespace namespace_e043e6db317d6d71 / namespace_6bb2e038a2adbe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16b
// Size: 0x9a
function function_959babe1a25e784e() {
    level.scr_animtree["zone1_heavy_lab_device"] = %script_model;
    level.scr_anim["zone1_heavy_lab_device"]["exploded"] = script_model%jup_fxanim_war_military_heavy_lab_device_damaged;
    level.scr_animname["zone1_heavy_lab_device"]["exploded"] = "jup_fxanim_war_military_heavy_lab_device_damaged";
    level.scr_animtree["zone1_heavy_lab_device_line"] = %script_model;
    level.scr_anim["zone1_heavy_lab_device_line"]["exploded"] = script_model%jup_fxanim_war_military_heavy_lab_device_line_damaged;
    level.scr_animname["zone1_heavy_lab_device_line"]["exploded"] = "jup_fxanim_war_military_heavy_lab_device_line_damaged";
}

