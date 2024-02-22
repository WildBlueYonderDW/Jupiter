// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_2583ee5680cf4736;
#using script_58be75c518bf0d40;
#using script_485622d93fa7e4cf;
#using script_100adcc1cc11d2fa;
#using scripts\mp\objidpoolmanager.gsc;
#using script_6a8ec730b2bfa844;
#using script_1f97a44d1761c919;
#using script_3390b73ac3318fe;
#using script_7f9409b703dad400;
#using script_3b64eb40368c1450;
#using script_6f65366f542f6627;

#namespace namespace_7765eded20782405;

// Namespace namespace_7765eded20782405/namespace_c20fe7cc65d9c979
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211
// Size: 0x29
function function_f4c2323079c53ba9() {
    var_416c24d93444a99d = function_4023d3767132f070();
    level flag_wait("ob_infil_completed");
    function_4541ead83ea24437(var_416c24d93444a99d);
}

// Namespace namespace_7765eded20782405/namespace_c20fe7cc65d9c979
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x241
// Size: 0x8a
function function_4023d3767132f070() {
    var_4e87f0484feb2758 = getstruct("s1_mission_rift", "targetname");
    var_416c24d93444a99d = utility::spawn_model("jup_zm_rift_portal_small", var_4e87f0484feb2758.origin, var_4e87f0484feb2758.angles);
    waitframe();
    var_416c24d93444a99d setscriptablepartstate("aether_exit_body", "rift_mission_infil");
    var_885095f29666fd07 = namespace_5775ad2badedbcaa::function_90472496b91b94b3(var_416c24d93444a99d, 140, &function_dd50de34ad9f5b2f);
    var_885095f29666fd07 namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_816b580f6517f4fa);
    var_416c24d93444a99d hide();
    return var_416c24d93444a99d;
}

// Namespace namespace_7765eded20782405/namespace_c20fe7cc65d9c979
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d3
// Size: 0x31
function function_816b580f6517f4fa(interact, player) {
    return {string:"JUP_OB_S1/MISSION_RIFT_ENTRY_HINT", type:"HINT_BUTTON"};
}

// Namespace namespace_7765eded20782405/namespace_c20fe7cc65d9c979
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c
// Size: 0xd0
function function_4541ead83ea24437(var_416c24d93444a99d) {
    foreach (player in level.players) {
        if (function_c7d3c1cb4a3958cf(player, 27131) || player namespace_9571f642f38c8169::function_3bb8b73991355a1(0) || getdvarint(@"hash_3b2a312a55f42bcd", 0) == 1) {
            var_416c24d93444a99d showtoplayer(player);
            player thread function_771cbd84a236e2ba(var_416c24d93444a99d.origin);
            if (function_c7d3c1cb4a3958cf(player, 27131) || getdvarint(@"hash_3b2a312a55f42bcd", 0) == 1) {
                player thread function_8b67e03b991ac60f();
            }
        }
    }
}

// Namespace namespace_7765eded20782405/namespace_c20fe7cc65d9c979
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e3
// Size: 0x1a
function function_8b67e03b991ac60f() {
    wait(10);
    level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s1_rift_intro_conv", [0:self]);
}

// Namespace namespace_7765eded20782405/namespace_c20fe7cc65d9c979
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x404
// Size: 0x4a
function function_771cbd84a236e2ba(var_10e651ba309f0523) {
    while (isdefined(self)) {
        if (distance2dsquared(var_10e651ba309f0523, self.origin) < squared(900)) {
            level thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s1_infil_approach", [0:self]);
            return;
        }
        wait(0.2);
    }
}

// Namespace namespace_7765eded20782405/namespace_c20fe7cc65d9c979
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x455
// Size: 0xd3
function function_dd50de34ad9f5b2f(player) {
    level thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s1_infil_interact", player getsquadmembers(undefined, 0));
    foreach (var_3329887886bd6a4b in player getsquadmembers(undefined, 0)) {
        self disableplayeruse(var_3329887886bd6a4b);
    }
    namespace_6c57c664b4288f88::function_93c8f90c3bd798c6(player, 30, &function_d7cf952e6f352615);
    foreach (var_3329887886bd6a4b in player getsquadmembers(undefined, 0)) {
        self enableplayeruse(var_3329887886bd6a4b);
    }
}

// Namespace namespace_7765eded20782405/namespace_c20fe7cc65d9c979
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52f
// Size: 0x174
function function_d7cf952e6f352615(player) {
    var_9b0dd04874627a99 = player getsquadmembers(undefined, 1);
    n_time_limit = 10;
    timer = namespace_26c5a699d7cb84a2::function_3eec8a169e8a0936(n_time_limit);
    waitframe();
    while (timer.var_84ceb983b1ef5f11 != 1) {
        n_time_remaining = int(timer.var_621cb2c0d9b1cdae);
        foreach (var_c0c0df46978788e1 in var_9b0dd04874627a99) {
            var_c0c0df46978788e1 setclientomnvar("ui_is_exfil_countdown", 1);
            var_c0c0df46978788e1 setclientomnvar("ui_match_start_countdown", n_time_remaining);
        }
        wait(0.5);
    }
    foreach (player in var_9b0dd04874627a99) {
        player namespace_1cd9f6896754adb0::set("rift_gate_teleport", "ignoreme", 1);
        player namespace_1cd9f6896754adb0::set("rift_gate_teleport", "damage", 0);
        player namespace_1cd9f6896754adb0::set("rift_gate_teleport", "fire", 0);
        player playerhide();
        player thread namespace_cc781f142d33c074::function_2241b80779e319a0();
    }
    wait(5);
    namespace_cddd3ad399b210ff::function_e229d89e0c38206d(var_9b0dd04874627a99, 1004);
}

