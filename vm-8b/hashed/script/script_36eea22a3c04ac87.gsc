#using scripts\common\callbacks.gsc;
#using script_1f97a44d1761c919;
#using script_58be75c518bf0d40;
#using scripts\engine\utility.gsc;
#using scripts\mp\hud_message.gsc;
#using script_100adcc1cc11d2fa;
#using script_2583ee5680cf4736;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_3390b73ac3318fe;
#using script_7f9409b703dad400;
#using scripts\common\values.gsc;
#using script_6f65366f542f6627;
#using scripts\common\devgui.gsc;

#namespace namespace_d392c741e67a9c64;

// Namespace namespace_d392c741e67a9c64 / namespace_5cbfe3d9044efce3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34a
// Size: 0xb4
function function_b7cec7edca510b6b() {
    utility::flag_wait("ob_objectives_registered");
    if (utility::flag("unstable_rift_portal_initialized")) {
        return;
    }
    level.var_3299d293d9648d99 = [];
    level.var_a92054ea19f4dde6 = getstructarray("unstable_rift_portal", "targetname");
    level.var_47d7af4af68768cc = getdvarint(@"hash_f75948e899e0557f", 3);
    level.var_d3b2f54fbf60a672 = getdvarint(@"hash_607b24b853748a3", 300);
    level.var_fbe305fce9dd0c4e = getdvarint(@"hash_9c272f94f0c1b2b5", 30);
    callback::add("obelisk_completed", &function_dd77015bf987370f);
    /#
        thread function_10bf015102ee77c8();
    #/
    utility::flag_set("unstable_rift_portal_initialized");
}

// Namespace namespace_d392c741e67a9c64 / namespace_5cbfe3d9044efce3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x406
// Size: 0x8a
function function_dd77015bf987370f(params) {
    if (!isdefined(level.var_c5c53b345aa6ebc2)) {
        level.var_c5c53b345aa6ebc2 = 0;
    }
    if (!isdefined(level.var_cf55125362980498)) {
        level.var_cf55125362980498 = 0;
    }
    level.var_c5c53b345aa6ebc2++;
    level.var_cf55125362980498++;
    if (level.var_cf55125362980498 >= level.var_47d7af4af68768cc) {
        level.var_cf55125362980498 = 0;
        function_de6cae07e4e01728(params.obelisk, params.var_7c5e1244d0e9acfa);
    }
}

// Namespace namespace_d392c741e67a9c64 / namespace_5cbfe3d9044efce3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x498
// Size: 0x20d
function function_de6cae07e4e01728(var_56f4c09428e147f, var_7c5e1244d0e9acfa) {
    s_portal = function_d96703e7edd5c880(var_56f4c09428e147f);
    if (!isdefined(s_portal)) {
        return;
    }
    level.var_a92054ea19f4dde6 = array_remove(level.var_a92054ea19f4dde6, s_portal);
    portal = spawnscriptable(%"hash_4b1a475882042d49", s_portal.origin, s_portal.angles);
    portal.s_portal = s_portal;
    level.var_3299d293d9648d99[level.var_3299d293d9648d99.size] = portal;
    namespace_5775ad2badedbcaa::function_32645103f7520635(portal, &portal_used);
    portal setscriptablepartstate("entrance_vfx", "on");
    a_valid_players = [];
    if (!isdefined(var_7c5e1244d0e9acfa)) {
        var_7c5e1244d0e9acfa = [];
    }
    foreach (player in var_7c5e1244d0e9acfa) {
        a_squad = player getsquadmembers(undefined, 0);
        foreach (squad_player in a_squad) {
            a_valid_players = function_6d6af8144a5131f1(a_valid_players, squad_player);
        }
    }
    foreach (player in a_valid_players) {
        player scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout(18, portal.origin, portal.index);
        player thread hud_message::showsplash("jup_ob_unstable_rift_portal_spawned", undefined, undefined, undefined, 1, "splash_list_jup_ob");
    }
    thread overlord::playevent("unstable_rift_portal_open_opening_team", a_valid_players);
    thread function_dca9bb8b801c62cf(a_valid_players, portal);
    portal thread function_64ffd734230070ac();
}

