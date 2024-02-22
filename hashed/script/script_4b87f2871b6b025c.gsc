// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using script_15047af555f1f9a0;

#namespace namespace_42897ee7f159629b;

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x917
// Size: 0x1a5
function function_e05aeec06b7b52aa(var_dc6dc154664cf0aa, var_575e6f276810675e, var_a1e7fb7b162a7323, var_dd47832cd570074b, var_be3314f77fef5d6b, surfacefunc, var_71106dd668c1bcab, var_230b60ef0852dcb8, var_a699c74ce724a801, var_e1b16133a0146153, var_bb67e91ffc4e7632, var_cc3e168e41362ff2) {
    setdvarifuninitialized(@"hash_2a4f08bc79265550", 0);
    level.swim = spawnstruct();
    level.swim.var_dc6dc154664cf0aa = var_dc6dc154664cf0aa;
    level.swim.var_575e6f276810675e = var_575e6f276810675e;
    level.swim.var_a1e7fb7b162a7323 = var_a1e7fb7b162a7323;
    level.swim.var_dd47832cd570074b = var_dd47832cd570074b;
    level.swim.var_be3314f77fef5d6b = var_be3314f77fef5d6b;
    level.swim.surfacefunc = surfacefunc;
    level.swim.var_71106dd668c1bcab = var_71106dd668c1bcab;
    level.swim.var_230b60ef0852dcb8 = var_230b60ef0852dcb8;
    level.swim.var_a699c74ce724a801 = var_a699c74ce724a801;
    level.swim.var_e1b16133a0146153 = var_e1b16133a0146153;
    level.swim.var_6fed0ef13f84a258 = var_bb67e91ffc4e7632;
    level.swim.var_cc3e168e41362ff2 = var_cc3e168e41362ff2;
    level.swim.sfx = function_a1f804a91db4e6c2();
    function_76828ba8fde01e05();
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac3
// Size: 0xb24
function function_a1f804a91db4e6c2() {
    sfx = spawnstruct();
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"surface", 2:"slow", 3:"quiet", 4:"plr"], "mvmt_swim_surfacing_plr_slow");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"surface", 2:"slow", 3:"quiet", 4:"npc"], "mvmt_swim_surfacing_npc_slow");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"surface", 2:"slow", 3:"breath", 4:"plr"], "mvmt_swim_surfacing_plr_slow_gasping");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"surface", 2:"slow", 3:"breath", 4:"npc"], "mvmt_swim_surfacing_npc_slow_gasping");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"surface", 2:"slow", 3:"gasp", 4:"plr"], "mvmt_swim_surfacing_plr_slow_gasping");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"surface", 2:"slow", 3:"gasp", 4:"npc"], "mvmt_swim_surfacing_npc_slow_gasping");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"surface", 2:"fast", 3:"quiet", 4:"plr"], "mvmt_swim_surfacing_plr_sprint");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"surface", 2:"fast", 3:"quiet", 4:"npc"], "mvmt_swim_surfacing_npc_sprint");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"surface", 2:"fast", 3:"breath", 4:"plr"], "mvmt_swim_surfacing_plr_sprint_gasping");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"surface", 2:"fast", 3:"breath", 4:"npc"], "mvmt_swim_surfacing_npc_sprint_gasping");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"surface", 2:"fast", 3:"gasp", 4:"plr"], "mvmt_swim_surfacing_plr_sprint_gasping");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"surface", 2:"fast", 3:"gasp", 4:"npc"], "mvmt_swim_surfacing_npc_sprint_gasping");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"descend", 2:"slow", 3:"quiet", 4:"plr"], "mvmt_swim_plunging_plr_slow");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"descend", 2:"slow", 3:"quiet", 4:"npc"], "mvmt_swim_plunging_npc_slow");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"descend", 2:"slow", 3:"breath", 4:"plr"], "mvmt_swim_plunging_plr_slow_inhaling");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"descend", 2:"slow", 3:"breath", 4:"npc"], "mvmt_swim_plunging_npc_slow_inhaling");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"descend", 2:"slow", 3:"gasp", 4:"plr"], "mvmt_swim_plunging_plr_slow_inhaling");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"descend", 2:"slow", 3:"gasp", 4:"npc"], "mvmt_swim_plunging_npc_slow_inhaling");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"descend", 2:"fast", 3:"quiet", 4:"plr"], "mvmt_swim_plunging_plr_sprint");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"descend", 2:"fast", 3:"quiet", 4:"npc"], "mvmt_swim_plunging_npc_sprint");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"descend", 2:"fast", 3:"breath", 4:"plr"], "mvmt_swim_plunging_plr_sprint_inhaling");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"descend", 2:"fast", 3:"breath", 4:"npc"], "mvmt_swim_plunging_npc_sprint_inhaling");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"descend", 2:"fast", 3:"gasp", 4:"plr"], "mvmt_swim_plunging_plr_sprint_inhaling");
    sfx function_aa21b4352ca3b832([0:"sfx", 1:"descend", 2:"fast", 3:"gasp", 4:"npc"], "mvmt_swim_plunging_npc_sprint_inhaling");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"surface", 2:"slow", 3:"quiet", 4:"plr"], "plr_breath_swim_surface_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"surface", 2:"slow", 3:"quiet", 4:"npc"], "npc_breath_swim_surface_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"surface", 2:"slow", 3:"breath", 4:"plr"], "plr_breath_swim_surface_gasp_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"surface", 2:"slow", 3:"breath", 4:"npc"], "npc_breath_swim_surface_gasp_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"surface", 2:"slow", 3:"gasp", 4:"plr"], "plr_breath_swim_surface_gasp_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"surface", 2:"slow", 3:"gasp", 4:"npc"], "npc_breath_swim_surface_gasp_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"surface", 2:"fast", 3:"quiet", 4:"plr"], "plr_breath_swim_surface_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"surface", 2:"fast", 3:"quiet", 4:"npc"], "npc_breath_swim_surface_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"surface", 2:"fast", 3:"breath", 4:"plr"], "plr_breath_swim_surface_gasp_sprint_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"surface", 2:"fast", 3:"breath", 4:"npc"], "npc_breath_swim_surface_gasp_sprint_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"surface", 2:"fast", 3:"gasp", 4:"plr"], "plr_breath_swim_surface_gasp_sprint_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"surface", 2:"fast", 3:"gasp", 4:"npc"], "npc_breath_swim_surface_gasp_sprint_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"descend", 2:"slow", 3:"quiet", 4:"plr"], "plr_breath_swim_descend_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"descend", 2:"slow", 3:"quiet", 4:"npc"], "npc_breath_swim_descend_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"descend", 2:"slow", 3:"breath", 4:"plr"], "plr_breath_swim_descend_gasp_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"descend", 2:"slow", 3:"breath", 4:"npc"], "npc_breath_swim_descend_gasp_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"descend", 2:"slow", 3:"gasp", 4:"plr"], "plr_breath_swim_descend_gasp_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"descend", 2:"slow", 3:"gasp", 4:"npc"], "npc_breath_swim_descend_gasp_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"descend", 2:"fast", 3:"quiet", 4:"plr"], "plr_breath_swim_descend_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"descend", 2:"fast", 3:"quiet", 4:"npc"], "npc_breath_swim_descend_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"descend", 2:"fast", 3:"breath", 4:"plr"], "plr_breath_swim_descend_gasp_sprint_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"descend", 2:"fast", 3:"breath", 4:"npc"], "npc_breath_swim_descend_gasp_sprint_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"descend", 2:"fast", 3:"gasp", 4:"plr"], "plr_breath_swim_descend_gasp_sprint_inh");
    sfx function_aa21b4352ca3b832([0:"dlg", 1:"descend", 2:"fast", 3:"gasp", 4:"npc"], "npc_breath_swim_descend_gasp_sprint_inh");
    return sfx;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ef
