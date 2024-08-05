#using script_72ef6b9f0cf1f55a;
#using scripts\engine\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\system.gsc;
#using scripts\engine\sp\objectives.gsc;
#using script_4a70de683189a148;
#using scripts\common\ui.gsc;

#namespace objective_splash;

// Namespace objective_splash / namespace_f8a964affd6c5998
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x1af
// Size: 0x21
function private autoexec __init__system__() {
    system::register(#"objective_splash", #"hash_58f5dc856591d010", &pre_main, undefined);
}

// Namespace objective_splash / namespace_f8a964affd6c5998
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1d8
// Size: 0x59
function private pre_main() {
    if (!isdefined(level.var_b9eee5bad6ec9bcd)) {
        level.var_b9eee5bad6ec9bcd = spawnstruct();
    }
    scripts\engine\sp\objectives::function_1a7f32a7c56ad4e0(&namespace_f8a964affd6c5998::show_splash);
    level.var_b9eee5bad6ec9bcd.widget = function_6cd0a8e23ff14e13("scripted_widget_objective_splash");
    scripts\common\ui::lui_registercallback("objective_splash_complete", &function_1c664fdf9926ddf1);
}

// Namespace objective_splash / namespace_f8a964affd6c5998
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x239
// Size: 0x78
function private function_79bc04af6da056bb(var_b54e311516253de2, is_completed, var_ab20541e485d5ba0, var_1b0922c37b1abf7) {
    is_completed = default_to(is_completed, 0);
    var_ab20541e485d5ba0 = default_to(var_ab20541e485d5ba0, 0);
    var_1b0922c37b1abf7 = default_to(var_1b0922c37b1abf7, -1);
    fields = [];
    fields["title_index"] = function_8c14a8a658013e4e(var_b54e311516253de2);
    fields["is_completed"] = is_completed;
    fields["count"] = var_ab20541e485d5ba0;
    fields["table_id"] = var_1b0922c37b1abf7;
    return fields;
}

// Namespace objective_splash / namespace_f8a964affd6c5998
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba
// Size: 0x146
function show_splash(var_ac3f3e203c97d7b2, var_b54e311516253de2, is_completed, var_ab20541e485d5ba0, var_1b0922c37b1abf7) {
    assert(isdefined(var_ac3f3e203c97d7b2));
    assert(isdefined(var_b54e311516253de2));
    assertex(isdefined(level.var_b9eee5bad6ec9bcd.widget), "The splash widget, " + level.var_b9eee5bad6ec9bcd.widget + ", does not exist or is not included in the level's scripted widget list. Please check APE.");
    settings = spawnstruct();
    settings.ref = var_ac3f3e203c97d7b2;
    settings.var_b54e311516253de2 = var_b54e311516253de2;
    settings.is_completed = is_completed;
    settings.var_ab20541e485d5ba0 = var_ab20541e485d5ba0;
    settings.var_1b0922c37b1abf7 = var_1b0922c37b1abf7;
    level.var_b9eee5bad6ec9bcd.settings = settings;
    if (!function_ada0825249682644("objective_splash")) {
        function_90de31b2cbef19f9("objective_splash", level.var_b9eee5bad6ec9bcd.widget);
    } else {
        waitframe();
    }
    function_14a0ee2aaf9128c3("objective_splash", function_79bc04af6da056bb(var_b54e311516253de2, is_completed, var_ab20541e485d5ba0, var_1b0922c37b1abf7), 1);
    function_f4c37324750dc183("objective_splash", 0, 0, 3, 3);
    thread function_2dfbf73728a84824();
}

// Namespace objective_splash / namespace_f8a964affd6c5998
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x408
// Size: 0x2e
function function_2dfbf73728a84824() {
    self endon("disconnect");
    self endon("death");
    self setclientomnvar("ui_show_objectives", 1);
    wait 3;
    self setclientomnvar("ui_show_objectives", 0);
}

// Namespace objective_splash / namespace_f8a964affd6c5998
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x43e
// Size: 0x13
function function_e5ba01b6b27e6823(var_dfed9bc85a9f95ba, var_847792c9ef6464e9) {
    
}

// Namespace objective_splash / namespace_f8a964affd6c5998
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x459
// Size: 0x18
function function_56854474e9410861(var_c9913039c855ec7e) {
    function_d28fa5295a04d555("objective_splash", var_c9913039c855ec7e);
}

// Namespace objective_splash / namespace_f8a964affd6c5998
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x479
// Size: 0x2a
function function_1c664fdf9926ddf1(val) {
    level.var_b9eee5bad6ec9bcd.settings = undefined;
    function_fb3c9a259f146781("objective_splash");
}

