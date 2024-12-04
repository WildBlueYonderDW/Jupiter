#using scripts\common\heartbeat;
#using scripts\engine\math;
#using scripts\engine\utility;

#namespace swim_common;

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0xa6f
// Size: 0x1a4
function function_e05aeec06b7b52aa(var_dc6dc154664cf0aa, var_575e6f276810675e, var_a1e7fb7b162a7323, enterfunc, exitfunc, surfaceFunc, descendfunc, playsoundfunc, visionsetfunc, drownfunc, var_bb67e91ffc4e7632, var_cc3e168e41362ff2) {
    setdvarifuninitialized(@"hash_2a4f08bc79265550", 0);
    level.swim = spawnstruct();
    level.swim.var_dc6dc154664cf0aa = var_dc6dc154664cf0aa;
    level.swim.var_575e6f276810675e = var_575e6f276810675e;
    level.swim.var_a1e7fb7b162a7323 = var_a1e7fb7b162a7323;
    level.swim.enterfunc = enterfunc;
    level.swim.exitfunc = exitfunc;
    level.swim.surfaceFunc = surfaceFunc;
    level.swim.descendfunc = descendfunc;
    level.swim.playsoundfunc = playsoundfunc;
    level.swim.visionsetfunc = visionsetfunc;
    level.swim.drownfunc = drownfunc;
    level.swim.var_6fed0ef13f84a258 = var_bb67e91ffc4e7632;
    level.swim.var_cc3e168e41362ff2 = var_cc3e168e41362ff2;
    level.swim.sfx = function_a1f804a91db4e6c2();
    function_76828ba8fde01e05();
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc1b
// Size: 0xb24
function function_a1f804a91db4e6c2() {
    sfx = spawnstruct();
    sfx function_aa21b4352ca3b832(["sfx", "surface", "slow", "quiet", "plr"], "mvmt_swim_surfacing_plr_slow");
    sfx function_aa21b4352ca3b832(["sfx", "surface", "slow", "quiet", "npc"], "mvmt_swim_surfacing_npc_slow");
    sfx function_aa21b4352ca3b832(["sfx", "surface", "slow", "breath", "plr"], "mvmt_swim_surfacing_plr_slow_gasping");
    sfx function_aa21b4352ca3b832(["sfx", "surface", "slow", "breath", "npc"], "mvmt_swim_surfacing_npc_slow_gasping");
    sfx function_aa21b4352ca3b832(["sfx", "surface", "slow", "gasp", "plr"], "mvmt_swim_surfacing_plr_slow_gasping");
    sfx function_aa21b4352ca3b832(["sfx", "surface", "slow", "gasp", "npc"], "mvmt_swim_surfacing_npc_slow_gasping");
    sfx function_aa21b4352ca3b832(["sfx", "surface", "fast", "quiet", "plr"], "mvmt_swim_surfacing_plr_sprint");
    sfx function_aa21b4352ca3b832(["sfx", "surface", "fast", "quiet", "npc"], "mvmt_swim_surfacing_npc_sprint");
    sfx function_aa21b4352ca3b832(["sfx", "surface", "fast", "breath", "plr"], "mvmt_swim_surfacing_plr_sprint_gasping");
    sfx function_aa21b4352ca3b832(["sfx", "surface", "fast", "breath", "npc"], "mvmt_swim_surfacing_npc_sprint_gasping");
    sfx function_aa21b4352ca3b832(["sfx", "surface", "fast", "gasp", "plr"], "mvmt_swim_surfacing_plr_sprint_gasping");
    sfx function_aa21b4352ca3b832(["sfx", "surface", "fast", "gasp", "npc"], "mvmt_swim_surfacing_npc_sprint_gasping");
    sfx function_aa21b4352ca3b832(["sfx", "descend", "slow", "quiet", "plr"], "mvmt_swim_plunging_plr_slow");
    sfx function_aa21b4352ca3b832(["sfx", "descend", "slow", "quiet", "npc"], "mvmt_swim_plunging_npc_slow");
    sfx function_aa21b4352ca3b832(["sfx", "descend", "slow", "breath", "plr"], "mvmt_swim_plunging_plr_slow_inhaling");
    sfx function_aa21b4352ca3b832(["sfx", "descend", "slow", "breath", "npc"], "mvmt_swim_plunging_npc_slow_inhaling");
    sfx function_aa21b4352ca3b832(["sfx", "descend", "slow", "gasp", "plr"], "mvmt_swim_plunging_plr_slow_inhaling");
    sfx function_aa21b4352ca3b832(["sfx", "descend", "slow", "gasp", "npc"], "mvmt_swim_plunging_npc_slow_inhaling");
    sfx function_aa21b4352ca3b832(["sfx", "descend", "fast", "quiet", "plr"], "mvmt_swim_plunging_plr_sprint");
    sfx function_aa21b4352ca3b832(["sfx", "descend", "fast", "quiet", "npc"], "mvmt_swim_plunging_npc_sprint");
    sfx function_aa21b4352ca3b832(["sfx", "descend", "fast", "breath", "plr"], "mvmt_swim_plunging_plr_sprint_inhaling");
    sfx function_aa21b4352ca3b832(["sfx", "descend", "fast", "breath", "npc"], "mvmt_swim_plunging_npc_sprint_inhaling");
    sfx function_aa21b4352ca3b832(["sfx", "descend", "fast", "gasp", "plr"], "mvmt_swim_plunging_plr_sprint_inhaling");
    sfx function_aa21b4352ca3b832(["sfx", "descend", "fast", "gasp", "npc"], "mvmt_swim_plunging_npc_sprint_inhaling");
    sfx function_aa21b4352ca3b832(["dlg", "surface", "slow", "quiet", "plr"], "plr_breath_swim_surface_inh");
    sfx function_aa21b4352ca3b832(["dlg", "surface", "slow", "quiet", "npc"], "npc_breath_swim_surface_inh");
    sfx function_aa21b4352ca3b832(["dlg", "surface", "slow", "breath", "plr"], "plr_breath_swim_surface_gasp_inh");
    sfx function_aa21b4352ca3b832(["dlg", "surface", "slow", "breath", "npc"], "npc_breath_swim_surface_gasp_inh");
    sfx function_aa21b4352ca3b832(["dlg", "surface", "slow", "gasp", "plr"], "plr_breath_swim_surface_gasp_inh");
    sfx function_aa21b4352ca3b832(["dlg", "surface", "slow", "gasp", "npc"], "npc_breath_swim_surface_gasp_inh");
    sfx function_aa21b4352ca3b832(["dlg", "surface", "fast", "quiet", "plr"], "plr_breath_swim_surface_inh");
    sfx function_aa21b4352ca3b832(["dlg", "surface", "fast", "quiet", "npc"], "npc_breath_swim_surface_inh");
    sfx function_aa21b4352ca3b832(["dlg", "surface", "fast", "breath", "plr"], "plr_breath_swim_surface_gasp_sprint_inh");
    sfx function_aa21b4352ca3b832(["dlg", "surface", "fast", "breath", "npc"], "npc_breath_swim_surface_gasp_sprint_inh");
    sfx function_aa21b4352ca3b832(["dlg", "surface", "fast", "gasp", "plr"], "plr_breath_swim_surface_gasp_sprint_inh");
    sfx function_aa21b4352ca3b832(["dlg", "surface", "fast", "gasp", "npc"], "npc_breath_swim_surface_gasp_sprint_inh");
    sfx function_aa21b4352ca3b832(["dlg", "descend", "slow", "quiet", "plr"], "plr_breath_swim_descend_inh");
    sfx function_aa21b4352ca3b832(["dlg", "descend", "slow", "quiet", "npc"], "npc_breath_swim_descend_inh");
    sfx function_aa21b4352ca3b832(["dlg", "descend", "slow", "breath", "plr"], "plr_breath_swim_descend_gasp_inh");
    sfx function_aa21b4352ca3b832(["dlg", "descend", "slow", "breath", "npc"], "npc_breath_swim_descend_gasp_inh");
    sfx function_aa21b4352ca3b832(["dlg", "descend", "slow", "gasp", "plr"], "plr_breath_swim_descend_gasp_inh");
    sfx function_aa21b4352ca3b832(["dlg", "descend", "slow", "gasp", "npc"], "npc_breath_swim_descend_gasp_inh");
    sfx function_aa21b4352ca3b832(["dlg", "descend", "fast", "quiet", "plr"], "plr_breath_swim_descend_inh");
    sfx function_aa21b4352ca3b832(["dlg", "descend", "fast", "quiet", "npc"], "npc_breath_swim_descend_inh");
    sfx function_aa21b4352ca3b832(["dlg", "descend", "fast", "breath", "plr"], "plr_breath_swim_descend_gasp_sprint_inh");
    sfx function_aa21b4352ca3b832(["dlg", "descend", "fast", "breath", "npc"], "npc_breath_swim_descend_gasp_sprint_inh");
    sfx function_aa21b4352ca3b832(["dlg", "descend", "fast", "gasp", "plr"], "plr_breath_swim_descend_gasp_sprint_inh");
    sfx function_aa21b4352ca3b832(["dlg", "descend", "fast", "gasp", "npc"], "npc_breath_swim_descend_gasp_sprint_inh");
    return sfx;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1748
// Size: 0x50
function function_76828ba8fde01e05() {
    level._effect["swim_bubbles_light"] = loadfx("vfx/iw9/core/swimming/vfx_swim_gasp_bubbles_0.vfx");
    level._effect["swim_gasp_bubbles"] = loadfx("vfx/iw9/core/swimming/vfx_swim_gasp_bubbles_1.vfx");
    level._effect["swim_drowning_bubbles"] = loadfx("vfx/iw9/core/swimming/vfx_swim_gasp_bubbles_2.vfx");
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17a0
// Size: 0x6e
function function_aa21b4352ca3b832(keys, sfx) {
    i = 0;
    currentstruct = self;
    while (true) {
        if (keys.size > i + 1) {
            currentstruct function_cf9cebe58c49f708(keys[i]);
        } else {
            currentstruct function_e3e506e52aacfb27(keys[i], sfx);
            break;
        }
        currentstruct = currentstruct.array[keys[i]];
        i++;
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1816
// Size: 0xa4
function function_8c913c3634f4a84e(keys) {
    currentstruct = level.swim.sfx;
    i = 0;
    foreach (key in keys) {
        if (keys.size > i + 1) {
            currentstruct = currentstruct.array[key];
        } else {
            return currentstruct.array[key];
        }
        i++;
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18c2
// Size: 0x42
function function_cf9cebe58c49f708(key) {
    if (!isdefined(self.array)) {
        self.array = [];
    }
    if (!isdefined(self.array[key])) {
        self.array[key] = spawnstruct();
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x190c
// Size: 0x46
function function_e3e506e52aacfb27(key, sfx) {
    if (!isdefined(self.array)) {
        self.array = [];
    }
    if (!isdefined(self.array[key])) {
        self.array[key] = sfx;
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x195a
// Size: 0x10e
function function_fc7d07d4cc7ae9f1() {
    if (isdefined(self.swim)) {
        return;
    }
    self.swim = spawnstruct();
    self.swim.breath = 100;
    self.swim.underwater = 0;
    self.swim.swimming = 0;
    self.swim.breathcritical = 0;
    self.swim.drowning = 0;
    self.swim.sprinting = 0;
    self.swim.heartbeat = 0;
    self.swim.sfxstate = "none";
    function_5bcf4e2bd107536f();
    thread function_d2c67316e3340d42();
    thread deathcleanup();
    self endon("death");
    self endon("disconnect");
    self endon("showing_final_killcam");
    function_ef73345010f390f4();
    childthread function_d126e1e30aae39f();
    childthread watchswim();
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a70
// Size: 0x36
function function_d126e1e30aae39f() {
    while (true) {
        waittill_any_6("swim_begin", "swim_end", "swim_breathing_disabled_end", "swim_breathing_disabled_begin", "vehicle_enter", "vehicle_exit");
        function_ef73345010f390f4();
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1aae
// Size: 0xc6
function function_ef73345010f390f4() {
    isplayerswimming = self isswimming();
    var_d3db8fc9b08a281e = [[ level.swim.var_6fed0ef13f84a258 ]]();
    if (var_d3db8fc9b08a281e) {
        function_9a01935a05b613e4();
    } else if (isplayerswimming && !var_d3db8fc9b08a281e) {
        function_4594e9dcebf2c645();
    } else {
        function_b66c4e6d072630c(1.5);
    }
    if (var_d3db8fc9b08a281e && !self.swim.underwater) {
        childthread function_178428152f0b5e74();
    }
    if (!var_d3db8fc9b08a281e && self.swim.underwater) {
        childthread function_8173a7a676c2aa00();
    }
    self setclientomnvar("swim_under_water", self.swim.underwater);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b7c
// Size: 0x2c
function watchswim() {
    while (true) {
        waittill_any_4("swim_begin", "swim_end", "vehicle_enter", "vehicle_exit");
        function_4f0c9995f869868a();
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bb0
// Size: 0x53
function function_4f0c9995f869868a() {
    if (function_d59269bc793fe756() && !self.swim.swimming) {
        childthread playerswimming();
    }
    if (!function_d59269bc793fe756() && self.swim.swimming) {
        childthread function_1a0fcd6bae3d2370();
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c0b
// Size: 0x8
function function_d59269bc793fe756() {
    return self isswimming();
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c1c
// Size: 0xbb
function function_d2c67316e3340d42() {
    var_946b001669de27fb = [self.swim.swimoverlay, self.swim.var_28a9dbf4ce30fa86];
    var_946b001669de27fb = [self.swim.swimoverlay];
    waittill_any_3("death", "disconnect", "showing_final_killcam");
    foreach (var_bed6393fb2e34b6a in var_946b001669de27fb) {
        if (isdefined(var_bed6393fb2e34b6a)) {
            var_bed6393fb2e34b6a destroy();
        }
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cdf
// Size: 0x21
function deathcleanup() {
    self endon("disconnect");
    waittill_any_2("death", "showing_final_killcam");
    function_3b00a7c45356a6e1();
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d08
// Size: 0x28
function function_3b00a7c45356a6e1() {
    function_40d220afd2eb67b5();
    function_179cdce690151ad6();
    function_38fe3b60e5adf79c();
    function_aa183ca1083d279();
    self.swim = undefined;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d38
// Size: 0x10
function function_40d220afd2eb67b5() {
    self setclientomnvar("swim_breath_meter_hide", 1);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d50
// Size: 0xe
function function_179cdce690151ad6() {
    function_b66c4e6d072630c(0.05);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d66
// Size: 0x24
function function_38fe3b60e5adf79c() {
    self setscriptablepartstate("swimDebris", "aboveWater");
    self setscriptablepartstate("swimBubbles", "aboveWater");
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d92
// Size: 0x6c
function function_8173a7a676c2aa00() {
    self notify("scr_change_breath_state");
    self endon("scr_change_breath_state");
    self.swim.underwater = 0;
    childthread function_39bc9721e2da8f9c();
    childthread function_458135edd51d48b8();
    childthread function_a3b4435c21f67884();
    childthread function_da4d3d2e5560fe3a();
    function_aa183ca1083d279();
    function_542add828c78e976();
    self childthread [[ level.swim.surfaceFunc ]]();
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e06
// Size: 0x67
function function_178428152f0b5e74() {
    self notify("scr_change_breath_state");
    self endon("scr_change_breath_state");
    self.swim.underwater = 1;
    childthread function_5d9e116115d3c60d();
    childthread function_3b40f73c6038a3b0();
    childthread function_fb5bfd7783364f80();
    childthread function_e8c44b4b292c651d();
    childthread function_3a7925b414e10c37();
    self childthread [[ level.swim.descendfunc ]]();
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e75
// Size: 0x3f
function playerswimming() {
    self notify("scr_change_swim_state");
    self endon("scr_change_swim_state");
    self.swim.swimming = 1;
    self childthread [[ level.swim.enterfunc ]]();
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ebc
// Size: 0x3e
function function_1a0fcd6bae3d2370() {
    self notify("scr_change_swim_state");
    self endon("scr_change_swim_state");
    self.swim.swimming = 0;
    self childthread [[ level.swim.exitfunc ]]();
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f02
// Size: 0x23
function isplayerunderwater() {
    return isdefined(self.swim) && self.swim.underwater;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f2e
// Size: 0x23
function isplayerswimming() {
    return isdefined(self.swim) && self.swim.swimming;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f5a
// Size: 0x8a
function function_b66c4e6d072630c(time) {
    if (self.swim.sfxstate == "none") {
        return;
    }
    self.swim.sfxstate = "none";
    self clearsoundsubmix("player_swimming_underwater", 0.2);
    self clearsoundsubmix("iw9_player_drowning", 0);
    self clearsoundsubmix("iw9_underwater_vo", 1);
    self setentitysoundcontext("atmosphere", "");
    self clearclienttriggeraudiozone(0.1);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fec
// Size: 0x89
function function_4594e9dcebf2c645() {
    if (self.swim.sfxstate == "surface") {
        return;
    }
    self.swim.sfxstate = "surface";
    self clearsoundsubmix("player_swimming_underwater", 0.2);
    self clearsoundsubmix("iw9_player_drowning", 0);
    self clearsoundsubmix("iw9_underwater_vo", 1);
    self setentitysoundcontext("atmosphere", "water_surface");
    self clearclienttriggeraudiozone(0.1);
    self notify("jup_swim_surface");
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x207d
// Size: 0x7f
function function_9a01935a05b613e4() {
    if (self.swim.sfxstate == "submerged") {
        return;
    }
    self.swim.sfxstate = "submerged";
    self setsoundsubmix("iw9_underwater_vo");
    self setsoundsubmix("player_swimming_underwater", 0.1);
    self setentitysoundcontext("atmosphere", "underwater");
    self setclienttriggeraudiozone("underwater", 0.1);
    self notify("jup_swim_submerge");
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2104
// Size: 0x64
function function_2e58c560f3d8e570() {
    plrsfx = "mvmt_swim_gagging_plr_bubbles";
    var_efd3348b30946966 = "plr_breath_swim_pain_gag";
    if (soundexists(plrsfx)) {
        self [[ level.swim.playsoundfunc ]](plrsfx);
    }
    if (soundexists(var_efd3348b30946966)) {
        self [[ level.swim.playsoundfunc ]](var_efd3348b30946966);
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2170
// Size: 0x78
function function_57108400022fb733() {
    plrsfx = "mvmt_swim_plr_bubbles_light";
    var_efd3348b30946966 = "";
    if (plrsfx != "") {
        if (soundexists(plrsfx)) {
            self [[ level.swim.playsoundfunc ]](plrsfx);
        }
    }
    if (var_efd3348b30946966 != "") {
        if (soundexists(var_efd3348b30946966)) {
            self [[ level.swim.playsoundfunc ]](var_efd3348b30946966);
        }
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21f0
// Size: 0x76
function function_38f601b8026c2203() {
    plrsfx = "mvmt_swim_gagging_plr_bubbles_critical";
    var_efd3348b30946966 = "plr_breath_swim_pain_choke";
    if (randomintrange(0, 1)) {
        var_efd3348b30946966 = "plr_breath_swim_pain_gag";
    }
    if (soundexists(plrsfx)) {
        self [[ level.swim.playsoundfunc ]](plrsfx);
    }
    if (soundexists(var_efd3348b30946966)) {
        self [[ level.swim.playsoundfunc ]](var_efd3348b30946966);
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x226e
// Size: 0x1a
function function_a3b4435c21f67884() {
    if (!function_c2be12529b0f0ad2()) {
        return;
    }
    function_aae8f85a278e89();
    function_a4cc23314a609ed7();
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2290
// Size: 0x1a
function function_e8c44b4b292c651d() {
    if (!function_c2be12529b0f0ad2()) {
        return;
    }
    function_c400314c2dd6fbb0();
    function_3971e4c5bcf1b9b2();
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22b2
// Size: 0x13
function function_c400314c2dd6fbb0() {
    self setscriptablepartstate("swimDebris", "underWater");
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22cd
// Size: 0x13
function function_aae8f85a278e89() {
    self setscriptablepartstate("swimDebris", "aboveWater");
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22e8
// Size: 0x13
function function_3971e4c5bcf1b9b2() {
    self setscriptablepartstate("swimBubbles", "bubblesEnter");
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2303
// Size: 0x13
function function_a4cc23314a609ed7() {
    self setscriptablepartstate("swimBubbles", "aboveWater");
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x231e
// Size: 0x37
function function_3a2421785a1b420f() {
    self thread [[ level.swim.var_cc3e168e41362ff2 ]]("swim_gasp_bubbles", "swim_breathing_disabled_end", 3);
    self setscriptablepartstate("swimBubbles", "bubblesHeavy");
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x235d
// Size: 0x26
function function_110be15783d6c5e2() {
    self thread [[ level.swim.var_cc3e168e41362ff2 ]]("swim_bubbles_light", "swim_breathing_disabled_end", 3);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x238b
// Size: 0x26
function function_22d90d196efbb4a8() {
    self thread [[ level.swim.var_cc3e168e41362ff2 ]]("swim_drowning_bubbles", "swim_breathing_disabled_end", 3);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x23b9
// Size: 0x35
function playsoundalias(plrsfx, npcsfx, soundsource) {
    self [[ level.swim.playsoundfunc ]](plrsfx, npcsfx, soundsource);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23f6
// Size: 0x13
function function_da4d3d2e5560fe3a() {
    if (!function_c2be12529b0f0ad2()) {
        return;
    }
    dof_surface();
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2411
// Size: 0x9
function function_3a7925b414e10c37() {
    dof_descend();
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2422
// Size: 0x16
function dof_surface() {
    if (!isdefined(level.dyndof)) {
        self disablephysicaldepthoffieldscripting();
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2440
// Size: 0x36
function dof_descend() {
    if (!isdefined(level.dyndof)) {
        self enablephysicaldepthoffieldscripting(1);
        self setphysicaldepthoffield(1, 200, 100);
        self setphysicalviewmodeldepthoffield(6, 100);
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x247e
// Size: 0x3c
function function_458135edd51d48b8() {
    self.swim.swimoverlay fadeovertime(1);
    self.swim.swimoverlay.alpha = 0;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24c2
// Size: 0x46
function function_3b40f73c6038a3b0() {
    self.swim.swimoverlay fadeovertime(0.05);
    while (true) {
        waittillframeend();
        if (function_c2be12529b0f0ad2()) {
            updateSwimOverlayColor();
            function_66cd16083cc71a78();
        }
        wait 0.05;
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2510
// Size: 0xf9
function function_fb5bfd7783364f80() {
    var_6fcfedc89a8dc3d5 = 0;
    var_21c40030c467a5f6 = function_d4a3e79cc1808058();
    while (true) {
        waittillframeend();
        if (function_ea8199f09c110522()) {
            pulsetime = self.heartbeat.pulsetime;
            time = gettime();
            if (pulsetime > 0.9 && !var_6fcfedc89a8dc3d5) {
                if (function_c2be12529b0f0ad2()) {
                    factor = math::normalize_value(0, var_21c40030c467a5f6, self.swim.breath);
                    if (factor > 0.66) {
                        heartbeat = "heartbeatLight";
                    } else if (factor > 0.33) {
                        heartbeat = "heartbeatMed";
                    } else {
                        heartbeat = "heartbeatHeavy";
                    }
                    childthread scripts\common\heartbeat::function_b7c36a804415225b(heartbeat);
                }
                var_6fcfedc89a8dc3d5 = 1;
            } else if (pulsetime < 0.5 && var_6fcfedc89a8dc3d5) {
                var_6fcfedc89a8dc3d5 = 0;
            }
        }
        wait 0.05;
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2611
// Size: 0x2bf
function function_5d9e116115d3c60d() {
    if (getdvarint(@"hash_42deeb1fb385c72", 1) == 1) {
        self setclientomnvar("swim_breath_meter_hide", 0);
    }
    var_4ab9ecb27b15881d = function_90c418d9bae08d74(0.66);
    var_4ab9e9b27b158184 = function_90c418d9bae08d74(0.33);
    starttime = gettime();
    for (godmode = 0; true; godmode = swim_drown(godmode)) {
        while (self.swim.breath > 0) {
            godmode = 0;
            var_fd9f67f7fb502bd3 = [[ function_706e311766a84377() ]]();
            if (getdvarint(@"hash_2a4f08bc79265550")) {
                self.swim.breath = 100;
            } else {
                if (istrue(self.var_5239162658be30d6) && istrue(self.gasmaskequipped)) {
                    self.swim.breath = 100;
                }
                if (!function_9b65944d3ce0f852()) {
                    self.swim.breath -= 100 / var_fd9f67f7fb502bd3 * 0.05;
                    self.swim.breath = clamp(self.swim.breath, 0, 100);
                }
            }
            if (self function_635e39fc16a64657() && !self.swim.sprinting) {
                self setclientomnvar("swim_breath_meter_sprint", 1);
                self.swim.sprinting = 1;
            } else if (!self function_635e39fc16a64657() && self.swim.sprinting) {
                self setclientomnvar("swim_breath_meter_sprint", 0);
                self.swim.sprinting = 0;
            }
            if (!var_4ab9ecb27b15881d && function_90c418d9bae08d74(0.66)) {
                lightbubbles();
                var_4ab9ecb27b15881d = 1;
            }
            if (!var_4ab9e9b27b158184 && function_90c418d9bae08d74(0.33)) {
                lightbubbles();
                var_4ab9e9b27b158184 = 1;
            }
            if (!function_7e903535100a53f3() && function_3776bacc92b445d3()) {
                function_f53f052ec435e9c5();
            }
            if (!function_ea8199f09c110522() && function_e40b04d1193aa8c3()) {
                function_2635b692c9c491b4();
                function_1bb8793f81f3dd35();
            }
            self setclientomnvar("swim_breath_meter_percent", int(self.swim.breath));
            self function_746d32fac66e0b73(int(self.swim.breath));
            wait 0.05;
        }
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28d8
// Size: 0x113
function swim_drown(wasgodmode) {
    self endon("swim_stop_drowning");
    self notify("swim_start_drowning");
    var_cecfcb613ccbacba = undefined;
    if (wasgodmode) {
        wait 0.5;
    } else {
        function_9ab56eff95d3d9b7();
        if (true) {
            self setclienttriggeraudiozone("underwater_deathsdoor", 4);
            if (isdefined(level.var_372a9eab717e5d8d)) {
                vision = level.var_372a9eab717e5d8d;
            } else {
                vision = "drowning";
            }
            self [[ level.swim.visionsetfunc ]](vision, 3.6);
            childthread function_40de065884e608bf(4);
        }
        starttime = gettime();
        while (true) {
            waitframe();
            if (gettime() - starttime > 4000) {
                break;
            }
        }
        function_4d1eaa072369ad4b();
        var_cecfcb613ccbacba = self [[ level.swim.drownfunc ]]();
    }
    self dodamage(self.health + 10000, self.origin, self, self, "MOD_SUICIDE", var_cecfcb613ccbacba, "torso_upper");
    return true;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29f4
// Size: 0x37
function function_9368fff2b3156346(isdisable) {
    if (!isdefined(self.swim)) {
        return;
    }
    self.swim.var_6d1e5466170ac355 = ter_op(isdisable, 1, undefined);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a33
// Size: 0x25
function function_9b65944d3ce0f852() {
    if (!isdefined(self.swim)) {
        return false;
    }
    return istrue(self.swim.var_6d1e5466170ac355);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a61
// Size: 0xa8
function function_40de065884e608bf(timer) {
    self endon("death_or_disconnect");
    level endon("mission_fail");
    level endon("game_ended");
    for (waittimeplus = 0.6; true; waittimeplus = clamp(waittimeplus, 0, 1)) {
        function_21dafdba97771de8();
        waittime = randomfloatrange(0.8, 1.15) + waittimeplus;
        wait waittime;
        timer -= waittime;
        if (self getclientomnvar("swim_breath_meter_critical") == 3 || !self.swim.drowning || timer <= 0) {
            break;
        }
        waittimeplus -= 0.3;
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b11
// Size: 0x35
function function_a05de828303d4bed() {
    if (function_bab53c4f3c6062b9()) {
        if (true) {
            childthread function_7a964640cf87f4fa();
        }
        self.swim.drowning = 0;
        self notify("swim_stop_drowning");
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b4e
// Size: 0x4b
function function_7a964640cf87f4fa() {
    self endon("swim_start_drowning");
    self [[ level.swim.visionsetfunc ]]("drowning_cleared", 1);
    wait 1.05;
    self [[ level.swim.visionsetfunc ]]("", 1);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba1
// Size: 0xeb
function function_39bc9721e2da8f9c() {
    while (self.swim.breath < 100) {
        self.swim.breath += 0.05 / [[ level.swim.var_a1e7fb7b162a7323 ]]() * 100;
        self.swim.breath = clamp(self.swim.breath, 1, 100);
        self setclientomnvar("swim_breath_meter_percent", int(self.swim.breath));
        self function_746d32fac66e0b73(int(self.swim.breath));
        wait 0.05;
    }
    self setclientomnvar("swim_breath_meter_hide", 1);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c94
// Size: 0x195
function function_8c3428aeb7c8b1f4(amount, var_3918dd3a9b1b12a9) {
    self endon("scr_change_breath_state");
    breathfunc = level.swim.var_a1e7fb7b162a7323;
    if (isdefined(var_3918dd3a9b1b12a9)) {
        breathfunc = var_3918dd3a9b1b12a9;
    }
    while (self.swim.breath <= amount) {
        self.swim.breath += 0.05 / [[ breathfunc ]]() * amount;
        self.swim.breath = clamp(self.swim.breath, 1, 100);
        self setclientomnvar("swim_breath_meter_percent", int(self.swim.breath));
        self function_746d32fac66e0b73(int(self.swim.breath));
        var_21c40030c467a5f6 = function_d4a3e79cc1808058();
        if (self.swim.breath > var_21c40030c467a5f6 && function_ea8199f09c110522()) {
            function_aa183ca1083d279();
            self clearsoundsubmix("iw9_player_drowning", 0);
            self setclienttriggeraudiozone("underwater", 5);
        }
        heartbeatthreshold = function_75a367e461c6389a();
        if (self.swim.breath > heartbeatthreshold && function_7e903535100a53f3()) {
            function_542add828c78e976();
        }
        wait 0.05;
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e31
// Size: 0x1a
function function_1bb8793f81f3dd35() {
    if (!function_c2be12529b0f0ad2()) {
        return;
    }
    function_2e58c560f3d8e570();
    function_3a2421785a1b420f();
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e53
// Size: 0x10
function lightbubbles() {
    function_57108400022fb733();
    function_110be15783d6c5e2();
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e6b
// Size: 0x1a
function function_21dafdba97771de8() {
    if (!function_c2be12529b0f0ad2()) {
        return;
    }
    function_38f601b8026c2203();
    function_22d90d196efbb4a8();
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e8d
// Size: 0x169
function updateSwimOverlayColor() {
    var_21c40030c467a5f6 = function_d4a3e79cc1808058();
    if (isdefined(level.var_19d38dec02a818ce) && [[ level.var_19d38dec02a818ce ]]("player", "updateSwimOverlayColor")) {
        colorfunc = [[ level.var_49b393a31d0b0b95 ]]("player", "updateSwimOverlayColor");
        color = [[ colorfunc ]](self.swim.breath, function_ea8199f09c110522(), var_21c40030c467a5f6, 100);
        self.swim.swimoverlay.color = color;
        return;
    }
    if (function_ea8199f09c110522()) {
        colormax = (0.2, 0.1, 0.1);
        colormin = (0.25, 0.05, 0.05);
        factor = math::normalize_value(0, var_21c40030c467a5f6, self.swim.breath);
    } else {
        colormax = (0.2, 0.2, 0.2);
        colormin = (0.1, 0.1, 0.1);
        factor = math::normalize_value(var_21c40030c467a5f6, 100, self.swim.breath);
    }
    color = math::factor_value(colormin, colormax, factor);
    self.swim.swimoverlay.color = color;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ffe
// Size: 0x13b
function function_66cd16083cc71a78() {
    var_21c40030c467a5f6 = function_d4a3e79cc1808058();
    /#
        if (!isdefined(self.heartbeat)) {
            assertmsg("<dev string:x1c>");
        }
    #/
    if (function_ea8199f09c110522()) {
        var_bb45e9e6f61e1633 = 0.1;
        var_e3c581a803bd0fa5 = 0.2;
        var_3179113a20b106b9 = 0.5;
        var_1e4a3810e3cce69f = 0.75;
        factor = math::normalize_value(0, var_21c40030c467a5f6, self.swim.breath);
    } else {
        var_bb45e9e6f61e1633 = 0;
        var_e3c581a803bd0fa5 = 0.3;
        var_3179113a20b106b9 = 0.2;
        var_1e4a3810e3cce69f = 0.6;
        factor = math::normalize_value(var_21c40030c467a5f6, 100, self.swim.breath);
    }
    maxalpha = math::factor_value(var_1e4a3810e3cce69f, var_3179113a20b106b9, factor);
    var_e26b36a6df3106dd = math::factor_value(var_e3c581a803bd0fa5, var_bb45e9e6f61e1633, factor);
    self.swim.swimoverlay.alpha = math::factor_value(var_e26b36a6df3106dd, maxalpha, self.heartbeat.pulsetime);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3141
// Size: 0x38
function function_3776bacc92b445d3() {
    if (!isdefined(self.swim)) {
        return false;
    }
    var_62f2a5497a3c2c34 = function_75a367e461c6389a();
    return self.swim.breath < var_62f2a5497a3c2c34;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3182
// Size: 0x15
function function_ea8199f09c110522() {
    return self.swim.breathcritical;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31a0
// Size: 0x15
function function_bab53c4f3c6062b9() {
    return self.swim.drowning;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31be
// Size: 0x15
function function_7e903535100a53f3() {
    return self.swim.heartbeat;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31dc
// Size: 0x38
function function_e40b04d1193aa8c3() {
    if (!isdefined(self.swim)) {
        return false;
    }
    var_21c40030c467a5f6 = function_d4a3e79cc1808058();
    return self.swim.breath < var_21c40030c467a5f6;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x321d
// Size: 0x42
function function_90c418d9bae08d74(var_bb85a75787c26d48) {
    if (!isdefined(self.swim)) {
        return false;
    }
    var_62cf7f9ce94b7f89 = function_317e02dca870dff(var_bb85a75787c26d48);
    return self.swim.breath < var_62cf7f9ce94b7f89;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3268
// Size: 0x38
function function_aa183ca1083d279() {
    self setclientomnvar("swim_breath_meter_critical", 0);
    if (isdefined(self.swim)) {
        self.swim.breathcritical = 0;
        function_a05de828303d4bed();
    }
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32a8
// Size: 0x42
function function_2635b692c9c491b4() {
    self setclienttriggeraudiozone("underwater_drowning", 5);
    self setsoundsubmix("iw9_player_drowning", 5);
    self.swim.breathcritical = 1;
    self setclientomnvar("swim_breath_meter_critical", 1);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32f2
// Size: 0x17
function function_542add828c78e976() {
    self.swim.heartbeat = 0;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3311
// Size: 0x20
function function_f53f052ec435e9c5() {
    self.swim.heartbeat = 1;
    self notify("startHeartbeatPulse");
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3339
// Size: 0x26
function function_9ab56eff95d3d9b7() {
    self.swim.drowning = 1;
    self setclientomnvar("swim_breath_meter_critical", 2);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3367
// Size: 0x10
function function_4d1eaa072369ad4b() {
    self setclientomnvar("swim_breath_meter_critical", 3);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x337f
// Size: 0x38
function function_102c01b146eedc7d() {
    if (!isdefined(self.swim)) {
        return false;
    }
    heartbeatthreshold = function_75a367e461c6389a();
    return self.swim.breath < heartbeatthreshold;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33c0
// Size: 0x2a
function function_75a367e461c6389a() {
    var_fd9f67f7fb502bd3 = [[ function_706e311766a84377() ]]();
    var_80574e7bbde66c18 = var_fd9f67f7fb502bd3 - 6;
    return var_80574e7bbde66c18 / var_fd9f67f7fb502bd3 * 100;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33f3
// Size: 0x3b
function function_d4a3e79cc1808058() {
    var_fd9f67f7fb502bd3 = [[ function_706e311766a84377() ]]();
    var_647e0301d37aebf7 = [[ level.swim.var_575e6f276810675e ]]();
    return var_647e0301d37aebf7 / var_fd9f67f7fb502bd3 * 100;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3437
// Size: 0x55
function function_317e02dca870dff(var_bb85a75787c26d48) {
    var_fd9f67f7fb502bd3 = [[ function_706e311766a84377() ]]();
    var_647e0301d37aebf7 = [[ level.swim.var_575e6f276810675e ]]();
    var_71c2d4c5700674f7 = var_647e0301d37aebf7 + var_bb85a75787c26d48 * (var_fd9f67f7fb502bd3 - var_647e0301d37aebf7);
    return var_71c2d4c5700674f7 / var_fd9f67f7fb502bd3 * 100;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3495
// Size: 0x2e
function function_b1b34805f6f1b18f() {
    var_fd9f67f7fb502bd3 = [[ function_706e311766a84377() ]]();
    return var_fd9f67f7fb502bd3 * self.swim.breath / 100;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34cc
// Size: 0x188
function function_5bcf4e2bd107536f() {
    self.swim.swimoverlay = newclienthudelem(self);
    self.swim.swimoverlay.sort = 1;
    self.swim.swimoverlay.x = 0;
    self.swim.swimoverlay.y = 0;
    self.swim.swimoverlay.alignx = "left";
    self.swim.swimoverlay.aligny = "top";
    self.swim.swimoverlay.foreground = 0;
    self.swim.swimoverlay.lowresbackground = 1;
    self.swim.swimoverlay.horzalign = "fullscreen";
    self.swim.swimoverlay.vertalign = "fullscreen";
    self.swim.swimoverlay.alpha = 0;
    self.swim.swimoverlay setshader("hud_swim_vignette", 640, 480);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x365c
// Size: 0x23
function function_1cf86af6f8a0266d(msg1, msg2, timer) {
    self endon(msg1);
    self endon(msg2);
    wait timer;
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3687
// Size: 0xd
function function_c2be12529b0f0ad2() {
    return !isdefined(self.usingremote);
}

// Namespace swim_common / namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x369d
// Size: 0x30
function function_706e311766a84377() {
    if (isdefined(self.var_dc6dc154664cf0aa)) {
        return self.var_dc6dc154664cf0aa;
    }
    return level.swim.var_dc6dc154664cf0aa;
}

