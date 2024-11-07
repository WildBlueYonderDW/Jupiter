#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\createfx.gsc;
#using scripts\common\exploder.gsc;

#namespace fx;

// Namespace fx / scripts\common\fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29c
// Size: 0x4f
function initfx() {
    if (!add_init_script("fx", &initfx)) {
        return;
    }
    set_createfx_enabled();
    if (havemapentseffects()) {
        level.createfxent = [];
    }
    create_func_ref("create_triggerfx", &create_triggerfx);
    thread init_fx_thread();
    script_struct_fx_init();
}

// Namespace fx / scripts\common\fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f3
// Size: 0x357
function init_fx_thread() {
    if (!isdefined(level._fx)) {
        level._fx = spawnstruct();
    }
    create_lock("createfx_looper", 20);
    level._fx.fireloopmod = 1;
    level._fx.exploderfunction = &scripts\common\exploder::exploder_before_load;
    waittillframeend();
    waittillframeend();
    level._fx.exploderfunction = &scripts\common\exploder::exploder_after_load;
    level._fx.server_culled_sounds = 0;
    if (getdvarint(@"hash_7ebee7a942eed3c8") == 1) {
        level._fx.server_culled_sounds = 1;
    }
    if (level.createfx_enabled) {
        level._fx.server_culled_sounds = 0;
    }
    /#
        setdevdvarifuninitialized(@"hash_85b139dc623fa880", 0);
        setdevdvarifuninitialized(@"hash_66ba26fa32261de", 0);
        setdevdvarifuninitialized(@"createfx_offset", 0);
        if (getdvarint(@"hash_e6afce2cf5cf7515") == 1) {
            level._fx.server_culled_sounds = 1;
        }
    #/
    if (level.createfx_enabled) {
        level waittill("createfx_common_done");
    }
    level.createfxexploders = [];
    var_4c5056380ab96e2d = [];
    /#
        remove_dupes();
        offset_fix();
    #/
    foreach (ent in level.createfxent) {
        ent set_forward_and_up_vectors();
        switch (ent.v["type"]) {
        case #"hash_1ac9f75b98e637fd":
            ent thread loopfxthread();
            break;
        case #"hash_16b43f355b98c009":
            ent thread oneshotfxthread();
            break;
        case #"hash_fbc4edc91b6c146a":
            ent thread create_loopsound();
            break;
        case #"hash_c9ec51ce0335258e":
            ent thread create_interval_sound();
            break;
        case #"hash_46a741fcf24ab59":
            ent add_reactive_fx();
            break;
        }
        if (isdefined(ent.v["exploder"])) {
            add_exploder(ent.v["exploder"], ent);
            if (isdefined(ent.v["flag"]) && ent.v["flag"] != "nil") {
                temp = var_4c5056380ab96e2d[ent.v["flag"]];
                if (!isdefined(temp)) {
                    temp = [];
                }
                temp[temp.size] = ent.v["exploder"];
                var_4c5056380ab96e2d[ent.v["flag"]] = temp;
            }
        }
    }
    foreach (var_e2a3f554e65a5ced in var_4c5056380ab96e2d) {
        thread scripts\common\exploder::exploder_flag_wait(msg, var_e2a3f554e65a5ced);
    }
    check_createfx_limit();
}

/#

    // Namespace fx / scripts\common\fx
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x652
    // Size: 0x13b
    function remove_dupes() {
        if (getdvarint(@"hash_66ba26fa32261de") == 0) {
            return;
        }
        new_ents = [];
        for (i = 0; i < level.createfxent.size; i++) {
            add_ent = 1;
            i_ent = level.createfxent[i];
            for (j = i + 1; j < level.createfxent.size; j++) {
                j_ent = level.createfxent[j];
                if (j_ent.v["<dev string:x1c>"] == i_ent.v["<dev string:x1c>"]) {
                    if (j_ent.v["<dev string:x21>"] == i_ent.v["<dev string:x21>"]) {
                        println("<dev string:x28>" + j_ent.v["<dev string:x1c>"] + "<dev string:x3d>" + j_ent.v["<dev string:x21>"]);
                        add_ent = 0;
                    }
                }
            }
            if (add_ent) {
                new_ents[new_ents.size] = i_ent;
            }
        }
        level.createfxent = new_ents;
    }

    // Namespace fx / scripts\common\fx
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x795
    // Size: 0x115
    function offset_fix() {
        if (getdvar(@"createfx_offset") == "<dev string:x42>") {
            return;
        }
        dvar = getdvar(@"createfx_offset");
        toks = strtok(dvar, "<dev string:x43>");
        if (toks.size != 3) {
            return;
        }
        offset = (int(toks[0]), int(toks[1]), int(toks[2]));
        new_ents = [];
        foreach (ent in level.createfxent) {
            ent.v["<dev string:x21>"] = ent.v["<dev string:x21>"] + offset;
        }
        setdvar(@"createfx_offset", "<dev string:x42>");
        iprintlnbold("<dev string:x45>");
    }

