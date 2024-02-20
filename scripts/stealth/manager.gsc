// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\stealth\debug.gsc;
#using script_3b64eb40368c1450;
#using scripts\stealth\corpse.gsc;
#using scripts\stealth\event.gsc;
#using scripts\smartobjects\utility.gsc;
#using script_2af9b954e1db92d0;
#using script_3433999dc639c4c5;
#using scripts\stealth\utility.gsc;
#using scripts\stealth\enemy.gsc;
#using scripts\stealth\callbacks.gsc;
#using scripts\stealth\threat_sight.gsc;
#using scripts\stealth\group.gsc;

#namespace manager;

// Namespace manager/namespace_833595e973766257
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x551
// Size: 0x2c
function main() {
    if (isdefined(level.stealth)) {
        return;
    }
    init();
    level thread teams_thread();
    /#
        thread function_ecc7697a5265b9d8();
    #/
}

// Namespace manager/namespace_833595e973766257
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x584
// Size: 0x2e7
function init() {
    flag_set("stealth_enabled");
    level.stealth = spawnstruct();
    level.stealth.fov = spawnstruct();
    level.stealth.save = spawnstruct();
    level.stealth.var_19a752c76729adea = "DuringStealth";
    if (!isdefined(level.var_a56341078ed3d3c9)) {
        function_cadea9f6440479c0(level.var_1a2b600a06ec21f4.var_e146f71f527b2d08);
    }
    /#
        level.stealth.debug = spawnstruct();
        level.stealth.debug.screen = [];
    #/
    level.stealth.funcs = [];
    function_ab26892d96278702("hidden");
    namespace_70203d71cdb728fc::corpse_init_level();
    namespace_92d413b0c411a750::event_init_level();
    level.stealth.next_sound_wait = 3000;
    level.stealth.head_shot_dist = 8;
    level.stealth.var_e012fd4f27172998 = 5;
    level.stealth.group = spawnstruct();
    level.stealth.group.flags = [];
    level.stealth.group.groups = [];
    level.stealth.group.ally_groups = [];
    level.stealth.group.death_alert_timeout = [];
    level.stealth.hunting_groups = [];
    set_default_settings();
    init_stealth_volumes();
    namespace_277f7d3daf8f1a98::init_smartobjects();
    init_save();
    level.stealth.min_alert_level_duration = 1;
    level.stealth.var_3495e2e91301febd = [];
    level.stealth.var_3495e2e91301febd["idle"] = "mp_stealth";
    level.stealth.var_3495e2e91301febd["investigate"] = "mp_stealth";
    level.stealth.var_3495e2e91301febd["hunt"] = "mp_stealth";
    setup_stealth_funcs();
    if (!isdefined(anim.smartobjects["hunt_point"])) {
        namespace_3019a92c149eb488::main();
    }
    if (!isdefined(anim.smartobjects["hunt_checkin"])) {
        namespace_c96ea713559d0559::main();
    }
    level.bseq = spawnstruct();
    level.bseq.instancedata = [];
}

