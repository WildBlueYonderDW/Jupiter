#using script_399e7658cc79090d;
#using script_3a8f9ace195c9da9;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp\cp_hud_message;
#using scripts\cp\cp_outline_utility;
#using scripts\cp\cp_relics;
#using scripts\cp\equipment\cp_snapshot_grenade;
#using scripts\cp\equipment\nvg;
#using scripts\cp\utility;
#using scripts\cp\utility\player;
#using scripts\cp_mp\utility\player_utility;
#using scripts\engine\math;
#using scripts\engine\utility;

#namespace nvg;

// Namespace nvg / scripts\cp\equipment\nvg
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f6
// Size: 0x16d
function runnvg(var_24ad61b67a4e13e7) {
    if (!istrue(var_24ad61b67a4e13e7)) {
        if (istrue(level.disable_nvg)) {
            return;
        }
    }
    if (!isdefined(self.nvg)) {
        self.nvg = spawnstruct();
        self.nvg.lightmeter = 1;
        self.nvg.flir = 0;
        self.nvg.var_f4b7250e0b02733a = 1;
    }
    scripts\cp\utility\player::init_visionsetnight();
    thread track_player_light_meter();
    thread namespace_47fe57caebafd081::function_c105076398ebbb59();
    if (getdvarint(@"hash_da985a4b1321cc60", 0) != 0) {
        thread turn_nvgsOnOffDependingOnLight();
        return;
    }
    if (getdvarint(@"hash_ebcb3f34320b715c", 0) != 0) {
        thread nvg_runScanMechanic();
    }
    if (namespace_47fe57caebafd081::function_8d3da9226f5c8c0e()) {
        thread namespace_47fe57caebafd081::function_296ee731835b1e4b();
    }
    thread function_78104edc6ce30c69();
    if (scripts\cp\utility::function_ddafef2154fd19bb() || scripts\cp\utility::function_a3577e8e6c88a56b() || scripts\cp\utility::function_240f7f4e57340e8f()) {
        return;
    }
    if (!isai(self)) {
        val::set("runNVG", "nvg", 1);
    }
    if (!isdefined(self.pers["useNVG"])) {
        self.pers["useNVG"] = 0;
    }
    if (!isdefined(self.pers["killstreak_forcedNVGOff"])) {
        self.pers["killstreak_forcedNVGOff"] = 0;
    }
    thread nvg_monitor();
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66b
// Size: 0x2a
function function_78104edc6ce30c69() {
    self endon("disconnect");
    level endon("game_ended");
    self waittill("loadout_class_selected");
    if (namespace_1170726b2799ea65::function_f66bc987efb3cd9()) {
        self nightvisionviewon(1);
    }
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x69d
// Size: 0x143
function track_player_light_meter() {
    self endon("stop_tracking_dynolights");
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (!ent_flag_exist("in_the_dark")) {
        ent_flag_init("in_the_dark");
    }
    if (isdefined(self.nvg)) {
        self.nvg.prevlightmeter = 1;
        self.nvg.lightmeter = 1;
    }
    light_meter = 1;
    player_invisible = 0;
    thread light_meter_hud();
    light_factor = 0;
    start = (0, 0, 0);
    var_cbbfb154c6f4fffb = 0.45;
    while (true) {
        var_cbbfb154c6f4fffb = 0.1;
        light_meter = self getplayerlightlevel();
        lightmeter_lerp_lightmeter(light_meter, var_cbbfb154c6f4fffb);
        if (self.nvg.lightmeter < 0.5 && !player_invisible) {
            ent_flag_set("in_the_dark");
            player_invisible = 1;
            continue;
        }
        if (self.nvg.lightmeter >= 0.5 && player_invisible) {
            ent_flag_clear("in_the_dark");
            player_invisible = 0;
        }
    }
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e8
// Size: 0x194
function light_meter_hud() {
    self endon("disconnect");
    level endon("game_ended");
    noise = spawnstruct();
    noise.mag = 0.02;
    noise.period_min = 0.05;
    noise.period_max = 0.15;
    noise.data = [];
    noise.data["old"] = 0;
    noise.data["period"] = 0;
    noise.data["target"] = 0;
    noise.data["val"] = 0;
    noise.data["time"] = 0;
    for (var_e7c9c132ee82ad4f = 0; true; var_e7c9c132ee82ad4f = 0) {
        self.nvg waittill("update_nvg_hud");
        noise needle_noise();
        var_f665c97965854720 = self.nvg.lightmeter;
        var_f665c97965854720 = clamp(var_f665c97965854720, noise.mag, 1 - noise.mag);
        var_f665c97965854720 += noise.data["val"];
        self setclientomnvar("ui_nvg_light_meter_needle", var_f665c97965854720);
        if (var_f665c97965854720 >= 0.9 && is_nvg_on() && !var_e7c9c132ee82ad4f) {
            self playsound("item_nightvision_lightmeter_warning");
            var_e7c9c132ee82ad4f = 1;
            continue;
        }
        if (var_f665c97965854720 < 0.9 && is_nvg_on() && var_e7c9c132ee82ad4f) {
        }
    }
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x984
// Size: 0x8
function is_nvg_on() {
    return self isnightvisionon();
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x995
// Size: 0x142
function lightmeter_lerp_lightmeter(value, time) {
    curr = self.nvg.lightmeter;
    if (!isdefined(value)) {
        value = 0;
    }
    if (!isdefined(time)) {
        time = 0;
    }
    range = value - curr;
    interval = 0.05;
    count = int(time / interval);
    delta = range / count;
    while (count) {
        if (isdefined(self.nvg.prevlightmeter)) {
            self.nvg.prevlightmeter = self.nvg.lightmeter;
            self.nvg.lightmeter += delta;
        }
        self.nvg notify("update_nvg_hud");
        wait interval;
        count--;
    }
    self.nvg.prevlightmeter = self.nvg.lightmeter;
    self.nvg.lightmeter = value;
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xadf
// Size: 0x139
function needle_noise() {
    if (self.data["time"] >= self.data["period"]) {
        self.data["period"] = randomfloatrange(self.period_min, self.period_max);
        self.data["old"] = self.data["target"];
        self.data["time"] = 0;
        self.data["target"] = randomfloatrange(self.mag * -1, self.mag);
    }
    period_factor = math::normalize_value(0, self.data["period"], self.data["time"]);
    period_factor = math::function_889bef0ad1600791(period_factor);
    self.data["val"] = self.data["old"] * (1 - period_factor) + self.data["target"] * period_factor;
    self.data["time"] = self.data["time"] + 0.05;
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc20
// Size: 0xd4
function turn_nvgsOnOffDependingOnLight() {
    self endon("disconnect");
    self notify("turn_nvgsOnOffDependingOnLight");
    self endon("turn_nvgsOnOffDependingOnLight");
    while (!isdefined(self.operatorcustomization)) {
        waitframe();
    }
    while (true) {
        if (self getplayerlightlevel() >= 0.1) {
            if (istrue(self.var_e6692cc0f7db74ab)) {
                wait 2;
                if (self getplayerlightlevel() >= 0.1) {
                    self nightvisionviewoff();
                    self.var_e6692cc0f7db74ab = 0;
                    savenvgstate();
                    nvg_update3rdperson(0);
                }
            }
        } else if (!istrue(self.var_e6692cc0f7db74ab)) {
            wait 0.25;
            if (self getplayerlightlevel() < 0.1) {
                self nightvisionviewon();
                self.var_e6692cc0f7db74ab = 1;
                savenvgstate();
                nvg_update3rdperson(1);
                level notify("player_enabled_nvgs");
            }
        }
        wait 0.25;
    }
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcfc
// Size: 0x3b
function clearnvg(clearmodel) {
    if (isdefined(self.nvg3rdpersonmodel)) {
        if (clearmodel) {
            self detach(self.nvg3rdpersonmodel, "j_head");
        }
        self.nvg3rdpersonmodel = undefined;
    }
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd3f
// Size: 0x75
function turnoffnvgs() {
    foreach (player in level.players) {
        if (isalive(player)) {
            player scripts\cp\equipment\nvg::savenvgstate();
        }
        if (player isnightvisionon()) {
            player nightvisionviewoff();
        }
        player thread removenvg();
    }
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdbc
// Size: 0x18
function removenvg() {
    self setactionslot(2, "");
    self notify("nvg_removed");
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xddc
// Size: 0x4f
function savenvgstate() {
    if (self isnightvisionon()) {
        self.pers["useNVG"] = 1;
        return;
    }
    if (!self isnightvisionon() && !istrue(self.pers["killstreak_forcedNVGOff"])) {
        self.pers["useNVG"] = 0;
    }
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe33
// Size: 0xcc
function nvg_monitor() {
    self notify("nvg_monitor");
    self endon("nvg_monitor");
    self endon("disconnect");
    self endon("death");
    self endon("nvg_removed");
    for (var_941cde8837521cff = gettime(); true; var_941cde8837521cff = var_2a3902259f88e70e) {
        result = waittill_any_return_2("night_vision_on", "night_vision_off");
        if (!isdefined(result)) {
            continue;
        }
        savenvgstate();
        enabled = result == "night_vision_on";
        nvg_update3rdperson(enabled);
        if (istrue(enabled)) {
            level notify("player_enabled_nvgs");
            if (getdvarint(@"hash_ebcb3f34320b715c", 0) != 0) {
                thread nvg_runScanMechanic();
            }
        }
        var_2a3902259f88e70e = gettime();
        duration = var_2a3902259f88e70e - var_941cde8837521cff;
    }
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf07
// Size: 0xc6
function nvg_get3rdpersonupmodel() {
    modelup = undefined;
    if (isdefined(level.nvgheadoverrides[self.operatorcustomization.head])) {
        modelup = level.nvgheadoverrides[self.operatorcustomization.head]["up"];
    }
    if (!isdefined(modelup)) {
        modelup = "offhand_wm_nvgquad_mp_1_up";
    } else if (modelup == "nvg_2") {
        modelup = "offhand_wm_nvgquad_mp_2_up";
    } else if (modelup == "nvg_3") {
        modelup = "offhand_wm_nvgquad_mp_3_up";
    } else if (modelup == "nvg_4") {
        modelup = "offhand_wm_nvgquad_mp_3_up";
    } else if (modelup == "none") {
        modelup = undefined;
    } else {
        assert(0, "Invalid entry value set in level.nvgHeadOverrides for NVG Override Up");
        modelup = "offhand_wm_nvgquad_mp_1_up";
    }
    return modelup;
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfd6
// Size: 0xc6
function nvg_get3rdpersondownmodel() {
    modeldown = undefined;
    if (isdefined(level.nvgheadoverrides[self.operatorcustomization.head])) {
        modeldown = level.nvgheadoverrides[self.operatorcustomization.head]["down"];
    }
    if (!isdefined(modeldown)) {
        modeldown = "offhand_wm_nvgquad_mp_1";
    } else if (modeldown == "nvg_2") {
        modeldown = "offhand_wm_nvgquad_mp_2";
    } else if (modeldown == "nvg_3") {
        modeldown = "offhand_wm_nvgquad_mp_3";
    } else if (modeldown == "nvg_4") {
        modeldown = "offhand_wm_nvgquad_mp_4";
    } else if (modeldown == "none") {
        modeldown = undefined;
    } else {
        assert(0, "Invalid entry value set in level.nvgHeadOverrides for NVG Override Down");
        modeldown = "offhand_wm_nvgquad_mp_1";
    }
    return modeldown;
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10a5
// Size: 0xa8
function nvg_update3rdperson(enabled) {
    if (isdefined(self.nvg3rdpersonmodel)) {
        self detach(self.nvg3rdpersonmodel, "j_head");
        self.nvg3rdpersonmodel = undefined;
    }
    if (enabled) {
        modeldown = nvg_get3rdpersondownmodel();
        if (isdefined(modeldown)) {
            self.nvg3rdpersonmodel = modeldown;
            self attach(self.nvg3rdpersonmodel, "j_head");
        }
        return;
    }
    modelup = nvg_get3rdpersonupmodel();
    if (isdefined(modelup)) {
        self.nvg3rdpersonmodel = modelup;
        self attach(self.nvg3rdpersonmodel, "j_head");
    }
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1155
// Size: 0xc
function start_with_nvgs() {
    thread give_nvgs_after_delay(2);
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1169
// Size: 0x6d
function give_nvgs_after_delay(delay, var_dcb6b158a9a8d74e) {
    if (scripts\cp\utility::is_wave_gametype()) {
        self waittill("loadout_given");
    } else {
        if (!ent_flag_exist("player_spawned_with_loadout")) {
            ent_flag_init("player_spawned_with_loadout");
        }
        ent_flag_wait("player_spawned_with_loadout");
    }
    thread show_hint_after_delay(delay / 2, var_dcb6b158a9a8d74e);
    wait delay;
    self nightvisionviewon();
    thread scripts\cp\equipment\nvg::nvg_update3rdperson(1);
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11de
// Size: 0x66
function show_hint_after_delay(delay, var_dcb6b158a9a8d74e) {
    wait delay;
    time = 5;
    if (isdefined(var_dcb6b158a9a8d74e) && (isint(var_dcb6b158a9a8d74e) || isfloat(var_dcb6b158a9a8d74e))) {
        time = var_dcb6b158a9a8d74e;
    }
    if (self usinggamepad()) {
        thread scripts\cp\cp_hud_message::tutorialprint(%MP/PRESS_TO_USE_NVG, time);
        return;
    }
    thread scripts\cp\cp_hud_message::tutorialprint(%MP/PRESS_TO_USE_NVG_KB, time);
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x124c
// Size: 0x4d
function nvg_runScanMechanic() {
    self endon("disconnect");
    self notify("nvg_runScanMechanic");
    self endon("nvg_runScanMechanic");
    self.activate_radar = 0;
    self notifyonplayercommand("scope_radar_ads_in", "+speed_throw");
    self notifyonplayercommand("scope_radar_ads_out", "-speed_throw");
    thread scripts\cp\cp_relics::updatescoperadar(self);
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12a1
// Size: 0x57
function function_375575e87d552f1a(event_notifies) {
    foreach (note in event_notifies) {
        self endon(note);
    }
    self waittill("forever");
}

// Namespace nvg / scripts\cp\equipment\nvg
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1300
// Size: 0x234
function function_667cd1010758d81() {
    owner = self;
    position = self.origin;
    angles = self.angles;
    outlinedata = undefined;
    if (true) {
        outlinedata = spawnstruct();
        outlinedata.owner = owner;
        outlinedata.position = position;
        outlinedata.isalive = 1;
        outlinedata.targets = [];
        outlinedata.endtimes = [];
        outlinedata.outlineids = [];
    }
    contents = physics_createcontents(["physicscontents_missileclip", "physicscontents_glass", "physicscontents_water", "physicscontents_item", "physicscontents_vehicle"]);
    foreach (player in level.characters) {
        if (!isdefined(player)) {
            continue;
        }
        if (!player scripts\cp_mp\utility\player_utility::_isalive()) {
            continue;
        }
        if (isplayer(player)) {
            continue;
        }
        between = player.origin - position;
        distsqr = lengthsquared(between);
        if (distsqr > 4194304) {
            continue;
        }
        if (true) {
            entnum = player getentitynumber();
            outlinedata.targets[entnum] = player;
            outlinedata.endtimes[entnum] = gettime() + 2500;
            outlinedata.outlineids[entnum] = scripts\cp\cp_outline_utility::outlineenableforall(player, "snapshotgrenade", "equipment");
            if (isplayer(player)) {
                player scripts\cp\cp_outline_utility::_hudoutlineviewmodelenable("snapshotgrenade", 0);
            }
            outlinedata thread scripts\cp\equipment\cp_snapshot_grenade::snapshot_grenade_update_outlines();
        }
        if (false) {
            owner thread scripts\cp\equipment\cp_snapshot_grenade::snapshot_grenade_create_marker(player gettagorigin("j_spineupper"), player.angles, player);
        }
    }
    if (true) {
        triggerportableradarping(position, owner, 2048, 500);
    }
}