#/

// Namespace fx / scripts\common\fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b2
// Size: 0xcb
function check_createfx_limit() {
    /#
        if (!issp()) {
            return;
        }
        fx_count = 0;
        sound_count = 0;
        foreach (ent in level.createfxent) {
            if (is_createfx_type(ent, "<dev string:x71>")) {
                fx_count++;
                continue;
            }
            if (is_createfx_type(ent, "<dev string:x74>")) {
                sound_count++;
            }
        }
        println("<dev string:x7a>" + fx_count);
        println("<dev string:x95>" + sound_count);
        check_limit_type("<dev string:x71>", fx_count);
        check_limit_type("<dev string:x74>", sound_count);
    #/
}

/#

    // Namespace fx / scripts\common\fx
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x985
    // Size: 0x69
    function check_limit_type(type, count) {
        limit = undefined;
        if (type == "<dev string:x71>") {
            limit = 1750;
        } else if (type == "<dev string:x74>") {
            limit = 384;
        }
        if (count > limit) {
            assertmsg("<dev string:xb3>" + type + "<dev string:xd0>" + count + "<dev string:x109>" + limit);
        }
    }

#/

// Namespace fx / scripts\common\fx
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9f6
// Size: 0xcd
function print_org(fxcommand, fxid, fxpos, waittime) {
    if (getdvar(@"debug") == "1") {
        /#
            println("<dev string:x11c>");
            println("<dev string:x11e>" + fxpos[0] + "<dev string:x43>" + fxpos[1] + "<dev string:x43>" + fxpos[2] + "<dev string:x129>");
            println("<dev string:x12b>");
            println("<dev string:x146>");
            println("<dev string:x153>" + fxcommand + "<dev string:x129>");
            println("<dev string:x168>" + fxid + "<dev string:x129>");
            println("<dev string:x178>" + waittime + "<dev string:x129>");
            println("<dev string:x189>");
        #/
    }
}

// Namespace fx / scripts\common\fx
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xacb
// Size: 0xc2
function loopfx(fxid, fxpos, waittime, fxpos2, fxstart, fxstop, timeout) {
    println("<dev string:x18b>");
    ent = createloopeffect(fxid);
    ent.v["origin"] = fxpos;
    ent.v["angles"] = (0, 0, 0);
    if (isdefined(fxpos2)) {
        ent.v["angles"] = vectortoangles(fxpos2 - fxpos);
    }
    ent.v["delay"] = waittime;
}

// Namespace fx / scripts\common\fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb95
// Size: 0x6d
function create_looper() {
    self.looper = playloopedfx(level._effect[self.v["fxid"]], self.v["delay"], self.v["origin"], 0, self.v["forward"], self.v["up"]);
    create_loopsound();
}

// Namespace fx / scripts\common\fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc0a
// Size: 0x163
function create_loopsound() {
    self notify("stop_loop");
    if (!isdefined(self.v["soundalias"])) {
        return;
    }
    if (self.v["soundalias"] == "nil") {
        return;
    }
    /#
        if (getdvar(@"hash_e6afce2cf5cf7515") == "<dev string:x1a1>") {
            return;
        }
    #/
    culled = 0;
    end_on = undefined;
    if (isdefined(self.v["stopable"]) && self.v["stopable"]) {
        if (isdefined(self.looper)) {
            end_on = "death";
        } else {
            end_on = "stop_loop";
        }
    } else if (level._fx.server_culled_sounds && isdefined(self.v["server_culled"])) {
        culled = self.v["server_culled"];
    }
    ent = self;
    if (isdefined(self.looper)) {
        ent = self.looper;
    }
    createfx_ent = undefined;
    if (level.createfx_enabled) {
        createfx_ent = self;
    }
    ent loop_fx_sound_with_angles(self.v["soundalias"], self.v["origin"], self.v["angles"], culled, end_on, createfx_ent);
}

