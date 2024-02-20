// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3f51a039c4a1a113;
#using scripts\common\ui.gsc;

#namespace namespace_6917e6eed10cfc44;

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x11e6
// Size: 0x1a
function private autoexec __init__system__() {
    system::register(#"hash_58f5dc856591d010", undefined, &function_ca54f37762600466, undefined);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1207
// Size: 0x10c
function private function_ca54f37762600466() {
    if (!isdefined(level.player)) {
        level.player = getentarray("player", "classname")[0];
    }
    if (!isdefined(level.var_6917e6eed10cfc44)) {
        level.var_6917e6eed10cfc44 = spawnstruct();
    }
    if (!isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d)) {
        level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d = spawnstruct();
    }
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    data.var_a1211a13c3c42303 = [];
    data.var_84064eed6a7b6da2 = [];
    data.archetypes = [];
    data.var_56a961d04403887 = spawnstruct();
    function_ce0d74e919485109(function_fac756723bad75d7());
    function_ce0d74e919485109(function_f47d44a82f05a2bd());
    function_ce0d74e919485109(function_ac835b45b726185c());
    function_ce0d74e919485109(function_1e95884aa052ae3e());
    namespace_61d0e47c5dff187c::lui_registercallback("scripted_widget_closed", &scripted_widget_closed);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x131a
// Size: 0x525
function private function_ce0d74e919485109(var_44c1d0100b18dd6d) {
    if (!isdefined(var_44c1d0100b18dd6d)) {
        return;
    }
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    data.var_4dc78c94cd673b03 = var_44c1d0100b18dd6d.var_348f35d05ac9a37e;
    if (isdefined(var_44c1d0100b18dd6d.archetypes)) {
        foreach (archetype in var_44c1d0100b18dd6d.archetypes) {
            var_4e701aea48f607a5 = getscriptbundle("scriptedwidgetarchetype:" + archetype.archetype);
            var_c54e73d434c5c526 = tolower(archetype.archetype);
            if (isdefined(var_4e701aea48f607a5) && !isdefined(data.archetypes[var_c54e73d434c5c526])) {
                data.archetypes[var_c54e73d434c5c526] = [];
                shift = 0;
                foreach (var_425be2d23967a154 in var_4e701aea48f607a5.fields) {
                    field = tolower(var_425be2d23967a154.field_name);
                    max_value = var_425be2d23967a154.max_value;
                    var_671f4caee6a150f1 = var_425be2d23967a154.var_671f4caee6a150f1;
                    /#
                        assertex(max_value >= var_671f4caee6a150f1, "The max value (" + max_value + ") for widget archetype <" + var_c54e73d434c5c526 + ">, field <" + field + "> exceeds the step increment of " + var_671f4caee6a150f1 + ". Clamping max value to " + var_671f4caee6a150f1);
                    #/
                    max_value = max(max_value, var_671f4caee6a150f1);
                    bits = int(ceil(log(max_value / var_671f4caee6a150f1 + 1) / log(2)));
                    data.archetypes[var_c54e73d434c5c526][field] = spawnstruct();
                    data.archetypes[var_c54e73d434c5c526][field].bits = bits;
                    data.archetypes[var_c54e73d434c5c526][field].max_value = max_value;
                    data.archetypes[var_c54e73d434c5c526][field].var_671f4caee6a150f1 = var_671f4caee6a150f1;
                    data.archetypes[var_c54e73d434c5c526][field].shift = shift;
                    data.archetypes[var_c54e73d434c5c526][field].mask = int(pow(2, bits) - 1) << shift;
                    shift = shift + bits;
                    /#
                        assertex(shift <= 32, "Widget archetype " + var_c54e73d434c5c526 + "'s fields exceeds the maximum 32 bits of the omnvar.  Please adjust the field values for " + var_c54e73d434c5c526 + " and ensure the bits used by all fields do not exceed 32.");
                    #/
                }
            }
        }
    }
    if (isdefined(var_44c1d0100b18dd6d.var_93ad9899a27ab729)) {
        foreach (anchor in var_44c1d0100b18dd6d.var_93ad9899a27ab729) {
            var_2b588b4752b483cd = getscriptbundle("scriptedwidgetanchorsettings:" + anchor.anchor);
            var_a1a802b5a5af136e = tolower(anchor.anchor);
            if (isdefined(var_2b588b4752b483cd) && !isdefined(data.var_84064eed6a7b6da2[var_a1a802b5a5af136e])) {
                data.var_84064eed6a7b6da2[var_a1a802b5a5af136e] = data.var_84064eed6a7b6da2.size;
            }
        }
    }
    foreach (widget in var_44c1d0100b18dd6d.var_44c1d0100b18dd6d) {
        function_26f299852d555394(widget.var_fbdf7d04935841ac);
    }
    if (isdefined(var_44c1d0100b18dd6d.var_fe35ca9b37873aa2) && var_44c1d0100b18dd6d.var_fe35ca9b37873aa2 > 0) {
        data.var_56a961d04403887.var_bcbce1f4c2df63aa = var_44c1d0100b18dd6d.var_fe35ca9b37873aa2;
        data.var_56a961d04403887.var_775c3162fdfa8f10 = ceil(data.var_56a961d04403887.var_bcbce1f4c2df63aa / 8);
        data.var_56a961d04403887.var_7d9318f8475c1c99 = 0;
        data.var_56a961d04403887.var_6088cf79a58ae917 = 0;
        if (data.var_56a961d04403887.var_775c3162fdfa8f10 > 1) {
            data.var_56a961d04403887.var_7d9318f8475c1c99 = 8;
            data.var_56a961d04403887.var_6088cf79a58ae917 = int(28);
        }
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1846
// Size: 0x4cd
function private function_26f299852d555394(var_fda9e2f84c5977d9) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    var_5476426e980f6602 = getscriptbundle("scriptedwidget:" + var_fda9e2f84c5977d9);
    var_fda9e2f84c5977d9 = tolower(var_fda9e2f84c5977d9);
    if (isdefined(var_5476426e980f6602) && !isdefined(data.var_a1211a13c3c42303[var_fda9e2f84c5977d9])) {
        data.var_a1211a13c3c42303[var_fda9e2f84c5977d9] = spawnstruct();
        data.var_a1211a13c3c42303[var_fda9e2f84c5977d9].index = data.var_a1211a13c3c42303.size;
        if (isdefined(var_5476426e980f6602.archetype) && var_5476426e980f6602.archetype != "") {
            archetype = getscriptbundle("scriptedwidgetarchetype:" + var_5476426e980f6602.archetype);
            var_c54e73d434c5c526 = tolower(var_5476426e980f6602.archetype);
            /#
                assertex(isdefined(data.archetypes[var_c54e73d434c5c526]), "Attempting to use scripted widget " + var_fda9e2f84c5977d9 + " but the archetype " + var_c54e73d434c5c526 + " was not added to the archetypes array in the appropriate scriptedwidgetslist asset");
            #/
            if (isdefined(archetype) && isdefined(data.archetypes[var_c54e73d434c5c526])) {
                data.var_a1211a13c3c42303[var_fda9e2f84c5977d9].archetype = var_c54e73d434c5c526;
            }
        }
        data.var_a1211a13c3c42303[var_fda9e2f84c5977d9].parameters = [];
        if (isdefined(var_5476426e980f6602.parameters)) {
            foreach (var_bd408bcfdf90c7b9, param in var_5476426e980f6602.parameters) {
                if (isdefined(param.name) && param.name != "") {
                    data.var_a1211a13c3c42303[var_fda9e2f84c5977d9].parameters[tolower(param.name)] = var_bd408bcfdf90c7b9;
                }
            }
        }
        data.var_a1211a13c3c42303[var_fda9e2f84c5977d9].states = [];
        if (isdefined(var_5476426e980f6602.states)) {
            foreach (var_3b68dc8e4599d4cd, state in var_5476426e980f6602.states) {
                if (isdefined(state.name) && state.name != "") {
                    data.var_a1211a13c3c42303[var_fda9e2f84c5977d9].states[tolower(state.name)] = var_3b68dc8e4599d4cd;
                }
            }
        }
        data.var_a1211a13c3c42303[var_fda9e2f84c5977d9].children = [];
        if (isdefined(var_5476426e980f6602.children)) {
            foreach (child in var_5476426e980f6602.children) {
                if (isdefined(child.name) && child.name != "") {
                    var_71d99a96ebf49ac1 = tolower(child.name);
                    data.var_a1211a13c3c42303[var_fda9e2f84c5977d9].children[var_71d99a96ebf49ac1] = [];
                    foreach (var_f5de074125c2d341, var_dae25add82279e96 in child.var_a2d839f66f89ffbe) {
                        if (isdefined(var_dae25add82279e96.name)) {
                            var_35de4a7a76aee370 = tolower(var_dae25add82279e96.name);
                            data.var_a1211a13c3c42303[var_fda9e2f84c5977d9].children[var_71d99a96ebf49ac1][var_35de4a7a76aee370] = spawnstruct();
                            data.var_a1211a13c3c42303[var_fda9e2f84c5977d9].children[var_71d99a96ebf49ac1][var_35de4a7a76aee370].index = var_f5de074125c2d341 + 1;
                            data.var_a1211a13c3c42303[var_fda9e2f84c5977d9].children[var_71d99a96ebf49ac1][var_35de4a7a76aee370].widget = var_dae25add82279e96.var_7097fb76aa380257;
                            function_26f299852d555394(var_dae25add82279e96.var_7097fb76aa380257);
                        }
                    }
                }
            }
        }
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d1a
// Size: 0xf2
function function_efa7d98eea1fb836(var_fda9e2f84c5977d9, var_71d99a96ebf49ac1, var_35de4a7a76aee370) {
    var_fda9e2f84c5977d9 = tolower(var_fda9e2f84c5977d9);
    var_71d99a96ebf49ac1 = tolower(var_71d99a96ebf49ac1);
    var_35de4a7a76aee370 = tolower(var_35de4a7a76aee370);
    if (isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_a1211a13c3c42303[var_fda9e2f84c5977d9]) && isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_a1211a13c3c42303[var_fda9e2f84c5977d9].children[var_71d99a96ebf49ac1]) && isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_a1211a13c3c42303[var_fda9e2f84c5977d9].children[var_71d99a96ebf49ac1][var_35de4a7a76aee370])) {
        return level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_a1211a13c3c42303[var_fda9e2f84c5977d9].children[var_71d99a96ebf49ac1][var_35de4a7a76aee370].widget;
    }
    return undefined;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e14
// Size: 0xf2
function function_ade28fda795d5664(var_fda9e2f84c5977d9, var_71d99a96ebf49ac1, var_35de4a7a76aee370) {
    var_fda9e2f84c5977d9 = tolower(var_fda9e2f84c5977d9);
    var_71d99a96ebf49ac1 = tolower(var_71d99a96ebf49ac1);
    var_35de4a7a76aee370 = tolower(var_35de4a7a76aee370);
    if (isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_a1211a13c3c42303[var_fda9e2f84c5977d9]) && isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_a1211a13c3c42303[var_fda9e2f84c5977d9].children[var_71d99a96ebf49ac1]) && isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_a1211a13c3c42303[var_fda9e2f84c5977d9].children[var_71d99a96ebf49ac1][var_35de4a7a76aee370])) {
        return level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_a1211a13c3c42303[var_fda9e2f84c5977d9].children[var_71d99a96ebf49ac1][var_35de4a7a76aee370].index;
    }
    return undefined;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f0e
// Size: 0x100
function function_63d35b39e955e65c(var_fee88e2c79edd2f, var_1212b8095077474c) {
    if (!isdefined(level.var_6917e6eed10cfc44)) {
        level.var_6917e6eed10cfc44 = spawnstruct();
    }
    if (!isdefined(level.var_6917e6eed10cfc44.var_f212ecf957ec73f0)) {
        level.var_6917e6eed10cfc44.var_f212ecf957ec73f0 = spawnstruct();
    }
    data = level.var_6917e6eed10cfc44.var_f212ecf957ec73f0;
    data.omnvar = var_fee88e2c79edd2f;
    data.var_a2d839f66f89ffbe = [];
    if (isdefined(var_1212b8095077474c) && tableexists(var_1212b8095077474c)) {
        rows = tablelookupgetnumrows(var_1212b8095077474c);
        for (row = 0; row < rows; row++) {
            var_ccdb02b31d817f18 = tablelookupbyrow(var_1212b8095077474c, row, 0);
            if (var_ccdb02b31d817f18 != "") {
                data.var_a2d839f66f89ffbe[tolower(var_ccdb02b31d817f18)] = row;
            }
        }
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2015
// Size: 0x170
function function_5c5dd45babfb8d7d(var_a2d839f66f89ffbe, shouldhide) {
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to hide or show widgets before hide_hud_widgets_init() was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_f212ecf957ec73f0), "Tried to hide or show widgets before hide_hud_widgets_init() was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_f212ecf957ec73f0.var_a2d839f66f89ffbe), "Tried to hide or show widgets before hide_hud_widgets_init() was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_f212ecf957ec73f0.omnvar), "No omnvar specified for hiding hud widgets.  Call hide_hud_widgets_init() and pass in an omnvar.");
    #/
    data = level.var_6917e6eed10cfc44.var_f212ecf957ec73f0;
    if (!isarray(var_a2d839f66f89ffbe)) {
        var_a2d839f66f89ffbe = [0:var_a2d839f66f89ffbe];
    }
    foreach (widget in var_a2d839f66f89ffbe) {
        widget = tolower(widget);
        /#
            assertex(isdefined(data.var_a2d839f66f89ffbe[widget]), "Tried to hide or show widget " + widget + ", but that widget is not registered in hide_hud_widgets_init()");
        #/
        shouldhide = function_f801c3e967c7768a(widget, shouldhide);
        self setclientomnvarbit(data.omnvar, data.var_a2d839f66f89ffbe[widget], shouldhide);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x218c
// Size: 0x2e8
function function_90de31b2cbef19f9(var_8950ba0ebceac37b, var_639d14fd4e8eab82, var_888051b294f9f017) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to create scripted widgets before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to create scripted widgets before scripted_widgets_init was called.");
    #/
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b);
    var_639d14fd4e8eab82 = tolower(var_639d14fd4e8eab82);
    if (function_ada0825249682644(var_8950ba0ebceac37b)) {
        /#
            assert("Cannot create scripted widget: " + var_8950ba0ebceac37b + ".  That reference is already active.");
        #/
        return;
    }
    index = function_f94203b920f0ba27(var_8950ba0ebceac37b, var_639d14fd4e8eab82);
    if (isdefined(index)) {
        if (isdefined(var_888051b294f9f017)) {
            if (isdefined(var_888051b294f9f017.param)) {
                function_cc46ab20b75d5c58(var_888051b294f9f017.param, "ui_scripted_widget_" + "param_" + index, data.var_a1211a13c3c42303[var_639d14fd4e8eab82].parameters);
            }
            if (isdefined(var_888051b294f9f017.data)) {
                function_cc46ab20b75d5c58(var_888051b294f9f017.data, "ui_scripted_widget_" + "data_" + index);
            }
            if (isdefined(var_888051b294f9f017.state)) {
                function_cc46ab20b75d5c58(var_888051b294f9f017.state, "ui_scripted_widget_" + "state_" + index, data.var_a1211a13c3c42303[var_639d14fd4e8eab82].states);
            }
            if (isdefined(var_888051b294f9f017.priority)) {
                function_cc46ab20b75d5c58(var_888051b294f9f017.priority, "ui_scripted_widget_" + "priority_" + index);
            }
            if (istrue(var_888051b294f9f017.var_bc7bd3c63bd5d717)) {
                function_cc46ab20b75d5c58(1, "ui_scripted_widget_" + "under_hud_" + index);
            }
            if (isent(var_888051b294f9f017.ent)) {
                /#
                    assertex(isdefined(var_888051b294f9f017.var_ed0da0b9f12f0da5), "Must define <anchor_type> in the widget struct if specifying an ent to anchor to");
                #/
                function_7a82d07837107ae6(var_8950ba0ebceac37b, var_888051b294f9f017.ent, var_888051b294f9f017.var_ed0da0b9f12f0da5);
            }
            if (isdefined(var_888051b294f9f017.position)) {
                function_f4c37324750dc183(var_8950ba0ebceac37b, var_888051b294f9f017.position.left, var_888051b294f9f017.position.top, var_888051b294f9f017.position.var_b8ce12ab15073e07, var_888051b294f9f017.position.var_3f4f7e6d296ad6d9, var_888051b294f9f017.position.var_5bf6089ef591d224);
            }
        }
        self setclientomnvar("ui_scripted_widget_" + "type_" + index, data.var_a1211a13c3c42303[var_639d14fd4e8eab82].index);
    } else {
        /#
            assert("Cannot create more scripted widgets until one is removed");
        #/
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x247b
// Size: 0x14f
function function_6cd0a8e23ff14e13(var_ee0f792a3b27d0b6) {
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to get the param index of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to get the param index of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(var_ee0f792a3b27d0b6), "Tried to get a widget name without providing a prefix as defined in APE");
    #/
    widget = function_6627dd3016f3d63f(var_ee0f792a3b27d0b6, getdvar(@"hash_687fb8f9b7a23245"));
    if (isdefined(widget)) {
        return widget;
    }
    widget = function_6627dd3016f3d63f(var_ee0f792a3b27d0b6, [0:function_3cb5da19764baa3(), 1:level.gametype]);
    if (isdefined(widget)) {
        return widget;
    }
    mode = "mp";
    if (utility::iscp()) {
        mode = "cp";
    } else if (utility::issp()) {
        mode = "sp";
    }
    widget = function_6627dd3016f3d63f(var_ee0f792a3b27d0b6, [0:function_3cb5da19764baa3(), 1:mode]);
    if (isdefined(widget)) {
        return widget;
    }
    widget = function_6627dd3016f3d63f(var_ee0f792a3b27d0b6, function_3cb5da19764baa3());
    if (isdefined(widget)) {
        return widget;
    }
    if (isdefined(level.gametype)) {
        widget = function_6627dd3016f3d63f(var_ee0f792a3b27d0b6, level.gametype);
        if (isdefined(widget)) {
            return widget;
        }
    }
    widget = function_6627dd3016f3d63f(var_ee0f792a3b27d0b6, mode);
    if (isdefined(widget)) {
        return widget;
    }
    if (function_a0ae4b54aa48ade2(var_ee0f792a3b27d0b6)) {
        return var_ee0f792a3b27d0b6;
    }
    return undefined;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d2
// Size: 0x111
function function_6627dd3016f3d63f(var_ee0f792a3b27d0b6, params) {
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to get the param index of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to get the param index of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(var_ee0f792a3b27d0b6), "Tried to get a widget name without providing a prefix as defined in APE");
    #/
    /#
        assertex(isdefined(params) && (isstring(params) || isarray(params)), "Tried to get a widget name without providing a string or table of params. Use scripted_widget_get_name_by_asset_prefix instead.");
    #/
    var_25f11f8236d36f82 = "";
    if (isstring(params)) {
        var_25f11f8236d36f82 = var_ee0f792a3b27d0b6 + "_" + params;
    } else if (isarray(params)) {
        for (i = 0; i < params.size; i++) {
            if (!isdefined(params[i])) {
                return undefined;
            }
            var_25f11f8236d36f82 = var_25f11f8236d36f82 + params[i];
            if (i + 1 < params.size) {
                var_25f11f8236d36f82 = var_25f11f8236d36f82 + "_";
            }
        }
        var_25f11f8236d36f82 = var_ee0f792a3b27d0b6 + "_" + var_25f11f8236d36f82;
    } else {
        var_25f11f8236d36f82 = var_ee0f792a3b27d0b6;
    }
    if (function_a0ae4b54aa48ade2(var_25f11f8236d36f82)) {
        return tolower(var_25f11f8236d36f82);
    }
    return undefined;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26eb
// Size: 0x5a
function function_a0ae4b54aa48ade2(var_639d14fd4e8eab82) {
    var_639d14fd4e8eab82 = tolower(var_639d14fd4e8eab82);
    return isdefined(level.var_6917e6eed10cfc44) && isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d) && isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_a1211a13c3c42303[var_639d14fd4e8eab82]);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x274d
// Size: 0x11c
function function_956ab5009d077253(var_779716333f062476, param_name, var_a66ee63570312822) {
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to get the params of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to get the params of a scripted widget before scripted_widgets_init was called.");
    #/
    var_5476426e980f6602 = getscriptbundle("scriptedwidget:" + var_779716333f062476);
    var_bd408bcfdf90c7b9 = function_7be2b65191088c8a(var_779716333f062476, param_name);
    if (isdefined(var_bd408bcfdf90c7b9)) {
        var_a66ee63570312822 = tolower(var_a66ee63570312822);
        foreach (property in var_5476426e980f6602.parameters[var_bd408bcfdf90c7b9].properties) {
            if (property.var_cf0d4d8cc5ac99a4.property == var_a66ee63570312822) {
                return property.var_cf0d4d8cc5ac99a4.value;
            }
        }
    }
    return undefined;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2871
// Size: 0x89
function function_7be2b65191088c8a(var_779716333f062476, param_name) {
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to get the param index of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to get the param index of a scripted widget before scripted_widgets_init was called.");
    #/
    var_779716333f062476 = tolower(var_779716333f062476);
    param_name = tolower(param_name);
    return level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_a1211a13c3c42303[var_779716333f062476].parameters[param_name];
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2902
// Size: 0x121
function private function_95809d3a84b2020b(var_8950ba0ebceac37b, var_a79e2ddd22fbba9a, var_54a61fbefc52eb7f, var_5a4ed2926457d0b) {
    var_b8868bce74340be6 = spawnstruct();
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b);
    if (isdefined(var_54a61fbefc52eb7f)) {
        var_b8868bce74340be6.omnvar = var_54a61fbefc52eb7f;
        var_b8868bce74340be6.type = var_8950ba0ebceac37b;
        var_b8868bce74340be6.var_26595f30949d77ee = var_5a4ed2926457d0b;
        /#
            assert(isdefined(data.var_a1211a13c3c42303[var_8950ba0ebceac37b]));
        #/
    } else {
        if (!function_ada0825249682644(var_8950ba0ebceac37b)) {
            return undefined;
        }
        var_5a344eb4f3c7ca28 = self.var_a14cb42739301f30[var_8950ba0ebceac37b];
        var_b8868bce74340be6.omnvar = "ui_scripted_widget_" + var_a79e2ddd22fbba9a + var_5a344eb4f3c7ca28.index;
        var_b8868bce74340be6.type = var_5a344eb4f3c7ca28.var_639d14fd4e8eab82;
        var_b8868bce74340be6.var_26595f30949d77ee = "ui_scripted_widget_" + "time_" + var_5a344eb4f3c7ca28.index;
    }
    return var_b8868bce74340be6;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a2b
// Size: 0xd9
function function_af4f62f0f944a8f1(var_8950ba0ebceac37b, var_54714ea11e54899c, var_54a61fbefc52eb7f) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to set the param of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to set the param of a scripted widget before scripted_widgets_init was called.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "param_", var_54a61fbefc52eb7f);
    if (isdefined(data)) {
        parameters = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_a1211a13c3c42303[data.type].parameters;
        function_cc46ab20b75d5c58(var_54714ea11e54899c, data.omnvar, parameters);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b0b
// Size: 0x9a
function function_b52897e8afbb0968(var_8950ba0ebceac37b, var_4328595f0a4773a9, var_54a61fbefc52eb7f) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to set the data of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to set the data of a scripted widget before scripted_widgets_init was called.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "data_", var_54a61fbefc52eb7f);
    if (isdefined(data)) {
        function_cc46ab20b75d5c58(var_4328595f0a4773a9, data.omnvar);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2bac
// Size: 0x81
function function_daff24f3e11825ae(var_779716333f062476, state_name) {
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to get the state index of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to get the state index of a scripted widget before scripted_widgets_init was called.");
    #/
    state_name = tolower(state_name);
    return level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_a1211a13c3c42303[var_779716333f062476].states[state_name];
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c35
// Size: 0xd9
function function_d28fa5295a04d555(var_8950ba0ebceac37b, state, var_54a61fbefc52eb7f) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to set the state of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to set the state of a scripted widget before scripted_widgets_init was called.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "state_", var_54a61fbefc52eb7f);
    if (isdefined(data)) {
        states = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_a1211a13c3c42303[data.type].states;
        function_cc46ab20b75d5c58(state, data.omnvar, states);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d15
// Size: 0x1eb
function function_7a82d07837107ae6(var_8950ba0ebceac37b, var_11241cbbde9bb942, var_ed0da0b9f12f0da5) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b);
    if (!function_ada0825249682644(var_8950ba0ebceac37b)) {
        return;
    }
    var_ed0da0b9f12f0da5 = tolower(var_ed0da0b9f12f0da5);
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    /#
        assertex(isdefined(data.var_84064eed6a7b6da2) && isdefined(data.var_84064eed6a7b6da2[var_ed0da0b9f12f0da5]), "Anchor type " + var_ed0da0b9f12f0da5 + " does not exist. Ensure that the anchor table has been registered in scripted_widgets_init(), it's included in a csv, and the entry exists within the table");
    #/
    if (!isdefined(self.var_414b9a0d57c1e081)) {
        self.var_414b9a0d57c1e081 = [];
    }
    var_8efef5b1e4d79b79 = var_11241cbbde9bb942 getentitynumber();
    if (!isdefined(self.var_414b9a0d57c1e081[var_8efef5b1e4d79b79])) {
        self.var_414b9a0d57c1e081[var_8efef5b1e4d79b79] = [];
    }
    var_5a344eb4f3c7ca28 = self.var_a14cb42739301f30[var_8950ba0ebceac37b];
    if (isdefined(var_5a344eb4f3c7ca28.var_8efef5b1e4d79b79)) {
        self.var_414b9a0d57c1e081[var_5a344eb4f3c7ca28.var_8efef5b1e4d79b79][var_8950ba0ebceac37b] = undefined;
        if (self.var_414b9a0d57c1e081[var_5a344eb4f3c7ca28.var_8efef5b1e4d79b79].size == 0) {
            self.var_414b9a0d57c1e081[var_5a344eb4f3c7ca28.var_8efef5b1e4d79b79] = undefined;
            self notify("_automatic_remove_anchored_widget_" + var_5a344eb4f3c7ca28.var_8efef5b1e4d79b79);
        }
    }
    var_5a344eb4f3c7ca28.var_8efef5b1e4d79b79 = var_8efef5b1e4d79b79;
    self.var_414b9a0d57c1e081[var_8efef5b1e4d79b79][var_8950ba0ebceac37b] = var_5a344eb4f3c7ca28.index;
    var_2486ed5c4df7182c = "ui_scripted_widget_" + "ent_" + var_5a344eb4f3c7ca28.index;
    self setclientomnvar(var_2486ed5c4df7182c, var_11241cbbde9bb942);
    function_cc46ab20b75d5c58(data.var_84064eed6a7b6da2[var_ed0da0b9f12f0da5], "ui_scripted_widget_" + "position_" + var_5a344eb4f3c7ca28.index);
    thread function_583777ac2b762d3(var_11241cbbde9bb942);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f07
// Size: 0x2eb
function function_f4c37324750dc183(var_8950ba0ebceac37b, x_pos, y_pos, var_b8ce12ab15073e07, var_3f4f7e6d296ad6d9, var_5bf6089ef591d224, var_54a61fbefc52eb7f) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "position_", var_54a61fbefc52eb7f);
    if (!isdefined(data)) {
        return;
    }
    if (!isdefined(var_5bf6089ef591d224)) {
        var_5bf6089ef591d224 = 1;
    }
    x_pos = int(x_pos);
    y_pos = int(y_pos);
    switch (var_b8ce12ab15073e07) {
    case 0:
        /#
            assertex(x_pos >= -63 && x_pos <= 1984, "<scripted_widget_set_position>, 'x_pos' parameter must be between " + -63 + " and " + 1984 + " for left alignment");
        #/
        x_pos = x_pos - -63;
        break;
    case 1:
    case 3:
        /#
            assertex(x_pos >= -1023 && x_pos <= 1024, "<scripted_widget_set_position>, 'x_pos' parameter must be between " + -1023 + " and " + 1024 + " for center alignment");
        #/
        x_pos = x_pos - -1023;
        break;
    case 2:
        /#
            assertex(x_pos >= -1984 && x_pos <= 0 - -63, "<scripted_widget_set_position>, 'x_pos' parameter must be between " + -1984 + " and " + 0 - -63 + " for right alignment");
        #/
        x_pos = x_pos + 1984;
        break;
    }
    switch (var_3f4f7e6d296ad6d9) {
    case 0:
        /#
            assertex(y_pos >= -483 && y_pos <= 1564, "<scripted_widget_set_position>, 'y_pos' parameter must be between " + -483 + " and " + 1564 + " for top alignment");
        #/
        y_pos = y_pos - -483;
        break;
    case 1:
    case 3:
        /#
            assertex(y_pos >= -1023 && y_pos <= 1024, "<scripted_widget_set_position>, 'y_pos' parameter must be between " + -1023 + " and " + 1024 + " for middle alignment");
        #/
        y_pos = y_pos - -1023;
        break;
    case 2:
        /#
            assertex(y_pos >= -1564 && y_pos <= 0 - -483, "<scripted_widget_set_position>, 'y_pos' parameter must be between " + -1564 + " and " + 0 - -483 + " for bottom alignment");
        #/
        y_pos = y_pos + 1564;
        break;
    }
    var_85ccc3f673e9cb9 = y_pos << 11;
    var_f7e258d3c20bfb80 = var_b8ce12ab15073e07 << 22;
    var_91800f6a184e5dca = var_3f4f7e6d296ad6d9 << 22 + 2;
    var_b086c1951a364c8d = ter_op(var_5bf6089ef591d224, 1, 0) << 22 + 2 + 2;
    var_981fb51e1637bff1 = x_pos + var_85ccc3f673e9cb9 + var_f7e258d3c20bfb80 + var_91800f6a184e5dca + var_b086c1951a364c8d;
    self setclientomnvar(data.omnvar, var_981fb51e1637bff1);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f9
// Size: 0x57
function function_f845164fd6027e79(datatype) {
    if (!isdefined(datatype)) {
        return 0;
    }
    switch (datatype) {
    case #"hash_a653d8ebf51ebac4":
        return 1;
    case #"hash_5b6fb3c943bab625":
        return 2;
    case #"hash_175a301ae8d1236a":
        return 3;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3257
// Size: 0x57
function function_863b22a1564f8eb(datatype) {
    if (!isdefined(datatype)) {
        return 0;
    }
    switch (datatype) {
    case #"hash_4fdc8686e8ea358":
        return 1;
    case #"hash_62df33229372c36a":
        return 2;
    case #"hash_175a301ae8d1236a":
        return 3;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x32b5
// Size: 0x1c6
function function_d2da2b563383891f(var_8950ba0ebceac37b, var_d66aa55144b09de9, var_54a61fbefc52eb7f) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "position_", var_54a61fbefc52eb7f);
    if (!isdefined(data)) {
        return undefined;
    }
    var_903af0484e4dfb93 = self getclientomnvar(data.omnvar);
    x_pos = (var_903af0484e4dfb93 & int(pow(2, 11) - 1)) >> 0;
    y_pos = (var_903af0484e4dfb93 & int(pow(2, 11) - 1)) >> 11;
    var_3f4f7e6d296ad6d9 = (var_903af0484e4dfb93 & int(pow(2, 2) - 1)) >> 22;
    var_b8ce12ab15073e07 = (var_903af0484e4dfb93 & int(pow(2, 2) - 1)) >> 22 + 2;
    switch (var_b8ce12ab15073e07) {
    case 0:
        x_pos = x_pos + -63;
        break;
    case 1:
    case 3:
        x_pos = x_pos + -1023;
        break;
    case 2:
        x_pos = x_pos - 1984;
        break;
    }
    switch (var_3f4f7e6d296ad6d9) {
    case 0:
        y_pos = y_pos + -483;
        break;
    case 1:
    case 3:
        y_pos = y_pos + -1023;
        break;
    case 2:
        y_pos = y_pos - 1564;
        break;
    }
    if (istrue(var_d66aa55144b09de9)) {
        x_pos = (x_pos - -63) / (1984 - -63);
        y_pos = (y_pos - -483) / (1564 - -483);
    }
    return (x_pos, y_pos, 0);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3483
// Size: 0x60
function function_1ec2f3bcef4a8818(var_8950ba0ebceac37b, priority, var_54a61fbefc52eb7f) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "priority_", var_54a61fbefc52eb7f);
    if (isdefined(data)) {
        self setclientomnvar(data.omnvar, priority);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34ea
// Size: 0xc2
function function_14a0ee2aaf9128c3(var_8950ba0ebceac37b, var_5ca69859253174c2, var_6d605bcb6cbf1bf9, var_54a61fbefc52eb7f, var_5a4ed2926457d0b) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to set the field values of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to set the field values of a scripted widget before scripted_widgets_init was called.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "data_", var_54a61fbefc52eb7f, var_5a4ed2926457d0b);
    if (!isdefined(data)) {
        return;
    }
    function_e375e5ca24ea7bf4(data.type, data.omnvar, var_5ca69859253174c2, data.var_26595f30949d77ee);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x35b3
// Size: 0xaf
function function_6e45b720d0914f42(var_8950ba0ebceac37b, field, value, var_54a61fbefc52eb7f) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to set the field values of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to set the field values of a scripted widget before scripted_widgets_init was called.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "data_", var_54a61fbefc52eb7f);
    if (!isdefined(data)) {
        return;
    }
    function_e6df6627eb26284f(data.type, data.omnvar, field, value);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3669
// Size: 0xd7
function function_2d3bf675525ba34c(var_8950ba0ebceac37b, field, var_54a61fbefc52eb7f) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to set the field values of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to set the field values of a scripted widget before scripted_widgets_init was called.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "data_", var_54a61fbefc52eb7f);
    if (!isdefined(data)) {
        return;
    }
    value = function_61dda643ffbb43a0(data.type, data.omnvar, [0:field]);
    function_e6df6627eb26284f(data.type, data.omnvar, field, !value[field]);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3747
// Size: 0xcc
function function_ddc9d8c3b0ef6b87(var_8950ba0ebceac37b, current_pct, target_pct, time, var_54a61fbefc52eb7f, var_5a4ed2926457d0b) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to set the progress of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to set the progress of a scripted widget before scripted_widgets_init was called.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "data_", var_54a61fbefc52eb7f);
    if (!isdefined(data)) {
        return;
    }
    function_ab8c8292f0d469c4(data.type, data.omnvar, current_pct, target_pct, time, data.var_26595f30949d77ee);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x381a
// Size: 0xc2
function function_315df71064cc10b8(var_8950ba0ebceac37b, current_pct, bool, var_54a61fbefc52eb7f, var_5a4ed2926457d0b) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to set the progress bool of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to set the progress bool of a scripted widget before scripted_widgets_init was called.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "data_", var_54a61fbefc52eb7f);
    if (!isdefined(data)) {
        return;
    }
    function_42866bf1e84c1d21(data.type, data.omnvar, current_pct, bool, data.var_26595f30949d77ee);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38e3
