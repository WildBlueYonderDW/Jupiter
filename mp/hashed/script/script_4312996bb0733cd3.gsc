#using scripts\common\callbacks.gsc;
#using scripts\common\debug.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\utility.gsc;
#using script_2583ee5680cf4736;
#using scripts\engine\scriptable.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\powerups.gsc;
#using script_7feaed3f883fe324;
#using script_1de7f143ad1184d2;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_16ea1b94f0f381b3;
#using script_71a1834c8aff34e9;

#namespace namespace_dd228ec9ef6de6f;

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x446
// Size: 0x6b
function init() {
    quest = {#var_832bf806a8052591:&function_832bf806a8052591, #on_prematch_end:&on_prematch_end, #var_e85998f77c2a4f9b:&function_e85998f77c2a4f9b, #var_459989e09b9ec638:&function_459989e09b9ec638, #var_b5e4ce4265fcc787:&function_b5e4ce4265fcc787, #name:"race"};
    namespace_a6fd08b4fff3efc9::register(quest);
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b9
// Size: 0x21
function function_b5e4ce4265fcc787() {
    set_dvars();
    function_c96c5ad4623f9cbb();
    setup_callbacks();
    /#
        debug_init();
    #/
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e2
// Size: 0x2
function function_459989e09b9ec638() {
    
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ec
// Size: 0x2
function function_e85998f77c2a4f9b() {
    
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f6
// Size: 0x2
function on_prematch_end() {
    
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x500
// Size: 0xa
function function_832bf806a8052591() {
    thread function_2794cef7c1c29111();
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x512
// Size: 0x1e
function set_dvars() {
    namespace_a6fd08b4fff3efc9::function_a599409afd06b89b("checkpoint_timer_duration", 6);
    namespace_a6fd08b4fff3efc9::function_a599409afd06b89b("race_reset_duration", 20);
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x538
// Size: 0x14
function private setup_callbacks() {
    level scriptable::scriptable_addusedcallbackbypart("jup_sidequest_parkour_partname", &function_2e04081059796fa1);
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x554
// Size: 0x7d
function private function_c96c5ad4623f9cbb() {
    self.races = [];
    function_b29b20490a004ae9();
    foreach (name in self.var_ba337d639f174cf3) {
        var_49083a24dc0fc0ab = function_653d21334d98fae6(name);
        self.races[name] = var_49083a24dc0fc0ab;
    }
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5d9
// Size: 0xe8
function private function_b29b20490a004ae9() {
    self.var_ba337d639f174cf3 = [];
    var_7a1d581eb4e0c22a = utility::getstructarray("quest_race_checkpoint", "targetname");
    assertex(isdefined(var_7a1d581eb4e0c22a), "<dev string:x1c>" + "<dev string:x44>");
    foreach (checkpoint in var_7a1d581eb4e0c22a) {
        var_8ddd66defbbc4a32 = checkpoint.script_label;
        if (!isdefined(self.races[var_8ddd66defbbc4a32])) {
            self.races[var_8ddd66defbbc4a32] = [];
            self.var_ba337d639f174cf3 = array_add(self.var_ba337d639f174cf3, var_8ddd66defbbc4a32);
        }
        self.races[var_8ddd66defbbc4a32] = array_add(self.races[var_8ddd66defbbc4a32], checkpoint);
    }
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6c9
// Size: 0x114
function private function_653d21334d98fae6(var_8ddd66defbbc4a32) {
    race = spawnstruct();
    race.quest = self;
    race.var_7a1d581eb4e0c22a = function_cf9f182ffa289851(self.races[var_8ddd66defbbc4a32]);
    race.var_af01c02ad99e75fe = 0;
    race.start_index = 0;
    race.var_d52aba41a5011729 = race.var_7a1d581eb4e0c22a.size - 1;
    race.reward_origin = race.var_7a1d581eb4e0c22a[race.var_d52aba41a5011729].origin;
    race.var_b8489c213c070264 = namespace_a6fd08b4fff3efc9::function_d07ae154834833b0("checkpoint_timer_duration");
    race.rewards = ["brloot_offhand_battlerage", "brloot_health_adrenaline", "brloot_killstreak_uav", "brloot_super_armorbox", "brloot_self_revive"];
    race.var_8cda4de88f4b85ad = 0;
    race.var_534dc181706b5915 = 0;
    return race;
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7e6
// Size: 0x7a
function private function_cf9f182ffa289851(var_5107e554f7af7ec3) {
    var_dd87ceb27f7b439a = [];
    foreach (checkpoint in var_5107e554f7af7ec3) {
        checkpoint_index = int(checkpoint.script_noteworthy);
        var_dd87ceb27f7b439a[checkpoint_index] = checkpoint;
    }
    return var_dd87ceb27f7b439a;
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x869
// Size: 0x5d
function private function_2794cef7c1c29111() {
    level endon("game_ended");
    foreach (race in self.races) {
        function_4534506ee8107463(race);
    }
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8ce
// Size: 0xa0
function private function_4534506ee8107463(race) {
    start_flag = spawnscriptable("jup_sidequest_parkour_race_start", race.var_7a1d581eb4e0c22a[race.start_index].origin, race.var_7a1d581eb4e0c22a[race.start_index].angles);
    start_flag setscriptablepartstate("jup_sidequest_parkour_partname", "usable");
    start_flag.race = race;
    race.var_8f1477b6812b12a0 = [start_flag];
    race.current_checkpoint = start_flag;
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x976
// Size: 0x132
function private function_44a6333bd124cb10(race) {
    for (i = 0; i < race.var_7a1d581eb4e0c22a.size; i++) {
        var_a6598bab7aa32f5d = race.var_7a1d581eb4e0c22a[i];
        if (i != race.start_index) {
            payload = [#"teamselect", race.player getentitynumber()];
            var_65970139593c7f30 = "jup_sidequest_parkour_race_checkpoint";
            if (i == race.var_d52aba41a5011729) {
                var_65970139593c7f30 = "jup_sidequest_parkour_race_finishline";
            }
            var_a7c3372d7cce20b8 = spawnscriptable(var_65970139593c7f30, var_a6598bab7aa32f5d.origin, var_a6598bab7aa32f5d.angles, undefined, payload);
            var_a7c3372d7cce20b8.trigger = spawn("noent_volume_trigger_radius", var_a7c3372d7cce20b8.origin, 0, 25, 25);
            var_a7c3372d7cce20b8.race = race;
            var_a7c3372d7cce20b8 setscriptablepartstate("jup_sidequest_parkour_partname", "hidden");
            race.var_8f1477b6812b12a0 = array_add(race.var_8f1477b6812b12a0, var_a7c3372d7cce20b8);
        }
    }
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xab0
// Size: 0xde
function private race_start(race, player) {
    race notify("sidequest_race_start");
    race endon("sidequest_race_start");
    race endon("sidequest_race_end");
    level endon("game_ended");
    player endon("disconnect");
    race.player = player;
    function_44a6333bd124cb10(race);
    thread function_ad18e63086fa6a51(race);
    player playlocalsound("wz_parkour_race_start");
    while (player namespace_53fc9ddbb516e6e1::function_87072b42853a9c58("specialty_zombie_legs")) {
        if (race.var_b8489c213c070264 <= 3 && race.var_b8489c213c070264 != 0) {
            player playlocalsound("wz_parkour_race_time_ticking_0" + race.var_b8489c213c070264);
        }
        wait 1;
        race.var_b8489c213c070264--;
    }
    if (!istrue(race.var_534dc181706b5915)) {
        function_441b18fdc2dbd694(race);
    }
    race notify("sidequest_race_end");
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xb96
// Size: 0x5a
function private function_441b18fdc2dbd694(race) {
    if (!istrue(race.var_534dc181706b5915)) {
        function_1fad11b66c44c8e2(race);
        race.player playlocalsound("wz_parkour_race_failure");
    }
    race.var_af01c02ad99e75fe = 0;
    race.var_534dc181706b5915 = 0;
    function_4534506ee8107463(race);
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbf8
// Size: 0x56
function private function_656e822afce77428() {
    foreach (race in self.races) {
        function_441b18fdc2dbd694(race);
    }
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc56
// Size: 0x78
function private function_b4af6f3d7d6bc5a6(race) {
    level endon("game_ended");
    race.player playlocalsound("wz_parkour_race_success");
    function_cd537c18037efbe(race);
    function_1fad11b66c44c8e2(race);
    race.var_8cda4de88f4b85ad = 1;
    race.var_534dc181706b5915 = 1;
    thread quest_complete(race.player);
    thread function_eebe6c65450f4c0e(race);
    race notify("sidequest_race_end");
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xcd6
// Size: 0x1a4
function private function_cd537c18037efbe(race, var_5552fd240a86b1ae) {
    level endon("game_ended");
    race.rewards = array_randomize(race.rewards);
    if (!isdefined(var_5552fd240a86b1ae)) {
        var_5552fd240a86b1ae = race.reward_origin;
    }
    var_909a50eb39b1f4f2 = race.rewards.size;
    if (istrue(race.var_8cda4de88f4b85ad)) {
        var_909a50eb39b1f4f2 = 3;
    }
    radius = 80;
    var_9c59afefc22f0c25 = 360 / var_909a50eb39b1f4f2;
    for (i = 0; i < var_909a50eb39b1f4f2; i++) {
        angle = var_9c59afefc22f0c25 * i;
        var_8a9f895755fd607e = cos(angle) * radius;
        var_d867033ab311670b = sin(angle) * radius;
        x = var_5552fd240a86b1ae[0] + var_8a9f895755fd607e;
        y = var_5552fd240a86b1ae[1] + var_d867033ab311670b;
        z = var_5552fd240a86b1ae[2];
        spawn_location = (x, y, z + 20);
        if (utility::string_starts_with(race.rewards[i], "brloot")) {
            dropinfo = br_pickups::getitemdroporiginandangles(br_pickups::function_7b9f3966a7a42003(), spawn_location, (0, 0, 0), undefined, undefined, undefined, undefined, undefined, spawn_location);
            thread br_pickups::spawnpickup(race.rewards[i], dropinfo, 1, 0, undefined, 0);
        } else {
            thread namespace_fa4f09e328669217::function_9097cec00b0a918a(race.rewards[i], spawn_location, 90);
        }
        wait 0.15;
    }
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xe82
// Size: 0x26
function private function_eebe6c65450f4c0e(race) {
    level endon("game_ended");
    wait namespace_a6fd08b4fff3efc9::function_d07ae154834833b0("race_reset_duration");
    function_441b18fdc2dbd694(race);
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xeb0
// Size: 0x3a
function private quest_complete(player) {
    params = {#var_2c8bc596ef639a6e:[player], #is_successful:1};
    namespace_a6fd08b4fff3efc9::function_fe134565f2967d66(params);
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xef2
// Size: 0x228
function private function_ad18e63086fa6a51(race) {
    race endon("sidequest_race_end");
    level endon("game_ended");
    current_checkpoint = race.current_checkpoint;
    if (race.var_af01c02ad99e75fe == race.var_d52aba41a5011729) {
        if (isdefined(race.var_d1d02c6f930782e5)) {
            namespace_6c8a837ec98fe0b8::returnobjectiveid(race.var_d1d02c6f930782e5);
            race.var_d1d02c6f930782e5 = undefined;
        }
        current_checkpoint setscriptablepartstate("jup_sidequest_parkour_fx_partname", "on");
        wait 0.25;
        current_checkpoint setscriptablepartstate("jup_sidequest_parkour_partname", "hidden");
        function_19d4d8b59f6fbfcd(race);
        return;
    }
    if (race.var_af01c02ad99e75fe != race.start_index) {
        current_checkpoint setscriptablepartstate("jup_sidequest_parkour_fx_partname", "on");
        wait 0.25;
    } else {
        function_83909272c7fe2e78(race, race.player);
    }
    current_checkpoint setscriptablepartstate("jup_sidequest_parkour_partname", "hidden");
    current_checkpoint notify("checkpoint_removed");
    race.var_af01c02ad99e75fe++;
    next_checkpoint = race.var_8f1477b6812b12a0[race.var_af01c02ad99e75fe];
    next_checkpoint setscriptablepartstate("jup_sidequest_parkour_partname", "visible");
    race.current_checkpoint = next_checkpoint;
    if (race.var_af01c02ad99e75fe == race.var_d52aba41a5011729) {
        if (isdefined(race.var_bd1202e11a5ae264)) {
            namespace_6c8a837ec98fe0b8::returnobjectiveid(race.var_bd1202e11a5ae264);
            race.var_bd1202e11a5ae264 = undefined;
        }
        function_8c441f0c99924b47(race, race.player);
        namespace_6c8a837ec98fe0b8::update_objective_position(race.var_d1d02c6f930782e5, next_checkpoint.origin);
    } else {
        namespace_6c8a837ec98fe0b8::update_objective_position(race.var_bd1202e11a5ae264, next_checkpoint.origin);
    }
    thread function_e10c44c9089e645(next_checkpoint);
    race.player thread namespace_6aa38109e829c5b::function_5f5cc115a0b7d069(namespace_a6fd08b4fff3efc9::function_d07ae154834833b0("checkpoint_timer_duration"));
    race.var_b8489c213c070264 = namespace_a6fd08b4fff3efc9::function_d07ae154834833b0("checkpoint_timer_duration");
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1122
// Size: 0x8f
function private function_e10c44c9089e645(checkpoint) {
    race = checkpoint.race;
    player = race.player;
    level endon("game_ended");
    race endon("sidequest_race_end");
    checkpoint endon("checkpoint_removed");
    while (true) {
        checkpoint.trigger waittill("trigger", player);
        if (isplayer(player) && race.player == player) {
            break;
        }
        waitframe();
    }
    thread function_b10b7aaa69d4882e(checkpoint);
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x11b9
// Size: 0xdb
function private function_1fad11b66c44c8e2(race) {
    if (isdefined(race.var_bd1202e11a5ae264)) {
        namespace_6c8a837ec98fe0b8::returnobjectiveid(race.var_bd1202e11a5ae264);
        race.var_bd1202e11a5ae264 = undefined;
    } else if (isdefined(race.var_d1d02c6f930782e5)) {
        namespace_6c8a837ec98fe0b8::returnobjectiveid(race.var_d1d02c6f930782e5);
        race.var_d1d02c6f930782e5 = undefined;
    }
    foreach (checkpoint in race.var_8f1477b6812b12a0) {
        if (isdefined(checkpoint.trigger)) {
            checkpoint.trigger delete();
        }
        checkpoint freescriptable();
    }
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x129c
// Size: 0x98
function private function_83909272c7fe2e78(race, player) {
    objid = namespace_6c8a837ec98fe0b8::requestobjectiveid(99);
    race.var_bd1202e11a5ae264 = objid;
    namespace_6c8a837ec98fe0b8::objective_add_objective(objid, "current", race.current_checkpoint.origin, "hud_icon_ctf_flag", "icon_small");
    namespace_6c8a837ec98fe0b8::objective_set_play_intro(objid, 0);
    namespace_6c8a837ec98fe0b8::update_objective_setzoffset(objid, 75);
    namespace_6c8a837ec98fe0b8::update_objective_setbackground(objid, 1);
    function_9766d0b79eada249(objid, 1);
    function_d76cc64b205084a3(objid, 1);
    namespace_6c8a837ec98fe0b8::objective_playermask_addshowplayer(objid, player);
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x133c
// Size: 0x98
function private function_8c441f0c99924b47(race, player) {
    objid = namespace_6c8a837ec98fe0b8::requestobjectiveid(100);
    race.var_d1d02c6f930782e5 = objid;
    namespace_6c8a837ec98fe0b8::objective_add_objective(objid, "current", race.current_checkpoint.origin, "jup_hud_icon_checkered_flag", "icon_small");
    namespace_6c8a837ec98fe0b8::objective_set_play_intro(objid, 0);
    namespace_6c8a837ec98fe0b8::update_objective_setzoffset(objid, 75);
    namespace_6c8a837ec98fe0b8::update_objective_setbackground(objid, 1);
    function_9766d0b79eada249(objid, 1);
    function_d76cc64b205084a3(objid, 1);
    namespace_6c8a837ec98fe0b8::objective_playermask_addshowplayer(objid, player);
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x13dc
// Size: 0x6a
function private function_2e04081059796fa1(scriptable, part, state, player, var_a5b2c541413aa895, usestring) {
    quest = namespace_a6fd08b4fff3efc9::function_3800f8d2947d87a6("race");
    race = scriptable.race;
    quest thread race_start(race, player);
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x144e
// Size: 0x4c
function private function_b10b7aaa69d4882e(checkpoint) {
    race = checkpoint.race;
    player = race.player;
    player playlocalsound("wz_parkour_race_checkpoint");
    thread function_ad18e63086fa6a51(race);
}

// Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x14a2
// Size: 0x14
function private function_19d4d8b59f6fbfcd(race) {
    thread function_b4af6f3d7d6bc5a6(race);
}

/#

    // Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x14be
    // Size: 0xc
    function private debug_init() {
        devgui_init();
    }

    // Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x14d2
    // Size: 0x5a
    function private devgui_init() {
        devgui::function_6e7290c8ee4f558b("<dev string:x97>");
        devgui::function_b23a59dfb4ca49a1("<dev string:xbd>", "<dev string:xd5>", &function_674a82e21ee1a22a);
        devgui::function_b23a59dfb4ca49a1("<dev string:xed>", "<dev string:x100>", &function_674a82e21ee1a22a);
        devgui::function_b23a59dfb4ca49a1("<dev string:x118>", "<dev string:x129>", &function_674a82e21ee1a22a);
        devgui::function_fe953f000498048f();
    }

    // Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1534
    // Size: 0x18
    function private function_674a82e21ee1a22a(params) {
        level thread function_edb97f584e954807(params);
    }

    // Namespace namespace_dd228ec9ef6de6f / namespace_61a698d8b0d50c4d
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1554
    // Size: 0x17d
    function function_edb97f584e954807(params) {
        quest = namespace_a6fd08b4fff3efc9::function_3800f8d2947d87a6("<dev string:x141>");
        switch (int(params[0])) {
        case 0:
            foreach (race in quest.races) {
                foreach (idx, var_3a0545b5f60a5f23 in race.var_7a1d581eb4e0c22a) {
                    str_color = "<dev string:x149>";
                    if (idx == 0) {
                        str_color = "<dev string:x151>";
                    } else if (idx == race.var_7a1d581eb4e0c22a.size - 1) {
                        str_color = "<dev string:x15a>";
                    }
                    debug::debug_sphere(var_3a0545b5f60a5f23, 25, str_color, 30, "<dev string:x161>", "<dev string:x161>");
                }
            }
            break;
        case 1:
            function_656e822afce77428();
            break;
        case 2:
            function_cd537c18037efbe(quest.races["<dev string:x177>"], level.player.origin);
            break;
        }
    }

#/