// Namespace fx / scripts\common\fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd75
// Size: 0x11c
function create_interval_sound() {
    self notify("stop_loop");
    if (!isdefined(self.v["soundalias"])) {
        return;
    }
    if (self.v["soundalias"] == "nil") {
        return;
    }
    ender = undefined;
    runner = self;
    /#
        if (getdvar(@"hash_e6afce2cf5cf7515") == "<dev string:x1a1>") {
            return;
        }
    #/
    if (isdefined(self.v["stopable"]) && self.v["stopable"] || level.createfx_enabled) {
        if (isdefined(self.looper)) {
            runner = self.looper;
            ender = "death";
        } else {
            ender = "stop_loop";
        }
    }
    runner thread loop_fx_sound_interval_with_angles(self.v["soundalias"], self.v["origin"], self.v["angles"], ender, undefined, self.v["delay_min"], self.v["delay_max"]);
}

// Namespace fx / scripts\common\fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe99
// Size: 0xb1
function loopfxthread() {
    waitframe();
    if (isdefined(self.fxstart)) {
        level waittill("start fx" + self.fxstart);
    }
    while (true) {
        create_looper();
        if (isdefined(self.timeout)) {
            thread loopfxstop(self.timeout);
        }
        if (isdefined(self.fxstop)) {
            level waittill("stop fx" + self.fxstop);
        } else {
            return;
        }
        if (isdefined(self.looper)) {
            self.looper delete();
        }
        if (isdefined(self.fxstart)) {
            level waittill("start fx" + self.fxstart);
            continue;
        }
        return;
    }
}

// Namespace fx / scripts\common\fx
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf52
// Size: 0x23
function loopfxstop(timeout) {
    self endon("death");
    wait timeout;
    self.looper delete();
}

// Namespace fx / scripts\common\fx
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0xf7d
// Size: 0x55
function gunfireloopfx(fxid, fxpos, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax) {
    thread gunfireloopfxthread(fxid, fxpos, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax);
}

// Namespace fx / scripts\common\fx
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0xfda
// Size: 0x162
function gunfireloopfxthread(fxid, fxpos, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax) {
    level endon("stop all gunfireloopfx");
    waitframe();
    if (betweensetsmax < betweensetsmin) {
        temp = betweensetsmax;
        betweensetsmax = betweensetsmin;
        betweensetsmin = temp;
    }
    betweensetsbase = betweensetsmin;
    betweensetsrange = betweensetsmax - betweensetsmin;
    if (shotdelaymax < shotdelaymin) {
        temp = shotdelaymax;
        shotdelaymax = shotdelaymin;
        shotdelaymin = temp;
    }
    shotdelaybase = shotdelaymin;
    shotdelayrange = shotdelaymax - shotdelaymin;
    if (shotsmax < shotsmin) {
        temp = shotsmax;
        shotsmax = shotsmin;
        shotsmin = temp;
    }
    shotsbase = shotsmin;
    shotsrange = shotsmax - shotsmin;
    fxent = spawnfx(level._effect[fxid], fxpos);
    if (!level.createfx_enabled) {
        fxent willneverchange();
    }
    for (;;) {
        shotnum = shotsbase + randomint(shotsrange);
        for (i = 0; i < shotnum; i++) {
            triggerfx(fxent);
            wait shotdelaybase + randomfloat(shotdelayrange);
        }
        wait betweensetsbase + randomfloat(betweensetsrange);
    }
}

// Namespace fx / scripts\common\fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1144
// Size: 0xaf
function create_triggerfx() {
    if (!verify_effects_assignment(self.v["fxid"])) {
        return;
    }
    self.looper = spawnfx(level._effect[self.v["fxid"]], self.v["origin"], self.v["forward"], self.v["up"]);
    triggerfx(self.looper, self.v["delay"]);
    if (!level.createfx_enabled) {
        self.looper willneverchange();
    }
    create_loopsound();
}