// Size: 0xc2
function function_a435f7db4b861f0c(var_8950ba0ebceac37b, current_pct, current_alpha, var_54a61fbefc52eb7f, var_5a4ed2926457d0b) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to set the progress alpha of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to set the progress alpha of a scripted widget before scripted_widgets_init was called.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "data_", var_54a61fbefc52eb7f);
    if (!isdefined(data)) {
        return;
    }
    function_7db1020b4d70e9e7(data.type, data.omnvar, current_pct, current_alpha, data.var_26595f30949d77ee);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x39ac
// Size: 0xcc
function function_2181b4358a46aab3(var_8950ba0ebceac37b, count, max_count, time, var_54a61fbefc52eb7f, var_5a4ed2926457d0b) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to set the count of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to set the count of a scripted widget before scripted_widgets_init was called.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "data_", var_54a61fbefc52eb7f);
    if (!isdefined(data)) {
        return;
    }
    function_99bfbb496e5ac12a(data.type, data.omnvar, count, max_count, time, data.var_26595f30949d77ee);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3a7f
// Size: 0xaf
function function_b93f1b828644c021(var_8950ba0ebceac37b, horizontal_alignment, vertical_alignment, var_54a61fbefc52eb7f) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to set the list item alignment of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to set the list item alignment of a scripted widget before scripted_widgets_init was called.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "data_", var_54a61fbefc52eb7f);
    if (!isdefined(data)) {
        return;
    }
    function_36bba30ae80af891(data.type, data.omnvar, horizontal_alignment, vertical_alignment);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b35
