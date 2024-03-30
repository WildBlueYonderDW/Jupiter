// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\face.gsc;
#using scripts\engine\trace.gsc;

#namespace notetrack;

// Namespace notetrack / scripts/common/notetrack
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b0
// Size: 0xc
function function_11f8c6d6f5ba948() {
    level thread function_9ce792d127499205();
}

// Namespace notetrack / scripts/common/notetrack
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c3
// Size: 0x99
function function_68c73b00bb25af3(guy, msg) {
    guy endon("stop_sequencing_notetracks");
    guy endon("death");
    guy endon("stop_agent_notetrack_redirect");
    while (true) {
        notetracks = self waittill("animscripted");
        self notify(msg, notetracks);
        foreach (note in notetracks) {
            if (note == "end") {
                return;
            }
        }
    }
}

// Namespace notetrack / scripts/common/notetrack
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x363
// Size: 0x4b
function start_notetrack_wait(guy, anim_string, anime, animname, animation, var_173bdb8ba434651d) {
    guy notify("stop_sequencing_notetracks");
    thread notetrack_wait(guy, anim_string, self, anime, animname, animation, var_173bdb8ba434651d);
}

// Namespace notetrack / scripts/common/notetrack
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b5
// Size: 0x3ae
function notetrack_wait(guy, msg, tag_entity, anime, animname_override, animation, var_173bdb8ba434651d) {
    guy endon("stop_sequencing_notetracks");
    guy endon("death");
    if (istrue(var_173bdb8ba434651d)) {
        thread function_68c73b00bb25af3(guy, msg);
    }
    if (isdefined(tag_entity)) {
        tag_owner = tag_entity;
    } else {
        tag_owner = self;
    }
    animname = undefined;
    if (isdefined(animname_override)) {
        animname = animname_override;
    } else {
        animname = guy.animname;
    }
    var_966821fc90c3ca9d = spawnstruct();
    var_966821fc90c3ca9d.dialog = [];
    scripted_notetracks = [];
    if (isdefined(animname) && isdefined(level.scr_notetrack[animname]) && isdefined(anime)) {
        if (isdefined(level.scr_notetrack[animname][anime])) {
            scripted_notetracks[anime] = level.scr_notetrack[animname][anime];
        }
        if (isdefined(level.scr_notetrack[animname]["any"])) {
            scripted_notetracks["any"] = level.scr_notetrack[animname]["any"];
        }
    }
    foreach (var_2c62c57192ed45cb, _ in scripted_notetracks) {
        foreach (var_39b955b6ea2a96e in level.scr_notetrack[animname][var_2c62c57192ed45cb]) {
            foreach (scr_notetrack in var_39b955b6ea2a96e) {
                if (isdefined(scr_notetrack["dialog"])) {
                    var_966821fc90c3ca9d.dialog[scr_notetrack["dialog"]] = 1;
                }
            }
        }
    }
    var_1247cd0fbe324a41 = 0;
    var_a5fb509f15a76960 = 0;
    while (true) {
        var_966821fc90c3ca9d.dialoguenotetrack = 0;
        notetrack = undefined;
        if (!var_1247cd0fbe324a41 && isdefined(animname) && isdefined(anime)) {
            var_1247cd0fbe324a41 = 1;
            start_notetrack = undefined;
            var_a5fb509f15a76960 = isdefined(level.scr_notetrack[animname]) && isdefined(level.scr_notetrack[animname][anime]) && isdefined(level.scr_notetrack[animname][anime]["start"]);
            if (!var_a5fb509f15a76960) {
                continue;
            }
            notetracks = ["start"];
        } else {
            notetracks = guy waittill(msg);
        }
        if (!isarray(notetracks)) {
            notetracks = [notetracks];
        }
        guy printnotetracks(notetracks);
        validatenotetracks(msg, notetracks, animation);
        end = undefined;
        foreach (note in notetracks) {
            notetrack_handler(guy, anime, note, animname, scripted_notetracks, tag_owner, var_966821fc90c3ca9d);
            if (note == "end") {
                end = 1;
            }
        }
        if (isdefined(end)) {
            break;
        }
    }
    if (istrue(var_173bdb8ba434651d)) {
        guy notify("stop_agent_notetrack_redirect");
    }
}

// Namespace notetrack / scripts/common/notetrack
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x76a
// Size: 0xb
function function_e2bc0c9e826cf659() {
    thread function_392d5e426b4896d2();
}