// Namespace namespace_d392c741e67a9c64 / namespace_5cbfe3d9044efce3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6ad
// Size: 0xf0
function function_dca9bb8b801c62cf(a_valid_players, portal) {
    level endon("game_ended");
    portal endon("portal_used");
    portal endon("death");
    n_wait = level.var_fbe305fce9dd0c4e;
    wait n_wait;
    if (isdefined(portal)) {
        var_b32fdba42bd8e094 = [];
        foreach (player in level.players) {
            if (!arraycontains(a_valid_players, player)) {
                player scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout(18, portal.origin, portal.index);
                player thread hud_message::showsplash("jup_ob_unstable_rift_portal_spawned", undefined, undefined, undefined, 1, "splash_list_jup_ob");
                var_b32fdba42bd8e094[var_b32fdba42bd8e094.size] = player;
            }
        }
        thread overlord::playevent("unstable_rift_portal_open_other_teams", var_b32fdba42bd8e094);
    }
}

// Namespace namespace_d392c741e67a9c64 / namespace_5cbfe3d9044efce3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7a5
// Size: 0x56
function function_d96703e7edd5c880(var_56f4c09428e147f) {
    if (level.var_a92054ea19f4dde6.size <= 0) {
        return undefined;
    }
    level.var_a92054ea19f4dde6 = sortbydistance(level.var_a92054ea19f4dde6, var_56f4c09428e147f.origin);
    s_portal = level.var_a92054ea19f4dde6[0];
    return s_portal;
}

// Namespace namespace_d392c741e67a9c64 / namespace_5cbfe3d9044efce3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x804
// Size: 0x51
function function_64ffd734230070ac() {
    self endon("death");
    wait level.var_d3b2f54fbf60a672;
    if (!isdefined(self) || istrue(self.var_18c9cb5bab048538)) {
        return;
    }
    thread overlord::playevent("unstable_rift_portal_close_timeout", level.players);
    self.timed_out = 1;
    function_fe40b80b733d3128(self);
}

// Namespace namespace_d392c741e67a9c64 / namespace_5cbfe3d9044efce3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x85d
// Size: 0x70
function function_fe40b80b733d3128(portal) {
    if (!isdefined(portal)) {
        return;
    }
    portal setscriptablepartstate("entrance_vfx", "closing");
    wait 3;
    level.var_3299d293d9648d99 = array_remove(level.var_3299d293d9648d99, portal);
    level.var_a92054ea19f4dde6 = function_6d6af8144a5131f1(level.var_a92054ea19f4dde6, portal.s_portal);
    portal freescriptable();
    portal notify("death");
}

// Namespace namespace_d392c741e67a9c64 / namespace_5cbfe3d9044efce3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d5
// Size: 0x183
function portal_used(player) {
    foreach (var_3329887886bd6a4b in player getsquadmembers(undefined, 0)) {
        var_3329887886bd6a4b setclientomnvar("ui_ob_unstable_rift_vote", 1);
        self disableplayeruse(var_3329887886bd6a4b);
    }
    self setscriptablepartstate("usable_state", "unusable");
    var_8e3e3673432e9a12 = namespace_6c57c664b4288f88::function_93c8f90c3bd798c6(player, 30, undefined);
    foreach (var_3329887886bd6a4b in player getsquadmembers(undefined, 0)) {
        var_3329887886bd6a4b setclientomnvar("ui_ob_unstable_rift_vote", 0);
    }
    if (!isdefined(self) || istrue(self.timed_out)) {
        return;
    }
    foreach (var_3329887886bd6a4b in player getsquadmembers(undefined, 0)) {
        self enableplayeruse(var_3329887886bd6a4b);
    }
    if (istrue(var_8e3e3673432e9a12)) {
        self.var_18c9cb5bab048538 = 1;
        level thread function_a629ae912e5ea368(player);
        level thread function_3dece423c8f443c9(self, player);
        return;
    }
    self setscriptablepartstate("usable_state", "usable");
}

