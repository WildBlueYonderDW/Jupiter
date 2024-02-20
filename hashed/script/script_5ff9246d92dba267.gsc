// mwiii decomp prototype
#using script_2047cdbf5176ba0;
#using script_62a4f7a62643fe8;
#using script_92b815b18f0ba61;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using script_893e61d2d5b599;
#using script_3351a966a784edc0;
#using script_22f1701e151b9d12;

#namespace namespace_cef895ed6d55d981;

// Namespace namespace_cef895ed6d55d981/namespace_5aafd78243c6a8c9
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x105
// Size: 0x11
function autoexec init() {
    level.var_7e1adb313a3b34d3 = &main;
}

// Namespace namespace_cef895ed6d55d981/namespace_5aafd78243c6a8c9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d
// Size: 0x96
function main() {
    function_eb7f544259415a09("mp_jup_bigmap_ob");
    function_738bba992e43ca7e();
    if (getdvarint(@"hash_f0651f120dc9412d", 0)) {
        namespace_8f52b12ca3af49b1::main();
        namespace_609a42b1d504aad6::function_30a591676d601c38();
        thread namespace_faa32e45e1d64c2::init(1, undefined, 1);
        return;
    }
    level callback::add("register_activities", &function_d0ffb4e404349b30);
    level callback::add("register_objectives", &function_83ecb01b31530309);
    level callback::add("register_features", &function_c4ca7f1cd743b5d2);
    thread function_969adf7620768917();
    thread function_1aaaa2896639517e();
    thread namespace_faa32e45e1d64c2::init(1, undefined, 1);
}

// Namespace namespace_cef895ed6d55d981/namespace_5aafd78243c6a8c9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba
// Size: 0x22
function function_1aaaa2896639517e() {
    waitframe();
    function_9b8829ab4092a7d7("ob_zombie_ambient", 1);
    setdvar(@"hash_f1d095735ac37f33", 1);
}

// Namespace namespace_cef895ed6d55d981/namespace_5aafd78243c6a8c9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e3
// Size: 0xa
function function_969adf7620768917() {
    namespace_614554f86e52695c::function_b1fa4578ef08136f();
}

