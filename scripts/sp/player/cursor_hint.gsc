#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\math.gsc;

#namespace cursor_hint;

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x294
// Size: 0x8a
function init_cursor_hint() {
    setdvarifuninitialized(@"hash_7925a1f90294e6e8", 0);
    precacheshader("cursor_hint_circle");
    precacheshader("cursor_hint_x");
    precacheshader("cursor_hint_square");
    precacheshader("alien_dpad_none");
    precacheshader("hud_arrow_up");
    precacheshader("hud_interaction_prompt_center_ammo");
    precacheshader("hud_scrap_medium_icon_test");
    precacheshader("hud_interaction_prompt_center_heavy");
    precacheshader("hud_interaction_prompt_center_steel_dragon");
    level.cursor_hints = [];
    level.cursor_hints_max = 1;
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x326
// Size: 0x44
function function_31a9edf082d398f5(bundlename, hintstring, linktag, offsetorigin) {
    bundle = getscriptbundle("cursorhint:" + bundlename);
    return function_5c79b14fd1f528b0(bundle, hintstring, linktag, offsetorigin);
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x373
// Size: 0x14d
function function_5c79b14fd1f528b0(parms, hintstring, linktag, offsetorigin) {
    if (!isdefined(parms)) {
        parms = spawnstruct();
        /#
            iprintln("<dev string:x1c>");
        #/
    }
    if (!isdefined(hintstring)) {
        hintstring = parms.hintstring;
    }
    if (!isdefined(linktag)) {
        linktag = parms.linktag;
    }
    if (!isdefined(offsetorigin)) {
        offsetorigin = parms.offsetorigin;
        if (isstruct(offsetorigin)) {
            offsetorigin = (default_to(offsetorigin.x, 0), default_to(offsetorigin.y, 0), default_to(offsetorigin.z, 0));
        }
    }
    return create_cursor_hint(linktag, offsetorigin, hintstring, parms.var_df024a1642f13910, parms.var_1d15541035909a45, parms.var_2312d6385ae695a8, parms.var_bca9b971f3bb97c, parms.var_a437bc9a2005df60, parms.var_9e9b6d24b7a157f0, parms.var_64e9e1f9becab35f, parms.holdduration, parms.usecommand, parms.var_e077514a6ff04acf, parms.var_40d4d7a8ad6420e3, parms.var_7cff52334740fd08, parms.var_429e3ca51e37df3c);
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 16, eflags: 0x0
// Checksum 0x0, Offset: 0x4c9
// Size: 0x388
function create_cursor_hint(linktag, originoffset, hintstring, var_df024a1642f13910, var_1d15541035909a45, var_2312d6385ae695a8, var_bca9b971f3bb97c, var_a437bc9a2005df60, var_9e9b6d24b7a157f0, var_64e9e1f9becab35f, holdduration, usecommand, var_e077514a6ff04acf, var_40d4d7a8ad6420e3, var_7cff52334740fd08, var_429e3ca51e37df3c) {
    var_52145fc3d0fab939 = self;
    if (isstruct(var_52145fc3d0fab939) || is_equal(var_52145fc3d0fab939.code_classname, "script_origin") || isdefined(originoffset)) {
        var_52145fc3d0fab939 = spawn("script_origin", self.origin);
        self.cursor_hint_ent = var_52145fc3d0fab939;
    }
    var_52145fc3d0fab939 makeusable();
    if (isdefined(originoffset)) {
        tag = "tag_origin";
        if (isdefined(linktag)) {
            tag = linktag;
            var_52145fc3d0fab939.origin = self gettagorigin(tag);
        }
        if (isdefined(self.model) && self.classname == "script_model" && self tagexists(tag)) {
            var_52145fc3d0fab939 linkto(self, tag, originoffset, (0, 0, 0));
        } else if (isdefined(linktag)) {
            var_52145fc3d0fab939 linkto(self, tag, originoffset, (0, 0, 0));
        } else if (isdefined(self.angles)) {
            var_52145fc3d0fab939.origin += rotatevector(originoffset, self.angles);
            if (isent(self)) {
                var_52145fc3d0fab939 linkto(self);
            }
        } else {
            var_52145fc3d0fab939.origin += originoffset;
            if (isent(self)) {
                var_52145fc3d0fab939 linkto(self);
            }
        }
    } else if (isdefined(linktag)) {
        var_52145fc3d0fab939 sethinttag(linktag);
    }
    if (isdefined(var_9e9b6d24b7a157f0) && var_9e9b6d24b7a157f0) {
        var_52145fc3d0fab939 setcursorhint("HINT_NOICON");
    } else {
        var_52145fc3d0fab939 setcursorhint("HINT_BUTTON");
    }
    if (isdefined(hintstring) && !in_realism_mode()) {
        var_52145fc3d0fab939 sethintstring(hintstring);
    }
    var_cf1dda7c717e1be0 = 360;
    if (isdefined(var_df024a1642f13910)) {
        var_cf1dda7c717e1be0 = var_df024a1642f13910;
    }
    var_52145fc3d0fab939 sethintdisplayfov(var_cf1dda7c717e1be0);
    usefov = 65;
    if (isdefined(var_40d4d7a8ad6420e3)) {
        usefov = var_40d4d7a8ad6420e3;
    }
    var_52145fc3d0fab939 setusefov(usefov);
    displayrange = 500;
    if (isdefined(var_1d15541035909a45)) {
        displayrange = var_1d15541035909a45;
    }
    var_52145fc3d0fab939 sethintdisplayrange(displayrange);
    userange = 80;
    if (isdefined(var_2312d6385ae695a8)) {
        userange = var_2312d6385ae695a8;
    }
    var_52145fc3d0fab939 setuserange(userange);
    if (isdefined(var_bca9b971f3bb97c) && var_bca9b971f3bb97c) {
        var_52145fc3d0fab939 sethintonobstruction("show");
    } else {
        var_52145fc3d0fab939 sethintonobstruction("hide");
    }
    if (isdefined(var_a437bc9a2005df60) && var_a437bc9a2005df60) {
        var_52145fc3d0fab939 sethintrequiresmashing(var_a437bc9a2005df60);
    }
    if (!isdefined(holdduration)) {
        holdduration = "duration_short";
    }
    var_52145fc3d0fab939 setuseholdduration(holdduration);
    if (holdduration != "duration_none" && holdduration != "duration_short") {
        var_52145fc3d0fab939 sethintrequiresholding(1);
    }
    if (!istrue(self.var_2962af1b05702467)) {
        thread hint_delete_on_trigger();
    }
    if (isdefined(var_64e9e1f9becab35f)) {
        var_52145fc3d0fab939 sethinticon(var_64e9e1f9becab35f);
    }
    if (isdefined(usecommand)) {
        var_52145fc3d0fab939 setusecommand(usecommand);
    }
    var_52145fc3d0fab939 sethintlockplayermovement(istrue(var_e077514a6ff04acf));
    var_52145fc3d0fab939 setusewhenhandsoccupied(istrue(var_429e3ca51e37df3c));
    if (isdefined(var_7cff52334740fd08)) {
        thread internal_hint_toggle_use_by_angles(var_52145fc3d0fab939, var_7cff52334740fd08, userange);
    }
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 15, eflags: 0x0
// Checksum 0x0, Offset: 0x859
// Size: 0x373
function create_cursor_hint_forced(linktag, originoffset, hintstring, var_df024a1642f13910, var_1d15541035909a45, var_2312d6385ae695a8, var_bca9b971f3bb97c, var_a437bc9a2005df60, var_9e9b6d24b7a157f0, var_64e9e1f9becab35f, holdduration, usecommand, var_e077514a6ff04acf, var_40d4d7a8ad6420e3, var_7cff52334740fd08) {
    var_52145fc3d0fab939 = self;
    if (isstruct(var_52145fc3d0fab939) || var_52145fc3d0fab939.code_classname == "script_origin" || isdefined(originoffset)) {
        var_52145fc3d0fab939 = spawn("script_origin", self.origin);
        self.cursor_hint_ent = var_52145fc3d0fab939;
    }
    var_52145fc3d0fab939 makeusable();
    if (isdefined(originoffset)) {
        tag = "tag_origin";
        if (isdefined(linktag)) {
            tag = linktag;
            var_52145fc3d0fab939.origin = self gettagorigin(tag);
        }
        if (isdefined(self.model) && self.classname == "script_model" && hastag(self.model, tag)) {
            var_52145fc3d0fab939 linkto(self, tag, originoffset, (0, 0, 0));
        } else if (isdefined(linktag)) {
            var_52145fc3d0fab939 linkto(self, tag, originoffset, (0, 0, 0));
        } else if (isdefined(self.angles)) {
            var_52145fc3d0fab939.origin += rotatevector(originoffset, self.angles);
            if (isent(self)) {
                var_52145fc3d0fab939 linkto(self);
            }
        } else {
            var_52145fc3d0fab939.origin += originoffset;
            if (isent(self)) {
                var_52145fc3d0fab939 linkto(self);
            }
        }
    } else if (isdefined(linktag)) {
        var_52145fc3d0fab939 sethinttag(linktag);
    }
    if (isdefined(var_9e9b6d24b7a157f0) && var_9e9b6d24b7a157f0) {
        var_52145fc3d0fab939 setcursorhint("HINT_NOICON");
    } else {
        var_52145fc3d0fab939 setcursorhint("HINT_BUTTON");
    }
    if (isdefined(hintstring)) {
        var_52145fc3d0fab939 sethintstring(hintstring);
    }
    var_cf1dda7c717e1be0 = 360;
    if (isdefined(var_df024a1642f13910)) {
        var_cf1dda7c717e1be0 = var_df024a1642f13910;
    }
    var_52145fc3d0fab939 sethintdisplayfov(var_cf1dda7c717e1be0);
    usefov = 65;
    if (isdefined(var_40d4d7a8ad6420e3)) {
        usefov = var_40d4d7a8ad6420e3;
    }
    var_52145fc3d0fab939 setusefov(usefov);
    displayrange = 500;
    if (isdefined(var_1d15541035909a45)) {
        displayrange = var_1d15541035909a45;
    }
    var_52145fc3d0fab939 sethintdisplayrange(displayrange);
    userange = 80;
    if (isdefined(var_2312d6385ae695a8)) {
        userange = var_2312d6385ae695a8;
    }
    var_52145fc3d0fab939 setuserange(userange);
    if (isdefined(var_bca9b971f3bb97c) && var_bca9b971f3bb97c) {
        var_52145fc3d0fab939 sethintonobstruction("show");
    } else {
        var_52145fc3d0fab939 sethintonobstruction("hide");
    }
    if (isdefined(var_a437bc9a2005df60) && var_a437bc9a2005df60) {
        var_52145fc3d0fab939 sethintrequiresmashing(var_a437bc9a2005df60);
    }
    if (!isdefined(holdduration)) {
        holdduration = "duration_short";
    }
    var_52145fc3d0fab939 setuseholdduration(holdduration);
    if (holdduration != "duration_none" && holdduration != "duration_short") {
        var_52145fc3d0fab939 sethintrequiresholding(1);
    }
    thread hint_delete_on_trigger();
    if (isdefined(var_64e9e1f9becab35f)) {
        var_52145fc3d0fab939 sethinticon(var_64e9e1f9becab35f);
    }
    if (isdefined(usecommand)) {
        var_52145fc3d0fab939 setusecommand(usecommand);
    }
    if (isdefined(var_e077514a6ff04acf)) {
        var_52145fc3d0fab939 sethintlockplayermovement(1);
    } else {
        var_52145fc3d0fab939 sethintlockplayermovement(0);
    }
    if (isdefined(var_7cff52334740fd08)) {
        thread internal_hint_toggle_use_by_angles(var_52145fc3d0fab939, var_7cff52334740fd08, userange);
    }
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 17, eflags: 0x0
// Checksum 0x0, Offset: 0xbd4
// Size: 0x382
function function_fa06de21f8aaee3b(anime, scriptednode, linktag, originoffset, hintstring, var_df024a1642f13910, var_1d15541035909a45, var_4e6ef8fe3c3a2fbb, var_bca9b971f3bb97c, var_a437bc9a2005df60, var_9e9b6d24b7a157f0, var_64e9e1f9becab35f, holdduration, usecommand, var_e077514a6ff04acf, var_40d4d7a8ad6420e3, var_94370a44392f701b) {
    if (!isdefined(var_4e6ef8fe3c3a2fbb)) {
        var_4e6ef8fe3c3a2fbb = 0;
    }
    if (!isdefined(var_94370a44392f701b)) {
        var_94370a44392f701b = 0;
    }
    if (!isdefined(var_40d4d7a8ad6420e3)) {
        var_40d4d7a8ad6420e3 = 45;
    }
    rig = spawn_anim_model("player_rig", self.origin, self.angles);
    rig hide();
    startpositions = scriptednode function_6d41ac1c3d718a62(anime, rig);
    /#
        var_7cecd764cc30f072 = self.origin;
        foreach (position in startpositions) {
            if (getdvarint(@"hash_4140c00f3efa94c6", 0)) {
                if (isdefined(linktag)) {
                    var_7cecd764cc30f072 = utility::groundpos(self gettagorigin(linktag));
                }
                line(var_7cecd764cc30f072, position, (1, 1, 1), 1, 0, 1000);
            }
        }
    #/
    var_b48d82bc0e38e9da = 0;
    var_d8d48f0c349aa682 = [];
    var_d85cc836998c34dd = [];
    foreach (i, startposition in startpositions) {
        var_d85cc836998c34dd[var_d85cc836998c34dd.size] = distance2d(self.origin, startposition);
        if (i + 1 == startpositions.size) {
            var_68ef20834737eca0 = distance2d(startposition, startpositions[0]);
            if (var_68ef20834737eca0 > var_b48d82bc0e38e9da) {
                var_b48d82bc0e38e9da = var_68ef20834737eca0;
                var_d8d48f0c349aa682[1] = startpositions[i];
                var_d8d48f0c349aa682[0] = startpositions[0];
            }
            continue;
        }
        var_68ef20834737eca0 = distance2d(startposition, startpositions[i + 1]);
        if (var_68ef20834737eca0 > var_b48d82bc0e38e9da) {
            var_b48d82bc0e38e9da = var_68ef20834737eca0;
            var_d8d48f0c349aa682[0] = startpositions[i];
            var_d8d48f0c349aa682[1] = startpositions[i + 1];
        }
    }
    var_3cee84479012d871 = array_average(var_d85cc836998c34dd);
    var_3a1cff486b7956dc = 60 + var_3cee84479012d871 + var_4e6ef8fe3c3a2fbb;
    if (startpositions.size > 1) {
        var_11257a1ff69c8cf6 = 30;
        var_2a017eba8e9664a6 = self.origin;
        if (isdefined(linktag)) {
            var_2a017eba8e9664a6 = self gettagorigin(linktag);
        }
        angle = math::anglebetweenvectors(var_2a017eba8e9664a6 - var_d8d48f0c349aa682[0], var_2a017eba8e9664a6 - var_d8d48f0c349aa682[1]);
    } else {
        var_11257a1ff69c8cf6 = 65;
        angle = 0;
    }
    var_b22fa04e81595347 = var_11257a1ff69c8cf6 + angle + var_94370a44392f701b;
    /#
        if (getdvarint(@"hash_398da46238160a6", 0)) {
            iprintln("<dev string:x53>" + var_3cee84479012d871);
            iprintln("<dev string:x66>" + var_3a1cff486b7956dc);
            iprintln("<dev string:x73>" + angle);
            iprintln("<dev string:x89>" + var_b22fa04e81595347);
        }
    #/
    rig delete();
    create_cursor_hint(linktag, originoffset, hintstring, var_df024a1642f13910, var_1d15541035909a45, var_3a1cff486b7956dc, var_bca9b971f3bb97c, var_a437bc9a2005df60, var_9e9b6d24b7a157f0, var_64e9e1f9becab35f, holdduration, usecommand, var_e077514a6ff04acf, var_40d4d7a8ad6420e3, var_b22fa04e81595347);
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xf5e
// Size: 0x18d
function private internal_hint_toggle_use_by_angles(var_52145fc3d0fab939, var_d9be5b54e8a3f098, userange) {
    assert(isdefined(self.angles), "Trying to limit use angles for cursor hint on an ent without .angles");
    self endon("death");
    self endon("hint_destroyed");
    level.player endon("death");
    var_c5f846c1088d726e = 1;
    var_2fef5331164585f9 = cos(var_d9be5b54e8a3f098);
    /#
        setdvarifuninitialized(@"hash_7925a1f90294e6e8", 0);
    #/
    while (true) {
        origin = self.origin;
        angles = self.angles;
        fwd = anglestoforward(angles);
        var_64ef820441895b24 = vectornormalize(level.player geteye() - origin);
        dot = vectordot(fwd, var_64ef820441895b24);
        can_use = dot >= var_2fef5331164585f9;
        if (can_use != var_c5f846c1088d726e) {
            if (can_use) {
                var_52145fc3d0fab939 setuserange(userange);
            } else {
                var_52145fc3d0fab939 setuserange(1);
            }
            var_c5f846c1088d726e = can_use;
        }
        /#
            if (getdvarint(@"hash_7925a1f90294e6e8")) {
                thread draw_line_for_time(origin, origin + fwd * 100, 1, 1, 0, 0.05);
                thread draw_line_for_time(origin, origin + var_64ef820441895b24 * 100, ter_op(can_use, 0, 1), ter_op(can_use, 1, 0), 0, 0.05);
                print3d(origin, acos(dot));
            }
        #/
        waitframe();
    }
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x10f3
// Size: 0x41
function function_29589fff42be0668(linktag, originoffset, hintstring, var_24e138ff53f671ee, duration, var_4a4268457b600842) {
    thread function_c5ecfe572bd65fd0(linktag, originoffset, hintstring, var_24e138ff53f671ee, duration, var_4a4268457b600842);
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x113c
// Size: 0x61
function private function_c5ecfe572bd65fd0(linktag, originoffset, hintstring, var_24e138ff53f671ee, duration, var_4a4268457b600842) {
    thread create_cursor_hint(linktag, originoffset, hintstring);
    triggered = function_4d0a70b3e87a01cd();
    if (!istrue(triggered)) {
        return;
    }
    thread function_1202cd03e8123816(var_24e138ff53f671ee, duration, var_4a4268457b600842);
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x11a5
// Size: 0x41
function private function_1202cd03e8123816(var_24e138ff53f671ee, duration, var_4a4268457b600842) {
    waittillframeend();
    if (isdefined(var_4a4268457b600842)) {
        showhint = function_b8de3859f8626aaa(var_4a4268457b600842);
        if (!istrue(showhint)) {
            return;
        }
    }
    function_cbb6e098f3e2d086(duration);
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x11ee
// Size: 0x18
function private function_b8de3859f8626aaa(var_4a4268457b600842) {
    self endon("hint_destroyed");
    self waittill(var_4a4268457b600842);
    return true;
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x120f
// Size: 0x100
function private function_cbb6e098f3e2d086(duration) {
    self endon("hint_destroyed");
    self.holding = undefined;
    counter = 0;
    var_1f4ed3495a24f00 = 15;
    while (true) {
        var_9e75ec0d84d21089 = istrue(self.holding);
        if (level.player usebuttonpressed()) {
            counter += 1;
        } else {
            counter = 0;
        }
        if (isdefined(duration) && counter >= duration * 20 + var_1f4ed3495a24f00) {
            break;
        }
        if (counter >= var_1f4ed3495a24f00) {
            self.holding = 1;
            level.player playrumbleonentity("light_1s");
        } else {
            self.holding = undefined;
        }
        if (istrue(self.holding) && !var_9e75ec0d84d21089) {
            self notify("hold_start");
        } else if (!istrue(self.holding) && var_9e75ec0d84d21089) {
            self notify("hold_stop");
        }
        waitframe();
    }
    self notify("hold_complete");
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1317
// Size: 0x41
function hint_delete_on_trigger() {
    self endon("hint_destroyed");
    var_52145fc3d0fab939 = self;
    if (isdefined(self.cursor_hint_ent)) {
        var_52145fc3d0fab939 = self.cursor_hint_ent;
    }
    function_7ac69d749cd3da7a(var_52145fc3d0fab939);
    if (isdefined(self)) {
        remove_cursor_hint();
    }
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1360
// Size: 0x34
function function_7ac69d749cd3da7a(var_52145fc3d0fab939) {
    self endon("entitydeleted");
    other = var_52145fc3d0fab939 waittill("trigger");
    if (var_52145fc3d0fab939 != self) {
        self notify("trigger", other);
    }
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x139c
// Size: 0x4e
function remove_cursor_hint() {
    var_52145fc3d0fab939 = self;
    if (isdefined(self.cursor_hint_ent)) {
        var_52145fc3d0fab939 = self.cursor_hint_ent;
        var_52145fc3d0fab939 delete();
        self notify("hint_destroyed");
        return;
    }
    if (!isstruct(var_52145fc3d0fab939)) {
        var_52145fc3d0fab939 makeunusable();
    }
    self notify("hint_destroyed");
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13f2
// Size: 0x1a
function hint_waittill_trigger() {
    triggerent = monitor_interact_delay(self, "stand");
    return triggerent;
}

// Namespace cursor_hint / scripts\sp\player\cursor_hint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1415
// Size: 0x33
function function_4d0a70b3e87a01cd() {
    self endon("hint_destroyed");
    if (isdefined(self.cursor_hint_ent)) {
        self.cursor_hint_ent waittill("trigger");
    } else {
        self waittill("trigger");
    }
    return true;
}

