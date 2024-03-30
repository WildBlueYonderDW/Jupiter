// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_2583ee5680cf4736;
#using script_58be75c518bf0d40;
#using script_485622d93fa7e4cf;
#using script_100adcc1cc11d2fa;
#using scripts\mp\objidpoolmanager.gsc;
#using script_6a8ec730b2bfa844;
#using script_1f97a44d1761c919;
#using script_3390b73ac3318fe;
#using script_7f9409b703dad400;
#using scripts\common\values.gsc;
#using script_6f65366f542f6627;

#namespace namespace_7765eded20782405;

// Namespace namespace_7765eded20782405 / namespace_c20fe7cc65d9c979
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211
// Size: 0x29
function function_f4c2323079c53ba9() {
    riftgate = create_portal();
    level flag_wait("ob_infil_completed");
    activate_portal(riftgate);
}

// Namespace namespace_7765eded20782405 / namespace_c20fe7cc65d9c979
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x241
// Size: 0x8a
function create_portal() {
    var_4e87f0484feb2758 = getstruct("s1_mission_rift", "targetname");
    riftgate = utility::spawn_model("jup_zm_rift_portal_small", var_4e87f0484feb2758.origin, var_4e87f0484feb2758.angles);
    waitframe();
    riftgate setscriptablepartstate("aether_exit_body", "rift_mission_infil");
    var_885095f29666fd07 = namespace_5775ad2badedbcaa::register_interact(riftgate, 140, &function_dd50de34ad9f5b2f);
    var_885095f29666fd07 namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_816b580f6517f4fa);
    riftgate hide();
    return riftgate;
}

// Namespace namespace_7765eded20782405 / namespace_c20fe7cc65d9c979
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d3
// Size: 0x31
function function_816b580f6517f4fa(interact, player) {
    return {string:"JUP_OB_S1/MISSION_RIFT_ENTRY_HINT", type:"HINT_BUTTON"};
}

// Namespace namespace_7765eded20782405 / namespace_c20fe7cc65d9c979
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c
// Size: 0xd0
function activate_portal(riftgate) {
    foreach (player in level.players) {
        if (function_c7d3c1cb4a3958cf(player, 27131) || player namespace_9571f642f38c8169::function_3bb8b73991355a1(0) || getdvarint(@"hash_3b2a312a55f42bcd", 0) == 1) {
            riftgate showtoplayer(player);
            player thread function_771cbd84a236e2ba(riftgate.origin);
            if (function_c7d3c1cb4a3958cf(player, 27131) || getdvarint(@"hash_3b2a312a55f42bcd", 0) == 1) {
                player thread function_8b67e03b991ac60f();
            }
        }
    }
}

// Namespace namespace_7765eded20782405 / namespace_c20fe7cc65d9c979
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e3
// Size: 0x1a
function function_8b67e03b991ac60f() {
    wait(10);
    level thread namespace_446fc987a980892f::playconversation("quest_s1_rift_intro_conv", [self]);
}

// Namespace namespace_7765eded20782405 / namespace_c20fe7cc65d9c979
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x404
// Size: 0x4a
function function_771cbd84a236e2ba(portalloc) {
    while (isdefined(self)) {
        if (distance2dsquared(portalloc, self.origin) < squared(900)) {
            level thread namespace_446fc987a980892f::playevent("quest_s1_infil_approach", [self]);
            return;
        }
        wait(0.2);
    }
}

// Namespace namespace_7765eded20782405 / namespace_c20fe7cc65d9c979
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x455
// Size: 0xd3
function function_dd50de34ad9f5b2f(player) {
    level thread namespace_446fc987a980892f::playevent("quest_s1_infil_interact", player getsquadmembers(undefined, 0));
    foreach (var_3329887886bd6a4b in player getsquadmembers(undefined, 0)) {
        self disableplayeruse(var_3329887886bd6a4b);
    }
    namespace_6c57c664b4288f88::function_93c8f90c3bd798c6(player, 30, &function_d7cf952e6f352615);
    foreach (var_3329887886bd6a4b in player getsquadmembers(undefined, 0)) {
        self enableplayeruse(var_3329887886bd6a4b);
    }
}

// Namespace namespace_7765eded20782405 / namespace_c20fe7cc65d9c979
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52f
// Size: 0x174
function function_d7cf952e6f352615(player) {
    a_squad = player getsquadmembers(undefined, 1);
    n_time_limit = 10;
    timer = namespace_26c5a699d7cb84a2::function_3eec8a169e8a0936(n_time_limit);
    waitframe();
    while (timer.progresscomplete != 1) {
        n_time_remaining = int(timer.var_621cb2c0d9b1cdae);
        foreach (squaddie in a_squad) {
            squaddie setclientomnvar("ui_is_exfil_countdown", 1);
            squaddie setclientomnvar("ui_match_start_countdown", n_time_remaining);
        }
        wait(0.5);
    }
    foreach (player in a_squad) {
        player scripts/common/values::set("rift_gate_teleport", "ignoreme", 1);
        player scripts/common/values::set("rift_gate_teleport", "damage", 0);
        player scripts/common/values::set("rift_gate_teleport", "fire", 0);
        player playerhide();
        player thread namespace_cc781f142d33c074::function_2241b80779e319a0();
    }
    wait(5);
    namespace_cddd3ad399b210ff::function_e229d89e0c38206d(a_squad, 1004);
}

