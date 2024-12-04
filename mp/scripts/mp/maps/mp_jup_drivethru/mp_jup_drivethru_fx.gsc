#namespace namespace_2aaa486f5c0dd96d;

// Namespace namespace_2aaa486f5c0dd96d / scripts\mp\maps\mp_jup_drivethru\mp_jup_drivethru_fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x135
// Size: 0x50
function main() {
    level._effect["carousel_confetti"] = loadfx("vfx/jup/level/mp_jup_drivethru/vfx_drivethru_duck_confetti.vfx");
    level._effect["roof_confetti"] = loadfx("vfx/jup/level/mp_jup_drivethru/vfx_drivethru_duck_confetti_up.vfx");
    /#
        if (getdvar(@"hash_cadf250daffab004") != "<dev string:x1c>") {
        }
    #/
}

