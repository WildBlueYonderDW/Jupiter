#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility\player.gsc;
#using scripts\cp\utility\entity.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_17ca3af80f14ce7e;
#using scripts\cp\cp_debug.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp\cp_hostmigration.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_18a73a64992dd07d;
#using script_7e4d332e911e1b90;
#using scripts\anim\utility_common.gsc;
#using scripts\cp\cp_spawning_util.gsc;
#using script_54f6cd90dd31bbf0;
#using scripts\stealth\enemy.gsc;
#using scripts\aitypes\stealth.gsc;
#using scripts\stealth\event.gsc;

#namespace namespace_d1ef96d1d9fa6257;

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8d8
// Size: 0x49
function function_68c57b54d96715be(ent, ref) {
    ent.var_5a3a4c78b256fd0c = ref;
    /#
        var_bfe622d7e1204e91 = getdvarint(@"hash_4a011e0807fb1f84", 0);
        if (var_bfe622d7e1204e91) {
            function_de8fd4597c7de8c6(ent);
        }
    #/
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x929
// Size: 0x16
function function_4bebbb5c8c6e784d(ent) {
    ent.var_5a3a4c78b256fd0c = undefined;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x947
// Size: 0x33
function function_212d8f5b276b3f7b(ref, callback) {
    struct = function_ee4ce9c0d26a5865();
    struct.entercallbacks[ref] = callback;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x982
// Size: 0x33
function function_6963af169a8ebf81(ref, callback) {
    struct = function_ee4ce9c0d26a5865();
    struct.exitcallbacks[ref] = callback;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9bd
// Size: 0x33
function function_9013d3e97478c915(ref, callback) {
    struct = function_ee4ce9c0d26a5865();
    struct.outoftimecallbacks[ref] = callback;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9f8
// Size: 0x33
function function_abe54546e3e8f240(ref, callback) {
    struct = function_ee4ce9c0d26a5865();
    struct.clearcallbacks[ref] = callback;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa33
// Size: 0x4e
function function_c38b50e3dd763ae3(ent, var_3e36f415f762070e) {
    if (function_96378641b22bea7e(ent)) {
        return false;
    }
    if (istrue(var_3e36f415f762070e) && function_96378641b22bea7e(ent)) {
        return false;
    }
    return isdefined(ent.var_fda3c6fcf6638bf3) && ent.var_fda3c6fcf6638bf3 > 0;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa8a
// Size: 0x6d
function function_6909cacfcf4034cc(ent) {
    if (!isdefined(ent.var_fda3c6fcf6638bf3)) {
        ent.var_fda3c6fcf6638bf3 = 0;
    }
    ent.var_fda3c6fcf6638bf3++;
    if (ent.var_fda3c6fcf6638bf3 == 1) {
        if (!isdefined(ent.var_dec3be43668a3021) || ent.var_dec3be43668a3021 <= 0) {
            function_13d1e809c6b4c18c(ent);
        }
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaff
// Size: 0x190
function function_9648a478f198a621(ent, var_d5c909837fd4deb4) {
    assertex(isdefined(ent.var_fda3c6fcf6638bf3), "disableaiRegion called on an entity that was not in the Ai Region. ");
    if (!isdefined(ent.var_fda3c6fcf6638bf3)) {
        if (isdefined(ent)) {
            if (function_34be418b2813a498()) {
                iprintlnbold("^3 Ent -> ^1" + ent getentitynumber() + "^3 did not have .spawner variable Defined! (disableaiRegion) ");
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
    }
    if (!istrue(var_d5c909837fd4deb4)) {
        assertex(ent.var_fda3c6fcf6638bf3 > 0, "disableaiRegion more times than enableaiRegion.");
    }
    ent.var_fda3c6fcf6638bf3--;
    if (ent.var_fda3c6fcf6638bf3 == 0) {
        ent.var_fda3c6fcf6638bf3 = undefined;
        if (!isdefined(ent.var_dec3be43668a3021) || ent.var_dec3be43668a3021 <= 0) {
            function_c87cec962c595206(ent, 0);
        }
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc97
// Size: 0x28
function function_96378641b22bea7e(ent) {
    return isdefined(ent.var_dec3be43668a3021) && ent.var_dec3be43668a3021 > 0;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcc8
// Size: 0x6d
function function_de8fd4597c7de8c6(ent) {
    if (!isdefined(ent.var_dec3be43668a3021)) {
        ent.var_dec3be43668a3021 = 0;
    }
    ent.var_dec3be43668a3021++;
    if (ent.var_dec3be43668a3021 == 1) {
        if (isdefined(ent.var_fda3c6fcf6638bf3) && ent.var_fda3c6fcf6638bf3 > 0) {
            function_c87cec962c595206(ent, 0);
        }
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd3d
// Size: 0x8f
function function_bbd1d29bb00c640b(ent) {
    assertex(isdefined(ent.var_dec3be43668a3021), "disableaiRegionImmunity called on an entity without Ai Region immunity.");
    assertex(ent.var_dec3be43668a3021 > 0, "disableaiRegionImmunity more times than enableaiRegionImmunity.");
    ent.var_dec3be43668a3021--;
    if (ent.var_dec3be43668a3021 == 0) {
        ent.var_dec3be43668a3021 = undefined;
        if (isdefined(ent.var_fda3c6fcf6638bf3) && ent.var_fda3c6fcf6638bf3 > 0) {
            function_13d1e809c6b4c18c(ent);
        }
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdd4
// Size: 0x1d9
function function_983add621b34ed28(ent, fromdeath) {
    ent notify("clear_aiRegion");
    if (function_c38b50e3dd763ae3(ent, 1)) {
        function_c87cec962c595206(ent, fromdeath, 1);
    }
    clearcallback = undefined;
    if (isplayer(ent)) {
        clearcallback = &playerclearcallback;
    } else if (isagent(ent)) {
        clearcallback = &playerclearcallback;
    } else if (isdefined(ent.var_5a3a4c78b256fd0c)) {
        struct = function_ee4ce9c0d26a5865();
        clearcallback = struct.clearcallbacks[ent.var_5a3a4c78b256fd0c];
    }
    if (isdefined(clearcallback)) {
        ent [[ clearcallback ]]();
    }
    ent.var_5a3a4c78b256fd0c = undefined;
    ent.var_fda3c6fcf6638bf3 = undefined;
    ent.var_dec3be43668a3021 = undefined;
    ent.var_d9680b0125820647 = undefined;
    ent.var_bae64961a3976f9 = undefined;
    ent.var_3392ef5b6b742ad5 = undefined;
    if (isdefined(ent.var_ceb9d44b40906c4a)) {
        foreach (trigger in ent.var_ceb9d44b40906c4a) {
            trigger.entstouching[ent getentitynumber()] = undefined;
        }
        ent.var_ceb9d44b40906c4a = undefined;
    }
    if (isdefined(ent.var_2ba26fbb56cce6b5)) {
        foreach (trigger in ent.var_2ba26fbb56cce6b5) {
            trigger.entstouching[ent getentitynumber()] = undefined;
        }
        ent.var_2ba26fbb56cce6b5 = undefined;
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb5
// Size: 0x85
function function_7e9f0258159a7bd6() {
    if (istrue(self.allowedintrigger)) {
        return false;
    }
    if (!isdefined(level.var_ceb9d44b40906c4a)) {
        return false;
    }
    foreach (trigger in level.var_ceb9d44b40906c4a) {
        if (!function_84f2d42d2d646239(trigger, self)) {
            continue;
        }
        if (self istouching(trigger)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1043
// Size: 0xb8
function function_528bcc710bb30998(var_863c619037f3ac74, var_da8cec9bce12f9cb) {
    var_4b9d6f93b356408 = 0;
    if (!isdefined(level.var_ceb9d44b40906c4a)) {
        return var_4b9d6f93b356408;
    } else {
        foreach (trigger in level.var_ceb9d44b40906c4a) {
            if (ispointinvolume(var_863c619037f3ac74, trigger)) {
                if (isdefined(trigger.script_team) && isdefined(var_da8cec9bce12f9cb) && trigger.script_team != var_da8cec9bce12f9cb) {
                    continue;
                }
                var_4b9d6f93b356408 = 1;
                break;
            }
        }
    }
    return var_4b9d6f93b356408;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1104
// Size: 0x80
function function_8370af6cf6e65620(spawner, trigger) {
    var_863c619037f3ac74 = spawner.origin;
    var_4b9d6f93b356408 = 0;
    if (!isdefined(level.var_ceb9d44b40906c4a)) {
        return undefined;
    } else if (namespace_1fdb557af4bcd29e::function_44a315340c86e09(var_863c619037f3ac74, trigger.origin, trigger.struct.radius)) {
        var_4b9d6f93b356408 = 1;
        trigger = namespace_1fdb557af4bcd29e::function_bac68a34c968c639(spawner, trigger);
    }
    return trigger;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x118d
// Size: 0x60
function function_44a315340c86e09(point, circlecenter, circleradius) {
    x = point[0];
    y = point[1];
    if ((x - circlecenter[0]) * (x - circlecenter[0]) + (y - circlecenter[1]) * (y - circlecenter[1]) <= circleradius * circleradius) {
        return 1;
    }
    return 0;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11f5
// Size: 0x99
function function_4becaa200ddc0956() {
    /#
        create_func_ref("<dev string:x68>", &scripts\cp\cp_debug::draw_spawner);
    #/
    if (!flag_exist("ai_regions_initialized")) {
        flag_init("ai_regions_initialized");
    }
    if (!flag_exist("ready_for_region_spawning")) {
        flag_init("ready_for_region_spawning");
    }
    if (!isdefined(level.var_ceb9d44b40906c4a)) {
        level.var_ceb9d44b40906c4a = [];
    }
    level.var_ceb9d44b40906c4a = array_combine(level.var_ceb9d44b40906c4a, getentarray("ai_region", "targetname"));
    thread function_aaa58df7db9699e7();
    level thread function_1a3fb64b55b6e6ee();
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1296
// Size: 0x87
function function_2b1e89bbebab6964() {
    if (!flag_exist("level_ready_for_script")) {
        flag_init("level_ready_for_script");
    }
    flag_wait("level_ready_for_script");
    if (isdefined(level.var_fc46cd90f0a40c87)) {
        [[ level.var_fc46cd90f0a40c87 ]]();
    }
    if (!isdefined(level.var_ceb9d44b40906c4a)) {
        level.var_ceb9d44b40906c4a = [];
    }
    level.var_ceb9d44b40906c4a = array_combine(level.var_ceb9d44b40906c4a, getentarray("ai_region", "targetname"));
    thread function_aaa58df7db9699e7();
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1325
// Size: 0x170
function function_13d1e809c6b4c18c(ent) {
    entercallback = undefined;
    trigger = function_f4e12eccaefc243(ent);
    triggertype = gettriggertype(ent, trigger);
    if (isplayer(ent)) {
        entercallback = &playerentercallback;
    } else if (isagent(ent)) {
        entercallback = &function_b2a14335ecf202f8;
    } else if (isdefined(ent.var_5a3a4c78b256fd0c)) {
        struct = function_ee4ce9c0d26a5865();
        entercallback = struct.entercallbacks[ent.var_5a3a4c78b256fd0c];
    }
    ent notify("aiRegion_cooldown_end");
    if (isdefined(ent.var_d9680b0125820647) && previouslytouchedtriggertype(ent, triggertype)) {
        var_37dc2f766a2fa2a = ent.var_d9680b0125820647 / 1000;
        ent.var_bae64961a3976f9 = int(gettime() + ent.var_d9680b0125820647);
        ent.var_d9680b0125820647 = undefined;
        thread function_269a6b999cb5f292(ent, var_37dc2f766a2fa2a);
    } else {
        ent.var_d9680b0125820647 = undefined;
        ent.var_3392ef5b6b742ad5 = triggertype;
        var_37dc2f766a2fa2a = function_661d1b3cc3d5a2e4(triggertype);
        ent.var_bae64961a3976f9 = int(gettime() + var_37dc2f766a2fa2a * 1000);
        thread function_269a6b999cb5f292(ent, var_37dc2f766a2fa2a);
    }
    if (isdefined(entercallback)) {
        ent thread [[ entercallback ]]("exit_aiRegion", "clear_aiRegion", triggertype, trigger);
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x149d
// Size: 0x139
function function_c87cec962c595206(ent, fromdeath, fromclear) {
    ent notify("exit_aiRegion");
    exitcallback = undefined;
    if (isplayer(ent)) {
        exitcallback = &playerexitcallback;
    } else if (isagent(ent)) {
        exitcallback = &function_d405dee230e91b4;
    } else if (isdefined(ent.var_5a3a4c78b256fd0c)) {
        struct = function_ee4ce9c0d26a5865();
        exitcallback = struct.exitcallbacks[ent.var_5a3a4c78b256fd0c];
    }
    ent notify("aiRegion_timeout_end");
    if (!istrue(fromclear)) {
        if (isdefined(ent.var_bae64961a3976f9)) {
            ent.var_d9680b0125820647 = int(max(0, ent.var_bae64961a3976f9 - gettime()));
            ent.var_bae64961a3976f9 = undefined;
            trigger = function_f4e12eccaefc243(ent);
            triggertype = gettriggertype(ent, trigger);
            cooldowntime = getcooldowntime(triggertype);
            thread function_a0c5231a5482846f(ent, cooldowntime);
        }
    }
    if (isdefined(exitcallback)) {
        ent thread [[ exitcallback ]](fromdeath, fromclear, "clear_aiRegion");
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15de
// Size: 0xa4
function function_a02fd06df65094c2(ent) {
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
    } else if (isdefined(ent.var_5a3a4c78b256fd0c)) {
        struct = function_ee4ce9c0d26a5865();
        var_106b10573bdeadf0 = struct.outoftimecallbacks[ent.var_5a3a4c78b256fd0c];
    }
    if (isdefined(var_106b10573bdeadf0)) {
        ent thread [[ var_106b10573bdeadf0 ]]("aiRegion_timeout_end", "clear_aiRegion");
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x168a
// Size: 0x4e
function function_269a6b999cb5f292(ent, timeleft) {
    if (isplayer(ent) || isagent(ent)) {
        ent endon("death");
    }
    ent notify("aiRegion_timeout_end");
    ent endon("aiRegion_timeout_end");
    ent endon("clear_aiRegion");
    wait timeleft;
    thread function_a02fd06df65094c2(ent);
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16e0
// Size: 0x5b
function function_a0c5231a5482846f(ent, timeleft) {
    if (isplayer(ent) || isagent(ent)) {
        ent endon("death");
    }
    ent notify("aiRegion_cooldown_end");
    ent endon("aiRegion_cooldown_end");
    ent endon("clear_aiRegion");
    wait timeleft;
    ent.var_d9680b0125820647 = undefined;
    ent.var_3392ef5b6b742ad5 = undefined;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1743
// Size: 0x65
function playerentercallback(exitnotify, clearnotify, triggertype, trigger) {
    var_ee954ef8140d304b = 1;
    if (isdefined(triggertype) && triggertype == "restricted") {
        var_ee954ef8140d304b = 2;
    }
    self.var_77c36c0c605bf302 = trigger;
    /#
        self iprintln("<dev string:x75>");
    #/
    trigger notify("spawning_request");
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x17b0
// Size: 0x56
function function_b2a14335ecf202f8(exitnotify, clearnotify, triggertype, trigger) {
    var_ee954ef8140d304b = 1;
    if (isdefined(triggertype) && triggertype == "restricted") {
        var_ee954ef8140d304b = 2;
    }
    function_86afcfb8eb7bf0d2(trigger);
    self.var_77c36c0c605bf302 = trigger;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x180e
// Size: 0x34
function playerexitcallback(fromdeath, fromclear, clearnotify) {
    self.var_77c36c0c605bf302 = undefined;
    /#
        self iprintln("<dev string:x91>");
    #/
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x184a
// Size: 0x2c
function function_d405dee230e91b4(fromdeath, fromclear, clearnotify) {
    self.var_77c36c0c605bf302 = undefined;
    function_d55ed59c0ce164d3();
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x187e
// Size: 0x38
function playeroutoftimecallback(timeoutendnotify, clearnotify) {
    trigger = function_f4e12eccaefc243(self);
    triggertype = gettriggertype(self, trigger);
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18be
// Size: 0xb
function playerclearcallback(clearnotify) {
    
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18d1
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

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x19bf
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

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1a3f
// Size: 0xbb
function killstreakentercallback(exitnotify, clearnotify, triggertype, trigger) {
    var_ee954ef8140d304b = 1;
    if (islargemap() && level.gametype == "arm" && isdefined(triggertype) && triggertype == "restricted") {
        var_ee954ef8140d304b = 2;
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

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b02
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

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b7d
// Size: 0x13
function killstreakoutoftimecallback(timeoutendnotify, clearnotify) {
    
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b98
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

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf4
// Size: 0x46
function function_d1f0b7aa511a0() {
    function_212d8f5b276b3f7b("killstreak", &killstreakentercallback);
    function_6963af169a8ebf81("killstreak", &killstreakexitcallback);
    function_9013d3e97478c915("killstreak", &killstreakoutoftimecallback);
    function_abe54546e3e8f240("killstreak", &killstreakclearcallback);
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c42
// Size: 0x17a
function function_aaa58df7db9699e7() {
    var_20533273f43dd4e2 = [];
    if (isdefined(level.var_ceb9d44b40906c4a)) {
        foreach (trigger in level.var_ceb9d44b40906c4a) {
            if (!isdefined(trigger.var_9f9f230946bd8faf)) {
                trigger.var_9f9f230946bd8faf = [];
            }
            var_4b0722170880249f = function_afc5010effb06a46(trigger);
            var_20533273f43dd4e2 = array_add(var_20533273f43dd4e2, var_4b0722170880249f);
        }
        level.var_ceb9d44b40906c4a = var_20533273f43dd4e2;
        flag_set("ai_regions_initialized");
        foreach (trigger in level.var_ceb9d44b40906c4a) {
            if (!isdefined(trigger.var_9f9f230946bd8faf)) {
                trigger.var_9f9f230946bd8faf = [];
            }
            thread watchaiRegionTrigger(trigger);
        }
        if (isdefined(level.var_acf3fd19390fc26d)) {
            foreach (trigger in level.var_acf3fd19390fc26d) {
                thread watchaiRegionSuppressionTrigger(trigger);
            }
        }
        thread stealth_event_propagator();
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc4
// Size: 0x16c
function function_afc5010effb06a46(trigger) {
    var_d1facff1e900673 = [];
    foreach (var_f8e5e3aa5762a8e7 in level.ambientgroups) {
        if (isarray(var_f8e5e3aa5762a8e7)) {
            continue;
        }
        if (isarray(var_f8e5e3aa5762a8e7.spawn_points)) {
            foreach (struct in var_f8e5e3aa5762a8e7.spawn_points) {
                if (isdefined(struct.script_suspend)) {
                    var_11879c5af01a1cde = ter_op(isdefined(level.var_e9363e4bb08955e4), level.var_e9363e4bb08955e4, "region_spawning_test");
                    if (var_11879c5af01a1cde != module_name) {
                        continue;
                    }
                    var_cd2708a4b9d60bb9 = namespace_1fdb557af4bcd29e::function_8370af6cf6e65620(struct, trigger);
                    if (isdefined(var_cd2708a4b9d60bb9)) {
                        trigger = var_cd2708a4b9d60bb9;
                        if (namespace_1fdb557af4bcd29e::function_34be418b2813a498()) {
                            /#
                                [[ level.func["<dev string:x68>"] ]](struct.origin, struct.angles, (0, 1, 0));
                            #/
                        }
                    }
                }
            }
        }
    }
    return trigger;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f39
// Size: 0x4e
function watchaiRegionTrigger(trigger) {
    trigger notify("watchaiRegionTrigger");
    trigger endon("watchaiRegionTrigger");
    trigger.entstouching = [];
    scripts\mp\flags::gameflagwait("prematch_done");
    thread watchaiRegionTriggerExit(trigger);
    thread watchaiRegionTriggerEnter(trigger);
    thread watchaiRegionTriggerRequests(trigger);
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f8f
// Size: 0x7c
function watchaiRegionTriggerEnter(trigger) {
    level endon("game_ended");
    trigger notify("watchaiRegionTriggerEnter");
    trigger endon("watchaiRegionTriggerEnter");
    while (true) {
        trigger waittill("trigger", ent);
        if (isplayer(ent) && isdefined(ent.c130)) {
            continue;
        }
        if (!function_84f2d42d2d646239(trigger, ent)) {
            continue;
        }
        if (!function_693b7e3703225a8b(ent)) {
            continue;
        }
        function_8dd05df654cdbbb0(trigger, ent);
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2013
// Size: 0xac
function watchaiRegionTriggerExit(trigger) {
    level endon("game_ended");
    trigger notify("watchaiRegionTriggerExit");
    trigger endon("watchaiRegionTriggerExit");
    while (true) {
        temparr = trigger.entstouching;
        foreach (ent in temparr) {
            if (!isdefined(ent)) {
                trigger.entstouching[id] = undefined;
            }
            if (isdefined(ent) && !trigger istouching(ent)) {
                function_985d2edf83e8270e(trigger, ent);
            }
        }
        waitframe();
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x20c7
// Size: 0x1f3
function function_8dd05df654cdbbb0(trigger, ent) {
    entnum = ent getentitynumber();
    if (isdefined(trigger.entstouching[entnum])) {
        return;
    }
    trigger.entstouching[entnum] = ent;
    if (!isdefined(ent.var_ceb9d44b40906c4a)) {
        ent.var_ceb9d44b40906c4a = [];
    }
    temparr = [trigger];
    foreach (var_deb4666f1507fcfd in ent.var_ceb9d44b40906c4a) {
        temparr[temparr.size] = var_deb4666f1507fcfd;
    }
    ent.var_ceb9d44b40906c4a = temparr;
    function_6909cacfcf4034cc(ent);
    if (isagent(ent)) {
        if (!isdefined(ent.spawner)) {
            if (function_34be418b2813a498()) {
                iprintlnbold("^3 Ent -> ^1" + ent getentitynumber() + "^3 did not have .spawner variable Defined! (onEnteraiRegionTrigger) ");
                /#
                    print3d(ent.origin + (0, 0, 50), "<dev string:x1c>" + ent getentitynumber() + "<dev string:xaa>", (1, 1, 1), 1, 1, 666);
                    line(ent.origin, ent.origin + (0, 0, 1000), (0.4, 0.3, 0), 1, 0, 666);
                #/
                ent hudoutlineenable("outline_cp_teleport_debug");
            }
        }
        if (!array_contains(trigger.var_9f9f230946bd8faf, ent.spawner)) {
            trigger.var_9f9f230946bd8faf = array_add(trigger.var_9f9f230946bd8faf, ent.spawner);
        }
        ent thread function_402c5f663ff803c();
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22c2
// Size: 0xdd
function function_402c5f663ff803c() {
    self endon("clean_up_exit_threads");
    self waittill("death");
    if (istrue(self.nocorpse) || self.damagemod == "MOD_SUICIDE") {
        return;
    }
    foreach (trigger in level.var_ceb9d44b40906c4a) {
        trigger.entstouching[self getentitynumber()] = undefined;
        if (isdefined(self.spawner)) {
            if (array_contains(trigger.var_9f9f230946bd8faf, self.spawner)) {
                trigger.var_9f9f230946bd8faf = array_remove(trigger.var_9f9f230946bd8faf, self.spawner);
            }
        }
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23a7
// Size: 0x139
function function_3b55a5779a740df1() {
    if (istrue(self.nocorpse) || self.damagemod == "MOD_SUICIDE") {
        return;
    }
    foreach (trigger in level.var_ceb9d44b40906c4a) {
        trigger.entstouching[self getentitynumber()] = undefined;
        if (isdefined(self.spawner)) {
            if (array_contains(trigger.var_9f9f230946bd8faf, self.spawner)) {
                trigger.var_9f9f230946bd8faf = array_remove(trigger.var_9f9f230946bd8faf, self.spawner);
            }
        }
    }
    var_89f2489a97a98d30 = namespace_1fdb557af4bcd29e::function_56a6214ab214d8b1();
    if (isarray(var_89f2489a97a98d30) && var_89f2489a97a98d30.size > 0) {
        foreach (trig in var_89f2489a97a98d30) {
            trig notify("spawning_request");
        }
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x24e8
// Size: 0x1b0
function function_985d2edf83e8270e(trigger, ent) {
    entnum = ent getentitynumber();
    trigger.entstouching[entnum] = undefined;
    if (isagent(ent)) {
        if (!isdefined(ent.spawner)) {
            iprintlnbold("^3 Ent -> ^1" + ent getentitynumber() + "^3 did not have .spawner variable Defined! (onExitaiRegionTrigger)  ");
            /#
                print3d(ent.origin + (0, 0, 50), "<dev string:x1c>" + ent getentitynumber() + "<dev string:xef>", (1, 1, 1), 1, 1, 666);
                line(ent.origin, ent.origin + (0, 0, 1000), (0.4, 0.3, 0), 1, 0, 666);
            #/
            ent hudoutlineenable("outline_cp_teleport_debug");
        }
        if (isdefined(ent.spawner)) {
            if (array_contains(trigger.var_9f9f230946bd8faf, ent.spawner)) {
                trigger.var_9f9f230946bd8faf = array_remove(trigger.var_9f9f230946bd8faf, ent.spawner);
            }
        }
    }
    if (isdefined(ent.var_fda3c6fcf6638bf3)) {
        function_9648a478f198a621(ent);
    }
    ent notify("clean_up_exit_threads");
    if (isdefined(ent.var_ceb9d44b40906c4a)) {
        ent.var_ceb9d44b40906c4a = array_remove(ent.var_ceb9d44b40906c4a, trigger);
        if (ent.var_ceb9d44b40906c4a.size == 0) {
            ent.var_ceb9d44b40906c4a = undefined;
        }
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26a0
// Size: 0x45
function watchaiRegionSuppressionTrigger(trigger) {
    trigger notify("watchaiRegionSuppressionTrigger");
    trigger endon("watchaiRegionSuppressionTrigger");
    trigger.entstouching = [];
    scripts\mp\flags::gameflagwait("prematch_done");
    thread watchaiRegionSuppressionTriggerExit(trigger);
    thread watchaiRegionSupressionTriggerEnter(trigger);
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26ed
// Size: 0x52
function watchaiRegionSupressionTriggerEnter(trigger) {
    level endon("game_ended");
    trigger notify("watchaiRegionSupressionTriggerEnter");
    trigger endon("watchaiRegionSupressionTriggerEnter");
    while (true) {
        trigger waittill("trigger", ent);
        if (!function_693b7e3703225a8b(ent)) {
            continue;
        }
        function_77576856c3a8fff5(trigger, ent);
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2747
// Size: 0xb1
function watchaiRegionSuppressionTriggerExit(trigger) {
    level endon("game_ended");
    trigger notify("watchaiRegionSuppressionTriggerExit");
    trigger endon("watchaiRegionSuppressionTriggerExit");
    while (true) {
        temparr = trigger.entstouching;
        if (isdefined(temparr)) {
            foreach (ent in temparr) {
                if (!isdefined(ent)) {
                    trigger.entstouching[id] = undefined;
                }
                if (isdefined(ent) && !trigger istouching(ent)) {
                    function_37227d6593dcc483(trigger, ent);
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2800
// Size: 0xd9
function function_77576856c3a8fff5(trigger, ent) {
    entnum = ent getentitynumber();
    if (isdefined(trigger.entstouching[entnum])) {
        return;
    }
    trigger.entstouching[entnum] = ent;
    if (!isdefined(ent.var_2ba26fbb56cce6b5)) {
        ent.var_2ba26fbb56cce6b5 = [];
    }
    temparr = [trigger];
    foreach (var_742ec9851ce034da in ent.var_2ba26fbb56cce6b5) {
        temparr[temparr.size] = var_742ec9851ce034da;
    }
    ent.var_2ba26fbb56cce6b5 = temparr;
    function_de8fd4597c7de8c6(ent);
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x28e1
// Size: 0x67
function function_37227d6593dcc483(trigger, ent) {
    entnum = ent getentitynumber();
    trigger.entstouching[entnum] = undefined;
    ent.var_2ba26fbb56cce6b5[trigger getentitynumber()] = undefined;
    if (ent.var_2ba26fbb56cce6b5.size == 0) {
        ent.var_2ba26fbb56cce6b5 = undefined;
    }
    function_bbd1d29bb00c640b(ent);
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2950
// Size: 0x15d
function function_84f2d42d2d646239(trigger, ent) {
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

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ab6
// Size: 0x8d
function function_693b7e3703225a8b(ent) {
    if (isdefined(ent)) {
        if (isplayer(ent) || isagent(ent)) {
            if (ent scripts\cp_mp\utility\player_utility::_isalive()) {
                return true;
            }
        }
        if (isdefined(ent.var_5a3a4c78b256fd0c)) {
            if (ent scripts\cp_mp\vehicles\vehicle::isvehicle()) {
                if (!istrue(ent.isdestroyed)) {
                    return true;
                }
            }
            if (isdefined(ent.streakinfo) && function_51bbce44958b49f0(ent.streakinfo.streakname)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b4c
// Size: 0x61
function function_ee4ce9c0d26a5865() {
    struct = level.var_332fb47555f99f3b;
    if (!isdefined(struct)) {
        struct = spawnstruct();
        struct.entercallbacks = [];
        struct.exitcallbacks = [];
        struct.outoftimecallbacks = [];
        struct.clearcallbacks = [];
        level.var_332fb47555f99f3b = struct;
    }
    return struct;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bb6
// Size: 0x40
function function_51bbce44958b49f0(streakname) {
    var_43265c6bad4d9e1e = 0;
    switch (streakname) {
    case #"hash_cf0ef5bef19a311b":
    case #"hash_e40585107590f016":
        var_43265c6bad4d9e1e = 1;
        break;
    }
    return var_43265c6bad4d9e1e;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2bff
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

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cb8
// Size: 0x4d
function getcooldowntime(triggertype) {
    switch (triggertype) {
    case #"hash_18ad1d5da2e56d4c":
    case #"hash_6b15362474c2e2b2":
    case #"hash_7038dec66d8275be":
    case #"hash_fa21c4f6bd5e3815":
        return function_661d1b3cc3d5a2e4(triggertype);
    }
    return undefined;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d0e
// Size: 0x4c
function function_661d1b3cc3d5a2e4(triggertype) {
    switch (triggertype) {
    case #"hash_18ad1d5da2e56d4c":
    case #"hash_6b15362474c2e2b2":
    case #"hash_7038dec66d8275be":
    case #"hash_fa21c4f6bd5e3815":
        return function_8dd63b9a4a182f0c();
    }
    return undefined;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d63
// Size: 0x58
function function_8dd63b9a4a182f0c() {
    /#
        return max(0, getdvarfloat(@"hash_d7e4068edfedb9d4", 3));
    #/
    var_37dc2f766a2fa2a = level.var_37dc2f766a2fa2a;
    if (!isdefined(var_37dc2f766a2fa2a)) {
        var_37dc2f766a2fa2a = max(0, getdvarfloat(@"hash_d7e4068edfedb9d4", 3));
        level.var_37dc2f766a2fa2a = var_37dc2f766a2fa2a;
    }
    return var_37dc2f766a2fa2a;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dc4
// Size: 0x29
function function_f4e12eccaefc243(ent) {
    if (isdefined(ent.var_ceb9d44b40906c4a)) {
        return ent.var_ceb9d44b40906c4a[0];
    }
    return undefined;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2df6
// Size: 0x81
function previouslytouchedtriggertype(var_7edface381884ca9, currenttriggertype) {
    var_1b99bb6cc4aec0fe = 0;
    if (isdefined(var_7edface381884ca9.var_3392ef5b6b742ad5)) {
        previoustriggertype = var_7edface381884ca9.var_3392ef5b6b742ad5;
        if (currenttriggertype == previoustriggertype) {
            var_1b99bb6cc4aec0fe = 1;
        } else if ((currenttriggertype == "default" || currenttriggertype == "minefield") && (previoustriggertype == "default" || previoustriggertype == "minefield")) {
            var_1b99bb6cc4aec0fe = 1;
        }
    }
    return var_1b99bb6cc4aec0fe;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e80
// Size: 0x4b
function function_86afcfb8eb7bf0d2(trigger) {
    self.script_suspend_group = trigger.script_noteworthy;
    if (isdefined(self.spawner)) {
        self.spawner.script_suspend_group = trigger.script_noteworthy;
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ed3
// Size: 0x2c
function function_d55ed59c0ce164d3() {
    self.script_suspend_group = undefined;
    if (isdefined(self.spawner)) {
        self.spawner.script_suspend_group = undefined;
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f07
// Size: 0x52
function watchaiRegionTriggerRequests(trigger) {
    level endon("game_ended");
    trigger notify("watchaiRegionTriggerRequests");
    trigger endon("watchaiRegionTriggerRequests");
    while (true) {
        trigger waittill("spawning_request", var_d97be0fb72fca8a9);
        if (!function_5e1050e3208c8c06()) {
            continue;
        }
        level notify("global_spawning_request", trigger, var_d97be0fb72fca8a9);
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f61
// Size: 0x199
function function_1a3fb64b55b6e6ee() {
    level endon("game_ended");
    while (true) {
        level waittill("global_spawning_request", var_deb4666f1507fcfd, var_d97be0fb72fca8a9);
        if (!isdefined(var_deb4666f1507fcfd)) {
            assertex(isdefined(var_deb4666f1507fcfd), "A Valid AI Region Trigger Entity MUST be passed in");
            if (!isdefined(var_deb4666f1507fcfd)) {
                continue;
            }
        }
        var_854a7e665d4adab2 = [];
        var_20e01991ca5e0385 = 0;
        var_fedb346f9b68ce66 = [];
        var_89f2489a97a98d30 = namespace_1fdb557af4bcd29e::function_56a6214ab214d8b1(var_deb4666f1507fcfd);
        if (isarray(var_89f2489a97a98d30) && var_89f2489a97a98d30.size > 0) {
            foreach (trigger in var_89f2489a97a98d30) {
                var_fedb346f9b68ce66 = array_combine(var_fedb346f9b68ce66, trigger.var_9f9f230946bd8faf);
            }
        }
        var_e2646e4fd752ae67 = function_fee22980f1be9191(var_deb4666f1507fcfd);
        if (isdefined(var_d97be0fb72fca8a9) && isint(var_d97be0fb72fca8a9)) {
            var_e2646e4fd752ae67 = var_d97be0fb72fca8a9;
        }
        var_673d056f46675a63 = ter_op(namespace_5729d24318b60bcd::get_max_agent_count() < getaiarray("axis").size + var_e2646e4fd752ae67, 1, 0);
        /#
            if (function_34be418b2813a498()) {
                iprintlnbold("<dev string:x133>" + var_673d056f46675a63 + "<dev string:x154>" + var_e2646e4fd752ae67 + "<dev string:x179>" + getaiarray("<dev string:x1a9>").size);
            }
        #/
        if (!var_673d056f46675a63) {
            function_98d19cc13a08f9e1(var_deb4666f1507fcfd, var_e2646e4fd752ae67);
            continue;
        }
        function_5f974f12d8b7cb29(var_deb4666f1507fcfd, var_fedb346f9b68ce66);
        function_98d19cc13a08f9e1(var_deb4666f1507fcfd, var_e2646e4fd752ae67);
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3102
// Size: 0x5a0
function function_5f974f12d8b7cb29(var_fd11088f77720495, var_fedb346f9b68ce66) {
    var_20e01991ca5e0385 = 0;
    var_854a7e665d4adab2 = function_f4117c23b5c99c0b(var_fd11088f77720495);
    foreach (ai in getaiarray("axis")) {
        if (isdefined(ai.spawner) && array_contains(var_fd11088f77720495.var_9f9f230946bd8faf, ai.spawner)) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x1c>" + ai getentitynumber() + "<dev string:x1ae>");
                    print3d(ai.origin + (0, 0, 50), "<dev string:x1c>" + ai getentitynumber() + "<dev string:x1ae>", (1, 0, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        if (isdefined(ai.spawner) && array_contains(var_fedb346f9b68ce66, ai.spawner)) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x20f>" + ai getentitynumber() + "<dev string:x21c>");
                    print3d(ai.origin + (0, 0, 50), "<dev string:x20f>" + ai getentitynumber() + "<dev string:x263>", (1, 0, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        if (ai namespace_f87a4b6569ce73b2::hasenemysightpos()) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x1c>" + ai getentitynumber() + "<dev string:x2ab>");
                    print3d(ai.origin + (0, 0, 50), "<dev string:x1c>" + ai getentitynumber() + "<dev string:x2ab>", (1, 0, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        if (ai scripts\anim\utility_common::recentlysawenemy()) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x2e2>" + ai getentitynumber() + "<dev string:x2ef>");
                    print3d(ai.origin + (0, 0, 50), "<dev string:x2e2>" + ai getentitynumber() + "<dev string:x2ef>", (0, 1, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        if (function_a002c4413d571f(ai.origin)) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x325>");
                    print3d(ai.origin + (0, 0, 50), "<dev string:x325>", (0, 1, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        if (ai function_14f781e51502cc47()) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x37f>" + ai getentitynumber() + "<dev string:x38c>");
                    print3d(ai.origin + (0, 0, 50), "<dev string:x37f>" + ai getentitynumber() + "<dev string:x38c>", (0, 1, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        if (!ai namespace_5729d24318b60bcd::killoff_vis_passed()) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x37f>" + ai getentitynumber() + "<dev string:x3cd>");
                    print3d(ai.origin + (0, 0, 50), "<dev string:x37f>" + ai getentitynumber() + "<dev string:x3cd>", (0, 1, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        if (function_70328e9769b9750f(ai.origin)) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x37f>" + ai getentitynumber() + "<dev string:x406>");
                    print3d(ai.origin + (0, 0, 50), "<dev string:x43e>", (0, 1, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        if (function_70328e9769b9750f(ai.origin + (0, 0, 50))) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x37f>" + ai getentitynumber() + "<dev string:x486>");
                    print3d(ai.origin + (0, 0, 50), "<dev string:x4cc>", (0, 1, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        /#
            if (function_34be418b2813a498()) {
                iprintlnbold("<dev string:x37f>" + ai getentitynumber() + "<dev string:x523>");
                print3d(ai.origin, "<dev string:x54a>", (0, 1, 1), 1, 1, 666);
                [[ level.func["<dev string:x68>"] ]](ai.origin, ai.angles, (1, 0, 0));
            }
        #/
        if (isdefined(ai.script_suspend)) {
            var_20e01991ca5e0385 = function_7bd38c394517ff87(ai, var_fd11088f77720495, var_20e01991ca5e0385);
            continue;
        }
        var_20e01991ca5e0385 = function_4cbe4ba6bc116f99(ai, var_fd11088f77720495, var_20e01991ca5e0385);
    }
    /#
        if (function_34be418b2813a498()) {
            iprintln("<dev string:x567>" + var_20e01991ca5e0385);
        }
    #/
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x36aa
// Size: 0x330
function function_98d19cc13a08f9e1(var_deb4666f1507fcfd, var_cc45c3ac6ec69fec) {
    level endon("game_ended");
    c = 0;
    var_854a7e665d4adab2 = function_f4117c23b5c99c0b(var_deb4666f1507fcfd);
    foreach (var_4e289de92961ab3d in var_deb4666f1507fcfd.var_9f9f230946bd8faf) {
        if (c > var_cc45c3ac6ec69fec) {
            break;
        }
        if (array_contains(var_854a7e665d4adab2, var_4e289de92961ab3d)) {
            continue;
        }
        var_a9237f88bd342861 = function_4b44dce2ffdbcc48(var_4e289de92961ab3d);
        var_5e8b303608f19b8c = var_a9237f88bd342861 + (0, 0, 50);
        if (getdvarint(@"hash_5f7c7350754fbff0", 0) != 0) {
            var_a9237f88bd342861 = var_5e8b303608f19b8c;
        }
        if (function_a002c4413d571f(var_a9237f88bd342861)) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x59c>");
                    print3d(var_a9237f88bd342861 + (0, 0, 50), "<dev string:x5f2>", (0, 1, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        if (function_d43bb847cab4433f(var_a9237f88bd342861)) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x64d>");
                    print3d(var_a9237f88bd342861 + (0, 0, 50), "<dev string:x64d>", (0, 1, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        if (function_70328e9769b9750f(var_a9237f88bd342861)) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x43e>");
                    print3d(var_a9237f88bd342861 + (0, 0, 50), "<dev string:x43e>", (0, 1, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        if (function_70328e9769b9750f(var_a9237f88bd342861 + (0, 0, 50))) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x6a9>");
                    print3d(var_a9237f88bd342861 + (0, 0, 50), "<dev string:x6ff>", (0, 1, 1), 1, 1, 2500);
                }
            #/
            continue;
        }
        var_11879c5af01a1cde = ter_op(isdefined(level.var_e9363e4bb08955e4), level.var_e9363e4bb08955e4, "region_spawning_test");
        var_f8e5e3aa5762a8e7 = namespace_5729d24318b60bcd::create_module_struct(var_11879c5af01a1cde);
        scripts\cp\cp_spawning_util::set_recent_spawn_time_threshold_override(var_f8e5e3aa5762a8e7, 1000);
        spawn_point = var_f8e5e3aa5762a8e7 namespace_74cdb67d92596cfe::score_ai_spawns([var_4e289de92961ab3d]);
        var_f8e5e3aa5762a8e7.position_ref = undefined;
        var_f8e5e3aa5762a8e7 namespace_74cdb67d92596cfe::print_spawner_score_for_factor(spawn_point);
        if (!isdefined(spawn_point)) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x754>");
                    print3d(var_a9237f88bd342861 + (0, 0, 50), "<dev string:x78e>", (0, 1, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        function_f9d54801507d21f1(var_f8e5e3aa5762a8e7, var_4e289de92961ab3d);
        c++;
    }
    if (c > 0) {
        /#
            if (function_34be418b2813a498()) {
                iprintln("<dev string:x7c9>" + var_cc45c3ac6ec69fec + "<dev string:x7e5>" + c);
            }
        #/
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39e2
// Size: 0xa5
function function_f4117c23b5c99c0b(var_deb4666f1507fcfd) {
    var_854a7e665d4adab2 = [];
    foreach (ai in getaiarray("axis")) {
        if (isdefined(ai.spawner) && array_contains(var_deb4666f1507fcfd.var_9f9f230946bd8faf, ai.spawner)) {
            var_854a7e665d4adab2 = array_add(var_854a7e665d4adab2, ai.spawner);
        }
    }
    return var_854a7e665d4adab2;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3a90
// Size: 0x1b6
function function_fee22980f1be9191(var_deb4666f1507fcfd, var_fedb346f9b68ce66) {
    var_fd1227d9f622aaa4 = 0;
    var_854a7e665d4adab2 = function_f4117c23b5c99c0b(var_deb4666f1507fcfd);
    foreach (var_4e289de92961ab3d in var_deb4666f1507fcfd.var_9f9f230946bd8faf) {
        if (array_contains(var_854a7e665d4adab2, var_4e289de92961ab3d)) {
            continue;
        }
        var_a9237f88bd342861 = function_4b44dce2ffdbcc48(var_4e289de92961ab3d);
        if (function_a002c4413d571f(var_a9237f88bd342861)) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x59c>");
                    print3d(var_a9237f88bd342861 + (0, 0, 50), "<dev string:x5f2>", (0, 1, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        if (function_d43bb847cab4433f(var_a9237f88bd342861)) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x64d>");
                    print3d(var_a9237f88bd342861 + (0, 0, 50), "<dev string:x64d>", (0, 1, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        if (function_70328e9769b9750f(var_a9237f88bd342861)) {
            /#
                if (function_34be418b2813a498()) {
                    iprintlnbold("<dev string:x43e>");
                    print3d(var_a9237f88bd342861 + (0, 0, 50), "<dev string:x43e>", (0, 1, 1), 1, 1, 666);
                }
            #/
            continue;
        }
        var_fd1227d9f622aaa4++;
    }
    if (var_fd1227d9f622aaa4 > 0) {
        /#
            if (function_34be418b2813a498()) {
                iprintln("<dev string:x807>" + var_fd1227d9f622aaa4);
            }
        #/
    }
    return var_fd1227d9f622aaa4;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c4f
// Size: 0x3f
function function_4b44dce2ffdbcc48(spawner) {
    if (isdefined(spawner.suspended_ai)) {
        return spawner.suspended_ai.origin;
    }
    return spawner.origin;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c96
// Size: 0xaa
function function_56a6214ab214d8b1(var_2fc2f07166ae0e33) {
    var_16ffa8d76cb46af1 = [];
    foreach (trigger in level.var_ceb9d44b40906c4a) {
        if (isdefined(var_2fc2f07166ae0e33) && isent(var_2fc2f07166ae0e33)) {
            continue;
        }
        if (isdefined(trigger.entstouching) && isarray(trigger.entstouching)) {
            if (function_5969df6a64608c4b(trigger)) {
                var_16ffa8d76cb46af1 = array_add(var_16ffa8d76cb46af1, trigger);
            }
        }
    }
    return var_16ffa8d76cb46af1;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d49
// Size: 0x86
function function_5969df6a64608c4b(trigger) {
    if (isdefined(trigger.entstouching) && isarray(trigger.entstouching)) {
        foreach (ent in trigger.entstouching) {
            if (isplayer(ent)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3dd8
// Size: 0x5b
function function_14f781e51502cc47() {
    foreach (player in level.players) {
        if (self seerecently(player, 5)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e3c
// Size: 0x8c
function function_a002c4413d571f(var_253f5c2c0b6125f6) {
    foreach (player in level.players) {
        if (distancesquared(player.origin, var_253f5c2c0b6125f6) < 2250000) {
            if (namespace_1fdb557af4bcd29e::function_70328e9769b9750f(var_253f5c2c0b6125f6)) {
                return true;
            }
            continue;
        }
        if (namespace_1fdb557af4bcd29e::function_70328e9769b9750f(var_253f5c2c0b6125f6)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ed1
// Size: 0x67
function function_d43bb847cab4433f(var_253f5c2c0b6125f6) {
    foreach (player in level.players) {
        if (player hastacvis(var_253f5c2c0b6125f6, 0, 64, 1)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f41
// Size: 0xb5
function function_70328e9769b9750f(var_253f5c2c0b6125f6) {
    contents = scripts\engine\trace::create_contents(1, 1, 1, 1, 1, 1, 1, 1, 1);
    foreach (player in level.players) {
        if (scripts\engine\trace::ray_trace_passed(player geteye(), var_253f5c2c0b6125f6, [player], contents)) {
            if (player within_fov(player geteye(), player getplayerangles(), var_253f5c2c0b6125f6, cos(120))) {
                return true;
            }
            return false;
        }
    }
    return false;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fff
// Size: 0x14
function function_5e1050e3208c8c06() {
    return getdvarint(@"hash_9804c42649d377c6", 0) == 1;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x401c
// Size: 0x14
function function_34be418b2813a498() {
    return getdvarint(@"hash_91f8d0a94101ee4", 0) == 1;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4039
// Size: 0xf3
function function_bac68a34c968c639(spawner, trigger) {
    if (!isdefined(trigger.var_9f9f230946bd8faf)) {
        trigger.var_9f9f230946bd8faf = [];
    }
    if (!array_contains(trigger.var_9f9f230946bd8faf, spawner)) {
        trigger.var_9f9f230946bd8faf = array_add(trigger.var_9f9f230946bd8faf, spawner);
        /#
            if (function_34be418b2813a498()) {
                [[ level.func["<dev string:x68>"] ]](spawner.origin, spawner.angles, (0, 1, 0));
            }
        #/
    } else {
        /#
            if (function_34be418b2813a498()) {
                iprintlnbold("<dev string:x824>");
                [[ level.func["<dev string:x68>"] ]](spawner.origin, spawner.angles, (0.5, 1, 0.5));
            }
        #/
    }
    return trigger;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4135
// Size: 0xd
function function_6b44ee764600d649() {
    self.script_suspend = 1;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x414a
// Size: 0x109
function prespawn_suspended_ai() {
    if (!isdefined(self.script_suspend)) {
        return undefined;
    }
    if (!isdefined(self.suspended_ai)) {
        return 0;
    }
    self.count++;
    if (!isdefined(self.og_spawner_origin)) {
        self.og_spawner_origin = self.origin;
    }
    if (!isdefined(self.og_spawner_angles)) {
        self.og_spawner_angles = self.angles;
    }
    if (isdefined(self.try_og_origin)) {
        self.origin = self.og_spawner_origin;
        self.angles = self.og_spawner_angles;
    } else {
        self.origin = self.suspended_ai.origin;
        self.angles = self.suspended_ai.angles;
    }
    if (isdefined(self.suspended_ai.suspendvars)) {
        self.suspendvars = self.suspended_ai.suspendvars;
    }
    return 1;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x425c
// Size: 0xb1
function postspawn_suspended_ai() {
    var_75cd41b6fd79c2a6 = self.spawner.suspended_ai;
    if (isdefined(self.spawner.postspawnresetorigin)) {
        self.spawner.origin = self.og_spawner_origin;
        self.spawner.angles = self.og_spawner_angles;
    }
    thread postspawn_suspend_ai_framedelay(var_75cd41b6fd79c2a6);
    if (!isdefined(var_75cd41b6fd79c2a6.suspendvars)) {
        return;
    }
    self.suspendvars = var_75cd41b6fd79c2a6.suspendvars;
    self.spawner.suspended_ai = undefined;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4315
// Size: 0x11f
function postspawn_suspend_ai_framedelay(var_75cd41b6fd79c2a6) {
    waittillframeend();
    waittillframeend();
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(var_75cd41b6fd79c2a6.stealth)) {
        assertex(self.team == "axis", "postspawn_suspended_ai() currently does not support non AXIS AI");
        bsmstate = var_75cd41b6fd79c2a6.stealth.bsmstate;
        if (bsmstate > 1) {
            bsmstate = var_75cd41b6fd79c2a6.stealth.bsmstate - int((gettime() - var_75cd41b6fd79c2a6.suspendtime) / 10000);
            bsmstate = int(max(2, bsmstate));
        } else if (bsmstate > 0) {
            bsmstate = var_75cd41b6fd79c2a6.stealth.bsmstate - int((gettime() - var_75cd41b6fd79c2a6.suspendtime) / 5000);
            bsmstate = int(max(0, bsmstate));
        }
        state = int_to_stealth_state(bsmstate);
        scripts\stealth\enemy::bt_set_stealth_state(state, var_75cd41b6fd79c2a6.stealth.investigateevent);
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x443c
// Size: 0x5c
function int_to_stealth_state(num) {
    switch (num) {
    case 0:
        return "idle";
    case 1:
        return "investigate";
    case 2:
        return "hunt";
    case 3:
        return "combat";
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x44a0
// Size: 0x23
function function_7bd38c394517ff87(ai, trigger, var_20e01991ca5e0385) {
    return ai free_expendable(var_20e01991ca5e0385);
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x44cc
// Size: 0x26
function function_4cbe4ba6bc116f99(ai, trigger, var_20e01991ca5e0385) {
    ai kill();
    var_20e01991ca5e0385++;
    return var_20e01991ca5e0385;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x44fb
// Size: 0x1f0
function free_expendable(var_20e01991ca5e0385) {
    if (!isdefined(self.spawner) || !isdefined(self.script_suspend)) {
        return var_20e01991ca5e0385;
    }
    spawner = self.spawner;
    struct = spawnstruct();
    struct.origin = self.origin;
    struct.angles = self.angles;
    struct.suspendtime = gettime();
    if (isdefined(self.suspendvars)) {
        struct.suspendvars = self.suspendvars;
    } else {
        struct.suspendvars = spawnstruct();
    }
    if (isdefined(self.stealth)) {
        struct.stealth = spawnstruct();
        struct.stealth_enabled = 1;
        struct.stealth.bsmstate = self.var_fe5ebefa740c7106;
        struct.stealth.investigateevent = scripts\aitypes\stealth::function_9c4a08f7dcd2796b();
    }
    if (isdefined(self.node)) {
        if (isdefined(self.using_goto_node)) {
            if (isdefined(self.node.targetname)) {
                struct.target = self.node.targetname;
            }
            struct.node = self.node;
        }
        struct.target = self.node.targetname;
    }
    spawner.suspended_ai = struct;
    if (isdefined(self.script_suspend_group) && !isdefined(self.script_free)) {
        var_20e01991ca5e0385 = free_groupname(self.script_suspend_group, var_20e01991ca5e0385);
    }
    /#
        spawner thread function_1ef621491ffaeede();
    #/
    return var_20e01991ca5e0385;
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x46f4
// Size: 0x387
function free_groupname(groupname, var_20e01991ca5e0385) {
    if (!isdefined(level.processfreegroupname)) {
        level.processfreegroupname = [];
    }
    if (isdefined(level.processfreegroupname[groupname])) {
        return var_20e01991ca5e0385;
    }
    level.processfreegroupname[groupname] = 1;
    aiarray = getaiarray("axis");
    if (function_34be418b2813a498()) {
        println("<dev string:x870>" + groupname);
        iprintlnbold("^2groupname Processing - ^1" + groupname);
    }
    foreach (ai in aiarray) {
        if (!isdefined(ai.script_suspend_group)) {
            if (function_34be418b2813a498()) {
                println("<dev string:x88c>" + groupname + "<dev string:x8ae>");
                iprintlnbold("^2skipped Group Processing for ^1" + groupname + "^2 due to ^1 NO .script_suspend_group ^2var defined");
                /#
                    line(ai.origin, ai.origin + (0, 0, 1000), (0, 1, 0), 1, 0, 666);
                #/
            }
            continue;
        }
        if (ai.script_suspend_group != groupname) {
            if (function_34be418b2813a498()) {
                /#
                    println("<dev string:x88c>" + groupname);
                    if (isdefined(ai.script_suspend)) {
                        println("<dev string:x8e2>" + ai.script_suspend_group + "<dev string:x907>" + ai.script_suspend);
                    } else {
                        println("<dev string:x8e2>" + ai.script_suspend_group + "<dev string:x91d>");
                    }
                #/
                if (isdefined(ai.script_suspend)) {
                    iprintlnbold("^5ai vars:  script_suspend_group: ^1" + ai.script_suspend_group + "^5 script_suspend: ^1" + ai.script_suspend);
                } else {
                    iprintlnbold("^5ai vars:  script_suspend_group: ^1" + ai.script_suspend_group + "^5 script_suspend: NOT DEFINED");
                }
                /#
                    line(ai.origin, ai.origin + (0, 0, 1000), (0, 0, 1), 1, 0, 666);
                #/
            }
            continue;
        }
        ai.script_free = 1;
        var_20e01991ca5e0385 = ai free_expendable(var_20e01991ca5e0385);
        if (function_34be418b2813a498()) {
            /#
                println("<dev string:x93c>" + groupname + "<dev string:x950>" + ai.origin);
                println("<dev string:x8e2>" + ai.script_suspend_group + "<dev string:x907>" + ai.script_suspend);
            #/
            iprintlnbold("^2free_groupname ^1" + groupname + "^2 origin: ^1" + ai.origin);
            iprintlnbold("^5ai vars:  script_suspend_group: ^1" + ai.script_suspend_group + "^5 script_suspend: ^1" + ai.script_suspend);
            /#
                line(ai.origin, ai.origin + (0, 0, 1000), (1, 0, 0), 1, 0, 666);
            #/
        }
        ai.nocorpse = 1;
        function_983add621b34ed28(ai, 1);
        ai kill();
        var_20e01991ca5e0385++;
    }
    level.processfreegroupname[groupname] = undefined;
    return var_20e01991ca5e0385;
}

/#

    // Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4a84
    // Size: 0xaa
    function function_1ef621491ffaeede(spawner) {
        self endon("<dev string:x95e>");
        if (!isdefined(level.func)) {
            return;
        }
        if (!isdefined(level.func["<dev string:x68>"])) {
            return;
        }
        while (true) {
            waitframe();
            if (!isdefined(self.suspended_ai)) {
                return;
            }
            if (getdvarint(@"hash_91f8d0a94101ee4", 0) == 0) {
                continue;
            }
            [[ level.func["<dev string:x68>"] ]](self.suspended_ai.origin, self.suspended_ai.angles, (1, 0.5, 0.25));
        }
    }

#/

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b36
// Size: 0x400
function stealth_event_propagator() {
    level notify("stealth_event_propagator");
    level endon("stealth_event_propagator");
    flag_wait("stealth_enabled");
    level endon("stealth_enabled");
    var_4a56f39b88ab0b5d["gunshot"] = function_9d30fd63965bafa9("gunshot");
    var_4a56f39b88ab0b5d["gunshot_teammate"] = function_9d30fd63965bafa9("gunshot_teammate");
    var_4a56f39b88ab0b5d["explosion"] = function_9d30fd63965bafa9("explosion");
    var_4a56f39b88ab0b5d["glass_destroyed"] = function_9d30fd63965bafa9("glass_destroyed");
    var_4a56f39b88ab0b5d["light_killed"] = 800;
    var_4a56f39b88ab0b5d["bulletwhizby"] = 3000;
    spawners = [];
    foreach (area in level.var_ceb9d44b40906c4a) {
        if (isdefined(area.var_9f9f230946bd8faf)) {
            foreach (spawner in area.var_9f9f230946bd8faf) {
                if (!isdefined(spawner)) {
                    continue;
                }
                if (is_equal(spawner.script_noteworthy, "interrogator")) {
                    continue;
                }
                if (is_equal(spawner.script_noteworthy, "escalation_patroller")) {
                    continue;
                }
                if (isendstr(spawner.targetname, "ambush_spawner")) {
                    continue;
                }
                if (is_equal(spawner.script_noteworthy, "extra_patrol")) {
                    spawner.dont_propagate_events_prespawn = 1;
                }
                if (isendstr(spawner.targetname, "backup_spawner")) {
                    spawner.dont_propagate_events_prespawn = 1;
                }
                spawners[spawners.size] = spawner;
            }
        }
    }
    var_90940f1c797b8d16 = [];
    var_81e55cd489351a8e = -10000;
    while (true) {
        level waittill("stealth_event", event, receiver);
        if (!array_contains_key(var_4a56f39b88ab0b5d, event.typeorig)) {
            continue;
        }
        if (time_has_passed(var_81e55cd489351a8e, 10)) {
            var_90940f1c797b8d16 = [];
        } else {
            duplicate = 0;
            foreach (e in var_90940f1c797b8d16) {
                if (e.typeorig == event.typeorig && e.origin == event.origin) {
                    duplicate = 1;
                    break;
                }
            }
            if (duplicate) {
                /#
                    if (getdvarint(@"hash_91f8d0a94101ee4")) {
                        iprintlnbold("<dev string:x964>" + event.typeorig + "<dev string:x97a>" + receiver getentitynumber() + "<dev string:x98a>");
                    }
                #/
                continue;
            }
        }
        var_90940f1c797b8d16[var_90940f1c797b8d16.size] = event;
        var_81e55cd489351a8e = gettime();
        var_5df9d19e5429b0c1 = spawnstruct();
        var_5df9d19e5429b0c1.typeorig = event.typeorig;
        var_5df9d19e5429b0c1.entity = event.entity;
        var_5df9d19e5429b0c1.origin = event.origin;
        var_5df9d19e5429b0c1.receiver = event.receiver;
        var_5df9d19e5429b0c1.type = scripts\stealth\event::event_severity_get(event.typeorig);
        var_5df9d19e5429b0c1.investigate_pos = event.investigate_pos;
        spawners = array_removeundefined(spawners);
        spawners = sortbydistance(spawners, event.origin);
        childthread propagate_event_thread(var_5df9d19e5429b0c1, var_4a56f39b88ab0b5d, spawners);
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4f3e
// Size: 0x413
function propagate_event_thread(event, var_4a56f39b88ab0b5d, spawners) {
    foreach (spawner in spawners) {
        if (!isdefined(spawner)) {
            continue;
        }
        if (distancesquared(spawner.origin, event.origin) > var_4a56f39b88ab0b5d[event.typeorig] * var_4a56f39b88ab0b5d[event.typeorig]) {
            break;
        }
        if (is_equal(spawner.script_noteworthy, "lone_patroller") && flag(spawner.script_stealthgroup + "_spawned")) {
            continue;
        }
        if (!isdefined(spawner.suspended_ai)) {
            if (istrue(spawner.dont_propagate_events_prespawn)) {
                continue;
            }
        }
        if (event.typeorig == "light_killed" && distancesquared(spawner.origin, event.origin) > 160000) {
            waitframe();
            if (!isdefined(spawner)) {
                continue;
            }
            if (!sighttracepassed(spawner.origin + (0, 0, 60), event.origin, 0, event.entity)) {
                continue;
            }
        }
        guy = undefined;
        if (isdefined(guy)) {
            /#
                if (getdvarint(@"hash_91f8d0a94101ee4")) {
                    iprintlnbold("<dev string:x98d>" + guy getentitynumber() + "<dev string:x993>" + event.typeorig + "<dev string:x98a>");
                }
            #/
            guy aieventlistenerevent(event.typeorig, event.entity, event.origin);
            continue;
        }
        if (isdefined(spawner.suspended_ai)) {
            /#
                if (getdvarint(@"hash_91f8d0a94101ee4")) {
                    iprintlnbold("<dev string:x9a7>" + spawner.origin + "<dev string:x9d1>" + event.typeorig + "<dev string:x98a>");
                }
            #/
            if (event.type == "combat") {
                spawner.suspended_ai.stealth.bsmstate = 3;
            } else {
                spawner.suspended_ai.stealth.bsmstate = max(1, spawner.suspended_ai.stealth.bsmstate);
                spawner.suspended_ai scripts\aitypes\stealth::function_6bdcfa57946930c7(event);
            }
            continue;
        }
        /#
            if (getdvarint(@"hash_91f8d0a94101ee4")) {
                iprintlnbold("<dev string:x9dd>" + spawner.origin + "<dev string:x9d1>" + event.typeorig + "<dev string:x98a>");
            }
        #/
        struct = spawnstruct();
        struct.origin = spawner.origin;
        struct.angles = spawner.angles;
        struct.suspendtime = gettime();
        struct.stealth = spawnstruct();
        struct.stealth_enabled = 1;
        if (event.type == "combat") {
            struct.stealth.bsmstate = 3;
        } else {
            struct.stealth.bsmstate = 1;
            struct.stealth.investigateevent = event;
        }
        struct.suspendvars = spawnstruct();
        spawner.suspended_ai = struct;
        spawner.count = 0;
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5359
// Size: 0x220
function function_f9d54801507d21f1(var_f8e5e3aa5762a8e7, spawnpoint, var_8cb6ec14c2f6392d, var_abb7bdd43400a0c7, spawn_parameter_array, var_3a308e048fa5cec7) {
    spec = undefined;
    var_536d11c1d37833b7 = undefined;
    var_db52fa830038a9 = undefined;
    var_abb7bdd43400a0c7 = undefined;
    if (isdefined(spawnpoint.pos_override_struct)) {
        var_536d11c1d37833b7 = spawnpoint.pos_override_struct.origin;
        var_db52fa830038a9 = spawnpoint.pos_override_struct.angles;
    } else if (isdefined(spawnpoint.vehicle_position)) {
        var_536d11c1d37833b7 = spawnpoint.origin;
        var_db52fa830038a9 = spawnpoint.angles;
    }
    if (isdefined(spawnpoint.specs)) {
        if (!isarray(spawnpoint.specs)) {
            spawnpoint.specs = [spawnpoint.specs];
        }
        var_abb7bdd43400a0c7 = random(spawnpoint.specs);
        spec = var_abb7bdd43400a0c7;
    }
    var_7208fc96ea182f6 = 0;
    if (!isdefined(spawnpoint.count)) {
        spawnpoint.count = 1;
    }
    if (isdefined(spawnpoint.script_suspend)) {
        var_7208fc96ea182f6 = spawnpoint namespace_1fdb557af4bcd29e::prespawn_suspended_ai();
        if (spawnpoint.count == 0 && !var_7208fc96ea182f6) {
            return undefined;
        }
    }
    soldier = spawnpoint namespace_5729d24318b60bcd::spawn_ai(var_536d11c1d37833b7, var_db52fa830038a9, var_abb7bdd43400a0c7, var_f8e5e3aa5762a8e7);
    if (isdefined(soldier)) {
        soldier.suspended_ai = spawnpoint.suspended_ai;
        soldier.script_suspend = spawnpoint.script_suspend;
        soldier.script_suspend_group = spawnpoint.script_suspend_group;
        soldier.spawner = spawnpoint;
        spawnpoint notify("spawn_success", spawnpoint);
        level notify("spawned_group_soldier", soldier);
        level notify("ai_spawn_successful", soldier, spawnpoint, spawnpoint.origin, var_f8e5e3aa5762a8e7);
        return namespace_5729d24318b60bcd::run_ai_post_spawn_init(var_f8e5e3aa5762a8e7, soldier, spawnpoint, spawn_parameter_array, spec, var_8cb6ec14c2f6392d, var_3a308e048fa5cec7);
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5581
// Size: 0x3d9
function function_192f8a34d0ae130f(ai_array, leaders) {
    if (!isdefined(level.var_b8071e682932b403)) {
        level.var_b8071e682932b403 = [];
    }
    leader = random(ai_array);
    /#
        if (getdvarint(@"hash_4fa5a6d9e7fb5284", 0) > 0) {
            leader hudoutlineenable("<dev string:xa07>");
        }
    #/
    if (isdefined(leaders)) {
        if (isarray(leaders)) {
            leader = random(leaders);
        } else {
            leader = leaders;
        }
    }
    level.var_b8071e682932b403[leader.enemy_group] = leader;
    while (true) {
        alive = 0;
        foreach (ai in ai_array) {
            if (!isalive(ai) || ai.health < 1) {
                continue;
            }
            alive = 1;
        }
        if (!alive) {
            return;
        }
        if (isdefined(leader) && isalive(leader)) {
            foreach (ai in ai_array) {
                if (!isdefined(ai)) {
                    continue;
                }
                if (ai == leader) {
                    continue;
                }
                if (!isalive(ai) || ai.health < 1) {
                    continue;
                }
                if (!isdefined(ai.goalent) || ai.goalent != leader) {
                    if (getdvar(@"hash_4fa5a6d9e7fb5284") != "") {
                        ai hudoutlineenable("outline_nodepth_white");
                    }
                    ai setgoalentity(leader);
                    ai.goalent = leader;
                }
                var_4666c0e35742bc07 = 0;
                foreach (player in level.players) {
                    if (distance2dsquared(leader.origin, player.origin) < squared(leader.goalradius)) {
                        var_4666c0e35742bc07 = 1;
                    }
                }
                if (var_4666c0e35742bc07 || distance2dsquared(leader.origin, ai.origin) < squared(ai.goalradius)) {
                    if (distance2dsquared(leader.origin, ai.origin) < squared(ai.goalradius)) {
                        ai setcoverselectionfocusent(leader);
                    }
                }
            }
        } else {
            ai_array = array_removeundefined(ai_array);
            if (ai_array.size == 0) {
                return;
            }
            leader = random(ai_array);
            if (isdefined(leaders)) {
                alive = 0;
                foreach (guy in leaders) {
                    if (!isalive(guy) || guy.health < 1) {
                        continue;
                    }
                    alive = 1;
                }
                if (alive) {
                    if (isarray(leaders)) {
                        leader = random(leaders);
                    } else {
                        leader = leaders;
                    }
                    level.var_b8071e682932b403[leader.enemy_group] = leader;
                }
            }
            if (getdvar(@"hash_4fa5a6d9e7fb5284") != "") {
                leader hudoutlineenable("outline_nodepth_green");
            }
        }
        wait 1;
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5962
// Size: 0x142
function function_9c0fbe62c1b9d660() {
    self endon("death");
    self endon("stop_hunting");
    player = random(level.players);
    while (true) {
        if (!isdefined(player) || istrue(player.inlaststand)) {
            selected = 0;
            foreach (new_player in level.players) {
                if (istrue(new_player.inlaststand)) {
                    continue;
                }
                player = new_player;
                selected = 1;
            }
            if (!selected) {
                wait 3;
                player = undefined;
                continue;
            }
        }
        foreach (player_ent in level.players) {
            self getenemyinfo(player_ent);
        }
        org = player.origin;
        self setgoalpos(player.origin);
        wait 3;
    }
}

// Namespace namespace_d1ef96d1d9fa6257 / namespace_1fdb557af4bcd29e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5aac
// Size: 0x21
function function_48ea085692abdacf(var_f8e5e3aa5762a8e7) {
    var_d46124083728196a = var_f8e5e3aa5762a8e7.group_name;
}

