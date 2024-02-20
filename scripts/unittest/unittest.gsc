// mwiii decomp prototype
#using scripts\unittest\util.gsc;
#using scripts\unittest\ops.gsc;
#using scripts\unittest\call.gsc;
#using scripts\unittest\variables.gsc;
#using scripts\unittest\cond.gsc;
#using scripts\unittest\loop.gsc;
#using scripts\unittest\switch.gsc;
#using scripts\unittest\threads.gsc;
#using scripts\unittest\patch.gsc;
#using script_60031ac74593ea4c;
#using scripts\unittest\error.gsc;
#using script_13645532f846e433;

#namespace namespace_e31568b14241c4bf;

// Namespace namespace_e31568b14241c4bf/namespace_b27e75add3801331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc8
// Size: 0x4d
function test() {
    namespace_e0ae03ff9fc1812c::main();
    namespace_8b4e29119994c020::main();
    namespace_4a4aaf00b68b13a9::main();
    namespace_6d6ccf11835bebe0::main();
    namespace_898dcfe71d46487e::main();
    namespace_89c902463f02748c::main();
    namespace_9b6cb473c89e4499::main();
    namespace_bdcbcfceab56aa1e::main();
    namespace_106f587ebebd0cab::main();
    thread namespace_eb31a7ea746bf7d0::main();
    /#
    #/
}

// Namespace namespace_e31568b14241c4bf/namespace_b27e75add3801331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11c
// Size: 0xa
function error() {
    namespace_9a8cc0e0b9d06106::main();
}

// Namespace namespace_e31568b14241c4bf/namespace_b27e75add3801331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d
// Size: 0x8c
function main() {
    setdvarifuninitialized(@"hash_3b4e5f0e69f46421", 0);
LOC_0000001a:
    while (1) {
        wait(1);
        var_c990b60e12f60d87 = getdvarint(@"hash_3b4e5f0e69f46421", 0);
        switch (var_c990b60e12f60d87) {
        case 0:
            continue;
        case 1:
            test();
            break;
        case 2:
            error();
            break;
        }
        setdvar(@"hash_3b4e5f0e69f46421", 0);
    }
}

