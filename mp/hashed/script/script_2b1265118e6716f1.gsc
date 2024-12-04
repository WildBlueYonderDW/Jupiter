#using script_145988baae67fded;
#using script_2047cdbf5176ba0;
#using script_22f1701e151b9d12;
#using script_4178611df309502c;
#using script_479c151825f9bd25;
#using script_569b2ddf002e61a3;
#using script_62a4f7a62643fe8;
#using script_7ff1c5399d2d9500;
#using script_92b815b18f0ba61;
#using scripts\common\callbacks;
#using scripts\engine\utility;

#namespace namespace_3bc5fb9e0573f753;

// Namespace namespace_3bc5fb9e0573f753 / namespace_26354c9b66d272ff
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1fb
// Size: 0x10
function autoexec init() {
    level.var_9d4c681557f7fe61 = &main;
}

// Namespace namespace_3bc5fb9e0573f753 / namespace_26354c9b66d272ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x213
// Size: 0x9d
function main() {
    function_eb7f544259415a09("mp_jup_bigmap_ob");
    level thread function_3216abb4626140a();
    namespace_22ec60f51e713465::main();
    namespace_9661b1840de4663d::main();
    scripts\engine\utility::flag_set("gas_station_create_script_initialized");
    level callback::add("register_activities", &function_98dce243b7f268fe);
    level callback::add("register_objectives", &function_ecac24e0ca8d149);
    function_3c4621aaf1b2a547();
    namespace_a6c913548fa9600::main();
    thread namespace_6776e8e74ed64842::init();
    if (getdvar(@"hash_6ffd9adb060c50c9", "0") == "1") {
        namespace_58885d92b6809057::main();
        thread namespace_d7e80b14e1130dc4::init();
    }
    thread function_a476db26a39e58b5();
}

// Namespace namespace_3bc5fb9e0573f753 / namespace_26354c9b66d272ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b8
// Size: 0x129
function function_3216abb4626140a() {
    setdvar(@"hash_f1d095735ac37f33", 1);
    waitframe();
    function_9b8829ab4092a7d7("ob_zombie_ambient", 1);
    a_pos = scripts\engine\utility::getstructarray("s_ob_infil_supress", "targetname");
    foreach (pos in a_pos) {
        function_606642b946a01237("infil_supress", pos.origin, pos.radius, 1);
    }
    var_102014ab68ac4b78 = scripts\engine\utility::getstructarray("s_ambient_blocker", "targetname");
    foreach (pos in var_102014ab68ac4b78) {
        if (isdefined(pos.radius)) {
            function_606642b946a01237("ambient_blocker", pos.origin, pos.radius, 1);
        }
    }
}

// Namespace namespace_3bc5fb9e0573f753 / namespace_26354c9b66d272ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e9
// Size: 0x10
function function_a476db26a39e58b5() {
    function_dc9fcecace9cff65();
    namespace_614554f86e52695c::function_b1fa4578ef08136f();
}

// Namespace namespace_3bc5fb9e0573f753 / namespace_26354c9b66d272ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x401
// Size: 0xe
function function_dc9fcecace9cff65() {
    flag_wait("mp_jup_st_d_ob_contracts_merc_defend_cs_completed");
}

