// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace motiondetectors;

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x89b
// Size: 0x190
function init() {
    precachemodel("uk_electrical_box_medium_02_animated");
    precachemodel("uk_storage_wall_light_01");
    precachemodel("uk_storage_wall_light_01_on");
    precachemodel("uk_industrial_light_01");
    precachemodel("uk_industrial_light_01_on");
    precachemodel("p7_lights_cagelight02");
    precachemodel("p7_lights_cagelight02_on");
    precachemodel("uk_lighting_interior_office_ceiling_tile_01");
    precachemodel("uk_lighting_interior_office_ceiling_tile_01_on");
    precachemodel("uk_industrial_light_01_runner_pm");
    precachemodel("uk_industrial_light_01_runner_pm_on");
    precachemodel("ind_flood_light_standing_tall");
    precachemodel("ind_flood_light_standing_tall_on");
    precachemodel("rogue_dormitory_lobby_ceiling_light_01");
    precachemodel("rogue_dormitory_lobby_ceiling_light_01_on");
    precachemodel("light_ceiling_bulb_02_spear_pm");
    precachemodel("light_ceiling_bulb_02_spear_pm_on");
    precachemodel("me_light_ceiling_fluorescent_tube_strong_runner_pm");
    precachemodel("me_light_ceiling_fluorescent_tube_strong_runner_pm_on");
    precachemodel("me_light_ceiling_fluorescent_tube_spear_pm");
    precachemodel("me_light_ceiling_fluorescent_tube_spear_pm_on");
    precachemodel("lighting_fixtures_security_lamp_withcage_01_spear_pm");
    precachemodel("lighting_fixtures_security_lamp_withcage_01_spear_pm_on");
    precachemodel("ee_light_mounted_exterior_industrial_caged_02_spear_pm");
    precachemodel("ee_light_mounted_exterior_industrial_caged_02_spear_pm_on");
    precachemodel("ee_light_mounted_exterior_industrial_caged_02_on_green_rnr_pm");
    precachemodel("building_cable_post_light_pole_off_spear_pm");
    precachemodel("building_cable_post_light_pole_on_spear_pm");
    precachemodel("ee_electronics_television_wall_mounted_large_runner_pm");
    precachemodel("ee_electronics_television_wall_mounted_large_runner_pm_on");
    level._effect["vfx_nvg_flare"] = loadfx("vfx/iw8_mp/level/hackyard/vfx_nvg_flare.vfx");
    level._effect["vfx_nvg_flare_light_250"] = loadfx("vfx/iw8_mp/level/hackyard/vfx_nvg_flare_light_250.vfx");
    thread motiondetectors();
    script_model_anims();
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa32
// Size: 0x104
function script_model_anims() {
    level.scr_animtree["lightswitch"] = %script_model;
    level.scr_anim["lightswitch"]["interact"] = script_model%wm_eq_fusebox_plr;
    level.scr_eventanim["lightswitch"]["interact"] = %"hash_30e2b75db1e0fd58";
    level.scr_anim["lightswitch"]["interact_on"] = script_model%wm_eq_fusebox_turn_on_plr;
    level.scr_eventanim["lightswitch"]["interact_on"] = %"hash_64c2ffb439d2332";
    level.scr_animtree["switch"] = %script_model;
    level.scr_anim["switch"]["interact"] = script_model%wm_eq_fusebox_prop;
    level.scr_anim["switch"]["interact_on"] = script_model%wm_eq_fusebox_turn_on_prop;
    level.interactionanimlength = getanimlength(level.scr_anim["lightswitch"]["interact"]);
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb3d
// Size: 0x81
function motiondetectors() {
    wait(5);
    volumes = getentarray("md_volume", "script_noteworthy");
    foreach (volume in volumes) {
        var_5c72a7d5a67cf248 = volume get_target_array();
        volume thread motiondetectionproc(var_5c72a7d5a67cf248);
    }
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbc5
// Size: 0xf1
function lightonroutine(var_28f2010af77c3d08, nvglights) {
    wait(var_28f2010af77c3d08);
    if (self.code_classname == "light") {
        if (!isdefined(self.savedintensity)) {
            var_c7a32a54c0084820 = 50;
        } else {
            var_c7a32a54c0084820 = self.savedintensity;
        }
        self setlightintensity(var_c7a32a54c0084820 * 0.7);
        thread play_sound_in_space("mp_lights_int_on", self.origin);
        wait(0.1);
        thread play_loop_sound_on_entity("mp_lights_int_on_loop");
        self setlightintensity(var_c7a32a54c0084820 * 0.1);
        wait(0.05);
        self setlightintensity(var_c7a32a54c0084820 * 0.4);
        wait(0.1);
        self setlightintensity(var_c7a32a54c0084820 * 0.2);
        wait(0.15);
        self setlightintensity(var_c7a32a54c0084820);
    } else if (self.code_classname == "scriptable") {
        self setscriptablepartstate("light", "light_on");
    }
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcbd
// Size: 0xc4
function lightoffroutine(lights, nvglights) {
    foreach (light in lights) {
        if (light.code_classname == "light") {
            light setlightintensity(0);
            light thread play_sound_in_space("mp_lights_int_off", light.origin);
            light notify("stop sound" + "mp_lights_int_on_loop");
        } else if (light.code_classname == "scriptable") {
            light setscriptablepartstate("light", "power_off");
        }
    }
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd88
// Size: 0x65d
function motiondetectionproc(components) {
    level endon("game_ended");
    struct = spawnstruct();
    struct.active = undefined;
    struct.masterswitches = [];
    struct.lights = [];
    struct.models = [];
    struct.nvglights = [];
    struct.switchstatus = "motion";
    struct.lightson = 0;
    struct.detection = 0;
    struct.triggerblind = undefined;
    foreach (component in components) {
        if (component.code_classname == "light") {
            struct.lights[struct.lights.size] = component;
        } else if (isdefined(component.script_noteworthy) && component.script_noteworthy == "masterSwitch") {
            struct.masterswitches[struct.masterswitches.size] = component;
        } else if (component.code_classname == "script_model" && !isdefined(component.script_parameters)) {
            struct.models[struct.models.size] = component;
        } else if (component.code_classname == "script_origin") {
            struct.nvglights[struct.nvglights.size] = component;
        } else if (isdefined(component.script_label) && component.script_label == "blinding_volume") {
            struct.triggerblind = component;
        }
    }
    var_552a8545ba4fd95f = getscriptablearray(self.target, "targetname");
    struct.lights = array_combine(struct.lights, var_552a8545ba4fd95f);
    foreach (light in struct.lights) {
        if (light.code_classname == "light") {
            light.savedintensity = light getlightintensity();
            light setlightintensity(0);
        } else if (light.code_classname == "scriptable") {
            light setscriptablepartstate("light", "power_off");
        }
    }
    foreach (lightswitch in struct.masterswitches) {
        lightswitch thread runlightswitch(self, struct);
    }
    foreach (model in struct.models) {
        model.modelname = model.model;
    }
    if (getgametype() == "cyber") {
        if (!isdefined(level.emplights)) {
            level.emplights = [];
        }
        level.emplights = array_add(level.emplights, struct);
        if (isdefined(level.emplightsoff)) {
            level thread [[ level.emplightsoff ]]();
        }
    }
    thread onoffmodelswap(struct.models, "off");
    thread motiondetectionstatus(struct);
    while (1) {
        if (struct.switchstatus == "on") {
            self notify("masterSwitch_on");
            if (!struct.lightson) {
                thread blindplayers(struct);
                foreach (light in struct.lights) {
                    light thread lightonroutine(randomfloat(0.2), struct.nvglights);
                }
                thread onoffmodelswap(struct.models, "on");
                struct.lightson = 1;
            }
        } else if (struct.switchstatus == "motion") {
            if (struct.detection && !struct.lightson) {
                thread blindplayers(struct);
                foreach (light in struct.lights) {
                    light thread lightonroutine(randomfloat(0.2), struct.nvglights);
                    struct.lightson = 1;
                }
                thread onoffmodelswap(struct.models, "on");
                thread motiondetectioncooldown(struct);
            }
        } else if (struct.switchstatus == "off") {
            if (struct.lightson) {
                level lightoffroutine(struct.lights, struct.nvglights);
                thread onoffmodelswap(struct.models, "off");
                struct.lightson = 0;
            }
            if (isdefined(self.script_parameters) && self.script_parameters == "motion") {
                struct.switchstatus = "motion";
            }
            self notify("lights_off");
        }
        wait(0.05);
    }
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13ec
// Size: 0x199
function blindplayers(struct) {
    if (isdefined(struct.triggerblind)) {
        wait(0.4);
        foreach (player in level.players) {
            if (!isdefined(player) || !isreallyalive(player)) {
                continue;
            }
            if (player istouching(struct.triggerblind)) {
                player activatenightvisionblind();
            } else {
                foreach (light in struct.lights) {
                    if (distancesquared(light.origin, player.origin) > 230400) {
                        continue;
                    }
                    if (!namespace_3c37cb17ade254d::within_fov(player geteye(), player getplayerangles(), light.origin, 0.707106)) {
                        continue;
                    }
                    trace = namespace_2a184fc4902783dc::ray_trace(player geteye(), light.origin, undefined, namespace_2a184fc4902783dc::create_default_contents(1));
                    if (distancesquared(trace["position"], light.origin) <= 324) {
                        player activatenightvisionblind();
                        break;
                    }
                }
            }
        }
    }
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x158c
// Size: 0x93
function nameplatemanagement(struct) {
    level endon("game_ended");
    while (1) {
        if (struct.lightson == 0) {
            foreach (player in level.players) {
                if (player istouching(self)) {
                    player thread manageplayerindarkvolume(self, struct);
                }
            }
        }
        wait(0.1);
    }
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1626
// Size: 0x81
function manageplayerindarkvolume(volume, struct) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (isdefined(self.indarkvolume)) {
        return;
    }
    giveperk("specialty_spygame");
    self.indarkvolume = 1;
    while (self istouching(volume) && struct.lightson == 0) {
        wait(0.1);
    }
    removeperk("specialty_spygame");
    self.indarkvolume = undefined;
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16ae
// Size: 0xde
function motiondetectionstatus(struct) {
    level endon("game_ended");
    while (1) {
        struct.detection = 0;
        foreach (player in level.players) {
            if (player istouching(self)) {
                if (player getstance() == "stand" && length2d(player getvelocity()) > 40) {
                    struct.detection = 1;
                    struct.cooldown = 4;
                }
                if (struct.lightson) {
                    player.inmotionlight = 1;
                }
            }
        }
        wait(0.05);
    }
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1793
// Size: 0x88
function motiondetectioncooldown(struct) {
    level endon("game_ended");
    self endon("lights_off");
    self endon("masterSwitch_on");
    if (isdefined(self.script_parameters) && self.script_parameters == "motion") {
        while (struct.cooldown > 0) {
            wait(0.1);
            struct.cooldown = struct.cooldown - 0.1;
        }
    }
    struct.switchstatus = "off";
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1822
// Size: 0x3d
function runlightswitch(volume, struct) {
    level endon("game_ended");
    lightswitch = createlightswitchtrigger(volume, struct);
    if (isdefined(lightswitch)) {
        lightswitch thread watchlightswitchuse(struct);
    }
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1866
// Size: 0x30b
function createlightswitchtrigger(volume, struct) {
    var_49181284b44d5afb = spawn("script_model", self.origin, 40, 0, 60);
    var_49181284b44d5afb setmodel("uk_electrical_box_medium_02_animated");
    var_49181284b44d5afb.angles = self.angles;
    if (self.script_parameters == "motion") {
        return;
    }
    var_4cf9285c14be6131 = get_target_array();
    foreach (part in var_4cf9285c14be6131) {
        if (part.code_classname == "script_origin") {
            if (isdefined(part.script_noteworthy) && part.script_noteworthy == "sceneNode") {
                var_49181284b44d5afb.scenenode = part;
            } else {
                var_49181284b44d5afb.hintlightmodel = spawn("script_model", part.origin);
                var_49181284b44d5afb.hintlightmodel.angles = part.angles;
                var_49181284b44d5afb.hintlightmodel setmodel(part.script_noteworthy);
                var_49181284b44d5afb.hintlightmodel.modelname = part.script_noteworthy;
            }
        } else if (part.code_classname == "light") {
            var_49181284b44d5afb.hintlight = part;
            continue;
        }
    }
    if (namespace_36f464722d326bbe::isnightmap()) {
        var_49181284b44d5afb makeusable();
        var_49181284b44d5afb setusepriority(0);
        var_49181284b44d5afb setuserange(80);
        var_49181284b44d5afb sethintdisplayrange(200);
        var_49181284b44d5afb setusefov(120);
        var_49181284b44d5afb sethintdisplayfov(120);
        var_49181284b44d5afb setcursorhint("HINT_BUTTON");
        if (!namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
            var_49181284b44d5afb sethintstring("MP/LIGHT_SWITCH");
            var_49181284b44d5afb sethinticon("icon_electrical_box");
        }
    }
    if (isdefined(volume.script_parameters) && volume.script_parameters == "motion") {
        struct.switchstatus = "motion";
    } else {
        struct.switchstatus = "off";
    }
    foreach (player in level.players) {
        var_49181284b44d5afb enableplayeruse(player);
    }
    if (isdefined(var_49181284b44d5afb.hintlightmodel) && isdefined(var_49181284b44d5afb.hintlight)) {
        var_49181284b44d5afb.hintlightcolor = var_49181284b44d5afb.hintlight getlightintensity();
        var_49181284b44d5afb thread manageswitchhintlight(struct);
    }
    return var_49181284b44d5afb;
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b79
// Size: 0xd1
function watchlightswitchuse(struct) {
    level endon("game_ended");
    while (1) {
        player = self waittill("trigger");
        if (!isplayer(player)) {
            continue;
        }
        if (isdefined(struct.switchstatus) && struct.switchstatus == "on") {
            playsoundatpos(self.origin, "mp_fusebox_lever_off_npc");
        } else {
            playsoundatpos(self.origin, "mp_fusebox_lever_on_npc");
        }
        thread swapswitchstatus(getanimlength(level.scr_anim["lightswitch"]["interact"]) - 0.15, struct);
        success = lightswitchinteraction(player, struct);
        if (!success) {
            self notify("interactionCancelled");
        }
    }
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c51
// Size: 0x73
function swapswitchstatus(waittime, struct) {
    self endon("interactionCancelled");
    wait(waittime);
    if (struct.switchstatus == "motion" || struct.switchstatus == "off") {
        struct.switchstatus = "on";
        self notify("masterSwitch_on");
    } else {
        struct.switchstatus = "off";
    }
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ccb
// Size: 0xa5
function manageswitchhintlight(struct) {
    level endon("game_ended");
    while (1) {
        if (struct.switchstatus == "on") {
            self.hintlight setlightintensity(0);
            self.hintlightmodel setmodel(self.hintlightmodel.modelname);
        } else {
            self.hintlight setlightintensity(self.hintlightcolor);
            self.hintlightmodel setmodel(self.hintlightmodel.modelname + "_on");
        }
        waitframe();
    }
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d77
// Size: 0x80
function getlightswitchstatus(switches) {
    foreach (lightswitch in switches) {
        if (isdefined(lightswitch.switchstatus) && lightswitch.switchstatus == "on") {
            return "on";
        }
    }
    return "motion";
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1dff
// Size: 0xb0
function onoffmodelswap(models, state) {
    foreach (model in models) {
        if (state == "on") {
            model setmodel(model.modelname + "_on");
        } else {
            model setmodel(model.modelname);
            if (isdefined(model.flare)) {
                model.flare delete();
            }
        }
    }
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1eb6
// Size: 0xa7
function lightswitchinteraction(player, struct) {
    animname = ter_op(struct.switchstatus == "on", "interact", "interact_on");
    self.animname = "switch";
    self useanimtree(%script_model);
    self.scenenode thread anim_single_solo(self, animname);
    animlength = getanimlength(level.scr_anim["lightswitch"][animname]);
    wait(animlength);
    setdvar(@"hash_7eb1641737ab83b7", 0);
    self notify("interaction_complete");
    return 1;
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f65
// Size: 0x45
function watchplayerdeath(player) {
    self endon("interaction_complete");
    self.cancelinteraction = 0;
    while (1) {
        if (!isdefined(player) || !isreallyalive(player)) {
            self.cancelinteraction = 1;
            break;
        }
        waitframe();
    }
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1fb1
// Size: 0xe9
function create_player_rig(player, animname, var_486db5fa512a3b6b) {
    if (!isdefined(player) || isdefined(player.player_rig)) {
        return;
    }
    player.animname = animname;
    if (!isdefined(var_486db5fa512a3b6b)) {
        var_486db5fa512a3b6b = "viewhands_base_iw8";
    }
    player.player_rig = spawn("script_model", player.origin);
    player.player_rig setmodel(var_486db5fa512a3b6b);
    player.player_rig hide();
    player.player_rig.animname = animname;
    player.player_rig useanimtree(%script_model);
    player playerlinktodelta(player.player_rig, "tag_player", 1, 0, 0, 0, 0, 0, 0);
    player watch_remove_rig();
    remove_player_rig(player);
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20a1
// Size: 0x92
function remove_player_rig(player) {
    if (!isdefined(player) || !isdefined(player.player_rig)) {
        return;
    }
    player unlink();
    droppos = player getdroptofloorposition(player.origin);
    if (isdefined(droppos)) {
        player setorigin(droppos);
    } else {
        player setorigin(player.origin + (0, 0, 100));
    }
    player.player_rig delete();
    player.player_rig = undefined;
}

// Namespace motiondetectors/namespace_91812d9f6e7b8a2b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x213a
// Size: 0x1d
function watch_remove_rig(struct) {
    waittill_any_2("remove_rig", "death_or_disconnect");
}

