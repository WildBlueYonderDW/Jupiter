#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\stealth\debug.gsc;
#using script_3433ee6b63c7e243;

#namespace nvg_ai;

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x202
// Size: 0xc5
function nvg_ai_init() {
    ai = getaiarray();
    foreach (guy in ai) {
        guy thread nvg_ai();
    }
    add_global_spawn_function("axis", &nvg_ai);
    add_global_spawn_function("allies", &nvg_ai);
    add_global_spawn_function("neutral", &nvg_ai);
    /#
        setdvarifuninitialized(@"hash_4249b712406badc9", 0);
        thread function_94e2c55578304a2();
    #/
    array_thread(getentarray("dynolight_area", "targetname"), &dynolight_area_trigger_logic);
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cf
// Size: 0x25
function nvg_ai() {
    self endon("death");
    wait 0.05;
    local_init();
    ai_nvg_player_update();
    thread nvg_death_cleanup();
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fc
// Size: 0xb
function do_flir_footsteps(var_d5aa0379e8c758cc) {
    
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30f
// Size: 0x2
function dont_do_flir_footsteps() {
    
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x319
// Size: 0x33
function local_init() {
    ent_flag_init("react_to_dynolights");
    ent_flag_init("in_the_dark");
    if (istrue(level.is_dark)) {
        ent_flag_set("in_the_dark");
    }
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x354
// Size: 0x41
function ai_nvg_player_update() {
    if (!should_update_ai_nvg_state()) {
        return;
    }
    var_57b5ab006e388a18 = level.player isnightvisionon();
    if (isdefined(self.custom_nvg_update_func)) {
        self thread [[ self.custom_nvg_update_func ]](var_57b5ab006e388a18);
    }
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39d
// Size: 0x18
function should_update_ai_nvg_state() {
    if (self.classname == "script_vehicle_blackhornet") {
        return false;
    }
    return true;
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3be
// Size: 0x5a
function dynolight_area_trigger_logic() {
    self endon("death");
    while (true) {
        whom = self waittill("trigger");
        if (!isai(whom)) {
            continue;
        }
        if (!isdefined(whom.in_dynolight_trigger) && !isdefined(whom.nvg_goggles)) {
            whom childthread dynolight_area_ai(self);
        }
    }
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x420
// Size: 0x3e
function dynolight_area_ai(trigger) {
    self endon("death");
    self.in_dynolight_trigger = trigger;
    thread enable_ai_dynolight_behavior();
    while (self istouching(trigger)) {
        wait 0.05;
    }
    disable_ai_dynolight_behavior();
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x466
// Size: 0xe
function enable_ai_dynolight_behavior() {
    ent_flag_set("react_to_dynolights");
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47c
// Size: 0x5fa
function updatelightmeter() {
    if (self [[ self.fnisinstealthcombat ]]() || self [[ self.fnisinstealthhunt ]]() && !istrue(self.reacttodynolightsinhunt)) {
        self.lightmeter = undefined;
        return;
    }
    if (distancesquared(self.origin, level.player.origin) > 4000000) {
        return;
    }
    if (!isdefined(level.castingdynolights) || level.castingdynolights.size == 0) {
        self.lightmeter = ter_op(istrue(level.is_dark), 0, 1);
        return;
    }
    curtime = gettime();
    if (!isdefined(level.lastdynolightcleantime) || curtime == level.lastdynolightcleantime) {
        level.castingdynolights = array_removeundefined(level.castingdynolights);
        level.lastdynolightcleantime = curtime;
    }
    var_9d7eb6e3cbc851a6 = sortbydistance(level.castingdynolights, self.origin);
    var_eb66ebed687542e2 = self getapproxeyepos();
    var_3db0657c6e27055b = 9999999;
    if (isdefined(self.lightmeter_lastcheckpos)) {
        var_3db0657c6e27055b = distancesquared(self.lightmeter_lastcheckpos, self.origin);
    }
    if (!isdefined(self.lightmeter_lastchecktime)) {
        self.lightmeter_lastchecktime = -1000;
    }
    var_4f65efcf21f5b553 = [];
    var_4388be32bf8e8320 = [];
    var_56d3f8333adbcbf1 = [];
    var_ffa6a55a441d9138 = var_3db0657c6e27055b > 900;
    var_be525e555b949810 = 998001;
    var_3fc1a93b7207133e = var_9d7eb6e3cbc851a6.size;
    for (var_18ea2a1964ea249c = 0; var_18ea2a1964ea249c < var_3fc1a93b7207133e; var_18ea2a1964ea249c++) {
        var_94715b1541bc0e7b = var_9d7eb6e3cbc851a6[var_18ea2a1964ea249c];
        dist_sq = distancesquared(var_eb66ebed687542e2, var_94715b1541bc0e7b.origin);
        if (dist_sq > var_be525e555b949810) {
            break;
        }
        if (!var_ffa6a55a441d9138 && var_94715b1541bc0e7b.timeoflaststatechange >= self.lightmeter_lastchecktime) {
            var_ffa6a55a441d9138 = 1;
        }
        if (!var_94715b1541bc0e7b.alive) {
            continue;
        }
        if (var_94715b1541bc0e7b getscriptablepartstate("onoff") == "off") {
            continue;
        }
        var_397eb484dfddd2da = 650;
        if (isdefined(var_94715b1541bc0e7b.data)) {
            if (istrue(var_94715b1541bc0e7b.data.script_ignoreme)) {
                continue;
            }
            if (istrue(var_94715b1541bc0e7b.data.script_radius)) {
                var_397eb484dfddd2da = var_94715b1541bc0e7b.data.script_radius;
                if (dist_sq > var_397eb484dfddd2da * var_397eb484dfddd2da) {
                    continue;
                }
            }
            if (is_equal(var_94715b1541bc0e7b.data.script_type, "light_spot")) {
                /#
                    if (getdvarint(@"hash_4249b712406badc9")) {
                        var_94715b1541bc0e7b draw_spotlight_fov();
                    }
                #/
                fov = var_94715b1541bc0e7b.data.script_fov_inner;
                angles = var_94715b1541bc0e7b.data.angles;
                start = var_94715b1541bc0e7b.lightpos;
                if (!within_fov(start, angles, var_eb66ebed687542e2, cos(fov))) {
                    continue;
                }
            }
        }
        if (!var_94715b1541bc0e7b istouching(self.in_dynolight_trigger)) {
            continue;
        }
        var_4d1fb8faeda31cd6 = var_4f65efcf21f5b553.size;
        var_4f65efcf21f5b553[var_4d1fb8faeda31cd6] = var_94715b1541bc0e7b;
        var_56d3f8333adbcbf1[var_4d1fb8faeda31cd6] = var_397eb484dfddd2da;
        var_4388be32bf8e8320[var_4d1fb8faeda31cd6] = dist_sq;
    }
    if (var_ffa6a55a441d9138) {
        var_c544587b4f919b5c = 0;
        tracedata = spawnstruct();
        disttogoal = self pathdisttogoal();
        var_46ffbdd31c409329 = 32;
        tracedata.bmoving = lengthsquared(self.velocity) > 1 || disttogoal > var_46ffbdd31c409329;
        eyeoffset = self getapproxeyepos() - self.origin;
        if (tracedata.bmoving) {
            tracedata.pointsonpath = [];
            tracedata.pointsonpath[0] = self.origin + eyeoffset;
            tracedata.pointsonpath[1] = self getposonpath(var_46ffbdd31c409329) + eyeoffset;
            if (disttogoal > var_46ffbdd31c409329 * 2) {
                tracedata.pointsonpath[2] = self getposonpath(var_46ffbdd31c409329 * 2) + eyeoffset;
            }
        }
        var_3fc1a93b7207133e = var_4f65efcf21f5b553.size;
        for (var_18ea2a1964ea249c = 0; var_18ea2a1964ea249c < var_3fc1a93b7207133e; var_18ea2a1964ea249c++) {
            var_94715b1541bc0e7b = var_4f65efcf21f5b553[var_18ea2a1964ea249c];
            dist = sqrt(var_4388be32bf8e8320[var_18ea2a1964ea249c]);
            var_397eb484dfddd2da = var_56d3f8333adbcbf1[var_18ea2a1964ea249c];
            var_d1fbc09d2898a776 = 0;
            if (isdefined(var_94715b1541bc0e7b.data) && isdefined(var_94715b1541bc0e7b.data.script_percent)) {
                var_d1fbc09d2898a776 = var_94715b1541bc0e7b.data.script_percent;
            } else if (isdefined(level.dynolight_falloff_dist)) {
                var_d1fbc09d2898a776 = level.dynolight_falloff_dist;
            }
            var_f22120fbffb96467 = (1 - math::normalize_value(var_397eb484dfddd2da * var_d1fbc09d2898a776, var_397eb484dfddd2da, dist)) * var_94715b1541bc0e7b.intensity;
            if (!dynolight_trace_passed(var_94715b1541bc0e7b, tracedata)) {
                continue;
            }
            var_c544587b4f919b5c += var_f22120fbffb96467;
            /#
                if (getdvarint(@"hash_4249b712406badc9")) {
                    line(var_94715b1541bc0e7b.lightpos, self.origin, (var_f22120fbffb96467, var_f22120fbffb96467, var_f22120fbffb96467), 1, 0, 10);
                }
            #/
            if (var_c544587b4f919b5c > 0.5) {
                break;
            }
        }
        self.lightmeter = var_c544587b4f919b5c;
        self.lightmeter_lastchecktime = gettime();
        self.lightmeter_lastcheckpos = self.origin;
    }
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa7e
// Size: 0x14e
function dynolight_trace_passed(var_94715b1541bc0e7b, tracedata) {
    var_2fc7b90001702e5c = [level.player];
    if (isdefined(var_94715b1541bc0e7b.linked_ents)) {
        var_2fc7b90001702e5c = array_combine(var_2fc7b90001702e5c, var_94715b1541bc0e7b.linked_ents);
    }
    if (istrue(tracedata.bmoving)) {
        var_2fc7b90001702e5c = array_combine(var_2fc7b90001702e5c, [var_94715b1541bc0e7b, self]);
        assert(isdefined(tracedata.pointsonpath));
        var_e47e37dbc6d59dfe = tracedata.pointsonpath.size;
        for (i = 0; i < var_e47e37dbc6d59dfe; i++) {
            pathpos = tracedata.pointsonpath[i];
            if (ray_trace_passed(var_94715b1541bc0e7b.lightpos, pathpos, var_2fc7b90001702e5c, level.dynolight_trace_contents)) {
                /#
                    if (getdvarint(@"hash_4249b712406badc9") && i != 0) {
                        line(var_94715b1541bc0e7b.lightpos, pathpos, (0, 1, 0.5), 1, 0, 20);
                    }
                #/
                return 1;
            }
        }
        return 0;
    }
    return var_94715b1541bc0e7b can_trace_to_ai(var_94715b1541bc0e7b.lightpos, self, var_2fc7b90001702e5c, level.dynolight_trace_contents);
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbd5
// Size: 0x35
function is_gun_raised() {
    if (isnullweapon(self.weapon)) {
        return false;
    }
    return self gettagorigin("tag_eye")[2] - self gettagorigin("tag_flash")[2] <= 15;
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc13
// Size: 0x10b
function draw_spotlight_fov() {
    fov_yaw = acos(cos(self.data.script_fov_inner));
    eye_yaw = self.data.angles[1];
    pitch = self.data.angles[0];
    color = (1, 0, 0);
    viewdist = self.data.script_radius;
    start = self.lightpos;
    var_8b4c94ee530f045e = 10;
    /#
        if (abs(pitch - 90) < 1) {
            thread draw_circle(start, viewdist, (1, 0, 0), 1, 0, 4);
            return;
        }
        scripts\stealth\debug::function_ab68b8f1b9191d70(start, -1 * fov_yaw, fov_yaw, (pitch, eye_yaw, 0), viewdist, 1, var_8b4c94ee530f045e, color);
    #/
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd26
// Size: 0xa8
function draw_flashlight_fov() {
    dot = cos(30);
    color = (1, 0, 0);
    fov_yaw = acos(dot);
    eye_yaw = self gettagangles("tag_flash")[1];
    viewdist = 500;
    start = self gettagorigin("tag_flash");
    var_8b4c94ee530f045e = 10;
    /#
        scripts\stealth\debug::function_ab68b8f1b9191d70(start, -1 * fov_yaw, fov_yaw, self gettagangles("<dev string:x1c>"), viewdist, 1, var_8b4c94ee530f045e, color);
    #/
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdd6
// Size: 0x6d
function disable_ai_dynolight_behavior() {
    self.in_dynolight_trigger = undefined;
    self.lightmeter = undefined;
    self.maxsightdistsqrd = 67108864;
    level.player.dontmeleeme = 0;
    ent_flag_clear("react_to_dynolights");
    if (istrue(level.is_dark)) {
        ent_flag_set("in_the_dark");
        return;
    }
    ent_flag_clear("in_the_dark");
}

/#

    // Namespace nvg_ai / scripts\sp\nvg\nvg_ai
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe4b
    // Size: 0x247
    function function_94e2c55578304a2() {
        var_f69e39e78fa16603 = "<dev string:x26>";
        while (true) {
            foreach (guy in getaiarray()) {
                if (isdefined(guy.lightmeter) && guy ent_flag_exist("<dev string:x27>")) {
                    num = guy getentitynumber();
                    var_f69e39e78fa16603 = ter_op(guy.lightmeter < 0.5, "<dev string:x3b>", "<dev string:x3f>");
                    if (getdvarint(@"hash_4249b712406badc9")) {
                        print3d(guy.origin + (0, 0, 85), "<dev string:x42>" + num + "<dev string:x47>" + distance2d(guy.origin, level.player.origin), (1, 1, 1), 1, 0.6, 1);
                        print3d(guy.origin + (0, 0, 78), "<dev string:x42>" + num + "<dev string:x59>" + sqrt(guy.maxsightdistsqrd), (1, 1, 1), 1, 0.6, 1);
                        print3d(guy.origin + (0, 0, 71), "<dev string:x42>" + num + "<dev string:x69>" + guy.lightmeter, (guy.lightmeter, guy.lightmeter, guy.lightmeter), 1, 0.6, 1);
                        print3d(guy.origin + (0, 0, 64), "<dev string:x78>" + var_f69e39e78fa16603, (1, 1, 1), 1, 0.6, 1);
                        if (istrue(guy.flashlight) && guy is_gun_raised()) {
                            guy thread draw_flashlight_fov();
                        }
                    }
                }
            }
            wait 0.05;
        }
    }

#/

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x109a
// Size: 0x21
function nvg_death_cleanup() {
    self waittill("death");
    if (!isdefined(self)) {
        return;
    }
    if (is_using_flashlight()) {
        kill_flashlight_fx(0);
    }
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10c3
// Size: 0x4d
function flashlight_on(var_b5214d24f3968b4c) {
    if (!can_use_flashlight()) {
        return;
    }
    if (is_using_flashlight()) {
        return;
    }
    function_d73f1b97acba6597();
    self.flashlight = 1;
    play_flashlight_fx(var_b5214d24f3968b4c);
    if (isdefined(self.flashlightlaserweapon)) {
        flashlight_laser_on();
    }
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1118
// Size: 0x125
function function_d73f1b97acba6597() {
    var_c7d735e3522da00a = ["flashlight_box01", "flashlight_cyl01", "flashlight_pstl01"];
    currweapon = self.weapon;
    newweapon = undefined;
    foreach (var_93e3b716dc7e83da in var_c7d735e3522da00a) {
        if (currweapon canuseattachment(var_93e3b716dc7e83da)) {
            newweapon = currweapon withattachment(var_93e3b716dc7e83da);
            self.var_e0675e48962c6d55 = var_93e3b716dc7e83da;
            break;
        }
    }
    if (!isdefined(newweapon)) {
        return;
    }
    slot = "primary";
    if (self.secondaryweapon == currweapon) {
        slot = "secondary";
    }
    if (self.lastweapon == currweapon) {
        self.lastweapon = newweapon;
    }
    self.flashlightfxtag = "tag_laser";
    self.flashlightfxoverridetag = "tag_laser";
    self.var_b5ce31099294cf74 = slot;
    namespace_223959d3e5206cfb::detachweapon(currweapon);
    namespace_223959d3e5206cfb::forceuseweapon(newweapon, slot);
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1245
// Size: 0x3b
function flashlight_off(var_b5214d24f3968b4c) {
    if (!is_using_flashlight()) {
        return;
    }
    self.flashlight = 0;
    kill_flashlight_fx(var_b5214d24f3968b4c);
    if (isdefined(self.flashlightlaserweapon)) {
        flashlight_laser_off();
    }
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1288
// Size: 0x92
function flashlight_laser_on() {
    if (isdefined(self.flashlightlaser)) {
        return;
    }
    laser = spawn("script_model", (0, 0, 0));
    laser linkto(self, self.flashlightfxtag, (0, 0, 0), (0, 0, 0));
    laser setmodel("tag_laser");
    laser setmoverlaserweapon(self.flashlightlaserweapon);
    laser laserforceon();
    self.flashlightlaser = laser;
    thread flashlight_laser_cleanup();
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1322
// Size: 0x2f
function flashlight_laser_cleanup() {
    self endon("flashlight_laser_off");
    self waittill("death");
    self.flashlightlaser laserforceoff();
    self.flashlightlaser delete();
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1359
// Size: 0x40
function flashlight_laser_off() {
    if (!isdefined(self.flashlightlaser)) {
        return;
    }
    self notify("flashlight_laser_off");
    self.flashlightlaser laserforceoff();
    self.flashlightlaser delete();
    self.flashlightlaser = undefined;
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13a1
// Size: 0xbb
function play_flashlight_fx(var_b5214d24f3968b4c) {
    tag = "tag_flash";
    if (isdefined(self.flashlightfxoverridetag)) {
        tag = self.flashlightfxoverridetag;
    }
    fx = "npc_flashlight";
    if (isdefined(self.flashlightfxoverride)) {
        fx = self.flashlightfxoverride;
    }
    self.flashlightfx = fx;
    self.flashlightfxtag = tag;
    if (!isdefined(var_b5214d24f3968b4c)) {
        var_b5214d24f3968b4c = 1;
    }
    if (var_b5214d24f3968b4c) {
        fx_playontag_safe(self.flashlightfx, self.flashlightfxtag, undefined, undefined, 1);
        return;
    }
    playfxontag(getfx(self.flashlightfx), self, self.flashlightfxtag);
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1464
// Size: 0xd6
function kill_flashlight_fx(var_b5214d24f3968b4c) {
    if (!isdefined(self.flashlightfxtag) || self.flashlightfxtag == "tag_flash" || self.flashlightfxtag == "tag_laser") {
        if (isnullweapon(self.weapon)) {
            return;
        }
    }
    if (isdefined(self.flashlightfx)) {
        tag = "tag_flash";
        if (isdefined(self.flashlightfxtag)) {
            tag = self.flashlightfxtag;
        }
        if (!isdefined(var_b5214d24f3968b4c)) {
            var_b5214d24f3968b4c = 1;
        }
        if (var_b5214d24f3968b4c) {
            fx_killontag_safe(self.flashlightfx, tag, undefined, undefined, 1);
        } else {
            killfxontag(getfx(self.flashlightfx), self, tag);
        }
    }
    self.flashlightfx = undefined;
    self.flashlightfxtag = undefined;
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1542
// Size: 0x17
function is_using_flashlight() {
    if (istrue(self.flashlight)) {
        return 1;
    }
    return 0;
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1561
// Size: 0x17
function is_using_nvg() {
    if (istrue(self.nvg)) {
        return 1;
    }
    return 0;
}

// Namespace nvg_ai / scripts\sp\nvg\nvg_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1580
// Size: 0x6a
function can_use_flashlight() {
    if (isdefined(self.noflashlight) && self.noflashlight) {
        return false;
    }
    if (!isdefined(self.a) || !isdefined(self.a.weaponpos) || isundefinedweapon(self.a.weaponpos["right"])) {
        return false;
    }
    return true;
}

