// mwiii decomp prototype
#using script_2047cdbf5176ba0;
#using script_62a4f7a62643fe8;
#using script_92b815b18f0ba61;
#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using script_6c49326fa248a5f;
#using script_36b7b4e4089e73a3;
#using script_222f62686867436a;
#using script_22f1701e151b9d12;

#namespace namespace_3c7b4a8d45ca4fa1;

// Namespace namespace_3c7b4a8d45ca4fa1 / namespace_bd103acf985fa57b
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xdf
// Size: 0x11
function autoexec init() {
    level.var_42f9d919e49a0633 = &main;
}

// Namespace namespace_3c7b4a8d45ca4fa1 / namespace_bd103acf985fa57b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7
// Size: 0x6d
function main() {
    function_eb7f544259415a09("mp_jup_bigmap_ob");
    namespace_c670458343d549::main();
    function_74fd375468d1ae4();
    if (getdvarint(@"hash_f0651d120dc93cc7", 0)) {
        namespace_25a0f0fe5a85d32b::main();
        namespace_609a40b1d504a670::function_5d445c791ef3fc0a();
        level thread namespace_6776e8e74ed64842::init(1, undefined, 1);
        return;
    } else {
        namespace_609a40b1d504a670::function_aa1b5db86c89322d(0);
    }
    level thread namespace_6776e8e74ed64842::init(1, undefined, 1);
    level thread function_969adf7620768917();
}

// Namespace namespace_3c7b4a8d45ca4fa1 / namespace_bd103acf985fa57b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b
// Size: 0x17
function function_969adf7620768917() {
    level flag_wait("ai_spawn_director_initialized");
    namespace_614554f86e52695c::function_b1fa4578ef08136f();
}