// Namespace notetrack / scripts/common/notetrack
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77c
// Size: 0xb3
function function_392d5e426b4896d2() {
    self endon("entitydeleted");
    noteflag = "scriptable";
    while (true) {
        notetracks = self waittill(noteflag);
        printnotetracks(notetracks);
        validatenotetracks(noteflag, notetracks);
        end = undefined;
        foreach (note in notetracks) {
            notetrack_handler(self, undefined, note);
            if (note == "end") {
                end = 1;
            }
        }
        if (isdefined(end)) {
            break;
        }
    }
}

// Namespace notetrack / scripts/common/notetrack
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x836
// Size: 0x195
function notetrack_handler(guy, anime, notetrack, animname, scripted_notetracks, tag_owner, var_966821fc90c3ca9d) {
    /#
        if (getdvar(@"hash_6fe9ed215f6efcba") == "effect_looped") {
            guy thread animsound_tracker(anime, notetrack, animname);
        }
    #/
    if (notetrack == "end") {
        if (isdefined(anim.callbacks["EntityHandleNotetrackAnimEnd"])) {
            [[ anim.callbacks["EntityHandleNotetrackAnimEnd"] ]](guy, notetrack);
        }
        return 1;
    }
    if (isdefined(scripted_notetracks)) {
        foreach (var_2c62c57192ed45cb, _ in scripted_notetracks) {
            if (isdefined(level.scr_notetrack[animname][var_2c62c57192ed45cb][notetrack])) {
                foreach (scr_notetrack in level.scr_notetrack[animname][var_2c62c57192ed45cb][notetrack]) {
                    [[ anim.callbacks["AnimHandleNotetrack"] ]](scr_notetrack, guy, var_966821fc90c3ca9d, tag_owner);
                }
            }
        }
    }
    if (isdefined(anim.callbacks["EntityHandleNotetrack"])) {
        [[ anim.callbacks["EntityHandleNotetrack"] ]](guy, notetrack);
    }
}

// Namespace notetrack / scripts/common/notetrack
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d2
// Size: 0x2ed
function anim_handle_notetrack(scr_notetrack, guy, var_966821fc90c3ca9d, tag_owner) {
    if (isdefined(scr_notetrack["function"])) {
        self thread [[ scr_notetrack["function"] ]](guy);
    }
    if (isdefined(scr_notetrack["notify"])) {
        level notify(scr_notetrack["notify"]);
    }
    if (isdefined(scr_notetrack["attach model"])) {
        if (isdefined(scr_notetrack["selftag"])) {
            guy attach(scr_notetrack["attach model"], scr_notetrack["selftag"]);
            return;
        }
        tag_owner attach(scr_notetrack["attach model"], scr_notetrack["tag"]);
        return;
    }
    if (isdefined(scr_notetrack["detach model"])) {
        if (isdefined(scr_notetrack["selftag"])) {
            guy detach(scr_notetrack["detach model"], scr_notetrack["selftag"]);
        } else {
            tag_owner detach(scr_notetrack["detach model"], scr_notetrack["tag"]);
        }
    }
    if (!var_966821fc90c3ca9d.dialoguenotetrack) {
        if (isdefined(scr_notetrack["dialog"]) && isdefined(var_966821fc90c3ca9d.dialog[scr_notetrack["dialog"]])) {
            guy sayspecificdialogue(scr_notetrack["dialog"]);
            var_966821fc90c3ca9d.dialog[scr_notetrack["dialog"]] = undefined;
            var_966821fc90c3ca9d.dialoguenotetrack = 1;
        }
    }
    if (isdefined(scr_notetrack["create model"])) {
        anim_addmodel(guy, scr_notetrack);
    } else if (isdefined(scr_notetrack["delete model"])) {
        anim_removemodel(guy, scr_notetrack);
    }
    if (isdefined(scr_notetrack["selftag"])) {
        if (isdefined(scr_notetrack["effect"])) {
            level thread notetrack_effect(guy, scr_notetrack);
        }
        if (isdefined(scr_notetrack["stop_effect"])) {
            stopfxontag(level._effect[scr_notetrack["stop_effect"]], guy, scr_notetrack["selftag"]);
        }
        if (isdefined(scr_notetrack["swap_part_to_efx"])) {
            playfxontag(level._effect[scr_notetrack["swap_part_to_efx"]], guy, scr_notetrack["selftag"]);
            guy hidepart(scr_notetrack["selftag"]);
        }
        if (isdefined(scr_notetrack["trace_part_for_efx"])) {
            water_effect = undefined;
            effect = getfx(scr_notetrack["trace_part_for_efx"]);
            if (isdefined(scr_notetrack["trace_part_for_efx_water"])) {
                water_effect = getfx(scr_notetrack["trace_part_for_efx_water"]);
            }
            deletedepth = 0;
            if (isdefined(scr_notetrack["trace_part_for_efx_delete_depth"])) {
                deletedepth = scr_notetrack["trace_part_for_efx_delete_depth"];
            }
            guy thread trace_part_for_efx(scr_notetrack["selftag"], effect, water_effect, deletedepth);
        }
        if (isdefined(scr_notetrack["trace_part_for_efx_canceling"])) {
            guy thread trace_part_for_efx_cancel(scr_notetrack["selftag"]);
        }
    }
    if (isdefined(scr_notetrack["tag"]) && isdefined(scr_notetrack["effect"])) {
        playfxontag(level._effect[scr_notetrack["effect"]], tag_owner, scr_notetrack["tag"]);
    }
    if (isdefined(scr_notetrack["selftag"]) && isdefined(scr_notetrack["effect_looped"])) {
        playfxontag(level._effect[scr_notetrack["effect_looped"]], guy, scr_notetrack["selftag"]);
    }
}

