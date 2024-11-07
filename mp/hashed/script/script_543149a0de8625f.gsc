#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\flags.gsc;
#using scripts\common\exploder.gsc;
#using script_6999b801b89486;
#using script_5baab8414a807f5e;
#using script_4067f8159973e2c4;
#using script_270691cb3207ab92;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\common\create_script_utility.gsc;
#using script_707f9b28737cd426;
#using scripts\mp\utility\script.gsc;

#namespace mp_jup_vertigo;

// Namespace mp_jup_vertigo / namespace_183eaf5be556ed7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x441
// Size: 0x12c
function main() {
    namespace_bbf69635f1e2559e::main();
    namespace_4506b0455256386::main();
    namespace_8b4d7ff9bd27046c::main();
    namespace_693f10db5db629e2::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_vertigo");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    thread function_af9f5c06ea4d025c();
    thread function_97dbc0b59e3475d8();
    scripts\common\create_script_utility::initialize_create_script();
    level thread namespace_ba4b07b924598b36::main();
    crushzones = getentarray("equipment_squisher", "script_noteworthy");
    foreach (zone in crushzones) {
        zone thread function_fd04ecf8dfb4ffb2();
    }
}

// Namespace mp_jup_vertigo / namespace_183eaf5be556ed7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x575
// Size: 0x37
function function_97dbc0b59e3475d8() {
    trigger = getent("flag_fireworks_01", "script_noteworthy");
    trigger waittill("trigger");
    wait 1;
    exploder("fireworks_01");
}

// Namespace mp_jup_vertigo / namespace_183eaf5be556ed7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b4
// Size: 0x108
function function_af9f5c06ea4d025c() {
    level.var_3d71d511ef004993 = getent("secret_ending", "targetname");
    var_8783a4d8fcdc9e3e = getentarray("move", "targetname");
    var_d94fd85fac0da800 = getentarray("rotate", "targetname");
    var_f26424bb9674646e = getentarray("move_and_rotate", "targetname");
    var_cd0faaf1425cf1d7 = getentarray("link", "targetname");
    if (getbasegametype() != "high") {
        targetmodels = getentarray("get_high_target", "targetname");
        foreach (model in targetmodels) {
            model delete();
        }
    }
    wait 1;
    thread function_4be96fc89da3f107(var_8783a4d8fcdc9e3e);
    thread function_2c41c836fcf01d41(var_d94fd85fac0da800);
}

// Namespace mp_jup_vertigo / namespace_183eaf5be556ed7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c4
// Size: 0xc6
function function_4be96fc89da3f107(var_8783a4d8fcdc9e3e) {
    foreach (mover in var_8783a4d8fcdc9e3e) {
        mover.mountmantlemodel = 1;
        if (isdefined(mover.target)) {
            if (getbasegametype() != "high") {
                if (mover.origin[2] > -3500 + level.var_3d71d511ef004993.origin[2]) {
                    mover thread function_1868486da804412a();
                } else {
                    mover delete();
                }
                continue;
            }
            mover thread function_1868486da804412a();
        }
    }
}