// Namespace namespace_d392c741e67a9c64 / namespace_5cbfe3d9044efce3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa60
// Size: 0x7e
function function_3dece423c8f443c9(portal, player) {
    portal notify("portal_used");
    portal setscriptablepartstate("usable_state", "unusable");
    wait 10;
    var_b173aca835fd03c2 = player getsquadmembers(undefined, 1);
    var_fa976459b24e975f = utility::array_remove_array(level.players, var_b173aca835fd03c2);
    utility::delaythread(3, &overlord::playevent, "unstable_rift_portal_close_squad_entered", var_fa976459b24e975f);
    function_fe40b80b733d3128(portal);
}

// Namespace namespace_d392c741e67a9c64 / namespace_5cbfe3d9044efce3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae6
// Size: 0x1de
function function_a629ae912e5ea368(player) {
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
    namespace_cddd3ad399b210ff::function_e229d89e0c38206d(a_squad, 1016);
}

/#

    // Namespace namespace_d392c741e67a9c64 / namespace_5cbfe3d9044efce3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xccc
    // Size: 0xbb
    function function_10bf015102ee77c8() {
        wait 5;
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x1c>");
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x4d>", "<dev string:x66>", &function_6a4bb8a62f619584, 1);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x85>", "<dev string:xa3>", &function_9c5c4acc471ac380, 1);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:xc7>", "<dev string:xe0>", &function_a2b8e3e26381cbc5, 1);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:xfe>", "<dev string:x12b>", &function_9ecaf8b1fd98837e);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x168>", "<dev string:x194>", &function_9ecaf8b1fd98837e);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x1d0>", "<dev string:x1ff>", &function_9ecaf8b1fd98837e);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x23e>", "<dev string:x267>", &function_9ecaf8b1fd98837e);
        scripts\common\devgui::function_fe953f000498048f();
    }

    // Namespace namespace_d392c741e67a9c64 / namespace_5cbfe3d9044efce3
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xd8f
    // Size: 0x43
    function function_6a4bb8a62f619584(params) {
        s_params = spawnstruct();
        s_params.obelisk = level.players[0];
        callback("<dev string:x2a0>", s_params);
    }

    // Namespace namespace_d392c741e67a9c64 / namespace_5cbfe3d9044efce3
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xdda
    // Size: 0x20
    function function_9c5c4acc471ac380(params) {
        function_de6cae07e4e01728(level.players[0]);
    }

    // Namespace namespace_d392c741e67a9c64 / namespace_5cbfe3d9044efce3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe02
    // Size: 0x9a
    function function_a2b8e3e26381cbc5() {
        while (true) {
            foreach (portal in level.var_a92054ea19f4dde6) {
                sphere(portal.origin, 500, (1, 0, 0), 0, int(1 / level.framedurationseconds) + 1);
            }
            wait 1;
        }
    }

    // Namespace namespace_d392c741e67a9c64 / namespace_5cbfe3d9044efce3
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xea4
    // Size: 0xad
    function function_9ecaf8b1fd98837e(params) {
        switch (params[0]) {
        case #"hash_884a3ea31b587282": 
            thread overlord::playevent("<dev string:x2ca>", level.players);
            break;
        case #"hash_a415c6b118258795": 
            thread overlord::playevent("<dev string:x308>", level.players);
            break;
        case #"hash_f5e8be1ceff41f16": 
            thread overlord::playevent("<dev string:x348>", level.players);
            break;
        case #"hash_bf91fb35faa9902f": 
            thread overlord::playevent("<dev string:x385>", level.players);
            break;
        }
    }

#/