// Namespace notetrack / scripts/common/notetrack
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc6
// Size: 0xd0
function anim_addmodel(guy, array) {
    if (!isdefined(guy.scriptmodel)) {
        guy.scriptmodel = [];
    }
    index = guy.scriptmodel.size;
    guy.scriptmodel[index] = spawn("script_model", (0, 0, 0));
    guy.scriptmodel[index] setmodel(array["create model"]);
    guy.scriptmodel[index].origin = guy gettagorigin(array["selftag"]);
    guy.scriptmodel[index].angles = guy gettagangles(array["selftag"]);
}

// Namespace notetrack / scripts/common/notetrack
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9d
// Size: 0x11c
function anim_removemodel(guy, array) {
    /#
        if (!isdefined(guy.scriptmodel)) {
            /#
                assertmsg("moreThanThreeHack" + guy.animname);
            #/
        }
    #/
    for (i = 0; i < guy.scriptmodel.size; i++) {
        if (isdefined(array["explosion"])) {
            forward = anglestoforward(guy.scriptmodel[i].angles);
            forward = forward * 120;
            forward = forward + guy.scriptmodel[i].origin;
            playfx(level._effect[array["explosion"]], guy.scriptmodel[i].origin);
            radiusdamage(guy.scriptmodel[i].origin, 350, 700, 50);
        }
        guy.scriptmodel[i] delete();
    }
}

// Namespace notetrack / scripts/common/notetrack
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec0
// Size: 0x66
function notetrack_effect(guy, scr_notetrack) {
    var_863c90262c71c1b7 = isdefined(scr_notetrack["moreThanThreeHack"]);
    if (var_863c90262c71c1b7) {
        lock("moreThanThreeHack");
    }
    playfxontag(level._effect[scr_notetrack["effect"]], guy, scr_notetrack["selftag"]);
    if (var_863c90262c71c1b7) {
        unlock("moreThanThreeHack");
    }
}

// Namespace notetrack / scripts/common/notetrack
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2d
// Size: 0x16
function trace_part_for_efx_cancel(part) {
    self notify("cancel_trace_for_part_" + part);
}

// Namespace notetrack / scripts/common/notetrack
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4a
// Size: 0x18b
function trace_part_for_efx(part, effect, water_effect, delete_depth) {
    lock_string = "trace_part_for_efx";
    self endon("cancel_trace_for_part_" + part);
    last_pos = self gettagorigin(part);
    hit_water = 0;
    struct = spawnstruct();
    struct.last_pos = self gettagorigin(part);
    struct.hit_surface = 0;
    struct.part = part;
    struct.hit_water = 0;
    struct.effect = effect;
    struct.stationary = 0;
    struct.last_motion_time = gettime();
    while (isdefined(self) && !struct.hit_surface) {
        lock(lock_string);
        test_trace_tag(struct);
        unlock_wait(lock_string);
        if (struct.stationary == 1 && gettime() - struct.last_motion_time > 3000) {
            return;
        }
    }
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(water_effect) && struct.hit_water) {
        effect = water_effect;
    }
    playfx(effect, struct.last_pos);
    if (delete_depth == 0) {
        self hidepart(part);
        return;
    }
    thread hidepartatdepth(struct.last_pos[2] - delete_depth, part);
}