// Namespace mp_jup_vertigo / namespace_183eaf5be556ed7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x792
// Size: 0x558
function function_1868486da804412a() {
    var_ced439b17b743e2b = randomfloatrange(0.1, 2);
    defaultmovespeed = 6;
    var_cff68eba8df7d45 = 0;
    self.movespeed = defaultmovespeed;
    self.var_aa6b31c63578ba22 = var_cff68eba8df7d45;
    self.startdelay = undefined;
    self.originalorigin = self.origin;
    self.status = "starting";
    self.active = 0;
    if (!isdefined(self.target)) {
        return;
    }
    if (isdefined(self.script_float)) {
        self.movespeed = self.script_float;
    }
    if (isdefined(self.script_int)) {
        self.var_aa6b31c63578ba22 = self.script_int;
    }
    if (isdefined(self.script_startdelay)) {
        self.startdelay = self.script_startdelay;
    }
    if (isdefined(self.script_wait_add)) {
        self.var_3a7a17146e4d3d04 = self.script_wait_add;
    }
    if (isdefined(self.script_group)) {
        self.var_b6f557908076aa35 = 1;
    }
    if (isdefined(self.startdelay)) {
        wait self.startdelay;
    } else {
        wait var_ced439b17b743e2b;
    }
    self.var_63c1189e247b28e7 = getentarray(self.target, "targetname");
    if (isarray(self.var_63c1189e247b28e7) && isdefined(self.var_63c1189e247b28e7[0])) {
        foreach (thing in self.var_63c1189e247b28e7) {
            if (thing.classname == "trigger_multiple" || thing.classname == "trigger_use" || thing.classname == "trigger_use_touch" || thing.classname == "trigger_damage") {
                continue;
            } else if (isdefined(thing.script_noteworthy) && thing.script_noteworthy == "no_link") {
                continue;
            }
            thing linkto(self);
        }
    }
    wait 1;
    self.var_e1dc1cf1714986c9 = getstruct(self.target, "targetname");
    if (isdefined(self.var_b6f557908076aa35)) {
        self.var_23c74e5904df4184 = getent(self.target, "targetname");
        if (isdefined(self.var_23c74e5904df4184)) {
            function_f168411d377134aa();
            thread function_a37ae4abb422bf4d();
        }
    }
    if (isdefined(self.var_e1dc1cf1714986c9)) {
        while (true) {
            if (isdefined(self.var_23c74e5904df4184)) {
                if (self.active == 0) {
                    function_cdd7875c95ceb0ae();
                    self waittill("switch_hit");
                    function_c1f6534555f55055();
                }
            }
            if (self.status == "starting") {
                self.var_e1dc1cf1714986c9 = getstruct(self.target, "targetname");
                thread namespace_693f10db5db629e2::function_c8f303cb5ce4d4f1(self);
                self moveto(self.var_e1dc1cf1714986c9.origin, self.movespeed);
                self waittill("movedone");
                self.status = "forward";
            }
            if (self.status == "forward") {
                if (isdefined(self.var_e1dc1cf1714986c9.target)) {
                    self.var_e1dc1cf1714986c9 = getstruct(self.var_e1dc1cf1714986c9.target, "targetname");
                    thread namespace_693f10db5db629e2::function_a98ceea0b676d81a(self);
                    self moveto(self.var_e1dc1cf1714986c9.origin, self.movespeed);
                    self waittill("movedone");
                    if (!isdefined(self.var_e1dc1cf1714986c9.target)) {
                        self.status = "backwards";
                        if (isdefined(self.var_3a7a17146e4d3d04)) {
                            function_cdd7875c95ceb0ae();
                            self waittill("switch_hit");
                            function_c1f6534555f55055();
                        } else {
                            wait self.var_aa6b31c63578ba22;
                        }
                    }
                } else {
                    self.status = "backwards";
                    if (isdefined(self.var_3a7a17146e4d3d04)) {
                        function_cdd7875c95ceb0ae();
                        self waittill("switch_hit");
                        function_c1f6534555f55055();
                    } else {
                        wait self.var_aa6b31c63578ba22;
                    }
                }
            }
            if (self.status == "backwards") {
                self.var_e1dc1cf1714986c9 = getstruct(self.var_e1dc1cf1714986c9.targetname, "target");
                if (isdefined(self.var_e1dc1cf1714986c9)) {
                    thread namespace_693f10db5db629e2::function_15f3cb16ea85459b(self);
                    self moveto(self.var_e1dc1cf1714986c9.origin, self.movespeed);
                    self waittill("movedone");
                    continue;
                }
                thread namespace_693f10db5db629e2::function_15f3cb16ea85459b(self);
                self moveto(self.originalorigin, self.movespeed);
                self waittill("movedone");
                self.status = "starting";
                if (isdefined(self.var_23c74e5904df4184)) {
                    wait 0.5;
                    function_cdd7875c95ceb0ae();
                    continue;
                }
                wait self.var_aa6b31c63578ba22;
            }
        }
    }
}

