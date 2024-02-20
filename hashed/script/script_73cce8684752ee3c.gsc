// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_371b4c2ab5861e62;
#using script_4f77311cb9cdbcd8;
#using script_4ee9ddbac96043d;
#using script_72d8b9a42b2ad18e;
#using script_143339c9193c3014;
#using script_491cd13f1d92755a;
#using script_9ab0ac09186bd57;
#using script_2bb9b5aafb469330;

#namespace namespace_107fd838b396315b;

// Namespace namespace_107fd838b396315b/namespace_539891a454faca38
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1f5
// Size: 0x6e
function autoexec init() {
    level callback::add("ob_season_main", &main);
    level callback::add("ob_register_activities", &register_activities);
    level callback::add("ob_register_objectives", &register_objectives);
    level callback::add("ob_register_features", &register_features);
    level.var_5a66999895b55b96 = getdvarint(@"hash_bd0a763d48b336f5", 0) > 0;
    level thread function_b7c9f9d63797a2c8();
}

// Namespace namespace_107fd838b396315b/namespace_539891a454faca38
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26a
// Size: 0x61
function main(params) {
    mapname = getmapname();
    switch (mapname) {
    case #"hash_2a218509d1620d9d":
    case #"hash_9ae3f9a4f2372775":
        namespace_192f34362585a30c::main();
        namespace_c20fe7cc65d9c979::function_f4c2323079c53ba9();
        break;
    }
    level callback::remove("ob_season_main", &main);
}

// Namespace namespace_107fd838b396315b/namespace_539891a454faca38
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d2
// Size: 0x1e
function register_activities(params) {
    level callback::remove("ob_register_activities", &register_activities);
}

// Namespace namespace_107fd838b396315b/namespace_539891a454faca38
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f7
// Size: 0x1e
function register_objectives(params) {
    level callback::remove("ob_register_objectives", &register_objectives);
}

// Namespace namespace_107fd838b396315b/namespace_539891a454faca38
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31c
// Size: 0xd8
function register_features(params) {
    mapname = getmapname();
    switch (mapname) {
    case #"hash_9ae3f9a4f2372775":
        namespace_5df1979c291606ac::main();
        namespace_ca2191c2f05ae3e2::main();
        namespace_b46e2ad0ff7f74e0::main();
        namespace_bd75c42ae4302829::main();
        namespace_a215515661f7dd6::main();
        break;
    case #"hash_2a217c09d161ff72":
        namespace_5df1979c291606ac::main();
        break;
    case #"hash_2a217a09d161fc4c":
        namespace_ca2191c2f05ae3e2::main();
        break;
    case #"hash_2a217809d161f926":
        namespace_b46e2ad0ff7f74e0::main();
        break;
    case #"hash_2a217709d161f793":
        namespace_bd75c42ae4302829::main();
        break;
    case #"hash_2a217609d161f600":
        namespace_a215515661f7dd6::main();
        break;
    }
    level callback::remove("ob_register_features", &register_features);
}

// Namespace namespace_107fd838b396315b/namespace_539891a454faca38
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3fb
// Size: 0x80
function private function_b7c9f9d63797a2c8() {
    level endon("game_ended");
    level flag_wait("ai_spawn_director_initialized");
    if (function_d415276dab42fc0(0)) {
        level.var_ab4e7a61416509ca = &function_172e297dffe1a7bf;
        function_9b8829ab4092a7d7("codmas", 1);
        return;
    }
    while (1) {
        if (isarray(level.agent_definition)) {
            break;
        }
        waitframe();
    }
    if (function_d415276dab42fc0(1)) {
        function_9b8829ab4092a7d7("codmas", 1);
        level.var_ab4e7a61416509ca = &function_172e297dffe1a7bf;
    }
}

// Namespace namespace_107fd838b396315b/namespace_539891a454faca38
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x482
// Size: 0xe8
function private function_d415276dab42fc0(var_4e2d0a39c455ea73) {
    var_f66479931405b0b2 = 0;
    if (istrue(var_4e2d0a39c455ea73)) {
        aitypes = function_3290e192ac188e2d("zombie_mimic");
        foreach (aitype in aitypes) {
            if (issubstr(aitype, "xmas")) {
                var_f66479931405b0b2 = 1;
            }
        }
    }
    var_edff4b1061421db2 = getdvarint(@"hash_7019141b37b54155", -1) != 0 && getdvarint(@"hash_2ae6c0317f5baf93", 0);
    if (var_edff4b1061421db2 != -1) {
        if (var_edff4b1061421db2 > 0 && var_4e2d0a39c455ea73) {
            /#
                assertex(var_f66479931405b0b2, "Trying to enable codmas aitypes but not loaded in map");
            #/
            if (!var_f66479931405b0b2) {
                return 0;
            }
        }
        return (var_edff4b1061421db2 > 0);
    }
    return var_f66479931405b0b2;
}

// Namespace namespace_107fd838b396315b/namespace_539891a454faca38
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x572
// Size: 0x58
function private function_172e297dffe1a7bf(aitype) {
    var_48e66b9f9278ec0c = aitype;
    if (issubstr(aitype, "zombie") && getsubstr(aitype, aitype.size - 4, aitype.size) != "xmas") {
        var_48e66b9f9278ec0c = aitype + "_xmas";
        if (isdefined(level.agent_definition[var_48e66b9f9278ec0c])) {
            return var_48e66b9f9278ec0c;
        }
    }
    return aitype;
}