// Namespace notetrack / scripts/common/notetrack
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10dc
// Size: 0x3b
function hidepartatdepth(depth, part) {
    self endon("entitydeleted");
    while (self gettagorigin(part)[2] > depth) {
        wait(0.05);
    }
    self hidepart(part);
}

// Namespace notetrack / scripts/common/notetrack
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111e
// Size: 0x387
function test_trace_tag(struct) {
    linecolor = undefined;
    if (!isdefined(self)) {
        return;
    }
    struct.current_pos = self gettagorigin(struct.part);
    if (struct.current_pos != struct.last_pos) {
        struct.last_motion_time = gettime();
        struct.stationary = 0;
        /#
            linecolor = (1, 1, 1);
        #/
        if (!scripts/engine/trace::_bullet_trace_passed(struct.last_pos, struct.current_pos, 0, self)) {
            trace = scripts/engine/trace::_bullet_trace(struct.last_pos, struct.current_pos, 0, self);
            if (trace["fraction"] < 1) {
                /#
                    linecolor = (1, 0, 0);
                #/
                struct.last_pos = trace["position"];
                struct.hit_water = trace["surfacetype"] == "water";
                /#
                    if (getdvarint(@"hash_b46df2b57cc019b") == 1) {
                        stringname = "<unknown string>";
                        foreach (key, value in level._effect) {
                            if (struct.effect != value) {
                                continue;
                            }
                            stringname = key;
                            break;
                        }
                        print3d(_add_z(struct.last_pos, 6), "<unknown string>" + struct.part, (1, 1, 1), 1, 1, 100);
                        print3d(struct.last_pos, "<unknown string>" + stringname, (1, 1, 1), 1, 1, 100);
                    }
                #/
                struct.hit_surface = 1;
                return;
            } else {
                /#
                    if (getdvarint(@"hash_b46df2b57cc019b") == 1) {
                        if (isdefined(trace["<unknown string>"])) {
                            print3d(_add_z(struct.last_pos, 6), "<unknown string>" + trace["<unknown string>"].classname, (0, 0, 1), 1, 1, 100);
                        }
                    }
                #/
            }
        }
        /#
            if (getdvarint(@"hash_b46df2b57cc019b") == 1) {
                line(struct.last_pos, struct.current_pos, linecolor, 1, 0, 60);
                sphere(struct.current_pos, 8, (0, 1, 0));
                print3d(_add_z(struct.last_pos, 6), struct.part, (0, 1, 0), 1, 1, 1);
            }
        #/
    } else {
        struct.stationary = 1;
        /#
            if (getdvarint(@"hash_b46df2b57cc019b") == 1) {
                print3d(struct.current_pos, "<unknown string>" + struct.part, (1, 0, 0));
            }
        #/
    }
    struct.last_pos = struct.current_pos;
}

// Namespace notetrack / scripts/common/notetrack
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14ac
// Size: 0x22
function _add_z(vec, zplus) {
    return (vec[0], vec[1], vec[2] + zplus);
}

// Namespace notetrack / scripts/common/notetrack
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d6
// Size: 0x120
function validatenotetracks(flagname, notes, animation) {
    /#
        if (isdefined(animation)) {
            /#
                assertex(notes.size <= 4, "<unknown string>" + notes.size + "<unknown string>" + function_3c8848a3a11b2553(getanimname(animation)));
            #/
        } else {
            /#
                assertex(notes.size <= 4, "<unknown string>" + notes.size + "<unknown string>" + flagname + "<unknown string>");
            #/
        }
        for (i = 0; i < notes.size; i++) {
            found = 0;
            for (j = i + 1; j < notes.size; j++) {
                if (notes[i] == notes[j]) {
                    found = 1;
                    if (isdefined(animation)) {
                        println("<unknown string>" + function_3c8848a3a11b2553(getanimname(animation)) + "<unknown string>" + flagname + "<unknown string>" + notes[i] + "<unknown string>");
                    } else {
                        println("<unknown string>" + flagname + "<unknown string>" + notes[i] + "<unknown string>");
                    }
                }
                if (found) {
                    break;
                }
            }
        }
        notes = undefined;
    #/
}