// Namespace mp_jup_vertigo / namespace_183eaf5be556ed7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcf2
// Size: 0x1eb
function function_f168411d377134aa() {
    if (self.var_23c74e5904df4184.classname == "script_brushmodel") {
        self.var_23c74e5904df4184 setcandamage(1);
        if (isdefined(self.var_23c74e5904df4184.target)) {
            self.var_c6abcfbbfec2d545 = self.var_23c74e5904df4184;
        }
    } else if (self.var_23c74e5904df4184.classname == "script_model") {
        self.var_23c74e5904df4184 setcandamage(1);
    } else if (self.var_23c74e5904df4184.classname == "trigger_use" || self.var_23c74e5904df4184.classname == "trigger_use_touch") {
        self.var_23c74e5904df4184.var_1c0590a0ab588a64 = 1;
        self.var_23c74e5904df4184.usetime = int(50);
        self.var_23c74e5904df4184 sethintstring(%MP/ACTIVATE);
        if (isdefined(self.var_23c74e5904df4184.target)) {
            self.var_c6abcfbbfec2d545 = getent(self.var_23c74e5904df4184.target, "targetname");
        }
    }
    if (isdefined(self.var_c6abcfbbfec2d545)) {
        if (isdefined(self.var_c6abcfbbfec2d545.target)) {
            self.var_e3b0a179ee15b870 = getent(self.var_c6abcfbbfec2d545.target, "targetname");
            self.var_e3b0a179ee15b870.origin = self.var_c6abcfbbfec2d545.origin;
            waitframe();
            if (self.var_c6abcfbbfec2d545 islinked()) {
                self.var_e3b0a179ee15b870 linkto(self);
            }
            self.var_e3b0a179ee15b870 hide();
        }
    }
}

// Namespace mp_jup_vertigo / namespace_183eaf5be556ed7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xee5
// Size: 0x162
function function_a37ae4abb422bf4d() {
    while (true) {
        if (self.var_23c74e5904df4184.classname == "trigger_multiple") {
            self.var_23c74e5904df4184 waittill("trigger");
        } else if (self.var_23c74e5904df4184.classname == "trigger_use_touch") {
            self.var_23c74e5904df4184 waittill("trigger");
        } else if (self.var_23c74e5904df4184.classname == "trigger_use") {
            self.var_23c74e5904df4184 waittill("trigger", player);
        } else if (self.var_23c74e5904df4184.classname == "trigger_damage") {
            self.var_23c74e5904df4184 waittill_any_2("trigger", "damage");
        } else if (self.var_23c74e5904df4184.classname == "script_brushmodel") {
            self.var_23c74e5904df4184 waittill("damage");
        } else if (self.var_23c74e5904df4184.classname == "script_model") {
            self.var_23c74e5904df4184 waittill("damage");
        }
        if (self.active == 0) {
            self.var_23c74e5904df4184 playsoundonmovingent("sfx_mp_vertigo_moving_block_push_stop");
            self notify("switch_hit");
        }
        waitframe();
    }
}

// Namespace mp_jup_vertigo / namespace_183eaf5be556ed7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x104f
// Size: 0xe2
function function_c1f6534555f55055() {
    self.active = 1;
    if (isdefined(self.var_23c74e5904df4184.var_1c0590a0ab588a64) && self.var_23c74e5904df4184.var_1c0590a0ab588a64 == 1) {
        self.var_23c74e5904df4184 sethintstring(%MP/SWITCH_IN_USE);
        if (isdefined(self.var_e3b0a179ee15b870) && isdefined(self.var_c6abcfbbfec2d545)) {
            self.var_e3b0a179ee15b870 show();
            self.var_c6abcfbbfec2d545 hide();
        }
        return;
    }
    if (isdefined(self.var_c6abcfbbfec2d545) && isdefined(self.var_e3b0a179ee15b870)) {
        if (isdefined(self.var_e3b0a179ee15b870) && isdefined(self.var_c6abcfbbfec2d545)) {
            self.var_e3b0a179ee15b870 show();
            self.var_c6abcfbbfec2d545 hide();
        }
    }
}

// Namespace mp_jup_vertigo / namespace_183eaf5be556ed7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1139
// Size: 0xe1
function function_cdd7875c95ceb0ae() {
    self.active = 0;
    if (isdefined(self.var_23c74e5904df4184.var_1c0590a0ab588a64) && self.var_23c74e5904df4184.var_1c0590a0ab588a64 == 1) {
        self.var_23c74e5904df4184 sethintstring(%MP/ACTIVATE);
        if (isdefined(self.var_e3b0a179ee15b870) && isdefined(self.var_c6abcfbbfec2d545)) {
            self.var_e3b0a179ee15b870 hide();
            self.var_c6abcfbbfec2d545 show();
        }
        return;
    }
    if (isdefined(self.var_c6abcfbbfec2d545) && isdefined(self.var_e3b0a179ee15b870)) {
        if (isdefined(self.var_e3b0a179ee15b870) && isdefined(self.var_c6abcfbbfec2d545)) {
            self.var_e3b0a179ee15b870 hide();
            self.var_c6abcfbbfec2d545 show();
        }
    }
}

