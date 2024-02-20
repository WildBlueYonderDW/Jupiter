// mwiii decomp prototype
#namespace struct;

// Namespace struct/namespace_5e840a8cc2d3ba93
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68
// Size: 0xd
function initstructs() {
    level.struct = [];
}

// Namespace struct/namespace_5e840a8cc2d3ba93
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c
// Size: 0x2a
function createstruct() {
    struct = spawnstruct();
    level.struct[level.struct.size] = struct;
    return struct;
}

