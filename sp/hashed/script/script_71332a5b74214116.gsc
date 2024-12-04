#using script_3bcaa2cbaf54abdd;
#using script_74502a9e0ef1f19c;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp\coop_personal_ents;
#using scripts\cp\perks\cp_prestige;
#using scripts\cp\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace interaction;

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x106f
// Size: 0xb
function coop_interaction_pregame() {
    level thread assign_trigger_on_player_spawned();
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1082
// Size: 0x574
function init() {
    if (!isdefined(level.interactions)) {
        level.interactions = [];
    }
    if (!isdefined(level.interaction_hintstrings)) {
        level.interaction_hintstrings = [];
    }
    if (!isdefined(level.interaction_id)) {
        level.interaction_id = 0;
    }
    flag_init("init_interaction_done");
    level thread assign_trigger_on_player_spawned();
    flag_wait("strike_init_done");
    if (!isdefined(level.current_interaction_structs)) {
        level.current_interaction_structs = [];
    }
    level.weapon_hint_func = &default_weapon_hint_func;
    level thread interaction_sound_monitor();
    if (isdefined(level.gametype_interaction_func)) {
        [[ level.gametype_interaction_func ]]();
    }
    if (isdefined(level.deployable_box_interaction)) {
        [[ level.deployable_box_interaction ]]();
    }
    if (isdefined(level.map_interaction_func)) {
        [[ level.map_interaction_func ]]();
    }
    if (isdefined(level.weapon_upgrade_interaction)) {
        [[ level.weapon_upgrade_interaction ]]();
    }
    if (isdefined(level.init_personal_ent_zones)) {
        level [[ level.init_personal_ent_zones ]]();
    }
    foreach (interaction_struct in level.current_interaction_structs) {
        interaction_struct.in_array = 1;
        if (!isdefined(interaction_struct.angles)) {
            interaction_struct.angles = (0, 0, 0);
        }
        interaction_struct.targetmodels = [];
        if (!isdefined(interaction_struct.script_parameters)) {
            interaction_struct.script_parameters = "default";
        }
        if (interaction_struct.script_parameters == "requires_power") {
            interaction_struct.requires_power = 1;
            interaction_struct.powered_on = 0;
            interaction_struct.power_area = get_area_for_power(interaction_struct);
        } else {
            interaction_struct.requires_power = 0;
            interaction_struct.powered_on = 0;
        }
        if (isdefined(level.interactions[interaction_struct.script_noteworthy]) && istrue(level.interactions[interaction_struct.script_noteworthy].is_p_ent)) {
            scripts\cp\coop_personal_ents::addtopersonalinteractionlist(interaction_struct);
        }
    }
    if (getdvarint(@"hash_ca862f7c198bc459", 0) == 0) {
        level thread drop_interaction_structs_to_ground();
    }
    keys = getarraykeys(level.interactions);
    for (i = 0; i < keys.size; i++) {
        if (isdefined(level.interactions[keys[i]].init_func)) {
            structarray = getstructarray(keys[i], "script_noteworthy");
            level thread [[ level.interactions[keys[i]].init_func ]](structarray);
        }
    }
    foreach (interaction_struct in level.current_interaction_structs) {
        if (isdefined(level.interactions[interaction_struct.script_noteworthy]) && isdefined(level.interactions[interaction_struct.script_noteworthy].useduration)) {
            interaction_struct.useduration = level.interactions[interaction_struct.script_noteworthy].useduration;
        } else {
            interaction_struct.useduration = "duration_short";
        }
        if (isdefined(interaction_struct.script_modelname)) {
            if (isdefined(interaction_struct.target)) {
                var_2632cf7dfde3c0a5 = getstructarray(interaction_struct.target, "targetname");
                foreach (target_struct in var_2632cf7dfde3c0a5) {
                    if (!isdefined(target_struct.script_noteworthy) || tolower(target_struct.script_noteworthy) != "scenenode" && tolower(target_struct.script_noteworthy) != "manual_script_model") {
                        thread spawninteractionmodel(interaction_struct, target_struct);
                    }
                }
                continue;
            }
            if (isdefined(interaction_struct.script_noteworthy) && tolower(interaction_struct.script_noteworthy) != "scenenode") {
                thread spawninteractionmodel(interaction_struct, interaction_struct);
            }
        }
    }
    flag_set("init_interaction_done");
    foreach (player in level.players) {
        curweapon = player getcurrentweapon();
        if (isdefined(level.wave_num) && isdefined(curweapon)) {
            self.waveswithweapons = [level.wave_num][getcompleteweaponname(curweapon)];
        }
    }
    /#
        level thread function_985a0cba8e1c90e1();
    #/
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15fe
// Size: 0xad
function drop_interaction_structs_to_ground() {
    foreach (interaction_struct in level.current_interaction_structs) {
        if (isdefined(interaction_struct.groupname) && interaction_struct.groupname == "locOverride") {
            continue;
        }
        ground_pos = drop_to_ground(interaction_struct.origin, 10, -200);
        interaction_struct.origin = ground_pos + (0, 0, 1);
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16b3
// Size: 0x96
function get_area_for_power(interaction_struct) {
    volumes = getentarray("spawn_volume", "targetname");
    foreach (volume in volumes) {
        if (ispointinvolume(interaction_struct.origin, volume)) {
            if (isdefined(volume.basename)) {
                return volume.basename;
            }
        }
    }
    return undefined;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1752
// Size: 0x8b
function get_adjacent_volumes_from_volume() {
    if (isdefined(level.adjacent_volumes[self.basename])) {
        new_array = [];
        foreach (vol_name in level.adjacent_volumes[self.basename]) {
            new_array[new_array.size] = level.spawn_volume_names[vol_name];
        }
        return new_array;
    }
    return [];
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17e6
// Size: 0x8d
function is_in_adjacent_volume(volume) {
    if (!isdefined(volume)) {
        return false;
    }
    if (!isdefined(volume.adjacent_volumes)) {
        return false;
    }
    foreach (vol in volume.adjacent_volumes) {
        if (!vol.active) {
            continue;
        }
        if (self istouching(vol)) {
            return true;
        }
    }
    return false;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x187c
// Size: 0x87
function assign_trigger_on_player_spawned() {
    level endon("game_ended");
    while (true) {
        level waittill("player_spawned", player);
        player.interaction_trigger = player get_player_interaction_trigger();
        if (!isdefined(player.interaction_trigger)) {
            iprintlnbold("NO TRIGGER FOUND!");
        }
        reset_interaction_triggers();
        player.last_interaction_point = undefined;
        player.interaction_trigger function_dfb78b3e724ad620(0);
        player thread function_bab793fb0c5c8e();
        player thread player_interaction_weapon_switch_monitor();
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x190b
// Size: 0x44
function player_interaction_weapon_switch_monitor() {
    self endon("death_or_disconnect");
    while (true) {
        waittill_any_3("weapon_switch_started", "weapon_change", "weaponchange");
        self.last_interaction_point = undefined;
        self.resetguidedinteraction = 1;
        self notify("stop_interaction_logic");
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1957
// Size: 0x5d
function get_player_interaction_trigger() {
    if (isdefined(self.interaction_trigger)) {
        return self.interaction_trigger;
    }
    interaction_trigger = spawn("script_model", (0, 0, 0));
    interaction_trigger setmodel("tag_origin");
    interaction_trigger makeusable();
    interaction_trigger thread deleteonplayerdeathdisconnect(self);
    return interaction_trigger;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x19bc
// Size: 0x221
function registerinteraction(script_noteworthy, hint_func, activation_func, init_func, var_ad96ac0ec299e386, suseduration, var_5a9d289a0e9ac2d8) {
    spend_type = undefined;
    tutorial = undefined;
    requires_power = undefined;
    can_use_override_func = undefined;
    if (!isdefined(suseduration)) {
        suseduration = "duration_short";
    }
    interaction_struct = spawnstruct();
    interaction_struct.script_noteworthy = script_noteworthy;
    interaction_struct.hint_func = hint_func;
    interaction_struct.spend_type = spend_type;
    interaction_struct.tutorial = tutorial;
    interaction_struct.activation_func = activation_func;
    interaction_struct.enabled = 1;
    interaction_struct.disabledguidedinteractions = 1;
    interaction_struct.cost = 0;
    interaction_struct.requires_power = requires_power;
    interaction_struct.init_func = init_func;
    interaction_struct.can_use_override_func = undefined;
    interaction_struct.noactivation = var_ad96ac0ec299e386;
    interaction_struct.useduration = suseduration;
    interaction_struct.is_p_ent = var_5a9d289a0e9ac2d8;
    level.interactions[script_noteworthy] = interaction_struct;
    structarray = getstructarray(script_noteworthy, "script_noteworthy");
    for (i = 0; i < structarray.size; i++) {
        structarray[i].interaction_id = level.interaction_id;
        level.current_interaction_structs[level.interaction_id] = structarray[i];
        level.interaction_id++;
    }
    if (isdefined(init_func)) {
        if (flag("interactions_initialized")) {
            level thread [[ init_func ]](structarray);
            if (istrue(var_5a9d289a0e9ac2d8)) {
                foreach (interaction_struct in structarray) {
                    scripts\cp\coop_personal_ents::addtopersonalinteractionlist(interaction_struct);
                }
            }
        }
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1be5
// Size: 0x63
function add_interaction_structs_to_interaction_arrays(structarray) {
    foreach (interaction_struct in structarray) {
        level.current_interaction_structs[interaction_struct.interaction_id] = interaction_struct;
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c50
// Size: 0x2b
function interactionhasactivation(interaction_struct) {
    return istrue(level.interactions[interaction_struct.script_noteworthy].noactivation);
}

// Namespace interaction / namespace_a3902e911697e714
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x1c84
// Size: 0x6b
function register_interaction(script_noteworthy, spend_type, tutorial, hint_func, activation_func, activation_cost, requires_power, init_func, can_use_override_func, var_ad96ac0ec299e386, suseduration) {
    registerinteraction(script_noteworthy, hint_func, activation_func, init_func, var_ad96ac0ec299e386, suseduration);
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf7
// Size: 0x62
function reset_interaction_triggers() {
    foreach (player in level.players) {
        if (isdefined(player.interaction_trigger)) {
            hide_interaction_trigger_from_others(player);
        }
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d61
// Size: 0x81
function hide_interaction_trigger_from_others(allowed_player) {
    foreach (player in level.players) {
        if (player == allowed_player) {
            allowed_player.interaction_trigger enableplayeruse(allowed_player);
            continue;
        }
        allowed_player.interaction_trigger disableplayeruse(player);
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1dea
// Size: 0x53
function private wherethehellami(player, trigger) {
    while (true) {
        thread draw_capsule(trigger.origin, 12, 12, trigger.angles, (1, 1, 0), 0, 1);
        wait 0.05;
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e45
// Size: 0xc
function no_previous_interaction_point() {
    return isdefined(self.last_interaction_point);
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5a
// Size: 0x16
function interaction_point_has_changed(interaction_point) {
    return self.last_interaction_point != interaction_point;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e79
// Size: 0x7d
function function_bab793fb0c5c8e() {
    self notify("player_interaction_monitor");
    self endon("player_interaction_monitor");
    self endon("death_or_disconnector");
    flag_wait("init_interaction_done");
    /#
        if (getdvarint(@"hash_ea23b78eb72018ca", 0) == 1) {
            self.interaction_trigger thread wherethehellami(self, self.interaction_trigger);
        }
    #/
    if (isdefined(level.player_interaction_monitor)) {
        self thread [[ level.player_interaction_monitor ]]();
        return;
    }
    thread function_61244c780cc5fd7();
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1efe
// Size: 0x1ff
function private function_61244c780cc5fd7() {
    searchdistance = 5184;
    var_925ab147f36bb977 = 9216;
    while (true) {
        if (isdefined(level.interactions_disabled)) {
            level waittill("interactions_disabled_toggled");
            continue;
        }
        /#
            var_cb861e8059c8d5bd = getdvarint(@"hash_994279ff7ef9febf", 0);
            if (var_cb861e8059c8d5bd != 0) {
                searchdistance = 48 + var_cb861e8059c8d5bd;
                var_925ab147f36bb977 = 72 + var_cb861e8059c8d5bd;
            }
        #/
        player_origin = self.origin;
        interaction_point = undefined;
        var_717fb99add9a6834 = sortbydistancecullbyradius(level.current_interaction_structs, player_origin, 512);
        for (i = 0; i < self.disabled_interactions.size; i++) {
            var_717fb99add9a6834 = array_remove(var_717fb99add9a6834, self.disabled_interactions[i]);
        }
        if (var_717fb99add9a6834.size == 0 || istrue(self.delay_hint)) {
            waitframe();
            continue;
        }
        var_4403360414478511 = var_717fb99add9a6834[0];
        var_581aed15f31bbe01 = distancesquared(var_4403360414478511.origin, player_origin);
        if (!isdefined(interaction_point) && var_581aed15f31bbe01 <= searchdistance) {
            interaction_point = var_4403360414478511;
        } else if (!isdefined(interaction_point) && isdefined(level.should_allow_far_search_dist_func)) {
            if (var_581aed15f31bbe01 <= var_925ab147f36bb977) {
                interaction_point = var_4403360414478511;
            }
            if (isdefined(interaction_point) && ![[ level.should_allow_far_search_dist_func ]](interaction_point)) {
                interaction_point = undefined;
            }
        } else if (!isdefined(interaction_point) && isdefined(var_4403360414478511.custom_search_dist)) {
            if (var_581aed15f31bbe01 <= var_4403360414478511.custom_search_dist) {
                interaction_point = var_4403360414478511;
            }
        }
        if (!isdefined(interaction_point) || !array_contains(level.current_interaction_structs, interaction_point) || !can_use_interaction(interaction_point)) {
            reset_interaction();
            continue;
        }
        if (!no_previous_interaction_point() || !interaction_point_has_changed(interaction_point) && interaction_is_button_mash(interaction_point) || interaction_point_has_changed(interaction_point)) {
            set_interaction_point(interaction_point);
        }
        waitframe();
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2105
// Size: 0x5d
function flash_inventory() {
    self endon("window_trap_placed");
    self endon("death");
    if (!isdefined(self.next_inventory_flash)) {
        self.next_inventory_flash = gettime() + 2500;
    } else if (gettime() < self.next_inventory_flash) {
        return;
    }
    self.next_inventory_flash = gettime() + 2500;
    wait 1.5;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x216a
// Size: 0xf7
function can_use_interaction(interaction_point) {
    if (!isdefined(interaction_point)) {
        return false;
    }
    if (istrue(self.iscarrying)) {
        return false;
    }
    if (istrue(interaction_point.disabled) || !areinteractionsenabled()) {
        return false;
    }
    if (istrue(interaction_point.awaitingpent)) {
        return false;
    }
    if (self secondaryoffhandbuttonpressed() || self isthrowinggrenade() || self fragbuttonpressed()) {
        return false;
    }
    if (!self isonground()) {
        return false;
    }
    if (!isdefined(interaction_point.script_noteworthy)) {
        thread debugremoveinteractionandsendmessage(interaction_point, "interaction_struct Struct at: " + interaction_point.origin + " does not have a .script_noteworthy defined.");
        return false;
    }
    if (!isdefined(level.interactions[interaction_point.script_noteworthy])) {
        thread debugremoveinteractionandsendmessage(interaction_point, "interaction_struct Struct at: " + interaction_point.origin + " with .script_noteworthy: " + interaction_point.script_noteworthy + " has not been registered as an interaction_struct");
        return false;
    }
    return true;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x226a
// Size: 0x8d
function debugremoveinteractionandsendmessage(interaction_struct, message) {
    /#
        if (getdvarint(@"hash_dc1fe944feca8658", 0)) {
            println("<dev string:x1c>");
            println("<dev string:x95>");
            println(message);
            println("<dev string:xa2>");
            println("<dev string:xe3>" + level.script);
            println("<dev string:xeb>" + level.gametype);
            println("<dev string:x1c>");
        }
        remove_from_current_interaction_list(interaction_struct);
    #/
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22ff
// Size: 0x29
function reset_interaction() {
    self endon("disconnect");
    wait 0.2;
    self.interaction_trigger function_dfb78b3e724ad620(0);
    self.last_interaction_point = undefined;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2330
// Size: 0x3b2
function set_interaction_point(interaction_point, var_9883d93111fd5ab9) {
    if (istrue(self.interaction_trigger.disableinteraction)) {
        return;
    }
    self notify("set_interaction_point");
    self.interaction_trigger dontinterpolate();
    self.last_interaction_point = interaction_point;
    eye = self geteye();
    if (istrue(interaction_point.var_9d53c266d664e00a)) {
        eye = interaction_point.origin;
    }
    self.interaction_trigger.origin = (interaction_point.origin[0], interaction_point.origin[1], eye[2]);
    if (interactionhasactivation(interaction_point)) {
        level thread [[ level.interactions[interaction_point.script_noteworthy].activation_func ]](interaction_point, self);
        return;
    }
    if (!isdefined(level.interactions[interaction_point.script_noteworthy].spend_type)) {
        level.interactions[interaction_point.script_noteworthy].spend_type = "null";
    }
    spend_type = level.interactions[interaction_point.script_noteworthy].spend_type;
    var_8f8b25936fae5c37 = undefined;
    if (function_fb316feab9934117(interaction_point)) {
        self.interaction_trigger.origin = interaction_point.origin;
    } else if (interaction_is_floor_is_lava_client(interaction_point)) {
        var_dc4f149f969d05af = strtok(interaction_point.name, "_");
        num = int(var_dc4f149f969d05af[1]);
        self.interaction_trigger sethintstringparams(num);
    } else if (interaction_is_jugg_maze_button(interaction_point)) {
        a = getjuggmazebutton(interaction_point.script_label);
        switch (interaction_point.script_noteworthy) {
        case #"hash_ee9888957c53cd6d":
            self.interaction_trigger sethintstringparams(a);
            break;
        }
    } else if (interaction_is_chess_piece(interaction_point)) {
        a = getalphabetstring(level.currentalphanumericcode[0]);
        b = getalphabetstring(level.currentalphanumericcode[1]);
        c = getnumberstring(level.currentalphanumericcode[2]);
        switch (interaction_point.script_noteworthy) {
        case #"hash_cea00219c45f45b":
            self.interaction_trigger sethintstringparams(a);
            break;
        case #"hash_9eafc3040785fe7e":
            self.interaction_trigger sethintstringparams(b);
            break;
        case #"hash_db37e69d86c806dc":
            self.interaction_trigger sethintstringparams(c);
            break;
        }
    } else if (interaction_is_weapon_pickup(interaction_point)) {
        set_weapon_interaction_string(interaction_point, self);
    } else if (interaction_is_trap(interaction_point)) {
        self.interaction_trigger.origin = (interaction_point.origin[0], interaction_point.origin[1], eye[2] - 15);
    }
    set_interaction_trigger_properties(self.interaction_trigger, interaction_point);
    if (!isdefined(interaction_point.suseduration)) {
        interaction_point.suseduration = "duration_none";
    }
    if (!isdefined(var_9883d93111fd5ab9)) {
        thread wait_for_interaction_triggered(interaction_point);
    }
    self.interaction_trigger function_dfb78b3e724ad620(1);
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26ea
// Size: 0x26a
function getjuggmazebutton(var_8a4fc1dc1fd4995e) {
    if (getdvarint(@"hash_176fa03e6da10955", 0) != 0) {
        switch (var_8a4fc1dc1fd4995e) {
        case #"hash_31105fbc01bdb66c":
            return %CP_RAID_COMPLEX_JUGG_MAZE/STABILIZE_PRESSURE_X1;
        case #"hash_311062bc01bdbb25":
            return %CP_RAID_COMPLEX_JUGG_MAZE/STABILIZE_PRESSURE_X2;
        case #"hash_311061bc01bdb992":
            return %CP_RAID_COMPLEX_JUGG_MAZE/INCREMENT_X1;
        case #"hash_31105cbc01bdb1b3":
            return %CP_RAID_COMPLEX_JUGG_MAZE/INCREMENT_X2;
        case #"hash_31105bbc01bdb020":
            return %CP_RAID_COMPLEX_JUGG_MAZE/MIX_GAUGE_X2_TO_X1;
        case #"hash_31105ebc01bdb4d9":
            return %CP_RAID_COMPLEX_JUGG_MAZE/RESET_X1;
        case #"hash_31105dbc01bdb346":
            return %CP_RAID_COMPLEX_JUGG_MAZE/RESET_X2;
        case #"hash_311068bc01bdc497":
            return %CP_RAID_COMPLEX_JUGG_MAZE/DEPLOY_READINGS;
        case #"hash_311067bc01bdc304":
            return %CP_RAID_COMPLEX_JUGG_MAZE/MIX_GAUGE_X1_TO_X2;
        case #"hash_31106abc01bdc7bd":
            return %CP_RAID_COMPLEX_JUGG_MAZE/DISPLAY_READINGS;
        }
    }
    if (getdvarint(@"hash_da6b87817db1cba0", 0) != 0) {
        switch (var_8a4fc1dc1fd4995e) {
        case #"hash_31105fbc01bdb66c":
            return %CP_RAID_COMPLEX_JUGG_MAZE/SW_POLE_X1;
        case #"hash_311062bc01bdbb25":
            return %CP_RAID_COMPLEX_JUGG_MAZE/SW_POLE_X2;
        case #"hash_311061bc01bdb992":
            return %CP_RAID_COMPLEX_JUGG_MAZE/INCREMENT_X1;
        case #"hash_31105cbc01bdb1b3":
            return %CP_RAID_COMPLEX_JUGG_MAZE/INCREMENT_X2;
        case #"hash_31105bbc01bdb020":
            return %CP_RAID_COMPLEX_JUGG_MAZE/RESET_GAUGES;
        case #"hash_31105ebc01bdb4d9":
            return %CP_RAID_COMPLEX_JUGG_MAZE/ADJUST_INCR_X1;
        case #"hash_31105dbc01bdb346":
            return %CP_RAID_COMPLEX_JUGG_MAZE/ADJUST_INCR_X2;
        case #"hash_311068bc01bdc497":
            return %CP_RAID_COMPLEX_JUGG_MAZE/LOCK_FUEL_VALS;
        case #"hash_311067bc01bdc304":
            return %CP_RAID_COMPLEX_JUGG_MAZE/RANDOMIZE;
        case #"hash_31106abc01bdc7bd":
            return %CP_RAID_COMPLEX_JUGG_MAZE/DISPLAY_READINGS;
        }
    }
    switch (var_8a4fc1dc1fd4995e) {
    case #"hash_31105fbc01bdb66c":
        return %CP_RAID_COMPLEX_JUGG_MAZE/A;
    case #"hash_311062bc01bdbb25":
        return %CP_RAID_COMPLEX_JUGG_MAZE/B;
    case #"hash_311061bc01bdb992":
        return %CP_RAID_COMPLEX_JUGG_MAZE/C;
    case #"hash_31105cbc01bdb1b3":
        return %CP_RAID_COMPLEX_JUGG_MAZE/D;
    case #"hash_31105bbc01bdb020":
        return %CP_RAID_COMPLEX_JUGG_MAZE/E;
    case #"hash_31105ebc01bdb4d9":
        return %CP_RAID_COMPLEX_JUGG_MAZE/F;
    case #"hash_31105dbc01bdb346":
        return %CP_RAID_COMPLEX_JUGG_MAZE/G;
    case #"hash_311068bc01bdc497":
        return %CP_RAID_COMPLEX_JUGG_MAZE/H;
    case #"hash_311067bc01bdc304":
        return %CP_RAID_COMPLEX_JUGG_MAZE/I;
    case #"hash_31106abc01bdc7bd":
        return %CP_RAID_COMPLEX_JUGG_MAZE/J;
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x295c
// Size: 0xfe
function getalphabetstring(var_8a4fc1dc1fd4995e) {
    switch (var_8a4fc1dc1fd4995e) {
    case #"hash_31105fbc01bdb66c":
        return %CP_LAB/A;
    case #"hash_311062bc01bdbb25":
        return %CP_LAB/B;
    case #"hash_311061bc01bdb992":
        return %CP_LAB/C;
    case #"hash_31105cbc01bdb1b3":
        return %CP_LAB/D;
    case #"hash_31105bbc01bdb020":
        return %CP_LAB/E;
    case #"hash_31105ebc01bdb4d9":
        return %CP_LAB/F;
    case #"hash_31105dbc01bdb346":
        return %CP_LAB/G;
    case #"hash_311068bc01bdc497":
        return %CP_LAB/H;
    case #"hash_311072bc01bdd455":
        return %CP_LAB/ROOK;
    case #"hash_311066bc01bdc171":
        return %CP_LAB/KNIGHT;
    case #"hash_31106fbc01bdcf9c":
        return %CP_LAB/QUEEN;
    case #"hash_311069bc01bdc62a":
        return %CP_LAB/KING;
    case #"hash_311070bc01bdd12f":
        return %CP_LAB/PAWN;
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a62
// Size: 0xa4
function getnumberstring(number) {
    switch (number) {
    case #"hash_31100fbc01bd387c":
        return %CP_LAB/1;
    case #"hash_311012bc01bd3d35":
        return %CP_LAB/2;
    case #"hash_311011bc01bd3ba2":
        return %CP_LAB/3;
    case #"hash_31100cbc01bd33c3":
        return %CP_LAB/4;
    case #"hash_31100bbc01bd3230":
        return %CP_LAB/5;
    case #"hash_31100ebc01bd36e9":
        return %CP_LAB/6;
    case #"hash_31100dbc01bd3556":
        return %CP_LAB/7;
    case #"hash_311018bc01bd46a7":
        return %CP_LAB/8;
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b0e
// Size: 0x35
function set_weapon_interaction_string(interaction_point, player) {
    var_96f1780c385b8c4f = get_weapon_name_string(interaction_point);
    self.interaction_trigger sethintstringparams(var_96f1780c385b8c4f);
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b4b
// Size: 0xb
function get_weapon_name_string(interaction_point) {
    
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b5e
// Size: 0x4f
function getweaponnamestring(weaponname) {
    if (!isdefined(weaponname)) {
        return undefined;
    }
    base_weapon = getbaseweaponname(weaponname);
    if (!isdefined(base_weapon)) {
        return undefined;
    }
    if (isdefined(level.custom_weaponnamestring_func)) {
        return [[ level.custom_weaponnamestring_func ]](base_weapon, weaponname);
    }
    return %CP_ZMB_WEAPONS/GENERIC;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bb5
// Size: 0x25
function getweaponcostint(weaponname) {
    return int(level.interactions[weaponname].cost);
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2be3
// Size: 0xbe
function set_interaction_trigger_properties(interaction_trigger, interaction_struct) {
    hintstring = get_interaction_hintstring(interaction_struct, self);
    if (isdefined(hintstring)) {
        self.interaction_trigger sethintstring(hintstring);
    }
    self.interaction_trigger setusefov(160);
    self.interaction_trigger setusepriority(1);
    if (isdefined(level.var_a30bd62e41e58a08) && isdefined(level.var_a30bd62e41e58a08[interaction_struct.script_noteworthy])) {
        [[ level.var_a30bd62e41e58a08[interaction_struct.script_noteworthy] ]](interaction_trigger, interaction_struct, hintstring);
        return;
    }
    if (isdefined(level.interaction_trigger_properties_func)) {
        [[ level.interaction_trigger_properties_func ]](interaction_trigger, interaction_struct, hintstring);
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ca9
// Size: 0xe2
function get_interaction_hintstring(interaction_struct, player) {
    if (isdefined(level.interactions[interaction_struct.script_noteworthy].hint_func)) {
        return [[ level.interactions[interaction_struct.script_noteworthy].hint_func ]](interaction_struct, player);
    }
    if (isdefined(interaction_struct.cooling_down)) {
        return %COOP_INTERACTIONS/COOLDOWN;
    }
    if (istrue(interaction_struct.requires_power) && !istrue(interaction_struct.powered_on)) {
        return %COOP_INTERACTIONS/REQUIRES_POWER;
    }
    if (!isdefined(level.interaction_hintstrings[interaction_struct.script_noteworthy])) {
        println("<dev string:xf6>" + interaction_struct.script_noteworthy);
        return "";
    }
    return level.interaction_hintstrings[interaction_struct.script_noteworthy];
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d94
// Size: 0x27
function wait_for_interaction_triggered(interaction_struct) {
    if (isdefined(level.wait_for_interaction_func)) {
        self thread [[ level.wait_for_interaction_func ]](interaction_struct);
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dc3
// Size: 0x128
function can_purchase_ammo(wall_weapon) {
    weapons = self getweaponslistall();
    ammo_weapon = undefined;
    var_9211cdaadb7bca55 = undefined;
    var_fbc51cc04b895926 = getrawbaseweaponname(wall_weapon);
    foreach (weapon in weapons) {
        var_9211cdaadb7bca55 = getrawbaseweaponname(weapon);
        if (var_9211cdaadb7bca55 == var_fbc51cc04b895926) {
            ammo_weapon = weapon;
            break;
        }
    }
    if (isdefined(ammo_weapon)) {
        current_ammo = self getweaponammostock(ammo_weapon);
        max_ammo = scripts\cp\utility::function_ed18a118c6fa5c4f(ammo_weapon);
        var_629f6083f99f1d29 = scripts\cp\perks\cp_prestige::prestige_getminammo();
        scaled_ammo = int(var_629f6083f99f1d29 * max_ammo);
        if (current_ammo < scaled_ammo) {
            return true;
        } else if (max_ammo == weaponclipsize(ammo_weapon) && self getweaponammoclip(ammo_weapon) < weaponclipsize(ammo_weapon)) {
            return true;
        } else {
            return false;
        }
    }
    return true;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ef4
// Size: 0x62
function interaction_post_activate_delay(interaction_struct) {
    self endon("disconnect");
    if (interaction_is_button_mash(interaction_struct)) {
        return;
    }
    if (interaction_is_door_buy(interaction_struct)) {
        return;
    }
    if (interaction_is_atm(interaction_struct)) {
        return;
    }
    if (interaction_is_chess_piece(interaction_struct)) {
        return;
    }
    val::set("post_activate_delay", "interactions", 0);
    wait 1.5;
    val::reset_all("post_activate_delay");
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f5e
// Size: 0x12
function delayed_trigger_unset() {
    wait 0.25;
    self.triggered = undefined;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f78
// Size: 0x6b
function addtointeractionslistbynoteworthy(noteworthy) {
    var_a28cb3eb323db0ae = getstructarray(noteworthy, "script_noteworthy");
    foreach (interaction_struct in var_a28cb3eb323db0ae) {
        add_to_current_interaction_list(interaction_struct);
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2feb
// Size: 0x6b
function removefrominteractionslistbynoteworthy(noteworthy) {
    var_a28cb3eb323db0ae = getstructarray(noteworthy, "script_noteworthy");
    foreach (interaction_struct in var_a28cb3eb323db0ae) {
        remove_from_current_interaction_list(interaction_struct);
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x305e
// Size: 0x55
function remove_from_current_interaction_list(interaction_struct) {
    interaction_struct notify("remove_from_current_interaction_list");
    interaction_struct.in_array = 0;
    if (isdefined(level.current_interaction_structs[interaction_struct.interaction_id])) {
        level.current_interaction_structs[interaction_struct.interaction_id] = undefined;
    }
    scripts\cp\coop_personal_ents::update_special_mode_for_all_players();
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30bb
// Size: 0x3f
function add_to_current_interaction_list(interaction_struct) {
    interaction_struct notify("add_to_current_interaction_list");
    interaction_struct.in_array = 1;
    level.current_interaction_structs[interaction_struct.interaction_id] = interaction_struct;
    scripts\cp\coop_personal_ents::update_special_mode_for_all_players();
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3102
// Size: 0x48
function remove_from_current_interaction_list_for_player(interaction_struct, player) {
    interaction_struct notify("remove_from_current_interaction_list_for_player_" + player.name);
    player.disabled_interactions[interaction_struct.interaction_id] = interaction_struct;
    scripts\cp\coop_personal_ents::update_special_mode_for_player(player);
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3152
// Size: 0x46
function add_to_current_interaction_list_for_player(interaction_struct, player) {
    interaction_struct notify("add_to_current_interaction_list_for_player_" + player.name);
    player.disabled_interactions[interaction_struct.interaction_id] = undefined;
    scripts\cp\coop_personal_ents::update_special_mode_for_player(player);
}

// Namespace interaction / namespace_a3902e911697e714
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x31a0
// Size: 0x92
function can_purchase_interaction(interaction_struct, amount, spend_type, weapon) {
    if (!isdefined(level.current_interaction_structs[interaction_struct.interaction_id])) {
        return false;
    }
    if (istrue(level.var_fc3d8e513c281e49)) {
        return true;
    }
    if (isdefined(amount)) {
        cost = amount;
    } else {
        cost = level.interactions[interaction_struct.script_noteworthy].cost;
    }
    if (namespace_6c67e93a4c487d83::player_has_enough_currency(cost, spend_type)) {
        return true;
    }
    return false;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x323b
// Size: 0x23
function interaction_get_cost() {
    if (isdefined(self.cost)) {
        return int(self.cost);
    }
    return 0;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3266
// Size: 0x1e
function take_player_money(cost, var_e42f7eb456b932f2) {
    namespace_6c67e93a4c487d83::take_player_currency(cost, 1, var_e42f7eb456b932f2);
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x328c
// Size: 0x5c
function should_interaction_fill_consumable_meter(var_e42f7eb456b932f2) {
    if (!isdefined(var_e42f7eb456b932f2)) {
        assertmsg("Spending type is not defined.");
    }
    switch (var_e42f7eb456b932f2) {
    case #"hash_c932d6c10cbe95f":
    case #"hash_94d89c28c481dde6":
    case #"hash_c6b8c582ba70471e":
        return 0;
    default:
        return 1;
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x32f0
// Size: 0x1da
function getammopurchasestring(interaction_struct, player) {
    cost = level.interactions[interaction_struct.script_noteworthy].cost;
    base_weapon = getrawbaseweaponname(interaction_struct.script_noteworthy);
    currentweapon = player getcurrentweapon();
    max_ammo = scripts\cp\utility::function_ed18a118c6fa5c4f(currentweapon);
    var_629f6083f99f1d29 = player scripts\cp\perks\cp_prestige::prestige_getminammo();
    scaled_ammo = int(var_629f6083f99f1d29 * max_ammo);
    current_ammo = player getweaponammostock(currentweapon);
    weapons = self getweaponslistall();
    foreach (weapon in weapons) {
        var_9211cdaadb7bca55 = getrawbaseweaponname(weapon);
        if (var_9211cdaadb7bca55 == getrawbaseweaponname(interaction_struct.script_noteworthy)) {
            var_3626ccbdf1758532 = weapon;
            current_ammo = self getweaponammostock(var_3626ccbdf1758532);
            max_ammo = scripts\cp\utility::function_ed18a118c6fa5c4f(var_3626ccbdf1758532);
            scaled_ammo = int(var_629f6083f99f1d29 * max_ammo);
        }
    }
    if (interaction_struct.script_parameters == "tickets") {
        return level.interaction_hintstrings[interaction_struct.script_noteworthy];
    }
    switch (cost) {
    case 500:
    case 1000:
    case 1250:
    case 1500:
        return %COOP_INTERACTIONS/PURCHASE_AMMO;
    default:
        return %COOP_INTERACTIONS/PURCHASE_AMMO;
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x34d2
// Size: 0x32
function default_weapon_hint_func(interaction_struct, player) {
    if (player namespace_a0628d6954815ef8::has_weapon_variation(interaction_struct.script_noteworthy)) {
        return getammopurchasestring(interaction_struct, player);
    }
    return undefined;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x350d
// Size: 0xee
function interaction_sound_monitor() {
    level endon("game_ended");
    while (true) {
        level waittill("interaction", interaction_type, interaction_struct, player);
        switch (interaction_type) {
        case #"hash_52dba21b7b0431e":
            if (isdefined(player.purchasing_ammo)) {
                if (soundexists("purchase_ammo")) {
                    player playlocalsound_safe("purchase_ammo");
                }
            } else if (soundexists("purchase_weapon")) {
                player playlocalsound_safe("purchase_weapon");
            }
            break;
        case #"hash_5f4247cbd74f75c2":
            sound = get_interaction_sound(interaction_struct, player);
            if (isdefined(sound) && soundexists(sound)) {
                player playlocalsound_safe(sound);
            }
            break;
        case #"hash_8a373ba44407fd2c":
            player playlocalsound_safe("cp_computer_fail");
            break;
        }
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3603
// Size: 0x1fb
function get_interaction_sound(interaction_struct, player) {
    alias_array = [];
    switch (interaction_struct.script_noteworthy) {
    case #"hash_8ded6fdf599c8405":
        return undefined;
    case #"hash_c373b5c1c961382":
        alias_array = ["lost_and_found_purchase"];
        break;
    case #"hash_17705e021d413644":
    case #"hash_5176ea8ac5ebd6d2":
    case #"hash_79aacf81624606a1":
    case #"hash_ad9fd60c8d16f5c4":
    case #"hash_ee5629fbd73d7dec":
        alias_array = ["trap_control_panel_purchase"];
        break;
    case #"hash_43c3b099403349e6":
    case #"hash_74d7342ec02bc5ba":
        alias_array = ["purchase_door"];
        break;
    case #"hash_d33dd55dbc3e9e86":
        alias_array = ["purchase_door"];
        break;
    case #"hash_338a7935f889f966":
        alias_array = ["atm_deposit"];
        break;
    case #"hash_7111b6336bce51b7":
        alias_array = ["atm_withdrawal"];
        break;
    case #"hash_540029e95443eff9":
    case #"hash_6b74d503b2df6dde":
    case #"hash_ecd90e4994d7d04c":
    case #"hash_f9208728ecc14a4d":
        alias_array = ["zmb_item_pickup"];
        break;
    case #"hash_37ad8039ea91a8a5":
    case #"hash_a3d81e14ec5a5b24":
    case #"hash_c588128f7226d6cf":
    case #"hash_dc336228a1085866":
        alias_array = ["purchase_ticket"];
        break;
    case #"hash_1e249caad9c87d9e":
        alias_array = ["ark_purchase"];
        break;
    case #"hash_e66a57d8aeebc251":
        alias_array = ["ark_turn_in"];
        break;
    default:
        alias_array = ["ark_turn_in"];
        break;
    }
    if (!alias_array.size) {
        return undefined;
    }
    return random(alias_array);
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3807
// Size: 0x39
function interaction_post_activate_update(interaction_struct) {
    if (!isdefined(interaction_struct.post_activate_update)) {
        return;
    }
    if (isdefined(level.interaction_post_activate_update_func)) {
        level thread [[ level.interaction_post_activate_update_func ]](interaction_struct, self);
        return;
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3848
// Size: 0x31
function interaction_is_trap(interaction_struct) {
    return interaction_struct.script_noteworthy == "trap_electric" || interaction_struct.script_noteworthy == "trap_firebarrel";
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3882
// Size: 0x31
function interaction_is_atm(interaction_struct) {
    return interaction_struct.script_noteworthy == "atm_withdrawal" || interaction_struct.script_noteworthy == "atm_deposit";
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38bc
// Size: 0x31
function interaction_is_grenade_wall_buy(interaction_struct) {
    return interaction_struct.script_noteworthy == "power_bioSpike" || interaction_struct.script_noteworthy == "power_c4";
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38f6
// Size: 0x1c
function interaction_is_weapon_pickup(interaction_struct) {
    return interaction_struct.script_noteworthy == "weaponPickup";
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x391b
// Size: 0x1c
function interaction_is_fortune_teller(interaction_struct) {
    return interaction_struct.script_noteworthy == "jaroslav_machine";
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3940
// Size: 0x26
function interaction_waiting_on_power(interaction_struct) {
    return istrue(interaction_struct.requires_power) && !interaction_struct.powered_on;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x396f
// Size: 0xd3
function interaction_is_valid(interaction_struct, player) {
    if (isdefined(interaction_struct.triggered)) {
        return false;
    }
    if (!isdefined(level.current_interaction_structs[interaction_struct.interaction_id])) {
        return false;
    }
    if (istrue(interaction_struct.out_of_order)) {
        level notify("player_accessed_interaction_on_cooldown", player);
        return false;
    }
    if (interaction_waiting_on_power(interaction_struct)) {
        level notify("player_accessed_nonpowered_interaction", player);
        if (isdefined(interaction_struct.perk_type) && soundexists("perk_machine_deny")) {
            player playlocalsound("perk_machine_deny");
        } else {
            player playlocalsound("purchase_deny");
        }
        return false;
    }
    if (isdefined(interaction_struct.cooling_down)) {
        level notify("player_accessed_interaction_on_cooldown", player);
        return false;
    }
    if (!isdefined(interaction_struct.interaction_id)) {
        return false;
    }
    return true;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a4b
// Size: 0x1c
function function_fb316feab9934117(interaction_struct) {
    return interaction_struct.script_noteworthy == "hardpoint_airdrop";
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a70
// Size: 0x1c
function interaction_is_floor_is_lava_client(interaction_struct) {
    return interaction_struct.script_noteworthy == "sequence_interaction";
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a95
// Size: 0x1c
function interaction_is_jugg_maze_button(interaction_struct) {
    return interaction_struct.script_noteworthy == "seq_button";
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3aba
// Size: 0x46
function interaction_is_chess_piece(interaction_struct) {
    return interaction_struct.script_noteworthy == "chess_piece_selection" || interaction_struct.script_noteworthy == "chess_puzzle_alphabet" || interaction_struct.script_noteworthy == "chess_puzzle_number";
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b09
// Size: 0x1e
function interaction_is_weapon_buy(interaction_struct) {
    if (isdefined(interaction_struct.weapon)) {
        return true;
    }
    return false;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b30
// Size: 0x26
function interaction_is_button_mash(interaction_struct) {
    return isdefined(interaction_struct.isbuttonmash) && interaction_struct.isbuttonmash;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b5f
// Size: 0xd9
function interaction_is_door_buy(interaction_struct) {
    return interaction_struct.script_noteworthy == "debris_350" || interaction_struct.script_noteworthy == "debris_750" || interaction_struct.script_noteworthy == "debris_1000" || interaction_struct.script_noteworthy == "debris_1250" || interaction_struct.script_noteworthy == "debris_1500" || interaction_struct.script_noteworthy == "debris_2000" || interaction_struct.script_noteworthy == "1v1_stairway_door" || interaction_struct.script_noteworthy == "1v1_exit_door" || interaction_struct.script_noteworthy == "team_door_switch" || interaction_struct.script_noteworthy == "team_door";
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c41
// Size: 0x46
function interaction_is_chi_door(interaction_struct) {
    return interaction_struct.script_noteworthy == "chi_0" || interaction_struct.script_noteworthy == "chi_1" || interaction_struct.script_noteworthy == "chi_2";
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c90
// Size: 0xaf
function interaction_is_ticket_buy(interaction_struct) {
    return interaction_struct.script_noteworthy == "small_ticket_prize" || interaction_struct.script_noteworthy == "medium_ticket_prize" || interaction_struct.script_noteworthy == "arcade_counter_grenade" || interaction_struct.script_noteworthy == "arcade_counter_ammo" || interaction_struct.script_noteworthy == "large_ticket_prize" || interaction_struct.script_noteworthy == "zfreeze_semtex_mp" || interaction_struct.script_noteworthy == "iw7_forgefreeze_zm+forgefreezealtfire" || interaction_struct.script_noteworthy == "gold_teeth";
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d48
// Size: 0x76
function can_use_perk(interaction_struct) {
    if (has_zombie_perk(interaction_struct.perk_type)) {
        return false;
    } else if (self.self_revives_purchased >= self.max_self_revive_machine_use && interaction_struct.perk_type == "perk_machine_revive") {
        return false;
    } else if (isdefined(self.zombies_perks) && self.zombies_perks.size > 4) {
        return false;
    }
    return true;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3dc7
// Size: 0x2f
function interaction_show_fail_reason(interaction_struct, stringname, check_condition, var_1e59f2dcd3b86d22) {
    thread interaction_fail_internal(interaction_struct, stringname, check_condition, var_1e59f2dcd3b86d22);
}

// Namespace interaction / namespace_a3902e911697e714
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3dfe
// Size: 0x86
function interaction_fail_internal(interaction_struct, stringname, check_condition, var_1e59f2dcd3b86d22) {
    self endon("disconnect");
    level notify("interaction", "purchase_denied", level.interactions[interaction_struct.script_noteworthy], self);
    self.delay_hint = 1;
    self.interaction_trigger sethintstring(stringname);
    wait 1;
    self.delay_hint = undefined;
    set_interaction_trigger_properties(self.interaction_trigger, interaction_struct);
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3e8c
// Size: 0x1d9
function interaction_cooldown(interaction_struct, time) {
    interactions = getstructarray(interaction_struct.script_noteworthy, "script_noteworthy");
    foreach (struct in interactions) {
        if (struct.target == interaction_struct.target) {
            struct.cooling_down = 1;
        }
    }
    if (istrue(level.cooldown_override)) {
        wait 1;
    } else {
        level waittill_any_timeout_1(time, "override_cooldowns");
    }
    foreach (struct in interactions) {
        if (struct.target == interaction_struct.target) {
            struct.cooling_down = undefined;
        }
    }
    distcheck = 5184;
    foreach (player in level.players) {
        foreach (struct in interactions) {
            if (distancesquared(player.origin, struct.origin) >= distcheck) {
                continue;
            }
            player refresh_interaction();
        }
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x406d
// Size: 0x35
function refresh_interaction() {
    self notify("stop_interaction_logic");
    self.last_interaction_point = undefined;
    if (isdefined(self.interaction_trigger)) {
        self.interaction_trigger sethintstring("");
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40aa
// Size: 0xb4
function disable_wall_buy_interactions() {
    structs = getstructarray("interaction", "targetname");
    foreach (struct in structs) {
        if (interaction_is_weapon_buy(struct) || interaction_is_grenade_wall_buy(struct) || interaction_is_ticket_buy(struct) || isdefined(struct.script_parameters) && struct.script_parameters == "tickets") {
            struct.disabled = 1;
        }
    }
}

/#

    // Namespace interaction / namespace_a3902e911697e714
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4166
    // Size: 0xac
    function function_985a0cba8e1c90e1() {
        flag_init("<dev string:x112>");
        level endon("<dev string:x132>");
        level.var_375b54a9c54da547 = [];
        while (true) {
            flag_wait("<dev string:x112>");
            var_602b797d1505f4be = getdvar(@"hash_f3287037720f9cac", "<dev string:x13d>");
            var_d7792c2745050aa0 = getdvar(@"hash_700b2c240fd3492a", "<dev string:x13d>");
            var_9a4914e120057019 = getstructarray("<dev string:x13e>", "<dev string:x14a>");
            function_1ddb68f2137782b(var_602b797d1505f4be, var_d7792c2745050aa0);
            flag_clear("<dev string:x112>");
            level.var_375b54a9c54da547 = [];
        }
    }

    // Namespace interaction / namespace_a3902e911697e714
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x421a
    // Size: 0xbf
    function function_1ddb68f2137782b(var_602b797d1505f4be, var_d7792c2745050aa0) {
        level endon("<dev string:x132>");
        level endon("<dev string:x155>");
        var_17f783daa20df724 = getstructarray(var_d7792c2745050aa0, var_602b797d1505f4be);
        level.var_375b54a9c54da547 = var_17f783daa20df724;
        while (true) {
            foreach (interaction_struct in var_17f783daa20df724) {
                thread draw_line_for_time(interaction_struct.origin, interaction_struct.origin + (0, 0, 256), 1, 0, 0, 1);
            }
            wait 1;
        }
    }

#/

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x42e1
// Size: 0xd5
function spawninteractionmodel(interaction_struct, target_struct) {
    level endon("game_ended");
    flag_wait("interactions_initialized");
    if (isdefined(interaction_struct.script_modelname)) {
        model = spawn("script_model", target_struct.origin);
        if (isdefined(target_struct.angles)) {
            model.angles = target_struct.angles;
        }
        model setmodel(interaction_struct.script_modelname);
        if (isdefined(interaction_struct.targetmodels)) {
            interaction_struct.targetmodels[interaction_struct.targetmodels.size] = model;
        }
        if (isdefined(interaction_struct.var_c83a47c596b260bc)) {
            model [[ interaction_struct.var_c83a47c596b260bc ]](interaction_struct);
        }
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43be
// Size: 0x2cc
function move_to_closest_interaction(player) {
    level endon("game_ended");
    player endon("disconnect");
    currentstruct = undefined;
    entorigin = undefined;
    var_5c9ddcf56d36f133 = -1;
    var_3414e5c0a9919716 = 0;
    tooclosedist = squared(75);
    while (true) {
        if (istrue(player.inlaststand) || istrue(player.siege_activated) || istrue(player.flung)) {
            currentstruct = undefined;
            update_struct_information(player, -1, undefined, undefined);
        } else if (!player areinteractionsenabled()) {
            currentstruct = undefined;
            update_struct_information(player, -1, undefined, undefined);
        } else {
            var_936a8cb7ab047d5f = [];
            var_d5b8724607c37b52 = sortbydistancecullbyradius(level.current_interaction_structs, player.origin, 750);
            foreach (item in var_d5b8724607c37b52) {
                if (!isdefined(player.disabled_interactions[item.interaction_id]) && is_permitted_guided_interaction(player, item, currentstruct)) {
                    var_936a8cb7ab047d5f[var_936a8cb7ab047d5f.size] = item;
                }
            }
            if (istrue(player.resetguidedinteraction)) {
                currentstruct = undefined;
                update_struct_information(player, -1, undefined, undefined);
                player.resetguidedinteraction = undefined;
                wait 0.05;
                continue;
            }
            if (var_936a8cb7ab047d5f.size < 1) {
                currentstruct = undefined;
                update_struct_information(player, -1, undefined, undefined);
                wait 0.05;
                continue;
            }
            var_936a8cb7ab047d5f = sortbydistance(var_936a8cb7ab047d5f, player.origin);
            foreach (struct in var_936a8cb7ab047d5f) {
                var_3414e5c0a9919716 = 0;
                if (player adsbuttonpressed()) {
                    update_struct_information(player, -1, undefined, undefined);
                    currentstruct = undefined;
                    while (player adsbuttonpressed()) {
                        wait 0.05;
                    }
                }
                if (distancesquared(player.origin, struct.origin) <= tooclosedist) {
                    update_struct_information(player, -1, undefined, undefined);
                    currentstruct = undefined;
                    continue;
                }
                if (isdefined(currentstruct) && struct == currentstruct) {
                    break;
                }
                entorigin = get_interaction_origin(struct, player);
                var_5c9ddcf56d36f133 = get_interaction_cost(struct, player);
                currentstruct = struct;
                var_3414e5c0a9919716 = 1;
                break;
            }
            if (var_3414e5c0a9919716) {
                update_struct_information(player, var_5c9ddcf56d36f133, entorigin, currentstruct);
            }
        }
        wait 0.1;
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4692
// Size: 0x1b4
function get_interaction_origin(struct, player) {
    offset = (0, 0, 68);
    pos = struct.origin;
    if (!isdefined(pos)) {
        pos = struct.origin;
    }
    if (isdefined(level.guided_interaction_offset_func)) {
        offset = [[ level.guided_interaction_offset_func ]](struct, player);
    } else {
        var_28eb544eca57f217 = get_area_for_power(struct);
        if (isdefined(struct.script_noteworthy)) {
            structname = struct.script_noteworthy;
            switch (structname) {
            case #"hash_33a1e53dbf58c00e":
            case #"hash_7ea424151841c4eb":
            case #"hash_c83dceded64d47dd":
                offset = (0, 0, 12);
                break;
            case #"hash_4cd897d490012f2e":
            case #"hash_fa26459eb1dd64e6":
                if (var_28eb544eca57f217 == "swamp_stage") {
                    offset = (0, 0, 12);
                }
                break;
            case #"hash_37ad8039ea91a8a5":
                offset = (0, 0, 20);
                break;
            case #"hash_c36284ec9d5582db":
            case #"hash_e999e97bad9cb00b":
                if (var_28eb544eca57f217 == "moon") {
                    offset = (0, 0, 30);
                } else {
                    offset = (0, 0, 56);
                }
                break;
            default:
                offset = (0, 0, 56);
                break;
            }
        }
    }
    neworigin = drop_to_ground(pos, 12) + offset;
    return neworigin;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x484f
// Size: 0xa6
function get_interaction_cost(struct, player) {
    modifier = 1;
    var_5c9ddcf56d36f133 = 0;
    if (isdefined(level.interactions[struct.script_noteworthy])) {
        if (isdefined(level.interactions[struct.script_noteworthy].cost)) {
            var_5c9ddcf56d36f133 = int(level.interactions[struct.script_noteworthy].cost);
        } else {
            return 0;
        }
    }
    if (player is_consumable_active("next_purchase_free")) {
        var_5c9ddcf56d36f133 = 0;
    }
    return var_5c9ddcf56d36f133;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x48fe
// Size: 0x541
function is_permitted_guided_interaction(player, struct, currentstruct) {
    level endon("game_ended");
    player endon("disconnect");
    if (!isdefined(struct)) {
        return 0;
    }
    structname = undefined;
    if (isdefined(struct.script_noteworthy)) {
        structname = struct.script_noteworthy;
    } else {
        return 0;
    }
    if (istrue(struct.out_of_order) || isdefined(struct.cooling_down)) {
        return 0;
    }
    if (istrue(struct.disabledguidedinteractions)) {
        return 0;
    }
    if (isdefined(struct.perk_type) && struct.perk_type == "perk_machine_revive" && player.self_revives_purchased >= player.max_self_revive_machine_use) {
        return 0;
    }
    if (!coop_mode_has("wall_buys")) {
        if (interaction_is_weapon_buy(struct) || interaction_is_grenade_wall_buy(struct) || interaction_is_ticket_buy(struct) || interaction_is_chi_door(struct) || isdefined(struct.script_parameters) && struct.script_parameters == "tickets") {
            return 0;
        }
    }
    if (interaction_is_fortune_teller(struct)) {
        if (player.card_refills == 2) {
            return 0;
        }
    }
    if (structname == "secure_window" || structname == "white_ark" || structname == "wor_standee" || structname == "generator" || structname == "center_speaker_locs" || structname == "fourth_speaker" || structname == "ark_quest_station" || structname == "dj_quest_part_1" || structname == "dj_quest_part_2" || structname == "dj_quest_part_3" || structname == "dj_quest_door" || structname == "dj_quest_speaker" || structname == "lost_and_found" || structname == "fast_travel" || structname == "crafting_pickup" || structname == "pap_upgrade" || structname == "team_door" || structname == "neil_head" || structname == "neil_battery" || structname == "neil_repair" || structname == "neil_firmware" || structname == "barnstorming_group" || structname == "demon_group" || structname == "starmaster_group" || structname == "group_cosmicarc" || structname == "group_pitfall" || structname == "group_riverraid" || structname == "spider_arcade_group" || structname == "robottank_group" || structname == "gator_teeth_placement" || structname == "atm_withdrawal" && isdefined(level.atm_amount_deposited) && level.atm_amount_deposited < 1000 || structname == "crafting_station" && !isdefined(player.current_crafting_struct)) {
        return 0;
    }
    if (isdefined(level.guidedinteractionexclusion)) {
        if (![[ level.guidedinteractionexclusion ]](struct, player, structname)) {
            return 0;
        }
    }
    if (istrue(struct.requires_power) && !istrue(struct.powered_on)) {
        return 0;
    }
    if (isdefined(level.active_volume_check)) {
        if (structname == "pap_upgrade" || structname == "weapon_upgrade") {
            return 1;
        } else if (!self [[ level.active_volume_check ]](struct.origin)) {
            return 0;
        }
    }
    end_pos = struct.origin;
    if (isdefined(level.guidedinteractionendposoverride)) {
        end_pos = [[ level.guidedinteractionendposoverride ]](player, struct);
    }
    if (!within_fov(player.origin, player.angles, end_pos, cos(25))) {
        return 0;
    }
    if (interaction_is_door_buy(struct) || interaction_is_chi_door(struct)) {
        var_ee46ba4828993237 = get_spawn_volumes_player_is_in(0, undefined, player);
        foreach (var_27dfbfcbd63d339e in var_ee46ba4828993237) {
            var_eb6e6263d4667983 = var_27dfbfcbd63d339e get_adjacent_volumes_from_volume();
            foreach (volume in var_eb6e6263d4667983) {
                if (ispointinvolume(struct.origin, volume)) {
                    return 0;
                }
            }
        }
    }
    contents = physics_createcontents(["physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_solid"]);
    if (struct.script_noteworthy == "trap_hydrant") {
        end_pos = struct.origin + (0, 0, 50);
    }
    if (scripts\engine\trace::ray_trace_passed(player geteye(), end_pos, [player], contents)) {
        return 1;
    }
    return 0;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4e47
// Size: 0x7b
function update_struct_information(player, cost, origin, currentstruct) {
    if (!isdefined(cost)) {
        cost = -1;
    }
    if (isdefined(origin) && origin != self.origin) {
        wait 0.1;
        self dontinterpolate();
        self.origin = origin;
        wait 0.1;
    }
    if (isdefined(currentstruct) && currentstruct.script_parameters == "tickets") {
        cost = 2;
    }
}

// Namespace interaction / namespace_a3902e911697e714
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4eca
// Size: 0xfb
function get_spawn_volumes_player_is_in(var_62e2246e21a8b5ea, var_ce0a3f24a858d58b, player) {
    if (isdefined(level.get_spawn_volume_func)) {
        return [[ level.get_spawn_volume_func ]]();
    }
    spawn_volume_array = [];
    volume_array = level.spawn_volume_array;
    foreach (volume in volume_array) {
        if (!volume.active) {
            continue;
        }
        player_found = 0;
        if (isdefined(var_ce0a3f24a858d58b) && !player is_valid_player()) {
            continue;
        }
        if (player istouching(volume)) {
            player_found = 1;
        } else if (istrue(var_62e2246e21a8b5ea) && player is_in_adjacent_volume(volume)) {
            player_found = 1;
        }
        if (player_found) {
            spawn_volume_array[spawn_volume_array.size] = volume;
        }
    }
    return spawn_volume_array;
}

// Namespace interaction / namespace_a3902e911697e714
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4fce
// Size: 0x89
function function_9a2e153e21f32208(interaction_struct, player, cost) {
    if (!isdefined(cost)) {
        cost = interaction_struct interaction_get_cost();
    }
    level notify("interaction", "purchase", level.interactions[interaction_struct.script_noteworthy], player);
    var_e42f7eb456b932f2 = level.interactions[interaction_struct.script_noteworthy].spend_type;
    player thread take_player_money(cost, var_e42f7eb456b932f2);
    interaction_post_activate_update(interaction_struct);
}

// Namespace interaction / namespace_a3902e911697e714
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x505f
// Size: 0x20
function function_550809e2ab1f8ebc(interaction_name, hint_str) {
    level.interaction_hintstrings[interaction_name] = hint_str;
}

