#namespace namespace_ddb51a8c6deaf35c;

// Namespace namespace_ddb51a8c6deaf35c / namespace_16f589d79779c915
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x111
// Size: 0x90
function autoexec main() {
    level.scr_animtree["dog_charge"] = %playerasmhellhound2;
    level.scr_anim["dog_charge"]["hellhound_charge"] = playerasmhellhound2%jup_mp_hellhound_sprint;
    level.scr_eventanim["dog_charge"]["hellhound_charge"] = %"jup_mp_hellhound_sprint";
    level.scr_anim["dog_charge"]["hellhound_hit_wall"] = playerasmhellhound2%jup_mp_hellhound_charge_hit;
    level.scr_eventanim["dog_charge"]["hellhound_hit_wall"] = %"jup_mp_hellhound_charge_hit";
}