// Namespace notetrack / scripts/common/notetrack
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15fd
// Size: 0x98
function printnotetracks(notes) {
    /#
        if (getdvarint(@"hash_a19781010239d2e6") != 1 && getdvarint(@"hash_a19781010239d2e6") != self getentitynumber()) {
            return;
        }
        msg = notes[0];
        for (i = 1; i < notes.size; i++) {
            msg = msg + "<unknown string>" + notes[i];
        }
        println("<unknown string>" + gettime() + "<unknown string>" + self getentitynumber() + "<unknown string>" + msg);
    #/
}

// Namespace notetrack / scripts/common/notetrack
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x169c
// Size: 0x8b
function animsound_start_tracker(anime, animname) {
    add_to_animsound();
    newsound = spawnstruct();
    newsound.anime = anime;
    newsound.notetrack = "#" + anime;
    newsound.animname = animname;
    newsound.end_time = gettime() + 60000;
    if (animsound_exists(anime, newsound.notetrack)) {
        return;
    }
    add_animsound(newsound);
}

// Namespace notetrack / scripts/common/notetrack
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x172e
// Size: 0x98
function animsound_start_tracker_loop(anime, loop, animname) {
    add_to_animsound();
    anime = loop + anime;
    newsound = spawnstruct();
    newsound.anime = anime;
    newsound.notetrack = "#" + anime;
    newsound.animname = animname;
    newsound.end_time = gettime() + 60000;
    if (animsound_exists(anime, newsound.notetrack)) {
        return;
    }
    add_animsound(newsound);
}

// Namespace notetrack / scripts/common/notetrack
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x17cd
// Size: 0x96
function animsound_tracker(anime, notetrack, animname) {
    notetrack = tolower(notetrack);
    add_to_animsound();
    if (notetrack == "end") {
        return;
    }
    if (animsound_exists(anime, notetrack)) {
        return;
    }
    newtrack = spawnstruct();
    newtrack.anime = anime;
    newtrack.notetrack = notetrack;
    newtrack.animname = animname;
    newtrack.end_time = gettime() + 60000;
    add_animsound(newtrack);
}

// Namespace notetrack / scripts/common/notetrack
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186a
// Size: 0xb9
function animsound_exists(anime, notetrack) {
    notetrack = tolower(notetrack);
    keys = getarraykeys(self.animsounds);
    for (i = 0; i < keys.size; i++) {
        key = keys[i];
        if (self.animsounds[key].anime != anime) {
            continue;
        }
        if (self.animsounds[key].notetrack != notetrack) {
            continue;
        }
        self.animsounds[key].end_time = gettime() + 60000;
        return true;
    }
    return false;
}

// Namespace notetrack / scripts/common/notetrack
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192b
// Size: 0xf3
function add_animsound(newsound) {
    for (i = 0; i < level.animsound_hudlimit; i++) {
        if (isdefined(self.animsounds[i])) {
            continue;
        }
        self.animsounds[i] = newsound;
        return;
    }
    keys = getarraykeys(self.animsounds);
    index = keys[0];
    timer = self.animsounds[index].end_time;
    for (i = 1; i < keys.size; i++) {
        key = keys[i];
        if (self.animsounds[key].end_time < timer) {
            timer = self.animsounds[key].end_time;
            index = key;
        }
    }
    self.animsounds[index] = newsound;
}

// Namespace notetrack / scripts/common/notetrack
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a25
// Size: 0x78
function add_to_animsound() {
    if (!isdefined(self.animsounds)) {
        self.animsounds = [];
    }
    isinarray = 0;
    for (i = 0; i < level.animsounds.size; i++) {
        if (self == level.animsounds[i]) {
            isinarray = 1;
            break;
        }
    }
    if (!isinarray) {
        level.animsounds[level.animsounds.size] = self;
    }
}

// Namespace notetrack / scripts/common/notetrack
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa4
// Size: 0xac
function function_9ce792d127499205() {
    level endon("game_ended");
    while (true) {
        vmnotetracks = [];
        vmnotetracks = self waittill("vm_sv_note");
        if (vmnotetracks.size > 0) {
            foreach (notetrackinfo in vmnotetracks) {
                if (notetrackinfo.size > 0) {
                    notetrackname = notetrackinfo[1];
                    notetrackfunc = anim.notetracks[notetrackname];
                    if (isdefined(notetrackfunc)) {
                        [[ notetrackfunc ]](notetrackname, undefined, notetrackinfo);
                    }
                }
            }
        }
    }
}

