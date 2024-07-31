#namespace namespace_fdf79a7269db3c98;

// Namespace namespace_fdf79a7269db3c98 / namespace_d50d77fc6d718d18
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x171
// Size: 0x84
function main() {
    level._effect["small_duck_explode"] = loadfx("vfx/jup/level/mp_jup_bait/vfx_bait_duck_pop.vfx");
    level._effect["small_duck_spawn"] = loadfx("vfx/jup/level/mp_jup_bait/vfx_bait_duck_hi.vfx");
    level._effect["big_duck_spawn"] = loadfx("vfx/jup/level/mp_jup_bait/vfx_bait_duck_pop.vfx");
    level._effect["small_duck_timeout"] = loadfx("vfx/jup/level/mp_jup_bait/vfx_bait_duck_bye.vfx");
    /#
        if (getdvar(@"hash_cadf250daffab004") != "<dev string:x1c>") {
        }
    #/
}

