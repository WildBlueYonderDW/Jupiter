#using scripts\common\basic_wind.gsc;

#namespace namespace_3f5358a3ffbb7f43;

// Namespace namespace_3f5358a3ffbb7f43 / namespace_a41e483c0894ebf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe2
// Size: 0x5b
function main() {
    level._effect["vfx_farm_sunflare"] = loadfx("vfx/iw9/level/mp_embassy/vfx_embassy_sunflare.vfx");
    if (!getdvarint(@"hash_e6afce2cf5cf7515")) {
        load_wind("east", 1);
        level.var_b125f0083ff90b31 = init_wind("east", 1, 1);
    }
    thread function_a520347b8e7b8543();
}

// Namespace namespace_3f5358a3ffbb7f43 / namespace_a41e483c0894ebf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x145
// Size: 0x79
function function_a520347b8e7b8543() {
    setdvar(@"cg_defaultWindAmplitudeScale", 5);
    setdvar(@"cg_defaultWindAreaScale", 10);
    setdvar(@"cg_defaultWindDir", (0, 1, 0));
    setdvar(@"cg_defaultWindFrequencyScale", 1.5);
    setdvar(@"cg_defaultWindNoiseScale", 0.25);
    setdvar(@"cg_defaultWindStrength", 25);
}

