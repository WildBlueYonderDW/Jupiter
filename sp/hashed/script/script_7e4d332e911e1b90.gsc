#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\common\gameskill.gsc;
#using scripts\engine\trace.gsc;

#namespace utility;

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x434
// Size: 0xb
function initialize(type) {
    
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x447
// Size: 0x140
function updateanimpose() {
    assertex(self.a.movement == "stop" || self.a.movement == "walk" || self.a.movement == "run", "UpdateAnimPose " + self.currentpose + " " + self.a.movement);
    if (isdefined(self.desired_anim_pose) && self.desired_anim_pose != self.currentpose) {
        if (self.currentpose == "prone") {
            exitpronewrapper(0.5);
        }
        if (self.desired_anim_pose == "prone") {
            self setproneanimnodes(-45, 45, generic_human%prone_legs_down, generic_human%exposed_aiming, generic_human%prone_legs_up);
            enterpronewrapper(0.5);
            self setanimknoball(lookupanim("default_prone", "straight_level"), generic_human%body, 1, 0.1, 1);
        }
    }
    self.desired_anim_pose = undefined;
}

/#

    // Namespace utility / namespace_f87a4b6569ce73b2
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x58f
    // Size: 0xce
    function checkgrenadeinhand(animscript) {
        self endon("<dev string:x1c>");
        if (animscript == "<dev string:x2b>" || animscript == "<dev string:x30>") {
            wait 0.05;
            waittillframeend();
        }
        attachsize = self getattachsize();
        for (i = 0; i < attachsize; i++) {
            model = tolower(self getattachmodelname(i));
            assertex(model != "<dev string:x36>", "<dev string:x49>" + self.origin);
            assertex(model != "<dev string:xa0>", "<dev string:x49>" + self.origin);
            assertex(model != "<dev string:xbd>", "<dev string:x49>" + self.origin);
        }
    }

#/

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x665
// Size: 0x5d
function printdisplaceinfo() {
    self endon("death");
    self notify("displaceprint");
    self endon("displaceprint");
    for (;;) {
        /#
            print3d(self.origin + (0, 0, 60), "<dev string:xd5>", (0, 0.4, 0.7), 0.85, 0.5);
        #/
        wait 0.05;
    }
}

/#

    // Namespace utility / namespace_f87a4b6569ce73b2
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6ca
    // Size: 0x34
    function isdebugon() {
        return getdvarint(@"animdebug") == 1 || isdefined(anim.debugent) && anim.debugent == self;
    }

    // Namespace utility / namespace_f87a4b6569ce73b2
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x706
    // Size: 0x4d
    function drawdebuglineinternal(frompoint, topoint, color, durationframes) {
        for (i = 0; i < durationframes; i++) {
            line(frompoint, topoint, color);
            wait 0.05;
        }
    }

    // Namespace utility / namespace_f87a4b6569ce73b2
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x75b
    // Size: 0x3b
    function drawdebugline(frompoint, topoint, color, durationframes) {
        if (isdebugon()) {
            thread drawdebuglineinternal(frompoint, topoint, color, durationframes);
        }
    }

    // Namespace utility / namespace_f87a4b6569ce73b2
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x79e
    // Size: 0x50
    function debugline(frompoint, topoint, color, durationframes) {
        for (i = 0; i < durationframes * 20; i++) {
            line(frompoint, topoint, color);
            wait 0.05;
        }
    }

#/

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7f6
// Size: 0x2b
function notifyaftertime(notifystring, killmestring, time) {
    self endon("death");
    self endon(killmestring);
    wait time;
    self notify(notifystring);
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x829
// Size: 0x60
function drawstringtime(msg, org, color, timer) {
    maxtime = timer * 20;
    for (i = 0; i < maxtime; i++) {
        /#
            print3d(org, msg, color, 1, 1);
        #/
        wait 0.05;
    }
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x891
// Size: 0xae
function showlastenemysightpos(string) {
    self notify("got known enemy2");
    self endon("got known enemy2");
    self endon("death");
    if (!isdefined(self.enemy)) {
        return;
    }
    if (self.enemy.team == "allies") {
        color = (0.4, 0.7, 1);
    } else {
        color = (1, 0.7, 0.4);
    }
    while (true) {
        wait 0.05;
        if (!isdefined(self.lastenemysightpos)) {
            continue;
        }
        /#
            print3d(self.lastenemysightpos, string, color, 1, 2.15);
        #/
    }
}

/#

    // Namespace utility / namespace_f87a4b6569ce73b2
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x947
    // Size: 0x8a
    function function_f5e6ad17591107bc(string, org, printtime, color) {
        level notify("<dev string:xdf>" + org);
        level endon("<dev string:xdf>" + org);
        if (!isdefined(color)) {
            color = (0.3, 0.9, 0.6);
        }
        timer = printtime * 20;
        for (i = 0; i < timer; i += 1) {
            wait 0.05;
            print3d(org, string, color, 1, 1);
        }
    }

    // Namespace utility / namespace_f87a4b6569ce73b2
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x9d9
    // Size: 0x4a
    function function_e125b2100c281c9c(string, org, printtime, color) {
        if (getdvar(@"anim_debug") != "<dev string:xf1>") {
            level thread function_f5e6ad17591107bc(string, org, printtime, color);
        }
    }

#/

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa2b
// Size: 0x34
function hasenemysightpos() {
    if (isdefined(self.node)) {
        return (canseeenemyfromexposed() || self cansuppressenemyfromexposed());
    }
    return canseeenemy() || cansuppressenemy();
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa67
// Size: 0xb
function getenemysightpos() {
    return self.goodshootpos;
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa7b
// Size: 0xd
function debugtimeout() {
    wait 5;
    self notify("timeout");
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa90
// Size: 0xb8
function debugposinternal(org, string, size) {
    self endon("death");
    self notify("stop debug " + org);
    self endon("stop debug " + org);
    ent = spawnstruct();
    ent thread debugtimeout();
    ent endon("timeout");
    if (self.enemy.team == "allies") {
        color = (0.4, 0.7, 1);
    } else {
        color = (1, 0.7, 0.4);
    }
    /#
        while (true) {
            wait 0.05;
            print3d(org, string, color, 1, size);
        }
    #/
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb50
// Size: 0x22
function debugpos(org, string) {
    thread debugposinternal(org, string, 2.15);
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb7a
// Size: 0x26
function debugpossize(org, string, size) {
    thread debugposinternal(org, string, size);
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xba8
// Size: 0xbd
function debugburstprint(numshots, maxshots) {
    burstsize = numshots / maxshots;
    var_67c3f18015d8d33b = undefined;
    if (numshots == self.bulletsinclip) {
        var_67c3f18015d8d33b = "all rounds";
    } else if (burstsize < 0.25) {
        var_67c3f18015d8d33b = "small burst";
    } else if (burstsize < 0.5) {
        var_67c3f18015d8d33b = "med burst";
    } else {
        var_67c3f18015d8d33b = "long burst";
    }
    thread debugpossize(self.origin + (0, 0, 42), var_67c3f18015d8d33b, 1.5);
    thread debugpos(self.origin + (0, 0, 60), "Suppressing");
}

/#

    // Namespace utility / namespace_f87a4b6569ce73b2
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc6d
    // Size: 0xa2
    function printshootproc() {
        self endon("<dev string:x30>");
        self notify("<dev string:xf2>" + self.export);
        self endon("<dev string:xf2>" + self.export);
        printtime = 0.25;
        timer = printtime * 20;
        for (i = 0; i < timer; i += 1) {
            wait 0.05;
            print3d(self.origin + (0, 0, 70), "<dev string:xfe>", (1, 0, 0), 1, 1);
        }
    }

    // Namespace utility / namespace_f87a4b6569ce73b2
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd17
    // Size: 0x24
    function printshoot() {
        if (getdvar(@"anim_debug") == "<dev string:x104>") {
            thread printshootproc();
        }
    }

#/

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd43
// Size: 0x66
function showdebugproc(frompoint, topoint, color, printtime) {
    /#
        self endon("<dev string:x30>");
        timer = printtime * 20;
        for (i = 0; i < timer; i += 1) {
            wait 0.05;
            line(frompoint, topoint, color);
        }
    #/
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xdb1
// Size: 0x3d
function showdebugline(frompoint, topoint, color, printtime) {
    thread showdebugproc(frompoint, topoint + (0, 0, -5), color, printtime);
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdf6
// Size: 0xe5
function shootenemywrapper_normal(var_9bc9d0ee2a8a46f5) {
    self._blackboard.var_60dcaa3d3be97ab = gettime();
    scripts\common\gameskill::set_accuracy_based_on_situation();
    self notify("shooting");
    if (self function_e8ca4080d02a0bb4() && istrue(self._blackboard.shootparams_valid) && isdefined(self._blackboard.shootparams_pos)) {
        if (isdefined(self.var_3568703b0bab6334) && self.var_145c08825430f207 > gettime() - 250) {
            self shoot(1, self.var_3568703b0bab6334, 1, 0, 1);
        } else {
            self shoot(1, self._blackboard.shootparams_pos, 1, 0, 1);
        }
        return;
    }
    if (isagent(self)) {
        var_9bc9d0ee2a8a46f5 = 1;
    }
    self shoot(1, undefined, var_9bc9d0ee2a8a46f5);
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xee3
// Size: 0x1c
function shootenemywrapper_shootnotify(var_9bc9d0ee2a8a46f5) {
    level notify("an_enemy_shot", self);
    shootenemywrapper_normal(var_9bc9d0ee2a8a46f5);
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf07
// Size: 0xb3
function shootposwrapper(shootpos, var_9bc9d0ee2a8a46f5) {
    self._blackboard.var_60dcaa3d3be97ab = gettime();
    if (!isdefined(var_9bc9d0ee2a8a46f5)) {
        var_9bc9d0ee2a8a46f5 = 1;
    }
    self notify("shooting");
    if (self function_e8ca4080d02a0bb4()) {
        self shoot(1, shootpos, 1, 1, 1);
        return;
    }
    var_6da568df7fced105 = 0;
    if (isdefined(self.enemy) && istrue(self.enemy.underlowcover)) {
        var_6da568df7fced105 = 1;
    }
    endpos = bulletspread(self getmuzzlepos(), shootpos, 4);
    self shoot(1, endpos, var_9bc9d0ee2a8a46f5, var_6da568df7fced105);
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfc2
// Size: 0x21e
function throwgun() {
    org = spawn("script_model", (0, 0, 0));
    org setmodel("temp");
    org.origin = self gettagorigin("tag_weapon_right") + (50, 50, 0);
    org.angles = self gettagangles("tag_weapon_right");
    right = anglestoright(org.angles);
    right *= 15;
    forward = anglestoforward(org.angles);
    forward *= 15;
    org movegravity((0, 50, 150), 100);
    weaponclass = "weapon_" + getcompleteweaponname(self.weapon);
    weapon = spawn(weaponclass, org.origin);
    weapon.angles = self gettagangles("tag_weapon_right");
    weapon linkto(org);
    lastorigin = org.origin;
    while (isdefined(weapon) && isdefined(weapon.origin)) {
        start = lastorigin;
        end = org.origin;
        angles = vectortoangles(end - start);
        forward = anglestoforward(angles);
        forward *= 4;
        trace = scripts\engine\trace::_bullet_trace(end, end + forward, 1, weapon);
        if (isalive(trace["entity"]) && trace["entity"] == self) {
            wait 0.05;
            continue;
        }
        if (trace["fraction"] < 1) {
            break;
        }
        lastorigin = org.origin;
        wait 0.05;
    }
    if (isdefined(weapon) && isdefined(weapon.origin)) {
        weapon unlink();
    }
    org delete();
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e8
// Size: 0xc0
function personalcoldbreath() {
    tag = "TAG_EYE";
    self endon("death");
    self notify("stop personal effect");
    self endon("stop personal effect");
    while (isdefined(self)) {
        wait 0.05;
        if (!isdefined(self)) {
            break;
        }
        if (isdefined(self.a.movement) && self.a.movement == "stop") {
            if (isdefined(self.isindoor) && self.isindoor == 1) {
                continue;
            }
            playfxontag(level._effect["cold_breath"], self, tag);
            wait 2.5 + randomfloat(3);
            continue;
        }
        wait 0.5;
    }
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12b0
// Size: 0x26
function ispartiallysuppressedwrapper() {
    if (self.suppressionmeter <= self.suppressionthreshold * 0.25) {
        return 0;
    }
    return self issuppressed();
}

/#

    // Namespace utility / namespace_f87a4b6569ce73b2
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x12df
    // Size: 0x5b
    function showlines(start, end, end2) {
        for (;;) {
            line(start, end, (1, 0, 0), 1);
            wait 0.05;
            line(start, end2, (0, 0, 1), 1);
            wait 0.05;
        }
    }

#/

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1342
// Size: 0x10
function usingboltactionweapon() {
    return weaponisboltaction(self.weapon);
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x135b
// Size: 0x85
function setfootstepeffect(type, name, fx) {
    assertex(isdefined(name), "Need to define the footstep surface type.");
    assertex(isdefined(fx), "Need to define the footstep effect.");
    assertex(isdefined(type), "Need to define the footstep unittype.");
    if (!isdefined(anim.optionalstepeffects)) {
        anim.optionalstepeffects = [];
    }
    anim.optionalstepeffects[name] = 1;
    level._effect["step_" + name][type] = fx;
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13e8
// Size: 0x85
function setfootstepeffectsmall(type, name, fx) {
    assertex(isdefined(name), "Need to define the footstep surface type.");
    assertex(isdefined(fx), "Need to define the footstep effect.");
    assertex(isdefined(type), "Need to define the footstep unittype.");
    if (!isdefined(anim.optionalstepeffectssmall)) {
        anim.optionalstepeffectssmall = [];
    }
    anim.optionalstepeffectssmall[name] = 1;
    level._effect["step_small_" + name][type] = fx;
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1475
// Size: 0x9c
function setfootprinteffect(type, name, fx) {
    assertex(isdefined(name), "Need to define the footstep surface type.");
    assertex(isdefined(fx), "Need to define the footstep effect.");
    assertex(isdefined(type), "Need to define the footstep unittype.");
    if (!isdefined(anim.optionalfootprinteffects)) {
        anim.optionalfootprinteffects = [];
    }
    if (!isdefined(anim.flirfootprinteffects)) {
        anim.flirfootprinteffects = 0;
    }
    anim.optionalfootprinteffects[name] = 1;
    level._effect["footprint_" + name][type] = fx;
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1519
// Size: 0x44
function unsetfootstepeffect(name) {
    assertex(isdefined(name), "Need to define the footstep surface type to unset.");
    if (isdefined(anim.optionalstepeffects)) {
        anim.optionalstepeffects[name] = undefined;
    }
    level._effect["step_" + name] = undefined;
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1565
// Size: 0x44
function unsetfootstepeffectsmall(name) {
    assertex(isdefined(name), "Need to define the footstep surface type to unset.");
    if (isdefined(anim.optionalstepeffectssmall)) {
        anim.optionalstepeffectssmall[name] = undefined;
    }
    level._effect["step_small_" + name] = undefined;
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15b1
// Size: 0x44
function unsetfootprinteffect(name) {
    assertex(isdefined(name), "Need to define the footstep surface type to unset.");
    if (isdefined(anim.optionalfootprinteffects)) {
        anim.optionalfootprinteffects[name] = undefined;
    }
    level._effect["footprint_" + name] = undefined;
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x15fd
// Size: 0xdb
function setnotetrackeffect(notetrack, tag, surfacename, fx, sound_prefix, sound_suffix) {
    assert(isdefined(notetrack));
    assert(isdefined(tag));
    assert(isdefined(fx));
    assertex(isstring(notetrack), "Notetrack name must be a string");
    if (!isdefined(surfacename)) {
        surfacename = "all";
    }
    if (!isdefined(level._notetrackfx)) {
        level._notetrackfx = [];
    }
    level._notetrackfx[notetrack][surfacename] = spawnstruct();
    level._notetrackfx[notetrack][surfacename].tag = tag;
    level._notetrackfx[notetrack][surfacename].fx = fx;
    setnotetracksound(notetrack, surfacename, sound_prefix, sound_suffix);
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x16e0
// Size: 0xac
function setnotetracksound(notetrack, surfacename, sound_prefix, sound_suffix) {
    if (!isdefined(surfacename)) {
        surfacename = "all";
    }
    if (!isdefined(level._notetrackfx)) {
        level._notetrackfx = [];
    }
    if (isdefined(level._notetrackfx[notetrack][surfacename])) {
        struct = level._notetrackfx[notetrack][surfacename];
    } else {
        struct = spawnstruct();
        level._notetrackfx[notetrack][surfacename] = struct;
    }
    if (isdefined(sound_prefix)) {
        struct.sound_prefix = sound_prefix;
    }
    if (isdefined(sound_suffix)) {
        struct.sound_suffix = sound_suffix;
    }
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1794
// Size: 0x14
function enterpronewrapper(timer) {
    thread enterpronewrapperproc(timer);
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17b0
// Size: 0x7d
function enterpronewrapperproc(timer) {
    self endon("death");
    self notify("anim_prone_change");
    self endon("anim_prone_change");
    self enterprone(timer, isdefined(self.a.onback));
    self waittill("killanimscript");
    if (self.currentpose != "prone" && !isdefined(self.a.onback)) {
        self.currentpose = "prone";
    }
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1835
// Size: 0x21
function stoponback() {
    exitpronewrapper(1);
    self.a.onback = undefined;
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x185e
// Size: 0x14
function exitpronewrapper(timer) {
    thread exitpronewrapperproc(timer);
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x187a
// Size: 0x51
function exitpronewrapperproc(timer) {
    self endon("death");
    self notify("anim_prone_change");
    self endon("anim_prone_change");
    self exitprone(timer);
    self waittill("killanimscript");
    if (self.currentpose == "prone") {
        self.currentpose = "crouch";
    }
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18d3
// Size: 0xb
function getaiprimaryweapon() {
    return self.primaryweapon;
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18e7
// Size: 0xb
function getaisecondaryweapon() {
    return self.secondaryweapon;
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18fb
// Size: 0xb
function getaisidearmweapon() {
    return self.sidearm;
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x190f
// Size: 0xb
function getaicurrentweapon() {
    return self.weapon;
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1923
// Size: 0x6d
function getaicurrentweaponslot() {
    if (self.weapon == self.primaryweapon) {
        return "primary";
    }
    if (self.weapon == self.secondaryweapon) {
        return "secondary";
    }
    if (self.weapon == self.sidearm) {
        return "sidearm";
    }
    assertmsg("self.weapon does not match any known slot");
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1998
// Size: 0x3e
function aihasweapon(objweapon) {
    assert(isweapon(objweapon));
    weaponname = getcompleteweaponname(objweapon);
    if (isdefined(self.weaponinfo[weaponname])) {
        return true;
    }
    return false;
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19df
// Size: 0x26
function getanimendpos(theanim) {
    movedelta = getmovedelta(theanim, 0, 1);
    return self localtoworldcoords(movedelta);
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a0e
// Size: 0xc6
function ragdolldeath(moveanim) {
    self endon("killanimscript");
    lastorg = self.origin;
    movevec = (0, 0, 0);
    for (;;) {
        wait 0.05;
        force = distance(self.origin, lastorg);
        lastorg = self.origin;
        if (self.health == 1) {
            self.a.nodeath = 1;
            self startragdoll();
            self clearanim(moveanim, 0.1);
            wait 0.05;
            physicsexplosionsphere(lastorg, 600, 0, force * 0.1);
            self notify("killanimscript");
            return;
        }
    }
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1adc
// Size: 0xc
function iscqbwalkingorfacingenemy() {
    return !self.facemotion;
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1af1
// Size: 0x1d
function randomizeidleset() {
    self.a.idleset = randomint(2);
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b16
// Size: 0x42
function getrandomintfromseed(intseed, intmax) {
    assert(intmax > 0);
    index = intseed % anim.randominttablesize;
    return anim.randominttable[index] % intmax;
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b61
// Size: 0x30
function getcurrentweaponslotname() {
    assert(isdefined(self));
    if (isusingsecondary()) {
        return "secondary";
    }
    if (isusingsidearm()) {
        return "sidearm";
    }
    return "primary";
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b9a
// Size: 0xed
function lookupanim(var_4cabf1b2b096a23a, anim_index) {
    assert(isai(self));
    if (isdefined(self.animarchetype)) {
        assertex(isdefined(anim.archetypes[self.animarchetype]), "Invalid anim archetype: " + self.animarchetype);
        if (isdefined(anim.archetypes[self.animarchetype][var_4cabf1b2b096a23a]) && isdefined(anim.archetypes[self.animarchetype][var_4cabf1b2b096a23a][anim_index])) {
            return anim.archetypes[self.animarchetype][var_4cabf1b2b096a23a][anim_index];
        }
    }
    assertex(isdefined(anim.archetypes["soldier"][var_4cabf1b2b096a23a][anim_index]), "Missing anim for soldier archetype: [" + var_4cabf1b2b096a23a + "][" + anim_index + "]");
    return anim.archetypes["soldier"][var_4cabf1b2b096a23a][anim_index];
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c90
// Size: 0x11d
function lookupanimarray(var_4cabf1b2b096a23a) {
    assert(isai(self));
    if (isdefined(self.animarchetype)) {
        assertex(isdefined(anim.archetypes[self.animarchetype]), "Invalid anim archetype: " + self.animarchetype);
        if (isdefined(anim.archetypes[self.animarchetype][var_4cabf1b2b096a23a])) {
            animset = anim.archetypes["soldier"][var_4cabf1b2b096a23a];
            foreach (value in anim.archetypes[self.animarchetype][var_4cabf1b2b096a23a]) {
                animset[key] = value;
            }
            return animset;
        }
    }
    assertex(isdefined(anim.archetypes["soldier"][var_4cabf1b2b096a23a]), "Missing anim array for soldier archetype: [" + var_4cabf1b2b096a23a + "]");
    return anim.archetypes["soldier"][var_4cabf1b2b096a23a];
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1db6
// Size: 0x11
function isenergyweapon(weapon) {
    return weaponusesenergybullets(weapon);
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1dd0
// Size: 0x8b
function function_b5216a6d7bd17210(str_gestureweapon, var_d160dd91a3ae5bb8) {
    assertex(isdefined(str_gestureweapon), "Gesture weapon must be defined");
    var_d160dd91a3ae5bb8 = default_to(var_d160dd91a3ae5bb8, 0);
    if (var_d160dd91a3ae5bb8) {
        self cancelreload();
    }
    gestureweapon = makeweapon(str_gestureweapon);
    self giveandfireoffhand(gestureweapon);
    if (!self hasweapon(gestureweapon)) {
        return;
    }
    if (var_d160dd91a3ae5bb8) {
        thread function_422595121745c8a1(gestureweapon);
        self allowreload(0);
        waittill_any_2("offhand_fired", "weapon_gesture_failed");
        self allowreload(1);
    }
}

// Namespace utility / namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e63
// Size: 0x2f
function function_422595121745c8a1(gestureweapon) {
    self endon("offhand_fired");
    self endon("death_or_disconnect");
    while (self hasweapon(gestureweapon)) {
        waitframe();
    }
    self notify("weapon_gesture_failed");
}

