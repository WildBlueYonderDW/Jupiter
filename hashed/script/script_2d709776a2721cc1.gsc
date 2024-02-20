// mwiii decomp prototype
#using script_2047cdbf5176ba0;
#using script_92b815b18f0ba61;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using script_627452def335a90b;
#using script_46e6439866901eb5;
#using script_5f1c5742c93821a4;
#using script_62a4f7a62643fe8;
#using script_2e0d8cb6cbb13e4d;
#using script_7ff1c5399d2d9500;
#using script_22f1701e151b9d12;

#namespace namespace_cac9b95740fca4e0;

// Namespace namespace_cac9b95740fca4e0/namespace_f14d97da70ba358f
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1b5
// Size: 0x11
function autoexec init() {
    level.var_6bf302c2c5d67b40 = &main;
}

// Namespace namespace_cac9b95740fca4e0/namespace_f14d97da70ba358f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd
// Size: 0x9e
function main() {
    function_eb7f544259415a09("mp_jup_bigmap_ob");
    level thread function_a966511aed9b0851();
    namespace_68e5e24beb101ffd::main();
    namespace_2ca3dad2d6898e0d::main();
    namespace_3c37cb17ade254d::flag_set("gas_station_create_script_initialized");
    level callback::add("register_activities", &function_98dce143b7f266cb);
    level callback::add("register_objectives", &function_ecabf4e0ca8cab0);
    function_3c4622aaf1b2a77a();
    namespace_f19749db1ea23f08::main();
    thread namespace_6776e8e74ed64842::init();
    if (getdvar(@"hash_6ffd9adb060c50c9", "0") == "1") {
        namespace_b543cbaf1e32456f::main();
        thread namespace_d7e80b14e1130dc4::init();
    }
    thread function_a8cb2ad76bdd3bf0();
}

// Namespace namespace_cac9b95740fca4e0/namespace_f14d97da70ba358f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x272
// Size: 0x12f
function function_a966511aed9b0851() {
    setdvar(@"hash_f1d095735ac37f33", 1);
    waitframe();
    function_9b8829ab4092a7d7("ob_zombie_ambient", 1);
    var_f6e341b64f830a1 = namespace_3c37cb17ade254d::getstructarray("s_ob_infil_supress", "targetname");
    foreach (pos in var_f6e341b64f830a1) {
        function_606642b946a01237("infil_supress", pos.origin, pos.radius, 1);
    }
    var_102014ab68ac4b78 = namespace_3c37cb17ade254d::getstructarray("s_ambient_blocker", "targetname");
    foreach (pos in var_102014ab68ac4b78) {
        if (isdefined(pos.radius)) {
            function_606642b946a01237("ambient_blocker", pos.origin, pos.radius, 1);
        }
    }
}

// Namespace namespace_cac9b95740fca4e0/namespace_f14d97da70ba358f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a8
// Size: 0x11
function function_a8cb2ad76bdd3bf0() {
    function_95dc47abc9ef28ae();
    namespace_614554f86e52695c::function_b1fa4578ef08136f();
}

// Namespace namespace_cac9b95740fca4e0/namespace_f14d97da70ba358f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c0
// Size: 0xf
function function_95dc47abc9ef28ae() {
    flag_wait("mp_jup_st_g_ob_contracts_merc_defend_cs_completed");
}

