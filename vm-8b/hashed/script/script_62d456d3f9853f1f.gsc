#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_2583ee5680cf4736;
#using script_58be75c518bf0d40;
#using script_485622d93fa7e4cf;
#using scripts\mp\objidpoolmanager.gsc;
#using script_100adcc1cc11d2fa;
#using script_6a8ec730b2bfa844;
#using script_1f97a44d1761c919;
#using script_3390b73ac3318fe;
#using script_7f9409b703dad400;
#using scripts\common\values.gsc;
#using script_6f65366f542f6627;

#namespace namespace_7208ecf7be48a477;

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31c
// Size: 0x26
function function_cee5bf8a986d86df() {
    load_vfx();
    level thread create_portal();
    level flag_wait("ob_infil_completed");
    function_e7b170d8b549d076();
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34a
// Size: 0x36
function load_vfx() {
    level._effect["acv_distortion"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_riftrun_traversal_distortion.vfx");
    level._effect["protection_bubble"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_acv_protection_bubble.vfx");
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x388
// Size: 0xc2
function create_portal() {
    flag_wait("create_script_initialized");
    spawndata = getstruct("ob_s3_story_mission_portal", "targetname");
    if (isdefined(spawndata)) {
        spawndata.initai = 0;
        spawndata.preventrespawn = 1;
        level.var_2400a3ac0894afbb = utility::spawn_model("jup_zm_rift_portal_small", spawndata.origin, spawndata.angles);
        waitframe();
        var_885095f29666fd07 = namespace_5775ad2badedbcaa::register_interact(level.var_2400a3ac0894afbb, 140, &function_dd50de34ad9f5b2f);
        var_885095f29666fd07 namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_816b580f6517f4fa);
        level.var_2400a3ac0894afbb hide();
        return;
    }
    println("<dev string:x1c>");
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x452
// Size: 0x28
function function_6502de8f1658ce59(player) {
    return namespace_8361bad7391de074::function_c7d3c1cb4a3958cf(player, 37309) || getdvarint(@"hash_6d8aae589576a2e7", 0);
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x483
// Size: 0x30
function function_816b580f6517f4fa(interact, player) {
    return {#string:%JUP_OB_S3/MISSION_RIFT_ENTRY_HINT, #type:"HINT_BUTTON"};
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bc
// Size: 0xbd
function function_e7b170d8b549d076() {
    level.var_2400a3ac0894afbb setscriptablepartstate("aether_exit_body", "rift_mission_infil_s3");
    foreach (player in level.players) {
        if (player namespace_9571f642f38c8169::function_3bb8b73991355a1(17) || function_6502de8f1658ce59(player) || getdvarint(@"hash_955a037e6f3238d7", 0)) {
            level.var_2400a3ac0894afbb showtoplayer(player);
            player thread function_771cbd84a236e2ba(level.var_2400a3ac0894afbb.origin);
        }
    }
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x581
// Size: 0x28
function function_8b67e03b991ac60f(obj_id) {
    level thread namespace_446fc987a980892f::playevent("s3_intro", [self]);
    objective_playermask_addshowplayer(obj_id, self);
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b1
// Size: 0xae
function function_771cbd84a236e2ba(portalloc) {
    level endon("game_ended");
    while (true) {
        if (isdefined(level.players)) {
            foreach (player in level.players) {
                if (distance2dsquared(portalloc, player.origin) < squared(900)) {
                    level thread namespace_446fc987a980892f::playevent("s3_portal_arrival", player getsquadmembers(undefined, 0));
                    return;
                }
            }
        }
        wait 0.2;
    }
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x667
// Size: 0xbd
function function_eedd40fa46e83c7(player) {
    var_c89e221b75ac840d = player getsquadmembers(undefined, 0);
    foreach (var_3329887886bd6a4b in var_c89e221b75ac840d) {
        self disableplayeruse(var_3329887886bd6a4b);
    }
    namespace_6c57c664b4288f88::function_93c8f90c3bd798c6(player, 30, &function_d7cf952e6f352615);
    foreach (var_3329887886bd6a4b in var_c89e221b75ac840d) {
        self enableplayeruse(var_3329887886bd6a4b);
    }
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72c
// Size: 0x14
function function_dd50de34ad9f5b2f(player) {
    thread function_eedd40fa46e83c7(player);
}

// Namespace namespace_7208ecf7be48a477 / namespace_34b6dd083314d3eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x748
// Size: 0x1dd
function function_d7cf952e6f352615(player) {
    a_squad = player getsquadmembers(undefined, 0);
    n_time_limit = 10;
    timer = namespace_26c5a699d7cb84a2::function_3eec8a169e8a0936(n_time_limit);
    waitframe();
    while (timer.progresscomplete != 1) {
        n_time_remaining = int(timer.var_621cb2c0d9b1cdae);
        foreach (squaddie in a_squad) {
            squaddie setclientomnvar("ui_is_exfil_countdown", 1);
            squaddie setclientomnvar("ui_match_start_countdown", n_time_remaining);
        }
        wait 0.5;
    }
    var_de86fccc00b662d7 = [];
    foreach (player in a_squad) {
        if (isalive(player) && player.sessionstate == "playing") {
            var_de86fccc00b662d7[var_de86fccc00b662d7.size] = player;
        }
    }
    a_squad = var_de86fccc00b662d7;
    foreach (player in a_squad) {
        player scripts\common\values::set("rift_gate_teleport", "ignoreme", 1);
        player scripts\common\values::set("rift_gate_teleport", "damage", 0);
        player scripts\common\values::set("rift_gate_teleport", "fire", 0);
        player playerhide();
        player thread namespace_cc781f142d33c074::function_2241b80779e319a0();
    }
    wait 5;
    namespace_cddd3ad399b210ff::function_e229d89e0c38206d(a_squad, 1010);
}