// Size: 0x51
function function_76828ba8fde01e05() {
    level._effect["swim_bubbles_light"] = loadfx("vfx/iw9/core/swimming/vfx_swim_gasp_bubbles_0.vfx");
    level._effect["swim_gasp_bubbles"] = loadfx("vfx/iw9/core/swimming/vfx_swim_gasp_bubbles_1.vfx");
    level._effect["swim_drowning_bubbles"] = loadfx("vfx/iw9/core/swimming/vfx_swim_gasp_bubbles_2.vfx");
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1647
// Size: 0x6f
function function_aa21b4352ca3b832(keys, sfx) {
    i = 0;
    var_43e0b9317508501b = self;
    while (1) {
        if (keys.size > i + 1) {
            var_43e0b9317508501b function_cf9cebe58c49f708(keys[i]);
        } else {
            var_43e0b9317508501b function_e3e506e52aacfb27(keys[i], sfx);
            break;
        }
        var_43e0b9317508501b = var_43e0b9317508501b.array[keys[i]];
        i++;
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16bd
// Size: 0xa8
function function_8c913c3634f4a84e(keys) {
    var_43e0b9317508501b = level.swim.sfx;
    i = 0;
    foreach (key in keys) {
        if (keys.size > i + 1) {
            var_43e0b9317508501b = var_43e0b9317508501b.array[key];
        } else {
            return var_43e0b9317508501b.array[key];
        }
        i++;
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176c
// Size: 0x43
function function_cf9cebe58c49f708(key) {
    if (!isdefined(self.array)) {
        self.array = [];
    }
    if (!isdefined(self.array[key])) {
        self.array[key] = spawnstruct();
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b6
// Size: 0x47
function function_e3e506e52aacfb27(key, sfx) {
    if (!isdefined(self.array)) {
        self.array = [];
    }
    if (!isdefined(self.array[key])) {
        self.array[key] = sfx;
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1804
// Size: 0x10f
function function_fc7d07d4cc7ae9f1() {
    if (isdefined(self.swim)) {
        return;
    }
    self.swim = spawnstruct();
    self.swim.breath = 100;
    self.swim.underwater = 0;
    self.swim.swimming = 0;
    self.swim.var_f18247b2b3a09ad2 = 0;
    self.swim.drowning = 0;
    self.swim.sprinting = 0;
    self.swim.heartbeat = 0;
    self.swim.var_82dfb94e8914edad = "none";
    function_5bcf4e2bd107536f();
    thread function_d2c67316e3340d42();
    thread deathcleanup();
    self endon("death");
    self endon("disconnect");
    self endon("showing_final_killcam");
    function_ef73345010f390f4();
    childthread function_d126e1e30aae39f();
    childthread function_dd2af15c9306838();
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191a
// Size: 0x37
function function_d126e1e30aae39f() {
    while (1) {
        waittill_any_6("swim_begin", "swim_end", "swim_breathing_disabled_end", "swim_breathing_disabled_begin", "vehicle_enter", "vehicle_exit");
        function_ef73345010f390f4();
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1958
// Size: 0xc7
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

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a26
// Size: 0x2d
function function_dd2af15c9306838() {
    while (1) {
        waittill_any_4("swim_begin", "swim_end", "vehicle_enter", "vehicle_exit");
        function_4f0c9995f869868a();
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5a
// Size: 0x54
function function_4f0c9995f869868a() {
    if (function_d59269bc793fe756() && !self.swim.swimming) {
        childthread function_4186d69a94fe93d9();
    }
    if (!function_d59269bc793fe756() && self.swim.swimming) {
        childthread function_1a0fcd6bae3d2370();
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab5
// Size: 0x9
function function_d59269bc793fe756() {
    return self isswimming();
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac6
// Size: 0xbe
function function_d2c67316e3340d42() {
    var_946b001669de27fb = [0:self.swim.var_18fe76d95d79d75f, 1:self.swim.var_28a9dbf4ce30fa86];
    var_946b001669de27fb = [0:self.swim.var_18fe76d95d79d75f];
    waittill_any_3("death", "disconnect", "showing_final_killcam");
    foreach (var_bed6393fb2e34b6a in var_946b001669de27fb) {
        if (isdefined(var_bed6393fb2e34b6a)) {
            var_bed6393fb2e34b6a destroy();
        }
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b8b
// Size: 0x22
function deathcleanup() {
    self endon("disconnect");
    waittill_any_2("death", "showing_final_killcam");
    function_3b00a7c45356a6e1();
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb4
// Size: 0x29
function function_3b00a7c45356a6e1() {
    function_40d220afd2eb67b5();
    function_179cdce690151ad6();
    function_38fe3b60e5adf79c();
    function_aa183ca1083d279();
    self.swim = undefined;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be4
// Size: 0x11
function function_40d220afd2eb67b5() {
    self setclientomnvar("swim_breath_meter_hide", 1);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bfc
// Size: 0xf
function function_179cdce690151ad6() {
    function_b66c4e6d072630c(0.05);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c12
// Size: 0x25
function function_38fe3b60e5adf79c() {
    self setscriptablepartstate("swimDebris", "aboveWater");
    self setscriptablepartstate("swimBubbles", "aboveWater");
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c3e
// Size: 0x6d
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
    self childthread [[ level.swim.surfacefunc ]]();
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb2
// Size: 0x68
function function_178428152f0b5e74() {
    self notify("scr_change_breath_state");
    self endon("scr_change_breath_state");
    self.swim.underwater = 1;
    childthread function_5d9e116115d3c60d();
    childthread function_3b40f73c6038a3b0();
    childthread function_fb5bfd7783364f80();
    childthread function_e8c44b4b292c651d();
    childthread function_3a7925b414e10c37();
    self childthread [[ level.swim.var_71106dd668c1bcab ]]();
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d21
// Size: 0x40
function function_4186d69a94fe93d9() {
    self notify("scr_change_swim_state");
    self endon("scr_change_swim_state");
    self.swim.swimming = 1;
    self childthread [[ level.swim.var_dd47832cd570074b ]]();
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d68
// Size: 0x3f
function function_1a0fcd6bae3d2370() {
    self notify("scr_change_swim_state");
    self endon("scr_change_swim_state");
    self.swim.swimming = 0;
    self childthread [[ level.swim.var_be3314f77fef5d6b ]]();
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dae
// Size: 0x24
function isplayerunderwater() {
    return isdefined(self.swim) && self.swim.underwater;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dda
// Size: 0x24
function isplayerswimming() {
    return isdefined(self.swim) && self.swim.swimming;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e06
// Size: 0x8b
function function_b66c4e6d072630c(time) {
    if (self.swim.var_82dfb94e8914edad == "none") {
        return;
    }
    self.swim.var_82dfb94e8914edad = "none";
    self clearsoundsubmix("player_swimming_underwater", 0.2);
    self clearsoundsubmix("iw9_player_drowning", 0);
    self clearsoundsubmix("iw9_underwater_vo", 1);
    self setentitysoundcontext("atmosphere", "");
    self clearclienttriggeraudiozone(0.1);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e98
// Size: 0x8a
function function_4594e9dcebf2c645() {
    if (self.swim.var_82dfb94e8914edad == "surface") {
        return;
    }
    self.swim.var_82dfb94e8914edad = "surface";
    self clearsoundsubmix("player_swimming_underwater", 0.2);
    self clearsoundsubmix("iw9_player_drowning", 0);
    self clearsoundsubmix("iw9_underwater_vo", 1);
    self setentitysoundcontext("atmosphere", "water_surface");
    self clearclienttriggeraudiozone(0.1);
    self notify("jup_swim_surface");
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f29
// Size: 0x80
function function_9a01935a05b613e4() {
    if (self.swim.var_82dfb94e8914edad == "submerged") {
        return;
    }
    self.swim.var_82dfb94e8914edad = "submerged";
    self setsoundsubmix("iw9_underwater_vo");
    self setsoundsubmix("player_swimming_underwater", 0.1);
    self setentitysoundcontext("atmosphere", "underwater");
    self setclienttriggeraudiozone("underwater", 0.1);
    self notify("jup_swim_submerge");
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb0
// Size: 0x65
function function_2e58c560f3d8e570() {
    var_23eeaa8c13b1cb24 = "mvmt_swim_gagging_plr_bubbles";
    var_efd3348b30946966 = "plr_breath_swim_pain_gag";
    if (soundexists(var_23eeaa8c13b1cb24)) {
        self [[ level.swim.var_230b60ef0852dcb8 ]](var_23eeaa8c13b1cb24);
    }
    if (soundexists(var_efd3348b30946966)) {
        self [[ level.swim.var_230b60ef0852dcb8 ]](var_efd3348b30946966);
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x201c
// Size: 0x79
function function_57108400022fb733() {
    var_23eeaa8c13b1cb24 = "mvmt_swim_plr_bubbles_light";
    var_efd3348b30946966 = "";
    if (var_23eeaa8c13b1cb24 != "") {
        if (soundexists(var_23eeaa8c13b1cb24)) {
            self [[ level.swim.var_230b60ef0852dcb8 ]](var_23eeaa8c13b1cb24);
        }
    }
    if (var_efd3348b30946966 != "") {
        if (soundexists(var_efd3348b30946966)) {
            self [[ level.swim.var_230b60ef0852dcb8 ]](var_efd3348b30946966);
        }
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x209c
// Size: 0x77
function function_38f601b8026c2203() {
    var_23eeaa8c13b1cb24 = "mvmt_swim_gagging_plr_bubbles_critical";
    var_efd3348b30946966 = "plr_breath_swim_pain_choke";
    if (randomintrange(0, 1)) {
        var_efd3348b30946966 = "plr_breath_swim_pain_gag";
    }
    if (soundexists(var_23eeaa8c13b1cb24)) {
        self [[ level.swim.var_230b60ef0852dcb8 ]](var_23eeaa8c13b1cb24);
    }
    if (soundexists(var_efd3348b30946966)) {
        self [[ level.swim.var_230b60ef0852dcb8 ]](var_efd3348b30946966);
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211a
// Size: 0x1b
function function_a3b4435c21f67884() {
    if (!function_c2be12529b0f0ad2()) {
        return;
    }
    function_aae8f85a278e89();
    function_a4cc23314a609ed7();
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213c
// Size: 0x1b
function function_e8c44b4b292c651d() {
    if (!function_c2be12529b0f0ad2()) {
        return;
    }
    function_c400314c2dd6fbb0();
    function_3971e4c5bcf1b9b2();
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x215e
// Size: 0x14
function function_c400314c2dd6fbb0() {
    self setscriptablepartstate("swimDebris", "underWater");
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2179
// Size: 0x14
function function_aae8f85a278e89() {
    self setscriptablepartstate("swimDebris", "aboveWater");
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2194
// Size: 0x14
function function_3971e4c5bcf1b9b2() {
    self setscriptablepartstate("swimBubbles", "bubblesEnter");
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21af
// Size: 0x14
function function_a4cc23314a609ed7() {
    self setscriptablepartstate("swimBubbles", "aboveWater");
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ca
// Size: 0x38
function function_3a2421785a1b420f() {
    self thread [[ level.swim.var_cc3e168e41362ff2 ]]("swim_gasp_bubbles", "swim_breathing_disabled_end", 3);
    self setscriptablepartstate("swimBubbles", "bubblesHeavy");
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2209
// Size: 0x27
function function_110be15783d6c5e2() {
    self thread [[ level.swim.var_cc3e168e41362ff2 ]]("swim_bubbles_light", "swim_breathing_disabled_end", 3);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2237
// Size: 0x27
function function_22d90d196efbb4a8() {
    self thread [[ level.swim.var_cc3e168e41362ff2 ]]("swim_drowning_bubbles", "swim_breathing_disabled_end", 3);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2265
// Size: 0x36
function function_c15a079c936c458a(var_23eeaa8c13b1cb24, var_45210a8a70c2faab, var_232aa0a9f1e032dd) {
    self [[ level.swim.var_230b60ef0852dcb8 ]](var_23eeaa8c13b1cb24, var_45210a8a70c2faab, var_232aa0a9f1e032dd);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22a2
// Size: 0x14
function function_da4d3d2e5560fe3a() {
    if (!function_c2be12529b0f0ad2()) {
        return;
    }
    function_13c5657c0af9c302();
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22bd
// Size: 0xa
function function_3a7925b414e10c37() {
    function_7ab2d9e99262446f();
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ce
// Size: 0x17
function function_13c5657c0af9c302() {
    if (!isdefined(level.dyndof)) {
        self disablephysicaldepthoffieldscripting();
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ec
// Size: 0x37
function function_7ab2d9e99262446f() {
    if (!isdefined(level.dyndof)) {
        self enablephysicaldepthoffieldscripting(1);
        self setphysicaldepthoffield(1, 200, 100);
        self setphysicalviewmodeldepthoffield(6, 100);
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232a
// Size: 0x3d
function function_458135edd51d48b8() {
    self.swim.var_18fe76d95d79d75f fadeovertime(1);
    self.swim.var_18fe76d95d79d75f.alpha = 0;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x236e
// Size: 0x47
function function_3b40f73c6038a3b0() {
    self.swim.var_18fe76d95d79d75f fadeovertime(0.05);
    while (1) {
        waittillframeend();
        if (function_c2be12529b0f0ad2()) {
            updateswimoverlaycolor();
            function_66cd16083cc71a78();
        }
        wait(0.05);
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23bc
// Size: 0xfe
function function_fb5bfd7783364f80() {
    var_6fcfedc89a8dc3d5 = 0;
    var_21c40030c467a5f6 = function_d4a3e79cc1808058();
    while (1) {
        waittillframeend();
        if (function_ea8199f09c110522()) {
            pulsetime = self.heartbeat.pulsetime;
            time = gettime();
            if (pulsetime > 0.9 && !var_6fcfedc89a8dc3d5) {
                if (function_c2be12529b0f0ad2()) {
                    var_ccbba16287668f0a = math::normalize_value(0, var_21c40030c467a5f6, self.swim.breath);
                    if (var_ccbba16287668f0a > 0.66) {
                        heartbeat = "heartbeatLight";
                    } else if (var_ccbba16287668f0a > 0.33) {
                        heartbeat = "heartbeatMed";
                    } else {
                        heartbeat = "heartbeatHeavy";
                    }
                    childthread namespace_a81abcc503139256::function_b7c36a804415225b(heartbeat);
                }
                var_6fcfedc89a8dc3d5 = 1;
            } else if (pulsetime < 0.5 && var_6fcfedc89a8dc3d5) {
                var_6fcfedc89a8dc3d5 = 0;
            }
        }
        wait(0.05);
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24c1
// Size: 0x2c3
function function_5d9e116115d3c60d() {
    if (getdvarint(@"hash_42deeb1fb385c72", 1) == 1) {
        self setclientomnvar("swim_breath_meter_hide", 0);
    }
    var_4ab9ecb27b15881d = function_90c418d9bae08d74(0.66);
    var_4ab9e9b27b158184 = function_90c418d9bae08d74(0.33);
    starttime = gettime();
    godmode = 0;
    while (1) {
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
                    self.swim.breath = self.swim.breath - 100 / var_fd9f67f7fb502bd3 * 0.05;
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
                function_9400bc0468cd1c5e();
                var_4ab9ecb27b15881d = 1;
            }
            if (!var_4ab9e9b27b158184 && function_90c418d9bae08d74(0.33)) {
                function_9400bc0468cd1c5e();
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
            wait(0.05);
        }
        godmode = function_b647fd6febd8e530(godmode);
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x278b
// Size: 0x115
function function_b647fd6febd8e530(var_3a2752e045b138ab) {
    self endon("swim_stop_drowning");
    self notify("swim_start_drowning");
    var_cecfcb613ccbacba = undefined;
    if (var_3a2752e045b138ab) {
        wait(0.5);
    } else {
        function_9ab56eff95d3d9b7();
        if (-1) {
            self setclienttriggeraudiozone("underwater_deathsdoor", 4);
            if (isdefined(level.var_372a9eab717e5d8d)) {
                vision = level.var_372a9eab717e5d8d;
            } else {
                vision = "drowning";
            }
            self [[ level.swim.var_a699c74ce724a801 ]](vision, 3.6);
            childthread function_40de065884e608bf(4);
        }
        starttime = gettime();
        while (1) {
            waitframe();
            if (gettime() - starttime > 4000) {
                break;
            }
        }
        function_4d1eaa072369ad4b();
        var_cecfcb613ccbacba = self [[ level.swim.var_e1b16133a0146153 ]]();
    }
    self dodamage(self.health + 10000, self.origin, self, self, "MOD_SUICIDE", var_cecfcb613ccbacba, "torso_upper");
    return 1;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28a8
// Size: 0x38
function function_9368fff2b3156346(var_e2a66dd8a90fbd3f) {
    if (!isdefined(self.swim)) {
        return;
    }
    self.swim.var_6d1e5466170ac355 = ter_op(var_e2a66dd8a90fbd3f, 1, undefined);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28e7
// Size: 0x26
function function_9b65944d3ce0f852() {
    if (!isdefined(self.swim)) {
        return 0;
    }
    return istrue(self.swim.var_6d1e5466170ac355);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2915
// Size: 0xa9
function function_40de065884e608bf(timer) {
    self endon("death_or_disconnect");
    level endon("mission_fail");
    level endon("game_ended");
    var_ad2608b0a1f1873d = 0.6;
    while (1) {
        function_21dafdba97771de8();
        waittime = randomfloatrange(0.8, 1.15) + var_ad2608b0a1f1873d;
        wait(waittime);
        timer = timer - waittime;
        if (self getclientomnvar("swim_breath_meter_critical") == 3 || !self.swim.drowning || timer <= 0) {
            break;
        }
        var_ad2608b0a1f1873d = var_ad2608b0a1f1873d - 0.3;
        var_ad2608b0a1f1873d = clamp(var_ad2608b0a1f1873d, 0, 1);
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c5
// Size: 0x36
function function_a05de828303d4bed() {
    if (function_bab53c4f3c6062b9()) {
        if (-1) {
            childthread function_7a964640cf87f4fa();
        }
        self.swim.drowning = 0;
        self notify("swim_stop_drowning");
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a02
// Size: 0x4c
function function_7a964640cf87f4fa() {
    self endon("swim_start_drowning");
    self [[ level.swim.var_a699c74ce724a801 ]]("drowning_cleared", 1);
    wait(1.05);
    self [[ level.swim.var_a699c74ce724a801 ]]("", 1);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a55
// Size: 0xec
function function_39bc9721e2da8f9c() {
    while (self.swim.breath < 100) {
        self.swim.breath = self.swim.breath + 0.05 / [[ level.swim.var_a1e7fb7b162a7323 ]]() * 100;
        self.swim.breath = clamp(self.swim.breath, 1, 100);
        self setclientomnvar("swim_breath_meter_percent", int(self.swim.breath));
        self function_746d32fac66e0b73(int(self.swim.breath));
        wait(0.05);
    }
    self setclientomnvar("swim_breath_meter_hide", 1);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b48
// Size: 0x197
function function_8c3428aeb7c8b1f4(amount, var_3918dd3a9b1b12a9) {
    self endon("scr_change_breath_state");
    var_2ae11b9a5459e669 = level.swim.var_a1e7fb7b162a7323;
    if (isdefined(var_3918dd3a9b1b12a9)) {
        var_2ae11b9a5459e669 = var_3918dd3a9b1b12a9;
    }
    while (self.swim.breath <= amount) {
        self.swim.breath = self.swim.breath + 0.05 / [[ var_2ae11b9a5459e669 ]]() * amount;
        self.swim.breath = clamp(self.swim.breath, 1, 100);
        self setclientomnvar("swim_breath_meter_percent", int(self.swim.breath));
        self function_746d32fac66e0b73(int(self.swim.breath));
        var_21c40030c467a5f6 = function_d4a3e79cc1808058();
        if (self.swim.breath > var_21c40030c467a5f6 && function_ea8199f09c110522()) {
            function_aa183ca1083d279();
            self clearsoundsubmix("iw9_player_drowning", 0);
            self setclienttriggeraudiozone("underwater", 5);
        }
        var_f4b8bed767c66786 = function_75a367e461c6389a();
        if (self.swim.breath > var_f4b8bed767c66786 && function_7e903535100a53f3()) {
            function_542add828c78e976();
        }
        wait(0.05);
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ce6
// Size: 0x1b
function function_1bb8793f81f3dd35() {
    if (!function_c2be12529b0f0ad2()) {
        return;
    }
    function_2e58c560f3d8e570();
    function_3a2421785a1b420f();
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d08
// Size: 0x11
function function_9400bc0468cd1c5e() {
    function_57108400022fb733();
    function_110be15783d6c5e2();
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d20
// Size: 0x1b
function function_21dafdba97771de8() {
    if (!function_c2be12529b0f0ad2()) {
        return;
    }
    function_38f601b8026c2203();
    function_22d90d196efbb4a8();
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d42
// Size: 0x16e
function updateswimoverlaycolor() {
    var_21c40030c467a5f6 = function_d4a3e79cc1808058();
    if (isdefined(level.var_19d38dec02a818ce) && [[ level.var_19d38dec02a818ce ]]("player", "updateSwimOverlayColor")) {
        var_83f38cc857568f42 = [[ level.var_49b393a31d0b0b95 ]]("player", "updateSwimOverlayColor");
        color = [[ var_83f38cc857568f42 ]](self.swim.breath, function_ea8199f09c110522(), var_21c40030c467a5f6, 100);
        self.swim.var_18fe76d95d79d75f.color = color;
    } else {
        if (function_ea8199f09c110522()) {
            var_dd54d673acb97122 = (0.2, 0.1, 0.1);
            var_dd31e073ac933f68 = (0.25, 0.05, 0.05);
            var_ccbba16287668f0a = math::normalize_value(0, var_21c40030c467a5f6, self.swim.breath);
        } else {
            var_dd54d673acb97122 = (0.2, 0.2, 0.2);
            var_dd31e073ac933f68 = (0.1, 0.1, 0.1);
            var_ccbba16287668f0a = math::normalize_value(var_21c40030c467a5f6, 100, self.swim.breath);
        }
        color = math::factor_value(var_dd31e073ac933f68, var_dd54d673acb97122, var_ccbba16287668f0a);
        self.swim.var_18fe76d95d79d75f.color = color;
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb7
// Size: 0x142
function function_66cd16083cc71a78() {
    var_21c40030c467a5f6 = function_d4a3e79cc1808058();
    /#
        if (!isdefined(self.heartbeat)) {
            /#
                assertmsg("npc_breath_swim_surface_inh");
            #/
        }
    #/
    if (function_ea8199f09c110522()) {
        var_bb45e9e6f61e1633 = 0.1;
        var_e3c581a803bd0fa5 = 0.2;
        var_3179113a20b106b9 = 0.5;
        var_1e4a3810e3cce69f = 0.75;
        var_ccbba16287668f0a = math::normalize_value(0, var_21c40030c467a5f6, self.swim.breath);
    } else {
        var_bb45e9e6f61e1633 = 0;
        var_e3c581a803bd0fa5 = 0.3;
        var_3179113a20b106b9 = 0.2;
        var_1e4a3810e3cce69f = 0.6;
        var_ccbba16287668f0a = math::normalize_value(var_21c40030c467a5f6, 100, self.swim.breath);
    }
    maxalpha = math::factor_value(var_1e4a3810e3cce69f, var_3179113a20b106b9, var_ccbba16287668f0a);
    var_e26b36a6df3106dd = math::factor_value(var_e3c581a803bd0fa5, var_bb45e9e6f61e1633, var_ccbba16287668f0a);
    self.swim.var_18fe76d95d79d75f.alpha = math::factor_value(var_e26b36a6df3106dd, maxalpha, self.heartbeat.pulsetime);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3000
// Size: 0x38
function function_3776bacc92b445d3() {
    if (!isdefined(self.swim)) {
        return 0;
    }
    var_62f2a5497a3c2c34 = function_75a367e461c6389a();
    return self.swim.breath < var_62f2a5497a3c2c34;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3040
// Size: 0x16
function function_ea8199f09c110522() {
    return self.swim.var_f18247b2b3a09ad2;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x305e
// Size: 0x16
function function_bab53c4f3c6062b9() {
    return self.swim.drowning;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x307c
// Size: 0x16
function function_7e903535100a53f3() {
    return self.swim.heartbeat;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x309a
// Size: 0x38
function function_e40b04d1193aa8c3() {
    if (!isdefined(self.swim)) {
        return 0;
    }
    var_21c40030c467a5f6 = function_d4a3e79cc1808058();
    return self.swim.breath < var_21c40030c467a5f6;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30da
// Size: 0x42
function function_90c418d9bae08d74(var_bb85a75787c26d48) {
    if (!isdefined(self.swim)) {
        return 0;
    }
    var_62cf7f9ce94b7f89 = function_317e02dca870dff(var_bb85a75787c26d48);
    return self.swim.breath < var_62cf7f9ce94b7f89;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3124
// Size: 0x39
function function_aa183ca1083d279() {
    self setclientomnvar("swim_breath_meter_critical", 0);
    if (isdefined(self.swim)) {
        self.swim.var_f18247b2b3a09ad2 = 0;
        function_a05de828303d4bed();
    }
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3164
// Size: 0x43
function function_2635b692c9c491b4() {
    self setclienttriggeraudiozone("underwater_drowning", 5);
    self setsoundsubmix("iw9_player_drowning", 5);
    self.swim.var_f18247b2b3a09ad2 = 1;
    self setclientomnvar("swim_breath_meter_critical", 1);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31ae
// Size: 0x18
function function_542add828c78e976() {
    self.swim.heartbeat = 0;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31cd
// Size: 0x21
function function_f53f052ec435e9c5() {
    self.swim.heartbeat = 1;
    self notify("startHeartbeatPulse");
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f5
// Size: 0x27
function function_9ab56eff95d3d9b7() {
    self.swim.drowning = 1;
    self setclientomnvar("swim_breath_meter_critical", 2);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3223
// Size: 0x11
function function_4d1eaa072369ad4b() {
    self setclientomnvar("swim_breath_meter_critical", 3);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x323b
// Size: 0x38
function function_102c01b146eedc7d() {
    if (!isdefined(self.swim)) {
        return 0;
    }
    var_f4b8bed767c66786 = function_75a367e461c6389a();
    return self.swim.breath < var_f4b8bed767c66786;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x327b
// Size: 0x2b
function function_75a367e461c6389a() {
    var_fd9f67f7fb502bd3 = [[ function_706e311766a84377() ]]();
    var_80574e7bbde66c18 = var_fd9f67f7fb502bd3 - 6;
    return var_80574e7bbde66c18 / var_fd9f67f7fb502bd3 * 100;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32ae
// Size: 0x3c
function function_d4a3e79cc1808058() {
    var_fd9f67f7fb502bd3 = [[ function_706e311766a84377() ]]();
    var_647e0301d37aebf7 = [[ level.swim.var_575e6f276810675e ]]();
    return var_647e0301d37aebf7 / var_fd9f67f7fb502bd3 * 100;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32f2
// Size: 0x57
function function_317e02dca870dff(var_bb85a75787c26d48) {
    var_fd9f67f7fb502bd3 = [[ function_706e311766a84377() ]]();
    var_647e0301d37aebf7 = [[ level.swim.var_575e6f276810675e ]]();
    var_71c2d4c5700674f7 = var_647e0301d37aebf7 + var_bb85a75787c26d48 * (var_fd9f67f7fb502bd3 - var_647e0301d37aebf7);
    return var_71c2d4c5700674f7 / var_fd9f67f7fb502bd3 * 100;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3351
// Size: 0x2e
function function_b1b34805f6f1b18f() {
    var_fd9f67f7fb502bd3 = [[ function_706e311766a84377() ]]();
    return var_fd9f67f7fb502bd3 * self.swim.breath / 100;
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3387
// Size: 0x189
function function_5bcf4e2bd107536f() {
    self.swim.var_18fe76d95d79d75f = newclienthudelem(self);
    self.swim.var_18fe76d95d79d75f.sort = 1;
    self.swim.var_18fe76d95d79d75f.x = 0;
    self.swim.var_18fe76d95d79d75f.y = 0;
    self.swim.var_18fe76d95d79d75f.alignx = "left";
    self.swim.var_18fe76d95d79d75f.aligny = "top";
    self.swim.var_18fe76d95d79d75f.foreground = 0;
    self.swim.var_18fe76d95d79d75f.lowresbackground = 1;
    self.swim.var_18fe76d95d79d75f.horzalign = "fullscreen";
    self.swim.var_18fe76d95d79d75f.vertalign = "fullscreen";
    self.swim.var_18fe76d95d79d75f.alpha = 0;
    self.swim.var_18fe76d95d79d75f setshader("hud_swim_vignette", 640, 480);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3517
// Size: 0x24
function function_1cf86af6f8a0266d(msg1, msg2, timer) {
    self endon(msg1);
    self endon(msg2);
    wait(timer);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3542
// Size: 0xe
function function_c2be12529b0f0ad2() {
    return !isdefined(self.usingremote);
}

// Namespace namespace_42897ee7f159629b/namespace_8ade6bdb04213c12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3558
// Size: 0x31
function function_706e311766a84377() {
    if (isdefined(self.var_dc6dc154664cf0aa)) {
        return self.var_dc6dc154664cf0aa;
    } else {
        return level.swim.var_dc6dc154664cf0aa;
    }
}

