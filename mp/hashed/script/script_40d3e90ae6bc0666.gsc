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
    setdvar(@"hash_402173c7dbee15d9", 5);
    setdvar(@"hash_656131a98e0d2c9d", 10);
    setdvar(@"hash_595f2292597ec0c7", (0, 1, 0));
    setdvar(@"hash_71fe8b216d50a24c", 1.5);
    setdvar(@"hash_6a4705943fd574b8", 0.25);
    setdvar(@"hash_d0658156fb7f2311", 25);
}