// Namespace fx / scripts\common\fx
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11fb
// Size: 0x58
function verify_effects_assignment(effectid) {
    if (isdefined(level._effect[effectid])) {
        return true;
    }
    if (!isdefined(level._missing_fx)) {
        level._missing_fx = [];
    }
    level._missing_fx[self.v["fxid"]] = effectid;
    verify_effects_assignment_print(effectid);
    return false;
}

// Namespace fx / scripts\common\fx
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x125c
// Size: 0xb4
function verify_effects_assignment_print(effectid) {
    level notify("verify_effects_assignment_print");
    level endon("verify_effects_assignment_print");
    waitframe();
    /#
        println("<dev string:x1a3>");
        println("<dev string:x1aa>");
        keys = getarraykeys(level._missing_fx);
        foreach (key in keys) {
            println("<dev string:x1d8>" + key);
        }
        println("<dev string:x1a3>");
    #/
    assertmsg("Missing Effects ID assignments ( see console )");
}

// Namespace fx / scripts\common\fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1318
// Size: 0x39
function oneshotfxthread() {
    waitframe();
    if (self.v["delay"] > 0) {
        wait self.v["delay"];
    }
    [[ level.func["create_triggerfx"] ]]();
}

// Namespace fx / scripts\common\fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1359
// Size: 0xbd
function add_reactive_fx() {
    if (!issp() && getdvar(@"createfx") == "") {
        return;
    }
    if (!isdefined(level._fx.reactive_thread)) {
        level._fx.reactive_thread = 1;
        level thread reactive_fx_thread();
    }
    if (!isdefined(level._fx.reactive_fx_ents)) {
        level._fx.reactive_fx_ents = [];
    }
    level._fx.reactive_fx_ents[level._fx.reactive_fx_ents.size] = self;
    self.next_reactive_time = 3000;
}

// Namespace fx / scripts\common\fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x141e
// Size: 0xf0
function reactive_fx_thread() {
    if (!issp()) {
        if (getdvar(@"createfx") == "on") {
            flag_wait("createfx_started");
        }
    }
    level._fx.reactive_sound_ents = [];
    explosion_radius = 256;
    while (true) {
        level waittill("code_damageradius", attacker, explosion_radius, point, objweapon, delay);
        ents = sort_reactive_ents(point, explosion_radius);
        foreach (ent in ents) {
            ent thread play_reactive_fx(i, delay);
        }
    }
}

// Namespace fx / scripts\common\fx
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1516
// Size: 0x14
function vector2d(vec) {
    return (vec[0], vec[1], 0);
}

// Namespace fx / scripts\common\fx
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1533
// Size: 0x289
function sort_reactive_ents(point, explosion_radius) {
    closest = [];
    time = gettime();
    foreach (ent in level._fx.reactive_fx_ents) {
        if (ent.next_reactive_time > time) {
            continue;
        }
        radius_squared = ent.v["reactive_radius"] + explosion_radius;
        radius_squared *= radius_squared;
        if (distancesquared(point, ent.v["origin"]) < radius_squared) {
            closest[closest.size] = ent;
        }
    }
    foreach (ent in closest) {
        var_af1392a218a7888a = vector2d(ent.v["origin"] - level.player.origin);
        playertopoint = vector2d(point - level.player.origin);
        vec1 = vectornormalize(var_af1392a218a7888a);
        vec2 = vectornormalize(playertopoint);
        ent.dot = vectordot(vec1, vec2);
    }
    for (i = 0; i < closest.size - 1; i++) {
        for (j = i + 1; j < closest.size; j++) {
            if (closest[i].dot > closest[j].dot) {
                temp = closest[i];
                closest[i] = closest[j];
                closest[j] = temp;
            }
        }
    }
    foreach (ent in closest) {
        ent.origin = undefined;
        ent.dot = undefined;
    }
    for (i = 4; i < closest.size; i++) {
        closest[i] = undefined;
    }
    return closest;
}