// Size: 0x9b
function function_1f51eabeded054f0(var_8950ba0ebceac37b, timestamp, var_54a61fbefc52eb7f) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to set the timestamp of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to set the timestamp of a scripted widget before scripted_widgets_init was called.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "time_", var_54a61fbefc52eb7f);
    if (!isdefined(data)) {
        return;
    }
    self setclientomnvar(data.omnvar, timestamp);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bd7
// Size: 0xa5
function function_1f1c11d26b17770f(var_8950ba0ebceac37b, fields, var_54a61fbefc52eb7f) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to set the field values of a scripted widget before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to set the field values of a scripted widget before scripted_widgets_init was called.");
    #/
    data = function_95809d3a84b2020b(var_8950ba0ebceac37b, "data_", var_54a61fbefc52eb7f);
    if (!isdefined(data)) {
        return;
    }
    return function_61dda643ffbb43a0(data.type, data.omnvar, fields);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c84
// Size: 0xcd
function function_fb3c9a259f146781(var_8950ba0ebceac37b) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44), "Tried to destroy scripted widgets before scripted_widgets_init was called.");
    #/
    /#
        assertex(isdefined(level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d), "Tried to destroy scripted widgets before scripted_widgets_init was called.");
    #/
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b);
    if (!function_ada0825249682644(var_8950ba0ebceac37b)) {
        return;
    }
    index = function_cca9604860a60e2a(var_8950ba0ebceac37b);
    if (isdefined(index)) {
        data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
        var_94a50c0a0059e601 = "ui_scripted_widget_" + "type_" + index;
        self setclientomnvar(var_94a50c0a0059e601, 0);
        self notify("scripted_widget_destroyed_" + var_8950ba0ebceac37b);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d58
// Size: 0x60
function function_ada0825249682644(var_8950ba0ebceac37b) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b);
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    return isdefined(self.var_a14cb42739301f30) && isdefined(self.var_a14cb42739301f30[var_8950ba0ebceac37b]);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3dc0
// Size: 0x32
function function_114fb9814c0b068d() {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    return !isdefined(self.var_a219288779b991ce) || self.var_a219288779b991ce.size > 0;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3dfa
// Size: 0x66
function function_440f285bc17a2787(var_ba535b154e96f87, var_639d14fd4e8eab82, var_f3c9d6430ee6d9e2) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    function_90de31b2cbef19f9(var_ba535b154e96f87, var_639d14fd4e8eab82);
    self.var_a14cb42739301f30[var_ba535b154e96f87].list = [];
    if (isdefined(var_f3c9d6430ee6d9e2)) {
        function_c9e5319d68e22011(var_ba535b154e96f87, var_f3c9d6430ee6d9e2);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e67
// Size: 0x38
function function_cf43a9641fd024af(var_ba535b154e96f87) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    function_fb3c9a259f146781(var_ba535b154e96f87);
    function_b267732c9e92f306(var_ba535b154e96f87);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3ea6
// Size: 0x53
function function_872bbb1fa784b8d8(var_ba535b154e96f87, var_71ab5de6311eb0c0, item_type, var_3cefc2b0c7f6f3ec) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    items = [];
    items[var_71ab5de6311eb0c0] = item_type;
    function_c9e5319d68e22011(var_ba535b154e96f87, items, var_3cefc2b0c7f6f3ec);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f00
// Size: 0xe7
function function_c9e5319d68e22011(var_ba535b154e96f87, var_f3c9d6430ee6d9e2, var_3cefc2b0c7f6f3ec) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    items = [];
    omnvars = [];
    foreach (var_71ab5de6311eb0c0, item_type in var_f3c9d6430ee6d9e2) {
        item_type = tolower(item_type);
        var_3de03bfa4e76b915 = function_eabc5d231d49caab(var_ba535b154e96f87, tolower(var_71ab5de6311eb0c0), item_type);
        /#
            assertex(isdefined(var_3de03bfa4e76b915), "Tried to allocate list item in scripted_widget_list_add_items(), but there are no more omnvars in reserve");
        #/
        if (isdefined(var_3de03bfa4e76b915)) {
            items[items.size] = item_type;
            omnvars[omnvars.size] = var_3de03bfa4e76b915;
        }
    }
    function_5afd39d9a06be177(var_ba535b154e96f87, items, omnvars, var_3cefc2b0c7f6f3ec);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3fee
// Size: 0x109
function function_1114ac444eb63515(var_ba535b154e96f87, items) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    /#
        assertex(self.var_a14cb42739301f30[var_ba535b154e96f87].list.size == items.size, "Trying to reorder items in the list, but the list sizes don't match");
    #/
    self.var_a14cb42739301f30[var_ba535b154e96f87].list = [];
    foreach (index, var_71ab5de6311eb0c0 in items) {
        item_data = function_9cee54c391590f92(var_ba535b154e96f87, var_71ab5de6311eb0c0);
        /#
            assertex(isdefined(item_data), "Trying to reorder list items for an item that does not currently exist: <" + var_71ab5de6311eb0c0 + ">");
        #/
        self.var_a14cb42739301f30[var_ba535b154e96f87].list[index] = item_data.var_3de03bfa4e76b915;
    }
    function_989fbe51aaf74cb(var_ba535b154e96f87);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x40fe
// Size: 0x199
function function_5270193c147bd4f(var_ba535b154e96f87, var_e9648468480b0e14, var_e9648768480b14ad) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    var_8ad345cd8693672b = function_9cee54c391590f92(var_ba535b154e96f87, var_e9648468480b0e14);
    var_8ad346cd8693695e = function_9cee54c391590f92(var_ba535b154e96f87, var_e9648768480b14ad);
    /#
        assertex(isdefined(var_8ad345cd8693672b), "Trying to swap list items but <" + var_e9648468480b0e14 + "> does not exist in the list");
    #/
    /#
        assertex(isdefined(var_8ad346cd8693695e), "Trying to swap list items but <" + var_e9648768480b14ad + "> does not exist in the list");
    #/
    var_3fec2d0b03e641b = undefined;
    var_3fec3d0b03e664e = undefined;
    var_ee925786ed8c373f = var_8ad345cd8693672b.var_3de03bfa4e76b915;
    var_ee925886ed8c3972 = var_8ad346cd8693695e.var_3de03bfa4e76b915;
    foreach (index, var_3de03bfa4e76b915 in self.var_a14cb42739301f30[var_ba535b154e96f87].list) {
        if (var_3de03bfa4e76b915 == var_ee925786ed8c373f) {
            var_3fec2d0b03e641b = index;
        }
        if (var_3de03bfa4e76b915 == var_ee925886ed8c3972) {
            var_3fec3d0b03e664e = index;
        }
    }
    self.var_a14cb42739301f30[var_ba535b154e96f87].list[var_3fec2d0b03e641b] = var_8ad346cd8693695e.var_3de03bfa4e76b915;
    self.var_a14cb42739301f30[var_ba535b154e96f87].list[var_3fec3d0b03e664e] = var_8ad345cd8693672b.var_3de03bfa4e76b915;
    function_989fbe51aaf74cb(var_ba535b154e96f87);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x429e
// Size: 0x10c
function function_52c3bc127d006d2a(var_ba535b154e96f87, var_6251f6c82cd01420) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    var_7934030f904694a7 = self.var_a14cb42739301f30[var_ba535b154e96f87].list.size;
    /#
        assertex(var_7934030f904694a7 >= abs(var_6251f6c82cd01420), "Attempting to shift list <" + var_ba535b154e96f87 + "> by " + var_6251f6c82cd01420 + "but, only " + var_7934030f904694a7 + " items exist in the list");
    #/
    var_2c624b000824f88 = var_6251f6c82cd01420;
    if (var_6251f6c82cd01420 < 0) {
        var_2c624b000824f88 = var_2c624b000824f88 + var_7934030f904694a7;
    }
    var_50bd74501466d521 = array_slice(self.var_a14cb42739301f30[var_ba535b154e96f87].list, 0, var_2c624b000824f88);
    var_50bd71501466ce88 = array_slice(self.var_a14cb42739301f30[var_ba535b154e96f87].list, var_2c624b000824f88, var_7934030f904694a7);
    self.var_a14cb42739301f30[var_ba535b154e96f87].list = array_combine(var_50bd71501466ce88, var_50bd74501466d521);
    function_989fbe51aaf74cb(var_ba535b154e96f87);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43b1
// Size: 0x61
function function_b33be752bae80ae0(var_ba535b154e96f87) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    self.var_a14cb42739301f30[var_ba535b154e96f87].list = array_reverse(self.var_a14cb42739301f30[var_ba535b154e96f87].list);
    function_989fbe51aaf74cb(var_ba535b154e96f87);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4419
// Size: 0x68
function function_6e7b649d7feb6bb8(var_ba535b154e96f87) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    /#
        assertex(isdefined(self.var_5805a2cdb3ddbe56) && isdefined(self.var_5805a2cdb3ddbe56[var_ba535b154e96f87]), "Tried to get list item refs, but the list <" + var_ba535b154e96f87 + "> does not currently exist");
    #/
    return getarraykeys(self.var_5805a2cdb3ddbe56[var_ba535b154e96f87]);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4489
// Size: 0x3f
function function_58cce4d095e706ab(var_ba535b154e96f87, var_71ab5de6311eb0c0, var_7a0a75a3e70333fe) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    function_31a20eb9ab140d08(var_ba535b154e96f87, [0:var_71ab5de6311eb0c0], var_7a0a75a3e70333fe);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44cf
// Size: 0xe5
function function_31a20eb9ab140d08(var_ba535b154e96f87, var_f3c9d6430ee6d9e2, var_7a0a75a3e70333fe) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    if (!function_ada0825249682644(var_ba535b154e96f87)) {
        return;
    }
    omnvars = [];
    foreach (var_71ab5de6311eb0c0 in var_f3c9d6430ee6d9e2) {
        var_71ab5de6311eb0c0 = tolower(var_71ab5de6311eb0c0);
        var_3de03bfa4e76b915 = function_fbb932b933235b5e(var_ba535b154e96f87, var_71ab5de6311eb0c0);
        if (isdefined(var_3de03bfa4e76b915)) {
            omnvars[omnvars.size - 1] = var_3de03bfa4e76b915;
        }
    }
    function_2654508daa8b0930(var_ba535b154e96f87, omnvars);
    if (istrue(var_7a0a75a3e70333fe) && !function_714a8c636f582042(var_ba535b154e96f87)) {
        function_cf43a9641fd024af(var_ba535b154e96f87);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x45bb
// Size: 0x5b
function function_5df3186604c72b24(var_ba535b154e96f87) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    if (!function_ada0825249682644(var_ba535b154e96f87)) {
        return;
    }
    function_b267732c9e92f306(var_ba535b154e96f87);
    self.var_a14cb42739301f30[var_ba535b154e96f87].list = [];
    function_b52897e8afbb0968(var_ba535b154e96f87, 0);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x461d
// Size: 0xe5
function function_88f7dd62c7058ef5(var_ba535b154e96f87, var_71ab5de6311eb0c0, param) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    var_71ab5de6311eb0c0 = tolower(var_71ab5de6311eb0c0);
    item_data = function_9cee54c391590f92(var_ba535b154e96f87, var_71ab5de6311eb0c0);
    if (isdefined(item_data)) {
        data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
        group = self.var_a14cb42739301f30[var_ba535b154e96f87].group;
        omnvar = function_e5a3c7e8ca795281(group, item_data.var_3de03bfa4e76b915, "param_");
        function_cc46ab20b75d5c58(param, omnvar, data.var_a1211a13c3c42303[item_data.var_639d14fd4e8eab82].parameters);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4709
// Size: 0xe5
function function_1f9e6ee15b7f47c9(var_ba535b154e96f87, var_71ab5de6311eb0c0, state) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    var_71ab5de6311eb0c0 = tolower(var_71ab5de6311eb0c0);
    item_data = function_9cee54c391590f92(var_ba535b154e96f87, var_71ab5de6311eb0c0);
    if (isdefined(item_data)) {
        data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
        group = self.var_a14cb42739301f30[var_ba535b154e96f87].group;
        omnvar = function_e5a3c7e8ca795281(group, item_data.var_3de03bfa4e76b915, "state_");
        function_cc46ab20b75d5c58(state, omnvar, data.var_a1211a13c3c42303[item_data.var_639d14fd4e8eab82].states);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x47f5
// Size: 0xc4
function function_cee2207c6855e73c(var_ba535b154e96f87, var_71ab5de6311eb0c0, var_4328595f0a4773a9) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    var_71ab5de6311eb0c0 = tolower(var_71ab5de6311eb0c0);
    item_data = function_9cee54c391590f92(var_ba535b154e96f87, var_71ab5de6311eb0c0);
    if (isdefined(item_data)) {
        data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
        group = self.var_a14cb42739301f30[var_ba535b154e96f87].group;
        omnvar = function_e5a3c7e8ca795281(group, item_data.var_3de03bfa4e76b915, "data_");
        function_cc46ab20b75d5c58(var_4328595f0a4773a9, omnvar);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x48c0
// Size: 0xe6
function function_3eec25a52a78f31f(var_ba535b154e96f87, var_71ab5de6311eb0c0, var_5ca69859253174c2, var_6d605bcb6cbf1bf9) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    var_71ab5de6311eb0c0 = tolower(var_71ab5de6311eb0c0);
    item_data = function_9cee54c391590f92(var_ba535b154e96f87, var_71ab5de6311eb0c0);
    if (isdefined(item_data)) {
        group = self.var_a14cb42739301f30[var_ba535b154e96f87].group;
        omnvar = function_e5a3c7e8ca795281(group, item_data.var_3de03bfa4e76b915, "data_");
        var_26595f30949d77ee = undefined;
        if (!istrue(var_6d605bcb6cbf1bf9)) {
            var_26595f30949d77ee = function_e5a3c7e8ca795281(group, item_data.var_3de03bfa4e76b915, "time_");
        }
        function_e375e5ca24ea7bf4(item_data.var_639d14fd4e8eab82, omnvar, var_5ca69859253174c2, var_26595f30949d77ee);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x49ad
// Size: 0xe9
function function_9d1591ce32fb0823(var_ba535b154e96f87, var_71ab5de6311eb0c0, current_pct, target_pct, time) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    var_71ab5de6311eb0c0 = tolower(var_71ab5de6311eb0c0);
    item_data = function_9cee54c391590f92(var_ba535b154e96f87, var_71ab5de6311eb0c0);
    if (isdefined(item_data)) {
        group = self.var_a14cb42739301f30[var_ba535b154e96f87].group;
        omnvar = function_e5a3c7e8ca795281(group, item_data.var_3de03bfa4e76b915, "data_");
        var_26595f30949d77ee = function_e5a3c7e8ca795281(group, item_data.var_3de03bfa4e76b915, "time_");
        function_ab8c8292f0d469c4(item_data.var_639d14fd4e8eab82, omnvar, current_pct, target_pct, time, var_26595f30949d77ee);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x4a9d
// Size: 0xe9
function function_6f4f043fa2101c0f(var_ba535b154e96f87, var_71ab5de6311eb0c0, count, max_count, time) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    var_71ab5de6311eb0c0 = tolower(var_71ab5de6311eb0c0);
    item_data = function_9cee54c391590f92(var_ba535b154e96f87, var_71ab5de6311eb0c0);
    if (isdefined(item_data)) {
        group = self.var_a14cb42739301f30[var_ba535b154e96f87].group;
        omnvar = function_e5a3c7e8ca795281(group, item_data.var_3de03bfa4e76b915, "data_");
        var_26595f30949d77ee = function_e5a3c7e8ca795281(group, item_data.var_3de03bfa4e76b915, "time_");
        function_99bfbb496e5ac12a(item_data.var_639d14fd4e8eab82, omnvar, count, max_count, time, var_26595f30949d77ee);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4b8d
// Size: 0xa3
function function_f86a348db854d294(var_ba535b154e96f87, var_71ab5de6311eb0c0, timestamp) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    var_71ab5de6311eb0c0 = tolower(var_71ab5de6311eb0c0);
    item_data = function_9cee54c391590f92(var_ba535b154e96f87, var_71ab5de6311eb0c0);
    if (isdefined(item_data)) {
        group = self.var_a14cb42739301f30[var_ba535b154e96f87].group;
        omnvar = function_e5a3c7e8ca795281(group, item_data.var_3de03bfa4e76b915, "time_");
        function_cc46ab20b75d5c58(timestamp, omnvar);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4c37
// Size: 0x64
function function_91fe3a20ea5f30c5(var_ba535b154e96f87, var_71ab5de6311eb0c0) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    var_71ab5de6311eb0c0 = tolower(var_71ab5de6311eb0c0);
    return isdefined(self.var_5805a2cdb3ddbe56) && isdefined(self.var_5805a2cdb3ddbe56[var_ba535b154e96f87]) && isdefined(self.var_5805a2cdb3ddbe56[var_ba535b154e96f87][var_71ab5de6311eb0c0]);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ca3
// Size: 0x54
function function_714a8c636f582042(var_ba535b154e96f87) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_ba535b154e96f87 = tolower(var_ba535b154e96f87);
    return isdefined(self.var_5805a2cdb3ddbe56) && isdefined(self.var_5805a2cdb3ddbe56[var_ba535b154e96f87]) && self.var_5805a2cdb3ddbe56[var_ba535b154e96f87].size > 0;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x4cff
// Size: 0x7f
function function_2acd5041c3f3305e(var_11241cbbde9bb942, var_8950ba0ebceac37b, var_639d14fd4e8eab82, var_ed0da0b9f12f0da5, var_888051b294f9f017) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b) + var_11241cbbde9bb942 getentitynumber();
    if (!isdefined(var_888051b294f9f017)) {
        var_888051b294f9f017 = spawnstruct();
    }
    var_888051b294f9f017.ent = var_11241cbbde9bb942;
    var_888051b294f9f017.var_ed0da0b9f12f0da5 = var_ed0da0b9f12f0da5;
    function_90de31b2cbef19f9(var_8950ba0ebceac37b, var_639d14fd4e8eab82, var_888051b294f9f017);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4d85
// Size: 0x48
function function_d54d04e9ec5b38e3(var_11241cbbde9bb942, var_8950ba0ebceac37b, param) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b) + var_11241cbbde9bb942 getentitynumber();
    function_af4f62f0f944a8f1(var_8950ba0ebceac37b, param);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4dd4
// Size: 0x48
function function_1d125bd1128e9582(var_11241cbbde9bb942, var_8950ba0ebceac37b, data) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b) + var_11241cbbde9bb942 getentitynumber();
    function_b52897e8afbb0968(var_8950ba0ebceac37b, data);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4e23
// Size: 0x48
function function_ad5527feaeffa977(var_11241cbbde9bb942, var_8950ba0ebceac37b, state) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b) + var_11241cbbde9bb942 getentitynumber();
    function_d28fa5295a04d555(var_8950ba0ebceac37b, state);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4e72
// Size: 0x50
function function_e426dd1d2fd9f6b5(var_11241cbbde9bb942, var_8950ba0ebceac37b, var_5ca69859253174c2, var_54a61fbefc52eb7f) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b) + var_11241cbbde9bb942 getentitynumber();
    return function_1f1c11d26b17770f(var_8950ba0ebceac37b, var_5ca69859253174c2, var_54a61fbefc52eb7f);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4eca
// Size: 0x51
function function_d0cd9bfbc5529d31(var_11241cbbde9bb942, var_8950ba0ebceac37b, var_5ca69859253174c2, var_6d605bcb6cbf1bf9) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b) + var_11241cbbde9bb942 getentitynumber();
    function_14a0ee2aaf9128c3(var_8950ba0ebceac37b, var_5ca69859253174c2, var_6d605bcb6cbf1bf9);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x4f22
// Size: 0x5a
function function_7d0a2b811ae8aebd(var_11241cbbde9bb942, var_8950ba0ebceac37b, current_pct, target_pct, time) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b) + var_11241cbbde9bb942 getentitynumber();
    function_ddc9d8c3b0ef6b87(var_8950ba0ebceac37b, current_pct, target_pct, time);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4f83
// Size: 0x51
function function_34831569ded8586a(var_11241cbbde9bb942, var_8950ba0ebceac37b, current_pct, bool) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b) + var_11241cbbde9bb942 getentitynumber();
    function_315df71064cc10b8(var_8950ba0ebceac37b, current_pct, bool);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4fdb
// Size: 0x51
function function_2b6611deface24de(var_11241cbbde9bb942, var_8950ba0ebceac37b, current_pct, current_alpha) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b) + var_11241cbbde9bb942 getentitynumber();
    function_a435f7db4b861f0c(var_8950ba0ebceac37b, current_pct, current_alpha);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5033
// Size: 0x48
function function_5c09e38e4b882a2a(var_11241cbbde9bb942, var_8950ba0ebceac37b, timestamp) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b) + var_11241cbbde9bb942 getentitynumber();
    function_1f51eabeded054f0(var_8950ba0ebceac37b, timestamp);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5082
