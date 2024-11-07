#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_2583ee5680cf4736;
#using script_58be75c518bf0d40;
#using script_485622d93fa7e4cf;
#using scripts\mp\objidpoolmanager.gsc;
#using script_3559130ee2bb3a29;
#using script_100adcc1cc11d2fa;
#using script_6a8ec730b2bfa844;
#using script_1f97a44d1761c919;
#using script_3390b73ac3318fe;
#using script_7f9409b703dad400;
#using scripts\common\values.gsc;
#using script_6f65366f542f6627;

#namespace namespace_578c71cd6a36c1ee;

// Namespace namespace_578c71cd6a36c1ee / namespace_c6fb841ce5c974f2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ff
// Size: 0x26
function function_852f483c0266f8aa() {
    load_vfx();
    level flag_wait("ob_infil_completed");
    level thread create_portal();
    function_e7b170d8b549d076();
}

// Namespace namespace_578c71cd6a36c1ee / namespace_c6fb841ce5c974f2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42d
// Size: 0x36
function load_vfx() {
    level._effect["acv_distortion"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_riftrun_traversal_distortion.vfx");
    level._effect["protection_bubble"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_acv_protection_bubble.vfx");
}

// Namespace namespace_578c71cd6a36c1ee / namespace_c6fb841ce5c974f2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46b
// Size: 0x1c8
function create_portal() {
    flag_wait("create_script_initialized");
    var_7b119637004f7656 = getstruct("ob_s2_story_mission_portal_acv", "targetname");
    var_7b119637004f7656.initai = 0;
    var_7b119637004f7656.preventrespawn = 1;
    level.var_cae8e96cd4662c04 = spawn("script_model", var_7b119637004f7656.origin);
    level.var_cae8e96cd4662c04 setmodel("jup_ob_s2_mission_portal_acv");
    level.var_cae8e96cd4662c04 setscriptablepartstate("body", "active");
    createnavbadplacebyshape(level.var_cae8e96cd4662c04.origin, (0, 0, 0), 4, 75, 50);
    var_b82aed2bb2f40ef4 = getstruct("ob_s2_story_mission_portal", "targetname");
    level.var_be5a3570ed606f55 = utility::spawn_model("jup_zm_rift_portal_small", var_b82aed2bb2f40ef4.origin, var_b82aed2bb2f40ef4.angles);
    waitframe();
    level.var_be5a3570ed606f55 setscriptablepartstate("aether_exit_body", "rift_mission_infil_s2");
    var_885095f29666fd07 = namespace_5775ad2badedbcaa::register_interact(level.var_be5a3570ed606f55, 140, &function_dd50de34ad9f5b2f);
    var_885095f29666fd07 namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_816b580f6517f4fa);
    foreach (player in level.players) {
        if (isdefined(player)) {
            player thread function_5db463c76967e543();
            level.var_be5a3570ed606f55 hidefromplayer(player);
            level.var_cae8e96cd4662c04 hidefromplayer(player);
        }
    }
    level thread function_e7b170d8b549d076();
}

// Namespace namespace_578c71cd6a36c1ee / namespace_c6fb841ce5c974f2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x63b
// Size: 0x2a7
function function_5db463c76967e543() {
    self endon("disconnect");
    while (true) {
        if (!isdefined(level.var_be5a3570ed606f55) || !isdefined(self) || !isplayer(self)) {
            return;
        }
        level.var_35171ed239f57586 = getdvarfloat(@"hash_fe8a0d0706d94884", 24000);
        if (isdefined(level.var_be5a3570ed606f55.origin) && isdefined(level.var_35171ed239f57586)) {
            portalloc = level.var_be5a3570ed606f55.origin;
            if (distance2dsquared(portalloc, self.origin) < squared(level.var_35171ed239f57586)) {
                if (namespace_8361bad7391de074::function_c7d3c1cb4a3958cf(self, 29841) || getdvarint(@"hash_dfaa198bfa658180", 0)) {
                    if (!istrue(self.var_61525324b8ceea0) && !istrue(self.var_941b48d7c0cb685b)) {
                        namespace_446fc987a980892f::playconversation("s2_intro", [self]);
                        self.var_61525324b8ceea0 = 1;
                    }
                }
            }
        }
        level.var_33034a8465b1c317 = getdvarfloat(@"hash_cc173ff3e4ec7389", 18000);
        if (isdefined(level.var_be5a3570ed606f55.origin) && isdefined(level.var_33034a8465b1c317)) {
            portalloc = level.var_be5a3570ed606f55.origin;
            if (distance2dsquared(portalloc, self.origin) < squared(level.var_33034a8465b1c317)) {
                if (namespace_8361bad7391de074::function_c7d3c1cb4a3958cf(self, 29841) || getdvarint(@"hash_dfaa198bfa658180", 0)) {
                    if (!istrue(self.var_34d8431f62b8ce7c) && !istrue(self.var_941b48d7c0cb685b)) {
                        namespace_446fc987a980892f::playconversation("s2_traversal", [self]);
                        self.var_34d8431f62b8ce7c = 1;
                    }
                }
            }
        }
        level.var_1921321c661f4ef4 = getdvarfloat(@"hash_571e54cc1622bf7a", 500);
        if (isdefined(level.var_be5a3570ed606f55.origin) && isdefined(level.var_1921321c661f4ef4)) {
            portalloc = level.var_be5a3570ed606f55.origin;
            if (distance2dsquared(portalloc, self.origin) < squared(level.var_1921321c661f4ef4)) {
                if (namespace_8361bad7391de074::function_c7d3c1cb4a3958cf(self, 29841) || getdvarint(@"hash_dfaa198bfa658180", 0)) {
                    if (!istrue(self.var_c5211570e6c28fd8) && !istrue(self.var_941b48d7c0cb685b)) {
                        namespace_446fc987a980892f::playconversation("s2_portal_arrival", [self]);
                        self.var_c5211570e6c28fd8 = 1;
                    }
                }
            }
        }
        wait 1;
    }
}

// Namespace namespace_578c71cd6a36c1ee / namespace_c6fb841ce5c974f2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8ea
// Size: 0x99
function function_816b580f6517f4fa(interact, player) {
    if (isdefined(player.team) && isdefined(player.sessionsquadid)) {
        var_35d868a4ad30ee6e = namespace_af93597583d94051::function_755c94f4a8509b03(player.team, player.sessionsquadid);
    }
    if (istrue(var_35d868a4ad30ee6e)) {
        return {#string:%JUP_OB_S2/RIFT_TOKEN_VOTE_IN_PROGRESS, #type:"HINT_NOBUTTON"};
    }
    return {#string:%JUP_OB_S2/MISSION_RIFT_ENTRY_HINT, #type:"HINT_BUTTON"};
}

// Namespace namespace_578c71cd6a36c1ee / namespace_c6fb841ce5c974f2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x98c
// Size: 0xe2
function function_e7b170d8b549d076() {
    var_2e2a4163dba53609 = requestobjectiveid();
    objective_add_objective(var_2e2a4163dba53609, "current", level.var_be5a3570ed606f55.origin, "jup_ui_map_icon_exfil_to_story");
    objective_playermask_hidefromall(var_2e2a4163dba53609);
    foreach (player in level.players) {
        if (player namespace_9571f642f38c8169::function_3bb8b73991355a1(12) || namespace_8361bad7391de074::function_c7d3c1cb4a3958cf(player, 29841) || getdvarint(@"hash_dfaa198bfa658180", 0)) {
            level.var_be5a3570ed606f55 showtoplayer(player);
            level.var_cae8e96cd4662c04 showtoplayer(player);
            player thread function_8b67e03b991ac60f(var_2e2a4163dba53609);
        }
    }
}

// Namespace namespace_578c71cd6a36c1ee / namespace_c6fb841ce5c974f2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa76
// Size: 0x14
function function_8b67e03b991ac60f(obj_id) {
    objective_playermask_addshowplayer(obj_id, self);
}

// Namespace namespace_578c71cd6a36c1ee / namespace_c6fb841ce5c974f2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa92
// Size: 0xa7
function function_771cbd84a236e2ba(portalloc) {
    while (true) {
        if (isdefined(level.players)) {
            foreach (player in level.players) {
                if (distance2dsquared(portalloc, player.origin) < squared(900)) {
                    level thread namespace_446fc987a980892f::playevent("s2_portal_arrival", player getsquadmembers(undefined, 0));
                    return;
                }
            }
        }
        wait 0.2;
    }
}

// Namespace namespace_578c71cd6a36c1ee / namespace_c6fb841ce5c974f2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb41
// Size: 0x145
function function_eedd40fa46e83c7(player) {
    if (isdefined(player.team) && isdefined(player.sessionsquadid)) {
        var_35d868a4ad30ee6e = namespace_af93597583d94051::function_755c94f4a8509b03(player.team, player.sessionsquadid);
    }
    if (istrue(var_35d868a4ad30ee6e)) {
        return;
    }
    var_c89e221b75ac840d = player getsquadmembers(undefined, 0);
    foreach (var_3329887886bd6a4b in var_c89e221b75ac840d) {
        self disableplayeruse(var_3329887886bd6a4b);
    }
    namespace_af93597583d94051::function_fd5211de155982af(player.team, player.sessionsquadid, 1);
    namespace_6c57c664b4288f88::function_93c8f90c3bd798c6(player, 30, &function_d7cf952e6f352615);
    namespace_af93597583d94051::function_fd5211de155982af(player.team, player.sessionsquadid, 0);
    foreach (var_3329887886bd6a4b in var_c89e221b75ac840d) {
        self enableplayeruse(var_3329887886bd6a4b);
    }
}

// Namespace namespace_578c71cd6a36c1ee / namespace_c6fb841ce5c974f2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc8e
// Size: 0x14
function function_dd50de34ad9f5b2f(player) {
    thread function_eedd40fa46e83c7(player);
}

// Namespace namespace_578c71cd6a36c1ee / namespace_c6fb841ce5c974f2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcaa
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
    namespace_cddd3ad399b210ff::function_e229d89e0c38206d(a_squad, 1007);
}

