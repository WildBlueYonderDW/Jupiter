// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\createfx.gsc;

#namespace exploder;

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e7
// Size: 0xd1
function setup_individual_exploder(ent) {
    targetname = ent.targetname;
    if (!isdefined(targetname)) {
        targetname = "";
    }
    if (exploder_starts_hidden(ent)) {
        ent hide();
        return;
    }
    if (exploder_is_damaged_model(ent)) {
        ent hide();
        ent notsolid();
        if (isdefined(ent.spawnflags) && ent.spawnflags & 1) {
            if (isdefined(ent.script_disconnectpaths)) {
                ent connectpaths();
            }
        }
        return;
    }
    if (exploder_is_chunk(ent)) {
        ent hide();
        ent notsolid();
        if (isdefined(ent.spawnflags) && ent.spawnflags & 1) {
            ent connectpaths();
        }
        return;
    }
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bf
// Size: 0xf2
function addinitexploders(potentialexploders) {
    foreach (ent in potentialexploders) {
        if (!isdefined(ent)) {
            continue;
        }
        if (isdefined(ent.script_prefab_exploder)) {
            ent.script_exploder = ent.script_prefab_exploder;
            level.init_exploders[level.init_exploders.size] = ent;
        } else if (isdefined(ent.script_exploder)) {
            var_62f91d5269545d20 = 1;
            if (!isdefined(ent.angles)) {
                ent.angles = (0, 0, 0);
            }
            level.init_exploders[level.init_exploders.size] = ent;
        }
    }
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b8
// Size: 0x858
function setupexploders() {
    level.init_exploders = [];
    level.exploders = [];
    ents = getentarray("script_brushmodel", "classname");
    smodels = getentarray("script_model", "classname");
    foreach (smodel in smodels) {
        ents[ents.size] = smodel;
    }
    foreach (ent in ents) {
        if (isdefined(ent.script_prefab_exploder)) {
            ent.script_exploder = ent.script_prefab_exploder;
        }
        if (isdefined(ent.masked_exploder)) {
            continue;
        }
        if (isdefined(ent.script_exploder)) {
            setup_individual_exploder(ent);
        }
    }
    addinitexploders(getentarray("script_brushmodel", "classname"));
    addinitexploders(getentarray("script_model", "classname"));
    addinitexploders(level.var_afb53d6348c4fc39);
    level.var_afb53d6348c4fc39 = undefined;
    if (!isdefined(level.createfxent)) {
        level.createfxent = [];
    }
    acceptabletargetnames = [];
    acceptabletargetnames["exploderchunk visible"] = 1;
    acceptabletargetnames["exploderchunk"] = 1;
    acceptabletargetnames["exploder"] = 1;
    foreach (exploder in level.init_exploders) {
        ent = createexploder(exploder.script_fxid, 1);
        ent.v = [];
        ent.v["origin"] = exploder.origin;
        ent.v["angles"] = exploder.angles;
        ent.v["delay"] = exploder.script_delay;
        ent.v["delay_post"] = exploder.script_delay_post;
        ent.v["firefx"] = exploder.script_firefx;
        ent.v["firefxdelay"] = exploder.script_firefxdelay;
        ent.v["firefxsound"] = exploder.script_firefxsound;
        ent.v["earthquake"] = exploder.script_earthquake;
        ent.v["rumble"] = exploder.script_rumble;
        ent.v["damage"] = exploder.script_damage;
        ent.v["damage_radius"] = exploder.script_radius;
        ent.v["soundalias"] = exploder.script_soundalias;
        ent.v["repeat"] = exploder.script_repeat;
        ent.v["delay_min"] = exploder.script_delay_min;
        ent.v["delay_max"] = exploder.script_delay_max;
        ent.v["target"] = exploder.target;
        ent.v["ender"] = exploder.script_ender;
        ent.v["physics"] = exploder.script_physics;
        ent.v["type"] = "exploder";
        ent.v["dotraces"] = exploder.script_trace;
        ent.v["envonly"] = exploder.script_envonly;
        ent.v["area_swap_index"] = exploder.var_70fc63ef46137e97;
        ent.v["area_swap_state"] = exploder.var_6d7dc2bcfc863ad2;
        if (!isdefined(ent.v["angles"])) {
            ent.v["angles"] = (0, 0, 0);
        }
        ent namespace_321fdd8ad2993260::set_forward_and_up_vectors();
        if (!isdefined(exploder.script_fxid)) {
            ent.v["fxid"] = "No FX";
        } else {
            ent.v["fxid"] = exploder.script_fxid;
        }
        ent.v["exploder"] = exploder.script_exploder;
        /#
            assertex(isdefined(exploder.script_exploder), "Exploder at origin " + exploder.origin + " has no script_exploder");
        #/
        if (!isdefined(ent.v["delay"])) {
            ent.v["delay"] = 0;
        }
        if (isdefined(exploder.target)) {
            get_ent = getentarray(ent.v["target"], "targetname")[0];
            if (isdefined(get_ent)) {
                org = get_ent.origin;
                ent.v["angles"] = vectortoangles(org - ent.v["origin"]);
            } else {
                get_ent = get_target_ent(ent.v["target"]);
                if (isdefined(get_ent)) {
                    org = get_ent.origin;
                    ent.v["angles"] = vectortoangles(org - ent.v["origin"]);
                }
            }
        }
        if (isstruct(exploder)) {
            ent.model = exploder;
            if (isdefined(ent.model.script_modelname)) {
                precachemodel(ent.model.script_modelname);
            }
        } else if (exploder.code_classname == "script_brushmodel" || isdefined(exploder.model)) {
            ent.model = exploder;
            ent.model.disconnect_paths = exploder.script_disconnectpaths;
        }
        if (isdefined(exploder.targetname) && isdefined(acceptabletargetnames[exploder.targetname])) {
            ent.v["exploder_type"] = exploder.targetname;
        } else {
            ent.v["exploder_type"] = "normal";
        }
        if (isdefined(exploder.masked_exploder)) {
            ent.v["masked_exploder"] = exploder.model;
            ent.v["masked_exploder_spawnflags"] = exploder.spawnflags;
            ent.v["masked_exploder_script_disconnectpaths"] = exploder.script_disconnectpaths;
            exploder delete();
        }
        ent namespace_321fdd8ad2993260::post_entity_creation_function();
        var_8927e0f5f68e6073 = ent.v["exploder"];
        if (!isdefined(level.exploders[var_8927e0f5f68e6073])) {
            level.exploders[var_8927e0f5f68e6073] = [];
        }
        level.exploders[var_8927e0f5f68e6073][level.exploders[var_8927e0f5f68e6073].size] = ent;
    }
    level.init_exploders = undefined;
    /#
        level thread function_6538f332fa49ccda();
    #/
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd17
// Size: 0xce
function exploder_flag_wait(msg, var_e2a3f554e65a5ced) {
    if (!flag_exist(msg)) {
        flag_init(msg);
    }
    flag_wait(msg);
    foreach (var_14285e61fb120c7f in var_e2a3f554e65a5ced) {
        foreach (ent in level.createfxexploders[var_14285e61fb120c7f]) {
            ent activate_individual_exploder();
        }
    }
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdec
// Size: 0x2d
function exploder_is_damaged_model(ent) {
    return isdefined(ent.targetname) && ent.targetname == "exploder";
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe21
// Size: 0x43
function exploder_starts_hidden(ent) {
    return ent.model == "fx" && (!isdefined(ent.targetname) || ent.targetname != "exploderchunk");
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6c
// Size: 0x2d
function exploder_is_chunk(ent) {
    return isdefined(ent.targetname) && ent.targetname == "exploderchunk";
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea1
// Size: 0xf6
function show_exploder_models_proc(num) {
    num = num + "";
    exploders = get_exploders();
    if (isdefined(exploders)) {
        foreach (ent in exploders) {
            if (isstruct(ent.model)) {
                continue;
            }
            if (!exploder_starts_hidden(ent.model) && !exploder_is_damaged_model(ent.model) && !exploder_is_chunk(ent.model)) {
                ent.model show();
            }
            if (isdefined(ent.brush_shown)) {
                ent.model show();
            }
        }
    }
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9e
// Size: 0xb1
function get_exploders(str) {
    exploders = [];
    if (level.createfx_enabled) {
        exploders = get_createfx_exploders(str);
    } else if (isdefined(level.createfxexploders[str])) {
        exploders = level.createfxexploders[str];
    }
    if (isdefined(level.exploders[str])) {
        foreach (exploder in level.exploders[str]) {
            exploders[exploders.size] = exploder;
        }
    }
    return exploders;
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1057
// Size: 0xdc
function get_createfx_exploders(str) {
    /#
        array = [];
        foreach (ent in level.createfxent) {
            if (!isdefined(ent)) {
                continue;
            }
            if (ent.v["area_swap_index"] != " has no script_exploder") {
                continue;
            }
            if (!isdefined(ent.v[" has no script_exploder"])) {
                continue;
            }
            if (isdefined(str) && ent.v[" has no script_exploder"] + "MOD_EXPLOSIVE" != str) {
                continue;
            }
            array[array.size] = ent;
        }
        if (array.size == 0) {
            array = undefined;
        }
        return array;
    #/
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x113a
// Size: 0x10b
function stop_exploder_proc(num, players, var_4dea0ff931daa8bd) {
    num = num + "";
    var_1c5e2f2d32a97f95 = 0;
    exploders = get_exploders(num);
    if (isdefined(exploders)) {
        foreach (ent in exploders) {
            if (!isdefined(ent.looper)) {
                continue;
            }
            if (isdefined(ent.loopsound_ent)) {
                ent.loopsound_ent stoploopsound();
                ent.loopsound_ent delete();
            }
            ent.looper delete();
            var_1c5e2f2d32a97f95 = 1;
        }
    }
    if (!shouldrunserversideeffects() && (havemapentseffects() || !var_1c5e2f2d32a97f95)) {
        stop_clientside_exploder(num, players, var_4dea0ff931daa8bd);
    }
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124c
// Size: 0x69
function stop_clientside_exploder(var_8927e0f5f68e6073, players, var_4dea0ff931daa8bd) {
    if (havemapentseffects()) {
        stopclientexploder(var_8927e0f5f68e6073, players, var_4dea0ff931daa8bd);
        return;
    }
    if (!is_valid_clientside_exploder_name(var_8927e0f5f68e6073)) {
        /#
            println("nil" + var_8927e0f5f68e6073 + "<unknown string>");
        #/
        return;
    }
    var_d3173d85d3828c1b = int(var_8927e0f5f68e6073);
    stopclientexploder(var_d3173d85d3828c1b, players, var_4dea0ff931daa8bd);
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12bc
// Size: 0x3c
function get_exploder_array_proc(msg) {
    msg = msg + "";
    array = [];
    exploders = get_exploders(msg);
    if (isdefined(exploders)) {
        array = exploders;
    }
    return array;
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1300
// Size: 0xa7
function hide_exploder_models_proc(num) {
    num = num + "";
    exploders = get_exploders(num);
    if (isdefined(exploders)) {
        foreach (ent in exploders) {
            if (isstruct(ent.model)) {
                continue;
            }
            if (isdefined(ent.model)) {
                ent.model hide();
            }
        }
    }
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ae
// Size: 0xb1
function delete_exploder_proc(num) {
    num = num + "";
    exploders = get_exploders(num);
    if (isdefined(exploders)) {
        foreach (ent in exploders) {
            if (isstruct(ent.model)) {
                continue;
            }
            if (isdefined(ent.model)) {
                ent.model delete();
            }
        }
    }
    level notify("killexplodertridgers" + num);
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1466
// Size: 0x11a
function exploder_damage() {
    if (isdefined(self.v["delay"])) {
        delay = self.v["delay"];
    } else {
        delay = 0;
    }
    if (isdefined(self.v["damage_radius"])) {
        radius = self.v["damage_radius"];
    } else {
        radius = 128;
    }
    damage = self.v["damage"];
    origin = self.v["origin"];
    if (isdefined(self.v["envonly"])) {
        envonly = self.v["envonly"];
    } else {
        envonly = 0;
    }
    if (isdefined(self.v["dotraces"])) {
        dotraces = self.v["dotraces"];
    } else {
        dotraces = 1;
    }
    wait(delay);
    radiusdamage(origin, radius, damage, damage, undefined, "MOD_EXPLOSIVE", undefined, envonly, dotraces);
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1587
// Size: 0x175
function activate_individual_exploder_proc() {
    if (isdefined(self.v["firefx"])) {
        thread fire_effect();
    }
    if (isdefined(self.v["fxid"]) && self.v["fxid"] != "No FX") {
        thread cannon_effect();
    } else if (isdefined(self.v["soundalias"]) && self.v["soundalias"] != "nil") {
        thread sound_effect();
    }
    if (isdefined(self.v["loopsound"]) && self.v["loopsound"] != "nil") {
        thread effect_loopsound();
    }
    if (isdefined(self.v["damage"])) {
        thread exploder_damage();
    }
    if (isdefined(self.v["earthquake"])) {
        thread exploder_earthquake();
    }
    if (isdefined(self.v["rumble"])) {
        thread exploder_rumble();
    }
    if (self.v["exploder_type"] == "exploder") {
        thread brush_show();
    } else if (self.v["exploder_type"] == "exploderchunk" || self.v["exploder_type"] == "exploderchunk visible") {
        thread brush_throw();
    } else {
        thread brush_delete();
    }
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1703
// Size: 0x175
function brush_delete() {
    num = self.v["exploder"];
    if (isdefined(self.v["delay"])) {
        wait(self.v["delay"]);
    } else {
        waitframe();
    }
    if (!isdefined(self.model)) {
        return;
    }
    if (isstruct(self.model)) {
        return;
    }
    if (utility::issp() && isdefined(self.model.classname)) {
        if (self.model.spawnflags & 1) {
            self.model builtin [[ level.func["connectPaths"] ]]();
        }
    }
    if (level.createfx_enabled) {
        if (isdefined(self.exploded)) {
            return;
        }
        self.exploded = 1;
        self.model hide();
        self.model notsolid();
        wait(3);
        self.exploded = undefined;
        self.model show();
        self.model solid();
        return;
    }
    if (!isdefined(self.v["fxid"]) || self.v["fxid"] == "No FX") {
        self.v["exploder"] = undefined;
    }
    waittillframeend();
    self.model delete();
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x187f
// Size: 0x291
function brush_throw() {
    if (isdefined(self.v["delay"])) {
        wait(self.v["delay"]);
    }
    ent = undefined;
    if (isdefined(self.v["target"])) {
        ent = get_target_ent(self.v["target"]);
    }
    if (!isdefined(ent)) {
        self.model delete();
        return;
    }
    self.model show();
    if (isdefined(self.v["delay_post"])) {
        wait(self.v["delay_post"]);
    }
    startorg = self.v["origin"];
    startang = self.v["angles"];
    org = ent.origin;
    physics = isdefined(self.v["physics"]);
    if (physics) {
        target = undefined;
        if (isdefined(ent.target)) {
            target = ent get_target_ent();
        }
        if (isdefined(target)) {
            contact_point = ent.origin;
            var_ed4645685b897766 = vectornormalize(target.origin - ent.origin);
        } else {
            contact_point = self.model.origin;
            var_ed4645685b897766 = vectornormalize(org - self.model.origin);
        }
        var_ed4645685b897766 = var_ed4645685b897766 * self.v["physics"];
        self.model physicslaunchserver(contact_point, var_ed4645685b897766);
        return;
    } else {
        var_ed4645685b897766 = org - self.model.origin;
        self.model rotatevelocity(var_ed4645685b897766, 12);
        self.model movegravity(var_ed4645685b897766, 12);
    }
    if (level.createfx_enabled) {
        if (isdefined(self.exploded)) {
            return;
        }
        self.exploded = 1;
        wait(3);
        self.exploded = undefined;
        self.v["origin"] = startorg;
        self.v["angles"] = startang;
        self.model hide();
        return;
    }
    self.v["exploder"] = undefined;
    wait(6);
    self.model delete();
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b17
// Size: 0x1ff
function brush_show() {
    if (isdefined(self.v["delay"])) {
        wait(self.v["delay"]);
    }
    /#
        assert(isdefined(self.model));
    #/
    is_struct = 0;
    var_64c6a44c81df86c1 = undefined;
    if (!isdefined(self.model.script_modelname)) {
        self.model show();
        self.model solid();
    } else {
        is_struct = 1;
        var_64c6a44c81df86c1 = spawn("script_model", self.model.origin);
        var_64c6a44c81df86c1.angles = self.model.angles;
        var_64c6a44c81df86c1 setmodel(self.model.script_modelname);
        if (isdefined(self.model.script_linkname)) {
            var_64c6a44c81df86c1.script_linkname = self.model.script_linkname;
        }
    }
    self.brush_shown = 1;
    if (!is_struct && utility::issp() && self.model.spawnflags & 1) {
        if (!isdefined(self.model.disconnect_paths)) {
            self.model builtin [[ level.func["connectPaths"] ]]();
        } else {
            self.model builtin [[ level.func["disconnectPaths"] ]]();
        }
    }
    if (level.createfx_enabled) {
        if (isdefined(self.exploded)) {
            return;
        }
        self.exploded = 1;
        wait(3);
        self.exploded = undefined;
        if (!is_struct) {
            self.model hide();
            self.model notsolid();
        } else {
            var_64c6a44c81df86c1 delete();
        }
    }
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d1d
// Size: 0x32
function exploder_rumble() {
    if (!issp()) {
        return;
    }
    exploder_delay();
    level.player playrumbleonentity(self.v["rumble"]);
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d56
// Size: 0xb7
function exploder_delay() {
    if (!isdefined(self.v["delay"])) {
        self.v["delay"] = 0;
    }
    min_delay = self.v["delay"];
    max_delay = self.v["delay"] + 0.001;
    if (isdefined(self.v["delay_min"])) {
        min_delay = self.v["delay_min"];
    }
    if (isdefined(self.v["delay_max"])) {
        max_delay = self.v["delay_max"];
    }
    if (min_delay > 0) {
        wait(randomfloatrange(min_delay, max_delay));
    }
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e14
// Size: 0x7a
function effect_loopsound() {
    if (isdefined(self.loopsound_ent)) {
        self.loopsound_ent stoploopsound();
        self.loopsound_ent delete();
    }
    origin = self.v["origin"];
    alias = self.v["loopsound"];
    exploder_delay();
    self.loopsound_ent = play_loopsound_in_space(alias, origin);
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e95
// Size: 0xa
function sound_effect() {
    effect_soundalias();
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ea6
// Size: 0x47
function effect_soundalias() {
    origin = self.v["origin"];
    alias = self.v["soundalias"];
    exploder_delay();
    play_sound_in_space(alias, origin);
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef4
// Size: 0x2f
function exploder_earthquake() {
    exploder_delay();
    do_earthquake(self.v["earthquake"], self.v["origin"]);
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f2a
// Size: 0x56
function exploder_playsound() {
    if (!isdefined(self.v["soundalias"]) || self.v["soundalias"] == "nil") {
        return;
    }
    play_sound_in_space(self.v["soundalias"], self.v["origin"]);
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f87
// Size: 0x127
function fire_effect() {
    forward = self.v["forward"];
    up = self.v["up"];
    org = undefined;
    firefxsound = self.v["firefxsound"];
    origin = self.v["origin"];
    firefx = self.v["firefx"];
    ender = self.v["ender"];
    if (!isdefined(ender)) {
        ender = "createfx_effectStopper";
    }
    firefxdelay = 0.5;
    if (isdefined(self.v["firefxdelay"])) {
        firefxdelay = self.v["firefxdelay"];
    }
    exploder_delay();
    if (isdefined(firefxsound)) {
        loop_fx_sound(firefxsound, origin, 1, ender);
    }
    playfx(level._effect[firefx], self.v["origin"], forward, up);
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b5
// Size: 0x121
function cannon_effect() {
    if (isdefined(self.v["repeat"])) {
        thread exploder_playsound();
        for (i = 0; i < self.v["repeat"]; i++) {
            playfx(level._effect[self.v["fxid"]], self.v["origin"], self.v["forward"], self.v["up"]);
            exploder_delay();
        }
        return;
    }
    exploder_delay();
    if (isdefined(self.looper)) {
        self.looper delete();
    }
    self.looper = spawnfx(getfx(self.v["fxid"]), self.v["origin"], self.v["forward"], self.v["up"]);
    triggerfx(self.looper);
    exploder_playsound();
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21dd
// Size: 0x198
function function_6538f332fa49ccda() {
    /#
        level endon("<unknown string>");
        while (1) {
            var_21f510057c7bf283 = var_b667b8accaf171b7 = envonly = dotraces = damageradius = damageamount = delay = origin = level waittill("<unknown string>");
            ent = spawnstruct();
            ent.v = [];
            ent.v[" has no script_exploder"] = 0;
            ent.v["<unknown string>"] = origin;
            ent.v["<unknown string>"] = (0, 0, 0);
            ent.v["<unknown string>"] = delay;
            ent.v["<unknown string>"] = damageamount;
            ent.v["<unknown string>"] = damageradius;
            ent.v["<unknown string>"] = dotraces;
            ent.v["<unknown string>"] = envonly;
            ent.v["<unknown string>"] = "<unknown string>";
            if (isdefined(var_b667b8accaf171b7) && var_b667b8accaf171b7.size > 0) {
                ent.v["<unknown string>"] = var_b667b8accaf171b7;
            }
            if (isdefined(var_21f510057c7bf283) && var_21f510057c7bf283.size > 0) {
                ent.v["<unknown string>"] = var_21f510057c7bf283;
            }
            ent activate_individual_exploder_proc();
        }
    #/
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x237c
// Size: 0xca
function activate_exploder(num, players, starttime) {
    num = num + "";
    level notify("exploding_" + num);
    var_1c5e2f2d32a97f95 = 0;
    exploders = get_exploders(num);
    if (isdefined(exploders)) {
        foreach (ent in exploders) {
            ent activate_individual_exploder();
            var_1c5e2f2d32a97f95 = 1;
        }
    }
    if (!shouldrunserversideeffects() && (havemapentseffects() || !var_1c5e2f2d32a97f95)) {
        activate_clientside_exploder(num, players, starttime);
    }
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244d
// Size: 0x69
function activate_clientside_exploder(var_8927e0f5f68e6073, players, starttime) {
    if (havemapentseffects()) {
        activateclientexploder(var_8927e0f5f68e6073, players, starttime);
        return;
    }
    if (!is_valid_clientside_exploder_name(var_8927e0f5f68e6073)) {
        /#
            println("nil" + var_8927e0f5f68e6073 + "<unknown string>");
        #/
        return;
    }
    var_d3173d85d3828c1b = int(var_8927e0f5f68e6073);
    activateclientexploder(var_d3173d85d3828c1b, players, starttime);
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24bd
// Size: 0x46
function is_valid_clientside_exploder_name(var_8927e0f5f68e6073) {
    if (!isdefined(var_8927e0f5f68e6073)) {
        return 0;
    }
    var_d3173d85d3828c1b = var_8927e0f5f68e6073;
    if (isstring(var_8927e0f5f68e6073)) {
        var_d3173d85d3828c1b = int(var_8927e0f5f68e6073);
        if (var_d3173d85d3828c1b == 0 && var_8927e0f5f68e6073 != "0") {
            return 0;
        }
    }
    return var_d3173d85d3828c1b >= 0;
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x250b
// Size: 0x53
function shouldrunserversideeffects() {
    if (utility::issp() && !havemapentseffects()) {
        return 1;
    }
    if (!isdefined(level.createfx_enabled)) {
        set_createfx_enabled();
    }
    if (level.createfx_enabled) {
        return 1;
    } else {
        return (getdvar(@"hash_cadf250daffab004") != "1");
    }
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2565
// Size: 0x28
function exploder_before_load(num, players, starttime) {
    waittillframeend();
    waittillframeend();
    activate_exploder(num, players, starttime);
}

// Namespace exploder/namespace_ed6d37a42f9fd2e7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2594
// Size: 0x26
function exploder_after_load(num, players, starttime) {
    activate_exploder(num, players, starttime);
}