// Namespace mp_jup_vertigo / namespace_183eaf5be556ed7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1222
// Size: 0xb7
function function_2c41c836fcf01d41(var_d94fd85fac0da800) {
    foreach (rotater in var_d94fd85fac0da800) {
        rotater.mountmantlemodel = 1;
        if (getbasegametype() != "high") {
            if (rotater.origin[2] > -3500 + level.var_3d71d511ef004993.origin[2]) {
                rotater thread function_b6f9bd6e24bcad6b();
            } else {
                rotater delete();
            }
            continue;
        }
        rotater thread function_b6f9bd6e24bcad6b();
    }
}

// Namespace mp_jup_vertigo / namespace_183eaf5be556ed7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12e1
// Size: 0x707
function function_b6f9bd6e24bcad6b() {
    var_ced439b17b743e2b = randomfloatrange(0.1, 2);
    var_6131159d3a4f5e8 = 6;
    var_cff68eba8df7d45 = 0;
    var_4a6cd0e54a78a17d = 360;
    var_47ac132b4351fb1e = 1;
    var_1f03921e877bfdf2 = "yaw";
    defaultdirection = "forward";
    self.rotatetime = var_6131159d3a4f5e8;
    self.rotatepause = var_cff68eba8df7d45;
    self.var_ad3204b3caf1ccea = var_4a6cd0e54a78a17d;
    self.var_f5a0b90b41b64dc9 = var_47ac132b4351fb1e;
    self.var_51e6c34ace4eba3b = var_1f03921e877bfdf2;
    self.startdelay = undefined;
    self.originalangles = self.angles;
    self.status = "starting";
    self.direction = defaultdirection;
    self.var_7a33534fe9992f2d = 0;
    self.active = 0;
    if (isdefined(self.script_float)) {
        self.rotatetime = self.script_float;
    }
    if (isdefined(self.script_int)) {
        self.rotatepause = self.script_int;
    }
    if (isdefined(self.script_function)) {
        self.direction = self.script_function;
    }
    if (isdefined(self.script_startdelay)) {
        self.startdelay = self.script_startdelay;
    }
    if (isdefined(self.script_group)) {
        self.var_b6f557908076aa35 = 1;
    }
    if (isdefined(self.script_parameters)) {
        if (self.script_parameters == "infinite") {
            self.var_7a33534fe9992f2d = 1;
            self.var_f5a0b90b41b64dc9 = 10;
            self.rotatetime *= self.var_f5a0b90b41b64dc9;
            self.rotatepause = 0;
            thread namespace_693f10db5db629e2::function_f182f4bfb0416785(self);
        } else {
            var_6874d4e2b7a66b8e = 0;
            var_6874d4e2b7a66b8e = string_starts_with(self.script_parameters, "-");
            tempnum = scripts\mp\utility\script::stringtofloat(self.script_parameters);
            if (isfloat(tempnum) || isint(tempnum)) {
                self.var_f5a0b90b41b64dc9 = tempnum;
                if (var_6874d4e2b7a66b8e == 1) {
                    self.var_f5a0b90b41b64dc9 *= -1;
                }
            }
        }
    }
    if (isdefined(self.script_noteworthy)) {
        if (self.script_noteworthy == "pitch" || self.script_noteworthy == "yaw" || self.script_noteworthy == "roll") {
            self.var_51e6c34ace4eba3b = self.script_noteworthy;
            thread namespace_693f10db5db629e2::function_f182f4bfb0416785(self);
        }
    }
    if (isdefined(self.startdelay)) {
        wait self.startdelay;
    } else {
        wait var_ced439b17b743e2b;
    }
    if (isdefined(self.target)) {
        self.var_63c1189e247b28e7 = getentarray(self.target, "targetname");
        if (isarray(self.var_63c1189e247b28e7) && isdefined(self.var_63c1189e247b28e7[0])) {
            foreach (thing in self.var_63c1189e247b28e7) {
                if (thing.classname == "trigger_multiple" || thing.classname == "trigger_use" || thing.classname == "trigger_use_touch" || thing.classname == "trigger_damage") {
                    continue;
                } else if (isdefined(thing.script_noteworthy) && thing.script_noteworthy == "no_link") {
                    continue;
                }
                thing linkto(self);
            }
        }
    }
    wait 1;
    if (isdefined(self.var_b6f557908076aa35)) {
        self.var_23c74e5904df4184 = getent(self.target, "targetname");
        if (isdefined(self.var_23c74e5904df4184)) {
            function_f168411d377134aa();
            thread function_a37ae4abb422bf4d();
        }
    }
    while (true) {
        if (isdefined(self.var_23c74e5904df4184)) {
            function_cdd7875c95ceb0ae();
            self waittill("switch_hit");
            function_c1f6534555f55055();
        }
        if (self.var_51e6c34ace4eba3b == "pitch") {
            if (self.direction == "forward" || self.direction == "forward_and_backward") {
                self rotatepitch(self.var_ad3204b3caf1ccea * self.var_f5a0b90b41b64dc9, self.rotatetime);
                self waittill("rotatedone");
                wait self.rotatepause;
            }
            if (self.direction == "backward" || self.direction == "forward_and_backward") {
                self rotatepitch(self.var_ad3204b3caf1ccea * self.var_f5a0b90b41b64dc9 * -1, self.rotatetime);
                self waittill("rotatedone");
                if (isdefined(self.var_23c74e5904df4184)) {
                    waitframe();
                } else {
                    wait self.rotatepause;
                }
            }
            continue;
        }
        if (self.var_51e6c34ace4eba3b == "yaw") {
            if (self.direction == "forward" || self.direction == "forward_and_backward") {
                self rotateyaw(self.var_ad3204b3caf1ccea * self.var_f5a0b90b41b64dc9, self.rotatetime);
                self waittill("rotatedone");
                thread namespace_693f10db5db629e2::rotatestopsound(self);
                wait self.rotatepause;
            }
            if (self.direction == "backward" || self.direction == "forward_and_backward") {
                self rotateyaw(self.var_ad3204b3caf1ccea * self.var_f5a0b90b41b64dc9 * -1, self.rotatetime);
                self waittill("rotatedone");
                thread namespace_693f10db5db629e2::rotatestopsound(self);
                if (isdefined(self.var_23c74e5904df4184)) {
                    waitframe();
                } else {
                    wait self.rotatepause;
                }
            }
            continue;
        }
        if (self.var_51e6c34ace4eba3b == "roll") {
            if (self.direction == "forward" || self.direction == "forward_and_backward") {
                self rotateroll(self.var_ad3204b3caf1ccea * self.var_f5a0b90b41b64dc9, self.rotatetime);
                self waittill("rotatedone");
                wait self.rotatepause;
            }
            if (self.direction == "backward" || self.direction == "forward_and_backward") {
                self rotateroll(self.var_ad3204b3caf1ccea * self.var_f5a0b90b41b64dc9 * -1, self.rotatetime);
                self waittill("rotatedone");
                if (isdefined(self.var_23c74e5904df4184)) {
                    waitframe();
                    continue;
                }
                wait self.rotatepause;
            }
        }
    }
}

