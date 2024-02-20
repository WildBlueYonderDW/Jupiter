// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_7caebc5d4875185;
#using scripts\stealth\utility.gsc;
#using scripts\stealth\enemy.gsc;
#using script_638d701d263ee1ed;
#using scripts\stealth\player.gsc;

#namespace namespace_7d237edd1e605b4c;

// Namespace namespace_7d237edd1e605b4c/namespace_1b08b59b8674c1cc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc
// Size: 0xd7
function function_fb9de2c84b81e225() {
    flag_init("stealth_enabled");
    flag_init("level_stealth_initialized");
    flag_init("stealth_spotted");
    namespace_42207369e7a21b21::main();
    flag_set("level_stealth_initialized");
    callback::add("player_connect", &function_9835b18e8fd03f25);
    function_cdfd74e95368bd63(1);
    function_8368f8fe908ce8be(300);
    function_3c6ca4287e09d8b4(300);
    function_129c37cc2498c0d5(1000);
    function_c3c56969a259ab89(600);
    flag_wait("sentientpoolmanager_initialized");
    function_3d7d85d395df9243("Lethal_Static");
    setthreatbiasagainstall("Killstreak_Static", -10000);
    function_52eb45afb6040851();
    callback::add("on_zombie_ai_spawned", &function_c0aafded157c2f8a);
    callback::add("on_agent_spawned", &function_f2a020129a48ebdb);
    level namespace_e124d8b75dab4be0::set_stealth_func("event_should_ignore", &function_7e42763f1b217a62);
}

// Namespace namespace_7d237edd1e605b4c/namespace_1b08b59b8674c1cc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2da
// Size: 0x16e
function private function_7e42763f1b217a62(event) {
    if (event.receiver.unittype == "soldier") {
        return 0;
    } else {
        if (event.typeorig == "bulletwhizby") {
            return 1;
        }
        dist = distancesquared(event.receiver.origin, event.origin);
        if (event.typeorig == "footstep_walk") {
            var_3ff005c91ef572e3 = 375;
            if (isdefined(event.receiver.footstepdetectdistwalk) && event.receiver.footstepdetectdistwalk > 0) {
                var_3ff005c91ef572e3 = event.receiver.footstepdetectdistwalk;
            }
            if (dist > squared(var_3ff005c91ef572e3)) {
                return 1;
            }
        }
        if (event.typeorig == "footstep_sprint") {
            var_5430818c2f6b8ffa = 375;
            if (isdefined(event.receiver.footstepdetectdistsprint) && event.receiver.footstepdetectdistsprint > 0) {
                var_5430818c2f6b8ffa = event.receiver.footstepdetectdistsprint;
            }
            if (dist > squared(var_5430818c2f6b8ffa)) {
                return 1;
            }
        }
        return 0;
    }
}

// Namespace namespace_7d237edd1e605b4c/namespace_1b08b59b8674c1cc
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x44f
// Size: 0xdf
function private function_52eb45afb6040851() {
    var_7dc093fb71342953["prone"] = 4000;
    var_7dc093fb71342953["crouch"] = 6000;
    var_7dc093fb71342953["stand"] = 8000;
    var_7dc093fb71342953["shadow_prone"] = 0.05;
    var_7dc093fb71342953["shadow_crouch"] = 0.05;
    var_7dc093fb71342953["shadow_stand"] = 0.3;
    var_3b0034eb96b13650["prone"] = 4000;
    var_3b0034eb96b13650["crouch"] = 6000;
    var_3b0034eb96b13650["stand"] = 8000;
    var_3b0034eb96b13650["shadow_prone"] = 0.01;
    var_3b0034eb96b13650["shadow_crouch"] = 0.02;
    var_3b0034eb96b13650["shadow_stand"] = 0.38;
    var_8f3f480583606401["prone"] = 1.1;
    var_8f3f480583606401["crouch"] = 1.15;
    var_8f3f480583606401["stand"] = 1.2;
    namespace_e124d8b75dab4be0::set_detect_ranges(var_7dc093fb71342953, var_3b0034eb96b13650, var_8f3f480583606401);
}

// Namespace namespace_7d237edd1e605b4c/namespace_1b08b59b8674c1cc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x535
// Size: 0x57
function private function_c0aafded157c2f8a(params) {
    self.var_b19befc7a8bfc30f = 1;
    self.var_f9723ce1df93efe4 = 1;
    if (!isdefined(self.script_stealthgroup)) {
        self.script_stealthgroup = function_60ec71076d4f96b6();
    }
    thread namespace_6db9b2dcda758664::main();
    namespace_e124d8b75dab4be0::set_stealth_func("should_hunt", &function_a7dc8702a26f1e8d);
}

// Namespace namespace_7d237edd1e605b4c/namespace_1b08b59b8674c1cc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x593
// Size: 0x2f
function private function_f2a020129a48ebdb(params) {
    agent = params.agent;
    agent.var_275bfc58ce28d17a = 0;
}

// Namespace namespace_7d237edd1e605b4c/namespace_1b08b59b8674c1cc
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5c9
// Size: 0x4
function private function_a7dc8702a26f1e8d() {
    return 0;
}

// Namespace namespace_7d237edd1e605b4c/namespace_1b08b59b8674c1cc
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5d5
// Size: 0x80
function private function_60ec71076d4f96b6() {
    region = namespace_4df2ab39b0e96ec7::function_688103a7b4041bf8(self.origin);
    if (!isstring(region)) {
        region = "default_stealth_group_";
    }
    for (i = 0; i < 10; i++) {
        var_ec8af9ed3e95d273 = region + i;
        var_cb2e3e1bee48946c = function_dbc2d928c8e424d9(var_ec8af9ed3e95d273);
        if (!isdefined(var_cb2e3e1bee48946c) || var_cb2e3e1bee48946c.members.size < 40) {
            return var_ec8af9ed3e95d273;
        }
    }
}

// Namespace namespace_7d237edd1e605b4c/namespace_1b08b59b8674c1cc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x65c
// Size: 0x13
function private function_9835b18e8fd03f25(params) {
    namespace_975f381a5813b0fd::main();
}

