#using script_2047cdbf5176ba0;
#using script_92b815b18f0ba61;
#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using script_6c49326fa248a5f;
#using script_277259cfc5f60311;
#using script_2322b42c4dbbfaf0;
#using script_62a4f7a62643fe8;
#using script_36b7b4e4089e73a3;
#using script_222f62686867436a;
#using script_7dc8e85b881c90f9;
#using script_7ff1c5399d2d9500;
#using script_4c1b5c23b42630d0;
#using script_2816a042b9f7996;
#using script_22f1701e151b9d12;

#namespace namespace_fc9fbb1327b093f9;

// Namespace namespace_fc9fbb1327b093f9 / namespace_cd249032b49ee5a3
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x209
// Size: 0x10
function autoexec init() {
    level.var_ba419fdced2d3dfb = &main;
}

// Namespace namespace_fc9fbb1327b093f9 / namespace_cd249032b49ee5a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x221
// Size: 0x107
function main() {
    function_eb7f544259415a09("mp_jup_bigmap_ob");
    level thread function_86d8adec4715ad88();
    namespace_c670458343d549::main();
    namespace_33b40b2604afd299::main();
    scripts\engine\utility::flag_set("gas_station_create_script_initialized");
    function_3c461faaf1b2a0e1();
    namespace_e03919da9578d3dc::main();
    thread namespace_6776e8e74ed64842::init();
    if (getdvarint(@"hash_f0651d120dc93cc7", 0)) {
        namespace_25a0f0fe5a85d32b::main();
        namespace_609a40b1d504a670::function_5d445c791ef3fc0a();
        return;
    } else {
        namespace_609a40b1d504a670::function_aa1b5db86c89322d(0);
    }
    if (getdvar(@"hash_6ffd9adb060c50c9", "0") == "1") {
        namespace_6200cd97cd5820b3::main();
        thread namespace_d7e80b14e1130dc4::init();
    }
    level callback::add("register_activities", &function_98dce443b7f26d64);
    level callback::add("register_objectives", &function_ecac44e0ca8d5af);
    level callback::add("register_features", &function_78d867de4d172a6);
    namespace_7535ac2674e02eca::main();
    thread function_8067780aedbae5af();
    var_21af83bdbe252426 = getstructarray("vehicle_group_b", "script_noteworthy");
    level thread namespace_f9b6a4254d2d8100::function_63c6d4fbc0bc4d94(var_21af83bdbe252426);
}

// Namespace namespace_fc9fbb1327b093f9 / namespace_cd249032b49ee5a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x330
// Size: 0x12e
function function_86d8adec4715ad88() {
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

// Namespace namespace_fc9fbb1327b093f9 / namespace_cd249032b49ee5a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x466
// Size: 0x10
function function_8067780aedbae5af() {
    function_54df6f4695546973();
    namespace_614554f86e52695c::function_b1fa4578ef08136f();
}

// Namespace namespace_fc9fbb1327b093f9 / namespace_cd249032b49ee5a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47e
// Size: 0xe
function function_54df6f4695546973() {
    flag_wait("mp_jup_st_b_ob_contracts_merc_defend_cs_completed");
}