// Namespace mp_jup_vertigo / namespace_183eaf5be556ed7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19f0
// Size: 0x2bc
function function_fd04ecf8dfb4ffb2() {
    level endon("game_ended");
    level waittill("prematch_started");
    while (!isdefined(game["flags"]["prematch_done"])) {
        wait 1;
    }
    if (!flags::gameflag("prematch_done")) {
        flags::gameflagwait("prematch_done");
    }
    while (true) {
        equipmentarray = [[ level.getactiveequipmentarray ]]();
        var_6c845d64be969ce8 = isdefined(level.activekillstreaks) ? level.activekillstreaks : [];
        budgetedents = level.budgetedents;
        foreach (streak in var_6c845d64be969ce8) {
            if (!istrue(streak.isairkillstreak)) {
                equipmentarray = function_6d6af8144a5131f1(equipmentarray, streak);
            }
        }
        foreach (team in level.teamnamelist) {
            if (!(isdefined(level.var_d381da74cc527ec5["tacticalCameraList"]) && isdefined(level.var_d381da74cc527ec5) && isdefined(level.var_d381da74cc527ec5["tacticalCameraList"][team]))) {
                continue;
            }
            foreach (camera in level.var_d381da74cc527ec5["tacticalCameraList"][team]) {
                equipmentarray = function_6d6af8144a5131f1(equipmentarray, camera);
            }
        }
        foreach (ent in budgetedents) {
            if (isdefined(ent.weapon_name) && ent.weapon_name == "deployed_decoy_mp") {
                equipmentarray = function_6d6af8144a5131f1(equipmentarray, ent);
            }
        }
        foreach (equipment in equipmentarray) {
            if (equipment istouching(self)) {
                if (isdefined(equipment.deletefunc)) {
                    equipment thread [[ equipment.deletefunc ]]();
                }
            }
        }
        wait 0.3;
    }
}

