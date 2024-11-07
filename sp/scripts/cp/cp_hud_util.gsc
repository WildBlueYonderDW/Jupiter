#using scripts\cp\utility.gsc;
#using script_afb7e332aee4bf2;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp\cp_hud_message.gsc;

#namespace namespace_d2d25ee15dd5f89d;

// Namespace namespace_d2d25ee15dd5f89d / scripts\cp\cp_hud_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x240
// Size: 0x1c
function mt_getprogress(refstring) {
    return self getplayerdata("cp", "meritProgress", refstring);
}

// Namespace namespace_d2d25ee15dd5f89d / scripts\cp\cp_hud_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x265
// Size: 0x1c
function mt_getstate(refstring) {
    return self getplayerdata("cp", "meritState", refstring);
}

// Namespace namespace_d2d25ee15dd5f89d / scripts\cp\cp_hud_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x28a
// Size: 0x81
function mt_setprogress(refstring, value) {
    if (refstring == "mt_highest_round") {
        currentstate = mt_getstate("mt_highest_round");
        currenttarget = mt_gettarget("mt_highest_round", currentstate);
        if (level.wave_num >= currenttarget) {
            return self setplayerdata("cp", "meritProgress", refstring, currenttarget);
        }
        return;
    }
    return self setplayerdata("cp", "meritProgress", refstring, value);
}

// Namespace namespace_d2d25ee15dd5f89d / scripts\cp\cp_hud_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x313
// Size: 0x25
function mt_setstate(refstring, value) {
    return self setplayerdata("cp", "meritState", refstring, value);
}

// Namespace namespace_d2d25ee15dd5f89d / scripts\cp\cp_hud_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x341
// Size: 0x2b
function mt_gettarget(refstring, state) {
    return int(tablelookup("cp/allMeritsTable.csv", 0, refstring, 10 + state * 3));
}

// Namespace namespace_d2d25ee15dd5f89d / scripts\cp\cp_hud_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x375
// Size: 0x2c
function player_damage_blood() {
    self endon("disconnect");
    level endon("game_ended");
    self endon("death");
    self setclientomnvar("ui_damage_event", self.damageeventcount);
}

// Namespace namespace_d2d25ee15dd5f89d / scripts\cp\cp_hud_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a9
// Size: 0xee
function zom_player_health_overlay_watcher() {
    self endon("disconnect");
    level endon("game_ended");
    self endon("death");
    low_health = 0;
    var_c1163af12016e3a0 = 1;
    while (true) {
        if (self.health <= 45 && low_health == 0) {
            if (!self issplitscreenplayer()) {
                self setclienttriggeraudiozonepartialwithfade("painvision", 0.02, "mix", "reverb", "filter");
                self stoplocalsound("deaths_door_out");
                self playlocalsound("deaths_door_in");
            }
            low_health = 1;
        }
        if (low_health && var_c1163af12016e3a0) {
            if (namespace_d4aab8c9cb8ecb14::player_in_laststand(self)) {
            }
            var_c1163af12016e3a0 = 0;
        }
        if (low_health && self.health > 45) {
            self clearclienttriggeraudiozone(0.3);
            self playlocalsound("deaths_door_out");
            self stoplocalsound("deaths_door_in");
            low_health = 0;
            var_c1163af12016e3a0 = 1;
        }
        wait 0.05;
    }
}

// Namespace namespace_d2d25ee15dd5f89d / scripts\cp\cp_hud_util
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x49f
// Size: 0xcf
function teamplayercardsplash(splash, owner, team, optionalnumber, var_b7abc0284e13ca7a) {
    if (scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
        return;
    }
    var_b7abc0284e13ca7a = istrue(var_b7abc0284e13ca7a);
    foreach (player in level.players) {
        if (!isplayer(player)) {
            continue;
        }
        if (isdefined(team) && player.team != team) {
            continue;
        }
        if (var_b7abc0284e13ca7a && isplayer(owner) && player == owner) {
            continue;
        }
        player thread scripts\cp\cp_hud_message::showsplash(splash, optionalnumber, owner);
    }
}

// Namespace namespace_d2d25ee15dd5f89d / scripts\cp\cp_hud_util
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x576
// Size: 0x9f
function add_hint_string(name, string, var_4c4ab07dfd5327ff) {
    if (!isdefined(level.trigger_hint_string)) {
        level.trigger_hint_string = [];
        level.trigger_hint_func = [];
    }
    assertex(isdefined(name), "Set a name for the hint string. This should be the same as the script_hint on the trigger_hint.");
    assertex(isdefined(string), "Set a string for the hint string. This is the string you want to appear when the trigger is hit.");
    assertex(!isdefined(level.trigger_hint_string[name]), "Tried to redefine hint " + name);
    level.trigger_hint_string[name] = string;
    precachestring(string);
    if (isdefined(var_4c4ab07dfd5327ff)) {
        level.trigger_hint_func[name] = var_4c4ab07dfd5327ff;
    }
}

// Namespace namespace_d2d25ee15dd5f89d / scripts\cp\cp_hud_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x61d
// Size: 0x4f
function fade_over_time(var_6b214c71049955e7, fade_time) {
    assertex(isdefined(var_6b214c71049955e7), "fade_over_time must be passed a target_alpha.");
    if (isdefined(fade_time) && fade_time > 0) {
        self fadeovertime(fade_time);
    }
    self.alpha = var_6b214c71049955e7;
    if (isdefined(fade_time) && fade_time > 0) {
        wait fade_time;
    }
}

// Namespace namespace_d2d25ee15dd5f89d / scripts\cp\cp_hud_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x674
// Size: 0x61
function fade_in(time, shader) {
    if (level.missionfailed) {
        return;
    }
    if (!isdefined(time)) {
        time = 0.3;
    }
    overlay = get_optional_overlay(shader);
    if (time > 0) {
        overlay fadeovertime(time);
    }
    overlay.alpha = 0;
    if (time > 0) {
        wait time;
    }
}

// Namespace namespace_d2d25ee15dd5f89d / scripts\cp\cp_hud_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6dd
// Size: 0x1e
function get_optional_overlay(shader) {
    if (!isdefined(shader)) {
        shader = "black";
    }
    return get_overlay(shader);
}

// Namespace namespace_d2d25ee15dd5f89d / scripts\cp\cp_hud_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x704
// Size: 0xb2
function get_overlay(shader) {
    if (isplayer(self)) {
        guy = self;
    } else {
        guy = level.player;
    }
    if (!isdefined(guy.overlay)) {
        guy.overlay = [];
    }
    if (!isdefined(guy.overlay[shader])) {
        guy.overlay[shader] = create_client_overlay(shader, 0, guy);
    }
    guy.overlay[shader].sort = 0;
    guy.overlay[shader].foreground = 1;
    return guy.overlay[shader];
}

// Namespace namespace_d2d25ee15dd5f89d / scripts\cp\cp_hud_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7bf
// Size: 0x55
function fade_out(time, shader) {
    if (!isdefined(time)) {
        time = 0.3;
    }
    overlay = get_optional_overlay(shader);
    if (time > 0) {
        overlay fadeovertime(time);
    }
    overlay.alpha = 1;
    if (time > 0) {
        wait time;
    }
}

