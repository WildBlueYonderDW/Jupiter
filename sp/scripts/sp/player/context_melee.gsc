#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\common\values.gsc;
#using scripts\sp\anim.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\common\ai.gsc;
#using scripts\sp\player\cursor_hint.gsc;
#using scripts\stealth\utility.gsc;
#using scripts\sp\fakeactor.gsc;
#using scripts\stealth\group.gsc;
#using scripts\sp\player.gsc;
#using script_3433ee6b63c7e243;

#namespace namespace_f6828b146488825b;

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf4a
// Size: 0x120
function main() {
    if (istrue(level.context_melee_enabled)) {
        return;
    }
    level.context_melee_enabled = 1;
    if (!isdefined(level.context_melee_has_been_enabled)) {
        level.context_melee_has_been_enabled = 0;
    }
    setdvarifuninitialized(@"context_melee_silent", 0);
    setdvarifuninitialized(@"hash_c5ed5374ba752078", 0);
    setdvarifuninitialized(@"hash_5eceb684ea4bca83", 0);
    setdvarifuninitialized(@"hash_feb24c2563c88407", 0);
    setdvarifuninitialized(@"hash_57c7e30c0dbba2fe", 20);
    setdvarifuninitialized(@"hash_a6f4f39d206bd33e", 1);
    /#
        setdvarifuninitialized(@"hash_3844d738b76e11e2", 0);
    #/
    /#
        setdvarifuninitialized(@"hash_17968e4611011cb", 0);
    #/
    /#
        setdvarifuninitialized(@"hash_3be6c97f9fc0d8eb", -1);
    #/
    setsaveddvar(@"hash_3b07e69e1cd8b041", 100);
    if (!level.context_melee_has_been_enabled) {
        precache();
    }
    level.player thread enable_dynamic_takedowns();
    level.context_melee_has_been_enabled = 1;
    print_debug("context_melee enabled: " + gettime());
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1072
// Size: 0xf6
function precache() {
    level.context_melee_lastframe_bone = "tag_player";
    level.context_melee_player_link_bone = "tag_player";
    level.context_melee_lastframe_type = "player_capsule";
    level.context_melee_sight_disabled = 0;
    level._effect["vfx_contextmelee_stab"] = loadfx("vfx/iw8/weap/_knife/vfx_contextmele_neckstab_med_ch2.vfx ");
    if (!getdvarint(@"hash_5eceb684ea4bca83")) {
        add_hint_string("context_melee_silent", %CONTEXT_MELEE/SILENT_KILL, &context_melee_hint_break, 2);
        add_hint_string("context_melee_stealth", %CONTEXT_MELEE/STEALTH_KILL, &context_melee_hint_break, 2);
        add_hint_string("context_melee_blocked", %CONTEXT_MELEE/BLOCKED, &context_melee_hint_fail, 2);
        add_hint_string("context_melee_scripted_fail", %CONTEXT_MELEE/SCRIPTED_FAIL, &context_melee_hint_scripted_fail, 2);
        add_hint_string("context_melee_scripted_noweap", %CONTEXT_MELEE/SCRIPTED_NOWEAP, &context_melee_hint_scripted_noweap, 2);
    }
    precachemodel("weapon_vm_me_soscar_knife");
    precachemodel("axis_guide_simple");
    dynamic_knife_anims();
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1170
// Size: 0x2f
function play_sound_safe(alias) {
    if (!soundexists(alias)) {
        /#
            iprintlnbold("<dev string:x1c>" + alias);
        #/
        return;
    }
    self playsound(alias);
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11a7
// Size: 0x1c
function dynamic_knife_anims() {
    flag_init("hold_context_melee");
    dynamic_knife_kill_anims();
    dynamic_knife_kill_anims_player();
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11cb
// Size: 0x174
function dynamic_knife_kill_anims() {
    anims = [];
    anims["context_melee_kill_01_back"] = generic_human%vm_sp_context_melee_stand_1_rear_enemy;
    anims["context_melee_kill_01_left"] = generic_human%vm_sp_context_melee_stand_1_left_enemy;
    anims["context_melee_kill_01_right"] = generic_human%vm_sp_context_melee_stand_1_right_enemy;
    anims["context_melee_kill_01_front"] = generic_human%vm_sp_context_melee_stand_1_front_enemy;
    anims["context_melee_kill_02_back"] = generic_human%vm_sp_context_melee_stand_2_rear_enemy;
    anims["context_melee_kill_02_left"] = generic_human%vm_sp_context_melee_stand_2_left_enemy;
    anims["context_melee_kill_02_right"] = generic_human%vm_sp_context_melee_stand_2_right_enemy;
    anims["context_melee_kill_02_front"] = generic_human%vm_sp_context_melee_stand_2_front_enemy;
    foreach (key, var_4f3089070d8b1e24 in anims) {
        level.scr_anim["generic"][key] = var_4f3089070d8b1e24;
        addnotetrack_customfunction("generic", "cm_death", &context_melee_death, key);
        addnotetrack_customfunction("generic", "cm_ragdoll", &context_melee_ragdoll, key);
        addnotetrack_customfunction("generic", "cm_fx", &context_melee_fx, key);
        addnotetrack_customfunction("generic", "cm_sfx", &context_melee_sfx, key);
        addnotetrack_customfunction("generic", "cm_rumble_light", &context_melee_rumble_light, key);
        addnotetrack_customfunction("generic", "cm_rumble_heavy", &context_melee_rumble_heavy, key);
    }
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1347
// Size: 0x21b
function dynamic_knife_kill_anims_player() {
    level.scr_animtree["context_melee_player_rig"] = %player;
    if (!isdefined(level.scr_model) || !isdefined(level.scr_model["context_melee_player_rig"])) {
        level.scr_model["context_melee_player_rig"] = "viewhands_base_iw8";
    }
    level.scr_anim["context_melee_player_rig"]["context_melee_kill_01_back"] = player%vm_sp_context_melee_stand_1_rear_player;
    level.scr_anim["context_melee_player_rig"]["context_melee_kill_01_left"] = player%vm_sp_context_melee_stand_1_left_player;
    level.scr_anim["context_melee_player_rig"]["context_melee_kill_01_right"] = player%vm_sp_context_melee_stand_1_right_player;
    level.scr_anim["context_melee_player_rig"]["context_melee_kill_01_front"] = player%vm_sp_context_melee_stand_1_front_player;
    addnotetrack_customfunction("context_melee_player_rig", "cm_sfx_player", &context_melee_sfx_player, "context_melee_kill_01_back");
    addnotetrack_customfunction("context_melee_player_rig", "cm_sfx_player", &context_melee_sfx_player, "context_melee_kill_01_left");
    addnotetrack_customfunction("context_melee_player_rig", "cm_sfx_player", &context_melee_sfx_player, "context_melee_kill_01_right");
    addnotetrack_customfunction("context_melee_player_rig", "cm_sfx_player", &context_melee_sfx_player, "context_melee_kill_01_front");
    level.scr_anim["context_melee_player_rig"]["context_melee_kill_02_back"] = player%vm_sp_context_melee_stand_2_rear_player;
    level.scr_anim["context_melee_player_rig"]["context_melee_kill_02_left"] = player%vm_sp_context_melee_stand_2_left_player;
    level.scr_anim["context_melee_player_rig"]["context_melee_kill_02_right"] = player%vm_sp_context_melee_stand_2_right_player;
    level.scr_anim["context_melee_player_rig"]["context_melee_kill_02_front"] = player%vm_sp_context_melee_stand_2_front_player;
    addnotetrack_customfunction("context_melee_player_rig", "cm_sfx_player", &context_melee_sfx_player, "context_melee_kill_02_back");
    addnotetrack_customfunction("context_melee_player_rig", "cm_sfx_player", &context_melee_sfx_player, "context_melee_kill_02_left");
    addnotetrack_customfunction("context_melee_player_rig", "cm_sfx_player", &context_melee_sfx_player, "context_melee_kill_02_right");
    addnotetrack_customfunction("context_melee_player_rig", "cm_sfx_player", &context_melee_sfx_player, "context_melee_kill_02_front");
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x156a
// Size: 0xeb
function context_melee_hint_break() {
    if (!getdvarint(@"hash_feb24c2563c88407")) {
        return true;
    }
    if (!isdefined(level.player.context_melee_victim)) {
        return true;
    }
    if (!isdefined(level.player.context_melee_hint)) {
        return true;
    }
    if (isdefined(level.player.context_melee_allow_directions) && isdefined(level.player.context_melee_direction)) {
        if (!array_contains(level.player.context_melee_allow_directions, level.player.context_melee_direction)) {
            /#
                print("<dev string:x2c>" + level.player.context_melee_direction);
            #/
            return true;
        }
    }
    return istrue(level.player.context_melee_victim.in_melee_death);
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x165e
// Size: 0x3d
function context_melee_hint_fail() {
    if (!getdvarint(@"hash_c5ed5374ba752078")) {
        return true;
    }
    if (context_melee_hint_not_allowed()) {
        return true;
    }
    if (!isdefined(level.player.context_melee_has_enemy)) {
        return true;
    }
    return false;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16a4
// Size: 0x5c
function context_melee_hint_scripted_fail() {
    if (!getdvarint(@"hash_c5ed5374ba752078")) {
        return true;
    }
    if (context_melee_hint_not_allowed()) {
        return true;
    }
    if (!isdefined(level.player.context_melee_scripted_enemy_guess)) {
        return true;
    }
    if (!is_enemy_onscreen(level.player.context_melee_scripted_enemy_guess)) {
        return true;
    }
    return false;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1709
// Size: 0x5c
function context_melee_hint_scripted_noweap() {
    if (!getdvarint(@"hash_c5ed5374ba752078")) {
        return true;
    }
    if (context_melee_hint_not_allowed()) {
        return true;
    }
    if (!isdefined(level.player.context_melee_scripted_enemy_guess)) {
        return true;
    }
    if (!is_enemy_onscreen(level.player.context_melee_scripted_enemy_guess)) {
        return true;
    }
    return false;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x176e
// Size: 0xcf
function context_melee_hint_not_allowed() {
    if (!isdefined(level.player.context_melee_hint)) {
        return true;
    }
    if (level.player getstance() == "prone") {
        return true;
    }
    if (isdefined(level.player.context_melee_allow_directions) && isdefined(level.player.context_melee_direction)) {
        if (!array_contains(level.player.context_melee_allow_directions, level.player.context_melee_direction)) {
            /#
                print("<dev string:x2c>" + level.player.context_melee_direction);
            #/
            level.player.context_melee_hinted = 0;
            return true;
        }
    }
    return false;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1846
// Size: 0xb1
function scripted_melee_active(bool) {
    if (bool && !level.player isscriptedmeleeactive()) {
        print_debug("scripted melee active " + gettime());
        level.player.context_melee_last_active_time = gettime();
        level.player setscriptedmeleeactive(bool);
        return;
    }
    if (!bool && level.player isscriptedmeleeactive()) {
        print_debug("scripted melee INactive " + gettime());
        level.player.context_melee_last_inactive_time = gettime();
        level.player setscriptedmeleeactive(bool);
    }
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18ff
// Size: 0x16b
function context_melee_cursor_hint_create() {
    if (isdefined(level.player.context_melee_allow_directions) && isdefined(level.player.context_melee_direction)) {
        if (!array_contains(level.player.context_melee_allow_directions, level.player.context_melee_direction)) {
            return;
        }
    }
    if (getdvarint(@"hash_5eceb684ea4bca83") == 1) {
        if (!isdefined(level.context_melee_hint_ent_set)) {
            level.context_melee_hint_ent_set = 1;
            level.context_melee_hint_ent thread scripts\sp\player\cursor_hint::create_cursor_hint("tag_origin", undefined, level.player.context_melee_hint, 360, 5000, 2000, undefined, undefined, undefined, undefined, "duration_none", "+melee", 0, 360);
            level.context_melee_hint_ent setuseprioritymax();
        } else {
            level.context_melee_hint_ent sethintstring(level.player.context_melee_hint);
            level.context_melee_hint_ent sethinticon("blank");
            level.context_melee_hint_ent setusecommand("+melee");
        }
        return;
    }
    if (getdvarint(@"hash_5eceb684ea4bca83") == 2) {
        setomnvar("ui_in_world_text_index", 2);
        setomnvar("ui_in_world_text_entnum", level.context_melee_hint_ent getentitynumber());
    }
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a72
// Size: 0x5f
function context_melee_cursor_hint_remove() {
    if (getdvarint(@"hash_5eceb684ea4bca83") && isdefined(level.context_melee_hint_ent)) {
        level.context_melee_hint_ent_set = undefined;
        if (getdvarint(@"hash_5eceb684ea4bca83") == 1) {
            level.context_melee_hint_ent thread scripts\sp\player\cursor_hint::remove_cursor_hint();
        }
        level.context_melee_hint_ent delete();
    }
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad9
// Size: 0xb3
function context_melee_cursor_hint_blocked() {
    if (isdefined(level.context_melee_hint_ent)) {
        if (getdvarint(@"hash_5eceb684ea4bca83") == 1) {
            level.player.context_melee_hint_blocked = ter_op(isdefined(level.player.context_melee_hint_blocked_custom), level.player.context_melee_hint_blocked_custom, %CONTEXT_MELEE/BLOCKED);
            level.context_melee_hint_ent sethintstring(level.player.context_melee_hint_blocked);
            level.context_melee_hint_ent sethinticon("hud_ability_disabled_x");
        }
        if (getdvarint(@"hash_5eceb684ea4bca83") == 2) {
        }
    }
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b94
// Size: 0x2cd
function dynamic_takedowns_monitor() {
    level endon("stop_context_melee");
    while (true) {
        if (istrue(self.in_melee_death)) {
            scripted_melee_active(0);
            level thread context_melee_cursor_hint_remove();
            waitframe();
            continue;
        }
        self.context_melee_victim = undefined;
        self.context_melee_direction = undefined;
        self.context_melee_animation = undefined;
        if (flag("hold_context_melee")) {
            flag_waitopen("hold_context_melee");
        }
        context_melee_victim = check_for_close_victim();
        if (isdefined(context_melee_victim) && istrue(context_melee_victim.in_melee_death)) {
            scripted_melee_active(0);
            level thread context_melee_cursor_hint_remove();
            self.context_melee_victim = undefined;
            waitframe();
            continue;
        }
        if (isdefined(context_melee_victim)) {
            context_melee_direction = context_melee_victim player_stealth_kill_direction();
            context_melee_animation = context_melee_victim get_anim_from_direction(context_melee_direction);
            if (context_melee_victim check_player_can_stealth_kill_me(context_melee_animation, context_melee_direction)) {
                self.context_melee_victim = context_melee_victim;
                self.context_melee_direction = context_melee_direction;
                self.context_melee_animation = context_melee_animation;
                scripted_melee_active(1);
                if (!istrue(level.var_f27ceead977abab6)) {
                    if (getdvarint(@"hash_5eceb684ea4bca83")) {
                        if (level.player getstance() == "stand") {
                            var_362b543b4e2b503 = context_melee_victim.origin + anglestoforward(vectortoangles(level.player.origin - context_melee_victim.origin)) * 16 + (0, 0, level.context_melee_eye_height_stand);
                        } else {
                            var_362b543b4e2b503 = context_melee_victim.origin + anglestoforward(vectortoangles(level.player.origin - context_melee_victim.origin)) * 16 + (0, 0, level.context_melee_eye_height_crouch);
                        }
                        if (!isdefined(level.context_melee_hint_ent)) {
                            level.context_melee_hint_ent = spawn_tag_origin(var_362b543b4e2b503);
                        } else {
                            level.context_melee_hint_ent.origin = var_362b543b4e2b503;
                        }
                        self.context_melee_hint = ter_op(isdefined(self.context_melee_hint_custom), self.context_melee_hint_custom, %CONTEXT_MELEE/STEALTH_KILL_HINT);
                        level thread context_melee_cursor_hint_create();
                    } else {
                        self.context_melee_hint = ter_op(isdefined(self.context_melee_hint_custom), self.context_melee_hint_custom, "context_melee_stealth");
                        thread display_hint_forced(self.context_melee_hint);
                    }
                }
            } else {
                print3d_debug(self.origin, "^1no animation", (0, 1, 0), 1, 0.1, 1, "line5");
                self.context_melee_victim = undefined;
                scripted_melee_active(0);
            }
        } else {
            scripted_melee_active(0);
        }
        waitframe();
    }
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e69
// Size: 0x116
function enable_dynamic_takedowns() {
    level notify("stop_context_melee");
    if (!isdefined(self.melee_arms)) {
        self.melee_arms = spawn_anim_model("context_melee_player_rig", self.origin, self.angles);
    }
    self.melee_arms notsolid();
    self.melee_arms hide();
    level endon("stop_context_melee");
    thread dynamic_takedowns_monitor();
    while (true) {
        self waittill("player_scripted_melee");
        if (level.script == "estate" && self isuseinprogress()) {
            continue;
        }
        if (isalive(self.context_melee_victim)) {
            victim = self.context_melee_victim;
            direction = self.context_melee_direction;
            animation = self.context_melee_animation;
            if (isdefined(animation)) {
                if (isdefined(self.skip_context_melee_anim)) {
                    self notify("skipped_melee_anim");
                    continue;
                }
                victim thread do_context_melee(animation, direction);
                level context_melee_waittill_player_finished();
            }
        }
    }
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f87
// Size: 0x41
function disable_dynamic_takedowns() {
    level notify("stop_context_melee");
    level.context_melee_enabled = 0;
    scripted_melee_active(0);
    level thread context_melee_cursor_hint_remove();
    self.context_melee_victim = undefined;
    print_debug("context_melee disabled: " + gettime());
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fd0
// Size: 0x893
function check_for_close_victim() {
    level endon("stop_context_melee");
    if (getdvarint(@"hash_579c12ad813fa4a8") != 640) {
        setsaveddvar(@"hash_579c12ad813fa4a8", 640);
    }
    if (getdvarint(@"hash_5e6c29a5c2de1adf") != 384) {
        setsaveddvar(@"hash_5e6c29a5c2de1adf", 384);
    }
    team3 = get_all_closest_living(level.player.origin, getaiarray("team3"), 512, 0);
    var_7435b7ced3d68768 = get_all_closest_living(level.player.origin, getaiarray("axis"), 512, 0);
    var_7435b7ced3d68768 = array_combine(team3, var_7435b7ced3d68768);
    array_call(var_7435b7ced3d68768, &function_f23f106f8976771d);
    foreach (enemy in var_7435b7ced3d68768) {
        if (!isdefined(enemy.context_melee_combatsight_buffer)) {
            enemy.context_melee_combatsight_buffer = 0;
        }
        if (!isdefined(enemy.context_melee_combatsight_lastime)) {
            enemy.context_melee_combatsight_lastime = gettime();
        }
        if (!isdefined(enemy.context_melee_combat_buffer) || enemy.context_melee_combat_buffer == 0) {
            if (enemy scripts\stealth\utility::bcisincombat() && isdefined(enemy.enemy) && enemy.enemy == level.player) {
                if (enemy context_melee_cansee()) {
                    enemy.context_melee_combatsight_buffer += 1;
                    enemy.context_melee_combatsight_lastime = gettime();
                    print3d_debug(enemy.origin, "cm sight buffer " + enemy.context_melee_combatsight_buffer, (1, 0, 0), 1, 0.1, 1, "line1");
                } else if (gettime() - enemy.context_melee_combatsight_lastime > 2000) {
                    enemy.context_melee_combatsight_buffer = 0;
                    print3d_debug(enemy.origin, "cm sight buffer " + enemy.context_melee_combatsight_buffer, (0, 1, 0), 1, 0.1, 1, "line1");
                }
            } else {
                enemy.context_melee_combatsight_buffer = 0;
                print3d_debug(enemy.origin, "cm sight buffer " + enemy.context_melee_combatsight_buffer, (0, 1, 0), 1, 0.1, 1, "line1");
            }
            continue;
        }
        enemy.context_melee_combatsight_buffer = 0;
        print3d_debug(enemy.origin, "cm sight buffer " + enemy.context_melee_combatsight_buffer, (0, 1, 0), 1, 0.1, 1, "line1");
    }
    enemy = level.player getscriptedmeleetarget();
    if (!isdefined(enemy)) {
        enemy = get_closest_living(level.player.origin, var_7435b7ced3d68768);
        if (isdefined(enemy) && distance(level.player.origin, enemy.origin) < getdvarint(@"hash_3b07e69e1cd8b041") - 8) {
            print_debug("scripted melee not returning an enemy but you're close enough to one.");
            level.player.context_melee_scripted_enemy_guess = enemy;
            if (!getdvarint(@"hash_5eceb684ea4bca83")) {
                level.player thread display_hint("context_melee_scripted_fail");
            } else {
                context_melee_cursor_hint_blocked();
            }
        } else {
            level thread context_melee_cursor_hint_remove();
            level.player.context_melee_scripted_enemy_guess = undefined;
        }
        level.player.context_melee_has_enemy = undefined;
        return undefined;
    }
    level.player.context_melee_has_enemy = enemy;
    level.player.context_melee_scripted_enemy_guess = undefined;
    if (isplayer(enemy)) {
        return undefined;
    }
    if (level.player ismeleeing()) {
        return undefined;
    }
    if (!isalive(enemy)) {
        return undefined;
    }
    if (enemy scripts\sp\fakeactor::is_fakeactor() || !isai(enemy)) {
        return undefined;
    }
    if (isdefined(enemy.context_melee_allowed) && !enemy.context_melee_allowed) {
        return undefined;
    }
    if (!isdefined(enemy.animtree) || enemy.animtree != "generic_human") {
        return undefined;
    }
    if (isdefined(enemy.unittype)) {
        switch (enemy.unittype) {
        case #"hash_1403dfb5d1265ddc":
        case #"hash_4ad475e6e15635bd":
        case #"hash_f4a90c6c03d32ee9":
            return undefined;
        }
    }
    if (enemy doinglongdeath()) {
        return undefined;
    }
    if (getdvarint(@"hash_3844d738b76e11e2")) {
        enemyeye = enemy gettagorigin("j_head");
        enemyorigin = enemy gettagorigin("tag_origin");
        dir = vectornormalize(enemyeye - level.player.origin);
        dot = vectordot(dir, anglestoright(enemy gettagangles("j_head")));
        print3d_debug(enemyeye, "dot: " + abs(dot), (1, 1, 1), 1, 0.05, 1);
        line_debug(enemyeye, enemyeye + anglestoright(enemy gettagangles("j_head")) * 60, (1, 1, 1), 1, 0, 1);
        line_debug(enemyorigin, enemyorigin + anglestoforward(enemy gettagangles("tag_origin")) * 60, (1, 1, 1), 1, 0, 1);
    }
    if (!isdefined(enemy.context_melee_combat_buffer)) {
        enemy.context_melee_combat_buffer = 0;
    }
    if (!isdefined(enemy.context_melee_sight_buffer)) {
        enemy.context_melee_sight_buffer = 0;
    }
    if (isdefined(enemy.context_melee_last_melee_finish_time) && gettime() - enemy.context_melee_last_melee_finish_time < 600) {
        print3d_debug(enemy.origin, "waiting for previous melee buffer: " + gettime(), (1, 0, 0), 1, 0.1, 1, "line3");
        enemy.context_melee_sight_buffer = 12;
        enemy.context_melee_combat_buffer = 12;
        enemy thread combat_counter_reset();
        return undefined;
    }
    if (!istrue(enemy.var_97a4fca26ee7d0cf) && enemy scripts\stealth\utility::bcisincombat() && isdefined(enemy.enemy) && enemy.enemy == level.player) {
        if (enemy.context_melee_combatsight_buffer > 15) {
            print3d_debug(enemy.origin, " no buffer bc I've been looking at you!", (0, 1, 0), 1, 0.1, 1, "line2");
            return undefined;
        }
        enemy.context_melee_combat_buffer += 1;
        if (enemy.context_melee_combat_buffer > 12 && enemy function_b310b0376dba9fb0()) {
            return undefined;
        } else {
            print3d_debug(enemy.origin, "combat buffer", (1, 0, 1), 1, 0.1, 1, "line3");
            enemy thread combat_counter_reset();
        }
    } else {
        enemy.context_melee_combat_buffer = 0;
    }
    if (enemy isinscriptedstate() && enemy context_melee_cansee()) {
        enemy.context_melee_sight_buffer += 1;
        if (enemy.context_melee_sight_buffer > 12) {
            return undefined;
        } else {
            print3d_debug(enemy.origin, "I SEE YOU!", (1, 0, 0), 1, 0.1, 1, "line3");
            enemy thread combat_counter_reset();
        }
    } else {
        enemy.context_melee_sight_buffer = 0;
    }
    return enemy;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x286c
// Size: 0x80
function combat_counter_reset() {
    self notify("counter_reset_stop");
    self endon("death");
    self endon("counter_reset_stop");
    var_c2494340a9dd480d = gettime();
    for (;;) {
        if (gettime() - var_c2494340a9dd480d > 2000 && !context_melee_cansee()) {
            break;
        } else if (context_melee_cansee()) {
            var_c2494340a9dd480d = gettime();
        }
        waitframe();
    }
    print_debug("combat counter reset: " + gettime());
    self.context_melee_sight_buffer = 0;
    self.context_melee_combat_buffer = 0;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28f4
// Size: 0x9c
function is_enemy_onscreen(enemy) {
    if (isdefined(level.player worldpointtoscreenpos(enemy gettagorigin("j_head"), getdvarint(@"hash_b38fcf293d1e91a8")))) {
        return true;
    } else if (isdefined(level.player worldpointtoscreenpos(enemy gettagorigin("j_spinelower"), getdvarint(@"hash_b38fcf293d1e91a8")))) {
        return true;
    } else if (isdefined(level.player worldpointtoscreenpos(enemy gettagorigin("tag_origin"), getdvarint(@"hash_b38fcf293d1e91a8")))) {
        return true;
    }
    return false;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x2999
// Size: 0x4f7
function physics_test(type, start, end, enemy, var_cd5bf981bb955e4b, collision_info, var_7935b319829b6b1b, var_e18e6346ccfbb5a3) {
    if (!getdvarint(@"hash_a6f4f39d206bd33e")) {
        return true;
    }
    if (!isdefined(var_cd5bf981bb955e4b)) {
        var_cd5bf981bb955e4b = "collision failed";
    }
    result = undefined;
    if (isdefined(collision_info) && isdefined(collision_info.capsule_radius) && collision_info.capsule_radius == 15) {
        var_63c330e431643c75 = 1;
    } else {
        var_63c330e431643c75 = 0.8;
    }
    switch (type) {
    case #"hash_974f0c6c58ef125f":
        result = physics_raycast(start, end, get_melee_contents(), [level.player, enemy], 0, "physicsquery_closest", 1);
        break;
    case #"hash_bb1d97e722f4eae8":
        result = physics_spherecast(start, end, 2, get_melee_contents(), [level.player, enemy], "physicsquery_closest");
        sphere_debug(start, 2, (1, 0, 1), 0, 1);
        sphere_debug(end, 2, (1, 0, 1), 0, 1);
        break;
    case #"hash_dcafa165058a352":
        result = physics_capsulecast(start, end, collision_info.capsule_radius * var_63c330e431643c75, collision_info.capsule_halfheight * var_63c330e431643c75, level.player getplayerangles(1), get_melee_contents(), [level.player, enemy], "physicsquery_closest");
        capsule_debug(start - (0, 0, collision_info.capsule_midpoint_height * 0.5), collision_info.capsule_radius * var_63c330e431643c75, collision_info.capsule_halfheight * var_63c330e431643c75 * 2, level.player getplayerangles(1), (1, 0, 1), 0, 1);
        capsule_debug(end - (0, 0, var_7935b319829b6b1b.capsule_midpoint_height * 0.5), var_7935b319829b6b1b.capsule_radius * var_63c330e431643c75, var_7935b319829b6b1b.capsule_halfheight * var_63c330e431643c75 * 2, level.player getplayerangles(1), (1, 0, 1), 0, 1);
        break;
    case #"hash_8f18afd65e6adfac":
        result = physics_capsulecast(start, end, collision_info.capsule_radius, collision_info.capsule_halfheight, level.player getplayerangles(1), get_melee_contents(), [level.player, enemy], "physicsquery_closest");
        break;
    case #"hash_631e51a9f39e5622":
        result = physics_getclosestpointtosphere(start + (0, 0, 2), 2, 0, get_melee_contents(), [level.player, enemy], "physicsquery_closest");
        sphere_debug(start + (0, 0, 2), 2, (1, 1, 1), 0, 1);
        break;
    case #"hash_f8afe568f67a3699":
        result = physics_getclosestpointtosphere(start + (0, 0, 2), 2, 0, get_melee_sight_contents(), [level.player, enemy, self], "physicsquery_closest");
        sphere_debug(start + (0, 0, 2), 2, (1, 1, 1), 0, 1);
        break;
    case #"hash_476590e59e3ff6f4":
        result = physics_getclosestpointtocapsule(start, var_7935b319829b6b1b.capsule_radius * var_63c330e431643c75, var_7935b319829b6b1b.capsule_halfheight * var_63c330e431643c75, level.player getplayerangles(1), 0, get_melee_contents(), [level.player, enemy], "physicsquery_closest");
        capsule_debug(start - (0, 0, var_7935b319829b6b1b.capsule_midpoint_height * 0.5), var_7935b319829b6b1b.capsule_radius * var_63c330e431643c75, var_7935b319829b6b1b.capsule_halfheight * var_63c330e431643c75 * 2, level.player getplayerangles(1), (1, 1, 0), 0, 1);
        break;
    }
    if (istrue(result.size)) {
        print3d_debug(result[0]["position"], var_cd5bf981bb955e4b, (1, 0, 0), 1, 0.1, 1);
        line_debug(start, result[0]["position"], (1, 0, 0), 1, 0, 1);
        sphere_debug(result[0]["position"], 2, (1, 0, 0), 0, 1);
        return false;
    }
    return true;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2e99
// Size: 0x629
function anim_collision_check(anime, direction, offset) {
    level notify("tag_view_debug_end");
    if (level.player getstance() == "prone") {
        return false;
    }
    if (istrue(level.var_e851b39f9f329735)) {
        return true;
    }
    collision_info = level.player getcollision(level.player getstance());
    var_7935b319829b6b1b = level.player getcollision("stand");
    var_e18e6346ccfbb5a3 = level.player getcollision("crouch");
    if (collision_info.capsule_halfheight < collision_info.capsule_radius) {
        collision_info.capsule_halfheight = collision_info.capsule_radius;
    }
    var_ecbd2406c725cb8f = [0];
    var_3e73ec41ba9920cb = spawn_anim_model("context_melee_player_rig", level.player.origin, level.player.angles);
    var_3e73ec41ba9920cb notsolid();
    var_3e73ec41ba9920cb hide();
    var_4b5eba8746581deb = spawn_anim_model("context_melee_player_rig", level.player.origin, level.player.angles);
    var_4b5eba8746581deb notsolid();
    var_4b5eba8746581deb hide();
    anim_ent = spawn_tag_origin();
    set_scripted_node_angles(anim_ent, direction, offset);
    anim_ent anim_first_frame_solo(var_3e73ec41ba9920cb, anime);
    anim_ent anim_last_frame_solo(var_4b5eba8746581deb, anime);
    var_3e73ec41ba9920cb linkto(anim_ent);
    var_4b5eba8746581deb linkto(anim_ent);
    level.context_melee_eye_height_stand = var_7935b319829b6b1b.capsule_halfheight + var_7935b319829b6b1b.capsule_midpoint_height;
    level.context_melee_eye_height_crouch = var_e18e6346ccfbb5a3.capsule_halfheight + var_e18e6346ccfbb5a3.capsule_midpoint_height;
    end_pos = var_4b5eba8746581deb gettagorigin(level.context_melee_lastframe_bone) + anglestoup(var_4b5eba8746581deb gettagangles(level.context_melee_lastframe_bone)) * level.context_melee_eye_height_stand;
    foreach (angle in var_ecbd2406c725cb8f) {
        if (getdvarint(@"hash_3844d738b76e11e2")) {
            line_debug(level.player geteye() + (0, 0, -0.1), var_3e73ec41ba9920cb gettagorigin("tag_view"), (1, 1, 1), 1, 0, 1);
            circle_debug(var_3e73ec41ba9920cb gettagorigin(level.context_melee_player_link_bone), collision_info.capsule_radius, (1, 0, 0), 1, 1, 1);
            circle_debug(var_4b5eba8746581deb gettagorigin(level.context_melee_lastframe_bone), collision_info.capsule_radius, (1, 1, 0), 1, 1, 1);
            line_debug(var_4b5eba8746581deb gettagorigin(level.context_melee_lastframe_bone), var_4b5eba8746581deb gettagorigin(level.context_melee_lastframe_bone) + anglestoup(var_4b5eba8746581deb gettagangles(level.context_melee_lastframe_bone)) * level.context_melee_eye_height_stand, (0, 0, 1), 1, 0, 1);
            line_debug(var_4b5eba8746581deb gettagorigin(level.context_melee_lastframe_bone) + anglestoup(var_4b5eba8746581deb gettagangles(level.context_melee_lastframe_bone)) * level.context_melee_eye_height_stand, var_4b5eba8746581deb gettagorigin(level.context_melee_lastframe_bone) + anglestoup(var_4b5eba8746581deb gettagangles(level.context_melee_lastframe_bone)) * level.context_melee_eye_height_stand + (0, 0, -60), (0, 0, 1), 1, 1, 1);
            circle_debug(end_pos, collision_info.capsule_radius, (0, 0, 1), 1, 1, 1);
            if (isdefined(self.var_2a3d62043c219dc4)) {
                circle_debug(self.origin, sqrt(self.var_2a3d62043c219dc4), (1, 1, 0), 1, 1, 1);
            } else {
                circle_debug(self.origin, 16, (0, 1, 0), 1, 1, 1);
            }
            if (getdvarint(@"hash_17968e4611011cb")) {
                var_3e73ec41ba9920cb show();
                var_4b5eba8746581deb show();
            }
        }
        var_f17c1add186e75c0 = anglestoup(level.player getplayerangles(1)) * (collision_info.capsule_midpoint_height + collision_info.capsule_radius);
        var_a9f1cf48b968dbeb = anglestoup(level.player getplayerangles(1)) * (var_7935b319829b6b1b.capsule_midpoint_height + var_7935b319829b6b1b.capsule_radius);
        if (!physics_test("player_capsule_cast", level.player.origin + var_f17c1add186e75c0, var_3e73ec41ba9920cb gettagorigin(level.context_melee_player_link_bone) + var_a9f1cf48b968dbeb, self, "player capsule cast failed", collision_info, var_7935b319829b6b1b)) {
            return !collision_check_failed(anim_ent, var_3e73ec41ba9920cb, var_4b5eba8746581deb);
        }
        switch (level.context_melee_lastframe_type) {
        case #"hash_631e51a9f39e5622":
            if (!physics_test("player_eye", var_4b5eba8746581deb gettagorigin(level.context_melee_lastframe_bone), undefined, self, "end pos eye failed", collision_info)) {
                return !collision_check_failed(anim_ent, var_3e73ec41ba9920cb, var_4b5eba8746581deb);
            }
            break;
        case #"hash_476590e59e3ff6f4":
            break;
        }
    }
    anim_ent delete();
    var_3e73ec41ba9920cb delaycall(0.05, &delete);
    var_4b5eba8746581deb delaycall(0.05, &delete);
    return true;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x34cb
// Size: 0xf8
function collision_check_failed(anim_ent, var_3e73ec41ba9920cb, var_4b5eba8746581deb) {
    anim_ent delete();
    var_3e73ec41ba9920cb delaycall(0.05, &delete);
    var_4b5eba8746581deb delaycall(0.05, &delete);
    if (!isdefined(level.player.context_melee_blocked_hint_allowed) || level.player.context_melee_blocked_hint_allowed) {
        if (!getdvarint(@"hash_5eceb684ea4bca83")) {
            level.player.context_melee_hint_blocked = ter_op(isdefined(level.player.context_melee_hint_blocked_custom), level.player.context_melee_hint_blocked_custom, "context_melee_blocked");
            level.player thread display_hint_forced(level.player.context_melee_hint_blocked);
        } else {
            context_melee_cursor_hint_blocked();
        }
    }
    return true;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35cc
// Size: 0x4a
function get_melee_contents() {
    contents = ["physicscontents_clipshot", "physicscontents_itemclip", "physicscontents_characterproxy", "physicscontents_playernosight", "physicscontents_vehicle", "physicscontents_glass"];
    return physics_createcontents(contents);
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x361f
// Size: 0x4a
function get_melee_sight_contents() {
    contents = ["physicscontents_foliage", "physicscontents_clipshot", "physicscontents_itemclip", "physicscontents_characterproxy", "physicscontents_playernosight", "physicscontents_vehicle"];
    return physics_createcontents(contents);
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3672
// Size: 0x38
function function_1445e54b6c662c7() {
    contents = ["physicscontents_solid", "physicscontents_playerclip", "physicscontents_characterproxy", "physicscontents_glass"];
    return physics_createcontents(contents);
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x36b3
// Size: 0x464
function check_stealth_kill_visible(enemies) {
    self endon("death");
    level.player endon("death");
    level endon("stop_context_melee");
    if (!getdvarint(@"context_melee_silent")) {
        return false;
    }
    damage_sight_range = 600;
    if (isdefined(level.stealth) && isdefined(level.stealth.damage_sight_range)) {
        damage_sight_range = level.stealth.damage_sight_range;
    }
    proximity_combat_radius_bump = function_10f8498e5ac721ad();
    if (!isdefined(proximity_combat_radius_bump)) {
        proximity_combat_radius_bump = 100;
    }
    var_169e6322d96d0bcf = squared(damage_sight_range + 36);
    axis = getaiarrayinradius(level.player.origin, 2048, "axis");
    team3 = getaiarrayinradius(level.player.origin, 2048, "team3");
    enemies = array_combine(axis, team3);
    enemies = array_remove(enemies, self);
    enemies = array_removedead_or_dying(enemies);
    if (enemies.size < 1) {
        print3d_debug(self.origin, "only enemy alive, no silent check", (0, 1, 0), 1, 0.1, 1, "line2");
        return false;
    }
    enemies = sortbydistance(enemies, self.origin);
    foreach (enemy in enemies) {
        if (istrue(enemy.ignoreall)) {
            continue;
        }
        if (enemy context_melee_cansee()) {
            /#
                print3d_debug(enemy.origin, "<dev string:x4c>", (1, 0, 1), 1, 0.2, 1, "<dev string:x58>");
                print3d_debug(self.origin, "<dev string:x5e>" + enemy getentnum() + "<dev string:x72>" + "<dev string:x75>", (1, 0, 1), 1, 0.1, 1, "<dev string:x58>");
                line_debug(enemy geteye(), level.player geteye(), (1, 0, 1), 1, 0, 1);
            #/
            return true;
        }
        if (enemy context_melee_cansee(self) && distancesquared(enemy.origin, self.origin) < var_169e6322d96d0bcf) {
            /#
                print3d_debug(enemy.origin, "<dev string:x4c>", (1, 0, 0), 1, 0.2, 1, "<dev string:x58>");
                print3d_debug(self.origin, "<dev string:x5e>" + enemy getentnum() + "<dev string:x72>" + "<dev string:x84>" + distance(enemy.origin, self.origin), (1, 0, 0), 1, 0.1, 1, "<dev string:x58>");
                line_debug(enemy geteye(), self geteye(), (1, 0, 0), 1, 0, 1);
            #/
            return true;
        }
        if (distancesquared(enemy.origin, self.origin) < squared(100)) {
            if (physics_test("enemy_eye", self geteye(), enemy geteye(), enemy, "silent sight check failed!", undefined)) {
                /#
                    print3d_debug(enemy.origin, "<dev string:x4c>", (1, 0, 0), 1, 0.2, 1, "<dev string:x58>");
                    print3d_debug(self.origin, "<dev string:x5e>" + enemy getentnum() + "<dev string:x72>" + "<dev string:x91>" + distance(enemy.origin, self.origin), (1, 0, 0), 1, 0.1, 1, "<dev string:x58>");
                    line_debug(enemy geteye(), self geteye(), (1, 0, 0), 1, 0, 1);
                #/
            }
            return true;
        }
    }
    return false;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3b20
// Size: 0x8be
function do_context_melee(var_13365c1d4c5cd5f5, direction) {
    self notify("start_context_melee");
    originalorigin = level.player.origin;
    var_c97575f9be02f7f2 = level.player getstance();
    if (!isdefined(self)) {
        return;
    }
    if (!isalive(self)) {
        return;
    }
    if (isdefined(self.stealth) && !istrue(self.keepstealthoncontextmelee)) {
        ent_flag_clear("stealth_enabled");
    }
    self notify("end_patrol");
    anim_ent = spawn_tag_origin();
    anim_ent function_5cffe82f5e70231b(1);
    level.var_9665e8b8736ff0b7 = anim_ent;
    parent = self getlinkedparent();
    if (getdvarint(@"hash_3844d738b76e11e2")) {
        anim_ent thread anim_ent_debug();
    }
    anim_stopanimscripted();
    if (isdefined(self.context_melee_origin)) {
        anim_ent.origin = self.context_melee_origin;
    } else {
        anim_ent.origin = self.origin;
    }
    if (isdefined(self.context_melee_angles)) {
        anim_ent.angles = self.context_melee_angles;
    } else {
        set_scripted_node_angles(anim_ent, direction, level.context_melee_collision_offset);
        print_debug("^1Context Melee Kill from direction: " + direction);
    }
    anim_ent axis_debug((0, 1, 1), 1000, 10);
    print3d_debug(self.origin, "enemy melee pos: " + direction, (0, 1, 1), 1, 0.1, 1000);
    line_debug(level.player.origin, self.origin, (0, 1, 1), 1, 0, 1000);
    circle_debug(self.origin, 16, (0, 1, 1), 1, 1, 1000);
    level.player.in_melee_death = 1;
    self.context_melee_og_maxsightdistsqrd = self.maxsightdistsqrd;
    self.context_melee_og_newenemyreactiondistsq = self.newenemyreactiondistsq;
    self.context_melee_og_battlechatter = self.battlechatterallowed;
    self.context_melee_og_allowdeath = self.allowdeath;
    self.context_melee_og_animname = self.animname;
    self.in_melee_death = 1;
    self.allowantigrav = 0;
    self.dontmelee = 1;
    self.maxsightdistsqrd = 1;
    self.fixednode = 0;
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.newenemyreactiondistsq = 0;
    self.allowdeath = 0;
    self.a.disablepain = 1;
    self.allowpain = 0;
    self.battlechatterallowed = 0;
    self.animname = "generic";
    self.context_melee_anim = var_13365c1d4c5cd5f5;
    self.remove_from_animloop = 1;
    if (isdefined(self.script_stealthgroup) && !isdefined(self.context_melee_victim_lives)) {
        scripts\stealth\group::group_removefrompod(self);
    }
    if (!isdefined(self.context_melee_victim_lives)) {
        self setgoalpos(anim_ent.origin);
        self clearpath();
    }
    if (isdefined(self) && isalive(self) && !isdefined(self.delayeddeath) && !self.in_melee) {
        thread magic_bullet_shield();
    }
    if (isdefined(self) || isalive(self)) {
        level.player enableinvulnerability();
        level.player enablequickweaponswitch(1);
        anim_ent anim_first_frame_solo(level.player.melee_arms, var_13365c1d4c5cd5f5);
        waitframe();
        if (getdvarint(@"hash_3844d738b76e11e2")) {
            collision_info = level.player getcollision("stand");
            level.player.melee_arms thread tag_view_debug();
            print3d_debug(level.player.melee_arms gettagorigin(level.context_melee_player_link_bone), "melee anim start", (1, 0, 0), 1, 0.1, 1000);
            line_debug(level.player.melee_arms gettagorigin(level.context_melee_player_link_bone), level.player.melee_arms.origin + anglestoforward(level.player.melee_arms.angles) * 100, (1, 0, 0), 1, 0, 1000);
            circle_debug(level.player.melee_arms gettagorigin(level.context_melee_player_link_bone), collision_info.capsule_radius, (1, 0, 0), 1, 1, 1000);
            if (isdefined(self.context_melee_combat_buffer) && self.context_melee_combat_buffer > 0) {
                print_debug("combat counter was at: " + self.context_melee_combat_buffer + " of " + 12);
            }
        }
        knife = spawn("script_model", level.player.origin);
        if (isdefined(level.player.context_melee_knife)) {
            knife setmodel(level.player.context_melee_knife);
        } else {
            knife setmodel("weapon_vm_me_soscar_knife");
        }
        knife notsolid();
        knife linkto(level.player.melee_arms, "tag_accessory_right", (0, 0, 0), (0, 0, 0));
        if (!isdefined(self.context_melee_victim_lives)) {
            delaythread(5, &death_safety, self);
        }
        level.player notify("context_melee_anim_started");
        level.player prep_player_and_enemy(self, anim_ent, var_13365c1d4c5cd5f5);
        if (isdefined(parent)) {
            print_debug("linking");
            anim_ent linkto(parent);
        }
        self linkto(anim_ent);
        level.player.melee_arms linkto(anim_ent);
        level.player lerpfovscalefactor(0, 0.25);
        var_337e38412a58641a = getanimlength(getanim(var_13365c1d4c5cd5f5));
        var_4120f65e56b5e799 = getanimlength(level.player.melee_arms getanim(var_13365c1d4c5cd5f5));
        if (var_337e38412a58641a > var_4120f65e56b5e799) {
            level.player thread notify_delay("context_melee_longest_anim_ended", var_337e38412a58641a);
            level delaythread(var_337e38412a58641a, &function_63f4a98a99979090, anim_ent);
        } else {
            level.player thread notify_delay("context_melee_longest_anim_ended", var_4120f65e56b5e799);
            level delaythread(var_4120f65e56b5e799, &function_63f4a98a99979090, anim_ent);
        }
        thread notify_delay("context_melee_anim_ended_internal", var_337e38412a58641a);
        level.player thread notify_delay("context_melee_anim_ended", var_4120f65e56b5e799);
        var_ac6d99d19393f2d3 = 0.5;
        level.player delaycall(var_4120f65e56b5e799 - var_ac6d99d19393f2d3, &lerpfovscalefactor, 1, var_ac6d99d19393f2d3);
        self notify("damage", 0, level.player, undefined, undefined, "MOD_MELEE");
        thread enemy_end_death_logic(var_13365c1d4c5cd5f5, parent);
        level.player thread player_end_death_logic(knife, anim_ent, originalorigin, var_c97575f9be02f7f2, direction);
        anim_ent thread anim_single([self, level.player.melee_arms], var_13365c1d4c5cd5f5);
        /#
            thread function_cece193e35d131fb();
        #/
        delaycall(0.05, &function_5e69fa9cfa2546ec, 15, 18, 37, function_1445e54b6c662c7(), [level.player, level.player.melee_arms], 1);
        level.player.melee_arms delaycall(0.05, &function_5e69fa9cfa2546ec, 15, 18, 37, function_1445e54b6c662c7(), [level.player, self], 1);
    }
    level.player waittill("context_melee_longest_anim_ended");
    print_debug("longest melee anim finished");
}

/#

    // Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x43e6
    // Size: 0x3d
    function function_cece193e35d131fb() {
        self endon("<dev string:xb5>");
        self endon("<dev string:xbb>");
        level endon("<dev string:xdd>");
        self waittill("<dev string:xf0>");
        assertmsg("<dev string:x101>" + self getentitynumber() + "<dev string:x126>");
    }

#/

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x442b
// Size: 0x2f
function anim_ent_debug() {
    self endon("death");
    for (;;) {
        sphere_debug(self.origin, 4, (1, 1, 1), 0, 1);
        waitframe();
    }
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4462
// Size: 0x1d7
function context_melee_launch(direction, anim_ent) {
    level.player endon("death");
    print_debug("launching!");
    level.player.context_melee_launching = 1;
    level.player enableweapons();
    if (!level.player hasweapon("iw8_gunless_farrah")) {
        level.player giveweapon("iw8_gunless_farrah");
    }
    level.player switchtoweaponimmediate("iw8_gunless_farrah");
    earthquake(1, 0.3, level.player.origin, 75);
    level.player playrumbleonentity("heavy_1s");
    level.player thread scripts\sp\player::radial_distortion(0.05, 0.2, 0.25);
    visionsetpain("damage_severe");
    setsaveddvar(@"hash_b61c9c6a24b5671e", 0);
    setsaveddvar(@"hash_e42b132626b5992b", 1.9);
    level.player painvisionon();
    level.player delaycall(0.2, &painvisionoff);
    waitframe();
    level.player unlink();
    level.player thread launch_push_player2();
    og_zplanes = getdvar(@"hash_5025653b60878a96");
    setsaveddvar(@"hash_5025653b60878a96", "0.1 400 2 1000");
    level.player player_gesture_force("ges_htf_stab_a");
    wait level.player getgestureanimlength("ges_htf_stab_a");
    setsaveddvar(@"hash_5025653b60878a96", og_zplanes);
    level.player.context_melee_launching = undefined;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4641
// Size: 0x18e
function launch_push_player() {
    fwd = vectornormalize(anglestoforward(level.player.angles));
    reverse = fwd * -1;
    for (i = 0; i < 6; i++) {
        level.player pushplayervector(reverse);
        waitframe();
        reverse *= 1.7;
    }
    wait 0.8;
    reverse *= -0.6;
    while (true) {
        reverse *= 0.75;
        if (vectordot(reverse, fwd) < 0.5) {
            level.player pushplayervector((0, 0, 0));
            waitframe();
            break;
        } else {
            level.player pushplayervector(reverse);
        }
        waitframe();
    }
    print_debug("launching finished t:" + gettime());
    if (getdvarint(@"hash_3844d738b76e11e2")) {
        collision_info = level.player getcollision("stand");
        print3d_debug(level.player.origin + (0, 0, -2), "slide end", (1, 1, 0), 1, 0.1, 1000);
        circle_debug(level.player.origin, collision_info.capsule_radius, (1, 1, 0), 1, 1, 1000);
    }
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47d7
// Size: 0x3e
function launch_push_player2() {
    reverse = vectornormalize(anglestoforward(level.player.angles)) * -500;
    level.player setvelocity(reverse);
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x481d
// Size: 0x15c
function set_scripted_node_angles(scripted_node, direction, offset) {
    if (!isdefined(offset)) {
        offset = (0, 0, 0);
    }
    switch (direction) {
    case #"hash_4b8799075d3a89b8":
        scripted_node.angles = vectortoangles(level.player.origin - self.origin) + offset;
        break;
    case #"hash_c9b3133a17a3b2d0":
        scripted_node.angles = vectortoangles(level.player.origin - self.origin) + (0, -90, 0) + offset;
        break;
    case #"hash_96815ce4f2a3dbc5":
        scripted_node.angles = vectortoangles(level.player.origin - self.origin) + (0, 90, 0) + offset;
        break;
    case #"hash_5163a22eb8c03302":
        scripted_node.angles = vectortoangles(self.origin - level.player.origin) + offset;
        break;
    default:
        break;
    }
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4981
// Size: 0x12c
function enemy_end_death_logic(var_13365c1d4c5cd5f5, parent) {
    self endon("death");
    level endon("stop_context_melee");
    self waittill("context_melee_anim_ended_internal");
    if (!isdefined(self.context_melee_victim_lives)) {
        context_melee_death(self);
        context_melee_ragdoll(self);
    } else {
        self.in_melee_death = 0;
        self.allowantigrav = 1;
        self.dontmelee = 0;
        self.maxsightdistsqrd = self.context_melee_og_maxsightdistsqrd;
        self.fixednode = 0;
        self.ignoreme = 0;
        self.ignoreall = 0;
        self.newenemyreactiondistsq = self.context_melee_og_newenemyreactiondistsq;
        self.a.disablepain = 0;
        self.battlechatterallowed = self.context_melee_og_battlechatter;
        self.context_melee_anim = var_13365c1d4c5cd5f5;
        self.remove_from_animloop = undefined;
        self.allowdeath = self.context_melee_og_allowdeath;
        self.animname = self.context_melee_og_animname;
        self.context_melee_last_melee_finish_time = gettime();
        if (isdefined(parent)) {
            self linkto(parent);
        }
    }
    self notify("context_melee_anim_ended");
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x4ab5
// Size: 0x1a4
function player_end_death_logic(knife, anim_ent, originalorigin, var_c97575f9be02f7f2, direction) {
    level.player endon("death");
    level.player waittill("context_melee_anim_ended");
    knife delete();
    level.player.melee_arms hide();
    if (getdvarint(@"hash_3844d738b76e11e2")) {
        collision_info = level.player getcollision("stand");
        print3d_debug(level.player.origin + (0, 0, -2), "melee anim end", (1, 1, 0), 1, 0.1, 1000);
        circle_debug(level.player.origin, collision_info.capsule_radius, (1, 1, 0), 1, 1, 1000);
    }
    level.player release_player_from_viewmodel_anim(originalorigin, var_c97575f9be02f7f2, direction, anim_ent);
    level.player disableinvulnerability();
    level.player enablequickweaponswitch(0);
    level.player.melee_arms hide();
    level.player.context_melee_next = get_next_anim(level.player.context_melee_next);
    level.player.in_melee_death = 0;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c61
// Size: 0x12
function function_63f4a98a99979090(anim_ent) {
    anim_ent delete();
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c7b
// Size: 0x70
function tag_view_debug() {
    self endon("death");
    level endon("tag_view_debug_end");
    if (getdvarint(@"hash_17968e4611011cb")) {
        while (true) {
            arrow_debug(self gettagorigin("tag_view"), self gettagorigin("tag_view") + anglestoforward(self gettagangles("tag_view")) * 10, (0.25, 0.25, 1), 1000);
            wait 0.1;
        }
    }
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4cf3
// Size: 0x1e3
function prep_player_and_enemy(enemy, scripted_node, anime) {
    prepare_player_for_viewmodel_anim();
    var_dd1ea1cf5e2054b1 = getstartangles(scripted_node.origin, scripted_node.angles, enemy getanim(anime));
    line_debug(enemy.origin, enemy.origin + anglestoforward(enemy.angles) * 36, (0, 1, 0), 1, 0, 1000);
    line_debug(enemy.origin, enemy.origin + anglestoforward(var_dd1ea1cf5e2054b1) * 36, (1, 0, 1), 1, 0, 1000);
    thread axis_debug((0, 1, 0), 1000, 10);
    print3d_debug(self.origin, "pre melee pos", (0, 1, 0), 1, 0.1, 1000);
    line_debug(self.origin, self.origin + anglestoforward(self getplayerangles(1)) * 100, (0, 1, 0), 1, 0, 1000);
    blend_time = 0.2;
    self playerlinktoblend(self.melee_arms, level.context_melee_player_link_bone, blend_time, 0.05, 0.1);
    rot_ent = enemy spawn_tag_origin();
    enemy linktoblendtotag(rot_ent, "tag_origin");
    rot_ent rotateto(var_dd1ea1cf5e2054b1, blend_time, 0.1);
    wait blend_time;
    self playerlinktoabsolute(self.melee_arms, level.context_melee_player_link_bone);
    rot_ent delete();
    self.melee_arms show();
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ede
// Size: 0x163
function context_melee_death(guy) {
    if (!isdefined(guy)) {
        return;
    }
    if (!isalive(guy)) {
        return;
    }
    guy.skipdeathanim = 1;
    guy.noragdoll = 1;
    guy pushplayer(0);
    guy namespace_223959d3e5206cfb::dropallaiweapons();
    if (isdefined(self.var_1bab8712529eb3c2) && isdefined(self.fnstealthflashlightdetach) && self.var_1bab8712529eb3c2) {
        self [[ self.fnstealthflashlightdetach ]]();
    }
    guy.allowdeath = 1;
    guy.diequietly = 1;
    if (isdefined(guy.magic_bullet_shield)) {
        guy stop_magic_bullet_shield();
    }
    if (isdefined(guy.damageshield)) {
        guy.damageshield = 0;
    }
    if (isdefined(guy.stealth) && !istrue(level.stealth.var_8d8a17b5c4438254)) {
        guy.stealth.override_damage_auto_range = 60;
    }
    guy kill((0, 0, 0), level.player, level.player, "MOD_MELEE");
    if (!istrue(guy.context_melee_ragdoll)) {
        level.player.context_melee_kill_origin = guy.origin;
    }
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5049
// Size: 0x7c
function context_melee_fx(guy) {
    if (isdefined(guy) && isdefined(guy.context_melee_anim)) {
        switch (guy.context_melee_anim) {
        case #"hash_6a41f28989761340":
            playfxontag(getfx("vfx_contextmelee_stab"), guy, "j_neck");
            break;
        default:
            playfxontag(getfx("vfx_contextmelee_stab"), guy, "j_neck");
            break;
        }
    }
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x50cd
// Size: 0xb
function context_melee_sfx(guy) {
    
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x50e0
// Size: 0x126
function context_melee_ragdoll(guy) {
    if (!isdefined(guy) && isdefined(level.player.context_melee_kill_origin)) {
        foreach (corpse in getcorpsearray()) {
            if (istrue(corpse.context_melee_ragdoll)) {
                continue;
            }
            if (corpse isragdoll()) {
                continue;
            }
            corpseorigin = corpse get_corpse_origin();
            if (isdefined(corpseorigin) && distancesquared(corpseorigin, level.player.context_melee_kill_origin) < squared(60)) {
                corpse startragdoll();
                corpse.context_melee_ragdoll = 1;
            }
        }
    } else if (isdefined(guy) && !istrue(guy.context_melee_ragdoll)) {
        guy thread namespace_223959d3e5206cfb::dropallaiweapons();
        guy startragdoll();
        guy.context_melee_ragdoll = 1;
    }
    level.player.context_melee_kill_origin = undefined;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x520e
// Size: 0x1f
function context_melee_rumble_light(guy) {
    level.player playrumbleonentity("damage_light");
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5235
// Size: 0x1f
function context_melee_rumble_heavy(guy) {
    level.player playrumbleonentity("heavy_1s");
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x525c
// Size: 0x3e
function death_safety(guy) {
    if (isdefined(guy)) {
        if (isalive(guy)) {
            if (isdefined(guy.magic_bullet_shield)) {
                guy stop_magic_bullet_shield();
            }
            println("<dev string:x157>");
        }
    }
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x52a2
// Size: 0x420
function check_player_can_stealth_kill_me(animation, direction) {
    level endon("stop_context_melee");
    if (isdefined(self.context_melee_allow_directions)) {
        if (!array_contains(self.context_melee_allow_directions, direction)) {
            print3d_debug(self.origin, "no melee!, direction " + direction + " not allowed!", (1, 0, 0), 1, 0.1, 1, "line5");
            return false;
        }
    }
    if (!isdefined(animation)) {
        print3d_debug(self.origin, "no melee!, target but no animation", (1, 0, 0), 1, 0.1, 1, "line5");
        return false;
    }
    if (!isdefined(level.scr_anim["generic"][animation])) {
        print3d_debug(self.origin, "no melee!, target but no generic animation", (1, 0, 0), 1, 0.1, 1, "line5");
        return false;
    }
    if (self.currentpose != "stand" && self.currentpose != "crouch") {
        print3d_debug(self.origin, "no melee!, AI is crouching or moving", (1, 0, 0), 1, 0.1, 1, "line5");
        return false;
    }
    if (self.in_melee) {
        if (self.var_8da037cbe81e4f8f) {
            println("<dev string:x1a7>");
            print3d_debug(self.origin, "no melee!, target is already meleeing player!", (1, 0, 0), 1, 0.1, 1, "line5");
            return false;
        }
    }
    diff = abs(self.origin[2] - level.player.origin[2]);
    if (diff >= getdvarint(@"hash_57c7e30c0dbba2fe")) {
        println("<dev string:x1e1>" + diff + "<dev string:x20d>");
        print3d_debug(self.origin, "no melee! height difference is " + diff + " units", (1, 0, 0), 1, 0.1, 1, "line5");
        return false;
    }
    if (level.player isjumping()) {
        print3d_debug(self.origin, "no melee!, player is jumping", (1, 0, 0), 1, 0.1, 1, "line5");
        return false;
    }
    if (!anim_collision_check(animation, direction)) {
        if (!isdefined(level.context_melee_fail_attempts)) {
            level.context_melee_fail_attempts = 0;
        }
        offsets = [5, -5, 15, -15, 30, -30, 45, -45];
        if (level.context_melee_fail_attempts < offsets.size) {
            level.context_melee_collision_offset = (0, offsets[level.context_melee_fail_attempts], 0);
            if (!anim_collision_check(animation, direction, level.context_melee_collision_offset)) {
                level.context_melee_fail_attempts += 1;
                print3d_debug(self.origin, "collision extra fail attempts: " + level.context_melee_fail_attempts, (1, 0, 0), 1, 0.1, 1, "line3");
                return false;
            } else {
                print3d_debug(self.origin, "collision extra success offset: " + level.context_melee_collision_offset, (0, 1, 1), 1, 0.1, 1, "line3");
            }
        } else {
            level.context_melee_fail_attempts = undefined;
            level.context_melee_collision_offset = undefined;
            return false;
        }
    } else {
        level.context_melee_fail_attempts = undefined;
        level.context_melee_collision_offset = undefined;
    }
    if (getdvarint(@"context_melee_silent")) {
        if (check_stealth_kill_visible()) {
            return false;
        }
    }
    print3d_debug(self.origin, "IS stealth melee target with anime: " + animation, (0, 1, 0), 1, 0.1, 1, "line5");
    return true;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x56cb
// Size: 0x2c5
function player_stealth_kill_direction() {
    tagangles = self gettagangles("tag_origin");
    tagpos = self gettagorigin("tag_origin");
    tagright = anglestoright(tagangles);
    tagfwd = anglestoforward(tagangles);
    var_2353ca8656f77e04 = level.player.origin - tagpos;
    var_2353ca8656f77e04 = (var_2353ca8656f77e04[0], var_2353ca8656f77e04[1], 0);
    var_2353ca8656f77e04 = vectornormalize(var_2353ca8656f77e04);
    dotup = abs(vectordot(tagfwd, (0, 0, 1)));
    if (dotup > 0.7) {
        tagfwd = vectornormalize((tagright[0], tagright[1], 0));
    } else {
        tagfwd = vectornormalize((tagfwd[0], tagfwd[1], 0));
    }
    entfwd = anglestoforward(self.angles);
    if (vectordot(var_2353ca8656f77e04, entfwd) > vectordot(tagfwd, entfwd)) {
        tagfwd = entfwd;
    }
    tagright = vectorcross(tagfwd, (0, 0, 1));
    dot = vectordot(tagfwd, var_2353ca8656f77e04);
    dotright = vectordot(tagright, var_2353ca8656f77e04);
    if (isdefined(self.context_melee_back_dot_override)) {
        back_dot = self.context_melee_back_dot_override;
    } else {
        back_dot = -0.5;
    }
    if (dot < back_dot) {
        print3d_debug(self.origin, "direction: back dot: " + dot + " threat: " + self getthreatsight(level.player), (0, 1, 0), 1, 0.1, 1, "line4");
        return "back";
    } else if (dot > 0.6) {
        print3d_debug(self.origin, "direction: front dot: " + dot + " threat: " + self getthreatsight(level.player), (0, 1, 0), 1, 0.1, 1, "line4");
        return "front";
    } else if (dotright > 0) {
        print3d_debug(self.origin, "direction: right dot: " + dot + " threat: " + self getthreatsight(level.player), (0, 1, 0), 1, 0.1, 1, "line4");
        return "right";
    } else {
        print3d_debug(self.origin, "direction: left dot: " + dot + " threat: " + self getthreatsight(level.player), (0, 1, 0), 1, 0.1, 1, "line4");
        return "left";
    }
    return undefined;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5999
// Size: 0x149
function get_next_anim(startindex, var_72b3bda55829e13c) {
    animindex = startindex;
    /#
        if (getdvarint(@"hash_a1d6a71952d729b2", -1) > 0) {
            animindex = getdvarint(@"hash_3be6c97f9fc0d8eb", -1);
        }
    #/
    while (true) {
        var_b85c143ec43ecd14 = "context_melee_kill_0" + animindex + "_";
        if (isdefined(var_72b3bda55829e13c)) {
            if (isdefined(level.scr_anim["generic"][var_b85c143ec43ecd14 + var_72b3bda55829e13c])) {
                return (var_b85c143ec43ecd14 + var_72b3bda55829e13c);
            }
        }
        animindex++;
        var_b85c143ec43ecd14 = "context_melee_kill_0" + animindex + "_";
        if (!isdefined(level.scr_anim["generic"][var_b85c143ec43ecd14 + "back"]) && !isdefined(level.scr_anim["generic"][var_b85c143ec43ecd14 + "front"]) && !isdefined(level.scr_anim["generic"][var_b85c143ec43ecd14 + "left"]) && !isdefined(level.scr_anim["generic"][var_b85c143ec43ecd14 + "right"])) {
            animindex = 1;
        }
        /#
            if (getdvarint(@"hash_3be6c97f9fc0d8eb", -1) > 0) {
                return getdvarint(@"hash_3be6c97f9fc0d8eb", -1);
            }
        #/
        if (!isdefined(var_72b3bda55829e13c)) {
            return animindex;
        }
        if (animindex == startindex) {
            break;
        }
    }
    return undefined;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5aeb
// Size: 0xb6
function get_anim_from_direction(direction) {
    if (!isdefined(level.player.context_melee_next)) {
        level.player.context_melee_next = 1;
    }
    var_13365c1d4c5cd5f5 = undefined;
    if (isdefined(self.context_melee_anim_name)) {
        if (isdefined(self.context_melee_anim_name[direction])) {
            var_13365c1d4c5cd5f5 = self.context_melee_anim_name[direction];
        } else if (isdefined(self.context_melee_anim_name["all"])) {
            var_13365c1d4c5cd5f5 = self.context_melee_anim_name["all"];
        }
    }
    if (!isdefined(var_13365c1d4c5cd5f5)) {
        var_13365c1d4c5cd5f5 = get_next_anim(level.player.context_melee_next, direction);
    }
    return var_13365c1d4c5cd5f5;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5baa
// Size: 0xb2
function prepare_player_for_viewmodel_anim() {
    nvidiaansel_scriptdisable(1);
    level.player setstance("stand", 0, 1, 1);
    level.player thread freeze_controls_when_standing();
    level.player freezelookcontrols(1);
    level.player val::set("viewmodel_anim", "weapon", 0);
    level.player val::set("viewmodel_anim", "melee", 0);
    level.player val::set("viewmodel_anim", "prone", 0);
    level.player val::set("viewmodel_anim", "crouch", 0);
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c64
// Size: 0x2c
function freeze_controls_when_standing() {
    self endon("death");
    level endon("stop_context_melee");
    while (self getstance() != "stand") {
        waitframe();
    }
    self freezecontrols(1);
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5c98
// Size: 0x9e
function release_player_from_viewmodel_anim(originalorigin, var_c97575f9be02f7f2, direction, anim_ent) {
    if (istrue(level.context_melee_do_launch)) {
        level.player context_melee_launch(direction, anim_ent);
    }
    level.player unlink();
    level.player freezecontrols(0);
    level.player freezelookcontrols(0);
    level.player val::reset_all("viewmodel_anim");
    level.player setstance(var_c97575f9be02f7f2);
    nvidiaansel_scriptdisable(0);
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d3e
// Size: 0x18
function context_melee_sfx_player(player) {
    player play_sound_safe("context_melee_kill_02_back");
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d5e
// Size: 0x13
function function_b310b0376dba9fb0() {
    if (istrue(self.var_74bf697864c23ef8)) {
        return false;
    }
    return true;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d7a
// Size: 0x74
function context_melee_cansee(thing) {
    if (level.context_melee_sight_disabled) {
        return false;
    }
    if (!isdefined(thing)) {
        thing = level.player;
    }
    print_debug("CanSee: " + self cansee(thing));
    print_debug("AIPointInFOV: " + self aipointinfov(thing geteye()));
    if (self aipointinfov(thing geteye()) && self cansee(thing)) {
        return true;
    }
    return false;
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5df7
// Size: 0x26
function print_debug(text) {
    /#
        if (getdvarint(@"hash_3844d738b76e11e2")) {
            iprintln(text);
        }
    #/
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x5e25
// Size: 0x19c
function print3d_debug(origin, text, color, alpha, scale, duration, offset) {
    if (!isdefined(offset)) {
        offset = "nothing";
    }
    collision_info = level.player getcollision(level.player getstance());
    switch (offset) {
    case #"hash_637736d2cc79a66a":
        offset = (0, 0, 0);
        break;
    case #"hash_984692889a47282":
        offset = (0, 0, 8) + (0, 0, collision_info.capsule_midpoint_height);
        break;
    case #"hash_984682889a470ef":
        offset = (0, 0, 6) + (0, 0, collision_info.capsule_midpoint_height);
        break;
    case #"hash_984672889a46f5c":
        offset = (0, 0, 4) + (0, 0, collision_info.capsule_midpoint_height);
        break;
    case #"hash_984662889a46dc9":
        offset = (0, 0, 2) + (0, 0, collision_info.capsule_midpoint_height);
        break;
    case #"hash_984652889a46c36":
        offset = (0, 0, 0) + (0, 0, collision_info.capsule_midpoint_height);
        break;
    }
    if (getdvarint(@"hash_3844d738b76e11e2")) {
        /#
            print3d(origin + offset, text, color, alpha, scale, duration, 1);
        #/
    }
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5fc9
// Size: 0x53
function line_debug(start, end, color, alpha, depthtest, duration) {
    /#
        if (getdvarint(@"hash_3844d738b76e11e2")) {
            line(start, end, color, alpha, depthtest, duration);
        }
    #/
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x6024
// Size: 0x4a
function sphere_debug(origin, radius, color, depthtest, duration) {
    /#
        if (getdvarint(@"hash_3844d738b76e11e2")) {
            sphere(origin, radius, color, depthtest, duration);
        }
    #/
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6076
// Size: 0x39
function axis_debug(color, duration, size) {
    /#
        if (getdvarint(@"hash_3844d738b76e11e2")) {
            draw_ent_axis(color, duration, size);
        }
    #/
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x60b7
// Size: 0x54
function circle_debug(center, radius, color, alpha, depthtest, duration) {
    /#
        if (getdvarint(@"hash_3844d738b76e11e2")) {
            draw_circle(center, radius, color, alpha, depthtest, duration);
        }
    #/
}

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x6113
// Size: 0x5e
function capsule_debug(pos, radius, height, angles, color, depthtest, duration) {
    /#
        if (getdvarint(@"hash_3844d738b76e11e2")) {
            draw_capsule(pos, radius, height, angles, color, depthtest, duration);
        }
    #/
}

/#

    // Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x6179
    // Size: 0x4b
    function angles_debug(angles, origin, origin_color, duration, scale) {
        if (getdvarint(@"hash_3844d738b76e11e2")) {
            draw_angles(angles, origin, origin_color, duration, scale);
        }
    }

    // Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x61cc
    // Size: 0x4b
    function box_debug(angles, origin, origin_color, duration, scale) {
        if (getdvarint(@"hash_3844d738b76e11e2")) {
            draw_angles(angles, origin, origin_color, duration, scale);
        }
    }

#/

// Namespace namespace_f6828b146488825b / scripts\sp\player\context_melee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x621f
// Size: 0x88
function arrow_debug(start, end, color, duration) {
    /#
        if (getdvarint(@"hash_3844d738b76e11e2")) {
            angles = vectortoangles(start - end);
            forward = anglestoforward(angles);
            line_debug(start, end, color, 1, 0, duration);
            line_debug(start, start + forward * 1, (1, 0, 0), 1, 0, duration);
        }
    #/
}

