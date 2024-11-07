#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\sp\anim.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\sp\player\cursor_hint.gsc;
#using scripts\sp\player_rig.gsc;
#using scripts\common\anim.gsc;
#using scripts\engine\sp\objectives.gsc;
#using script_5d265b4fca61f070;
#using scripts\common\ai.gsc;
#using scripts\common\scene.gsc;
#using scripts\sp\hud_util.gsc;
#using script_53f4e6352b0b2425;
#using script_4b7698942d6f679a;
#using script_e2fc04a6cc6c766;

#namespace namespace_6bfab3abd0e2748a;

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d8
// Size: 0x2
function function_f61d69c52c69f691() {
    
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e2
// Size: 0x11a
function function_14cca8a7ced708ab() {
    thread namespace_9c93a5b828db4a4b::function_e39d8a96b86719ce(0);
    namespace_9c93a5b828db4a4b::spawn_allies();
    utility::set_start_location("showers", [level.player, level.ally1, level.ally2]);
    namespace_9c93a5b828db4a4b::function_dc2aa213aa5830aa(utility::getstruct("makarov_shower_path_start", "targetname"));
    waitframe();
    allies = [level.ally1, level.ally2, level.makarov];
    foreach (ally in allies) {
        ally thread function_68ec96120a686299();
    }
    level.ally1 utility::set_force_color("c");
    level.ally2 utility::set_force_color("y");
    level.makarov utility::set_force_color("r");
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x704
// Size: 0x72
function function_d169d9173281b55c() {
    level thread function_7454bc08b9d9bef0();
    level thread function_18cd8b965262b66d();
    level thread function_59a853479ab33a5c();
    utility::flag_wait("flag_showers_start");
    thread utility::autosave_by_name("showers_start");
    level.player utility::player_speed_default(2);
    utility::flag_wait("flag_spawn_riot_enemies");
    level thread showers_riot_enemies();
    utility::flag_wait("flag_armory_start");
    level thread function_6cfaceef45832d1f();
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x77e
// Size: 0x2
function function_b6028b9ab8a4bc8d() {
    
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x788
// Size: 0xd3
function function_68ec96120a686299() {
    utility::demeanor_override("cqb");
    utility::set_movement_speed(100);
    if (self == level.makarov) {
        utility::set_stayahead_values(1, 200, 0, 0.1);
        utility::set_stayahead_values(2, 150, -50, 0.1);
        utility::set_stayahead_values(3, 100, -100, 0.1);
        utility::set_stayahead_values(4, 80, -150, 0.1);
        thread utility::enable_stayahead(level.player);
    } else {
        utility::set_stayahead_values(1, 200, 250, 0.1);
        utility::set_stayahead_values(2, 150, 150, 0.1);
        utility::set_stayahead_values(3, 100, 100, 0.1);
        utility::set_stayahead_values(4, 80, 50, 0.1);
    }
    self enableavoidance(1, 1);
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x863
// Size: 0xaf
function function_6cfaceef45832d1f() {
    utility::flag_wait("prisoner_rush_spawn");
    var_cba7f225cd4ca912 = getaiarrayinradius(level.player.origin, 20000);
    foreach (guy in var_cba7f225cd4ca912) {
        if (utility::is_equal(guy.targetname, "showers_vignette_guy") || utility::is_equal(guy.targetname, "showers_riot_arrival_guy")) {
            guy delete();
        }
    }
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x91a
// Size: 0x6e
function function_7454bc08b9d9bef0() {
    utility::activate_trigger_with_targetname("trigger_allies_outside_of_showers_pos");
    utility::flag_wait("flag_showers_start");
    utility::activate_trigger_with_targetname("trigger_showers_makarov_start_pos");
    utility::flag_wait("flag_showers_enter");
    utility::activate_trigger_with_targetname("trigger_showers_allies_start_pos");
    utility::flag_wait("flag_showers_riot_arrival");
    utility::activate_trigger_with_targetname("trigger_showers_allies_riot_pos");
    utility::flag_wait("flag_showers_riot_enemies_dead");
    utility::activate_trigger_with_targetname("trigger_shower_enemies_dead_pos");
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x990
// Size: 0x2
function function_18cd8b965262b66d() {
    
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99a
// Size: 0xf7
function function_59a853479ab33a5c() {
    var_feaa3d1470b941a2 = getspawnerarray("showers_vignette_guy");
    foreach (spawner in var_feaa3d1470b941a2) {
        guy = spawner utility::spawn_ai(1);
        guy thread function_a6eed5e44ce609d1();
        waitframe();
    }
    utility::flag_wait("flag_showers_riot_arrival");
    var_f30f427ddd429bca = utility::getstruct("showers_riot_arrival_sound_org", "targetname");
    var_5f9218dbc9f75cb5 = snd::snd_play("temp_env_siren_alarm_on_fade", level.player);
    var_461d5af838773868 = utility::getstruct("jup_vip_riot_clash_3", "targetname");
    waitframe();
    var_461d5af838773868 thread scene::play(undefined, ["shot_010", "shot_020"]);
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa99
// Size: 0x30
function function_a6eed5e44ce609d1() {
    if (!isdefined(self.animation)) {
        return;
    }
    ai::gun_remove();
    thread function_f4df2627076abecb(self.animation);
    thread function_11c04172a0891d4f();
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xad1
// Size: 0xe0
function function_f4df2627076abecb(animation) {
    level endon("showers_vignettes_stop");
    self endon("vignette_stop");
    wait randomfloatrange(0, 1.5);
    animorg = spawn("script_origin", self.origin);
    animorg.angles = self.angles;
    switch (animation) {
    case #"hash_34568ed1ab0d36f7":
    case #"hash_34568fd1ab0d388a":
        while (true) {
            animorg animation::anim_single_solo(self, "vip_0000_riot_temp_melee_loop_01");
            animorg animation::anim_single_solo(self, "vip_0000_riot_temp_melee_loop_02");
            waitframe();
        }
        break;
    case #"hash_6527f3cb7a650c85":
        animorg animation::anim_loop_solo(self, "civ_cap_cower03_prone_exposed_idle");
        break;
    default:
        while (true) {
            animorg animation::anim_single_solo(self, animation);
            waitframe();
        }
        break;
    }
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbb9
// Size: 0x27
function function_11c04172a0891d4f() {
    self endon("death");
    self waittill("damage");
    utility::anim_stopanimscripted();
    self notify("vignette_stop");
    self kill();
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe8
// Size: 0x85
function showers_riot_enemies() {
    var_907b6a9bb931314 = utility::array_spawn_targetname("showers_riot_enemies");
    foreach (guy in var_907b6a9bb931314) {
        guy.accuracy = 0.5;
        guy.fixednode = 1;
        guy utility::demeanor_override("combat");
    }
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc75
// Size: 0x2
function function_1eb8de7c96aac07c() {
    
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc7f
// Size: 0x11a
function function_461dd387c934770() {
    thread namespace_9c93a5b828db4a4b::function_e39d8a96b86719ce(0);
    namespace_9c93a5b828db4a4b::spawn_allies();
    utility::set_start_location("riotpush", [level.player, level.ally1, level.ally2]);
    namespace_9c93a5b828db4a4b::function_dc2aa213aa5830aa(utility::getstruct("makarov_riotpush_start", "targetname"));
    waitframe();
    allies = [level.ally1, level.ally2, level.makarov];
    foreach (ally in allies) {
        ally thread function_bf0fd3398e2af800();
    }
    level.ally1 utility::set_force_color("c");
    level.ally2 utility::set_force_color("y");
    level.makarov utility::set_force_color("r");
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xda1
// Size: 0x146
function function_e6da23f91b0abf29() {
    level thread function_87c823278218d6c9();
    level thread function_f8b3a120064d1888();
    thread utility::autosave_by_name("showers_end");
    utility::flag_wait("flag_player_enters_armory");
    level thread function_dcea48232a4daf67();
    thread utility::autosave_by_name("armory_start");
    utility::flag_wait("flag_player_enters_curved_hallway");
    level thread function_e128e1cbe2761b84();
    level thread function_cb1e0c0468a8e296();
    utility::flag_wait("flag_armory_enemies_dead");
    thread utility::autosave_by_name("armory_end");
    var_759d5c205f326b3c = utility::getstruct("escape_lift_button", "targetname");
    var_759d5c205f326b3c cursor_hint::create_cursor_hint(undefined, (0, 0, 0), %SP_JUP_VIP/INTERACT_ENTER_ELEVATOR);
    var_759d5c205f326b3c waittill("trigger");
    var_d390ee98b67613e5 = getent("riot_elevator_door", "targetname");
    var_ccd48ea3af0d7026 = utility::getstruct("sm_elevator_cage_door_dest", "targetname");
    var_d390ee98b67613e5 moveto(var_ccd48ea3af0d7026.origin, 6);
    utility::flag_wait("flag_player_within_elevator");
    /#
        iprintlnbold("<dev string:x1c>");
    #/
    thread namespace_da16efa8eb97d1c0::function_9af6ecb59cc2bec9();
    flag_wait("cine_elevator_end");
    teleport_player(getstruct("elevator_tp_end", "targetname"));
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeef
// Size: 0x2
function function_add6409c01487ea6() {
    
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef9
// Size: 0xd3
function function_bf0fd3398e2af800() {
    utility::demeanor_override("cqb");
    utility::set_movement_speed(100);
    if (self == level.makarov) {
        utility::set_stayahead_values(1, 200, 0, 0.1);
        utility::set_stayahead_values(2, 150, -50, 0.1);
        utility::set_stayahead_values(3, 100, -100, 0.1);
        utility::set_stayahead_values(4, 80, -150, 0.1);
        thread utility::enable_stayahead(level.player);
    } else {
        utility::set_stayahead_values(1, 200, 250, 0.1);
        utility::set_stayahead_values(2, 150, 150, 0.1);
        utility::set_stayahead_values(3, 100, 100, 0.1);
        utility::set_stayahead_values(4, 80, 50, 0.1);
    }
    self enableavoidance(1, 1);
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfd4
// Size: 0x26
function function_87c823278218d6c9() {
    utility::activate_trigger_with_targetname("trigger_shower_enemies_dead_pos");
    utility::flag_wait("flag_armory_enemies_dead");
    utility::activate_trigger_with_targetname("trigger_armory_enemies_dead_pos");
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1002
// Size: 0x2
function function_f8b3a120064d1888() {
    
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x100c
// Size: 0x10f
function function_dcea48232a4daf67() {
    var_256e9d5846be8741 = getspawnerarray("armory_riot_shield_guys");
    var_925b25e91e45d49e = utility::array_spawn(var_256e9d5846be8741, 1);
    waitframe();
    foreach (guy in var_925b25e91e45d49e) {
        guy.fixednode = 1;
        guy.ignoreall = 1;
    }
    utility::flag_wait("flag_armory_retreat");
    var_94580a350b8ede6b = getent("armory_retreat_goal", "targetname");
    foreach (guy in var_925b25e91e45d49e) {
        if (isalive(guy)) {
            guy.fixednode = 0;
            guy cleargoalentity();
            guy setgoalvolumeauto(var_94580a350b8ede6b);
        }
    }
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1123
// Size: 0x11a
function function_e128e1cbe2761b84() {
    var_af0642fa4de0f643 = getspawnerarray("armory_guys_group_1");
    var_748f25ecd60a4e9c = utility::array_spawn(var_af0642fa4de0f643, 1);
    waitframe();
    foreach (guy in var_748f25ecd60a4e9c) {
        guy.fixednode = 1;
    }
    while (var_748f25ecd60a4e9c.size > 3) {
        var_748f25ecd60a4e9c = utility::array_removedead_or_dying(var_748f25ecd60a4e9c);
        wait 1;
    }
    utility::flag_set("flag_armory_retreat");
    var_94580a350b8ede6b = getent("armory_retreat_goal", "targetname");
    foreach (guy in var_748f25ecd60a4e9c) {
        if (isalive(guy)) {
            guy.fixednode = 0;
            guy cleargoalentity();
            guy setgoalvolumeauto(var_94580a350b8ede6b);
        }
    }
}

// Namespace namespace_6bfab3abd0e2748a / namespace_ff39b296432b5ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1245
// Size: 0x115
function function_cb1e0c0468a8e296() {
    utility::flag_wait_either("flag_armory_rushers_spawn", "flag_armory_player_halfway");
    armory_rushers_spawner = getspawnerarray("armory_rushers_spawner");
    var_4d948b7f2686bd1e = utility::array_spawn(armory_rushers_spawner, 1);
    waitframe();
    foreach (guy in var_4d948b7f2686bd1e) {
        guy.accuracy = 0.5;
    }
    utility::flag_wait("flag_armory_retreat");
    var_94580a350b8ede6b = getent("armory_retreat_goal", "targetname");
    foreach (guy in var_4d948b7f2686bd1e) {
        if (isalive(guy)) {
            guy.fixednode = 0;
            guy cleargoalentity();
            guy setgoalvolumeauto(var_94580a350b8ede6b);
        }
    }
}

