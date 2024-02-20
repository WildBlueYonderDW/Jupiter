// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace flags;

// Namespace flags/namespace_2ca3a93161121e96
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83
// Size: 0x53
function init_flags() {
    if (!namespace_3c37cb17ade254d::add_init_script("init_flags", &init_flags)) {
        return;
    }
    level.flag = [];
    level.flags_lock = [];
    level.generic_index = 0;
    level.flag_struct = spawnstruct();
    level.flag_struct assign_unique_id();
}

// Namespace flags/namespace_2ca3a93161121e96
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd
// Size: 0x25
function assign_unique_id() {
    self.unique_id = "generic" + level.generic_index;
    level.generic_index++;
}

