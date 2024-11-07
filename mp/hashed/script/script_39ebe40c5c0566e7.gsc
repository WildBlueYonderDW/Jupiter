#namespace perk_shared;

// Namespace perk_shared / namespace_475c6252a691eb85
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf4
// Size: 0x6c
function function_56ad1b98a0613f8a(perkname) {
    if (getdvarint(@"hash_72ba2c5c35486a09", 0) == 0) {
        if (perkname == "specialty_super_speed" || perkname == "specialty_super_speed_script" || perkname == "specialty_super_strength" || perkname == "specialty_durability") {
            return false;
        }
    }
    return isdefined(perkname) && isdefined(self.perks) && isdefined(self.perks[perkname]);
}

