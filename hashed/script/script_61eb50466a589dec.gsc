// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_15047af555f1f9a0;

#namespace namespace_f388b4b671470a7d;

// Namespace namespace_f388b4b671470a7d/namespace_46454e0fdfc84088
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1
// Size: 0x3e
function main() {
    function_94461e6fd9196c6a(&function_230b60ef0852dcb8);
    while (!issharedfuncdefined("aggregator", "registerOnPlayerSpawnCallback")) {
        waitframe();
    }
    [[ getsharedfunc("aggregator", "registerOnPlayerSpawnCallback") ]](&function_767efe0110bfa73a);
}

// Namespace namespace_f388b4b671470a7d/namespace_46454e0fdfc84088
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6
// Size: 0xb
function function_767efe0110bfa73a() {
    thread function_a9c6f7587066ce13();
}

// Namespace namespace_f388b4b671470a7d/namespace_46454e0fdfc84088
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8
// Size: 0x15
function function_230b60ef0852dcb8(var_78264a131b0e70ac) {
    self playsoundtoplayer(var_78264a131b0e70ac, self);
}

