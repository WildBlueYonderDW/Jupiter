// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\createfx.gsc;
#using scripts\common\exploder.gsc;

#namespace fx;

// Namespace fx/namespace_620ad37c5e3fa104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c
// Size: 0x50
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

// Namespace fx/namespace_620ad37c5e3fa104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f3
// Size: 0x360
function init_fx_thread() {
    if (!isdefined(level._fx)) {
        level._fx = spawnstruct();
    }
    create_lock("createfx_looper", 20);
    level._fx.fireloopmod = 1;
    level._fx.exploderfunction = &namespace_ed6d37a42f9fd2e7::exploder_before_load;
    waittillframeend();
    waittillframeend();
    level._fx.exploderfunction = &namespace_ed6d37a42f9fd2e7::exploder_after_load;
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
        setdevdvarifuninitialized(@"hash_c1674252f3005f02", 0);
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
    foreach (msg, var_e2a3f554e65a5ced in var_4c5056380ab96e2d) {
        thread namespace_ed6d37a42f9fd2e7::exploder_flag_wait(msg, var_e2a3f554e65a5ced);
    }
    check_createfx_limit();
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65a
// Size: 0x13c
function remove_dupes() {
    /#
        if (getdvarint(@"hash_66ba26fa32261de") == 0) {
            return;
        }
        var_32b5c59468d24da0 = [];
        for (i = 0; i < level.createfxent.size; i++) {
            var_aa81bb1456b3860a = 1;
            var_41b91213c9cceca = level.createfxent[i];
            for (j = i + 1; j < level.createfxent.size; j++) {
                var_9d2b06074809da77 = level.createfxent[j];
                if (var_9d2b06074809da77.v["on"] == var_41b91213c9cceca.v["on"]) {
                    if (var_9d2b06074809da77.v["sounddone"] == var_41b91213c9cceca.v["sounddone"]) {
                        println("<unknown string>" + var_9d2b06074809da77.v["on"] + "<unknown string>" + var_9d2b06074809da77.v["sounddone"]);
                        var_aa81bb1456b3860a = 0;
                    }
                }
            }
            if (var_aa81bb1456b3860a) {
                var_32b5c59468d24da0[var_32b5c59468d24da0.size] = var_41b91213c9cceca;
            }
        }
        level.createfxent = var_32b5c59468d24da0;
    #/
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x79d
// Size: 0x11a
function offset_fix() {
    /#
        if (getdvar(@"hash_c1674252f3005f02") == "<unknown string>") {
            return;
        }
        dvar = getdvar(@"hash_c1674252f3005f02");
        toks = strtok(dvar, "<unknown string>");
        if (toks.size != 3) {
            return;
        }
        offset = (int(toks[0]), int(toks[1]), int(toks[2]));
        var_32b5c59468d24da0 = [];
        foreach (ent in level.createfxent) {
            ent.v["sounddone"] = ent.v["sounddone"] + offset;
        }
        setdvar(@"hash_c1674252f3005f02", "<unknown string>");
        iprintlnbold("<unknown string>");
    #/
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8be
// Size: 0xd0
function check_createfx_limit() {
    /#
        if (!issp()) {
            return;
        }
        var_2f497d0462841db7 = 0;
        var_d86c627c77f35784 = 0;
        foreach (ent in level.createfxent) {
            if (is_createfx_type(ent, "<unknown string>")) {
                var_2f497d0462841db7++;
            } else if (is_createfx_type(ent, "<unknown string>")) {
                var_d86c627c77f35784++;
            }
        }
        println("<unknown string>" + var_2f497d0462841db7);
        println("<unknown string>" + var_d86c627c77f35784);
        check_limit_type("<unknown string>", var_2f497d0462841db7);
        check_limit_type("<unknown string>", var_d86c627c77f35784);
    #/
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x995
// Size: 0x6a
function check_limit_type(type, count) {
    /#
        limit = undefined;
        if (type == "<unknown string>") {
            limit = 1750;
        } else if (type == "<unknown string>") {
            limit = 384;
        }
        if (count > limit) {
            /#
                assertmsg("<unknown string>" + type + "<unknown string>" + count + "<unknown string>" + limit);
            #/
        }
    #/
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa06
// Size: 0xce
function print_org(fxcommand, fxid, fxpos, waittime) {
    if (getdvar(@"hash_849debc78661e8d9") == "1") {
        /#
            println("<unknown string>");
            println("<unknown string>" + fxpos[0] + "<unknown string>" + fxpos[1] + "<unknown string>" + fxpos[2] + "<unknown string>");
            println("<unknown string>");
            println("<unknown string>");
            println("<unknown string>" + fxcommand + "<unknown string>");
            println("<unknown string>" + fxid + "<unknown string>");
            println("<unknown string>" + waittime + "<unknown string>");
            println("<unknown string>");
        #/
    }
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xadb
// Size: 0xc3
function loopfx(fxid, fxpos, waittime, fxpos2, fxstart, fxstop, timeout) {
    /#
        println("<unknown string>");
    #/
    ent = createloopeffect(fxid);
    ent.v["origin"] = fxpos;
    ent.v["angles"] = (0, 0, 0);
    if (isdefined(fxpos2)) {
        ent.v["angles"] = vectortoangles(fxpos2 - fxpos);
    }
    ent.v["delay"] = waittime;
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba5
// Size: 0x6e
function create_looper() {
    self.looper = playloopedfx(level._effect[self.v["fxid"]], self.v["delay"], self.v["origin"], 0, self.v["forward"], self.v["up"]);
    create_loopsound();
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1a
// Size: 0x164
function create_loopsound() {
    self notify("stop_loop");
    if (!isdefined(self.v["soundalias"])) {
        return;
    }
    if (self.v["soundalias"] == "nil") {
        return;
    }
    /#
        if (getdvar(@"hash_e6afce2cf5cf7515") == "<unknown string>") {
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

// Namespace fx/namespace_620ad37c5e3fa104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd85
// Size: 0x11d
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
        if (getdvar(@"hash_e6afce2cf5cf7515") == "<unknown string>") {
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

// Namespace fx/namespace_620ad37c5e3fa104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea9
// Size: 0xb2
function loopfxthread() {
    waitframe();
    if (isdefined(self.fxstart)) {
        level waittill("start fx" + self.fxstart);
    }
    while (1) {
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
        } else {
            return;
        }
    }
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf62
// Size: 0x24
function loopfxstop(timeout) {
    self endon("death");
    wait(timeout);
    self.looper delete();
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0xf8d
// Size: 0x56
function gunfireloopfx(fxid, fxpos, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax) {
    thread gunfireloopfxthread(fxid, fxpos, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax);
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfea
// Size: 0x163
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
            wait(shotdelaybase + randomfloat(shotdelayrange));
        }
        wait(betweensetsbase + randomfloat(betweensetsrange));
    }
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1154
// Size: 0xb0
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

// Namespace fx/namespace_620ad37c5e3fa104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120b
// Size: 0x59
function verify_effects_assignment(effectid) {
    if (isdefined(level._effect[effectid])) {
        return 1;
    }
    if (!isdefined(level._missing_fx)) {
        level._missing_fx = [];
    }
    level._missing_fx[self.v["fxid"]] = effectid;
    verify_effects_assignment_print(effectid);
    return 0;
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126c
// Size: 0xb9
function verify_effects_assignment_print(effectid) {
    level notify("verify_effects_assignment_print");
    level endon("verify_effects_assignment_print");
    waitframe();
    /#
        println("<unknown string>");
        println("<unknown string>");
        keys = getarraykeys(level._missing_fx);
        foreach (key in keys) {
            println("<unknown string>" + key);
        }
        println("<unknown string>");
    #/
    /#
        assertmsg("Missing Effects ID assignments ( see console )");
    #/
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132c
// Size: 0x3a
function oneshotfxthread() {
    waitframe();
    if (self.v["delay"] > 0) {
        wait(self.v["delay"]);
    }
    [[ level.func["create_triggerfx"] ]]();
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x136d
// Size: 0xbe
function add_reactive_fx() {
    if (!issp() && getdvar(@"hash_284cbc4392371c00") == "") {
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

// Namespace fx/namespace_620ad37c5e3fa104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1432
// Size: 0xf5
function reactive_fx_thread() {
    if (!issp()) {
        if (getdvar(@"hash_284cbc4392371c00") == "on") {
            flag_wait("createfx_started");
        }
    }
    level._fx.reactive_sound_ents = [];
    explosion_radius = 256;
    while (1) {
        delay = objweapon = point = explosion_radius = attacker = level waittill("code_damageradius");
        ents = sort_reactive_ents(point, explosion_radius);
        foreach (i, ent in ents) {
            ent thread play_reactive_fx(i, delay);
        }
    }
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152e
// Size: 0x15
function vector2d(vec) {
    return (vec[0], vec[1], 0);
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154b
// Size: 0x296
function sort_reactive_ents(point, explosion_radius) {
    closest = [];
    time = gettime();
    foreach (ent in level._fx.reactive_fx_ents) {
        if (ent.next_reactive_time > time) {
            continue;
        }
        radius_squared = ent.v["reactive_radius"] + explosion_radius;
        radius_squared = radius_squared * radius_squared;
        if (distancesquared(point, ent.v["origin"]) < radius_squared) {
            closest[closest.size] = ent;
        }
    }
    foreach (ent in closest) {
        var_af1392a218a7888a = vector2d(ent.v["origin"] - level.player.origin);
        var_c2da92f3a0a86861 = vector2d(point - level.player.origin);
        vec1 = vectornormalize(var_af1392a218a7888a);
        vec2 = vectornormalize(var_c2da92f3a0a86861);
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

// Namespace fx/namespace_620ad37c5e3fa104
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e9
// Size: 0x1ce
function play_reactive_fx(num, delay) {
    /#
        /#
            assertex(self.v["<unknown string>"] != "<unknown string>" || self.v["<unknown string>"] != "<unknown string>", "<unknown string>" + self.v["sounddone"] + "<unknown string>");
        #/
    #/
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
    wait(num * randomfloatrange(0.05, 0.1) + delay);
    if (utility::issp()) {
        sound_ent playsound(self.v["soundalias"], "sounddone");
        sound_ent waittill("sounddone");
    } else {
        sound_ent playsound(self.v["soundalias"]);
        wait(2);
    }
    wait(0.1);
    sound_ent.is_playing = 0;
    /#
        self.is_playing = undefined;
    #/
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19be
// Size: 0xd7
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

// Namespace fx/namespace_620ad37c5e3fa104
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1a9d
// Size: 0x2e
function playfxnophase(fx, location, forwarddir, updir) {
    playfx(fx, location, forwarddir, updir);
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad2
// Size: 0x8b
function script_struct_fx_init() {
    level.struct_fx = getstructarray("struct_fx", "targetname");
    foreach (struct in level.struct_fx) {
        if (!issp() || !isdefined(struct.script_fxgroup)) {
            play_struct_fx(struct);
        }
    }
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b64
// Size: 0x21e
function play_struct_fx(struct) {
    if (isdefined(struct.script_fxid) && isdefined(level._effect[struct.script_fxid])) {
        if (!isdefined(struct.angles)) {
            struct.angles = (0, 0, 0);
        }
        struct.fx = spawnfx(level._effect[struct.script_fxid], struct.origin, anglestoforward(struct.angles), anglestoup(struct.angles));
        if (isdefined(struct.script_delay_min) && isdefined(struct.script_delay_max)) {
            /#
                assertex(struct.script_delay_min <= struct.script_delay_max, "script_struct_fx at " + struct.origin + " has script_delay_min >= script_delay_max. ");
            #/
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
        } else {
            struct.sfx playsound(struct.script_soundalias);
        }
    }
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d89
// Size: 0x3d
function stop_struct_fx(struct) {
    struct.fx delete();
    if (isdefined(struct.sfx)) {
        struct.sfx delete();
    }
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dcd
// Size: 0x18
function struct_fx_active(struct) {
    return isdefined(struct.fx);
}

// Namespace fx/namespace_620ad37c5e3fa104
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ded
// Size: 0x19
function struct_fx_inactive(struct) {
    return !isdefined(struct.fx);
}

