// mwiii decomp prototype
#using script_2047cdbf5176ba0;
#using script_92b815b18f0ba61;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using script_62a4f7a62643fe8;
#using script_31b70210f1726bd2;
#using script_badad75eef11559;
#using script_22f1701e151b9d12;

#namespace namespace_7a0daa40a5650029;

// Namespace namespace_7a0daa40a5650029/namespace_998eb9292aa36405
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xd7
// Size: 0x11
function autoexec init() {
    level.var_b59297aa6933406b = &main;
}

// Namespace namespace_7a0daa40a5650029/namespace_998eb9292aa36405
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef
// Size: 0x58
function main() {
    function_eb7f544259415a09("mp_jup_bigmap_ob");
    if (getdvarint(@"hash_f0651c120dc93a94", 0)) {
        namespace_f0893f8b59f579e9::function_3ececb453fbf07fe();
        namespace_6d31e91c26415292::main();
        namespace_609a41b1d504a8a3::function_429e921f8ad411ff();
        thread namespace_faa32e45e1d64c2::init(1, undefined, 1);
        return;
    }
    level flag_wait("ai_spawn_director_initialized");
    thread namespace_614554f86e52695c::function_b1fa4578ef08136f();
}