// Size: 0x4c
function function_aae81ea024d45e77(var_11241cbbde9bb942, var_8950ba0ebceac37b) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_8efef5b1e4d79b79 = var_11241cbbde9bb942 getentitynumber();
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b) + var_8efef5b1e4d79b79;
    function_bb8cf49fbbe8c0d8(var_8950ba0ebceac37b, var_8efef5b1e4d79b79);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x50d5
// Size: 0x2d
function function_bb17fbfad71dc49b(var_11241cbbde9bb942) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    function_984451ca1b1af664(var_11241cbbde9bb942 getentitynumber());
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5109
// Size: 0x6f
function function_b76083c9909e209a(var_11241cbbde9bb942, var_8950ba0ebceac37b) {
    /#
        assertex(isplayer(self), "Must be called on a player.");
    #/
    var_8efef5b1e4d79b79 = var_11241cbbde9bb942 getentitynumber();
    var_8950ba0ebceac37b = tolower(var_8950ba0ebceac37b) + var_8efef5b1e4d79b79;
    return isdefined(self.var_414b9a0d57c1e081) && isdefined(self.var_414b9a0d57c1e081[var_8efef5b1e4d79b79]) && isdefined(self.var_414b9a0d57c1e081[var_8efef5b1e4d79b79][var_8950ba0ebceac37b]);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5180
// Size: 0x6f
function private function_bb8cf49fbbe8c0d8(var_8950ba0ebceac37b, var_8efef5b1e4d79b79) {
    if (isdefined(self.var_414b9a0d57c1e081[var_8efef5b1e4d79b79])) {
        if (isdefined(self.var_414b9a0d57c1e081[var_8efef5b1e4d79b79][var_8950ba0ebceac37b])) {
            function_fb3c9a259f146781(var_8950ba0ebceac37b);
        }
        self.var_414b9a0d57c1e081[var_8efef5b1e4d79b79][var_8950ba0ebceac37b] = undefined;
        if (self.var_414b9a0d57c1e081[var_8efef5b1e4d79b79].size == 0) {
            self.var_414b9a0d57c1e081[var_8efef5b1e4d79b79] = undefined;
            self notify("_automatic_remove_anchored_widget_" + var_8efef5b1e4d79b79);
        }
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x51f6
// Size: 0x95
function private function_984451ca1b1af664(var_8efef5b1e4d79b79) {
    if (isdefined(self.var_414b9a0d57c1e081) && isdefined(self.var_414b9a0d57c1e081[var_8efef5b1e4d79b79])) {
        foreach (var_8950ba0ebceac37b, index in self.var_414b9a0d57c1e081[var_8efef5b1e4d79b79]) {
            function_fb3c9a259f146781(var_8950ba0ebceac37b);
        }
        self.var_414b9a0d57c1e081[var_8efef5b1e4d79b79] = undefined;
        self notify("_automatic_remove_anchored_widget_" + var_8efef5b1e4d79b79);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5292
// Size: 0x60
function private function_583777ac2b762d3(ent) {
    if (isplayer(self)) {
        self endon("disconnected");
    }
    var_8efef5b1e4d79b79 = ent getentitynumber();
    self notify("_automatic_remove_anchored_widget_" + var_8efef5b1e4d79b79);
    self endon("_automatic_remove_anchored_widget_" + var_8efef5b1e4d79b79);
    ent waittill_any("death", "disconnected", "deleted");
    thread function_984451ca1b1af664(var_8efef5b1e4d79b79);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x52f9
// Size: 0x13d
function private function_b36e048ccaca2da4(value, archetype, field, var_93ff903579714147, clear) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.archetypes;
    /#
        assertex(isdefined(data[archetype]), "Trying to set anchored widget archetype field values for archetype <" + archetype + "> which does not exist.");
    #/
    /#
        assertex(isdefined(data[archetype][field]), "Trying to set anchored widget archetype field value for archetype < " + archetype + "> when field <" + field + "> does not exist.");
    #/
    if (value > data[archetype][field].max_value) {
        /#
            assert("Max value for widget archetype <" + archetype + ">, field <" + field + "> exceeded.  Value is " + value + ".  Max value is " + data[archetype][field].max_value + ".  Clamping to max value.");
        #/
        value = data[archetype][field].max_value;
    }
    value = value / data[archetype][field].var_671f4caee6a150f1;
    value = int(value);
    if (istrue(clear)) {
        var_93ff903579714147 = var_93ff903579714147 & ~data[archetype][field].mask;
    }
    var_93ff903579714147 = var_93ff903579714147 | value << data[archetype][field].shift;
    return var_93ff903579714147;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x543e
// Size: 0xb9
function private function_f58cb12303817e47(value, archetype, field) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.archetypes;
    /#
        assertex(isdefined(data[archetype]), "Trying to set anchored widget archetype field values for archetype <" + archetype + "> which does not exist.");
    #/
    /#
        assertex(isdefined(data[archetype][field]), "Trying to set anchored widget archetype field value for archetype < " + archetype + "> when field <" + field + "> does not exist.");
    #/
    value = (value & data[archetype][field].mask) >> data[archetype][field].shift;
    value = value * data[archetype][field].var_671f4caee6a150f1;
    return value;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x54ff
// Size: 0x188
function private function_e375e5ca24ea7bf4(var_639d14fd4e8eab82, omnvar, var_5ca69859253174c2, var_26595f30949d77ee) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    var_1c4f33d06f183332 = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.archetypes;
    /#
        assertex(isdefined(data.var_a1211a13c3c42303[var_639d14fd4e8eab82]), "Widget type <" + var_639d14fd4e8eab82 + "> does not exist.");
    #/
    archetype = data.var_a1211a13c3c42303[var_639d14fd4e8eab82].archetype;
    /#
        assertex(isdefined(archetype), "Widget type <" + var_639d14fd4e8eab82 + "> is not an archetype.");
    #/
    var_93ff903579714147 = 0;
    foreach (field, value in var_5ca69859253174c2) {
        /#
            assertex(isdefined(var_1c4f33d06f183332[archetype][field]), "Field <" + field + "> is not a valid field for archetype <" + archetype + ">.");
        #/
        value = clamp(value, 0, var_1c4f33d06f183332[archetype][field].max_value);
        var_93ff903579714147 = function_b36e048ccaca2da4(value, archetype, field, var_93ff903579714147);
    }
    self setclientomnvar(omnvar, var_93ff903579714147);
    if (isdefined(var_26595f30949d77ee)) {
        self setclientomnvar(var_26595f30949d77ee, gettime());
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x568e
// Size: 0x137
function private function_e6df6627eb26284f(var_639d14fd4e8eab82, omnvar, field, value) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    var_1c4f33d06f183332 = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.archetypes;
    /#
        assertex(isdefined(data.var_a1211a13c3c42303[var_639d14fd4e8eab82]), "Widget type <" + var_639d14fd4e8eab82 + "> does not exist.");
    #/
    archetype = data.var_a1211a13c3c42303[var_639d14fd4e8eab82].archetype;
    /#
        assertex(isdefined(archetype), "Widget type <" + var_639d14fd4e8eab82 + "> is not an archetype.");
    #/
    var_93ff903579714147 = self getclientomnvar(omnvar);
    /#
        assertex(isdefined(var_1c4f33d06f183332[archetype][field]), "Field <" + field + "> is not a valid field for archetype <" + archetype + ">.");
    #/
    value = clamp(value, 0, var_1c4f33d06f183332[archetype][field].max_value);
    var_93ff903579714147 = function_b36e048ccaca2da4(value, archetype, field, var_93ff903579714147, 1);
    self setclientomnvar(omnvar, var_93ff903579714147);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x57cc
// Size: 0x1b7
function private function_61dda643ffbb43a0(var_639d14fd4e8eab82, omnvar, fields) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    var_1c4f33d06f183332 = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.archetypes;
    /#
        assertex(isdefined(data.var_a1211a13c3c42303[var_639d14fd4e8eab82]), "Widget type <" + var_639d14fd4e8eab82 + "> does not exist.");
    #/
    archetype = data.var_a1211a13c3c42303[var_639d14fd4e8eab82].archetype;
    /#
        assertex(isdefined(archetype), "Widget type <" + var_639d14fd4e8eab82 + "> is not an archetype.");
    #/
    value = self getclientomnvar(omnvar);
    var_7a0af9c65a5c8b04 = [];
    if (isdefined(fields)) {
        foreach (field in fields) {
            /#
                assertex(isdefined(var_1c4f33d06f183332[archetype][field]), "Field <" + field + "> is not a valid field for archetype <" + archetype + ">.");
            #/
            var_7a0af9c65a5c8b04[field] = function_f58cb12303817e47(value, archetype, field);
        }
    } else {
        foreach (field, unused in var_1c4f33d06f183332[archetype]) {
            var_7a0af9c65a5c8b04[field] = function_f58cb12303817e47(value, archetype, field);
        }
    }
    return var_7a0af9c65a5c8b04;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x598b
// Size: 0x15a
function private function_ab8c8292f0d469c4(var_639d14fd4e8eab82, omnvar, current_pct, target_pct, time, var_26595f30949d77ee) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    var_1c4f33d06f183332 = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.archetypes;
    archetype = "scripted_widget_archetype_progress";
    /#
        assertex(data.var_a1211a13c3c42303[var_639d14fd4e8eab82].archetype == archetype, "Widget type <" + var_639d14fd4e8eab82 + "> is not a <" + archetype + "> archetype widget");
    #/
    current_pct = clamp(current_pct, 0, var_1c4f33d06f183332[archetype]["current_pct"].max_value);
    target_pct = clamp(target_pct, 0, var_1c4f33d06f183332[archetype]["target_pct"].max_value);
    var_93ff903579714147 = 0;
    var_93ff903579714147 = function_b36e048ccaca2da4(current_pct, archetype, "current_pct", var_93ff903579714147);
    var_93ff903579714147 = function_b36e048ccaca2da4(target_pct, archetype, "target_pct", var_93ff903579714147);
    var_93ff903579714147 = function_b36e048ccaca2da4(time, archetype, "time", var_93ff903579714147);
    self setclientomnvar(omnvar, var_93ff903579714147);
    self setclientomnvar(var_26595f30949d77ee, gettime());
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5aec
// Size: 0x120
function private function_42866bf1e84c1d21(var_639d14fd4e8eab82, omnvar, current_pct, bool, var_26595f30949d77ee) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    var_1c4f33d06f183332 = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.archetypes;
    archetype = "scripted_widget_archetype_progress_bool";
    /#
        assertex(data.var_a1211a13c3c42303[var_639d14fd4e8eab82].archetype == archetype, "Widget type <" + var_639d14fd4e8eab82 + "> is not a <" + archetype + "> archetype widget");
    #/
    current_pct = clamp(current_pct, 0, var_1c4f33d06f183332[archetype]["current_pct"].max_value);
    var_93ff903579714147 = 0;
    var_93ff903579714147 = function_b36e048ccaca2da4(current_pct, archetype, "current_pct", var_93ff903579714147);
    var_93ff903579714147 = function_b36e048ccaca2da4(bool, archetype, "bool", var_93ff903579714147);
    self setclientomnvar(omnvar, var_93ff903579714147);
    self setclientomnvar(var_26595f30949d77ee, gettime());
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5c13
// Size: 0x140
function private function_7db1020b4d70e9e7(var_639d14fd4e8eab82, omnvar, current_pct, current_alpha, var_26595f30949d77ee) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    var_1c4f33d06f183332 = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.archetypes;
    archetype = "scripted_widget_archetype_progress_alpha";
    /#
        assertex(data.var_a1211a13c3c42303[var_639d14fd4e8eab82].archetype == archetype, "Widget type <" + var_639d14fd4e8eab82 + "> is not a <" + archetype + "> archetype widget");
    #/
    current_pct = clamp(current_pct, 0, var_1c4f33d06f183332[archetype]["current_pct"].max_value);
    current_alpha = clamp(current_alpha, 0, var_1c4f33d06f183332[archetype]["current_alpha"].max_value);
    var_93ff903579714147 = 0;
    var_93ff903579714147 = function_b36e048ccaca2da4(current_pct, archetype, "current_pct", var_93ff903579714147);
    var_93ff903579714147 = function_b36e048ccaca2da4(current_alpha, archetype, "current_alpha", var_93ff903579714147);
    self setclientomnvar(omnvar, var_93ff903579714147);
    self setclientomnvar(var_26595f30949d77ee, gettime());
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5d5a
// Size: 0x182
function private function_99bfbb496e5ac12a(var_639d14fd4e8eab82, omnvar, count, max_count, time, var_26595f30949d77ee) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    var_1c4f33d06f183332 = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.archetypes;
    archetype = "scripted_widget_archetype_count";
    /#
        assertex(data.var_a1211a13c3c42303[var_639d14fd4e8eab82].archetype == archetype, "Widget type <" + var_639d14fd4e8eab82 + "> is not a <" + archetype + "> archetype widget");
    #/
    count = clamp(count, 0, var_1c4f33d06f183332[archetype]["count"].max_value);
    if (isdefined(max_count)) {
        max_count = clamp(max_count, 0, var_1c4f33d06f183332[archetype]["max_count"].max_value);
    } else {
        max_count = 0;
    }
    if (!isdefined(time)) {
        time = 0;
    }
    var_93ff903579714147 = 0;
    var_93ff903579714147 = function_b36e048ccaca2da4(count, archetype, "count", var_93ff903579714147);
    var_93ff903579714147 = function_b36e048ccaca2da4(max_count, archetype, "max_count", var_93ff903579714147);
    var_93ff903579714147 = function_b36e048ccaca2da4(time, archetype, "time", var_93ff903579714147);
    self setclientomnvar(omnvar, var_93ff903579714147);
    if (time > 0 && isdefined(var_26595f30949d77ee)) {
        self setclientomnvar(var_26595f30949d77ee, gettime());
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5ee3
// Size: 0x129
function private function_36bba30ae80af891(var_639d14fd4e8eab82, omnvar, horizontal_alignment, vertical_alignment) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    var_1c4f33d06f183332 = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.archetypes;
    archetype = "scripted_widget_archetype_list_item_alignment";
    /#
        assertex(data.var_a1211a13c3c42303[var_639d14fd4e8eab82].archetype == archetype, "Widget type <" + var_639d14fd4e8eab82 + "> is not a <" + archetype + "> archetype widget");
    #/
    horizontal_alignment = clamp(horizontal_alignment, 0, var_1c4f33d06f183332[archetype]["horizontal_alignment"].max_value);
    vertical_alignment = clamp(vertical_alignment, 0, var_1c4f33d06f183332[archetype]["vertical_alignment"].max_value);
    var_93ff903579714147 = 0;
    var_93ff903579714147 = function_b36e048ccaca2da4(horizontal_alignment, archetype, "horizontal_alignment", var_93ff903579714147);
    var_93ff903579714147 = function_b36e048ccaca2da4(vertical_alignment, archetype, "vertical_alignment", var_93ff903579714147);
    self setclientomnvar(omnvar, var_93ff903579714147);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6013
// Size: 0x88
function private function_cc46ab20b75d5c58(value, omnvar, var_58b54441136812ad, mask, shift) {
    if (isint(value)) {
        value = value;
    } else if (isdefined(var_58b54441136812ad)) {
        value = var_58b54441136812ad[tolower(value)];
    }
    if (isint(value)) {
        if (isdefined(shift)) {
            value = value << shift;
        }
        if (isdefined(mask)) {
            var_24db96216c5f6124 = self getclientomnvar(omnvar);
            var_24db96216c5f6124 = var_24db96216c5f6124 & ~mask;
            value = value | var_24db96216c5f6124;
        }
        self setclientomnvar(omnvar, value);
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x60a2
// Size: 0x83
function private function_f801c3e967c7768a(widget, shouldhide) {
    if (!isdefined(self.var_5b0479a29905e04d)) {
        self.var_5b0479a29905e04d = [];
    }
    if (!isdefined(self.var_5b0479a29905e04d[widget])) {
        self.var_5b0479a29905e04d[widget] = 0;
    }
    if (!shouldhide) {
        if (self.var_5b0479a29905e04d[widget] > 0) {
            self.var_5b0479a29905e04d[widget]--;
        }
    } else {
        self.var_5b0479a29905e04d[widget]++;
    }
    return self.var_5b0479a29905e04d[widget] > 0;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x612d
// Size: 0x12c
function private function_f94203b920f0ba27(var_8950ba0ebceac37b, var_639d14fd4e8eab82) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    index = undefined;
    /#
        assertex(isplayer(self), "Hud management functions other than init must be called on a player");
    #/
    if (!isdefined(self.var_a219288779b991ce)) {
        self.var_a219288779b991ce = [];
        for (i = 0; i < data.var_4dc78c94cd673b03; i++) {
            self.var_a219288779b991ce[i] = i;
        }
    }
    if (!isdefined(self.var_a14cb42739301f30)) {
        self.var_a14cb42739301f30 = [];
    }
    if (self.var_a219288779b991ce.size > 0) {
        index = self.var_a219288779b991ce[0];
        self.var_a219288779b991ce = array_remove_index(self.var_a219288779b991ce, 0);
        self.var_a14cb42739301f30[var_8950ba0ebceac37b] = spawnstruct();
        self.var_a14cb42739301f30[var_8950ba0ebceac37b].index = index;
        self.var_a14cb42739301f30[var_8950ba0ebceac37b].var_639d14fd4e8eab82 = var_639d14fd4e8eab82;
        function_f77df8178a108beb(index);
    }
    return index;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6261
// Size: 0x97
function private function_cca9604860a60e2a(var_8950ba0ebceac37b) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    index = undefined;
    /#
        assertex(isplayer(self), "Hud management functions other than init must be called on a player");
    #/
    if (isdefined(self.var_a14cb42739301f30[var_8950ba0ebceac37b])) {
        index = self.var_a14cb42739301f30[var_8950ba0ebceac37b].index;
    }
    if (isdefined(index)) {
        self.var_a219288779b991ce[self.var_a219288779b991ce.size] = index;
        self.var_a14cb42739301f30[var_8950ba0ebceac37b] = undefined;
    }
    return index;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6300
// Size: 0x73
function private scripted_widget_closed(index) {
    foreach (var_8950ba0ebceac37b, data in self.var_a14cb42739301f30) {
        if (data.index == index) {
            thread function_fb3c9a259f146781(var_8950ba0ebceac37b);
            return;
        }
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x637a
// Size: 0x15f
function private function_f77df8178a108beb(index) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    var_94a50c0a0059e601 = "ui_scripted_widget_" + "type_" + index;
    var_418596c509f2b084 = "ui_scripted_widget_" + "param_" + index;
    var_fb6072b6259477f9 = "ui_scripted_widget_" + "data_" + index;
    var_8b4b1b0e9bbc298 = "ui_scripted_widget_" + "state_" + index;
    var_26595f30949d77ee = "ui_scripted_widget_" + "time_" + index;
    var_6a79480548de351c = "ui_scripted_widget_" + "position_" + index;
    var_25bcde66ae59b81d = "ui_scripted_widget_" + "priority_" + index;
    var_2486ed5c4df7182c = "ui_scripted_widget_" + "ent_" + index;
    var_5410df86be1ea9f = "ui_scripted_widget_" + "under_hud_" + index;
    self setclientomnvar(var_94a50c0a0059e601, 0);
    self setclientomnvar(var_418596c509f2b084, 0);
    self setclientomnvar(var_fb6072b6259477f9, 0);
    self setclientomnvar(var_8b4b1b0e9bbc298, 0);
    self setclientomnvar(var_26595f30949d77ee, 0);
    self setclientomnvar(var_6a79480548de351c, 0);
    self setclientomnvar(var_25bcde66ae59b81d, 0);
    self setclientomnvar(var_2486ed5c4df7182c, undefined);
    self setclientomnvar(var_5410df86be1ea9f, 0);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x64e0
// Size: 0x26b
function private function_eabc5d231d49caab(var_ba535b154e96f87, var_71ab5de6311eb0c0, var_639d14fd4e8eab82) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_56a961d04403887;
    var_3de03bfa4e76b915 = undefined;
    if (!isdefined(self.var_1dcdf3ab55136138)) {
        self.var_1dcdf3ab55136138 = [];
        var_73e244a1fc96fa27 = 8;
        if (data.var_775c3162fdfa8f10 > 1) {
            var_73e244a1fc96fa27 = var_73e244a1fc96fa27 - 1;
        }
        for (i = 0; i < data.var_bcbce1f4c2df63aa; i++) {
            group = int(floor(i / var_73e244a1fc96fa27));
            index = i % var_73e244a1fc96fa27;
            if (!isdefined(self.var_1dcdf3ab55136138[group])) {
                self.var_1dcdf3ab55136138[group] = [];
            }
            self.var_1dcdf3ab55136138[group][index] = index + 1;
        }
    }
    if (!isdefined(self.var_5805a2cdb3ddbe56)) {
        self.var_5805a2cdb3ddbe56 = [];
    }
    if (!isdefined(self.var_a14cb42739301f30[var_ba535b154e96f87].group)) {
        var_474b522d3736c237 = undefined;
        var_74a5ab73c5ee76c9 = 0;
        for (i = 0; i < data.var_775c3162fdfa8f10; i++) {
            var_bb938d563589526c = self.var_1dcdf3ab55136138[i].size;
            if (var_bb938d563589526c > var_74a5ab73c5ee76c9) {
                var_474b522d3736c237 = i;
                var_74a5ab73c5ee76c9 = var_bb938d563589526c;
            }
        }
        if (!isdefined(var_474b522d3736c237)) {
            return undefined;
        }
        function_91905deae6454c5d(var_ba535b154e96f87, var_474b522d3736c237);
    }
    group = self.var_a14cb42739301f30[var_ba535b154e96f87].group;
    array_index = self.var_1dcdf3ab55136138[group].size - 1;
    if (array_index >= 0) {
        var_3de03bfa4e76b915 = self.var_1dcdf3ab55136138[group][array_index];
        self.var_1dcdf3ab55136138[group][array_index] = undefined;
        if (!isdefined(self.var_5805a2cdb3ddbe56[var_ba535b154e96f87])) {
            self.var_5805a2cdb3ddbe56[var_ba535b154e96f87] = [];
        }
        self.var_5805a2cdb3ddbe56[var_ba535b154e96f87][var_71ab5de6311eb0c0] = spawnstruct();
        self.var_5805a2cdb3ddbe56[var_ba535b154e96f87][var_71ab5de6311eb0c0].var_3de03bfa4e76b915 = var_3de03bfa4e76b915;
        self.var_5805a2cdb3ddbe56[var_ba535b154e96f87][var_71ab5de6311eb0c0].var_639d14fd4e8eab82 = var_639d14fd4e8eab82;
        function_496f711a9ab7a47f(group, var_3de03bfa4e76b915);
    }
    return var_3de03bfa4e76b915;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6753
// Size: 0xd2
function private function_91905deae6454c5d(var_ba535b154e96f87, group_index) {
    var_7d9318f8475c1c99 = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_56a961d04403887.var_7d9318f8475c1c99;
    var_6088cf79a58ae917 = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_56a961d04403887.var_6088cf79a58ae917;
    if (isdefined(var_7d9318f8475c1c99) && isdefined(var_6088cf79a58ae917)) {
        omnvar = "ui_scripted_widget_" + "data_" + self.var_a14cb42739301f30[var_ba535b154e96f87].index;
        function_cc46ab20b75d5c58(group_index, omnvar, undefined, var_7d9318f8475c1c99, var_6088cf79a58ae917);
    }
    self.var_a14cb42739301f30[var_ba535b154e96f87].group = group_index;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x682c
// Size: 0xeb
function private function_fbb932b933235b5e(var_ba535b154e96f87, var_71ab5de6311eb0c0) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_56a961d04403887;
    var_3de03bfa4e76b915 = undefined;
    if (isdefined(self.var_5805a2cdb3ddbe56[var_ba535b154e96f87]) && isdefined(self.var_5805a2cdb3ddbe56[var_ba535b154e96f87][var_71ab5de6311eb0c0])) {
        var_3de03bfa4e76b915 = self.var_5805a2cdb3ddbe56[var_ba535b154e96f87][var_71ab5de6311eb0c0].var_3de03bfa4e76b915;
        if (isdefined(var_3de03bfa4e76b915)) {
            group = self.var_a14cb42739301f30[var_ba535b154e96f87].group;
            self.var_1dcdf3ab55136138[group][self.var_1dcdf3ab55136138[group].size] = var_3de03bfa4e76b915;
            self.var_5805a2cdb3ddbe56[var_ba535b154e96f87][var_71ab5de6311eb0c0] = undefined;
            if (self.var_5805a2cdb3ddbe56[var_ba535b154e96f87].size == 0) {
                self.var_5805a2cdb3ddbe56[var_ba535b154e96f87] = undefined;
            }
        }
    }
    return var_3de03bfa4e76b915;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x691f
// Size: 0xf2
function private function_b267732c9e92f306(var_ba535b154e96f87) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_56a961d04403887;
    if (isdefined(self.var_5805a2cdb3ddbe56[var_ba535b154e96f87])) {
        if (self.var_5805a2cdb3ddbe56[var_ba535b154e96f87].size > 0) {
            group = self.var_a14cb42739301f30[var_ba535b154e96f87].group;
            foreach (item_data in self.var_5805a2cdb3ddbe56[var_ba535b154e96f87]) {
                self.var_1dcdf3ab55136138[group][self.var_1dcdf3ab55136138[group].size] = item_data.var_3de03bfa4e76b915;
            }
        }
        self.var_5805a2cdb3ddbe56[var_ba535b154e96f87] = undefined;
    }
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6a18
// Size: 0x151
function private function_5afd39d9a06be177(var_ba535b154e96f87, items, omnvars, var_3cefc2b0c7f6f3ec) {
    if (istrue(var_3cefc2b0c7f6f3ec)) {
        self.var_a14cb42739301f30[var_ba535b154e96f87].list = array_combine(omnvars, self.var_a14cb42739301f30[var_ba535b154e96f87].list);
    } else {
        self.var_a14cb42739301f30[var_ba535b154e96f87].list = array_combine(self.var_a14cb42739301f30[var_ba535b154e96f87].list, omnvars);
    }
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d;
    foreach (index, item in items) {
        var_94a50c0a0059e601 = function_e5a3c7e8ca795281(self.var_a14cb42739301f30[var_ba535b154e96f87].group, omnvars[index], "type_");
        self setclientomnvar(var_94a50c0a0059e601, data.var_a1211a13c3c42303[item].index);
    }
    function_989fbe51aaf74cb(var_ba535b154e96f87);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6b70
// Size: 0x4e
function private function_2654508daa8b0930(var_ba535b154e96f87, items) {
    self.var_a14cb42739301f30[var_ba535b154e96f87].list = array_remove_array(self.var_a14cb42739301f30[var_ba535b154e96f87].list, items);
    function_989fbe51aaf74cb(var_ba535b154e96f87);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6bc5
// Size: 0xee
function private function_989fbe51aaf74cb(var_ba535b154e96f87) {
    var_bcbce1f4c2df63aa = 8;
    value = 0;
    if (level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_56a961d04403887.var_775c3162fdfa8f10 > 1) {
        var_bcbce1f4c2df63aa = var_bcbce1f4c2df63aa - 1;
        value = self.var_a14cb42739301f30[var_ba535b154e96f87].group << level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_56a961d04403887.var_6088cf79a58ae917;
    }
    list = self.var_a14cb42739301f30[var_ba535b154e96f87].list;
    for (i = 0; i < var_bcbce1f4c2df63aa; i++) {
        if (isdefined(list[i])) {
            value = value | list[i] << 4 * i;
        }
    }
    function_b52897e8afbb0968(var_ba535b154e96f87, value);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6cba
// Size: 0xc4
function private function_496f711a9ab7a47f(group, var_3de03bfa4e76b915) {
    var_3de03bfa4e76b915 = function_3e551e16074e030e(group, var_3de03bfa4e76b915);
    var_94a50c0a0059e601 = "ui_scripted_list_item_" + "type_" + var_3de03bfa4e76b915;
    var_418596c509f2b084 = "ui_scripted_list_item_" + "param_" + var_3de03bfa4e76b915;
    var_fb6072b6259477f9 = "ui_scripted_list_item_" + "data_" + var_3de03bfa4e76b915;
    var_8b4b1b0e9bbc298 = "ui_scripted_list_item_" + "state_" + var_3de03bfa4e76b915;
    var_26595f30949d77ee = "ui_scripted_list_item_" + "time_" + var_3de03bfa4e76b915;
    self setclientomnvar(var_94a50c0a0059e601, 0);
    self setclientomnvar(var_418596c509f2b084, 0);
    self setclientomnvar(var_fb6072b6259477f9, 0);
    self setclientomnvar(var_8b4b1b0e9bbc298, 0);
    self setclientomnvar(var_26595f30949d77ee, 0);
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6d85
// Size: 0x1a
function private function_3e551e16074e030e(group, index) {
    return index + group * 8;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6da7
// Size: 0x2f
function private function_e5a3c7e8ca795281(group, var_3de03bfa4e76b915, var_a79e2ddd22fbba9a) {
    var_3de03bfa4e76b915 = function_3e551e16074e030e(group, var_3de03bfa4e76b915);
    return "ui_scripted_list_item_" + var_a79e2ddd22fbba9a + var_3de03bfa4e76b915;
}

// Namespace namespace_6917e6eed10cfc44/namespace_373fee410d5055ba
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6dde
// Size: 0x7a
function private function_9cee54c391590f92(var_ba535b154e96f87, var_71ab5de6311eb0c0) {
    data = level.var_6917e6eed10cfc44.var_44c1d0100b18dd6d.var_56a961d04403887;
    if (isdefined(self.var_5805a2cdb3ddbe56) && isdefined(self.var_5805a2cdb3ddbe56[var_ba535b154e96f87]) && isdefined(self.var_5805a2cdb3ddbe56[var_ba535b154e96f87][var_71ab5de6311eb0c0])) {
        return self.var_5805a2cdb3ddbe56[var_ba535b154e96f87][var_71ab5de6311eb0c0];
    }
    return undefined;
}