// Namespace fx / scripts\common\fx
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17c5
// Size: 0x1cd
function play_reactive_fx(num, delay) {
    assertex(self.v["<dev string:x203>"] != "<dev string:x208>" || self.v["<dev string:x20e>"] != "<dev string:x219>", "<dev string:x21d>" + self.v["<dev string:x21>"] + "<dev string:x22d>");
    if (self.v["fxid"] != "No FX") {
        playfx(level._effect[self.v["fxid"]], self.v["origin"], self.v["forward"], self.v["up"]);
    }
    if (self.v["soundalias"] == "nil") {
        return;
    }
    sound_ent = get_reactive_sound_ent();
    if (!isdefined(sound_ent)) {
        return;
    }
    /#
        self.is_playing = 1;
    #/
    self.next_reactive_time = gettime() + 3000;
    sound_ent.origin = self.v["origin"];
    sound_ent.is_playing = 1;
    if (!isdefined(delay)) {
        delay = 0;
    }
    wait num * randomfloatrange(0.05, 0.1) + delay;
    if (utility::issp()) {
        sound_ent playsound(self.v["soundalias"], "sounddone");
        sound_ent waittill("sounddone");
    } else {
        sound_ent playsound(self.v["soundalias"]);
        wait 2;
    }
    wait 0.1;
    sound_ent.is_playing = 0;
    /#
        self.is_playing = undefined;
    #/
}

// Namespace fx / scripts\common\fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x199a
// Size: 0xd2
function get_reactive_sound_ent() {
    foreach (ent in level._fx.reactive_sound_ents) {
        if (!ent.is_playing) {
            return ent;
        }
    }
    if (level._fx.reactive_sound_ents.size < 4) {
        ent = spawn("script_origin", (0, 0, 0));
        ent.is_playing = 0;
        level._fx.reactive_sound_ents[level._fx.reactive_sound_ents.size] = ent;
        return ent;
    }
    return undefined;
}

// Namespace fx / scripts\common\fx
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1a75
// Size: 0x2d
function playfxnophase(fx, location, forwarddir, updir) {
    playfx(fx, location, forwarddir, updir);
}

// Namespace fx / scripts\common\fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1aaa
// Size: 0x86
function script_struct_fx_init() {
    level.struct_fx = getstructarray("struct_fx", "targetname");
    foreach (struct in level.struct_fx) {
        if (!issp() || !isdefined(struct.script_fxgroup)) {
            play_struct_fx(struct);
        }
    }
}

// Namespace fx / scripts\common\fx
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b38
// Size: 0x21d
function play_struct_fx(struct) {
    if (isdefined(struct.script_fxid) && isdefined(level._effect[struct.script_fxid])) {
        if (!isdefined(struct.angles)) {
            struct.angles = (0, 0, 0);
        }
        struct.fx = spawnfx(level._effect[struct.script_fxid], struct.origin, anglestoforward(struct.angles), anglestoup(struct.angles));
        if (isdefined(struct.script_delay_min) && isdefined(struct.script_delay_max)) {
            assertex(struct.script_delay_min <= struct.script_delay_max, "script_struct_fx at " + struct.origin + " has script_delay_min >= script_delay_max. ");
            triggerfx(struct.fx, randomfloat(struct.script_delay_min, struct.script_delay_max) / 1000);
        } else if (isdefined(struct.script_delay)) {
            triggerfx(struct.fx, struct.script_delay / 1000);
        } else {
            triggerfx(struct.fx, -0.004);
        }
    }
    if (isdefined(struct.script_soundalias)) {
        struct.sfx = spawn("script_origin", struct.origin);
        struct.sfx.angles = struct.angles;
        if (soundislooping(struct.script_soundalias)) {
            struct.sfx playloopsound(struct.script_soundalias);
            return;
        }
        struct.sfx playsound(struct.script_soundalias);
    }
}

// Namespace fx / scripts\common\fx
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d5d
// Size: 0x3c
function stop_struct_fx(struct) {
    struct.fx delete();
    if (isdefined(struct.sfx)) {
        struct.sfx delete();
    }
}

// Namespace fx / scripts\common\fx
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1da1
// Size: 0x17
function struct_fx_active(struct) {
    return isdefined(struct.fx);
}

// Namespace fx / scripts\common\fx
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc1
// Size: 0x18
function struct_fx_inactive(struct) {
    return !isdefined(struct.fx);
}

