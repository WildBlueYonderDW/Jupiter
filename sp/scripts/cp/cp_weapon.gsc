#using script_2669878cf5a1b6bc;
#using script_74502a9e0ef1f19c;
#using scripts\cp\utility;

#namespace cp_weapon;

// Namespace cp_weapon / scripts\cp\cp_weapon
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x85
// Size: 0x69
function function_e83615f8a92e4378(rootname, attachments, camo, reticle, variantid, attachmentids, cosmeticattachment, stickers, var_11a1fa68aeb971c0) {
    if (function_2b7981cbc7ca24b4(rootname)) {
        return;
    }
    return buildweapon(rootname, attachments, camo, reticle, variantid, attachmentids, cosmeticattachment, stickers, var_11a1fa68aeb971c0);
}

// Namespace cp_weapon / scripts\cp\cp_weapon
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf7
// Size: 0x4b
function function_2b7981cbc7ca24b4(weapon_str) {
    if (getdvarint(@"hash_216da3534a88c00", 0)) {
        return false;
    }
    if (getsubstr(weapon_str, 0, 4) == "iw8_") {
        println("<dev string:x1c>" + weapon_str + "<dev string:x9c>");
        return true;
    }
    return false;
}

// Namespace cp_weapon / scripts\cp\cp_weapon
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14b
// Size: 0x12
function get_weapon_level(weapon) {
    return namespace_a0628d6954815ef8::get_weapon_level(weapon);
}

// Namespace cp_weapon / scripts\cp\cp_weapon
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x166
// Size: 0x12
function has_weapon_variation(weapon) {
    return namespace_a0628d6954815ef8::has_weapon_variation(weapon);
}

