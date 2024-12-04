#using script_4b87f2871b6b025c;
#using script_575fda2758b0a36e;
#using scripts\anim\utility_common;
#using scripts\asm\asm;
#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\engine\sp\utility;
#using scripts\engine\sp\utility_code;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\sp\debug;
#using scripts\sp\endmission;
#using scripts\sp\equipment\tripwire;
#using scripts\sp\gameskill;
#using scripts\sp\player;
#using scripts\sp\utility;

#namespace autosave;

// Namespace autosave / scripts\sp\autosave
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x102d
// Size: 0x13f
function main() {
    if (!add_init_script("autosave", &main)) {
        return;
    }
    setdvarifuninitialized(@"hash_6af159684591cb79", "0");
    if (function_3cb5da19764baa3() == "T10") {
        setdvarifuninitialized(@"hash_1fbf179e197540f3", "0");
    } else {
        setdvarifuninitialized(@"hash_1fbf179e197540f3", "1");
    }
    level.autosave = spawnstruct();
    level.autosave.lastautosavetime = 0;
    flag_init("game_saving");
    flag_init("can_save");
    flag_set("can_save");
    flag_init("disable_autosaves");
    flag_init("ImmediateLevelStartSave");
    if (!isdefined(level.autosave.extra_autosave_checks)) {
        level.autosave.extra_autosave_checks = [];
    }
    level.autosave.proximity_threat_func = &autosave_proximity_threat_func;
    level.autosave.enemydistcheck = 1;
    /#
        thread cheat_save();
    #/
    beginningoflevelsave();
    startsavedprogression(level.script);
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1174
// Size: 0x18
function proggressionmismatchpopup(levelname) {
    setomnvar("progression_invalid", 1);
}

// Namespace autosave / scripts\sp\autosave
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1194
// Size: 0x6c
function cheat_save() {
    wait 2;
    level.player endon("death");
    setdvarifuninitialized(@"hash_6e05061c38987036", "0");
    while (true) {
        if (getdvarint(@"hash_6e05061c38987036") > 0) {
            setdvar(@"hash_6e05061c38987036", "0");
            autosave_by_name("cheat_save");
            wait 1;
        }
        wait 0.05;
    }
}

// Namespace autosave / scripts\sp\autosave
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1208
// Size: 0x7
function getdescription() {
    return %AUTOSAVE/AUTOSAVE;
}

// Namespace autosave / scripts\sp\autosave
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1218
// Size: 0x1c
function beginningoflevelsave() {
    if (is_trials_level()) {
        return;
    }
    thread immediatelevelstartsave();
    thread beginningoflevelsave_thread();
}

// Namespace autosave / scripts\sp\autosave
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x123c
// Size: 0x188
function immediatelevelstartsave() {
    servertime = scripts\sp\endmission::level_settle_time_get(level.script);
    if (!isdefined(servertime)) {
        servertime = 0;
    }
    servertime *= 0.05;
    var_fb3779574b08663b = scripts\sp\endmission::client_settle_time_get(level.script);
    if (!isdefined(var_fb3779574b08663b)) {
        var_fb3779574b08663b = 0;
    }
    var_fb3779574b08663b *= 0.001;
    wait var_fb3779574b08663b + servertime + 0.15;
    exit = 0;
    if (isdefined(level.credits_active)) {
        autosaveprint("immediateLevelStartSave() Credits are active", 0);
        exit = 1;
    } else if (level.missionfailed) {
        autosaveprint("immediateLevelStartSave() Mission Failed", 0);
        exit = 1;
    } else if (flag("game_saving")) {
        autosaveprint("immediateLevelStartSave() In the middle of another save, aborting", 0);
        exit = 1;
    }
    if (exit) {
        flag_set("ImmediateLevelStartSave");
        return;
    }
    flag_set("game_saving");
    if (!isalive(level.player)) {
        return;
    }
    imagename = "levelshots / autosave / autosave_" + level.script + "immediate_start";
    savegame("immediatelevelstart", %AUTOSAVE/LEVELSTART, imagename, 1);
    setdvar(@"hash_228e280524e6d278", "0");
    println("<dev string:x1c>");
    level.player setplayeryolostate(0);
    autosaveprint("immediateLevelStartSave() Saved", 1);
    flag_clear("game_saving");
    flag_set("ImmediateLevelStartSave");
}

// Namespace autosave / scripts\sp\autosave
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13cc
// Size: 0x15f
function beginningoflevelsave_thread() {
    if (isdefined(level.beginningoflevelsavedelay)) {
        wait level.beginningoflevelsavedelay;
    } else {
        wait 2;
    }
    if (isdefined(level.credits_active)) {
        autosaveprint("beginningOfLevelSave_thread() Credits are active", 0);
        return;
    }
    if (level.missionfailed) {
        autosaveprint("beginningOfLevelSave_thread() Mission failed", 0);
        return;
    }
    if (flag("game_saving")) {
        autosaveprint("beginningOfLevelSave_thread() In the middle of another save, aborting", 0);
        return;
    }
    if (!flag("ImmediateLevelStartSave")) {
        flag_wait("ImmediateLevelStartSave");
        wait 1;
    }
    flag_set("game_saving");
    imagename = "levelshots / autosave / autosave_" + level.script + "start";
    result = waitfortransientloading("beginningOfLevelSave_thread()");
    if (!isdefined(result)) {
        autosaveprint("beginningOfLevelSave_thread() a newer save was called...", 0);
        flag_clear("game_saving");
        return;
    }
    if (!isalive(level.player)) {
        return;
    }
    savegame("levelstart", %AUTOSAVE/LEVELSTART, imagename, 1);
    setdvar(@"hash_228e280524e6d278", "0");
    println("<dev string:x38>");
    level.player setplayeryolostate(0);
    autosaveprint("beginningOfLevelSave_thread() beginningOfLevelSave Saved", 1);
    flag_clear("game_saving");
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1533
// Size: 0x1a
function function_e96f7708c1775016(trigger) {
    trigger waittill("trigger");
    autosave_silent();
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1555
// Size: 0x1a
function trigger_autosave_stealth(trigger) {
    trigger waittill("trigger");
    autosave_stealth();
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1577
// Size: 0x1a
function trigger_autosave_tactical(trigger) {
    trigger waittill("trigger");
    autosave_tactical();
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1599
// Size: 0x14
function trigger_autosave(trigger) {
    thread function_806ee0c06769f6f(trigger);
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15b5
// Size: 0x6c
function function_806ee0c06769f6f(trigger) {
    trigger endon("death");
    wait 1;
    if (istrue(trigger.script_repeat)) {
        delay = 30;
        if (isdefined(trigger.script_delay)) {
            delay = trigger.script_delay;
        }
        while (true) {
            function_b55c93a657439f8a(trigger);
            wait delay;
        }
        return;
    }
    function_b55c93a657439f8a(trigger, 1);
}

// Namespace autosave / scripts\sp\autosave
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1629
// Size: 0x68
function function_b55c93a657439f8a(trigger, var_d8ec40ff894a8d81) {
    trigger waittill("trigger", other);
    name = undefined;
    if (isdefined(trigger.script_autosavename)) {
        name = trigger.script_autosavename;
    }
    scripts\engine\sp\utility::autosave_by_name(name);
    if (isdefined(trigger) && istrue(var_d8ec40ff894a8d81)) {
        trigger delete();
    }
}

// Namespace autosave / scripts\sp\autosave
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1699
// Size: 0x109
function autosaveprint(msg, type, var_57da6dcc2d8f10a9) {
    if (!getdvarint(@"hash_6af159684591cb79") && !getdvarint(@"hash_1fbf179e197540f3")) {
        return;
    }
    if (!isdefined(type)) {
        type = -1;
    }
    prefix = "^5AUTOSAVE";
    if (isdefined(var_57da6dcc2d8f10a9)) {
        prefix = prefix + "[" + var_57da6dcc2d8f10a9 + "]";
    }
    prefix += ":^7 ";
    if (type == 0) {
        msg = prefix + "^1[ FAILED    ] " + "^7" + msg;
    } else if (type == 1) {
        msg = prefix + "^2[ SUCCEEDED ] " + "^7" + msg;
    } else if (type == 2) {
        msg = prefix + "^7" + msg;
    } else {
        msg = prefix + msg;
    }
    if (type == 0 || type == 1 || type == 2) {
        thread autosave_hudprint(msg);
    }
    /#
        if (getdvarint(@"hash_6af159684591cb79")) {
            iprintln(msg);
            return;
        }
        println(msg);
    #/
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17aa
// Size: 0x268
function autosave_hudprint(msg) {
    version = getbuildversion();
    if (version == "SHIP") {
        return;
    }
    if (getdvarint(@"loc_warningsaserrors")) {
        return;
    }
    if (!getdvarint(@"hash_1fbf179e197540f3")) {
        return;
    }
    if (!isdefined(level.autosave.fail_huds)) {
        level.autosave.fail_huds = [];
    }
    if (level.autosave.fail_huds.size == 3) {
        var_de5aaabd1aecb05f = level.autosave.fail_huds[0];
        level.autosave.fail_huds = array_remove_index(level.autosave.fail_huds, 0);
        autosave_hudfail_update();
        var_de5aaabd1aecb05f thread autosave_hudfail_destroy();
    }
    hud = newhudelem();
    hud.elemtype = "font";
    hud.font = "default";
    hud.fontscale = 0.7;
    hud.width = 0;
    hud.height = int(8.4);
    hud.horzalign = "fullscreen";
    hud.vertalign = "fullscreen";
    index = level.autosave.fail_huds.size;
    level.autosave.fail_huds[index] = hud;
    hud.foreground = 1;
    hud.sort = 20;
    hud.x = 130;
    hud.y = 5 + index * 8.4;
    hud.label = msg;
    hud.alpha = 0;
    hud fadeovertime(0.2);
    hud.alpha = 1;
    hud endon("death");
    wait 5;
    level.autosave.fail_huds = array_remove(level.autosave.fail_huds, hud);
    autosave_hudfail_update();
    hud thread autosave_hudfail_destroy();
}

// Namespace autosave / scripts\sp\autosave
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a1a
// Size: 0x5d
function autosave_hudfail_destroy() {
    scale = 1;
    self endon("death");
    self fadeovertime(0.1);
    self moveovertime(0.1);
    self.y -= 8.4;
    self.alpha = 0;
    wait 0.2;
    self destroy();
}

// Namespace autosave / scripts\sp\autosave
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a7f
// Size: 0xa7
function autosave_hudfail_update() {
    level.autosave.fail_huds = array_removeundefined(level.autosave.fail_huds);
    foreach (hud in level.autosave.fail_huds) {
        hud moveovertime(0.1);
        hud.y = 5 + index * 12 * 0.7;
    }
}

// Namespace autosave / scripts\sp\autosave
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2e
// Size: 0x327
function _autosave_game_now(suppress_print, suppress_notify, var_bc910db033e0a289) {
    if (is_trials_level()) {
        return 0;
    }
    autosaveprint("_autosave_game_now() called...", 2);
    if (gettime() < 3300) {
        autosaveprint("_autosave_game_now() cannot save during before immediatelevelsave and beginningoflevelsave", 0);
        return;
    }
    if (isdefined(level.missionfailed) && level.missionfailed) {
        return 0;
    }
    if (!isdefined(suppress_notify) || !suppress_notify) {
        level notify("trying_new_autosave");
    }
    if (flag("game_saving")) {
        autosaveprint("_autosave_game_now() game_saving in progress, aborting...", 0);
        return 0;
    }
    flag_set("game_saving");
    result = waitfortransientloading("_autosave_game_now()");
    if (!isdefined(result)) {
        autosaveprint("_autosave_game_now() a newer save was called...", 0);
        flag_clear("game_saving");
        return 0;
    }
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (!isalive(player)) {
            return 0;
        }
    }
    filename = "save_now";
    var_aed6d94a7c103648 = getdescription();
    if (getdvarint(@"map_reloading") != 0) {
        autosaveprint("_autosave_game_now() Game is restarting", 0);
        return 0;
    }
    if (isdefined(level.nextmission)) {
        autosaveprint("_autosave_game_now() Game is going to next mission", 0);
        return 0;
    }
    if (isdefined(suppress_print)) {
        var_57da6dcc2d8f10a9 = savegamenocommit(filename, var_aed6d94a7c103648, "$default", 1);
    } else {
        var_57da6dcc2d8f10a9 = savegamenocommit(filename, var_aed6d94a7c103648);
    }
    autosaveprint("_autosave_game_now() Saving", undefined, var_57da6dcc2d8f10a9);
    wait 0.05;
    if (issaverecentlyloaded()) {
        autosaveprint("_autosave_game_now() Save recently loaded...", 0);
        level.autosave.lastautosavetime = gettime();
        flag_clear("game_saving");
        return 0;
    }
    if (isloadinganytransients()) {
        autosaveprint("_autosave_game_now() transient is loading, retrying (1)...", 0);
        flag_clear("game_saving");
        return 0;
    }
    if (var_57da6dcc2d8f10a9 < 0) {
        autosaveprint("_autosave_game_now() save error", 0, var_57da6dcc2d8f10a9);
        flag_clear("game_saving");
        return 0;
    }
    if (!try_to_autosave_now(var_57da6dcc2d8f10a9)) {
        flag_clear("game_saving");
        return 0;
    }
    assertex(!istrue(var_bc910db033e0a289) || level.script == "<dev string:x56>", "<dev string:x5d>");
    if (istrue(var_bc910db033e0a289) && level.script == "strike") {
    } else {
        wait 2;
    }
    flag_clear("game_saving");
    if (isloadinganytransients()) {
        autosaveprint("_autosave_game_now() transient is loading, retrying (2)...", 0);
        return 0;
    }
    if (!commitwouldbevalid(var_57da6dcc2d8f10a9)) {
        autosaveprint("_autosave_game_now() SaveGame is no longer valid, another save was run from elsewhere", 0, var_57da6dcc2d8f10a9);
        return 0;
    }
    if (try_to_autosave_now(var_57da6dcc2d8f10a9)) {
        autosaveprint("_autosave_game_now() committed", 1, var_57da6dcc2d8f10a9);
        commitsave(var_57da6dcc2d8f10a9);
        level.player setplayeryolostate(0);
        setdvar(@"hash_228e280524e6d278", "0");
        scripts\sp\gameskill::auto_adjust_save_committed();
    }
    return 1;
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5e
// Size: 0x1a
function autosave_now_trigger(trigger) {
    trigger waittill("trigger");
    autosave_now();
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e80
// Size: 0x4a
function try_to_autosave_now(var_57da6dcc2d8f10a9) {
    if (!issavesuccessful()) {
        return false;
    }
    if (!level.player autosavehealthcheck(var_57da6dcc2d8f10a9)) {
        return false;
    }
    if (!flag("can_save")) {
        autosaveprint("Can_save flag was clear", 0, var_57da6dcc2d8f10a9);
        return false;
    }
    return true;
}

// Namespace autosave / scripts\sp\autosave
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed3
// Size: 0x516
function tryautosave(name, description, image, timeout, var_f78389d2b10c1f26, suppress_print, var_7ee0e272b34faff) {
    if (is_trials_level()) {
        return 0;
    }
    if (!isdefined(level.var_93f4c5209aa8ebbe)) {
        level.var_93f4c5209aa8ebbe = 0;
    }
    autosaveprint("tryAutoSave() called name = " + name, 2);
    if (gettime() < 3300) {
        autosaveprint("tryAutoSave() cannot save during before immediatelevelsave and beginningoflevelsave", 0);
        return;
    }
    if (flag("disable_autosaves")) {
        autosaveprint("tryAutoSave() autosaves disabled", 0);
        return 0;
    }
    level endon("nextmission");
    level.player endon("death");
    if (flag("game_saving")) {
        autosaveprint("tryAutoSave() game_saving in progress, aborting...", 0);
        return 0;
    }
    level notify("trying_new_autosave");
    if (isdefined(level.nextmission)) {
        return 0;
    }
    time0 = 0.05;
    time1 = 1.25;
    time2 = 1.25;
    if (isdefined(timeout) && timeout < time0 + time1 + time2) {
        assertmsg("Warning, tried to do an autosave_or_timeout with a time less than " + time0 + time1 + time2 + " (the minimum time it takes to do autosave checks)");
    }
    if (!isdefined(suppress_print)) {
        suppress_print = 0;
    }
    if (!isdefined(image)) {
        image = "$default";
    }
    if (!isdefined(var_f78389d2b10c1f26)) {
        var_f78389d2b10c1f26 = 0;
    }
    flag_set("game_saving");
    var_aed6d94a7c103648 = getdescription();
    var_fd303234cc718d0b = gettime();
    timeout_time = undefined;
    if (isdefined(timeout)) {
        timeout_time = gettime() + timeout * 1000;
    }
    trycount = 0;
    result = 0;
    while (true) {
        if (flag("disable_autosaves")) {
            autosaveprint("tryAutoSave() autosaves disabled (2)", 0);
            break;
        }
        if (istrue(var_7ee0e272b34faff) && trycount > 0) {
            autosaveprint("tryAutoSave() Tried once and failed", 0);
            break;
        }
        if (isdefined(timeout_time) && gettime() > timeout_time) {
            autosaveprint("tryAutoSave() Autosave timed out after " + gettime() - var_fd303234cc718d0b + " milliseconds", 0);
            break;
        }
        trycount++;
        if (autosavecheck(undefined, var_f78389d2b10c1f26)) {
            waitfortransientloading("tryAutoSave()");
            if (getdvarint(@"map_reloading") != 0) {
                autosaveprint("tryAutoSave() Game is restarting", 0);
                break;
            }
            if (isdefined(level.nextmission)) {
                autosaveprint("tryAutoSave() Game is going to next mission", 0);
                break;
            }
            var_57da6dcc2d8f10a9 = savegamenocommit(level.var_93f4c5209aa8ebbe, var_aed6d94a7c103648, image, suppress_print);
            autosaveprint("tryAutoSave() Saving no commit", 2, var_57da6dcc2d8f10a9);
            if (var_57da6dcc2d8f10a9 < 0) {
                autosaveprint("tryAutoSave() save error", 0, var_57da6dcc2d8f10a9);
                break;
            }
            wait time0;
            if (isdefined(timeout_time) && gettime() > timeout_time) {
                autosaveprint("tryAutoSave() Autosave timed out after " + gettime() - var_fd303234cc718d0b + " milliseconds", 0);
                break;
            }
            if (issaverecentlyloaded()) {
                autosaveprint("tryAutoSave() Save recently loaded...", 0);
                level.autosave.lastautosavetime = gettime();
                break;
            }
            if (isloadinganytransients()) {
                autosaveprint("tryAutoSave() transient is loading, retrying (1)...", 0);
                continue;
            }
            wait time1;
            if (isdefined(timeout_time) && gettime() > timeout_time) {
                autosaveprint("tryAutoSave() Autosave timed out after " + gettime() - var_fd303234cc718d0b + " milliseconds", 0);
                break;
            }
            if (isloadinganytransients()) {
                autosaveprint("tryAutoSave() transient is loading, retrying (2)...", 0);
                continue;
            }
            if (extra_autosave_checks_failed(var_57da6dcc2d8f10a9)) {
                continue;
            }
            if (!autosavecheck(undefined, var_f78389d2b10c1f26, var_57da6dcc2d8f10a9)) {
                autosaveprint("tryAutoSave() SaveGame invalid: 1.25 second check failed", 0, var_57da6dcc2d8f10a9);
                continue;
            }
            wait time2;
            if (isdefined(timeout_time) && gettime() > timeout_time) {
                autosaveprint("tryAutoSave() Autosave timed out after " + gettime() - var_fd303234cc718d0b + " milliseconds", 0);
                break;
            }
            if (isloadinganytransients()) {
                autosaveprint("tryAutoSave() transient is loading, retrying (3)...", 0);
                continue;
            }
            if (!autosavecheck_not_picky(var_57da6dcc2d8f10a9)) {
                autosaveprint("tryAutoSave() SaveGame invalid: 2.5 second check failed", 0, var_57da6dcc2d8f10a9);
                continue;
            }
            if (!flag("can_save")) {
                autosaveprint("tryAutoSave() Can_save flag was clear", 0, var_57da6dcc2d8f10a9);
                break;
            }
            if (!commitwouldbevalid(var_57da6dcc2d8f10a9)) {
                autosaveprint("tryAutoSave() SaveGame is no longer valid, another save was run from elsewhere", 0, var_57da6dcc2d8f10a9);
                flag_clear("game_saving");
                return 0;
            }
            if (flag("disable_autosaves")) {
                autosaveprint("tryAutoSave() autosaves disabled (3)", 0);
                break;
            }
            result = 1;
            autosaveprint("tryAutoSave() committed", 1, var_57da6dcc2d8f10a9);
            commitsave(var_57da6dcc2d8f10a9);
            level.player setplayeryolostate(0);
            level.lastsavetime = gettime();
            setdvar(@"hash_228e280524e6d278", "0");
            scripts\sp\gameskill::auto_adjust_save_committed();
            break;
        }
        wait 0.25;
    }
    flag_clear("game_saving");
    if (isdefined(result) && result) {
        level.var_93f4c5209aa8ebbe++;
    }
    return result;
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23f2
// Size: 0x1f
function isprogressionlevel(levelname) {
    var_3012abbf8b098d0f = namespace_d6cca25f4b0ab62::getlevelindex(levelname);
    return isdefined(var_3012abbf8b098d0f);
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x241a
// Size: 0x92
function waitfortransientloading(prefix) {
    level endon("trying_new_autosave");
    var_6902d760014cf492 = 0;
    if (waspreloadzonesstarted()) {
        while (!ispreloadzonescomplete()) {
            if (gettime() > var_6902d760014cf492) {
                autosaveprint(prefix + " Waiting for Preload to complete...", undefined);
                var_6902d760014cf492 = gettime() + 2000;
            }
            wait 0.05;
        }
    }
    while (isloadinganytransients()) {
        if (gettime() > var_6902d760014cf492) {
            autosaveprint(prefix + " Waiting for transient to load...", undefined);
            var_6902d760014cf492 = gettime() + 2000;
        }
        wait 0.05;
    }
    return true;
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24b5
// Size: 0x8a
function extra_autosave_checks_failed(var_57da6dcc2d8f10a9) {
    foreach (func in level.autosave.extra_autosave_checks) {
        if (![[ func["func"] ]]()) {
            autosaveprint("Extra Autosave Check: " + func["msg"] + "", 0, var_57da6dcc2d8f10a9);
            return true;
        }
    }
    return false;
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2548
// Size: 0x14
function autosavecheck_not_picky(var_57da6dcc2d8f10a9) {
    return autosavecheck(0, 0, var_57da6dcc2d8f10a9);
}

// Namespace autosave / scripts\sp\autosave
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2565
// Size: 0x178
function autosavecheck(var_9a6be9e4b6d6b6d1, var_f78389d2b10c1f26, var_57da6dcc2d8f10a9) {
    if (isdefined(level.autosave_check_override)) {
        var_475e02596edf24af = spawnstruct();
        var_475e02596edf24af.var_9a6be9e4b6d6b6d1 = var_9a6be9e4b6d6b6d1;
        var_475e02596edf24af.var_f78389d2b10c1f26 = var_f78389d2b10c1f26;
        var_475e02596edf24af.var_57da6dcc2d8f10a9 = var_57da6dcc2d8f10a9;
        return [[ level.autosave_check_override ]](var_475e02596edf24af);
    }
    if (isdefined(level.special_autosavecondition) && ![[ level.special_autosavecondition ]]()) {
        autosaveprint("autoSaveCheck() special_autosavecondition failed", 0);
        return 0;
    }
    if (level.missionfailed) {
        return 0;
    }
    if (!isdefined(var_9a6be9e4b6d6b6d1)) {
        var_9a6be9e4b6d6b6d1 = level.dopickyautosavechecks;
    }
    if (!isdefined(var_f78389d2b10c1f26)) {
        var_f78389d2b10c1f26 = 0;
    }
    if (var_f78389d2b10c1f26) {
        if (![[ level.global_callbacks["_autosave_stealthcheck"] ]]()) {
            return 0;
        }
    }
    if (!level.player autosavehealthcheck(var_57da6dcc2d8f10a9)) {
        return 0;
    }
    if (var_9a6be9e4b6d6b6d1 && !level.player autosaveammocheck(var_57da6dcc2d8f10a9)) {
        return 0;
    }
    if (level.autosave_threat_check_enabled) {
        if (!autosavethreatcheck(var_9a6be9e4b6d6b6d1, var_57da6dcc2d8f10a9)) {
            return 0;
        }
    }
    if (!level.player autosaveplayercheck(var_9a6be9e4b6d6b6d1, var_57da6dcc2d8f10a9)) {
        return 0;
    }
    if (!level.player autosavefriendlyfirecheck(var_57da6dcc2d8f10a9)) {
        return 0;
    }
    if (level.player recentunresolvedcollision()) {
        return 0;
    }
    if (!issavesuccessful()) {
        autosaveprint("autoSaveCheck() save call was unsuccessful", 0, var_57da6dcc2d8f10a9);
        return 0;
    }
    return 1;
}

// Namespace autosave / scripts\sp\autosave
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x26e6
// Size: 0x16a
function autosaveplayercheck(var_9a6be9e4b6d6b6d1, var_57da6dcc2d8f10a9) {
    assert(isplayer(self));
    if (function_db03dec8d1dd5a3c()) {
        autosaveprint("player is outofbounds", 0, var_57da6dcc2d8f10a9);
        return false;
    }
    if (self ismeleeing() && var_9a6be9e4b6d6b6d1) {
        autosaveprint("player is meleeing", 0, var_57da6dcc2d8f10a9);
        return false;
    }
    if (istrue(self.in_melee_death)) {
        autosaveprint("player is in context melee", 0, var_57da6dcc2d8f10a9);
        return false;
    }
    if (!function_58929539ece45ce1()) {
        autosaveprint("player is throwing a grenade", 0, var_57da6dcc2d8f10a9);
        return false;
    }
    if (isdefined(self.shellshocked) && self.shellshocked) {
        autosaveprint("player is in shellshock", 0, var_57da6dcc2d8f10a9);
        return false;
    }
    if (isflashed()) {
        autosaveprint("player is flashbanged", 0, var_57da6dcc2d8f10a9);
        return false;
    }
    if (self isswimming()) {
        if (namespace_8ade6bdb04213c12::function_ea8199f09c110522()) {
            autosaveprint(" player's remaining breath is too low ", 0, var_57da6dcc2d8f10a9);
            return false;
        }
    } else if (!self islinked() && !self isonground()) {
        if (scripts\engine\trace::_bullet_trace_passed(level.player.origin + (0, 0, 5), level.player.origin + (0, 0, -200), 0, self)) {
            autosaveprint("player is too high off the ground", 0, var_57da6dcc2d8f10a9);
            return false;
        }
    }
    return true;
}

// Namespace autosave / scripts\sp\autosave
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2859
// Size: 0x15
function function_db03dec8d1dd5a3c() {
    if (getomnvar("ui_out_of_bounds_countdown") > 0) {
        return true;
    }
    return false;
}

// Namespace autosave / scripts\sp\autosave
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2877
// Size: 0x72
function function_58929539ece45ce1() {
    if (!self isthrowinggrenade()) {
        return true;
    }
    offhand = self getheldoffhand();
    switch (offhand.basename) {
    case #"hash_d675a16354a5298":
    case #"hash_10953bbdc9373206":
    case #"hash_22041fc502090af7":
    case #"hash_7983828e72e83a3e":
    case #"hash_cebe5cc9d61c966c":
        return true;
    }
    return false;
}

// Namespace autosave / scripts\sp\autosave
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28f2
// Size: 0x36
function recentunresolvedcollision() {
    currtime = gettime();
    if (isdefined(self.last_unresolved_collision_time) && currtime - self.last_unresolved_collision_time < 500) {
        return true;
    }
    return false;
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2931
// Size: 0x187
function autosavefriendlyfirecheck(var_57da6dcc2d8f10a9) {
    var_d85eabb77248e824 = getentarray("grenade", "classname");
    if (var_d85eabb77248e824.size == 0) {
        return true;
    }
    var_cfb65343cd42a773 = [];
    foreach (nade in var_d85eabb77248e824) {
        if (isvalidmissile(nade) && isplayer(getmissileowner(nade))) {
            var_cfb65343cd42a773[var_cfb65343cd42a773.size] = nade;
        }
    }
    if (var_cfb65343cd42a773.size == 0) {
        return true;
    }
    if (playernadessafe(var_cfb65343cd42a773)) {
        return true;
    }
    allies = getaiarray("allies");
    foreach (ally in allies) {
        foreach (var_8187d0f863f205b2 in var_cfb65343cd42a773) {
            if (distancesquared(ally.origin, var_8187d0f863f205b2.origin) < 6400) {
                autosaveprint("autoSaveFriendlyFireCheck() player nade is too close to friendlies", 0, var_57da6dcc2d8f10a9);
                return false;
            }
        }
    }
    return true;
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ac1
// Size: 0x5a
function playernadessafe(var_cfb65343cd42a773) {
    foreach (nade in var_cfb65343cd42a773) {
        if (offhand_is_dangerous(nade)) {
            return false;
        }
    }
    return true;
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b24
// Size: 0x1cd
function autosaveammocheck(var_57da6dcc2d8f10a9) {
    assert(isplayer(self));
    weapons = self getweaponslistprimaries();
    if (weapons.size == 0) {
        return true;
    }
    var_50e880f4569c48c8 = 1;
    var_113c8717236299bb = 0;
    classname = "";
    foreach (weapon in weapons) {
        if (isnullweapon(weapon)) {
            continue;
        }
        if (weaponmaxammo(weapon) > 0) {
            var_50e880f4569c48c8 = 0;
        }
        var_b422990d3a652911 = self getweaponammoclip(weapon);
        maxclip = weaponclipsize(weapon);
        var_f8b0919edf69149b = self getweaponammostock(weapon);
        maxstock = weaponmaxammo(weapon);
        var_38944f3d0f31df8d = var_b422990d3a652911 + var_f8b0919edf69149b;
        maxammo = maxclip + maxstock;
        if (maxammo <= 0) {
            continue;
        }
        var_ad2562e1db5353f1 = var_38944f3d0f31df8d / maxammo;
        var_baeaf1eebdb2a3de = 0.0714286;
        if (var_ad2562e1db5353f1 > var_113c8717236299bb) {
            var_113c8717236299bb = var_ad2562e1db5353f1;
            classname = weapon.classname;
            if (weapon.classname == "grenade" || weapon.classname == "rocketlauncher") {
                var_baeaf1eebdb2a3de = 0.5;
                classname = "explosive";
            }
        }
        if (var_ad2562e1db5353f1 >= var_baeaf1eebdb2a3de) {
            return true;
        }
    }
    if (var_50e880f4569c48c8) {
        return true;
    }
    autosaveprint("Highest stock+clip ammo fraction: " + var_113c8717236299bb + " for " + classname + " weapon. Too low to save.", 0, var_57da6dcc2d8f10a9);
    return false;
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cfa
// Size: 0x75
function autosavehealthcheck(var_57da6dcc2d8f10a9) {
    assert(isplayer(self));
    if (scripts\sp\player::belowcriticalhealththreshold()) {
        autosaveprint("player is below critical health threshold", 0, var_57da6dcc2d8f10a9);
        return false;
    }
    if (istrue(self.damage.firedamage)) {
        autosaveprint("player is on fire!", 0, var_57da6dcc2d8f10a9);
        return false;
    }
    if (self isonladder()) {
        autosaveprint("player is on ladder! TU1 HACK!", 0, var_57da6dcc2d8f10a9);
        return false;
    }
    return true;
}

// Namespace autosave / scripts\sp\autosave
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d78
// Size: 0x678
function autosavethreatcheck(var_9a6be9e4b6d6b6d1, var_57da6dcc2d8f10a9) {
    enemies = getaiunittypearray("bad_guys", "all");
    foreach (enemy in enemies) {
        if (isdefined(level.player.stealth) && isdefined(enemy.stealth) && enemy.threatsight && enemy getthreatsight(level.player) > 0) {
            autosaveprint("AI (" + enemy getentitynumber() + ") cansee player, stealth meter is up", 0, var_57da6dcc2d8f10a9);
            return false;
        }
        if (!isalive(enemy.enemy)) {
            continue;
        }
        if (!isplayer(enemy.enemy)) {
            if (level.autosave.enemydistcheck && enemy playermaybecomemyenemy()) {
                autosaveprint("Player close to AI's enemy", 0, var_57da6dcc2d8f10a9);
                /#
                    if (getdvarint(@"hash_6af159684591cb79")) {
                        enemy thread scripts\sp\debug::function_e31e954e5ae9ad1d("<dev string:x76>", (0, 0, 85), 0.8);
                    }
                #/
                return false;
            }
            continue;
        }
        if (enemy.in_melee && isdefined(enemy.meleetarget) && isplayer(enemy.meleetarget)) {
            autosaveprint("AI (" + enemy getentitynumber() + ") meleeing player", 0, var_57da6dcc2d8f10a9);
            return false;
        }
        proximity_threat = [[ level.autosave.proximity_threat_func ]](enemy);
        if (proximity_threat == "return_even_if_low_accuracy") {
            autosaveprint("AI (" + enemy getentitynumber() + ") too close to player, so close we're ignoring his accuracy", 0, var_57da6dcc2d8f10a9);
            return false;
        }
        if (enemy.baseaccuracy < 0.1) {
            /#
                if (getdvarint(@"hash_6af159684591cb79")) {
                    enemy thread scripts\sp\debug::function_e31e954e5ae9ad1d("<dev string:x8f>", (0, 0, 85), 0.8);
                }
            #/
            continue;
        }
        if (proximity_threat == "none") {
            /#
                if (getdvarint(@"hash_6af159684591cb79")) {
                    enemy thread scripts\sp\debug::function_e31e954e5ae9ad1d("<dev string:x98>", (0, 0, 85), 0.8, (0, 1, 0));
                }
            #/
            continue;
        }
        var_f01b5c5893e51e88 = undefined;
        shotrecently = enemy._blackboard.var_60dcaa3d3be97ab > gettime() - 1500;
        if (shotrecently) {
            var_f01b5c5893e51e88 = enemy getcanshootandsee();
            if (var_f01b5c5893e51e88) {
                /#
                    if (getdvarint(@"hash_6af159684591cb79")) {
                        enemy thread scripts\sp\debug::function_e31e954e5ae9ad1d("<dev string:xa0>", (0, 0, 85), 0.8, (1, 0, 0));
                    }
                #/
                autosaveprint("AI (" + enemy getentitynumber() + ") firing on player", 0, var_57da6dcc2d8f10a9);
                return false;
            }
        }
        if (!isdefined(var_f01b5c5893e51e88)) {
            var_f01b5c5893e51e88 = enemy getcanshootandsee();
        }
        if (var_f01b5c5893e51e88 && isdefined(enemy.var_a709fbd9fea148f6)) {
            if (enemy scripts\asm\asm::asm_currentstatehasflag(enemy.var_a709fbd9fea148f6, "aim")) {
                /#
                    if (getdvarint(@"hash_6af159684591cb79")) {
                        enemy thread scripts\sp\debug::function_e31e954e5ae9ad1d("<dev string:xb3>", (0, 0, 85), 0.8, (1, 0, 0));
                    }
                #/
                autosaveprint("AI (" + enemy getentitynumber() + ") aiming at player", 0, var_57da6dcc2d8f10a9);
                return false;
            } else if (enemy scripts\asm\asm::asm_currentstatehasflag(enemy.var_a709fbd9fea148f6, "notetrackaim")) {
                /#
                    if (getdvarint(@"hash_6af159684591cb79")) {
                        enemy thread scripts\sp\debug::function_e31e954e5ae9ad1d("<dev string:xca>", (0, 0, 85), 0.8, (1, 0, 0));
                    }
                #/
                autosaveprint("AI (" + enemy getentitynumber() + ") about to aim at player", 0, var_57da6dcc2d8f10a9);
                return false;
            }
        }
        /#
            if (getdvarint(@"hash_6af159684591cb79")) {
                enemy thread scripts\sp\debug::function_e31e954e5ae9ad1d("<dev string:xe7>", (0, 0, 85), 0.8, (0, 1, 0));
            }
        #/
    }
    if (scripts\sp\equipment\tripwire::playerintripwiredangerzone()) {
        autosaveprint("player in tripwire danager zone", 0);
        return false;
    }
    if (player_is_near_live_offhand(1)) {
        return false;
    }
    if (isdefined(level.phys_barrels)) {
        foreach (barrel in level.phys_barrels) {
            if (!isdefined(barrel.onfire)) {
                continue;
            }
            if (barrel.subtype == "antigrav") {
                continue;
            }
            if (distancesquared(barrel.origin, level.player.origin) < 122500) {
                autosaveprint(barrel.subtype + " barrel is onfire and too close to player", 0, var_57da6dcc2d8f10a9);
                return false;
            }
        }
    }
    vehicles = getentarray("scriptable", "code_classname");
    foreach (vehicle in vehicles) {
        if (!isdefined(vehicle.destructible_type) || vehicle.destructible_type != "vehicle") {
            continue;
        }
        if (!isdefined(vehicle.onfire)) {
            continue;
        }
        if (distancesquared(vehicle.origin, level.player.origin) < 160000) {
            autosaveprint("burning car too close to player", 0, var_57da6dcc2d8f10a9);
            return false;
        }
    }
    return true;
}

// Namespace autosave / scripts\sp\autosave
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33f9
// Size: 0xc3
function playermaybecomemyenemy() {
    if (self.enemy scripts\common\vehicle::isvehicle()) {
        return false;
    }
    if (distancesquared(self.enemy.origin, level.player.origin) < 4900) {
        return true;
    }
    if (self cansee(level.player)) {
        disttoenemy = distancesquared(self.enemy.origin, self.origin);
        disttoplayer = distancesquared(level.player.origin, self.origin);
        if (disttoplayer <= disttoenemy + 10000) {
            return true;
        }
    }
    return false;
}

// Namespace autosave / scripts\sp\autosave
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34c5
// Size: 0x14
function getcanshootandsee() {
    return scripts\anim\utility_common::canseeenemy(0) && self canshootenemy(0);
}

// Namespace autosave / scripts\sp\autosave
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34e2
// Size: 0xb3
function autosave_proximity_threat_func(enemy) {
    foreach (player in level.players) {
        dist = distancesquared(enemy.origin, player.origin);
        if (dist < 10000) {
            return "return_even_if_low_accuracy";
        }
        if (dist < 129600) {
            return "return";
        }
        if (dist < 1000000) {
            return "threat_exists";
        }
    }
    return "none";
}

/#

    // Namespace autosave / scripts\sp\autosave
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x359e
    // Size: 0x56
    function function_4574815d2a5a1376() {
        setdevdvarifuninitialized(@"hash_625a91d4e43b3929", 0);
        wait 1;
        adddebugcommand("<dev string:xf1>");
        while (true) {
            if (getdvarint(@"hash_625a91d4e43b3929", 0)) {
                setdvar(@"hash_625a91d4e43b3929", 0);
                thread autosave_now();
            }
            waitframe();
        }
    }

#/
