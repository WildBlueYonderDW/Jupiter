// mwiii decomp prototype
#using script_5251854c54e1b3c2;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;

#namespace namespace_e367146fa7344941;

// Namespace namespace_e367146fa7344941 / namespace_e342703f6722ee12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdd
// Size: 0x18
function main() {
    level.var_cdc15ee14362fbf = &namespace_e342703f6722ee12::init;
    scripts/mp/gametypes/br::main();
}

// Namespace namespace_e367146fa7344941 / namespace_e342703f6722ee12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfc
// Size: 0x11
function init() {
    function_a96666bc3e3d2cb0();
    function_81b59887710baf14();
}

// Namespace namespace_e367146fa7344941 / namespace_e342703f6722ee12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x114
// Size: 0xbb
function function_a96666bc3e3d2cb0() {
    scripts/mp/gametypes/br_gametypes::disablefeature("circle");
    scripts/mp/gametypes/br_gametypes::disablefeature("gulag");
    scripts/mp/gametypes/br_gametypes::disablefeature("dropbag");
    scripts/mp/gametypes/br_gametypes::disablefeature("plunderSites");
    scripts/mp/gametypes/br_gametypes::disablefeature("circle");
    scripts/mp/gametypes/br_gametypes::disablefeature("brQuests");
    if (getdvarint(@"hash_c3a2e929e971289a", 1) == 0) {
        scripts/mp/gametypes/br_gametypes::disablefeature("teamSpectate");
    }
    if (getdvarint(@"hash_cf460f5e17cacbe6", 1) == 0) {
        scripts/mp/gametypes/br_gametypes::disablefeature("kiosk");
    }
    scripts/mp/gametypes/br_gametypes::enablefeature("allowLateJoiners");
    if (getdvarint(@"hash_38723bbb368f3f8c", 1) == 1) {
        scripts/mp/gametypes/br_gametypes::enablefeature("tabletReplace");
    }
}

// Namespace namespace_e367146fa7344941 / namespace_e342703f6722ee12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d6
// Size: 0x3
function function_81b59887710baf14() {
    
}

