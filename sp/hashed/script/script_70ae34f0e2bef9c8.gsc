#using script_4b87f2871b6b025c;
#using scripts\common\utility.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\common\ai.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\player\cursor_hint.gsc;
#using scripts\sp\starts.gsc;
#using scripts\sp\hud_util.gsc;
#using scripts\sp\player_death.gsc;
#using scripts\stealth\utility.gsc;
#using scripts\stealth\manager.gsc;

#namespace namespace_1a415b76ac2ee769;

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x249
// Size: 0x45
function main() {
    function_e05aeec06b7b52aa(&function_4da231b2893604c, &function_de1545c98ed439f8, &function_a62d0f50f690359, &enterfunc, &exitfunc, &surfaceFunc, &descendfunc, &playsoundfunc, &visionsetfunc, &drownfunc, &function_6fed0ef13f84a258, &function_673ece83b6eb66c4);
}

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x296
// Size: 0x3b
function function_9ac5625caf26591e() {
    thread function_fc7d07d4cc7ae9f1();
    swimweapon = ter_op(isdefined(level.var_6eaa298d5870f13d), level.var_6eaa298d5870f13d, "iw9_me_diveknife_sp+iw9_me_knife");
    self giveweapon(swimweapon);
}

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d9
// Size: 0x36
function function_4da231b2893604c() {
    if (self function_635e39fc16a64657()) {
        return self.gs.var_36af6de4d83c4b32;
    }
    return self.gs.var_ebe1038e44cd6b22;
}

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x317
// Size: 0x36
function function_de1545c98ed439f8() {
    if (self function_635e39fc16a64657()) {
        return self.gs.var_56aaa9d6c6d1e63e;
    }
    return self.gs.var_a49d3d68b41c6e2e;
}

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x355
// Size: 0x15
function function_a62d0f50f690359() {
    return self.gs.var_44aa592fd4d93eb;
}

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x373
// Size: 0x31
function surfaceFunc() {
    if (flag("stealth_enabled")) {
        function_a11b6adce495c6ef();
    }
    if (isdefined(level.var_527517c2136ee706)) {
        thread [[ level.var_527517c2136ee706 ]]();
    }
}

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ac
// Size: 0x31
function descendfunc() {
    if (flag("stealth_enabled")) {
        function_8cebf40421c587da();
    }
    if (isdefined(level.var_5dd2f422579238e3)) {
        thread [[ level.var_5dd2f422579238e3 ]]();
    }
}

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e5
// Size: 0x1c
function enterfunc() {
    if (isdefined(level.var_11774378854292ce)) {
        thread [[ level.var_11774378854292ce ]]();
    }
}

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x409
// Size: 0x1c
function exitfunc() {
    if (isdefined(level.var_ed574a17ec9472a)) {
        thread [[ level.var_ed574a17ec9472a ]]();
    }
}

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x42d
// Size: 0x2c
function playsoundfunc(var_78264a131b0e70ac, var_1ddc31dc2f8faa49, soundsource) {
    if (soundexists(var_78264a131b0e70ac)) {
        self playlocalsound(var_78264a131b0e70ac);
    }
}

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x461
// Size: 0x37
function visionsetfunc(visionset, transitiontime) {
    visionsetnaked(visionset, transitiontime);
    if (isdefined(level.var_8643741bd3eaa10e)) {
        thread [[ level.var_8643741bd3eaa10e ]](visionset, transitiontime);
    }
}

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a0
// Size: 0xc
function drownfunc() {
    scripts\sp\player_death::set_custom_death_quote(306);
}

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b4
// Size: 0x21
function function_6fed0ef13f84a258() {
    if (isdefined(level.var_e08155a589fd83f5)) {
        return [[ level.var_e08155a589fd83f5 ]]();
    }
    return self function_7ee20cf3c0390e21();
}

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4de
// Size: 0x1a1
function function_8cebf40421c587da() {
    level.player endon("death");
    level notify("level_setStealthSettings");
    level endon("level_setStealthSettings");
    hiddenranges["prone"] = 30;
    hiddenranges["crouch"] = 50;
    hiddenranges["stand"] = 100;
    var_b6b642cbeff52b88["prone"] = 10;
    var_b6b642cbeff52b88["crouch"] = 25;
    var_b6b642cbeff52b88["stand"] = 75;
    hiddenranges["shadow_prone"] = 0.05;
    hiddenranges["shadow_crouch"] = 0.05;
    hiddenranges["shadow_stand"] = 0.3;
    spottedranges["prone"] = 100;
    spottedranges["crouch"] = 200;
    spottedranges["stand"] = 400;
    var_d0f35fc0a5c3df79["prone"] = 75;
    var_d0f35fc0a5c3df79["crouch"] = 150;
    var_d0f35fc0a5c3df79["stand"] = 350;
    spottedranges["shadow_prone"] = 0.01;
    spottedranges["shadow_crouch"] = 0.02;
    spottedranges["shadow_stand"] = 0.38;
    var_8f3f480583606401["prone"] = 1.1;
    var_8f3f480583606401["crouch"] = 1.1;
    var_8f3f480583606401["stand"] = 1.1;
    var_fac370d058479827["prone"] = 0;
    var_fac370d058479827["crouch"] = 0;
    var_fac370d058479827["stand"] = 0;
    var_fb574b7959625bf0["prone"] = 0;
    var_fb574b7959625bf0["crouch"] = 0;
    var_fb574b7959625bf0["stand"] = 0;
    scripts\stealth\utility::set_detect_ranges(hiddenranges, spottedranges, var_8f3f480583606401);
    scripts\stealth\utility::set_min_detect_range_darkness(var_b6b642cbeff52b88, var_d0f35fc0a5c3df79);
    scripts\stealth\utility::function_f3883fe06a11269(var_fac370d058479827, var_fb574b7959625bf0);
}

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x687
// Size: 0x261
function function_a11b6adce495c6ef() {
    level.player endon("death");
    level notify("level_setStealthSettings");
    level endon("level_setStealthSettings");
    hiddenranges["prone"] = 400;
    hiddenranges["crouch"] = 700;
    hiddenranges["stand"] = 950;
    var_b6b642cbeff52b88["prone"] = 150;
    var_b6b642cbeff52b88["crouch"] = 350;
    var_b6b642cbeff52b88["stand"] = 600;
    hiddenranges["shadow_prone"] = 0.05;
    hiddenranges["shadow_crouch"] = 0.05;
    hiddenranges["shadow_stand"] = 0.3;
    spottedranges["prone"] = 500;
    spottedranges["crouch"] = 1600;
    spottedranges["stand"] = 2150;
    var_d0f35fc0a5c3df79["prone"] = 250;
    var_d0f35fc0a5c3df79["crouch"] = 1000;
    var_d0f35fc0a5c3df79["stand"] = 1800;
    spottedranges["shadow_prone"] = 0.01;
    spottedranges["shadow_crouch"] = 0.02;
    spottedranges["shadow_stand"] = 0.38;
    var_8f3f480583606401["prone"] = 1.1;
    var_8f3f480583606401["crouch"] = 1.15;
    var_8f3f480583606401["stand"] = 1.2;
    var_fac370d058479827["prone"] = 0;
    var_fac370d058479827["crouch"] = 0;
    var_fac370d058479827["stand"] = 0;
    var_fb574b7959625bf0["prone"] = 0;
    var_fb574b7959625bf0["crouch"] = 0;
    var_fb574b7959625bf0["stand"] = 0;
    scripts\stealth\utility::set_detect_ranges(hiddenranges, spottedranges, var_8f3f480583606401);
    scripts\stealth\utility::set_min_detect_range_darkness(var_b6b642cbeff52b88, var_d0f35fc0a5c3df79);
    scripts\stealth\utility::function_f3883fe06a11269(var_fac370d058479827, var_fb574b7959625bf0);
    event_distances["spotted"]["explosion"] = 2500;
    event_distances["hidden"]["explosion"] = 2500;
    event_distances["spotted"]["gunshot"] = 2500;
    event_distances["hidden"]["gunshot"] = 2500;
    event_distances["spotted"]["footstep"] = 200;
    event_distances["hidden"]["footstep"] = 200;
    event_distances["spotted"]["footstep_walk"] = 100;
    event_distances["hidden"]["footstep_walk"] = 100;
    event_distances["spotted"]["footstep_sprint"] = 500;
    event_distances["hidden"]["footstep_sprint"] = 500;
    scripts\stealth\manager::set_custom_distances(event_distances);
}

// Namespace namespace_1a415b76ac2ee769 / namespace_377de7677773280e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8f0
// Size: 0xe7
function function_673ece83b6eb66c4(vfx, notify_kill, timeout) {
    self endon("disconnect");
    view_model = self getviewmodel();
    if (!isdefined(view_model) || view_model == "") {
        iprintlnbold("swim_common::vfx_on_client entity <" + self getentitynumber() + "> does not have a model");
        return;
    }
    if (!hastag(view_model, "tag_eye")) {
        iprintlnbold("swim_common::vfx_on_client model <" + view_model + "> does not have tag_eye");
        return;
    }
    var_556cfd1dce0539db = spawn_tag_origin();
    var_556cfd1dce0539db linktoplayerview(self, "tag_eye");
    playfxontagforclients(level._effect[vfx], var_556cfd1dce0539db, "tag_origin", self);
    if (isdefined(notify_kill)) {
        function_1cf86af6f8a0266d(notify_kill, "death", timeout);
        killfxontag(level._effect[vfx], var_556cfd1dce0539db, "tag_origin");
        var_556cfd1dce0539db delete();
    }
}