// Namespace manager/namespace_833595e973766257
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x872
// Size: 0x75
function function_cadea9f6440479c0(var_c7e9df90630fbc6b) {
    /#
        if (getdvarint(@"hash_e6afce2cf5cf7515")) {
            return;
        }
    #/
    if (!isstring(var_c7e9df90630fbc6b) || var_c7e9df90630fbc6b == "") {
        return;
    }
    var_e146f71f527b2d08 = getscriptbundle("stealthbundle:" + var_c7e9df90630fbc6b);
    if (isdefined(var_e146f71f527b2d08)) {
        thread set_stealth_bundle_internal(var_e146f71f527b2d08);
    } else {
        /#
            assertmsg("stealthbundle: '" + var_c7e9df90630fbc6b + "' not found.
");
        #/
    }
}

// Namespace manager/namespace_833595e973766257
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ee
// Size: 0x412
function private set_stealth_bundle_internal(var_e146f71f527b2d08) {
    self notify("set_stealth_bundle_internal");
    self endon("set_stealth_bundle_internal");
    level.var_a56341078ed3d3c9 = var_e146f71f527b2d08;
    flag_wait("stealth_enabled");
    level.var_a56341078ed3d3c9 = undefined;
    set_default_settings();
    level.stealth.var_b164de1a339a2b06 = var_e146f71f527b2d08.var_b164de1a339a2b06;
    level.stealth.var_bd826e05d26d86a2 = var_e146f71f527b2d08.var_bd826e05d26d86a2;
    level.stealth.var_8ebeefcb86e27a0f = var_e146f71f527b2d08.var_8ebeefcb86e27a0f;
    level.stealth.stealth_spotted_delay = var_e146f71f527b2d08.var_a8b82b34f9faf5b8;
    function_d5823c94e8131ea6(istrue(var_e146f71f527b2d08.var_fedfd5365ad1c962));
    function_531194f673a06de5(istrue(var_e146f71f527b2d08.var_99e4d558378f458a));
    level.stealth.var_f70ec8fb675e053b = function_53c4c53197386572(var_e146f71f527b2d08.var_df465d1dbc6f7240, "Global");
    switch (level.stealth.var_f70ec8fb675e053b) {
    case #"hash_c24b16fb9788caee":
        function_3875866b3a6d349(0);
        function_aa9fa9c5a97d0f6e(0);
        break;
    case #"hash_4f2154ac90348b6a":
        function_3875866b3a6d349(1);
        function_aa9fa9c5a97d0f6e(0);
        break;
    case #"hash_ad8f23b9b8103745":
        function_3875866b3a6d349(0);
        function_aa9fa9c5a97d0f6e(1);
        break;
    }
    foreach (player in level.players) {
        function_5513b6097fa0b730(player, istrue(var_e146f71f527b2d08.var_2aa1112e46b4cf64));
        function_ed9b1ddd2ec82dab(player, istrue(var_e146f71f527b2d08.var_dafc0463036e0af7));
        if (isdefined(level.var_971169afd6488423)) {
            player [[ level.var_971169afd6488423 ]](istrue(var_e146f71f527b2d08.var_5edf42a9aa86e7ed));
        }
    }
    setomnvar("ai_fulllight", function_53c4c53197386572(var_e146f71f527b2d08.var_9a18ffde7eb7a303, 0.01));
    setomnvar("ai_nolight", function_53c4c53197386572(var_e146f71f527b2d08.var_1943001a76b00ef0, 0));
    if (isdefined(var_e146f71f527b2d08.eventlist)) {
        level.var_4b5ae55499732059 val::set("stealthmanager", "ai_eventlist", var_e146f71f527b2d08.eventlist);
    } else {
        level.var_4b5ae55499732059 val::reset("stealthmanager", "ai_eventlist");
    }
    var_41c9d48b9eb3279f = [];
    var_41c9d48b9eb3279f["sight_dist"] = function_53c4c53197386572(var_e146f71f527b2d08.var_2d26f9b2c2952b73, 600);
    var_41c9d48b9eb3279f["detect_dist"] = function_53c4c53197386572(var_e146f71f527b2d08.var_8a3160eb6a9599b1, 300);
    var_41c9d48b9eb3279f["found_dist"] = function_53c4c53197386572(var_e146f71f527b2d08.var_f3c241170db7c2a2, 100);
    var_41c9d48b9eb3279f["shadow_dist"] = function_53c4c53197386572(var_e146f71f527b2d08.var_83aa945aa7193936, 100);
    namespace_70203d71cdb728fc::set_corpse_ranges(var_41c9d48b9eb3279f);
    level.stealth.var_19a752c76729adea = function_53c4c53197386572(var_e146f71f527b2d08.var_19a752c76729adea, "DuringStealth");
    switch (level.stealth.var_19a752c76729adea) {
    case #"hash_1d7966a2fa479e24":
        setsaveddvar(@"hash_32196fa75434c856", 1);
        break;
    case #"hash_616703241319aec9":
        setsaveddvar(@"hash_32196fa75434c856", 0);
        break;
    }
    var_837590c56a1c2441 = [];
    var_837590c56a1c2441["prone"] = 9999;
    var_837590c56a1c2441["crouch"] = 9999;
    var_837590c56a1c2441["stand"] = 9999;
    stealth_spotted = [];
    stealth_spotted["prone"] = 9999;
    stealth_spotted["crouch"] = 9999;
    stealth_spotted["stand"] = 9999;
    namespace_e124d8b75dab4be0::set_detect_ranges(var_837590c56a1c2441, stealth_spotted);
}

// Namespace manager/namespace_833595e973766257
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd07
// Size: 0xeb
function function_dc19ea08106ca928(state) {
    if (!isdefined(self.stealth)) {
        return;
    }
    if (isdefined(self.stealth.var_3495e2e91301febd) && isdefined(self.stealth.var_3495e2e91301febd[state])) {
        return self.stealth.var_3495e2e91301febd[state];
    }
    if (isdefined(level.stealth.var_3495e2e91301febd) && isdefined(level.stealth.var_3495e2e91301febd[state])) {
        return level.stealth.var_3495e2e91301febd[state];
    }
    defaults = [];
    defaults["idle"] = "mp_stealth";
    defaults["investigate"] = "mp_stealth";
    defaults["hunt"] = "mp_stealth";
    defaults["combat"] = "default";
    return defaults[state];
}

// Namespace manager/namespace_833595e973766257
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdfa
// Size: 0x65
function function_ef72c03cbcb43194(state, var_b8f2440e43198535) {
    if (!isdefined(self.stealth)) {
        return;
    }
    if (!isdefined(self.stealth.var_3495e2e91301febd)) {
        self.stealth.var_3495e2e91301febd = [];
    }
    self.stealth.var_3495e2e91301febd[state] = var_b8f2440e43198535;
}

// Namespace manager/namespace_833595e973766257
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe66
// Size: 0x61
function setup_stealth_funcs() {
    level namespace_e124d8b75dab4be0::set_stealth_func("do_stealth", &namespace_e124d8b75dab4be0::do_stealth);
    namespace_6db9b2dcda758664::set_default_stealth_funcs();
    level.stealth.fngroupspottedflag = &namespace_e124d8b75dab4be0::group_spotted_flag;
    level.stealth.fninitenemygame = undefined;
    level.stealth.var_e376d807bb8ce93b = &namespace_1be3576f1131ba20::stealth_call_thread;
}

// Namespace manager/namespace_833595e973766257
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xece
// Size: 0x483
function set_default_settings() {
    var_837590c56a1c2441 = [];
    var_837590c56a1c2441["prone"] = 1000;
    var_837590c56a1c2441["crouch"] = 1800;
    var_837590c56a1c2441["stand"] = 2800;
    stealth_spotted = [];
    stealth_spotted["prone"] = 1800;
    stealth_spotted["crouch"] = 2500;
    stealth_spotted["stand"] = 4000;
    namespace_e124d8b75dab4be0::set_detect_ranges(var_837590c56a1c2441, stealth_spotted);
    var_ca02517e3aeb3b5c = [];
    var_ca02517e3aeb3b5c["prone"] = 130;
    var_ca02517e3aeb3b5c["crouch"] = 215;
    var_ca02517e3aeb3b5c["stand"] = 300;
    var_42470406ae5786dd = [];
    var_42470406ae5786dd["prone"] = 300;
    var_42470406ae5786dd["crouch"] = 375;
    var_42470406ae5786dd["stand"] = 450;
    namespace_e124d8b75dab4be0::set_min_detect_range_darkness(var_ca02517e3aeb3b5c, var_42470406ae5786dd);
    var_c53b4c55bd88f6d5 = [];
    var_c53b4c55bd88f6d5["prone"] = 130;
    var_c53b4c55bd88f6d5["crouch"] = 215;
    var_c53b4c55bd88f6d5["stand"] = 300;
    var_fa836dfcdbed1fa6 = [];
    var_fa836dfcdbed1fa6["prone"] = 300;
    var_fa836dfcdbed1fa6["crouch"] = 375;
    var_fa836dfcdbed1fa6["stand"] = 450;
    namespace_e124d8b75dab4be0::function_f3883fe06a11269(var_ca02517e3aeb3b5c, var_42470406ae5786dd);
    level.stealth.fov.cosine["blind"] = 0.98;
    level.stealth.fov.var_4b1c8bd8c8d29d03["blind"] = 0.98;
    level.stealth.fov.var_cea2df14ac0bf8c4["blind"] = 0;
    level.stealth.fov.ground["blind"] = 0;
    level.stealth.fov.cosine["hidden"] = 0.7;
    level.stealth.fov.var_4b1c8bd8c8d29d03["hidden"] = 0.86;
    level.stealth.fov.var_cea2df14ac0bf8c4["hidden"] = 0.97;
    level.stealth.fov.ground["hidden"] = 1;
    level.stealth.fov.cosine["investigate"] = 0.7;
    level.stealth.fov.var_4b1c8bd8c8d29d03["investigate"] = 0.86;
    level.stealth.fov.var_cea2df14ac0bf8c4["investigate"] = 0.97;
    level.stealth.fov.ground["investigate"] = 1;
    level.stealth.fov.cosine["combat_hunt"] = 0.7;
    level.stealth.fov.var_4b1c8bd8c8d29d03["combat_hunt"] = 0.86;
    level.stealth.fov.var_cea2df14ac0bf8c4["combat_hunt"] = 0.97;
    level.stealth.fov.ground["combat_hunt"] = 1;
    level.stealth.fov.cosine["spotted"] = 0.01;
    level.stealth.fov.var_4b1c8bd8c8d29d03["spotted"] = 0.574;
    level.stealth.fov.var_cea2df14ac0bf8c4["spotted"] = 0;
    level.stealth.fov.ground["spotted"] = 0;
    namespace_70203d71cdb728fc::set_corpse_ranges_default();
    if (!isdefined(level.var_1a2b600a06ec21f4) || istrue(level.var_1a2b600a06ec21f4.var_f8c2703e1020ada0)) {
        init_event_distances();
    }
    event_change("hidden");
}

// Namespace manager/namespace_833595e973766257
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1358
// Size: 0x1f3
function init_event_distances() {
    array["spotted"]["death"] = function_9d30fd63965bafa9("death");
    array["hidden"]["death"] = 512;
    array["spotted"]["pain"] = function_9d30fd63965bafa9("pain");
    array["hidden"]["pain"] = 256;
    array["spotted"]["explosion"] = function_9d30fd63965bafa9("explosion");
    array["hidden"]["explosion"] = 2048;
    array["spotted"]["bullet"] = function_9d30fd63965bafa9("bullet");
    array["hidden"]["bullet"] = 64;
    array["spotted"]["footstep_walk"] = function_9d30fd63965bafa9("footstep_walk");
    array["hidden"]["footstep_walk"] = 50;
    array["spotted"]["footstep"] = function_9d30fd63965bafa9("footstep");
    array["hidden"]["footstep"] = 100;
    array["spotted"]["footstep_sprint"] = function_9d30fd63965bafa9("footstep_sprint");
    array["hidden"]["footstep_sprint"] = 400;
    array["spotted"]["gunshot"] = function_9d30fd63965bafa9("gunshot");
    array["hidden"]["gunshot"] = 1500;
    array["spotted"]["silenced_shot"] = function_9d30fd63965bafa9("silenced_shot");
    array["hidden"]["silenced_shot"] = 180;
    array["spotted"]["glass_destroyed"] = function_9d30fd63965bafa9("glass_destroyed");
    array["hidden"]["glass_destroyed"] = 384;
    array["spotted"]["gunshot_teammate"] = function_9d30fd63965bafa9("gunshot_teammate");
    array["hidden"]["gunshot_teammate"] = 1500;
    array["spotted"]["new_enemy"] = 128;
    array["hidden"]["new_enemy"] = 128;
    set_event_distances(array);
}

// Namespace manager/namespace_833595e973766257
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1552
// Size: 0xda
function set_event_distances(array) {
    foreach (state, var_aecf66bdcfdcc264 in array) {
        /#
            assertex(state == "hidden" || state == "spotted", "set_event_distances expects the first array key to be hidden or spotted.");
        #/
        foreach (event, value in var_aecf66bdcfdcc264) {
            function_20d5809a5332448f(state, event, value);
            if (function_eac0cd99c9c6d8ee() == state) {
                function_7afb89fc511bf315(event, value);
                function_1a3dd0fbfe26893f(event, value);
            }
        }
    }
}

// Namespace manager/namespace_833595e973766257
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1633
// Size: 0x14
function set_custom_distances(array) {
    set_event_distances(array);
}

// Namespace manager/namespace_833595e973766257
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164e
// Size: 0x172
function set_detect_ranges_internal(hidden, spotted, var_8f3f480583606401) {
    var_4beaf1e22c2142f6 = 0.25;
    if (isdefined(hidden)) {
        function_3c1c3f98cd23089e("hidden", "prone", hidden["prone"]);
        function_3c1c3f98cd23089e("hidden", "crouch", hidden["crouch"]);
        function_3c1c3f98cd23089e("hidden", "stand", hidden["stand"]);
        if (!isdefined(hidden["shadow"])) {
            hidden["shadow"] = var_4beaf1e22c2142f6;
        }
        function_3c1c3f98cd23089e("hidden", "shadow", hidden["shadow"]);
    }
    if (isdefined(spotted)) {
        function_3c1c3f98cd23089e("spotted", "prone", spotted["prone"]);
        function_3c1c3f98cd23089e("spotted", "crouch", spotted["crouch"]);
        function_3c1c3f98cd23089e("spotted", "stand", spotted["stand"]);
        if (!isdefined(spotted["shadow"])) {
            spotted["shadow"] = var_4beaf1e22c2142f6;
        }
        function_3c1c3f98cd23089e("spotted", "shadow", spotted["shadow"]);
    }
    if (isdefined(var_8f3f480583606401)) {
        if (isdefined(var_8f3f480583606401["prone"])) {
            function_c98df02c041adccb("prone", var_8f3f480583606401["prone"]);
        }
        if (isdefined(var_8f3f480583606401["crouch"])) {
            function_c98df02c041adccb("crouch", var_8f3f480583606401["crouch"]);
        }
        if (isdefined(var_8f3f480583606401["stand"])) {
            function_c98df02c041adccb("stand", var_8f3f480583606401["stand"]);
        }
    }
}

// Namespace manager/namespace_833595e973766257
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17c7
// Size: 0xe2
function manager_thread() {
    while (1) {
        flag_wait("stealth_enabled");
        namespace_76383ca64b36529e::threat_sight_set_dvar(1);
        if (!playerlootenabled() && level.stealth.var_19a752c76729adea == "DuringStealth") {
            setsaveddvar(@"hash_32196fa75434c856", 1);
        }
        flag_wait("stealth_spotted");
        if (!playerlootenabled() && level.stealth.var_19a752c76729adea == "DuringStealth") {
            setsaveddvar(@"hash_32196fa75434c856", 0);
        }
        if (!flag("stealth_enabled")) {
            continue;
        }
        event_change("spotted");
        flag_waitopen("stealth_spotted");
        if (!flag("stealth_enabled")) {
            continue;
        }
        event_change("hidden");
        waittillframeend();
    }
}

// Namespace manager/namespace_833595e973766257
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b0
// Size: 0xb1
function anyone_in_combat() {
    if (!isdefined(level.stealth)) {
        return 0;
    }
    if (function_1bb1470f934a81eb()) {
        return 1;
    }
    ais = getaiunittypearray("bad_guys", "all");
    foreach (guy in ais) {
        if (!isdefined(guy.stealth) && isdefined(guy.enemy) && guy.enemy == self) {
            return 1;
        }
    }
    return 0;
}

// Namespace manager/namespace_833595e973766257
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1969
// Size: 0x93
function function_6c78f7f002b9d507() {
    if (isdefined(level.stealth.groupdata)) {
        foreach (group in level.stealth.groupdata.groups) {
            if (namespace_e5c9a7258a3d79cb::function_624f57a99242f017(group.name)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace manager/namespace_833595e973766257
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a04
// Size: 0x4
function anyone_in_hunt() {
    return 0;
}

// Namespace manager/namespace_833595e973766257
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a10
// Size: 0x110
function update_stealth_spotted_thread() {
    waitframe();
    var_5560c6a46094816f = 0;
    while (1) {
        var_65661ae3a873c9ae = anyone_in_combat();
        if (var_65661ae3a873c9ae) {
            if (!var_5560c6a46094816f && isdefined(level.stealth.stealth_spotted_delay) && level.stealth.stealth_spotted_delay > 0) {
                wait(level.stealth.stealth_spotted_delay);
                if (!anyone_in_combat()) {
                    waitframe();
                    continue;
                }
            }
            if (!flag("stealth_spotted")) {
                flag_set("stealth_spotted");
                if (isdefined(self.stealth)) {
                    var_f950051ecb0cd613 = namespace_e124d8b75dab4be0::get_group_flagname("stealth_spotted");
                    flag_set(var_f950051ecb0cd613);
                }
            }
        } else if (flag("stealth_spotted")) {
            flag_clear("stealth_spotted");
            if (isdefined(self.stealth)) {
                var_f950051ecb0cd613 = namespace_e124d8b75dab4be0::get_group_flagname("stealth_spotted");
                flag_clear(var_f950051ecb0cd613);
            }
        }
        var_5560c6a46094816f = var_65661ae3a873c9ae;
        waitframe();
    }
}

// Namespace manager/namespace_833595e973766257
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b27
// Size: 0x9a
function teams_thread() {
    level.stealth.enemies["axis"] = [];
    level.stealth.enemies["allies"] = [];
    while (1) {
        flag_wait("stealth_enabled");
        level.stealth.enemies["axis"] = level.players;
        level.stealth.enemies["allies"] = getaiarray("axis");
        wait(0.05);
    }
}

// Namespace manager/namespace_833595e973766257
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bc8
// Size: 0xc6
function event_change(name) {
    function_ab26892d96278702(name);
    ai_event = function_373416b9ec7dd155();
    foreach (state, var_aecf66bdcfdcc264 in ai_event) {
        if (state == name) {
            foreach (key, event in var_aecf66bdcfdcc264) {
                function_7afb89fc511bf315(key, event);
                function_1a3dd0fbfe26893f(key, event);
            }
        }
    }
}

// Namespace manager/namespace_833595e973766257
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c95
// Size: 0x4d
function init_save() {
    flag_init("stealth_player_nade");
    level.stealth.save.player_nades = 0;
    if (!issp()) {
        return;
    }
    array_thread(level.players, &player_grenade_check);
}

// Namespace manager/namespace_833595e973766257
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ce9
// Size: 0x3b
function player_grenade_check() {
    while (1) {
        self waittill("grenade_pullback");
        flag_set("stealth_player_nade");
        grenade = self waittill("grenade_fire");
        thread player_grenade_check_dieout(grenade);
    }
}

// Namespace manager/namespace_833595e973766257
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d2b
// Size: 0x84
function player_grenade_check_dieout(grenade) {
    level.stealth.save.player_nades++;
    grenade waittill_notify_or_timeout("death", 10);
    level.stealth.save.player_nades--;
    waittillframeend();
    if (!level.stealth.save.player_nades) {
        flag_clear("stealth_player_nade");
    }
}

// Namespace manager/namespace_833595e973766257
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db6
// Size: 0x61d
function init_stealth_volumes() {
    level.stealth.combat_volumes = [];
    level.stealth.hunt_volumes = [];
    level.stealth.investigate_volumes = [];
    var_6d476f1dea7803bb = getentarray("info_volume_stealth_all", "classname");
    volumes = getentarray("info_volume_stealth_combat", "classname");
    volumes = array_combine(volumes, var_6d476f1dea7803bb);
    if (isdefined(volumes)) {
        foreach (vol in volumes) {
            if (isdefined(vol.script_stealthgroup) && vol.script_stealthgroup != "-1") {
                /#
                    assertex(isdefined(vol.script_stealthgroup), "combat volume missing .script_stealthgroup: " + vol.origin);
                #/
                /#
                    assertex(vol.script_stealthgroup != "-1" && vol.script_stealthgroup != "", "combat volume does not define any groups in .script_stealthgroup: " + vol.origin);
                #/
                groups = strtok(vol.script_stealthgroup, " ");
                foreach (group in groups) {
                    /#
                        if (istrue(level.var_eb4bce9b222e36ac) && (group == "do_stealth" || group == " ")) {
                            vol.var_8f311e6e8157487c = 1;
                        }
                        if (isdefined(level.stealth.combat_volumes[group]) && !istrue(vol.var_8f311e6e8157487c)) {
                            /#
                                assertmsg("<unknown string>" + group + "<unknown string>" + vol.origin + "<unknown string>" + level.stealth.combat_volumes[group].origin);
                            #/
                        }
                    #/
                    level.stealth.combat_volumes[group] = vol;
                }
            }
        }
    }
    volumes = getentarray("info_volume_stealth_hunt", "classname");
    volumes = array_combine(volumes, var_6d476f1dea7803bb);
    if (isdefined(volumes)) {
        foreach (vol in volumes) {
            if (isdefined(vol.script_stealthgroup) && vol.script_stealthgroup != "-1") {
                /#
                    assertex(isdefined(vol.script_stealthgroup), "hunt volume missing .script_stealthgroup: " + vol.origin);
                #/
                /#
                    assertex(vol.script_stealthgroup != "-1" && vol.script_stealthgroup != "", "hunt volume does not define any groups in .script_stealthgroup: " + vol.origin);
                #/
                groups = strtok(vol.script_stealthgroup, " ");
                foreach (group in groups) {
                    /#
                        if (isdefined(level.stealth.hunt_volumes[group]) && !istrue(vol.var_8f311e6e8157487c)) {
                            /#
                                assertmsg("<unknown string>" + group + "<unknown string>" + vol.origin + "<unknown string>" + level.stealth.hunt_volumes[group].origin);
                            #/
                        }
                    #/
                    level.stealth.hunt_volumes[group] = vol;
                }
            }
        }
    }
    volumes = getentarray("info_volume_stealth_investigate", "classname");
    volumes = array_combine(volumes, var_6d476f1dea7803bb);
    if (isdefined(volumes)) {
        foreach (vol in volumes) {
            if (isdefined(vol.script_stealthgroup) && vol.script_stealthgroup != "-1") {
                /#
                    assertex(isdefined(vol.script_stealthgroup), "investigate volume missing .script_stealthgroup: " + vol.origin);
                #/
                /#
                    assertex(vol.script_stealthgroup != "-1" && vol.script_stealthgroup != "", "investigate volume does not define any groups in .script_stealthgroup: " + vol.origin);
                #/
                groups = strtok(vol.script_stealthgroup, " ");
                foreach (group in groups) {
                    /#
                        if (isdefined(level.stealth.investigate_volumes[group]) && !istrue(vol.var_8f311e6e8157487c)) {
                            /#
                                assertmsg("<unknown string>" + group + "<unknown string>" + vol.origin + "<unknown string>" + level.stealth.investigate_volumes[group].origin);
                            #/
                        }
                    #/
                    level.stealth.investigate_volumes[group] = vol;
                }
            }
        }
    }
}

// Namespace manager/namespace_833595e973766257
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23da
// Size: 0x3f
function playerlootenabled() {
    if (isdefined(level.stealth) && isdefined(level.stealth.fnplayerlootenabled)) {
        return [[ level.stealth.fnplayerlootenabled ]]();
    }
    return 0;
}

