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

#namespace unittest;

// Namespace unittest / scripts/unittest/unittest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc8
// Size: 0x4d
function test() {
    unittest_ops::main();
    unittest_call::main();
    unittest_variables::main();
    unittest_cond::main();
    unittest_loop::main();
    unittest_switch::main();
    unittest_threads::main();
    unittest_patch::main();
    namespace_106f587ebebd0cab::main();
    thread namespace_eb31a7ea746bf7d0::main();
    /#
    #/
}

// Namespace unittest / scripts/unittest/unittest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11c
// Size: 0xa
function error() {
    unittest_error::main();
}

// Namespace unittest / scripts/unittest/unittest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d
// Size: 0x8c
function main() {
    setdvarifuninitialized(@"hash_3b4e5f0e69f46421", 0);
    while (true) {
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

