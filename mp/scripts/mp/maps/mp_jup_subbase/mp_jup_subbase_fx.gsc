#namespace namespace_78b6a89fe4715477;

// Namespace namespace_78b6a89fe4715477 / scripts\mp\maps\mp_jup_subbase\mp_jup_subbase_fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e
// Size: 0x50
function main() {
    level._effect["vfx_rhib_infil_splashes"] = loadfx("vfx/iw9/infil/vfx_rhib_infil_splashes.vfx");
    level._effect["vfx_farm_sunflare"] = loadfx("vfx/jup/level/mp_jup_subbase/vfx_subbase_sunflare.vfx");
    /#
        if (getdvar(@"hash_cadf250daffab004") != "<dev string:x1c>") {
        }
    #/
}

