#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using script_18a73a64992dd07d;
#using scripts\cp\cp_kidnapper.gsc;
#using script_afb7e332aee4bf2;
#using scripts\cp\cp_dialogue.gsc;
#using scripts\cp\cp_objectives.gsc;
#using scripts\cp_mp\killstreaks\chopper_gunner.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp\utility\cp_safehouse_util.gsc;
#using script_166b4f052da169a7;
#using scripts\cp\cp_player_battlechatter.gsc;

#namespace namespace_adafd08717508043;

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4aa
// Size: 0x170
function slamcamoverlay(var_ad4dd16f29e24b77, holdduration, var_dfab0807d83a77fe) {
    overlay = newclienthudelem(self);
    overlay.x = 0;
    overlay.y = 0;
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.sort = 1;
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.foreground = 1;
    if (isdefined(var_ad4dd16f29e24b77) && var_ad4dd16f29e24b77 > 0) {
        overlay.alpha = 0;
    } else {
        overlay.alpha = 1;
    }
    overlay setshader("black", 640, 480);
    if (isdefined(var_ad4dd16f29e24b77) && var_ad4dd16f29e24b77 > 0) {
        self notify("fadeDown_start");
        overlay fadeovertime(var_ad4dd16f29e24b77);
        overlay.alpha = 1;
        wait var_ad4dd16f29e24b77;
        self notify("fadeDown_complete");
    }
    if (isdefined(holdduration) && holdduration > 0) {
        wait holdduration;
    }
    self notify("fadeUp_start");
    if (!isdefined(var_dfab0807d83a77fe)) {
        var_dfab0807d83a77fe = 0.5;
    }
    if (var_dfab0807d83a77fe > 0) {
        overlay fadeovertime(var_dfab0807d83a77fe);
        overlay.alpha = 0;
        wait var_dfab0807d83a77fe;
    }
    self notify("fadeUp_complete");
    if (isdefined(overlay)) {
        overlay destroy();
    }
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x622
// Size: 0xb4
function kill_all_enemies() {
    namespace_5729d24318b60bcd::stop_all_groups();
    level.ambient_spawning_paused = 1;
    foreach (var_c8c0e3cbce8f401a in level.agentarray) {
        if (!istrue(var_c8c0e3cbce8f401a.isactive)) {
            continue;
        }
        var_c8c0e3cbce8f401a.nocorpse = 1;
        var_c8c0e3cbce8f401a dodamage(var_c8c0e3cbce8f401a.health + 1000, var_c8c0e3cbce8f401a.origin, undefined, undefined, "MOD_EXPLOSIVE", "iw8_la_rpapa7_mp_friendly");
    }
    level.ambient_spawning_paused = 0;
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6de
// Size: 0x15c
function regroup_blackscreen(player, var_ad170c2b0c7a7fb2, var_892708eff6520b44, var_ad170b2b0c7a7d7f) {
    if (!isdefined(player)) {
        player = self;
    }
    player endon("disconnect");
    player disableweapons();
    player freezecontrolswrapper(1);
    player setclientomnvar("ui_hide_hud", 1);
    fullscreen_overlay = newclienthudelem(player);
    fullscreen_overlay.x = 0;
    fullscreen_overlay.y = 0;
    fullscreen_overlay setshader("black", 640, 480);
    fullscreen_overlay.alignx = "left";
    fullscreen_overlay.aligny = "top";
    fullscreen_overlay.sort = 1;
    fullscreen_overlay.horzalign = "fullscreen";
    fullscreen_overlay.vertalign = "fullscreen";
    fullscreen_overlay.alpha = 1;
    fullscreen_overlay.foreground = 1;
    level waittill(var_ad170c2b0c7a7fb2);
    player thread show_regroup_text(var_892708eff6520b44);
    level waittill(var_ad170b2b0c7a7d7f);
    player setclientomnvar("ui_chyron_on", 0);
    player setclientomnvar("ui_hide_hud", 0);
    player freezecontrolswrapper(0);
    player enableweapons();
    fullscreen_overlay fadeovertime(2);
    fullscreen_overlay.alpha = 0.5;
    wait 2;
    fullscreen_overlay destroy();
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x842
// Size: 0x103
function toggle_safehouse_settings(toggle) {
    if (istrue(toggle)) {
        level.disable_hotjoin_via_ac130 = 1;
        level.dogtag_revive = 1;
        level.disable_munitions = 1;
        level.spawninsafehouse = 1;
    } else {
        if (!istrue(level.relic_dogtags)) {
            level.disable_hotjoin_via_ac130 = 0;
            level.dogtag_revive = 0;
        }
        level.disable_munitions = 0;
        level.spawninsafehouse = 0;
    }
    level notify("toggle_safehouse_settings", toggle);
    if (toggle) {
        level thread scripts\cp\cp_kidnapper::togglekidnappers(0);
        level.post_loadout_spawn_func = &post_loadout_spawn_func;
    } else {
        level thread scripts\cp\cp_kidnapper::togglekidnappers(1);
        level.post_loadout_spawn_func = undefined;
    }
    foreach (player in level.players) {
        player toggle_player_settings(toggle);
    }
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x94d
// Size: 0x141
function toggle_player_settings(toggle) {
    player = self;
    if (toggle) {
        player setdemeanorviewmodel("safe", "iw8_ges_demeanor_safe");
        player thread viewmodel_demeanor();
        player disableweaponswitch();
        player disableoffhandweapons();
        player allowmelee(0);
        player allowsupersprint(0);
        player allowsprint(0);
        player allowads(0);
        player allowcrouch(0);
        player allowprone(0);
        player allowmantle(0);
        player allowjump(0);
        player setclientomnvar("ui_briefing", 1);
        player.allowednormaldemeanor = 0;
        player.ignoreme = 1;
        return;
    }
    player notify("normal_demeanor");
    player setdemeanorviewmodel("normal");
    player enableweaponswitch();
    player enableoffhandweapons();
    player allowmelee(1);
    player allowsupersprint(1);
    player allowsprint(1);
    player allowads(1);
    player allowcrouch(1);
    player allowprone(1);
    player allowmantle(1);
    player allowjump(1);
    player setclientomnvar("ui_briefing", 0);
    player.allowednormaldemeanor = 1;
    player.ignoreme = 0;
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa96
// Size: 0x58
function viewmodel_demeanor() {
    self endon("normal_demeanor");
    self notify("viewmodel_demeanor");
    self endon("viewmodel_demeanor");
    while (true) {
        self waittill("loadout_given");
        wait 2;
        if (istrue(self.allowednormaldemeanor)) {
            self setdemeanorviewmodel("normal");
            continue;
        }
        self setdemeanorviewmodel("safe", "iw8_ges_demeanor_safe");
    }
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaf6
// Size: 0x11a
function edit_loadout_think(struct) {
    level endon("game_ended");
    model = spawn("script_model", struct.origin);
    model setmodel("tag_origin");
    model sethintobject(undefined, "HINT_BUTTON", undefined, %CP_DWN_TWN_OBJECTIVES/DWN_TWN_LOADOUT, 25, "duration_short", "hide", 256, 65, 64, 65);
    model.headicon = createheadicon(model);
    setheadiconimage(model.headicon, "hud_icon_survival_weapon");
    setheadiconsnaptoedges(model.headicon, 0);
    setheadiconmaxdistance(model.headicon, 1024);
    setheadiconnaturaldistance(model.headicon, 30);
    setheadiconzoffset(model.headicon, 10);
    while (true) {
        player = model waittill("trigger");
        if (!player is_valid_player()) {
            continue;
        }
        if (namespace_d4aab8c9cb8ecb14::player_in_laststand(player)) {
            continue;
        }
        player thread edit_loadout(model);
    }
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc18
// Size: 0x79
function edit_loadout(interaction) {
    self endon("disconnect");
    self endon("last_stand");
    level endon("game_ended");
    level thread function_54dac17e1c475546(self, interaction);
    interaction disableplayeruse(self);
    self setclientomnvar("cp_open_cac", -1);
    self setclientomnvar("ui_options_menu", 2);
    waittill_any_2("loadout_given", "loadout_menu_closed");
    wait 1;
    self setclientomnvar("cp_open_cac", -2);
    interaction enableplayeruse(self);
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc99
// Size: 0x57
function function_54dac17e1c475546(player, interaction) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("loadout_menu_closed");
    player waittill("last_stand_start");
    level thread function_61f53ed6cfde56b4(player, interaction);
    player setclientomnvar("cp_open_cac", -2);
    player clearsoundsubmix("cp_store_duck", 1);
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcf8
// Size: 0x47
function function_61f53ed6cfde56b4(player, interaction) {
    level endon("game_ended");
    player endon("disconnect");
    player endon("revive");
    player waittill("respawn_player");
    if (isdefined(interaction) && isplayer(player)) {
        interaction enableplayeruse(player);
    }
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd47
// Size: 0x5f
function mission_select_think(mission) {
    while (true) {
        player = self waittill("trigger");
        if (!player is_valid_player()) {
            continue;
        }
        self makeunusable();
        scripts\cp\cp_dialogue::stop_current_dialogue();
        thread run_mission(mission);
        level notify("mission_selected", mission);
        self.used = 1;
        return;
    }
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdae
// Size: 0x1f
function run_mission(mission) {
    delaythread(2, &scripts\cp\cp_objectives::run_objective, mission, "primary");
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdd5
// Size: 0x7a
function safehouse_revive_and_move_players(var_feff3079e90ec019) {
    foreach (player in level.players) {
        inlaststand = 0;
        if (namespace_d4aab8c9cb8ecb14::player_in_laststand(player)) {
            inlaststand = 1;
        }
        player thread player_move(var_feff3079e90ec019, index, inlaststand);
    }
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe57
// Size: 0x1d2
function player_move(var_feff3079e90ec019, index, inlaststand) {
    self endon("disconnect");
    var_feff3079e90ec019[index].angles = ter_op(isdefined(var_feff3079e90ec019[index].angles), var_feff3079e90ec019[index].angles, (0, 0, 0));
    self.respawn_forcespawnorigin = var_feff3079e90ec019[index].origin;
    self.respawn_forcespawnangles = var_feff3079e90ec019[index].angles;
    if (istrue(inlaststand)) {
        namespace_d4aab8c9cb8ecb14::instant_revive(self);
    }
    if (isdefined(self.currentturret)) {
        self.currentturret notify("kill_turret", 0, 0);
    }
    if (isdefined(level.choppergunners)) {
        foreach (gunner in level.choppergunners) {
            gunner scripts\cp_mp\killstreaks\chopper_gunner::choppergunner_returnplayer(0, 0);
        }
    }
    if (isdefined(self.helperdrone)) {
        self.helperdrone scripts\cp_mp\killstreaks\helper_drone::function_6edfda4764129e3(0);
    }
    if (istrue(self isonladder())) {
        self setorigin(getgroundposition(self.origin + anglestoforward(self.angles) * -50, 16));
        wait 0.1;
    }
    player_vehicle = scripts\cp_mp\utility\player_utility::getvehicle();
    if (isdefined(player_vehicle)) {
        seatid = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getoccupantseat(player_vehicle, self);
        scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_exit(player_vehicle, seatid, self, undefined, 1);
    }
    self setorigin(var_feff3079e90ec019[index].origin);
    self setplayerangles(var_feff3079e90ec019[index].angles);
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1031
// Size: 0x73
function num_players_in_safehouse(volume) {
    var_a25a40bdd7bf4112 = 0;
    if (isdefined(volume)) {
        foreach (player in level.players) {
            if (player istouching(volume)) {
                var_a25a40bdd7bf4112++;
            }
        }
    }
    return var_a25a40bdd7bf4112;
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10ad
// Size: 0x113
function safehouse_regroup(var_d2a2486a309653ca, flagname) {
    index = 0;
    var_4accc3dbb1732233 = 0;
    while (index < 31) {
        num_players = scripts\cp\utility\cp_safehouse_util::num_players_in_safehouse(var_d2a2486a309653ca);
        var_926aa1e4673bb544 = get_respawning_players();
        if (num_players && var_926aa1e4673bb544.size == 0) {
            level notify("player_entered_safehouse_vol");
            if (num_players == level.players.size) {
                if (!var_4accc3dbb1732233) {
                    thread objective_update("safehouse_return_timer", 6, undefined, undefined, 1, undefined, 1, 1);
                    var_4accc3dbb1732233 = 1;
                    index = int(max(index, 25));
                }
            } else if (!var_4accc3dbb1732233) {
                thread objective_update("safehouse_return_timer", 30, 20, 10, 1, undefined, 1, 1);
                var_4accc3dbb1732233 = 1;
            }
            index++;
        } else {
            if (var_4accc3dbb1732233) {
                scripts\cp\cp_objectives::lua_objective_complete("safehouse_return_timer");
                thread objective_update("safehouse_return");
                var_4accc3dbb1732233 = 0;
            }
            index = 0;
        }
        wait 1;
    }
    if (isdefined(flagname) && flag_exist(flagname)) {
        flag_set(flagname);
    }
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11c8
// Size: 0x9f
function get_respawning_players() {
    guys = [];
    foreach (player in level.players) {
        if (istrue(player.queued_up_to_respawn) || istrue(player isparachuting()) || istrue(player isskydiving()) || istrue(self.isreviving) || istrue(self.beingrevived)) {
            guys[guys.size] = player;
        }
    }
    return guys;
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1270
// Size: 0x55
function safehouse_create_loot(loot_boxes) {
    foreach (var_ffa1c8c5e081786d in loot_boxes) {
        var_ffa1c8c5e081786d thread create_fake_loot();
    }
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x12cd
// Size: 0xdc
function toggle_safehouse_doors(frozen, pos, radius, name, key) {
    var_786fd7c325a6d910 = getentitylessscriptablearray("scriptable_" + name, key, pos, radius);
    foreach (var_26baefb3804b52c3 in var_786fd7c325a6d910) {
        if (var_26baefb3804b52c3 scriptableisdoor()) {
            if (frozen) {
                timeout = 0;
                var_26baefb3804b52c3 scriptabledoorclose();
                while (!var_26baefb3804b52c3 scriptabledoorisclosed() && timeout < 10) {
                    wait 0.1;
                    timeout++;
                }
                var_26baefb3804b52c3 scriptabledoorfreeze(1);
                continue;
            }
            var_26baefb3804b52c3 scriptabledoorfreeze(0);
        }
    }
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x13b1
// Size: 0x92
function wait_for_door_open(pos, radius, name, key) {
    var_786fd7c325a6d910 = getentitylessscriptablearray("scriptable_" + name, key, pos, radius);
    foreach (var_26baefb3804b52c3 in var_786fd7c325a6d910) {
        if (var_26baefb3804b52c3 scriptableisdoor()) {
            var_26baefb3804b52c3 thread wait_for_open();
        }
    }
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x144b
// Size: 0x19
function wait_for_open() {
    while (self scriptabledoorisclosed()) {
        wait 1;
    }
    level notify("safehouse_door_opened");
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x146c
// Size: 0xd5
function play_overlord_howcopy_vo(var_b2bc8b6fd1d16561) {
    var_356974bdf96a636e = [];
    var_356973bdf96a613b = [];
    var_356974bdf96a636e[var_356974bdf96a636e.size] = "dx_cps_kama_convo_start_10";
    var_356974bdf96a636e[var_356974bdf96a636e.size] = "dx_cps_kama_convo_start_20";
    var_356974bdf96a636e[var_356974bdf96a636e.size] = "dx_cps_kama_convo_start_30";
    var_356973bdf96a613b[var_356973bdf96a613b.size] = "dx_cps_lass_convo_start_10";
    var_356973bdf96a613b[var_356973bdf96a613b.size] = "dx_cps_lass_convo_start_20";
    var_356973bdf96a613b[var_356973bdf96a613b.size] = "dx_cps_lass_convo_start_30";
    var_9ff666d3b44e5bad = undefined;
    if (isdefined(var_b2bc8b6fd1d16561)) {
        if (var_b2bc8b6fd1d16561 == "kama") {
            var_9ff666d3b44e5bad = random(var_356974bdf96a636e);
        } else if (var_b2bc8b6fd1d16561 == "lass") {
            var_9ff666d3b44e5bad = random(var_356973bdf96a613b);
        }
    } else if (cointoss()) {
        var_9ff666d3b44e5bad = random(var_356974bdf96a636e);
    } else {
        var_9ff666d3b44e5bad = random(var_356973bdf96a613b);
    }
    level namespace_49f64a73fb8b35eb::try_to_play_vo_on_team(var_9ff666d3b44e5bad, "allies");
    play_operator_reply_vo(undefined, "conv_generic_reply");
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1549
// Size: 0xd4
function play_operator_reply_vo(var_de3cab686c13ba9, var_97a10adf707c9af) {
    all_players = getplayersinteam("allies");
    var_932de1a48f2faed = [];
    foreach (player in all_players) {
        if (player scripts\cp_mp\utility\player_utility::_isalive()) {
            var_932de1a48f2faed[var_932de1a48f2faed.size] = player;
        }
    }
    var_8850d9f771525016 = random(var_932de1a48f2faed);
    if (isdefined(var_de3cab686c13ba9)) {
        var_8850d9f771525016 = var_de3cab686c13ba9;
    }
    waittime = level scripts\cp\cp_player_battlechatter::trysaylocalsound(var_8850d9f771525016, var_97a10adf707c9af);
    if (isfloat(waittime)) {
        wait waittime;
    }
    wait 0.4 + randomfloat(0.4);
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1625
// Size: 0x3a
function safehouse_hotjoin_func() {
    level endon("game_ended");
    while (true) {
        player = level waittill("player_spawned");
        if (istrue(level.spawninsafehouse)) {
            player thread safehouse_spawn();
        }
    }
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1667
// Size: 0x12f
function safehouse_spawn() {
    self endon("disconnect");
    player = self;
    player_spawned = 0;
    while (true) {
        if (isdefined(level.current_safehouse_spawn_structs)) {
            foreach (struct in level.current_safehouse_spawn_structs) {
                if (!any_player_nearby(struct.origin, 64)) {
                    if (!isdefined(struct.angles)) {
                        struct.angles = (0, 0, 0);
                    }
                    player.respawn_forcespawnorigin = struct.origin;
                    player.respawn_forcespawnangles = struct.angles;
                    player setorigin(struct.origin);
                    player setplayerangles(struct.angles);
                    player dontinterpolate();
                    player toggle_player_settings(1);
                    player_spawned = 1;
                }
            }
        }
        if (player_spawned) {
            return;
        }
        wait 0.05;
    }
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x179e
// Size: 0x74
function post_loadout_spawn_func() {
    self endon("disconnect");
    level endon("game_ended");
    while (isnullweapon(self getcurrentprimaryweapon())) {
        wait 0.05;
    }
    weaponobj = self getcurrentprimaryweapon();
    self setspawnweapon(weaponobj, 1);
    if (istrue(level.spawninsafehouse)) {
        self setdemeanorviewmodel("safe", "iw8_ges_demeanor_safe");
        toggle_player_settings(1);
        self.player_latespawn_safehouse = 1;
    }
}

// Namespace namespace_adafd08717508043 / scripts\cp\utility\cp_safehouse_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x181a
// Size: 0x89
function show_regroup_text(var_892708eff6520b44) {
    map_name = getdvar(@"ui_mapname");
    var_a1f826c73e18485b = "cp/" + map_name + "_objectives.csv";
    var_d31685c0a626ff37 = int(tablelookup(var_a1f826c73e18485b, 1, var_892708eff6520b44, 0));
    self setclientomnvar("ui_hide_hud", 0);
    self setclientomnvar("ui_chyron_mission_index", var_d31685c0a626ff37);
    self setclientomnvar("ui_chyron_on", 1);
    wait 5;
    level notify("regroup_text_done");
}

