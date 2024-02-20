// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_9e2dc68d46f3509e;

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31b
// Size: 0x13b
function animationsuite() {
    while (!istrue(game["gamestarted"])) {
        waitframe();
    }
    var_4f0a1fd1de2ee12 = getentarray("animObj", "targetname");
    /#
        assertex(var_4f0a1fd1de2ee12.size < 200, var_4f0a1fd1de2ee12.size + " objects detected by Anim Suite.  This is dangerously high.  Look to reduce usage or optimize your assets.");
    #/
    groups = gathergroups(var_4f0a1fd1de2ee12);
    setupvfxobjs(var_4f0a1fd1de2ee12);
    setupsfxobjs(var_4f0a1fd1de2ee12);
    foreach (obj in var_4f0a1fd1de2ee12) {
        if (namespace_36f464722d326bbe::islargemap()) {
            obj forcenetfieldhighlod(1);
        }
        if (isdefined(obj.script_animation_type)) {
            switch (obj.script_animation_type) {
            case #"hash_7bbd660a0ef1a992":
            case #"hash_dac7d62cc377c033":
                obj thread animsuite_rotation(obj.script_animation_type);
                break;
            case #"hash_2fc0e960a17f77d0":
            case #"hash_cb20eda5e00181ef":
                obj thread animsuite_translation(obj.script_animation_type);
                break;
            }
        }
    }
}

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x45d
// Size: 0x10f
function setupvfxobjs(objects) {
    foreach (obj in objects) {
        if (isdefined(obj.script_noteworthy) && string_starts_with(obj.script_noteworthy, "vfx_")) {
            model = obj spawn_tag_origin();
            model show();
            model linkto(obj);
            /#
                assertex(isdefined(level._effect[obj.script_noteworthy]), obj.script_noteworthy + " is not defined and/or loaded");
            #/
            waitframe();
            if (!isvalidanimsuiteentity("setupVFXObjs(): obj", obj)) {
                continue;
            }
            if (!isvalidanimsuiteentity("setupVFXObjs(): model", model)) {
                continue;
            }
            thread delayfxcall(getfx(obj.script_noteworthy), model, "tag_origin");
        }
    }
}

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x573
// Size: 0x38
function delayfxcall(fx, model, tag) {
    wait(5);
    if (!isvalidanimsuiteentity("delayFXCall()", model)) {
        return;
    }
    playfxontag(fx, model, tag);
}

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b2
// Size: 0x94
function setupsfxobjs(objects) {
    foreach (obj in objects) {
        if (isdefined(obj.script_noteworthy) && string_starts_with(obj.script_noteworthy, "sfx_")) {
            obj setmodel("tag_origin");
            obj thread play_loop_sound_on_entity("mp_quarry_lg_crane_loop");
        }
    }
}

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x64d
// Size: 0x35
function debug_temp_sphere() {
    while (1) {
        drawsphere(self.origin, 32, 0.1, (0, 0, 255));
        wait(0.1);
    }
}

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x689
// Size: 0x193
function gathergroups(objects) {
    groups = [];
    var_b9f37cf0690a914 = [];
    foreach (obj in objects) {
        if (isdefined(obj.script_noteworthy) && issubstr(obj.script_noteworthy, "group")) {
            groups = array_add(groups, obj);
        }
    }
    foreach (item in groups) {
        if (!isdefined(var_b9f37cf0690a914[item.script_noteworthy])) {
            var_b9f37cf0690a914[item.script_noteworthy] = [0:item];
        } else {
            var_b9f37cf0690a914[item.script_noteworthy] = array_add(var_b9f37cf0690a914[item.script_noteworthy], item);
        }
    }
    foreach (group in var_b9f37cf0690a914) {
        parent = animsuite_getparentobject(group);
        animsuite_linkchildrentoparentobject(parent, group);
    }
    return var_b9f37cf0690a914;
}

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x824
// Size: 0x62
function animsuite_getparentobject(group) {
    foreach (entry in group) {
        if (isdefined(entry.script_linkname)) {
            return entry;
        }
    }
}

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x88d
// Size: 0x75
function animsuite_linkchildrentoparentobject(parent, group) {
    if (isdefined(parent) && isdefined(group)) {
        foreach (entry in group) {
            if (entry == parent) {
                continue;
            }
            entry linkto(parent);
        }
    }
}

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x909
// Size: 0x38
function animsuite_translation(var_7bd5a576c10b3755) {
    if (issubstr(var_7bd5a576c10b3755, "pingpong")) {
        thread animsuite_translation_pingpong();
    }
    if (issubstr(var_7bd5a576c10b3755, "once")) {
        thread animsuite_translation_once();
    }
}

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x948
// Size: 0x1bc
function animsuite_translation_pingpong() {
    level endon("game_ended");
    var_d62c5724671299ba = (0, 90, 0);
    var_95c572e07cda0a29 = 5;
    pause = 0.5;
    start = undefined;
    stop = undefined;
    loop = undefined;
    if (isdefined(self.script_translation_amount)) {
        var_d62c5724671299ba = self.script_translation_amount;
    }
    if (isdefined(self.script_translation_time)) {
        var_95c572e07cda0a29 = self.script_translation_time;
    }
    if (isdefined(self.script_audio_parameters)) {
        if (issubstr(self.script_audio_parameters, "start")) {
            start = "mp_quarry_lg_crane_start";
        }
        if (issubstr(self.script_audio_parameters, "stop")) {
            stop = "mp_quarry_lg_crane_stop";
        }
        if (issubstr(self.script_audio_parameters, "loop")) {
            loop = "mp_quarry_lg_crane_loop";
        }
    }
    while (1) {
        var_4549cd5fc4176d49 = self.origin;
        self moveto(self.origin + var_d62c5724671299ba, var_95c572e07cda0a29[0], var_95c572e07cda0a29[1], var_95c572e07cda0a29[2]);
        if (isdefined(stop)) {
            thread animsuite_playthreadedsound(var_95c572e07cda0a29[0], stop);
        }
        wait(var_95c572e07cda0a29[0] + pause);
        if (!isvalidanimsuiteentity("animSuite_Translation_PingPong()", self)) {
            return;
        }
        if (isdefined(start)) {
            playsoundatpos(self.origin, start);
        }
        self moveto(var_4549cd5fc4176d49, var_95c572e07cda0a29[0], var_95c572e07cda0a29[1], var_95c572e07cda0a29[2]);
        if (isdefined(stop)) {
            thread animsuite_playthreadedsound(var_95c572e07cda0a29[0], stop);
        }
        wait(var_95c572e07cda0a29[0] + pause);
        if (!isvalidanimsuiteentity("animSuite_Translation_PingPong()", self)) {
            return;
        }
        if (isdefined(start)) {
            playsoundatpos(self.origin, start);
        }
    }
}

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb0b
// Size: 0x36
function animsuite_playthreadedsound(waittime, alias) {
    wait(waittime);
    if (!isvalidanimsuiteentity("animSuite_playThreadedSound()", self)) {
        return;
    }
    playsoundatpos(self.origin, alias);
}

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb48
// Size: 0x89
function animsuite_translation_once() {
    level endon("game_ended");
    var_d62c5724671299ba = (0, 90, 0);
    var_95c572e07cda0a29 = 5;
    if (isdefined(self.script_translation_amount)) {
        var_d62c5724671299ba = self.script_translation_amount;
    }
    if (isdefined(self.script_translation_time)) {
        var_95c572e07cda0a29 = length(self.script_translation_time);
    }
    while (1) {
        self rotateby(var_d62c5724671299ba, var_95c572e07cda0a29, 0, 0);
        wait(var_95c572e07cda0a29);
        if (!isvalidanimsuiteentity("animSuite_Translation_Once()", self)) {
            return;
        }
    }
}

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbd8
// Size: 0x38
function animsuite_rotation(var_b7a189377eae230c) {
    if (issubstr(var_b7a189377eae230c, "pingpong")) {
        thread animsuite_rotation_pingpong();
    }
    if (issubstr(var_b7a189377eae230c, "continuous")) {
        thread animsuite_rotation_continuous();
    }
}

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc17
// Size: 0x14f
function animsuite_rotation_pingpong() {
    level endon("game_ended");
    var_88c3a0fd4d89c1f4 = (0, 90, 0);
    rotatetime = (5, 0, 0);
    var_ad33515358075d20 = 0;
    start = undefined;
    stop = undefined;
    loop = undefined;
    if (isdefined(self.script_rotation_amount)) {
        var_88c3a0fd4d89c1f4 = self.script_rotation_amount;
    }
    if (isdefined(self.script_rotation_speed)) {
        rotatetime = self.script_rotation_speed;
    }
    while (1) {
        self rotateby(var_88c3a0fd4d89c1f4, rotatetime[0], rotatetime[1], rotatetime[2]);
        if (isdefined(stop)) {
            thread animsuite_playthreadedsound(rotatetime[0] * 0.9, stop);
        }
        wait(rotatetime[0] + var_ad33515358075d20);
        if (!isvalidanimsuiteentity("animSuite_Rotation_PingPong()", self)) {
            return;
        }
        if (isdefined(start)) {
            playsoundatpos(self.origin, start);
        }
        self rotateby(var_88c3a0fd4d89c1f4 * -1, rotatetime[0], rotatetime[1], rotatetime[2]);
        if (isdefined(stop)) {
            thread animsuite_playthreadedsound(rotatetime[0] * 0.9, stop);
        }
        wait(rotatetime[0] + var_ad33515358075d20);
        if (!isvalidanimsuiteentity("animSuite_Rotation_PingPong()", self)) {
            return;
        }
        if (isdefined(start)) {
            playsoundatpos(self.origin, start);
        }
    }
}

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd6d
// Size: 0xa9
function animsuite_rotation_continuous() {
    level endon("game_ended");
    var_88c3a0fd4d89c1f4 = (0, 90, 0);
    rotatetime = (5, 0, 0);
    var_ad33515358075d20 = 0.5;
    if (isdefined(self.script_rotation_amount)) {
        var_88c3a0fd4d89c1f4 = self.script_rotation_amount;
    }
    if (isdefined(self.script_rotation_speed)) {
        rotatetime = self.script_rotation_speed;
    }
    while (1) {
        self rotateby(var_88c3a0fd4d89c1f4, rotatetime[0], rotatetime[1], rotatetime[2]);
        wait(rotatetime[0]);
        if (!isvalidanimsuiteentity("animSuite_Rotation_Continuous()", self)) {
            return;
        }
    }
}

// Namespace namespace_9e2dc68d46f3509e/namespace_e292583729e26adb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe1d
// Size: 0x2d
function isvalidanimsuiteentity(funcname, ent) {
    if (!isdefined(ent)) {
        /#
            assertmsg(funcname + ": self entity is undefined. THIS SHOULD NEVER HAPPEN");
        #/
        return 0;
    }
    return 1;
}

