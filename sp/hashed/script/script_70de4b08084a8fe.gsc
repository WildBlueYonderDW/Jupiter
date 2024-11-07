#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility\player.gsc;
#using scripts\cp\utility\entity.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp\cp_debug.gsc;
#using script_70de4b08084a8fe;
#using scripts\engine\trace.gsc;
#using scripts\cp\cp_hostmigration.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_354c862768cfe202;
#using scripts\cp_mp\emp_debuff.gsc;

#namespace radar_scrambler;

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x595
// Size: 0x49
function function_5e22f6eb6e70e147(ent, ref) {
    ent.var_61e67dd981e04fa7 = ref;
    /#
        var_39cbc9721c434ec0 = getdvarint(@"hash_3b476633c9786299", 0);
        if (var_39cbc9721c434ec0) {
            function_718f576400d123ab(ent);
        }
    #/
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5e6
// Size: 0x16
function function_685226f608467ebc(ent) {
    ent.var_61e67dd981e04fa7 = undefined;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x604
// Size: 0x33
function function_1cbb16c6ba553df4(ref, callback) {
    struct = function_ba2c0913938c899c();
    struct.entercallbacks[ref] = callback;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x63f
// Size: 0x33
function function_6fc424055f4e95e8(ref, callback) {
    struct = function_ba2c0913938c899c();
    struct.exitcallbacks[ref] = callback;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x67a
// Size: 0x33
function function_f4f717f11d752bd6(ref, callback) {
    struct = function_ba2c0913938c899c();
    struct.outoftimecallbacks[ref] = callback;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6b5
// Size: 0x33
function function_b312d240cf7de0ab(ref, callback) {
    struct = function_ba2c0913938c899c();
    struct.clearcallbacks[ref] = callback;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6f0
// Size: 0x4e
function function_115a3eaee4810f76(ent, var_3e36f415f762070e) {
    if (function_9a757451ba80f667(ent)) {
        return false;
    }
    if (istrue(var_3e36f415f762070e) && function_9a757451ba80f667(ent)) {
        return false;
    }
    return isdefined(ent.var_5384d4a6c5cd21c6) && ent.var_5384d4a6c5cd21c6 > 0;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x747
// Size: 0x6d
function function_d064e7371ba358c1(ent) {
    if (!isdefined(ent.var_5384d4a6c5cd21c6)) {
        ent.var_5384d4a6c5cd21c6 = 0;
    }
    ent.var_5384d4a6c5cd21c6++;
    if (ent.var_5384d4a6c5cd21c6 == 1) {
        if (!isdefined(ent.var_1ac0aed2528825d4) || ent.var_1ac0aed2528825d4 <= 0) {
            function_b96aa092dca79d81(ent);
        }
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7bc
// Size: 0x16f
function function_8f7ba87b5415ac10(ent, var_d5c909837fd4deb4) {
    assertex(isdefined(ent.var_5384d4a6c5cd21c6), "disableradarScrambler called on an entity that was not in the Ai Region. ");
    if (!isdefined(ent.var_5384d4a6c5cd21c6)) {
        if (isdefined(ent)) {
            /#
                print3d(ent.origin + (0, 0, 50), "<dev string:x1c>" + ent getentitynumber() + "<dev string:x29>", (1, 1, 1), 1, 1, 666);
            #/
            ent hudoutlineenable("outline_cp_teleport_debug");
            iprintlnbold("ent vars:  script_suspend_group: ^1" + ent.script_suspend_group + "^5 script_suspend: ^1" + ent.script_suspend);
            /#
                line(ent.origin, ent.origin + (0, 0, 1000), (1, 0, 0), 1, 0, 666);
            #/
        }
    }
    if (!istrue(var_d5c909837fd4deb4)) {
        assertex(ent.var_5384d4a6c5cd21c6 > 0, "disableradarScrambler more times than enableradarScrambler.");
    }
    ent.var_5384d4a6c5cd21c6--;
    if (ent.var_5384d4a6c5cd21c6 == 0) {
        ent.var_5384d4a6c5cd21c6 = undefined;
        if (!isdefined(ent.var_1ac0aed2528825d4) || ent.var_1ac0aed2528825d4 <= 0) {
            function_dde838674be7ab8f(ent, 0);
        }
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x933
// Size: 0x28
function function_9a757451ba80f667(ent) {
    return isdefined(ent.var_1ac0aed2528825d4) && ent.var_1ac0aed2528825d4 > 0;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x964
// Size: 0x6d
function function_718f576400d123ab(ent) {
    if (!isdefined(ent.var_1ac0aed2528825d4)) {
        ent.var_1ac0aed2528825d4 = 0;
    }
    ent.var_1ac0aed2528825d4++;
    if (ent.var_1ac0aed2528825d4 == 1) {
        if (isdefined(ent.var_5384d4a6c5cd21c6) && ent.var_5384d4a6c5cd21c6 > 0) {
            function_dde838674be7ab8f(ent, 0);
        }
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9d9
// Size: 0x8f
function function_904c55fe002f0632(ent) {
    assertex(isdefined(ent.var_1ac0aed2528825d4), "disableradarScramblerImmunity called on an entity without Ai Region immunity.");
    assertex(ent.var_1ac0aed2528825d4 > 0, "disableradarScramblerImmunity more times than enableradarScramblerImmunity.");
    ent.var_1ac0aed2528825d4--;
    if (ent.var_1ac0aed2528825d4 == 0) {
        ent.var_1ac0aed2528825d4 = undefined;
        if (isdefined(ent.var_5384d4a6c5cd21c6) && ent.var_5384d4a6c5cd21c6 > 0) {
            function_b96aa092dca79d81(ent);
        }
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa70
// Size: 0x1d9
function function_9701c5af0ae46cd(ent, fromdeath) {
    ent notify("clear_radarScrambler");
    if (function_115a3eaee4810f76(ent, 1)) {
        function_dde838674be7ab8f(ent, fromdeath, 1);
    }
    clearcallback = undefined;
    if (isplayer(ent)) {
        clearcallback = &playerclearcallback;
    } else if (isagent(ent)) {
        clearcallback = &playerclearcallback;
    } else if (isdefined(ent.var_61e67dd981e04fa7)) {
        struct = function_ba2c0913938c899c();
        clearcallback = struct.clearcallbacks[ent.var_61e67dd981e04fa7];
    }
    if (isdefined(clearcallback)) {
        ent [[ clearcallback ]]();
    }
    ent.var_61e67dd981e04fa7 = undefined;
    ent.var_5384d4a6c5cd21c6 = undefined;
    ent.var_1ac0aed2528825d4 = undefined;
    ent.var_c0dca0d832b0fed6 = undefined;
    ent.var_cebd9d0b4638aeda = undefined;
    ent.var_7a3a633f3137ee = undefined;
    if (isdefined(ent.var_f676be7150162ca7)) {
        foreach (trigger in ent.var_f676be7150162ca7) {
            trigger.entstouching[ent getentitynumber()] = undefined;
        }
        ent.var_f676be7150162ca7 = undefined;
    }
    if (isdefined(ent.var_540861e2af03a290)) {
        foreach (trigger in ent.var_540861e2af03a290) {
            trigger.entstouching[ent getentitynumber()] = undefined;
        }
        ent.var_540861e2af03a290 = undefined;
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc51
// Size: 0x85
function function_9ecb03c3e2b1a959() {
    if (istrue(self.allowedintrigger)) {
        return false;
    }
    if (!isdefined(level.var_f676be7150162ca7)) {
        return false;
    }
    foreach (trigger in level.var_f676be7150162ca7) {
        if (!function_7b13ee86bdaaeba(trigger, self)) {
            continue;
        }
        if (self istouching(trigger)) {
            return true;
        }
    }
    return false;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcdf
// Size: 0xb8
function function_29955ef665e7793d(var_863c619037f3ac74, var_da8cec9bce12f9cb) {
    var_85aa6256b13776ad = 0;
    if (!isdefined(level.var_f676be7150162ca7)) {
        return var_85aa6256b13776ad;
    } else {
        foreach (trigger in level.var_f676be7150162ca7) {
            if (ispointinvolume(var_863c619037f3ac74, trigger)) {
                if (isdefined(trigger.script_team) && isdefined(var_da8cec9bce12f9cb) && trigger.script_team != var_da8cec9bce12f9cb) {
                    continue;
                }
                var_85aa6256b13776ad = 1;
                break;
            }
        }
    }
    return var_85aa6256b13776ad;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xda0
// Size: 0x60
function function_44a315340c86e09(point, circlecenter, circleradius) {
    x = point[0];
    y = point[1];
    if ((x - circlecenter[0]) * (x - circlecenter[0]) + (y - circlecenter[1]) * (y - circlecenter[1]) <= circleradius * circleradius) {
        return 1;
    }
    return 0;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe08
// Size: 0xb7
function function_d86f905b2efc08b9() {
    /#
        create_func_ref("<dev string:x74>", &scripts\cp\cp_debug::draw_spawner);
    #/
    level.overwatch_emp_low = 0.8;
    level.overwatch_emp_high = 1.2;
    level.overwatch_emp_free = 5;
    if (!flag_exist("radar_scramblers_initialized")) {
        flag_init("radar_scramblers_initialized");
    }
    if (!flag_exist("ready_for_region_spawning")) {
        flag_init("ready_for_region_spawning");
    }
    if (!isdefined(level.var_f676be7150162ca7)) {
        level.var_f676be7150162ca7 = [];
    }
    level.var_f676be7150162ca7 = array_combine(level.var_f676be7150162ca7, getentarray("radar_scrambler", "targetname"));
    thread function_60ec8aa27cc049e6();
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xec7
// Size: 0x87
function function_a8000c9cbf395db1() {
    if (!flag_exist("level_ready_for_script")) {
        flag_init("level_ready_for_script");
    }
    flag_wait("level_ready_for_script");
    if (isdefined(level.var_fc46cd90f0a40c87)) {
        [[ level.var_fc46cd90f0a40c87 ]]();
    }
    if (!isdefined(level.var_f676be7150162ca7)) {
        level.var_f676be7150162ca7 = [];
    }
    level.var_f676be7150162ca7 = array_combine(level.var_f676be7150162ca7, getentarray("radar_scrambler", "targetname"));
    thread function_60ec8aa27cc049e6();
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf56
// Size: 0x170
function function_b96aa092dca79d81(ent) {
    entercallback = undefined;
    trigger = function_3d92e694ec2d0078(ent);
    triggertype = gettriggertype(ent, trigger);
    if (isplayer(ent)) {
        entercallback = &playerentercallback;
    } else if (isagent(ent)) {
        entercallback = &function_b2a14335ecf202f8;
    } else if (isdefined(ent.var_61e67dd981e04fa7)) {
        struct = function_ba2c0913938c899c();
        entercallback = struct.entercallbacks[ent.var_61e67dd981e04fa7];
    }
    ent notify("radarScrambler_cooldown_end");
    if (isdefined(ent.var_c0dca0d832b0fed6) && previouslytouchedtriggertype(ent, triggertype)) {
        var_24ab8327af3f90df = ent.var_c0dca0d832b0fed6 / 1000;
        ent.var_cebd9d0b4638aeda = int(gettime() + ent.var_c0dca0d832b0fed6);
        ent.var_c0dca0d832b0fed6 = undefined;
        thread function_c9da074c99cdad85(ent, var_24ab8327af3f90df);
    } else {
        ent.var_c0dca0d832b0fed6 = undefined;
        ent.var_7a3a633f3137ee = triggertype;
        var_24ab8327af3f90df = function_11982fa04c4ade15(triggertype);
        ent.var_cebd9d0b4638aeda = int(gettime() + var_24ab8327af3f90df * 1000);
        thread function_c9da074c99cdad85(ent, var_24ab8327af3f90df);
    }
    if (isdefined(entercallback)) {
        ent thread [[ entercallback ]]("exit_radarScrambler", "clear_radarScrambler", triggertype, trigger);
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10ce
// Size: 0x139
function function_dde838674be7ab8f(ent, fromdeath, fromclear) {
    ent notify("exit_radarScrambler");
    exitcallback = undefined;
    if (isplayer(ent)) {
        exitcallback = &playerexitcallback;
    } else if (isagent(ent)) {
        exitcallback = &function_d405dee230e91b4;
    } else if (isdefined(ent.var_61e67dd981e04fa7)) {
        struct = function_ba2c0913938c899c();
        exitcallback = struct.exitcallbacks[ent.var_61e67dd981e04fa7];
    }
    ent notify("radarScrambler_timeout_end");
    if (!istrue(fromclear)) {
        if (isdefined(ent.var_cebd9d0b4638aeda)) {
            ent.var_c0dca0d832b0fed6 = int(max(0, ent.var_cebd9d0b4638aeda - gettime()));
            ent.var_cebd9d0b4638aeda = undefined;
            trigger = function_3d92e694ec2d0078(ent);
            triggertype = gettriggertype(ent, trigger);
            cooldowntime = getcooldowntime(triggertype);
            thread function_e209a39163f0883a(ent, cooldowntime);
        }
    }
    if (isdefined(exitcallback)) {
        ent thread [[ exitcallback ]](fromdeath, fromclear, "clear_radarScrambler");
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x120f
// Size: 0xa4
function function_42daab738a799575(ent) {
    var_106b10573bdeadf0 = undefined;
    if (isplayer(ent)) {
        var_775c9a68f9c00019 = 1;
        if (var_775c9a68f9c00019) {
            var_106b10573bdeadf0 = &playeroutoftimecallback;
        }
    } else if (isagent(ent)) {
        var_775c9a68f9c00019 = 1;
        if (var_775c9a68f9c00019) {
            var_106b10573bdeadf0 = &playeroutoftimecallback;
        }
    } else if (isdefined(ent.var_61e67dd981e04fa7)) {
        struct = function_ba2c0913938c899c();
        var_106b10573bdeadf0 = struct.outoftimecallbacks[ent.var_61e67dd981e04fa7];
    }
    if (isdefined(var_106b10573bdeadf0)) {
        ent thread [[ var_106b10573bdeadf0 ]]("radarScrambler_timeout_end", "clear_radarScrambler");
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12bb
// Size: 0x4e
function function_c9da074c99cdad85(ent, timeleft) {
    if (isplayer(ent) || isagent(ent)) {
        ent endon("death");
    }
    ent notify("radarScrambler_timeout_end");
    ent endon("radarScrambler_timeout_end");
    ent endon("clear_radarScrambler");
    wait timeleft;
    thread function_42daab738a799575(ent);
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1311
// Size: 0x5b
function function_e209a39163f0883a(ent, timeleft) {
    if (isplayer(ent) || isagent(ent)) {
        ent endon("death");
    }
    ent notify("radarScrambler_cooldown_end");
    ent endon("radarScrambler_cooldown_end");
    ent endon("clear_radarScrambler");
    wait timeleft;
    ent.var_c0dca0d832b0fed6 = undefined;
    ent.var_7a3a633f3137ee = undefined;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1374
// Size: 0x65
function playerentercallback(exitnotify, clearnotify, triggertype, trigger) {
    var_3a44172702973ab6 = 1;
    if (isdefined(triggertype) && triggertype == "restricted") {
        var_3a44172702973ab6 = 2;
    }
    self.var_a67651c67e18c594 = trigger;
    /#
        self iprintln("<dev string:x81>");
    #/
    namespace_4f38e357ab5494ec::emp_effects_flickering(self);
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x13e1
// Size: 0x56
function function_b2a14335ecf202f8(exitnotify, clearnotify, triggertype, trigger) {
    var_3a44172702973ab6 = 1;
    if (isdefined(triggertype) && triggertype == "restricted") {
        var_3a44172702973ab6 = 2;
    }
    function_86afcfb8eb7bf0d2(trigger);
    self.var_a67651c67e18c594 = trigger;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x143f
// Size: 0x3c
function playerexitcallback(fromdeath, fromclear, clearnotify) {
    self.var_a67651c67e18c594 = undefined;
    /#
        self iprintln("<dev string:xaa>");
    #/
    namespace_4f38e357ab5494ec::function_11011e6292a21c15(self);
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1483
// Size: 0x2c
function function_d405dee230e91b4(fromdeath, fromclear, clearnotify) {
    self.var_a67651c67e18c594 = undefined;
    function_d55ed59c0ce164d3();
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14b7
// Size: 0x38
function playeroutoftimecallback(timeoutendnotify, clearnotify) {
    trigger = function_3d92e694ec2d0078(self);
    triggertype = gettriggertype(self, trigger);
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14f7
// Size: 0xb
function playerclearcallback(clearnotify) {
    
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x150a
// Size: 0xe6
function playeroutoftimeminefield(timeoutendnotify, clearnotify) {
    minespawnpos = self.origin;
    minetrace = scripts\engine\trace::ray_trace(self.origin, self.origin - (0, 0, 1000), self);
    if (isdefined(minetrace["hittype"] != "hittype_none") && isdefined(minetrace["position"])) {
        minespawnpos = minetrace["position"];
    }
    mine = spawn("script_model", minespawnpos);
    mine setmodel("ks_minefield_mp");
    mine setentityowner(self);
    mine setotherent(self);
    mine setscriptablepartstate("warning_click", "on", 0);
    mineexploded = playeroutoftimeminefieldinternal(mine, timeoutendnotify, clearnotify);
    if (istrue(mineexploded)) {
        wait 2;
    }
    mine delete();
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15f8
// Size: 0x77
function playeroutoftimeminefieldinternal(mine, timeoutendnotify, clearnotify) {
    self endon("death_or_disconnect");
    if (isdefined(timeoutendnotify)) {
        self endon(timeoutendnotify);
    }
    if (isdefined(clearnotify)) {
        self endon(clearnotify);
    }
    scripts\cp\cp_hostmigration::waitlongdurationwithhostmigrationpause(0.3);
    mine setscriptablepartstate("explosion", "on", 0);
    wait 0.05;
    self dodamage(2000, self.origin, self, mine, "MOD_EXPLOSIVE", "minefield_mp");
    return true;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1678
// Size: 0xbb
function killstreakentercallback(exitnotify, clearnotify, triggertype, trigger) {
    var_3a44172702973ab6 = 1;
    if (islargemap() && level.gametype == "arm" && isdefined(triggertype) && triggertype == "restricted") {
        var_3a44172702973ab6 = 2;
    }
    if (isdefined(self.owner)) {
        if (isplayer(self.owner)) {
            self.owner playerentercallback(exitnotify, clearnotify, triggertype, trigger);
            return;
        }
        if (isagent(self.owner)) {
            self.owner function_b2a14335ecf202f8(exitnotify, clearnotify, triggertype, trigger);
        }
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x173b
// Size: 0x73
function killstreakexitcallback(fromdeath, fromclear, clearnotify) {
    if (isdefined(self.owner)) {
        if (isplayer(self.owner)) {
            self.owner playerexitcallback(fromdeath, fromclear, clearnotify);
            return;
        }
        if (isagent(self.owner)) {
            self.owner function_d405dee230e91b4(fromdeath, fromclear, clearnotify);
        }
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17b6
// Size: 0x13
function killstreakoutoftimecallback(timeoutendnotify, clearnotify) {
    
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17d1
// Size: 0x54
function killstreakclearcallback() {
    if (isdefined(self.owner)) {
        if (isplayer(self.owner)) {
            self.owner playerclearcallback();
            return;
        }
        if (isagent(self.owner)) {
            self.owner playerclearcallback();
        }
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x182d
// Size: 0x46
function function_831c13bfee564637() {
    function_1cbb16c6ba553df4("killstreak", &killstreakentercallback);
    function_6fc424055f4e95e8("killstreak", &killstreakexitcallback);
    function_f4f717f11d752bd6("killstreak", &killstreakoutoftimecallback);
    function_b312d240cf7de0ab("killstreak", &killstreakclearcallback);
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x187b
// Size: 0xcf
function function_60ec8aa27cc049e6() {
    var_20533273f43dd4e2 = [];
    if (isdefined(level.var_f676be7150162ca7)) {
        flag_set("radar_scramblers_initialized");
        foreach (trigger in level.var_f676be7150162ca7) {
            thread watchradarScramblerTrigger(trigger);
        }
        if (isdefined(level.var_c03cdc5f3ad34ee0)) {
            foreach (trigger in level.var_c03cdc5f3ad34ee0) {
                thread watchradarScramblerSuppressionTrigger(trigger);
            }
        }
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1952
// Size: 0x9f
function watchradarScramblerTrigger(trigger) {
    trigger notify("watchradarScramblerTrigger");
    trigger endon("watchradarScramblerTrigger");
    trigger.entstouching = [];
    if (isdefined(trigger.target)) {
        trigger.var_3efe1b3a9ef1aba0 = getent(trigger.target, "targetname");
        trigger.var_3efe1b3a9ef1aba0.var_281086936687228a = trigger;
        trigger.var_3efe1b3a9ef1aba0 thread namespace_4f38e357ab5494ec::function_e849523551c4f041();
    }
    scripts\mp\flags::gameflagwait("prematch_done");
    thread watchradarScramblerTriggerExit(trigger);
    thread watchradarScramblerTriggerEnter(trigger);
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19f9
// Size: 0x83
function watchradarScramblerTriggerEnter(trigger) {
    level endon("game_ended");
    trigger notify("watchradarScramblerTriggerEnter");
    trigger endon("watchradarScramblerTriggerEnter");
    trigger endon("death");
    while (true) {
        trigger waittill("trigger", ent);
        if (isplayer(ent) && isdefined(ent.c130)) {
            continue;
        }
        if (!function_7b13ee86bdaaeba(trigger, ent)) {
            continue;
        }
        if (!function_2e7a2d85639052ea(ent)) {
            continue;
        }
        function_1916e100f11c7787(trigger, ent);
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a84
// Size: 0xb3
function watchradarScramblerTriggerExit(trigger) {
    level endon("game_ended");
    trigger notify("watchradarScramblerTriggerExit");
    trigger endon("watchradarScramblerTriggerExit");
    trigger endon("death");
    while (true) {
        temparr = trigger.entstouching;
        foreach (ent in temparr) {
            if (!isdefined(ent)) {
                trigger.entstouching[id] = undefined;
            }
            if (isdefined(ent) && !trigger istouching(ent)) {
                function_45efa9bc7f471ef1(trigger, ent);
            }
        }
        waitframe();
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b3f
// Size: 0xd9
function function_1916e100f11c7787(trigger, ent) {
    entnum = ent getentitynumber();
    if (isdefined(trigger.entstouching[entnum])) {
        return;
    }
    trigger.entstouching[entnum] = ent;
    if (!isdefined(ent.var_f676be7150162ca7)) {
        ent.var_f676be7150162ca7 = [];
    }
    temparr = [trigger];
    foreach (var_530e3190cc4e3fce in ent.var_f676be7150162ca7) {
        temparr[temparr.size] = var_530e3190cc4e3fce;
    }
    ent.var_f676be7150162ca7 = temparr;
    function_d064e7371ba358c1(ent);
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c20
// Size: 0x8a
function function_45efa9bc7f471ef1(trigger, ent) {
    entnum = ent getentitynumber();
    trigger.entstouching[entnum] = undefined;
    function_8f7ba87b5415ac10(ent);
    ent notify("clean_up_exit_threads");
    if (isdefined(ent.var_f676be7150162ca7)) {
        ent.var_f676be7150162ca7 = array_remove(ent.var_f676be7150162ca7, trigger);
        if (ent.var_f676be7150162ca7.size == 0) {
            ent.var_f676be7150162ca7 = undefined;
        }
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb2
// Size: 0x45
function watchradarScramblerSuppressionTrigger(trigger) {
    trigger notify("watchradarScramblerSuppressionTrigger");
    trigger endon("watchradarScramblerSuppressionTrigger");
    trigger.entstouching = [];
    scripts\mp\flags::gameflagwait("prematch_done");
    thread watchradarScramblerSuppressionTriggerExit(trigger);
    thread watchradarScramblerSupressionTriggerEnter(trigger);
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cff
// Size: 0x59
function watchradarScramblerSupressionTriggerEnter(trigger) {
    level endon("game_ended");
    trigger notify("watchradarScramblerSupressionTriggerEnter");
    trigger endon("watchradarScramblerSupressionTriggerEnter");
    trigger endon("death");
    while (true) {
        trigger waittill("trigger", ent);
        if (!function_2e7a2d85639052ea(ent)) {
            continue;
        }
        function_1d37828868e98950(trigger, ent);
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d60
// Size: 0xb8
function watchradarScramblerSuppressionTriggerExit(trigger) {
    level endon("game_ended");
    trigger notify("watchradarScramblerSuppressionTriggerExit");
    trigger endon("watchradarScramblerSuppressionTriggerExit");
    trigger endon("death");
    while (true) {
        temparr = trigger.entstouching;
        if (isdefined(temparr)) {
            foreach (ent in temparr) {
                if (!isdefined(ent)) {
                    trigger.entstouching[id] = undefined;
                }
                if (isdefined(ent) && !trigger istouching(ent)) {
                    function_2aad14c8236ac768(trigger, ent);
                }
            }
        }
        waitframe();
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e20
// Size: 0xd9
function function_1d37828868e98950(trigger, ent) {
    entnum = ent getentitynumber();
    if (isdefined(trigger.entstouching[entnum])) {
        return;
    }
    trigger.entstouching[entnum] = ent;
    if (!isdefined(ent.var_540861e2af03a290)) {
        ent.var_540861e2af03a290 = [];
    }
    temparr = [trigger];
    foreach (var_78a0318de6e1e56f in ent.var_540861e2af03a290) {
        temparr[temparr.size] = var_78a0318de6e1e56f;
    }
    ent.var_540861e2af03a290 = temparr;
    function_718f576400d123ab(ent);
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f01
// Size: 0x67
function function_2aad14c8236ac768(trigger, ent) {
    entnum = ent getentitynumber();
    trigger.entstouching[entnum] = undefined;
    ent.var_540861e2af03a290[trigger getentitynumber()] = undefined;
    if (ent.var_540861e2af03a290.size == 0) {
        ent.var_540861e2af03a290 = undefined;
    }
    function_904c55fe002f0632(ent);
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f70
// Size: 0x15d
function function_7b13ee86bdaaeba(trigger, ent) {
    if (isdefined(trigger.script_team)) {
        isvehicle = 0;
        if (ent scripts\cp_mp\vehicles\vehicle::isvehicle()) {
            isvehicle = 1;
        }
        if (isvehicle) {
            if (isvehicle && isdefined(ent.team) && ent.team != "neutral" && ent.team != trigger.script_team) {
                return false;
            }
            if (isvehicle && isdefined(ent.owner) && ent.owner.team != trigger.script_team) {
                return false;
            }
            if (isvehicle && isdefined(ent.occupants)) {
                foreach (occupant in ent.occupants) {
                    if (occupant.team != trigger.script_team) {
                        return false;
                    }
                }
            }
        } else if (ent.team != trigger.script_team) {
            return false;
        }
    }
    return true;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20d6
// Size: 0x8d
function function_2e7a2d85639052ea(ent) {
    if (isdefined(ent)) {
        if (isplayer(ent) || isagent(ent)) {
            if (ent scripts\cp_mp\utility\player_utility::_isalive()) {
                return true;
            }
        }
        if (isdefined(ent.var_61e67dd981e04fa7)) {
            if (ent scripts\cp_mp\vehicles\vehicle::isvehicle()) {
                if (!istrue(ent.isdestroyed)) {
                    return true;
                }
            }
            if (isdefined(ent.streakinfo) && function_a8c8f4079a8961f5(ent.streakinfo.streakname)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x216c
// Size: 0x61
function function_ba2c0913938c899c() {
    struct = level.var_918019b3bb20e3c6;
    if (!isdefined(struct)) {
        struct = spawnstruct();
        struct.entercallbacks = [];
        struct.exitcallbacks = [];
        struct.outoftimecallbacks = [];
        struct.clearcallbacks = [];
        level.var_918019b3bb20e3c6 = struct;
    }
    return struct;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21d6
// Size: 0x40
function function_a8c8f4079a8961f5(streakname) {
    var_1990e52ab5821aa7 = 0;
    switch (streakname) {
    case #"hash_cf0ef5bef19a311b":
    case #"hash_e40585107590f016":
        var_1990e52ab5821aa7 = 1;
        break;
    }
    return var_1990e52ab5821aa7;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x221f
// Size: 0xb0
function gettriggertype(ent, trigger) {
    triggertype = "default";
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return "br";
    }
    if (isdefined(trigger) && isdefined(trigger.script_team)) {
        return "restricted";
    }
    if (isdefined(ent) && ent scripts\cp_mp\vehicles\vehicle::isvehicle()) {
        return "default";
    }
    if (isdefined(ent) && isdefined(ent.streakinfo)) {
        return "default";
    }
    if (isdefined(trigger) && isdefined(trigger.script_noteworthy) && trigger.script_noteworthy == "MineField") {
        triggertype = "minefield";
    }
    return triggertype;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22d8
// Size: 0x4d
function getcooldowntime(triggertype) {
    switch (triggertype) {
    case #"hash_18ad1d5da2e56d4c":
    case #"hash_6b15362474c2e2b2":
    case #"hash_7038dec66d8275be":
    case #"hash_fa21c4f6bd5e3815":
        return function_11982fa04c4ade15(triggertype);
    }
    return undefined;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x232e
// Size: 0x4c
function function_11982fa04c4ade15(triggertype) {
    switch (triggertype) {
    case #"hash_18ad1d5da2e56d4c":
    case #"hash_6b15362474c2e2b2":
    case #"hash_7038dec66d8275be":
    case #"hash_fa21c4f6bd5e3815":
        return function_f301b665c2864e7d();
    }
    return undefined;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2383
// Size: 0x58
function function_f301b665c2864e7d() {
    /#
        return max(0, getdvarfloat(@"hash_9c25e05a8010d645", 3));
    #/
    var_24ab8327af3f90df = level.var_24ab8327af3f90df;
    if (!isdefined(var_24ab8327af3f90df)) {
        var_24ab8327af3f90df = max(0, getdvarfloat(@"hash_9c25e05a8010d645", 3));
        level.var_24ab8327af3f90df = var_24ab8327af3f90df;
    }
    return var_24ab8327af3f90df;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23e4
// Size: 0x29
function function_3d92e694ec2d0078(ent) {
    if (isdefined(ent.var_f676be7150162ca7)) {
        return ent.var_f676be7150162ca7[0];
    }
    return undefined;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2416
// Size: 0x81
function previouslytouchedtriggertype(var_7edface381884ca9, currenttriggertype) {
    var_1b99bb6cc4aec0fe = 0;
    if (isdefined(var_7edface381884ca9.var_7a3a633f3137ee)) {
        previoustriggertype = var_7edface381884ca9.var_7a3a633f3137ee;
        if (currenttriggertype == previoustriggertype) {
            var_1b99bb6cc4aec0fe = 1;
        } else if ((currenttriggertype == "default" || currenttriggertype == "minefield") && (previoustriggertype == "default" || previoustriggertype == "minefield")) {
            var_1b99bb6cc4aec0fe = 1;
        }
    }
    return var_1b99bb6cc4aec0fe;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24a0
// Size: 0xb
function function_86afcfb8eb7bf0d2(trigger) {
    
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24b3
// Size: 0x2
function function_d55ed59c0ce164d3() {
    
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24bd
// Size: 0xa2
function function_417718db737858b7() {
    wait 5;
    level.overwatch_emp_low = 0.8;
    level.overwatch_emp_high = 1.2;
    level.overwatch_emp_free = 5;
    level.var_3d1e30b1d4cdea65 = getentarray("emp_jammer", "targetname");
    foreach (var_c9771233da58f66c in level.var_3d1e30b1d4cdea65) {
        var_c9771233da58f66c hudoutlineenable("outline_nodepth_red");
        var_c9771233da58f66c thread function_e849523551c4f041();
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2567
// Size: 0x1c0
function function_e849523551c4f041() {
    self endon("death");
    self setcandamage(1);
    self.health = 9999;
    self.maxhealth = 9999;
    self.var_abbaa2fc2b3da347 = 0;
    while (true) {
        self waittill("damage", damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor);
        if (!isplayer(attacker)) {
            continue;
        }
        if (meansofdeath == "MOD_GRENADE_SPLASH") {
            continue;
        }
        attacker thread namespace_3d3d5211c3029f82::updatedamagefeedback("hitturret", undefined, damage, 1);
        self.var_abbaa2fc2b3da347++;
        if (self.var_abbaa2fc2b3da347 < 5) {
            continue;
        }
        /#
            attacker iprintln("<dev string:xcf>");
        #/
        if (isdefined(self.var_281086936687228a)) {
            foreach (ent in self.var_281086936687228a.entstouching) {
                function_45efa9bc7f471ef1(self.var_281086936687228a, ent);
            }
        }
        self.var_281086936687228a delete();
        self delete();
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x272f
// Size: 0x94
function emp_effects_flickering(player) {
    level endon("stop_overwatch_emp_effects");
    player endon("stop_overwatch_emp_effects");
    player endon("disconnect");
    player notify("emp_effects_flickering");
    player endon("emp_effects_flickering");
    var_3996095e0b23a557 = 0.75;
    while (true) {
        randomtime = randomfloatrange(level.overwatch_emp_low, level.overwatch_emp_high);
        player thread scripts\cp_mp\emp_debuff::play_scramble_for_player_until_cleared(player, 5);
        randomdelay = randomfloat(level.overwatch_emp_free);
        wait randomtime + var_3996095e0b23a557 + randomdelay;
    }
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27cb
// Size: 0x26
function function_11011e6292a21c15(player) {
    player notify("stop_overwatch_emp_effects");
    player notify("emp_cleared");
    player.mark_emp_effects = undefined;
}

// Namespace radar_scrambler / namespace_4f38e357ab5494ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27f9
// Size: 0x48
function stop_emp_effects_on_players() {
    level notify("stop_overwatch_emp_effects");
    for (i = 0; i < level.players.size; i++) {
        level notify("emp_cleared");
        level.players[i].mark_emp_effects = undefined;
    }
}

